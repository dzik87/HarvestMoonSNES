# Translate

One directory per language under `translate/<lang>/`. It holds everything that belongs to a language: the dialog text, the font (one PNG per glyph) and the
glyph map that connects the two.

```
translate/
  README.md
  number_vars.csv          numeric variables of the dialog engine (shared by the four releases)
  us/ eu/ de/ jp/          the four ORIGINAL releases
    lang.json              code, name, kind "original", engine release
    dialogs.txt            all dialogs of the release, `@@ sDialog_0xNNNN @@` blocks (same syntax as a translation)
    text_tables.json       dialog engine tables of the release, `dialog_banks` = first dialog id of every ROM bank
    text_vars.csv          text variables of the release
    glyphs/                glyph_XXXX.png for every glyph that is not plain dither + glyph_map.json
  pl/                      a translation (the Polish one)
    lang.json              code, name, kind "translation", engine release (`us`), layout, strings, grids
    dialogs.txt            translated dialogs (only the translated ids)
    status.csv             status per dialog id (todo / draft / reviewed), translator, note
    name_grids.txt         optional override of the name entry grid (letters of the language)
    glyphs/                glyph_XXXX.png for ALL 704 glyph ids + glyph_map.json
```

The four original releases (`us`, `eu`, `de`, `jp`) are extracted from your own ROM dumps with `python tools/extract.py --rom-dir <folder>` exactly like `assets/`
(docs/extraction.md); they are committed for now so that the repository builds without dumps. A translation such as `pl` is original work and is never touched by the
extraction. The reference text for translators is generated on demand from the extracted releases into the git-ignored `build/translate/`
(see [docs/translation.md](../docs/translation.md)).

## Files of a translation

| File | Content |
|---|---|
| `lang.json` | language code and name, `kind` `translation`, engine release (`us`), layout mode (`wrap` or `raw`), `autopage`, optional `header_title`, `strings`: season / weekday / ordinal texts, `grids`: the name entry grid override |
| `dialogs.txt` | translated dialogs only: `@@ sDialog_0xNNNN @@` followed by the text with `<tokens>` |
| `status.csv` | status per dialog id (`todo` / `draft` / `reviewed`), translator, note |
| `glossary.csv` | optional terminology list: `term,preferred,forbidden,note` (`tools/translate/glossary.py check`) |
| `gfx/<Screen>.png` | optional picture overrides for text in graphics (indexed PNG, 255 = keep; `tools/translate/gfx.py`); `lang.json` `"gfx": {"name_grid": true}` draws the name entry letters |
| `name_grids.txt` | optional override of name entry grid 0 (`table aNameInputGrid0`, rows `NN: x y down up right left char action`) that adds the letters of the language; capacity 204 rows |
| `glyphs/glyph_<ID>.png` | the font: one 16x16 (or 8x16, see docs/formats/font.md) indexed PNG per glyph id, index = SNES pixel value (0/1 dither, 2 edge, 3 ink) |
| `glyphs/glyph_map.json` | the glyph map: for every id the character, the PNG, the engine width, plus the font tables. The characters of `dialogs.txt` are read from here |

## Glyph workflow

* The PNGs and the map are the source of the font and of the character set; the ROM build only reads them. Draw or change a letter: edit
  `glyphs/glyph_<ID>.png` with any pixel editor that keeps the 4-colour indexed palette, then `python tools/translate/font.py seal --lang <lang>` (records the new hashes)
  and `python tools/translate/font.py check --lang <lang>`.
* A new character: pick a free glyph id (see docs/translation-analysis.md, section 4: `$43`-`$A1`), draw the PNG, set `char` (and drop the label `unmapped`) of that id in
  `glyph_map.json`, run `font.py seal`. `python tools/translate/check.py <lang>` rejects every character of `dialogs.txt` that is not in the map.
* `python tools/translate/glyphs.py sheet <lang>` shows the letters the language adds; `python tools/translate/font.py sheet --lang <lang>` shows the whole font.

## Adding a language

1. Create `translate/<code>/lang.json` (copy `translate/pl/lang.json`; set `code`, `name`, `kind`, `strings`), an empty `dialogs.txt` and a `status.csv` with the header
   `id,status,translator,note`.
2. Create the font: add the extra letters of the language to `defs/translation/glyph_overlays.json` (glyph id, base letter, diacritic mark; marks in
   `defs/translation/marks.json`) and run `python tools/translate/glyphs.py init <code>`. It copies the US font, writes a plain-dither PNG for each blank id, paints the letters and
   writes `glyphs/glyph_map.json`. From then on the PNGs are plain files you edit by hand; nothing is generated at build time.
3. Fill `strings` (season 6, weekday 9, ordinals 2 characters; `python tools/translate/strings.py check <code>`) and, for extra letters in names, a `name_grids.txt`
   (`python tools/translate/namegrid.py check <code>`).
4. Follow the workflow in [docs/translation.md](../docs/translation.md): `python tools/translate/export.py <code>`, translate, `import.py`, `check.py`,
   `python tools/build.py --region US --translation <code>`.

Your translation text is your own work; do not paste the original game text into the repository.
