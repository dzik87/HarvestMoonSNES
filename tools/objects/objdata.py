#!/usr/bin/env python3
"""Structural model of the object/sprite animation data in banks $86 and $87.

The data lives in ``src/data/objects/bank_86.asm`` and ``bank_87.asm`` as
``db``/``dw`` dumps.  This tool

  * assembles those dumps back into the exact bank bytes (``parse_asm``),
  * builds a structural model of each bank (``build_model``),
  * re-serialises the model with a fresh layout pass and compares it with the
    original bytes (``check``),
  * prints statistics (``analyze``), and
  * proposes systematic names for the generic labels (``names``).

Format summary (see docs/formats/object-data.md for evidence):

  bank:8000   64 x u16   OAM tile number for each of the 64 sprite tile slots
  bank:8080   N  x u16   animation list pointer per object index (N = $262 in
                         bank $86, $1EE in bank $87; ptr is a 16-bit offset
                         inside the same bank)
  lists       animation list = { u16 frame_ptr, u8 timer }* , u16 $0000
  frames      u8 count, count x { u16 tile_id, s8 x, s8 y, u8 attr }
  tail        $00 padding up to $FFFF

Usage:
  python3 tools/objects/objdata.py analyze
  python3 tools/objects/objdata.py check
  python3 tools/objects/objdata.py names [--out docs/naming/H_objects_86_87.csv]
"""
import argparse
import collections
import csv
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
DATA_DIR = os.path.join(ROOT, 'src', 'data', 'objects')
SRC_DIR = os.path.join(ROOT, 'src')
BANKS = {0x86: 'bank_86.asm', 0x87: 'bank_87.asm'}
BANK_SIZE = 0x8000
BASE = 0x8000
LIST_TABLE_OFF = 0x8080          # pointer table, one u16 per object index
SLOT_TABLE_OFF = 0x8000          # 64 x u16 slot -> OAM tile number
SLOT_COUNT = 0x40
OBJ_SPLIT = 0x262                # fObject_*: spriteTableIdx >= $262 -> bank $87
NAME_RE = re.compile(r'^[A-Za-z_][A-Za-z0-9_]*$')


# --------------------------------------------------------------------------
# Assembly source -> bytes
# --------------------------------------------------------------------------
class AsmBank:
    """Result of assembling one bank source: bytes, labels and pointer fixups."""

    def __init__(self, bank, org):
        self.bank = bank
        self.org = org                   # full 24-bit ORG
        self.data = bytearray()
        self.labels = collections.OrderedDict()   # name -> 16-bit offset
        self.symrefs = {}                # offset of a dw -> label name used there


_LABEL_RE = re.compile(r'^([A-Za-z_][A-Za-z0-9_]*):')
_INSN_RE = re.compile(r'^\s+(db|dw)\s+(.*)$', re.I)
_ORG_RE = re.compile(r'^\s*ORG\s+\$([0-9A-Fa-f]+)', re.I)
_SYM_RE = re.compile(r'([A-Za-z_][A-Za-z0-9_]*)(?:\s*([+-])\s*(\$[0-9A-Fa-f]+|\d+))?')


def _num(tok):
    return int(tok[1:], 16) if tok.startswith('$') else int(tok)


def _parse_value(tok, labels, size, lineno, resolve):
    tok = tok.strip()
    if re.fullmatch(r'\$[0-9A-Fa-f]+|\d+', tok):
        v = _num(tok)
        if v >= 1 << (8 * size):
            raise ValueError('line %d: value %s too large' % (lineno, tok))
        return v, None
    m = _SYM_RE.fullmatch(tok)
    if m and size == 2:
        name = m.group(1)
        off = 0
        if m.group(2):
            off = _num(m.group(3)) * (1 if m.group(2) == '+' else -1)
        if not resolve:
            return 0, name
        if name not in labels:
            raise ValueError('line %d: unknown label %s' % (lineno, name))
        return (labels[name] + off) & 0xFFFF, name
    raise ValueError('line %d: cannot parse operand %r' % (lineno, tok))


