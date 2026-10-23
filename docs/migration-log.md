# Dziennik migracji

## Stan wyjściowy (przed przebudową)
- Źródłem prawdy był eksport z DiztinGUIsh 2.5.0.0 (`ASMUS` itd.), a `cleanup.bat` + parsery regexowe nadpisywały `ASM\SOURCE`.
- Build US był bit-identyczny z oryginałem (MD5 `c9bf36a816b6d54aed79d43a6c45111a`), bez automatycznej weryfikacji.
- Kod 65816 (US): ok. 38 tys. instrukcji; 1594 etykiet, z czego ok. 316 z „Unknown" w nazwie i 381 automatycznych.

## Zrobione
| Faza | Opis | Weryfikacja |
|---|---|---|
| 0 | `tools/build.py`, `tools/verify.py`, CI, `.gitattributes` | hash US zgodny |
| 1a | przeniesienie plików do `src/` bez zmian treści | hash US zgodny |
| 1b | podział banków 80–85 na moduły (konkatenacja == oryginał) | hash US zgodny |
| 2 | skrypty AI (US): 7622 surowych adresów → etykiety (`<skrypt>_Lnnn`) | hash US zgodny |

## Stan wersji regionalnych (z analizy przed migracją)
| Region | Kod 80–84 | Uwagi |
|---|---|---|
| US | pełny, nazwany | baza |
| EU | pełny eksport z Diz | bez nazw z US |
| JP | bank 80 pełny, 81–84 częściowo | dialogi w AA–AC |
| DE | brak (same `db`) | wymaga disassemblera od zera |

Skrypty AI i dialogi istnieją w repo dla wszystkich czterech regionów; migracja etykiet (faza 2) objęła na razie tylko US.
Narzędzie `tools/migration/ai_labels.py` jest przygotowane do użycia na pozostałych regionach po dodaniu ich buildów.
