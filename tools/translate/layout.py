#!/usr/bin/env python3
"""Folder contract of translate/<lang>/ and the scaffold of a new language.

  python tools/translate/layout.py check [--translate-dir DIR]     every language folder has the required files and a consistent lang.json
  python tools/translate/layout.py new CODE --name NAME [--base us|pl|...] [--translate-dir DIR]
                                                                   create a complete language folder from a base language

Every language folder (the four original releases and the translations) has the same structure:

  lang.json        required   code, name, kind, engine_region, text, text_tables, text_vars, number_vars, glyphs
  dialogs.txt      required   all dialogs, one block per id (`@@ sDialog_0xNNNN @@`)
  text_tables.json required   option_vram + dialog_banks (originals: first id per ROM bank; translations: banks the packer may use)
  text_vars.csv    required   the <VAR> table (WRAM address and size of every text variable)
  glyphs/          required   glyph_map.json + one PNG per glyph id (docs/formats/font.md)
  translations only, optional:  status.csv, name_grids.txt, glossary.csv, gfx/        lang.json keys: layout, autopage, status, grids, gfx, strings

`new` copies glyphs, text_tables.json and text_vars.csv of the base language, writes lang.json and a skeleton dialogs.txt with every id and an
empty body (no text of the base is copied), an empty status.csv, a glossary.csv header and gfx/.gitkeep.
"""
import argparse
import csv
import json
import re
import shutil
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import common as C                                              # noqa: E402
import glyphmap                                                 # noqa: E402

REQUIRED_KEYS = ("code", "name", "kind", "engine_region", "text", "text_tables", "text_vars", "number_vars", "glyphs")
TRANSLATION_KEYS = ("layout", "autopage", "status", "grids", "gfx", "strings", "header_title")      # optional, translations only
KINDS = ("original", "translation")
REQUIRED_FILES = ("lang.json", "dialogs.txt", "text_tables.json", "text_vars.csv")
OPTIONAL_ENTRIES = ("status.csv", "name_grids.txt", "glossary.csv", "gfx")                         # translations only
ROOT_FILES = ("README.md", "number_vars.csv")                                                      # files of translate/ itself
CODE_RE = re.compile(r"^[a-z][a-z0-9_]{1,15}$")
GLOSSARY_HEADER = "term,preferred,forbidden,note\n"
BANK_RE = re.compile(r"^[0-9A-F]{2}$")
ADDR_RE = re.compile(r"^\$[0-9A-Fa-f]{6}(\+!RAM_SHIFT)?$")


def languages(root=None):
    root = Path(root) if root else C.TRANSLATIONS
    return sorted(p for p in root.iterdir() if p.is_dir() and not p.name.startswith("."))


def _csv_rows(path):
    return list(csv.DictReader(l for l in Path(path).read_text(encoding="utf-8").splitlines() if l.strip() and not l.startswith("#")))


