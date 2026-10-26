#!/usr/bin/env python3
"""Tests for tools/data/tabledata.py (typed data tables).  Run: python3 tests/test_tabledata.py"""
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT / "tools" / "data"))
import tabledata as T  # noqa: E402

FAILS = []


def check(cond, msg):
    if not cond:
        FAILS.append(msg)
        print("FAIL: " + msg)


def bad(text, what):
    try:
        T.parse_source(text, "t")
    except T.SourceError:
        return
    check(False, "accepted: " + what)


def test_render():
    src = ("# doc\n@label aTab\n@columns idx:index,hp:u8,ptr:ptr16,name:note\n$00,$10,fFoo,first\n$01,5,fBar,second\n"
           "@record end op:u16=$FFFF\n@label aScript\n@columns tile:u16,delay:u8\n$0001,$04\nend:\n")
    out = T.render(T.parse_source(src, "t"), "t").split("\n")
    check("aTab:" in out and "    db $10   ; first" in out and "    dw fFoo" in out, "rows become db / dw lines: %s" % out)
    check("    dw $FFFF" in out and "    dw $0001" in out and "    db $04" in out, "record with constant")


def test_errors():
    bad("@columns a:u8\n$100\n", "value too large for u8")
    bad("@columns a:u8,b:u8\n$01\n", "wrong column count")
    bad("@columns a:u8\n@if !REGION_JP\n$01\n", "unbalanced @if")
    bad("@columns a:u9\n", "unknown type")
    bad("$01\n", "row before @columns")
    bad("@columns i:index,a:u8\n$01,$00\n", "index must count from 0")
    bad("@bogus\n", "unknown directive")
    bad("@columns a:u8\n@endif\n", "@endif without @if")


def test_index_in_branches():
    ok = "@columns i:index,a:u8\n$00,$01\n@if !REGION_JP\n$01,$02\n@else\n$01,$03\n@endif\n$02,$04\n"
    try:
        T.parse_source(ok, "t")
    except T.SourceError as e:
        check(False, "index across @if branches rejected: %s" % e)


def test_repo_sources():
    for b in T.load_manifest():
        for region in ("US", "EU", "DE", "JP"):
            rows = T.rows_of(b["name"], region, ROOT)
            check(rows, "%s has no rows for %s" % (b["name"], region))
    rows = T.rows_of("palette_tables", "US", ROOT)
    check(len(rows["aPalettes"]) == 0x75, "aPalettes has 0x75 entries")
    check(len(rows["aMapPalettesIndexes"]) == 0x60, "one index row per area")
    rows = T.rows_of("tool_sound_data_82", "EU", ROOT)["nToolSoundData_829054"]
    us = T.rows_of("tool_sound_data_82", "US", ROOT)["nToolSoundData_829054"]
    check(len(rows) == len(us) == 0x1C, "28 tool rows in every release")
    check(us[0x0B]["sfx_object_hit"] == "!SFX_BELL" and rows[0x0B]["sfx_object_hit"] == "$00", "bell sound differs between US and EU")


if __name__ == "__main__":
    test_render()
    test_errors()
    test_index_in_branches()
    test_repo_sources()
    if FAILS:
        sys.exit(1)
    print("all tests passed")
