#!/usr/bin/env python3
"""Graphics assets <-> editable PNG / text sources.  The PNG and text files are the source of truth; the `.bin` files
that the assembler includes (assets/gfx/{tiles,sprites,characters}/*.bin) must be reproducible from them bit for bit.

  export  [--label PAT]...   .bin -> PNG / text + JSON sidecar   (use once, or after changing the pipeline)
  import  [--label PAT]...   PNG / text -> .bin                  (the modding step; then rebuild with tools/build.py)
  check   [--label PAT]...   PNG / text -> bytes must equal the committed .bin for every blob (CI), exit 1 otherwise
  preview [--label PAT]... [--out DIR]   render BG name tables with their tile sets (in game colours) to DIR (default
                                          build/gfx_preview), tile sheets and sprite banks with a palette per tile to DIR/sheets

Blob kinds (PAT is an fnmatch pattern on the label, e.g. 'sCompressedTiles_9*' or 'Sprites_88*'; default: all):
  tiles      assets/gfx/tiles/sCompressedTiles_*.bin      LZSS-compressed 4bpp tile graphics -> screens/*.png + tiles/<label>.png (remainder)
  sprites    assets/gfx/sprites/Sprites_*.bin             raw 4bpp OBJ graphics (banks $88-$91) -> frames/*/*.png + sprites/<label>.png (remainder)
  tilemaps   assets/gfx/characters/sCompressedTilemap_*.bin (LZSS) and sCharactermap_*.bin (raw)
                                                          BG name tables -> assets/gfx/tilemaps/<label>.map.txt
Tile and sprite graphics are edited as COMPOSED images (tools/gfx/composed.py): assets/gfx/png/frames/obj_XXXX/f_PPPP.png (object
animation frames), assets/gfx/png/screens/<name table>.png (name tables rendered with their tile sets) and, per blob, a remainder sheet
<label>.png that holds only the pixels no composed image shows; `import` splits edited images back into tiles / sprite blocks.
Every blob has a <label>.json sidecar (bpp, bpp_confidence, tiles_per_row, compression, raw_size, trailing bytes of the label span,
VRAM destination, palette).  Name tables: <label>.map.txt + sidecar.  Details: docs/formats/graphics-png.md.
  sheet   [--label PAT]... [--region R] [--out DIR] [--scale N] [--grid]   render the whole sheet of every blob (built from the sources)
                                          to DIR (default build/gfx_sheets/<region>) for viewing; never part of the sources
PNG rules: indexed colour (mode P), fixed dimensions, pixel value = SNES colour index (must stay < 2^bpp); the palette
stored in the PNG (PLTE) is only a viewing aid and is ignored on import: `export` fills it with the real 16 colours of the
sub-palette the blob is displayed with (assets/gfx/palette_map.json, docs/formats/graphics-palettes.md); index 0 of sprite
images is marked transparent (tRNS).  Name tables: 16-bit hex words, `columns` per row
(sidecar: 32, or 128 for the raw sCharactermap_* world maps), a blank line after every 32 rows; free to edit, the number of words must not change.

`import` refuses to change the size of the blob in the ROM unless --allow-resize is given: a shorter compressed stream is
padded with zeros automatically (layout unchanged); a longer one needs --allow-resize, which also shrinks the bank's
trailing padding of the bank in assets/gfx/banks.json (error if the bank is full).
"""
import argparse
import fnmatch
import csv
import json
import os
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / "tools" / "gfx"))
import tilemap_codec as C  # noqa: E402
from palette_map import us_lines  # noqa: E402
sys.path.insert(0, str(ROOT / "tools" / "maps"))
import areadata as AD  # noqa: E402

PAD = bytes(64)            # lets decompress() read past the end of a blob that is the last thing in its file
BANK = 0x8000
TILE_BYTES = {2: 16, 4: 32, 8: 64}
SCREEN_ROWS = 32           # blank line after this many rows in .map.txt


class Kind:
    def __init__(self, name, src, prefixes, art_dir, art_ext, compressed_prefix=None):
        self.name, self.src, self.prefixes = name, src, prefixes
        self.art_dir, self.art_ext = art_dir, art_ext
        self.compressed_prefix = compressed_prefix


KINDS = {
    "tiles": Kind("tiles", "assets/gfx/tiles", ("Tiles_",), "assets/gfx/png/tiles", ".png", "Tiles_"),
    "sprites": Kind("sprites", "assets/gfx/sprites", ("Sprites_",), "assets/gfx/png/sprites", ".png"),
    "tilemaps": Kind("tilemaps", "assets/gfx/characters", ("Screen_", "ScreenRaw_"), "assets/gfx/tilemaps",
                     ".map.txt", "Screen_"),
}
LAYOUT_KIND = {"tiles": "tiles", "sprites": "sprites", "tilemaps": "characters"}     # kind -> group in assets/gfx/banks.json

# 4bpp was decided from VRAM destination slots (tile blobs are 8192 bytes = 256 4bpp tiles per $1000-word slot), from the
# plane-correlation statistics and by looking at the rendered sheets.  Blobs whose planes 2-3 are empty or that hold only a
# few tiles cannot be told apart from 2bpp by statistics alone; they were checked by eye (all read correctly as 4bpp).
VISUALLY_VERIFIED = {
    "Tiles_Overlay_Rain": "rain overlay", "Tiles_Overlay_Clouds": "falling leaves overlay",
    "Tiles_Overlay_HeavySnow": "weather overlay", "Tiles_Overlay_Snow": "snow overlay",
    "Tiles_Menu_0": "Latin font sheet", "Tiles_Menu_1": "kana/digit font sheet",
    "Tiles_Menu_2": "kana/kanji font sheet", "Tiles_ToolShed_1": "UI text tiles",
    "Tiles_Credits_0": "Latin lower-case font sheet", "Tiles_Credits_1": "kanji sheet",
    "Tiles_Credits_2": "kanji sheet", "Tiles_NatsumeLogo": "publisher logo",
}


# ----------------------------------------------------------------------------------------------------------------------
# SNES planar tiles <-> indexed pixels (fast table based; verified against tools/gfx/tiles.py in tests/test_pngsync.py)
# ----------------------------------------------------------------------------------------------------------------------
_SPREAD = [sum(((b >> (7 - x)) & 1) << (8 * (7 - x)) for x in range(8)) for b in range(256)]   # bit x -> byte x (big endian)
_GATHER = 0x0102040810204080


