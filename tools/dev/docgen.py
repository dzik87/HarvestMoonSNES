#!/usr/bin/env python3
"""Generate a browsable reference (HTML or Markdown) from the documentation blocks in src/**/*.asm.

Doxygen cannot parse assembler, so this tiny generator reads the blocks with the parser of doclint.py
(standard: docs/code-documentation.md) and writes, without any external program:

  index.html     one line per module (header brief, bank/range, coverage), links to the module pages
  symbols.html   alphabetical index of every code and data label (documented ones with their @brief)
  <module>.html  one page per source file: module header, routines and tables with their tags,
                 cross-links for @calls / @callers / @used_by / @see, a "called by" list derived from the
                 @calls of the other routines, and the list of still undocumented labels

Usage: python3 tools/dev/docgen.py [--out build/docs] [--format html|md] [--root DIR] [FILE...]
The output directory (default build/docs/) is git-ignored; open build/docs/index.html in a browser.
"""
import argparse
import html
import re
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import doclint  # noqa: E402

TAG_ORDER = ['case', 'mode', 'param', 'return', 'modifies', 'clobbers', 'stack', 'calls', 'callers', 'region',
             'format', 'index', 'used_by', 'see', 'confidence', 'note']
TAG_TITLE = {'case': 'Case', 'mode': 'Mode (entry -> exit)', 'param': 'Parameters', 'return': 'Returns',
             'modifies': 'Modifies (RAM)', 'clobbers': 'Clobbers', 'stack': 'Stack', 'calls': 'Calls',
             'callers': 'Callers (declared)', 'region': 'Region differences', 'format': 'Format', 'index': 'Index',
             'used_by': 'Used by', 'see': 'See also', 'confidence': 'Confidence', 'note': 'Notes'}
LINKED = {'calls', 'callers', 'used_by', 'see', 'modifies'}
NAME_RE = re.compile(r'!?[A-Za-z_][A-Za-z0-9_]*(?:\.[A-Za-z_][A-Za-z0-9_]*)*')
ADDR_RE = re.compile(r';([0-9A-F]{6})\|')


def page_name(rel, ext):
    stem = rel[4:] if rel.startswith('src/') else rel
    stem = re.sub(r'\.asm$', '', stem)
    return re.sub(r'[^A-Za-z0-9_.-]+', '_', stem) + '.' + ext


class Item:
    def __init__(self, label, P, page):
        self.label, self.P, self.page = label, P, page
        self.name, self.kind = label.name, 'table' if label.kind == 'data' else 'routine'
        self.block = label.block if label.documented else None
        self.addr = ''
        for ln in P.lines[label.line - 1:label.line + 4]:
            m = ADDR_RE.search(ln)
            if m:
                self.addr = '$' + m.group(1)
                break

    @property
    def brief(self):
        return self.block.get('brief').replace('\n', ' ') if self.block else ''


def collect(repo, names, ext):
    modules = []
    index = {}
    for rel in names:
        P = repo.files[rel]
        doclint.block_diagnostics(repo, P)
        page = page_name(rel, ext)
        items = []
        if not P.is_script:
            for l in P.labels:
                if l.kind in ('code', 'data') and (not l.inner or l.documented):
                    it = Item(l, P, page)
                    items.append(it)
                    index[it.name] = it
        modules.append({'rel': rel, 'P': P, 'page': page, 'items': items, 'stats': doclint.file_stats(repo, P)})
    callers = {}
    for it in index.values():
        if it.block:
            for nm in doclint.list_names(it.block.get('calls')):
                callers.setdefault(nm, set()).add(it.name)
    return modules, index, callers


# ----------------------------------------------------------------------------- rendering helpers

def split_param(text):
    parts = text.split(None, 1)
    return (parts[0], parts[1] if len(parts) > 1 else '') if parts else ('', '')


