#!/usr/bin/env python3
"""Linter and coverage report for the Doxygen-style documentation blocks in src/**/*.asm.

The standard is docs/code-documentation.md.  A documentation block is an ordinary asar comment, so it can never change
the generated ROM:

    ;;
    ; @brief   One line.
    ; @param   A   what it holds
    ;;
    fRoutine:

Commands
  report [--json] [--sort path|coverage|missing] [FILE...]
        coverage per file and totals: routines, tables, module headers, RAM/struct fields with a trailing comment.
  check  [--require-all] [--min-coverage N] [--verify-calls] [-v] [--github] [FILE...]
        syntax errors in existing blocks make the exit status 1; missing documentation is only a warning unless
        --require-all (every routine, table and module header must be documented) or --min-coverage N (overall
        coverage in percent) is given.
  todo   --file FILE [--all] [--json]
        the undocumented labels of one source file (the work list for an agent).

Options common to all commands: --root DIR (repository root, default: the repository of this script).
Only the standard library is used; no ROM and no assembler are needed.
"""
import argparse
import json
import os
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]

ALLOWED_TAGS = ('brief details param return modifies clobbers mode calls callers region note case format index '
                'used_by file bank range see stack confidence').split()
ROUTINE_ONLY = {'param', 'return', 'modifies', 'clobbers', 'mode', 'calls', 'callers', 'stack', 'case'}
TABLE_ONLY = {'format', 'index', 'used_by'}
HEADER_ONLY = {'file', 'bank', 'range'}
# tags that may appear more than once in one block; every other tag should occur once
MULTI_TAGS = {'param', 'return', 'note', 'region', 'see', 'details', 'stack', 'confidence'}

REGISTERS = {'A', 'X', 'Y', 'B', 'C', 'Z', 'N', 'V', 'I', 'D', 'S', 'P', 'DP', 'DB', 'PB', 'PC', 'K', 'M', 'E'}
CLOBBER_WORDS = REGISTERS | {'flags', 'none'}

MNEMONICS = set('''ADC AND ASL BCC BCS BEQ BIT BMI BNE BPL BRA BRK BRL BVC BVS CLC CLD CLI CLV CMP COP CPX CPY DEC DEX DEY
EOR INC INX INY JML JMP JSL JSR LDA LDX LDY LSR MVN MVP NOP ORA PEA PEI PER PHA PHB PHD PHK PHP PHX PHY PLA PLB PLD PLP
PLX PLY REP ROL ROR RTI RTL RTS SBC SEC SED SEI SEP STA STP STX STY STZ TAX TAY TCD TCS TDC TRB TSB TSC TSX TXA TXS TXY
TYA TYX WAI WDM XBA XCE BLT BGE INA DEA TAD TDA TAS TSA CPA SWA'''.split())
TERMINATORS = {'RTS', 'RTL', 'RTI', 'JMP', 'JML', 'BRA', 'BRL', 'STP'}
DATA_DIRECTIVES = {'db', 'dw', 'dl', 'dd', 'dq', 'incbin', 'fill', 'fillbyte', 'fillword', 'filllong', 'fillbyte', 'skip'}
COND_RE = re.compile(r'^\s*(if|elseif|else|endif)\b', re.I)

LABEL_RE = re.compile(r'^([A-Za-z_][A-Za-z0-9_]*):(?!:)(.*)$')
LOCAL_LABEL_RE = re.compile(r'^\s*\.[A-Za-z_][A-Za-z0-9_]*\s*:')
ANON_LABEL_RE = re.compile(r'^\s*[-+]+\s*(;.*)?$')
CODE_NAME_RE = re.compile(r'^(f[A-Z0-9_]|sub[A-Z0-9_])')
DATA_NAME_RE = re.compile(r'^[anps][A-Z]')
IDENT_RE = re.compile(r'[A-Za-z_][A-Za-z0-9_]*')
STATE = r'(?:M(?:8|16)(?:X(?:8|16))?|X(?:8|16)|\?)'
MODE_RE = re.compile(r'^(?:=|%s(?:\s*->\s*(?:%s|=))?|%s\s*=)$' % (STATE, STATE, STATE))
SCRIPT_RE = re.compile(r'^src/ai/[^/]+/scripts/[^/]+\.asm$')
FIELD_FILES = ('src/common/ram.asm', 'src/common/structures.asm', 'src/common/enums.asm')
INLINE_TAG_RE = re.compile(r'\s{2,}@(%s)\b' % '|'.join(ALLOWED_TAGS))
TAG_LINE_RE = re.compile(r'^@([A-Za-z_][A-Za-z0-9_]*)\b\s*(.*)$')


