#!/usr/bin/env python3
"""Create the regional variants (EU, DE, JP) of banks $80-$85 as patch blocks inside the US sources.

Migration/regeneration tool. It needs the regional ROM dumps (never stored in the repository) and rewrites the
files under src/code/bank_80..85 and src/code/region_targets.asm in place:

  * The sources are first reduced to the plain US text (patch blocks removed, the `+!RAM_SHIFT` suffixes dropped),
    so the tool can be re-run at any time and always produces a consistent result.
  * The regions are processed in layers (see LAYERS). In a layer the lines of the US source whose bytes differ in at
    least one region are wrapped in a block; every region of the layer that differs gets its own text (the
    disassembly of the region's bytes, with US label and RAM names reused), and regions with identical text are
    merged into one condition:

        if !REGION_EUDE            ; DE and EU share this change
            <DE/EU assembly>
        elseif !REGION_JP
            <JP assembly>
        else
            <original US lines, untouched>
        endif

    A later layer wraps its blocks around the output of the earlier layers (an outer block of a later layer ends up
    around earlier blocks in its `else` branch; when the `else` branch is exactly one inner block the tool flattens
    the two into an `elseif`).
  * Hex literals that point into the WRAM block that moved in some region get `+!RAM_SHIFT` appended
    (`!RAM_SHIFT` is the region's shift of that block: 0 US/EU, 6 DE, -32 JP).
  * `src/code/region_targets.asm` receives the per region equates for branch targets / data pointers that have no
    label in the US sources (`L_<US address>`).

The US build is unaffected (`!REGION_US` is the default); it is checked afterwards with tools/build.py, as are the
regional builds (`tools/build.py --region EU|DE|JP`).

Usage:
    python tools/migration/region_patch.py --eu EU.sfc --de DE.sfc --jp JP.sfc [--dry-run] [--keep]
        --keep     do not reduce the sources to the US text first (add layers to the current patch blocks)
        --dry-run  work on a temporary copy of src/code and print statistics only
    python tools/migration/region_patch.py --write-expected --eu EU.sfc --de DE.sfc --jp JP.sfc
        store the hashes of banks $80-$85 of the given regions in tests/expected.json
"""
import argparse
import bisect
import hashlib
import json
import re
import shutil
import sys
import tempfile
import zlib
from collections import defaultdict
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent.parent
sys.path.insert(0, str(ROOT / "tools" / "analysis"))
import usmap  # noqa: E402
import align_regions as AR  # noqa: E402
import region_variant as RV  # noqa: E402
from disasm65816 import lorom_off  # noqa: E402

BANK_SIZE = 0x8000
# Regions sharing a layer get merged blocks when their text is identical. EU and DE share most changes; JP is
# different enough that it is handled as an outer layer.
LAYERS = [("DE", "EU"), ("JP",)]
ORDER = ("DE", "EU", "JP")
EMPTY_VARIANT = ["    ; (no code in this region)"]


# --------------------------------------------------------------------------------------------------------------
# source text handling
# --------------------------------------------------------------------------------------------------------------
def is_if(s):
    return s.startswith("if ") and "!REGION_" in s


def unpatch_text(text):
    """US text of a module: region branches and directives removed, `+!RAM_SHIFT` suffixes dropped."""
    out, stack = [], []
    for line in text.split("\n"):
        s = line.strip()
        if is_if(s):
            stack.append(True)
            continue
        if stack and s.startswith("elseif ") and "!REGION_" in s:
            stack[-1] = True
            continue
        if stack and s == "else" and stack[-1]:
            stack[-1] = False
            continue
        if stack and s == "endif":
            stack.pop()
            continue
        if any(stack):
            continue
        out.append(line.replace("+!DE_RAM_SHIFT", "").replace("+!RAM_SHIFT", ""))
    return "\n".join(out)


def cond_text(regs):
    s = set(regs)
    if s == {"DE", "EU"}:
        return "!REGION_EUDE"
    if s == set(ORDER):
        return "!REGION_US == 0"
    return " || ".join("!REGION_%s" % r for r in ORDER if r in s)


