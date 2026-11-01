# Translating the game

The repository contains **no game text**. Translators work from the Japanese original, the repository only holds the translated text, its status and the tools.
Analysis and evidence for the rules below: [translation-analysis.md](translation-analysis.md).

## Concept

* **Source language: Japanese.** The Japanese dialogs are the original; the US/EU/DE texts may contain mistranslations. The worksheet shows the Japanese text first and the US text as a secondary reference.
* **Target engine: the US engine.** The Japanese engine draws fixed 16x16 kana/kanji cells; the Latin engine of the US/EU/DE releases draws 8x16 cells (28 per line, 3 lines per screen) and
  can show letters. A translated ROM is therefore the US release (code, graphics, tables) with translated dialog banks and extra letters. The Japanese structure (which variables, numbers and
  answers a dialog has) is mapped to the US engine through `defs/translation/var_map_jp_us.json`.
* **Everything ROM-derived is generated locally.** `tools/extract.py` fills `assets/` from your own dumps (`docs/extraction.md`); the worksheet, the check reference and the glyph bases come from there. The
  worksheet lives in the git-ignored `build/translate/` and **must never be committed**. Your translation text is your own work.
* Untranslated ids fall back to the US text, so the ROM builds and runs at every stage.

## Workflow

```sh
python tools/extract.py --rom-dir <folder with your dumps>      # once: assets/ from your ROMs
python tools/translate/export.py pl                              # build/translate/pl_worksheet.txt  (or --format tsv for a spreadsheet)
#   edit the worksheet: write the Polish text below the comment lines of a dialog
python tools/translate/import.py pl build/translate/pl_worksheet.txt   # validates, merges into translations/pl/dialogs.txt, sets status draft
python tools/translate/check.py pl                               # full validation (dialogs, strings, name grid, glyph ids), coverage, capacity
python tools/translate/stats.py pl                               # progress per bank / status
python tools/build.py --region US --translation pl               # build/HarvestMoon_US_pl.sfc  (open it in an emulator)
```

`export.py` options: `--bank B6`, `--status todo`, `--format tsv`, `--out FILE`. `import.py` options: `--status reviewed`, `--skip-invalid`.
You can also edit `translations/pl/dialogs.txt` directly (same block syntax) and run `check.py`.

The translated ROM is written to `build/HarvestMoon_US_<lang>.sfc` (plus its asar symbol file `.sym`, used to verify the table addresses); there is no reference hash for it. The build prints the coverage, the string
tables and the name grid it patched, and the header checksum (recomputed). The four original
releases are built exactly as before (`python tools/build.py [--region EU|DE|JP]`).

## Text syntax (`translations/<lang>/dialogs.txt`)

    @@ sDialog_0x0123 @@
    Text of the dialog.<NEXT>Second screen of the same dialog.<END>

A block starts with `@@ sDialog_0xNNNN @@` (the id of the Japanese dialog, hex). Comment lines start with `;`.

| Token | Meaning |
|---|---|
| plain text | letters of the language charmap; a space or a line break in the source is one space |
| `<NEXT>` | wait for the A button, clear the box (a new screen). Optional: with `autopage` the tools insert it when a screen is full |
| `<END>` | end of the dialog (appended automatically if missing) |
| `<OPT n>` | selection menu with n answers (1-5); must equal the Japanese dialog. Ends the text |
| `<OPTLBL k>` | positions the text of answer k (cell behind its cursor cell); write the answers in cell order (answers 1, 4, 2, 5, 3 when there are four or five) |
| `<VAR name>` | text variable: `player`, `dog`, `horse`, `cow`, `girl`, `child1`, `child2`, `season`, `weekday`, `ordinal` (also `<VAR chars index>` with US indices) |
| `<NUM digits index>` / `<NUM index>` | numeric variable; index and digits must equal the Japanese dialog |
| `<BR>` | line break (pads to the next line); two in a row leave an empty line |
| `<POS n>` | continue at cell n of the screen (0-83) |
| `<XXXX>` | a raw glyph id in hex |

Rules checked by `check.py`:

