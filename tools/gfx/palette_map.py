#!/usr/bin/env python3
"""Which CGRAM palette does each graphics blob (BG tile sheet, sprite bank) use?  Derived from the source, not guessed.

  build   write assets/gfx/palette_map.json (machine readable table, used by pngsync to colour the PNG viewing palettes)
  check   fail unless the committed assets/gfx/palette_map.json equals what `build` derives now (CI)
  show LABEL   print the evidence for one blob
  table        print the per-blob markdown table that docs/formats/graphics-palettes.md embeds

Evidence chain (details and addresses: docs/formats/graphics-palettes.md):

  area id (strcMap.loadAreaId) --aTileMapData--> map entry: preset id, tile blobs @ VRAM dest, name tables @ VRAM dest
  preset id --Table_BGxSC / BG12NBA / BG34NBA_Presets--> VRAM address of every BG name table and character base
  area id  --aMapPalettesIndexes (6 bytes/area; 5 time-of-day slots)--> index into aPalettes --> Palette_<Area>_<Slot>
           the first $100 bytes (8 sub-palettes) of that palette fill CGRAM $00-$7F (BG rows 0-7)
  area id  --aMapPalettesId (2 bytes/area: day, from 18:00)--> Palette_Obj_Day / 0x70: CGRAM $80-$FF (OBJ rows 0-7)
  name table entry bits 10-12 = BG sub-palette row of the tile it points to (tile = bits 0-9 at charbase + 16*tile words)
  object frame component attr bits 0-2 = OBJ sub-palette row (banks $86/$87), tile id >> 8 = sprite bank - $88
"""
import argparse
import json
import re
import sys
from collections import Counter, defaultdict
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / "tools" / "gfx"))
sys.path.insert(0, str(ROOT / "tools" / "objects"))
sys.path.insert(0, str(ROOT / "tools" / "maps"))
sys.path.insert(0, str(ROOT / "tools" / "data"))
import areadata as AD  # noqa: E402
sys.path.insert(0, str(ROOT / "tools" / "gfx"))
import spritebanks as SB  # noqa: E402
import tilemap_codec as C  # noqa: E402

OUT = ROOT / "assets" / "gfx" / "palette_map.json"
CUR = ROOT                       # tree the derivation reads (the repository, or the scratch tree of tools/extract.py)


def derive_in(root):
    """build() for the tree `root` (defs/, src/ and assets/ below it) instead of the repository: used by the extractor."""
    global CUR
    old, CUR = CUR, Path(root)
    _RAW.clear()                  # decoded blobs are cached per label: never mix trees
    try:
        return build()
    finally:
        CUR = old
        _RAW.clear()
PAD = bytes(64)
NAMES = ("Spring", "Summer", "Fall", "Winter")

# slots of aMapPalettesIndexes: chosen from nCurrentTimeID (fPalette_ChangeTimePallete $8092E2): <7, <$F, <$11, <$12, else
SLOT_NAMES = ("night/early (<7)", "day (7-14)", "evening (15-16)", "dusk (17)", "night (>=18)")
DAY_SLOT = 1

# Screens that load their BG palette explicitly (fPalette_LoadFirstHalf with an aPalettes index) instead of through
# aMapPalettesIndexes.  area -> (aPalettes index, preset id, call site(s) of fPalette_LoadFirstHalf)
SCREEN_PALETTES = {
    0x5B: (0x6D, 3, ["$82D7AD?", "$82DA07", "$82DB5B", "$82DF29"]),
    0x5C: (0x6D, 3, ["$82DF29"]),
    0x5D: (0x6E, 3, ["$82D7AD"]),
    0x5E: (0x6F, 4, ["$82DFCB", "$82E22A"]),
    0x5F: (0x6F, 4, ["$82E866"]),
}
SCREEN_PALETTES[0x5B] = (0x6D, 3, ["$82DA07", "$82DB5B", "$82DF29"])
# area 0x5C (HARVEST MOON logo) loads only a name table; its tiles are those of area 0x5B, loaded just before
# (fMainMenu_ReturnToTitleFromSlotSelect: MapChangeHandler with $5B at $82DF16, then with $5C at $82DF20)
INHERIT_TILES = {0x5C: 0x5B}

