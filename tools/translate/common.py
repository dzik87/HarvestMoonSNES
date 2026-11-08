#!/usr/bin/env python3
"""Shared code of the translation tools (tools/translate/*, docs/translation.md).

Reads the extracted dialog texts of the four releases (translate/<region>/dialogs.txt, produced by tools/extract.py), the engine rules
(defs/translation/engine.json), the variable map (defs/translation/var_map_jp_us.json) and a language directory
(translate/<lang>/), and implements

  * the translation source syntax (tokens, symbolic variable names) and its text -> dialog word conversion,
  * the text layout of the dialog box (cells, lines, screens, option cursors; evidence in docs/translation-analysis.md),
  * the structural reference taken from the Japanese dialogs (which variables / numbers / answers a dialog must contain).

Nothing in this module (or in the files it reads from git) contains game text.
"""
import json
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
DEFS = ROOT / "defs" / "translation"
TRANSLATIONS = ROOT / "translate"                 # one directory per language: the four releases (us eu de jp) and the translations
ASSETS_DIALOGS = TRANSLATIONS                       # the extracted dialogs of a release are translate/<region>/dialogs.txt
WORK = ROOT / "build" / "translate"

NEXT, NUMV, TEXTV, OPTS, END = 0x00A2, 0xFFFC, 0xFFFD, 0xFFFE, 0xFFFF
SPACE = 0x00B1


sys.path.insert(0, str(Path(__file__).resolve().parent))
import dialog                                                       # noqa: E402
import glyphmap                                                     # noqa: E402


def _console_safe():
    """Windows consoles (cp1250 / cp852 / cp437) cannot print every character: replace instead of raising UnicodeEncodeError (the encoding itself is kept)."""
    for stream in (sys.stdout, sys.stderr):
        try:
            stream.reconfigure(errors="replace")
        except (AttributeError, ValueError):
            pass


_console_safe()


def read_text(path):
    """UTF-8 text of a translation file: a BOM (Notepad) is dropped, CRLF / CR line ends become LF."""
    return Path(path).read_bytes().decode("utf-8-sig").replace("\r\n", "\n").replace("\r", "\n")


def write_text(path, text, keep_eol=True):
    """Write UTF-8 without BOM.  Line ends stay CRLF when the existing file uses them (keep_eol), LF otherwise: a file that the translator edits on Windows is not converted."""
    p = Path(path)
    crlf = keep_eol and p.exists() and b"\r\n" in p.read_bytes()
    p.parent.mkdir(parents=True, exist_ok=True)
    p.write_bytes((text.replace("\n", "\r\n") if crlf else text).encode("utf-8"))


def read_json(path):
    return json.loads(read_text(path))


def engine():
    return read_json(DEFS / "engine.json")


def var_map():
    return read_json(DEFS / "var_map_jp_us.json")


