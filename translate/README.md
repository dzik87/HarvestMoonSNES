# Translate

One directory per language under `translate/<lang>/`. It holds everything that belongs to a language: the dialog text, the font (one PNG per glyph) and the
glyph map that connects the two.

```
translate/
  README.md
  number_vars.csv          numeric variables of the dialog engine (shared by all languages)
  <lang>/                  one folder per language, the SAME structure for every language
    lang.json              required   identity and file names (schema below)
    dialogs.txt            required   all dialogs, `@@ sDialog_0xNNNN @@` blocks (a translation may leave ids out or empty)
    text_tables.json       required   option_vram + dialog_banks
    text_vars.csv          required   the <VAR> table: WRAM address and size of every text variable
    glyphs/                required   glyph_map.json + glyph_XXXX.png (one per glyph id)
    status.csv             translations only, optional   status per dialog id (todo / draft / reviewed), translator, note
    name_grids.txt         translations only, optional   override of the name entry grid (letters of the language)
    glossary.csv           translations only, optional   terminology list
    gfx/                   translations only, optional   picture overrides for text in graphics
  us/ eu/ de/ jp/          the four ORIGINAL releases (kind "original", extracted from your ROM dumps)
  pl/                      a translation (the Polish one; glyphs/ holds all 704 PNGs)
```

`python tools/translate/translate.py check-layout` verifies the contract for every folder (CI runs it); `python tools/translate/translate.py new <code> --name "<Name>"`
creates a complete folder (see "Adding a language").

The four original releases (`us`, `eu`, `de`, `jp`) are extracted from your own ROM dumps with `python tools/extract.py --rom-dir <folder>` exactly like `assets/`
(docs/extraction.md); they are committed for now so that the repository builds without dumps. A translation such as `pl` is original work and is never touched by the
extraction. The reference text for translators is generated on demand from the extracted releases into the git-ignored `build/translate/`
(see [docs/translation.md](../docs/translation.md)).

## lang.json

One schema for all languages (originals and translations). Paths are relative to the language folder.

| Key | Kind | Content |
|---|---|---|
| `code` | all | folder name (`us`, `pl`, ...) |
| `name` | all | display name |
| `kind` | all | `original` (extracted release) or `translation` |
| `engine_region` | all | the original release whose engine, code and RAM layout the language uses (an original names itself; translations use `us`) |
| `text` | all | `dialogs.txt` |
| `text_tables` | all | `text_tables.json` |
| `text_vars` | all | `text_vars.csv` |
| `number_vars` | all | `../number_vars.csv` (shared numeric variables) |
| `glyphs` | all | `glyphs/glyph_map.json` |
| `layout` | translation | `wrap` (the tools wrap and page the text) or `raw` (every cell written by hand) |
| `autopage` | translation | insert page breaks automatically |
| `status` | translation | `status.csv` |
| `grids` | translation, optional | `{"file": "name_grids.txt"}`: the name entry grid override |
| `gfx` | translation, optional | `{"name_grid": true}` draws the name entry letters; pictures of the folder `gfx/` are applied |
| `strings` | translation | season / weekday / ordinal texts (`tools/translate/strings.py`) |
| `header_title` | translation, optional | ROM header title (ASCII, 21 characters) |

## Files of a language

| File | Content |
|---|---|
| `dialogs.txt` | `@@ sDialog_0xNNNN @@` followed by the text with `<tokens>`. A block with an empty body is a dialog that is not translated yet (the build keeps the engine release's text) |
| `text_tables.json` | `option_vram`: the 5 VRAM addresses of the answer cursor of `<OPT n>` menus. `dialog_banks`: for an original release `{bank: first dialog id}` (how the extracted file is cut into ROM banks); for a translation a list of the ROM banks the packer may fill, in order (`["B6", ..., "BF", "AA", "AB", "AC"]`) or `"auto"` (the engine default of `defs/translation/engine.json`, the same list) |
| `text_vars.csv` | `idx,address,size` of the text variables (`<VAR n i>`); a translation owns its copy, so it can change e.g. the size of a name field |
| `glyphs/glyph_<ID>.png` | the font: one 16x16 (or 8x16, see docs/formats/font.md) indexed PNG per glyph id, index = SNES pixel value (0/1 dither, 2 edge, 3 ink) |
| `glyphs/glyph_map.json` | the glyph map: for every id the character, the PNG, the engine width, plus the font tables. The characters of `dialogs.txt` are read from here |
| `status.csv` | status per dialog id (`todo` / `draft` / `reviewed`), translator, note |
| `glossary.csv` | terminology list: `term,preferred,forbidden,note` (`tools/translate/glossary.py check`) |
| `gfx/<Screen>.png` | picture overrides for text in graphics (indexed PNG, 255 = keep; `tools/translate/gfx.py`) |
| `name_grids.txt` | override of name entry grid 0 (`table aNameInputGrid0`, rows `NN: x y down up right left char action`) that adds the letters of the language; capacity 204 rows |

The build of a translation reads `text_tables.json`, `text_vars.csv` and the glyphs from the folder of the translation, never from the folder of its engine release.

## Glyph workflow

* The PNGs and the map are the source of the font and of the character set; the ROM build only reads them. Draw or change a letter: edit
  `glyphs/glyph_<ID>.png` with any pixel editor that keeps the 4-colour indexed palette, then `python tools/translate/font.py seal --lang <lang>` (records the new hashes)
  and `python tools/translate/font.py check --lang <lang>`.
* A new character: pick a free glyph id (see docs/translation-analysis.md, section 4: `$43`-`$A1`), draw the PNG, set `char` (and drop the label `unmapped`) of that id in
  `glyph_map.json`, run `font.py seal`. `python tools/translate/check.py <lang>` rejects every character of `dialogs.txt` that is not in the map.
* `python tools/translate/glyphs.py sheet <lang>` shows the letters the language adds; `python tools/translate/font.py sheet --lang <lang>` shows the whole font.

## Adding a language

1. `python tools/translate/translate.py new <code> --name "<Name>" [--base us|pl|...]` creates `translate/<code>/` from the base language: the glyphs and the
   glyph map, `text_tables.json`, `text_vars.csv`, a `lang.json`, a skeleton `dialogs.txt` with all 1176 ids and empty bodies (no text of the base is copied), an empty
   `status.csv`, a `glossary.csv` header and `gfx/`. The new language already passes `check-layout` and builds (every empty dialog keeps the engine release's text).
2. Create the font: add the extra letters of the language to `defs/translation/glyph_overlays.json` (glyph id, base letter, diacritic mark; marks in
   `defs/translation/marks.json`) and run `python tools/translate/glyphs.py init <code> --force`, or draw the letters by hand in `glyphs/glyph_<ID>.png` and
   `glyph_map.json` and run `python tools/translate/font.py seal --lang <code>`.
3. Fill `strings` of `lang.json` (season 6, weekday 9, ordinals 2 characters; `python tools/translate/strings.py check <code>`) and, for extra letters in names, a `name_grids.txt`
   (`python tools/translate/namegrid.py check <code>`).
4. Follow the workflow in [docs/translation.md](../docs/translation.md): `python tools/translate/export.py <code>`, translate, `import.py`, `check.py`,
   `python tools/build.py --region US --translation <code>`.

Your translation text is your own work; do not paste the original game text into the repository.
