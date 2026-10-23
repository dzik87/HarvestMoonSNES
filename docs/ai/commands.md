# Komendy skryptów AI (AICMD)

Dokument generowany przez `tools/docs/gen_ai_docs.py` z `docs/ai/commands/*.yml`.
Opisy pochodzą z analizy handlerów interpretera (`src/code/bank_84/ai_engine.asm`);
pole *pewność* mówi, jak jednoznacznie wynika to z kodu. Statystyki: skrypty regionu `US`.

Pewność opisów: confirmed: 56, probable: 34

| Opcode | Makro | Nazwa | Pewność | Długość | Wywołań | Skryptów |
|---|---|---|---|---|---|---|
| 0x00 | `AICMD0x00_SetMusic` | SetMusic | confirmed | 3 | 93 | 38 |
| 0x01 | `AICMD0x01_UnfreezeTime` | UnfreezeTime | confirmed | 1 | 10 | 8 |
| 0x02 | `AICMD0x02_FreezeTime` | FreezeTime | confirmed | 1 | 94 | 38 |
| 0x03 | `AICMD0x03_SetHour` | SetTimeId | probable | 2 | 91 | 33 |
| 0x04 | `AICMD0x04_Nop` | Nop | confirmed | 1 | 0 | 0 |
| 0x05 | `AICMD0x05_SetTransferPosition` | SetPlayerPosition | confirmed | 5 | 107 | 44 |
| 0x06 | `AICMD0x06_SetDestinationArea` | SetDestinationArea | confirmed | 2 | 94 | 31 |
| 0x07 | `AICMD0x07_SetPlayerDirection` | SetPlayerDirection | confirmed | 2 | 293 | 51 |
| 0x08 | `AICMD0x08_EnableAIControl` | EnableAIControl | confirmed | 1 | 175 | 57 |
| 0x09 | `AICMD0x09_StartScript` | StartScript | confirmed | 4 | 608 | 69 |
| 0x0A | `AICMD0x0A_ScreenFadein` | ScreenFadein | confirmed | 2 | 5 | 4 |
| 0x0B | `AICMD0x0B_SetScriptFlag` | SetScriptFlag | confirmed | 2 | 308 | 54 |
| 0x0C | `AICMD0x0C_WaitForScriptFlag` | WaitForScriptFlag | confirmed | 2 | 317 | 54 |
| 0x0D | `AICMD0x0D` | MoveObject | probable | 5 | 729 | 66 |
| 0x0E | `AICMD0x0E` | ApplyMusicChange | probable | 2 | 0 | 0 |
| 0x0F | `AICMD0x0F_ScreenFadeout` | ScreenFadeout | confirmed | 2 | 3 | 3 |
| 0x10 | `AICMD0x10_End` | End | confirmed | 1 | 395 | 72 |
| 0x11 | `AICMD0x11_EnableUserControl` | EnableUserControl | confirmed | 1 | 133 | 38 |
| 0x12 | `AICMD0x12_Jump` | Jump | confirmed | 3 | 3103 | 66 |
| 0x13 | `AICMD0x13_Wait` | Wait | confirmed | 3 | 1749 | 71 |
| 0x14 | `AICMD0x14_JumpIfFlagSet` | JumpIfBitSet | confirmed | 7 | 692 | 24 |
| 0x15 | `AICMD0x15_JumpIfEquals8` | JumpIfEquals8 | confirmed | 7 | 586 | 25 |
| 0x16 | `AICMD0x16_JumpIfBetween8` | JumpIfBetween8 | confirmed | 8 | 335 | 17 |
| 0x17 | `AICMD0x17_RollRandom` | RollRandom | confirmed | 2 | 126 | 10 |
| 0x18 | `AICMD0x18_JumpIfRandomEquals` | JumpIfRandomEquals | confirmed | 4 | 205 | 10 |
| 0x19 | `AICMD0x19` | SetPlayerSprite | probable | 4 | 151 | 31 |
| 0x1A | `AICMD0x1A` | SpawnNpc | probable | 8 | 737 | 74 |
| 0x1B | `AICMD0x1B` | SetSprite | probable | 4 | 1304 | 68 |
| 0x1C | `AICMD0x1C_ShowDialog` | ShowDialog | confirmed | 4 | 1810 | 45 |
| 0x1D | `AICMD0x1D_ShowDialog` | ShowDialogWithChoice | confirmed | 4 | 62 | 19 |
| 0x1E | `AICMD0x1E` | JumpIfTalkedTo | probable | 3 | 0 | 0 |
| 0x1F | `AICMD0x1F` | JumpIfTalkedTo | probable | 3 | 261 | 22 |
| 0x20 | `AICMD0x20_JumpIfChoice` | JumpIfChoice | confirmed | 4 | 125 | 19 |
| 0x21 | `AICMD0x21_AddValue8` | AddValue8 | confirmed | 5 | 3 | 2 |
| 0x22 | `AICMD0x22` | StartRandomWalk | probable | 7 | 70 | 23 |
| 0x23 | `AICMD0x23_OrWithIndexedValue` | SetBit | confirmed | 5 | 219 | 37 |
| 0x24 | `AICMD0x24_NextHourPalette` | SetNextPalette | confirmed | 2 | 6 | 6 |
| 0x25 | `AICMD0x25_RemoveActor` | RemoveActor | confirmed | 2 | 6 | 5 |
| 0x26 | `AICMD0x26_ClearBitAs0x28` | ClearBit | confirmed | 5 | 0 | 0 |
| 0x27 | `AICMD0x27_ClearBitAs0x28` | ClearBit | confirmed | 5 | 0 | 0 |
| 0x28 | `AICMD0x28_ClearBit` | ClearBit | confirmed | 5 | 60 | 21 |
| 0x29 | `AICMD0x29_SetMapScrooling` | SetMapScroll | confirmed | 6 | 10 | 4 |
| 0x2A | `AICMD0x2A` | StartTileSequence | probable | 3 | 4 | 3 |
| 0x2B | `AICMD0x2B` | SpawnActor | probable | 4 | 22 | 1 |
| 0x2C | `AICMD0x2C` | PlaySoundWait | probable | 6 | 4 | 2 |
| 0x2D | `AICMD0x2D_JumpOnInteract` | JumpOnInteract | confirmed | 5 | 181 | 16 |
| 0x2E | `AICMD0x2E` | StartWander | probable | 5 | 22 | 2 |
| 0x2F | `AICMD0x2F` | SetActorSpriteTable | probable | 3 | 75 | 4 |
| 0x30 | `AICMD0x30_UpdateChicken` | UpdateChicken | probable | 1 | 3 | 1 |
| 0x31 | `AICMD0x31_UpdateCow` | UpdateCow | probable | 1 | 9 | 1 |
| 0x32 | `AICMD0x32_SetValue16` | SetValue16 | confirmed | 6 | 18 | 8 |
| 0x33 | `AICMD0x33` | UpdateMole | probable | 1 | 2 | 1 |
| 0x34 | `AICMD0x34` | UpdatePickup | probable | 1 | 1 | 1 |
| 0x35 | `AICMD0x35_UpdateHorse` | UpdateHorse | probable | 1 | 3 | 1 |
| 0x36 | `AICMD0x36_UpdateDog` | UpdateDog | probable | 1 | 3 | 2 |
| 0x37 | `AICMD0x37` | RemoveObject | probable | 1 | 104 | 41 |
| 0x38 | `AICMD0x38_WaitForFadeIn` | WaitForFadeIn | confirmed | 1 | 150 | 55 |
| 0x39 | `AICMD0x39_WalkForTime` | WalkForTime | confirmed | 4 | 335 | 40 |
| 0x3A | `AICMD0x3A_RunForTime` | RunForTime | confirmed | 4 | 274 | 17 |
| 0x3B | `AICMD0x3B` | SetCarryItemHolding | probable | 2 | 5 | 4 |
| 0x3C | `AICMD0x3C` | TeleportToHouse | probable | 1 | 22 | 12 |
| 0x3D | `AICMD0x3D_TeleportToArea` | TeleportToArea | confirmed | 2 | 68 | 35 |
| 0x3E | `AICMD0x3E_SetCarryItem` | PickUpCarryItem | probable | 2 | 87 | 10 |
| 0x3F | `AICMD0x3F_ThrowCarriedItem` | ThrowCarriedItem | confirmed | 1 | 74 | 10 |
| 0x40 | `AICMD0x40_DisableTileInteractions` | DisableTileInteractions | probable | 1 | 32 | 18 |
| 0x41 | `AICMD0x41_AddValue16` | AddValue16 | confirmed | 6 | 462 | 36 |
| 0x42 | `AICMD0x42_AddValue24` | AddMoney | confirmed | 7 | 5 | 5 |
| 0x43 | `AICMD0x43_JumpIfEqual16` | JumpIfEqual16 | confirmed | 8 | 28 | 3 |
| 0x44 | `AICMD0x44_JumpIfEqual24` | JumpIfEqual24 | confirmed | 9 | 0 | 0 |
| 0x45 | `AICMD0x45_JumpIfBetween16` | JumpIfBetween16 | confirmed | 10 | 219 | 16 |
| 0x46 | `AICMD0x46_JumpIfBetween24` | JumpIfBetween24 | confirmed | 12 | 3 | 3 |
| 0x47 | `AICMD0x47_SetValue8` | SetValue8 | confirmed | 5 | 78 | 15 |
| 0x48 | `AICMD0x48_SetValue24` | SetValue24 | confirmed | 7 | 0 | 0 |
| 0x49 | `AICMD0x49` | SetSpriteTableFacingPlayer | probable | 3 | 2 | 1 |
| 0x4A | `AICMD0x4A` | PickUpObjectOnButtonA | probable | 1 | 3 | 3 |
| 0x4B | `AICMD0x4B` | ReplaceMapTile | probable | 6 | 2 | 1 |
| 0x4C | `AICMD0x4C` | SetPassable | probable | 1 | 3 | 2 |
| 0x4D | `AICMD0x4D_JumpIfBlueFeatherUsed` | JumpIfBlueFeatherUsed | confirmed | 3 | 133 | 8 |
| 0x4E | `AICMD0x4E_EnableTileInteractions` | EnableTileInteractions | confirmed | 1 | 2 | 2 |
| 0x4F | `AICMD0x4F_DisableToolUse` | DisableToolUse | confirmed | 1 | 27 | 8 |
| 0x50 | `AICMD0x50` | ReleaseCarried | probable | 1 | 66 | 24 |
| 0x51 | `AICMD0x51` | ReleaseCarriedAnimal | probable | 1 | 1 | 1 |
| 0x52 | `AICMD0x52` | PickUpObjectForEventA | probable | 1 | 1 | 1 |
| 0x53 | `AICMD0x53` | PickUpObjectForEventB | probable | 1 | 1 | 1 |
| 0x54 | `AICMD0x54_ShowDialog` | ShowDialogAutoClose | probable | 4 | 37 | 3 |
| 0x55 | `AICMD0x55_JumpIfFlagNotSet` | JumpIfFlagNotSet | confirmed | 7 | 34 | 3 |
| 0x56 | `AICMD0x56_UseEquippedItem` | UseEquippedItem | confirmed | 1 | 99 | 5 |
| 0x57 | `AICMD0x57_UpdateStamina` | UpdateStamina | confirmed | 2 | 16 | 2 |
| 0x58 | `AICMD0x58_ReplaceFarmTile` | ReplaceFarmTile | confirmed | 6 | 545 | 1 |
| 0x59 | `AICMD0x59_SwapEquippedItems` | SwapEquippedItems | confirmed | 1 | 9 | 1 |

## 0x00 — SetMusic

- Makro: `AICMD0x00_SetMusic` · handler: `fAIAction0x00_SetMusicTrack` ($8489BB) · pewność: **confirmed**
- Długość: 3 B · użycie: 93 wywołań w 38 skryptach

Ustawia zadany utwor muzyczny w strcAudio.trackId.

| Parametr | Offset | Rozmiar | Typ | Znaczenie |
|---|---|---|---|---|
| `nMusicTrackId` | 1 | 1 | n8 | Id utworu zapisywany do strcAudio.trackId ($7E:0110). Wartosci w skryptach np. $07, $09, $0E. |
| `nUnused` | 2 | 1 | n8 | Ignorowany przez handler (wskaznik jest tylko przesuwany). W skryptach US zawsze $B4 (numer banku skryptu) - 91 uzyc, 2 uzycia z $00. |

Handler przesuwa ptrAIActionData o 1, czyta bajt i zapisuje go do strcAudio.trackId, po czym przesuwa wskaznik jeszcze o 2 (lacznie 3 bajty). Nie wola procedur audio i nie blokuje - sama zmiana utworu nastepuje dopiero gdy silnik audio porowna trackId z trackIdCopy ($7E:0117), np. w fAudioUnknown_8382C6 / fAudioUnknown_838380 lub po komendzie 0x0E.

RAM: `strcAudio.trackId`, `ptrAIActionData`

> Otwarte pytania: Drugi argument jest ignorowany; wartosc $B4 wyglada na pozostalosc po numerze banku skryptu. Brak enuma na id utworow.

Przykłady z skryptów:
```
%AICMD0x00_SetMusic($07, $B4)   ; pAIScripting0x0E @ $B3F10D
%AICMD0x00_SetMusic($08, $B4)   ; pAIScripting0x0E @ $B3FDDB
```

## 0x01 — UnfreezeTime

- Makro: `AICMD0x01_UnfreezeTime` · handler: `fAIAction0x01_UnfreezeTime` ($8489E3) · pewność: **confirmed**
- Długość: 1 B · użycie: 10 wywołań w 8 skryptach

Wznawia uplyw czasu w grze (nTimeState = 1).

Zapisuje 1 do nTimeState ($7E:0973; 00 = stop, 01 = bieg), kasuje bit $0001 w strcFlags.daily2 oraz ustawia bit $0020 w strcDialogDisplay.mapFlags ($7E:0196). Para z komenda 0x02 (odwrotne operacje). Nie blokuje.

RAM: `nTimeState`, `strcFlags.daily2`, `strcDialogDisplay.mapFlags`, `ptrAIActionData`

> Otwarte pytania: Dokladne znaczenie bitu $0020 w mapFlags (AFLAGS_UNK0020) i bitu $0001 w daily2 nieustalone - wiadomo tylko, ze sa przelaczane razem z nTimeState.

Przykłady z skryptów:
```
%AICMD0x01_UnfreezeTime()   ; pAIScripting0x0F_StarNightFestival @ $B4802E
```

## 0x02 — FreezeTime

- Makro: `AICMD0x02_FreezeTime` · handler: `fAIAction0x02_FreezeTime` ($848A0D) · pewność: **confirmed**
- Długość: 1 B · użycie: 94 wywołań w 38 skryptach

Zatrzymuje uplyw czasu w grze (nTimeState = 0).

Zapisuje 0 do nTimeState, ustawia bit $0001 w strcFlags.daily2 i kasuje bit $0020 w strcDialogDisplay.mapFlags. Odwrotnosc komendy 0x01. Nie blokuje. Najczesciej uzywana komenda w skryptach (ok. 94 uzyc).

RAM: `nTimeState`, `strcFlags.daily2`, `strcDialogDisplay.mapFlags`, `ptrAIActionData`

> Otwarte pytania: Jak w 0x01 - semantyka bitow daily2 $0001 i mapFlags $0020.

Przykłady z skryptów:
```
%AICMD0x02_FreezeTime()   ; pAIScripting0x09 @ $B3E624
```

## 0x03 — SetTimeId

- Makro: `AICMD0x03_SetHour` · handler: `fAIAction0x03_SetHour` ($848A39) · pewność: **probable**
- Długość: 2 B · użycie: 91 wywołań w 33 skryptach

Ustawia nCurrentTimeID na podana wartosc.

| Parametr | Offset | Rozmiar | Typ | Znaczenie |
|---|---|---|---|---|
| `nCurrentTimeID` | 1 | 1 | n8 | Wartosc zapisywana do nCurrentTimeID ($7F:1F1C). W skryptach spotykane $07, $11, $12 (wygladaja na godziny 7/17/18). |

Zapisuje bajt argumentu (long, 8-bit) do nCurrentTimeID. Nie rusza nInGameHourCounter ani nInGameMinuteCounter, nie wola zadnych procedur, nie blokuje.

RAM: `nCurrentTimeID`, `ptrAIActionData`

> Otwarte pytania: Czy nCurrentTimeID to dokladnie godzina czy indeks pory dnia - nazwa makra SetHour jest przypuszczeniem; z handlera wynika tylko zapis do nCurrentTimeID.

Przykłady z skryptów:
```
%AICMD0x03_SetHour($07)   ; pAIScripting0x0B @ $B3E9FB
%AICMD0x03_SetHour($11)   ; pAIScripting0x0F_StarNightFestival @ $B48084
```

## 0x04 — Nop

- Makro: `AICMD0x04_Nop` · handler: `fAIAction0x04_DoesNothing` ($848A58) · pewność: **confirmed**
- Długość: 1 B · użycie: 0 wywołań w 0 skryptach

Pusta komenda (NOP) - tylko przesuwa wskaznik o 1 bajt.

Handler wykonuje wylacznie ptrAIActionData += 1. Brak innych efektow. Literowka w nazwie makra: Emtpy -> Empty.

RAM: `ptrAIActionData`

## 0x05 — SetPlayerPosition

- Makro: `AICMD0x05_SetTransferPosition` · handler: `fAIAction0x05_SetTransferPosition` ($848A65) · pewność: **confirmed**
- Długość: 5 B · użycie: 107 wywołań w 44 skryptach

Ustawia pozycje gracza i pozycje docelowa transferu mapy na (X, Y).

| Parametr | Offset | Rozmiar | Typ | Znaczenie |
|---|---|---|---|---|
| `nDestinationX` | 1 | 2 | n16 | Wspolrzedna X (piksele mapy) - zapisywana do strcDialogDisplay.mapDestX ($7E:017D) oraz strcPlayer.posX ($D6). |
| `nDestinationY` | 3 | 2 | n16 | Wspolrzedna Y - zapisywana do strcDialogDisplay.mapDestY ($7E:017F) oraz strcPlayer.posY ($D8). |

Handler (A 16-bit) czyta dwa slowa po kolei i zapisuje kazde do pary: pole mapDest* w strcDialogDisplay oraz biezaca pozycje gracza strcPlayer.posX/posY. Nie blokuje.

RAM: `strcDialogDisplay.mapDestX`, `strcDialogDisplay.mapDestY`, `strcPlayer.posX`, `strcPlayer.posY`, `ptrAIActionData`

> Otwarte pytania: Jednostka (piksel vs. kafelek): wartosci w skryptach np. 264,312 / 128,440 wskazuja na piksele, ale nie zweryfikowano w kodzie renderowania.

Przykłady z skryptów:
```
%AICMD0x05_SetTransferPosition(144, 456)   ; pAIScripting0x00_General @ $B392C8
%AICMD0x05_SetTransferPosition(96, 120)   ; pAIScripting0x09 @ $B3E625
```

## 0x06 — SetDestinationArea

- Makro: `AICMD0x06_SetDestinationArea` · handler: `fAIAction0x06_SetDestinationArea` ($848A94) · pewność: **confirmed**
- Długość: 2 B · użycie: 94 wywołań w 31 skryptach

Ustawia docelowy obszar (mape), a skrypt oddaje sterowanie na 1 klatke.

| Parametr | Offset | Rozmiar | Typ | Znaczenie |
|---|---|---|---|---|
| `nAreaId` | 1 | 1 | enum | Id obszaru (enumy !AREA_* z enums.asm, np. !AREA_COOP, !AREA_COWBARN, !AREA_ENDINGxx) zapisywany do nDestinationAreaId ($7E:098B). |

Zapisuje bajt do nDestinationAreaId. Dodatkowo zwieksza 16-bitowy licznik oczekiwania slotu skryptu (offset +$10 w strukturze 64 B pod ptrAIUnknown0xCC) o 1, czyli petla skryptu zatrzymuje ten slot na kolejna klatke (wait 1). Samo wczytanie mapy dzieje sie poza komenda.

RAM: `nDestinationAreaId`, `ptrAIActionData`, `slot[+0x10] (wait counter)`

Przykłady z skryptów:
```
%AICMD0x06_SetDestinationArea(!AREA_INTRO)   ; pAIScripting0x09 @ $B3E635
%AICMD0x06_SetDestinationArea(!AREA_FARMSPRING)   ; pAIScripting0x0A @ $B3E86A
```

## 0x07 — SetPlayerDirection

- Makro: `AICMD0x07_SetPlayerDirection` · handler: `fAIAction0x07_SetPlayerDirection` ($848ABF) · pewność: **confirmed**
- Długość: 2 B · użycie: 293 wywołań w 51 skryptach

Ustawia kierunek patrzenia gracza.

| Parametr | Offset | Rozmiar | Typ | Znaczenie |
|---|---|---|---|---|
| `nPlayerDirection` | 1 | 1 | enum | Kierunek gracza, enum !PDIR_* (DOWN=0, UP=1, LEFT=2, RIGHT=3). Rozszerzany do 16 bitow. |

Bajt argumentu (z zerowanym starszym bajtem) trafia do strcPlayer.direction ($DA), strcObjectData.direction ($7E:0911) oraz strcObjectData.spriteIdx ($7E:0901), czyli ustawia tez indeks sprite'a obiektu gracza na wartosc kierunku. Nie blokuje.

RAM: `strcPlayer.direction`, `strcObjectData.direction`, `strcObjectData.spriteIdx`, `ptrAIActionData`

Przykłady z skryptów:
```
%AICMD0x07_SetPlayerDirection(!PDIR_UP)   ; pAIScripting0x00_General @ $B392CD
%AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)   ; pAIScripting0x09 @ $B3E62A
```

## 0x08 — EnableAIControl

- Makro: `AICMD0x08_EnableAIControl` · handler: `fAIAction0x08_EnableAIControl` ($848AE7) · pewność: **confirmed**
- Długość: 1 B · użycie: 175 wywołań w 57 skryptach

Odbiera graczowi sterowanie (kasuje PFLAGS_USERCONTROL) i zeruje wejscie sterowane przez AI.

Kasuje flage !PFLAGS_USERCONTROL ($4000) w strcPlayer.flags oraz zeruje strcAiControlData.input ($7E:08FD) i strcAiControlData.counter ($7E:08FF), dzieki czemu skrypt moze potem sterowac graczem komendami typu 0x39/0x3A (walk/run for time). Odwrotnosc komendy 0x11. Nie blokuje.

RAM: `strcPlayer.flags`, `strcAiControlData.input`, `strcAiControlData.counter`, `ptrAIActionData`

Przykłady z skryptów:
```
%AICMD0x08_EnableAIControl()   ; pAIScripting0x02 @ $B3B26C
```

## 0x09 — StartScript

- Makro: `AICMD0x09_StartScript` · handler: `fAIAction0x09` ($848B08) · pewność: **confirmed**
- Długość: 4 B · użycie: 608 wywołań w 69 skryptach

Uruchamia rownolegly skrypt w innym slocie (nDataIndex), zaczynajacy sie od pNextAction; biezacy skrypt idzie dalej.

| Parametr | Offset | Rozmiar | Typ | Znaczenie |
|---|---|---|---|---|
| `nDataIndex` | 1 | 1 | n8 | Indeks docelowego slotu skryptu (struktura 64 B pod $7E:B586 + idx*64, 49 slotow). Zapisywany tez w nowym slocie na offsecie +$3F. |
| `pNextAction` | 2 | 2 | script_ptr | Adres 16-bit poczatku skryptu w tym samym banku co biezacy skrypt (bank kopiowany z offsetu +$32 biezacego slotu). |

