# Harvest Moon (SNES) — dekompilacja

Odtworzenie kompilowalnego kodu źródłowego gry (wersja US jest bazą; JP/DE/EU w trakcie).
Kompilator: [asar](https://github.com/RPGHacker/asar) 1.91. Wynik build-u musi być **bit-identyczny** z oryginalnym ROM-em.

## Szybki start

```
python tools/build.py          # build + weryfikacja (potrzebny asar: --asar, $ASAR lub tools/bin/)
python tools/verify.py build/HarvestMoon.sfc --rom "ścieżka/do/oryginału.sfc"   # diagnoza różnic
```

ROM-ów nie ma w repozytorium. Wartości wzorcowe (rozmiar, CRC32, MD5, SHA-1) są w `tests/expected.json`.
CI (GitHub Actions) buduje asara ze źródeł, kompiluje ROM i porównuje hashe przy każdym pushu i PR.

> Repozytorium jest w trakcie przebudowy (gałąź `overhaul`). Plan i stan prac: `docs/`.
