#!/usr/bin/env python3
"""Suggest line and page breaks for translated dialogs without changing a single word.

  python tools/translate/reflow.py pl --ids 0x0123,0x0200-0x0210       suggestions -> build/translate/pl_reflow.txt, summary (ids and counts only)
  python tools/translate/reflow.py pl --all --breaks free --fit us      free layout, report ids that need more screens than the US text
  python tools/translate/reflow.py pl --all --apply                     ALSO write the suggestions into translations/pl/dialogs.txt (only with this flag)
  python tools/translate/reflow.py --text "some text" --lang pl         one text from the command line / --stdin (fixtures, quick tests)

Nothing is ever written to the translation unless --apply is given; the tool is never run by the build or by another tool.

Engine rules (defs/translation/engine.json, docs/translation.md): 28 cells per line, 3 lines = 84 cells per screen, no wrapping in the engine, a screen that continues
with `<NEXT>` must leave cell 83 free (the third line then holds at most 27 cells), variables count with their full width, a word is never split.
The suggestion is the greedy fill of the words (one space between words); it is written with explicit `<BR>` at every line end and `<NEXT>` at every page end, so the
text is independent of the automatic layout and `check.py` / `preview.py` show exactly the same lines.  Whitespace between words is normalised to one space; the words,
variables, numbers and tokens are untouched (the tool verifies this and refuses to suggest anything else).

  --breaks keep    (default) the `<BR>` and `<NEXT>` that the translator wrote stay where they are; only the lines in between are filled and the pages that are too long are split
  --breaks pages   the `<NEXT>` stay, every `<BR>` is dropped (lines are filled freely)
  --breaks free    all `<BR>` and `<NEXT>` are dropped: the tool decides everything

Dialogs with `<OPT>`, `<OPTLBL>` or `<POS>` are laid out by hand (answer cells) and reported as "manual", never changed.
Ids that cannot fit are reported with the number of cells they are over: a word longer than a line (cells over 28), or more screens than --max-screens / --fit us
(cells beyond the budget).
"""
import argparse
import re
import sys
from datetime import datetime
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import common as C                                          # noqa: E402

W = 28


class Unit:
    """word (kind 'w', items, cells) | hard line break ('br') | hard page break ('next')"""
    __slots__ = ("kind", "items", "cells")

    def __init__(self, kind, items=(), cells=0):
        self.kind, self.items, self.cells = kind, list(items), cells


class Result:
    def __init__(self):
        self.text = None            # suggested text, None = nothing to suggest
        self.status = "ok"          # ok | changed | manual | error
        self.pages = 0
        self.over = 0               # cells over the budget / line width
        self.notes = []
        self.moved = 0              # words moved to the next page to free the marker cell


def item_text(it, lang):
    """source syntax of a parsed item"""
    if it.kind == "g":
        ch = lang.charmap.get(it.val)
        if ch is None or ch in "<>" or it.val == C.SPACE or len(ch) != 1:
            return "<%04X>" % it.val
        return ch
    if it.kind == "var":
        n, idx, fld = it.val
        return "<VAR %s>" % fld if fld else "<VAR %d %d>" % (n, idx)
    if it.kind == "num":
        return "<NUM %d %d>" % it.val
    raise ValueError(it.kind)


def units_of(items, breaks):
    """Items -> (units, has_end, manual_reason).  Spaces separate words; control tokens that the layout builds on are 'manual'."""
    units, cur, has_end = [], [], False

    def flush():
        if cur:
            units.append(Unit("w", cur, sum(i.cells for i in cur)))
            del cur[:]
    for it in items:
        if it.kind in ("g", "var", "num"):
            cur.append(it)
        elif it.kind == "sp":
            flush()
        elif it.kind == "br":
            flush()
            if breaks == "keep":
                units.append(Unit("br"))
            else:
                pass
        elif it.kind == "next":
            flush()
            if breaks in ("keep", "pages"):
                units.append(Unit("next"))
        elif it.kind == "end":
            flush()
            has_end = True
        else:
            return None, False, "<%s>" % it.kind.upper()
    flush()
    return units, has_end, None


def fill(units):
    """Greedy fill -> (pages, moved): pages = list of pages, a page = list of lines (3 at most), a line = list of word units.
    Trailing hard breaks are ignored.  When a page continues, the third line keeps cell 83 free (27 cells at most): trailing words move to the next page (`moved`)."""
    while units and units[-1].kind != "w":
        units = units[:-1]
    pages, lines, line = [], [], []
    moved = 0

    def push_page():
        nonlocal lines, line, moved
        if line:
            lines.append(line)
            line = []
        carry = []
        if len(lines) == 3:
            while lines[2] and line_cells(lines[2]) > W - 1:
                carry.insert(0, lines[2].pop())
                moved += 1
            if not lines[2]:
                lines.pop()
        if lines:
            pages.append(lines)
        lines = []
        for c in carry:
            place(c)

    def end_line():
        nonlocal line
        lines.append(line)
        line = []
        if len(lines) == 3:
            push_page()

    def place(u):
        if line and line_cells(line) + 1 + u.cells > W:
            end_line()
        line.append(u)

    for u in units:
        if u.kind == "w":
            place(u)
        elif u.kind == "br":
            end_line()
        else:
            push_page()
    if line:
        lines.append(line)
    if lines:
        pages.append(lines)
    return pages, moved


