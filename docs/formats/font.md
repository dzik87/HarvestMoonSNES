# Font format (dialog glyph tables)

Tool: `tools/fonts/font.py`. Editable source: `assets/fonts/<region>/glyph_<ID>.png` + `glyphs.json`
(regions `us`, `eu`, `de`, `jp`). Binary output: `sFontGlyphs_0x00..0x09.bin` and `sFontGlyphs_Dialog.bin`
(US: `assets/gfx/tiles/`).

## Storage

| Table | Label | CPU address | Glyph ids |
|---|---|---|---|
| 0-5 | `sFontGlyphs_0x00`..`0x05` | `$949843` + `$1000` * n (bank $94) | `$000`-`$17F` |
| 6-9 | `sFontGlyphs_0x06`..`0x09` | `$958000`, `$959000`, `$95A000`, `$95B000` | `$180`-`$27F` |
| 10 | `sFontGlyphs_Dialog` | `$9CBBA3` | `$280`-`$2BF` (dialog font tiles: DMA'd to VRAM $5000 by fDialog_LoadDialogBoxGraphics and fDialog_ReloadFontTiles) |

Each table is exactly 4096 bytes = 64 glyphs; no padding or unused bytes. The addresses are the same in all four
regions (the 10-entry pointer table `aLetterGlyphsPointers` is byte-identical in US, EU, DE and JP; the tool refuses
a ROM in which this table is not found). File offset = `(bank & $7F) * $8000 + (addr & $7FFF)`.

## Addressing a glyph (evidence: `fDialog_GetGlyphPointer` $839862, `src/code/bank_83/dialog.asm`)

The glyph id is the 16-bit dialog word (see `tools/dialogs/dialog.py`).

    table = id >> 6                       ; 6x LSR, x3 -> index into aLetterGlyphsPointers (ptr24)
    idx   = id & $3F
    base  = (idx & 7) * 32 + (idx >> 3) * 512     ; ((idx & $3F) >> 3) << 9, plus (idx & 7) << 5
    ptr   = table_start + base

## Glyph layout: 16x16 pixels, 2bpp, four tiles

fDialog_TransferGlyph ($839823) -> fGraphicsTransferData ($838166) issues two DMAs to VRAM (`fCore_PrepareTransfer`
$808A33, VMAIN $80, port $2118/$2119 = word writes):

* DMA 1: from `ptr`, size `A*16+16` bytes, to the destination VRAM word address `$0185`.
* DMA 2: from `ptr + $100` (the code adds `$0100` to the pointer), same size, to `$0185 + $80` words (next tile row
  of a 16-tile wide VRAM sheet).

With size 16 each DMA moves one 8x8 2bpp tile (16 bytes: per pixel row one byte of plane 0 followed by one byte of
plane 1, bit 7 = leftmost pixel). With size 32 it moves two tiles in a row. Hence a glyph is 16x16 pixels made of
four tiles:

    TL = base          TR = base + $10
    BL = base + $100   BR = base + $110

Verified on the data: each 4096-byte table is covered exactly by 64 * 4 tiles, and the rendered tables (see
`font.py sheet`) show full-width 16x16 kana/kanji in TL+TR+BL+BR.

### Background dither is part of the glyph

Pixel values: `0` and `1` are the dialog-window background, drawn as a checkerboard (`aa 00 55 00 ...` per tile,
value 1 where `(x + y)` is even). A glyph's own pixels are `2` (soft edge / shade) and `3` (ink). The dither is baked
into every glyph, i.e. the glyph overwrites the window background tile completely. Every glyph pixel that is not
a letter pixel is therefore the checkerboard. Some glyphs deviate from a clean checkerboard (a few hand-edited
pixels; e.g. table 0 row 7 `75 60`), so the tool keeps the full 4-value image instead of separating a mask:
background and glyph stay one lossless indexed image.

Editing rule: the PNG palette index is the SNES pixel value. Paint letter pixels with index 3 (ink) / 2 (edge) and
keep or restore the dither (index 0/1, `(x+y)` even = 1) elsewhere. Do not let an image editor re-order, merge or
optimise the 4 palette entries; `build` accepts only 16x16 indexed PNGs with indices 0..3 and rejects anything else.

### Blank glyphs

A glyph whose 256 pixels are exactly the plain dither has no PNG; `build` regenerates it. Per region 50 of the 704
ids are blank in this sense (US/EU/DE; 49 for JP), so 654 PNG files (655 for JP). Ids `$280`-`$2BF` (table 10) are
mostly dither or zero-filled tiles plus a few stray tile bits; those that are not plain dither (including all-zero
tiles) are stored as PNGs as well, so that the table is reproduced exactly.

## Drawn width: what the engine really uses

`fontGlyphType` ($0190) selects the glyph width in the dialog code at $8395A4: ids `$BC`-`$C5` (number-variable
digits, 0xBC + n) and `$270` are type 0, all others type 1. The type feeds the DMA size (`type*16+16` bytes) and the
VRAM advance (`fDialog_AdvanceGlyphDestination` $839838: `type*8+8` words).

* JP (`fDialog_TransferGlyph` at $839829, `PHX ... PLX` keeps X): type 1 = full 16x16 glyph (32-byte DMAs, 16 words advance); type 0 =
  8 px wide (only TL/BL).
* US/EU/DE: the routines `fDialog_TransferGlyph` and `fDialog_AdvanceGlyphDestination` start with an added
  `LDX #$0000` (bytes `A2 00 00`), so the type is always 0: only the left half (TL and BL) is ever transferred and
  every character is 8 px wide. The right half (TR/BR) of ids `$00`-`$3D` (Latin letters, punctuation) is plain
  dither. In US the remaining ids still hold the unchanged Japanese 16x16 kana/kanji/symbols
  (see `glyphs.json`: their right halves are real data but never displayed). `glyphs.json`
  records the width as `engine_glyph_width_px`.

## Character mapping

`glyphs.json` -> `chars` lists id -> character as used by `tools/dialogs/dialog.py` (`src/common/charmap.asm` plus
the per-region extras). US: `$00`-`$19` a-z, `$1A`-`$33` A-Z, `$34`-`$41` punctuation, `$42` heart, `$A2` next
marker, `$B1` space, `$B2`-`$BB` digits (dialog text), `$BC`-`$C5` digits for number variables. JP: kana,
see `tools/dialogs/glyphs/jp.json` (first occurrence of each character only; the table contains duplicates).
JP blank glyphs: `$00B1` and `$0270` are plain dither (so they have no PNG) but are real spaces. They are not duplicates:
`$00B1` is type 1 (16 px, full-width space, written `U+3000` in the dialog sources) and `$0270` is type 0 (8 px,
half-width space, written as an ASCII space). `$00B1` is by far the most used code in JP text (about 6000 uses).
In US/EU/DE the engine draws every glyph 8 px wide, so `$B1` is the only space there.

Add new letters by drawing them into a free glyph id and registering the character in the dialog tool's map.

## Differences between regions

All regions share the same engine layout; only glyph contents differ. Tables 3-8 and the UNK table are
byte-identical in all four ROMs.

| Region | Differing glyph ids vs US | Meaning |
|---|---|---|
| US | - | Latin letters in `$00`-`$41`; `$43`-... leftover JP glyphs |
| EU | `$43` (1 glyph) | `+` |
| DE | `$43`-`$4A`, `$AB`-`$AE` (12) | a/o/u-umlaut, capital umlauts, sharp s, `+`; arrow cursors up/left/down/right |
| JP | `$00`-`$42`, `$76`, `$A2`, `$B2`-`$BB`, `$275` (80) | hiragana/katakana-range glyphs at `$00`-`$42`, `$76`, the next marker `$A2`, full-width digits `$B2`-`$BB`, `$275`; JP engine draws 16 px |

Table 0 differs in JP only, table 1 in EU/DE/JP, table 2 in DE/JP and table 9 in JP (this matches `docs/regions.md`: banks
$94/$95 differ; bank $9C is identical).

## Workflow

    python3 tools/fonts/font.py extract --region us            # assets/gfx/tiles -> assets/fonts/us/
    python3 tools/fonts/font.py extract --region eu --rom ROM/EU/<file>.sfc
    python3 tools/fonts/font.py build   --region us --write-assets   # PNGs -> assets/gfx/tiles/sFontGlyphs_*.bin
    python3 tools/fonts/font.py build   --region de --out build/fonts/de
    python3 tools/fonts/font.py seal    --region de            # after an intentional edit: refresh SHA-256 values
    python3 tools/fonts/font.py check [--rom-dir ROMDIR]       # CI: byte-exact round trip

`check` always verifies that the committed PNGs of every region rebuild to the SHA-256 values recorded in
`glyphs.json` (no ROM needed) and, for US, that they equal `assets/gfx/tiles/sFontGlyphs_*.bin`. With ROMs
(`--rom-dir`, `HM_ROM_DIR`, or `HM_ROM_<REGION>`) it also checks extract -> build against the ROM bytes.

## PNG sizes: 8x16 and 16x16

`glyph_<ID>.png` is **8x16** (left half only) when the engine draws that glyph 8 px wide and its right half is plain
dither; otherwise it is 16x16. This is the case for all Latin letters and punctuation in US/EU/DE (the engine there
always draws 8 px, see above) and for the narrow digit ids of JP. Translators therefore only see and edit the pixels
that are really displayed. `build` accepts both sizes and regenerates the right half of an 8x16 glyph as the plain
dither, so the ROM bytes are unchanged (checked by `font.py check`, `tests/test_font.py` and CI).

* The leftover Japanese glyphs in US/EU/DE (kana/kanji from the original font) keep 16x16 PNGs: their right half
  holds real data that the 8 px engine never shows. These are the candidates for replacement by proper Latin glyphs
  (the original translation reused the Japanese font data and only patched the glyph routines).
* Counts of 8x16 files are stored in `glyphs.json` (`png_files_8x16`).
* `font.py narrow --region R` converts existing 16x16 PNGs in place (used once for the migration); `extract` writes the
  narrow form directly.
