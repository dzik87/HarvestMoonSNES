# Harvest Moon (SNES) — dekompilacja

Odtworzenie kompilowalnego kodu źródłowego gry. Bazą jest wersja **US**; JP/DE/EU są w trakcie przenoszenia
do wspólnego drzewa. Kompilator: [asar](https://github.com/RPGHacker/asar) 1.91.
Zasada nadrzędna: wynik kompilacji musi być **bit-identyczny** z oryginalnym ROM-em.

## Szybki start

```
python tools/build.py                    # build + weryfikacja hashy (asar: --asar, $ASAR lub tools/bin/)
python tools/verify.py build/HarvestMoon.sfc --rom "oryginal.sfc"   # raport różnic na poziomie banków
```

ROM-ów nie ma w repozytorium. Wartości wzorcowe (rozmiar, CRC32, MD5, SHA-1) są w `tests/expected.json`.
CI (GitHub Actions) buduje asara ze źródeł, kompiluje ROM i porównuje hashe przy każdym pushu i PR.

## Układ repozytorium

| Ścieżka | Zawartość |
|---|---|
| `src/main.asm` | punkt wejścia (mapowanie LoROM, kolejność włączeń) |
| `src/common/` | rejestry SNES, mapa RAM, struktury, enumy, makra kodu |
| `src/code/bank_80 … bank_85/` | kod 65816 podzielony na moduły tematyczne |
| `src/ai/` | interpreter skryptów AI: definicje komend (`commands.asm`) i skrypty per region |
| `src/data/` | grafika, tilemapy, obiekty, audio, dialogi |
| `tools/` | build, weryfikacja, narzędzia migracyjne (`tools/migration/`) |
| `docs/` | dokumentacja (układ, workflow, dziennik migracji, komendy AI) |
| `tests/` | wartości wzorcowe hashy |

Szczegóły: [`docs/layout.md`](docs/layout.md), [`docs/workflow.md`](docs/workflow.md),
[`docs/migration-log.md`](docs/migration-log.md).
