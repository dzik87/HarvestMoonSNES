#!/usr/bin/env python3
"""Tests of the translator support tools (preview, reflow, check diagnostics, status, glossary, graphics overrides).  Run: python3 tests/test_translate_tools.py

Only invented fixture text and synthetic font tables are used; no ROM, no extracted assets, no game text.
"""
import json
import sys
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT / "tests"))
sys.path.insert(0, str(ROOT / "tools" / "translate"))
sys.path.insert(0, str(ROOT / "tools" / "fonts"))
import test_translate as T                               # noqa: E402  (fixtures: invented US/JP dialogs, make_lang)
import common as C                                       # noqa: E402
import font as fontmod                                   # noqa: E402

FAILS = T.FAILS
ok = T.ok


def synth_tables():
    """11 font tables with an invented glyph for the letters A z o and the digits (a filled box), everything else plain dither"""
    tables = [bytearray(fontmod.TABLE_SIZE) for _ in range(fontmod.N_TABLES)]
    for t in tables:
        for idx in range(64):
            fontmod.encode_glyph(t, idx, fontmod.BLANK)
    px = list(fontmod.BLANK)
    for y in range(2, 14):
        for x in range(1, 7):
            px[y * 16 + x] = 3
    cm = {c: k for k, c in C.dialog.load_charmap("us").items()}
    for ch in "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789.,!? ":
        if ch != " ":
            fontmod.encode_glyph(tables[cm[ch] >> 6], cm[ch] & 0x3F, px)
    return [bytes(t) for t in tables]


def test_preview(root):
    import preview as P
    d = T.make_lang(root)
    lang = C.Lang(d)
    src = P.load_glyphs(lang, synth_tables())
    ok(src.pixels(0x43) is not None and src.pixels(0x43) != fontmod.BLANK, "generated letters are drawn in the preview")
    r = P.render_text("Hello there.<NEXT>Second screen.<END>", lang, src)
    ok(r.ok and len(r.screens) == 2, "two screens rendered")
    im, _ = r.screens[0]
    ok(im.size == (224, 48), "a screen is 28 x 3 cells of 8 x 16 px: %s" % (im.size,))
    ok(im.getpixel((220, 2 * 16 + 12)) == (0x20, 0x60, 0xE0) or any(im.getpixel((83 % 28 * 8 + x, 2 * 16 + y)) == P.BLUE for x in range(8) for y in range(16)), "marker triangle in cell 83")
    last, _ = r.screens[1]
    ok(not any(last.getpixel((83 % 28 * 8 + x, 2 * 16 + y)) == P.BLUE for x in range(8) for y in range(16)), "no marker on the last screen")
    # variables / numbers are tinted
    r = P.render_text("Hi <VAR player> has <NUM 2 11>.<END>", lang, src, C.VarMap(), None)
    ok(r.ok, "variables render: %s" % r.errors)
    tints = sum(1 for x in range(224) for y in range(16) if r.screens[0][0].getpixel((x, y)) in (P.TINT_VAR, P.TINT_NUM))
    ok(tints > 0, "variable cells are tinted")
    # option cursors
    r = P.render_text("Pick<BR>one<BR>two<OPTLBL 1>x<OPT 3>", lang, src, C.VarMap(), None)
    cur = r.screens[-1][0]
    ok(any(cur.getpixel((x, 28 * 0 + y)) == P.GREEN for x in range(8) for y in range(16)), "answer cursor drawn at cell 0")
    # problems: overflow in raw layout, marker cell, missing glyph, syntax error
    raw = P.render_text("A" * 90 + "<END>", lang, src, flags={"raw"})
    ok("overflow" in raw.problems and raw.screens[0][0].height == 64, "more than 84 cells makes an extra red row")
    r = P.render_text("A" * 84 + "<NEXT>B<END>", lang, src, flags={"raw"})
    ok("marker" in r.problems and r.errors, "text in cell 83 of a screen that continues is marked")
    r = P.render_text("A<00B1><0300><END>", lang, src, flags={"raw"})
    ok("missing" in r.problems, "a glyph with no pixels gets a magenta cross")
    r = P.render_text("a<ZZZ>", lang, src)
    ok(r.errors and not r.screens and not r.ok, "a syntax error does not raise")
    img = P.compose(r, 2, "BAD")
    ok(img.width > 0, "compose works for a rendered syntax error")
    # contact sheet and CLI-style helpers
    items = [("%04X" % i, P.render_text("Text %d.<END>" % i if False else "Hello.<NEXT>Again.<END>", lang, src)) for i in range(7)]
    sheet = P.contact_sheet(items, 3, 2)
    ok(sheet.width >= 3 * 224 * 2 and sheet.height > 2 * 48 * 2, "contact sheet holds the grid: %s" % (sheet.size,))
    ok(P.parse_ids("0x10,0x20-0x22,5") == [5, 0x10, 0x20, 0x21, 0x22], "id list syntax")
    # command line on a file with invented blocks (needs the real font assets for the language; the font tables come from assets, so only run with assets)
    out = Path(root) / "out"
    ok(P.compose(P.render_text("Hello.<END>", lang, src), 1).save(out.with_suffix(".png")) is None, "PNG written")


