#!/usr/bin/env python3
"""Align the DE code banks ($80-$85) against the US source and report how much of the code is shared.

The DE ROM is only an input of this tool (never stored in the repository). The US ROM is either given with --us
or built from src/ with asar (tools/bin/asar). Method:

  1. Per bank the DE bytes are aligned with the US bytes (anchor based diff, `bytealign.py`). Equal blocks and
     same-length replacements give a byte-exact US->DE address map.
  2. Every line of the US source (see `usmap.py`) is classified:
       same    - all bytes identical in DE
       reloc   - only operand bytes differ and the difference is explained by the symbolic operand
                 (code shifted: label targets; RAM block shifted by +6 from $7E08D1; branch distances)
       diff    - anything else: the line needs a DE specific variant
  3. Statistics per bank and per function (global label) are printed or written to docs/regions.md.

The same machinery is used by tools/migration/de_patch.py to create the `if !REGION_DE` patch blocks.

Usage:
    python tools/analysis/align_regions.py --de "Harvest Moon (Germany).sfc" [--us US.sfc] [--md docs/regions.md]
"""
import argparse
import os
import re
import shutil
import subprocess
import sys
import tempfile
from collections import Counter, defaultdict
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import usmap  # noqa: E402
from bytealign import align  # noqa: E402
from disasm65816 import _OPS, lorom_off  # noqa: E402

ROOT = Path(__file__).resolve().parent.parent.parent
BANKS = range(0x80, 0x86)

# DE inserted 6 bytes into the WRAM name block (the weekday names are longer); everything from $7E08D1 up to the
# DMA queues moves up by 6 bytes. Found by operand statistics of the aligned code (see docs/regions.md).
RAM_SHIFT_START = 0x08D1
RAM_SHIFT_END = 0x2000
RAM_SHIFT = 6

ADDR_MODES_16 = {"abs", "absx", "absy", "absind", "absindx", "absindl", "pea"}
DP_MODES = {"dp", "dpx", "dpy", "ind", "indx", "indy", "indl", "indly", "sr", "sry", "pei"}
LONG_MODES = {"long", "longx", "jlong"}


def build_us_rom():
    """Build the US ROM + symbol file from src/ into a temp dir. Returns (rom_bytes, symbols dict addr->[names])."""
    asar = None
    for c in (os.environ.get("ASAR"), ROOT / "tools" / "bin" / "asar", shutil.which("asar")):
        if c and Path(c).is_file():
            asar = str(c)
            break
    if not asar:
        sys.exit("asar not found: pass --us ROM or provide asar (ASAR / tools/bin/asar)")
    tmp = Path(tempfile.mkdtemp())
    rom = tmp / "us.sfc"
    rom.write_bytes(bytes(0x200000))
    sym = tmp / "us.sym"
    r = subprocess.run([asar, "--symbols=wla", f"--symbols-path={sym}", "-werror", "--no-title-check",
                        "--fix-checksum=off", "src/main.asm", str(rom)], cwd=ROOT, capture_output=True, text=True)
    if r.returncode:
        sys.exit(r.stdout + r.stderr)
    data = rom.read_bytes()
    syms = load_symbols(sym)
    shutil.rmtree(tmp, ignore_errors=True)
    return data, syms


def load_symbols(path):
    syms = defaultdict(list)
    sect = None
    for line in Path(path).read_text().splitlines():
        if line.startswith("["):
            sect = line.strip()
            continue
        if sect == "[labels]":
            m = re.match(r"([0-9A-F]{2}):([0-9A-F]{4}) (\S+)", line)
            if m and not re.match(r"(neg|pos)_\d+_\d+$", m.group(3)):
                syms[(int(m.group(1), 16) << 16) | int(m.group(2), 16)].append(m.group(3))
    return syms


