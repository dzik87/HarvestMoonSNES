#!/usr/bin/env python3
"""Name entry grid of a translation (the cursor cells of the name entry screen, extra letters of the language).

  translations/<lang>/lang.json   "grids": {"file": "name_grids.txt", "enabled": true}      ("enabled": false or no "grids" key = the original grid)
  translations/<lang>/name_grids.txt   `table aNameInputGrid0` + rows `NN: x y down up right left char action` (same syntax as assets/menu/name_input.txt, docs/formats/menu-data.md)

What the code does (evidence: docs/translation-analysis.md, section 6): the screen starts on grid 0 (`strcMenuData.tableSelector` = 0, set by `fScreen_NameInput` and the new game
initialisation); the only code that writes another value is fNameInput_SelectCharTable0-3, called from the A button handler for the `action` byte of the selected cell.  The
US/EU/DE grid 0 has no cell with action 1-3, therefore the grids 1 and 2 (kana grids of the Japanese release) are dead data in these releases and the glyph ids they list
($50-$A0, $A5-$AE, $C6-$DF) can never be entered.  The translation build writes the grid 0 override over the start of that dead area (same address, so the code is unchanged).
The picture of the grid is a BG1 tilemap (Screen_Menu_Characters, text in graphics): a cell the override adds is selectable and enters its letter, but it shows no letter
shape until the tiles are drawn (graphics override, later phase).

  python tools/translate/namegrid.py reach            reachability report of the original US grids
  python tools/translate/namegrid.py check pl         validate translations/pl/name_grids.txt against the US grid
"""
import argparse
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import common as C                                          # noqa: E402

sys.path.insert(0, str(C.ROOT / "tools" / "menu"))
import nameinput                                            # noqa: E402

GRID_LABELS = ("aNameInputGrid0", "aNameInputGrid1", "aNameInputGrid2")
ROW_BYTES = 8
ACTION_CONFIRM = 4           # fNameInput_SelectCharTable3: leaves the screen when at least one letter was entered


def grid0_address():
    """SNES address of aNameInputGrid0 in the US release (defs/menu/name_input.json)"""
    spec = C.read_json(C.ROOT / "defs" / "menu" / "name_input.json")
    t = next(t for t in spec["tables"] if t["label"] == GRID_LABELS[0])
    g = next(g for g in t["groups"] if "US" in g["rom"])
    return int(g["rom"]["US"].lstrip("$"), 16)


def us_grids(root=C.ROOT):
    """{label: rows} of the US release (assets/menu/name_input.txt)"""
    out = {}
    for label, groups in nameinput.load(root).items():
        default = next((g for g in groups if "US" in g[0]), groups[0])
        out[label] = default[1]
    return out


def reachable_cells(rows, start=0):
    """Cells reachable with the D-pad from `start` (links down/up/right/left)"""
    seen, todo = {start}, [start]
    while todo:
        r = rows[todo.pop()]
        for k in (2, 3, 4, 5):
            n = r[k]
            if n < len(rows) and n not in seen:
                seen.add(n)
                todo.append(n)
    return seen


def reachable_grids(grids):
    """Grids that can be selected, starting with grid 0: follow the switch cells (action 1-3 = grid 0-2, 4 = leave) of every reachable cell.
    -> (set of grid numbers, {grid number: set of reachable cells})"""
    cells, todo = {}, [0]
    while todo:
        g = todo.pop()
        if g in cells or g >= len(GRID_LABELS) or GRID_LABELS[g] not in grids:
            continue
        rows = grids[GRID_LABELS[g]]
        cells[g] = reachable_cells(rows)
        for i in cells[g]:
            a = rows[i][7]
            if 1 <= a <= 3:
                todo.append(a - 1)
    return set(cells), cells


def entered_ids(grids, reach=None):
    """Glyph ids that the reachable letter cells can enter: {id: [(grid, cell), ...]}"""
    gset, cells = reach or reachable_grids(grids)
    out = {}
    for g in sorted(gset):
        rows = grids[GRID_LABELS[g]]
        for i in sorted(cells[g]):
            if rows[i][7] == 0:
                out.setdefault(rows[i][6], []).append((g, i))
    return out


