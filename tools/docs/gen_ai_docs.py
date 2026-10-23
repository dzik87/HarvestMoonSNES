#!/usr/bin/env python3
"""Generuje docs/ai/commands.md z docs/ai/commands/part*.yml + statystyk uzycia w skryptach.

Zrodlem opisow sa pliki YAML (analiza handlerow interpretera w banku $84). Generator dodaje:
liczbe wywolan, liczbe skryptow uzywajacych komendy, przyklady z prawdziwych skryptow oraz
kontrole zgodnosci (nazwa makra / liczba parametrow wzgledem src/ai/commands.asm).

Uzycie: python tools/docs/gen_ai_docs.py [--region us]
"""
import re, sys, glob, collections
from pathlib import Path
import yaml

ROOT = Path(__file__).resolve().parents[2]
region = sys.argv[sys.argv.index('--region') + 1] if '--region' in sys.argv else 'us'

# --- makra
macros = {}
for m in re.finditer(r'macro (AICMD0x([0-9A-F]{2})\w*)\(([^)]*)\)', (ROOT / 'src/ai/commands.asm').read_text()):
    macros[int(m.group(2), 16)] = (m.group(1), [a.strip() for a in m.group(3).split(',') if a.strip()])

# --- uzycie
CALL = re.compile(r'^\s*%(AICMD0x([0-9A-F]{2})\w*)\((.*)\)\s*;([0-9A-F]{6})')
LABEL = re.compile(r'^([A-Za-z_]\w*):')
usage = collections.Counter(); scripts = collections.defaultdict(set); examples = collections.defaultdict(list)
for f in sorted((ROOT / 'src/ai' / region).glob('bank_B*.asm')):
    owner = None
    for l in f.read_text().split('\n'):
        mm = LABEL.match(l)
        if mm and not re.search(r'_L\d{3}$', mm.group(1)) and not re.match(r'^[A-Z]+\d*_[0-9A-F]{6}$', mm.group(1)):
            owner = mm.group(1)
        c = CALL.match(l)
        if c:
            op = int(c.group(2), 16)
            usage[op] += 1; scripts[op].add(owner)
            if len(examples[op]) < 2 and all(c.group(3) != e[0] for e in examples[op]):
                examples[op].append((c.group(3), owner, c.group(4)))

# --- opisy
docs = {}
for p in sorted((ROOT / 'docs/ai/commands').glob('part*.yml')):
    for e in yaml.safe_load(p.read_text()) or []:
        op = e['opcode'] if isinstance(e['opcode'], int) else int(str(e['opcode']), 16)
        docs[op] = e

lines = ['# Komendy skryptów AI (AICMD)', '',
         'Dokument generowany przez `tools/docs/gen_ai_docs.py` z `docs/ai/commands/*.yml`.',
         'Opisy pochodzą z analizy handlerów interpretera (`src/code/bank_84/ai_engine.asm`);',
         'pole *pewność* mówi, jak jednoznacznie wynika to z kodu. Statystyki: skrypty regionu `%s`.' % region.upper(), '']
cnt = collections.Counter(docs[o].get('confidence', '?') for o in docs)
lines += ['Pewność opisów: ' + ', '.join(f'{k}: {v}' for k, v in sorted(cnt.items())), '',
          '| Opcode | Makro | Nazwa | Pewność | Długość | Wywołań | Skryptów |', '|---|---|---|---|---|---|---|']
issues = []
for op in sorted(set(macros) | set(docs)):
    d = docs.get(op, {})
    mname = macros.get(op, ('(brak makra)', []))[0]
    lines.append(f"| 0x{op:02X} | `{mname}` | {d.get('suggested_name') or '—'} | {d.get('confidence', 'brak opisu')} | "
                 f"{d.get('length_bytes', '?')} | {usage[op]} | {len(scripts[op])} |")
    if op in docs and op in macros:
        if d.get('macro') != macros[op][0]:
            issues.append(f'0x{op:02X}: nazwa makra w YAML ({d.get("macro")}) != commands.asm ({macros[op][0]})')
        if len(d.get('params') or []) != len(macros[op][1]):
            issues.append(f'0x{op:02X}: liczba parametrow YAML {len(d.get("params") or [])} != makro {len(macros[op][1])}')
    if op not in docs: issues.append(f'0x{op:02X}: brak opisu YAML')
lines.append('')
for op in sorted(docs):
    d = docs[op]
    lines += [f"## 0x{op:02X} — {d.get('suggested_name') or d.get('macro')}", '',
              f"- Makro: `{d.get('macro')}` · handler: `{d.get('handler')}` (${d.get('handler_addr')}) · pewność: **{d.get('confidence')}**",
              f"- Długość: {d.get('length_bytes')} B · użycie: {usage[op]} wywołań w {len(scripts[op])} skryptach", '',
              str(d.get('summary', '')), '']
    if d.get('params'):
        lines += ['| Parametr | Offset | Rozmiar | Typ | Znaczenie |', '|---|---|---|---|---|']
        for p in d['params']:
            lines.append(f"| `{p.get('name')}` | {p.get('offset')} | {p.get('size')} | {p.get('type')} | {p.get('meaning')} |")
        lines.append('')
    if d.get('details'): lines += [str(d['details']).strip(), '']
    if d.get('ram_touched'): lines += ['RAM: ' + ', '.join(f'`{x}`' for x in d['ram_touched']), '']
    if d.get('calls'): lines += ['Wywołuje: ' + ', '.join(f'`{x}`' for x in d['calls']), '']
    if d.get('open_questions'): lines += [f"> Otwarte pytania: {d['open_questions']}", '']
    if examples[op]:
        lines += ['Przykłady z skryptów:', '```']
        lines += [f"%{macros[op][0] if op in macros else d.get('macro')}({a})   ; {o} @ ${ad}" for a, o, ad in examples[op]]
        lines += ['```', '']
out = ROOT / 'docs/ai/commands.md'
out.write_text('\n'.join(lines) + '\n')
print(f'zapisano {out} ({len(docs)} opisanych komend, {len(macros)} makr)')
for i in issues: print('UWAGA', i)
