"""Object/sprite animation data of banks $86 and $87: editable sources <-> assembler input.

The sources live in ``assets/objects/bank_86`` and ``bank_87`` (see docs/formats/object-data.md):

  bank.json          slot table (64 OAM tile numbers) and the first object index of the bank
  objects/NNNN.json  one animation list per object index: steps = [frame id, timer]
  frames.txt         every frame (components: tile,x,y,attr) in ROM order

``build`` turns them into ``build/gen/objects/bank_XX.asm`` (labels and symbolic pointers, the file
``src/main.asm`` includes); no object data is committed under ``src/``.  Besides that the tool

  * extracts the sources from the original data (``build_model`` + ``model_to_source`` + ``write_sources``, driven by
    tools/extract_steps/objects.py: ``python tools/extract.py --rom-dir DIR --only objects``),
  * builds a structural model of each bank (``build_model``),
  * re-serialises the model with a fresh layout pass and compares it with the assembled bytes (``check``),
  * prints statistics (``analyze``).

Format summary (see docs/formats/object-data.md for evidence):

  bank:8000   64 x u16   OAM tile number for each of the 64 sprite tile slots
  bank:8080   N  x u16   animation list pointer per object index (N = $262 in
                         bank $86, $1EE in bank $87; ptr is a 16-bit offset
                         inside the same bank)
  lists       animation list = { u16 frame_ptr, u8 timer }* , u16 $0000
  frames      u8 count, count x { u16 tile_id, s8 x, s8 y, u8 attr }
  tail        $00 padding up to $FFFF

Usage:
  python3 tools/objects/objdata.py build                    # sources -> build/gen/objects/bank_XX.asm
  python3 tools/objects/objdata.py check [--rom US.sfc]     # sources are consistent (and equal the ROM banks)
  python3 tools/objects/objdata.py analyze
"""
import argparse
import collections
import json
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
OBJ_DIR = os.path.join(ROOT, 'assets', 'objects')
GEN_DIR = os.path.join(ROOT, 'build', 'gen', 'objects')
SRC_DIR = os.path.join(ROOT, 'src')
BANKS = {0x86: 'bank_86.asm', 0x87: 'bank_87.asm'}
BANK_SIZE = 0x8000
BASE = 0x8000
LIST_TABLE_OFF = 0x8080          # pointer table, one u16 per object index
SLOT_TABLE_OFF = 0x8000          # 64 x u16 slot -> OAM tile number
SLOT_COUNT = 0x40
OBJ_SPLIT = 0x262                # fObject_*: spriteTableIdx >= $262 -> bank $87


# --------------------------------------------------------------------------
# Assembled bank (bytes + labels)
# --------------------------------------------------------------------------
class AsmBank:
    """A bank image with its labels: bytes, labels and pointer fixups."""

    def __init__(self, bank, org):
        self.bank = bank
        self.org = org                   # full 24-bit ORG
        self.data = bytearray()
        self.labels = collections.OrderedDict()   # name -> 16-bit offset
        self.symrefs = {}                # offset of a dw -> label name used there


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


class Filler(Padding):
    """Zero byte(s) between data structures that no structure accounts for."""
    kind = 'Filler'


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
            if e == end:
                claim(Padding(e - s), s)
            else:
                claim(Filler(e - s), s)
                notes.append('%#x..%#x: %d unexplained zero byte(s) between structures'
                             % (s, e, e - s))
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
        pad, opaque, filler = by_kind['Padding'], by_kind['Opaque'], by_kind['Filler']
        opaque += filler            # unexplained bytes count as not modelled
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
        print('  not modelled              : %d bytes (%d opaque, %d unexplained zero filler)'
              % (opaque, opaque - filler, filler))
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


# --------------------------------------------------------------------------
# Editable sources (assets/objects) <-> bank bytes / assembly
# --------------------------------------------------------------------------
FRAME_ID_RE = re.compile(r'^[0-9A-Za-z_]+$')
HEX_RE = re.compile(r'^[0-9A-Fa-f]+$')


