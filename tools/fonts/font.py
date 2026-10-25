#!/usr/bin/env python3
"""Font converter: ROM font glyph tables <-> one editable PNG per glyph, byte-exact round trip.

Format (details and evidence in docs/formats/font.md):
  * The font is stored in 11 tables of 4096 bytes (sFontGlyphs_0x00..0x09 plus the dialog font tiles sFontGlyphs_Dialog),
    64 glyphs per table.  Glyph id = dialog word value; table = id >> 6, index = id & $3F.
  * A glyph is 16x16 pixels, 2bpp SNES planar: four 8x8 tiles of 16 bytes
        TL = base, TR = base + $10, BL = base + $100, BR = base + $110,   base = (idx & 7) * 32 + (idx >> 3) * 512
  * Pixel value 0..3 (plane 0 = bit 0, plane 1 = bit 1).  Values 0/1 form the dialog-window background dither
    ((x + y) even -> 1, odd -> 0) that is baked into every glyph, values 2/3 are the letter (3 = ink, 2 = soft edge).

Editable output: assets/fonts/<region>/glyph_<ID4hex>.png (16x16 or, for 8 px wide glyphs, 8x16 indexed PNG, 4-colour palette, index = SNES pixel
value) and assets/fonts/<region>/glyphs.json (id -> character, table layout, SHA-256 of every table).
A glyph whose 256 pixels are exactly the plain dither has no PNG file; it is regenerated on build.

Commands:
    extract --region R [--rom PATH] [--out DIR]   ROM (or assets/gfx/tiles for us) -> PNGs + glyphs.json
    build   --region R [--src DIR] [--out DIR] [--write-assets]   PNGs -> sFontGlyphs_*.bin
    check   [--region R]... [--rom-dir DIR]       round trip must reproduce every byte (exit 1 otherwise)
    narrow  --region R                            convert committed PNGs to 8x16 where the engine draws 8 px wide
    seal    --region R                            recompute the SHA-256 values in glyphs.json after an edit
    sheet   --region R [--out FILE]               contact sheet of all glyphs (for viewing only)
"""
import argparse, glob, hashlib, importlib.util, json, os, re, sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
ASSETS_TILES = ROOT / "assets" / "gfx" / "tiles"
FONT_ASSETS = ROOT / "assets" / "fonts"
BUILD_DIR = ROOT / "build" / "fonts"
REGIONS = ("us", "eu", "de", "jp")

TABLE_SIZE = 0x1000
GLYPHS_PER_TABLE = 64
N_TABLES = 11                    # 0..9 are referenced by aLetterGlyphsPointers, 10 = sFontGlyphs_Dialog (loaded by the dialog code)
N_GLYPHS = N_TABLES * GLYPHS_PER_TABLE
TABLE_ADDR = [0x949843 + 0x1000 * i for i in range(6)] + [0x958000 + 0x1000 * i for i in range(4)] + [0x9CBBA3]
TABLE_NAME = ["sFontGlyphs_0x%02X" % i for i in range(10)] + ["sFontGlyphs_Dialog"]
# 10 x ptr24 of aLetterGlyphsPointers (identical bytes in all four regions), used to sanity check a ROM
POINTER_TABLE = b"".join(a.to_bytes(3, "little") for a in TABLE_ADDR[:10])
NARROW_IDS = list(range(0xBC, 0xC6)) + [0x270]    # JP engine draws these 8 px wide (type 0), all others 16 px

# SNES-style preview palette; index == pixel value.  Real colours come from the dialog palette at run time.
PALETTE = [(0xFF, 0xFF, 0xFF), (0xE0, 0xE0, 0xE0), (0x80, 0x90, 0xB0), (0x10, 0x10, 0x10)]
BG_TILE = bytes([0xAA, 0x00, 0x55, 0x00] * 4)


def require_pil():
    try:
        from PIL import Image
        return Image
    except ImportError:
        sys.exit("error: Pillow is required (pip install pillow)")


# ---------------------------------------------------------------- geometry / pixel codec
def glyph_base(idx):
    """Offset of the glyph's top-left tile inside its 4096-byte table (fDialog_GetGlyphPointer, $839862)."""
    return (idx & 7) * 32 + ((idx & 0x3F) >> 3) * 512


def locate(gid):
    return gid >> 6, glyph_base(gid & 0x3F)