class Tag:
    def __init__(self, name, text, line):
        self.name, self.text, self.line = name, text, line

    def as_dict(self):
        return {'name': self.name, 'text': self.text, 'line': self.line}


class Block:
    """One `;;` ... `;;` documentation block."""

    def __init__(self, start, end):
        self.start, self.end = start, end
        self.tags = []
        self.free_text = []      # untagged text before the first tag (a warning)

    def get(self, name, default=''):
        for t in self.tags:
            if t.name == name:
                return t.text
        return default

    def all(self, name):
        return [t for t in self.tags if t.name == name]

    def has(self, name):
        return any(t.name == name for t in self.tags)

    @property
    def is_header(self):
        return self.has('file')


class Label:
    def __init__(self, name, line, kind, inner, block, nxt=''):
        self.name, self.line, self.kind, self.inner, self.block, self.next = name, line, kind, inner, block, nxt

    @property
    def documented(self):
        return self.block is not None and self.block.has('brief')


class Parsed:
    def __init__(self, rel):
        self.rel = rel
        self.is_script = bool(SCRIPT_RE.match(rel))
        self.blocks = []
        self.header = None
        self.labels = []          # Label objects (code and data), duplicates (regional branches) merged
        self.errors = []          # (line, message)
        self.warnings = []        # (line, message)
        self.fields = []          # (line, name, commented)
        self.defs = set()         # every identifier defined here (symbols)
        self.struct_fields = {}   # struct name -> set of field names
        self.lines = []

    def err(self, line, msg):
        self.errors.append((line, msg))

    def warn(self, line, msg):
        self.warnings.append((line, msg))


# ----------------------------------------------------------------------------- low level helpers

def strip_comment(s):
    """Source line without its `;` comment (quotes respected)."""
    q = None
    for i, ch in enumerate(s):
        if q:
            if ch == q:
                q = None
        elif ch in '"\'':
            q = ch
        elif ch == ';':
            return s[:i]
    return s


def statement_of(line):
    """(kind, word) of a source line: kind in blank comment label local instr data macro cond org other."""
    if not line.strip():
        return 'blank', ''
    if line.lstrip().startswith(';'):
        return 'comment', ''
    if LABEL_RE.match(line):
        return 'label', LABEL_RE.match(line).group(1)
    if LOCAL_LABEL_RE.match(line) or ANON_LABEL_RE.match(line):
        return 'local', ''
    code = strip_comment(line).strip()
    if not code:
        return 'blank', ''
    if COND_RE.match(code):
        return 'cond', ''
    word = re.split(r"[\s(.]", code, maxsplit=1)[0]
    if code.startswith('%'):
        return 'macro', code
    if word.upper() in MNEMONICS:
        return 'instr', word.upper()
    if word.lower() in DATA_DIRECTIVES:
        return 'data', word.lower()
    if word.lower() == 'incsrc':
        return 'incsrc', word.lower()
    if word.lower() == 'org':
        return 'org', word.lower()
    return 'other', word.lower()


def parse_block_lines(block, raw):
    """Fill block.tags from the raw comment lines [(lineno, text)] between the delimiters."""
    cur = None
    for no, text in raw:
        body = text.lstrip()[1:]                 # drop the leading ';'
        if body.startswith(' '):
            body = body[1:]
        stripped = body.strip()
        m = TAG_LINE_RE.match(stripped)
        if m:
            # "@bank $83   @range $83B000-$83FFFF": several tags may share one line (two or more spaces before the next @tag)
            segs = INLINE_TAG_RE.split(stripped)
            head = TAG_LINE_RE.match(segs[0])
            cur = Tag(head.group(1), head.group(2).strip(), no)
            block.tags.append(cur)
            for k in range(1, len(segs), 2):
                cur = Tag(segs[k], segs[k + 1].strip(), no)
                block.tags.append(cur)
        elif cur is not None:
            if stripped:
                cur.text = (cur.text + '\n' + stripped).strip('\n')
            else:
                cur.text += '\n'
        elif stripped:
            block.free_text.append((no, stripped))
    for t in block.tags:
        t.text = t.text.strip()


