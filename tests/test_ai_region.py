#!/usr/bin/env python3
"""Tests for tools/analysis/aidiff.py (AI script comparer).

1. command table parsed from src/ai/commands.asm;
2. synthetic ROMs: a US script set and region variants (RAM shift, relocation, operand change, added / removed command)
   must be classified exactly;
3. if asar is available: the four regions built from this tree must decode cleanly and give the documented
   differences (EU/DE: two ScreenFadein removed + one WaitForScriptFlag added, JP: one StartScript added; RAM shifts
   DE +6, JP -32), and the generated block of docs/regions-ai.md must be up to date.
"""
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT / "tools" / "analysis"))
import aidiff  # noqa: E402
from aidiff import OPS, BANK, off  # noqa: E402


def test_ops():
    assert set(OPS) == set(range(0x5A)) - {0x26, 0x27}      # 0x26/0x27 are macro aliases that emit $28
    sizes = {0x00: 3, 0x10: 1, 0x12: 3, 0x15: 7, 0x1A: 8, 0x42: 7, 0x46: 12, 0x4B: 6, 0x59: 1}
    for op, n in sizes.items():
        assert OPS[op].size == n, (hex(op), OPS[op].size, n)
    assert [p[2] for p in OPS[0x15].params] == ["addr", "imm", "ptr16"]
    assert [p[2] for p in OPS[0x1A].params] == ["imm", "imm", "ptr16", "imm"]


# --- tiny assembler ------------------------------------------------------------------------------------------------
def asm(items, base, nslots=1):
    """items: ('label', name) | (opcode, arg, ...) with str args = label references (16-bit).  Returns bytes."""
    tbl = 2 * nslots
    pos, labels = base + tbl, {}
    for it in items:
        if it[0] == "label":
            labels[it[1]] = pos
        else:
            pos += OPS[it[0]].size
    out = bytearray()
    for _ in range(nslots):
        out += (base + tbl & 0xFFFF).to_bytes(2, "little")
    for it in items:
        if it[0] == "label":
            continue
        o = OPS[it[0]]
        out.append(it[0])
        for (size, _, kind), v in zip(o.params, it[1:]):
            if isinstance(v, str):
                v = labels[v] & 0xFFFF
            out += v.to_bytes(size, "little")
    return bytes(out)


def make_rom(scripts):
    """scripts: {index: items}; every other script is a single End.  Returns a 2 MB ROM image."""
    rom = bytearray(0x200000)
    bank_pos = {0xB3: 0x80D8 + 0x10, 0xB4: 0x8000, 0xB5: 0x8000}
    starts = []
    for i in range(aidiff.NSCRIPTS):
        b = 0xB3 if i <= 0x0E else 0xB4 if i <= 0x42 else 0xB5
        s = (b << 16) | bank_pos[b]
        data = asm(scripts.get(i, [(0x10,)]), s & 0xFFFF)
        rom[off(s):off(s) + len(data)] = data
        bank_pos[b] += len(data)
        starts.append(s)
    for i, s in enumerate(starts):
        rom[off(0xB38000) + 3 * i:off(0xB38000) + 3 * i + 3] = s.to_bytes(3, "little")
    return bytes(rom)


BASE = {
    1: [("label", "a"), (0x00, 1, 2),
        (0x15, 0x80091E, 5, "b"),                # JumpIfEquals8 on a shifted WRAM variable
        (0x1C, 0x100, 0),                        # ShowDialog
        (0x0A, 1),                               # ScreenFadein
        ("label", "b"), (0x13, 10), (0x12, "a"), (0x10,)],
    2: [("label", "a"), (0x13, 1), (0x12, "a"), (0x10,)],      # after script 1: moves when script 1 changes size
}


def variant(f):
    s = {k: list(v) for k, v in BASE.items()}
    f(s)
    return aidiff.decode_rom(make_rom(s))


def counts(us, ot, region):
    c = {}
    for cm in aidiff.compare_roms(us, ot, region):
        c["same"] = c.get("same", 0) + cm.same
        for d in cm.diffs:
            c[d.kind] = c.get(d.kind, 0) + 1
        assert not cm.entry_mismatch, cm.entry_mismatch
    return c


