#!/usr/bin/env python3
"""Dialog converter: ROM word streams <-> editable text, byte-exact round trip.

Dialog banks ($B6-$BB for US/EU/DE, $AA-$AC for JP) are sequences of 16-bit words per dialog label
(sDialog<REGION>_0xNNNN). Word values below $FFF0 are glyph ids; control words:
    $00A2          <NEXT>      wait for button, next screen (same value as the glyph index of the "next" marker)
    $FFFC n i      <NUM n i>   numeric variable, n = digit count, i = variable index
    $FFFD n i      <VAR n i>   text variable (e.g. player name), n = length, i = variable index
    $FFFE n        <OPT n>     selection menu with n options (ends the dialog text)
    $FFFF          <END>       end of dialog
Glyph ids with a known character are written as that character;
every other id (including repeated glyphs of the JP table) is written as <XXXX> (hex) so that the conversion is
always lossless. The characters of a language are its glyph map translate/<region>/glyphs/glyph_map.json (tools/translate/glyphmap.py).

Text file (translate/<region>/dialogs.txt, all dialogs of a release in id order; the block syntax is the one of the dialogs.txt of a translation): one block per dialog (the label is the same in every release):
    @@ sDialog_0x0000 @@
    text with <tokens>      (line breaks are only cosmetic and ignored when packing)

The text files are the only source.  `build` generates the assembler input (git-ignored)
build/gen/text/<region>/bank_XX.asm, which src/main.asm includes for the selected release
(US/EU/DE: banks $B6-$BB, JP: banks $AA-$AC).  The dialog pointer table aDialogPointers refers to the labels, so the
dialogs may change length freely; every bank is padded with `fill align $8000`.

Extraction from the user's ROM dumps: tools/extract.py (step `dialogs`) calls extract_rom() below: the dialog texts, the tables
of the dialog engine (option cursor positions, numeric / text variable tables) and the layout defs/translation/tables.json.

Commands:
    build [--region R]     txt -> build/gen/text/<region>/bank_XX.asm (canonical `dw` rows)
    check [--region R]     every text parses, fits its 32 KB bank, and re-renders to the same text (used by CI)
"""
import argparse, json, re, sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import glyphmap                                                    # noqa: E402

ROOT = Path(__file__).resolve().parents[2]
OUT = glyphmap.TRANSLATE
GEN = ROOT / "build" / "gen" / "text"
BANK_SIZE = 0x8000
REGIONS = {"us": "US", "eu": "EU", "de": "DE", "jp": "JP"}
NEXT, NUMV, TEXTV, OPTS, END = 0x00A2, 0xFFFC, 0xFFFD, 0xFFFE, 0xFFFF


def load_charmap(region):
    """glyph id -> character of a language: the glyph map translate/<region>/glyphs/glyph_map.json (tools/translate/glyphmap.py)."""
    return glyphmap.load_charmap(region)


def dialogs_file(region, root=None):
    """translate/<region>/dialogs.txt: all dialogs of a release in one file, one block per id (same block syntax as the dialogs.txt of a translation)."""
    return (Path(root) if root else OUT) / region / "dialogs.txt"


def bank_starts(region, root=None):
    """-> [(bank 'B6', first dialog id)] in bank order: which dialogs sit in which ROM bank (text_tables.json "dialog_banks", written by the extraction)."""
    p = (Path(root) if root else OUT) / region / "text_tables.json"
    d = json.loads(p.read_text(encoding="utf-8")).get("dialog_banks", {})
    return sorted(((b, int(i)) for b, i in d.items()), key=lambda x: x[1])


def split_banks(blocks, starts):
    """blocks [(label, words|text)] in id order -> {bank: blocks}; bank k holds the ids from its first id up to the first id of the next bank."""
    out = {}
    for k, (bank, first) in enumerate(starts):
        last = starts[k + 1][1] if k + 1 < len(starts) else len(blocks)
        out[bank] = blocks[first:last]
    return out


def words_to_text(words, cmap):
    out, i, n = [], 0, len(words)
    while i < n:
        w = words[i]; i += 1
        if w == NEXT:
            out.append("<NEXT>\n")
        elif w in (NUMV, TEXTV):
            if i + 1 >= n + 0 and i + 2 > n:
                raise ValueError("truncated variable token")
            out.append("<%s %d %d>" % ("NUM" if w == NUMV else "VAR", words[i], words[i + 1])); i += 2
        elif w == OPTS:
            out.append("<OPT %d>\n" % words[i]); i += 1
        elif w == END:
            out.append("<END>\n")
        elif w in cmap and cmap[w] not in "<>":
            out.append(cmap[w])
        else:
            out.append("<%04X>" % w)
    return "".join(out)


