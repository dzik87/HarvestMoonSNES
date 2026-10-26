"""ROM -> graphics sources (step `graphics`): composed PNG images, remainder sheets, name tables, sidecars, palette map, load register.

The exporters of tools/gfx/ (pngsync.py, composed.py, palette_map.py, graphics_loads.py) work on a repository-shaped tree: `defs/`, `src/`
and `assets/` below a root.  The extraction builds such a scratch tree, cuts the blobs out of the ROMs into it (the layout and the blob
sizes come from defs/gfx/banks.json), runs the exporters there and copies the sources (never the generated .bin files) to the output tree.
Needs the output of the steps `palettes`, `areas`, `objects` and `tables` in ctx.assets: the name tables are rendered with the tile sets,
character bases and palettes that the area descriptors, the object data and the palette tables name.
"""
import json
import shutil
import sys
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
for sub in ("gfx", "data", "objects", "maps"):
    sys.path.insert(0, str(ROOT / "tools" / sub))

BANK = 0x8000
GROUP_DIR = {"sprites": "sprites", "tiles": "tiles", "characters": "characters"}
NEEDED = ("areas", "objects", "tables", "gfx/palettes", "gfx/presets.csv")      # outputs of other steps that the derivation reads


def build_scratch_tree(ctx, work: Path):
    """defs/, src/ (read only) and the inputs of the derivation in a scratch root laid out like the repository."""
    for name in NEEDED:
        if not (ctx.assets / name).exists():
            raise SystemExit("graphics: %s is missing in the output tree; run the steps palettes, areas, objects and tables first "
                             "(extract.py runs them in this order)" % name)
    shutil.copytree(ctx.defs, work / "defs")
    shutil.copytree(ctx.root / "src", work / "src")
    for name in NEEDED:
        dst = work / "assets" / name
        dst.parent.mkdir(parents=True, exist_ok=True)
        if (ctx.assets / name).is_dir():
            shutil.copytree(ctx.assets / name, dst)
        else:
            shutil.copy(ctx.assets / name, dst)


def cut_us_blobs(rom: bytes, layout, work: Path):
    """US ROM -> assets/gfx/{tiles,sprites,characters}/<label>.bin in the scratch tree; returns {label: (kind group, bank)}."""
    import gfxbanks
    found = {}
    for group, banks in layout.items():
        if group == "palettes":
            continue
        for bank, b in banks.items():
            pos = (int(bank, 16) - 0x80) * BANK
            for name, size in zip(b["blobs"], gfxbanks.blob_sizes(group, b)):
                label = name.lstrip("*")
                if not label.startswith("sFontGlyphs_"):         # the fonts are the step `fonts`
                    d = work / "assets" / "gfx" / GROUP_DIR[group]
                    d.mkdir(parents=True, exist_ok=True)
                    (d / f"{label}.bin").write_bytes(rom[pos:pos + size])
                    found[label] = (group, bank)
                pos += size
    return found


def extract_graphics(ctx, roms):
    """roms = {"US": bytes, ...}; writes assets/gfx/{png,tilemaps,palette_map.json,graphics_loads.json} into ctx.assets."""
    import gfxbanks
    import graphics_loads as GL
    import palette_map as PM
    import pngsync as P
    layout = json.loads((ctx.defs / "gfx" / "banks.json").read_text(encoding="utf-8"))
    work = Path(tempfile.mkdtemp(prefix="hm_gfx_"))
    try:
        build_scratch_tree(ctx, work)
        found = cut_us_blobs(roms["US"], layout, work)
        # which palette shows which blob: derived from the area descriptors, the palette tables and the object data
        pm = PM.derive_in(work)
        (work / "assets/gfx/palette_map.json").write_text(PM.dumps(pm), encoding="utf-8", newline="\n")
        # US: name tables, then sidecars + composed images + remainder sheets of every tile / sprite blob
        for label, (group, _bank) in sorted(found.items()):
            if group == "characters":
                P.export_blob(P.Blob("tilemaps", label, work, "us"))
        P.export_composed(work, "us", sorted(l for l, (g, _b) in found.items() if g != "characters"))
        # EU / DE / JP: the blobs that differ from the US ROM
        for region in ("EU", "DE", "JP"):
            if region in roms:
                P.export_region_from_roms(work, region.lower(), roms)
        (work / "assets/gfx/graphics_loads.json").write_text(GL.dumps(GL.derive(work)), encoding="utf-8", newline="\n")
        # copy the sources (not the .bin files that the build generates)
        g = work / "assets" / "gfx"
        out = ctx.assets / "gfx"
        for sub in ("png", "tilemaps"):
            if (out / sub).exists():
                shutil.rmtree(out / sub)
            shutil.copytree(g / sub, out / sub)
        for f in ("palette_map.json", "graphics_loads.json"):
            shutil.copy(g / f, out / f)
        return len(found)
    finally:
        shutil.rmtree(work, ignore_errors=True)