def decode_sheet(raw, bpp, tiles_per_row):
    """raw planar tile data -> (width, height, bytes of one colour index per pixel)."""
    size = TILE_BYTES[bpp]
    n = (len(raw) + size - 1) // size
    raw = bytes(raw) + bytes(n * size - len(raw))
    rows = max((n + tiles_per_row - 1) // tiles_per_row, 1)
    width = tiles_per_row * 8
    pix = bytearray(width * rows * 8)
    for t in range(n):
        off = t * size
        ox = (t % tiles_per_row) * 8
        oy = (t // tiles_per_row) * 8
        for y in range(8):
            word = 0
            for p in range(bpp):
                word |= _SPREAD[raw[off + (p >> 1) * 16 + (p & 1) + 2 * y]] << p
            start = (oy + y) * width + ox
            pix[start:start + 8] = word.to_bytes(8, "big")
    return width, rows * 8, bytes(pix)


def encode_sheet(pix, width, height, bpp, tiles_per_row, raw_size):
    """inverse of decode_sheet; raises ValueError on indices >= 2^bpp or on non-zero data beyond raw_size."""
    if width != tiles_per_row * 8:
        raise ValueError(f"width {width} != {tiles_per_row * 8}")
    limit = 1 << bpp
    if any(pix) and max(pix) >= limit:
        i = next(i for i, v in enumerate(pix) if v >= limit)
        raise ValueError(f"colour index {pix[i]} at x={i % width} y={i // width} exceeds {bpp}bpp (max {limit - 1})")
    size = TILE_BYTES[bpp]
    n = (height // 8) * tiles_per_row
    out = bytearray(n * size)
    for t in range(n):
        ox = (t % tiles_per_row) * 8
        oy = (t // tiles_per_row) * 8
        off = t * size
        for y in range(8):
            start = (oy + y) * width + ox
            word = int.from_bytes(pix[start:start + 8], "big")
            for p in range(bpp):
                out[off + (p >> 1) * 16 + (p & 1) + 2 * y] = ((((word >> p) & 0x0101010101010101) * _GATHER) >> 56) & 0xFF
    if any(out[raw_size:]):
        raise ValueError("PNG has non-zero tiles beyond the end of the blob")
    return bytes(out[:raw_size])


def grayscale_palette(bpp):
    n = 1 << bpp
    return [(i * 255 // (n - 1),) * 3 for i in range(n)]


_PALETTE_JSON = {}
_PALETTE_MAP = {}
MAX_ALTERNATIVES = 6


def palette_colors(pal_id, root=ROOT):
    """Palette_<Area>_<Slot> -> 256 '#RRGGBB' strings (assets/gfx/palettes)."""
    key = (str(root), pal_id)
    if key not in _PALETTE_JSON:
        _PALETTE_JSON[key] = json.loads((Path(root) / "assets/gfx/palettes" / f"{pal_id}.json").read_text())["colors"]
    return _PALETTE_JSON[key]


def hex_rgb(c):
    return tuple(int(c[i:i + 2], 16) for i in (1, 3, 5))


def load_view_palette(spec, bpp, root=ROOT):
    """sidecar "palette": {"id": "Palette_FarmSummer_Early", "sub": 3} -> list of RGB for the PNG viewing palette."""
    colors = palette_colors(spec["id"], root)
    n = 1 << bpp
    sub = spec.get("sub", 0)
    return [hex_rgb(c) for c in colors[sub * n:(sub + 1) * n]]


def palette_map(root=ROOT):
    """assets/gfx/palette_map.json ({} when absent, e.g. in a reduced test tree); derived by tools/gfx/palette_map.py."""
    key = str(root)
    if key not in _PALETTE_MAP:
        p = Path(root) / "assets/gfx/palette_map.json"
        _PALETTE_MAP[key] = json.loads(p.read_text(encoding="utf-8")) if p.exists() else {}
    return _PALETTE_MAP[key]


def palette_fields(b, old):
    """sidecar keys describing the palette of blob b: from the palette map, else kept from the old sidecar."""
    ent = palette_map(b.root).get("blobs", {}).get(b.label)
    if ent and ent["palette"].get("id"):
        out = {"palette": {"id": ent["palette"]["id"], "sub": ent["palette"]["sub"]},
               "palette_confidence": ent["confidence"], "palette_note": ent["note"]}
        if len(ent.get("subs_used", [])) > 1:
            out["palette_subs_used"] = ent["subs_used"]
        alts = [{k: v for k, v in a.items() if k != "area"} for a in ent.get("alternatives", [])]
        if alts:
            out["palette_alternatives"] = alts[:MAX_ALTERNATIVES]
            if len(alts) > MAX_ALTERNATIVES:
                out["palette_alternatives_total"] = len(alts)
        return out
    if ent:                                                   # known blob without a palette (no evidence)
        return {"palette_confidence": ent["confidence"], "palette_note": ent["note"]}
    return {k: old[k] for k in ("palette",) if old.get(k)}


def save_png(path, width, height, pix, palette, transparent0=False):
    from PIL import Image
    img = Image.frombytes("P", (width, height), pix)
    img.putpalette([c for rgb in palette for c in rgb])
    path.parent.mkdir(parents=True, exist_ok=True)
    extra = {"transparency": 0} if transparent0 else {}        # tRNS: index 0 of OBJ palettes is transparent
    img.save(path, "PNG", optimize=True, compress_level=9, **extra)   # Pillow writes no timestamps -> deterministic


def load_png(path):
    from PIL import Image
    img = Image.open(path)
    if img.mode != "P":
        raise ValueError(f"{path}: must be an indexed (mode P) PNG, got {img.mode}; pixel value = SNES colour index")
    img.load()
    return img.width, img.height, img.tobytes()


# ----------------------------------------------------------------------------------------------------------------------
# name tables <-> text
# ----------------------------------------------------------------------------------------------------------------------
def nametable_text(raw, columns=32):
    words = [raw[i] | raw[i + 1] << 8 for i in range(0, len(raw) - 1, 2)]
    lines = []
    for r, i in enumerate(range(0, len(words), columns)):
        if r and r % SCREEN_ROWS == 0:
            lines.append("")
        lines.append(" ".join(f"{w:04X}" for w in words[i:i + columns]))
    out = "\n".join(lines) + "\n"
    if len(raw) & 1:
        out += f"{raw[-1]:02X}\n"          # odd byte count: single trailing byte written as two digits
    return out


def parse_nametable(text):
    out = bytearray()
    for n, line in enumerate(text.splitlines(), 1):
        for tok in line.split():
            if not re.fullmatch(r"[0-9A-Fa-f]{4}|[0-9A-Fa-f]{2}", tok):
                raise ValueError(f"line {n}: bad token {tok!r} (expected a 4 digit hex word)")
            v = int(tok, 16)
            out += v.to_bytes(len(tok) // 2, "little")
    return bytes(out)


# ----------------------------------------------------------------------------------------------------------------------
# blobs
# ----------------------------------------------------------------------------------------------------------------------
REGIONS = ("us", "eu", "de", "jp")


def region_dirs(k, region):
    """(generated .bin dir, source dir) of a kind for a release.  US = the shared blobs; other releases keep only the
    blobs that differ from US in `<dir>/<region>/` (bin) and `assets/gfx/png/<region>/<kind>` / `assets/gfx/tilemaps/<region>` (sources)."""
    if region == "us":
        return k.src, k.art_dir
    art = k.art_dir.replace("assets/gfx/png/", f"assets/gfx/png/{region}/") if k.art_dir.startswith("assets/gfx/png/") \
        else f"{k.art_dir}/{region}"
    return f"{k.src}/{region}", art


class Blob:
    def __init__(self, kind, label, root=ROOT, region="us"):
        self.kind, self.label, self.root, self.region = kind, label, Path(root), region
        k = KINDS[kind]
        src, art = region_dirs(k, region)
        self.bin = self.root / src / f"{label}.bin"
        self.art = self.root / art / f"{label}{k.art_ext}"      # tiles / sprites: the remainder sheet
        self.meta = self.root / art / f"{label}.json"
        self.compressed = bool(k.compressed_prefix and label.startswith(k.compressed_prefix))

    def rel(self, p):
        return str(p.relative_to(self.root)).replace("\\", "/")


def blobs(root=ROOT, patterns=None, kind=None, from_sources=False, region="us"):
    """Blobs known from the committed .bin files, or (from_sources) from the sidecar .json files in the source dirs."""
    out = []
    for name, k in KINDS.items():
        if kind and name != kind:
            continue
        d = Path(root) / region_dirs(k, region)[1 if from_sources else 0]
        found = [(p.stem, p) for p in sorted(d.glob("*.json" if from_sources else "*.bin"))]
        for label, p in found:
            if label.startswith(k.prefixes):
                if not patterns or any(fnmatch.fnmatchcase(label, pat) for pat in patterns):
                    out.append(Blob(name, label, root, region))
    return out


def split_tail(data):
    """tail bytes -> sidecar fields (non-zero prefix as hex, rest as a run of zeros)."""
    body = data.rstrip(b"\x00")
    fields = {}
    if body:
        h = body.hex()
        fields["tail_hex"] = [h[i:i + 128] for i in range(0, len(h), 128)] if len(h) > 128 else h
    if len(data) - len(body):
        fields["tail_zeros"] = len(data) - len(body)
    return fields


def join_tail(meta):
    h = meta.get("tail_hex", "")
    if isinstance(h, list):
        h = "".join(h)
    return bytes.fromhex(h) + bytes(meta.get("tail_zeros", 0))


def read_meta(b):
    return json.loads(b.meta.read_text(encoding="utf-8"))


def write_meta(b, meta):
    b.meta.parent.mkdir(parents=True, exist_ok=True)
    b.meta.write_text(json.dumps(meta, indent=2, ensure_ascii=False) + "\n", encoding="utf-8", newline="\n")


def stats4(raw):
    """(non-empty tiles, fraction of non-empty tiles with planes 2-3 empty) for the 4bpp reading."""
    nz = hi0 = 0
    for t in range(len(raw) // 32):
        blk = raw[t * 32:(t + 1) * 32]
        if any(blk):
            nz += 1
            hi0 += not any(blk[16:])
    return nz, (hi0 / nz if nz else 1.0)


def bpp_assessment(b, raw):
    if b.kind == "sprites":
        return "high", "OBJ tiles in the standard 4bpp layout; plane correlation and sheet appearance confirm it"
    nz, hi0 = stats4(raw)
    if b.label in VISUALLY_VERIFIED:
        why = "planes 2-3 empty (indices < 4)" if hi0 >= 0.9 else "sparse tile set"
        return "high", f"{VISUALLY_VERIFIED[b.label]}; {why}; reads correctly as 4bpp, 2bpp reading is garbled (checked by eye)"
    if nz < 64:
        return "medium", "fewer than 64 non-empty tiles; 4bpp assumed from the VRAM slot"
    if hi0 >= 0.9:
        return "medium", "planes 2-3 are empty (indices < 4); 4bpp assumed from the VRAM slot, 2bpp cannot be excluded"
    return "high", "4bpp: planes 0-1 and 2-3 are strongly correlated and the sheet reads as coherent graphics"


_MAP_INFO = None


def map_table(root=ROOT):
    """assets/maps/area_gfx.json -> {label: [(vram_word_dest, map_label, [(dest, label), ...])]} (first map entry listed first)."""
    global _MAP_INFO
    if _MAP_INFO is not None and Path(root) == ROOT:
        return _MAP_INFO
    _, desc = AD.load_gfx(root)
    maps = {lab: [(AD.hexval(v), blob) for v, blob in d["loads"]] for lab, d in desc.items()}
    info = {}
    for mlabel, pairs in maps.items():
        for dest, label in pairs:
            info.setdefault(label, []).append((dest, mlabel, pairs))
    if Path(root) == ROOT:
        _MAP_INFO = info
    return info


_BG_PRESETS = {}


def bg_chr_base(root, map_label, dest):
    """VRAM word address of tile 0 of the BG that shows the name table uploaded to `dest` by map `map_label`: the map header's graphic
    preset (first byte, only maps that have one) selects BGnSC (name table address) and BG12NBA / BG34NBA (character base) in
    src/code/bank_80/core.asm.  None when the map has no preset byte or no BG uses that address (callers fall back to the first tile set)."""
    key = str(root)
    if key not in _BG_PRESETS:
        core = (Path(root) / "src/code/bank_80/core.asm").read_text(encoding="utf-8", errors="replace")

        def tab(name):
            m = re.search(name + r":\s*db ([^;\n]+)", core)
            return [int(x.strip()[1:], 16) for x in m.group(1).split(",")]
        sc = [tab(f"Table_BG{i}SC_Presets") for i in range(1, 5)]
        n12, n34 = tab("Table_BG12NBA_Presets"), tab("Table_BG34NBA_Presets")
        _, desc = AD.load_gfx(root)
        pres = {lab: d.get("preset") for lab, d in desc.items()}
        _BG_PRESETS[key] = (sc, n12, n34, pres)
    sc, n12, n34, pres = _BG_PRESETS[key]
    p = pres.get(map_label)
    if not isinstance(p, int):
        return None
    nba = [n12[p] & 15, n12[p] >> 4, n34[p] & 15, n34[p] >> 4]
    for bg in range(4):
        if (sc[bg][p] & 0xFC) << 8 == dest:
            return nba[bg] * 0x1000
    return None


def usage(b):
    try:
        info = map_table(b.root).get(b.label, [])
    except (OSError, StopIteration):
        return {}
    if not info:
        return {}
    out = {"vram_word_dest": sorted({f"${d:04X}" for d, _, _ in info}), "map_entries": len({m for _, m, _ in info})}
    if b.kind == "tilemaps":
        _, _, pairs = info[0]
        out["first_map"] = info[0][1]
        out["tile_sets"] = [f"{l}@${d:04X}" for d, l in pairs if l.startswith(("Tiles_", "Sprites_"))]
    return out


_LEGACY = {}


def legacy_label(label, root=ROOT):
    """address-based label this blob had before it was named (docs/naming/K3_gfx_names.csv), '' if none."""
    key = str(root)
    if key not in _LEGACY:
        p = Path(root) / "docs/naming/K3_gfx_names.csv"
        rows = list(csv.DictReader(p.open(encoding="utf-8"))) if p.exists() else []
        _LEGACY[key] = {r["new"]: r["old"] for r in rows}
    return _LEGACY[key].get(label, "")


def read_raw(b):
    """.bin -> (raw payload, tail bytes)."""
    data = b.bin.read_bytes()
    if not b.compressed:
        return data, b""
    raw, used = C.decompress(data + PAD)
    if used > len(data):
        raise ValueError(f"{b.label}: stream runs past the end of the blob")
    if C.compress(raw) != data[:used]:
        raise ValueError(f"{b.label}: compress(decompress()) is not byte exact")
    return raw, data[used:]


def export_blob(b, raw=None, tail=None, old=None):
    """.bin (or the given raw payload / tail) -> sidecar .json (tiles, sprites; the images come from composed.export_images)
    or .map.txt + .json (name tables)."""
    if raw is None:
        raw, tail = read_raw(b)
    if old is None:
        old = read_meta(b) if b.meta.exists() else {}
    meta = {"label": b.label, "kind": b.kind, "bin": b.rel(b.bin), "compression": "lzss" if b.compressed else "none",
            "raw_size": len(raw)}
    if legacy_label(b.label, b.root):
        meta["legacy_label"] = legacy_label(b.label, b.root)
    if b.kind == "tilemaps":
        import composed
        columns = old.get("columns", composed.default_columns(len(raw) // 2))
        meta.update({"format": "bg_name_table", "entries": len(raw) // 2, "columns": columns})
        b.art.parent.mkdir(parents=True, exist_ok=True)
        b.art.write_text(nametable_text(raw, columns), encoding="utf-8", newline="\n")
    else:
        conf, note = bpp_assessment(b, raw)
        meta.update({"format": "snes_planar_tiles", "bpp": 4, "bpp_confidence": conf, "bpp_note": note, "tiles_per_row": 16})
        pf = palette_fields(b, old)
        meta.update(usage(b))
        meta.update(split_tail(tail))
        meta.update(pf)
        write_meta(b, meta)
        return meta
    meta.update(usage(b))
    meta.update(split_tail(tail))
    write_meta(b, meta)
    return meta


def source_payload(b, meta=None):
    """sources -> raw payload bytes (before compression): name table text, or the composed images + remainder sheet."""
    if b.kind == "tilemaps":
        meta = meta or read_meta(b)
        raw = parse_nametable(b.art.read_text(encoding="utf-8"))
        if len(raw) != meta["raw_size"]:
            raise ValueError(f"{b.label}: {len(raw) // 2} words, expected {meta['raw_size'] // 2} (the size is fixed)")
        return raw
    import composed
    return composed.raw_from_sources(b.root, b.region, b.label)


def build_bin(b, meta=None):
    """canonical .bin bytes for the current PNG / text, using the sidecar tail."""
    meta = meta or read_meta(b)
    raw = source_payload(b, meta)
    if b.compressed:
        return C.compress(raw) + join_tail(meta)
    return raw


# ----------------------------------------------------------------------------------------------------------------------
# commands
# ----------------------------------------------------------------------------------------------------------------------
def export_region_from_rom(a, root=ROOT):
    """eu/de/jp: write the blobs that differ from US (found by tools/data/regionbanks.py) as .bin and export their sources."""
    sys.path.insert(0, str(ROOT / "tools" / "data"))
    import regionbanks as RB
    roms = RB.find_roms(a.rom_dir)
    n = 0
    labels = []
    for bank in RB.GFX_BANKS:
        for placed, us, cls in RB.classify(roms["US"], roms[a.region.upper()], bank, root):
            e = placed.entry
            if cls != "specific" or e.kind not in ("tiles", "tilemap", "charmap"):
                continue
            if a.label and not any(fnmatch.fnmatchcase(e.label, pat) for pat in a.label):
                continue
            kind = "tilemaps" if e.kind in ("tilemap", "charmap") else "tiles"
            b = Blob(kind, e.label, root, a.region)
            b.bin.parent.mkdir(parents=True, exist_ok=True)
            b.bin.write_bytes(placed.data)
            export_blob(b)
            labels.append(e.label)
            n += 1
    tl = [l for l in labels if l.startswith("Tiles_")]
    if tl:
        export_composed(root, a.region, tl)
    print(f"exported {n} {a.region.upper()} specific blobs")


def export_composed(root, region, labels=None):
    """sidecars of all tile / sprite blobs of a release (from the generated .bin files) and, from them, the composed images
    (screens, frames) and the remainder sheets.  Always the whole release: an image can show tiles of several blobs."""
    import composed
    composed.reset()
    if labels is None:
        labels = [b.label for b in blobs(root, None, None, from_sources=True, region=region) if b.kind != "tilemaps"]
    for lab in labels:
        export_blob(Blob("tiles" if lab.startswith("Tiles_") else "sprites", lab, root, region))
    ctx = composed.get_ctx(root, region, labels)
    raws = composed.load_sheets(ctx)
    composed.export_images(ctx, raws)
    composed.reset()
    return len(labels)


def cmd_export(a, root=ROOT):
    region = getattr(a, "region", "us")
    if region != "us" and (getattr(a, "rom_dir", None) or os.environ.get("HM_ROM_DIR")):
        return export_region_from_rom(a, root) or 0
    sel = blobs(root, a.label, a.kind, region=region, from_sources=region != "us")
    for b in sel:
        if b.kind == "tilemaps":
            export_blob(b)
    n = export_composed(root, region) if any(b.kind != "tilemaps" for b in sel) else 0
    print(f"exported {len(sel)} blobs ({n} tile / sprite blobs as composed images + remainder sheets)")
    return 0


def cmd_build(a, root=ROOT):
    """PNG / text sources -> .bin files (the .bin files are generated, git-ignored build products)."""
    import composed
    composed.reset()
    sel = []
    for r in (REGIONS if getattr(a, "region", None) == "all" else [getattr(a, "region", None) or "us"]):
        sel += blobs(root, a.label, a.kind, from_sources=True, region=r)
    for b in sel:
        try:
            data = build_bin(b)
        except ValueError as e:
            raise SystemExit(f"pngsync build: {b.label}: {e}")
        b.bin.parent.mkdir(parents=True, exist_ok=True)
        if not b.bin.exists() or b.bin.read_bytes() != data:
            b.bin.write_bytes(data)
    print(f"pngsync build: {len(sel)} blobs written from the composed images, remainder sheets and text sources")
    if getattr(a, "region", None) == "all":
        print(f"pngsync build: {share_us_blobs(root)} shared blobs copied into the regional directories")
    return 0


def share_us_blobs(root=ROOT):
    """The generated bank asm (tools/data/gfxbanks.py) includes a blob through `!{REGDIR}` when ANY release has its own version of
    it (`*` in assets/gfx/banks.json).  For the releases that use the US data, the build copies the shared US file into that
    release's directory."""
    sys.path.insert(0, str(ROOT / "tools" / "data"))
    import gfxbanks
    n = 0
    for lab, group in sorted(gfxbanks.regional_labels(root).items()):
        if lab.startswith("sFontGlyphs_") or group == "palettes":
            continue                                        # fonts: tools/fonts/font.py; palettes: tools/gfx/palette.py
        k = next(k for k in KINDS.values() if lab.startswith(k.prefixes))
        us = Path(root) / k.src / f"{lab}.bin"
        for r in REGIONS[1:]:
            dst = Path(root) / region_dirs(k, r)[0] / f"{lab}.bin"
            if not dst.exists():
                dst.parent.mkdir(parents=True, exist_ok=True)
                dst.write_bytes(us.read_bytes()); n += 1
    return n


def cmd_check(a, root=ROOT):
    import composed
    composed.reset()
    bad = 0
    region = getattr(a, "region", None) or "us"
    quick = getattr(a, "quick", False)          # tests: image / claim consistency only (no bit exact rebuild, no width audit)
    sel = blobs(root, a.label, a.kind, region=region, from_sources=region != "us")   # regional .bin dirs also hold copies of shared US blobs
    if any(b.kind != "tilemaps" for b in sel):
        claims = composed.claims_for(composed.get_ctx(root, region))
        for msg in claims.errors:
            print("FAIL " + msg)
            bad += 1
        if claims.nerr > len(claims.errors):
            print(f"FAIL ... {claims.nerr - len(claims.errors)} more problems")
            bad += 1
    for b in sel:
        try:
            if not b.art.exists() or not b.meta.exists():
                raise ValueError("missing " + b.rel(b.art if not b.art.exists() else b.meta))
            if b.kind != "tilemaps" and bad:
                continue                                         # the composed images are inconsistent: reported above
            if quick:
                continue
            got = build_bin(b)
            want = b.bin.read_bytes()
            if got != want:
                d = next((i for i in range(min(len(got), len(want))) if got[i] != want[i]), min(len(got), len(want)))
                raise ValueError(f"rebuilt {len(got)} bytes != committed {len(want)} bytes (first difference at {d})")
        except Exception as e:                                   # noqa: BLE001 - report every blob
            print(f"FAIL {b.label}: {e}")
            bad += 1
    if not a.label and not a.kind:       # coverage: no orphan sources
        for k in KINDS.values():
            d = Path(root) / region_dirs(k, region)[1]
            if not d.exists():
                continue
            known = {(x.art.name) for x in sel if x.kind == k.name} | {x.meta.name for x in sel if x.kind == k.name}
            for p in sorted(d.glob("*")):
                if p.suffix in (".png", ".json", ".txt") and p.name not in known:
                    print(f"FAIL orphan source without .bin: {p.relative_to(root)}")
                    bad += 1
        ctx = composed.get_ctx(root, region)
        want = composed.expected_files(ctx)
        for d in (composed.screens_dir(root, region),) + ((composed.frames_dir(root),) if region == "us" else ()):
            for p in sorted(d.rglob("*")) if d.exists() else []:
                if p.is_file() and p not in want:
                    print(f"FAIL orphan composed image: {p.relative_to(root)}")
                    bad += 1
        for b in (sel if not quick else []):
            if b.kind == "tiles":
                m = read_meta(b)
                if m.get("tiles_row_guessed") == m["raw_size"] // 32:
                    print(f"NOTE {b.label}: no name table shows this blob, palette row {m.get('palette', {}).get('sub', 0)} is a guess "
                          f"(confidence {m.get('palette_confidence')})")
        # name table width sanity: a table laid out with the wrong row length shows unrelated tiles side by side
        own = None if region == "us" else {x.label for x in sel if x.kind == "tilemaps"}
        sheets = composed.decode_sheets(ctx, composed.load_sheets(ctx)) if not quick else {}
        for table, (cur, sug, sc, _scr) in sorted(composed.table_widths(ctx, sheets, own).items() if not quick else []):
            if sc[cur] - min(sc.values()) > composed.WIDTH_FAIL:
                print(f"FAIL {table}: columns={cur} gives a discontinuous image (seam ratio {sc[cur]:.3f}); "
                      f"{min(sc, key=sc.get)} columns gives {min(sc.values()):.3f} (see `pngsync.py widths`)")
                bad += 1
        # screens must show their tiles: cells that use a tile id outside the loaded tile sets are drawn empty (wrong character base)
        for scr in (ctx.screens if not quick else []):
            if own is not None and scr.table not in own:
                continue
            au = composed.audit_screen(scr, sheets)
            if au["used"] and au["unresolved"] == au["used"]:
                print(f"FAIL screens/{scr.name}.png: none of its {au['used']} tiles is found in the tile sets {[l for _, l in scr.sets]}"
                      " (character base wrong?)")
                bad += 1
            elif au["used"] and au["unresolved"] * 10 > au["used"]:
                print(f"WARN screens/{scr.name}.png: {au['unresolved']} of {au['used']} cells use tiles that this map does not load "
                      "(documented in docs/formats/graphics-png.md, 'Screens: known special cases')")
    print(f"pngsync check: {len(sel)} blobs, " + (f"{bad} FAILED" if bad else "all reproduce the committed .bin bit-exactly"))
    return 1 if bad else 0


def adjust_padding(b, delta):
    """blob grew by `delta` bytes: shrink the trailing padding of its bank in assets/gfx/banks.json and regenerate the bank asm."""
    if getattr(b, "region", "us") != "us":
        return None                                     # regional banks end in `fill align`: the padding adapts by itself
    sys.path.insert(0, str(ROOT / "tools" / "data"))
    import gfxbanks
    layout = gfxbanks.load_layout(b.root)
    for bank, ent in layout[LAYOUT_KIND[b.kind]].items():
        if b.label not in (x.lstrip("*") for x in ent["blobs"]):
            continue
        if not isinstance(ent["pad"], int):
            raise ValueError(f"bank ${bank}: no fixed padding to absorb {delta} extra bytes")
        left = ent["pad"] - delta
        if left < 0:
            raise ValueError(f"bank ${bank}: bank full, blob would exceed it by {-left} bytes")
        ent["pad"] = left
        gfxbanks.save_layout(layout, b.root)
        gfxbanks.build(b.root)
        return Path(gfxbanks.LAYOUT)
    raise ValueError(f"{b.label}: not found in {gfxbanks.LAYOUT}")


def cmd_import(a, root=ROOT):
    import composed
    composed.reset()
    region = getattr(a, "region", None) or "us"
    sel = blobs(root, a.label, a.kind, region=region)
    edited = {}
    if any(b.kind != "tilemaps" for b in sel):
        ctx = composed.get_ctx(root, region)
        raws = composed.load_sheets(ctx)
        claims, sheets = composed.edit_claims(ctx, raws)
        if claims.errors:
            print("\n".join("FAIL " + m for m in claims.errors))
            print(f"import: {claims.nerr} problems, nothing written")
            return 1
        edited = composed.apply_edits(ctx, claims, sheets, raws)
        outside = sorted(set(edited) - {b.label for b in sel})
        if outside:
            raise SystemExit("import: the edited images also change " + ", ".join(outside) + " (not selected by --label/--kind)")
    changed = 0
    for b in sel:
        meta = read_meta(b)
        old = b.bin.read_bytes()
        if b.kind == "tilemaps":
            raw = source_payload(b, meta)
        elif b.label in edited:
            raw = edited[b.label]
        else:
            continue
        if b.compressed:
            old_raw, used = C.decompress(old + PAD)
            if old_raw == raw:
                continue                                          # untouched (old stream is the canonical encoding)
            stream = C.compress(raw)
            tail = join_tail(meta)
            if any(tail) and len(stream) != used and not a.allow_resize:
                raise SystemExit(f"{b.label}: stream size changed ({used} -> {len(stream)}) but the label span holds "
                                 "non-compressed data after it; refusing (use --allow-resize if you moved that data)")
            new = stream + tail
            if len(new) < len(old) and not any(tail):
                new += bytes(len(old) - len(new))                 # keep the layout: pad with zeros
                tail = new[len(stream):]
        else:
            if raw == old:
                continue
            new, tail = raw, b""
        if len(new) > len(old):
            if not a.allow_resize:
                raise SystemExit(f"{b.label}: compressed size grew {len(old)} -> {len(new)} bytes; use --allow-resize "
                                 "(the bank's Padding fill shrinks), or simplify the graphic")
            f = adjust_padding(b, len(new) - len(old))
            print(f"  {b.label}: +{len(new) - len(old)} bytes, padding in {f.name} reduced")
        elif len(new) != len(old):
            raise SystemExit(f"{b.label}: size changed {len(old)} -> {len(new)}")
        b.bin.write_bytes(new)
        if b.compressed:
            for k in ("tail_hex", "tail_zeros"):
                meta.pop(k, None)
            meta.update(split_tail(tail))
            write_meta(b, meta)
        changed += 1
        print(f"imported {b.label}: {len(old)} -> {len(new)} bytes")
    if changed:                                                   # other images show the changed tiles / blocks too: re-render everything
        export_composed(root, region)
    print(f"import: {changed} of {len(sel)} blobs changed")
    return 0


def view_palette128(pal_id, root=ROOT):
    """first 8 sub-palettes (128 colours) of a palette as RGB triples; CGRAM rows 0-7 of a BG or OBJ palette."""
    return [hex_rgb(c) for c in palette_colors(pal_id, root)[:128]]


def map_palette_id(map_label, root=ROOT):
    """sPalette id that the BGs of map `map_label` are shown with (day slot), from palette_map.json; None if unknown."""
    for ent in palette_map(root).get("areas", {}).values():
        if ent["map"] == map_label:
            slots = ent["bg_palettes"]
            return slots[1] or next((x for x in slots if x), None)
    return None


def render_nametable(raw, tile_sets, base_word, columns, palette=None):
    """preview of a name table; tile_sets = {vram_word_dest: raw tile data}.  With `palette` (128 RGB triples) the palette
    bits of every entry select the sub-palette (game colours); without it the image is grayscale."""
    from PIL import Image
    vram = bytearray(0x20000)
    for dest, data in tile_sets.items():
        vram[dest * 2:dest * 2 + len(data)] = data[:len(vram) - dest * 2]
    words = [raw[i] | raw[i + 1] << 8 for i in range(0, len(raw) - 1, 2)]
    rows = (len(words) + columns - 1) // columns
    cache = {}
    img = Image.new("P", (columns * 8, rows * 8), 0)
    img.putpalette([c for rgb in (palette or grayscale_palette(4)) for c in rgb])
    for i, w in enumerate(words):
        key = w & (0xDFFF if palette else 0xC3FF)
        t = cache.get(key)
        if t is None:
            off = (base_word + (w & 0x3FF) * 16) * 2
            tw, th, pix = decode_sheet(bytes(vram[off:off + 32]) if off + 32 <= len(vram) else bytes(32), 4, 1)
            if palette:
                pix = bytes(v + 16 * (w >> 10 & 7) for v in pix)
            t = Image.frombytes("P", (8, 8), pix)
            if w & 0x4000:
                t = t.transpose(Image.FLIP_LEFT_RIGHT)
            if w & 0x8000:
                t = t.transpose(Image.FLIP_TOP_BOTTOM)
            cache[key] = t
        img.paste(t, ((i % columns) * 8, (i // columns) * 8))
    return img


def tile_sub_map(b, meta, root=ROOT):
    """per-8x8-tile sub-palette list (index = tile number in the sheet, None = unknown) from palette_map.json."""
    ent = palette_map(root).get("blobs", {}).get(b.label)
    if not ent or not ent["palette"].get("id"):
        return None
    primary = ent["palette"]["sub"]
    n = meta["raw_size"] // 32
    tpr = meta["tiles_per_row"]
    subs = []
    if b.kind == "tiles":
        s = ent.get("tile_subs", "")
        subs = [int(s[t]) if t < len(s) and s[t] != "." else primary for t in range(n)]
    else:                                       # sprite bank: 16x16 sprites, id = block*64 + (row%16)//2*8 + col//2
        s = ent.get("sprite_rows", "")
        for t in range(n):
            tx, ty = t % tpr, t // tpr
            cid = (ty // 16) * 64 + ((ty % 16) // 2) * 8 + tx // 2
            subs.append(int(s[cid]) if cid < len(s) and s[cid] != "." else primary)
    return subs


def render_sheet(b, meta, root=ROOT):
    """tile sheet / sprite bank in game colours: every tile gets the sub-palette recorded in palette_map.json.  RGBA, index 0
    transparent for sprites."""
    from PIL import Image
    ent = palette_map(root)["blobs"][b.label]
    raw, _ = read_raw(b)
    tpr = meta["tiles_per_row"]
    w, h, pix = decode_sheet(raw, 4, tpr)
    subs = tile_sub_map(b, meta, root)
    out = bytearray(len(pix))
    for t, sub in enumerate(subs):
        ox, oy = (t % tpr) * 8, (t // tpr) * 8
        for y in range(8):
            o = (oy + y) * w + ox
            out[o:o + 8] = bytes(v + 16 * sub for v in pix[o:o + 8])
    img = Image.frombytes("P", (w, h), bytes(out))
    pal = view_palette128(ent["palette"]["id"], root)
    img.putpalette([c for rgb in pal for c in rgb])
    rgba = img.convert("RGBA")
    if b.kind == "sprites":
        mask = Image.frombytes("L", (w, h), bytes(0 if v % 16 == 0 else 255 for v in out))
        rgba.putalpha(mask)
    return rgba


def cmd_preview(a, root=ROOT):
    out = Path(a.out)
    out.mkdir(parents=True, exist_ok=True)
    n = 0
    for b in blobs(root, a.label, "tilemaps"):
        meta = read_meta(b)
        u = usage(b)
        if not u.get("tile_sets"):
            print(f"skip {b.label}: no tile set found in the map table")
            continue
        sets, base = {}, None
        for ent in u["tile_sets"]:
            lab, dest = ent.split("@$")
            dest = int(dest, 16)
            tb = Blob("tiles", lab, root) if lab.startswith("Tiles_") else Blob("sprites", lab, root)
            sets[dest], _ = read_raw(tb)
            base = dest if base is None else min(base, dest)
        raw, _ = read_raw(b)
        pid = map_palette_id(u["first_map"], root)
        pal = view_palette128(pid, root) if pid else None
        render_nametable(raw, sets, base, meta.get("columns", 32), pal).save(out / f"{b.label}.png", optimize=True)
        n += 1
    print(f"wrote {n} name table previews to {out} (" + ("palette bits applied with the day palette of the first map using the table"
          if palette_map(root) else "grayscale, no palette map") + ", char base = lowest tile-set VRAM address)")
    m = 0
    for b in blobs(root, a.label):
        if b.kind == "tilemaps":
            continue
        meta = read_meta(b)
        if tile_sub_map(b, meta, root) is None:
            continue
        (out / "sheets").mkdir(exist_ok=True)
        render_sheet(b, meta, root).save(out / "sheets" / f"{b.label}.png", optimize=True)
        m += 1
    print(f"wrote {m} coloured sheets to {out / 'sheets'} (sub-palette per tile / per sprite, from assets/gfx/palette_map.json)")
    return 0


def render_built_sheet(b, scale=1, grid=False):
    """whole sheet of a tile / sprite blob built from the composed images and the remainder sheet, in the blob's viewing
    palette (RGBA; index 0 transparent for sprites).  Viewing aid only (written to build/)."""
    from PIL import Image
    meta = read_meta(b)
    w, h, pix = decode_sheet(source_payload(b, meta), 4, 16)
    if b.kind == "tiles" and meta.get("palette"):
        import composed
        ctx = composed.get_ctx(b.root, getattr(b, "region", "us"))
        rws, _ = composed.sheet_rows(ctx, b.label)          # every tile in the palette row of the name tables that show it
        pix = bytearray(pix)
        for t, r in enumerate(rws):
            for y in range(8):
                o = ((t // 16) * 8 + y) * w + (t % 16) * 8
                pix[o:o + 8] = bytes(v | r << 4 for v in pix[o:o + 8])
        pix = bytes(pix)
        pal = view_palette128(meta["palette"]["id"], b.root)
    else:
        pal = load_view_palette(meta["palette"], 4, b.root) if meta.get("palette") else grayscale_palette(4)
    img = Image.frombytes("P", (w, h), pix)
    img.putpalette([c for rgb in pal for c in rgb])
    rgba = img.convert("RGBA")
    if b.kind == "sprites" and meta.get("palette"):
        rgba.putalpha(Image.frombytes("L", (w, h), bytes(0 if v == 0 else 255 for v in pix)))
    if scale > 1:
        rgba = rgba.resize((w * scale, h * scale), Image.NEAREST)
    if grid:
        from PIL import ImageDraw
        d = ImageDraw.Draw(rgba)
        step = (16 if b.kind == "sprites" else 8) * scale
        for x in range(0, w * scale, step):
            d.line([(x, 0), (x, h * scale)], fill=(255, 0, 255, 160))
        for y in range(0, h * scale, step):
            d.line([(0, y), (w * scale, y)], fill=(255, 0, 255, 160))
    return rgba


def cmd_sheet(a, root=ROOT):
    """render the whole sheets for viewing (build/gfx_sheets/<region>/<label>.png)."""
    import composed
    composed.reset()
    region = getattr(a, "region", None) or "us"
    out = Path(a.out) if a.out else Path(root) / "build" / "gfx_sheets" / region
    out.mkdir(parents=True, exist_ok=True)
    n = 0
    for b in blobs(root, a.label, a.kind, from_sources=True, region=region):
        if b.kind == "tilemaps":
            continue
        render_built_sheet(b, a.scale, a.grid).save(out / f"{b.label}.png", optimize=True)
        n += 1
    print(f"wrote {n} sheets to {out} (assembled from the composed images; derived, not committed)")
    return 0


def cmd_widths(a, root=ROOT):
    """name table width report: seam ratio per candidate row length for every shown table; --write stores the suggestion as `columns`
    in the sidecar (then run `export` to rewrap the .map.txt files and redraw the screens)."""
    import composed
    composed.reset()
    changed = 0
    for region in (REGIONS if a.region == "all" else (a.region,)):
        ctx = composed.get_ctx(root, region)
        sheets = composed.decode_sheets(ctx, composed.load_sheets(ctx))
        own = None if region == "us" else {p.name[:-len(".json")] for p in (Path(root) / region_dirs(KINDS["tilemaps"], region)[1]).glob("*.json")}
        res = composed.table_widths(ctx, sheets, own)
        shown = set(res)
        for table, (cur, sug, sc, scr) in sorted(res.items()):
            mark = "" if cur == sug else f"   -> {sug}"
            flag = "  BAD" if sc[sug] > composed.WIDTH_BAD else ""
            print(f"{region} {table} {len(scr.words):5d} entries  columns={cur:3d}  " + " ".join(f"{c}:{v:.3f}" for c, v in sc.items()) + mark + flag)
            if a.write and cur != sug:
                b = Blob("tilemaps", table, root, region)
                meta = read_meta(b)
                meta["columns"] = sug
                write_meta(b, meta)
                changed += 1
        # tables no screen shows (no tile set known): same width as the US table, else the size default / documented layout
        for sc_json in sorted((Path(root) / region_dirs(KINDS["tilemaps"], region)[1]).glob("*.json")):
            label = sc_json.name[:-len(".json")]
            if label in shown:
                continue
            b = Blob("tilemaps", label, root, region)
            meta = read_meta(b)
            us = Blob("tilemaps", label, root, "us")
            sug = (read_meta(us).get("columns") if region != "us" and us.meta.exists() else None) \
                or composed.KNOWN_COLUMNS.get(label) or composed.default_columns(meta["entries"])
            print(f"{region} {label} {meta['entries']:5d} entries  columns={meta.get('columns', 32):3d}  (not shown with any tile set)"
                  + ("" if meta.get("columns", 32) == sug else f"   -> {sug}"))
            if a.write and meta.get("columns", 32) != sug:
                meta["columns"] = sug
                write_meta(b, meta)
                changed += 1
    print(f"{changed} sidecars changed" if a.write else "(report only; --write stores the suggested widths)")
    return 0


def main(argv=None):
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    sub = ap.add_subparsers(dest="cmd", required=True)
    for name in ("export", "import", "check", "preview", "build", "sheet", "widths"):
        p = sub.add_parser(name)
        p.add_argument("--label", action="append", help="fnmatch pattern on the blob label (repeatable)")
        p.add_argument("--kind", choices=sorted(KINDS))
        if name in ("export", "import", "check", "build", "sheet", "widths"):
            p.add_argument("--region", choices=REGIONS + (("all",) if name in ("build", "widths") else ()), default="us",
                           help="release (default us = shared blobs; eu/de/jp = blobs that differ from US)")
        if name == "export":
            p.add_argument("--rom-dir", help="with --region eu|de|jp: take the region blobs from the ROM images "
                                             "(<dir>/{US,EU,DE,JP}/*.sfc or $HM_ROM_DIR); writes the .bin files and sources")
        if name == "widths":
            p.add_argument("--write", action="store_true", help="store the suggested widths in the sidecars")
        if name == "import":
            p.add_argument("--allow-resize", action="store_true", help="allow growing a blob (shrinks the bank padding)")
        if name == "preview":
            p.add_argument("--out", default=str(ROOT / "build" / "gfx_preview"))
        if name == "sheet":
            p.add_argument("--out", help="output directory (default build/gfx_sheets/<region>)")
            p.add_argument("--scale", type=int, default=1, help="integer magnification")
            p.add_argument("--grid", action="store_true", help="draw the 16x16 unit grid")
    a = ap.parse_args(argv)
    return {"export": cmd_export, "import": cmd_import, "check": cmd_check, "preview": cmd_preview, "build": cmd_build,
            "sheet": cmd_sheet, "widths": cmd_widths}[a.cmd](a)


if __name__ == "__main__":
    sys.modules.setdefault("pngsync", sys.modules["__main__"])      # composed.py imports this file as `pngsync`
    sys.exit(main())
