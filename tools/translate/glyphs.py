#!/usr/bin/env python3
"""Glyphs of a translation language: letters generated from the extracted font + diacritic marks, plus hand drawn overrides.

  translations/<lang>/lang.json  "glyphs": {"ą": {"id": "0x43", "base": "a", "mark": "ogonek"}, ...}
  defs/translation/marks.json    pixels of the marks
  translations/<lang>/font/glyph_<ID>.png   optional hand drawn glyph (16x16 or 8x16 indexed PNG, same format as assets/fonts/<region>/); replaces the generated one

No font pixel is committed: the base letters come from the font tables of the engine release (assets/fonts/us -> build/assets/gfx/tiles) when the ROM is built.

  python tools/translate/glyphs.py sheet pl [--out build/translate/pl_glyphs.png]    preview of the generated letters (4x scale)
"""
import argparse
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import common as C                                                  # noqa: E402

sys.path.insert(0, str(C.ROOT / "tools" / "fonts"))
import font                                                         # noqa: E402


def marks():
    return C.read_json(C.DEFS / "marks.json")["marks"]


def engine_tables(region="us"):
    """Font tables (11 x 4096 bytes) of the engine release from the assets (built by tools/build_assets.py or tools/fonts/font.py build)."""
    tabs = []
    for n in font.TABLE_NAME:
        p = font.ASSETS_TILES / ("%s.bin" % n)
        if region != "us":
            q = font.ASSETS_TILES / region / ("%s.bin" % n)
            p = q if q.exists() else p
        tabs.append(p.read_bytes())
    return tabs


def make_glyph(base_px, mark_name, upper, mk):
    """base 16x16 pixels + mark -> pixels (right half stays what the base has: plain dither for Latin letters)."""
    px = list(base_px)
    for x, y in mk[mark_name]["upper" if upper else "lower"]:
        if not (0 <= x < 8 and 0 <= y < 16):
            raise ValueError("mark %s: pixel (%d,%d) outside the 8x16 cell" % (mark_name, x, y))
        px[y * 16 + x] = 3
    return px


def build_glyphs(lang, tables):
    """-> {glyph id: pixels} for every glyph of the language (generated or overridden)."""
    cm_rev = {c: k for k, c in C.dialog.load_charmap(lang.engine_region).items()}
    mk = marks()
    out = {}
    for ch, g in lang.glyphs.items():
        if "base" in g:
            base = g["base"]
            if base not in cm_rev:
                raise ValueError("%s: base letter %r of %r is not in the %s charmap" % (lang.code, base, ch, lang.engine_region))
            bid = cm_rev[base]
            bpx = font.decode_glyph(tables[bid >> 6], bid & 0x3F)
            out[g["id"]] = make_glyph(bpx, g["mark"], base.isupper(), mk)
    fdir = lang.dir / "font"
    if fdir.is_dir():
        for gid, px in font.load_png_dir(fdir).items():
            out[gid] = px
    return out


def apply_glyphs(tables, glyphs):
    """-> new list of tables with the glyphs written in."""
    tabs = [bytearray(t) for t in tables]
    for gid, px in glyphs.items():
        font.encode_glyph(tabs[gid >> 6], gid & 0x3F, px)
    return [bytes(t) for t in tabs]


def cmd_sheet(a):
    lang = C.Lang(C.lang_dir(a.lang))
    g = build_glyphs(lang, engine_tables(lang.engine_region))
    Image = font.require_pil()
    ids = sorted(g)
    im = Image.new("P", (len(ids) * 9 * 4, 16 * 4))
    im.putpalette([c for rgb in font.PALETTE for c in rgb])
    for n, gid in enumerate(ids):
        for y in range(16):
            for x in range(8):
                v = g[gid][y * 16 + x]
                for dy in range(4):
                    for dx in range(4):
                        im.putpixel((n * 36 + x * 4 + dx, y * 4 + dy), v)
    out = Path(a.out or C.WORK / ("%s_glyphs.png" % lang.code))
    out.parent.mkdir(parents=True, exist_ok=True)
    im.save(out)
    print("wrote", out)
    return 0


def main(argv=None):
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    sub = ap.add_subparsers(dest="cmd", required=True)
    s = sub.add_parser("sheet"); s.add_argument("lang"); s.add_argument("--out"); s.set_defaults(f=cmd_sheet)
    a = ap.parse_args(argv)
    return a.f(a)


if __name__ == "__main__":
    sys.exit(main())
