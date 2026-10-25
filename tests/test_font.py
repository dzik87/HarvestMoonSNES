#!/usr/bin/env python3
"""Tests for tools/fonts/font.py.  Run: python3 tests/test_font.py

The US round trip from assets/ needs no ROM.  Parts that need a ROM image are skipped unless the ROMs are found
via HM_ROM_DIR (directory with US/EU/DE/JP subfolders holding the .sfc files) or HM_ROM_<REGION>.
"""
import importlib.util
import json
import os
import sys
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
spec = importlib.util.spec_from_file_location("font", ROOT / "tools" / "fonts" / "font.py")
font = importlib.util.module_from_spec(spec)
spec.loader.exec_module(font)

FAILS = []
SKIPS = []


def check(cond, msg):
    if not cond:
        FAILS.append(msg)
        print("FAIL: " + msg)


def test_geometry():
    # fDialog_GetGlyphPointer: base = (idx&7)*32 + ((idx&0x3F)>>3)*512
    check(font.locate(0x00) == (0, 0), "id 0 -> table 0 offset 0")
    check(font.locate(0x01) == (0, 0x20), "id 1 -> +$20")
    check(font.locate(0x08) == (0, 0x200), "id 8 -> +$200")
    check(font.locate(0x3F) == (0, 7 * 32 + 7 * 512), "id $3F -> last cell")
    check(font.locate(0xC9) == (3, 1 * 32 + 1 * 512), "id $C9 -> table 3")
    bases = {font.glyph_base(i) for i in range(64)}
    cells = {b + d for b in bases for d in (0, 0x10, 0x100, 0x110)}
    check(len(bases) == 64 and len(cells) == 256 and max(cells) + 16 == font.TABLE_SIZE,
          "64 glyphs x 4 tiles tile the 4096-byte table exactly")
    check(len(font.TABLE_ADDR) == font.N_TABLES and font.TABLE_ADDR[0] == 0x949843 and font.TABLE_ADDR[6] == 0x958000,
          "table addresses")


def test_pixel_codec():
    tab = bytearray(font.TABLE_SIZE)
    px = [(x * 3 + y * 5) % 4 for y in range(16) for x in range(16)]
    font.encode_glyph(tab, 10, px)
    check(font.decode_glyph(bytes(tab), 10) == px, "pixel codec round trip")
    # leftmost pixel of the top-left tile is bit 7 of plane 0 / plane 1
    t2 = bytearray(font.TABLE_SIZE)
    font.encode_glyph(t2, 0, [3] + [0] * 255)
    check(t2[0] == 0x80 and t2[1] == 0x80 and sum(t2) == 0x100, "plane/bit order")
    t3 = bytearray(font.TABLE_SIZE)
    font.encode_glyph(t3, 0, [0] * 15 + [2] + [0] * 240)      # pixel (15,0): TR tile, plane 1
    check(t3[0x10 + 1] == 0x01 and sum(t3) == 1, "right tile is at +$10")
    t4 = bytearray(font.TABLE_SIZE)
    font.encode_glyph(t4, 0, [0] * 128 + [1] + [0] * 127)     # pixel (0,8): BL tile, plane 0
    check(t4[0x100] == 0x80 and sum(t4) == 0x80, "bottom tile is at +$100")
    check(font.glyphs_to_tables({})[0][:16] == font.BG_TILE, "blank glyph = plain dither tile")


def test_us_roundtrip_from_assets():
    tables = font.read_asset_tables()
    check(len(tables) == font.N_TABLES and all(len(t) == 4096 for t in tables), "11 asset tables of 4096 bytes")
    check(font.glyphs_to_tables(font.tables_to_glyphs(tables)) == tables, "us: in-memory extract->build is byte exact")
    with tempfile.TemporaryDirectory() as d:
        out = Path(d) / "us"
        check(font.main(["extract", "--region", "us", "--out", str(out)]) == 0, "us extract to temp dir")
        check(font.glyphs_to_tables(font.load_png_dir(out)) == tables, "us: PNG files on disk rebuild byte exact")
        check(font.main(["build", "--region", "us", "--src", str(out), "--out", str(Path(d) / "b")]) == 0, "us build")
        for t in range(font.N_TABLES):
            f = Path(d) / "b" / ("%s.bin" % font.TABLE_NAME[t])
            check(f.read_bytes() == tables[t], "build output %s is identical" % font.TABLE_NAME[t])


