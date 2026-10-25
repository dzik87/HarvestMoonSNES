# Which palette does a graphics blob use?

Result of tracing the palette path of the engine for every tile blob (`sCompressedTiles_*`, banks $92-$A0) and every sprite bank
(`Sprites_88..91`). The machine readable table is [`assets/gfx/palette_map.json`](../../assets/gfx/palette_map.json); it is
derived from the sources by `tools/gfx/palette_map.py` (`build` writes it, `check` runs in CI and fails when the sources, the
table or the table in this document disagree). `tools/gfx/pngsync.py export` uses it to write the real colours into the PLTE
chunk of every PNG (see "Consequences for the PNGs" below).

Confidence legend used below and in the table: **[C]** confirmed from code (address given), **[D]** derived from the data by
`palette_map.py` (name tables, object frames), **[I]** inferred.

## 1. CGRAM layout and the palette files [C]

* A palette (`sPalette_0xNN`, 512 bytes, 256 colours, `assets/gfx/palettes/`) is **only half used**. Every loader copies the
  first `$100` bytes = sub-palettes (rows) **0-7**: `fPalette_LoadFirstHalf` ($8091CF, loop `$8091F5-$809205`) copies them to
  `$7F0900+$000` (= CGRAM `$00-$7F`, the **BG** rows 0-7), `fPalette_LoadSecondHalf` ($809208, `$80922E-$80923E`) to
  `$7F0900+$100` (= CGRAM `$80-$FF`, the **OBJ** rows 0-7). Rows 8-15 of every file (bytes `$100-$1FF`) are never read by any
  code; they hold a rainbow test pattern (`000000 F70000 F7A500 ...`) and in a few files zeros. [D]
* CGRAM is written from `$7F0900` with one `$200`-byte DMA after every map change (`$8098DB-$8098F0`, at the end of the map load
  sequence of `routines.asm`, `$8098B5-$8098EC`); palette animation (`fPalette_ProcessColorAnimSlots`, `$808F3C`) re-sends
  `$100` bytes (BG half). `$7F0B00` holds the next time-of-day palette, `$7F0D00` the reference copy for the fade.
* The palette *index* used by the code is an index into the pointer table `aPalettes` ($80B9FD, 0x75 x 3 bytes), **not** the
  number in the label: `aPalettes[1] = sPalette_0x0B`, `aPalettes[0x12] = sPalette_0x3A`, ... (the full table is
  `aPalettes` in `palette_map.json`). Every label occurs exactly once; `sPalette_0x14` and `sPalette_0x74` are never selected.
* Colour 0 of every row is transparent (BG: backdrop, OBJ: nothing drawn). For 4bpp BG tiles of the BG1/BG2 layers the colour is
  `CGRAM[row*16 + pixel]`, for OBJ `CGRAM[128 + row*16 + pixel]`.

## 2. How the BG palette of a map is chosen [C]

```
strcMap.loadAreaId --x6--> aMapPalettesIndexes ($80BB5C)  6 bytes per area: 5 time slots + 1 spare
time slot (fPalette_ChangeTimePallete $8092E2, fPalette_AdjustTimePalette $809501), from nCurrentTimeID:
    0: < 7   1: 7-14 (day)   2: 15-16   3: 17   4: >= 18          $FF = slot not used (fPalette_AdjustTimePalette skips it)
slot byte --> aPalettes index --> sPalette_0xNN --> first $100 bytes --> CGRAM $00-$7F
```

The map load sequence is `fTileMap_MapChangeHandler` ($8098B5), `fPalette_ChangeTimePallete` ($8098B9), `fPalette_PrepareSpritePalette`
($8098BD), `fPalette_LoadMapPallete` ($8098C5, loads slot 4 = night into `$7F0B00` as the fade target). The engine fades
colour by colour from one slot palette to the next (`fPallete_ChangeHandler` $80900C, one step per `$20` frames), so the slot palettes are
key frames and intermediate colours exist only at run time. `palette_map.json` records the five slot palettes of every area
(`areas.<id>.bg_palettes`); the PNGs use the **day slot (1)**, or the first existing slot when the day slot is `$FF`.

