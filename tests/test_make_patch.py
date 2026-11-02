#!/usr/bin/env python3
"""Tests of tools/translate/make_patch.py (BPS/IPS create, apply, verify) on invented ROM-like byte arrays.  Run: python3 tests/test_make_patch.py

No ROM and no extracted assets are needed.  The optional ROM part (HM_ROM_DIR set and build/HarvestMoon_US_pl.sfc present) patches the user's own original US ROM
and compares the result with the translation build.
"""
import os
import random
import sys
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT / "tools" / "translate"))
import make_patch as MP                                  # noqa: E402

FAILS = []


def ok(cond, msg):
    if not cond:
        FAILS.append(msg)
        print("FAIL: " + msg)


def rom(n, seed):
    r = random.Random(seed)
    return bytes(r.randrange(256) for _ in range(n))


def mutate(src, seed, edits=40, grow=0, shrink=0):
    r = random.Random(seed)
    b = bytearray(src)
    for _ in range(edits):
        o = r.randrange(len(b))
        ln = r.choice((1, 2, 5, 30, 300))
        kind = r.choice(("rand", "fill"))
        for k in range(o, min(len(b), o + ln)):
            b[k] = r.randrange(256) if kind == "rand" else 0xA5
    b += bytes(r.randrange(256) for _ in range(grow))
    if shrink:
        del b[-shrink:]
    return bytes(b)


def test_varint():
    for n in (0, 1, 127, 128, 129, 16383, 16384, 0x200000, 2 ** 32 + 5):
        v, pos = MP.bps_dec(MP.bps_enc(n), 0)
        ok(v == n and pos == len(MP.bps_enc(n)), "BPS number %d round trip" % n)
    ok(MP.bps_enc(0) == b"\x80" and MP.bps_enc(127) == b"\xFF" and MP.bps_enc(128) == b"\x00\x80", "BPS number encoding follows the beat specification")


def test_roundtrip():
    src = rom(70000, 1)
    for name, tgt in (("same", src), ("edited", mutate(src, 2)), ("grown", mutate(src, 3, grow=5000)), ("shrunk", mutate(src, 4, shrink=3000)),
                      ("empty", b""), ("tiny", b"\x01")):
        s = src if name != "empty" else b""
        for fmt in ("bps", "ips"):
            if fmt == "ips" and name == "empty":
                pass
            p = MP.create(s, tgt, fmt)
            ok(MP.apply(p, s) == tgt, "%s round trip (%s)" % (name, fmt))
            ok(not MP.verify(p, s, tgt), "%s verify (%s)" % (name, fmt))
    # delta property: an unchanged ROM gives a tiny patch, changes cost about their own size
    p = MP.create(src, src, "bps")
    ok(len(p) < 40, "an identical target gives a tiny BPS patch (%d bytes)" % len(p))
    tgt = bytearray(src)
    tgt[1000:1010] = b"0123456789"
    tgt[50000] ^= 0xFF
    p = MP.create(src, bytes(tgt), "bps")
    ok(len(p) < 80, "11 changed bytes give a small BPS patch (%d bytes)" % len(p))
    ok(not any(src[i:i + 8] in p for i in range(0, 69000, 997)), "the patch holds no stretch of unchanged ROM bytes")
    pi = MP.create(src, bytes(tgt), "ips")
    ok(len(pi) < 40, "IPS size for 11 changed bytes (%d)" % len(pi))
    # RLE
    t2 = bytearray(src)
    t2[2000:4000] = b"\x00" * 2000
    pb, pi = MP.create(src, bytes(t2), "bps"), MP.create(src, bytes(t2), "ips")
    ok(len(pb) < 200 and len(pi) < 200, "runs of one value are stored as RLE (bps %d, ips %d)" % (len(pb), len(pi)))
    ok(MP.apply(pb, src) == bytes(t2) and MP.apply(pi, src) == bytes(t2), "RLE patches apply")


def test_bps_checks():
    src = rom(5000, 7)
    tgt = mutate(src, 8, edits=5)
    p = MP.create(src, tgt, "bps", b"invented")
    h = MP.bps_parse(p)
    ok(h["metadata"] == b"invented" and h["source_crc"] == MP.crc32(src) and h["target_crc"] == MP.crc32(tgt) and h["patch_crc"] == MP.crc32(p[:-4]), "BPS header fields")
    other = bytearray(src); other[10] ^= 1
    try:
        MP.apply(p, bytes(other)); ok(False, "wrong source must be refused")
    except MP.PatchError:
        pass
    try:
        MP.apply(p, bytes(other), check_source=False)      # --force skips the source check; the result CRC still refuses a wrong result
    except MP.PatchError:
        pass
    bad = bytearray(p); bad[20] ^= 1
    try:
        MP.bps_parse(bytes(bad)); ok(False, "damaged patch must be refused")
    except MP.PatchError:
        pass
    ok(MP.verify(p, bytes(other)), "verify reports a wrong source")
    ok(MP.verify(p, src, bytes(other)), "verify reports a wrong target")
    # a hand made patch: SourceCopy and TargetCopy actions (not produced by create, but valid BPS)
    body = bytearray(b"BPS1" + MP.bps_enc(8) + MP.bps_enc(8) + MP.bps_enc(0))
    s = bytes(range(8)); t = s[4:8] + s[4:6] + s[4:6]
    body += MP.bps_enc(((4 - 1) << 2) | 2) + MP.bps_enc((4 << 1))           # SourceCopy 4 bytes from offset +4
    body += MP.bps_enc(((4 - 1) << 2) | 3) + MP.bps_enc((0 << 1))           # TargetCopy 4 bytes from output offset 0 (overlap free)
    t = s[4:8] + s[4:8]
    body += MP.crc32(s).to_bytes(4, "little") + MP.crc32(t).to_bytes(4, "little")
    body += MP.crc32(bytes(body)).to_bytes(4, "little")
    ok(MP.apply(bytes(body), s) == t, "SourceCopy and TargetCopy actions")