TOKEN = re.compile(r"<(NEXT|END|NUM \d+ \d+|VAR \d+ \d+|OPT \d+|[0-9A-F]{4})>")


def text_to_words(text, cmap):
    rev = {c: k for k, c in cmap.items() if c not in "<>"}
    words, pos = [], 0
    text = text.replace("\r", "")
    while pos < len(text):
        ch = text[pos]
        if ch == "\n":
            pos += 1; continue
        if ch == "<":
            m = TOKEN.match(text, pos)
            if not m:
                raise ValueError(f"bad token near {text[pos:pos+20]!r}")
            t = m.group(1); pos = m.end()
            if t == "NEXT": words.append(NEXT)
            elif t == "END": words.append(END)
            elif t.startswith("NUM"): _, a, b = t.split(); words += [NUMV, int(a), int(b)]
            elif t.startswith("VAR"): _, a, b = t.split(); words += [TEXTV, int(a), int(b)]
            elif t.startswith("OPT"): words += [OPTS, int(t.split()[1])]
            else: words.append(int(t, 16))
            continue
        if ch not in rev:
            raise ValueError(f"unmapped character {ch!r}")
        words.append(rev[ch]); pos += 1
    return words


def read_txt(path):
    blocks, label, buf = [], None, []
    for line in path.read_text(encoding="utf-8").split("\n"):
        m = re.match(r"^@@ (\w+) @@$", line)
        if m:
            if label is not None:
                blocks.append((label, "\n".join(buf)))
            label, buf = m.group(1), []
        elif label is not None:
            buf.append(line)
    if label is not None:
        blocks.append((label, "\n".join(buf)))
    return blocks


def render_asm(bank, blocks, source=None):
    org = (int(bank, 16) << 16) | 0x8000
    source = source or f"translate/<region>/bank_{bank}.txt"
    lines = [f"; Dialog bank ${bank} - generated by tools/translate/dialog.py build from {source}", "",
             f"    ORG ${org:06X}", ""]
    for label, words in blocks:
        lines.append(f"{label}:")
        for k in range(0, len(words), 6):
            lines.append("    dw " + ",".join("$%04X" % w for w in words[k:k + 6]))
        lines.append("")
    lines += [f"Padding_{bank}0000:", "    fill align $8000", ""]
    return "\n".join(lines)


# ---------------------------------------------------------------- extraction (ROM -> translate/<region>)
NUMBER_HEADER = """# Dialog numeric variables (<NUM digits index> in the dialog text, handler .FFFC_numberVariable in src/code/bank_83/dialog.asm).
# idx: variable index of the text token; address: 24-bit address of the value (`+!RAM_SHIFT` = WRAM that moves with the release's RAM layout); size: bytes read (1-3).
# Identical in all releases.  Generated into build/gen/text/<region>/text_tables.asm (aTextDataTableFFFC) by tools/translate/texttables.py.
idx,address,size
"""
TEXTVAR_HEADER = """# Dialog text variables (<VAR length index>, handler .FFFD_textVariable in src/code/bank_83/dialog.asm): the WRAM string the token prints
# (player / animal names, ...).  idx = variable index of the token; address: 24-bit address of the string (the name buffers move with the release's RAM layout, so every release has its own file); size: characters.
# Generated into build/gen/text/%s/text_tables.asm (aTextDataTableFFFD) by tools/translate/texttables.py.
idx,address,size
"""
TABLES_DOC = ("Release specific values of the dialog text tables (tools/translate/texttables.py).  option_vram: aTextDataTableFFFE, the VRAM word "
              "address stored in strcDialogDisplay.glyphVramAddr for the selected answer (0-4) of an <OPT n> selection menu.  dialog_banks: the first dialog id of every ROM "
              "bank that holds dialogs (translate/<region>/dialogs.txt is cut at these ids, every bank is padded to $8000).")


def _off(addr):
    return ((addr >> 16) & 0x7F) * BANK_SIZE + (addr & 0x7FFF)


def _addr(s):
    return int(s[1:], 16)


def read_var_table(rom, addr, n):
    """n x [ptr24, size] -> [(address, size)]"""
    o = _off(addr)
    return [(int.from_bytes(rom[o + 4 * i:o + 4 * i + 3], "little"), rom[o + 4 * i + 3]) for i in range(n)]


