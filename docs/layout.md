# Project layout and ROM map (LoROM, 2 MB)

Mapping: LoROM, 64 banks of 32 KB ($80–$BF). Header and vectors: `src/code/header.asm` ($80FFB0).

| Banks | Contents | Source |
|---|---|---|
| $80–$85 | 65816 code (core, palette, tools, sound, game engine, maps, AI, input) | `src/code/bank_8x/` |
| $86–$87 | object animation data | `assets/objects/bank_8x/` (generated asm: `build/gen/objects/`) |
| $88–$91 | sprite graphics | `assets/gfx/banks.json` (generated asm: `build/gen/gfx/sprites/`) |
| $92–$A0 | tile graphics | `assets/gfx/banks.json` (generated asm: `build/gen/gfx/tiles/`) |
| $A1–$A6 | character graphics | `assets/gfx/banks.json` (generated asm: `build/gen/gfx/characters/`) |
| $A7 | object maps | `assets/maps/*.json` (generated asm: `build/gen/maps/bank_A7.asm`) |
| $A8–$A9 | palettes | `assets/gfx/banks.json` (generated asm: `build/gen/gfx/palettes/`) |
| $AA–$AC | JP dialogs (empty in US/EU/DE) | `assets/dialogs/jp/*.txt` (generated asm) |
| $AD–$B2 | audio (SPC700 driver, BRR samples, songs and SFX; confirmed against 20 emulator dumps, `docs/audio.md` section 12) | `assets/audio/banks.json` (generated asm: `build/gen/audio/`) |
| $B3–$B5 | AI scripts: bodies = script DSL (one file per script, `src/ai/us/scripts/`; EU/DE/JP as `if !REGION_xx` blocks, `docs/regions-ai.md`); script pointer list, slot tables and NPC sprite tables are data | `src/ai/` (DSL) + `assets/ai/{scripts.json,npc_sprite_tables.txt}` (generated asm: `build/gen/ai/`) |
| $B6–$BB | US/EU/DE dialogs (empty in JP) | `assets/dialogs/<region>/*.txt` (generated asm) |
| $BC–$BF | unused (zeros) | — |

## What lives in `src/`

Only code (and the script DSL): `src/code`, `src/ai`, `src/common`, `src/main.asm` and the region/header files, apart from the table list below. Data is built from the editable sources under `assets/`
into git-ignored `build/gen/` (dialogs, object animation banks, object maps, area/menu/dialog tables, AI heads) or `assets/**` (`.bin`/`.pal`), see `docs/workflow.md`.
The graphics banks ($88-$A6, $A8-$A9) are generated too: `assets/gfx/banks.json` lists per bank the ORG, the blobs in ROM order (`*` = included through `!{REGDIR}`, a release has its own version) and the
trailing padding; `tools/data/gfxbanks.py build` (step "graphics bank asm" of `tools/build_assets.py`) writes `build/gen/gfx/<kind>/bank_XX.asm` (label + `incbin` + `fill`), which `src/main.asm` includes.
The audio banks ($AD-$B2) work the same way: `assets/audio/banks.json` (ORG and blob labels in ROM order; every bank ends with `fill align $8000`) -> `build/gen/audio/bank_XX.asm`, written by `tools/audio/audioconv.py build` together with `build/gen/audio/audio_tables.inc` (the 65816-side sample/track tables included by `src/code/bank_83/audio.asm`).
The AI banks ($B3-$B5): `tools/ai/aidata.py build` writes `build/gen/ai/head_B3..B5.asm` (ORG, `ppAIScriptingList`, the 214 NPC sprite tables) and `slots_NN.asm` (the entry-point table at the start of every script) from `assets/ai/`.
The script bodies themselves (`%AICMD...` macro calls) stay in `src/ai/us/scripts/` on purpose: they already are a readable high-level script language (code in a DSL), region differences are `if !REGION_xx` blocks inside it, `docs/regions-ai.md`.
The only file under `src/data/` is `src/data/dialogs/macros.asm`, a macro file (code).

## Data tables of the code banks

The tables that used to sit between the routines are generated too (formats: `docs/formats/area-data.md`, `menu-data.md`, `dialog-tables.md`):

