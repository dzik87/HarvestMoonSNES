#!/usr/bin/env python3
"""Create the DE (German) variant of banks $80-$85 as `if !REGION_DE` patch blocks inside the US sources.

One-shot migration tool. It needs the DE ROM (never stored in the repository) and rewrites the files under
src/code/bank_80..85 in place:

  * line of the US source whose bytes differ in DE are wrapped:
        if !REGION_DE
            <DE assembly, US names reused where the alignment finds the counterpart>
        else
            <original lines, untouched>
        endif
  * hex literals that point into the shifted WRAM block get `+!DE_RAM_SHIFT` appended
    (`!DE_RAM_SHIFT` is 6 for DE and 0 otherwise),
  * `src/code/de_targets.asm` receives the few `L_<addr>` equates for branch targets without a US label.

The US build is unaffected (`!REGION_DE` is 0); it is checked afterwards with tools/build.py.

Usage:
    python tools/migration/de_patch.py --de "Harvest Moon (Germany).sfc" [--dry-run]
    python tools/migration/de_patch.py --de DE.sfc --check       # build DE code banks and compare (no source change)
"""
import argparse
import hashlib
import os
import re
import shutil
import subprocess
import sys
import tempfile
from collections import defaultdict
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent.parent
sys.path.insert(0, str(ROOT / "tools" / "analysis"))
import usmap  # noqa: E402
import align_regions as AR  # noqa: E402
import de_variant as DV  # noqa: E402
from disasm65816 import lorom_off, decode  # noqa: E402

BANK_SIZE = 0x8000


def find_asar():
    for c in (os.environ.get("ASAR"), ROOT / "tools" / "bin" / "asar", shutil.which("asar")):
        if c and Path(c).is_file():
            return str(c)
    sys.exit("asar not found")


class Block:
    def __init__(self, first, last):
        self.first, self.last = first, last   # indices into the global line list (code lines)
        self.variant = None
        self.note = ""


def code_lines(lines, status):
    return [i for i in sorted(status) if lines[i].end is not None and lines[i].end > lines[i].start]


def flag_events(al, lines, status):
    """Mark lines affected by length-changing alignment events (insert/delete/replace) as diff."""
    idx = code_lines(lines, status)
    starts = [lines[i].start for i in idx]
    import bisect
    extra = 0
    for b, ops in al.ops.items():
        for tag, i1, i2, j1, j2 in ops:
            if tag == "equal" or (tag == "replace" and i2 - i1 == j2 - j1):
                continue
            lo = (b << 16) | 0x8000 | i1
            hi = (b << 16) | 0x8000 | i2
            k = bisect.bisect_right(starts, lo) - 1
            if k < 0:
                k = 0
            # lines overlapping [lo, hi) or the line starting at lo (insertions)
            while k < len(idx) and starts[k] < max(hi, lo + 1):
                ln = lines[idx[k]]
                if ln.end > lo or (i1 == i2 and ln.start >= lo):
                    if status[idx[k]] != "diff":
                        status[idx[k]] = "diff"
                        extra += 1
                    if i1 == i2:
                        break
                k += 1
    return extra


def build_blocks(lines, status, gap=2):
    idx = code_lines(lines, status)
    blocks, cur, last_pos = [], None, None
    for pos, i in enumerate(idx):
        if status[i] != "diff":
            continue
        if cur is not None and pos - last_pos <= gap + 1 and (lines[i].start >> 16) == (lines[idx[last_pos]].start >> 16):
            cur.last = pos
        else:
            cur = Block(pos, pos)
            blocks.append(cur)
        last_pos = pos
    return idx, blocks


def block_range(al, lines, idx, blk):
    first, last = lines[idx[blk.first]], lines[idx[blk.last]]
    ds = al.f_start(first.start)
    de = al.f_end(last.end)
    return ds, de


def settle_blocks(al, de_rom, lines, idx, blocks):
    """Extend blocks until their DE range decodes cleanly; returns list of (block, ds, de, insns or None)."""
    res = []
    for blk in blocks:
        for attempt in range(10):
            ds, de = block_range(al, lines, idx, blk)
            if ds is not None and de is not None and de >= ds:
                first = lines[idx[blk.first]]
                is_data = all(lines[idx[p]].kind == "data" for p in range(blk.first, blk.last + 1))
                if is_data:
                    break
                insns = DV.decode_range(de_rom, ds, de, first.m, first.x) if de > ds else []
                if insns is not None:
                    break
            if attempt % 2 == 0 and blk.last + 1 < len(idx):
                blk.last += 1
            elif blk.first > 0:
                blk.first -= 1
            elif blk.last + 1 < len(idx):
                blk.last += 1
        res.append(blk)
    # merge blocks that now touch / overlap
    res.sort(key=lambda b: b.first)
    merged = []
    for b in res:
        if merged and b.first <= merged[-1].last + 1:
            merged[-1].last = max(merged[-1].last, b.last)
        else:
            merged.append(b)
    return merged