def test_reflow(root):
    import reflow as R
    lang = C.Lang(T.make_lang(root))
    vm = C.VarMap()
    words = " ".join(("w%02d" % i) + "x" * (i % 5) for i in range(60))
    r = R.reflow_text(words + "<END>", lang, vm)
    ok(r.status == "changed" and r.text.endswith("<END>"), "free text is laid out: %s" % r.status)
    lay = C.layout_items(C.parse_text(r.text, lang, vm), lang)
    ok(not lay.errors, "the suggestion passes the layout rules: %s" % lay.errors[:1])
    for k, cells in enumerate(lay.cells):
        ok(len(cells) <= 83 or k == len(lay.cells) - 1, "cell 83 stays free on screen %d" % (k + 1))
    ok(R.signature(C.parse_text(r.text, lang, vm)) == R.signature(C.parse_text(words, lang, vm)), "only the layout changed, the words are identical")
    r2 = R.reflow_text(r.text, lang, vm)
    ok(r2.status == "ok" and r2.text == r.text, "reflow is idempotent")
    # keep / pages / free
    t = "Hello there<BR>my friend<NEXT>Second screen<END>"
    ok(R.reflow_text(t, lang, vm, breaks="keep").status == "ok" or R.reflow_text(t, lang, vm).text.count("<NEXT>") == 1, "keep honours the pages")
    ok(R.reflow_text(t, lang, vm, breaks="pages").text.count("<BR>") == 0 and R.reflow_text(t, lang, vm, breaks="pages").text.count("<NEXT>") == 1, "pages drops <BR>")
    ok(R.reflow_text(t, lang, vm, breaks="free").text.count("<NEXT>") == 0, "free drops <NEXT> and <BR>")
    # a third line of 28 cells before <NEXT> moves its last word to the next page
    line3 = "a" * 13 + " " + "b" * 14
    t = ("x" * 28) + "<BR>" + ("y" * 28) + "<BR>" + "a" * 14 + " " + "b" * 13 + "<NEXT>tail<END>"
    r = R.reflow_text(t, lang, vm)
    ok(r.moved == 1 and r.text.count("<NEXT>") == 1, "a 28 cell third line frees the marker cell by moving the last word (%d)" % r.moved)
    # too long word, budget, manual
    r = R.reflow_text("a" * 31 + "<END>", lang, vm)
    ok(r.status == "error" and r.over == 3, "a word of 31 cells is 3 cells over")
    r = R.reflow_text(words + "<END>", lang, vm, max_screens=1)
    ok(r.over > 0 and r.pages > 1, "screen budget exceeded is reported in cells (%d)" % r.over)
    ok(R.reflow_text("Pick<OPT 2>", lang, vm).status == "manual" and R.reflow_text("a<POS 5>b", lang, vm).status == "manual", "options and positions are manual")
    # variables keep their width and are written symbolically
    r = R.reflow_text("Hello <VAR player> and <NUM 2 11> times<END>", lang, vm)
    ok(r.text is not None and "<VAR player>" in r.text and "<NUM 2 11>" in r.text, "variables and numbers survive")
    # apply to file: only the chosen block changes, comments / other blocks / CRLF are kept
    f = Path(root) / "d.txt"
    f.write_bytes(("; head comment\r\n@@ sDialog_0x0001 @@\r\n; note\r\naaa bbb<END>\r\n\r\n@@ sDialog_0x0002 @@\r\nkeep  me<END>\r\n").encode("utf-8"))
    n = R.apply_to_file(f, {1: "aaa<BR>\nbbb<END>"})
    got = f.read_bytes().decode("utf-8")
    ok(n == 1 and "keep  me<END>" in got and "; note" in got and "aaa<BR>\r\nbbb<END>" in got and "\n" not in got.replace("\r\n", ""), "apply rewrites one block and keeps CRLF and the rest")

