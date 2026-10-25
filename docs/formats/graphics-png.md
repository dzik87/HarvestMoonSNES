# Graphics as PNG (editable sources)

Every graphic blob of the US ROM that can be shown as an image lives in the repository as an **indexed PNG**
(tile graphics, sprite banks) or as a **text file** (BG name tables). These files are the source of truth for graphics mods;
the binary `assets/gfx/{tiles,sprites,characters}/*.bin` files that the assembler `incbin`s are derived from them and must
stay bit-identical. Converter: `tools/gfx/pngsync.py`; CI runs `pngsync.py check` and `tests/test_pngsync.py`.

## What is converted (150 blobs)

| Kind | Blobs | `.bin` (included by asm) | Editable source | Stored in the ROM as |
|---|---|---|---|---|
| `tiles` | 77 | `assets/gfx/tiles/sCompressedTiles_*.bin` | `assets/gfx/png/tiles/<label>.png` | LZSS, 8192 bytes decompressed (256 4bpp tiles) |
| `sprites` | 10 | `assets/gfx/sprites/Sprites_88..91*.bin` | `assets/gfx/png/sprites/<label>.png` | raw, 32768 bytes (1024 4bpp tiles) per bank |
| `tilemaps` | 63 | `assets/gfx/characters/sCompressedTilemap_*.bin` (60, LZSS) and `sCharactermap_A1/A2/A3*.bin` (3, raw) | `assets/gfx/tilemaps/<label>.map.txt` | BG name tables (not graphics) |

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
python3 tools/gfx/pngsync.py import --label sCompressedTiles_92D3AB    # edit the PNG first, then import
python3 tools/build.py                                                    # rebuild; ROM hash changes (intended)
python3 tools/gfx/pngsync.py check                                        # PNG/text must reproduce every .bin
```

1. Edit `assets/gfx/png/tiles/<label>.png` (or sprite sheet / name table text) with any editor that preserves an
   **indexed palette** (Aseprite, GIMP "indexed", Grafx2). Do not convert to RGB: the pixel value *is* the SNES colour index.
2. `pngsync.py import [--label PAT] [--kind K]` rewrites the `.bin` files of blobs whose source changed (PAT is an
   `fnmatch` pattern, repeatable; default all). Unchanged blobs are not touched.
3. Rebuild with `tools/build.py` and test. Update `tests/expected.json` only for deliberate modifications.
4. Commit PNG/text, sidecar, `.bin` (and the bank `.asm` if the padding changed) together; CI checks that they agree.

`pngsync.py export` regenerates PNG/text/sidecar from the `.bin` files (only needed after changing the pipeline).
`pngsync.py preview` renders the name tables together with their tile sets into `build/gfx_preview/` (grayscale, palette
bits ignored; character base = lowest tile-set VRAM address, which reproduces the farm map exactly). Previews are
derived and not committed.

### Constraints
* **Dimensions are fixed.** Tile sheets are 128 px wide (`tiles_per_row` = 16 in the sidecar); 8192-byte blobs are 128x128,
  sprite banks 128x512. Name tables keep their number of words.
* **Pixel values stay below 2^bpp** (4bpp: 0-15). `import` names the offending pixel otherwise. The 16 colours of the PNG
  palette are grayscale placeholders; changing the PNG palette has no effect on the ROM (it is ignored on import).
  The real colours come from CGRAM at run time: the BG palette row is chosen by bits 10-12 of the name-table entry, the
  contents by the graphics preset of the current map (`fCore_ManageGraphicsPresets`), see `assets/gfx/palettes/`.
  To view a sheet in game colours add `"palette": {"id": "sPalette_0x05", "sub": 3}` to its sidecar and run `export`
  (the key is kept across exports; purely cosmetic).
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
| Colour-accurate previews | needs the preset -> palette mapping of `fCore_ManageGraphicsPresets`; optional `palette` key exists for manual use |
