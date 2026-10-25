"""Helpers to express a range of DE code/data as asar source, reusing US names (used by tools/migration/de_patch.py).

NameResolver  - maps DE addresses/RAM values back to US label and RAM names.
decode_range  - decodes a DE byte range into instructions, trying the plausible M/X states.
emit_variant  - produces the text lines of a DE specific variant for a block of US source lines.
"""
import re
from collections import Counter, defaultdict

import usmap
from align_regions import (DP_MODES, ADDR_MODES_16, LONG_MODES, RAM_SHIFT, RAM_SHIFT_START, RAM_SHIFT_END,
                           split_items, is_symbolic)
from disasm65816 import Disassembler, decode, lorom_off, _OPS, Insn, _SUFFIX, _OPERAND_FMT


class NameResolver:
    def __init__(self, lines, syms, al, de_rom, lm=None):
        self.al, self.de, self.us = al, de_rom, al.us
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
            if mode not in DP_MODES and mode not in ADDR_MODES_16:
                continue
            code = re.sub(r"^\s*[+\-]+\s+", "", ln.text.split(";")[0]).strip()
            parts = code.split(None, 1)
            if len(parts) < 2 or not is_symbolic(parts[1]):
                continue
            val = int.from_bytes(ln.raw[1:], "little")
            if mode in ADDR_MODES_16 and val >= 0x8000:
                continue
            op = parts[1].strip()
            op = re.sub(r",[XYS]$", "", op)
            op = re.sub(r"^[\[(]|[\])]$", "", op) if mode in DP_MODES else op
            op = re.sub(r"\)$|\],Y$|\)\,Y$", "", op)
            if op.startswith("(") or "[" in op or "," in op or "#" in op:
                continue
            kind = "dp" if mode in DP_MODES else "abs"
            self.ram[(kind, val)][op] += 1
        self.ram_choice = {k: c.most_common(1)[0][0] for k, c in self.ram.items()}

    # --- ROM names -----------------------------------------------------------------
    def rom_label(self, target, scope):
        """Name for a DE ROM address, or None. `scope` is the global label the text will be placed under."""
        bank = target >> 16
        if not target & 0x8000:
            return None
        if 0x80 <= bank <= 0x85:
            u = self.al.r(target)
        else:
            # data banks: names only where the DE data at that address equals the US data
            o = lorom_off(target)
            u = target if self.us[o:o + 16] == self.de[o:o + 16] else None
        if 0x80 <= bank <= 0x85 and self.lm is not None:
            u2 = self.inv_labels.get(target)
            if u2 is not None:
                u = u2
            elif u is not None and self.lm.de_addr(u) != target and u in self.labels_at:
                u = None   # alignment says "same position" but the reference votes disagree
        if u is None:
            return None
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

    # --- RAM names -----------------------------------------------------------------
    def ram_label(self, de_val, mode):
        kind = "dp" if mode in DP_MODES else "abs"
        if RAM_SHIFT_START <= de_val < RAM_SHIFT_START + RAM_SHIFT:
            return None   # the 6 bytes DE added to the weekday names: no US counterpart
        us_val = de_val - RAM_SHIFT if RAM_SHIFT_START + RAM_SHIFT <= de_val < RAM_SHIFT_END + RAM_SHIFT else de_val
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


def operand_symbol(res, ins, scope, targets):
    """Symbolic operand text for `ins` or None (the disassembler then prints a hex literal)."""
    mode = ins.mode
    val = ins.operand
    bank = ins.addr >> 16
    if mode in ("jabs", "jlong"):
        t = ins.target
        n = res.rom_label(t, scope)
        return n
    if mode in ("abs", "absx", "absy", "absind", "absindx", "absindl", "pea") and val >= 0x8000:
        n = res.rom_label((bank << 16) | val, scope)
        return n
    if mode in ("abs", "absx", "absy") or mode in DP_MODES:
        n = res.ram_label(val, mode)
        return n
    if mode in LONG_MODES:
        n = res.rom_label(val, scope) if (val >> 16) >= 0x80 else None
        return n
    if mode in ("immM", "immX") and ins.length == 3 and val >= 0x8000:
        return None
    return None


def emit_code(res, rom, insns, scope, label_at, anon_at, local_prefix, equates):
    """Text lines for decoded DE instructions. `label_at` maps DE addr -> [label text]; `anon_at` maps addr -> anon marker."""
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
                d.labels[t] = "%s%06X" % (local_prefix, t)
            else:
                n = res.rom_label(t, scope)
                if n:
                    d.labels[t] = n
                else:
                    d.labels[t] = "L_%06X" % t
                    equates.add(t)
    generated = {t: n for t, n in d.labels.items() if t in in_block and n.startswith(local_prefix)}

    def sym(ins):
        return operand_symbol(res, ins, scope, equates)

    emitted = set()
    for i in insns:
        for lab in label_at.get(i.addr, []):
            out.append(lab + ":")
            emitted.add(i.addr)
        if i.addr in generated and generated[i.addr] not in label_at.get(i.addr, []):
            out.append(generated[i.addr] + ":")
        txt = d.line(i, comments=True, symbol=sym)
        pre = anon_at.get(i.addr)
        if pre:
            txt = "  " + pre + txt[3:] if txt.startswith("    ") else txt
        out.append(txt)
    missed = {a: l for a, l in label_at.items() if a not in emitted}
    return out, missed
