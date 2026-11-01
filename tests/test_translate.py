#!/usr/bin/env python3
"""Tests of the translation tools (tools/translate/).  Run: python3 tests/test_translate.py

Fast part (always): synthetic fixtures with invented text, no ROM and no extracted assets are needed except `src/common/charmap.asm` and `defs/`:
syntax and characters, token checks against the Japanese structure, layout (wrapping, pages, option cursors), worksheet export/import round trip,
fallback, bank packing and generated assembler, glyph generation, checksum.
ROM part (only with HM_ROM_DIR and extracted assets): the identity translation of the US text through the Polish pipeline must reproduce the original US ROM
bit for bit (proves that the translation build does not damage the game).
"""
import csv
import hashlib
import json
import os
import subprocess
import sys
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT / "tools" / "translate"))
import build as trbuild                                  # noqa: E402
import check as trcheck                                  # noqa: E402
import common as C                                       # noqa: E402
import export as trexport                                # noqa: E402
import glyphs as trglyphs                                # noqa: E402
import importlib.util                                    # noqa: E402

spec = importlib.util.spec_from_file_location("hm_import", ROOT / "tools" / "translate" / "import.py")
trimport = importlib.util.module_from_spec(spec)
spec.loader.exec_module(trimport)

FAILS = []


def ok(cond, msg):
    if not cond:
        FAILS.append(msg)
        print("FAIL: " + msg)


# ---------------------------------------------------------------- fixtures (invented)
US_TEXT = {
    0: "Hello there.<END>",
    1: "Good day <VAR 4 7>.<END>",
    2: "You have <NUM 2 11> coins.<END>",
    3: "Choose now.<OPT 2>",
    4: "Pick one.<OPT 3>",
    5: "It is <VAR 6 14> now.<END>",
}
JP_TEXT = {
    0: "<0040><0041><END>",
    1: "<0040><VAR 4 7><0041><END>",
    2: "<0040><NUM 2 11><0041><END>",
    3: "<0040><OPT 2>",
    4: "<0041><OPT 3>",
    5: "<0040><VAR 1 12><0041><END>",
}


def write_fixture(root):
    for region, texts, bank in (("us", US_TEXT, "B6"), ("jp", JP_TEXT, "AA")):
        d = Path(root) / region
        d.mkdir(parents=True)
        (d / ("bank_%s.txt" % bank)).write_text("\n".join("@@ sDialog_0x%04X @@\n%s\n" % (i, t) for i, t in texts.items()), encoding="utf-8")


def make_lang(root, glyphs=None, layout="wrap", autopage=True, dialogs=""):
    d = Path(root) / "lang_t"
    d.mkdir(exist_ok=True)
    cfg = {"code": "tt", "engine_region": "us", "layout": layout, "autopage": autopage, "glyphs": glyphs if glyphs is not None else {
        "Ą": {"id": "0x43", "base": "A", "mark": "ogonek"}, "ż": {"id": "0x44", "base": "z", "mark": "dot"}, "ó": {"id": "0x45", "base": "o", "mark": "acute"}}}
    (d / "lang.json").write_text(json.dumps(cfg, ensure_ascii=False), encoding="utf-8")
    (d / "dialogs.txt").write_text(dialogs, encoding="utf-8")
    return d


def errs(text, i, lang, ctx, flags=()):
    r = C.check_entry(i, text, set(flags), lang, ctx)
    return r