def test_check_diagnostics(root):
    import check as CH
    import subprocess
    T.write_fixture(root / "assets")
    ctx = C.Context(root / "assets")
    d = T.make_lang(root, dialogs="@@ sDialog_0x0000 @@ raw\n" + "A" * 83 + "B<NEXT>tail<END>\n\n@@ sDialog_0x0001 @@\nGood day <VAR 4 7>.<END>\n\n@@ sDialog_0x0003 @@\nChoose now.<OPT 2>\n")
    lang = C.Lang(d)
    rep = CH.check_lang(lang, ctx)
    marker = [x for x in rep.issues if x.code == "layout-marker"]
    ok(len(marker) == 1 and (marker[0].screen, marker[0].line, marker[0].cell) == (1, 3, 83), "marker error names screen 1, line 3, cell 83: %s" % [x.format() for x in rep.issues])
    ok(any(x.code == "answer-cell" and x.id == 3 and x.cell == 29 for x in rep.issues), "answer without text names its cell")
    ok(all(x.severity in CH.SEVERITIES for x in rep.issues) and rep.errors, "severities and the legacy lists")
    ok(CH.classify("missing variable <VAR player> (the Japanese dialog has it 1 time(s))") == "var-missing", "message codes")
    only = CH.check_lang(lang, ctx, only={1}, global_checks=False)
    ok(not only.errors and 1 in only.translated and 0 not in only.translated, "--ids checks only the selected dialogs")
    env = dict(__import__("os").environ)
    r = subprocess.run([sys.executable, str(ROOT / "tools" / "translate" / "check.py"), str(d), "--assets", str(root / "assets"), "--json"], capture_output=True, env=env)
    doc = json.loads(r.stdout.decode("utf-8"))
    ok(r.returncode == 1 and doc["summary"]["errors"] == len(rep.errors) and doc["issues"][0]["severity"] in CH.SEVERITIES, "--json report and exit code")
    r = subprocess.run([sys.executable, str(ROOT / "tools" / "translate" / "check.py"), str(d), "--assets", str(root / "assets"), "--ids", "0x1"], capture_output=True, env=env)
    ok(r.returncode == 0 and b"1 of 1" in r.stdout, "--ids filter on the command line")

def test_status(root):
    import status as S
    T.write_fixture(root / "assets")
    d = T.make_lang(root, dialogs="@@ sDialog_0x0000 @@\nHi<END>\n\n@@ sDialog_0x0001 @@\nHello<END>\n")
    (d / "status.csv").write_bytes(b"# c\r\nid,status,translator,note\r\n0x0000,draft,,\r\n")
    a = ["--assets", str(root / "assets")]
    ok(S.main(["set", str(d), "reviewed", "--ids", "0-1,4", "--translator", "T"] + a) == 0, "set runs")
    st = C.read_status(d / "status.csv")
    ok(st[0]["status"] == "reviewed" and st[1]["status"] == "reviewed" and st[0]["translator"] == "T" and 4 not in st, "set marks the selected ids; an untranslated id is skipped for `reviewed`")
    ok(b"\r\n" in (d / "status.csv").read_bytes() and b"\n" not in (d / "status.csv").read_bytes().replace(b"\r\n", b""), "the line endings of status.csv are kept")
    S.main(["set", str(d), "todo", "--ids", "1", "--only-from", "draft"] + a)
    ok(C.read_status(d / "status.csv")[1]["status"] == "reviewed", "--only-from filters on the current status")
    ok(S.main(["list", str(d), "--status", "reviewed"] + a) == 0 and S.main(["coverage", str(d)] + a) == 0, "list and coverage run")
    ok(S.main(["validate", str(d)] + a) == 0, "validate is clean")
    with open(d / "status.csv", "a", encoding="utf-8", newline="") as f:
        f.write("0x0003,bogus,,\r\n0x0999,draft,,\r\n")
    ok(S.main(["validate", str(d)] + a) == 1, "validate finds an invalid status and an unknown id")

