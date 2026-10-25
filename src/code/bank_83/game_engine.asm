; Bank $83 module "game_engine" - starts at $83A9BE
 
fGameEngine_SetDefaults:
    SEP #$20                                                   ;83A9BE|E220    |      ;
    REP #$10                                                   ;83A9C0|C210    |      ;
    LDA.B #$00                                                 ;83A9C2|A900    |      ; Load 0 to A
    STA.L nCurrentYearID                                       ;83A9C4|8F181F7F|7F1F18; Store A to CurrentYear
    LDA.B #$00                                                 ;83A9C8|A900    |      ; Load 0 to A
    STA.L nCurrentSeasonID                                     ;83A9CA|8F191F7F|7F1F19; Store A to CurrentSeason
    LDA.B #$01                                                 ;83A9CE|A901    |      ; Load 1 to A
    STA.L nCurrentWeekdayID                                    ;83A9D0|8F1A1F7F|7F1F1A; Store A to CurrentWeekday
    LDA.B #$01                                                 ;83A9D4|A901    |      ; Load 1 to A
    STA.L nCurrentDay                                          ;83A9D6|8F1B1F7F|7F1F1B; Store A to CurrentDay
    LDA.B #$01                                                 ;83A9DA|A901    |      ;
    STA.W strcPlayerData.leftGrassSeeds                        ;83A9DC|8D2709  |000927;
    STZ.W strcPlayerData.leftCornSeeds                         ;83A9DF|9C2809  |000928; Write 0
    STZ.W strcPlayerData.leftTomatoSeeds                       ;83A9E2|9C2909  |000929;
    STZ.W strcPlayerData.leftPotatoSeeds                       ;83A9E5|9C2A09  |00092A;
    STZ.W strcPlayerData.leftTurnipSeeds                       ;83A9E8|9C2B09  |00092B;
    STZ.W strcPlayerData.leftCowFood                           ;83A9EB|9C2C09  |00092C;
    STZ.W strcPlayerData.leftChickenFood                       ;83A9EE|9C2D09  |00092D;
    LDA.B #$00                                                 ;83A9F1|A900    |      ;
    STA.L nOwnedCows                                           ;83A9F3|8F0A1F7F|7F1F0A;
    LDA.B #$00                                                 ;83A9F7|A900    |      ;
    STA.L nOwnedChickens                                       ;83A9F9|8F0B1F7F|7F1F0B;
    STZ.W nWeatherForecast                                     ;83A9FD|9C8C09  |00098C;
    LDA.B #$64                                                 ;83AA00|A964    |      ;
    STA.W strcPlayerData.stamina                               ;83AA02|8D1709  |000917;
    STZ.W strcPlayerData.toolEquipped                          ;83AA05|9C2109  |000921;
    STZ.W strcPlayerData.leftWater                             ;83AA08|9C2609  |000926;
    LDA.B #$00                                                 ;83AA0B|A900    |      ;
    STA.L nCowPregnacyDays                                     ;83AA0D|8F121F7F|7F1F12;
    LDA.B #$00                                                 ;83AA11|A900    |      ;
    STA.L nNewBornCowAffection                                 ;83AA13|8F2B1F7F|7F1F2B;
    LDA.B #$00                                                 ;83AA17|A900    |      ;
    STA.L nDogAreaId                                           ;83AA19|8F301F7F|7F1F30;
    LDA.B #$00                                                 ;83AA1D|A900    |      ;
    STA.L nHorseAreaIdMaybe                                    ;83AA1F|8F311F7F|7F1F31;
    LDA.B #$00                                                 ;83AA23|A900    |      ;
    STA.L nHorseAge                                            ;83AA25|8F321F7F|7F1F32;
    LDA.B #$00                                                 ;83AA29|A900    |      ;
    STA.L nConstructionDayCounter                              ;83AA2B|8F351F7F|7F1F35;
    LDA.B #$00                                                 ;83AA2F|A900    |      ;
    STA.L nPowerBerryEaten                                     ;83AA31|8F361F7F|7F1F36;
    LDA.B #$00                                                 ;83AA35|A900    |      ;
    STA.W $09A3                                                ;83AA37|8DA309  |0009A3;
    LDA.B #$00                                                 ;83AA3A|A900    |      ;
    STA.W strcStockData.unkCow                                 ;83AA3C|8D3709  |000937;
    STZ.W strcPlayerData.toolSecond                            ;83AA3F|9C2309  |000923;
    REP #$20                                                   ;83AA42|C220    |      ;
    LDA.W #$0000                                               ;83AA44|A90000  |      ;
    STA.L nStoredWood                                          ;83AA47|8F0C1F7F|7F1F0C;
    LDA.W #$0000                                               ;83AA4B|A90000  |      ;
    STA.L nStoredFeed                                          ;83AA4E|8F101F7F|7F1F10;
    STZ.W strcDialogDisplay.mapFlags                           ;83AA52|9C9601  |000196;
    LDA.W #$0000                                               ;83AA55|A90000  |      ;
    STA.L nPlantedGrassCount                                   ;83AA58|8F291F7F|7F1F29;
    LDA.W #$0000                                               ;83AA5C|A90000  |      ;
    STA.L nLove_Maria                                          ;83AA5F|8F1F1F7F|7F1F1F;
    LDA.W #$0000                                               ;83AA63|A90000  |      ;
    STA.L nLove_Ann                                            ;83AA66|8F211F7F|7F1F21;
    LDA.W #$0000                                               ;83AA6A|A90000  |      ;
    STA.L nLove_Nina                                           ;83AA6D|8F231F7F|7F1F23;
    LDA.W #$0000                                               ;83AA71|A90000  |      ;
    STA.L nLove_Ellen                                          ;83AA74|8F251F7F|7F1F25;
    LDA.W #$0000                                               ;83AA78|A90000  |      ;
    STA.L nLove_Eve                                            ;83AA7B|8F271F7F|7F1F27;
    LDA.W #$0000                                               ;83AA7F|A90000  |      ;
    STA.L strcFlags.event1                                     ;83AA82|8F641F7F|7F1F64;
    LDA.W #$0000                                               ;83AA86|A90000  |      ;
    STA.L strcFlags.event2                                     ;83AA89|8F661F7F|7F1F66;
    LDA.W #$0000                                               ;83AA8D|A90000  |      ;
    STA.L strcFlags.event3                                     ;83AA90|8F681F7F|7F1F68;
    LDA.W #$0000                                               ;83AA94|A90000  |      ;
    STA.L strcFlags.event4                                     ;83AA97|8F6A1F7F|7F1F6A;
    LDA.W #$0000                                               ;83AA9B|A90000  |      ;
    STA.L nDogX                                                ;83AA9E|8F2C1F7F|7F1F2C;
    LDA.W #$0000                                               ;83AAA2|A90000  |      ;
    STA.L nDogY                                                ;83AAA5|8F2E1F7F|7F1F2E;
    LDA.W #$0000                                               ;83AAA9|A90000  |      ;
    STA.L nPlayerHappiness                                     ;83AAAC|8F331F7F|7F1F33;
    LDA.W #$0000                                               ;83AAB0|A90000  |      ;
    STA.L nEggInCoopFlags                                      ;83AAB3|8F451F7F|7F1F45;
    LDA.W #$0000                                               ;83AAB7|A90000  |      ;
    STA.L strcFlags.event5                                     ;83AABA|8F6C1F7F|7F1F6C;
    LDA.W #$0000                                               ;83AABE|A90000  |      ;
    STA.L strcFlags.event6                                     ;83AAC1|8F6E1F7F|7F1F6E;
    LDA.W #$0000                                               ;83AAC5|A90000  |      ;
    STA.L strcFlags.event7                                     ;83AAC8|8F701F7F|7F1F70;
    LDA.W #$0000                                               ;83AACC|A90000  |      ;
    STA.L strcFlags.event8                                     ;83AACF|8F721F7F|7F1F72;
    LDA.W #$0000                                               ;83AAD3|A90000  |      ;
    STA.L nMarriedDaysCounter                                  ;83AAD6|8F3B1F7F|7F1F3B;
    LDA.W #$0000                                               ;83AADA|A90000  |      ;
    STA.L nFirstChildAge                                       ;83AADD|8F371F7F|7F1F37;
    LDA.W #$0000                                               ;83AAE1|A90000  |      ;
    STA.L nSecondChildAge                                      ;83AAE4|8F391F7F|7F1F39;
    LDA.W #$0000                                               ;83AAE8|A90000  |      ;
    STA.L nStatShippedCorns                                    ;83AAEB|8F4A1F7F|7F1F4A;
    LDA.W #$0000                                               ;83AAEF|A90000  |      ;
    STA.L nStatShippedTomatoes                                 ;83AAF2|8F4C1F7F|7F1F4C;
    LDA.W #$0000                                               ;83AAF6|A90000  |      ;
    STA.L nStatShippedTurnips                                  ;83AAF9|8F4E1F7F|7F1F4E;
    LDA.W #$0000                                               ;83AAFD|A90000  |      ;
    STA.L nStatShippedPotatoes                                 ;83AB00|8F501F7F|7F1F50;
    LDA.W #$0000                                               ;83AB04|A90000  |      ;
    STA.L nDogHugs                                             ;83AB07|8F521F7F|7F1F52;
    REP #$20                                                   ;83AB0B|C220    |      ;
    LDA.W #$001E                                               ;83AB0D|A91E00  |      ;
    STA.L nMoney                                               ;83AB10|8F041F7F|7F1F04;
    SEP #$20                                                   ;83AB14|E220    |      ;
    LDA.B #$00                                                 ;83AB16|A900    |      ;
    STA.L nMoney+2                                             ;83AB18|8F061F7F|7F1F06;
    SEP #$20                                                   ;83AB1C|E220    |      ;
    LDA.B #$B1                                                 ;83AB1E|A9B1    |      ;
    STA.W strcNames.sPlayer                                    ;83AB20|8D8108  |000881;
    LDA.B #$B1                                                 ;83AB23|A9B1    |      ;
    STA.W strcNames.sPlayer+1                                  ;83AB25|8D8208  |000882;
    LDA.B #$B1                                                 ;83AB28|A9B1    |      ;
    STA.W strcNames.sPlayer+2                                  ;83AB2A|8D8308  |000883;
    LDA.B #$B1                                                 ;83AB2D|A9B1    |      ;
    STA.W strcNames.sPlayer+3                                  ;83AB2F|8D8408  |000884;
    SEP #$20                                                   ;83AB32|E220    |      ;
    LDA.B #$0F                                                 ;83AB34|A90F    |      ;
    STA.L strcShedItems.row1                                   ;83AB36|8F001F7F|7F1F00;
    LDA.B #$88                                                 ;83AB3A|A988    |      ;
    STA.L strcShedItems.row2                                   ;83AB3C|8F011F7F|7F1F01;
    LDA.B #$00                                                 ;83AB40|A900    |      ;
    STA.L strcShedItems.row3                                   ;83AB42|8F021F7F|7F1F02;
    LDA.B #$00                                                 ;83AB46|A900    |      ;
    STA.L strcShedItems.row4                                   ;83AB48|8F031F7F|7F1F03;
    SEP #$20                                                   ;83AB4C|E220    |      ;
    LDA.B #$B1                                                 ;83AB4E|A9B1    |      ;
    STA.W strcNames.sDog                                       ;83AB50|8D9908  |000899;
    LDA.B #$B1                                                 ;83AB53|A9B1    |      ;
    STA.W strcNames.sDog+1                                     ;83AB55|8D9A08  |00089A;
    LDA.B #$B1                                                 ;83AB58|A9B1    |      ;
    STA.W strcNames.sDog+2                                     ;83AB5A|8D9B08  |00089B;
    LDA.B #$B1                                                 ;83AB5D|A9B1    |      ;
    STA.W strcNames.sDog+3                                     ;83AB5F|8D9C08  |00089C;
    SEP #$20                                                   ;83AB62|E220    |      ;
    LDA.B #$B1                                                 ;83AB64|A9B1    |      ;
    STA.W strcNames.sHorse                                     ;83AB66|8D9D08  |00089D;
    LDA.B #$B1                                                 ;83AB69|A9B1    |      ;
    STA.W strcNames.sHorse+1                                   ;83AB6B|8D9E08  |00089E;
    LDA.B #$B1                                                 ;83AB6E|A9B1    |      ;
    STA.W strcNames.sHorse+2                                   ;83AB70|8D9F08  |00089F;
    LDA.B #$B1                                                 ;83AB73|A9B1    |      ;
    STA.W strcNames.sHorse+3                                   ;83AB75|8DA008  |0008A0;
    SEP #$20                                                   ;83AB78|E220    |      ;
    LDA.B #$B1                                                 ;83AB7A|A9B1    |      ;
    STA.W strcNames.sHorse                                     ;83AB7C|8D9D08  |00089D;
    LDA.B #$B1                                                 ;83AB7F|A9B1    |      ;
    STA.W strcNames.sHorse+1                                   ;83AB81|8D9E08  |00089E;
    LDA.B #$B1                                                 ;83AB84|A9B1    |      ;
    STA.W strcNames.sHorse+2                                   ;83AB86|8D9F08  |00089F;
    LDA.B #$B1                                                 ;83AB89|A9B1    |      ;
    STA.W strcNames.sHorse+3                                   ;83AB8B|8DA008  |0008A0;
    SEP #$20                                                   ;83AB8E|E220    |      ;
    LDA.B #$B1                                                 ;83AB90|A9B1    |      ;
    STA.L sFirstChildNameShort                                 ;83AB92|8F3D1F7F|7F1F3D;
    LDA.B #$B1                                                 ;83AB96|A9B1    |      ;
    STA.L sFirstChildNameShort+1                               ;83AB98|8F3E1F7F|7F1F3E;
    LDA.B #$B1                                                 ;83AB9C|A9B1    |      ;
    STA.L sFirstChildNameShort+2                               ;83AB9E|8F3F1F7F|7F1F3F;
    LDA.B #$B1                                                 ;83ABA2|A9B1    |      ;
    STA.L sFirstChildNameShort+3                               ;83ABA4|8F401F7F|7F1F40;
    SEP #$20                                                   ;83ABA8|E220    |      ;
    LDA.B #$B1                                                 ;83ABAA|A9B1    |      ;
    STA.L sSecondChildNameShort                                ;83ABAC|8F411F7F|7F1F41;
    LDA.B #$B1                                                 ;83ABB0|A9B1    |      ;
    STA.L sSecondChildNameShort+1                              ;83ABB2|8F421F7F|7F1F42;
    LDA.B #$B1                                                 ;83ABB6|A9B1    |      ;
    STA.L sSecondChildNameShort+2                              ;83ABB8|8F431F7F|7F1F43;
    LDA.B #$B1                                                 ;83ABBC|A9B1    |      ;
    STA.L sSecondChildNameShort+3                              ;83ABBE|8F441F7F|7F1F44;
    REP #$20                                                   ;83ABC2|C220    |      ;
    LDA.W #!DIALOG_SPACE                                               
    STA.W strcNames.wPlayer                                    ;83ABC7|8DD508  |0008D5;
    STA.W strcNames.wPlayer+2                                  ;83ABCA|8DD708  |0008D7;
    STA.W strcNames.wPlayer+4                                  ;83ABCD|8DD908  |0008D9;
    STA.W strcNames.wPlayer+6                                  ;83ABD0|8DDB08  |0008DB;
    STA.W strcNames.wDog                                       ;83ABD3|8DDD08  |0008DD;
    STA.W strcNames.wDog+2                                     ;83ABD6|8DDF08  |0008DF;
    STA.W strcNames.wDog+4                                     ;83ABD9|8DE108  |0008E1;
    STA.W strcNames.wDog+6                                     ;83ABDC|8DE308  |0008E3;
    STA.W strcNames.wHorse                                     ;83ABDF|8DE508  |0008E5;
    STA.W strcNames.wHorse+2                                   ;83ABE2|8DE708  |0008E7;
    STA.W strcNames.wHorse+4                                   ;83ABE5|8DE908  |0008E9;
    STA.W strcNames.wHorse+6                                   ;83ABE8|8DEB08  |0008EB;
    JSL.L fObjectMap_LoadDefaultFarm                           ;83ABEB|225AA682|82A65A;
    RTL                                                        ;83ABEF|6B      |      ;
 
 
fGameEngine_FirstNight:
    REP #$30                                                   ;83ABF0|C230    |      ;
    STZ.W strcDialogDisplay.dialogId                           ;83ABF2|9C8301  |000183;
    STZ.W strcDialogDisplay.dialogUnk185                       ;83ABF5|9C8501  |000185;
    STZ.W strcDialogDisplay.dialogCurrentOffset                ;83ABF8|9C8701  |000187;
    SEP #$20                                                   ;83ABFB|E220    |      ;
    STZ.W strcDialogDisplay.dialogFlags                        ;83ABFD|9C9B01  |00019B;
    STZ.W strcDialogDisplay.mapUnk19A                          ;83AC00|9C9A01  |00019A;
    STZ.B strcSystem.DMAchannelFlags                           ;83AC03|6428    |000028;
    REP #$20                                                   ;83AC05|C220    |      ;
    STZ.B ptrPaletteNext                                       ;83AC07|6404    |000004;
    SEP #$20                                                   ;83AC09|E220    |      ;
    STZ.B ptrPaletteNext+2                                     ;83AC0B|6406    |000006;
    REP #$20                                                   ;83AC0D|C220    |      ;
    STZ.B ptrUnknown0x42                                       ;83AC0F|6442    |000042;
    STZ.B $45                                                  ;83AC11|6445    |000045;
    STZ.B $48                                                  ;83AC13|6448    |000048;
    SEP #$20                                                   ;83AC15|E220    |      ;
    STZ.B ptrUnknown0x42+2                                     ;83AC17|6444    |000044;
    STZ.B $47                                                  ;83AC19|6447    |000047;
    STZ.B $4A                                                  ;83AC1B|644A    |00004A;
    REP #$20                                                   ;83AC1D|C220    |      ;
    LDA.W #$0000                                               ;83AC1F|A90000  |      ;
    STA.L nShippingProfit                                      ;83AC22|8F071F7F|7F1F07;
    SEP #$20                                                   ;83AC26|E220    |      ;
    LDA.B #$00                                                 ;83AC28|A900    |      ;
    STA.L nShippingProfit+2                                    ;83AC2A|8F091F7F|7F1F09;
    JSL.L fWriteSeasonWeekdayAndDayOrdinal                     ;83AC2E|22D68982|8289D6;
    SEP #$20                                                   ;83AC32|E220    |      ;
    STZ.W nBreakHitCounter                                     ;83AC34|9C6D09  |00096D;
    REP #$20                                                   ;83AC37|C220    |      ;
    STZ.B strcPlayer.flags                                     ;83AC39|64D2    |0000D2;
    STZ.B strcPlayer.unkPosX                                   ;83AC3B|64E9    |0000E9;
    STZ.B strcPlayer.unkPosY                                   ;83AC3D|64EB    |0000EB;
    STZ.W $0878                                                ;83AC3F|9C7808  |000878;
    STZ.W $087A                                                ;83AC42|9C7A08  |00087A;
    STZ.W nTimeState                                           ;83AC45|9C7309  |000973;
    REP #$20                                                   ;83AC48|C220    |      ;
    STZ.B ptrUnknown0xCF                                       ;83AC4A|64CF    |0000CF;
    SEP #$20                                                   ;83AC4C|E220    |      ;
    STZ.B ptrUnknown0xCF+2                                     ;83AC4E|64D1    |0000D1;
    STZ.W $098A                                                ;83AC50|9C8A09  |00098A;
    STZ.W $0972                                                ;83AC53|9C7209  |000972;
    REP #$20                                                   ;83AC56|C220    |      ;
    STZ.B strcPlayer.posX                                      ;83AC58|64D6    |0000D6;
    STZ.B strcPlayer.posY                                      ;83AC5A|64D8    |0000D8;
    STZ.W strcObjectData.playerX                               ;83AC5C|9C0709  |000907;
    STZ.W strcObjectData.playerY                               ;83AC5F|9C0909  |000909;
    SEP #$20                                                   ;83AC62|E220    |      ;
    STZ.W strcPlayerData.unkCounter919                         ;83AC64|9C1909  |000919;
    REP #$20                                                   ;83AC67|C220    |      ;
    STZ.W strcMenuData.menuIdx                                 ;83AC69|9C9109  |000991;
    SEP #$20                                                   ;83AC6C|E220    |      ;
    STZ.W strcMenuData.tableSelector                           ;83AC6E|9C9309  |000993;
    STZ.W strcMenuData.nameEntryIdx                            ;83AC71|9C9409  |000994;
    STZ.W strcDialogDisplay.dialogBlinkTimer                   ;83AC74|9C8B01  |00018B;
    SEP #$20                                                   ;83AC77|E220    |      ;
    LDA.B #$06                                                 ;83AC79|A906    |      ;
    STA.L nCurrentTimeID                                       ;83AC7B|8F1C1F7F|7F1F1C;
    LDA.B #$00                                                 ;83AC7F|A900    |      ;
    STA.L nInGameHourCounter                                   ;83AC81|8F1D1F7F|7F1F1D;
    LDA.B #$00                                                 ;83AC85|A900    |      ;
    STA.L nInGameMinuteCounter                                 ;83AC87|8F1E1F7F|7F1F1E;
    REP #$20                                                   ;83AC8B|C220    |      ;
    LDA.W #$0000                                               ;83AC8D|A90000  |      ;
    STA.L strcFlags.daily1                                     ;83AC90|8F5A1F7F|7F1F5A;
    LDA.W #$0000                                               ;83AC94|A90000  |      ;
    STA.L strcFlags.daily2                                     ;83AC97|8F5C1F7F|7F1F5C;
    LDA.W #$0000                                               ;83AC9B|A90000  |      ;
    STA.L strcFlags.daily3                                     ;83AC9E|8F5E1F7F|7F1F5E;
    LDA.W #$0000                                               ;83ACA2|A90000  |      ;
    STA.L strcFlags.daily4                                     ;83ACA5|8F601F7F|7F1F60;
    LDA.W #$0000                                               ;83ACA9|A90000  |      ;
    STA.L strcFlags.daily5                                     ;83ACAC|8F621F7F|7F1F62;
    LDA.W #$0000                                               ;83ACB0|A90000  |      ;
    STA.L strcFlags.unknown1                                   ;83ACB3|8F741F7F|7F1F74;
    LDA.W #$0000                                               ;83ACB7|A90000  |      ;
    STA.L strcFlags.unknown2                                   ;83ACBA|8F761F7F|7F1F76;
    LDA.W #$0000                                               ;83ACBE|A90000  |      ;
    STA.L strcFlags.unknown3                                   ;83ACC1|8F781F7F|7F1F78;
    LDA.W #$0000                                               ;83ACC5|A90000  |      ;
    STA.L $7F1F7A                                              ;83ACC8|8F7A1F7F|7F1F7A;
    REP #$20                                                   ;83ACCC|C220    |      ;
    %SetPlayerFlag(!PFLAGS_ACTIVE)
    %SetPlayerAction(!PACTION_NONE)
    %SetPlayerDirection(!PDIR_DOWN)
    %SetObjectDirection(!PDIR_DOWN)
    REP #$30                                                   ;83ACED|C230    |      ;
    LDA.W #$0000                                               ;83ACEF|A90000  |      ;
    STA.W strcObjectData.spriteIdx                             ;83ACF2|8D0109  |000901;
    REP #$20                                                   ;83ACF5|C220    |      ;
    STZ.W strcObjectData.exist                                 ;83ACF7|9C1509  |000915;
    SEP #$20                                                   ;83ACFA|E220    |      ;
    LDA.W strcPlayerData.stamina                               ;83ACFC|AD1709  |000917;
    STA.W strcPlayerData.energy                                ;83ACFF|8D1809  |000918;
    SEP #$20                                                   ;83AD02|E220    |      ;
    STZ.W strcPlayerData.unkCounter91A                         ;83AD04|9C1A09  |00091A;
    STZ.W strcPlayerData.unkCounter91B                         ;83AD07|9C1B09  |00091B;
    SEP #$20                                                   ;83AD0A|E220    |      ;
    STZ.W strcPlayerData.lastExcercise                         ;83AD0C|9C2509  |000925;
    SEP #$20                                                   ;83AD0F|E220    |      ;
    STZ.W nWeatherDialogIdIndex                                ;83AD11|9C9009  |000990;
    SEP #$20                                                   ;83AD14|E220    |      ;
    STZ.W strcPlayerData.carryItemId                           ;83AD16|9C1D09  |00091D;
    STZ.W strcPlayerData.carryItemIdPrev                       ;83AD19|9C1E09  |00091E;
    STZ.W strcPlayerData.unkMap91F                             ;83AD1C|9C1F09  |00091F;
    STZ.W strcPlayerData.nAiArg                                ;83AD1F|9C2009  |000920;
    STZ.W strcStockData.unkAnyTool                             ;83AD22|9C6B09  |00096B;
    SEP #$20                                                   ;83AD25|E220    |      ;
    STZ.W $098F                                                ;83AD27|9C8F09  |00098F;
    SEP #$20                                                   ;83AD2A|E220    |      ;
    STZ.W $096C                                                ;83AD2C|9C6C09  |00096C;
    STZ.W strcPlayerData.toolSound                             ;83AD2F|9C2209  |000922;
    SEP #$20                                                   ;83AD32|E220    |      ;
    STZ.W strcAudio.trackId                                    ;83AD34|9C1001  |000110;
    STZ.W strcAudio.reg114                                     ;83AD37|9C1401  |000114;
    STZ.W strcAudio.trackIdCopy                                ;83AD3A|9C1701  |000117;
    STZ.W strcAudio.unk118                                     ;83AD3D|9C1801  |000118;
    STZ.W strcAudio.trackIdCopy                                ;83AD40|9C1701  |000117;
    SEP #$20                                                   ;83AD43|E220    |      ;
    STZ.W strcPlayerData.placedCowFeed                         ;83AD45|9C3009  |000930;
    STZ.W strcPlayerData.placedChcikenFeed                     ;83AD48|9C3109  |000931;
    REP #$20                                                   ;83AD4B|C220    |      ;
    STZ.W strcPlayerData.placedCowFeedFlags                    ;83AD4D|9C3209  |000932;
    STZ.W strcPlayerData.placedChickenFeedFlags                ;83AD50|9C3409  |000934;
    REP #$20                                                   ;83AD53|C220    |      ;
    STZ.W $084A                                                ;83AD55|9C4A08  |00084A;
    STZ.B strcPlayer.unkDC                                     ;83AD58|64DC    |0000DC;
    SEP #$20                                                   ;83AD5A|E220    |      ;
    STZ.W nDestinationAreaId                                   ;83AD5C|9C8B09  |00098B;
    REP #$20                                                   ;83AD5F|C220    |      ;
    STZ.W strcMapScrool.speedX                                 ;83AD61|9C7C08  |00087C;
    STZ.W strcMapScrool.speedY                                 ;83AD64|9C7E08  |00087E;
    SEP #$20                                                   ;83AD67|E220    |      ;
    STZ.W strcMapScrool.timer                                  ;83AD69|9C8008  |000880;
    REP #$30                                                   ;83AD6C|C230    |      ;
    LDA.W #$00FA                                               ;83AD6E|A9FA00  |      ;
    STA.L nReqWoodForExpansion                                 ;83AD71|8F0E1F7F|7F1F0E;
    %CheckFlag(event1, $0040)
    BEQ +                                                      ;83AD7C|F007    |83AD85;
    LDA.W #$01F4                                               ;83AD7E|A9F401  |      ;
    STA.L nReqWoodForExpansion                                 ;83AD81|8F0E1F7F|7F1F0E;
 
  + SEP #$20                                                   ;83AD85|E220    |      ;
    STZ.B $00                                                  ;83AD87|6400    |000000;
    STZ.W $0148                                                ;83AD89|9C4801  |000148;
    JSL.L fCore_WaitForNextNMI                                 ;83AD8C|22458680|808645;
    RTL                                                        ;83AD90|6B      |      ;
 
 
fGameEngine_DirectionHandler83AD91:
    REP #$30                                                   ;83AD91|C230    |      ; A: nPlayerDirection
    TAX                                                        ;83AD93|AA      |      ; X = A
    %CheckFlag(daily4, $4000)
    BEQ +                                                      ;83AD9B|F003    |83ADA0;
    JMP.W .label3                                              ;83AD9D|4CA2AE  |83AEA2;
 
 
  + TXA                                                        ;83ADA0|8A      |      ;
    ASL A                                                      ;83ADA1|0A      |      ;
    TAX                                                        ;83ADA2|AA      |      ;
    JMP.W (.jumpTable,X)                                       ;83ADA3|7CA6AD  |83ADA6;
 
.jumpTable:
    dw .case0                                                  ;83ADA6|        |83ADAE;
    dw .case1                                                  ;83ADA8|        |83ADC4;
    dw .case3                                                  ;83ADAA|        |83ADDB;
    dw .case4                                                  ;83ADAC|        |83ADF1;
 
.case0:
    LDA.B strcPlayer.lastX                                     ;83ADAE|A5DF    |0000DF;
    CLC                                                        ;83ADB0|18      |      ;
    ADC.W #$000C                                               ;83ADB1|690C00  |      ;
    STA.B strcVariables.n16Temp2                               ;83ADB4|8580    |000080;
    LDA.B strcPlayer.lastY                                     ;83ADB6|A5E1    |0000E1;
    CLC                                                        ;83ADB8|18      |      ;
    ADC.B strcPlayer.newY                                      ;83ADB9|65E7    |0000E7;
    ADC.B strcPlayer.unkE3                                     ;83ADBB|65E3    |0000E3;
    ADC.W #$000C                                               ;83ADBD|690C00  |      ;
    STA.B strcVariables.n16Temp3                               ;83ADC0|8582    |000082;
    BRA .label1                                                ;83ADC2|8044    |83AE08;
 
 
.case1:
    LDA.B strcPlayer.lastX                                     ;83ADC4|A5DF    |0000DF;
    CLC                                                        ;83ADC6|18      |      ;
    ADC.W #$000C                                               ;83ADC7|690C00  |      ;
    STA.B strcVariables.n16Temp2                               ;83ADCA|8580    |000080;
    LDA.B strcPlayer.lastY                                     ;83ADCC|A5E1    |0000E1;
    SEC                                                        ;83ADCE|38      |      ;
    SBC.B strcPlayer.newY                                      ;83ADCF|E5E7    |0000E7;
    SBC.B strcPlayer.unkE3                                     ;83ADD1|E5E3    |0000E3;
    CLC                                                        ;83ADD3|18      |      ;
    ADC.W #$000C                                               ;83ADD4|690C00  |      ;
    STA.B strcVariables.n16Temp3                               ;83ADD7|8582    |000082;
    BRA .label1                                                ;83ADD9|802D    |83AE08;
 
 
.case3:
    LDA.B strcPlayer.lastX                                     ;83ADDB|A5DF    |0000DF;
    CLC                                                        ;83ADDD|18      |      ;
    ADC.B strcPlayer.newX                                      ;83ADDE|65E5    |0000E5;
    ADC.B strcPlayer.unkE3                                     ;83ADE0|65E3    |0000E3;
    ADC.W #$000C                                               ;83ADE2|690C00  |      ;
    STA.B strcVariables.n16Temp2                               ;83ADE5|8580    |000080;
    LDA.B strcPlayer.lastY                                     ;83ADE7|A5E1    |0000E1;
    CLC                                                        ;83ADE9|18      |      ;
    ADC.W #$000C                                               ;83ADEA|690C00  |      ;
    STA.B strcVariables.n16Temp3                               ;83ADED|8582    |000082;
    BRA .label1                                                ;83ADEF|8017    |83AE08;
 
 
