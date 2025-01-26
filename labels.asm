    ptrCurrentDialog = $000001; !^ ptr24 ^!
    ptrPaletteNext = $000004; !^ ptr24 ^!
    ptrUnknown0x07 = $000007; !^ ptr24 ^!
    ptrAudioData = $00000A; !^ ptr24 ^!
    ptrUnknown0x42 = $000042; !^ 16 * ptr24 ^!
    ptrUnknown0x72 = $000072; !^ ptr24 ^!
    ptrUnknown0x75 = $000075; !^ ptr24 ^!
    ptrObjectData = $000078; !^ ptr24 ^!
    ptrAIActionData = $0000C9; !^ ptr24 ^!
    ptrAIUnknown0xCC = $0000CC; !^ prt24 ^!
    ptrUnknown0xCF = $0000CF; !^ ptr24 ^!
    nPaletteCountdown = $00017A; !^ n8 ^!
    nPaletteNextIndex = $00017B; !^ n8 ^!
    nPaletteNextHourIndex = $00017C; !^ n8 ^!
    nMapEngine_DestinationX = $00017D; !^ n16 (used when we change map) ^!
    nMapEngine_DestinationY = $00017F; !^ n16 (used when we change map) ^!
    nCurrentMapdata_RoomWidthMult = $000181; !^ n8 (offset 0x03) ^!
    nCurrentMapdata_RoomHeightMult = $000182; !^ n8 (offset 0x04) ^!
    nCurrentDialogPointerIndex = $000183; !^ n16, ptrDialog index ^!
    nCurrentTextIndex = $000187; !^ n16, ptrCurrentDialog index (to get one letter) ^!
    nSelectedDialogOption = $00018F; !^ n8 ^!
    nCurrentMapdataPresetId = $000195; !^ n8 (offset 0x00) ^!
    nMapEngine_flags = $000196; !^ n16 (offset 0x01) ^!
    nMapEngine_flags_TempCopy = $000198; !^ n16 ^!
    nBreakHitCounter = $00096D; !^ n8 (used for example to break wood or stones) ^!
    nPlayerInteractionIndex = $00096E; !^ n8 ^!
    nPlayerInteractionArg1 = $00096F; !^ n8 ^!
    nPlayerInteractionArg2 = $000970; !^ n8 ^!
    nTimeState = $000973; !^ n16, 00 - stop, 01- run, 02 - skip to next day ^!
    nGameObjectIdx = $000978; !^ n16 ^!
    nUnknownX = $000980; !^ n16 ^!
    nUnknownY = $000982; !^ n16 ^!
    nCarriedItemId = $000984; !^ n16 ^!
    nTileInFrontOfPlayerX = $000985; !^ n16 ^!
    nTileInFrontOfPlayerY = $000987; !^ n16 ^!
    nDestinationAreaId = $00098B; !^ n8 ^!
    nWeatherForecast = $00098C
    nUnknownFlags09D = $00098D; !^ n8 ^!
    nWeatherDialogIdIndex = $000990; !^ n8 ^!
    sCurrentObjectMap = $0009B6; !^ sObjectMap (0x1000) ^!
    DMASpriteOBJQueue = $7EA000
    DMASpriteOBJ2BitQueue = $7EA200
    DMAtoVRAMData = $7EA420
    sFarmTilemap = $7EA4E6; !^ sTileMap (0x1000) ^!
    sPalette_7F0900 = $7F0900; !^ sPalette (0x200) ^!
    sPalette_7F0B00 = $7F0B00; !^ sPalette (0x200) ^!
    sPalette_7F0D00 = $7F0D00; !^ sPalette (0x200) ^!
    nMoney = $7F1F04; !^ n24 ^!
    nShippingProfit = $7F1F07; !^ n24 ^!
    nOwnedCows = $7F1F0A; !^ n8 ^!
    nOwnedChickens = $7F1F0B; !^ n8 ^!
    nStoredWood = $7F1F0C; !^ n16 ^!
    nReqWoodForExpansion = $7F1F0E; !^ n16 ^!
    nStoredFeed = $7F1F10; !^ n16 ^!
    nCowPregnacyDays = $7F1F12; !^ n8 ^!
    nGameUnk7F1F15 = $7F1F15; !^ n24 ^!
    nCurrentYearID = $7F1F18; !^ n8, 00 - 1st Year, 01 - 2nd Year, 03 - 3rd Year ^!
    nCurrentSeasonID = $7F1F19; !^ n8 ^!
    nCurrentWeekdayID = $7F1F1A; !^ n8 ^!
    nCurrentDay = $7F1F1B; !^ n8 ^!
    nCurrentTimeID = $7F1F1C; !^ n8 ^!
    nInGameHourCounter = $7F1F1D; !^ n8 ^!
    nInGameMinuteCounter = $7F1F1E; !^ n8 ^!
    nLove_Maria = $7F1F1F; !^ n16 ^!
    nLove_Ann = $7F1F21; !^ n16 ^!
    nLove_Nina = $7F1F23; !^ n16 ^!
    nLove_Ellen = $7F1F25; !^ n16 ^!
    nLove_Eve = $7F1F27; !^ n16 ^!
    nPlantedGrassCount = $7F1F29; !^ n16 ^!
    nNewBornCowAffection = $7F1F2B; !^ n8 ^!
    nDogX = $7F1F2C; !^ n16 ^!
    nDogY = $7F1F2E; !^ n16 ^!
    nDogAreaId = $7F1F30; !^ n16 ^!
    nHorseAreaIdMaybe = $7F1F31; !^ n8 ^!
    nHorseAge = $7F1F32; !^ n16 ^!
    nPlayerHappiness = $7F1F33; !^ n16 ^!
    nConstructionDayCounter = $7F1F35; !^ n8 ^!
    nPowerBerryEaten = $7F1F36; !^ n8 range 00h-0Ah, (ammount of flowers in garden) ^!
    nFirstChildAge = $7F1F37; !^ n16 ^!
    nSecondChildAge = $7F1F39; !^ n16 ^!
    nMarriedDaysCounter = $7F1F3B; !^ n16 ? ^!
    sFirstChildNameShort = $7F1F3D; !^ 4 * s16 ^!
    sSecondChildNameShort = $7F1F41; !^ 4 * s8 ^!
    nEggInCoopFlags = $7F1F45
    nEndingStep = $7F1F47; !^ n8 ^!
    nIntroHowToPlayIndex = $7F1F48; !^ n8 ^!
    nIntroHowToPlayIndex2 = $7F1F49; !^ n8 ^!
    nStatShippedCorns = $7F1F4A; !^ n16 ^!
    nStatShippedTomatoes = $7F1F4C; !^ n16 ^!
    nStatShippedTurnips = $7F1F4E; !^ n16 ^!
    nStatShippedPotatoes = $7F1F50; !^ n16 ^!
    nDogHugs = $7F1F52; !^ n16 ^!
    nRanchMasteringRate = $7F1F54; !^ n16 ^!
    nRanchDevelopmentRate = $7F1F56; !^ n8 (0-100%) ^!
 
 
 
 
 
 
 
 
 
    Table_858C8E = $858C8E
 
 
 
 
 
 
 
    PTR16_80FFFF = $80FFFF
    EMPTY_FFFFFF = $FFFFFF
