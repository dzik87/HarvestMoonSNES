# Source code documentation standard

Every assembler source under `src/` carries Doxygen-style documentation blocks. They are ordinary asar comments (`;` lines),
so they can never change the ROM bytes. Doxygen itself does not understand 65816 assembler; the blocks are read by our own
tools instead:

| Tool | Purpose |
|---|---|
| `python3 tools/dev/doclint.py report [--json]` | coverage per file and in total (routines, tables, module headers, commented RAM/struct fields) |
| `python3 tools/dev/doclint.py check [--require-all] [--min-coverage N]` | syntax errors in existing blocks fail (exit 1); missing documentation is only reported |
| `python3 tools/dev/doclint.py todo --file F` | the undocumented labels of one source file (the work list) |
| `python3 tools/dev/docgen.py [--format html\|md]` | browsable reference in `build/docs/` (git-ignored), see "Generating the reference" |

All text in the repository is English. Describe behaviour that was verified in the code; when a claim is uncertain write `(?)`
after it and add `@note confidence: low - <why>`. Never invent.

## Block grammar

A block is a run of comment lines that starts and ends with a line containing only `;;`. It sits **immediately above** the label
it documents, with no blank line, comment line or instruction in between. Inside, every line starts with `; `. A tag starts a
line (`; @tag value`); continuation lines are plain comment lines and belong to the previous tag. Several short tags may share
one line when separated by two or more spaces (`; @bank $83   @range $83B000-$83FFFF`).

Allowed tags (anything else is a syntax error):

| Tag | Used in | Meaning |
|---|---|---|
| `@brief` | all (mandatory) | one line: what it does for the game |
| `@details` | all | algorithm, ordering constraints, game-play meaning, special cases (may span lines/paragraphs) |
| `@param NAME text` | routine | input: a register (`A`, `X`, `Y`, flag `C`...), or a RAM variable / struct field (`nBar`, `strcPlayer.flags`) |
| `@return NAME text` | routine | output: register, flag or RAM |
| `@modifies a, b` | routine | RAM written (real identifiers of `src/common/ram.asm` / `structures.asm`); omit for pure routines |
| `@clobbers A X Y` | routine | registers destroyed that the caller cannot assume preserved (`A X Y B C Z N V DP DB`) |
| `@mode M8X16 -> M16X16` | routine | processor width state at entry -> exit; `=` means unchanged; a single state means "entry, exit unchanged" |
| `@calls f1, f2` | routine | direct callees (JSR/JSL/JMP/JML targets) |
| `@callers f1, f2` | routine | optional; only when few and informative |
| `@region EU: ...; JP: ...` | routine | behaviour that differs per release (see below) |
| `@note` | all | anything surprising, open questions, `confidence: low - reason` |
| `@case $1A` | routine | jump-table case/handler id (see below) |
| `@format` | table | entry layout, e.g. `[word item id][byte price]`, N entries |
| `@index` | table | how the table is indexed and by whom |
| `@used_by f1, f2` | table | routines reading it |
| `@file name.asm` | module header | file name |
| `@bank $83` / `@range $83B000-$83FFFF` | module header | bank and address range of the module |
| `@see` | all | related modules, labels, `docs/*.md` |
| `@stack` | routine | stack effects, e.g. `pushes 2 words` |
| `@confidence high\|medium\|low [reason]` | all | alternative to a `@note confidence:` line |

Mode syntax (checked by `doclint.py`): `M8X8`, `M8X16`, `M16X8`, `M16X16`; `M8`/`M16`/`X8`/`X16` when only one width matters;
`->` separates entry and exit state; `=` alone, or as exit state (`M16X16 -> =`), means unchanged; `?` marks an unknown state.

Names after `@calls`, `@callers`, `@used_by` and `@modifies` must exist in the repository (labels, RAM names, struct fields,
macros); the linter warns about unknown ones. Parenthesised text after a name is ignored (`fRoutine (only when X=0)`).

## Routine block

