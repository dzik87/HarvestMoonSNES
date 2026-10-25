#!/usr/bin/env python3
"""Layout of the regional data banks: which blob of an EU/DE/JP bank equals a US blob and which one is region specific.

The graphics banks ($94-$A6) are a sequence of blobs without gaps: LZSS streams (sCompressedTiles_*, sCompressedTilemap_*,
decoded with tools/gfx/tilemap_codec.py), raw tables (font glyph tables, sCharactermap_*) and the zero padding up to
the end of the 32 KB bank.  Every release has the same blobs in the same order as the US ROM, only their contents and
therefore their sizes (and addresses) differ.  Each blob keeps the **US label** in all releases.

Library (used by pngsync.py, the import tool and the documentation generator):
    us_layout(bank)                 -> [Entry]   ordered blobs of a US bank (label, kind, size) from src/data + assets
    walk(rom, bank, entries)        -> [Placed]  the same blobs located in a regional ROM image
    classify(us_rom, rom, bank)     -> per blob: 'same' (identical stream) / 'moved' (identical, other address) / 'specific'

CLI (ROM images are tool inputs only and are never stored in the repository; HM_ROM_DIR = <dir>/{US,EU,DE,JP}/*.sfc):
    python tools/data/regionbanks.py report [--rom-dir DIR] [--md FILE]
"""
import argparse
import glob
import os
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / "tools" / "gfx"))
import tilemap_codec as C  # noqa: E402

BANK = 0x8000
PAD = bytes(64)
REGIONS = ("EU", "DE", "JP")
GROUPS = {"tiles": "src/data/gfx/tiles", "characters": "src/data/gfx/characters", "sprites": "src/data/gfx/sprites"}
# banks whose contents differ between the releases (everything else is byte-identical in all four ROMs)
GFX_BANKS = ("94", "95", "9A", "9B", "9E", "9F", "A5", "A6")


class Entry:
    def __init__(self, label, kind, size, group, asset):
        self.label, self.kind, self.size, self.group, self.asset = label, kind, size, group, asset

    @property
    def compressed(self):
        return self.label.startswith(("sCompressedTiles_", "sCompressedTilemap_"))

    def __repr__(self):
        return f"Entry({self.label}, {self.kind}, {self.size})"


class Placed:
    def __init__(self, entry, offset, size, data):
        self.entry, self.offset, self.size, self.data = entry, offset, size, data

    @property
    def addr(self):
        return 0x8000 + self.offset


def kind_of(label):
    if label.startswith("Padding_"):
        return "padding"
    if label.startswith("sFontGlyphs_"):
        return "font"
    if label.startswith("sCompressedTiles_"):
        return "tiles"
    if label.startswith("sCompressedTilemap_"):
        return "tilemap"
    if label.startswith("sCharactermap_"):
        return "charmap"
    if label.startswith("Sprites_"):
        return "sprites"
    return "other"


def us_layout(bank, root=ROOT):
    """Ordered blobs of a US bank from the generated asm (`incbin` + `fill`) and the (generated) .bin sizes."""
    for group, d in GROUPS.items():
        f = Path(root) / d / f"bank_{bank}.asm"
        if f.exists():
            break
    else:
        raise FileNotFoundError(f"bank ${bank}: no graphics asm")
    out, label = [], None
    for line in f.read_text(encoding="utf-8").splitlines():
        line = re.sub(r";.*", "", line).strip()
        m = re.match(r"^([A-Za-z_]\w*):$", line)
        if m:
            label = m.group(1)
            continue
        m = re.match(r'^incbin "([^"]+)"$', line)
        if m:
            asset = (f.parent / m.group(1).replace("!{REGDIR}", "")).resolve()
            out.append(Entry(label, kind_of(label), asset.stat().st_size, group, asset))
            continue
        m = re.match(r"^fill (\d+|align \$8000)$", line)
        if m:
            out.append(Entry(label, "padding", int(m.group(1)) if m.group(1).isdigit() else 0, group, None))
    return out


