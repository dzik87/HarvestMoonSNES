#!/usr/bin/env python3
"""Dialog converter: ROM word streams <-> editable text, byte-exact round trip.

Dialog banks ($B6-$BB for US/EU/DE, $AA-$AC for JP) are sequences of 16-bit words per dialog label
(sDialog<REGION>_0xNNNN). Word values below $FFF0 are glyph ids; control words:
    $00A2          <NEXT>      wait for button, next screen (same value as the glyph index of the "next" marker)
    $FFFC n i      <NUM n i>   numeric variable, n = digit count, i = variable index
    $FFFD n i      <VAR n i>   text variable (e.g. player name), n = length, i = variable index
    $FFFE n        <OPT n>     selection menu with n options (ends the dialog text)
    $FFFF          <END>       end of dialog
Glyph ids with a known character are written as that character (src/common/charmap.asm plus region extras);
every other id (including repeated glyphs of the JP table) is written as <XXXX> (hex) so that the conversion is
always lossless. The JP glyph table is defs/dialogs/charmap_jp.json.

Text files (assets/dialogs/<region>/bank_XX.txt): one block per dialog (the label is the same in every release):
    @@ sDialog_0x0000 @@
    text with <tokens>      (line breaks are only cosmetic and ignored when packing)

The text files are the only source.  `build` generates the assembler input (git-ignored)
build/gen/dialogs/<region>/bank_XX.asm, which src/main.asm includes for the selected release
(US/EU/DE: banks $B6-$BB, JP: banks $AA-$AC).  The dialog pointer table aDialogPointers refers to the labels, so the
dialogs may change length freely; every bank is padded with `fill align $8000`.

Extraction from the user's ROM dumps: tools/extract.py (step `dialogs`) calls extract_rom() below: the dialog texts, the tables
of the dialog engine (option cursor positions, numeric / text variable tables) and the layout defs/dialogs/tables.json.

Commands:
    build [--region R]     txt -> build/gen/dialogs/<region>/bank_XX.asm (canonical `dw` rows)
    check [--region R]     every text parses, fits its 32 KB bank, and re-renders to the same text (used by CI)
"""
import argparse, json, re, sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
OUT = ROOT / "assets" / "dialogs"
GEN = ROOT / "build" / "gen" / "dialogs"
BANK_SIZE = 0x8000
REGIONS = {"us": "US", "eu": "EU", "de": "DE", "jp": "JP"}
NEXT, NUMV, TEXTV, OPTS, END = 0x00A2, 0xFFFC, 0xFFFD, 0xFFFE, 0xFFFF
EXTRA = {
    "all": {0x3F: "…", 0x42: "♥"},
    "de": {0x43: "ä", 0x44: "ö", 0x45: "ü", 0x46: "Ä", 0x47: "Ö", 0x48: "Ü", 0x49: "ß", 0x4A: "+"},
    "eu": {0x43: "+"},
}


def load_charmap(region):
    m = {}
    for line in (ROOT / "src" / "common" / "charmap.asm").read_text(encoding="utf-8").splitlines():
        mm = re.match(r"^'(.)' = \$([0-9A-Fa-f]{2})\s*$", line)
        if mm:
            m[int(mm.group(2), 16)] = mm.group(1)
    if region != "jp":
        m.update(EXTRA["all"]); m.update(EXTRA.get(region, {}))
    else:
        m = {}
        g = json.loads((ROOT / "defs" / "dialogs" / "charmap_jp.json").read_text(encoding="utf-8"))["glyphs"]
        m.update({int(k, 16): v for k, v in g.items()})
    return m


def bank_files(region):
    return sorted((OUT / region).glob("bank_*.txt"))


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


def render_asm(bank, blocks):
    org = (int(bank, 16) << 16) | 0x8000
    lines = [f"; Dialog bank ${bank} - generated by tools/dialogs/dialog.py build from assets/dialogs/<region>/bank_{bank}.txt", "",
             f"    ORG ${org:06X}", ""]
    for label, words in blocks:
        lines.append(f"{label}:")
        for k in range(0, len(words), 6):
            lines.append("    dw " + ",".join("$%04X" % w for w in words[k:k + 6]))
        lines.append("")
    lines += [f"Padding_{bank}0000:", "    fill align $8000", ""]
    return "\n".join(lines)