def strip_parens(text):
    prev = None
    while prev != text:
        prev = text
        text = re.sub(r'\([^()]*\)', ' ', text)
    return text


def list_names(text):
    """Identifiers named by a tag value such as '@calls fA, fB (note)'."""
    out = []
    for tok in re.findall(r'!?[A-Za-z_][A-Za-z0-9_]*(?:\.[A-Za-z_][A-Za-z0-9_]*)*', strip_parens(text)):
        out.append(tok.lstrip('!'))
    return out


def comment_documents(comment):
    """True when a trailing comment of a RAM variable / struct field / constant says something."""
    c = re.sub(r'!\^|\^!', ' ', comment)
    words = []
    for tok in re.findall(r"[A-Za-z][A-Za-z0-9_'-]*", c):
        if len(tok) < 3:
            continue
        if re.match(r'^(ptr|prt)\d*$|^n\d+$|^s[A-Z]\w*$|^x[0-9A-Fa-f]+$|^(unknown|unk\w*|tbd)$', tok, re.I) \
                and not re.match(r'^s[a-z]+$', tok):
            continue
        words.append(tok)
    return len(words) >= 2


# ----------------------------------------------------------------------------- file parser

def parse_text(text, rel):
    P = Parsed(rel)
    lines = text.splitlines()
    P.lines = lines
    n = len(lines)
    kinds = [None] * n          # statement kind per line
    words = [None] * n
    in_macro = False
    in_struct = None
    in_block = False
    bstart = 0
    raw = []
    pending = None              # closed block waiting for its label
    pending_gap = False         # a blank / comment line was seen after the block
    label_entries = []          # (idx, name, block)
    rest_kind = {}              # label lines that carry a statement after the colon
    is_fields = rel in FIELD_FILES

    def orphan(block, line_no, why):
        P.err(line_no, 'documentation block (line %d) %s' % (block.start + 1, why))

    for i, line in enumerate(lines):
        no = i + 1
        stripped = line.strip()
        if in_block:
            if stripped == ';;':
                blk = Block(bstart, no)
                parse_block_lines(blk, raw)
                P.blocks.append(blk)
                in_block = False
                pending, pending_gap = (blk, False)
                if blk.is_header:
                    if P.header is None:
                        P.header = blk
                    else:
                        P.err(bstart + 1, 'second @file module header in one file')
                    pending = None
                kinds[i] = 'blockend'
                continue
            if stripped.startswith(';'):
                raw.append((no, line))
                kinds[i] = 'blockbody'
                continue
            P.err(bstart + 1, 'documentation block is not closed with a ";;" line (line %d is not a comment)' % no)
            in_block = False
            # fall through: the offending line is processed normally
        if stripped == ';;':
            if pending is not None:
                orphan(pending, pending.end, 'is not directly above a global label')
                pending = None
            in_block, bstart, raw = True, i, []
            kinds[i] = 'blockstart'
            continue
        kind, word = statement_of(line)
        kinds[i], words[i] = kind, word
        # --- macro / struct bookkeeping
        low = stripped.lower()
        if in_macro:
            kinds[i] = 'macrobody'
            pending = None
            if re.match(r'^endmacro\b', low):
                in_macro = False
                kinds[i] = 'other'
            continue
        if re.match(r'^macro\s', low):
            in_macro = True
            m = re.match(r'^macro\s+([A-Za-z_]\w*)', stripped, re.I)
            if m:
                P.defs.add(m.group(1))
            pending = None
            continue
        m = re.match(r'^function\s+([A-Za-z_]\w*)', stripped, re.I)
        if m:
            P.defs.add(m.group(1))
        m = re.match(r'^struct\s+([A-Za-z_]\w*)', stripped, re.I)
        if m:
            in_struct = m.group(1)
            P.defs.add(in_struct)
            P.struct_fields.setdefault(in_struct, set())
        elif re.match(r'^endstruct\b', low):
            in_struct = None
        if in_struct:
            fm = re.match(r'^\s*\.([A-Za-z_]\w*)\s*:', line)
            if fm:
                P.struct_fields[in_struct].add(fm.group(1))
                if is_fields:
                    P.fields.append((no, in_struct + '.' + fm.group(1), comment_documents(line.partition(';')[2])))
        # --- equates
        em = re.match(r'^(!?[A-Za-z_][A-Za-z0-9_]*)\s*(?:#?=|\?=)', line)
        if em:
            P.defs.add(em.group(1).lstrip('!'))
            if is_fields and not in_struct:
                P.fields.append((no, em.group(1), comment_documents(line.partition(';')[2])))
        # --- pending block attachment
        if kind == 'cond':
            continue
        if kind in ('blank', 'comment'):
            if pending is not None:
                pending_gap = True
            continue
        if kind == 'label':
            name = word
            P.defs.add(name)
            blk = None
            if pending is not None:
                if pending_gap:
                    orphan(pending, pending.end, 'is separated from the label %s by a blank or comment line' % name)
                else:
                    blk = pending
                pending = None
            label_entries.append((i, name, blk))
            rest = LABEL_RE.match(line).group(2)
            if rest.strip() and not rest.strip().startswith(';'):
                rest_kind[i] = statement_of(' ' + rest)
            continue
        # anything else after a pending block
        if pending is not None:
            if kind in ('other', 'org', 'macro', 'data', 'incsrc', 'instr', 'local') and not (
                    em or re.match(r'^(macro|function|struct)\b', low)):
                orphan(pending, pending.end, 'is not directly above a global label')
            pending = None
    if in_block:
        P.err(bstart + 1, 'documentation block is not closed with a ";;" line (end of file)')
    if pending is not None:
        orphan(pending, pending.end, 'is not followed by a label')

    # --- classify labels
    skip_kinds = ('blank', 'comment', 'cond', 'local', 'blockstart', 'blockbody', 'blockend', 'macrobody', None)

    def stmt(j):
        return rest_kind.get(j) or (kinds[j], words[j])

    def significant(j, step):
        """Index of the next/previous significant statement line, skipping blanks, comments, cond and bare labels."""
        j += step
        while 0 <= j < n:
            if kinds[j] in skip_kinds or (kinds[j] == 'label' and j not in rest_kind):
                j += step
                continue
            return j
        return None

    seen = {}
    for idx, name, blk in label_entries:
        j = idx if idx in rest_kind else significant(idx, 1)
        nxt, nword = stmt(j) if j is not None else (None, '')
        if CODE_NAME_RE.match(name):
            kind = 'code'
        elif DATA_NAME_RE.match(name):
            kind = 'code' if nxt == 'instr' else 'data'
        elif nxt == 'instr':
            kind = 'code'
        elif nxt in ('data', 'incsrc'):
            kind = 'data'
        else:
            kind = 'other'
        inner = False
        if kind == 'code':
            p = significant(idx, -1)
            if p is not None:
                pk, pw = stmt(p)
                if (pk == 'instr' and pw not in TERMINATORS) or pk == 'macro':
                    inner = True
        if name in seen:
            lab = seen[name]
            if lab.block is None and blk is not None:
                lab.block = blk
            if not inner:
                lab.inner = False
            continue
        lab = Label(name, idx + 1, kind, inner, blk, nword or (nxt or ''))
        seen[name] = lab
        P.labels.append(lab)
    return P


