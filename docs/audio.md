# Audio system (banks $AD-$B2, SPC700 / S-DSP)

How the game talks to the SNES audio unit, what lives in banks $AD-$B2, and how the SPC700 side works.
US ROM only; the other regions were not compared.

Evidence tags used throughout:

- **[C] confirmed** - read directly from the 65816 sources and/or from the disassembled SPC700 engine
  (`tools/audio/spc700.py`), or verified by a script (`tools/audio/audio_map.py --check`).
- **[I] inferred** - a plausible interpretation that fits the code and data but was not proven by running it
  (no emulator/trace was used for any of this).

Everything below was derived statically. Nothing was run on an emulator.

Editable sources: the blobs analysed here (`assets/audio/<label>.bin`) are **generated**; the committed sources are WAV/JSON
samples, text songs, a text SFX block and an SPC700 assembler listing of the driver. See
[`formats/audio-sources.md`](formats/audio-sources.md) (workflow for modders) and `tools/audio/audioconv.py`.

## 1. Overview

- Banks $AD-$B2 contain **only APU data**: one SPC700 program (the sound engine), 25 song/track blobs (26 table entries), 39 BRR
  sample blobs (40 table entries) and one SFX block that is stored inside the tail of the last sample blob. [C]
- The sound engine is a **Nintendo "N-SPC"-style driver** (the family used by Super Mario World, A Link to the Past,
  ...): same command bytes `$E0-$FA` with the same parameter counts, the same 21-entry pan table, the same
  13-entry pitch table (`$085F ... $10BE`), 6-byte instrument records and the same song-list /
  pattern / voice-stream structure. The family resemblance is [I]; every fact about *this* build below is [C].
- The ROM does **not** contain a ready-made SPC image. At boot the 65816 uploads the engine with the standard IPL
  protocol, then talks to it through a custom 4-port command protocol; samples, instrument records, the SFX block
  and the current song are uploaded on demand. [C]
- Because the asset labels are generated from the ROM layout, most of them are named `sAudioTrack_*` although only
  25 of the 65 blobs are tracks; see the table in section 2 for the real role of each one.

## 2. ROM layout of the audio blobs

Generated with `python tools/audio/audio_map.py` (Markdown output). Addresses are computed from the order and sizes of
the `incbin` lines in the generated `build/gen/audio/bank_*.asm` (layout: `assets/audio/banks.json`); sizes from the generated `assets/audio/*.bin` (run
`python tools/build_assets.py` first; the tables of section 3/7 come from the generated `build/gen/audio/audio_tables.inc`).
There are 65 blobs (not 71). Every blob is referenced from code, none is unused. [C]

| Label | ROM | Size | Role | Details |
|---|---|---:|---|---|
| `sAudioSpcDriver` | $AD:8000 | 4054 ($FD6) | SPC700 engine/driver | boot upload (IPL protocol) of $0FD6 bytes to SPC $0500, then execution starts there |
| `sAudioTrack_Spring` | $AD:8FD6 | 748 ($2EC) | track data | track id 0/1; cmd 5 -> SPC $19F4; sample ids $07,$03,$01,$0C,$05,$26,$24 |
| `sAudioTrack_Winter` | $AD:92C2 | 694 ($2B6) | track data | track id 4; cmd 5 -> SPC $19F4; sample ids $03,$07,$01 |
| `sAudioTrack_TrollsCave` | $AD:9578 | 754 ($2F2) | track data | track id 15; cmd 5 -> SPC $19F4; sample ids $05,$0B,$01,$08 |
| `sAudioTrack_StarNightFestival` | $AD:986A | 573 ($23D) | track data | track id 14; cmd 5 -> SPC $19F4; sample ids $05 |
| `sAudioTrack_Town` | $AD:9AA7 | 1091 ($443) | track data | track id 5; cmd 5 -> SPC $19F4; sample ids $05,$01,$07 |
| `sAudioTrack_BadEnding` | $AD:9EEA | 275 ($113) | track data | track id 17; cmd 5 -> SPC $19F4; sample ids $05,$03,$07 |
| `sAudioTrack_HarvestFestival` | $AD:9FFD | 939 ($3AB) | track data | track id 3; cmd 5 -> SPC $19F4; sample ids $03,$07,$01,$16,$05 |
| `sAudioTrack_Funeral` | $AD:A3A8 | 465 ($1D1) | track data | track id 12; cmd 5 -> SPC $19F4; sample ids $05,$07,$01 |
| `sAudioTrack_Ending` | $AD:A579 | 1077 ($435) | track data | track id 16; cmd 5 -> SPC $19F4; sample ids $05,$01,$0C |
| `sAudioTrack_Church` | $AD:A9AE | 608 ($260) | track data | track id 9; cmd 5 -> SPC $19F4; sample ids $02 |
| `sAudioTrack_Mountain` | $AD:AC0E | 921 ($399) | track data | track id 6; cmd 5 -> SPC $19F4; sample ids $03,$07,$01 |
| `sAudioTrack_Fall` | $AD:AFA7 | 685 ($2AD) | track data | track id 7; cmd 5 -> SPC $19F4; sample ids $01,$04,$0C,$08 |
| `sAudioTrack_Dance` | $AD:B254 | 502 ($1F6) | track data | track id 8; cmd 5 -> SPC $19F4; sample ids $01,$07,$16 |
| `sAudioTrack_Summer` | $AD:B44A | 626 ($272) | track data | track id 2; cmd 5 -> SPC $19F4; sample ids $01,$05 |
| `sAudioTrack_EggFestival` | $AD:B6BC | 659 ($293) | track data | track id 13; cmd 5 -> SPC $19F4; sample ids $05,$01,$08 |
| `sAudioTrack_Opening` | $AD:B94F | 1207 ($4B7) | track data | track id 18; cmd 5 -> SPC $19F4; sample ids $04,$03,$07,$0B |
| `sAudioTrack_NamingScreen` | $AD:BE06 | 410 ($19A) | track data | track id 10; cmd 5 -> SPC $19F4; sample ids $05,$07 |
| `sAudioTrack_Title` | $AD:BFA0 | 398 ($18E) | track data | track id 11; cmd 5 -> SPC $19F4; sample ids $05,$01,$07 |
| `sAudioTrack_Rain` | $AD:C12E | 122 ($7A) | track data | track id 19; cmd 5 -> SPC $19F4; sample ids $0D |
| `sAudioTrack_RainIndoors` | $AD:C1A8 | 128 ($80) | track data | track id 20; cmd 5 -> SPC $19F4; sample ids $0D |
| `sAudioTrack_WeatherFair` | $AD:C228 | 219 ($DB) | track data | track id 21; cmd 5 -> SPC $19F4; sample ids $15,$0D,$18 |
| `sAudioTrack_Hurricane` | $AD:C303 | 286 ($11E) | track data | track id 22; cmd 5 -> SPC $19F4; sample ids $10 |
| `sAudioTrack_Id23` | $AD:C421 | 176 ($B0) | track data | track id 23; cmd 5 -> SPC $19F4; sample ids $1D |
| `sAudioTrack_Bell` | $AD:C4D1 | 92 ($5C) | track data | track id 24; cmd 5 -> SPC $19F4; sample ids $1D |
| `sAudioTrack_WeatherCalm` | $AD:C52D | 188 ($BC) | track data | track id 25; cmd 5 -> SPC $19F4; sample ids $13,$15 |
| `sAudioSample_Id00` | $AD:C5E9 | 4288 ($10C0) | BRR sample | sample id 0/1; 476 BRR blocks, loop @block 48, ADSR FF E0, GAIN B8, tuning 5+20/256 |
| `sAudioSample_Id03` | $AD:D6A9 | 2992 ($BB0) | BRR sample | sample id 3; 331 BRR blocks, loop @block 167, ADSR FF E3, GAIN B8, tuning 1+E0/256 |
| `sAudioSample_Id04` | $AD:E259 | 1920 ($780) | BRR sample | sample id 4; 212 BRR blocks, loop @block 206, ADSR FF EF, GAIN B8, tuning 5+F0/256 |
| `sAudioSample_Id05` | $AD:E9D9 | 3344 ($D10) | BRR sample | sample id 5; 371 BRR blocks, loop @block 226, ADSR FF EB, GAIN B8, tuning 3+E0/256 |
| `sAudioSample_Id06` | $AD:F6E9 | 64 ($40) | BRR sample (common) | sample id 6; 7 BRR blocks, loop @block 3, ADSR FF E0, GAIN B8, tuning 4+00/256 |
| `sAudioSample_Id13` | $AD:F729 | 1648 ($670) | BRR sample | sample id 13; 182 BRR blocks, loop @block 3, ADSR FF E0, GAIN B8, tuning 1+30/256 |
| `sAudioSample_Id02` | $AE:8000 | 12000 ($2EE0) | BRR sample | sample id 2; 1332 BRR blocks, loop @block 70, ADSR FF E0, GAIN B8, tuning 6+B0/256 |
| `sAudioSample_Id07` | $AE:AEE0 | 7984 ($1F30) | BRR sample | sample id 7; 887 BRR blocks, loop @block 172, ADSR FF E0, GAIN B8, tuning 5+A0/256 |
| `sAudioSample_Id08` | $AE:CE10 | 6480 ($1950) | BRR sample | sample id 8; 720 BRR blocks, no loop, ADSR FF E0, GAIN B8, tuning 5+A0/256 |
| `sAudioSample_Id10` | $AE:E760 | 720 ($2D0) | BRR sample (common) | sample id 10; 79 BRR blocks, loop @block 75, ADSR FF EE, GAIN B8, tuning 3+F0/256 |
| `sAudioSample_Id12` | $AE:EA30 | 832 ($340) | BRR sample | sample id 12; 91 BRR blocks, loop @block 57, ADSR FF E9, GAIN B8, tuning 1+E0/256 |
| `sAudioSample_Id14` | $AE:ED70 | 3488 ($DA0) | BRR sample | sample id 14; 387 BRR blocks, no loop, ADSR FF E0, GAIN B8, tuning 7+A0/256 |
| `sAudioSample_Id09` | $AF:8000 | 4864 ($1300) | BRR sample | sample id 9; 540 BRR blocks, loop @block 536, ADSR 86 EB, GAIN B8, tuning 4+00/256 |
| `sAudioSample_Id11` | $AF:9300 | 7040 ($1B80) | BRR sample | sample id 11; 782 BRR blocks, loop @block 390, ADSR FF E0, GAIN B8, tuning 3+50/256 |
| `sAudioSample_Id15` | $AF:AE80 | 4672 ($1240) | BRR sample | sample id 15; 519 BRR blocks, loop @block 3, ADSR FF E0, GAIN B8, tuning 0+D0/256 |
| `sAudioSample_Id16` | $AF:C0C0 | 4000 ($FA0) | BRR sample | sample id 16; 444 BRR blocks, loop @block 137, ADSR FF E0, GAIN B8, tuning 0+B0/256 |
| `sAudioSample_Id17` | $AF:D060 | 2000 ($7D0) | BRR sample | sample id 17; 222 BRR blocks, loop @block 3, ADSR FF E0, GAIN B8, tuning 0+50/256 |
| `sAudioSample_Id18` | $AF:D830 | 6976 ($1B40) | BRR sample | sample id 18; 775 BRR blocks, no loop, ADSR FF E0, GAIN B8, tuning 3+C0/256 |
| `sAudioSample_Id20` | $AF:F370 | 1712 ($6B0) | BRR sample | sample id 20; 190 BRR blocks, loop @block 3, ADSR FF E0, GAIN B8, tuning 0+90/256 |
| `sAudioSample_Id25` | $AF:FA20 | 1248 ($4E0) | BRR sample (common) | sample id 25; 138 BRR blocks, no loop, ADSR FF E0, GAIN B8, tuning 7+A0/256 |
| `sAudioSample_Id19` | $B0:8000 | 7984 ($1F30) | BRR sample | sample id 19; 886 BRR blocks, no loop, ADSR FF E0, GAIN B8, tuning 7+A0/256 |
| `sAudioSample_Id21` | $B0:9F30 | 6464 ($1940) | BRR sample (common) | sample id 21; 718 BRR blocks, no loop, ADSR FF E9, GAIN B8, tuning 1+E0/256 |
| `sAudioSample_Id22` | $B0:B870 | 1840 ($730) | BRR sample | sample id 22; 204 BRR blocks, no loop, ADSR FF E0, GAIN B8, tuning 7+A0/256 |
| `sAudioSample_Id23` | $B0:BFA0 | 992 ($3E0) | BRR sample (common) | sample id 23; 109 BRR blocks, no loop, ADSR FF E0, GAIN B8, tuning 4+20/256 |
| `sAudioSample_Id24` | $B0:C380 | 4992 ($1380) | BRR sample (common) | sample id 24; 553 BRR blocks, no loop, ADSR FF E0, GAIN B8, tuning 5+20/256 |
| `sAudioSample_Id26` | $B0:D700 | 3200 ($C80) | BRR sample (common) | sample id 26; 354 BRR blocks, no loop, ADSR FF E0, GAIN B8, tuning 7+A0/256 |
| `sAudioSample_Id27` | $B0:E380 | 3984 ($F90) | BRR sample | sample id 27; 442 BRR blocks, no loop, ADSR FF E0, GAIN B8, tuning 1+50/256 |
| `sAudioSample_Id28` | $B1:8000 | 3664 ($E50) | BRR sample | sample id 28; 406 BRR blocks, no loop, ADSR FF E0, GAIN B8, tuning 7+A0/256 |
| `sAudioSample_Id29` | $B1:8E50 | 15984 ($3E70) | BRR sample | sample id 29; 1775 BRR blocks, no loop, ADSR FF E0, GAIN B8, tuning 5+40/256 |
| `sAudioSample_Id30` | $B1:CCC0 | 3984 ($F90) | BRR sample | sample id 30; 442 BRR blocks, no loop, ADSR FF E0, GAIN B8, tuning 1+C0/256 |
| `sAudioSample_Id31` | $B1:DC50 | 2992 ($BB0) | BRR sample | sample id 31; 331 BRR blocks, no loop, ADSR FF E0, GAIN B8, tuning 1+10/256 |
| `sAudioSample_Id32` | $B1:E800 | 2992 ($BB0) | BRR sample | sample id 32; 331 BRR blocks, no loop, ADSR FF E0, GAIN B8, tuning 0+B0/256 |
| `sAudioSample_Id33` | $B1:F3B0 | 2992 ($BB0) | BRR sample | sample id 33; 331 BRR blocks, no loop, ADSR FF E0, GAIN B8, tuning 2+90/256 |
| `sAudioSample_Id36` | $B2:8000 | 4992 ($1380) | BRR sample | sample id 36; 553 BRR blocks, no loop, ADSR FF E0, GAIN B8, tuning 1+A0/256 |
| `sAudioSample_Id34` | $B2:9380 | 2992 ($BB0) | BRR sample | sample id 34; 332 BRR blocks, loop @block 2, ADSR FF E0, GAIN B8, tuning 0+20/256 |
| `sAudioSample_Id35` | $B2:9F30 | 1984 ($7C0) | BRR sample | sample id 35; 220 BRR blocks, no loop, ADSR FF E0, GAIN B8, tuning 1+10/256 |
| `sAudioSample_Id37` | $B2:A6F0 | 832 ($340) | BRR sample | sample id 37; 91 BRR blocks, loop @block 57, ADSR FF E9, GAIN B8, tuning 1+E0/256 |
| `sAudioSample_Id38` | $B2:AA30 | 1984 ($7C0) | BRR sample | sample id 38; 220 BRR blocks, no loop, ADSR FF E0, GAIN B8, tuning 1+00/256 |
| `sAudioSample_Id39` | $B2:B1F0 | 8992 ($2320) | BRR sample | sample id 39; 886 BRR blocks, no loop, ADSR FF E0, GAIN B8, tuning 1+E0/256 |
| (inside previous) | $B2:D120 | 1010 ($3F2) | SFX block (pointer table + streams) | cmd 1 -> SPC $1600; 50 SFX pointers; last 2 byte(s) come from padding after the label |

