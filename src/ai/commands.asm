; AI command 0x00 - Ustawia zadany utwor muzyczny w strcAudio.trackId. [confirmed]
macro AICMD0x00_SetMusic(nMusicTrackId, nUnused)
    db $00
    db <nMusicTrackId>
    db <nUnused>
    
endmacro

; AI command 0x01 - Wznawia uplyw czasu w grze (nTimeState = 1). [confirmed]
macro AICMD0x01_UnfreezeTime()
    db $01
    
endmacro

; AI command 0x02 - Zatrzymuje uplyw czasu w grze (nTimeState = 0). [confirmed]
macro AICMD0x02_FreezeTime()
    db $02
    
endmacro

; AI command 0x03 - Ustawia nCurrentTimeID na podana wartosc. [probable]
macro AICMD0x03_SetHour(nCurrentTimeId)
    db $03
    db <nCurrentTimeId>
    
endmacro

; AI command 0x04 - Pusta komenda (NOP) - tylko przesuwa wskaznik o 1 bajt. [confirmed]
macro AICMD0x04_Nop()
    db $04
    
endmacro

; AI command 0x05 - Ustawia pozycje gracza i pozycje docelowa transferu mapy na (X, Y). [confirmed]
macro AICMD0x05_SetTransferPosition(nDestinationX, nDestinationY)
    db $05
    dw <nDestinationX>
    dw <nDestinationY>
    
endmacro

; AI command 0x06 - Ustawia docelowy obszar (mape), a skrypt oddaje sterowanie na 1 klatke. [confirmed]
macro AICMD0x06_SetDestinationArea(nAreaId)
    db $06
    db <nAreaId>
    
endmacro

; AI command 0x07 - Ustawia kierunek patrzenia gracza. [confirmed]
macro AICMD0x07_SetPlayerDirection(nPlayerDirection)
    db $07
    db <nPlayerDirection>
    
endmacro

; AI command 0x08 - Odbiera graczowi sterowanie (kasuje PFLAGS_USERCONTROL) i zeruje wejscie sterowane przez AI. [confirmed]
macro AICMD0x08_EnableAIControl()
    db $08
    
endmacro

; AI command 0x09 - Uruchamia rownolegly skrypt w innym slocie (nDataIndex), zaczynajacy sie od pNextAction; biezacy skrypt idzie dalej. [confirmed]
macro AICMD0x09_StartScript(nDataIndex, pNextAction)
    db $09
    db <nDataIndex>
    dw <pNextAction>&$FFFF
endmacro

; AI command 0x0A - Plynnie rozjasnia ekran (fade-in) od jasnosci 3 do 15; blokuje do konca. [confirmed]
macro AICMD0x0A_ScreenFadein(nUnused)
    db $0A
    db <nUnused>
    
endmacro

; AI command 0x0B - Ustawia bit nFlagBit w globalnym polu flag skryptow $7F:1F7A (synchronizacja miedzy slotami). [confirmed]
macro AICMD0x0B_SetScriptFlag(nFlagBit)
    db $0B
    db <nFlagBit>
    
endmacro

; AI command 0x0C - Czeka (klatka po klatce) az bit nFlagBit w $7F:1F7A bedzie ustawiony, po czym idzie dalej. [confirmed]
macro AICMD0x0C_WaitForScriptFlag(nFlagBit)
    db $0C
    db <nFlagBit>
    
endmacro

; AI command 0x0D - Ustawia wektor ruchu obiektu skryptu (dx, dy) oraz tempo i czas, i czeka na jego zakonczenie. [probable]
macro AICMD0x0D(nUnknown1, nUnknown2, nUnknown3, nUnknown4)
    db $0D
    db <nUnknown1>
    db <nUnknown2>
    db <nUnknown3>
    db <nUnknown4>
    
endmacro

