#!/usr/bin/env python3
"""One-off migration: raw $80xxxx WRAM-mirror operands >= $0917 in the US AI scripts -> wram80(<label>).

The values are unchanged in the US build; the label carries !DE_RAM_SHIFT (and the JP delta, see src/ai/region.asm),
so the same line assembles for every region.  Operands below $0917 ($800196, $8000D2, ...) never move and stay raw.
Usage: python3 tools/migration/ai_wram80.py [--dry]
"""
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
NAMES = {
    0x0917: "strcPlayerData.stamina",
    0x091D: "strcPlayerData.carryItemId",
    0x091E: "strcPlayerData.carryItemIdPrev",
    0x0921: "strcPlayerData.toolEquipped",
    0x0923: "strcPlayerData.toolSecond",
    0x0926: "strcPlayerData.leftWater",
    0x0973: "nTimeState",
    0x098C: "nWeatherForecast",
    0x09A2: "$7E09A2+!DE_RAM_SHIFT",      # no RAM label yet
    0x09AC: "$7E09AC+!DE_RAM_SHIFT",
}
PAT = re.compile(r"\$80([0-9A-F]{4})\b")


def main():
    dry = "--dry" in sys.argv
    total = 0
    for f in sorted((ROOT / "src/ai/us/scripts").glob("script_*.asm")):
        lines = f.read_text().split("\n")
        out = []
        for ln in lines:
            code, sep, comment = ln.partition(";")
            def rep(m):
                nonlocal total
                v = int(m.group(1), 16)
                if v < 0x0917:
                    return m.group(0)
                total += 1
                return f"wram80({NAMES[v]})"
            out.append(PAT.sub(rep, code) + sep + comment)
        if not dry:
            f.write_text("\n".join(out))
    print("replaced operands:", total)


if __name__ == "__main__":
    main()
