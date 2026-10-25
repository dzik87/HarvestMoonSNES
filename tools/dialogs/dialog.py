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
always lossless. The JP glyph table is tools/dialogs/glyphs/jp.json.

Text files (assets/dialogs/<region>/bank_XX.txt): one block per dialog (the label is the same in every release):
    @@ sDialog_0x0000 @@
    text with <tokens>      (line breaks are only cosmetic and ignored when packing)

The text files are the only source.  `build` generates the assembler input (git-ignored)
build/gen/dialogs/<region>/bank_XX.asm, which src/main.asm includes for the selected release
(US/EU/DE: banks $B6-$BB, JP: banks $AA-$AC).  The dialog pointer table aDialogPointers refers to the labels, so the
dialogs may change length freely; every bank is padded with `fill align $8000`.

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
        g = json.loads((Path(__file__).parent / "glyphs" / "jp.json").read_text(encoding="utf-8"))["glyphs"]
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
