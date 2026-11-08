#!/usr/bin/env python3
"""Text in graphics: picture overrides of a translation (translations/<lang>/gfx/) applied at translation-build time.

  python tools/translate/gfx.py list [--all]              candidate screens (names only): the name tables that the other releases replace (text in tiles)
  python tools/translate/gfx.py template Screen_X [--out FILE]    an empty override canvas of the right size (every pixel = KEEP) to draw the new cells on
  python tools/translate/gfx.py check pl                  validate the overrides of a language (dimensions, palette indices, free tiles), print the counts
  python tools/translate/gfx.py build pl                  write the override blobs into assets/gfx/{tiles,characters,palettes}/translation/ (used by tools/build.py --translation)

Mechanism.  A screen is a BG name table (assets/gfx/characters/<Screen>.bin) drawn with the tile blobs listed in its sidecar (assets/gfx/tilemaps/<Screen>.json); the
composed pictures of docs/formats/graphics-png.md show it as one indexed PNG (pixel value = palette row << 4 | colour index, one 8x8 cell per name table entry).  An override
PNG `translations/<lang>/gfx/<Screen>.png` has the same size.  Cells that hold the value KEEP (255) everywhere are not touched, so an override only needs the cells that
change (the repository then holds none of the original pixels).  For every cell that differs from the original picture the tool
  1. looks for an existing tile with exactly these pixels (also mirrored) and points the name table entry at it, otherwise
  2. writes the pixels into a FREE tile (an all-zero tile that no name table of any screen with these tile sets refers to) and points the entry at that,
and keeps the priority bit of the entry.  Shared tiles of other screens are never edited, so no picture can contradict another.  The result is recompressed with the
game's LZSS codec and written as `translation/<label>.bin` next to the shared blobs; the build then includes the blobs through `!{REGDIR}` (src/common/region.asm,
`!TRANSLATION_GFX`).  A bank has to stay within $8000 bytes (checked here against defs/gfx/banks.json).  The four original releases never see these files.
`lang.json` key `"gfx": {"name_grid": true}` also generates the 18 letters of the name entry grid (translations/<lang>/name_grids.txt) from the generated glyphs
(tools/translate/glyphs.py): the picture of the name entry screen uses the dialog font, so each new letter is the glyph cell of the language.
"""
import argparse
import json
import shutil
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import common as C                                          # noqa: E402

sys.path.insert(0, str(C.ROOT / "tools" / "gfx"))
import tilemap_codec as TC                                  # noqa: E402
import tiles as TL                                          # noqa: E402

KEEP = 255
PAD = bytes(64)
TILE_BYTES = 32
ENTRY_TILE, ENTRY_PAL_SHIFT, ENTRY_PRIO, ENTRY_HFLIP, ENTRY_VFLIP = 0x03FF, 10, 0x2000, 0x4000, 0x8000
TRANSLATION_DIR = "translation"
KINDS = {"tiles": ("assets/gfx/tiles", "bin"), "characters": ("assets/gfx/characters", "bin"), "palettes": ("assets/gfx/palettes", "pal"),
         "sprites": ("assets/gfx/sprites", "bin")}


class GfxError(ValueError):
    pass


# ---------------------------------------------------------------- blobs
def read_blob(root, kind, label):
    """-> (raw payload, tail bytes) of a compressed .bin (the tail is whatever follows the stream inside the label span)"""
    d, ext = KINDS[kind]
    data = (Path(root) / d / ("%s.%s" % (label, ext))).read_bytes()
    raw, used = TC.decompress(data + PAD)
    if used > len(data):
        raise GfxError("%s: the stream runs past the end of the blob" % label)
    return raw, data[used:]


def blob_bytes(raw, tail, old_size=None):
    """recompressed blob; a shorter stream is padded with zeros up to the original size when the tail is zero, so that the layout of the bank does not move"""
    stream = TC.compress(raw)
    if old_size is not None and len(stream) + len(tail) < old_size and not any(tail):
        tail = bytes(old_size - len(stream))
    return stream + tail


def flip_tile(px, h, v):
    rows = [list(r) for r in px]
    if v:
        rows.reverse()
    if h:
        rows = [r[::-1] for r in rows]
    return rows


