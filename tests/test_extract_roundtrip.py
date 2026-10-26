#!/usr/bin/env python3
"""ROM -> assets extraction round trip (needs the owner's ROM dumps; skipped without them).

    HM_ROM_DIR=/path/to/roms python3 tests/test_extract_roundtrip.py

Each group of steps extracts into a scratch directory and the result must be identical to the committed assets/ tree
(`tools/extract.py --compare`).  HM_ROUNDTRIP_BUILD=1 additionally replaces those kinds in a scratch copy of the repository
with the extracted files and builds all four releases ("ROM MATCHES ORIGINAL").
The ROMs are read only; nothing derived from them is written outside the temporary directory.
"""
import os
import shutil
import subprocess
import sys
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
ROM_DIR = os.environ.get("HM_ROM_DIR")

AUDIO_DATA_STEPS = "audio,objects,maps,areas,tables,menu,ai"      # audio, object banks, maps, areas, tables, menu, AI data
GFX_STEPS = "palettes,fonts,dialogs,graphics"                     # palettes, fonts, graphics, dialogs (graphics needs areas, objects, tables)
KINDS = ["audio", "objects", "maps", "areas", "tables", "menu", "ai", "fonts", "dialogs", "gfx"]


def extract(out: Path, steps: str):
    return subprocess.run([sys.executable, str(ROOT / "tools" / "extract.py"), "--rom-dir", ROM_DIR, "--out", str(out),
                           "--only", steps, "--compare", str(ROOT / "assets")], capture_output=True, text=True)


def test_data_steps_reproduce_assets():
    with tempfile.TemporaryDirectory(prefix="hm_extract_") as tmp:
        r = extract(Path(tmp) / "assets", AUDIO_DATA_STEPS)
        assert r.returncode == 0 and "identical" in r.stdout, r.stdout[-2000:] + r.stderr[-2000:]


def test_graphics_steps_reproduce_assets():
    """palettes, fonts, dialogs and graphics (with the steps the graphics need) are byte-identical to assets/."""
    with tempfile.TemporaryDirectory(prefix="hm_extract_") as tmp:
        r = extract(Path(tmp) / "assets", GFX_STEPS + ",areas,objects,tables")
        assert r.returncode == 0 and "identical" in r.stdout, r.stdout[-2000:] + r.stderr[-2000:]


def test_steps_build_all_regions():
    if os.environ.get("HM_ROUNDTRIP_BUILD") != "1":
        print("skip: set HM_ROUNDTRIP_BUILD=1 to build the four releases from the extracted tree")
        return
    with tempfile.TemporaryDirectory(prefix="hm_extract_build_") as tmp:
        tmp = Path(tmp)
        r = extract(tmp / "ex", AUDIO_DATA_STEPS + "," + GFX_STEPS)
        assert r.returncode == 0, r.stdout[-2000:]
        proj = tmp / "p"
        shutil.copytree(ROOT, proj, ignore=shutil.ignore_patterns(".git", "build", "__pycache__"), symlinks=True)
        for k in KINDS:
            shutil.rmtree(proj / "assets" / k, ignore_errors=True)
            shutil.copytree(tmp / "ex" / k, proj / "assets" / k)
        for region in ("US", "EU", "DE", "JP"):
            b = subprocess.run([sys.executable, "tools/build.py", "--region", region, "--out", "build/rt_%s.sfc" % region],
                               cwd=proj, capture_output=True, text=True)
            assert "[%s] ROM MATCHES ORIGINAL" % region in b.stdout, "%s: %s" % (region, (b.stdout + b.stderr)[-1500:])


def main():
    if not ROM_DIR or not Path(ROM_DIR).is_dir():
        print("test_extract_roundtrip: HM_ROM_DIR not set (or not a directory), skipped")
        return 0
    fails = 0
    for name, fn in sorted((n, f) for n, f in globals().items() if n.startswith("test_") and callable(f)):
        try:
            fn()
            print("%-45s ok" % name)
        except AssertionError as e:
            fails += 1
            print("%-45s FAIL\n%s" % (name, e))
    return 1 if fails else 0


if __name__ == "__main__":
    sys.exit(main())