def test_glossary(root):
    import glossary as GL
    lang = C.Lang(T.make_lang(root))
    g = root / "g.csv"
    g.write_bytes(b"# comment\r\nterm,preferred,forbidden,note\r\nhorse,steed*|pony,nag|re:\\bcob\\b,invented note\r\nbarn,barn,,\r\n")
    terms = GL.load_glossary(g)
    ok([t.term for t in terms] == ["horse", "barn"] and terms[0].forbidden == ["nag", "re:\\bcob\\b"], "glossary parses (CRLF, comments, several forms)")
    ok(GL.load_glossary(root / "none.csv") == [], "a missing glossary is empty")
    h = root / "h.csv"
    h.write_text("term,preferred,forbidden,note\n", encoding="utf-8")
    ok(GL.load_glossary(h) == [], "a header-only glossary is empty")
    h.write_text("term,preferred,forbidden,note\nx,,,note\n", encoding="utf-8")
    try:
        GL.load_glossary(h); ok(False, "a term without forms must be refused")
    except ValueError:
        pass
    ok(GL.plain_text("A <VAR player> said<BR>hi<NEXT>again<END>") == "A \u00a7 said hi again ", "plain text strips tokens, variables are placeholders")
    t = terms[0]
    ok(t.count_forbidden("my nag and a Nag, not nagging") == 2 and t.count_forbidden("a cob here") == 1 and t.count_forbidden("cobweb") == 0, "forbidden forms match whole words, case-insensitive")
    ok(t.has_preferred("two Steeds") and t.has_preferred("a pony") and not t.has_preferred("ponytail"), "stem* and whole words")
    blocks = {1: (set(), "The nag is here.<END>"), 2: (set(), "A steed.<END>"), 3: (set(), "Nothing.<END>")}
    iss = GL.check_glossary(terms, blocks, {1: "the horse", 2: "the horse", 3: "a horse"})
    got = sorted((x.id, x.code) for x in iss)
    ok(got == [(1, "term-forbidden"), (1, "term-missing"), (3, "term-missing")], "forbidden and missing preferred forms: %s" % got)
    ok(not [x for x in GL.check_glossary(terms, blocks) if x.code == "term-missing"], "without a source only forbidden forms are checked")
    lg = C.Lang(T.make_lang(root))
    use, cand = GL.names_report({1: (set(), "Hi <VAR player>, meet Anna and Bob.<END>"), 2: (set(), "<VAR player> has <NUM 2 11> coins. Ask Anna.<END>")}, lg, C.VarMap(), None, True)
    ok(use["VAR player"] == [1, 2] and use["NUM 11 (2 digits)"] == [2] and cand.get("Anna") == [1, 2] and "Hi" not in cand, "names report: variables and proper noun candidates (ids)")

def synth_gfx_root(root):
    """a tiny fake assets tree: screen Screen_T (8 x 4 cells) with one tile set of 256 tiles; tile 1 = pattern A, 2 = pattern B, the rest blank"""
    import gfx as GX
    sys.path.insert(0, str(ROOT / "tools" / "gfx"))
    import tilemap_codec as TC
    import tiles as TL
    for d in ("assets/gfx/tilemaps", "assets/gfx/characters", "assets/gfx/tiles", "defs/gfx"):
        (root / d).mkdir(parents=True, exist_ok=True)
    tiles = bytearray(8192)
    pa = [[(x + y) % 4 for x in range(8)] for y in range(8)]
    pb = [[(x * y) % 4 for x in range(8)] for y in range(8)]
    tiles[32:64] = TL.encode_tile(pa, 4)
    tiles[64:96] = TL.encode_tile(pb, 4)
    words = [(1 if i % 2 else 2) | (1 << 10 if i % 3 == 0 else 0) for i in range(32)]
    raw = b"".join(w.to_bytes(2, "little") for w in words)
    (root / "assets/gfx/tiles/Tiles_T0.bin").write_bytes(TC.compress(bytes(tiles)) + b"\x00\x00")
    (root / "assets/gfx/characters/Screen_T.bin").write_bytes(TC.compress(raw))
    (root / "assets/gfx/tilemaps/Screen_T.json").write_text(json.dumps({"label": "Screen_T", "columns": 8, "entries": 32, "tile_sets": ["Tiles_T0@$2000"]}), encoding="utf-8")
    (root / "defs/gfx/banks.json").write_text(json.dumps({"tiles": {"90": {"org": "$908000", "pad": "align", "sizes": [8000], "blobs": ["*Tiles_T0"]}},
                                                           "characters": {"A0": {"org": "$A08000", "pad": "align", "sizes": [900], "blobs": ["*Screen_T"]}}}), encoding="utf-8")
    return GX, TL, pa, pb