def tidy(text):
    """`else` directly followed by one inner `if ... endif` that ends right before the outer `endif`
    becomes an `elseif` chain."""
    lines = text.split("\n")
    changed = True
    while changed:
        changed = False
        # matching endif for every if
        stack, match = [], {}
        for i, l in enumerate(lines):
            s = l.strip()
            if is_if(s):
                stack.append(i)
            elif s == "endif" and stack:
                match[stack.pop()] = i
        for i, l in enumerate(lines):
            if l.strip() == "else" and i + 1 < len(lines) and is_if(lines[i + 1].strip()):
                inner_end = match.get(i + 1)
                if inner_end is not None and inner_end + 1 < len(lines) and lines[inner_end + 1].strip() == "endif":
                    inner = lines[i + 1].strip()
                    lines[i] = "    elseif " + inner[3:]
                    del lines[inner_end + 1]    # outer endif
                    del lines[i + 1]            # inner `if`
                    changed = True
                    break
    return "\n".join(lines)


def rewrite_data_line(ln):
    t = ln.text
    code, sep, cmt = t.partition(";")
    m = re.match(r"^(\s*(?:[+\-]+\s+)?(?:db|dw|dl|dd)\s+)(.*)$", code, re.I)
    pre, rest = m.group(1), m.group(2).rstrip()
    items = AR.split_items(rest)
    for k in ln.ritems:
        if "!RAM_SHIFT" not in items[k]:
            items[k] = items[k] + "+!RAM_SHIFT"
    code2 = pre + ",".join(items)
    return code2.rstrip() + (" " * max(1, 59 - len(code2.rstrip())) + sep + cmt if sep else "")


def rewrite_line(ln, st):
    if st != "ramlit":
        return ln.text
    if ln.kind == "data":
        return rewrite_data_line(ln)
    t = ln.text
    code, sep, cmt = t.partition(";")
    if "!RAM_SHIFT" in code:
        return t
    pre = re.sub(r"^\s*[+\-]*\s*[A-Za-z]+(\.[BWL])?", "", code)
    m = re.search(r"\$([0-9A-Fa-f]{2,6})(?![0-9A-Fa-f])", pre)
    if not m:
        return t
    end = len(code) - len(pre) + m.end()
    code2 = code[:end] + "+!RAM_SHIFT" + code[end:]
    return code2.rstrip() + (" " * max(1, 59 - len(code2.rstrip())) + sep + cmt if sep else "")


# --------------------------------------------------------------------------------------------------------------
# literal code pointers -> label names (US text)
# --------------------------------------------------------------------------------------------------------------
def label_index(lines):
    """US address -> [(qualified name, global?)] for all label lines."""
    out, G = defaultdict(list), None
    for ln in lines:
        if ln.kind != "label" or ln.start is None or ln.label.startswith(".."):
            continue
        if not ln.label.startswith("."):
            G = ln.label
            out[ln.start].append((ln.label, True))
        elif G:
            out[ln.start].append((G + ln.label, False))
    return out


def pointer_target(c, ln):
    """For a 'diff' instruction line with a literal operand: list of (token, US target) when the region value is the
    relocated US target (so naming the target makes the line relocatable), else None."""
    raw = ln.raw
    mode = AR._OPS[raw[0]][1]
    code = ln.text.split(";")[0]
    parts = re.sub(r"^\s*[+\-]+\s+", "", code).strip().split(None, 1)
    if len(parts) < 2 or AR.is_symbolic(parts[1]):
        return None
    val = int.from_bytes(raw[1:], "little")
    ds = c.al.f(ln.start)
    if ds is None:
        return None
    d = c.rom[lorom_off(ds):lorom_off(ds) + len(raw)]
    if len(d) != len(raw) or d[0] != raw[0]:
        return None
    dv = int.from_bytes(d[1:], "little")
    bank = ln.start >> 16
    if mode in ("immM", "immX") and len(raw) == 3 and val >= 0x8000:
        tgt, width = (bank << 16) | val, 4
    elif mode in AR.ADDR_MODES_16 and val >= 0x8000:
        tgt, width = (bank << 16) | val, 4
    elif mode in AR.LONG_MODES and val & 0x8000 and (val >> 16) >= 0x80:
        tgt, width = val, 6
        if not (0x80 <= (tgt >> 16) <= 0x85):
            return None
    else:
        return None
    t = c.al.f(tgt)
    if t is None or t == tgt and dv == val:
        return None
    mask = 0xFFFF if width == 4 else 0xFFFFFF
    if (t & mask) != (dv & mask):
        return None
    return ("$%0*X" % (width, val), tgt)