# tile blobs of the US ROM that no map entry loads: label -> (area whose palette is assumed, reason)
UNREFERENCED_HINTS = {
    "Tiles_Unused_TitleLogoJapanese": (0x5C, "Japanese title logo (wooden board kanji) left in the US ROM; no map loads it. Title screen palette "
                                      "and the sub-palette that the US logo tiles of area $5C use are assumed"),
}

# the enum calls areas $57-$5F UNKNOWN*; what they load is clear from the map entries
AREA_NAME_OVERRIDE = {0x57: "RAIN_OVERLAY", 0x58: "CLOUDS_OVERLAY", 0x59: "SNOW_OVERLAY", 0x5A: "HEAVYSNOW_OVERLAY",
                      0x5B: "TITLE_INTRO_FARM", 0x5C: "TITLE_LOGO", 0x5D: "NATSUME_LOGO", 0x5E: "MENU_BACKGROUNDS",
                      0x5F: "MENU_CHARACTERS"}
AREA_NAMES = {}      # filled from src/common/enums.asm


# ----------------------------------------------------------------------------------------------------------------------
# source parsing
# ----------------------------------------------------------------------------------------------------------------------
def read_lines(rel):
    return (CUR / rel).read_text(encoding="utf-8", errors="replace").splitlines()


def us_lines(lines):
    """keep what the US build assembles: `if !REGION_x / elseif !REGION_y / else / endif` blocks (nestable) are evaluated with
    !REGION_US = 1 and !REGION_EU/DE/JP/EUDE = 0 (src/common/region.asm); any other condition is an error."""
    val = {"US": 1, "EU": 0, "DE": 0, "JP": 0, "EUDE": 0}
    out, stack = [], []                        # stack entries: [parent active, branch taken yet, this branch active]
    for l in lines:
        s = l.split(";")[0].strip()
        m = re.match(r"(if|elseif)\s+(.*)$", s)
        if m:
            c = re.fullmatch(r"!REGION_(\w+)", m.group(2).strip())
            if not c or c.group(1) not in val:
                raise ValueError(f"unsupported assembler condition: {s!r}")
            cond = bool(val[c.group(1)])
            if m.group(1) == "if":
                parent = all(e[2] for e in stack)
                stack.append([parent, cond, cond])
            else:
                e = stack[-1]
                e[2] = (not e[1]) and cond
                e[1] = e[1] or cond
            continue
        if re.match(r"else\b", s) and stack:
            e = stack[-1]
            e[2] = not e[1]
            e[1] = True
            continue
        if re.match(r"endif\b", s) and stack:
            stack.pop()
            continue
        if all(e[2] for e in stack):
            out.append(l)
    return out


def parse_enums():
    for l in read_lines("src/common/enums.asm"):
        m = re.match(r"!AREA_(\w+)\s*=\s*\$([0-9A-Fa-f]+)", l)
        if m:
            AREA_NAMES[int(m.group(2), 16)] = m.group(1)
    AREA_NAMES.update(AREA_NAME_OVERRIDE)
    return AREA_NAMES


def data_items(lines):
    """list of (size, token) for the db/dw/dl directives of a block (comments and anonymous-label prefixes removed)."""
    items = []
    for l in lines:
        l = l.split(";")[0]
        m = re.match(r"^\s*(?:[+-]\s*)?(db|dw|dl)\s+(.*)$", l, re.I)
        if not m:
            continue
        size = {"db": 1, "dw": 2, "dl": 3}[m.group(1).lower()]
        for tok in m.group(2).split(","):
            if tok.strip():
                items.append((size, tok.strip()))
    return items


def table_after(lines, label, directive):
    """all values of `directive` lines between `label:` and the next label."""
    out, on = [], False
    for l in lines:
        s = l.split(";")[0]
        if re.match(rf"^{re.escape(label)}:", s):
            on = True
            continue
        if on and re.match(r"^[A-Za-z_]\w*:", s):
            break
        if on:
            m = re.match(rf"^\s*{directive}\s+(.*)$", s, re.I)
            if m:
                out += [t.strip() for t in m.group(1).split(",") if t.strip()]
    return out


def num(tok):
    if tok.startswith("$"):
        return int(tok[1:], 16)
    return int(tok)