### Screens with an explicit palette (areas $5B-$5F) [C]

Title, logo and menu screens do not use `aMapPalettesIndexes`. After `fTileMap_MapChangeHandler` they call `fPalette_LoadFirstHalf` with a
constant `aPalettes` index (preset 3 = title, preset 4 = menus, passed to `fCore_ManageGraphicsPresets` before the load):

| Area | Screen | Preset | `aPalettes` index | Palette | Call site |
|---|---|---|---|---|---|
| $5B | title: scrolling intro farm (`sIntroFarmScrool`) | 3 | $6D | `sPalette_0x6C` | $82DA07, $82DB5B, $82DF29 |
| $5C | title: HARVEST MOON logo (name table only, tiles of $5B) | 3 | $6D | `sPalette_0x6C` | $82DF29 (area $5B and $5C are loaded one after the other, $82DF16/$82DF20) |
| $5D | NATSUME logo | 3 | $6E | `sPalette_0x6D` | $82D7AD |
| $5E | menu backgrounds (new/load game slot select) | 4 | $6F | `sPalette_0x46` | $82DFCB, $82E22A |
| $5F | menu characters (name input) | 4 | $6F | `sPalette_0x46` | $82E866 |

### Weather overlays (areas $57-$5A) [C][D]

`sRainOverlay`, `sCloudsOverlay`, `sSnowOverlay`, `sHeavySnowOverlay` are loaded on top of the current map by
`$80978F-$809838` (`routines.asm`) and have **no palette of their own**: they are drawn with the sub-palette their name table names (always 0) of the
palette of whichever outdoor map is active. Their tiles only use pixel values 12-15 (rain: 12-15, clouds: 15 only, snow: 12-15,
heavy snow: 13-15) and the weather code overwrites exactly those colours of row 0 with palette-animation scripts
(`fCore_Store0x72To0x42AtIndex` with colour index `$0C-$0F`, row 0; scripts `sData42_80B9D7...` at `$80B9D7`; calls `$8097AE`, `$8097C9`,
`$8097E4`, `$8097FF` for rain, `$809853` and following for snow). So the real colours of the overlays are the script colours, not the map palette; the PNG shows
`FARMSPRING` day, row 0, as a stand-in.

## 3. Name table to sub-palette [C][D]

Preset geometry comes from `fCore_ManageGraphicsPresets` ($808C59) and its tables at `$808B44-$808C4B`
(`Table_BG1SC_Presets` $808B5A, `Table_BG2SC_Presets` $808B65, `Table_BG3SC_Presets` $808B70, `Table_BG12NBA_Presets` $808B86,
`Table_BG34NBA_Presets` $808B91, `Table_TM_Presets` $808B9C; all presets are BG mode 1: BG1/BG2 4bpp, BG3 2bpp):

| Preset | Used by | BG1 name table / chars | BG2 name table / chars | BG3 name table / chars (2bpp) |
|---|---|---|---|---|
| 0 | 63 maps (farm, town, woods, interiors ...) | $6000 64x64 / $2000 | $7000 32x64 / $2000 | $7800 / $5000 |
| 1 | mountain-top maps ($31-$3B) | same as 0 | same | same |
| 2 | tool shed ($26) | same as 0 | same | same |
| 3 | title screens ($5B-$5D), set by `$82D792`, `$82D9D8`, `$82DB1D`, `$82DEF1` | $6000 64x64 / $2000 | $7000 64x64 / $2000 | $7800 / $5000 |
| 4 | menus ($5E, $5F), `$82DFBE`, `$82E21D`, `$82E859` | $1000 64x64 / $2000 | $6000 64x64 / $2000 | $7800 / $5000 |
| 5 | credits and ending text maps ($4B-$56) | $1000 64x64 / $2000 | $6000 64x64 / $2000 | $7800 / $2000 |
| 6-10 | **never selected** (no area header and no call uses them) | $5000 / $1000 | $5800 / $1000 | $0800 / $0000 |

