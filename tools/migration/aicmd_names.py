#!/usr/bin/env python3
"""Jednorazowa migracja: nazwy i komentarze makr AICMD na podstawie docs/ai/commands/*.yml.

Reguly (zmiany nie wplywaja na wygenerowane bajty):
  * komentarz nad makrem  <- 'summary' z YAML + poziom pewnosci;
  * nazwy parametrow      <- z YAML, tylko dla komend 'confirmed' (wywolania sa pozycyjne);
  * nazwa makra           <- tylko dla makr BEZ sufiksu, gdy komenda 'confirmed' i ma suggested_name;
                             wywolania w src/ai/*/ sa aktualizowane tekstowo;
  * AICMD0x04_Emtpy       -> AICMD0x04_Nop (literowka).
Aliasy 0x26/0x27 (emituja bajt $28) dostaja sufiks ClearBitAs0x28.
Uzycie: python tools/migration/aicmd_names.py [--dry]
"""
import re, sys, glob
from pathlib import Path
import yaml

ROOT = Path(__file__).resolve().parents[2]
dry = '--dry' in sys.argv
docs = {}
for p in sorted(glob.glob(str(ROOT / 'docs/ai/commands/part*.yml'))):
    for e in yaml.safe_load(open(p, encoding='utf-8')):
        op = e['opcode'] if isinstance(e['opcode'], int) else int(str(e['opcode']), 16)
        docs[op] = e

cmd_path = ROOT / 'src/ai/commands.asm'
text = cmd_path.read_text()
BLOCK = re.compile(r'(?P<c>; AI command 0x(?P<op>[0-9A-F]{2})[^\n]*\n)macro (?P<name>AICMD0x[0-9A-F]{2}(?P<suf>_\w+)?)\((?P<params>[^)]*)\)(?P<body>.*?)endmacro', re.S)
renames = {}   # stare -> nowe nazwy makr


def one_line(s):
    return re.sub(r'\s+', ' ', str(s)).strip()


def repl(m):
    op = int(m.group('op'), 16)
    d = docs.get(op)
    if not d:
        return m.group(0)
    name, params, body = m.group('name'), m.group('params'), m.group('body')
    plist = [p.strip() for p in params.split(',') if p.strip()]
    conf = d.get('confidence')
    if conf == 'confirmed':
        ynames = [p['name'] for p in d.get('params') or []]
        if len(ynames) == len(plist):
            for old, new in zip(plist, ynames):
                if old != new and re.fullmatch(r'[A-Za-z_]\w*', new):
                    body = body.replace(f'<{old}>', f'<{new}>')
            plist = ynames
    new_name = name
    if op == 0x04:
        new_name = 'AICMD0x04_Nop'
    elif op in (0x26, 0x27):
        new_name = f'AICMD0x{op:02X}_ClearBitAs0x28'
    elif m.group('suf') is None and conf == 'confirmed' and d.get('suggested_name'):
        new_name = f"{name}_{d['suggested_name']}"
    if new_name != name:
        renames[name] = new_name
    comment = f"; AI command 0x{op:02X} - {one_line(d.get('summary', ''))} [{conf}]\n"
    return f"{comment}macro {new_name}({', '.join(plist)}){body}endmacro"


new_text = BLOCK.sub(repl, text)
print(f'makra zmienione: {len(renames)}')
for k, v in renames.items():
    print(f'  {k} -> {v}')
if dry:
    sys.exit(0)
cmd_path.write_text(new_text)

# wywolania w skryptach wszystkich regionow
n = 0
for f in (ROOT / 'src/ai').rglob('bank_B*.asm'):
    s = f.read_text(); o = s
    for old, new in renames.items():
        s = re.sub(r'%' + re.escape(old) + r'\(', '%' + new + '(', s)
    if s != o:
        f.write_text(s); n += 1
print(f'zaktualizowano pliki skryptow: {n}')

# pole macro w YAML
for p in glob.glob(str(ROOT / 'docs/ai/commands/part*.yml')):
    s = Path(p).read_text(encoding='utf-8'); o = s
    for old, new in renames.items():
        s = re.sub(r'(?m)^(\s*macro:\s*)' + re.escape(old) + r'\b', r'\g<1>' + new, s)
    if s != o:
        Path(p).write_text(s, encoding='utf-8')
