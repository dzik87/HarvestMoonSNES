#!/usr/bin/env python3
"""Assembled sprites: compose every object animation frame (banks $86/$87) from the sprite tile banks ($88-$91).

The object data (tools/objects/objdata.py, docs/formats/object-data.md) describes each frame as a list of 16x16 hardware
sprites ("components": tile id, x, y, attr).  This tool renders those frames as images exactly as the engine's OAM builder
(fObject_RenderAll $8583E0) and tile loader (fObject_ProcessTileLoadQueue $858CB2) would put them on screen, see
docs/formats/sprite-assembly.md for the evidence.

Commands:
  export [--object N]... [--out DIR] [--no-frames] [--palette-module FILE]
        write, per object, <out>/obj_XXXX/index.json (steps, timers, frames, component offsets), l0_fNN.png (one PNG per distinct
        frame image) and contact.png; plus <out>/index.json (all objects).  Default out: build/sprites_assembled (derived, never committed)
  check [--object N]... [--out DIR]
        re-parse the JSON indexes and verify them against the object data banks, and every PNG (frames and contact sheet)
        against a fresh re-render; exit 1 on any difference.  Never writes.  (CI)
  show OBJECT [--frame N] [--scale S] [--out FILE]
        render one object's contact sheet (or one frame) to FILE (default build/sprite_<obj>.png)

PNG format: indexed (mode P), pixel value = (OBJ palette number << 4) | colour index, so 128 palette entries (8 OBJ palettes
of 16 colours); every value whose low nibble is 0 is transparent (tRNS).  The PLTE chunk is only a viewing aid and is ignored
by `check`: it comes from a pluggable function (default `game_palettes`: the real day OBJ palette sPalette_0x6F; pass
--palette-module FILE exposing `sprite_palettes(object_index) -> 8 lists of 16 (r, g, b)` to use other colours, or use
`grayscale_palettes`).  The image is the bounding box of the
components; "origin" in the index is the object origin inside the image (flip-free, as stored in the data).
"""
import argparse
import hashlib
import importlib.util
import json
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / "tools" / "objects"))
sys.path.insert(0, str(ROOT / "tools" / "gfx"))
import objdata as od  # noqa: E402
import pngsync as PS  # noqa: E402

OUT_DIR = ROOT / "build" / "sprites_assembled"          # derived output: rendered on demand, never committed
SPRITE_DIR = ROOT / "assets" / "gfx" / "sprites"
FIRST_SPRITE_BANK = 0x88
SPRITE_BANKS = 10                 # $88-$91
SHEET_W = 128                     # sprite sheets: 16 tiles per row, 512 px high
SPR = 16                          # every component is one 16x16 hardware sprite
CONTACT_SCALE = 2
CONTACT_COLS = 8
BG = 255                          # contact sheet background index
TEXT = 254                        # contact sheet label index
OBJ_NAMES_CSV = ROOT / "docs" / "naming" / "object_names.csv"   # optional: index,name
UNREF_DIR = "unreferenced"


# --------------------------------------------------------------------------------------------------------------------
# Palettes (pluggable)
# --------------------------------------------------------------------------------------------------------------------
def grayscale_palettes(object_index):
    """Default palette provider: 8 OBJ palettes x 16 colours, grayscale (index 0 is transparent anyway)."""
    return [[(c * 17,) * 3 for c in range(16)] for _ in range(8)]


def game_palettes(object_index):
    """Default palette provider: the day OBJ palette (sPalette_0x6F), see docs/formats/graphics-palettes.md."""
    import palette_map
    return palette_map.sprite_palettes(object_index)


def load_palette_provider(module_path):
    if not module_path:
        return game_palettes
    spec = importlib.util.spec_from_file_location("sprite_palette_provider", module_path)
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return mod.sprite_palettes


def make_palette(pals):
    """128-colour PLTE list (flat) from 8 sub-palettes; contact-sheet extras are added by the caller."""
    flat = []
    for p in pals:
        for rgb in p:
            flat.extend(rgb)
    return flat