Every map entry (`aTileMapData` $80AA7C, entries from `sFarmSpringMap` $80AB3C) lists tile blobs with a VRAM word destination
(`$2000`, `$3000`, `$4000`, `$5000`: each blob is `$1000` words = 256 4bpp tiles) and name tables with a destination (`$6000`,
`$7000`, `$1000`); `fTileMap_MapChangeHandler` ($80A7C6) decodes them (header: preset, flags, size, `n` tile blobs, `m` name
tables, camera clamps; areas >= $57 have no preset/flags/clamps).

`palette_map.py` assigns every name table to the BG whose name-table range contains its destination, then for every entry
`w` computes the character address `char_base + (w & $3FF) * 16` (words) and finds the tile blob that covers it:
**bits 10-12 of `w` are the sub-palette (CGRAM row) that tile is displayed with.** Only non-empty tiles count. For each blob the
table records, per tile (`tile_subs`, 256 characters, `.` = not referenced), the dominant sub-palette; `sub` in the sidecar is the
most used one (cell count of the name tables of the primary area) and `subs_used` lists all. No static name table uses a 2bpp (BG3)
view of any of these blobs.

Primary palette of a blob: the **day palette of the lowest-numbered area** whose name tables reference the blob (a blob shared by
several maps lists every other area/palette combination as `alternatives`, and `used_by` holds all of them with VRAM destination,
BG, preset, sub-palette cell counts and the five slot palettes).

Evidence check: the farm, town and room maps rendered with these rules (`pngsync.py preview`) look right in game colours (grass,
roofs, water, pink trees on the town square); the weather overlays confirm the rule independently (see section 2).

## 4. Sprite banks ($88-$91) [C][D]

* OBJ colours are CGRAM `$80-$FF`: row `r` = `CGRAM[128 + r*16 ..]` = row `r` of the **OBJ palette** `aMapPalettesId` ($80BE44, 2 bytes per area: day,
  from 18:00) selects: `$6B -> aPalettes -> sPalette_0x6F` (day), `$6C -> sPalette_0x70` (night) in every area that has sprites
  (`fPalette_PrepareSpritePalette` $809329, `$80935C`). Daily flags `daily3 & $0080/$0100/$0200` replace it with
  `sPalette_0x71/0x72/0x73` (`$80936E-$80939F`).
* The OBJ row of a sprite component is **bits 0-2 of its attribute byte** (object frames, banks $86/$87, 5-byte components, see
  `docs/formats/object-data.md` section 6; engine code `$858582-$8585AF`). The sprite sheet of a component is bank
  `$88 + (tile_id >> 8)`, the 16x16 sprite inside the sheet is `tile_id & $FF` (block `(id >> 6) & 3` of `$2000` bytes, cell
  `slot = id & $3F`, tile column `(slot & 7) * 2`, tile row `(slot >> 3) * 2`).
  `palette_map.py` walks every animation list of both banks (all frames referenced by a step; the 7 unreferenced frames are dead
  data) and counts the OBJ row of each component per sprite: `sprite_rows` is a 256-character string per bank (row of each sprite id, `.`
  unused), `multi_row_sprites` the 5 sprites that are used with two rows (`Sprites_8C8000` x4, `Sprites_918000` x1), and the
  sidecar `sub` is the row used by most components of the bank.
* Run-time colour patches (`fPalette_LoadSpritePallete` $8093A4): OBJ row 7 colours 10-12 are overwritten with the season/time entry of
  `nPaletteOverwrite_80BD9C` ($80BD9C; `%PaletteModify(.., $000A..$000C, $000F)`), OBJ row 3 colours 8-10 with the wife's dress
  (`sPallete_MarriedGirlTable` $80BDFC, `$8094CA-$8094F1`). The PNGs show the unpatched palette colours.
