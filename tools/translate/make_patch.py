#!/usr/bin/env python3
"""Create, apply and verify patches between the original US ROM and a translation build (distribution form of a translation: patch files, never ROMs).

  python tools/translate/make_patch.py create  ORIGINAL.sfc BUILT.sfc  [-o OUT.bps] [--format bps|ips] [--metadata TEXT]
  python tools/translate/make_patch.py apply   PATCH ORIGINAL.sfc      [-o OUT.sfc] [--keep-header] [--force]
  python tools/translate/make_patch.py verify  PATCH [--source ORIGINAL.sfc] [--target BUILT.sfc]
  python tools/translate/make_patch.py info    PATCH

Formats
  BPS (beat, primary): header "BPS1", variable-length source/target size, metadata, actions (SourceRead, TargetRead, SourceCopy, TargetCopy) and the CRC32 of
  source, target and of the patch itself.  The CRCs make `apply` refuse a wrong or modified original.  `create` writes SourceRead for every unchanged byte
  (a few bytes of length, not the byte itself) and TargetRead only for changed bytes; long runs of one value in changed data use TargetCopy (RLE).
  IPS (limited): offsets are 24 bit, so the target must be smaller than 16 MB; no checksums.  A change that would start at offset 0x454F46 (the text "EOF") is
  started one byte earlier (that one unchanged byte is stored); a shorter target is expressed with the truncation extension (3 byte size behind "EOF").

Both formats are delta formats: a patch contains only the bytes that differ from the original (BPS: plus a few bytes per unchanged stretch), never a copy of the ROM.
`apply` accepts the original with or without a 512 byte copier header (detected from the file size); the output is headerless unless --keep-header is given.
Pure Python 3 standard library, binary file access only (the same on Windows, Linux and macOS).
"""
import argparse
import sys
import zlib
from pathlib import Path

HEADER_SIZE = 512
IPS_MAX = 1 << 24
IPS_EOF_OFFSET = 0x454F46            # the bytes "EOF": an offset that must not start a record
CHUNK = 4096


class PatchError(Exception):
    pass


def crc32(data):
    return zlib.crc32(data) & 0xFFFFFFFF


# ---------------------------------------------------------------- copier header
def has_header(data):
    """A 512 byte copier header makes the size `n * 1024 + 512`."""
    return len(data) % 1024 == HEADER_SIZE


def strip_header(data):
    """-> (headerless bytes, header bytes or b"")"""
    if has_header(data):
        return bytes(data[HEADER_SIZE:]), bytes(data[:HEADER_SIZE])
    return bytes(data), b""


# ---------------------------------------------------------------- BPS
def bps_enc(n):
    """beat variable length number"""
    out = bytearray()
    while True:
        x = n & 0x7F
        n >>= 7
        if n == 0:
            out.append(0x80 | x)
            return bytes(out)
        out.append(x)
        n -= 1


def bps_dec(buf, pos):
    """-> (value, new position)"""
    data, shift = 0, 1
    while True:
        if pos >= len(buf):
            raise PatchError("truncated BPS number")
        x = buf[pos]
        pos += 1
        data += (x & 0x7F) * shift
        if x & 0x80:
            return data, pos
        shift <<= 7
        data += shift


def _diff_runs(src, tgt):
    """Yield (start, end, same) runs over the common length of the two buffers (block-wise fast path for equal stretches)."""
    n = min(len(src), len(tgt))
    i = 0
    run_start, run_same = 0, None
    while i < n:
        end = min(i + CHUNK, n)
        if src[i:end] == tgt[i:end]:
            same_block = True
        else:
            same_block = False
        if same_block:
            if run_same is False:
                yield run_start, i, False
                run_start = i
            if run_same is None:
                run_start = i
            run_same = True
            i = end
            continue
        # mixed block: byte-wise
        for j in range(i, end):
            s = src[j] == tgt[j]
            if run_same is None:
                run_start, run_same = j, s
            elif s != run_same:
                yield run_start, j, run_same
                run_start, run_same = j, s
        i = end
    if run_same is not None:
        yield run_start, n, run_same


class _BpsWriter:
    def __init__(self):
        self.out = bytearray()
        self.tpos = 0                   # output position
        self.tcopy = 0                  # TargetCopy read pointer

    def source_read(self, length):
        self.out += bps_enc(((length - 1) << 2) | 0)
        self.tpos += length

    def target_read(self, data):
        """data = changed bytes; runs of one value become TargetCopy (RLE)"""
        i, n = 0, len(data)
        while i < n:
            j = i + 1
            while j < n and data[j] == data[i]:
                j += 1
            if j - i >= 8:
                self.literal(data[i:i + 1])
                self.target_copy_rle(j - i - 1)
            else:
                # extend the literal over the short runs up to the next long run
                k = j
                while k < n:
                    m = k + 1
                    while m < n and data[m] == data[k]:
                        m += 1
                    if m - k >= 8:
                        break
                    k = m
                self.literal(data[i:k])
                j = k
            i = j

    def literal(self, data):
        self.out += bps_enc(((len(data) - 1) << 2) | 1)
        self.out += data
        self.tpos += len(data)

    def target_copy_rle(self, length):
        """copy `length` bytes starting at the byte just written (overlapping copy repeats it)"""
        rel = (self.tpos - 1) - self.tcopy
        self.out += bps_enc(((length - 1) << 2) | 3)
        self.out += bps_enc((abs(rel) << 1) | (1 if rel < 0 else 0))
        self.tcopy = self.tpos - 1 + length
        self.tpos += length


