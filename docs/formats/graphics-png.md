# Graphics as PNG (editable sources)

Every graphic blob that can be shown as an image lives in the repository as **composed PNG images** (tile graphics, sprite banks) or as a
**text file** (BG name tables). These files are the source of truth for graphics mods; the binary `assets/gfx/{tiles,sprites,characters}/*.bin`
files that the assembler `incbin`s are **generated** from them (`tools/build_assets.py`, git-ignored, never committed) and must stay
bit-identical to the original ROM data. Converter: `tools/gfx/pngsync.py` (+ `tools/gfx/composed.py`); CI runs `pngsync.py check` and `tests/test_pngsync.py`.

## What is converted (151 blobs)

| Kind | Blobs | `.bin` (included by asm) | Editable source | Stored in the ROM as |
|---|---|---|---|---|
| `tiles` | 77 | `assets/gfx/tiles/sCompressedTiles_*.bin` | `assets/gfx/png/screens/*.png` (+ remainder sheet `png/tiles/<label>.png`) | LZSS, 8192 bytes decompressed (256 4bpp tiles) |
| `sprites` | 10 | `assets/gfx/sprites/Sprites_88..91*.bin` | `assets/gfx/png/frames/obj_XXXX/f_PPPP.png` (+ remainder sheet `png/sprites/<label>.png`) | raw, 32768 bytes (1024 4bpp tiles) per bank |
| `tilemaps` | 64 | `assets/gfx/characters/sCompressedTilemap_*.bin` (60, LZSS) and `sCharactermap_*.bin` (4, raw) | `assets/gfx/tilemaps/<label>.map.txt` | BG name tables (not graphics) |

Every blob has a `<label>.json` next to its remainder sheet / text file (the sidecar). Palettes were already PNG/JSON before
(`assets/gfx/palettes/`), fonts are per-glyph PNGs (`assets/fonts/`, `docs/formats/font.md`).

## Composed images: edit whole pictures, the build splits them into tiles and sprite blocks

The tile data of the game is only meaningful through the structures that use it, so the editable sources are the *pictures* those structures
draw, not the raw sheets:

```
assets/gfx/png/frames/obj_0004/f_A53D.png         object animation frame (banks $86/$87, 2,621 images; unreferenced frames in frames/unreferenced/)
assets/gfx/png/screens/Screen_Road.png   BG name table rendered with its tile sets (77 US + 24 regional images)
assets/gfx/png/sprites/Sprites_Player_0.png          remainder sheet of a sprite bank   (10)
assets/gfx/png/tiles/Tiles_Farm_SpringSummer_0.png   remainder sheet of a tile blob     (77)
assets/gfx/png/<eu|de|jp>/{screens,tiles}/         the same for the blobs that differ from US
```

* **Sprite frames** (`frames/`): the components of a frame (`tile id, x, y, attr`, from `assets/objects/`) drawn as the engine draws them (see
  `sprite-assembly.md`): 16x16 blocks, attribute bits 4/5 = vertical / horizontal flip, bits 0-2 = OBJ palette row, the last component on top.
  Pixel value = `(OBJ palette row << 4) | colour`, colour 0 = transparent; PLTE = day OBJ palette `Palette_Obj_Day`, image size = bounding box of the
  components. One file per distinct frame address of an object.
* **Screens** (`screens/`): a name table (`assets/gfx/tilemaps/*.map.txt`) rendered with the tile blobs loaded next to it by the map table
  (`tilemaps.asm`, character base = lowest tile-set VRAM address, which reproduces the farm exactly), 8x8 per entry with flips; pixel value =
  `(entry palette << 4) | colour`; PLTE = the day palette of the first map using that tile-set combination. A name table that several maps show with different
  tile sets (seasons) has one image per combination: `<table>__<first map>.png`. Tables without a loadable tile set have no image.
