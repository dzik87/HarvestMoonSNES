#!/usr/bin/env python3
"""Tests for tools/analysis/bytealign.py: the edit script must cover both sequences and 'equal' runs must be equal."""
import random
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent.parent / "tools" / "analysis"))
from bytealign import align  # noqa: E402


def check(a, b):
    ops = align(a, b)
    i = j = 0
    for tag, i1, i2, j1, j2 in ops:
        assert (i1, j1) == (i, j), (tag, i1, j1, i, j)
        if tag == "equal":
            assert a[i1:i2] == b[j1:j2]
        i, j = i2, j2
    assert (i, j) == (len(a), len(b))
    return ops


def main():
    rnd = random.Random(1)
    base = bytes(rnd.randrange(256) for _ in range(4000))
    # substitutions, insertions and deletions
    b = bytearray(base)
    for pos in sorted(rnd.sample(range(len(b)), 40), reverse=True):
        r = rnd.random()
        if r < 0.4:
            b[pos] ^= 0x55
        elif r < 0.7:
            b[pos:pos] = bytes(rnd.randrange(256) for _ in range(rnd.randrange(1, 9)))
        else:
            del b[pos:pos + rnd.randrange(1, 9)]
    ops = check(base, bytes(b))
    assert sum(i2 - i1 for t, i1, i2, _, _ in ops if t == "equal") > 3800
    # displaced repeated pattern: three operand bytes changed inside a run of identical 4-byte records
    rec = bytes([0x8F, 0xC0, 0x19, 0x80])
    a = b"\x01\x02" + b"".join(bytes([0x8F, 0xC0 + 2 * k, 0x19, 0x80]) for k in range(12)) + b"\x03\x04"
    d = b"\x01\x02" + b"".join(bytes([0x8F, 0xC6 + 2 * k, 0x19, 0x80]) for k in range(12)) + b"\x03\x04"
    ops = check(a, d)
    assert all(t in ("equal", "replace") and (i2 - i1) == (j2 - j1) for t, i1, i2, j1, j2 in ops), ops
    check(b"", b"abc")
    check(b"abc", b"")
    check(b"abc", b"abc")
    print("bytealign OK")


if __name__ == "__main__":
    main()
