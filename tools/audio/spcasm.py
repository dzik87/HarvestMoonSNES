#!/usr/bin/env python3
"""SPC700 assembler for the audio driver source, plus the disassembler that writes that source.

The syntax is exactly what tools/audio/spc700.py prints (so a listing can be pasted back), with labels:

    ORG $0500            set the address of the following bytes (only the first ORG sets the load address)
    name:                label (branch/call/jump targets and data references can use it)
    MOV A,!$13E0+X       instruction; `!expr` = absolute address operand, `$xx` = direct page, `#xx` = immediate
    BNE c_0A3C           relative branches / CALL / JMP take an address or a label
    db $01 $02 ...       bytes            dw $1234 label ...      words (little endian, labels allowed)

Operand expressions are `$hex`, decimal or a label (no arithmetic).  Instruction encodings are fully determined by the
spelling (direct page vs `!absolute`), which makes disassemble -> assemble byte exact.
"""
import re
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import spc700  # noqa: E402

_EXPR_BODY = r"(?:\$[0-9A-Fa-f]+|\d+|(?!(?:A|X|Y|YA|C|SP|PSW)\b)[A-Za-z_][A-Za-z_0-9]*)"
_EXPR = "(" + _EXPR_BODY + ")"
_PH = re.compile(r"\{([sidutamr])\}")


class AsmError(Exception):
    pass


def _compile():
    fixed = {}
    pats = []
    for op, tmpl in enumerate(spc700.OPCODES):
        if "{" not in tmpl:
            fixed[re.sub(r"\s+", " ", tmpl).upper()] = op
            continue
        parts = _PH.split(tmpl)
        rx = ""
        order = []
        for i, part in enumerate(parts):
            if i % 2 == 0:
                rx += re.escape(part).replace(r"\ ", r"\s+")
            else:
                rx += ("(" + _EXPR_BODY + r"\.[0-7])") if part == "m" else ("!" + _EXPR if part == "a" else _EXPR)
                order.append(part)
        pats.append((re.compile("^" + rx + "$", re.I), op, order))
    return fixed, pats


_FIXED, _PATS = _compile()


def _parse_insn(text):
    t = re.sub(r"\s+", " ", text.strip())
    if t.upper() in _FIXED:
        return _FIXED[t.upper()], {}
    for rx, op, order in _PATS:
        m = rx.match(t)
        if m:
            return op, dict(zip(order, m.groups()))
    raise AsmError("cannot parse instruction %r" % text)


def _val(tok, labels, what):
    if tok.startswith("$"):
        return int(tok[1:], 16)
    if tok.isdigit():
        return int(tok)
    if tok in labels:
        return labels[tok]
    raise AsmError("unknown label/value %r (%s)" % (tok, what))


def assemble(text):
    """-> (load address, bytes)."""
    lines = []
    org = None
    for ln, raw in enumerate(text.splitlines(), 1):
        line = raw.split(";", 1)[0].strip()
        if not line:
            continue
        while True:
            m = re.match(r"^([A-Za-z_][A-Za-z_0-9]*):\s*(.*)$", line)
            if not m:
                break
            lines.append((ln, "label", m.group(1)))
            line = m.group(2)
        if not line:
            continue
        low = line.lower()
        if low.startswith("org "):
            v = int(line.split()[1].lstrip("$"), 16)
            if org is None:
                org = v
            elif lines and v != org:
                lines.append((ln, "org", v))
            continue
        if low.startswith("db "):
            lines.append((ln, "db", [int(x.lstrip("$"), 16) if x.startswith("$") else int(x) for x in line[3:].replace(",", " ").split()]))
        elif low.startswith("dw "):
            lines.append((ln, "dw", line[3:].replace(",", " ").split()))
        else:
            try:
                op, ops = _parse_insn(line)
            except AsmError as e:
                raise AsmError("line %d: %s" % (ln, e))
            lines.append((ln, "insn", (op, ops)))
    if org is None:
        raise AsmError("missing ORG")
    labels = {}
    pc = org
    for ln, kind, arg in lines:
        if kind == "label":
            if arg in labels:
                raise AsmError("line %d: duplicate label %s" % (ln, arg))
            labels[arg] = pc
        elif kind == "db":
            pc += len(arg)
        elif kind == "dw":
            pc += 2 * len(arg)
        elif kind == "insn":
            pc += spc700.LENGTHS[arg[0]]
        elif kind == "org":
            raise AsmError("line %d: a second ORG is not supported" % ln)
    out = bytearray()
    pc = org
    for ln, kind, arg in lines:
        try:
            if kind == "db":
                out += bytes(arg); pc += len(arg)
            elif kind == "dw":
                for t in arg:
                    out += (_val(t, labels, "dw") & 0xFFFF).to_bytes(2, "little")
                pc += 2 * len(arg)
            elif kind == "insn":
                op, ops = arg
                n = spc700.LENGTHS[op]
                vals = {}
                for c, tok in ops.items():
                    if c == "m":
                        a_tok, bit = tok.rsplit(".", 1)
                        a_v = _val(a_tok, labels, c)
                        if not 0 <= a_v <= 0x1FFF:
                            raise AsmError("bit address out of range (13 bit)")
                        vals[c] = a_v | (int(bit) << 13)
                        continue
                    v = _val(tok, labels, c)
                    if c in "sidt":
                        if not 0 <= v <= 255:
                            raise AsmError("operand %s out of byte range" % tok)
                    elif c == "u":
                        if not 0xFF00 <= v <= 0xFFFF:
                            raise AsmError("pcall operand must be $FFxx")
                        v &= 0xFF
                    elif c == "a":
                        if not 0 <= v <= 0xFFFF:
                            raise AsmError("address out of range")
                    elif c == "r":
                        rel = v - (pc + n)
                        if not -128 <= rel <= 127:
                            raise AsmError("branch target %s out of range" % tok)
                        v = rel & 0xFF
                    vals[c] = v
                out.append(op)
                for c in spc700._fields(spc700.OPCODES[op]):
                    v = vals[c]
                    if spc700._SIZE[c] == 2:
                        out += v.to_bytes(2, "little")
                    else:
                        out.append(v)
                pc += n
        except AsmError as e:
            raise AsmError("line %d: %s" % (ln, e))
    return org, bytes(out)