def line_cells(line):
    return sum(u.cells for u in line) + max(0, len(line) - 1)


def render(pages, lang, has_end):
    out = []
    for p, lines in enumerate(pages):
        for k, ln in enumerate(lines):
            txt = " ".join("".join(item_text(i, lang) for i in u.items) for u in ln)
            last_line = k == len(lines) - 1
            last_page = p == len(pages) - 1
            if last_line and last_page:
                out.append(txt)
            elif last_line:
                out.append(txt + "<NEXT>")
            else:
                out.append(txt + "<BR>")
    text = "\n".join(out)
    return text + "<END>" if has_end else text


def signature(items):
    """the content of a text without spaces and layout tokens: glyph ids, variables, numbers (to prove that only the layout changed)"""
    return [(i.kind, i.val) for i in items if i.kind in ("g", "var", "num")]


def reflow_text(text, lang, vm=None, ndigits=None, flags=(), breaks="keep", max_screens=None):
    """-> Result for one dialog text."""
    r = Result()
    raw = (lang.layout == "raw") or ("raw" in flags)
    if raw:
        r.status, r.notes = "manual", ["raw layout (cell by cell)"]
        return r
    try:
        items = C.parse_text(text, lang, vm, ndigits)
    except C.SyntaxError_ as e:
        r.status, r.notes = "error", [str(e)]
        return r
    units, has_end, manual = units_of(items, breaks)
    if manual:
        r.status, r.notes = "manual", ["contains %s" % manual]
        return r
    longest = max((u.cells for u in units if u.kind == "w"), default=0)
    if longest > W:
        r.status, r.over = "error", longest - W
        r.notes = ["a word of %d cells does not fit into a line (%d cells over)" % (longest, longest - W)]
        return r
    pages, r.moved = fill(units)
    r.pages = len(pages)
    new = render(pages, lang, has_end)
    # proof: the suggestion has the same words
    again = C.parse_text(new, lang, vm, ndigits)
    if signature(again) != signature(items):
        r.status, r.notes = "error", ["internal error: the suggestion would change the words"]
        return r
    lay = C.layout_items(again, lang, raw=False)
    if lay.errors:
        r.status, r.notes = "error", ["the suggestion does not satisfy the layout: " + lay.errors[0]]
        return r
    if max_screens is not None and r.pages > max_screens:
        r.over = sum(line_cells(ln) for pg in pages[max_screens:] for ln in pg)
        r.notes.append("needs %d screen(s), the budget is %d (%d cells beyond it)" % (r.pages, max_screens, r.over))
    r.text = new
    r.status = "ok" if _norm(new) == _norm(text) else "changed"
    return r


def _norm(t):
    return re.sub(r"\s+", " ", t.replace("\r", "")).strip()


# ---------------------------------------------------------------- applying to the translation file
def apply_to_file(path, new_texts):
    """Rewrite only the blocks in `new_texts` ({id: text}) in a translation source file; every other byte (other blocks, comments, line endings) is kept.
    The comment lines directly below a header stay.  -> number of blocks written"""
    p = Path(path)
    raw = p.read_bytes().decode("utf-8-sig")
    crlf = "\r\n" in raw
    lines = raw.replace("\r\n", "\n").split("\n")
    out, i, n, done = [], 0, len(lines), 0
    while i < n:
        m = C.HEAD.match(lines[i])
        out.append(lines[i])
        i += 1
        if not m:
            continue
        bid = int(m.group(1), 16)
        j = i
        while j < n and not C.HEAD.match(lines[j]):
            j += 1
        block = lines[i:j]
        if bid in new_texts:
            k = 0
            while k < len(block) and (block[k].startswith(";") or block[k].startswith("#")):
                k += 1
            tail = []
            e = len(block)
            while e > k and not block[e - 1].strip():
                e -= 1
            tail = block[e:]                                    # blank lines between blocks stay
            keep_comments = block[:k]
            block = keep_comments + new_texts[bid].split("\n") + tail
            done += 1
        out += block
        i = j
    data = "\n".join(out)
    if crlf:
        data = data.replace("\n", "\r\n")
    p.write_bytes(data.encode("utf-8"))
    return done


# ---------------------------------------------------------------- command line
def parse_ids(spec):
    out = set()
    for part in spec.split(","):
        part = part.strip()
        if part:
            a, _, b = part.partition("-")
            out.update(range(int(a, 0), int(b or a, 0) + 1))
    return sorted(out)