# --------------------------------------------------------------------------------------------------------------------
# Sprite sheets
# --------------------------------------------------------------------------------------------------------------------
class Sheets:
    """The ten raw 4bpp sprite banks (generated assets/gfx/sprites/*.bin, built from the composed sources by tools/build_assets.py)
    as 128x512 index arrays; sprite16() cuts out one 16x16 component."""

    def __init__(self, sprite_dir=SPRITE_DIR):
        self.pix = []
        for b in range(SPRITE_BANKS):
            raw = (sprite_dir / ("Sprites_%02X8000.bin" % (FIRST_SPRITE_BANK + b))).read_bytes()
            w, h, pix = PS.decode_sheet(raw, 4, 16)
            assert (w, h) == (SHEET_W, 512)
            self.pix.append(pix)
        self.cache = {}

    @staticmethod
    def locate(tile_id):
        """tile id -> (sheet index 0-9, x, y) of the 16x16 block (fObject_ProcessTileLoadQueue $858CB2-$858DD8)."""
        sheet = tile_id >> 8
        blk = (tile_id >> 6) & 3
        n = tile_id & 0x3F
        return sheet, (n & 7) * SPR, blk * 128 + (n >> 3) * SPR

    def sprite16(self, tile_id):
        """16x16 pixel rows (list of 16 bytes objects) for a tile id; all zero for ids outside the ten banks."""
        r = self.cache.get(tile_id)
        if r is None:
            sheet, x0, y0 = self.locate(tile_id)
            if sheet >= SPRITE_BANKS:
                r = [bytes(SPR)] * SPR
            else:
                pix = self.pix[sheet]
                r = [bytes(pix[(y0 + y) * SHEET_W + x0:(y0 + y) * SHEET_W + x0 + SPR]) for y in range(SPR)]
            self.cache[tile_id] = r
        return r


# --------------------------------------------------------------------------------------------------------------------
# Object data
# --------------------------------------------------------------------------------------------------------------------
def s8(v):
    return v - 256 if v >= 128 else v


def u16(d, o):
    return d[o - od.BASE] | (d[o - od.BASE + 1] << 8)


class Component:
    __slots__ = ("tile", "x", "y", "attr")

    def __init__(self, tile, x, y, attr):
        self.tile, self.x, self.y, self.attr = tile, x, y, attr

    @property
    def palette(self):
        return self.attr & 7

    @property
    def vflip(self):
        return bool(self.attr & 0x10)

    @property
    def hflip(self):
        return bool(self.attr & 0x20)

    def raw(self):
        return [self.tile, self.x, self.y, self.attr]


class ObjectData:
    """All objects read straight from the two bank byte images (independent of objdata's node model)."""

    def __init__(self):
        banks = od.load_banks()
        self.data = {b: bytes(a.data) for b, a in banks.items()}
        self.count = {0x86: od.OBJ_SPLIT, 0x87: 0x450 - od.OBJ_SPLIT}

    def bank_of(self, idx):
        return (0x86, idx) if idx < od.OBJ_SPLIT else (0x87, idx - od.OBJ_SPLIT)

    @property
    def total(self):
        return 0x450

    def frame(self, bank, ptr):
        d = self.data[bank]
        cnt = d[ptr - od.BASE]
        comps = []
        for k in range(cnt):
            o = ptr + 1 + 5 * k
            comps.append(Component(u16(d, o), d[o + 2 - od.BASE], d[o + 3 - od.BASE], d[o + 4 - od.BASE]))
        return comps

    def list_ptr(self, idx):
        bank, i = self.bank_of(idx)
        return bank, u16(self.data[bank], od.LIST_TABLE_OFF + 2 * i)

    def steps(self, idx):
        """[(frame_ptr, timer)] of the object's animation list (terminated by a zero frame pointer)."""
        bank, p = self.list_ptr(idx)
        d = self.data[bank]
        out = []
        while True:
            fp = u16(d, p)
            if fp == 0:
                return out
            out.append((fp, d[p + 2 - od.BASE]))
            p += 3

    def unreferenced_frames(self):
        """Frames that no step points to, found structurally as in objdata (list [(bank, ptr)])."""
        out = []
        models = {b: od.build_model(a) for b, a in od.load_banks().items()}
        for b, m in models.items():
            for nd in m.nodes:
                if nd.kind == "Frame" and not nd.referenced:
                    out.append((b, nd.addr))
        return out


