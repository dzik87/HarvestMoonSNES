#!/usr/bin/env python3
"""Tests for tools/audio/spc700.py and tools/audio/audio_map.py.

Run: python3 tests/test_spc700.py
"""
import io
import os
import sys
import tempfile
from contextlib import redirect_stdout

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools", "audio"))
import spc700  # noqa: E402
import audio_map  # noqa: E402

# ---------------------------------------------------------------------------
# Independent copy of the official opcode length table (rows = high nibble,
# columns = low nibble) and of the mnemonics, typed separately from the
# template table in spc700.py so that a typo in either one is caught.
# ---------------------------------------------------------------------------
LENGTH_ROWS = [
    "1 1 2 3 2 3 1 2 2 3 3 2 3 1 3 1",   # 00 NOP TCALL0 SET1 BBS OR... BRK
    "2 1 2 3 2 3 3 2 3 1 2 2 1 1 3 3",   # 10 BPL ... JMP [!a+X]
    "1 1 2 3 2 3 1 2 2 3 3 2 3 1 3 2",   # 20 CLRP ... BRA
    "2 1 2 3 2 3 3 2 3 1 2 2 1 1 2 3",   # 30 BMI ... CALL
    "1 1 2 3 2 3 1 2 2 3 3 2 3 1 3 2",   # 40 SETP ... PCALL
    "2 1 2 3 2 3 3 2 3 1 2 2 1 1 3 3",   # 50 BVC ... JMP !a
    "1 1 2 3 2 3 1 2 2 3 3 2 3 1 3 1",   # 60 CLRC ... RET
    "2 1 2 3 2 3 3 2 3 1 2 2 1 1 2 1",   # 70 BVS ... RETI
    "1 1 2 3 2 3 1 2 2 3 3 2 3 2 1 3",   # 80 SETC ... MOV d,#i
    "2 1 2 3 2 3 3 2 3 1 2 2 1 1 1 1",   # 90 BCC ... XCN
    "1 1 2 3 2 3 1 2 2 3 3 2 3 2 1 1",   # A0 EI ... MOV (X)+,A
    "2 1 2 3 2 3 3 2 3 1 2 2 1 1 1 1",   # B0 BCS ... MOV A,(X)+
    "1 1 2 3 2 3 1 2 2 3 3 2 3 2 1 1",   # C0 DI ... MUL
    "2 1 2 3 2 3 3 2 2 2 2 2 1 1 3 1",   # D0 BNE ... DAA
    "1 1 2 3 2 3 1 2 2 3 3 2 3 1 1 1",   # E0 CLRV ... SLEEP
    "2 1 2 3 2 3 3 2 2 2 3 2 1 1 2 1",   # F0 BEQ ... STOP
]

MNEMONIC_ROWS = [
    "NOP TCALL SET1 BBS OR OR OR OR OR OR OR1 ASL ASL PUSH TSET1 BRK",
    "BPL TCALL CLR1 BBC OR OR OR OR OR OR DECW ASL ASL DEC CMP JMP",
    "CLRP TCALL SET1 BBS AND AND AND AND AND AND OR1 ROL ROL PUSH CBNE BRA",
    "BMI TCALL CLR1 BBC AND AND AND AND AND AND INCW ROL ROL INC CMP CALL",
    "SETP TCALL SET1 BBS EOR EOR EOR EOR EOR EOR AND1 LSR LSR PUSH TCLR1 PCALL",
    "BVC TCALL CLR1 BBC EOR EOR EOR EOR EOR EOR CMPW LSR LSR MOV CMP JMP",
    "CLRC TCALL SET1 BBS CMP CMP CMP CMP CMP CMP AND1 ROR ROR PUSH DBNZ RET",
    "BVS TCALL CLR1 BBC CMP CMP CMP CMP CMP CMP ADDW ROR ROR MOV CMP RETI",
    "SETC TCALL SET1 BBS ADC ADC ADC ADC ADC ADC EOR1 DEC DEC MOV POP MOV",
    "BCC TCALL CLR1 BBC ADC ADC ADC ADC ADC ADC SUBW DEC DEC MOV DIV XCN",
    "EI TCALL SET1 BBS SBC SBC SBC SBC SBC SBC MOV1 INC INC CMP POP MOV",
    "BCS TCALL CLR1 BBC SBC SBC SBC SBC SBC SBC MOVW INC INC MOV DAS MOV",
    "DI TCALL SET1 BBS MOV MOV MOV MOV CMP MOV MOV1 MOV MOV MOV POP MUL",
    "BNE TCALL CLR1 BBC MOV MOV MOV MOV MOV MOV MOVW MOV DEC MOV CBNE DAA",
    "CLRV TCALL SET1 BBS MOV MOV MOV MOV MOV MOV NOT1 MOV MOV NOTC POP SLEEP",
    "BEQ TCALL CLR1 BBC MOV MOV MOV MOV MOV MOV MOV MOV INC MOV DBNZ STOP",
]

