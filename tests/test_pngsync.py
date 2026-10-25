#!/usr/bin/env python3
"""Tests for tools/gfx/pngsync.py.  Run: python3 tests/test_pngsync.py  (needs Pillow)"""
import argparse
import importlib.util
import random
import shutil
import sys
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT / "tools" / "gfx"))
sys.path.insert(0, str(ROOT / "tools" / "data"))
sys.path.insert(0, str(ROOT / "tools" / "objects"))
import pngsync as P  # noqa: E402
import palette_map as PM  # noqa: E402
import tiles as T  # noqa: E402
import bankbin as BB  # noqa: E402

FAILS = []


def check(cond, msg):
    if not cond:
        FAILS.append(msg)
        print("FAIL: " + msg)


def ns(**kw):
    d = dict(label=None, kind=None, allow_resize=False)
    d.update(kw)
    return argparse.Namespace(**d)


def test_sheet_matches_reference():
    rnd = random.Random(7)
    for bpp in (2, 4, 8):
        for tpr in (1, 5, 16):
            size = P.TILE_BYTES[bpp] * 37
            raw = bytes(rnd.randrange(256) for _ in range(size))
            w, h, pix = P.decode_sheet(raw, bpp, tpr)
            ref = T.to_image(raw, bpp, tpr)
            check(ref.size == (w, h) and ref.tobytes() == pix, f"decode differs from tiles.py (bpp {bpp}, tpr {tpr})")
            back = P.encode_sheet(pix, w, h, bpp, tpr, size)
            check(back == raw, f"sheet round trip failed (bpp {bpp}, tpr {tpr})")


def test_sheet_errors():
    raw = bytes(32 * 4)
    w, h, pix = P.decode_sheet(raw, 4, 4)
    bad = bytearray(pix)
    bad[3] = 16
    try:
        P.encode_sheet(bytes(bad), w, h, 4, 4, len(raw))
        check(False, "index >= 2^bpp must be rejected")
    except ValueError:
        pass
    try:
        P.encode_sheet(pix, w + 8, h, 4, 4, len(raw))
        check(False, "wrong width must be rejected")
    except ValueError:
        pass


def test_nametable_text():
    rnd = random.Random(3)
    for n in (2, 64, 2048, 6144):
        raw = bytes(rnd.randrange(256) for _ in range(n))
        for cols in (32, 128):
            check(P.parse_nametable(P.nametable_text(raw, cols)) == raw, f"name table text round trip {n}/{cols}")
    check(P.parse_nametable(P.nametable_text(b"\x01\x02\x03")) == b"\x01\x02\x03", "odd length name table")
    try:
        P.parse_nametable("12G4")
        check(False, "bad token must be rejected")
    except ValueError:
        pass


def test_tail_fields():
    for tail in (b"", b"\x00", b"\x00\x00", bytes(range(1, 200)) + bytes(5), b"\x01"):
        meta = P.split_tail(tail)
        check(P.join_tail(meta) == tail, f"tail round trip {tail[:4].hex()}")


def make_tree(tmp, labels):
    for sub in ("assets/gfx/tiles", "src/data/gfx/tiles", "assets/gfx/palettes"):
        (tmp / sub).mkdir(parents=True)
    shutil.copy(ROOT / "src/data/gfx/tiles/bank_92.asm", tmp / "src/data/gfx/tiles/bank_92.asm")
    for l in labels:
        shutil.copy(ROOT / "assets/gfx/tiles" / f"{l}.bin", tmp / "assets/gfx/tiles" / f"{l}.bin")
    pad = tmp / "assets/gfx/tiles/Padding_920000.bin"
    return pad


def bank_total(tmp):
    org, sized = BB.sizes_from_asm(tmp / "src/data/gfx/tiles/bank_92.asm", tmp / "assets/gfx/tiles")
    return sum(s for _, s in sized)