class Aligner:
    """Byte-exact US->DE address map for the code banks."""

    def __init__(self, us, de):
        self.us, self.de = us, de
        self.ops = {}
        self.fwd = {}   # bank -> list(32768) of DE offset in bank or -1
        self.inv = {}
        for b in BANKS:
            o = lorom_off(b << 16)
            A, D = us[o:o + 0x8000], de[o:o + 0x8000]
            ops = align(A, D)
            self.ops[b] = ops
            f, r = [-1] * 0x8000, [-1] * 0x8000
            for tag, i1, i2, j1, j2 in ops:
                if tag == "equal" or (tag == "replace" and i2 - i1 == j2 - j1):
                    for k in range(i2 - i1):
                        f[i1 + k] = j1 + k
                        r[j1 + k] = i1 + k
            self.fwd[b], self.inv[b] = f, r

    def f(self, addr):
        """US 24-bit address -> DE 24-bit address (None if the byte has no counterpart)."""
        b = addr >> 16
        if b not in self.fwd or not addr & 0x8000:
            return addr  # data banks / WRAM mirrors: no shift here (RAM shifts are handled by ram_expected)
        v = self.fwd[b][addr & 0x7FFF]
        return None if v < 0 else (b << 16) | 0x8000 | v

    def r(self, addr):
        b = addr >> 16
        if b not in self.inv or not addr & 0x8000:
            return addr
        v = self.inv[b][addr & 0x7FFF]
        return None if v < 0 else (b << 16) | 0x8000 | v

    def f_start(self, addr):
        """DE position of the start of the content that begins at US `addr` (bytes inserted in DE right before it
        are included). None if `addr` lies inside a replaced run."""
        b = addr >> 16
        o = addr & 0x7FFF
        for tag, i1, i2, j1, j2 in self.ops[b]:
            if i1 == o and (tag == "insert" or tag != "equal" or True):
                return (b << 16) | 0x8000 | j1
            if tag == "equal" and i1 <= o < i2:
                return (b << 16) | 0x8000 | (j1 + o - i1)
        if o == 0x8000:
            return (b << 16) | 0x8000 | self.ops[b][-1][4]
        return None

    def f_end(self, addr):
        """DE position just after the content that ends at US `addr` (a following insertion is not included)."""
        b = addr >> 16
        o = addr & 0x8000 if False else (addr & 0x7FFF)
        if o == 0:
            o = 0x8000
        for tag, i1, i2, j1, j2 in self.ops[b]:
            if tag == "insert":
                continue
            if tag == "equal" and i1 < o <= i2:
                return (b << 16) | 0x8000 | (j1 + o - i1)
            if tag != "equal" and i1 < o <= i2:
                return (b << 16) | 0x8000 | j2 if o == i2 else None
        return None

    def f_boundary(self, addr):
        """Map an instruction boundary: like f(), but an address that starts an unmapped (replaced/deleted)
        run is mapped through the run edges."""
        b = addr >> 16
        if b not in self.ops:
            return addr
        o = addr & 0x7FFF
        for tag, i1, i2, j1, j2 in self.ops[b]:
            if i1 <= o < i2 or (o == i2 and tag != "equal"):
                if tag == "equal":
                    return (b << 16) | 0x8000 | (j1 + o - i1)
                if o == i1:
                    return (b << 16) | 0x8000 | j1
                if o == i2:
                    return (b << 16) | 0x8000 | j2
                return None
        if o == 0x8000:
            return (b << 16) | 0x8000 | self.ops[b][-1][4]
        return None


def ram_expected(v):
    """Expected DE value of a US WRAM address (low 16 bit of bank $7E / DB=$7E)."""
    if RAM_SHIFT_START <= v < RAM_SHIFT_END:
        return v + RAM_SHIFT
    return v


def is_wram_long(v):
    """24-bit address inside WRAM: bank $7E, or the low-RAM mirror (offset < $2000) of banks $00-$3F / $80-$BF."""
    bank, off = v >> 16, v & 0xFFFF
    return (bank == 0x7E and off < RAM_SHIFT_END) or ((bank & 0x7F) < 0x40 and off < 0x2000)


def long_ram_expected(v):
    off = v & 0xFFFF
    return v + RAM_SHIFT if RAM_SHIFT_START <= off < RAM_SHIFT_END else v


def split_items(rest):
    items, depth, cur = [], 0, ""
    for ch in rest:
        if ch == "(":
            depth += 1
        elif ch == ")":
            depth -= 1
        if ch == "," and depth == 0:
            items.append(cur.strip()); cur = ""
        else:
            cur += ch
    items.append(cur.strip())
    return items