Role summary (counts verified by `audio_map.py --check`):

| Role | Blobs | Uploaded by |
|---|---:|---|
| SPC700 engine | 1 (`sAudioSpcDriver`) | `fAudio_UploadData` (boot, IPL protocol) |
| Track (song) data | 25 distinct (26 table entries, entry 0 duplicates entry 1) | command 5, `fAudio_UploadTrackData` |
| BRR samples | 39 distinct (40 table entries, entry 0 duplicates entry 1) | commands 2/3, `fAudio_LoadCommonSamples`, `fAudio_LoadTrackSamples`, `fAudio_LoadSfxSample` |
| SFX block | 1, at `$B2:D120`, `$3F2` bytes | command 1, `fAudio_UploadSpcDataBlock_B2D120` |

Two details worth knowing [C]:

- The SFX block starts at offset `$1F30` of `sAudioSample_Id39`, exactly after that blob's BRR data (sample `$27`, size
  `$1F30`). The block is `$3F2` bytes long but only `$3F0` (1008) bytes belong to the asset; the last two bytes are
  the zero fill that follows the label in `bank_B2.asm`. They are the terminators `00 00` of the last SFX stream.
- Every size in `aAudioSampleSize` is a multiple of 16: a BRR stream ends at the first block with the end flag and the
  remaining 0-15 bytes up to that size are padding (`brr_info()`).

## 3. The 65816 side (bank $83, `src/code/bank_83/audio.asm`)

APU ports: `APUIO0-3` = `$2140-$2143` on the 65816 side, `$F4-$F7` on the SPC700 side. Writing a port on one side is
read from the same-numbered port on the other side (each direction has its own latch). [C]

### 3.1 Boot sequence (`fCore` init, `src/code/bank_80/core.asm` $8085F0-$80860C) [C]

1. `ptrAudioData = $AD:8000`, `fAudio_UploadData` - uploads `$0FD6` bytes (the whole `sAudioSpcDriver` blob) to SPC RAM
   `$0500` and starts execution there.
2. `fAudio_SendCommand0B(A=0)` - command `$0B` with parameter 0 (stereo).
3. `fAudio_LoadCommonSamples` - sends command 2 once per non-zero id in `aAudioSampleLookupTable`
   (`$17,$18,$19,$1A,$15,$06,$0A`), i.e. seven samples.
4. `fAudio_UploadSpcDataBlock_B2D120` - command 1, `$3F2` bytes from `$B2:D120` (the SFX block).

### 3.2 Per-track sequence (`fAudio_LoadPendingTrack`, `fAudio_StartPendingTrack`) [C]

`strcAudio.trackId` (`$7E0110`) is the requested track, `strcAudio.trackIdCopy` (`$7E0117`) the one currently loaded.
When they differ (and `trackId` is neither 0 nor `$FF`):

1. fade the old track out (`fAudio_FadeOutOnTrackChangeSlow/Fast`: command 9, fade length `$40` or `$10`);
2. `fAudio_FreeSamplesFromSlot(0)` - command 4, slot 0 (waits until the SPC status bits 0 and 4 are clear first);
3. `fAudio_UploadTrackData` - command 5; size from `aAudioTrackDataSizeTable[trackId]`, source from the 14-byte entry
   `sAudioData1_838F83[trackId]` (`dl` pointer + 11 sample ids);
