#!/usr/bin/env python3
"""Lossless text representation of N-SPC style song data (track blobs and the SFX block).

    bytes -> text : disassemble(data, ...)            text -> bytes : assemble(text, ...)

Both directions are byte exact (every byte not covered by the structures below becomes a `db` directive), so a track
source rebuilds the original blob.  Pointers are written as labels and re-computed when the text is assembled, which
is what makes the sources editable (insert a note, the following pointers move with it).

Track blob layout (see docs/audio.md section 8): song list words -> patterns (8 voice pointers) -> voice streams.
SFX block layout (section 9): 50 stream pointers (absolute SPC addresses, base $1600) followed by the streams.

Text syntax (one directive or several stream tokens per line, `;` starts a comment, `name:` defines a label):

  song list     pattern <label>            word: pointer to a pattern
                jump <label> <count>       word $80cc + pointer: jump to <label>, <count> times ($80+ = forever)
                songend                    word $8000
  pattern       voices <l0> ... <l7>       eight voice-stream pointers, `-` = voice unused (0)
  SFX table     ptr <label>                one little-endian pointer word
  raw           db $xx $yy ...   dw $xxxx  unknown/unreferenced bytes kept as they are
  stream        L<n>[:G<g>V<v>]            note length in ticks (+ optional gate 0-7 / velocity 0-15 byte)
                C1 .. B6, C#4 ...          note (byte $80 + semitone; C1 = $80)       tie / rest
                perc<n>                    percussion note $CA+n (n = 0-21)
                <command> <params>         $E0-$FA commands, see COMMANDS; call <label> <count>
                end                        $00 stream terminator
"""
import re

NOTE_NAMES = ["C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"]
#: $E0-$FA stream commands: (name, parameter count)
COMMANDS = {
    0xE0: ("instrument", 1), 0xE1: ("pan", 1), 0xE2: ("panfade", 2), 0xE3: ("vibrato", 3), 0xE4: ("vibratooff", 0),
    0xE5: ("mastervol", 1), 0xE6: ("mastervolfade", 2), 0xE7: ("tempo", 1), 0xE8: ("tempofade", 2),
    0xE9: ("transpose", 1), 0xEA: ("voicetranspose", 1), 0xEB: ("tremolo", 3), 0xEC: ("tremolooff", 0),
    0xED: ("volume", 1), 0xEE: ("volumefade", 2), 0xEF: ("call", 3), 0xF0: ("vibratofade", 1),
    0xF1: ("pitchenvto", 3), 0xF2: ("pitchenvfrom", 3), 0xF3: ("pitchenvoff", 0), 0xF4: ("finetune", 1),
    0xF5: ("echo", 3), 0xF6: ("echooff", 0), 0xF7: ("echoparams", 3), 0xF8: ("echofade", 3), 0xF9: ("slide", 3),
    0xFA: ("percbase", 1),
}
CMD_BY_NAME = {v[0]: (k, v[1]) for k, v in COMMANDS.items()}
NOISE = 0xDF          # SFX streams only: one parameter byte


class FormatError(Exception):
    pass