def test_import_flow():
    labels = ["sCompressedTiles_928000", "sCompressedTiles_9282CB", "sCompressedTiles_929D10",
              "sCompressedTiles_92BB03", "sCompressedTiles_92D3AB"]
    with tempfile.TemporaryDirectory() as d:
        tmp = Path(d)
        make_tree(tmp, labels)
        # the copied bank asm lists only blobs of bank $92, which is what we copied
        a = ns()
        P.cmd_export(a, tmp)
        check(P.cmd_check(a, tmp) == 0, "fresh export must pass check")
        check(P.cmd_import(a, tmp) == 0, "import of unchanged sources")
        before = (tmp / "assets/gfx/tiles/sCompressedTiles_9282CB.bin").read_bytes()
        check(bank_total(tmp) == BB.BANK, "bank size before")

        # shrink: blank graphic -> stream is padded with zeros, layout unchanged
        from PIL import Image
        b = P.Blob("tiles", "sCompressedTiles_9282CB", tmp)
        im = Image.open(b.art)
        im.paste(0, (0, 0, im.width, im.height))
        im.save(b.art)
        P.cmd_import(ns(label=[b.label]), tmp)
        after = b.bin.read_bytes()
        check(len(after) == len(before) and after != before, "shrunk blob keeps its size")
        check(P.cmd_check(ns(), tmp) == 0, "check after shrink")
        check(bank_total(tmp) == BB.BANK, "bank size after shrink")

        # grow: noisy graphic -> refused without the flag, padding adjusted with it
        rnd = random.Random(5)
        px = im.load()
        for y in range(48):
            for x in range(im.width):
                px[x, y] = rnd.randrange(16)
        im.save(b.art)
        try:
            P.cmd_import(ns(label=[b.label]), tmp)
            check(False, "growth must be refused without --allow-resize")
        except SystemExit:
            pass
        P.cmd_import(ns(label=[b.label], allow_resize=True), tmp)
        check(len(b.bin.read_bytes()) > len(before), "blob grew")
        check(bank_total(tmp) == BB.BANK, "bank size after growth is still 0x8000")
        check(P.cmd_check(ns(), tmp) == 0, "check after growth")
        # bad index
        meta = P.read_meta(b)
        meta["bpp"] = 2
        P.write_meta(b, meta)
        try:
            P.source_payload(b, meta)
            check(False, "index above 2bpp range must be rejected")
        except ValueError:
            pass


def test_real_blobs():
    allb = P.blobs()
    kinds = {k: sum(1 for b in allb if b.kind == k) for k in P.KINDS}
    check(kinds == {"tiles": 77, "sprites": 10, "tilemaps": 64}, f"blob inventory {kinds}")
    check(P.cmd_check(ns()) == 0, "all committed .bin files must be reproducible from PNG / text")
    conf = {}
    for b in allb:
        m = P.read_meta(b)
        if b.kind != "tilemaps":
            conf[m["bpp_confidence"]] = conf.get(m["bpp_confidence"], 0) + 1
    print("bpp confidence:", conf)


def png_palette(path):
    """(PLTE as list of RGB triples, tRNS bytes or None) of a PNG file."""
    from PIL import Image
    im = Image.open(path)
    raw = im.getpalette()
    pal = [tuple(raw[i:i + 3]) for i in range(0, len(raw), 3)]
    return pal, im.info.get("transparency")


def test_palette_map_matches_sources():
    cur = PM.build()
    check(PM.OUT.read_text(encoding="utf-8") == PM.dumps(cur), "assets/gfx/palette_map.json is stale (run tools/gfx/palette_map.py build)")
    check(PM.doc_table_ok(cur), "table in docs/formats/graphics-palettes.md is stale (run tools/gfx/palette_map.py table)")
    check(PM.main(["check"]) == 0, "palette_map.py check")


