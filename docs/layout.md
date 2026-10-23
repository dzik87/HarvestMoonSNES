# Układ projektu i mapa ROM (LoROM, 2 MB)

Mapowanie: LoROM, 64 banki po 32 KB ($80–$BF). Nagłówek i wektory: `src/code/header.asm` ($80FFB0).

| Banki | Zawartość | Źródło |
|---|---|---|
| $80–$85 | kod 65816 (rdzeń, paleta, narzędzia, dźwięk, silnik gry, mapy, AI, wejście) | `src/code/bank_8x/` |
| $86–$87 | dane obiektów | `src/data/objects/` |
| $88–$91 | grafika sprite'ów | `src/data/gfx/sprites/` |
| $92–$A0 | grafika kafli | `src/data/gfx/tiles/` |
| $A1–$A6 | grafika postaci | `src/data/gfx/characters/` |
| $A7 | tilemapy | `src/data/tilemaps/` |
| $A8–$A9 | palety | `src/data/gfx/palettes/` |
| $AA–$AC | dialogi JP (puste w US/EU/DE) | `src/data/dialogs/jp/` |
| $AD–$B2 | audio (zawartość wygląda na program i dane SPC700 — do potwierdzenia) | `src/data/audio/` |
| $B3–$B5 | skrypty AI (US: jeden plik na skrypt, `src/ai/us/scripts/`) | `src/ai/<region>/` |
| $B6–$BB | dialogi US/EU/DE | `src/data/dialogs/<region>/` |
| $BC–$BF | nieużywane (zera) | — |

## Moduły kodu

Podział banków 80–85 jest bezstratny (konkatenacja modułów daje dokładnie dawny plik banku).
Granice wynikają z `notes.txt` (banki 80, 82, 83, 84) oraz z klastrów nazw etykiet (81, 85).
Nazwy modułów są robocze i mogą się zmieniać wraz z postępem nazewnictwa kodu.
Każdy moduł (poza pierwszym w banku) zaczyna się komentarzem z adresem startu.

## Konwencje nazw

Prefiksy: `f` procedura, `a` tablica danych, `p` wskaźnik, `s` struktura/dane złożone, `n` liczba/stała,
`strc` struktura RAM. Etykiety automatyczne z DiztinGUIsh (`DATA8_xxxxxx` itp.) są stopniowo zastępowane.
