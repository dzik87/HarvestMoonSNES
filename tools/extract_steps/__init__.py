"""Registry of ROM -> assets extraction steps (see docs/extraction.md).

Every module in this package that defines STEPS (a list of Step) is picked up by tools/extract.py. A step reads
the user's own ROM dumps and writes editable sources into `ctx.assets` (the git-ignored `assets/` tree). Hand-written
structure (names, layouts, record formats) lives in `defs/` and is committed; steps may read it but must not write it.
"""
import importlib
import pkgutil
from dataclasses import dataclass, field
from pathlib import Path
from typing import Callable, Dict, List, Optional


@dataclass
class Context:
    roms: Dict[str, Path]          # region ("US", "EU", "DE", "JP") -> ROM file (headerless 2 MB)
    root: Path                     # repository root
    assets: Path                   # output tree (assets/)
    defs: Path                     # committed hand-written definitions (defs/)
    verbose: bool = False

    def rom_bytes(self, region: str) -> bytes:
        return self.roms[region].read_bytes()


@dataclass
class Step:
    name: str                                  # unique, e.g. "palettes"
    run: Callable[[Context], None]             # writes files under ctx.assets
    regions: List[str] = field(default_factory=lambda: ["US"])   # ROMs required
    after: List[str] = field(default_factory=list)               # steps that must run first
    doc: str = ""


def all_steps() -> List[Step]:
    steps = []
    for m in pkgutil.iter_modules(__path__):
        mod = importlib.import_module(f"{__name__}.{m.name}")
        steps.extend(getattr(mod, "STEPS", []))
    names = [s.name for s in steps]
    dup = {n for n in names if names.count(n) > 1}
    if dup:
        raise SystemExit("duplicate extraction step names: %s" % ", ".join(sorted(dup)))
    return steps
