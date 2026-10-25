#!/usr/bin/env python3
"""Graphics assets <-> editable PNG / text sources.  The PNG and text files are the source of truth; the `.bin` files
that the assembler includes (assets/gfx/{tiles,sprites,characters}/*.bin) must be reproducible from them bit for bit.

  export  [--label PAT]...   .bin -> PNG / text + JSON sidecar   (use once, or after changing the pipeline)
  import  [--label PAT]...   PNG / text -> .bin                  (the modding step; then rebuild with tools/build.py)
  check   [--label PAT]...   PNG / text -> bytes must equal the committed .bin for every blob (CI), exit 1 otherwise
  preview [--label PAT]... [--out DIR]   render BG name tables with their tile sets (in game colours) to DIR (default
                                          build/gfx_preview), tile sheets and sprite banks with a palette per tile to DIR/sheets

Blob kinds (PAT is an fnmatch pattern on the label, e.g. 'sCompressedTiles_9*' or 'Sprites_88*'; default: all):
  tiles      assets/gfx/tiles/sCompressedTiles_*.bin      LZSS-compressed 4bpp tile graphics -> assets/gfx/png/tiles/<label>.png
  sprites    assets/gfx/sprites/Sprites_*.bin             raw 4bpp OBJ graphics (banks $88-$91) -> assets/gfx/png/sprites/<label>.png
  tilemaps   assets/gfx/characters/sCompressedTilemap_*.bin (LZSS) and sCharactermap_*.bin (raw)
                                                          BG name tables -> assets/gfx/tilemaps/<label>.map.txt
Every blob has a <label>.json sidecar next to its PNG / text file (bpp, bpp_confidence, tiles_per_row, compression,
raw_size, trailing bytes of the label span, VRAM destination).  Details: docs/formats/graphics-png.md.

PNG rules: indexed colour (mode P), fixed dimensions, pixel value = SNES colour index (must stay < 2^bpp); the palette
stored in the PNG (PLTE) is only a viewing aid and is ignored on import: `export` fills it with the real 16 colours of the
sub-palette the blob is displayed with (assets/gfx/palette_map.json, docs/formats/graphics-palettes.md); index 0 of sprite
sheets is marked transparent (tRNS).  Name tables: 16-bit hex words, `columns` per row
(sidecar: 32, or 128 for the raw sCharactermap_* world maps), a blank line after every 32 rows; free to edit, the number of words must not change.

`import` refuses to change the size of the blob in the ROM unless --allow-resize is given: a shorter compressed stream is
padded with zeros automatically (layout unchanged); a longer one needs --allow-resize, which also shrinks the bank's
trailing `Padding_*` fill in src/data/gfx/<kind>/bank_XX.asm (error if the bank is full).
"""
import argparse
import fnmatch
import json
import os
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / "tools" / "gfx"))
import tilemap_codec as C  # noqa: E402
from palette_map import us_lines  # noqa: E402

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
    "tiles": Kind("tiles", "assets/gfx/tiles", ("sCompressedTiles_",), "assets/gfx/png/tiles", ".png", "sCompressedTiles_"),
    "sprites": Kind("sprites", "assets/gfx/sprites", ("Sprites_",), "assets/gfx/png/sprites", ".png"),
    "tilemaps": Kind("tilemaps", "assets/gfx/characters", ("sCompressedTilemap_", "sCharactermap_"), "assets/gfx/tilemaps",
                     ".map.txt", "sCompressedTilemap_"),
}
# asm banks that include each kind (used to adjust the Padding fill when a blob grows)
ASM_DIRS = {"tiles": "src/data/gfx/tiles", "sprites": "src/data/gfx/sprites", "tilemaps": "src/data/gfx/characters"}

