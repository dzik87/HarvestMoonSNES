#!/usr/bin/env python3
"""Tests for tools/dev/doclint.py and tools/dev/docgen.py with invented fixtures (fast, no ROM, no assembler)."""
import json
import subprocess
import sys
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT / "tools" / "dev"))
import doclint  # noqa: E402
import docgen  # noqa: E402

GOOD = """\
;;
; @file   toy.asm
; @brief  Toy module for the tests.
; @bank   $83   @range $83B000-$83FFFF
; @see    docs/code-documentation.md
;;
; Bank $83 module "toy" - starts at $83B000
    ORG $83B000

;;
; @brief   Feeds the toy cow.
; @details First paragraph.
;
;          Second paragraph.
; @param   A      item id
; @param   nToyHay  hay stock
; @return  C      set on success
; @modifies nToyHay, strcToy.count
; @clobbers A X
; @mode    M8X16 -> M16X16
; @calls   fToy_Spend, fToy_Second
; @region  EU: other; JP: none
; @note    confidence: low - invented
;;
fToy_Feed:
    SEP #$20                                                   ;83B000|E220    |      ;
    JSL.L fToy_Spend                                           ;83B002|22000000|83B010;
    if !REGION_JP
    LDA.B #$01
    else
    LDA.B #$02
    endif
    %ToyMacro(1)
    BEQ .empty
    RTL
.empty:
    RTL

fToy_Spend:
    JSR.W fToy_Second
    RTL

;;
; @brief   Second helper.
; @mode    =
;;
fToy_Second:
fToy_Second_Inner:
    LDA.B #$00
    NOP
fToy_FallThrough:
    RTS

;;
; @brief   Ration table.
; @format  [byte units] x 4
; @index   stock level
; @used_by fToy_Feed
;;
aToyRation:
    db $00,$01,$02,$03

aToyUndocumented:
    dw $0000,$0001

macro ToyMacro(n)
fToy_InMacro:
    LDA.B #<n>
endmacro
"""

COMMON = """\
nToyHay = $7E0A10+!RAM_SHIFT   ; !^ n8, hay units in the barn, 0..99 ^!
nToyBare = $7E0A11             ; !^ n8 ^!
struct strcToy $7E0B00
    .count : skip 1            ; number of cows fed today
    .unk01 : skip 1            ; 01
endstruct
"""

BAD = """\
;;
; @brief   Bad tags.
; @frobnicate nonsense
; @mode    M12X3
; @calls   fNoSuchRoutine
;;
fBad_One:
    RTS

;;
; @param   A      block without brief
;;
fBad_Two:
    RTS

;;
; @brief   Separated by a blank line.
;;

fBad_Three:
    RTS

;;
; @brief   Never closed
; @mode    M8
fBad_Four:
    RTS
"""

SCRIPT = """\
;;
; @file   script_01.asm
; @brief  Invented NPC script.
;;
AI_Toy:
    %AICMD0x10_End()
AI_Toy_L001:
    %AICMD0x10_End()
pAIToy_Data01:
    dw $0000
"""

SCRIPT_BAD = """\
AI_Toy:
    %AICMD0x10_End()
;;
; @brief  Not needed in a script
;;
AI_Toy_L001:
    %AICMD0x10_End()
"""


def make_repo(tmp, files):
    for rel, text in files.items():
        p = Path(tmp) / rel
        p.parent.mkdir(parents=True, exist_ok=True)
        p.write_text(text, encoding="utf-8")
    return doclint.Repo(tmp).load()


def run_cli(tmp, *args):
    return subprocess.run([sys.executable, str(ROOT / "tools" / "dev" / "doclint.py"), "--root", str(tmp)] + list(args),
                          capture_output=True, text=True)


def test_good_file():
    with tempfile.TemporaryDirectory() as tmp:
        repo = make_repo(tmp, {"src/code/bank_83/toy.asm": GOOD, "src/common/ram.asm": COMMON})
        P = repo.files["src/code/bank_83/toy.asm"]
        doclint.block_diagnostics(repo, P)
        assert P.errors == [], P.errors
        assert P.header is not None and P.header.get("bank") == "$83" and P.header.get("range") == "$83B000-$83FFFF"
        names = {l.name: l for l in P.labels}
        assert names["fToy_Feed"].documented and names["fToy_Feed"].kind == "code"
        feed = names["fToy_Feed"].block
        assert [t.name for t in feed.all("param")] == ["param", "param"]
        assert "Second paragraph" in feed.get("details")
        assert feed.get("mode") == "M8X16 -> M16X16"
        assert not names["fToy_Spend"].documented and not names["fToy_Spend"].inner
        assert names["fToy_FallThrough"].inner and not names["fToy_Second_Inner"].inner   # alias at the same address is an entry
        assert names["aToyRation"].kind == "data" and names["aToyRation"].documented
        assert names["aToyUndocumented"].kind == "data" and not names["aToyUndocumented"].documented
        assert "fToy_InMacro" not in names           # macro bodies are skipped
        st = doclint.file_stats(repo, P)
        assert st["routines"] == {"total": 4, "documented": 2}, st["routines"]   # Feed, Spend, Second, Second_Inner (alias)
        assert st["tables"] == {"total": 2, "documented": 1}
        assert st["header"] is True
        # the unknown @calls name is only a warning
        assert any("fToy_Second" not in w[1] and "unknown name" in w[1] for w in P.warnings) is False
        assert not [w for w in P.warnings if "unknown name" in w[1]], P.warnings


def test_fields():
    with tempfile.TemporaryDirectory() as tmp:
        repo = make_repo(tmp, {"src/common/ram.asm": COMMON, "src/common/structures.asm": COMMON})
        P = repo.files["src/common/ram.asm"]
        assert [f[2] for f in P.fields] == [True, False, True, False], P.fields


