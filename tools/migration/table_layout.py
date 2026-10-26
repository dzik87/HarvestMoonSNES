#!/usr/bin/env python3
"""One-off migration: split the ROM-derived value tables into committed structure (defs/tables/) and extracted content (assets/tables/).

For every table source of the code banks (assets/tables/*.json, assets/tables/data/*.csv) this writes a *layout* into defs/tables/ that is the
same text with every numeric content value replaced by a placeholder, and the ROM address of each run of values per release.  The extractor
(tools/extract_steps/tables.py) reads the values back from the ROMs through that layout and must reproduce the original source byte for byte.

The addresses come from the assembler: the generated assembly of the tables (build/gen/{tables,blocks}) is instrumented with
`print hex(pc())` before every data line, the project is assembled for the four releases in a scratch copy and the printed addresses are
mapped back to the source rows.

    python tools/migration/table_layout.py [--keep DIR]

Requires tools/bin/asar and a complete assets/ tree (the committed one).  Safe to run again; it rewrites defs/tables/.
"""
import json
import os
import re
import shutil
import subprocess
import sys
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / "tools" / "data"))
sys.path.insert(0, str(ROOT / "tools"))
import smalltables  # noqa: E402
import tabledata  # noqa: E402

REGIONS = ("US", "EU", "DE", "JP")
MARK = re.compile(r"^@@([\w/]+):(\d+):([0-9A-F]+)$")


def instrument(gen: Path):
    n = 0
    for d in ("tables", "blocks"):
        for f in sorted((gen / d).glob("*.asm")):
            out = []
            for i, line in enumerate(f.read_text(encoding="utf-8").split("\n")):
                if re.match(r"\s+(db|dw|dl)\s", line):
                    out.append('    print "@@%s/%s:%d:", hex(pc())' % (d, f.stem, i))
                    n += 1
                out.append(line)
            f.write_text("\n".join(out), encoding="utf-8")
    return n


def collect_marks(keep=None):
    """-> {region: {(dir/stem, line index): address}} from assembling an instrumented scratch copy of the project."""
    tmp = Path(tempfile.mkdtemp(prefix="hm_layout_"))
    try:
        shutil.copytree(ROOT, tmp / "p", ignore=shutil.ignore_patterns(".git", "build", "__pycache__", "third_party"), symlinks=True)
        (tmp / "p" / "tools" / "bin").mkdir(parents=True, exist_ok=True)
        shutil.copy(ROOT / "tools" / "bin" / "asar", tmp / "p" / "tools" / "bin" / "asar")
        shutil.copytree(ROOT / "third_party", tmp / "p" / "third_party", symlinks=True, ignore=shutil.ignore_patterns(".git"))
        p = tmp / "p"
        subprocess.run([sys.executable, "tools/build_assets.py"], cwd=p, check=True, capture_output=True)
        instrument(p / "build" / "gen")
        marks = {}
        for r in REGIONS:
            rom = tmp / (r + ".sfc")
            rom.write_bytes(bytes(0x200000))
            cmd = [str(p / "tools" / "bin" / "asar")] + (["-DREGION_%s=1" % r] if r != "US" else []) + ["-werror", "--no-title-check", "--fix-checksum=off", "src/main.asm", str(rom)]
            res = subprocess.run(cmd, cwd=p, capture_output=True, text=True)
            if res.returncode:
                raise SystemExit("asar failed for %s:\n%s" % (r, res.stdout[-2000:] + res.stderr[-2000:]))
            m = {}
            for line in res.stdout.splitlines():
                mm = MARK.match(line.strip())
                if mm:
                    m[(mm.group(1), int(mm.group(2)))] = int(mm.group(3), 16)
            marks[r] = m
        return marks
    finally:
        if keep:
            shutil.rmtree(keep, ignore_errors=True)
            shutil.copytree(tmp, keep)
        shutil.rmtree(tmp, ignore_errors=True)