def parse_palette_tables():
    """assets/tables/data/palette_tables.csv (US branch) -> (aPalettes labels, aMapPalettesIndexes bytes, aMapPalettesId bytes)."""
    import tabledata
    r = tabledata.rows_of("palette_tables", "US", CUR)
    a_pal = [row["palette"] for row in r["aPalettes"]]
    idx = [num(row[c]) for row in r["aMapPalettesIndexes"] for c in ("early", "day", "evening", "dusk", "night", "extra")]
    ids = [num(row[c]) for row in r["aMapPalettesId"] for c in ("obj_a", "obj_b")]
    return a_pal, idx, ids


def parse_presets():
    """assets/gfx/presets.csv -> {register: [value per preset]}."""
    import presets
    return presets.load(CUR)


def parse_maps():
    """assets/maps/{areas.csv,area_gfx.json} -> (area id -> map label, {map label: decoded map}).  Fields follow fTileMap_MapChangeHandler."""
    area_labels, desc = AD.load_gfx(CUR)
    maps = {}
    for area, label in enumerate(area_labels):
        d = desc[label]
        m = {"label": label, "area": area}
        if area < 0x57:
            m["preset"] = d["preset"]
        m["width"], m["height"] = d["room_w"], d["room_h"]
        nt = d["tilemaps"]
        loads = [(AD.hexval(v), blob) for v, blob in d["loads"]]
        m["tiles"], m["nametables"] = loads[:nt], loads[nt:]
        maps[label] = m
    return area_labels, maps


# ----------------------------------------------------------------------------------------------------------------------
# blob data
# ----------------------------------------------------------------------------------------------------------------------
_RAW = {}


def blob_raw(label):
    """decompressed payload of a tiles / name table blob (from the committed .bin files)."""
    if label in _RAW:
        return _RAW[label]
    for d in ("tiles", "characters", "sprites"):
        p = CUR / "assets" / "gfx" / d / f"{label}.bin"
        if p.exists():
            data = p.read_bytes()
            if label.startswith(("Tiles_", "Screen_")):
                data = C.decompress(data + PAD)[0]
            _RAW[label] = data
            return data
    raise FileNotFoundError(label)


def tile_nonempty(raw, t):
    return any(raw[t * 32:(t + 1) * 32])


def words(raw):
    return [raw[i] | raw[i + 1] << 8 for i in range(0, len(raw) - 1, 2)]


# ----------------------------------------------------------------------------------------------------------------------
# preset geometry
# ----------------------------------------------------------------------------------------------------------------------
def bg_layout(pre, p):
    """PPU config of preset p -> {bg: dict(map_addr, map_words, char_base, bpp)} (words in VRAM)."""
    mode = pre["BGMODE"][p] & 7
    bpp = {0: (2, 2, 2, 2), 1: (4, 4, 2, 0), 2: (4, 4, 0, 0), 3: (8, 4, 0, 0)}[mode]
    out = {}
    for bg in (1, 2, 3, 4):
        sc = pre[f"BG{bg}SC"][p]
        nba = pre["BG12NBA" if bg < 3 else "BG34NBA"][p]
        base = (nba & 0xF if bg in (1, 3) else nba >> 4) << 12
        size = {0: 0x400, 1: 0x800, 2: 0x800, 3: 0x1000}[sc & 3]
        out[bg] = {"map_addr": (sc & 0xFC) << 8, "map_words": size, "char_base": base, "bpp": bpp[bg - 1],
                   "enabled": bool((pre["TM"][p] | pre["TS"][p]) >> (bg - 1) & 1)}
    return out, mode