def parse_asm(path, bank):
    """Assemble a bank source file made only of ORG, labels, db and dw."""
    with open(path, encoding='utf-8') as fh:
        lines = fh.read().splitlines()
    out = None
    for resolve in (False, True):          # pass 1: labels, pass 2: values
        pos = 0
        org = None
        if resolve:
            out.data = bytearray()
            out.symrefs = {}
        for n, raw in enumerate(lines, 1):
            line = raw.split(';', 1)[0].rstrip()
            if not line.strip():
                continue
            m = _ORG_RE.match(line)
            if m:
                org = int(m.group(1), 16)
                if (org >> 16) != bank:
                    raise ValueError('%s: ORG bank %02X != %02X' % (path, org >> 16, bank))
                if out is None:
                    out = AsmBank(bank, org)
                continue
            m = _LABEL_RE.match(line)
            if m:
                name = m.group(1)
                if not resolve:
                    if name in out.labels:
                        raise ValueError('line %d: duplicate label %s' % (n, name))
                    out.labels[name] = (org & 0xFFFF) + pos
                line = line[m.end():]
                if not line.strip():
                    continue
            m = _INSN_RE.match(line)
            if not m:
                raise ValueError('%s:%d: unsupported line %r' % (path, n, raw))
            size = 1 if m.group(1).lower() == 'db' else 2
            for tok in m.group(2).split(','):
                v, sym = _parse_value(tok, out.labels, size, n, resolve)
                if resolve:
                    if sym is not None:
                        out.symrefs[pos] = sym
                    out.data += v.to_bytes(size, 'little')
                pos += size
    return out


def load_banks():
    return {b: parse_asm(os.path.join(DATA_DIR, f), b) for b, f in BANKS.items()}


# --------------------------------------------------------------------------
# Model
# --------------------------------------------------------------------------
class Node:
    kind = '?'

    def __init__(self):
        self.addr = None         # original offset (16-bit, within bank)
        self.labels = []         # asm labels that sit exactly at addr

    def size(self):
        raise NotImplementedError

    def emit(self, out, addr_of):
        raise NotImplementedError


class Ref:
    """A 16-bit pointer field: either a node reference or an unresolved value."""

    def __init__(self, node=None, raw=None):
        self.node = node
        self.raw = raw

    def value(self, addr_of):
        return addr_of[id(self.node)] if self.node is not None else self.raw


class SlotTable(Node):
    kind = 'SlotTable'

    def __init__(self, words):
        super().__init__()
        self.words = words

    def size(self):
        return 2 * len(self.words)

    def emit(self, out, addr_of):
        for w in self.words:
            out += w.to_bytes(2, 'little')


class ListTable(Node):
    kind = 'ListTable'

    def __init__(self, refs):
        super().__init__()
        self.refs = refs         # one Ref per object index

    def size(self):
        return 2 * len(self.refs)

    def emit(self, out, addr_of):
        for r in self.refs:
            out += r.value(addr_of).to_bytes(2, 'little')


class AnimList(Node):
    kind = 'AnimList'

    def __init__(self, steps):
        super().__init__()
        self.steps = steps       # list of (Ref frame, timer)
        self.indices = []        # table indices that point here (filled later)

    def size(self):
        return 3 * len(self.steps) + 2

    def emit(self, out, addr_of):
        for ref, timer in self.steps:
            out += ref.value(addr_of).to_bytes(2, 'little')
            out.append(timer)
        out += b'\x00\x00'


class Frame(Node):
    kind = 'Frame'

    def __init__(self, comps, referenced=True):
        super().__init__()
        self.comps = comps       # list of (tile, x, y, attr), x/y stored unsigned
        self.referenced = referenced

    def size(self):
        return 1 + 5 * len(self.comps)

    def emit(self, out, addr_of):
        out.append(len(self.comps))
        for tile, x, y, attr in self.comps:
            out += tile.to_bytes(2, 'little')
            out += bytes((x, y, attr))


class Padding(Node):
    kind = 'Padding'

    def __init__(self, length, fill=0):
        super().__init__()
        self.length = length
        self.fill = fill

    def size(self):
        return self.length

    def emit(self, out, addr_of):
        out += bytes([self.fill]) * self.length


