#!/usr/bin/env python3
"""Audio asset converter: editable sources <-> the binary blobs that are included with `incbin`.

Sources (extracted from the ROM into assets/audio/, see docs/extraction.md; names and the bank layout are in defs/audio/):
  audio.json                       track table (track id -> blob + sample ids), SFX sample ids, common sample list
  samples/<label>.wav + .json      BRR samples as 16-bit mono PCM + sample-table fields / loop / encoder overrides
  tracks/<label>.track.txt         songs as N-SPC style text (tools/audio/trackfmt.py)
  sfx/<Sfx_Name>.sfx.txt           one sound effect each (stream body); audio.json "sfx_names" gives the id order; together they form
                                   the SFX block uploaded to SPC $1600 (same stream syntax, 50 streams)
  driver/sAudioSpcDriver.spc.asm   the SPC700 sound engine as assembler source (tools/audio/spcasm.py)

Generated (git-ignored):
  assets/audio/<label>.bin          one blob per label
  build/gen/audio/bank_XX.asm       ORG + labels + incbin of the blobs of each bank $AD-$B2, layout from defs/audio/banks.json
  build/gen/audio/audio_tables.inc  aAudioSampleSize / aAudioTrackDataSizeTable / sAudioData1_838F83 / sAudioSampleData /
                                    aAudioSfxSampleIdTable / aAudioSampleLookupTable (included by code/bank_83/audio.asm)

Commands:
  build                regenerate the blobs and the table include from the sources (tools/build_assets.py runs this)
  check                validate the sources (lossless WAV/BRR, track text, driver, tables); exit code 1 on problems
  (ROM -> sources: python tools/extract.py --rom-dir DIR --only audio, see tools/extract_steps/audio.py)
  midi [--out DIR] [labels...]   export tracks as Standard MIDI files (rough view only, the text is the source of truth)
  wav [--out DIR]      decode the generated sample blobs to WAV files (for listening; sources already contain WAVs)
  spc [--track LABEL|--all|--sfx NAME|ID] [--out DIR]   generated .spc snapshots (derived listening/interop format, not a source)
  render [--format wav|mp3] [--seconds N] ...      .spc -> audio with ffmpeg (libgme) when available
  spcmatch DUMPS...    identify foreign .spc dumps by RAM content and compare their static data with our generated songs
  spcdiff A.spc B.spc  compare two snapshots (e.g. an emulator dump against a generated one) per memory region
"""
import argparse
import json
import math
import os
import re
import struct
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))
import brr  # noqa: E402
import spcasm  # noqa: E402
import trackfmt  # noqa: E402

ROOT = HERE.parents[1]
AUDIO = ROOT / "assets" / "audio"
SAMPLES = AUDIO / "samples"
TRACKS = AUDIO / "tracks"
SFXDIR = AUDIO / "sfx"
DRIVER_DIR = AUDIO / "driver"
MANIFEST = AUDIO / "audio.json"
GEN = ROOT / "build" / "gen" / "audio"
TABLES_INC = GEN / "audio_tables.inc"
BANKS = ROOT / "defs" / "audio" / "banks.json"
DRIVER_LABEL = "sAudioSpcDriver"
DRIVER_SRC = DRIVER_DIR / (DRIVER_LABEL + ".spc.asm")
SFX_BASE = 0x1600
SFX_COUNT = 50
SFX_LABEL_TAIL = "sAudioSample_Id39"       # the SFX block lives in the tail of this blob
SAMPLE_RATE = 32000
DRIVER_BASE = 0x0500


class ConvError(Exception):
    pass


# ---------------------------------------------------------------------------
# small helpers
# ---------------------------------------------------------------------------
def write_if_changed(path, data):
    path = Path(path)
    if isinstance(data, str):
        data = data.encode("utf-8")
    if path.exists() and path.read_bytes() == data:
        return False
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_bytes(data)
    return True


def ceil16(n):
    return (n + 15) // 16 * 16


def fmt_override(v):
    if isinstance(v, (bytes, bytearray)):
        return "raw:" + bytes(v).hex()
    r, f, mask = v
    return "%d %d %04x" % (r, f, mask)


def parse_override(s):
    if s.startswith("raw:"):
        b = bytes.fromhex(s[4:])
        if len(b) != 9:
            raise ConvError("raw override must be 9 bytes")
        return b
    r, f, mask = s.split()
    return (int(r), int(f), int(mask, 16))


SAMPLE_KEYS = ["label", "sample_ids", "loop", "loop_start", "unused_loop_offset", "adsr1", "adsr2", "gain",
               "tuning_int", "tuning_frac", "pad_byte", "append", "canon"]


def dump_sample_json(meta):
    lines = ["{"]
    items = []
    for k in SAMPLE_KEYS:
        if k in meta:
            items.append('  "%s": %s' % (k, json.dumps(meta[k])))
    ov = meta.get("overrides", {})
    if ov:
        body = ",\n".join('    "%d": "%s"' % (k, v) for k, v in sorted(ov.items(), key=lambda kv: int(kv[0])))
        items.append('  "overrides": {\n%s\n  }' % body)
    else:
        items.append('  "overrides": {}')
    lines.append(",\n".join(items))
    lines.append("}")
    return "\n".join(lines) + "\n"


def sample_files(label):
    return SAMPLES / (label + ".wav"), SAMPLES / (label + ".json")


def load_sample_meta():
    metas = {}
    for f in sorted(SAMPLES.glob("*.json")):
        m = json.loads(f.read_text())
        m["overrides"] = {int(k): parse_override(v) for k, v in m.get("overrides", {}).items()}
        if m["label"] != f.stem:
            raise ConvError("%s: label %r does not match the file name" % (f.name, m["label"]))
        metas[m["label"]] = m
    return metas


