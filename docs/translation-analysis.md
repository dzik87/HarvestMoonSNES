# Translation analysis (Japanese base text, Latin engine)

Findings that the translation infrastructure ([translation.md](translation.md), `tools/translate/`) is built on. Everything here was
measured on the extracted assets of the four releases (`assets/dialogs/<region>/`) and on the sources in `src/`. The document names dialog ids,
counts and addresses only; it never quotes game text. The tables are reproducible:

    python tools/translate/analyze.py varmap     # variable map vs defs/translation/var_map_jp_us.json
    python tools/translate/analyze.py report     # JP vs US/EU/DE logic differences, placeholders, duplicates
    python tools/translate/analyze.py refs       # dialog ids referenced by code, AI scripts and data tables

## Decision: what "Japanese base" means for the playable ROM

The Japanese engine is a fixed 16x16 pixel kana/kanji engine (`fDialog_TransferGlyph`/`fDialog_AdvanceGlyphDestination` with type 1: 16 words
per glyph, 14 cells per line). The US/EU/DE engine draws every glyph 8 px wide (28 cells per line), so Latin text works. A Polish ROM therefore
uses the **US engine** (code, tables and graphics of the US release) with Polish dialog text and extra letters; the **Japanese text is the source
for translators** (what is said, which variables and answers appear), the US text is a secondary reference. Consequences:

* A translator sees, per dialog id, the Japanese text, the US text, the variable/number/answer skeleton of the Japanese dialog mapped to the
  US engine, and a status. Meaning follows Japanese; structure (tokens) follows Japanese mapped to the US engine; layout follows the US engine.
* Where the US engine differs from the Japanese one (section 1.3), the translation follows the US engine for what the code requires.
* Texts that are part of the US/EU/DE code and have no Japanese dialog equivalent (date strings, name grid, graphics) are listed in section 6.

## 1. Dialog id alignment JP <-> US/EU/DE

### 1.1 Overall

* All four releases have **1176 dialogs, identical ids `0x0000`-`0x0497`**, contiguous. Every id exists in every release.
* Token structure is the same in every release for the answer menus: **114 dialogs end with `<OPT n>` and n is identical in JP, US, EU and DE for every id** (0 differences).
* Numeric variable tokens: 112 `<NUM digits idx>` tokens, 112 distinct numeric variables, same index set in all releases. Only the digit count of one use differs (1.3).
* `<NEXT>` counts differ (US 528, EU 520, DE 572, JP 381) because a screen holds 84 Latin cells but only 42 Japanese cells; this is layout, not logic.
* No dialog consists of `<END>` alone and none has no glyph at all. Placeholder-like (at most 2 glyphs): id 934 in all four releases (also 935 and 382 in DE).
* Identical-text duplicates inside one release: US/EU ids 759 = 765; DE 128 = 512 and 728 = 760; JP none.

### 1.2 Does the code reference the same ids in every release?

Yes. A region-aware scan of `src/` (nesting of `if !REGION_*` honoured) finds **1991 static references**: 1810 `AICMD0x1C_ShowDialog`, 62 `0x1D`, 37 `0x54`
(AI scripts in `src/ai`) and 82 `LDX #id` before `JSL fDialog_DialogHandler` (banks $81-$84). They name the **same 966 distinct ids in US, EU, DE and JP**
(no `if !REGION_*` block contains a dialog id), so the game logic selects the same dialog in all releases. Further ids come from tables:
77 ids in the extracted data tables (weather forecast, found/sold/bought items), 11 ids `0x000F`-`0x0019` in `aDialogPointerIndexBySelection`,
and 22 computed call sites (index arithmetic in `item_actions.asm`, `player_update.asm`, `sound.asm`, `ai_engine.asm`, `input.asm`).
Ids **not referenced statically** (127): 9, 11, 13-14, 27-34, 36-52, 116, 256, 272, 312, 317, 325, 338, 362, 366, 382, 385, 417, 466, 471, 484, 516, 539, 593,
630, 638, 693, 763, 780, 794, 796-797, 843-847, 878-880, 882-889, 891, 893-905, 907-908, 927, 929-930, 932-943, 977, 1003, 1009, 1047, 1052, 1090,
1130-1144, 1150, 1167-1169. Ids 1130-1144 are the date announcements reached through computed indices; the rest is unused/leftover or computed text. They are
translated like the others (status `todo`) but have the lowest priority; use the `unref` flag of the worksheet.