def is_symbolic(tok):
    t = re.sub(r"\$[0-9A-Fa-f]+", "", tok)
    t = t.replace(",X", "").replace(",Y", "").replace(",S", "")
    return bool(re.search(r"[A-Za-z_!.]", t))


def classify_insn(al, ln, de):
    """Classify an instruction line: 'same', 'reloc' or 'diff'."""
    s, raw = ln.start, ln.raw
    ds = al.f(s)
    if ds is None:
        return "diff"
    d = de[lorom_off(ds):lorom_off(ds) + len(raw)]
    if d == raw:
        # identical bytes are only fine if a symbolic operand does not move
        return "same" if not _moves(al, ln) else "diff"
    if d[0] != raw[0]:
        return "diff"
    mode = _OPS[raw[0]][1]
    code = ln.text.split(";")[0]
    val = int.from_bytes(raw[1:], "little")
    dv = int.from_bytes(d[1:], "little")
    if not is_symbolic(re.sub(r"^\s*[+\-]+\s+", "", code).strip().split(None, 1)[-1] if len(code.split()) > 1 else ""):
        if (mode in ADDR_MODES_16 or (mode in ("immM", "immX") and len(raw) == 3)) and val < 0x2000 \
                and dv == ram_expected(val) != val:
            return "ramlit"
        if mode in LONG_MODES and is_wram_long(val) and dv == long_ram_expected(val) != val:
            return "ramlit"
        return "diff"
    bank = s >> 16
    if mode in ("rel", "rell"):
        n = len(raw)
        sg = (lambda v, bits: v - (1 << bits) if v >> (bits - 1) else v)
        t_us = (bank << 16) | ((s + n + sg(val, 8 * (n - 1))) & 0xFFFF)
        t_de = (bank << 16) | ((ds + n + sg(dv, 8 * (n - 1))) & 0xFFFF)
        return "reloc" if al.f(t_us) == t_de else "diff"
    if mode in ("jabs", "absind", "absindx", "absindl") or (mode in ADDR_MODES_16 and val >= 0x8000):
        t = al.f((bank << 16) | val)
        cands = {t & 0xFFFF} if t is not None else set()
        cands.add(ram_expected(val)) if val < 0x8000 else None
        return "reloc" if dv in cands else "diff"
    if mode in ADDR_MODES_16:  # RAM / low address
        return "reloc" if dv == ram_expected(val) else "diff"
    if mode in DP_MODES:
        return "diff"
    if mode in LONG_MODES:
        if is_wram_long(val):
            return "reloc" if dv == long_ram_expected(val) else "diff"
        t = al.f(val) if (val >> 16) in al.fwd else val
        return "reloc" if t == dv else "diff"
    if mode in ("immM", "immX") and len(raw) == 3:
        t = al.f((bank << 16) | val) if val >= 0x8000 else None
        cands = {ram_expected(val)}
        if t is not None:
            cands.add(t & 0xFFFF)
        return "reloc" if dv in cands else "diff"
    return "diff"


def _moves(al, ln):
    """True if an identical-bytes instruction has a symbolic operand that would assemble to a different value."""
    raw = ln.raw
    mode = _OPS[raw[0]][1]
    code = ln.text.split(";")[0]
    parts = re.sub(r"^\s*[+\-]+\s+", "", code).strip().split(None, 1)
    if len(parts) < 2 or not is_symbolic(parts[1]):
        return False
    val = int.from_bytes(raw[1:], "little")
    bank = ln.start >> 16
    if mode in ("rel", "rell"):
        n = len(raw)
        sg = (lambda v, bits: v - (1 << bits) if v >> (bits - 1) else v)
        t_us = (bank << 16) | ((ln.start + n + sg(val, 8 * (n - 1))) & 0xFFFF)
        ds = al.f(ln.start)
        t_de = al.f(t_us)
        return ds is None or t_de is None or (t_de - ds) != (t_us - ln.start)
    if mode in ("jabs",) or (mode in ADDR_MODES_16 and val >= 0x8000):
        t = al.f((bank << 16) | val)
        return t is None or (t & 0xFFFF) != val
    if mode in ADDR_MODES_16:
        return ram_expected(val) != val
    if mode in LONG_MODES:
        if is_wram_long(val):
            return long_ram_expected(val) != val
        t = al.f(val) if (val >> 16) in al.fwd else val
        return t != val
    if mode in ("immM", "immX") and len(raw) == 3:
        if val >= 0x8000:
            t = al.f((bank << 16) | val)
            if t is not None and (t & 0xFFFF) != val:
                return True
        return ram_expected(val) != val and val < 0x8000 and False
    return False