# ---------------------------------------------------------------- language directory
class Lang:
    """translate/<code>/lang.json plus the character map of the language (its glyph map, translate/<code>/glyphs/glyph_map.json).

    `charmap`  glyph id -> character (every character of the glyph map)
    `glyphs`   character -> {"id": glyph id} for the letters that the language adds to (or changes in) the font of its engine release
    A language without a glyph folder uses the glyph map of its engine release unchanged."""

    def __init__(self, directory):
        self.dir = Path(directory)
        self.cfg = read_json(self.dir / "lang.json")
        self.code = self.cfg["code"]
        self.engine_region = self.cfg.get("engine_region", "us")
        self.layout = self.cfg.get("layout", "wrap")
        self.autopage = bool(self.cfg.get("autopage", True))
        self.strings = self.cfg.get("strings", {})      # table -> {key: text}  (tools/translate/strings.py)
        engine_doc = glyphmap.read(lang_dir(self.engine_region))
        self.has_glyphs = glyphmap.has_map(self.dir)
        doc = glyphmap.read(self.dir) if self.has_glyphs else engine_doc
        self.glyph_doc = doc
        self.charmap = dict(glyphmap.charmap(doc))
        if self.has_glyphs:
            for m in glyphmap.collisions(doc, engine_doc):
                raise ValueError("%s: %s" % (self.code, m))
        eng = glyphmap.charmap(engine_doc)
        self.glyphs = {ch: {"id": gid} for gid, ch in self.charmap.items() if eng.get(gid) != ch}

    @property
    def glyph_dir(self):
        return glyphmap.glyph_dir(self.dir)

    @property
    def path_dialogs(self):
        return self.dir / self.cfg.get("text", "dialogs.txt")

    @property
    def path_status(self):
        return self.dir / self.cfg.get("status", "status.csv")

    @property
    def path_text_tables(self):
        return self.dir / self.cfg.get("text_tables", "text_tables.json")

    @property
    def path_text_vars(self):
        p = self.dir / self.cfg.get("text_vars", "text_vars.csv")
        return p if p.is_file() else lang_dir(self.engine_region) / "text_vars.csv"       # folders outside translate/ (test fixtures) use their engine release's table

    @property
    def path_number_vars(self):
        p = (self.dir / self.cfg.get("number_vars", "../number_vars.csv")).resolve()
        return p if p.is_file() else TRANSLATIONS / "number_vars.csv"       # a language outside translate/ (test fixtures) uses the shared file

    def text_tables(self):
        """translate/<lang>/text_tables.json (option_vram, dialog_banks); a language without the file uses the one of its engine release."""
        p = self.path_text_tables
        return read_json(p if p.is_file() else lang_dir(self.engine_region) / "text_tables.json")

    def dialog_banks(self):
        """ROM banks the packer of a translation may fill with dialogs, in order.  text_tables.json "dialog_banks": a list of bank names,
        or "auto" / missing = defs/translation/engine.json (dialog_bank_range + extra_free_banks)."""
        v = self.text_tables().get("dialog_banks", "auto")
        if isinstance(v, list):
            return [str(b).upper() for b in v]
        eng = engine()
        lo, hi = int(eng["dialog_bank_range"][0], 16), int(eng["dialog_bank_range"][1], 16)
        return ["%02X" % b for b in range(lo, hi + 1)] + list(eng["extra_free_banks"])


def lang_dir(code_or_path):
    return glyphmap.lang_dir(code_or_path)


# ---------------------------------------------------------------- dialog assets
def asset_blocks(region, root=None):
    """{id: words} of the extracted dialogs of a release (translate/<region>/dialogs.txt)."""
    root = Path(root) if root else ASSETS_DIALOGS
    f = dialog.dialogs_file(region, root)
    if not f.is_file():
        return {}
    cm = dialog.load_charmap(region)
    return {int(label.rsplit("_0x", 1)[1], 16): dialog.text_to_words(text, cm) for label, text in dialog.read_txt(f)}


def have_assets(region="us", root=None):
    root = Path(root) if root else ASSETS_DIALOGS
    return dialog.dialogs_file(region, root).is_file()


def split_tokens(words):
    """words -> list of tokens ('G', glyph) | ('NEXT',) | ('END',) | ('OPT', n) | ('NUM', digits, idx) | ('VAR', n, idx)."""
    out, i = [], 0
    while i < len(words):
        w = words[i]
        i += 1
        if w == NEXT:
            out.append(("NEXT",))
        elif w == END:
            out.append(("END",))
        elif w == OPTS:
            out.append(("OPT", words[i])); i += 1
        elif w == NUMV:
            out.append(("NUM", words[i], words[i + 1])); i += 2
        elif w == TEXTV:
            out.append(("VAR", words[i], words[i + 1])); i += 2
        else:
            out.append(("G", w))
    return out


# ---------------------------------------------------------------- variable map
class VarMap:
    """Semantic variable fields (defs/translation/var_map_jp_us.json)."""

    def __init__(self, data=None):
        self.d = data or var_map()
        self.fields = self.d["fields"]
        self.table = {r: {int(k): v for k, v in t.items()} for r, t in self.d["tables"].items()}
        self.size = {r: {int(k): v for k, v in t.items()} for r, t in self.d["sizes"].items()}
        self.canonical = self.d["canonical_us"]

    def field(self, region, idx):
        return self.table[region].get(idx)

    def us_token(self, field):
        """(chars, index) of a field on the US engine, as used by the original dialogs: <VAR chars index>."""
        idx = self.canonical[field]
        return self.size["us"][idx] // 2, idx


