# Font format (dialog glyph tables)

Tool: `tools/translate/font.py` (map handling: `tools/translate/glyphmap.py`). Editable source of every language: `translate/<lang>/glyphs/glyph_<ID>.png` +
`translate/<lang>/glyphs/glyph_map.json` (languages `us`, `eu`, `de`, `jp` = the original releases, `pl` = a translation, ...). Binary output: `sFontGlyphs_0x00..0x09.bin` and
`sFontGlyphs_Dialog.bin` (original releases: `assets/gfx/tiles/`, `assets/gfx/tiles/<region>/`; a translation patches the tables into the ROM image after the assembly,
`tools/translate/build.py post`).

## The glyph map (`glyph_map.json`)

One file per language, the **single source of truth** for glyph id <-> character <-> PNG file. The dialog converters (`tools/translate/dialog.py`, the translation tools) read their
characters from it, `font.py build` builds the font from it and the PNGs. Format (JSON, one glyph per line so that diffs stay small):

```
{
 "_doc": "...", "lang": "pl", "kind": "translation", "engine_region": "us", "source": "...",
 "tables": [ {"table": 0, "label": "sFontGlyphs_0x00", "file": "sFontGlyphs_0x00.bin", "cpu_address": "$949843", "first_id": "0x0000", "last_id": "0x003F",
              "referenced_by_engine": true, "sha256": "..."}, ... 11 entries ],
 "glyphs": [ {"id": "0x0043", "char": "Ą", "png": "glyph_0043.png", "width": 8, "note": "A + ogonek"}, ... 704 entries, ids 0x0000-0x02BF in order ]
}
```

| Field | Meaning |
|---|---|
| `id` | glyph id = the dialog word that shows the glyph (`0x0000`-`0x02BF`; table = id >> 6, 64 glyphs per table) |
| `char` | the Unicode character the glyph stands for in the dialog text of the language, or `null` (the text writes the id as `<XXXX>`). One character per id, no character twice, never `<` or `>` |
| `label` | only for glyphs without a character: `blank` (plain dither), `unmapped` (a glyph that has no reading, e.g. a leftover Japanese glyph in US/EU/DE), `duplicate` (JP: repeats the character of another id; `display` holds the reading), `window` (ids `$0280`-`$02BF`, dialog window tile data), `<NEXT>` (the next-screen marker, US/EU/DE; the control word `$00A2` is written `<NEXT>`) |
| `png` | file name `glyph_XXXX.png` in the same folder, or `null` = the id is the plain dither and has no PNG. A glyph without PNG must have the label `blank` (it may still have a character: the space `$B1`) |
| `width` | width in pixels with which the engine of the language draws the glyph: 8 for US/EU/DE and every translation (US engine); JP 16, or 8 for the narrow ids `$BC`-`$C5`, `$270` |
| `display` | optional (JP): reading used only to show the Japanese reference text in the translation worksheet, never by a converter |
| `note` | optional, region specific remark (next marker, JP blanks, the base letter + mark of a generated Polish letter) |
| `tables` | the 11 font tables: label, `.bin` file name, CPU address, glyph id range and the SHA-256 of the built 4096 bytes (`font.py seal` recomputes it after an edit; `check` verifies it) |

Rules enforced by `font.py build/check` and `glyphmap.py` (every violation is an error that names the glyph): exactly 704 entries in id order; `png` is `glyph_<id>.png` or `null`; `null` only
with the label `blank`; every listed PNG exists and no `glyph_*.png` is left out of the map; a PNG is an indexed (palette) image of 16x16 or 8x16 pixels with indices 0..3; `width` is 8 or 16;
characters are unique single characters. For a translation the map must not replace a character of its engine release (`check.py`, `Lang`).

Translations have a PNG for **all** 704 ids (plain-dither PNGs for the blank ids), so the whole font is visible and editable; the original releases omit the PNG of an id that is
exactly the plain dither (50 ids, 49 in JP). `glyphs.py init <lang>` creates the files of a translation (US font + overlays), see `docs/translation.md`. The characters of the four original
releases are not in the ROM: the extraction takes them from `defs/translation/charmaps.json` (the extraction seed; `font.py check` verifies that the committed maps agree with it) and writes them
into the maps; the maps are what everything else reads.

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

The glyph id is the 16-bit dialog word (see `tools/translate/dialog.py`).

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
  (see `glyph_map.json`: their right halves are real data but never displayed). The map
  records the width of every glyph in `width`.

## Character mapping

The `char` fields of the glyph map list id -> character as used by `tools/translate/dialog.py`. US: `$00`-`$19` a-z, `$1A`-`$33` A-Z, `$34`-`$41` punctuation, `$42` heart, `$A2` next
marker, `$B1` space, `$B2`-`$BB` digits (dialog text), `$BC`-`$C5` digits for number variables. JP: kana (first occurrence of each character only; the font repeats some characters,
those ids have `char` null, label `duplicate` and the reading in `display`). The 20 glyph ids of the text range ($0000-$027F) that have no `char` in the JP map (digit cells $00BC-$00C5, kanji $01E7 $01F0 $0208 $0219 $0221 $0260, the heart $0274, the cow and chicken icons $027E/$027F, `_` $00A8) carry such a `display` reading; the translation worksheet uses it to show the Japanese text without `<XXXX>` placeholders (display only, the dialog converter still writes these ids as `<XXXX>`).
JP blank glyphs: `$00B1` and `$0270` are plain dither (so they have no PNG) but are real spaces. They are not duplicates:
`$00B1` is type 1 (16 px, full-width space, written `U+3000` in the dialog sources) and `$0270` is type 0 (8 px,
half-width space, written as an ASCII space). `$00B1` is by far the most used code in JP text (about 6000 uses).
In US/EU/DE the engine draws every glyph 8 px wide, so `$B1` is the only space there.

Add new letters by drawing them into a free glyph id and registering the character (`char`) of that id in the glyph map of the language, then `font.py seal`.

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

    python3 tools/extract.py --rom-dir <your dumps> --only fonts   # ROM -> translate/<region>/glyphs/ (all four releases)
    python3 tools/translate/font.py extract --lang eu --rom ROM/EU/<file>.sfc   # one release from one ROM file
    python3 tools/translate/font.py build   --lang us --write-assets   # PNGs + map -> assets/gfx/tiles/sFontGlyphs_*.bin
    python3 tools/translate/font.py build   --lang pl --out build/fonts/pl   # any language into a directory (--region is the old name of --lang)
    python3 tools/translate/font.py seal    --lang de            # after an intentional edit: refresh SHA-256 values
    python3 tools/translate/font.py check [--lang L]... [--rom-dir ROMDIR]       # CI: map consistent, byte-exact round trip
    python3 tools/translate/font.py sheet   --lang pl            # contact sheet of the whole font
    python3 tools/translate/glyphs.py init  pl                  # create the glyph PNGs of a translation (once)

`check` always verifies that the glyph map is consistent with the PNG files, that the committed PNGs of every language rebuild to the SHA-256 values recorded in
the map (no ROM needed) and, for US, that they equal `assets/gfx/tiles/sFontGlyphs_*.bin`. With ROMs
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
* The width in the map (`width`) is the engine width; the PNG size follows from the pixels (8x16 when the right half is plain dither and the engine draws 8 px).
* `font.py extract` writes the narrow form directly.