class Screen:
    """A name table with its tile sets, decompressed.  tiles[n] = pixels (8 rows of 8 colour indices) of tile n (0-1023), None if the set is missing."""

    def __init__(self, root, label):
        self.root, self.label = Path(root), label
        meta_path = self.root / "assets/gfx/tilemaps" / ("%s.json" % label)
        if not meta_path.exists():
            raise GfxError("%s: unknown screen (no assets/gfx/tilemaps/%s.json; run tools/extract.py)" % (label, label))
        self.meta = json.loads(meta_path.read_text(encoding="utf-8"))
        self.cols = self.meta["columns"]
        self.raw, self.tail = read_blob(root, "characters", label)
        self.words = [self.raw[i] | self.raw[i + 1] << 8 for i in range(0, len(self.raw) - 1, 2)]
        self.rows = (len(self.words) + self.cols - 1) // self.cols
        sets = []
        for s in self.meta["tile_sets"]:
            name, _, addr = s.partition("@$")
            sets.append((name, int(addr, 16)))
        base = min(a for _, a in sets)
        self.sets = {}                                         # set index (n // 256) -> label
        for name, a in sets:
            self.sets[(a - base) // 0x1000] = name
        self.tile_raw = {}
        self.tile_tail = {}
        for k, name in self.sets.items():
            self.tile_raw[name], self.tile_tail[name] = read_blob(root, "tiles", name)

    def tile_data(self, n):
        """(label, offset) of tile n or None"""
        name = self.sets.get(n // 256)
        return None if name is None else (name, (n % 256) * TILE_BYTES)

    def tile(self, n):
        td = self.tile_data(n)
        return None if td is None else TL.decode_tile(self.tile_raw[td[0]], td[1], 4)

    def cell_pixels(self, cx, cy):
        """64 values (palette row << 4 | colour) of the cell as the game draws it"""
        w = self.words[cy * self.cols + cx]
        t = self.tile(w & ENTRY_TILE)
        if t is None:
            return [0] * 64
        t = flip_tile(t, w & ENTRY_HFLIP, w & ENTRY_VFLIP)
        pal = (w >> ENTRY_PAL_SHIFT & 7) << 4
        return [pal | v for r in t for v in r]

    def render(self):
        from PIL import Image
        im = Image.new("P", (self.cols * 8, self.rows * 8))
        px = im.load()
        for cy in range(self.rows):
            for cx in range(self.cols):
                p = self.cell_pixels(cx, cy)
                for i, v in enumerate(p):
                    px[cx * 8 + i % 8, cy * 8 + i // 8] = v
        return im


def referenced_tiles(root, sets):
    """tile numbers used by any name table whose tile sets are the same (conservative: any sidecar listing one of the labels)"""
    ref = set()
    want = set(sets)
    for j in sorted((Path(root) / "assets/gfx/tilemaps").glob("*.json")):
        m = json.loads(j.read_text(encoding="utf-8"))
        if want & {s.partition("@")[0] for s in m.get("tile_sets", [])}:
            raw, _ = read_blob(root, "characters", m["label"])
            ref |= {(raw[i] | raw[i + 1] << 8) & ENTRY_TILE for i in range(0, len(raw) - 1, 2)}
    return ref


# ---------------------------------------------------------------- overrides
def load_png_cells(path, scr):
    """override PNG -> {(cx, cy): 64 values}; cells that are entirely KEEP are left out.  Raises GfxError."""
    from PIL import Image
    im = Image.open(path)
    if im.mode != "P":
        raise GfxError("%s: not an indexed PNG (mode %s); the pixel value is the colour index" % (Path(path).name, im.mode))
    if im.size != (scr.cols * 8, scr.rows * 8):
        raise GfxError("%s: size %dx%d, the screen %s is %dx%d" % (Path(path).name, im.width, im.height, scr.label, scr.cols * 8, scr.rows * 8))
    px = im.load()
    out = {}
    for cy in range(scr.rows):
        for cx in range(scr.cols):
            cell = [px[cx * 8 + i % 8, cy * 8 + i // 8] for i in range(64)]
            if all(v == KEEP for v in cell):
                continue
            bad = sorted({v for v in cell if v >= 128 and v != KEEP})
            if bad:
                raise GfxError("%s: cell (%d,%d) uses palette index %d; indices are palette row << 4 | colour (0-127) or KEEP (255)" % (Path(path).name, cx, cy, bad[0]))
            if KEEP in cell:
                raise GfxError("%s: cell (%d,%d) mixes KEEP with drawn pixels; fill the whole 8x8 cell" % (Path(path).name, cx, cy))
            out[(cx, cy)] = cell
    return out


def name_grid_cells(lang, scr, glyph_px=None):
    """The picture cells of the language letters of the name entry grid -> {(cx, cy): 64 values}.
    Position of grid cell (x, y): the 8x16 letter block starts at pixel (x - 8, y - 4); the block holds the glyph cell of the dialog font."""
    import glyphs as G
    import namegrid as NG
    cfg = lang.cfg.get("gfx", {})
    if not cfg.get("name_grid") or lang.cfg.get("grids", {}).get("enabled", True) is False or "grids" not in lang.cfg:
        return {}
    if scr.label != "Screen_Menu_Characters":
        raise GfxError("the name grid letters belong to Screen_Menu_Characters")
    rows = NG.load_override(lang)
    if rows is None:
        return {}
    gl = glyph_px if glyph_px is not None else G.build_glyphs(lang, G.engine_tables(lang.engine_region))
    ids = {g["id"] for g in lang.glyphs.values()}
    out = {}
    for r in rows:
        x, y, gid = r[0], r[1], r[6]
        if gid not in ids:
            continue
        px = gl.get(gid)
        if px is None:
            raise GfxError("no glyph pixels for the letter $%02X of the grid cell at (%d,%d)" % (gid, x, y))
        tx, ty = (x - 8) // 8, (y - 4) // 8
        for part in (0, 1):
            cell = []
            for yy in range(8):
                for xx in range(8):
                    v = px[(part * 8 + yy) * 16 + xx]
                    cell.append(v)                              # palette row 0 (the grid letters use row 0)
            out[(tx, ty + part)] = cell
    return out


class Session:
    """All overrides of a build: shared tile blobs (several screens use the same sets), free tile pool, statistics."""

    def __init__(self, root):
        self.root = Path(root)
        self.screens = {}
        self.pools = {}                                         # tuple(sorted set labels) -> list of free tile numbers
        self.stats = {}

    def screen(self, label):
        s = self.screens.get(label)
        if s is None:
            s = self.screens[label] = Screen(self.root, label)
            for other in self.screens.values():                  # screens with the same tile set share the raw data
                if other is not s:
                    for name in s.tile_raw:
                        if name in other.tile_raw:
                            s.tile_raw[name] = other.tile_raw[name]
        return s

    def free_pool(self, scr):
        key = tuple(sorted(scr.sets.values()))
        if key not in self.pools:
            ref = referenced_tiles(self.root, scr.sets.values())
            pool = []
            for n in range(256 * len(scr.sets)):
                td = scr.tile_data(n)
                if td is None or n in ref or n == 0:                  # tile 0 is what a cleared name table buffer shows: never reuse it
                    continue
                if not any(scr.tile_raw[td[0]][td[1]:td[1] + TILE_BYTES]):
                    pool.append(n)
            self.pools[key] = pool
        return self.pools[key]

    def apply(self, scr, cells):
        """cells {(cx, cy): 64 values} -> name table and tile edits.  Returns (changed cells, reused, new tiles)."""
        pool = self.free_pool(scr)
        index = {}
        for n in range(256 * len(scr.sets)):                    # existing tiles: pixels -> (n, hflip, vflip), the plain orientation first
            t = scr.tile(n)
            if t is None:
                continue
            for h, v in ((0, 0), (1, 0), (0, 1), (1, 1)):
                index.setdefault(tuple(x for r in flip_tile(t, h, v) for x in r), (n, h, v))
        changed = reused = new = 0
        for (cx, cy), cell in sorted(cells.items(), key=lambda kv: (kv[0][1], kv[0][0])):
            if not (0 <= cx < scr.cols and 0 <= cy < scr.rows):
                raise GfxError("%s: cell (%d,%d) is outside the screen" % (scr.label, cx, cy))
            if cell == scr.cell_pixels(cx, cy):
                continue
            pals = {v >> 4 for v in cell if v & 15}
            if len(pals) > 1:
                raise GfxError("%s: cell (%d,%d) mixes the palette rows %s; a tile has one row (the name table entry)" % (scr.label, cx, cy, sorted(pals)))
            k = cy * scr.cols + cx
            old = scr.words[k]
            pal = pals.pop() if pals else (old >> ENTRY_PAL_SHIFT & 7)
            colours = tuple(v & 15 for v in cell)
            hit = index.get(colours)
            if hit is None:
                if not pool:
                    raise GfxError("%s: no free tile left for cell (%d,%d) (the tile sets have no unused blank tiles)" % (scr.label, cx, cy))
                n = pool.pop(0)
                name, off = scr.tile_data(n)
                data = bytearray(scr.tile_raw[name])
                data[off:off + TILE_BYTES] = TL.encode_tile([list(colours[i * 8:i * 8 + 8]) for i in range(8)], 4)
                scr.tile_raw[name] = bytes(data)
                for other in self.screens.values():
                    if name in other.tile_raw:
                        other.tile_raw[name] = scr.tile_raw[name]
                index[colours] = (n, 0, 0)
                hit = (n, 0, 0)
                new += 1
            else:
                reused += 1
            n, h, v = hit
            scr.words[k] = (old & ENTRY_PRIO) | n | pal << ENTRY_PAL_SHIFT | (ENTRY_HFLIP if h else 0) | (ENTRY_VFLIP if v else 0)
            changed += 1
        scr.raw = b"".join(w.to_bytes(2, "little") for w in scr.words) + scr.raw[len(scr.words) * 2:]
        return changed, reused, new


# ---------------------------------------------------------------- language overrides
def lang_override_files(lang):
    d = lang.dir / "gfx"
    return sorted(d.glob("*.png")) if d.is_dir() else []


def lang_has_gfx(lang):
    return bool(lang_override_files(lang)) or bool(lang.cfg.get("gfx", {}).get("name_grid"))


def bank_fit(root, label, kind, new_size):
    """-> message if the bank of the label would exceed $8000 bytes with the new blob size"""
    sys.path.insert(0, str(C.ROOT / "tools" / "data"))
    import gfxbanks
    for k, banks in gfxbanks.load_layout(root).items():
        for bank, b in banks.items():
            names = [x.lstrip("*") for x in b["blobs"]]
            if label in names and "sizes" in b:
                sizes = list(b["sizes"])
                sizes[names.index(label)] = new_size
                total = sum(sizes) + (b["pad"] if isinstance(b["pad"], int) else 0)
                if total > gfxbanks.BANK:
                    return "bank $%s (%s) would hold %d bytes after replacing %s (limit %d)" % (bank, k, total, label, gfxbanks.BANK)
    return None


def build_overrides(lang, root=None, out=print):
    """Compute the override blobs of a language -> {(kind, label): bytes}; raises GfxError.  Does not write anything."""
    root = Path(root or C.ROOT)
    sess = Session(root)
    report = []
    files = lang_override_files(lang)
    for f in files:
        label = f.stem
        scr = sess.screen(label)
        cells = load_png_cells(f, scr)
        ch, re_, nw = sess.apply(scr, cells)
        report.append((label, f.name, ch, re_, nw))
    if lang.cfg.get("gfx", {}).get("name_grid"):
        scr = sess.screen(lang.cfg["gfx"].get("name_grid_screen", "Screen_Menu_Characters"))
        cells = name_grid_cells(lang, scr)
        ch, re_, nw = sess.apply(scr, cells)
        report.append((scr.label, "name entry grid letters", ch, re_, nw))
    blobs = {}
    for scr in sess.screens.values():
        orig_raw, orig_tail = read_blob(root, "characters", scr.label)
        if scr.raw != orig_raw:
            osz = len((root / KINDS["characters"][0] / ("%s.bin" % scr.label)).read_bytes())
            blobs[("characters", scr.label)] = blob_bytes(scr.raw, scr.tail, osz)
        for name, raw in scr.tile_raw.items():
            o, tail = read_blob(root, "tiles", name)
            if raw != o:
                osz = len((root / KINDS["tiles"][0] / ("%s.bin" % name)).read_bytes())
                blobs[("tiles", name)] = blob_bytes(raw, scr.tile_tail[name], osz)
    for (kind, label), data in sorted(blobs.items()):
        msg = bank_fit(root, label, kind, len(data))
        if msg:
            raise GfxError(msg)
    return blobs, report


def write_overrides(lang, root=None, out=print):
    """Write assets/gfx/<kind>/translation/<label>.bin: the changed blobs plus a copy of every other blob that the bank asm includes through !{REGDIR}.
    -> number of changed blobs (0 = nothing to do, the build then does not define !TRANSLATION_GFX)"""
    root = Path(root or C.ROOT)
    blobs, report = build_overrides(lang, root)
    for label, src, ch, re_, nw in report:
        out("gfx %s: %s: %d cell(s) changed, %d tile(s) reused, %d new tile(s)" % (label, src, ch, re_, nw))
    if not blobs:
        return 0
    sys.path.insert(0, str(C.ROOT / "tools" / "data"))
    import gfxbanks
    for label, kind in sorted(gfxbanks.regional_labels(root).items()):
        d, ext = KINDS[kind]
        dst = root / d / TRANSLATION_DIR / ("%s.%s" % (label, ext))
        dst.parent.mkdir(parents=True, exist_ok=True)
        if (kind, label) in blobs:
            dst.write_bytes(blobs[(kind, label)])
        else:
            shutil.copyfile(root / d / ("%s.%s" % (label, ext)), dst)
    for (kind, label) in blobs:
        if (kind, label) not in {(k, l) for l, k in gfxbanks.regional_labels(root).items()}:
            raise GfxError("%s %s is not included through !{REGDIR}: mark it with * in defs/gfx/banks.json" % (kind, label))
    out("gfx: %d blob(s) replaced (%s)" % (len(blobs), ", ".join("%s" % l for _, l in sorted(blobs))))
    return len(blobs)


def clean_overrides(root=None):
    root = Path(root or C.ROOT)
    for d, _ in KINDS.values():
        shutil.rmtree(root / d / TRANSLATION_DIR, ignore_errors=True)


# ---------------------------------------------------------------- command line
def candidates(root):
    """[(label, columns x rows, regional)] of the screens (name tables with tile sets); regional = another release has its own version (text in tiles)"""
    sys.path.insert(0, str(C.ROOT / "tools" / "data"))
    import gfxbanks
    regional = set(gfxbanks.regional_labels(root))
    out = []
    for j in sorted((Path(root) / "assets/gfx/tilemaps").glob("*.json")):
        m = json.loads(j.read_text(encoding="utf-8"))
        if m.get("tile_sets"):
            out.append((m["label"], "%dx%d" % (m["columns"], (m["entries"] + m["columns"] - 1) // m["columns"]), m["label"] in regional))
    return out


def main(argv=None):
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    sub = ap.add_subparsers(dest="cmd", required=True)
    p = sub.add_parser("list"); p.add_argument("--all", action="store_true", help="every screen, not only the ones another release replaces")
    p = sub.add_parser("template"); p.add_argument("screen"); p.add_argument("--out")
    p = sub.add_parser("check"); p.add_argument("lang")
    p = sub.add_parser("build"); p.add_argument("lang")
    a = ap.parse_args(argv)
    try:
        if a.cmd == "list":
            n = 0
            for label, size, regional in candidates(C.ROOT):
                if regional or a.all:
                    print("%-48s %-8s %s" % (label, size, "text in tiles (other releases replace it)" if regional else ""))
                    n += 1
            print("%d screen(s)" % n)
        elif a.cmd == "template":
            from PIL import Image
            scr = Screen(C.ROOT, a.screen)
            im = Image.new("P", (scr.cols * 8, scr.rows * 8), KEEP)
            src_png = C.ROOT / "assets/gfx/png/screens" / ("%s.png" % a.screen)
            if src_png.exists():
                pal = Image.open(src_png).getpalette() or []
                im.putpalette((pal + [0] * 768)[:765] + [255, 0, 255])
            out = Path(a.out or C.WORK / "gfx" / ("%s.png" % a.screen))
            out.parent.mkdir(parents=True, exist_ok=True)
            im.save(out)
            print("wrote %s: %dx%d pixels, every pixel is KEEP (255); draw whole 8x8 cells with palette row << 4 | colour (0-127)" % (out, im.width, im.height))
        else:
            lang = C.Lang(C.lang_dir(a.lang))
            if a.cmd == "check":
                blobs, report = build_overrides(lang)
                for label, src, ch, re_, nw in report:
                    print("%s: %s: %d cell(s) changed, %d tile(s) reused, %d new tile(s)" % (label, src, ch, re_, nw))
                print("gfx check %s: %d screen override(s), %d blob(s) would be replaced" % (lang.code, len(report), len(blobs)))
            else:
                n = write_overrides(lang)
                print("gfx build %s: %d blob(s)" % (lang.code, n))
    except GfxError as e:
        print("ERROR: %s" % e, file=sys.stderr)
        return 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