class Html:
    ext = 'html'

    def __init__(self, index):
        self.index = index

    def esc(self, s):
        return html.escape(s, quote=True)

    def inline(self, text):
        out = self.esc(text)
        return re.sub(r'`([^`]+)`', r'<code>\1</code>', out)

    def link(self, name, from_page):
        it = self.index.get(name)
        if not it:
            return None
        href = ('' if it.page == from_page else it.page) + '#' + name
        return '<a href="%s">%s</a>' % (self.esc(href), self.esc(name))

    def linkify(self, text, from_page):
        res, pos = [], 0
        for m in NAME_RE.finditer(text):
            res.append(self.inline(text[pos:m.start()]))
            tok = m.group(0)
            base = tok.lstrip('!').split('.')[0]
            a = self.link(base, from_page) if base == tok.lstrip('!') else None
            res.append(a if a else self.esc(tok))
            pos = m.end()
        res.append(self.inline(text[pos:]))
        return ''.join(res)

    def paragraphs(self, text):
        out = []
        for para in re.split(r'\n\s*\n', text.strip()):
            if para.strip():
                out.append('<p>%s</p>' % self.inline(para.strip()).replace('\n', '\n'))
        return '\n'.join(out)

    def item(self, it, callers, from_page):
        o = []
        o.append('<section class="item" id="%s">' % self.esc(it.name))
        meta = ' &middot; '.join(x for x in (it.kind, it.addr, 'line %d' % it.label.line) if x)
        o.append('<h3>%s <small>%s</small></h3>' % (self.esc(it.name), meta))
        o.append('<p class="brief">%s</p>' % self.inline(it.brief))
        details = it.block.get('details')
        if details:
            o.append(self.paragraphs(details))
        rows = []
        for tag in TAG_ORDER:
            tags = it.block.all(tag)
            if not tags:
                continue
            if tag in ('param', 'return'):
                inner = ''.join('<tr><td><code>%s</code></td><td>%s</td></tr>' % (
                    self.esc(split_param(t.text)[0]), self.inline(split_param(t.text)[1].replace('\n', ' '))) for t in tags)
                rows.append('<dt>%s</dt><dd><table class="params">%s</table></dd>' % (TAG_TITLE[tag], inner))
            elif tag in LINKED:
                inner = '<br>'.join(self.linkify(t.text, from_page).replace('\n', ' ') for t in tags)
                rows.append('<dt>%s</dt><dd>%s</dd>' % (TAG_TITLE[tag], inner))
            else:
                inner = '<br>'.join(self.inline(t.text).replace('\n', '<br>') for t in tags)
                rows.append('<dt>%s</dt><dd>%s</dd>' % (TAG_TITLE[tag], inner))
        derived = sorted(callers.get(it.name, ()))
        if derived:
            rows.append('<dt>Called by (from @calls)</dt><dd>%s</dd>' % ', '.join(
                self.link(n, from_page) or self.esc(n) for n in derived))
        if rows:
            o.append('<dl>%s</dl>' % ''.join(rows))
        o.append('</section>')
        return '\n'.join(o)

    def page(self, title, body, root_link=True):
        css = ('body{font-family:system-ui,sans-serif;max-width:60em;margin:1.5em auto;padding:0 1em;color:#222}'
               'code{background:#f2f2f2;padding:0 .2em}section.item{border-top:1px solid #ccc;margin-top:1.2em}'
               'h3 small{font-weight:normal;color:#666;font-size:.65em}p.brief{font-weight:600}'
               'dl{display:grid;grid-template-columns:12em 1fr;gap:.2em 1em}dt{color:#555}dd{margin:0}'
               'table{border-collapse:collapse}td,th{padding:.15em .6em;border-bottom:1px solid #eee;text-align:left;vertical-align:top}'
               'table.params td:first-child{white-space:nowrap}.todo{color:#777}')
        nav = '<p><a href="index.html">Modules</a> &middot; <a href="symbols.html">Symbol index</a></p>' if root_link else ''
        return ('<!DOCTYPE html>\n<html lang="en"><head><meta charset="utf-8"><title>%s</title><style>%s</style></head>'
                '<body>%s<h1>%s</h1>\n%s\n</body></html>\n' % (self.esc(title), css, nav, self.esc(title), body))

    def module(self, m, callers):
        P, o = m['P'], []
        hdr = P.header
        if hdr:
            o.append('<p class="brief">%s</p>' % self.inline(hdr.get('brief')))
            facts = []
            if hdr.has('bank'):
                facts.append('bank %s' % hdr.get('bank'))
            if hdr.has('range'):
                facts.append('range %s' % hdr.get('range'))
            if facts:
                o.append('<p>%s</p>' % self.esc(', '.join(facts)))
            if hdr.get('details'):
                o.append(self.paragraphs(hdr.get('details')))
            if hdr.has('see'):
                o.append('<p>See also: %s</p>' % self.linkify(hdr.get('see'), m['page']))
        else:
            o.append('<p class="todo">No module header (@file block) yet.</p>')
        o.append('<p class="todo">%s &middot; documented: routines %s, tables %s</p>' % (
            self.esc(m['rel']), doclint.fmt_pct(m['stats']['routines']), doclint.fmt_pct(m['stats']['tables'])))
        done = [it for it in m['items'] if it.block]
        todo = [it for it in m['items'] if not it.block]
        if done:
            o.append('<h2>Contents</h2><ul>%s</ul>' % ''.join(
                '<li><a href="#%s">%s</a> &ndash; %s</li>' % (self.esc(i.name), self.esc(i.name), self.inline(i.brief)) for i in done))
            for it in done:
                o.append(self.item(it, callers, m['page']))
        if todo:
            o.append('<h2>Undocumented labels</h2><p class="todo">%s</p>' % ', '.join(
                '<span id="%s">%s</span>' % (self.esc(i.name), self.esc(i.name)) for i in todo))
        return self.page(m['rel'], '\n'.join(o))

    def index_page(self, modules, totals):
        rows = []
        for m in modules:
            s, hdr = m['stats'], m['P'].header
            rows.append('<tr><td><a href="%s">%s</a></td><td>%s</td><td>%s</td><td>%s</td><td>%s</td></tr>' % (
                self.esc(m['page']), self.esc(m['rel']), self.inline(hdr.get('brief').replace('\n', ' ')) if hdr else '',
                self.esc(hdr.get('bank')) if hdr else '', doclint.fmt_pct(s['routines']), doclint.fmt_pct(s['tables'])))
        body = ('<p>%s</p><table><tr><th>Module</th><th>Description</th><th>Bank</th><th>Routines</th><th>Tables</th></tr>%s</table>' % (
            self.esc(totals), ''.join(rows)))
        return self.page('Harvest Moon SNES source reference', body, root_link=False)

    def symbols_page(self, index):
        rows = []
        for name in sorted(index, key=str.lower):
            it = index[name]
            rows.append('<tr><td><a href="%s#%s">%s</a></td><td>%s</td><td>%s</td><td>%s</td></tr>' % (
                self.esc(it.page), self.esc(name), self.esc(name), it.kind, self.esc(it.addr), self.inline(it.brief)))
        return self.page('Symbol index', '<table><tr><th>Label</th><th>Kind</th><th>Address</th><th>Brief</th></tr>%s</table>' % ''.join(rows))


