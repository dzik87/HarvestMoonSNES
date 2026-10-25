#!/usr/bin/env python3
"""Composed (whole image) graphics sources.  Used by tools/gfx/pngsync.py; see docs/formats/graphics-png.md.

Tile graphics and sprite banks are edited as COMPOSED images, the build splits them back into the tiles / sprite blocks of the engine:

  sprites   assets/gfx/png/frames/obj_XXXX/f_PPPP.png   one image per object animation frame (components of banks $86/$87 drawn
            as the engine draws them: flips, palette row, last component on top); pixel = (OBJ palette << 4) | colour, 0 = transparent
  screens   assets/gfx/png/screens/<table>[__<map>].png  one image per BG name table and tile-set combination: the name table rendered
            with the tile blobs it is shown with; pixel = (name table palette << 4) | colour
  remainder assets/gfx/png/{tiles,sprites}/<label>.png   128 px wide sheet of the blob holding ONLY the pixels that no composed image
            determines (tiles no name table shows, sprite pixels hidden by overlapping components, unused sprite blocks), 0 elsewhere

A pixel of a blob is determined by a composed image when exactly one cell / component shows it (a name table cell shows one tile pixel
completely; a sprite component pixel is determined where no other component of the frame covers it).  The build collects these claims from
all images, reports contradicting claims, and takes every other pixel from the remainder sheet.  `import` (edit detection) needs a baseline:
the previous .bin is rendered, the images are compared with the render, and only the differing pixels become claims.
"""
import array
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / "tools" / "gfx"))
sys.path.insert(0, str(ROOT / "tools" / "objects"))
import pngsync as P  # noqa: E402

W = 128                                     # every sheet is 16 tiles = 128 px wide
SPR = 16
UNC = 255                                   # claim array: no image determines this pixel
LOW = bytes(v & 15 for v in range(256))
BAD = [bytes(1 if (v & 15) and (v >> 4) != p else 0 for v in range(256)) for p in range(8)]    # colour set but wrong palette row
ADD = [bytes(v | (p << 4) for v in range(256)) for p in range(8)]
TILE_PREFIX = ("Tiles_", "Sprites_")
MAX_ERRORS = 40
SPRITE_BANKS = 10
FIRST_BANK = 0x88


def kind_of(label):
    return "tiles" if label.startswith("Tiles_") else "sprites"


def png_root(root, region):
    root = Path(root)
    return root / "assets" / "gfx" / "png" / (region if region != "us" else "")


def screens_dir(root, region):
    return png_root(root, region) / "screens"


def frames_dir(root):
    return Path(root) / "assets" / "gfx" / "png" / "frames"


