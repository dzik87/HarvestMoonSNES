# Per-area data tables

Four tables of the code banks are indexed by the **area id** (`strcMap.loadAreaId`, `!AREA_*` in `src/common/enums.asm`, `$00-$5F`).
Their sources live under `assets/areas/` (extracted from the ROM by `tools/extract_steps/areas.py`; the names and the table layout are structure: `defs/areas/{areas.csv,layout.json,blob_addresses.json}`), the generator is `tools/maps/areadata.py` (`build` -> `build/gen/maps/*.asm`, `check`), and the
generated files are included by the code at the place of the former data (same labels, same offsets, bit-identical ROM).

| Table | ROM | Included by | Source |
|---|---|---|---|
| `aTileMapData` (96 x ptr16) + descriptors | `$80:AA7C` | `src/code/bank_80/tilemaps.asm` | `areas.csv` (column `gfx`) + `area_gfx.json` |
| `aScreenTransitionTable` (59 x 8 B) | `$80:B6F5` | `src/code/bank_80/tilemaps.asm` | `screen_transitions.csv` |
| `pObjectMap` (96 x ptr24), `pObjectMap2` (96 x ptr24), `sObjectMap2_0xNN` x 7 | `$82:B174`.. | `src/code/bank_82/object_data.asm` | `areas.csv` (`object_map`, `object_props`) + `object_props/*.txt` |
| `pAudioEngine_MapMusic` (96 x ptr16) + `aAudioEngine_MapMusicId_*` x 12 | `$80:B8E7` | `src/code/bank_80/audio_data.asm` | `areas.csv` (`music`) + `area_music.json` |

## areas.csv (`defs/areas/areas.csv`, committed structure)

`id,name,gfx,object_map,object_props,music` - one row per area. `name` is the enum constant (checked against `enums.asm`), the other columns are the labels
the four tables point to. `PTR24_None` (object map / property table) and `PTR16_None` (music) mark areas without that data. The object maps
themselves are `assets/maps/sObjectMap_*.json` (`tools/maps/objmap.py`); `check` verifies that the `areas` list of each map file equals the rows
that use it. Several areas share one blob (the four seasons of the farm use `sObjectMap_DefaultFarm`).

## area_gfx.json - graphics descriptors

`fTileMap_MapChangeHandler` (`$80:A7C6`) reads the descriptor of the area when it is loaded:

| Field | Bytes | Meaning |
|---|---|---|
| `preset` | `db` | graphics preset (BG layout, `Table_*_Presets` in `core.asm`) - full format only |
| `flags` | `dw` | `!AFLAGS_*` or-ed into `strcDialogDisplay.mapFlags` - full format only |
| `room_w`, `room_h` | `db`,`db` | room size in 16-tile screens (width selects the row stride, `mapMultiWidth`) |
| `tilemaps`, `charmaps` | `db`,`db` | number of compressed tile blobs / name table blobs that follow |
| `cam` | 4 x `dw` | player offset X, camera offset X, player offset Y, camera offset Y - full format only |
| `loads` | (`dw`,`dl`) x (`tilemaps`+`charmaps`) | VRAM word destination, compressed blob label (`Tiles_*`, `Screen_*`/`ScreenRaw_*` in `defs/gfx/banks.json`) |

Areas `$00-$56` use the full format, areas `$57-$5F` (rain / clouds / snow overlays, intro scroll, logos, menu backgrounds) the short one without
preset, flags and camera values. The tile blobs come first, the name tables last. The descriptors are in area id order (= ROM order); the
graphics tools (`tools/gfx/pngsync.py`, `palette_map.py`) read this file too. `check` verifies that every blob exists in the bank layout and that
the number of loads matches.

## screen_transitions.csv

`aScreenTransitionTable` rows `idx,dest_area,b1,b2,flags,x,y`: the target area (plus the current season when `flags` bit 0 is set, bit 6 = day dependent),
two bytes that are not decoded yet, the flags and the player start position (x, y words). The index is byte 0 of a property row (below).

## object_props/*.txt - object property tables

`sObjectMap2_0x00 .. 0x06`: 256 rows of 4 bytes, indexed by the object id found in the object map (`strcMap.pSelected`, loaded by `fObjectMap_LoadData`).
Format `ID: b0 b1 b2 b3`. Several systems read them: `b0` is the screen transition index (`aScreenTransitionTable`) for door tiles and the replacement
tile for tool and carry actions (`fSetTileAtCoords`); other bytes hold direction/season masks (footstep sounds, `sound.asm`). The meaning of the bytes is only partly known.

## area_music.json

12 sets of 4 track ids (spring, summer, fall, winter). `pAudioEngine_MapMusic` picks the set by area id, the engine indexes it by the season.

## Other small tables

`assets/tables/map_room.json` (`nMapRoomRowStrideTable`, `nMapRoomSizeTable`, indexed by the room width) and `assets/tables/tool_sounds.json`
(`nSoundEffectSampleTable`) are plain value lists handled by `tools/data/smalltables.py` (see `docs/formats/menu-data.md`).
