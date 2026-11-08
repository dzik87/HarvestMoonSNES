#!/usr/bin/env python3
"""Tests of the language folder contract and the scaffold (tools/translate/layout.py).  Run: python3 tests/test_layout.py

Uses translate/us (committed) as the base of temporary languages; invented codes only, no ROM needed.
"""
import json
import shutil
import sys
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT / "tools" / "translate"))
import common as C                                       # noqa: E402
import layout as L                                       # noqa: E402
import texttables as TT                                  # noqa: E402
import check as trcheck                                  # noqa: E402
import glyphmap                                          # noqa: E402

FAILS = []


def ok(cond, msg):
    print(("ok   " if cond else "FAIL ") + msg)
    if not cond:
        FAILS.append(msg)


def problems(root):
    return L.check_layout(root)[0]


def edit_json(p, fn):
    d = json.loads(p.read_text(encoding="utf-8"))
    fn(d)
    p.write_text(json.dumps(d, indent=1), encoding="utf-8")


def test_repository():
    bad, langs = L.check_layout()
    ok(not bad, "translate/ of the repository follows the folder contract: %s" % bad[:3])
    ok({"us", "eu", "de", "jp", "pl"} <= set(langs), "all languages are checked: %s" % langs)
    for code in langs:
        d = C.TRANSLATIONS / code
        ok(all((d / n).is_file() for n in L.REQUIRED_FILES) and (d / "glyphs" / "glyph_map.json").is_file(), "%s has the required files" % code)
        cfg = json.loads((d / "lang.json").read_text(encoding="utf-8-sig"))
        ok(all(k in cfg for k in L.REQUIRED_KEYS), "%s: lang.json has all required keys" % code)


def test_scaffold(tmp):
    root = tmp / "translate"
    root.mkdir()
    shutil.copytree(C.TRANSLATIONS / "us", root / "us")
    shutil.copyfile(C.TRANSLATIONS / "number_vars.csv", root / "number_vars.csv")
    ok(not problems(root), "temporary root with one original release is consistent")
    msgs = []
    d = L.new_language("xx", "Invented", "us", root, out=msgs.append)
    ok(d == root / "xx" and not problems(root), "new language from us passes the layout check: %s" % problems(root)[:2])
    cfg = json.loads((d / "lang.json").read_text(encoding="utf-8"))
    ok(cfg["code"] == "xx" and cfg["name"] == "Invented" and cfg["kind"] == "translation" and cfg["engine_region"] == "us", "lang.json identity")
    ok(list(cfg)[:9] == list(L.REQUIRED_KEYS), "lang.json starts with the required keys in order")
    n = len(list((root / "us" / "glyphs").glob("glyph_*.png")))
    ok(len(list((d / "glyphs").glob("glyph_*.png"))) == n and n > 0, "all %d glyph PNGs of the base copied" % n)
    gm = json.loads((d / "glyphs" / "glyph_map.json").read_text(encoding="utf-8"))
    ok(gm["lang"] == "xx" and gm["kind"] == "translation", "glyph map carries the new language")
    ok((d / "gfx" / ".gitkeep").is_file() and (d / "glossary.csv").read_text(encoding="utf-8").startswith("term,"), "gfx/.gitkeep and the glossary header")
    ok(len(glyphmap.read(d)["glyphs"]) == 704, "map readable")
    text = (d / "dialogs.txt").read_text(encoding="utf-8")
    heads = [l for l in text.split("\n") if l.startswith("@@")]
    ok(len(heads) == 1176 and heads[0] == "@@ sDialog_0x0000 @@" and heads[-1] == "@@ sDialog_0x0497 @@", "skeleton has all 1176 ids")
    ok(all(not l.strip() for l in text.split("\n") if not l.startswith("@@")), "skeleton contains no text")
    lang = C.Lang(d)
    ok(C.load_translation(lang) == {}, "empty blocks count as not translated")
    ok(lang.dialog_banks() == trcheck.bank_list(), "banks of a language made from an original: the engine default")
    # a language made from a translation inherits its tables
    d2 = L.new_language("yy", "Second", "xx", root, out=msgs.append)
    ok(not problems(root) and C.Lang(d2).dialog_banks() == lang.dialog_banks(), "language made from a translation is consistent")
    for args, why in ((("xx", "Again", "us"), "existing folder"), (("Bad", "x", "us"), "bad code"), (("zz", "", "us"), "empty name"), (("zz", "x", "nope"), "unknown base")):
        try:
            L.new_language(*args, root=root, out=msgs.append)
            ok(False, "refused: " + why)
        except ValueError:
            ok(True, "refused: " + why)
    # the language owns its tables: texttables.render reads them from the language folder
    base = TT.render(ROOT, "us", C.Lang(root / "us"))
    ok(TT.render(ROOT, "us") == base and TT.render(ROOT, "us", lang) == base, "unchanged copies render the same tables as the release")
    rows = (d / "text_vars.csv").read_text(encoding="utf-8").split("\n")
    i = next(k for k, r in enumerate(rows) if r and not r.startswith("#") and not r.startswith("idx"))
    a, adr, sz = rows[i].split(",")
    rows[i] = "%s,%s,%d" % (a, adr, int(sz) + 1)
    (d / "text_vars.csv").write_text("\n".join(rows), encoding="utf-8")
    edit_json(d / "text_tables.json", lambda t: t.update(option_vram=["$0001", "$0002", "$0003", "$0004", "$0005"], dialog_banks=["B6", "B7"]))
    mine = TT.render(ROOT, "us", C.Lang(d))
    ok(mine != base and "dw $0001,$0002,$0003,$0004,$0005" in mine and "db $%02X" % (int(sz) + 1) in mine, "a language changes option_vram and a variable size in its own files")
    ok(TT.render(ROOT, "us") == base, "the release tables stay unchanged")
    ok(trcheck.bank_list(C.Lang(d)) == ["B6", "B7"] and len(trcheck.bank_list()) == 13, "dialog_banks of the language limit the packer")
    edit_json(d / "text_tables.json", lambda t: t.update(dialog_banks="auto"))
    ok(C.Lang(d).dialog_banks() == trcheck.bank_list() and not problems(root), "dialog_banks auto = engine default")


