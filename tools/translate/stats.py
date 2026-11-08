#!/usr/bin/env python3
"""Progress of a translation per bank and status.

  python tools/translate/stats.py pl            table per US dialog bank: dialogs, todo / draft / reviewed, translated bytes vs US bytes
"""
import argparse
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import check                                                # noqa: E402
import common as C                                          # noqa: E402


def main(argv=None):
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("lang")
    ap.add_argument("--translate-dir", "--assets", dest="assets", help="directory with the <region>/dialogs.txt dialogs of the four releases (default translate)")
    a = ap.parse_args(argv)
    if not C.have_assets("jp", a.assets):
        sys.exit("The extracted dialogs are missing: python tools/extract.py --rom-dir <your dumps> (docs/extraction.md)")
    lang = C.Lang(C.lang_dir(a.lang))
    ctx = C.Context(a.assets)
    rep = check.check_lang(lang, ctx)
    st = C.read_status(lang.path_status)
    bank_of = C.asset_banks("us", ctx.root)
    rows = {}
    for i in ctx.ids:
        b = rows.setdefault(bank_of[i], {"n": 0, "todo": 0, "draft": 0, "reviewed": 0, "pl": 0, "us": 0})
        s = C.effective_status(i, i in rep.translated, st)
        b["n"] += 1; b[s] += 1
        if i in rep.translated:
            b["pl"] += rep.sizes[i]; b["us"] += len(ctx.us[i]) * 2
    print("%-5s %5s %5s %6s %8s %9s %10s %7s" % ("bank", "ids", "todo", "draft", "reviewed", "bytes", "US bytes", "ratio"))
    tot = {k: 0 for k in ("n", "todo", "draft", "reviewed", "pl", "us")}
    for b in sorted(rows):
        r = rows[b]
        for k in tot:
            tot[k] += r[k]
        print("%-5s %5d %5d %6d %8d %9d %10d %7s" % (b, r["n"], r["todo"], r["draft"], r["reviewed"], r["pl"], r["us"], "%.2f" % (r["pl"] / r["us"]) if r["us"] else "-"))
    print("%-5s %5d %5d %6d %8d %9d %10d %7s" % ("all", tot["n"], tot["todo"], tot["draft"], tot["reviewed"], tot["pl"], tot["us"], "%.2f" % (tot["pl"] / tot["us"]) if tot["us"] else "-"))
    return 0


if __name__ == "__main__":
    sys.exit(main())
