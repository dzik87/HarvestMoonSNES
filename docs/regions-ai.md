# AI scripts ($B3-$B5) across the four releases

The AI script banks hold the byte-code programs that drive NPCs, events and cut scenes (interpreter and the 90 commands:
[`ai/commands.md`](ai/commands.md)). This document compares **US, EU, DE and JP at command level** instead of byte level:
the scripts of every release were decoded into commands, aligned script by script and every difference was classified.
It extends [`regions.md`](regions.md) (which compares the code banks) and is the reference for the region patches in
`src/ai/us/scripts/`.

## Summary

- The four releases run **the same scripts**. Out of 18,347 commands, the whole set of real behavioural differences is
  **four commands** (EU/DE: 3, JP: 1); everything else is relocation or a WRAM address shift.
- **EU and DE are command-identical.** DE differs from EU only by the WRAM address shift (+6, 459 operands).
- No text id, flag number, item/enum value, coordinate, timer or script slot differs anywhere. The dialog differences
  of the releases live entirely in the dialog banks ($B6-$BB / $AA-$AC), not in the AI scripts.
- The large byte-level differences of the original comparison (`regions.md`: B3 EU 6507 / DE 6775 / JP 575, B4 EU=DE 25328 /
  JP 75, B5 EU 0 / DE 110 / JP 7571 bytes) are explained completely by: an inserted/removed command that moves the rest of the
  bank (EU/DE bank $B3 and $B4, JP bank $B5), and the WRAM shift (DE +6 / JP -32, a 1 to 2 byte change per operand).
  The "-32" and "-1" style deltas seen in JP $B3/$B4 are the JP WRAM layout, not script edits.

| Class | EU | DE | JP |
|---|---|---|---|
| (a) WRAM address operand shifted | 0 | 459 | 459 |
| (b) pointer relocation only (a script got longer/shorter) | 2124 | 2067 | 89 |
| (c) changed operand values | 0 | 0 | 0 |
| (d) added / removed commands | 3 | 3 | 1 |
| (e) different script content (slot table, record table, new/removed scripts) | 0 | 0 | 0 |

(A command that has both a shifted address and a relocated pointer is counted under (a).)

## Functional differences

### EU and DE (identical)

1. **Earthquake aftermath, script `$08` (two rooms): the explicit screen fade-in is gone.**
   US commands `AICMD0x0A_ScreenFadein($01)` at `$B3E4F6` (data slot 6, started from `fAreaEvents_AnimalShop`) and
   `$B3E565` (data slot 7, `fAreaEvents_WorksmanHouse`) are not present in EU/DE. The scripts are the villagers' scenes
   after the earthquake ("I was terrified. It was my first earthquake.", dialogs `$0165`, `$0413`, ...). These two
   calls are the only uses of `0x0A` in the game. The command runs the engine's fade-in (about 12 steps of 3 frames, it blocks the slot and sets
   `strcFlags.daily1` bit `$8000`); the engine fades areas in by itself at several places (`fCore_ScreenFadein` callers in the main loop), so the US rooms are probably faded in twice. EU/DE dropped the
   second one (probable; not tested in an emulator).
