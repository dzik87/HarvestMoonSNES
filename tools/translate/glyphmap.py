#!/usr/bin/env python3
"""Glyph map of a language: translate/<lang>/glyphs/glyph_map.json, the single source of truth for glyph ids <-> characters <-> PNG files.

Every language directory (translate/us, eu, de, jp = the four original releases, translate/pl = a translation, ...) has a `glyphs/` folder with one PNG per glyph
and this map.  The map lists EVERY glyph id of the font ($0000-$02BF, 704 ids) in order:

    {"id": "0x0043", "char": "Ą", "png": "glyph_0043.png", "width": 8, "note": "A + ogonek"}

    id      glyph id = the 16-bit dialog word that shows the glyph
    char    the Unicode character the glyph stands for in the dialog text of the language (null: the glyph has no character; the text writes it as <XXXX>)
    label   only without a character: "blank" (plain dither), "unmapped" (glyph without a reading), "duplicate" (repeats the character of another id, JP),
            "window" (dialog window tile data, ids $0280-$02BF), "<NEXT>" (next-screen marker)
    png     file name in the same folder; null = the id is the plain dither and has no PNG (label "blank")
    width   width in pixels with which the engine of the language draws the glyph (8 for US / EU / DE and every translation, 16 or 8 for JP)
    display optional, JP only: reading shown in the translation worksheet (never used by a converter)
    note    optional, region specific remark

The text converters (dialog.py, the translation tools) take the character <-> id table from the map, font.py builds the font tables from the map and the PNGs.
This module only reads, checks and writes the map; it does not need Pillow.
"""
import json
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
TRANSLATE = ROOT / "translate"
DEFS = ROOT / "defs" / "translation"
ORIGINALS = ("us", "eu", "de", "jp")
MAP_NAME = "glyph_map.json"
GLYPH_DIR = "glyphs"
N_GLYPHS = 704
N_TABLES = 11
LABELS = ("blank", "unmapped", "duplicate", "window", "<NEXT>")
FIELDS = ("id", "char", "label", "png", "width", "display", "note")
PNG_RE = re.compile(r"glyph_([0-9A-F]{4})\.png")


def png_name(gid):
    return "glyph_%04X.png" % gid


def lang_dir(code_or_path):
    """translate/<code>, or the given path if it is a directory that is not a language code."""
    if (TRANSLATE / str(code_or_path)).is_dir():
        return TRANSLATE / str(code_or_path)
    p = Path(code_or_path)
    if p.is_dir():
        return p
    return TRANSLATE / str(code_or_path)


def glyph_dir(directory):
    return Path(directory) / GLYPH_DIR


def map_path(directory):
    return glyph_dir(directory) / MAP_NAME


def has_map(directory):
    return map_path(directory).is_file()


_cache = {}


def read(directory):
    """-> the map document of a language directory (cached per file version)."""
    p = map_path(directory)
    if not p.is_file():
        raise ValueError("%s does not exist (every language needs a glyph map; docs/formats/font.md)" % p)
    st = p.stat()
    key = (str(p), st.st_mtime_ns, st.st_size)
    if key not in _cache:
        _cache.clear()
        _cache[key] = json.loads(p.read_text(encoding="utf-8"))
    return _cache[key]


def gid_of(entry):
    return int(str(entry["id"]), 0)


def entries(doc):
    """-> {glyph id: entry}"""
    return {gid_of(e): e for e in doc["glyphs"]}


def charmap(doc):
    """-> {glyph id: character} of the glyphs that have one."""
    return {gid_of(e): e["char"] for e in doc["glyphs"] if e.get("char") is not None}


def display_chars(doc):
    """-> {glyph id: character} readings for display only (JP duplicates)."""
    return {gid_of(e): e["display"] for e in doc["glyphs"] if e.get("display")}


def load_charmap(code_or_dir):
    return charmap(read(lang_dir(code_or_dir)))


# ---------------------------------------------------------------- seeds for the extraction (defs/translation/charmaps.json)
def seeds(region):
    """-> (chars {id: char}, display {id: char}) of an original release, the input of the ROM extraction."""
    d = json.loads((DEFS / "charmaps.json").read_text(encoding="utf-8"))
    conv = lambda t: {int(k, 16): v for k, v in t.items()}
    if region == "jp":
        return conv(d["jp"]), conv(d["jp_display"])
    chars = conv(d["latin"])
    chars.update(conv(d["regions"].get(region, {})))
    return chars, {}


def seed_charmap(region):
    return seeds(region)[0]