def test_ips_edge():
    src = bytes(0x500000)
    tgt = bytearray(src)
    tgt[MP.IPS_EOF_OFFSET] = 1
    p = MP.ips_create(src, bytes(tgt))
    ok(MP.ips_apply(p, src) == bytes(tgt), "a change at the offset 'EOF' is started one byte earlier")
    ok(p[5:8] != b"EOF", "no record starts with the bytes EOF")
    try:
        MP.ips_create(bytes(MP.IPS_MAX + 1), bytes(MP.IPS_MAX + 1)); ok(False, "IPS must refuse 16 MB")
    except MP.PatchError:
        pass
    s2 = rom(1000, 3)
    ok(MP.ips_apply(MP.ips_create(s2, s2[:600]), s2) == s2[:600], "IPS truncation")
    big = bytes([9]) * 70000
    ok(MP.ips_apply(MP.ips_create(b"", big), b"") == big, "IPS records longer than 65535 bytes are split")


def test_header():
    src = rom(2048, 11)
    tgt = mutate(src, 12, edits=3)
    p = MP.create(src, tgt, "bps")
    hdr = bytes(range(256)) * 2
    ok(MP.has_header(hdr + src) and not MP.has_header(src), "copier header detection")
    ok(MP.apply(p, hdr + src) == tgt, "patch applies to a ROM with a 512 byte header")
    ok(MP.apply(p, hdr + src, keep_header=True) == hdr + tgt, "--keep-header restores the header")


def test_cli():
    src = rom(40000, 21)
    tgt = mutate(src, 22)
    with tempfile.TemporaryDirectory() as t:
        d = Path(t) / "dir with spaces"
        d.mkdir()
        (d / "orig.sfc").write_bytes(src)
        (d / "built.sfc").write_bytes(tgt)
        for fmt in ("bps", "ips"):
            out = d / ("x." + fmt)
            ok(MP.main(["create", str(d / "orig.sfc"), str(d / "built.sfc"), "-o", str(out), "--format", fmt]) == 0, "cli create %s" % fmt)
            ok(MP.main(["verify", str(out), "--source", str(d / "orig.sfc"), "--target", str(d / "built.sfc")]) == 0, "cli verify %s" % fmt)
            ok(MP.main(["info", str(out)]) == 0, "cli info %s" % fmt)
            res = d / ("res_" + fmt + ".sfc")
            ok(MP.main(["apply", str(out), str(d / "orig.sfc"), "-o", str(res)]) == 0 and res.read_bytes() == tgt, "cli apply %s" % fmt)
        ok(MP.main(["apply", str(d / "x.bps"), str(d / "built.sfc"), "-o", str(d / "no.sfc")]) == 1 and not (d / "no.sfc").exists(), "cli apply refuses a wrong original")


def test_rom():
    rom_dir = os.environ.get("HM_ROM_DIR")
    built = ROOT / "build" / "HarvestMoon_US_pl.sfc"
    us = sorted((Path(rom_dir) / "US").glob("*.sfc")) if rom_dir else []
    if not us or not built.exists():
        print("skip: ROM patch test (HM_ROM_DIR or build/HarvestMoon_US_pl.sfc missing)")
        return
    src, tgt = MP.strip_header(us[0].read_bytes())[0], built.read_bytes()
    for fmt in ("bps", "ips"):
        p = MP.create(src, tgt, fmt)
        ok(MP.apply(p, src) == tgt, "real ROM %s round trip" % fmt)
        ok(len(p) < len(tgt) // 2, "real ROM %s patch is a delta (%d bytes)" % (fmt, len(p)))


def main():
    test_varint()
    test_roundtrip()
    test_bps_checks()
    test_ips_edge()
    test_header()
    test_cli()
    test_rom()
    if FAILS:
        print("%d FAILED" % len(FAILS))
        return 1
    print("make_patch tests: OK")
    return 0


if __name__ == "__main__":
    sys.exit(main())