* **Remainder sheets** (`tiles/<label>.png`, `sprites/<label>.png`): the 128 px wide sheet of the blob (16 tiles per row) containing **only the
  pixels no composed image determines**, 0 everywhere else: tiles that no name table shows (e.g. other seasons' tiles, fonts, overlays), sprite
  pixels hidden under other components, sprite blocks no frame uses. About 300,000 of the 1.26 million tile pixels and 12,700 of 655,000 sprite
  pixels are in remainder sheets (see "Limits").
* **Which pixels an image determines.** A name table cell shows one whole tile, so it determines all 64 pixels of the tile it refers to
  (un-flipped according to its flip bits). A sprite component pixel is determined if no other component of the same frame covers it (a
  covered pixel could belong to either component, or be transparent). The build reads every image, derives these claims and takes all
  remaining pixels from the remainder sheet.
* **Palettes and flips are not editable from the image.** A tile may be shown with different palette rows and flips in different cells;
  the image pixel carries the row used there, and `import` checks that every non-transparent pixel still uses that row (the row is the name
  table entry / sprite attribute, i.e. data outside the tile). Changing the colour *index* is what edits the tile. Flips are reversed
  correctly when the pixels are written back.
* **Contradictions.** Tiles and sprite blocks are shared: the same tile appears in many cells / name tables / seasons, the same sprite
  block in many frames. If two images disagree about the same pixel, `check` / `build` / `import` stop with a message that names both images,
  the tile / sprite id and the pixel. Workflow for shared graphics: edit one image, run `pngsync.py import`: it compares the images with the render of the
  current `.bin` (the *baseline*), turns only the differing pixels into edits, refuses contradicting edits, writes the new `.bin` and re-renders **all** images, so
  every other picture that shows the changed tile follows. (Editing two pictures of the same tile in the same way is fine; in different ways is the error.)
* **Sprite edits on overlap.** A changed pixel is assigned to the topmost component whose block pixel is set there (or, if the pixel was transparent,
  to the topmost component covering it). A pixel that lies in the bounding box but not under any 16x16 component is refused.
* **Build** (`pngsync.py build`, no baseline): composed images + remainder sheets -> sheet -> 4bpp planar tiles -> LZSS (tile blobs) + tail bytes from the
  sidecar -> `.bin`. A remainder pixel that an image also defines must be 0 (otherwise the edit would be silently ignored): error.
* **Viewing**: `pngsync.py sheet [--label PAT] [--region R] [--scale N] [--grid]` builds the whole sheets into `build/gfx_sheets/<region>/`
  (derived, never committed); `pngsync.py preview` renders name tables and game-colour sheets from the `.bin` files into `build/gfx_preview/`;
  `tools/objects/spriteexport.py` renders contact sheets and an index of all frames into `build/sprites_assembled/`.

Findings made while building this:
* The three `sCharactermap_*` blobs in banks $A1-$A3 are **not** character graphics but raw (uncompressed) name tables of
  the big world maps: 128 entries per row (`ScreenRaw_Farm` = the farm, 128x128 tiles, $8000 bytes; `A28000` is
  $5FC0 bytes, the mountain). There is no raw character graphics data in the US ROM; all tile graphics are LZSS blobs.
* All graphics read as **4bpp** (the 4 VRAM slots $2000-$5000 are $1000 words = 8192 bytes = 256 4bpp tiles apart).
  Name tables use VRAM $6000/$7000/$1000.

## Workflow for modders

```
python3 tools/build_assets.py                                             # once after cloning: generate the .bin files
python3 tools/gfx/pngsync.py import --label Tiles_Farm_SpringSummer_0    # after editing the PNG: re-encode, update sidecar/padding
python3 tools/build.py                                                    # regenerates assets and rebuilds; ROM hash changes (intended)
```

1. Edit a composed image (`frames/obj_XXXX/f_PPPP.png`, `screens/<table>.png`), a remainder sheet or the name table text (render a whole sheet for orientation with `pngsync.py sheet --grid`) with any editor that preserves an
   **indexed palette** (Aseprite, GIMP "indexed", Grafx2). Do not convert to RGB: the pixel value *is* the SNES colour index.
2. `pngsync.py import [--label PAT] [--kind K]` re-encodes blobs whose source changed (PAT is an
   `fnmatch` pattern, repeatable; default all), updating the generated `.bin`, the sidecar tail data and, with `--allow-resize`, the bank padding. Unchanged blobs are not touched.
3. Rebuild with `tools/build.py` and test. Update `tests/expected.json` only for deliberate modifications.
4. Commit the changed images (they are rewritten by `import` so that all pictures agree), sidecars (and the bank `.asm` if the padding changed); the `.bin` files are not committed.

`pngsync.py export` regenerates the images / sidecars / text from the generated `.bin` files (only needed after changing the pipeline); `pngsync.py build` writes the `.bin` files from the sources.
`pngsync.py preview` renders the name tables together with their tile sets into `build/gfx_preview/` in game colours (the palette bits of
every entry pick the sub-palette, the palette is the day palette of the first map that uses the table; character base = lowest
tile-set VRAM address, which reproduces the farm map exactly) and every tile sheet / sprite bank with the right sub-palette per
8x8 tile / 16x16 sprite into `build/gfx_preview/sheets/`. Previews are derived and not committed.

### Constraints
* **Dimensions are fixed.** Frame images keep the bounding box of the components, screens `columns x rows` cells of 8 px, remainder sheets 128 x
  (tile rows x 8) px (8192-byte tile blobs 128x128, sprite banks 128x512). Name tables keep their number of words.
* **Pixel values stay below 2^bpp** (4bpp: 0-15). `import`/`build` name the offending pixel otherwise. The 16 colours of the
  PNG palette (PLTE) are the **real colours** of the sub-palette the sheet is shown with in the game (primary palette per
  blob: `assets/gfx/palette_map.json`, evidence in [`graphics-palettes.md`](graphics-palettes.md)); sprite images also mark index 0
  transparent (tRNS). They are only a viewing aid: changing the PLTE has no effect on the ROM, it is ignored on import (every
  `.bin` is rebuilt from the pixel indices alone; `pngsync.py check` and `tests/test_pngsync.py` verify this).
  A sheet that the game shows with several sub-palettes (e.g. a map tile set) displays its most used one; the others are listed in
  the sidecar and in the previews. Blobs without evidence (no map loads them, see the "low" confidence entries) use the best guess
  documented there. `palette_map.json` is derived from the code tables by `tools/gfx/palette_map.py`; `export` copies it into
  the sidecars and PNGs. A manual `"palette": {"id", "sub"}` sidecar key is only kept for blobs that are not in the map.
* **Size of the compressed blob.** Edited tile graphics compress to a different length. A shorter stream is padded with zeros
  automatically (layout unchanged). A longer stream is refused unless `--allow-resize` is passed; then `import` also reduces the
  trailing padding of the bank in `assets/gfx/banks.json` (`pad`; the bank asm in `build/gen/gfx/` is regenerated) by the growth, and fails if the bank is full. All
  pointers are labels, so following blobs move automatically. Raw blobs (sprites, `sCharactermap_*`) never change size.
* Name tables: `.map.txt` has `columns` 16-bit hex words per row (32, 64 or 128, see "Name table width"), a blank line after every
  32 rows, no comments. Entry = tile 0-9, palette 10-12, priority 13, H flip 14, V flip 15.

### Palette rows of the tile sheets

A tile blob has no palette of its own: **every name table cell picks its own CGRAM row** (entry bits 10-12), so the same blob can look different in
different maps (`Tiles_House_1`, the house interior set, is shown with rows 1, 2 and 3 by `A4945C`, `A49745` and `A49B84`). The remainder sheets
(`assets/gfx/png/tiles/*.png`) and `pngsync.py sheet` therefore colour **every tile with the row it is shown with in the name tables** (most used row;
the PNG has the 128 colours of the blob's palette `palette.id`, pixel = row << 4 | colour; the build ignores bits 4-6, the colour index is what counts).
Sidecar keys: `tile_rows_multi` = tiles that are shown with more than one row (`{"tile": [rows, most used first]}`), `tiles_row_guessed` = number
of tiles no name table shows (these use `palette.sub`, a guess; `palette_confidence` says how good, `low` = no tile is referenced). Blobs whose
rows are all guessed (no static name table references them): `Tiles_Unused_TitleLogoJapanese` (Japanese title logo left in the US ROM),
(`Tiles_Credits_3`, `Tiles_Unk51_3` and `Tiles_DriveToTown_3` are NOT unused: the map table loads them to VRAM $5000 - see `docs/formats/graphics-loading.md` - only no static name table cell shows their tiles); they are drawn with `palette.sub` and
`pngsync.py check` prints a NOTE for each.  The primary `sub` of a blob is the row with the most cells over *all* areas that show it with the same palette
(`palette_map.py`); `95D6E2` therefore moved from sub 2 (house 1 only, 6 cells, medium) to **sub 1 (36 of 54 cells, high)**; rows 1/2 are both used,
the per-tile rows are exact.

### Seasons

Seasonal variants are different tile blobs for the same name table, so each combination gets its own screen image (`screens/<table>__<map>.png`);
maps whose blobs are the same share one image (spring / summer of the farm, road and summit use the same blobs):

| Map | Spring | Summer | Fall | Winter |
|---|---|---|---|---|
| Farm (`A18000`) | `92D3AB 938000 939E8E` | same as spring | `9282CB 929D10 92BB03` | `93B736 93D049 93E12B` |
| Town (`A38000`) | `97B45F 998000 999A74` | `97B45F 97CD20 97E7A2` | `97B45F 988000 989A52` | `99DCBD 9A8000 9A9921` |
| Mountain (`A28000`) | `9DE7CE 9E8000 9D8000` | `9CCBA3 9CE37D 9D8000` | `9D991C 9DB15E 9DCE31` | `9E9EDC 9EB75D 9ED208` |
| Road (`A4CFAB`) | `98CC6B` | same | same | `98E41D` |
| Summit (`A5B943`, `A5AD17`) | `9BB76D 9C8000` | same | same | `9BCF8F 9C965F` |

Blob names are `sCompressedTiles_<id>` (sets are loaded at VRAM $2000 / $3000 / $4000 in this order).

### Name table width

A name table is a flat list of 16-bit entries; the row length (`columns` in the sidecar) decides how it is drawn into the `screens/` image
and how `.map.txt` is wrapped. It never changes the `.bin` (entry order is the same). Evidence for the widths:

* **Engine.** The map loader (`src/code/bank_80/tilemaps.asm`) uploads the big name tables row by row with a stride taken from
  `nTable_80AA68[strcDialogDisplay.mapMultiWidth]` = `$40 / $80 / $100` bytes = **32 / 64 / 128 entries per row**, and the table size from
  `nTable_80AA72` = `$1000 / $2000 / $4000` bytes. So row-major maps of 32, 64 and 128 entries per row exist (32x64, 64x64, 128x64+).
  `ScreenRaw_Farm/A28000/A38000` and `Screen_EggFestival` use 128. The BG tilemaps loaded by the `.tilemaps` path are
  decompressed to `$7E2000` and DMA'd linearly (`$2000` bytes) to the VRAM address of the map header, so the file order is the order in VRAM.
* **Image continuity** (`pngsync.py widths`, also part of `check`). Every table is rendered with each of 32, 64 and 128 columns and the
  *seam ratio* is computed: the share of differing neighbour pixels across 8x8 cell borders divided by the share inside cells. A correct layout
  is about 1.0 (borders are not special), a wrong one places unrelated tiles side by side and scores clearly higher (the three tables that
  were drawn 32 wide by mistake: `A48A2D` 1.52 -> 1.02, `A49745` 1.40 -> 1.03, `A4D379` 1.25 -> 1.10).
* **Rule.** Default by size (`composed.default_columns`): 4096 entries = 64, 8192 and more = 128, otherwise 32. A different width is used only
  when it is at least 0.05 more continuous than the default. Tables that are blank or not shown with any tile set keep the default
  (`ScreenRaw_Unk_A6A096` is a raw 64x32 name table, `KNOWN_COLUMNS`). Regional tables take the width of the US table with the same label.
* **Check.** `pngsync.py check` fails when a table's declared width is more than 0.15 worse than the best candidate, so a wrong `columns`
  cannot be committed unnoticed. `pngsync.py widths [--region R] [--write]` prints the scores and, with `--write`, stores the suggestion
  (then `export` rewraps the `.map.txt` and redraws the screens).

Widths (`columns x rows`; seam ratio at that width, `-` = not rendered; the regional releases that carry their own copy are listed, their
widths equal the US one):

| Table | Entries | Layout | Seam | Regional copies | Note |
|---|---|---|---|---|---|
| `ScreenRaw_Farm` | 16384 | 128 x 128 | 0.99 | US only |  |
| `ScreenRaw_Mountain` | 12256 | 128 x 96 | 1.04 | US only |  |
| `ScreenRaw_Town` | 16384 | 128 x 128 | 1.12 | US only | weak metric |
| `ScreenRaw_Unk_A6A096` | 2048 | 64 x 32 | - | US only | no tile set: size / content default |
| `Screen_Overlay_Rain` | 2048 | 32 x 64 | 0.00 | US only | blank, size default |
| `Screen_ElfTunnel` | 3072 | 32 x 96 | 1.03 | US only |  |
| `Screen_MountainCave` | 4096 | 64 x 64 | 1.02 | US only |  |
| `Screen_House_Upgrade1` | 1024 | 32 x 32 | 1.17 | US only | weak metric |
| `Screen_House_Upgrade2` | 2048 | 64 x 32 | 1.03 | US only |  |
| `Screen_House` | 1024 | 32 x 32 | 1.20 | US only | weak metric |
| `Screen_MayorHouse` | 4096 | 64 x 64 | 1.01 | US only |  |
| `Screen_Church` | 2048 | 32 x 64 | 1.37 | US only | metric high, image checked by eye |
| `Screen_FlowerShop` | 2048 | 32 x 64 | 0.00 | US only | blank, size default |
| `Screen_Bar` | 2048 | 32 x 64 | 0.00 | US only | blank, size default |
| `Screen_Restaurant` | 2048 | 32 x 64 | 0.00 | US only | blank, size default |
| `Screen_GeneralStore` | 2048 | 32 x 64 | 0.00 | US only | blank, size default |
| `Screen_AnimalShop` | 1024 | 32 x 32 | 0.00 | US only | blank, size default |
| `Screen_FortuneTellerHouse` | 1024 | 32 x 32 | 0.00 | US only | blank, size default |
| `Screen_Overlay_Clouds` | 2048 | 32 x 64 | 0.00 | US only | blank, size default |
| `Screen_HarvestFestival` | 4096 | 64 x 64 | 1.09 | US only |  |
| `Screen_Road` | 1024 | 32 x 32 | 1.00 | US only |  |
| `Screen_FlowerFestival` | 4096 | 64 x 64 | 1.10 | US only |  |
| `Screen_EggFestival` | 16384 | 128 x 128 | 1.13 | US only | weak metric |
| `Screen_Menu_Backgrounds` | 4096 | 32 x 128 | 1.09 | de,eu,jp |  |
| `Screen_StarNightFestivalSquare` | 4096 | 64 x 64 | 1.13 | US only | weak metric |
| `Screen_ToolShed` | 1024 | 32 x 32 | 1.15 | US only | weak metric |
| `Screen_Menu_Characters` | 4096 | 64 x 64 | 1.11 | de,jp |  |
| `Screen_Menu_BackgroundPattern` | 4096 | 64 x 64 | 3.09 | jp | metric high, image checked by eye |
| `Screen_ToolShed_Layer2` | 2048 | 32 x 64 | 1.12 | de,jp | weak metric |
| `Screen_StarNightFestivalSpa` | 1024 | 32 x 32 | 1.16 | US only | weak metric |
| `Screen_Overlay_HeavySnow` | 2048 | 32 x 64 | 0.37 | US only |  |
| `Screen_GoldChicken` | 3072 | 32 x 96 | 1.14 | US only | weak metric |
| `Screen_Summit_Layer2` | 2048 | 32 x 64 | 1.00 | US only |  |
| `Screen_MountainTop2_Layer2` | 2048 | 32 x 64 | 1.01 | US only |  |
| `Screen_StarNightFestivalMountainTop_Layer2` | 2048 | 32 x 64 | 0.99 | US only |  |
| `Screen_WorksmanHouse` | 1024 | 32 x 32 | 1.03 | US only |  |
| `Screen_Summit` | 2048 | 32 x 64 | 1.07 | US only |  |
| `Screen_MountainTopBean` | 2048 | 32 x 64 | 1.05 | US only |  |
| `Screen_Coop` | 1024 | 32 x 32 | 0.93 | US only |  |
| `Screen_Barn` | 2048 | 32 x 64 | 1.02 | US only |  |
| `Screen_Overlay_Snow` | 2048 | 32 x 64 | 0.00 | US only | blank, size default |
| `Screen_DialogBox` | 2048 | 32 x 64 | - | US only | no tile set: size / content default |
| `Screen_IntroFarmScroll_BG1` | 4096 | 64 x 64 | 1.21 | de,eu,jp | weak metric |
| `Screen_IntroFarmScroll_BG2` | 4096 | 64 x 64 | 1.21 | US only | weak metric |
| `Screen_Title_HarvestMoonLogo` | 4096 | 64 x 64 | - | de,eu,jp | no tile set: size / content default |
| `Screen_Title_NatsumeLogo` | 4096 | 64 x 64 | 0.97 | jp |  |
| `Screen_Ending00` | 1024 | 32 x 32 | 1.07 | US only |  |
| `Screen_Ending01` | 1024 | 32 x 32 | 1.10 | US only |  |
| `Screen_Ending02` | 1024 | 32 x 32 | 1.10 | US only |  |
| `Screen_Ending03` | 1024 | 32 x 32 | 1.00 | US only |  |
| `Screen_Ending12` | 1024 | 32 x 32 | 1.11 | US only |  |
| `Screen_Ending13` | 1024 | 32 x 32 | 1.36 | US only | metric high, image checked by eye |
| `Screen_Ending04` | 1024 | 32 x 32 | 1.04 | US only |  |
| `Screen_Ending05` | 1024 | 32 x 32 | 1.14 | US only | weak metric |
| `Screen_Ending06` | 1024 | 32 x 32 | 0.99 | US only |  |
| `Screen_Ending07` | 1024 | 32 x 32 | 1.01 | US only |  |
| `Screen_Ending08` | 1024 | 32 x 32 | 0.99 | US only |  |
| `Screen_Ending09` | 1024 | 32 x 32 | 0.92 | US only |  |
| `Screen_Ending10` | 1024 | 32 x 32 | 0.98 | US only |  |
| `Screen_Ending11` | 1024 | 32 x 32 | 1.06 | US only |  |
| `Screen_Intro` | 1024 | 32 x 32 | 0.99 | US only |  |
| `Screen_Credits_0to3` | 4096 | 64 x 64 | 0.72 | jp |  |
| `Screen_Credits4_DriveToTown` | 4096 | 64 x 64 | 0.77 | de,jp |  |
| `Screen_Unk53to56` | 4096 | 64 x 64 | 0.65 | US only |  |

Still doubtful (cannot be decided from the picture alone):

* `Screen_Menu_BackgroundPattern` (4096): a repeating pattern of very different tiles with logo blocks; no layout is smooth, 64 is the best
  and the picture reads correctly by eye (the metric is not meaningful for it).
* `Screen_Church`, `Screen_Ending13`: high metric at every width, but the pictures read correctly (church interior, 32x64).
* `Screen_Menu_Backgrounds` (menu backgrounds, 4096): 32 x 128 scores 1.09, 64 wide 1.16, and a VRAM-paged 64x64 (four 32x32 screens) 1.08.
  None is smooth; the table probably mixes several sub-pictures. It is stored with 32 columns (0.07 better than the 64-column default,
  which is above the 0.05 margin); revisit when the menu code is understood.
* Tables that are blank (all cells empty), `A59C08`, `A5A3D5`, `A5C4CD`, `A5AD17`..`A5BD8A` (2048 entries): 32 and 64 columns score the same; the
  engine default (32) is kept. If one of them is ever shown it must be re-evaluated.

### Screens: known special cases

How a name table cell finds its tile: entry tile id `n` shows the tile at VRAM word `chr_base + 16 * n` (4bpp). `chr_base` is the character base of
the BG that shows the table: the map header's graphic preset (first byte, maps of areas below $57) selects `BGnSC` (which BG is at the
name table's VRAM address) and `BG12NBA` / `BG34NBA` (`Table_*_Presets` in `src/code/bank_80/core.asm`) - $2000 for the BG1 / BG2 of presets 0-5.
The tile sets of the map header are loaded at $2000 / $3000 / $4000 / $5000, so a set at $3000 holds ids $100-$1FF.
(`composed.py` derives the base with `pngsync.bg_chr_base`; the first version used the lowest tile set address, which put the six shop interiors
`A4AA99` flower shop, `A4AE95` bar, `A4B3D1` restaurant, `A4B8E0` general store, `A4BCC1` animal shop and `A4C065` fortune teller - whose only set is at
$3000 - outside every set, so they were drawn as colour 0 only.)
Maps without a preset byte (weather overlays, menus, intro, areas $57+) use the base of the active preset: the base under which most used ids are found
($2000 in every case here).

`pngsync.py check` verifies every screen: FAIL when none of its tile ids is found in the loaded sets (wrong base), WARN when more than 10 % of the used cells
are not found.  Audit of all screens of the four releases (colours = distinct pixel values incl. palette row):

| Screens | Finding | Evidence |
|---|---|---|
| All other map and interior name tables (farm, town, mountain, houses, shops, roads, summit, caves, festivals, ...) | normal BG1 / BG2 tables | 0 unresolved cells, 25-109 colours, palette rows 1-7 |
| weather overlays `A48000` rain, `A4C3E2` falling leaves, `A5A3D5` heavy snow, `A5C955` snow | BG2 overlay at VRAM $7000, ids $300-$3C0 relative to base $2000 (set at $5000), priority bit set, palette row 0 | 4 colours (leaves 2), 0 unresolved after the base fix; before it 100 % unresolved |
| `A690A6`, `A694EE`, `A69996` (caves / mine floors), `A5DE84` (Natsume logo), `A58D8E` (menu characters) | sparse tables, mostly id 0 | 356-692 used cells of 4096; 3-19 colours is correct |
| `A59C08`, `A5B042`, `A5AD17`, `A5B361` (BG2 layer of tool shed / summit maps) | second layer with palette row 0 or 4, few colours | 4-15 colours, 0 unresolved |
| `A5970F` menu background pattern, `A5D44C` intro scroll | repeating pattern of a few tiles | 9-10 colours, single palette row; the seam metric is high by construction (checked by eye) |
| `A69996__sMap_80B5AF` (US, 34 %), `A694EE__sMap_80B514` (JP, 57 %) | tiles of a set that this map does not load: the 4th set ($5000) is loaded by other code / another map entry (`sMap_80B618` loads `A0CAAF` for the same table: 0 unresolved) | WARN, not an error; those cells stay colour 0 |
| `A5D94A` (logo), `A5CB05` (dialog box, DMA'd to $7800), `A6A096` | not shown with any tile set in the map table: no screen | name table of BG3 (2bpp) / raw table |

No table of the audit is a collision map or a mask: all entries are ordinary BG entries (tile id, palette row, priority, flips), every used id lies
inside a loaded tile set, and the rendered pictures read as scenery.  BG3 (2bpp) name tables are not rendered as screens (no tile blob of the map table
is shown on BG3); the dialog window `A5CB05` is the only BG3 table in the compressed tilemaps.

### Sidecar (`<label>.json`)
| Key | Meaning |
|---|---|
| `bin`, `kind`, `compression` (`lzss`/`none`), `raw_size` | where the bytes go and the decompressed size |
| `bpp`, `bpp_confidence`, `bpp_note`, `tiles_per_row` | how the sheet is laid out (tiles only) |
| `columns`, `entries` | text layout (name tables only; `columns` = row length, 32 / 64 / 128, see "Name table width") |
| `tail_hex` / `tail_zeros` | bytes of the label span after the compressed stream, preserved exactly: 1-2 zero bytes on 9 blobs |
| `vram_word_dest`, `map_entries`, `first_map`, `tile_sets` | informational, taken from the map table in `src/code/bank_80/tilemaps.asm` |
| `palette` (`id`, `sub`) | palette file (`assets/gfx/palettes/<id>.json`) and sub-palette (16-colour row 0-7) written into the PNG viewing palette |
| `palette_confidence`, `palette_note` | `high` (static name tables / object frames decide it), `medium` (weather overlays, sparse use), `low` (best guess); how it was decided |
| `palette_subs_used`, `palette_alternatives` | all sub-palettes used by the blob when more than one; other palette/sub combinations (other seasons, areas, night): at most 6, all in `palette_map.json` |

`bpp_confidence`: sprite banks and tile blobs are **high** (87 of 87; none medium or low). Evidence: VRAM slot size,
plane correlation (non-zero pixels of planes 0-1 and 2-3 overlap), and the rendered sheets. Twelve blobs have empty planes
2-3 (index < 4) or only a few tiles (fonts, kanji, weather overlays); statistics cannot separate those from 2bpp, so each was
checked by eye (reads correctly as 4bpp, garbled as 2bpp) and the note says so. Being wrong would only change how the
PNG looks: the conversion is lossless for any bytes and any bpp.

## Limits (what cannot be changed without changing the ROM layout)

* **Pixel positions are the engine's.** An image can only change colour indices of existing tile pixels. Moving a graphic to another tile, adding tiles, using
  a different flip or a different palette row for a cell, or re-arranging a frame (components, offsets, flips, attribute bytes) means editing the name table
  text / `assets/objects/` data, not the image. Blob sizes are fixed (tile blobs always 256 tiles); compressed tile blobs that grow need `--allow-resize`
  and bank space (`Padding_*`).
* **Tiles shared with the other release / with sprites are read-only in screens.** A regional screen that shows a tile of a blob shared with the US
  release, and any cell showing a sprite-bank tile, can be rendered but not edited there (error from `import`); edit it in the US screen / frame.
* **Screens only cover tiles that a name table shows.** Everything else (tiles of blobs no map table row pairs with a name table, fonts, weather overlays, kanji,
  tiles used only by code-built screens) is edited in the remainder sheets, which show only those pixels. A name table whose tile sets cannot be found
  in the map table has no image. After changing a `.map.txt`, run `pngsync.py export` (re-render the images from the `.bin`; edit the name table and the pixels in separate steps).
* **Hidden sprite pixels.** Pixels that two components of a frame both cover, or that only transparent frame positions would show, are not visible in any frame
  image; they stay in the remainder sheet (an edit of a *visible* overlapped pixel is accepted, see above). Sprite blocks that no frame uses live in the remainder sheet too.
* **Shared blocks propagate.** Changing a shared block changes every frame / screen that shows it; that is intended and is why `import` re-renders all images.
* **BG3 / 2bpp layers.** All blobs are read as 4bpp; screens of 2bpp BG layers (text) show the 4bpp reading of the tiles. The round trip is lossless anyway.

## Not converted yet

| Item | Why / plan |
|---|---|
| `sFontGlyphs_*` (11 x 4096 bytes in `assets/gfx/tiles/`) | already PNG through the font pipeline (`assets/fonts/us/glyph_*.png`, `tools/fonts/font.py`), not duplicated here |
| Palettes | already PNG + JSON + `.pal` (`assets/gfx/palettes/`) |
| Region-specific graphics of EU, DE, JP | only the US ROM is in the repository. `docs/regions.md` shows graphics that differ per language in banks $94, $95 (JP), $9A, $9B, $9E (JP), $9F, $A5, $A6 and palettes $A9 (JP). They become `assets/gfx/png/<kind>/<region>/` entries in the region unification step (the sidecar format already fits; labels would get a region suffix). |
| Title/menu/text graphics inside code or object data | graphics not stored as the blobs above (e.g. anything generated at run time, object animation data in banks $86/$87 which only references sprite tiles) have no image form |
| Per-object / per-animation sprite images | now the editable sprite source (`assets/gfx/png/frames/`); `tools/objects/spriteexport.py` additionally renders contact sheets / an index into `build/sprites_assembled/`, see `docs/formats/sprite-assembly.md` |
| Time-of-day palettes | PNGs and previews use the day slot of the first area using a blob; the other slots of every area are in `palette_map.json` (`areas`) |

## Regional versions

Blobs that differ in the EU, DE or JP release have their own sources next to the shared ones: `assets/gfx/png/<region>/tiles/<label>.png` (+ `.json`) and `assets/gfx/png/<region>/screens/*.png`,
`assets/gfx/tilemaps/<region>/<label>.map.txt`. The label is the US label of the corresponding blob. Use `pngsync.py export|import|check|build --region eu|de|jp`;
the generated `.bin` lands in `assets/gfx/{tiles,characters}/<region>/`. See `docs/regions.md`, "Regional data banks".