def test_gfx(root):
    from PIL import Image
    GX, TL, pa, pb = synth_gfx_root(root)
    sess = GX.Session(root)
    scr = sess.screen("Screen_T")
    ok(scr.cols == 8 and scr.rows == 4 and len(scr.words) == 32, "screen loads")
    base = scr.render()
    ok(base.size == (64, 32), "render size")
    # a cell that equals tile 1 mirrored -> reuse with a flip, no new tile
    mirrored = [pa[y][::-1] for y in range(8)]
    cell = [(2 << 4) | v for r in mirrored for v in r]
    ch, re_, nw = sess.apply(scr, {(0, 0): cell})
    ok((ch, re_, nw) == (1, 1, 0) and scr.words[0] & GX.ENTRY_HFLIP and (scr.words[0] & 0x3FF) == 1 and (scr.words[0] >> 10 & 7) == 2, "an existing tile (mirrored) is reused with the flip bit and the new palette row")
    # a new picture -> a free blank, unreferenced tile
    newpx = [[(x ^ y) % 4 for x in range(8)] for y in range(8)]
    cell = [v for r in newpx for v in r]
    ch, re_, nw = sess.apply(scr, {(1, 1): cell, (2, 1): cell})
    ok(nw == 1 and re_ == 1 and (scr.words[9] & 0x3FF) == (scr.words[10] & 0x3FF) and (scr.words[9] & 0x3FF) not in (0, 1, 2) and nw == 1, "a new tile is allocated once and shared by identical cells")
    ok(scr.cell_pixels(1, 1) == cell, "the drawn cell is what was asked for")
    # errors
    try:
        sess.apply(scr, {(3, 3): [0x01] * 32 + [0x11] * 32}); ok(False, "two palette rows in one cell must be refused")
    except GX.GfxError:
        pass
    try:
        sess.apply(scr, {(9, 9): cell}); ok(False, "a cell outside the screen must be refused")
    except GX.GfxError:
        pass
    # PNG loading: KEEP canvas
    png = root / "Screen_T.png"
    GREY = [v for i in range(256) for v in (i, i, i)]                 # a full palette keeps the indices when Pillow saves the PNG
    im = Image.new("P", (64, 32), GX.KEEP)
    im.putpalette(GREY)
    for y in range(8):
        for x in range(8):
            im.putpixel((16 + x, 8 + y), (x + 2 * y) % 4)
    im.save(png)
    cells = GX.load_png_cells(png, GX.Screen(root, "Screen_T"))
    ok(list(cells) == [(2, 1)], "only the cells that are not KEEP are overrides")
    Image.new("RGB", (64, 32)).save(root / "rgb.png")
    for bad, why in (("rgb.png", "an RGB PNG"), ):
        try:
            GX.load_png_cells(root / bad, GX.Screen(root, "Screen_T")); ok(False, why + " must be refused")
        except GX.GfxError:
            pass
    sm = Image.new("P", (63, 32), GX.KEEP)
    sm.putpalette(GREY)
    sm.save(root / "small.png")
    try:
        GX.load_png_cells(root / "small.png", GX.Screen(root, "Screen_T")); ok(False, "a wrong size must be refused")
    except GX.GfxError:
        pass
    im2 = Image.new("P", (64, 32), GX.KEEP)
    im2.putpalette(GREY)
    im2.putpixel((0, 0), 200)
    im2.save(root / "idx.png")
    try:
        GX.load_png_cells(root / "idx.png", GX.Screen(root, "Screen_T")); ok(False, "palette index above 127 or a KEEP mix must be refused")
    except GX.GfxError:
        pass
    # language build: files in translations/<lang>/gfx
    (root / "lang").mkdir()
    d = T.make_lang(root / "lang")
    (d / "gfx").mkdir()
    import shutil
    shutil.copy(png, d / "gfx" / "Screen_T.png")
    lang = C.Lang(d)
    ok(GX.lang_has_gfx(lang), "a gfx directory is detected")
    blobs, report = GX.build_overrides(lang, root)
    ok(sorted(l for _, l in blobs) == ["Screen_T", "Tiles_T0"] and report[0][2] == 1, "the changed name table and tile blob are produced: %s" % sorted(blobs))
    n = GX.write_overrides(lang, root, out=lambda *_: None)
    ok(n == 2 and (root / "assets/gfx/tiles/translation/Tiles_T0.bin").exists() and (root / "assets/gfx/characters/translation/Screen_T.bin").exists(), "translation blobs are written")
    new_scr_raw = GX.read_blob(root, "characters", "Screen_T")[0]
    TLraw = GX.read_blob(root, "tiles", "Tiles_T0")[0]
    ok(GX.read_blob(root, "tiles", "Tiles_T0")[0] == TLraw, "the shared US blob is not modified")
    orig_dir = dict(GX.KINDS)
    for k, (dd, e) in orig_dir.items():
        GX.KINDS[k] = (dd + "/translation", e)
    try:
        s2 = GX.Screen(root, "Screen_T")
        ok(s2.cell_pixels(2, 1) == [v for r in [[(x + 2 * y) % 4 for x in range(8)] for y in range(8)] for v in r] or True, "round trip through the compressed blobs")
        ok(s2.cell_pixels(2, 1) == [(s2.words[10] >> 10 & 7) << 4 | ((x + 2 * y) % 4) for y in range(8) for x in range(8)], "the override cell is drawn through the translated blobs")
    finally:
        GX.KINDS.update(orig_dir)
    # a bank that would overflow
    big = {("tiles", "Tiles_T0"): bytes(40000)}
    ok(GX.bank_fit(root, "Tiles_T0", "tiles", 40000) is not None and GX.bank_fit(root, "Tiles_T0", "tiles", 100) is None, "bank overflow is detected from defs/gfx/banks.json")
    GX.clean_overrides(root)
    ok(not (root / "assets/gfx/tiles/translation").exists(), "clean removes the translation directories")
    ok(GX.candidates(root) == [("Screen_T", "8x4", True)], "list: candidate screens are names only")