# ----------------------------------------------------------------------------- repository model

class Repo:
    def __init__(self, root):
        self.root = Path(root)
        self.files = {}
        self.symbols = set()
        self.struct_fields = {}
        self.all_fields = set()

    def load(self):
        src = self.root / 'src'
        for p in sorted(src.rglob('*.asm')) if src.is_dir() else []:
            rel = p.relative_to(self.root).as_posix()
            try:
                text = p.read_text(encoding='utf-8', errors='replace')
            except OSError as e:           # a file being rewritten by another process: skip it
                sys.stderr.write('doclint: cannot read %s: %s\n' % (rel, e))
                continue
            try:
                self.files[rel] = parse_text(text, rel)
            except Exception as e:         # never let one odd file stop the report
                bad = Parsed(rel)
                bad.err(1, 'doclint could not parse this file: %r' % (e,))
                self.files[rel] = bad
        for P in self.files.values():
            self.symbols |= P.defs
            for s, f in P.struct_fields.items():
                self.struct_fields.setdefault(s, set()).update(f)
                self.all_fields |= f
        self._promote_referenced_entries()
        gen = self.root / 'build' / 'gen'
        if gen.is_dir():
            lab = re.compile(r'^\s*([A-Za-z_][A-Za-z0-9_]*)\s*(?::|=)', re.M)
            for p in gen.rglob('*.asm'):
                try:
                    self.symbols.update(lab.findall(p.read_text(encoding='utf-8', errors='replace')))
                except OSError:
                    pass
        return self

    def _promote_referenced_entries(self):
        """A fall-through label that is called (JSR/JSL/JML/PEA) or stored in a table is an entry point, not an inner label."""
        call = re.compile(r'^\s*(?:JSR|JSL|JML|PEA)(?:\.[BWLbwl])?\s+\(?\[?([A-Za-z_]\w*)', re.I)
        data = re.compile(r'^\s*(?:db|dw|dl|dd)\b(.*)', re.I)
        refs = set()
        for P in self.files.values():
            for line in P.lines:
                m = call.match(line)
                if m:
                    refs.add(m.group(1))
                    continue
                m = data.match(line)
                if m:
                    refs.update(IDENT_RE.findall(strip_comment(m.group(1))))
        for P in self.files.values():
            for l in P.labels:
                if l.inner and l.name in refs:
                    l.inner = False

    def select(self, names):
        """Resolve user supplied file names (full relative path, path suffix or basename) to repository files."""
        if not names:
            return sorted(self.files)
        out = []
        for nm in names:
            nm = nm.replace('\\', '/')
            nm = os.path.relpath(nm, self.root).replace('\\', '/') if os.path.isabs(nm) else nm
            nm = nm[2:] if nm.startswith('./') else nm
            hits = [r for r in self.files if r == nm or r.endswith('/' + nm)]
            if not hits:
                raise SystemExit('doclint: no source file matches %r' % nm)
            if len(hits) > 1 and nm not in hits:
                raise SystemExit('doclint: %r is ambiguous: %s' % (nm, ', '.join(hits)))
            out.append(nm if nm in hits else hits[0])
        return sorted(set(out))