4. `fAudio_LoadTrackSamples` - command 3 per non-zero sample id of that entry, then **one extra** command 3 for sample
   `$06` (64 bytes) when the id list has trailing zeros, which is always the case (<= 7 ids of 11 are used);
5. `fAudio_StartPendingTrack` - command 8 with parameters (1, `$40`).

Sound effects (`fAudio_PlaySoundEffectAndWait`: A = SFX id, X = voice, Y = frames to wait):
`fAudio_PrepareSoundEffectSample` frees the previous SFX sample slot (command 4) and loads the SFX's own sample
(`aAudioSfxSampleIdTable[sfx]`, command 3) if that entry is non-zero; `fAudioSetRegister2to0A` then sends command `$0A`
with (sfx id, voice, pan = `$0A`). `fAudio_SendPlaySfxCommand` silently drops the request when SPC status bit 4 is set.

`nToolSoundData_80B8CD[trackId]` is the number of sample ids in that track's table entry (verified for all 25 ids), i.e. the
first free sample slot. [C]

Track ids: `aAudioTrackDataSizeTable` and `sAudioData1_838F83` have 26 entries (ids 0-25); id 0 is never played
(0 = "no track") and duplicates the Spring entry, `$FF` = "stop/none" in `fAudio_LoadPendingTrack`. [C]

| Track id | Label | ROM | Size | Sample ids (slot order) | Patterns | Voice streams |
|---:|---|---|---:|---|---:|---:|
| 0 | `sAudioTrack_Spring` | $AD:8FD6 | 748 | $07, $03, $01, $0C, $05, $26, $24 | 1 | 6 |
| 1 | `sAudioTrack_Spring` | $AD:8FD6 | 748 | $07, $03, $01, $0C | 1 | 6 |
| 2 | `sAudioTrack_Summer` | $AD:B44A | 626 | $01, $05 | 1 | 6 |
| 3 | `sAudioTrack_HarvestFestival` | $AD:9FFD | 939 | $03, $07, $01, $16, $05 | 1 | 6 |
| 4 | `sAudioTrack_Winter` | $AD:92C2 | 694 | $03, $07, $01 | 1 | 6 |
| 5 | `sAudioTrack_Town` | $AD:9AA7 | 1091 | $05, $01, $07 | 1 | 6 |
| 6 | `sAudioTrack_Mountain` | $AD:AC0E | 921 | $03, $07, $01 | 1 | 6 |
| 7 | `sAudioTrack_Fall` | $AD:AFA7 | 685 | $01, $04, $0C, $08 | 1 | 6 |
| 8 | `sAudioTrack_Dance` | $AD:B254 | 502 | $01, $07, $16 | 1 | 6 |
| 9 | `sAudioTrack_Church` | $AD:A9AE | 608 | $02 | 1 | 6 |
| 10 | `sAudioTrack_NamingScreen` | $AD:BE06 | 410 | $05, $07 | 1 | 6 |
| 11 | `sAudioTrack_Title` | $AD:BFA0 | 398 | $05, $01, $07 | 1 | 6 |
| 12 | `sAudioTrack_Funeral` | $AD:A3A8 | 465 | $05, $07, $01 | 1 | 6 |
| 13 | `sAudioTrack_EggFestival` | $AD:B6BC | 659 | $05, $01, $08 | 1 | 6 |
| 14 | `sAudioTrack_StarNightFestival` | $AD:986A | 573 | $05 | 1 | 6 |
| 15 | `sAudioTrack_TrollsCave` | $AD:9578 | 754 | $05, $0B, $01, $08 | 1 | 6 |
| 16 | `sAudioTrack_Ending` | $AD:A579 | 1077 | $05, $01, $0C | 1 | 7 |
| 17 | `sAudioTrack_BadEnding` | $AD:9EEA | 275 | $05, $03, $07 | 1 | 6 |
| 18 | `sAudioTrack_Opening` | $AD:B94F | 1207 | $04, $03, $07, $0B | 1 | 8 |
| 19 | `sAudioTrack_Rain` | $AD:C12E | 122 | $0D | 1 | 3 |
| 20 | `sAudioTrack_RainIndoors` | $AD:C1A8 | 128 | $0D | 1 | 3 |
| 21 | `sAudioTrack_WeatherFair` | $AD:C228 | 219 | $15, $0D, $18 | 1 | 6 |
| 22 | `sAudioTrack_Hurricane` | $AD:C303 | 286 | $10 | 1 | 6 |
| 23 | `sAudioTrack_Id23` | $AD:C421 | 176 | $1D | 1 | 6 |
| 24 | `sAudioTrack_Bell` | $AD:C4D1 | 92 | $1D | 1 | 2 |
| 25 | `sAudioTrack_WeatherCalm` | $AD:C52D | 188 | $13, $15 | 2 | 7 |

## 4. Port protocol

### 4.1 Boot upload (IPL) [C]

`fAudio_UploadData` is the usual SNES-to-IPL transfer:

1. wait until `APUIO0/1` reads `$BBAA` (IPL ready signature);
2. write destination `$0500` to `APUIO2/3`, non-zero to `APUIO1`, `$CC` to `APUIO0`; wait for the echo of `$CC`;
3. send the `$0FD6` bytes: `APUIO1` = data, `APUIO0` = running counter (starting at 0); wait for the counter echo before the next
   byte;
4. send a final block header with length 0 and start address `$0500` (`APUIO1` = 0), which makes the IPL jump to `$0500`.

The engine entry point is therefore `$0500` (`CLRP`, `MOV X,#$CF`, `MOV SP,X`, `MOV A,#$30`, `MOV !$00F1,A`, ...). The init
routine at `$0F7D` clears `$F7`, zero-fills direct page `$00-$E7`, `$0200-$03FE` and `$1500-$CFFF`, programs the DSP
(MVOLL/MVOLR = `$6E`, DIR = `$15`), loads the region pointers (section 6) and starts timer 0 and timer 1 (`$FA/$FB = $10`,
`$F1 = $03`). [C]

### 4.2 Command protocol (after boot) [C]

Port 3 is the handshake. Values written by each side:

| Direction | Value | Meaning |
|---|---|---|
| SPC -> SNES (`$F7`) | `1` | ready: a command, parameter packet or data chunk may be sent |
| SPC -> SNES | `0` | packet taken, busy |
| SPC -> SNES | `4` | packet accepted, command continues (more packets or data follow) |
| SPC -> SNES | `8` | last parameter packet accepted, command done |
| SNES -> SPC (`APUIO3`) | `2` | packet present in ports 0-2 |
| SNES -> SPC | `0` | acknowledged the SPC's `4`/`8`/`0` |

Port 0 SPC -> SNES additionally carries the **status byte** `$CF` (section 5). It is refreshed every time the SPC polls
(`$131A`: `MOV A,$CF` / `MOV !$00F4,A` / `MOV A,#$01` / `MOV !$00F7,A`), so the SNES only reads it while port 3 is `1`
(`fAudio_ReadSpcStatusBits0And4/Bit4` do exactly that, with double reads for stability).

Sending a command (`fAudio_SendSpcCommand`, SPC poll at `$131A`):

1. SNES waits for `APUIO3 == 1`.
2. SNES writes `command -> APUIO0`, `0 -> APUIO1`, `0 -> APUIO2`, then `2 -> APUIO3`.
3. SPC sees bit 1 of `$F7`, writes `0` to `$F7`, reads the command from `$F4` (until two reads agree), writes `4` to `$F7` and
   waits for bit 1 of `$F7` to clear.
4. SNES waits for `APUIO3 == 4` and writes `0 -> APUIO3`.
5. Each parameter packet repeats the cycle: SPC `$F7 = 1`; SNES waits for 1, writes up to three bytes to ports 0-2, then `2`
   to port 3; SPC reads the bytes, writes the **ack value** (`4` for commands 1, 2, 3, 5; `8` for 4, 8, 9, `$0A`, `$0B`) and
   waits for the SNES to clear port 3.

Bulk data (`$123C`, the `.copyData` loops on the 65816 side):

- The count of **3-byte chunks** (`ceil(bytes / 3)`) is sent as a parameter packet (ports 0 and 1, low byte first).
- For each chunk the SPC writes `$F7 = 1`; the SNES waits for 1, writes three data bytes to ports 0-2 and `2` to port 3; the
  SPC copies `$F4,$F5,$F6` to RAM, writes `$F7 = 0`, waits until the SNES writes port 3 = 0; repeat until the count is exhausted.
- Because a chunk is 3 bytes, up to two bytes beyond the real size are written to SPC RAM (harmless padding).
- **Cooperative upload:** while music is playing (`$CF` bit 0) the receive loop yields to the main loop every 12 chunks
  (`SET1 $D0.0` / `JMP $05A1`) and resumes from the poll routine (`$103C: BBS $D0.0`). Music therefore keeps ticking during uploads.

## 5. SPC700 command set (as implemented by the engine)

The poll routine returns the command id in A; `$104B-$1052` does `CALL !$131A; ASL A; MOV X,A; JMP [!$1053+X]`, so the jump table at
`$1053` holds 13 words. Ids above `$0C` index past the table (no range check). [C]

