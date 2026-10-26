"""Object animation banks ($86/$87) and object maps (bank $A7): US ROM -> assets/objects/, assets/maps/.

objects: the structural parse of tools/objects/objdata.py (animation lists, frames, slot table) is written as the editable
sources; the names of the animation objects come from defs/objects/names.json.
maps:    the map blobs are cut by defs/maps/layout.json (label, address, size) and written as row grids; the `areas` field is
         derived from the object map column of defs/areas/areas.csv.
"""
import csv
import json
import sys
from pathlib import Path

from . import Step, Context
from ._rom import Rom, load_json, parse_addr, write_text

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "objects"))
sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "maps"))
import objdata  # noqa: E402
import objmap  # noqa: E402


def run_objects(ctx: Context):
    names = load_json(ctx.defs / "objects" / "names.json")
    rom = ctx.rom_bytes("US")
    root = str(ctx.assets / "objects")
    for bank in sorted(objdata.BANKS):
        asm = objdata.rom_bank_bytes(rom, bank)
        src = objdata.model_to_source(objdata.build_model(asm))
        if objdata.source_to_asmbank(src).data != asm.data:
            raise ValueError("bank $%02X: the extracted sources do not reproduce the ROM bank" % bank)
        src.objects = [(names.get("%04X" % (src.first + k)), steps) for k, (_n, steps) in enumerate(src.objects)]
        objdata.write_sources(src, root)


def area_object_maps(defs: Path):
    """{object map label: [area ids that use it]} from defs/areas/areas.csv."""
    rows = [l for l in (defs / "areas" / "areas.csv").read_text(encoding="utf-8").splitlines() if l.strip() and not l.startswith("#")]
    out = {}
    for i, a in enumerate(csv.DictReader(rows)):
        out.setdefault(a["object_map"], []).append(i)
    return out


def run_maps(ctx: Context):
    rom = Rom(ctx.rom_bytes("US"))
    layout = load_json(ctx.defs / "maps" / "layout.json")["maps"]
    users = area_object_maps(ctx.defs)
    for m in layout:
        addr = parse_addr(m["address"])
        data = rom.read(addr, m["width"] * m["height"])
        doc = objmap.to_json(m["label"], addr, data, users.get(m["label"], []))
        write_text(ctx.assets / "maps" / (m["label"] + ".json"), json.dumps(doc, indent=1) + "\n")


STEPS = [
    Step("objects", run_objects, ["US"], [], "object animation banks $86/$87 (lists, frames, slot table) with the names of defs/objects"),
    Step("maps", run_maps, ["US"], [], "object maps of bank $A7 (tile id grids), layout from defs/maps"),
]
