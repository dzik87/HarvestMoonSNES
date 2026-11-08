#!/usr/bin/env python3
"""Font converter: ROM font glyph tables <-> one editable PNG per glyph plus a glyph map, byte-exact round trip.

Format (details and evidence in docs/formats/font.md):
  * The font is stored in 11 tables of 4096 bytes (sFontGlyphs_0x00..0x09 plus the dialog font tiles sFontGlyphs_Dialog),
    64 glyphs per table.  Glyph id = dialog word value; table = id >> 6, index = id & $3F.
  * A glyph is 16x16 pixels, 2bpp SNES planar: four 8x8 tiles of 16 bytes
        TL = base, TR = base + $10, BL = base + $100, BR = base + $110,   base = (idx & 7) * 32 + (idx >> 3) * 512
  * Pixel value 0..3 (plane 0 = bit 0, plane 1 = bit 1).  Values 0/1 form the dialog-window background dither
    ((x + y) even -> 1, odd -> 0) that is baked into every glyph, values 2/3 are the letter (3 = ink, 2 = soft edge).

Sources of a language (translate/us, eu, de, jp = the original releases, translate/pl = a translation, ...): translate/<lang>/glyphs/glyph_<ID4hex>.png
(16x16 or, for glyphs that the engine draws 8 px wide, 8x16 indexed PNG, 4-colour palette, index = SNES pixel value) and translate/<lang>/glyphs/glyph_map.json,
the glyph map (tools/translate/glyphmap.py): for each of the 704 ids the character, the PNG name (null = plain dither), the engine width and a note, plus the
tables (CPU address, SHA-256).  The map is the single source of truth: this tool builds the font from it, the text converters read their characters from it.

Commands (--lang is a folder of translate/; --region is the same option under its old name):
    extract --lang R [--rom PATH] [--out DIR]    ROM (or assets/gfx/tiles for us) -> PNGs + glyph_map.json (original releases only)
    build   --lang L [--src DIR] [--out DIR] [--write-assets]   PNGs + map -> sFontGlyphs_*.bin (--write-assets: assets/gfx/tiles for the original releases)
    check   [--lang L]... [--rom-dir DIR]        map consistent, PNGs rebuild to the recorded hashes, round trip with the ROM (exit 1 otherwise)
    seal    --lang L                             recompute the SHA-256 values in the map after an edit of the PNGs
    sheet   --lang L [--out FILE]                contact sheet of all glyphs (for viewing only)
Creating the PNGs of a new translation: tools/translate/glyphs.py init.
"""
import argparse, glob, hashlib, os, re, sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import glyphmap                                                    # noqa: E402

ROOT = Path(__file__).resolve().parents[2]
ASSETS_TILES = ROOT / "assets" / "gfx" / "tiles"
BUILD_DIR = ROOT / "build" / "fonts"
REGIONS = glyphmap.ORIGINALS

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
    im.save(path, format="PNG", optimize=True, compress_level=9)      # pinned encoder settings: byte-identical output on every machine


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


# ---------------------------------------------------------------- the glyph map (translate/<lang>/glyphs/glyph_map.json, tools/translate/glyphmap.py)
def table_docs(tables):
    return [{"table": t, "label": TABLE_NAME[t], "file": "%s.bin" % TABLE_NAME[t], "cpu_address": "$%06X" % TABLE_ADDR[t],
             "first_id": "0x%04X" % (t * GLYPHS_PER_TABLE), "last_id": "0x%04X" % (t * GLYPHS_PER_TABLE + GLYPHS_PER_TABLE - 1),
             "referenced_by_engine": t < 10, "sha256": sha(tables[t])} for t in range(N_TABLES)]


MAP_DOC = ("Glyph map of this language: every glyph id of the font with its character, PNG file and engine width, plus the font tables (CPU address, SHA-256 of the built bytes). "
           "tools/translate/font.py build turns this map and the PNGs into sFontGlyphs_*.bin; the text tools read the characters from here. Format: docs/formats/font.md")


def make_doc(lang, engine_region, kind, source, tables, ents):
    return {"_doc": MAP_DOC, "lang": lang, "kind": kind, "engine_region": engine_region, "source": source,
            "tables": table_docs(tables), "glyphs": ents}


def engine_width(region, gid):
    return 8 if (region != "jp" or gid in NARROW_IDS) else 16


def original_entries(region, glyphs):
    """Map entries of an original release: characters from defs/translation/charmaps.json, PNG names from the extracted glyphs."""
    chars, display = glyphmap.seeds(region)
    out = []
    for gid in range(N_GLYPHS):
        ch, png = chars.get(gid), (glyph_filename(gid) if gid in glyphs else None)
        label = note = disp = None
        if png is None:
            label = "blank"
        elif ch is None:
            if gid in display:
                label, disp = "duplicate", display[gid]
            elif gid == 0xA2:
                label = "<NEXT>"
            elif gid >= 0x280:
                label = "window"
            else:
                label = "unmapped"
        if gid == 0xA2:
            note = "next-screen marker; the control word $00A2 is written <NEXT> in the text"
        elif region == "jp" and gid == 0xB1:
            note = "full-width blank (U+3000)"
        elif region == "jp" and gid == 0x270:
            note = "half-width blank (ASCII space)"
        out.append(glyphmap.entry(gid, ch, label, png, engine_width(region, gid), disp, note))
    return out