class BankSource:
    """Parsed editable source of one bank.

    ``slot``    list of 64 words
    ``first``   object index of the first list of the bank
    ``objects`` list of (name or None, [(frame id, timer)]) in object-index order
    ``entries`` ROM-ordered list: ('frame', id, [(tile, x, y, attr)], referenced) or ('raw', bytes)
    """

    def __init__(self, bank):
        self.bank = bank
        self.slot = []
        self.first = 0
        self.objects = []
        self.entries = []


def frame_label(fid):
    return 'aObjFrame_' + fid


def _bank_dir(bank, root=None):
    return os.path.join(root or OBJ_DIR, 'bank_%02X' % bank)


def _signed(v):
    return v - 256 if v >= 128 else v


def format_frame_line(fid, comps):
    return '%s: %s' % (fid, ' '.join('%04X,%d,%d,%02X' % (t, _signed(x), _signed(y), a)
                                      for t, x, y, a in comps))


def parse_frames_text(text, where='frames.txt'):
    entries = []
    for n, raw in enumerate(text.splitlines(), 1):
        line = raw.split(';', 1)[0].strip()
        if not line:
            continue
        if line.startswith('raw '):
            h = ''.join(line[4:].split())
            if not HEX_RE.match(h) or len(h) % 2:
                raise ValueError('%s:%d: bad raw bytes' % (where, n))
            entries.append(('raw', bytes.fromhex(h)))
            continue
        fid, sep, rest = line.partition(':')
        fid = fid.strip()
        if not sep or not FRAME_ID_RE.match(fid):
            raise ValueError('%s:%d: expected "<frame id>: tile,x,y,attr ..."' % (where, n))
        comps = []
        for tok in rest.split():
            f = tok.split(',')
            if len(f) != 4:
                raise ValueError('%s:%d: bad component %r' % (where, n, tok))
            tile, x, y, attr = int(f[0], 16), int(f[1]), int(f[2]), int(f[3], 16)
            if not (0 <= tile < 0x10000 and -128 <= x < 256 and -128 <= y < 256 and 0 <= attr < 256):
                raise ValueError('%s:%d: component out of range %r' % (where, n, tok))
            comps.append((tile, x & 0xFF, y & 0xFF, attr))
        if not 1 <= len(comps) <= 16:
            raise ValueError('%s:%d: frame %s needs 1..16 components' % (where, n, fid))
        entries.append(('frame', fid, comps, not fid.startswith('U')))
    return entries


FRAMES_HEADER = '''; Object animation frames of bank ${bank:02X}, in ROM order (generated layout: the order of this file is the order of the bytes).
; One frame per line:  <id>: <component> <component> ...      component = tile,x,y,attr
;   id        label suffix: the frame is emitted as label aObjFrame_<id> (any [A-Za-z0-9_]+; animation steps refer to it).
;             Ids starting with U are frames that no animation step uses (dead data).
;   tile      hex, id of the 16x16 sprite (sprite bank $88 + (tile >> 8), see docs/formats/object-data.md)
;   x,y       signed decimal pixel offsets from the object origin
;   attr      hex: bits 0-2 palette, bit 4 vertical flip, bit 5 horizontal flip
; "raw <hex bytes>" emits bytes that belong to no frame (kept verbatim).
'''


def object_names(root=None):
    """{object index: name} from the "name" fields of assets/objects/bank_XX/objects/NNNN.json."""
    out = {}
    objdir = os.path.join(root, 'assets', 'objects') if root else None
    for bank in BANKS:
        src = read_sources(bank, objdir)
        for k, (name, _steps) in enumerate(src.objects):
            if name:
                out[src.first + k] = name
    return out


