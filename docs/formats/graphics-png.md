# Graphics as PNG (editable sources)

Every graphic blob of the US ROM that can be shown as an image lives in the repository as an **indexed PNG**
(tile graphics, sprite banks) or as a **text file** (BG name tables). These files are the source of truth for graphics mods;
the binary `assets/gfx/{tiles,sprites,characters}/*.bin` files that the assembler `incbin`s are **generated** from them
(`tools/build_assets.py`, git-ignored, never committed) and must stay bit-identical to the original ROM data. Converter: `tools/gfx/pngsync.py`; CI runs `pngsync.py check` and `tests/test_pngsync.py`.

## What is converted (151 blobs)

| Kind | Blobs | `.bin` (included by asm) | Editable source | Stored in the ROM as |
|---|---|---|---|---|
| `tiles` | 77 | `assets/gfx/tiles/sCompressedTiles_*.bin` | `assets/gfx/png/tiles/<label>.png` | LZSS, 8192 bytes decompressed (256 4bpp tiles) |
| `sprites` | 10 | `assets/gfx/sprites/Sprites_88..91*.bin` | `assets/gfx/png/sprites/<label>.png` | raw, 32768 bytes (1024 4bpp tiles) per bank |
| `tilemaps` | 64 | `assets/gfx/characters/sCompressedTilemap_*.bin` (60, LZSS) and `sCharactermap_*.bin` (4, raw) | `assets/gfx/tilemaps/<label>.map.txt` | BG name tables (not graphics) |

Every blob has `<label>.json` next to its source file (the sidecar). Palettes were already PNG/JSON before
(`assets/gfx/palettes/`), fonts are per-glyph PNGs (`assets/fonts/`, `docs/formats/font.md`).

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

1. Edit `assets/gfx/png/tiles/<label>.png` (or sprite sheet / name table text) with any editor that preserves an
   **indexed palette** (Aseprite, GIMP "indexed", Grafx2). Do not convert to RGB: the pixel value *is* the SNES colour index.
2. `pngsync.py import [--label PAT] [--kind K]` re-encodes blobs whose source changed (PAT is an
   `fnmatch` pattern, repeatable; default all), updating the generated `.bin`, the sidecar tail data and, with `--allow-resize`, the bank padding. Unchanged blobs are not touched.
3. Rebuild with `tools/build.py` and test. Update `tests/expected.json` only for deliberate modifications.
4. Commit PNG/text, sidecar (and the bank `.asm` if the padding changed); the `.bin` files are not committed.

`pngsync.py export` regenerates PNG/text/sidecar from the generated `.bin` files (only needed after changing the pipeline); `pngsync.py build` writes the `.bin` files from the sources.
`pngsync.py preview` renders the name tables together with their tile sets into `build/gfx_preview/` in game colours (the palette bits of
every entry pick the sub-palette, the palette is the day palette of the first map that uses the table; character base = lowest
tile-set VRAM address, which reproduces the farm map exactly) and every tile sheet / sprite bank with the right sub-palette per
8x8 tile / 16x16 sprite into `build/gfx_preview/sheets/`. Previews are derived and not committed.

### Constraints
* **Dimensions are fixed.** Tile sheets are 128 px wide (`tiles_per_row` = 16 in the sidecar); 8192-byte blobs are 128x128,
  sprite banks 128x512. Name tables keep their number of words.
* **Pixel values stay below 2^bpp** (4bpp: 0-15). `import` names the offending pixel otherwise. The 16 colours of the
  PNG palette (PLTE) are the **real colours** of the sub-palette the sheet is shown with in the game (primary palette per
  blob: `assets/gfx/palette_map.json`, evidence in [`graphics-palettes.md`](graphics-palettes.md)); sprite sheets also mark index 0
  transparent (tRNS). They are only a viewing aid: changing the PLTE has no effect on the ROM, it is ignored on import (every
  `.bin` is rebuilt from the pixel indices alone; `pngsync.py check` and `tests/test_pngsync.py` verify this).
  A sheet that the game shows with several sub-palettes (e.g. a map tile set) displays its most used one; the others are listed in
  the sidecar and in the previews. Blobs without evidence (no map loads them, see the "low" confidence entries) use the best guess
  documented there. `palette_map.json` is derived from the code tables by `tools/gfx/palette_map.py`; `export` copies it into
  the sidecars and PNGs. A manual `"palette": {"id", "sub"}` sidecar key is only kept for blobs that are not in the map.
* **Size of the compressed blob.** Edited tile graphics compress to a different length. A shorter stream is padded with zeros
  automatically (layout unchanged). A longer stream is refused unless `--allow-resize` is passed; then `import` also reduces the
  trailing `Padding_*` `fill N` in `src/data/gfx/<kind>/bank_XX.asm` by the growth, and fails if the bank is full. All
  pointers are labels, so following blobs move automatically. Raw blobs (sprites, `sCharactermap_*`) never change size.
* Name tables: `.map.txt` has `columns` 16-bit hex words per row (32; 128 for `sCharactermap_*`), a blank line after every
  32 rows, no comments. Entry = tile 0-9, palette 10-12, priority 13, H flip 14, V flip 15.

### Sidecar (`<label>.json`)
| Key | Meaning |
|---|---|
| `bin`, `kind`, `compression` (`lzss`/`none`), `raw_size` | where the bytes go and the decompressed size |
| `bpp`, `bpp_confidence`, `bpp_note`, `tiles_per_row` | how the PNG is laid out (tiles only) |
| `columns`, `entries` | text layout (name tables only) |
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

## Not converted yet

| Item | Why / plan |
|---|---|
| `sFontGlyphs_*` (11 x 4096 bytes in `assets/gfx/tiles/`) | already PNG through the font pipeline (`assets/fonts/us/glyph_*.png`, `tools/fonts/font.py`), not duplicated here |
| Palettes | already PNG + JSON + `.pal` (`assets/gfx/palettes/`) |
| Region-specific graphics of EU, DE, JP | only the US ROM is in the repository. `docs/regions.md` shows graphics that differ per language in banks $94, $95 (JP), $9A, $9B, $9E (JP), $9F, $A5, $A6 and palettes $A9 (JP). They become `assets/gfx/png/<kind>/<region>/` entries in the region unification step (the sidecar format already fits; labels would get a region suffix). |
| Title/menu/text graphics inside code or object data | graphics not stored as the blobs above (e.g. anything generated at run time, object animation data in banks $86/$87 which only references sprite tiles) have no image form |
| Per-object / per-animation sprite sheets | done as derived output (not an editable source): `tools/objects/spriteexport.py` composes every object frame into `assets/gfx/png/sprites_assembled/`, see `docs/formats/sprite-assembly.md`; PNG -> tiles re-import of assembled frames is future work |
| Time-of-day palettes | PNGs and previews use the day slot of the first area using a blob; the other slots of every area are in `palette_map.json` (`areas`) |
