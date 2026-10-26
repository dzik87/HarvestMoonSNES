# Assets are extracted from your own ROM

Goal: the repository ships **code and structure only**. Every asset (graphics, palettes, fonts, dialogs, audio, object and
map data, data tables) is extracted by the user from their own ROM dumps with `tools/extract.py` and then rebuilt into the
game by `tools/build.py`. No ROM-derived content is committed once the migration is complete.

## Model

| Tree | In git | Content |
|---|---|---|
| `src/`, `tools/`, `tests/`, `docs/`, `.github/` | yes | assembly code, tools, documentation |
| `defs/` | yes | hand-written structure: layouts (bank order, ORG, labels, sizes), names (K3-K5, SFX, songs), record formats and column names, enums, notes. No ROM bytes, pixels, samples or game text |
| `assets/` | **no** (git-ignored once the migration is done) | extracted editable sources: PNG, WAV, text, CSV values |
| `build/` | no | generated asm, binaries, ROMs |

Rule of thumb: if a file would be useless without the original ROM's content, it belongs to `assets/`; if it only
describes where things are and what they are called, it belongs to `defs/`.

## Workflow

```sh
python tools/extract.py --rom-dir <folder with your US/EU/DE/JP dumps>   # fills assets/ (releases are found by CRC32)
python tools/build.py [--region EU|DE|JP]                               # assets -> .bin/.asm -> ROM, verified against the hashes
```

`tools/build.py` stops with a clear message when `assets/` is missing. Extraction is deterministic and byte exact: an
extracted tree rebuilds the original ROM, which is proven by `tools/extract.py --compare` and the round trip test
(`tests/test_extract_roundtrip.py`, needs the ROMs).

## Writing an extraction step

A step is a `Step` object in a module of `tools/extract_steps/` (see `__init__.py`): it receives a `Context` (ROM paths per
region, repository root, output tree, `defs/`) and writes sources into `ctx.assets`. Steps read structure from `defs/` and
must never write to it. Each step is listed by `python tools/extract.py --list`.

## Consequences for CI

With no assets in the repository a clean checkout cannot rebuild the ROM, so CI can no longer compare hashes by itself.
CI therefore runs everything that needs no ROM content (unit tests with synthetic fixtures, tool checks, assembling the
code against generated placeholders where possible). Full ROM verification is a local step (`tests/test_extract_roundtrip.py`)
or a CI job that is given the dumps by the repository owner (private runner or secret storage).