# ----------------------------------------------------------------------------------------------------------------------
# claims
# ----------------------------------------------------------------------------------------------------------------------
class Claims:
    """pixel values determined by the composed images, per blob label (255 = nobody claims the pixel)."""

    def __init__(self, sizes):
        self.sizes = sizes
        self.val = {}
        self.src = {}
        self.names = []
        self.errors = []
        self.nerr = 0
        self._ids = {}

    def sid(self, name):
        if name not in self._ids:
            self._ids[name] = len(self.names)
            self.names.append(name)
        return self._ids[name]

    def error(self, msg):
        self.nerr += 1
        if len(self.errors) < MAX_ERRORS:
            self.errors.append(msg)

    def _arr(self, label):
        if label not in self.val:
            n = self.sizes[label]
            self.val[label] = bytearray([UNC]) * n
            self.src[label] = array.array("i", [-1]) * n
        return self.val[label], self.src[label]

    def where(self, label, off):
        y, x = divmod(off, W)
        if label.startswith("Sprites_"):
            u = (y // 16) * 8 + x // 16
            return f"sprite id ${(int(label[8:10], 16) - FIRST_BANK) * 256 + u:04X} ({label}) pixel ({x % 16},{y % 16})"
        return f"tile {(y // 8) * 16 + x // 8} ({label}) pixel ({x % 8},{y % 8})"

    def put(self, label, off, data, sid):
        """claim len(data) pixels starting at sheet offset `off`; data bytes of 255 are skipped."""
        v, s = self._arr(label)
        n = len(data)
        cur = v[off:off + n]
        if cur == data:
            return
        if cur.count(UNC) == n:
            v[off:off + n] = data
            s[off:off + n] = array.array("i", [sid]) * n
            return
        for i in range(n):
            d = data[i]
            if d == UNC:
                continue
            c = cur[i]
            if c == UNC:
                v[off + i] = d
                s[off + i] = sid
            elif c != d:
                other = self.names[s[off + i]]
                who = (f"two cells / components of {other} show it with colour {c} and {d}" if other == self.names[sid]
                       else f"{other} has colour {c}, {self.names[sid]} has colour {d}")
                self.error(f"conflict at {self.where(label, off + i)}: {who} (a shared tile / sprite block was changed differently "
                           "in two places; make them agree, or change it in only one and run `pngsync.py import`)")


# ----------------------------------------------------------------------------------------------------------------------
# context: which blobs, screens and frames exist for a release
# ----------------------------------------------------------------------------------------------------------------------
def sheet_height(meta):
    rows = (meta["raw_size"] // 32 + 15) // 16
    return rows * 8


class Screen:
    def __init__(self, name, table, cols, words, sets, pal, targets):
        self.name, self.table, self.cols, self.words, self.sets, self.pal = name, table, cols, words, sets, pal
        self.rows = (len(words) + cols - 1) // cols
        self.width, self.height = cols * 8, self.rows * 8
        self.targets = targets                     # n (0-1023) -> (label, tile) or None


class Frame:
    def __init__(self, path, bank, ptr, obj, comps, S):
        self.path, self.bank, self.ptr, self.obj, self.comps = path, bank, ptr, obj, comps
        if comps:
            xs = [S.s8(c.x) for c in comps]
            ys = [S.s8(c.y) for c in comps]
            self.ox, self.oy = -min(xs), -min(ys)
            self.w, self.h = max(xs) + SPR - min(xs), max(ys) + SPR - min(ys)
            self.pos = [(S.s8(c.x) + self.ox, S.s8(c.y) + self.oy) for c in comps]
        else:
            self.ox = self.oy = self.w = self.h = 0
            self.pos = []


class Ctx:
    def __init__(self, root, region, labels=None):
        self.root, self.region = Path(root), region
        self.blobs = {}
        for kind in ("tiles", "sprites"):
            if labels is None:
                for b in P.blobs(root, None, kind, from_sources=True, region=region):
                    self.blobs[b.label] = b
            else:
                for lab in labels:
                    if kind_of(lab) == kind:
                        self.blobs[lab] = P.Blob(kind, lab, root, region)
        self._meta = {}
        self._screens = None
        self._frames = None

    def blob(self, label):
        """Blob object for a label as this release uses it (own source, else the shared US blob)."""
        return self.blobs.get(label) or P.Blob(kind_of(label), label, self.root, "us")

    def meta(self, label):
        if label not in self._meta:
            self._meta[label] = P.read_meta(self.blob(label))
        return self._meta[label]

    @property
    def sizes(self):
        return {lab: W * sheet_height(self.meta(lab)) for lab in self.blobs}

    # ---- screens
    @property
    def screens(self):
        if self._screens is None:
            self._screens = self._build_screens()
        return self._screens

    def _table_words(self, table):
        k = P.KINDS["tilemaps"]
        for region in ([self.region] if self.region != "us" else []) + ["us"]:
            p = self.root / P.region_dirs(k, region)[1] / f"{table}.map.txt"
            if p.exists():
                raw = P.parse_nametable(p.read_text(encoding="utf-8"))
                cols = P.read_meta(P.Blob("tilemaps", table, self.root, region)).get("columns", 32)
                return [raw[i] | raw[i + 1] << 8 for i in range(0, len(raw) - 1, 2)], cols
        raise FileNotFoundError(table)

    def _build_screens(self):
        info = P.map_table(self.root)
        out = []
        for table in sorted(info):
            if not table.startswith(("Screen_", "ScreenRaw_")):
                continue
            combos = {}
            for dest, mlabel, pairs in info[table]:
                sets = tuple((d, l) for d, l in pairs if l.startswith(TILE_PREFIX))
                combos.setdefault((sets, P.bg_chr_base(self.root, mlabel, dest)), mlabel)
            for (sets, chr_base), mlabel in combos.items():
                if not any(l in self.blobs and kind_of(l) == "tiles" for _, l in sets):
                    continue
                words, cols = self._table_words(table)
                name = table if len(combos) == 1 else f"{table}__{mlabel}"
                pid = P.map_palette_id(mlabel, self.root)
                pal = P.view_palette128(pid, self.root) if pid else [c for c in P.grayscale_palette(4)] * 8
                szs = [(d, l, self.meta(l)["raw_size"] // 2) for d, l in sets]

                def resolve(base):
                    out_t = []
                    for n in range(1024):
                        addr = base + n * 16
                        t = None
                        for d, l, words_ in reversed(szs):
                            if d <= addr and addr + 16 <= d + words_:
                                t = (l, (addr - d) // 16)
                                break
                        out_t.append(t)
                    return out_t
                if chr_base is not None:
                    targets = resolve(chr_base)
                else:
                    # no graphic preset in the map header (area >= $57, weather overlays, menus, intro): the BG keeps the character base
                    # of the preset that is active; take the 4K-word base under which the most used tiles are found (ties: $2000 first)
                    used = {w & 0x3FF for w in words if w & 0x3FF}
                    cands = [b for b in (0x2000, 0x1000, 0x3000, 0x4000, 0x5000, 0) if b <= min(d for d, _ in sets)]
                    best = max(cands, key=lambda b: (sum(1 for n in used if resolve(b)[n]), -cands.index(b))) if cands else 0x2000
                    targets = resolve(best)
                out.append(Screen(name, table, cols, words, sets, pal, targets))
        return out

    # ---- frames (US only)
    @property
    def frames(self):
        if self._frames is None:
            self._frames = self._build_frames() if self.region == "us" else []
        return self._frames

    def _build_frames(self):
        import spriteexport as S
        self.S = S
        data = S.ObjectData()
        fdir = frames_dir(self.root)
        out = []
        for idx in range(data.total):
            bank, _ = data.list_ptr(idx)
            seen = []
            for fp, _t in data.steps(idx):
                if fp not in seen:
                    seen.append(fp)
            for fp in seen:
                comps = data.frame(bank, fp)
                if comps:
                    out.append(Frame(fdir / f"obj_{idx:04X}" / f"f_{fp:04X}.png", bank, fp, idx, comps, S))
        for bank, ptr in data.unreferenced_frames():
            comps = data.frame(bank, ptr)
            if comps:
                out.append(Frame(fdir / "unreferenced" / f"f_{bank:02X}{ptr:04X}.png", bank, ptr, -1, comps, S))
        return out


_CTX = {}


def reset():
    _CTX.clear()


def get_ctx(root, region, labels=None):
    key = (str(root), region, tuple(sorted(labels)) if labels else None)
    if key not in _CTX:
        _CTX[key] = Ctx(root, region, labels)
    return _CTX[key]


# ----------------------------------------------------------------------------------------------------------------------
# rendering (baseline sheets -> composed images)
# ----------------------------------------------------------------------------------------------------------------------
def render_screen(scr, sheets):
    img = bytearray(scr.width * scr.height)
    cols, W8 = scr.cols, scr.width
    for i, w in enumerate(scr.words):
        cx, cy = i % cols, i // cols
        pal = (w >> 10) & 7
        hf, vf = w & 0x4000, w & 0x8000
        t = scr.targets[w & 0x3FF]
        if t is None:
            continue
        sp = sheets.get(t[0])
        if sp is None:
            continue
        tx, ty = (t[1] % 16) * 8, (t[1] // 16) * 8
        add = ADD[pal]
        for y in range(8):
            row = sp[(ty + y) * W + tx:(ty + y) * W + tx + 8]
            if hf:
                row = row[::-1]
            o = (cy * 8 + (7 - y if vf else y)) * W8 + cx * 8
            img[o:o + 8] = row.translate(add)
    # cells without a target keep colour 0 of the entry's palette row
    for i, w in enumerate(scr.words):
        if scr.targets[w & 0x3FF] is None and (w >> 10) & 7:
            cx, cy = i % cols, i // cols
            for y in range(8):
                o = (cy * 8 + y) * W8 + cx * 8
                img[o:o + 8] = bytes([((w >> 10) & 7) << 4]) * 8
    return bytes(img)


class SheetView:
    """sprite16() provider for spriteexport.render_frame from the decoded sheets."""

    def __init__(self, sheets):
        self.sheets = sheets

    def sprite16(self, tid):
        sheet = tid >> 8
        if sheet >= SPRITE_BANKS:
            return [bytes(SPR)] * SPR
        sp = self.sheets["Sprites_%02X8000" % (FIRST_BANK + sheet)]
        u = tid & 0xFF
        x0, y0 = (u & 7) * SPR, (u >> 3) * SPR
        return [bytes(sp[(y0 + y) * W + x0:(y0 + y) * W + x0 + SPR]) for y in range(SPR)]


def render_frame(ctx, fr, view):
    w, h, ox, oy, pix = ctx.S.render_frame(view, fr.comps)
    assert (w, h, ox, oy) == (fr.w, fr.h, fr.ox, fr.oy)
    return pix


def decode_sheets(ctx, raws):
    return {lab: bytearray(P.decode_sheet(raw, 4, 16)[2]) for lab, raw in raws.items()}


# ----------------------------------------------------------------------------------------------------------------------
# name table width: continuity of the rendered image
# ----------------------------------------------------------------------------------------------------------------------
WIDTHS = (32, 64, 128)           # candidate row lengths (entries); the engine's map formats are 32x32 screens side by side
WIDTH_MARGIN = 0.05              # another width must be this much more continuous to replace the default
WIDTH_FAIL = 0.15                # `check`: declared width worse than the best candidate by more than this is an error
WIDTH_BAD = 1.3                  # seam ratio above this: the table still looks wrong whatever the width


KNOWN_COLUMNS = {"ScreenRaw_Unk_A6A096": 64}      # not shown with any tile set: layout known from its content (a raw 64x32 BG name table)


def default_columns(entries):
    """row length the engine's map formats use for a name table of this size (strcDialogDisplay.mapMultiWidth in
    src/code/bank_80/tilemaps.asm: 32 / 64 / 128 entries per row for 1 / 2 / 3+ screens wide)."""
    return 128 if entries >= 8192 else 64 if entries == 4096 else 32


def seam_ratio(img, w8, h8):
    """discontinuity metric: share of differing neighbour pixels ACROSS 8x8 cell borders divided by the share inside cells.  A correctly
    laid out picture has ~1 (borders are not special); a wrong row length places unrelated tiles side by side and gives clearly more.
    0 = nothing to judge (blank / flat image)."""
    bb = bt = ib = it = 0
    for y in range(h8):
        row = img[y * w8:(y + 1) * w8]
        for x in range(1, w8):
            d = (row[x - 1] & 15) != (row[x] & 15)
            if x % 8 == 0:
                bt += 1
                bb += d
            else:
                it += 1
                ib += d
    for y in range(1, h8):
        r0 = img[(y - 1) * w8:y * w8]
        r1 = img[y * w8:(y + 1) * w8]
        d = sum(1 for a, b in zip(r0, r1) if (a & 15) != (b & 15))
        if y % 8 == 0:
            bt += w8
            bb += d
        else:
            it += w8
            ib += d
    if ib == 0:
        return 0.0 if bb == 0 else 9.0
    return (bb / bt) / (ib / it)


def width_scores(scr, sheets):
    """{row length: seam ratio} of the screen's name table laid out with each candidate width"""
    out = {}
    for c in WIDTHS:
        s = Screen(scr.name, scr.table, c, scr.words, scr.sets, scr.pal, scr.targets)
        out[c] = seam_ratio(render_screen(s, sheets), s.width, s.height)
    return out


def suggest_width(scores, entries):
    best = min(scores, key=lambda c: (scores[c], c))
    d = default_columns(entries)
    return best if scores[d] - scores[best] >= WIDTH_MARGIN else d


def table_widths(ctx, sheets, tables=None):
    """{table: (declared, suggested, scores, shown)}; one entry per name table that is shown with a tile blob of this release."""
    out = {}
    for scr in ctx.screens:
        if scr.table in out or (tables is not None and scr.table not in tables):
            continue
        sc = width_scores(scr, sheets)
        out[scr.table] = (scr.cols, suggest_width(sc, len(scr.words)), sc, scr)
    return out


def audit_screen(scr, sheets):
    """facts about a rendered screen: cells with a tile id (non-zero), cells whose tile is not in any loaded tile set at the character base
    that was used (`unresolved`: drawn as colour 0 of their palette row, normally a wrong base), distinct colours, palette rows used."""
    used = [w for w in scr.words if w & 0x3FF]
    miss = sum(1 for w in used if scr.targets[w & 0x3FF] is None)
    img = render_screen(scr, sheets)
    return {"cells": len(scr.words), "used": len(used), "unresolved": miss, "colours": len(set(img)),
            "indices": len({v & 15 for v in img}), "palettes": sorted({v >> 4 for v in img})}


# ----------------------------------------------------------------------------------------------------------------------
# claims from images (build) and edit claims (import)
# ----------------------------------------------------------------------------------------------------------------------
def screen_claims(ctx, scr, w, h, pix, claims, base=None):
    """build: every cell showing a tile of an own tile blob claims the tile's pixels.  import (base = rendered baseline image):
    only the cells that differ from the baseline."""
    sid = claims.sid(f"screens/{scr.name}.png")
    if (w, h) != (scr.width, scr.height):
        claims.error(f"{claims.names[sid]}: image is {w}x{h}, expected {scr.width}x{scr.height} (name table size is fixed)")
        return
    if base is not None and pix.translate(LOW) == base.translate(LOW):
        return
    W8 = scr.width
    for i, word in enumerate(scr.words):
        cx, cy = i % scr.cols, i // scr.cols
        pal = (word >> 10) & 7
        tgt = scr.targets[word & 0x3FF]
        claimable = tgt is not None and tgt[0] in ctx.blobs and kind_of(tgt[0]) == "tiles"
        rows = [pix[(cy * 8 + y) * W8 + cx * 8:(cy * 8 + y) * W8 + cx * 8 + 8] for y in range(8)]
        if base is not None:
            brows = [base[(cy * 8 + y) * W8 + cx * 8:(cy * 8 + y) * W8 + cx * 8 + 8] for y in range(8)]
            if [r.translate(LOW) for r in rows] == [r.translate(LOW) for r in brows]:
                continue
            if not claimable:
                claims.error(f"{claims.names[sid]}: cell ({cx},{cy}) was edited but shows "
                             + ("no loaded tile" if tgt is None else f"a tile of {tgt[0]}, which is not editable here")
                             + " (shared with the US release or a sprite bank: edit it where it is defined)")
                continue
        elif not claimable:
            continue
        label, t = tgt
        tx, ty = (t % 16) * 8, (t // 16) * 8
        for y in range(8):
            row = rows[y]
            if any(row.translate(BAD[pal])):
                claims.error(f"{claims.names[sid]}: cell ({cx},{cy}) uses a colour from another palette row than the name table entry "
                             f"selects (row {pal}); the palette row is not changeable from the image")
                break
            data = row.translate(LOW)
            if base is not None:                                  # only the pixels that were edited, not the whole tile
                bd = brows[y].translate(LOW)
                if data == bd:
                    continue
                data = bytes(d if d != o else UNC for d, o in zip(data, bd))
            if word & 0x4000:
                data = data[::-1]
            yy = 7 - y if word & 0x8000 else y
            claims.put(label, (ty + yy) * W + tx, data, sid)


def frame_claims(ctx, fr, w, h, pix, claims, view=None, sheets=None):
    """build: the sole-covered pixels of every component claim their sprite block pixel.  import (view/sheets = baseline):
    only the pixels that differ from the baseline render."""
    S = ctx.S
    name = f"frames/{fr.path.parent.name}/{fr.path.name}"
    sid = claims.sid(name)
    if (w, h) != (fr.w, fr.h):
        claims.error(f"{name}: image is {w}x{h}, expected {fr.w}x{fr.h} (size = bounding box of the components, fixed)")
        return
    comps = fr.comps
    n = len(comps)

    def rect(k):
        return fr.pos[k][0], fr.pos[k][1]

    def covers(k, x, y):
        cx, cy = rect(k)
        return cx <= x < cx + SPR and cy <= y < cy + SPR

    def block_xy(c, bx, by):
        """position inside the 16x16 sprite block of the pixel at (bx, by) of the drawn (flipped) component."""
        return (SPR - 1 - bx if c.hflip else bx), (SPR - 1 - by if c.vflip else by)

    def where(c, bx, by):
        tid = c.tile
        if (tid >> 8) >= SPRITE_BANKS:
            return None
        u = tid & 0xFF
        px, py = block_xy(c, bx, by)
        return "Sprites_%02X8000" % (FIRST_BANK + (tid >> 8)), ((u >> 3) * SPR + py) * W + (u & 7) * SPR + px

    if view is not None:                                     # import: compare with the baseline render
        base = render_frame(ctx, fr, view)
        if pix.translate(LOW) == base.translate(LOW):
            return
        for i in range(w * h):
            nv, ov = pix[i], base[i]
            if (nv & 15) == (ov & 15):
                continue
            x, y = i % w, i // w
            cov = [k for k in range(n) if covers(k, x, y)]
            if not cov:
                claims.error(f"{name}: pixel ({x},{y}) is edited but no 16x16 component covers it")
                continue
            target = None
            if ov & 15:
                for k in reversed(cov):                      # the visible pixel belongs to the topmost component with a set pixel
                    wl = where(comps[k], x - rect(k)[0], y - rect(k)[1])
                    if wl and sheets[wl[0]][wl[1]]:
                        target = k
                        break
            if target is None:
                target = cov[-1]
            c = comps[target]
            if (nv & 15) and (nv >> 4) != c.palette:
                claims.error(f"{name}: pixel ({x},{y}) uses palette row {nv >> 4}, but the component there is drawn with row {c.palette} "
                             "(the row is the attribute byte of the object data, not part of the image)")
                continue
            wl = where(c, x - rect(target)[0], y - rect(target)[1])
            if wl is None:
                claims.error(f"{name}: pixel ({x},{y}) belongs to a component outside the ten sprite banks")
                continue
            claims.put(wl[0], wl[1], bytes([nv & 15]), sid)
        return

    overlapped = [any(j != k and rect(k)[0] < rect(j)[0] + SPR and rect(j)[0] < rect(k)[0] + SPR and
                      rect(k)[1] < rect(j)[1] + SPR and rect(j)[1] < rect(k)[1] + SPR for j in range(n)) for k in range(n)]
    cover = None
    if any(overlapped):
        cover = bytearray(w * h)
        for k in range(n):
            cx, cy = rect(k)
            for y in range(SPR):
                for x in range(SPR):
                    cover[(cy + y) * w + cx + x] += 1
    for k, c in enumerate(comps):
        if (c.tile >> 8) >= SPRITE_BANKS:
            continue
        cx, cy = rect(k)
        label = "Sprites_%02X8000" % (FIRST_BANK + (c.tile >> 8))
        u = c.tile & 0xFF
        x0, y0 = (u & 7) * SPR, (u >> 3) * SPR
        for ry in range(SPR):
            row = pix[(cy + ry) * w + cx:(cy + ry) * w + cx + SPR]
            if overlapped[k]:
                mask = [cover[(cy + ry) * w + cx + rx] == 1 for rx in range(SPR)]
                row = bytes(v if m else 0 for v, m in zip(row, mask))
            if any(row.translate(BAD[c.palette])):
                claims.error(f"{name}: component at ({cx},{cy}) has a colour from another palette row than {c.palette} "
                             "(the row comes from the object data's attribute byte)")
                break
            data = row.translate(LOW)
            if overlapped[k]:
                data = bytes(d if m else UNC for d, m in zip(data, mask))
            if c.hflip:
                data = data[::-1]
            by = SPR - 1 - ry if c.vflip else ry
            claims.put(label, (y0 + by) * W + x0, data, sid)


# ----------------------------------------------------------------------------------------------------------------------
# build: images + remainder sheets -> sheets
# ----------------------------------------------------------------------------------------------------------------------
def image_palette_flat(pal):
    return [c for rgb in pal for c in rgb]


def load_image(path):
    return P.load_png(path)


def collect_claims(ctx, images=None):
    """claims of all composed images of this release; images = {relative name: (w, h, pix)} instead of reading the PNG files."""
    claims = Claims(ctx.sizes)
    for scr in ctx.screens:
        p = screens_dir(ctx.root, ctx.region) / f"{scr.name}.png"
        key = f"screens/{scr.name}.png"
        try:
            w, h, pix = images[key] if images is not None else load_image(p)
        except (OSError, KeyError):
            claims.error(f"missing {p.relative_to(ctx.root)}")
            continue
        screen_claims(ctx, scr, w, h, pix, claims)
    for fr in ctx.frames:
        key = f"frames/{fr.path.parent.name}/{fr.path.name}"
        try:
            w, h, pix = images[key] if images is not None else load_image(fr.path)
        except (OSError, KeyError):
            claims.error(f"missing {fr.path.relative_to(ctx.root)}")
            continue
        frame_claims(ctx, fr, w, h, pix, claims)
    return claims


def remainder(ctx, label):
    b = ctx.blobs[label]
    meta = ctx.meta(label)
    w, h, pix = P.load_png(b.art)
    if (w, h) != (W, sheet_height(meta)):
        raise ValueError(f"{b.rel(b.art)}: PNG is {w}x{h}, expected {W}x{sheet_height(meta)} (dimensions are fixed)")
    return pix.translate(LOW)                   # tile sheets: bits 4-6 = palette row of the tile (viewing aid, ignored)


def build_sheet(ctx, label, claims):
    rem = remainder(ctx, label)
    val = claims.val.get(label)
    if val is None:
        return rem
    stray = [i for i in range(len(rem)) if val[i] != UNC and rem[i]]
    if stray:
        raise ValueError(f"{label}: remainder sheet has pixels where composed images define the pixel, e.g. {claims.where(label, stray[0])}; "
                         "edit the screen / frame image instead (the sheet only holds pixels that no image shows)")
    return bytes(r if c == UNC else c for r, c in zip(rem, val))


def build_raw(ctx, label, claims):
    meta = ctx.meta(label)
    pix = build_sheet(ctx, label, claims)
    return P.encode_sheet(pix, W, sheet_height(meta), 4, 16, meta["raw_size"])


def claims_for(ctx):
    if not hasattr(ctx, "_claims"):
        ctx._claims = collect_claims(ctx)
    return ctx._claims


def raw_from_sources(root, region, label):
    ctx = get_ctx(root, region)
    claims = claims_for(ctx)
    if claims.errors:
        raise ValueError("composed images contradict each other or are incomplete:\n  " + "\n  ".join(claims.errors)
                         + (f"\n  ... ({claims.nerr} problems)" if claims.nerr > len(claims.errors) else ""))
    return build_raw(ctx, label, claims)


# ----------------------------------------------------------------------------------------------------------------------
# export: sheets -> images + remainder sheets
# ----------------------------------------------------------------------------------------------------------------------
def load_sheets(ctx, extra_labels=()):
    """decoded sheets from the generated .bin files: own blobs and the shared US blobs the screens refer to."""
    labels = set(ctx.blobs) | set(extra_labels)
    for scr in ctx.screens:
        labels |= {l for _, l in scr.sets}
    raws = {}
    for lab in sorted(labels):
        b = ctx.blob(lab)
        raws[lab] = P.read_raw(b)[0]
    return raws


def write_png_if_changed(path, w, h, pix, pal, transparent0=False):
    path.parent.mkdir(parents=True, exist_ok=True)
    P.save_png(path, w, h, pix, pal, transparent0)


def render_images(ctx, sheets):
    """{relative name: (w, h, pix, palette, is_sprite)} of every composed image."""
    out = {}
    for scr in ctx.screens:
        out[f"screens/{scr.name}.png"] = (scr.width, scr.height, render_screen(scr, sheets), scr.pal, False)
    if ctx.frames:
        S = ctx.S
        import palette_map
        flat = S.make_palette(palette_map.sprite_palettes(0))
        view = SheetView(sheets)
        for fr in ctx.frames:
            out[f"frames/{fr.path.parent.name}/{fr.path.name}"] = (fr.w, fr.h, render_frame(ctx, fr, view), flat, True)
    return out


def save_sprite_png(S, path, w, h, pix, flat):
    path.parent.mkdir(parents=True, exist_ok=True)
    S.save_png(S.make_png(w, h, pix, flat), path)


def tile_rows(ctx):
    """{tile blob label: {tile number: [palette rows, most used first]}} from the name table cells of all screens (a tile is drawn with the
    row of the cell that shows it: one blob can be shown with different rows by different tables)."""
    from collections import Counter
    cnt = {}
    for scr in ctx.screens:
        for w in scr.words:
            t = scr.targets[w & 0x3FF]
            if t is not None and t[0].startswith("Tiles_"):
                cnt.setdefault(t[0], {}).setdefault(t[1], Counter())[(w >> 10) & 7] += 1
    return {lab: {n: [r for r, _ in sorted(c.items(), key=lambda x: (-x[1], x[0]))] for n, c in d.items()} for lab, d in cnt.items()}


def sheet_rows(ctx, label, rows=None):
    """palette row per tile of a tile blob's sheet: (list of rows, number of tiles whose row is only guessed)."""
    meta = ctx.meta(label)
    guess = (meta.get("palette") or {}).get("sub", 0)
    used = (rows if rows is not None else tile_rows(ctx)).get(label, {})
    n = meta["raw_size"] // 32
    out = [used[t][0] if t in used else guess for t in range(n)]
    return out, sum(1 for t in range(n) if t not in used)


def export_images(ctx, raws, remove_stale=True):
    """write screens, frames and remainder sheets for the given raw payloads ({label: raw})."""
    sheets = decode_sheets(ctx, raws)
    imgs = render_images(ctx, sheets)
    sdir = screens_dir(ctx.root, ctx.region)
    want = set()
    for name, (w, h, pix, pal, is_spr) in imgs.items():
        if name.startswith("screens/"):
            p = sdir / name[8:]
            P.save_png(p, w, h, pix, pal, False)
        else:
            p = frames_dir(ctx.root) / name[7:]
            save_sprite_png(ctx.S, p, w, h, pix, pal)
        want.add(p)
    if remove_stale:
        for d in ([sdir] if ctx.screens or sdir.exists() else []) + ([frames_dir(ctx.root)] if ctx.frames else []):
            for p in sorted(d.rglob("*.png")):
                if p not in want:
                    p.unlink()
            for q in sorted(d.rglob("*"), reverse=True):
                if q.is_dir() and not any(q.iterdir()):
                    q.rmdir()
    claims = collect_claims(ctx, {k: v[:3] for k, v in imgs.items()})
    if claims.errors:
        raise AssertionError("export produced contradicting images:\n  " + "\n  ".join(claims.errors))
    rows_all = tile_rows(ctx)
    for lab, b in ctx.blobs.items():
        meta = ctx.meta(lab)
        val = claims.val.get(lab)
        pix = sheets[lab]
        rem = bytes(pix) if val is None else bytes(0 if c != UNC else v for v, c in zip(pix, val))
        if b.kind == "tiles" and meta.get("palette"):
            # game colours: pixel = (palette row of the tile) << 4 | colour, row from the name tables that show the tile
            rws, guessed = sheet_rows(ctx, lab, rows_all)
            tpr = W // 8
            rem = bytearray(rem)
            for t, r in enumerate(rws):
                for y in range(8):
                    o = ((t // tpr) * 8 + y) * W + (t % tpr) * 8
                    rem[o:o + 8] = bytes(v | r << 4 for v in rem[o:o + 8])
            rem = bytes(rem)
            pal = P.view_palette128(meta["palette"]["id"], ctx.root)
            multi = {str(t): r[:3] for t, r in sorted(rows_all.get(lab, {}).items()) if len(r) > 1}
            meta.pop("tile_rows_multi", None)
            meta.pop("tiles_row_guessed", None)
            if multi:
                meta["tile_rows_multi"] = multi
            meta["tiles_row_guessed"] = guessed
            P.write_meta(b, meta)
        else:
            pal = P.load_view_palette(meta["palette"], 4, ctx.root) if meta.get("palette") else P.grayscale_palette(4)
        P.save_png(b.art, W, sheet_height(meta), rem, pal, transparent0=(b.kind == "sprites" and "palette" in meta))
    return claims


# ----------------------------------------------------------------------------------------------------------------------
# import: edits relative to the baseline (.bin)
# ----------------------------------------------------------------------------------------------------------------------
def edit_claims(ctx, raws):
    sheets = decode_sheets(ctx, raws)
    claims = Claims(ctx.sizes)
    for scr in ctx.screens:
        p = screens_dir(ctx.root, ctx.region) / f"{scr.name}.png"
        try:
            w, h, pix = load_image(p)
        except OSError:
            claims.error(f"missing {p.relative_to(ctx.root)}")
            continue
        screen_claims(ctx, scr, w, h, pix, claims, base=render_screen(scr, sheets))
    if ctx.frames:
        view = SheetView(sheets)
        for fr in ctx.frames:
            try:
                w, h, pix = load_image(fr.path)
            except OSError:
                claims.error(f"missing {fr.path.relative_to(ctx.root)}")
                continue
            frame_claims(ctx, fr, w, h, pix, claims, view=view, sheets=sheets)
    return claims, sheets


def apply_edits(ctx, claims, sheets, raws):
    """edited raw payloads {label: raw} for the blobs that changed.  A remainder sheet edit is an edit too."""
    out = {}
    for lab in ctx.blobs:
        meta = ctx.meta(lab)
        pix = bytearray(sheets[lab])
        val = claims.val.get(lab)
        if val is not None:
            for i, c in enumerate(val):
                if c != UNC:
                    pix[i] = c
        # remainder sheet: pixels that no image shows may be edited there; the sheet always shows the baseline value
        # of undetermined pixels, so a difference is an edit
        rem = remainder(ctx, lab)
        det = claims_determined(ctx, lab, sheets)
        for i in range(len(rem)):
            if not det[i] and rem[i] != pix[i]:
                pix[i] = rem[i]
        raw = P.encode_sheet(bytes(pix), W, sheet_height(meta), 4, 16, meta["raw_size"])
        if raw != raws[lab]:
            out[lab] = raw
    return out


def claims_determined(ctx, label, sheets):
    """bool per pixel: determined by the composed images (from the baseline renders)."""
    if not hasattr(ctx, "_det"):
        imgs = render_images(ctx, sheets)
        c = collect_claims(ctx, {k: v[:3] for k, v in imgs.items()})
        ctx._det = {lab: (v if v is not None else None) for lab, v in c.val.items()}
    val = ctx._det.get(label)
    return [False] * ctx.sizes[label] if val is None else [x != UNC for x in val]


def expected_files(ctx):
    """paths of all composed images of the release (orphan detection)."""
    out = {screens_dir(ctx.root, ctx.region) / f"{s.name}.png" for s in ctx.screens}
    out |= {fr.path for fr in ctx.frames}
    return out
