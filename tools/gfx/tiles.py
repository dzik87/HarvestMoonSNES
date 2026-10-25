#!/usr/bin/env python3
"""SNES planar tile data <-> indexed PNG sheets (lossless for any byte content).

Formats (8x8 tiles):
  2bpp: 16 bytes/tile  - bitplanes 0,1 interleaved per row (byte 2*y = plane 0, 2*y+1 = plane 1)
  4bpp: 32 bytes/tile  - planes 0,1 in the first 16 bytes, planes 2,3 in the next 16
  8bpp: 64 bytes/tile  - four plane pairs of 16 bytes each
Pixel (x, y): bit 7-x of each plane row byte, plane n contributes bit n of the colour index.

Commands:
  to-png   BIN PNG   [--bpp 4] [--width 16] [--palette JSON]   raw tile data -> indexed PNG sheet
  from-png PNG BIN   [--bpp 4]                                  PNG sheet -> raw tile data
  selftest                                                      round trip on synthetic data (+ real blobs if present)

The PNG keeps colour indices (mode "P"); an optional palette JSON from assets/gfx/palettes selects
the sub-palette with --subpalette N (16 colours for 4bpp). Data whose size is not a multiple of the tile
size is padded with zeros in the PNG; pass --length when converting back to trim it.
"""
import argparse, json, sys
from pathlib import Path

BYTES = {2: 16, 4: 32, 8: 64}


def decode_tile(data, off, bpp):
    px = [[0] * 8 for _ in range(8)]
    for plane in range(bpp):
        base = off + (plane // 2) * 16 + (plane % 2)
        for y in range(8):
            row = data[base + 2 * y]
            for x in range(8):
                px[y][x] |= ((row >> (7 - x)) & 1) << plane
    return px


def encode_tile(px, bpp):
    out = bytearray(BYTES[bpp])
    for plane in range(bpp):
        base = (plane // 2) * 16 + (plane % 2)
        for y in range(8):
            v = 0
            for x in range(8):
                v |= ((px[y][x] >> plane) & 1) << (7 - x)
            out[base + 2 * y] = v
    return bytes(out)


def to_image(data, bpp=4, width=16, palette=None):
    from PIL import Image
    size = BYTES[bpp]
    n = (len(data) + size - 1) // size
    data = data + bytes(n * size - len(data))
    rows = (n + width - 1) // width
    img = Image.new("P", (width * 8, max(rows, 1) * 8), 0)
    pix = img.load()
    for t in range(n):
        tile = decode_tile(data, t * size, bpp)
        ox, oy = (t % width) * 8, (t // width) * 8
        for y in range(8):
            for x in range(8):
                pix[ox + x, oy + y] = tile[y][x]
    pal = palette or [(i * 255 // ((1 << bpp) - 1),) * 3 for i in range(1 << bpp)]
    flat = [c for rgb in pal for c in rgb]
    img.putpalette(flat + [0] * (768 - len(flat)))
    return img


def from_image(img, bpp=4, length=None):
    if img.mode != "P":
        raise ValueError("PNG must be an indexed (P) image")
    width = img.width // 8
    pix = img.load()
    out = bytearray()
    for t in range(width * (img.height // 8)):
        ox, oy = (t % width) * 8, (t // width) * 8
        tile = [[pix[ox + x, oy + y] for x in range(8)] for y in range(8)]
        if any(v >> bpp for row in tile for v in row):
            raise ValueError(f"tile {t}: colour index exceeds {bpp}bpp")
        out += encode_tile(tile, bpp)
    return bytes(out[:length] if length is not None else out)


def load_palette(path, sub, bpp):
    colors = json.loads(Path(path).read_text())["colors"]
    n = 1 << bpp
    return [tuple(int(c[i:i + 2], 16) for i in (1, 3, 5)) for c in colors[sub * n:(sub + 1) * n]]


def selftest():
    import os, random
    rnd = random.Random(1)
    for bpp in (2, 4, 8):
        data = bytes(rnd.randrange(256) for _ in range(BYTES[bpp] * 37))
        for w in (1, 16, 5):
            assert from_image(to_image(data, bpp, w), bpp, len(data)) == data, (bpp, w)
    root = Path(__file__).resolve().parents[2]
    sys.path.insert(0, str(root / "tools" / "gfx"))
    import tilemap_codec as C
    n = 0
    for f in sorted((root / "src" / "data" / "gfx").glob("*/*.asm")):
        for label, blob in C.parse_asm_blobs(str(f), tail=64).items():
            if not label.startswith("sCompressed"):
                continue
            out, _ = C.decompress(blob)
            for bpp in (2, 4):
                assert from_image(to_image(out, bpp), bpp, len(out)) == out, (label, bpp)
            n += 1
    print(f"tiles selftest OK (synthetic + {n} real decompressed blobs, 2bpp and 4bpp)")


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    sub = ap.add_subparsers(dest="cmd", required=True)
    a = sub.add_parser("to-png"); a.add_argument("bin"); a.add_argument("png")
    a.add_argument("--bpp", type=int, default=4, choices=BYTES); a.add_argument("--width", type=int, default=16)
    a.add_argument("--palette"); a.add_argument("--subpalette", type=int, default=0)
    b = sub.add_parser("from-png"); b.add_argument("png"); b.add_argument("bin")
    b.add_argument("--bpp", type=int, default=4, choices=BYTES); b.add_argument("--length", type=int)
    sub.add_parser("selftest")
    args = ap.parse_args()
    if args.cmd == "selftest":
        selftest()
    elif args.cmd == "to-png":
        pal = load_palette(args.palette, args.subpalette, args.bpp) if args.palette else None
        to_image(Path(args.bin).read_bytes(), args.bpp, args.width, pal).save(args.png)
    else:
        from PIL import Image
        Path(args.bin).write_bytes(from_image(Image.open(args.png), args.bpp, args.length))
    return 0


if __name__ == "__main__":
    sys.exit(main())
