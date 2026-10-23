#!/usr/bin/env python3
"""Buduje ROM z zrodel przy uzyciu asara i (domyslnie) weryfikuje wynik.

Uzycie:
    python tools/build.py [--region US] [--asar SCIEZKA] [--out build/HarvestMoon.sfc]
                          [--no-verify] [-v]

Lokalizacja asara (kolejnosc): --asar, zmienna ASAR, tools/bin/asar(.exe), PATH.

Plik wyjsciowy jest tworzony od zera jako 2 MB zer (rozmiar kartridza), a asar
nanosi na niego kod i dane. Dzieki temu wynik nie zalezy od poprzedniego buildu,
a nieuzywane banki BC-BF maja deterministyczne wypelnienie zerami (jak w oryginale).
"""
import argparse
import os
import shutil
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
ROM_SIZE = 0x200000
MAIN = {"US": "main.asm"}  # kolejne regiony beda dodawane wraz z migracja


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
    sys.exit("Nie znaleziono asara. Podaj --asar, ustaw ASAR lub umiesc plik w tools/bin/.")


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
    cmd += ["-werror", MAIN[args.region], str(out)]
    print("+", " ".join(cmd))
    rc = subprocess.run(cmd, cwd=ROOT).returncode
    if rc != 0:
        print(f"asar zakonczyl sie bledem (kod {rc})", file=sys.stderr)
        return rc

    size = out.stat().st_size
    if size != ROM_SIZE:
        print(f"UWAGA: rozmiar ROM = {size}, oczekiwano {ROM_SIZE}", file=sys.stderr)

    if args.no_verify:
        return 0
    return subprocess.run(
        [sys.executable, str(ROOT / "tools" / "verify.py"), str(out), "--region", args.region]
    ).returncode


if __name__ == "__main__":
    sys.exit(main())
