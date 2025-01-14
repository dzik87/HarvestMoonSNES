    ptrCurrentDialog = $000001; !^ ptr24 ^!
    ptrPaletteNext = $000004; !^ ptr24 ^!
    ptrUnknown0x07 = $000007; !^ ptr24 ^!
    ptrAudioData = $00000A; !^ ptr24 ^!
    ptrSelectedTileMap = $00000D; !^ ptr24 ^!
    pCurrentTileMapData = $000018; !^ ptr24 ^!
    nMapEngine_DestinationId = $000022; !^ n8 ^!
    ptrUnknown0x42 = $000042; !^ 16 * ptr24 ^!
    ptrUnknown0x72 = $000072; !^ ptr24 ^!
    ptrUnknown0x75 = $000075; !^ ptr24 ^!
    ptrUnknown0x78 = $000078; !^ ptr24 ^!
    n16TempVar1 = $00007E; !^ n16 ^!
    n16TempVar2 = $000080; !^ n16 ^!
    n16TempVar3 = $000082; !^ n16 ^!
    n16TempVar4 = $000084; !^ n16 ^!
    n8TempVar1 = $000092; !^ n8 ^!
    n8TempVar2 = $000093
    n8TempVar3 = $000094
    nUnknown0x95 = $000095; !^ n8 ^!
    ptrUnknown0xAD = $0000AD; !^ ptr24 ^!
    ptrBank86_87Data = $0000B3; !^ ptr24 ^!
    ptrAIActionData = $0000C9; !^ ptr24 ^!
    ptrAIUnknown0xCC = $0000CC; !^ prt24 ^!
    ptrUnknown0xCF = $0000CF; !^ ptr24 ^!
    nPlayerAction = $0000D4; !^ n16 ^!
    nPlayerPosX = $0000D6; !^ n16 ^!
    nPlayerPosY = $0000D8; !^ n16 ^!
    nPlayerDirection = $0000DA; !^ n16 ^!
    nCameraX = $0000F5; !^ n16 ^!
    nCameraY = $0000F7; !^ n16 ^!
    nRandomTempVar1 = $000100
    nRandomTempVar2 = $000101
    nRandomTempVar3 = $000102
    nAudioUnk104Index = $000103; !^ n8 ^!
    sAudioUnk104 = $000104; !^ 0x0A * [n8] ^!
    nAudioUnk10E = $00010E; !^ n8 ^!
    nAudioUnk10F = $00010F; !^ n8 ^!
    nAudioMusicTrackId = $000110; !^ n8 ^!
    nAudioUnk111 = $000111; !^ n8 ^!
    nAudioUnk112 = $000112; !^ n8 ^!
    nAudioUnk113 = $000113; !^ n8 ^!
    nAudioRegisterValue0 = $000114; !^ n8 ^!
    nAudioRegisterValue1 = $000115; !^ n8 ^!
    nAudioRegisterValue2 = $000116; !^ n8 ^!
    nPaletteCountdown = $00017A; !^ n8 ^!
    nPaletteNextIndex = $00017B; !^ n8 ^!
    nPaletteNextHourIndex = $00017C; !^ n8 ^!
    nMapEngine_DestinationX = $00017D; !^ n16 (used when we change map) ^!
    nMapEngine_DestinationY = $00017F; !^ n16 (used when we change map) ^!
    nCurrentMapdata_RoomWidthMult = $000181; !^ n8 (offset 0x03) ^!
    nCurrentMapdata_RoomHeightMult = $000182; !^ n8 (offset 0x04) ^!
    nCurrentDialogPointerIndex = $000183; !^ n16, ptrDialog index ^!
    nCurrentTextIndex = $000187; !^ n16, ptrCurrentDialog index (to get one letter) ^!
    nCurrentMapdataPresetId = $000195; !^ n8 (offset 0x00) ^!
    nMapEngine_CurrentMapId = $000196; !^ n16 (offset 0x01) ^!
    nMapScrool_SpeedX = $00087C; !^ n16 ^!
    nMapScrool_SpeedY = $00087E; !^ n16 ^!
    nMapScrool_Timer = $000880
    sPlayerNameShort = $000881; !^ 4 * s8 ^!
    sTempNameVariable = $000885; !^ 4 * s8 ^!
    sDogNameShort = $000899; !^ 4 * s8 ^!
    sHorseNameShort = $00089D; !^ 4 * s8 ^!
    sSeasonName = $0008B3; !^ 6 * s8 ^!
    sWeekdayName = $0008BF; !^ 9 * s16 ^!
    sNumberOrdinal = $0008D1; !^ 2 * s16 ^!
    sPlayerNameLong = $0008D5; !^ 4 * s16 ^!
    sDogNameLong = $0008DD; !^ 4 * s16 ^!
    sHorseNameLong = $0008E5; !^ 4 * s16 ^!
    sFirstChildNameLong = $0008ED; !^ 4 * s16 ^!
    sSecondChildNameLong = $0008F5; !^ 4 * s16 ^!
    nUnknownFlags08FD = $0008FD; !^ n16 ^!
    nPlayerPosXCopy = $000907; !^ n16 ^!
    nPlayerPosYCopy = $000909; !^ n16 ^!
    nPlayerStamina = $000917; !^ n8 MaxHP ^!
    nPlayerEnergy = $000918; !^ n8 HP ^!
    nToolEquipped = $000921
    nToolSecond = $000923
    nAmountLeft_Water = $000926; !^ n8 ^!
    nAmountLeft_GrassSeeds = $000927; !^ n8 ^!
    nAmountLeft_CornSeeds = $000928; !^ n8 ^!
    nAmountLeft_TomatoSeeds = $000929; !^ n8 ^!
    nAmountLeft_PotatoSeeds = $00092A; !^ n8 ^!
    nAmountLeft_TurnipSeeds = $00092B; !^ n8 ^!
    nAmountLeft_CowFood = $00092C; !^ n8 ^!
    nAmountLeft_ChickenFood = $00092D; !^ n8 ^!
    nPlacedCowFeed = $000930; !^ n8 ^!
    nPlacedChickenFeed = $000931; !^ n8 ^!
    sPlacedCowFeed = $000932; !^ 16bit ^!
    sPlacedChickenFeed = $000934; !^ 16bit ^!
    nBreakHitCounter = $00096D; !^ n8 (used for example to break wood or stones) ^!
    nPlayerInteractionIndex = $00096E; !^ n8 ^!
    nPlayerInteractionArg1 = $00096F; !^ n8 ^!
    nPlayerInteractionArg2 = $000970; !^ n8 ^!
    nTimeState = $000973; !^ n16, 00 - stop, 01- run, 02 - skip to next day ^!
    nUnknownX = $000980; !^ n16 ^!
    nUnknownY = $000982; !^ n16 ^!
    nCarriedItemId = $000984; !^ n16 ^!
    nTileInFrontOfPlayerX = $000985; !^ n16 ^!
    nTileInFrontOfPlayerY = $000987; !^ n16 ^!
    n8DestinationId = $00098B; !^ n8 ^!
    nWeatherForecast = $00098C
    nUnknownFlags09D = $00098D; !^ n8 ^!
    nWeatherDialogIdIndex = $000990; !^ n8 ^!
    nMenuIndex = $000991; !^ n16 ^!
    nMenuTableSelector = $000993; !^ n8 ^!
    nNameEntryIndex = $000994; !^ n16 (we have max 4 letter names - this holds currently used tempname index) ^!
    nMenuFlip = $000999; !^ n16 ^!
    nMenuPosX = $00099B; !^ n16 ^!
    nMenuPoxY = $00099D; !^ n16 ^!
    nNameDestinationId = $00099F; !^ n8 ^!
    nUnknown9B5 = $0009B5; !^ n8 ^!
    sCurrentObjectMap = $0009B6; !^ sObjectMap (0x1000) ^!
    SNES_INIDISP = $002100
    SNES_OBSEL = $002101
    SNES_OAMADDL = $002102
    SNES_OAMADDH = $002103
    SNES_OAMDATA = $002104
    SNES_BGMODE = $002105
    SNES_MOSAIC = $002106
    SNES_BG1SC = $002107
    SNES_BG2SC = $002108
    SNES_BG3SC = $002109
    SNES_BG4SC = $00210A
    SNES_BG12NBA = $00210B
    SNES_BG34NBA = $00210C
    SNES_BG1HOFS = $00210D
    SNES_BG1VOFS = $00210E
    SNES_BG2HOFS = $00210F
    SNES_BG2VOFS = $002110
    SNES_BG3HOFS = $002111
    SNES_BG3VOFS = $002112
    SNES_BG4HOFS = $002113
    SNES_BG4VOFS = $002114
    SNES_VMAIN = $002115
    SNES_VMADDL = $002116
    SNES_VMADDH = $002117
    SNES_VMDATAL = $002118
    SNES_VMDATAH = $002119
    SNES_M7SEL = $00211A
    SNES_M7A = $00211B
    SNES_M7B = $00211C
    SNES_M7C = $00211D
    SNES_M7D = $00211E
    SNES_M7X = $00211F
    SNES_M7Y = $002120
    SNES_CGADD = $002121
    SNES_CGDATA = $002122
    SNES_W12SEL = $002123
    SNES_W34SEL = $002124
    SNES_WOBJSEL = $002125
    SNES_WH0 = $002126
    SNES_WH1 = $002127
    SNES_WH2 = $002128
    SNES_WH3 = $002129
    SNES_WBGLOG = $00212A
    SNES_WOBJLOG = $00212B
    SNES_TM = $00212C
    SNES_TS = $00212D
    SNES_TMW = $00212E
    SNES_TSW = $00212F
    SNES_CGWSEL = $002130
    SNES_CGADSUB = $002131
    SNES_COLDATA = $002132
    SNES_SETINI = $002133
    SNES_MPYL = $002134
    SNES_MPYM = $002135
    SNES_MPYH = $002136
    SNES_SLHV = $002137
    SNES_OAMDATAREAD = $002138
    SNES_VMDATALREAD = $002139
    SNES_VMDATAHREAD = $00213A
    SNES_CGDATAREAD = $00213B
    SNES_OPHCT = $00213C
    SNES_OPVCT = $00213D
    SNES_STAT77 = $00213E
    SNES_STAT78 = $00213F
    SNES_APUIO0 = $002140
    SNES_APUIO1 = $002141
    SNES_APUIO2 = $002142
    SNES_APUIO3 = $002143
    SNES_WMDATA = $002180
    SNES_WMADDL = $002181
    SNES_WMADDM = $002182
    SNES_WMADDH = $002183
    SNES_JOYSER0 = $004016
    SNES_JOYSER1 = $004017
    SNES_NMITIMEN = $004200
    SNES_WRIO = $004201
    SNES_WRMPYA = $004202
    SNES_WRMPYB = $004203
    SNES_WRDIVL = $004204
    SNES_WRDIVH = $004205
    SNES_WRDIVB = $004206
    SNES_HTIMEL = $004207
    SNES_HTIMEH = $004208
    SNES_VTIMEL = $004209
    SNES_VTIMEH = $00420A
    SNES_MDMAEN = $00420B
    SNES_HDMAEN = $00420C
    SNES_MEMSEL = $00420D
    SNES_RDNMI = $004210
    SNES_TIMEUP = $004211
    SNES_HVBJOY = $004212
    SNES_RDIO = $004213
    SNES_RDDIVL = $004214
    SNES_RDDIVH = $004215
    SNES_RDMPYL = $004216
    SNES_RDMPYH = $004217
    SNES_JOY1L = $004218
    SNES_JOY1H = $004219
    SNES_JOY2L = $00421A
    SNES_JOY2H = $00421B
    SNES_JOY3L = $00421C
    SNES_JOY3H = $00421D
    SNES_JOY4L = $00421E
    SNES_JOY4H = $00421F
    SNES_DMAP0 = $004300
    SNES_BBAD0 = $004301
    SNES_A1T0L = $004302
    SNES_A1T0H = $004303
    SNES_A1B0 = $004304
    SNES_DAS0L = $004305
    SNES_DAS0H = $004306
    SNES_DASB0 = $004307
    SNES_A2A0L = $004308
    SNES_A2A0H = $004309
    SNES_NTLR0 = $00430A
    SNES_DMAP1 = $004310
    SNES_BBAD1 = $004311
    SNES_A1T1L = $004312
    SNES_A1T1H = $004313
    SNES_A1B1 = $004314
    SNES_DAS1L = $004315
    SNES_DAS1H = $004316
    SNES_DASB1 = $004317
    SNES_A2A1L = $004318
    SNES_A2A1H = $004319
    SNES_NTLR1 = $00431A
    SNES_DMAP2 = $004320
    SNES_BBAD2 = $004321
    SNES_A1T2L = $004322
    SNES_A1T2H = $004323
    SNES_A1B2 = $004324
    SNES_DAS2L = $004325
    SNES_DAS2H = $004326
    SNES_DASB2 = $004327
    SNES_A2A2L = $004328
    SNES_A2A2H = $004329
    SNES_NTLR2 = $00432A
    SNES_DMAP3 = $004330
    SNES_BBAD3 = $004331
    SNES_A1T3L = $004332
    SNES_A1T3H = $004333
    SNES_A1B3 = $004334
    SNES_DAS3L = $004335
    SNES_DAS3H = $004336
    SNES_DASB3 = $004337
    SNES_A2A3L = $004338
    SNES_A2A3H = $004339
    SNES_NTLR3 = $00433A
    SNES_DMAP4 = $004340
    SNES_BBAD4 = $004341
    SNES_A1T4L = $004342
    SNES_A1T4H = $004343
    SNES_A1B4 = $004344
    SNES_DAS4L = $004345
    SNES_DAS4H = $004346
    SNES_DASB4 = $004347
    SNES_A2A4L = $004348
    SNES_A2A4H = $004349
    SNES_NTLR4 = $00434A
    SNES_DMAP5 = $004350
    SNES_BBAD5 = $004351
    SNES_A1T5L = $004352
    SNES_A1T5H = $004353
    SNES_A1B5 = $004354
    SNES_DAS5L = $004355
    SNES_DAS5H = $004356
    SNES_DASB5 = $004357
    SNES_A2A5L = $004358
    SNES_A2A5H = $004359
    SNES_NTLR5 = $00435A
    SNES_DMAP6 = $004360
    SNES_BBAD6 = $004361
    SNES_A1T6L = $004362
    SNES_A1T6H = $004363
    SNES_A1B6 = $004364
    SNES_DAS6L = $004365
    SNES_DAS6H = $004366
    SNES_DASB6 = $004367
    SNES_A2A6L = $004368
    SNES_A2A6H = $004369
    SNES_NTLR6 = $00436A
    SNES_DMAP7 = $004370
    SNES_BBAD7 = $004371
    SNES_A1T7L = $004372
    SNES_A1T7H = $004373
    SNES_A1B7 = $004374
    SNES_DAS7L = $004375
    SNES_DAS7H = $004376
    SNES_DASB7 = $004377
    SNES_A2A7L = $004378
    SNES_A2A7H = $004379
    SNES_NTLR7 = $00437A
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
    nDogMapId = $7F1F30; !^ n16 ^!
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
