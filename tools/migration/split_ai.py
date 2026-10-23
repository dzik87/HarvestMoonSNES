#!/usr/bin/env python3
"""Jednorazowa migracja: dzieli src/ai/<region>/bank_B3..B5.asm na pliki per skrypt.

Granice = etykiety wejsciowe skryptow (pAIScripting0xNN[_Nazwa]). Poczatek banku (ORG, tabele
wskaznikow) trafia do pliku 'head_B3.asm' itd. Podzial jest bezstratny: konkatenacja plikow
(w kolejnosci) daje dokladnie dawny plik banku. Generuje tez plik include 'scripts.asm'.

Uzycie: python tools/migration/split_ai.py src/ai/us
"""
import re, sys
from pathlib import Path

d = Path(sys.argv[1])
ENTRY = re.compile(r'^pAIScripting0x([0-9A-F]{2})(_(?!L\d{3}:)\w+)?:')
includes = []
for bank in ('B3', 'B4', 'B5'):
    src = d / f'bank_{bank}.asm'
    text = src.read_text()
    lines = text.split('\n')
    starts = [i for i, l in enumerate(lines) if ENTRY.match(l) and not re.search(r'_L\d{3}:', l)]
    cuts = []
    for i in starts:
        j = i
        while j > 0 and (lines[j - 1].strip() == '' or lines[j - 1].lstrip().startswith(';')):
            j -= 1
        cuts.append(j)
    bounds = [0] + cuts + [len(lines)]
    names = [f'head_{bank}'] + [
        'script_' + ENTRY.match(lines[i]).group(1) + (ENTRY.match(lines[i]).group(2) or '') for i in starts]
    out = d / 'scripts'
    out.mkdir(exist_ok=True)
    parts = []
    for k, name in enumerate(names):
        body = '\n'.join(lines[bounds[k]:bounds[k + 1]])
        if k + 1 < len(names) and not body.endswith('\n'): body += '\n'
        parts.append(body)
        (out / f'{name}.asm').write_text(body)
        includes.append(f'scripts/{name}.asm')
    joined = ''.join(parts)
    assert joined == text, f'podzial banku {bank} nie jest bezstratny'
    src.unlink()
    print(f'{bank}: {len(names)} plikow')
(d / 'scripts.asm').write_text('; Skrypty AI - kolejnosc plikow odpowiada kolejnosci w ROM.\n' + ''.join(f'    incsrc "{p}"\n' for p in includes))
print('OK, include:', d / 'scripts.asm')