| Id | SPC handler | Packets sent by the 65816 | Effect on the SPC | Ack |
|---:|---|---|---|---|
| `$00` | `$1330` (RET) | - | none | 4 |
| `$01` | `$106D` | count (2 bytes), chunks | store `count*3` bytes at **`$1600`** (SFX block); `$C7 = $1600` [C] | 4 |
| `$02` | `$1089` | sample header (4 packets, see 7.1), chunks | load one sample into the **common region** (pointer `$C9`, slot counter `$0377`, first slot `$0B`) | 4 |
| `$03` | `$109E` | same as 2 | load one sample into the **track-sample region** (pointer `$CB`, slot counter `$0378`, first slot 0) | 4 |
| `$04` | `$10B3` | slot (port 0) | free slots `slot..10`: zero their entries in the slot-id table `$14B8`, rewind `$CB` to the start address of that slot's sample (or to `$65F4` for slot 0) | 8 |
| `$05` | `$10F6` | count (2 bytes), chunks | store the track data at **`$19F4`**; set track base `$AC` and song pointer `$B0` to `$19F4` | 4 |
| `$06` | `$1112` | same as 2 | load one sample into region 3 (pointer `$CD`, slot counter `$0379`, first slot `$15`); sets `$CF.2` when the counter reaches `$19`. **Never sent by the game** | 4 |
| `$07` | `$1130` | none | reset region 3 (`$CF.2` cleared, `$0379 = $15`, slots `$15-$18` cleared, `$CD = $B7F4`). Only an unused 65816 routine (`fAudioUnused_838CF3`) sends it | 4 |
| `$08` | `$1152` | (p0, p1) | start the track at `$19F4`. p0 = 0: master volume `$E0` immediately. p0 != 0: fade-in from 0 to `$E0` over p1 ticks. The game sends (1, `$40`) | 8 |
| `$09` | `$1177` | (p0, p1) | p0 = 0: stop at once (clear `$CF.0`, silence). p0 != 0: fade master volume to 0 over p1 ticks, then stop (`$CF.5` while fading). The game sends (1, `$40`) or (1, `$10`) | 8 |
| `$0A` | `$11A5` | (sfx id, voice 0-7, pan) | start SFX `id` on `voice` (see 8): `$D2 \|= 1<<voice`, voice stream pointer = `word[$1600 + 2*id]`, then pan command with p2 (`$0A` = centre) | 8 |
| `$0B` | `$121F` | p0 | p0 = 0: stereo (`$CF.6` cleared); p0 != 0: mono (`$CF.6` set, pan commands forced to centre). The game sends 0 at boot | 8 |
| `$0C` | `$122D` | none | toggle pause (`$CF.7`): clears/sets `$CF.0` and silences the voices. **No 65816 caller** (the 65816 only has a stub) | 4 |

All of the above is [C] (read from the disassembly of both sides); the human-readable names of 6, 7 and `$0C` and "stereo/mono"
for `$0B` are [I] interpretations of the observed behaviour (`$CF.6` is tested in the pan handlers `$06D3`/`$06E6`).

**Status byte `$CF`** (sent to the SNES in port 0): [C] for the set/clear sites, [I] for the names.

| Bit | Set by | Cleared by | Meaning |
|---:|---|---|---|
| 0 | start (`$0BB9`), resume | song end, stop, pause, fade end | music playing (the 65816 tests it with mask `$11`) |
| 1 | - | - | not used |
| 2 | command 6 when slot counter = `$19` | command 7 | region 3 full |
| 3 | song-end marker `$DE`, stop | next main-loop pass | skip one command poll after a song end |
| 4 | start (`$0BB7`) | after song init (`$05B2`) | "song starting" - the 65816 treats it as busy (mask `$11`) |
| 5 | command 9 with fade | fade finished (`$0594`), command 8 with fade | fade-out in progress |
| 6 | command `$0B` != 0 | command `$0B` == 0 | mono output |
| 7 | command `$0C` | command `$0C` | paused |

### 5.1 Relation to `docs/findings.md`

| findings.md statement | Verdict |
|---|---|
| 1 upload block ($3F2 bytes from $B2D120) | confirmed; destination is SPC `$1600`, content = SFX pointer table + SFX note streams |
| 2 load common samples, 3 load one sample | confirmed; 2 and 3 are the same sample transfer into different regions/slot ranges |
| 4 free sample slots | confirmed; parameter = first slot to free |
| 5 upload track data (3-byte chunks) | confirmed; destination `$19F4`, also sets the pointer base |
| 8 start track | confirmed; p0 = fade-in flag, p1 = fade ticks |
| 9 fade out ($40 slow / $10 fast) | confirmed; p0 = 0 means immediate stop |
| `$0A` play SFX | confirmed; parameters (sfx id, voice, pan) |
| `$0B` unclear (boot) | stereo/mono switch (0 = stereo) |
| `$0C` stub | stub on the 65816 side, but the SPC implements a pause toggle |
| waits for port 3 = `$04` | `4` or `8` depending on the command (table above) |
| 14-byte track table entries (ptr24 + 11 sample ids) | confirmed |

## 6. SPC700 RAM map

| Range | Use | Tag |
|---|---|---|
| `$0000-$00EF` | direct page: per-voice pointers and counters (`X = 2*voice`), global state (table below) | C |
| `$00F0-$00FF` | SPC I/O: `$F1` control, `$F2/F3` DSP address/data, `$F4-$F7` ports, `$FA/$FB` timer targets, `$FD` timer 0 counter | C |
| `$0100-$010F` | scratch word per voice used with `SETP` (vibrato phase, `$0AFB-$0AFE`) | C |
| `$0100-$01CF` | stack (`SP` starts at `$CF`) | C |
| `$0200-$035F` | per-voice tables, 16 bytes per field (`X = 2*voice`) | C |
| `$0360-$037F` | command scratch: `$0362` chunk-yield counter, `$0364-$0366` packet bytes, `$036B` elapsed timer ticks, `$036D-$0374` saved copy of `$90-$97` while the SFX tick runs, `$0377/$0378/$0379` next free slot (common / track / region 3), `$037A` working slot | C |
| `$0400-$0495` | instrument records, 6 bytes per slot (`$0400 + 6*slot`), slots 0-24 | C |
| `$0500-$14D5` | the engine (code `$0500-$13DF`, tables `$13E0-$14B7`, slot-id table `$14B8-$14D1`) | C |
| `$1500-$1563` | DSP sample directory (4 bytes per slot, DIR = `$15`) | C |
| `$1600-$19F1` | SFX block: 50 word pointers + streams (command 1) | C |
| `$19F4-$1FF3` | current track data (command 5); max `$600` bytes, largest track is `$4B7` | C |
| `$1FF4-$65F3` | common sample region (command 2): 7 samples, 17680 bytes used | C |
| `$65F4-$B7F3` | track-sample region (command 3); in practice it runs on into `$B7F4+` because region 3 is never used (largest used track ends at `$B8D4`) | C |
| `$B7F4-$FFFF` | region 3 (command 6, unused); every track programs echo delay 5, so the echo buffer is `$D700-$FEFF` (`ESA = $FF - 8*EDL`) | C / I |

Engine tables (all [C] by use in the code, names [I]):

| Address | Contents |
|---|---|
| `$1053` | command jump table (13 words) |
| `$13E0` | handler table for stream commands `$E0-$FA` (27 words; `$FB-$FE` are zero) |
| `$141E` | parameter counts for `$E0-$FA`: 1 1 2 3 0 1 2 1 2 1 1 3 0 1 2 3 1 3 3 0 1 3 0 3 3 3 1 |
| `$143D` | pitch table, 13 words `$085F ... $10BE` (one octave, ratio 2.0 between first and last) |
| `$1457` | pan table, 21 bytes (`00 01 03 07 0D 15 1E 29 34 42 51 5E 67 6E 73 77 7A 7C 7D 7E 7F`) |
| `$146C` | echo FIR coefficient sets, 8 bytes each (set 0 = `7F 00 00 00 00 00 00 00`) |
| `$148C` / `$1496` | DSP register ids (`EVOLL EVOLR EFB EON FLG KON KOF NON PMON KOF`) paired with the direct-page shadow variables copied into them (`$A0 $A2 $8A $86 $84 $81 $DF $85 $87 $82`) |
| `$14A0` | gate (note-length fraction) table, 8 bytes: `32 B2 BF CB D8 E5 F2 FC` |
| `$14A8` | velocity table, 16 bytes: `19 32 4C 65 72 7F 8C 98 A5 B2 BF CB D8 E5 F2 FC` |
| `$14B8` | slot -> sample id (runtime state, filled by commands 2/3/4/6) |

Direct-page variables (selection; [C] for the access pattern, names [I]):

| Address | Use |
|---|---|
| `$00/$01 + 2v` | voice stream pointer (absolute) |
| `$10+X` / `$11+X` | ticks left in the current note / ticks until key-off |
| `$20+X` / `$21+X` | volume-fade / pan-fade counters |
| `$30+X` / `$31+X` | pitch-slide counter / delay |
| `$41+X`, `$51+X` | vibrato depth, tremolo depth |
| `$60+X` | subroutine repeat counter |
| `$76`, `$83` | current voice offset, current voice bit |
| `$81`, `$82`, `$84`, `$85` | KON, KOF, FLG, NON shadows |
| `$8B`, `$8C` | global transpose, percussion instrument base |
| `$92/$93` | music tempo (high byte = tempo); `$94-$97` tempo fade |
| `$98/$99` | master volume (high byte used); `$9A-$9D` master volume fade |
| `$AA/$AB` | remaining 3-byte chunks, `$B3/$B4` chunk destination pointer |
| `$AC/$AD` | track base (added to every relative pointer in the track data) |
| `$B0/$B1` | song-list read pointer, `$B2` loop counter |
| `$BA/$BB` | sample directory base (`$1500`) |
| `$C1` | SFX tempo (`$25`); `$BE-$C5` SFX copy of the timing variables (swapped with `$90-$97` by `$0DA2/$0DBD`) |
| `$C7/$C8` | SFX table pointer (`$1600`) |
| `$C9`, `$CB`, `$CD` | next free address in the common / track / region-3 sample regions; `$D8`, `$DA` their reset values for `$CB`/`$CD` |
| `$CF` | status byte (above); `$D0` flags (bit 0 = upload in progress) |
| `$D2` | mask of voices currently owned by SFX; `$DE` voices SFX just took over |
| `$DC/$DD` | default track base `$19F4` |
| `$80` | never written after init (voice-mute mask, effectively unused) |