Zapamietuje biezacy slot (ptrAIUnknown0xCC -> ptrTemp0x72), przez fAI_SetCCPointer przelacza ptrAIUnknown0xCC na slot nDataIndex, kopiuje do niego bank (+$32), zapisuje 16-bitowy wskaznik do +$30, wola fAI_Unknown8488D4 (inicjalizacja slotu: active=1, flagi=0, liczniki, pozycja 0 itd.), zapisuje nDataIndex w +$3F i przywraca poprzedni slot. Potem ptrAIActionData += 4 calosci. Nie blokuje. Nowy slot zacznie sie wykonywac w petli slotow (w tej samej klatce jesli jego indeks jest wiekszy).

RAM: `ptrAIUnknown0xCC`, `ptrTemp0x72`, `ptrAIActionData`, `slot[nDataIndex]: +0 +1 +3..+6 +0C +0F +10 +12 +14 +1A +1C +30 +32 +3F`

Wywołuje: `fAI_SetCCPointer`, `fAI_Unknown8488D4`

> Otwarte pytania: Znaczenie wszystkich pol slotu resetowanych w fAI_Unknown8488D4 (strcAIUnknown.unkXX) nie jest w pelni opisane; nie sprawdzono, co dzieje sie gdy slot docelowy jest juz aktywny (jest nadpisywany bez sprawdzenia).

Przykłady z skryptów:
```
%AICMD0x09_StartScript($09, pAIScripting0x00_General_L061)   ; pAIScripting0x00_General @ $B38F99
%AICMD0x09_StartScript($0A, pAIScripting0x00_General_L066)   ; pAIScripting0x00_General @ $B38F9D
```

## 0x0A — ScreenFadein

- Makro: `AICMD0x0A_ScreenFadein` · handler: `fAIAction0x0A` ($848B83) · pewność: **confirmed**
- Długość: 2 B · użycie: 5 wywołań w 4 skryptach

Plynnie rozjasnia ekran (fade-in) od jasnosci 3 do 15; blokuje do konca.

| Parametr | Offset | Rozmiar | Typ | Znaczenie |
|---|---|---|---|---|
| `nUnused` | 1 | 1 | unknown | Ignorowany przez handler (wskaznik tylko przesuwany). We wszystkich uzyciach rowny $01. |

Ustawia n8Temp1=3 (jasnosc startowa), n8Temp2=3 (liczba klatek na krok), n8Temp3=$0F (jasnosc docelowa) i wola fCore_ScreenFadein, ktora w petli czeka na NMI (okolo 12 krokow po 3 klatki) i na koncu ustawia flage daily1 $8000. Blokuje cale wykonanie az do konca fade'u. Odpowiednik 0x0F.

RAM: `strcVariables.n8Temp1`, `strcVariables.n8Temp2`, `strcVariables.n8Temp3`, `strcSystem.nBrightness`, `strcSystem.nBrightnessStep`, `strcFlags.daily1`, `ptrAIActionData`

Wywołuje: `fCore_ScreenFadein`

> Otwarte pytania: Znaczenie bitu daily1 $8000 (prawdopodobnie 'ekran widoczny') - wiadomo tylko, ze fade-in go ustawia, a fade-out kasuje.

Przykłady z skryptów:
```
%AICMD0x0A_ScreenFadein($01)   ; pAIScripting0x08 @ $B3E4F6
```

## 0x0B — SetScriptFlag

- Makro: `AICMD0x0B_SetScriptFlag` · handler: `fAIAction0x0B` ($848BAC) · pewność: **confirmed**
- Długość: 2 B · użycie: 308 wywołań w 54 skryptach

Ustawia bit nFlagBit w globalnym polu flag skryptow $7F:1F7A (synchronizacja miedzy slotami).

| Parametr | Offset | Rozmiar | Typ | Znaczenie |
|---|---|---|---|---|
| `nFlagBit` | 1 | 1 | flag | Numer bitu 0-15 w 16-bitowym globalnym polu flag skryptow $7F:1F7A (maska z tablicy aAISetMask). |

Pobiera maske 1<<n z aAISetMask i robi OR do $7F:1F7A. Pole jest zerowane przy nowej grze (83ACC8) i przy wczytaniu mapy (809927). Uzywane w parze z 0x0C (czekanie na flage), np. skrypt glowny czeka az skrypty potomne (uruchomione 0x09) ustawia swoje bity.

RAM: `$7F1F7A`, `ptrAIActionData`

> Otwarte pytania: Brak symbolu RAM dla $7F:1F7A - warto dodac do ram.asm (np. nAIScriptFlags). Zakres n >15 daje odczyt poza tablica aAISetMask.

Przykłady z skryptów:
```
%AICMD0x0B_SetScriptFlag($00)   ; pAIScripting0x09 @ $B3E638
%AICMD0x0B_SetScriptFlag($03)   ; pAIScripting0x09 @ $B3E684
```

## 0x0C — WaitForScriptFlag

- Makro: `AICMD0x0C_WaitForScriptFlag` · handler: `fAIAction0x0C` ($848BDC) · pewność: **confirmed**
- Długość: 2 B · użycie: 317 wywołań w 54 skryptach

Czeka (klatka po klatce) az bit nFlagBit w $7F:1F7A bedzie ustawiony, po czym idzie dalej.

| Parametr | Offset | Rozmiar | Typ | Znaczenie |
|---|---|---|---|---|
| `nFlagBit` | 1 | 1 | flag | Numer bitu 0-15 w $7F:1F7A (jak w 0x0B). |

Testuje AND maska,$7F:1F7A. Jesli bit ustawiony: ptrAIActionData += 1 (lacznie 2 bajty) i skrypt biegnie dalej. Jesli nie: cofa wskaznik na bajt opcode (ptr -1 po wczesniejszym +1) i zwieksza licznik oczekiwania slotu (+$10) o 1, czyli slot oddaje sterowanie na klatke i komenda jest ponawiana - petla oczekiwania. Nie kasuje bitu.

RAM: `$7F1F7A`, `ptrAIActionData`, `slot[+0x10] (wait counter)`

Przykłady z skryptów:
```
%AICMD0x0C_WaitForScriptFlag($02)   ; pAIScripting0x09 @ $B3E63A
%AICMD0x0C_WaitForScriptFlag($04)   ; pAIScripting0x09 @ $B3E69D
```

## 0x0D — MoveObject

- Makro: `AICMD0x0D` · handler: `fAIAction0x0D` ($848C22) · pewność: **probable**
- Długość: 5 B · użycie: 729 wywołań w 66 skryptach

Ustawia wektor ruchu obiektu skryptu (dx, dy) oraz tempo i czas, i czeka na jego zakonczenie.

| Parametr | Offset | Rozmiar | Typ | Znaczenie |
|---|---|---|---|---|
| `nDeltaX` | 1 | 1 | n8 | Ze znakiem (np. $FF = -1, $FE = -2): przesuniecie X na krok. Zapis do slot+$03. |
| `nDeltaY` | 2 | 1 | n8 | Ze znakiem: przesuniecie Y na krok. Zapis do slot+$04. |
| `nDuration` | 3 | 1 | n8 | Zapis (8-bit) do slot+$10 = licznik oczekiwania slotu: liczba klatek, przez ktore skrypt czeka (np. $10, $A0, $30), czyli czas trwania ruchu. |
| `nStepFrames` | 4 | 1 | n8 | Co ile klatek wykonywany jest krok (zapis do slot+$05 i slot+$06). 1 = ruch co klatke, wieksze = wolniej. |

Zapisuje cztery bajty do slotu: +3 (dx), +4 (dy), +$10 (czas), +5 i +6 (okres kroku, +6 to licznik biezacy), po czym ustawia bit $20 w slot+1 (flaga ruchu). W fAI_Unknown848331 (wolane co klatke z fAI_Unknown848286 gdy flaga $20 ustawiona) licznik +6 jest zmniejszany, a po dojsciu do 0 przeladowywany z +5 i do pozycji slotu (+$1A X, +$1C Y) dodawane jest dx/dy rozszerzone znakiem do 16 bitow. Poniewaz +$10 jest niezerowe, slot czeka nDuration klatek. Flaga $20 nie jest kasowana przez ten kod, wiec ruch trwa do nastepnego 0x0D (np. z dx=dy=0).

RAM: `slot[+0x01] flags`, `slot[+0x03] dx`, `slot[+0x04] dy`, `slot[+0x05] step`, `slot[+0x06] step counter`, `slot[+0x10] wait counter`, `ptrAIActionData`

> Otwarte pytania: Interpretacja oparta na fAI_Unknown848331 i uzyciu w skryptach (np. (1,0,$10,1)); jednostka pozycji slotu (piksele) nie zweryfikowana; nie ustalono czy dotyczy tylko NPC czy tez gracza ani czy bajt starszy +$11 jest zawsze 0. Makro ma nazwy nUnknown1-4 do przemianowania.

Przykłady z skryptów:
```
%AICMD0x0D($00, $01, $40, $01)   ; pAIScripting0x00_General @ $B38E84
%AICMD0x0D($FF, $00, $80, $01)   ; pAIScripting0x00_General @ $B38E8D
```

## 0x0E — ApplyMusicChange

- Makro: `AICMD0x0E` · handler: `fAIAction0x0E` ($848CA8) · pewność: **probable**
- Długość: 2 B · użycie: 0 wywołań w 0 skryptach

Wola fAudioUnknown_838401: jesli zadany trackId rozni sie od odtwarzanego, wysyla do APU komende przejscia utworu.

| Parametr | Offset | Rozmiar | Typ | Znaczenie |
|---|---|---|---|---|
| `nUnused` | 1 | 1 | unknown | Ignorowany przez handler (ptr += 2). Komenda nie wystepuje w skryptach US (B3/B4/B5), wiec wartosc nieznana. |

Przesuwa ptrAIActionData o 2 i wola fAudioUnknown_838401: porownuje strcAudio.trackId z trackIdCopy ($7E:0117); gdy rozne i trackIdCopy != 0, ustawia strcAudio.unk112=1, unk113=$40 i wola fAudioUnknown_838D8B, ktora przez porty APUIO0-3 wysyla do SPC komende (1, parametr $40 - prawdopodobnie fade/zmiana utworu). Moze blokowac na handshake z APU. Razem z 0x00 (ustawienie trackId) tworzy pare 'ustaw utwor -> zastosuj'.

RAM: `strcAudio.trackId`, `strcAudio.trackIdCopy`, `strcAudio.unk112`, `strcAudio.unk113`, `ptrAIActionData`

Wywołuje: `fAudioUnknown_838401`, `fAudioUnknown_838D8B`

> Otwarte pytania: Dokladna semantyka komendy APU (1/$40) i fAudioUnknown_838D8B nie przeanalizowana (sam fade-out? start nowego utworu?); komenda nie jest uzywana w skryptach US, wiec nie da sie potwierdzic kontekstem. Nazwa to hipoteza.

## 0x0F — ScreenFadeout

- Makro: `AICMD0x0F_ScreenFadeout` · handler: `fAIAction0x0F_ScreenFadeout` ($848CB9) · pewność: **confirmed**
- Długość: 2 B · użycie: 3 wywołań w 3 skryptach

Plynnie sciemnia ekran (fade-out) od jasnosci 15 do 0; blokuje do konca.

| Parametr | Offset | Rozmiar | Typ | Znaczenie |
|---|---|---|---|---|
| `nUnused` | 1 | 1 | unknown | Ignorowany przez handler (wskaznik tylko przesuwany). We wszystkich uzyciach rowny $01. |

Ustawia n8Temp1=$0F (start), n8Temp2=3 (klatki na krok), n8Temp3=0 (cel) i wola fCore_ScreenFadeout (petla z czekaniem na NMI), ktora na koncu kasuje flage daily1 $8000. Blokuje wykonanie do konca fade'u. Odpowiednik 0x0A.

RAM: `strcVariables.n8Temp1`, `strcVariables.n8Temp2`, `strcVariables.n8Temp3`, `strcSystem.nBrightness`, `strcSystem.nBrightnessStep`, `strcFlags.daily1`, `ptrAIActionData`

Wywołuje: `fCore_ScreenFadeout`

Przykłady z skryptów:
```
%AICMD0x0F_ScreenFadeout($01)   ; pAIScripting0x09 @ $B3E64E
```

## 0x10 — End

- Makro: `AICMD0x10_End` · handler: `fAIAction0x10_End` ($848CE2) · pewność: **confirmed**
- Długość: 1 B · użycie: 395 wywołań w 72 skryptach

Konczy skrypt biezacego slotu (slot nieaktywny) bez przesuwania wskaznika.

Zapisuje 0 do slot+$00 (flaga aktywnosci) i zwieksza licznik oczekiwania slot+$10 o 1. ptrAIActionData nie jest zmieniany. Slot przestaje byc wykonywany przez petle slotow.

RAM: `slot[+0x00] active`, `slot[+0x10] wait counter`

Przykłady z skryptów:
```
%AICMD0x10_End()   ; pAIScripting0x00_General @ $B38DFB
```

## 0x11 — EnableUserControl

- Makro: `AICMD0x11_EnableUserControl` · handler: `fAIAction0x11_EnableUserControl` ($848CFD) · pewność: **confirmed**
- Długość: 1 B · użycie: 133 wywołań w 38 skryptach

Oddaje graczowi sterowanie (ustawia PFLAGS_USERCONTROL).

Ustawia flage !PFLAGS_USERCONTROL ($4000) w strcPlayer.flags. Odwrotnosc komendy 0x08. Nie blokuje.

RAM: `strcPlayer.flags`, `ptrAIActionData`

Przykłady z skryptów:
```
%AICMD0x11_EnableUserControl()   ; pAIScripting0x01 @ $B39379
```

## 0x12 — Jump

- Makro: `AICMD0x12_Jump` · handler: `fAIAction0x12_AlwaysJump` ($848D13) · pewność: **confirmed**
- Długość: 3 B · użycie: 3103 wywołań w 66 skryptach

Bezwarunkowy skok do komendy pNextAction w biezacym banku skryptu.

| Parametr | Offset | Rozmiar | Typ | Znaczenie |
|---|---|---|---|---|
| `pNextAction` | 1 | 2 | script_ptr | Mlodsze 16 bitow adresu nastepnej komendy. Bank (ptrAIActionData+2) pozostaje bez zmian, wiec skok jest mozliwy tylko w obrebie biezacego banku skryptow ($B3/$B4/$B5). |

Handler przesuwa ptrAIActionData o 1 (na argument), czyta slowo 16-bit i zapisuje je do ptrAIActionData (tylko 2 mlodsze bajty, bajt banku nietkniety). Nie zmienia licznika +$10 obiektu, wiec petla fAI_HowToPlaySetup wykonuje kolejna komende w tej samej klatce (nie blokuje). Uwaga: petla Jump->Jump bez komendy blokujacej (Wait/0x1F/dialog) zawiesilaby gre, dlatego w skryptach 'pollingi' zawsze zawieraja komende, ktora inkrementuje +$10 (np. 0x1F).

RAM: `ptrAIActionData`

Przykłady z skryptów:
```
%AICMD0x12_Jump(pAIScripting0x00_General_L002)   ; pAIScripting0x00_General @ $B38CCD
%AICMD0x12_Jump(pAIScripting0x00_General_L003)   ; pAIScripting0x00_General @ $B38CDB
```

## 0x13 — Wait

- Makro: `AICMD0x13_Wait` · handler: `fAIAction0x13_Wait` ($848D24) · pewność: **confirmed**
- Długość: 3 B · użycie: 1749 wywołań w 71 skryptach

Wstrzymuje wykonywanie skryptu danego obiektu AI na nTime klatek.

| Parametr | Offset | Rozmiar | Typ | Znaczenie |
|---|---|---|---|---|
| `nTime` | 1 | 2 | n16 | Liczba wywolan petli AI (fAI_HowToPlaySetup, wywolywanej raz na klatke z petli glownej) przez ktora skrypt tego obiektu czeka. Wartosc 0 = brak oczekiwania. Typowe: 1, 60, 180, 240. |

Zapisuje nTime (16-bit) do pola +$10 struktury obiektu AI wskazywanej przez ptrAIUnknown0xCC (strcAIUnknown.unk10, licznik oczekiwania). Petla fAI_HowToPlaySetup przy kazdym wywolaniu dekrementuje +$10 dla aktywnych obiektow i wykonuje komendy dopoki +$10 = 0; po wykonaniu komendy z +$10 != 0 obiekt przestaje byc przetwarzany w tej klatce. Dzieki temu kolejna komenda wykona sie nTime klatek po Wait (Wait(1) = pominiecie jednej klatki). Skrypt czeka tylko dla biezacego obiektu (kazdy obiekt AI ma wlasny licznik); petla AI jest pomijana calkowicie gdy strcDialogDisplay.mapUnk19A == 2 lub 6 (dialog) albo gdy akcja gracza = PACTION_JUMP.

RAM: `ptrAIActionData`, `ptrAIUnknown0xCC+$10`

> Otwarte pytania: Jednostka czasu to wywolania petli AI, nie jest potwierdzone, ze petla jest wolana dokladnie raz na klatke we wszystkich 10 miejscach wywolania fAI_HowToPlaySetup (core.asm, routines.asm, main_loop.asm, interaction_data.asm).

Przykłady z skryptów:
```
%AICMD0x13_Wait(60)   ; pAIScripting0x00_General @ $B38D4A
%AICMD0x13_Wait(1)   ; pAIScripting0x00_General @ $B38DED
```

## 0x14 — JumpIfBitSet

- Makro: `AICMD0x14_JumpIfFlagSet` · handler: `fAIAction0x14_JumpIfFlagSet` ($848D44) · pewność: **confirmed**
- Długość: 7 B · użycie: 692 wywołań w 24 skryptach

Skok do pNextAction jesli bit nIndex w 16-bitowym slowie pod nAddress jest ustawiony.

| Parametr | Offset | Rozmiar | Typ | Znaczenie |
|---|---|---|---|---|
| `nAddress` | 1 | 3 | ram_ptr | Adres 24-bit slowa 16-bit w pamieci (w skryptach prawie zawsze strcFlags.* w $7F:1F5A..., czyli daily1-5, event1-7, unknown1 itd.). |
| `nIndex` | 4 | 1 | n8 | Numer bitu 0-15. Handler indeksuje aAISetMask (16 slow, 1<<n) wartoscia nIndex*2, wiec maska = 1<<nIndex. Wartosci >15 czytaja poza tablica (nie uzywane). |
| `pNextAction` | 5 | 2 | script_ptr | Mlodsze 16 bitow adresu komendy, do ktorej skok nastapi gdy bit jest ustawiony (bank bez zmian). |

Handler sklada 24-bitowy wskaznik do $72-$74 (ptrTemp0x72), pobiera maske z aAISetMask[nIndex], wykonuje 16-bitowe LDA [ptrTemp0x72] AND maska. Wynik != 0 -> ptrAIActionData = pNextAction (16 bit). Wynik = 0 -> wskaznik przesuniety za komende (lacznie 7 bajtow). Uzywa strcVariables.n16Temp1 jako bufora maski. Nie blokuje, nie modyfikuje flag. Komplementarne do 0x23 (ustawienie bitu).

RAM: `ptrAIActionData`, `ptrTemp0x72`, `strcVariables.n16Temp1`, `aAISetMask`

> Otwarte pytania: Komentarz w makrze mowi 'button mask ???' - to nieprawda, nie ma zwiazku z przyciskami; sa to flagi gry (bitowe). Nazwa makra JumpIfFlagSet jest poprawna, ale mozna doprecyzowac na JumpIfBitSet.

Przykłady z skryptów:
```
%AICMD0x14_JumpIfFlagSet(strcFlags.event2, $00, pAIScripting0x01_L003)   ; pAIScripting0x01 @ $B3938A
%AICMD0x14_JumpIfFlagSet(strcFlags.event4, $0C, pAIScripting0x01_L003)   ; pAIScripting0x01 @ $B39391
```

## 0x15 — JumpIfEquals8

- Makro: `AICMD0x15_JumpIfEquals8` · handler: `fAIAction0x15_JumpIfEquals8` ($848DA5) · pewność: **confirmed**
- Długość: 7 B · użycie: 586 wywołań w 25 skryptach

Skok do pNextAction jesli bajt pod nAddress jest rowny nValue.

| Parametr | Offset | Rozmiar | Typ | Znaczenie |
|---|---|---|---|---|
| `nAddress` | 1 | 3 | ram_ptr | Adres 24-bit bajtu do porownania (RAM lub ROM; w skryptach m.in. nCurrentSeasonID, nCurrentTimeID, strcPlayerData.*). |
| `nValue` | 4 | 1 | n8 | Wartosc porownywana (8-bit) z bajtem pod nAddress. |
| `pNextAction` | 5 | 2 | script_ptr | Mlodsze 16 bitow adresu komendy, do ktorej skok nastapi gdy bajt == nValue. |

Handler zapisuje nAddress do ptrTemp0x72, nValue do strcVariables.n8Temp1 ($92), a nastepnie w trybie 8-bit porownuje [ptrTemp0x72] z n8Temp1 (CMP, BNE). Rowne -> ptrAIActionData = pNextAction (16 bit), nierowne -> wskaznik za komende (7 bajtow). Nie blokuje.

RAM: `ptrAIActionData`, `ptrTemp0x72`, `strcVariables.n8Temp1`

Przykłady z skryptów:
```
%AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 0, pAIScripting0x00_General_L055)   ; pAIScripting0x00_General @ $B39258
%AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 1, pAIScripting0x00_General_L056)   ; pAIScripting0x00_General @ $B3925F
```

## 0x16 — JumpIfBetween8

- Makro: `AICMD0x16_JumpIfBetween8` · handler: `fAIAction0x16_JumpIfBetween8` ($848DFB) · pewność: **confirmed**
- Długość: 8 B · użycie: 335 wywołań w 17 skryptach

Skok do pNextAction jesli nMin <= [nAddress] <= nMax (porownanie 8-bit bez znaku).

| Parametr | Offset | Rozmiar | Typ | Znaczenie |
|---|---|---|---|---|
| `nAddress` | 1 | 3 | ram_ptr | Adres 24-bit testowanego bajtu. |
| `nMin` | 4 | 1 | n8 | Dolna granica (wlacznie), porownanie bez znaku. |
| `nMax` | 5 | 1 | n8 | Gorna granica (wlacznie). Handler liczy nMax+1 (INC A, 8-bit) i porownuje ostro mniejsze. |
| `pNextAction` | 6 | 2 | script_ptr | Mlodsze 16 bitow adresu komendy, do ktorej skok nastapi gdy nMin <= bajt <= nMax. |

Handler zapisuje nMin do n8Temp1 ($92) i nMax+1 do n8Temp2 ($93). Warunek skoku: [addr] >= n8Temp1 (BCC pomija) oraz [addr] < n8Temp2 (BCS pomija). Inaczej wskaznik przesuwany za komende (8 bajtow). Nie blokuje.

RAM: `ptrAIActionData`, `ptrTemp0x72`, `strcVariables.n8Temp1`, `strcVariables.n8Temp2`

> Otwarte pytania: Przypadek brzegowy: nMax = $FF daje nMax+1 = 0 i skok nigdy sie nie wykona (bledny wynik). W skryptach nie zaobserwowano tego uzycia.

