# Building the ROM

The project builds all four releases (US, EU, DE, JP) from one tree with [asar](https://github.com/RPGHacker/asar)
1.91 and checks the result against the hashes in `tests/expected.json`. No original ROM is needed to build; the dumps are
only used by a few optional extraction/verification tools and must never be committed.

## Requirements

| Tool | Version | Used for |
|---|---|---|
| git | any recent | clone, submodule |
| Python | 3.9+ | build driver and asset tools |
| Pillow (`pip install pillow`) | any recent | PNG sources |
| cmake + C++ compiler | cmake 3.x, GCC/Clang/MSVC | building asar from the submodule |

asar is pinned as the git submodule `third_party/asar` (tag `v1.91`). Always build with that version: other asar
releases may assemble the sources differently.

## Linux (Debian/Ubuntu)

```sh
sudo apt install git python3 python3-pip cmake g++ make
git clone --recurse-submodules https://github.com/dzik87/HarvestMoonSNES
cd HarvestMoonSNES
pip install pillow            # add --break-system-packages on distributions that require it
python3 tools/build_asar.py   # builds third_party/asar, installs tools/bin/asar
python3 tools/build.py        # US; use --region EU|DE|JP for the other releases
```

Other distributions: install the same packages with the local package manager (`dnf install git python3 python3-pip cmake gcc-c++ make`,
`pacman -S git python python-pip cmake gcc make`). macOS: `brew install cmake python git`, then the same commands.

## Windows

Option A, Visual Studio (recommended):

1. Install [Git for Windows](https://git-scm.com/download/win), [Python 3](https://www.python.org/downloads/windows/)
   (tick "Add python.exe to PATH") and [CMake](https://cmake.org/download/) (tick "Add CMake to the system PATH").
2. Install "Visual Studio Build Tools" with the workload "Desktop development with C++".
3. Open "x64 Native Tools Command Prompt for VS" and run:

```bat
git clone --recurse-submodules https://github.com/dzik87/HarvestMoonSNES
cd HarvestMoonSNES
py -m pip install pillow
py tools\build_asar.py
py tools\build.py
```

Option B, MSYS2 (MinGW): install [MSYS2](https://www.msys2.org/), open the "MSYS2 UCRT64" shell and run
`pacman -S git make mingw-w64-ucrt-x86_64-gcc mingw-w64-ucrt-x86_64-cmake mingw-w64-ucrt-x86_64-python mingw-w64-ucrt-x86_64-python-pillow`,
then the same `git clone` / `python tools/build_asar.py` / `python tools/build.py` commands.

Option C, prebuilt asar: download `asar.exe` v1.91 from the [asar releases](https://github.com/RPGHacker/asar/releases) and
place it in `tools\bin\`, or pass `--asar PATH` / set the `ASAR` environment variable.

## Build and verify

```sh
python3 tools/build.py                 # US: generates assets, runs asar, compares size/CRC32/MD5/SHA-1
python3 tools/build.py --region EU     # EU, DE, JP likewise
python3 tools/build.py --no-assets     # skip regenerating assets (they must already exist under build/)
```

The output is `build/HarvestMoon.sfc` (or `--out`). A successful run ends with `[US] ROM MATCHES ORIGINAL`.
`tools/build.py` looks for asar in this order: `--asar`, `$ASAR`, `tools/bin/asar(.exe)`, `PATH`.

## Troubleshooting

* `third_party/asar is empty`: the clone was made without submodules. Run `git submodule update --init`.
* `asar not found`: run `python tools/build_asar.py` or see the lookup order above.
* `ModuleNotFoundError: PIL`: `pip install pillow`.
* Hash mismatch on a fresh clone: check `asar --version` prints `Asar 1.91`, and that no generated file is stale
  (delete `build/` and `assets/**/*.bin`, then build again).
* Python on Windows: use `py` or `python`; the tools never need a shell other than the one you started them from.

CI builds asar from the same submodule and runs the full set of checks on every push (`.github/workflows/build.yml`).
