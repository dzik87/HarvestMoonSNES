#!/usr/bin/env python3
"""65816 disassembler with M/X flag tracking, emitting asar syntax in the style of src/code.

Library use:
    from disasm65816 import Disassembler
    d = Disassembler(rom_bytes)               # LoROM image, 2 MB
    d.follow(0x808000, m=1, x=1)              # recursive flow following from an entry point
    d.sweep(0x80A000, 0x80B000)               # linear sweep of a gap (best effort)
    print("\\n".join(d.emit(0x808000, 0x809000)))

CLI:
    python tools/analysis/disasm65816.py ROM.sfc 0x808000 0x808100 [--m 1 --x 1] [--no-comments]

Flag tracking (M = accumulator width, X = index width; flag value 1 means 8 bit):
  * REP/SEP update the state, PHP/PLP are tracked with a stack (best effort),
  * XCE and unknown states make the immediate width ambiguous: such instructions are reported
    through `Disassembler.ambiguous` and decoded with the state that was assumed,
  * per-address hints (`hints[addr] = (m, x)`) override the tracked state (used for labels
    that are reached with a known state, e.g. after a JSL return).

The emitted text assembles to exactly the input bytes: every operand has an explicit size suffix
(.B/.W/.L) so asar never picks a shorter encoding.
"""
import argparse
import sys

# ---------------------------------------------------------------------------------------------
# Opcode table. Addressing modes:
#   imp  acc  immM immX imm8  dp dpx dpy  abs absx absy  long longx  ind indx indy indl indly
#   sr sry  absind absindx absindl  rel rell  blk  pea pei per  jabs jlong (JSR/JMP/JSL/JML targets)
# ---------------------------------------------------------------------------------------------
_OPS = {}


def _def(op, mn, mode):
    _OPS[op] = (mn, mode)


def _group(base, mn, modes):
    for off, mode in modes.items():
        _def(base + off, mn, mode)


_ALU = {0x01: "indx", 0x03: "sr", 0x05: "dp", 0x07: "indl", 0x09: "immM", 0x0D: "abs", 0x0F: "long",
        0x11: "indy", 0x12: "ind", 0x13: "sry", 0x15: "dpx", 0x17: "indly", 0x19: "absy", 0x1D: "absx", 0x1F: "longx"}
for _base, _mn in ((0x00, "ORA"), (0x20, "AND"), (0x40, "EOR"), (0x60, "ADC"), (0x80, "STA"), (0xA0, "LDA"),
                   (0xC0, "CMP"), (0xE0, "SBC")):
    for _off, _mode in _ALU.items():
        if _mn == "STA" and _off == 0x09:
            continue  # no STA immediate (0x89 is BIT #)
        _def(_base + _off, _mn, _mode)

# shifts / rotates / inc / dec
for _base, _mn in ((0x00, "ASL"), (0x20, "ROL"), (0x40, "LSR"), (0x60, "ROR")):
    _def(_base + 0x06, _mn, "dp"); _def(_base + 0x0A, _mn, "acc"); _def(_base + 0x0E, _mn, "abs")
    _def(_base + 0x16, _mn, "dpx"); _def(_base + 0x1E, _mn, "absx")
_def(0xC6, "DEC", "dp"); _def(0xCE, "DEC", "abs"); _def(0xD6, "DEC", "dpx"); _def(0xDE, "DEC", "absx"); _def(0x3A, "DEC", "acc")
_def(0xE6, "INC", "dp"); _def(0xEE, "INC", "abs"); _def(0xF6, "INC", "dpx"); _def(0xFE, "INC", "absx"); _def(0x1A, "INC", "acc")