# --------------------------------------------------------------------------------------------------------------------
# Rendering
# --------------------------------------------------------------------------------------------------------------------
def render_frame(sheets, comps):
    """Compose components -> (width, height, origin_x, origin_y, pixels bytes).

    Components are painted first to last, i.e. the last one ends up on top: the engine emits OAM entries from the last
    component to the first (lowest OAM index = in front).  Colour 0 is transparent.  The result stores
    (palette << 4) | colour, 0 = transparent."""
    if not comps:
        return 0, 0, 0, 0, b""
    minx = min(s8(c.x) for c in comps)
    miny = min(s8(c.y) for c in comps)
    maxx = max(s8(c.x) for c in comps) + SPR
    maxy = max(s8(c.y) for c in comps) + SPR
    w, h = maxx - minx, maxy - miny
    buf = bytearray(w * h)
    for c in comps:
        rows = sheets.sprite16(c.tile)
        if c.vflip:
            rows = rows[::-1]
        pal = c.palette << 4
        cx, cy = s8(c.x) - minx, s8(c.y) - miny
        for ry, row in enumerate(rows):
            if c.hflip:
                row = row[::-1]
            base = (cy + ry) * w + cx
            for rx, v in enumerate(row):
                if v:
                    buf[base + rx] = pal | v
    return w, h, -minx, -miny, bytes(buf)


def make_png(w, h, pix, palette_flat, transparent_extra=()):
    from PIL import Image
    img = Image.new("P", (max(w, 1), max(h, 1)), 0)
    if pix:
        img.frombytes(pix)
    flat = list(palette_flat)
    img.putpalette(flat + [0] * (768 - len(flat)))
    trans = bytes(0 if (i & 15) == 0 else 255 for i in range(128))
    img.info["transparency"] = trans
    return img


def save_png(img, path):
    img.save(path, optimize=True, transparency=img.info["transparency"])


def read_pixels(path):
    from PIL import Image
    im = Image.open(path)
    if im.mode != "P":
        raise ValueError("%s: not an indexed PNG" % path)
    return im.width, im.height, im.tobytes()


# --------------------------------------------------------------------------------------------------------------------
# Index building
# --------------------------------------------------------------------------------------------------------------------
def object_names():
    names = {}
    if OBJ_NAMES_CSV.exists():
        for line in OBJ_NAMES_CSV.read_text(encoding="utf-8").splitlines()[1:]:
            parts = line.split(",", 1)
            if len(parts) == 2 and parts[0].strip():
                names[int(parts[0], 0)] = re.sub(r"[^A-Za-z0-9_]+", "_", parts[1].strip())
    return names


def obj_dirname(idx, names):
    return "obj_%04X" % idx + (("_" + names[idx]) if idx in names else "")


def comp_record(c):
    sheet, sx, sy = Sheets.locate(c.tile)
    return {"tile": c.tile, "x": s8(c.x), "y": s8(c.y), "attr": c.attr,
            "sheet": "Sprites_%02X8000" % (FIRST_SPRITE_BANK + sheet), "sx": sx, "sy": sy,
            "palette": c.palette, "hflip": c.hflip, "vflip": c.vflip}


def build_object(od_data, sheets, idx, steps=None, bank=None):
    """Model of one object: {'frames': [...unique image list...], 'index': dict}; images keyed by content hash."""
    if steps is None:
        bank, _ = od_data.list_ptr(idx)
        steps = od_data.steps(idx)
    frames = {}                  # frame ptr -> record
    images = {}                  # content key -> image id
    image_list = []              # (id, w, h, ox, oy, pix)
    step_recs = []
    for si, (fp, timer) in enumerate(steps):
        if fp not in frames:
            comps = od_data.frame(bank, fp)
            w, h, ox, oy, pix = render_frame(sheets, comps)
            key = hashlib.sha1(b"%d,%d,%d,%d," % (w, h, ox, oy) + pix).hexdigest()
            if key not in images:
                images[key] = len(image_list)
                image_list.append((len(image_list), w, h, ox, oy, pix))
            frames[fp] = {"addr": "$%02X%04X" % (bank, fp), "image": images[key],
                          "origin": [ox, oy], "size": [w, h],
                          "components": [comp_record(c) for c in comps]}
        step_recs.append({"step": si, "frame": frames[fp]["addr"], "timer": timer, "image": frames[fp]["image"]})
    return frames, image_list, step_recs


