#!/usr/bin/env python3
"""One-shot migration (already applied): directories of 16x16 unit PNGs + manifest.json per blob -> composed image sources
(assets/gfx/png/{screens,frames}/, remainder sheets <label>.png + sidecar <label>.json), see docs/formats/graphics-png.md.
It needs the generated .bin files (tools/build_assets.py of the commit before the migration) and the legacy unit directories,
which no longer exist afterwards.
"""
import json
import shutil
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / "tools" / "gfx"))
import pngsync as P  # noqa: E402


def main():
    for region in P.REGIONS:
        for kind in ("tiles", "sprites"):
            d = ROOT / P.region_dirs(P.KINDS[kind], region)[1]
            for man in sorted(d.glob("*/manifest.json")):
                meta = json.loads(man.read_text(encoding="utf-8"))
                for k in [k for k in meta if k.startswith("unit_")]:
                    del meta[k]
                (d / f"{man.parent.name}.json").write_text(json.dumps(meta, indent=2, ensure_ascii=False) + "\n", encoding="utf-8", newline="\n")
                shutil.rmtree(man.parent)
        n = P.export_composed(ROOT, region)
        print(f"{region}: {n} blobs converted")


if __name__ == "__main__":
    main()
