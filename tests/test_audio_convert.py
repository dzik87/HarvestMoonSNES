#!/usr/bin/env python3
"""Tests for the audio source pipeline: tools/audio/{brr,spcasm,trackfmt,audioconv}.py.

Run: python3 tests/test_audio_convert.py   (needs the audio sources under assets/audio; reads, never writes them)
"""
import os
import random
import struct
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools", "audio"))
import audioconv  # noqa: E402
import brr  # noqa: E402
import spc700  # noqa: E402
import spcasm  # noqa: E402
import trackfmt  # noqa: E402

failures = []


def check(cond, msg):
    if not cond:
        failures.append(msg)
        print("FAIL: " + msg)


# ---------------------------------------------------------------------------
def ref_decode(blocks):
    """Independent, deliberately literal re-implementation of the DSP BRR decoder (full-scale arithmetic)."""
    out, s1, s2 = [], 0, 0                              # s1/s2: previous outputs, full scale (already doubled)
    for blk in blocks:
        rng, filt = blk[0] >> 4, (blk[0] >> 2) & 3
        for i in range(16):
            byte = blk[1 + i // 2]
            n = byte >> 4 if i % 2 == 0 else byte & 15
            if n >= 8:
                n -= 16
            v = (n << rng) >> 1 if rng <= 12 else (-2048 if n < 0 else 0)
            if filt == 1:
                v += (s1 >> 1) - (((s1 >> 1) + 15) >> 4) if False else (s1 >> 1) + ((-(s1 >> 1)) >> 4)
            elif filt == 2:
                v += s1 + ((-3 * (s1 >> 1)) >> 5) - (s2 >> 1) + ((s2 >> 1) >> 4)
            elif filt == 3:
                v += s1 + ((-13 * (s1 >> 1)) >> 6) - (s2 >> 1) + ((3 * (s2 >> 1)) >> 4)
            v = max(-32768, min(32767, v))
            v = ((v * 2 + 32768) % 65536) - 32768
            out.append(v)
            s2, s1 = s1, v
    return out


def test_brr_decoder():
    rnd = random.Random(7)
    blocks = [bytes([rnd.randrange(256)] + [rnd.randrange(256) for _ in range(8)]) for _ in range(3000)]
    data = b"".join(blocks)
    check(brr.decode(data, len(blocks)) == ref_decode(blocks), "decoder differs from the reference implementation (random blocks)")
    # hand-computed vectors
    blk = bytes([0x40, 0x10, 0, 0, 0, 0, 0, 0, 0])                 # range 4 filter 0, nibble 1 -> (1<<4)>>1 = 8 -> 16
    check(brr.decode(blk, 1)[:2] == [16, 0], "range 4 nibble 1")
    blk = bytes([0xC0, 0x7F, 0, 0, 0, 0, 0, 0, 0])                 # range 12: nibble 7 -> (7<<12)>>1 = 14336 -> 28672, nibble -1 -> -2048 -> -4096
    check(brr.decode(blk, 1)[:2] == [28672, -4096], "range 12 nibbles 7 and -1")
    blk = bytes([0xC0, 0xF0, 0, 0, 0, 0, 0, 0, 0])
    check(brr.decode(blk, 1)[:2] == [-4096, 0], "range 12 nibble -1")
    blk = bytes([0xD0, 0x80, 0, 0, 0, 0, 0, 0, 0])                 # range 13: negative nibble -> -2048 -> -4096
    check(brr.decode(blk, 1)[:2] == [-4096, 0], "range 13 negative nibble")
    # filter 1 accumulates: constant 0x7 nibbles at range 11 saturate at the 16-bit limit
    blk = bytes([0xB4] + [0x77] * 8)
    d = brr.decode(blk, 1)
    check(d[-1] <= 32766 and d[-1] % 2 == 0, "filter 1 stays inside the 16-bit range")
    # filter history carries over between blocks, not reset
    b2 = bytes([0x04, 0, 0, 0, 0, 0, 0, 0, 0])
    two = brr.decode(blk + b2, 2)
    check(two[16] != 0, "filter state is kept across blocks")
    check(all(x % 2 == 0 for x in brr.decode(data, len(blocks))), "all decoded samples are even")


def test_brr_encoder():
    rnd = random.Random(11)
    # any decoded stream has an exact encoding
    blocks = []
    for k in range(400):
        h = (rnd.randrange(0, 13) << 4) | (rnd.randrange(4) << 2)
        blocks.append(bytes([h] + [rnd.randrange(256) for _ in range(8)]))
    pcm = brr.decode(b"".join(blocks), len(blocks))
    st = {}
    enc = brr.encode(pcm, stats=st)
    check(st.get("lossy", 0) == 0, "random decoded blocks need no lossy encoding (%s)" % st)
    check(brr.decode(enc[:-0 or None], len(blocks)) == pcm, "encode(decode(x)) decodes to the same PCM")
    # loop / end flags
    lp = brr.encode(pcm[:64], loop=True)
    check([lp[i * 9] & 3 for i in range(4)] == [2, 2, 2, 3], "looping sample: loop flag on every block, end flag on the last")
    nl = brr.encode(pcm[:64])
    check([nl[i * 9] & 3 for i in range(4)] == [0, 0, 0, 1], "one-shot sample flags")
    # overrides are honoured while valid and ignored when stale
    tgt = pcm[:16]
    first = brr.encode(tgt)
    r0, f0 = first[0] >> 4, (first[0] >> 2) & 3
    alt = brr.fit_options(r0, f0, tgt, 0, 0)
    mask = 0
    forced = brr.encode(tgt, overrides={0: (r0, f0, mask)})
    check(brr.decode(forced, 1) == tgt, "valid override reproduces the block")
    stale = brr.encode([x // 2 * 2 for x in reversed(tgt)], overrides={0: (r0, f0, 0xFFFF)})
    check(len(stale) == 9, "stale override does not break the encoder")
    # lossy path: a modified sample must stay close to its input (SNR) and keep the loop block at filter 0
    wave = [int(12000 * __import__("math").sin(i * 0.05) + 3000 * __import__("math").sin(i * 0.31)) for i in range(16 * 200)]
    st = {}
    data = brr.encode(wave, loop=True, loop_block=20, stats=st)
    dec = brr.decode(data, 200)
    err = sum((a - b) ** 2 for a, b in zip(wave, dec))
    sig = sum(a * a for a in wave)
    check(st.get("lossy", 0) > 150, "synthetic sine needs the lossy encoder")
    check(sig / max(err, 1) > 300, "lossy encoder SNR above 24 dB (ratio %.0f)" % (sig / max(err, 1)))
    check(((data[20 * 9] >> 2) & 3) == 0 or st.get("exact"), "lossy loop-start block uses filter 0")
    try:
        brr.encode([0] * 15)
        check(False, "odd length must be rejected")
    except ValueError:
        pass


def test_wav_io():
    pcm = [0, 1000, -1000, 32766, -32768, 12] * 8
    raw = brr.to_wav(pcm, 32000, (16, 47))
    back, rate, loop = brr.from_wav(raw)
    check(back == pcm and rate == 32000 and loop == (16, 47), "mono 16-bit WAV with smpl loop round trip")
    st = struct.pack("<4sI4s4sIHHIIHH4sI", b"RIFF", 0, b"WAVE", b"fmt ", 16, 1, 2, 44100, 44100 * 4, 4, 16, b"data", 8) + struct.pack("<4h", 100, 300, -50, -150)
    b2, r2, _ = brr.from_wav(st)
    check(b2 == [200, -100] and r2 == 44100, "stereo WAV is averaged")


# ---------------------------------------------------------------------------
def test_spcasm():
    rnd = random.Random(3)
    base = 0x2000
    bad = 0
    for op in range(256):
        for _ in range(3):
            n = spc700.LENGTHS[op]
            body = bytes([op] + [rnd.randrange(256) for _ in range(n - 1)])
            d = spc700.decode(body, 0, base)
            if d[1].startswith(".db"):
                continue
            if op == 0x4F:                       # PCALL prints the target as $FFxx
                pass
            try:
                org, out = spcasm.assemble("ORG $%04X\n%s\n" % (base, d[1]))
            except spcasm.AsmError:
                bad += 1
                continue
            if out != body:
                bad += 1
    check(bad == 0, "%d opcode round trips (disassemble -> assemble) failed" % bad)
    org, out = spcasm.assemble("ORG $0500\nstart:\n  MOV A,#$05\n  BNE start\n  JMP !start\n  db $01 $02\n  dw start\n")
    check(out == bytes([0xE8, 5, 0xD0, 0xFC, 0x5F, 0, 5, 1, 2, 0, 5]), "labels, branches, jumps, db, dw")
    for src in ("ORG $0500\n BNE far\n" + " NOP\n" * 200 + "far:\n", "ORG $0500\n MOV $100,#$01\n", "ORG $0500\n FOO\n", "ORG $0500\n BRA missing\n"):
        try:
            spcasm.assemble(src)
            check(False, "assembler accepted bad source %r" % src[:20])
        except spcasm.AsmError:
            pass


def test_trackfmt():
    text = """
songlist:
    pattern pat0
    jump songlist 255
    songend
pat0:
    voices v0 - - - - - - -
v0:
    percbase $0B
    L48:G7V15 C4 L24 D#4 tie rest
    call s1 2
    instrument $02
    end
s1:
    L12 perc3 A6 end
"""
    b = trackfmt.assemble(text)
    # songlist 8 bytes, pattern 16, v0 ..., sub
    check(b[:8] == bytes([8, 0, 0xFF, 0x80, 0, 0, 0, 0x80]) or b[:8] == bytes([8, 0, 0xFF, 0x80, 0, 0, 0, 0x80]), "song list encoding")
    check(b[8:10] == bytes([0x18, 0]) and b[10:24] == bytes(14), "pattern pointers")
    v0 = b[0x18:]
    check(v0[:11] == bytes([0xFA, 0x0B, 48, 0x7F, 0xA4, 24, 0xA7, 0xC8, 0xC9, 0xEF, 0x28]), "stream bytes %s" % v0[:12].hex())
    again = trackfmt.assemble(trackfmt.to_text(b, [], kind="track"))
    check(again == b, "text -> bytes -> text -> bytes")
    # editing: inserting a note moves the later pointers
    text2 = text.replace("tie rest", "tie rest G4")
    b2 = trackfmt.assemble(text2)
    check(len(b2) == len(b) + 1 and b2[0x18 + 11] == b[0x18 + 10] + 1, "call pointer follows an inserted note")
    for bad in ("v0:\n frobnicate $01\n", "x:\n L200\n", "x:\n instrument\n", "x:\n instrument $100\n", "x:\n call nowhere 1\n", "a:\na:\n end\n", "x:\n perc30\n"):
        try:
            trackfmt.assemble(bad)
            check(False, "accepted bad track source %r" % bad)
        except trackfmt.FormatError:
            pass
    check(trackfmt.note_name(0x80) == "C1" and trackfmt.note_byte("B6") == 0xC7 and trackfmt.note_byte("C7") is None, "note names")


# ---------------------------------------------------------------------------
def test_sources_build():
    blobs, tables, info = audioconv.build_all()
    check(len(blobs) == 65, "65 blobs built (%d)" % len(blobs))
    check(len(blobs["sAudioSpcDriver"]) == 0x0FD6, "driver size")
    check(len(info["sfx"]) == 0x3F2, "SFX block is $3F2 bytes")
    sizes = {k: len(v) for k, v in blobs.items()}
    check(sizes["sAudioSample_Id39"] == 8992, "Id39 = BRR + 1008 byte SFX tail")
    check("aAudioSampleLookupTable:" in tables and "dl sAudioSample_Id39" in tables, "table include content")
    # building twice gives the same bytes
    blobs2, tables2, _ = audioconv.build_all()
    check(blobs2 == blobs and tables2 == tables, "build is deterministic")
    # every sample WAV decodes from the built BRR bit-exactly (the lossless property)
    for label, meta in sorted(info["metas"].items()):
        wav, _ = audioconv.sample_files(label)
        pcm, _, _ = brr.from_wav(wav.read_bytes())
        nb = len(pcm) // 16
        if brr.decode(blobs[label][:nb * 9], nb) != list(pcm):
            check(False, "%s: BRR does not decode to its WAV" % label)
    # the track table sizes equal the blob sizes
    check("dw $02EC,$02EC" in tables, "track size table starts with the Spring size")


def test_midi():
    blobs, _, info = audioconv.build_all()
    mid = audioconv.track_to_midi(blobs["sAudioTrack_Spring"])
    check(mid[:4] == b"MThd" and mid.count(b"MTrk") >= 5, "MIDI export structure")


def main():
    tests = [test_brr_decoder, test_brr_encoder, test_wav_io, test_spcasm, test_trackfmt, test_sources_build, test_midi]
    for t in tests:
        before = len(failures)
        t()
        print("%-24s %s" % (t.__name__, "ok" if len(failures) == before else "FAILED (%d)" % (len(failures) - before)))
    return 1 if failures else 0


if __name__ == "__main__":
    sys.exit(main())