.case4:
    LDA.B strcPlayer.lastX                                     ;83ADF1|A5DF    |0000DF;
    SEC                                                        ;83ADF3|38      |      ;
    SBC.B strcPlayer.newX                                      ;83ADF4|E5E5    |0000E5;
    SBC.B strcPlayer.unkE3                                     ;83ADF6|E5E3    |0000E3;
    CLC                                                        ;83ADF8|18      |      ;
    ADC.W #$000C                                               ;83ADF9|690C00  |      ;
    STA.B strcVariables.n16Temp2                               ;83ADFC|8580    |000080;
    LDA.B strcPlayer.lastY                                     ;83ADFE|A5E1    |0000E1;
    CLC                                                        ;83AE00|18      |      ;
    ADC.W #$000C                                               ;83AE01|690C00  |      ;
    STA.B strcVariables.n16Temp3                               ;83AE04|8582    |000082;
    BRA .label1                                                ;83AE06|8000    |83AE08;
 
 
.label1:
    REP #$30                                                   ;83AE08|C230    |      ;
    LDA.B ptrAIUnknown0xCC                                     ;83AE0A|A5CC    |0000CC;
    PHA                                                        ;83AE0C|48      |      ;
    SEP #$20                                                   ;83AE0D|E220    |      ;
    LDA.B ptrAIUnknown0xCC+2                                   ;83AE0F|A5CE    |0000CE;
    PHA                                                        ;83AE11|48      |      ;
    REP #$20                                                   ;83AE12|C220    |      ;
    LDA.W #$B586                                               ;83AE14|A986B5  |      ;
    STA.B ptrAIUnknown0xCC                                     ;83AE17|85CC    |0000CC;
    SEP #$20                                                   ;83AE19|E220    |      ;
    LDA.B #$7E                                                 ;83AE1B|A97E    |      ;
    STA.B ptrAIUnknown0xCC+2                                   ;83AE1D|85CE    |0000CE;
    REP #$20                                                   ;83AE1F|C220    |      ;
    STZ.B strcVariables.n16Unk8C                               ;83AE21|648C    |00008C;
    LDX.W #$0000                                               ;83AE23|A20000  |      ;
 
.loop:
    SEP #$20                                                   ;83AE26|E220    |      ;
    REP #$10                                                   ;83AE28|C210    |      ;
    LDY.W #$000C                                               ;83AE2A|A00C00  |      ;
    LDA.B #$00                                                 ;83AE2D|A900    |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;83AE2F|97CC    |0000CC;
    SEP #$20                                                   ;83AE31|E220    |      ;
    REP #$10                                                   ;83AE33|C210    |      ;
    LDY.W #$0000                                               ;83AE35|A00000  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;83AE38|B7CC    |0000CC;
    BNE +                                                      ;83AE3A|D003    |83AE3F;
    JMP.W .label2                                              ;83AE3C|4C81AE  |83AE81;
 
 
  + REP #$20                                                   ;83AE3F|C220    |      ;
    LDA.B strcVariables.n16Temp2                               ;83AE41|A580    |000080;
    SEC                                                        ;83AE43|38      |      ;
    LDY.W #$001A                                               ;83AE44|A01A00  |      ;
    SBC.B [ptrAIUnknown0xCC],Y                                 ;83AE47|F7CC    |0000CC;
    CMP.W #$0019                                               ;83AE49|C91900  |      ;
    BCS .label2                                                ;83AE4C|B033    |83AE81;
    LDA.B strcVariables.n16Temp3                               ;83AE4E|A582    |000082;
    SEC                                                        ;83AE50|38      |      ;
    LDY.W #$001C                                               ;83AE51|A01C00  |      ;
    SBC.B [ptrAIUnknown0xCC],Y                                 ;83AE54|F7CC    |0000CC;
    CMP.W #$0019                                               ;83AE56|C91900  |      ;
    BCS .label2                                                ;83AE59|B026    |83AE81;
    LDA.B strcVariables.n16Unk8C                               ;83AE5B|A58C    |00008C;
    BNE .label2                                                ;83AE5D|D022    |83AE81;
    SEP #$20                                                   ;83AE5F|E220    |      ;
    REP #$10                                                   ;83AE61|C210    |      ;
    LDY.W #$000C                                               ;83AE63|A00C00  |      ;
    LDA.B #$01                                                 ;83AE66|A901    |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;83AE68|97CC    |0000CC;
    SEP #$20                                                   ;83AE6A|E220    |      ;
    REP #$10                                                   ;83AE6C|C210    |      ;
    LDY.W #$0000                                               ;83AE6E|A00000  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;83AE71|B7CC    |0000CC;
    AND.B #$02                                                 ;83AE73|2902    |      ;
    BEQ +                                                      ;83AE75|F003    |83AE7A;
    JMP.W .label2                                              ;83AE77|4C81AE  |83AE81;
 
 
  + REP #$20                                                   ;83AE7A|C220    |      ;
    LDA.W #$0001                                               ;83AE7C|A90100  |      ;
    STA.B strcVariables.n16Unk8C                               ;83AE7F|858C    |00008C;
 
.label2:
    REP #$20                                                   ;83AE81|C220    |      ;
    LDA.B ptrAIUnknown0xCC                                     ;83AE83|A5CC    |0000CC;
    CLC                                                        ;83AE85|18      |      ;
    ADC.W #$0040                                               ;83AE86|694000  |      ;
    STA.B ptrAIUnknown0xCC                                     ;83AE89|85CC    |0000CC;
    INX                                                        ;83AE8B|E8      |      ;
    CPX.W #$0031                                               ;83AE8C|E03100  |      ;
    BEQ +                                                      ;83AE8F|F003    |83AE94;
    JMP.W .loop                                                ;83AE91|4C26AE  |83AE26;
 
 
  + LDA.B strcVariables.n16Unk8C                               ;83AE94|A58C    |00008C;
    BNE .return                                                ;83AE96|D015    |83AEAD;
    SEP #$20                                                   ;83AE98|E220    |      ;
    PLA                                                        ;83AE9A|68      |      ;
    STA.B ptrAIUnknown0xCC+2                                   ;83AE9B|85CE    |0000CE;
    REP #$20                                                   ;83AE9D|C220    |      ;
    PLA                                                        ;83AE9F|68      |      ;
    STA.B ptrAIUnknown0xCC                                     ;83AEA0|85CC    |0000CC;
 
.label3:
    REP #$30                                                   ;83AEA2|C230    |      ;
    LDX.B strcPlayer.newX                                      ;83AEA4|A6E5    |0000E5;
    LDY.B strcPlayer.newY                                      ;83AEA6|A4E7    |0000E7;
    LDA.W #$0000                                               ;83AEA8|A90000  |      ;
    BRA .justReturn                                            ;83AEAB|8015    |83AEC2;
 
 
.return:
    SEP #$20                                                   ;83AEAD|E220    |      ;
    PLA                                                        ;83AEAF|68      |      ;
    STA.B ptrAIUnknown0xCC+2                                   ;83AEB0|85CE    |0000CE;
    REP #$20                                                   ;83AEB2|C220    |      ;
    PLA                                                        ;83AEB4|68      |      ;
    STA.B ptrAIUnknown0xCC                                     ;83AEB5|85CC    |0000CC;
    REP #$20                                                   ;83AEB7|C220    |      ;
    LDX.W #$0000                                               ;83AEB9|A20000  |      ;
    LDY.W #$0000                                               ;83AEBC|A00000  |      ;
    LDA.W #$0001                                               ;83AEBF|A90100  |      ;
 
.justReturn:
    RTL                                                        ;83AEC2|6B      |      ;
 
 
fGameEngine_CheckDirectionalOverlap:
    REP #$30                                                   ;83AEC3|C230    |      ; A: nIndex
    ASL A                                                      ;83AEC5|0A      |      ;
    TAX                                                        ;83AEC6|AA      |      ;
    JMP.W (.aJumpTable,X)                                      ;83AEC7|7CCAAE  |83AECA; X = nIndex * 2
 
.aJumpTable:
    dw .case0                                                  ;83AECA|        |83AED2;
    dw .case1                                                  ;83AECC|        |83AEDF;
    dw .case2                                                  ;83AECE|        |83AEEC;
    dw .case3                                                  ;83AED0|        |83AEF9;
 
.case0:
    LDA.B strcPlayer.lastX                                     ;83AED2|A5DF    |0000DF;
    STA.B strcVariables.n16Temp2                               ;83AED4|8580    |000080;
    LDA.B strcPlayer.lastY                                     ;83AED6|A5E1    |0000E1;
    CLC                                                        ;83AED8|18      |      ;
    ADC.B strcPlayer.newY                                      ;83AED9|65E7    |0000E7;
    STA.B strcVariables.n16Temp3                               ;83AEDB|8582    |000082;
    BRA .continue                                              ;83AEDD|8027    |83AF06;
 
 
.case1:
    LDA.B strcPlayer.lastX                                     ;83AEDF|A5DF    |0000DF;
    STA.B strcVariables.n16Temp2                               ;83AEE1|8580    |000080;
    LDA.B strcPlayer.lastY                                     ;83AEE3|A5E1    |0000E1;
    SEC                                                        ;83AEE5|38      |      ;
    SBC.B strcPlayer.newY                                      ;83AEE6|E5E7    |0000E7;
    STA.B strcVariables.n16Temp3                               ;83AEE8|8582    |000082;
    BRA .continue                                              ;83AEEA|801A    |83AF06;
 
 
.case2:
    LDA.B strcPlayer.lastX                                     ;83AEEC|A5DF    |0000DF;
    CLC                                                        ;83AEEE|18      |      ;
    ADC.B strcPlayer.newX                                      ;83AEEF|65E5    |0000E5;
    STA.B strcVariables.n16Temp2                               ;83AEF1|8580    |000080;
    LDA.B strcPlayer.lastY                                     ;83AEF3|A5E1    |0000E1;
    STA.B strcVariables.n16Temp3                               ;83AEF5|8582    |000082;
    BRA .continue                                              ;83AEF7|800D    |83AF06;
 
 
.case3:
    LDA.B strcPlayer.lastX                                     ;83AEF9|A5DF    |0000DF;
    SEC                                                        ;83AEFB|38      |      ;
    SBC.B strcPlayer.newX                                      ;83AEFC|E5E5    |0000E5;
    STA.B strcVariables.n16Temp2                               ;83AEFE|8580    |000080;
    LDA.B strcPlayer.lastY                                     ;83AF00|A5E1    |0000E1;
    STA.B strcVariables.n16Temp3                               ;83AF02|8582    |000082;
    BRA .continue                                              ;83AF04|8000    |83AF06;
 
 
.continue:
    LDA.B strcVariables.n16Temp2                               ;83AF06|A580    |000080;
    SEC                                                        ;83AF08|38      |      ;
    SBC.B strcPlayer.posX                                      ;83AF09|E5D6    |0000D6;
    CLC                                                        ;83AF0B|18      |      ;
    ADC.W #$000C                                               ;83AF0C|690C00  |      ;
    CMP.W #$0019                                               ;83AF0F|C91900  |      ;
    BCS .return                                                ;83AF12|B019    |83AF2D;
    LDA.B strcVariables.n16Temp3                               ;83AF14|A582    |000082;
    SEC                                                        ;83AF16|38      |      ;
    SBC.B strcPlayer.posY                                      ;83AF17|E5D8    |0000D8;
    CLC                                                        ;83AF19|18      |      ;
    ADC.W #$000C                                               ;83AF1A|690C00  |      ;
    CMP.W #$0019                                               ;83AF1D|C91900  |      ;
    BCS .return                                                ;83AF20|B00B    |83AF2D;
    LDA.W #$0001                                               ;83AF22|A90100  |      ;
    LDX.W #$0000                                               ;83AF25|A20000  |      ;
    LDY.W #$0000                                               ;83AF28|A00000  |      ;
    BRA .jusReturn                                             ;83AF2B|8009    |83AF36;
 
 
.return:
    REP #$30                                                   ;83AF2D|C230    |      ;
    LDA.W #$0000                                               ;83AF2F|A90000  |      ;
    LDX.B strcPlayer.newX                                      ;83AF32|A6E5    |0000E5;
    LDY.B strcPlayer.newY                                      ;83AF34|A4E7    |0000E7;
 
.jusReturn:
    RTL                                                        ;83AF36|6B      |      ;
 
 
fGameEngine_DirectionHandler83AF37:
    REP #$30                                                   ;83AF37|C230    |      ; A: nPlayerDirection
    ASL A                                                      ;83AF39|0A      |      ;
    TAX                                                        ;83AF3A|AA      |      ;
    JMP.W (.aJumpTable,X)                                      ;83AF3B|7C3EAF  |83AF3E;
 
.aJumpTable:
    dw .case0                                                  ;83AF3E|        |83AF46;
    dw .case1                                                  ;83AF40|        |83AFAE;
    dw .case2                                                  ;83AF42|        |83B016;
    dw .case3                                                  ;83AF44|        |83B07C;
 
.case0:
    LDA.B strcPlayer.lastX                                     ;83AF46|A5DF    |0000DF;
    SEC                                                        ;83AF48|38      |      ;
    SBC.W #$0006                                               ;83AF49|E90600  |      ;
    TAX                                                        ;83AF4C|AA      |      ;
    LDA.B strcPlayer.lastY                                     ;83AF4D|A5E1    |0000E1;
    CLC                                                        ;83AF4F|18      |      ;
    ADC.B strcPlayer.newY                                      ;83AF50|65E7    |0000E7;
    ADC.W #$0006                                               ;83AF52|690600  |      ;
    ADC.B strcPlayer.unkE3                                     ;83AF55|65E3    |0000E3;
    PHA                                                        ;83AF57|48      |      ;
    TAY                                                        ;83AF58|A8      |      ;
    LDA.W #$0000                                               ;83AF59|A90000  |      ;
    JSR.W fGameEngine_CheckTileCollision                            ;83AF5C|20F6B0  |83B0F6;
    REP #$20                                                   ;83AF5F|C220    |      ;
    PLY                                                        ;83AF61|7A      |      ;
    PHA                                                        ;83AF62|48      |      ;
    LDA.B strcVariables.n16Unk90                               ;83AF63|A590    |000090;
    PHA                                                        ;83AF65|48      |      ;
    LDA.B strcPlayer.lastX                                     ;83AF66|A5DF    |0000DF;
    CLC                                                        ;83AF68|18      |      ;
    ADC.W #$0006                                               ;83AF69|690600  |      ;
    TAX                                                        ;83AF6C|AA      |      ;
    LDA.W #$0001                                               ;83AF6D|A90100  |      ;
    JSR.W fGameEngine_CheckTileCollision                            ;83AF70|20F6B0  |83B0F6;
    REP #$20                                                   ;83AF73|C220    |      ;
    STA.B strcVariables.n16Temp1                               ;83AF75|857E    |00007E;
    PLY                                                        ;83AF77|7A      |      ;
    PLA                                                        ;83AF78|68      |      ;
    ASL A                                                      ;83AF79|0A      |      ;
    ORA.B strcVariables.n16Temp1                               ;83AF7A|057E    |00007E;
    STA.B strcVariables.n16Temp1                               ;83AF7C|857E    |00007E;
    BNE +                                                      ;83AF7E|D008    |83AF88;
    STZ.B strcVariables.n16Temp1                               ;83AF80|647E    |00007E;
    LDY.W #$0000                                               ;83AF82|A00000  |      ;
    JMP.W .return                                              ;83AF85|4CE1B0  |83B0E1;
 
 
  + REP #$30                                                   ;83AF88|C230    |      ;
    CMP.W #$0003                                               ;83AF8A|C90300  |      ;
    BEQ +                                                      ;83AF8D|F013    |83AFA2;
    CMP.W #$0002                                               ;83AF8F|C90200  |      ;
    BNE +                                                      ;83AF92|D00E    |83AFA2;
    STY.B strcVariables.n16Unk90                               ;83AF94|8490    |000090;
    LDA.B strcVariables.n16Unk88                               ;83AF96|A588    |000088;
    SEC                                                        ;83AF98|38      |      ;
    SBC.B strcVariables.n16Unk8C                               ;83AF99|E58C    |00008C;
    SBC.B strcVariables.n16Unk90                               ;83AF9B|E590    |000090;
    INC A                                                      ;83AF9D|1A      |      ;
    TAY                                                        ;83AF9E|A8      |      ;
    JMP.W .return                                              ;83AF9F|4CE1B0  |83B0E1;
 
 
  + LDA.B strcVariables.n16Unk88                               ;83AFA2|A588    |000088;
    SEC                                                        ;83AFA4|38      |      ;
    SBC.B strcVariables.n16Unk8C                               ;83AFA5|E58C    |00008C;
    SBC.B strcVariables.n16Unk90                               ;83AFA7|E590    |000090;
    INC A                                                      ;83AFA9|1A      |      ;
    TAY                                                        ;83AFAA|A8      |      ;
    JMP.W .return                                              ;83AFAB|4CE1B0  |83B0E1;
 
 
.case1:
    LDA.B strcPlayer.lastX                                     ;83AFAE|A5DF    |0000DF;
    SEC                                                        ;83AFB0|38      |      ;
    SBC.W #$0006                                               ;83AFB1|E90600  |      ;
    TAX                                                        ;83AFB4|AA      |      ;
    LDA.B strcPlayer.lastY                                     ;83AFB5|A5E1    |0000E1;
    SEC                                                        ;83AFB7|38      |      ;
    SBC.B strcPlayer.newY                                      ;83AFB8|E5E7    |0000E7;
    SBC.W #$0006                                               ;83AFBA|E90600  |      ;
    SBC.B strcPlayer.unkE3                                     ;83AFBD|E5E3    |0000E3;
    PHA                                                        ;83AFBF|48      |      ;
    TAY                                                        ;83AFC0|A8      |      ;
    LDA.W #$0000                                               ;83AFC1|A90000  |      ;
    JSR.W fGameEngine_CheckTileCollision                            ;83AFC4|20F6B0  |83B0F6;
    REP #$20                                                   ;83AFC7|C220    |      ;
    PLY                                                        ;83AFC9|7A      |      ;
    PHA                                                        ;83AFCA|48      |      ;
    LDA.B strcVariables.n16Unk8E                               ;83AFCB|A58E    |00008E;
    PHA                                                        ;83AFCD|48      |      ;
    LDA.B strcPlayer.lastX                                     ;83AFCE|A5DF    |0000DF;
    CLC                                                        ;83AFD0|18      |      ;
    ADC.W #$0006                                               ;83AFD1|690600  |      ;
    TAX                                                        ;83AFD4|AA      |      ;
    LDA.W #$0001                                               ;83AFD5|A90100  |      ;
    JSR.W fGameEngine_CheckTileCollision                            ;83AFD8|20F6B0  |83B0F6;
    REP #$20                                                   ;83AFDB|C220    |      ;
    STA.B strcVariables.n16Temp1                               ;83AFDD|857E    |00007E;
    PLY                                                        ;83AFDF|7A      |      ;
    PLA                                                        ;83AFE0|68      |      ;
    ASL A                                                      ;83AFE1|0A      |      ;
    ORA.B strcVariables.n16Temp1                               ;83AFE2|057E    |00007E;
    STA.B strcVariables.n16Temp1                               ;83AFE4|857E    |00007E;
    BNE +                                                      ;83AFE6|D008    |83AFF0;
    STZ.B strcVariables.n16Temp1                               ;83AFE8|647E    |00007E;
    LDY.W #$0000                                               ;83AFEA|A00000  |      ;
    JMP.W .return                                              ;83AFED|4CE1B0  |83B0E1;
 
 
  + REP #$30                                                   ;83AFF0|C230    |      ;
    CMP.W #$0003                                               ;83AFF2|C90300  |      ;
    BEQ +                                                      ;83AFF5|F013    |83B00A;
    CMP.W #$0002                                               ;83AFF7|C90200  |      ;
    BNE +                                                      ;83AFFA|D00E    |83B00A;
    STY.B strcVariables.n16Unk8E                               ;83AFFC|848E    |00008E;
    LDA.B strcVariables.n16Unk8C                               ;83AFFE|A58C    |00008C;
    CLC                                                        ;83B000|18      |      ;
    ADC.B strcVariables.n16Unk8E                               ;83B001|658E    |00008E;
    SEC                                                        ;83B003|38      |      ;
    SBC.B strcVariables.n16Unk88                               ;83B004|E588    |000088;
    TAY                                                        ;83B006|A8      |      ;
    JMP.W .return                                              ;83B007|4CE1B0  |83B0E1;
 
 
  + LDA.B strcVariables.n16Unk8C                               ;83B00A|A58C    |00008C;
    CLC                                                        ;83B00C|18      |      ;
    ADC.B strcVariables.n16Unk8E                               ;83B00D|658E    |00008E;
    SEC                                                        ;83B00F|38      |      ;
    SBC.B strcVariables.n16Unk88                               ;83B010|E588    |000088;
    TAY                                                        ;83B012|A8      |      ;
    JMP.W .return                                              ;83B013|4CE1B0  |83B0E1;
 
 
.case2:
    LDA.B strcPlayer.lastX                                     ;83B016|A5DF    |0000DF;
    CLC                                                        ;83B018|18      |      ;
    ADC.B strcPlayer.newX                                      ;83B019|65E5    |0000E5;
    ADC.W #$0006                                               ;83B01B|690600  |      ;
    ADC.B strcPlayer.unkE3                                     ;83B01E|65E3    |0000E3;
    PHA                                                        ;83B020|48      |      ;
    TAX                                                        ;83B021|AA      |      ;
    LDA.B strcPlayer.lastY                                     ;83B022|A5E1    |0000E1;
    SEC                                                        ;83B024|38      |      ;
    SBC.W #$0006                                               ;83B025|E90600  |      ;
    TAY                                                        ;83B028|A8      |      ;
    LDA.W #$0000                                               ;83B029|A90000  |      ;
    JSR.W fGameEngine_CheckTileCollision                            ;83B02C|20F6B0  |83B0F6;
    REP #$20                                                   ;83B02F|C220    |      ;
    PLX                                                        ;83B031|FA      |      ;
    PHA                                                        ;83B032|48      |      ;
    LDA.B strcVariables.n16Unk90                               ;83B033|A590    |000090;
    PHA                                                        ;83B035|48      |      ;
    LDA.B strcPlayer.lastY                                     ;83B036|A5E1    |0000E1;
    CLC                                                        ;83B038|18      |      ;
    ADC.W #$0006                                               ;83B039|690600  |      ;
    TAY                                                        ;83B03C|A8      |      ;
    LDA.W #$0001                                               ;83B03D|A90100  |      ;
    JSR.W fGameEngine_CheckTileCollision                            ;83B040|20F6B0  |83B0F6;
    REP #$20                                                   ;83B043|C220    |      ;
    STA.B strcVariables.n16Temp1                               ;83B045|857E    |00007E;
    PLX                                                        ;83B047|FA      |      ;
    PLA                                                        ;83B048|68      |      ;
    ASL A                                                      ;83B049|0A      |      ;
    ORA.B strcVariables.n16Temp1                               ;83B04A|057E    |00007E;
    STA.B strcVariables.n16Temp1                               ;83B04C|857E    |00007E;
    BNE +                                                      ;83B04E|D008    |83B058;
    STZ.B strcVariables.n16Temp1                               ;83B050|647E    |00007E;
    LDX.W #$0000                                               ;83B052|A20000  |      ;
    JMP.W .return                                              ;83B055|4CE1B0  |83B0E1;
 
 
  + REP #$30                                                   ;83B058|C230    |      ;
    CMP.W #$0003                                               ;83B05A|C90300  |      ;
    BEQ +                                                      ;83B05D|F012    |83B071;
    CMP.W #$0002                                               ;83B05F|C90200  |      ;
    BNE +                                                      ;83B062|D00D    |83B071;
    STX.B strcVariables.n16Unk90                               ;83B064|8690    |000090;
    LDA.B strcVariables.n16Unk86                               ;83B066|A586    |000086;
    SEC                                                        ;83B068|38      |      ;
    SBC.B strcVariables.n16Unk8A                               ;83B069|E58A    |00008A;
    SBC.B strcVariables.n16Unk90                               ;83B06B|E590    |000090;
    INC A                                                      ;83B06D|1A      |      ;
    TAX                                                        ;83B06E|AA      |      ;
    BRA .return                                                ;83B06F|8070    |83B0E1;
 
 
  + LDA.B strcVariables.n16Unk86                               ;83B071|A586    |000086;
    SEC                                                        ;83B073|38      |      ;
    SBC.B strcVariables.n16Unk8A                               ;83B074|E58A    |00008A;
    SBC.B strcVariables.n16Unk90                               ;83B076|E590    |000090;
    INC A                                                      ;83B078|1A      |      ;
    TAX                                                        ;83B079|AA      |      ;
    BRA .return                                                ;83B07A|8065    |83B0E1;
 
 
.case3:
    LDA.B strcPlayer.lastX                                     ;83B07C|A5DF    |0000DF;
    SEC                                                        ;83B07E|38      |      ;
    SBC.B strcPlayer.newX                                      ;83B07F|E5E5    |0000E5;
    SBC.W #$0006                                               ;83B081|E90600  |      ;
    SBC.B strcPlayer.unkE3                                     ;83B084|E5E3    |0000E3;
    PHA                                                        ;83B086|48      |      ;
    TAX                                                        ;83B087|AA      |      ;
    LDA.B strcPlayer.lastY                                     ;83B088|A5E1    |0000E1;
    SEC                                                        ;83B08A|38      |      ;
    SBC.W #$0006                                               ;83B08B|E90600  |      ;
    TAY                                                        ;83B08E|A8      |      ;
    LDA.W #$0000                                               ;83B08F|A90000  |      ;
    JSR.W fGameEngine_CheckTileCollision                            ;83B092|20F6B0  |83B0F6;
    REP #$20                                                   ;83B095|C220    |      ;
    PLX                                                        ;83B097|FA      |      ;
    PHA                                                        ;83B098|48      |      ;
    LDA.B strcVariables.n16Unk8E                               ;83B099|A58E    |00008E;
    PHA                                                        ;83B09B|48      |      ;
    LDA.B strcPlayer.lastY                                     ;83B09C|A5E1    |0000E1;
    CLC                                                        ;83B09E|18      |      ;
    ADC.W #$0006                                               ;83B09F|690600  |      ;
    TAY                                                        ;83B0A2|A8      |      ;
    LDA.W #$0001                                               ;83B0A3|A90100  |      ;
    JSR.W fGameEngine_CheckTileCollision                            ;83B0A6|20F6B0  |83B0F6;
    REP #$20                                                   ;83B0A9|C220    |      ;
    STA.B strcVariables.n16Temp1                               ;83B0AB|857E    |00007E;
    PLX                                                        ;83B0AD|FA      |      ;
    PLA                                                        ;83B0AE|68      |      ;
    ASL A                                                      ;83B0AF|0A      |      ;
    ORA.B strcVariables.n16Temp1                               ;83B0B0|057E    |00007E;
    STA.B strcVariables.n16Temp1                               ;83B0B2|857E    |00007E;
    BNE +                                                      ;83B0B4|D007    |83B0BD;
    STZ.B strcVariables.n16Temp1                               ;83B0B6|647E    |00007E;
    LDX.W #$0000                                               ;83B0B8|A20000  |      ;
    BRA .return                                                ;83B0BB|8024    |83B0E1;
 
 
  + REP #$30                                                   ;83B0BD|C230    |      ;
    CMP.W #$0003                                               ;83B0BF|C90300  |      ;
    BEQ +                                                      ;83B0C2|F012    |83B0D6;
    CMP.W #$0002                                               ;83B0C4|C90200  |      ;
    BNE +                                                      ;83B0C7|D00D    |83B0D6;
    STX.B strcVariables.n16Unk8E                               ;83B0C9|868E    |00008E;
    LDA.B strcVariables.n16Unk8A                               ;83B0CB|A58A    |00008A;
    CLC                                                        ;83B0CD|18      |      ;
    ADC.B strcVariables.n16Unk8E                               ;83B0CE|658E    |00008E;
    SEC                                                        ;83B0D0|38      |      ;
    SBC.B strcVariables.n16Unk86                               ;83B0D1|E586    |000086;
    TAX                                                        ;83B0D3|AA      |      ;
    BRA .return                                                ;83B0D4|800B    |83B0E1;
 
 
  + LDA.B strcVariables.n16Unk8A                               ;83B0D6|A58A    |00008A;
    CLC                                                        ;83B0D8|18      |      ;
    ADC.B strcVariables.n16Unk8E                               ;83B0D9|658E    |00008E;
    SEC                                                        ;83B0DB|38      |      ;
    SBC.B strcVariables.n16Unk86                               ;83B0DC|E586    |000086;
    TAX                                                        ;83B0DE|AA      |      ;
    BRA .return                                                ;83B0DF|8000    |83B0E1;
 
 
.return:
    REP #$20                                                   ;83B0E1|C220    |      ;
    LDA.B strcVariables.n16Temp1                               ;83B0E3|A57E    |00007E;
    RTL                                                        ;83B0E5|6B      |      ;
 
 
fGameEngine_Unused83B0E6:
    REP #$30                                                   ;83B0E6|C230    |      ;
    LDA.W #$0000                                               ;83B0E8|A90000  |      ;
    STA.B strcPlayer.unkPosY                                   ;83B0EB|85EB    |0000EB;
    STA.B strcPlayer.unkPosX                                   ;83B0ED|85E9    |0000E9;
    LDX.W #$0000                                               ;83B0EF|A20000  |      ;
    LDA.W #$0000                                               ;83B0F2|A90000  |      ;
    RTL                                                        ;83B0F5|6B      |      ;
 
 
fGameEngine_CheckTileCollision:
    REP #$30                                                   ;83B0F6|C230    |      ; return A: nStatus
    PHA                                                        ;83B0F8|48      |      ;
    STX.B strcVariables.n16Unk86                               ;83B0F9|8686    |000086;
    STY.B strcVariables.n16Unk88                               ;83B0FB|8488    |000088;
    TXA                                                        ;83B0FD|8A      |      ;
    AND.W #$FFF0                                               ;83B0FE|29F0FF  |      ;
    STA.B strcVariables.n16Unk8A                               ;83B101|858A    |00008A;
    TYA                                                        ;83B103|98      |      ;
    AND.W #$FFF0                                               ;83B104|29F0FF  |      ;
    STA.B strcVariables.n16Unk8C                               ;83B107|858C    |00008C;
    LDA.W #$0010                                               ;83B109|A91000  |      ;
    STA.B strcVariables.n16Unk8E                               ;83B10C|858E    |00008E;
    LDA.W #$0000                                               ;83B10E|A90000  |      ;
    STA.B strcVariables.n16Unk90                               ;83B111|8590    |000090;
    LDA.W #$0002                                               ;83B113|A90200  |      ;
    JSL.L fUnknown_82AC61                                      ;83B116|2261AC82|82AC61;
    SEP #$20                                                   ;83B11A|E220    |      ;
    REP #$10                                                   ;83B11C|C210    |      ;
    STA.B strcVariables.n8Temp1                                ;83B11E|8592    |000092;
    REP #$20                                                   ;83B120|C220    |      ;
    PLA                                                        ;83B122|68      |      ;
    CMP.W #$0001                                               ;83B123|C90100  |      ;
    BEQ .label1                                                ;83B126|F004    |83B12C;
    STX.B strcPlayer.unkPosX                                   ;83B128|86E9    |0000E9;
    BRA +                                                      ;83B12A|8002    |83B12E;
 
 
