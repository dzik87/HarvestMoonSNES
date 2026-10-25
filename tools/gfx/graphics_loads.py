#!/usr/bin/env python3
"""Register of every graphics blob and who loads it: assets/gfx/graphics_loads.json (derived from the source, never edited by hand).

  build   write the register
  check   fail unless the committed register equals the derivation, every blob of assets/gfx/banks.json is covered, and every
          blob that nothing loads is listed in UNUSED below (with the reason)
  show LABEL   print the entry of one blob

Sources: the area graphics descriptors assets/areas/area_gfx.json (fTileMap_MapChangeHandler: per area a graphic preset, tile blobs @ VRAM word
address, name tables @ VRAM word address), the graphic presets of src/code/bank_80/core.asm (BG name table / character bases),
assets/gfx/palette_map.json (area -> palette) and the code loaders that use literal addresses (LITERAL_LOADERS, checked against the
source text).  See docs/formats/graphics-loading.md.
"""
import json
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / "tools" / "gfx"))
sys.path.insert(0, str(ROOT / "tools" / "data"))
import pngsync as P  # noqa: E402

OUT = ROOT / "assets" / "gfx" / "graphics_loads.json"

# loaders that name a blob by a literal / label instead of the map table: label -> (function, source file, text that must occur there, VRAM, note)
LITERAL_LOADERS = {
    "Screen_DialogBox": ("fDialog_LoadDialogBoxGraphics", "src/code/bank_83/dialog.asm", "LDA.W #Screen_DialogBox",
                         "$7800 (BG3 name table words, $400 words)", "decompressed to $7E2000, region specific blob"),
    "sFontGlyphs_Dialog": ("fDialog_LoadDialogBoxGraphics / fDialog_ReloadFontTiles", "src/code/bank_83/dialog.asm",
                           "LDA.W #sFontGlyphs_Dialog", "$5000 ($800 / $600 words)", "raw 4bpp font tiles of the dialog window (BG3 char base)"),
}
# blobs reached through an index: label prefix -> (how, where)
INDEXED = {
    "sFontGlyphs_0x": ("aLetterGlyphsPointers (src/code/bank_83/dialog.asm): glyph table n of the font, index = font page", "glyph data read by the text renderer"),
    "Sprites_": ("object frame components: sprite id >> 8 = bank - $88, uploaded by the OAM / object code", "OBJ character data"),
    "Palette_": ("aPalettes (assets/tables/blocks/palette_tables.tbl): index from aMapPalettesIndexes / explicit fPalette_LoadFirstHalf calls", "CGRAM"),
}
# blobs no found loader uses: label -> reason
UNUSED = {
    "Tiles_Unused_TitleLogoJapanese": "no map entry and no code references it (Japanese title logo graphics left in the US ROM)",
    "ScreenRaw_Unk_A6A096": "raw 64x32 name table; no label or literal address in the code; found hidden under bank padding",
}


# VRAM overlaps inside one map that are known and harmless: (map, blob, blob)
OVERLAP_OK = set()


def blob_labels(root=ROOT):
    sys.path.insert(0, str(Path(root) / "tools" / "data"))
    import gfxbanks
    out = []
    for kind, banks in gfxbanks.load_layout(root).items():
        if isinstance(banks, dict):
            for ent in banks.values():
                if isinstance(ent, dict):
                    out += [(kind, x.lstrip("*")) for x in ent["blobs"]]
    return out