def read_sources(bank, root=None):
    d = _bank_dir(bank, root)
    src = BankSource(bank)
    with open(os.path.join(d, 'bank.json'), encoding='utf-8') as fh:
        meta = json.load(fh)
    src.slot = [int(v, 16) if isinstance(v, str) else v for v in meta['slot_table']]
    src.first = int(meta['first_object_index'], 16)
    if len(src.slot) != SLOT_COUNT:
        raise ValueError('bank %02X: slot table needs %d entries' % (bank, SLOT_COUNT))
    names = sorted(fn for fn in os.listdir(os.path.join(d, 'objects')) if fn.endswith('.json'))
    for k, fn in enumerate(names):
        if fn != '%04X.json' % (src.first + k):
            raise ValueError('bank %02X: object files must be contiguous from %04X (found %s at position %d)'
                             % (bank, src.first, fn, k))
        with open(os.path.join(d, 'objects', fn), encoding='utf-8') as fh:
            doc = json.load(fh)
        steps = [(str(f), int(t)) for f, t in doc['steps']]
        if not steps:
            raise ValueError('%s: empty animation list (the engine would hang)' % fn)
        for f, t in steps:
            if not 0 <= t <= 255:
                raise ValueError('%s: timer %d out of range' % (fn, t))
        src.objects.append((doc.get('name'), steps))
    with open(os.path.join(d, 'frames.txt'), encoding='utf-8') as fh:
        src.entries = parse_frames_text(fh.read(), os.path.join(d, 'frames.txt'))
    ids = [e[1] for e in src.entries if e[0] == 'frame']
    if len(ids) != len(set(ids)):
        raise ValueError('bank %02X: duplicate frame ids' % bank)
    known = set(ids)
    for k, (_n, steps) in enumerate(src.objects):
        for f, _t in steps:
            if f not in known:
                raise ValueError('bank %02X object %04X: unknown frame id %s' % (bank, src.first + k, f))
    return src


def anim_label(idx, name=None):
    """Label of the animation list of object `idx`: aObjAnimList_XXXX[_<name>] (the index is the engine identity)."""
    return 'aObjAnimList_%04X' % idx + ('_' + name if name else '')


def layout(src):
    """-> (data bytes, labels name->offset, label->pointer symbolic refs not needed) for a BankSource."""
    labels = collections.OrderedDict()
    pos = BASE
    labels['aObjSlotOamTile_%02X8000' % src.bank] = pos
    pos += 2 * len(src.slot)
    labels['aObjAnimListPtrs_%02X' % src.bank] = pos
    pos += 2 * len(src.objects)
    list_addr = []
    for k, (_n, steps) in enumerate(src.objects):
        labels[anim_label(src.first + k, _n)] = pos
        list_addr.append(pos)
        pos += 3 * len(steps) + 2
    frame_addr = {}
    for e in src.entries:
        if e[0] == 'frame':
            frame_addr[e[1]] = pos
            labels[frame_label(e[1])] = pos
            pos += 1 + 5 * len(e[2])
        else:
            pos += len(e[1])
    if pos > BASE + BANK_SIZE:
        raise ValueError('bank %02X overflows by %d bytes' % (src.bank, pos - BASE - BANK_SIZE))
    labels['aObjPadding_%02X%04X' % (src.bank, pos)] = pos
    out = bytearray()
    for w in src.slot:
        out += w.to_bytes(2, 'little')
    for a in list_addr:
        out += a.to_bytes(2, 'little')
    for _n, steps in src.objects:
        for f, t in steps:
            out += frame_addr[f].to_bytes(2, 'little')
            out.append(t)
        out += b'\0\0'
    for e in src.entries:
        if e[0] == 'frame':
            out.append(len(e[2]))
            for tile, x, y, attr in e[2]:
                out += tile.to_bytes(2, 'little') + bytes((x, y, attr))
        else:
            out += e[1]
    out += bytes(BASE + BANK_SIZE - (BASE + len(out)))
    return bytes(out), labels, pos


def source_to_asmbank(src):
    data, labels, _ = layout(src)
    ab = AsmBank(src.bank, (src.bank << 16) | BASE)
    ab.data = bytearray(data)
    ab.labels = labels
    return ab


def load_banks(root=None):
    """Both banks assembled from the editable sources (objects with .data and .labels)."""
    return {b: source_to_asmbank(read_sources(b, root)) for b in BANKS}


