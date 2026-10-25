#!/usr/bin/env python3
"""One-off migration: splits src/ai/<region>/bank_B3..B5.asm into per-script files.

Boundaries = script entry labels (pAIScripting0xNN[_Name]). The start of a bank (ORG, pointer
tables) goes to 'head_B3.asm' etc. The split is lossless: concatenating the files
(in order) gives exactly the former bank file. Also generates the include file 'scripts.asm'.

Usage: python tools/migration/split_ai.py src/ai/us
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
    print(f'{bank}: {len(names)} files')
(d / 'scripts.asm').write_text('; Skrypty AI - kolejnosc plikow odpowiada kolejnosci w ROM.\n' + ''.join(f'    incsrc "{p}"\n' for p in includes))
print('OK, include:', d / 'scripts.asm')