def derive(root=ROOT):
    info = P.map_table(root)                                   # blob label -> [(vram dest, map label, [(dest, label)...])]
    pm = P.palette_map(root)
    area_of = {}
    for a, ent in pm.get("areas", {}).items():
        area_of.setdefault(ent["map"], []).append(int(a))
    maps = {}
    for lab, uses in info.items():
        for dest, mlabel, pairs in uses:
            m = maps.setdefault(mlabel, {"areas": sorted(area_of.get(mlabel, [])), "tiles": [], "name_tables": []})
            row = {"blob": lab, "vram_word": f"${dest:04X}"}
            (m["tiles"] if lab.startswith(("Tiles_", "Sprites_")) else m["name_tables"]).append(row)
    for mlabel, m in maps.items():
        for nt in m["name_tables"]:
            base = P.bg_chr_base(root, mlabel, int(nt["vram_word"][1:], 16))
            nt["chr_base"] = None if base is None else f"${base:04X}"
        ids = {pm["areas"][str(a)].get("bg_palettes", [None, None])[1] for a in m["areas"] if str(a) in pm.get("areas", {})}
        m["palette"] = sorted(x for x in ids if x)
    blobs = {}
    for kind, lab in blob_labels(root):
        ent = {"kind": kind, "loaders": []}
        for mlabel, m in sorted(maps.items()):
            for k, rows in (("tiles", m["tiles"]), ("name_table", m["name_tables"])):
                for r in rows:
                    if r["blob"] == lab:
                        ent["loaders"].append({"via": "map table", "map": mlabel, "areas": m["areas"], "vram_word": r["vram_word"],
                                               "as": k, "palette": m["palette"]})
        if lab in LITERAL_LOADERS:
            fn, src, text, vram, note = LITERAL_LOADERS[lab]
            if text not in (Path(root) / src).read_text(encoding="utf-8", errors="replace"):
                raise ValueError(f"{lab}: loader text {text!r} not found in {src}")
            ent["loaders"].append({"via": "code", "function": fn, "file": src, "vram": vram, "note": note})
        for pre, (how, note) in INDEXED.items():
            if lab.startswith(pre):
                ent["loaders"].append({"via": "index", "how": how, "note": note})
        if lab in UNUSED:
            ent["unused"] = UNUSED[lab]
        ent["status"] = ("unused" if not ent["loaders"] else "map table" if any(x["via"] == "map table" for x in ent["loaders"])
                         else "code" if any(x["via"] == "code" for x in ent["loaders"]) else "indexed")
        blobs[lab] = ent
    return {"format": 1, "generated_by": "tools/gfx/graphics_loads.py build", "blobs": blobs, "maps": dict(sorted(maps.items()))}


def vram_overlaps(d, root=ROOT):
    """[(map, blob a, range a, blob b, range b)] of loads of one map whose VRAM word ranges overlap (tile sets: raw size / 2 words,
    name tables: the $2000 bytes the loader DMAs = $1000 words, less for smaller tables)."""
    out = []
    for mlabel, m in d["maps"].items():
        rows = []
        for r in m["tiles"] + m["name_tables"]:
            lab = r["blob"]
            kind = "tiles" if lab.startswith("Tiles_") else "tilemaps" if lab.startswith("Screen") else "sprites"
            meta = P.read_meta(P.Blob(kind, lab, root))
            n = meta["raw_size"] // 2
            if lab.startswith("Screen"):
                n = min(n, 0x1000)
            a = int(r["vram_word"][1:], 16)
            rows.append((lab, a, a + n))
        for i, (la, a0, a1) in enumerate(rows):
            for lb, b0, b1 in rows[i + 1:]:
                if a0 < b1 and b0 < a1:
                    out.append((mlabel, la, f"${a0:04X}-${a1 - 1:04X}", lb, f"${b0:04X}-${b1 - 1:04X}"))
    return out


def dumps(d):
    return json.dumps(d, indent=1, ensure_ascii=False) + "\n"


def problems(d):
    out = []
    for lab, e in d["blobs"].items():
        if e["status"] == "unused" and lab not in UNUSED:
            out.append(f"{lab}: no loader found and not listed in UNUSED (a loader was missed, or document why it is dead)")
        if lab in UNUSED and e["status"] != "unused":
            out.append(f"{lab}: listed in UNUSED but a loader exists ({e['status']})")
    for mlabel, la, ra, lb, rb in vram_overlaps(d):
        if (mlabel, la, lb) not in OVERLAP_OK:
            out.append(f"{mlabel}: {la} {ra} overlaps {lb} {rb} in VRAM")
    return out


def main(argv=None):
    a = (argv or sys.argv)[1:]
    if not a or a[0] not in ("build", "check", "show"):
        sys.exit(__doc__)
    d = derive()
    if a[0] == "build":
        OUT.write_text(dumps(d), encoding="utf-8", newline="\n")
        st = {}
        for e in d["blobs"].values():
            st[e["status"]] = st.get(e["status"], 0) + 1
        print(f"wrote {OUT.relative_to(ROOT)}: {len(d['blobs'])} blobs {st}, {len(d['maps'])} maps")
        return 0
    if a[0] == "show":
        print(json.dumps(d["blobs"][a[1]], indent=1))
        return 0
    bad = problems(d)
    if not OUT.exists() or OUT.read_text(encoding="utf-8") != dumps(d):
        bad.append("assets/gfx/graphics_loads.json is not what tools/gfx/graphics_loads.py derives; run `build`")
    for m in bad:
        print("FAIL " + m)
    print("graphics_loads check: " + (f"{len(bad)} FAILED" if bad else f"{len(d['blobs'])} blobs, every blob has a loader or a documented reason"))
    return 1 if bad else 0


if __name__ == "__main__":
    sys.exit(main())
