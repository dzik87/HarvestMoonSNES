#!/usr/bin/env python3
"""Minimal SPC700 CPU emulator + host (65816) side of the game's audio protocol, used to build .spc snapshots.

The emulator is functional, not cycle exact: it executes the real sound driver (assets/audio/driver) with the port
protocol the 65816 code uses (docs/audio.md section 4), so RAM, DSP registers and CPU registers of the snapshot are
produced by the driver itself rather than being guessed.  There is no DSP/audio output here (see `audioconv.py render`).
"""
import struct

#: approximate cycles per instruction (only used to advance the timers)
_CYC = 3


class Spc:
    def __init__(self):
        self.ram = bytearray(65536)
        self.dsp = bytearray(128)
        self.a = self.x = self.y = 0
        self.sp = 0xEF
        self.pc = 0
        self.n = self.v = self.p = self.b = self.h = self.i = self.z = self.c = 0
        self.dspaddr = 0
        self.ctrl = 0x80
        self.cpu_in = [0, 0, 0, 0]       # ports written by the 65816, read by the SPC700 at $F4-$F7
        self.spc_out = [0, 0, 0, 0]      # ports written by the SPC700 (read by the 65816)
        self.target = [0, 0, 0]
        self.stage1 = [0, 0, 0]
        self.stage2 = [0, 0, 0]
        self.counter = [0, 0, 0]
        self.halted = False
        self.steps = 0

    # -- PSW ---------------------------------------------------------------
    def get_psw(self):
        return (self.n << 7) | (self.v << 6) | (self.p << 5) | (self.b << 4) | (self.h << 3) | (self.i << 2) | (self.z << 1) | self.c

    def set_psw(self, v):
        self.n, self.v, self.p, self.b = v >> 7 & 1, v >> 6 & 1, v >> 5 & 1, v >> 4 & 1
        self.h, self.i, self.z, self.c = v >> 3 & 1, v >> 2 & 1, v >> 1 & 1, v & 1

    # -- memory / I/O ------------------------------------------------------
    def rd(self, a):
        a &= 0xFFFF
        if 0xF0 <= a <= 0xFF:
            if a == 0xF3:
                return self.dsp[self.dspaddr & 0x7F]
            if 0xF4 <= a <= 0xF7:
                return self.cpu_in[a - 0xF4]
            if 0xFD <= a <= 0xFF:
                t = a - 0xFD
                v = self.counter[t]
                self.counter[t] = 0
                return v
            if a == 0xF2:
                return self.dspaddr
            return self.ram[a]
        return self.ram[a]

    def wr(self, a, v):
        a &= 0xFFFF
        v &= 0xFF
        self.ram[a] = v
        if 0xF0 <= a <= 0xFF:
            if a == 0xF1:
                if v & 0x10:
                    self.cpu_in[0] = self.cpu_in[1] = 0
                if v & 0x20:
                    self.cpu_in[2] = self.cpu_in[3] = 0
                for t in range(3):
                    if v >> t & 1 and not self.ctrl >> t & 1:
                        self.stage2[t] = 0
                        self.counter[t] = 0
                self.ctrl = v
            elif a == 0xF2:
                self.dspaddr = v
            elif a == 0xF3:
                if self.dspaddr < 128:
                    self.dsp[self.dspaddr] = v
            elif 0xF4 <= a <= 0xF7:
                self.spc_out[a - 0xF4] = v
            elif 0xFA <= a <= 0xFC:
                self.target[a - 0xFA] = v

    def dpa(self, o):
        return (0x100 if self.p else 0) + (o & 0xFF)

    def rdp(self, o):
        return self.rd(self.dpa(o))

    def wdp(self, o, v):
        self.wr(self.dpa(o), v)

    def fetch(self):
        v = self.rd(self.pc)
        self.pc = (self.pc + 1) & 0xFFFF
        return v

    def fetch16(self):
        lo = self.fetch()
        return lo | self.fetch() << 8

    def push(self, v):
        self.wr(0x100 + self.sp, v)
        self.sp = (self.sp - 1) & 0xFF

    def pop(self):
        self.sp = (self.sp + 1) & 0xFF
        return self.rd(0x100 + self.sp)

    def nz(self, v):
        v &= 0xFF
        self.n = v >> 7
        self.z = 1 if v == 0 else 0
        return v

    # -- ALU ---------------------------------------------------------------
    def adc(self, a, b):
        r = a + b + self.c
        self.v = 1 if (~(a ^ b) & (a ^ r) & 0x80) else 0
        self.h = 1 if ((a & 15) + (b & 15) + self.c) > 15 else 0
        self.c = 1 if r > 255 else 0
        return self.nz(r)

    def sbc(self, a, b):
        r = a - b - (1 - self.c)
        self.v = 1 if ((a ^ b) & (a ^ r) & 0x80) else 0
        self.h = 1 if ((a & 15) - (b & 15) - (1 - self.c)) >= 0 else 0
        self.c = 1 if r >= 0 else 0
        return self.nz(r)

    def alu(self, fam, a, b):
        """fam: 0 OR 1 AND 2 EOR 3 CMP 4 ADC 5 SBC.  Returns result (CMP: None)."""
        if fam == 0:
            return self.nz(a | b)
        if fam == 1:
            return self.nz(a & b)
        if fam == 2:
            return self.nz(a ^ b)
        if fam == 3:
            r = a - b
            self.c = 1 if r >= 0 else 0
            self.nz(r)
            return None
        if fam == 4:
            return self.adc(a, b)
        return self.sbc(a, b)

    def shift(self, kind, v):
        if kind == 0:      # ASL
            self.c = v >> 7
            return self.nz(v << 1)
        if kind == 1:      # LSR
            self.c = v & 1
            return self.nz(v >> 1)
        if kind == 2:      # ROL
            c = self.c
            self.c = v >> 7
            return self.nz((v << 1) | c)
        c = self.c         # ROR
        self.c = v & 1
        return self.nz((v >> 1) | (c << 7))

    # -- effective addresses for the regular 'A,<mode>' group (low nibble / row parity) --
    def ea(self, mode):
        if mode == "dp":
            return self.dpa(self.fetch())
        if mode == "dpx":
            return self.dpa(self.fetch() + self.x)
        if mode == "abs":
            return self.fetch16()
        if mode == "absx":
            return (self.fetch16() + self.x) & 0xFFFF
        if mode == "absy":
            return (self.fetch16() + self.y) & 0xFFFF
        if mode == "x":
            return self.dpa(self.x)
        if mode == "indx":
            o = self.dpa(self.fetch() + self.x)
            return self.rd(o) | self.rd((o & 0xFF00) | ((o + 1) & 0xFF)) << 8
        if mode == "indy":
            o = self.dpa(self.fetch())
            return ((self.rd(o) | self.rd((o & 0xFF00) | ((o + 1) & 0xFF)) << 8) + self.y) & 0xFFFF
        raise ValueError(mode)

    def run(self, n):
        for _ in range(n):
            self.step()
            if self.halted:
                break

    def tick_timers(self):
        self.cyc_acc += _CYC
        # timers 0/1: every 128 cycles; timer 2: every 16 cycles (one stage per period)
        for t in range(3):
            per = 16 if t == 2 else 128
            self.stage1[t] += _CYC
            while self.stage1[t] >= per:
                self.stage1[t] -= per
                if self.ctrl >> t & 1:
                    self.stage2[t] += 1
                    if self.stage2[t] == (self.target[t] or 256):
                        self.stage2[t] = 0
                        self.counter[t] = (self.counter[t] + 1) & 15

    cyc_acc = 0

    def step(self):
        self.steps += 1
        self.tick_timers()
        op = self.fetch()
        hi, lo = op >> 4, op & 15
        # ---- regular ALU group (OR AND EOR CMP ADC SBC) ----
        if hi <= 0xB and lo in (4, 5, 6, 7, 8, 9):
            fam = hi >> 1
            odd = hi & 1
            if lo == 8:                                    # A,#imm  /  dp,#imm
                if odd == 0:
                    r = self.alu(fam, self.a, self.fetch())
                    if r is not None:
                        self.a = r
                else:
                    imm = self.fetch()
                    d = self.dpa(self.fetch())
                    r = self.alu(fam, self.rd(d), imm)
                    if r is not None:
                        self.wr(d, r)
                return
            if lo == 9:                                    # dp,dp  /  (X),(Y)
                if odd == 0:
                    s = self.dpa(self.fetch())
                    d = self.dpa(self.fetch())
                    sv = self.rd(s)
                else:
                    d = self.dpa(self.x)
                    sv = self.rd(self.dpa(self.y))
                r = self.alu(fam, self.rd(d), sv)
                if r is not None:
                    self.wr(d, r)
                return
            mode = {4: "dp", 5: "abs", 6: "x", 7: "indx"}[lo] if odd == 0 else {4: "dpx", 5: "absx", 6: "absy", 7: "indy"}[lo]
            r = self.alu(fam, self.a, self.rd(self.ea(mode)))
            if r is not None:
                self.a = r
            return
        # ---- MOV group ----
        if hi in (0xC, 0xD, 0xE, 0xF) and lo in (4, 5, 6, 7):
            mode = {0xC: {4: "dp", 5: "abs", 6: "x", 7: "indx"}, 0xD: {4: "dpx", 5: "absx", 6: "absy", 7: "indy"},
                    0xE: {4: "dp", 5: "abs", 6: "x", 7: "indx"}, 0xF: {4: "dpx", 5: "absx", 6: "absy", 7: "indy"}}[hi][lo]
            if hi in (0xC, 0xD):
                self.wr(self.ea(mode), self.a)
            else:
                self.a = self.nz(self.rd(self.ea(mode)))
            return
        t = self._OTHER.get(op)
        if t is not None:
            t(self, op)
            return
        raise RuntimeError("SPC700 opcode %02X not implemented at %04X" % (op, (self.pc - 1) & 0xFFFF))

    # -- everything else -----------------------------------------------------
    def _rel(self, cond):
        r = self.fetch()
        if cond:
            self.pc = (self.pc + (r - 256 if r & 0x80 else r)) & 0xFFFF
            return True
        return False

    def o_branch(self, op):
        cond = {0x10: not self.n, 0x30: self.n, 0x50: not self.v, 0x70: self.v, 0x90: not self.c, 0xB0: self.c,
                0xD0: not self.z, 0xF0: self.z, 0x2F: True}[op]
        self._rel(cond)

    def o_bit_dp(self, op):                                # SET1/CLR1 dp.b  BBS/BBC dp.b,r
        b = op >> 5
        if op & 0x0F == 2:
            d = self.dpa(self.fetch())
            v = self.rd(d)
            self.wr(d, (v | (1 << b)) if not op & 0x10 else (v & ~(1 << b)))
        else:
            v = self.rdp(self.fetch())
            self._rel(bool(v >> b & 1) == (not op & 0x10))

    def o_mov_regs(self, op):
        if op == 0x7D:
            self.a = self.nz(self.x)
        elif op == 0xDD:
            self.a = self.nz(self.y)
        elif op == 0x5D:
            self.x = self.nz(self.a)
        elif op == 0xFD:
            self.y = self.nz(self.a)
        elif op == 0x9D:
            self.x = self.nz(self.sp)
        elif op == 0xBD:
            self.sp = self.x

    def o_imm_load(self, op):
        v = self.fetch()
        if op == 0xE8:
            self.a = self.nz(v)
        elif op == 0xCD:
            self.x = self.nz(v)
        elif op == 0x8D:
            self.y = self.nz(v)

    def o_mov_xy_mem(self, op):
        if op == 0xF8:
            self.x = self.nz(self.rdp(self.fetch()))
        elif op == 0xF9:
            self.x = self.nz(self.rdp(self.fetch() + self.y))
        elif op == 0xE9:
            self.x = self.nz(self.rd(self.fetch16()))
        elif op == 0xEB:
            self.y = self.nz(self.rdp(self.fetch()))
        elif op == 0xFB:
            self.y = self.nz(self.rdp(self.fetch() + self.x))
        elif op == 0xEC:
            self.y = self.nz(self.rd(self.fetch16()))
        elif op == 0xD8:
            self.wdp(self.fetch(), self.x)
        elif op == 0xD9:
            self.wdp(self.fetch() + self.y, self.x)
        elif op == 0xC9:
            self.wr(self.fetch16(), self.x)
        elif op == 0xCB:
            self.wdp(self.fetch(), self.y)
        elif op == 0xDB:
            self.wdp(self.fetch() + self.x, self.y)
        elif op == 0xCC:
            self.wr(self.fetch16(), self.y)

    def o_mov_misc(self, op):
        if op == 0xAF:                                     # MOV (X)+,A
            self.wr(self.dpa(self.x), self.a)
            self.x = (self.x + 1) & 0xFF
        elif op == 0xBF:                                   # MOV A,(X)+
            self.a = self.nz(self.rd(self.dpa(self.x)))
            self.x = (self.x + 1) & 0xFF
        elif op == 0x8F:                                   # MOV dp,#imm
            imm = self.fetch()
            self.wdp(self.fetch(), imm)
        elif op == 0xFA:                                   # MOV dp,dp
            s = self.fetch()
            self.wdp(self.fetch(), self.rdp(s))

    def o_cmp_xy(self, op):
        if op in (0xC8, 0x3E, 0x1E):
            v = {0xC8: lambda: self.fetch(), 0x3E: lambda: self.rdp(self.fetch()), 0x1E: lambda: self.rd(self.fetch16())}[op]()
            r = self.x - v
        else:
            v = {0xAD: lambda: self.fetch(), 0x7E: lambda: self.rdp(self.fetch()), 0x5E: lambda: self.rd(self.fetch16())}[op]()
            r = self.y - v
        self.c = 1 if r >= 0 else 0
        self.nz(r)

    def o_incdec(self, op):
        if op == 0xBC:
            self.a = self.nz(self.a + 1)
        elif op == 0x3D:
            self.x = self.nz(self.x + 1)
        elif op == 0xFC:
            self.y = self.nz(self.y + 1)
        elif op == 0x9C:
            self.a = self.nz(self.a - 1)
        elif op == 0x1D:
            self.x = self.nz(self.x - 1)
        elif op == 0xDC:
            self.y = self.nz(self.y - 1)
        else:
            addr = {0xAB: lambda: self.dpa(self.fetch()), 0xBB: lambda: self.dpa(self.fetch() + self.x), 0xAC: self.fetch16,
                    0x8B: lambda: self.dpa(self.fetch()), 0x9B: lambda: self.dpa(self.fetch() + self.x), 0x8C: self.fetch16}[op]()
            d = 1 if op in (0xAB, 0xBB, 0xAC) else -1
            self.wr(addr, self.nz(self.rd(addr) + d))

    def o_shift(self, op):
        kind = {0x0B: 0, 0x1B: 0, 0x0C: 0, 0x1C: 0, 0x4B: 1, 0x5B: 1, 0x4C: 1, 0x5C: 1,
                0x2B: 2, 0x3B: 2, 0x2C: 2, 0x3C: 2, 0x6B: 3, 0x7B: 3, 0x6C: 3, 0x7C: 3}[op]
        if op & 15 == 0xC and op & 0x10:
            self.a = self.shift(kind, self.a)
            return
        if op & 15 == 0xC:
            addr = self.fetch16()
        elif op & 0x10:
            addr = self.dpa(self.fetch() + self.x)
        else:
            addr = self.dpa(self.fetch())
        self.wr(addr, self.shift(kind, self.rd(addr)))

    def o_word(self, op):
        d = self.dpa(self.fetch())
        d2 = (d & 0xFF00) | ((d + 1) & 0xFF)
        w = self.rd(d) | self.rd(d2) << 8
        if op == 0xBA:                                      # MOVW YA,dp
            self.a, self.y = w & 0xFF, w >> 8
            self.n = self.y >> 7
            self.z = 1 if w == 0 else 0
        elif op == 0xDA:
            self.wr(d, self.a)
            self.wr(d2, self.y)
        elif op in (0x3A, 0x1A):                            # INCW / DECW
            w = (w + (1 if op == 0x3A else -1)) & 0xFFFF
            self.wr(d, w & 0xFF)
            self.wr(d2, w >> 8)
            self.n = w >> 15
            self.z = 1 if w == 0 else 0
        else:
            ya = self.a | self.y << 8
            if op == 0x5A:                                  # CMPW
                r = ya - w
                self.c = 1 if r >= 0 else 0
                self.n = (r >> 15) & 1
                self.z = 1 if (r & 0xFFFF) == 0 else 0
            elif op == 0x7A:                                # ADDW
                r = ya + w
                self.v = 1 if (~(ya ^ w) & (ya ^ r) & 0x8000) else 0
                self.h = 1 if ((ya & 0xFFF) + (w & 0xFFF)) > 0xFFF else 0
                self.c = 1 if r > 0xFFFF else 0
                r &= 0xFFFF
                self.a, self.y = r & 0xFF, r >> 8
                self.n = r >> 15
                self.z = 1 if r == 0 else 0
            else:                                           # SUBW
                r = ya - w
                self.v = 1 if ((ya ^ w) & (ya ^ r) & 0x8000) else 0
                self.h = 1 if ((ya & 0xFFF) - (w & 0xFFF)) >= 0 else 0
                self.c = 1 if r >= 0 else 0
                r &= 0xFFFF
                self.a, self.y = r & 0xFF, r >> 8
                self.n = r >> 15
                self.z = 1 if r == 0 else 0

    def o_flow(self, op):
        if op == 0x5F:
            self.pc = self.fetch16()
        elif op == 0x3F:
            t = self.fetch16()
            self.push(self.pc >> 8)
            self.push(self.pc & 0xFF)
            self.pc = t
        elif op == 0x4F:
            t = 0xFF00 | self.fetch()
            self.push(self.pc >> 8)
            self.push(self.pc & 0xFF)
            self.pc = t
        elif op == 0x6F:
            lo = self.pop()
            self.pc = lo | self.pop() << 8
        elif op == 0x7F:
            self.set_psw(self.pop())
            lo = self.pop()
            self.pc = lo | self.pop() << 8
        elif op & 15 == 1:                                  # TCALL n
            n = op >> 4
            self.push(self.pc >> 8)
            self.push(self.pc & 0xFF)
            a = 0xFFDE - 2 * n
            self.pc = self.rd(a) | self.rd(a + 1) << 8
        elif op == 0x0F:                                    # BRK
            self.push(self.pc >> 8)
            self.push(self.pc & 0xFF)
            self.push(self.get_psw())
            self.b = 1
            self.i = 0
            self.pc = self.rd(0xFFDE) | self.rd(0xFFDF) << 8
        elif op in (0xEF, 0xFF):
            self.halted = True

    def o_jmp_indx(self, op):
        a = (self.fetch16() + self.x) & 0xFFFF
        self.pc = self.rd(a) | self.rd(a + 1) << 8

    def o_stack(self, op):
        if op == 0x2D:
            self.push(self.a)
        elif op == 0x4D:
            self.push(self.x)
        elif op == 0x6D:
            self.push(self.y)
        elif op == 0x0D:
            self.push(self.get_psw())
        elif op == 0xAE:
            self.a = self.pop()
        elif op == 0xCE:
            self.x = self.pop()
        elif op == 0xEE:
            self.y = self.pop()
        elif op == 0x8E:
            self.set_psw(self.pop())

    def o_flags(self, op):
        if op == 0x60:
            self.c = 0
        elif op == 0x80:
            self.c = 1
        elif op == 0xED:
            self.c ^= 1
        elif op == 0xE0:
            self.v = 0
            self.h = 0
        elif op == 0x20:
            self.p = 0
        elif op == 0x40:
            self.p = 1
        elif op == 0xA0:
            self.i = 1
        elif op == 0xC0:
            self.i = 0

    def o_loop(self, op):
        if op == 0x2E:                                      # CBNE dp,r
            v = self.rdp(self.fetch())
            self._rel(self.a != v)
        elif op == 0xDE:                                    # CBNE dp+X,r
            v = self.rdp(self.fetch() + self.x)
            self._rel(self.a != v)
        elif op == 0x6E:                                    # DBNZ dp,r
            d = self.dpa(self.fetch())
            v = (self.rd(d) - 1) & 0xFF
            self.wr(d, v)
            self._rel(v != 0)
        elif op == 0xFE:                                    # DBNZ Y,r
            self.y = (self.y - 1) & 0xFF
            self._rel(self.y != 0)

    def o_mem_bit(self, op):
        w = self.fetch16()
        addr, b = w & 0x1FFF, w >> 13
        if op == 0xEA:                                      # NOT1
            self.wr(addr, self.rd(addr) ^ (1 << b))
            return
        bit = self.rd(addr) >> b & 1
        if op == 0xCA:                                      # MOV1 m.b,C
            v = self.rd(addr)
            self.wr(addr, (v & ~(1 << b)) | (self.c << b))
        elif op == 0xAA:
            self.c = bit
        elif op == 0x0A:
            self.c |= bit
        elif op == 0x2A:
            self.c |= 1 - bit
        elif op == 0x4A:
            self.c &= bit
        elif op == 0x6A:
            self.c &= 1 - bit
        elif op == 0x8A:
            self.c ^= bit

    def o_tset(self, op):
        addr = self.fetch16()
        v = self.rd(addr)
        self.nz(self.a - v)
        self.wr(addr, (v | self.a) if op == 0x0E else (v & ~self.a))

    def o_muldiv(self, op):
        if op == 0xCF:
            r = self.y * self.a
            self.a, self.y = r & 0xFF, r >> 8
            self.nz(self.y)
        elif op == 0x9E:                                    # DIV YA,X
            ya = self.y << 8 | self.a
            self.v = 1 if self.y >= self.x else 0
            self.h = 1 if (self.y & 15) >= (self.x & 15) else 0
            if self.y < (self.x << 1):
                q = ya // self.x if self.x else 0xFFFF
                r = ya % self.x if self.x else 0
            else:
                q = 255 - (ya - (self.x << 9)) // (256 - self.x)
                r = self.x + (ya - (self.x << 9)) % (256 - self.x)
            self.a, self.y = q & 0xFF, r & 0xFF
            self.nz(self.a)
        elif op == 0x9F:
            self.a = self.nz(((self.a << 4) | (self.a >> 4)) & 0xFF)
        elif op == 0xDF:                                    # DAA
            if self.c or self.a > 0x99:
                self.a = (self.a + 0x60) & 0xFF
                self.c = 1
            if self.h or (self.a & 15) > 9:
                self.a = (self.a + 6) & 0xFF
            self.nz(self.a)
        elif op == 0xBE:                                    # DAS
            if not self.c or self.a > 0x99:
                self.a = (self.a - 0x60) & 0xFF
                self.c = 0
            if not self.h or (self.a & 15) > 9:
                self.a = (self.a - 6) & 0xFF
            self.nz(self.a)

    def o_nop(self, op):
        pass

    _OTHER = {}