def symbolize_pointers(us, lines, ctxs, syms):
    """Replace literal code pointers by label names where at least one region relocates them. Edits `lines[i].text`;
    returns the number of replaced operands."""
    labels = label_index(lines)

    def name_of(addr, scope):
        cands = labels.get(addr)
        if cands:
            for q, g in cands:
                if g:
                    return q
            return cands[0][0]
        if not (0x80 <= (addr >> 16) <= 0x85) and syms.get(addr):
            return sorted(syms[addr], key=len)[0]
        return None
    want = {}
    for c in ctxs:
        AR.set_region(c.name)
        for i, st in c.status.items():
            ln = lines[i]
            if st != "diff":
                continue
            if ln.kind == "insn":
                r = pointer_target(c, ln)
                if r and name_of(r[1], None):
                    want.setdefault(i, {})[r[0]] = r[1]
            elif ln.kind == "data":
                m = usmap._DATA_RE.match(re.sub(r"^\s*[+\-]+\s+", "    ", ln.text))
                kind = m.group(1).lower()
                if kind not in ("dw", "dl"):
                    continue
                size = usmap._DATA_SIZE[kind]
                items = AR.split_items(m.group("rest").split(";")[0].strip())
                ds = c.al.f(ln.start)
                n = ln.end - ln.start
                if ds is None or len(items) * size != n:
                    continue
                u = us[lorom_off(ln.start):lorom_off(ln.start) + n]
                d = c.rom[lorom_off(ds):lorom_off(ds) + n]
                for k, it in enumerate(items):
                    if AR.is_symbolic(it):
                        continue
                    v = int.from_bytes(u[k * size:(k + 1) * size], "little")
                    dv = int.from_bytes(d[k * size:(k + 1) * size], "little")
                    if kind == "dw" and v >= 0x8000:
                        tgt = ((ln.start >> 16) << 16) | v
                    elif kind == "dl" and v & 0x8000 and 0x80 <= (v >> 16) <= 0x85:
                        tgt = v
                    else:
                        continue
                    t = c.al.f(tgt)
                    mask = (1 << (8 * size)) - 1
                    if t is not None and v != dv and (t & mask) == dv and name_of(tgt, None):
                        want.setdefault(i, {})["item%d" % k] = tgt
    n = 0
    for i, subs in want.items():
        ln = lines[i]
        code, sep, cmt = ln.text.partition(";")
        if ln.kind == "insn":
            for tok, tgt in subs.items():
                if code.count(tok) == 1:
                    code = code.replace(tok, name_of(tgt, None))
                    n += 1
        else:
            m = re.match(r"^(\s*(?:[+\-]+\s+)?(?:db|dw|dl|dd)\s+)(.*)$", code, re.I)
            pre, rest = m.group(1), m.group(2).rstrip()
            items = AR.split_items(rest)
            for key, tgt in subs.items():
                items[int(key[4:])] = name_of(tgt, None)
                n += 1
            code = pre + ",".join(items)
        ln.text = code.rstrip() + (" " * max(1, 59 - len(code.rstrip())) + sep + cmt if sep else "")
    return n


# --------------------------------------------------------------------------------------------------------------
# per layer analysis
# --------------------------------------------------------------------------------------------------------------
class Block:
    def __init__(self, first, last):
        self.first, self.last = first, last   # positions in `idx` (code lines)
        self.raw_lo = self.raw_hi = None      # raw line range that gets wrapped
        self.variants = {}                    # region -> text lines


class RegionCtx:
    def __init__(self, name, rom, us, lines):
        self.name, self.rom = name, rom
        AR.set_region(name)
        self.al = AR.Aligner(us, rom)
        self.status = AR.classify_lines(self.al, lines, rom)
        self.extra = flag_events(self.al, lines, self.status)
        self.ritems = {i: lines[i].ritems for i in self.status if lines[i].kind == "data"}
        self.lm = self.res = None
        self.equates = {}