def classify_data(al, ln, de):
    """Data line: items are compared against DE; symbolic pointer items may relocate, literal WRAM addresses
    move with the RAM shift (`ritems` records those items; the line is then 'ramlit')."""
    m = usmap._DATA_RE.match(re.sub(r"^\s*[+\-]+\s+", "    ", ln.text))
    kind = m.group(1).lower()
    size = usmap._DATA_SIZE[kind]
    items = split_items(m.group("rest").split(";")[0].strip())
    s = ln.start
    ds = al.f(s)
    ln.ritems = ()
    if ds is None:
        return "diff"
    n = ln.end - ln.start
    d = de[lorom_off(ds):lorom_off(ds) + n]
    u = al.us[lorom_off(s):lorom_off(s) + n]
    if len(d) != n or len(items) * size != n:
        return "diff"
    status, ritems = "same", []
    for k, it in enumerate(items):
        a, b = u[k * size:(k + 1) * size], d[k * size:(k + 1) * size]
        v, dv = int.from_bytes(a, "little"), int.from_bytes(b, "little")
        sym = is_symbolic(it)
        if kind == "dw":
            t = al.f(((s >> 16) << 16) | v) if (sym and v >= 0x8000) else None
        elif kind == "dl":
            t = (al.f(v) if (v >> 16) in al.fwd else v) if (sym and v & 0x8000) else None
        else:
            t = None
        if a == b:
            if t is not None and t & ((1 << (8 * size)) - 1) != v:
                return "diff"   # the symbol moves but DE kept the old value
            continue
        if sym and t is not None and (t & ((1 << (8 * size)) - 1)) == dv:
            status = "reloc" if status == "same" else status
            continue
        if sym and kind == "dw" and dv == ram_expected(v) and v < 0x2000:
            status = "reloc" if status == "same" else status
            continue
        if not sym and ((kind == "dl" and is_wram_long(v) and dv == long_ram_expected(v)) or
                        (kind == "dw" and v < 0x2000 and dv == ram_expected(v))):
            ritems.append(k)
            status = "ramlit"
            continue
        return "diff"
    ln.ritems = tuple(ritems)
    return status


class _Stub:
    """Pseudo instruction line for the instructions inside a macro expansion (operands are taken as symbolic)."""
    def __init__(self, start, raw):
        self.start, self.raw, self.text = start, raw, "    OP sym"


def classify_code_range(al, ln, de):
    n = ln.end - ln.start
    ds = al.f(ln.start)
    if ds is None:
        return "diff"
    if de[lorom_off(ds):lorom_off(ds) + n] == al.us[lorom_off(ln.start):lorom_off(ln.start) + n]:
        return "same"
    from disasm65816 import decode
    a, m, x, worst = ln.start, ln.m, ln.x, "reloc"
    while a < ln.end:
        ins = decode(al.us, a, m, x)
        if ins is None:
            return "diff"
        st = classify_insn(al, _Stub(a, ins.raw), de)
        if st == "diff":
            return "diff"
        if ins.mn == "REP":
            if ins.operand & 0x20: m = 0
            if ins.operand & 0x10: x = 0
        elif ins.mn == "SEP":
            if ins.operand & 0x20: m = 1
            if ins.operand & 0x10: x = 1
        a += ins.length
    return worst


