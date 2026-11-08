#!/usr/bin/env python3
"""Render dialogs as the dialog box of the US engine would show them: PNG previews of the translation text.

  python tools/translate/preview.py pl --ids 0x0123,0x0200-0x0210      one PNG per id in build/translate/preview/ (screens stacked)
  python tools/translate/preview.py pl --range 0x0100 0x0140 --sheet   one contact sheet of many ids (--columns N)
  python tools/translate/preview.py pl --all --sheet --only-problems   every translated id that has a layout error / missing glyph
  python tools/translate/preview.py pl --text "Some text<NEXT>More text<END>" --out build/translate/preview/test.png

The picture follows the engine rules of defs/translation/engine.json: 28 cells of 8 px per line, 3 lines of 16 px = 84 cells per screen, the blinking
`<NEXT>` marker in cell 83 (drawn as a small blue triangle when the screen continues), answer cursors of `<OPT n>` (green triangles in cells 0/28/56/15/43),
variables and numbers as tinted hatched cells with their full width (names 4, girl 5, season 6, weekday 9, ordinal 2, numbers = digit count).
Problems are drawn, not hidden:
  red frame / red rows      the screen holds more than 84 cells, or the text uses the marker cell 83 of a screen that continues, or another layout error
  magenta cross             a glyph that has no pixels (id outside the font tables or an empty glyph that is not the space)
Glyphs are the font of the language (translate/<lang>/glyphs: PNGs + glyph map, tools/translate/font.py), exactly what the build writes
into the ROM.  The output directory build/translate/ is git-ignored: previews of ROM-derived pixels are never committed.
Only ids, counts and file names are printed, never the text.
"""
import argparse
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import common as C                                          # noqa: E402
import font                                                 # noqa: E402

CELL_W, LINE_H = 8, 16
FRAME = 2
BG = (0x20, 0x28, 0x48)
BOX_BG = (0xFF, 0xFF, 0xFF)
RED, MAGENTA, BLUE, GREEN = (0xE0, 0x20, 0x20), (0xE0, 0x20, 0xE0), (0x20, 0x60, 0xE0), (0x10, 0xA0, 0x30)
TINT_VAR, TINT_NUM = (0xFF, 0xE0, 0x90), (0xB0, 0xE8, 0xB0)
LABEL_FG = (0xF0, 0xF0, 0xF0)

# 3x5 pixel font for the id labels (hex digits and a few symbols)
_F = {
    "0": "111101101101111", "1": "010110010010111", "2": "111001111100111", "3": "111001111001111", "4": "101101111001001",
    "5": "111100111001111", "6": "111100111101111", "7": "111001001001001", "8": "111101111101111", "9": "111101111001111",
    "A": "111101111101101", "B": "110101110101110", "C": "111100100100111", "D": "110101101101110", "E": "111100110100111",
    "F": "111100110100100", "X": "101101010101101", "/": "001001010100100", "-": "000000111000000", ".": "000000000000010",
    " ": "000000000000000", "!": "010010010000010", "S": "111100111001111", "E": "111100110100111",
}