def code_lines(lines, status):
    return [i for i in sorted(status) if lines[i].end is not None and lines[i].end > lines[i].start]


def flag_events(al, lines, status):
    """Mark lines affected by length-changing alignment events (insert/delete/replace) as diff."""
    idx = code_lines(lines, status)
    starts = [lines[i].start for i in idx]
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


def global_marker(lines, ctxs):
    """Lines whose literal WRAM operands move with the region's RAM shift in at least one region:
    line index -> True (instruction) or tuple of item indexes (data line)."""
    marker = {}
    for c in ctxs:
        for i, st in c.status.items():
            if st == "ramlit":
                if lines[i].kind == "data":
                    marker[i] = tuple(sorted(set(marker.get(i, ())) | set(c.ritems.get(i, ()))))
                else:
                    marker[i] = True
    return marker


def diff_lines(lines, ctxs, marker):
    """Per region of the layer: the set of 'diff' lines, including the lines whose `+!RAM_SHIFT` suffix (needed by
    another region) would be wrong for this region."""
    diff = {c.name: set() for c in ctxs}
    for c in ctxs:
        AR.set_region(c.name)
        for i, st in c.status.items():
            if st == "diff":
                diff[c.name].add(i)
        for i, m in marker.items():
            st = c.status.get(i)
            if st == "diff":
                continue
            if lines[i].kind == "data":
                bad = (st == "ramlit" and tuple(c.ritems.get(i, ())) != m) or (st == "same" and AR.RAM.delta != 0)
            else:
                bad = st == "same" and AR.RAM.delta != 0
            if bad:
                diff[c.name].add(i)
    return diff


class Layout:
    """Nesting structure of the region blocks already present in the module files (layers added earlier)."""

    def __init__(self, lines):
        self.path = []        # per raw line: tuple of (block id, branch) the line lives in
        self.if_line, self.end_line = {}, {}
        stack, n = [], 0
        for i, ln in enumerate(lines):
            s = ln.text.strip()
            if ln.kind == "directive" and is_if(s):
                n += 1
                self.if_line[n] = i
                self.path.append(tuple(map(tuple, stack)))
                stack.append([n, 0])
            elif ln.kind == "directive" and stack and (s == "else" or s.startswith("elseif ")):
                self.path.append(tuple(map(tuple, stack[:-1])))
                stack[-1][1] += 1
            elif ln.kind == "directive" and stack and s == "endif":
                b = stack.pop()
                self.end_line[b[0]] = i
                self.path.append(tuple(map(tuple, stack)))
            else:
                self.path.append(tuple(map(tuple, stack)))

    def equalize(self, lo, hi):
        """Widen [lo, hi] until both ends live in the same branch of the same block (or at top level)."""
        while self.path[lo] != self.path[hi]:
            pl, ph = self.path[lo], self.path[hi]
            if len(pl) >= len(ph):
                lo = self.if_line[pl[-1][0]]
            else:
                hi = self.end_line[ph[-1][0]]
        return lo, hi


def build_blocks(lines, idx, diff_idx, gap=2):
    blocks, cur, last_pos = [], None, None
    for pos, i in enumerate(idx):
        if i not in diff_idx:
            continue
        if cur is not None and pos - last_pos <= gap + 1 and (lines[i].start >> 16) == (lines[idx[last_pos]].start >> 16) \
                and lines[i].file == lines[idx[last_pos]].file:
            cur.last = pos
        else:
            cur = Block(pos, pos)
            blocks.append(cur)
        last_pos = pos
    return blocks


def normalize(blk, idx, layout):
    lo, hi = layout.equalize(idx[blk.first], idx[blk.last])
    blk.first = bisect.bisect_left(idx, lo)
    blk.last = bisect.bisect_right(idx, hi) - 1
    blk.raw_lo, blk.raw_hi = lo, hi


def block_range(al, lines, idx, blk):
    first, last = lines[idx[blk.first]], lines[idx[blk.last]]
    return al.f_start(first.start), al.f_end(last.end)


