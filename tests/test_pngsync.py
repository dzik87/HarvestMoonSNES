#!/usr/bin/env python3
"""Tests for tools/gfx/pngsync.py.  Run: python3 tests/test_pngsync.py  (needs Pillow)"""
import argparse
import importlib.util
import random
import shutil
import sys
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT / "tools" / "gfx"))
sys.path.insert(0, str(ROOT / "tools" / "data"))
import pngsync as P  # noqa: E402
import tiles as T  # noqa: E402
import bankbin as BB  # noqa: E402

FAILS = []


def check(cond, msg):
    if not cond:
        FAILS.append(msg)
        print("FAIL: " + msg)


def ns(**kw):
    d = dict(label=None, kind=None, allow_resize=False)
    d.update(kw)
    return argparse.Namespace(**d)


def test_sheet_matches_reference():
    rnd = random.Random(7)
    for bpp in (2, 4, 8):
        for tpr in (1, 5, 16):
            size = P.TILE_BYTES[bpp] * 37
            raw = bytes(rnd.randrange(256) for _ in range(size))
            w, h, pix = P.decode_sheet(raw, bpp, tpr)
            ref = T.to_image(raw, bpp, tpr)
            check(ref.size == (w, h) and ref.tobytes() == pix, f"decode differs from tiles.py (bpp {bpp}, tpr {tpr})")
            back = P.encode_sheet(pix, w, h, bpp, tpr, size)
            check(back == raw, f"sheet round trip failed (bpp {bpp}, tpr {tpr})")


def test_sheet_errors():
    raw = bytes(32 * 4)
    w, h, pix = P.decode_sheet(raw, 4, 4)
    bad = bytearray(pix)
    bad[3] = 16
    try:
        P.encode_sheet(bytes(bad), w, h, 4, 4, len(raw))
        check(False, "index >= 2^bpp must be rejected")
    except ValueError:
        pass
    try:
        P.encode_sheet(pix, w + 8, h, 4, 4, len(raw))
        check(False, "wrong width must be rejected")
    except ValueError:
        pass


def test_nametable_text():
    rnd = random.Random(3)
    for n in (2, 64, 2048, 6144):
        raw = bytes(rnd.randrange(256) for _ in range(n))
        for cols in (32, 128):
            check(P.parse_nametable(P.nametable_text(raw, cols)) == raw, f"name table text round trip {n}/{cols}")
    check(P.parse_nametable(P.nametable_text(b"\x01\x02\x03")) == b"\x01\x02\x03", "odd length name table")
    try:
        P.parse_nametable("12G4")
        check(False, "bad token must be rejected")
    except ValueError:
        pass


def test_tail_fields():
    for tail in (b"", b"\x00", b"\x00\x00", bytes(range(1, 200)) + bytes(5), b"\x01"):
        meta = P.split_tail(tail)
        check(P.join_tail(meta) == tail, f"tail round trip {tail[:4].hex()}")


def make_tree(tmp, labels):
    for sub in ("assets/gfx/tiles", "src/data/gfx/tiles", "assets/gfx/palettes"):
        (tmp / sub).mkdir(parents=True)
    shutil.copy(ROOT / "src/data/gfx/tiles/bank_92.asm", tmp / "src/data/gfx/tiles/bank_92.asm")
    for l in labels:
        shutil.copy(ROOT / "assets/gfx/tiles" / f"{l}.bin", tmp / "assets/gfx/tiles" / f"{l}.bin")
    pad = tmp / "assets/gfx/tiles/Padding_920000.bin"
    return pad


def bank_total(tmp):
    org, sized = BB.sizes_from_asm(tmp / "src/data/gfx/tiles/bank_92.asm", tmp / "assets/gfx/tiles")
    return sum(s for _, s in sized)


def test_import_flow():
    labels = ["sCompressedTiles_928000", "sCompressedTiles_9282CB", "sCompressedTiles_929D10",
              "sCompressedTiles_92BB03", "sCompressedTiles_92D3AB"]
    with tempfile.TemporaryDirectory() as d:
        tmp = Path(d)
        make_tree(tmp, labels)
        # the copied bank asm lists only blobs of bank $92, which is what we copied
        a = ns()
        P.cmd_export(a, tmp)
        check(P.cmd_check(a, tmp) == 0, "fresh export must pass check")
        check(P.cmd_import(a, tmp) == 0, "import of unchanged sources")
        before = (tmp / "assets/gfx/tiles/sCompressedTiles_9282CB.bin").read_bytes()
        check(bank_total(tmp) == BB.BANK, "bank size before")

        # shrink: blank graphic -> stream is padded with zeros, layout unchanged
        from PIL import Image
        b = P.Blob("tiles", "sCompressedTiles_9282CB", tmp)
        im = Image.open(b.art)
        im.paste(0, (0, 0, im.width, im.height))
        im.save(b.art)
        P.cmd_import(ns(label=[b.label]), tmp)
        after = b.bin.read_bytes()
        check(len(after) == len(before) and after != before, "shrunk blob keeps its size")
        check(P.cmd_check(ns(), tmp) == 0, "check after shrink")
        check(bank_total(tmp) == BB.BANK, "bank size after shrink")

        # grow: noisy graphic -> refused without the flag, padding adjusted with it
        rnd = random.Random(5)
        px = im.load()
        for y in range(48):
            for x in range(im.width):
                px[x, y] = rnd.randrange(16)
        im.save(b.art)
        try:
            P.cmd_import(ns(label=[b.label]), tmp)
            check(False, "growth must be refused without --allow-resize")
        except SystemExit:
            pass
        P.cmd_import(ns(label=[b.label], allow_resize=True), tmp)
        check(len(b.bin.read_bytes()) > len(before), "blob grew")
        check(bank_total(tmp) == BB.BANK, "bank size after growth is still 0x8000")
        check(P.cmd_check(ns(), tmp) == 0, "check after growth")
        # bad index
        meta = P.read_meta(b)
        meta["bpp"] = 2
        P.write_meta(b, meta)
        try:
            P.source_payload(b, meta)
            check(False, "index above 2bpp range must be rejected")
        except ValueError:
            pass


def test_real_blobs():
    allb = P.blobs()
    kinds = {k: sum(1 for b in allb if b.kind == k) for k in P.KINDS}
    check(kinds == {"tiles": 77, "sprites": 10, "tilemaps": 64}, f"blob inventory {kinds}")
    check(P.cmd_check(ns()) == 0, "all committed .bin files must be reproducible from PNG / text")
    conf = {}
    for b in allb:
        m = P.read_meta(b)
        if b.kind != "tilemaps":
            conf[m["bpp_confidence"]] = conf.get(m["bpp_confidence"], 0) + 1
    print("bpp confidence:", conf)


def main():
    for name, fn in sorted(globals().items()):
        if name.startswith("test_"):
            fn()
            print("ran", name)
    print("FAILED" if FAILS else "ALL TESTS PASSED")
    return 1 if FAILS else 0


if __name__ == "__main__":
    sys.exit(main())