class LabelMap:
    """DE address of every US code/data address that is referenced symbolically.

    Two sources: the byte alignment (`Aligner.f_start`, reliable inside long equal runs) and the operands of the
    aligned instructions/pointers: when a US instruction `JSL label` has a DE counterpart `JSL $xxxxxx`, the DE
    operand is a vote for the DE address of `label`. Votes win where the alignment is only a short coincidence.
    """

    def __init__(self, al, lines, de, exclude=()):
        self.al = al
        self.votes = defaultdict(Counter)
        for i, ln in enumerate(lines):
            if i in exclude:
                continue   # lines replaced by a DE patch block do not stay in the DE build
            if ln.kind == "insn":
                self._vote_insn(ln, de)
            elif ln.kind == "data":
                self._vote_data(ln, de)
        # length of the equal run around each US address
        self.runs = {}
        for b, ops in al.ops.items():
            for tag, i1, i2, j1, j2 in ops:
                if tag == "equal":
                    self.runs[b] = self.runs.get(b, []) + [(i1, i2)]

    def _vote_insn(self, ln, de):
        raw = ln.raw
        mode = _OPS[raw[0]][1]
        ds = self.al.f(ln.start)
        if ds is None:
            return
        d = de[lorom_off(ds):lorom_off(ds) + len(raw)]
        if len(d) != len(raw) or d[0] != raw[0]:
            return
        val = int.from_bytes(raw[1:], "little")
        dv = int.from_bytes(d[1:], "little")
        bank = ln.start >> 16
        if mode in ("rel", "rell"):
            n = len(raw)
            sg = (lambda v, bits: v - (1 << bits) if v >> (bits - 1) else v)
            t_us = (bank << 16) | ((ln.start + n + sg(val, 8 * (n - 1))) & 0xFFFF)
            t_de = (bank << 16) | ((ds + n + sg(dv, 8 * (n - 1))) & 0xFFFF)
        elif mode in ("jabs",) or (mode in ADDR_MODES_16 and val >= 0x8000):
            t_us, t_de = (bank << 16) | val, (bank << 16) | dv
        elif mode in LONG_MODES and not is_wram_long(val) and val & 0x8000:
            t_us, t_de = val, dv
        else:
            return
        if (t_us >> 16) in self.al.fwd:
            self.votes[t_us][t_de] += 1

    def _vote_data(self, ln, de):
        m = usmap._DATA_RE.match(re.sub(r"^\s*[+\-]+\s+", "    ", ln.text))
        kind = m.group(1).lower()
        if kind not in ("dw", "dl"):
            return
        size = usmap._DATA_SIZE[kind]
        items = split_items(m.group("rest").split(";")[0].strip())
        ds = self.al.f(ln.start)
        n = ln.end - ln.start
        if ds is None or len(items) * size != n:
            return
        u = self.al.us[lorom_off(ln.start):lorom_off(ln.start) + n]
        d = de[lorom_off(ds):lorom_off(ds) + n]
        for k, it in enumerate(items):
            if not is_symbolic(it):
                continue
            v = int.from_bytes(u[k * size:(k + 1) * size], "little")
            dv = int.from_bytes(d[k * size:(k + 1) * size], "little")
            if kind == "dw" and v >= 0x8000:
                bank = ln.start >> 16
                self.votes[(bank << 16) | v][(bank << 16) | dv] += 1
            elif kind == "dl" and (v >> 16) in self.al.fwd and v & 0x8000:
                self.votes[v][dv] += 1

    def run_len(self, addr):
        b, o = addr >> 16, addr & 0x7FFF
        for i1, i2 in self.runs.get(b, []):
            if i1 <= o < i2:
                return i2 - i1
        return 0

    def de_addr(self, u):
        """DE address for US address `u`. References from lines that stay in the DE build are authoritative (the
        assembled operand must equal the DE bytes); without references the byte alignment decides."""
        v = self.votes.get(u)
        if v:
            return v.most_common(1)[0][0]
        return self.al.f_start(u) if u & 0x8000 else u


def classify_lines(al, lines, de):
    """Returns dict line index -> status for lines that carry bytes (insn, data, macro/other)."""
    status = {}
    for i, ln in enumerate(lines):
        if ln.kind == "insn":
            status[i] = classify_insn(al, ln, de)
        elif ln.kind == "data":
            status[i] = classify_data(al, ln, de)
        elif ln.kind in ("macro", "other") and ln.start is not None and ln.end is not None and ln.end > ln.start:
            status[i] = classify_code_range(al, ln, de)
    return status