# ---------------------------------------------------------------- checking
def check(doc, directory=None):
    """-> list of error messages: structure of the map and, with `directory`, the presence of the listed PNG files (no pixel check; font.py does that)."""
    errs = []
    gl = doc.get("glyphs")
    if not isinstance(gl, list) or len(gl) != N_GLYPHS:
        return ["glyphs: expected a list of %d entries (ids 0x0000-0x%04X), got %s" % (N_GLYPHS, N_GLYPHS - 1, len(gl) if isinstance(gl, list) else type(gl).__name__)]
    seen = {}
    for n, e in enumerate(gl):
        tag = "glyph 0x%04X" % n
        extra = sorted(set(e) - set(FIELDS))
        if extra:
            errs.append("%s: unknown field(s) %s" % (tag, ", ".join(extra)))
        if e.get("id") != "0x%04X" % n:
            errs.append("%s: entry %d has id %r (entries must be in id order, written 0x%04X)" % (tag, n, e.get("id"), n))
            continue
        ch = e.get("char")
        if ch is not None:
            if not isinstance(ch, str) or len(ch) != 1 or ch in "<>\n\r":
                errs.append("%s: char %r must be one character (not < > or a line break)" % (tag, ch))
            elif ch in seen:
                errs.append("%s: character %r is already used by glyph 0x%04X (a character needs exactly one glyph)" % (tag, ch, seen[ch]))
            else:
                seen[ch] = n
        if e.get("width") not in (8, 16):
            errs.append("%s: width must be 8 or 16, got %r" % (tag, e.get("width")))
        png = e.get("png")
        if png is not None and png != png_name(n):
            errs.append("%s: png must be %s or null, got %r" % (tag, png_name(n), png))
        label = e.get("label")
        if label is not None and label not in LABELS:
            errs.append("%s: unknown label %r (%s)" % (tag, label, ", ".join(LABELS)))
        if png is None and label != "blank":
            errs.append("%s: no PNG, so the glyph must be the plain dither and carry the label \"blank\" (draw a PNG or fix the label)" % tag)
    tabs = doc.get("tables")
    if not isinstance(tabs, list) or len(tabs) != N_TABLES:
        errs.append("tables: expected %d entries" % N_TABLES)
    if directory is not None:
        gd = glyph_dir(directory)
        listed = {e["png"] for e in gl if e.get("png")}
        for name in sorted(listed):
            if not (gd / name).is_file():
                errs.append("%s is listed in the map but missing" % (gd / name))
        for p in sorted(gd.glob("glyph_*.png")):
            if p.name not in listed:
                errs.append("%s is not in the map (add it, or delete the file; a glyph without a PNG is the plain dither)" % p)
    return errs


def collisions(doc, engine_doc):
    """Characters of a translation whose id is already used by a different character of the engine release -> list of messages."""
    eng = charmap(engine_doc)
    out = []
    for gid, ch in sorted(charmap(doc).items()):
        if gid in eng and eng[gid] != ch:
            out.append("glyph $%02X: %r replaces %r of the engine release" % (gid, ch, eng[gid]))
    return out


# ---------------------------------------------------------------- lang.json of the original releases (written by the extraction)
ORIGINAL_NAMES = {"us": "English (US release)", "eu": "English (EU release)", "de": "German (DE release)", "jp": "Japanese (JP release)"}


def write_lang_json(directory, region):
    """translate/<region>/lang.json: names the files of an original release (the text, tables and glyph sources are fixed by convention; the file is documentation and a marker)."""
    doc = {"code": region, "name": ORIGINAL_NAMES[region], "kind": "original", "engine_region": region,
           "text": "dialogs.txt", "text_tables": "text_tables.json", "text_vars": "text_vars.csv", "number_vars": "../number_vars.csv",
           "glyphs": GLYPH_DIR + "/" + MAP_NAME}
    d = Path(directory)
    d.mkdir(parents=True, exist_ok=True)
    (d / "lang.json").write_text(json.dumps(doc, ensure_ascii=False, indent=1) + "\n", encoding="utf-8", newline="\n")


# ---------------------------------------------------------------- writing
def entry(gid, char=None, label=None, png=None, width=8, display=None, note=None):
    e = {"id": "0x%04X" % gid, "char": char}
    if label:
        e["label"] = label
    e["png"] = png
    e["width"] = width
    if display:
        e["display"] = display
    if note:
        e["note"] = note
    return e


def _line(obj):
    return json.dumps(obj, ensure_ascii=False, separators=(", ", ": "))


def dumps(doc):
    """Map document -> text: header fields, the 11 tables and one glyph per line (small diffs)."""
    head = [k for k in doc if k not in ("tables", "glyphs")]
    out = ["{"]
    for k in head:
        out.append(" %s: %s," % (json.dumps(k), json.dumps(doc[k], ensure_ascii=False)))
    out.append(' "tables": [')
    out.append(",\n".join("  " + _line(t) for t in doc["tables"]))
    out.append(" ],")
    out.append(' "glyphs": [')
    out.append(",\n".join("  " + _line({k: e[k] for k in FIELDS if k in e}) for e in doc["glyphs"]))
    out.append(" ]")
    out.append("}")
    return "\n".join(out) + "\n"


def write(path, doc):
    Path(path).write_text(dumps(doc), encoding="utf-8", newline="\n")
