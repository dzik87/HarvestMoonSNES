#!/usr/bin/env python3
"""Build side of the translations: translated dialogs -> generated assembler input, and the post processing of the assembled ROM.

Called by `python tools/build.py --region US --translation pl` (docs/translation.md); can also be run on its own:

  python tools/translate/build.py gen pl [--fallback us|error] [--allow-errors]     write build/gen/text/translation/*.asm (dialog banks + text tables)
  python tools/translate/build.py post pl build/HarvestMoon_US_pl.sfc [--symbols FILE]   patch glyph tables, string tables, name grid, header title and checksum of an assembled ROM

`gen` packs the dialogs of the language in id order into the banks $B6..$BF (then $AA-$AC) without splitting a dialog; ids without a translation use the US words
(--fallback us, default) so the ROM builds at every stage.  `post` writes the generated letters into the font tables of the ROM image, the translated string tables (lang.json "strings", tools/translate/strings.py) and the name
entry grid override (lang.json "grids", tools/translate/namegrid.py), optionally the header title (lang.json "header_title"), and fixes the header checksum; the four original releases
are never touched by this code.
"""
import argparse
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import check                                                # noqa: E402
import common as C                                          # noqa: E402
import glyphs as G                                          # noqa: E402
import namegrid as NG                                       # noqa: E402
import strings as ST                                        # noqa: E402

sys.path.insert(0, str(C.ROOT / "tools" / "translate"))
import texttables                                           # noqa: E402

GEN_DIR = C.ROOT / "build" / "gen" / "text" / "translation"
HEADER_CHECKSUM = 0x7FDC            # file offset of the complement + checksum words (LoROM header $FFDC)
HEADER_TITLE = 0x7FC0


def fix_checksum(rom):
    """SNES header checksum of a power-of-two ROM: sum of all bytes with complement = $FFFF and checksum = $0000 in the header."""
    rom[HEADER_CHECKSUM:HEADER_CHECKSUM + 4] = b"\xFF\xFF\x00\x00"
    s = sum(rom) & 0xFFFF
    rom[HEADER_CHECKSUM:HEADER_CHECKSUM + 2] = (s ^ 0xFFFF).to_bytes(2, "little")
    rom[HEADER_CHECKSUM + 2:HEADER_CHECKSUM + 4] = s.to_bytes(2, "little")
    return s


def dialog_words(lang, ctx, rep, fallback):
    """{id: words} of the finished ROM"""
    out, missing = {}, []
    for i in ctx.ids:
        if i in rep.words:
            out[i] = rep.words[i]
        elif fallback == "us":
            out[i] = ctx.us[i]
        else:
            missing.append(i)
    if missing:
        raise SystemExit("%d dialog(s) are not translated and --fallback error was given (first: 0x%04X)" % (len(missing), missing[0]))
    return out


def generate(lang, ctx, fallback="us", allow_errors=False, gen_dir=GEN_DIR, tables=True, out=print):
    """Write the dialog banks (and, with tables=True, the text tables) -> summary dict."""
    rep = check.check_lang(lang, ctx)
    for i, m in rep.errors:
        out("ERROR %s %s" % ("0x%04X:" % i if i >= 0 else "", m))
    if rep.errors and not allow_errors:
        raise SystemExit("the translation has %d error(s); fix them (tools/translate/check.py %s) or build with --allow-errors" % (len(rep.errors), lang.code))
    words = dialog_words(lang, ctx, rep, fallback)
    banks = check.bank_list()
    try:
        where, used = check.bank_plan({i: len(w) * 2 for i, w in words.items()}, ctx.ids, banks)
    except OverflowError as e:
        raise SystemExit("capacity: %s" % e)
    gen_dir = Path(gen_dir)
    gen_dir.mkdir(parents=True, exist_ok=True)
    for b in banks:
        blocks = [("sDialog_0x%04X" % i, words[i]) for i in ctx.ids if where[i] == b]
        if blocks:
            text = C.dialog.render_asm(b, blocks).replace("assets/dialogs/<region>/bank_%s.txt" % b, "translate/%s/" % lang.code)
        else:
            text = "; Dialog bank $%s - unused by this translation\n\n    ORG $%s8000\n" % (b, b)
        (gen_dir / ("bank_%s.asm" % b)).write_text(text, encoding="utf-8", newline="\n")
    if tables:
        (gen_dir / "text_tables.asm").write_text(texttables.render(C.ROOT, lang.engine_region), encoding="utf-8", newline="\n")
    n_tr = len(rep.words)
    return {"translated": n_tr, "total": len(ctx.ids), "fallback": len(ctx.ids) - n_tr, "bytes": sum(used.values()), "banks": used,
            "errors": len(rep.errors), "warnings": len(rep.warnings)}


def post_process(rom, lang, symbols=None):
    """Patch an assembled ROM (bytearray): generated glyphs, string tables, name entry grid, header title, checksum
    -> (checksum, list of patched font tables, info dict {"strings": [(table, slots)], "grid_rows": n}).
    `symbols` = {label: address} of the assembled ROM (asar --symbols=nocash); with it the addresses of defs/translation/strings.json and defs/menu/name_input.json are verified."""
    from_tables = G.engine_tables(lang.engine_region)
    new_tables = G.apply_glyphs(from_tables, G.build_glyphs(lang, from_tables))
    sys.path.insert(0, str(C.ROOT / "tools" / "translate"))
    import font
    patched = []
    for t, (a, b) in enumerate(zip(from_tables, new_tables)):
        if a != b:
            o = font.rom_offset(font.TABLE_ADDR[t])
            if bytes(rom[o:o + font.TABLE_SIZE]) != a:
                raise SystemExit("font table %d in the ROM does not match the extracted font (wrong region or stale assets)" % t)
            rom[o:o + font.TABLE_SIZE] = b
            patched.append(t)
    info = {"strings": ST.patch_rom(rom, lang, symbols), "grid_rows": NG.patch_rom(rom, lang, symbols)}
    title = lang.cfg.get("header_title")
    if title:
        raw = title.encode("ascii")[:21].ljust(21, b" ")
        rom[HEADER_TITLE:HEADER_TITLE + 21] = raw
    return fix_checksum(rom), patched, info


def main(argv=None):
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    sub = ap.add_subparsers(dest="cmd", required=True)
    g = sub.add_parser("gen"); g.add_argument("lang"); g.add_argument("--fallback", choices=("us", "error"), default="us"); g.add_argument("--allow-errors", action="store_true")
    p = sub.add_parser("post"); p.add_argument("lang"); p.add_argument("rom"); p.add_argument("--symbols", help="asar symbol file (--symbols=nocash) of the assembled ROM: verifies the table addresses")
    a = ap.parse_args(argv)
    lang = C.Lang(C.lang_dir(a.lang))
    if a.cmd == "gen":
        s = generate(lang, C.Context(), a.fallback, a.allow_errors)
        print("generated %d bytes in %d bank(s); %d of %d dialogs translated, %d from the US text" % (s["bytes"], len(s["banks"]), s["translated"], s["total"], s["fallback"]))
    else:
        rom = bytearray(Path(a.rom).read_bytes())
        chk, patched, info = post_process(rom, lang, ST.read_symbols(a.symbols) if a.symbols else None)
        Path(a.rom).write_bytes(rom)
        print("patched font table(s) %s, %d string slot(s), %d name grid row(s), checksum $%04X" % (patched, sum(len(x[1]) for x in info["strings"]), info["grid_rows"], chk))
    return 0


if __name__ == "__main__":
    sys.exit(main())