# index loads / stores / compares
_def(0xA0, "LDY", "immX"); _def(0xA4, "LDY", "dp"); _def(0xAC, "LDY", "abs"); _def(0xB4, "LDY", "dpx"); _def(0xBC, "LDY", "absx")
_def(0xA2, "LDX", "immX"); _def(0xA6, "LDX", "dp"); _def(0xAE, "LDX", "abs"); _def(0xB6, "LDX", "dpy"); _def(0xBE, "LDX", "absy")
_def(0x84, "STY", "dp"); _def(0x8C, "STY", "abs"); _def(0x94, "STY", "dpx")
_def(0x86, "STX", "dp"); _def(0x8E, "STX", "abs"); _def(0x96, "STX", "dpy")
_def(0x64, "STZ", "dp"); _def(0x74, "STZ", "dpx"); _def(0x9C, "STZ", "abs"); _def(0x9E, "STZ", "absx")
_def(0xC0, "CPY", "immX"); _def(0xC4, "CPY", "dp"); _def(0xCC, "CPY", "abs")
_def(0xE0, "CPX", "immX"); _def(0xE4, "CPX", "dp"); _def(0xEC, "CPX", "abs")
_def(0x24, "BIT", "dp"); _def(0x2C, "BIT", "abs"); _def(0x34, "BIT", "dpx"); _def(0x3C, "BIT", "absx"); _def(0x89, "BIT", "immM")
_def(0x04, "TSB", "dp"); _def(0x0C, "TSB", "abs"); _def(0x14, "TRB", "dp"); _def(0x1C, "TRB", "abs")

# branches / jumps
for _op, _mn in ((0x10, "BPL"), (0x30, "BMI"), (0x50, "BVC"), (0x70, "BVS"), (0x80, "BRA"), (0x90, "BCC"),
                  (0xB0, "BCS"), (0xD0, "BNE"), (0xF0, "BEQ")):
    _def(_op, _mn, "rel")
_def(0x82, "BRL", "rell")
_def(0x4C, "JMP", "jabs"); _def(0x5C, "JML", "jlong"); _def(0x6C, "JMP", "absind"); _def(0x7C, "JMP", "absindx"); _def(0xDC, "JML", "absindl")
_def(0x20, "JSR", "jabs"); _def(0x22, "JSL", "jlong"); _def(0xFC, "JSR", "absindx")
_def(0x60, "RTS", "imp"); _def(0x6B, "RTL", "imp"); _def(0x40, "RTI", "imp")
_def(0x00, "BRK", "imm8"); _def(0x02, "COP", "imm8"); _def(0x42, "WDM", "imm8")
_def(0xF4, "PEA", "pea"); _def(0xD4, "PEI", "pei"); _def(0x62, "PER", "per")
_def(0x44, "MVP", "blk"); _def(0x54, "MVN", "blk")
_def(0xC2, "REP", "imm8"); _def(0xE2, "SEP", "imm8")

for _op, _mn in ((0x08, "PHP"), (0x28, "PLP"), (0x48, "PHA"), (0x68, "PLA"), (0x5A, "PHY"), (0x7A, "PLY"), (0xDA, "PHX"),
                 (0xFA, "PLX"), (0x0B, "PHD"), (0x2B, "PLD"), (0x4B, "PHK"), (0x8B, "PHB"), (0xAB, "PLB"),
                 (0x18, "CLC"), (0x38, "SEC"), (0x58, "CLI"), (0x78, "SEI"), (0xB8, "CLV"), (0xD8, "CLD"), (0xF8, "SED"),
                 (0xAA, "TAX"), (0xA8, "TAY"), (0x8A, "TXA"), (0x98, "TYA"), (0x9A, "TXS"), (0xBA, "TSX"), (0x9B, "TXY"),
                 (0xBB, "TYX"), (0x5B, "TCD"), (0x7B, "TDC"), (0x1B, "TCS"), (0x3B, "TSC"), (0xCA, "DEX"), (0x88, "DEY"),
                 (0xE8, "INX"), (0xC8, "INY"), (0xEA, "NOP"), (0xEB, "XBA"), (0xFB, "XCE"), (0xCB, "WAI"), (0xDB, "STP")):
    _def(_op, _mn, "imp")

assert len(_OPS) == 256, len(_OPS)

