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


def test_labels(banks, ms):
    """The generated labels keep the names the code and the docs refer to."""
    for b, a in banks.items():
        n = 0x262 if b == 0x86 else 0x1EE
        base = 0 if b == 0x86 else 0x262
        check('aObjSlotOamTile_%02X8000' % b in a.labels, 'bank %02X slot table label' % b)
        check(a.labels['aObjAnimListPtrs_%02X' % b] == 0x8080, 'bank %02X list pointer table at $8080' % b)
        check(all('aObjAnimList_%04X' % (base + i) in a.labels for i in range(n)),
              'bank %02X has a label for each of its %d lists' % (b, n))
        check(sum(1 for l in a.labels if l.startswith('aObjFrame_')) == sum(1 for nd in ms[b].nodes if nd.kind == 'Frame'),
              'bank %02X: one label per frame' % b)
    check(banks[0x86].labels['aObjFrame_86A4AE'] == 0xA4AE and banks[0x86].labels['aObjAnimList_0000'] == 0x8544,
          'known label addresses ($86A4AE, $868544)')


def test_sources(banks, ms):
    """Source files <-> generated assembly <-> bytes."""
    import tempfile, shutil
    for b in od.BANKS:
        src = od.read_sources(b)
        text = od.emit_asm(src)
        check('ORG $%02X8000' % b in text and 'aObjAnimListPtrs_%02X:' % b in text, 'bank %02X asm has ORG and table' % b)
        # frames.txt round trip
        txt = ''.join(od.format_frame_line(e[1], e[2]) + '\n' if e[0] == 'frame' else 'raw ' + e[1].hex() + '\n'
                      for e in src.entries)
        check(od.parse_frames_text(txt) == src.entries, 'bank %02X frames.txt text round trip' % b)
    # extract -> write -> read gives the same bytes
    tmp = tempfile.mkdtemp()
    try:
        for b, a in banks.items():
            src = od.model_to_source(od.build_model(a))
            od.write_sources(src, tmp)
            again = od.source_to_asmbank(od.read_sources(b, tmp))
            check(again.data == a.data, 'bank %02X: write_sources/read_sources round trip' % b)
        # edit propagation: a longer frame shifts the following frames and keeps every pointer valid
        src = od.read_sources(0x86)
        i = next(k for k, e in enumerate(src.entries) if e[0] == 'frame')
        e = src.entries[i]
        src.entries[i] = ('frame', e[1], e[2] + [(0x0001, 0, 0, 0)], e[3])
        data, labels, _ = od.layout(src)
        check(labels['aObjFrame_' + src.entries[i + 1][1]] == banks[0x86].labels['aObjFrame_' + src.entries[i + 1][1]] + 5,
              'adding a component moves the next frame by 5 bytes')
        m2 = od.build_model(od.source_to_asmbank(src))
        check(m2.serialize() == data, 'edited bank still parses and round-trips')
        # overflow is rejected
        src = od.read_sources(0x86)
        src.entries.append(('raw', bytes(0x8000)))
        try:
            od.layout(src)
            check(False, 'overflowing bank must be rejected')
        except ValueError:
            pass
    finally:
        shutil.rmtree(tmp)


def test_no_committed_asm(banks, ms):
    check(not os.path.exists(os.path.join(ROOT, 'src', 'data', 'objects', 'bank_86.asm')),
          'object data is not committed as asm (generated into build/gen/objects)')
    main = open(os.path.join(ROOT, 'src', 'main.asm'), encoding='utf-8').read()
    check('build/gen/objects/bank_86.asm' in main and 'build/gen/maps/bank_A7.asm' in main,
          'src/main.asm includes the generated object banks and maps')


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