# ----------------------------------------------------------------------------------------------------------------------
# BG analysis: for each map, which sub-palette does each tile of every tile blob get from the name tables?
# ----------------------------------------------------------------------------------------------------------------------
def analyse_map(m, layout):
    """-> {tile blob label: {tile index: Counter(sub palette)}}, plus notes (list)."""
    notes = []
    sheets = {}                                 # vram word dest -> (label, raw)
    for dest, lab in m["tiles"]:
        sheets[dest] = (lab, blob_raw(lab))
    use = defaultdict(lambda: defaultdict(Counter))
    bgs_of = defaultdict(set)
    tables = []
    for dest, lab in m["nametables"]:
        raw = blob_raw(lab)
        ws = words(raw)
        tables.append((dest, lab, ws))
    for dest, lab, ws in tables:
        bgs = [bg for bg, g in layout.items() if g["map_addr"] <= dest < g["map_addr"] + g["map_words"]]
        bgs = [bg for bg in bgs if layout[bg]["enabled"]] or bgs
        if not bgs:
            notes.append(f"name table {lab}@${dest:04X} matches no BG of the preset")
            continue
        # a table that starts inside a BG map area belongs to that BG (BG1/BG2 first: BG3 is the 2bpp text layer)
        bg = bgs[0]
        g = layout[bg]
        per_tile = 16 if g["bpp"] == 4 else 8
        for w in ws:
            t, pal = w & 0x3FF, w >> 10 & 7
            addr = g["char_base"] + t * per_tile
            for sd, (slab, sraw) in sheets.items():
                if sd <= addr < sd + len(sraw) // 2:
                    ti = (addr - sd) // 16
                    if g["bpp"] == 4 and tile_nonempty(sraw, ti):
                        use[slab][ti][pal] += 1
                        bgs_of[slab].add(bg)
                    elif g["bpp"] != 4:
                        use[slab][ti][("2bpp", pal)] += 1
                    break
    return use, bgs_of, notes


# ----------------------------------------------------------------------------------------------------------------------
# sprite analysis (object data)
# ----------------------------------------------------------------------------------------------------------------------
def analyse_sprites():
    """-> {sprite bank (0x88..0x91): {sprite id & 0xFF: Counter(palette row)}} from every frame component in $86/$87."""
    import objdata as O
    banks = O.load_banks(str(CUR / "assets" / "objects"))
    use = defaultdict(lambda: defaultdict(Counter))
    for b, asm in banks.items():
        d = bytes(asm.data)
        base = 0x8000
        # every frame referenced by an animation step (and the unreferenced ones, which are dead data: skipped)
        n = 0x262 if b == 0x86 else 0x1EE
        seen_frames = set()
        for i in range(n):
            lp = d[0x80 + 2 * i] | d[0x81 + 2 * i] << 8
            p = lp - base
            while True:
                fp = d[p] | d[p + 1] << 8
                if fp == 0:
                    break
                seen_frames.add(fp)
                p += 3
        for fp in sorted(seen_frames):
            o = fp - base
            cnt = d[o]
            for k in range(cnt):
                c = d[o + 1 + 5 * k:o + 6 + 5 * k]
                tid, attr = c[0] | c[1] << 8, c[4]
                use[0x88 + (tid >> 8)][tid & 0xFF][attr & 7] += 1
    return use


# ----------------------------------------------------------------------------------------------------------------------
# build
# ----------------------------------------------------------------------------------------------------------------------
def area_slots(a_pal, idx_tbl, area):
    """5 time-of-day slots of an area (aMapPalettesIndexes) -> sPalette labels (None for $FF = keep the previous one)."""
    return [None if v == 0xFF else a_pal[v] for v in idx_tbl[area * 6:area * 6 + 5]]


def day_palette(slots):
    """the day slot, else the first slot that exists."""
    if slots[DAY_SLOT]:
        return slots[DAY_SLOT], DAY_SLOT
    for i, s in enumerate(slots):
        if s:
            return s, i
    return None, None


def dominant(counter):
    """sub palette with the most entries (ties: lowest)."""
    best = max(counter.values())
    return min(k for k, v in counter.items() if v == best)


def hexstr(d, n=256):
    return "".join(str(d[i]) if i in d else "." for i in range(n))


