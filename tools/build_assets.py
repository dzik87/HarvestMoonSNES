#!/usr/bin/env python3
"""Generates the binary assets that are included by the assembler (`incbin`) from their editable sources.

Sources (committed)                                   -> generated, git-ignored files
  assets/gfx/palettes/sPalette_0xNN.json               -> assets/gfx/palettes/sPalette_0xNN.pal          (tools/gfx/palette.py pack)
  assets/fonts/us/glyph_*.png + glyphs.json            -> assets/gfx/tiles/sFontGlyphs_*.bin             (tools/fonts/font.py build)
  assets/gfx/png/{frames,screens,tiles,sprites}/ composed PNGs + <label>.json -> assets/gfx/{tiles,sprites}/*.bin  (tools/gfx/pngsync.py build)
  assets/gfx/tilemaps/*.map.txt + sidecar JSON         -> assets/gfx/characters/*.bin                    (tools/gfx/pngsync.py build)
  assets/gfx/banks.json (bank layout)                  -> build/gen/gfx/<kind>/bank_XX.asm               (tools/data/gfxbanks.py build)

  assets/objects/bank_8{6,7}/ (bank.json, objects/*.json, frames.txt) -> build/gen/objects/bank_8{6,7}.asm (tools/objects/objdata.py build)
  assets/maps/*.json                                   -> build/gen/maps/bank_A7.asm                     (tools/maps/objmap.py build)

  assets/areas/*, assets/tables/*.json                 -> build/gen/{maps,tables}/*.asm                      (tools/maps/areadata.py, tools/data/smalltables.py build)
  assets/ai/{scripts.json,npc_sprite_tables.txt}      -> build/gen/ai/{head_B3..B5,slots_NN}.asm       (tools/ai/aidata.py build)

  assets/audio/{samples,tracks,sfx,driver}/*, audio.json, banks.json -> assets/audio/*.bin + build/gen/audio/{bank_XX.asm,audio_tables.inc} (tools/audio/audioconv.py build)

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
    ("graphics bank asm", [sys.executable, "tools/data/gfxbanks.py", "build"]),
    ("audio blobs", [sys.executable, "tools/audio/audioconv.py", "build", "-q"]),
    ("dialog banks", [sys.executable, "tools/dialogs/dialog.py", "build"]),
    ("dialog text tables", [sys.executable, "tools/dialogs/texttables.py", "build"]),
    ("object animation banks", [sys.executable, "tools/objects/objdata.py", "build"]),
    ("object maps", [sys.executable, "tools/maps/objmap.py", "build"]),
    ("small data tables", [sys.executable, "tools/data/smalltables.py", "build"]),
    ("name input grids", [sys.executable, "tools/menu/nameinput.py", "build"]),
    ("area tables", [sys.executable, "tools/maps/areadata.py", "build"]),
    ("AI script heads", [sys.executable, "tools/ai/aidata.py", "build"]),
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