def data_variant(res, de_rom, al, lines, idx, blk, ds, de, lm):
    """DE data for a block made of data lines. Keeps the shape of the US lines when the sizes agree.
    Labels defined inside the block are re-emitted at the matching DE position."""
    out = []
    fi, la = idx[blk.first], idx[blk.last]
    n = de - ds
    us_n = sum(lines[idx[p]].end - lines[idx[p]].start for p in range(blk.first, blk.last + 1))
    labels = [(lines[i].start, lines[i].label) for i in range(fi, la + 1)
              if lines[i].kind == "label" and not lines[i].label.startswith("..")]
    if n == us_n:
        pos = ds
        for i in range(fi, la + 1):
            ln = lines[i]
            if ln.kind == "label" and not ln.label.startswith(".."):
                t = lm.de_addr(ln.start)
                if t == pos:
                    out.append(ln.label + ":")
                continue
            if ln.kind != "data":
                continue
            m = usmap._DATA_RE.match(re.sub(r"^\s*[+\-]+\s+", "    ", ln.text))
            kind = m.group(1).lower()
            size = usmap._DATA_SIZE[kind]
            items = AR.split_items(m.group("rest").split(";")[0].strip())
            vals = []
            for k, it in enumerate(items):
                raw = de_rom[lorom_off(pos) + k * size: lorom_off(pos) + (k + 1) * size]
                v = int.from_bytes(raw, "little")
                txt = None
                if kind in ("dw", "dl") and AR.is_symbolic(it):
                    t = ((ln.start >> 16) << 16) | v if kind == "dw" else v
                    if (kind == "dl" and (t >> 16) >= 0x80) or (kind == "dw" and v >= 0x8000):
                        txt = res.rom_label(t, "")
                        if txt and "." in txt:
                            txt = None
                vals.append(txt or ("$%0*X" % (size * 2, v)))
            out.append("    %s %s" % (kind, ",".join(vals)))
            pos += size * len(items)
        return out
    cuts = {}
    for a_, name in labels:
        t = lm.de_addr(a_)
        if t is None or not (ds <= t <= de):
            continue
        cuts.setdefault(t, []).append(name)
    pos = ds
    while pos < de:
        for name in cuts.pop(pos, []):
            out.append(name + ":")
        nxt = min([c for c in cuts if c > pos] + [de, pos + 16])
        chunk = de_rom[lorom_off(pos):lorom_off(pos) + (nxt - pos)]
        out.append("    db " + ",".join("$%02X" % b for b in chunk))
        pos = nxt
    for t in sorted(cuts):
        for name in cuts[t]:
            out.append(name + ":")
    return out


def make_variants(al, de_rom, res, lm, lines, idx, blocks, equates, stats):
    scope_of = {}
    G = None
    for i, ln in enumerate(lines):
        if ln.kind == "label" and not ln.label.startswith("."):
            G = ln.label
        scope_of[i] = G
    for blk in blocks:
        ds, de = block_range(al, lines, idx, blk)
        first = lines[idx[blk.first]]
        scope = scope_of[idx[blk.first]]
        label_at, anon_at = defaultdict(list), {}
        pre_equates = []
        fi, la = idx[blk.first], idx[blk.last]
        for i in range(fi, la + 1):
            ln = lines[i]
            if ln.kind == "label" and ln.start is not None:
                if ln.label.startswith(".."):
                    continue
                t = lm.de_addr(ln.start)
                if t is None or ds is None or not (ds <= t <= de):
                    if not ln.label.startswith("."):
                        pre_equates.append("    %s = $%06X" % (ln.label, t if t is not None else ds))
                    else:
                        stats["sublabel_outside"] += 1
                        label_at[ds].append(ln.label)
                    stats["label_outside"] += 1
                    continue
                label_at[t].append(ln.label)
            elif ln.anon:
                t = al.f_start(ln.start)
                if t is not None:
                    anon_at[t] = ln.anon
        if ds is None or de is None:
            blk.variant = None
            stats["unmapped_block"] += 1
            continue
        if de == ds:
            blk.variant = ["    ; (nothing in DE)"] + pre_equates
            continue
        is_data = all(lines[idx[p]].kind == "data" for p in range(blk.first, blk.last + 1))
        if is_data:
            blk.variant = data_variant(res, de_rom, al, lines, idx, blk, ds, de, lm) + pre_equates
            stats["data_blocks"] += 1
            continue
        insns = DV.decode_range(de_rom, ds, de, first.m, first.x)
        if insns is None:
            stats["db_fallback"] += 1
            pos, out = ds, []
            while pos < de:
                ch = de_rom[lorom_off(pos):lorom_off(pos) + min(16, de - pos)]
                out.append("    db " + ",".join("$%02X" % b for b in ch))
                pos += len(ch)
            blk.variant = out
            continue
        prefix = ".de_"
        body, missed = DV.emit_code(res, de_rom, insns, scope, label_at, anon_at, prefix, equates)
        for a, labs in missed.items():
            for l in labs:
                if a == de:
                    body.append(l + ":")   # label at the very end of the block
                elif not l.startswith("."):
                    pre_equates.append("    %s = $%06X" % (l, a))
                    stats["label_not_on_boundary"] += 1
                else:
                    stats["sublabel_lost"] += 1
                    print("WARNING: sublabel %s lost in block at %s:%d" % (l, first.file, first.idx + 1))
        blk.variant = pre_equates + body
        stats["code_blocks"] += 1
    return blocks


