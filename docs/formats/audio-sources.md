# Audio sources (samples, songs, SFX, sound driver)

All audio of the game is stored as **editable sources** under `assets/audio/`. The binary blobs that the assembler
`incbin`s (`assets/audio/<label>.bin`) and the 65816-side tables (`build/gen/audio/audio_tables.inc`) are **generated** and
git-ignored; `python3 tools/build_assets.py` (run by `tools/build.py`) rebuilds them with
`python3 tools/audio/audioconv.py build`. The result is byte-for-byte the audio data of the original ROM (the ROM hash check
in CI proves it).

```
assets/audio/
  audio.json                         track table (id -> blob + sample ids), SFX sample ids, common sample list
  samples/<label>.wav + <label>.json 39 BRR samples: 16-bit mono PCM + table fields / loop / encoder overrides
  tracks/<label>.track.txt           25 songs as N-SPC style text
  sfx/sfx.sfx.txt                    the SFX block (50 sound effects) uploaded to SPC RAM $1600
  driver/sAudioSpcDriver.spc.asm     the SPC700 sound engine as assembler source (4054 bytes)
  <label>.bin                        generated, git-ignored
  banks.json                         bank layout: ORG + blob labels in ROM order
build/gen/audio/bank_XX.asm          generated bank wrappers (label + incbin + fill align $8000), included by src/main.asm
build/gen/audio/audio_tables.inc     generated, git-ignored (included by src/code/bank_83/audio.asm)
```

Tools: `tools/audio/audioconv.py` (commands below), `brr.py` (BRR codec), `trackfmt.py` (song text format), `spcasm.py`
(SPC700 assembler/disassembler), `spc700.py` (disassembler used for analysis), `audio_map.py` (consistency checks).
Tests: `tests/test_audio_convert.py`, `tests/test_spc700.py`.

| Command | Purpose |
|---|---|
| `audioconv.py build` | sources -> `assets/audio/*.bin` + `audio_tables.inc` (only writes files whose content changed) |
| `audioconv.py check` | validates every source: WAV <-> BRR is lossless, text round trips, driver reassembles, limits |
| `audioconv.py midi [--out DIR] [labels]` | export songs as Standard MIDI Files (viewing / rough editing, **export only**) |
| `audioconv.py wav [--out DIR]` | decode the generated sample blobs to WAV files (for listening) |
| `audioconv.py spc [--track LABEL ...\|--all\|--sfx N ...] [--out DIR]` | generated `.spc` snapshots (default `build/spc/`, git-ignored): see section 7 |
| `audioconv.py render SPC_OR_DIR [--format wav\|mp3] [--seconds N] [--out DIR]` | `.spc` -> WAV/MP3 with `ffmpeg` (needs libgme), default `build/render/` |
| `audioconv.py spcdiff A.spc B.spc` | compare two snapshots per memory region (generated vs. an emulator dump) |
| `audioconv.py extract` | one-time conversion of the original blobs into the sources (already done; kept for reference) |

## 1. Samples (`samples/<label>.wav` + `.json`)

The label is the blob label of `assets/audio/banks.json` (`sAudioSample_Id07` holds sample id 7; `Id00` serves the ids 0 and 1,
see `docs/audio.md` section 7). Every file pair describes one BRR stream.

**WAV**: mono, 16-bit PCM, number of samples = 16 x number of BRR blocks. The values are exactly what the S-DSP outputs for the
BRR data (before gaussian interpolation, envelope and volume), i.e. even numbers in the 16-bit range; the nominal rate is
32000 Hz. The *real* pitch depends on the sample-table tuning and on the notes the songs play; the rate stored in the WAV header
is informational only. A `smpl` chunk with the loop (start sample, last sample) is written for editors that display it; the
sidecar is authoritative.

**JSON sidecar** (the fields of the 10-byte `sAudioSampleData` entry plus build parameters):

| Key | Meaning |
|---|---|
| `label`, `sample_ids` | blob label and the sample-table ids that use it |
| `loop` | the BRR stream loops (loop flag on every block, as the original encoder wrote it) |
| `loop_start` | loop start in samples, **multiple of 16** (BRR block boundary); the table field is `loop_start/16*9` bytes |
| `unused_loop_offset` | one-shot samples only: the raw table field (ignored by the DSP, kept for bit-exactness) |
| `adsr1`, `adsr2`, `gain` | DSP envelope registers of the instrument record (the game uses ADSR1 `$FF`/`$86`, GAIN `$B8`) |
| `tuning_int`, `tuning_frac` | pitch multiplier (integer part, fraction/256) the engine applies to its pitch table |
| `pad_byte` | the BRR data is padded with this byte to a multiple of 16 bytes (`aAudioSampleSize`); the originals use `$FF` |
| `append` | `Id39` only: the SFX block (`sfx/sfx.sfx.txt`) is stored behind the BRR data of this blob (first 1008 bytes) |
| `canon` | encoder tie-break rule, see below |
| `overrides` | per-block exceptions to the canonical encoding, see below |

