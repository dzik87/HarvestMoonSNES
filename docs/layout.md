# Project layout and ROM map (LoROM, 2 MB)

Mapping: LoROM, 64 banks of 32 KB ($80–$BF). Header and vectors: `src/code/header.asm` ($80FFB0).

| Banks | Contents | Source |
|---|---|---|
| $80–$85 | 65816 code (core, palette, tools, sound, game engine, maps, AI, input) | `src/code/bank_8x/` |
| $86–$87 | object data | `src/data/objects/` |
| $88–$91 | sprite graphics | `src/data/gfx/sprites/` |
| $92–$A0 | tile graphics | `src/data/gfx/tiles/` |
| $A1–$A6 | character graphics | `src/data/gfx/characters/` |
| $A7 | tilemaps | `src/data/tilemaps/` |
| $A8–$A9 | palettes | `src/data/gfx/palettes/` |
| $AA–$AC | JP dialogs (empty in US/EU/DE) | `src/data/dialogs/jp/` |
| $AD–$B2 | audio (content looks like SPC700 program and data — to be confirmed) | `src/data/audio/` |
| $B3–$B5 | AI scripts (US: one file per script, `src/ai/us/scripts/`) | `src/ai/<region>/` |
| $B6–$BB | US/EU/DE dialogs | `src/data/dialogs/<region>/` |
| $BC–$BF | unused (zeros) | — |

## Graphics sources

The `.bin` files under `assets/gfx/{tiles,sprites,characters}/` (banks $88-$A6) are generated artefacts. The sources are PNG sheets
(`assets/gfx/png/`) and name-table text (`assets/gfx/tilemaps/`), converted by `tools/gfx/pngsync.py`; CI verifies they
reproduce the `.bin` files bit-exactly. Palettes ($A8-$A9: `assets/gfx/palettes/`) and fonts (`assets/fonts/`) have their own
PNG/JSON sources. See `docs/formats/graphics-png.md`.

## Code modules

The split of banks 80–85 is lossless (concatenating the modules gives exactly the former bank file).
Boundaries come from `notes.txt` (banks 80, 82, 83, 84) and from label-name clusters (81, 85).
Module names are provisional and may change as code naming progresses.
Every module (except the first in a bank) starts with a comment giving its start address.

## Naming conventions

Prefixes: `f` routine, `a` data array, `p` pointer, `s` structure/complex data, `n` number/constant,
`strc` RAM structure. Automatic DiztinGUIsh labels (`DATA8_xxxxxx` etc.) are being replaced gradually.