# ---------------------------------------------------------------- extraction (ROM -> assets/dialogs)
NUMBER_HEADER = """# Dialog numeric variables (<NUM digits index> in the dialog text, handler .FFFC_numberVariable in src/code/bank_83/dialog.asm).
# idx: variable index of the text token; address: 24-bit address of the value (`+!RAM_SHIFT` = WRAM that moves with the release's RAM layout); size: bytes read (1-3).
# Identical in all releases.  Generated into build/gen/dialogs/<region>/text_tables.asm (aTextDataTableFFFC) by tools/dialogs/texttables.py.
idx,address,size
"""
TEXTVAR_HEADER = """# Dialog text variables (<VAR length index>, handler .FFFD_textVariable in src/code/bank_83/dialog.asm): the WRAM string the token prints
# (player / animal names, ...).  idx = variable index of the token; address: 24-bit address of the string (the name buffers move with the release's RAM layout, so every release has its own file); size: characters.
# Generated into build/gen/dialogs/%s/text_tables.asm (aTextDataTableFFFD) by tools/dialogs/texttables.py.
idx,address,size
"""
TABLES_DOC = ("Release specific values of the dialog text tables (tools/dialogs/texttables.py).  option_vram: aTextDataTableFFFE, the VRAM word "
              "address stored in strcDialogDisplay.dialogUnk185 for the selected answer (0-4) of an <OPT n> selection menu.")


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
    """dialog texts of one release -> out/bank_XX.txt (one block per dialog).  Verifies that re-assembling the blocks gives the ROM bank."""
    cmap = load_charmap(region)
    o = _off(_addr(tdef["pointers"]))
    n = tdef["count"]
    ptrs = [int.from_bytes(rom[o + 3 * i:o + 3 * i + 3], "little") for i in range(n)]
    banks = {}
    expect = ptrs[0]
    for i, p in enumerate(ptrs):
        if p != expect and not (p & 0xFFFF == 0x8000 and p >> 16 > expect >> 16):      # the next dialog may start the next bank
            raise ValueError("%s: dialog %04X starts at $%06X, previous one ends at $%06X" % (region, i, p, expect))
        words, expect = _dialog_words(rom, p)
        banks.setdefault("%02X" % (p >> 16), []).append(("sDialog_0x%04X" % i, words))
    if sorted(banks) != sorted(tdef["dialog_banks"]):
        raise ValueError("%s: dialogs found in banks %s, expected %s" % (region, sorted(banks), tdef["dialog_banks"]))
    out = Path(out)
    out.mkdir(parents=True, exist_ok=True)
    for bank, blocks in sorted(banks.items()):
        base = _off(int(bank, 16) << 16 | 0x8000)
        data = b"".join(w.to_bytes(2, "little") for _, ws in blocks for w in ws)
        if rom[base:base + len(data)] != data or any(rom[base + len(data):base + BANK_SIZE]):
            raise ValueError("%s bank $%s: dialog blocks do not reproduce the bank (data after the last dialog)" % (region, bank))
        text = "\n".join("@@ %s @@\n%s" % (label, words_to_text(ws, cmap)) for label, ws in blocks)
        (out / ("bank_%s.txt" % bank)).write_bytes(text.encode("utf-8"))
    return n


def extract_tables(R, rom, tdef, shared, shifted, out):
    """text_tables.json + text_vars.csv of release R; the numeric variable rows go to `shared` {R: rows} for number_vars.csv (written by the caller)."""
    out = Path(out)
    o = _off(_addr(tdef["option_vram"]))
    opts = ["$%04X" % (rom[o + 2 * i] | rom[o + 2 * i + 1] << 8) for i in range(5)]
    doc = {"_doc": TABLES_DOC, "option_vram": opts}
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
    """ROM images {"US": bytes, ...} -> assets/dialogs (out): <region>/bank_XX.txt, text_tables.json, text_vars.csv and number_vars.csv.
    Layout of the tables: defs/dialogs/tables.json."""
    d = json.loads((Path(defs) / "dialogs" / "tables.json").read_text(encoding="utf-8"))
    shifted = json.loads((Path(defs) / "dialogs" / "text_vars_shifted.json").read_text(encoding="utf-8"))
    out = Path(out)
    shared = {}
    n = 0
    for R, rom in roms.items():
        t = dict(d[R], count=d["dialog_count"], number_count=d["number_var_count"])
        reg = R.lower()
        n += extract_dialogs(reg, rom, t, out / reg)
        extract_tables(R, rom, t, shared, shifted, out / reg)
    if "US" in shared:
        (out / "number_vars.csv").write_bytes(number_vars_csv(shared, d).encode("utf-8"))
    return n


def regions(arg):
    return [arg] if arg else list(REGIONS)


def load_blocks(r, f):
    cmap = load_charmap(r)
    return [(label, text_to_words(t, cmap)) for label, t in read_txt(f)]


def cmd_build(a):
    for r in regions(a.region):
        out = GEN / r
        out.mkdir(parents=True, exist_ok=True)
        for f in bank_files(r):
            bank = f.stem.split("_")[1]
            blocks = load_blocks(r, f)
            if sum(len(w) * 2 for _, w in blocks) > BANK_SIZE:
                raise SystemExit(f"{f}: text does not fit into a 32 KB bank")
            (out / f"bank_{bank}.asm").write_text(render_asm(bank, blocks), encoding="utf-8", newline="\n")
    print("dialog banks generated in", GEN.relative_to(ROOT))
    return 0


def cmd_check(a):
    bad = 0
    for r in regions(a.region):
        n, cmap = 0, load_charmap(r)
        for f in bank_files(r):
            try:
                blocks = load_blocks(r, f)
                size = sum(len(w) * 2 for _, w in blocks)
                if size > BANK_SIZE:
                    raise ValueError(f"{size} bytes do not fit into a bank")
                for (label, words), (_, text) in zip(blocks, read_txt(f)):
                    if text_to_words(words_to_text(words, cmap), cmap) != words:
                        raise ValueError(f"{label}: text does not round trip")
                n += len(blocks)
            except ValueError as e:
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

