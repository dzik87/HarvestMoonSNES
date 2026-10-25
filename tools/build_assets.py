#!/usr/bin/env python3
"""Generates the binary assets that are included by the assembler (`incbin`) from their editable sources.

Sources (committed)                                   -> generated, git-ignored files
  assets/gfx/palettes/sPalette_0xNN.json               -> assets/gfx/palettes/sPalette_0xNN.pal          (tools/gfx/palette.py pack)
  assets/fonts/us/glyph_*.png + glyphs.json            -> assets/gfx/tiles/sFontGlyphs_*.bin             (tools/fonts/font.py build)
  assets/gfx/png/{tiles,sprites}/*.png + sidecar JSON  -> assets/gfx/{tiles,sprites}/*.bin               (tools/gfx/pngsync.py build)
  assets/gfx/tilemaps/*.map.txt + sidecar JSON         -> assets/gfx/characters/*.bin                    (tools/gfx/pngsync.py build)

  assets/objects/bank_8{6,7}/ (bank.json, objects/*.json, frames.txt) -> build/gen/objects/bank_8{6,7}.asm (tools/objects/objdata.py build)
  assets/maps/*.json                                   -> build/gen/maps/bank_A7.asm                     (tools/maps/objmap.py build)

Audio blobs (assets/audio/*.bin) have no editable source format yet and stay committed as binaries.
`tools/build.py` runs this script before asar; run it by hand before the tests/checks that read the generated files.
The generated files are byte-for-byte what the original ROM contains (the ROM hash check in CI proves it).
"""
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
STEPS = [
    ("palettes", [sys.executable, "tools/gfx/palette.py", "pack"]),
    ("font tables", [sys.executable, "tools/fonts/font.py", "build", "--region", "us", "--write-assets"]),
    ("graphics blobs", [sys.executable, "tools/gfx/pngsync.py", "build", "--region", "all"]),
    ("dialog banks", [sys.executable, "tools/dialogs/dialog.py", "build"]),
    ("object animation banks", [sys.executable, "tools/objects/objdata.py", "build"]),
    ("object maps", [sys.executable, "tools/maps/objmap.py", "build"]),
]
for _r in ("eu", "de", "jp"):
    STEPS.insert(2, (f"font tables {_r}", [sys.executable, "tools/fonts/font.py", "build", "--region", _r, "--write-assets"]))


def main(quiet=False):
    for name, cmd in STEPS:
        r = subprocess.run(cmd, cwd=ROOT, capture_output=quiet, text=True)
        if r.returncode != 0:
            print(f"build_assets: step '{name}' failed (exit code {r.returncode})", file=sys.stderr)
            if quiet:
                print(r.stdout, r.stderr, file=sys.stderr)
            return r.returncode
    if not quiet:
        print("build_assets: all generated assets are up to date")
    return 0


if __name__ == "__main__":
    sys.exit(main())