* **Variables**: every variable of the Japanese dialog must appear (same fields, same count); extra variables are errors except the optional ones (`ordinal`, `weekday`, US-only date words). The ids where the
  Latin releases differ from Japanese are listed in the analysis (section 1.3) and flagged `diff` in the worksheet; `num` marks dialogs whose literal numbers differ between JP and US: check the number
  against the Japanese text and the code. `unref` marks ids that no code or table references statically (lowest priority).
* **Numbers and answers**: `<NUM>` indices/digits and `<OPT n>` equal the Japanese dialog.
* **Characters**: only characters of the charmap (`src/common/charmap.asm` plus the letters of `lang.json`). Typographic quotes and dashes: use `"` and `-`.
* **Layout** (engine rules, `defs/translation/engine.json`): 28 cells per line, 3 lines = 84 cells per screen, no wrapping in the engine. The tools wrap words and pad lines with spaces; a word longer than a line
  is an error. A screen that continues with `<NEXT>` must leave cell 83 free (the blinking arrow); a variable counts with its full width (names: 4 characters, girl 5, season 6, weekday 9, ordinal 2).
  Set the block flag `raw` (`@@ sDialog_0x0001 @@ raw`) to write a dialog cell by cell without any layout (needed only for special cases).
* **Answer menus**: the cursor sits in cell 0, 28, 56 (answers 1-3) and 15, 43 (answers 4-5); the answer text starts one cell later. The check reports an answer without text at its cell.
* **Capacity**: the dialogs are packed into banks $B6-$BF (then $AA-$AC), 10+ banks of 32 KB for 179,310 bytes of US text; the check prints the use.
* **Status**: `todo` / `draft` / `reviewed` in `status.csv` (imports set `draft`; `import.py --status reviewed` after review). `stats.py` shows the progress.

## Letters (glyphs)

The Latin font has no Polish letters. `lang.json` maps each extra letter to a free glyph id (`$43-$54` for Polish; they are free in the US text and cannot collide with the
name entry grids, see the analysis section 4), a base letter and a mark (`acute`, `dot`, `ogonek`, `stroke`). Names are one byte per character, so a letter that is entered in a
name needs an id below `$100`. The build **generates**
the glyphs from the extracted US font plus the mark pixels of `defs/translation/marks.json` and writes them into the font table of the ROM, so no font pixels are committed. To hand draw a letter put
`translations/<lang>/font/glyph_<ID>.png` (8x16 or 16x16 indexed PNG, palette index = pixel value, see `docs/formats/font.md`) next to it; it replaces the generated one. Preview:
`python tools/translate/glyphs.py sheet pl` writes `build/translate/pl_glyphs.png`.

## Strings outside the dialogs (`strings` in `lang.json`)

Four small tables of the US engine are plain glyph-id streams and are translated through `lang.json`. They are written into the assembled ROM after the build (like the font), so the
sources and the four original releases do not change. The tables are described in `defs/translation/strings.json` (asar label, address, slot size, characters per slot, keys).