_SUFFIX = {"dp": ".B", "dpx": ".B", "dpy": ".B", "ind": ".B", "indx": ".B", "indy": ".B", "indl": ".B", "indly": ".B",
           "sr": ".B", "sry": ".B", "pei": ".B", "abs": ".W", "absx": ".W", "absy": ".W", "absind": ".W", "absindx": ".W",
           "absindl": ".W", "jabs": ".W", "pea": ".W", "long": ".L", "longx": ".L", "jlong": ".L"}

_OPERAND_FMT = {
    "dp": "{o}", "dpx": "{o},X", "dpy": "{o},Y", "ind": "({o})", "indx": "({o},X)", "indy": "({o}),Y", "indl": "[{o}]",
    "indly": "[{o}],Y", "sr": "{o},S", "sry": "({o},S),Y", "pei": "({o})", "abs": "{o}", "absx": "{o},X", "absy": "{o},Y",
    "absind": "({o})", "absindx": "({o},X)", "absindl": "[{o}]", "jabs": "{o}", "pea": "{o}", "long": "{o}",
    "longx": "{o},X", "jlong": "{o}",
}

# instruction classes for flow control
_UNCOND_END = {"RTS", "RTL", "RTI", "JMP", "JML", "BRA", "BRL", "STP"}
_COND_BRANCH = {"BPL", "BMI", "BVC", "BVS", "BCC", "BCS", "BNE", "BEQ"}

# mnemonics that cannot be bank-addressed data references in the mask sense
ADDR_MODES = {"abs", "absx", "absy", "long", "longx", "jabs", "jlong", "absind", "absindx", "absindl", "pea"}
REL_MODES = {"rel", "rell"}


def lorom_off(addr):
    """24-bit LoROM address ($80-$BF banks) -> file offset."""
    return ((addr >> 16) & 0x3F) * 0x8000 + (addr & 0x7FFF)


class Insn:
    __slots__ = ("addr", "op", "mn", "mode", "length", "operand", "raw", "m", "x", "target")

    def __repr__(self):
        return f"<{self.addr:06X} {self.mn} {self.mode} {self.operand}>"


def insn_length(mode, m, x):
    if mode in ("imp", "acc"):
        return 1
    if mode == "immM":
        return 2 if m else 3
    if mode == "immX":
        return 2 if x else 3
    if mode in ("imm8", "dp", "dpx", "dpy", "ind", "indx", "indy", "indl", "indly", "sr", "sry", "pei", "rel"):
        return 2
    if mode in ("long", "longx", "jlong"):
        return 4
    return 3  # abs*, rell, per, pea, blk, ...


def decode(rom, addr, m, x):
    """Decode one instruction at 24-bit `addr` with the given flag state. Returns Insn or None at end of bank."""
    off = lorom_off(addr)
    mn, mode = _OPS[rom[off]]
    n = insn_length(mode, m, x)
    if (addr & 0x7FFF) + n > 0x8000 + 0 and (addr & 0xFFFF) + n > 0x10000:
        return None
    raw = bytes(rom[off:off + n])
    if len(raw) < n:
        return None
    i = Insn()
    i.addr, i.op, i.mn, i.mode, i.length, i.raw, i.m, i.x = addr, raw[0], mn, mode, n, raw, m, x
    i.target = None
    bank = addr & 0xFF0000
    if n == 1:
        i.operand = None
    elif n == 2:
        i.operand = raw[1]
    elif n == 3:
        i.operand = raw[1] | (raw[2] << 8)
    else:
        i.operand = raw[1] | (raw[2] << 8) | (raw[3] << 16)
    if mode == "rel":
        d = raw[1] - 256 if raw[1] >= 128 else raw[1]
        i.target = bank | ((addr + 2 + d) & 0xFFFF)
    elif mode == "rell":
        d = i.operand - 65536 if i.operand >= 32768 else i.operand
        i.target = bank | ((addr + 3 + d) & 0xFFFF)
    elif mode == "per":
        d = i.operand - 65536 if i.operand >= 32768 else i.operand
        i.target = bank | ((addr + 3 + d) & 0xFFFF)
    elif mode == "jabs":
        i.target = bank | i.operand
    elif mode == "jlong":
        i.target = i.operand
    return i