def load_override(lang):
    """-> rows of the grid 0 override or None; raises ValueError for a malformed file"""
    g = lang.cfg.get("grids")
    if not isinstance(g, dict) or not g.get("file") or g.get("enabled", True) is False:
        return None
    f = g["file"]
    p = lang.dir / f
    tables = nameinput.parse(C.read_text(p), str(p.name))
    for label in tables:
        if label != GRID_LABELS[0]:
            raise ValueError("%s: only %s can be overridden (grids 1 and 2 are not reachable on the US engine), found %s" % (p.name, GRID_LABELS[0], label))
    if GRID_LABELS[0] not in tables:
        raise ValueError("%s: no `table %s` block" % (p.name, GRID_LABELS[0]))
    groups = tables[GRID_LABELS[0]]
    if len(groups) != 1 or set(groups[0][0]) != set(nameinput.REGIONS):
        raise ValueError("%s: write one `table %s` block without a release list" % (p.name, GRID_LABELS[0]))
    return groups[0][1]


def capacity(base=None):
    """Rows the override may have: grid 0 plus the dead grid 1 and grid 2 behind it (same area in ROM)."""
    base = base or us_grids()
    return sum(len(base[l]) for l in GRID_LABELS)


def check_override(lang, rows, base=None, ctx=None):
    """-> (errors, warnings) of a grid 0 override"""
    base = base or us_grids()
    errors, warnings = [], []
    e = errors.append
    if not rows:
        return ["grids: the override has no rows"], warnings
    cap = capacity(base)
    if len(rows) > cap:
        e("grids: %d rows, the dead grid area has room for %d" % (len(rows), cap))
        return errors, warnings
    if len(rows) > 255:
        e("grids: row numbers are one byte, at most 255 rows")
    for i, r in enumerate(rows):
        if len(r) != ROW_BYTES or any(not 0 <= b <= 255 for b in r):
            e("grids: row %02X is not 8 bytes" % i)
            return errors, warnings
        for k, nm in ((2, "down"), (3, "up"), (4, "right"), (5, "left")):
            if r[k] >= len(rows):
                e("grids: row %02X %s neighbour %02X is outside the table (%d rows)" % (i, nm, r[k], len(rows)))
        if r[7] in (1, 2, 3):
            e("grids: row %02X has action %d (switch to grid %d), which is not allowed: the grids 1 and 2 are overwritten/unsupported in a translation" % (i, r[7], r[7] - 1))
        elif r[7] > ACTION_CONFIRM:
            e("grids: row %02X has the unknown action %d" % (i, r[7]))
    if errors:
        return errors, warnings
    # reachability: every cell must be selectable, the confirm cell must exist
    reach = reachable_cells(rows)
    lost = sorted(set(range(len(rows))) - reach)
    if lost:
        e("grids: cell(s) %s cannot be reached with the D-pad from cell 0" % " ".join("%02X" % i for i in lost))
    if not any(r[7] == ACTION_CONFIRM for r in rows):
        e("grids: no confirm cell (action 4): the name could never be accepted")
    # letters: the original characters plus the glyph ids of the language
    orig = {r[6] for r in base[GRID_LABELS[0]] if r[7] == 0}
    lang_ids = {g["id"] for g in lang.glyphs.values()}
    used = {}
    for i, r in enumerate(rows):
        if r[7] == 0:
            used.setdefault(r[6], []).append(i)
    for gid, cells in sorted(used.items()):
        if gid not in orig and gid not in lang_ids:
            e("grids: cell(s) %s enter glyph $%02X, which is neither a letter of the US grid nor a letter of the language" % (" ".join("%02X" % i for i in cells), gid))
        if len(cells) > 1:
            warnings.append("grids: glyph $%02X is entered by %d cells (%s)" % (gid, len(cells), " ".join("%02X" % i for i in cells)))
    missing_orig = sorted(orig - set(used))
    if missing_orig:
        warnings.append("grids: the original grid enters glyph(s) %s that the override cannot enter any more" % " ".join("$%02X" % g for g in missing_orig))
    unreachable_lang = sorted(g for g in lang_ids if g not in used)
    if unreachable_lang:
        warnings.append("grids: letter(s) %s of the language cannot be entered in the name entry screen" % " ".join("$%02X" % g for g in unreachable_lang))
    # positions: two cells must not share a position
    pos = {}
    for i, r in enumerate(rows):
        pos.setdefault((r[0], r[1]), []).append(i)
    for p, cells in sorted(pos.items()):
        if len(cells) > 1:
            e("grids: cells %s share the position %d,%d" % (" ".join("%02X" % i for i in cells), p[0], p[1]))
    if rows[0][:2] != base[GRID_LABELS[0]][0][:2]:
        warnings.append("grids: cell 00 (the start cell) moved from %d,%d" % tuple(base[GRID_LABELS[0]][0][:2]))
    return errors, warnings