def bps_create(source, target, metadata=b""):
    """-> BPS patch bytes turning `source` into `target`"""
    w = _BpsWriter()
    w.out += b"BPS1" + bps_enc(len(source)) + bps_enc(len(target)) + bps_enc(len(metadata)) + metadata
    for a, b, same in _diff_runs(source, target):
        if same:
            w.source_read(b - a)
        else:
            w.target_read(target[a:b])
    if len(target) > len(source):
        w.target_read(target[len(source):])
    out = w.out
    out += crc32(source).to_bytes(4, "little") + crc32(target).to_bytes(4, "little")
    out += crc32(bytes(out)).to_bytes(4, "little")
    return bytes(out)


def bps_parse(patch):
    """-> dict(source_size, target_size, metadata, actions_start, actions_end, source_crc, target_crc, patch_crc); checks the patch CRC"""
    if len(patch) < 4 + 3 + 12 or patch[:4] != b"BPS1":
        raise PatchError("not a BPS patch")
    if int.from_bytes(patch[-4:], "little") != crc32(patch[:-4]):
        raise PatchError("BPS patch checksum mismatch (the patch file is damaged or modified)")
    ssize, pos = bps_dec(patch, 4)
    tsize, pos = bps_dec(patch, pos)
    msize, pos = bps_dec(patch, pos)
    meta = bytes(patch[pos:pos + msize])
    pos += msize
    end = len(patch) - 12
    if pos > end:
        raise PatchError("truncated BPS patch")
    return {"source_size": ssize, "target_size": tsize, "metadata": meta, "actions_start": pos, "actions_end": end,
            "source_crc": int.from_bytes(patch[end:end + 4], "little"), "target_crc": int.from_bytes(patch[end + 4:end + 8], "little"),
            "patch_crc": int.from_bytes(patch[end + 8:], "little")}


def bps_apply(patch, source, check_source=True):
    """-> target bytes.  Verifies the source (size, CRC) and the result CRC."""
    h = bps_parse(patch)
    if check_source:
        if len(source) != h["source_size"] or crc32(source) != h["source_crc"]:
            raise PatchError("the source ROM is not the one the patch was made for (size %d / CRC32 %08X, expected %d / %08X)"
                             % (len(source), crc32(source), h["source_size"], h["source_crc"]))
    out = bytearray()
    pos, end = h["actions_start"], h["actions_end"]
    scopy = tcopy = 0
    while pos < end:
        v, pos = bps_dec(patch, pos)
        cmd, length = v & 3, (v >> 2) + 1
        if cmd == 0:                                             # SourceRead: same offset in the source
            o = len(out)
            if o + length > len(source):
                raise PatchError("SourceRead beyond the end of the source")
            out += source[o:o + length]
        elif cmd == 1:                                           # TargetRead: literal bytes
            if pos + length > end:
                raise PatchError("truncated TargetRead")
            out += patch[pos:pos + length]
            pos += length
        else:
            d, pos = bps_dec(patch, pos)
            d = -(d >> 1) if d & 1 else d >> 1
            if cmd == 2:                                         # SourceCopy
                scopy += d
                if scopy < 0 or scopy + length > len(source):
                    raise PatchError("SourceCopy outside the source")
                out += source[scopy:scopy + length]
                scopy += length
            else:                                                # TargetCopy (may overlap the bytes being written)
                tcopy += d
                if tcopy < 0 or tcopy >= len(out):
                    raise PatchError("TargetCopy outside the output")
                for _ in range(length):
                    out.append(out[tcopy])
                    tcopy += 1
    if len(out) != h["target_size"]:
        raise PatchError("the patched size %d differs from the size in the patch (%d)" % (len(out), h["target_size"]))
    if crc32(out) != h["target_crc"]:
        raise PatchError("the CRC32 of the result does not match the patch (wrong source or damaged patch)")
    return bytes(out)


