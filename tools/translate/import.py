#!/usr/bin/env python3
"""Worksheet -> translations/<lang>/dialogs.txt.  Validates every translated block (syntax, characters, tokens against the Japanese structure,
layout in the dialog box) before it is merged; blocks without a translation are ignored.

  python tools/translate/import.py pl build/translate/pl_worksheet.txt            (txt worksheet or a translation file in the same syntax)
  python tools/translate/import.py pl build/translate/pl_worksheet.tsv --status reviewed
  python tools/translate/import.py pl my_part.txt --skip-invalid                    import the valid blocks, list the others

Existing translations of the same ids are replaced.  The status of imported ids becomes `draft` (or --status) in translations/<lang>/status.csv unless
the id already has a status row (use --status to override).  Exit code 1 if blocks were invalid (nothing is written unless --skip-invalid).
"""
import argparse
import csv
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import common as C                                          # noqa: E402


def read_worksheet(path):
    """-> [(id, flags, text, status or None)]"""
    path = Path(path)
    if path.suffix.lower() == ".tsv":
        out = []
        with open(path, encoding="utf-8-sig", newline="") as f:
            for r in csv.DictReader(f, delimiter="\t"):
                t = (r.get("translation") or "").replace("\\n", "\n")
                if t.strip():
                    out.append((int(r["id"], 0), set(), t, r.get("status") or None))
        return out
    return [(i, f, t, None) for i, f, t in C.read_blocks(path) if t.strip()]


def import_blocks(lang, ctx, blocks, status=None, skip_invalid=False, out=print):
    """Validate `blocks`, merge into the language files.  -> (imported ids, invalid ids)."""
    good, bad = [], []
    for i, flags, text, st in blocks:
        r = C.check_entry(i, text, flags, lang, ctx)
        if r.errors:
            bad.append(i)
            for e in r.errors:
                out("0x%04X: ERROR %s" % (i, e))
        else:
            good.append((i, flags, text, st))
            for w in r.warnings:
                out("0x%04X: warning %s" % (i, w))
    if bad and not skip_invalid:
        out("%d invalid block(s); nothing imported (use --skip-invalid to import the valid ones)" % len(bad))
        return [], bad
    tr = C.load_translation(lang)
    stat = C.read_status(lang.path_status)
    for i, flags, text, st in good:
        tr[i] = (flags, text)
        want = status or st
        if want:
            if want not in C.STATUSES:
                raise SystemExit("unknown status %r" % want)
            stat.setdefault(i, {"translator": "", "note": ""})["status"] = want
        elif i not in stat:
            stat[i] = {"status": "draft", "translator": "", "note": ""}
    C.write_blocks(lang.path_dialogs, [(i, f, t) for i, (f, t) in tr.items()])
    C.write_status(lang.path_status, stat)
    return [g[0] for g in good], bad


def main(argv=None):
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("lang")
    ap.add_argument("file")
    ap.add_argument("--status", choices=C.STATUSES)
    ap.add_argument("--skip-invalid", action="store_true")
    ap.add_argument("--assets")
    a = ap.parse_args(argv)
    if not C.have_assets("jp", a.assets):
        sys.exit("The extracted dialogs are missing: python tools/extract.py --rom-dir <your dumps> (docs/extraction.md)")
    lang = C.Lang(C.lang_dir(a.lang))
    ctx = C.Context(a.assets)
    done, bad = import_blocks(lang, ctx, read_worksheet(a.file), a.status, a.skip_invalid)
    print("imported %d dialog(s), %d invalid" % (len(done), len(bad)))
    return 1 if bad else 0


if __name__ == "__main__":
    sys.exit(main())