def test_bad_blocks():
    with tempfile.TemporaryDirectory() as tmp:
        repo = make_repo(tmp, {"src/code/bank_83/bad.asm": BAD})
        P = repo.files["src/code/bank_83/bad.asm"]
        doclint.block_diagnostics(repo, P)
        msgs = "\n".join(m for _, m in P.errors)
        assert "unknown tag @frobnicate" in msgs
        assert "@mode 'M12X3'" in msgs
        assert "without @brief" in msgs
        assert "separated from the label fBad_Three" in msgs
        assert "not closed" in msgs or "not directly above" in msgs
        assert any("fNoSuchRoutine" in m for _, m in P.warnings)
        assert not any("fNoSuchRoutine" in m for _, m in P.errors)     # unknown names are warnings only


def test_mode_syntax():
    for ok in ("M8X8", "M8X16", "M16X8", "M16X16", "M8X16 -> M16X16", "=", "M8 -> M16", "M16X16 -> =", "M8X16 =", "M8X16->M8X8"):
        assert doclint.MODE_RE.match(ok), ok
    for bad in ("M12X3", "M8X16 -> ", "X", "M8X16 -> M16X16 -> M8X8", "m8x16", ""):
        assert not doclint.MODE_RE.match(bad), bad


def test_scripts():
    with tempfile.TemporaryDirectory() as tmp:
        repo = make_repo(tmp, {"src/ai/us/scripts/script_01.asm": SCRIPT, "src/ai/us/scripts/script_02.asm": SCRIPT_BAD})
        a, b = repo.files["src/ai/us/scripts/script_01.asm"], repo.files["src/ai/us/scripts/script_02.asm"]
        st = doclint.file_stats(repo, a)
        assert st["script"] and st["header"] and st["routines"]["total"] == 0 and st["tables"]["total"] == 0
        assert not a.errors
        assert not doclint.file_stats(repo, b)["header"]
        assert any("only take one module header" in w[1] for w in b.warnings)
        r = run_cli(tmp, "report", "--json")
        data = json.loads(r.stdout)
        assert data["totals"]["headers"] == {"total": 2, "documented": 1}


def test_trace_comments_are_not_docs():
    text = ";81D570|E220    |      ;\n;;\n; @brief  Ok.\n;;\nfA_B:\n    RTS\n"
    P = doclint.parse_text(text, "src/code/bank_81/x.asm")
    assert len(P.blocks) == 1 and P.labels[0].documented and not P.errors


def test_cli_exit_codes():
    with tempfile.TemporaryDirectory() as tmp:
        make_repo(tmp, {"src/code/bank_83/toy.asm": GOOD, "src/common/ram.asm": COMMON})
        r = run_cli(tmp, "check")
        assert r.returncode == 0, r.stdout + r.stderr
        assert run_cli(tmp, "check", "--require-all").returncode == 1        # fToy_Spend, aToyUndocumented
        assert run_cli(tmp, "check", "--min-coverage", "99").returncode == 1
        assert run_cli(tmp, "check", "--min-coverage", "10").returncode == 0
        t = run_cli(tmp, "todo", "--file", "toy.asm")
        assert "fToy_Spend" in t.stdout and "aToyUndocumented" in t.stdout and "fToy_Feed" not in t.stdout
        assert "fToy_FallThrough" not in t.stdout and "fToy_FallThrough" in run_cli(tmp, "todo", "--file", "toy.asm", "--all").stdout
        rep = json.loads(run_cli(tmp, "report", "--json").stdout)
        assert rep["totals"]["routines"] == {"total": 4, "documented": 2}
    with tempfile.TemporaryDirectory() as tmp:
        make_repo(tmp, {"src/code/bank_83/bad.asm": BAD})
        assert run_cli(tmp, "check").returncode == 1


def test_resilience():
    """Odd or half written files must not crash the linter."""
    with tempfile.TemporaryDirectory() as tmp:
        make_repo(tmp, {"src/a.asm": "", "src/b.asm": ";;\n; @brief x\n", "src/c.asm": "fX:\n", "src/d.asm": "\n\n;;\n;;\n;;\n"})
        assert run_cli(tmp, "report").returncode == 0
        assert run_cli(tmp, "check").returncode == 1                      # b.asm / d.asm have syntax errors
        assert run_cli(tmp, "report", "--json").returncode == 0


def test_docgen():
    with tempfile.TemporaryDirectory() as tmp, tempfile.TemporaryDirectory() as out:
        make_repo(tmp, {"src/code/bank_83/toy.asm": GOOD, "src/common/ram.asm": COMMON})
        w = docgen.generate(tmp, out, "html")
        names = {p.name for p in w}
        assert {"index.html", "symbols.html", "code_bank_83_toy.html"} <= names, names
        page = (Path(out) / "code_bank_83_toy.html").read_text(encoding="utf-8")
        assert 'id="fToy_Feed"' in page and "Feeds the toy cow." in page and "$83B000-$83FFFF" in page
        assert 'href="#fToy_Second"' in page                                 # @calls link inside the module
        assert "Called by (from @calls)" in page
        syms = (Path(out) / "symbols.html").read_text(encoding="utf-8")
        assert "aToyRation" in syms
        w = docgen.generate(tmp, out, "md")
        md = (Path(out) / "code_bank_83_toy.md").read_text(encoding="utf-8")
        assert "### fToy_Feed" in md and "[fToy_Second](#ftoy_second)" in md


if __name__ == "__main__":
    for name, fn in sorted(globals().items()):
        if name.startswith("test_") and callable(fn):
            fn()
            print("ok", name)
    print("all tests passed")