def _reg(table, ops, fn):
    for o in ops:
        table[o] = fn


_T = Spc._OTHER
_reg(_T, (0x10, 0x30, 0x50, 0x70, 0x90, 0xB0, 0xD0, 0xF0, 0x2F), Spc.o_branch)
_reg(_T, [(b << 5) | (0x10 if c else 0) | k for b in range(8) for c in (0, 1) for k in (2, 3)], Spc.o_bit_dp)
_reg(_T, (0x7D, 0xDD, 0x5D, 0xFD, 0x9D, 0xBD), Spc.o_mov_regs)
_reg(_T, (0xE8, 0xCD, 0x8D), Spc.o_imm_load)
_reg(_T, (0xF8, 0xF9, 0xE9, 0xEB, 0xFB, 0xEC, 0xD8, 0xD9, 0xC9, 0xCB, 0xDB, 0xCC), Spc.o_mov_xy_mem)
_reg(_T, (0xAF, 0xBF, 0x8F, 0xFA), Spc.o_mov_misc)
_reg(_T, (0xC8, 0x3E, 0x1E, 0xAD, 0x7E, 0x5E), Spc.o_cmp_xy)
_reg(_T, (0xBC, 0x3D, 0xFC, 0x9C, 0x1D, 0xDC, 0xAB, 0xBB, 0xAC, 0x8B, 0x9B, 0x8C), Spc.o_incdec)
_reg(_T, (0x0B, 0x1B, 0x0C, 0x1C, 0x4B, 0x5B, 0x4C, 0x5C, 0x2B, 0x3B, 0x2C, 0x3C, 0x6B, 0x7B, 0x6C, 0x7C), Spc.o_shift)
_reg(_T, (0xBA, 0xDA, 0x3A, 0x1A, 0x5A, 0x7A, 0x9A), Spc.o_word)
_reg(_T, (0x5F, 0x3F, 0x4F, 0x6F, 0x7F, 0x0F, 0xEF, 0xFF) + tuple(range(0x01, 0x100, 0x10)), Spc.o_flow)
_T[0x1F] = Spc.o_jmp_indx
_reg(_T, (0x2D, 0x4D, 0x6D, 0x0D, 0xAE, 0xCE, 0xEE, 0x8E), Spc.o_stack)
_reg(_T, (0x60, 0x80, 0xED, 0xE0, 0x20, 0x40, 0xA0, 0xC0), Spc.o_flags)
_reg(_T, (0x2E, 0xDE, 0x6E, 0xFE), Spc.o_loop)
_reg(_T, (0xEA, 0xCA, 0xAA, 0x0A, 0x2A, 0x4A, 0x6A, 0x8A), Spc.o_mem_bit)
_reg(_T, (0x0E, 0x4E), Spc.o_tset)
_reg(_T, (0xCF, 0x9E, 0x9F, 0xDF, 0xBE), Spc.o_muldiv)
_T[0x00] = Spc.o_nop
_T[0xE0] = Spc.o_flags


