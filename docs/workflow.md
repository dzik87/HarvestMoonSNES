# Workflow

## Zasady
1. Każda zmiana źródeł musi dawać ROM zgodny z `tests/expected.json` (CI to sprawdza przy każdym pushu/PR).
2. Zmiany strukturalne (przenoszenie, podział plików, zamiana adresów na etykiety) są robione skryptami
   (`tools/migration/`) i commitowane osobno od zmian znaczeniowych.
3. Nazewnictwo i dokumentacja nie mogą zmieniać wygenerowanych bajtów.

## Build lokalny
Potrzebny asar 1.91 (`asar.exe` na Windows). Podaj ścieżkę przez `--asar`, zmienną `ASAR` lub umieść plik w `tools/bin/`.
`tools/build.py` tworzy plik wyjściowy jako 2 MB zer, uruchamia asara z `-werror --no-title-check --fix-checksum=off`
i weryfikuje hashe. Diagnoza niezgodności: `python tools/verify.py build/HarvestMoon.sfc --rom oryginal.sfc`.

## CI (`.github/workflows/build.yml`)
Buduje asara ze źródeł (tag `v1.91`, cache), kompiluje ROM US, porównuje size/CRC32/MD5/SHA-1 i wystawia
wynik w adnotacjach przebiegu oraz artefakt `HarvestMoon-US`.
