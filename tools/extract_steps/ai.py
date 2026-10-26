"""AI data: US ROM -> assets/ai/npc_sprite_tables.txt (the NPC sprite / direction tables of bank $B3).

defs/ai/sprite_tables.json lists the tables (label, number of 3-byte records) and where the run starts; the records
(sprite table index word : flip byte) are read from the ROM.  The script ids, labels and slot tables
(defs/ai/scripts.json) are structure; the script bodies are the DSL in src/ai.
"""
from . import Step, Context
from ._rom import Rom, load_json, parse_addr, write_text


def run(ctx: Context):
    rom = Rom(ctx.rom_bytes("US"))
    lay = load_json(ctx.defs / "ai" / "sprite_tables.json")
    pos = parse_addr(lay["rom"])
    lines = list(lay["header"]) + [""]
    for label, n in lay["tables"]:
        lines.append(label + ":")
        recs = []
        for _ in range(n):
            recs.append("%04X:%X" % (rom.u16(pos), rom.u8(pos + 2)))
            pos += 3
        for i in range(0, n, 4):
            lines.append("  " + " ".join(recs[i:i + 4]))
    write_text(ctx.assets / "ai" / "npc_sprite_tables.txt", "\n".join(lines) + "\n")


STEPS = [Step("ai", run, ["US"], [], "NPC sprite / direction tables of bank $B3 (the AI script ids and slots are structure in defs/ai)")]