# ---------------------------------------------------------------- IPS
def ips_create(source, target):
    """-> IPS patch bytes (target < 16 MB).  Equal bytes are never stored except the one byte of the "EOF" offset rule."""
    if len(target) > IPS_MAX or len(source) > IPS_MAX:
        raise PatchError("IPS cannot address 16 MB or more (%d bytes); use BPS" % max(len(source), len(target)))
    out = bytearray(b"PATCH")
    for a, b, same in _diff_runs(source, target):
        if not same:
            _ips_records(out, target, a, b)
    if len(target) > len(source):
        # new bytes behind the source; zero filled stretches are still stored (the source has nothing there)
        _ips_records(out, target, len(source), len(target))
    out += b"EOF"
    if len(target) < len(source):
        out += len(target).to_bytes(3, "big")
    return bytes(out)


def _ips_records(out, target, a, b):
    while a < b:
        start = a
        if start == IPS_EOF_OFFSET:
            start -= 1                                            # a record at offset "EOF" would end the file: begin one byte earlier
        n = min(b - start, 0xFFFF)
        data = target[start:start + n]
        if n >= 6 and data.count(data[0]) == n:                   # RLE record
            out += start.to_bytes(3, "big") + b"\x00\x00" + n.to_bytes(2, "big") + data[:1]
        else:
            out += start.to_bytes(3, "big") + n.to_bytes(2, "big") + data
        a = start + n


def ips_apply(patch, source):
    """-> target bytes (no checksums exist in IPS: the caller must trust the source)"""
    if patch[:5] != b"PATCH":
        raise PatchError("not an IPS patch")
    out = bytearray(source)
    pos = 5
    while True:
        if pos + 3 > len(patch):
            raise PatchError("IPS patch without EOF")
        if patch[pos:pos + 3] == b"EOF":
            pos += 3
            break
        off = int.from_bytes(patch[pos:pos + 3], "big")
        size = int.from_bytes(patch[pos + 3:pos + 5], "big")
        pos += 5
        if size == 0:
            if pos + 3 > len(patch):
                raise PatchError("truncated IPS RLE record")
            size = int.from_bytes(patch[pos:pos + 2], "big")
            data = patch[pos + 2:pos + 3] * size
            pos += 3
        else:
            data = patch[pos:pos + size]
            if len(data) != size:
                raise PatchError("truncated IPS record")
            pos += size
        if off > len(out):
            out += bytes(off - len(out))
        out[off:off + size] = data
    if pos + 3 <= len(patch):
        del out[int.from_bytes(patch[pos:pos + 3], "big"):]
    return bytes(out)


def detect_format(patch):
    if patch[:4] == b"BPS1":
        return "bps"
    if patch[:5] == b"PATCH":
        return "ips"
    raise PatchError("unknown patch format (expected BPS or IPS)")


def create(source, target, fmt="bps", metadata=b""):
    return bps_create(source, target, metadata) if fmt == "bps" else ips_create(source, target)


def apply(patch, source, keep_header=False, check_source=True):
    """Apply a patch to a ROM image that may have a copier header -> patched ROM (headerless unless keep_header and a header was present)."""
    plain, header = strip_header(source)
    fmt = detect_format(patch)
    out = bps_apply(patch, plain, check_source) if fmt == "bps" else ips_apply(patch, plain)
    return header + out if keep_header else out


def verify(patch, source=None, target=None):
    """-> list of problems (empty = ok).  Without ROMs only the structure and checksums of the patch are checked."""
    problems = []
    fmt = detect_format(patch)
    try:
        if fmt == "bps":
            h = bps_parse(patch)
            if source is not None and (len(source) != h["source_size"] or crc32(source) != h["source_crc"]):
                problems.append("source ROM does not match the patch (size/CRC32)")
            if target is not None and (len(target) != h["target_size"] or crc32(target) != h["target_crc"]):
                problems.append("target ROM does not match the patch (size/CRC32)")
        elif source is None:
            ips_apply(patch, b"")                               # structure only
        if source is not None and target is not None and not problems:
            if apply(patch, source) != target:
                problems.append("the patched source differs from the target")
    except PatchError as e:
        problems.append(str(e))
    return problems


# ---------------------------------------------------------------- build integration
def find_original(explicit=None):
    """The user's own original US ROM: explicit path, $HM_ROM_US, or the first *.sfc/*.smc in $HM_ROM_DIR/US (ROM dumps are tool inputs, never stored in the repository)."""
    import os
    for c in (explicit, os.environ.get("HM_ROM_US")):
        if c:
            if not Path(c).is_file():
                raise PatchError("original ROM not found: %s" % c)
            return Path(c)
    d = os.environ.get("HM_ROM_DIR")
    if d:
        found = sorted(list((Path(d) / "US").glob("*.sfc")) + list((Path(d) / "US").glob("*.smc")))
        if found:
            return found[0]
    raise PatchError("the original US ROM is needed: pass --patch-source FILE, or set HM_ROM_US / HM_ROM_DIR (<dir>/US/*.sfc)")