def walk(rom, bank, entries):
    """Locate the blobs of `entries` (US order) in the regional ROM image; returns [Placed]; raises ValueError."""
    base = (int(bank, 16) - 0x80) * BANK
    data = rom[base:base + BANK] + PAD
    pos, out = 0, []
    for e in entries:
        if e.kind == "padding":
            if any(data[pos:BANK]):
                raise ValueError(f"${bank}: non-zero bytes after the last blob (offset {pos:#x})")
            out.append(Placed(e, pos, BANK - pos, bytes(BANK - pos)))
            pos = BANK
            continue
        if e.compressed:
            raw, used = C.decompress(data, pos)
            if C.compress(raw) != data[pos:pos + used]:
                raise ValueError(f"${bank}:{0x8000 + pos:04X} {e.label}: stream is not the canonical encoding")
            size = used
        else:
            size = e.size
        if pos + size > BANK:
            raise ValueError(f"${bank}: {e.label} runs past the end of the bank")
        out.append(Placed(e, pos, size, bytes(data[pos:pos + size])))
        pos += size
    if pos != BANK:
        raise ValueError(f"${bank}: blobs end at {pos:#x}, expected {BANK:#x}")
    return out


def us_data(e):
    """bytes of the US blob as assembled (stream plus tail)."""
    return e.asset.read_bytes()


def stream_of(e, data):
    """stream part of a compressed US blob (without the zero tail kept in the label span)."""
    if not e.compressed:
        return data
    raw, used = C.decompress(data + PAD, 0)
    return data[:used]


def classify(us_rom, rom, bank, root=ROOT):
    """-> [(Placed in the region, US Placed, 'same'|'moved'|'specific')]"""
    ents = us_layout(bank, root)
    us = walk(us_rom, bank, ents)
    rg = walk(rom, bank, ents)
    res = []
    for a, b in zip(us, rg):
        if a.entry.kind == "padding":
            res.append((b, a, "padding"))
            continue
        same_bytes = a.data == b.data
        res.append((b, a, ("same" if a.offset == b.offset else "moved") if same_bytes else "specific"))
    return res


def find_roms(rom_dir=None):
    rom_dir = rom_dir or os.environ.get("HM_ROM_DIR")
    if not rom_dir:
        sys.exit("error: pass --rom-dir or set HM_ROM_DIR (<dir>/{US,EU,DE,JP}/*.sfc); ROM images are never stored in the repository")
    roms = {}
    for r in ("US",) + REGIONS:
        hits = sorted(glob.glob(str(Path(rom_dir) / r / "*.sfc")))
        if not hits:
            sys.exit(f"error: no ROM in {Path(rom_dir) / r}")
        roms[r] = Path(hits[0]).read_bytes()
    return roms


def cmd_report(a):
    roms = find_roms(a.rom_dir)
    lines = ["| Bank | Release | Blobs | Identical (same address) | Identical, moved | Region specific | Specific bytes |",
             "|---|---|---|---|---|---|---|"]
    detail = []
    for bank in GFX_BANKS:
        for r in REGIONS:
            res = classify(roms["US"], roms[r], bank)
            blobs = [x for x in res if x[2] != "padding"]
            same = sum(1 for x in blobs if x[2] == "same")
            moved = sum(1 for x in blobs if x[2] == "moved")
            spec = [x for x in blobs if x[2] == "specific"]
            lines.append(f"| ${bank} | {r} | {len(blobs)} | {same} | {moved} | {len(spec)} | {sum(x[0].size for x in spec)} |")
            for p, u, c in spec:
                detail.append(f"| ${bank} | {r} | `{p.entry.label}` | ${bank}:{p.addr:04X} | {p.size} | ${bank}:{u.addr:04X} | {u.size} |")
    out = ["Per release blob inventory of the graphics banks (generated by `tools/data/regionbanks.py report`).", ""] + lines
    out += ["", "Region specific blobs (label = the corresponding US blob; address and size in the release and in US):", "",
            "| Bank | Release | Label | Address | Size | US address | US size |", "|---|---|---|---|---|---|---|"] + detail
    text = "\n".join(out) + "\n"
    if a.md:
        Path(a.md).write_text(text, encoding="utf-8", newline="\n")
    else:
        print(text)
    return 0


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    sub = ap.add_subparsers(dest="cmd", required=True)
    r = sub.add_parser("report")
    r.add_argument("--rom-dir")
    r.add_argument("--md")
    a = ap.parse_args()
    return {"report": cmd_report}[a.cmd](a) or 0


if __name__ == "__main__":
    sys.exit(main())
