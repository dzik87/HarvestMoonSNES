#!/usr/bin/env python3
"""String tables of a translation: the plain glyph-id strings of the US engine that are not dialogs (season, weekday, day ordinal, year ordinal).

  translations/<lang>/lang.json   "strings": {"season": {"spring": "...", "2": "..."}, "weekday": {...}, ...}
  defs/translation/strings.json   the tables: asar label, US address, slot stride, characters per slot, keys of the slots

A table is an array of fixed size slots of 16-bit glyph words; the engine reads only the first `chars` words of a slot (the text variables of the dialogs print
exactly that many cells), so a string may be shorter (it is padded with the space glyph) but never longer.  The translation build writes the encoded words into the
assembled ROM (`patch_rom`, called from tools/translate/build.py `post_process`), the original four releases are never touched.

  python tools/translate/strings.py list            the tables, widths and keys
  python tools/translate/strings.py check pl        validate the `strings` of a language (characters, widths, keys)
"""
import argparse
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import common as C                                          # noqa: E402

SPEC = C.DEFS / "strings.json"


def spec():
    return C.read_json(SPEC)


def pad_glyph(sp=None):
    return int((sp or spec())["pad_glyph"], 16)


def table_address(t):
    return int(t["rom"].lstrip("$"), 16)


def rom_offset(addr):
    """SNES LoROM address -> file offset"""
    return ((addr >> 16) & 0x7F) * 0x8000 + (addr & 0x7FFF)


def slot_index(tbl, key):
    """key (label, decimal index or int) -> slot index or None"""
    ent = tbl["entries"]
    if isinstance(key, int):
        return key if 0 <= key < len(ent) else None
    if key in ent:
        return ent.index(key)
    if str(key).isdigit() and int(key) < len(ent):
        return int(key)
    return None


def encode(lang, text, chars, sp=None):
    """text -> (list of exactly `chars` glyph words, errors).  Characters of the language charmap, `<XXXX>` = raw glyph id (hex, 4 digits); the rest is padded with the space glyph."""
    sp = sp or spec()
    rev = {c: k for k, c in lang.charmap.items() if c not in "<>"}
    words, errors, pos = [], [], 0
    while pos < len(text):
        ch = text[pos]
        if ch == "<":
            m = C.TOKEN.match(text, pos)
            if not m or not C.HEX4.match(m.group(1).strip()):
                errors.append("only <XXXX> (raw glyph id) is allowed as a token in a string, found %r" % text[pos:pos + 8])
                return [], errors
            words.append(int(m.group(1).strip(), 16))
            pos = m.end()
        elif ch == " ":
            words.append(C.SPACE)
            pos += 1
        elif ch in rev:
            words.append(rev[ch])
            pos += 1
        else:
            errors.append("character %r (U+%04X) is not in the character map of %s" % (ch, ord(ch), lang.code))
            return [], errors
    if len(words) > chars:
        errors.append("%d characters, at most %d fit" % (len(words), chars))
        return [], errors
    if not words or all(w == C.SPACE for w in words):
        errors.append("empty string")
        return [], errors
    return words + [pad_glyph(sp)] * (chars - len(words)), errors


def check_lang_strings(lang, sp=None):
    """-> (errors, warnings) for lang.strings; every message starts with 'strings.<table>.<key>:'"""
    sp = sp or spec()
    errors, warnings = [], []
    for tname, entries in lang.strings.items():
        tbl = sp["tables"].get(tname)
        if tbl is None:
            errors.append("strings.%s: unknown table (known: %s)" % (tname, ", ".join(sp["tables"])))
            continue
        if not isinstance(entries, dict):
            errors.append("strings.%s: must be an object {key: text}" % tname)
            continue
        seen = {}
        for key, text in entries.items():
            where = "strings.%s.%s" % (tname, key)
            idx = slot_index(tbl, key)
            if idx is None:
                errors.append("%s: unknown key (known: %s, or an index 0-%d)" % (where, ", ".join(tbl["entries"]), len(tbl["entries"]) - 1))
                continue
            if idx in seen:
                errors.append("%s: the same slot is also given as %r" % (where, seen[idx]))
                continue
            seen[idx] = key
            if not isinstance(text, str):
                errors.append("%s: the value must be a string" % where)
                continue
            _, errs = encode(lang, text, tbl["chars"], sp)
            errors += ["%s: %s" % (where, e) for e in errs]
        missing = [e for i, e in enumerate(tbl["entries"]) if i not in seen]
        if missing and seen:
            warnings.append("strings.%s: no text for %s (stays as in the US release)" % (tname, ", ".join(missing)))
    return errors, warnings