def settle_blocks(ctxs, lines, idx, blocks, diff, layout):
    """Extend blocks until the region ranges of all regions that differ in them decode cleanly."""
    by_name = {c.name: c for c in ctxs}
    diff_sets = diff
    for _ in range(6):
        for blk in blocks:
            normalize(blk, idx, layout)
            for attempt in range(400):
                ok, need = True, "any"
                span = set(idx[blk.first:blk.last + 1])
                for r in ORDER:
                    if r not in by_name or not (span & diff_sets[r]):
                        continue
                    c = by_name[r]
                    ds, de = block_range(c.al, lines, idx, blk)
                    first = lines[idx[blk.first]]
                    if ds is None or de is None or de < ds:
                        ok = False
                        need = "first" if ds is None else ("last" if de is None else "any")
                        break
                    if all(lines[idx[p]].kind == "data" for p in range(blk.first, blk.last + 1)):
                        continue
                    if de > ds and RV.decode_range(c.rom, ds, de, first.m, first.x) is None:
                        ok = False
                        break
                if ok:
                    break
                f = lines[idx[blk.first]].file
                can_next = blk.last + 1 < len(idx) and lines[idx[blk.last + 1]].file == f
                can_prev = blk.first > 0 and lines[idx[blk.first - 1]].file == f
                if need == "last" or (need == "any" and attempt % 2 == 0):
                    go_next = can_next or not can_prev
                else:
                    go_next = not can_prev and can_next
                if go_next and can_next:
                    blk.last += 1
                elif can_prev:
                    blk.first -= 1
                else:
                    break
                normalize(blk, idx, layout)
        blocks.sort(key=lambda b: b.first)
        merged, again = [], False
        for b in blocks:
            if merged and b.first <= merged[-1].last + 1 and lines[idx[b.first]].file == lines[idx[merged[-1].last]].file:
                merged[-1].last = max(merged[-1].last, b.last)
                again = True
            else:
                merged.append(b)
        blocks[:] = merged
        if not again:
            break
    for blk in blocks:
        normalize(blk, idx, layout)
    return blocks


# --------------------------------------------------------------------------------------------------------------
# variants
# --------------------------------------------------------------------------------------------------------------
def ptr_text(c, t, size, kind, ln_bank):
    """Symbolic text for a code pointer item of a data variant, or None."""
    name = c.res.rom_label(t, "")
    if name and "." in name:
        name = None
    if name is None and 0x80 <= (t >> 16) <= 0x85 and c.res.us_addr(t) is not None:
        name = c.res.target_equate(t, c.equates)
    return name


def data_variant(c, lines, idx, p0, p1, fi, la, ds, de):
    """Region data for a run of data lines (positions p0..p1, raw lines fi..la). Keeps the shape of the US lines
    when the sizes agree. Labels defined inside are re-emitted at the matching region position."""
    out = []
    rom, al, lm, res = c.rom, c.al, c.lm, c.res
    n = de - ds
    us_n = sum(lines[idx[p]].end - lines[idx[p]].start for p in range(p0, p1 + 1))
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
                raw = rom[lorom_off(pos) + k * size: lorom_off(pos) + (k + 1) * size]
                v = int.from_bytes(raw, "little")
                uraw = al.us[lorom_off(ln.start) + k * size: lorom_off(ln.start) + (k + 1) * size]
                uv = int.from_bytes(uraw, "little")
                txt = None
                if kind in ("dw", "dl") and AR.is_symbolic(it):
                    t = ((ln.start >> 16) << 16) | v if kind == "dw" else v
                    if (kind == "dl" and (t >> 16) >= 0x80) or (kind == "dw" and v >= 0x8000):
                        txt = ptr_text(c, t, size, kind, ln.start >> 16)
                elif kind in ("dw", "dl") and not AR.is_symbolic(it):
                    wram = (kind == "dw" and uv < 0x2000) or (kind == "dl" and AR.is_wram_long(uv))
                    if wram and AR.RAM.us_shifted(uv & 0xFFFF) and v == (uv & ~0xFFFF) + AR.RAM.us2reg(uv & 0xFFFF):
                        txt = "$%0*X+!RAM_SHIFT" % (size * 2, uv)
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
        nxt = min([cc for cc in cuts if cc > pos] + [de, pos + 16])
        chunk = rom[lorom_off(pos):lorom_off(pos) + (nxt - pos)]
        out.append("    db " + ",".join("$%02X" % b for b in chunk))
        pos = nxt
    for t in sorted(cuts):
        for name in cuts[t]:
            out.append(name + ":")
    return out