### 1.3 Ids whose logic differs between JP and the Latin releases (translator attention)

Compared: kinds and indices of `<VAR>` (by meaning, via the variable map), `<NUM>` (index and digits), `<OPT>` (answers), literal digits.

| Difference | US | EU | DE |
|---|---|---|---|
| Text variables differ in meaning/number | 382, 444, 447, 906, 1130-1145 (20) | 382, 444, 447, 906, 1130-1144 (19) | 444, 447 (2) |
| `<NUM>` digits differ | 817 (JP 7 digits, US 6; EU and DE 7) | - | - |
| `<OPT>` answers differ | none | none | none |
| Literal digits differ from JP | 96, 567, 576, 587, 626, 628, 715, 796, 988, 1028, 1110, 1111 (12) | same 12 | the same 12 plus 93, 312, 359, 513, 631, 743, 884, 1008, 1117, 1118 (22) |

Interpretation:

* **Date lines (382, 444, 447, 906, 1130-1144)**: the Latin releases print `weekday`, `<NUM day>`, `ordinal` and `season`; Japanese prints `season` and the
  day number only (444 and 447 also lack the weekday in JP). US/EU have an `ordinal` field (English "1st", "2nd") that JP and DE do not have. A Polish text
  uses the fields it needs: `ordinal` and `weekday` are declared optional (`defs/translation/var_map_jp_us.json`, `optional_fields`), all others must match JP.
* **Id 1145**: JP, EU and DE contain the player-name variable; the **US dialog does not** (the US variable table still has the entry, unused). The Polish text follows JP/EU.
* **Id 817**: the US dialog prints 6 digits, JP/EU/DE 7. The Polish text uses 7 (the variable is 7 digits wide in `number_vars.csv`).
* **Literal digits**: 12 dialogs write other numbers in the US/EU/DE text than in JP (prices, counts or a translation difference; DE differs in 10 more because it
  spells numbers out). These 12 are flagged `num` in the worksheet: the translator must check the number against the Japanese text and the code.
  Another 70 US dialogs contain digits where the JP dialog has no literal digits (the Japanese text writes quantities differently); this is a notation difference, not a logic difference.

## 2. Variable tokens

The text variables (`<VAR chars idx>`) are strings in WRAM: JP table 61 entries, US 81 used + 1 unused = 82, EU 82, DE 63. They collapse to **10 fields**
(`defs/translation/var_map_jp_us.json`, derived from the WRAM addresses of the entries and cross-checked against the dialogs): `player`, `dog`, `horse`,
`cow`, `girl`, `child1`, `child2`, `season`, `weekday`, `ordinal` (US/EU only). The table repeats the same address with different indices because a dialog
uses a fresh index per use; the engine reads only the address of the entry (`.FFFD_textVariable` $8396A1: ptr24 from `aTextDataTableFFFD`, the size byte is not used), so **all indices of a field are equivalent**.

* JP -> US index map: 60 of 61 JP indices map to one US index each (`jp_to_us`; EU and DE have their own maps `jp_to_eu`, `jp_to_de`). JP index 61 has no use in a US
  dialog (see id 1145); its US entry (index 82) is unused.
* JP-only fields: none. US-only field: `ordinal` (EU too; DE has none).
* Maximum characters per field on the Latin engine (size/2 of the table entries): player/dog/horse/cow/child1/child2 4, girl 5, season 6, weekday 9, ordinal 2.
  The translation writes `<VAR player>` (symbolic; the tool inserts `<VAR 4 7>`); `<VAR chars idx>` is accepted too.
* RAM shifts: strcNames moves with `!RAM_SHIFT` (DE +6, JP -32); the map is built per release from the table addresses, so the shift is accounted for.
* Names are in **8-bit-per-character glyph words**: a name uses only glyph ids the name grid can produce (section 4).

## 3. Text engine rules (US/EU/DE engine)

Evidence: `src/code/bank_83/dialog.asm`, `src/code/bank_84/input.asm`, `src/code/bank_82/main_loop.asm`, dialog box tilemap `assets/gfx/tilemaps/Screen_DialogBox.map.txt`.

