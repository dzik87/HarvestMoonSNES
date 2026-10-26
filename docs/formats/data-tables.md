# Typed data tables of the code banks

`tools/data/tabledata.py` (`build`, `check`) turns `assets/tables/data/<name>.csv` into `build/gen/blocks/<name>.asm`; the code includes each table with one `incsrc` at the place of the former
data (same labels and offsets, so pointers and the ROM bytes are unchanged). `manifest.json` lists the tables and the source file that includes each (`check` requires exactly one include).
Tables with other sources: `assets/areas/` (`area-data.md`), `assets/tables/*.json` (`menu-data.md`), `assets/gfx/presets.csv` (below), `assets/dialogs/` (`dialog-tables.md`), `assets/ai/` (AI scripts).

## Source format

A source is a text file of directives and CSV rows with **named, typed columns**; the leading `#` block of each file documents the record format (fields, meaning, confidence).

| Line | Meaning |
|---|---|
| `# text` | comment, kept as `; text` in the generated file |
| `@label NAME` | emits `NAME:` (global label or `.local` label of the include site) |
| `@columns a:u8,b:ptr16,...` | header of the following rows (default record) |
| `@record TAG a:u8,op:u16=$FFFE,...` | named record; a row `TAG: v1,v2` uses it. `name:type=CONST` is a fixed value that is not repeated in the rows (script opcodes) |
| `@if !REGION_JP` / `@elseif` / `@else` / `@endif` | release variants, the same conditions as the code (`src/common/region.asm`); rows of the branches are the bytes of that release |
| `v1,v2,...` | one row = one value per column |

Column types (`check` verifies that numbers fit the size):

| Type | Bytes | Meaning |
|---|---|---|
| `u8`, `u16`, `u24` | 1, 2, 3 | plain number (`$hex` or decimal) or an expression with enums (`!SFX_SEEDSOW`) |
| `flags8`, `flags16` | 1, 2 | bit mask |
| `enum8`, `enum16` | 1, 2 | value named by an enum of `src/common/enums.asm` (`!SFX_*`, `!AFLAGS_*` ...) |
| `ptr16`, `ptr24` | 2, 3 | address of code / data: a label name, resolved by the assembler (`$FFFF` = none) |
| `pos16` | 2 | pixel / tile coordinate |
| `tile16`, `bgr555` | 2 | tilemap word, SNES colour (`$7FFF` = white) |
| `dialog16` | 2 | dialog id (`$FFFF` = none) |
| `label` | - | not data: a non-empty cell emits that label in front of the row (rows the code addresses one by one) |
| `note` | - | not data: text that becomes a trailing comment (enum name of the row, item name) |
| `index` | - | not data: the running row number of the table (`$00`, `$01` ...) which `check` verifies, so a row cannot be moved or dropped by accident |

`tools/data/tabledata.py` also offers `rows_of(name, region)` (rows by column name for one release, branches evaluated), used by `palette_map.py` and `obj_names.py`.
`tools/analysis/usmap.py` replaces the `incsrc` line by the generated lines, so the source <-> ROM address map covers the generated data (the data lines are placed by the code in front of them).

## Tables

Confidence is the certainty of the *field meaning*: **certain** = proven by the use in the code and the data, **high** = structure and meaning read from the code, **medium** = structure known, the meaning of single
values or columns is inferred; columns named `unk` are kept for bytes whose purpose is not known.