def build():
    parse_enums()
    a_pal, idx_tbl, id_tbl = parse_palette_tables()
    pre = parse_presets()
    area_labels, maps = parse_maps()
    assert len(a_pal) == 0x75 and len(idx_tbl) == 6 * 0x60 and len(area_labels) == 0x60, \
        (len(a_pal), len(idx_tbl), len(area_labels))

    # ---- per area ------------------------------------------------------------------------------------------------
    areas = {}
    for area, label in enumerate(area_labels):
        m = maps[label]
        if area < 0x57:
            preset, slots, via = m["preset"], area_slots(a_pal, idx_tbl, area), "aMapPalettesIndexes"
        elif area in SCREEN_PALETTES:
            pi, preset, sites = SCREEN_PALETTES[area]
            slots, via = [None, a_pal[pi], None, None, None], "fPalette_LoadFirstHalf(aPalettes[$%02X]) at %s" % (pi, ", ".join(sites))
        else:
            preset, slots, via = None, [None] * 5, "none: weather overlay, uses the palette of the host map"
        ent = {"name": AREA_NAMES.get(area, ""), "map": label, "preset": preset, "bg_palettes": slots, "palette_via": via}
        if area < 0x54 and id_tbl[area * 2] != 0xFF:
            ent["obj_palettes"] = [a_pal[id_tbl[area * 2]], a_pal[id_tbl[area * 2 + 1]]]
        areas[area] = ent

    # ---- BG tile blobs ---------------------------------------------------------------------------------------------
    info = {}                                           # blob -> {"areas": {area: {"vram","bg","subs","tiles"}}}
    for area, label in enumerate(area_labels):
        m = maps[label]
        preset = areas[area]["preset"]
        layout, mode = bg_layout(pre, 0 if preset is None else preset)
        if area in INHERIT_TILES:
            m = dict(m, tiles=maps[area_labels[INHERIT_TILES[area]]]["tiles"])
        use, bgs_of, _notes = analyse_map(m, layout)
        for dest, lab in m["tiles"]:
            b = info.setdefault(lab, {"areas": {}})
            subs, tiles = Counter(), defaultdict(Counter)
            for ti, cnt in use.get(lab, {}).items():
                for pal, n in cnt.items():
                    if isinstance(pal, tuple):
                        raise ValueError(f"{lab}: 2bpp BG3 use in {label} is not handled")
                    subs[pal] += n
                    tiles[ti][pal] += n
            b["areas"][area] = {"vram": dest, "subs": subs, "tiles": tiles, "bg": sorted(bgs_of.get(lab, ()))}

    blobs = {}
    for lab in sorted(info):
        b = info[lab]
        order = sorted(b["areas"])
        # primary area: the first one (lowest id) whose name tables reference the blob; else the first loading area
        with_use = [a for a in order if b["areas"][a]["subs"]]
        pa = (with_use or order)[0]
        pal_id, slot = day_palette(areas[pa]["bg_palettes"])
        overlay = pa in (0x57, 0x58, 0x59, 0x5A)
        subs = b["areas"][pa]["subs"]
        if not overlay:                      # all areas that show the blob with the same palette decide the dominant sub-palette
            subs = Counter()
            for a in with_use:
                if day_palette(areas[a]["bg_palettes"])[0] == pal_id:
                    subs.update(b["areas"][a]["subs"])
        total = sum(subs.values())
        if overlay:
            pal_id, slot = day_palette(areas[0]["bg_palettes"])
            pa_note = ("weather overlay: drawn with sub-palette 0 of whichever outdoor map is active (FARMSPRING day shown); only "
                       "colours 12-15 are used and the weather code rewrites them by palette-animation scripts ($8097A8-$809853)")
        else:
            pa_note = None
        if not subs:
            sub, share, conf = 0, 0.0, "low"
            note = "no static BG name table references this sheet (the map table loads it, but no static name table cell shows its tiles); sub-palette 0 assumed"
        else:
            sub = dominant(subs)
            share = subs[sub] / total
            conf = "high" if total >= 16 and not overlay else "medium"
            mixed = "; per-tile sub-palettes %s (tile_subs)" % "/".join(str(k) for k in sorted(subs)) if len(subs) > 1 else ""
            note = pa_note or ("sub-palette %d covers %d of %d name-table cells%s" % (sub, subs[sub], total, mixed) if total >= 16
                               else "only %d name-table cell(s) reference this sheet; sub-palette %d" % (total, sub))
        # per-tile dominant sub-palette: the primary area first, other areas fill the gaps
        tile_sub = {}
        for a in [pa] + [x for x in order if x != pa]:
            for ti, cnt in b["areas"][a]["tiles"].items():
                if ti not in tile_sub:
                    tile_sub[ti] = dominant(cnt)
        # alternatives: other palette / sub-palette combinations (day slot) of the other areas that use the blob
        alts, seen = [], {(pal_id, sub)}
        for a in order:
            if a == pa or a not in with_use:
                continue
            ap, aslot = day_palette(areas[a]["bg_palettes"])
            asub = dominant(b["areas"][a]["subs"])
            if ap and (ap, asub) not in seen:
                seen.add((ap, asub))
                alts.append({"id": ap, "sub": asub, "area": a, "area_name": areas[a]["name"]})
        used_by = []
        for a in order:
            e = b["areas"][a]
            used_by.append({"area": a, "name": areas[a]["name"], "preset": areas[a]["preset"], "vram": "$%04X" % e["vram"],
                            "bg": e["bg"],
                            "sub_cells": {str(k): v for k, v in sorted(e["subs"].items())},
                            "bg_palettes": areas[a]["bg_palettes"]})
        slot_name = "fixed (explicit load)" if pa >= 0x57 else SLOT_NAMES[slot]
        blobs[lab] = {"kind": "tiles", "palette": {"id": pal_id, "sub": sub, "area": pa, "slot": slot_name},
                      "confidence": conf, "note": note, "subs_used": sorted(subs), "tile_subs": hexstr(tile_sub),
                      "alternatives": alts,
                      "used_by": used_by}

    # ---- tile blobs that no map loads ----------------------------------------------------------------------------
    for p in sorted((CUR / "assets/gfx/tiles").glob("Tiles_*.bin")):
        lab = p.stem
        if lab in blobs:
            continue
        hint = UNREFERENCED_HINTS.get(lab)
        if hint:
            area, why = hint
            pal_id, _ = day_palette(areas[area]["bg_palettes"])
            cells = Counter()
            for other in blobs.values():
                for u in other.get("used_by", []):
                    if u["area"] == area:
                        cells.update({int(k): v for k, v in u["sub_cells"].items()})
            sub = dominant(cells)
            blobs[lab] = {"kind": "tiles", "palette": {"id": pal_id, "sub": sub, "area": area, "slot": "fixed (explicit load)"},
                          "confidence": "low", "note": why, "alternatives": []}
        else:
            blobs[lab] = {"kind": "tiles", "palette": {"id": None, "sub": None}, "confidence": "none",
                          "note": "no map loads this blob and no hint is known", "alternatives": []}

    # ---- sprite banks ----------------------------------------------------------------------------------------------
    use = analyse_sprites()
    obj_day, obj_night = areas[0]["obj_palettes"]
    extras = [a_pal[i] for i in (0x71, 0x72, 0x73)]
    for bank in range(0x88, 0x92):
        lab = SB.label(bank)
        rows, cell, multi = Counter(), {}, {}
        for sid, cnt in sorted(use.get(bank, {}).items()):
            rows.update(cnt)
            cell[sid] = dominant(cnt)
            if len(cnt) > 1:
                multi[sid] = dict(sorted(cnt.items()))
        sub = dominant(rows)
        total = sum(rows.values())
        conf = "high" if total >= 16 else "medium"
        alts = [{"id": obj_night, "sub": sub, "note": "same row, night palette (from 18:00)"}]
        alts += [{"id": x, "sub": sub, "note": "event palette (daily3 flags $0080/$0100/$0200)"} for x in extras]
        blobs[lab] = {"kind": "sprites",
                      "palette": {"id": obj_day, "sub": sub, "area": None, "slot": "OBJ day (aMapPalettesId)"},
                      "confidence": conf,
                      "note": "OAM palette row of %d of %d object components is %d; the rest use rows %s" % (
                          rows[sub], total, sub, ", ".join(str(k) for k in sorted(rows) if k != sub) or "none"),
                      "subs_used": sorted(rows),
                      "components_per_row": {str(k): v for k, v in sorted(rows.items())},
                      "sprite_rows": hexstr(cell), "multi_row_sprites": {"%02X" % k: {str(a): b for a, b in v.items()} for k, v in multi.items()},
                      "alternatives": alts}

    out = {
        "format": 1,
        "generated_by": "tools/gfx/palette_map.py build (do not edit by hand)",
        "doc": "docs/formats/graphics-palettes.md",
        "slots": list(SLOT_NAMES),
        "aPalettes": a_pal,
        "areas": {"%d" % a: v for a, v in areas.items()},
        "blobs": blobs,
    }
    return out


