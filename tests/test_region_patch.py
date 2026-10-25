#!/usr/bin/env python3
"""Tests for the region patch tooling (tools/migration/region_patch.py, tools/analysis/align_regions.py RamMap) and the
structure of the patch blocks in src/code: balanced if/endif, only the documented !REGION_xx symbols."""
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT / "tools" / "analysis"))
sys.path.insert(0, str(ROOT / "tools" / "migration"))
import align_regions as AR  # noqa: E402
import region_patch as RP  # noqa: E402

SAMPLE = """\
label:
    LDA.W $08D5+!RAM_SHIFT          ;828000|AD    |
    if !REGION_EUDE
    NOP
    else
    if !REGION_JP
    RTS
    else
    RTL
    endif
    endif
    STA.W $0900+!RAM_SHIFT
"""


def test_unpatch():
    assert RP.unpatch_text(SAMPLE).split("\n") == [
        "label:", "    LDA.W $08D5          ;828000|AD    |", "    RTL", "    STA.W $0900", ""]


def test_tidy():
    t = RP.tidy(SAMPLE)
    assert "    elseif !REGION_JP" in t and t.count("endif") == 1, t
    assert RP.unpatch_text(t) == RP.unpatch_text(SAMPLE)


def test_cond():
    assert RP.cond_text(["DE", "EU"]) == "!REGION_EUDE"
    assert RP.cond_text(["JP"]) == "!REGION_JP"


def test_ram_map():
    de, jp = AR.REGION_RAM["DE"], AR.REGION_RAM["JP"]
    assert de.us2reg(0x08D5) == 0x08DB and de.reg2us(0x08DB) == 0x08D5 and de.reg2us(0x08D3) is None
    assert jp.us2reg(0x0917) == 0x08F7 and jp.reg2us(0x08F7) == 0x0917 and jp.reg2us(0x08B1) is None
    assert jp.us2reg(0x08D3) == 0x08D3 and AR.REGION_RAM["EU"].us2reg(0x0917) == 0x0917


def test_sources():
    allowed = {"!REGION_DE", "!REGION_EU", "!REGION_JP", "!REGION_EUDE"}
    n = 0
    for f in sorted((ROOT / "src" / "code").rglob("*.asm")):
        depth = 0
        for no, line in enumerate(f.read_text(encoding="utf-8").split("\n"), 1):
            s = line.strip()
            m = re.match(r"(if|elseif)\s+(.*?)\s*(;.*)?$", s)
            if m and "!REGION" in s:
                assert m.group(2) in allowed, (f, no, s)
                depth += m.group(1) == "if"
                n += 1
            elif s == "endif":
                depth -= 1
                assert depth >= 0, (f, no)
        assert depth == 0, f
    assert n > 100


if __name__ == "__main__":
    for name, fn in sorted(globals().items()):
        if name.startswith("test_"):
            fn()
    print("region patch tests OK")