class Opaque(Node):
    kind = 'Opaque'

    def __init__(self, data):
        super().__init__()
        self.data = bytes(data)

    def size(self):
        return len(self.data)

    def emit(self, out, addr_of):
        out += self.data


class Model:
    def __init__(self, bank, nodes, notes):
        self.bank = bank
        self.nodes = nodes       # in address order, contiguous from BASE
        self.notes = notes       # human readable parse remarks
        self.stray_labels = []

    def serialize(self):
        """Lay out the nodes from BASE and emit bytes (pointers recomputed)."""
        addr_of = {}
        pos = BASE
        for nd in self.nodes:
            addr_of[id(nd)] = pos
            pos += nd.size()
        out = bytearray()
        for nd in self.nodes:
            nd.emit(out, addr_of)
        return bytes(out)


def _u16(d, o):
    return d[o - BASE] | (d[o - BASE + 1] << 8)


def _read_frame(d, p):
    cnt = d[p - BASE]
    return [(_u16(d, p + 1 + 5 * k), d[p + 3 + 5 * k - BASE],
             d[p + 4 + 5 * k - BASE], d[p + 5 + 5 * k - BASE]) for k in range(cnt)]


def build_model(asm):
    """Reference-driven structural parse of one bank (never guesses silently)."""
    d = bytes(asm.data)
    end = BASE + len(d)
    notes = []
    if len(d) != BANK_SIZE:
        notes.append('bank size %#x != %#x' % (len(d), BANK_SIZE))
    claimed = {}                 # offset -> owning node, for overlap detection
    nodes = []

    def claim(nd, start):
        nd.addr = start
        span = range(start, start + nd.size())
        if any(o in claimed for o in span):
            return False
        for o in span:
            claimed[o] = nd
        nodes.append(nd)
        return True

    # 1. slot -> tile table
    claim(SlotTable([_u16(d, SLOT_TABLE_OFF + 2 * i) for i in range(SLOT_COUNT)]),
          SLOT_TABLE_OFF)

    # 2. object index -> list pointer table (ends where the lowest target begins)
    raws = []
    minptr = 1 << 16
    o = LIST_TABLE_OFF
    while o < minptr and o + 2 <= end:
        v = _u16(d, o)
        raws.append(v)
        minptr = min(minptr, v)
        o += 2
    table = ListTable([Ref(raw=v) for v in raws])
    claim(table, LIST_TABLE_OFF)
    table_end = LIST_TABLE_OFF + table.size()
    if minptr != table_end:
        notes.append('list table end %#x != lowest list pointer %#x' % (table_end, minptr))

    # 3. animation lists (every distinct table target)
    lists = {}
    for i, v in enumerate(raws):
        if v in lists:
            continue
        pos = v
        steps = []
        ok = True
        while True:
            if pos + 2 > end:
                ok = False
                break
            fp = _u16(d, pos)
            if fp == 0:
                break
            if pos + 3 > end:
                ok = False
                break
            steps.append((Ref(raw=fp), d[pos + 2 - BASE]))
            pos += 3
        if not ok or not steps:
            notes.append('table[%d] -> %#x: not a valid animation list' % (i, v))
            continue
        al = AnimList(steps)
        if claim(al, v):
            lists[v] = al
        else:
            notes.append('animation list at %#x overlaps another structure' % v)
    for i, v in enumerate(raws):
        if v in lists:
            table.refs[i].node = lists[v]
            table.refs[i].raw = None
            lists[v].indices.append(i)

    # 4. frames (every distinct frame pointer used by a list)
    frames = {}
    for fp in sorted({r.raw for al in lists.values() for r, _ in al.steps}):
        if fp < table_end or fp >= end:
            notes.append('frame pointer %#x outside data area' % fp)
            continue
        cnt = d[fp - BASE]
        if cnt == 0 or fp + 1 + 5 * cnt > end:
            notes.append('frame at %#x has implausible count %d' % (fp, cnt))
            continue
        fr = Frame(_read_frame(d, fp))
        if claim(fr, fp):
            frames[fp] = fr
        else:
            notes.append('frame at %#x overlaps another structure' % fp)
    for al in lists.values():
        new = []
        for r, t in al.steps:
            if r.raw in frames:
                r = Ref(frames[r.raw])
            new.append((r, t))
        al.steps = new

    # 5. gaps: zero run -> Padding, exact frame chains -> unreferenced frames
    #    (structural inference), anything else -> Opaque.
    pos = table_end
    gaps = []
    while pos < end:
        if pos in claimed:
            pos += claimed[pos].size() if claimed[pos].addr == pos else 1
            continue
        s = pos
        while pos < end and pos not in claimed:
            pos += 1
        gaps.append((s, pos))
    for s, e in gaps:
        chunk = d[s - BASE:e - BASE]
        if not any(chunk):
            claim(Padding(e - s), s)
            continue
        p = s
        new = []
        while p < e:
            cnt = d[p - BASE]
            if cnt == 0 or p + 1 + 5 * cnt > e:
                break
            new.append((p, Frame(_read_frame(d, p), referenced=False)))
            p += 1 + 5 * cnt
        if p == e and new:
            for a, fr in new:
                claim(fr, a)
            notes.append('%#x..%#x: %d unreferenced frame(s) (structural inference)'
                         % (s, e, len(new)))
        else:
            claim(Opaque(chunk), s)
            notes.append('%#x..%#x: %d opaque byte(s)' % (s, e, e - s))

    nodes.sort(key=lambda x: x.addr)
    m = Model(asm.bank, nodes, notes)
    by_addr = {nd.addr: nd for nd in nodes}
    for name, off in asm.labels.items():
        nd = by_addr.get(off)
        if nd is None:
            m.stray_labels.append((name, off))
        else:
            nd.labels.append(name)
    if m.stray_labels:
        notes.append('%d asm label(s) not on a model node boundary' % len(m.stray_labels))
    return m