* The title and menu screens (areas $5B-$5F) clear CGRAM (`fCore_ZeroCGRAM`) and set up their own OBJ colours (cursor palette
  init in the title state machine); sprites shown there may therefore use other colours than the bank's primary palette. Not analysed.

## 5. Consequences for the PNGs

* `pngsync.py export` writes the 16 colours of `palette.sub` of `palette.id` into the PLTE chunk (sprite sheets additionally mark
  index 0 transparent with tRNS). The **pixel values are not touched**: the committed PNGs have exactly the old indices, `import`
  ignores PLTE/tRNS, and `pngsync.py check` reproduces every `.bin` bit for bit.
* A sheet usually mixes several rows (a map sheet uses 1-7). The PNG shows the primary row; `pngsync.py preview` writes game-colour
  versions with the right row per 8x8 tile / per 16x16 sprite to `build/gfx_preview/sheets/` and the name tables with their
  palette bits applied to `build/gfx_preview/`. Neither is committed.
* The assembled object sprites (`build/sprites_assembled/`, rendered by `tools/objects/spriteexport.py`) keep the OBJ row in the high nibble
  of the pixel value, so their 128-entry PLTE is simply the 8 rows of `sPalette_0x6F` (`palette_map.sprite_palettes()`).
* Sidecar keys: `palette` (`id`, `sub`), `palette_confidence` (`high`, `medium`, `low`, see below), `palette_note`, `palette_subs_used`,
  `palette_alternatives` (up to 6, the full list is in `palette_map.json`).

Confidence: **high** = the blob is referenced by static name tables (or object frames) and at least 16 cells/components give
the sub-palette; the palette *id* is exact for the primary area. **medium** = the weather overlays (palette of the host map) and
`sCompressedTiles_95D6E2` (6 referencing cells). **low** = no static data decides the sub-palette (see section 7).

## 6. Result table

