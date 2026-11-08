#!/usr/bin/env python3
"""Terminology consistency for a translation: translations/<lang>/glossary.csv (works for any language).

  python tools/translate/glossary.py check pl [--source us|jp] [--ids ...] [--json]    forbidden forms, missing preferred forms
  python tools/translate/glossary.py list pl                                           the glossary as loaded (terms, forms)
  python tools/translate/glossary.py names pl [--proper] [--json]                      variables / numbers used per id (ids only); --proper adds capitalised word candidates

glossary.csv (UTF-8, header required, `|` separates several values in a cell, `#` starts a comment line):

  term,preferred,forbidden,note
  <concept or source term>,<form>|<form>,<form>|<form>,<free note>

* `term`      the concept, usually the source language word (English for the US text).  Only a label unless `--source` is used.
* `preferred` the accepted target forms.  With `--source us|jp` the tool looks for `term` in the source text of each dialog (the extracted game text is read in memory
              only); a dialog whose source contains the term but whose translation contains none of the preferred forms gets a warning (`term-missing`).
* `forbidden` forms that must not occur in the translation (old spellings, wrong inflections, alternative names): an error (`term-forbidden`) with the number of hits.
* `note`      explanation for the translators; never evaluated.

A form is matched case-insensitively as a whole word.  `stem*` matches any word that starts with `stem` (inflected languages), `re:PATTERN` is a regular expression
on the plain text.  The plain text of a dialog is the translation without `<tokens>`; `<BR>`, `<NEXT>` and line ends count as a space, variables as the placeholder
`§` (so a name variable never matches a form).  Output names ids, terms and counts, not dialog text.
"""
import argparse
import csv
import io
import json
import re
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import check as CH                                          # noqa: E402
import common as C                                          # noqa: E402

PLACEHOLDER = "§"
TOKEN = re.compile(r"<[^<>\n]*>")
BREAKS = re.compile(r"<(?:BR|NEXT|END|POS \d+|OPTLBL \d+|OPT \d+)>", re.I)
WORD = re.compile(r"[^\W\d_]+(?:['’-][^\W\d_]+)*", re.UNICODE)


class Term:
    def __init__(self, term, preferred, forbidden, note):
        self.term, self.note = term, note
        self.preferred, self.forbidden = split_forms(preferred), split_forms(forbidden)
        self._pref = [compile_form(f) for f in self.preferred]
        self._forb = [compile_form(f) for f in self.forbidden]

    def count_forbidden(self, plain):
        return sum(len(rx.findall(plain)) for rx in self._forb)

    def has_preferred(self, plain):
        return any(rx.search(plain) for rx in self._pref)


def split_forms(cell):
    return [f.strip() for f in (cell or "").split("|") if f.strip()]


def compile_form(form):
    """one glossary form -> compiled regular expression"""
    if form.startswith("re:"):
        return re.compile(form[3:], re.I | re.U)
    stem = form.endswith("*")
    body = re.escape(form[:-1] if stem else form).replace(r"\ ", r"\s+")
    return re.compile(r"(?<![^\W\d_])" + body + (r"[^\W\d_]*" if stem else "") + r"(?![^\W\d_])", re.I | re.U)


def load_glossary(path):
    """glossary.csv -> [Term]; a missing file or a header-only file is an empty glossary.  Raises ValueError on a bad file."""
    p = Path(path)
    if not p.exists():
        return []
    text = p.read_text(encoding="utf-8-sig").replace("\r\n", "\n").replace("\r", "\n")
    rows = [l for l in text.split("\n") if l.strip() and not l.lstrip().startswith("#")]
    if not rows:
        return []
    rd = csv.DictReader(io.StringIO("\n".join(rows)))
    need = {"term", "preferred", "forbidden", "note"}
    if not need <= set(rd.fieldnames or []):
        raise ValueError("%s: header must be term,preferred,forbidden,note" % p)
    out, seen = [], set()
    for n, r in enumerate(rd, 2):
        t = (r["term"] or "").strip()
        if not t:
            raise ValueError("%s: row %d has no term" % (p, n))
        if t.lower() in seen:
            raise ValueError("%s: term %r appears twice" % (p, t))
        seen.add(t.lower())
        try:
            out.append(Term(t, r["preferred"], r["forbidden"], r["note"]))
        except re.error as e:
            raise ValueError("%s: row %d: bad pattern: %s" % (p, n, e))
        if not out[-1].preferred and not out[-1].forbidden:
            raise ValueError("%s: term %r has neither a preferred nor a forbidden form" % (p, t))
    return out


def plain_text(text):
    """translation text -> text for matching (no tokens)"""
    t = text.replace("\r", "")
    t = BREAKS.sub(" ", t)
    t = re.sub(r"<(?:VAR|NUM)[^<>]*>", PLACEHOLDER, t, flags=re.I)
    t = TOKEN.sub("", t)
    return re.sub(r"\s+", " ", t)


def source_plain(words, region):
    cm = C.dialog.load_charmap(region)
    return plain_text(C.dialog.words_to_text(words, cm))


def check_glossary(terms, blocks, sources=None, only=None):
    """-> list of CH.Issue.  blocks: {id: (flags, text)}; sources: {id: plain source text} for the preferred-form check."""
    issues = []
    for i in sorted(blocks):
        if only is not None and i not in only:
            continue
        plain = plain_text(blocks[i][1])
        for t in terms:
            n = t.count_forbidden(plain)
            if n:
                issues.append(CH.Issue(i, "error", "glossary term '%s': a forbidden form occurs %d time(s)" % (t.term, n), code="term-forbidden"))
            if sources is not None and t.preferred and i in sources:
                if re.search(r"(?<![^\W\d_])" + re.escape(t.term) + r"(?![^\W\d_])", sources[i], re.I | re.U) and not t.has_preferred(plain):
                    issues.append(CH.Issue(i, "warning", "glossary term '%s': the source uses it but no preferred form is in the translation" % t.term, code="term-missing"))
    return issues