class Disassembler:
    def __init__(self, rom):
        self.rom = rom
        self.insns = {}          # addr -> Insn
        self.labels = {}         # addr -> name (user supplied or generated)
        self.hints = {}          # addr -> (m, x) forced state
        self.ambiguous = []      # addrs where the flag state was unknown
        self.entries = set()
        self.branch_targets = set()
        self.call_targets = set()
        self.conflicts = []      # addr decoded with differing flag states
        self.used_targets = set()

    # --- flow following -------------------------------------------------------------------
    def follow(self, entry, m=1, x=1, stack=None):
        """Recursive descent from `entry`. State is (m, x, php-stack tuple)."""
        work = [(entry, m, x, tuple(stack or ()))]
        self.entries.add(entry)
        seen_states = set()
        while work:
            addr, m, x, st = work.pop()
            while True:
                if (addr, m, x) in seen_states:
                    break
                seen_states.add((addr, m, x))
                if addr in self.hints:
                    m, x = self.hints[addr]
                try:
                    ins = decode(self.rom, addr, m, x)
                except (KeyError, IndexError):
                    ins = None
                if ins is None:
                    break
                old = self.insns.get(addr)
                if old is not None and (old.m, old.x) != (m, x) and old.mode in ("immM", "immX"):
                    self.conflicts.append((addr, (old.m, old.x), (m, x)))
                self.insns[addr] = ins
                mn = ins.mn
                if mn == "REP":
                    if ins.operand & 0x20: m = 0
                    if ins.operand & 0x10: x = 0
                elif mn == "SEP":
                    if ins.operand & 0x20: m = 1
                    if ins.operand & 0x10: x = 1
                elif mn == "PHP":
                    st = st + ((m, x),)
                elif mn == "PLP":
                    if st:
                        (m, x), st = st[-1], st[:-1]
                elif mn == "XCE":
                    self.ambiguous.append(addr)
                if mn in _COND_BRANCH:
                    self.branch_targets.add(ins.target)
                    work.append((ins.target, m, x, st))
                elif mn in ("BRA", "BRL"):
                    self.branch_targets.add(ins.target)
                    addr, = (ins.target,)
                    continue
                elif mn in ("JMP",) and ins.mode == "jabs":
                    self.branch_targets.add(ins.target)
                    addr = ins.target
                    continue
                elif mn == "JML" and ins.mode == "jlong":
                    self.branch_targets.add(ins.target)
                    addr = ins.target
                    continue
                elif mn in ("JSR", "JSL") and ins.mode in ("jabs", "jlong"):
                    self.call_targets.add(ins.target)
                    work.append((ins.target, m, x, ()))
                if mn in _UNCOND_END:
                    break
                addr = ins.addr + ins.length
                if (addr & 0xFFFF) < 0x8000:
                    break

    def sweep(self, start, end, m=1, x=1):
        """Linear sweep of [start, end) for bytes not yet covered. Best effort; stops at invalid flow."""
        addr = start
        while addr < end:
            if addr in self.insns:
                ins = self.insns[addr]
                m, x = ins.m, ins.x
                self._apply(ins)
                m, x = self._state_after(ins)
                addr += ins.length
                continue
            ins = decode(self.rom, addr, m, x)
            if ins is None:
                break
            self.insns[addr] = ins
            m, x = self._state_after(ins)
            addr += ins.length

    @staticmethod
    def _apply(ins):
        return

    @staticmethod
    def _state_after(ins):
        m, x = ins.m, ins.x
        if ins.mn == "REP":
            if ins.operand & 0x20: m = 0
            if ins.operand & 0x10: x = 0
        elif ins.mn == "SEP":
            if ins.operand & 0x20: m = 1
            if ins.operand & 0x10: x = 1
        return m, x

    # --- text emission ---------------------------------------------------------------------
    def target_name(self, target):
        """Label for a branch/PER target. asar does not accept literal addresses for relative branches, so targets
        without a user label get `L_<addr>` and are recorded in `used_targets` (the caller defines them)."""
        lab = self.labels.get(target)
        if lab:
            return lab
        self.used_targets.add(target)
        return "L_%06X" % target

    def target_defs(self):
        """asar equates for every generated `L_<addr>` name that is not defined by an emitted label."""
        return ["L_%06X = $%06X" % (t, t) for t in sorted(self.used_targets) if t not in self.labels]

    def operand_text(self, ins, symbol=None):
        """Operand text. `symbol(ins)` may return a replacement string for the operand value (label/RAM name)."""
        mode, mn = ins.mode, ins.mn
        if mode in ("imp",):
            return mn
        if mode == "acc":
            return f"{mn} A"
        if mode in ("immM", "immX"):
            w = 2 if ins.length == 2 else 4
            val = symbol(ins) if symbol else None
            suf = ".B" if ins.length == 2 else ".W"
            return f"{mn}{suf} #{val if val else '$%0*X' % (w, ins.operand)}"
        if mode == "imm8":
            return f"{mn} #${ins.operand:02X}"
        if mode in ("rel", "rell"):
            return f"{mn} {self.target_name(ins.target)}"
        if mode == "per":
            return f"PER.W {self.target_name(ins.target)}"
        if mode == "blk":
            return f"{mn} ${ins.raw[2]:02X},${ins.raw[1]:02X}"
        o = symbol(ins) if symbol else None
        if not o:
            if mode in ("jabs", "jlong"):
                lab = self.labels.get(ins.target)
                o = lab or ("$%04X" % ins.operand if mode == "jabs" else "$%06X" % ins.operand)
            else:
                w = {1: 2, 2: 4, 3: 6}[ {2: 1, 3: 2, 4: 3}[ins.length] ]
                o = "$%0*X" % (w, ins.operand)
        return f"{mn}{_SUFFIX[mode]} " + _OPERAND_FMT[mode].format(o=o)

    def line(self, ins, comments=True, symbol=None, width=59):
        text = "    " + self.operand_text(ins, symbol)
        if comments:
            tgt = "      "
            if ins.target is not None and ins.mode not in ("per",):
                tgt = "%06X" % ins.target
            text = text.ljust(width) + ";%06X|%-8s|%s;" % (ins.addr, ins.raw.hex().upper(), tgt)
        return text

    def emit(self, start, end, comments=True, symbol=None, data_prefix="    db "):
        """Emit [start, end): instructions where decoded, `db` lines elsewhere. Labels are emitted on own lines."""
        out = []
        addr = start
        while addr < end:
            if addr in self.labels:
                out.append("")
                out.append(self.labels[addr] + ":")
            ins = self.insns.get(addr)
            if ins is not None and addr + ins.length <= end:
                out.append(self.line(ins, comments, symbol))
                addr += ins.length
                continue
            # data run until next instruction start or label
            run = []
            a = addr
            while a < end and (a == addr or (a not in self.insns and a not in self.labels)) and len(run) < 16:
                run.append(self.rom[lorom_off(a)])
                a += 1
            out.append(data_prefix + ",".join("$%02X" % b for b in run))
            addr = a
        return out

    def assign_labels(self, prefix="fCode_"):
        for t in sorted(self.branch_targets | self.call_targets):
            if t in self.insns and t not in self.labels:
                self.labels[t] = "%s%06X" % (prefix, t)


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("rom")
    ap.add_argument("start", type=lambda s: int(s, 16))
    ap.add_argument("end", type=lambda s: int(s, 16))
    ap.add_argument("--m", type=int, default=1)
    ap.add_argument("--x", type=int, default=1)
    ap.add_argument("--no-comments", action="store_true")
    ap.add_argument("--sweep", action="store_true", help="linear sweep instead of flow following")
    a = ap.parse_args()
    rom = open(a.rom, "rb").read()
    d = Disassembler(rom)
    if a.sweep:
        d.sweep(a.start, a.end, a.m, a.x)
    else:
        d.follow(a.start, a.m, a.x)
    d.assign_labels()
    print("\n".join(d.emit(a.start, a.end, not a.no_comments)))


if __name__ == "__main__":
    sys.exit(main())
