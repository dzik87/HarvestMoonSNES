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
    p.add_argument("--translation", metavar="LANG", help="build a translated ROM on the US engine (translations/LANG/, docs/translation.md); no original hash exists for it")
    p.add_argument("--fallback", choices=("us", "error"), default="us", help="translation: text of the ids that are not translated yet (default: the US text)")
    p.add_argument("--allow-errors", action="store_true", help="translation: build although the check reports errors")
    p.add_argument("--patch", choices=("bps", "ips", "both"), help="translation: also write a patch (original US ROM -> translated ROM) next to the output (tools/translate/make_patch.py); the distribution form")
    p.add_argument("--patch-source", metavar="ROM", help="translation: your original US ROM for --patch (default: $HM_ROM_US or $HM_ROM_DIR/US/*.sfc)")
    args = p.parse_args()
    if args.patch and not args.translation:
        sys.exit("--patch needs --translation")
    if args.translation and args.region != "US":
        sys.exit("--translation uses the US engine: build with --region US")
    if args.translation and args.out == ROOT / "build" / "HarvestMoon.sfc":
        args.out = ROOT / "build" / ("HarvestMoon_US_%s.sfc" % args.translation)

    check_assets()
    if not args.no_assets:
        sys.path.insert(0, str(ROOT / "tools"))
        import build_assets
        rc = build_assets.main(quiet=not args.verbose)
        if rc:
            return rc
    tr = None
    if args.translation:
        sys.path.insert(0, str(ROOT / "tools" / "translate"))
        import build as trbuild
        import common as trcommon
        tr = trcommon.Lang(trcommon.lang_dir(args.translation))
        summary = trbuild.generate(tr, trcommon.Context(), args.fallback, args.allow_errors)
    asar = find_asar(args.asar)
    out = args.out if args.out.is_absolute() else ROOT / args.out
    out.parent.mkdir(parents=True, exist_ok=True)
    out.write_bytes(bytes(ROM_SIZE))

    cmd = [asar]
    if args.verbose:
        cmd.append("-v")
    cmd += DEFINES[args.region]
    symfile = out.with_suffix(".sym")
    if tr:
        cmd += ["-DTRANSLATION=1", "--symbols=nocash", "--symbols-path=%s" % symfile]
    cmd += ["-werror", "--no-title-check", "--fix-checksum=off", MAIN[args.region], str(out)]
    print("+", " ".join(cmd))
    rc = subprocess.run(cmd, cwd=ROOT).returncode
    if rc != 0:
        print(f"asar failed (exit code {rc})", file=sys.stderr)
        return rc

    size = out.stat().st_size
    if size != ROM_SIZE:
        print(f"WARNING: ROM size = {size}, expected {ROM_SIZE}", file=sys.stderr)

    if tr:
        rom = bytearray(out.read_bytes())
        checksum, patched, info = trbuild.post_process(rom, tr, trbuild.ST.read_symbols(symfile))
        out.write_bytes(rom)
        print("\n[US engine + %s] TRANSLATION BUILD: %s, %d bytes, header checksum $%04X, font tables patched %s" % (tr.code, out.relative_to(ROOT) if out.is_relative_to(ROOT) else out, len(rom), checksum, patched))
        print("  strings: %s; name grid: %s" % (", ".join("%s %d slot(s)" % (t, len(sl)) for t, sl in info["strings"]) or "none", "%d rows" % info["grid_rows"] if info["grid_rows"] else "original"))
        print("  dialogs: %d of %d translated, %d from the US text, %d bytes in %d bank(s); %d check error(s), %d warning(s)"
              % (summary["translated"], summary["total"], summary["fallback"], summary["bytes"], len(summary["banks"]), summary["errors"], summary["warnings"]))
        if args.patch:
            import make_patch
            try:
                make_patch.patch_build(out, ("bps", "ips") if args.patch == "both" else (args.patch,), args.patch_source)
            except make_patch.PatchError as e:
                print("patch: %s" % e, file=sys.stderr)
                return 1
        return 0
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