# --------------------------------------------------------------------------
# Commands
# --------------------------------------------------------------------------
def cmd_check(_args):
    bad = 0
    for bank, asm in load_banks().items():
        model = build_model(asm)
        out = model.serialize()
        orig = bytes(asm.data)
        if out == orig:
            print('bank $%02X: OK, %d bytes reproduced exactly (%d nodes)'
                  % (bank, len(orig), len(model.nodes)))
        else:
            bad += 1
            first = next((i for i in range(min(len(out), len(orig))) if out[i] != orig[i]),
                         min(len(out), len(orig)))
            print('bank $%02X: MISMATCH at offset %#x (model %d bytes, source %d bytes)'
                  % (bank, BASE + first, len(out), len(orig)))
    return 1 if bad else 0


def cmd_analyze(_args):
    banks = load_banks()
    for bank, asm in banks.items():
        m = build_model(asm)
        total = len(asm.data)
        by_kind = collections.Counter()
        for nd in m.nodes:
            by_kind['Frame(unreferenced)' if nd.kind == 'Frame' and not nd.referenced
                    else nd.kind] += nd.size()
        slot = m.nodes[0]
        tbl = next(nd for nd in m.nodes if nd.kind == 'ListTable')
        lists = [nd for nd in m.nodes if nd.kind == 'AnimList']
        frames = [nd for nd in m.nodes if nd.kind == 'Frame']
        unref = [f for f in frames if not f.referenced]
        users = collections.Counter()
        for a in lists:
            for r, _ in a.steps:
                if r.node is not None:
                    users[id(r.node)] += 1
        steps = sum(len(a.steps) for a in lists)
        raw_ptr = sum(1 for a in lists for r, _ in a.steps if r.node is None) \
            + sum(1 for r in tbl.refs if r.node is None)
        pad, opaque = by_kind['Padding'], by_kind['Opaque']
        modelled = total - opaque
        tiles = [t for f in frames for (t, _, _, _) in f.comps]
        timers = collections.Counter(t for a in lists for _, t in a.steps)
        attrs = sorted({a for f in frames for (_, _, _, a) in f.comps})
        print('=== bank $%02X (%d bytes) ===' % (bank, total))
        print('  slot->OAM tile table      : %d words (%d bytes)' % (len(slot.words), slot.size()))
        print('  list pointer table        : %d object indices (%d bytes), %d distinct lists, '
              '%d shared' % (len(tbl.refs), tbl.size(), len(lists),
                             sum(1 for a in lists if len(a.indices) > 1)))
        print('  animation lists           : %d (%d steps, %d bytes)'
              % (len(lists), steps, by_kind['AnimList']))
        print('  frames                    : %d (%d referenced, %d unreferenced); '
              '%d used by more than one step'
              % (len(frames), len(frames) - len(unref), len(unref),
                 sum(1 for v in users.values() if v > 1)))
        print('  components                : %d (%d bytes of frames)'
              % (sum(len(f.comps) for f in frames),
                 by_kind['Frame'] + by_kind['Frame(unreferenced)']))
        print('  unresolved pointers       : %d' % raw_ptr)
        print('  zero padding              : %d bytes' % pad)
        print('  opaque (not modelled)     : %d bytes' % opaque)
        print('  modelled                  : %d / %d bytes = %.3f%% (without padding: %d / %d = %.3f%%)'
              % (modelled, total, 100.0 * modelled / total, modelled - pad, total - pad,
                 100.0 * (modelled - pad) / (total - pad)))
        print('  max components per frame  : %d; tile ids %#x..%#x'
              % (max(len(f.comps) for f in frames), min(tiles), max(tiles)))
        print('  attribute bytes seen      : %s' % ' '.join('%02X' % a for a in attrs))
        print('  timers                    : %d distinct; $00 x%d, $FE x%d, $FF x%d; '
              'finite max %d'
              % (len(timers), timers.get(0, 0), timers.get(0xFE, 0), timers.get(0xFF, 0),
                 max([t for t in timers if t < 0xFE] or [0])))
        for f in unref:
            print('  unreferenced frame        : %#06x, %d component(s), labels %s'
                  % (f.addr, len(f.comps), f.labels))
        if m.stray_labels:
            print('  labels off node boundary  : %s' % m.stray_labels[:10])
        for note in m.notes:
            print('  note: ' + note)
    a, b = banks[0x86].data[:0x80], banks[0x87].data[:0x80]
    print('slot table $868000 identical to $878000: %s' % (a == b))
    return 0


