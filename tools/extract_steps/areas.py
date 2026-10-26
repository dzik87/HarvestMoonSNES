"""Per-area tables of the code banks: US ROM -> assets/areas/ (docs/formats/area-data.md).

Layout (where the tables are, the names of descriptors / property tables / music sets / graphics blobs) comes from defs/areas/:
areas.csv (one row per area id with the labels the four area tables point to), layout.json, blob_addresses.json.
The numbers are read from the ROM: graphics descriptors (preset, flags, room size, camera values, VRAM loads), screen
transition table, object property tables and the music track ids per season.
"""
import csv
import json

from . import Step, Context
from ._rom import Rom, enum_names, load_json, parse_addr, write_text

GFX_DOC = ("Graphics descriptors of the areas (aTileMapData targets), in ROM order.  Full format (area ids $00-$56): preset, flags, cam, "
           "room size, loads; short format (ids $57-$5F: overlays and screens): no preset/flags/cam.  loads = [VRAM destination word, "
           "compressed blob label]: first `tilemaps` entries are tile blobs, the next `charmaps` entries name tables.  "
           "See docs/formats/area-data.md.")
MUSIC_DOC = ("Map music sets (aAudioEngine_MapMusicId_*): the music track id per season (spring, summer, fall, winter) for an area; "
             "referenced from areas.csv.")
TRANS_HEADER = """# Screen transition table (aScreenTransitionTable, 80:B6F5): 8-byte rows, indexed by byte 0 of an object property row (object_props/*.txt).
# dest_area: target area id (+ current season when flags bit 0 is set); b1/b2: not decoded (b2 is a start index for the transition script $CF); flags: bit0 add season, bit6 ($40) day dependent, others unknown;
# x,y: player start position in the target area.
idx,dest_area,b1,b2,flags,x,y
"""
PROPS_HEADER = """# {label}: object property table, 256 rows of 4 bytes (row = object id of the object map, strcMap.pSelected).
# Row bytes b0 b1 b2 b3; meaning only partly known, see docs/formats/area-data.md.  Format: `ID: b0 b1 b2 b3`.
"""
N_AREAS = 0x60
FIRST_SHORT = 0x57          # area ids >= $57 use the short descriptor format


def read_areas(defs):
    rows = [l for l in (defs / "areas" / "areas.csv").read_text(encoding="utf-8").splitlines() if l.strip() and not l.startswith("#")]
    return list(csv.DictReader(rows))


def flags_expr(value, names):
    """Area flag word -> `!AFLAGS_A|!AFLAGS_B` (set bits, highest first); `!AFLAGS_NONE` for 0."""
    if value == 0:
        return "!" + names[0]
    parts = []
    for bit in range(15, -1, -1):
        if value >> bit & 1:
            if (1 << bit) not in names:
                raise ValueError("area flag bit $%04X has no !AFLAGS_ name" % (1 << bit))
            parts.append("!" + names[1 << bit])
    return "|".join(parts)


def run(ctx: Context):
    rom = Rom(ctx.rom_bytes("US"))
    out = ctx.assets / "areas"
    defs = ctx.defs
    lay = load_json(defs / "areas" / "layout.json")
    blob_at = {parse_addr(a): n for n, a in load_json(defs / "areas" / "blob_addresses.json").items()}
    areas = read_areas(defs)
    if len(areas) != N_AREAS:
        raise ValueError("defs/areas/areas.csv has %d rows, expected %d" % (len(areas), N_AREAS))
    aflags = enum_names(ctx.root, "AFLAGS")

    # --- graphics descriptors (in area id order, directly behind the 96 pointers of aTileMapData)
    pos = parse_addr(lay["tile_map_data"]) + 2 * N_AREAS
    descs = []
    for i, a in enumerate(areas):
        if rom.u16(parse_addr(lay["tile_map_data"]) + 2 * i) != (pos & 0xFFFF):
            raise ValueError("area $%02X: descriptor pointer does not match the sequential layout" % i)
        d = {"label": a["gfx"]}
        if i < FIRST_SHORT:
            d["preset"] = rom.u8(pos)
            d["flags"] = flags_expr(rom.u16(pos + 1), aflags)
            pos += 3
        d["room_w"], d["room_h"] = rom.u8(pos), rom.u8(pos + 1)
        d["tilemaps"], d["charmaps"] = rom.u8(pos + 2), rom.u8(pos + 3)
        pos += 4
        if i < FIRST_SHORT:
            d["cam"] = ["$%04X" % rom.u16(pos + 2 * k) for k in range(4)]
            pos += 8
        loads = []
        for _ in range(d["tilemaps"] + d["charmaps"]):
            vram, blob = rom.u16(pos), rom.u24(pos + 2)
            if blob not in blob_at:
                raise ValueError("area $%02X: graphics blob at $%06X is not listed in defs/areas/blob_addresses.json" % (i, blob))
            loads.append(["$%04X" % vram, blob_at[blob]])
            pos += 5
        d["loads"] = loads
        descs.append(d)
    lines = [json.dumps(d) for d in descs]
    write_text(out / "area_gfx.json", '{"_doc": %s,\n "descriptors": [\n  %s\n ]\n}\n' % (json.dumps(GFX_DOC), ",\n  ".join(lines)))

    # --- screen transitions
    t0 = parse_addr(lay["screen_transitions"])
    rows = []
    for k in range(lay["screen_transition_count"]):
        r = rom.read(t0 + 8 * k, 8)
        rows.append("$%02X,$%02X,$%02X,$%02X,$%02X,$%04X,$%04X" % (k, r[0], r[1], r[2], r[3], r[4] | r[5] << 8, r[6] | r[7] << 8))
    write_text(out / "screen_transitions.csv", TRANS_HEADER + "\n".join(rows) + "\n")

    # --- object property tables (7 x 256 rows of 4 bytes, behind the 96 pointers of pObjectMap2)
    p0 = parse_addr(lay["object_props"]) + 3 * N_AREAS
    for n, label in enumerate(lay["property_tables"]):
        if rom.u24(parse_addr(lay["object_props"]) + 3 * next(i for i, a in enumerate(areas) if a["object_props"] == label)) != p0 + 0x400 * n:
            raise ValueError("%s: pObjectMap2 pointer does not match the sequential layout" % label)
        rows = ["%02X: %s" % (k, " ".join("%02X" % b for b in rom.read(p0 + 0x400 * n + 4 * k, 4))) for k in range(256)]
        write_text(out / "object_props" / (label + ".txt"), PROPS_HEADER.format(label=label) + "\n".join(rows) + "\n")

    # --- map music sets (4 track ids per set, directly behind the 96 pointers of pAudioEngine_MapMusic)
    m0 = parse_addr(lay["map_music"]) + 2 * N_AREAS
    sets = ['  {"label": "%s", "seasons": %s}' % (label, json.dumps(list(rom.read(m0 + 4 * n, 4)))) for n, label in enumerate(lay["music_sets"])]
    write_text(out / "area_music.json", '{"_doc": %s,\n "sets": [\n%s\n ]\n}\n' % (json.dumps(MUSIC_DOC), ",\n".join(sets)))


STEPS = [Step("areas", run, ["US"], [], "area graphics descriptors, screen transitions, object property tables, map music sets")]