Przykłady z skryptów:
```
%AICMD0x16_JumpIfBetween8(nCurrentTimeID, 17, 18, pAIScripting0x01_L023)   ; pAIScripting0x01 @ $B393CE
%AICMD0x16_JumpIfBetween8($80091E, 9, 12, pAIScripting0x01_L012)   ; pAIScripting0x01 @ $B39400
```

## 0x17 — RollRandom

- Makro: `AICMD0x17_RollRandom` · handler: `fAIAction0x17` ($848E68) · pewność: **confirmed**
- Długość: 2 B · użycie: 126 wywołań w 10 skryptach

Losuje liczbe 0..nMax-1 i zapisuje ja w polu +$0D biezacego obiektu AI.

| Parametr | Offset | Rozmiar | Typ | Znaczenie |
|---|---|---|---|---|
| `nMax` | 1 | 1 | n8 | Liczba mozliwych wynikow. Wynik losowania jest z zakresu 0..nMax-1 (fCore_GetRandomNumber nigdy nie zwraca nMax). Typowe: 2, 3, 4, 5. |

Wola fCore_GetRandomNumber (A = nMax), wynik zapisuje do bajtu +$0D struktury obiektu AI (ptrAIUnknownCC). Nie blokuje. Zawsze uzywane razem z seria komend 0x18 porownujacych wylosowana wartosc. Pole +$0D jest tez uzywane przez inne handlery (fAIAction przy 849BFF i 84A011), nie sprawdzano po co.

RAM: `ptrAIActionData`, `ptrAIUnknown0xCC+$0D`

Wywołuje: `fCore_GetRandomNumber`

> Otwarte pytania: Komentarz przy fCore_GetRandomNumber mowi 0x00-nMax, ale z kodu (petla konczy sie na X == nMax-1) wynika zakres 0..nMax-1; zgodne z uzyciem w skryptach (0x17($02) + 0x18($00)/0x18($01)). Dziedzina innych uzytkownikow pola +$0D nieustalona.

Przykłady z skryptów:
```
%AICMD0x17_RollRandom($02)   ; pAIScripting0x01 @ $B39460
%AICMD0x17_RollRandom($04)   ; pAIScripting0x01 @ $B39FD9
```

## 0x18 — JumpIfRandomEquals

- Makro: `AICMD0x18_JumpIfRandomEquals` · handler: `fAIAction0x18` ($848E90) · pewność: **confirmed**
- Długość: 4 B · użycie: 205 wywołań w 10 skryptach

Skok do pNextAction jesli ostatnio wylosowana (0x17) wartosc obiektu rowna sie nValue.

| Parametr | Offset | Rozmiar | Typ | Znaczenie |
|---|---|---|---|---|
| `nValue` | 1 | 1 | n8 | Wartosc porownywana z polem +$0D biezacego obiektu AI (wynik poprzedniego 0x17). |
| `pNextAction` | 2 | 2 | script_ptr | Mlodsze 16 bitow adresu komendy, do ktorej skok nastapi gdy +$0D == nValue. |

Porownuje bajt +$0D obiektu AI z nValue; rowne -> ptrAIActionData = pNextAction (16 bit), nierowne -> przesuniecie za komende (4 bajty), co pozwala na lancuch kilku 0x18 po jednym 0x17 (tabela skokow). Nie blokuje. Efekt uboczny: nValue jest czytane 16-bitowo (brak SEP przed LDA) i zapisywane do $92-$93, czyli nadpisuje tez strcVariables.n8Temp2 ($93) bajtem pNextAction (lo).

RAM: `ptrAIActionData`, `ptrAIUnknown0xCC+$0D`, `strcVariables.n8Temp1`, `strcVariables.n8Temp2`

> Otwarte pytania: Efekt uboczny na n8Temp2 jest prawdopodobnie niezamierzony (16-bitowy odczyt/zapis); nieszkodliwy, o ile $93 nie jest uzywane miedzy komendami.

Przykłady z skryptów:
```
%AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x01_L017)   ; pAIScripting0x01 @ $B39462
%AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x01_L030)   ; pAIScripting0x01 @ $B39536
```

## 0x19 — SetPlayerSprite

- Makro: `AICMD0x19` · handler: `fAIAction0x19` ($848EC9) · pewność: **probable**
- Długość: 4 B · użycie: 151 wywołań w 31 skryptach

Wymusza konkretny sprite i odbicie dla gracza oraz ustawia flage PFLAGS_KNEEING.

| Parametr | Offset | Rozmiar | Typ | Znaczenie |
|---|---|---|---|---|
| `nSpriteIdx` | 1 | 2 | n16 | Indeks sprite'a (16-bit) zapisywany do strcObjectData.spriteIdx ($7E:0901) - obiektu gracza. Przyklady: $0006, $0007, $0024, $004D, $00E8. |
| `nFlip` | 3 | 1 | flag | Flagi odbicia, przesuniete o 6 bitow w lewo i zapisane do strcObjectData.flip ($7E:090F): bit0 -> $0040 (odbicie poziome), bit1 -> $0080 (pionowe), jak atrybuty OAM. W skryptach 0 lub 1. |

Zapisuje nSpriteIdx do strcObjectData.spriteIdx i (nFlip << 6) do strcObjectData.flip, po czym ustawia strcPlayer.flags |= PFLAGS_KNEEING ($2000). Flaga KNEEING jest sprawdzana w player_actions.asm (fPlayerAction_Run, fUnknown_81C556), gdzie przy jej ustawieniu pomijana jest normalna obsluga ruchu/animacji - dzieki temu wymuszony sprite nie jest nadpisywany. Nie blokuje.

RAM: `ptrAIActionData`, `strcObjectData.spriteIdx`, `strcObjectData.flip`, `strcPlayer.flags`

> Otwarte pytania: Obiekt $7E:0901 jest zidentyfikowany jako gracz tylko na podstawie nazw pol w strcObjectData (playerX/playerY); nie potwierdzono tego w kodzie renderowania. Nazwa flagi KNEEING wydaje sie myląca - faktycznie to raczej 'poza wymuszona przez skrypt'. Nie ustalono kto i kiedy ja kasuje po scenie (player_actions.asm:2062 kasuje ja w jednym miejscu).

Przykłady z skryptów:
```
%AICMD0x19($00E9, $00)   ; pAIScripting0x02 @ $B3B26D
%AICMD0x19($0039, $00)   ; pAIScripting0x02 @ $B3B406
```

## 0x1A — SpawnNpc

- Makro: `AICMD0x1A` · handler: `fAIAction0x1A` ($848F0A) · pewność: **probable**
- Długość: 8 B · użycie: 737 wywołań w 74 skryptach

Tworzy/umieszcza obiekt NPC w danej pozycji z tabela sprite'ow i kierunkiem poczatkowym.

| Parametr | Offset | Rozmiar | Typ | Znaczenie |
|---|---|---|---|---|
| `nPosX` | 1 | 2 | n16 | Pozycja X obiektu (16-bit, ze znakiem - w skryptach wystepuja wartosci jak $FF80, czyli poza ekranem po lewej) zapisywana do +$1A (posX) obiektu AI. |
| `nPosY` | 3 | 2 | n16 | Pozycja Y obiektu zapisywana do +$1C (posY). |
| `pAnimTable` | 5 | 2 | ram_ptr | Mlodsze 16 bitow wskaznika do tabeli sprite'ow w banku $B3 (aAIScriptingData_Lxxx, wskaznik zapisany do +$33, bank $B3 wstawiany na sztywno). Tabela: 3-bajtowe wpisy na kierunek [slowo indeks sprite'a][bajt flip]. Nie jest to adres kodu skryptu. |
| `nDirection` | 7 | 1 | n8 | Poczatkowy kierunek 0-3 (zapis do +$02), wybiera wpis z pAnimTable. Z kodu ruchu: 0 = dol, 1 = gora, 2 = prawo (dx=+1), 3 = lewo (dx=-1). |

Zapisuje nPosX -> +$1A, nPosY -> +$1C, pAnimTable -> +$33, nDirection -> +$02 w strukturze obiektu AI. Ustawia flagi obiektu (+$01) |= $03: bit $01 oznacza obiekt aktywny (fAI_Unknown848286/petla AI), bit $02 powoduje przy najblizszym przetwarzaniu wywolanie fUnknown_858000 (utworzenie obiektu gry, indeks zapisany w +$12). Nastepnie wola fAI_Unknown848895 z $72 = (+$33):$B3, ktora wybiera wpis tabeli [nDirection]: slowo -> +$16 (spriteTableIdx), bajt << 6 -> +$14 (flip). Na koncu +$10 += 1, czyli obiekt zostaje przetworzony od nastepnej klatki (blokuje 1 klatke).

RAM: `ptrAIActionData`, `ptrAIUnknown0xCC+$01`, `ptrAIUnknown0xCC+$02`, `ptrAIUnknown0xCC+$10`, `ptrAIUnknown0xCC+$14`, `ptrAIUnknown0xCC+$16`, `ptrAIUnknown0xCC+$1A`, `ptrAIUnknown0xCC+$1C`, `ptrAIUnknown0xCC+$33`, `ptrTemp0x72`

Wywołuje: `fAI_Unknown848895`

> Otwarte pytania: Dokladne jednostki wspolrzednych (piksele swiata vs. mapy) niepotwierdzone - ta sama para trafia do strcObject.posX/posY. Konwencja kierunkow jest sprzeczna z enumem PDIR_* (PDIR_LEFT=2, PDIR_RIGHT=3), a kod ruchu NPC traktuje 2 jako ruch w +X (prawo); dotyczy tez 0x1F, gdzie uzywany jest strcPlayer.direction XOR 1. Do sprawdzenia, czy enum PDIR ma zamienione LEFT/RIGHT. Makro zawiera maskowanie &$FFFF dla pAnimTable - bank B3 jest wpisany na sztywno w handlerze.

Przykłady z skryptów:
```
%AICMD0x1A($0048, $0058, aAIScriptingData_L135, $00)   ; pAIScripting0x00_General @ $B38DE5
%AICMD0x1A($0068, $0168, aAIScriptingData_L004, $00)   ; pAIScripting0x00_General @ $B38E09
```

## 0x1B — SetSprite

- Makro: `AICMD0x1B` · handler: `fAIAction0x1B` ($848F9B) · pewność: **probable**
- Długość: 4 B · użycie: 1304 wywołań w 68 skryptach

Ustawia bezposrednio sprite i odbicie biezacego obiektu AI (NPC) i zleca odswiezenie sprite'a.

| Parametr | Offset | Rozmiar | Typ | Znaczenie |
|---|---|---|---|---|
| `nSpriteIdx` | 1 | 2 | n16 | Indeks sprite'a zapisywany do +$16 (spriteTableIdx) biezacego obiektu AI. Wartosci w skryptach rzedu $0223-$02E9 (NPC) - ta sama przestrzen indeksow co tabele pAnimTable z 0x1A. |
| `nFlip` | 3 | 1 | flag | Flagi odbicia, wartosc << 6 zapisana do +$14 (flip): bit0 -> $0040 (poziome), bit1 -> $0080 (pionowe). W skryptach 0 lub 1. |

