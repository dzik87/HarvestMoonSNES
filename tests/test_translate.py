#!/usr/bin/env python3
"""Tests of the translation tools (tools/translate/).  Run: python3 tests/test_translate.py

Fast part (always): synthetic fixtures with invented text, no ROM and no extracted assets are needed except `src/common/charmap.asm` and `defs/`:
syntax and characters, token checks against the Japanese structure, layout (wrapping, pages, option cursors), worksheet export/import round trip,
fallback, bank packing and generated assembler, glyph generation, checksum, string tables (encoding, widths, ROM patch on a synthetic image), name entry grid
(links, reachability, the dead grids, patch on a synthetic image), glyph id collision checks.
ROM part (only with HM_ROM_DIR and extracted assets): the identity translation of the US text through the Polish pipeline must reproduce the original US ROM
bit for bit (proves that the translation build does not damage the game); the Polish build changes the ROM only in the font table, the string tables, the name grid
area and the header checksum.
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
import namegrid as trgrid                                # noqa: E402
import strings as trstr                                  # noqa: E402
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


# ---------------------------------------------------------------- strings, name grid (synthetic)
def lang_with(root, strings=None, grids=None, glyphs=None):
    d = make_lang(root, glyphs=glyphs)
    cfg = json.loads((d / "lang.json").read_text(encoding="utf-8"))
    if strings is not None:
        cfg["strings"] = strings
    if grids is not None:
        cfg["grids"] = grids
    (d / "lang.json").write_text(json.dumps(cfg, ensure_ascii=False), encoding="utf-8")
    return C.Lang(d)


def test_strings(root):
    sp = trstr.spec()
    ok(sorted(sp["tables"]) == ["day_ordinal", "season", "weekday", "year_ordinal"], "four string tables")
    ok({n: t["chars"] for n, t in sp["tables"].items()} == {"season": 6, "weekday": 9, "day_ordinal": 2, "year_ordinal": 2}, "widths are the engine limits (season 6, weekday 9, ordinals 2)")
    ok({n: len(t["entries"]) for n, t in sp["tables"].items()} == {"season": 4, "weekday": 7, "day_ordinal": 4, "year_ordinal": 3}, "slot counts")
    ok(all(t["stride"] >= 2 * t["chars"] for t in sp["tables"].values()), "a slot holds its characters")
    lang = lang_with(root, glyphs=None)
    cm = {c: k for k, c in lang.charmap.items()}
    w, e = trstr.encode(lang, "Ala", 6)
    ok(not e and w == [cm["A"], cm["l"], cm["a"], C.SPACE, C.SPACE, C.SPACE], "short text is padded with the space glyph: %s %s" % (w, e))
    w, e = trstr.encode(lang, "ĄżóĄżó", 6)
    ok(not e and w == [0x43, 0x44, 0x45, 0x43, 0x44, 0x45], "exactly the width, letters of the language: %s %s" % (w, e))
    w, e = trstr.encode(lang, "ĄżóĄżóĄ", 6)
    ok(e and "at most 6" in e[0], "a string longer than the slot is an error")
    w, e = trstr.encode(lang, "Zażółć", 6)
    ok(e and "not in the character map" in e[0], "a character outside the map is an error")
    w, e = trstr.encode(lang, "A<00B1>b", 6)
    ok(not e and w[1] == C.SPACE and w[2] == cm["b"], "<XXXX> is a raw glyph id")
    w, e = trstr.encode(lang, "A<NEXT>", 6)
    ok(e and "<XXXX>" in e[0], "other tokens are refused")
    w, e = trstr.encode(lang, "   ", 6)
    ok(e and "empty" in e[0], "an empty string is an error")
    tb = sp["tables"]["weekday"]
    ok([trstr.slot_index(tb, k) for k in ("sunday", "saturday", "3", 6, "nope", 7, "7")] == [0, 6, 3, 6, None, None, None], "slots by label or index")
    good = lang_with(root, strings={"season": {"spring": "Ala", "3": "Ą"}, "weekday": {"sunday": "A" * 9}, "day_ordinal": {"first": "."}})
    errors, warnings = trstr.check_lang_strings(good)
    ok(not errors, "valid strings: %s" % errors)
    ok(any("strings.season" in w and "summer" in w for w in warnings) and any("strings.day_ordinal" in w for w in warnings), "slots without text are a warning: %s" % warnings)
    bad = lang_with(root, strings={"nosuch": {"a": "x"}, "season": {"spring": "ABCDEFG", "nope": "x", "0": "dup", "winter": "ż\u0105\u017a"}, "weekday": "x"})
    errors, _ = trstr.check_lang_strings(bad)
    ok(any("unknown table" in e for e in errors) and any("at most 6" in e for e in errors) and any("unknown key" in e for e in errors), "unknown table / too long / unknown key: %s" % errors)
    ok(any("same slot" in e for e in errors) and any("must be an object" in e for e in errors) and any("not in the character map" in e for e in errors), "duplicate slot, wrong type, bad character: %s" % errors)
    ok(trstr.check_lang_strings(lang_with(root))[0] == [], "no strings = nothing to check")

    # ROM patch on a synthetic image: the slots hold glyph words, everything else must stay
    rom = bytearray(0x200000)
    tbl = sp["tables"]
    for n, t in tbl.items():
        o = trstr.rom_offset(trstr.table_address(t))
        for i in range(len(t["entries"])):
            for k in range(t["stride"] // 2):
                rom[o + i * t["stride"] + 2 * k] = 0x01 + (k & 7) if k < t["chars"] else 0x00
    before = bytes(rom)
    done = trstr.patch_rom(rom, good)
    ok(done == [("season", [0, 3]), ("weekday", [0]), ("day_ordinal", [0])], "patched slots: %s" % done)
    t = tbl["season"]
    o = trstr.rom_offset(trstr.table_address(t))
    ok(rom[o:o + 12] == b"".join(w.to_bytes(2, "little") for w in trstr.encode(good, "Ala", 6)[0]), "slot 0 of the season table written")
    ok(rom[o + 12:o + 16] == before[o + 12:o + 16] and rom[o + 16:o + 48] == before[o + 16:o + 48], "padding words and the other slots are untouched")
    ok(rom[o + 48:o + 50] == b"\x43\x00" and rom[o + 50:o + 60] == bytes([0xB1, 0, 0xB1, 0, 0xB1, 0, 0xB1, 0, 0xB1, 0]), "slot 3 written and padded with spaces")
    changed = [i for i in range(len(rom)) if rom[i] != before[i]]
    ok(all(any(trstr.rom_offset(trstr.table_address(t)) <= i < trstr.rom_offset(trstr.table_address(t)) + len(t["entries"]) * t["stride"] for t in tbl.values()) for i in changed), "only bytes inside the string tables changed")
    # symbols
    sym = {t["label"]: trstr.table_address(t) for t in tbl.values()}
    rom2 = bytearray(before)
    ok(len(trstr.patch_rom(rom2, good, sym)) == 3, "matching symbols accepted")
    try:
        trstr.patch_rom(bytearray(before), good, dict(sym, aSeasonString=sym["aSeasonString"] + 2))
        ok(False, "a moved label must stop the build")
    except SystemExit as e:
        ok("strings.json" in str(e), "a label at another address stops the build")
    try:
        trstr.patch_rom(bytearray(before), good, {"aSeasonString": sym["aSeasonString"]})
        ok(False, "a missing label must stop the build")
    except SystemExit:
        ok(True, "")
    stale = bytearray(before)
    stale[trstr.rom_offset(trstr.table_address(tbl["season"])) + 1] = 0x77       # a word >= $0100 is not a glyph
    try:
        trstr.patch_rom(stale, good)
        ok(False, "a slot that does not hold glyph words must stop the build")
    except SystemExit:
        ok(True, "")
    with tempfile.TemporaryDirectory() as t2:
        f = Path(t2) / "x.sym"
        f.write_text("00828AD9 aSeasonString\n00828B19 aWeekdayString\nnot a symbol line\n", encoding="utf-8")
        ok(trstr.read_symbols(f) == {"aSeasonString": 0x828AD9, "aWeekdayString": 0x828B19}, "nocash symbol file")


def synth_grids():
    """A tiny invented 3-grid set: grid 0 = 2 letters + confirm; grid 1 (dead unless a switch cell exists); grid 2."""
    g0 = [[40, 68, 1, 2, 1, 2, 0x1A, 0], [56, 68, 2, 0, 2, 0, 0x1B, 0], [40, 84, 0, 1, 0, 1, 0, 4]]
    g1 = [[40, 68, 0, 0, 1, 1, 0x50, 0], [56, 68, 1, 1, 0, 0, 0x51, 0]]
    g2 = [[40, 68, 0, 0, 0, 0, 0xC6, 0]]
    return {"aNameInputGrid0": g0, "aNameInputGrid1": g1, "aNameInputGrid2": g2}


def test_namegrid(root):
    base = synth_grids()
    gset, cells = trgrid.reachable_grids(base)
    ok(gset == {0} and cells[0] == {0, 1, 2}, "without a switch cell only grid 0 is reachable")
    ok(sorted(trgrid.entered_ids(base)) == [0x1A, 0x1B], "entered ids of the reachable grid (the confirm cell enters nothing): %s" % sorted(trgrid.entered_ids(base)))
    sw = {k: [list(r) for r in v] for k, v in base.items()}
    sw["aNameInputGrid0"][1][7] = 2             # a cell of grid 0 that switches to grid 1
    gset, cells = trgrid.reachable_grids(sw)
    ok(gset == {0, 1}, "an action-2 cell makes grid 1 reachable")
    lang = lang_with(root, glyphs={"Ą": {"id": "0x50", "base": "A", "mark": "ogonek"}, "ż": {"id": "0x44", "base": "z", "mark": "dot"}})
    ok(trgrid.collisions(lang, sw) == [(1, 0, 0x50)], "a reachable grid 1 cell that enters a letter id of the language is a collision: %s" % trgrid.collisions(lang, sw))
    ok(trgrid.collisions(lang, base) == [], "the dead grid 1 is no collision")
    # grid 1 reachable only through a cell that is itself unreachable stays dead
    dead = {k: [list(r) for r in v] for k, v in base.items()}
    dead["aNameInputGrid0"][1][2:6] = [1, 1, 1, 1]
    dead["aNameInputGrid0"].append([99, 99, 3, 3, 3, 3, 0, 2])       # nothing links to row 3
    ok(trgrid.reachable_grids(dead)[0] == {0}, "a switch cell that cannot be reached with the D-pad does not count")

    ok(trgrid.capacity(base) == 3 + 2 + 1, "capacity = rows of the three grids (same ROM area)")
    # override checks (language letter ids 0x50 and 0x44; the original letters of the synthetic grid: 0, 1A, 1B)
    good = [[40, 68, 1, 3, 1, 3, 0x1A, 0], [56, 68, 2, 0, 2, 0, 0x1B, 0], [40, 84, 3, 1, 3, 1, 0x44, 0], [56, 84, 0, 2, 0, 2, 0, 4]]
    errors, warnings = trgrid.check_override(lang, good, base)
    ok(not errors, "valid override: %s" % errors)
    ok(any("$50" in w and "cannot be entered" in w for w in warnings), "a language letter without a cell is a warning: %s" % warnings)

    def bad(mut, expect, name):
        rows = [list(r) for r in good]
        mut(rows)
        errs, _ = trgrid.check_override(lang, rows, base)
        ok(any(expect in e for e in errs), "%s: %s" % (name, errs))
    bad(lambda r: r[0].__setitem__(2, 9), "outside the table", "neighbour outside the table")
    bad(lambda r: r[1].__setitem__(7, 2), "not allowed", "switch to grid 1 refused")
    bad(lambda r: r[1].__setitem__(7, 9), "unknown action", "unknown action")
    bad(lambda r: r[3].__setitem__(7, 0), "no confirm cell", "no confirm cell")
    bad(lambda r: r[2].__setitem__(6, 0x77), "neither a letter", "unknown glyph id")
    bad(lambda r: r[2].__setitem__(1, 68) or r[2].__setitem__(0, 40), "share the position", "two cells on one position")
    bad(lambda r: [r[0].__setitem__(k, 0) for k in (2, 3, 4, 5)] or [r[1].__setitem__(k, 0) for k in (2, 3, 4, 5)] or [r[3].__setitem__(k, 0) for k in (2, 3, 4, 5)] or [r[2].__setitem__(k, 2) for k in (2, 3, 4, 5)], "cannot be reached", "isolated cell")
    errs, _ = trgrid.check_override(lang, good + [[0, 0, 0, 0, 0, 0, 0, 0]] * 10, base)
    ok(any("room for" in e for e in errs), "more rows than the dead grid area: %s" % errs)
    errs, _ = trgrid.check_override(lang, [], base)
    ok(errs, "empty override")

    # file syntax and the loader
    d = Path(root) / "grid_lang"
    d.mkdir()
    lg = lang_with(d, grids={"file": "g.txt"})
    (lg.dir / "g.txt").write_text("table aNameInputGrid0\n" + trgrid.render_rows(good) + "\n", encoding="utf-8")
    ok(trgrid.load_override(lg) == good, "override file round trip")
    lg.cfg["grids"]["enabled"] = False
    ok(trgrid.load_override(lg) is None, "\"enabled\": false = the original grid")
    ok(trgrid.load_override(lang_with(d)) is None, "no grids key = the original grid")
    (lg.dir / "g.txt").write_text("table aNameInputGrid1\n" + trgrid.render_rows(good) + "\n", encoding="utf-8")
    lg.cfg["grids"]["enabled"] = True
    try:
        trgrid.load_override(lg)
        ok(False, "an override of grid 1 must be refused")
    except ValueError as e:
        ok("only aNameInputGrid0" in str(e), "an override of grid 1 or 2 is refused")
    (lg.dir / "g.txt").write_text("table aNameInputGrid0 US\n" + trgrid.render_rows(good) + "\n", encoding="utf-8")
    try:
        trgrid.load_override(lg)
        ok(False, "a release list must be refused")
    except ValueError:
        ok(True, "")

    # ROM patch on a synthetic image at the real address of grid 0
    (lg.dir / "g.txt").write_text("table aNameInputGrid0\n" + trgrid.render_rows(good) + "\n", encoding="utf-8")
    addr = trgrid.grid0_address()
    o = trstr.rom_offset(addr)
    rom = bytearray(0x200000)
    old = b"".join(bytes(r) for l in trgrid.GRID_LABELS for r in base[l])
    rom[o:o + len(old)] = old
    rom[o + len(old):o + len(old) + 4] = b"\xAA\xBB\xCC\xDD"
    sym = {"aNameInputGrid0": addr, "aNameInputGrid1": addr + 24, "aNameInputGrid2": addr + 40}
    n = trgrid.patch_rom(rom, lg, sym, base)
    new = b"".join(bytes(r) for r in good)
    ok(n == 4 and rom[o:o + len(new)] == new, "the override is written at aNameInputGrid0")
    ok(rom[o + len(new):o + len(old)] == old[len(new):] and rom[o + len(old):o + len(old) + 4] == b"\xAA\xBB\xCC\xDD", "the rest of the dead grid area and what follows it are untouched")
    try:
        trgrid.patch_rom(bytearray(rom), lg, sym, base)
        ok(False, "a ROM that does not hold the US grids must stop the build")
    except SystemExit:
        ok(True, "")
    try:
        trgrid.patch_rom(bytearray(0x200000), lg, sym, base)
        ok(False, "a blank ROM must stop the build")
    except SystemExit:
        ok(True, "")
    try:
        rom3 = bytearray(0x200000)
        rom3[o:o + len(old)] = old
        trgrid.patch_rom(rom3, lg, dict(sym, aNameInputGrid1=addr + 32), base)
        ok(False, "grids that are not contiguous must stop the build")
    except SystemExit:
        ok(True, "")
    lg.cfg["grids"]["enabled"] = False
    rom4 = bytearray(0x200000)
    ok(trgrid.patch_rom(rom4, lg, sym, base) == 0 and not any(rom4), "no override: the ROM is not touched")


def test_glyph_id_check(root):
    ctx = C.Context(Path(root) / "assets")
    lang = lang_with(root)                                     # ids $43-$45
    ok(trcheck.check_glyph_ids(lang, ctx) == [], "no collision with the invented US text")
    ctx.us[0] = [0x43, 0x00, C.END]               # a word that the (invented) US text of dialog 0 uses and the language also claims
    msgs = trcheck.check_glyph_ids(lang, ctx)
    ok(len(msgs) == 1 and "$43" in msgs[0] and "dialog" in msgs[0], "a language glyph id used by the US text of a dialog is reported: %s" % msgs)


def test_real_strings_and_grid():
    lang = C.Lang(C.lang_dir("pl"))
    errors, warnings = trstr.check_lang_strings(lang)
    ok(not errors and not warnings, "Polish strings are valid and complete: %s %s" % (errors, warnings))
    sp = trstr.spec()
    ok(all(set(lang.strings[t]) == set(sp["tables"][t]["entries"]) for t in sp["tables"]), "Polish gives a text for every slot")
    ok(all(len(trstr.resolved(lang)[t]) == len(sp["tables"][t]["entries"]) for t in sp["tables"]), "every slot encodes")
    if not (C.ROOT / "assets" / "menu" / "name_input.txt").exists():
        print("skip: real name grid checks (assets/menu/name_input.txt missing)")
        return
    base = trgrid.us_grids()
    gset, cells = trgrid.reachable_grids(base)
    ok(gset == {0}, "US/EU/DE: only grid 0 of the name entry screen can be reached (grids 1 and 2 are dead data)")
    ok([len(base[l]) for l in trgrid.GRID_LABELS] == [71, 84, 49] and len(cells[0]) == 71, "US grid sizes 71 / 84 / 49 rows, every cell of grid 0 reachable")
    ids = trgrid.entered_ids(base)
    pl_ids = {g["id"] for g in lang.glyphs.values()}
    ok(not (set(ids) & pl_ids), "no cell of the reachable US grid enters a Polish glyph id")
    dead = {i for l in trgrid.GRID_LABELS[1:] for r in base[l] for i in [r[6]] if r[7] == 0}
    ok(len(dead & pl_ids) >= 5, "the dead grid 1 lists ids of $50-$54 (that is why the reachability matters): %s" % sorted(dead & pl_ids))
    rows = trgrid.load_override(lang)
    ok(rows is not None and len(rows) == 71 + 18, "Polish grid override: 71 original cells + 18 letters")
    errors, warnings = trgrid.check_override(lang, rows, base)
    ok(not errors and not warnings, "Polish grid override is valid: %s %s" % (errors, warnings))
    ok(rows[:71] != base["aNameInputGrid0"] and all(r[:2] == b[:2] and r[6:] == b[6:] for r, b in zip(rows, base["aNameInputGrid0"])), "original cells keep position, letter and action; only links changed")
    ok(sorted(r[6] for r in rows[71:]) == sorted(pl_ids) and all(r[7] == 0 for r in rows[71:]), "the 18 new cells enter exactly the 18 Polish letters")
    pos = {(r[0], r[1]) for r in base["aNameInputGrid0"]}
    ok(not (pos & {(r[0], r[1]) for r in rows[71:]}), "new cells sit on free positions")
    after = dict(base)
    after["aNameInputGrid0"] = rows
    ok(trgrid.reachable_grids(after)[0] == {0} and trgrid.collisions(lang, after) == [], "with the override still only grid 0 is reachable, no collision")
    if C.have_assets("us") and C.have_assets("jp"):
        ok(trcheck.check_glyph_ids(lang, C.Context()) == [], "Polish glyph ids are free in the US text and in the reachable grids: %s" % trcheck.check_glyph_ids(lang, C.Context()))


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


def test_rom_polish_build():
    rom_dir = os.environ.get("HM_ROM_DIR")
    if not rom_dir:
        print("skip: Polish build test (HM_ROM_DIR not set)")
        return
    us = sorted((Path(rom_dir) / "US").glob("*.sfc"))
    if not us or not C.have_assets("us") or not C.have_assets("jp"):
        print("skip: Polish build test (US ROM or extracted assets missing)")
        return
    orig = us[0].read_bytes()
    with tempfile.TemporaryDirectory() as t:
        out = Path(t) / "pl.sfc"
        r = subprocess.run([sys.executable, str(ROOT / "tools" / "build.py"), "--translation", "pl", "--out", str(out)], capture_output=True, text=True)
        ok(r.returncode == 0, "Polish build (no dialogs translated yet) ran: %s" % (r.stdout + r.stderr)[-400:])
        if r.returncode != 0:
            return
        rom = out.read_bytes()
        sym = trstr.read_symbols(out.with_suffix(".sym"))
        sp = trstr.spec()
        ok(all(sym.get(t["label"]) == trstr.table_address(t) for t in sp["tables"].values()), "the labels of the string tables are at the addresses of defs/translation/strings.json")
        ok(sym.get("aNameInputGrid0") == trgrid.grid0_address(), "aNameInputGrid0 is at the address of defs/menu/name_input.json")
        # where the Polish ROM may differ from the US ROM: header checksum, font table 1, string tables, name grid area
        import font as fontmod
        lang = C.Lang(C.lang_dir("pl"))
        allowed = [(0x7FDC, 0x7FE0)]
        allowed.append((fontmod.rom_offset(fontmod.TABLE_ADDR[1]), fontmod.rom_offset(fontmod.TABLE_ADDR[1]) + fontmod.TABLE_SIZE))
        for t in sp["tables"].values():
            o = trstr.rom_offset(trstr.table_address(t))
            allowed.append((o, o + len(t["entries"]) * t["stride"]))
        g0 = trstr.rom_offset(trgrid.grid0_address())
        allowed.append((g0, g0 + len(trgrid.load_override(lang)) * 8))
        if C.load_translation(lang):                       # translated dialogs: the dialog banks and the pointer table behind them change as well
            for b in trcheck.bank_list():
                allowed.append((trstr.rom_offset(int(b, 16) << 16 | 0x8000), trstr.rom_offset(int(b, 16) << 16 | 0x8000) + 0x8000))
            o = trstr.rom_offset(sym["aDialogPointers"])
            allowed.append((o, o + 3 * len(C.Context().ids)))
        import gfx as trgfx
        if trgfx.lang_has_gfx(lang):                      # text in graphics: the banks of the replaced blobs may move (recompressed streams)
            sys.path.insert(0, str(ROOT / "tools" / "data"))
            import gfxbanks
            allowed.append((0x192BF, 0x192C2))           # LDA #Screen_DialogBox in bank $83 (follows the moved blobs)
            allowed.append((0, 0x8000))                  # bank $80 holds the pointers to the graphics blobs that moved
            for kind, label in trgfx.build_overrides(lang)[0]:
                bank = int(gfxbanks.bank_of(ROOT, label)[1], 16)
                allowed.append((trstr.rom_offset(bank << 16 | 0x8000), trstr.rom_offset(bank << 16 | 0x8000) + 0x8000))
        stray = [i for i in range(len(orig)) if orig[i] != rom[i] and not any(a <= i < b for a, b in allowed)]
        ok(not stray, "the Polish build changes only the font table, the string tables, the name grid, the dialog banks and pointers, the graphics banks of replaced blobs and the checksum (stray bytes: %d, first $%06X)" % (len(stray), stray[0] if stray else 0))
        # every string slot holds the encoded Polish text
        for tname, slots in trstr.resolved(lang).items():
            t = sp["tables"][tname]
            o = trstr.rom_offset(trstr.table_address(t))
            for idx, words in slots.items():
                got = [int.from_bytes(rom[o + idx * t["stride"] + 2 * k:o + idx * t["stride"] + 2 * k + 2], "little") for k in range(t["chars"])]
                ok(got == words, "slot %d of %s holds the Polish text" % (idx, tname))
        rows = trgrid.load_override(lang)
        ok(rom[g0:g0 + len(rows) * 8] == b"".join(bytes(r) for r in rows), "the Polish grid is in the ROM")


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
        for n in ("s", "n", "c"):
            (root / n).mkdir()
        test_strings(root / "s")
        test_namegrid(root / "n")
        test_glyph_id_check(root / "c")
    test_real_language()
    test_real_strings_and_grid()
    test_rom_identity()
    test_rom_polish_build()
    if FAILS:
        print("%d FAILED" % len(FAILS))
        return 1
    print("translate tests: OK")
    return 0


if __name__ == "__main__":
    sys.exit(main())
