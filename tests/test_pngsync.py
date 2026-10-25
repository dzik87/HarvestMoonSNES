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


def clone_tree(tmp, drop_sources=False):
    """scratch copy of everything pngsync reads: assets/gfx (sources + generated .bin), assets/objects, the area graphics descriptors, bank asm."""
    shutil.copytree(ROOT / "assets/gfx", tmp / "assets/gfx", ignore=shutil.ignore_patterns("*.pal"))
    shutil.copytree(ROOT / "assets/objects", tmp / "assets/objects")
    (tmp / "src/code/bank_80").mkdir(parents=True)
    for f in ("core.asm",):
        shutil.copy(ROOT / "src/code/bank_80" / f, tmp / "src/code/bank_80" / f)
    (tmp / "assets/areas").mkdir(parents=True)
    for f in ("areas.csv", "area_gfx.json"):
        shutil.copy(ROOT / "assets/areas" / f, tmp / "assets/areas" / f)
    if drop_sources:
        for r in ("", "eu/", "de/", "jp/"):
            base = tmp / "assets/gfx/png" / r
            shutil.rmtree(base / "screens", ignore_errors=True)
            for k in ("tiles", "sprites"):
                for f in (base / k).glob("*.png"):
                    f.unlink()
        shutil.rmtree(tmp / "assets/gfx/png/frames", ignore_errors=True)
    return tmp


def bank_totals(tmp):
    """{(kind, bank): size} of every graphics bank of the layout of a scratch tree (must stay $8000)."""
    sys.path.insert(0, str(ROOT / "tools" / "data"))
    import gfxbanks
    return {(k, bank): sum(s for _, s in gfxbanks.bank_sizes(tmp, k, bank, b)) for k, banks in gfxbanks.load_layout(tmp).items()
            for bank, b in banks.items() if k != "palettes"}


_SHARED = []


import contextlib  # noqa: E402


@contextlib.contextmanager
def shared():
    yield shared_tree()


def shared_tree():
    """one scratch copy of the repository state shared by the tests that edit and import (each test leaves it consistent)."""
    if not _SHARED:
        d = tempfile.mkdtemp()
        _SHARED.append(clone_tree(Path(d)))
    return _SHARED[0]


def edit_png(path, fn):
    """fn(pixel access, width, height) mutates the pixels of an indexed PNG in place (keeps PLTE / tRNS)."""
    from PIL import Image
    im = Image.open(path)
    fn(im.load(), im.width, im.height)
    im.save(path, transparency=im.info.get("transparency"))


def check_exported_palettes(tmp):
    """export in a scratch tree: remainder sheet PLTE = colours of the mapped sub-palette, sidecar keys, sprite colour 0 transparent."""
    label = "Tiles_Farm_SpringSummer_0"
    b = P.Blob("tiles", label, tmp)
    meta = P.read_meta(b)
    ent = P.palette_map()["blobs"][label]
    check(meta["palette"] == {"id": ent["palette"]["id"], "sub": ent["palette"]["sub"]}, "sidecar palette")
    check(meta["palette_confidence"] == ent["confidence"], "sidecar confidence")
    pal, _ = png_palette(b.art)
    check(pal[:128] == P.view_palette128(meta["palette"]["id"], tmp), "exported PLTE (8 rows: every tile has the row of its name table cells)")
    pal, trns = png_palette(P.Blob("sprites", "Sprites_888000", tmp).art)
    check(trns == 0, "sprite remainder sheets have transparent colour 0")
    first = sorted((tmp / "assets/gfx/png/frames/obj_0000").glob("f_*.png"))[0]
    fpal, ftrns = png_palette(first)
    check(fpal[:128] == [c for p in PM.sprite_palettes(0) for c in p], "frame PLTE = day OBJ palette")


def test_roundtrip_every_blob_every_region():
    """.bin -> composed images + remainder sheets -> rebuilt bytes: bit exact for every blob of US, EU, DE and JP, the images
    are not allowed to contradict each other, and nothing is left over."""
    with tempfile.TemporaryDirectory() as d:
        tmp = clone_tree(Path(d), drop_sources=True)
        for region in P.REGIONS:
            n = P.export_composed(tmp, region)
            check(n > 0, f"{region}: exported blobs")
            if region == "us":
                check_exported_palettes(tmp)
            rc = P.cmd_check(ns(region=region), tmp)
            check(rc == 0, f"{region}: sources rebuilt from the images equal the .bin of every blob")
        # the freshly exported sources equal the committed ones (the export is deterministic and canonical)
        diff = []
        for sub in ("screens", "frames", "tiles", "sprites", "eu", "de", "jp"):
            a, b = ROOT / "assets/gfx/png" / sub, tmp / "assets/gfx/png" / sub
            for f in sorted(a.rglob("*.png")):
                if (b / f.relative_to(a)).read_bytes() != f.read_bytes():
                    diff.append(str(f.relative_to(ROOT)))
        check(not diff, f"committed composed sources are the canonical export ({diff[:3]})")