### BRR <-> WAV round trip (bit exact)

`tools/audio/brr.py` implements the S-DSP decoder exactly (range/filter, 15-bit clamp and wrap, filter history that is not reset at
the loop point). Decoding the original data therefore gives the WAV, and **encoding an unchanged WAV gives the original bytes**:

1. For every block the encoder looks for an *exact* representation (a range/filter/nibble choice that decodes to the target
   samples). A decoded game block always has one. Several can exist (silence, small signals, range 0 where two nibbles give the
   same value), so the choice must be canonical: `canon` names the search order (`f` = filter-major or `r` = range-major,
   filter ascending/descending, range ascending/descending; e.g. `ff+r-` = filter ascending, range descending), picked per sample
   at extraction time to need the fewest exceptions. Equal-valued nibbles are tried in the order 0, -1, 1, -2, 2, ...
2. The original encoder did not follow any rule we can reproduce (it chose by the quantisation error against its unknown
   input), so 664 of the 17869 blocks are *non-canonical*. Their choice is stored in `overrides` as `"block": "range filter mask"`
   (mask bit i = take the second of two equal nibbles for sample i) or `"block": "raw:<9 bytes hex>"` for the four range-13 blocks.
   An override is applied only while the block still decodes **exactly** to the WAV; if you edited that part of the WAV the stale
   override is silently ignored.
3. Flags: loop samples get the loop flag on every block and the end flag on the last block; one-shots only the end flag.

### Editing or replacing a sample

Replace the WAV (keep the file name) and edit the JSON if needed, then run `python3 tools/build.py`.

* Any integer PCM WAV (8/16/24/32 bit, mono or stereo - stereo is averaged) is accepted; the sample rate is ignored, so
  **resample to the intended playback rate yourself**. The engine plays the data at the pitch given by the song notes and
  `tuning_int.tuning_frac`, so a sample that is twice as long at the same rate sounds an octave lower in the same song.
* The length is padded with silence to a multiple of 16 samples. Samples longer than the original need ROM space: the audio banks
  end with `fill align $8000`, so growth works until a bank (32 KiB) is full, and a sample must **not cross a bank boundary**
  (the build fails if a bank overflows). The SPC RAM budget is checked by `python3 tools/audio/audio_map.py --check`
  (common set < 17920 bytes, the biggest track sample set below the echo buffer at `$D700`).
* A looping sample needs `loop: true` and `loop_start` (multiple of 16 samples, inside the sample); the loop runs from there to
  the end of the WAV. Make the waveform at the end continue smoothly into `loop_start`. Edited blocks that cannot be coded exactly
  are encoded lossily (smallest error, closed loop); the block at `loop_start` is then forced to filter 0 so the loop is
  seamless regardless of the history. Blocks that are still unchanged keep their exact original coding.
* After a large edit you may drop stale `overrides` and let the tool choose: delete the entries (or the whole object).
* Check the result with `python3 tools/audio/audioconv.py check` (it reports blocks that had to be encoded lossily).
* `aAudioSampleSize` and the whole sample table are regenerated from the sidecars; nothing else has to be edited.

## 2. Songs (`tracks/<label>.track.txt`)

A lossless text form of the N-SPC style track blob (`docs/audio.md` section 8). Pointers are labels, so inserting or deleting
notes just works: the blob is re-assembled and `aAudioTrackDataSizeTable` is regenerated from its size. A track must fit the
`$600`-byte area at SPC `$19F4` (the build checks it).

```
songlist:                     ; song list: words
    pattern pat0              ;   pointer to a pattern
    jump songlist 255         ;   $80cc + pointer: jump (cc times, 255 = forever)
    songend                   ;   $8000
pat0:
    voices pat0_v0 pat0_v1 - - - - - -    ; the eight voice-stream pointers, `-` = unused
pat0_v0:
    percbase $0B              ; stream commands (names: table below), parameters in hex
    instrument $03
    L48:G7V15 B5 L24 C6       ; length 48 + gate 7 / velocity 15, then notes
    call sub0 2               ; subroutine call (label, repeat count)
    end                       ; $00
sub0:
    L24 C6 B5 C6 rest tie perc3 end
    db $12 $34                ; unknown / unreferenced bytes are kept as they are
```

