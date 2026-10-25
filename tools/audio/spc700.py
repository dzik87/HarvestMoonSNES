#!/usr/bin/env python3
"""Pure-Python SPC700 disassembler (Sony S-SMP, the SNES audio CPU).

Usage:
    python tools/audio/spc700.py <file.bin> --base 0xXXXX [--bytes] [--start 0xNN] [--length 0xNN]
    python tools/audio/spc700.py <file.bin> --base 0x0500 --trace 0x0500 [--bytes]

Library:
    from spc700 import disassemble, trace
    disassemble(data, base_addr) -> [(addr, bytes, text), ...]   (linear sweep)
    trace(data, base_addr, entries) -> sorted list of reachable instruction addresses

Syntax: standard SPC700 mnemonics (uppercase), operands as in the Sony / "anomie"
reference, close to what asar's `arch spc700` accepts:
    $XX            direct page byte              !$XXXX   absolute address
    $XX+X, $XX+Y   direct page indexed           !$XXXX+X absolute indexed
    [$XX+X]        (dp+X) indirect               [$XX]+Y  (dp) indirect + Y
    (X), (X)+, (Y) register indirect             #$XX     immediate
    $XXXX.b        13-bit address + bit index (MOV1/OR1/AND1/EOR1/NOT1; "/" = inverted)
    $XX.b          bit in direct page (SET1/CLR1/BBS/BBC)
Branch targets are printed as absolute addresses ($XXXX).
Dual direct-page forms are encoded "opcode, source, destination" and printed
"dest,source" (e.g. FA 10 20 -> MOV $20,$10).
"""
import argparse
import sys