def emit_asm(src):
    data, labels, pad_start = layout(src)
    lines = ['; Object animation data of bank $%02X - generated by tools/objects/objdata.py build from assets/objects/bank_%02X/' % (src.bank, src.bank),
             '; (do not edit; not committed)', '', '    ORG $%02X%04X' % (src.bank, BASE), '']
    lines.append('aObjSlotOamTile_%02X8000:' % src.bank)
    for i in range(0, len(src.slot), 8):
        lines.append('    dw ' + ','.join('$%04X' % w for w in src.slot[i:i + 8]))
    lines.append('aObjAnimListPtrs_%02X:' % src.bank)
    for k, (name, _steps) in enumerate(src.objects):
        lines.append('    dw ' + anim_label(src.first + k, name))
    for k, (name, steps) in enumerate(src.objects):
        lines.append(anim_label(src.first + k, name) + ':')
        for f, t in steps:
            lines.append('    dw %s : db $%02X' % (frame_label(f), t))
        lines.append('    dw $0000')
    for e in src.entries:
        if e[0] == 'frame':
            lines.append('%s:' % frame_label(e[1]))
            lines.append('    db $%02X' % len(e[2]))
            for tile, x, y, attr in e[2]:
                lines.append('    dw $%04X : db $%02X,$%02X,$%02X' % (tile, x, y, attr))
        else:
            lines.append('    db ' + ','.join('$%02X' % b for b in e[1]))
    lines.append('aObjPadding_%02X%04X:' % (src.bank, pad_start))
    lines.append('    fill $%04X' % (BASE + BANK_SIZE - pad_start))
    lines.append('')
    return '\n'.join(lines)


def model_to_source(m, labels_hint=None):
    """Convert a validated Model (from build_model) to a BankSource with canonical ids."""
    src = BankSource(m.bank)
    tbl = next(n for n in m.nodes if n.kind == 'ListTable')
    src.slot = list(m.nodes[0].words)
    src.first = 0 if m.bank == 0x86 else OBJ_SPLIT
    fid = {}
    for n in m.nodes:
        if n.kind == 'Frame':
            fid[id(n)] = ('' if n.referenced else 'U') + '%02X%04X' % (m.bank, n.addr)
    prev = -1
    for i, r in enumerate(tbl.refs):
        al = r.node
        if al is None or al.indices != [i]:
            raise ValueError('bank %02X: object index %d does not own a distinct list' % (m.bank, i))
        if al.addr <= prev:
            raise ValueError('bank %02X: lists are not in object-index order' % m.bank)
        prev = al.addr
        src.objects.append((None, [(fid[id(rr.node)], t) for rr, t in al.steps]))
    for n in m.nodes:
        if n.kind == 'Frame':
            src.entries.append(('frame', fid[id(n)], list(n.comps), n.referenced))
        elif n.kind in ('Filler', 'Opaque'):
            src.entries.append(('raw', bytes(n.data) if n.kind == 'Opaque' else bytes(n.fill for _ in range(n.length))))
        elif n.kind == 'Padding':
            if n is not m.nodes[-1]:
                raise ValueError('bank %02X: padding inside the bank' % m.bank)
    return src


