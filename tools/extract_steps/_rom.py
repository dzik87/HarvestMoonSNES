"""Small helpers shared by the extraction steps: LoROM addressing, region helpers, hex formatting, text I/O."""
import json
from pathlib import Path

REGIONS = ("US", "EU", "DE", "JP")
BANK_SIZE = 0x8000


def lorom_off(addr: int) -> int:
    """24-bit LoROM address ($BBAAAA, bank $80-$BF) -> offset in the 2 MB image."""
    bank = (addr >> 16) & 0x7F
    if bank >= 0x40 or (addr & 0xFFFF) < 0x8000:
        raise ValueError("not a LoROM ROM address: $%06X" % addr)
    return bank * BANK_SIZE + (addr & 0x7FFF)


def parse_addr(s) -> int:
    return int(s[1:], 16) if isinstance(s, str) and s.startswith("$") else int(s)


class Rom:
    """Read access to a headerless ROM image by LoROM address."""

    def __init__(self, data: bytes):
        self.data = data

    def read(self, addr: int, n: int) -> bytes:
        o = lorom_off(addr)
        if o + n > len(self.data):
            raise ValueError("read past the end of the ROM: $%06X+%d" % (addr, n))
        return self.data[o:o + n]

    def u8(self, addr):
        return self.read(addr, 1)[0]

    def u16(self, addr):
        return int.from_bytes(self.read(addr, 2), "little")

    def u24(self, addr):
        return int.from_bytes(self.read(addr, 3), "little")


def load_json(path):
    return json.loads(Path(path).read_text(encoding="utf-8"))


def write_text(path, text):
    """Writes UTF-8 text with LF line ends (the committed asset sources never contain CR)."""
    path = Path(path)
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_bytes(text.encode("utf-8"))


def write_bytes(path, data):
    path = Path(path)
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_bytes(bytes(data))


# ---------------------------------------------------------------------------
# enums of the code (src/common/*.asm): `!PREFIX_NAME = $value`
# ---------------------------------------------------------------------------
import re as _re

_ENUM = _re.compile(r"^!([A-Z0-9]+)_(\w+)\s*=\s*\$([0-9A-Fa-f]+)\s*(?:;.*)?$")


def enum_names(root, prefix):
    """{value: 'PREFIX_NAME'} of the `!PREFIX_*` constants of src/common (first definition wins).  Used to turn extracted numbers
    back into the symbolic form the sources use (`!SFX_SEEDSOW`, `!AFLAGS_UNK0020|!AFLAGS_FOR0040`)."""
    out = {}
    for f in sorted((Path(root) / "src" / "common").glob("*.asm")):
        for line in f.read_text(encoding="utf-8").splitlines():
            m = _ENUM.match(line.strip())
            if m and m.group(1) == prefix:
                out.setdefault(int(m.group(3), 16), "%s_%s" % (prefix, m.group(2)))
    return out