def note_name(b):
    p = b - 0x80
    return "%s%d" % (NOTE_NAMES[p % 12], p // 12 + 1)


_NOTE_RE = re.compile(r"^([A-G]#?)(\d)$")


def note_byte(tok):
    m = _NOTE_RE.match(tok)
    if not m:
        return None
    p = NOTE_NAMES.index(m.group(1)) + 12 * (int(m.group(2)) - 1)
    return 0x80 + p if 0 <= p <= 0x47 else None


def _w(d, a):
    return d[a] | (d[a + 1] << 8)


# ---------------------------------------------------------------------------
# bytes -> atoms
# ---------------------------------------------------------------------------
class Atom:
    """One assembled element: `off`/`size` in the blob, `kind`, payload, optional pointer target."""
    __slots__ = ("off", "size", "kind", "text", "ptr", "role")

    def __init__(self, off, size, kind, text, ptr=None, role=None):
        self.off, self.size, self.kind, self.text, self.ptr, self.role = off, size, kind, text, ptr, role


def _stream_atoms(d, pos, n, base, sfx, claim, subs):
    """Decode one stream starting at pos until its $00 terminator.  Returns the atoms."""
    atoms = []
    while True:
        if pos >= n:
            raise FormatError("stream runs off the data at %04X" % pos)
        b = d[pos]
        if b == 0:
            atoms.append(Atom(pos, 1, "tok", "end")); pos += 1
            break
        if b < 0x80:
            if pos + 1 < n and d[pos + 1] < 0x80:
                g = d[pos + 1]
                if g & 0x80:
                    raise FormatError("bad gate byte")
                atoms.append(Atom(pos, 2, "tok", "L%d:G%dV%d" % (b, g >> 4, g & 15))); pos += 2
            else:
                atoms.append(Atom(pos, 1, "tok", "L%d" % b)); pos += 1
            continue
        if b < 0xC8:
            atoms.append(Atom(pos, 1, "tok", note_name(b))); pos += 1
            continue
        if b == 0xC8:
            atoms.append(Atom(pos, 1, "tok", "tie")); pos += 1
            continue
        if b == 0xC9:
            atoms.append(Atom(pos, 1, "tok", "rest")); pos += 1
            continue
        if b < 0xE0:
            if sfx and b == NOISE:
                if pos + 1 >= n:
                    raise FormatError("noise operand outside data")
                atoms.append(Atom(pos, 2, "tok", "noise $%02X" % d[pos + 1])); pos += 2
            else:
                atoms.append(Atom(pos, 1, "tok", "perc%d" % (b - 0xCA))); pos += 1
            continue
        if b > 0xFA:
            raise FormatError("invalid stream byte %02X at %04X" % (b, pos))
        name, cnt = COMMANDS[b]
        if pos + 1 + cnt > n:
            raise FormatError("command operands outside data at %04X" % pos)
        ops = d[pos + 1:pos + 1 + cnt]
        if b == 0xEF:
            tgt = _w(d, pos + 1) - base
            subs.append(tgt)
            atoms.append(Atom(pos, 4, "tok", "call", ptr=tgt, role="sub"))
            atoms[-1].text = ("call", ops[2])
        else:
            atoms.append(Atom(pos, 1 + cnt, "tok", " ".join([name] + ["$%02X" % x for x in ops])))
        pos += 1 + cnt
    return atoms, pos


def disassemble(data, kind="track", base=0, sfx_count=50):
    """-> (atoms sorted by offset covering the whole blob, labels {offset: name})."""
    d = bytes(data)
    n = len(d)
    sfx = kind == "sfx"
    atoms = {}
    roles = {}            # offset -> role string
    pending_streams = []
    subs = []

    def put(a):
        if a.off in atoms:
            return
        atoms[a.off] = a

    def claim_check():
        occupied = {}
        for a in sorted(atoms.values(), key=lambda x: x.off):
            for i in range(a.off, a.off + a.size):
                if i in occupied:
                    raise FormatError("overlapping items at %04X (%s vs %s)" % (i, occupied[i], a.text))
                occupied[i] = a.text
        return occupied

    if sfx:
        for i in range(sfx_count):
            ptr = _w(d, 2 * i) - base
            put(Atom(2 * i, 2, "ptr", "ptr", ptr=ptr, role="sfx%d" % i))
            roles.setdefault(ptr, "sfx%d" % i)
            pending_streams.append(ptr)
    else:
        seen = set()
        work = [0]
        pat = []
        while work:
            pos = work.pop()
            while pos not in seen:
                seen.add(pos)
                if pos + 2 > n:
                    raise FormatError("song list runs off the data")
                v = _w(d, pos)
                if v & 0x8000:
                    cnt = v & 0xFF
                    if v & 0x7F00:
                        put(Atom(pos, 2, "dw", "dw $%04X" % v)); break
                    if cnt == 0:
                        put(Atom(pos, 2, "songend", "songend")); break
                    tgt = _w(d, pos + 2)
                    put(Atom(pos, 4, "jump", ("jump", cnt), ptr=tgt, role="loop"))
                    roles.setdefault(tgt, "loop")
                    work.append(tgt)
                    pos += 4
                else:
                    put(Atom(pos, 2, "pattern", "pattern", ptr=v, role="pat"))
                    if v not in pat:
                        pat.append(v)
                    roles.setdefault(v, "pat")
                    pos += 2
        for k, pp in enumerate(pat):
            ptrs = [_w(d, pp + 2 * i) for i in range(8)]
            put(Atom(pp, 16, "voices", "voices", ptr=ptrs, role="pat%d" % k))
            roles[pp] = "pat%d" % k
            for i, x in enumerate(ptrs):
                if x:
                    roles.setdefault(x, "pat%d_v%d" % (k, i))
                    pending_streams.append(x)
    done = set()
    while pending_streams or subs:
        s = pending_streams.pop(0) if pending_streams else subs.pop(0)
        if s in done:
            continue
        done.add(s)
        if s - 0 >= n or s < 0:
            raise FormatError("stream pointer %04X outside the blob" % s)
        if s not in roles:
            roles[s] = "sub"
        sub_before = len(subs)
        atoms_s, _ = _stream_atoms(d, s, n, base, sfx, None, subs)
        for t in subs[sub_before:]:
            roles.setdefault(t, "sub")
        for a in atoms_s:
            if a.off in atoms and atoms[a.off].size == a.size and atoms[a.off].text == a.text:
                break                      # merged into an already decoded stream (shared tail)
            put(a)
    occupied = claim_check()
    # raw filler for every uncovered byte
    i = 0
    while i < n:
        if i in occupied:
            i += 1
            continue
        j = i
        while j < n and j not in occupied and j - i < 16:
            j += 1
        put(Atom(i, j - i, "db", "db " + " ".join("$%02X" % x for x in d[i:j])))
        i = j
    out = sorted(atoms.values(), key=lambda a: a.off)
    # every pointer must hit an atom boundary, else it stays numeric
    starts = {a.off for a in out}
    return out, roles, starts


# ---------------------------------------------------------------------------
# atoms -> text
# ---------------------------------------------------------------------------
def _label_names(roles, starts, kind):
    names = {}
    counters = {}
    for off in sorted(roles):
        if off not in starts:
            continue
        role = roles[off]
        if off == 0 and kind == "track":
            names[off] = "songlist"
            continue
        if role == "loop":
            k = counters.get("loop", 0); counters["loop"] = k + 1
            names[off] = "loop%d" % k
        elif role == "sub":
            k = counters.get("sub", 0); counters["sub"] = k + 1
            names[off] = "sub%d" % k
        elif role.startswith("sfx"):
            names[off] = "sfx_%02d" % int(role[3:])
        else:
            names[off] = role
    # a stream label may collide with a role used twice (same offset): first wins, unique per offset already
    return names


def render(atoms, roles, starts, header, kind="track", base=0):
    names = _label_names(roles, starts, kind)

    def ref(v):
        o = v - base if kind == "sfx" else v
        return names.get(o) if (o in names) else "$%04X" % v

    lines = list(header)
    cur_tokens = []
    cur_t = [0]
    state = {"len": 0, "t": 0}

    def flush(tok_t):
        if cur_tokens:
            has_note = any(note_byte(t.split()[0]) is not None or t in ("tie", "rest") for t in cur_tokens)
            lines.append("    " + " ".join(cur_tokens) + ("    ; t=%d" % tok_t if tok_t is not None and has_note else ""))
            cur_tokens.clear()

    line_t = None
    prev_stream = False
    for a in atoms:
        if a.off in names:
            flush(line_t)
            if lines and lines[-1] != "":
                lines.append("")
            lines.append(names[a.off] + ":")
            state["t"] = 0
            state["len"] = 0
        if a.kind == "tok":
            text = a.text
            if isinstance(text, tuple):                       # call
                text = "call %s %d" % (ref(a.ptr + (base if kind == "sfx" else 0)), text[1])
            is_cmd = text.split()[0] in CMD_BY_NAME or text.startswith("noise") or text == "end"
            prev_cmd = bool(cur_tokens) and cur_tokens[-1].split()[0] in CMD_BY_NAME
            if cur_tokens and (is_cmd and not text.startswith("end") or prev_cmd or len(" ".join(cur_tokens)) + len(text) > 88):
                flush(line_t)
            if not cur_tokens:
                line_t = state["t"]
            cur_tokens.append(text)
            if text == "end":
                flush(line_t)
            first = text.split()[0]
            if first == "call":
                state["t"] = None                     # the length of a subroutine is not tracked
            if first[0] == "L" and first[1:2].isdigit():
                state["len"] = int(re.match(r"L(\d+)", first).group(1))
            elif state["t"] is not None and (note_byte(first) is not None or first in ("tie", "rest") or re.match(r"perc\d+$", first)):
                state["t"] += state["len"]
            continue
        flush(line_t)
        if a.kind == "pattern":
            lines.append("    pattern " + ref(a.ptr))
        elif a.kind == "jump":
            lines.append("    jump %s %d" % (ref(a.ptr), a.text[1]))
        elif a.kind == "songend":
            lines.append("    songend")
        elif a.kind == "voices":
            lines.append("    voices " + " ".join(ref(x) if x else "-" for x in a.ptr))
        elif a.kind == "ptr":
            lines.append("    ptr " + ref(a.ptr + (base if kind == "sfx" else 0)))
        else:
            lines.append("    " + a.text)
    flush(line_t)
    return "\n".join(lines) + "\n"


def to_text(data, header_comment, kind="track", base=0):
    atoms, roles, starts = disassemble(data, kind, base)
    # fix sfx pointer offsets: roles/starts are offsets within the block
    hdr = ["; " + h for h in header_comment]
    hdr.append("")
    return render(atoms, roles, starts, hdr, kind, base)


# ---------------------------------------------------------------------------
# text -> bytes
# ---------------------------------------------------------------------------
def _num(tok, what="number"):
    try:
        return int(tok[1:], 16) if tok.startswith("$") else int(tok, 0)
    except ValueError:
        raise FormatError("bad %s: %r" % (what, tok))


def assemble(text, kind="track", base=0, size=None):
    """Text -> bytes.  Two passes: sizes/labels, then emission."""
    sfx = kind == "sfx"
    items = []            # (lineno, labelname_or_None, op, args)
    for ln, raw in enumerate(text.splitlines(), 1):
        line = raw.split(";", 1)[0].strip()
        if not line:
            continue
        toks = line.split()
        while toks and toks[0].endswith(":"):
            items.append((ln, toks[0][:-1], None, None))
            toks = toks[1:]
        i = 0
        while i < len(toks):
            t = toks[i]
            op = t
            if t in ("pattern", "ptr"):
                items.append((ln, None, t, [toks[i + 1]])); i += 2
            elif t == "jump":
                items.append((ln, None, t, toks[i + 1:i + 3])); i += 3
            elif t == "songend":
                items.append((ln, None, t, [])); i += 1
            elif t == "voices":
                items.append((ln, None, t, toks[i + 1:i + 9])); i += 9
            elif t == "dw":
                items.append((ln, None, t, [toks[i + 1]])); i += 2
            elif t == "db":
                items.append((ln, None, t, toks[i + 1:])); i = len(toks)
            elif t == "end":
                items.append((ln, None, "end", [])); i += 1
            elif t == "noise":
                items.append((ln, None, "noise", [toks[i + 1]])); i += 2
            elif t == "call":
                items.append((ln, None, "call", toks[i + 1:i + 3])); i += 3
            elif t in CMD_BY_NAME:
                cnt = CMD_BY_NAME[t][1]
                items.append((ln, None, t, toks[i + 1:i + 1 + cnt])); i += 1 + cnt
            elif t in ("tie", "rest"):
                items.append((ln, None, t, [])); i += 1
            elif t.startswith("perc") and t[4:].isdigit():
                items.append((ln, None, "perc", [t[4:]])); i += 1
            elif re.match(r"^L\d+(:G\d+V\d+)?$", t):
                items.append((ln, None, "L", [t])); i += 1
            elif note_byte(t) is not None:
                items.append((ln, None, "note", [t])); i += 1
            else:
                raise FormatError("line %d: unknown token %r" % (ln, t))
    # pass 1: sizes and labels
    def size_of(op, args):
        if op in ("pattern", "ptr", "dw", "songend"):
            return 2
        if op == "jump":
            return 4
        if op == "voices":
            return 16
        if op == "db":
            return len(args)
        if op in ("end", "tie", "rest", "perc", "note"):
            return 1
        if op == "noise":
            return 2
        if op == "call":
            return 4
        if op == "L":
            return 2 if ":" in args[0] else 1
        return 1 + CMD_BY_NAME[op][1]
    labels = {}
    pos = 0
    for ln, lab, op, args in items:
        if lab is not None:
            if lab in labels:
                raise FormatError("line %d: duplicate label %s" % (ln, lab))
            labels[lab] = pos
        else:
            pos += size_of(op, args)
    total = pos

    def ptr(tok, ln):
        if tok in labels:
            return labels[tok] + (base if sfx else 0)
        try:
            return _num(tok, "pointer")
        except FormatError:
            raise FormatError("line %d: unknown label %r" % (ln, tok))

    out = bytearray()
    for ln, lab, op, args in items:
        if lab is not None:
            continue
        try:
            if op == "pattern":
                out += ptr(args[0], ln).to_bytes(2, "little")
            elif op == "ptr":
                out += ptr(args[0], ln).to_bytes(2, "little")
            elif op == "jump":
                cnt = _num(args[1])
                if not 1 <= cnt <= 255:
                    raise FormatError("jump count must be 1-255")
                out += (0x8000 | cnt).to_bytes(2, "little") + ptr(args[0], ln).to_bytes(2, "little")
            elif op == "songend":
                out += b"\x00\x80"
            elif op == "voices":
                if len(args) != 8:
                    raise FormatError("voices needs 8 operands")
                for a in args:
                    out += (0 if a == "-" else ptr(a, ln)).to_bytes(2, "little")
            elif op == "dw":
                out += _num(args[0]).to_bytes(2, "little")
            elif op == "db":
                out += bytes(_num(a) & 0xFF if 0 <= _num(a) <= 255 else _bad(a) for a in args)
            elif op == "end":
                out.append(0)
            elif op == "tie":
                out.append(0xC8)
            elif op == "rest":
                out.append(0xC9)
            elif op == "perc":
                k = int(args[0])
                if not 0 <= k <= 21:
                    raise FormatError("percussion index 0-21")
                out.append(0xCA + k)
            elif op == "noise":
                out += bytes([NOISE, _num(args[0])])
            elif op == "note":
                out.append(note_byte(args[0]))
            elif op == "L":
                m = re.match(r"^L(\d+)(?::G(\d+)V(\d+))?$", args[0])
                ln_ = int(m.group(1))
                if not 1 <= ln_ <= 127:
                    raise FormatError("note length 1-127")
                out.append(ln_)
                if m.group(2) is not None:
                    g, v = int(m.group(2)), int(m.group(3))
                    if g > 7 or v > 15:
                        raise FormatError("gate 0-7, velocity 0-15")
                    out.append(g << 4 | v)
            elif op == "call":
                out += bytes([0xEF]) + ptr(args[0], ln).to_bytes(2, "little") + bytes([_num(args[1]) & 0xFF])
            else:
                byte, cnt = CMD_BY_NAME[op]
                if len(args) != cnt:
                    raise FormatError("%s needs %d operand(s)" % (op, cnt))
                vals = [_num(a) for a in args]
                if any(not 0 <= v <= 255 for v in vals):
                    raise FormatError("operand out of range 0-255")
                out += bytes([byte] + vals)
        except (FormatError, IndexError, ValueError) as e:
            raise FormatError("line %d: %s" % (ln, e))
    assert len(out) == total
    if size is not None and len(out) != size:
        raise FormatError("assembled size %d != expected %d" % (len(out), size))
    return bytes(out)


def _bad(a):
    raise FormatError("db operand out of range: %s" % a)
