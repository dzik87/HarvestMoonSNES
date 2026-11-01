#!/usr/bin/env python3
"""Validate a translation (translations/<lang>/): syntax and characters, tokens against the Japanese structure (variables via the variable map,
numbers, answers), the layout in the dialog box (28 x 3 cells, `<NEXT>` marker cell, option cursor cells), bank capacity and coverage.

  python tools/translate/check.py pl                 errors (exit 1) and warnings of the translated ids, coverage, capacity
  python tools/translate/check.py pl --list todo     print the ids that are not translated
  python tools/translate/check.py pl --warnings-as-errors

Needs the extracted assets (the Japanese structure and the US fallback text).  Rules: docs/translation.md, evidence: docs/translation-analysis.md.
"""
import argparse
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import common as C                                          # noqa: E402
import namegrid as NG                                       # noqa: E402
import strings as ST                                        # noqa: E402


class Report:
    def __init__(self):
        self.errors, self.warnings = [], []          # (id, message)
        self.translated, self.sizes = {}, {}         # id -> flags ; id -> bytes of the laid out words
        self.words = {}                              # id -> words of the translated dialogs

    @property
    def ok(self):
        return not self.errors


def check_glyph_ids(lang, ctx):
    """Glyph ids of the language must not be used by anything that stays in the ROM: the US dialogs (untranslated ids fall back to them) and every letter cell of the
    name entry grids that can be reached (a grid is reached only through a switch cell, namegrid.reachable_grids).  -> list of messages"""
    out = []
    ids = {g["id"]: ch for ch, g in lang.glyphs.items()}
    if not ids:
        return out
    used = {}
    for i, words in ctx.us.items():
        for t in C.split_tokens(words):
            if t[0] == "G" and t[1] in ids:
                used.setdefault(t[1], []).append(i)
    for gid, dl in sorted(used.items()):
        out.append("glyph $%02X (%s) is used by the US text of %d dialog(s) (first 0x%04X); the untranslated fallback would show the letter" % (gid, ids[gid], len(dl), dl[0]))
    try:
        base = NG.us_grids()
        rows = NG.load_override(lang)
    except (OSError, ValueError):
        return out
    after = dict(base)
    if rows is not None:
        after[NG.GRID_LABELS[0]] = rows
    for g, cell, gid in NG.collisions(lang, after):
        out.append("glyph $%02X (%s) is entered by cell %02X of the reachable name entry grid %d" % (gid, ids[gid], cell, g))
    return out


def check_lang(lang, ctx):
    rep = Report()
    errs, warns = ST.check_lang_strings(lang)
    rep.errors += [(-1, m) for m in errs]
    rep.warnings += [(-1, m) for m in warns]
    try:
        grows = NG.load_override(lang)
    except (OSError, ValueError) as e:
        grows = None
        rep.errors.append((-1, "grids: %s" % e))
    if grows is not None:
        errs, warns = NG.check_override(lang, grows)
        rep.errors += [(-1, m) for m in errs]
        rep.warnings += [(-1, m) for m in warns]
    rep.errors += [(-1, m) for m in check_glyph_ids(lang, ctx)]
    try:
        tr = C.load_translation(lang)
    except C.SyntaxError_ as e:
        rep.errors.append((-1, str(e)))
        return rep
    for i in sorted(tr):
        flags, text = tr[i]
        r = C.check_entry(i, text, flags, lang, ctx)
        rep.errors += [(i, e) for e in r.errors]
        rep.warnings += [(i, w) for w in r.warnings]
        if not r.errors:
            rep.translated[i] = flags
            rep.words[i] = r.layout.words
            rep.sizes[i] = r.nbytes
    return rep


def bank_plan(sizes_by_id, ids, banks, bank_size=0x8000):
    """Greedy packing in id order without splitting a dialog: -> ({id: bank}, {bank: bytes used}) or raises OverflowError."""
    where, used = {}, {}
    bi, cur = 0, 0
    for i in ids:
        n = sizes_by_id[i]
        if n > bank_size:
            raise OverflowError("dialog 0x%04X needs %d bytes, more than a bank" % (i, n))
        if cur + n > bank_size:
            bi += 1
            cur = 0
        if bi >= len(banks):
            raise OverflowError("the dialogs do not fit into %d banks" % len(banks))
        where[i] = banks[bi]
        cur += n
        used[banks[bi]] = cur
    return where, used


def bank_list():
    eng = C.engine()
    lo, hi = int(eng["dialog_bank_range"][0], 16), int(eng["dialog_bank_range"][1], 16)
    return ["%02X" % b for b in range(lo, hi + 1)] + list(eng["extra_free_banks"])


def final_sizes(lang, ctx, rep, fallback="us"):
    """bytes of every id of the finished ROM: translated words, else the US words (fallback)"""
    out = {}
    for i in ctx.ids:
        if i in rep.words:
            out[i] = len(rep.words[i]) * 2
        elif fallback == "us":
            out[i] = len(ctx.us[i]) * 2
    return out


def main(argv=None):
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("lang")
    ap.add_argument("--list", choices=C.STATUSES, help="print the ids with this status")
    ap.add_argument("--warnings-as-errors", action="store_true")
    ap.add_argument("--assets")
    a = ap.parse_args(argv)
    if not C.have_assets("jp", a.assets):
        sys.exit("The extracted dialogs are missing: python tools/extract.py --rom-dir <your dumps> (docs/extraction.md)")
    lang = C.Lang(C.lang_dir(a.lang))
    ctx = C.Context(a.assets)
    rep = check_lang(lang, ctx)
    for i, m in rep.errors:
        print("ERROR   %s %s" % ("0x%04X:" % i if i >= 0 else "file:", m))
    for i, m in rep.warnings:
        print("warning %s %s" % ("0x%04X:" % i if i >= 0 else "file:", m))
    st = C.read_status(lang.path_status)
    total = len(ctx.ids)
    counts = {s: 0 for s in C.STATUSES}
    for i in ctx.ids:
        counts[C.effective_status(i, i in rep.translated, st)] += 1
    print("coverage: %d of %d dialogs translated and valid (%s)" % (len(rep.translated), total, ", ".join("%s %d" % (s, counts[s]) for s in C.STATUSES)))
    if a.list:
        print("ids %s: %s" % (a.list, " ".join("0x%04X" % i for i in ctx.ids if C.effective_status(i, i in rep.translated, st) == a.list)))
    try:
        _, used = bank_plan(final_sizes(lang, ctx, rep), ctx.ids, bank_list())
        print("capacity: %d bytes in %d bank(s) of %d available (%s)" % (sum(used.values()), len(used), len(bank_list()), " ".join("%s=%d" % kv for kv in used.items())))
    except OverflowError as e:
        rep.errors.append((-1, "capacity: %s" % e))
        print("ERROR   capacity: %s" % e)
    bad = bool(rep.errors) or (a.warnings_as_errors and bool(rep.warnings))
    print("translation check %s: %d error(s), %d warning(s)" % (lang.code, len(rep.errors), len(rep.warnings)))
    return 1 if bad else 0


if __name__ == "__main__":
    sys.exit(main())