.label1:
    STX.B strcPlayer.unkPosY                                   ;83B12C|86EB    |0000EB;
 
  + SEP #$20                                                   ;83B12E|E220    |      ;
    LDA.B strcVariables.n8Temp1                                ;83B130|A592    |000092;
    AND.B #$01                                                 ;83B132|2901    |      ;
    BEQ +                                                      ;83B134|F003    |83B139;
    JMP.W .return1                                             ;83B136|4CBAB1  |83B1BA;
 
 
  + LDA.B strcVariables.n8Temp1                                ;83B139|A592    |000092;
    AND.B #$02                                                 ;83B13B|2902    |      ;
    BNE .label2                                                ;83B13D|D02B    |83B16A;
    LDA.B strcVariables.n8Temp1                                ;83B13F|A592    |000092;
    AND.B #$04                                                 ;83B141|2904    |      ;
    BNE .label3                                                ;83B143|D039    |83B17E;
    LDA.B strcVariables.n8Temp1                                ;83B145|A592    |000092;
    AND.B #$08                                                 ;83B147|2908    |      ;
    BNE .label4                                                ;83B149|D047    |83B192;
    LDA.B strcVariables.n8Temp1                                ;83B14B|A592    |000092;
    AND.B #$10                                                 ;83B14D|2910    |      ;
    BNE .label5                                                ;83B14F|D055    |83B1A6;
    %CheckPlayerFlags(!PFLAGS_RIDINGHORSE)
    BNE +                                                      ;83B158|D003    |83B15D;
    JMP.W .return0                                             ;83B15A|4CC1B1  |83B1C1;
 
 
  + CPX.W #$00C0                                               ;83B15D|E0C000  |      ;
    BCC .return0                                               ;83B160|905F    |83B1C1;
    CPX.W #$00D0                                               ;83B162|E0D000  |      ;
    BCS .return0                                               ;83B165|B05A    |83B1C1;
    JMP.W .return1                                             ;83B167|4CBAB1  |83B1BA;
 
 
.label2:
    REP #$30                                                   ;83B16A|C230    |      ;
    LDA.B strcPlayer.newY                                      ;83B16C|A5E7    |0000E7;
    BNE +                                                      ;83B16E|D005    |83B175;
    LDA.W #$0008                                               ;83B170|A90800  |      ;
    STA.B strcVariables.n16Unk8E                               ;83B173|858E    |00008E;
 
  + LDA.B strcVariables.n16Unk86                               ;83B175|A586    |000086;
    AND.W #$0008                                               ;83B177|290800  |      ;
    BNE .return0                                               ;83B17A|D045    |83B1C1;
    BRA .return1                                               ;83B17C|803C    |83B1BA;
 
 
.label3:
    REP #$30                                                   ;83B17E|C230    |      ;
    LDA.B strcPlayer.newY                                      ;83B180|A5E7    |0000E7;
    BNE +                                                      ;83B182|D005    |83B189;
    LDA.W #$0008                                               ;83B184|A90800  |      ;
    STA.B strcVariables.n16Unk90                               ;83B187|8590    |000090;
 
  + LDA.B strcVariables.n16Unk86                               ;83B189|A586    |000086;
    AND.W #$0008                                               ;83B18B|290800  |      ;
    BEQ .return0                                               ;83B18E|F031    |83B1C1;
    BRA .return1                                               ;83B190|8028    |83B1BA;
 
 
.label4:
    REP #$30                                                   ;83B192|C230    |      ;
    LDA.B strcPlayer.newX                                      ;83B194|A5E5    |0000E5;
    BNE +                                                      ;83B196|D005    |83B19D;
    LDA.W #$0008                                               ;83B198|A90800  |      ;
    STA.B strcVariables.n16Unk8E                               ;83B19B|858E    |00008E;
 
  + LDA.B strcVariables.n16Unk88                               ;83B19D|A588    |000088;
    AND.W #$0008                                               ;83B19F|290800  |      ;
    BNE .return0                                               ;83B1A2|D01D    |83B1C1;
    BRA .return1                                               ;83B1A4|8014    |83B1BA;
 
 
.label5:
    REP #$30                                                   ;83B1A6|C230    |      ;
    LDA.B strcPlayer.newX                                      ;83B1A8|A5E5    |0000E5;
    BNE +                                                      ;83B1AA|D005    |83B1B1;
    LDA.W #$0008                                               ;83B1AC|A90800  |      ;
    STA.B strcVariables.n16Unk90                               ;83B1AF|8590    |000090;
 
  + LDA.B strcVariables.n16Unk88                               ;83B1B1|A588    |000088;
    AND.W #$0008                                               ;83B1B3|290800  |      ;
    BEQ .return0                                               ;83B1B6|F009    |83B1C1;
    BRA .return1                                               ;83B1B8|8000    |83B1BA;
 
 
.return1:
    REP #$30                                                   ;83B1BA|C230    |      ;
    LDA.W #$0001                                               ;83B1BC|A90100  |      ;
    BRA .justReturn                                            ;83B1BF|8007    |83B1C8;
 
 
.return0:
    REP #$30                                                   ;83B1C1|C230    |      ;
    LDA.W #$0000                                               ;83B1C3|A90000  |      ;
    BRA .justReturn                                            ;83B1C6|8000    |83B1C8;
 
 
.justReturn:
    RTS                                                        ;83B1C8|60      |      ;
 
 
fGameEngine_AddProfit:
    REP #$30                                                   ;83B1C9|C230    |      ; $72: nProfit24, return A: nStatus
    LDA.L nMoney                                               ;83B1CB|AF041F7F|7F1F04;
    CLC                                                        ;83B1CF|18      |      ;
    ADC.B ptrTemp0x72                                          ;83B1D0|6572    |000072;
    STA.B ptrUnknown0x75                                       ;83B1D2|8575    |000075;
    SEP #$20                                                   ;83B1D4|E220    |      ;
    LDA.L nMoney+2                                             ;83B1D6|AF061F7F|7F1F06;
    ADC.B ptrTemp0x72+2                                        ;83B1DA|6574    |000074;
    STA.B ptrUnknown0x75+2                                     ;83B1DC|8577    |000077;
    BMI .ok                                                    ;83B1DE|3026    |83B206;
    REP #$20                                                   ;83B1E0|C220    |      ;
    LDA.B ptrUnknown0x75                                       ;83B1E2|A575    |000075;
    CMP.W #$423F                                               ;83B1E4|C93F42  |      ;
    SEP #$20                                                   ;83B1E7|E220    |      ;
    LDA.B ptrUnknown0x75+2                                     ;83B1E9|A577    |000077;
    SBC.B #$0F                                                 ;83B1EB|E90F    |      ;
    BCS .max                                                   ;83B1ED|B01E    |83B20D;
    REP #$20                                                   ;83B1EF|C220    |      ;
    LDA.B ptrUnknown0x75                                       ;83B1F1|A575    |000075;
    STA.L nMoney                                               ;83B1F3|8F041F7F|7F1F04;
    SEP #$20                                                   ;83B1F7|E220    |      ;
    LDA.B ptrUnknown0x75+2                                     ;83B1F9|A577    |000077;
    STA.L nMoney+2                                             ;83B1FB|8F061F7F|7F1F06;
    REP #$20                                                   ;83B1FF|C220    |      ;
    LDA.W #$0000                                               ;83B201|A90000  |      ;
    BRA .return                                                ;83B204|801D    |83B223;
 
 
.ok:
    REP #$20                                                   ;83B206|C220    |      ;
    LDA.W #$0001                                               ;83B208|A90100  |      ;
    BRA .return                                                ;83B20B|8016    |83B223;
 
 
.max:
    REP #$20                                                   ;83B20D|C220    |      ;
    LDA.W #$423F                                               ;83B20F|A93F42  |      ;
    STA.L nMoney                                               ;83B212|8F041F7F|7F1F04;
    SEP #$20                                                   ;83B216|E220    |      ;
    LDA.B #$0F                                                 ;83B218|A90F    |      ;
    STA.L nMoney+2                                             ;83B21A|8F061F7F|7F1F06; Max Money is 999 999
    REP #$20                                                   ;83B21E|C220    |      ;
    LDA.W #$0000                                               ;83B220|A90000  |      ;
 
.return:
    RTL                                                        ;83B223|6B      |      ;
 
 
fGameEngine_AddWood:
    REP #$30                                                   ;83B224|C230    |      ; A: nWood, return A: nStatus
    STA.B strcVariables.n16Temp1                               ;83B226|857E    |00007E;
    LDA.L nStoredWood                                          ;83B228|AF0C1F7F|7F1F0C;
    CLC                                                        ;83B22C|18      |      ;
    ADC.B strcVariables.n16Temp1                               ;83B22D|657E    |00007E;
    BMI .ok                                                    ;83B22F|300E    |83B23F;
    CMP.W #$03E7                                               ;83B231|C9E703  |      ;
    BCS .max                                                   ;83B234|B010    |83B246;
    STA.L nStoredWood                                          ;83B236|8F0C1F7F|7F1F0C;
    LDA.W #$0000                                               ;83B23A|A90000  |      ;
    BRA .return                                                ;83B23D|8013    |83B252;
 
 
.ok:
    REP #$20                                                   ;83B23F|C220    |      ;
    LDA.W #$0001                                               ;83B241|A90100  |      ;
    BRA .return                                                ;83B244|800C    |83B252;
 
 
.max:
    REP #$20                                                   ;83B246|C220    |      ;
    LDA.W #$03E7                                               ;83B248|A9E703  |      ;
    STA.L nStoredWood                                          ;83B24B|8F0C1F7F|7F1F0C; Max Wood is 999
    LDA.W #$0000                                               ;83B24F|A90000  |      ;
 
.return:
    RTL                                                        ;83B252|6B      |      ;
 
 
fGameEngine_AddFeed:
    REP #$30                                                   ;83B253|C230    |      ; A: nFeed, return A: nStatus
    STA.B strcVariables.n16Temp1                               ;83B255|857E    |00007E;
    LDA.L nStoredFeed                                          ;83B257|AF101F7F|7F1F10;
    CLC                                                        ;83B25B|18      |      ;
    ADC.B strcVariables.n16Temp1                               ;83B25C|657E    |00007E;
    BMI .ok                                                    ;83B25E|300E    |83B26E;
    CMP.W #$03E7                                               ;83B260|C9E703  |      ;
    BCS .max                                                   ;83B263|B010    |83B275;
    STA.L nStoredFeed                                          ;83B265|8F101F7F|7F1F10;
    LDA.W #$0000                                               ;83B269|A90000  |      ;
    BRA .return                                                ;83B26C|8013    |83B281;
 
 
.ok:
    REP #$20                                                   ;83B26E|C220    |      ;
    LDA.W #$0001                                               ;83B270|A90100  |      ;
    BRA .return                                                ;83B273|800C    |83B281;
 
 
.max:
    REP #$20                                                   ;83B275|C220    |      ;
    LDA.W #$03E7                                               ;83B277|A9E703  |      ;
    STA.L nStoredFeed                                          ;83B27A|8F101F7F|7F1F10; Max Feed is 999
    LDA.W #$0000                                               ;83B27E|A90000  |      ;
 
.return:
    RTL                                                        ;83B281|6B      |      ;
 
 
fGameEngine_AddHappiness:
    REP #$30                                                   ;83B282|C230    |      ; A: nHappiness, return A: nStatus
    STA.B strcVariables.n16Temp1                               ;83B284|857E    |00007E;
    LDA.L nPlayerHappiness                                     ;83B286|AF331F7F|7F1F33;
    CLC                                                        ;83B28A|18      |      ;
    ADC.B strcVariables.n16Temp1                               ;83B28B|657E    |00007E;
    BMI .ok                                                    ;83B28D|300E    |83B29D;
    CMP.W #$03E7                                               ;83B28F|C9E703  |      ;
    BCS .max                                                   ;83B292|B010    |83B2A4;
    STA.L nPlayerHappiness                                     ;83B294|8F331F7F|7F1F33;
    LDA.W #$0000                                               ;83B298|A90000  |      ;
    BRA .return                                                ;83B29B|8013    |83B2B0;
 
 
.ok:
    REP #$20                                                   ;83B29D|C220    |      ;
    LDA.W #$0001                                               ;83B29F|A90100  |      ;
    BRA .return                                                ;83B2A2|800C    |83B2B0;
 
 
.max:
    REP #$20                                                   ;83B2A4|C220    |      ;
    LDA.W #$03E7                                               ;83B2A6|A9E703  |      ;
    STA.L nPlayerHappiness                                     ;83B2A9|8F331F7F|7F1F33; Max Happiness is 999
    LDA.W #$0000                                               ;83B2AD|A90000  |      ;
 
.return:
    RTL                                                        ;83B2B0|6B      |      ;
 
 
fGameEngine_LoadGame:
    REP #$30                                                   ;83B2B1|C230    |      ; A: nSaveSlot
    PHA                                                        ;83B2B3|48      |      ;
    LDA.W #$0000                                               ;83B2B4|A90000  |      ;
    STA.B ptrTemp0x72                                          ;83B2B7|8572    |000072;
    SEP #$20                                                   ;83B2B9|E220    |      ;
    LDA.B #$70                                                 ;83B2BB|A970    |      ;
    STA.B ptrTemp0x72+2                                        ;83B2BD|8574    |000074;
    REP #$20                                                   ;83B2BF|C220    |      ;
    PLA                                                        ;83B2C1|68      |      ;
    CMP.W #$0000                                               ;83B2C2|C90000  |      ;
    BEQ +                                                      ;83B2C5|F00B    |83B2D2;
    LDA.W #$1000                                               ;83B2C7|A90010  |      ;
    STA.B ptrTemp0x72                                          ;83B2CA|8572    |000072;
    SEP #$20                                                   ;83B2CC|E220    |      ;
    LDA.B #$70                                                 ;83B2CE|A970    |      ;
    STA.B ptrTemp0x72+2                                        ;83B2D0|8574    |000074;
 
  + SEP #$20                                                   ;83B2D2|E220    |      ;
    LDY.W #$0000                                               ;83B2D4|A00000  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83B2D7|B772    |000072;
    STA.L nCurrentYearID                                       ;83B2D9|8F181F7F|7F1F18;
    LDY.W #$0001                                               ;83B2DD|A00100  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83B2E0|B772    |000072;
    STA.L nCurrentSeasonID                                     ;83B2E2|8F191F7F|7F1F19;
    LDY.W #$0002                                               ;83B2E6|A00200  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83B2E9|B772    |000072;
    STA.L nCurrentWeekdayID                                    ;83B2EB|8F1A1F7F|7F1F1A;
    LDY.W #$0003                                               ;83B2EF|A00300  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83B2F2|B772    |000072;
    STA.L nCurrentDay                                          ;83B2F4|8F1B1F7F|7F1F1B;
    LDY.W #$0004                                               ;83B2F8|A00400  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83B2FB|B772    |000072;
    STA.W strcPlayerData.leftGrassSeeds                        ;83B2FD|8D2709  |000927;
    LDY.W #$0005                                               ;83B300|A00500  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83B303|B772    |000072;
    STA.W strcPlayerData.leftCornSeeds                         ;83B305|8D2809  |000928;
    LDY.W #$0006                                               ;83B308|A00600  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83B30B|B772    |000072;
    STA.W strcPlayerData.leftTomatoSeeds                       ;83B30D|8D2909  |000929;
    LDY.W #$0007                                               ;83B310|A00700  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83B313|B772    |000072;
    STA.W strcPlayerData.leftPotatoSeeds                       ;83B315|8D2A09  |00092A;
    LDY.W #$0008                                               ;83B318|A00800  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83B31B|B772    |000072;
    STA.W strcPlayerData.leftTurnipSeeds                       ;83B31D|8D2B09  |00092B;
    LDY.W #$0009                                               ;83B320|A00900  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83B323|B772    |000072;
    STA.W strcPlayerData.leftCowFood                           ;83B325|8D2C09  |00092C;
    LDY.W #$000A                                               ;83B328|A00A00  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83B32B|B772    |000072;
    STA.W strcPlayerData.leftChickenFood                       ;83B32D|8D2D09  |00092D;
    LDY.W #$000B                                               ;83B330|A00B00  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83B333|B772    |000072;
    STA.L nOwnedCows                                           ;83B335|8F0A1F7F|7F1F0A;
    LDY.W #$000C                                               ;83B339|A00C00  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83B33C|B772    |000072;
    STA.L nOwnedChickens                                       ;83B33E|8F0B1F7F|7F1F0B;
    LDY.W #$000D                                               ;83B342|A00D00  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83B345|B772    |000072;
    STA.W nWeatherForecast                                     ;83B347|8D8C09  |00098C;
    LDY.W #$000E                                               ;83B34A|A00E00  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83B34D|B772    |000072;
    STA.W strcPlayerData.stamina                               ;83B34F|8D1709  |000917;
    LDY.W #$000F                                               ;83B352|A00F00  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83B355|B772    |000072;
    STA.W strcPlayerData.toolEquipped                          ;83B357|8D2109  |000921;
    LDY.W #$0010                                               ;83B35A|A01000  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83B35D|B772    |000072;
    STA.W strcPlayerData.leftWater                             ;83B35F|8D2609  |000926;
    LDY.W #$0011                                               ;83B362|A01100  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83B365|B772    |000072;
    STA.L nCowPregnacyDays                                     ;83B367|8F121F7F|7F1F12;
    LDY.W #$0012                                               ;83B36B|A01200  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83B36E|B772    |000072;
    STA.L nNewBornCowAffection                                 ;83B370|8F2B1F7F|7F1F2B;
    LDY.W #$0013                                               ;83B374|A01300  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83B377|B772    |000072;
    STA.L nDogAreaId                                           ;83B379|8F301F7F|7F1F30;
    LDY.W #$0014                                               ;83B37D|A01400  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83B380|B772    |000072;
    STA.L nHorseAreaIdMaybe                                    ;83B382|8F311F7F|7F1F31;
    LDY.W #$0015                                               ;83B386|A01500  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83B389|B772    |000072;
    STA.L nHorseAge                                            ;83B38B|8F321F7F|7F1F32;
    LDY.W #$0016                                               ;83B38F|A01600  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83B392|B772    |000072;
    STA.L nConstructionDayCounter                              ;83B394|8F351F7F|7F1F35;
    LDY.W #$0017                                               ;83B398|A01700  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83B39B|B772    |000072;
    STA.L nPowerBerryEaten                                     ;83B39D|8F361F7F|7F1F36;
    LDY.W #$0018                                               ;83B3A1|A01800  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83B3A4|B772    |000072;
    STA.W $09A3                                                ;83B3A6|8DA309  |0009A3;
    LDY.W #$0019                                               ;83B3A9|A01900  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83B3AC|B772    |000072;
    STA.W strcStockData.unkCow                                 ;83B3AE|8D3709  |000937;
    LDY.W #$001A                                               ;83B3B1|A01A00  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83B3B4|B772    |000072;
    STA.W strcPlayerData.toolSecond                            ;83B3B6|8D2309  |000923;
    REP #$20                                                   ;83B3B9|C220    |      ;
    LDY.W #$0040                                               ;83B3BB|A04000  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83B3BE|B772    |000072;
    STA.L nStoredWood                                          ;83B3C0|8F0C1F7F|7F1F0C;
    LDY.W #$0042                                               ;83B3C4|A04200  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83B3C7|B772    |000072;
    STA.L nStoredFeed                                          ;83B3C9|8F101F7F|7F1F10;
    LDY.W #$0044                                               ;83B3CD|A04400  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83B3D0|B772    |000072;
    STA.W strcDialogDisplay.mapFlags                           ;83B3D2|8D9601  |000196;
    LDY.W #$0046                                               ;83B3D5|A04600  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83B3D8|B772    |000072;
    STA.L nPlantedGrassCount                                   ;83B3DA|8F291F7F|7F1F29;
    LDY.W #$0048                                               ;83B3DE|A04800  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83B3E1|B772    |000072;
    STA.L nLove_Maria                                          ;83B3E3|8F1F1F7F|7F1F1F;
    LDY.W #$004A                                               ;83B3E7|A04A00  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83B3EA|B772    |000072;
    STA.L nLove_Ann                                            ;83B3EC|8F211F7F|7F1F21;
    LDY.W #$004C                                               ;83B3F0|A04C00  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83B3F3|B772    |000072;
    STA.L nLove_Nina                                           ;83B3F5|8F231F7F|7F1F23;
    LDY.W #$004E                                               ;83B3F9|A04E00  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83B3FC|B772    |000072;
    STA.L nLove_Ellen                                          ;83B3FE|8F251F7F|7F1F25;
    LDY.W #$0050                                               ;83B402|A05000  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83B405|B772    |000072;
    STA.L nLove_Eve                                            ;83B407|8F271F7F|7F1F27;
    LDY.W #$0060                                               ;83B40B|A06000  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83B40E|B772    |000072;
    STA.L strcFlags.event1                                     ;83B410|8F641F7F|7F1F64;
    LDY.W #$0062                                               ;83B414|A06200  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83B417|B772    |000072;
    STA.L strcFlags.event2                                     ;83B419|8F661F7F|7F1F66;
    LDY.W #$0064                                               ;83B41D|A06400  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83B420|B772    |000072;
    STA.L strcFlags.event3                                     ;83B422|8F681F7F|7F1F68;
    LDY.W #$0066                                               ;83B426|A06600  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83B429|B772    |000072;
    STA.L strcFlags.event4                                     ;83B42B|8F6A1F7F|7F1F6A;
    LDY.W #$0068                                               ;83B42F|A06800  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83B432|B772    |000072;
    STA.L nDogX                                                ;83B434|8F2C1F7F|7F1F2C;
    LDY.W #$006A                                               ;83B438|A06A00  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83B43B|B772    |000072;
    STA.L nDogY                                                ;83B43D|8F2E1F7F|7F1F2E;
    LDY.W #$006C                                               ;83B441|A06C00  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83B444|B772    |000072;
    STA.L nPlayerHappiness                                     ;83B446|8F331F7F|7F1F33;
    LDY.W #$006E                                               ;83B44A|A06E00  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83B44D|B772    |000072;
    STA.L nEggInCoopFlags                                      ;83B44F|8F451F7F|7F1F45;
    LDY.W #$0070                                               ;83B453|A07000  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83B456|B772    |000072;
    STA.L strcFlags.event5                                     ;83B458|8F6C1F7F|7F1F6C;
    LDY.W #$0072                                               ;83B45C|A07200  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83B45F|B772    |000072;
    STA.L strcFlags.event6                                     ;83B461|8F6E1F7F|7F1F6E;
    LDY.W #$0074                                               ;83B465|A07400  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83B468|B772    |000072;
    STA.L strcFlags.event7                                     ;83B46A|8F701F7F|7F1F70;
    LDY.W #$0076                                               ;83B46E|A07600  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83B471|B772    |000072;
    STA.L strcFlags.event8                                     ;83B473|8F721F7F|7F1F72;
    LDY.W #$0078                                               ;83B477|A07800  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83B47A|B772    |000072;
    STA.L nMarriedDaysCounter                                  ;83B47C|8F3B1F7F|7F1F3B;
    LDY.W #$007A                                               ;83B480|A07A00  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83B483|B772    |000072;
    STA.L nFirstChildAge                                       ;83B485|8F371F7F|7F1F37;
    LDY.W #$007C                                               ;83B489|A07C00  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83B48C|B772    |000072;
    STA.L nSecondChildAge                                      ;83B48E|8F391F7F|7F1F39;
    LDY.W #$0031                                               ;83B492|A03100  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83B495|B772    |000072;
    STA.L nStatShippedCorns                                    ;83B497|8F4A1F7F|7F1F4A;
    LDY.W #$0033                                               ;83B49B|A03300  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83B49E|B772    |000072;
    STA.L nStatShippedTomatoes                                 ;83B4A0|8F4C1F7F|7F1F4C;
    LDY.W #$0035                                               ;83B4A4|A03500  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83B4A7|B772    |000072;
    STA.L nStatShippedTurnips                                  ;83B4A9|8F4E1F7F|7F1F4E;
    LDY.W #$0037                                               ;83B4AD|A03700  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83B4B0|B772    |000072;
    STA.L nStatShippedPotatoes                                 ;83B4B2|8F501F7F|7F1F50;
    LDY.W #$007E                                               ;83B4B6|A07E00  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83B4B9|B772    |000072;
    STA.L nDogHugs                                             ;83B4BB|8F521F7F|7F1F52;
    REP #$20                                                   ;83B4BF|C220    |      ;
    LDY.W #$0039                                               ;83B4C1|A03900  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83B4C4|B772    |000072;
    STA.L nMoney                                               ;83B4C6|8F041F7F|7F1F04;
    SEP #$20                                                   ;83B4CA|E220    |      ;
    LDY.W #$003B                                               ;83B4CC|A03B00  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83B4CF|B772    |000072;
    STA.L nMoney+2                                             ;83B4D1|8F061F7F|7F1F06;
    SEP #$20                                                   ;83B4D5|E220    |      ;
    LDA.B #$00                                                 ;83B4D7|A900    |      ;
    XBA                                                        ;83B4D9|EB      |      ;
    LDY.W #$0080                                               ;83B4DA|A08000  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83B4DD|B772    |000072;
    STA.W strcNames.sPlayer                                    ;83B4DF|8D8108  |000881;
    REP #$20                                                   ;83B4E2|C220    |      ;
    STA.W strcNames.wPlayer                                    ;83B4E4|8DD508  |0008D5;
    SEP #$20                                                   ;83B4E7|E220    |      ;
    LDY.W #$0081                                               ;83B4E9|A08100  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83B4EC|B772    |000072;
    STA.W strcNames.sPlayer+1                                  ;83B4EE|8D8208  |000882;
    REP #$20                                                   ;83B4F1|C220    |      ;
    STA.W strcNames.wPlayer+2                                  ;83B4F3|8DD708  |0008D7;
    SEP #$20                                                   ;83B4F6|E220    |      ;
    LDY.W #$0082                                               ;83B4F8|A08200  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83B4FB|B772    |000072;
    STA.W strcNames.sPlayer+2                                  ;83B4FD|8D8308  |000883;
    REP #$20                                                   ;83B500|C220    |      ;
    STA.W strcNames.wPlayer+4                                  ;83B502|8DD908  |0008D9;
    SEP #$20                                                   ;83B505|E220    |      ;
    LDY.W #$0083                                               ;83B507|A08300  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83B50A|B772    |000072;
    STA.W strcNames.sPlayer+3                                  ;83B50C|8D8408  |000884;
    REP #$20                                                   ;83B50F|C220    |      ;
    STA.W strcNames.wPlayer+6                                  ;83B511|8DDB08  |0008DB;
    SEP #$20                                                   ;83B514|E220    |      ;
    LDY.W #$0084                                               ;83B516|A08400  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83B519|B772    |000072;
    STA.L strcShedItems.row1                                   ;83B51B|8F001F7F|7F1F00;
    LDY.W #$0085                                               ;83B51F|A08500  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83B522|B772    |000072;
    STA.L strcShedItems.row2                                   ;83B524|8F011F7F|7F1F01;
    LDY.W #$0086                                               ;83B528|A08600  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83B52B|B772    |000072;
    STA.L strcShedItems.row3                                   ;83B52D|8F021F7F|7F1F02;
    LDY.W #$0087                                               ;83B531|A08700  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83B534|B772    |000072;
    STA.L strcShedItems.row4                                   ;83B536|8F031F7F|7F1F03;
    SEP #$20                                                   ;83B53A|E220    |      ;
    LDA.B #$00                                                 ;83B53C|A900    |      ;
    XBA                                                        ;83B53E|EB      |      ;
    LDY.W #$0088                                               ;83B53F|A08800  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83B542|B772    |000072;
    STA.W strcNames.sDog                                       ;83B544|8D9908  |000899;
    REP #$20                                                   ;83B547|C220    |      ;
    STA.W strcNames.wDog                                       ;83B549|8DDD08  |0008DD;
    SEP #$20                                                   ;83B54C|E220    |      ;
    LDY.W #$0089                                               ;83B54E|A08900  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83B551|B772    |000072;
    STA.W strcNames.sDog+1                                     ;83B553|8D9A08  |00089A;
    REP #$20                                                   ;83B556|C220    |      ;
    STA.W strcNames.wDog+2                                     ;83B558|8DDF08  |0008DF;
    SEP #$20                                                   ;83B55B|E220    |      ;
    LDY.W #$008A                                               ;83B55D|A08A00  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83B560|B772    |000072;
    STA.W strcNames.sDog+2                                     ;83B562|8D9B08  |00089B;
    REP #$20                                                   ;83B565|C220    |      ;
    STA.W strcNames.wDog+4                                     ;83B567|8DE108  |0008E1;
    SEP #$20                                                   ;83B56A|E220    |      ;
    LDY.W #$008B                                               ;83B56C|A08B00  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83B56F|B772    |000072;
    STA.W strcNames.sDog+3                                     ;83B571|8D9C08  |00089C;
    REP #$20                                                   ;83B574|C220    |      ;
    STA.W strcNames.wDog+6                                     ;83B576|8DE308  |0008E3;
    SEP #$20                                                   ;83B579|E220    |      ;
    LDA.B #$00                                                 ;83B57B|A900    |      ;
    XBA                                                        ;83B57D|EB      |      ;
    LDY.W #$008C                                               ;83B57E|A08C00  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83B581|B772    |000072;
    STA.W strcNames.sHorse                                     ;83B583|8D9D08  |00089D;
    REP #$20                                                   ;83B586|C220    |      ;
    STA.W strcNames.wHorse                                     ;83B588|8DE508  |0008E5;
    SEP #$20                                                   ;83B58B|E220    |      ;
    LDY.W #$008D                                               ;83B58D|A08D00  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83B590|B772    |000072;
    STA.W strcNames.sHorse+1                                   ;83B592|8D9E08  |00089E;
    REP #$20                                                   ;83B595|C220    |      ;
    STA.W strcNames.wHorse+2                                   ;83B597|8DE708  |0008E7;
    SEP #$20                                                   ;83B59A|E220    |      ;
    LDY.W #$008E                                               ;83B59C|A08E00  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83B59F|B772    |000072;
    STA.W strcNames.sHorse+2                                   ;83B5A1|8D9F08  |00089F;
    REP #$20                                                   ;83B5A4|C220    |      ;
    STA.W strcNames.wHorse+4                                   ;83B5A6|8DE908  |0008E9;
    SEP #$20                                                   ;83B5A9|E220    |      ;
    LDY.W #$008F                                               ;83B5AB|A08F00  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83B5AE|B772    |000072;
    STA.W strcNames.sHorse+3                                   ;83B5B0|8DA008  |0008A0;
    REP #$20                                                   ;83B5B3|C220    |      ;
    STA.W strcNames.wHorse+6                                   ;83B5B5|8DEB08  |0008EB;
    SEP #$20                                                   ;83B5B8|E220    |      ;
    LDA.B #$00                                                 ;83B5BA|A900    |      ;
    XBA                                                        ;83B5BC|EB      |      ;
    LDY.W #$0090                                               ;83B5BD|A09000  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83B5C0|B772    |000072;
    STA.L sFirstChildNameShort                                 ;83B5C2|8F3D1F7F|7F1F3D;
    REP #$20                                                   ;83B5C6|C220    |      ;
    STA.W strcNames.wFirstChild                                ;83B5C8|8DED08  |0008ED;
    SEP #$20                                                   ;83B5CB|E220    |      ;
    LDY.W #$0091                                               ;83B5CD|A09100  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83B5D0|B772    |000072;
    STA.L sFirstChildNameShort+1                               ;83B5D2|8F3E1F7F|7F1F3E;
    REP #$20                                                   ;83B5D6|C220    |      ;
    STA.W strcNames.wFirstChild+2                              ;83B5D8|8DEF08  |0008EF;
    SEP #$20                                                   ;83B5DB|E220    |      ;
    LDY.W #$0092                                               ;83B5DD|A09200  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83B5E0|B772    |000072;
    STA.L sFirstChildNameShort+2                               ;83B5E2|8F3F1F7F|7F1F3F;
    REP #$20                                                   ;83B5E6|C220    |      ;
    STA.W strcNames.wFirstChild+4                              ;83B5E8|8DF108  |0008F1;
    SEP #$20                                                   ;83B5EB|E220    |      ;
    LDY.W #$0093                                               ;83B5ED|A09300  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83B5F0|B772    |000072;
    STA.L sFirstChildNameShort+3                               ;83B5F2|8F401F7F|7F1F40;
    REP #$20                                                   ;83B5F6|C220    |      ;
    STA.W strcNames.wFirstChild+6                              ;83B5F8|8DF308  |0008F3;
    SEP #$20                                                   ;83B5FB|E220    |      ;
    LDA.B #$00                                                 ;83B5FD|A900    |      ;
    XBA                                                        ;83B5FF|EB      |      ;
    LDY.W #$0094                                               ;83B600|A09400  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83B603|B772    |000072;
    STA.L sSecondChildNameShort                                ;83B605|8F411F7F|7F1F41;
    REP #$20                                                   ;83B609|C220    |      ;
    STA.W strcNames.wSecondChild                               ;83B60B|8DF508  |0008F5;
    SEP #$20                                                   ;83B60E|E220    |      ;
    LDY.W #$0095                                               ;83B610|A09500  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83B613|B772    |000072;
    STA.L sSecondChildNameShort+1                              ;83B615|8F421F7F|7F1F42;
    REP #$20                                                   ;83B619|C220    |      ;
    STA.W strcNames.wSecondChild+2                             ;83B61B|8DF708  |0008F7;
    SEP #$20                                                   ;83B61E|E220    |      ;
    LDY.W #$0096                                               ;83B620|A09600  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83B623|B772    |000072;
    STA.L sSecondChildNameShort+2                              ;83B625|8F431F7F|7F1F43;
    REP #$20                                                   ;83B629|C220    |      ;
    STA.W strcNames.wSecondChild+4                             ;83B62B|8DF908  |0008F9;
    SEP #$20                                                   ;83B62E|E220    |      ;
    LDY.W #$0097                                               ;83B630|A09700  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83B633|B772    |000072;
    STA.L sSecondChildNameShort+3                              ;83B635|8F441F7F|7F1F44;
    REP #$20                                                   ;83B639|C220    |      ;
    STA.W strcNames.wSecondChild+6                             ;83B63B|8DFB08  |0008FB;
    SEP #$20                                                   ;83B63E|E220    |      ;
    LDY.W #$0098                                               ;83B640|A09800  |      ;
    LDX.W #$0000                                               ;83B643|A20000  |      ;
 
  - LDA.B [ptrTemp0x72],Y                                      ;83B646|B772    |000072; loop chicken data
    STA.L strcChickenData,X                                    ;83B648|9F86C27E|7EC286;
    INY                                                        ;83B64C|C8      |      ;
    INX                                                        ;83B64D|E8      |      ;
    CPX.W #$0068                                               ;83B64E|E06800  |      ;
    BNE -                                                      ;83B651|D0F3    |83B646;
    SEP #$20                                                   ;83B653|E220    |      ;
    LDY.W #$0100                                               ;83B655|A00001  |      ;
    LDX.W #$0000                                               ;83B658|A20000  |      ;
 
  - LDA.B [ptrTemp0x72],Y                                      ;83B65B|B772    |000072; loop cow data
    STA.L strcCowData,X                                        ;83B65D|9FC6C17E|7EC1C6;
    INY                                                        ;83B661|C8      |      ;
    INX                                                        ;83B662|E8      |      ;
    CPX.W #$00C0                                               ;83B663|E0C000  |      ;
    BNE -                                                      ;83B666|D0F3    |83B65B;
    REP #$20                                                   ;83B668|C220    |      ;
    LDA.B ptrTemp0x72                                          ;83B66A|A572    |000072;
    STA.B ptrUnknown0x75                                       ;83B66C|8575    |000075;
    SEP #$20                                                   ;83B66E|E220    |      ;
    LDA.B ptrTemp0x72+2                                        ;83B670|A574    |000074;
    STA.B ptrUnknown0x75+2                                     ;83B672|8577    |000077;
    JSL.L fObjectMap_LoadDefaultFarm                           ;83B674|225AA682|82A65A;
    SEP #$20                                                   ;83B678|E220    |      ;
    LDY.W #$01C0                                               ;83B67A|A0C001  |      ;
    LDX.W #$00C0                                               ;83B67D|A2C000  |      ;
 
  - LDA.B [ptrUnknown0x75],Y                                   ;83B680|B775    |000075; loop farm tilemap
    STA.L sFarmTilemap,X                                       ;83B682|9FE6A47E|7EA4E6;
    INY                                                        ;83B686|C8      |      ;
    INX                                                        ;83B687|E8      |      ;
    CPX.W #$0F00                                               ;83B688|E0000F  |      ;
    BNE -                                                      ;83B68B|D0F3    |83B680;
    RTL                                                        ;83B68D|6B      |      ;
 
 