def draw_label(im, x, y, text, color=LABEL_FG, scale=1):
    """tiny text with the 3x5 font"""
    px = im.load()
    for k, ch in enumerate(text.upper()):
        rows = _F.get(ch, _F[" "])
        for i, bit in enumerate(rows):
            if bit == "1":
                for dy in range(scale):
                    for dx in range(scale):
                        xx, yy = x + (k * 4 + i % 3) * scale + dx, y + (i // 3) * scale + dy
                        if 0 <= xx < im.width and 0 <= yy < im.height:
                            px[xx, yy] = color
    return 4 * scale * len(text)


# ---------------------------------------------------------------- glyph source
class GlyphSource:
    """gid -> 256 pixel values (row major 16x16) or None.  `tables` = the 11 font tables (4096 bytes each) with the language letters already written in."""

    def __init__(self, tables):
        self.tables = tables
        self._cache = {}

    def pixels(self, gid):
        if gid >> 6 >= len(self.tables):
            return None
        px = self._cache.get(gid)
        if px is None:
            px = self._cache[gid] = font.decode_glyph(self.tables[gid >> 6], gid & 0x3F)
        return px


def load_glyphs(lang, tables=None):
    """The font as the translated ROM will hold it: the tables built from translate/<lang>/glyphs (PNGs + glyph map), or the US tables for a language without its own glyphs.
    `tables` replaces them (tests)."""
    if tables is None:
        import glyphs as G
        tables = font.glyphs_to_tables(font.load_glyphs(lang.dir)[1]) if lang.has_glyphs else G.engine_tables(lang.engine_region)
    return GlyphSource(tables)


def _is_missing(px, gid):
    return px is None or (px == font.BLANK and gid != C.SPACE)


# ---------------------------------------------------------------- one screen
def render_screen(cells, glyph_src, more=False, opts=0, cursors=(0, 28, 56, 15, 43), flags=None):
    """Draw the cells of one screen -> (RGB image 224 x 48 or taller, set of problem names).
    cells: glyph ids, 'v' (text variable) or 'n' (number digit).  more: the screen ends with <NEXT> (marker in cell 83).  opts: number of answers."""
    from PIL import Image
    W, H = 28, 3
    cap = W * H
    rows = max(H, (len(cells) + W - 1) // W)
    im = Image.new("RGB", (W * CELL_W, rows * LINE_H), BOX_BG)
    px = im.load()
    problems = set()
    pal = font.PALETTE
    for n, c in enumerate(cells):
        x0, y0 = (n % W) * CELL_W, (n // W) * LINE_H
        if isinstance(c, str):
            tint = TINT_VAR if c == "v" else TINT_NUM
            for y in range(LINE_H):
                for x in range(CELL_W):
                    px[x0 + x, y0 + y] = tint if (x + y) % 4 else tuple(max(0, v - 70) for v in tint)
            continue
        g = glyph_src.pixels(c)
        if _is_missing(g, c):
            problems.add("missing")
            for y in range(LINE_H):
                for x in range(CELL_W):
                    px[x0 + x, y0 + y] = MAGENTA if x == y // 2 or x == 7 - y // 2 else (0xFF, 0xD8, 0xFF)
            continue
        for y in range(LINE_H):
            for x in range(CELL_W):
                px[x0 + x, y0 + y] = pal[g[y * 16 + x]]
    if len(cells) > cap:
        problems.add("overflow")
        for y in range(H * LINE_H, rows * LINE_H):
            for x in range(W * CELL_W):
                if (x + y) % 6 == 0:
                    px[x, y] = RED
    mx0, my0 = (83 % W) * CELL_W, (83 // W) * LINE_H
    if more:
        if len(cells) > 83 and cells[83] != C.SPACE:
            problems.add("marker")
            for y in range(LINE_H):
                for x in range(CELL_W):
                    if x in (0, 7) or y in (0, 15):
                        px[mx0 + x, my0 + y] = RED
        for y in range(5):                                       # the blinking marker: a small triangle at the bottom of cell 83
            for x in range(5 - y):
                px[mx0 + 1 + x, my0 + 9 + y] = BLUE
    for k in range(min(opts, len(cursors))):
        cx, cy = (cursors[k] % W) * CELL_W, (cursors[k] // W) * LINE_H
        for y in range(7):
            for x in range(min(4, 7 - y)):
                px[cx + x, cy + 4 + y] = GREEN
    return im, problems


# ---------------------------------------------------------------- one dialog
class Rendered:
    def __init__(self):
        self.screens = []           # [(image, problems)]
        self.errors = []            # layout / syntax messages (not printed with text; ids and positions only)
        self.problems = set()

    @property
    def ok(self):
        return not self.errors and not self.problems


def render_text(text, lang, glyph_src, vm=None, ndigits=None, flags=()):
    """Translation source text -> Rendered (never raises on syntax errors: they become `errors`)."""
    r = Rendered()
    raw = (lang.layout == "raw") or ("raw" in flags)
    try:
        items = C.parse_text(text, lang, vm, ndigits, raw=raw)
    except C.SyntaxError_ as e:
        r.errors.append(str(e))
        return r
    lay = C.layout_items(items, lang, raw=raw)
    r.errors += lay.errors
    opt = next((it.val for it in items if it.kind == "opt"), 0)
    cur = C.engine()["option_cursor_cells"][lang.engine_region]
    for k, cells in enumerate(lay.cells):
        last = k == len(lay.cells) - 1
        im, pr = render_screen(cells, glyph_src, more=not last, opts=opt if last else 0, cursors=cur)
        r.screens.append((im, pr))
        r.problems |= pr
    return r


def compose(rendered, scale=3, label=None, number=True):
    """Rendered -> one image: the screens stacked, each in a framed box; problems get a red frame."""
    from PIL import Image
    n = max(1, len(rendered.screens))
    w = 28 * CELL_W + 2 * FRAME
    top = 7 if label else 2
    heights = [im.height + 2 * FRAME for im, _ in rendered.screens] or [3 * LINE_H + 2 * FRAME]
    out = Image.new("RGB", (w + 4, top + sum(heights) + 2 * n), BG)
    y = top
    if label:
        draw_label(out, 2, 1, label)
    for k, (im, pr) in enumerate(rendered.screens):
        bad = bool(pr) or bool(rendered.errors)
        frame = Image.new("RGB", (w, heights[k]), RED if bad else (0x90, 0xA0, 0xC8))
        frame.paste(im, (FRAME, FRAME))
        out.paste(frame, (2, y))
        y += heights[k] + 2
    if not rendered.screens:                                      # syntax error: only a red empty box
        out.paste(Image.new("RGB", (w, heights[0]), RED), (2, y))
    if scale != 1:
        out = out.resize((out.width * scale, out.height * scale), Image.NEAREST)
    return out


def contact_sheet(items, columns=3, scale=2):
    """items: [(label, Rendered)] -> one image (rows of `columns` dialogs)"""
    from PIL import Image
    ims = [compose(r, scale=scale, label=lab) for lab, r in items]
    if not ims:
        return Image.new("RGB", (8, 8), BG)
    cw = max(i.width for i in ims) + 4 * scale
    rows = [ims[i:i + columns] for i in range(0, len(ims), columns)]
    hs = [max(i.height for i in row) + 4 * scale for row in rows]
    out = Image.new("RGB", (cw * min(columns, len(ims)) + 4 * scale, sum(hs) + 4 * scale), BG)
    y = 2 * scale
    for row, h in zip(rows, hs):
        for k, im in enumerate(row):
            out.paste(im, (2 * scale + k * cw, y))
        y += h
    return out


# ---------------------------------------------------------------- command line
def parse_ids(spec):
    """'0x0123,0x0200-0x0210,12' -> sorted list of ids"""
    out = set()
    for part in spec.split(","):
        part = part.strip()
        if not part:
            continue
        a, _, b = part.partition("-")
        lo = int(a, 0)
        hi = int(b, 0) if b else lo
        out.update(range(lo, hi + 1))
    return sorted(out)


def main(argv=None):
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("lang")
    sel = ap.add_mutually_exclusive_group()
    sel.add_argument("--ids", help="ids, e.g. 0x0123,0x0200-0x0210")
    sel.add_argument("--range", nargs=2, metavar=("FIRST", "LAST"))
    sel.add_argument("--all", action="store_true", help="every translated id")
    sel.add_argument("--text", help="preview this text instead of dialogs.txt (fixture / quick test)")
    sel.add_argument("--file", help="preview the blocks of this file (translation source syntax)")
    ap.add_argument("--sheet", action="store_true", help="one contact sheet instead of one PNG per id")
    ap.add_argument("--columns", type=int, default=3)
    ap.add_argument("--scale", type=int, default=3)
    ap.add_argument("--only-problems", action="store_true", help="draw only the ids that have an error or a missing glyph")
    ap.add_argument("--out", help="output directory (files) or PNG path (--sheet / --text); default build/translate/preview/")
    ap.add_argument("--assets")
    a = ap.parse_args(argv)
    lang = C.Lang(C.lang_dir(a.lang))
    ctx = C.Context(a.assets) if C.have_assets("jp", a.assets) else None
    vm = ctx.vm if ctx else C.VarMap()
    nd = ctx.ndigits if ctx else None
    src = load_glyphs(lang)
    if a.text is not None:
        blocks = {0: (set(), a.text)}
    elif a.file:
        blocks = {i: (fl, t) for i, fl, t in C.read_blocks(a.file)}
    else:
        blocks = C.load_translation(lang)
    if a.ids:
        want = parse_ids(a.ids)
    elif a.range:
        lo, hi = int(a.range[0], 0), int(a.range[1], 0)
        want = [i for i in sorted(blocks) if lo <= i <= hi]
    else:
        want = sorted(blocks)
    items, bad, missing = [], 0, []
    for i in want:
        if i not in blocks:
            missing.append(i)
            continue
        flags, text = blocks[i]
        r = render_text(text, lang, src, vm, nd, flags)
        if not r.ok:
            bad += 1
        if a.only_problems and r.ok:
            continue
        items.append(("%04X" % i + ("" if r.ok else " !"), r, i))
    outp = Path(a.out) if a.out else C.WORK / "preview"
    if a.sheet or a.text is not None:
        if outp.suffix.lower() != ".png":
            outp = outp / ("%s_sheet.png" % lang.code if a.sheet else "text.png")
        outp.parent.mkdir(parents=True, exist_ok=True)
        img = contact_sheet([(l, r) for l, r, _ in items], a.columns, a.scale) if a.sheet else compose(items[0][1], a.scale, items[0][0])
        img.save(outp)
        print("wrote %s (%d dialog(s))" % (outp, len(items)))
    else:
        outp.mkdir(parents=True, exist_ok=True)
        for lab, r, i in items:
            compose(r, a.scale, lab).save(outp / ("%s_%04X.png" % (lang.code, i)))
        print("wrote %d file(s) to %s" % (len(items), outp))
    if missing:
        print("not translated (skipped): %d id(s), first 0x%04X" % (len(missing), missing[0]))
    print("preview: %d of %d dialog(s) have problems%s" % (bad, len(want) - len(missing), "" if not bad else " (red frame / magenta cross; run check.py for the messages)"))
    return 0


if __name__ == "__main__":
    sys.exit(main())
