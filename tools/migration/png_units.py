#!/usr/bin/env python3
"""One-shot migration (already applied): one sheet PNG + sidecar per tile/sprite blob -> a directory of 16x16 unit PNGs +
manifest.json (see docs/formats/graphics-png.md).  Kept for the history of the repository; it needs the legacy layout
(assets/gfx/png[/<region>]/{tiles,sprites}/<label>.png + <label>.json), which no longer exists after the migration.

For every legacy sheet the raw payload is rebuilt from the PNG pixels (the old pipeline), compared with the generated .bin
(the blob must be bit identical), written as units and the legacy files are deleted.
"""
import json
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / "tools" / "gfx"))
import pngsync as P  # noqa: E402


def legacy_raw(b, meta):
    w, h, pix = P.load_png(b.art.parent / f"{b.label}.png")
    return P.encode_sheet(pix, w, h, meta["bpp"], meta["tiles_per_row"], meta["raw_size"])


def main():
    n = 0
    for region in P.REGIONS:
        for kind in P.UNIT_PREFIX:
            d = ROOT / P.region_dirs(P.KINDS[kind], region)[1]
            for js in sorted(d.glob("*.json")):
                label = js.stem
                b = P.Blob(kind, label, ROOT, region)
                meta = json.loads(js.read_text(encoding="utf-8"))
                raw = legacy_raw(b, meta)
                tail = P.join_tail(meta)
                if b.bin.exists():
                    want = b.bin.read_bytes()
                    got = (P.C.compress(raw) + tail) if b.compressed else raw
                    assert got == want, f"{label}: legacy sources do not reproduce the .bin"
                P.export_blob(b, raw, tail, old=meta)
                js.unlink()
                (d / f"{label}.png").unlink()
                n += 1
    print(f"migrated {n} blobs to unit PNGs")


if __name__ == "__main__":
    main()
