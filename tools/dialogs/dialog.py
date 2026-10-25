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

Text files (assets/dialogs/<region>/bank_XX.txt): one block per dialog:
    @@ sDialogUS_0x0000 @@
    text with <tokens>      (line breaks are only cosmetic and ignored when packing)

Commands:
    extract [--region R]   asm -> txt
    emit-asm [--region R]  txt -> asm (canonical `dw` rows)
    check [--region R]     txt -> words must equal the words in the current asm (used by CI)
"""
import argparse, json, re, sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
SRC = ROOT / "src" / "data" / "dialogs"
OUT = ROOT / "assets" / "dialogs"
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
    return sorted((SRC / region).glob("bank_*.asm"))


def parse_asm(path):
    """-> (org, [(label, [words])], pad_bytes_all_zero, total_bytes)"""
    text = path.read_text(encoding="utf-8")
    org = int(re.search(r"ORG \$([0-9A-Fa-f]+)", text).group(1), 16)
    blocks, cur, pad = [], None, None
    for line in text.splitlines():
        line = re.sub(r";.*", "", line).rstrip()
        m = re.match(r"^([A-Za-z_]\w*):$", line)
        if m:
            if m.group(1).startswith("Padding_"):
                cur = None; pad = []
            else:
                cur = (m.group(1), []); blocks.append(cur)
            continue
        m = re.match(r"^\s*fill (\d+)$", line)
        if m:
            if pad is None:
                raise ValueError(f"{path}: fill outside padding")
            pad.extend([0] * int(m.group(1)))
            continue
        m = re.match(r"^\s*(dw|db) (.*)$", line)
        if m:
            vals = [int(x, 16) for x in re.findall(r"\$([0-9A-Fa-f]+)", m.group(2))]
            if m.group(1) == "dw":
                cur[1].extend(vals)
            else:
                if pad is None:
                    raise ValueError(f"{path}: db data outside padding")
                pad.extend(vals)
    return org, blocks, pad


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


def render_asm(org, blocks, pad_len, bank):
    lines = [f"; Dialog bank ${bank} - generated by tools/dialogs/dialog.py emit-asm from assets/dialogs/*/bank_{bank}.txt", "",
             f"    ORG ${org:06X}", ""]
    for label, words in blocks:
        lines.append(f"{label}:")
        for k in range(0, len(words), 6):
            lines.append("    dw " + ",".join("$%04X" % w for w in words[k:k + 6]))
        lines.append("")
    if pad_len:
        lines += [f"Padding_{bank}0000:", f"    fill {pad_len}", ""]
    return "\n".join(lines)


def regions(arg):
    return [arg] if arg else list(REGIONS)


def cmd_extract(a):
    for r in regions(a.region):
        cmap = load_charmap(r)
        (OUT / r).mkdir(parents=True, exist_ok=True)
        for f in bank_files(r):
            org, blocks, pad = parse_asm(f)
            total = sum(len(w) * 2 for _, w in blocks) + len(pad or [])
            if total != BANK_SIZE or (pad and any(pad)):
                raise SystemExit(f"{f}: unexpected layout (total {total}, padding nonzero={bool(pad and any(pad))})")
            body = []
            for label, words in blocks:
                body.append(f"@@ {label} @@\n" + words_to_text(words, cmap).rstrip("\n") + "\n")
            (OUT / r / f.with_suffix(".txt").name).write_text("\n".join(body), encoding="utf-8", newline="\n")
        print(f"[{r}] extracted {len(bank_files(r))} banks")


def load_txt_blocks(r, f):
    cmap = load_charmap(r)
    txt = OUT / r / f.with_suffix(".txt").name
    return [(label, text_to_words(t, cmap)) for label, t in read_txt(txt)]


def cmd_emit(a):
    for r in regions(a.region):
        for f in bank_files(r):
            org, _, pad = parse_asm(f)
            blocks = load_txt_blocks(r, f)
            pad_len = BANK_SIZE - sum(len(w) * 2 for _, w in blocks)
            f.write_text(render_asm(org, blocks, pad_len, f.stem.split("_")[1]), encoding="utf-8", newline="\n")
        print(f"[{r}] wrote asm")


def cmd_check(a):
    bad = 0
    for r in regions(a.region):
        n = 0
        for f in bank_files(r):
            org, blocks, pad = parse_asm(f)
            new = load_txt_blocks(r, f)
            n += len(new)
            if [(l, w) for l, w in blocks] != new:
                print(f"MISMATCH {r}/{f.name}"); bad += 1
        print(f"[{r}] {n} dialogs checked")
    print("dialog check:", "FAILED" if bad else "OK")
    return 1 if bad else 0


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    sub = ap.add_subparsers(dest="cmd", required=True)
    for c in ("extract", "emit-asm", "check"):
        s = sub.add_parser(c); s.add_argument("--region", choices=sorted(REGIONS))
    a = ap.parse_args()
    return {"extract": cmd_extract, "emit-asm": cmd_emit, "check": cmd_check}[a.cmd](a) or 0


if __name__ == "__main__":
    sys.exit(main())
