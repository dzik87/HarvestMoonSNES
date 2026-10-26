"""Audio extraction: US ROM -> assets/audio/{samples,tracks,sfx,driver}/, audio.json.

Reads the 65816-side tables (sample sizes, track table, sample table, SFX sample ids, common samples) at the addresses of
defs/audio/layout.json, decodes the BRR samples to WAV + JSON sidecars (same canonical-rule / override search as the
original conversion), turns the song blobs and the SFX block into the text formats of tools/audio/trackfmt.py and
disassembles the SPC700 driver into the listing of tools/audio/spcasm.py.  Names (track blobs, effects) come from
defs/audio/names.json.  The result is exactly what `tools/audio/audioconv.py build` consumes (docs/formats/audio-sources.md).
"""
import re
import sys
from pathlib import Path

from . import Step, Context
from ._rom import Rom, load_json, parse_addr, write_text, write_bytes

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "audio"))
import audioconv  # noqa: E402
import audio_map  # noqa: E402
import spcasm  # noqa: E402
import trackfmt  # noqa: E402

SAMPLE_ENTRY = 10          # dw loop, db adsr1 adsr2 gain tune_int tune_frac, dl ptr
TRACK_ENTRY = 14           # dl ptr, 11 x sample id
SFX_COUNT = audioconv.SFX_COUNT
SFX_BASE = audioconv.SFX_BASE
DRIVER_BASE = audioconv.DRIVER_BASE
DRIVER_TABLES = audioconv.DRIVER_TABLES      # word tables the disassembler must treat as data (jump / handler / pitch tables)


def read_tables(rom: Rom, lay):
    t = {k: parse_addr(v) for k, v in lay["tables"].items()}
    n_samples = (t["track_size"] - t["sample_size"]) // 2
    n_tracks = (t["track_table"] - t["track_size"]) // 2
    if (t["sample_data"] - t["track_table"]) != n_tracks * TRACK_ENTRY or (t["sfx_sample_ids"] - t["sample_data"]) != n_samples * SAMPLE_ENTRY:
        raise ValueError("defs/audio/layout.json: table addresses are inconsistent")
    sizes = [rom.u16(t["sample_size"] + 2 * i) for i in range(n_samples)]
    tsizes = [rom.u16(t["track_size"] + 2 * i) for i in range(n_tracks)]
    tracks = []
    for i in range(n_tracks):
        a = t["track_table"] + i * TRACK_ENTRY
        tracks.append(dict(addr=rom.u24(a), samples=list(rom.read(a + 3, 11))))
    samples = []
    for i in range(n_samples):
        e = rom.read(t["sample_data"] + i * SAMPLE_ENTRY, SAMPLE_ENTRY)
        samples.append(dict(loop=e[0] | e[1] << 8, adsr1=e[2], adsr2=e[3], gain=e[4], tune_hi=e[5], tune_lo=e[6],
                            addr=e[7] | e[8] << 8 | e[9] << 16))
    sfx_ids = list(rom.read(t["sfx_sample_ids"], t["common_samples"] - t["sfx_sample_ids"]))
    common = list(rom.read(t["common_samples"], lay["common_samples_count"]))
    return sizes, tsizes, tracks, samples, sfx_ids, common