Main loop (`$050C`): wait for timer 0 (`MOV Y,!$00FD` / `BEQ`; target `$10` -> 2 ms), update the DSP shadow registers,
accumulate `tempo * ticks` into `$91`, run the music tick (`$05A9`) when it overflows and the SFX tick (`$0C93`) from its own
accumulator (`$C1`), poll the ports once per iteration (`CALL $103C`). [C] The SFX tick reuses the music routines by swapping the
timing variables `$90-$97` with `$BE-$C5` and runs on the voices selected by `$D2`. [I]

## 7. Samples

### 7.1 Sample table (`sAudioSampleData`, 10 bytes per entry, 40 entries, `aAudioSampleSize` has the matching 40 sizes) [C]

| Offset | Size | Field | Sent as |
|---:|---:|---|---|
| 0 | 2 | loop offset in bytes from the start of the BRR data | ports 1-2 of packet 1 (port 0 = sample id) |
| 2 | 3 | ADSR1, ADSR2, GAIN | ports 0-2 of packet 2 |
| 5 | 2 | tuning (integer part, fraction/256) | ports 0-1 of packet 3 |
| 7 | 3 | 24-bit ROM pointer to the BRR data | not sent; used as the source of the chunks |

Packet 4 carries the chunk count `ceil(aAudioSampleSize[id] / 3)`. The SPC (`$1286`) builds:

- DIR entry `$1500 + 4*slot`: `start` (= region pointer) and `loop` (= `start + loop offset`) - the standard DSP directory; [C]
- instrument record `$0400 + 6*slot`: `slot, ADSR1, ADSR2, GAIN, tuning_int, tuning_frac` (byte 0 is the SRCN); the tuning pair is
  used as an 8.8 multiplier of the pitch-table value in the pitch routine (`$0EC9-$0EED`); [C] for the layout, [I] for the
  "multiplier" meaning;
- slot id table `$14B8 + slot = sample id`.

Entry 0 duplicates entry 1 (id 0 is never loaded). A sample's loop flag is in the header of its **last** BRR block; for all
18 looping samples the loop offset is a multiple of 9 inside the sample, for the 21 one-shot samples the offset is unused
(for ids `$08` and `$13` it is not even inside the sample). [C]

### 7.2 BRR layout [C]

Standard BRR: 9-byte blocks, header = `range<<4 | filter<<2 | loop<<1 | end`. In all 39 blobs the first block with the end flag is followed by 0-15 bytes of padding up to the 16-byte-aligned size
(section 2). The end block of a looping sample has the loop flag too (`$8B`, `$AB`, `$9B`, ...), one-shots end with `$01` or
similar. Range values are <= 12 everywhere except 4 blocks (ids `$11`, `$12`, `$1B`, `$27`) with range 13.

### 7.3 Slots and regions [C]

| Region | Pointer | Slots | Loaded by | Contents |
|---|---|---|---|---|
| common | `$C9` from `$1FF4` | `$0B-$11` | boot, command 2 | the 7 samples in `aAudioSampleLookupTable` order: `$17 $18 $19 $1A $15 $06 $0A` |
| track | `$CB` from `$65F4` | 0-10 | per track, command 3 | the track's sample ids in table order, then sample `$06`, then (optionally) one SFX sample |
| region 3 | `$CD` from `$B7F4` | `$15-$18` | never | - |

- A music stream selects an instrument with `$E0 n`: `n` is the **slot number**. For all 25 tracks the `$E0` operands are
  `0..(number of listed samples - 1)`, i.e. the position in the track's sample list. [C]
- Every track begins with `$FA $0B` (percussion base = `$0B`), so percussion notes `$CA, $CB, $CC...` use slots `$0B, $0C, $0D...`,
  which are the common samples `$17, $18, $19...` (only `$CA-$CC` occur in the US tracks). [C]
- In an SFX stream `$E0 n` carries a **sample id** instead; the engine searches the slot-id table (`$0DD8`, 26 slots, fallback
  slot `$0E`). Verified: for all 50 SFX the `$E0` operand equals `aAudioSfxSampleIdTable[sfx]` when that is non-zero, otherwise
  it is one of the common samples. [C]

Capacity check [C]: the common set uses 17680 bytes of sample data (limit 17920); the driver advances its region pointers by whole 3-byte chunks, so the real footprint is up to 2 bytes per sample larger (17683 here; verified by running the driver, `audioconv.py spc`). The largest sample set of a track that is actually used
(TrollsCave, id 15) is 21216 bytes including the extra sample `$06` and ends at `$B8D4`; the never-played table entry 0 would end at
`$CD64`. Both are below the echo buffer at `$D700`. The engine does not bounds-check the regions.

| Id | Label | Size | Loop offset | ADSR1 ADSR2 GAIN | Tuning (int.frac hex) | Notes |
|---:|---|---:|---:|---|---|---|
| $01 | `sAudioSample_Id00` | 4288 | 432 (block 48) | FF E0 B8 | 5.20 |  |
| $02 | `sAudioSample_Id02` | 12000 | 630 (block 70) | FF E0 B8 | 6.B0 |  |
| $03 | `sAudioSample_Id03` | 2992 | 1503 (block 167) | FF E3 B8 | 1.E0 |  |
| $04 | `sAudioSample_Id04` | 1920 | 1854 (block 206) | FF EF B8 | 5.F0 |  |
| $05 | `sAudioSample_Id05` | 3344 | 2034 (block 226) | FF EB B8 | 3.E0 |  |
| $06 | `sAudioSample_Id06` | 64 | 27 (block 3) | FF E0 B8 | 4.00 | common set, slot $10 |
| $07 | `sAudioSample_Id07` | 7984 | 1548 (block 172) | FF E0 B8 | 5.A0 |  |
| $08 | `sAudioSample_Id08` | 6480 | none (end header $01) | FF E0 B8 | 5.A0 |  |
| $09 | `sAudioSample_Id09` | 4864 | 4824 (block 536) | 86 EB B8 | 4.00 |  |
| $0A | `sAudioSample_Id10` | 720 | 675 (block 75) | FF EE B8 | 3.F0 | common set, slot $11 |
| $0B | `sAudioSample_Id11` | 7040 | 3510 (block 390) | FF E0 B8 | 3.50 |  |
| $0C | `sAudioSample_Id12` | 832 | 513 (block 57) | FF E9 B8 | 1.E0 |  |
| $0D | `sAudioSample_Id13` | 1648 | 27 (block 3) | FF E0 B8 | 1.30 |  |
| $0E | `sAudioSample_Id14` | 3488 | none (end header $01) | FF E0 B8 | 7.A0 |  |
| $0F | `sAudioSample_Id15` | 4672 | 27 (block 3) | FF E0 B8 | 0.D0 |  |
| $10 | `sAudioSample_Id16` | 4000 | 1233 (block 137) | FF E0 B8 | 0.B0 |  |
| $11 | `sAudioSample_Id17` | 2000 | 27 (block 3) | FF E0 B8 | 0.50 |  |
| $12 | `sAudioSample_Id18` | 6976 | none (end header $01) | FF E0 B8 | 3.C0 |  |
| $13 | `sAudioSample_Id19` | 7984 | none (end header $01) | FF E0 B8 | 7.A0 |  |
| $14 | `sAudioSample_Id20` | 1712 | 27 (block 3) | FF E0 B8 | 0.90 |  |
| $15 | `sAudioSample_Id21` | 6464 | none (end header $01) | FF E9 B8 | 1.E0 | common set, slot $0F |
| $16 | `sAudioSample_Id22` | 1840 | none (end header $01) | FF E0 B8 | 7.A0 |  |
| $17 | `sAudioSample_Id23` | 992 | none (end header $01) | FF E0 B8 | 4.20 | common set, slot $0B |
| $18 | `sAudioSample_Id24` | 4992 | none (end header $01) | FF E0 B8 | 5.20 | common set, slot $0C |
| $19 | `sAudioSample_Id25` | 1248 | none (end header $01) | FF E0 B8 | 7.A0 | common set, slot $0D |
| $1A | `sAudioSample_Id26` | 3200 | none (end header $01) | FF E0 B8 | 7.A0 | common set, slot $0E |
| $1B | `sAudioSample_Id27` | 3984 | none (end header $01) | FF E0 B8 | 1.50 |  |
| $1C | `sAudioSample_Id28` | 3664 | none (end header $69) | FF E0 B8 | 7.A0 |  |
| $1D | `sAudioSample_Id29` | 15984 | none (end header $01) | FF E0 B8 | 5.40 |  |
| $1E | `sAudioSample_Id30` | 3984 | none (end header $01) | FF E0 B8 | 1.C0 |  |
| $1F | `sAudioSample_Id31` | 2992 | none (end header $01) | FF E0 B8 | 1.10 |  |
| $20 | `sAudioSample_Id32` | 2992 | none (end header $01) | FF E0 B8 | 0.B0 |  |
| $21 | `sAudioSample_Id33` | 2992 | none (end header $01) | FF E0 B8 | 2.90 |  |
| $22 | `sAudioSample_Id34` | 2992 | 18 (block 2) | FF E0 B8 | 0.20 |  |
| $23 | `sAudioSample_Id35` | 1984 | none (end header $01) | FF E0 B8 | 1.10 |  |
| $24 | `sAudioSample_Id36` | 4992 | none (end header $01) | FF E0 B8 | 1.A0 |  |
| $25 | `sAudioSample_Id37` | 832 | 513 (block 57) | FF E9 B8 | 1.E0 |  |
| $26 | `sAudioSample_Id38` | 1984 | none (end header $01) | FF E0 B8 | 1.00 |  |
| $27 | `sAudioSample_Id39` | 7984 | none (end header $B9) | FF E0 B8 | 1.E0 |  |

## 8. Track data format