def check_lang(d, originals):
    """-> list of problems of one language folder.  `originals`: codes of the original releases (the possible engine releases)."""
    bad = []
    code = d.name
    p = d / "lang.json"
    if not p.is_file():
        return ["%s: lang.json is missing" % code]
    try:
        cfg = json.loads(p.read_bytes().decode("utf-8-sig"))
    except ValueError as e:
        return ["%s: lang.json is not valid JSON (%s)" % (code, e)]
    for k in REQUIRED_KEYS:
        if k not in cfg:
            bad.append("%s: lang.json has no key %r" % (code, k))
    kind = cfg.get("kind")
    if kind not in KINDS:
        bad.append("%s: lang.json kind must be one of %s" % (code, "/".join(KINDS)))
    allowed = set(REQUIRED_KEYS) | (set(TRANSLATION_KEYS) if kind == "translation" else set())
    for k in cfg:
        if k not in allowed:
            bad.append("%s: lang.json key %r is not part of the schema for kind %r" % (code, k, kind))
    if cfg.get("code") != code:
        bad.append("%s: lang.json code %r does not match the folder name" % (code, cfg.get("code")))
    eng = cfg.get("engine_region")
    if eng not in originals:
        bad.append("%s: engine_region %r is not an original release (%s)" % (code, eng, "/".join(sorted(originals))))
    if kind == "original" and eng != code:
        bad.append("%s: an original release must name itself as engine_region" % code)
    for k in ("text", "text_tables", "text_vars", "glyphs"):
        v = cfg.get(k)
        if v and not (d / v).is_file():
            bad.append("%s: lang.json %s -> %s does not exist" % (code, k, v))
    if cfg.get("number_vars") and not (d / cfg["number_vars"]).resolve().is_file():
        bad.append("%s: lang.json number_vars -> %s does not exist" % (code, cfg["number_vars"]))
    for k in REQUIRED_FILES:
        if not (d / k).is_file():
            bad.append("%s: required file %s is missing" % (code, k))
    gd = d / glyphmap.GLYPH_DIR
    if not (gd / glyphmap.MAP_NAME).is_file():
        bad.append("%s: %s/%s is missing" % (code, glyphmap.GLYPH_DIR, glyphmap.MAP_NAME))
    else:
        try:
            doc = glyphmap.read(d)
            for m in glyphmap.check(doc, d):
                bad.append("%s: glyph map: %s" % (code, m))
        except (ValueError, OSError) as e:
            bad.append("%s: glyph map: %s" % (code, e))
    ok_names = set(REQUIRED_FILES) | {glyphmap.GLYPH_DIR}
    if kind == "translation":
        ok_names |= set(OPTIONAL_ENTRIES)
    for e in sorted(d.iterdir()):
        if e.name not in ok_names:
            bad.append("%s: unexpected entry %s (%s)" % (code, e.name, "documented optional entries: " + ", ".join(OPTIONAL_ENTRIES) if kind == "translation" else "an original release has only the required entries"))
    for k in ("status", "grids"):
        v = cfg.get(k)
        f = v.get("file") if isinstance(v, dict) else v
        if f and not (d / f).is_file():
            bad.append("%s: lang.json %s -> %s does not exist" % (code, k, f))
    tt = d / cfg.get("text_tables", "text_tables.json")
    if tt.is_file():
        try:
            doc = json.loads(tt.read_text(encoding="utf-8"))
        except ValueError as e:
            doc = None
            bad.append("%s: text_tables.json is not valid JSON (%s)" % (code, e))
        if doc is not None:
            if not (isinstance(doc.get("option_vram"), list) and len(doc["option_vram"]) == 5):
                bad.append("%s: text_tables.json option_vram needs 5 values" % code)
            banks = doc.get("dialog_banks")
            if kind == "original":
                if not (isinstance(banks, dict) and banks and all(BANK_RE.match(b) and isinstance(i, int) for b, i in banks.items())):
                    bad.append("%s: text_tables.json dialog_banks of an original release is {bank: first dialog id}" % code)
            elif not (banks == "auto" or (isinstance(banks, list) and banks and all(isinstance(b, str) and BANK_RE.match(b) for b in banks))):
                bad.append("%s: text_tables.json dialog_banks of a translation is a list of banks (e.g. [\"B6\", \"B7\"]) or \"auto\"" % code)
    tv = d / cfg.get("text_vars", "text_vars.csv")
    if tv.is_file():
        try:
            rows = _csv_rows(tv)
            if not rows or [list(r) for r in rows][0] != ["idx", "address", "size"]:
                bad.append("%s: text_vars.csv needs the columns idx,address,size" % code)
            for r in rows:
                if not ADDR_RE.match(r["address"]) or not r["size"].isdigit() or not 0 < int(r["size"]) < 256:
                    bad.append("%s: text_vars.csv bad row %s" % (code, r))
        except (KeyError, ValueError) as e:
            bad.append("%s: text_vars.csv: %s" % (code, e))
    return bad


def check_layout(root=None):
    """-> (problems, [language codes]) for every folder of translate/ (or of `root`)."""
    root = Path(root) if root else C.TRANSLATIONS
    dirs = languages(root)
    bad = []
    originals = {d.name for d in dirs if (d / "lang.json").is_file() and _kind(d) == "original"}
    for d in dirs:
        bad += check_lang(d, originals)
    counts = {}
    for d in dirs:
        f = d / "text_vars.csv"
        if f.is_file():
            try:
                counts[d.name] = len(_csv_rows(f))
            except (KeyError, ValueError):
                pass
    for d in dirs:                                   # a translation keeps the variable table of its engine release (same number of rows)
        if d.name in counts and d.name not in originals and (d / "lang.json").is_file():
            eng = _cfg(d).get("engine_region")
            if eng in counts and counts[d.name] != counts[eng]:
                bad.append("%s: text_vars.csv has %d rows, the engine release %s has %d" % (d.name, counts[d.name], eng, counts[eng]))
    for f in sorted(root.iterdir()):
        if f.is_file() and f.name not in ROOT_FILES:
            bad.append("translate/: unexpected file %s" % f.name)
    return bad, [d.name for d in dirs]


def _cfg(d):
    try:
        return json.loads((d / "lang.json").read_bytes().decode("utf-8-sig"))
    except (ValueError, OSError):
        return {}


def _kind(d):
    return _cfg(d).get("kind")