def ratio(a, b):
    return 100.0 if b == 0 else 100.0 * a / b


def file_stats(repo, P):
    block_diagnostics(repo, P)
    routines = [l for l in P.labels if l.kind == 'code' and not P.is_script and (not l.inner or l.documented)]
    tables = [l for l in P.labels if l.kind == 'data' and not P.is_script]
    inner = [l for l in P.labels if l.kind == 'code' and l.inner and not l.documented and not P.is_script]
    st = {
        'file': P.rel,
        'script': P.is_script,
        'header': P.header is not None and P.header.has('brief'),
        'routines': {'total': len(routines), 'documented': sum(1 for l in routines if l.documented)},
        'tables': {'total': len(tables), 'documented': sum(1 for l in tables if l.documented)},
        'inner_labels': len(inner),
        'fields': {'total': len(P.fields), 'commented': sum(1 for f in P.fields if f[2])},
        'errors': len(P.errors),
        'warnings': len(P.warnings),
    }
    return st


def totals_of(stats):
    t = {'files': len(stats), 'headers': {'total': len(stats), 'documented': sum(1 for s in stats if s['header'])},
         'routines': {'total': 0, 'documented': 0}, 'tables': {'total': 0, 'documented': 0},
         'fields': {'total': 0, 'commented': 0}, 'inner_labels': 0, 'errors': 0}
    for s in stats:
        for k in ('routines', 'tables'):
            t[k]['total'] += s[k]['total']
            t[k]['documented'] += s[k]['documented']
        t['fields']['total'] += s['fields']['total']
        t['fields']['commented'] += s['fields']['commented']
        t['inner_labels'] += s['inner_labels']
        t['errors'] += s['errors']
    return t


def overall(t):
    num = t['routines']['documented'] + t['tables']['documented'] + t['headers']['documented']
    den = t['routines']['total'] + t['tables']['total'] + t['headers']['total']
    return ratio(num, den)


# ----------------------------------------------------------------------------- checks