def make_variants(c, lines, idx, blocks, wanted, stats):
    """Fill blk.variants[c.name] for the blocks in `wanted` (block -> True when the region differs there)."""
    AR.set_region(c.name)
    scope_of = {}
    G = None
    for i, ln in enumerate(lines):
        if ln.kind == "label" and not ln.label.startswith("."):
            G = ln.label
        scope_of[i] = G
    for blk in blocks:
        if c.name not in wanted[id(blk)]:
            continue
        ds, de = block_range(c.al, lines, idx, blk)
        first = lines[idx[blk.first]]
        scope = scope_of[idx[blk.first]]
        label_at, anon_at = defaultdict(list), {}
        fi, la = blk.raw_lo, blk.raw_hi
        for i in range(fi, la + 1):
            ln = lines[i]
            if ln.kind == "label" and ln.start is not None:
                if ln.label.startswith(".."):
                    continue
                t = c.lm.de_addr(ln.start)
                if t is None or ds is None or de is None or not (ds <= t <= de):
                    if not ln.label.startswith("."):
                        c.equates[ln.label] = t if t is not None else ds
                    else:
                        stats["sublabel_outside"] += 1
                        if ds is not None:
                            label_at[ds].append(ln.label)
                    stats["label_outside"] += 1
                    continue
                label_at[t].append(ln.label)
            elif ln.anon:
                t = c.lm.de_addr(ln.start)
                if t is not None:
                    anon_at[t] = ln.anon
        if first.anon and ds is not None:
            anon_at[ds] = first.anon   # references from before the block to its first line
        if ds is None or de is None:
            stats["unmapped_block"] += 1
            print("WARNING: %s block at %s:%d cannot be mapped" % (c.name, first.file, first.idx + 1))
            continue
        if de == ds:
            blk.variants[c.name] = list(EMPTY_VARIANT)
            continue
        classes = [lines[idx[p]].kind == "data" for p in range(blk.first, blk.last + 1)]
        if all(classes):
            blk.variants[c.name] = data_variant(c, lines, idx, blk.first, blk.last, blk.raw_lo, blk.raw_hi, ds, de)
            stats["data_blocks"] += 1
            continue
        # split into runs of data lines and code lines; the region range is cut at the matching region addresses
        runs, start = [], blk.first
        for p in range(blk.first + 1, blk.last + 2):
            if p == blk.last + 1 or classes[p - blk.first] != classes[p - 1 - blk.first]:
                runs.append((start, p - 1, classes[start - blk.first]))
                start = p
        bounds = [ds]
        for p0, p1, is_data in runs[1:]:
            bounds.append(c.lm.de_addr(lines[idx[p0]].start))
        bounds.append(de)
        if len(runs) > 1 and (None in bounds or any(x > y for x, y in zip(bounds, bounds[1:]))):
            stats["segment_fallback"] += 1
            runs, bounds = [(blk.first, blk.last, False)], [ds, de]
        out, missed_all = [], {}
        for k, (p0, p1, is_data) in enumerate(runs):
            a_, b_ = bounds[k], bounds[k + 1]
            raw_lo = blk.raw_lo if k == 0 else idx[runs[k - 1][1]] + 1
            raw_hi = blk.raw_hi if k == len(runs) - 1 else idx[p1]
            seg_first = lines[idx[p0]]
            last_seg = k == len(runs) - 1
            seg_labels = {t: v for t, v in label_at.items() if a_ <= t < b_ or (last_seg and t == b_)}
            if is_data:
                if b_ == a_:
                    continue
                out += data_variant(c, lines, idx, p0, p1, raw_lo, raw_hi, a_, b_)
                stats["data_blocks"] += 1
                continue
            if b_ == a_:
                for t, labs in seg_labels.items():
                    out += [l + ":" for l in labs]
                continue
            insns = RV.decode_range(c.rom, a_, b_, seg_first.m, seg_first.x)
            if insns is None:
                stats["db_fallback"] += 1
                pos = a_
                while pos < b_:
                    ch = c.rom[lorom_off(pos):lorom_off(pos) + min(16, b_ - pos)]
                    out.append("    db " + ",".join("$%02X" % b for b in ch))
                    pos += len(ch)
                continue
            prefix = ".r_%06X_" % seg_first.start
            body, missed = RV.emit_code(c.res, c.rom, insns, scope, seg_labels, anon_at, prefix, c.equates)
            out += body
            missed_all.update(missed)
            stats["code_blocks"] += 1
        for a, labs in missed_all.items():
            for l in labs:
                if a == de:
                    out.append(l + ":")   # label at the very end of the block
                elif not l.startswith("."):
                    c.equates[l] = a
                    stats["label_not_on_boundary"] += 1
                else:
                    stats["sublabel_lost"] += 1
                    print("WARNING: sublabel %s lost in %s block at %s:%d" % (l, c.name, first.file, first.idx + 1))
        blk.variants[c.name] = out