fGameEngine_SaveGame:
    REP #$30                                                   ;83B68E|C230    |      ; A: nSaveSlot, return A: nStatus
    PHA                                                        ;83B690|48      |      ;
    LDA.W #$0000                                               ;83B691|A90000  |      ;
    STA.B ptrTemp0x72                                          ;83B694|8572    |000072;
    SEP #$20                                                   ;83B696|E220    |      ;
    LDA.B #$70                                                 ;83B698|A970    |      ;
    STA.B ptrTemp0x72+2                                        ;83B69A|8574    |000074;
    REP #$20                                                   ;83B69C|C220    |      ;
    PLA                                                        ;83B69E|68      |      ;
    PHA                                                        ;83B69F|48      |      ;
    CMP.W #$0000                                               ;83B6A0|C90000  |      ;
    BEQ +                                                      ;83B6A3|F00B    |83B6B0;
    LDA.W #$1000                                               ;83B6A5|A90010  |      ;
    STA.B ptrTemp0x72                                          ;83B6A8|8572    |000072;
    SEP #$20                                                   ;83B6AA|E220    |      ;
    LDA.B #$70                                                 ;83B6AC|A970    |      ;
    STA.B ptrTemp0x72+2                                        ;83B6AE|8574    |000074;
 
  + SEP #$20                                                   ;83B6B0|E220    |      ;
    LDY.W #$0000                                               ;83B6B2|A00000  |      ;
    LDA.L nCurrentYearID                                       ;83B6B5|AF181F7F|7F1F18;
    STA.B [ptrTemp0x72],Y                                      ;83B6B9|9772    |000072;
    LDY.W #$0001                                               ;83B6BB|A00100  |      ;
    LDA.L nCurrentSeasonID                                     ;83B6BE|AF191F7F|7F1F19;
    STA.B [ptrTemp0x72],Y                                      ;83B6C2|9772    |000072;
    LDY.W #$0002                                               ;83B6C4|A00200  |      ;
    LDA.L nCurrentWeekdayID                                    ;83B6C7|AF1A1F7F|7F1F1A;
    STA.B [ptrTemp0x72],Y                                      ;83B6CB|9772    |000072;
    LDY.W #$0003                                               ;83B6CD|A00300  |      ;
    LDA.L nCurrentDay                                          ;83B6D0|AF1B1F7F|7F1F1B;
    STA.B [ptrTemp0x72],Y                                      ;83B6D4|9772    |000072;
    LDY.W #$0004                                               ;83B6D6|A00400  |      ;
    LDA.W strcPlayerData.leftGrassSeeds                        ;83B6D9|AD2709  |000927;
    STA.B [ptrTemp0x72],Y                                      ;83B6DC|9772    |000072;
    LDY.W #$0005                                               ;83B6DE|A00500  |      ;
    LDA.W strcPlayerData.leftCornSeeds                         ;83B6E1|AD2809  |000928;
    STA.B [ptrTemp0x72],Y                                      ;83B6E4|9772    |000072;
    LDY.W #$0006                                               ;83B6E6|A00600  |      ;
    LDA.W strcPlayerData.leftTomatoSeeds                       ;83B6E9|AD2909  |000929;
    STA.B [ptrTemp0x72],Y                                      ;83B6EC|9772    |000072;
    LDY.W #$0007                                               ;83B6EE|A00700  |      ;
    LDA.W strcPlayerData.leftPotatoSeeds                       ;83B6F1|AD2A09  |00092A;
    STA.B [ptrTemp0x72],Y                                      ;83B6F4|9772    |000072;
    LDY.W #$0008                                               ;83B6F6|A00800  |      ;
    LDA.W strcPlayerData.leftTurnipSeeds                       ;83B6F9|AD2B09  |00092B;
    STA.B [ptrTemp0x72],Y                                      ;83B6FC|9772    |000072;
    LDY.W #$0009                                               ;83B6FE|A00900  |      ;
    LDA.W strcPlayerData.leftCowFood                           ;83B701|AD2C09  |00092C;
    STA.B [ptrTemp0x72],Y                                      ;83B704|9772    |000072;
    LDY.W #$000A                                               ;83B706|A00A00  |      ;
    LDA.W strcPlayerData.leftChickenFood                       ;83B709|AD2D09  |00092D;
    STA.B [ptrTemp0x72],Y                                      ;83B70C|9772    |000072;
    LDY.W #$000B                                               ;83B70E|A00B00  |      ;
    LDA.L nOwnedCows                                           ;83B711|AF0A1F7F|7F1F0A;
    STA.B [ptrTemp0x72],Y                                      ;83B715|9772    |000072;
    LDY.W #$000C                                               ;83B717|A00C00  |      ;
    LDA.L nOwnedChickens                                       ;83B71A|AF0B1F7F|7F1F0B;
    STA.B [ptrTemp0x72],Y                                      ;83B71E|9772    |000072;
    LDY.W #$000D                                               ;83B720|A00D00  |      ;
    LDA.W nWeatherForecast                                     ;83B723|AD8C09  |00098C;
    STA.B [ptrTemp0x72],Y                                      ;83B726|9772    |000072;
    LDY.W #$000E                                               ;83B728|A00E00  |      ;
    LDA.W strcPlayerData.stamina                               ;83B72B|AD1709  |000917;
    STA.B [ptrTemp0x72],Y                                      ;83B72E|9772    |000072;
    LDY.W #$000F                                               ;83B730|A00F00  |      ;
    LDA.W strcPlayerData.toolEquipped                          ;83B733|AD2109  |000921;
    STA.B [ptrTemp0x72],Y                                      ;83B736|9772    |000072;
    LDY.W #$0010                                               ;83B738|A01000  |      ;
    LDA.W strcPlayerData.leftWater                             ;83B73B|AD2609  |000926;
    STA.B [ptrTemp0x72],Y                                      ;83B73E|9772    |000072;
    LDY.W #$0011                                               ;83B740|A01100  |      ;
    LDA.L nCowPregnacyDays                                     ;83B743|AF121F7F|7F1F12;
    STA.B [ptrTemp0x72],Y                                      ;83B747|9772    |000072;
    LDY.W #$0012                                               ;83B749|A01200  |      ;
    LDA.L nNewBornCowAffection                                 ;83B74C|AF2B1F7F|7F1F2B;
    STA.B [ptrTemp0x72],Y                                      ;83B750|9772    |000072;
    LDY.W #$0013                                               ;83B752|A01300  |      ;
    LDA.L nDogAreaId                                           ;83B755|AF301F7F|7F1F30;
    STA.B [ptrTemp0x72],Y                                      ;83B759|9772    |000072;
    LDY.W #$0014                                               ;83B75B|A01400  |      ;
    LDA.L nHorseAreaIdMaybe                                    ;83B75E|AF311F7F|7F1F31;
    STA.B [ptrTemp0x72],Y                                      ;83B762|9772    |000072;
    LDY.W #$0015                                               ;83B764|A01500  |      ;
    LDA.L nHorseAge                                            ;83B767|AF321F7F|7F1F32;
    STA.B [ptrTemp0x72],Y                                      ;83B76B|9772    |000072;
    LDY.W #$0016                                               ;83B76D|A01600  |      ;
    LDA.L nConstructionDayCounter                              ;83B770|AF351F7F|7F1F35;
    STA.B [ptrTemp0x72],Y                                      ;83B774|9772    |000072;
    LDY.W #$0017                                               ;83B776|A01700  |      ;
    LDA.L nPowerBerryEaten                                     ;83B779|AF361F7F|7F1F36;
    STA.B [ptrTemp0x72],Y                                      ;83B77D|9772    |000072;
    LDY.W #$0018                                               ;83B77F|A01800  |      ;
    LDA.W $09A3                                                ;83B782|ADA309  |0009A3;
    STA.B [ptrTemp0x72],Y                                      ;83B785|9772    |000072;
    LDY.W #$0019                                               ;83B787|A01900  |      ;
    LDA.W strcStockData.unkCow                                 ;83B78A|AD3709  |000937;
    STA.B [ptrTemp0x72],Y                                      ;83B78D|9772    |000072;
    LDY.W #$001A                                               ;83B78F|A01A00  |      ;
    LDA.W strcPlayerData.toolSecond                            ;83B792|AD2309  |000923;
    STA.B [ptrTemp0x72],Y                                      ;83B795|9772    |000072;
    REP #$20                                                   ;83B797|C220    |      ;
    LDY.W #$0040                                               ;83B799|A04000  |      ;
    LDA.L nStoredWood                                          ;83B79C|AF0C1F7F|7F1F0C;
    STA.B [ptrTemp0x72],Y                                      ;83B7A0|9772    |000072;
    LDY.W #$0042                                               ;83B7A2|A04200  |      ;
    LDA.L nStoredFeed                                          ;83B7A5|AF101F7F|7F1F10;
    STA.B [ptrTemp0x72],Y                                      ;83B7A9|9772    |000072;
    LDY.W #$0044                                               ;83B7AB|A04400  |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;83B7AE|AD9601  |000196;
    STA.B [ptrTemp0x72],Y                                      ;83B7B1|9772    |000072;
    LDY.W #$0046                                               ;83B7B3|A04600  |      ;
    LDA.L nPlantedGrassCount                                   ;83B7B6|AF291F7F|7F1F29;
    STA.B [ptrTemp0x72],Y                                      ;83B7BA|9772    |000072;
    LDY.W #$0048                                               ;83B7BC|A04800  |      ;
    LDA.L nLove_Maria                                          ;83B7BF|AF1F1F7F|7F1F1F;
    STA.B [ptrTemp0x72],Y                                      ;83B7C3|9772    |000072;
    LDY.W #$004A                                               ;83B7C5|A04A00  |      ;
    LDA.L nLove_Ann                                            ;83B7C8|AF211F7F|7F1F21;
    STA.B [ptrTemp0x72],Y                                      ;83B7CC|9772    |000072;
    LDY.W #$004C                                               ;83B7CE|A04C00  |      ;
    LDA.L nLove_Nina                                           ;83B7D1|AF231F7F|7F1F23;
    STA.B [ptrTemp0x72],Y                                      ;83B7D5|9772    |000072;
    LDY.W #$004E                                               ;83B7D7|A04E00  |      ;
    LDA.L nLove_Ellen                                          ;83B7DA|AF251F7F|7F1F25;
    STA.B [ptrTemp0x72],Y                                      ;83B7DE|9772    |000072;
    LDY.W #$0050                                               ;83B7E0|A05000  |      ;
    LDA.L nLove_Eve                                            ;83B7E3|AF271F7F|7F1F27;
    STA.B [ptrTemp0x72],Y                                      ;83B7E7|9772    |000072;
    LDY.W #$0060                                               ;83B7E9|A06000  |      ;
    LDA.L strcFlags.event1                                     ;83B7EC|AF641F7F|7F1F64;
    STA.B [ptrTemp0x72],Y                                      ;83B7F0|9772    |000072;
    LDY.W #$0062                                               ;83B7F2|A06200  |      ;
    LDA.L strcFlags.event2                                     ;83B7F5|AF661F7F|7F1F66;
    STA.B [ptrTemp0x72],Y                                      ;83B7F9|9772    |000072;
    LDY.W #$0064                                               ;83B7FB|A06400  |      ;
    LDA.L strcFlags.event3                                     ;83B7FE|AF681F7F|7F1F68;
    STA.B [ptrTemp0x72],Y                                      ;83B802|9772    |000072;
    LDY.W #$0066                                               ;83B804|A06600  |      ;
    LDA.L strcFlags.event4                                     ;83B807|AF6A1F7F|7F1F6A;
    STA.B [ptrTemp0x72],Y                                      ;83B80B|9772    |000072;
    LDY.W #$0068                                               ;83B80D|A06800  |      ;
    LDA.L nDogX                                                ;83B810|AF2C1F7F|7F1F2C;
    STA.B [ptrTemp0x72],Y                                      ;83B814|9772    |000072;
    LDY.W #$006A                                               ;83B816|A06A00  |      ;
    LDA.L nDogY                                                ;83B819|AF2E1F7F|7F1F2E;
    STA.B [ptrTemp0x72],Y                                      ;83B81D|9772    |000072;
    LDY.W #$006C                                               ;83B81F|A06C00  |      ;
    LDA.L nPlayerHappiness                                     ;83B822|AF331F7F|7F1F33;
    STA.B [ptrTemp0x72],Y                                      ;83B826|9772    |000072;
    LDY.W #$006E                                               ;83B828|A06E00  |      ;
    LDA.L nEggInCoopFlags                                      ;83B82B|AF451F7F|7F1F45;
    STA.B [ptrTemp0x72],Y                                      ;83B82F|9772    |000072;
    LDY.W #$0070                                               ;83B831|A07000  |      ;
    LDA.L strcFlags.event5                                     ;83B834|AF6C1F7F|7F1F6C;
    STA.B [ptrTemp0x72],Y                                      ;83B838|9772    |000072;
    LDY.W #$0072                                               ;83B83A|A07200  |      ;
    LDA.L strcFlags.event6                                     ;83B83D|AF6E1F7F|7F1F6E;
    STA.B [ptrTemp0x72],Y                                      ;83B841|9772    |000072;
    LDY.W #$0074                                               ;83B843|A07400  |      ;
    LDA.L strcFlags.event7                                     ;83B846|AF701F7F|7F1F70;
    STA.B [ptrTemp0x72],Y                                      ;83B84A|9772    |000072;
    LDY.W #$0076                                               ;83B84C|A07600  |      ;
    LDA.L strcFlags.event8                                     ;83B84F|AF721F7F|7F1F72;
    STA.B [ptrTemp0x72],Y                                      ;83B853|9772    |000072;
    LDY.W #$0078                                               ;83B855|A07800  |      ;
    LDA.L nMarriedDaysCounter                                  ;83B858|AF3B1F7F|7F1F3B;
    STA.B [ptrTemp0x72],Y                                      ;83B85C|9772    |000072;
    LDY.W #$007A                                               ;83B85E|A07A00  |      ;
    LDA.L nFirstChildAge                                       ;83B861|AF371F7F|7F1F37;
    STA.B [ptrTemp0x72],Y                                      ;83B865|9772    |000072;
    LDY.W #$007C                                               ;83B867|A07C00  |      ;
    LDA.L nSecondChildAge                                      ;83B86A|AF391F7F|7F1F39;
    STA.B [ptrTemp0x72],Y                                      ;83B86E|9772    |000072;
    LDY.W #$0031                                               ;83B870|A03100  |      ;
    LDA.L nStatShippedCorns                                    ;83B873|AF4A1F7F|7F1F4A;
    STA.B [ptrTemp0x72],Y                                      ;83B877|9772    |000072;
    LDY.W #$0033                                               ;83B879|A03300  |      ;
    LDA.L nStatShippedTomatoes                                 ;83B87C|AF4C1F7F|7F1F4C;
    STA.B [ptrTemp0x72],Y                                      ;83B880|9772    |000072;
    LDY.W #$0035                                               ;83B882|A03500  |      ;
    LDA.L nStatShippedTurnips                                  ;83B885|AF4E1F7F|7F1F4E;
    STA.B [ptrTemp0x72],Y                                      ;83B889|9772    |000072;
    LDY.W #$0037                                               ;83B88B|A03700  |      ;
    LDA.L nStatShippedPotatoes                                 ;83B88E|AF501F7F|7F1F50;
    STA.B [ptrTemp0x72],Y                                      ;83B892|9772    |000072;
    LDY.W #$007E                                               ;83B894|A07E00  |      ;
    LDA.L nDogHugs                                             ;83B897|AF521F7F|7F1F52;
    STA.B [ptrTemp0x72],Y                                      ;83B89B|9772    |000072;
    REP #$20                                                   ;83B89D|C220    |      ;
    LDY.W #$0039                                               ;83B89F|A03900  |      ;
    LDA.L nMoney                                               ;83B8A2|AF041F7F|7F1F04;
    STA.B [ptrTemp0x72],Y                                      ;83B8A6|9772    |000072;
    SEP #$20                                                   ;83B8A8|E220    |      ;
    LDY.W #$003B                                               ;83B8AA|A03B00  |      ;
    LDA.L nMoney+2                                             ;83B8AD|AF061F7F|7F1F06;
    STA.B [ptrTemp0x72],Y                                      ;83B8B1|9772    |000072;
    SEP #$20                                                   ;83B8B3|E220    |      ;
    LDY.W #$0080                                               ;83B8B5|A08000  |      ;
    LDA.W strcNames.sPlayer                                    ;83B8B8|AD8108  |000881;
    STA.B [ptrTemp0x72],Y                                      ;83B8BB|9772    |000072;
    LDY.W #$0081                                               ;83B8BD|A08100  |      ;
    LDA.W strcNames.sPlayer+1                                  ;83B8C0|AD8208  |000882;
    STA.B [ptrTemp0x72],Y                                      ;83B8C3|9772    |000072;
    LDY.W #$0082                                               ;83B8C5|A08200  |      ;
    LDA.W strcNames.sPlayer+2                                  ;83B8C8|AD8308  |000883;
    STA.B [ptrTemp0x72],Y                                      ;83B8CB|9772    |000072;
    LDY.W #$0083                                               ;83B8CD|A08300  |      ;
    LDA.W strcNames.sPlayer+3                                  ;83B8D0|AD8408  |000884;
    STA.B [ptrTemp0x72],Y                                      ;83B8D3|9772    |000072;
    SEP #$20                                                   ;83B8D5|E220    |      ;
    LDY.W #$0084                                               ;83B8D7|A08400  |      ;
    LDA.L strcShedItems.row1                                   ;83B8DA|AF001F7F|7F1F00;
    STA.B [ptrTemp0x72],Y                                      ;83B8DE|9772    |000072;
    LDY.W #$0085                                               ;83B8E0|A08500  |      ;
    LDA.L strcShedItems.row2                                   ;83B8E3|AF011F7F|7F1F01;
    STA.B [ptrTemp0x72],Y                                      ;83B8E7|9772    |000072;
    LDY.W #$0086                                               ;83B8E9|A08600  |      ;
    LDA.L strcShedItems.row3                                   ;83B8EC|AF021F7F|7F1F02;
    STA.B [ptrTemp0x72],Y                                      ;83B8F0|9772    |000072;
    LDY.W #$0087                                               ;83B8F2|A08700  |      ;
    LDA.L strcShedItems.row4                                   ;83B8F5|AF031F7F|7F1F03;
    STA.B [ptrTemp0x72],Y                                      ;83B8F9|9772    |000072;
    SEP #$20                                                   ;83B8FB|E220    |      ;
    LDY.W #$0088                                               ;83B8FD|A08800  |      ;
    LDA.W strcNames.sDog                                       ;83B900|AD9908  |000899;
    STA.B [ptrTemp0x72],Y                                      ;83B903|9772    |000072;
    LDY.W #$0089                                               ;83B905|A08900  |      ;
    LDA.W strcNames.sDog+1                                     ;83B908|AD9A08  |00089A;
    STA.B [ptrTemp0x72],Y                                      ;83B90B|9772    |000072;
    LDY.W #$008A                                               ;83B90D|A08A00  |      ;
    LDA.W strcNames.sDog+2                                     ;83B910|AD9B08  |00089B;
    STA.B [ptrTemp0x72],Y                                      ;83B913|9772    |000072;
    LDY.W #$008B                                               ;83B915|A08B00  |      ;
    LDA.W strcNames.sDog+3                                     ;83B918|AD9C08  |00089C;
    STA.B [ptrTemp0x72],Y                                      ;83B91B|9772    |000072;
    SEP #$20                                                   ;83B91D|E220    |      ;
    LDY.W #$008C                                               ;83B91F|A08C00  |      ;
    LDA.W strcNames.sHorse                                     ;83B922|AD9D08  |00089D;
    STA.B [ptrTemp0x72],Y                                      ;83B925|9772    |000072;
    LDY.W #$008D                                               ;83B927|A08D00  |      ;
    LDA.W strcNames.sHorse+1                                   ;83B92A|AD9E08  |00089E;
    STA.B [ptrTemp0x72],Y                                      ;83B92D|9772    |000072;
    LDY.W #$008E                                               ;83B92F|A08E00  |      ;
    LDA.W strcNames.sHorse+2                                   ;83B932|AD9F08  |00089F;
    STA.B [ptrTemp0x72],Y                                      ;83B935|9772    |000072;
    LDY.W #$008F                                               ;83B937|A08F00  |      ;
    LDA.W strcNames.sHorse+3                                   ;83B93A|ADA008  |0008A0;
    STA.B [ptrTemp0x72],Y                                      ;83B93D|9772    |000072;
    SEP #$20                                                   ;83B93F|E220    |      ;
    LDY.W #$0090                                               ;83B941|A09000  |      ;
    LDA.L sFirstChildNameShort                                 ;83B944|AF3D1F7F|7F1F3D;
    STA.B [ptrTemp0x72],Y                                      ;83B948|9772    |000072;
    LDY.W #$0091                                               ;83B94A|A09100  |      ;
    LDA.L sFirstChildNameShort+1                               ;83B94D|AF3E1F7F|7F1F3E;
    STA.B [ptrTemp0x72],Y                                      ;83B951|9772    |000072;
    LDY.W #$0092                                               ;83B953|A09200  |      ;
    LDA.L sFirstChildNameShort+2                               ;83B956|AF3F1F7F|7F1F3F;
    STA.B [ptrTemp0x72],Y                                      ;83B95A|9772    |000072;
    LDY.W #$0093                                               ;83B95C|A09300  |      ;
    LDA.L sFirstChildNameShort+3                               ;83B95F|AF401F7F|7F1F40;
    STA.B [ptrTemp0x72],Y                                      ;83B963|9772    |000072;
    SEP #$20                                                   ;83B965|E220    |      ;
    LDY.W #$0094                                               ;83B967|A09400  |      ;
    LDA.L sSecondChildNameShort                                ;83B96A|AF411F7F|7F1F41;
    STA.B [ptrTemp0x72],Y                                      ;83B96E|9772    |000072;
    LDY.W #$0095                                               ;83B970|A09500  |      ;
    LDA.L sSecondChildNameShort+1                              ;83B973|AF421F7F|7F1F42;
    STA.B [ptrTemp0x72],Y                                      ;83B977|9772    |000072;
    LDY.W #$0096                                               ;83B979|A09600  |      ;
    LDA.L sSecondChildNameShort+2                              ;83B97C|AF431F7F|7F1F43;
    STA.B [ptrTemp0x72],Y                                      ;83B980|9772    |000072;
    LDY.W #$0097                                               ;83B982|A09700  |      ;
    LDA.L sSecondChildNameShort+3                              ;83B985|AF441F7F|7F1F44;
    STA.B [ptrTemp0x72],Y                                      ;83B989|9772    |000072;
    SEP #$20                                                   ;83B98B|E220    |      ;
    LDY.W #$0098                                               ;83B98D|A09800  |      ;
    LDX.W #$0000                                               ;83B990|A20000  |      ;
 
  - LDA.L strcChickenData,X                                    ;83B993|BF86C27E|7EC286; loop chickendata
    STA.B [ptrTemp0x72],Y                                      ;83B997|9772    |000072;
    INY                                                        ;83B999|C8      |      ;
    INX                                                        ;83B99A|E8      |      ;
    CPX.W #$0068                                               ;83B99B|E06800  |      ;
    BNE -                                                      ;83B99E|D0F3    |83B993;
    SEP #$20                                                   ;83B9A0|E220    |      ;
    LDY.W #$0100                                               ;83B9A2|A00001  |      ;
    LDX.W #$0000                                               ;83B9A5|A20000  |      ;
 
  - LDA.L strcCowData,X                                        ;83B9A8|BFC6C17E|7EC1C6; loop cowdata
    STA.B [ptrTemp0x72],Y                                      ;83B9AC|9772    |000072;
    INY                                                        ;83B9AE|C8      |      ;
    INX                                                        ;83B9AF|E8      |      ;
    CPX.W #$00C0                                               ;83B9B0|E0C000  |      ;
    BNE -                                                      ;83B9B3|D0F3    |83B9A8;
    SEP #$20                                                   ;83B9B5|E220    |      ;
    LDY.W #$01C0                                               ;83B9B7|A0C001  |      ;
    LDX.W #$00C0                                               ;83B9BA|A2C000  |      ;
 
  - LDA.L sFarmTilemap,X                                       ;83B9BD|BFE6A47E|7EA4E6; loop farm tilemap
    STA.B [ptrTemp0x72],Y                                      ;83B9C1|9772    |000072;
    INY                                                        ;83B9C3|C8      |      ;
    INX                                                        ;83B9C4|E8      |      ;
    CPX.W #$0F00                                               ;83B9C5|E0000F  |      ;
    BNE -                                                      ;83B9C8|D0F3    |83B9BD;
    SEP #$20                                                   ;83B9CA|E220    |      ;
    LDY.W #$002E                                               ;83B9CC|A02E00  |      ;
    LDA.B #$00                                                 ;83B9CF|A900    |      ;
    STA.B [ptrTemp0x72],Y                                      ;83B9D1|9772    |000072;
    REP #$30                                                   ;83B9D3|C230    |      ;
    LDY.W #$002F                                               ;83B9D5|A02F00  |      ;
    LDA.W #$0000                                               ;83B9D8|A90000  |      ;
    STA.B [ptrTemp0x72],Y                                      ;83B9DB|9772    |000072;
    LDY.W #$0000                                               ;83B9DD|A00000  |      ;
    STZ.B strcVariables.n16Temp1                               ;83B9E0|647E    |00007E;
 
  - LDA.B [ptrTemp0x72],Y                                      ;83B9E2|B772    |000072; calculate checksum
    CLC                                                        ;83B9E4|18      |      ;
    ADC.B strcVariables.n16Temp1                               ;83B9E5|657E    |00007E;
    STA.B strcVariables.n16Temp1                               ;83B9E7|857E    |00007E;
    INY                                                        ;83B9E9|C8      |      ;
    INY                                                        ;83B9EA|C8      |      ;
    CPY.W #$1000                                               ;83B9EB|C00010  |      ;
    BNE -                                                      ;83B9EE|D0F2    |83B9E2;
    REP #$30                                                   ;83B9F0|C230    |      ;
    LDY.W #$002F                                               ;83B9F2|A02F00  |      ;
    LDA.B strcVariables.n16Temp1                               ;83B9F5|A57E    |00007E;
    STA.B [ptrTemp0x72],Y                                      ;83B9F7|9772    |000072;
    REP #$20                                                   ;83B9F9|C220    |      ;
    PLA                                                        ;83B9FB|68      |      ;
    STA.B strcVariables.n16Temp1                               ;83B9FC|857E    |00007E;
    LDA.W #$0000                                               ;83B9FE|A90000  |      ;
    STA.B ptrTemp0x72                                          ;83BA01|8572    |000072;
    SEP #$20                                                   ;83BA03|E220    |      ;
    LDA.B #$70                                                 ;83BA05|A970    |      ;
    STA.B ptrTemp0x72+2                                        ;83BA07|8574    |000074;
    REP #$20                                                   ;83BA09|C220    |      ;
    LDY.W #$002E                                               ;83BA0B|A02E00  |      ;
    LDA.B strcVariables.n16Temp1                               ;83BA0E|A57E    |00007E;
    BEQ .label1                                                ;83BA10|F008    |83BA1A;
    SEP #$20                                                   ;83BA12|E220    |      ;
    LDA.B #$00                                                 ;83BA14|A900    |      ;
    STA.B [ptrTemp0x72],Y                                      ;83BA16|9772    |000072;
    BRA .label2                                                ;83BA18|8006    |83BA20;
 
 