def apply_to_sources(lines, idx, blocks, status, dry=False):
    """Rewrite the module files. Returns dict file -> new text."""
    block_at = {}
    for blk in blocks:
        if blk.variant is None:
            continue
        block_at[idx[blk.first]] = blk
    outs = defaultdict(list)
    i = 0
    N = len(lines)
    while i < N:
        ln = lines[i]
        blk = block_at.get(i)
        if blk is not None:
            last = idx[blk.last]
            # include trailing labels/blank lines that precede the next code line? no: stop at last code line
            # leading label/blank lines directly before the block stay outside
            outs[ln.file].append("    if !REGION_DE")
            outs[ln.file] += blk.variant
            outs[ln.file].append("    else")
            for k in range(i, last + 1):
                outs[lines[k].file].append(rewrite_line(lines[k], status.get(k)))
            outs[ln.file].append("    endif")
            i = last + 1
            continue
        outs[ln.file].append(rewrite_line(ln, status.get(i)))
        i += 1
    return {rel: "\n".join(v) for rel, v in outs.items()}


def rewrite_data_line(ln):
    t = ln.text
    code, sep, cmt = t.partition(";")
    m = re.match(r"^(\s*(?:[+\-]+\s+)?(?:db|dw|dl|dd)\s+)(.*)$", code, re.I)
    pre, rest = m.group(1), m.group(2).rstrip()
    items = AR.split_items(rest)
    for k in ln.ritems:
        items[k] = items[k] + "+!DE_RAM_SHIFT"
    code2 = pre + ",".join(items)
    return code2.rstrip() + (" " * max(1, 59 - len(code2.rstrip())) + sep + cmt if sep else "")


def rewrite_line(ln, st):
    if st != "ramlit":
        return ln.text
    if ln.kind == "data":
        return rewrite_data_line(ln)
    t = ln.text
    code, sep, cmt = t.partition(";")
    m = re.search(r"\$([0-9A-Fa-f]{2,6})(?![0-9A-Fa-f])", re.sub(r"^\s*[+\-]*\s*[A-Za-z]+(\.[BWL])?", "", code))
    if not m:
        return t
    pre = re.sub(r"^\s*[+\-]*\s*[A-Za-z]+(\.[BWL])?", "", code)
    start = len(code) - len(pre) + m.start()
    end = len(code) - len(pre) + m.end()
    code2 = code[:end] + "+!DE_RAM_SHIFT" + code[end:]
    # keep the trailing comment column roughly aligned
    return code2.rstrip() + (" " * max(1, 59 - len(code2.rstrip())) + sep + cmt if sep else "")


def write_sources(texts):
    for rel, txt in texts.items():
        (ROOT / "src" / "code" / rel).write_text(txt, encoding="utf-8", newline="\n")


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--de", required=True, type=Path)
    ap.add_argument("--dry-run", action="store_true")
    args = ap.parse_args()
    de_rom = args.de.read_bytes()
    us, syms = AR.build_us_rom()
    al = AR.Aligner(us, de_rom)
    lines = usmap.load_us_source(us)
    status = AR.classify_lines(al, lines, de_rom)
    extra = flag_events(al, lines, status)
    idx, blocks = build_blocks(lines, status)
    blocks = settle_blocks(al, de_rom, lines, idx, blocks)
    inside = set()
    for blk in blocks:
        inside.update(range(idx[blk.first], idx[blk.last] + 1))
    lm = AR.LabelMap(al, lines, de_rom, inside)
    res = DV.NameResolver(lines, syms, al, de_rom, lm)
    equates = set()
    stats = defaultdict(int)
    make_variants(al, de_rom, res, lm, lines, idx, blocks, equates, stats)
    ramlit = sum(1 for s in status.values() if s == "ramlit")
    print("blocks:", len(blocks), "extra flagged by events:", extra, "ramlit lines:", ramlit, dict(stats),
          "equates:", len(equates))
    if args.dry_run:
        for blk in blocks[:5]:
            print("---", lines[idx[blk.first]].file, lines[idx[blk.first]].idx + 1)
            print("\n".join(blk.variant or ["(none)"]))
        return 0
    texts = apply_to_sources(lines, idx, blocks, status)
    write_sources(texts)
    eq = ["; Branch targets of the DE patch blocks that have no label in the US sources.",
          "if !REGION_DE"] + ["    L_%06X = $%06X" % (t, t) for t in sorted(equates)] + ["endif", ""]
    (ROOT / "src" / "code" / "de_targets.asm").write_text("\n".join(eq), encoding="utf-8", newline="\n")
    return 0


if __name__ == "__main__":
    sys.exit(main())
