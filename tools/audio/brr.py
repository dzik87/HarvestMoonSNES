#!/usr/bin/env python3
"""SNES BRR sample codec: bit-exact S-DSP decoder, exact + lossy encoder, WAV helpers.

Decoder (what the S-DSP computes; the output is the 16-bit value before gaussian interpolation and envelope):
  nibble n (signed -8..7), header range r (0-15), filter f (0-3):
    r <= 12 : s = (n << r) >> 1                 r >= 13 : s = -2048 if n < 0 else 0
    f = 1 : s += p1 + ((-p1) >> 4)                          p1, p2 = previous two output samples, halved
    f = 2 : s += 2*p1 + ((-3*p1) >> 5) - p2 + (p2 >> 4)
    f = 3 : s += 2*p1 + ((-13*p1) >> 6) - p2 + ((3*p2) >> 4)
    s = clamp(s, -32768, 32767); output = wrap16(2*s)          (so every output sample is even)
  The filter history is NOT reset at the loop point (only at the start of the sample).

Encoder: `encode()` looks for an *exact* block (decode == target) in a canonical (range, filter) order; where no exact
block exists (an edited/resampled WAV) it falls back to the smallest-squared-error block, closed loop.  Decoded game
samples always have an exact block, which is why unchanged WAVs rebuild the original bytes (see tools/audio/audioconv.py
for the per-block override list that makes non-canonical original blocks exact too).
"""
import struct

NIB_ORDER = [0, -1, 1, -2, 2, -3, 3, -4, 4, -5, 5, -6, 6, -7, 7, -8]      # tie preference between equal nibbles

#: raw contribution of a nibble: NIBVAL[r][n + 8]
NIBVAL = [[(n << r) >> 1 for n in range(-8, 8)] for r in range(13)] + [[(-2048 if n < 0 else 0) for n in range(-8, 8)]] * 3
#: INV[r]: raw contribution -> nibbles giving it, in NIB_ORDER preference
INV = []
for _r in range(16):
    _d = {}
    for _n in NIB_ORDER:
        _d.setdefault(NIBVAL[_r][_n + 8], []).append(_n)
    INV.append(_d)


def wrap16(v):
    return ((v + 0x8000) & 0xFFFF) - 0x8000


def pred(f, p1, p2):
    """Filter prediction; p1, p2 are the previous output samples divided by two."""
    if f == 0:
        return 0
    if f == 1:
        return p1 + ((-p1) >> 4)
    if f == 2:
        return 2 * p1 + ((-3 * p1) >> 5) - p2 + (p2 >> 4)
    return 2 * p1 + ((-13 * p1) >> 6) - p2 + ((3 * p2) >> 4)


def out(s):
    if s > 32767:
        s = 32767
    elif s < -32768:
        s = -32768
    return wrap16(2 * s)


def nibbles(block):
    """Signed nibbles of a 9-byte block."""
    res = []
    for b in block[1:9]:
        for v in (b >> 4, b & 15):
            res.append(v - 16 if v >= 8 else v)
    return res


def decode_block(block, o1=0, o2=0):
    """9 bytes -> (16 output samples, new o1, new o2); o1/o2 = previous two output samples (full scale)."""
    hdr = block[0]
    r, f = hdr >> 4, (hdr >> 2) & 3
    tab = NIBVAL[r]
    p1, p2 = o1 >> 1, o2 >> 1
    res = []
    for n in nibbles(block):
        o = out(tab[n + 8] + pred(f, p1, p2))
        res.append(o)
        p2, p1 = p1, o >> 1
    return res, res[15], res[14]


def decode(data, nblocks=None):
    """BRR bytes -> int16 samples (16 per block).  Stops after the end-flag block (or after `nblocks`)."""
    res = []
    o1 = o2 = 0
    k = 0
    while (nblocks is None or k < nblocks) and (k + 1) * 9 <= len(data):
        blk = data[k * 9:k * 9 + 9]
        s, o1, o2 = decode_block(blk, o1, o2)
        res += s
        k += 1
        if nblocks is None and blk[0] & 1:
            break
    return res


def fit_options(r, f, target, o1, o2):
    """Exact fit of one block with header (r, f): list (per sample) of the nibble choices in preference order,
    or None when some sample cannot be reproduced."""
    inv = INV[r]
    tab = NIBVAL[r]
    p1, p2 = o1 >> 1, o2 >> 1
    opts = []
    for t in target:
        pr = pred(f, p1, p2)
        s0 = t >> 1
        found = None
        for s in (s0, s0 - 32768 if s0 >= 0 else s0 + 32768):
            found = inv.get(s - pr)
            if found:
                break
        if not found and t in (0, -2):                 # clamped to the 16-bit limits: any large enough raw value works
            lo = [n for n in NIB_ORDER if (out(tab[n + 8] + pr) == t)]
            found = lo or None
        if not found:
            return None
        opts.append(found)
        p2, p1 = p1, t >> 1
    return opts


