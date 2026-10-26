"""Value tables of the code banks: ROMs -> assets/tables/*.json and assets/tables/data/*.csv.

The structure lives in defs/tables/: `<name>.layout.json` (small tables) and `data/<name>.layout.csv` (typed data tables) are the
source text with every numeric content value replaced by a placeholder; the first placeholder of a run carries the ROM address of the run per
release (`?@US:82F258;EU:82F241`).  This step reads the values from the ROMs and writes the original sources back, byte for byte.
Rows that are the same in several releases are checked to be equal in every release they apply to.  Pointer columns (code labels) and names
are structure and stay in the layout files; see tools/migration/table_layout.py for how the layouts were derived.
"""
import json
import re

from . import Step, Context
from ._rom import REGIONS, Rom, enum_names, parse_addr

WIDTH = {"db": 1, "dw": 2, "dl": 3}
ARRAY = re.compile(r'"values":\s*\[([^\]]*)\]')
TOKEN = re.compile(r'"[^"]*"|-?\d+')


def _walk_arrays(spec):
    """(table label, body key, type, values node) of every `values` array in document order; body key = base / variant key."""
    for t in spec["tables"]:
        bodies = [("base", t)] + [(k, b) for k, b in t.get("variants", {}).items() if not b.get("absent")]
        for key, body in bodies:
            if "rows" in body:
                for r in body["rows"]:
                    if "values" in r:
                        yield t, key, r["type"], r
            else:
                yield t, key, body.get("type", "dw"), body


def _body_regions(t, key):
    if key == "base":
        covered = {r for k in t.get("variants", {}) for r in k.split("|")}
        return [r for r in REGIONS if r not in covered]
    return [r for r in key.split("|") if r in REGIONS]


def run_small(ctx: Context, roms, name, text):
    spec = json.loads(text)
    arrays = list(_walk_arrays(spec))
    pos = {}                                  # (table label, body key, region) -> read position, advanced array by array
    it = iter(arrays)

    def repl(m):
        t, key, typ, node = next(it)
        toks = TOKEN.findall(m.group(1))
        w = WIDTH[typ]
        regions = _body_regions(t, key)
        res = []
        first = None
        for i, tk in enumerate(toks):
            if tk[:2] in ('"?', '"#'):
                bare = tk[1] == "#"
                body = tk[2:-1]
                if body.startswith("@"):
                    for item in body[1:].split(";"):
                        r, a = item.split(":")
                        pos[(t["label"], key, r)] = int(a, 16)
                vals = {}
                for r in regions:
                    p = pos[(t["label"], key, r)]
                    vals[r] = int.from_bytes(roms[r].read(p, w), "little")
                if len(set(vals.values())) != 1:
                    raise ValueError("%s %s[%d]: releases %s differ: %s" % (name, t["label"], i, key, vals))
                v = vals[regions[0]]
                res.append(str(v) if bare else '"$%0*X"' % (w * 2, v))
            else:
                res.append(tk)
            for r in regions:
                pos[(t["label"], key, r)] = pos.get((t["label"], key, r), 0) + w
        return '"values": [' + ", ".join(res) + "]"
    out = ARRAY.sub(repl, text)
    return out


# ---------------------------------------------------------------------------------------------- typed CSV tables
TYPE_WIDTH = {"u8": 1, "u16": 2, "u24": 3, "flags8": 1, "flags16": 2, "enum8": 1, "enum16": 2, "pos16": 2, "tile16": 2, "bgr555": 2,
              "dialog16": 2, "ptr16": 2, "ptr24": 3}
REGION_FLAGS = {"US": ("US",), "EU": ("EU", "EUDE"), "DE": ("DE", "EUDE"), "JP": ("JP",)}


def _parse_columns(spec):
    cols = []
    for c in spec.split(","):
        c = c.strip()
        if not c:
            continue
        cn, _, ct = c.partition(":")
        const = None
        if "=" in ct:
            ct, _, const = ct.partition("=")
        cols.append((cn, ct, const))
    return cols