; AI command 0x0E - Wola fAudioUnknown_838401: jesli zadany trackId rozni sie od odtwarzanego, wysyla do APU komende przejscia utworu. [probable]
macro AICMD0x0E(nUnknown1)
    db $0E
    db <nUnknown1>
    
endmacro

; AI command 0x0F - Plynnie sciemnia ekran (fade-out) od jasnosci 15 do 0; blokuje do konca. [confirmed]
macro AICMD0x0F_ScreenFadeout(nUnused)
    db $0F
    db <nUnused>
    
endmacro

; AI command 0x10 - Konczy skrypt biezacego slotu (slot nieaktywny) bez przesuwania wskaznika. [confirmed]
macro AICMD0x10_End()
    db $10
    
endmacro

; AI command 0x11 - Oddaje graczowi sterowanie (ustawia PFLAGS_USERCONTROL). [confirmed]
macro AICMD0x11_EnableUserControl()
    db $11
    
endmacro

; AI command 0x12 - Bezwarunkowy skok do komendy pNextAction w biezacym banku skryptu. [confirmed]
macro AICMD0x12_Jump(pNextAction)
    db $12
    dw <pNextAction>&$FFFF
endmacro

; AI command 0x13 - Wstrzymuje wykonywanie skryptu danego obiektu AI na nTime klatek. [confirmed]
macro AICMD0x13_Wait(nTime)
    db $13
    dw <nTime>
    
endmacro

; AI command 0x14 - Skok do pNextAction jesli bit nIndex w 16-bitowym slowie pod nAddress jest ustawiony. [confirmed]
macro AICMD0x14_JumpIfFlagSet(nAddress, nIndex, pNextAction)
    db $14
    dl <nAddress>
    db <nIndex>
    dw <pNextAction>&$FFFF
endmacro

; AI command 0x15 - Skok do pNextAction jesli bajt pod nAddress jest rowny nValue. [confirmed]
macro AICMD0x15_JumpIfEquals8(nAddress, nValue, pNextAction)
    db $15
    dl <nAddress>
    db <nValue>
    dw <pNextAction>&$FFFF
endmacro

; AI command 0x16 - Skok do pNextAction jesli nMin <= [nAddress] <= nMax (porownanie 8-bit bez znaku). [confirmed]
macro AICMD0x16_JumpIfBetween8(nAddress, nMin, nMax, pNextAction)
    db $16
    dl <nAddress>
    db <nMin>
    db <nMax>
    dw <pNextAction>&$FFFF
endmacro

; AI command 0x17 - Losuje liczbe 0..nMax-1 i zapisuje ja w polu +$0D biezacego obiektu AI. [confirmed]
macro AICMD0x17_RollRandom(nMax)
    db $17
    db <nMax>
    
endmacro

; AI command 0x18 - Skok do pNextAction jesli ostatnio wylosowana (0x17) wartosc obiektu rowna sie nValue. [confirmed]
macro AICMD0x18_JumpIfRandomEquals(nValue, pNextAction)
    db $18
    db <nValue>
    dw <pNextAction>&$FFFF
endmacro

; AI command 0x19 - Wymusza konkretny sprite i odbicie dla gracza oraz ustawia flage PFLAGS_KNEEING. [probable]
macro AICMD0x19(nUnknown1, nUnknown2)
    db $19
    dw <nUnknown1>
    db <nUnknown2>
    
endmacro

; AI command 0x1A - Tworzy/umieszcza obiekt NPC w danej pozycji z tabela sprite'ow i kierunkiem poczatkowym. [probable]
macro AICMD0x1A(nUnknown1, nUnknown2, pPointerB3, nUnknown4)
    db $1A
    dw <nUnknown1>
    dw <nUnknown2>
    dw <pPointerB3>&$FFFF
    db <nUnknown4>
    
endmacro