def render(lines, blocks, marker, status_for_rewrite):
    """New text per module file."""
    block_at = {blk.raw_lo: blk for blk in blocks if blk.variants}
    outs = defaultdict(list)
    i, N = 0, len(lines)
    while i < N:
        ln = lines[i]
        blk = block_at.get(i)
        if blk is not None:
            groups = {}
            for r in ORDER:
                v = blk.variants.get(r)
                if v is not None:
                    groups.setdefault(tuple(v), []).append(r)
            first = True
            for text, regs in groups.items():
                outs[ln.file].append(("    if " if first else "    elseif ") + cond_text(regs))
                outs[ln.file] += text
                first = False
            outs[ln.file].append("    else")
            for k in range(i, blk.raw_hi + 1):
                outs[lines[k].file].append(rewrite_line(lines[k], status_for_rewrite.get(k)))
            outs[ln.file].append("    endif")
            i = blk.raw_hi + 1
            continue
        outs[ln.file].append(rewrite_line(ln, status_for_rewrite.get(i)))
        i += 1
    return {rel: tidy("\n".join(v)) for rel, v in outs.items()}


def run_layer(layer, roms, us, syms, equates_out, marker):
    names = [r for r in layer if r in roms]
    if not names:
        return None
    lines = usmap.load_us_source(us)
    ctxs = [RegionCtx(r, roms[r], us, lines) for r in names]
    diff = diff_lines(lines, ctxs, marker)
    for c in ctxs:
        print("  %s: %d diff lines (%d flagged by alignment events)" % (c.name, len(diff[c.name]), c.extra))
    union = set().union(*diff.values())
    # lines that get the +!RAM_SHIFT suffix
    for i, m in marker.items():
        if lines[i].kind == "data":
            lines[i].ritems = m
    status = {i: "ramlit" for i in marker}
    idx = [i for i, ln in enumerate(lines) if ln.kind in ("insn", "data", "macro", "other")
           and ln.start is not None and ln.end is not None and ln.end > ln.start]
    layout = Layout(lines)
    blocks = build_blocks(lines, idx, union)
    blocks = settle_blocks(ctxs, lines, idx, blocks, diff, layout)
    wanted = {}
    for blk in blocks:
        span = set(idx[blk.first:blk.last + 1])
        wanted[id(blk)] = [c.name for c in ctxs if span & diff[c.name]]
    stats = defaultdict(int)
    for c in ctxs:
        AR.set_region(c.name)
        inside = set()
        for blk in blocks:
            if c.name in wanted[id(blk)]:
                inside.update(range(blk.raw_lo, blk.raw_hi + 1))
        c.lm = AR.LabelMap(c.al, lines, c.rom, inside)
        c.res = RV.NameResolver(lines, syms, c.al, c.rom, c.lm, region=c.name)
        make_variants(c, lines, idx, blocks, wanted, stats)
        for k, v in c.equates.items():
            equates_out[c.name][k] = v
    nb = len(blocks)
    merged = sum(1 for b in blocks if len({tuple(v) for v in b.variants.values()}) < len(b.variants))
    print("  blocks: %d (%d with merged regions), marker lines: %d, %s" % (nb, merged, len(marker), dict(stats)))
    return render(lines, blocks, marker, status)