def run_csv(ctx: Context, roms, name, text):
    """Fills the placeholders of one data table layout from the ROMs, evaluating the @if branches per release."""
    records, out = {}, []
    stack = []                                  # [taken-so-far, active] per open @if, per release: dict region -> [taken, active]
    pos = {r: None for r in REGIONS}
    enums = {}

    def active_regions():
        return [r for r in REGIONS if all(e[r][1] for e in stack)]

    for lineno, raw in enumerate(text.split("\n"), 1):
        s = raw.strip()
        if not s or s.startswith("#"):
            out.append(raw)
            continue
        if s.startswith("@at "):
            for item in s[4:].split():
                r, a = item.split("=")
                pos[r] = parse_addr(a)
            continue                            # the layout directive is not part of the source
        if s.startswith("@"):
            if s.startswith("@columns "):
                records[""] = _parse_columns(s[9:])
            elif s.startswith("@record "):
                tag, _, spec = s[8:].strip().partition(" ")
                records[tag] = _parse_columns(spec)
            elif s.startswith("@if") or s.startswith("@elseif"):
                names = re.findall(r"!REGION_(\w+)", s)
                if s.startswith("@if"):
                    outer = {r: all(e[r][1] for e in stack) for r in REGIONS}
                    stack.append({r: [False, False] for r in REGIONS})
                    for r in REGIONS:
                        hit = any(n in REGION_FLAGS[r] for n in names)
                        stack[-1][r] = [hit, hit]
                else:
                    for r in REGIONS:
                        e = stack[-1][r]
                        hit = any(n in REGION_FLAGS[r] for n in names)
                        e[1] = (not e[0]) and hit
                        e[0] = e[0] or hit
            elif s == "@else":
                for r in REGIONS:
                    e = stack[-1][r]
                    e[1] = not e[0]
                    e[0] = True
            elif s == "@endif":
                stack.pop()
            out.append(raw)
            continue
        tag, prefix, body = "", "", raw
        m = re.match(r"^(\s*\w+:\s*)(.*)$", raw)
        if m and m.group(1).split(":")[0].strip() in records:
            tag, prefix, body = m.group(1).split(":")[0].strip(), m.group(1), m.group(2)
        cols = records[tag]
        free = [c for c in cols if c[2] is None]
        pieces = body.split(",") if free else []
        regs = active_regions()
        fi, rowsize, cells = 0, 0, []
        for cn, ct, const in cols:
            w = TYPE_WIDTH.get(ct, 0)
            if const is not None:
                cells.append((cn, ct, w, rowsize, None, const))
            elif ct in ("label", "note", "index"):
                cells.append((cn, ct, 0, rowsize, pieces[fi], None))
                fi += 1
            else:
                cells.append((cn, ct, w, rowsize, pieces[fi], None))
                fi += 1
            rowsize += w
        newp = []
        for cn, ct, w, off, pc, const in cells:
            if const is not None:
                for r in regs:
                    v = int.from_bytes(roms[r].read(pos[r] + off, w), "little")
                    if v != parse_addr(const):
                        raise ValueError("%s:%d: constant %s of column %s is $%X in %s" % (name, lineno, const, cn, v, r))
                continue
            v = pc.strip()
            if v.startswith("?"):
                vals = {r: int.from_bytes(roms[r].read(pos[r] + off, w), "little") for r in regs}
                if len(set(vals.values())) != 1:
                    raise ValueError("%s:%d: column %s differs between releases %s outside an @if branch" % (name, lineno, cn, vals))
                val = vals[regs[0]]
                if len(v) > 1:                  # enum hint: ?SFX -> !SFX_NAME (0 stays numeric)
                    names = enums.setdefault(v[1:], enum_names(ctx.root, v[1:]))
                    txt = "!" + names[val] if val and val in names else "$%0*X" % (w * 2, val)
                else:
                    txt = "$%0*X" % (w * 2, val)
                newp.append(pc.replace(v, txt))
            else:
                newp.append(pc)
        for r in regs:
            pos[r] += rowsize
        out.append(prefix + ",".join(newp))
    return "\n".join(out)


def run(ctx: Context):
    roms = {r: Rom(ctx.rom_bytes(r)) for r in REGIONS}
    out = ctx.assets / "tables"
    out.mkdir(parents=True, exist_ok=True)
    (out / "data").mkdir(exist_ok=True)
    for lay in sorted((ctx.defs / "tables" / "data").glob("*.layout.csv")):
        name = lay.name[:-len(".layout.csv")]
        (out / "data" / (name + ".csv")).write_bytes(run_csv(ctx, roms, name, lay.read_text(encoding="utf-8")).encode("utf-8"))
    for lay in sorted((ctx.defs / "tables").glob("*.layout.json")):
        name = lay.name[:-len(".layout.json")]
        text = run_small(ctx, roms, name, lay.read_text(encoding="utf-8"))
        (out / (name + ".json")).write_bytes(text.encode("utf-8"))


STEPS = [Step("tables", run, list(REGIONS), [], "small value tables (assets/tables/*.json) and typed data tables (assets/tables/data/*.csv)")]