def test_synthetic():
    us = aidiff.decode_rom(make_rom(BASE))
    assert all(s.clean for s in us.scripts)
    # identical
    c = counts(us, aidiff.decode_rom(make_rom(BASE)), "EU")
    assert c.keys() == {"same"}
    # DE: WRAM +6 -> only (a)
    def de(s): s[1][2] = (0x15, 0x800924, 5, "b")
    c = counts(us, variant(de), "DE")
    assert c.get("ram") == 1 and set(c) == {"same", "ram"}, c
    # the same change as JP: not a DE shift -> (c)
    c = counts(us, variant(de), "JP")
    assert c.get("operand") == 1 and "ram" not in c, c
    # JP: -32
    def jp(s): s[1][2] = (0x15, 0x8008FE, 5, "b")
    c = counts(us, variant(jp), "JP")
    assert c.get("ram") == 1 and set(c) == {"same", "ram"}, c
    # a $7F address never counts as a shift, nor does an address below the shift threshold
    def flag(s): s[1][2] = (0x15, 0x7F1F1F, 5, "b")
    c = counts(us, variant(flag), "DE")
    assert c.get("operand") == 1 and "ram" not in c, c
    # EU: ScreenFadein removed -> (d) + pointer relocation (b) inside script 1 and in script 2 (starts moved)
    def eu(s): del s[1][4]
    c = counts(us, variant(eu), "EU")
    assert c.get("cmd") == 1 and c.get("ptr") == 2, c      # JumpIfEquals8 -> b moved, and Jump a in script 2 (start moved)
    # operand change (c): dialog id
    def op(s): s[1][3] = (0x1C, 0x101, 0)
    c = counts(us, variant(op), "EU")
    assert c.get("operand") == 1 and set(c) == {"same", "operand"}, c
    # added command
    def add(s): s[1].insert(5, (0x0B, 3))
    c = counts(us, variant(add), "JP")
    assert c.get("cmd") == 1 and c.get("ptr") == 2, c
    # a jump that now leads to a different command is flagged
    def retarget(s): s[1][-2] = (0x12, "b")
    c = counts(us, variant(retarget), "EU")
    assert c.get("ptr!") == 1, c
    # statistics: positional bytes differ, aligned bytes explain them
    st = aidiff.stats(us, variant(eu), "EU", aidiff.compare_roms(us, variant(eu), "EU"))
    assert st[0xB3]["bytes_removed"] == 2 and st[0xB3]["cmd_us"] == 1


def test_built_tree():
    if not any((p / "asar").is_file() or (p / "asar.exe").is_file() for p in [ROOT / "tools" / "bin"]):
        import shutil
        if not shutil.which("asar"):
            print("  (asar not found: skipping the built-tree checks)")
            return
    roms = aidiff.build_roms()
    for r, rom in roms.items():
        assert all(s.clean for s in rom.scripts), r
    us = roms["US"]
    res = {}
    for r in ("EU", "DE", "JP"):
        cms = aidiff.compare_roms(us, roms[r], r)
        res[r] = cms
        assert not any(cm.entry_mismatch for cm in cms), r
        assert not any(d.kind in ("operand", "ptr!") for cm in cms for d in cm.diffs), r
    def cmds(r):
        return [(d.script, [c.addr for c in d.us], [c.name for c in d.other]) for cm in res[r] for d in cm.diffs if d.kind == "cmd"]
    assert cmds("EU") == cmds("DE") == [(0x08, [0xB3E4F6], []), (0x08, [0xB3E565], []), (0x0F, [], ["AICMD0x0C_WaitForScriptFlag"])]
    assert cmds("JP") == [(0x46, [], ["AICMD0x09_StartScript"])]
    ram = {r: sum(1 for cm in res[r] for d in cm.diffs if d.kind == "ram") for r in res}
    assert ram == {"EU": 0, "DE": 459, "JP": 459}, ram
    assert roms["EU"].head == roms["DE"].head == roms["JP"].head == us.head
    # EU and DE differ by the RAM shift only
    for cm in aidiff.compare_roms(roms["EU"], roms["DE"], "DE"):
        assert all(d.kind == "ram" for d in cm.diffs), [d.kind for d in cm.diffs]
    # the generated block of the document is current
    doc = (ROOT / "docs" / "regions-ai.md").read_text()
    text, _ = aidiff.report(roms)
    assert f"{aidiff.MD_BEGIN}\n\n{text}\n\n{aidiff.MD_END}" in doc, "docs/regions-ai.md is stale: run tools/analysis/aidiff.py --built --md docs/regions-ai.md"


def main():
    for name, fn in sorted(globals().items()):
        if name.startswith("test_") and callable(fn):
            fn()
            print("ok", name)
    return 0


if __name__ == "__main__":
    sys.exit(main())