DOC = ROOT / "docs" / "formats" / "graphics-palettes.md"
TABLE_BEGIN, TABLE_END = "<!-- palette-table:begin (generated by tools/gfx/palette_map.py table) -->", "<!-- palette-table:end -->"


def markdown_table(d):
    """one row per blob for docs/formats/graphics-palettes.md."""
    rows = ["| Blob | Palette | Sub | Confidence | Subs used | Used by |", "|---|---|---|---|---|---|"]
    for lab, b in d["blobs"].items():
        pal = b["palette"]
        used = b.get("used_by")
        if used:
            names = [u["name"].lower() for u in used]
            by = ", ".join(names[:3]) + (f" (+{len(names) - 3})" if len(names) > 3 else "")
        elif b["kind"] == "sprites":
            by = "object frames (banks $86/$87)"
        else:
            by = "(none)"
        subs = "/".join(str(x) for x in b.get("subs_used", [])) or "-"
        rows.append(f"| `{lab}` | {('`' + pal['id'] + '`') if pal.get('id') else '-'} | "
                    f"{pal['sub'] if pal.get('id') else '-'} | {b['confidence']} | {subs} | {by} |")
    return "\n".join(rows)


def doc_table_ok(d):
    if not DOC.exists():
        return False
    t = DOC.read_text(encoding="utf-8")
    if TABLE_BEGIN not in t or TABLE_END not in t:
        return False
    return t.split(TABLE_BEGIN)[1].split(TABLE_END)[0].strip() == markdown_table(d).strip()


