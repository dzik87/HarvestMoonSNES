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
assets/gfx/png/screens/sCompressedTilemap_A4CFAB.png   BG name table rendered with its tile sets (77 US + 24 regional images)
assets/gfx/png/sprites/Sprites_888000.png          remainder sheet of a sprite bank   (10)
assets/gfx/png/tiles/sCompressedTiles_92D3AB.png   remainder sheet of a tile blob     (77)
assets/gfx/png/<eu|de|jp>/{screens,tiles}/         the same for the blobs that differ from US
```

* **Sprite frames** (`frames/`): the components of a frame (`tile id, x, y, attr`, from `assets/objects/`) drawn as the engine draws them (see
  `sprite-assembly.md`): 16x16 blocks, attribute bits 4/5 = vertical / horizontal flip, bits 0-2 = OBJ palette row, the last component on top.
  Pixel value = `(OBJ palette row << 4) | colour`, colour 0 = transparent; PLTE = day OBJ palette `sPalette_0x6F`, image size = bounding box of the
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
  the big world maps: 128 entries per row (`sCharactermap_A18000` = the farm, 128x128 tiles, $8000 bytes; `A28000` is
  $5FC0 bytes, the mountain). There is no raw character graphics data in the US ROM; all tile graphics are LZSS blobs.
* All graphics read as **4bpp** (the 4 VRAM slots $2000-$5000 are $1000 words = 8192 bytes = 256 4bpp tiles apart).
  Name tables use VRAM $6000/$7000/$1000.

## Workflow for modders

```
python3 tools/build_assets.py                                             # once after cloning: generate the .bin files
python3 tools/gfx/pngsync.py import --label sCompressedTiles_92D3AB    # after editing the PNG: re-encode, update sidecar/padding
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

### Name table width

A name table is a flat list of 16-bit entries; the row length (`columns` in the sidecar) decides how it is drawn into the `screens/` image
and how `.map.txt` is wrapped. It never changes the `.bin` (entry order is the same). Evidence for the widths:

* **Engine.** The map loader (`src/code/bank_80/tilemaps.asm`) uploads the big name tables row by row with a stride taken from
  `nTable_80AA68[strcDialogDisplay.mapMultiWidth]` = `$40 / $80 / $100` bytes = **32 / 64 / 128 entries per row**, and the table size from
  `nTable_80AA72` = `$1000 / $2000 / $4000` bytes. So row-major maps of 32, 64 and 128 entries per row exist (32x64, 64x64, 128x64+).
  `sCharactermap_A18000/A28000/A38000` and `sCompressedTilemap_A4DC7E` use 128. The BG tilemaps loaded by the `.tilemaps` path are
  decompressed to `$7E2000` and DMA'd linearly (`$2000` bytes) to the VRAM address of the map header, so the file order is the order in VRAM.
* **Image continuity** (`pngsync.py widths`, also part of `check`). Every table is rendered with each of 32, 64 and 128 columns and the
  *seam ratio* is computed: the share of differing neighbour pixels across 8x8 cell borders divided by the share inside cells. A correct layout
  is about 1.0 (borders are not special), a wrong one places unrelated tiles side by side and scores clearly higher (the three tables that
  were drawn 32 wide by mistake: `A48A2D` 1.52 -> 1.02, `A49745` 1.40 -> 1.03, `A4D379` 1.25 -> 1.10).
* **Rule.** Default by size (`composed.default_columns`): 4096 entries = 64, 8192 and more = 128, otherwise 32. A different width is used only
  when it is at least 0.05 more continuous than the default. Tables that are blank or not shown with any tile set keep the default
  (`sCharactermap_A6A096` is a raw 64x32 name table, `KNOWN_COLUMNS`). Regional tables take the width of the US table with the same label.
* **Check.** `pngsync.py check` fails when a table's declared width is more than 0.15 worse than the best candidate, so a wrong `columns`
  cannot be committed unnoticed. `pngsync.py widths [--region R] [--write]` prints the scores and, with `--write`, stores the suggestion
  (then `export` rewraps the `.map.txt` and redraws the screens).

Widths (`columns x rows`; seam ratio at that width, `-` = not rendered; the regional releases that carry their own copy are listed, their
widths equal the US one):