# ---------------------------------------------------------------------------
# disassembler -> source text
# ---------------------------------------------------------------------------
def to_source(blob, base, roots, word_tables=(), header=()):
    """Disassemble `blob` (loaded at `base`) into assembler source.

    roots        : code entry addresses for the recursive-descent trace (everything reachable is code, the rest `db`)
    word_tables  : [(address, count)] runs of 16-bit words emitted as `dw` (labels when the value is a known address)
    The result assembles back to exactly `blob` (checked by the caller / tests).
    """
    data = bytes(blob)
    end = base + len(data)
    reach, problems = spc700.trace(data, base, roots)
    if problems:
        raise AsmError("trace problems: %s" % problems[:3])
    insn = {a: spc700.decode(data, a - base, a) for a in reach}
    wt = {}
    for addr, cnt in word_tables:
        for i in range(cnt):
            wt[addr + 2 * i] = True
    # referenced addresses -> labels
    refs = set(roots)
    for a, d in insn.items():
        f = d[2]
        if "target" in f and base <= f["target"] < end:
            refs.add(f["target"])
        if "a" in f and base <= f["a"] < end:
            refs.add(f["a"])
    for addr in wt:
        v = data[addr - base] | (data[addr - base + 1] << 8)
        if base <= v < end:
            refs.add(v)
    # atoms: instructions, dw words, db rows (split at referenced addresses and 16-byte rows)
    atoms = []
    a = base
    while a < end:
        if a in insn:
            atoms.append((a, "insn", insn[a][0])); a += insn[a][0]
        elif a in wt:
            atoms.append((a, "dw", 2)); a += 2
        else:
            b = a + 1
            while b < end and b not in insn and b not in wt and b not in refs and b - a < 16:
                b += 1
            atoms.append((a, "db", b - a)); a = b
    starts = {x[0] for x in atoms}
    labels = {}
    for r in sorted(refs):
        if r in starts:
            kind = next(x[1] for x in atoms if x[0] == r) if False else None
            labels[r] = None
    code = set(insn)
    for r in labels:
        labels[r] = ("c_%04X" if r in code else "d_%04X") % r
    out = list(header)
    out.append("    ORG $%04X" % base)
    out.append("")
    for addr, kind, n in atoms:
        if addr in labels:
            if out and out[-1] != "":
                out.append("")
            out.append(labels[addr] + ":")
        if kind == "insn":
            f = insn[addr][2]
            text = insn[addr][1]
            op = data[addr - base]
            tmpl = spc700.OPCODES[op]
            # symbolic operands
            if "target" in f and f["target"] in labels and op != 0x4F:
                text = text.replace("$%04X" % f["target"], labels[f["target"]], 1) if "{r}" in tmpl else \
                    text.replace("!$%04X" % f["target"], "!" + labels[f["target"]], 1)
            elif "{a}" in tmpl and f.get("a") in labels and f["a"] >= base:
                text = text.replace("!$%04X" % f["a"], "!" + labels[f["a"]], 1)
            out.append("    " + text)
        elif kind == "dw":
            v = data[addr - base] | (data[addr - base + 1] << 8)
            out.append("    dw " + (labels[v] if v in labels else "$%04X" % v))
        else:
            out.append("    db " + " ".join("$%02X" % x for x in data[addr - base:addr - base + n]))
    return "\n".join(out) + "\n"
