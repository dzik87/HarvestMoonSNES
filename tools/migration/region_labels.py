#!/usr/bin/env python3
"""One-off migration: raw region addresses in `if !REGION_xx` blocks of src/code/bank_80/tilemaps.asm -> blob labels.

The data banks of every release contain the same blobs in the same order as US (tools/data/regionbanks.py), so a
pointer to a regional blob is just the US label; the assembler relocates it.  Blocks whose branches become identical to
the US text are collapsed (innermost first).  Needs the ROM images (HM_ROM_DIR); kept for reference.
"""
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / "tools" / "data"))
import regionbanks as RB  # noqa: E402

REG = {"!REGION_DE": "DE", "!REGION_EU": "EU", "!REGION_JP": "JP"}
norm = lambda l: re.sub(r"\s+", " ", l.split(";")[0]).strip()
nonempty = lambda ls: [norm(x) for x in ls if norm(x)]


def parse_block(L, i):
    """L[i] is `if ...`; -> (branches [(cond, lines)], index after the endif)"""
    branches, cond, cur, depth = [], L[i].strip()[3:].strip(), [], 0
    i += 1
    while True:
        s = L[i].strip()
        if s.startswith("if "):
            depth += 1
        if depth == 0 and (s.startswith("elseif ") or s == "else" or s == "endif"):
            branches.append((cond, cur)); cur = []
            if s == "endif":
                return branches, i + 1
            cond = s[7:].strip() if s.startswith("elseif") else "else"
        else:
            if s == "endif" and depth:
                depth -= 1
            cur.append(L[i])
        i += 1


def labelize(lines, region, addr):
    out = []
    for x in lines:
        m = re.match(r"^(\s*dl )\$([0-9A-F]{6})\s*$", x)
        if m:
            v = int(m.group(2), 16)
            if v not in addr[region]:
                return None
            x = m.group(1) + addr[region][v]
        out.append(x)
    return out


def proc(L, addr, stats):
    out, i = [], 0
    while i < len(L):
        if not re.match(r"^\s*if !REGION_", L[i]):
            out.append(L[i]); i += 1
            continue
        branches, i = parse_block(L, i)
        branches = [(k, proc(c, addr, stats)) for k, c in branches]          # inner blocks first
        els = next(c for k, c in branches if k == "else")
        ok = True
        for k, c in branches:
            if k == "else":
                continue
            r = REG.get(k)
            new = labelize(c, r, addr) if r else None
            if new is None or nonempty(new) != nonempty(els):
                ok = False; break
        if ok:
            out += els; stats["collapsed"] += 1
        else:
            stats["kept"] += 1
            for n, (k, c) in enumerate(branches):
                out.append(("    if " if n == 0 else "    elseif ") + k if k != "else" else "    else")
                out += c
            out.append("    endif")
    return out


def main():
    roms = RB.find_roms()
    addr = {}
    for r in RB.REGIONS:
        m = {}
        for b in RB.GFX_BANKS:
            for pl, us, c in RB.classify(roms["US"], roms[r], b):
                if pl.entry.kind != "padding":
                    m[(int(b, 16) << 16) | pl.addr] = pl.entry.label
        addr[r] = m
    p = ROOT / "src/code/bank_80/tilemaps.asm"
    stats = {"collapsed": 0, "kept": 0}
    out = proc(p.read_text(encoding="utf-8").split("\n"), addr, stats)
    p.write_text("\n".join(out), encoding="utf-8", newline="\n")
    print(stats)


if __name__ == "__main__":
    main()