# ---------------------------------------------------------------------------
# samples
# ---------------------------------------------------------------------------
def sample_loop_offset(meta):
    if meta["loop"]:
        return meta["loop_start"] // 16 * 9
    return meta["unused_loop_offset"]


def build_sample(meta, pcm=None, stats=None):
    """-> BRR bytes including the padding up to a multiple of 16 (= the aAudioSampleSize value)."""
    label = meta["label"]
    if pcm is None:
        wav, _ = sample_files(label)
        pcm, _rate, _loop = brr.from_wav(wav.read_bytes())
    if len(pcm) % 16:
        pcm = list(pcm) + [0] * (16 - len(pcm) % 16)
    if len(pcm) == 0:
        raise ConvError("%s: empty WAV" % label)
    if meta["loop"]:
        ls = meta["loop_start"]
        if ls % 16 or not 0 <= ls < len(pcm):
            raise ConvError("%s: loop_start %d must be a multiple of 16 inside the sample (%d samples)" % (label, ls, len(pcm)))
    data = brr.encode(pcm, loop=meta["loop"], loop_block=(meta["loop_start"] // 16 if meta["loop"] else None),
                      rule=meta.get("canon", brr.DEFAULT_RULE), overrides=meta.get("overrides"), stats=stats)
    return data + bytes([meta.get("pad_byte", 0xFF)]) * (ceil16(len(data)) - len(data))


def extract_sample(label, sample_ids, entry, blob, size, tail_bytes):
    """Original blob -> (meta, pcm).  `entry` is the sample table entry, `size` the aAudioSampleSize value."""
    import audio_map
    info = audio_map.brr_info(blob, size, entry["loop"])
    if not info["valid"]:
        raise ConvError("%s: not a valid BRR sample (%s)" % (label, info.get("why")))
    nb = info["end_block"] + 1
    brr_bytes = blob[:nb * 9]
    pcm = brr.decode(brr_bytes, nb)
    loop = bool(brr_bytes[(nb - 1) * 9] & 2)
    pad = blob[nb * 9:size]
    if len(set(pad)) > 1:
        raise ConvError("%s: padding is not a constant byte" % label)
    flags = [brr_bytes[k * 9] & 3 for k in range(nb)]
    want = [2 if loop else 0] * (nb - 1) + [(2 if loop else 0) | 1]
    if flags != want:
        raise ConvError("%s: unexpected block flags" % label)
    meta = {"label": label, "sample_ids": sample_ids, "loop": loop}
    if loop:
        if entry["loop"] % 9 or entry["loop"] // 9 >= nb:
            raise ConvError("%s: loop offset is not a block boundary" % label)
        meta["loop_start"] = entry["loop"] // 9 * 16
    else:
        meta["unused_loop_offset"] = entry["loop"]
    meta.update(adsr1=entry["adsr1"], adsr2=entry["adsr2"], gain=entry["gain"], tuning_int=entry["tune_hi"],
                tuning_frac=entry["tune_lo"], pad_byte=pad[0] if pad else 0xFF)
    if tail_bytes:
        meta["append"] = {"source": "sfx", "bytes": tail_bytes}
    # choose the canonical rule with the fewest per-block overrides
    best = None
    for rule in brr.CANON_RULES:
        order = brr.canon_order(rule)
        ov = {}
        o1 = o2 = 0
        for k in range(nb):
            tgt = pcm[k * 16:(k + 1) * 16]
            r = brr.block_override(brr_bytes[k * 9:(k + 1) * 9], tgt, o1, o2, order)
            if r is not None:
                ov[k] = r
            o1, o2 = tgt[15], tgt[14]
        if best is None or len(ov) < len(best[1]):
            best = (rule, ov)
    meta["canon"] = best[0]
    meta["overrides"] = {k: fmt_override(v) for k, v in best[1].items()}
    return meta, pcm


def wav_bytes(meta, pcm):
    loop = (meta["loop_start"], len(pcm) - 1) if meta["loop"] else None
    return brr.to_wav(pcm, SAMPLE_RATE, loop)


# ---------------------------------------------------------------------------
# manifest / tables
# ---------------------------------------------------------------------------
def load_manifest():
    return json.loads(MANIFEST.read_text())


def dump_manifest(man):
    out = ["{", '  "comment": "Track table (track id -> blob label + sample ids in slot order), SFX sample ids and the common sample list; '
           'see docs/formats/audio-sources.md",', '  "tracks": [']
    out.append(",\n".join('    {"id": %d, "blob": "%s", "samples": %s}' % (t["id"], t["blob"], json.dumps(t["samples"])) for t in man["tracks"]))
    out.append("  ],")
    out.append('  "sfx_names": %s,' % json.dumps(man["sfx_names"]))
    out.append('  "sfx_sample_ids": %s,' % json.dumps(man["sfx_sample_ids"]))
    out.append('  "common_samples": %s' % json.dumps(man["common_samples"]))
    out.append("}")
    return "\n".join(out) + "\n"


def gen_tables(man, metas, blobs, sizes):
    """The 65816-side tables as asar source (the data that used to be hand-written in code/bank_83/audio.asm)."""
    ids = {}
    for m in metas.values():
        for i in m["sample_ids"]:
            ids[i] = m
    n = max(ids) + 1
    if sorted(ids) != list(range(n)):
        raise ConvError("sample ids are not contiguous 0..%d" % (n - 1))
    out = ["; Generated by tools/audio/audioconv.py build from assets/audio (do not edit; git-ignored)", ""]

    def words(label, vals, per=6):
        out.append(label + ":")
        for i in range(0, len(vals), per):
            out.append("    dw " + ",".join("$%04X" % v for v in vals[i:i + per]))
        out.append("")
    words("aAudioSampleSize", [sizes[ids[i]["label"]] for i in range(n)])
    words("aAudioTrackDataSizeTable", [len(blobs[t["blob"]]) for t in man["tracks"]])
    out.append("sAudioData1_838F83:   ; 0x1A * [ptr24 pAudioTrack, 11 * n8 sample id]")
    for t in man["tracks"]:
        sm = list(t["samples"]) + [0] * (11 - len(t["samples"]))
        if len(sm) != 11:
            raise ConvError("track %d has more than 11 samples" % t["id"])
        out.append("    dl %s" % t["blob"])
        out.append("    db " + ",".join("$%02X" % x for x in sm))
    out.append("")
    out.append("sAudioSampleData:   ; 0x28 * [n16 loop offset, n8 ADSR1, n8 ADSR2, n8 GAIN, n8 tuning int, n8 tuning frac, ptr24 BRR data]")
    for i in range(n):
        m = ids[i]
        out.append("    dw $%04X" % sample_loop_offset(m))
        out.append("    db $%02X,$%02X,$%02X,$%02X,$%02X" % (m["adsr1"], m["adsr2"], m["gain"], m["tuning_int"], m["tuning_frac"]))
        out.append("    dl %s" % m["label"])
    out.append("")
    out.append("aAudioSfxSampleIdTable:")
    s = man["sfx_sample_ids"]
    for i in range(0, len(s), 12):
        out.append("    db " + ",".join("$%02X" % x for x in s[i:i + 12]))
    out.append("")
    out.append("aAudioSampleLookupTable:")
    out.append("    db " + ",".join("$%02X" % x for x in man["common_samples"]))
    return "\n".join(out) + "\n"


# ---------------------------------------------------------------------------
# build
# ---------------------------------------------------------------------------
def assemble_driver():
    org, data = spcasm.assemble(DRIVER_SRC.read_text())
    if org != DRIVER_BASE:
        raise ConvError("driver ORG must be $%04X" % DRIVER_BASE)
    return data


def sfx_names(man=None):
    """Effect names in id order (assets/audio/audio.json "sfx_names"); the stream of id N is sfx/<name>.sfx.txt."""
    man = man or load_manifest()
    names = man["sfx_names"]
    if len(names) != SFX_COUNT or len(set(names)) != SFX_COUNT:
        raise ConvError("sfx_names must list %d distinct names" % SFX_COUNT)
    return names


def sfx_source_text(man=None):
    """The single-block SFX source text composed from the per-effect files (pointer table, then one labelled stream each)."""
    names = sfx_names(man)
    out = ["; SFX block uploaded to SPC $%04X by command 1: %d stream pointers, then the streams (composed from sfx/<name>.sfx.txt)." % (SFX_BASE, SFX_COUNT), ""]
    out += ["    ptr " + n for n in names]
    for n in names:
        f = SFXDIR / (n + ".sfx.txt")
        if not f.exists():
            raise ConvError("missing SFX source %s" % f.name)
        out += ["", n + ":", f.read_text().rstrip("\n")]
    return "\n".join(out) + "\n"


def assemble_sfx(man=None):
    return trackfmt.assemble(sfx_source_text(man), kind="sfx", base=SFX_BASE)


def build_all(quiet=False):
    """-> ({label: bytes}, tables text, info).  Pure function of the sources."""
    man = load_manifest()
    metas = load_sample_meta()
    blobs = {}
    sizes = {}
    sfx = assemble_sfx()
    for label, meta in metas.items():
        data = build_sample(meta)
        sizes[label] = len(data)
        ap = meta.get("append")
        if ap:
            if ap["source"] != "sfx":
                raise ConvError("%s: unknown append source" % label)
            if any(sfx[ap["bytes"]:]):
                raise ConvError("the SFX block must end in zero bytes after byte %d" % ap["bytes"])
            data += sfx[:ap["bytes"]]
        blobs[label] = data
    for t in man["tracks"]:
        label = t["blob"]
        if label in blobs:
            continue
        f = TRACKS / (label + ".track.txt")
        blobs[label] = trackfmt.assemble(f.read_text(), kind="track")
    blobs[DRIVER_LABEL] = assemble_driver()
    tables = gen_tables(man, metas, blobs, sizes)
    return blobs, tables, dict(sfx=sfx, metas=metas, man=man, sizes=sizes)


def render_bank(bank, b):
    out = ["; Bank $%s - generated by tools/audio/audioconv.py build from defs/audio/banks.json (do not edit; not committed)" % bank, "",
           "    ORG %s" % b["org"], ""]
    for label in b["blobs"]:
        out += ["%s:" % label, '    incbin "../../../assets/audio/%s.bin"' % label, ""]
    out += ["Padding_%s0000:" % bank, "    fill align $8000", ""]
    return "\n".join(out)


def check_banks(blobs):
    """Problems of the bank layout (every blob exactly once, each bank fits $8000 bytes)."""
    lay = json.loads(BANKS.read_text())
    probs = []
    seen = []
    for bank, b in lay.items():
        total = sum(len(blobs[l]) for l in b["blobs"] if l in blobs)
        missing = [l for l in b["blobs"] if l not in blobs]
        if missing:
            probs.append("bank %s: unknown blobs %s" % (bank, missing))
        if total > 0x8000:
            probs.append("bank %s: %d bytes do not fit $8000" % (bank, total))
        seen += b["blobs"]
    if sorted(seen) != sorted(blobs) or len(set(seen)) != len(seen):
        probs.append("banks.json must list every blob exactly once (missing: %s)" % sorted(set(blobs) - set(seen)))
    return probs


def cmd_build(a):
    blobs, tables, _ = build_all()
    changed = 0
    lay = json.loads(BANKS.read_text())
    for bank, b in lay.items():
        changed += write_if_changed(GEN / ("bank_%s.asm" % bank), render_bank(bank, b))
    for label, data in sorted(blobs.items()):
        changed += write_if_changed(AUDIO / (label + ".bin"), data)
    changed += write_if_changed(TABLES_INC, tables)
    if not a.quiet:
        print("audioconv build: %d blobs + table include (%d files written)" % (len(blobs), changed))
    return 0


# The ROM -> sources extraction lives in tools/extract_steps/audio.py (python tools/extract.py --rom-dir DIR --only audio);
# it uses extract_sample / wav_bytes / dump_sample_json / dump_manifest from this module.
DRIVER_TABLES = [(0x1053, 13), (0x13E0, 27), (0x143D, 13)]     # word tables of the driver (command jump, handler, pitch)


# ---------------------------------------------------------------------------
# check
# ---------------------------------------------------------------------------
def cmd_check(a):
    problems = []

    def bad(msg):
        problems.append(msg)
        print("FAIL " + msg)

    def ok(msg):
        if a.verbose:
            print("ok   " + msg)
    try:
        blobs, tables, info = build_all()
    except (ConvError, trackfmt.FormatError, spcasm.AsmError, OSError, ValueError, KeyError) as e:
        print("FAIL build: %s" % e)
        return 1
    metas, man, sfx = info["metas"], info["man"], info["sfx"]
    # samples: unchanged WAV must decode back exactly; overrides must all be live
    nover = nblocks = 0
    for label, meta in sorted(metas.items()):
        wav, _ = sample_files(label)
        pcm, rate, loop = brr.from_wav(wav.read_bytes())
        if len(pcm) % 16:
            bad("%s: WAV length %d is not a multiple of 16 samples (padded with silence when building)" % (label, len(pcm)))
        stats = {}
        data = build_sample(meta, stats=stats)
        nb = len(pcm) // 16
        dec = brr.decode(data[:nb * 9], nb)
        if dec != list(pcm[:nb * 16]):
            lossy = stats.get("lossy", 0)
            bad("%s: encoded BRR does not decode to the WAV (%d lossy blocks) - edited sample; informational for modders" % (label, lossy))
        else:
            ok("%s: BRR decodes to the WAV bit-exactly" % label)
        if meta["loop"]:
            if data[(nb - 1) * 9] & 3 != 3:
                bad("%s: loop sample must end with loop+end flags" % label)
        if rate != SAMPLE_RATE:
            ok("%s: WAV rate %d differs from the nominal %d (ignored)" % (label, rate, SAMPLE_RATE))
        nover += len(meta["overrides"])
        nblocks += nb
        if len(data) >= 0x10000:
            bad("%s: sample larger than 64 KiB" % label)
        if sample_loop_offset(meta) > 0xFFFF:
            bad("%s: loop offset out of range" % label)
        # round trip of the edit path: re-encoding the decoded data must reproduce the same bytes
        again = build_sample(meta, pcm=dec)
        if again != data:
            bad("%s: build is not idempotent" % label)
    ok("%d samples, %d blocks, %d per-block overrides" % (len(metas), nblocks, nover))
    # tracks: text -> bytes -> text must be stable, size limits
    for t in man["tracks"]:
        label = t["blob"]
        if label not in blobs:
            bad("track %d: unknown blob %s" % (t["id"], label)); continue
        data = blobs[label]
        if len(data) > 0x600:
            bad("%s: %d bytes exceeds the $600-byte track area" % (label, len(data)))
        for sid in t["samples"]:
            if sid not in {i for m in metas.values() for i in m["sample_ids"]}:
                bad("track %d references unknown sample id %d" % (t["id"], sid))
        txt = trackfmt.to_text(data, [], kind="track")
        if trackfmt.assemble(txt) != data:
            bad("%s: text round trip failed" % label)
    ok("%d track blobs" % len({t["blob"] for t in man["tracks"]}))
    for pr in check_banks(blobs):
        bad(pr)
    # SFX
    if len(sfx) > 0x3F4:
        bad("SFX block is %d bytes, larger than the $3F4 bytes between $1600 and the track base" % len(sfx))
    if trackfmt.assemble(trackfmt.to_text(sfx, [], kind="sfx", base=SFX_BASE), kind="sfx", base=SFX_BASE) != sfx:
        bad("SFX text round trip failed")
    # driver: parameter counts must agree with the command table of the text format
    drv = blobs[DRIVER_LABEL]
    pc = [drv[0x141E - DRIVER_BASE + i] for i in range(27)]
    if pc != [trackfmt.COMMANDS[0xE0 + i][1] for i in range(27)]:
        bad("trackfmt.COMMANDS parameter counts differ from the driver table at $141E")
    if len(drv) != 0x0FD6:
        ok("driver size %d (code/bank_80/core.asm uploads $0FD6 bytes: update it when the size changes)" % len(drv))
    # SPC700 assembler source must be in canonical form (disassembler fixed point)
    import audio_map
    eng = audio_map.Engine(drv)
    again = spcasm.to_source(drv, DRIVER_BASE, [DRIVER_BASE] + eng.handler_table() + eng.cmd_jump_table(), DRIVER_TABLES, [])
    if spcasm.assemble(again)[1] != drv:
        bad("driver disassembly does not reassemble")
    # sample-table consistency with the engine's region capacity is checked by tools/audio/audio_map.py --check
    print("audioconv check: %s" % ("FAILED (%d)" % len(problems) if problems else "OK"))
    return 1 if problems else 0


# ---------------------------------------------------------------------------
# wav (from blobs)
# ---------------------------------------------------------------------------
def cmd_wav(a):
    import audio_map
    p = audio_map.load()
    out = Path(a.out)
    out.mkdir(parents=True, exist_ok=True)
    done = set()
    for i, s in enumerate(p.samples):
        if i == 0 or s["label"] in done:
            continue
        done.add(s["label"])
        data = p.labels[s["label"]]["path"].read_bytes()
        info = audio_map.brr_info(data, p.sample_size[i], s["loop"])
        nb = info["end_block"] + 1
        pcm = brr.decode(data[:nb * 9], nb)
        loop = (s["loop"] // 9 * 16, len(pcm) - 1) if info.get("loop_flag") else None
        (out / (s["label"] + ".wav")).write_bytes(brr.to_wav(pcm, SAMPLE_RATE, loop))
    print("wrote %d WAV files to %s" % (len(done), out))
    return 0


# ---------------------------------------------------------------------------
# midi export
# ---------------------------------------------------------------------------
GATE = [0x32, 0xB2, 0xBF, 0xCB, 0xD8, 0xE5, 0xF2, 0xFC]
VEL = [0x19, 0x32, 0x4C, 0x65, 0x72, 0x7F, 0x8C, 0x98, 0xA5, 0xB2, 0xBF, 0xCB, 0xD8, 0xE5, 0xF2, 0xFC]
PPQ = 48                                   # one quarter note = 48 song ticks (an assumption, the notes use multiples of 12)


def _vlq(v):
    b = [v & 0x7F]
    v >>= 7
    while v:
        b.append(0x80 | (v & 0x7F))
        v >>= 7
    return bytes(reversed(b))


def track_to_midi(data):
    """Rough Standard MIDI File (format 1) of a track blob; every voice becomes one MIDI track/channel."""
    atoms, roles, starts = trackfmt.disassemble(data, "track", 0)
    by_off = {x.off: x for x in atoms}
    order = sorted(by_off)
    # token streams by start offset
    def stream(off):
        toks = []
        i = order.index(off)
        while True:
            at = by_off[order[i]]
            toks.append(at)
            if at.kind == "tok" and at.text == "end":
                return toks
            i += 1
    # follow the song list until the first jump
    pats = []
    pos = 0
    while pos in by_off:
        at = by_off[pos]
        if at.kind == "pattern":
            pats.append(at.ptr); pos += 2
        else:
            break
    tempo = [27]
    events = [[] for _ in range(8)]
    t0 = 0
    for pp in pats:
        ptrs = by_off[pp].ptr
        longest = 0
        for v in range(8):
            if not ptrs[v]:
                continue
            st = {"t": t0, "len": 1, "gate": 7, "vel": 15, "tr": 0, "vtr": 0, "base": 0}
            ev = events[v]

            def run(off, depth=0):
                for at in stream(off):
                    tx = at.text
                    if at.kind != "tok":
                        continue
                    if isinstance(tx, tuple):                       # call
                        for _ in range(max(tx[1], 1)):
                            run(at.ptr, depth + 1)
                        continue
                    w = tx.split()
                    h = w[0]
                    if h == "end":
                        return
                    if h[0] == "L" and h[1:2].isdigit():
                        m = re.match(r"L(\d+)(?::G(\d)V(\d+))?", h)
                        st["len"] = int(m.group(1))
                        if m.group(2) is not None:
                            st["gate"], st["vel"] = int(m.group(2)), int(m.group(3))
                    elif trackfmt.note_byte(h) is not None:
                        key = 24 + (trackfmt.note_byte(h) - 0x80) + st["tr"] + st["vtr"]
                        dur = st["len"]
                        on = st["t"]
                        off_t = on + max(1, dur * GATE[st["gate"]] // 256)
                        ev.append((on, 0x90, max(0, min(127, key)), max(1, VEL[st["vel"]] // 2)))
                        ev.append((off_t, 0x80, max(0, min(127, key)), 0))
                        st["t"] += dur
                    elif h in ("rest", "tie"):
                        st["t"] += st["len"]
                    elif re.match(r"perc\d+$", h):
                        key = 35 + int(h[4:])
                        ev.append((st["t"], 0x99, key, 90))
                        ev.append((st["t"] + max(1, st["len"] // 2), 0x89, key, 0))
                        st["t"] += st["len"]
                    elif h == "instrument":
                        ev.append((st["t"], 0xC0, int(w[1][1:], 16) & 0x7F, None))
                    elif h == "volume":
                        ev.append((st["t"], 0xB0, 7, int(w[1][1:], 16) >> 1))
                    elif h == "pan":
                        ev.append((st["t"], 0xB0, 10, min(127, int(w[1][1:], 16) * 127 // 20)))
                    elif h == "tempo":
                        tempo[0] = int(w[1][1:], 16)
                    elif h == "transpose":
                        st["tr"] = struct.unpack("b", bytes([int(w[1][1:], 16)]))[0]
                    elif h == "voicetranspose":
                        st["vtr"] = struct.unpack("b", bytes([int(w[1][1:], 16)]))[0]
            run(ptrs[v])
            longest = max(longest, st["t"] - t0)
        t0 += longest
    tick_rate = max(tempo[0], 1) * 500.0 / 256.0                      # song ticks per second (timer 0 = 2 ms, 8.8 accumulator)
    usec_q = int(1_000_000 * PPQ / tick_rate)
    chunks = []
    meta = _vlq(0) + b"\xFF\x51\x03" + usec_q.to_bytes(3, "big") + _vlq(0) + b"\xFF\x2F\x00"
    chunks.append(b"MTrk" + struct.pack(">I", len(meta)) + meta)
    for v in range(8):
        if not events[v]:
            continue
        evs = sorted(events[v], key=lambda e: (e[0], 0 if e[1] & 0xF0 == 0x80 else 1))
        body = b""
        last = 0
        for t, st_, d1, d2 in evs:
            ch = v if (st_ & 0x0F) != 9 else 9
            status = (st_ & 0xF0) | ch
            body += _vlq(t - last) + bytes([status, d1] + ([] if d2 is None else [d2]))
            last = t
        body += _vlq(0) + b"\xFF\x2F\x00"
        chunks.append(b"MTrk" + struct.pack(">I", len(body)) + body)
    return b"MThd" + struct.pack(">IHHH", 6, 1, len(chunks), PPQ) + b"".join(chunks)


def cmd_midi(a):
    out = Path(a.out)
    out.mkdir(parents=True, exist_ok=True)
    labels = a.labels or sorted(f.name[:-len(".track.txt")] for f in TRACKS.glob("*.track.txt"))
    for label in labels:
        data = trackfmt.assemble((TRACKS / (label + ".track.txt")).read_text())
        (out / (label + ".mid")).write_bytes(track_to_midi(data))
    print("wrote %d MIDI files to %s" % (len(labels), out))
    return 0


# ---------------------------------------------------------------------------
# SPC snapshots (derived format): the real driver is run on tools/audio/spcemu.py with the game's upload protocol
# ---------------------------------------------------------------------------
SPC_HEADER = b"SNES-SPC700 Sound File Data v0.30\x1a\x1a"
SPC_SIZE = 0x10200


def _sample_command(host, cmd, sid, entries, blobs):
    m = entries[sid]
    brr_bytes = blobs[m["label"]][:entries["_sizes"][m["label"]]]
    # the driver copies whole 3-byte chunks, so the 0-2 ROM bytes that follow the sample land in SPC RAM as well
    brr_bytes += entries["_next"].get(m["label"], b"")[:-len(brr_bytes) % 3]
    host.command(cmd, [(sid, sample_loop_offset(m) & 0xFF, sample_loop_offset(m) >> 8),
                       (m["adsr1"], m["adsr2"], m["gain"]), (m["tuning_int"], m["tuning_frac"], 0)], ack=4, data=brr_bytes)


def spc_boot_state(blobs, info):
    """Emulator + host after the boot sequence of the game (driver upload, mono/stereo, common samples, SFX block)."""
    import spcemu
    man, metas = info["man"], info["metas"]
    entries = {i: m for m in metas.values() for i in m["sample_ids"]}
    entries["_sizes"] = info["sizes"]
    entries["_next"] = {}
    for bank in json.loads(BANKS.read_text()).values():                  # the bytes after the last blob of a bank are padding
        order = bank["blobs"]
        entries["_next"].update({x: blobs[y] for x, y in zip(order, order[1:])})
    spc = spcemu.Spc()
    drv = blobs[DRIVER_LABEL]
    spc.ram[DRIVER_BASE:DRIVER_BASE + len(drv)] = drv
    spc.pc = DRIVER_BASE
    host = spcemu.Host(spc)
    host.command(0x0B, [(0, 0, 0)], ack=8)
    for sid in man["common_samples"]:
        if sid:
            _sample_command(host, 2, sid, entries, blobs)
    host.command(1, [], ack=4, data=info["sfx"])
    return spc, host, entries


def spc_for_track(state, blobs, info, track_id):
    import copy
    spc, host, entries = copy.deepcopy(state)
    host.spc = spc
    man = info["man"]
    t = man["tracks"][track_id]
    host.command(4, [(0, 0, 0)], ack=8)
    host.command(5, [], ack=4, data=blobs[t["blob"]])
    for sid in list(t["samples"]) + [6]:
        _sample_command(host, 3, sid, entries, blobs)
    host.command(8, [(1, 0x40, 0)], ack=8)
    return spc


def spc_for_sfx(state, blobs, info, sfx_id, voice=6):
    import copy
    spc, host, entries = copy.deepcopy(state)
    host.spc = spc
    sid = info["man"]["sfx_sample_ids"][sfx_id]
    if sid:
        _sample_command(host, 3, sid, entries, blobs)
    host.command(0x0A, [(sfx_id, voice, 0x0A)], ack=8)
    return spc


def _field(text, n):
    return text.encode("ascii", "replace")[:n].ljust(n, b"\0")


def write_spc(spc, title, game="Harvest Moon (SNES)", comment="", seconds=180, fade_ms=5000):
    """Serialise an emulator state as a v0.30 .spc file with an ID666 text tag."""
    ram = bytearray(spc.ram)
    for i in range(4):
        ram[0xF4 + i] = spc.cpu_in[i]
    ram[0xF2] = spc.dspaddr
    ram[0xF3] = spc.dsp[spc.dspaddr & 0x7F]
    ram[0xFD:0x100] = b"\0\0\0"
    h = bytearray(SPC_HEADER)
    h += bytes([26, 30])                                    # ID666 tag present, version minor 30
    h += struct.pack("<HBBBBB", spc.pc, spc.a, spc.x, spc.y, spc.get_psw(), spc.sp) + b"\0\0"
    tag = _field(title, 32) + _field(game, 32) + _field("audioconv", 16) + _field(comment, 32) + _field("", 11)
    tag += _field("%d" % seconds, 3) + _field("%d" % fade_ms, 5) + _field("", 32) + bytes([0, 0]) + bytes(45)
    h += tag
    assert len(h) == 0x100, len(h)
    return bytes(h) + bytes(ram) + bytes(spc.dsp) + bytes(64) + bytes(64)


def parse_spc(data):
    """-> dict(pc, a, x, y, psw, sp, ram, dsp, title, game) of a v0.30 .spc file (validates the layout)."""
    if len(data) < SPC_SIZE or data[:27] != SPC_HEADER[:27] or data[0x21:0x23] != b"\x1a\x1a":
        raise ConvError("not an SPC file")
    pc, a, x, y, psw, sp = struct.unpack_from("<HBBBBB", data, 0x25)
    return dict(pc=pc, a=a, x=x, y=y, psw=psw, sp=sp, ram=data[0x100:0x10100], dsp=data[0x10100:0x10180],
                title=data[0x2E:0x4E].rstrip(b"\0").decode("ascii"), game=data[0x4E:0x6E].rstrip(b"\0").decode("ascii"))


def resolve_sfx(ref, names):
    """Effect id from a name (Sfx_MenuCursor), a decimal id or a $hex/0x id."""
    if ref in names:
        return names.index(ref)
    try:
        n = int(ref.replace("$", "0x"), 0)
    except ValueError:
        raise ConvError("unknown SFX %r (names: audio.json sfx_names)" % ref)
    if not 0 <= n < len(names):
        raise ConvError("SFX id out of range: %r" % ref)
    return n


def cmd_spc(a):
    blobs, _tables, info = build_all()
    man = info["man"]
    out = Path(a.out)
    out.mkdir(parents=True, exist_ok=True)
    state = spc_boot_state(blobs, info)
    jobs = []
    if a.sfx is not None:
        names = sfx_names(man)
        for ref in a.sfx:
            n = resolve_sfx(ref, names)
            jobs.append((names[n], "%s (SFX id $%02X)" % (names[n], n), lambda n=n: spc_for_sfx(state, blobs, info, n)))
    else:
        by_label = {}
        for t in man["tracks"]:
            by_label[t["blob"]] = t["id"]                    # the highest id with that blob (id 1 for Spring: the one played)
        labels = sorted(by_label) if a.all or not a.track else a.track
        for lab in labels:
            if lab not in by_label:
                raise ConvError("unknown track %s" % lab)
            tid = by_label[lab]
            jobs.append((lab, "%s (track id %d)" % (lab, tid), lambda tid=tid: spc_for_track(state, blobs, info, tid)))
    for name, title, fn in jobs:
        spc = fn()
        (out / (name + ".spc")).write_bytes(write_spc(spc, title, comment="generated by tools/audio/audioconv.py"))
    print("wrote %d SPC files to %s" % (len(jobs), out))
    return 0


SPC_REGIONS = [(0x0000, 0x00F0, "direct page"), (0x0100, 0x0200, "stack / voice scratch"), (0x0200, 0x0400, "per-voice tables"),
               (0x0400, 0x0500, "instrument records"), (0x0500, 0x14D6, "driver"), (0x1500, 0x1600, "sample directory"),
               (0x1600, 0x19F4, "SFX block"), (0x19F4, 0x1FF4, "track data"), (0x1FF4, 0x65F4, "common samples"),
               (0x65F4, 0xD700, "track samples"), (0xD700, 0x10000, "echo buffer / unused")]


def cmd_spcdiff(a):
    """Compare two .spc files (e.g. one dumped from an emulator vs one generated here) region by region."""
    x = parse_spc(Path(a.a).read_bytes())
    y = parse_spc(Path(a.b).read_bytes())
    print("PC %04X/%04X  A %02X/%02X  X %02X/%02X  Y %02X/%02X  PSW %02X/%02X  SP %02X/%02X" % (
        x["pc"], y["pc"], x["a"], y["a"], x["x"], y["x"], x["y"], y["y"], x["psw"], y["psw"], x["sp"], y["sp"]))
    for lo, hi, name in SPC_REGIONS:
        d = [i for i in range(lo, hi) if x["ram"][i] != y["ram"][i]]
        runs = []
        for i in d:
            if runs and i == runs[-1][1] + 1:
                runs[-1][1] = i
            else:
                runs.append([i, i])
        print("%-24s $%04X-$%04X  %6d differing bytes%s" % (name, lo, hi - 1, len(d), "  e.g. " + ", ".join("$%04X-$%04X" % tuple(r) for r in runs[:4]) if d else ""))
    dd = [i for i in range(128) if x["dsp"][i] != y["dsp"][i]]
    print("DSP registers differing: %s" % (", ".join("$%02X" % i for i in dd) or "none"))
    return 0


def _spc_track_labels(man):
    by = {}
    for t in man["tracks"]:
        by[t["blob"]] = t["id"]
    return by


def _dir_slots(ram):
    """Sample directory slots that are in use: [(slot, start, loop)] (start 0 = empty)."""
    return [(i,) + struct.unpack_from("<HH", ram, 0x1500 + 4 * i) for i in range(64) if struct.unpack_from("<H", ram, 0x1500 + 4 * i)[0]]


def spc_match(user, gen_by_label):
    """Identify the song of a foreign .spc by RAM content and compare it with the generated snapshot of that song.
    Static data must be identical; runtime state (direct page, voice tables, echo buffer, DSP, stale slots) is reported only."""
    r = user["ram"]
    best = None
    for lab, g in gen_by_label.items():
        blob = g["blob"]
        n = sum(1 for i, b in enumerate(blob) if r[0x19F4 + i] == b)
        if n == len(blob) and (best is None or len(blob) > len(gen_by_label[best]["blob"])):
            best = lab
    res = dict(label=best)
    if best is None:
        return res
    g = gen_by_label[best]
    gr = g["ram"]
    res["driver_diff"] = [i for i in range(0x500, 0x14B8) if r[i] != gr[i]]       # $14B8.. are runtime slot ids
    res["sfx_diff"] = sum(1 for i in range(0x1600, 0x19F4) if r[i] != gr[i])
    res["dir_diff"] = [s for s in _dir_slots(gr) if (s[0],) + struct.unpack_from("<HH", r, 0x1500 + 4 * s[0]) != s]
    res["extra_slots"] = [s[0] for s in _dir_slots(r) if s[0] not in [t[0] for t in _dir_slots(gr)]]
    end = max([s[1] for s in _dir_slots(gr)] + [0x65F4])
    last = max(_dir_slots(gr), key=lambda s: s[1])[1]
    res["sample_diff"] = sum(1 for i in range(0x1FF4, last) if r[i] != gr[i])
    res["echo"] = tuple(user["dsp"][k] for k in (0x6D, 0x7D, 0x6C))
    return res


def cmd_spcmatch(a):
    """Match foreign .spc dumps (e.g. emulator rips) to our songs by RAM content and report static-data agreement."""
    blobs, _t, info = build_all()
    man = info["man"]
    state = spc_boot_state(blobs, info)
    gens = {}
    for lab, tid in _spc_track_labels(man).items():
        s = spc_for_track(state, blobs, info, tid)
        data = write_spc(s, lab)
        g = parse_spc(data)
        g["blob"] = blobs[lab]
        gens[lab] = g
    files = []
    for p in a.paths:
        p = Path(p)
        files += sorted(p.glob("*.spc")) if p.is_dir() else [p]
    bad = 0
    for f in files:
        u = parse_spc(f.read_bytes())
        m = spc_match(u, gens)
        if m["label"] is None:
            print("%-28s NO MATCH" % f.name)
            bad += 1
            continue
        ok = not m["driver_diff"] and not m["sfx_diff"] and not m["dir_diff"] and not m["sample_diff"]
        bad += not ok
        print("%-28s %-30s driver:%d sfx:%d dir:%d samples:%d stale-slots:%s ESA/EDL/FLG:%s %s" % (
            f.name, m["label"], len(m["driver_diff"]), m["sfx_diff"], len(m["dir_diff"]), m["sample_diff"],
            m["extra_slots"] or "-", "/".join("%02X" % x for x in m["echo"]), "OK" if ok else "DIFF"))
    return 1 if bad else 0


def cmd_render(a):
    import shutil
    import subprocess
    ff = shutil.which("ffmpeg")
    if not ff:
        raise ConvError("ffmpeg not found (needs a build with libgme); alternatives are listed in docs/formats/audio-sources.md")
    out = Path(a.out)
    out.mkdir(parents=True, exist_ok=True)
    src = Path(a.spc)
    files = sorted(src.glob("*.spc")) if src.is_dir() else [src]
    for f in files:
        dst = out / (f.stem + "." + a.format)
        cmd = [ff, "-v", "error", "-y", "-i", str(f), "-t", str(a.seconds)]
        if a.format == "mp3":
            cmd += ["-codec:a", "libmp3lame", "-q:a", "4"]
        r = subprocess.run(cmd + [str(dst)], capture_output=True, text=True)
        if r.returncode:
            raise ConvError("ffmpeg failed for %s: %s" % (f.name, r.stderr.strip()[:200]))
    print("rendered %d file(s) to %s" % (len(files), out))
    return 0


def main(argv=None):
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    sub = ap.add_subparsers(dest="cmd", required=True)
    s = sub.add_parser("build"); s.add_argument("-q", "--quiet", action="store_true"); s.set_defaults(fn=cmd_build)
    s = sub.add_parser("check"); s.add_argument("-v", "--verbose", action="store_true"); s.set_defaults(fn=cmd_check)
    s = sub.add_parser("midi"); s.add_argument("--out", default="build/midi"); s.add_argument("labels", nargs="*"); s.set_defaults(fn=cmd_midi)
    s = sub.add_parser("wav"); s.add_argument("--out", default="build/wav"); s.set_defaults(fn=cmd_wav)
    s = sub.add_parser("spc"); s.add_argument("--out", default="build/spc"); s.add_argument("--track", action="append", metavar="LABEL")
    s.add_argument("--all", action="store_true"); s.add_argument("--sfx", action="append", metavar="NAME|ID"); s.set_defaults(fn=cmd_spc)
    s = sub.add_parser("spcdiff"); s.add_argument("a"); s.add_argument("b"); s.set_defaults(fn=cmd_spcdiff)
    s = sub.add_parser("spcmatch"); s.add_argument("paths", nargs="+", help=".spc files or directories (foreign dumps, never committed)"); s.set_defaults(fn=cmd_spcmatch)
    s = sub.add_parser("render"); s.add_argument("spc", help=".spc file or directory"); s.add_argument("--out", default="build/render")
    s.add_argument("--format", choices=["wav", "mp3"], default="wav"); s.add_argument("--seconds", type=int, default=60); s.set_defaults(fn=cmd_render)
    a = ap.parse_args(argv)
    try:
        return a.fn(a) or 0
    except (ConvError, trackfmt.FormatError, spcasm.AsmError) as e:
        print("audioconv: %s" % e, file=sys.stderr)
        return 1


if __name__ == "__main__":
    sys.exit(main())