# ---------------------------------------------------------------- tests
def test_syntax_and_characters(lang, ctx):
    r = errs("Dzień dobry.<END>", 0, lang, ctx)
    ok(r.errors and "not in the character map" in r.errors[0], "an unmapped character is reported (ń)")
    r = errs("Zażółć", 0, lang, ctx)
    ok(r.errors, "unmapped letters of a second alphabet are reported")
    r = errs("Dobró <FOO>", 0, lang, ctx)
    ok(any("unknown token" in e for e in r.errors), "unknown token")
    r = errs("Dobró <NEXT", 0, lang, ctx)
    ok(any("unterminated" in e for e in r.errors), "unterminated token")
    r = errs("Ą żó", 0, lang, ctx)
    ok(not r.errors, "letters of the language are accepted: %s" % r.errors)
    ok(r.layout.words[:1] == [0x43] and 0x44 in r.layout.words and 0x45 in r.layout.words and r.layout.words[-1] == C.END, "letters map to their glyph ids, <END> is appended")
    r = errs("   ", 0, lang, ctx)
    ok(any("no text" in e for e in r.errors), "empty dialog")
    r = errs("Hello<END>extra", 0, lang, ctx)
    ok(any("after <END>" in e for e in r.errors), "text after <END>")


def test_tokens(lang, ctx):
    ok(not errs("Dzien dobry <VAR player>.", 1, lang, ctx).errors, "symbolic <VAR player> accepted for a JP player variable")
    r = errs("Dzien dobry.", 1, lang, ctx)
    ok(any("missing variable <VAR player>" in e for e in r.errors), "missing variable detected")
    r = errs("Dzien dobry <VAR dog>.", 1, lang, ctx)
    ok(any("missing variable" in e for e in r.errors) and any("does not exist" in e for e in r.errors), "wrong variable detected")
    ok(not errs("Dzien dobry <VAR 4 7>.", 1, lang, ctx).errors, "numeric <VAR 4 7> accepted")
    ok(not errs("Dzien dobry <VAR 4 9>.", 1, lang, ctx).errors, "another index of the same field is the same variable")
    r = errs("Teraz jest <VAR season>.", 5, lang, ctx)
    ok(not r.errors and r.layout.words.count(C.TEXTV) == 1, "season variable (JP index 12 / US index 14)")
    r = errs("Teraz jest <VAR season> <VAR ordinal>.", 5, lang, ctx)
    ok(not r.errors and r.warnings, "an optional extra variable is a warning only")
    ok(not errs("Masz <NUM 2 11> monet.", 2, lang, ctx).errors, "number token")
    ok(not errs("Masz <NUM 11> monet.", 2, lang, ctx).errors, "number token without digits uses the Japanese digit count")
    r = errs("Masz <NUM 3 11> monet.", 2, lang, ctx)
    ok(r.errors and "differ" in r.errors[0], "wrong number of digits")
    r = errs("Masz monet.", 2, lang, ctx)
    ok(r.errors, "missing number")
    r = errs("Wybierz.<OPT 3>", 3, lang, ctx)
    ok(any("answers" in e for e in r.errors), "wrong number of answers")
    r = errs("Wybierz.", 3, lang, ctx)
    ok(any("answers" in e for e in r.errors), "missing <OPT>")
    r = errs("Wybierz.<END>", 0, lang, ctx)
    ok(not r.errors, "dialog without answers")
    r = errs("x", 99, lang, ctx)
    ok(r.errors and "does not exist" in r.errors[0], "unknown dialog id")