.label1:
    SEP #$20                                                   ;83BA1A|E220    |      ;
    LDA.B #$01                                                 ;83BA1C|A901    |      ;
    STA.B [ptrTemp0x72],Y                                      ;83BA1E|9772    |000072;
 
.label2:
    REP #$20                                                   ;83BA20|C220    |      ;
    LDA.W #$1000                                               ;83BA22|A90010  |      ;
    STA.B ptrTemp0x72                                          ;83BA25|8572    |000072;
    SEP #$20                                                   ;83BA27|E220    |      ;
    LDA.B #$70                                                 ;83BA29|A970    |      ;
    STA.B ptrTemp0x72+2                                        ;83BA2B|8574    |000074;
    REP #$20                                                   ;83BA2D|C220    |      ;
    LDY.W #$002E                                               ;83BA2F|A02E00  |      ;
    LDA.B strcVariables.n16Temp1                               ;83BA32|A57E    |00007E;
    BEQ .return                                                ;83BA34|F008    |83BA3E;
    SEP #$20                                                   ;83BA36|E220    |      ;
    LDA.B #$01                                                 ;83BA38|A901    |      ;
    STA.B [ptrTemp0x72],Y                                      ;83BA3A|9772    |000072;
    BRA .justReturn                                            ;83BA3C|8006    |83BA44;
 
 
.return:
    SEP #$20                                                   ;83BA3E|E220    |      ;
    LDA.B #$00                                                 ;83BA40|A900    |      ;
    STA.B [ptrTemp0x72],Y                                      ;83BA42|9772    |000072;
 
.justReturn:
    RTL                                                        ;83BA44|6B      |      ;
 
 
fGameEngine_LoadContinue:
    REP #$30                                                   ;83BA45|C230    |      ; A: nSaveSlot, return A: nStatus
    PHA                                                        ;83BA47|48      |      ;
    LDA.W #$0000                                               ;83BA48|A90000  |      ;
    STA.B ptrTemp0x72                                          ;83BA4B|8572    |000072;
    SEP #$20                                                   ;83BA4D|E220    |      ;
    LDA.B #$70                                                 ;83BA4F|A970    |      ;
    STA.B ptrTemp0x72+2                                        ;83BA51|8574    |000074;
    REP #$20                                                   ;83BA53|C220    |      ;
    PLA                                                        ;83BA55|68      |      ;
    CMP.W #$0000                                               ;83BA56|C90000  |      ;
    BEQ +                                                      ;83BA59|F00B    |83BA66;
    LDA.W #$1000                                               ;83BA5B|A90010  |      ;
    STA.B ptrTemp0x72                                          ;83BA5E|8572    |000072;
    SEP #$20                                                   ;83BA60|E220    |      ;
    LDA.B #$70                                                 ;83BA62|A970    |      ;
    STA.B ptrTemp0x72+2                                        ;83BA64|8574    |000074;
 
  + SEP #$20                                                   ;83BA66|E220    |      ;
    REP #$10                                                   ;83BA68|C210    |      ;
    LDX.W #$0000                                               ;83BA6A|A20000  |      ;
    LDY.W #$0000                                               ;83BA6D|A00000  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83BA70|B772    |000072;
    STA.L nCurrentYearID                                       ;83BA72|8F181F7F|7F1F18;
    LDY.W #$0001                                               ;83BA76|A00100  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83BA79|B772    |000072;
    STA.L nCurrentSeasonID                                     ;83BA7B|8F191F7F|7F1F19;
    LDY.W #$0003                                               ;83BA7F|A00300  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83BA82|B772    |000072;
    STA.L nCurrentDay                                          ;83BA84|8F1B1F7F|7F1F1B;
    BEQ .return                                                ;83BA88|F049    |83BAD3;
    LDY.W #$003C                                               ;83BA8A|A03C00  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83BA8D|B772    |000072;
    CMP.B #$46                                                 ;83BA8F|C946    |      ;
    BNE .return                                                ;83BA91|D040    |83BAD3;
    LDY.W #$003D                                               ;83BA93|A03D00  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83BA96|B772    |000072;
    CMP.B #$41                                                 ;83BA98|C941    |      ;
    BNE .return                                                ;83BA9A|D037    |83BAD3;
    LDY.W #$003E                                               ;83BA9C|A03E00  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83BA9F|B772    |000072;
    CMP.B #$52                                                 ;83BAA1|C952    |      ;
    BNE .return                                                ;83BAA3|D02E    |83BAD3;
    LDY.W #$003F                                               ;83BAA5|A03F00  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83BAA8|B772    |000072;
    CMP.B #$4D                                                 ;83BAAA|C94D    |      ;
    BNE .return                                                ;83BAAC|D025    |83BAD3;
    SEP #$20                                                   ;83BAAE|E220    |      ;
    LDY.W #$0080                                               ;83BAB0|A08000  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83BAB3|B772    |000072;
    STA.W strcNames.sPlayer                                    ;83BAB5|8D8108  |000881;
    LDY.W #$0081                                               ;83BAB8|A08100  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83BABB|B772    |000072;
    STA.W strcNames.sPlayer+1                                  ;83BABD|8D8208  |000882;
    LDY.W #$0082                                               ;83BAC0|A08200  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83BAC3|B772    |000072;
    STA.W strcNames.sPlayer+2                                  ;83BAC5|8D8308  |000883;
    LDY.W #$0083                                               ;83BAC8|A08300  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83BACB|B772    |000072;
    STA.W strcNames.sPlayer+3                                  ;83BACD|8D8408  |000884;
    LDX.W #$0001                                               ;83BAD0|A20100  |      ;
 
.return:
    RTL                                                        ;83BAD3|6B      |      ;
 
 
fGameEngine_SaveCheck:
    SEP #$20                                                   ;83BAD4|E220    |      ;
    REP #$10                                                   ;83BAD6|C210    |      ;
    STZ.W $098E                                                ;83BAD8|9C8E09  |00098E;
    REP #$20                                                   ;83BADB|C220    |      ;
    %UnsetFlag(daily4, $0800)
    STZ.B strcVariables.n16Temp3                               ;83BAE8|6482    |000082;
    LDA.W #$0000                                               ;83BAEA|A90000  |      ;
    STA.B ptrTemp0x72                                          ;83BAED|8572    |000072;
    SEP #$20                                                   ;83BAEF|E220    |      ;
    LDA.B #$70                                                 ;83BAF1|A970    |      ;
    STA.B ptrTemp0x72+2                                        ;83BAF3|8574    |000074;
    LDY.W #$003C                                               ;83BAF5|A03C00  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83BAF8|B772    |000072;
    CMP.B #$46                                                 ;83BAFA|C946    |      ;
    BNE .label1                                                ;83BAFC|D063    |83BB61;
    LDY.W #$003D                                               ;83BAFE|A03D00  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83BB01|B772    |000072;
    CMP.B #$41                                                 ;83BB03|C941    |      ;
    BNE .label1                                                ;83BB05|D05A    |83BB61;
    LDY.W #$003E                                               ;83BB07|A03E00  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83BB0A|B772    |000072;
    CMP.B #$52                                                 ;83BB0C|C952    |      ;
    BNE .label1                                                ;83BB0E|D051    |83BB61;
    LDY.W #$003F                                               ;83BB10|A03F00  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83BB13|B772    |000072;
    CMP.B #$4D                                                 ;83BB15|C94D    |      ;
    BNE .label1                                                ;83BB17|D048    |83BB61;
    SEP #$20                                                   ;83BB19|E220    |      ;
    LDY.W #$002E                                               ;83BB1B|A02E00  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83BB1E|B772    |000072;
    STA.B strcVariables.n8Temp1                                ;83BB20|8592    |000092;
    LDA.B #$00                                                 ;83BB22|A900    |      ;
    STA.B [ptrTemp0x72],Y                                      ;83BB24|9772    |000072;
    REP #$30                                                   ;83BB26|C230    |      ;
    LDY.W #$002F                                               ;83BB28|A02F00  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83BB2B|B772    |000072;
    STA.B strcVariables.n16Temp1                               ;83BB2D|857E    |00007E;
    LDA.W #$0000                                               ;83BB2F|A90000  |      ;
    STA.B [ptrTemp0x72],Y                                      ;83BB32|9772    |000072;
    LDY.W #$0000                                               ;83BB34|A00000  |      ;
    STZ.B strcVariables.n16Temp2                               ;83BB37|6480    |000080;
 
  - LDA.B [ptrTemp0x72],Y                                      ;83BB39|B772    |000072;
    CLC                                                        ;83BB3B|18      |      ;
    ADC.B strcVariables.n16Temp2                               ;83BB3C|6580    |000080;
    STA.B strcVariables.n16Temp2                               ;83BB3E|8580    |000080;
    INY                                                        ;83BB40|C8      |      ;
    INY                                                        ;83BB41|C8      |      ;
    CPY.W #$1000                                               ;83BB42|C00010  |      ;
    BNE -                                                      ;83BB45|D0F2    |83BB39;
    REP #$30                                                   ;83BB47|C230    |      ;
    LDA.B strcVariables.n16Temp1                               ;83BB49|A57E    |00007E;
    CMP.B strcVariables.n16Temp2                               ;83BB4B|C580    |000080;
    BNE .label1                                                ;83BB4D|D012    |83BB61;
    LDY.W #$002F                                               ;83BB4F|A02F00  |      ;
    LDA.B strcVariables.n16Temp1                               ;83BB52|A57E    |00007E;
    STA.B [ptrTemp0x72],Y                                      ;83BB54|9772    |000072;
    SEP #$20                                                   ;83BB56|E220    |      ;
    LDY.W #$002E                                               ;83BB58|A02E00  |      ;
    LDA.B strcVariables.n8Temp1                                ;83BB5B|A592    |000092;
    STA.B [ptrTemp0x72],Y                                      ;83BB5D|9772    |000072;
    BRA .label2                                                ;83BB5F|8036    |83BB97;
 
 
.label1:
    REP #$30                                                   ;83BB61|C230    |      ;
    LDY.W #$0000                                               ;83BB63|A00000  |      ;
    LDA.W #$0000                                               ;83BB66|A90000  |      ;
 
  - STA.B [ptrTemp0x72],Y                                      ;83BB69|9772    |000072; zero loop
    INY                                                        ;83BB6B|C8      |      ;
    INY                                                        ;83BB6C|C8      |      ;
    CPY.W #$0800                                               ;83BB6D|C00008  |      ;
    BNE -                                                      ;83BB70|D0F7    |83BB69;
    SEP #$20                                                   ;83BB72|E220    |      ;
    LDY.W #$003C                                               ;83BB74|A03C00  |      ;
    LDA.B #$46                                                 ;83BB77|A946    |      ;
    STA.B [ptrTemp0x72],Y                                      ;83BB79|9772    |000072;
    LDY.W #$003D                                               ;83BB7B|A03D00  |      ;
    LDA.B #$41                                                 ;83BB7E|A941    |      ;
    STA.B [ptrTemp0x72],Y                                      ;83BB80|9772    |000072;
    LDY.W #$003E                                               ;83BB82|A03E00  |      ;
    LDA.B #$52                                                 ;83BB85|A952    |      ;
    STA.B [ptrTemp0x72],Y                                      ;83BB87|9772    |000072;
    LDY.W #$003F                                               ;83BB89|A03F00  |      ;
    LDA.B #$4D                                                 ;83BB8C|A94D    |      ;
    STA.B [ptrTemp0x72],Y                                      ;83BB8E|9772    |000072;
    REP #$20                                                   ;83BB90|C220    |      ;
    LDA.W #$0001                                               ;83BB92|A90100  |      ;
    STA.B strcVariables.n16Temp3                               ;83BB95|8582    |000082;
 
.label2:
    REP #$30                                                   ;83BB97|C230    |      ;
    LDA.W #$1000                                               ;83BB99|A90010  |      ;
    STA.B ptrTemp0x72                                          ;83BB9C|8572    |000072;
    SEP #$20                                                   ;83BB9E|E220    |      ;
    LDA.B #$70                                                 ;83BBA0|A970    |      ;
    STA.B ptrTemp0x72+2                                        ;83BBA2|8574    |000074;
    LDY.W #$003C                                               ;83BBA4|A03C00  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83BBA7|B772    |000072;
    CMP.B #$46                                                 ;83BBA9|C946    |      ;
    BNE .label3                                                ;83BBAB|D06C    |83BC19;
    LDY.W #$003D                                               ;83BBAD|A03D00  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83BBB0|B772    |000072;
    CMP.B #$41                                                 ;83BBB2|C941    |      ;
    BNE .label3                                                ;83BBB4|D063    |83BC19;
    LDY.W #$003E                                               ;83BBB6|A03E00  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83BBB9|B772    |000072;
    CMP.B #$52                                                 ;83BBBB|C952    |      ;
    BNE .label3                                                ;83BBBD|D05A    |83BC19;
    LDY.W #$003F                                               ;83BBBF|A03F00  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83BBC2|B772    |000072;
    CMP.B #$4D                                                 ;83BBC4|C94D    |      ;
    BNE .label3                                                ;83BBC6|D051    |83BC19;
    SEP #$20                                                   ;83BBC8|E220    |      ;
    LDY.W #$002E                                               ;83BBCA|A02E00  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83BBCD|B772    |000072;
    STA.B strcVariables.n8Temp1                                ;83BBCF|8592    |000092;
    LDA.B #$00                                                 ;83BBD1|A900    |      ;
    STA.B [ptrTemp0x72],Y                                      ;83BBD3|9772    |000072;
    REP #$30                                                   ;83BBD5|C230    |      ;
    LDY.W #$002F                                               ;83BBD7|A02F00  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83BBDA|B772    |000072;
    STA.B strcVariables.n16Temp1                               ;83BBDC|857E    |00007E;
    LDA.W #$0000                                               ;83BBDE|A90000  |      ;
    STA.B [ptrTemp0x72],Y                                      ;83BBE1|9772    |000072;
    LDY.W #$0000                                               ;83BBE3|A00000  |      ;
    STZ.B strcVariables.n16Temp2                               ;83BBE6|6480    |000080;
 
  - LDA.B [ptrTemp0x72],Y                                      ;83BBE8|B772    |000072;
    CLC                                                        ;83BBEA|18      |      ;
    ADC.B strcVariables.n16Temp2                               ;83BBEB|6580    |000080;
    STA.B strcVariables.n16Temp2                               ;83BBED|8580    |000080;
    INY                                                        ;83BBEF|C8      |      ;
    INY                                                        ;83BBF0|C8      |      ;
    CPY.W #$1000                                               ;83BBF1|C00010  |      ;
    BNE -                                                      ;83BBF4|D0F2    |83BBE8;
    REP #$30                                                   ;83BBF6|C230    |      ;
    LDA.B strcVariables.n16Temp1                               ;83BBF8|A57E    |00007E;
    CMP.B strcVariables.n16Temp2                               ;83BBFA|C580    |000080;
    BNE .label3                                                ;83BBFC|D01B    |83BC19;
    LDY.W #$002F                                               ;83BBFE|A02F00  |      ;
    LDA.B strcVariables.n16Temp1                               ;83BC01|A57E    |00007E;
    STA.B [ptrTemp0x72],Y                                      ;83BC03|9772    |000072;
    SEP #$20                                                   ;83BC05|E220    |      ;
    LDY.W #$002E                                               ;83BC07|A02E00  |      ;
    LDA.B strcVariables.n8Temp1                                ;83BC0A|A592    |000092;
    STA.B [ptrTemp0x72],Y                                      ;83BC0C|9772    |000072;
    CMP.B #$01                                                 ;83BC0E|C901    |      ;
    BNE .justReturn                                            ;83BC10|D047    |83BC59;
    LDA.B #$01                                                 ;83BC12|A901    |      ;
    STA.W $098E                                                ;83BC14|8D8E09  |00098E;
    BRA .justReturn                                            ;83BC17|8040    |83BC59;
 
 
.label3:
    REP #$30                                                   ;83BC19|C230    |      ;
    LDY.W #$0000                                               ;83BC1B|A00000  |      ;
    LDA.W #$0000                                               ;83BC1E|A90000  |      ;
 
  - STA.B [ptrTemp0x72],Y                                      ;83BC21|9772    |000072; zero loop
    INY                                                        ;83BC23|C8      |      ;
    INY                                                        ;83BC24|C8      |      ;
    CPY.W #$0800                                               ;83BC25|C00008  |      ;
    BNE -                                                      ;83BC28|D0F7    |83BC21;
    SEP #$20                                                   ;83BC2A|E220    |      ;
    LDY.W #$003C                                               ;83BC2C|A03C00  |      ;
    LDA.B #$46                                                 ;83BC2F|A946    |      ;
    STA.B [ptrTemp0x72],Y                                      ;83BC31|9772    |000072;
    LDY.W #$003D                                               ;83BC33|A03D00  |      ;
    LDA.B #$41                                                 ;83BC36|A941    |      ;
    STA.B [ptrTemp0x72],Y                                      ;83BC38|9772    |000072;
    LDY.W #$003E                                               ;83BC3A|A03E00  |      ;
    LDA.B #$52                                                 ;83BC3D|A952    |      ;
    STA.B [ptrTemp0x72],Y                                      ;83BC3F|9772    |000072;
    LDY.W #$003F                                               ;83BC41|A03F00  |      ;
    LDA.B #$4D                                                 ;83BC44|A94D    |      ;
    STA.B [ptrTemp0x72],Y                                      ;83BC46|9772    |000072;
    REP #$20                                                   ;83BC48|C220    |      ;
    LDA.B strcVariables.n16Temp3                               ;83BC4A|A582    |000082;
    BEQ .justReturn                                            ;83BC4C|F00B    |83BC59;
    %SetFlag(daily4, $0800)
 
.justReturn:
    RTL                                                        ;83BC59|6B      |      ;
 
 
fGameEngine_AnimalsDailyUpdate:
    REP #$30                                                   ;83BC5A|C230    |      ;
    %CheckFlag(daily4, $0001)
    BEQ +                                                      ;83BC63|F003    |83BC68;
    JMP.W .label13                                             ;83BC65|4C4BBE  |83BE4B;
 
 
  + LDX.W #$0000                                               ;83BC68|A20000  |      ;
 
.cow:
    REP #$30                                                   ;83BC6B|C230    |      ;
    PHX                                                        ;83BC6D|DA      |      ;
    PHX                                                        ;83BC6E|DA      |      ;
    TXA                                                        ;83BC6F|8A      |      ;
    JSL.L fGameEngine_GetCowData                               ;83BC70|22A7C983|83C9A7;
    SEP #$20                                                   ;83BC74|E220    |      ;
    REP #$10                                                   ;83BC76|C210    |      ;
    PLX                                                        ;83BC78|FA      |      ;
    LDY.W #$0000                                               ;83BC79|A00000  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83BC7C|B772    |000072;
    AND.B #$01                                                 ;83BC7E|2901    |      ;
    BNE +                                                      ;83BC80|D003    |83BC85;
    JMP.W .label12                                             ;83BC82|4C3FBE  |83BE3F;
 
 
  + SEP #$20                                                   ;83BC85|E220    |      ;
    LDY.W #$0000                                               ;83BC87|A00000  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83BC8A|B772    |000072;
    AND.B #$02                                                 ;83BC8C|2902    |      ;
    BEQ +                                                      ;83BC8E|F003    |83BC93;
    JMP.W .label12                                             ;83BC90|4C3FBE  |83BE3F;
 
 
  + LDY.W #$0000                                               ;83BC93|A00000  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83BC96|B772    |000072;
    AND.B #$04                                                 ;83BC98|2904    |      ;
    BEQ +                                                      ;83BC9A|F003    |83BC9F;
    JMP.W .label11                                             ;83BC9C|4C2EBE  |83BE2E;
 
 
  + LDY.W #$0002                                               ;83BC9F|A00200  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83BCA2|B772    |000072;
    CMP.B #$27                                                 ;83BCA4|C927    |      ;
    BNE .label2                                                ;83BCA6|D02B    |83BCD3;
    LDY.W #$0000                                               ;83BCA8|A00000  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83BCAB|B772    |000072;
    AND.B #$40                                                 ;83BCAD|2940    |      ;
    BNE .label1                                                ;83BCAF|D011    |83BCC2;
    REP #$20                                                   ;83BCB1|C220    |      ;
    TXA                                                        ;83BCB3|8A      |      ;
    ASL A                                                      ;83BCB4|0A      |      ;
    TAX                                                        ;83BCB5|AA      |      ;
    LDA.L nCowFeedFlagsTable,X                                 ;83BCB6|BF71A582|82A571;
    AND.W strcPlayerData.placedCowFeedFlags                    ;83BCBA|2D3209  |000932;
    BEQ .label3                                                ;83BCBD|F051    |83BD10;
    JMP.W .label8                                              ;83BCBF|4C9EBD  |83BD9E;
 
 
.label1:
    REP #$30                                                   ;83BCC2|C230    |      ;
    LDX.W #$0018                                               ;83BCC4|A21800  |      ;
    LDA.L nCowFeedFlagsTable,X                                 ;83BCC7|BF71A582|82A571;
    AND.W strcPlayerData.placedCowFeedFlags                    ;83BCCB|2D3209  |000932;
    BEQ .label3                                                ;83BCCE|F040    |83BD10;
    JMP.W .label8                                              ;83BCD0|4C9EBD  |83BD9E;
 
 
.label2:
    SEP #$20                                                   ;83BCD3|E220    |      ;
    REP #$10                                                   ;83BCD5|C210    |      ;
    LDY.W #$0002                                               ;83BCD7|A00200  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83BCDA|B772    |000072;
    CMP.B #$04                                                 ;83BCDC|C904    |      ;
    BCS .label3                                                ;83BCDE|B030    |83BD10;
    JSL.L fObjectMap_EatingGrass                               ;83BCE0|22A0A982|82A9A0;
    REP #$20                                                   ;83BCE4|C220    |      ;
    LDA.W strcPlayerData.leftGrassToCut                        ;83BCE6|AD2E09  |00092E;
    BEQ .label3                                                ;83BCE9|F025    |83BD10;
    REP #$20                                                   ;83BCEB|C220    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;83BCED|AD9601  |000196;
    AND.W #$0002                                               ;83BCF0|290200  |      ;
    BNE .label3                                                ;83BCF3|D01B    |83BD10;
    LDA.W strcDialogDisplay.mapFlags                           ;83BCF5|AD9601  |000196;
    AND.W #$0008                                               ;83BCF8|290800  |      ;
    BNE .label4                                                ;83BCFB|D023    |83BD20;
    LDA.W strcDialogDisplay.mapFlags                           ;83BCFD|AD9601  |000196;
    AND.W #$0010                                               ;83BD00|291000  |      ;
    BNE .label5                                                ;83BD03|D02B    |83BD30;
    LDA.W strcDialogDisplay.mapFlags                           ;83BD05|AD9601  |000196;
    AND.W #$0200                                               ;83BD08|290002  |      ;
    BNE .label6                                                ;83BD0B|D033    |83BD40;
    JMP.W .label8                                              ;83BD0D|4C9EBD  |83BD9E;
 
 
.label3:
    REP #$20                                                   ;83BD10|C220    |      ;
    LDA.W #$FFF8                                               ;83BD12|A9F8FF  |      ;
    JSL.L fCow_AddHappiness                                      ;83BD15|22D4A584|84A5D4;
    REP #$30                                                   ;83BD19|C230    |      ;
    LDY.W #$0004                                               ;83BD1B|A00400  |      ;
    BRA .label7                                                ;83BD1E|8030    |83BD50;
 
 
.label4:
    REP #$20                                                   ;83BD20|C220    |      ;
    LDA.W #$FFF0                                               ;83BD22|A9F0FF  |      ;
    JSL.L fCow_AddHappiness                                      ;83BD25|22D4A584|84A5D4;
    REP #$30                                                   ;83BD29|C230    |      ;
    LDY.W #$0002                                               ;83BD2B|A00200  |      ;
    BRA .label7                                                ;83BD2E|8020    |83BD50;
 
 
.label5:
    REP #$20                                                   ;83BD30|C220    |      ;
    LDA.W #$FFE8                                               ;83BD32|A9E8FF  |      ;
    JSL.L fCow_AddHappiness                                      ;83BD35|22D4A584|84A5D4;
    REP #$30                                                   ;83BD39|C230    |      ;
    LDY.W #$0002                                               ;83BD3B|A00200  |      ;
    BRA .label7                                                ;83BD3E|8010    |83BD50;
 
 
.label6:
    REP #$20                                                   ;83BD40|C220    |      ;
    LDA.W #$FFF8                                               ;83BD42|A9F8FF  |      ;
    JSL.L fCow_AddHappiness                                      ;83BD45|22D4A584|84A5D4;
    REP #$30                                                   ;83BD49|C230    |      ;
    LDY.W #$0008                                               ;83BD4B|A00800  |      ;
    BRA .label7                                                ;83BD4E|8000    |83BD50;
 
 
.label7:
    REP #$30                                                   ;83BD50|C230    |      ;
    TYA                                                        ;83BD52|98      |      ;
    JSL.L fCore_GetRandomNumber                                ;83BD53|22F98980|8089F9;
    BNE .label8                                                ;83BD57|D045    |83BD9E;
    SEP #$20                                                   ;83BD59|E220    |      ;
    REP #$10                                                   ;83BD5B|C210    |      ;
    LDY.W #$0000                                               ;83BD5D|A00000  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83BD60|B772    |000072;
    AND.B #$40                                                 ;83BD62|2940    |      ;
    BNE .label8                                                ;83BD64|D038    |83BD9E;
    LDY.W #$0001                                               ;83BD66|A00100  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83BD69|B772    |000072;
    AND.B #$80                                                 ;83BD6B|2980    |      ;
    BNE .label8                                                ;83BD6D|D02F    |83BD9E;
    LDY.W #$0000                                               ;83BD6F|A00000  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83BD72|B772    |000072;
    AND.B #$20                                                 ;83BD74|2920    |      ;
    BNE .label8                                                ;83BD76|D026    |83BD9E;
    SEP #$20                                                   ;83BD78|E220    |      ;
    REP #$10                                                   ;83BD7A|C210    |      ;
    LDY.W #$0000                                               ;83BD7C|A00000  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83BD7F|B772    |000072;
    ORA.B #$20                                                 ;83BD81|0920    |      ;
    STA.B [ptrTemp0x72],Y                                      ;83BD83|9772    |000072;
    LDY.W #$0003                                               ;83BD85|A00300  |      ;
    LDA.B #$07                                                 ;83BD88|A907    |      ;
    STA.B [ptrTemp0x72],Y                                      ;83BD8A|9772    |000072;
    REP #$20                                                   ;83BD8C|C220    |      ;
    LDA.W #$FFF4                                               ;83BD8E|A9F4FF  |      ;
    JSL.L fCow_AddHappiness                                      ;83BD91|22D4A584|84A5D4;
    REP #$30                                                   ;83BD95|C230    |      ;
    LDA.W #$FFE2                                               ;83BD97|A9E2FF  |      ;
    JSL.L fGameEngine_AddHappiness                             ;83BD9A|2282B283|83B282;
 
.label8:
    SEP #$20                                                   ;83BD9E|E220    |      ;
    REP #$10                                                   ;83BDA0|C210    |      ;
    LDY.W #$0005                                               ;83BDA2|A00500  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83BDA5|B772    |000072;
    CMP.B #$0A                                                 ;83BDA7|C90A    |      ;
    BEQ .label10                                               ;83BDA9|F040    |83BDEB;
    REP #$20                                                   ;83BDAB|C220    |      ;
    %CheckFlag(daily1, $1000)
    BEQ .label9                                                ;83BDB4|F020    |83BDD6;
    SEP #$20                                                   ;83BDB6|E220    |      ;
    LDY.W #$0002                                               ;83BDB8|A00200  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83BDBB|B772    |000072;
    CMP.B #$27                                                 ;83BDBD|C927    |      ;
    BEQ .label12                                               ;83BDBF|F07E    |83BE3F;
    SEP #$20                                                   ;83BDC1|E220    |      ;
    LDA.B #$10                                                 ;83BDC3|A910    |      ;
    JSL.L fCore_GetRandomNumber                                ;83BDC5|22F98980|8089F9;
    BNE .label9                                                ;83BDC9|D00B    |83BDD6;
    REP #$20                                                   ;83BDCB|C220    |      ;
    LDA.W #$FFF8                                               ;83BDCD|A9F8FF  |      ;
    JSL.L fCow_AddHappiness                                      ;83BDD0|22D4A584|84A5D4;
    BRA .label10                                               ;83BDD4|8015    |83BDEB;
 
 
.label9:
    REP #$20                                                   ;83BDD6|C220    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;83BDD8|AD9601  |000196;
    AND.W #$0400                                               ;83BDDB|290004  |      ;
    BEQ .label12                                               ;83BDDE|F05F    |83BE3F;
    SEP #$20                                                   ;83BDE0|E220    |      ;
    LDY.W #$0002                                               ;83BDE2|A00200  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83BDE5|B772    |000072;
    CMP.B #$27                                                 ;83BDE7|C927    |      ;
    BEQ .label12                                               ;83BDE9|F054    |83BE3F;
 