def _dialog_words(rom, addr):
    """words of one dialog starting at the 24-bit address (up to and including <END> / the <OPT n> that ends the text)."""
    bank = addr & 0xFF0000
    out = []
    while True:
        o = _off(bank | (addr & 0xFFFF))
        w = rom[o] | rom[o + 1] << 8
        out.append(w)
        addr += 2
        if w in (NUMV, TEXTV):
            for _ in range(2):
                o = _off(bank | (addr & 0xFFFF))
                out.append(rom[o] | rom[o + 1] << 8)
                addr += 2
        elif w == OPTS:
            o = _off(bank | (addr & 0xFFFF))
            out.append(rom[o] | rom[o + 1] << 8)
            addr += 2
            return out, addr
        elif w == END:
            return out, addr
        if addr & 0xFFFF < 0x8000:
            raise ValueError("dialog runs out of its bank")


def extract_dialogs(region, rom, tdef, out):
    """dialog texts of one release -> out/dialogs.txt (one block per dialog, all banks in id order).  Verifies that re-assembling the blocks gives the ROM banks.
    -> (number of dialogs, {bank: first dialog id}); the bank assignment is stored in text_tables.json by extract_tables."""
    cmap = glyphmap.seed_charmap(region)        # the ROM has no characters: defs/translation/charmaps.json, which the font extraction writes into the glyph map
    o = _off(_addr(tdef["pointers"]))
    n = tdef["count"]
    ptrs = [int.from_bytes(rom[o + 3 * i:o + 3 * i + 3], "little") for i in range(n)]
    banks, first = {}, {}
    expect = ptrs[0]
    for i, p in enumerate(ptrs):
        if p != expect and not (p & 0xFFFF == 0x8000 and p >> 16 > expect >> 16):      # the next dialog may start the next bank
            raise ValueError("%s: dialog %04X starts at $%06X, previous one ends at $%06X" % (region, i, p, expect))
        words, expect = _dialog_words(rom, p)
        bank = "%02X" % (p >> 16)
        first.setdefault(bank, i)
        banks.setdefault(bank, []).append(("sDialog_0x%04X" % i, words))
    if sorted(banks) != sorted(tdef["dialog_banks"]):
        raise ValueError("%s: dialogs found in banks %s, expected %s" % (region, sorted(banks), tdef["dialog_banks"]))
    out = Path(out)
    out.mkdir(parents=True, exist_ok=True)
    blocks = []
    for bank, bl in sorted(banks.items()):
        base = _off(int(bank, 16) << 16 | 0x8000)
        data = b"".join(w.to_bytes(2, "little") for _, ws in bl for w in ws)
        if rom[base:base + len(data)] != data or any(rom[base + len(data):base + BANK_SIZE]):
            raise ValueError("%s bank $%s: dialog blocks do not reproduce the bank (data after the last dialog)" % (region, bank))
        blocks += bl
    text = "\n".join("@@ %s @@\n%s" % (label, words_to_text(ws, cmap)) for label, ws in blocks)
    (out / "dialogs.txt").write_bytes(text.encode("utf-8"))
    return n, first


def extract_tables(R, rom, tdef, shared, shifted, out, bank_first):
    """text_tables.json + text_vars.csv of release R; the numeric variable rows go to `shared` {R: rows} for number_vars.csv (written by the caller)."""
    out = Path(out)
    o = _off(_addr(tdef["option_vram"]))
    opts = ["$%04X" % (rom[o + 2 * i] | rom[o + 2 * i + 1] << 8) for i in range(5)]
    doc = {"_doc": TABLES_DOC, "option_vram": opts, "dialog_banks": dict(sorted(bank_first.items()))}
    (out / "text_tables.json").write_bytes((json.dumps(doc, indent=1) + "\n").encode("utf-8"))
    nvars = (_addr(tdef["pointers"]) - _addr(tdef["text_vars"])) // 4
    rows = read_var_table(rom, _addr(tdef["text_vars"]), nvars)
    moved = set(shifted.get(R, ()))
    text = TEXTVAR_HEADER % R.lower() + "".join("$%02X,$%06X%s,%d\n" % (i, a - (tdef["ram_shift"] if i in moved else 0), "+!RAM_SHIFT" if i in moved else "", sz)
                                                for i, (a, sz) in enumerate(rows))
    (out / "text_vars.csv").write_bytes(text.encode("utf-8"))
    shared[R] = read_var_table(rom, _addr(tdef["number_vars"]), tdef["number_count"])