# ---------------------------------------------------------------------------
# Opcode table: 16 rows (high nibble) x 16 columns (low nibble).
# Placeholders (operand bytes are consumed in this order: s, i, d, u, a, m, t, r):
#   {s} source dp   {i} imm8   {d} dp   {u} pcall page byte   {a} abs16
#   {m} mem.bit (13-bit addr + 3-bit index, 16 bits)   {t} destination dp   {r} rel8
# ---------------------------------------------------------------------------
_TABLE_ROWS = [
    # 0x00
    ["NOP", "TCALL 0", "SET1 {d}.0", "BBS {d}.0,{r}", "OR A,{d}", "OR A,{a}", "OR A,(X)", "OR A,[{d}+X]",
     "OR A,#{i}", "OR {t},{s}", "OR1 C,{m}", "ASL {d}", "ASL {a}", "PUSH PSW", "TSET1 {a}", "BRK"],
    # 0x10
    ["BPL {r}", "TCALL 1", "CLR1 {d}.0", "BBC {d}.0,{r}", "OR A,{d}+X", "OR A,{a}+X", "OR A,{a}+Y", "OR A,[{d}]+Y",
     "OR {t},#{i}", "OR (X),(Y)", "DECW {d}", "ASL {d}+X", "ASL A", "DEC X", "CMP X,{a}", "JMP [{a}+X]"],
    # 0x20
    ["CLRP", "TCALL 2", "SET1 {d}.1", "BBS {d}.1,{r}", "AND A,{d}", "AND A,{a}", "AND A,(X)", "AND A,[{d}+X]",
     "AND A,#{i}", "AND {t},{s}", "OR1 C,/{m}", "ROL {d}", "ROL {a}", "PUSH A", "CBNE {d},{r}", "BRA {r}"],
    # 0x30
    ["BMI {r}", "TCALL 3", "CLR1 {d}.1", "BBC {d}.1,{r}", "AND A,{d}+X", "AND A,{a}+X", "AND A,{a}+Y", "AND A,[{d}]+Y",
     "AND {t},#{i}", "AND (X),(Y)", "INCW {d}", "ROL {d}+X", "ROL A", "INC X", "CMP X,{d}", "CALL {a}"],
    # 0x40
    ["SETP", "TCALL 4", "SET1 {d}.2", "BBS {d}.2,{r}", "EOR A,{d}", "EOR A,{a}", "EOR A,(X)", "EOR A,[{d}+X]",
     "EOR A,#{i}", "EOR {t},{s}", "AND1 C,{m}", "LSR {d}", "LSR {a}", "PUSH X", "TCLR1 {a}", "PCALL {u}"],
    # 0x50
    ["BVC {r}", "TCALL 5", "CLR1 {d}.2", "BBC {d}.2,{r}", "EOR A,{d}+X", "EOR A,{a}+X", "EOR A,{a}+Y", "EOR A,[{d}]+Y",
     "EOR {t},#{i}", "EOR (X),(Y)", "CMPW YA,{d}", "LSR {d}+X", "LSR A", "MOV X,A", "CMP Y,{a}", "JMP {a}"],
    # 0x60
    ["CLRC", "TCALL 6", "SET1 {d}.3", "BBS {d}.3,{r}", "CMP A,{d}", "CMP A,{a}", "CMP A,(X)", "CMP A,[{d}+X]",
     "CMP A,#{i}", "CMP {t},{s}", "AND1 C,/{m}", "ROR {d}", "ROR {a}", "PUSH Y", "DBNZ {d},{r}", "RET"],
    # 0x70
    ["BVS {r}", "TCALL 7", "CLR1 {d}.3", "BBC {d}.3,{r}", "CMP A,{d}+X", "CMP A,{a}+X", "CMP A,{a}+Y", "CMP A,[{d}]+Y",
     "CMP {t},#{i}", "CMP (X),(Y)", "ADDW YA,{d}", "ROR {d}+X", "ROR A", "MOV A,X", "CMP Y,{d}", "RETI"],
    # 0x80
    ["SETC", "TCALL 8", "SET1 {d}.4", "BBS {d}.4,{r}", "ADC A,{d}", "ADC A,{a}", "ADC A,(X)", "ADC A,[{d}+X]",
     "ADC A,#{i}", "ADC {t},{s}", "EOR1 C,{m}", "DEC {d}", "DEC {a}", "MOV Y,#{i}", "POP PSW", "MOV {t},#{i}"],
    # 0x90
    ["BCC {r}", "TCALL 9", "CLR1 {d}.4", "BBC {d}.4,{r}", "ADC A,{d}+X", "ADC A,{a}+X", "ADC A,{a}+Y", "ADC A,[{d}]+Y",
     "ADC {t},#{i}", "ADC (X),(Y)", "SUBW YA,{d}", "DEC {d}+X", "DEC A", "MOV X,SP", "DIV YA,X", "XCN A"],
    # 0xA0
    ["EI", "TCALL 10", "SET1 {d}.5", "BBS {d}.5,{r}", "SBC A,{d}", "SBC A,{a}", "SBC A,(X)", "SBC A,[{d}+X]",
     "SBC A,#{i}", "SBC {t},{s}", "MOV1 C,{m}", "INC {d}", "INC {a}", "CMP Y,#{i}", "POP A", "MOV (X)+,A"],
    # 0xB0
    ["BCS {r}", "TCALL 11", "CLR1 {d}.5", "BBC {d}.5,{r}", "SBC A,{d}+X", "SBC A,{a}+X", "SBC A,{a}+Y", "SBC A,[{d}]+Y",
     "SBC {t},#{i}", "SBC (X),(Y)", "MOVW YA,{d}", "INC {d}+X", "INC A", "MOV SP,X", "DAS A", "MOV A,(X)+"],
    # 0xC0
    ["DI", "TCALL 12", "SET1 {d}.6", "BBS {d}.6,{r}", "MOV {d},A", "MOV {a},A", "MOV (X),A", "MOV [{d}+X],A",
     "CMP X,#{i}", "MOV {a},X", "MOV1 {m},C", "MOV {d},Y", "MOV {a},Y", "MOV X,#{i}", "POP X", "MUL YA"],
    # 0xD0
    ["BNE {r}", "TCALL 13", "CLR1 {d}.6", "BBC {d}.6,{r}", "MOV {d}+X,A", "MOV {a}+X,A", "MOV {a}+Y,A", "MOV [{d}]+Y,A",
     "MOV {d},X", "MOV {d}+Y,X", "MOVW {d},YA", "MOV {d}+X,Y", "DEC Y", "MOV A,Y", "CBNE {d}+X,{r}", "DAA A"],
    # 0xE0
    ["CLRV", "TCALL 14", "SET1 {d}.7", "BBS {d}.7,{r}", "MOV A,{d}", "MOV A,{a}", "MOV A,(X)", "MOV A,[{d}+X]",
     "MOV A,#{i}", "MOV X,{a}", "NOT1 {m}", "MOV Y,{d}", "MOV Y,{a}", "NOTC", "POP Y", "SLEEP"],
    # 0xF0
    ["BEQ {r}", "TCALL 15", "CLR1 {d}.7", "BBC {d}.7,{r}", "MOV A,{d}+X", "MOV A,{a}+X", "MOV A,{a}+Y", "MOV A,[{d}]+Y",
     "MOV X,{d}", "MOV X,{d}+Y", "MOV {t},{s}", "MOV Y,{d}+X", "INC Y", "MOV Y,A", "DBNZ Y,{r}", "STOP"],
]

OPCODES = [t for row in _TABLE_ROWS for t in row]
assert len(OPCODES) == 256

_ORDER = "sidu" + "amtr"          # byte-consumption order of placeholders
_SIZE = {"s": 1, "i": 1, "d": 1, "u": 1, "a": 2, "m": 2, "t": 1, "r": 1}


def _fields(tmpl):
    return [c for c in _ORDER if "{" + c + "}" in tmpl]


# Instruction length for each opcode (1, 2 or 3), derived from the table.
LENGTHS = [1 + sum(_SIZE[c] for c in _fields(t)) for t in OPCODES]

# Opcodes after which control never falls through.
_NO_FALLTHROUGH = {0x2F, 0x5F, 0x6F, 0x7F, 0x1F, 0xFF, 0xEF, 0x0F}   # BRA JMP RET RETI JMP[] STOP SLEEP BRK
_REL_BRANCH = {op for op, t in enumerate(OPCODES) if "{r}" in t}
_ABS_TARGET_OPS = {0x3F: "a", 0x5F: "a"}                               # CALL !a, JMP !a