| Table | Entries | Layout | Seam | Regional copies | Note |
|---|---|---|---|---|---|
| `sCharactermap_A18000` | 16384 | 128 x 128 | 0.99 | US only |  |
| `sCharactermap_A28000` | 12256 | 128 x 96 | 1.04 | US only |  |
| `sCharactermap_A38000` | 16384 | 128 x 128 | 1.12 | US only | weak metric |
| `sCharactermap_A6A096` | 2048 | 64 x 32 | - | US only | no tile set: size / content default |
| `sCompressedTilemap_A48000` | 2048 | 32 x 64 | 0.00 | US only | blank, size default |
| `sCompressedTilemap_A481AE` | 3072 | 32 x 96 | 1.03 | US only |  |
| `sCompressedTilemap_A48A2D` | 4096 | 64 x 64 | 1.02 | US only |  |
| `sCompressedTilemap_A4945C` | 1024 | 32 x 32 | 1.17 | US only | weak metric |
| `sCompressedTilemap_A49745` | 2048 | 64 x 32 | 1.03 | US only |  |
| `sCompressedTilemap_A49B84` | 1024 | 32 x 32 | 1.20 | US only | weak metric |
| `sCompressedTilemap_A49E2E` | 4096 | 64 x 64 | 1.01 | US only |  |
| `sCompressedTilemap_A4A597` | 2048 | 32 x 64 | 1.37 | US only | metric high, image checked by eye |
| `sCompressedTilemap_A4AA99` | 2048 | 32 x 64 | 0.00 | US only | blank, size default |
| `sCompressedTilemap_A4AE95` | 2048 | 32 x 64 | 0.00 | US only | blank, size default |
| `sCompressedTilemap_A4B3D1` | 2048 | 32 x 64 | 0.00 | US only | blank, size default |
| `sCompressedTilemap_A4B8E0` | 2048 | 32 x 64 | 0.00 | US only | blank, size default |
| `sCompressedTilemap_A4BCC1` | 1024 | 32 x 32 | 0.00 | US only | blank, size default |
| `sCompressedTilemap_A4C065` | 1024 | 32 x 32 | 0.00 | US only | blank, size default |
| `sCompressedTilemap_A4C3E2` | 2048 | 32 x 64 | 0.00 | US only | blank, size default |
| `sCompressedTilemap_A4C5DE` | 4096 | 64 x 64 | 1.09 | US only |  |
| `sCompressedTilemap_A4CFAB` | 1024 | 32 x 32 | 1.00 | US only |  |
| `sCompressedTilemap_A4D379` | 4096 | 64 x 64 | 1.10 | US only |  |
| `sCompressedTilemap_A4DC7E` | 16384 | 128 x 128 | 1.13 | US only | weak metric |
| `sCompressedTilemap_A58000` | 4096 | 32 x 128 | 1.09 | de,eu,jp |  |
| `sCompressedTilemap_A58327` | 4096 | 64 x 64 | 1.13 | US only | weak metric |
| `sCompressedTilemap_A58B49` | 1024 | 32 x 32 | 1.15 | US only | weak metric |
| `sCompressedTilemap_A58D8E` | 4096 | 64 x 64 | 1.11 | de,jp |  |
| `sCompressedTilemap_A5970F` | 4096 | 64 x 64 | 3.09 | jp | metric high, image checked by eye |
| `sCompressedTilemap_A59C08` | 2048 | 32 x 64 | 1.12 | de,jp | weak metric |
| `sCompressedTilemap_A59E0B` | 1024 | 32 x 32 | 1.16 | US only | weak metric |
| `sCompressedTilemap_A5A3D5` | 2048 | 32 x 64 | 0.37 | US only |  |
| `sCompressedTilemap_A5A6A0` | 3072 | 32 x 96 | 1.14 | US only | weak metric |
| `sCompressedTilemap_A5AD17` | 2048 | 32 x 64 | 1.00 | US only |  |
| `sCompressedTilemap_A5B042` | 2048 | 32 x 64 | 1.01 | US only |  |
| `sCompressedTilemap_A5B361` | 2048 | 32 x 64 | 0.99 | US only |  |
| `sCompressedTilemap_A5B63B` | 1024 | 32 x 32 | 1.03 | US only |  |
| `sCompressedTilemap_A5B943` | 2048 | 32 x 64 | 1.07 | US only |  |
| `sCompressedTilemap_A5BD8A` | 2048 | 32 x 64 | 1.05 | US only |  |
| `sCompressedTilemap_A5C258` | 1024 | 32 x 32 | 0.93 | US only |  |
| `sCompressedTilemap_A5C4CD` | 2048 | 32 x 64 | 1.02 | US only |  |
| `sCompressedTilemap_A5C955` | 2048 | 32 x 64 | 0.00 | US only | blank, size default |
| `sCompressedTilemap_A5CB05` | 2048 | 32 x 64 | - | US only | no tile set: size / content default |
| `sCompressedTilemap_A5CD88` | 4096 | 64 x 64 | 1.21 | de,eu,jp | weak metric |
| `sCompressedTilemap_A5D44C` | 4096 | 64 x 64 | 1.21 | US only | weak metric |
| `sCompressedTilemap_A5D94A` | 4096 | 64 x 64 | - | de,eu,jp | no tile set: size / content default |
| `sCompressedTilemap_A5DE84` | 4096 | 64 x 64 | 0.97 | jp |  |
| `sCompressedTilemap_A5E253` | 1024 | 32 x 32 | 1.07 | US only |  |
| `sCompressedTilemap_A5E5CE` | 1024 | 32 x 32 | 1.10 | US only |  |
| `sCompressedTilemap_A5E977` | 1024 | 32 x 32 | 1.10 | US only |  |
| `sCompressedTilemap_A5ECFB` | 1024 | 32 x 32 | 1.00 | US only |  |
| `sCompressedTilemap_A5F059` | 1024 | 32 x 32 | 1.11 | US only |  |
| `sCompressedTilemap_A5F45A` | 1024 | 32 x 32 | 1.36 | US only | metric high, image checked by eye |
| `sCompressedTilemap_A5F671` | 1024 | 32 x 32 | 1.04 | US only |  |
| `sCompressedTilemap_A5F95C` | 1024 | 32 x 32 | 1.14 | US only | weak metric |
| `sCompressedTilemap_A5FBCE` | 1024 | 32 x 32 | 0.99 | US only |  |
| `sCompressedTilemap_A68000` | 1024 | 32 x 32 | 1.01 | US only |  |
| `sCompressedTilemap_A68229` | 1024 | 32 x 32 | 0.99 | US only |  |
| `sCompressedTilemap_A68433` | 1024 | 32 x 32 | 0.92 | US only |  |
| `sCompressedTilemap_A6867E` | 1024 | 32 x 32 | 0.98 | US only |  |
| `sCompressedTilemap_A68864` | 1024 | 32 x 32 | 1.06 | US only |  |
| `sCompressedTilemap_A68DCF` | 1024 | 32 x 32 | 0.99 | US only |  |
| `sCompressedTilemap_A690A6` | 4096 | 64 x 64 | 0.72 | jp |  |
| `sCompressedTilemap_A694EE` | 4096 | 64 x 64 | 0.77 | de,jp |  |
| `sCompressedTilemap_A69996` | 4096 | 64 x 64 | 0.65 | US only |  |

Still doubtful (cannot be decided from the picture alone):

* `sCompressedTilemap_A5970F` (4096): a repeating pattern of very different tiles with logo blocks; no layout is smooth, 64 is the best
  and the picture reads correctly by eye (the metric is not meaningful for it).
* `sCompressedTilemap_A4A597`, `sCompressedTilemap_A5F45A`: high metric at every width, but the pictures read correctly (church interior, 32x64).
* `sCompressedTilemap_A58000` (menu backgrounds, 4096): 32 x 128 scores 1.09, 64 wide 1.16, and a VRAM-paged 64x64 (four 32x32 screens) 1.08.
  None is smooth; the table probably mixes several sub-pictures. It is stored with 32 columns (0.07 better than the 64-column default,
  which is above the 0.05 margin); revisit when the menu code is understood.
* Tables that are blank (all cells empty), `A59C08`, `A5A3D5`, `A5C4CD`, `A5AD17`..`A5BD8A` (2048 entries): 32 and 64 columns score the same; the
  engine default (32) is kept. If one of them is ever shown it must be re-evaluated.

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