def write_texts(texts, base):
    for rel, txt in texts.items():
        (base / rel).write_text(txt, encoding="utf-8", newline="\n")


def targets_file(equates):
    out = ["; Branch targets, data pointers and labels of the regional patch blocks (if !REGION_xx ... endif in",
           "; banks $80-$85) that have no label in the US sources. Generated by tools/migration/region_patch.py;",
           "; `L_<address>` is named after the corresponding US address, the value is the address in the region."]
    first = True
    for r in ORDER:
        if not equates.get(r):
            continue
        out.append(("if !REGION_%s" if first else "elseif !REGION_%s") % r)
        first = False
        for k, v in sorted(equates[r].items(), key=lambda kv: (kv[1], kv[0])):
            out.append("    %s = $%06X" % (k, v))
    if not first:
        out.append("endif")
    return "\n".join(out) + "\n"


def write_expected(roms):
    path = ROOT / "tests" / "expected.json"
    data = json.loads(path.read_text(encoding="utf-8"))
    for r, rom in roms.items():
        part = rom[0:6 * BANK_SIZE]
        data[r] = {"banks": ["80", "85"], "size": len(part), "crc32": "%08X" % (zlib.crc32(part) & 0xFFFFFFFF),
                   "md5": hashlib.md5(part).hexdigest(), "sha1": hashlib.sha1(part).hexdigest()}
    path.write_text(json.dumps(data, indent=2) + "\n", encoding="utf-8", newline="\n")


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    for r in ("eu", "de", "jp"):
        ap.add_argument("--" + r, type=Path)
    ap.add_argument("--dry-run", action="store_true")
    ap.add_argument("--keep", action="store_true")
    ap.add_argument("--write-expected", action="store_true")
    args = ap.parse_args()
    roms = {r.upper(): getattr(args, r).read_bytes() for r in ("eu", "de", "jp") if getattr(args, r)}
    if args.write_expected:
        write_expected(roms)
        return 0
    if not roms:
        ap.error("give at least one of --eu --de --jp")

    code_dir = usmap.CODE_DIR
    tmp = None
    if args.dry_run:
        tmp = Path(tempfile.mkdtemp())
        shutil.copytree(code_dir, tmp / "code")
        usmap.CODE_DIR = code_dir = tmp / "code"
    if not args.keep:
        for rel in usmap.MODULE_ORDER:
            p = code_dir / rel
            p.write_text(unpatch_text(p.read_text(encoding="utf-8")), encoding="utf-8", newline="\n")
    us, syms = AR.build_us_rom()
    equates = defaultdict(dict)
    lines0 = usmap.load_us_source(us)
    ctx0 = [RegionCtx(r, rom, us, lines0) for r, rom in roms.items()]
    if not args.keep:
        n = symbolize_pointers(us, lines0, ctx0, syms)
        print("literal code pointers replaced by label names:", n)
        per_file = defaultdict(list)
        for ln in lines0:
            per_file[ln.file].append(ln.text)
        write_texts({rel: "\n".join(t) for rel, t in per_file.items()}, code_dir)
        if not args.dry_run:
            us2, _ = AR.build_us_rom()
            if us2 != us:
                sys.exit("the US build changed after replacing pointers by labels")
        lines0 = usmap.load_us_source(us)
        ctx0 = [RegionCtx(r, rom, us, lines0) for r, rom in roms.items()]
    marker = global_marker(lines0, ctx0)
    print("lines with WRAM literals that move with the RAM shift:", len(marker))
    for layer in LAYERS:
        print("layer", "+".join(layer))
        texts = run_layer(layer, roms, us, syms, equates, marker)
        if texts:
            write_texts(texts, code_dir)
            marker = {}   # the `+!RAM_SHIFT` suffixes are in the text now; line numbers changed
    if not args.dry_run:
        (code_dir / "region_targets.asm").write_text(targets_file(equates), encoding="utf-8", newline="\n")
    if tmp:
        shutil.rmtree(tmp, ignore_errors=True)
    return 0


if __name__ == "__main__":
    sys.exit(main())