Zapisuje nSpriteIdx do +$16 i (nFlip << 6) do +$14 obiektu AI, po czym ustawia flage +$01 |= $04 (zadanie aktualizacji sprite'a). W fAI_Unknown848286 przy fladze $04 wolane jest fObject_Unknown858100, ktore zmienia sprite tylko gdy +$16 rozni sie od poprzedniego +$18; flaga jest czyszczona (maska $E9) na koncu przetwarzania. Nie blokuje. Odpowiednik 0x19 dla NPC zamiast gracza.

RAM: `ptrAIActionData`, `ptrAIUnknown0xCC+$01`, `ptrAIUnknown0xCC+$14`, `ptrAIUnknown0xCC+$16`

> Otwarte pytania: Funkcja fObject_Unknown858100 czytana tylko pobieznie (porownanie spriteTableIdx z $18 i wybor banku $86/$87 wg progu $0262); nie analizowano pelnego efektu na OAM.

Przykłady z skryptów:
```
%AICMD0x1B($019D, $01)   ; pAIScripting0x00_General @ $B38D46
%AICMD0x1B($019D, $00)   ; pAIScripting0x00_General @ $B38D50
```

## 0x1C — ShowDialog

- Makro: `AICMD0x1C_ShowDialog` · handler: `fAIAction0x1C_ShowDialog` ($848FEF) · pewność: **confirmed**
- Długość: 4 B · użycie: 1810 wywołań w 45 skryptach

Wyswietla dialog nDialogId i wstrzymuje skrypt na jedna klatke (petla AI jest dalej pomijana na czas dialogu).

| Parametr | Offset | Rozmiar | Typ | Znaczenie |
|---|---|---|---|---|
| `nDialogId` | 1 | 2 | n16 | Indeks dialogu (indeks w aDialogPointers, 3 bajty na wpis); trafia do X, a w fDialog_DialogHandler do strcDialogDisplay.dialogId. |
| `nPosition` | 3 | 1 | n8 | Zapisywane do strcDialogDisplay.dialogUnk191 ($7E:0191). W fDialog_DialogHandler: 0 = automatyczne (domyslnie 1, a gdy strcObjectData.camY < $81 to 2), wartosc niezerowa jest uzywana wprost do przesuniecia BG3 (o (wartosc-1)*128 px) - czyli prawdopodobnie polozenie okna dialogu (gora/dol ekranu). W skryptach 0 lub 1. |

Wczytuje nDialogId do X, zapisuje bajt nPosition do dialogUnk191, ustawia strcDialogDisplay.mapUnk19A = 2 i wola fDialog_DialogHandler (ustawia dialogId, dialogFlags |= DFLAGS_PROCESSDIALOG, zeruje liczniki opcji/odpowiedzi, wybiera wskaznik tekstu z aDialogPointers, ustawia przesuniecie BG3 i nTimeState = 0, daily1 |= $4000). Potem +$10 += 1 (jedna klatka). Poniewaz mapUnk19A == 2, fAI_HowToPlaySetup zwraca od razu na poczatku dopoki dialog nie zostanie zakonczony (kod dialogu zeruje/zmienia mapUnk19A), czyli skrypt i wszystkie obiekty AI czekaja do konca dialogu.

RAM: `ptrAIActionData`, `ptrAIUnknown0xCC+$10`, `strcDialogDisplay.dialogUnk191`, `strcDialogDisplay.mapUnk19A`, `strcDialogDisplay.dialogId`, `strcDialogDisplay.dialogFlags`, `strcDialogDisplay.dialogOptionsAnswer`, `strcFlags.daily1`, `nTimeState`, `strcBGScrool.BG3VerOffs`

Wywołuje: `fDialog_DialogHandler`

> Otwarte pytania: Dokladne znaczenie nPosition (gora/dol) niepotwierdzone; nie sprawdzono kodu, ktory resetuje mapUnk19A po zamknieciu dialogu.

Przykłady z skryptów:
```
%AICMD0x1C_ShowDialog($03A3, $00)   ; pAIScripting0x00_General @ $B39133
%AICMD0x1C_ShowDialog($013A, $00)   ; pAIScripting0x00_General @ $B39321
```

## 0x1D — ShowDialogWithChoice

- Makro: `AICMD0x1D_ShowDialog` · handler: `fAIAction0x1D_ShowDialog` ($849034) · pewność: **confirmed**
- Długość: 4 B · użycie: 62 wywołań w 19 skryptach

Funkcjonalnie identyczny z 0x1C (ShowDialog); w skryptach uzywany dla dialogow z wyborem opcji, po ktorych idzie seria 0x20.

| Parametr | Offset | Rozmiar | Typ | Znaczenie |
|---|---|---|---|---|
| `nDialogId` | 1 | 2 | n16 | Jak w 0x1C: indeks dialogu. |
| `nPosition` | 3 | 1 | n8 | Jak w 0x1C: trafia do strcDialogDisplay.dialogUnk191. |

Kod handlera jest instrukcja po instrukcji taki sam jak 0x1C (rozni sie tylko adres). Zaobserwowana konwencja w skryptach: 0x1D jest wolane przed lancuchem 0x20 JumpIfChoice (dialog z pytaniem), a 0x1C dla zwyklych wypowiedzi - rozroznienie jest czysto umowne (autorzy gry), bez wplywu na dzialanie.

RAM: `ptrAIActionData`, `ptrAIUnknown0xCC+$10`, `strcDialogDisplay.dialogUnk191`, `strcDialogDisplay.mapUnk19A`, `strcDialogDisplay.dialogId`, `strcDialogDisplay.dialogFlags`

Wywołuje: `fDialog_DialogHandler`

> Otwarte pytania: Brak - roznica miedzy 0x1C i 0x1D istnieje tylko w konwencji uzycia (w kodzie handlera brak roznic).

Przykłady z skryptów:
```
%AICMD0x1D_ShowDialog($0086, $00)   ; pAIScripting0x01 @ $B39693
%AICMD0x1D_ShowDialog($00AF, $00)   ; pAIScripting0x01 @ $B398A1
```

## 0x1E — JumpIfTalkedTo

- Makro: `AICMD0x1E` · handler: `fAIAction0x1F` ($849079) · pewność: **probable**
- Długość: 3 B · użycie: 0 wywołań w 0 skryptach

Alias 0x1F - wpis 0x1E w tablicy aAIActions wskazuje na ten sam handler fAIAction0x1F; nie wystepuje w zadnym skrypcie.

| Parametr | Offset | Rozmiar | Typ | Znaczenie |
|---|---|---|---|---|
| `pNextAction` | 1 | 2 | script_ptr | Jak w 0x1F: mlodsze 16 bitow adresu komendy, do ktorej skok nastapi po rozpoczeciu rozmowy. |

W aAIActions (849455) wpisy dla opcodow 0x1E i 0x1F wskazuja na fAIAction0x1F ($849079). Zachowanie identyczne jak 0x1F. Makro AICMD0x1E ma ten sam format (opcode + 16-bitowy wskaznik). Komendy 0x1E nie znaleziono w bank_B3/B4/B5.

RAM: `ptrAIActionData`

> Otwarte pytania: Czy 0x1E bylo zamierzone jako osobna komenda (np. inny warunek) - w ROM US wskazuje na ten sam handler. Szczegoly w opisie 0x1F.

## 0x1F — JumpIfTalkedTo

- Makro: `AICMD0x1F` · handler: `fAIAction0x1F` ($849079) · pewność: **probable**
- Długość: 3 B · użycie: 261 wywołań w 22 skryptach

Sprawdza czy gracz stoi przy NPC i nacisnal A; jesli tak - obraca NPC do gracza, blokuje gracza interakcja i skacze do pNextAction, w przeciwnym razie czeka klatke i idzie dalej.

| Parametr | Offset | Rozmiar | Typ | Znaczenie |
|---|---|---|---|---|
| `pNextAction` | 1 | 2 | script_ptr | Mlodsze 16 bitow adresu komendy (obslugi rozmowy), do ktorej skok nastapi gdy gracz zacznie rozmowe z NPC (bank bez zmian). |

Jest to komenda pollingowa: w skryptach zawsze 'AICMD0x1F(cel); Jump(ta_sama_komenda)'. Warunki (wszystkie musza byc spelnione, inaczej sciezka .return = ptrAIActionData += 3 oraz +$10 += 1, czyli blokada na jedna klatke): bajt +$0C obiektu != 0 (flaga bliskosci gracza ustawiana w petli game_engine.asm ~83AE26: |posX/posY NPC - pozycja gracza| < $19), akcja gracza nie jest PACTION_USINGTOOL / SHOWTOOL / WHISTLEHORSE / WHISTLEDOG, brak PFLAGS_EATINGMEAL, (strcFlags.daily4 & $0006) == 0, oraz strcJoypad1.newInput ma bit !JOYPAD_A (nowo wcisniety A). Gdy spelnione: ptrAIActionData = pNextAction (16 bit); +$08 := +$07; +$03 := 0, +$04 := 0 (zatrzymanie ruchu); +$0C := 0; +$02 := strcPlayer.direction XOR 1 (NPC patrzy na gracza); fAI_Unknown848895 z tablica (+$33):$B3 ustawia sprite (+$16) i flip (+$14) wg nowego kierunku; +$01 |= $14 (aktualizacja sprite'a + blokada auto-ruchu na ta klatke); nPlayerInteractionIndex := $56, Arg1 = Arg2 = 0; strcPlayer.flags |= PFLAGS_INTERACTING; strcPlayer.action := PACTION_NONE; +$10 += 1. fPlayerInteraction0x56 zwieksza Arg2 i po 2 wywolaniach zdejmuje PFLAGS_INTERACTING (efekt: krotka blokada gracza na czas przejscia do dialogu).

RAM: `ptrAIActionData`, `ptrAIUnknown0xCC+$01`, `ptrAIUnknown0xCC+$02`, `ptrAIUnknown0xCC+$03`, `ptrAIUnknown0xCC+$04`, `ptrAIUnknown0xCC+$07`, `ptrAIUnknown0xCC+$08`, `ptrAIUnknown0xCC+$0C`, `ptrAIUnknown0xCC+$10`, `ptrAIUnknown0xCC+$14`, `ptrAIUnknown0xCC+$16`, `ptrAIUnknown0xCC+$33`, `strcPlayer.flags`, `strcPlayer.action`, `strcPlayer.direction`, `strcJoypad1.newInput`, `strcFlags.daily4`, `nPlayerInteractionIndex`, `nPlayerInteractionArg1`, `nPlayerInteractionArg2`, `ptrTemp0x72`

Wywołuje: `fAI_Unknown848895`

> Otwarte pytania: Znaczenie bitow $0002/$0004 w strcFlags.daily4 (blokuja rozmowe) nieustalone. Pole +$0C = 'gracz w poblizu' wywnioskowane z game_engine.asm:~83AE26-83AE68 (probable). Kierunek XOR 1 zalezy od konwencji kierunkow (patrz open_questions w 0x1A: enum PDIR vs kod ruchu NPC). Tablica aAIActions wskazuje dwa opcody (0x1E, 0x1F) na ten sam handler.

Przykłady z skryptów:
```
%AICMD0x1F(pAIScripting0x00_General_L053)   ; pAIScripting0x00_General @ $B3912D
%AICMD0x1F(pAIScripting0x00_General_L060)   ; pAIScripting0x00_General @ $B392BB
```

## 0x20 — JumpIfChoice

- Makro: `AICMD0x20_JumpIfChoice` · handler: `fAIAction0x20_JumpIfChoice` ($84919D) · pewność: **confirmed**
- Długość: 4 B · użycie: 125 wywołań w 19 skryptach

Skok do pNextAction jesli gracz wybral w ostatnim dialogu opcje nAnswer.

| Parametr | Offset | Rozmiar | Typ | Znaczenie |
|---|---|---|---|---|
| `nAnswer` | 1 | 1 | n8 | Numer opcji (od 0) porownywany z strcDialogDisplay.dialogOptionsAnswer ($7E:018F) - odpowiedz wybrana w ostatnim dialogu z opcjami. W skryptach 0..4. |
| `pNextAction` | 2 | 2 | script_ptr | Mlodsze 16 bitow adresu komendy, do ktorej skok nastapi gdy wybrana opcja == nAnswer. |

Porownuje bajt dialogOptionsAnswer z nAnswer (8-bit). Rowne -> ptrAIActionData = pNextAction (16 bit), nierowne -> przesuniecie za komende (4 bajty), dzieki czemu kilka 0x20 pod rzad tworzy tablice skokow po 0x1D. dialogOptionsAnswer jest zerowane w fDialog_DialogHandler przy starcie dialogu (stad wynik 0 dla dialogow bez opcji). Zapisuje nAnswer w strcVariables.n8Temp1. Nie blokuje.

RAM: `ptrAIActionData`, `strcDialogDisplay.dialogOptionsAnswer`, `strcVariables.n8Temp1`

Przykłady z skryptów:
```
%AICMD0x20_JumpIfChoice(0, pAIScripting0x01_L055)   ; pAIScripting0x01 @ $B39697
%AICMD0x20_JumpIfChoice(1, pAIScripting0x01_L056)   ; pAIScripting0x01 @ $B3969B
```

## 0x21 — AddValue8

- Makro: `AICMD0x21_AddValue8` · handler: `fAIAction0x21_AddValue8` ($8491D2) · pewność: **confirmed**
- Długość: 5 B · użycie: 3 wywołań w 2 skryptach

Dodaje (ze znakiem) n8Value do bajtu pod pAddress z nasyceniem do zakresu 0..255.

| Parametr | Offset | Rozmiar | Typ | Znaczenie |
|---|---|---|---|---|
| `pAddress` | 1 | 3 | ram_ptr | Adres 24-bit modyfikowanego bajtu (w skryptach np. nPowerBerryEaten, $800917 = strcPlayerData.stamina, $8009A2). |
| `n8Value` | 4 | 1 | n8 | Wartosc ZE ZNAKIEM (-128..127) dodawana do bajtu: handler rozszerza znak do 16 bitow (BPL/ORA $FF00). Wartosci ujemne odejmuja. |

Wczytuje bajt [pAddress] jako 0..255, dodaje 16-bitowo rozszerzony ze znakiem n8Value; gdy wynik ujemny (bit 15) zapisuje 0, gdy >= $FF zapisuje $FF, w przeciwnym razie wynik. Zapis 8-bitowy do [pAddress]. Nie blokuje. Uzyte zaledwie kilka razy w skryptach (stamina, licznik jagod).

RAM: `ptrAIActionData`, `ptrTemp0x72`, `strcVariables.n16Temp1`

> Otwarte pytania: Makro opisuje argument jako n8Value bez zaznaczenia, ze jest ze znakiem - warto dopisac w komentarzu commands.asm.

Przykłady z skryptów:
```
%AICMD0x21_AddValue8(nPowerBerryEaten, 1)   ; pAIScripting0x26 @ $B4A85E
%AICMD0x21_AddValue8($800917, 10)   ; pAIScripting0x26 @ $B4A863
```

## 0x22 — StartRandomWalk

- Makro: `AICMD0x22` · handler: `fAIAction0x22` ($84923F) · pewność: **probable**
- Długość: 7 B · użycie: 70 wywołań w 23 skryptach

Wlacza dla biezacego NPC losowe wedrowanie po prostokatnym obszarze wokol jego aktualnej pozycji.

| Parametr | Offset | Rozmiar | Typ | Znaczenie |
|---|---|---|---|---|
| `nRangeX` | 1 | 1 | n8 | Maksymalne odchylenie w poziomie od punktu startowego (zapis do +$09). W petli wedrowania (fAI_Unknown8483CC) porownywane z |posX - homeX| dla kierunkow 2/3. Wartosci w skryptach: 4, $10, $18, $20. |
| `nRangeY` | 2 | 1 | n8 | Maksymalne odchylenie w pionie od punktu startowego (zapis do +$0A), uzywane dla kierunkow 0/1. Wartosci: 0, 4, 8, $10, $18. |
| `nStepDelay` | 3 | 1 | n8 | Liczba klatek miedzy kolejnymi krokami o 1 px (zapis do +$0B, +$05 i +$06 - okres i licznik w fAI_Unknown848331). W skryptach zawsze 1. |
| `pAnimTable` | 4 | 2 | ram_ptr | Mlodsze 16 bitow wskaznika do tabeli sprite'ow w banku $B3 (zapis do +$36, bank $B3 na sztywno) - tabela sprite'ow animacji marszu, uzywana po wyborze kierunku (label12 w fAI_Unknown8483CC). Format jak w 0x1A (3 bajty na kierunek). |
| `nSegmentLen` | 6 | 1 | n8 | Liczba krokow wykonywanych w jednym wybranym kierunku zanim nastapi nowy wybor (zapis do +$07 i +$08; +$07 = wartosc przeladowania, +$08 = licznik). Wartosci: 0, 2, 8, $0C, $10. |

Zapisuje argumenty do pol +$09,+$0A,+$0B,+$05,+$06,+$36,+$07,+$08 obiektu AI. Ustawia +$01 |= $28: bit $08 wlacza wedrowanie (fAI_Unknown8483CC), bit $20 wlacza automatyczny ruch (fAI_Unknown848331 dodaje predkosc +$03/+$04 do posX/posY co +$05 klatek). Kopiuje biezaca pozycje +$1A/+$1C do +$1E/+$20 jako punkt macierzysty (home). Dlatego komenda musi stac po 0x1A (ktora ustawia pozycje). Petla wedrowania wybiera kierunek (0 dol, 1 gora, 2 prawo, 3 lewo - na podstawie +$0F lub strcPlayer.lastRandomNumber), ustawia predkosc +-1 px, sprawdza granice wzgledem punktu home i konczy odcinek gdy +$08 dojdzie do 0 lub wyjdzie poza zakres. Komenda nie blokuje i nie zmienia +$10; wedrowanie dziala w tle, rownolegle do dalszego wykonywania skryptu (zwykle za nia stoi petla 0x1F).

RAM: `ptrAIActionData`, `ptrAIUnknown0xCC+$01`, `ptrAIUnknown0xCC+$05`, `ptrAIUnknown0xCC+$06`, `ptrAIUnknown0xCC+$07`, `ptrAIUnknown0xCC+$08`, `ptrAIUnknown0xCC+$09`, `ptrAIUnknown0xCC+$0A`, `ptrAIUnknown0xCC+$0B`, `ptrAIUnknown0xCC+$1A`, `ptrAIUnknown0xCC+$1C`, `ptrAIUnknown0xCC+$1E`, `ptrAIUnknown0xCC+$20`, `ptrAIUnknown0xCC+$36`

> Otwarte pytania: Interpretacja argumentow wynika z analizy pol w fAI_Unknown848286/8483CC/848331 (probable, nie przetestowana emulacja). Nie ustalono dokladnie roli +$0F (preferowany kierunek 1/2/4/8) ani bitu $80 flag (pomija sprawdzanie granic). Jednostki zakresu (px) wynikaja z porownania z posX/posY.

Przykłady z skryptów:
```
%AICMD0x22($20, $20, $01, aAIScriptingData_L005, $10)   ; pAIScripting0x00_General @ $B38E11
%AICMD0x22($20, $20, $01, aAIScriptingData_L007, $10)   ; pAIScripting0x00_General @ $B38E26
```

## 0x23 — SetBit

- Makro: `AICMD0x23_OrWithIndexedValue` · handler: `fAIAction0x23_OrWithIndexedValue` ($849306) · pewność: **confirmed**
- Długość: 5 B · użycie: 219 wywołań w 37 skryptach

Ustawia bit nIndex w 16-bitowym slowie pod nAddress (OR z aAISetMask[nIndex]).

| Parametr | Offset | Rozmiar | Typ | Znaczenie |
|---|---|---|---|---|
| `nAddress` | 1 | 3 | ram_ptr | Adres 24-bit slowa 16-bit (w skryptach strcFlags.daily1-5, event*, unknown1 itd.). |
| `nIndex` | 4 | 1 | n8 | Numer bitu 0-15 do ustawienia (indeks w aAISetMask: maska = 1<<nIndex). |

Handler sklada wskaznik 24-bit w $72-$74, pobiera maske z aAISetMask[nIndex*2] do n16Temp1, wykonuje 16-bitowe [addr] |= maska. Nie blokuje. Odpowiednik ustawiania flagi gry (np. flaga dzienna lub zdarzenia) ze skryptu; para do 0x14 (test bitu). Kasowanie bitu realizuje inna komenda (aAIResetMask).

RAM: `ptrAIActionData`, `ptrTemp0x72`, `strcVariables.n16Temp1`, `aAISetMask`

Przykłady z skryptów:
```
%AICMD0x23_OrWithIndexedValue(strcFlags.daily1, $0B)   ; pAIScripting0x00_General @ $B38F2D
%AICMD0x23_OrWithIndexedValue(strcFlags.daily3, $04)   ; pAIScripting0x00_General @ $B392C1
```

## 0x24 — SetNextPalette

- Makro: `AICMD0x24_NextHourPalette` · handler: `fAIAction0x24_NextHourPalette` ($849356) · pewność: **confirmed**
- Długość: 2 B · użycie: 6 wywołań w 6 skryptach

Ustawia docelowa palete kolorow (plynne przejscie) na zestaw o zadanym indeksie, chyba ze jest juz wieczor.

| Parametr | Offset | Rozmiar | Typ | Znaczenie |
|---|---|---|---|---|
| `nNextHourPalette` | 1 | 1 | n8 | Indeks zestawu palety docelowej, przekazany w A do fPalette_Unknown808FC7 i zapisany w strcPalette.nextHourIdx ($7E:017C). Indeksuje tablice 24-bitowych wskaznikow aPalettes ($80:B9FD, 3 bajty na wpis). We wszystkich skryptach US wartosc $74. |

Handler przesuwa ptrAIActionData o 1, czyta bajt i wola fPalette_Unknown808FC7, po czym przesuwa wskaznik o 1 (razem 2 bajty). Procedura zapisuje indeks do strcPalette.nextHourIdx, zeruje strcPalette.countDown i ustawia ptrPaletteNext ($7E:0004, ptr24): jesli nCurrentTimeID >= $12 (godzina 18:00 lub pozniej) wskazuje na stala paletę nocna w RAM $7F:0B00, w przeciwnym razie na aPalettes[indeks]. Faktyczna zmiana kolorow odbywa sie stopniowo w fPallete_ChangeHandler (co $20 klatek jeden krok R/G/B w strcPalette/sPalette_7F0D00 w strone ptrPaletteNext). Komenda nie blokuje. W skryptach wystepuje zawsze po UnfreezeTime (0x01) i przed Wait(180) - po scenach przywraca kolorystyke pory dnia.

RAM: `strcPalette.nextHourIdx`, `strcPalette.countDown`, `ptrPaletteNext`, `nCurrentTimeID`, `ptrAIActionData`

Wywołuje: `fPalette_Unknown808FC7`

> Otwarte pytania: Do czego dokladnie sluzy wartosc $74 (wpis w aPalettes) - nie sprawdzono zawartosci tablicy. Nazwa pola nextHourIdx sugeruje palete 'nastepnej godziny', ale kod uzywa go tylko jako indeksu przy nCurrentTimeID < $12.

Przykłady z skryptów:
```
%AICMD0x24_NextHourPalette($74)   ; pAIScripting0x0F_StarNightFestival @ $B4802F
```

## 0x25 — RemoveActor

- Makro: `AICMD0x25_RemoveActor` · handler: `fAIAction0x25` ($849375) · pewność: **confirmed**
- Długość: 2 B · użycie: 6 wywołań w 5 skryptach

Dezaktywuje slot AI o zadanym numerze i usuwa jego obiekt gry (sprite) z mapy.

| Parametr | Offset | Rozmiar | Typ | Znaczenie |
|---|---|---|---|---|
| `nActorIndex` | 1 | 1 | n8 | Numer slotu AI (struktury 64-bajtowej strcAIUnknown pod $7E:B586 + n*64), ktory ma zostac usuniety. W skryptach: $01,$02,$03,$09,$13. |

Handler zapamietuje biezacy ptrAIUnknown0xCC w ptrTemp0x72, przesuwa ptrAIActionData o 1, czyta bajt i wola fAI_SetCCPointer (ptrAIUnknown0xCC = $7E:B586 + n*64). Nastepnie zeruje bajt 0 slotu (znacznik aktywnosci), czyta slowo z offsetu $12 (indeks obiektu gry) do strcObject.gameObjectIdx i wola fObject_Unknown8581A2, ktora zwalnia wszystkie komponenty (sprite'y) obiektu (fUnknown_858B41 / fUnknown_858C9F) i zeruje strcGameObject.initailized. Na koncu przywraca poprzedni ptrAIUnknown0xCC (slot wykonujacy skrypt). Wskaznik komendy przesuniety lacznie o 2 bajty. Nie blokuje, nie zwieksza licznika $10. Odpowiada logicznie procedurze fAI_Unknown848020 (ta sama sekwencja dla dowolnego slotu).

RAM: `ptrAIUnknown0xCC`, `ptrTemp0x72`, `strcObject.gameObjectIdx`, `strcAIUnknown.unk00`, `strcAIUnknown.unk12`, `strcGameObject.initailized`, `ptrAIActionData`

Wywołuje: `fAI_SetCCPointer`, `fObject_Unknown8581A2`

> Otwarte pytania: Wywolanie fObject_Unknown8581A2 zawiera znany blad (skok do fReturn_8580B8 zamiast RTL) - nie wplywa na komende. Nie sprawdzono, co dzieje sie z innymi polami slotu (nie sa zerowane).

Przykłady z skryptów:
```
%AICMD0x25_RemoveActor($01)   ; pAIScripting0x09 @ $B3E658
%AICMD0x25_RemoveActor($02)   ; pAIScripting0x09 @ $B3E65A
```

## 0x26 — ClearBit

- Makro: `AICMD0x26_ClearBitAs0x28` · handler: `fAIAction0x28` ($8493C9) · pewność: **confirmed**
- Długość: 5 B · użycie: 0 wywołań w 0 skryptach

Alias opkodu 0x28 (kasowanie bitu) - w tablicy aAIActions wpis 0x26 wskazuje na fAIAction0x28.

| Parametr | Offset | Rozmiar | Typ | Znaczenie |
|---|---|---|---|---|
| `pAddress` | 1 | 3 | ram_ptr | Adres 24-bitowy slowa 16-bit w RAM, w ktorym kasowany jest bit (makro nazywa go nUnknown1). |
| `nBitIndex` | 4 | 1 | n8 | Numer bitu 0-15 (indeks do aAIResetMask, makro nazywa go nUnknown2). |

Wpisy tablicy aAIActions dla 0x26 i 0x27 sa identyczne jak dla 0x28 (84946B-84946F: trzy razy fAIAction0x28), wiec bajt $26 wykonalby dokladnie ClearBit. Makro AICMD0x26 emituje jednak bajt $28, nie $26, i w skryptach US nie jest nigdzie uzywane. Format i dzialanie jak w 0x28.

RAM: `ptrTemp0x72`, `strcVariables.n16Temp1`, `ptrAIActionData`

> Otwarte pytania: Makro AICMD0x26 powinno emitowac db $26 (lub zostac usuniete/zrobione aliasem 0x28). Oryginalna gra najprawdopodobniej nie uzywa tego opkodu.

## 0x27 — ClearBit

- Makro: `AICMD0x27_ClearBitAs0x28` · handler: `fAIAction0x28` ($8493C9) · pewność: **confirmed**
- Długość: 5 B · użycie: 0 wywołań w 0 skryptach

Alias opkodu 0x28 (kasowanie bitu) - w tablicy aAIActions wpis 0x27 wskazuje na fAIAction0x28.

| Parametr | Offset | Rozmiar | Typ | Znaczenie |
|---|---|---|---|---|
| `pAddress` | 1 | 3 | ram_ptr | Adres 24-bitowy slowa 16-bit w RAM, w ktorym kasowany jest bit (makro nazywa go nUnknown1). |
| `nBitIndex` | 4 | 1 | n8 | Numer bitu 0-15 (indeks do aAIResetMask, makro nazywa go nUnknown2). |

Jak 0x26: wpis tablicy wskazuje na fAIAction0x28, makro AICMD0x27 emituje bajt $28 zamiast $27 i nie ma uzyc w skryptach US.

RAM: `ptrTemp0x72`, `strcVariables.n16Temp1`, `ptrAIActionData`

> Otwarte pytania: Makro AICMD0x27 powinno emitowac db $27 (lub zostac usuniete). Oryginalna gra najprawdopodobniej nie uzywa tego opkodu.

## 0x28 — ClearBit

- Makro: `AICMD0x28_ClearBit` · handler: `fAIAction0x28` ($8493C9) · pewność: **confirmed**
- Długość: 5 B · użycie: 60 wywołań w 21 skryptach

Kasuje jeden bit (0-15) w 16-bitowym slowie pod podanym adresem RAM.

| Parametr | Offset | Rozmiar | Typ | Znaczenie |
|---|---|---|---|---|
| `pAddress` | 1 | 3 | ram_ptr | Adres 24-bitowy slowa 16-bit w RAM (w skryptach np. strcFlags.unknown1 albo $8000D2 = strcPlayer.flags przez lustro banku $80). |
| `nBitIndex` | 4 | 1 | n8 | Numer bitu 0-15 do skasowania; handler indeksuje aAIResetMask ($84:94F3, slowa $FFFE,$FFFD,...,$7FFF) przez nBitIndex*2. Makro nazywa go nUnknown2. |

Handler czyta 16-bitowy adres i bajt banku do ptrTemp0x72 (ptr24), potem bajt indeksu, pobiera maske z aAIResetMask i wykonuje [ptrTemp0x72] = [ptrTemp0x72] AND maska (16-bit). Przesuwa ptrAIActionData lacznie o 5 bajtow. Nie blokuje. Dokladna przeciwnosc komendy 0x23 (OrWithIndexedValue - ustawianie bitu z aAISetMask). Wzorzec uzycia: AICMD0x28(strcFlags.unknown1, $05).

RAM: `ptrTemp0x72`, `strcVariables.n16Temp1`, `ptrAIActionData`

> Otwarte pytania: Brak uwag co do formatu. Makro powinno miec argumenty pAddress, nBitIndex (obecnie nUnknown2).

Przykłady z skryptów:
```
%AICMD0x28_ClearBit(strcFlags.daily1, $09)   ; pAIScripting0x01 @ $B3A9E3
%AICMD0x28_ClearBit($8000D2, $05)   ; pAIScripting0x0A @ $B3E90D
```

## 0x29 — SetMapScroll

- Makro: `AICMD0x29_SetMapScrooling` · handler: `fAIAction0x29_SetMapScrooling` ($849513) · pewność: **confirmed**
- Długość: 6 B · użycie: 10 wywołań w 4 skryptach

Uruchamia automatyczne przewijanie kamery o zadanej predkosci X/Y przez zadana liczbe klatek.

| Parametr | Offset | Rozmiar | Typ | Znaczenie |
|---|---|---|---|---|
| `nMapSpeedX` | 1 | 2 | n16 | Predkosc przewijania kamery w poziomie (liczba ze znakiem 16-bit, dodawana do strcCamera.cameraX co klatke). Zapis do strcMapScrool.speedX ($7E:087C). W skryptach 0. |
| `nMapSpeedY` | 3 | 2 | n16 | Predkosc przewijania kamery w pionie (ze znakiem, dodawana do strcCamera.cameraY co klatke). Zapis do strcMapScrool.speedY ($7E:087E). W skryptach -1 lub 1. |
| `nMapTimer` | 5 | 1 | n8 | Liczba klatek przewijania (strcMapScrool.timer, $7E:0880). W skryptach 16, 48, 64, 240. |

Handler zapisuje trzy wartosci do strcMapScrool (speedX, speedY, timer) i przesuwa wskaznik o 6 bajtow. Nie blokuje - skrypt zwykle po niej wola Wait(n) o tej samej dlugosci. Przewijanie wykonuje fGraphics_MapScrool ($80:95B3): gdy timer != 0 dekrementuje go, dodaje speedX/speedY do strcCamera.cameraX/Y i kopiuje do strcBGScrool.BG1HorOffs/BG1VerOffs (Y ucinane do 0 gdy ujemne). Uzywane w scenach (np. Star Night Festival) do panoramy kamery.

RAM: `strcMapScrool.speedX`, `strcMapScrool.speedY`, `strcMapScrool.timer`, `ptrAIActionData`

Przykłady z skryptów:
```
%AICMD0x29_SetMapScrooling(0, -1, 240)   ; pAIScripting0x0F_StarNightFestival @ $B485E6
%AICMD0x29_SetMapScrooling(0, -1, 64)   ; pAIScripting0x0F_StarNightFestival @ $B485EF
```

## 0x2A — StartTileSequence

- Makro: `AICMD0x2A` · handler: `fAIAction0x2A` ($849553) · pewność: **probable**
- Długość: 3 B · użycie: 4 wywołań w 3 skryptach

Uruchamia sekwencje zmian kafelkow mapy (wskaznik ptrUnknown0xCF) i konczy bieżaca klatke skryptu.

| Parametr | Offset | Rozmiar | Typ | Znaczenie |
|---|---|---|---|---|
| `nSequenceIndex` | 1 | 2 | n16 | Indeks w tablicy 24-bitowych wskaznikow pTable_81B963 ($81:B963, 3 bajty na wpis); wskazuje sekwencje zmian kafelkow mapy. W skryptach $0041, $0043, $0045. |

Handler czyta slowo i wola fUnknownCF_SetPointer ($81:A5E1): ptrUnknown0xCF ($7E:00CF) = pTable_81B963[indeks], zeruje licznik opoznienia $7E:0989. Przesuwa ptrAIActionData o 3 i zwieksza o 1 licznik strcAIUnknown+$10 slotu, co konczy wykonywanie skryptu w tej klatce (wznowienie w nastepnej). Sekwencje odtwarza potem fUnknownCF_81A600 (wolana z petli glownej, core.asm i main_loop.asm): rekordy 7-bajtowe (3 slowa: argument/kafelek, X, Y + bajt opoznienia w klatkach) przekazywane do fSetTileAtCoords; $FFFF konczy sekwencje, $FFFE oznacza skok do 24-bitowego wskaznika.

RAM: `ptrUnknown0xCF`, `strcAIUnknown.unk10`, `ptrAIActionData`

Wywołuje: `fUnknownCF_SetPointer`

> Otwarte pytania: Nie ustalono, co dokladnie zmieniaja sekwencje $41/$43/$45 (nie przeanalizowano zawartosci pTable_81B963 ani fSetTileAtCoords). Nazwa oparta na dzialaniu rekordow (X/Y kafelka), wiec tylko probable.

Przykłady z skryptów:
```
%AICMD0x2A($0041)   ; pAIScripting0x12 @ $B488C5
%AICMD0x2A($0043)   ; pAIScripting0x14 @ $B48B5D
```

## 0x2B — SpawnActor

- Makro: `AICMD0x2B` · handler: `fAIAction0x2B` ($84957D) · pewność: **probable**
- Długość: 4 B · użycie: 22 wywołań w 1 skryptach

Ustawia wyglad (tabela sprite'ow z banku $B3 i kierunek) biezacego slotu AI i oznacza go do utworzenia obiektu gry.

| Parametr | Offset | Rozmiar | Typ | Znaczenie |
|---|---|---|---|---|
| `pPointerB3` | 1 | 2 | script_ptr | Mlodsze 16 bitow adresu tabeli danych sprite'a w banku $B3 (bank wpisany na stale $B3). Zapisywane w slocie AI +$33 (pDataAddress). Tabela: 3 bajty na kierunek (slowo -> +$16 spriteTableIdx, bajt*64 -> +$14). |
| `nDataIndex` | 3 | 1 | enum | Kierunek/indeks wpisu w tabeli (slot AI +$02, nDataIndex). Kod ruchu uzywa 0..3 jako kierunek (0 dol, 1 gora, 2 i 3 poziomo; pary 0/1 i 2/3 sa przeciwne). |

Handler zapisuje pointer do slotu +$33, bajt do slotu +$02, ustawia bity $03 w fladze slotu +$01 (bit $01 aktywny, bit $02 = utworz obiekt), wola fAI_Unknown848895 z ptrTemp0x72 = $B3:pointer, ktora wybiera wpis nDataIndex*3: slowo -> +$16 (indeks tabeli sprite'ow), bajt*64 -> +$14. Zwieksza licznik +$10 (koniec klatki skryptu) i przesuwa wskaznik o 4 bajty. Przy najblizszym fAI_Unknown848286 flaga $02 wywoluje fUnknown_858000 (utworzenie obiektu) i zapis indeksu obiektu w +$12; flagi $02/$04/$10 sa po tym czyszczone. Wystepuje na poczatku skryptow ogolnych bank B3 (zwierzeta, NPC) tuz przed 0x2E / Update*.

RAM: `ptrAIUnknown0xCC`, `strcAIUnknown.pDataAddress`, `strcAIUnknown.nDataIndex`, `strcAIUnknown.flags`, `strcAIUnknown.nDataValue`, `strcAIUnknown.nOtherUnknownIndex`, `ptrTemp0x72`, `strcAIUnknown.unk10`, `ptrAIActionData`

Wywołuje: `fAI_Unknown848895`

> Otwarte pytania: Pelne znaczenie wartosci z tabeli (slowo +$16 i bajt +$14*64) - prawdopodobnie indeks tabeli sprite'ow i atrybuty/flip, nie zweryfikowano w pliku danych. Zgodnosc kierunkow z enumem PDIR (0 DOWN, 1 UP, 2 LEFT, 3 RIGHT) wymaga sprawdzenia - w kodzie wedrowki indeks 2 odpowiada przesunieciu X +1, a 3 przesunieciu X -1.

Przykłady z skryptów:
```
%AICMD0x2B(aAIScriptingData_L010, $00)   ; pAIScripting0x00_General @ $B38CC8
%AICMD0x2B(aAIScriptingData_L009, $00)   ; pAIScripting0x00_General @ $B38CD0
```

## 0x2C — PlaySoundWait

- Makro: `AICMD0x2C` · handler: `fAIAction0x2C` ($8495E8) · pewność: **probable**
- Długość: 6 B · użycie: 4 wywołań w 2 skryptach

Odtwarza efekt dzwiekowy (rejestry audio 114/115), czeka podana liczbe klatek i przywraca dzwiek narzedzia.

| Parametr | Offset | Rozmiar | Typ | Znaczenie |
|---|---|---|---|---|
| `nSoundId` | 1 | 1 | n8 | Trafia do A w fAudioUnknown_8382FE i do strcAudio.reg114 ($7E:0114) - prawdopodobnie id efektu dzwiekowego. W skryptach $04, $19, $23. |
| `nSoundParam` | 2 | 2 | n16 | Trafia do X; do strcAudio.reg115 ($7E:0115) zapisywany jest tylko mlodszy bajt (w skryptach 6 lub 7 - te same wartosci co pierwszy bajt wpisow w nToolSoundData_829054). |
| `nWaitFrames` | 4 | 2 | n16 | Trafia do Y; fAudioUnknown_8382FE czeka tyle klatek NMI (fCore_WaitForNMITimes). W skryptach $3C (60) lub $5A (90). |

Handler przesuwa wskaznik o 1, odklada na stos bajt i dwa slowa, wola fAudioUnknown_8382FE: zapisuje reg114/reg115, ustawia strcAudio.index = nToolSoundData_80B8CD[strcAudio.unk118]+1, wola fAudioUnknown_83833E (jesli strcAudio.list[index] != 0 wysyla dane do APU przez fAudioUnknown_8389C7) i fAudioSetRegister2to0A (reg116 = $0A), po czym BLOKUJE na nWaitFrames klatek NMI (ten wait zatrzymuje caly silnik, wolany z poziomu handlera). Potem zeruje strcAudio.toolId i wola fToolUsedSound_Unknown828FF3, ktora odtwarza dzwieki biezacego narzedzia (z nToolSoundData_829054) i przywraca toolId = strcPlayerData.toolEquipped. Wskaznik przesuniety lacznie o 6 bajtow. Uzywane w scenach ze zwierzetami/narzedziami (B4A3AD, B4BE06, B4BEB6, B4BECD).

RAM: `strcAudio.reg114`, `strcAudio.reg115`, `strcAudio.reg116`, `strcAudio.index`, `strcAudio.list`, `strcAudio.unk118`, `strcAudio.toolId`, `strcPlayerData.toolEquipped`, `ptrAIActionData`

Wywołuje: `fAudioUnknown_8382FE`, `fAudioUnknown_83833E`, `fAudioSetRegister2to0A`, `fAudioUnknown_8389C7`, `fCore_WaitForNMITimes`, `fToolUsedSound_Unknown828FF3`

> Otwarte pytania: Dokladne znaczenie reg114 vs reg115 (id dzwieku / kategoria) nie zostalo potwierdzone w kodzie SPC; sama funkcja (efekt dzwiekowy + czekanie) jest pewna. Nie wiadomo, dlaczego po dzwieku odtwarzany jest dzwiek narzedzia (prawdopodobnie reset stanu strcAudio.toolId).

Przykłady z skryptów:
```
%AICMD0x2C($23, $0007, $003C)   ; pAIScripting0x23 @ $B4A3AD
%AICMD0x2C($19, $0006, $005A)   ; pAIScripting0x28 @ $B4BE06
```

## 0x2D — JumpOnInteract

- Makro: `AICMD0x2D_JumpOnInteract` · handler: `fAIAction0x2D` ($849633) · pewność: **confirmed**
- Długość: 5 B · użycie: 181 wywołań w 16 skryptach

Jednoklatkowy test interakcji: jesli gracz nacisnal A przy tej postaci, skacze do jednego z dwoch adresow, w przeciwnym razie przechodzi do nastepnej komendy.

| Parametr | Offset | Rozmiar | Typ | Znaczenie |
|---|---|---|---|---|
| `pNextAction1` | 1 | 2 | script_ptr | Adres (16 bit, ten sam bank skryptu) skoku, gdy gracz nacisnal A przy tym slocie i NIE trzyma przedmiotu (lub akcja gracza != PACTION_DROPITEM). |
| `pNextAction2` | 3 | 2 | script_ptr | Adres skoku, gdy akcja gracza == PACTION_DROPITEM ($05) i strcPlayerData.carryItemId != 0 (gracz trzyma przedmiot); wtedy carryItemId kopiowane jest do carryItemIdPrev ($7E:091E). |

Warunki wstepne (kazdy nietrafiony => ścieżka bez skoku): bajt +$0C slotu AI != 0; akcja gracza nie jest USINGTOOL/SHOWTOOL/WHISTLEHORSE/WHISTLEDOG; brak PFLAGS_EATINGMEAL; (strcFlags.daily4 AND $0006) == 0; strcJoypad1.newInput ma bit A. Gdy spelnione: jesli akcja == PACTION_DROPITEM i carryItemId != 0, wskaznik przesuwa sie o 2 (wybor pNextAction2); w kazdym wypadku ptrAIActionData = 16-bitowa wartosc spod wskaznika (skok). Dalej: +$08 := +$07, +$03 := 0, +$04 := 0, +$0C := 0 (zatrzymanie ruchu, kasowanie flagi bliskosci), +$02 := strcPlayer.direction XOR 1 (postac patrzy na gracza), przeladowanie sprite'a przez fAI_Unknown848895 z tabela z +$33 (bank $B3), flaga +$01 |= $14, nPlayerInteractionIndex = $56 (arg1/arg2 = 0), ustawia PFLAGS_INTERACTING i akcje gracza PACTION_NONE, zwieksza +$10 (koniec klatki). Gdy warunki niespelnione: ptrAIActionData += 4 (lacznie komenda zajmuje 5 bajtow) i tez zwieksza +$10. Komenda nie czeka - w skryptach NPC stoi w petli z Jump (153 uzycia w bank B3), czesto po komendzie 0x4D.

RAM: `ptrAIUnknown0xCC`, `ptrAIActionData`, `strcPlayer.action`, `strcPlayer.flags`, `strcPlayer.direction`, `strcFlags.daily4`, `strcJoypad1.newInput`, `strcPlayerData.carryItemId`, `strcPlayerData.carryItemIdPrev`, `nPlayerInteractionIndex`, `nPlayerInteractionArg1`, `nPlayerInteractionArg2`, `strcAIUnknown.flags`, `strcAIUnknown.nDataIndex`, `strcAIUnknown.pDataAddress`, `strcAIUnknown.unk10`

Wywołuje: `fAI_Unknown848895`

> Otwarte pytania: Znaczenie bajtu +$0C slotu (prawdopodobnie flaga 'gracz stoi w zasiegu interakcji', ustawiana poza ta komenda - np. przez komende 0x4D) oraz bitow daily4 $0002/$0004 nie zostalo ustalone. Wartosc nPlayerInteractionIndex $56 (obsluga dialogu/interakcji z NPC) nie przesledzona. Nazwy pNextAction1/2 mozna doprecyzowac do pOnInteract/pOnInteractWithItem.

Przykłady z skryptów:
```
%AICMD0x2D_JumpOnInteract(pAIScripting0x01_L013, pAIScripting0x01_L011)   ; pAIScripting0x01 @ $B393E8
%AICMD0x2D_JumpOnInteract(pAIScripting0x01_L029, pAIScripting0x01_L027)   ; pAIScripting0x01 @ $B394B2
```

## 0x2E — StartWander

- Makro: `AICMD0x2E` · handler: `fAIAction0x2E` ($849777) · pewność: **probable**
- Długość: 5 B · użycie: 22 wywołań w 2 skryptach

Wlacza dla biezacego slotu AI losowe bladzenie (zwierzeta/NPC) wokol aktualnej pozycji, ktora staje sie punktem domowym.

| Parametr | Offset | Rozmiar | Typ | Znaczenie |
|---|---|---|---|---|
| `nStepFrames` | 1 | 1 | n8 | Zapis do slotu +$0B, +$05 i +$06: okres (w klatkach) kroku ruchu - licznik +$06 odlicza sie w fAI_Unknown848331 i po zera przeladowywany z +$05. W skryptach zawsze $01 (krok co klatke). |
| `pPointerB3` | 2 | 2 | script_ptr | Mlodsze 16 bitow adresu tabeli sprite'ow w banku $B3 zapisane w slocie +$36 - tabela uzywana podczas ruchu (przy zatrzymaniu uzywana jest tabela z +$33, ustawiona przez 0x2B/0x2F). |
| `nStepLength` | 4 | 1 | n8 | Zapis do slotu +$07 i +$08: dlugosc jednego losowego marszu w krokach (przeladowywana z +$07 do +$08). W skryptach $10 (16). |

Handler wpisuje argumenty do slotu: nStepFrames -> +$0B/+$05/+$06, wskaznik -> +$36, nStepLength -> +$07/+$08; ustawia w fladze +$01 bity $A8 ($80,$20,$08) i kopiuje aktualna pozycje (+$1A,+$1C) do punktu domowego (+$1E,+$20). Przesuwa ptrAIActionData o 5 bajtow, nie blokuje i nie zwieksza licznika +$10. Same ruchy wykonuje fAI_Unknown848286 -> fAI_Unknown8483CC co klatke: przy fladze $08 i zerowym liczniku losuje (strcPlayer.lastRandomNumber lub maska w +$0F) kierunek 0-3, sprawdza zasieg wzgledem punktu domowego (+$09/+$0A), ustawia predkosc +$03/+$04 (+-1) i kierunek +$02, laduje tabele sprite'ow ruchu z +$36 (przy zatrzymaniu - z +$33) i przesuwa pozycje +$1A/+$1C, z kolizja z mapa (fGameEngine_DirectionHandler83AF37 / fGameEngine_Unknown83AEC3). W skryptach 22 uzycia w bank B3 (kury, krowy, kon, kret, psy).

RAM: `ptrAIUnknown0xCC`, `strcAIUnknown.flags`, `strcAIUnknown.unk05`, `strcAIUnknown.unk06`, `strcAIUnknown.unk07`, `strcAIUnknown.unk08`, `strcAIUnknown.unk0B`, `strcAIUnknown.unk1A`, `strcAIUnknown.unk1C`, `strcAIUnknown.unk1E`, `strcAIUnknown.unk20`, `strcAIUnknown.unk36`, `ptrAIActionData`

> Otwarte pytania: Pewne: zapisy pol i ustawienie flag $A8. Niepewne: dokladne znaczenie bitu $80 (w fAI_Unknown8483CC jego ustawienie pomija test zasiegu od punktu domowego i wlacza test kolizji z mapa - rola 'swobodny ruch z kolizja'), oraz pol +$05/+$06/+$0B (rozroznienie okresu i licznika) i +$07/+$08 (dlugosc marszu vs. odliczanie). Nie ustawia +$09/+$0A (zasieg) - prawdopodobnie ustawiane gdzie indziej (np. przy fAI_Unknown84803F).

Przykłady z skryptów:
```
%AICMD0x2E($01, aAIScriptingData_L009, $10)   ; pAIScripting0x00_General @ $B38CD4
%AICMD0x2E($01, aAIScriptingData_L008, $10)   ; pAIScripting0x00_General @ $B38CE2
```

## 0x2F — SetActorSpriteTable

- Makro: `AICMD0x2F` · handler: `fAIAction0x2F` ($849810) · pewność: **probable**
- Długość: 3 B · użycie: 75 wywołań w 4 skryptach

Zmienia tabele sprite'ow (animacje) biezacego slotu AI, zachowujac aktualny kierunek, i oznacza sprite do odswiezenia.

| Parametr | Offset | Rozmiar | Typ | Znaczenie |
|---|---|---|---|---|
| `pPointerB3` | 1 | 2 | script_ptr | Mlodsze 16 bitow adresu tabeli sprite'ow w banku $B3 (bank na stale $B3). Zapisywane w slocie +$33 (pDataAddress). Tabela 3 bajty na kierunek. |

Handler zapisuje pointer w slocie +$33, wola fAI_Unknown848895 z ptrTemp0x72 = $B3:pointer (wybiera wpis wg kierunku z +$02: slowo -> +$16, bajt*64 -> +$14) i ustawia bit $04 w fladze +$01, co przy nastepnym fAI_Unknown848286 wywoluje fObject_Unknown858100 (odswiezenie sprite'a, jesli +$16 != +$18). Przesuwa ptrAIActionData o 3 i NIE konczy klatki (nie zwieksza +$10) - skrypt moze od razu wykonywac dalej. W skryptach 72 uzycia (bank B3, zwykle po Wait(60) przed Jump).

RAM: `ptrAIUnknown0xCC`, `strcAIUnknown.pDataAddress`, `strcAIUnknown.flags`, `strcAIUnknown.nDataIndex`, `strcAIUnknown.nDataValue`, `strcAIUnknown.nOtherUnknownIndex`, `ptrTemp0x72`, `ptrAIActionData`

Wywołuje: `fAI_Unknown848895`

> Otwarte pytania: Nie zweryfikowano zawartosci tabel aAIScriptingData_L*. Nazwa wynika z dzialania na polach +$33/+$16/+$14.

Przykłady z skryptów:
```
%AICMD0x2F(aAIScriptingData_L002)   ; pAIScripting0x00_General @ $B38D61
%AICMD0x2F(aAIScriptingData_L006)   ; pAIScripting0x00_General @ $B38F4A
```

## 0x30 — UpdateChicken

- Makro: `AICMD0x30_UpdateChicken` · handler: `fAIAction0x30_UpdateChicken` ($849857) · pewność: **probable**
- Długość: 1 B · użycie: 3 wywołań w 1 skryptach

Jeden tick logiki kury/kurczaka: synchronizuje pozycje ze struktura kury, obsluguje podniesienie przez gracza i losowe zachowania.

Handler przesuwa ptrAIActionData o 1 (nastepna komenda to zwykle Jump z powrotem - petla, po jednej klatce na przebieg). Indeks kury = bajt +$3F slotu (nArg) minus $24; fGameEngine_GetChickenData zwraca ptr24 na dane kury ($7E:C286 + n*8) i do jej pol +4/+6 kopiowane sa pozycje X/Y slotu (+$1A/+$1C). Jesli bajt +$0E != $E0: gdy bajt +$0C slotu != 0 i gracz nie jest zajety (akcja != USINGTOOL/SHOWTOOL/WHISTLE*, brak EATINGMEAL/INTERACTING/DOGHUGGING, daily4 AND $0006 = 0, akcja != PACTION_17/ITEMONHAND, carryItemId = 0) i nacisnal A, to przy odpowiednich bitach flag kury ($40, $0E, $20, $04, $08) kura jest podnoszona: bit $20 w danych kury, nAiArg slotu -> strcPlayerData.nAiArg ($7E:0920), slot dezaktywowany (+$00 = 0) i oznaczony do usuniecia ($40 w +$01), carryItemId := $26 (flaga $04) lub $25 (flaga $08), akcja gracza PACTION_ITEMONHAND. W przeciwnym razie, gdy dane kury maja bit $08, licznik strcStockData.unkEachChicken[n] rosnie do $0200 i wtedy z losu (lastRandomNumber < $55 vs reszta) startuje podskrypt $5C lub $5D przez fAI_Unknown84803F. Gdy +$0E == $E0 i flaga daily1 $0008: sekwencja interakcji (nGameUnk7F1F15 := $32, nPlayerInteractionIndex := $44). Na koncu zwieksza licznik +$10 (koniec klatki).

RAM: `strcAIUnknown.nArg`, `strcAIUnknown.unk0C`, `strcAIUnknown.unk0E`, `strcAIUnknown.unk10`, `strcAIUnknown.unk1A`, `strcAIUnknown.unk1C`, `strcAIUnknown.flags`, `strcStockData.unkEachChicken`, `strcPlayerData.carryItemId`, `strcPlayerData.nAiArg`, `nPlayerInteractionIndex`, `nGameUnk7F1F15`, `strcFlags.daily1`, `strcFlags.daily4`, `strcPlayer.action`, `strcPlayer.flags`, `strcPlayer.lastRandomNumber`, `strcJoypad1.newInput`, `ptrAIActionData`

Wywołuje: `fGameEngine_GetChickenData`, `fAI_Unknown84803F`

> Otwarte pytania: Pelne znaczenie bitow flag kury ($40,$20,$08,$04,$02) i wartosci $E0 w +$0E; znaczenie carryItemId $25/$26 (brak w enumie CITEM; prawdopodobnie kurczak i kura). Rola podskryptow $5C/$5D (general list 0) nie sprawdzona. Procedura jest 'spaghetti' - opisane tylko glowne sciezki.

Przykłady z skryptów:
```
%AICMD0x30_UpdateChicken()   ; pAIScripting0x00_General @ $B38CCC
```

## 0x31 — UpdateCow

- Makro: `AICMD0x31_UpdateCow` · handler: `fAIAction0x31_UpdateCow` ($849AD4) · pewność: **probable**
- Długość: 1 B · użycie: 9 wywołań w 1 skryptach

Jeden tick logiki krowy: synchronizuje pozycje ze struktura krowy, obsluguje karmienie, dojenie, podnoszenie i dialogi.

Handler przesuwa ptrAIActionData o 1 (komenda wystepuje w petli z Jump). Indeks krowy = bajt +$3F slotu minus $18; fGameEngine_GetCowData zwraca ptr24 do danych krowy ($7E:C1C6 + n*16), do pol +8/+$0A kopiowane sa pozycje X/Y slotu. W AREA_COWBARN i dla +$0E == $C2 skacze do fUnknown_84A595; w obszarach mapy < AREA_TOWNSPRING przy +$0E == $E0/$E1 do fUnknown_84A498 / fUnknown_84A540; w pozostalych (farma) sprawdza gracza (brak narzedzia/gwizdania/jedzenia/INTERACTING/DOGHUGGING, daily4 AND $0006 = 0, A nacisniete) i flagi dnia daily1 ($0100,$0080,$0040,$0010,$0004) oraz event1 $0004. Zaleznie od bitow w danych krowy ($10,$20,$40,$08,$04) otwiera dialog (fDialog_DialogHandler z X = $2F/$30/$31/$32/$145, imie krowy kopiowane do strcNames.wCurrentCow), wola fUnknown_84A5D4, podnosi krowe/ustawia carryItemId i akcje PACTION_ITEMONHAND, inkrementuje strcStockData.unkEachCow[n] (zerowany po przekroczeniu progu) i ustawia nPlayerInteractionIndex. Koniec: zwieksza licznik +$10.

RAM: `strcAIUnknown.nArg`, `strcAIUnknown.unk0C`, `strcAIUnknown.unk0E`, `strcAIUnknown.unk10`, `strcAIUnknown.unk1A`, `strcAIUnknown.unk1C`, `strcAIUnknown.flags`, `strcStockData.unkEachCow`, `strcNames.wCurrentCow`, `strcMap.loadAreaId`, `strcPlayerData.carryItemId`, `nPlayerInteractionIndex`, `strcFlags.daily1`, `strcFlags.daily4`, `strcFlags.event1`, `strcPlayer.action`, `strcPlayer.flags`, `strcJoypad1.newInput`, `strcDialogDisplay.mapUnk19A`, `ptrAIActionData`

Wywołuje: `fGameEngine_GetCowData`, `fDialog_DialogHandler`, `fUnknown_84A5D4`, `fUnknown_84A498`, `fUnknown_84A540`, `fUnknown_84A595`, `fAI_Unknown84803F`

> Otwarte pytania: Procedura ma ok. 1900 linii i nie zostala przesledzona w calosci: niepewne dokladne znaczenie poszczegolnych flag dnia daily1, bitow danych krowy i wartosci +$0E ($C2,$E0,$E1). Opis obejmuje tylko glowne sciezki, stad probable.

Przykłady z skryptów:
```
%AICMD0x31_UpdateCow()   ; pAIScripting0x00_General @ $B38CF4
```

## 0x32 — SetValue16

- Makro: `AICMD0x32_SetValue16` · handler: `fAIAction0x32` ($84A90F) · pewność: **confirmed**
- Długość: 6 B · użycie: 18 wywołań w 8 skryptach

Zapisuje stala 16-bitowa pod dowolny adres RAM (odpowiednik 0x47 SetValue8 dla slowa).

| Parametr | Offset | Rozmiar | Typ | Znaczenie |
|---|---|---|---|---|
| `pAddress` | 1 | 3 | ram_ptr | Adres 24-bitowy slowa 16-bit w RAM (w skryptach $8000D4 = strcPlayer.action przez lustro banku $80 albo strcFlags.unknown1). Makro nazywa go nUnknown1. |
| `nValue` | 4 | 2 | n16 | Wartosc 16-bitowa zapisywana pod adres (np. $0015 = PACTION_DRINKING, $0000, maski $F7FF/$FFDF w strcFlags.unknown1). Makro nazywa ja nUnknown2. |

Handler wczytuje mlodsze 16 bitow adresu i bank do ptrTemp0x72, potem slowo wartosci i wykonuje STA [ptrTemp0x72]. Przesuwa ptrAIActionData o 6 bajtow. Nie blokuje. Wystepuje m.in. po dialogach, by ustawic akcje gracza PACTION_DRINKING ($15), oraz do nadpisywania slowa flag.

RAM: `ptrTemp0x72`, `ptrAIActionData`

> Otwarte pytania: Brak - format w pelni zgodny z makrem. Dla strcFlags.unknown1 wartosci $F7FF/$FFDF wygladaja na maski, ale komenda je po prostu zapisuje (nie AND), wiec skrypt prawdopodobnie ustawia cale slowo.

Przykłady z skryptów:
```
%AICMD0x32_SetValue16($8000D4, $0015)   ; pAIScripting0x05 @ $B3D343
%AICMD0x32_SetValue16(strcFlags.unknown1, $F7FF)   ; pAIScripting0x0E @ $B3F11A
```

## 0x33 — UpdateMole

- Makro: `AICMD0x33` · handler: `fAIAction0x33_UpdateMole` ($84A94C) · pewność: **probable**
- Długość: 1 B · użycie: 2 wywołań w 1 skryptach

Jeden tick logiki kreta: umozliwia podniesienie go przez gracza, a w przeciwnym razie okresowo losowo uruchamia podskrypt jego pojawienia sie.

Handler przesuwa ptrAIActionData o 1 (zwykle petla z Jump). Jesli bajt +$0C slotu != 0, gracz nie jest zajety (akcja != USINGTOOL/SHOWTOOL/WHISTLE*, brak EATINGMEAL, DOGHUGGING, daily4 AND $0006 = 0, akcja != PACTION_17, carryItemId = 0) i nacisnal A: nAiArg ($3F) -> strcPlayerData.nAiArg, slot dezaktywowany (+$00 = 0) i oznaczony do usuniecia ($40 w +$01), +$10++, carryItemId := $29, akcja gracza PACTION_ITEMONHAND (RTS). W przeciwnym razie licznik strcStockData.unkMole ($7E:093A) rosnie do $B4 (180 klatek); po osiagnieciu zeruje sie i jesli bit $80 z strcPlayer.lastRandomNumber jest ustawiony, wola fAI_Unknown84803F(A=$11, X=0, Y=$81) - uruchamia podskrypt $81 listy ogolnej (indeks 0) w slocie AI $11. Na koncu zwieksza licznik +$10.

RAM: `strcAIUnknown.unk0C`, `strcAIUnknown.nArg`, `strcAIUnknown.flags`, `strcAIUnknown.unk10`, `strcStockData.unkMole`, `strcPlayerData.carryItemId`, `strcPlayerData.nAiArg`, `strcPlayer.action`, `strcPlayer.flags`, `strcPlayer.lastRandomNumber`, `strcFlags.daily4`, `strcJoypad1.newInput`, `ptrAIActionData`

Wywołuje: `fAI_Unknown84803F`

> Otwarte pytania: Brak enuma CITEM dla $29 (zgodnie z nazwa handlera prawdopodobnie kret). Rola podskryptu $81 w slocie $11 nieprzesledzona (prawdopodobnie wynurzenie/ukrycie kreta). Nazwa handlera pochodzi z repozytorium, kod potwierdza jedynie przedmiot $29 i licznik unkMole.

Przykłady z skryptów:
```
%AICMD0x33()   ; pAIScripting0x00_General @ $B38FBF
```

## 0x34 — UpdatePickup

- Makro: `AICMD0x34` · handler: `fAIAction0x34` ($84AA5D) · pewność: **probable**
- Długość: 1 B · użycie: 1 wywołań w 1 skryptach

Jeden tick prostego aktora-przedmiotu: po nacisnieciu A gracz bez przedmiotu podnosi go (carryItemId = 7) i aktor znika.

Handler przesuwa ptrAIActionData o 1 (w jedynym uzyciu B38FFD stoi w petli Jump). Gdy bajt +$0C slotu != 0, gracz nie jest zajety (akcja != USINGTOOL/SHOWTOOL/WHISTLE*, brak EATINGMEAL, daily4 AND $0006 = 0), nacisnal A i nie trzyma przedmiotu (carryItemId = 0): nAiArg -> strcPlayerData.nAiArg, slot dezaktywowany (+$00 = 0), +$01 |= $40 (usuniecie obiektu), +$10++, strcPlayerData.carryItemId := !EITEM_POTATOSEED (= $07; w enumie przedmiotow noszonych $07 to CITEM_FISH) i akcja gracza PACTION_ITEMONHAND. W innych wypadkach jedynie zwieksza +$10. Brak logiki losowej ani liczników - najprostsza z rodziny Update*.

RAM: `strcAIUnknown.unk0C`, `strcAIUnknown.nArg`, `strcAIUnknown.flags`, `strcAIUnknown.unk10`, `strcPlayerData.carryItemId`, `strcPlayerData.nAiArg`, `strcPlayer.action`, `strcFlags.daily4`, `strcJoypad1.newInput`, `ptrAIActionData`

> Otwarte pytania: Kod uzywa nazwy !EITEM_POTATOSEED (z enuma przedmiotow ekwipowanych), ale zapisuje do carryItemId, gdzie $07 to CITEM_FISH - najpewniej blad nazewnictwa w zrodle i aktor jest ryba (jedyne uzycie: aktor tworzony komenda 0x1A na (0x268,0x178) z aAIScriptingData_L127, prawdopodobnie ryba). Do potwierdzenia po sprawdzeniu danych skryptu. Nazwa makra propozycja robocza.

Przykłady z skryptów:
```
%AICMD0x34()   ; pAIScripting0x00_General @ $B38FFD
```

## 0x35 — UpdateHorse

- Makro: `AICMD0x35_UpdateHorse` · handler: `fAIAction0x35_UpdateHorse` ($84AB27) · pewność: **probable**
- Długość: 1 B · użycie: 3 wywołań w 1 skryptach

Jeden tick logiki konia: okresowe losowe zachowania zrebaka lub dorosłego konia, dosiadanie, podazanie za graczem.

Handler przesuwa ptrAIActionData o 1 (petla z Jump, 3 uzycia w B3), kasuje strcFlags.daily2 $0010. Jesli nHorseAge ($7F:1F32) != $15: licznik strcStockData.unkHorse ($7E:0939) rosnie do $78, po czym zeruje sie i wola fAI_Unknown84803F(A=$17, X=0, Y=$80) - podskrypt zrebaka; ominiecie reszty. Gdy nHorseAge == $15 (dorosly): przy daily2 $0040 wybiera podskrypt $28-$2B wg kierunku +$02 slotu; przy brakujacych flagach daily2 $0800/$0020 sprawdza akcje gracza (bajt +$0C, brak narzedzia/gwizdania/jedzenia, daily4 AND $0006 = 0), ustawia daily2 $0010 i po nacisnieciu A w odleglosci ~$10 px od pozycji gracza (fGameEngine_DirectionHandler83AF37 / 83AD91) ustawia akcje gracza PACTION_17 (dosiadanie). Flaga daily2 $0020 wlacza tryb jazdy: ustawia PFLAGS_RIDINGHORSE, dezaktywuje slot (+$00 = 0, +$01 |= $40, +$0C = 0). Gdy brak interakcji: co $78 klatek wybiera wg lastRandomNumber jeden z podskryptow $4B/$4D/$4E/$4F/$50 (slot $17). Przy daily2 $0400 (wolanie konia) ustawia +$01 |= $28, uruchamia podskrypt $4C (dorosly) lub $4A (zrebak) i wylicza kierunek do gracza (+$0F = 1/2/4/8, +$08 := $20) oraz idzie w strone gracza. Kazda galaz konczy sie zwiekszeniem licznika +$10.

RAM: `nHorseAge`, `strcStockData.unkHorse`, `strcFlags.daily2`, `strcFlags.daily4`, `strcAIUnknown.nDataIndex`, `strcAIUnknown.flags`, `strcAIUnknown.unk08`, `strcAIUnknown.unk0C`, `strcAIUnknown.unk0F`, `strcAIUnknown.unk10`, `strcAIUnknown.unk1A`, `strcAIUnknown.unk1C`, `strcAIUnknown.nArg`, `strcPlayer.action`, `strcPlayer.flags`, `strcPlayer.posX`, `strcPlayer.posY`, `strcPlayer.unkE3`, `strcPlayer.lastRandomNumber`, `strcObjectData.directionNew`, `strcJoypad1.newInput`, `ptrAIActionData`

Wywołuje: `fAI_Unknown84803F`, `fGameEngine_DirectionHandler83AF37`, `fGameEngine_DirectionHandler83AD91`

> Otwarte pytania: Opisano tylko glowne sciezki procedury (ok. 500 linii spaghetti). Niepewne: dokladne znaczenie flag daily2 ($0020 - dosiad, $0040, $0400 - wolanie, $0800) i wartosci nHorseAge == $15 (prawdopodobnie 'dorosly'; nazwa nHorseAge to 16-bit wedlug ram.asm, a kod czyta 8 bit). Rola podskryptow $28-$2B, $4A-$50 w liscie ogolnej nieprzesledzona.

Przykłady z skryptów:
```
%AICMD0x35_UpdateHorse()   ; pAIScripting0x00_General @ $B38D97
```

## 0x36 — UpdateDog

- Makro: `AICMD0x36_UpdateDog` · handler: `fAIAction0x36_UpdateDog` ($84AF06) · pewność: **probable**
- Długość: 1 B · użycie: 3 wywołań w 2 skryptach

Jeden tick logiki psa: kopiuje pozycje slotu AI do nDogX/nDogY, obsluguje przytulenie/podniesienie psa, losowe zachowania w bezruchu i bieg do gracza po gwizdnieciu.

Handler przesuwa ptrAIActionData o 1 (kolejna komenda to zwykle Jump z powrotem na UpdateDog - patrz B38DAC/B38DAD, wiec petla). Kopiuje slowa slotu AI ([ptrAIUnknown0xCC]+0x1A i +0x1C) do nDogX/nDogY. (1) Hug: jesli bajt slotu +0x0C != 0 oraz gracz NIE: uzywa narzedzia/pokazuje narzedzie/gwizdze na konia lub psa/je posilku/jedzie konno/ma action $17 lub ITEMONHAND/niesie przedmiot (carryItemId), flaga daily4 $0006 wyczyszczona, nowo wcisniete A (strcJoypad1.newInput) i brak PFLAGS_DOGHUGGING, to zeruje bajt +0x00 slotu (dezaktywacja slotu), ustawia bit $40 w +0x01, ustawia PFLAGS_DOGHUGGING i inkrementuje nDogHugs. (2) Idle: strcStockData.unkDog liczy klatki do $78 (120), po czym zeruje sie i maszyna stanow w $7F1F58 (bity $01,$02,$04,$08,$10, sprawdzane w tej kolejnosci) z losowa (strcPlayer.lastRandomNumber) szansa uruchamia podskrypt psa przez fAI_Unknown84803F(A=$16, X=0, Y=$3C..$49) i zmienia stan; progi losowania np. $40/$80/$C0 dla stanu $01, $2A/$54/$7E/$A8 dla stanu $02. (3) Gwizdniecie (flaga daily4 $0010, ustawiana w fPlayerAction0x1B_WhistleDog i czyszczona w koncowce fAI_Unknown848020-owej rutyny): zeruje unkDog, ustawia bity $28 w +0x01, uruchamia podskrypt Y=slot[+0x3F] (X=0), liczy |dx|,|dy| miedzy slotem a graczem, ustawia [+0x08]=$20 i kierunek ruchu w [+0x0F] jako maske bitowa (1=dol,2=gora,4=prawo,8=lewo - kolejnosc jak aAIJoypadInput) wedlug wiekszej osi. Na koncu (jesli brak gwizdniecia) inkrementuje licznik [+0x10]. Nie blokuje.

RAM: `ptrAIActionData`, `ptrAIUnknown0xCC`, `nDogX`, `nDogY`, `nDogHugs`, `strcStockData.unkDog`, `$7F1F58`, `strcPlayer.action`, `strcPlayer.flags`, `strcPlayer.lastRandomNumber`, `strcPlayer.posX`, `strcPlayer.posY`, `strcPlayerData.carryItemId`, `strcJoypad1.newInput`, `strcFlags.daily4`

Wywołuje: `fAI_Unknown84803F`

> Otwarte pytania: Znaczenie bitow stanu $7F1F58 (prawdopodobnie: 1=stoi, 2=siedzi/lezy itd.), indeksow podskryptow $3C-$49, $3F i bajtow slotu +0x08/+0x0C/+0x0F nie ustalone bez analizy podskryptow w B38xxx. Nie wiadomo czy bajt +0x0C oznacza 'pies da sie podniesc' (tylko wnioskowanie). Do potwierdzenia, czy wykonywana jest jedna komenda na klatke na slot (wtedy UpdateDog+Jump = tick co 2 klatki).

Przykłady z skryptów:
```
%AICMD0x36_UpdateDog()   ; pAIScripting0x00_General @ $B38DAC
```

## 0x37 — RemoveObject

- Makro: `AICMD0x37` · handler: `fAIAction0x37` ($84B34B) · pewność: **probable**
- Długość: 1 B · użycie: 104 wywołań w 41 skryptach

Usuwa/dezaktywuje obiekt gry powiazany ze slotem AI (indeks z pola +0x12 slotu).

Przesuwa wskaznik o 1, wczytuje slowo [ptrAIUnknown0xCC]+0x12 do strcObject.gameObjectIdx i wola fObject_Unknown8581A2. Ta procedura wyznacza offset obiektu z aGameObjectIndexOffsets, sprawdza komponenty (fUnknown_858B7B), zwalnia je (fUnknown_858B41 -> fUnknown_858C9F dekrementuje licznik w $7EA320+idx*4) i zeruje strcGameObject.initailized. Identyczna sekwencja jest w fAI_Unknown848020 (tam dodatkowo zerowany bajt +0x00 slotu), wiec 0x37 to wariant 'usun obiekt, ale nie dezaktywuj slotu'. W skryptach wystepuje tuz przed %AICMD0x10_End() (np. B38DFA, B38E92). Nie blokuje.

RAM: `ptrAIActionData`, `ptrAIUnknown0xCC`, `strcObject.gameObjectIdx`, `strcObject.gameObjectIdxOffs`, `strcObject.bankAddress`, `strcGameObject.initailized`, `strcGameObject.components`

Wywołuje: `fObject_Unknown8581A2`

> Otwarte pytania: Dokladna semantyka fObject_Unknown8581A2 (np. sciezka z strcObject.bankAddress != 0 skacze do innego RTL - komentarz w kodzie wskazuje na bug) oraz to, jaki typ obiektu jest w slocie +0x12 (sprite NPC/zwierzecia).

Przykłady z skryptów:
```
%AICMD0x37()   ; pAIScripting0x00_General @ $B38DFA
```

## 0x38 — WaitForFadeIn

- Makro: `AICMD0x38_WaitForFadeIn` · handler: `fAIAction0x38` ($84B365) · pewność: **confirmed**
- Długość: 1 B · użycie: 150 wywołań w 55 skryptach

Blokuje skrypt do chwili, gdy ustawiona jest flaga daily1 $8000 (ekran w pelni rozjasniony po fade-in).

Jesli strcFlags.daily1 & $8000 != 0, przesuwa wskaznik o 1 i konczy (skrypt idzie dalej). W przeciwnym razie NIE przesuwa wskaznika (komenda wykonuje sie ponownie w nastepnej klatce) i tylko inkrementuje bajt/slowo [ptrAIUnknown0xCC]+0x10. Flaga $8000 jest ustawiana na koncu fCore_ScreenFadein (po osiagnieciu docelowej jasnosci) i czyszczona na koncu fCore_ScreenFadeout; inne miejsca ja czytaja (input.asm - np. obsluga START). Typowy wzorzec w skryptach: 0x06 SetDestinationArea, 0x38, 0x0B, 0x0C.

RAM: `strcFlags.daily1`, `ptrAIActionData`, `ptrAIUnknown0xCC`

> Otwarte pytania: Nazwa pola slotu +0x10 (licznik klatek skryptu?) niepotwierdzona.

Przykłady z skryptów:
```
%AICMD0x38_WaitForFadeIn()   ; pAIScripting0x09 @ $B3E637
```

## 0x39 — WalkForTime

- Makro: `AICMD0x39_WalkForTime` · handler: `fAIAction0x39_WalkForTime` ($84B389) · pewność: **confirmed**
- Długość: 4 B · użycie: 335 wywołań w 40 skryptach

Symuluje wcisniecie kierunku (pad) na zadana liczbe klatek i czeka az minie; gracz idzie.

| Parametr | Offset | Rozmiar | Typ | Znaczenie |
|---|---|---|---|---|
| `nInputIndex` | 1 | 1 | enum | Indeks w aAIJoypadInput ($84B4D2): 0=DOWN($0400), 1=UP($0800), 2=RIGHT($0100), 3=LEFT($0200), 4=B($8000); enumy !AIINPUT_*. Wartosci >4 czytaja poza tablica (niezdefiniowane). |
| `nAmount` | 2 | 2 | n16 | Czas trwania w klatkach (licznik strcAiControlData.counter); wejscie jest aktywne ok. nAmount+1 wywolan handlera. |

Wejscie 1 (gdy PFLAGS_AISTEERING w strcPlayer.flags zgaszona): ORuje maske pada z tablicy do strcAiControlData.input, wpisuje nAmount do strcAiControlData.counter, cofa wskaznik na poczatek komendy (komenda sie powtarza), inkrementuje [+0x10] slotu i ustawia PFLAGS_AISTEERING (fInput_AIJoypadHandler czyta strcAiControlData.input). Kolejne wywolania (flaga ustawiona): jesli counter != 0 - dekrementuje i inkrementuje [+0x10], blokujac. Gdy counter == 0: zeruje input i counter, zdejmuje PFLAGS_AISTEERING, ustawia strcPlayer.action = PACTION_NONE i przesuwa wskaznik o 4 (nastepna komenda). Blokuje na ~nAmount klatek.

RAM: `ptrAIActionData`, `ptrAIUnknown0xCC`, `strcAiControlData.input`, `strcAiControlData.counter`, `strcPlayer.flags`, `strcPlayer.action`

> Otwarte pytania: Czy wejscie jest uwzgledniane w klatce inicjalizacji zalezy od kolejnosci w petli glownej (nie badane). Brak walidacji nInputIndex.

Przykłady z skryptów:
```
%AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 48)   ; pAIScripting0x09 @ $B3E646
%AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 112)   ; pAIScripting0x09 @ $B3E680
```

## 0x3A — RunForTime

- Makro: `AICMD0x3A_RunForTime` · handler: `fAIAction0x3A_RunForTime` ($84B427) · pewność: **confirmed**
- Długość: 4 B · użycie: 274 wywołań w 17 skryptach

Jak 0x39, ale dodatkowo wciska B (bieg).

| Parametr | Offset | Rozmiar | Typ | Znaczenie |
|---|---|---|---|---|
| `nInputIndex` | 1 | 1 | enum | Jak w 0x39: indeks kierunku w aAIJoypadInput (!AIINPUT_*). |
| `nAmount` | 2 | 2 | n16 | Czas trwania w klatkach (strcAiControlData.counter). |

Identyczna logika jak 0x39, z ta roznica, ze przy inicjalizacji do strcAiControlData.input ORowana jest takze maska z indeksu 4 tablicy (X=8 -> $8000 = JOYPAD_B). Ten sam mechanizm PFLAGS_AISTEERING + counter, po zakonczeniu zerowanie inputu, action=PACTION_NONE i przesuniecie wskaznika o 4. Blokuje.

RAM: `ptrAIActionData`, `ptrAIUnknown0xCC`, `strcAiControlData.input`, `strcAiControlData.counter`, `strcPlayer.flags`, `strcPlayer.action`

Przykłady z skryptów:
```
%AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 64)   ; pAIScripting0x09 @ $B3E64A
%AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 48)   ; pAIScripting0x09 @ $B3E6CD
```

## 0x3B — SetCarryItemHolding

- Makro: `AICMD0x3B` · handler: `fAIAction0x3B` ($84B4DC) · pewność: **probable**
- Długość: 2 B · użycie: 5 wywołań w 4 skryptach

Ustawia przenoszony przedmiot i flage PFLAGS_HOLDINGITEM (gracz niesie przedmiot bez animacji podnoszenia).

| Parametr | Offset | Rozmiar | Typ | Znaczenie |
|---|---|---|---|---|
| `nCarryItemId` | 1 | 1 | n8 | Id przenoszonego przedmiotu zapisywany do strcPlayerData.carryItemId ($091D). Uzywane wartosci: $24,$14,$12,$01,$06 (enum !CITEM_* ma tylko NONE=0 i FISH=7). |

Wczytuje bajt argumentu do strcPlayerData.carryItemId, przesuwa wskaznik o 2 i ustawia bit PFLAGS_HOLDINGITEM ($0002) w strcPlayer.flags. W odroznieniu od 0x3E nie zmienia strcPlayer.action. W skryptach uzywane na poczatku scen (np. B49133 przed 0x38 i marszem, potem 0x3F wyrzuca przedmiot). Nie blokuje.

RAM: `ptrAIActionData`, `strcPlayerData.carryItemId`, `strcPlayer.flags`

> Otwarte pytania: Brak nazw dla id przedmiotow noszonych poza NONE/FISH. Nazwa 'bez animacji' to wnioskowanie z roznicy wzgledem 0x3E (action ITEMONHAND).

Przykłady z skryptów:
```
%AICMD0x3B($24)   ; pAIScripting0x1A @ $B49133
%AICMD0x3B($14)   ; pAIScripting0x32 @ $B4CB8D
```

## 0x3C — TeleportToHouse

- Makro: `AICMD0x3C` · handler: `fAIAction0x3C` ($84B503) · pewność: **probable**
- Długość: 1 B · użycie: 22 wywołań w 12 skryptach

Teleportuje gracza do domu (nDestinationAreaId=$15=AREA_HOUSE1) z flaga wymuszonego teleportu i ustawia flage daily4 $0020.

Przesuwa wskaznik o 1, zapisuje $15 (AREA_HOUSE1) do nDestinationAreaId ($098B), ORuje $4000 (AFLAGS_FORCETELEPORT) w strcDialogDisplay.mapFlags i ustawia strcFlags.daily4 |= $0020. Flaga daily4 $0020 jest czytana w kodzie bank_83 przy wyborze skryptu AI (%AIExecute($0000,$000A,3) vs inny) - wskazuje na 'dzien zakonczony/wrocono do domu z eventu'. Wystepuje na koncu skryptow eventowych tuz przed 0x10 End (np. B3EF1A, B3FFA2). Nie blokuje.

RAM: `ptrAIActionData`, `nDestinationAreaId`, `strcDialogDisplay.mapFlags`, `strcFlags.daily4`

> Otwarte pytania: Dokladne znaczenie daily4 $0020 (jedyny czytelnik: wybor skryptu w game_engine/map_engine ok. 83E30C) - nazwa 'TeleportToHouse' dotyczy tylko area $15.

Przykłady z skryptów:
```
%AICMD0x3C()   ; AI_HouseExtensionCampain @ $B3EF1A
```

## 0x3D — TeleportToArea

- Makro: `AICMD0x3D_TeleportToArea` · handler: `fAIAction0x3D_TeleportToArea` ($84B52D) · pewność: **confirmed**
- Długość: 2 B · użycie: 68 wywołań w 35 skryptach

Ustawia docelowy obszar i wymusza teleport (AFLAGS_FORCETELEPORT).

| Parametr | Offset | Rozmiar | Typ | Znaczenie |
|---|---|---|---|---|
| `nAreaId` | 1 | 1 | enum | Id mapy/obszaru (enum !AREA_*) zapisywany do nDestinationAreaId ($098B). |

Wczytuje bajt do nDestinationAreaId, przesuwa wskaznik o 2 i ORuje $4000 (AFLAGS_FORCETELEPORT) w strcDialogDisplay.mapFlags; faktyczna zmiana mapy nastepuje w silniku map. Nie blokuje. W odroznieniu od 0x3C nie rusza daily4.

RAM: `ptrAIActionData`, `nDestinationAreaId`, `strcDialogDisplay.mapFlags`

Przykłady z skryptów:
```
%AICMD0x3D_TeleportToArea(!AREA_TOOLSSHOP)   ; pAIScripting0x00_General @ $B392C6
%AICMD0x3D_TeleportToArea(!AREA_WEDDINGSPRING)   ; pAIScripting0x02 @ $B3B141
```

## 0x3E — PickUpCarryItem

- Makro: `AICMD0x3E_SetCarryItem` · handler: `fAIAction0x3E` ($84B556) · pewność: **probable**
- Długość: 2 B · użycie: 87 wywołań w 10 skryptach

Ustawia przenoszony przedmiot i uruchamia akcje gracza PACTION_ITEMONHAND (pozowanie/podniesienie przedmiotu).

| Parametr | Offset | Rozmiar | Typ | Znaczenie |
|---|---|---|---|---|
| `nCarryItemId` | 1 | 1 | n8 | Id przenoszonego przedmiotu do strcPlayerData.carryItemId ($091D); uzywane m.in. $23,$06,$16,$14,$25,$17,$10,$11,$12,$13,$2D,$2C,$09. |

Wczytuje bajt do strcPlayerData.carryItemId, przesuwa wskaznik o 2 i ustawia strcPlayer.action = PACTION_ITEMONHAND ($0004). Rozni sie od 0x3B tym, ze uruchamia akcje zamiast ustawiac PFLAGS_HOLDINGITEM. Nie blokuje samo w sobie (animacje obsluguje silnik gracza; skrypty zwykle dodaja potem Wait).

RAM: `ptrAIActionData`, `strcPlayerData.carryItemId`, `strcPlayer.action`

> Otwarte pytania: Efekt wizualny PACTION_ITEMONHAND wnioskowany z nazwy enumu, nie z analizy fPlayerAction.

Przykłady z skryptów:
```
%AICMD0x3E_SetCarryItem($23)   ; pAIScripting0x14 @ $B48B66
%AICMD0x3E_SetCarryItem($06)   ; pAIScripting0x27 @ $B4B93E
```

## 0x3F — ThrowCarriedItem

- Makro: `AICMD0x3F_ThrowCarriedItem` · handler: `fAIAction0x3F_ThrowHeldItem` ($84B57B) · pewność: **confirmed**
- Długość: 1 B · użycie: 74 wywołań w 10 skryptach

Ustawia akcje gracza PACTION_DROPITEM (rzut/odlozenie noszonego przedmiotu).

Przesuwa wskaznik o 1 i zapisuje strcPlayer.action = PACTION_DROPITEM ($0005). Nie czysci carryItemId sam - robi to silnik akcji gracza. W skryptach po marszu z przedmiotem (B4913C, B4A68F, B4CA63). Nie blokuje.

RAM: `ptrAIActionData`, `strcPlayer.action`

Przykłady z skryptów:
```
%AICMD0x3F_ThrowCarriedItem()   ; pAIScripting0x1A @ $B4913C
```

## 0x40 — DisableTileInteractions

- Makro: `AICMD0x40_DisableTileInteractions` · handler: `fAIAction0x40_DisableTileInteractions` ($84B58F) · pewność: **probable**
- Długość: 1 B · użycie: 32 wywołań w 18 skryptach

Ustawia flage strcFlags.daily2 $0008, ktora wylacza sprawdzanie obiektu/kafla pod graczem.

Przesuwa wskaznik o 1 i ORuje $0008 w strcFlags.daily2. Flaga jest czytana m.in. w fUnknown_82AC61 (przed fObjectEngine_GetObjectAtCoords - przy ustawionej omija wyszukiwanie obiektu pod wspolrzednymi). Nie blokuje.

RAM: `ptrAIActionData`, `strcFlags.daily2`

> Otwarte pytania: Nie ustalono wszystkich czytelnikow flagi ani miejsca jej czyszczenia (fAI_* czyszczace maja tylko $0400 w daily2). Pelna lista efektow nieznana.

Przykłady z skryptów:
```
%AICMD0x40_DisableTileInteractions()   ; pAIScripting0x09 @ $B3E623
```

## 0x41 — AddValue16

- Makro: `AICMD0x41_AddValue16` · handler: `fAIAction0x41_AddValue16` ($84B5A9) · pewność: **confirmed**
- Długość: 6 B · użycie: 462 wywołań w 36 skryptach

Dodaje n16Value do slowa pod pAddress z nasyceniem do zakresu 0..999.

| Parametr | Offset | Rozmiar | Typ | Znaczenie |
|---|---|---|---|---|
| `pAddress` | 1 | 3 | ram_ptr | Adres 24-bit slowa 16-bit w pamieci (np. nLove_Ann, $80xxxx = lustro WRAM). |
| `n16Value` | 4 | 2 | n16 | Wartosc dodawana (interpretowana ze znakiem, np. -2 = $FFFE). |

Wczytuje adres do ptrTemp0x72 (3 bajty) i wartosc do strcVariables.n16Temp1, wykonuje [addr] += wartosc (16-bit). Jesli wynik ujemny (bit 15) zapisuje 0; jesli >= $03E7 zapisuje $03E7 (999). Przesuwa wskaznik o 6. Nie blokuje.

RAM: `ptrAIActionData`, `ptrTemp0x72`, `strcVariables.n16Temp1`, `[pAddress]`

Przykłady z skryptów:
```
%AICMD0x41_AddValue16(nPlayerHappiness, 5)   ; pAIScripting0x01 @ $B3958F
%AICMD0x41_AddValue16(nLove_Maria, -8)   ; pAIScripting0x01 @ $B39614
```

## 0x42 — AddMoney

- Makro: `AICMD0x42_AddValue24` · handler: `fAIAction0x42_AddValue24` ($84B602) · pewność: **confirmed**
- Długość: 7 B · użycie: 5 wywołań w 5 skryptach

Dodaje n24Value do nMoney ($7F1F04) przez fGameEngine_AddProfit; przy ujemnym wyniku zeruje pieniadze.

| Parametr | Offset | Rozmiar | Typ | Znaczenie |
|---|---|---|---|---|
| `pAddress` | 1 | 3 | ram_ptr | Czytany, ale ignorowany przez handler (ptrTemp0x72 jest zaraz nadpisywany wartoscia). Skrypty zawsze podaja nMoney. |
| `n24Value` | 4 | 3 | n24 | Kwota 24-bit ze znakiem dodawana do pieniedzy gracza (np. -2000, 1000, 2). |

Handler wczytuje adres do ptrTemp0x72 po czym wczytuje wartosc do tego samego ptrTemp0x72 (24 bit), wiec adres z komendy nie ma wplywu - cel jest zawsze nMoney. Wola fGameEngine_AddProfit (83B1C9): dodaje 24-bit, limit gorny 999999 ($0F423F), przy wyniku ujemnym zwraca A=1 bez zapisu. Gdy A != 0 handler zeruje nMoney (24-bit). Przesuwa wskaznik o 7. Nie blokuje.

RAM: `ptrAIActionData`, `ptrTemp0x72`, `nMoney`

Wywołuje: `fGameEngine_AddProfit`

> Otwarte pytania: Interpretacja BEQ po JSL opiera sie na tym, ze REP #$20 nie zmienia flagi Z (A=1 z AddProfit -> zerowanie).

Przykłady z skryptów:
```
%AICMD0x42_AddValue24(nMoney, -100)   ; pAIScripting0x03 @ $B3BAF7
%AICMD0x42_AddValue24(nMoney, -200)   ; pAIScripting0x0E @ $B3F26D
```

## 0x43 — JumpIfEqual16

- Makro: `AICMD0x43_JumpIfEqual16` · handler: `fAIAction0x43_JumpIfEqual16` ($84B666) · pewność: **confirmed**
- Długość: 8 B · użycie: 28 wywołań w 3 skryptach

Skacze do pNextAction, jesli slowo 16-bit pod pAddress rowna sie n16Value.

| Parametr | Offset | Rozmiar | Typ | Znaczenie |
|---|---|---|---|---|
| `pAddress` | 1 | 3 | ram_ptr | Adres 24-bit slowa 16-bit do porownania (np. $8000D4 = strcPlayer.action, nFirstChildAge). |
| `n16Value` | 4 | 2 | n16 | Wartosc porownywana (rownosc). |
| `pNextAction` | 6 | 2 | script_ptr | Adres 16-bit celu skoku w biezacym banku skryptu (bank bierze z ptrAIActionData+2). |

Czyta adres i wartosc, porownuje 16-bit [pAddress] z wartoscia. Rowne: ptrAIActionData (16 bit) = pNextAction. Rozne: przesuwa wskaznik o 2 (za pNextAction), czyli dlugosc 8. Nie blokuje.

RAM: `ptrAIActionData`, `ptrTemp0x72`, `strcVariables.n16Temp1`, `[pAddress]`

Przykłady z skryptów:
```
%AICMD0x43_JumpIfEqual16($8000D4, 5, pAIScripting0x00_General_L040)   ; pAIScripting0x00_General @ $B38EAD
%AICMD0x43_JumpIfEqual16($8000D4, 5, pAIScripting0x00_General_L043)   ; pAIScripting0x00_General @ $B38F14
```

## 0x44 — JumpIfEqual24

- Makro: `AICMD0x44_JumpIfEqual24` · handler: `fAIAction0x44_JumpIfEqual24` ($84B6BC) · pewność: **confirmed**
- Długość: 9 B · użycie: 0 wywołań w 0 skryptach

Skacze do pNextAction, jesli 24-bitowa wartosc pod pAddress rowna sie n24Value.

| Parametr | Offset | Rozmiar | Typ | Znaczenie |
|---|---|---|---|---|
| `pAddress` | 1 | 3 | ram_ptr | Adres 24-bit wartosci 24-bit (3 bajty w pamieci). |
| `n24Value` | 4 | 3 | n24 | Wartosc porownywana (rownosc, bajty: word + bank). |
| `pNextAction` | 7 | 2 | script_ptr | Adres 16-bit celu skoku w biezacym banku skryptu. |

Porownuje 16-bit [pAddress] z mlodsza polowa, a nastepnie bajt [pAddress+2] z najstarszym bajtem. Obie rowne: ptrAIActionData = pNextAction; w przeciwnym razie przesuniecie o 2 (dlugosc 9). Nie blokuje. Nieuzywane w znanych skryptach US.

RAM: `ptrAIActionData`, `ptrTemp0x72`, `strcVariables.n16Temp1`, `strcVariables.n16Temp2`, `[pAddress]`

## 0x45 — JumpIfBetween16

- Makro: `AICMD0x45_JumpIfBetween16` · handler: `fAIAction0x45_JumpIfBetween16` ($84B72D) · pewność: **confirmed**
- Długość: 10 B · użycie: 219 wywołań w 16 skryptach

Skacze do pNextAction, jesli nMin <= [pAddress] <= nMax (16-bit bez znaku).

| Parametr | Offset | Rozmiar | Typ | Znaczenie |
|---|---|---|---|---|
| `pAddress` | 1 | 3 | ram_ptr | Adres 24-bit slowa 16-bit. |
| `nMin` | 4 | 2 | n16 | Dolna granica, wlacznie (porownanie bez znaku). |
| `nMax` | 6 | 2 | n16 | Gorna granica, wlacznie (handler liczy nMax+1 i testuje wartosc < nMax+1). |
| `pNextAction` | 8 | 2 | script_ptr | Adres 16-bit celu skoku w biezacym banku skryptu. |

Warunek: [addr] >= nMin (BCC pomija) oraz [addr] < nMax+1 (BCS pomija). Spelniony: ptrAIActionData = pNextAction; nie: przesuniecie o 2 (dlugosc 10). Nie blokuje.

RAM: `ptrAIActionData`, `ptrTemp0x72`, `strcVariables.n16Temp1`, `strcVariables.n16Temp2`, `[pAddress]`

> Otwarte pytania: Przy nMax = $FFFF nMax+1 przepelnia sie do 0 i skok nigdy nie zachodzi (edge case).

Przykłady z skryptów:
```
%AICMD0x45_JumpIfBetween16(nLove_Maria, 200, 249, pAIScripting0x01_L035)   ; pAIScripting0x01 @ $B394FB
%AICMD0x45_JumpIfBetween16(nLove_Ann, 200, 249, pAIScripting0x01_L035)   ; pAIScripting0x01 @ $B39505
```

## 0x46 — JumpIfBetween24

- Makro: `AICMD0x46_JumpIfBetween24` · handler: `fAIAction0x46_JumpIfBetween24` ($84B79A) · pewność: **confirmed**
- Długość: 12 B · użycie: 3 wywołań w 3 skryptach

Skacze do pNextAction, jesli nMin <= wartosc24[pAddress] <= nMax.

| Parametr | Offset | Rozmiar | Typ | Znaczenie |
|---|---|---|---|---|
| `pAddress` | 1 | 3 | ram_ptr | Adres 24-bit wartosci 24-bit (np. nMoney). |
| `nMin` | 4 | 3 | n24 | Dolna granica, wlacznie (porownanie 24-bit bez znaku). |
| `nMax` | 7 | 3 | n24 | Gorna granica, wlacznie (handler liczy nMax+1). |
| `pNextAction` | 10 | 2 | script_ptr | Adres 16-bit celu skoku w biezacym banku skryptu. |

Porownanie 24-bit przez CMP (word) + SBC (bank) z propagacja przeniesienia, dla dolnej granicy (BCC = mniejsze) i dla nMax+1 (BCS = wieksze/rowne = brak skoku). Spelniony: ptrAIActionData = pNextAction; inaczej +2 (dlugosc 12). Uzywane z nMoney (np. 0..99, 1000..9999). Nie blokuje.

RAM: `ptrAIActionData`, `ptrTemp0x72`, `strcVariables.n16Temp1`, `strcVariables.n16Temp2`, `strcVariables.n16Temp3`, `strcVariables.n16Temp4`, `[pAddress]`

> Otwarte pytania: Przy nMax = $FFFFFF nMax+1 przepelnia sie (edge case, w skryptach nieuzywane).

Przykłady z skryptów:
```
%AICMD0x46_JumpIfBetween24(nMoney, 0, 99, pAIScripting0x03_L009)   ; pAIScripting0x03 @ $B3BAE7
%AICMD0x46_JumpIfBetween24(nMoney, 0, 199, pAIScripting0x0E_L022)   ; pAIScripting0x0E @ $B3F253
```

## 0x47 — SetValue8

- Makro: `AICMD0x47_SetValue8` · handler: `fAIAction0x47_SetValue8` ($84B84C) · pewność: **confirmed**
- Długość: 5 B · użycie: 78 wywołań w 15 skryptach

Zapisuje bajt n8Value pod adres pAddress.

| Parametr | Offset | Rozmiar | Typ | Znaczenie |
|---|---|---|---|---|
| `pAddress` | 1 | 3 | ram_ptr | Adres 24-bit docelowego bajtu (np. nCurrentSeasonID, $80019A, $800921). |
| `n8Value` | 4 | 1 | n8 | Wartosc zapisywana. |

Wczytuje adres do ptrTemp0x72 (3 bajty), zapisuje 8-bitowo bajt argumentu przez STA [ptrTemp0x72], przesuwa wskaznik o 5. Brak ograniczen/nasycenia. Nie blokuje.

RAM: `ptrAIActionData`, `ptrTemp0x72`, `[pAddress]`

Przykłady z skryptów:
```
%AICMD0x47_SetValue8($800921, 0)   ; pAIScripting0x02 @ $B3B132
%AICMD0x47_SetValue8($800973, 3)   ; pAIScripting0x0A @ $B3E946
```

## 0x48 — SetValue24

- Makro: `AICMD0x48_SetValue24` · handler: `fAIAction0x48` ($84B889) · pewność: **confirmed**
- Długość: 7 B · użycie: 0 wywołań w 0 skryptach

Zapisuje wartosc 24-bit pod 24-bitowy adres (odpowiednik 0x47 SetValue8 dla n24).

| Parametr | Offset | Rozmiar | Typ | Znaczenie |
|---|---|---|---|---|
| `pAddress` | 1 | 3 | ram_ptr | 24-bitowy adres docelowy (little endian, bank w 3. bajcie) |
| `n24Value` | 4 | 3 | n24 | wartosc 24-bitowa zapisywana pod [pAddress]: bajty 0-1 jako word, bajt 2 jako byte pod pAddress+2 |

Handler czyta adres do ptrTemp0x72 (word + bank), nastepnie word wartosci zapisuje przez STA [ptrTemp0x72] (16 bit) i bajt banku wartosci przez STA [ptrTemp0x72],Y z Y=2. Wskaznik ptrAIActionData przesuwa o 1+2+1+2+1 = 7. Nie blokuje, nie zmienia przeplywu. Komenda nie jest uzywana w zadnym skrypcie (US).

RAM: `ptrAIActionData`, `ptrTemp0x72`

> Otwarte pytania: Makro nazywa oba argumenty nUnknown1/nUnknown2 - powinno byc (pAddress, n24Value). Nieuzywana w skryptach, wiec brak potwierdzenia praktycznego.

## 0x49 — SetSpriteTableFacingPlayer

- Makro: `AICMD0x49` · handler: `fAIAction0x49` ($84B8D9) · pewność: **probable**
- Długość: 3 B · użycie: 2 wywołań w 1 skryptach

Ustawia tabele danych sprite obiektu AI i od razu wybiera wpis zgodny z aktualnym kierunkiem gracza (wariant 0x2B z indeksem = strcPlayer.direction).

| Parametr | Offset | Rozmiar | Typ | Znaczenie |
|---|---|---|---|---|
| `pPointerB3` | 1 | 2 | script_ptr | 16-bitowy wskaznik (bank $B3) do tabeli danych sprite/flip indeksowanej kierunkiem; trafia do obiektu AI +0x33 (pDataAddress) |

Zapisuje pPointerB3 do obiektu AI +0x33. Do obiektu +0x02 (nDataIndex) wpisuje mlodszy bajt strcPlayer.direction. Ustawia flagi obiektu +0x01 |= 0x03. Woła fAI_Unknown848895 z ptrTemp0x72 = pDataAddress:B3, co ladowuje z tabeli (3 bajty na wpis, index*3) word do obiektu +0x16 (spriteTableIdx) oraz bajt*64 do +0x14 (flip). Na koncu obiekt +0x10 += 1 (przerwanie wykonywania skryptu do nastepnej klatki). Uzywane w skryptach psa/konia (B3 General) przed 0x2E i petla UpdateDog. Roznica wzgledem 0x2B - indeks pochodzi z kierunku gracza, nie z argumentu.

RAM: `ptrAIActionData`, `ptrAIUnknown0xCC`, `strcPlayer.direction`, `ptrTemp0x72`

Wywołuje: `fAI_Unknown848895`

> Otwarte pytania: Dokladne znaczenie bitow flag +0x01 (0x03) nie jest w pelni ustalone - z fAI_Unknown848286 wynika, ze bit0 = obiekt rysowany/aktywny, bit1/bit2 wybieraja wariant aktualizacji obiektu. Nazwa jest propozycja opisowa.

Przykłady z skryptów:
```
%AICMD0x49(aAIScriptingData_L004)   ; pAIScripting0x00_General @ $B38DB0
%AICMD0x49(aAIScriptingData_L006)   ; pAIScripting0x00_General @ $B38DD1
```

## 0x4A — PickUpObjectOnButtonA

- Makro: `AICMD0x4A` · handler: `fAIAction0x4A` ($84B93C) · pewność: **probable**
- Długość: 1 B · użycie: 3 wywołań w 3 skryptach

Jesli gracz stoi przy obiekcie i nacisnie A (z pustymi rekami), podnosi obiekt - dezaktywuje go i daje graczowi nosony przedmiot id 8.

Przesuwa wskaznik o 1 i sprawdza warunki (kazdy niespelniony - wyjscie z obj+0x10 += 1, czyli oddanie klatki): flaga bliskosci obj+0x0C != 0 (ustawiana przez fGameEngine_DirectionHandler83AD91 gdy gracz jest w promieniu 0x19 px), akcja gracza nie jest USINGTOOL/SHOWTOOL/WHISTLEHORSE/WHISTLEDOG/17, strcPlayer.flags nie ma bitu 0x0004 (EATINGMEAL) ani DOGHUGGING, daily4 bity 0x0006 wyzerowane, strcJoypad1.newInput ma A, strcPlayerData.carryItemId == 0. Gdy wszystko OK - obj+0x00 = 0 (obiekt nieaktywny, skrypt przestaje byc wykonywany), obj+0x01 |= 0x40 (ukryty), obj+0x10 += 1, carryItemId = 8 (makro SetCurrentCarriedItemDirect(!EITEM_TURNIPSEED) - wartosc z przestrzeni carryItemId, nazwa EITEM jest mylaca), akcja gracza = PACTION_ITEMONHAND. W skryptach uzywana w petli '4A; Jump na 4A' (B3 General L038, B4 WaterImp).

RAM: `ptrAIActionData`, `ptrAIUnknown0xCC`, `strcPlayer.action`, `strcPlayer.flags`, `strcFlags.daily4`, `strcJoypad1.newInput`, `strcPlayerData.carryItemId`

> Otwarte pytania: Id przedmiotu 8 w carryItemId nie ma nazwy w CITEM_* (jest tylko CITEM_FISH=7); makro uzywa !EITEM_TURNIPSEED z innej przestrzeni - do poprawy na stala CITEM. Co fizycznie podnosi (skrypty B4 0x12 / WaterImp) nie zostalo ustalone.

Przykłady z skryptów:
```
%AICMD0x4A()   ; pAIScripting0x00_General @ $B38E98
```

## 0x4B — ReplaceMapTile

- Makro: `AICMD0x4B` · handler: `fAIAction0x4B` ($84BA10) · pewność: **probable**
- Długość: 6 B · użycie: 2 wywołań w 1 skryptach

Podmienia kafel w biezacej mapie obiektow (sCurrentObjectMap) na podanych wspolrzednych.

| Parametr | Offset | Rozmiar | Typ | Znaczenie |
|---|---|---|---|---|
| `nTileId` | 1 | 1 | n8 | id kafla wpisywanego do mapy obiektow biezacego obszaru (np. $C3) |
| `nPosX` | 2 | 2 | n16 | pozycja X w pikselach (kafel = 16 px, X>>4) |
| `nPosY` | 4 | 2 | n16 | pozycja Y w pikselach (Y & $FFF0 jako wiersz) |

Handler odklada na stos kafel, X, Y, odtwarza je do A/X/Y i woła fMap_UpdateCurrentTilemap, ktore przez fObjectEngine_ConvertCoordsToOffset liczy offset (zalezny od strcDialogDisplay.mapMultiWidth) i zapisuje bajt do sCurrentObjectMap ($0009B6 + offset). Nie blokuje. Odpowiednik 0x58 ReplaceFarmTile, ale dla mapy biezacej a nie farmy. Uzycie w B4 skrypt 0x14 (po 0x2A, przed 0x3E SetCarryItem).

RAM: `ptrAIActionData`, `sCurrentObjectMap`, `strcDialogDisplay.mapMultiWidth`

Wywołuje: `fMap_UpdateCurrentTilemap`, `fObjectEngine_ConvertCoordsToOffset`

> Otwarte pytania: Dokladna semantyka sCurrentObjectMap (jaka warstwa/mapa) nie sprawdzona; wynik zalezy od mapMultiWidth ustawionego wczesniej (0x58 ustawia go na 4 i nie przywraca).

Przykłady z skryptów:
```
%AICMD0x4B($C3, $0040, $0080)   ; pAIScripting0x14 @ $B48B60
```

## 0x4C — SetPassable

- Makro: `AICMD0x4C` · handler: `fAIAction0x4C` ($84BA51) · pewność: **probable**
- Długość: 1 B · użycie: 3 wywołań w 2 skryptach

Ustawia bit 0x02 w bajcie stanu obiektu AI (+0x00); obiekt przestaje blokowac gracza w detekcji kolizji.

Wykonuje obj+0x00 |= 0x02. W fGameEngine_DirectionHandler83AD91 (kolizja gracza z obiektami AI) obiekt z tym bitem nadal dostaje flage bliskosci +0x0C = 1, ale nie ustawia n16Unk8C (znacznik blokady ruchu), wiec gracz moze przez niego przejsc. Nie blokuje wykonywania skryptu, nie zmienia przeplywu. Uzywana w skryptach kur (B3 General, po 0x2E).

RAM: `ptrAIActionData`, `ptrAIUnknown0xCC`

> Otwarte pytania: Wniosek o 'nieblokujacym' wynika z analizy fragmentu 83AE5B-83AE7F; nie zweryfikowano pozostalych miejsc czytajacych bit 0x02 obj+0x00.

Przykłady z skryptów:
```
%AICMD0x4C()   ; pAIScripting0x00_General @ $B38CD9
```

## 0x4D — JumpIfBlueFeatherUsed

- Makro: `AICMD0x4D_JumpIfBlueFeatherUsed` · handler: `fAIAction0x4D` ($84BA72) · pewność: **confirmed**
- Długość: 3 B · użycie: 133 wywołań w 8 skryptach

Skok warunkowy: jesli gracz jest przy obiekcie i uzyl Niebieskiego Piora (flaga daily3 0x0040), obiekt odwraca sie do gracza i skrypt skacze pod pNextAction.

| Parametr | Offset | Rozmiar | Typ | Znaczenie |
|---|---|---|---|---|
| `pNextAction` | 1 | 2 | script_ptr | adres skoku (ten sam bank co skrypt), wykonywany gdy gracz uzyl Niebieskiego Piora przy obiekcie |

Warunki: obj+0x0C != 0 (gracz w poblizu), strcPlayer.action != USINGTOOL, strcFlags.daily3 & 0x0040 (ustawiana tylko przez fToolUsedAction0x18_BlueFeather, zerowana co klatke w petli AI). Jesli nie spelnione - przesuwa wskaznik o 3 (pomija adres) i kontynuuje bez oddawania klatki. Jesli spelnione - ptrAIActionData = pNextAction; obj+0x08 = obj+0x07, obj+0x03 = obj+0x04 = obj+0x0C = 0; obj+0x02 (kierunek/indeks) = strcPlayer.direction XOR 1 (obrot twarza do gracza); przeladowuje sprite przez fAI_Unknown848895 z tabeli pDataAddress (+0x33, bank B3); obj+0x01 |= 0x14 (zatrzymanie ruchu); obj+0x10 += 1 (oddanie klatki). Uzywana 133 razy, glownie w skryptach NPC (np. B3 skrypt 0x01) przed dialogiem.

RAM: `ptrAIActionData`, `ptrAIUnknown0xCC`, `strcPlayer.action`, `strcPlayer.direction`, `strcFlags.daily3`

Wywołuje: `fAI_Unknown848895`

> Otwarte pytania: Znaczenie bajtow obiektu +0x03/+0x04/+0x07/+0x08 (prawdopodobnie liczniki/kierunek ruchu NPC) nie ustalone.

Przykłady z skryptów:
```
%AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x01_L010)   ; pAIScripting0x01 @ $B393E5
%AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x01_L026)   ; pAIScripting0x01 @ $B394AF
```

## 0x4E — EnableTileInteractions

- Makro: `AICMD0x4E_EnableTileInteractions` · handler: `fAIAction0x4E` ($84BB31) · pewność: **confirmed**
- Długość: 1 B · użycie: 2 wywołań w 2 skryptach

Czysci flage daily2 0x0008 - przywraca interakcje z kaflami wylaczone przez 0x40.

Wykonuje UnsetFlag(daily2, 0x0008). Flaga ta jest ustawiana przez 0x40 DisableTileInteractions i sprawdzana m.in. w fUnknown_82AC61 (bank 82, obsluga obiektow/kafli pod kursorem) oraz w sound.asm. Nie blokuje. Uzywana w B4 na koncu sekwencji (po 0x07 SetPlayerDirection).

RAM: `ptrAIActionData`, `strcFlags.daily2`

Przykłady z skryptów:
```
%AICMD0x4E_EnableTileInteractions()   ; pAIScripting0x26 @ $B4A69D
```

## 0x4F — DisableToolUse

- Makro: `AICMD0x4F_DisableToolUse` · handler: `fAIAction0x4F` ($84BB4B) · pewność: **confirmed**
- Długość: 1 B · użycie: 27 wywołań w 8 skryptach

Ustawia flage daily4 0x8000, ktora blokuje uzycie narzedzia przyciskiem Y.

Wykonuje SetFlag(daily4, 0x8000). Jedyny konsument: fInput_SetPlayerAction0x0A (input.asm, 84CDBF) - gdy flaga ustawiona, nacisniecie Y nie uruchamia akcji USINGTOOL. Nie blokuje. Uzywana 27 razy, zwykle w parze '4F; 50' na poczatku eventow.

RAM: `ptrAIActionData`, `strcFlags.daily4`

> Otwarte pytania: Nie znaleziono miejsca czyszczacego bit 0x8000 daily4 (prawdopodobnie reset dnia/obszaru). Bezposrednio po RTS handlera (84BB65-84BBD9) lezy nieoznaczony, nieosiagalny kod (odlozenie toolEquipped/toolSecond do strcShedItems i wyzerowanie ich) - nie nalezy do komendy 0x4F, brak referencji do niego; osierocona rutyna do osobnej etykiety lub usuniecia.

Przykłady z skryptów:
```
%AICMD0x4F_DisableToolUse()   ; pAIScripting0x0A @ $B3E85B
```

## 0x50 — ReleaseCarried

- Makro: `AICMD0x50` · handler: `fAIAction0x50` ($84BBDA) · pewność: **probable**
- Długość: 1 B · użycie: 66 wywołań w 24 skryptach

Odklada to, co gracz niesie lub przytula (przedmiot, kura, pies) i resetuje sprite gracza do kierunku.

Gdy carryItemId == 0x25 lub 0x26 (kura): pobiera dane kury indeks = nAiArg - 0x24 (fGameEngine_GetChickenData), ustawia chicken.mapID = 0x28, czysci CHICKENSTATUS_HELDBYPLAYER (0x20), wpisuje pozycje z aGameEngine_AddChickenPositionsData[idx*4] (X, +0x10) i [idx*4+2] (Y), zeruje carryItemId. Dla innego niesionego przedmiotu: tylko zeruje carryItemId. Gdy carryItemId == 0 i ustawiona PFLAGS_DOGHUGGING: czysci flage, ustawia nDogAreaId = bajt z $7F1F19, nDogX = 0x0078, nDogY = 0x01A8. We wszystkich galeziach z niesionym przedmiotem lub kura oraz z psem ustawia strcObjectData.spriteIdx = strcPlayer.direction. Brak animacji, bez oddawania klatki. Uzywana 66 razy (poczatek eventow).

RAM: `ptrAIActionData`, `strcPlayerData.carryItemId`, `strcPlayerData.nAiArg`, `strcPlayer.flags`, `strcPlayer.direction`, `strcObjectData.spriteIdx`, `nDogAreaId`, `nDogX`, `nDogY`, `nCurrentSeasonID`, `strcChickenData`

Wywołuje: `fGameEngine_GetChickenData`

> Otwarte pytania: nDogAreaId jest wypelniane bajtem z nCurrentSeasonID ($7F1F19) - albo etykieta RAM jest bledna, albo to rzeczywiscie niezwykle przypisanie; do weryfikacji. Wartosc mapID kury 0x28 przyjeta jako id obszaru kurnika (nie sprawdzone w enumach).

Przykłady z skryptów:
```
%AICMD0x50()   ; pAIScripting0x0A @ $B3E85C
```

## 0x51 — ReleaseCarriedAnimal

- Makro: `AICMD0x51` · handler: `fAIAction0x51` ($84BC9C) · pewność: **probable**
- Długość: 1 B · użycie: 1 wywołań w 1 skryptach

Wariant 0x50: oddaje kure do kurnika, usuwa carry 0x29 i puszcza psa, ale nie rusza innych przedmiotow i nie resetuje sprite'a gracza.

carryItemId 0x25/0x26: ta sama obsluga kury co w 0x50 (mapID 0x28, czysci flage 0x20, pozycja z tabeli, carryItemId = 0). carryItemId == 0x29: tylko zeruje carryItemId. Inny niesiony przedmiot: nic nie robi. carryItemId == 0 i PFLAGS_DOGHUGGING: czysci flage, ustawia nDogAreaId/nDogX/nDogY jak w 0x50. Nie ustawia strcObjectData.spriteIdx. Uzyta raz (B4 A62E, w parze '4F; 51').

RAM: `ptrAIActionData`, `strcPlayerData.carryItemId`, `strcPlayerData.nAiArg`, `strcPlayer.flags`, `nDogAreaId`, `nDogX`, `nDogY`, `nCurrentSeasonID`, `strcChickenData`

Wywołuje: `fGameEngine_GetChickenData`

> Otwarte pytania: Co oznacza carryItemId 0x29 (nie ma w enumach CITEM) i dlaczego jest zerowany bez zmiany sprite'a - nieustalone. Nazwa propozycja.

Przykłady z skryptów:
```
%AICMD0x51()   ; pAIScripting0x26 @ $B4A62E
```

## 0x52 — PickUpObjectForEventA

- Makro: `AICMD0x52` · handler: `fAIAction0x52` ($84BD44) · pewność: **probable**
- Długość: 1 B · użycie: 1 wywołań w 1 skryptach

Jak 0x4A (podniesienie obiektu przyciskiem A przy obiekcie), ale zamiast nadawac przedmiot ustawia flage daily4 0x0002 uruchamiajaca event po animacji podnoszenia.

Te same warunki wejsciowe co w 0x4A z dwiema roznicami: nie sprawdza PACTION_17, wymaga PFLAGS_EATINGMEAL=0, DOGHUGGING=0, carryItemId == 0, daily4 & 0x0006 == 0, nacisniete A, obj+0x0C != 0. Przy spelnieniu: obj+0x00 = 0, obj+0x01 |= 0x40 (obiekt znika), obj+0x10 += 1, daily4 |= 0x0002. Nie ustawia akcji gracza ani carryItemId. Flage odczytuje fPlayerAction0x1A (player_actions.asm 81C0B5): po animacji (sprite 0xF2+kierunek) przy daily4 & 0x0004 == 0 woła AIExecute(arg 0x14, skrypt 0x45, sub 0), czyli uruchamia skrypt AI 0x45 (B5). Uzyta raz (B5 skrypt 0x45 L018).

RAM: `ptrAIActionData`, `ptrAIUnknown0xCC`, `strcPlayer.action`, `strcPlayer.flags`, `strcFlags.daily4`, `strcJoypad1.newInput`, `strcPlayerData.carryItemId`

> Otwarte pytania: Nie ustalono co fizycznie podnosi gracz w skrypcie 0x45 ani kto ustawia akcje 0x1A po tej komendzie. Nazwa propozycja opisowa.

Przykłady z skryptów:
```
%AICMD0x52()   ; pAIScripting0x45 @ $B5A2F9
```

## 0x53 — PickUpObjectForEventB

- Makro: `AICMD0x53` · handler: `fAIAction0x53` ($84BE0D) · pewność: **probable**
- Długość: 1 B · użycie: 1 wywołań w 1 skryptach

Jak 0x52, ale ustawia flage daily4 0x0004 (wybiera drugi wariant eventu po podniesieniu).

Identyczne warunki jak 0x52. Przy spelnieniu: obj+0x00 = 0, obj+0x01 |= 0x40, obj+0x10 += 1, daily4 |= 0x0004. fPlayerAction0x1A przy daily4 & 0x0004 uruchamia AIExecute(arg 0x15, skrypt 0x45, sub 3) zamiast sub 0, po czym czysci daily4 0x0006. Uzyta raz (B5 skrypt 0x45 L061).

RAM: `ptrAIActionData`, `ptrAIUnknown0xCC`, `strcPlayer.action`, `strcPlayer.flags`, `strcFlags.daily4`, `strcJoypad1.newInput`, `strcPlayerData.carryItemId`

> Otwarte pytania: Jak w 0x52 - tresc eventu skryptu 0x45 sub 3 nie przeanalizowana.

Przykłady z skryptów:
```
%AICMD0x53()   ; pAIScripting0x45 @ $B5A578
```

## 0x54 — ShowDialogAutoClose

- Makro: `AICMD0x54_ShowDialog` · handler: `fAIAction0x54_ShowDialog` ($84BED6) · pewność: **probable**
- Długość: 4 B · użycie: 37 wywołań w 3 skryptach

Wyswietla dialog w trybie 6 obslugi wejscia (zamyka sie samoczynnie po zakonczeniu, bez wejscia gracza) - wariant 0x1C/0x1D.

| Parametr | Offset | Rozmiar | Typ | Znaczenie |
|---|---|---|---|---|
| `nDialogId` | 1 | 2 | n16 | indeks dialogu przekazywany w X do fDialog_DialogHandler |
| `nUnknown2` | 3 | 1 | unknown | zapisywany do strcDialogDisplay.dialogUnk191 (w skryptach zawsze $01) |

Identyczny z 0x1C/0x1D poza: strcDialogDisplay.mapUnk19A = 6 (zamiast 2) i dodatkowo zerowanie $09B1 (16 bit). W fInput_Handler tryb 6 (fInput_Handler_case06): po ustawieniu flagi ENDDIALOG zlicza klatki w $09B1 do 0x78 (120), wywoluje fDialog_Unknown_8393F9, ustawia mapUnk19A i maskuje przycisk A - czyli dialog zamyka sie sam po ok. 2 s. Po wywolaniu fDialog_DialogHandler obj+0x10 += 1 (oddanie klatki). Uzywana 37 razy w B5 (sceny/festiwale).

RAM: `ptrAIActionData`, `strcDialogDisplay.dialogUnk191`, `strcDialogDisplay.mapUnk19A`, `strcDialogDisplay.dialogId`, `strcDialogDisplay.dialogFlags`, `$09B1`

Wywołuje: `fDialog_DialogHandler`

> Otwarte pytania: Znaczenie nUnknown2 (dialogUnk191) nadal nieznane - w dialog.asm modyfikowane w kilku miejscach. Nazwa 'AutoClose' wynika z analizy case06 w input.asm; nie potwierdzono w grze.

Przykłady z skryptów:
```
%AICMD0x54_ShowDialog($0290, $00)   ; pAIScripting0x0A @ $B3E941
%AICMD0x54_ShowDialog($0444, $01)   ; pAIScripting0x46 @ $B5A882
```

## 0x55 — JumpIfFlagNotSet

- Makro: `AICMD0x55_JumpIfFlagNotSet` · handler: `fAIAction0x55` ($84BF20) · pewność: **confirmed**
- Długość: 7 B · użycie: 34 wywołań w 3 skryptach

Skacze pod pNextAction, jesli bit nFlagsIndex w slowie pod pAddress NIE jest ustawiony (negacja 0x14 JumpIfFlagSet).

| Parametr | Offset | Rozmiar | Typ | Znaczenie |
|---|---|---|---|---|
| `pAddress` | 1 | 3 | ram_ptr | 24-bitowy adres 16-bitowego slowa flag (np. strcFlags.event6) |
| `nFlagsIndex` | 4 | 1 | flag | numer bitu 0-15 (maska z aAICheckFlags: 1<<n) |
| `pNextAction` | 5 | 2 | script_ptr | adres skoku (ten sam bank co skrypt), gdy bit jest wyzerowany |

Czyta adres do ptrTemp0x72, indeks bitu przez tabele aAICheckFlags (identyczna z aAISetMask uzywana przez 0x14), wykonuje LDA [ptrTemp0x72] AND maska. Jesli wynik != 0 - przesuwa wskaznik o 7 (pomija adres skoku, nastepna komenda); jesli == 0 - ptrAIActionData = pNextAction. Nie blokuje. Uzywana 34 razy (strcFlags.event1/event2/event6/unknown1).

RAM: `ptrAIActionData`, `ptrTemp0x72`, `strcVariables.n16Temp1`

Przykłady z skryptów:
```
%AICMD0x55_JumpIfFlagNotSet(strcFlags.unknown1, $00, pAIScripting0x0B_L033)   ; pAIScripting0x0B @ $B3EB06
%AICMD0x55_JumpIfFlagNotSet(strcFlags.unknown1, $01, pAIScripting0x0B_L033)   ; pAIScripting0x0B @ $B3EB0D
```

## 0x56 — UseEquippedItem

- Makro: `AICMD0x56_UseEquippedItem` · handler: `fAIAction0x56_UseEquippedItem` ($84BF81) · pewność: **confirmed**
- Długość: 1 B · użycie: 99 wywołań w 5 skryptach

Jesli gracz ma wyposazone narzedzie, uruchamia jego uzycie (animacja i efekt), tak jak po nacisnieciu Y.

Gdy strcPlayerData.toolEquipped != 0: akcja gracza = PACTION_USINGTOOL i JSL fToolUsedAnimationHandler. Handler animacji sprawdza PFLAGS_OUTOFSTAMINA (jesli tak - sprite 0x4D i PACTION_TIRED), w przeciwnym razie przez aToolUsedAnimationTable wywoluje rutyne dla biezacego narzedzia. Gdy brak narzedzia nic nie robi. Nie oddaje klatki. Uzywana 99 razy (sceny z uzyciem narzedzia, np. podlewanie, kopanie).

RAM: `ptrAIActionData`, `strcPlayerData.toolEquipped`, `strcPlayer.action`, `strcPlayerData.unkCounter91B`

Wywołuje: `fToolUsedAnimationHandler`

Przykłady z skryptów:
```
%AICMD0x56_UseEquippedItem()   ; pAIScripting0x34 @ $B4CF69
```

## 0x57 — UpdateStamina

- Makro: `AICMD0x57_UpdateStamina` · handler: `fAIAction0x57_UpdateStamina` ($84BFA0) · pewność: **confirmed**
- Długość: 2 B · użycie: 16 wywołań w 2 skryptach

Zmienia energie gracza o podana wartosc ze znakiem przez fPlayerEnergyHandler.

| Parametr | Offset | Rozmiar | Typ | Znaczenie |
|---|---|---|---|---|
| `nStamina` | 1 | 1 | n8 | wartosc ze znakiem (int8) dodawana do aktualnej energii gracza; ujemna zmniejsza, w skryptach uzywane dodatnie 20 i 30 |

Wartosc trafia w A do fPlayerEnergyHandler (sign-extended). Procedura: pomijana, gdy daily4 & 0x0008; energy ($918) += wartosc; <= 0 - energy = 0, PFLAGS_OUTOFSTAMINA, sprite 0x4D, PACTION_TIRED; >= stamina ($917, maksimum) - energy = stamina i czyszczenie OUTOFSTAMINA; w przeciwnym razie zwykle dodanie. Aktualizuje tez $096C (liczba/ikona paska energii). Nie blokuje.

RAM: `ptrAIActionData`, `strcPlayerData.energy`, `strcPlayerData.stamina`, `strcPlayer.flags`, `strcPlayer.action`, `strcObjectData.spriteIdx`, `strcFlags.daily4`

Wywołuje: `fPlayerEnergyHandler`

Przykłady z skryptów:
```
%AICMD0x57_UpdateStamina(20)   ; pAIScripting0x27 @ $B4B813
%AICMD0x57_UpdateStamina(30)   ; pAIScripting0x43 @ $B5847E
```

## 0x58 — ReplaceFarmTile

- Makro: `AICMD0x58_ReplaceFarmTile` · handler: `fAIAction0x58_ReplaceFarmTile` ($84BFBF) · pewność: **confirmed**
- Długość: 6 B · użycie: 545 wywołań w 1 skryptach

Podmienia kafel w sFarmTilemap ($7EA4E6) na podanych wspolrzednych.

| Parametr | Offset | Rozmiar | Typ | Znaczenie |
|---|---|---|---|---|
| `nTileId` | 1 | 1 | n8 | id kafla wpisywanego do mapy farmy |
| `nPosX` | 2 | 2 | n16 | pozycja X w pikselach (X>>4 = kolumna kafla) |
| `nPosY` | 4 | 2 | n16 | pozycja Y w pikselach (Y & $FFF0 = wiersz) |

Odklada argumenty na stos i odtwarza jako A/X/Y, woła fMap_UpdateFarmTilemapCoords: ustawia strcDialogDisplay.mapMultiWidth = 4, liczy offset przez fObjectEngine_ConvertCoordsToOffset i zapisuje kafel do sFarmTilemap,X. Nie blokuje. Uzywana 545 razy (sekwencje budowy/zmiany farmy, B5). Efekt uboczny: mapMultiWidth zostaje 4.

RAM: `ptrAIActionData`, `sFarmTilemap`, `strcDialogDisplay.mapMultiWidth`

Wywołuje: `fMap_UpdateFarmTilemapCoords`, `fObjectEngine_ConvertCoordsToOffset`

Przykłady z skryptów:
```
%AICMD0x58_ReplaceFarmTile($02, 448, 528)   ; pAIScripting0x47_HowToPlay @ $B5B050
%AICMD0x58_ReplaceFarmTile($02, 464, 528)   ; pAIScripting0x47_HowToPlay @ $B5B056
```

## 0x59 — SwapEquippedItems

- Makro: `AICMD0x59_SwapEquippedItems` · handler: `fAIAction0x59_SwapEquippedItems` ($84C000) · pewność: **confirmed**
- Długość: 1 B · użycie: 9 wywołań w 1 skryptach

Ustawia akcje gracza PACTION_SWAPTOOL - zamiana narzedzia biezacego z drugim.

Przesuwa wskaznik o 1 i ustawia strcPlayer.action = PACTION_SWAPTOOL (0x1C). fPlayerAction0x1C (81C061) po zakonczeniu animacji (PFLAGS_ANIMATING) zamienia toolEquipped <-> toolSecond, wola fToolUsedSound_Unknown828FF3 i wraca do PACTION_NONE. Nie oddaje klatki w samej komendzie, efekt dzieje sie w kolejnych klatkach akcji gracza.

RAM: `ptrAIActionData`, `strcPlayer.action`, `strcPlayerData.toolEquipped`, `strcPlayerData.toolSecond`

Przykłady z skryptów:
```
%AICMD0x59_SwapEquippedItems()   ; pAIScripting0x47_HowToPlay @ $B5ADF1
```