def test_palette_tables():
    a_pal, idx, ids = PM.parse_palette_tables()
    check(len(a_pal) == 0x75 and len(set(a_pal)) == 0x75, "aPalettes: 0x75 distinct labels")
    check(a_pal[:3] == ["sPalette_0x0A", "sPalette_0x0B", "sPalette_0x0C"] and a_pal[0x6B] == "sPalette_0x6F", "aPalettes order")
    check(len(idx) == 6 * 0x60, "aMapPalettesIndexes has 6 bytes for each of the 0x60 areas")
    check(idx[:6] == [0, 1, 2, 6, 7, 0xFF], "FarmSpring slots")
    check(ids[:4] == [0x6B, 0x6C, 0x6B, 0x6C], "aMapPalettesId day/night pairs")
    areas, maps = PM.parse_maps()
    check(len(areas) == 0x60 and areas[0] == "sFarmSpringMap" and areas[0x57] == "sRainOverlay", "aTileMapData order")
    m = maps["sFarmSpringMap"]
    check(m["preset"] == 0 and [d for d, _ in m["tiles"]] == [0x2000, 0x3000, 0x4000] and m["nametables"] == [(0x6000, "sCharactermap_A18000")],
          "decoded FarmSpring map entry")
    check(maps["sRainOverlay"]["tiles"] == [(0x5000, "sCompressedTiles_928000")], "overlay maps have no preset header")
    pre = PM.parse_presets()
    lay, mode = PM.bg_layout(pre, 0)
    check(mode == 1 and lay[1]["map_addr"] == 0x6000 and lay[2]["map_addr"] == 0x7000 and lay[1]["char_base"] == 0x2000
          and lay[3]["bpp"] == 2, "preset 0 BG geometry")
    lines = ["a", "if !REGION_DE", "b", "else", "c", "endif", "d"]
    check(PM.us_lines(lines) == ["a", "c", "d"], "us_lines keeps the else branch")


def test_name_table_rule():
    """bits 10-12 of a name table word select the sub-palette of the tile it points to (synthetic sheet)."""
    old = dict(PM._RAW)
    try:
        tile = bytes([1]) + bytes(31)
        PM._RAW["T1"] = bytes(32) + tile + tile            # tile 0 empty, tiles 1 and 2 not
        nt = b"".join(w.to_bytes(2, "little") for w in (1 | 3 << 10, 1 | 3 << 10, 2 | 5 << 10, 0 | 7 << 10, 1 | 3 << 10 | 0x4000))
        PM._RAW["N1"] = nt
        layout, _ = PM.bg_layout(PM.parse_presets(), 0)
        m = {"tiles": [(0x2000, "T1")], "nametables": [(0x6000, "N1")]}
        use, bgs, notes = PM.analyse_map(m, layout)
        check(dict(use["T1"][1]) == {3: 3} and dict(use["T1"][2]) == {5: 1} and 0 not in use["T1"], f"synthetic name table use {dict(use['T1'])}")
        check(bgs["T1"] == {1}, "name table at $6000 belongs to BG1 in preset 0")
    finally:
        PM._RAW.clear()
        PM._RAW.update(old)


def test_sprite_cell_formula():
    """the sprite id -> tile position used for per-sprite previews equals the slot table of bank $86 (docs: object-data.md)."""
    import objdata as O
    d = bytes(O.load_banks()[0x86].data)
    for n in range(64):
        v = d[2 * n] | d[2 * n + 1] << 8
        check(v == (n & 7) * 2 + (n >> 3) * 0x20, f"slot table entry {n}")
    ent = {"palette": {"id": "sPalette_0x6F", "sub": 4}, "kind": "sprites",
           "sprite_rows": "".join(str(i % 8) for i in range(256))}
    b = P.Blob("sprites", "Sprites_888000")
    meta = {"raw_size": 32768, "tiles_per_row": 16}
    saved = P.palette_map()
    P._PALETTE_MAP[str(P.ROOT)] = {"blobs": {"Sprites_888000": ent}}
    try:
        subs = P.tile_sub_map(b, meta)
        for sid in (0, 1, 7, 8, 63, 64, 130, 255):
            blk, n = sid >> 6, sid & 63
            for dx, dy in ((0, 0), (1, 0), (0, 1), (1, 1)):
                v = (n & 7) * 2 + (n >> 3) * 0x20 + dx + dy * 16        # tile index inside the $2000-byte block
                t = blk * 256 + v
                check(subs[t] == sid % 8, f"sprite {sid} tile ({dx},{dy}) -> sheet tile {t}")
    finally:
        P._PALETTE_MAP[str(P.ROOT)] = saved