class Markdown:
    ext = 'md'

    def __init__(self, index):
        self.index = index

    def link(self, name, from_page):
        it = self.index.get(name)
        if not it:
            return None
        return '[%s](%s#%s)' % (name, '' if it.page == from_page else it.page, name.lower())

    def linkify(self, text, from_page):
        def sub(m):
            tok = m.group(0)
            a = self.link(tok.lstrip('!'), from_page) if '.' not in tok else None
            return a or tok
        return NAME_RE.sub(sub, text)

    def item(self, it, callers, from_page):
        o = ['', '<a id="%s"></a>' % it.name.lower(), '### %s' % it.name, '',
             '*%s%s, line %d*' % (it.kind, ', ' + it.addr if it.addr else '', it.label.line), '', '**%s**' % it.brief, '']
        if it.block.get('details'):
            o += [it.block.get('details'), '']
        for tag in TAG_ORDER:
            tags = it.block.all(tag)
            if not tags:
                continue
            o.append('- **%s**' % TAG_TITLE[tag])
            for t in tags:
                txt = t.text.replace('\n', ' ')
                if tag in ('param', 'return'):
                    a, b = split_param(txt)
                    o.append('  - `%s` %s' % (a, b))
                elif tag in LINKED:
                    o.append('  - ' + self.linkify(txt, from_page))
                else:
                    o.append('  - ' + txt)
        derived = sorted(callers.get(it.name, ()))
        if derived:
            o.append('- **Called by (from @calls)**: ' + ', '.join(self.link(n, from_page) or n for n in derived))
        return '\n'.join(o)

    def module(self, m, callers):
        P, hdr = m['P'], m['P'].header
        o = ['# %s' % m['rel'], '']
        if hdr:
            o += [hdr.get('brief'), '']
            facts = [x for x in ('bank ' + hdr.get('bank') if hdr.has('bank') else '', 'range ' + hdr.get('range') if hdr.has('range') else '') if x]
            if facts:
                o += [', '.join(facts), '']
            if hdr.get('details'):
                o += [hdr.get('details'), '']
        else:
            o += ['*No module header (@file block) yet.*', '']
        o += ['Documented: routines %s, tables %s' % (doclint.fmt_pct(m['stats']['routines']), doclint.fmt_pct(m['stats']['tables'])), '']
        done = [i for i in m['items'] if i.block]
        todo = [i for i in m['items'] if not i.block]
        for it in done:
            o.append('- [%s](#%s) - %s' % (it.name, it.name.lower(), it.brief))
        for it in done:
            o.append(self.item(it, callers, m['page']))
        if todo:
            o += ['', '## Undocumented labels', '', ', '.join('<a id="%s"></a>%s' % (i.name.lower(), i.name) for i in todo)]
        return '\n'.join(o) + '\n'

    def index_page(self, modules, totals):
        o = ['# Harvest Moon SNES source reference', '', totals, '', '| Module | Description | Bank | Routines | Tables |', '|---|---|---|---|---|']
        for m in modules:
            s, hdr = m['stats'], m['P'].header
            o.append('| [%s](%s) | %s | %s | %s | %s |' % (m['rel'], m['page'], hdr.get('brief').replace('\n', ' ') if hdr else '',
                                                         hdr.get('bank') if hdr else '', doclint.fmt_pct(s['routines']), doclint.fmt_pct(s['tables'])))
        return '\n'.join(o) + '\n'

    def symbols_page(self, index):
        o = ['# Symbol index', '', '| Label | Kind | Address | Brief |', '|---|---|---|---|']
        for name in sorted(index, key=str.lower):
            it = index[name]
            o.append('| [%s](%s#%s) | %s | %s | %s |' % (name, it.page, name.lower(), it.kind, it.addr, it.brief))
        return '\n'.join(o) + '\n'


