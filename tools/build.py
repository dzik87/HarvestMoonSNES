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
MAIN = {"US": "src/main.asm"}  # more regions will be added as the migration progresses


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
    sys.exit("asar not found. Pass --asar, set ASAR or place the binary in tools/bin/.")


def main() -> int:
    p = argparse.ArgumentParser()
    p.add_argument("--region", default="US", choices=sorted(MAIN))
    p.add_argument("--asar")
    p.add_argument("--out", type=Path, default=ROOT / "build" / "HarvestMoon.sfc")
    p.add_argument("--no-verify", action="store_true")
    p.add_argument("-v", "--verbose", action="store_true")
    args = p.parse_args()

    asar = find_asar(args.asar)
    out = args.out if args.out.is_absolute() else ROOT / args.out
    out.parent.mkdir(parents=True, exist_ok=True)
    out.write_bytes(bytes(ROM_SIZE))

    cmd = [asar]
    if args.verbose:
        cmd.append("-v")
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
    return subprocess.run(
        [sys.executable, str(ROOT / "tools" / "verify.py"), str(out), "--region", args.region]
    ).returncode


if __name__ == "__main__":
    sys.exit(main())