def png_name(list_id, image_id):
    return "l%d_f%02d.png" % (list_id, image_id)


def object_index_dict(idx, bank, lptr, frames, image_list, step_recs):
    return {
        "object": idx,
        "bank": "$%02X" % bank,
        "list": "$%02X%04X" % (bank, lptr),
        "lists": [{"id": 0, "steps": [dict(s, png=png_name(0, s["image"])) for s in step_recs]}],
        "images": [{"png": png_name(0, i), "size": [w, h], "origin": [ox, oy]} for i, w, h, ox, oy, _ in image_list],
        "frames": [dict(f, png=png_name(0, f["image"])) for f in frames.values()],
    }


def dump_json(obj):
    """Readable JSON: one line per step / image / component, two-space indent elsewhere."""
    def line(o):
        return json.dumps(o, separators=(", ", ": "))

    def block(key, items, ind):
        return ind + json.dumps(key) + ": [\n" + ",\n".join(ind + "  " + line(i) for i in items) + "\n" + ind + "]"

    out = ["{"]
    parts = ['  "object": %d' % obj["object"], '  "bank": %s' % json.dumps(obj["bank"]),
             '  "list": %s' % json.dumps(obj["list"])]
    lists = []
    for lst in obj["lists"]:
        lists.append("    {\n      \"id\": %d,\n%s\n    }" % (lst["id"], block("steps", lst["steps"], "      ")))
    parts.append('  "lists": [\n' + ",\n".join(lists) + "\n  ]")
    parts.append(block("images", obj["images"], "  "))
    fr = []
    for f in obj["frames"]:
        head = ", ".join('"%s": %s' % (k, json.dumps(f[k])) for k in ("addr", "image", "png", "origin", "size"))
        fr.append("    {" + head + ",\n      \"components\": [\n"
                  + ",\n".join("        " + line(c) for c in f["components"]) + "\n      ]}")
    parts.append('  "frames": [\n' + ",\n".join(fr) + "\n  ]")
    out.append(",\n".join(parts))
    out.append("}")
    return "\n".join(out) + "\n"


# --------------------------------------------------------------------------------------------------------------------
# Contact sheet
# --------------------------------------------------------------------------------------------------------------------
FONT3X5 = {"f": "111100110100100", "0": "111101101101111", "1": "010110010010111", "2": "111001111100111",
           "3": "111001111001111", "4": "101101111001001", "5": "111100111001111", "6": "111100111101111",
           "7": "111001001010010", "8": "111101111101111", "9": "111101111001111"}


