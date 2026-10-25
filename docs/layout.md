# Project layout and ROM map (LoROM, 2 MB)

Mapping: LoROM, 64 banks of 32 KB ($80–$BF). Header and vectors: `src/code/header.asm` ($80FFB0).

| Banks | Contents | Source |
|---|---|---|
| $80–$85 | 65816 code (core, palette, tools, sound, game engine, maps, AI, input) | `src/code/bank_8x/` |
| $86–$87 | object animation data | `assets/objects/bank_8x/` (generated asm: `build/gen/objects/`) |
| $88–$91 | sprite graphics | `src/data/gfx/sprites/` |
| $92–$A0 | tile graphics | `src/data/gfx/tiles/` |
| $A1–$A6 | character graphics | `src/data/gfx/characters/` |
| $A7 | object maps | `assets/maps/*.json` (generated asm: `build/gen/maps/bank_A7.asm`) |
| $A8–$A9 | palettes | `src/data/gfx/palettes/` |
| $AA–$AC | JP dialogs (empty in US/EU/DE) | `assets/dialogs/jp/*.txt` (generated asm) |
| $AD–$B2 | audio (content looks like SPC700 program and data — to be confirmed) | `src/data/audio/` |
| $B3–$B5 | AI scripts (one file per script, `src/ai/us/scripts/`; EU/DE/JP as `if !REGION_xx` blocks, `docs/regions-ai.md`) | `src/ai/` |
| $B6–$BB | US/EU/DE dialogs (empty in JP) | `assets/dialogs/<region>/*.txt` (generated asm) |
| $BC–$BF | unused (zeros) | — |

## What lives in `src/`

Only code: `src/code`, `src/ai`, `src/common`, `src/main.asm` and the region/header files. Data is built from the editable sources under `assets/`
into git-ignored `build/gen/` (dialogs, object animation banks, object maps) or `assets/**` (`.bin`/`.pal`), see `docs/workflow.md`.
Still committed as assembly under `src/data/` (pending, owned by the graphics and audio work): `src/data/gfx/{sprites,tiles,characters,palettes}/bank_*.asm`
(label + `incbin` wrappers of the generated graphic blobs) and `src/data/audio/bank_*.asm` (wrappers of the audio blobs); `src/data/dialogs/macros.asm` is a macro file (code).

## Graphics sources

The `.bin` files under `assets/gfx/{tiles,sprites,characters}/` (banks $88-$A6) and the `.pal` files under `assets/gfx/palettes/` are generated, git-ignored build products
(`tools/build_assets.py`, run by `tools/build.py`). The sources are PNG sheets
(`assets/gfx/png/`), name-table text (`assets/gfx/tilemaps/`) and palette JSON, converted by `tools/gfx/pngsync.py` / `palette.py`; the ROM hash check in CI proves the generated
files are bit-identical to the original data. Audio blobs (`assets/audio/*.bin`) are still committed binaries. Palettes ($A8-$A9: `assets/gfx/palettes/`) and fonts (`assets/fonts/`) have their own
PNG/JSON sources. See `docs/formats/graphics-png.md`; which palette each sheet is displayed with (PNG viewing palette, `assets/gfx/palette_map.json`):
`docs/formats/graphics-palettes.md`.
The object animation frames assembled from the sprite banks (`assets/gfx/png/sprites_assembled/`) are derived output of
`tools/objects/spriteexport.py` (`docs/formats/sprite-assembly.md`); CI checks them against the object data.

## Code modules

The split of banks 80–85 is lossless (concatenating the modules gives exactly the former bank file).
Boundaries come from `notes.txt` (banks 80, 82, 83, 84) and from label-name clusters (81, 85).
Module names are provisional and may change as code naming progresses.
Every module (except the first in a bank) starts with a comment giving its start address.

## Naming conventions

Prefixes: `f` routine, `a` data array, `p` pointer, `s` structure/complex data, `n` number/constant,
`strc` RAM structure. Automatic DiztinGUIsh labels (`DATA8_xxxxxx` etc.) are being replaced gradually.

## Regional builds

Banks whose content differs per release ($94 $95 $9A $9B $9E $9F $A5 $A6 $A9 $AA-$AC $B6-$BB, plus the code/AI banks) are described in
`docs/regions.md`. In the graphics banks the blob order is the same in every release; padding is `fill align $8000`.