.label10:
    SEP #$20                                                   ;83BDEB|E220    |      ;
    REP #$10                                                   ;83BDED|C210    |      ;
    LDY.W #$0000                                               ;83BDEF|A00000  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83BDF2|B772    |000072;
    AND.B #$40                                                 ;83BDF4|2940    |      ;
    BNE .label12                                               ;83BDF6|D047    |83BE3F;
    LDY.W #$0001                                               ;83BDF8|A00100  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83BDFB|B772    |000072;
    AND.B #$80                                                 ;83BDFD|2980    |      ;
    BNE .label12                                               ;83BDFF|D03E    |83BE3F;
    LDY.W #$0000                                               ;83BE01|A00000  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83BE04|B772    |000072;
    AND.B #$20                                                 ;83BE06|2920    |      ;
    BNE .label12                                               ;83BE08|D035    |83BE3F;
    SEP #$20                                                   ;83BE0A|E220    |      ;
    LDY.W #$0000                                               ;83BE0C|A00000  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83BE0F|B772    |000072;
    ORA.B #$10                                                 ;83BE11|0910    |      ;
    STA.B [ptrTemp0x72],Y                                      ;83BE13|9772    |000072;
    LDY.W #$0003                                               ;83BE15|A00300  |      ;
    LDA.B #$03                                                 ;83BE18|A903    |      ;
    STA.B [ptrTemp0x72],Y                                      ;83BE1A|9772    |000072;
    LDY.W #$0005                                               ;83BE1C|A00500  |      ;
    LDA.B #$00                                                 ;83BE1F|A900    |      ;
    STA.B [ptrTemp0x72],Y                                      ;83BE21|9772    |000072;
    REP #$20                                                   ;83BE23|C220    |      ;
    LDA.W #$FFE2                                               ;83BE25|A9E2FF  |      ;
    JSL.L fCow_AddHappiness                                      ;83BE28|22D4A584|84A5D4;
    BRA .label12                                               ;83BE2C|8011    |83BE3F;
 
 
.label11:
    SEP #$20                                                   ;83BE2E|E220    |      ;
    REP #$10                                                   ;83BE30|C210    |      ;
    LDY.W #$0002                                               ;83BE32|A00200  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83BE35|B772    |000072;
    CMP.B #$04                                                 ;83BE37|C904    |      ;
    BCS .label12                                               ;83BE39|B004    |83BE3F;
    JSL.L fObjectMap_EatingGrass                               ;83BE3B|22A0A982|82A9A0;
 
.label12:
    REP #$30                                                   ;83BE3F|C230    |      ;
    PLX                                                        ;83BE41|FA      |      ;
    INX                                                        ;83BE42|E8      |      ;
    CPX.W #$000C                                               ;83BE43|E00C00  |      ;
    BEQ .label13                                               ;83BE46|F003    |83BE4B;
    JMP.W .cow                                                 ;83BE48|4C6BBC  |83BC6B;
 
 
.label13:
    REP #$30                                                   ;83BE4B|C230    |      ;
    %UnsetFlag(event6, $1040)
    LDX.W #$0000                                               ;83BE58|A20000  |      ;
 
.label14:
    REP #$30                                                   ;83BE5B|C230    |      ;
    PHX                                                        ;83BE5D|DA      |      ;
    PHX                                                        ;83BE5E|DA      |      ;
    TXA                                                        ;83BE5F|8A      |      ;
    JSL.L fGameEngine_GetCowData                               ;83BE60|22A7C983|83C9A7;
    SEP #$20                                                   ;83BE64|E220    |      ;
    REP #$10                                                   ;83BE66|C210    |      ;
    PLX                                                        ;83BE68|FA      |      ;
    LDY.W #$0000                                               ;83BE69|A00000  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83BE6C|B772    |000072;
    AND.B #$01                                                 ;83BE6E|2901    |      ;
    BNE +                                                      ;83BE70|D003    |83BE75;
    JMP.W .chicken                                             ;83BE72|4C1AC0  |83C01A;
 
 
  + LDY.W #$0004                                               ;83BE75|A00400  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83BE78|B772    |000072;
    SEP #$20                                                   ;83BE7A|E220    |      ;
    REP #$10                                                   ;83BE7C|C210    |      ;
    LDY.W #$0001                                               ;83BE7E|A00100  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83BE81|B772    |000072;
    AND.B #$F8                                                 ;83BE83|29F8    |      ;
    STA.B [ptrTemp0x72],Y                                      ;83BE85|9772    |000072;
    LDY.W #$0000                                               ;83BE87|A00000  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83BE8A|B772    |000072;
    AND.B #$02                                                 ;83BE8C|2902    |      ;
    BEQ .label15                                               ;83BE8E|F021    |83BEB1;
    LDY.W #$0003                                               ;83BE90|A00300  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83BE93|B772    |000072;
    INC A                                                      ;83BE95|1A      |      ;
    STA.B [ptrTemp0x72],Y                                      ;83BE96|9772    |000072;
    CMP.B #$0E                                                 ;83BE98|C90E    |      ;
    BEQ +                                                      ;83BE9A|F003    |83BE9F;
    JMP.W .chicken                                             ;83BE9C|4C1AC0  |83C01A;
 
 
  + LDA.B #$00                                                 ;83BE9F|A900    |      ;
    STA.B [ptrTemp0x72],Y                                      ;83BEA1|9772    |000072;
    LDY.W #$0000                                               ;83BEA3|A00000  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83BEA6|B772    |000072;
    ORA.B #$04                                                 ;83BEA8|0904    |      ;
    AND.B #$FD                                                 ;83BEAA|29FD    |      ;
    STA.B [ptrTemp0x72],Y                                      ;83BEAC|9772    |000072;
    JMP.W .chicken                                             ;83BEAE|4C1AC0  |83C01A;
 
 
.label15:
    SEP #$20                                                   ;83BEB1|E220    |      ;
    REP #$10                                                   ;83BEB3|C210    |      ;
    LDY.W #$0000                                               ;83BEB5|A00000  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83BEB8|B772    |000072;
    AND.B #$04                                                 ;83BEBA|2904    |      ;
    BEQ .label16                                               ;83BEBC|F037    |83BEF5;
    SEP #$20                                                   ;83BEBE|E220    |      ;
    LDY.W #$0003                                               ;83BEC0|A00300  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83BEC3|B772    |000072;
    INC A                                                      ;83BEC5|1A      |      ;
    STA.B [ptrTemp0x72],Y                                      ;83BEC6|9772    |000072;
    CMP.B #$15                                                 ;83BEC8|C915    |      ;
    BEQ +                                                      ;83BECA|F003    |83BECF;
    JMP.W .chicken                                             ;83BECC|4C1AC0  |83C01A;
 
 
  + LDA.B #$00                                                 ;83BECF|A900    |      ;
    STA.B [ptrTemp0x72],Y                                      ;83BED1|9772    |000072;
    LDY.W #$0000                                               ;83BED3|A00000  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83BED6|B772    |000072;
    ORA.B #$08                                                 ;83BED8|0908    |      ;
    AND.B #$FB                                                 ;83BEDA|29FB    |      ;
    STA.B [ptrTemp0x72],Y                                      ;83BEDC|9772    |000072;
    LDY.W #$0003                                               ;83BEDE|A00300  |      ;
    LDA.B #$00                                                 ;83BEE1|A900    |      ;
    STA.B [ptrTemp0x72],Y                                      ;83BEE3|9772    |000072;
    REP #$20                                                   ;83BEE5|C220    |      ;
    %SetFlag(event6, $1000)
    JMP.W .chicken                                             ;83BEF2|4C1AC0  |83C01A;
 
 
.label16:
    REP #$30                                                   ;83BEF5|C230    |      ;
    %SetFlag(event6, $1000)
    SEP #$20                                                   ;83BF02|E220    |      ;
    LDY.W #$0000                                               ;83BF04|A00000  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83BF07|B772    |000072;
    AND.B #$10                                                 ;83BF09|2910    |      ;
    BEQ .label17                                               ;83BF0B|F019    |83BF26;
    LDY.W #$0003                                               ;83BF0D|A00300  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83BF10|B772    |000072;
    DEC A                                                      ;83BF12|3A      |      ;
    STA.B [ptrTemp0x72],Y                                      ;83BF13|9772    |000072;
    BEQ +                                                      ;83BF15|F003    |83BF1A;
    JMP.W .chicken                                             ;83BF17|4C1AC0  |83C01A;
 
 
  + LDY.W #$0000                                               ;83BF1A|A00000  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83BF1D|B772    |000072;
    AND.B #$EF                                                 ;83BF1F|29EF    |      ;
    STA.B [ptrTemp0x72],Y                                      ;83BF21|9772    |000072;
    JMP.W .chicken                                             ;83BF23|4C1AC0  |83C01A;
 
 
.label17:
    SEP #$20                                                   ;83BF26|E220    |      ;
    REP #$10                                                   ;83BF28|C210    |      ;
    LDY.W #$0000                                               ;83BF2A|A00000  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83BF2D|B772    |000072;
    AND.B #$20                                                 ;83BF2F|2920    |      ;
    BEQ .label19                                               ;83BF31|F054    |83BF87;
    LDY.W #$0003                                               ;83BF33|A00300  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83BF36|B772    |000072;
    BEQ .label18                                               ;83BF38|F008    |83BF42;
    DEC A                                                      ;83BF3A|3A      |      ;
    STA.B [ptrTemp0x72],Y                                      ;83BF3B|9772    |000072;
    BEQ .label18                                               ;83BF3D|F003    |83BF42;
    JMP.W .chicken                                             ;83BF3F|4C1AC0  |83C01A;
 
 
.label18:
    REP #$30                                                   ;83BF42|C230    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;83BF44|AD9601  |000196;
    AND.W #$001A                                               ;83BF47|291A00  |      ;
    BEQ +                                                      ;83BF4A|F003    |83BF4F;
    JMP.W .chicken                                             ;83BF4C|4C1AC0  |83C01A;
 
 
  + SEP #$20                                                   ;83BF4F|E220    |      ;
    LDA.W nWeatherForecast                                     ;83BF51|AD8C09  |00098C;
    CMP.B #$06                                                 ;83BF54|C906    |      ;
    BCC +                                                      ;83BF56|9003    |83BF5B;
    JMP.W .chicken                                             ;83BF58|4C1AC0  |83C01A;
 
 
  + SEP #$20                                                   ;83BF5B|E220    |      ;
    LDY.W #$0000                                               ;83BF5D|A00000  |      ;
    LDA.B #$00                                                 ;83BF60|A900    |      ;
    STA.B [ptrTemp0x72],Y                                      ;83BF62|9772    |000072;
    SEP #$20                                                   ;83BF64|E220    |      ;
    LDA.L nOwnedCows                                           ;83BF66|AF0A1F7F|7F1F0A;
    DEC A                                                      ;83BF6A|3A      |      ;
    STA.L nOwnedCows                                           ;83BF6B|8F0A1F7F|7F1F0A;
    REP #$20                                                   ;83BF6F|C220    |      ;
    %SetFlag(event6, $0040)
    PLX                                                        ;83BF7C|FA      |      ;
    PHX                                                        ;83BF7D|DA      |      ;
    TXA                                                        ;83BF7E|8A      |      ;
    SEP #$20                                                   ;83BF7F|E220    |      ;
    STA.W strcStockData.unkCow                                 ;83BF81|8D3709  |000937;
    JMP.W .chicken                                             ;83BF84|4C1AC0  |83C01A;
 
 
.label19:
    SEP #$20                                                   ;83BF87|E220    |      ;
    REP #$10                                                   ;83BF89|C210    |      ;
    LDY.W #$0001                                               ;83BF8B|A00100  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83BF8E|B772    |000072;
    AND.B #$80                                                 ;83BF90|2980    |      ;
    BEQ .label20                                               ;83BF92|F016    |83BFAA;
    SEP #$20                                                   ;83BF94|E220    |      ;
    LDY.W #$0000                                               ;83BF96|A00000  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83BF99|B772    |000072;
    ORA.B #$40                                                 ;83BF9B|0940    |      ;
    STA.B [ptrTemp0x72],Y                                      ;83BF9D|9772    |000072;
    LDY.W #$0001                                               ;83BF9F|A00100  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83BFA2|B772    |000072;
    AND.B #$7F                                                 ;83BFA4|297F    |      ;
    STA.B [ptrTemp0x72],Y                                      ;83BFA6|9772    |000072;
    BRA .chicken                                               ;83BFA8|8070    |83C01A;
 
 
.label20:
    SEP #$20                                                   ;83BFAA|E220    |      ;
    REP #$10                                                   ;83BFAC|C210    |      ;
    LDY.W #$0000                                               ;83BFAE|A00000  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83BFB1|B772    |000072;
    AND.B #$40                                                 ;83BFB3|2940    |      ;
    BEQ .chicken                                               ;83BFB5|F063    |83C01A;
    LDY.W #$0003                                               ;83BFB7|A00300  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83BFBA|B772    |000072;
    BEQ .label21                                               ;83BFBC|F00E    |83BFCC;
    DEC A                                                      ;83BFBE|3A      |      ;
    STA.B [ptrTemp0x72],Y                                      ;83BFBF|9772    |000072;
    LDA.L nCowPregnacyDays                                     ;83BFC1|AF121F7F|7F1F12;
    DEC A                                                      ;83BFC5|3A      |      ;
    STA.L nCowPregnacyDays                                     ;83BFC6|8F121F7F|7F1F12;
    BNE .chicken                                               ;83BFCA|D04E    |83C01A;
 
.label21:
    LDY.W #$0002                                               ;83BFCC|A00200  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83BFCF|B772    |000072;
    CMP.B #$27                                                 ;83BFD1|C927    |      ;
    BNE .chicken                                               ;83BFD3|D045    |83C01A;
    REP #$20                                                   ;83BFD5|C220    |      ;
    %SetFlag(event1, $0008)
    SEP #$20                                                   ;83BFE2|E220    |      ;
    LDY.W #$0000                                               ;83BFE4|A00000  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83BFE7|B772    |000072;
    ORA.B #$80                                                 ;83BFE9|0980    |      ;
    AND.B #$BF                                                 ;83BFEB|29BF    |      ;
    STA.B [ptrTemp0x72],Y                                      ;83BFED|9772    |000072;
    SEP #$20                                                   ;83BFEF|E220    |      ;
    LDA.B #$14                                                 ;83BFF1|A914    |      ;
    STA.L nNewBornCowAffection                                 ;83BFF3|8F2B1F7F|7F1F2B;
    LDY.W #$0004                                               ;83BFF7|A00400  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83BFFA|B772    |000072;
    CMP.B #$60                                                 ;83BFFC|C960    |      ;
    BCC .label23                                               ;83BFFE|9018    |83C018;
    CMP.B #$C0                                                 ;83C000|C9C0    |      ;
    BCC .label22                                               ;83C002|900A    |83C00E;
    SEP #$20                                                   ;83C004|E220    |      ;
    LDA.B #$64                                                 ;83C006|A964    |      ;
    STA.L nNewBornCowAffection                                 ;83C008|8F2B1F7F|7F1F2B;
    BRA .label23                                               ;83C00C|800A    |83C018;
 
 
.label22:
    SEP #$20                                                   ;83C00E|E220    |      ;
    LDA.B #$32                                                 ;83C010|A932    |      ;
    STA.L nNewBornCowAffection                                 ;83C012|8F2B1F7F|7F1F2B;
    BRA .label23                                               ;83C016|8000    |83C018;
 
 
.label23:
    BRA .chicken                                               ;83C018|8000    |83C01A;
 
 
.chicken:
    REP #$30                                                   ;83C01A|C230    |      ;
    PLX                                                        ;83C01C|FA      |      ;
    INX                                                        ;83C01D|E8      |      ;
    CPX.W #$000C                                               ;83C01E|E00C00  |      ;
    BEQ +                                                      ;83C021|F003    |83C026;
    JMP.W .label14                                             ;83C023|4C5BBE  |83BE5B;
 
 
  + REP #$30                                                   ;83C026|C230    |      ;
    %CheckFlag(daily4, $0001)
    BEQ +                                                      ;83C02F|F003    |83C034;
    JMP.W .label38                                             ;83C031|4C25C1  |83C125;
 
 
  + REP #$30                                                   ;83C034|C230    |      ;
    %UnsetFlag(event6, $0020)
    LDX.W #$0000                                               ;83C041|A20000  |      ;
 
.chickenDeath:
    REP #$30                                                   ;83C044|C230    |      ;
    PHX                                                        ;83C046|DA      |      ;
    PHX                                                        ;83C047|DA      |      ;
    TXA                                                        ;83C048|8A      |      ;
    JSL.L fGameEngine_GetChickenData                           ;83C049|2295C983|83C995;
    SEP #$20                                                   ;83C04D|E220    |      ;
    REP #$10                                                   ;83C04F|C210    |      ;
    PLX                                                        ;83C051|FA      |      ;
    LDY.W #$0000                                               ;83C052|A00000  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83C055|B772    |000072;
    AND.B #$01                                                 ;83C057|2901    |      ;
    BNE .label25                                               ;83C059|D003    |83C05E;
    JMP.W .label29                                             ;83C05B|4C19C1  |83C119;
 
 
.label25:
    SEP #$20                                                   ;83C05E|E220    |      ;
    LDY.W #$0000                                               ;83C060|A00000  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83C063|B772    |000072;
    AND.B #$0E                                                 ;83C065|290E    |      ;
    BNE .label26                                               ;83C067|D01B    |83C084;
    SEP #$20                                                   ;83C069|E220    |      ;
    LDY.W #$0000                                               ;83C06B|A00000  |      ;
    LDA.B #$00                                                 ;83C06E|A900    |      ;
    STA.B [ptrTemp0x72],Y                                      ;83C070|9772    |000072;
    LDA.L nOwnedChickens                                       ;83C072|AF0B1F7F|7F1F0B;
    DEC A                                                      ;83C076|3A      |      ;
    STA.L nOwnedChickens                                       ;83C077|8F0B1F7F|7F1F0B;
    REP #$30                                                   ;83C07B|C230    |      ;
    LDA.W #$FFE2                                               ;83C07D|A9E2FF  |      ;
    JSL.L fGameEngine_AddHappiness                             ;83C080|2282B283|83B282; decrease hapiness
 
.label26:
    SEP #$20                                                   ;83C084|E220    |      ;
    LDY.W #$0000                                               ;83C086|A00000  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83C089|B772    |000072;
    AND.B #$08                                                 ;83C08B|2908    |      ;
    BNE +                                                      ;83C08D|D003    |83C092;
    JMP.W .label29                                             ;83C08F|4C19C1  |83C119;
 
 
  + SEP #$20                                                   ;83C092|E220    |      ;
    LDY.W #$0001                                               ;83C094|A00100  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83C097|B772    |000072;
    CMP.B #$28                                                 ;83C099|C928    |      ;
    BNE .label27                                               ;83C09B|D00E    |83C0AB;
    SEP #$20                                                   ;83C09D|E220    |      ;
    LDA.W strcPlayerData.placedChcikenFeed                     ;83C09F|AD3109  |000931;
    BEQ +                                                      ;83C0A2|F02B    |83C0CF;
    DEC A                                                      ;83C0A4|3A      |      ;
    STA.W strcPlayerData.placedChcikenFeed                     ;83C0A5|8D3109  |000931;
    JMP.W .label29                                             ;83C0A8|4C19C1  |83C119;
 
 
.label27:
    SEP #$20                                                   ;83C0AB|E220    |      ;
    REP #$10                                                   ;83C0AD|C210    |      ;
    LDY.W #$0001                                               ;83C0AF|A00100  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83C0B2|B772    |000072;
    CMP.B #$04                                                 ;83C0B4|C904    |      ;
    BCS +                                                      ;83C0B6|B017    |83C0CF;
    JSL.L fObjectMap_EatingGrass                               ;83C0B8|22A0A982|82A9A0;
    REP #$20                                                   ;83C0BC|C220    |      ;
    LDA.W strcPlayerData.leftGrassToCut                        ;83C0BE|AD2E09  |00092E;
    BEQ +                                                      ;83C0C1|F00C    |83C0CF;
    REP #$20                                                   ;83C0C3|C220    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;83C0C5|AD9601  |000196;
    AND.W #$020A                                               ;83C0C8|290A02  |      ;
    BNE +                                                      ;83C0CB|D002    |83C0CF;
    BRA .label28                                               ;83C0CD|8016    |83C0E5;
 
 
  + SEP #$20                                                   ;83C0CF|E220    |      ;
    REP #$10                                                   ;83C0D1|C210    |      ;
    LDY.W #$0000                                               ;83C0D3|A00000  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83C0D6|B772    |000072;
    ORA.B #$10                                                 ;83C0D8|0910    |      ;
    STA.B [ptrTemp0x72],Y                                      ;83C0DA|9772    |000072;
    LDY.W #$0002                                               ;83C0DC|A00200  |      ;
    LDA.B #$03                                                 ;83C0DF|A903    |      ;
    STA.B [ptrTemp0x72],Y                                      ;83C0E1|9772    |000072;
    BRA .label28                                               ;83C0E3|8000    |83C0E5;
 
 
.label28:
    REP #$30                                                   ;83C0E5|C230    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;83C0E7|AD9601  |000196;
    AND.W #$0410                                               ;83C0EA|291004  |      ;
    BEQ .label29                                               ;83C0ED|F02A    |83C119;
    %CheckFlag(event6, $0020)
    BNE .label29                                               ;83C0F6|D021    |83C119;
    SEP #$20                                                   ;83C0F8|E220    |      ;
    LDY.W #$0001                                               ;83C0FA|A00100  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83C0FD|B772    |000072;
    CMP.B #$04                                                 ;83C0FF|C904    |      ;
    BCS .label29                                               ;83C101|B016    |83C119;
    LDY.W #$0000                                               ;83C103|A00000  |      ;
    LDA.B #$01                                                 ;83C106|A901    |      ;
    STA.B [ptrTemp0x72],Y                                      ;83C108|9772    |000072;
    REP #$20                                                   ;83C10A|C220    |      ;
    %SetFlag(event6, $0020)
    BRA .label29                                               ;83C117|8000    |83C119;
 
 
.label29:
    REP #$30                                                   ;83C119|C230    |      ;
    PLX                                                        ;83C11B|FA      |      ;
    INX                                                        ;83C11C|E8      |      ;
    CPX.W #$000D                                               ;83C11D|E00D00  |      ;
    BEQ .label38                                               ;83C120|F003    |83C125;
    JMP.W .chickenDeath                                        ;83C122|4C44C0  |83C044;
 
 
.label38:
    REP #$30                                                   ;83C125|C230    |      ;
    LDX.W #$0000                                               ;83C127|A20000  |      ;
 
.label30:
    REP #$30                                                   ;83C12A|C230    |      ;
    PHX                                                        ;83C12C|DA      |      ;
    PHX                                                        ;83C12D|DA      |      ;
    TXA                                                        ;83C12E|8A      |      ;
    JSL.L fGameEngine_GetChickenData                           ;83C12F|2295C983|83C995;
    SEP #$20                                                   ;83C133|E220    |      ;
    REP #$10                                                   ;83C135|C210    |      ;
    PLX                                                        ;83C137|FA      |      ;
    LDY.W #$0000                                               ;83C138|A00000  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83C13B|B772    |000072;
    AND.B #$01                                                 ;83C13D|2901    |      ;
    BNE +                                                      ;83C13F|D003    |83C144;
    JMP.W .label37                                             ;83C141|4CDCC1  |83C1DC;
 
 
  + SEP #$20                                                   ;83C144|E220    |      ;
    LDY.W #$0000                                               ;83C146|A00000  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83C149|B772    |000072;
    AND.B #$02                                                 ;83C14B|2902    |      ;
    BEQ .label32                                               ;83C14D|F05C    |83C1AB;
    SEP #$20                                                   ;83C14F|E220    |      ;
    REP #$10                                                   ;83C151|C210    |      ;
    LDY.W #$0002                                               ;83C153|A00200  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83C156|B772    |000072;
    CMP.B #$03                                                 ;83C158|C903    |      ;
    BEQ +                                                      ;83C15A|F007    |83C163;
    INC A                                                      ;83C15C|1A      |      ;
    STA.B [ptrTemp0x72],Y                                      ;83C15D|9772    |000072;
    CMP.B #$03                                                 ;83C15F|C903    |      ;
    BNE .label37                                               ;83C161|D079    |83C1DC;
 
  + SEP #$20                                                   ;83C163|E220    |      ;
    LDA.L nOwnedChickens                                       ;83C165|AF0B1F7F|7F1F0B;
    CMP.B #$0C                                                 ;83C169|C90C    |      ;
    BEQ .label37                                               ;83C16B|F06F    |83C1DC;
    LDY.W #$0002                                               ;83C16D|A00200  |      ;
    LDA.B #$00                                                 ;83C170|A900    |      ;
    STA.B [ptrTemp0x72],Y                                      ;83C172|9772    |000072;
    LDY.W #$0000                                               ;83C174|A00000  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83C177|B772    |000072;
    ORA.B #$04                                                 ;83C179|0904    |      ;
    AND.B #$BD                                                 ;83C17B|29BD    |      ;
    STA.B [ptrTemp0x72],Y                                      ;83C17D|9772    |000072;
    REP #$20                                                   ;83C17F|C220    |      ;
    LDY.W #$0004                                               ;83C181|A00400  |      ;
    LDA.W #$00D8                                               ;83C184|A9D800  |      ;
    STA.B [ptrTemp0x72],Y                                      ;83C187|9772    |000072;
    LDY.W #$0006                                               ;83C189|A00600  |      ;
    LDA.W #$00B8                                               ;83C18C|A9B800  |      ;
    STA.B [ptrTemp0x72],Y                                      ;83C18F|9772    |000072;
    SEP #$20                                                   ;83C191|E220    |      ;
    LDA.L nOwnedChickens                                       ;83C193|AF0B1F7F|7F1F0B;
    INC A                                                      ;83C197|1A      |      ;
    STA.L nOwnedChickens                                       ;83C198|8F0B1F7F|7F1F0B;
    REP #$30                                                   ;83C19C|C230    |      ;
    %UnsetFlag(event6, $2000)
    BRA .label37                                               ;83C1A9|8031    |83C1DC;
 
 
.label32:
    SEP #$20                                                   ;83C1AB|E220    |      ;
    REP #$10                                                   ;83C1AD|C210    |      ;
    LDY.W #$0000                                               ;83C1AF|A00000  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83C1B2|B772    |000072;
    AND.B #$04                                                 ;83C1B4|2904    |      ;
    BEQ .label37                                               ;83C1B6|F024    |83C1DC;
    LDY.W #$0002                                               ;83C1B8|A00200  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83C1BB|B772    |000072;
    INC A                                                      ;83C1BD|1A      |      ;
    STA.B [ptrTemp0x72],Y                                      ;83C1BE|9772    |000072;
    CMP.B #$07                                                 ;83C1C0|C907    |      ;
    BNE .label37                                               ;83C1C2|D018    |83C1DC;
    LDA.B #$00                                                 ;83C1C4|A900    |      ;
    STA.B [ptrTemp0x72],Y                                      ;83C1C6|9772    |000072;
    LDY.W #$0000                                               ;83C1C8|A00000  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83C1CB|B772    |000072;
    ORA.B #$08                                                 ;83C1CD|0908    |      ;
    AND.B #$FB                                                 ;83C1CF|29FB    |      ;
    STA.B [ptrTemp0x72],Y                                      ;83C1D1|9772    |000072;
    LDY.W #$0002                                               ;83C1D3|A00200  |      ;
    LDA.B #$00                                                 ;83C1D6|A900    |      ;
    STA.B [ptrTemp0x72],Y                                      ;83C1D8|9772    |000072;
    BRA .label37                                               ;83C1DA|8000    |83C1DC;
 
 
.label37:
    REP #$30                                                   ;83C1DC|C230    |      ;
    PLX                                                        ;83C1DE|FA      |      ;
    INX                                                        ;83C1DF|E8      |      ;
    CPX.W #$000D                                               ;83C1E0|E00D00  |      ;
    BEQ +                                                      ;83C1E3|F003    |83C1E8;
    JMP.W .label30                                             ;83C1E5|4C2AC1  |83C12A;
 
 
  + REP #$30                                                   ;83C1E8|C230    |      ;
    LDA.W #$0000                                               ;83C1EA|A90000  |      ;
    STA.L nEggInCoopFlags                                      ;83C1ED|8F451F7F|7F1F45;
    %UnsetFlag(event6, $0400)
    LDX.W #$0000                                               ;83C1FC|A20000  |      ;
 
.label33:
    REP #$30                                                   ;83C1FF|C230    |      ;
    PHX                                                        ;83C201|DA      |      ;
    PHX                                                        ;83C202|DA      |      ;
    TXA                                                        ;83C203|8A      |      ;
    JSL.L fGameEngine_GetChickenData                           ;83C204|2295C983|83C995;
    SEP #$20                                                   ;83C208|E220    |      ;
    REP #$10                                                   ;83C20A|C210    |      ;
    PLX                                                        ;83C20C|FA      |      ;
    LDY.W #$0000                                               ;83C20D|A00000  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83C210|B772    |000072;
    AND.B #$01                                                 ;83C212|2901    |      ;
    BNE +                                                      ;83C214|D003    |83C219;
    JMP.W .label35                                             ;83C216|4C6FC2  |83C26F;
 
 
  + SEP #$20                                                   ;83C219|E220    |      ;
    LDY.W #$0000                                               ;83C21B|A00000  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83C21E|B772    |000072;
    AND.B #$08                                                 ;83C220|2908    |      ;
    BEQ .label35                                               ;83C222|F04B    |83C26F;
    LDY.W #$0000                                               ;83C224|A00000  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83C227|B772    |000072;
    AND.B #$10                                                 ;83C229|2910    |      ;
    BNE .label34                                               ;83C22B|D02B    |83C258;
    LDY.W #$0001                                               ;83C22D|A00100  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83C230|B772    |000072;
    CMP.B #$28                                                 ;83C232|C928    |      ;
    BNE .label35                                               ;83C234|D039    |83C26F;
    REP #$30                                                   ;83C236|C230    |      ;
    PLX                                                        ;83C238|FA      |      ;
    PHX                                                        ;83C239|DA      |      ;
    TXA                                                        ;83C23A|8A      |      ;
    ASL A                                                      ;83C23B|0A      |      ;
    TAX                                                        ;83C23C|AA      |      ;
    LDA.L aGameEngine_ChickenEggBitMask,X                              ;83C23D|BF78CA83|83CA78;
    ORA.L nEggInCoopFlags                                      ;83C241|0F451F7F|7F1F45;
    STA.L nEggInCoopFlags                                      ;83C245|8F451F7F|7F1F45;
    REP #$20                                                   ;83C249|C220    |      ;
    %SetFlag(event6, $0400)
    BRA .label35                                               ;83C256|8017    |83C26F;
 
 
.label34:
    SEP #$20                                                   ;83C258|E220    |      ;
    REP #$10                                                   ;83C25A|C210    |      ;
    LDY.W #$0002                                               ;83C25C|A00200  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83C25F|B772    |000072;
    DEC A                                                      ;83C261|3A      |      ;
    STA.B [ptrTemp0x72],Y                                      ;83C262|9772    |000072;
    BNE .label35                                               ;83C264|D009    |83C26F;
    LDY.W #$0000                                               ;83C266|A00000  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83C269|B772    |000072;
    AND.B #$EF                                                 ;83C26B|29EF    |      ;
    STA.B [ptrTemp0x72],Y                                      ;83C26D|9772    |000072;
 
.label35:
    REP #$30                                                   ;83C26F|C230    |      ;
    PLX                                                        ;83C271|FA      |      ;
    INX                                                        ;83C272|E8      |      ;
    CPX.W #$000D                                               ;83C273|E00D00  |      ;
    BEQ .label36                                               ;83C276|F003    |83C27B;
    JMP.W .label33                                             ;83C278|4CFFC1  |83C1FF;
 
 