# ---------------------------------------------------------------- numeric variables
def number_digits(root=None, region="us"):
    """{numeric variable index: digit count used by the dialogs of the release} (one count per index)."""
    out = {}
    for words in asset_blocks(region, root).values():
        for t in split_tokens(words):
            if t[0] == "NUM":
                out.setdefault(t[2], t[1])
    return out


# ---------------------------------------------------------------- structural reference (from the Japanese dialogs)
class Reference:
    """Per dialog id the structure the translation has to keep, taken from the Japanese dialogs and mapped to the US engine:
    {"vars": sorted list of fields, "nums": sorted list of (numeric variable index, digits), "opt": answers or 0}."""

    def __init__(self, jp_blocks, varmap):
        self.vm = varmap
        self.data = {}
        for i, words in jp_blocks.items():
            vars_, nums, opt = [], [], 0
            for t in split_tokens(words):
                if t[0] == "VAR":
                    vars_.append(varmap.field("jp", t[2]))
                elif t[0] == "NUM":
                    nums.append((t[2], t[1]))
                elif t[0] == "OPT":
                    opt = t[1]
            self.data[i] = {"vars": sorted(vars_), "nums": sorted(nums), "opt": opt}

    def __contains__(self, i):
        return i in self.data

    def __getitem__(self, i):
        return self.data[i]


# ---------------------------------------------------------------- translation source syntax
HEAD = re.compile(r"^@@ sDialog_0x([0-9A-Fa-f]{4}) @@(?:\s+(.*?))?\s*$")
TOKEN = re.compile(r"<([^<>\n]*)>")
HEX4 = re.compile(r"^[0-9A-Fa-f]{4}$")


class SyntaxError_(ValueError):
    pass


def read_blocks(path):
    """translation source -> [(id, flags:set, text)] (file order).  Header: `@@ sDialog_0xNNNN @@ [flag ...]`."""
    blocks, cur, buf = [], None, []
    for n, line in enumerate(read_text(path).split("\n"), 1):
        m = HEAD.match(line)
        if m:
            if cur is not None:
                blocks.append((cur[0], cur[1], "\n".join(buf)))
            cur = (int(m.group(1), 16), set((m.group(2) or "").split())); buf = []
        elif cur is not None:
            if line.startswith(";") or line.startswith("#"):          # comment lines
                continue
            buf.append(line)
        elif line.strip() and not line.startswith(";") and not line.startswith("#"):
            raise SyntaxError_("%s:%d: text outside of a dialog block" % (path, n))
    if cur is not None:
        blocks.append((cur[0], cur[1], "\n".join(buf)))
    return blocks


def write_blocks(path, blocks):
    """[(id, flags, text)] -> file in the translation source syntax (sorted by id)."""
    out = []
    for i, flags, text in sorted(blocks, key=lambda b: b[0]):
        head = "@@ sDialog_0x%04X @@" % i + ("".join(" " + f for f in sorted(flags)))
        out.append(head + "\n" + text.strip("\n") + "\n")
    write_text(path, "\n".join(out))


class Item:
    """A parsed element of a translation text."""
    __slots__ = ("kind", "val", "cells")

    def __init__(self, kind, val=None, cells=0):
        self.kind, self.val, self.cells = kind, val, cells

    def __repr__(self):
        return "Item(%s,%r,%d)" % (self.kind, self.val, self.cells)


