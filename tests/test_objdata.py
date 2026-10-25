#!/usr/bin/env python3
"""Tests for tools/objects/objdata.py.  Run: python3 tests/test_objdata.py"""
import copy
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, 'tools', 'objects'))
import objdata as od  # noqa: E402

FAILS = []


def check(cond, msg):
    if not cond:
        FAILS.append(msg)
        print('FAIL: ' + msg)


def models():
    banks = od.load_banks()
    return banks, {b: od.build_model(a) for b, a in banks.items()}


def test_roundtrip(banks, ms):
    for b, a in banks.items():
        check(len(a.data) == 0x8000, 'bank %02X assembles to $8000 bytes' % b)
        check(ms[b].serialize() == bytes(a.data), 'bank %02X round trip is exact' % b)
    check(od.main(['check']) == 0, 'check command exits 0')


def test_full_coverage(banks, ms):
    for b, m in ms.items():
        check(not any(n.kind == 'Opaque' for n in m.nodes), 'bank %02X has no opaque bytes' % b)
        fill = [(n.addr, n.size()) for n in m.nodes if n.kind == 'Filler']
        check(fill == ([(0xA9C8, 1)] if b == 0x87 else []),
              'bank %02X: unexplained zero filler bytes: %s' % (b, fill))
        check(sum(n.size() for n in m.nodes) == 0x8000, 'bank %02X nodes tile the bank' % b)
        pos = od.BASE
        for n in m.nodes:
            check(n.addr == pos, 'bank %02X node at %#x is contiguous' % (b, n.addr))
            pos += n.size()
        tbl = next(n for n in m.nodes if n.kind == 'ListTable')
        check(all(r.node is not None for r in tbl.refs), 'bank %02X: all table pointers resolve' % b)
        for n in m.nodes:
            if n.kind == 'AnimList':
                check(all(r.node is not None for r, _ in n.steps),
                      'bank %02X list %#x: all frame pointers resolve' % (b, n.addr))


def test_engine_constants(banks, ms):
    t86 = next(n for n in ms[0x86].nodes if n.kind == 'ListTable')
    t87 = next(n for n in ms[0x87].nodes if n.kind == 'ListTable')
    check(len(t86.refs) == od.OBJ_SPLIT == 0x262, 'bank $86 has $262 object indices (engine CMP #$0262)')
    check(len(t87.refs) == 0x1EE, 'bank $87 has $1EE object indices')
    src = open(os.path.join(ROOT, 'src', 'code', 'bank_85', 'objects.asm'), encoding='utf-8').read()
    for pat in (r'CMP\.W #\$0262', r'SBC\.W #\$0262', r'ADC\.W #\$0003', r'ADC\.W #\$0005',
                r'ADC\.W #\$0024', r'CMP\.B #\$FE', r'CMP\.B #\$FF', r'LDA\.L aObjAnimListPtrs_86,X',
                r'LDA\.L aObjAnimListPtrs_87,X'):
        check(re.search(pat, src), 'objects.asm still contains ' + pat)
    check(banks[0x86].data[:0x80] == banks[0x87].data[:0x80], 'slot tables of both banks are identical')
    slot = ms[0x86].nodes[0].words
    check(slot == [((n & 7) * 2) + (n >> 3) * 0x20 for n in range(64)],
          'slot table = OAM tile number of 16x16 slot n in a 16-tile-wide sheet')


def test_invariants(banks, ms):
    for b, m in ms.items():
        lists = [n for n in m.nodes if n.kind == 'AnimList']
        frames = [n for n in m.nodes if n.kind == 'Frame']
        check(all(len(a.steps) >= 1 for a in lists), 'bank %02X: no empty lists' % b)
        check(all(t != 0 for a in lists for _, t in a.steps), 'bank %02X: no zero timers' % b)
        check(all(t != 0xFF for a in lists for _, t in a.steps[:-1]),
              'bank %02X: $FF timer only on the last step' % b)
        check(all(a.steps[0][1] != 0xFE for a in lists), 'bank %02X: no $FE timer on first step' % b)
        check(max(len(f.comps) for f in frames) <= 16, 'bank %02X: <= 16 components per frame' % b)
        check(all(0 < len(f.comps) for f in frames), 'bank %02X: no empty frames' % b)
        check(all(t < 0x1000 for f in frames for t, _, _, _ in f.comps),
              'bank %02X: tile ids < $1000 (tile cache $7F0F00 has $1000 entries)' % b)
        check(all(a & 0xC8 == 0 for f in frames for _, _, _, a in f.comps),
              'bank %02X: attribute bits 3, 6, 7 unused' % b)
        order = [a.addr for a in lists]
        check(order == sorted(order), 'bank %02X: lists laid out in index order' % b)
        tbl = next(n for n in m.nodes if n.kind == 'ListTable')
        check(tbl.addr + tbl.size() == lists[0].addr, 'bank %02X: first list follows the table' % b)
        check(lists[-1].addr + lists[-1].size() == frames[0].addr,
              'bank %02X: first frame follows the last list' % b)
        pad = m.nodes[-1]
        check(pad.kind == 'Padding' and pad.addr + pad.size() == 0x10000,
              'bank %02X: ends with zero padding to $FFFF' % b)
        for (i, n) in enumerate(m.nodes):
            if n.kind == 'Frame' and not n.referenced:
                check(not n.labels, 'unreferenced frame %#x carries no label' % n.addr)


