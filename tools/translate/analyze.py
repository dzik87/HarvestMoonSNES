#!/usr/bin/env python3
"""Structural comparison of the four releases' dialogs (input of docs/translation-analysis.md).  Needs the extracted assets.

  varmap  [--write]   derive the text variable map JP <-> US/EU/DE from the WRAM addresses of the variable tables and the dialogs,
                      compare with (or write) defs/translation/var_map_jp_us.json
  refs                which dialog ids the code / AI scripts / data tables reference (per release)
  report  [--json F]  ids where the logic of JP and US/EU/DE differs (tokens, answers, numbers), placeholders, duplicates, unreferenced
                      ids, capacity; prints ids and counts only (never text)

Only ids, counts and token kinds are produced - no game text.
"""
import argparse
import collections
import json
import re
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import common as C                                         # noqa: E402

ROOT = C.ROOT
REG = ("us", "eu", "de", "jp")
# WRAM field of a text variable by the 16-bit address as stored in the release's table (strcNames, src/common/structures.asm); the
# addresses above $08D1 are those of the release (US layout +0 / DE +6 / JP -32).
FIELD_ADDR = {
    "us": {0x889: "cow", 0x8A1: "girl", 0x8B3: "season", 0x8BF: "weekday", 0x8D1: "ordinal", 0x8D5: "player", 0x8DD: "dog", 0x8E5: "horse", 0x8ED: "child1", 0x8F5: "child2"},
    "de": {0x889: "cow", 0x8A1: "girl", 0x8B3: "season", 0x8C3: "weekday", 0x8DB: "player", 0x8E3: "dog", 0x8EB: "horse", 0x8F3: "child1", 0x8FB: "child2"},
    "jp": {0x889: "cow", 0x8A1: "girl", 0x8B1: "season", 0x8B3: "weekday", 0x8B5: "player", 0x8BD: "dog", 0x8C5: "horse", 0x8CD: "child1", 0x8D5: "child2"},
}
FIELD_ADDR["eu"] = FIELD_ADDR["us"]
FIELD_DOC = {
    "player": "farmer name", "dog": "dog name", "horse": "horse name", "cow": "name of the cow being talked to / sold",
    "girl": "name of the girl the farmer loves most", "child1": "name of the first child", "child2": "name of the second child",
    "season": "season name (from a ROM string table, non-dialog text)", "weekday": "weekday name (from a ROM string table, non-dialog text)",
    "ordinal": "ordinal suffix of the day number (US/EU only; ROM string table)",
}
OPTIONAL_FIELDS = ["ordinal", "weekday"]


def read_vars(region):
    rows = []
    for line in (C.ASSETS_DIALOGS / region / "text_vars.csv").read_text(encoding="utf-8").splitlines():
        if not line or line.startswith("#") or line.startswith("idx"):
            continue
        i, a, s = line.split(",")
        rows.append((int(i[1:], 16) + 1, int(a.replace("+!RAM_SHIFT", "")[1:], 16) & 0xFFFF, int(s)))
    return rows


def field_tables():
    tables, sizes = {}, {}
    for r in REG:
        tables[r], sizes[r] = {}, {}
        for idx, addr, sz in read_vars(r):
            # a variable table row whose address moves with the RAM layout stores the US address; the release's own address is +shift
            shift = {"us": 0, "eu": 0, "de": 6, "jp": -32}[r]
            fa = FIELD_ADDR[r]
            f = fa.get(addr) or fa.get(addr + shift)
            if f is None:
                raise SystemExit("%s: variable %d at $%04X has no field" % (r, idx, addr))
            tables[r][idx] = f
            sizes[r][idx] = sz
    return tables, sizes