def draw_label(canvas, W, x0, y0, text):
    """Deterministic 3x5 pixel label (independent of the Pillow default font, which differs between versions)."""
    for k, ch in enumerate(text):
        bits = FONT3X5[ch]
        for i, b in enumerate(bits):
            if b == "1":
                canvas[(y0 + i // 3) * W + x0 + 4 * k + i % 3] = TEXT


def contact_sheet(image_list, pals, scale=CONTACT_SCALE):
    """Unique frame images aligned on the object origin in a grid; returns a PIL 'P' image (no transparency)."""
    from PIL import Image
    if not image_list:
        return None
    left = max(ox for _, w, h, ox, oy, _ in image_list)
    top = max(oy for _, w, h, ox, oy, _ in image_list)
    right = max(w - ox for _, w, h, ox, oy, _ in image_list)
    bottom = max(h - oy for _, w, h, ox, oy, _ in image_list)
    cw, ch = left + right + 2, top + bottom + 2 + 8        # +8: label row
    cols = min(CONTACT_COLS, len(image_list))
    rows = (len(image_list) + cols - 1) // cols
    W, H = cols * cw, rows * ch
    canvas = bytearray([BG]) * (W * H)
    for n, (_, w, h, ox, oy, pix) in enumerate(image_list):
        draw_label(canvas, W, (n % cols) * cw + 1, (n // cols) * ch + 1, "f%02d" % n)
        cx, cy = (n % cols) * cw + 1 + left - ox, (n // cols) * ch + 9 + top - oy
        for y in range(h):
            for x in range(w):
                v = pix[y * w + x]
                if v & 15:
                    canvas[(cy + y) * W + cx + x] = v
    img = Image.new("P", (W, H))
    img.frombytes(bytes(canvas))
    if scale > 1:
        img = img.resize((W * scale, H * scale), Image.NEAREST)
    flat = make_palette(pals)
    flat += [0] * (TEXT * 3 - len(flat)) + [255, 255, 255] + [64, 96, 128]
    img.putpalette(flat)
    return img


# --------------------------------------------------------------------------------------------------------------------
# Commands
# --------------------------------------------------------------------------------------------------------------------
def selected_objects(od_data, args):
    if args.object:
        return sorted(set(int(o, 0) for o in args.object))
    return list(range(od_data.total))


def write_object(out_dir, name, idx, od_data, sheets, provider, frames_png=True, steps=None, bank=None, lptr=None):
    if steps is None:
        bank, lptr = od_data.list_ptr(idx)
    frames, image_list, step_recs = build_object(od_data, sheets, idx, steps, bank)
    d = out_dir / name
    d.mkdir(parents=True, exist_ok=True)
    for old in d.iterdir():
        old.unlink()
    pals = provider(idx)
    flat = make_palette(pals)
    if frames_png:
        for i, w, h, ox, oy, pix in image_list:
            save_png(make_png(w, h, pix, flat), d / png_name(0, i))
    cs = contact_sheet(image_list, pals)
    if cs is not None:
        cs.save(d / "contact.png", optimize=True)
    (d / "index.json").write_text(dump_json(object_index_dict(idx, bank, lptr, frames, image_list, step_recs)),
                                  encoding="utf-8", newline="\n")
    return frames, image_list, step_recs


def cmd_export(args):
    od_data = ObjectData()
    sheets = Sheets()
    provider = load_palette_provider(args.palette_module)
    out_dir = Path(args.out)
    names = object_names()
    summary = []
    nframes = nimages = nsteps = 0
    for idx in selected_objects(od_data, args):
        frames, image_list, step_recs = write_object(out_dir, obj_dirname(idx, names), idx, od_data, sheets, provider,
                                                    not args.no_frames)
        nframes += len(frames)
        nimages += len(image_list)
        nsteps += len(step_recs)
        bank, lptr = od_data.list_ptr(idx)
        summary.append({"object": idx, "dir": obj_dirname(idx, names), "bank": "$%02X" % bank,
                        "steps": len(step_recs), "frames": len(frames), "images": len(image_list)})
    if not args.object:
        # frames no step points to (dead data), exported as one pseudo object
        unref = od_data.unreferenced_frames()
        _write_unreferenced(out_dir, od_data, sheets, provider, unref, not args.no_frames)
        (out_dir / "index.json").write_text(
            json.dumps({"objects": summary, "unreferenced_dir": UNREF_DIR}, indent=1) + "\n", encoding="utf-8",
            newline="\n")
    print("exported %d objects, %d steps, %d distinct frames, %d distinct images -> %s"
          % (len(summary), nsteps, nframes, nimages, out_dir))
    return 0


def _write_unreferenced(out_dir, od_data, sheets, provider, unref, frames_png):
    """Dead frames of both banks in one folder: index.json lists them, PNG per frame (lXX naming is bank/addr)."""
    d = out_dir / UNREF_DIR
    d.mkdir(parents=True, exist_ok=True)
    for old in d.iterdir():
        old.unlink()
    flat = make_palette(provider(-1))
    images = []
    recs = []
    for bank, ptr in unref:
        comps = od_data.frame(bank, ptr)
        w, h, ox, oy, pix = render_frame(sheets, comps)
        name = "%02X%04X.png" % (bank, ptr)
        if frames_png:
            save_png(make_png(w, h, pix, flat), d / name)
        images.append((len(images), w, h, ox, oy, pix))
        recs.append({"addr": "$%02X%04X" % (bank, ptr), "png": name, "origin": [ox, oy], "size": [w, h],
                     "components": [comp_record(c) for c in comps]})
    text = "{\n \"note\": \"frames that no animation step references (dead data)\",\n \"frames\": [\n"
    text += ",\n".join("  " + json.dumps(r, separators=(", ", ": ")) for r in recs) + "\n ]\n}\n"
    (d / "index.json").write_text(text, encoding="utf-8", newline="\n")
    cs = contact_sheet(images, provider(-1))
    if cs is not None:
        cs.save(d / "contact.png", optimize=True)


def cmd_check(args):
    od_data = ObjectData()
    sheets = Sheets()
    out_dir = Path(args.out)
    errors = []

    def err(msg):
        if len(errors) < 50:
            print("FAIL: " + msg)
        errors.append(msg)

    names = object_names()
    top = out_dir / "index.json"
    listed = {}
    if top.exists():
        listed = {o["object"]: o for o in json.loads(top.read_text(encoding="utf-8"))["objects"]}
        if not args.object and sorted(listed) != list(range(od_data.total)):
            err("top-level index does not list all %d objects" % od_data.total)
    elif not args.object:
        err("missing %s" % top)
    nobj = nframes = nimg = 0
    for idx in selected_objects(od_data, args):
        name = obj_dirname(idx, names)
        d = out_dir / name
        jf = d / "index.json"
        if idx in listed and listed[idx]["dir"] != name:
            err("object %04X: top-level index says dir %s, expected %s" % (idx, listed[idx]["dir"], name))
        if not jf.exists():
            err("object %04X: missing %s" % (idx, jf))
            continue
        j = json.loads(jf.read_text(encoding="utf-8"))
        bank, lptr = od_data.list_ptr(idx)
        steps = od_data.steps(idx)
        if j["object"] != idx or j["bank"] != "$%02X" % bank or j["list"] != "$%02X%04X" % (bank, lptr):
            err("object %04X: header does not match the data banks" % idx)
        # steps
        js = j["lists"][0]["steps"]
        if len(js) != len(steps) or any(
                int(s["frame"][3:], 16) != fp or s["timer"] != t or s["step"] != n
                for n, (s, (fp, t)) in enumerate(zip(js, steps))):
            err("object %04X: steps differ from the animation list at $%02X%04X" % (idx, bank, lptr))
            continue
        # frames / components / images
        by_addr = {f["addr"]: f for f in j["frames"]}
        if sorted(by_addr) != sorted({"$%02X%04X" % (bank, fp) for fp, _ in steps}):
            err("object %04X: frame set differs from the steps" % idx)
            continue
        want_frames, want_images, want_steps = build_object(od_data, sheets, idx)
        for fp, rec in want_frames.items():
            f = by_addr["$%02X%04X" % (bank, fp)]
            if f["components"] != rec["components"]:
                err("object %04X frame $%04X: components differ from the data bank" % (idx, fp))
            if f["origin"] != rec["origin"] or f["size"] != rec["size"] or f["image"] != rec["image"]:
                err("object %04X frame $%04X: geometry/image id differs from a fresh render" % (idx, fp))
        if len(j["images"]) != len(want_images):
            err("object %04X: image count differs from a fresh render" % idx)
            continue
        for (i, w, h, ox, oy, pix) in want_images:
            png = d / png_name(0, i)
            if j["images"][i] != {"png": png_name(0, i), "size": [w, h], "origin": [ox, oy]}:
                err("object %04X: images[%d] entry differs" % (idx, i))
            if not png.exists():
                err("object %04X: missing %s" % (idx, png.name))
                continue
            pw, ph, ppix = read_pixels(png)
            if (pw, ph) != (max(w, 1), max(h, 1)) or ppix != pix:
                err("object %04X: %s differs from a fresh re-render" % (idx, png.name))
            nimg += 1
        extra = {p.name for p in d.iterdir()} - {png_name(0, i) for i in range(len(want_images))} \
            - {"index.json", "contact.png"}
        if extra:
            err("object %04X: unexpected files %s" % (idx, sorted(extra)))
        cs = contact_sheet(want_images, grayscale_palettes(idx))
        cpath = d / "contact.png"
        if cs is not None:
            if not cpath.exists():
                err("object %04X: missing contact.png" % idx)
            else:
                cw, ch, cpix = read_pixels(cpath)
                if (cw, ch) != cs.size or cpix != cs.tobytes():
                    err("object %04X: contact.png differs from a fresh render" % idx)
        nobj += 1
        nframes += len(want_frames)
    if not args.object:
        _check_unreferenced(out_dir, od_data, sheets, err)
    if errors:
        print("sprite export check FAILED (%d problems)" % len(errors))
        return 1
    print("sprite export OK: %d objects, %d frames, %d images match the object data banks and a fresh render"
          % (nobj, nframes, nimg))
    return 0


def _check_unreferenced(out_dir, od_data, sheets, err):
    d = out_dir / UNREF_DIR
    jf = d / "index.json"
    if not jf.exists():
        err("missing %s" % jf)
        return
    j = json.loads(jf.read_text(encoding="utf-8"))
    unref = od_data.unreferenced_frames()
    if [f["addr"] for f in j["frames"]] != ["$%02X%04X" % (b, p) for b, p in unref]:
        err("unreferenced frame list differs from the data banks")
        return
    for f, (bank, ptr) in zip(j["frames"], unref):
        comps = od_data.frame(bank, ptr)
        w, h, ox, oy, pix = render_frame(sheets, comps)
        if f["components"] != [comp_record(c) for c in comps] or f["size"] != [w, h] or f["origin"] != [ox, oy]:
            err("unreferenced frame %s differs from the data bank" % f["addr"])
        p = d / f["png"]
        if not p.exists():
            err("missing %s" % p)
            continue
        pw, ph, ppix = read_pixels(p)
        if (pw, ph) != (max(w, 1), max(h, 1)) or ppix != pix:
            err("unreferenced frame %s: PNG differs from a fresh re-render" % f["addr"])


def cmd_show(args):
    od_data = ObjectData()
    sheets = Sheets()
    idx = int(args.object, 0)
    provider = load_palette_provider(args.palette_module)
    frames, image_list, _ = build_object(od_data, sheets, idx)
    pals = provider(idx)
    if args.frame is not None:
        _, w, h, ox, oy, pix = image_list[args.frame]
        img = make_png(w, h, pix, make_palette(pals))
        img = img.convert("RGBA").resize((w * args.scale, h * args.scale))
    else:
        img = contact_sheet(image_list, pals, args.scale)
    out = Path(args.out or ROOT / "build" / ("sprite_%04X.png" % idx))
    out.parent.mkdir(parents=True, exist_ok=True)
    img.save(out)
    print(out)
    return 0


def main(argv=None):
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    sub = ap.add_subparsers(dest="cmd", required=True)
    a = sub.add_parser("export")
    a.add_argument("--object", action="append", help="object index (repeatable; default all)")
    a.add_argument("--out", default=str(OUT_DIR))
    a.add_argument("--no-frames", action="store_true", help="write only index.json and contact.png")
    a.add_argument("--palette-module")
    a.set_defaults(fn=cmd_export)
    c = sub.add_parser("check")
    c.add_argument("--object", action="append")
    c.add_argument("--out", default=str(OUT_DIR))
    c.set_defaults(fn=cmd_check)
    s = sub.add_parser("show")
    s.add_argument("object")
    s.add_argument("--frame", type=int)
    s.add_argument("--scale", type=int, default=CONTACT_SCALE)
    s.add_argument("--out")
    s.add_argument("--palette-module")
    s.set_defaults(fn=cmd_show)
    args = ap.parse_args(argv)
    return args.fn(args)


if __name__ == "__main__":
    sys.exit(main())
