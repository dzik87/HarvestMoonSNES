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
| 2b | documentation of 90 AICMD commands from the interpreter handlers (`docs/ai/commands/*.yml` → `docs/ai/commands.md`) | spot-checked against the code; no source changes |

## Regional versions (from the pre-migration analysis)
| Region | Code 80–84 | Notes |
|---|---|---|
| US | complete, named | base |
| EU | full Diz export | without the US names |
| JP | bank 80 complete, 81–84 partial | dialogs in AA–AC |
| DE | none (only `db`) | needs a disassembly from scratch |

AI scripts and dialogs exist in the repo for all four regions; label migration (phase 2) so far covers US only.
`tools/migration/ai_labels.py` is ready to be used on the other regions once their builds are added.

## Findings from the AICMD analysis (to be fixed in commands.asm)
- `AICMD0x26`/`0x27` emit the byte `$28` (aliases of 0x28 in the handler table) and are unused in US scripts.
- `0x42` ignores the address argument and always adds to `nMoney`; `0x41` clamps the result to 0..999.
- `0x14`/`0x23`: `aAISetMask` is a 1<<n mask on game flags, not a button mask.
- "Probable" confidence means inferred from code, not tested in an emulator.