# ---- naming ---------------------------------------------------------------
def collect_src_words():
    words = set()
    for dp, _dn, fns in os.walk(SRC_DIR):
        for fn in fns:
            if fn.endswith(('.asm', '.inc', '.s')):
                with open(os.path.join(dp, fn), encoding='utf-8', errors='replace') as fh:
                    for line in fh:
                        words.update(re.findall(r'[A-Za-z_][A-Za-z0-9_]*', line.split(';', 1)[0]))
    return words


def propose_names():
    """Return rows (old, new, confidence, reason)."""
    rows = []
    for bank, asm in load_banks().items():
        m = build_model(asm)
        obj_base = 0 if bank == 0x86 else OBJ_SPLIT
        users = collections.Counter()
        for nd in m.nodes:
            if nd.kind == 'AnimList':
                for r, _ in nd.steps:
                    if r.node is not None:
                        users[id(r.node)] += 1
        for nd in m.nodes:
            if not nd.labels:
                continue
            old = nd.labels[0]
            hx = '%02X%04X' % (bank, nd.addr)
            if nd.kind == 'SlotTable':
                new = 'aObjSlotOamTile_' + hx
                if bank == 0x86:
                    conf = 'high'
                    why = ('64 u16 values indexed by tile slot: OAM tile number of the slot '
                           '(also source-row multiplier for the slot DMA); read by '
                           'fObject_RenderAll and fObject_ProcessTileLoadQueue')
                else:
                    conf = 'medium'
                    why = ('Byte-identical copy of the bank $86 slot table; no code reads it '
                           '(engine always uses $868000)')
            elif nd.kind == 'ListTable':
                new = 'aObjAnimListPtrs_%02X' % bank
                conf = 'medium'
                why = ('%d u16 pointers (one per object index%s) to animation lists in this bank'
                       % (len(nd.refs), '' if bank == 0x86 else ' minus $262'))
            elif nd.kind == 'AnimList':
                if nd.indices:
                    idx = obj_base + nd.indices[0]
                    new = 'aObjAnimList_%04X' % idx
                    conf = 'high'
                    why = ('Animation list (3-byte steps: frame ptr + timer, $0000 = loop) '
                           'for object index $%04X' % idx)
                    if len(nd.indices) > 1:
                        why += '; shared by %d indices' % len(nd.indices)
                else:
                    new = 'aObjAnimListUnref_' + hx
                    conf = 'low'
                    why = 'Animation list not reachable from the pointer table'
            elif nd.kind == 'Frame':
                if nd.referenced:
                    new = 'aObjFrame_' + hx
                    conf = 'high'
                    why = ('Animation frame, %d component(s) of 5 bytes; pointed to by %d '
                           'animation step(s)' % (len(nd.comps), users[id(nd)]))
                else:
                    new = 'aObjFrameUnref_' + hx
                    conf = 'medium'
                    why = ('Frame-shaped data (%d component(s)) with no pointer to it; '
                           'structural inference only' % len(nd.comps))
            elif nd.kind == 'Padding':
                new = 'aObjPadding_' + hx
                conf = 'high'
                why = 'Zero fill up to the end of the bank'
            else:
                new = 'aObjUnknown_' + hx
                conf = 'low'
                why = 'Bytes not covered by the structural model'
            if new != old:                  # idempotent after the renames are applied
                rows.append((old, new, conf, why))
        # A label that sits one byte before a Padding node (bank $87: the last
        # byte of the final frame was emitted under the padding label).
        by_addr = {nd.addr: nd for nd in m.nodes}
        for name, off in m.stray_labels:
            nd = by_addr.get(off + 1)
            if nd is not None and nd.kind == 'Padding':
                rows.append((name, 'aObjPadding_%02X%04X' % (bank, nd.addr), 'low',
                             'Zero fill to the end of the bank; the current label is 1 byte '
                             'early ($%02X%04X is the attribute byte of the preceding frame) - '
                             'move the label to $%02X%04X when renaming'
                             % (bank, off, bank, nd.addr)))
            else:
                print('warning: label %s at $%02X%04X is not on a node boundary; no name proposed'
                      % (name, bank, off), file=sys.stderr)
    return rows