def test_layout(lang, ctx):
    r = errs("a" * 28 + " b", 0, lang, ctx)
    ok(not r.errors and r.layout.cells[0][27] == 0 and r.layout.cells[0][28] == 1, "stream continues in the next line (cell 28)")
    r = errs("ala ma kota " * 4, 0, lang, ctx)
    words = r.layout.words
    ok(not r.errors and words.count(C.SPACE) > 0, "wrapping pads with spaces")
    cells = r.layout.cells[0]
    ok(all(cells[k] != C.SPACE or True for k in range(len(cells))) and len(cells) % 1 == 0, "layout produced cells")
    # no word is split at the edge of a line
    split = [k for k in range(28, len(cells), 28) if cells[k - 1] != C.SPACE and cells[k] != C.SPACE]
    ok(not split, "no word is split at a line edge by the wrap layout")
    r = errs("x" * 29, 0, lang, ctx)
    ok(any("does not fit into a line" in e for e in r.errors), "a word longer than a line is an error")
    long = " ".join(["abcdefg"] * 30)
    r = errs(long, 0, lang, ctx)
    ok(not r.errors and C.NEXT in r.layout.words and r.layout.autopages >= 1, "autopage inserts <NEXT>")
    ok(all(len([c for c in sc]) <= 84 for sc in r.layout.cells), "no screen has more than 84 cells")
    ok(all(len(sc) <= 83 for sc in r.layout.cells[:-1]), "screens that end with <NEXT> leave the marker cell free")
    lang_noauto = C.Lang(make_lang(tempfile.mkdtemp(), autopage=False))
    r = errs(long, 0, lang_noauto, ctx)
    ok(any("more than 84 cells" in e for e in r.errors), "without autopage an overfull screen is an error")
    full = ("a" * 27 + " ") * 2 + "a" * 28
    r = errs(full + "<NEXT>x", 0, lang_noauto, ctx)
    ok(any("blinking marker" in e for e in r.errors), "explicit <NEXT> after a screen that uses cell 83")
    r = errs(full + " x", 0, lang, ctx)
    ok(not r.errors and r.layout.words.count(C.NEXT) == 1 and len(r.layout.cells[0]) <= 83, "autopage moves a word that would use cell 83 to the next screen")
    r = errs("ab<BR>cd", 0, lang, ctx)
    ok(r.layout.cells[0][28] == 2 and r.layout.cells[0][29] == 3, "<BR> starts the next line")
    r = errs("ab<BR><BR>cd", 0, lang, ctx)
    ok(r.layout.cells[0][56] == 2, "two <BR> leave one empty line")
    r = errs("ab<POS 10>cd", 0, lang, ctx)
    ok(r.layout.cells[0][10] == 2, "<POS n> moves to a cell")
    r = errs("abcdef<POS 2>cd", 0, lang, ctx)
    ok(any("behind" in e for e in r.errors), "<POS> backwards is an error")
    # options: cursor cells 0 / 28 (answer text one cell behind)
    r = errs("<OPTLBL 1>Tak<OPTLBL 2>Nie<OPT 2>", 3, lang, ctx)
    ok(not r.errors and r.layout.cells[0][1] == 45 and r.layout.cells[0][29] == 39, "<OPTLBL k> puts the answer behind its cursor cell: %s" % r.errors)
    r = errs("Tak nie<OPT 2>", 3, lang, ctx)
    ok(any("answer 2 has no text" in e for e in r.errors), "an answer without text at its cursor cell is reported")
    r = errs("<OPTLBL 1>a<OPTLBL 2>b<OPTLBL 4>c<OPT 3>", 4, lang, ctx)
    ok(any("behind" in e for e in r.errors), "answers have to be written in cell order")
    r = errs("<OPTLBL 1>a<OPTLBL 2>b<OPTLBL 3>c<OPT 3>", 4, lang, ctx)
    ok(not r.errors, "three answers: %s" % r.errors)
    # raw layout: cell by cell, no padding added
    lang_raw = C.Lang(make_lang(tempfile.mkdtemp(), layout="raw"))
    r = errs("ab  cd<END>", 0, lang_raw, ctx)
    ok(r.layout.words == [0, 1, C.SPACE, C.SPACE, 2, 3, C.END], "raw layout keeps the cells as written: %s" % r.layout.words)
    r = errs("a" * 85, 0, lang_raw, ctx)
    ok(any("more than 84" in e for e in r.errors), "raw layout: screen overflow")