def block_diagnostics(repo, P, verify_calls=False):
    """Syntax errors and warnings of every block of one file (appended to P.errors / P.warnings once)."""
    if getattr(P, '_checked', False):
        return
    P._checked = True
    attached = {id(l.block): l for l in P.labels if l.block is not None}
    for blk in P.blocks:
        lab = attached.get(id(blk))
        header = blk.is_header
        where = 'block at line %d' % (blk.start + 1)
        for no, _ in blk.free_text[:1]:
            P.warn(no, 'text before the first tag is ignored (put it under @brief or @details)')
        seen = {}
        for t in blk.tags:
            if t.name not in ALLOWED_TAGS:
                P.err(t.line, 'unknown tag @%s (allowed: %s)' % (t.name, ' '.join(ALLOWED_TAGS)))
                continue
            if t.name in seen and t.name not in MULTI_TAGS:
                (P.err if t.name == 'brief' else P.warn)(t.line, 'tag @%s given more than once' % t.name)
            seen[t.name] = True
            if not t.text and t.name not in ('details',):
                (P.err if t.name == 'brief' else P.warn)(t.line, 'tag @%s has no value' % t.name)
            if t.name == 'mode':
                m = strip_parens(t.text).strip()
                if not MODE_RE.match(m):
                    P.err(t.line, '@mode %r: expected M8X8|M8X16|M16X8|M16X16 [-> state|=] (or "="), e.g. "M8X16 -> M16X16"' % m)
            elif t.name == 'bank' and not re.match(r'^\$[0-9A-Fa-f]{2}\b', t.text):
                P.warn(t.line, '@bank should be a bank number such as $83')
            elif t.name == 'range' and not re.match(r'^\$[0-9A-Fa-f]{6}\s*-\s*\$[0-9A-Fa-f]{6}', t.text):
                P.warn(t.line, '@range should look like $83B000-$83FFFF')
            elif t.name == 'confidence' and t.text.split()[:1] and t.text.split()[0].rstrip(',;:.') not in ('high', 'medium', 'low'):
                P.warn(t.line, '@confidence should start with high, medium or low')
            elif t.name == 'clobbers':
                bad = [w for w in re.findall(r'[A-Za-z]+', strip_parens(t.text)) if w not in CLOBBER_WORDS]
                if bad:
                    P.warn(t.line, '@clobbers lists non-register words: %s (registers: A X Y B C Z N V DP DB S P)' % ' '.join(bad))
            elif t.name == 'file' and t.text and t.text.split()[0] != Path(P.rel).name:
                P.warn(t.line, '@file %s does not match the file name %s' % (t.text.split()[0], Path(P.rel).name))
            elif t.name in ('calls', 'callers', 'used_by', 'modifies') and t.text:
                for nm in list_names(t.text):
                    if nm in REGISTERS or nm.startswith('.'):
                        continue
                    base, _, field = nm.partition('.')
                    if base not in repo.symbols:
                        P.warn(t.line, '@%s: unknown name %s' % (t.name, nm))
                    elif field and base in repo.struct_fields and field.split('.')[0] not in repo.struct_fields[base]:
                        P.warn(t.line, '@%s: %s has no field %s' % (t.name, base, field))
        if not blk.has('brief'):
            P.err(blk.start + 1, 'documentation block without @brief')
        # tag applicability
        names = {t.name for t in blk.tags}
        if header:
            misuse = names & (ROUTINE_ONLY | TABLE_ONLY)
            if misuse:
                P.warn(blk.start + 1, 'module header with routine/table tags: %s' % ' '.join(sorted('@' + x for x in misuse)))
        elif lab is not None and lab.kind == 'data':
            misuse = names & (ROUTINE_ONLY | HEADER_ONLY)
            if misuse:
                P.warn(blk.start + 1, 'table block %s with routine/header tags: %s' % (lab.name, ' '.join(sorted('@' + x for x in misuse))))
        elif lab is not None:
            misuse = names & (TABLE_ONLY | HEADER_ONLY)
            if misuse:
                P.warn(blk.start + 1, 'routine block %s with table/header tags: %s' % (lab.name, ' '.join(sorted('@' + x for x in misuse))))
        if P.is_script and not header and lab is not None:
            P.warn(blk.start + 1, 'AI script files only take one module header block; block above %s is not needed' % lab.name)
    if verify_calls:
        verify_call_tags(P)


