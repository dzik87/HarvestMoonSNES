"""Menu data: ROMs -> assets/menu/name_input.txt (the name entry cursor grids of bank $82).

defs/menu/name_input.json holds the structure (tables, release groups, row counts, ROM address per release, the format
comment); the 8-byte cell rows are read from the ROMs.  Releases of one group must contain identical bytes (checked).
"""
from . import Step, Context
from ._rom import REGIONS, Rom, load_json, parse_addr, write_text

ROW = 8


def run(ctx: Context):
    spec = load_json(ctx.defs / "menu" / "name_input.json")
    roms = {r: Rom(ctx.rom_bytes(r)) for r in REGIONS}
    out = list(spec["header"]) + [""]
    first = True
    for tb in spec["tables"]:
        for g in tb["groups"]:
            if not first:
                out.append("")
            first = False
            line = "table " + tb["label"] + "".join(" " + r for r in g["regions"])
            out.append(line + "   # " + tb["comment"] if tb["comment"] else line)
            data = None
            for region, addr in g["rom"].items():
                d = roms[region].read(parse_addr(addr), g["rows"] * ROW)
                if data is None:
                    data = d
                elif d != data:
                    raise ValueError("%s: release %s differs inside its group %s" % (tb["label"], region, g["regions"] or "(all)"))
            for i in range(g["rows"]):
                out.append("%02X: %s" % (i, " ".join("%02X" % b for b in data[i * ROW:(i + 1) * ROW])))
    write_text(ctx.assets / "menu" / "name_input.txt", "\n".join(out) + "\n")


STEPS = [Step("menu", run, ["US", "EU", "DE", "JP"], [], "name entry cursor grids (release groups from defs/menu)")]