RANGES = list(range(16))


def canon_order(spec):
    """'f+r-' style rule name -> list of (range, filter) in preference order.
    First letter = major key (f or r); '+'/'-' = ascending/descending for filter and range."""
    major, fo, ro = spec[0], spec[1:3], spec[3:5]
    fs = [f for f in range(4)] if fo == "f+" else [f for f in range(3, -1, -1)]
    rs = list(range(13)) if ro == "r+" else list(range(12, -1, -1))
    rs = rs + [13, 14, 15]
    if major == "f":
        return [(r, f) for f in fs for r in rs]
    return [(r, f) for r in rs for f in fs]


CANON_RULES = ["f" + a + b for a in ("f+", "f-") for b in ("r+", "r-")] + ["r" + a + b for a in ("f+", "f-") for b in ("r+", "r-")]
DEFAULT_RULE = "ff+r-"


def pack(r, f, nibs, flags=0):
    b = bytearray([(r << 4) | (f << 2) | flags])
    for i in range(0, 16, 2):
        b.append(((nibs[i] & 15) << 4) | (nibs[i + 1] & 15))
    return bytes(b)


def exact_block(target, o1, o2, order):
    """First exact fit in `order` -> (r, f, options) or None."""
    for r, f in order:
        opts = fit_options(r, f, target, o1, o2)
        if opts is not None:
            return r, f, opts
    return None


def lossy_block(target, o1, o2, filters=(0, 1, 2, 3)):
    """Closed-loop smallest-squared-error block -> (r, f, nibbles, error)."""
    best = None
    for f in filters:
        for r in range(13):
            tab = NIBVAL[r]
            step = 1 << r if r else 1
            q1, q2 = o1 >> 1, o2 >> 1
            err = 0
            nibs = []
            for t in target:
                pr = pred(f, q1, q2)
                want = (t >> 1) - pr                       # desired raw contribution (half scale)
                c = (want * 2) >> r if r else want * 2     # nibble estimate: raw = (n << r) >> 1  ->  n ~ raw*2 / 2^r
                bn = bo = be = None
                for n in (c - 1, c, c + 1, c + 2, -8, 7):
                    if n < -8 or n > 7:
                        continue
                    o = out(tab[n + 8] + pr)
                    e = (o - t) * (o - t)
                    if be is None or e < be or (e == be and abs(n) < abs(bn)):
                        bn, bo, be = n, o, e
                err += be
                nibs.append(bn)
                q2, q1 = q1, bo >> 1
                if best is not None and err >= best[0]:
                    break
            else:
                if best is None or err < best[0]:
                    best = (err, r, f, nibs)
                    if err == 0:
                        return r, f, nibs, 0
    return best[1], best[2], best[3], best[0]


def encode(samples, loop=False, loop_block=None, rule=DEFAULT_RULE, overrides=None, flag_all=True, stats=None):
    """int16 samples (multiple of 16) -> BRR bytes (last block gets the end flag; `loop` adds the loop flag).

    loop_block : block where the loop starts; when it has to be encoded lossily it is forced to filter 0 so the jump
                 back is seamless (an exact fit is kept as is: it reproduces the original data).
    overrides  : {block: (r, f, mask)} or {block: 9 raw bytes}; used only if the block still decodes exactly to the
                 target (a stale override of an edited block is ignored).  mask bit i = take the 2nd nibble choice
                 of sample i (equal-valued nibble pairs exist at range 0).
    flag_all   : set the loop flag in every block of a looping sample (the original data does).
    stats      : optional dict, filled with counts of exact/lossy blocks.
    """
    n = len(samples)
    if n == 0 or n % 16:
        raise ValueError("sample count must be a non-zero multiple of 16 (got %d)" % n)
    nb = n // 16
    order = canon_order(rule)
    res = bytearray()
    o1 = o2 = 0
    for k in range(nb):
        tgt = samples[k * 16:(k + 1) * 16]
        last = k == nb - 1
        flags = (2 if (loop and (flag_all or last)) else 0) | (1 if last else 0)
        blk = None
        ov = overrides.get(k) if overrides else None
        if ov is not None:
            if isinstance(ov, (bytes, bytearray)):
                cand = bytes([ov[0] & 0xFC | flags]) + bytes(ov[1:9])
            else:
                r, f, mask = ov
                opts = fit_options(r, f, tgt, o1, o2)
                cand = None
                if opts is not None:
                    nibs = [o[1] if (mask >> i) & 1 and len(o) > 1 else o[0] for i, o in enumerate(opts)]
                    cand = pack(r, f, nibs, flags)
            if cand is not None and decode_block(cand, o1, o2)[0] == tgt:
                blk = cand
        if blk is None:
            forced = loop and loop_block is not None and k == loop_block
            ex = exact_block(tgt, o1, o2, order)
            if ex is not None:
                r, f, opts = ex
                blk = pack(r, f, [o[0] for o in opts], flags)
                if stats is not None:
                    stats["exact"] = stats.get("exact", 0) + 1
            else:
                r, f, nibs, _ = lossy_block(tgt, o1, o2, (0,) if forced else (0, 1, 2, 3))
                blk = pack(r, f, nibs, flags)
                if stats is not None:
                    stats["lossy"] = stats.get("lossy", 0) + 1
        res += blk
        _, o1, o2 = decode_block(blk, o1, o2)
    return bytes(res)


