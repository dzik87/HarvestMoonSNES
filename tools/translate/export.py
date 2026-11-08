#!/usr/bin/env python3
"""Translation worksheet: per dialog id the Japanese source text (primary), the US text (reference), the structure the translation must keep
and the current translation.  The worksheet contains game text from the user's own extraction, so it is written to the git-ignored build/translate/
and must never be committed.

  python tools/translate/export.py pl                      -> build/translate/pl_worksheet.txt  (all ids)
  python tools/translate/export.py pl --format tsv         -> build/translate/pl_worksheet.tsv  (spreadsheet; columns id bank status flags structure jp us translation)
  python tools/translate/export.py pl --bank B6 --status todo --out my.txt

Text worksheet: the same block syntax as translate/<lang>/dialogs.txt; lines starting with `;` are comments (Japanese/US reference, structure).
Write the translation below the comments and feed the file to `import.py`.  Blocks without a translation are ignored by the import.
"""
import argparse
import csv
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import analyze                                              # noqa: E402
import common as C                                          # noqa: E402

TSV_COLUMNS = ["id", "bank", "status", "flags", "structure", "jp", "us", "translation"]


def reference_flags(ctx, with_refs=True):
    """{id: set(flags)}: `diff` = the US dialog has another structure than the Japanese one, `num` = literal digits differ, `unref` = never referenced statically."""
    cmp_ = analyze.compare(ctx.root)
    flags = {i: set() for i in ctx.ids}
    for i in cmp_["us"]["vars_fields"] + cmp_["us"]["num_digits"] + cmp_["us"]["num_indices"] + cmp_["us"]["opt"]:
        flags[i].add("diff")
    for i in cmp_["us"]["literal_numbers"]:
        flags[i].add("num")
    if with_refs:
        refs, _ = analyze.scan_refs()
        used = set(r[3] for r in refs) | analyze.table_dialog_ids() | set(range(0x0F, 0x1A))
        for i in ctx.ids:
            if i not in used:
                flags[i].add("unref")
    return flags


def rows(lang, ctx, banks=None, statuses=None, with_refs=True):
    tr = C.load_translation(lang)
    st = C.read_status(lang.path_status)
    bank_of = C.asset_banks("us", ctx.root)
    flags = reference_flags(ctx, with_refs)
    out = []
    for i in ctx.ids:
        status = C.effective_status(i, i in tr, st)
        if (banks and bank_of[i] not in banks) or (statuses and status not in statuses):
            continue
        out.append({
            "id": i, "bank": bank_of[i], "status": status, "flags": " ".join(sorted(flags[i])),
            "structure": C.structure_line(ctx.ref[i]),
            "jp": C.render_reference(ctx.jp[i], "jp", ctx), "us": C.render_reference(ctx.us[i], "us", ctx),
            "translation": tr[i][1] if i in tr else "", "tflags": tr[i][0] if i in tr else set(),
        })
    return out


def write_txt(path, rs, lang):
    out = ["; Translation worksheet for `%s` - generated from your own ROM extraction, DO NOT COMMIT (build/translate is git-ignored)." % lang.code,
           "; Write the translation under the comment lines of a block; see docs/translation.md for the token and layout rules.", ""]
    for r in rs:
        out.append("@@ sDialog_0x%04X @@%s" % (r["id"], "".join(" " + f for f in sorted(r["tflags"]))))
        out.append("; status=%s bank=%s %s flags=%s" % (r["status"], r["bank"], r["structure"], r["flags"] or "-"))
        for tag in ("jp", "us"):
            for k, line in enumerate(r[tag].rstrip("\n").split("\n")):
                out.append("; %s%s %s" % (tag.upper(), ">" if k == 0 else " ", line))
        if r["translation"].strip():
            out.append(r["translation"].strip("\n"))
        out.append("")
    C.write_text(path, "\n".join(out), keep_eol=False)


def write_tsv(path, rs):
    with open(path, "w", encoding="utf-8", newline="") as f:
        w = csv.writer(f, delimiter="\t", lineterminator="\n", quoting=csv.QUOTE_MINIMAL)
        w.writerow(TSV_COLUMNS)
        for r in rs:
            w.writerow([("0x%04X" % r["id"]) if c == "id" else (r[c].replace("\n", "\\n") if isinstance(r[c], str) else r[c]) for c in TSV_COLUMNS])


def main(argv=None):
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("lang")
    ap.add_argument("--format", choices=("txt", "tsv"), default="txt")
    ap.add_argument("--bank", action="append", help="only this bank of the US dialogs (B6..BB); repeatable")
    ap.add_argument("--status", action="append", choices=C.STATUSES, help="only ids with this status; repeatable")
    ap.add_argument("--out")
    ap.add_argument("--no-refs", action="store_true", help="skip the (slow) scan of the sources for the `unref` flag")
    ap.add_argument("--translate-dir", "--assets", dest="assets", help="directory with the <region>/bank_*.txt dialogs of the four releases (default translate)")
    a = ap.parse_args(argv)
    if not C.have_assets("jp", a.assets):
        sys.exit("The extracted dialogs are missing: python tools/extract.py --rom-dir <your dumps> (docs/extraction.md)")
    lang = C.Lang(C.lang_dir(a.lang))
    ctx = C.Context(a.assets)
    rs = rows(lang, ctx, set(a.bank or []), set(a.status or []), not a.no_refs)
    out = Path(a.out) if a.out else C.WORK / ("%s_worksheet.%s" % (lang.code, a.format))
    out.parent.mkdir(parents=True, exist_ok=True)
    (write_txt(out, rs, lang) if a.format == "txt" else write_tsv(out, rs))
    print("wrote %s (%d dialogs)" % (out, len(rs)))
    return 0


if __name__ == "__main__":
    sys.exit(main())