# --------------------------------------------------------------------------------------------------------------- small JSON tables
def tagged_lines(t):
    """Same lines as smalltables.render_table(t) -> [(text, (body key, row index) or None)] for the data lines."""
    out = []
    if t.get("doc"):
        out += [("; " + l, None) for l in t["doc"].split("\n")]
    variants = t.get("variants", {})
    absent = [k for k, b in variants.items() if b.get("absent")]
    variants = {k: b for k, b in variants.items() if not b.get("absent")}

    def body_lines(body, key, indent="    "):
        res = []
        for ri, r in enumerate(smalltables.body_rows(body)):
            if "label" in r:
                res.append((f"{r['label']}:", None))
                continue
            n = r["per_line"]
            for i in range(0, len(r["values"]), n):
                res.append((f"{indent}{r['type']} " + ",".join(smalltables.fmt(v, r["type"]) for v in r["values"][i:i + n]), (key, ri)))
        return res
    inner = [(f"{t['label']}:", None)]
    if variants:
        for n, (key, body) in enumerate(variants.items()):
            inner.append((f"    {'if' if n == 0 else 'elseif'} {smalltables.region_cond(key)}", None))
            inner += body_lines(body, key)
        inner.append(("    else", None))
        inner += body_lines(t, "base")
        inner.append(("    endif", None))
    else:
        inner += body_lines(t, "base", "    ")
    if absent:
        out += [(f"    if {smalltables.region_cond('|'.join(absent))}", None), ("    else", None)] + inner + [("    endif", None)]
    else:
        out += inner
    return out


def region_body(t, region):
    """Key of the body (base or a variant key) that is assembled for `region`, None when the table is absent."""
    for key, body in t.get("variants", {}).items():
        if region in key.split("|"):
            return None if body.get("absent") else key
    return "base"


def bodies(t):
    yield "base", t
    for key, b in t.get("variants", {}).items():
        if not b.get("absent"):
            yield key, b


def small_tables(marks, defs):
    out_dir = defs / "tables"
    out_dir.mkdir(parents=True, exist_ok=True)
    for src in sorted((ROOT / "assets" / "tables").glob("*.json")):
        name = src.stem
        spec = json.loads(src.read_text(encoding="utf-8"))
        text = src.read_text(encoding="utf-8")
        # line index of each table in the generated file: HDR, "", then render_table + [""] per table
        pos = 2
        addr = {}                      # (table label, body key) -> {region: address}
        for t in spec["tables"]:
            lines = tagged_lines(t)
            assert [l for l, _ in lines] == smalltables.render_table(t), name
            for ln, (_, tag) in enumerate(lines):
                if tag is None:
                    continue
                for r in REGIONS:
                    a = marks[r].get(("tables/" + name, pos + ln))
                    if a is not None and region_body(t, r) == tag[0]:
                        d = addr.setdefault((t["label"], tag[0]), {})
                        d.setdefault(r, a)          # first data line of the body = start address
            pos += len(lines) + 1
        # textual template: replace the numeric values of every `"values": [...]` array, in document order
        arrays = []
        for t in spec["tables"]:
            for key, body in bodies(t):
                if "rows" in body:
                    for r in body["rows"]:
                        if "values" in r:
                            arrays.append((t["label"], key, r))
                else:
                    arrays.append((t["label"], key, body))
        it = iter(arrays)
        seen = set()

        def repl(m):
            label, key, node = next(it)
            first = (label, key) not in seen
            seen.add((label, key))
            body = m.group(1)
            toks = re.findall(r'"[^"]*"|-?\d+', body)
            vals = node["values"]
            assert len(toks) == len(vals), (name, label, key)
            res = []
            tag_done = not first
            for tk, v in zip(toks, vals):
                if isinstance(v, int) or (isinstance(v, str) and re.fullmatch(r"\$[0-9A-Fa-f]+", v)):
                    ph = "#" if isinstance(v, int) else "?"
                    if not tag_done:
                        ph += "@" + ";".join("%s:%06X" % (r, a) for r, a in sorted(addr[(label, key)].items(), key=lambda kv: REGIONS.index(kv[0])))
                        tag_done = True
                    res.append('"%s"' % ph)
                else:
                    res.append(tk)
            return '"values": [' + ", ".join(res) + "]"
        new = re.sub(r'"values":\s*\[([^\]]*)\]', repl, text)
        assert next(it, None) is None
        (out_dir / (name + ".layout.json")).write_text(new, encoding="utf-8")
        print("tables/%s.layout.json" % name)


