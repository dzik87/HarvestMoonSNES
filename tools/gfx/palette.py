#!/usr/bin/env python3
"""SNES palette converter (BGR555 <-> JSON/PNG) with byte-exact round trip.

Palette banks $A8 (64) and $A9 (53, then zero padding to the end of the bank) hold 117 palettes of 512 bytes (256 colours, 16 sub-palettes of 16 colours),
labelled sPalette_0xNN. Each colour is a little-endian word 0bbbbbgggggrrrrr.

Commands:
  extract   read db-lines from src/data/gfx/palettes/bank_A8.asm / bank_A9.asm (or --from-bin dir)
            and write assets/gfx/palettes/sPalette_0xNN.{pal,json,png}
  pack      rebuild every .pal from its .json (edit the JSON, then run pack)
  emit-asm  write src/data/gfx/palettes/bank_A8.asm / bank_A9.asm as incbin of the .pal files
  check     verify .pal <-> .json consistency and lossless conversion (used by CI)

JSON: {"label": ..., "address": "$A88000", "colors": ["#RRGGBB", ...256]}; 8-bit channels are the 5-bit
value expanded as (v<<3)|(v>>2) and are folded back with v = c>>3, so every 15-bit colour round-trips.
"""
import argparse, json, re, sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
ASSETS = ROOT / "assets" / "gfx" / "palettes"
SRC = ROOT / "src" / "data" / "gfx" / "palettes"
PAL_SIZE = 512
BANKS = {"A8": (0x00, 64), "A9": (0x40, 53)}  # bank -> (first palette id, palette count)
BANK_SIZE = 0x8000


def bgr555_to_rgb(w):
    r, g, b = w & 31, (w >> 5) & 31, (w >> 10) & 31
    return tuple((v << 3) | (v >> 2) for v in (r, g, b))


def rgb_to_bgr555(r, g, b):
    return (r >> 3) | ((g >> 3) << 5) | ((b >> 3) << 10)


def bin_to_colors(data):
    if len(data) != PAL_SIZE:
        raise ValueError(f"palette must be {PAL_SIZE} bytes, got {len(data)}")
    words = [data[i] | (data[i + 1] << 8) for i in range(0, PAL_SIZE, 2)]
    if any(w & 0x8000 for w in words):
        raise ValueError("bit 15 set in a colour word; not representable")
    return ["#%02X%02X%02X" % bgr555_to_rgb(w) for w in words]


def colors_to_bin(colors):
    if len(colors) != PAL_SIZE // 2:
        raise ValueError("expected 256 colours")
    out = bytearray()
    for c in colors:
        m = re.fullmatch(r"#([0-9A-Fa-f]{6})", c)
        if not m:
            raise ValueError(f"bad colour {c!r}")
        v = int(m.group(1), 16)
        w = rgb_to_bgr555(v >> 16, (v >> 8) & 255, v & 255)
        out += bytes((w & 255, w >> 8))
    return bytes(out)


def parse_asm_palettes(path):
    """Return [(label, org_address, bytes)] from the db lines of a palette bank source."""
    text = Path(path).read_text(encoding="utf-8")
    org = int(re.search(r"ORG \$([0-9A-Fa-f]+)", text).group(1), 16)
    res = []
    for m in re.finditer(r"^(sPalette_0x[0-9A-F]{2}):\n((?:\s*db [^\n]*\n)+)", text, re.M):
        data = bytes(int(x, 16) for x in re.findall(r"\$([0-9A-Fa-f]{2})", re.sub(r";.*", "", m.group(2))))
        res.append((m.group(1), data))
    return org, res


def write_png(colors, path):
    from PIL import Image
    img = Image.new("RGB", (16 * 8, 16 * 8))
    px = img.load()
    for i, c in enumerate(colors):
        rgb = tuple(int(c[j:j + 2], 16) for j in (1, 3, 5))
        for y in range(8):
            for x in range(8):
                px[(i % 16) * 8 + x, (i // 16) * 8 + y] = rgb
    img.save(path)


def cmd_extract(args):
    ASSETS.mkdir(parents=True, exist_ok=True)
    n = 0
    for bank in BANKS:
        org, pals = parse_asm_palettes(SRC / f"bank_{bank}.asm")
        assert len(pals) == BANKS[bank][1], (bank, len(pals))
        for k, (label, data) in enumerate(pals):
            addr = org + k * PAL_SIZE
            colors = bin_to_colors(data)
            (ASSETS / f"{label}.pal").write_bytes(data)
            (ASSETS / f"{label}.json").write_text(
                json.dumps({"label": label, "address": "$%06X" % addr, "colors": colors}, indent=1) + "\n")
            if args.png:
                write_png(colors, ASSETS / f"{label}.png")
            n += 1
    print(f"extracted {n} palettes to {ASSETS}")


def cmd_pack(args):
    n = 0
    for j in sorted(ASSETS.glob("sPalette_0x*.json")):
        data = colors_to_bin(json.loads(j.read_text())["colors"])
        p = j.with_suffix(".pal")
        if not p.exists() or p.read_bytes() != data:
            p.write_bytes(data)
            n += 1
    print(f"packed; {n} .pal files updated")


def cmd_emit_asm(args):
    for bank, (first, count) in BANKS.items():
        lines = [f"; Palette bank ${bank}: {count} palettes x {PAL_SIZE} bytes (BGR555). Source of truth: assets/gfx/palettes/*.json",
                 "; Regenerate with: python tools/gfx/palette.py emit-asm", "",
                 f"    ORG ${bank}8000", ""]
        for k in range(count):
            label = "sPalette_0x%02X" % (first + k)
            lines += [f"{label}:", f'    incbin "../../../../assets/gfx/palettes/{label}.pal"', ""]
        pad = BANK_SIZE - count * PAL_SIZE
        if pad:
            lines += [f"Padding_{bank}0000:", f"    fill {pad}", ""]
        (SRC / f"bank_{bank}.asm").write_text("\n".join(lines), encoding="utf-8", newline="\n")
    print("wrote bank_A8.asm / bank_A9.asm")


def cmd_check(args):
    bad = 0
    files = sorted(ASSETS.glob("sPalette_0x*.json"))
    if len(files) != 117:
        print(f"expected 117 palettes, found {len(files)}"); bad += 1
    for j in files:
        doc = json.loads(j.read_text())
        p = j.with_suffix(".pal")
        data = p.read_bytes()
        if colors_to_bin(doc["colors"]) != data:
            print(f"MISMATCH json vs pal: {j.name}"); bad += 1
        if bin_to_colors(data) != doc["colors"]:
            print(f"NOT LOSSLESS: {j.name}"); bad += 1
    print("palette check:", "FAILED" if bad else f"OK ({len(files)} palettes)")
    return 1 if bad else 0


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    sub = ap.add_subparsers(dest="cmd", required=True)
    e = sub.add_parser("extract"); e.add_argument("--png", action="store_true")
    sub.add_parser("pack"); sub.add_parser("emit-asm"); sub.add_parser("check")
    args = ap.parse_args()
    return {"extract": cmd_extract, "pack": cmd_pack, "emit-asm": cmd_emit_asm, "check": cmd_check}[args.cmd](args) or 0


if __name__ == "__main__":
    sys.exit(main())