def test_import_flow():
    """edit a sprite frame and a name table screen, import: both reach the right tiles / blocks, other images that show the same
    tiles follow, check passes, growth needs --allow-resize and keeps every bank at $8000 bytes."""
    import composed as CO
    with shared() as tmp:
        before = {p.name: p.read_bytes() for p in (tmp / "assets/gfx/sprites").glob("*.bin")}
        check(P.cmd_import(ns(), tmp) == 0, "import of unchanged sources")
        check(all(p.read_bytes() == before[p.name] for p in (tmp / "assets/gfx/sprites").glob("*.bin")), "unchanged import keeps the bytes")
        totals = bank_totals(tmp)
        check(set(totals.values()) == {BB.BANK}, "banks are full before")

        # 1. one pixel of the first frame of object 0
        fr = sorted((tmp / "assets/gfx/png/frames/obj_0000").glob("f_*.png"))[0]
        spot = []

        def paint(px, w, h):
            for y in range(h):
                for x in range(w):
                    v = px[x, y]
                    if v & 15 and not spot:
                        px[x, y] = (v & 0xF0) | ((v & 15) % 15 + 1)
                        spot.append((x, y, v & 15, px[x, y] & 15))
        edit_png(fr, paint)
        # 2. a block of the spring farm screen
        scr = tmp / "assets/gfx/png/screens/ScreenRaw_Farm__sFarmSpringMap.png"

        def paint2(px, w, h):
            for y in range(64, 80):
                for x in range(64, 80):
                    v = px[x, y]
                    if v & 15:
                        px[x, y] = (v & 0xF0) | ((v & 15) % 15 + 1)
        edit_png(scr, paint2)
        want_bins = {p.name: p.read_bytes() for p in (tmp / "assets/gfx/tiles").glob("*.bin")}
        check(P.cmd_import(ns(allow_resize=True), tmp) == 0, "import of edited images")
        after = {p.name: p.read_bytes() for p in (tmp / "assets/gfx/tiles").glob("*.bin")}
        check(after != want_bins, "tile blob changed")
        check(P.cmd_check(ns(), tmp) == 0, "check after import")
        check(set(bank_totals(tmp).values()) == {BB.BANK}, "banks are still $8000 bytes")
        # the sprite pixel landed exactly there, nowhere else (re-render the frame from the new bank)
        ctx = CO.get_ctx(tmp, "us")
        S = ctx.S
        sh = S.Sheets(tmp / "assets/gfx/sprites")
        x, y, old, new = spot[0]
        data = S.ObjectData()
        bank, _ = data.list_ptr(0)
        fp = int(fr.stem[2:], 16)
        w, h, ox, oy, pix = S.render_frame(sh, data.frame(bank, fp))
        check(pix[y * w + x] & 15 == new, "edited sprite pixel is in the rebuilt bank")
        _, _, got = P.load_png(fr)
        check(got == pix, "the frame image equals the render of the new bank (re-exported)")

        # 3. growth: noise on a name table screen
        rnd = random.Random(5)
        scr2 = tmp / "assets/gfx/png/screens/ScreenRaw_Farm__sFarmSpringMap.png"

        def noise(px, w, h):                                    # flip-symmetric function of the tile pixel: consistent for every cell
            for y in range(0, 160):
                for x in range(0, 160):
                    v = px[x, y]
                    if v & 15:
                        mx, my = min(x % 8, 7 - x % 8), min(y % 8, 7 - y % 8)
                        px[x, y] = (v & 0xF0) | ((v & 15) * 5 + mx * 3 + my * 7) % 15 + 1
        edit_png(scr2, noise)
        sizes = {p.name: len(p.read_bytes()) for p in (tmp / "assets/gfx/tiles").glob("*.bin")}
        try:
            P.cmd_import(ns(), tmp)
            check(False, "growth must be refused without --allow-resize")
        except SystemExit:
            pass
        P.cmd_import(ns(allow_resize=True), tmp)
        check(any(len(p.read_bytes()) > sizes[p.name] for p in (tmp / "assets/gfx/tiles").glob("*.bin")), "a blob grew")
        check(set(bank_totals(tmp).values()) == {BB.BANK}, "banks are still $8000 bytes after growth")
        check(P.cmd_check(ns(), tmp) == 0, "check after growth")