| Rule | Value | Evidence |
|---|---|---|
| Glyph cell | **8 px wide** (fixed, no variable width) | `fDialog_TransferGlyph` $839823 and `fDialog_AdvanceGlyphDestination` $839838: the region patch loads `X = 0`, so only TL/BL tiles are DMA'd, destination advance 8 words (one 2bpp tile) |
| Glyph size | 8x16 px visible (two tiles) | DMA 1 to `$0185`, DMA 2 to `$0185 + $80` (next VRAM tile row) |
| Cells per line | **28** | dialog box tilemap row 4: tiles `02-0F` then `20-2D` (14 + 14); the VRAM word address reaches low byte `$80` after 14 cells and skips `$80` words (`CMP #$0080` at $839852) |
| Lines per screen | **3** | tilemap rows 4-9 (3 lines x 2 tile rows) |
| Cells per screen | **84** (cells 0-83) | 3 x 28; the observed maximum is 84 in EU/DE, 83 on `<NEXT>` screens in all three |
| Wrapping | **none in the engine**; the text is a plain stream of cells and cell 28 simply follows cell 27 | `.getCurrentLetter` $839534 loop: one glyph per step, no word logic. The data pads lines with spaces (id `$00B1`) and 276 words in US are split across a line edge in the original |
| Line breaks | do not exist; `\n` in the dialog sources is cosmetic (`dialog.py`). Padding with spaces produces a visual break | |
| `<NEXT>` (`$00A2`) | waits for A, then clears the box and restarts at cell 0 (`fInput_DialogNextScreen` $84CF62: `dialogUnk185 = $5010`, reloads the font tiles) | |
| `<NEXT>` marker | blinking arrow drawn into **cell 83** (VRAM `$5528`, `.A2_nextScreen` $8395F1); a `<NEXT>` screen must leave cell 83 free: max **83** cells (checked: no `<NEXT>` screen in US/EU/DE is longer) | |
| `<END>` screen | up to 84 cells; the end-of-dialog blink icon is a tilemap icon, not a cell (`fDialog_AnimateBlinkIcon` $839495) | |
| Overflow | text beyond cell 83 is written behind the box (VRAM garbage); US id 638 (never referenced) has 94 cells | |
| Maximum dialog length | the dialog read offset is a 16-bit word counter (`dialogCurrentOffset` $0187), i.e. at most 65535 words; the bank limit is stricter (32768 bytes per bank) | `fDialog_IterateText` $83951C |
| Options `<OPT n>` | 1-5 answers, ends the dialog text; the answer menu is **part of the last screen**: the cursor sits at the cell list `aTextDataTableFFFE` = VRAM `$5010,$5170,$5350,$5108,$5268` = cells **0, 28, 56, 15, 43** (US/EU; DE `$5100,$5260` = 14, 42). Answer text starts one cell behind its cursor cell | `.FFFE_optionSelect` $839719, `fInput_DialogOptions_*` $84CF95-$84D0F4 |
| Option navigation | answers 1-3 in the first column (lines 1-3), 4-5 in the second column (lines 1-2); D-pad up/down moves within a column, left/right between columns | `fInput_DialogOptions_Down` $84CFEA etc. |
| Option text order | the text is a stream, so the answers must be written in cell order: for 4-5 answers that is answer 1, 4, 2, 5, 3 (cells 1, 16, 29, 44, 57) | observed in the original 5-answer dialogs |
| Shop price line | the original shop dialogs use cells 58+ of the last screen for a money label and a 7-digit `<NUM>` | |
| Speed | one glyph per frame step, fast with A held (`fInput_DialogHoldAFastText` $84CF2D) | |
| Variables | `<VAR n i>` prints n glyphs from the WRAM string; `<NUM n i>` prints n digit cells (leading zeros suppressed by blank cells, glyphs `$BC-$C5`) | `.FFFD_textVariable` $8396A1, `.FFFC_numberVariable` $839621 |
| Space | glyph id `$00B1`, one cell | |

Japanese engine for comparison: 16 px cells (type 1), 14 cells per line, 3 lines = 42 cells; `<NEXT>` marker at VRAM `$5520`; the number-variable digits (`$BC-$C5`) and `$0270` are 8 px.

