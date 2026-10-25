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
# Encoder
# --------------------------------------------------------------------------

def compress(data, header_word2=0):
    """Encode `data` (1..65535 bytes, or exactly 65536) into the format.

    Greedy longest-match LZSS using the same ring buffer model as the decoder.
    This is a VALID encoder (decompress(compress(x))[0] == x) but it does NOT
    reproduce the original game blobs byte for byte; the original compressed
    blobs stay the source of truth in the repository.
    """
    size = len(data)
    if size == 0 or size > 0x10000:
        raise ValueError("size must be in 1..65536")
    hdr = bytes([size & 0xFF, (size >> 8) & 0xFF,
                 header_word2 & 0xFF, (header_word2 >> 8) & 0xFF])
    window = bytearray(WINDOW_SIZE)
    wpos = WINDOW_START
    items = []   # ('L', byte) or ('M', src, length)
    i = 0
    while i < size:
        best_len, best_src = 0, 0
        limit = min(MAX_MATCH, size - i)
        if limit >= MIN_MATCH:
            for s in range(WINDOW_SIZE):
                # simulate the copy including overlap with freshly written data
                tmp = window
                w = wpos
                ln = 0
                sp = s
                # copy-on-write view for overlap
                saved = []
                while ln < limit and tmp[sp] == data[i + ln]:
                    saved.append((w, tmp[w]))
                    tmp[w] = data[i + ln]
                    w = (w + 1) & WINDOW_MASK
                    sp = (sp + 1) & WINDOW_MASK
                    ln += 1
                for idx, old in reversed(saved):
                    tmp[idx] = old
                if ln > best_len:
                    best_len, best_src = ln, s
                    if ln == limit:
                        break
        if best_len >= MIN_MATCH:
            items.append(('M', best_src, best_len))
            for k in range(best_len):
                window[wpos] = data[i + k]
                wpos = (wpos + 1) & WINDOW_MASK
            i += best_len
        else:
            items.append(('L', data[i]))
            window[wpos] = data[i]
            wpos = (wpos + 1) & WINDOW_MASK
            i += 1
    out = bytearray(hdr)
    for g in range(0, len(items), 8):
        group = items[g:g + 8]
        flag = 0
        body = bytearray()
        for bit, it in enumerate(group):
            if it[0] == 'L':
                flag |= 1 << bit
                body.append(it[1])
            else:
                _, s, ln = it
                body.append(s & 0xFF)
                body.append(((s >> 3) & 0xE0) | (ln - MIN_MATCH))
        out.append(flag)
        out += body
    return bytes(out)


# --------------------------------------------------------------------------
# ASM data parsing
# --------------------------------------------------------------------------

_LABEL_RE = re.compile(r'^([A-Za-z_][A-Za-z0-9_.]*):')
_HEX_RE = re.compile(r'\$([0-9A-Fa-f]{1,2})\b')


def parse_asm_blobs(path):
    """Return {label: bytes} for a src/data/... .asm file.

    Each label owns every `db $..` byte up to the next label (or EOF).
    `;` comments are stripped. Labels without data map to b''.
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
    blobs = parse_asm_blobs(args.asmfile)
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
        print('%s: %d -> %d bytes (consumed %d of %d)'
              % (label, len(blob), len(out), used, len(blob)))
        count += 1
    print('%d blob(s) written to %s' % (count, args.outdir))
    return 0


if __name__ == '__main__':
    sys.exit(main(sys.argv[1:]))