def write_sources(src, root=None):
    d = _bank_dir(src.bank, root)
    os.makedirs(os.path.join(d, 'objects'), exist_ok=True)
    for fn in os.listdir(os.path.join(d, 'objects')):
        os.remove(os.path.join(d, 'objects', fn))
    meta = {'bank': '$%02X' % src.bank, 'first_object_index': '%04X' % src.first,
            'slot_table': ['%04X' % w for w in src.slot]}
    with open(os.path.join(d, 'bank.json'), 'w', encoding='utf-8', newline='\n') as fh:
        fh.write('{\n "bank": "%s",\n "first_object_index": "%s",\n "slot_table": [\n' % (meta['bank'], meta['first_object_index']))
        rows = [', '.join('"%s"' % v for v in meta['slot_table'][i:i + 8]) for i in range(0, len(src.slot), 8)]
        fh.write('  ' + ',\n  '.join(rows) + '\n ]\n}\n')
    for k, (name, steps) in enumerate(src.objects):
        with open(os.path.join(d, 'objects', '%04X.json' % (src.first + k)), 'w', encoding='utf-8', newline='\n') as fh:
            fh.write('{\n')
            if name:
                fh.write(' "name": %s,\n' % json.dumps(name))
            fh.write(' "steps": [\n' + ',\n'.join('  ["%s", %d]' % (f, t) for f, t in steps) + '\n ]\n}\n')
    with open(os.path.join(d, 'frames.txt'), 'w', encoding='utf-8', newline='\n') as fh:
        fh.write(FRAMES_HEADER.format(bank=src.bank))
        for e in src.entries:
            if e[0] == 'frame':
                fh.write(format_frame_line(e[1], e[2]) + '\n')
            else:
                fh.write('raw ' + e[1].hex().upper() + '\n')


def rom_bank(rom_path, bank):
    with open(rom_path, 'rb') as fh:
        return rom_bank_bytes(fh.read(), bank)


def rom_bank_bytes(rom, bank):
    """The AsmBank of bank `bank` ($86/$87) taken from a headerless 2 MB ROM image."""
    off = (bank - 0x80) * BANK_SIZE
    ab = AsmBank(bank, (bank << 16) | BASE)
    ab.data = bytearray(rom[off:off + BANK_SIZE])
    return ab


# --------------------------------------------------------------------------
# Commands
# --------------------------------------------------------------------------
def cmd_build(_args):
    os.makedirs(GEN_DIR, exist_ok=True)
    for b in BANKS:
        text = emit_asm(read_sources(b))
        with open(os.path.join(GEN_DIR, 'bank_%02X.asm' % b), 'w', encoding='utf-8', newline='\n') as fh:
            fh.write(text)
    print('objdata: wrote build/gen/objects/bank_86.asm, bank_87.asm')
    return 0


def cmd_check(args):
    bad = 0
    for bank, asm in load_banks().items():
        model = build_model(asm)
        out = model.serialize()
        orig = bytes(asm.data)
        if out == orig and len(orig) == BANK_SIZE:
            print('bank $%02X: OK, %d bytes reproduced exactly (%d nodes)'
                  % (bank, len(orig), len(model.nodes)))
        else:
            bad += 1
            first = next((i for i in range(min(len(out), len(orig))) if out[i] != orig[i]),
                         min(len(out), len(orig)))
            print('bank $%02X: MISMATCH at offset %#x (model %d bytes, source %d bytes)'
                  % (bank, BASE + first, len(out), len(orig)))
        src = read_sources(bank)
        # sources must be canonical: re-extracting the assembled bytes gives the same text
        again = model_to_source(model)
        if [e for e in again.entries] != [e for e in src.entries] or again.objects != [(None, s) for _n, s in src.objects]:
            print('bank $%02X: note: the source differs from the structure inferred from its bytes '
                  '(frame ids / order edited, dead frames, shared frames); this is fine' % bank)
        if getattr(args, 'rom', None):
            ref = bytes(rom_bank(args.rom, bank).data)
            if ref != orig:
                bad += 1
                first = next(i for i in range(BANK_SIZE) if ref[i] != orig[i])
                print('bank $%02X: differs from %s at offset %#x' % (bank, args.rom, BASE + first))
            else:
                print('bank $%02X: identical to the ROM dump' % bank)
    return 1 if bad else 0


def main(argv=None):
    ap = argparse.ArgumentParser(description=__doc__.split('\n')[0])
    sub = ap.add_subparsers(dest='cmd', required=True)
    sub.add_parser('analyze')
    sub.add_parser('build')
    p = sub.add_parser('check')
    p.add_argument('--rom', help='also compare the assembled banks with this US ROM dump')
    args = ap.parse_args(argv)
    return {'analyze': cmd_analyze, 'build': cmd_build, 'check': cmd_check}[args.cmd](args)


if __name__ == '__main__':
    sys.exit(main())