All pointers in a track blob are **relative to the start of the blob** (the engine adds `$AC`, which is `$19F4`). [C]
The format was validated by decoding all 25 distinct tracks completely: every byte of 24 of them is accounted for by the
structures below, the last one (`sAudioTrack_WeatherCalm`) has one extra trailing `00`. [C]

### 8.1 Song list (at offset 0; engine routine `$0BFD`/`$0C7B`)

A sequence of 16-bit little-endian words:

| Word | Meaning |
|---|---|
| `$0000-$7FFF` | pointer to a **pattern** (16 bytes) |
| `$80nn` followed by a pointer word | jump to the pointer; taken `nn` times in total, `nn >= $80` = forever (counter in `$B2`); after the last repeat the pointer is skipped |
| `$8000` | end of song |

Every US track starts with `08 00 FF 80 00 00 00 80`: pattern at offset 8, "jump to offset 0 forever", then `$8000`.
Track `ADC52D` has two patterns (song list `0A 00`, `1A 00`, `FF 80`, `02 00`, `00 80`) and loops back to its second song-list word.

### 8.2 Pattern

Eight words, one pointer per hardware voice 0-7 (0 = voice not used). A voice owned by an SFX (`$D2`) keeps its SFX stream.

### 8.3 Voice stream

| Byte | Meaning |
|---|---|
| `$00` | end of stream; inside a subroutine: repeat/return (below); at top level the voice that reaches it makes the engine load the next song-list entry |
| `$01-$7F` | note length in ticks; if the next byte is also `< $80` it is a gate/velocity byte: bits 6-4 index the gate table `$14A0`, bits 3-0 the velocity table `$14A8` |
| `$80-$C7` | note (pitch = byte & $7F + global transpose + voice transpose) |
| `$C8` | tie (suppresses key-off, `$0A7A`) |
| `$C9` | rest |
| `$CA-$DF` | percussion: instrument = percussion base + (byte - `$CA`), played at a fixed pitch (`$A4`) |
| `$DE` | stop the song (`$0661`; not used by the US tracks) |
| `$E0-$FA` | command + parameter bytes (table) |
| `$FB-$FF` | invalid |

Stream commands (handler addresses from the table at `$13E0`; the N-SPC names are [I], the parameter counts and handler
behaviour [C]):

| Byte | Params | Handler | Meaning |
|---|---:|---|---|
| `$E0` | 1 | `$0F0B` | instrument (slot) |
| `$E1` | 1 | `$06D3` | pan (0-20, `$0A` = centre) |
| `$E2` | 2 | `$06E6` | pan fade (time, target) |
| `$E3` | 3 | `$0712` | vibrato on (delay, rate, depth) |
| `$E4` | 0 | `$072A` | vibrato off |
| `$E5` | 1 | `$0745` | master volume |
| `$E6` | 2 | `$074A` | master volume fade |
| `$E7` | 1 | `$0762` | tempo |
| `$E8` | 2 | `$0767` | tempo fade |
| `$E9` | 1 | `$077F` | global transpose |
| `$EA` | 1 | `$0782` | voice transpose |
| `$EB` | 3 | `$0786` | tremolo on |
| `$EC` | 0 | `$079E` | tremolo off |
| `$ED` | 1 | `$07CB` | voice volume |
| `$EE` | 2 | `$07D4` | voice volume fade |
| `$EF` | 3 | `$07F7` | call subroutine: address (relative), repeat count; the subroutine ends with `$00` |
| `$F0` | 1 | `$0735` | vibrato fade |
| `$F1` | 3 | `$07A1` | pitch envelope "to" (delay, length, semitones) |
| `$F2` | 3 | `$07A5` | pitch envelope "from" |
| `$F3` | 0 | `$07C7` | pitch envelope off |
| `$F4` | 1 | `$07F3` | voice tuning (fine) |
| `$F5` | 3 | `$082B` | echo: voice mask (EON), volume left, volume right |
| `$F6` | 0 | `$087E` | echo off |
| `$F7` | 3 | `$0885` | echo parameters: delay (EDL), feedback, FIR set (0-3) |
| `$F8` | 3 | `$084A` | echo volume fade |
| `$F9` | 3 | `$0918` | pitch slide (delay, length, target note) |
| `$FA` | 1 | `$08FF` | percussion instrument base |

Subroutines (`$EF`): the engine stores the address, the repeat count (`$60+X`) and the return pointer; each `$00` decrements
the count and re-enters the subroutine until it reaches zero, then continues after the `$EF` operands. A count of 1 runs the
subroutine once. [C]

Parameter values seen in the US tracks [C]: every track sets `FA 0B`; echo is configured by `F5 xx 5A 5A` (`3C 3C` in Winter) and
`F7 05 3C 01` (delay 5, feedback 60, FIR set 1; `F7 05 32 01` in the opening, `F7 05 3C 03` in Hurricane).

### 8.4 Timing [I]

Tick rate = timer 0 (2 ms) scaled by the tempo accumulator (`$91 += tempo * elapsed`, one music tick per overflow). A note
sounds for `length * gate / 256` ticks of its `length`. Exact BPM was not derived.

## 9. SFX block (command 1, SPC `$1600`)

- `$1600-$1663`: 50 little-endian pointers (absolute SPC addresses); entry `i` is SFX id `i`. [C]
- `$1664-$19F1`: the 50 note streams, each ending in `00` followed by one extra `00` (the extra byte is unused). Stream 0 is
  just `00`. [C]
- Streams use the same bytes as music streams with two differences: `$E0` operates on a sample id, and `$DF` is a
  noise command with one parameter (`$0DF4`) instead of a percussion note. [C]
- The block contains no pan/volume setup of its own; pan comes from the command-`$0A` packet, volume from `$ED` commands
  inside the stream. [I]

| SFX | Stream (SPC) | Table sample id | `$E0` sample ids in stream |
|---:|---|---|---|
| $00 | $1664 | - | - |
| $01 | $1666 | - | $06 |
| $02 | $167B | - | $06 |
| $03 | $1690 | $05 | $05 |
| $04 | $169D | - | $06 |
| $05 | $16AC | - | $1A |
| $06 | $16C1 | - | $06 |
| $07 | $16D8 | - | $0A |
| $08 | $16EB | - | $06 |
| $09 | $1702 | - | $06 |
| $0A | $1717 | - | $19 |
| $0B | $1728 | - | $19 |
| $0C | $1738 | $0D | $0D |
| $0D | $174A | $13 | $13 |
| $0E | $175F | $1D | $1D |
| $0F | $1776 | $26 | $26 |
| $10 | $1787 | - | $15 |
| $11 | $1798 | - | $19 |
| $12 | $17A5 | - | $15 |
| $13 | $17B2 | - | $15 |
| $14 | $17C3 | $10 | $10 |
| $15 | $17D6 | $23 | $23 |
| $16 | $17E9 | $23 | $1A, $23 |
| $17 | $17FC | - | $18 |
| $18 | $1809 | - | $18 |
| $19 | $181A | $24 | $24 |
| $1A | $182B | $0D | $0D |
| $1B | $1840 | - | $17 |
| $1C | $1864 | $25 | $25 |
| $1D | $187D | $1E | $1E |
| $1E | $1890 | $1E | $1E |
| $1F | $189D | $27 | $27 |
| $20 | $18AA | $21 | $21 |
| $21 | $18B9 | $14 | $14 |
| $22 | $18CE | $0E | $0E |
| $23 | $18DB | $14 | $14 |
| $24 | $18EC | $14 | $14 |
| $25 | $18F8 | $1C | $1C |
| $26 | $1907 | $1F | $1F |
| $27 | $1914 | $14 | $14 |
| $28 | $1925 | $11 | $11 |
| $29 | $1937 | $0F | $0F |
| $2A | $1944 | $12 | $12 |
| $2B | $1953 | $10 | $10 |
| $2C | $1962 | $11 | $11 |
| $2D | $1979 | $11 | $11 |
| $2E | $1999 | $11 | $11 |
| $2F | $19AD | $07 | $07 |
| $30 | $19C0 | $26 | $26 |
| $31 | $19CB | $06 | $06 |

## 10. Tools and tests

- `tools/audio/spc700.py` - SPC700 disassembler (`disassemble(data, base)`, `trace(data, base, entries)`, CLI
  `python tools/audio/spc700.py <file.bin> --base 0x0500 [--bytes] [--trace 0x0500]`).
- `tools/audio/audio_map.py` - builds the table in section 2, decodes tracks/SFX, runs 129 consistency checks (`--check`).
- `tests/test_spc700.py` - opcode-length and mnemonic tables against an independent copy, 106 hand-checked instructions,
  a smoke test that traces the whole engine (no overlaps, no stray branch targets, only three non-code gaps) and the
  `audio_map` checks.
- `tools/audio/audioconv.py` (+ `brr.py`, `trackfmt.py`, `spcasm.py`) - builds the blobs and tables from the editable sources
  (`build`), validates them (`check`), exports MIDI/WAV. Formats and workflow: `formats/audio-sources.md`.
- `audioconv.py spcmatch DUMPS...` - identify foreign `.spc` dumps by RAM content and compare their static data (section 12).
- `tests/test_audio_convert.py` - BRR decoder against an independent implementation, exact/lossy encoder, WAV I/O, SPC700
  assembler round trip of all 256 opcodes, track text format, build of the whole audio set.

Reproduce the disassembly of the dispatcher (after `python tools/build_assets.py`): `python tools/audio/spc700.py assets/audio/sAudioSpcDriver.bin --base 0x0500 --start 0xB4B --length 0x40 --bytes`
(`$104B`, the command jump). The full listing with labels is `assets/audio/driver/sAudioSpcDriver.spc.asm`.

## 11. Open questions

- **Provenance of the driver.** The engine matches the N-SPC family structurally, but it is not byte-identical to any engine
  known to the author; the custom port protocol and the SFX layer (`$D2`, `$0C93`) are specific to this game. Which
  developer's variant it is is unknown.