```
;;
; @brief   One line: what the routine does for the game.
; @details Optional paragraphs: algorithm, why, ordering constraints.
; @param   A      16-bit item id
; @param   X      index into aFooTable
; @param   nBar   argument passed in RAM
; @return  A      result, $0000 = none
; @return  C      set when the action succeeded
; @modifies nBaz, strcPlayerData.money
; @clobbers A X Y
; @mode    M8X16 -> M16X16
; @calls   fOtherRoutine, fSecond
; @region  EU: ...; JP: ...
; @note    Anything surprising.
;;
fRoutine:
```

Write the optional tags whenever they are known and informative; skip empty ones (never write "none").

### How to document a routine (walk-through with an invented example)

Suppose the code below existed (it is invented for this guide; `fBarn_*`, `nHay*` and `aHayRation` are not in the game):

```
fBarn_FeedCow:
    SEP #$20                                                   ;80A000|E220    |      ;
    LDA.W nHayStored                                           ;80A002|AD1234  |001234;
    BEQ .empty                                                 ;80A005|F00E    |80A015;
    REP #$30                                                   ;80A007|C230    |      ;
    AND.W #$00FF                                               ;80A009|29FF00  |      ;
    TAX                                                        ;80A00C|AA      |      ;
    LDA.L aHayRation,X                                         ;80A00D|BF25A080|80A025;
    JSL.L fBarn_SpendHay                                       ;80A011|226AA080|80A06A;
    SEC                                                        ;80A015|38      |      ;
    RTL                                                        ;80A016|6B      |      ;
.empty:
    CLC                                                        ;80A017|18      |      ;
    RTL                                                        ;80A018|6B      |      ;
```

1. Read the body and find its game meaning (here: feeding a cow from the stored hay). Cross-check with callers (`grep -rn fBarn_FeedCow src`)
   and with the data it touches (`nHayStored`, `aHayRation`).
2. Fill the mandatory `@brief`: a verb phrase about the game, not about instructions ("Feeds one cow from the hay stock", not
   "loads nHayStored and branches").
3. Walk the register contract: inputs read before they are written (`param`), values the caller can rely on afterwards (`return`,
   including flags such as `C`), RAM written (`modifies`), registers destroyed (`clobbers`).
4. Record the width state at entry and exit (`@mode`): here `SEP #$20` at the top and `REP #$30` later means entry M8 (or unknown, exit M16X16).
5. List the direct callees in `@calls`; keep `@callers` for the cases where it explains something.
6. Mark uncertainty: `(?)` after the claim and a `@note confidence: low - ...`.

The result:

```
;;
; @brief   Feeds one cow from the stored hay; fails when the barn has no hay.
; @details The ration size is taken from aHayRation, indexed by the current hay stock level.
; @return  C      set when hay was spent, clear when the stock was empty
; @modifies nHayStored
; @clobbers A X
; @mode    M8 -> M16X16
; @calls   fBarn_SpendHay
; @note    The hay stock level is used as the table index (?). confidence: low - only one caller seen.
;;
fBarn_FeedCow:
    SEP #$20                                                   ;80A000|E220    |      ;
```

Inside routines, add short plain `;` comments (not Doxygen) at non-obvious steps: loop purpose, magic numbers, bit meaning, early
exits. Do not delete the generated trace comments (`;81D570|E220    |000000;`): they are address columns, not documentation,
and `doclint.py` ignores them. Local labels (`.empty`) stay snake_case and need no block. Fall-through labels inside a routine
(a global `f...` label that follows a non-terminating instruction and is never called) are counted as inner labels, not as missing
documentation; a global label that is the target of a JSR/JSL/JML/PEA or is stored in a `dw/dl` table is an entry point and needs
its own block.

### Jump-table cases and handlers

Handlers reached through a table (`fPlayerInteraction0x1A`, `fAIAction0x2B`) use the routine block. `@brief` states the
game-visible meaning ("player waters a crop tile"); the id is recorded with `@case $1A`. When the code shows what it does, the label
gets a meaningful name (`fPlayerInteraction_WaterCrop`) via `tools/dev/apply_renames.py` (whole-word, repo-wide); every rename is
recorded as `old,new,confidence,reason` in `docs/naming/P_<part>_renames.csv`. Rename only with evidence (callers, constants, data touched,
behaviour visible in AI scripts or dialog ids). Keep the prefix conventions: `f` code, `a` array/table, `n` variable, `s` data blob, `p` pointer,
`strc` struct, `!` constants; prefer `f<Module>_<Verb><Object>`.