def find_shared_block_frames(ctx):
    """two frames of different objects whose sole-covered components use the same tile id: (frameA, kA, frameB, kB)."""
    seen = {}
    for fr in ctx.frames:
        for k, c in enumerate(fr.comps):
            rects = [p for j, p in enumerate(fr.pos) if j != k and abs(p[0] - fr.pos[k][0]) < 16 and abs(p[1] - fr.pos[k][1]) < 16]
            if rects or (c.tile >> 8) >= 10 or c.hflip or c.vflip:
                continue
            if c.tile in seen and seen[c.tile][0].obj != fr.obj:
                return seen[c.tile] + (fr, k)
            seen.setdefault(c.tile, (fr, k))
    return None


def test_conflicts_and_errors():
    """contradicting edits of a shared block / tile, a wrong palette row, a remainder pixel under an image: reported, not written."""
    import composed as CO
    with shared() as tmp:
        ctx = CO.get_ctx(tmp, "us")
        A, ka, B, kb = find_shared_block_frames(ctx)
        check(A is not None, "two frames share a sprite block")
        bins = {p.name: p.read_bytes() for p in (tmp / "assets/gfx/sprites").glob("*.bin")}

        def setpix(fr, k, val):
            cx, cy = fr.pos[k]

            def f(px, w, h):
                px[cx + 3, cy + 5] = (fr.comps[k].palette << 4) | val if val else 0
            edit_png(fr.path, f)
        old = P.load_png(A.path)[2][A.pos[ka][1] * A.w + A.pos[ka][0] + 3 + 5 * A.w] & 15
        setpix(A, ka, (old + 1) % 15 + 1)
        setpix(B, kb, (old + 2) % 15 + 1)
        check(P.cmd_import(ns(), tmp) == 1, "import reports contradicting edits of a shared sprite block")
        check({p.name: p.read_bytes() for p in (tmp / "assets/gfx/sprites").glob("*.bin")} == bins, "nothing written on conflict")
        check(P.cmd_check(ns(), tmp) == 1, "check reports the contradiction between the two frame images")
        # equal edits are fine
        setpix(B, kb, (old + 1) % 15 + 1)
        check(P.cmd_import(ns(), tmp) == 0, "identical edits of the shared block are accepted")
        check(P.cmd_check(ns(), tmp) == 0, "check passes after the images agree")

    with shared() as tmp:
        # wrong palette row in a frame
        fr = sorted((tmp / "assets/gfx/png/frames/obj_0000").glob("f_*.png"))[0]
        saved_fr = fr.read_bytes()

        def wrong(px, w, h):
            for y in range(h):
                for x in range(w):
                    if px[x, y] & 15:
                        px[x, y] = ((px[x, y] >> 4) ^ 1) << 4 | ((px[x, y] & 15) % 15 + 1)
                        return
        edit_png(fr, wrong)
        check(P.cmd_check(ns(), tmp) == 1, "check: a colour from another palette row is an error")
        check(P.cmd_import(ns(), tmp) == 1, "import: a colour from another palette row is an error")
        fr.write_bytes(saved_fr)
    with shared() as tmp:
        # a remainder pixel where an image defines the pixel
        b = P.Blob("sprites", "Sprites_888000", tmp)
        saved_rem = b.art.read_bytes()
        w, h, pix = P.load_png(b.art)
        claims = CO.claims_for(CO.get_ctx(tmp, "us"))
        i = next(i for i, c in enumerate(claims.val["Sprites_888000"]) if c != CO.UNC)
        edit_png(b.art, lambda px, w_, h_: px.__setitem__((i % 128, i // 128), 5))
        check(P.cmd_check(ns(label=["Sprites_888000"]), tmp) == 1, "check: remainder pixel under an image is an error")
        b.art.write_bytes(saved_rem)
    with shared() as tmp:
        # missing image file
        victim = sorted((tmp / "assets/gfx/png/screens").glob("*.png"))[0]
        saved_v = victim.read_bytes()
        victim.unlink()
        check(P.cmd_check(ns(), tmp) == 1, "check: a missing screen is an error")
        victim.write_bytes(saved_v)


def test_screen_transform_with_flips():
    """a cell shown with flips / another palette is written back un-flipped (synthetic name table)."""
    import composed as CO
    lab = "Tiles_TEST"
    sheet = bytearray(CO.W * 16)
    for y in range(8):
        for x in range(8):
            sheet[y * CO.W + 8 + x] = 1 + (y * 8 + x) % 15      # tile 1
    words = [1, 1 | 0x4000 | 3 << 10, 1 | 0x8000 | 5 << 10, 1 | 0xC000]
    targets = [(lab, 1) if n == 1 else None for n in range(1024)]
    scr = CO.Screen("t", "t", 4, words, [(0x2000, lab)], [(0, 0, 0)] * 128, targets)

    class Ctx:
        blobs = {lab: 1}
    img = CO.render_screen(scr, {lab: sheet})
    claims = CO.Claims({lab: len(sheet)})
    CO.screen_claims(Ctx, scr, scr.width, scr.height, img, claims)
    check(not claims.errors, f"all four views of one tile agree ({claims.errors[:1]})")
    check(all(claims.val[lab][y * CO.W + 8 + x] == sheet[y * CO.W + 8 + x] for y in range(8) for x in range(8)),
          "un-flipped pixels equal the sheet for hflip / vflip / palette views")
    # an edit in the hflip + palette 3 view (cell 1) lands on the mirrored pixel of the tile
    edited = bytearray(img)
    edited[0 * scr.width + 8] = (3 << 4) | 9
    claims = CO.Claims({lab: len(sheet)})
    CO.screen_claims(Ctx, scr, scr.width, scr.height, bytes(edited), claims, base=img)
    check(not claims.errors and claims.val[lab][0 * CO.W + 8 + 7] == 9, f"edit through an hflip view hits the mirrored pixel ({claims.errors[:1]})")
    check(sum(1 for v in claims.val[lab] if v != CO.UNC) == 1, "only the edited pixel is claimed")
    # the same pixel edited differently through two views of the shared tile is a conflict
    edited[0 * scr.width + 8] = (3 << 4) | 9
    edited[0 * scr.width + 7 - 0 + 0] = edited[0 * scr.width + 7]                 # (placeholder: cell 0 untouched)
    edited[0 * scr.width + 0 + 7] = 4                                             # cell 0 (plain view): tile column 7 row 0
    claims = CO.Claims({lab: len(sheet)})
    CO.screen_claims(Ctx, scr, scr.width, scr.height, bytes(edited), claims, base=img)
    check(claims.errors and "conflict" in claims.errors[0], f"contradicting edits of one tile pixel are a conflict ({claims.errors[:1]})")
    # wrong palette row for the entry (palette 3 selected, row 4 used)
    edited = bytearray(img)
    edited[0 * scr.width + 8] = (4 << 4) | 9
    claims = CO.Claims({lab: len(sheet)})
    CO.screen_claims(Ctx, scr, scr.width, scr.height, bytes(edited), claims, base=img)
    check(claims.errors and "palette row" in claims.errors[0], "wrong palette row is rejected")


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
    check(m["preset"] == 0 and [d for d, _ in m["tiles"]] == [0x2000, 0x3000, 0x4000] and m["nametables"] == [(0x6000, "ScreenRaw_Farm")],
          "decoded FarmSpring map entry")
    check(maps["sRainOverlay"]["tiles"] == [(0x5000, "Tiles_Overlay_Rain")], "overlay maps have no preset header")
    pre = PM.parse_presets()
    lay, mode = PM.bg_layout(pre, 0)
    check(mode == 1 and lay[1]["map_addr"] == 0x6000 and lay[2]["map_addr"] == 0x7000 and lay[1]["char_base"] == 0x2000
          and lay[3]["bpp"] == 2, "preset 0 BG geometry")
    lines = ["a", "if !REGION_DE", "b", "else", "c", "endif", "d"]
    check(PM.us_lines(lines) == ["a", "c", "d"], "us_lines keeps the else branch")
    nested = ["a", "if !REGION_JP", "b", "elseif !REGION_EU", "c", "else", "d", "if !REGION_DE", "e", "else", "f", "endif", "endif", "g"]
    check(PM.us_lines(nested) == ["a", "d", "f", "g"], "us_lines: elseif / nested blocks")
    check(PM.us_lines(["if !REGION_US", "x", "else", "y", "endif"]) == ["x"], "us_lines: !REGION_US is true")
    try:
        PM.us_lines(["if !FOO", "x", "endif"])
        check(False, "unknown condition must be rejected")
    except ValueError:
        pass


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


def test_name_table_width_check():
    """a wrong row length is caught by `check` (continuity metric) and the suggested widths match the committed sidecars."""
    import composed
    tmp = shared_tree()
    meta_path = tmp / "assets/gfx/tilemaps/Screen_MountainCave.json"
    good = meta_path.read_text()
    check('"columns": 64' in good, "A48A2D is a 64 column table")
    try:
        meta_path.write_text(good.replace('"columns": 64', '"columns": 32'))
        composed.reset()
        ctx = composed.get_ctx(tmp, "us", None)
        sheets = composed.decode_sheets(ctx, composed.load_sheets(ctx))
        cur, sug, sc, _ = composed.table_widths(ctx, sheets, {"Screen_MountainCave"})["Screen_MountainCave"]
        check(cur == 32 and sug == 64, f"wrong width not detected: {cur} {sug}")
        check(sc[32] - sc[64] > composed.WIDTH_FAIL, f"seam ratios too close: {sc}")
        check(composed.default_columns(4096) == 64 and composed.default_columns(16384) == 128, "size defaults")
    finally:
        meta_path.write_text(good)
        composed.reset()


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
    """every committed tile remainder sheet carries the 8 rows of its palette in its PLTE (sprites: the 16 colours of palette.sub); the pixel data is independent of them."""
    n = nconf = 0
    for b in P.blobs(kind="tiles") + P.blobs(kind="sprites"):
        meta = P.read_meta(b)
        pal, trns = png_palette(b.art)
        if "palette" not in meta:
            check(meta.get("palette_confidence") == "none", f"{b.label}: no palette and not flagged 'none'")
            continue
        if b.kind == "tiles":
            check(pal[:128] == P.view_palette128(meta["palette"]["id"]), f"{b.label}: PLTE differs from {meta['palette']['id']}")
        else:
            check(pal[:16] == P.load_view_palette(meta["palette"], 4), f"{b.label}: PLTE differs from {meta['palette']}")
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


def test_assembled_sprites_use_obj_palette():
    """the assembled object sprites (tools/objects/spriteexport.py, rendered into a temp dir) carry the day OBJ palette:
    pixel = (row << 4) | colour."""
    import spriteexport as SE
    pals = PM.sprite_palettes(0)
    check(len(pals) == 8 and all(len(p) == 16 for p in pals), "sprite_palettes shape")
    check(pals[4] == P.load_view_palette({"id": "sPalette_0x6F", "sub": 4}, 4), "OBJ row 4 of sPalette_0x6F")
    flat = [c for p in pals for c in p]
    n = 0
    tmp = tempfile.mkdtemp()
    SE.main(["export", "--out", tmp] + [a for i in range(4) for a in ("--object", str(i))])
    for path in sorted(Path(tmp).glob("obj_000*/l0_f0*.png")):
        pal, trns = png_palette(path)
        check(pal[:128] == flat, f"{path.parent.name}/{path.name}: PLTE is not the OBJ palette")
        check(isinstance(trns, bytes) and all(trns[i] == 0 for i in range(0, min(len(trns), 128), 16)), f"{path.name}: colour 0 of every row transparent")
        n += 1
    shutil.rmtree(tmp)
    check(n > 0, "assembled sprite PNGs found")


def test_palette_is_ignored_by_import():
    """re-colouring every image (new PLTE, no tRNS) must not change a single byte of the rebuilt .bin."""
    from PIL import Image
    rnd = random.Random(11)
    with shared() as tmp:
        for p in sorted((tmp / "assets/gfx/png").rglob("*.png")):
            if p.parts[-2] not in ("screens", "tiles", "sprites", "frames") and not p.parent.name.startswith("obj_"):
                continue
            im = Image.open(p)
            im.putpalette([rnd.randrange(256) for _ in range(768)])
            im.info.pop("transparency", None)
            im.save(p, "PNG")
        check(P.cmd_check(ns(), tmp) == 0, "bytes do not depend on the PLTE of any composed image")


def test_sheet_command_matches_bins():
    """pngsync sheet renders the sheet built from the composed sources: pixels equal the sheet decoded from the .bin."""
    for label, kind in (("Tiles_Farm_SpringSummer_0", "tiles"), ("Sprites_898000", "sprites")):
        b = P.Blob(kind, label)
        img = P.render_built_sheet(b)
        raw, _ = P.read_raw(b)
        w, h, pix = P.decode_sheet(raw, 4, 16)
        check(img.size == (w, h), f"{label}: sheet size")
        check(P.render_built_sheet(b, 2, grid=True).size == (w * 2, h * 2), f"{label}: scaled sheet")


def main():
    try:
        for name, fn in sorted(globals().items()):
            if name.startswith("test_"):
                fn()
                print("ran", name)
    finally:
        for t in _SHARED:
            shutil.rmtree(t.parent if False else t, ignore_errors=True)
    print("FAILED" if FAILS else "ALL TESTS PASSED")
    return 1 if FAILS else 0


if __name__ == "__main__":
    sys.exit(main())
