"""Helpers to express a range of regional (EU/DE/JP) code or data as asar source, reusing US names
(used by tools/migration/region_patch.py).

NameResolver  - maps region addresses/RAM values back to US label and RAM names.
decode_range  - decodes a region byte range into instructions, trying the plausible M/X states.
emit_code     - produces the text lines of a region specific variant for a block of US source lines.

The emitted text carries no address comments and no region dependent names, so the variants of different regions
are textually identical when the code is identical (the patch tool then merges them into one block):
  * branch targets / data pointers without a US label become `L_<US address>` equates (defined per region in
    src/code/region_targets.asm), generated local labels are numbered `.r_<block>_<n>`,
  * WRAM addresses are written with the US value plus `+!RAM_SHIFT` (the region's shift of the shifted block).
"""
import re
from collections import Counter, defaultdict

import usmap
import align_regions as AR
from align_regions import (DP_MODES, ADDR_MODES_16, LONG_MODES, RAM_SHIFT_START, RAM_SHIFT_END,
                           split_items, is_symbolic)
from disasm65816 import Disassembler, decode, lorom_off, _OPS, Insn, _SUFFIX, _OPERAND_FMT


class NameResolver:
    def __init__(self, lines, syms, al, de_rom, lm=None, region="DE"):
        self.al, self.de, self.us = al, de_rom, al.us
        self.region = region
        self.syms = syms
        self.lm = lm
        self.labels_at = defaultdict(list)   # US addr -> [(qualified name, global, sub)]
        G = None
        for ln in lines:
            if ln.kind != "label" or ln.start is None:
                continue
            name = ln.label
            if not name.startswith("."):
                G = name
                self.labels_at[ln.start].append((name, name, None))
            elif G and not name.startswith(".."):
                self.labels_at[ln.start].append((G + name, G, name))
        self.inv_labels = {}
        if lm is not None:
            for u in self.labels_at:
                t = lm.de_addr(u) if u & 0x8000 else None
                if t is not None:
                    self.inv_labels.setdefault(t, u)
        self.ram = defaultdict(Counter)       # ('dp'|'abs', US value) -> Counter(text)
        for ln in lines:
            if ln.kind != "insn":
                continue
            mode = _OPS[ln.raw[0]][1]
            if mode not in DP_MODES and mode not in ADDR_MODES_16 and mode not in LONG_MODES:
                continue
            code = re.sub(r"^\s*[+\-]+\s+", "", ln.text.split(";")[0]).strip()
            parts = code.split(None, 1)
            if len(parts) < 2 or not is_symbolic(parts[1]):
                continue
            val = int.from_bytes(ln.raw[1:], "little")
            if mode in ADDR_MODES_16 and val >= 0x8000:
                continue
            if mode in LONG_MODES and not AR.is_wram_long(val):
                continue
            op = parts[1].strip()
            op = re.sub(r",[XYS]$", "", op)
            op = re.sub(r"^[\[(]|[\])]$", "", op) if mode in DP_MODES else op
            op = re.sub(r"\)$|\],Y$|\)\,Y$", "", op)
            if op.startswith("(") or "[" in op or "," in op or "#" in op:
                continue
            kind = "dp" if mode in DP_MODES else ("long" if mode in LONG_MODES else "abs")
            self.ram[(kind, val)][op] += 1
        self.ram_choice = {k: c.most_common(1)[0][0] for k, c in self.ram.items()}

    # --- ROM names -----------------------------------------------------------------
    def us_addr(self, target):
        """US address that corresponds to the region ROM address `target`, or None."""
        bank = target >> 16
        if not target & 0x8000:
            return None
        if 0x80 <= bank <= 0x85:
            u = self.al.r(target)
        else:
            # data banks: names only where the region data at that address equals the US data
            o = lorom_off(target)
            u = target if self.us[o:o + 16] == self.de[o:o + 16] else None
        if 0x80 <= bank <= 0x85 and self.lm is not None:
            u2 = self.inv_labels.get(target)
            if u2 is not None:
                u = u2
            elif u is not None and self.lm.de_addr(u) != target and u in self.labels_at:
                u = None   # alignment says "same position" but the reference votes disagree
        return u

    def rom_label(self, target, scope):
        """Name for a region ROM address, or None. `scope` is the global label the text will be placed under."""
        u = self.us_addr(target)
        if u is None:
            return None
        bank = target >> 16
        cands = self.labels_at.get(u)
        if cands:
            for q, g, s in cands:
                if s is None:
                    return q
            q, g, s = cands[0]
            return s if g == scope else q
        names = self.syms.get(u) if not (0x80 <= bank <= 0x85) else None
        if names:
            return sorted(names, key=len)[0]
        return None

    def target_equate(self, target, equates):
        """Name of an `L_` equate for region code address `target` (recorded in `equates`: name -> address)."""
        u = self.us_addr(target)
        name = "L_%06X" % u if u is not None else "L_%s_%06X" % (self.region, target)
        if equates.get(name, target) != target:
            name = "L_%s_%06X" % (self.region, target)
        equates[name] = target
        return name

    # --- RAM names -----------------------------------------------------------------
    def ram_label(self, reg_val, mode):
        kind = "dp" if mode in DP_MODES else "abs"
        us_val = AR.RAM.reg2us(reg_val)
        if us_val is None:
            return None   # a field that exists only in this region
        return self.ram_choice.get((kind, us_val))