; AI command 0x1B - Ustawia bezposrednio sprite i odbicie biezacego obiektu AI (NPC) i zleca odswiezenie sprite'a. [probable]
macro AICMD0x1B(nUnknown1, nUnknown2)
    db $1B
    dw <nUnknown1>
    db <nUnknown2>
    
endmacro

; AI command 0x1C - Wyswietla dialog nDialogId i wstrzymuje skrypt na jedna klatke (petla AI jest dalej pomijana na czas dialogu). [confirmed]
macro AICMD0x1C_ShowDialog(nDialogId, nPosition)
    db $1C
    dw <nDialogId>
    db <nPosition>
    
endmacro

; AI command 0x1D - Funkcjonalnie identyczny z 0x1C (ShowDialog); w skryptach uzywany dla dialogow z wyborem opcji, po ktorych idzie seria 0x20. [confirmed]
macro AICMD0x1D_ShowDialog(nDialogId, nPosition)
    db $1D
    dw <nDialogId>
    db <nPosition>
    
endmacro

; AI command 0x1E - Alias 0x1F - wpis 0x1E w tablicy aAIActions wskazuje na ten sam handler fAIAction0x1F; nie wystepuje w zadnym skrypcie. [probable]
macro AICMD0x1E(pNextAction)
    db $1E
    dw <pNextAction>&$FFFF
endmacro

; AI command 0x1F - Sprawdza czy gracz stoi przy NPC i nacisnal A; jesli tak - obraca NPC do gracza, blokuje gracza interakcja i skacze do pNextAction, w przeciwnym razie czeka klatke i idzie dalej. [probable]
macro AICMD0x1F(pNextAction)
    db $1F
    dw <pNextAction>&$FFFF
endmacro

; AI command 0x20 - Skok do pNextAction jesli gracz wybral w ostatnim dialogu opcje nAnswer. [confirmed]
macro AICMD0x20_JumpIfChoice(nAnswer, pNextAction)
    db $20
    db <nAnswer>
    dw <pNextAction>&$FFFF
endmacro

; AI command 0x21 - Dodaje (ze znakiem) n8Value do bajtu pod pAddress z nasyceniem do zakresu 0..255. [confirmed]
macro AICMD0x21_AddValue8(pAddress, n8Value)
    db $21
    dl <pAddress>
    db <n8Value>
    
endmacro

; AI command 0x22 - Wlacza dla biezacego NPC losowe wedrowanie po prostokatnym obszarze wokol jego aktualnej pozycji. [probable]
macro AICMD0x22(nUnknown1, nUnknown2, nUnknown3, pNextAction, nUnknown5)
    db $22
    db <nUnknown1>
    db <nUnknown2>
    db <nUnknown3>
    dw <pNextAction>&$FFFF
    db <nUnknown5>
    
endmacro

; AI command 0x23 - Ustawia bit nIndex w 16-bitowym slowie pod nAddress (OR z aAISetMask[nIndex]). [confirmed]
macro AICMD0x23_OrWithIndexedValue(nAddress, nIndex)
    db $23
    dl <nAddress>
    db <nIndex>
    
endmacro

; AI command 0x24 - Ustawia docelowa palete kolorow (plynne przejscie) na zestaw o zadanym indeksie, chyba ze jest juz wieczor. [confirmed]
macro AICMD0x24_NextHourPalette(nNextHourPalette)
    db $24
    db <nNextHourPalette>
    
endmacro

; AI command 0x25 - Dezaktywuje slot AI o zadanym numerze i usuwa jego obiekt gry (sprite) z mapy. [confirmed]
macro AICMD0x25_RemoveActor(nActorIndex)
    db $25
    db <nActorIndex>
    
endmacro

; AI command 0x26 - Alias opkodu 0x28 (kasowanie bitu) - w tablicy aAIActions wpis 0x26 wskazuje na fAIAction0x28. [confirmed]
macro AICMD0x26_ClearBitAs0x28(pAddress, nBitIndex)
    db $28
    dl <pAddress>
    db <nBitIndex>
    