def main(argv=None):
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("lang", nargs="?")
    ap.add_argument("--lang", dest="lang_opt")
    sel = ap.add_mutually_exclusive_group()
    sel.add_argument("--ids")
    sel.add_argument("--range", nargs=2, metavar=("FIRST", "LAST"))
    sel.add_argument("--all", action="store_true")
    sel.add_argument("--text", help="reflow this text and print the suggestion (invented / test text)")
    sel.add_argument("--stdin", action="store_true", help="reflow the text read from standard input and print the suggestion")
    ap.add_argument("--breaks", choices=("keep", "pages", "free"), default="keep")
    ap.add_argument("--max-screens", type=int)
    ap.add_argument("--fit", choices=("us",), help="budget = number of screens of the US text of the same id (needs the extracted assets)")
    ap.add_argument("--only-changed", action="store_true", help="write only the dialogs whose layout would change")
    ap.add_argument("--out", help="suggestions file (default build/translate/<lang>_reflow.txt)")
    ap.add_argument("--apply", action="store_true", help="write the suggestions into the translation file (a backup copy goes to build/translate/backup/)")
    ap.add_argument("--assets")
    a = ap.parse_args(argv)
    code = a.lang_opt or a.lang
    if not code:
        ap.error("language code needed")
    lang = C.Lang(C.lang_dir(code))
    ctx = C.Context(a.assets) if C.have_assets("jp", a.assets) else None
    vm = ctx.vm if ctx else C.VarMap()
    nd = ctx.ndigits if ctx else None
    if a.text is not None or a.stdin:
        text = a.text if a.text is not None else sys.stdin.read()
        r = reflow_text(text, lang, vm, nd, breaks=a.breaks, max_screens=a.max_screens)
        if r.text is not None:
            sys.stdout.buffer.write((r.text + "\n").encode("utf-8"))
        for n in r.notes:
            print("note: " + n, file=sys.stderr)
        return 0 if r.status in ("ok", "changed") else 1
    blocks = C.load_translation(lang)
    if a.ids:
        want = [i for i in parse_ids(a.ids) if i in blocks]
    elif a.range:
        lo, hi = int(a.range[0], 0), int(a.range[1], 0)
        want = [i for i in sorted(blocks) if lo <= i <= hi]
    elif a.all:
        want = sorted(blocks)
    else:
        ap.error("choose --ids, --range, --all, --text or --stdin")
    budgets = {}
    if a.fit == "us":
        if ctx is None:
            sys.exit("--fit us needs the extracted assets (python tools/extract.py)")
        for i in want:
            budgets[i] = sum(1 for t in C.split_tokens(ctx.us[i]) if t[0] == "NEXT") + 1
    res = {}
    for i in want:
        flags, text = blocks[i]
        res[i] = reflow_text(text, lang, vm, nd, flags, a.breaks, budgets.get(i, a.max_screens))
    groups = {"ok": [], "changed": [], "manual": [], "error": []}
    for i, r in res.items():
        groups[r.status].append(i)
    over = [i for i, r in res.items() if r.over]
    write = {i: r.text for i, r in res.items() if r.text is not None and (r.status == "changed" or not a.only_changed)}
    out = Path(a.out) if a.out else C.WORK / ("%s_reflow.txt" % lang.code)
    out.parent.mkdir(parents=True, exist_ok=True)
    C.write_blocks(out, [(i, blocks[i][0], t) for i, t in write.items()])
    print("reflow %s (--breaks %s): %d dialog(s): %d unchanged, %d changed, %d manual (options/positions/raw), %d cannot be laid out"
          % (lang.code, a.breaks, len(want), len(groups["ok"]), len(groups["changed"]), len(groups["manual"]), len(groups["error"])))
    for i in groups["error"]:
        print("  0x%04X: cannot fit, %d cell(s) over" % (i, res[i].over) if res[i].over else "  0x%04X: error (see check.py)" % i)
    for i in over:
        if res[i].status != "error":
            print("  0x%04X: over the screen budget by %d cell(s)" % (i, res[i].over))
    print("suggestions for %d dialog(s): %s" % (len(write), out))
    if a.apply:
        sel = {i: t for i, t in write.items() if res[i].status == "changed"}
        if sel:
            bak = C.WORK / "backup" / ("%s_dialogs_%s.txt" % (lang.code, datetime.now().strftime("%Y%m%d_%H%M%S")))
            bak.parent.mkdir(parents=True, exist_ok=True)
            bak.write_bytes(lang.path_dialogs.read_bytes())
            n = apply_to_file(lang.path_dialogs, sel)
            print("applied: %d dialog(s) rewritten in %s (backup %s)" % (n, lang.path_dialogs, bak))
        else:
            print("applied: nothing to change")
    return 1 if groups["error"] else 0


if __name__ == "__main__":
    sys.exit(main())