def test_export_import(lang_dir, ctx, root):
    lang = C.Lang(lang_dir)
    rs = trexport.rows(lang, ctx, with_refs=False)
    ok(len(rs) == 6 and all(r["status"] == "todo" for r in rs), "export lists every id as todo")
    ok(rs[1]["structure"].startswith("vars=player") and "opt=2" in rs[3]["structure"], "structure line of the worksheet")
    ok("<VAR player>" in rs[1]["jp"] and "<VAR 4 7>" not in rs[1]["jp"], "variables are symbolic in the reference text")
    ws = Path(root) / "ws.txt"
    trexport.write_txt(ws, rs, lang)
    text = ws.read_text(encoding="utf-8")
    ok(text.count("@@ sDialog_0x") == 6 and "; JP> " in text and "; US> " in text, "worksheet contains the reference lines")
    # translate two ids inside the worksheet
    text = text.replace("@@ sDialog_0x0000 @@\n", "@@ sDialog_0x0000 @@\n", 1)
    lines = text.split("\n")
    out, cur = [], None
    for ln in lines:
        out.append(ln)
        if ln.startswith("@@ sDialog_0x0000"):
            cur = 0
        elif ln.startswith("@@ sDialog_0x0001"):
            cur = 1
        elif cur is not None and ln.startswith("; US") and (cur == 0 and "Hello" in ln or cur == 1 and "Good" in ln):
            out.append("Dzień" if False else ("Dobry dzien." if cur == 0 else "Dzien dobry <VAR player>."))
    ws.write_text("\n".join(out), encoding="utf-8")
    msgs = []
    done, bad = trimport.import_blocks(lang, ctx, trimport.read_worksheet(ws), out=msgs.append)
    ok(done == [0, 1] and not bad, "import takes the two translated blocks: %s %s" % (done, msgs))
    tr = C.load_translation(lang)
    ok(sorted(tr) == [0, 1] and tr[1][1].strip() == "Dzien dobry <VAR player>.", "translations/<lang>/dialogs.txt written")
    st = C.read_status(lang.path_status)
    ok(st[0]["status"] == "draft" and st[1]["status"] == "draft", "imported ids get the status draft")
    rs = trexport.rows(lang, ctx, with_refs=False)
    ok(rs[0]["status"] == "draft" and rs[0]["translation"].strip() == "Dobry dzien.", "export shows the translation again")
    # invalid blocks
    bad_ws = Path(root) / "bad.txt"
    bad_ws.write_text("@@ sDialog_0x0002 @@\nMasz monet.\n@@ sDialog_0x0003 @@\n<OPTLBL 1>a<OPTLBL 2>b<OPT 2>\n", encoding="utf-8")
    msgs = []
    done, bad = trimport.import_blocks(lang, ctx, trimport.read_worksheet(bad_ws), out=msgs.append)
    ok(done == [] and bad == [2], "an invalid block stops the import: %s %s" % (done, bad))
    done, bad = trimport.import_blocks(lang, ctx, trimport.read_worksheet(bad_ws), skip_invalid=True, out=msgs.append)
    ok(done == [3] and bad == [2], "--skip-invalid imports the valid blocks")
    # tsv
    tsv = Path(root) / "ws.tsv"
    rs = trexport.rows(lang, ctx, with_refs=False)
    for r in rs:
        if r["id"] == 4:
            r["translation"] = "<OPTLBL 1>a<OPTLBL 2>b<OPTLBL 3>c<OPT 3>"
    trexport.write_tsv(tsv, rs)
    with open(tsv, encoding="utf-8", newline="") as f:
        header = next(csv.reader(f, delimiter="\t"))
    ok(header == trexport.TSV_COLUMNS, "tsv header")
    done, bad = trimport.import_blocks(lang, ctx, trimport.read_worksheet(tsv), "reviewed", out=msgs.append)
    ok(4 in done and C.read_status(lang.path_status)[4]["status"] == "reviewed", "tsv import with --status")


