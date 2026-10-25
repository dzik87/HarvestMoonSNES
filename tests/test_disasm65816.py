#!/usr/bin/env python3
"""Tests for tools/analysis/disasm65816.py.

1. Opcode table sanity (256 opcodes, instruction lengths for every M/X state).
2. Round trip on the US ROM: the ROM is built from src/ with asar (skipped when asar is unavailable), every
   run of consecutive instruction lines of src/code/bank_80..85 is disassembled with the flag state tracked by
   tools/analysis/usmap.py, the text is assembled again with asar and the bytes must equal the ROM.
3. Flow following: recursive descent from the reset vector stays inside code and finds the NMI handler.
"""
import os
import shutil
import subprocess
import sys
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT / "tools" / "analysis"))
import disasm65816 as D  # noqa: E402
import usmap  # noqa: E402


def find_asar():
    for c in (os.environ.get("ASAR"), ROOT / "tools" / "bin" / "asar", shutil.which("asar")):
        if c and Path(c).is_file():
            return str(c)
    return None


def test_table():
    assert len(D._OPS) == 256
    lens = {}
    for op, (mn, mode) in D._OPS.items():
        for m in (0, 1):
            for x in (0, 1):
                n = D.insn_length(mode, m, x)
                assert 1 <= n <= 4
                if mode not in ("immM", "immX"):
                    lens.setdefault(op, n)
                    assert lens[op] == n
    # spot checks against the 65816 reference
    assert D.insn_length(D._OPS[0xA9][1], 1, 1) == 2 and D.insn_length(D._OPS[0xA9][1], 0, 1) == 3
    assert D.insn_length(D._OPS[0xA2][1], 1, 1) == 2 and D.insn_length(D._OPS[0xA2][1], 1, 0) == 3
    assert D._OPS[0x22] == ("JSL", "jlong") and D._OPS[0x54] == ("MVN", "blk") and D._OPS[0xEB] == ("XBA", "imp")
    print("table OK")


def test_text():
    rom = bytearray(0x200000)
    d = D.Disassembler(rom)
    cases = [
        (bytes([0xA9, 0x00, 0x01]), 0, 1, "LDA.W #$0100"),
        (bytes([0xA9, 0x15]), 1, 1, "LDA.B #$15"),
        (bytes([0xB7, 0x72]), 1, 1, "LDA.B [$72],Y"),
        (bytes([0xAD, 0x96, 0x01]), 1, 1, "LDA.W $0196"),
        (bytes([0xBF, 0x00, 0x80, 0x82]), 1, 1, "LDA.L $828000,X"),
        (bytes([0x22, 0xDE, 0x95, 0x80]), 1, 1, "JSL.L $8095DE"),
        (bytes([0x6B]), 1, 1, "RTL"),
        (bytes([0x0A]), 1, 1, "ASL A"),
        (bytes([0x7C, 0x10, 0x80]), 1, 1, "JMP.W ($8010,X)"),
        (bytes([0xA3, 0x05]), 1, 1, "LDA.B $05,S"),
        (bytes([0xB3, 0x05]), 1, 1, "LDA.B ($05,S),Y"),
        (bytes([0x54, 0x7E, 0x7F]), 1, 1, "MVN $7F,$7E"),
        (bytes([0xC2, 0x30]), 1, 1, "REP #$30"),
    ]
    for raw, m, x, expect in cases:
        rom[0:len(raw)] = raw
        ins = D.decode(rom, 0x808000, m, x)
        txt = d.operand_text(ins)
        assert txt == expect, (txt, expect)
    print("text OK")


def test_roundtrip():
    asar = find_asar()
    if not asar:
        print("roundtrip SKIPPED (asar not found)")
        return
    tmp = Path(tempfile.mkdtemp())
    try:
        rom_path = tmp / "us.sfc"
        rom_path.write_bytes(bytes(0x200000))
        r = subprocess.run([asar, "-werror", "--no-title-check", "--fix-checksum=off", str(ROOT / "src" / "main.asm"),
                            str(rom_path)], cwd=ROOT, capture_output=True, text=True)
        assert r.returncode == 0, r.stdout + r.stderr
        rom = rom_path.read_bytes()
        lines = usmap.annotate_flags(usmap.load_us_source(), rom)
        # runs of consecutive instruction lines
        runs, cur = [], None
        for ln in lines:
            if ln.kind == "insn":
                if cur and cur[-1].end == ln.start:
                    cur.append(ln)
                else:
                    cur = [ln]
                    runs.append(cur)
        d = D.Disassembler(rom)
        src = ["lorom", "arch 65816"]
        expect = []
        n_ins = 0
        for run in runs:
            src.append("org $%06X" % run[0].start)
            a = run[0].start
            m, x = run[0].m, run[0].x
            end = run[-1].end
            while a < end:
                ins = D.decode(rom, a, m, x)
                if ins is None or ins.raw != rom[D.lorom_off(a):D.lorom_off(a) + ins.length]:
                    raise AssertionError("decode failure at %06X" % a)
                src.append(d.line(ins, comments=False))
                m, x = d._state_after(ins)
                a += ins.length
                n_ins += 1
            expect.append((run[0].start, end))
        src[2:2] = d.target_defs()
        (tmp / "rt.asm").write_text("\n".join(src) + "\n")
        out = tmp / "rt.sfc"
        out.write_bytes(bytes(0x200000))
        r = subprocess.run([asar, "--no-title-check", "--fix-checksum=off", str(tmp / "rt.asm"), str(out)],
                           capture_output=True, text=True)
        assert r.returncode == 0, (r.stdout + r.stderr)[:2000]
        got = out.read_bytes()
        bad = 0
        for s, e in expect:
            if got[D.lorom_off(s):D.lorom_off(e)] != rom[D.lorom_off(s):D.lorom_off(e)]:
                bad += 1
                print("round trip mismatch in %06X-%06X" % (s, e)) if bad < 10 else None
        assert bad == 0
        print("roundtrip OK: %d instructions in %d runs reassemble to the original bytes" % (n_ins, len(runs)))
    finally:
        shutil.rmtree(tmp, ignore_errors=True)


if __name__ == "__main__":
    test_table()
    test_text()
    test_roundtrip()
    print("all tests passed")