class Host:
    """The 65816 side of the audio protocol (docs/audio.md section 4), driving an Spc instance."""

    def __init__(self, spc, limit=20_000_000):
        self.spc = spc
        self.limit = limit

    def wait(self, cond):
        s = self.spc
        n = 0
        while not cond():
            s.step()
            n += 1
            if n > self.limit or s.halted:
                raise RuntimeError("SPC700 did not answer (port3=%02X, pc=%04X)" % (s.spc_out[3], s.pc))

    def wait_p3(self, v):
        self.wait(lambda: self.spc.spc_out[3] == v)

    def command(self, cmd, packets=(), ack=4, data=None):
        """One command: packets = [(p0, p1, p2)...] (the last one is the chunk count when data is given)."""
        s = self.spc
        self.wait_p3(1)
        s.cpu_in[0], s.cpu_in[1], s.cpu_in[2] = cmd, 0, 0
        s.cpu_in[3] = 2
        self.wait_p3(4)
        s.cpu_in[3] = 0
        pk = list(packets)
        if data is not None:
            n = (len(data) + 2) // 3
            pk.append((n & 0xFF, n >> 8, 0))
        for p in pk:
            self.wait_p3(1)
            s.cpu_in[0], s.cpu_in[1], s.cpu_in[2] = p
            s.cpu_in[3] = 2
            self.wait_p3(ack)
            s.cpu_in[3] = 0
        if data is not None:
            d = bytes(data) + bytes(2)
            for i in range(0, (len(data) + 2) // 3 * 3, 3):
                self.wait_p3(1)
                s.cpu_in[0], s.cpu_in[1], s.cpu_in[2] = d[i], d[i + 1], d[i + 2]
                s.cpu_in[3] = 2
                self.wait_p3(0)
                s.cpu_in[3] = 0