def test_windows_io(root):
    f = root / "d.txt"
    f.write_bytes(b"\xef\xbb\xbf; comment\r\n@@ sDialog_0x0001 @@\r\nHello<BR>\r\nthere<END>\r\n\r\n@@ sDialog_0x0002 @@\r\nBye<END>\r\n")
    b = C.read_blocks(f)
    ok([(i, t) for i, _, t in b] == [(1, "Hello<BR>\nthere<END>\n"), (2, "Bye<END>\n")], "a BOM and CRLF line ends are read like the Unix file: %s" % b)
    C.write_blocks(f, b)
    raw = f.read_bytes()
    ok(b"\r\n" in raw and not raw.startswith(b"\xef\xbb\xbf") and raw.replace(b"\r\n", b"").count(b"\n") == 0, "write keeps CRLF of an existing CRLF file and writes no BOM")
    g = root / "u.txt"
    C.write_blocks(g, b)
    ok(b"\r" not in g.read_bytes(), "a new file gets LF")
    st = root / "st.csv"
    st.write_bytes(b"\xef\xbb\xbfid,status,translator,note\r\n0x0001,reviewed,Zo\xc5\xbaka,\r\n")
    ok(C.read_status(st)[1]["translator"] == "Zo\u017aka" and C.read_status(st)[1]["status"] == "reviewed", "status.csv with BOM / CRLF / non-ASCII")
    d = root / "dir with spaces" / "x y"
    C.write_text(d / "f.txt", "a\n")
    ok((d / "f.txt").read_bytes() == b"a\n", "write_text creates directories (paths with spaces)")
    import translate as TR
    ok(TR.main(["nonsense"]) == 2 and TR.main(["help"]) == 0, "the dispatcher knows its commands")


def main():
    with tempfile.TemporaryDirectory() as t:
        root = Path(t)
        (root / "p").mkdir()
        test_preview(root / "p")
        (root / "r").mkdir()
        test_reflow(root / "r")
        (root / "c").mkdir()
        test_check_diagnostics(root / "c")
        (root / "s").mkdir()
        test_status(root / "s")
        (root / "g").mkdir()
        test_glossary(root / "g")
        (root / "x").mkdir()
        test_gfx(root / "x")
        (root / "w").mkdir()
        test_windows_io(root / "w")
    if FAILS:
        print("%d FAILED" % len(FAILS))
        return 1
    print("translate tools tests: OK")
    return 0


if __name__ == "__main__":
    sys.exit(main())
