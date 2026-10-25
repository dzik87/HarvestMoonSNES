"""Source <-> ROM address map of the code modules in src/code/bank_80..85 (helper for the region tools).

Every source line gets a ROM address range [start, end) taken from the `;ADDR|BYTES|TARGET;` comments that
DiztinGUIsh left on instruction and data lines. Lines without a comment (labels, blank lines, `%macro(...)`
invocations) get the range between their neighbours. `pad` lines are treated as zero-length.
"""
import re
import sys
from pathlib import Path

from disasm65816 import _OPS, decode, lorom_off

ROOT = Path(__file__).resolve().parent.parent.parent
CODE_DIR = ROOT / "src" / "code"
MODULE_ORDER = [
    "bank_80/core.asm", "bank_80/palette.asm", "bank_80/routines.asm", "bank_80/tilemaps.asm",
    "bank_80/audio_data.asm", "bank_80/data_tables.asm",
    "bank_81/item_actions.asm", "bank_81/items_misc.asm", "bank_81/player_actions.asm", "bank_81/player_update.asm",
    "bank_82/game_events.asm", "bank_82/tools.asm", "bank_82/object_map.asm", "bank_82/sound.asm",
    "bank_82/object_data.asm", "bank_82/interaction_data.asm", "bank_82/main_loop.asm", "bank_82/system.asm",
    "bank_82/screen_text.asm", "bank_82/menu.asm",
    "bank_83/math.asm", "bank_83/random.asm", "bank_83/graphics.asm", "bank_83/audio.asm", "bank_83/dialog.asm",
    "bank_83/game_engine.asm", "bank_83/map_engine.asm",
    "bank_84/ai_engine.asm", "bank_84/input.asm",
    "bank_85/objects.asm",
]

_COMMENT = re.compile(r";([0-9A-F]{6})\|([0-9A-F]*)\s*\|([0-9A-F ]*);")
_LABEL_RE = re.compile(r"^(?P<name>[A-Za-z_.][A-Za-z0-9_.]*):\s*(;.*)?$")
_ANON_RE = re.compile(r"^\s*(?P<anon>[+\-]+)(\s+|$)")
_DATA_RE = re.compile(r"^\s*(db|dw|dl|dd)\s+(?P<rest>[^;]*)", re.I)
_DATA_SIZE = {"db": 1, "dw": 2, "dl": 3, "dd": 4}


class Line:
    __slots__ = ("file", "idx", "text", "kind", "start", "end", "label", "anon", "raw", "m", "x", "dlen", "ritems")

    def __init__(self, file, idx, text):
        self.file, self.idx, self.text = file, idx, text
        self.kind = "other"
        self.start = self.end = None
        self.label = None
        self.anon = None
        self.raw = None
        self.m = self.x = None
        self.dlen = None
        self.ritems = ()


def _data_len(m):
    size = _DATA_SIZE[m.group(1).lower()]
    rest = m.group("rest").strip()
    depth, n, cur = 0, 0, ""
    for ch in rest:
        if ch == "(":
            depth += 1
        elif ch == ")":
            depth -= 1
        if ch == "," and depth == 0:
            n += 1
        cur += ch
    return (n + 1) * size


def parse_module(rel):
    path = CODE_DIR / rel
    lines = []
    in_de = False   # inside the DE half of an `if !REGION_DE ... else ... endif` patch block
    for i, text in enumerate(path.read_text(encoding="utf-8").split("\n")):
        ln = Line(rel, i, text)
        s = text.strip()
        if s == "if !REGION_DE":
            in_de = True
            ln.kind = "directive"
            lines.append(ln)
            continue
        if in_de and s == "else":
            in_de = False
            ln.kind = "directive"
            lines.append(ln)
            continue
        if s == "endif":
            ln.kind = "directive"
            lines.append(ln)
            continue
        if in_de:
            ln.kind = "skip"
            lines.append(ln)
            continue
        code = text.split(";")[0].rstrip() if not text.lstrip().startswith(";") else ""
        cm = _COMMENT.search(text)
        lm = _LABEL_RE.match(s) if s and not s.startswith(";") else None
        am = _ANON_RE.match(text)
        dm = _DATA_RE.match(re.sub(r"^\s*[+\-]+\s+", "    ", text))
        if not s or s.startswith(";"):
            ln.kind = "blank"
        elif lm and not cm:
            ln.kind, ln.label = "label", lm.group("name")
        elif s.lower().startswith("org") or s.lower().startswith("pad"):
            ln.kind = "directive"
        elif dm and cm:
            ln.kind = "data"
            ln.start = int(cm.group(1), 16)
            ln.end = ln.start + _data_len(dm)
        elif dm:
            ln.kind = "data"   # data line without address comment: address assigned from the previous line
            ln.dlen = _data_len(dm)
        elif cm:
            ln.kind = "insn"
            ln.start = int(cm.group(1), 16)
            ln.raw = bytes.fromhex(cm.group(2))
            ln.end = ln.start + len(ln.raw)
            if am:
                ln.anon = am.group("anon")
        elif s.startswith("%"):
            ln.kind = "macro"
        elif am:
            ln.kind = "macro"  # anonymous label in front of a macro call
            ln.anon = am.group("anon")
        else:
            ln.kind = "other"
        lines.append(ln)
    return lines