def _h8(v):
    return "$%02X" % v


def _h16(v):
    return "$%04X" % (v & 0xFFFF)


def decode(data, off, addr):
    """Decode one instruction at data[off] (located at SPC address addr).

    Returns (length, text, fields) or None if the instruction is truncated.
    fields is a dict of raw operand values (plus 'target' for branches/calls).
    """
    op = data[off]
    n = LENGTHS[op]
    if off + n > len(data):
        return None
    tmpl = OPCODES[op]
    pos = off + 1
    vals = {}
    for c in _fields(tmpl):
        if _SIZE[c] == 2:
            vals[c] = data[pos] | (data[pos + 1] << 8)
            pos += 2
        else:
            vals[c] = data[pos]
            pos += 1
    out = {}
    for c, v in list(vals.items()):
        if c in "sidt":
            out[c] = _h8(v)
        elif c == "u":
            out[c] = _h16(0xFF00 | v)
        elif c == "a":
            out[c] = "!" + _h16(v)
        elif c == "m":
            out[c] = "%s.%d" % (_h16(v & 0x1FFF), v >> 13)
        elif c == "r":
            rel = v - 256 if v & 0x80 else v
            vals["target"] = (addr + n + rel) & 0xFFFF
            out[c] = _h16(vals["target"])
    text = tmpl.format(**out)
    if op in _ABS_TARGET_OPS:
        vals["target"] = vals["a"]
    if op == 0x4F:
        vals["target"] = 0xFF00 | vals["u"]
    return n, text, vals


def disassemble(data, base_addr):
    """Linear-sweep disassembly. Returns [(addr, bytes, text)]."""
    data = bytes(data)
    res = []
    off = 0
    while off < len(data):
        addr = (base_addr + off) & 0xFFFF
        d = decode(data, off, addr)
        if d is None:
            rest = data[off:]
            res.append((addr, rest, ".db " + ",".join(_h8(b) for b in rest)))
            break
        n, text, _ = d
        res.append((addr, data[off:off + n], text))
        off += n
    return res


def trace(data, base_addr, entries, stop_at=None):
    """Recursive-descent walk from the given entry addresses.

    Follows relative branches, CALL/JMP !a and PCALL, falls through otherwise.
    Returns (reachable, problems): reachable is a sorted list of instruction
    start addresses; problems lists (addr, reason) for walks that left the
    blob or hit an overlapping/truncated instruction.
    """
    data = bytes(data)
    end = base_addr + len(data)
    seen = {}
    problems = []
    work = list(entries)
    while work:
        a = work.pop()
        while True:
            if not (base_addr <= a < end):
                problems.append((a, "target outside blob"))
                break
            if a in seen:
                break
            d = decode(data, a - base_addr, a)
            if d is None:
                problems.append((a, "truncated instruction"))
                break
            n, _, f = d
            op = data[a - base_addr]
            seen[a] = n
            if "target" in f:
                work.append(f["target"])
            if op in _NO_FALLTHROUGH:
                break
            a += n
    # overlap check
    prev = None
    for a in sorted(seen):
        if prev is not None and prev + seen[prev] > a:
            problems.append((a, "overlaps instruction at $%04X" % prev))
        prev = a
    return sorted(seen), problems


def format_listing(rows, show_bytes=False):
    lines = []
    for addr, bs, text in rows:
        if show_bytes:
            lines.append("%04X  %-9s %s" % (addr, " ".join("%02X" % b for b in bs), text))
        else:
            lines.append("%04X  %s" % (addr, text))
    return "\n".join(lines)


def _auto_int(s):
    return int(s, 0)


def main(argv=None):
    ap = argparse.ArgumentParser(description="SPC700 disassembler")
    ap.add_argument("file")
    ap.add_argument("--base", type=_auto_int, default=0, help="SPC address of the first byte")
    ap.add_argument("--bytes", action="store_true", help="show raw bytes")
    ap.add_argument("--start", type=_auto_int, default=0, help="file offset to start at")
    ap.add_argument("--length", type=_auto_int, default=None, help="number of bytes to disassemble")
    ap.add_argument("--trace", type=_auto_int, action="append", default=None,
                    help="recursive-descent from this SPC address instead of a linear sweep (repeatable)")
    a = ap.parse_args(argv)
    with open(a.file, "rb") as f:
        data = f.read()
    end = len(data) if a.length is None else a.start + a.length
    chunk = data[a.start:end]
    base = a.base + a.start
    if a.trace:
        reach, probs = trace(chunk, base, a.trace)
        rows = []
        for addr in reach:
            d = decode(chunk, addr - base, addr)
            rows.append((addr, chunk[addr - base:addr - base + d[0]], d[1]))
        print(format_listing(rows, a.bytes))
        for addr, why in probs:
            print("; problem at $%04X: %s" % (addr, why), file=sys.stderr)
    else:
        print(format_listing(disassemble(chunk, base), a.bytes))
    return 0


if __name__ == "__main__":
    sys.exit(main())
