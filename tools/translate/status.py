#!/usr/bin/env python3
"""Status of the dialogs of a translation: translate/<lang>/status.csv (todo / draft / reviewed, translator, note).

  python tools/translate/status.py list pl [--status draft] [--bank B6] [--ids ...] [--json]    ids with their status (ids only, no text)
  python tools/translate/status.py set pl reviewed --ids 0x0100-0x01FF [--translator NAME] [--note TEXT] [--only-from draft] [--dry-run]
  python tools/translate/status.py set pl todo --all --only-from draft
  python tools/translate/status.py coverage pl [--json]       dialogs per bank (bank of the US text) and status, translated yes/no
  python tools/translate/status.py validate pl                unknown ids, invalid status values, `reviewed` ids that have no translation

An id that is not listed in status.csv is `draft` when it has a translation and `todo` otherwise.  `set` rewrites status.csv only (sorted by id, line endings of the
existing file are kept); it never touches dialogs.txt.  `--ids` takes `0x0123,0x0200-0x0210,291`; `--bank` and the per-bank coverage need the extracted assets
(python tools/extract.py), everything else works from the translation directory alone.
"""
import argparse
import json
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import common as C                                          # noqa: E402


def parse_ids(spec):
    out = set()
    for part in spec.split(","):
        part = part.strip()
        if part:
            a, _, b = part.partition("-")
            lo, hi = int(a, 0), int(b or a, 0)
            if hi < lo:
                raise ValueError("bad range %r" % part)
            out.update(range(lo, hi + 1))
    return out


def universe(lang, assets=None):
    """(all ids, {id: bank} or None).  Without the extracted assets the ids are those of the translation file and status.csv."""
    if C.have_assets("jp", assets):
        ids = sorted(C.asset_blocks("jp", assets))
        return ids, C.asset_banks("us", assets)
    tr = C.load_translation(lang)
    st = C.read_status(lang.path_status)
    return sorted(set(tr) | set(st)), None


def statuses(lang, ids):
    tr = C.load_translation(lang)
    st = C.read_status(lang.path_status)
    return {i: C.effective_status(i, i in tr, st) for i in ids}, tr, st


def select(a, ids, banks, stat):
    sel = list(ids)
    if getattr(a, "ids", None):
        want = parse_ids(a.ids)
        sel = [i for i in sel if i in want]
    if getattr(a, "bank", None):
        if banks is None:
            sys.exit("--bank needs the extracted assets (python tools/extract.py)")
        sel = [i for i in sel if banks[i] == a.bank.upper()]
    if getattr(a, "status", None):
        sel = [i for i in sel if stat[i] == a.status]
    return sel


def cmd_list(a, lang):
    ids, banks = universe(lang, a.assets)
    stat, tr, st = statuses(lang, ids)
    sel = select(a, ids, banks, stat)
    if a.json:
        sys.stdout.buffer.write((json.dumps([{"id": i, "status": stat[i], "translated": i in tr, "bank": banks[i] if banks else None,
                                              "translator": st.get(i, {}).get("translator", ""), "note": st.get(i, {}).get("note", "")} for i in sel], indent=1) + "\n").encode("utf-8"))
        return 0
    for i in sel:
        print("0x%04X %-8s%s%s" % (i, stat[i], "" if i in tr else " (no text)", " " + banks[i] if banks else ""))
    c = {s: sum(1 for i in sel if stat[i] == s) for s in C.STATUSES}
    print("%d id(s): %s" % (len(sel), ", ".join("%s %d" % (s, c[s]) for s in C.STATUSES)))
    return 0


def cmd_set(a, lang):
    if a.status_value not in C.STATUSES:
        sys.exit("status must be one of %s" % ", ".join(C.STATUSES))
    ids, banks = universe(lang, a.assets)
    stat, tr, st = statuses(lang, ids)
    if not (a.ids or a.all or a.bank):
        sys.exit("choose --ids, --bank or --all")
    a.status = a.only_from
    sel = select(a, ids, banks, stat)
    if a.status_value == "reviewed":
        no_text = [i for i in sel if i not in tr]
        if no_text:
            print("skipped %d id(s) without a translation (cannot be reviewed), first 0x%04X" % (len(no_text), no_text[0]))
            sel = [i for i in sel if i in tr]
    changed = 0
    for i in sel:
        cur = st.get(i)
        new = {"status": a.status_value, "translator": a.translator if a.translator is not None else (cur or {}).get("translator", ""),
               "note": a.note if a.note is not None else (cur or {}).get("note", "")}
        if cur != new and not (cur is None and stat[i] == a.status_value and not new["translator"] and not new["note"]):
            changed += 1
            st[i] = new
    print("%d id(s) selected, %d status entr%s changed to %s%s" % (len(sel), changed, "y" if changed == 1 else "ies", a.status_value, " (dry run)" if a.dry_run else ""))
    if changed and not a.dry_run:
        C.write_status(lang.path_status, st)
    return 0


