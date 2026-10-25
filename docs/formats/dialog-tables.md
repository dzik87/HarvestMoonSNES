# Dialog engine tables

`src/code/bank_83/dialog.asm` ends with data tables that the text renderer uses. They are generated per release by `tools/dialogs/texttables.py`
(`build` -> `build/gen/dialogs/<region>/text_tables.asm`, included through `!{DLGDIR}`; `check` is fast and part of CI).

| Label | Content | Source |
|---|---|---|
| `aLetterGlyphsPointers` | 10 x ptr24 to the font glyph pages `sFontGlyphs_0x00-09` | derived from `assets/gfx/banks.json` |
| `aTextDataTableFFFE` | 5 words: VRAM address of the option cursor per answer of an `<OPT n>` menu (`strcDialogDisplay.dialogUnk185`) | `assets/dialogs/<region>/text_tables.json` (`option_vram`) |
| `pTextAmmountTable` | 10^0 .. 10^7 as 24-bit values (digit extraction of `<NUM>`) | derived |
| `aTextDataTableFFFC` | 112 x [ptr24 address, size] of the numeric variables (`<NUM digits index>`) | `assets/dialogs/number_vars.csv` (same in all releases; `+!RAM_SHIFT` marks WRAM that moves with the RAM layout) |
| `aTextDataTableFFFD` | N x [ptr24 address, size] of the text variables (`<VAR length index>`: player and animal names, ...) | `assets/dialogs/<region>/text_vars.csv` (US 82, EU 82, DE 63, JP 61 entries) |
| `aDialogPointers` | 1176 x ptr24 `sDialog_0xNNNN` | derived from the dialog texts (`bank_*.txt`), ids must be contiguous |

`aDialogPointers` follows the texts: a new dialog needs only its `@@ sDialog_0xNNNN @@` block. `check` verifies that all four releases have the same
number of dialogs and that the ids are contiguous.