def names_report(blocks, lang, vm, ndigits, proper=False):
    """-> ({variable field or 'num idx': [ids]}, {candidate word: [ids]})"""
    use, cand = {}, {}
    for i in sorted(blocks):
        flags, text = blocks[i]
        try:
            items = C.parse_text(text, lang, vm, ndigits, raw=(lang.layout == "raw") or ("raw" in flags))
        except C.SyntaxError_:
            continue
        for it in items:
            if it.kind == "var":
                key = "VAR " + (it.val[2] or "%d/%d" % (it.val[0], it.val[1]))
            elif it.kind == "num":
                key = "NUM %d (%d digits)" % (it.val[1], it.val[0])
            else:
                continue
            ids = use.setdefault(key, [])
            if not ids or ids[-1] != i:
                ids.append(i)
        if proper:
            plain = plain_text(text)
            for m in WORD.finditer(plain):
                w = m.group(0)
                before = plain[:m.start()].rstrip()
                if w[:1].isupper() and len(w) > 1 and before and before[-1] not in ".!?:…„\"" and not before.endswith(PLACEHOLDER + "."):
                    ids = cand.setdefault(w, [])
                    if not ids or ids[-1] != i:
                        ids.append(i)
    return use, cand


def compact(ids, limit=12):
    ids = sorted(ids)
    if len(ids) <= limit:
        return " ".join("0x%04X" % i for i in ids)
    return " ".join("0x%04X" % i for i in ids[:limit]) + " ... (%d)" % len(ids)


def main(argv=None):
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    sub = ap.add_subparsers(dest="cmd", required=True)
    for name in ("check", "list", "names"):
        p = sub.add_parser(name)
        p.add_argument("lang")
        p.add_argument("--glossary", help="glossary file (default translations/<lang>/glossary.csv)")
        p.add_argument("--assets")
        if name != "list":
            p.add_argument("--json", action="store_true")
        if name == "check":
            p.add_argument("--source", choices=("us", "jp"), help="also require the preferred forms where the source text contains the term")
            p.add_argument("--ids")
        if name == "names":
            p.add_argument("--all-nums", action="store_true", help="list every numeric variable with its ids")
            p.add_argument("--proper", action="store_true", help="also list capitalised mid-sentence words (candidates for proper nouns) with their ids")
    a = ap.parse_args(argv)
    lang = C.Lang(C.lang_dir(a.lang))
    gpath = Path(a.glossary) if a.glossary else lang.dir / "glossary.csv"
    try:
        terms = load_glossary(gpath)
    except ValueError as e:
        print("ERROR: %s" % e, file=sys.stderr)
        return 1
    blocks = C.load_translation(lang)
    if a.cmd == "list":
        for t in terms:
            print("%s: prefer [%s] forbid [%s]" % (t.term, ", ".join(t.preferred), ", ".join(t.forbidden)))
        print("%d term(s) in %s" % (len(terms), gpath))
        return 0
    have = C.have_assets("jp", a.assets)
    ctx = C.Context(a.assets) if have else None
    if a.cmd == "names":
        use, cand = names_report(blocks, lang, ctx.vm if ctx else C.VarMap(), ctx.ndigits if ctx else None, a.proper)
        if a.json:
            sys.stdout.buffer.write((json.dumps({"variables": {k: v for k, v in sorted(use.items())}, "candidates": dict(sorted(cand.items()))}, indent=1, ensure_ascii=False) + "\n").encode("utf-8"))
            return 0
        nums = sorted((k for k in use if k.startswith("NUM")), key=lambda k: int(k.split()[1]))
        for k in sorted(k for k in use if not k.startswith("NUM")):
            print("%-24s %4d dialog(s): %s" % (k, len(use[k]), compact(use[k])))
        if a.all_nums:
            for k in nums:
                print("%-24s %4d dialog(s): %s" % (k, len(use[k]), compact(use[k])))
        else:
            print("numeric variables: %d used in %d dialog(s) (--all-nums lists them)" % (len(nums), len({i for k in nums for i in use[k]})))
        if a.proper:
            for w in sorted(cand, key=lambda w: (-len(cand[w]), w)):
                print("%-24s %4d dialog(s): %s" % (w, len(cand[w]), compact(cand[w], 6)))
        return 0
    sources = None
    if a.source:
        if not have:
            sys.exit("--source needs the extracted assets (python tools/extract.py)")
        sources = {i: source_plain(w, a.source) for i, w in (ctx.us if a.source == "us" else ctx.jp).items()}
    only = None
    if a.ids:
        only = CH.parse_ids(a.ids)
    issues = check_glossary(terms, blocks, sources, only)
    if a.json:
        sys.stdout.buffer.write((json.dumps({"terms": len(terms), "issues": [x.to_dict() for x in issues]}, indent=1, ensure_ascii=False) + "\n").encode("utf-8"))
    else:
        for x in issues:
            print(x.format())
        print("glossary check %s: %d term(s), %d error(s), %d warning(s)" % (lang.code, len(terms), sum(x.severity == "error" for x in issues), sum(x.severity == "warning" for x in issues)))
    return 1 if any(x.severity == "error" for x in issues) else 0


if __name__ == "__main__":
    sys.exit(main())