## Table / data block

For global `a...`, `n...`, `s...` and `p...` labels that start a data table:

```
;;
; @brief   Hay ration per stock level.
; @format  `[byte units]`, 8 entries, one per stock level 0..7.
; @index   Stock level (nHayStored, 8-bit) times 1; read by fBarn_FeedCow.
; @used_by fBarn_FeedCow
; @note    Level 0 is never read (the routine returns early).
;;
aHayRation:
    db $00,$01,$01,$02,$02,$03,$03,$04
```

Tables that are generated (`build/gen/...`, `incsrc`) or whose entries come from an `assets/` source are documented on the label
that the hand-written source keeps; say where the data comes from (`@note generated from assets/tables/foo.csv`).

## Module header

The first block of every `src/code/bank_*/<module>.asm` (and other source file) is the module header, recognised by `@file`. It is
not attached to a label, so it may be followed by blank lines and the existing `; Bank $83 module "x" - starts at ...` comment.

```
;;
; @file   map_engine.asm
; @brief  What this module is responsible for, in 2-6 lines.
; @bank   $83   @range $83B000-$83FFFF
; @see    related modules, docs/*.md
;;
```

A file has at most one header. AI script files (`src/ai/<region>/scripts/script_*.asm`) are scripts, not routines: they take
**one** module header block per file (`@file`, `@brief` - which NPC/event, when it runs - and `@see`) and nothing else; their
labels are not counted by the linter.

## Region differences

Code that differs per release is written as `if !REGION_EUDE` / `elseif !REGION_JP` / `else` / `endif` blocks
(`src/common/region.asm`, `docs/regions.md`). Document the US behaviour in the normal tags and put each release difference in
`@region`, one line per release:

```
; @region  EU/DE: the delay is doubled for the 50 Hz frame rate; JP: the dialog window has no number column.
```

Do not duplicate whole routines per region. The linter ignores `if/elseif/else/endif` lines when it looks for the next statement, and
a label that appears in several branches is counted once. Region-specific addresses live in `src/code/region_targets.asm`.

## RAM variables and structure fields

`src/common/ram.asm`, `structures.asm` and `enums.asm` carry a trailing `;` comment per variable, struct field or constant with:
meaning, unit, range, and writers/readers when known. Example:

```
nHayStored = $7E0A10+!RAM_SHIFT   ; !^ n8, hay units in the barn, 0..99, written by fBarn_SpendHay ^!
    .growth      : skip 1         ; 3C  growth stage 0..4, 4 = ripe
```

Leave the existing `!^ n16 ^!` type markers (DiztinGUIsh export); add the meaning after them. A comment that only repeats the type
or says "unknown" does not count in the coverage report. Rename `Unknown`/`unk` fields only with evidence, and record the rename
as described above.

## Verification

Comments and renames must not change a single byte. Before pushing:

```
python3 tools/dev/doclint.py check          # syntax errors (exit 1); also run in CI
python3 tools/build.py --region US|EU|DE|JP # each must print "ROM MATCHES ORIGINAL"
python3 tests/test_doclint.py
```

`doclint.py check --verify-calls` additionally compares `@calls` with the JSR/JSL/JMP targets found in the routine body.
`check --require-all` / `--min-coverage N` turn missing documentation into an error once a module is finished.

## Generating the reference

```
python3 tools/dev/docgen.py                 # HTML into build/docs/ (open build/docs/index.html)
python3 tools/dev/docgen.py --format md     # Markdown pages instead
python3 tools/dev/docgen.py src/code/bank_83/dialog.asm   # one module only
```

`build/docs/` is git-ignored output. The generator needs only Python (no Doxygen). It writes `index` (all modules with their
header brief and coverage), `symbols` (alphabetical index of all labels with their `@brief` and address), and one page per source
file with the routines, their tags and cross-links: `@calls`, `@callers`, `@used_by` and `@see` link to the documented symbol;
every routine also shows "called by" derived from the `@calls` of the other routines. Undocumented labels are listed at the end
of the module page.