def report(al, lines, status):
    per_bank = defaultdict(Counter)
    for i, st in status.items():
        ln = lines[i]
        per_bank[ln.start >> 16][st] += ln.end - ln.start
    funcs = defaultdict(lambda: defaultdict(set))
    cur = None
    for i, ln in enumerate(lines):
        if ln.kind == "label" and not ln.label.startswith("."):
            cur = (ln.start >> 16 if ln.start else None, ln.label)
        if i in status and cur and cur[0] is not None:
            funcs[cur[0]][cur[1]].add(status[i])
    rows = []
    for b in BANKS:
        c = per_bank[b]
        tot = sum(c.values())
        fn = funcs[b]
        changed = sum(1 for v in fn.values() if "diff" in v)
        rows.append({"bank": b, "bytes": tot, "same": c["same"], "reloc": c["reloc"] + c["ramlit"],
                     "diff": c["diff"], "labels": len(fn), "changed": changed})
    return rows


def count_blocks():
    """Number of `if !REGION_DE` patch blocks per bank in the current sources."""
    out = Counter()
    for rel in usmap.MODULE_ORDER:
        n = (usmap.CODE_DIR / rel).read_text(encoding="utf-8").count("\n    if !REGION_DE\n")
        out[int(rel[5:7], 16)] += n
    return out


MARK_BEGIN = "<!-- DE-ALIGN-BEGIN (generated by tools/analysis/align_regions.py --md) -->"
MARK_END = "<!-- DE-ALIGN-END -->"


def markdown(rows, blocks):
    tot = sum(r["bytes"] for r in rows)
    ts = sum(r["same"] for r in rows)
    tr = sum(r["reloc"] for r in rows)
    td = sum(r["diff"] for r in rows)
    out = [MARK_BEGIN, "",
           "| Bank | Source bytes | Identical to DE | Identical after relocation | DE specific | Global labels (with DE changes) | DE patch blocks |",
           "|---|---|---|---|---|---|---|"]
    for r in rows:
        out.append("| ${b:02X} | {bytes} | {same} ({ps:.1f}%) | {reloc} ({pr:.1f}%) | {diff} ({pd:.1f}%) | {labels} ({changed}) | {nb} |".format(
            b=r["bank"], bytes=r["bytes"], same=r["same"], reloc=r["reloc"], diff=r["diff"], labels=r["labels"],
            changed=r["changed"], ps=100 * r["same"] / r["bytes"], pr=100 * r["reloc"] / r["bytes"],
            pd=100 * r["diff"] / r["bytes"], nb=blocks.get(r["bank"], 0)))
    out.append("| **Total** | {} | {} ({:.1f}%) | {} ({:.1f}%) | {} ({:.1f}%) | | {} |".format(
        tot, ts, 100 * ts / tot, tr, 100 * tr / tot, td, 100 * td / tot, sum(blocks.values())))
    out += ["", MARK_END]
    return "\n".join(out)


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--de", required=True, type=Path)
    ap.add_argument("--us", type=Path)
    ap.add_argument("--md", type=Path, help="replace the generated coverage table (between the DE-ALIGN markers) in this file")
    args = ap.parse_args()
    de = args.de.read_bytes()
    if args.us:
        us = args.us.read_bytes()
    else:
        us, _ = build_us_rom()
    al = Aligner(us, de)
    lines = usmap.load_us_source(us)
    status = classify_lines(al, lines, de)
    rows = report(al, lines, status)
    blocks = count_blocks()
    print("bank  bytes    same   reloc    diff  labels(changed) patch blocks")
    for r in rows:
        print("${bank:02X} {bytes:7d} {same:7d} {reloc:7d} {diff:7d}  {labels}({changed})  {nb}".format(nb=blocks.get(r["bank"], 0), **r))
    md = markdown(rows, blocks)
    if args.md:
        text = args.md.read_text(encoding="utf-8")
        if MARK_BEGIN in text:
            a, b = text.index(MARK_BEGIN), text.index(MARK_END) + len(MARK_END)
            text = text[:a] + md + text[b:]
        else:
            text = text.rstrip("\n") + "\n\n" + md + "\n"
        args.md.write_text(text, encoding="utf-8", newline="\n")


if __name__ == "__main__":
    sys.exit(main())
