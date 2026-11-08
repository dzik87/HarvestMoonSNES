#!/usr/bin/env python3
"""Glyph PNGs of a translation language: initial set generated from the font of its engine release + diacritic overlays.

A translation has its own font folder, translate/<lang>/glyphs/, with a PNG for EVERY glyph id ($0000-$02BF) and the glyph map glyph_map.json
(tools/translate/glyphmap.py, docs/formats/font.md).  `init` creates that folder once; afterwards the PNGs are plain files you edit with any
pixel editor and the build only reads them (tools/translate/font.py build / tools/build.py --translation).  Nothing is generated at build time.

  python tools/translate/glyphs.py init <lang> [--spec FILE] [--force]
        translate/<lang>/lang.json must exist (engine_region, default us).  Copies the glyph PNGs of translate/<engine_region>/glyphs, writes the plain-dither
        PNG for every blank id, paints the letters of the spec and writes glyph_map.json.  The spec lists the extra letters
        {"Ą": {"id": "0x43", "base": "A", "mark": "ogonek"}, ...}: the glyph id (free ids $43-$A1, docs/translation-analysis.md section 4),
        the base letter of the engine font and a mark of defs/translation/marks.json (acute, dot, ogonek, stroke; add new marks there).
        Default spec: the entry of <lang> in defs/translation/glyph_overlays.json.
  python tools/translate/glyphs.py sheet <lang> [--out FILE]
        preview (4x) of the letters that the language adds to the font of its engine release

Draw the letters by hand afterwards if the generated shapes are not good enough: edit translate/<lang>/glyphs/glyph_<ID>.png (16x16 or 8x16 indexed
PNG, index = SNES pixel value, 3 = ink, 2 = edge, 0/1 = dither), then `python tools/translate/font.py seal --lang <lang>` to record the new hashes.
"""
import argparse
import shutil
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import common as C                                                  # noqa: E402
import font                                                         # noqa: E402
import glyphmap                                                     # noqa: E402

OVERLAYS = C.DEFS / "glyph_overlays.json"


def marks():
    return C.read_json(C.DEFS / "marks.json")["marks"]


def engine_tables(region="us"):
    """Font tables (11 x 4096 bytes) of the engine release from the assets (built by tools/build_assets.py or tools/translate/font.py build)."""
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


def load_spec(lang_code, path=None):
    if path:
        spec = C.read_json(path)
        spec = spec.get(lang_code, spec) if lang_code in spec else spec
    else:
        spec = C.read_json(OVERLAYS).get(lang_code)
        if spec is None:
            raise ValueError("no entry for %r in %s (pass --spec FILE)" % (lang_code, OVERLAYS))
    return {ch: dict(g, id=int(str(g["id"]), 0)) for ch, g in spec.items() if not ch.startswith("_")}


def init(lang_code, spec, force=False, out=print):
    """Create translate/<lang>/glyphs (PNGs + glyph_map.json) -> number of PNG files."""
    d = glyphmap.lang_dir(lang_code)
    if not (d / "lang.json").is_file():
        raise ValueError("%s/lang.json does not exist: create the language first (translate/README.md)" % d)
    if glyphmap.has_map(d) and not force:
        raise ValueError("%s exists already; the PNGs are the source now (use --force to generate them again)" % glyphmap.map_path(d))
    engine = C.read_json(d / "lang.json").get("engine_region", "us")
    ed = glyphmap.lang_dir(engine)
    edoc, eglyphs = font.load_glyphs(ed)
    eents = glyphmap.entries(edoc)
    cm_rev = {c: k for k, c in glyphmap.charmap(edoc).items()}
    mk = marks()
    gd = glyphmap.glyph_dir(d)
    gd.mkdir(parents=True, exist_ok=True)
    for p in gd.glob("glyph_*.png"):
        p.unlink()
    glyphs, ents = {}, []
    for gid in range(font.N_GLYPHS):                    # 1. the engine release's glyphs (PNG files copied byte for byte), plain dither PNGs for the blank ids
        e = dict(eents[gid])
        name = font.glyph_filename(gid)
        if e["png"]:
            shutil.copyfile(glyphmap.glyph_dir(ed) / e["png"], gd / name)
            glyphs[gid] = eglyphs[gid]
        else:
            font.write_png(gd / name, font.BLANK, True)
            glyphs[gid] = list(font.BLANK)
        e["png"] = name
        ents.append(e)
    for ch, g in sorted(spec.items(), key=lambda kv: kv[1]["id"]):      # 2. the letters of the language
        base = g["base"]
        if base not in cm_rev:
            raise ValueError("%s: base letter %r of %r is not in the %s glyph map" % (lang_code, base, ch, engine))
        gid = g["id"]
        px = make_glyph(glyphs[cm_rev[base]], g["mark"], base.isupper(), mk)
        glyphs[gid] = px
        font.write_png(gd / font.glyph_filename(gid), px, font.is_narrow_png(engine, gid, px))
        ents[gid] = glyphmap.entry(gid, ch, None, font.glyph_filename(gid), ents[gid]["width"], None, "%s + %s" % (base, g["mark"]))
    doc = font.make_doc(lang_code, engine, "translation", "tools/translate/glyphs.py init (%s font + overlays)" % engine, font.glyphs_to_tables(glyphs), ents)
    errs = glyphmap.check(doc) + glyphmap.collisions(doc, edoc)
    if errs:
        raise ValueError("the generated glyph map is invalid:\n  " + "\n  ".join(errs))
    glyphmap.write(gd / glyphmap.MAP_NAME, doc)
    font.load_glyphs(d)                                 # reads everything back through the checks of the build
    out("%s: %d glyph PNGs, %d letter(s) painted, map %s" % (lang_code, len(glyphs), len(spec), glyphmap.map_path(d)))
    return len(glyphs)


def cmd_init(a):
    spec = load_spec(a.lang, a.spec)
    init(a.lang, spec, a.force)
    return 0


def cmd_sheet(a):
    lang = C.Lang(C.lang_dir(a.lang))
    if not lang.has_glyphs:
        sys.exit("%s has no glyph folder (python tools/translate/glyphs.py init %s)" % (lang.code, lang.code))
    g = font.load_glyphs(lang.dir)[1]
    Image = font.require_pil()
    ids = sorted(v["id"] for v in lang.glyphs.values())
    im = Image.new("P", (max(len(ids), 1) * 9 * 4, 16 * 4))
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
    s = sub.add_parser("init"); s.add_argument("lang"); s.add_argument("--spec"); s.add_argument("--force", action="store_true"); s.set_defaults(f=cmd_init)
    s = sub.add_parser("sheet"); s.add_argument("lang"); s.add_argument("--out"); s.set_defaults(f=cmd_sheet)
    a = ap.parse_args(argv)
    try:
        return a.f(a)
    except (ValueError, OSError) as e:
        print("error: %s" % e, file=sys.stderr)
        return 1


if __name__ == "__main__":
    sys.exit(main())