def check_original_is_us(plain):
    """The expected US size/CRC32 (tests/expected.json) -> None or a message"""
    import json
    exp = json.loads((Path(__file__).resolve().parents[2] / "tests" / "expected.json").read_text(encoding="utf-8"))["US"]
    if len(plain) != exp["size"] or "%08X" % crc32(plain) != exp["crc32"]:
        return "the source is not the original US release (CRC32 %08X, expected %s)" % (crc32(plain), exp["crc32"])
    return None


def patch_build(built, formats, source=None, out_dir=None, metadata=b"", out=print):
    """Create the patch file(s) for a finished translation build next to it (or in out_dir) -> list of written paths."""
    built = Path(built)
    src = strip_header(find_original(source).read_bytes())[0]
    msg = check_original_is_us(src)
    if msg:
        raise PatchError(msg)
    tgt = built.read_bytes()
    written = []
    for fmt in formats:
        p = create(src, tgt, fmt, metadata)
        if apply(p, src) != tgt:
            raise PatchError("internal error: the %s patch does not reproduce the build" % fmt)
        dest = Path(out_dir or built.parent) / (built.stem + "." + fmt)
        _write(dest, p)
        out("patch: %s (%d bytes, %s)" % (dest, len(p), fmt.upper()))
        written.append(dest)
    return written


# ---------------------------------------------------------------- command line
def _read(path):
    try:
        return Path(path).read_bytes()
    except OSError as e:
        raise SystemExit("cannot read %s: %s" % (path, e))


def _write(path, data):
    p = Path(path)
    p.parent.mkdir(parents=True, exist_ok=True)
    p.write_bytes(data)


def main(argv=None):
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    sub = ap.add_subparsers(dest="cmd", required=True)
    c = sub.add_parser("create"); c.add_argument("original"); c.add_argument("built"); c.add_argument("-o", "--out")
    c.add_argument("--format", choices=("bps", "ips"), default="bps"); c.add_argument("--metadata", default="", help="BPS metadata text (ASCII/UTF-8)")
    a_ = sub.add_parser("apply"); a_.add_argument("patch"); a_.add_argument("original"); a_.add_argument("-o", "--out")
    a_.add_argument("--keep-header", action="store_true", help="write the output with the 512 byte header of the input")
    a_.add_argument("--force", action="store_true", help="BPS: skip the check of the source CRC (the result CRC is still checked)")
    v = sub.add_parser("verify"); v.add_argument("patch"); v.add_argument("--source"); v.add_argument("--target")
    i = sub.add_parser("info"); i.add_argument("patch")
    a = ap.parse_args(argv)
    try:
        if a.cmd == "create":
            src, _ = strip_header(_read(a.original))
            tgt, _ = strip_header(_read(a.built))
            out = a.out or str(Path(a.built).with_suffix("." + a.format))
            patch = create(src, tgt, a.format, a.metadata.encode("utf-8"))
            if apply(patch, src) != tgt:
                raise PatchError("internal error: the created patch does not reproduce the target")
            _write(out, patch)
            changed = sum(e - s for s, e, same in _diff_runs(src, tgt) if not same) + max(0, len(tgt) - len(src))
            print("%s: %s, %d bytes (%d changed byte(s) of %d); source CRC32 %08X, target CRC32 %08X" % (a.format.upper(), out, len(patch), changed, len(tgt), crc32(src), crc32(tgt)))
        elif a.cmd == "apply":
            patch = _read(a.patch)
            src = _read(a.original)
            res = apply(patch, src, a.keep_header, check_source=not a.force)
            out = a.out or str(Path(a.original).with_name(Path(a.original).stem + "_patched.sfc"))
            _write(out, res)
            print("patched ROM: %s (%d bytes, CRC32 %08X)%s" % (out, len(res), crc32(res), "; copier header detected" if has_header(src) else ""))
        elif a.cmd == "verify":
            patch = _read(a.patch)
            src = strip_header(_read(a.source))[0] if a.source else None
            tgt = strip_header(_read(a.target))[0] if a.target else None
            probs = verify(patch, src, tgt)
            for p in probs:
                print("ERROR: " + p)
            print("verify: %s" % ("FAILED" if probs else "OK"))
            return 1 if probs else 0
        else:
            patch = _read(a.patch)
            fmt = detect_format(patch)
            if fmt == "bps":
                h = bps_parse(patch)
                print("BPS: source %d bytes CRC32 %08X, target %d bytes CRC32 %08X, patch CRC32 %08X, metadata %d byte(s), patch %d bytes"
                      % (h["source_size"], h["source_crc"], h["target_size"], h["target_crc"], h["patch_crc"], len(h["metadata"]), len(patch)))
            else:
                print("IPS: %d bytes (no checksums)" % len(patch))
    except PatchError as e:
        print("ERROR: %s" % e, file=sys.stderr)
        return 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