| Table | Included from | Records (columns) | Content |
|---|---|---|---|
| `palette_anim_scripts` | `bank_80/data_tables.asm` | step: `color:bgr555, frames:u8`; `loop:` `op=$FFFE, target:ptr24`; `end:` `op=$FFFF` | colour animation scripts of the maps (`fPalette_ProcessColorAnimSlots`), 240 scripts. High. |
| `palette_tables` | `bank_80/data_tables.asm` | `aPalettes`: `palette:ptr24`; `aMapPalettesIndexes`: `early,day,evening,dusk,night,extra:u8` per area; `nPaletteOverwrite_80BD9C`: `color_a,color_b,color_c`; `sPallete_MarriedGirlTable`: `c0..c5`; `aMapPalettesId`: `obj_a,obj_b:u8`; `pSubrutineTable_80BEEC`: `routine:ptr16` (6 per area); sData42 scripts (step/loop/end) | map palettes, time-of-day indexes, colour animation routine table. High (sprite palette ids medium). |
| `carried_items` | `bank_81/items_misc.asm` | `pItemCarriedTable_8196AF`: `frames:ptr24`; `pItemCarriedSubrutines`: `handler:ptr16`; frames: `sprite:u16, flip:u8` per pose; found / sell / buy / shipping tables (dialog ids, profit, cost); `nItemCarriedIndexForTilemap`, `nSoundItemCarriedTable_81A308`, `aFixedDropPositionsXY` (`x,y`) | carried item poses, handlers, shop and shipping data. High (columns `unk` medium). |
| `item_subroutines` | `bank_81/items_misc.asm` | `handler:ptr16` | item handler per id. Medium. |
| `tile_scripts` | `bank_81/items_misc.asm` | patterns: `src_offset:u16, width:u8, height:u8, object_id:u16`; `script:ptr24`; steps: `tile:u16, x:pos16, y:pos16, delay:u8`; `loop:`/`end:`; shed: `tile_x,tile_y,tile_id,shed_row,shed_mask` | tile patterns and tile change scripts. High. |
| `love_ranges` | `bank_81/player_actions.asm` | `min:u16, max:u16` per heart (rows labelled `.loveRangeN`); `sprite_table_idx:u16, flip:u8` | love points -> hearts; player sprite object table. High / medium. |
| `player_action_jump_table` | `bank_81/player_actions.asm` | `handler:ptr16` (index = `!PACTION_*`) | player action handlers. Certain. |
| `player_interaction_flags` | `bank_81/player_update.asm` | `mask:flags16` | bit set / reset masks. Certain. |
| `player_update_jump_table` | `bank_81/player_update.asm` | `handler:ptr16` | interaction handlers. High. |
| `weather_dialog_ids` | `bank_81/player_update.asm` | `spring,summer,fall,winter:dialog16` per weather | forecast / festival dialog. High. |
| `day_event_tables` | `bank_82/game_events.asm` | `label, spring,summer,fall,winter:u8` | season indexed random event parameters. Medium. |
| `interaction_items` | `bank_82/interaction_data.asm` | `spring,summer,fall,winter:u8` per interaction | carried item created by an interaction. High. |
| `system_transfer_data` | `bank_82/system.asm` | `tile_a,tile_b:tile16` (word pairs); `dest0,dest1:u16` | system screen tilemap rows per release. Medium. |
| `tool_action_tables` | `bank_82/tools.asm` | `mask:flags16`; `handler:ptr16` (28 tools; animation table, action table) | tool use animation and action handlers. High. |
| `tool_sound_data_82` | `bank_82/tools.asm` | `voice:u8, sfx_no_object:enum8, sfx_object_hit:enum8` per tool | tool sounds. High. |
| `farm_animal_positions` | `bank_83/game_engine.asm` | `x:pos16, y:pos16`; `mask:flags16` | chicken / cow start positions, egg bits. High. |
| `area_events_jump_table` | `bank_83/map_engine.asm` | `handler:ptr16` (index = `!AREA_*`) | area event handlers. High. |
| `ai_action_tables` | `bank_84/ai_engine.asm` | `handler:ptr16`; `scripts:ptr24`; `mask:flags16` | AI command table, script set selector, bit masks. High. |
| `game_object_offsets` | `bank_85/objects.asm` | `mask:flags16`; `offset:u16` | object slot masks and array offsets ($24 bytes per object). High. |

Open questions (columns kept as `unk` or marked medium): `unk` of `aDialogData_ShippingProfit` and `aDialogsData_BuyItems` (first byte of the shop record, looks like the item id given), the sprite palette
columns `obj_a/obj_b` of `aMapPalettesId`, the meaning of the `extra` phase of `aMapPalettesIndexes` and `pSubrutineTable_80BEEC`, the tile meanings of `system_transfer_data`, and the exact event meaning of the
`day_event_tables` values.

## Graphics presets - `assets/gfx/presets.csv`

`tools/gfx/presets.py` (`build`, `check`): 11 presets (row = byte 0 of an area descriptor, `assets/areas/area_gfx.json`) x 24 PPU registers
(OBSEL, BGMODE, BG1SC-BG4SC, BG12NBA, BG34NBA, TM, TS, TMW, TSW, CGWSEL, CGADSUB, SETINI, W12SEL, W34SEL, WOBJSEL, WH0-WH3, WBGLOG, WOBJLOG). `fCore_ManageGraphicsPresets` copies the row to the
PPU registers; `pngsync.py` and `palette_map.py` read the same CSV to find the VRAM address of each background layer. Generated labels: `Table_<REG>_Presets`.
