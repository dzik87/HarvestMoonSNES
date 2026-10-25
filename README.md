# Harvest Moon (SNES) — decompilation

Reconstruction of compilable source code for the game. The **US** version is the base; JP/DE/EU are being moved
into the common tree. Assembler: [asar](https://github.com/RPGHacker/asar) 1.91.
Overriding rule: the build output must be **bit-identical** to the original ROM.

## Quick start

```
python tools/build.py                    # build + hash verification (asar: --asar, $ASAR or tools/bin/)
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
| `src/ai/` | AI script interpreter: command definitions (`commands.asm`) and per-region scripts |
| `src/data/` | graphics, tilemaps, objects, audio, dialogs |
| `tools/` | build, verification, migration tools (`tools/migration/`) |
| `docs/` | documentation (layout, workflow, migration log, findings, AI commands, naming maps) |
| `tests/` | reference hash values |

Details: [`docs/layout.md`](docs/layout.md), [`docs/workflow.md`](docs/workflow.md),
[`docs/migration-log.md`](docs/migration-log.md).