2. **Star Night Festival, script `$0F` data slot 3 (Maria's NPC): talking to her is blocked until script flag 7.**
   In US the NPC at (`$C1`,`$88`) has two entry paths. Path A (`event2` bits 1-4: another girl's route, her love drops by 30) executes
   `AICMD0x0C_WaitForScriptFlag($07)` before it starts polling for the conversation (`AICMD0x1F`); path B (`event2` bit 0, probably the route in which Maria herself was invited)
   does not. EU/DE add the wait to path B at `$B4835D`.
   Flag 7 is set by the main festival script (`$B4824A`) after the player has talked to all six other participants (flags 0-5).
   Without the wait, the player can start the conversation with Maria immediately, which runs `AICMD0x08_EnableAIControl`
   (the player loses control) and then waits for script flag 8, which is only set after flags 0-5 - a probable soft lock
   in the US version that EU/DE fixed (derived from the script flow, not tested in an emulator).

Consequences of 1 and 2 for the layout: script `$09` and everything behind it in bank $B3 is 4 bytes lower, script `$10` and
everything behind it in bank $B4 is 2 bytes higher (table below).

### JP

3. **Ending (script `$46`): the closing walk-in sequence is started.**
   After the camera scrolls back JP executes `AICMD0x09_StartScript($03, $ABEA)` right before the final `End` (`$B5A9E8`,
   +4 bytes). The target is a sequence of actors that enter one by one (30/60 frames apart, `AICMD0x1A` walks at x=`$58`, `$68`,
   `$78`, `$8A`, then a small jump animation at (`$E6`,`$60`)). The same code exists in US/EU/DE (`$B5ABE6`, label
   `pAIScripting0x46_Parade` in the tree) but **nothing starts it there**: it is dead code in three of the four releases.
   JP has 41 unreferenced command blocks, the others 42 - this is the one block that is live in JP. Script `$47`
   (How to play) and the end of bank $B5 are therefore 4 bytes higher in JP.
   Interpretation (probable): the parade was part of the original (Japanese) ending and was cut in the localisations
   without removing the code.

### WRAM layout (DE and JP)

4. The scripts address game variables through the `$80:xxxx` mirror of low WRAM (`strcPlayerData.*`, `nTimeState`,
   `nWeatherForecast`, ...). 459 operands (`JumpIfEquals8`/`JumpIfBetween8`/`SetValue8`/`AddValue8`/`JumpIfEqual16`) move:
   DE **+6** (the longer weekday names, see `regions.md`), JP **-32** (shorter name block; first moved address seen is
   `$0917`; addresses at or below `$0196` and everything in `$7F:xxxx` do not move). It is the same variable in every
   release; only its address differs. Most uses (378) are `strcPlayerData.carryItemIdPrev`, the carried item/animal
   that scripts test before accepting a gift.

### What is *not* different

Checked on all 18,347 aligned commands: dialog ids (`ShowDialog` 0x1C/0x1D/0x54), script flag bits, `strcFlags.*` bit
numbers, love/happiness/money amounts, item and carry-item ids, map scrolling, walk targets and timers, music ids, area ids, the slot
tables (entry points) of all 72 scripts and the 2784-byte record table at `$B380D8` (targets of the `0x1A`, `0x2B`, `0x2E`, `0x2F`,
`0x49` commands) are identical in all four releases. The unusual operand values of the original code are therefore not
region fixes; findings such as the `0x42` quirk (`docs/findings.md`) exist in every release.

## Method

1. `ppAIScriptingList` (`$B38000`, 0x48 x 24-bit) gives the start of each script; a script begins with a table of word pointers
   (16 data slots, 0x88 in script 0) whose first entry is the first command. A script ends at the next script start; the last
   script of each bank ends with the command that holds the last non-zero byte before the bank's zero padding.
2. The command sizes come from the macro definitions in `src/ai/commands.asm` (`db`/`dw`/`dl` per parameter; the `&$FFFF` words are
   in-bank pointers, `pPointerB3` words point into the record table). Linear decoding of all 72 scripts of all four releases
   lands exactly on the script boundaries (no data embedded in the code), so the command streams are exact.
3. Per script the command lists are aligned with `difflib` on (opcode, operands with pointers masked). Unmatched blocks are
   re-paired by opcode; the remainder is "added"/"removed".
4. Aligned pairs are classified: identical, WRAM address shifted by the region rule (DE +6 for `$08D1`-`$1FFF`, JP -32 for
   `$0917`-`$1FFF`, banks `$7E`/`$80` only), pointers relocated (every pointer must lead to the *aligned* counterpart, to the end of
   the script, or - for record pointers - to the same record), other operand changes, replaced commands. A pointer that
   leads to a different command is reported separately (`ptr!`); there are none.
5. Slot tables are checked the same way (every entry must lead to the aligned command), and the record table is compared byte for byte.

Reproduce: `python3 tools/analysis/aidiff.py --rom-dir <dir with US/EU/DE/JP/>` (original dumps) or `--built`
(ROMs assembled from this tree, which are bit-identical in $B3-$B5). `--md docs/regions-ai.md` rewrites the generated block
below, `--md ... --check` fails when it is stale (`tests/test_ai_region.py` does that in CI).

## How the tree builds every release

The US scripts in `src/ai/us/scripts/` are authoritative. The other releases are expressed as patches on them:

- **Pointers need no patch.** Jumps, slot tables and `ppAIScriptingList` use labels, so a longer or shorter script moves
  everything behind it automatically (the size changes of EU/DE/JP produce 2124/2067/89 relocated commands for free).
- **Content changes** are `if !REGION_EU|!REGION_DE ... else <US> ... endif` blocks (script `$08`, `$0F`) and
  `if !REGION_JP` (script `$46`); four blocks in total.
- **WRAM operands** use `wram80(<label>)` (`src/ai/region.asm`): the label carries `!DE_RAM_SHIFT` (see `src/common/ram.asm`), and the
  function applies the JP delta (`!AI_JP_WRAM_DELTA`, -32) until the common RAM map describes the JP layout. 459 raw
  `$80xxxx` literals were converted by `tools/migration/ai_wram80.py` (US bytes unchanged).
- **What is source language and what is generated.** The script bodies are not raw bytes: they are a readable script language
  (`%AICMD0x09_StartScript(...)` macro calls with named commands, `src/ai/commands.asm`). That DSL stays in `src/ai/us/scripts/script_*.asm`
  as the source; no second bytecode/text format is introduced (it would be a 1:1 renaming of the macro calls, and the region
  patch blocks and `wram80()` operands live right inside the macro lines). Only genuine *data* is generated from `assets/ai/`
  by `tools/ai/aidata.py` (`build` -> `build/gen/ai/`, `check`): `scripts.json` (script id, label, bank, slot table = the entry points
  of each script's sub scripts; `ppAIScriptingList` is derived from the order of the scripts) and `npc_sprite_tables.txt` (the 214
  sprite/direction tables `aAIScriptingData*`, 3-byte records `sprite:flip`, 4 per line = the four facing directions). The generated
  files carry the same labels, so the region patch structure is unaffected: slot tables and sprite tables are identical in all four releases
  (only the relocation of the labels differs).
- The former raw `db` dumps `src/ai/{de,eu,jp}/` (never part of the build) are gone.
- `tools/build.py --region EU|DE|JP` builds the tree with `-DREGION_xx=1` and verifies banks `$B3-$B5` against the hashes
  `EU-AI`, `DE-AI`, `JP-AI` in `tests/expected.json` (banks `$80-$85` of DE are checked by the `DE` entry in the same run).

## Statistics and catalogue (generated)

<!-- AI-DIFF-BEGIN (generated by tools/analysis/aidiff.py --md) -->

### Per-bank statistics (against US)

| Region | Bank | Differing bytes (position-wise) | Commands US / region | Identical | (a) RAM shift | (b) pointer only | (c) operand | (d) cmds removed / added | Bytes removed / added |
|---|---|---|---|---|---|---|---|---|---|
| EU | $B3 | 6507 | 6774 / 6772 | 6215 | 0 | 557 | 0 | 2 / 0 | 4 / 0 |
| EU | $B4 | 25328 | 7135 / 7136 | 5568 | 0 | 1567 | 0 | 0 / 1 | 0 / 2 |
| EU | $B5 | 0 | 4438 / 4438 | 4438 | 0 | 0 | 0 | 0 / 0 | 0 / 0 |
| DE | $B3 | 6775 | 6774 / 6772 | 5944 | 291 | 537 | 0 | 2 / 0 | 4 / 0 |
| DE | $B4 | 25328 | 7135 / 7136 | 5547 | 58 | 1530 | 0 | 0 / 1 | 0 / 2 |
| DE | $B5 | 110 | 4438 / 4438 | 4328 | 110 | 0 | 0 | 0 / 0 | 0 / 0 |
| JP | $B3 | 575 | 6774 / 6774 | 6483 | 291 | 0 | 0 | 0 / 0 | 0 / 0 |
| JP | $B4 | 75 | 7135 / 7135 | 7077 | 58 | 0 | 0 | 0 / 0 | 0 / 0 |
| JP | $B5 | 7571 | 4438 / 4439 | 4239 | 110 | 89 | 0 | 0 / 1 | 0 / 4 |

Unreferenced command blocks (after End/Jump, no slot entry or in-script pointer): US 42, EU 42, DE 42, JP 41.


### Script start offsets against US (a row applies until the next row)

| Script | US start | EU | DE | JP |
|---|---|---|---|---|
| $00 General | $B38BB8 | 0 | 0 | 0 |
| $09 | $B3E603 | -4 | -4 | 0 |
| $0F StarNightFestival | $B48000 | 0 | 0 | 0 |
| $10 WoodsPondEvent | $B487B8 | +2 | +2 | 0 |
| $43 | $B58000 | 0 | 0 | 0 |
| $47 HowToPlay | $B5AC6E | 0 | 0 | +4 |

### Moved WRAM operands

| US address | Variable | Operands | DE | JP |
|---|---|---|---|---|
| $800917 | `strcPlayerData.stamina` | 1 | +6 | -32 |
| $80091D | `strcPlayerData.carryItemId` | 1 | +6 | -32 |
| $80091E | `strcPlayerData.carryItemIdPrev` | 378 | +6 | -32 |
| $800921 | `strcPlayerData.toolEquipped` | 25 | +6 | -32 |
| $800923 | `strcPlayerData.toolSecond` | 13 | +6 | -32 |
| $800926 | `strcPlayerData.leftWater` | 2 | +6 | -32 |
| $800973 | `nTimeState` | 6 | +6 | -32 |
| $80098C | `nWeatherForecast` | 16 | +6 | -32 |
| $8009A2 | `(unnamed $09A2)` | 7 | +6 | -32 |
| $8009AC | `(unnamed $09AC)` | 10 | +6 | -32 |

### Catalogue of changed commands

#### EU against US

| Script | Class | US | EU |
|---|---|---|---|
| $08 | cmd | `$B3E4F6 0x0A_ScreenFadein($01)` | - |
| $08 | cmd | `$B3E565 0x0A_ScreenFadein($01)` | - |
| $0F StarNightFestival | cmd | - | `$B4835D 0x0C_WaitForScriptFlag($07)` |

#### DE against US

Identical to EU (the RAM shift is class (a), see above).

#### JP against US

| Script | Class | US | JP |
|---|---|---|---|
| $46 | cmd | - | `$B5A9E8 0x09_StartScript($03, ->$ABEA)` |


<!-- AI-DIFF-END -->

## Open questions

- The reason for the two removed fade-ins (item 1) and the exact in-game effect of the Maria wait (item 2) should be confirmed in an emulator.
- The JP WRAM layout (-32 from `$0917`; boundary between `$0196` and `$0917`) belongs in the common RAM map; once `ram.asm` /
  `structures.asm` carry it, `!AI_JP_WRAM_DELTA` in `src/ai/region.asm` becomes 0.
- 42 command blocks are unreferenced inside their script (only approximate: pointers from the code banks are not considered). They
  are candidates for cut content, like the JP parade.
