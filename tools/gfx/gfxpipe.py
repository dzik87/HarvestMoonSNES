#!/usr/bin/env python3
"""Editing pipeline for compressed graphics blobs (assets/gfx/{tiles,characters}/sCompressed*.bin).

  export [--png] [--out DIR]   decompress every blob to DIR/<label>.raw (default build/gfx_export), optionally PNG sheets
  import --label L --raw F     recompress a raw file (or --png F --bpp N) and write assets/gfx/.../L.bin
  verify                       compress(decompress(blob)) == blob for every blob (also in tests/test_tilemap_codec.py)

Workflow for editing: `export --png`, edit the PNG (indexed colour, same size), `import --label L --png edited.png`,
then rebuild; CI/`tools/build.py` confirms the new hash. Only blobs that decompress to the stored size can be
re-imported unchanged in size; the header size field is recomputed by the encoder.
Blob kinds (found by inspecting the decompressed data, see docs/formats/tilemap-compression.md):
  sCompressedTilemap_*      (assets/gfx/tiles)       tile graphics, rendered correctly as 4bpp (default of --bpp); the one
                                                     4096-byte exception (sCompressedTilemap_928000, rain overlay) is likely 2bpp
  sCompressedCharactermap_* (assets/gfx/characters)  16-bit BG name-table entries (tile 0-9, palette 10-12, priority 13,
                                                     H/V flip 14/15), NOT tile graphics: `export` writes them as .raw plus a
                                                     readable .map.txt (32 entries per row); PNG sheets are produced for tile blobs only
Blobs with trailing data inside their label span (see docs/findings.md) keep that tail when re-imported.
"""
import argparse, sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / "tools" / "gfx"))
import tilemap_codec as C  # noqa: E402
import tiles as T  # noqa: E402

DIRS = [ROOT / "assets/gfx/tiles", ROOT / "assets/gfx/characters"]


PAD = bytes(64)  # a blob's last bytes may sit under the following zero `Padding_*` label (see docs/findings.md)


def blobs():
    for d in DIRS:
        for p in sorted(d.glob("sCompressed*.bin")):
            yield p


def name_table_text(raw):
    """16-bit little-endian BG name-table entries, 32 per row, as hex words."""
    words = [raw[i] | raw[i + 1] << 8 for i in range(0, len(raw) - 1, 2)]
    return "".join(" ".join(f"{w:04X}" for w in words[i:i + 32]) + "\n" for i in range(0, len(words), 32))


def cmd_export(a):
    out = Path(a.out); out.mkdir(parents=True, exist_ok=True)
    n = 0
    for p in blobs():
        raw, used = C.decompress(p.read_bytes() + PAD)
        (out / f"{p.stem}.raw").write_bytes(raw)
        if "Charactermap" in p.stem:
            (out / f"{p.stem}.map.txt").write_text(name_table_text(raw))
        elif a.png:
            T.to_image(raw, a.bpp, 16).save(out / f"{p.stem}.png")
        n += 1
    print(f"exported {n} blobs to {out}")


def cmd_import(a):
    target = next((p for p in blobs() if p.stem == a.label), None)
    if target is None:
        raise SystemExit(f"unknown label {a.label}")
    old = target.read_bytes()
    _, used = C.decompress(old + PAD)
    tail = old[used:]
    if a.png:
        from PIL import Image
        raw = T.from_image(Image.open(a.png), a.bpp)
    else:
        raw = Path(a.raw).read_bytes()
    new = C.compress(raw) + tail
    if len(new) != len(old) and not a.allow_resize:
        raise SystemExit(f"new size {len(new)} != {len(old)}: following data would move and pointers are not updated "
                         "(use --allow-resize only if you fix the layout)")
    target.write_bytes(new)
    print(f"{a.label}: {len(old)} -> {len(new)} bytes (tail kept: {len(tail)})")


def cmd_verify(a):
    bad = 0
    for p in blobs():
        data = p.read_bytes() + PAD
        raw, used = C.decompress(data)
        if C.compress(raw) != data[:used]:
            print("NOT EXACT", p.name); bad += 1
    print("gfx verify:", "FAILED" if bad else "OK")
    return 1 if bad else 0


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    sub = ap.add_subparsers(dest="cmd", required=True)
    e = sub.add_parser("export"); e.add_argument("--png", action="store_true"); e.add_argument("--out", default=str(ROOT / "build/gfx_export")); e.add_argument("--bpp", type=int, default=4)
    i = sub.add_parser("import"); i.add_argument("--label", required=True); i.add_argument("--raw"); i.add_argument("--png"); i.add_argument("--bpp", type=int, default=4); i.add_argument("--allow-resize", action="store_true")
    sub.add_parser("verify")
    a = ap.parse_args()
    return {"export": cmd_export, "import": cmd_import, "verify": cmd_verify}[a.cmd](a) or 0


if __name__ == "__main__":
    sys.exit(main())