def validate_names(rows):
    errors = []
    olds = {r[0] for r in rows}
    seen = collections.Counter(r[1] for r in rows)
    words = collect_src_words()
    for old, new, _c, _w in rows:
        if not NAME_RE.match(new):
            errors.append('invalid identifier: ' + new)
        if re.search(r'_L\d+$', new):
            errors.append('ends with _L###: ' + new)
        if seen[new] > 1:
            errors.append('duplicate new name: ' + new)
        if new in words and new not in olds:
            errors.append('collides with existing identifier: ' + new)
        if new == old:
            errors.append('no-op rename: ' + old)
    return errors


def cmd_names(args):
    rows = propose_names()
    errs = validate_names(rows)
    if errs:
        for e in errs[:20]:
            print('ERROR: ' + e, file=sys.stderr)
        return 1
    out = args.out or os.path.join(ROOT, 'docs', 'naming', 'H_objects_86_87.csv')
    os.makedirs(os.path.dirname(out), exist_ok=True)
    with open(out, 'w', newline='', encoding='utf-8') as fh:
        w = csv.writer(fh, lineterminator='\n')
        w.writerow(['old', 'new', 'confidence', 'reason'])
        w.writerows(rows)
    conf = collections.Counter(r[2] for r in rows)
    print('wrote %d rows to %s (%s)' % (len(rows), os.path.relpath(out, ROOT),
                                        ', '.join('%s=%d' % kv for kv in sorted(conf.items()))))
    return 0


def main(argv=None):
    ap = argparse.ArgumentParser(description=__doc__.split('\n')[0])
    sub = ap.add_subparsers(dest='cmd', required=True)
    sub.add_parser('analyze')
    sub.add_parser('check')
    p = sub.add_parser('names')
    p.add_argument('--out')
    args = ap.parse_args(argv)
    return {'analyze': cmd_analyze, 'check': cmd_check, 'names': cmd_names}[args.cmd](args)


if __name__ == '__main__':
    sys.exit(main())