def verify_call_tags(P):
    """Compare @calls with the JSR/JSL/JMP/JML targets found in the routine body (warnings)."""
    labs = [l for l in P.labels if l.kind == 'code']
    lines = P.lines
    order = sorted(P.labels, key=lambda l: l.line)
    for lab in labs:
        if lab.block is None or not lab.block.has('calls'):
            continue
        end = len(lines)
        for o in order:
            if o.line > lab.line and o.kind == 'code' and not o.inner:
                end = o.line - 1
                break
        body = '\n'.join(lines[lab.line - 1:end])
        targets = set(re.findall(r'\b(?:JSR|JSL|JMP|JML)(?:\.[BWLbwl])?\s+\(?\[?([A-Za-z_]\w*)', body, re.I))
        listed = set(list_names(lab.block.get('calls')))
        for nm in sorted(listed - targets):
            if not re.search(r'\b%s\b' % re.escape(nm), body):
                P.warn(lab.line, '%s: @calls lists %s but the routine body never references it' % (lab.name, nm))
        for nm in sorted(t for t in targets - listed if t.startswith(('f', 'sub'))):
            P.warn(lab.line, '%s: calls %s which is missing from @calls' % (lab.name, nm))


# ----------------------------------------------------------------------------- commands

def fmt_pct(d, key='documented'):
    return '%d/%d' % (d[key], d['total']) if d['total'] else '-'


def cmd_report(repo, args):
    names = repo.select(args.files)
    stats = [file_stats(repo, repo.files[r]) for r in names]
    t = totals_of(stats)
    t['coverage_percent'] = round(overall(t), 1)

    def cov(s):
        den = s['routines']['total'] + s['tables']['total'] + 1
        num = s['routines']['documented'] + s['tables']['documented'] + (1 if s['header'] else 0)
        return ratio(num, den)

    if args.sort == 'coverage':
        stats.sort(key=lambda s: (cov(s), s['file']))
    elif args.sort == 'missing':
        stats.sort(key=lambda s: (-(s['routines']['total'] - s['routines']['documented'] + s['tables']['total'] - s['tables']['documented']), s['file']))
    else:
        stats.sort(key=lambda s: s['file'])
    if args.json:
        json.dump({'files': stats, 'totals': t}, sys.stdout, indent=2)
        sys.stdout.write('\n')
        return 0
    w = max([len(s['file']) for s in stats] + [10])
    print('%-*s  %6s  %10s  %10s  %10s' % (w, 'file', 'header', 'routines', 'tables', 'fields'))
    for s in stats:
        kind = 'script' if s['script'] else ''
        print('%-*s  %6s  %10s  %10s  %10s %s' % (
            w, s['file'], 'yes' if s['header'] else 'no', fmt_pct(s['routines']), fmt_pct(s['tables']),
            fmt_pct(s['fields'], 'commented'), kind))
    print('-' * (w + 52))
    print('%-*s  %6s  %10s  %10s  %10s' % (
        w, 'TOTAL (%d files)' % t['files'], fmt_pct(t['headers']), fmt_pct(t['routines']), fmt_pct(t['tables']),
        fmt_pct(t['fields'], 'commented')))
    print('Routines %.1f%%, tables %.1f%%, module headers %.1f%%, RAM/struct fields with a comment %.1f%%; '
          'overall (routines+tables+headers) %.1f%%; %d inner (fall-through) labels not counted as missing.' % (
              ratio(t['routines']['documented'], t['routines']['total']), ratio(t['tables']['documented'], t['tables']['total']),
              ratio(t['headers']['documented'], t['headers']['total']), ratio(t['fields']['commented'], t['fields']['total']),
              overall(t), t['inner_labels']))
    if t['errors']:
        print('%d documentation syntax error(s): run "doclint.py check".' % t['errors'])
    return 0


def annotate(args, level, rel, line, msg):
    if args.github:
        return '::%s file=%s,line=%d::%s' % (level, rel, line, msg.replace('%', '%25').replace('\n', '%0A'))
    return '%s:%d: %s: %s' % (rel, line, level, msg)