def write_lang_files(directory, glyphs, doc, narrow_region, clean=True):
    """PNGs + glyph_map.json of one language into <directory>/glyphs."""
    gd = glyphmap.glyph_dir(directory)
    gd.mkdir(parents=True, exist_ok=True)
    if clean:
        for p in gd.glob("glyph_*.png"):
            p.unlink()
    for gid, px in sorted(glyphs.items()):
        write_png(gd / glyph_filename(gid), px, is_narrow_png(narrow_region, gid, px))
    glyphmap.write(gd / glyphmap.MAP_NAME, doc)


def load_glyphs(directory):
    """-> (map document, {gid: pixels}) of translate/<lang>; every listed PNG is validated (size, indexed, indices 0..3); the map is checked first."""
    directory = Path(directory)
    doc = glyphmap.read(directory)
    errs = glyphmap.check(doc, directory)
    if errs:
        raise ValueError("%s: %d error(s) in the glyph map or its PNG files:\n  %s" % (glyphmap.map_path(directory), len(errs), "\n  ".join(errs[:12])))
    gd = glyphmap.glyph_dir(directory)
    return doc, {glyphmap.gid_of(e): read_png(gd / e["png"]) for e in doc["glyphs"] if e["png"]}


def lang_tables(code):
    """Font tables (11 x 4096 bytes) built from translate/<code>/glyphs."""
    return glyphs_to_tables(load_glyphs(glyphmap.lang_dir(code))[1])


# ---------------------------------------------------------------- commands
def extract_rom_bytes(region, rom, directory):
    """ROM image (bytes, headerless 2 MB) -> <directory>/glyphs: glyph PNGs + glyph_map.json (directory = translate/<region>).  Used by tools/extract.py (step `fonts`)."""
    if len(rom) != 0x200000 or rom.count(POINTER_TABLE) != 1:
        raise ValueError("%s: not a Harvest Moon ROM image (aLetterGlyphsPointers not found exactly once)" % region)
    return _extract_tables(region, [rom[rom_offset(a):rom_offset(a) + TABLE_SIZE] for a in TABLE_ADDR], directory)


def cmd_extract(a):
    if a.lang not in REGIONS:
        sys.exit("error: extract works on the original releases (%s), not on %r" % (", ".join(REGIONS), a.lang))
    tables, source = source_tables(a.lang, a.rom)
    directory = Path(a.out) if a.out else glyphmap.lang_dir(a.lang)
    n = _extract_tables(a.lang, tables, directory)
    print("%s: %d glyph PNGs (%d blank ids without PNG) -> %s" % (a.lang, n, N_GLYPHS - n, glyphmap.glyph_dir(directory)))
    return 0


def _extract_tables(region, tables, directory):
    glyphs = tables_to_glyphs(tables)
    doc = make_doc(region, region, "original", "rom", tables, original_entries(region, glyphs))
    write_lang_files(directory, glyphs, doc, region)
    if glyphs_to_tables(load_glyphs(directory)[1]) != list(tables):
        raise ValueError("internal error: extracted PNGs do not rebuild to the source data")
    return len(glyphs)


def cmd_build(a):
    directory = glyphmap.lang_dir(a.lang)
    if a.src:
        directory = Path(a.src)
    if not glyphmap.has_map(directory):
        sys.exit("error: %s does not exist (original releases: run tools/extract.py; translations: tools/translate/glyphs.py init)" % glyphmap.map_path(directory))
    tables = glyphs_to_tables(load_glyphs(directory)[1])
    if a.write_assets:
        if a.lang not in REGIONS:
            sys.exit("error: --write-assets is for the original releases; a translation's font is patched into the ROM by tools/translate/build.py")
        out = ASSETS_TILES if a.lang == "us" else ASSETS_TILES / a.lang     # eu/de/jp: assets/gfx/tiles/<region>/
    else:
        out = Path(a.out) if a.out else BUILD_DIR / a.lang
    out.mkdir(parents=True, exist_ok=True)
    for t in range(N_TABLES):
        (out / ("%s.bin" % TABLE_NAME[t])).write_bytes(tables[t])
    print("%s: wrote %d tables to %s" % (a.lang, N_TABLES, out))
    return 0