def block_override(orig_block, target, o1, o2, order):
    """Return None if encode() would already produce `orig_block` (ignoring flag bits), else its override."""
    ex = exact_block(target, o1, o2, order)
    r0, f0 = orig_block[0] >> 4, (orig_block[0] >> 2) & 3
    nibs0 = nibbles(orig_block)
    if ex is not None:
        r, f, opts = ex
        if (r, f) == (r0, f0) and [o[0] for o in opts] == nibs0:
            return None
    opts = fit_options(r0, f0, target, o1, o2)
    if opts is not None:
        mask = 0
        ok = True
        for i, o in enumerate(opts):
            if nibs0[i] == o[0]:
                continue
            if len(o) > 1 and nibs0[i] == o[1]:
                mask |= 1 << i
            else:
                ok = False
        if ok and len(max(opts, key=len)) <= 2:
            return (r0, f0, mask)
    return bytes(orig_block)


def to_wav(samples, rate=32000, loop=None):
    """Mono 16-bit PCM WAV bytes; optional (start, end) sample loop stored as an `smpl` chunk."""
    data = struct.pack("<%dh" % len(samples), *samples)
    fmt = struct.pack("<HHIIHH", 1, 1, rate, rate * 2, 2, 16)
    chunks = b"fmt " + struct.pack("<I", len(fmt)) + fmt
    if loop is not None:
        smpl = struct.pack("<9I", 0, 0, 1_000_000_000 // rate, 60, 0, 0, 0, 1, 0)
        smpl += struct.pack("<6I", 0, 0, loop[0], loop[1], 0, 0)
        chunks += b"smpl" + struct.pack("<I", len(smpl)) + smpl
    chunks += b"data" + struct.pack("<I", len(data)) + data
    return b"RIFF" + struct.pack("<I", 4 + len(chunks)) + b"WAVE" + chunks


def from_wav(raw):
    """-> (int16 list, rate, loop or None).  Accepts integer PCM mono/stereo (stereo is averaged), 8/16/24/32 bit."""
    if raw[:4] != b"RIFF" or raw[8:12] != b"WAVE":
        raise ValueError("not a RIFF/WAVE file")
    pos = 12
    fmt = data = loop = None
    while pos + 8 <= len(raw):
        cid, sz = raw[pos:pos + 4], struct.unpack_from("<I", raw, pos + 4)[0]
        body = raw[pos + 8:pos + 8 + sz]
        if cid == b"fmt ":
            fmt = struct.unpack_from("<HHIIHH", body)
        elif cid == b"data":
            data = body
        elif cid == b"smpl" and len(body) >= 60 and struct.unpack_from("<I", body, 28)[0] >= 1:
            loop = struct.unpack_from("<II", body, 44)
        pos += 8 + sz + (sz & 1)
    if fmt is None or data is None:
        raise ValueError("WAV without fmt/data chunk")
    tag, ch, rate, _, _, bits = fmt
    if tag not in (1, 0xFFFE):
        raise ValueError("only integer PCM WAV is supported")
    width = bits // 8
    frames = len(data) // (width * ch)
    vals = []
    for i in range(frames):
        acc = 0
        for c in range(ch):
            o = (i * ch + c) * width
            if bits == 8:
                v = (data[o] - 128) << 8
            elif bits == 16:
                v = struct.unpack_from("<h", data, o)[0]
            elif bits == 24:
                v = int.from_bytes(data[o:o + 3], "little", signed=True) >> 8
            elif bits == 32:
                v = struct.unpack_from("<i", data, o)[0] >> 16
            else:
                raise ValueError("unsupported bit depth %d" % bits)
            acc += v
        vals.append(acc // ch if ch > 1 else acc)
    return vals, rate, loop