.label36:
    REP #$30                                                   ;83C27B|C230    |      ;
    %CheckFlag(event3, $0100)
    BEQ .justReturn                                            ;83C284|F00F    |83C295;
    SEP #$20                                                   ;83C286|E220    |      ;
    LDA.L nHorseAge                                            ;83C288|AF321F7F|7F1F32;
    CMP.B #$15                                                 ;83C28C|C915    |      ;
    BEQ .justReturn                                            ;83C28E|F005    |83C295;
    INC A                                                      ;83C290|1A      |      ;
    STA.L nHorseAge                                            ;83C291|8F321F7F|7F1F32;
 
.justReturn:
    RTL                                                        ;83C295|6B      |      ;
 
 
fGameEngine_SpawnChickensOnMap:
    REP #$30                                                   ;83C296|C230    |      ;
    LDX.W #$0000                                               ;83C298|A20000  |      ;
 
.label1:
    REP #$30                                                   ;83C29B|C230    |      ;
    PHX                                                        ;83C29D|DA      |      ;
    PHX                                                        ;83C29E|DA      |      ;
    TXA                                                        ;83C29F|8A      |      ;
    JSL.L fGameEngine_GetChickenData                           ;83C2A0|2295C983|83C995;
    SEP #$20                                                   ;83C2A4|E220    |      ;
    REP #$10                                                   ;83C2A6|C210    |      ;
    PLX                                                        ;83C2A8|FA      |      ;
    LDY.W #$0000                                               ;83C2A9|A00000  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83C2AC|B772    |000072;
    AND.B #$01                                                 ;83C2AE|2901    |      ;
    BNE +                                                      ;83C2B0|D003    |83C2B5;
    JMP.W .label12                                             ;83C2B2|4C01C4  |83C401;
 
 
  + LDY.W #$0000                                               ;83C2B5|A00000  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83C2B8|B772    |000072;
    AND.B #$20                                                 ;83C2BA|2920    |      ;
    BEQ .label2                                                ;83C2BC|F003    |83C2C1;
    JMP.W .label12                                             ;83C2BE|4C01C4  |83C401;
 
 
.label2:
    SEP #$20                                                   ;83C2C1|E220    |      ;
    LDY.W #$0001                                               ;83C2C3|A00100  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83C2C6|B772    |000072;
    CMP.B #$04                                                 ;83C2C8|C904    |      ;
    BCS .label3                                                ;83C2CA|B00C    |83C2D8;
    LDA.B strcMap.loadAreaId                                   ;83C2CC|A522    |000022;
    CMP.B #$04                                                 ;83C2CE|C904    |      ;
    BCC +                                                      ;83C2D0|9003    |83C2D5;
    JMP.W .label12                                             ;83C2D2|4C01C4  |83C401;
 
 
  + JMP.W .continue                                            ;83C2D5|4C70C3  |83C370;
 
 
.label3:
    SEP #$20                                                   ;83C2D8|E220    |      ;
    LDY.W #$0001                                               ;83C2DA|A00100  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83C2DD|B772    |000072;
    CMP.B #$08                                                 ;83C2DF|C908    |      ;
    BCS .label4                                                ;83C2E1|B012    |83C2F5;
    LDA.B strcMap.loadAreaId                                   ;83C2E3|A522    |000022;
    CMP.B #$04                                                 ;83C2E5|C904    |      ;
    BCS +                                                      ;83C2E7|B003    |83C2EC;
    JMP.W .label12                                             ;83C2E9|4C01C4  |83C401;
 
 
  + CMP.B #$08                                                 ;83C2EC|C908    |      ;
    BCC +                                                      ;83C2EE|9003    |83C2F3;
    JMP.W .label12                                             ;83C2F0|4C01C4  |83C401;
 
 
  + BRA .continue                                              ;83C2F3|807B    |83C370;
 
 
.label4:
    SEP #$20                                                   ;83C2F5|E220    |      ;
    LDY.W #$0001                                               ;83C2F7|A00100  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83C2FA|B772    |000072;
    CMP.B #$10                                                 ;83C2FC|C910    |      ;
    BCS .label5                                                ;83C2FE|B012    |83C312;
    LDA.B strcMap.loadAreaId                                   ;83C300|A522    |000022;
    CMP.B #$0C                                                 ;83C302|C90C    |      ;
    BCS +                                                      ;83C304|B003    |83C309;
    JMP.W .label12                                             ;83C306|4C01C4  |83C401;
 
 
  + CMP.B #$10                                                 ;83C309|C910    |      ;
    BCC +                                                      ;83C30B|9003    |83C310;
    JMP.W .label12                                             ;83C30D|4C01C4  |83C401;
 
 
  + BRA .continue                                              ;83C310|805E    |83C370;
 
 
.label5:
    SEP #$20                                                   ;83C312|E220    |      ;
    LDY.W #$0001                                               ;83C314|A00100  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83C317|B772    |000072;
    CMP.B #$14                                                 ;83C319|C914    |      ;
    BCS .label6                                                ;83C31B|B012    |83C32F;
    LDA.B strcMap.loadAreaId                                   ;83C31D|A522    |000022;
    CMP.B #$10                                                 ;83C31F|C910    |      ;
    BCS +                                                      ;83C321|B003    |83C326;
    JMP.W .label12                                             ;83C323|4C01C4  |83C401;
 
 
  + CMP.B #$14                                                 ;83C326|C914    |      ;
    BCC +                                                      ;83C328|9003    |83C32D;
    JMP.W .label12                                             ;83C32A|4C01C4  |83C401;
 
 
  + BRA .continue                                              ;83C32D|8041    |83C370;
 
 
.label6:
    SEP #$20                                                   ;83C32F|E220    |      ;
    LDY.W #$0001                                               ;83C331|A00100  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83C334|B772    |000072;
    CMP.B #$18                                                 ;83C336|C918    |      ;
    BCS .label7                                                ;83C338|B012    |83C34C;
    LDA.B strcMap.loadAreaId                                   ;83C33A|A522    |000022;
    CMP.B #$15                                                 ;83C33C|C915    |      ;
    BCS +                                                      ;83C33E|B003    |83C343;
    JMP.W .label12                                             ;83C340|4C01C4  |83C401;
 
 
  + CMP.B #$18                                                 ;83C343|C918    |      ;
    BCC +                                                      ;83C345|9003    |83C34A;
    JMP.W .label12                                             ;83C347|4C01C4  |83C401;
 
 
  + BRA .continue                                              ;83C34A|8024    |83C370;
 
 
.label7:
    SEP #$20                                                   ;83C34C|E220    |      ;
    LDY.W #$0001                                               ;83C34E|A00100  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83C351|B772    |000072;
    CMP.B #$31                                                 ;83C353|C931    |      ;
    BCC .label8                                                ;83C355|900B    |83C362;
    LDA.B strcMap.loadAreaId                                   ;83C357|A522    |000022;
    CMP.B #$31                                                 ;83C359|C931    |      ;
    BCS +                                                      ;83C35B|B003    |83C360;
    JMP.W .label12                                             ;83C35D|4C01C4  |83C401;
 
 
  + BRA .continue                                              ;83C360|800E    |83C370;
 
 
.label8:
    SEP #$20                                                   ;83C362|E220    |      ;
    LDY.W #$0001                                               ;83C364|A00100  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83C367|B772    |000072;
    CMP.B strcMap.loadAreaId                                   ;83C369|C522    |000022;
    BEQ .continue                                              ;83C36B|F003    |83C370;
    JMP.W .label12                                             ;83C36D|4C01C4  |83C401;
 
 
.continue:
    REP #$20                                                   ;83C370|C220    |      ;
    LDY.W #$0004                                               ;83C372|A00400  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83C375|B772    |000072;
    STA.W nTileInFrontOfPlayerX                                ;83C377|8D8509  |000985;
    LDY.W #$0006                                               ;83C37A|A00600  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83C37D|B772    |000072;
    STA.W nTileInFrontOfPlayerY                                ;83C37F|8D8709  |000987;
    SEP #$20                                                   ;83C382|E220    |      ;
    LDY.W #$0000                                               ;83C384|A00000  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83C387|B772    |000072;
    AND.B #$02                                                 ;83C389|2902    |      ;
    BEQ .label9                                                ;83C38B|F01E    |83C3AB;
    REP #$20                                                   ;83C38D|C220    |      ;
    TXA                                                        ;83C38F|8A      |      ;
    CLC                                                        ;83C390|18      |      ;
    ADC.W #$0024                                               ;83C391|692400  |      ;
    LDX.W #$0000                                               ;83C394|A20000  |      ;
    LDY.W #$0000                                               ;83C397|A00000  |      ;
    JSL.L fAI_StartSlotScriptAtFrontTile                                    ;83C39A|22F88084|8480F8;
    SEP #$20                                                   ;83C39E|E220    |      ;
    REP #$10                                                   ;83C3A0|C210    |      ;
    LDY.W #$0000                                               ;83C3A2|A00000  |      ;
    LDA.B #$03                                                 ;83C3A5|A903    |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;83C3A7|97CC    |0000CC;
    BRA .label12                                               ;83C3A9|8056    |83C401;
 
 
.label9:
    SEP #$20                                                   ;83C3AB|E220    |      ;
    LDY.W #$0000                                               ;83C3AD|A00000  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83C3B0|B772    |000072;
    AND.B #$04                                                 ;83C3B2|2904    |      ;
    BEQ .label10                                               ;83C3B4|F013    |83C3C9;
    REP #$20                                                   ;83C3B6|C220    |      ;
    TXA                                                        ;83C3B8|8A      |      ;
    CLC                                                        ;83C3B9|18      |      ;
    ADC.W #$0024                                               ;83C3BA|692400  |      ;
    LDX.W #$0000                                               ;83C3BD|A20000  |      ;
    LDY.W #$0001                                               ;83C3C0|A00100  |      ;
    JSL.L fAI_StartSlotScriptAtFrontTile                                    ;83C3C3|22F88084|8480F8;
    BRA .label12                                               ;83C3C7|8038    |83C401;
 
 
.label10:
    SEP #$20                                                   ;83C3C9|E220    |      ;
    LDY.W #$0000                                               ;83C3CB|A00000  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83C3CE|B772    |000072;
    AND.B #$08                                                 ;83C3D0|2908    |      ;
    BEQ .label11                                               ;83C3D2|F01C    |83C3F0;
    REP #$20                                                   ;83C3D4|C220    |      ;
    TXA                                                        ;83C3D6|8A      |      ;
    CLC                                                        ;83C3D7|18      |      ;
    ADC.W #$0024                                               ;83C3D8|692400  |      ;
    LDX.W #$0000                                               ;83C3DB|A20000  |      ;
    LDY.W #$0002                                               ;83C3DE|A00200  |      ;
    JSL.L fAI_StartSlotScriptAtFrontTile                                    ;83C3E1|22F88084|8480F8;
    REP #$30                                                   ;83C3E5|C230    |      ;
    PLA                                                        ;83C3E7|68      |      ;
    PHA                                                        ;83C3E8|48      |      ;
    ASL A                                                      ;83C3E9|0A      |      ;
    TAX                                                        ;83C3EA|AA      |      ;
    STZ.W strcStockData.unkEachChicken,X                       ;83C3EB|9E3B09  |00093B;
    BRA .label12                                               ;83C3EE|8011    |83C401;
 
 
.label11:
    REP #$20                                                   ;83C3F0|C220    |      ;
    TXA                                                        ;83C3F2|8A      |      ;
    CLC                                                        ;83C3F3|18      |      ;
    ADC.W #$0024                                               ;83C3F4|692400  |      ;
    LDX.W #$0000                                               ;83C3F7|A20000  |      ;
    LDY.W #$005F                                               ;83C3FA|A05F00  |      ;
    JSL.L fAI_StartSlotScriptAtFrontTile                                    ;83C3FD|22F88084|8480F8;
 
.label12:
    REP #$30                                                   ;83C401|C230    |      ;
    PLX                                                        ;83C403|FA      |      ;
    INX                                                        ;83C404|E8      |      ;
    CPX.W #$000D                                               ;83C405|E00D00  |      ;
    BEQ +                                                      ;83C408|F003    |83C40D;
    JMP.W .label1                                              ;83C40A|4C9BC2  |83C29B;
 
 
  + LDX.W #$0000                                               ;83C40D|A20000  |      ;
 
.label13:
    REP #$30                                                   ;83C410|C230    |      ;
    PHX                                                        ;83C412|DA      |      ;
    PHX                                                        ;83C413|DA      |      ;
    TXA                                                        ;83C414|8A      |      ;
    JSL.L fGameEngine_GetCowData                               ;83C415|22A7C983|83C9A7;
    SEP #$20                                                   ;83C419|E220    |      ;
    REP #$10                                                   ;83C41B|C210    |      ;
    PLX                                                        ;83C41D|FA      |      ;
    LDY.W #$0000                                               ;83C41E|A00000  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83C421|B772    |000072;
    AND.B #$01                                                 ;83C423|2901    |      ;
    BNE +                                                      ;83C425|D003    |83C42A;
    JMP.W .label29                                             ;83C427|4C3DC6  |83C63D;
 
 
  + SEP #$20                                                   ;83C42A|E220    |      ;
    LDA.B strcMap.loadAreaId                                   ;83C42C|A522    |000022;
    CMP.B #$27                                                 ;83C42E|C927    |      ;
    BNE .label14                                               ;83C430|D03B    |83C46D;
    LDY.W #$0002                                               ;83C432|A00200  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83C435|B772    |000072;
    CMP.B #$27                                                 ;83C437|C927    |      ;
    BEQ +                                                      ;83C439|F003    |83C43E;
    JMP.W .label29                                             ;83C43B|4C3DC6  |83C63D;
 
 
  + PHX                                                        ;83C43E|DA      |      ;
    SEP #$20                                                   ;83C43F|E220    |      ;
    LDY.W #$0000                                               ;83C441|A00000  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83C444|B772    |000072;
    AND.B #$C0                                                 ;83C446|29C0    |      ;
    BEQ +                                                      ;83C448|F003    |83C44D;
    LDX.W #$000C                                               ;83C44A|A20C00  |      ;
 
  + REP #$20                                                   ;83C44D|C220    |      ;
    TXA                                                        ;83C44F|8A      |      ;
    ASL A                                                      ;83C450|0A      |      ;
    ASL A                                                      ;83C451|0A      |      ;
    TAX                                                        ;83C452|AA      |      ;
    LDY.W #$0008                                               ;83C453|A00800  |      ;
    LDA.L aGameEngine_AddCowPositionsData,X                    ;83C456|BF44CA83|83CA44;
    STA.W nTileInFrontOfPlayerX                                ;83C45A|8D8509  |000985;
    INX                                                        ;83C45D|E8      |      ;
    INX                                                        ;83C45E|E8      |      ;
    LDY.W #$000A                                               ;83C45F|A00A00  |      ;
    LDA.L aGameEngine_AddCowPositionsData,X                    ;83C462|BF44CA83|83CA44;
    STA.W nTileInFrontOfPlayerY                                ;83C466|8D8709  |000987;
    PLX                                                        ;83C469|FA      |      ;
    JMP.W .label20                                             ;83C46A|4C2EC5  |83C52E;
 
 
.label14:
    SEP #$20                                                   ;83C46D|E220    |      ;
    LDY.W #$0002                                               ;83C46F|A00200  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83C472|B772    |000072;
    CMP.B #$04                                                 ;83C474|C904    |      ;
    BCS .label15                                               ;83C476|B00C    |83C484;
    LDA.B strcMap.loadAreaId                                   ;83C478|A522    |000022;
    CMP.B #$04                                                 ;83C47A|C904    |      ;
    BCC +                                                      ;83C47C|9003    |83C481;
    JMP.W .label29                                             ;83C47E|4C3DC6  |83C63D;
 
 
  + JMP.W .label19                                             ;83C481|4C1CC5  |83C51C;
 
 
.label15:
    SEP #$20                                                   ;83C484|E220    |      ;
    LDY.W #$0002                                               ;83C486|A00200  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83C489|B772    |000072;
    CMP.B #$08                                                 ;83C48B|C908    |      ;
    BCS .label50                                               ;83C48D|B012    |83C4A1;
    LDA.B strcMap.loadAreaId                                   ;83C48F|A522    |000022;
    CMP.B #$04                                                 ;83C491|C904    |      ;
    BCS +                                                      ;83C493|B003    |83C498;
    JMP.W .label29                                             ;83C495|4C3DC6  |83C63D;
 
 
  + CMP.B #$08                                                 ;83C498|C908    |      ;
    BCC +                                                      ;83C49A|9003    |83C49F;
    JMP.W .label29                                             ;83C49C|4C3DC6  |83C63D;
 
 
  + BRA .label19                                               ;83C49F|807B    |83C51C;
 
 
.label50:
    SEP #$20                                                   ;83C4A1|E220    |      ;
    LDY.W #$0002                                               ;83C4A3|A00200  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83C4A6|B772    |000072;
    CMP.B #$10                                                 ;83C4A8|C910    |      ;
    BCS .label16                                               ;83C4AA|B012    |83C4BE;
    LDA.B strcMap.loadAreaId                                   ;83C4AC|A522    |000022;
    CMP.B #$0C                                                 ;83C4AE|C90C    |      ;
    BCS +                                                      ;83C4B0|B003    |83C4B5;
    JMP.W .label29                                             ;83C4B2|4C3DC6  |83C63D;
 
 
  + CMP.B #$10                                                 ;83C4B5|C910    |      ;
    BCC +                                                      ;83C4B7|9003    |83C4BC;
    JMP.W .label29                                             ;83C4B9|4C3DC6  |83C63D;
 
 
  + BRA .label19                                               ;83C4BC|805E    |83C51C;
 
 
.label16:
    SEP #$20                                                   ;83C4BE|E220    |      ;
    LDY.W #$0002                                               ;83C4C0|A00200  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83C4C3|B772    |000072;
    CMP.B #$14                                                 ;83C4C5|C914    |      ;
    BCS .label51                                               ;83C4C7|B012    |83C4DB;
    LDA.B strcMap.loadAreaId                                   ;83C4C9|A522    |000022;
    CMP.B #$10                                                 ;83C4CB|C910    |      ;
    BCS +                                                      ;83C4CD|B003    |83C4D2;
    JMP.W .label29                                             ;83C4CF|4C3DC6  |83C63D;
 
 
  + CMP.B #$14                                                 ;83C4D2|C914    |      ;
    BCC +                                                      ;83C4D4|9003    |83C4D9;
    JMP.W .label29                                             ;83C4D6|4C3DC6  |83C63D;
 
 
  + BRA .label19                                               ;83C4D9|8041    |83C51C;
 
 
.label51:
    SEP #$20                                                   ;83C4DB|E220    |      ;
    LDY.W #$0002                                               ;83C4DD|A00200  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83C4E0|B772    |000072;
    CMP.B #$18                                                 ;83C4E2|C918    |      ;
    BCS .label17                                               ;83C4E4|B012    |83C4F8;
    LDA.B strcMap.loadAreaId                                   ;83C4E6|A522    |000022;
    CMP.B #$15                                                 ;83C4E8|C915    |      ;
    BCS +                                                      ;83C4EA|B003    |83C4EF;
    JMP.W .label29                                             ;83C4EC|4C3DC6  |83C63D;
 
 
  + CMP.B #$18                                                 ;83C4EF|C918    |      ;
    BCC +                                                      ;83C4F1|9003    |83C4F6;
    JMP.W .label29                                             ;83C4F3|4C3DC6  |83C63D;
 
 
  + BRA .label19                                               ;83C4F6|8024    |83C51C;
 
 
.label17:
    SEP #$20                                                   ;83C4F8|E220    |      ;
    LDY.W #$0002                                               ;83C4FA|A00200  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83C4FD|B772    |000072;
    CMP.B #$31                                                 ;83C4FF|C931    |      ;
    BCC .label18                                               ;83C501|900B    |83C50E;
    LDA.B strcMap.loadAreaId                                   ;83C503|A522    |000022;
    CMP.B #$31                                                 ;83C505|C931    |      ;
    BCS +                                                      ;83C507|B003    |83C50C;
    JMP.W .label29                                             ;83C509|4C3DC6  |83C63D;
 
 
  + BRA .label19                                               ;83C50C|800E    |83C51C;
 
 
.label18:
    SEP #$20                                                   ;83C50E|E220    |      ;
    LDY.W #$0002                                               ;83C510|A00200  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83C513|B772    |000072;
    CMP.B strcMap.loadAreaId                                   ;83C515|C522    |000022;
    BEQ .label19                                               ;83C517|F003    |83C51C;
    JMP.W .label29                                             ;83C519|4C3DC6  |83C63D;
 
 
.label19:
    REP #$20                                                   ;83C51C|C220    |      ;
    LDY.W #$0008                                               ;83C51E|A00800  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83C521|B772    |000072;
    STA.W nTileInFrontOfPlayerX                                ;83C523|8D8509  |000985;
    LDY.W #$000A                                               ;83C526|A00A00  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83C529|B772    |000072;
    STA.W nTileInFrontOfPlayerY                                ;83C52B|8D8709  |000987;
 
.label20:
    SEP #$20                                                   ;83C52E|E220    |      ;
    LDY.W #$0000                                               ;83C530|A00000  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83C533|B772    |000072;
    AND.B #$02                                                 ;83C535|2902    |      ;
    BEQ .label22                                               ;83C537|F039    |83C572;
    REP #$20                                                   ;83C539|C220    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;83C53B|AD9601  |000196;
    AND.W #$0002                                               ;83C53E|290200  |      ;
    BEQ .label21                                               ;83C541|F010    |83C553;
    SEP #$20                                                   ;83C543|E220    |      ;
    LDY.W #$0002                                               ;83C545|A00200  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83C548|B772    |000072;
    CMP.B #$27                                                 ;83C54A|C927    |      ;
    BEQ .label21                                               ;83C54C|F005    |83C553;
    LDY.W #$0017                                               ;83C54E|A01700  |      ;
    BRA +                                                      ;83C551|8005    |83C558;
 
 
.label21:
    REP #$30                                                   ;83C553|C230    |      ;
    LDY.W #$0003                                               ;83C555|A00300  |      ;
 
  + REP #$20                                                   ;83C558|C220    |      ;
    TXA                                                        ;83C55A|8A      |      ;
    CLC                                                        ;83C55B|18      |      ;
    ADC.W #$0018                                               ;83C55C|691800  |      ;
    LDX.W #$0000                                               ;83C55F|A20000  |      ;
    JSL.L fAI_StartSlotScriptAtFrontTile                                    ;83C562|22F88084|8480F8;
    REP #$30                                                   ;83C566|C230    |      ;
    PLA                                                        ;83C568|68      |      ;
    PHA                                                        ;83C569|48      |      ;
    ASL A                                                      ;83C56A|0A      |      ;
    TAX                                                        ;83C56B|AA      |      ;
    STZ.W strcStockData.unkEachCow,X                           ;83C56C|9E5309  |000953;
    JMP.W .label29                                             ;83C56F|4C3DC6  |83C63D;
 
 
.label22:
    SEP #$20                                                   ;83C572|E220    |      ;
    LDY.W #$0000                                               ;83C574|A00000  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83C577|B772    |000072;
    AND.B #$04                                                 ;83C579|2904    |      ;
    BEQ .label24                                               ;83C57B|F039    |83C5B6;
    REP #$20                                                   ;83C57D|C220    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;83C57F|AD9601  |000196;
    AND.W #$0002                                               ;83C582|290200  |      ;
    BEQ .label23                                               ;83C585|F010    |83C597;
    SEP #$20                                                   ;83C587|E220    |      ;
    LDY.W #$0002                                               ;83C589|A00200  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83C58C|B772    |000072;
    CMP.B #$27                                                 ;83C58E|C927    |      ;
    BEQ .label23                                               ;83C590|F005    |83C597;
    LDY.W #$002F                                               ;83C592|A02F00  |      ;
    BRA +                                                      ;83C595|8005    |83C59C;
 
 
.label23:
    REP #$30                                                   ;83C597|C230    |      ;
    LDY.W #$0004                                               ;83C599|A00400  |      ;
 
  + REP #$20                                                   ;83C59C|C220    |      ;
    TXA                                                        ;83C59E|8A      |      ;
    CLC                                                        ;83C59F|18      |      ;
    ADC.W #$0018                                               ;83C5A0|691800  |      ;
    LDX.W #$0000                                               ;83C5A3|A20000  |      ;
    JSL.L fAI_StartSlotScriptAtFrontTile                                    ;83C5A6|22F88084|8480F8;
    REP #$30                                                   ;83C5AA|C230    |      ;
    PLA                                                        ;83C5AC|68      |      ;
    PHA                                                        ;83C5AD|48      |      ;
    ASL A                                                      ;83C5AE|0A      |      ;
    TAX                                                        ;83C5AF|AA      |      ;
    STZ.W strcStockData.unkEachCow,X                           ;83C5B0|9E5309  |000953;
    JMP.W .label29                                             ;83C5B3|4C3DC6  |83C63D;
 
 
.label24:
    SEP #$20                                                   ;83C5B6|E220    |      ;
    LDY.W #$0000                                               ;83C5B8|A00000  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83C5BB|B772    |000072;
    AND.B #$08                                                 ;83C5BD|2908    |      ;
    BEQ .label29                                               ;83C5BF|F07C    |83C63D;
    SEP #$20                                                   ;83C5C1|E220    |      ;
    LDY.W #$0000                                               ;83C5C3|A00000  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83C5C6|B772    |000072;
    AND.B #$80                                                 ;83C5C8|2980    |      ;
    BNE .label26                                               ;83C5CA|D04A    |83C616;
    SEP #$20                                                   ;83C5CC|E220    |      ;
    LDY.W #$0000                                               ;83C5CE|A00000  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83C5D1|B772    |000072;
    AND.B #$40                                                 ;83C5D3|2940    |      ;
    BEQ .label25                                               ;83C5D5|F005    |83C5DC;
    LDY.W #$0008                                               ;83C5D7|A00800  |      ;
    BRA .label28                                               ;83C5DA|8048    |83C624;
 
 
.label25:
    SEP #$20                                                   ;83C5DC|E220    |      ;
    LDY.W #$0000                                               ;83C5DE|A00000  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83C5E1|B772    |000072;
    AND.B #$20                                                 ;83C5E3|2920    |      ;
    BEQ +                                                      ;83C5E5|F005    |83C5EC;
    LDY.W #$0007                                               ;83C5E7|A00700  |      ;
    BRA .label28                                               ;83C5EA|8038    |83C624;
 
 
  + SEP #$20                                                   ;83C5EC|E220    |      ;
    LDY.W #$0000                                               ;83C5EE|A00000  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83C5F1|B772    |000072;
    AND.B #$10                                                 ;83C5F3|2910    |      ;
    BEQ +                                                      ;83C5F5|F005    |83C5FC;
    LDY.W #$0006                                               ;83C5F7|A00600  |      ;
    BRA .label28                                               ;83C5FA|8028    |83C624;
 
 
  + REP #$20                                                   ;83C5FC|C220    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;83C5FE|AD9601  |000196;
    AND.W #$0002                                               ;83C601|290200  |      ;
    BEQ .label27                                               ;83C604|F01B    |83C621;
    SEP #$20                                                   ;83C606|E220    |      ;
    LDY.W #$0002                                               ;83C608|A00200  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83C60B|B772    |000072;
    CMP.B #$27                                                 ;83C60D|C927    |      ;
    BEQ .label27                                               ;83C60F|F010    |83C621;
    LDY.W #$0009                                               ;83C611|A00900  |      ;
    BRA .label28                                               ;83C614|800E    |83C624;
 
 
.label26:
    SEP #$20                                                   ;83C616|E220    |      ;
    LDY.W #$0000                                               ;83C618|A00000  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83C61B|B772    |000072;
    AND.B #$7F                                                 ;83C61D|297F    |      ;
    STA.B [ptrTemp0x72],Y                                      ;83C61F|9772    |000072;
 
.label27:
    LDY.W #$0005                                               ;83C621|A00500  |      ;
 
.label28:
    REP #$20                                                   ;83C624|C220    |      ;
    TXA                                                        ;83C626|8A      |      ;
    CLC                                                        ;83C627|18      |      ;
    ADC.W #$0018                                               ;83C628|691800  |      ;
    LDX.W #$0000                                               ;83C62B|A20000  |      ;
    JSL.L fAI_StartSlotScriptAtFrontTile                                    ;83C62E|22F88084|8480F8;
    REP #$30                                                   ;83C632|C230    |      ;
    PLA                                                        ;83C634|68      |      ;
    PHA                                                        ;83C635|48      |      ;
    ASL A                                                      ;83C636|0A      |      ;
    TAX                                                        ;83C637|AA      |      ;
    STZ.W strcStockData.unkEachCow,X                           ;83C638|9E5309  |000953;
    BRA .label29                                               ;83C63B|8000    |83C63D;
 
 
.label29:
    REP #$30                                                   ;83C63D|C230    |      ;
    PLX                                                        ;83C63F|FA      |      ;
    INX                                                        ;83C640|E8      |      ;
    CPX.W #$000C                                               ;83C641|E00C00  |      ;
    BEQ +                                                      ;83C644|F003    |83C649;
    JMP.W .label13                                             ;83C646|4C10C4  |83C410;
 
 
  + REP #$30                                                   ;83C649|C230    |      ;
    %CheckFlag(event3, $0080)
    BNE +                                                      ;83C652|D003    |83C657;
    JMP.W .label37                                             ;83C654|4C34C7  |83C734;
 
 
  + %CheckPlayerFlagsNoReg(!PFLAGS_DOGHUGGING)
    BEQ +                                                      ;83C65C|F003    |83C661;
    JMP.W .label37                                             ;83C65E|4C34C7  |83C734;
 
 
  + SEP #$20                                                   ;83C661|E220    |      ;
    LDA.L nDogAreaId                                           ;83C663|AF301F7F|7F1F30;
    CMP.B #$04                                                 ;83C667|C904    |      ;
    BCS .label30                                               ;83C669|B00C    |83C677;
    LDA.B strcMap.loadAreaId                                   ;83C66B|A522    |000022;
    CMP.B #$04                                                 ;83C66D|C904    |      ;
    BCC +                                                      ;83C66F|9003    |83C674;
    JMP.W .label37                                             ;83C671|4C34C7  |83C734;
 
 
  + JMP.W .jump1                                               ;83C674|4C09C7  |83C709;
 
 
.label30:
    SEP #$20                                                   ;83C677|E220    |      ;
    LDA.L nDogAreaId                                           ;83C679|AF301F7F|7F1F30;
    CMP.B #$08                                                 ;83C67D|C908    |      ;
    BCS .label31                                               ;83C67F|B012    |83C693;
    LDA.B strcMap.loadAreaId                                   ;83C681|A522    |000022;
    CMP.B #$04                                                 ;83C683|C904    |      ;
    BCS +                                                      ;83C685|B003    |83C68A;
    JMP.W .label37                                             ;83C687|4C34C7  |83C734;
 
 
  + CMP.B #$08                                                 ;83C68A|C908    |      ;
    BCC +                                                      ;83C68C|9003    |83C691;
    JMP.W .label37                                             ;83C68E|4C34C7  |83C734;
 
 
  + BRA .jump1                                                 ;83C691|8076    |83C709;
 
 
