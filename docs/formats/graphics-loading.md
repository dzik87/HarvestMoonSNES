# How graphics get into VRAM (loader register)

`assets/gfx/graphics_loads.json` is derived by `tools/gfx/graphics_loads.py build` (CI runs `check`) and lists, for every blob of
`assets/gfx/banks.json`, who loads it. `maps` holds the screen definitions: map -> area ids, tile blobs @ VRAM word, name tables @ VRAM word
with the character base of the BG that shows them, and the palette(s) of the area. `tools/gfx/pngsync.py` / `composed.py` read the same map table
(`pngsync.map_table`, `pngsync.bg_chr_base`), so renders, palettes and the register cannot disagree.

## Loaders found in `src/code`

| Loader | Where | What |
|---|---|---|
| `fTileMap_MapChangeHandler` ($80A7C6) | `bank_80/tilemaps.asm` | per area (`strcMap.loadAreaId`): graphic preset (areas < $57), `n` tile blobs, `m` name tables. Tile blobs are decompressed to $7E2000 and DMA'd to the VRAM word address of the entry, name tables the same ($2000 bytes). Raw `ScreenRaw_*` tables are copied (`mapFlags` bit 15) and streamed row by row. **138 blobs** are loaded this way. |
| `fDialog_LoadDialogBoxGraphics` ($8392BB) | `bank_83/dialog.asm` | `Screen_DialogBox` (region specific) -> $7800; `sFontGlyphs_Dialog` -> $5000. `fDialog_ReloadFontTiles` reloads the font. Both used literal addresses ($CB05 / $BBA3 per region) and now use the labels. |
| `fPalette_LoadFirstHalf` ($8091CF) | `bank_80/palette.asm` | palettes by `aPalettes` index (menus, title, intro: explicit; maps: `aMapPalettesIndexes`) |
| object / OAM code | banks $82-$84, object data $86/$87 | `Sprites_*` banks by sprite id >> 8; `sFontGlyphs_0x00-09` by `aLetterGlyphsPointers` |

Weather overlays (areas $57-$5A), menus ($5E/$5F), the intro farm scroll ($5B), the logos ($5C/$5D), endings, credits and the drive to town are
ordinary map entries, only without graphic preset byte. Their BG keeps the character base of the active preset.

## Corrections of earlier assumptions

* "No name table cell references the tile blob" is not "unused". `Tiles_Credits_3`, `Tiles_Unk51_3` and `Tiles_DriveToTown_3` are loaded by the
  map table to VRAM $5000 (credits / drive-to-town maps); only their palette row is a guess because no static name table shows their tiles
  (probably used by text or effects written at run time).
* `sFontGlyphs_Dialog` (formerly `sFontGlyphs_UNK`, "not referenced by any code") is the dialog window font: `fDialog_LoadDialogBoxGraphics` DMAs
  it to $5000 by literal address ($9CBBA3), which a label search cannot find.
* `Screen_DialogBox` ($A5CB05) was thought unloaded: the same function loads it by literal.
* Tile id n of a name table is the tile at `chr_base + 16 n` of the BG, not at the lowest loaded set (fixed in `composed.py`; the shop
  interiors, whose only set is at $3000, were drawn empty).
* Sets are not always complete: `Screen_Unk53to56` shows 34 % tiles of a 4th set that only `sMap_80B618` loads.

## Not loaded by anything found

`graphics_loads.py check` fails for any blob without a loader that is not listed in `UNUSED`:

* `Tiles_Unused_TitleLogoJapanese` ($9FD4DA): no map entry or code reference; Japanese logo graphics left in the US ROM.
* `ScreenRaw_Unk_A6A096`: raw 64x32 name table without any reference (hidden under bank padding).

Blobs reached through an index (sprite banks, glyph tables, palettes) are marked `indexed`; whether every index is used is checked by
`tools/objects/objdata.py` (frames) and `tools/fonts/font.py` (glyph tables), not here.

## Open questions

Facts only.

* `obj_XXXX` frame folders (`assets/gfx/png/frames/`) and object records (`assets/objects/**/objects/NNNN.json`) are named by object id only;
  1104 objects. The sprite banks (`Sprites_Player_0` ... `Sprites_Npc_2_Ui`) and the palettes (`Palette_<Area>_<Slot>`) are named
  (`docs/naming/K4_sprites_objects_palettes.csv`), the individual objects are not.
* 5 palettes are not referenced by any area slot (`Palette_Unk_14`, `Palette_Unk_71` ... `Palette_Unk_74`); no code path that selects them
  was found.
* The `Tiles_Unk51_3` and `Tiles_Unused_TitleLogoJapanese` blobs are shown by no name table, so their palette row is a guess.
* `Screen_Unk53to56__sMap_80B5AF`: 236 of 692 cells use tiles that the map does not load (see `graphics-png.md`).
* VRAM overlap check: `graphics_loads.py check` compares, per map entry, the word ranges of all tile blobs and the name tables; it currently
  finds no overlap, so the layouts shared between screens do not collide. Intended overlaps can be listed in `OVERLAP_OK`.
