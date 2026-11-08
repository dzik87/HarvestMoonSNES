#!/usr/bin/env python3
"""Validate a translation (translations/<lang>/): syntax and characters, tokens against the Japanese structure (variables via the variable map,
numbers, answers), the layout in the dialog box (28 x 3 cells, `<NEXT>` marker cell, option cursor cells), bank capacity and coverage.

  python tools/translate/check.py pl                 errors (exit 1) and warnings of the translated ids, coverage, capacity
  python tools/translate/check.py pl --list todo     print the ids that are not translated
  python tools/translate/check.py pl --warnings-as-errors
  python tools/translate/check.py pl --ids 0x0123,0x0200-0x0210 | --range 0x100 0x1ff    check only these dialogs (the file level checks still run; --no-global skips them)
  python tools/translate/check.py pl --json          machine readable report (issues with id, severity, code, screen, line, cell; summary counts)
  python tools/translate/check.py pl --min-severity warning|error|info    what to print (info also lists the automatic page breaks)

Every message names its place when it has one: `0x0123 error layout-marker (screen 2, line 3, cell 83): ...`.  Screens, lines and cells count from 1 for
screen and line, from 0 for the cell index (the numbers of engine.json: cell 83 is the marker cell).  The summary lists the counts per severity and per code.

Needs the extracted assets (the Japanese structure and the US fallback text).  Rules: docs/translation.md, evidence: docs/translation-analysis.md.
"""
import argparse
import json
import re
import sys
from collections import Counter
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import common as C                                          # noqa: E402
import namegrid as NG                                       # noqa: E402
import strings as ST                                        # noqa: E402


SEVERITIES = ("info", "warning", "error")
CODES = [                                           # message pattern -> short code (stable names for --json and filters)
    (r"^unterminated|^unknown token|is not in the character map|^<OPTLBL", "syntax"),
    (r"does not exist \(the game has", "unknown-id"),
    (r"^the dialog has no text", "no-text"),
    (r"^missing variable", "var-missing"),
    (r"^variable <VAR .*does not exist|^optional variable", "var-extra"),
    (r"^numbers \(index", "numbers"),
    (r"^answers: <OPT", "answers"),
    (r"^answer \d+ has no text|holds text$", "answer-cell"),
    (r"blinking marker", "layout-marker"),
    (r"^a word of \d+ cells", "layout-word"),
    (r"^screen holds more|^more than \d+ cells", "layout-overflow"),
    (r"^<POS|^<BR>/<POS>", "layout-pos"),
    (r"^text after <END>", "layout-end"),
    (r"^capacity", "capacity"),
    (r"^glyph \$", "glyph-id"),
    (r"automatic page break", "autopage"),
]


def classify(msg):
    for rx, code in CODES:
        if re.search(rx, msg):
            return code
    return "other"


class Issue:
    """One diagnostic: dialog id (-1 = a file level message), severity, code, message and, when known, the place in the laid out text."""
    __slots__ = ("id", "severity", "code", "message", "screen", "line", "cell")

    def __init__(self, i, severity, message, pos=None, code=None):
        self.id, self.severity, self.message = i, severity, message
        self.code = code or classify(message)
        self.screen = self.line = self.cell = None
        if pos is not None:
            self.screen, self.cell = pos[0] + 1, pos[1]
            self.line = pos[1] // 28 + 1

    def where(self):
        return "" if self.screen is None else " (screen %d, line %d, cell %d)" % (self.screen, self.line, self.cell)

    def format(self):
        who = "0x%04X" % self.id if self.id >= 0 else "file"
        return "%-7s %s %s%s: %s" % (self.severity, who, self.code, self.where(), self.message)

    def to_dict(self):
        return {"id": self.id if self.id >= 0 else None, "severity": self.severity, "code": self.code, "message": self.message,
                "screen": self.screen, "line": self.line, "cell": self.cell}


class Report:
    def __init__(self):
        self.issues = []                             # Issue objects (all severities)
        self.errors, self.warnings = [], []          # (id, message)
        self.translated, self.sizes = {}, {}         # id -> flags ; id -> bytes of the laid out words
        self.words = {}                              # id -> words of the translated dialogs

    @property
    def ok(self):
        return not self.errors

    def add(self, i, severity, message, pos=None):
        self.issues.append(Issue(i, severity, message, pos))
        if severity == "error":
            self.errors.append((i, message))
        elif severity == "warning":
            self.warnings.append((i, message))


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


def check_lang(lang, ctx, only=None, global_checks=True, info=False):
    """Validate a language -> Report.  The translation file is parsed once and every dialog is checked once.
    only: a set of ids to check (default all); global_checks=False skips the file level checks (strings, name grid, glyph ids); info=True adds the info level notes."""
    rep = Report()
    if global_checks:
        errs, warns = ST.check_lang_strings(lang)
        for m in errs:
            rep.add(-1, "error", m)
        for m in warns:
            rep.add(-1, "warning", m)
        try:
            grows = NG.load_override(lang)
        except (OSError, ValueError) as e:
            grows = None
            rep.add(-1, "error", "grids: %s" % e)
        if grows is not None:
            errs, warns = NG.check_override(lang, grows)
            for m in errs:
                rep.add(-1, "error", m)
            for m in warns:
                rep.add(-1, "warning", m)
        for m in check_glyph_ids(lang, ctx):
            rep.add(-1, "error", m)
    try:
        tr = C.load_translation(lang)
    except C.SyntaxError_ as e:
        rep.add(-1, "error", str(e))
        return rep
    for i in sorted(tr):
        if only is not None and i not in only:
            continue
        flags, text = tr[i]
        r = C.check_entry(i, text, flags, lang, ctx)
        for e in r.errors:
            rep.add(i, "error", e, r.where.get(e))
        for w in r.warnings:
            rep.add(i, "warning", w, r.where.get(w))
        if info and r.layout is not None and r.layout.autopages:
            rep.add(i, "info", "%d automatic page break(s) inserted" % r.layout.autopages)
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


