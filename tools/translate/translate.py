#!/usr/bin/env python3
"""One entry point for the translation tools (the same on Windows, Linux and macOS):

  python tools/translate/translate.py <command> [arguments of that tool]

  export | import | check | stats | status | preview | reflow | glossary | strings | namegrid | glyphs | analyze    the tools of tools/translate/ with the same name
  gfx-list | gfx-template | gfx-check | gfx-build           text in graphics (gfx.py list / template / check / build)
  patch-create | patch-apply | patch-verify | patch-info   BPS / IPS patches (make_patch.py create / apply / verify / info)
  build [LANG] [options]                                    tools/build.py --region US --translation LANG [options]   (LANG defaults to pl)
  help                                                      this list

Examples (Windows, cmd.exe or PowerShell; quote paths with spaces):
  python tools\\translate\\translate.py check pl --min-severity error
  python tools\\translate\\translate.py build pl --patch bps
  python tools\\translate\\translate.py patch-apply build\\HarvestMoon_US_pl.bps "C:\\Games\\Harvest Moon (USA).sfc" -o pl.sfc
"""
import runpy
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[1]
TOOLS = {"export", "import", "check", "stats", "status", "preview", "reflow", "glossary", "strings", "namegrid", "glyphs", "analyze"}
SUB = {"gfx-list": ("gfx", "list"), "gfx-template": ("gfx", "template"), "gfx-check": ("gfx", "check"), "gfx-build": ("gfx", "build"),
       "patch-create": ("make_patch", "create"), "patch-apply": ("make_patch", "apply"), "patch-verify": ("make_patch", "verify"), "patch-info": ("make_patch", "info")}


def run(script, argv):
    sys.argv = [str(script)] + argv
    sys.path.insert(0, str(HERE))
    try:
        runpy.run_path(str(script), run_name="__main__")
    except SystemExit as e:
        return e.code if isinstance(e.code, int) else (0 if e.code is None else (print(e.code, file=sys.stderr) or 1))
    return 0


def main(argv=None):
    argv = list(sys.argv[1:] if argv is None else argv)
    if not argv or argv[0] in ("help", "-h", "--help"):
        print(__doc__)
        return 0
    cmd, rest = argv[0], argv[1:]
    if cmd in TOOLS:
        return run(HERE / (cmd + ".py"), rest)
    if cmd in SUB:
        script, sub = SUB[cmd]
        return run(HERE / (script + ".py"), [sub] + rest)
    if cmd == "build":
        lang = rest[0] if rest and not rest[0].startswith("-") else "pl"
        rest = rest[1:] if rest and not rest[0].startswith("-") else rest
        return run(ROOT / "tools" / "build.py", ["--region", "US", "--translation", lang] + rest)
    print("unknown command %r; see: python tools/translate/translate.py help" % cmd, file=sys.stderr)
    return 2


if __name__ == "__main__":
    sys.exit(main())