endmacro

; AI command 0x27 - Alias opkodu 0x28 (kasowanie bitu) - w tablicy aAIActions wpis 0x27 wskazuje na fAIAction0x28. [confirmed]
macro AICMD0x27_ClearBitAs0x28(pAddress, nBitIndex)
    db $28
    dl <pAddress>
    db <nBitIndex>
    
endmacro

; AI command 0x28 - Kasuje jeden bit (0-15) w 16-bitowym slowie pod podanym adresem RAM. [confirmed]
macro AICMD0x28_ClearBit(pAddress, nBitIndex)
    db $28
    dl <pAddress>
    db <nBitIndex>
    
endmacro

; AI command 0x29 - Uruchamia automatyczne przewijanie kamery o zadanej predkosci X/Y przez zadana liczbe klatek. [confirmed]
macro AICMD0x29_SetMapScrooling(nMapSpeedX, nMapSpeedY, nMapTimer)
    db $29
    dw <nMapSpeedX>
    dw <nMapSpeedY>
    db <nMapTimer>
    
endmacro

; AI command 0x2A - Uruchamia sekwencje zmian kafelkow mapy (wskaznik ptrUnknown0xCF) i konczy bieżaca klatke skryptu. [probable]
macro AICMD0x2A(nUnknown1)
    db $2A
    dw <nUnknown1>
    
endmacro