def new_language(code, name, base="us", root=None, out=print):
    """Create translate/<code>/ from the language `base`; returns the folder."""
    root = Path(root) if root else C.TRANSLATIONS
    if not CODE_RE.match(code):
        raise ValueError("language code %r: lower case letters, digits and _, starting with a letter, 2-16 characters" % code)
    if not name.strip():
        raise ValueError("--name is required")
    d = root / code
    if d.exists():
        raise ValueError("%s exists already" % d)
    b = root / base
    if not (b / "lang.json").is_file():
        raise ValueError("base language %r not found in %s" % (base, root))
    bcfg = json.loads((b / "lang.json").read_bytes().decode("utf-8-sig"))
    eng = bcfg["engine_region"]
    if (b / glyphmap.GLYPH_DIR / glyphmap.MAP_NAME).is_file() is False:
        raise ValueError("base language %r has no glyphs" % base)
    d.mkdir(parents=True)
    # glyphs: PNGs byte for byte, the map with the identity of the new language
    gd = d / glyphmap.GLYPH_DIR
    gd.mkdir()
    for f in sorted((b / glyphmap.GLYPH_DIR).glob("glyph_*.png")):
        shutil.copyfile(f, gd / f.name)
    doc = glyphmap.read(b)
    doc["lang"], doc["kind"], doc["engine_region"] = code, "translation", eng
    doc["source"] = "tools/translate/layout.py new (copy of the %s glyphs)" % base
    glyphmap.write(gd / glyphmap.MAP_NAME, doc)
    # text tables: the base's own values; the bank list of a translation is the engine default unless the base already has one
    tt = json.loads((b / bcfg.get("text_tables", "text_tables.json")).read_text(encoding="utf-8"))
    banks = tt.get("dialog_banks")
    if not isinstance(banks, list):
        pl = C.Lang(b) if bcfg["kind"] == "translation" else None
        banks = pl.dialog_banks() if pl else _default_banks()
    tt = {"_doc": "Release specific values of the dialog text tables of this language (tools/translate/texttables.py).  option_vram: aTextDataTableFFFE, the VRAM word address stored in strcDialogDisplay.glyphVramAddr for the selected answer (0-4) of an <OPT n> selection menu.  dialog_banks: the ROM banks the dialog packer may fill, in order (a list of bank names, or \"auto\" = defs/translation/engine.json).",
          "option_vram": tt["option_vram"], "dialog_banks": banks}
    (d / "text_tables.json").write_text(json.dumps(tt, indent=1) + "\n", encoding="utf-8", newline="\n")
    rows = [l for l in (b / bcfg.get("text_vars", "text_vars.csv")).read_text(encoding="utf-8").splitlines() if not l.startswith("#")]
    head = ["# Dialog text variables of this language (<VAR length index>): the WRAM string the token prints (player / animal names, ...).",
            "# idx = variable index of the token; address: 24-bit address of the string in the RAM layout of the engine release; size: characters.",
            "# Generated into build/gen/text/translation/text_tables.asm (aTextDataTableFFFD) by tools/translate/texttables.py."]
    (d / "text_vars.csv").write_text("\n".join(head + rows) + "\n", encoding="utf-8", newline="\n")
    # dialogs.txt: every id of the engine release with an empty body
    ids = sorted(C.asset_blocks(eng, root)) or list(range(1176))
    (d / "dialogs.txt").write_text("\n".join("@@ sDialog_0x%04X @@\n" % i for i in ids), encoding="utf-8", newline="\n")
    (d / "status.csv").write_text("# Translation status per dialog id (todo / draft / reviewed).  Ids that are not listed are `draft` if translated, else `todo`.\nid,status,translator,note\n", encoding="utf-8", newline="\n")
    (d / "glossary.csv").write_text(GLOSSARY_HEADER, encoding="utf-8", newline="\n")
    (d / "gfx").mkdir()
    (d / "gfx" / ".gitkeep").write_text("", encoding="utf-8")
    cfg = {"code": code, "name": name, "kind": "translation", "engine_region": eng, "text": "dialogs.txt", "text_tables": "text_tables.json",
           "text_vars": "text_vars.csv", "number_vars": "../number_vars.csv", "glyphs": "glyphs/glyph_map.json",
           "layout": "wrap", "autopage": True, "status": "status.csv", "gfx": {}, "strings": {}}
    (d / "lang.json").write_text(json.dumps(cfg, ensure_ascii=False, indent=1) + "\n", encoding="utf-8", newline="\n")
    out("created %s from %s: %d glyph PNGs, %d empty dialog blocks" % (d, base, len(list(gd.glob("glyph_*.png"))), len(ids)))
    return d


def _default_banks():
    eng = C.engine()
    lo, hi = int(eng["dialog_bank_range"][0], 16), int(eng["dialog_bank_range"][1], 16)
    return ["%02X" % x for x in range(lo, hi + 1)] + list(eng["extra_free_banks"])


def main(argv=None):
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    sub = ap.add_subparsers(dest="cmd", required=True)
    c = sub.add_parser("check")
    c.add_argument("--translate-dir")
    n = sub.add_parser("new")
    n.add_argument("code")
    n.add_argument("--name", required=True)
    n.add_argument("--base", default="us")
    n.add_argument("--translate-dir")
    a = ap.parse_args(argv)
    if a.cmd == "check":
        bad, langs = check_layout(a.translate_dir)
        for m in bad:
            print("LAYOUT:", m)
        print("translate layout: %s (%s)" % ("FAILED, %d problem(s)" % len(bad) if bad else "OK", ", ".join(langs)))
        return 1 if bad else 0
    try:
        new_language(a.code, a.name, a.base, a.translate_dir)
    except (ValueError, OSError) as e:
        print("error: %s" % e, file=sys.stderr)
        return 1
    print("next: python tools/translate/translate.py check-layout; python tools/translate/glyphs.py ... (docs/translation.md, 'Adding a language')")
    return 0


if __name__ == "__main__":
    sys.exit(main())