failures = []


def check(cond, msg):
    if not cond:
        failures.append(msg)
        print("FAIL: " + msg)


def one(bytes_, addr=0x1000):
    rows = spc700.disassemble(bytes(bytes_), addr)
    assert len(rows) == 1, rows
    return rows[0][2]


def test_length_table():
    expected = [int(x) for row in LENGTH_ROWS for x in row.split()]
    assert len(expected) == 256
    for op in range(256):
        check(spc700.LENGTHS[op] == expected[op],
              "length of opcode %02X (%s): table %d, expected %d" % (op, spc700.OPCODES[op], spc700.LENGTHS[op], expected[op]))
    counts = {n: spc700.LENGTHS.count(n) for n in (1, 2, 3)}
    # official table: 1-byte x 91? count independently from the rows above
    check(counts == {n: expected.count(n) for n in (1, 2, 3)}, "length histogram %s" % counts)
    # every length is actually produced by the decoder
    for op in range(256):
        n = spc700.LENGTHS[op]
        d = spc700.decode(bytes([op, 0x12, 0x34, 0x56]), 0, 0x2000)
        check(d is not None and d[0] == n, "decode length of %02X" % op)
        # truncated input is reported as .db, never raises
        rows = spc700.disassemble(bytes([op]) + bytes(max(n - 2, 0)), 0)
        check(len(rows) == 1, "truncated instruction %02X yields one row" % op)


def test_mnemonics():
    expected = [m for row in MNEMONIC_ROWS for m in row.split()]
    assert len(expected) == 256
    for op in range(256):
        got = spc700.OPCODES[op].split()[0]
        check(got == expected[op], "mnemonic of %02X: %s vs %s" % (op, got, expected[op]))