def generate(root, out, fmt='html', files=None):
    """Write the reference; returns the list of written paths."""
    repo = doclint.Repo(root).load()
    names = repo.select(files or [])
    ext = 'html' if fmt == 'html' else 'md'
    modules, index, callers = collect(repo, names, ext)
    R = Html(index) if fmt == 'html' else Markdown(index)
    t = doclint.totals_of([m['stats'] for m in modules])
    totals = 'Coverage: routines %s, tables %s, module headers %s (overall %.1f%%).' % (
        doclint.fmt_pct(t['routines']), doclint.fmt_pct(t['tables']), doclint.fmt_pct(t['headers']), doclint.overall(t))
    out = Path(out)
    out.mkdir(parents=True, exist_ok=True)
    written = []

    def emit(name, text):
        p = out / name
        p.write_text(text, encoding='utf-8')
        written.append(p)

    emit('index.' + ext, R.index_page(modules, totals))
    emit('symbols.' + ext, R.symbols_page(index))
    for m in modules:
        emit(m['page'], R.module(m, callers))
    return written


def main(argv=None):
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument('--root', default=str(doclint.ROOT))
    ap.add_argument('--out', default=None, help='output directory (default: <root>/build/docs)')
    ap.add_argument('--format', choices=('html', 'md'), default='html')
    ap.add_argument('files', nargs='*', help='limit to these source files (default: all of src/)')
    a = ap.parse_args(argv)
    out = a.out or str(Path(a.root) / 'build' / 'docs')
    written = generate(a.root, out, a.format, a.files)
    print('docgen: wrote %d page(s) to %s (open %s)' % (len(written), out, Path(out) / ('index.' + ('html' if a.format == 'html' else 'md'))))
    return 0


if __name__ == '__main__':
    sys.exit(main())
