# Harvest Moon (SNES) — decompilation

Reconstruction of compilable source code for the game. The **US** version is the base; JP/DE/EU are being moved
into the common tree. Assembler: [asar](https://github.com/RPGHacker/asar) 1.91.
Overriding rule: the build output must be **bit-identical** to the original ROM.

## Quick start

```
python tools/build.py [--region EU|DE|JP]  # generates .bin/.pal assets from PNG/JSON sources, builds, verifies hashes (asar: --asar, $ASAR or tools/bin/)
python tools/build_assets.py             # only generate the assets (needed before running individual checks/tests)
python tools/verify.py build/HarvestMoon.sfc --rom "original.sfc"   # per-bank diff report
```

ROMs are not stored in the repository. Reference values (size, CRC32, MD5, SHA-1) are in `tests/expected.json`.
CI (GitHub Actions) builds asar from source, assembles the ROM and compares the hashes on every push and PR.

## Repository layout

| Path | Contents |
|---|---|
| `src/main.asm` | entry point (LoROM mapping, include order) |
| `src/common/` | SNES registers, RAM map, structures, enums, code macros |
| `src/code/bank_80 … bank_85/` | 65816 code split into thematic modules; EU/DE/JP code as `if !REGION_xx` patch blocks (switch and WRAM layout: `src/common/region.asm`) |
| `src/ai/` | AI script interpreter: command definitions (`commands.asm`), region support (`region.asm`), US scripts (`us/`, EU/DE/JP as `if !REGION_xx` blocks) |
| `src/data/` | include wrappers of the graphics and audio blobs; everything else is generated from `assets/` into `build/gen/` |
| `assets/audio/` | audio sources: BRR samples as WAV + JSON, songs and SFX as text, the SPC700 driver as assembler source (`tools/audio/audioconv.py`) |
| `assets/objects/`, `assets/maps/` | object animation data (banks $86/$87) and object maps (bank $A7): the editable sources, see `docs/formats/object-data.md` |
| `assets/gfx/png/`, `assets/gfx/tilemaps/` | graphics sources: one indexed 16x16 PNG per sprite block / tile cell (`<kind>/<label>/t_NNNN.png`, `s_NNNN.png`) and name-table text (edit these, then `tools/gfx/pngsync.py import`; view whole sheets with `pngsync.py sheet`) |
| `tools/` | build, verification, migration tools (`tools/migration/`) |
| `docs/` | documentation (layout, workflow, migration log, findings, AI commands, naming maps) |
| `tests/` | reference hash values |

Graphics modding (PNG -> ROM): [`docs/formats/graphics-png.md`](docs/formats/graphics-png.md); palette of every graphic: [`docs/formats/graphics-palettes.md`](docs/formats/graphics-palettes.md).
Assembled object sprites / animation frames (rendered on demand into `build/`, `tools/objects/spriteexport.py`): [`docs/formats/sprite-assembly.md`](docs/formats/sprite-assembly.md).
Audio modding (WAV samples, text songs, SFX, SPC700 driver source -> blobs): [`docs/formats/audio-sources.md`](docs/formats/audio-sources.md); analysis of the sound system: [`docs/audio.md`](docs/audio.md).

Differences between the releases: [`docs/regions.md`](docs/regions.md) (code, graphics, fonts, palettes and dialogs; the complete EU/DE/JP ROMs are built bit-identically via `tools/build.py --region EU|DE|JP`), [`docs/regions-ai.md`](docs/regions-ai.md) (AI scripts, command level).

Details: [`docs/layout.md`](docs/layout.md), [`docs/workflow.md`](docs/workflow.md),
[`docs/migration-log.md`](docs/migration-log.md).