HAND = [
    # (addr, bytes, text) -- hand-checked against the SPC700 reference
    (0x0500, [0x20], "CLRP"),
    (0x0501, [0xCD, 0xCF], "MOV X,#$CF"),
    (0x0503, [0xBD], "MOV SP,X"),
    (0x0504, [0xE8, 0x30], "MOV A,#$30"),
    (0x0506, [0xC5, 0xF1, 0x00], "MOV !$00F1,A"),
    (0x0509, [0x3F, 0x7D, 0x0F], "CALL !$0F7D"),
    (0x0510, [0xF0, 0x07], "BEQ $0519"),
    (0x0F8B, [0xD0, 0xFB], "BNE $0F88"),
    (0x1000, [0x2F, 0xFE], "BRA $1000"),
    (0x0200, [0xF0, 0x80], "BEQ $0182"),
    (0xFFF0, [0x2F, 0x20], "BRA $0012"),                 # wraps at 16 bits
    (0x0577, [0x8F, 0x01, 0x83], "MOV $83,#$01"),        # encoded imm, dp -> printed dp, imm
    (0x0514, [0x69, 0x89, 0x88], "CMP $88,$89"),         # encoded src, dst -> printed dst, src
    (0x1000, [0xFA, 0x10, 0x20], "MOV $20,$10"),
    (0x1000, [0x18, 0x05, 0x40], "OR $40,#$05"),
    (0x1000, [0x19], "OR (X),(Y)"),
    (0x1000, [0xAF], "MOV (X)+,A"),
    (0x1000, [0xBF], "MOV A,(X)+"),
    (0x1000, [0xE6], "MOV A,(X)"),
    (0x1000, [0xC6], "MOV (X),A"),
    (0x1000, [0xE7, 0x00], "MOV A,[$00+X]"),
    (0x1000, [0xD7, 0xAC], "MOV [$AC]+Y,A"),
    (0x1000, [0xF7, 0x70], "MOV A,[$70]+Y"),
    (0x1000, [0xF5, 0x40, 0x03], "MOV A,!$0340+X"),
    (0x1000, [0xF6, 0x8B, 0x14], "MOV A,!$148B+Y"),
    (0x1000, [0xF4, 0x01], "MOV A,$01+X"),
    (0x1000, [0xF9, 0x10], "MOV X,$10+Y"),
    (0x1000, [0xD9, 0x10], "MOV $10+Y,X"),
    (0x1000, [0xDB, 0x01], "MOV $01+X,Y"),
    (0x1000, [0x1F, 0x53, 0x10], "JMP [!$1053+X]"),
    (0x1000, [0x5F, 0x00, 0x20], "JMP !$2000"),
    (0x1000, [0x3F, 0x00, 0x20], "CALL !$2000"),
    (0x1000, [0x4F, 0x20], "PCALL $FF20"),
    (0x1000, [0x01], "TCALL 0"),
    (0x1000, [0xF1], "TCALL 15"),
    (0x1000, [0x02, 0x10], "SET1 $10.0"),
    (0x1000, [0xE2, 0x10], "SET1 $10.7"),
    (0x1000, [0x92, 0xCF], "CLR1 $CF.4"),
    (0x0100, [0x13, 0x10, 0x05], "BBC $10.0,$0108"),
    (0x0100, [0xA3, 0x10, 0xFE], "BBS $10.5,$0101"),
    (0x1000, [0x2E, 0x10, 0x00], "CBNE $10,$1003"),
    (0x1000, [0xDE, 0x10, 0xFD], "CBNE $10+X,$1000"),
    (0x1000, [0x6E, 0x94, 0x02], "DBNZ $94,$1005"),
    (0x1000, [0xFE, 0xE2], "DBNZ Y,$0FE4"),
    (0x1000, [0x0A, 0x34, 0x52], "OR1 C,$1234.2"),
    (0x1000, [0x2A, 0x34, 0x52], "OR1 C,/$1234.2"),
    (0x1000, [0x4A, 0xFF, 0xFF], "AND1 C,$1FFF.7"),
    (0x1000, [0x6A, 0x00, 0x20], "AND1 C,/$0000.1"),
    (0x1000, [0x8A, 0x00, 0x00], "EOR1 C,$0000.0"),
    (0x1000, [0xAA, 0x01, 0x40], "MOV1 C,$0001.2"),
    (0x1000, [0xCA, 0x01, 0x40], "MOV1 $0001.2,C"),
    (0x1000, [0xEA, 0x01, 0x40], "NOT1 $0001.2"),
    (0x1000, [0x5A, 0x10], "CMPW YA,$10"),
    (0x1000, [0xBA, 0x10], "MOVW YA,$10"),
    (0x1000, [0xDA, 0x10], "MOVW $10,YA"),
    (0x1000, [0x7A, 0xAC], "ADDW YA,$AC"),
    (0x1000, [0x9A, 0xAC], "SUBW YA,$AC"),
    (0x1000, [0x3A, 0xAC], "INCW $AC"),
    (0x1000, [0x1A, 0xAA], "DECW $AA"),
    (0x1000, [0x9E], "DIV YA,X"),
    (0x1000, [0xCF], "MUL YA"),
    (0x1000, [0x9F], "XCN A"),
    (0x1000, [0x0E, 0x82, 0x00], "TSET1 !$0082"),
    (0x1000, [0x4E, 0x81, 0x00], "TCLR1 !$0081"),
    (0x1000, [0xC8, 0xE8], "CMP X,#$E8"),
    (0x1000, [0x3E, 0x20], "CMP X,$20"),
    (0x1000, [0x1E, 0x00, 0x30], "CMP X,!$3000"),
    (0x1000, [0xAD, 0x05], "CMP Y,#$05"),
    (0x1000, [0x7E, 0x20], "CMP Y,$20"),
    (0x1000, [0x5E, 0x00, 0x30], "CMP Y,!$3000"),
    (0x1000, [0x8D, 0x0A], "MOV Y,#$0A"),
    (0x1000, [0xEB, 0xA9], "MOV Y,$A9"),
    (0x1000, [0xEC, 0xFD, 0x00], "MOV Y,!$00FD"),
    (0x1000, [0xCB, 0x81], "MOV $81,Y"),
    (0x1000, [0xCC, 0x6B, 0x03], "MOV !$036B,Y"),
    (0x1000, [0xE9, 0x65, 0x03], "MOV X,!$0365"),
    (0x1000, [0xC9, 0x66, 0x03], "MOV !$0366,X"),
    (0x1000, [0xD8, 0x76], "MOV $76,X"),
    (0x1000, [0xF8, 0x76], "MOV X,$76"),
    (0x1000, [0x9D], "MOV X,SP"),
    (0x1000, [0x7D], "MOV A,X"),
    (0x1000, [0xDD], "MOV A,Y"),
    (0x1000, [0x5D], "MOV X,A"),
    (0x1000, [0xFD], "MOV Y,A"),
    (0x1000, [0x0D], "PUSH PSW"),
    (0x1000, [0x8E], "POP PSW"),
    (0x1000, [0x6F], "RET"),
    (0x1000, [0x7F], "RETI"),
    (0x1000, [0x0F], "BRK"),
    (0x1000, [0xEF], "SLEEP"),
    (0x1000, [0xFF], "STOP"),
    (0x1000, [0xED], "NOTC"),
    (0x1000, [0xE0], "CLRV"),
    (0x1000, [0x80], "SETC"),
    (0x1000, [0x60], "CLRC"),
    (0x1000, [0x40], "SETP"),
    (0x1000, [0xA0], "EI"),
    (0x1000, [0xC0], "DI"),
    (0x1000, [0xBE], "DAS A"),
    (0x1000, [0xDF], "DAA A"),
    (0x1000, [0x88, 0x10], "ADC A,#$10"),
    (0x1000, [0xA8, 0x10], "SBC A,#$10"),
    (0x1000, [0x28, 0x1F], "AND A,#$1F"),
    (0x1000, [0x04, 0x20], "OR A,$20"),
    (0x1000, [0x15, 0x00, 0x30], "OR A,!$3000+X"),
    (0x1000, [0x17, 0x20], "OR A,[$20]+Y"),
]