.label31:
    SEP #$20                                                   ;83C693|E220    |      ;
    LDA.L nDogAreaId                                           ;83C695|AF301F7F|7F1F30;
    CMP.B #$10                                                 ;83C699|C910    |      ;
    BCS .label33                                               ;83C69B|B012    |83C6AF;
    LDA.B strcMap.loadAreaId                                   ;83C69D|A522    |000022;
    CMP.B #$0C                                                 ;83C69F|C90C    |      ;
    BCS +                                                      ;83C6A1|B003    |83C6A6;
    JMP.W .label37                                             ;83C6A3|4C34C7  |83C734;
 
 
  + CMP.B #$10                                                 ;83C6A6|C910    |      ;
    BCC +                                                      ;83C6A8|9003    |83C6AD;
    JMP.W .label37                                             ;83C6AA|4C34C7  |83C734;
 
 
  + BRA .jump1                                                 ;83C6AD|805A    |83C709;
 
 
.label33:
    SEP #$20                                                   ;83C6AF|E220    |      ;
    LDA.L nDogAreaId                                           ;83C6B1|AF301F7F|7F1F30;
    CMP.B #$14                                                 ;83C6B5|C914    |      ;
    BCS .label34                                               ;83C6B7|B012    |83C6CB;
    LDA.B strcMap.loadAreaId                                   ;83C6B9|A522    |000022;
    CMP.B #$10                                                 ;83C6BB|C910    |      ;
    BCS +                                                      ;83C6BD|B003    |83C6C2;
    JMP.W .label37                                             ;83C6BF|4C34C7  |83C734;
 
 
  + CMP.B #$14                                                 ;83C6C2|C914    |      ;
    BCC +                                                      ;83C6C4|9003    |83C6C9;
    JMP.W .label37                                             ;83C6C6|4C34C7  |83C734;
 
 
  + BRA .jump1                                                 ;83C6C9|803E    |83C709;
 
 
.label34:
    SEP #$20                                                   ;83C6CB|E220    |      ;
    LDA.L nDogAreaId                                           ;83C6CD|AF301F7F|7F1F30;
    CMP.B #$18                                                 ;83C6D1|C918    |      ;
    BCS .label35                                               ;83C6D3|B012    |83C6E7;
    LDA.B strcMap.loadAreaId                                   ;83C6D5|A522    |000022;
    CMP.B #$15                                                 ;83C6D7|C915    |      ;
    BCS +                                                      ;83C6D9|B003    |83C6DE;
    JMP.W .label37                                             ;83C6DB|4C34C7  |83C734;
 
 
  + CMP.B #$18                                                 ;83C6DE|C918    |      ;
    BCC +                                                      ;83C6E0|9003    |83C6E5;
    JMP.W .label37                                             ;83C6E2|4C34C7  |83C734;
 
 
  + BRA .jump1                                                 ;83C6E5|8022    |83C709;
 
 
.label35:
    SEP #$20                                                   ;83C6E7|E220    |      ;
    LDA.L nDogAreaId                                           ;83C6E9|AF301F7F|7F1F30;
    CMP.B #$31                                                 ;83C6ED|C931    |      ;
    BCC .label36                                               ;83C6EF|900B    |83C6FC;
    LDA.B strcMap.loadAreaId                                   ;83C6F1|A522    |000022;
    CMP.B #$31                                                 ;83C6F3|C931    |      ;
    BCS +                                                      ;83C6F5|B003    |83C6FA;
    JMP.W .label37                                             ;83C6F7|4C34C7  |83C734;
 
 
  + BRA .jump1                                                 ;83C6FA|800D    |83C709;
 
 
.label36:
    SEP #$20                                                   ;83C6FC|E220    |      ;
    LDA.L nDogAreaId                                           ;83C6FE|AF301F7F|7F1F30;
    CMP.B strcMap.loadAreaId                                   ;83C702|C522    |000022;
    BEQ .jump1                                                 ;83C704|F003    |83C709;
    JMP.W .label37                                             ;83C706|4C34C7  |83C734;
 
 
.jump1:
    REP #$30                                                   ;83C709|C230    |      ;
    LDA.L nDogX                                                ;83C70B|AF2C1F7F|7F1F2C;
    STA.W nTileInFrontOfPlayerX                                ;83C70F|8D8509  |000985;
    LDA.L nDogY                                                ;83C712|AF2E1F7F|7F1F2E;
    STA.W nTileInFrontOfPlayerY                                ;83C716|8D8709  |000987;
    LDA.W #$0016                                               ;83C719|A91600  |      ;
    LDX.W #$0000                                               ;83C71C|A20000  |      ;
    LDY.W #$0011                                               ;83C71F|A01100  |      ;
    JSL.L fAI_StartSlotScriptAtFrontTile                                    ;83C722|22F88084|8480F8;
    REP #$20                                                   ;83C726|C220    |      ;
    LDA.W #$0001                                               ;83C728|A90100  |      ;
    STA.L $7F1F58                                              ;83C72B|8F581F7F|7F1F58;
    SEP #$20                                                   ;83C72F|E220    |      ;
    STZ.W strcStockData.unkDog                                 ;83C731|9C3809  |000938;
 
.label37:
    REP #$30                                                   ;83C734|C230    |      ;
    %CheckFlag(event3, $0100)
    BNE +                                                      ;83C73D|D003    |83C742;
    JMP.W .return                                              ;83C73F|4C06C8  |83C806;
 
 
  + %CheckPlayerFlagsNoReg(!PFLAGS_RIDINGHORSE)
    BEQ +                                                      ;83C747|F003    |83C74C;
    JMP.W .return                                              ;83C749|4C06C8  |83C806;
 
 
  + SEP #$20                                                   ;83C74C|E220    |      ;
    LDA.L nHorseAreaIdMaybe                                    ;83C74E|AF311F7F|7F1F31;
    CMP.B #$04                                                 ;83C752|C904    |      ;
    BCS .label38                                               ;83C754|B00B    |83C761;
    LDA.B strcMap.loadAreaId                                   ;83C756|A522    |000022;
    CMP.B #$04                                                 ;83C758|C904    |      ;
    BCC +                                                      ;83C75A|9003    |83C75F;
    JMP.W .return                                              ;83C75C|4C06C8  |83C806;
 
 
  + BRA .jump2                                                 ;83C75F|8076    |83C7D7;
 
 
.label38:
    SEP #$20                                                   ;83C761|E220    |      ;
    LDA.L nHorseAreaIdMaybe                                    ;83C763|AF311F7F|7F1F31;
    CMP.B #$08                                                 ;83C767|C908    |      ;
    BCS .label39                                               ;83C769|B012    |83C77D;
    LDA.B strcMap.loadAreaId                                   ;83C76B|A522    |000022;
    CMP.B #$04                                                 ;83C76D|C904    |      ;
    BCS +                                                      ;83C76F|B003    |83C774;
    JMP.W .return                                              ;83C771|4C06C8  |83C806;
 
 
  + CMP.B #$08                                                 ;83C774|C908    |      ;
    BCC +                                                      ;83C776|9003    |83C77B;
    JMP.W .return                                              ;83C778|4C06C8  |83C806;
 
 
  + BRA .jump2                                                 ;83C77B|805A    |83C7D7;
 
 
.label39:
    SEP #$20                                                   ;83C77D|E220    |      ;
    LDA.L nHorseAreaIdMaybe                                    ;83C77F|AF311F7F|7F1F31;
    CMP.B #$10                                                 ;83C783|C910    |      ;
    BCS .label40                                               ;83C785|B012    |83C799;
    LDA.B strcMap.loadAreaId                                   ;83C787|A522    |000022;
    CMP.B #$0C                                                 ;83C789|C90C    |      ;
    BCS +                                                      ;83C78B|B003    |83C790;
    JMP.W .return                                              ;83C78D|4C06C8  |83C806;
 
 
  + CMP.B #$10                                                 ;83C790|C910    |      ;
    BCC +                                                      ;83C792|9003    |83C797;
    JMP.W .return                                              ;83C794|4C06C8  |83C806;
 
 
  + BRA .jump2                                                 ;83C797|803E    |83C7D7;
 
 
.label40:
    SEP #$20                                                   ;83C799|E220    |      ;
    LDA.L nHorseAreaIdMaybe                                    ;83C79B|AF311F7F|7F1F31;
    CMP.B #$14                                                 ;83C79F|C914    |      ;
    BCS .label41                                               ;83C7A1|B012    |83C7B5;
    LDA.B strcMap.loadAreaId                                   ;83C7A3|A522    |000022;
    CMP.B #$10                                                 ;83C7A5|C910    |      ;
    BCS +                                                      ;83C7A7|B003    |83C7AC;
    JMP.W .return                                              ;83C7A9|4C06C8  |83C806;
 
 
  + CMP.B #$14                                                 ;83C7AC|C914    |      ;
    BCC +                                                      ;83C7AE|9003    |83C7B3;
    JMP.W .return                                              ;83C7B0|4C06C8  |83C806;
 
 
  + BRA .jump2                                                 ;83C7B3|8022    |83C7D7;
 
 
.label41:
    SEP #$20                                                   ;83C7B5|E220    |      ;
    LDA.L nHorseAreaIdMaybe                                    ;83C7B7|AF311F7F|7F1F31;
    CMP.B #$31                                                 ;83C7BB|C931    |      ;
    BCC .label42                                               ;83C7BD|900B    |83C7CA;
    LDA.B strcMap.loadAreaId                                   ;83C7BF|A522    |000022;
    CMP.B #$31                                                 ;83C7C1|C931    |      ;
    BCS +                                                      ;83C7C3|B003    |83C7C8;
    JMP.W .return                                              ;83C7C5|4C06C8  |83C806;
 
 
  + BRA .jump2                                                 ;83C7C8|800D    |83C7D7;
 
 
.label42:
    SEP #$20                                                   ;83C7CA|E220    |      ;
    LDA.L nHorseAreaIdMaybe                                    ;83C7CC|AF311F7F|7F1F31;
    CMP.B strcMap.loadAreaId                                   ;83C7D0|C522    |000022;
    BEQ .jump2                                                 ;83C7D2|F003    |83C7D7;
    JMP.W .return                                              ;83C7D4|4C06C8  |83C806;
 
 
.jump2:
    REP #$30                                                   ;83C7D7|C230    |      ;
    LDA.W #$0110                                               ;83C7D9|A91001  |      ;
    STA.W nTileInFrontOfPlayerX                                ;83C7DC|8D8509  |000985;
    LDA.W #$0140                                               ;83C7DF|A94001  |      ;
    STA.W nTileInFrontOfPlayerY                                ;83C7E2|8D8709  |000987;
    LDY.W #$0013                                               ;83C7E5|A01300  |      ;
    SEP #$20                                                   ;83C7E8|E220    |      ;
    LDA.L nHorseAge                                            ;83C7EA|AF321F7F|7F1F32;
    CMP.B #$15                                                 ;83C7EE|C915    |      ;
    BNE +                                                      ;83C7F0|D003    |83C7F5;
    LDY.W #$0010                                               ;83C7F2|A01000  |      ;
 
  + REP #$30                                                   ;83C7F5|C230    |      ;
    LDA.W #$0017                                               ;83C7F7|A91700  |      ;
    LDX.W #$0000                                               ;83C7FA|A20000  |      ;
    JSL.L fAI_StartSlotScriptAtFrontTile                                    ;83C7FD|22F88084|8480F8;
    SEP #$20                                                   ;83C801|E220    |      ;
    STZ.W strcStockData.unkHorse                               ;83C803|9C3909  |000939;
 
.return:
    RTL                                                        ;83C806|6B      |      ;
 
 
fGameEngine_AddChicken:
    REP #$30                                                   ;83C807|C230    |      ; A: nAddType (0 - bought, 1 - hatched), return A: nResult
    STA.B strcVariables.n16Temp1                               ;83C809|857E    |00007E;
    LDX.W #$0000                                               ;83C80B|A20000  |      ;
 
  - REP #$30                                                   ;83C80E|C230    |      ;
    PHX                                                        ;83C810|DA      |      ;
    TXA                                                        ;83C811|8A      |      ;
    JSL.L fGameEngine_GetChickenData                           ;83C812|2295C983|83C995;
    SEP #$20                                                   ;83C816|E220    |      ;
    REP #$10                                                   ;83C818|C210    |      ;
    PLX                                                        ;83C81A|FA      |      ;
    LDY.W #$0000                                               ;83C81B|A00000  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83C81E|B772    |000072; strcChickenData.statusFlags
    AND.B #$01                                                 ;83C820|2901    |      ; exists
    BEQ .notAllExists                                          ;83C822|F008    |83C82C;
    REP #$30                                                   ;83C824|C230    |      ;
    INX                                                        ;83C826|E8      |      ;
    CPX.W #$000D                                               ;83C827|E00D00  |      ;
    BNE -                                                      ;83C82A|D0E2    |83C80E;
 
.notAllExists:
    SEP #$20                                                   ;83C82C|E220    |      ;
    REP #$10                                                   ;83C82E|C210    |      ;
    CPX.W #$000D                                               ;83C830|E00D00  |      ;
    BNE .notFull                                               ;83C833|D003    |83C838;
    JMP.W .return1                                             ;83C835|4CD6C8  |83C8D6;
 
 
.notFull:
    LDY.W #$0000                                               ;83C838|A00000  |      ;
 
  - SEP #$20                                                   ;83C83B|E220    |      ;
    LDA.B #$00                                                 ;83C83D|A900    |      ;
    STA.B [ptrTemp0x72],Y                                      ;83C83F|9772    |000072; strcChickenData.statusFlags
    INY                                                        ;83C841|C8      |      ;
    CPY.W #$0008                                               ;83C842|C00800  |      ;
    BNE -                                                      ;83C845|D0F4    |83C83B;
    SEP #$20                                                   ;83C847|E220    |      ;
    LDY.W #$0001                                               ;83C849|A00100  |      ;
    LDA.B #$28                                                 ;83C84C|A928    |      ;
    STA.B [ptrTemp0x72],Y                                      ;83C84E|9772    |000072; strcChickenData.mapID = 0x28
    LDY.W #$0002                                               ;83C850|A00200  |      ;
    LDA.B #$00                                                 ;83C853|A900    |      ;
    STA.B [ptrTemp0x72],Y                                      ;83C855|9772    |000072; strcChickenData.unknown2 = 0
    REP #$20                                                   ;83C857|C220    |      ;
    LDA.B strcVariables.n16Temp1                               ;83C859|A57E    |00007E;
    CMP.W #$0001                                               ;83C85B|C90100  |      ;
    BEQ .label5                                                ;83C85E|F022    |83C882;
    CMP.W #$0002                                               ;83C860|C90200  |      ;
    BEQ .label6                                                ;83C863|F028    |83C88D;
    SEP #$20                                                   ;83C865|E220    |      ;
    LDY.W #$0000                                               ;83C867|A00000  |      ;
    LDA.B #$43                                                 ;83C86A|A943    |      ;
    STA.B [ptrTemp0x72],Y                                      ;83C86C|9772    |000072; strcChickenData.statusFlags = 01000011 - adult, exists
    REP #$30                                                   ;83C86E|C230    |      ;
    LDY.W #$0004                                               ;83C870|A00400  |      ;
    LDA.W #$00E8                                               ;83C873|A9E800  |      ;
    STA.B [ptrTemp0x72],Y                                      ;83C876|9772    |000072; strcChickenData.positionX = 0xE8
    LDY.W #$0006                                               ;83C878|A00600  |      ;
    LDA.W #$00B8                                               ;83C87B|A9B800  |      ;
    STA.B [ptrTemp0x72],Y                                      ;83C87E|9772    |000072; strcChickenData.positionY = 0xB8
    BRA .return0                                               ;83C880|804E    |83C8D0;
 
 
.label5:
    SEP #$20                                                   ;83C882|E220    |      ;
    LDY.W #$0000                                               ;83C884|A00000  |      ;
    LDA.B #$09                                                 ;83C887|A909    |      ;
    STA.B [ptrTemp0x72],Y                                      ;83C889|9772    |000072; strcChickenData.statusFlags = 00001001 - baby, exists
    BRA .label7                                                ;83C88B|8029    |83C8B6;
 
 
.label6:
    SEP #$20                                                   ;83C88D|E220    |      ;
    LDY.W #$0000                                               ;83C88F|A00000  |      ;
    LDA.B #$09                                                 ;83C892|A909    |      ;
    STA.B [ptrTemp0x72],Y                                      ;83C894|9772    |000072; strcChickenData.statusFlags = 00001001 - baby, exists
    LDY.W #$0001                                               ;83C896|A00100  |      ;
    LDA.L nCurrentSeasonID                                     ;83C899|AF191F7F|7F1F19;
    CLC                                                        ;83C89D|18      |      ;
    ADC.B #$04                                                 ;83C89E|6904    |      ;
    STA.B [ptrTemp0x72],Y                                      ;83C8A0|9772    |000072; strcChickenData.mapID = 0x04 + seasonId
    REP #$20                                                   ;83C8A2|C220    |      ;
    LDY.W #$0004                                               ;83C8A4|A00400  |      ;
    LDA.W #$0238                                               ;83C8A7|A93802  |      ;
    STA.B [ptrTemp0x72],Y                                      ;83C8AA|9772    |000072; strcChickenData.positionX = 0x0238
    LDY.W #$0006                                               ;83C8AC|A00600  |      ;
    LDA.W #$0318                                               ;83C8AF|A91803  |      ;
    STA.B [ptrTemp0x72],Y                                      ;83C8B2|9772    |000072; strcChickenData.positionY = 0x0318
    BRA .return0                                               ;83C8B4|801A    |83C8D0;
 
 
.label7:
    REP #$30                                                   ;83C8B6|C230    |      ;
    TXA                                                        ;83C8B8|8A      |      ;
    ASL A                                                      ;83C8B9|0A      |      ;
    ASL A                                                      ;83C8BA|0A      |      ;
    TAX                                                        ;83C8BB|AA      |      ;
    LDY.W #$0004                                               ;83C8BC|A00400  |      ;
    LDA.L aGameEngine_AddChickenPositionsData,X                ;83C8BF|BF10CA83|83CA10;
    STA.B [ptrTemp0x72],Y                                      ;83C8C3|9772    |000072; strcChickenData.positionX
    INX                                                        ;83C8C5|E8      |      ;
    INX                                                        ;83C8C6|E8      |      ;
    LDY.W #$0006                                               ;83C8C7|A00600  |      ;
    LDA.L aGameEngine_AddChickenPositionsData,X                ;83C8CA|BF10CA83|83CA10; strcChickenData.positionY
    STA.B [ptrTemp0x72],Y                                      ;83C8CE|9772    |000072;
 
.return0:
    REP #$20                                                   ;83C8D0|C220    |      ;
    LDA.W #$0000                                               ;83C8D2|A90000  |      ;
    RTL                                                        ;83C8D5|6B      |      ;
 
 
.return1:
    REP #$30                                                   ;83C8D6|C230    |      ;
    LDA.W #$0001                                               ;83C8D8|A90100  |      ;
    RTL                                                        ;83C8DB|6B      |      ;
 
 
fGameEngine_AddCow:
    REP #$30                                                   ;83C8DC|C230    |      ; A: nAddType (0 - bought, 1 - born), return A: nResult
    STA.B strcVariables.n16Temp1                               ;83C8DE|857E    |00007E;
    LDX.W #$0000                                               ;83C8E0|A20000  |      ;
 
  - REP #$30                                                   ;83C8E3|C230    |      ;
    PHX                                                        ;83C8E5|DA      |      ;
    TXA                                                        ;83C8E6|8A      |      ;
    JSL.L fGameEngine_GetCowData                               ;83C8E7|22A7C983|83C9A7;
    SEP #$20                                                   ;83C8EB|E220    |      ;
    REP #$10                                                   ;83C8ED|C210    |      ;
    PLX                                                        ;83C8EF|FA      |      ;
    LDY.W #$0000                                               ;83C8F0|A00000  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83C8F3|B772    |000072; strcCowData.statusFlags
    AND.B #$01                                                 ;83C8F5|2901    |      ; exists
    BEQ .notAllExists                                          ;83C8F7|F008    |83C901;
    REP #$30                                                   ;83C8F9|C230    |      ;
    INX                                                        ;83C8FB|E8      |      ;
    CPX.W #$000C                                               ;83C8FC|E00C00  |      ;
    BNE -                                                      ;83C8FF|D0E2    |83C8E3;
 
.notAllExists:
    SEP #$20                                                   ;83C901|E220    |      ;
    REP #$10                                                   ;83C903|C210    |      ;
    CPX.W #$000C                                               ;83C905|E00C00  |      ;
    BNE .notFull                                               ;83C908|D003    |83C90D;
    JMP.W .return1                                             ;83C90A|4C8FC9  |83C98F;
 
 
.notFull:
    LDY.W #$0000                                               ;83C90D|A00000  |      ;
 
  - LDA.B #$00                                                 ;83C910|A900    |      ;
    STA.B [ptrTemp0x72],Y                                      ;83C912|9772    |000072; strcCowData.statusFlags
    INY                                                        ;83C914|C8      |      ;
    CPY.W #$0010                                               ;83C915|C01000  |      ;
    BNE -                                                      ;83C918|D0F6    |83C910;
    SEP #$20                                                   ;83C91A|E220    |      ;
    LDY.W #$0002                                               ;83C91C|A00200  |      ;
    LDA.B #$27                                                 ;83C91F|A927    |      ;
    STA.B [ptrTemp0x72],Y                                      ;83C921|9772    |000072; strcCowData.mapID = 0x27
    LDY.W #$0003                                               ;83C923|A00300  |      ;
    LDA.B #$00                                                 ;83C926|A900    |      ;
    STA.B [ptrTemp0x72],Y                                      ;83C928|9772    |000072; strcCowData.age = 0x00
    LDY.W #$0004                                               ;83C92A|A00400  |      ;
    LDA.B #$00                                                 ;83C92D|A900    |      ;
    STA.B [ptrTemp0x72],Y                                      ;83C92F|9772    |000072; strcCowData.happiness = 0x00
    LDY.W #$0005                                               ;83C931|A00500  |      ;
    LDA.B #$00                                                 ;83C934|A900    |      ;
    STA.B [ptrTemp0x72],Y                                      ;83C936|9772    |000072; strcCowData.unknown5 = 0x00
    SEP #$20                                                   ;83C938|E220    |      ;
    LDY.W #$0001                                               ;83C93A|A00100  |      ;
    LDA.B #$00                                                 ;83C93D|A900    |      ;
    STA.B [ptrTemp0x72],Y                                      ;83C93F|9772    |000072; strcCowData.unknown1 = 0x00
    SEP #$20                                                   ;83C941|E220    |      ;
    LDY.W #$0000                                               ;83C943|A00000  |      ;
    LDA.B #$05                                                 ;83C946|A905    |      ;
    STA.B [ptrTemp0x72],Y                                      ;83C948|9772    |000072; strcCowData.statusFlags = 00000101 - adult, exists
    REP #$20                                                   ;83C94A|C220    |      ;
    LDA.B strcVariables.n16Temp1                               ;83C94C|A57E    |00007E;
    BEQ +                                                      ;83C94E|F01F    |83C96F;
    SEP #$20                                                   ;83C950|E220    |      ;
    LDY.W #$0000                                               ;83C952|A00000  |      ;
    LDA.B #$03                                                 ;83C955|A903    |      ;
    STA.B [ptrTemp0x72],Y                                      ;83C957|9772    |000072; strcCowData.statusFlags = 00000011 - child, exists
    SEP #$20                                                   ;83C959|E220    |      ;
    LDY.W #$0004                                               ;83C95B|A00400  |      ;
    LDA.L nNewBornCowAffection                                 ;83C95E|AF2B1F7F|7F1F2B;
    STA.B [ptrTemp0x72],Y                                      ;83C962|9772    |000072; strcCowData.happiness = newBornCowAffection
    REP #$30                                                   ;83C964|C230    |      ;
    LDA.W #$0046                                               ;83C966|A94600  |      ;
    JSL.L fGameEngine_AddHappiness                             ;83C969|2282B283|83B282;
    REP #$30                                                   ;83C96D|C230    |      ;
 
  + REP #$30                                                   ;83C96F|C230    |      ;
    TXA                                                        ;83C971|8A      |      ;
    ASL A                                                      ;83C972|0A      |      ;
    ASL A                                                      ;83C973|0A      |      ;
    TAX                                                        ;83C974|AA      |      ;
    LDY.W #$0008                                               ;83C975|A00800  |      ;
    LDA.L aGameEngine_AddCowPositionsData,X                    ;83C978|BF44CA83|83CA44;
    STA.B [ptrTemp0x72],Y                                      ;83C97C|9772    |000072; strcCowData.positionX
    INX                                                        ;83C97E|E8      |      ;
    INX                                                        ;83C97F|E8      |      ;
    LDY.W #$000A                                               ;83C980|A00A00  |      ;
    LDA.L aGameEngine_AddCowPositionsData,X                    ;83C983|BF44CA83|83CA44;
    STA.B [ptrTemp0x72],Y                                      ;83C987|9772    |000072; strcCowData.positionY
    REP #$20                                                   ;83C989|C220    |      ;
    LDA.W #$0000                                               ;83C98B|A90000  |      ;
    RTL                                                        ;83C98E|6B      |      ;
 
 
.return1:
    REP #$30                                                   ;83C98F|C230    |      ;
    LDA.W #$0001                                               ;83C991|A90100  |      ;
    RTL                                                        ;83C994|6B      |      ;
 
 
fGameEngine_GetChickenData:
    REP #$30                                                   ;83C995|C230    |      ; A: nIndex, return $72: ptr24 pChickenData
    ASL A                                                      ;83C997|0A      |      ;
    ASL A                                                      ;83C998|0A      |      ;
    ASL A                                                      ;83C999|0A      |      ;
    CLC                                                        ;83C99A|18      |      ;
    ADC.W #$C286                                               ;83C99B|6986C2  |      ;
    STA.B ptrTemp0x72                                          ;83C99E|8572    |000072;
    SEP #$20                                                   ;83C9A0|E220    |      ;
    LDA.B #$7E                                                 ;83C9A2|A97E    |      ;
    STA.B ptrTemp0x72+2                                        ;83C9A4|8574    |000074; $72 = 0x7EC286
    RTL                                                        ;83C9A6|6B      |      ;
 
 
fGameEngine_GetCowData:
    REP #$30                                                   ;83C9A7|C230    |      ; A: nIndex, return $72: ptr24 pCowData
    ASL A                                                      ;83C9A9|0A      |      ;
    ASL A                                                      ;83C9AA|0A      |      ;
    ASL A                                                      ;83C9AB|0A      |      ;
    ASL A                                                      ;83C9AC|0A      |      ;
    CLC                                                        ;83C9AD|18      |      ;
    ADC.W #$C1C6                                               ;83C9AE|69C6C1  |      ;
    STA.B ptrTemp0x72                                          ;83C9B1|8572    |000072;
    SEP #$20                                                   ;83C9B3|E220    |      ;
    LDA.B #$7E                                                 ;83C9B5|A97E    |      ;
    STA.B ptrTemp0x72+2                                        ;83C9B7|8574    |000074; $72 = 0x7EC1C6
    RTL                                                        ;83C9B9|6B      |      ;
 
 
fGameEngine_ChickenUnused83C9BA:
    LDX.W #$0000                                               ;83C9BA|A20000  |      ;
    LDY.W #$0000                                               ;83C9BD|A00000  |      ;
 
  - REP #$30                                                   ;83C9C0|C230    |      ;
    PHY                                                        ;83C9C2|5A      |      ;
    PHX                                                        ;83C9C3|DA      |      ;
    TXA                                                        ;83C9C4|8A      |      ;
    JSL.L fGameEngine_GetChickenData                           ;83C9C5|2295C983|83C995;
    SEP #$20                                                   ;83C9C9|E220    |      ;
    REP #$10                                                   ;83C9CB|C210    |      ;
    PLX                                                        ;83C9CD|FA      |      ;
    LDY.W #$0000                                               ;83C9CE|A00000  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83C9D1|B772    |000072;
    PLY                                                        ;83C9D3|7A      |      ;
    AND.B #$01                                                 ;83C9D4|2901    |      ;
    BEQ +                                                      ;83C9D6|F001    |83C9D9;
    INY                                                        ;83C9D8|C8      |      ;
 
  + REP #$30                                                   ;83C9D9|C230    |      ;
    INX                                                        ;83C9DB|E8      |      ;
    CPX.W #$000D                                               ;83C9DC|E00D00  |      ;
    BNE -                                                      ;83C9DF|D0DF    |83C9C0;
    REP #$20                                                   ;83C9E1|C220    |      ;
    TYA                                                        ;83C9E3|98      |      ;
    RTL                                                        ;83C9E4|6B      |      ;
 
 
fGameEngine_CowUnused83C9E5:
    LDX.W #$0000                                               ;83C9E5|A20000  |      ;
    LDY.W #$0000                                               ;83C9E8|A00000  |      ;
 
  - REP #$30                                                   ;83C9EB|C230    |      ;
    PHY                                                        ;83C9ED|5A      |      ;
    PHX                                                        ;83C9EE|DA      |      ;
    TXA                                                        ;83C9EF|8A      |      ;
    JSL.L fGameEngine_GetCowData                               ;83C9F0|22A7C983|83C9A7;
    SEP #$20                                                   ;83C9F4|E220    |      ;
    REP #$10                                                   ;83C9F6|C210    |      ;
    PLX                                                        ;83C9F8|FA      |      ;
    LDY.W #$0000                                               ;83C9F9|A00000  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83C9FC|B772    |000072;
    PLY                                                        ;83C9FE|7A      |      ;
    AND.B #$01                                                 ;83C9FF|2901    |      ;
    BEQ +                                                      ;83CA01|F001    |83CA04;
    INY                                                        ;83CA03|C8      |      ;
 
  + REP #$30                                                   ;83CA04|C230    |      ;
    INX                                                        ;83CA06|E8      |      ;
    CPX.W #$000C                                               ;83CA07|E00C00  |      ;
    BNE -                                                      ;83CA0A|D0DF    |83C9EB;
    REP #$20                                                   ;83CA0C|C220    |      ;
    TYA                                                        ;83CA0E|98      |      ;
    RTL                                                        ;83CA0F|6B      |      ;
 
 
aGameEngine_AddChickenPositionsData:
    dw $0018,$0048,$0038,$0058,$0048,$0098                     ;83CA10|        |      ; 0x0D * [n16 nPosX, n16 nPoxY]
    dw $0058,$0078,$0068,$00A8,$0078,$0088                     ;83CA1C|        |      ;
    dw $0088,$0058,$0098,$0098,$00A8,$0078                     ;83CA28|        |      ;
    dw $00B8,$00A8,$00C8,$0068,$00D8,$0088                     ;83CA34|        |      ;
    dw $0028,$00A8                                             ;83CA40|        |      ;
 
aGameEngine_AddCowPositionsData:
    dw $00A8,$0116,$00A8,$00F6,$00A8,$00D6                     ;83CA44|        |      ; 0x0D * [n16 nPosX, n16 nPoxY]
    dw $00A8,$0096,$00A8,$0076,$00A8,$0056                     ;83CA50|        |      ;
    dw $0038,$0116,$0038,$00F6,$0038,$00D6                     ;83CA5C|        |      ;
    dw $0038,$0096,$0038,$0076,$0038,$0056                     ;83CA68|        |      ;
    dw $00D8,$0158                                             ;83CA74|        |      ;
 
aGameEngine_ChickenEggBitMask:
    dw $0001,$0002,$0004,$0008,$0010,$0020                     ;83CA78|        |      ;
    dw $0040,$0080,$0100,$0200,$0400,$0800                     ;83CA84|        |      ;
    dw $1000,$2000,$4000,$8000                                 ;83CA90|        |      ;
