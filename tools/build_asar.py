#!/usr/bin/env python3
"""Builds the pinned asar assembler (git submodule third_party/asar) and installs it into tools/bin/.

    git submodule update --init            # once, fetches third_party/asar (pinned to v1.91)
    python tools/build_asar.py             # needs cmake and a C++ compiler

Works on Linux, macOS and Windows (MSVC, MinGW or any other generator cmake finds).
tools/build.py picks the result up automatically (tools/bin/asar or tools/bin/asar.exe).
"""
import os
import shutil
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
SRC = ROOT / "third_party" / "asar" / "src"
BUILD = ROOT / "build" / "asar"
OUT = ROOT / "tools" / "bin"


def run(cmd):
    print("+", " ".join(str(c) for c in cmd), flush=True)
    subprocess.run([str(c) for c in cmd], check=True)


def main() -> int:
    if not (SRC / "CMakeLists.txt").is_file():
        sys.exit("third_party/asar is empty. Run: git submodule update --init")
    if shutil.which("cmake") is None:
        sys.exit("cmake not found. Install cmake (see docs/building.md).")
    exe = "asar.exe" if os.name == "nt" else "asar"
    run(["cmake", "-S", SRC, "-B", BUILD, "-DCMAKE_BUILD_TYPE=Release",
         "-DASAR_GEN_EXE=ON", "-DASAR_GEN_DLL=OFF", "-DASAR_GEN_LIB=OFF",
         "-DASAR_GEN_EXE_TEST=OFF", "-DASAR_GEN_DLL_TEST=OFF"])
    run(["cmake", "--build", BUILD, "--target", "asar-standalone", "--config", "Release", "--parallel"])
    found = [p for p in BUILD.rglob(exe) if p.is_file()]
    if not found:
        sys.exit("asar binary not found under %s" % BUILD)
    OUT.mkdir(parents=True, exist_ok=True)
    dest = OUT / exe
    shutil.copy2(found[0], dest)
    dest.chmod(0o755)
    print("asar installed:", dest)
    return 0


if __name__ == "__main__":
    sys.exit(main())