def decode_glyph(table, idx):
    """-> list of 256 pixel values, row-major 16x16."""
    base = glyph_base(idx)
    px = [0] * 256
    for ty in range(2):
        for tx in range(2):
            o = base + tx * 16 + ty * 256
            for y in range(8):
                lo, hi = table[o + 2 * y], table[o + 2 * y + 1]
                for x in range(8):
                    b = 7 - x
                    px[(ty * 8 + y) * 16 + tx * 8 + x] = ((lo >> b) & 1) | (((hi >> b) & 1) << 1)
    return px


def encode_glyph(table, idx, px):
    base = glyph_base(idx)
    for ty in range(2):
        for tx in range(2):
            o = base + tx * 16 + ty * 256
            for y in range(8):
                lo = hi = 0
                for x in range(8):
                    v = px[(ty * 8 + y) * 16 + tx * 8 + x]
                    lo = (lo << 1) | (v & 1)
                    hi = (hi << 1) | (v >> 1)
                table[o + 2 * y], table[o + 2 * y + 1] = lo, hi


def blank_pixels():
    return [1 if ((i % 16) + (i // 16)) % 2 == 0 else 0 for i in range(256)]


BLANK = blank_pixels()


def glyph_filename(gid):
    return "glyph_%04X.png" % gid


# ---------------------------------------------------------------- sources
def rom_offset(addr):
    return ((addr >> 16) & 0x7F) * 0x8000 + (addr & 0x7FFF)


def read_rom_tables(path):
    data = Path(path).read_bytes()
    if len(data) != 0x200000:
        raise ValueError("%s: expected a 2 MB LoROM image, got %d bytes" % (path, len(data)))
    if data.count(POINTER_TABLE) != 1:
        raise ValueError("%s: aLetterGlyphsPointers table not found exactly once (wrong ROM?)" % path)
    return [data[rom_offset(a):rom_offset(a) + TABLE_SIZE] for a in TABLE_ADDR]


def read_asset_tables():
    return [(ASSETS_TILES / ("%s.bin" % n)).read_bytes() for n in TABLE_NAME]


def find_rom(region, rom_dir=None):
    env = os.environ.get("HM_ROM_" + region.upper())
    if env and Path(env).is_file():
        return Path(env)
    rom_dir = rom_dir or os.environ.get("HM_ROM_DIR")
    if rom_dir:
        hits = sorted(glob.glob(str(Path(rom_dir) / region.upper() / "*.sfc")))
        if hits:
            return Path(hits[0])
    return None


def source_tables(region, rom=None):
    """Font tables of a region: from a ROM if given, else for us from the assets."""
    if rom:
        return read_rom_tables(rom), "rom"
    if region == "us":
        return read_asset_tables(), "assets/gfx/tiles/sFontGlyphs_*.bin"
    raise ValueError("region %s needs --rom PATH (or HM_ROM_%s / HM_ROM_DIR)" % (region, region.upper()))


# ---------------------------------------------------------------- characters
def load_dialog_module():
    spec = importlib.util.spec_from_file_location("hm_dialog", ROOT / "tools" / "dialogs" / "dialog.py")
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return mod


def char_map(region):
    return load_dialog_module().load_charmap(region)


# ---------------------------------------------------------------- tables <-> images
def tables_to_glyphs(tables):
    """-> {gid: pixels} for every glyph that is not the plain dither."""
    out = {}
    for t, tab in enumerate(tables):
        if len(tab) != TABLE_SIZE:
            raise ValueError("table %d has %d bytes" % (t, len(tab)))
        for i in range(GLYPHS_PER_TABLE):
            px = decode_glyph(tab, i)
            if px != BLANK:
                out[t * GLYPHS_PER_TABLE + i] = px
    return out


def glyphs_to_tables(glyphs):
    tabs = [bytearray(TABLE_SIZE) for _ in range(N_TABLES)]
    for gid in range(N_GLYPHS):
        encode_glyph(tabs[gid >> 6], gid & 0x3F, glyphs.get(gid, BLANK))
    return [bytes(t) for t in tabs]


def right_half_is_dither(px):
    return all(px[y * 16 + x] == BLANK[y * 16 + x] for y in range(16) for x in range(8, 16))


def is_narrow_png(region, gid, px):
    """True if the glyph is stored as an 8x16 PNG: the engine draws it 8 px wide and its right half is plain dither."""
    engine_narrow = region != "jp" or gid in NARROW_IDS
    return engine_narrow and right_half_is_dither(px)


def write_png(path, px, narrow=False):
    Image = require_pil()
    w = 8 if narrow else 16
    im = Image.new("P", (w, 16))
    im.putpalette([c for rgb in PALETTE for c in rgb])
    im.putdata([px[y * 16 + x] for y in range(16) for x in range(w)])
    im.save(path, format="PNG", optimize=True)


def read_png(path):
    Image = require_pil()
    im = Image.open(path)
    if im.size not in ((16, 16), (8, 16)):
        raise ValueError("%s: glyph must be 16x16 or 8x16, got %dx%d" % (path, im.width, im.height))
    if im.mode not in ("P", "L"):
        raise ValueError("%s: glyph must be an indexed (P) PNG with 4 colours, got mode %s" % (path, im.mode))
    px = list(im.get_flattened_data() if hasattr(im, "get_flattened_data") else im.getdata())
    if max(px) > 3:
        raise ValueError("%s: pixel index above 3 (only palette indices 0..3 are allowed)" % path)
    if im.width == 8:   # narrow glyph: the right half is regenerated as plain dither
        full = []
        for y in range(16):
            full += px[y * 8:y * 8 + 8] + BLANK[y * 16 + 8:y * 16 + 16]
        px = full
    return px


def load_png_dir(src):
    glyphs = {}
    for p in sorted(Path(src).glob("glyph_*.png")):
        m = re.fullmatch(r"glyph_([0-9A-Fa-f]{4})\.png", p.name)
        if not m:
            raise ValueError("bad glyph file name: %s" % p.name)
        gid = int(m.group(1), 16)
        if gid >= N_GLYPHS:
            raise ValueError("%s: glyph id out of range (max %04X)" % (p.name, N_GLYPHS - 1))
        glyphs[gid] = read_png(p)
    return glyphs


def sha(b):
    return hashlib.sha256(b).hexdigest()


def ranges(ids):
    ids = sorted(ids); out = []
    for i in ids:
        if out and out[-1][1] == i - 1:
            out[-1][1] = i
        else:
            out.append([i, i])
    return ["%04X" % a if a == b else "%04X-%04X" % (a, b) for a, b in out]


def write_sidecar(path, region, tables, source, nfiles, nnarrow=0):
    cmap = char_map(region)
    meta = {
        "region": region,
        "source": source,
        "format": {
            "glyph_size": [16, 16],
            "png_sizes": "glyph_XXXX.png is 8x16 (left half only) when the engine draws the glyph 8 px wide and the right half is plain dither; "
                         "otherwise 16x16. build accepts both; the right half of an 8x16 glyph is regenerated as dither.",
            "bits_per_pixel": 2,
            "tile_layout": "TL=base TR=base+0x10 BL=base+0x100 BR=base+0x110, base=(idx&7)*32+(idx>>3)*512",
            "pixel_values": "0/1 = dialog background dither ((x+y) even -> 1), 2 = letter edge, 3 = letter ink",
            "png_palette_index": "PNG palette index == SNES pixel value; preview colours only",
            "blank_glyphs": "ids without a glyph_XXXX.png are the plain dither and are regenerated by build",
        },
        "engine_glyph_width_px": (
            {"default": 16, "narrow_8px_ids": ranges(NARROW_IDS)} if region == "jp"
            else {"default": 8, "note": "engine always draws only the left 8x16 half (TL+BL tiles); right half is unused"}),
        "png_files": nfiles,
        "png_files_8x16": nnarrow,
        "tables": [
            {"table": t, "label": TABLE_NAME[t], "cpu_address": "$%06X" % TABLE_ADDR[t],
             "first_id": "%04X" % (t * 64), "last_id": "%04X" % (t * 64 + 63),
             "referenced_by_engine": t < 10, "sha256": sha(tables[t])}
            for t in range(N_TABLES)],
        "chars": {"%04X" % g: cmap[g] for g in sorted(cmap) if g < N_GLYPHS},
        "chars_note": "from tools/dialogs/dialog.py (informational; edit when adding letters). JP table lists the first "
                      "occurrence of each character only.",
    }
    Path(path).write_text(json.dumps(meta, ensure_ascii=False, indent=1) + "\n", encoding="utf-8")


# ---------------------------------------------------------------- commands
def out_dir_for(region, out):
    return Path(out) if out else FONT_ASSETS / region


def cmd_extract(a):
    tables, source = source_tables(a.region, a.rom)
    glyphs = tables_to_glyphs(tables)
    out = out_dir_for(a.region, a.out)
    out.mkdir(parents=True, exist_ok=True)
    for p in out.glob("glyph_*.png"):
        p.unlink()
    nnarrow = 0
    for gid, px in sorted(glyphs.items()):
        narrow = is_narrow_png(a.region, gid, px)
        nnarrow += narrow
        write_png(out / glyph_filename(gid), px, narrow)
    # the generated files must rebuild to the source bytes
    if glyphs_to_tables(load_png_dir(out)) != list(tables):
        sys.exit("internal error: extracted PNGs do not rebuild to the source data")
    src_label = "rom" if a.rom else source
    write_sidecar(out / "glyphs.json", a.region, tables, src_label, len(glyphs), nnarrow)
    print("%s: %d glyph PNGs (%d blank ids omitted) -> %s" % (a.region, len(glyphs), N_GLYPHS - len(glyphs), out))
    return 0


def cmd_build(a):
    src = Path(a.src) if a.src else FONT_ASSETS / a.region
    if not src.is_dir():
        sys.exit("error: %s does not exist (run extract first)" % src)
    tables = glyphs_to_tables(load_png_dir(src))
    if a.write_assets:
        out = ASSETS_TILES if a.region == "us" else ASSETS_TILES / a.region     # eu/de/jp: assets/gfx/tiles/<region>/
    else:
        out = Path(a.out) if a.out else BUILD_DIR / a.region
    out.mkdir(parents=True, exist_ok=True)
    for t in range(N_TABLES):
        (out / ("%s.bin" % TABLE_NAME[t])).write_bytes(tables[t])
    print("%s: wrote %d tables to %s" % (a.region, N_TABLES, out))
    return 0


def check_region(region, rom_dir):
    """-> (ok, [messages])"""
    msgs, ok = [], True
    rom = find_rom(region, rom_dir)
    src_tables = None
    try:
        if rom:
            src_tables, label = source_tables(region, rom)
        elif region == "us":
            src_tables, label = source_tables(region)
        else:
            label = None
    except (ValueError, OSError) as e:
        return False, ["%s: %s" % (region, e)]
    if src_tables is not None:
        again = glyphs_to_tables(tables_to_glyphs(src_tables))
        if again != list(src_tables):
            ok = False; msgs.append("%s: extract->build does not reproduce %s" % (region, label))
        else:
            msgs.append("%s: extract->build reproduces all %d bytes of %s" % (region, N_TABLES * TABLE_SIZE, label))
    pngdir = FONT_ASSETS / region
    side = pngdir / "glyphs.json"
    if not side.is_file():
        return False, msgs + ["%s: %s missing (run extract)" % (region, side)]
    meta = json.loads(side.read_text(encoding="utf-8"))
    try:
        built = glyphs_to_tables(load_png_dir(pngdir))
    except ValueError as e:
        return False, msgs + ["%s: %s" % (region, e)]
    bad = [t for t in range(N_TABLES) if sha(built[t]) != meta["tables"][t]["sha256"]]
    if bad:
        ok = False; msgs.append("%s: PNG build differs from glyphs.json hashes in tables %s" % (region, bad))
    else:
        msgs.append("%s: committed PNGs rebuild to the recorded SHA-256 of all %d tables" % (region, N_TABLES))
    if src_tables is not None and built != list(src_tables):
        ok = False; msgs.append("%s: committed PNGs differ from the source data" % region)
    if region == "us":
        try:
            if built != read_asset_tables():
                ok = False; msgs.append("us: PNG build differs from assets/gfx/tiles/sFontGlyphs_*.bin")
            else:
                msgs.append("us: PNG build is byte-identical to assets/gfx/tiles/sFontGlyphs_*.bin")
        except OSError as e:
            ok = False; msgs.append("us: %s" % e)
    if len([p for p in pngdir.glob("glyph_*.png")]) != meta.get("png_files"):
        ok = False; msgs.append("%s: PNG count differs from glyphs.json" % region)
    return ok, msgs


def cmd_narrow(a):
    """Convert the committed 16x16 PNGs of a region to 8x16 where the engine draws the glyph 8 px wide and the right
    half is plain dither (in place; the rebuilt tables must stay identical)."""
    pngdir = FONT_ASSETS / a.region
    before = glyphs_to_tables(load_png_dir(pngdir))
    n = 0
    for gid, px in sorted(load_png_dir(pngdir).items()):
        if is_narrow_png(a.region, gid, px):
            write_png(pngdir / glyph_filename(gid), px, True)
            n += 1
    if glyphs_to_tables(load_png_dir(pngdir)) != before:
        sys.exit("internal error: narrowing changed the built tables")
    side = pngdir / "glyphs.json"
    meta = json.loads(side.read_text(encoding="utf-8"))
    meta["png_files_8x16"] = n
    meta["format"]["png_sizes"] = ("glyph_XXXX.png is 8x16 (left half only) when the engine draws the glyph 8 px wide and "
                                   "the right half is plain dither; otherwise 16x16. build accepts both; the right half of "
                                   "an 8x16 glyph is regenerated as dither.")
    side.write_text(json.dumps(meta, ensure_ascii=False, indent=1) + "\n", encoding="utf-8")
    print("%s: %d glyph PNGs converted to 8x16" % (a.region, n))
    return 0


def cmd_check(a):
    ok_all = True
    for r in (a.region or REGIONS):
        ok, msgs = check_region(r, a.rom_dir)
        for m in msgs:
            print(("ok   " if ok else "FAIL ") + m)
        ok_all &= ok
    print("font check: " + ("OK" if ok_all else "FAILED"))
    return 0 if ok_all else 1


def cmd_seal(a):
    pngdir = FONT_ASSETS / a.region
    side = pngdir / "glyphs.json"
    meta = json.loads(side.read_text(encoding="utf-8"))
    glyphs = load_png_dir(pngdir)
    tables = glyphs_to_tables(glyphs)
    for t in range(N_TABLES):
        meta["tables"][t]["sha256"] = sha(tables[t])
    meta["png_files"] = len(glyphs)
    side.write_text(json.dumps(meta, ensure_ascii=False, indent=1) + "\n", encoding="utf-8")
    print("%s: sealed %d tables" % (a.region, N_TABLES))
    return 0


def cmd_sheet(a):
    Image = require_pil()
    glyphs = load_png_dir(FONT_ASSETS / a.region)
    cols, scale = 16, 2
    sheet = Image.new("P", (cols * 17 * scale, (N_GLYPHS // cols) * 17 * scale), 2)
    sheet.putpalette([c for rgb in PALETTE for c in rgb])
    for gid in range(N_GLYPHS):
        px = glyphs.get(gid, BLANK)
        gx, gy = (gid % cols) * 17 * scale, (gid // cols) * 17 * scale
        for i, v in enumerate(px):
            x, y = i % 16, i // 16
            for dy in range(scale):
                for dx in range(scale):
                    sheet.putpixel((gx + x * scale + dx, gy + y * scale + dy), v)
    out = Path(a.out) if a.out else BUILD_DIR / a.region / "sheet.png"
    out.parent.mkdir(parents=True, exist_ok=True)
    sheet.save(out)
    print("wrote", out)
    return 0


def main(argv=None):
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    sub = ap.add_subparsers(dest="cmd", required=True)
    p = sub.add_parser("extract"); p.add_argument("--region", required=True, choices=REGIONS)
    p.add_argument("--rom"); p.add_argument("--out")
    p = sub.add_parser("build"); p.add_argument("--region", required=True, choices=REGIONS)
    p.add_argument("--src"); p.add_argument("--out"); p.add_argument("--write-assets", action="store_true")
    p = sub.add_parser("check"); p.add_argument("--region", action="append", choices=REGIONS)
    p.add_argument("--rom-dir")
    p = sub.add_parser("narrow"); p.add_argument("--region", required=True, choices=REGIONS)
    p = sub.add_parser("seal"); p.add_argument("--region", required=True, choices=REGIONS)
    p = sub.add_parser("sheet"); p.add_argument("--region", required=True, choices=REGIONS); p.add_argument("--out")
    a = ap.parse_args(argv)
    try:
        return {"extract": cmd_extract, "build": cmd_build, "check": cmd_check,
                "seal": cmd_seal, "narrow": cmd_narrow, "sheet": cmd_sheet}[a.cmd](a)
    except (ValueError, OSError) as e:
        print("error: %s" % e, file=sys.stderr)
        return 1


if __name__ == "__main__":
    sys.exit(main())