<!-- palette-table:begin (generated by tools/gfx/palette_map.py table) -->
| Blob | Palette | Sub | Confidence | Subs used | Used by |
|---|---|---|---|---|---|
| `sCompressedTiles_928000` | `sPalette_0x0B` | 0 | medium | 0 | rain_overlay |
| `sCompressedTiles_9282CB` | `sPalette_0x01` | 1 | high | 1/2/5 | farmfall |
| `sCompressedTiles_929D10` | `sPalette_0x01` | 1 | high | 1/2/4/5 | farmfall |
| `sCompressedTiles_92BB03` | `sPalette_0x01` | 2 | high | 1/2/3/4/5 | farmfall |
| `sCompressedTiles_92D3AB` | `sPalette_0x0B` | 1 | high | 1/2/5 | farmspring, farmsummer, ending00 (+11) |
| `sCompressedTiles_938000` | `sPalette_0x0B` | 1 | high | 1/2/4/5 | farmspring, farmsummer, ending00 (+11) |
| `sCompressedTiles_939E8E` | `sPalette_0x0B` | 2 | high | 1/2/3/4/5 | farmspring, farmsummer, ending00 (+11) |
| `sCompressedTiles_93B736` | `sPalette_0x0E` | 1 | high | 1/2/5 | farmwinter |
| `sCompressedTiles_93D049` | `sPalette_0x0E` | 1 | high | 1/2/4/5 | farmwinter |
| `sCompressedTiles_93E12B` | `sPalette_0x0E` | 2 | high | 1/2/3/4/5 | farmwinter |
| `sCompressedTiles_948000` | `sPalette_0x12` | 1 | high | 1/2/3 | woodscave, impunderground |
| `sCompressedTiles_95C000` | `sPalette_0x13` | 1 | high | 1/2/3 | house1, house2, house3 |
| `sCompressedTiles_95D6E2` | `sPalette_0x13` | 2 | medium | 2 | house1, house2, house3 |
| `sCompressedTiles_95E8A3` | `sPalette_0x15` | 1 | high | 1/2 | majorhouse, majorcorridor, majorbedroom |
| `sCompressedTiles_968000` | `sPalette_0x16` | 1 | high | 1/2/3/4/5 | church |
| `sCompressedTiles_969437` | `sPalette_0x17` | 1 | high | 1/2/3 | florist, floristbedroom |
| `sCompressedTiles_96AD11` | `sPalette_0x18` | 1 | high | 1/2 | bar, barbedroom |
| `sCompressedTiles_96C489` | `sPalette_0x19` | 1 | high | 1/2 | restaurant, restaurantbedroom |
| `sCompressedTiles_96DC6D` | `sPalette_0x1A` | 1 | high | 1/2 | toolsshop, toolsshopbedroom |
| `sCompressedTiles_978000` | `sPalette_0x1B` | 1 | high | 1/2 | animalshop |
| `sCompressedTiles_979A88` | `sPalette_0x1C` | 2 | high | 1/2/3 | fortuneteller |
| `sCompressedTiles_97B11A` | `sPalette_0x0B` | 0 | medium | 0 | clouds_overlay |
| `sCompressedTiles_97B45F` | `sPalette_0x3A` | 3 | high | 1/3 | townspring, townsummer, townfall (+7) |
| `sCompressedTiles_97CD20` | `sPalette_0x1D` | 1 | high | 1/2/3/4 | townsummer, weddingsummer, ending05 |
| `sCompressedTiles_97E7A2` | `sPalette_0x1D` | 1 | high | 1/3/4/5/6 | townsummer, weddingsummer, ending05 |
| `sCompressedTiles_988000` | `sPalette_0x21` | 1 | high | 1/2/3/4 | townfall, dancings2, eggfestival (+1) |
| `sCompressedTiles_989A52` | `sPalette_0x21` | 1 | high | 1/3/4/5/6 | townfall, weddingfall |
| `sCompressedTiles_98AEDB` | `sPalette_0x22` | 1 | high | 1/2/4/5/6/7 | dancings2 |
| `sCompressedTiles_98CC6B` | `sPalette_0x27` | 1 | high | 1/2/3/4/5/6/7 | crossroadspring, crossroadsummer, crossroadfall (+1) |
| `sCompressedTiles_98E41D` | `sPalette_0x31` | 1 | high | 1/2/3/4/5/6/7 | crossroadwinter |
| `sCompressedTiles_998000` | `sPalette_0x3A` | 1 | high | 1/2/3/4 | townspring, dancings1, weddingspring |
| `sCompressedTiles_999A74` | `sPalette_0x3A` | 1 | high | 1/3/4/5/6 | townspring, weddingspring |
| `sCompressedTiles_99AEC3` | `sPalette_0x3B` | 5 | high | 1/2/3/4/5/6/7 | dancings1 |
| `sCompressedTiles_99C3F2` | `sPalette_0x3F` | 1 | high | 1/3/4/5/6/7 | eggfestival |
| `sCompressedTiles_99DCBD` | `sPalette_0x40` | 3 | high | 1/3 | townwinter, ny_publicsquare, weddingwinter |
| `sCompressedTiles_9A8000` | `sPalette_0x40` | 1 | high | 1/2/3/4 | townwinter, ny_publicsquare, weddingwinter |
| `sCompressedTiles_9A9921` | `sPalette_0x40` | 1 | high | 1/3/4/5/6 | townwinter, weddingwinter |
| `sCompressedTiles_9AAEAB` | `sPalette_0x45` | 1 | high | 1/4/7 | ny_publicsquare |
| `sCompressedTiles_9ABF97` | `sPalette_0x46` | 1 | high | 0/1 | menu_backgrounds, menu_characters |
| `sCompressedTiles_9AC489` | `sPalette_0x46` | 0 | high | 0 | menu_backgrounds, menu_characters |
| `sCompressedTiles_9ACB41` | `sPalette_0x46` | 0 | high | 0/1 | menu_backgrounds, menu_characters |
| `sCompressedTiles_9AD357` | `sPalette_0x46` | 0 | high | 0/1 | menu_backgrounds, menu_characters |
| `sCompressedTiles_9AE02D` | `sPalette_0x47` | 1 | high | 1 | shed |
| `sCompressedTiles_9B8000` | `sPalette_0x47` | 0 | high | 0 | shed |
| `sCompressedTiles_9B8441` | `sPalette_0x0B` | 0 | medium | 0 | heavysnow_overlay |
| `sCompressedTiles_9B86AD` | `sPalette_0x48` | 2 | high | 1/2/3/4/5/6/7 | goldchicken |
| `sCompressedTiles_9B9F53` | `sPalette_0x49` | 2 | high | 1/2 | worksmanhouse |
| `sCompressedTiles_9BB76D` | `sPalette_0x53` | 4 | high | 1/2/4 | mountaintopspring, mountaintopsummer, mountaintopfall (+5) |
| `sCompressedTiles_9BCF8F` | `sPalette_0x57` | 4 | high | 1/2/4 | mountaintopwinter, mountaintop2winter, ny_mountaintop |
| `sCompressedTiles_9C8000` | `sPalette_0x53` | 1 | high | 1/2 | mountaintopspring, mountaintopsummer, mountaintopfall (+5) |
| `sCompressedTiles_9C965F` | `sPalette_0x57` | 1 | high | 1/2 | mountaintopwinter, mountaintop2winter, ny_mountaintop |
| `sCompressedTiles_9CA40C` | `sPalette_0x5B` | 2 | high | 1/2/4 | cowbarn, coop |
| `sCompressedTiles_9CCBA3` | `sPalette_0x5C` | 1 | high | 1/2/5/6 | woodssummer, ending11 |
| `sCompressedTiles_9CE37D` | `sPalette_0x5C` | 2 | high | 1/2/3 | woodssummer, ending11 |
| `sCompressedTiles_9D8000` | `sPalette_0x64` | 5 | high | 2/3/4/5 | woodsspring, woodssummer, ending11 |
| `sCompressedTiles_9D991C` | `sPalette_0x60` | 1 | high | 1/2/5/6 | woodsfall |
| `sCompressedTiles_9DB15E` | `sPalette_0x60` | 2 | high | 1/2/3 | woodsfall |
| `sCompressedTiles_9DCE31` | `sPalette_0x60` | 5 | high | 2/3/4/5 | woodsfall |
| `sCompressedTiles_9DE7CE` | `sPalette_0x64` | 1 | high | 1/2/5/6 | woodsspring |
| `sCompressedTiles_9E8000` | `sPalette_0x64` | 2 | high | 1/2/3 | woodsspring |
| `sCompressedTiles_9E9C6D` | `sPalette_0x0B` | 0 | medium | 0 | snow_overlay |
| `sCompressedTiles_9E9EDC` | `sPalette_0x68` | 1 | high | 1/2/5/6 | woodswinter, ny_spa |
| `sCompressedTiles_9EB75D` | `sPalette_0x68` | 2 | high | 1/2/3 | woodswinter, ny_spa |
| `sCompressedTiles_9ED208` | `sPalette_0x68` | 5 | high | 2/3/4/5 | woodswinter, ny_spa |
| `sCompressedTiles_9EEB3D` | `sPalette_0x6E` | 0 | high | 0 | credits0, credits1, credits2 (+9) |
| `sCompressedTiles_9F8000` | `sPalette_0x6C` | 6 | high | 0/1/3/4/5/6 | title_intro_farm, title_logo |
| `sCompressedTiles_9F946C` | `sPalette_0x6C` | 4 | high | 1/2/3/4/5/6 | title_intro_farm, title_logo |
| `sCompressedTiles_9FAA75` | `sPalette_0x6C` | 4 | high | 1/2/3/4/5/6 | title_intro_farm, title_logo |
| `sCompressedTiles_9FC04C` | `sPalette_0x6C` | 2 | high | 2 | title_intro_farm, title_logo |
| `sCompressedTiles_9FEF97` | `sPalette_0x6D` | 0 | high | 0 | natsume_logo |
| `sCompressedTiles_A08000` | `sPalette_0x6E` | 0 | high | 0 | credits0, credits1, credits2 (+9) |
| `sCompressedTiles_A088E9` | `sPalette_0x6E` | 0 | high | 0 | credits0, credits1, credits2 (+9) |
| `sCompressedTiles_A09232` | `sPalette_0x6E` | 0 | low | - | credits0, credits1, credits2 (+2) |
| `sCompressedTiles_A0AB1E` | `sPalette_0x6E` | 0 | low | - | unknown51 |
| `sCompressedTiles_A0CAAF` | `sPalette_0x6E` | 3 | high | 0/3 | unknown56 |
| `sCompressedTiles_A0E682` | `sPalette_0x6E` | 0 | low | - | drivetotown |
| `sCompressedTiles_9FD4DA` | `sPalette_0x6C` | 7 | low | - | (none) |
| `Sprites_888000` | `sPalette_0x6F` | 4 | high | 3/4/5/6 | object frames (banks $86/$87) |
| `Sprites_898000` | `sPalette_0x6F` | 4 | high | 4 | object frames (banks $86/$87) |
| `Sprites_8A8000` | `sPalette_0x6F` | 4 | high | 4 | object frames (banks $86/$87) |
| `Sprites_8B8000` | `sPalette_0x6F` | 4 | high | 4/6/7 | object frames (banks $86/$87) |
| `Sprites_8C8000` | `sPalette_0x6F` | 7 | high | 0/1/3/4/5/6/7 | object frames (banks $86/$87) |
| `Sprites_8D8000` | `sPalette_0x6F` | 5 | high | 5 | object frames (banks $86/$87) |
| `Sprites_8E8000` | `sPalette_0x6F` | 5 | high | 4/5 | object frames (banks $86/$87) |
| `Sprites_8F8000` | `sPalette_0x6F` | 4 | high | 1/2/3/4/5 | object frames (banks $86/$87) |
| `Sprites_908000` | `sPalette_0x6F` | 1 | high | 0/1/2/3/4 | object frames (banks $86/$87) |
| `Sprites_918000` | `sPalette_0x6F` | 3 | high | 0/1/2/3/4/5/6/7 | object frames (banks $86/$87) |
<!-- palette-table:end -->