**Text outside the dialog banks** that uses the same glyph engine (`fDialog_TransferGlyph` callers): the date/status line in the main loop
(`main_loop.asm` $82E40F-$82E5DE: save slot info, player name, season, date), the name entry screen (`screen_text.asm` $82EA7B, $82EA9A) and the option cursor (`input.asm`).
The name entry stores glyph ids in `strcNames` (4 characters, 8 bytes per name field).

## 4. Polish glyph budget

Required additional letters: ĄĆĘŁŃÓŚŹŻ ąćęłńóśźż = **18**.

* Glyph id = dialog word; table = id >> 6, 64 glyphs per 4096-byte table (`docs/formats/font.md`). Latin letters are `$00-$19` (a-z), `$1A-$33` (A-Z), `$34-$41` punctuation, `$42` heart.
* Free ids: the 50 "blank" ids per region are not usable: `$76` (plain dither), `$B1`/`$270` (spaces) and `$281-$2AF` (the VRAM tile area of table 10, not glyph slots).
  Free in practice are the **leftover Japanese glyphs** of the US font in `$43-$A1` and `$A3-$B0`: no US dialog uses them (the 75 ids used by US dialogs are all in `$00-$42`, `$A2`, `$B1-$BB`).
* The DE release used exactly this: `$43-$4A` (ä ö ü Ä Ö Ü ß +) and `$AB-$AE` (arrow cursors) overwritten in table 1/2. Mechanism to reuse: `EXTRA` in `tools/dialogs/dialog.py` maps ids to characters,
  the font tables are rebuilt from `assets/fonts/<region>/glyph_*.png`.
* **Decision**: Polish uses `$43-$54` (18 consecutive ids, all in table 1 = `sFontGlyphs_0x01`). `$43-$4A` are proven safe by DE; `$4B-$54` are leftover JP glyphs that US
  text, the US string tables and the reachable US name grid do not use (grid 0 enters `$00-$33`, `$38 $39 $3B-$3D $40-$42` and `$B2-$BB` only).
* **Resolved: no collision with name grid 1.** Grid 1 lists ids `$50-$A0` (and grid 2 `$A5-$AE`, `$C6-$DF`), so `$50-$54` would collide *if* grid 1 could be selected. It cannot on the
  US/EU/DE engine (evidence in section 6.1): the grid is selected only by the switch action of a selected cell, and grid 0 has no cell with action 2 or 3. The ids stay as they are and no
  fallback ids (`$A3 $A4 $AF $B0`) were needed. The guard is permanent: `check.py` verifies that no glyph id of a language is used by the US dialog text (the untranslated fallback) or
  entered by a cell of a *reachable* grid (`tools/translate/namegrid.py`, also `python tools/translate/namegrid.py reach`), and the tests assert it for Polish.
* Other characters: the US charmap has `' ! . ? " / , ( ) % - & : … ♥` and digits; missing for Polish text: typographic quotation marks (use `"`), the dash (use `-`).
  `„` can be added as a glyph if wanted (spare ids exist).
* A language gets its charmap through `translations/<lang>/lang.json` (`glyphs`): character -> glyph id plus the diacritic recipe. The tools merge it over `src/common/charmap.asm` (+ `EXTRA`).
  Glyph pixels are generated at build time from the extracted US font plus a mark overlay (`defs/translation/marks.json`), so no font pixels are committed.
* Name entry: the grid (`aNameInputGrid0`, 71 rows in US) has no Polish letters; DE added 7 rows for its 7 extra letters. The Polish translation overrides grid 0 with 89 rows
  (71 + 18 letters, `translations/pl/name_grids.txt`, docs/translation.md "Name entry grid"); section 6.1 explains where the 18 free cell positions are.

## 5. Capacity

* US dialog data: **179,310 bytes** (89,655 words) in banks $B6-$BB: B6 32,648, B7 32,742, B8 32,660, B9 32,630, BA 32,766 (all > 99.6 % full), BB 15,864 (16,904 free).
  EU 178,550, DE 189,842, JP 85,302 (in $AA-$AC). The 22 KB figures of the text files are UTF-8 sizes, not ROM sizes.
