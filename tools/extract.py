#!/usr/bin/env python3
"""Extracts the editable assets from the user's own ROM dumps into assets/ (git-ignored).

    python tools/extract.py --rom-dir DIR            # DIR is searched recursively for the four releases (US EU DE JP)
    python tools/extract.py --rom-dir DIR --only palettes,fonts
    python tools/extract.py --rom-dir DIR --out /tmp/assets --compare assets   # extract elsewhere and diff with a tree
    python tools/extract.py --list

The releases are recognised by size and CRC32 (tests/expected.json), so file names do not matter. A 512-byte copier
header is stripped automatically. Missing releases only disable the steps that need them. No ROM data is ever
written outside the output directory.
See docs/extraction.md for the model (defs/ = committed structure, assets/ = extracted content).
"""
import argparse
import binascii
import filecmp
import json
import sys
import time
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT / "tools"))
from extract_steps import Context, all_steps  # noqa: E402

ROM_SIZE = 2 * 1024 * 1024


def find_roms(rom_dir: Path, verbose=False):
    expected = json.loads((ROOT / "tests" / "expected.json").read_text())
    by_crc = {int(v["crc32"], 16) if isinstance(v["crc32"], str) else v["crc32"]: k for k, v in expected.items()}
    found = {}
    for p in sorted(rom_dir.rglob("*")):
        if not p.is_file() or p.stat().st_size not in (ROM_SIZE, ROM_SIZE + 512):
            continue
        data = p.read_bytes()
        if len(data) == ROM_SIZE + 512:
            data = data[512:]
        region = by_crc.get(binascii.crc32(data) & 0xFFFFFFFF)
        if region and region not in found:
            found[region] = (p, data)
            if verbose:
                print("found %s: %s" % (region, p))
    return found


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--rom-dir", type=Path)
    ap.add_argument("--out", type=Path, default=ROOT / "assets")
    ap.add_argument("--only", help="comma separated step names")
    ap.add_argument("--compare", type=Path, help="after extraction, diff --out against this tree and fail on differences")
    ap.add_argument("--list", action="store_true")
    ap.add_argument("-v", "--verbose", action="store_true")
    a = ap.parse_args()

    steps = all_steps()
    if a.list:
        for s in steps:
            print("%-22s regions=%s after=%s  %s" % (s.name, ",".join(s.regions), ",".join(s.after) or "-", s.doc))
        return 0
    if not a.rom_dir:
        ap.error("--rom-dir is required")
    found = find_roms(a.rom_dir, a.verbose)
    if not found:
        sys.exit("no known Harvest Moon ROM found under %s (expected 2 MB .sfc/.smc dumps of US, EU, DE, JP)" % a.rom_dir)
    # headerless copies are handed to the steps through a private temp dir
    import tempfile
    tmp = Path(tempfile.mkdtemp(prefix="hm_roms_"))
    roms = {}
    for region, (p, data) in found.items():
        q = tmp / ("%s.sfc" % region)
        q.write_bytes(data)
        roms[region] = q
    only = set(a.only.split(",")) if a.only else None
    done, rc = set(), 0
    ctx = Context(roms=roms, root=ROOT, assets=a.out, defs=ROOT / "defs", verbose=a.verbose)
    a.out.mkdir(parents=True, exist_ok=True)
    pending = [s for s in steps if (only is None or s.name in only)]
    while pending:
        progressed = False
        for s in list(pending):
            if any(d not in done for d in s.after if d in {x.name for x in pending}):
                continue
            pending.remove(s)
            progressed = True
            missing = [r for r in s.regions if r not in roms]
            if missing:
                print("skip %-20s (missing ROM: %s)" % (s.name, ",".join(missing)))
                continue
            t = time.time()
            s.run(ctx)
            done.add(s.name)
            print("ok   %-20s %.1fs" % (s.name, time.time() - t))
        if not progressed:
            sys.exit("cyclic or unsatisfiable step dependencies: %s" % ", ".join(s.name for s in pending))
    if a.compare:
        diffs = compare_trees(a.out, a.compare)
        if diffs:
            print("DIFFERENCES vs %s (%d):" % (a.compare, len(diffs)))
            for d in diffs[:40]:
                print("  ", d)
            rc = 1
        else:
            print("extracted tree is identical to %s" % a.compare)
    return rc


def compare_trees(a: Path, b: Path):
    out = []
    fa = {p.relative_to(a).as_posix() for p in a.rglob("*") if p.is_file()}
    fb = {p.relative_to(b).as_posix() for p in b.rglob("*") if p.is_file()}
    for f in sorted(fa - fb):
        out.append("only extracted: " + f)
    for f in sorted(fb - fa):
        out.append("only in reference: " + f)
    for f in sorted(fa & fb):
        if not filecmp.cmp(a / f, b / f, shallow=False):
            out.append("differs: " + f)
    return out


if __name__ == "__main__":
    sys.exit(main())
