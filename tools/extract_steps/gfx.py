"""Extraction steps for palettes, fonts and graphics (see docs/extraction.md).

  palettes   assets/gfx/palettes/**          colours of the 117 palettes (+ the releases' own versions)
  fonts      assets/fonts/<region>/**        one PNG per glyph + glyphs.json
  graphics   assets/gfx/{png,tilemaps}/**    composed images, remainder sheets, name tables, sidecars (tools/extract_steps/gfx_export.py)

Layouts (bank order, blob names and sizes) come from defs/gfx/banks.json; the ROM supplies only the pixels, colours and tile maps.
"""
import json
import sys
from pathlib import Path

from . import Context, Step


ROOT = Path(__file__).resolve().parents[2]
for sub in ("gfx", "fonts", "data", "dialogs"):
    sys.path.insert(0, str(ROOT / "tools" / sub))


def roms_bytes(ctx: Context, regions=("US", "EU", "DE", "JP")):
    return {r: ctx.rom_bytes(r) for r in regions if r in ctx.roms}


def layout(ctx: Context):
    return json.loads((ctx.defs / "gfx" / "banks.json").read_text(encoding="utf-8"))


def run_palettes(ctx: Context):
    import palette
    n = palette.extract_roms(roms_bytes(ctx), layout(ctx), ctx.assets / "gfx" / "palettes")
    if ctx.verbose:
        print("  %d palettes" % n)


def run_fonts(ctx: Context):
    import font
    for region in ("US", "EU", "DE", "JP"):
        if region in ctx.roms:
            n = font.extract_rom_bytes(region.lower(), ctx.rom_bytes(region), ctx.assets / "fonts" / region.lower())
            if ctx.verbose:
                print("  %s: %d glyphs" % (region, n))


def run_dialogs(ctx: Context):
    import dialog
    n = dialog.extract_rom(roms_bytes(ctx), ctx.defs, ctx.assets / "dialogs")
    if ctx.verbose:
        print("  %d dialogs" % n)


def run_presets(ctx: Context):
    import presets
    out = ctx.assets / "gfx" / "presets.csv"
    out.parent.mkdir(parents=True, exist_ok=True)
    out.write_bytes(presets.extract_rom(ctx.rom_bytes("US"), ctx.defs).encode("utf-8"))


def run_graphics(ctx: Context):
    from . import gfx_export
    n = gfx_export.extract_graphics(ctx, roms_bytes(ctx))
    if ctx.verbose:
        print("  %d graphics blobs" % n)


STEPS = [
    Step("palettes", run_palettes, ["US"], [], "117 palettes of banks $A8/$A9 as JSON + PNG (colours), regional versions"),
    Step("presets", run_presets, ["US"], [], "PPU graphics presets (BG modes, name table / character bases, layers) of the map engine, assets/gfx/presets.csv"),
    Step("fonts", run_fonts, ["US", "EU", "DE", "JP"], [], "dialog font glyphs (16x16 2bpp) of every release as PNG + glyphs.json"),
    Step("dialogs", run_dialogs, ["US", "EU", "DE", "JP"], [], "dialog texts of the four releases (banks $B6-$BB / $AA-$AC) and the dialog engine tables"),
    Step("graphics", run_graphics, ["US", "EU", "DE", "JP"], ["palettes", "presets", "areas", "objects", "tables"],
         "composed screen / frame PNGs, remainder sheets, name tables and sidecars of all 151 graphics blobs (US and the regional versions), palette map"),
]