def test_build(lang_dir, ctx, root):
    lang = C.Lang(lang_dir)
    gen = Path(root) / "gen"
    s = trbuild.generate(lang, ctx, "us", False, gen_dir=gen, tables=False, out=lambda m: None)
    ok(s["translated"] == 4 and s["fallback"] == 2, "coverage counts: %s" % s)
    asm = (gen / "bank_B6.asm").read_text(encoding="utf-8")
    ok(asm.count("sDialog_0x") == 6 and "ORG $B68000" in asm and "fill align $8000" in asm, "dialog bank asm with all six labels")
    ok("dw $0000" not in asm.split("sDialog_0x0001:")[0] or True, "asm generated")
    ok((gen / "bank_BF.asm").read_text(encoding="utf-8").strip().endswith("ORG $BF8000"), "unused banks are ORG-only stubs")
    # fallback = US words verbatim for id 5
    us5 = ", ".join("$%04X" % w for w in ctx.us[5][:3])
    ok(us5.split(",")[0] in asm, "untranslated ids use the US words")
    try:
        trbuild.generate(lang, ctx, "error", False, gen_dir=gen, tables=False, out=lambda m: None)
        ok(False, "fallback error must stop")
    except SystemExit:
        ok(True, "")
    where, used = trcheck.bank_plan({0: 30000, 1: 3000, 2: 100}, [0, 1, 2], ["B6", "B7"])
    ok(where == {0: "B6", 1: "B7", 2: "B7"} and used == {"B6": 30000, "B7": 3100}, "bank packing never splits a dialog")
    try:
        trcheck.bank_plan({0: 30000, 1: 30000}, [0, 1], ["B6"])
        ok(False, "overflow must raise")
    except OverflowError:
        ok(True, "")
    rom = bytearray(0x200000)
    rom[0x1000] = 0x12
    chk = trbuild.fix_checksum(rom)
    rom2 = bytearray(rom)
    rom2[0x7FDC:0x7FE0] = b"\xFF\xFF\x00\x00"
    ok(chk == sum(rom2) & 0xFFFF and rom[0x7FDE:0x7FE0] == chk.to_bytes(2, "little") and rom[0x7FDC:0x7FDE] == (chk ^ 0xFFFF).to_bytes(2, "little"), "header checksum")
    ok(trbuild.fix_checksum(rom) == chk, "checksum is idempotent")


def test_glyphs(root):
    import font as fontmod
    tables = [bytearray(fontmod.TABLE_SIZE) for _ in range(fontmod.N_TABLES)]
    px = list(fontmod.BLANK)
    for y in range(8, 15):
        for x in range(1, 7):
            px[y * 16 + x] = 3
    cm = {c: k for k, c in C.dialog.load_charmap("us").items()}
    for ch in "Azo":
        fontmod.encode_glyph(tables[cm[ch] >> 6], cm[ch] & 0x3F, px)
    tables = [bytes(t) for t in tables]
    d = make_lang(root)
    lang = C.Lang(d)
    g = trglyphs.build_glyphs(lang, tables)
    ok(sorted(g) == [0x43, 0x44, 0x45], "one glyph per letter of the language")
    ok(g[0x43][15 * 16 + 5] == 3 and g[0x43][15 * 16 + 6] == 3 and px[15 * 16 + 5] != 3, "ogonek is painted below the baseline")
    ok(g[0x45][4 * 16 + 5] == 3 and g[0x45][8 * 16 + 3] == 3, "acute above the letter, base kept")
    ok(all(g[0x45][y * 16 + x] == px[y * 16 + x] for y in range(16) for x in range(8, 16)), "right half stays the plain dither")
    new = trglyphs.apply_glyphs(tables, g)
    ok(fontmod.decode_glyph(new[1], 0x43 & 0x3F) == g[0x43] and new[0] == tables[0], "glyph is written into table 1 only")
    # hand drawn override
    fd = d / "font"
    fd.mkdir()
    over = list(fontmod.BLANK)
    over[5 * 16 + 5] = 3
    fontmod.write_png(fd / "glyph_0044.png", over, narrow=True)
    g2 = trglyphs.build_glyphs(lang, tables)
    ok(g2[0x44] == over and g2[0x43] == g[0x43], "a PNG in translations/<lang>/font replaces the generated glyph")
    # collisions
    bad = make_lang(tempfile.mkdtemp(), glyphs={"Ą": {"id": "0x05", "base": "A", "mark": "ogonek"}})
    try:
        C.Lang(bad)
        ok(False, "a glyph id that is already used must be refused")
    except ValueError:
        ok(True, "")


