#!/usr/bin/env python3
"""Tests for tools/gfx/tilemap_codec.py.  Run: python3 tests/test_tilemap_codec.py"""
import glob
import os
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, 'tools', 'gfx'))
import tilemap_codec as tc  # noqa: E402

# Data files that contain sCompressed* labels.
GFX_GLOB = os.path.join(ROOT, 'src', 'data', 'gfx', '*', '*.asm')

# Label span continues with non-compressed data after the blob (not a blob).
TRAILING_DATA = {'sCompressedTilemap_A69996'}
HIDDEN = {}
SPILL = {}

VALID_SIZES = {0x800, 0x1000, 0x1800, 0x2000, 0x8000}


def load_blobs():
    blobs = []
    for path in sorted(glob.glob(GFX_GLOB)):
        raw = tc.parse_asm_blobs(path)
        ext = tc.parse_asm_blobs(path, tail=64)
        for label, data in raw.items():
            if label.startswith('sCompressed'):
                blobs.append((label, data, ext[label]))
    return blobs


def check(cond, msg):
    if not cond:
        raise AssertionError(msg)


def test_unit():
    # Hand-made stream: size 5; flags 0b00011111 ... 5 literals "ABCDE"
    d = bytes([5, 0, 0, 0, 0x1F]) + b'ABCDE'
    out, used = tc.decompress(d)
    check(out == b'ABCDE' and used == len(d), 'literal stream')
    # Back-reference into the zero-filled initial window: src=0, len=3+2.
    d = bytes([5, 0, 0, 0, 0x00, 0x00, 0x02])
    out, used = tc.decompress(d)
    check(out == bytes(5) and used == 7, 'zero-window backref')
    # Overlapping copy: literal 'A' then ref to its own slot ($7DE), len 5.
    d = bytes([6, 0, 0, 0, 0x01, 0x41, 0xDE, 0xE2])   # src=$7DE, len=2+3
    out, used = tc.decompress(d)
    check(out == b'AAAAAA', 'overlapping backref: %r' % out)
    # Offset support and trailing garbage ignored.
    d = b'\xFF\xFF' + bytes([1, 0, 0, 0, 1, 0x7A]) + b'junk'
    out, used = tc.decompress(d, 2)
    check(out == b'z' and used == 6, 'offset')
    # Truncation raises.
    try:
        tc.decompress(bytes([5, 0, 0, 0, 0x1F]) + b'AB')
    except tc.DecompressError:
        pass
    else:
        raise AssertionError('truncated stream did not raise')
    # Size word 0 means 65536 bytes (16-bit counter wraps).
    comp = tc.compress(bytes(65536))
    check(comp[:2] == b'\x00\x00', 'size 65536 stored as 0')
    check(tc.decompress(comp)[0] == bytes(65536), '65536 round trip')
    # Encoder validity on non-game data.
    import random
    rnd = random.Random(1234)
    for n in (1, 2, 3, 34, 35, 100, 5000):
        x = bytes(rnd.choice(b'abc\x00') for _ in range(n))
        check(tc.decompress(tc.compress(x))[0] == x, 'roundtrip n=%d' % n)


def test_game_blobs():
    blobs = load_blobs()
    check(blobs, 'no sCompressed blobs found under src/data/gfx')
    n_blobs = comp_total = decomp_total = exact = 0
    hidden_found = 0
    for label, raw, ext in blobs:
        out, used = tc.decompress(ext)
        n_blobs += 1
        check(len(out) in VALID_SIZES, '%s: odd output size %d' % (label, len(out)))
        check(int.from_bytes(ext[0:2], 'little') == len(out), label + ': size word')
        check(ext[2:4] == b'\0\0', label + ': header word 2 is not 0')
        # compress(decompress(blob)) == blob  (byte-exact)
        check(tc.compress(out) == ext[:used], label + ': encoder not byte-exact')
        exact += 1
        comp_total += used
        decomp_total += len(out)
        # consumed length vs. label span
        spill = SPILL.get(label, 0)
        if used == len(raw) + spill:
            continue
        check(used < len(raw), '%s: consumed %d > span %d' % (label, used, len(raw)))
        pos = used
        if label in HIDDEN:
            out2, used2 = tc.decompress(ext, pos)
            check(len(out2) in VALID_SIZES, label + ': hidden blob size')
            check(tc.compress(out2) == ext[pos:pos + used2], label + ': hidden exact')
            n_blobs += 1
            hidden_found += 1
            comp_total += used2
            decomp_total += len(out2)
            pos += used2
            check(pos == len(raw), '%s: hidden chain ends at %d, span %d'
                  % (label, pos, len(raw)))
        elif label in TRAILING_DATA:
            pass   # span continues with non-compressed data
        else:
            check(not any(raw[pos:]), '%s: non-zero slack after blob' % label)
    check(hidden_found == len(HIDDEN), 'hidden blobs not all found')
    print('labeled sCompressed blobs : %d' % len(blobs))
    print('blobs incl. unlabeled     : %d' % n_blobs)
    print('compressed bytes (total)  : %d' % comp_total)
    print('decompressed bytes (total): %d' % decomp_total)
    print('ratio                     : %.1f%%' % (100.0 * comp_total / decomp_total))
    print('byte-exact re-encodes     : %d / %d labeled' % (exact, len(blobs)))


def test_parse():
    path = os.path.join(ROOT, 'src', 'data', 'gfx', 'tiles', 'bank_92.asm')
    blobs = tc.parse_asm_blobs(path)
    check('sCompressedTiles_928000' in blobs, 'label missing')
    check(blobs['sCompressedTiles_928000'][:8] ==
          bytes([0, 0x20, 0, 0, 0, 0xBC, 0xFF, 0xFF]), 'first bytes')


if __name__ == '__main__':
    for fn in (test_parse, test_unit, test_game_blobs):
        fn()
        print('PASS %s' % fn.__name__)
    print('ALL TESTS PASSED')