def decode_range(rom, start, end, m, x):
    """Decode [start, end) as instructions. Tries (m, x) first, then the other flag combinations.
    Returns a list of Insn or None if no state decodes cleanly onto `end`."""
    for mm, xx in ((m, x), (m, 1 - x), (1 - m, x), (1 - m, 1 - x)):
        out, a, cm, cx = [], start, mm, xx
        ok = True
        while a < end:
            ins = decode(rom, a, cm, cx)
            if ins is None or a + ins.length > end:
                ok = False
                break
            out.append(ins)
            if ins.mn == "REP":
                if ins.operand & 0x20: cm = 0
                if ins.operand & 0x10: cx = 0
            elif ins.mn == "SEP":
                if ins.operand & 0x20: cm = 1
                if ins.operand & 0x10: cx = 1
            a += ins.length
        if ok and a == end:
            return out
    return None


def _hex(v, n):
    return "$%0*X" % (n * 2, v)


def _ram_literal(val, long_bank=False):
    """Literal for a region WRAM address as US value + !RAM_SHIFT, or None when it is outside the shifted block."""
    us = AR.RAM.reg2us(val & 0xFFFF)
    if us is None or not AR.RAM.us_shifted(us):
        return None
    base = "$%06X" % ((val & ~0xFFFF) | us) if long_bank else "$%04X" % us
    return base + "+!RAM_SHIFT"


def operand_symbol(res, ins, scope, equates):
    """Symbolic operand text for `ins` or None (the disassembler then prints a hex literal)."""
    mode = ins.mode
    val = ins.operand
    bank = ins.addr >> 16

    def code_ref(t):
        n = res.rom_label(t, scope)
        if n is None and 0x80 <= (t >> 16) <= 0x85 and t & 0x8000 and res.us_addr(t) is not None:
            n = res.target_equate(t, equates)
        return n
    if mode in ("jabs", "jlong"):
        return code_ref(ins.target)
    if mode in ("abs", "absx", "absy", "absind", "absindx", "absindl", "pea") and val >= 0x8000:
        return code_ref((bank << 16) | val)
    if mode in ("abs", "absx", "absy") or mode in DP_MODES:
        n = res.ram_label(val, mode)
        if n is None and mode in ("abs", "absx", "absy"):
            n = _ram_literal(val)
        return n
    if mode in LONG_MODES:
        if AR.is_wram_long(val):
            us = AR.RAM.reg2us(val & 0xFFFF)
            if us is not None:
                n = res.ram_choice.get(("long", (val & ~0xFFFF) | us))
                if n:
                    return n
            return _ram_literal(val, long_bank=True)
        return code_ref(val) if (val >> 16) >= 0x80 else None
    return None


def emit_code(res, rom, insns, scope, label_at, anon_at, local_prefix, equates):
    """Text lines for decoded region instructions (no address comments). `label_at` maps region addr -> [label text];
    `anon_at` maps addr -> anonymous label marker; `equates` collects `L_` names (name -> region address)."""
    d = Disassembler(rom)
    in_block = {i.addr for i in insns}
    out = []
    # names for branch targets
    for i in insns:
        if i.mode in ("rel", "rell", "per"):
            t = i.target
            if t in label_at:
                d.labels[t] = label_at[t][0]
            elif t in in_block:
                d.labels[t] = "\0%06X" % t   # numbered below
            else:
                d.labels[t] = res.rom_label(t, scope) or res.target_equate(t, equates)
    numbered = {}
    for n, t in enumerate(sorted(t for t, name in d.labels.items() if name.startswith("\0")), 1):
        numbered[t] = "%s%d" % (local_prefix, n)
        d.labels[t] = numbered[t]
    generated = {t: n for t, n in d.labels.items() if t in in_block and t in numbered}

    def sym(ins):
        return operand_symbol(res, ins, scope, equates)

    emitted = set()
    for i in insns:
        for lab in label_at.get(i.addr, []):
            out.append(lab + ":")
            emitted.add(i.addr)
        if i.addr in generated and generated[i.addr] not in label_at.get(i.addr, []):
            out.append(generated[i.addr] + ":")
        txt = d.line(i, comments=False, symbol=sym)
        pre = anon_at.get(i.addr)
        if pre:
            txt = "  " + pre + txt[3:] if txt.startswith("    ") else txt
        out.append(txt)
    missed = {a: l for a, l in label_at.items() if a not in emitted}
    return out, missed