* `L<n>` sets the note length in ticks (1-127); `L<n>:G<g>V<v>` adds the optional gate (0-7) and velocity (0-15) byte.
  The next notes use the length until the next `L`. Notes are `C1`..`B6` (`C1` = `$80`, `#` for sharps), `tie` = `$C8`,
  `rest` = `$C9`, `perc<n>` = `$CA+n` (n = 0-21).
* Commands (byte, parameters): `instrument` E0 (1), `pan` E1 (1), `panfade` E2 (2), `vibrato` E3 (3), `vibratooff` E4,
  `mastervol` E5 (1), `mastervolfade` E6 (2), `tempo` E7 (1), `tempofade` E8 (2), `transpose` E9 (1), `voicetranspose` EA (1),
  `tremolo` EB (3), `tremolooff` EC, `volume` ED (1), `volumefade` EE (2), `call` EF (label, count), `vibratofade` F0 (1),
  `pitchenvto` F1 (3), `pitchenvfrom` F2 (3), `pitchenvoff` F3, `finetune` F4 (1), `echo` F5 (3), `echooff` F6,
  `echoparams` F7 (3), `echofade` F8 (3), `slide` F9 (3), `percbase` FA (1). Parameters are bytes (`$xx` or decimal).
  The names are descriptive labels for the N-SPC family commands; the parameter *counts* are confirmed by the driver's
  table at `$141E` (`audioconv.py check` compares them), the meaning of the individual parameters is the one described in
  `docs/audio.md` (the "[I]" entries there are inferred).
* `instrument n` selects the sample **slot** `n` = position in the track's sample list (`audio.json` `tracks[].samples`);
  in the SFX block it is a sample **id** instead.
* A trailing `; t=NNN` comment is the tick position of the first note on the line (only until the first `call` of a stream).
* Every stream must be terminated with `end` (`$00`). The engine starts the next song-list entry when a voice reaches it.
* Changing which samples a track uses: edit `samples` of the track entries in `assets/audio/audio.json` (up to 11 ids, order =
  slot numbers). The track table is regenerated into `audio_tables.inc`. Remember that the 65816 code loads exactly these
  samples plus sample `$06` (see `docs/audio.md` section 3.2).

`audioconv.py midi` exports every track to `build/midi/<label>.mid` for listening in a DAW: one MIDI track per voice, slot numbers
as program changes, note length x gate as duration, subroutines expanded, the song list followed until the first jump.
Tempo (`tempo` x 500/256 ticks per second, 48 ticks per quarter) and the gate/velocity tables are approximations; the text
format is the source of truth and nothing is read back from MIDI.

## 3. SFX block (`sfx/sfx.sfx.txt`)

The block uploaded by command 1 to SPC `$1600` ($3F2 bytes): 50 `ptr` words (`sfx_00`..`sfx_49`) followed by the 50 streams, each
ending in `end` plus one spare `db $00`. The syntax is the track syntax, with absolute SPC addresses behind the labels
(`$1600` + offset). Differences: `instrument` takes a sample id, and `noise $xx` is the one-parameter `$DF` command.
The block lives in the tail of the `sAudioSample_Id39` blob; its length must stay `<= $3F4` bytes (the track area starts at `$19F4`),
and the 65816 upload size `$3F2` in `src/code/bank_83/audio.asm` has to match it (`audio_map.py --check` verifies the pairing).
Which sample each effect loads is `sfx_sample_ids` in `audio.json` (`aAudioSfxSampleIdTable`).

## 4. Sound driver (`driver/sAudioSpcDriver.spc.asm`)

The SPC700 program (loaded to `$0500`, 4054 bytes, entry at the first byte) is kept as an assembler listing in the syntax of
`tools/audio/spc700.py` plus labels: branch and call targets are `c_XXXX` (the original SPC address), referenced data `d_XXXX`.
Tables are `dw`/`db` data. `tools/audio/spcasm.py` assembles it (direct page vs absolute operands are spelled `$xx` / `!$xxxx`,
so the encoding is unambiguous) and reproduces the original bytes exactly. Names and comments are not part of the
reverse-engineered information yet; rename labels freely (they only have to stay unique). The size is checked against the
`$0FD6` bytes the boot code uploads (`src/code/bank_80/core.asm`).

## 5. Generated 65816 tables (`audio_tables.inc`)

