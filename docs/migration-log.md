# Migration log

## Initial state (before the overhaul)
- The source of truth was a DiztinGUIsh 2.5.0.0 export (`ASMUS` etc.), and `cleanup.bat` + regex parsers overwrote `ASM\SOURCE`.
- The US build was bit-identical to the original (MD5 `c9bf36a816b6d54aed79d43a6c45111a`), with no automated verification.
- 65816 code (US): about 38k instructions; 1594 labels, of which about 316 have "Unknown" in the name and 381 are automatic.

## Done
| Phase | Description | Verification |
|---|---|---|
| 0 | `tools/build.py`, `tools/verify.py`, CI, `.gitattributes` | US hash matches |
| 1a | files moved into `src/` with unchanged content | US hash matches |
| 1b | banks 80–85 split into modules (concatenation == original) | US hash matches |
| 2 | AI scripts (US): 7622 raw addresses → labels (`<script>_Lnnn`) | US hash matches |
| 2c | AI scripts (US) split into 72 per-script files + 3 bank headers (concatenation == original) | US hash matches |
| 3 | 697 auto/Unknown labels renamed from agent-produced maps (`docs/naming/*.csv`, `tools/migration/apply_renames.py`) | US hash matches |
| 4 | palettes ($A8/$A9): `db` dumps replaced by `incbin` of `assets/gfx/palettes/*.pal` + JSON/PNG, `tools/gfx/palette.py` | US hash matches |
| 2b | documentation of 90 AICMD commands from the interpreter handlers (`docs/ai/commands/*.yml` → `docs/ai/commands.md`) | spot-checked against the code; no source changes |
| 5 | DE code banks $80-$85: 65816 disassembler, US/DE alignment, 173 `if !REGION_DE` patch blocks, WRAM shift `!DE_RAM_SHIFT`, DE header; `tools/build.py --region DE` | US hash matches; DE banks $80-$85 hash matches (`tests/expected.json`, key `DE`) |

| 6 | AI scripts per region: 459 raw `$80xxxx` operands -> `wram80(label)`, EU/DE/JP as 4 `if !REGION_xx` blocks on the US scripts (`src/ai/region.asm`), raw `src/ai/{de,eu,jp}` dumps removed, `tools/analysis/aidiff.py` | US hash matches; EU/DE/JP banks $B3-$B5 match (`EU-AI`, `DE-AI`, `JP-AI`) |

## Regional versions (from the pre-migration analysis)
| Region | Code 80–84 | Notes |
|---|---|---|
| US | complete, named | base |
| EU | full Diz export | without the US names |
| JP | bank 80 complete, 81–84 partial | dialogs in AA–AC |
| DE | banks $80-$85 done: patch blocks on the US source (`if !REGION_DE`), byte-identical to the DE ROM | see `docs/regions.md`; data banks of DE not yet in the tree |

Dialogs exist in the repo for all four regions. The AI scripts of EU/DE/JP are no longer separate dumps (phase 6): the four
releases run the same scripts, see `docs/regions-ai.md`.

## Findings from the AICMD analysis (to be fixed in commands.asm)
- `AICMD0x26`/`0x27` emit the byte `$28` (aliases of 0x28 in the handler table) and are unused in US scripts.
- `0x42` ignores the address argument and always adds to `nMoney`; `0x41` clamps the result to 0..999.
- `0x14`/`0x23`: `aAISetMask` is a 1<<n mask on game flags, not a button mask.
- "Probable" confidence means inferred from code, not tested in an emulator.

## DE code banks (phase 5)
- Starting point: the DE code existed only as a `db` dump outside the repository. Instead of a second 60k-line copy the
  DE code is now expressed as patch blocks on the US sources (the DE code is about 86 % byte-identical to US and
  about 10 % identical after relocation).
- Findings: (1) DE inserted 6 bytes into the WRAM name block (`strcNames.wWeekday` is 24 instead of 18 bytes), so every
  WRAM address from `$7E08D1` up is +6 (`!DE_RAM_SHIFT`); (2) `$80:19xx` long operands are WRAM mirrors, not ROM;
  (3) the DE weekday/ordinal routines, dialog number drawing and several text coordinates are the real code changes;
  (4) pointers to the DE-only graphics in banks $9A/$9B/$A5 are kept as raw addresses until those banks are migrated.
- Tools: `tools/analysis/disasm65816.py` (+ `tests/test_disasm65816.py`, 39258 US instructions round-trip),
  `bytealign.py`, `usmap.py`, `align_regions.py`, `de_variant.py`, `tools/migration/de_patch.py`.
- Verification: `python3 tools/build.py --region DE` (CI step "Build and verify (DE code banks)") compares banks $80-$85
  with the hashes in `tests/expected.json`; the DE ROM is needed only to regenerate or extend the patches.
- Open: generic `fFunc_<addr>` names for DE-only code are `.de_<addr>` sublabels inside the patch blocks (no new
  global functions were needed); DE-only data banks, EU and JP are still to be done.
