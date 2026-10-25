#!/usr/bin/env python3
"""One-off migration: raw addresses in AI scripts -> labels.

For every %AICMD...(...) call, pointer-type arguments (parameters p* and
0x2F/0x49) written as literals $B3xxxx-$B5xxxx are replaced by labels.
Labels are created at the start of the target line (or replace an automatic
DiztinGUIsh label, e.g. DATA8_B48020). New label name:
    <script-label>_L<NNN>      (numbering ascending by address within the script)

The build output stays bit-identical (label address == earlier literal).
Only the region directory passed on the command line is modified.

Usage: python tools/migration/ai_labels.py src/ai/us [--dry]
"""
import re, sys, glob, collections
from pathlib import Path

AUTO = re.compile(r'^[A-Z]+\d*_[0-9A-F]{6}$')
LIT = re.compile(r'^\$(B[3-5][0-9A-F]{4})$')
CALL = re.compile(r'^(\s*)%(AICMD\w+)\((.*)\)(\s*;([0-9A-F]{6})\s*)$')
LABEL = re.compile(r'^([A-Za-z_]\w*):')
ADDR_PIPE = re.compile(r';([0-9A-F]{6})\|')
ADDR_END = re.compile(r';([0-9A-F]{6})\s*$')


def split_args(s):
    return [a.strip() for a in re.split(r',(?![^()]*\))', s)] if s.strip() else []


def main():
    d = Path(sys.argv[1]); dry = '--dry' in sys.argv
    cmd = Path(d).parent / 'commands.asm'
    defs = {m.group(1): [a.strip() for a in m.group(2).split(',') if a.strip()]
            for m in re.finditer(r'macro (AICMD\w+)\(([^)]*)\)', cmd.read_text())}
    files = sorted(d.glob('bank_B*.asm'))
    data = {f: f.read_text().split('\n') for f in files}

    # 1. line addresses and label definitions
    line_addr = {}   # (file, idx) -> addr
    labels = []      # (addr, name, file, idx)
    for f, lines in data.items():
        cur = None
        for i in range(len(lines) - 1, -1, -1):
            m = ADDR_PIPE.search(lines[i]) or ADDR_END.search(lines[i])
            if m: cur = m.group(1)
            line_addr[(f, i)] = cur
        for i, l in enumerate(lines):
            m = LABEL.match(l)
            if m: labels.append((line_addr[(f, i)], m.group(1), f, i))
    first_at = {}
    for a, n, f, i in labels: first_at.setdefault(a, (n, f, i))

    # 2. targets
    def is_ptr(name, p):
        return p.startswith('p') or (name in ('AICMD0x2F', 'AICMD0x49') and p == 'nUnknown1')
    targets = set()
    for f, lines in data.items():
        for l in lines:
            m = CALL.match(l)
            if not m: continue
            for p, a in zip(defs[m.group(2)], split_args(m.group(3))):
                t = LIT.match(a)
                if t and is_ptr(m.group(2), p): targets.add(t.group(1))
    # 3. owner = last non-automatic label <= address
    named = sorted((a, n) for a, n, f, i in labels if not AUTO.match(n) and a)
    import bisect
    keys = [a for a, _ in named]
    counters = collections.Counter(); newname = {}
    for t in sorted(targets):
        if t in first_at and not AUTO.match(first_at[t][0]):
            newname[t] = first_at[t][0]; continue
        k = bisect.bisect_right(keys, t) - 1
        owner = named[k][1]
        counters[owner] += 1
        newname[t] = f'{owner}_L{counters[owner]:03d}'
    rename_auto = {first_at[t][0]: newname[t] for t in targets
                   if t in first_at and AUTO.match(first_at[t][0])}
    to_insert = collections.defaultdict(list)  # (file, idx) -> [names]
    # index: address -> first line that "starts" it (;ADDR comment on that line)
    start_line = {}
    for f, lines in data.items():
        for i, l in enumerate(lines):
            m = ADDR_PIPE.search(l) or ADDR_END.search(l)
            if m: start_line.setdefault(m.group(1), (f, i))
    for t in targets:
        if t in first_at: continue
        f, i = start_line[t]
        to_insert[(f, i)].append(newname[t])

    # 4. apply
    changed = 0
    out = {}
    for f, lines in data.items():
        res = []
        for i, l in enumerate(lines):
            for n in to_insert.get((f, i), []): res.append(f'{n}:')
            m = CALL.match(l)
            if m:
                name = m.group(2); args = split_args(m.group(3)); new = []
                for p, a in zip(defs[name], args):
                    t = LIT.match(a)
                    if t and is_ptr(name, p): a = newname[t.group(1)]; changed += 1
                    new.append(a)
                l = f'{m.group(1)}%{name}({", ".join(new)}){m.group(4)}'
            else:
                mm = LABEL.match(l)
                if mm and mm.group(1) in rename_auto:
                    l = rename_auto[mm.group(1)] + ':' + l[mm.end():]
                else:
                    for old, nn in rename_auto.items():
                        if old in l: l = re.sub(r'\b%s\b' % re.escape(old), nn, l)
            res.append(l)
        out[f] = '\n'.join(res)
    print(f'targets: {len(targets)}, arguments replaced: {changed}, '
          f'new labels: {sum(len(v) for v in to_insert.values())}, renamed auto: {len(rename_auto)}')
    # references to renamed labels outside the AI directory
    if not dry:
        for f, t in out.items(): f.write_text(t)
        for p in Path('src').rglob('*.asm'):
            if d in p.parents or Path('src/ai') in p.parents: continue
            s = p.read_text(); o = s
            for old, nn in rename_auto.items():
                s = re.sub(r'\b%s\b' % re.escape(old), nn, s)
            if s != o: p.write_text(s); print('updated references in', p)


if __name__ == '__main__':
    main()