def test_hand_checked():
    for addr, bs, text in HAND:
        rows = spc700.disassemble(bytes(bs), addr)
        check(len(rows) == 1 and rows[0][2] == text and rows[0][1] == bytes(bs),
              "%04X %s -> %r (expected %r)" % (addr, bytes(bs).hex(" "), [r[2] for r in rows], text))


def test_sequence_and_api():
    # engine entry as seen in the real blob
    seq = bytes([0x20, 0xCD, 0xCF, 0xBD, 0xE8, 0x30, 0xC5, 0xF1, 0x00, 0x3F, 0x7D, 0x0F, 0x8D, 0x0A])
    rows = spc700.disassemble(seq, 0x0500)
    check([r[0] for r in rows] == [0x500, 0x501, 0x503, 0x504, 0x506, 0x509, 0x50C], "sequence addresses %s" % [hex(r[0]) for r in rows])
    check([r[2] for r in rows][-1] == "MOV Y,#$0A", "sequence last text")
    # truncated final instruction -> .db
    rows = spc700.disassemble(bytes([0xE8]), 0)
    check(rows[0][2] == ".db $E8", "truncated instruction rendered as .db: %r" % rows)
    # CLI output
    with tempfile.NamedTemporaryFile(delete=False, suffix=".bin") as f:
        f.write(seq)
        name = f.name
    try:
        buf = io.StringIO()
        with redirect_stdout(buf):
            spc700.main([name, "--base", "0x500", "--bytes"])
        out = buf.getvalue().splitlines()
        check(out[0].startswith("0500  20") and out[0].rstrip().endswith("CLRP"), "CLI first line: %r" % out[0])
        check(len(out) == 7, "CLI line count %d" % len(out))
    finally:
        os.unlink(name)