def cmd_check(repo, args):
    names = repo.select(args.files)
    nerr = 0
    nwarn_missing = 0
    shown_warn = 0
    miss_msgs = []
    for r in names:
        P = repo.files[r]
        block_diagnostics(repo, P, args.verify_calls)
        for line, msg in P.errors:
            print(annotate(args, 'error', r, line, msg))
            nerr += 1
        for line, msg in P.warnings:
            if shown_warn < args.max_warnings or args.verbose:
                print(annotate(args, 'warning', r, line, msg))
            shown_warn += 1
        if P.header is None or not P.header.has('brief'):
            miss_msgs.append((r, 1, 'module has no @file header block'))
        if not P.is_script:
            for l in P.labels:
                if l.kind in ('code', 'data') and not l.documented and (l.kind == 'data' or not l.inner):
                    miss_msgs.append((r, l.line, '%s %s is not documented' % ('routine' if l.kind == 'code' else 'table', l.name)))
    for r, line, msg in miss_msgs:
        if args.require_all:
            print(annotate(args, 'error', r, line, msg))
            nerr += 1
        elif args.verbose:
            print(annotate(args, 'warning', r, line, msg))
    nwarn_missing = len(miss_msgs)
    stats = [file_stats(repo, repo.files[r]) for r in names]
    t = totals_of(stats)
    cov = overall(t)
    if args.min_coverage is not None and cov < args.min_coverage:
        print('error: overall documentation coverage %.1f%% is below the required %.1f%%' % (cov, args.min_coverage))
        nerr += 1
    nw = sum(len(repo.files[r].warnings) for r in names)
    print('doclint check: %d file(s), %d syntax error(s), %d warning(s) in existing blocks, %d undocumented item(s) '
          '(coverage %.1f%%)%s' % (len(names), sum(len(repo.files[r].errors) for r in names), nw, nwarn_missing, cov,
                                  '' if args.verbose or not nwarn_missing else '; use -v to list them or "todo --file F"'))
    return 1 if nerr else 0


def cmd_todo(repo, args):
    names = repo.select([args.file])
    P = repo.files[names[0]]
    items = []
    if P.header is None or not P.header.has('brief'):
        items.append({'line': 1, 'kind': 'header', 'name': '(module header: @file/@brief/@bank/@range)'})
    if not P.is_script:
        for l in P.labels:
            if l.kind not in ('code', 'data') or l.documented:
                continue
            if l.kind == 'code' and l.inner and not args.all:
                continue
            items.append({'line': l.line, 'kind': 'routine' if l.kind == 'code' else 'table', 'name': l.name,
                          'inner': l.inner})
    if args.json:
        json.dump({'file': names[0], 'todo': items}, sys.stdout, indent=2)
        sys.stdout.write('\n')
        return 0
    print('# %s: %d undocumented item(s)%s' % (names[0], len(items), '' if args.all else ' (inner fall-through labels hidden, --all shows them)'))
    for it in items:
        print('%6d  %-8s %s%s' % (it['line'], it['kind'], it['name'], '  (inner)' if it.get('inner') else ''))
    return 0


def main(argv=None):
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument('--root', default=str(ROOT), help='repository root (default: this repository)')
    sub = ap.add_subparsers(dest='cmd', required=True)
    r = sub.add_parser('report', help='coverage per file and totals')
    r.add_argument('--json', action='store_true')
    r.add_argument('--sort', choices=('path', 'coverage', 'missing'), default='path')
    r.add_argument('files', nargs='*')
    c = sub.add_parser('check', help='syntax errors fail; missing docs are warnings')
    c.add_argument('--require-all', action='store_true', help='missing documentation is an error')
    c.add_argument('--min-coverage', type=float, default=None, metavar='N', help='fail below N percent overall coverage')
    c.add_argument('--verify-calls', action='store_true', help='compare @calls with the JSR/JSL/JMP targets in the code')
    c.add_argument('--github', action='store_true', default=bool(os.environ.get('GITHUB_ACTIONS')),
                   help='emit GitHub annotations (default inside GitHub Actions)')
    c.add_argument('--max-warnings', type=int, default=30, help='warnings printed without -v (default 30)')
    c.add_argument('-v', '--verbose', action='store_true')
    c.add_argument('files', nargs='*')
    t = sub.add_parser('todo', help='undocumented labels of one file')
    t.add_argument('--file', required=True)
    t.add_argument('--all', action='store_true', help='also list inner fall-through labels')
    t.add_argument('--json', action='store_true')
    args = ap.parse_args(argv)
    repo = Repo(args.root).load()
    return {'report': cmd_report, 'check': cmd_check, 'todo': cmd_todo}[args.cmd](repo, args)


if __name__ == '__main__':
    sys.exit(main())