- **Command `$06`/`$07` and `$0C`** exist in the engine but are never used by the US 65816 code (`$0C` has only a stub). Whether other
  regions use them was not checked.
- **`$CF` bit 1** and `$D0` bits other than 0 and 5 are never set/tested in the code reached; `$80` (voice-mute mask) is
  never written. They may be leftovers.
- **Index bookkeeping on the 65816 side.** `strcAudio.index`/`list` (`$0103-$010D`) are used inconsistently
  (`nToolSoundData + 1` in `fAudio_PlaySoundEffectAndWait`, `nToolSoundData` in `fAudio_LoadPendingTrack`); the implied SPC slot
  numbers were not fully reconciled. The extra sample `$06` appended to every track occupies one slot that has no entry in
  `strcAudio.list`.
- **SFX voices.** The sample callers seen pass voices 6 and 7, but not every caller was checked, and the engine allows any
  voice 0-7 (a track voice is silenced while an SFX owns it).
- **SFX sample overflow.** The SFX sample is loaded behind the track's samples without a bounds check. SFX `$0E` uses sample `$1D`
  (15984 bytes), which would push most tracks past the echo buffer (`$D700`); it is probably only played while the bell/clock
  tracks (ids 23/24, which carry the same sample) are loaded, but this was not verified.
- **Pitch/tuning maths.** The tuning pair and the pitch table are used as an 8.8 multiplier, but the exact formula
  (`$0E7A-$0F05`) was only skimmed. Vibrato/tremolo/pitch-envelope parameter order is [I].
- **Echo.** Delay 5 (10 KB buffer `$D700-$FEFF`) is used by every track; no check for other values was done.
- **Track names.** All 20 song labels that have a name (`Spring`, `Church`, ... `Town`, `Rain`) are confirmed by emulator dumps (section 12); ids 12, 20,
  21, 23, 25 are unnamed (no dump covers them). Nothing here verifies which in-game situation plays which id
  (`fAudioEngine_MapMusicHandler` and `pAudioEngine_MapMusic` select ids per map and season).
- **Sample/BRR labels.** 39 of the 65 `sAudioTrack_*` labels are BRR samples and one is the engine. They should be renamed
  (`sAudioEngine_*`, `sAudioSample_*`) in a separate change; only the addresses are certain.
- **Two stray bytes.** Track `ADC52D` has one trailing `00`; every SFX stream has one trailing `00`. Harmless, but they are the only
  bytes not accounted for by the format description.
- **Other regions.** JP/EU/DE audio blobs were not compared.

## 12. Validation against real emulator dumps

`audioconv.py spcmatch DUMPS...` identifies foreign `.spc` snapshots (here: 20 rips taken from running the US game in an
emulator; they are reference material and are never committed) by RAM content and compares them with the snapshot that
`audioconv.py spc` generates for the same song. A dump is matched to a song when the whole track blob is found at SPC `$19F4`,
not by file name. The comparison splits the 64 KiB into static data, which must be identical, and runtime state, which is
only reported.

| Dump (song name in the file) | Our label | Track id | Static data | Notes |
|---|---|---|---|---|
| Opening | `sAudioTrack_Opening` | 18 | identical | echo not yet configured (EVOL 0, FLG $20): dump taken before the engine ran its echo setup |
| Title | `sAudioTrack_Title` | 11 | identical | |
| Naming Screen | `sAudioTrack_NamingScreen` | 10 | identical | |
| Town | `sAudioTrack_Town` | 5 | identical | label was `Id05` before; renamed because of this match |
| Mountain | `sAudioTrack_Mountain` | 6 | identical | |
| Church | `sAudioTrack_Church` | 9 | identical | |
| Spring | `sAudioTrack_Spring` | 0 and 1 | identical | ids 0 and 1 share the blob |
| Dance | `sAudioTrack_Dance` | 8 | identical | |
| Summer | `sAudioTrack_Summer` | 2 | identical | |
| Egg Festival | `sAudioTrack_EggFestival` | 13 | identical | |
| Fall | `sAudioTrack_Fall` | 7 | identical | |
| Harvest Festival | `sAudioTrack_HarvestFestival` | 3 | identical | |
| Winter | `sAudioTrack_Winter` | 4 | identical | echo volume $3C instead of $5A |
| Star Night Festival | `sAudioTrack_StarNightFestival` | 14 | identical | |
| Bell | `sAudioTrack_Bell` | 24 | identical | |
| Trolls Cave | `sAudioTrack_TrollsCave` | 15 | identical | |
| Ending | `sAudioTrack_Ending` | 16 | identical | |
| Bad Ending | `sAudioTrack_BadEnding` | 17 | identical | |
| Hurricane | `sAudioTrack_Hurricane` | 22 | identical | uses a different FIR filter set (the other 19 dumps use the standard set) |
| Rain | `sAudioTrack_Rain` | 19 | identical | |

"Identical" means, for every dump: the track blob (100 % of the bytes), the SPC700 driver (`$0500-$14B7`), the SFX block
(`$1600-$19F3`), the sample directory entries of the song's samples and the BRR data of the common samples and of the song's
samples. The remaining differences are all runtime state and are expected:

- **Driver `$14B8-$14C9`** (the slot-id table) and the **direct page, stack, per-voice tables `$0200-$03FF`**: live state at the
  moment of the snapshot.
- **Stale sample slots.** Dumps were taken after other songs had been played, so directory slots and BRR data above the current
  song's samples still hold the previous songs' samples (1-6 extra slots per dump, listed as `stale-slots`). The instrument
  records `$0400-$04FF` behave the same way, and records that were never written hold `$FF` in the dumps and `$00` in ours (RAM
  power-on pattern of the emulator that made the dumps, not driver behaviour).
- **Track data tail** `$19F4+len ... $1FF3` and the **echo buffer** `$D700-$FFFF`: leftovers of earlier songs / audio output.
- **DSP.** All dumps have ESA $D7, EDL 5 and DIR $15 (as documented), MVOL $6E, EFB $3C, FLG $00 and a song-specific EON/EVOL.
  Our snapshots are taken right after the start command, before the engine has run its echo setup, so ESA/EDL/FLG/EON/EVOL
  differ; the driver sets them within the first tens of thousands of SPC700 steps after the snapshot is loaded in a player.

**Findings that changed the generator.** The first comparison showed one differing byte at the end of every sample whose
size is not a multiple of 3: the driver copies whole 3-byte chunks, so the one or two ROM bytes after the sample (the first
bytes of the next blob in the same bank, or the bank padding after the last blob) are copied into SPC RAM as well. The
generated snapshots now feed those bytes; with that all 20 dumps agree with ours.

**What this proves about the sources.** The track blobs, the driver, the SFX block and the samples built from
`assets/audio` equal what the real game puts into SPC RAM, so the editable sources (WAV/JSON, track text, driver listing)
round-trip to the data the engine actually plays. It does not validate the SPC700 emulator's output (rendered audio), which
no dump contains.

## 13. Sound effect and song names

### 13.1 How the id reaches the engine

A sound effect is requested with `fAudio_PlaySoundEffectAndWait` (A = effect id, X = voice, Y = wait in frames) or with the shorter
`strcAudio.reg114 = id; reg115 = voice; fAudioSetRegister2to0A`, which sends command `$0A` (id, voice, `$0A`). Voices used by the US code are 6
(UI, player and tool sounds) and 7 (water, house and cutscene sounds). `nToolSoundData_829054` (assets/tables/data/tool_sound_data_82.csv)
holds, per tool id, `[voice, effect when the target tile has no matching object, effect when it has]`; `fToolUsedSound_PlayOnToolChange`
preloads the samples of both effects when the tool changes and `fSound_GetToolSound` selects the column at use time. The enum values
`!SFX_*` live in `src/common/enums.asm`; the stream sources are `assets/audio/sfx/<Name>.sfx.txt` and the id order is `sfx_names` in
`assets/audio/audio.json`. The generated block is byte-identical to the original (the 50 streams do not share data or pointers).

### 13.2 Effects

Confidence: high = the caller and its meaning are unambiguous in the code; medium = the caller is certain, the sound's role is inferred from the
tool/column it belongs to; low = the caller is certain but its purpose is not understood. Effects without any caller in the US code keep a
neutral `Sfx_Unk<id>` name (no listening review was done; the names rest on the code only). Names follow the project vocabulary (`Plow` = hoe).