def _engine():
    p = audio_map.load()
    blob = p.by_rom[p.engine_rom]["path"].read_bytes()
    return p, blob


def test_engine_smoke():
    p, blob = _engine()
    base = 0x0500
    eng = audio_map.Engine(blob)
    check(len(blob) == 0x0FD6, "engine size")
    roots = [base] + eng.handler_table() + eng.cmd_jump_table()
    reach, problems = spc700.trace(blob, base, roots)
    check(not problems, "trace problems: %s" % problems[:5])
    check(len(reach) > 1500, "reachable instruction count %d" % len(reach))
    cover = set()
    for a in reach:
        n = spc700.LENGTHS[blob[a - base]]
        cover.update(range(a, a + n))
    gaps = []
    a = base
    while a < 0x13E0:
        if a not in cover:
            b = a
            while b < 0x13E0 and b not in cover:
                b += 1
            gaps.append((a, b))
            a = b
        else:
            a += 1
    # Only the 13-word command jump table, the two small lookup tables at $1195 and a 5-byte dead stub are not code.
    check(gaps == [(0x1046, 0x104B), (0x1053, 0x106D), (0x1195, 0x11A5)], "code gaps %s" % [(hex(x), hex(y)) for x, y in gaps])
    # entry-point anchors
    for addr, text in [(0x0500, "CLRP"), (0x0501, "MOV X,#$CF"), (0x0509, "CALL !$0F7D"), (0x103C, "BBS $D0.0,$1041"),
                       (0x131A, "MOV A,$CF"), (0x131C, "MOV !$00F4,A"), (0x13C8, "PUSH Y"), (0x0F7D, "MOV A,#$00"),
                       (0x06BB, "ASL A"), (0x0BB1, "MOVW YA,$DC")]:
        d = spc700.decode(blob, addr - base, addr)
        check(d is not None and d[1] == text, "anchor %04X: %r vs %r" % (addr, d and d[1], text))
        check(addr in reach, "anchor %04X is reachable" % addr)
    # every branch target of every reachable instruction lands on an instruction start
    starts = set(reach)
    for a in reach:
        d = spc700.decode(blob, a - base, a)
        if "target" in d[2]:
            check(d[2]["target"] in starts or d[2]["target"] >= base + len(blob),
                  "branch at %04X targets %04X which is not an instruction start" % (a, d[2]["target"]))
    # tables sanity: param counts 0..3, handler table pointers are instruction starts
    check(all(0 <= c <= 3 for c in eng.param_counts()), "command parameter counts")
    check(all(h in starts for h in eng.handler_table()), "handler table entries are instruction starts")
    check(eng.param_counts()[0xEF - 0xE0] == 3 and eng.param_counts()[0xFA - 0xE0] == 1, "known N-SPC parameter counts")


def test_audio_map_consistency():
    p = audio_map.load()
    res = audio_map.check(p)
    bad = [m for ok, m in res if not ok]
    check(not bad, "audio_map.check failures: %s" % bad[:5])
    check(len(p.order) == 65, "audio label count %d" % len(p.order))
    rows = audio_map.build_rows(p)
    check(not [r for r in rows if r[3] == "unreferenced"], "every audio label has a role")


def main():
    tests = [test_length_table, test_mnemonics, test_hand_checked, test_sequence_and_api, test_engine_smoke,
             test_audio_map_consistency]
    for t in tests:
        before = len(failures)
        t()
        print("%-32s %s" % (t.__name__, "ok" if len(failures) == before else "FAILED (%d)" % (len(failures) - before)))
    print("%d opcodes checked for length/mnemonic, %d hand-checked instructions, %d failures" % (256, len(HAND), len(failures)))
    return 1 if failures else 0


if __name__ == "__main__":
    sys.exit(main())
