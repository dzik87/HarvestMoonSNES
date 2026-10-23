#!/usr/bin/env python3
"""Porownuje zbudowany ROM z wartosciami wzorcowymi z tests/expected.json.

Uzycie:
    python tools/verify.py build/HarvestMoon.sfc [--region US] [--rom ORYGINAL.sfc]

--rom (opcjonalnie, tylko lokalnie): wskazuje oryginalny ROM i wlacza raport
roznic na poziomie banków LoROM, co ulatwia diagnoze niezgodnosci.
Kod wyjscia: 0 = zgodny, 1 = niezgodny, 2 = blad uzycia.
"""
import argparse
import hashlib
import json
import sys
import zlib
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
BANK = 0x8000


def digests(data: bytes) -> dict:
    return {
        "size": len(data),
        "crc32": f"{zlib.crc32(data) & 0xFFFFFFFF:08X}",
        "md5": hashlib.md5(data).hexdigest(),
        "sha1": hashlib.sha1(data).hexdigest(),
    }


def bank_report(built: bytes, ref: bytes) -> list[str]:
    lines = []
    if len(built) != len(ref):
        lines.append(f"rozmiar: zbudowany={len(built)} oryginal={len(ref)}")
    n = min(len(built), len(ref))
    for b in range((n + BANK - 1) // BANK):
        o = b * BANK
        a, r = built[o:o + BANK], ref[o:o + BANK]
        diff = [i for i in range(min(len(a), len(r))) if a[i] != r[i]]
        if diff:
            first = o + diff[0]
            lines.append(
                f"bank {0x80 + b:02X}: {len(diff)} roznych bajtow, "
                f"pierwszy @ offset 0x{first:06X} (SNES ${0x80 + first // BANK:02X}:{0x8000 + first % BANK:04X}) "
                f"zbudowany={built[first]:02X} oryginal={ref[first]:02X}"
            )
    return lines


def main() -> int:
    p = argparse.ArgumentParser()
    p.add_argument("rom", type=Path)
    p.add_argument("--region", default="US")
    p.add_argument("--expected", type=Path, default=ROOT / "tests" / "expected.json")
    p.add_argument("--rom-ref", "--rom", dest="ref", type=Path, default=None)
    args = p.parse_args()

    if not args.rom.is_file():
        print(f"brak pliku: {args.rom}", file=sys.stderr)
        return 2
    expected = json.loads(args.expected.read_text(encoding="utf-8")).get(args.region)
    if expected is None:
        print(f"brak wartosci wzorcowych dla regionu {args.region}", file=sys.stderr)
        return 2

    built = args.rom.read_bytes()
    got = digests(built)
    ok = True
    for key in ("size", "crc32", "md5", "sha1"):
        match = str(got[key]).lower() == str(expected[key]).lower()
        ok &= match
        print(f"{'OK  ' if match else 'FAIL'} {key:6} zbudowany={got[key]} oczekiwany={expected[key]}")

    if not ok and args.ref and args.ref.is_file():
        print("\nroznice wzgledem oryginalu:")
        for line in bank_report(built, args.ref.read_bytes()):
            print("  " + line)

    print(f"\n[{args.region}] " + ("ROM ZGODNY Z ORYGINALEM" if ok else "ROM NIEZGODNY"))
    return 0 if ok else 1


if __name__ == "__main__":
    sys.exit(main())