def derive_varmap(root=None):
    tables, sizes = field_tables()
    blocks = {r: C.asset_blocks(r, root) for r in REG}
    toks = {r: {i: C.split_tokens(w) for i, w in blocks[r].items()} for r in REG}
    jp_to = {r: collections.defaultdict(collections.Counter) for r in ("us", "eu", "de")}
    for r in ("us", "eu", "de"):
        for i in toks["jp"]:
            jv = [t for t in toks["jp"][i] if t[0] == "VAR"]
            byf = collections.defaultdict(list)
            for t in toks[r][i]:
                if t[0] == "VAR":
                    byf[tables[r][t[2]]].append(t[2])
            used = collections.Counter()
            for t in jv:
                f = tables["jp"][t[2]]
                k = used[f]; used[f] += 1
                if k < len(byf[f]):
                    jp_to[r][t[2]][byf[f][k]] += 1
    out = {}
    for r in ("us", "eu", "de"):
        m = {}
        for jidx in sorted(tables["jp"]):
            c = jp_to[r].get(jidx)
            if c:
                m[str(jidx)] = c.most_common(1)[0][0]
            else:
                m[str(jidx)] = None
        out[r] = m
    first = {}
    for idx in sorted(tables["us"]):
        first.setdefault(tables["us"][idx], idx)
    used_us = {t[2] for i in toks["us"] for t in toks["us"][i] if t[0] == "VAR"}
    used_eu = {t[2] for i in toks["eu"] for t in toks["eu"][i] if t[0] == "VAR"}
    doc = {
        "_doc": ("Text variables (<VAR chars index> in the dialogs) by meaning.  fields: the WRAM strings; tables: field of every variable index per release "
                 "(derived from the WRAM address of the entries of assets/dialogs/<region>/text_vars.csv); sizes: bytes of the entry; jp_to_us / jp_to_eu / jp_to_de: the "
                 "index the US / EU / DE dialog uses for the variable of the same meaning at the same place of the same dialog id (null = the release has no such use); "
                 "canonical_us: first index of a field, used by the symbolic <VAR field> token of the translation source.  The engine reads only the address of an "
                 "entry (the size byte is not used), so every index of a field is equivalent.  optional_fields: US-engine fields that are no part of the Japanese "
                 "text structure and may be added or omitted by a translation.  Generated by tools/translate/analyze.py varmap --write, then reviewed."),
        "fields": FIELD_DOC,
        "optional_fields": OPTIONAL_FIELDS,
        "canonical_us": first,
        "tables": {r: {str(k): v for k, v in sorted(t.items())} for r, t in tables.items()},
        "sizes": {r: {str(k): v for k, v in sorted(t.items())} for r, t in sizes.items()},
        "jp_to_us": out["us"], "jp_to_eu": out["eu"], "jp_to_de": out["de"],
        "us_indices_unused_by_us_dialogs": sorted(set(tables["us"]) - used_us),
        "eu_indices_unused_by_eu_dialogs": sorted(set(tables["eu"]) - used_eu),
        "jp_fields_without_us_equivalent": sorted(set(tables["jp"].values()) - set(tables["us"].values())),
        "us_fields_without_jp_equivalent": sorted(set(tables["us"].values()) - set(tables["jp"].values())),
    }
    return doc


def cmd_varmap(a):
    doc = derive_varmap()
    path = C.DEFS / "var_map_jp_us.json"
    text = json.dumps(doc, indent=1, sort_keys=False) + "\n"
    if a.write:
        path.write_text(text, encoding="utf-8", newline="\n")
        print("wrote", path.relative_to(ROOT))
        return 0
    if json.loads(path.read_text(encoding="utf-8")) != doc:
        print("var_map_jp_us.json differs from the derivation (run: analyze.py varmap --write and review the diff)")
        return 1
    print("var_map_jp_us.json matches the extracted assets")
    return 0


# ---------------------------------------------------------------- logic comparison
def literal_numbers(words):
    out, cur, i = [], "", 0
    while i < len(words):
        w = words[i]; i += 1
        if 0xB2 <= w <= 0xBB:
            cur += str(w - 0xB2); continue
        if cur:
            out.append(cur); cur = ""
        if w in (C.NUMV, C.TEXTV):
            i += 2
        elif w == C.OPTS:
            i += 1
    if cur:
        out.append(cur)
    return out


def ranges(ids):
    ids = sorted(ids); out = []
    for i in ids:
        if out and i == out[-1][1] + 1:
            out[-1][1] = i
        else:
            out.append([i, i])
    return ", ".join("%d" % a if a == b else "%d-%d" % (a, b) for a, b in out)


