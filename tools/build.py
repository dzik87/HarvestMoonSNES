#!/usr/bin/env python3
"""Builds the ROM from source with asar and (by default) verifies the result.

Usage:
    python tools/build.py [--region US] [--asar SCIEZKA] [--out build/HarvestMoon.sfc]
                          [--no-verify] [-v]

asar lookup order: --asar, ASAR environment variable, tools/bin/asar(.exe), PATH.

The output file is created from scratch as 2 MB of zeros (cartridge size) and asar
patches code and data into it (--no-title-check because an empty file has no header;
--fix-checksum=off because the checksum comes from the header in the sources). The result
therefore does not depend on a previous build, and the unused banks BC-BF are deterministically
zero-filled (as in the original).
"""
import argparse
import os
import shutil
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
ROM_SIZE = 0x200000
MAIN = {r: "src/main.asm" for r in ("US", "EU", "DE", "JP")}  # regions share the entry; `-DREGION_xx=1` selects the patch blocks and the regional data (docs/regions.md)
DEFINES = {"US": [], "EU": ["-DREGION_EU=1"], "DE": ["-DREGION_DE=1"], "JP": ["-DREGION_JP=1"]}


# sources that tools/extract.py writes from the user's ROM dumps (docs/extraction.md); any one missing = the assets tree is not there
REQUIRED_ASSETS = ("assets/gfx/png", "assets/gfx/palettes", "assets/fonts/us", "assets/dialogs/us")


def check_assets():
    missing = [d for d in REQUIRED_ASSETS if not (ROOT / d).is_dir()]
    if missing:
        sys.exit("The assets tree is missing (%s).\nThe repository holds code and structure only; extract the assets from your own ROM dumps first:\n"
                 "    python tools/extract.py --rom-dir <folder with your US/EU/DE/JP dumps>\n(see docs/extraction.md)" % ", ".join(missing))


def find_asar(explicit):
    candidates = [explicit, os.environ.get("ASAR")]
    exe = "asar.exe" if os.name == "nt" else "asar"
    candidates.append(ROOT / "tools" / "bin" / exe)
    for c in candidates:
        if c and Path(c).is_file():
            return str(Path(c))
    found = shutil.which("asar")
    if found:
        return found
    sys.exit("asar not found. Run: python tools/build_asar.py (see docs/building.md), or pass --asar / set ASAR / place the binary in tools/bin/.")


def main() -> int:
    p = argparse.ArgumentParser()
    p.add_argument("--region", default="US", choices=sorted(MAIN))
    p.add_argument("--asar")
    p.add_argument("--out", type=Path, default=ROOT / "build" / "HarvestMoon.sfc")
    p.add_argument("--no-verify", action="store_true")
    p.add_argument("--no-assets", action="store_true", help="skip generating the .bin/.pal files from PNG/JSON sources")
    p.add_argument("-v", "--verbose", action="store_true")
    args = p.parse_args()

    check_assets()
    if not args.no_assets:
        sys.path.insert(0, str(ROOT / "tools"))
        import build_assets
        rc = build_assets.main(quiet=not args.verbose)
        if rc:
            return rc
    asar = find_asar(args.asar)
    out = args.out if args.out.is_absolute() else ROOT / args.out
    out.parent.mkdir(parents=True, exist_ok=True)
    out.write_bytes(bytes(ROM_SIZE))

    cmd = [asar]
    if args.verbose:
        cmd.append("-v")
    cmd += DEFINES[args.region]
    cmd += ["-werror", "--no-title-check", "--fix-checksum=off", MAIN[args.region], str(out)]
    print("+", " ".join(cmd))
    rc = subprocess.run(cmd, cwd=ROOT).returncode
    if rc != 0:
        print(f"asar failed (exit code {rc})", file=sys.stderr)
        return rc

    size = out.stat().st_size
    if size != ROM_SIZE:
        print(f"WARNING: ROM size = {size}, expected {ROM_SIZE}", file=sys.stderr)

    if args.no_verify:
        return 0
    # every reference set of the region is checked: "DE" (code banks), "DE-AI" (AI banks $B3-$B5), ...
    import json
    expected = json.loads((ROOT / "tests" / "expected.json").read_text(encoding="utf-8"))
    rc = 0
    for key in [k for k in expected if k == args.region or k.startswith(args.region + "-")]:
        rc |= subprocess.run([sys.executable, str(ROOT / "tools" / "verify.py"), str(out), "--region", key]).returncode
    return rc


if __name__ == "__main__":
    sys.exit(main())
