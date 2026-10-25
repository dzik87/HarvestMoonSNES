# Harvest Moon (SNES) — decompilation

Reconstruction of compilable source code for the game. The **US** version is the base; JP/DE/EU are being moved
into the common tree. Assembler: [asar](https://github.com/RPGHacker/asar) 1.91.
Overriding rule: the build output must be **bit-identical** to the original ROM.

## Quick start

```
python tools/build.py                    # generates .bin/.pal assets from PNG/JSON sources, builds, verifies hashes (asar: --asar, $ASAR or tools/bin/)
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
| `src/code/bank_80 … bank_85/` | 65816 code split into thematic modules |
| `src/ai/` | AI script interpreter: command definitions (`commands.asm`), region support (`region.asm`), US scripts (`us/`, EU/DE/JP as `if !REGION_xx` blocks) |
| `src/data/` | graphics, tilemaps, objects, audio, dialogs |
| `assets/gfx/png/`, `assets/gfx/tilemaps/` | graphics sources: indexed PNG tile sheets and name-table text (edit these, then `tools/gfx/pngsync.py import`) |
| `tools/` | build, verification, migration tools (`tools/migration/`) |
| `docs/` | documentation (layout, workflow, migration log, findings, AI commands, naming maps) |
| `tests/` | reference hash values |

Graphics modding (PNG -> ROM): [`docs/formats/graphics-png.md`](docs/formats/graphics-png.md); palette of every graphic: [`docs/formats/graphics-palettes.md`](docs/formats/graphics-palettes.md).
Assembled object sprites / animation frames (derived PNGs + JSON, `tools/objects/spriteexport.py`): [`docs/formats/sprite-assembly.md`](docs/formats/sprite-assembly.md).

Differences between the releases: [`docs/regions.md`](docs/regions.md) (code banks), [`docs/regions-ai.md`](docs/regions-ai.md) (AI scripts, command level).

Details: [`docs/layout.md`](docs/layout.md), [`docs/workflow.md`](docs/workflow.md),
[`docs/migration-log.md`](docs/migration-log.md).