def test_png_palettes_are_real_colours():
    """every committed PNG carries the 16 colours of palette.sub in its PLTE; the pixel data is independent of them."""
    n = nconf = 0
    for b in P.blobs(kind="tiles") + P.blobs(kind="sprites"):
        meta = P.read_meta(b)
        pal, trns = png_palette(b.art)
        if "palette" not in meta:
            check(meta.get("palette_confidence") == "none", f"{b.label}: no palette and not flagged 'none'")
            continue
        want = P.load_view_palette(meta["palette"], 4)
        check(pal[:16] == want, f"{b.label}: PLTE differs from {meta['palette']}")
        check(meta["palette_confidence"] in ("high", "medium", "low"), f"{b.label}: confidence")
        if b.kind == "sprites":
            check(trns == 0, f"{b.label}: index 0 must be transparent")
        else:
            check(trns is None, f"{b.label}: BG sheets are opaque")
        check(meta["palette"]["sub"] in range(8), f"{b.label}: sub-palette 0-7")
        n += 1
        nconf += meta["palette_confidence"] == "high"
    check(n >= 86, f"{n} blobs have a palette")
    print(f"palettes: {n} blobs coloured, {nconf} with high confidence")


def test_palette_is_ignored_by_import():
    """re-colouring the PNG (new PLTE, no tRNS) must not change a single byte of the rebuilt .bin."""
    from PIL import Image
    rnd = random.Random(11)
    for label in ("sCompressedTiles_92D3AB", "Sprites_888000"):
        kind = "tiles" if label.startswith("sCompressed") else "sprites"
        b = P.Blob(kind, label)
        want = b.bin.read_bytes()
        with tempfile.TemporaryDirectory() as d:
            im = Image.open(b.art)
            im.putpalette([rnd.randrange(256) for _ in range(48)])
            im.info.pop("transparency", None)
            art = Path(d) / "x.png"
            im.save(art, "PNG")
            w, h, pix = P.load_png(art)
            meta = P.read_meta(b)
            raw = P.encode_sheet(pix, w, h, 4, meta["tiles_per_row"], meta["raw_size"])
            got = P.C.compress(raw) + P.join_tail(meta) if b.compressed else raw
            check(got == want, f"{label}: bytes depend on the PNG palette")


def test_export_writes_palette():
    """export in a scratch tree: PLTE = colours of the mapped sub-palette, sidecar keys, bytes unchanged."""
    labels = ["sCompressedTiles_92D3AB"]
    with tempfile.TemporaryDirectory() as d:
        tmp = Path(d)
        make_tree(tmp, labels)
        shutil.copy(ROOT / "assets/gfx/palette_map.json", tmp / "assets/gfx/palette_map.json")
        for pid in {P.palette_map()["blobs"][l]["palette"]["id"] for l in labels}:
            shutil.copy(ROOT / "assets/gfx/palettes" / f"{pid}.json", tmp / "assets/gfx/palettes" / f"{pid}.json")
        P.cmd_export(ns(label=labels), tmp)
        b = P.Blob("tiles", labels[0], tmp)
        meta = P.read_meta(b)
        ent = P.palette_map()["blobs"][labels[0]]
        check(meta["palette"] == {"id": ent["palette"]["id"], "sub": ent["palette"]["sub"]}, "sidecar palette")
        check(meta["palette_confidence"] == ent["confidence"], "sidecar confidence")
        pal, _ = png_palette(b.art)
        check(pal[:16] == P.load_view_palette(meta["palette"], 4, tmp), "exported PLTE")
        check(P.cmd_check(ns(label=labels), tmp) == 0, "check after export with palette")


def main():
    for name, fn in sorted(globals().items()):
        if name.startswith("test_"):
            fn()
            print("ran", name)
    print("FAILED" if FAILS else "ALL TESTS PASSED")
    return 1 if FAILS else 0


if __name__ == "__main__":
    sys.exit(main())