def cmd_coverage(a, lang):
    ids, banks = universe(lang, a.assets)
    stat, tr, st = statuses(lang, ids)
    rows = {}
    for i in ids:
        r = rows.setdefault(banks[i] if banks else "all", {"ids": 0, "translated": 0, **{s: 0 for s in C.STATUSES}})
        r["ids"] += 1
        r["translated"] += i in tr
        r[stat[i]] += 1
    tot = {k: sum(r[k] for r in rows.values()) for k in ("ids", "translated") + C.STATUSES}
    if a.json:
        sys.stdout.buffer.write((json.dumps({"lang": lang.code, "banks": rows, "total": tot}, indent=1) + "\n").encode("utf-8"))
        return 0
    print("%-5s %5s %10s %5s %6s %8s %7s" % ("bank", "ids", "translated", "todo", "draft", "reviewed", "done"))
    for b in sorted(rows):
        r = rows[b]
        print("%-5s %5d %10d %5d %6d %8d %6.1f%%" % (b, r["ids"], r["translated"], r["todo"], r["draft"], r["reviewed"], 100.0 * r["reviewed"] / r["ids"] if r["ids"] else 0))
    print("%-5s %5d %10d %5d %6d %8d %6.1f%%" % ("all", tot["ids"], tot["translated"], tot["todo"], tot["draft"], tot["reviewed"], 100.0 * tot["reviewed"] / tot["ids"] if tot["ids"] else 0))
    return 0


def cmd_validate(a, lang):
    ids, _ = universe(lang, a.assets)
    known = set(ids)
    tr = C.load_translation(lang)
    p = lang.path_status
    problems = []
    if p.exists():
        import csv
        rows = [l for l in p.read_text(encoding="utf-8-sig").splitlines() if l.strip() and not l.startswith("#")]
        seen = set()
        for r in csv.DictReader(rows):
            try:
                i = int(r["id"], 0)
            except (TypeError, ValueError):
                problems.append("status.csv: bad id %r" % r.get("id"))
                continue
            if i in seen:
                problems.append("0x%04X: listed twice in status.csv" % i)
            seen.add(i)
            if i not in known:
                problems.append("0x%04X: id does not exist" % i)
            if (r.get("status") or "todo") not in C.STATUSES:
                problems.append("0x%04X: invalid status %r" % (i, r.get("status")))
            elif r.get("status") in ("draft", "reviewed") and i not in tr:
                problems.append("0x%04X: status %s but the id has no translation" % (i, r["status"]))
    for i in sorted(tr):
        if i not in known:
            problems.append("0x%04X: translated id does not exist in the game" % i)
    for m in problems:
        print("ERROR " + m)
    print("status check %s: %d problem(s)" % (lang.code, len(problems)))
    return 1 if problems else 0


def main(argv=None):
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    sub = ap.add_subparsers(dest="cmd", required=True)

    def common(p):
        p.add_argument("lang")
        p.add_argument("--assets")
        return p
    p = common(sub.add_parser("list")); p.add_argument("--status", choices=C.STATUSES); p.add_argument("--bank"); p.add_argument("--ids"); p.add_argument("--json", action="store_true"); p.set_defaults(f=cmd_list)
    p = common(sub.add_parser("set")); p.add_argument("status_value", metavar="STATUS"); p.add_argument("--ids"); p.add_argument("--bank"); p.add_argument("--all", action="store_true")
    p.add_argument("--only-from", choices=C.STATUSES, help="change only ids that currently have this status"); p.add_argument("--translator"); p.add_argument("--note"); p.add_argument("--dry-run", action="store_true"); p.set_defaults(f=cmd_set)
    p = common(sub.add_parser("coverage")); p.add_argument("--json", action="store_true"); p.set_defaults(f=cmd_coverage)
    p = common(sub.add_parser("validate")); p.set_defaults(f=cmd_validate)
    a = ap.parse_args(argv)
    return a.f(a, C.Lang(C.lang_dir(a.lang)))


if __name__ == "__main__":
    sys.exit(main())
