# Translation tools: quick start

Everything here runs with plain Python 3 (Pillow for the pictures) on Windows, Linux and macOS. Paths with spaces are fine (quote them). Files are read as UTF-8
(a BOM and CRLF line ends from Notepad are accepted) and written without BOM; an existing CRLF file keeps its CRLF.
Console output uses your console encoding; characters it cannot show are replaced, nothing crashes.

One entry point: `python tools\translate\translate.py <command> ...` (Windows wrapper: `tools\translate\translate.bat <command> ...`). `translate.py help` lists the commands.

## First time (Windows, cmd.exe or PowerShell, in the repository folder)

```bat
python tools\build_asar.py
python tools\extract.py --rom-dir "C:\Users\you\Desktop\project\SNES - Harvest Moon Disassembly\ROM"
```

`--rom-dir` is the folder that holds `US`, `EU`, `DE` and `JP` with your own dumps. Set `HM_ROM_DIR` to the same folder (`set HM_ROM_DIR=...`, PowerShell: `$env:HM_ROM_DIR="..."`)
for the tools that need a dump later (patches, tests).

## Every day

```bat
tools\translate\translate.bat check pl                      rem validation (errors, warnings with screen / line / cell), coverage, capacity
tools\translate\translate.bat check pl --ids 0x0100-0x01FF --min-severity error
tools\translate\translate.bat check pl --json > check.json   rem machine readable
tools\translate\translate.bat preview pl --ids 0x0123 --scale 3          rem PNG in build\translate\preview\
tools\translate\translate.bat preview pl --range 0x0100 0x01FF --sheet   rem contact sheet
tools\translate\translate.bat reflow pl --ids 0x0123                      rem suggestion only: build\translate\pl_reflow.txt (--apply writes dialogs.txt)
tools\translate\translate.bat status coverage pl
tools\translate\translate.bat status set pl reviewed --ids 0x0100-0x01FF
tools\translate\translate.bat glossary check pl --source us
tools\translate\translate.bat build pl --patch bps                       rem build\HarvestMoon_US_pl.sfc + .bps
tools\translate\translate.bat patch-apply build\HarvestMoon_US_pl.bps "C:\path\Harvest Moon (USA).sfc" -o pl.sfc
```

## Tools

| Tool | What it does |
|---|---|
| `export.py` / `import.py` | worksheet of the Japanese + US reference text, validated import into `dialogs.txt` |
| `check.py` | validation: variables, numbers, answers, characters, layout (28 x 3 cells, marker cell 83), capacity; `--ids`, `--range`, `--json`, `--min-severity` |
| `preview.py` | PNG of the dialog box as the game draws it (generated letters included), contact sheets, problems marked red / magenta |
| `reflow.py` | suggests line and page breaks without changing words; never writes to the translation without `--apply` |
| `status.py` | `status.csv`: list, set, coverage per bank, validate |
| `glossary.py` | term consistency (`translations/<lang>/glossary.csv`), names report |
| `stats.py` | progress per bank with byte counts |
| `strings.py`, `namegrid.py`, `glyphs.py` | season / weekday tables, name entry grid, letter generation |
| `gfx.py` | text in graphics: override pictures, name entry grid letters |
| `make_patch.py` | BPS / IPS patches (create, apply, verify, info) |
| `build.py` | translation build steps used by `tools/build.py --translation` |

The reference text and previews are generated from your own ROM into the git-ignored `build/` and `assets/`; do not commit them. See
[docs/translation.md](../../docs/translation.md) for the rules.
