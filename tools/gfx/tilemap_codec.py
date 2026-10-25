#!/usr/bin/env python3
"""Codec for the Harvest Moon (SNES) tilemap/charactermap compression.

Emulates fGraphicsDecompressTilemap ($8381F8, src/code/bank_83/graphics.asm).
The format is an LZSS variant with a 2048-byte ring buffer; see
docs/formats/tilemap-compression.md for the full specification.

Pure Python 3, no dependencies.

CLI:
    python tools/gfx/tilemap_codec.py decompress <asmfile> [--outdir DIR]
        [--prefix sCompressed]
"""
import os
import re
import sys

WINDOW_SIZE = 0x800          # ring buffer in $7F0000-$7F07FF
WINDOW_MASK = WINDOW_SIZE - 1
WINDOW_START = 0x7DE         # initial write position
MIN_MATCH = 3
MAX_MATCH = 0x1F + MIN_MATCH  # 34
HEADER_SIZE = 4


class DecompressError(Exception):
    """Raised when the stream would make the 65816 routine read past the data."""


def decompress(data, offset=0):
    """Decompress one blob starting at data[offset].

    Returns (output, consumed). `consumed` is the number of source bytes the
    routine reads, header included (ptrTemp0x72 after RTL minus its start).
    Exact emulation of fGraphicsDecompressTilemap, including: a declared size
    of 0 means 65536 bytes (the 16-bit counter wraps), the second header word
    is ignored, the ring buffer starts zero-filled with write pointer $7DE, and
    back-references may read bytes that were just written (overlap).
    """
    n = len(data)
    pos = offset

    def need(count):
        if pos + count > n:
            raise DecompressError("source truncated at offset 0x%X" % pos)

    need(2)
    remaining = data[pos] | (data[pos + 1] << 8)    # n16Temp1
    pos += HEADER_SIZE                              # 4x INC ptrTemp0x72
    if remaining == 0:
        remaining = 0x10000                         # DEC wraps 0 -> $FFFF ...
    window = bytearray(WINDOW_SIZE)                 # $7F0000 cleared to 0
    wpos = WINDOW_START                             # n16Temp4
    out = bytearray()
    flags = 0                                       # n16Temp2
    bits = 0                                        # n16Temp3 (starts 0)
    # Mirrors "DEC n16Temp3 / BPL": reload when the counter goes negative.
    bits_left = 0
    while True:
        if bits_left == 0:
            need(1)
            flags = data[pos]
            pos += 1
            bits_left = 8
        bits_left -= 1
        bit = flags & 1
        flags >>= 1
        if bit:                                     # literal
            need(1)
            b = data[pos]
            pos += 1
            out.append(b)
            remaining -= 1
            if remaining == 0:
                break
            window[wpos] = b
            wpos = (wpos + 1) & WINDOW_MASK
        else:                                       # back-reference
            need(2)
            b0 = data[pos]
            b1 = data[pos + 1]
            pos += 2
            src = b0 | ((b1 & 0xE0) << 3)           # n16Unk86
            length = (b1 & 0x1F) + MIN_MATCH        # n16Unk88
            done = False
            while True:
                b = window[src]
                out.append(b)
                remaining -= 1
                if remaining == 0:
                    done = True
                    break
                window[wpos] = b
                wpos = (wpos + 1) & WINDOW_MASK
                src = (src + 1) & WINDOW_MASK
                length -= 1
                if length == 0:
                    break
            if done:
                break
    return bytes(out), pos - offset


# --------------------------------------------------------------------------
# Encoder (Okumura LZSS, N=2048, F=34, threshold 2)
# --------------------------------------------------------------------------
#
# The original blobs were produced by Haruhiko Okumura's classic LZSS.C
# (binary-search-tree match finder) with N=2048, F=34, THRESHOLD=2, ring buffer
# pre-filled with $00 and initial write position N-F = $7DE. Reproducing its
# tree-based tie-breaking makes compress() byte-exact for every blob in the ROM.

_N = WINDOW_SIZE
_F = MAX_MATCH
_TH = MIN_MATCH - 1
_NIL = _N