* Polish typically needs 15-25 % more than English: 179,310 x 1.25 = **224,138 bytes (6.84 banks)**; with the German growth of +6 % there is no concern either.
* Free ROM in the 2 MB LoROM image: banks **$BC-$BF** (4 x 32 KB, zero in the original), **$AA-$AC** (3 x 32 KB, unused by the US build; they hold the JP dialogs in the JP ROM), the tail of $BB.
  Together $B6-$BF = 10 banks = 327,680 bytes, 46 % more than the 25 % growth case. ExHiROM/4 MB is not needed.
* `aDialogPointers` holds ptr24, so any bank works (`sDialog_0xNNNN` labels). The table has 1176 entries and sits at the end of the dialog module in bank $83 followed by the next
  module, so **the number of dialogs cannot grow without moving code**; a translation re-uses the 1176 ids.
* **Layout decision**: the translation build packs the dialogs in id order into banks `$B6`, `$B7`, ... without splitting a dialog across a bank edge and fills banks up to `$BF`; if more is needed it
  continues in `$AA-$AC`. Unused banks stay zero. The ROM size stays 2 MB, so the header size byte and the mapper do not change; the header checksum is recomputed by the build.

## 6. Other player-visible text (checklist)

**A. Text as glyph ids.** Inventory of the plain glyph-id streams of the US code and data: a scan of `src/` (runs of `dw`/`db` values that are glyph ids) and of the extracted tables
(`assets/tables`, `assets/menu`) finds **exactly four string tables** (`game_events.asm`, `main_menu.json`); the other glyph-id uses in code are single ids (space `$B1`, blank cursor `$A8`,
digit zero `$BC`, `<NEXT>` `$A2`) and the dialogs. Status:

| Item | Where | Size | Status |
|---|---|---|---|
| Season names | `aSeasonString` $828AD9, 4 slots of 16 bytes | 6 characters read per slot (`strcNames.wSeason`, 12 bytes); the shorter names are padded with `$B1` | **table driven** (`strings.season`) |
| Weekday names | `aWeekdayString` $828B19, 7 slots of 32 bytes | 9 characters read per slot (`strcNames.wWeekday`, 18 bytes) | **table driven** (`strings.weekday`) |
| Day ordinal suffix | `aDayOrdinalString` $828BF9, 4 slots of 4 bytes | 2 characters; slot 0 = days 1/21, 1 = 2/22, 2 = 3/23, 3 = other (compare chain at $828A85-$828AA9, offsets 0/4/8/12) | **table driven** (`strings.day_ordinal`); US/EU only, Polish uses `.` |
| Year ordinal | `aYearOrdinalString` $82F298, 3 slots of 4 bytes | 2 characters, indexed by the year id (`main_loop.asm` $82E4A7 / $82E4D8) | **table driven** (`strings.year_ordinal`) |
| Date / save slot line | `fMainMenu_DrawSaveSlotInfo` $82E405-$82E5E6 | player name (4 cells), year number (digit cells), year ordinal (2 cells), day number (2 digit cells), season (6 cells); positions from `aMainMenu_SlotInfoTextVramAddr` | text part covered by the tables above; the words between the numbers are graphics (6.B) |
| Date announcements in dialogs | ids 382, 444, 447, 906, 1130-1144 (section 1.3) | | dialogs: covered by the dialog translation (`<VAR weekday>`, `<NUM>`, `<VAR season>`, `<VAR ordinal>`) |
| Name entry grids | `aNameInputGrid0/1/2` | grid 0: 71 rows | **grid 0 override** (6.1); grids 1 and 2 are dead |
| Shop item descriptions, found/sold items | dialogs (ids from `carried_items`, weather ids) | | covered by the dialog translation |

The string tables are written into the assembled ROM (`tools/translate/strings.py`); the original releases are not touched. The widths are enforced by the tools (`check.py`).
The DE release has a second copy of the ordinal table (`aDayOrdinalString_DE`) and different readers (weekday at `strcNames.wWeekday+4..`), which is why the strings are limited to the US engine.

### 6.1 Name entry: which grids and ids are reachable (US)

Evidence (static, `src/code/bank_82/screen_text.asm`, `menu.asm`, `src/code/bank_84/input.asm`, `assets/menu/name_input.txt`):