def compare(root=None):
    vm = C.var_map()                          # the reviewed map (defs/translation/var_map_jp_us.json), not the derivation
    tables = {r: {int(k): v for k, v in t.items()} for r, t in vm["tables"].items()}
    present = [r for r in REG if C.have_assets(r, root)]
    blocks = {r: C.asset_blocks(r, root) for r in present}
    toks = {r: {i: C.split_tokens(w) for i, w in blocks[r].items()} for r in present}

    def logic(r, i):
        v, n, o = [], [], 0
        for t in toks[r][i]:
            if t[0] == "VAR":
                v.append(tables[r][t[2]])
            elif t[0] == "NUM":
                n.append((t[2], t[1]))
            elif t[0] == "OPT":
                o = t[1]
        return sorted(v), n, o

    res = {"counts": {r: len(blocks[r]) for r in present}}
    for r in [x for x in ("us", "eu", "de") if x in present]:
        d = {"vars_fields": [], "num_digits": [], "num_indices": [], "opt": [], "literal_numbers": []}
        for i in sorted(blocks["jp"]):
            jv, jn, jo = logic("jp", i); rv, rn, ro = logic(r, i)
            if jv != rv:
                d["vars_fields"].append(i)
            if sorted(x[0] for x in jn) != sorted(x[0] for x in rn):
                d["num_indices"].append(i)
            elif sorted(jn) != sorted(rn):
                d["num_digits"].append(i)
            if jo != ro:
                d["opt"].append(i)
            if collections.Counter(literal_numbers(blocks["jp"][i])) != collections.Counter(literal_numbers(blocks[r][i])) and literal_numbers(blocks["jp"][i]):
                d["literal_numbers"].append(i)
        res[r] = d
    glyphs = {r: {i: sum(1 for t in toks[r][i] if t[0] == "G") for i in toks[r]} for r in present}
    res["short"] = {r: [i for i in glyphs[r] if glyphs[r][i] <= 2] for r in present}
    dup = {}
    for r in present:
        g = collections.defaultdict(list)
        for i, w in blocks[r].items():
            g[tuple(w)].append(i)
        dup[r] = sorted(x for v in g.values() if len(v) > 1 for x in v)
    res["duplicates"] = dup
    return res


def cmd_report(a):
    res = compare()
    for r in [x for x in ("us", "eu", "de") if x in res]:
        d = res[r]
        print("[%s vs jp]" % r)
        for k, v in d.items():
            print("  %-16s %3d  %s" % (k, len(v), ranges(v)))
    print("short (<=2 glyphs):", res["short"])
    print("identical-text duplicates:", res["duplicates"])
    if a.json:
        Path(a.json).parent.mkdir(parents=True, exist_ok=True)
        Path(a.json).write_text(json.dumps(res, indent=1), encoding="utf-8")
    return 0


# ---------------------------------------------------------------- which dialog ids does the code reference?
def _cond(expr):
    m = {"!REGION_JP": {"jp"}, "!REGION_EUDE": {"eu", "de"}, "!REGION_DE": {"de"}, "!REGION_EU": {"eu"}, "!REGION_US": {"us"}, "!REGION_EU|!REGION_DE": {"eu", "de"}}
    return m.get(expr.replace(" ", ""), set(REG))


def _scan_file(path):
    """[(line number, text, regions that assemble the line)] honouring the nesting of `if !REGION_*` blocks."""
    stack, out = [], []
    for n, line in enumerate(path.read_text(encoding="utf-8").splitlines(), 1):
        s = line.split(";")[0].strip()
        m = re.match(r"^(if|elseif)\s+(.*)$", s)
        if s == "endif":
            stack.pop(); continue
        if m:
            kw, expr = m.groups(); cs = _cond(expr)
            if kw == "if":
                parent = stack[-1]["cur"] if stack else set(REG)
                stack.append({"parent": parent, "taken": cs & parent, "cur": cs & parent})
            else:
                top = stack[-1]; cur = (cs - top["taken"]) & top["parent"]
                top["taken"] |= cur; top["cur"] = cur
            continue
        if s == "else":
            top = stack[-1]; top["cur"] = top["parent"] - top["taken"]; continue
        out.append((n, line, stack[-1]["cur"] if stack else set(REG)))
    return out