| Id | Name | Enum | Sample | Confidence | Evidence |
|---|---|---|---|---|---|
| $00 | `Sfx_Silence` | `!SFX_SILENCE` | common | high | Played with voice 7 by the watering can and sprinkler actions (fToolUsedAction0x10_WateringCan, fToolUsedAction0x15_Sprinkler); empty stream, so it ends the looping water sound on that voice |
| $01 | `Sfx_MenuConfirm` | `!SFX_MENUCONFIRM` | common | high | A button / confirm: name entry A button and table switches, dialog option confirm (fInput_DialogOptions_Confirm), fInput_Case03_ConfirmSelection, yes/no and load-game choices |
| $02 | `Sfx_MenuCancel` | `!SFX_MENUCANCEL` | common | medium | Name entry B button, the end cell of the name table and the second choice of yes/no and load-game screens (fInput_Case04_State7_ToggleChoice, fInput_Case04_State8_LoadChoice) |
| $03 | `Sfx_MenuCursor` | `!SFX_MENUCURSOR` | 5 | high | Cursor movement in name entry, menus and dialog options (fInput_Case03_Cursor*, fInput_DialogOptions_*, fNameInput_*Button) and the text blip written by fDialog_IterateText; also the effect whose sample (id 5) fAudio_LoadPendingTrack preloads |
| $04 | `Sfx_EggFestivalTimeUp` | `!SFX_EGGFESTIVALTIMEUP` | common | medium | AI script 0x28 (Egg Festival game) with the dialog 'Beep! Time is up! Next egg.' (strcFlags.unknown1 bit 6 branch) |
| $05 | `Sfx_PlayerStep` | `!SFX_PLAYERSTEP` | common | high | fPlayerAction_Run_StepSound: footstep while running |
| $06 | `Sfx_PlayerJump` | `!SFX_PLAYERJUMP` | common | high | fPlayerAction0x03 (!PACTION_JUMP), played in all four variants (normal, carrying, riding, in the hot spring) |
| $07 | `Sfx_ItemDrop` | `!SFX_ITEMDROP` | common | high | fPlayerAction0x05 (!PACTION_DROPITEM) |
| $08 | `Sfx_ItemPickUp` | `!SFX_ITEMPICKUP` | common | high | fItemCarried_Begin: picking an item up when nSoundItemCarriedTable_81A308 has an entry for it |
| $09 | `Sfx_Unk09` | `!SFX_UNK09` | common | none | no caller in the US code or data (not referenced by any literal, table or AI script) |
| $0A | `Sfx_Unk0A` | `!SFX_UNK0A` | common | none | no caller in the US code or data (not referenced by any literal, table or AI script) |
| $0B | `Sfx_Unk0B` | `!SFX_UNK0B` | common | none | no caller in the US code or data (not referenced by any literal, table or AI script) |
| $0C | `Sfx_Unk0C` | `!SFX_UNK0C` | 13 | none | no caller in the US code or data (not referenced by any literal, table or AI script) |
| $0D | `Sfx_Unk0D` | `!SFX_UNK0D` | 19 | none | no caller in the US code or data (not referenced by any literal, table or AI script) |
| $0E | `Sfx_Unk0E` | `!SFX_UNK0E` | 29 | none | no caller in the US code or data (not referenced by any literal, table or AI script) |
| $0F | `Sfx_PlowHitObject` | `!SFX_PLOWHITOBJECT` | 38 | medium | nToolSoundData_829054 'object hit' column of the plow (hoe), tool id 2 |
| $10 | `Sfx_GoldPlowHitObject` | `!SFX_GOLDPLOWHITOBJECT` | common | medium | nToolSoundData_829054 'object hit' column of the golden plow, tool id 18 |
| $11 | `Sfx_ToolHitGround` | `!SFX_TOOLHITGROUND` | common | medium | 'no object' column shared by plow, golden plow, axe and golden axe (the tool hits plain ground) |
| $12 | `Sfx_SickleCut` | `!SFX_SICKLECUT` | common | medium | 'object hit' column of the sickle (tool id 1): fSound_GetToolSound returns 1 when the tile's object property has bit 0 |
| $13 | `Sfx_GoldSickleCut` | `!SFX_GOLDSICKLECUT` | common | medium | 'object hit' column of the golden sickle (tool id 17) |
| $14 | `Sfx_SickleSwing` | `!SFX_SICKLESWING` | 16 | medium | 'no object' column of sickle and golden sickle (swing on a plain tile) |
| $15 | `Sfx_AxeHitObject` | `!SFX_AXEHITOBJECT` | 35 | medium | 'object hit' column of the axe (tool id 4), property bit 3 |
| $16 | `Sfx_GoldAxeHitObject` | `!SFX_GOLDAXEHITOBJECT` | 35 | medium | 'object hit' column of the golden axe (tool id 20) |
| $17 | `Sfx_HammerHit` | `!SFX_HAMMERHIT` | common | medium | hammer (tool id 3), both columns |
| $18 | `Sfx_GoldHammerHit` | `!SFX_GOLDHAMMERHIT` | common | medium | golden hammer (tool id 19), both columns |
| $19 | `Sfx_Bell` | `!SFX_BELL` | 36 | high | US tool table entry for the bell (tool id 11, 'object hit' column) and the 'correct answer' ding of the Egg Festival script (AI script 0x28); the EU/DE table has no sound there |
| $1A | `Sfx_Unk1A` | `!SFX_UNK1A` | 13 | none | no caller in the US code or data (not referenced by any literal, table or AI script) |
| $1B | `Sfx_SeedSow` | `!SFX_SEEDSOW` | common | high | seed bags (tool ids 5-8 and 12), both columns |
| $1C | `Sfx_Unk1C` | `!SFX_UNK1C` | 37 | none | no caller in the US code or data (not referenced by any literal, table or AI script) |
| $1D | `Sfx_Unk1D` | `!SFX_UNK1D` | 30 | none | no caller in the US code or data (not referenced by any literal, table or AI script) |
| $1E | `Sfx_Unk1E` | `!SFX_UNK1E` | 30 | none | no caller in the US code or data (not referenced by any literal, table or AI script) |
| $1F | `Sfx_Unk1F` | `!SFX_UNK1F` | 39 | none | no caller in the US code or data (not referenced by any literal, table or AI script) |
| $20 | `Sfx_HouseEventUnk20` | `!SFX_HOUSEEVENTUNK20` | 33 | low | fAreaEvents_House when event6 flag $0020 is set (set from fGameEngine map-flag handling when strcDialogDisplay.mapFlags & $0410); purpose unknown |
| $21 | `Sfx_Unk21` | `!SFX_UNK21` | 20 | none | no caller in the US code or data (not referenced by any literal, table or AI script) |
| $22 | `Sfx_HouseEventUnk22` | `!SFX_HOUSEEVENTUNK22` | 14 | low | fAreaEvents_House, played twice (waits 20 and 30 frames) when event6 flag $0200 is set (random 1/8 roll in the object-map update); purpose unknown |
| $23 | `Sfx_CutsceneUnk23` | `!SFX_CUTSCENEUNK23` | 20 | low | AI script 0x23 starts with it right after the fade-in (voice 7, 60 frames); the scene was not identified |
| $24 | `Sfx_InteractionUnk24` | `!SFX_INTERACTIONUNK24` | 20 | low | fPlayerInteraction0x35 (voice 7, 120 frames); the interaction was not identified |
| $25 | `Sfx_Unk25` | `!SFX_UNK25` | 28 | none | no caller in the US code or data (not referenced by any literal, table or AI script) |
| $26 | `Sfx_Unk26` | `!SFX_UNK26` | 31 | none | no caller in the US code or data (not referenced by any literal, table or AI script) |
| $27 | `Sfx_Unk27` | `!SFX_UNK27` | 20 | none | no caller in the US code or data (not referenced by any literal, table or AI script) |
| $28 | `Sfx_WaterPour` | `!SFX_WATERPOUR` | 17 | high | watering can and sprinkler entries of the tool table (tool ids 16 and 21), voice 7 |
| $29 | `Sfx_Unk29` | `!SFX_UNK29` | 15 | none | no caller in the US code or data (not referenced by any literal, table or AI script) |
| $2A | `Sfx_Unk2A` | `!SFX_UNK2A` | 18 | none | no caller in the US code or data (not referenced by any literal, table or AI script) |
| $2B | `Sfx_Unk2B` | `!SFX_UNK2B` | 16 | none | no caller in the US code or data (not referenced by any literal, table or AI script) |
| $2C | `Sfx_Unk2C` | `!SFX_UNK2C` | 17 | none | no caller in the US code or data (not referenced by any literal, table or AI script) |
| $2D | `Sfx_Unk2D` | `!SFX_UNK2D` | 17 | none | no caller in the US code or data (not referenced by any literal, table or AI script) |
| $2E | `Sfx_Unk2E` | `!SFX_UNK2E` | 17 | none | no caller in the US code or data (not referenced by any literal, table or AI script) |
| $2F | `Sfx_Unk2F` | `!SFX_UNK2F` | 7 | none | no caller in the US code or data (not referenced by any literal, table or AI script) |
| $30 | `Sfx_Unk30` | `!SFX_UNK30` | 38 | none | no caller in the US code or data (not referenced by any literal, table or AI script) |
| $31 | `Sfx_Unk31` | `!SFX_UNK31` | 6 | none | no caller in the US code or data (not referenced by any literal, table or AI script) |

Notes:
- The effects used by the tool table are named after the tool and the column, not after their sound, so `Sfx_ToolHitGround` is shared by plow
  and axe (both tiers) in the 'no object' column.
- The ids 9-14, 26, 28-31, 33, 37-39 and 41-49 are not requested by any US code path or AI script; they may be used by other regions or be
  leftovers (sample ids in the table above show that several own dedicated samples).
- Only EU/DE differ in the tool table (no bell sound); other regions were not checked for further callers.

### 13.3 Song names derived from the code

| Track id | Name | Evidence |
|---|---|---|
| 5 | `sAudioTrack_Town` | emulator dump (section 12) |
| 12 | `sAudioTrack_Funeral` | selected by AI script 0x20 (`AICMD0x00_SetMusic($0C, ...)`), the cutscene whose dialogs are the burial of a cow (dialogs `$0315`, `$0316`, `$038A`) |
| 20 | `sAudioTrack_RainIndoors` | `fAudioEngine_SelectMapMusic`: rainy map flag in areas `$15`-`$30` (houses and shops) plays track 20, elsewhere track 19 (`Rain`) |
| 21 | `sAudioTrack_WeatherFair` | `fAreaEvents_House` plays it (then resumes the map music) when event6 flag `$0100` is set, which `fWeatherForecast_828C09` does for `!WEATHER_FAIR` |
| 25 | `sAudioTrack_WeatherCalm` | same, flag `$0080` for `!WEATHER_CALM` |
| 23 | `sAudioTrack_Id23` | left unnamed: no US code path, map music set or AI script selects it (track 24, `Bell`, is the one with the same sample) |

The role of ids 21 and 25 is certain (they are jingles played in the house for the weather forecast), the English words describe the
forecast type they belong to, not their melody.