def _macro_counts():
    """Number of instructions each macro in src/common/macros.asm expands to."""
    body, name, cur = {}, None, None
    for text in (ROOT / "src" / "common" / "macros.asm").read_text(encoding="utf-8").split("\n"):
        s = text.split(";")[0].strip()
        m = re.match(r"macro\s+(\w+)", s, re.I)
        if m:
            name, cur = m.group(1), []
            continue
        if s.lower().startswith("endmacro"):
            body[name] = cur
            name = None
            continue
        if name and s:
            nm = re.match(r"%(\w+)", s)
            cur.append(("macro", nm.group(1)) if nm else ("insn", None))
    counts = {}

    def count(n):
        if n not in counts:
            counts[n] = sum(count(a) if k == "macro" else 1 for k, a in body.get(n, []))
        return counts[n]
    for n in body:
        count(n)
    return counts


def _state_after(ins, m, x):
    if ins.mn == "REP":
        if ins.operand & 0x20: m = 0
        if ins.operand & 0x10: x = 0
    elif ins.mn == "SEP":
        if ins.operand & 0x20: m = 1
        if ins.operand & 0x10: x = 1
    elif ins.mode == "immM":
        m = 1 if ins.length == 2 else 0
    elif ins.mode == "immX":
        x = 1 if ins.length == 2 else 0
    return m, x


def load_us_source(rom):
    """Parse all modules; fill start/end for uncommented lines and the M/X state (1 = 8 bit) at the start of
    every line. `rom` is the US ROM image (bytes). Returns the list of Line objects in ROM order."""
    lines = []
    for rel in MODULE_ORDER:
        lines += parse_module(rel)
    counts = _macro_counts()
    m = x = 1
    n = len(lines)
    i = 0
    prev_end = None
    while i < n:
        ln = lines[i]
        if ln.kind == "data" and ln.start is None:
            ln.start = prev_end
            ln.end = prev_end + ln.dlen
        if ln.kind in ("insn", "data"):
            ln.m, ln.x = m, x
            if ln.kind == "insn":
                ins = decode(rom, ln.start, m, x)
                if ins is None or ins.raw != ln.raw:
                    # observed length is authoritative: repair the flag from the immediate width
                    for mm, xx in ((0, x), (1, x), (m, 0), (m, 1)):
                        t = decode(rom, ln.start, mm, xx)
                        if t is not None and t.raw == ln.raw:
                            m, x = mm, xx
                            ln.m, ln.x = m, x
                            ins = t
                            break
                if ins is not None and ins.raw == ln.raw:
                    m, x = _state_after(ins, m, x)
            prev_end = ln.end
            i += 1
            continue
        # a run of lines without address: labels, blanks, macros and uncommented instructions
        j = i
        grp = []
        while j < n and lines[j].kind not in ("insn", "data"):
            if lines[j].kind in ("macro", "other"):
                grp.append(j)
            j += 1
        nxt = lines[j].start if j < n else None
        if j < n and nxt is None and lines[j].kind == "data":
            nxt = None  # uncommented data line follows: end of gap is unknown, decode up to it below
        if prev_end is None:
            prev_end = nxt
        seq, pos, mm, xx = [], prev_end, m, x
        while grp and nxt is not None and pos is not None and pos < nxt:
            ins = decode(rom, pos, mm, xx)
            if ins is None:
                break
            seq.append((pos, ins, mm, xx))
            mm, xx = _state_after(ins, mm, xx)
            pos += ins.length
        k = 0
        for t in range(i, j):
            g = lines[t]
            if g.kind not in ("macro", "other"):
                g.start = g.end = seq[k][0] if k < len(seq) else (nxt if nxt is not None else prev_end)
                g.m, g.x = (seq[k][2], seq[k][3]) if k < len(seq) else (mm, xx)
                continue
            mt = re.match(r"\s*(?:[+\-]+\s+)?%(\w+)", g.text)
            need = counts.get(mt.group(1), 1) if mt else 1
            if k >= len(seq):
                g.start = g.end = nxt
                g.m, g.x = mm, xx
                continue
            g.start, g.m, g.x = seq[k][0], seq[k][2], seq[k][3]
            k += need
            g.end = seq[k][0] if k < len(seq) else nxt
        if k != len(seq):
            print("usmap: gap size mismatch near %s:%d (%d instructions decoded, %d assigned)" %
                  (lines[i].file, lines[i].idx + 1, len(seq), k), file=sys.stderr)
        m, x = mm, xx
        i = j
    return lines


def operand_symbolic(text):
    """True if the instruction text uses a symbolic operand (label or RAM name) instead of a hex literal."""
    code = text.split(";")[0].strip()
    code = re.sub(r"^[+\-]+\s+", "", code)
    parts = code.split(None, 1)
    if len(parts) < 2:
        return False
    op = parts[1]
    op = re.sub(r"^#", "", op)
    return bool(re.search(r"[A-Za-z_!.]", re.sub(r"\$[0-9A-Fa-f]+", "", op).replace(",X", "").replace(",Y", "").replace(",S", "")))