* `fScreen_NameInput` ($82E80C) sets `strcMenuData.tableSelector` ($0993) to 0 and the game initialisation (`game_engine.asm` $83AC6E) clears it. The grid pointer is chosen from this byte only
  (`fMenu_LoadNameInputCursorPos` $82EB57, `fMenu_GetNameInputCellField` $82EBAC: 0 = grid 0, 1 = grid 1, else grid 2).
* The byte is written in exactly four places, `fNameInput_SelectCharTable0-3` ($84C157, $84C17E, $84C1A8, $84C1D2), which the A button handler ($84C0EE) calls for the `action` byte (field 5) of the
  selected cell: action 1 -> grid 0, 2 -> grid 1, 3 -> grid 2, 4 -> table 3 = "name finished" (only accepted when at least one letter was entered). No other instruction in `src/` addresses $0993; a byte scan of the US ROM for `STA/STZ $0993`, `STA/STZ $0992` (16-bit), `STA $7E0993` and `STA $0993,X` finds only these writers, the
  two initialisations ($82E93A, $83AC6E) and one coincidental byte pattern inside the AI script data of bank $B3.
* **US/EU grid 0 has 71 cells and exactly one cell with an action byte, the confirm cell with action 4**; no cell has action 2 or 3. Grid 1 (84 rows) and grid 2 (49 rows) can therefore never be
  selected: they are data of the Japanese kana pages that the Latin releases carry along. (The JP grid 0 has switch cells with actions 2 and 3; the DE grid 0 has none either.)
* Reachable letters of the US grid: `$00-$33` (a-z, A-Z), `$38 $39 $3B $3C $3D $40 $41 $42` (punctuation, heart), `$B2-$BB` (digits); the empty name is `$B1`. Names are stored as one byte per
  character in `strcNames` (`sTemp` -> `sPlayer`, `sDog`, ...), so the grid can enter ids below `$100` only.
* Grid 0 geometry (cursor pixels): the screen has two blocks of 5 columns (x 40-104 and 136-200), rows y 68-132 hold A-Y / a-y, y 148 holds only Z / z, y 164 and y 180 digits and symbols, and `OK` sits at
  (192,196). The picture is the BG1 tilemap `Screen_Menu_Characters`, so a cell without a drawn letter is blank. **Free positions in the picture: 4 + 4 in the Z/z row, 2 in the last row of the right
  block (x 184 and 200, y 180), 5 + 3 in the row of `OK` (y 196)** = 18, exactly the Polish letters (DE used the Z/z row for its 7 letters).
* Capacity of the data: the three grids are contiguous ($82EBF8, $82EE30, $82F0D0; 71 + 84 + 49 = 204 rows of 8 bytes, 1632 bytes). A grid 0 override may use all of it because grids 1 and 2 are dead;
  the translation build verifies that the ROM holds the extracted US grids there before it writes (`namegrid.py`).
* Open for an emulator test (not needed for the decision): that the extra cells show a blank place until the graphics override exists, and the navigation feel of the added links.

**B. Text baked into graphics (needs PNG overrides, later phase):** Regional releases already override these, which marks them as text-as-tiles:

* `Screen_IntroFarmScroll_BG1/BG2`, `Tiles_IntroFarmScroll_0-3` (title/intro; EU, DE and JP versions exist)
* `Screen_Menu_Backgrounds`, `Screen_Menu_Characters`, `Screen_Menu_BackgroundPattern`, `Tiles_Menu_*` (main menu: the words `year` and `th of` of the save slot boxes, `Choose Diary`; the letters of the
  name entry grid; DE and JP versions)
* `Screen_ToolShed`, `Screen_ToolShed_Layer2`, `Tiles_ToolShed_1` (signs; DE and JP)
* JP only: `Screen_Title_NatsumeLogo`, `Tiles_Credits_0`, `Screen_Credits_0to3`, credits and end-screen text, `Screen_Credits4_DriveToTown__*`, `Screen_Credits_StaffRollJp__*`
* Candidate unlocalised screens of the US release to inspect: `Screen_Intro`, ending screens `Screen_Ending00-13`, credits `Tiles_Credits_0-3`, HUD/menu tiles, shop and building signs.

A PNG override mechanism like `assets/gfx/png/<region>/` (regional versions) with a `translations/<lang>/gfx/` directory is the next phase; it also draws the 18 name grid letters.