; AI command 0x2B - Ustawia wyglad (tabela sprite'ow z banku $B3 i kierunek) biezacego slotu AI i oznacza go do utworzenia obiektu gry. [probable]
macro AICMD0x2B(pPointerB3, nDataIndex)
    db $2B
    dw <pPointerB3>&$FFFF
    db <nDataIndex>
    
endmacro

; AI command 0x2C - Odtwarza efekt dzwiekowy (rejestry audio 114/115), czeka podana liczbe klatek i przywraca dzwiek narzedzia. [probable]
macro AICMD0x2C(nUnknown1, nUnknown2, nUnknown3)
    db $2C
    db <nUnknown1>
    dw <nUnknown2>
    dw <nUnknown3>
    
endmacro

; AI command 0x2D - Jednoklatkowy test interakcji: jesli gracz nacisnal A przy tej postaci, skacze do jednego z dwoch adresow, w przeciwnym razie przechodzi do nastepnej komendy. [confirmed]
macro AICMD0x2D_JumpOnInteract(pNextAction1, pNextAction2)
    db $2D
    dw <pNextAction1>&$FFFF
    dw <pNextAction2>&$FFFF
endmacro

; AI command 0x2E - Wlacza dla biezacego slotu AI losowe bladzenie (zwierzeta/NPC) wokol aktualnej pozycji, ktora staje sie punktem domowym. [probable]
macro AICMD0x2E(nUnknown1, pPointerB3, nUnknown3)
    db $2E
    db <nUnknown1>
    dw <pPointerB3>&$FFFF
    db <nUnknown3>
    
endmacro

; AI command 0x2F - Zmienia tabele sprite'ow (animacje) biezacego slotu AI, zachowujac aktualny kierunek, i oznacza sprite do odswiezenia. [probable]
macro AICMD0x2F(pPointerB3)
    db $2F
    dw <pPointerB3>&$FFFF
endmacro

; AI command 0x30 - Jeden tick logiki kury/kurczaka: synchronizuje pozycje ze struktura kury, obsluguje podniesienie przez gracza i losowe zachowania. [probable]
macro AICMD0x30_UpdateChicken()
    db $30
    
endmacro

; AI command 0x31 - Jeden tick logiki krowy: synchronizuje pozycje ze struktura krowy, obsluguje karmienie, dojenie, podnoszenie i dialogi. [probable]
macro AICMD0x31_UpdateCow()
    db $31
    
endmacro

; AI command 0x32 - Zapisuje stala 16-bitowa pod dowolny adres RAM (odpowiednik 0x47 SetValue8 dla slowa). [confirmed]
macro AICMD0x32_SetValue16(pAddress, nValue)
    db $32
    dl <pAddress>
    dw <nValue>
    
endmacro

; AI command 0x33 - Jeden tick logiki kreta: umozliwia podniesienie go przez gracza, a w przeciwnym razie okresowo losowo uruchamia podskrypt jego pojawienia sie. [probable]
macro AICMD0x33()
    db $33
    
endmacro

; AI command 0x34 - Jeden tick prostego aktora-przedmiotu: po nacisnieciu A gracz bez przedmiotu podnosi go (carryItemId = 7) i aktor znika. [probable]
macro AICMD0x34()
    db $34
    
endmacro

; AI command 0x35 - Jeden tick logiki konia: okresowe losowe zachowania zrebaka lub dorosłego konia, dosiadanie, podazanie za graczem. [probable]
macro AICMD0x35_UpdateHorse()
    db $35
    
endmacro

; AI command 0x36 - Jeden tick logiki psa: kopiuje pozycje slotu AI do nDogX/nDogY, obsluguje przytulenie/podniesienie psa, losowe zachowania w bezruchu i bieg do gracza po gwizdnieciu. [probable]
macro AICMD0x36_UpdateDog()
    db $36
    
endmacro

; AI command 0x37 - Usuwa/dezaktywuje obiekt gry powiazany ze slotem AI (indeks z pola +0x12 slotu). [probable]
macro AICMD0x37()
    db $37
    
endmacro

; AI command 0x38 - Blokuje skrypt do chwili, gdy ustawiona jest flaga daily1 $8000 (ekran w pelni rozjasniony po fade-in). [confirmed]
macro AICMD0x38_WaitForFadeIn()
    db $38
    
endmacro

; AI command 0x39 - Symuluje wcisniecie kierunku (pad) na zadana liczbe klatek i czeka az minie; gracz idzie. [confirmed]
macro AICMD0x39_WalkForTime(nInputIndex, nAmount)
    db $39
    db <nInputIndex>
    dw <nAmount>
    
endmacro

; AI command 0x3A - Jak 0x39, ale dodatkowo wciska B (bieg). [confirmed]
macro AICMD0x3A_RunForTime(nInputIndex, nAmount)
    db $3A
    db <nInputIndex>
    dw <nAmount>
    
endmacro

; AI command 0x3B - Ustawia przenoszony przedmiot i flage PFLAGS_HOLDINGITEM (gracz niesie przedmiot bez animacji podnoszenia). [probable]
macro AICMD0x3B(nUnknown1)
    db $3B
    db <nUnknown1>
    
endmacro

; AI command 0x3C - Teleportuje gracza do domu (nDestinationAreaId=$15=AREA_HOUSE1) z flaga wymuszonego teleportu i ustawia flage daily4 $0020. [probable]
macro AICMD0x3C()
    db $3C
    
endmacro

; AI command 0x3D - Ustawia docelowy obszar i wymusza teleport (AFLAGS_FORCETELEPORT). [confirmed]
macro AICMD0x3D_TeleportToArea(nAreaId)
    db $3D
    db <nAreaId>
    
endmacro

; AI command 0x3E - Ustawia przenoszony przedmiot i uruchamia akcje gracza PACTION_ITEMONHAND (pozowanie/podniesienie przedmiotu). [probable]
macro AICMD0x3E_SetCarryItem(nCarryItemId)
    db $3E
    db <nCarryItemId>
    
endmacro

; AI command 0x3F - Ustawia akcje gracza PACTION_DROPITEM (rzut/odlozenie noszonego przedmiotu). [confirmed]
macro AICMD0x3F_ThrowCarriedItem()
    db $3F
    
endmacro

; AI command 0x40 - Ustawia flage strcFlags.daily2 $0008, ktora wylacza sprawdzanie obiektu/kafla pod graczem. [probable]
macro AICMD0x40_DisableTileInteractions()
    db $40
    
endmacro

; AI command 0x41 - Dodaje n16Value do slowa pod pAddress z nasyceniem do zakresu 0..999. [confirmed]
macro AICMD0x41_AddValue16(pAddress, n16Value)
    db $41
    dl <pAddress>
    dw <n16Value>
    
endmacro

; AI command 0x42 - Dodaje n24Value do nMoney ($7F1F04) przez fGameEngine_AddProfit; przy ujemnym wyniku zeruje pieniadze. [confirmed]
macro AICMD0x42_AddValue24(pAddress, n24Value)
    db $42
    dl <pAddress>
    dl <n24Value>
    
endmacro

; AI command 0x43 - Skacze do pNextAction, jesli slowo 16-bit pod pAddress rowna sie n16Value. [confirmed]
macro AICMD0x43_JumpIfEqual16(pAddress, n16Value, pNextAction)
    db $43
    dl <pAddress>
    dw <n16Value>
    dw <pNextAction>&$FFFF
endmacro

; AI command 0x44 - Skacze do pNextAction, jesli 24-bitowa wartosc pod pAddress rowna sie n24Value. [confirmed]
macro AICMD0x44_JumpIfEqual24(pAddress, n24Value, pNextAction)
    db $44
    dl <pAddress>
    dl <n24Value>
    dw <pNextAction>&$FFFF
endmacro

; AI command 0x45 - Skacze do pNextAction, jesli nMin <= [pAddress] <= nMax (16-bit bez znaku). [confirmed]
macro AICMD0x45_JumpIfBetween16(pAddress, nMin, nMax, pNextAction)
    db $45
    dl <pAddress>
    dw <nMin>
    dw <nMax>
    dw <pNextAction>&$FFFF
endmacro

; AI command 0x46 - Skacze do pNextAction, jesli nMin <= wartosc24[pAddress] <= nMax. [confirmed]
macro AICMD0x46_JumpIfBetween24(pAddress, nMin, nMax, pNextAction)
    db $46
    dl <pAddress>
    dl <nMin>
    dl <nMax>
    dw <pNextAction>&$FFFF
endmacro

; AI command 0x47 - Zapisuje bajt n8Value pod adres pAddress. [confirmed]
macro AICMD0x47_SetValue8(pAddress, n8Value)
    db $47
    dl <pAddress>
    db <n8Value>
    
endmacro

; AI command 0x48 - Zapisuje wartosc 24-bit pod 24-bitowy adres (odpowiednik 0x47 SetValue8 dla n24). [confirmed]
macro AICMD0x48_SetValue24(pAddress, n24Value)
    db $48
    dl <pAddress>
    dl <n24Value>
    
endmacro

; AI command 0x49 - Ustawia tabele danych sprite obiektu AI i od razu wybiera wpis zgodny z aktualnym kierunkiem gracza (wariant 0x2B z indeksem = strcPlayer.direction). [probable]
macro AICMD0x49(pPointerB3)
    db $49
    dw <pPointerB3>&$FFFF
endmacro

; AI command 0x4A - Jesli gracz stoi przy obiekcie i nacisnie A (z pustymi rekami), podnosi obiekt - dezaktywuje go i daje graczowi nosony przedmiot id 8. [probable]
macro AICMD0x4A()
    db $4A
    
endmacro

; AI command 0x4B - Podmienia kafel w biezacej mapie obiektow (sCurrentObjectMap) na podanych wspolrzednych. [probable]
macro AICMD0x4B(nArg1, nArg2, nArg3)
    db $4B
    db <nArg1>
    dw <nArg2>
    dw <nArg3>
    
endmacro

; AI command 0x4C - Ustawia bit 0x02 w bajcie stanu obiektu AI (+0x00); obiekt przestaje blokowac gracza w detekcji kolizji. [probable]
macro AICMD0x4C()
    db $4C
    
endmacro

; AI command 0x4D - Skok warunkowy: jesli gracz jest przy obiekcie i uzyl Niebieskiego Piora (flaga daily3 0x0040), obiekt odwraca sie do gracza i skrypt skacze pod pNextAction. [confirmed]
macro AICMD0x4D_JumpIfBlueFeatherUsed(pNextAction)
    db $4D
    dw <pNextAction>&$FFFF
endmacro

; AI command 0x4E - Czysci flage daily2 0x0008 - przywraca interakcje z kaflami wylaczone przez 0x40. [confirmed]
macro AICMD0x4E_EnableTileInteractions()
    db $4E
    
endmacro

; AI command 0x4F - Ustawia flage daily4 0x8000, ktora blokuje uzycie narzedzia przyciskiem Y. [confirmed]
macro AICMD0x4F_DisableToolUse()
    db $4F
    
endmacro

; AI command 0x50 - Odklada to, co gracz niesie lub przytula (przedmiot, kura, pies) i resetuje sprite gracza do kierunku. [probable]
macro AICMD0x50()
    db $50
    
endmacro

; AI command 0x51 - Wariant 0x50: oddaje kure do kurnika, usuwa carry 0x29 i puszcza psa, ale nie rusza innych przedmiotow i nie resetuje sprite'a gracza. [probable]
macro AICMD0x51()
    db $51
    
endmacro

; AI command 0x52 - Jak 0x4A (podniesienie obiektu przyciskiem A przy obiekcie), ale zamiast nadawac przedmiot ustawia flage daily4 0x0002 uruchamiajaca event po animacji podnoszenia. [probable]
macro AICMD0x52()
    db $52
    
endmacro

; AI command 0x53 - Jak 0x52, ale ustawia flage daily4 0x0004 (wybiera drugi wariant eventu po podniesieniu). [probable]
macro AICMD0x53()
    db $53
    
endmacro

; AI command 0x54 - Wyswietla dialog w trybie 6 obslugi wejscia (zamyka sie samoczynnie po zakonczeniu, bez wejscia gracza) - wariant 0x1C/0x1D. [probable]
macro AICMD0x54_ShowDialog(nDialogId, nUnknown2)
    db $54
    dw <nDialogId>
    db <nUnknown2>
    
endmacro

; AI command 0x55 - Skacze pod pNextAction, jesli bit nFlagsIndex w slowie pod pAddress NIE jest ustawiony (negacja 0x14 JumpIfFlagSet). [confirmed]
macro AICMD0x55_JumpIfFlagNotSet(pAddress, nFlagsIndex, pNextAction)
    db $55
    dl <pAddress>
    db <nFlagsIndex>
    dw <pNextAction>&$FFFF
endmacro

; AI command 0x56 - Jesli gracz ma wyposazone narzedzie, uruchamia jego uzycie (animacja i efekt), tak jak po nacisnieciu Y. [confirmed]
macro AICMD0x56_UseEquippedItem()
    db $56
    
endmacro

; AI command 0x57 - Zmienia energie gracza o podana wartosc ze znakiem przez fPlayerEnergyHandler. [confirmed]
macro AICMD0x57_UpdateStamina(nStamina)
    db $57
    db <nStamina>
    
endmacro

; AI command 0x58 - Podmienia kafel w sFarmTilemap ($7EA4E6) na podanych wspolrzednych. [confirmed]
macro AICMD0x58_ReplaceFarmTile(nTileId, nPosX, nPosY)
    db $58
    db <nTileId>
    dw <nPosX>
    dw <nPosY>
    
endmacro

; AI command 0x59 - Ustawia akcje gracza PACTION_SWAPTOOL - zamiana narzedzia biezacego z drugim. [confirmed]
macro AICMD0x59_SwapEquippedItems()
    db $59
    
endmacro