# Menu data tables and the generic small-table format

## Name entry grids - `assets/menu/name_input.txt`

`aMenuData_82EBF8`, `aMenuData_82EE30` and `aMenuData_82F0D0` (bank `$82`, `src/code/bank_82/menu.asm`) are the cursor grids of the name entry screen
(selected by `strcMenuData.tableSelector` 0, 1, 2). Each cell is 8 bytes, the row number is `strcMenuData.menuIdx`:

`x y down up right left char action`

`x`,`y` are the cursor position, `down/up/right/left` the index of the neighbouring cell (`fNameInput_*Button` via `fMenu_GetNameInputCellField`, argument 0-3),
`char` the glyph entered by the A button (argument 4) and `action` 01-04 selects character set 0-3 (argument 5; 00 enters the letter).
The text file has one `table <label> [US EU DE JP]` block per grid; a grid that differs per release is split into blocks that name their releases (the block
with US becomes the `else` branch). `tools/menu/nameinput.py build` writes `build/gen/menu/name_input.asm`, `check` verifies the row numbering and that every
neighbour index points into the table.

## Small tables - `assets/tables/*.json`

`tools/data/smalltables.py` turns the spec files into `build/gen/tables/<name>.asm`. A spec lists tables (label, doc, `type` db/dw/dl, `values`, `per_line`,
optional `count`), mixed tables use `rows` (typed value rows and `{"label": ...}` entries) and releases that differ use `variants` (`"DE"`, `"EU|DE"`, `"JP"`,
`{"absent": true}`; the base body is the default/US one). Used so far:

| Spec | Tables | Included by |
|---|---|---|
| `main_menu.json` | save slot box tables (`aMainMenu_Slot*`, JP uses bytes, DE/EU/US words), `sYearOrdinal_82F298`, the palette animation lists `aMainMenu_PalAnim*` (colour word + duration, `$FFFE` + label = loop) | `menu.asm` |
| `map_room.json` | `nTable_80AA68`, `nTable_80AA72` | `tilemaps.asm` |
| `tool_sounds.json` | `nToolSoundData_80B8CD` | `audio_data.asm` |