def resolved(lang, sp=None):
    """-> {table: {slot index: [words]}} for the valid strings of the language (errors are skipped; use check_lang_strings first)"""
    sp = sp or spec()
    out = {}
    for tname, entries in lang.strings.items():
        tbl = sp["tables"].get(tname)
        if tbl is None or not isinstance(entries, dict):
            continue
        for key, text in entries.items():
            idx = slot_index(tbl, key)
            if idx is None or not isinstance(text, str):
                continue
            words, errs = encode(lang, text, tbl["chars"], sp)
            if not errs:
                out.setdefault(tname, {})[idx] = words
    return out


def patch_rom(rom, lang, symbols=None, sp=None):
    """Write the strings of the language into an assembled US ROM (bytearray).  `symbols` = {label: SNES address} of the assembled ROM (optional);
    when given, a table whose label has another address than the one in defs/translation/strings.json stops the build.  Before a slot is written the code
    checks that the old slot looks like a glyph word array (every word < $0100).  -> list of (table, slots written)."""
    sp = sp or spec()
    done = []
    for tname, slots in resolved(lang, sp).items():
        tbl = sp["tables"][tname]
        addr = table_address(tbl)
        if symbols is not None:
            got = symbols.get(tbl["label"])
            if got is None:
                raise SystemExit("strings: label %s of table %r is not in the symbol file" % (tbl["label"], tname))
            if got != addr:
                raise SystemExit("strings: label %s is at $%06X in this build, defs/translation/strings.json says $%06X; fix the spec" % (tbl["label"], got, addr))
        base = rom_offset(addr)
        for idx, words in sorted(slots.items()):
            o = base + idx * tbl["stride"]
            old = [int.from_bytes(rom[o + 2 * k:o + 2 * k + 2], "little") for k in range(tbl["chars"])]
            if any(w > 0xFF for w in old):
                raise SystemExit("strings: slot %d of %s at $%06X does not hold glyph words (stale spec or wrong ROM)" % (idx, tname, addr + idx * tbl["stride"]))
            for k, w in enumerate(words):
                rom[o + 2 * k:o + 2 * k + 2] = w.to_bytes(2, "little")
        done.append((tname, sorted(slots)))
    return done


def read_symbols(path):
    """asar `--symbols=nocash` file -> {label: address}"""
    out = {}
    for line in Path(path).read_bytes().decode("utf-8", errors="replace").splitlines():
        parts = line.split(None, 1)
        if len(parts) == 2 and len(parts[0]) == 8 and all(c in "0123456789ABCDEFabcdef" for c in parts[0]):
            out.setdefault(parts[1].strip(), int(parts[0], 16))
    return out


def main(argv=None):
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    sub = ap.add_subparsers(dest="cmd", required=True)
    sub.add_parser("list")
    c = sub.add_parser("check")
    c.add_argument("lang")
    a = ap.parse_args(argv)
    sp = spec()
    if a.cmd == "list":
        for n, t in sp["tables"].items():
            print("%-13s %s $%06X  %d slots x %d chars (stride %d)  keys: %s" % (n, t["label"], table_address(t), len(t["entries"]), t["chars"], t["stride"], " ".join(t["entries"])))
        return 0
    lang = C.Lang(C.lang_dir(a.lang))
    errors, warnings = check_lang_strings(lang, sp)
    for m in errors:
        print("ERROR   " + m)
    for m in warnings:
        print("warning " + m)
    print("strings %s: %d error(s), %d warning(s)" % (lang.code, len(errors), len(warnings)))
    return 1 if errors else 0


if __name__ == "__main__":
    sys.exit(main())