## 7. Open problems

* `sCompressedTiles_A09232`, `A0AB1E`, `A0E682` (credits / ending pictures, tile numbers `$300+` of the `$5000` slot): no static
  name table references them (the credit name tables `sCompressedTilemap_A690A6`/`A694EE` only use tiles below `$D4`/`$FD`), so the
  picture name tables are built by code that has not been located. Palette `sPalette_0x6E` (the only palette of areas $4B-$56) with
  row 0 is a placeholder.
* `sCompressedTiles_9FD4DA` is the Japanese title logo, not loaded by any US map entry; the title palette and the row the US logo uses are assumed.
* Weather overlays: the correct colours are those of the palette-animation scripts ($80B9D7...), not of a map palette.
* Time-of-day: the PNGs use the day slot; slots 0, 2, 3 and 4 and the in-between fade colours are listed per area only.
* Runtime-modified name tables (objects merged into the map by `fObjectMap_ConnectAdjacentObjectTiles` $82AF00, dialog boxes on BG3,
  HUD) are not analysed; tile references added at run time would use sub-palettes not visible in the static data.
* `aMapPalettesId` has 168 bytes, i.e. entries for areas $00-$53 only; areas $54-$5F would read past the table (they have no objects).
* Rows 8-15 of every palette file are filler; if the original engine used them, the loader that does has not been found.