def parse_text(text, lang, vm=None, ndigits=None, raw=False):
    """Translation text -> list of Item.  kinds: 'g' glyph (val = glyph id), 'sp' space, 'var' (val = (chars, index, field)),
    'num' (val = (digits, index)), 'next', 'end', 'opt' (val = n), 'br', 'pos' (val = cell), 'optlbl' (val = answer 1..5).
    A newline is ignored in raw mode and acts as a space otherwise (except directly after a control token)."""
    rev = {c: k for k, c in lang.charmap.items() if c not in "<>"}
    eng = engine()
    items, pos = [], 0
    text = text.replace("\r", "")
    after_ctrl = True
    while pos < len(text):
        ch = text[pos]
        if ch == "\n":
            pos += 1
            if not raw and not after_ctrl:
                items.append(Item("sp", SPACE, 1))
                after_ctrl = True
            continue
        if ch == "<":
            m = TOKEN.match(text, pos)
            if not m:
                raise SyntaxError_("unterminated '<' near %r" % text[pos:pos + 16])
            body = m.group(1).strip()
            pos = m.end()
            parts = body.split()
            head = parts[0].upper() if parts else ""
            if HEX4.match(body):
                gid = int(body, 16)
                items.append(Item("g", gid, 1)); after_ctrl = False
            elif head == "NEXT" and len(parts) == 1:
                items.append(Item("next")); after_ctrl = True
            elif head == "END" and len(parts) == 1:
                items.append(Item("end")); after_ctrl = True
            elif head == "BR" and len(parts) == 1:
                items.append(Item("br")); after_ctrl = True
            elif head == "OPT" and len(parts) == 2 and parts[1].isdigit():
                items.append(Item("opt", int(parts[1]))); after_ctrl = True
            elif head == "POS" and len(parts) == 2 and parts[1].isdigit():
                items.append(Item("pos", int(parts[1]))); after_ctrl = True
            elif head == "OPTLBL" and len(parts) == 2 and parts[1].isdigit():
                k = int(parts[1])
                cur = eng["option_cursor_cells"][lang.engine_region]
                if not 1 <= k <= len(cur):
                    raise SyntaxError_("<OPTLBL %d>: answers are 1..%d" % (k, len(cur)))
                items.append(Item("pos", cur[k - 1] + 1)); after_ctrl = True
            elif head == "NUM" and len(parts) in (2, 3) and all(p.isdigit() for p in parts[1:]):
                if len(parts) == 3:
                    n, idx = int(parts[1]), int(parts[2])
                else:
                    idx = int(parts[1])
                    if ndigits is None or idx not in ndigits:
                        raise SyntaxError_("<NUM %d>: digit count unknown, write <NUM digits %d>" % (idx, idx))
                    n = ndigits[idx]
                items.append(Item("num", (n, idx), n)); after_ctrl = False
            elif head == "VAR" and len(parts) == 3 and all(p.isdigit() for p in parts[1:]):
                n, idx = int(parts[1]), int(parts[2])
                fld = vm.field("us", idx) if vm else None
                items.append(Item("var", (n, idx, fld), n)); after_ctrl = False
            elif head == "VAR" and len(parts) == 2 and vm and parts[1].lower() in vm.fields:
                fld = parts[1].lower()
                n, idx = vm.us_token(fld)
                items.append(Item("var", (n, idx, fld), n)); after_ctrl = False
            else:
                raise SyntaxError_("unknown token <%s>" % body)
            continue
        if ch == " ":
            items.append(Item("sp", SPACE, 1)); pos += 1; after_ctrl = False
            continue
        if ch not in rev:
            raise SyntaxError_("character %r (U+%04X) is not in the character map of %s" % (ch, ord(ch), lang.code))
        items.append(Item("g", rev[ch], 1)); pos += 1; after_ctrl = False
    return items


# ---------------------------------------------------------------- layout
class Layout:
    """Result of laying out a dialog: words, screens (list of cells), warnings/errors."""

    def __init__(self):
        self.words = []
        self.screens = []           # per screen: number of cells used (index of the last used cell + 1)
        self.cells = []             # per screen: content of the cells (glyph id; "v" = text variable cell, "n" = number digit cell)
        self.errors = []
        self.error_pos = []         # per error: (screen index, cell index) where the layout stopped being valid
        self.notes = []
        self.autopages = 0


def _word_cells(items, i):
    """Index range of the unbreakable word starting at items[i] (glyphs, variables, numbers) and its cell count."""
    j, n = i, 0
    while j < len(items) and items[j].kind in ("g", "var", "num"):
        n += items[j].cells
        j += 1
    return j, n


def _emit(words, it):
    if it.kind == "g":
        words.append(it.val)
    elif it.kind == "var":
        words += [TEXTV, it.val[0], it.val[1]]
    elif it.kind == "num":
        words += [NUMV, it.val[0], it.val[1]]