def check_lang(lang, rom_dir):
    """-> (ok, [messages])"""
    msgs, ok = [], True
    directory = glyphmap.lang_dir(lang)
    if not (directory / "lang.json").is_file():
        return False, ["%s: lang.json missing" % lang]
    if not glyphmap.has_map(directory):
        return False, ["%s: %s missing (original releases: run tools/extract.py; translations: tools/translate/glyphs.py init)" % (lang, glyphmap.map_path(directory))]
    try:
        doc, glyphs = load_glyphs(directory)
    except (ValueError, OSError) as e:
        return False, ["%s: %s" % (lang, e)]
    built = glyphs_to_tables(glyphs)
    msgs.append("%s: glyph map and %d PNG files are consistent (%d characters, %d ids without PNG)" % (
        lang, len(glyphs), len(glyphmap.charmap(doc)), N_GLYPHS - len(glyphs)))
    bad = [t for t in range(N_TABLES) if sha(built[t]) != doc["tables"][t]["sha256"]]
    if bad:
        ok = False; msgs.append("%s: PNG build differs from the SHA-256 values of the map in tables %s (font.py seal --lang %s after an intended edit)" % (lang, bad, lang))
    else:
        msgs.append("%s: PNGs rebuild to the recorded SHA-256 of all %d tables" % (lang, N_TABLES))
    if lang not in REGIONS:
        eng = doc.get("engine_region", "us")
        coll = glyphmap.collisions(doc, glyphmap.read(glyphmap.lang_dir(eng)))
        if coll:
            ok = False; msgs += ["%s: %s" % (lang, c) for c in coll]
        else:
            msgs.append("%s: no character replaces one of the %s engine release" % (lang, eng))
        return ok, msgs
    if glyphmap.charmap(doc) != glyphmap.seed_charmap(lang):
        ok = False; msgs.append("%s: characters of the map differ from defs/translation/charmaps.json (the extraction seed; edit both)" % lang)
    rom = find_rom(lang, rom_dir)
    src_tables = None
    try:
        if rom:
            src_tables, label = source_tables(lang, rom)
        elif lang == "us":
            src_tables, label = source_tables(lang)
    except (ValueError, OSError) as e:
        return False, msgs + ["%s: %s" % (lang, e)]
    if src_tables is not None:
        again = glyphs_to_tables(tables_to_glyphs(src_tables))
        if again != list(src_tables):
            ok = False; msgs.append("%s: extract->build does not reproduce %s" % (lang, label))
        else:
            msgs.append("%s: extract->build reproduces all %d bytes of %s" % (lang, N_TABLES * TABLE_SIZE, label))
        if built != list(src_tables):
            ok = False; msgs.append("%s: committed PNGs differ from the source data" % lang)
    if lang == "us":
        try:
            if built != read_asset_tables():
                ok = False; msgs.append("us: PNG build differs from assets/gfx/tiles/sFontGlyphs_*.bin")
            else:
                msgs.append("us: PNG build is byte-identical to assets/gfx/tiles/sFontGlyphs_*.bin")
        except OSError as e:
            ok = False; msgs.append("us: %s" % e)
    return ok, msgs


def all_langs():
    """Language directories that have a glyph map: the four releases first, then the translations."""
    found = [d.name for d in sorted(glyphmap.TRANSLATE.iterdir()) if d.is_dir() and glyphmap.has_map(d)]
    return [r for r in REGIONS if r in found] + [x for x in found if x not in REGIONS]


def cmd_check(a):
    ok_all = True
    for r in (a.lang or all_langs()):
        ok, msgs = check_lang(r, a.rom_dir)
        for m in msgs:
            print(("ok   " if ok else "FAIL ") + m)
        ok_all &= ok
    print("font check: " + ("OK" if ok_all else "FAILED"))
    return 0 if ok_all else 1


def cmd_seal(a):
    directory = glyphmap.lang_dir(a.lang)
    doc, glyphs = load_glyphs(directory)
    doc["tables"] = table_docs(glyphs_to_tables(glyphs))
    glyphmap.write(glyphmap.map_path(directory), doc)
    print("%s: sealed %d tables" % (a.lang, N_TABLES))
    return 0


def cmd_sheet(a):
    Image = require_pil()
    glyphs = load_glyphs(glyphmap.lang_dir(a.lang))[1]
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
    out = Path(a.out) if a.out else BUILD_DIR / a.lang / "sheet.png"
    out.parent.mkdir(parents=True, exist_ok=True)
    sheet.save(out)
    print("wrote", out)
    return 0


def main(argv=None):
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    sub = ap.add_subparsers(dest="cmd", required=True)

    def lang_arg(p, required=True):
        p.add_argument("--lang", "--region", dest="lang", required=required, help="language folder under translate/ (us eu de jp = original releases, pl, ...)")
    p = sub.add_parser("extract"); lang_arg(p); p.add_argument("--rom"); p.add_argument("--out", help="language directory to write (default translate/<lang>)")
    p = sub.add_parser("build"); lang_arg(p); p.add_argument("--src", help="language directory to read (default translate/<lang>)"); p.add_argument("--out"); p.add_argument("--write-assets", action="store_true")
    p = sub.add_parser("check"); p.add_argument("--lang", "--region", dest="lang", action="append"); p.add_argument("--rom-dir")
    p = sub.add_parser("seal"); lang_arg(p)
    p = sub.add_parser("sheet"); lang_arg(p); p.add_argument("--out")
    a = ap.parse_args(argv)
    try:
        return {"extract": cmd_extract, "build": cmd_build, "check": cmd_check,
                "seal": cmd_seal, "sheet": cmd_sheet}[a.cmd](a)
    except (ValueError, OSError) as e:
        print("error: %s" % e, file=sys.stderr)
        return 1


if __name__ == "__main__":
    sys.exit(main())