def test_edit_changes_only_one_glyph():
    tables = font.read_asset_tables()
    g = font.tables_to_glyphs(tables)
    gid = 0x04                                   # 'e'
    px = list(g[gid])
    px[5 * 16 + 5] = 3 if px[5 * 16 + 5] != 3 else 2
    g2 = dict(g); g2[gid] = px
    t2 = font.glyphs_to_tables(g2)
    diff = [(t, o) for t in range(font.N_TABLES) for o in range(font.TABLE_SIZE) if t2[t][o] != tables[t][o]]
    base = font.glyph_base(gid)
    check(len(diff) == 1 and diff[0][0] == 0 and base <= diff[0][1] < base + 0x120,
          "editing one pixel changes exactly one byte inside that glyph")
    check(font.tables_to_glyphs(t2)[gid] == px, "edited glyph reads back")
    # blank glyph given as a file is fine, a glyph made blank loses its file
    g3 = dict(g); g3[gid] = list(font.BLANK)
    check(font.glyphs_to_tables(g3)[0][font.glyph_base(gid):font.glyph_base(gid) + 16] == font.BG_TILE, "erased glyph")


def test_png_validation():
    from PIL import Image
    with tempfile.TemporaryDirectory() as d:
        p = Path(d) / "glyph_0000.png"
        Image.new("RGB", (16, 16)).save(p)
        try:
            font.load_png_dir(d); check(False, "RGB PNG must be rejected")
        except ValueError:
            pass
        Image.new("P", (8, 16)).save(p)
        try:
            font.load_png_dir(d); check(False, "wrong size must be rejected")
        except ValueError:
            pass
        im = Image.new("P", (16, 16), 7); im.putpalette([i * 10 for i in range(24)]); im.save(p)
        try:
            font.load_png_dir(d); check(False, "index > 3 must be rejected")
        except ValueError:
            pass
        p.unlink()
        Image.new("P", (16, 16)).save(Path(d) / "glyph_0FFF.png")
        try:
            font.load_png_dir(d); check(False, "out-of-range id must be rejected")
        except ValueError:
            pass


def test_committed_assets():
    for r in font.REGIONS:
        ok, msgs = font.check_region(r, None)
        # without ROM only the PNG/sidecar part is evaluated for non-us regions
        check(ok, "%s: committed font assets consistent (%s)" % (r, "; ".join(msgs)))
    meta = json.loads((font.FONT_ASSETS / "us" / "glyphs.json").read_text(encoding="utf-8"))
    check(meta["chars"]["0000"] == "a" and meta["chars"]["001A"] == "A" and meta["chars"]["00B2"] == "0",
          "us glyphs.json maps ids to characters")
    check(meta["tables"][6]["cpu_address"] == "$958000", "sidecar table addresses")
    de = json.loads((font.FONT_ASSETS / "de" / "glyphs.json").read_text(encoding="utf-8"))
    check(de["chars"]["0043"] == "ä", "de glyphs.json maps $43 to a-umlaut")


def test_region_roms():
    us_tables = None
    for r in font.REGIONS:
        rom = font.find_rom(r)
        if not rom:
            SKIPS.append("%s ROM not available" % r)
            continue
        tables, _ = font.source_tables(r, rom)
        check(font.glyphs_to_tables(font.tables_to_glyphs(tables)) == tables, "%s: ROM extract->build exact" % r)
        ok, msgs = font.check_region(r, None)
        check(ok, "%s: check against ROM and committed PNGs (%s)" % (r, "; ".join(msgs)))
        if r == "us":
            us_tables = tables
            check(tables == font.read_asset_tables(), "us ROM font data equals assets/gfx/tiles")
        elif us_tables is not None:
            changed = [g for g in range(font.N_GLYPHS)
                       if font.decode_glyph(tables[g >> 6], g & 63) != font.decode_glyph(us_tables[g >> 6], g & 63)]
            expect = {"eu": 1, "de": 12, "jp": 80}[r]
            check(len(changed) == expect, "%s differs from us in %d glyphs (got %d)" % (r, expect, len(changed)))
    # the shared glyph tables (UNK table, tables 3-8) are identical in every region
    if us_tables is not None:
        for r in ("eu", "de", "jp"):
            rom = font.find_rom(r)
            if rom:
                t, _ = font.source_tables(r, rom)
                check(all(t[i] == us_tables[i] for i in (3, 4, 5, 6, 7, 8, 10)), "%s tables 3-8 and UNK equal us" % r)


def test_check_command():
    check(font.main(["check", "--region", "us"]) == 0, "check --region us exits 0")


def main():
    for name, fn in sorted(globals().items()):
        if name.startswith("test_") and callable(fn):
            fn()
    for s in SKIPS:
        print("SKIP: " + s)
    if FAILS:
        print("%d test(s) failed" % len(FAILS))
        return 1
    print("test_font: all tests passed")
    return 0


if __name__ == "__main__":
    sys.exit(main())