| Former place | Content | Source (`assets/`) | Generator (`build_assets.py` step) |
|---|---|---|---|
| `bank_80/tilemaps.asm` | `aTileMapData` + 96 area graphics descriptors, `aScreenTransitionTable`, `nTable_80AA68/72` | `areas/` (`areas.csv`, `area_gfx.json`, `screen_transitions.csv`), `tables/map_room.json` | `tools/maps/areadata.py`, `tools/data/smalltables.py` |
| `bank_82/object_data.asm` | `pObjectMap`, `pObjectMap2`, 7 object property tables | `areas/` (`areas.csv`, `object_props/*.txt`) | `tools/maps/areadata.py` |
| `bank_80/audio_data.asm` | `pAudioEngine_MapMusic` + 12 music sets, `nToolSoundData_80B8CD` | `areas/` (`areas.csv`, `area_music.json`), `tables/tool_sounds.json` | `tools/maps/areadata.py`, `tools/data/smalltables.py` |
| `bank_82/menu.asm` | name entry cursor grids, save slot tables, `sYearOrdinal`, title palette animations | `menu/name_input.txt`, `tables/main_menu.json` | `tools/menu/nameinput.py`, `tools/data/smalltables.py` |
| `bank_83/dialog.asm` | font page pointers, option / number / text variable tables, `aDialogPointers` | `dialogs/number_vars.csv`, `dialogs/<region>/{text_vars.csv,text_tables.json}`, font blobs, dialog texts | `tools/dialogs/texttables.py` |
| `src/ai` | script pointer list, script slot tables, NPC sprite tables | `ai/scripts.json`, `ai/npc_sprite_tables.txt` | `tools/ai/aidata.py` |

The remaining data tables of the code banks are generated from **typed CSV tables with named columns** (`tools/data/tabledata.py`, `assets/tables/data/*.csv`, record formats and inventory in `docs/formats/data-tables.md`):
palette index/animation tables and scripts (`bank_80/data_tables.asm`), tile scripts, carried item tables and item handler pointers (`bank_81/items_misc.asm`), love ranges and the player action jump table
(`bank_81/player_actions.asm`), player update tables, event/tool/system/interaction tables (`bank_82`), area event jump table, farm animal positions, the AI command table and game object offsets.
The PPU graphics presets of `core.asm` are `assets/gfx/presets.csv` (`tools/gfx/presets.py`).

### What stays in `src/` and why
- All instructions (`src/code/bank_80..85`), the macros/constants (`src/common`), the header and vector files, `src/main.asm`: code.
- The AI script bodies (`src/ai/us/scripts/script_*.asm` and `src/ai/commands.asm`): the script DSL (macro calls), see above.
- Data runs shorter than 5 rows that sit directly in front of the routine that reads them (single constants, 1-4 row lookup tables, inline `db` operands after a `JSR`/`JSL`) and
  data that is part of a code stream (inline arguments, `pad` lines, region patch blocks that mix code and data); moving them would add an include per few bytes without making them any more editable.
- Nothing else: every data table that is read by the code is generated (named-column CSV / JSON / text sources under `assets/`); columns whose purpose is not known are called `unk` in the source and documented in `docs/formats/data-tables.md`.

## Graphics sources

The `.bin` files under `assets/gfx/{tiles,sprites,characters}/` (banks $88-$A6) and the `.pal` files under `assets/gfx/palettes/` are generated, git-ignored build products
(`tools/build_assets.py`, run by `tools/build.py`). The sources are composed PNG images (object frames `assets/gfx/png/frames/`, name table screens `assets/gfx/png/screens/`, remainder sheets `assets/gfx/png/{tiles,sprites}/`), name-table text (`assets/gfx/tilemaps/`) and palette JSON, converted by `tools/gfx/pngsync.py` / `palette.py`; the ROM hash check in CI proves the generated
files are bit-identical to the original data. Audio blobs (`assets/audio/*.bin`) and `build/gen/audio/{bank_XX.asm,audio_tables.inc}` are generated by `tools/audio/audioconv.py build` from the sources in `assets/audio/{samples,tracks,sfx,driver}` and `audio.json` (`docs/formats/audio-sources.md`). Palettes ($A8-$A9: `assets/gfx/palettes/`) and fonts (`assets/fonts/`) have their own
PNG/JSON sources. See `docs/formats/graphics-png.md`; which palette each sheet is displayed with (PNG viewing palette, `assets/gfx/palette_map.json`):
`docs/formats/graphics-palettes.md`.
The object animation frames assembled from the sprite banks are rendered on demand into `build/sprites_assembled/` (never committed) by
`tools/objects/spriteexport.py` (`docs/formats/sprite-assembly.md`); CI exports and checks them against the object data.

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
