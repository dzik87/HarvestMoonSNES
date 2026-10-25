"""Source <-> ROM address map of the code modules in src/code/bank_80..85 (helper for the region tools).

Every source line gets a ROM address range [start, end) taken from the `;ADDR|BYTES|TARGET;` comments that
DiztinGUIsh left on instruction and data lines. Lines without a comment (labels, blank lines, `%macro(...)`
invocations) get the range between their neighbours. `pad` lines are treated as zero-length.
"""
import re
from pathlib import Path

from disasm65816 import _OPS, decode, lorom_off

ROOT = Path(__file__).resolve().parent.parent.parent
CODE_DIR = ROOT / "src" / "code"
MODULE_ORDER = [
    "bank_80/core.asm", "bank_80/palette.asm", "bank_80/routines.asm", "bank_80/tilemaps.asm",
    "bank_80/audio_data.asm", "bank_80/data_tables.asm",
    "bank_81/item_actions.asm", "bank_81/items_misc.asm", "bank_81/player_actions.asm", "bank_81/player_update.asm",
    "bank_82/game_events.asm", "bank_82/tools.asm", "bank_82/object_map.asm", "bank_82/sound.asm",
    "bank_82/object_data.asm", "bank_82/interaction_data.asm", "bank_82/main_loop.asm", "bank_82/system.asm",
    "bank_82/screen_text.asm", "bank_82/menu.asm",
    "bank_83/math.asm", "bank_83/random.asm", "bank_83/graphics.asm", "bank_83/audio.asm", "bank_83/dialog.asm",
    "bank_83/game_engine.asm", "bank_83/map_engine.asm",
    "bank_84/ai_engine.asm", "bank_84/input.asm",
    "bank_85/objects.asm",
]

_COMMENT = re.compile(r";([0-9A-F]{6})\|([0-9A-F]*)\s*\|([0-9A-F ]*);")
_LABEL_RE = re.compile(r"^(?P<name>[A-Za-z_.][A-Za-z0-9_.]*):\s*(;.*)?$")
_ANON_RE = re.compile(r"^\s*(?P<anon>[+\-]+)(\s+|$)")
_DATA_RE = re.compile(r"^\s*(db|dw|dl|dd)\s+(?P<rest>[^;]*)", re.I)
_DATA_SIZE = {"db": 1, "dw": 2, "dl": 3, "dd": 4}


class Line:
    __slots__ = ("file", "idx", "text", "kind", "start", "end", "label", "anon", "raw", "m", "x")

    def __init__(self, file, idx, text):
        self.file, self.idx, self.text = file, idx, text
        self.kind = "other"
        self.start = self.end = None
        self.label = None
        self.anon = None
        self.raw = None
        self.m = self.x = None


def _data_len(m):
    size = _DATA_SIZE[m.group(1).lower()]
    rest = m.group("rest").strip()
    depth, n, cur = 0, 0, ""
    for ch in rest:
        if ch == "(":
            depth += 1
        elif ch == ")":
            depth -= 1
        if ch == "," and depth == 0:
            n += 1
        cur += ch
    return (n + 1) * size


def parse_module(rel):
    path = CODE_DIR / rel
    lines = []
    for i, text in enumerate(path.read_text(encoding="utf-8").split("\n")):
        ln = Line(rel, i, text)
        s = text.strip()
        code = text.split(";")[0].rstrip() if not text.lstrip().startswith(";") else ""
        cm = _COMMENT.search(text)
        lm = _LABEL_RE.match(s) if s and not s.startswith(";") else None
        am = _ANON_RE.match(text)
        dm = _DATA_RE.match(re.sub(r"^\s*[+\-]+\s+", "    ", text))
        if not s or s.startswith(";"):
            ln.kind = "blank"
        elif lm and not cm:
            ln.kind, ln.label = "label", lm.group("name")
        elif s.lower().startswith("org") or s.lower().startswith("pad"):
            ln.kind = "directive"
        elif dm and cm:
            ln.kind = "data"
            ln.start = int(cm.group(1), 16)
            ln.end = ln.start + _data_len(dm)
        elif cm:
            ln.kind = "insn"
            ln.start = int(cm.group(1), 16)
            ln.raw = bytes.fromhex(cm.group(2))
            ln.end = ln.start + len(ln.raw)
            if am:
                ln.anon = am.group("anon")
        elif s.startswith("%"):
            ln.kind = "macro"
        elif am:
            ln.kind = "macro"  # anonymous label in front of a macro call
            ln.anon = am.group("anon")
        else:
            ln.kind = "other"
        lines.append(ln)
    return lines


def load_us_source():
    """Parse all modules; fill in start/end for uncommented lines. Returns list of Line in ROM order."""
    allines = []
    for rel in MODULE_ORDER:
        allines += parse_module(rel)
    # macro lines: start = end of previous addressed line, end = start of next addressed line
    n = len(allines)
    prev_end = None
    for ln in allines:
        if ln.start is not None:
            prev_end = ln.end
        elif ln.kind in ("macro", "label", "blank", "directive", "other"):
            ln.start = prev_end
    nxt = None
    for ln in reversed(allines):
        if ln.kind in ("insn", "data"):
            nxt = ln.start
        elif ln.end is None:
            ln.end = nxt if ln.kind == "macro" else ln.start
        if ln.kind == "macro" and ln.start is not None and nxt is not None and ln.end is None:
            ln.end = nxt
    # first lines of a module have no predecessor: take next addressed line
    nxt = None
    for ln in reversed(allines):
        if ln.start is None:
            ln.start = nxt
            ln.end = nxt
        elif ln.kind in ("insn", "data"):
            nxt = ln.start
    return allines


def annotate_flags(lines, rom):
    """Track M/X flags (1 = 8 bit) along the lines in ROM order and store the state at the start of each line."""
    m = x = 1
    for ln in lines:
        ln.m, ln.x = m, x
        if ln.kind not in ("insn", "macro", "other") or ln.start is None or ln.end is None or ln.end <= ln.start:
            continue
        a = ln.start
        while a < ln.end:
            try:
                ins = decode(rom, a, m, x)
            except KeyError:
                break
            if ins is None:
                break
            if ln.kind == "insn" and ln.raw is not None and a == ln.start and ins.length != len(ln.raw):
                # observed length wins: fix the state from the immediate width
                if ins.mode == "immM":
                    m = 1 if len(ln.raw) == 2 else 0
                elif ins.mode == "immX":
                    x = 1 if len(ln.raw) == 2 else 0
                ins = decode(rom, a, m, x)
                ln.m, ln.x = m, x
            if ins.mn == "REP":
                if ins.operand & 0x20: m = 0
                if ins.operand & 0x10: x = 0
            elif ins.mn == "SEP":
                if ins.operand & 0x20: m = 1
                if ins.operand & 0x10: x = 1
            a += ins.length
    return lines


def operand_symbolic(text):
    """True if the instruction text uses a symbolic operand (label or RAM name) instead of a hex literal."""
    code = text.split(";")[0].strip()
    code = re.sub(r"^[+\-]+\s+", "", code)
    parts = code.split(None, 1)
    if len(parts) < 2:
        return False
    op = parts[1]
    op = re.sub(r"^#", "", op)
    return bool(re.search(r"[A-Za-z_!.]", re.sub(r"\$[0-9A-Fa-f]+", "", op).replace(",X", "").replace(",Y", "").replace(",S", "")))