def number_vars_csv(shared, defs_tables):
    """number_vars.csv: identical in all releases except for WRAM above $08D1, which moves with the release's RAM layout (`+!RAM_SHIFT`)."""
    us = shared["US"]
    rows = []
    for i, (a, sz) in enumerate(us):
        moved = False
        for r in ("EU", "DE", "JP"):
            if r not in shared:
                continue
            ra, rsz = shared[r][i]
            shift = defs_tables[r]["ram_shift"]
            if rsz != sz or ra not in (a, a + shift):
                raise ValueError("number variable %02X of %s differs from US in a way !RAM_SHIFT does not explain" % (i, r))
            moved |= ra != a
        rows.append("$%02X,$%06X%s,%d\n" % (i, a, "+!RAM_SHIFT" if moved else "", sz))
    return NUMBER_HEADER + "".join(rows)


def extract_rom(roms, defs, out):
    """ROM images {"US": bytes, ...} -> the translate/ tree (out): <region>/dialogs.txt, text_tables.json, text_vars.csv, lang.json and number_vars.csv.
    Layout of the tables: defs/translation/tables.json."""
    d = json.loads((Path(defs) / "translation" / "tables.json").read_text(encoding="utf-8"))
    shifted = json.loads((Path(defs) / "translation" / "text_vars_shifted.json").read_text(encoding="utf-8"))
    out = Path(out)
    shared = {}
    n = 0
    for R, rom in roms.items():
        t = dict(d[R], count=d["dialog_count"], number_count=d["number_var_count"])
        reg = R.lower()
        glyphmap.write_lang_json(out / reg, reg)
        k, first = extract_dialogs(reg, rom, t, out / reg)
        n += k
        extract_tables(R, rom, t, shared, shifted, out / reg, first)
    if "US" in shared:
        (out / "number_vars.csv").write_bytes(number_vars_csv(shared, d).encode("utf-8"))
    return n


def regions(arg):
    return [arg] if arg else list(REGIONS)


def load_blocks(r, f=None):
    """-> [(label, words)] of translate/<r>/dialogs.txt in id order."""
    cmap = load_charmap(r)
    return [(label, text_to_words(t, cmap)) for label, t in read_txt(f or dialogs_file(r))]


def check_ids(blocks):
    ids = [int(label.rsplit("_0x", 1)[1], 16) for label, _ in blocks]
    if ids != list(range(len(ids))):
        raise ValueError("dialog ids are not contiguous 0..%d in file order" % (len(ids) - 1))


def cmd_build(a):
    for r in regions(a.region):
        out = GEN / r
        out.mkdir(parents=True, exist_ok=True)
        blocks = load_blocks(r)
        check_ids(blocks)
        for bank, bl in split_banks(blocks, bank_starts(r)).items():
            if sum(len(w) * 2 for _, w in bl) > BANK_SIZE:
                raise SystemExit(f"{dialogs_file(r)}: the dialogs of bank ${bank} do not fit into 32 KB")
            (out / f"bank_{bank}.asm").write_text(render_asm(bank, bl, f"translate/{r}/dialogs.txt"), encoding="utf-8", newline="\n")
    print("dialog banks generated in", GEN.relative_to(ROOT))
    return 0


def cmd_check(a):
    bad = 0
    for r in regions(a.region):
        n, cmap = 0, load_charmap(r)
        f = dialogs_file(r)
        try:
            blocks = load_blocks(r)
            check_ids(blocks)
            for bank, bl in split_banks(blocks, bank_starts(r)).items():
                size = sum(len(w) * 2 for _, w in bl)
                if size > BANK_SIZE:
                    raise ValueError(f"bank ${bank}: {size} bytes do not fit into a bank")
            for (label, words), (_, text) in zip(blocks, read_txt(f)):
                if text_to_words(words_to_text(words, cmap), cmap) != words:
                    raise ValueError(f"{label}: text does not round trip")
            n += len(blocks)
        except (ValueError, OSError) as e:
            print(f"FAIL {r}/{f.name}: {e}"); bad += 1
        print(f"[{r}] {n} dialogs checked")
    print("dialog check:", "FAILED" if bad else "OK")
    return 1 if bad else 0


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    sub = ap.add_subparsers(dest="cmd", required=True)
    for c in ("build", "check"):
        s = sub.add_parser(c); s.add_argument("--region", choices=sorted(REGIONS))
    a = ap.parse_args()
    return {"build": cmd_build, "check": cmd_check}[a.cmd](a) or 0


if __name__ == "__main__":
    sys.exit(main())