# 4bpp was decided from VRAM destination slots (tile blobs are 8192 bytes = 256 4bpp tiles per $1000-word slot), from the
# plane-correlation statistics and by looking at the rendered sheets.  Blobs whose planes 2-3 are empty or that hold only a
# few tiles cannot be told apart from 2bpp by statistics alone; they were checked by eye (all read correctly as 4bpp).
VISUALLY_VERIFIED = {
    "sCompressedTiles_928000": "rain overlay", "sCompressedTiles_97B11A": "falling leaves overlay",
    "sCompressedTiles_9B8441": "weather overlay", "sCompressedTiles_9E9C6D": "snow overlay",
    "sCompressedTiles_9ABF97": "Latin font sheet", "sCompressedTiles_9AC489": "kana/digit font sheet",
    "sCompressedTiles_9ACB41": "kana/kanji font sheet", "sCompressedTiles_9B8000": "UI text tiles",
    "sCompressedTiles_9EEB3D": "Latin lower-case font sheet", "sCompressedTiles_A08000": "kanji sheet",
    "sCompressedTiles_A088E9": "kanji sheet", "sCompressedTiles_9FEF97": "publisher logo",
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
    """sPalette_0xNN -> 256 '#RRGGBB' strings (assets/gfx/palettes)."""
    key = (str(root), pal_id)
    if key not in _PALETTE_JSON:
        _PALETTE_JSON[key] = json.loads((Path(root) / "assets/gfx/palettes" / f"{pal_id}.json").read_text())["colors"]
    return _PALETTE_JSON[key]


def hex_rgb(c):
    return tuple(int(c[i:i + 2], 16) for i in (1, 3, 5))


def load_view_palette(spec, bpp, root=ROOT):
    """sidecar "palette": {"id": "sPalette_0x05", "sub": 3} -> list of RGB for the PNG viewing palette."""
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
        self.art = self.root / art / f"{label}{k.art_ext}"
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
        for p in sorted(d.glob("*.json" if from_sources else "*.bin")):
            if p.stem.startswith(k.prefixes):
                if not patterns or any(fnmatch.fnmatchcase(p.stem, pat) for pat in patterns):
                    out.append(Blob(name, p.stem, root, region))
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
    """tilemaps.asm -> {label: [(vram_word_dest, map_label, [(dest, label), ...])]} (first map entry listed first)."""
    global _MAP_INFO
    if _MAP_INFO is not None and Path(root) == ROOT:
        return _MAP_INFO
    text = us_lines((Path(root) / "src/code/bank_80/tilemaps.asm").read_text(encoding="utf-8", errors="replace").splitlines())
    start = next(i for i, l in enumerate(text) if re.match(r"^sFarmSpringMap:", l))
    maps, cur, last = {}, None, None
    for l in text[start:]:
        l = l.split(";")[0]
        m = re.match(r"^(\w+):", l)
        if m:
            cur = m.group(1)
            maps[cur] = []
            continue
        m = re.match(r"^\s*(?:\+\s*)?dw (.*)$", l)
        if m:
            last = m.group(1).split(",")[-1].strip()
            continue
        m = re.match(r"^\s*(?:\+\s*)?dl (s\w+)", l)
        if m and cur and last and last.startswith("$"):
            maps[cur].append((int(last[1:], 16), m.group(1)))
    info = {}
    for mlabel, pairs in maps.items():
        for dest, label in pairs:
            info.setdefault(label, []).append((dest, mlabel, pairs))
    if Path(root) == ROOT:
        _MAP_INFO = info
    return info


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
        out["tile_sets"] = [f"{l}@${d:04X}" for d, l in pairs if l.startswith(("sCompressedTiles_", "Sprites_"))]
    return out


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


def export_blob(b):
    raw, tail = read_raw(b)
    old = read_meta(b) if b.meta.exists() else {}
    meta = {"label": b.label, "kind": b.kind, "bin": b.rel(b.bin), "compression": "lzss" if b.compressed else "none",
            "raw_size": len(raw)}
    if b.kind == "tilemaps":
        columns = old.get("columns", 128 if b.label.startswith("sCharactermap_") else 32)
        meta.update({"format": "bg_name_table", "entries": len(raw) // 2, "columns": columns})
        b.art.parent.mkdir(parents=True, exist_ok=True)
        b.art.write_text(nametable_text(raw, columns), encoding="utf-8", newline="\n")
    else:
        conf, note = bpp_assessment(b, raw)
        tpr = old.get("tiles_per_row", 16)
        meta.update({"format": "snes_planar_tiles", "bpp": 4, "bpp_confidence": conf, "bpp_note": note, "tiles_per_row": tpr})
        w, h, pix = decode_sheet(raw, 4, tpr)
        pf = palette_fields(b, old)
        pal = load_view_palette(pf["palette"], 4, b.root) if pf.get("palette") else grayscale_palette(4)
        save_png(b.art, w, h, pix, pal, transparent0=(b.kind == "sprites" and "palette" in pf))
        meta.update(usage(b))
        meta.update(split_tail(tail))
        meta.update(pf)
        write_meta(b, meta)
        return meta
    meta.update(usage(b))
    meta.update(split_tail(tail))
    write_meta(b, meta)
    return meta


def source_payload(b, meta):
    """PNG / text -> raw payload bytes (before compression)."""
    if b.kind == "tilemaps":
        raw = parse_nametable(b.art.read_text(encoding="utf-8"))
        if len(raw) != meta["raw_size"]:
            raise ValueError(f"{b.label}: {len(raw) // 2} words, expected {meta['raw_size'] // 2} (the size is fixed)")
        return raw
    w, h, pix = load_png(b.art)
    exp_h = ((meta["raw_size"] + TILE_BYTES[meta["bpp"]] - 1) // TILE_BYTES[meta["bpp"]] + meta["tiles_per_row"] - 1) \
        // meta["tiles_per_row"] * 8
    if (w, h) != (meta["tiles_per_row"] * 8, exp_h):
        raise ValueError(f"{b.label}: PNG is {w}x{h}, expected {meta['tiles_per_row'] * 8}x{exp_h} (dimensions are fixed)")
    return encode_sheet(pix, w, h, meta["bpp"], meta["tiles_per_row"], meta["raw_size"])


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
            n += 1
    print(f"exported {n} {a.region.upper()} specific blobs")


def cmd_export(a, root=ROOT):
    if getattr(a, "region", "us") != "us":
        if not getattr(a, "rom_dir", None) and not os.environ.get("HM_ROM_DIR"):
            sel = blobs(root, a.label, a.kind, region=a.region)
            for b in sel:
                export_blob(b)
            print(f"exported {len(sel)} blobs")
            return 0
        return export_region_from_rom(a, root) or 0
    sel = blobs(root, a.label, a.kind, region=getattr(a, "region", "us"))
    for b in sel:
        export_blob(b)
    print(f"exported {len(sel)} blobs")
    return 0


def cmd_build(a, root=ROOT):
    """PNG / text sources -> .bin files (the .bin files are generated, git-ignored build products)."""
    sel = []
    for r in (REGIONS if getattr(a, "region", None) == "all" else [getattr(a, "region", None) or "us"]):
        sel += blobs(root, a.label, a.kind, from_sources=True, region=r)
    for b in sel:
        data = build_bin(b)
        b.bin.parent.mkdir(parents=True, exist_ok=True)
        if not b.bin.exists() or b.bin.read_bytes() != data:
            b.bin.write_bytes(data)
    print(f"pngsync build: {len(sel)} blobs written from PNG/text sources")
    if getattr(a, "region", None) == "all":
        print(f"pngsync build: {share_us_blobs(root)} shared blobs copied into the regional directories")
    return 0


def share_us_blobs(root=ROOT):
    """The bank sources include a blob through `!{REGDIR}` when ANY release has its own version of it.  For the releases
    that use the US data, the build copies the shared US file into that release's directory."""
    n = 0
    labels = set()
    for d in ("tiles", "characters"):
        for f in (Path(root) / "src/data/gfx" / d).glob("bank_*.asm"):
            labels |= set(re.findall(r'/!\{REGDIR\}(\w+)\.bin"', f.read_text(encoding="utf-8")))
    for lab in sorted(labels):
        if lab.startswith("sFontGlyphs_"):
            continue                                        # written for every release by tools/fonts/font.py
        k = next(k for k in KINDS.values() if lab.startswith(k.prefixes))
        us = Path(root) / k.src / f"{lab}.bin"
        for r in REGIONS[1:]:
            dst = Path(root) / region_dirs(k, r)[0] / f"{lab}.bin"
            if not dst.exists():
                dst.parent.mkdir(parents=True, exist_ok=True)
                dst.write_bytes(us.read_bytes()); n += 1
    return n


def cmd_check(a, root=ROOT):
    bad = 0
    region = getattr(a, "region", None) or "us"
    sel = blobs(root, a.label, a.kind, region=region, from_sources=region != "us")   # regional .bin dirs also hold copies of shared US blobs
    for b in sel:
        try:
            if not b.art.exists() or not b.meta.exists():
                raise ValueError("missing " + b.rel(b.art if not b.art.exists() else b.meta))
            got = build_bin(b)
            want = b.bin.read_bytes()
            if got != want:
                d = next((i for i in range(min(len(got), len(want))) if got[i] != want[i]), min(len(got), len(want)))
                raise ValueError(f"rebuilt {len(got)} bytes != committed {len(want)} bytes (first difference at {d})")
        except Exception as e:                                   # noqa: BLE001 - report every blob
            print(f"FAIL {b.label}: {e}")
            bad += 1
    if not a.label and not a.kind:       # coverage: no orphan sources
        known = {(x.art.name) for x in sel} | {x.meta.name for x in sel}
        for k in KINDS.values():
            d = Path(root) / region_dirs(k, region)[1]
            for p in sorted(d.glob("*")) if d.exists() else []:
                if p.suffix in (".png", ".json", ".txt") and p.name not in known:
                    print(f"FAIL orphan source without .bin: {p.relative_to(root)}")
                    bad += 1
    print(f"pngsync check: {len(sel)} blobs, " + (f"{bad} FAILED" if bad else "all reproduce the committed .bin bit-exactly"))
    return 1 if bad else 0


def adjust_padding(b, delta):
    """blob grew by `delta` bytes: shrink the bank's last Padding_* fill (same asm file as the blob)."""
    if getattr(b, "region", "us") != "us":
        return None                                     # regional banks end in `fill align`: the padding adapts by itself
    asm_dir = Path(b.root) / ASM_DIRS[b.kind]
    rx = re.compile(rf'incbin "[^"]*/{re.escape(b.label)}\.bin"')
    for f in sorted(asm_dir.glob("bank_*.asm")):
        text = f.read_text(encoding="utf-8")
        if not rx.search(text):
            continue
        fills = list(re.finditer(r"^(Padding_\w+:\s*\n\s*fill )(\d+)", text, re.M))
        if not fills:
            raise ValueError(f"{f.name}: no Padding_* fill to absorb {delta} extra bytes")
        m = fills[-1]
        left = int(m.group(2)) - delta
        if left < 0:
            raise ValueError(f"{f.name}: bank full, blob would exceed it by {-left} bytes")
        f.write_text(text[:m.start(2)] + str(left) + text[m.end(2):], encoding="utf-8", newline="\n")
        return f
    raise ValueError(f"{b.label}: not found in {asm_dir}")


def cmd_import(a, root=ROOT):
    sel = blobs(root, a.label, a.kind, region=getattr(a, "region", None) or "us")
    changed = 0
    for b in sel:
        meta = read_meta(b)
        old = b.bin.read_bytes()
        raw = source_payload(b, meta)
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
            tb = Blob("tiles", lab, root) if lab.startswith("sCompressedTiles_") else Blob("sprites", lab, root)
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


def main(argv=None):
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    sub = ap.add_subparsers(dest="cmd", required=True)
    for name in ("export", "import", "check", "preview", "build"):
        p = sub.add_parser(name)
        p.add_argument("--label", action="append", help="fnmatch pattern on the blob label (repeatable)")
        p.add_argument("--kind", choices=sorted(KINDS))
        if name in ("export", "import", "check", "build"):
            p.add_argument("--region", choices=REGIONS + (("all",) if name == "build" else ()), default="us",
                           help="release (default us = shared blobs; eu/de/jp = blobs that differ from US)")
        if name == "export":
            p.add_argument("--rom-dir", help="with --region eu|de|jp: take the region blobs from the ROM images "
                                             "(<dir>/{US,EU,DE,JP}/*.sfc or $HM_ROM_DIR); writes the .bin files and sources")
        if name == "import":
            p.add_argument("--allow-resize", action="store_true", help="allow growing a blob (shrinks the bank padding)")
        if name == "preview":
            p.add_argument("--out", default=str(ROOT / "build" / "gfx_preview"))
    a = ap.parse_args(argv)
    return {"export": cmd_export, "import": cmd_import, "check": cmd_check, "preview": cmd_preview, "build": cmd_build}[a.cmd](a)


if __name__ == "__main__":
    sys.exit(main())