| Table | Keys (slot order) | Max characters | Where it appears |
|---|---|---|---|
| `season` | `spring` `summer` `autumn` `winter` | **6** | `<VAR season>` in dialogs, season word of the save slot line of the main menu |
| `weekday` | `sunday` `monday` `tuesday` `wednesday` `thursday` `friday` `saturday` | **9** | `<VAR weekday>` in dialogs (0 = the first day of the game's week, the table starts with the one named `sunday`) |
| `day_ordinal` | `first` `second` `third` `other` | **2** | `<VAR ordinal>` in dialogs; slot `first` = days 1 and 21, `second` = 2 and 22, `third` = 3 and 23, `other` = every other day |
| `year_ordinal` | `year1` `year2` `year3` | **2** | the save slot line of the main menu, behind the year number |

```json
"strings": {
  "season":  {"spring": "...", "summer": "...", "autumn": "...", "winter": "..."},
  "weekday": {"sunday": "...", "monday": "...", ...},
  "day_ordinal": {"first": ".", "other": "."}
}
```

* A key is the label above or the slot index (`"2"`). A slot that is not listed keeps the US text. Characters: the language charmap (including its extra letters); `<XXXX>` is a raw glyph id.
* A text may be **shorter** than the maximum: it is padded with the space glyph (the engine prints every cell of the field, so a short word leaves a gap behind it in a dialog, as in the
  original). It may **not be longer** (the readers copy exactly that many words); `check.py` reports it, the build stops. Abbreviate (`Poniedz.`) when a word does not fit.
* **Date line**: the dialogs that announce the date (ids listed in the analysis, section 1.3) are normal dialogs: write the date in the grammar of the language with `<VAR weekday>`, `<NUM ...>`,
  `<VAR season>` and, if wanted, `<VAR ordinal>` (optional, an empty or `.` ordinal is fine). The **save slot line** of the main menu is drawn by code in a fixed order (name, year number and
  year ordinal, day number, season) at fixed positions; the words between the numbers (`year`, `th of`) are tiles of the background graphics, so only the season word and the year ordinal can be
  translated for now (`.` as a year ordinal avoids a wrong English suffix); the rest follows with the graphics override (later phase).
* Check: `python tools/translate/strings.py check pl`, list: `python tools/translate/strings.py list`.

## Name entry grid (`grids` in `lang.json`)

The name entry screen has a cursor grid of 71 cells in the US/EU/DE release (grid 0). The grids 1 and 2 of the Japanese kana pages are dead data in these releases: the only code that selects a
grid is the switch action of a selected cell (`fNameInput_SelectCharTable0-3`), and grid 0 has no cell with action 1-3 (the one action cell is the confirm cell `OK`). The reachability proof and the
table are in the analysis (section 4 and 6); `python tools/translate/namegrid.py reach` prints it from the extracted grids.

A language adds its letters by overriding grid 0:

```json
"grids": {"file": "name_grids.txt"}            ("enabled": false, or no "grids" key = the original grid)
```

`translations/<lang>/name_grids.txt` holds one `table aNameInputGrid0` block in the syntax of `assets/menu/name_input.txt` (`NN: x y down up right left char action`, see
[formats/menu-data.md](formats/menu-data.md)). The build writes the rows over the start of the dead grid area at the address of `aNameInputGrid0`, so no code changes; the original rows stay in
place until it runs. Rules checked by `check.py` / `python tools/translate/namegrid.py check pl`:

* up to **204 rows** (71 + 84 + 49 = the three grids, they are contiguous in ROM; row numbers are one byte); the Polish grid has 89 (71 original + 18 letters);
* every neighbour index is inside the table, **every cell is reachable** with the D-pad from cell 0, a confirm cell (action 4) exists, no two cells share a position;
* no switch action 1-3 (the grids 1 and 2 are not supported in a translation: they would make the dead kana ids reachable and collide with the new letter ids);
* a cell enters either a letter of the US grid or a glyph id of the language (`lang.json`); a letter of the language without a cell is a warning.

Capacity of the **picture**: the grid is a background tilemap (`Screen_Menu_Characters`, text in graphics) with exactly **18 free cell positions** next to the letters (4 + 4 in the row of Z / z,
2 in the last letter row of the right block, 5 + 3 in the row of `OK`): exactly the 18 Polish letters. Their positions are used by the Polish override. The cells are selectable and enter their letter
(it appears in the name box, which uses the dialog font), but the letter is **not drawn in the grid** until the graphics override exists (later phase: the tiles of the new letters and their tilemap
entries). Languages that need more than 18 letters need extra rows in the picture (a new row of cells) as well.

## Adding another language

See [../translations/README.md](../translations/README.md): a new `translations/<code>/` with `lang.json` (letters, `strings`, optional `grids`), `dialogs.txt`, `status.csv`, then the same commands with `<code>`.
Languages that need more than 18 extra letters or other marks add them to `defs/translation/marks.json` and take free glyph ids.

## Not covered yet

Text baked into graphics (menu words such as `year`, intro, signs, ending/credits screens, the letters of the name entry picture): [translation-analysis.md](translation-analysis.md), section 6.B.
Until the graphics override exists those parts of a translated ROM stay English.