def test_label_alignment(banks, ms):
    if any(l.startswith('aObjAnimList_') for b in banks.values() for l in b.labels):
        return  # migration-time check: the generic labels have been renamed already (docs/naming/H_objects_86_87.csv applied)
    expect = {0x86: (1177, 610), 0x87: (853, 494)}
    for b, m in ms.items():
        by = {l: n for n in m.nodes for l in n.labels}
        frame_labels = [l for l in banks[b].labels if l.startswith('DATA8_')]
        list_labels = [l for l in banks[b].labels if l.startswith(('PTR16_', 'sObjectData0x'))]
        check(len(frame_labels) == expect[b][0], 'bank %02X: %d DATA8 labels' % (b, expect[b][0]))
        check(len(list_labels) == expect[b][1], 'bank %02X: %d list labels' % (b, expect[b][1]))
        check(all(by[l].kind == 'Frame' for l in frame_labels), 'bank %02X: DATA8_ labels are frames' % b)
        check(all(by[l].kind == 'AnimList' for l in list_labels), 'bank %02X: list labels are lists' % b)
        referenced = sum(1 for n in m.nodes if n.kind == 'Frame' and n.referenced)
        check(referenced == expect[b][0], 'bank %02X: labelled frames == referenced frames' % b)
        # the only label off a node boundary is the known 1-byte-early padding label
        check([l for l, _ in m.stray_labels] == (['Padding_870000'] if b == 0x87 else []),
              'bank %02X: stray labels' % b)


def test_pointers_are_symbolic(banks, ms):
    """Inserting bytes before the frames must shift every frame pointer."""
    m = copy.copy(ms[0x86])
    m.nodes = list(ms[0x86].nodes)
    first_frame = next(i for i, n in enumerate(m.nodes) if n.kind == 'Frame')
    m.nodes.insert(first_frame, od.Padding(2))
    out = m.serialize()
    orig = banks[0x86].data
    check(len(out) == len(orig) + 2, 'relayout grows by the inserted bytes')
    lst = next(n for n in m.nodes if n.kind == 'AnimList')
    base = lst.addr - 0x8000
    check(int.from_bytes(out[base:base + 2], 'little') ==
          int.from_bytes(orig[base:base + 2], 'little') + 2,
          'frame pointers are recomputed from the layout')


def test_opaque_fallback(banks, ms):
    """Corrupt data in a gap must stay opaque and still round-trip exactly."""
    asm = copy.copy(banks[0x86])
    data = bytearray(asm.data)
    pad_start = ms[0x86].nodes[-1].addr
    data[pad_start - 0x8000:pad_start - 0x8000 + 3] = b'\xFF\xFE\xFD'
    asm.data = data
    m = od.build_model(asm)
    check(any(n.kind == 'Opaque' for n in m.nodes), 'garbage after the frames becomes Opaque')
    check(m.serialize() == bytes(data), 'model with opaque bytes still round-trips')


def test_names(banks, ms):
    if any(l.startswith('aObjAnimList_') for b in banks.values() for l in b.labels):
        return  # migration-time check: the generic labels have been renamed already (docs/naming/H_objects_86_87.csv applied)
    rows = od.propose_names()
    check(not od.validate_names(rows), 'proposed names validate: %s' % od.validate_names(rows)[:3])
    new = [r[1] for r in rows]
    check(len(new) == len(set(new)), 'new names unique')
    check(all(od.NAME_RE.match(n) for n in new), 'new names are identifiers')
    check(not any(re.search(r'_L\d+$', n) for n in new), 'no name ends in _L###')
    labelled = sum(len(n.labels) for m in ms.values() for n in m.nodes) + 1  # + stray padding
    check(len(rows) == labelled, 'one row per labelled node (%d rows, %d labels)' % (len(rows), labelled))
    check(not any(r[3] == '' for r in rows), 'every row has a reason')
    csv_path = os.path.join(ROOT, 'docs', 'naming', 'H_objects_86_87.csv')
    if os.path.exists(csv_path):
        import csv
        with open(csv_path, newline='', encoding='utf-8') as fh:
            got = [tuple(r) for r in list(csv.reader(fh))[1:]]
        check(got == [tuple(r) for r in rows], 'docs/naming/H_objects_86_87.csv is up to date')


def main():
    banks, ms = models()
    for name, fn in sorted(globals().items()):
        if name.startswith('test_') and callable(fn):
            before = len(FAILS)
            fn(banks, ms)
            print('%-32s %s' % (name, 'ok' if len(FAILS) == before else 'FAILED'))
    if FAILS:
        print('%d check(s) failed' % len(FAILS))
        return 1
    print('all tests passed')
    return 0


if __name__ == '__main__':
    sys.exit(main())