def collisions(lang, grids_after, ctx=None):
    """Language glyph ids that a *reachable* cell of a grid other than the language's own cells enters (a letter id used by another meaning).  `grids_after` = grids of the
    finished ROM ({label: rows}); the language cells are the cells of grid 0 that enter a glyph id of the language."""
    lang_ids = {g["id"] for g in lang.glyphs.values()}
    gset, cells = reachable_grids(grids_after)
    out = []
    for g in sorted(gset):
        if g == 0:
            continue
        rows = grids_after[GRID_LABELS[g]]
        for i in sorted(cells[g]):
            if rows[i][7] == 0 and rows[i][6] in lang_ids:
                out.append((g, i, rows[i][6]))
    return out


def render_rows(rows):
    return "\n".join("%02X: %s" % (i, " ".join("%02X" % b for b in r)) for i, r in enumerate(rows))


def patch_rom(rom, lang, symbols=None, base=None):
    """Write the grid 0 override into an assembled US ROM (bytearray) at aNameInputGrid0.  The original tables are verified first (grid 0, 1, 2 must be contiguous and
    equal the extracted US grids), so a wrong address or a stale spec stops the build.  -> number of rows written (0 = no override)"""
    rows = load_override(lang)
    if rows is None:
        return 0
    base = base or us_grids()
    errors, _ = check_override(lang, rows, base)
    if errors:
        raise SystemExit("name grid override has errors:\n  " + "\n  ".join(errors))
    import strings as S
    addr = grid0_address()
    if symbols is not None:
        for n, label in enumerate(GRID_LABELS):
            want = addr + sum(len(base[l]) for l in GRID_LABELS[:n]) * ROW_BYTES
            got = symbols.get(label)
            if got != want:
                raise SystemExit("name grid: label %s is at %s in this build, expected $%06X (the three grids must be contiguous)" % (label, "$%06X" % got if got else "missing", want))
    o = S.rom_offset(addr)
    old = b"".join(bytes(r) for l in GRID_LABELS for r in base[l])
    if bytes(rom[o:o + len(old)]) != old:
        raise SystemExit("name grid: the ROM at $%06X does not hold the extracted US grids (wrong region or stale assets)" % addr)
    new = b"".join(bytes(r) for r in rows)
    rom[o:o + len(new)] = new
    return len(rows)


def main(argv=None):
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    sub = ap.add_subparsers(dest="cmd", required=True)
    sub.add_parser("reach")
    c = sub.add_parser("check")
    c.add_argument("lang")
    a = ap.parse_args(argv)
    base = us_grids()
    if a.cmd == "reach":
        gset, cells = reachable_grids(base)
        print("reachable grids from grid 0 (US/EU/DE rows): %s" % sorted(gset))
        for g in sorted(cells):
            rows = base[GRID_LABELS[g]]
            ids = entered_ids(base, (gset, cells))
            print("grid %d: %d rows, %d reachable" % (g, len(rows), len(cells[g])))
        ids = entered_ids(base)
        print("glyph ids that can be entered: %s" % " ".join("$%02X" % i for i in sorted(ids)))
        for g in range(len(GRID_LABELS)):
            if g not in gset:
                print("grid %d is dead data: no reachable cell has action %d" % (g, g + 1))
        return 0
    lang = C.Lang(C.lang_dir(a.lang))
    try:
        rows = load_override(lang)
    except ValueError as ex:
        print("ERROR   " + str(ex))
        return 1
    if rows is None:
        print("%s has no grid override" % lang.code)
        return 0
    errors, warnings = check_override(lang, rows, base)
    for m in errors:
        print("ERROR   " + m)
    for m in warnings:
        print("warning " + m)
    print("name grid %s: %d rows (capacity %d), %d error(s), %d warning(s)" % (lang.code, len(rows), capacity(base), len(errors), len(warnings)))
    return 1 if errors else 0


if __name__ == "__main__":
    sys.exit(main())