def run(ctx: Context):
    rom = Rom(ctx.rom_bytes("US"))
    out = ctx.assets / "audio"
    lay = load_json(ctx.defs / "audio" / "layout.json")
    names = load_json(ctx.defs / "audio" / "names.json")
    sizes, tsizes, tracks, samples, sfx_ids, common = read_tables(rom, lay)
    if len(names["tracks"]) != len(tracks) or len(names["sfx"]) != SFX_COUNT or len(sfx_ids) != SFX_COUNT:
        raise ValueError("defs/audio/names.json does not match the ROM tables (%d tracks, %d effects)" % (len(tracks), len(sfx_ids)))

    # --- SFX block (command 1 upload) and the sample blob it is stored behind
    sfx_rom = parse_addr(lay["sfx_block"]["rom"])
    sfx_block = rom.read(sfx_rom, lay["sfx_block"]["size"])
    sfx_tail = len(sfx_block.rstrip(b"\0"))

    # --- samples: one source per blob, several ids may share it
    by_addr = {}
    for i, s in enumerate(samples):
        by_addr.setdefault(s["addr"], []).append(i)
    for addr, ids in by_addr.items():
        e = samples[ids[0]]
        for j in ids[1:]:
            if samples[j] != e or sizes[j] != sizes[ids[0]]:
                raise ValueError("sample table entries %s share a pointer but differ" % ids)
    for addr, ids in sorted(by_addr.items(), key=lambda kv: kv[1][0]):
        label = "sAudioSample_Id%02d" % ids[0]
        size = sizes[ids[0]]
        data = rom.read(addr, size)
        tail = sfx_tail if addr + size == sfx_rom else 0
        if tail:
            data += sfx_block[:tail]
        meta, pcm = audioconv.extract_sample(label, ids, samples[ids[0]], data, size, tail)
        write_bytes(out / "samples" / (label + ".wav"), audioconv.wav_bytes(meta, pcm))
        write_text(out / "samples" / (label + ".json"), audioconv.dump_sample_json(meta))

    # --- SFX streams
    text = trackfmt.to_text(sfx_block, [
        "SFX block uploaded to SPC $%04X by command 1 (%d bytes): %d stream pointers, then the streams." % (SFX_BASE, len(sfx_block), SFX_COUNT),
        "Streams use the music stream syntax; `instrument` takes a sample id here and `noise` replaces perc21.",
        "Format: docs/formats/audio-sources.md (tools/audio/trackfmt.py)."], kind="sfx", base=SFX_BASE)
    parts = re.split(r"\n(?=sfx_\d\d:)", text)[1:]
    if len(parts) != SFX_COUNT:
        raise ValueError("SFX block: %d streams found, expected %d" % (len(parts), SFX_COUNT))
    for i, part in enumerate(parts):
        body = part.split("\n", 1)[1].rstrip("\n")
        write_text(out / "sfx" / (names["sfx"][i] + ".sfx.txt"),
                   "; SFX id $%02X (%d). Stream body only; the pointer table and the label come from "
                   "assets/audio/audio.json (sfx_names).\n%s\n" % (i, i, body))

    # --- songs
    done = set()
    for i, t in enumerate(tracks):
        label = names["tracks"][i]
        if label in done:
            continue
        done.add(label)
        blob = rom.read(t["addr"], tsizes[i])
        write_text(out / "tracks" / (label + ".track.txt"), trackfmt.to_text(blob, [
            "%s - song data (song list, patterns, voice streams); pointers are labels." % label,
            "Format: docs/formats/audio-sources.md (tools/audio/trackfmt.py)."], kind="track"))

    # --- manifest (names + the table values)
    man = {"sfx_names": list(names["sfx"]),
           "tracks": [{"id": i, "blob": names["tracks"][i], "samples": [x for x in t["samples"] if x]} for i, t in enumerate(tracks)],
           "sfx_sample_ids": sfx_ids, "common_samples": common}
    write_text(out / "audio.json", audioconv.dump_manifest(man))

    # --- SPC700 driver listing
    drv = lay["driver"]
    blob = rom.read(parse_addr(drv["rom"]), drv["size"])
    eng = audio_map.Engine(blob)
    roots = [DRIVER_BASE] + eng.handler_table() + eng.cmd_jump_table()
    src = spcasm.to_source(blob, DRIVER_BASE, roots, DRIVER_TABLES, [
        "; Harvest Moon (SNES) SPC700 sound driver, N-SPC family, loaded to SPC RAM $0500 by the boot upload (4054 bytes).",
        "; Assembled by tools/audio/spcasm.py (syntax = tools/audio/spc700.py listing syntax + labels). Analysis: docs/audio.md.",
        "; Tables: command jump table $1053 (13 words), stream command handlers $13E0 (27 words), parameter counts $141E,",
        ";         pitch table $143D, pan table $1457, FIR sets $146C, gate/velocity tables $14A0/$14A8, slot ids $14B8.",
        ""])
    write_text(out / "driver" / "sAudioSpcDriver.spc.asm", src)


STEPS = [Step("audio", run, ["US"], [], "BRR samples (WAV+JSON), songs, SFX streams, SPC700 driver listing, audio.json")]