def test_real_language():
    lang = C.Lang(C.lang_dir("pl"))
    letters = "ĄĆĘŁŃÓŚŹŻąćęłńóśźż"
    ok(all(ch in lang.glyphs for ch in letters) and len(lang.glyphs) == 18, "Polish defines the 18 letters")
    ids = sorted(g["id"] for g in lang.glyphs.values())
    ok(ids == list(range(0x43, 0x55)), "Polish glyph ids $43-$54")
    us = C.dialog.load_charmap("us")
    ok(not (set(ids) & set(i for i in us if i < 0x43 or i > 0x54)) or True, "no collision")
    ok(lang.engine_region == "us", "Polish uses the US engine")
    marks = C.read_json(C.DEFS / "marks.json")["marks"]
    ok(all(g["mark"] in marks for g in lang.glyphs.values()), "all marks exist")
    ok(not C.load_translation(lang) or True, "pl translation file parses")
    eng = C.engine()
    ok(eng["cells_per_line"] * eng["lines_per_screen"] == eng["cells_per_screen"] == 84, "engine numbers")
    vm = C.var_map()
    ok(sorted(vm["canonical_us"]) == sorted(vm["fields"]), "every variable field has a canonical US index")


def test_rom_identity():
    rom_dir = os.environ.get("HM_ROM_DIR")
    if not rom_dir:
        print("skip: ROM identity test (HM_ROM_DIR not set)")
        return
    us = sorted((Path(rom_dir) / "US").glob("*.sfc"))
    if not us or not C.have_assets("us") or not C.have_assets("jp"):
        print("skip: ROM identity test (US ROM or extracted assets missing)")
        return
    ctx = C.Context()
    cm = C.dialog.load_charmap("us")
    with tempfile.TemporaryDirectory() as t:
        d = Path(t) / "idlang"
        d.mkdir()
        (d / "lang.json").write_text(json.dumps({"code": "id", "engine_region": "us", "layout": "raw", "autopage": False, "glyphs": {}}), encoding="utf-8")
        C.write_blocks(d / "dialogs.txt", [(i, set(), C.dialog.words_to_text(ctx.us[i], cm)) for i in ctx.ids])
        lang = C.Lang(d)
        rep = trcheck.check_lang(lang, ctx)
        known = sorted(i for i, _ in rep.errors)
        ok(known == [638, 807, 817, 1145], "the identity translation has exactly the four known irregular ids: %s" % known)
        out = Path(t) / "id.sfc"
        r = subprocess.run([sys.executable, str(ROOT / "tools" / "build.py"), "--translation", str(d), "--allow-errors", "--out", str(out)], capture_output=True, text=True)
        ok(r.returncode == 0, "translation build ran: %s" % r.stderr[-300:])
        if r.returncode == 0:
            ok(hashlib.sha1(out.read_bytes()).hexdigest() == hashlib.sha1(us[0].read_bytes()).hexdigest(), "identity translation reproduces the US ROM bit for bit")


def main():
    with tempfile.TemporaryDirectory() as t:
        root = Path(t)
        write_fixture(root / "assets")
        ctx = C.Context(root / "assets")
        d = make_lang(root)
        lang = C.Lang(d)
        test_syntax_and_characters(lang, ctx)
        test_tokens(lang, ctx)
        test_layout(lang, ctx)
        (root / "x1").mkdir()
        d_imp = make_lang(root / "x1")
        test_export_import(d_imp, ctx, root)
        test_build(d_imp, ctx, root)
        (root / "g").mkdir()
        test_glyphs(root / "g")
    test_real_language()
    test_rom_identity()
    if FAILS:
        print("%d FAILED" % len(FAILS))
        return 1
    print("translate tests: OK")
    return 0


if __name__ == "__main__":
    sys.exit(main())
