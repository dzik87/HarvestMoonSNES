# Translations

One directory per language code, `translations/<lang>/`. It holds only what a translator writes: the translated dialog text, status data and (optionally)
hand drawn letters. No text, graphics or fonts of the game are stored here; the reference text for translators is generated on demand from your own ROM
extraction into the git-ignored `build/translate/` (see [docs/translation.md](../docs/translation.md)).

| File | Content |
|---|---|
| `lang.json` | language code and name, engine release (`us`), layout mode (`wrap` or `raw`), `autopage`, optional `header_title`, and `glyphs`: the extra letters (character -> glyph id plus base letter and diacritic mark) |
| `dialogs.txt` | translated dialogs only: `@@ sDialog_0xNNNN @@` followed by the text with `<tokens>` |
| `status.csv` | status per dialog id (`todo` / `draft` / `reviewed`), translator, note |
| `font/glyph_<ID>.png` | optional hand drawn glyph (8x16 or 16x16 indexed PNG, same format as `assets/fonts/<region>/`) that replaces the generated letter |

## Adding a language

1. Copy `translations/pl/lang.json` to `translations/<code>/lang.json`; set `code`, `name`, and list the letters the language needs in `glyphs`
   (free glyph ids are `$43`-`$A1`; `docs/translation-analysis.md`, section 4 explains which ids are safe). Marks available: `acute`, `dot`, `ogonek`, `stroke`
   (`defs/translation/marks.json`; add new marks there).
2. Create empty `dialogs.txt` and a `status.csv` with the header `id,status,translator,note`.
3. Follow the workflow in [docs/translation.md](../docs/translation.md): `python tools/translate/export.py <code>`, translate, `import.py`, `check.py`, `python tools/build.py --region US --translation <code>`.

Your translation text is your own work; do not paste the original game text into the repository.