def sprite_palettes(object_index=None, root=None):
    """The 8 OBJ sub-palettes (lists of 16 RGB tuples) objects are drawn with by day: row r of `obj_palettes[0]` of area 0
    (aMapPalettesId $6B = Palette_Obj_Day).  Same signature as the `--palette-module` hook of tools/objects/spriteexport.py;
    the seasonal patches of OBJ row 7 / row 3 (docs/formats/graphics-palettes.md section 4) are not applied."""
    root = Path(root) if root else ROOT
    pid = load(root)["areas"]["0"]["obj_palettes"][0]
    cols = json.loads((root / "assets" / "gfx" / "palettes" / f"{pid}.json").read_text(encoding="utf-8"))["colors"]
    rgb = [tuple(int(c[i:i + 2], 16) for i in (1, 3, 5)) for c in cols[:128]]
    return [rgb[r * 16:(r + 1) * 16] for r in range(8)]


def dumps(d):
    return json.dumps(d, indent=1, ensure_ascii=False) + "\n"


def load(root=None):
    return json.loads(((Path(root) / "assets" / "gfx" / "palette_map.json") if root else OUT).read_text(encoding="utf-8"))


def main(argv=None):
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("cmd", choices=("build", "check", "show", "table"))
    ap.add_argument("label", nargs="?")
    a = ap.parse_args(argv)
    cur = build()
    if a.cmd == "build":
        OUT.write_text(dumps(cur), encoding="utf-8", newline="\n")
        n = Counter(b["confidence"] for b in cur["blobs"].values())
        print(f"wrote {OUT.relative_to(ROOT)}: {len(cur['blobs'])} blobs, confidence {dict(n)}")
        return 0
    if a.cmd == "check":
        if not OUT.exists() or OUT.read_text(encoding="utf-8") != dumps(cur):
            print("FAIL: assets/gfx/palette_map.json is not what tools/gfx/palette_map.py derives from the sources; run `build`")
            return 1
        if not doc_table_ok(cur):
            print("FAIL: the table in docs/formats/graphics-palettes.md is out of date; paste the output of `palette_map.py table`")
            return 1
        print(f"palette_map check: {len(cur['blobs'])} blobs, committed table and documentation match the derivation")
        return 0
    if a.cmd == "table":
        print(markdown_table(cur))
        return 0
    print(json.dumps(cur["blobs"][a.label], indent=1))
    return 0


if __name__ == "__main__":
    sys.exit(main())