def parse_ids(spec):
    out = set()
    for part in spec.split(","):
        part = part.strip()
        if part:
            a, _, b = part.partition("-")
            out.update(range(int(a, 0), int(b or a, 0) + 1))
    return out


def main(argv=None):
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("lang")
    ap.add_argument("--list", choices=C.STATUSES, help="print the ids with this status")
    ap.add_argument("--warnings-as-errors", action="store_true")
    ap.add_argument("--assets")
    sel = ap.add_mutually_exclusive_group()
    sel.add_argument("--ids", help="check only these dialogs, e.g. 0x0123,0x0200-0x0210")
    sel.add_argument("--range", nargs=2, metavar=("FIRST", "LAST"), help="check only the ids FIRST..LAST")
    ap.add_argument("--no-global", action="store_true", help="skip the file level checks (strings, name grid, glyph ids) and the capacity")
    ap.add_argument("--json", action="store_true", help="print one JSON document (issues + summary) and nothing else")
    ap.add_argument("--min-severity", choices=SEVERITIES, default="warning", help="lowest severity to print (default warning; info adds notes such as automatic page breaks)")
    a = ap.parse_args(argv)
    if not C.have_assets("jp", a.assets):
        sys.exit("The extracted dialogs are missing: python tools/extract.py --rom-dir <your dumps> (docs/extraction.md)")
    lang = C.Lang(C.lang_dir(a.lang))
    ctx = C.Context(a.assets)
    only = parse_ids(a.ids) if a.ids else (set(range(int(a.range[0], 0), int(a.range[1], 0) + 1)) if a.range else None)
    rep = check_lang(lang, ctx, only, not a.no_global, info=a.min_severity == "info")
    st = C.read_status(lang.path_status)
    scope = [i for i in ctx.ids if only is None or i in only]
    counts = {s: 0 for s in C.STATUSES}
    for i in scope:
        counts[C.effective_status(i, i in rep.translated, st)] += 1
    capacity, cap_err = None, None
    if not a.no_global and only is None:
        try:
            _, used = bank_plan(final_sizes(lang, ctx, rep), ctx.ids, bank_list())
            capacity = {"bytes": sum(used.values()), "banks_used": len(used), "banks_available": len(bank_list()), "per_bank": used}
        except OverflowError as e:
            cap_err = str(e)
            rep.add(-1, "error", "capacity: %s" % e)
    nerr = sum(1 for x in rep.issues if x.severity == "error")
    nwarn = sum(1 for x in rep.issues if x.severity == "warning")
    bad = nerr > 0 or (a.warnings_as_errors and nwarn > 0)
    by_code = Counter((x.severity, x.code) for x in rep.issues)
    if a.json:
        doc = {"lang": lang.code, "checked": len(scope), "translated_valid": sum(1 for i in scope if i in rep.translated), "status": counts,
               "summary": {"errors": nerr, "warnings": nwarn, "infos": sum(1 for x in rep.issues if x.severity == "info"),
                           "by_code": {"%s:%s" % k: v for k, v in sorted(by_code.items())}}, "capacity": capacity,
               "issues": [x.to_dict() for x in rep.issues]}
        sys.stdout.buffer.write((json.dumps(doc, indent=1, ensure_ascii=False) + "\n").encode("utf-8"))
        return 1 if bad else 0
    floor = SEVERITIES.index(a.min_severity)
    for x in rep.issues:
        if SEVERITIES.index(x.severity) >= floor:
            print(x.format())
    print("coverage: %d of %d dialogs translated and valid (%s)" % (sum(1 for i in scope if i in rep.translated), len(scope), ", ".join("%s %d" % (s, counts[s]) for s in C.STATUSES)))
    if a.list:
        print("ids %s: %s" % (a.list, " ".join("0x%04X" % i for i in scope if C.effective_status(i, i in rep.translated, st) == a.list)))
    if capacity:
        print("capacity: %d bytes in %d bank(s) of %d available (%s)" % (capacity["bytes"], capacity["banks_used"], capacity["banks_available"], " ".join("%s=%d" % kv for kv in capacity["per_bank"].items())))
    if by_code:
        print("by code: " + ", ".join("%s %s=%d" % (s, c, n) for (s, c), n in sorted(by_code.items(), key=lambda kv: (-SEVERITIES.index(kv[0][0]), kv[0][1]))))
    print("translation check %s: %d error(s), %d warning(s)" % (lang.code, nerr, nwarn))
    return 1 if bad else 0


if __name__ == "__main__":
    sys.exit(main())