def scan_refs():
    """-> (refs [(file, line, regions, id, kind)], unresolved [(file, line)]).  kind: ai1C / ai1D / ai54 (AI script commands) or code (LDX #id before JSL fDialog_DialogHandler)."""
    refs, unresolved = [], []
    for f in sorted((ROOT / "src").rglob("*.asm")):
        lines = _scan_file(f)
        for k, (n, l, rs) in enumerate(lines):
            m = re.search(r"%AICMD0x(1C|1D|54)_ShowDialog\(\$([0-9A-Fa-f]{1,4})", l)
            if m and "macro" not in l:
                refs.append((str(f.relative_to(ROOT)), n, rs, int(m.group(2), 16), "ai" + m.group(1)))
            if "JSL.L fDialog_DialogHandler" in l:
                found = None
                for j in range(k - 1, max(k - 14, -1), -1):
                    mm = re.search(r"LDX\.W\s+#\$([0-9A-Fa-f]{1,4})", lines[j][1])
                    if mm and lines[j][2] & rs:
                        found = (int(mm.group(1), 16), lines[j][2] & rs, lines[j][0]); break
                    if re.search(r"\b(RTL|RTS|JMP|BRA)\b", lines[j][1]):
                        break
                if found:
                    refs.append((str(f.relative_to(ROOT)), found[2], found[1], found[0], "code"))
                else:
                    unresolved.append((str(f.relative_to(ROOT)), n))
    return refs, unresolved


def table_dialog_ids():
    """dialog ids stored in the extracted data tables (columns of type dialog16, assets/tables/data/*.csv)."""
    ids = set()
    for p in sorted((ROOT / "assets" / "tables" / "data").glob("*.csv")):
        cols = None
        for l in p.read_text(encoding="utf-8").splitlines():
            if l.startswith("@columns"):
                cols = [c.split(":") for c in l[len("@columns "):].split(",")]; continue
            if not l.strip() or l[0] in "#@" or cols is None:
                continue
            for c, v in zip(cols, l.split(",")):
                m = re.fullmatch(r"\$([0-9A-Fa-f]{4})", v.strip())
                if len(c) > 1 and c[1] == "dialog16" and m and int(m.group(1), 16) != 0xFFFF:
                    ids.add(int(m.group(1), 16))
    return ids


def cmd_refs(a):
    refs, unresolved = scan_refs()
    byreg = {r: set() for r in REG}
    for f, n, rs, i, k in refs:
        for r in rs:
            byreg[r].add(i)
    tab = table_dialog_ids()
    sel = set(range(0x0F, 0x1A))                    # aDialogPointerIndexBySelection (src/code/bank_83/dialog.asm)
    print("static references: %d (%s), unresolved computed call sites: %d" % (len(refs), dict(collections.Counter(r[4] for r in refs)), len(unresolved)))
    print("distinct ids per release (code + AI):", {r: len(byreg[r]) for r in REG})
    print("ids referenced by only some releases:", {r: ranges(byreg[r] ^ byreg["us"]) or "-" for r in REG})
    allids = set.union(*byreg.values()) | tab | sel
    print("ids in data tables: %d, selection ids: %d, union: %d, never referenced statically: %d" % (len(tab), len(sel), len(allids), 1176 - len(allids)))
    print("never referenced:", ranges(set(range(1176)) - allids))
    return 0


def main(argv=None):
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    sub = ap.add_subparsers(dest="cmd", required=True)
    s = sub.add_parser("varmap"); s.add_argument("--write", action="store_true"); s.set_defaults(f=cmd_varmap)
    s = sub.add_parser("refs"); s.set_defaults(f=cmd_refs)
    s = sub.add_parser("report"); s.add_argument("--json"); s.set_defaults(f=cmd_report)
    a = ap.parse_args(argv)
    if not C.have_assets("us") or not C.have_assets("jp"):
        sys.exit("The extracted dialogs are missing: python tools/extract.py --rom-dir <your dumps> (docs/extraction.md)")
    return a.f(a)


if __name__ == "__main__":
    sys.exit(main())
