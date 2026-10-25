# Data blocks of the code banks

`tools/data/datablocks.py` (`build`, `check`) turns `assets/tables/blocks/<name>.tbl` into `build/gen/blocks/<name>.asm`; the code includes each block with one `incsrc` at the place
of the former data (same labels and offsets, so pointers and the ROM bytes are unchanged). A `.tbl` file holds only labels, `db/dw/dl` rows, `if !REGION_xx` variants and comments;
`blocks/manifest.json` lists the blocks and the file that includes each. Tables with understood columns have richer sources instead: `assets/areas/` (`area-data.md`),
`assets/tables/*.json` (`menu-data.md`), `assets/gfx/presets.csv` (below), `assets/dialogs/` (`dialog-tables.md`), `assets/ai/` (AI scripts).

| Block | Included from | Labels | Data rows | First labels | Content |
|---|---|---|---|---|---|
| `palette_anim_scripts` | `bank_80/data_tables.asm` | 240 | 818 | `Table_80DD5B`, `aPaletteAnimScript_FarmSpring_FarmSummer_T01_Slot5`, `aPaletteAnimScript_FarmSpring_FarmSummer_T01_Slot6` | palette animation scripts (colour/slot command lists) and the animation slot tables |
| `palette_tables` | `bank_80/data_tables.asm` | 14 | 834 | `sData42_80B9D7`, `sData42_80B9DC`, `sData42_80B9DF` | `aPalettes` (palette index -> ptr24), `aMapPalettesIndexes` (6 palette slots per area), `aMapPalettesId`, `pSubrutineTable_80BEEC` (per area/season/time palette animation routines) |
| `carried_items` | `bank_81/items_misc.asm` | 74 | 715 | `pItemCarriedTable_8196AF`, `pItemCarriedSubrutines`, `aItemCarriedFrames_01_Mushroom` | carried item table, handler pointers and the carried item animation frame lists |
| `item_subroutines` | `bank_81/items_misc.asm` | 1 | 96 | `pItemSubrutines_81A9F6` | item action handler pointer table |
| `tile_scripts` | `bank_81/items_misc.asm` | 77 | 882 | `Table_81B363`, `pTable_81B963`, `aTileScript_00` | tile change scripts (`fTileScript_Update` 7-byte records: tile, x, y, delay; `$FFFF` end, `$FFFE` jump) and their pointer table `pTable_81B963` |
| `love_ranges` | `bank_81/player_actions.asm` | 11 | 522 | `sSmallSpriteData`, `.loveRange0`, `.loveRange1` | love / happiness threshold ranges of the villagers |
| `player_action_jump_table` | `bank_81/player_actions.asm` | 1 | 29 | `aPlayerAction_JumpTable` | player action handler jump table (`strcPlayer` action id) |
| `player_interaction_flags` | `bank_81/player_update.asm` | 2 | 6 | `aPlayerInteraction_SetFlags`, `aPlayerInteraction_ResetFlags` | interaction flag set / reset masks |
| `player_update_jump_table` | `bank_81/player_update.asm` | 1 | 88 | `.aJumpTable` | player update jump table |
| `weather_dialog_ids` | `bank_81/player_update.asm` | 1 | 8 | `aWeatherDialogId` | dialog id of the weather forecast per weather type |
| `day_event_tables` | `bank_82/game_events.asm` | 5 | 5 | `.e_Summer30thDay`, `.e_Unknown1`, `.e_Unknown2` | per-day event flag lists of the calendar |
| `interaction_items` | `bank_82/interaction_data.asm` | 1 | 44 | `aInteractionItemTable` | item interaction table |
| `system_transfer_data` | `bank_82/system.asm` | 3 | 51 | `nSystemTranferData_82E666`, `nSystemTranferData_82E6D2`, `aSystemTransferArgument` | VRAM transfer descriptors of the system screens |
| `tool_action_tables` | `bank_82/tools.asm` | 3 | 171 | `nCowFeedFlagsTable`, `aToolUsedAnimationTable`, `aToolUsedActionTable` | tool use animation / action tables and cow feed flags |
| `tool_sound_data_82` | `bank_82/tools.asm` | 1 | 8 | `nToolSoundData_829054` | tool sound ids |
| `farm_animal_positions` | `bank_83/game_engine.asm` | 3 | 13 | `aGameEngine_AddChickenPositionsData`, `aGameEngine_AddCowPositionsData`, `aGameEngine_ChickenEggBitMask` | barn / coop position tables and the egg bit mask |
| `area_events_jump_table` | `bank_83/map_engine.asm` | 1 | 96 | `.areaEventsJumpTable` | per-area event handler jump table (`fMapEngine` area events) |
| `ai_action_tables` | `bank_84/ai_engine.asm` | 4 | 98 | `aAIActions`, `pppAISelector`, `aAISetMask` | AI interpreter: command jump table `aAIActions` and the selector/mask tables |
| `game_object_offsets` | `bank_85/objects.asm` | 2 | 9 | `Table_858BD0`, `aGameObjectIndexOffsets` | game object index offsets |

## Graphics presets - `assets/gfx/presets.csv`

`tools/gfx/presets.py` (`build`, `check`): 11 presets (row = byte 0 of an area descriptor, `assets/areas/area_gfx.json`) x 24 PPU registers
(OBSEL, BGMODE, BG1SC-BG4SC, BG12NBA, BG34NBA, TM, TS, TMW, TSW, CGWSEL, CGADSUB, SETINI, W12SEL, W34SEL, WOBJSEL, WH0-WH3, WBGLOG, WOBJLOG). `fCore_ManageGraphicsPresets` copies the row to the
PPU registers; `pngsync.py` and `palette_map.py` read the same CSV to find the VRAM address of each background layer. Generated labels: `Table_<REG>_Presets`.