`aAudioSampleSize`, `aAudioTrackDataSizeTable`, `sAudioData1_838F83` (track table), `sAudioSampleData`, `aAudioSfxSampleIdTable`
and `aAudioSampleLookupTable` used to be hand-written `dw`/`db` data in `src/code/bank_83/audio.asm`; they are now produced from
the sidecars and `audio.json` and included at the same place (same labels, same bytes). Things that stay in the code:
the number of table entries (26 tracks, 40 samples, 50 SFX), the SFX upload size `$3F2`, the driver upload size `$0FD6` and the
common sample ids' consumers. Adding a *new* track or sample id therefore needs code changes; replacing contents does not.

## 6. SPC snapshots for listening and interop (generated, never committed)

`python3 tools/audio/audioconv.py spc --all` writes one `.spc` file (v0.30, ID666 title/game tags from our labels, no foreign
data) per song into `build/spc/`; `--track sAudioTrack_Spring` selects songs, `--sfx 14` makes a snapshot that starts sound
effect 14. Any SPC player works (SPCPlay, foobar2000 + Game Music Emu, VLC, `ffmpeg`/`gme` based tools, snes_spc, emulators).
With an `ffmpeg` built with libgme (the default Linux builds are), `audioconv.py render build/spc --format mp3` makes listening
copies in `build/render/`.

How the snapshot is made: `tools/audio/spcemu.py` is a small SPC700 emulator (CPU, ports, timers, DSP register file). The
real driver from `driver/sAudioSpcDriver.spc.asm` is loaded at `$0500` and started; a host object plays the 65816 side of the
protocol of `docs/audio.md` section 4 with exactly the command sequence of the game: command `$0B` (stereo), command 2 for each
common sample, command 1 (SFX block), then per song command 4 (slot 0), command 5 (track data), command 3 for every sample of the
track plus sample `$06`, and command 8 (start, fade-in). The state is saved at the moment the start command is acknowledged,
so RAM (driver, sample directory, instrument records, SFX block, song, samples), the 128 DSP registers and PC/A/X/Y/PSW/SP all come
from the driver itself and playback begins at the start of the song. (A detail this exposed: the driver advances its sample
pointers by whole 3-byte chunks, so a sample whose size is not a multiple of 3 occupies one byte more than its size.)

The emulator has no audio output and is not cycle exact (only the timers advance); it is a state generator.
Correctness is checked in two ways: `tests/test_audio_convert.py` re-parses the generated file and compares driver, SFX block,
song and every sample in RAM with our sources, and (if available) renders it through libgme and requires sound; all 25 songs and
sample SFX render audibly. **Validation against real hardware state is still open**: when you have SPC dumps of the same songs from
an emulator, run `audioconv.py spcdiff theirs.spc ours.spc`; the regions that must match are the driver, SFX block, song data,
sample directory and samples, whereas direct-page and instrument-record bytes legitimately differ with the moment of the dump.

Optional comparison material (not part of the repository, never commit it): rips of the soundtrack (MP3/SPC collections on the
web), and SNES music tools such as the ones on snesmusic.org. They are third-party works and only useful to compare what you hear
with the output of `render`.

### Why SPC is derived, not the source

* An SPC is a **moment**: the 64 KiB SPC RAM, the DSP registers and the CPU registers at one instant of one playback. The ROM does not
  contain such an image; the 65816 uploads the driver, the SFX block, samples and the song in pieces. The song blob, the
  sample table, the track table, the size tables and the sample bytes in ROM cannot be recovered from a snapshot (samples are
  relocated and rounded to 3-byte chunks, tables live in 65816 code, only the pieces needed by one song are present, and run-time
  state is mixed into the same memory).
* The ROM must be rebuilt **byte for byte**; the sources (WAV + sidecar, song text, driver listing) map onto the ROM layout one to one,
  an SPC does not.
* Editing: a snapshot has no structure to edit (a song is just bytes in RAM), WAV/JSON and the song text do.
* Interop is still covered: the SPC (and, via ffmpeg, WAV/MP3) is produced on demand in one command, so any SPC tool can be used to
  listen to, compare or analyse the result. Treat it as an output, like the built ROM.

## 7. What is not source-level yet

* Nothing in the audio data is binary any more. The two things only documented by name are the semantics of several
  stream-command parameters (`docs/audio.md`, marked [I]) and the driver internals (labels are address based).
* BRR blocks use the canonical choice plus 664 stored exceptions; this is the price of reproducing a closed-source encoder
  bit for bit.
