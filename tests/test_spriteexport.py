#!/usr/bin/env python3
"""Tests for tools/objects/spriteexport.py.  Run: python3 tests/test_spriteexport.py  (needs Pillow)"""
import json
import shutil
import sys
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT / "tools" / "objects"))
sys.path.insert(0, str(ROOT / "tools" / "gfx"))
import spriteexport as S  # noqa: E402
import tiles as T  # noqa: E402

FAILS = []


def check(cond, msg):
    if not cond:
        FAILS.append(msg)
        print("FAIL: " + msg)


class FakeSheets:
    """Every tile id is a 16x16 block filled with (id & 15) or 1 (so that it is never transparent)."""

    def sprite16(self, tile_id):
        v = (tile_id & 15) or 1
        return [bytes([v] * 16) for _ in range(16)]


class GradSheets:
    """Asymmetric block: pixel value = 1 + (x == 0) + 2 * (y == 0), to see flips."""

    def sprite16(self, tile_id):
        return [bytes([1 + (x == 0) + 2 * (y == 0) for x in range(16)]) for y in range(16)]


def test_tile_mapping_matches_dma_formula():
    """Re-derive the 4 tiles the engine DMAs (fObject_ProcessTileLoadQueue / ExecuteTileDmaQueue) from the raw bank
    bytes and compare them with the 16x16 block the tool cuts out of the sheet."""
    sh = S.Sheets()
    slot = [((n & 7) * 2) + (n >> 3) * 0x20 for n in range(64)]            # slot table $868000
    blocks = [0x0000, 0x2000, 0x4000, 0x6000]                              # aObject_TileBlockSourceOffsets
    ids = [0x0000, 0x0001, 0x003F, 0x0040, 0x00C0, 0x00FF, 0x0100, 0x0345, 0x05A1, 0x09FE, 0x0777]
    for tid in ids:
        bank = 0x88 + (tid >> 8)
        raw = (ROOT / "assets" / "gfx" / "sprites" / (S.SB.label(bank) + ".bin")).read_bytes()
        src = blocks[(tid >> 6) & 3] + slot[tid & 0x3F] * 0x20
        tiles = [src, src + 0x20, src + 0x200, src + 0x220]               # DMA 1: +0 ($40 bytes), DMA 2: +$200
        expect = [[0] * 16 for _ in range(16)]
        for k, off in enumerate(tiles):
            px = T.decode_tile(raw, off, 4)
            for y in range(8):
                for x in range(8):
                    expect[(k // 2) * 8 + y][(k % 2) * 8 + x] = px[y][x]
        got = [list(r) for r in sh.sprite16(tid)]
        check(got == expect, "tile id %04X: sprite block differs from the engine's DMA source" % tid)


def test_render_order_and_flips():
    comp = S.Component
    # paint order: the last component is on top
    w, h, ox, oy, pix = S.render_frame(FakeSheets(), [comp(1, 0, 0, 0), comp(2, 8, 0, 0)])
    check((w, h, ox, oy) == (24, 16, 0, 0), "bbox of two overlapping components")
    check(pix[0] == 1 and pix[8] == 2 and pix[23] == 2, "last component must overwrite the earlier one")
    # palette goes into the high nibble, colour 0 stays transparent
    w, h, ox, oy, pix = S.render_frame(FakeSheets(), [comp(1, -8, -4, 3)])
    check((w, h, ox, oy) == (16, 16, 8, 4) and pix[0] == 0x31, "palette in bits 4-6, origin offset")
    w, h, ox, oy, pix = S.render_frame(FakeSheets(), [comp(0x10, 0, 0, 0)])
    check(pix[0] == 1, "colour 0 of the fake sheet is replaced by 1 (sanity)")
    # flips (attr bit 5 = H, bit 4 = V), whole 16x16 block
    base = S.render_frame(GradSheets(), [comp(0, 0, 0, 0)])[4]
    h_ = S.render_frame(GradSheets(), [comp(0, 0, 0, 0x20)])[4]
    v_ = S.render_frame(GradSheets(), [comp(0, 0, 0, 0x10)])[4]
    check(base[0] == 4 and base[15] == 3 and base[16 * 15] == 2, "base block layout")
    check(h_[0] == 3 and h_[15] == 4, "attr bit 5 flips horizontally")
    check(v_[0] == 2 and v_[16 * 15] == 4, "attr bit 4 flips vertically")
    # signed offsets
    w, h, ox, oy, pix = S.render_frame(FakeSheets(), [comp(1, 0xF0, 0x80, 0), comp(1, 0x10, 0x7F, 0)])
    check((w, h, ox, oy) == (48, 16 + 255, 16, 128), "x/y are signed bytes (-16 / -128 .. 16 / 127)")


def test_dump_json_roundtrip():
    sh = S.Sheets()
    od_data = S.ObjectData()
    frames, imgs, steps = S.build_object(od_data, sh, 0)
    bank, lptr = od_data.list_ptr(0)
    text = S.dump_json(S.object_index_dict(0, bank, lptr, frames, imgs, steps))
    j = json.loads(text)
    check(j["object"] == 0 and j["lists"][0]["steps"][0]["timer"] == steps[0]["timer"], "index json is valid JSON")
    check(len(j["frames"]) == len(frames), "all frames listed")


def test_export_check_and_tamper():
    tmp = Path(tempfile.mkdtemp())
    try:
        out = tmp / "sa"
        check(S.main(["export", "--out", str(out)]) == 0, "export runs")
        check(S.main(["check", "--out", str(out)]) == 0, "check passes on a fresh export")
        pristine = tmp / "pristine"
        shutil.copytree(out, pristine)
        # tamper with a PNG pixel
        from PIL import Image
        p = out / "obj_0000" / "l0_f00.png"
        im = Image.open(p)
        px = bytearray(im.tobytes())
        px[len(px) // 2] ^= 0x01
        im2 = Image.frombytes("P", im.size, bytes(px))
        im2.putpalette(im.getpalette())
        im2.save(p)
        check(S.main(["check", "--out", str(out), "--object", "0"]) == 1, "check detects a changed PNG pixel")
        shutil.copy(pristine / "obj_0000" / "l0_f00.png", p)
        check(S.main(["check", "--out", str(out), "--object", "0"]) == 0, "check passes again after restoring")
        # tamper with a component in the JSON
        jp = out / "obj_0004" / "index.json"
        j = json.loads(jp.read_text())
        j["frames"][0]["components"][0]["x"] += 1
        jp.write_text(S.dump_json(j))
        check(S.main(["check", "--out", str(out), "--object", "4"]) == 1, "check detects a component change in JSON")
        # tamper with a timer
        j = json.loads((pristine / "obj_0004" / "index.json").read_text())
        j["lists"][0]["steps"][0]["timer"] ^= 1
        jp.write_text(S.dump_json(j))
        check(S.main(["check", "--out", str(out), "--object", "4"]) == 1, "check detects a changed timer")
        # missing file
        (out / "obj_0001" / "contact.png").unlink()
        check(S.main(["check", "--out", str(out), "--object", "1"]) == 1, "check detects a missing contact sheet")
    finally:
        shutil.rmtree(tmp)


def test_frames_are_the_composed_sources():
    """the committed frame PNGs (assets/gfx/png/frames, the editable sprite sources written by pngsync.py) show exactly what
    spriteexport renders for the same frame (pixels; the palette is not compared)."""
    od_data = S.ObjectData()
    sh = S.Sheets()
    n = 0
    for idx in (0, 1, 4, 0x95, 0x18B, 0x2F6):
        bank, _ = od_data.list_ptr(idx)
        for fp in sorted({fp for fp, _t in od_data.steps(idx)}):
            comps = od_data.frame(bank, fp)
            if not comps:
                continue
            w, h, ox, oy, pix = S.render_frame(sh, comps)
            pw, ph, ppix = S.read_pixels(ROOT / "assets/gfx/png/frames" / ("obj_%04X" % idx) / ("f_%04X.png" % fp))
            check((pw, ph) == (w, h) and ppix == pix, "frame %04X/%04X: source PNG differs from the render" % (idx, fp))
            n += 1
    check(n > 10, "compared %d frames" % n)


def test_counts():
    od_data = S.ObjectData()
    n = sum(len(od_data.steps(i)) for i in range(od_data.total))
    check(od_data.total == 1104 and n == 3774, "1104 objects and 3774 steps as in object-data.md (got %d)" % n)
    check(len(od_data.unreferenced_frames()) == 7, "7 unreferenced frames")


def main():
    for name, fn in sorted(globals().items()):
        if name.startswith("test_") and callable(fn):
            fn()
    if FAILS:
        print("%d FAILED" % len(FAILS))
        return 1
    print("spriteexport tests OK")
    return 0


if __name__ == "__main__":
    sys.exit(main())