# --------------------------------------------------------------------------------------------------------------- typed CSV tables
CONTENT_TYPES = {"u8", "u16", "u24", "flags8", "flags16", "enum8", "enum16", "pos16", "tile16", "bgr555", "dialog16"}
WIDTHS = {t: w for t, (d, w) in tabledata.TYPES.items()}
HEX = re.compile(r"^\$([0-9A-Fa-f]+)$")
ENUM = re.compile(r"^!([A-Z0-9]+)_\w+$")


def csv_tables(marks, defs, pure):
    """Layouts of assets/tables/data/*.csv.  A source without any content cell is structure as a whole: its name is appended to `pure`."""
    outdir = defs / "tables" / "data"
    outdir.mkdir(parents=True, exist_ok=True)
    for b in tabledata.load_manifest():
        name = b["name"]
        src = ROOT / "assets" / "tables" / "data" / (name + ".csv")
        if not src.exists():
            continue                                   # pure structure, already moved to defs/tables/data
        text = src.read_text(encoding="utf-8")
        items = tabledata.parse_source(text, src.name)
        # generated line index of the first data line of every row item (render(): header line, then one line per item / row group)
        ln, first_line = 1, []
        for it in items:
            if it[0] == "row":
                first_line.append(ln + (1 if it[2] else 0))
                ln += (1 if it[2] else 0) + len(it[1])
            else:
                ln += 1
        records, out, content, rows_seen = {}, [], 0, 0
        sim = {r: None for r in REGIONS}               # next expected address per release
        for raw in text.split("\n"):
            s = raw.strip()
            if not s or s.startswith("#"):
                out.append(raw)
                continue
            if s.startswith("@"):
                if s.startswith("@columns "):
                    records[""] = tabledata.parse_columns(s[9:], src.name)
                elif s.startswith("@record "):
                    tag, _, spec = s[8:].strip().partition(" ")
                    records[tag] = tabledata.parse_columns(spec, src.name)
                out.append(raw)
                continue
            tag, prefix, body = "", "", raw
            m = re.match(r"^(\s*\w+:\s*)(.*)$", raw)
            if m and m.group(1).split(":")[0].strip() in records:
                tag, prefix, body = m.group(1).split(":")[0].strip(), m.group(1), m.group(2)
            cols = records[tag]
            free = [c for c in cols if c[2] is None]
            pieces = body.split(",") if free else []
            newp, fi, rowsize = [], 0, 0
            for cn, ct, const in cols:
                if ct not in ("label", "note", "index"):
                    rowsize += WIDTHS[ct]
                if const is not None:
                    continue
                pc = pieces[fi]
                fi += 1
                v = pc.strip()
                if ct in CONTENT_TYPES:
                    mh = HEX.match(v)
                    me = ENUM.match(v)
                    if mh and len(mh.group(1)) == 2 * WIDTHS[ct]:
                        newp.append(pc.replace(v, "?"))
                    elif me and ct in ("enum8", "enum16"):
                        newp.append(pc.replace(v, "?" + me.group(1)))
                    else:
                        raise SystemExit("%s: cell %r of column %s is neither full width hex nor an enum name" % (src.name, v, cn))
                    content += 1
                else:
                    newp.append(pc)
            idx = rows_seen
            rows_seen += 1
            brk = {}
            for r in REGIONS:
                a = marks[r].get(("blocks/" + name, first_line[idx]))
                if a is not None:
                    if sim[r] != a:
                        brk[r] = a
                    sim[r] = a + rowsize
            if brk:
                out.append("@at " + " ".join("%s=$%06X" % (r, brk[r]) for r in REGIONS if r in brk))
            out.append(prefix + ",".join(newp))
        if content == 0:
            pure.append(name)
        else:
            (outdir / (name + ".layout.csv")).write_text("\n".join(out), encoding="utf-8")
            print("tables/data/%s.layout.csv (%d content cells)" % (name, content))


def main():
    defs = ROOT / "defs"
    marks = collect_marks()
    small_tables(marks, defs)
    pure = []
    csv_tables(marks, defs, pure)
    for n in pure:
        dst = defs / "tables" / "data" / (n + ".csv")
        subprocess.run(["git", "mv", "assets/tables/data/%s.csv" % n, str(dst.relative_to(ROOT))], cwd=ROOT, check=True)
        print("moved %s.csv (no content cells)" % n)


if __name__ == "__main__":
    main()