def broken(tmp, name, mutate, expect):
    root = tmp / name
    root.mkdir()
    shutil.copytree(C.TRANSLATIONS / "us", root / "us")
    shutil.copyfile(C.TRANSLATIONS / "number_vars.csv", root / "number_vars.csv")
    L.new_language("xx", "Invented", "us", root, out=lambda m: None)
    mutate(root / "xx")
    bad = problems(root)
    ok(any(expect in m for m in bad), "%s is reported (%s)" % (name, expect))


def test_violations(tmp):
    broken(tmp, "missing text_vars.csv", lambda d: (d / "text_vars.csv").unlink(), "text_vars.csv")
    broken(tmp, "missing dialogs.txt", lambda d: (d / "dialogs.txt").unlink(), "dialogs.txt")
    broken(tmp, "missing glyph map", lambda d: (d / "glyphs" / "glyph_map.json").unlink(), "glyph_map.json")
    broken(tmp, "missing png", lambda d: (d / "glyphs" / "glyph_0044.png").unlink(), "glyph_0044.png")
    broken(tmp, "missing lang.json key", lambda d: edit_json(d / "lang.json", lambda c: c.pop("text_tables")), "no key 'text_tables'")
    broken(tmp, "old key name", lambda d: edit_json(d / "lang.json", lambda c: c.update(dialogs="dialogs.txt")), "key 'dialogs'")
    broken(tmp, "code mismatch", lambda d: edit_json(d / "lang.json", lambda c: c.update(code="qq")), "does not match the folder")
    broken(tmp, "bad kind", lambda d: edit_json(d / "lang.json", lambda c: c.update(kind="x")), "kind must be")
    broken(tmp, "unknown engine release", lambda d: edit_json(d / "lang.json", lambda c: c.update(engine_region="qq")), "engine_region")
    broken(tmp, "bad dialog_banks", lambda d: edit_json(d / "text_tables.json", lambda c: c.update(dialog_banks={"B6": 0})), "dialog_banks")
    broken(tmp, "option_vram size", lambda d: edit_json(d / "text_tables.json", lambda c: c.update(option_vram=["$1"])), "option_vram")
    broken(tmp, "stray file", lambda d: (d / "notes.txt").write_text("x"), "unexpected entry notes.txt")
    broken(tmp, "bad var row", lambda d: (d / "text_vars.csv").write_text("idx,address,size\n$00,xyz,8\n"), "text_vars.csv")
    broken(tmp, "row count", lambda d: (d / "text_vars.csv").write_text("idx,address,size\n$00,$8008DD,8\n"), "rows")


def main():
    test_repository()
    with tempfile.TemporaryDirectory() as t:
        tmp = Path(t)
        (tmp / "s").mkdir()
        test_scaffold(tmp / "s")
        (tmp / "v").mkdir()
        test_violations(tmp / "v")
    if FAILS:
        print("%d FAILED" % len(FAILS))
        return 1
    print("layout tests: OK")
    return 0


if __name__ == "__main__":
    sys.exit(main())