def compress(data, header_word2=0):
    """Encode `data` (1..65536 bytes) into the game's format.

    Byte-exact with the original encoder: compress(decompress(blob)[0]) ==
    blob[:consumed] for every blob in the game (header_word2 is always 0 there).
    A length of exactly 65536 is stored as a size word of 0.
    """
    size = len(data)
    if size == 0 or size > 0x10000:
        raise ValueError("size must be in 1..65536")
    N, F, TH, NIL = _N, _F, _TH, _NIL
    tb = [0] * (N + F - 1)
    lson = [NIL] * (N + 1)
    rson = [NIL] * (N + 257)
    dad = [NIL] * (N + 1)
    st = [0, 0]   # match_position, match_length

    def ins(r):
        cmp_ = 1
        p = N + 1 + tb[r]
        rson[r] = lson[r] = NIL
        st[1] = 0
        while True:
            if cmp_ >= 0:
                if rson[p] != NIL:
                    p = rson[p]
                else:
                    rson[p] = r
                    dad[r] = p
                    return
            else:
                if lson[p] != NIL:
                    p = lson[p]
                else:
                    lson[p] = r
                    dad[r] = p
                    return
            i = 1
            while i < F:
                cmp_ = tb[r + i] - tb[p + i]
                if cmp_ != 0:
                    break
                i += 1
            if i > st[1]:
                st[0] = p
                st[1] = i
                if i >= F:
                    break
        dad[r] = dad[p]
        lson[r] = lson[p]
        rson[r] = rson[p]
        dad[lson[p]] = r
        dad[rson[p]] = r
        if rson[dad[p]] == p:
            rson[dad[p]] = r
        else:
            lson[dad[p]] = r
        dad[p] = NIL

    def dele(p):
        if dad[p] == NIL:
            return
        if rson[p] == NIL:
            q = lson[p]
        elif lson[p] == NIL:
            q = rson[p]
        else:
            q = lson[p]
            if rson[q] != NIL:
                while rson[q] != NIL:
                    q = rson[q]
                rson[dad[q]] = lson[q]
                dad[lson[q]] = dad[q]
                lson[q] = lson[p]
                dad[lson[p]] = q
            rson[q] = rson[p]
            dad[rson[p]] = q
        dad[q] = dad[p]
        if rson[dad[p]] == p:
            rson[dad[p]] = q
        else:
            lson[dad[p]] = q
        dad[p] = NIL

    out = bytearray([size & 0xFF, (size >> 8) & 0xFF,
                     header_word2 & 0xFF, (header_word2 >> 8) & 0xFF])
    inp = 0
    s = 0
    r = N - F
    ln = 0
    while ln < F and inp < size:
        tb[r + ln] = data[inp]
        inp += 1
        ln += 1
    for i in range(1, F + 1):
        ins(r - i)
    ins(r)
    code = bytearray([0])
    mask = 1
    while True:
        if st[1] > ln:
            st[1] = ln
        if st[1] <= TH:
            st[1] = 1
            code[0] |= mask
            code.append(tb[r])
        else:
            code.append(st[0] & 0xFF)
            code.append(((st[0] >> 3) & 0xE0) | (st[1] - TH - 1))
        mask <<= 1
        if mask == 256:
            out += code
            code = bytearray([0])
            mask = 1
        last = st[1]
        i = 0
        while i < last and inp < size:
            c = data[inp]
            inp += 1
            dele(s)
            tb[s] = c
            if s < F - 1:
                tb[s + N] = c
            s = (s + 1) & (N - 1)
            r = (r + 1) & (N - 1)
            ins(r)
            i += 1
        while i < last:
            i += 1
            dele(s)
            s = (s + 1) & (N - 1)
            r = (r + 1) & (N - 1)
            ln -= 1
            if ln:
                ins(r)
        if ln <= 0:
            break
    if len(code) > 1 or mask != 1:
        out += code
    return bytes(out)


# --------------------------------------------------------------------------
# ASM data parsing
# --------------------------------------------------------------------------

_LABEL_RE = re.compile(r'^([A-Za-z_][A-Za-z0-9_.]*):')
_HEX_RE = re.compile(r'\$([0-9A-Fa-f]{1,2})\b')


def parse_asm_blobs(path, tail=0):
    """Return {label: bytes} for a src/data/... .asm file.

    Each label owns every `db $..` byte up to the next label (or EOF).
    `;` comments are stripped. Labels without data map to b''.

    If `tail` > 0, up to that many bytes of the data that follows a label
    (i.e. the start of the next label's bytes) are appended to its blob. This
    is needed because a blob's last bytes may sit under the following
    `Padding_XXXXXX` label (see docs/formats/tilemap-compression.md, quirks).
    """
    blobs = {}
    cur = None
    buf = bytearray()
    with open(path, 'r', encoding='utf-8', errors='replace') as f:
        for line in f:
            line = line.split(';', 1)[0].rstrip()
            if not line.strip():
                continue
            m = _LABEL_RE.match(line)
            if m:
                if cur is not None:
                    blobs[cur] = bytes(buf)
                cur = m.group(1)
                buf = bytearray()
                line = line[m.end():]
            s = line.strip()
            if s.lower().startswith('db'):
                for h in _HEX_RE.findall(s[2:]):
                    buf.append(int(h, 16))
    if cur is not None:
        blobs[cur] = bytes(buf)
    if tail > 0:
        labels = list(blobs)
        for i in range(len(labels) - 1):
            nxt = blobs[labels[i + 1]]
            blobs[labels[i]] += nxt[:tail]
    return blobs


def main(argv):
    import argparse
    ap = argparse.ArgumentParser(description=__doc__.split('\n')[0])
    sub = ap.add_subparsers(dest='cmd', required=True)
    d = sub.add_parser('decompress', help='decompress every blob of an .asm file')
    d.add_argument('asmfile')
    d.add_argument('--outdir', default='.')
    d.add_argument('--prefix', default='sCompressed',
                   help='only labels with this prefix (default sCompressed)')
    args = ap.parse_args(argv)
    spans = parse_asm_blobs(args.asmfile)
    blobs = parse_asm_blobs(args.asmfile, tail=64)
    os.makedirs(args.outdir, exist_ok=True)
    count = 0
    for label, blob in blobs.items():
        if not label.startswith(args.prefix) or not blob:
            continue
        try:
            out, used = decompress(blob)
        except DecompressError as e:
            print('%s: ERROR %s' % (label, e), file=sys.stderr)
            continue
        with open(os.path.join(args.outdir, label + '.bin'), 'wb') as f:
            f.write(out)
        print('%s: %d -> %d bytes (consumed %d)'
              % (label, len(spans[label]), len(out), used))
        count += 1
    print('%d blob(s) written to %s' % (count, args.outdir))
    return 0


if __name__ == '__main__':
    sys.exit(main(sys.argv[1:]))