def layout_items(items, lang, raw=None):
    """Items -> Layout.  `raw` (default: lang.layout == 'raw') keeps the cells as written; otherwise words are wrapped at the line width,
    explicit <BR>/<POS n> are honoured and, if lang.autopage, <NEXT> is inserted when a screen is full.
    A screen that ends with <NEXT> must leave the last cell free (the blinking marker is drawn there)."""
    eng = engine()
    W, H = eng["cells_per_line"], eng["lines_per_screen"]
    cap = W * H
    marker = eng["next_screen_marker_cell"]
    raw = (lang.layout == "raw") if raw is None else raw
    L = Layout()
    cur = []                       # cells of the current screen

    def err(msg, cell=None):
        """error + its position (screen index, cell index of the screen) for the precise diagnostics of check.py"""
        L.errors.append(msg)
        L.error_pos.append((len(L.screens), len(cur) if cell is None else cell))

    def close_screen():
        L.screens.append(len(cur))
        L.cells.append(list(cur))
        del cur[:]

    def put(it):
        _emit(L.words, it)
        if it.kind == "g":
            cur.append(it.val)
        else:
            cur.extend(["v" if it.kind == "var" else "n"] * it.cells)

    def pad_to(target):
        while len(cur) < target:
            L.words.append(SPACE); cur.append(SPACE)

    def page(why):
        """close the screen with <NEXT>"""
        while cur and cur[-1] == SPACE and (not raw) and L.words and L.words[-1] == SPACE:     # trailing blanks are useless before <NEXT>
            cur.pop(); L.words.pop()
        eff = len(cur)
        while eff and cur[eff - 1] == SPACE:
            eff -= 1
        if eff > marker:
            err("a screen that continues with <NEXT> uses cell %d, which holds the blinking marker (%s)" % (marker, why), marker)
        L.words.append(NEXT)
        close_screen()

    def more_follows(j):
        return any(x.kind in ("g", "var", "num") for x in items[j:])

    i, n = 0, len(items)
    ended = False
    last_br = -1
    while i < n:
        it = items[i]
        k = it.kind
        if ended:
            err("text after <END>/<OPT>")
            break
        if k == "next":
            page("explicit <NEXT>")
            i += 1
            continue
        if k in ("end", "opt"):
            L.words.append(END if k == "end" else OPTS)
            if k == "opt":
                L.words.append(it.val)
            close_screen()
            ended = True
            i += 1
            continue
        if raw:
            if k in ("g", "var", "num", "sp"):
                put(Item("g", SPACE, 1) if k == "sp" else it)
                if len(cur) > cap and not any("screen holds" in e for e in L.errors):
                    err("screen holds more than %d cells (the dialog box shows %d)" % (cap, cap))
            else:
                err("<BR>/<POS> need the wrap layout (raw text is written cell by cell)")
            i += 1
            continue
        # ---- wrap layout
        if k == "br":
            if len(cur) % W != 0 or not cur or last_br == len(cur):      # a second <BR> in a row leaves an empty line
                pad_to((len(cur) // W + 1) * W)
            last_br = len(cur)
            i += 1
            continue
        if k == "pos":
            if it.val < len(cur) or it.val >= cap:
                err("<POS %d> is %s" % (it.val, "behind the text already written (cell %d)" % len(cur) if it.val < len(cur) else "outside the box"))
            else:
                pad_to(it.val)
            i += 1
            continue
        if k == "sp":
            j = i
            while j < n and items[j].kind == "sp":
                j += 1
            if len(cur) % W != 0:                                  # spaces at a line start (or pending wrap) are dropped
                pad_to(len(cur) + min(j - i, W - len(cur) % W))
            i = j
            continue
        # a word: glyphs, variables and numbers up to the next space / token
        j, wl = _word_cells(items, i)
        if wl > W:
            err("a word of %d cells does not fit into a line of %d" % (wl, W))
        if len(cur) % W != 0 and len(cur) % W + wl > W:        # does not fit into the rest of the line: next line
            pad_to((len(cur) // W + 1) * W)
        end = len(cur) + wl
        if end > cap or (end > marker and more_follows(j)):
            if not lang.autopage:
                err("more than %d cells on a screen (set autopage or add <NEXT>)" % cap)
            else:
                page("automatic page break"); L.autopages += 1
        for it2 in items[i:j]:
            put(it2)
        i = j
    if not ended:
        L.words.append(END)
        close_screen()
    return L


def build_words(text, lang, vm=None, ndigits=None, raw=None, flags=()):
    """Translation text -> (Layout, items).  The block flag `raw` forces cell-by-cell text."""
    r = (lang.layout == "raw") or ("raw" in flags) if raw is None else raw
    items = parse_text(text, lang, vm, ndigits, raw=r)
    return layout_items(items, lang, raw=r), items


def items_signature(items):
    """Structure of a parsed translation: fields of the variables, numeric indices, answers."""
    vars_ = sorted(it.val[2] or ("idx%d" % it.val[1]) for it in items if it.kind == "var")
    nums = sorted(it.val[1] for it in items if it.kind == "num")
    opt = next((it.val for it in items if it.kind == "opt"), 0)
    return {"vars": vars_, "nums": nums, "opt": opt}


# ---------------------------------------------------------------- status file
STATUSES = ("todo", "draft", "reviewed")


def read_status(path):
    """status.csv -> {id: {"status", "translator", "note"}}.  Columns: id,status,translator,note (id as 0xNNNN or decimal)."""
    import csv
    out = {}
    p = Path(path)
    if not p.exists():
        return out
    rows = [l for l in read_text(p).split("\n") if l.strip() and not l.startswith("#")]
    for r in csv.DictReader(rows):
        out[int(r["id"], 0)] = {"status": r.get("status") or "todo", "translator": r.get("translator") or "", "note": r.get("note") or ""}
    return out


def write_status(path, st):
    import csv
    import io
    buf = io.StringIO()
    buf.write("# Translation status per dialog id (todo / draft / reviewed).  Ids that are not listed are `draft` if translated, else `todo`.\n")
    w = csv.writer(buf, lineterminator="\n")
    w.writerow(["id", "status", "translator", "note"])
    for i in sorted(st):
        w.writerow(["0x%04X" % i, st[i]["status"], st[i].get("translator", ""), st[i].get("note", "")])
    write_text(path, buf.getvalue())


def effective_status(i, translated, st):
    if i in st:
        return st[i]["status"]
    return "draft" if translated else "todo"


# ---------------------------------------------------------------- context
class Context:
    """Everything the checks need: variable map, Japanese structure reference, digit counts and the US words (fallback text)."""

    def __init__(self, root=None):
        root = Path(root) if root else ASSETS_DIALOGS
        self.root = root
        self.vm = VarMap()
        self.jp = asset_blocks("jp", root)
        self.us = asset_blocks("us", root)
        self.ref = Reference(self.jp, self.vm)
        self.ndigits = number_digits(root, "jp")
        self.ids = sorted(self.jp)
        if sorted(self.us) != self.ids:
            raise ValueError("the Japanese and US dialogs do not have the same ids")


def cursor_cells(lang):
    return engine()["option_cursor_cells"][lang.engine_region]


# ---------------------------------------------------------------- checking one translated dialog
class Result:
    def __init__(self):
        self.errors, self.warnings, self.layout, self.items = [], [], None, None
        self.where = {}             # message -> (screen index, cell index) for the messages that point at a cell


def check_entry(i, text, flags, lang, ctx):
    """Parse + lay out one translation text and compare it with the Japanese structure of the same id -> Result."""
    r = Result()
    if i not in ctx.ref:
        r.errors.append("id 0x%04X does not exist (the game has %d dialogs)" % (i, len(ctx.ids)))
        return r
    raw = (lang.layout == "raw") or ("raw" in flags)
    try:
        r.items = parse_text(text, lang, ctx.vm, ctx.ndigits, raw=raw)
    except SyntaxError_ as e:
        r.errors.append(str(e))
        return r
    if not any(it.kind == "g" for it in r.items):
        r.errors.append("the dialog has no text")
    r.layout = layout_items(r.items, lang, raw=raw)
    r.errors += r.layout.errors
    for m, pos in zip(r.layout.errors, r.layout.error_pos):
        r.where.setdefault(m, pos)
    want = ctx.ref[i]
    sig = items_signature(r.items)
    opt_fields = set(ctx.vm.d.get("optional_fields", []))
    from collections import Counter
    have_v, want_v = Counter(sig["vars"]), Counter(want["vars"])
    for f in sorted(want_v - have_v):
        r.errors.append("missing variable <VAR %s> (the Japanese dialog has it %d time(s))" % (f, want_v[f]))
    for f in sorted(have_v - want_v):
        if f in opt_fields:
            r.warnings.append("optional variable <VAR %s> is not in the Japanese dialog" % f)
        else:
            r.errors.append("variable <VAR %s> does not exist in the Japanese dialog" % f)
    have_n = sorted((it.val[1], it.val[0]) for it in r.items if it.kind == "num")
    if have_n != want["nums"]:
        r.errors.append("numbers (index, digits) %s differ from the Japanese dialog %s" % (have_n, want["nums"]))
    if sig["opt"] != want["opt"]:
        r.errors.append("answers: <OPT %d> but the Japanese dialog has %d" % (sig["opt"], want["opt"]))
    if want["opt"] and r.layout.cells:
        cells = r.layout.cells[-1]
        cur = cursor_cells(lang)
        off = engine()["option_text_offset"]
        for k in range(min(want["opt"], len(cur))):
            c = cur[k]
            if len(cells) <= c + off or cells[c + off] == SPACE:
                m = "answer %d has no text at cell %d (cursor cell %d); use <OPTLBL %d>" % (k + 1, c + off, c, k + 1)
                r.errors.append(m)
                r.where[m] = (len(r.layout.cells) - 1, c + off)
            elif c < len(cells) and cells[c] != SPACE:
                m = "the cursor cell %d of answer %d holds text" % (c, k + 1)
                r.warnings.append(m)
                r.where[m] = (len(r.layout.cells) - 1, c)
    r.nbytes = len(r.layout.words) * 2
    return r


# ---------------------------------------------------------------- translation files
def asset_banks(region, root=None):
    """{id: bank} of the extracted dialogs of a release (the bank assignment is stored in text_tables.json)."""
    root = Path(root) if root else ASSETS_DIALOGS
    ids = sorted(int(label.rsplit("_0x", 1)[1], 16) for label, _ in dialog.read_txt(dialog.dialogs_file(region, root)))
    starts = dialog.bank_starts(region, root)
    out = {}
    for k, (bank, first) in enumerate(starts):
        last = starts[k + 1][1] if k + 1 < len(starts) else len(ids)
        for i in ids[first:last]:
            out[i] = bank
    return out


def load_translation(lang):
    """-> {id: (flags, text)} from translate/<lang>/dialogs.txt (duplicate ids are an error; blocks with an empty body count as not translated)."""
    out = {}
    if not lang.path_dialogs.exists():
        return out
    for i, flags, text in read_blocks(lang.path_dialogs):
        if i in out:
            raise SyntaxError_("%s: dialog 0x%04X appears twice" % (lang.path_dialogs, i))
        if text.strip():                    # an empty block (the skeleton of `translate.py new`) is a dialog that is not translated yet
            out[i] = (flags, text)
    return out


def render_reference(words, region, ctx):
    """Readable form of the words of an extracted dialog with symbolic variables (`<VAR player>`); used by the worksheet only."""
    cm = dict(dialog.load_charmap(region))
    for k, ch in glyphmap.display_chars(glyphmap.read(lang_dir(region))).items():
        cm.setdefault(k, ch)                        # display only (JP): glyph ids the converter keeps as <XXXX>
    text = dialog.words_to_text(words, cm)

    def sub(m):
        f = ctx.vm.field(region, int(m.group(2)))
        return "<VAR %s>" % f if f else m.group(0)
    return re.sub(r"<VAR (\d+) (\d+)>", sub, text)


def structure_line(ref):
    return "vars=%s nums=%s opt=%d" % (",".join(ref["vars"]) or "-", ",".join("%d:%d" % x for x in ref["nums"]) or "-", ref["opt"])


def parse_items_cells(words):
    """number of cells of the longest screen of extracted words (variables count with their width)"""
    mx = cur = 0
    for t in split_tokens(words):
        if t[0] == "NEXT":
            mx, cur = max(mx, cur), 0
        elif t[0] in ("NUM", "VAR"):
            cur += t[1]
        elif t[0] == "G":
            cur += 1
    return max(mx, cur)
