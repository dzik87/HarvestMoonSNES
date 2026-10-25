; Bank $82 module "main_loop" - starts at $82D3C7
 
 
fMainMenu_AutoHowToPlay:
    SEP #$20                                                   ;82D3C7|E220    |      ;
    REP #$10                                                   ;82D3C9|C210    |      ;
    LDA.B #$0F                                                 ;82D3CB|A90F    |      ;
    STA.B strcVariables.n8Temp1                                ;82D3CD|8592    |000092;
    LDA.B #$03                                                 ;82D3CF|A903    |      ;
    STA.B strcVariables.n8Temp2                                ;82D3D1|8593    |000093;
    LDA.B #$01                                                 ;82D3D3|A901    |      ;
    STA.B strcVariables.n8Temp3                                ;82D3D5|8594    |000094;
    JSL.L fCore_ScreenFadeout                                  ;82D3D7|220A8880|80880A;
    SEP #$20                                                   ;82D3DB|E220    |      ;
    LDA.B #$06                                                 ;82D3DD|A906    |      ;
    STA.L nCurrentTimeID                                       ;82D3DF|8F1C1F7F|7F1F1C;
    LDA.B #$00                                                 ;82D3E3|A900    |      ;
    STA.L nInGameHourCounter                                   ;82D3E5|8F1D1F7F|7F1F1D;
    LDA.B #$00                                                 ;82D3E9|A900    |      ;
    STA.L nInGameMinuteCounter                                 ;82D3EB|8F1E1F7F|7F1F1E;
    LDA.B #$01                                                 ;82D3EF|A901    |      ;
    STA.B strcVariables.n8Temp4                                ;82D3F1|8595    |000095;
    STZ.B strcVariables.n8Temp3                                ;82D3F3|6494    |000094;
    REP #$20                                                   ;82D3F5|C220    |      ;
    LDA.W #$0000                                               ;82D3F7|A90000  |      ;
    STA.L strcFlags.daily1                                     ;82D3FA|8F5A1F7F|7F1F5A;
    LDA.W #$0000                                               ;82D3FE|A90000  |      ;
    STA.L strcFlags.daily2                                     ;82D401|8F5C1F7F|7F1F5C;
    LDA.W #$0000                                               ;82D405|A90000  |      ;
    STA.L strcFlags.daily3                                     ;82D408|8F5E1F7F|7F1F5E;
    LDA.W #$0000                                               ;82D40C|A90000  |      ;
    STA.L strcFlags.daily4                                     ;82D40F|8F601F7F|7F1F60;
    LDA.W #$0000                                               ;82D413|A90000  |      ;
    STA.L strcFlags.unknown1                                   ;82D416|8F741F7F|7F1F74;
    STA.L strcFlags.unknown2                                   ;82D41A|8F761F7F|7F1F76;
    STA.L strcFlags.unknown3                                   ;82D41E|8F781F7F|7F1F78;
    LDA.W #$0008                                               ;82D422|A90800  |      ;
    STA.L strcFlags.daily4                                     ;82D425|8F601F7F|7F1F60;
    REP #$20                                                   ;82D429|C220    |      ;
    LDA.W #$0000                                               ;82D42B|A90000  |      ;
    STA.L strcFlags.event1                                     ;82D42E|8F641F7F|7F1F64;
    LDA.W #$0000                                               ;82D432|A90000  |      ;
    STA.L strcFlags.event2                                     ;82D435|8F661F7F|7F1F66;
    LDA.W #$0000                                               ;82D439|A90000  |      ;
    STA.L strcFlags.event3                                     ;82D43C|8F681F7F|7F1F68;
    LDA.W #$0000                                               ;82D440|A90000  |      ;
    STA.L strcFlags.event4                                     ;82D443|8F6A1F7F|7F1F6A;
    LDA.W #$0000                                               ;82D447|A90000  |      ;
    STA.L strcFlags.event5                                     ;82D44A|8F6C1F7F|7F1F6C;
    LDA.W #$0000                                               ;82D44E|A90000  |      ;
    STA.L strcFlags.event6                                     ;82D451|8F6E1F7F|7F1F6E;
    LDA.W #$0000                                               ;82D455|A90000  |      ;
    STA.L strcFlags.event7                                     ;82D458|8F701F7F|7F1F70;
    LDA.W #$0000                                               ;82D45C|A90000  |      ;
    STA.L strcFlags.event8                                     ;82D45F|8F721F7F|7F1F72;
    SEP #$20                                                   ;82D463|E220    |      ;
    LDA.B #$8F                                                 ;82D465|A98F    |      ;
    STA.L strcShedItems.row1                                   ;82D467|8F001F7F|7F1F00;
    LDA.B #$EC                                                 ;82D46B|A9EC    |      ;
    STA.L strcShedItems.row2                                   ;82D46D|8F011F7F|7F1F01;
    LDA.B #$00                                                 ;82D471|A900    |      ;
    STA.L strcShedItems.row3                                   ;82D473|8F021F7F|7F1F02;
    LDA.B #$00                                                 ;82D477|A900    |      ;
    STA.L strcShedItems.row4                                   ;82D479|8F031F7F|7F1F03;
    STZ.W strcPlayerData.toolEquipped                          ;82D47D|9C2109  |000921;
    STZ.W strcPlayerData.toolSecond                            ;82D480|9C2309  |000923;
    LDA.B #$01                                                 ;82D483|A901    |      ;
    STA.W strcPlayerData.leftGrassSeeds                        ;82D485|8D2709  |000927;
    STA.W strcPlayerData.leftTurnipSeeds                       ;82D488|8D2B09  |00092B;
    REP #$20                                                   ;82D48B|C220    |      ;
    STZ.W strcAiControlData.input                              ;82D48D|9CFD08  |0008FD;
    STZ.W strcAiControlData.counter                            ;82D490|9CFF08  |0008FF;
    REP #$20                                                   ;82D493|C220    |      ;
    STZ.W strcObjectData.exist                                 ;82D495|9C1509  |000915;
    STZ.B strcPlayer.flags                                     ;82D498|64D2    |0000D2;
    STZ.B strcPlayer.action                                    ;82D49A|64D4    |0000D4;
    SEP #$20                                                   ;82D49C|E220    |      ;
    %SetPlayerFlag(!PFLAGS_ACTIVE)
    %SetPlayerAction(!PACTION_NONE)
    %SetPlayerDirection(!PDIR_DOWN)
    %SetObjectDirection(!PDIR_DOWN)
    REP #$30                                                   ;82D4BD|C230    |      ;
    LDA.W #$0000                                               ;82D4BF|A90000  |      ;
    STA.W strcObjectData.spriteIdx                             ;82D4C2|8D0109  |000901;
    SEP #$20                                                   ;82D4C5|E220    |      ;
    STZ.W nTimeState                                           ;82D4C7|9C7309  |000973;
    LDA.B #$00                                                 ;82D4CA|A900    |      ;
    STA.L nCurrentSeasonID                                     ;82D4CC|8F191F7F|7F1F19;
    SEP #$20                                                   ;82D4D0|E220    |      ;
    STZ.W strcPlayerData.carryItemId                           ;82D4D2|9C1D09  |00091D;
    %UnsetPlayerFlag(!PFLAGS_HOLDINGITEM)
    REP #$30                                                   ;82D4E1|C230    |      ;
    STZ.W strcPlayerData.placedCowFeedFlags                    ;82D4E3|9C3209  |000932;
    STZ.W strcPlayerData.placedChickenFeedFlags                ;82D4E6|9C3409  |000934;
    %UnsetFlag(daily2, $0004)
    JSL.L fCore_ZeroVRAM                                       ;82D4F4|22468880|808846;
    JSL.L fCore_ZeroCGRAM                                      ;82D4F8|22808980|808980;
    JSL.L fCore_Zero0x42Ptr                                    ;82D4FC|22AB8F80|808FAB;
    JSL.L fObject_InitTileCache                                  ;82D500|22D78E85|858ED7;
    JSL.L fObject_ClearGameObject                              ;82D504|220F8285|85820F;
    JSL.L fObjectSlots_ClearAll                                   ;82D508|22C7A481|81A4C7;
    JSL.L fAI_ZeroCCPtr                                        ;82D50C|22008084|848000;
    JSL.L fObjectMap_LoadDefaultFarm                           ;82D510|225AA682|82A65A;
    REP #$20                                                   ;82D514|C220    |      ;
    LDA.W #$0100                                               ;82D516|A90001  |      ;
    STA.W strcBGScrool.BG3VerOffs                              ;82D519|8D4601  |000146;
    SEP #$20                                                   ;82D51C|E220    |      ;
    LDA.L nIntroHowToPlayIndex                                 ;82D51E|AF481F7F|7F1F48;
    BNE +                                                      ;82D522|D003    |82D527;
    JMP.W .howToPlay_default                                   ;82D524|4C74D5  |82D574;
 
 
  + CMP.B #$01                                                 ;82D527|C901    |      ;
    BNE +                                                      ;82D529|D003    |82D52E;
    JMP.W .howToPlay01                                         ;82D52B|4C8ED5  |82D58E;
 
 
  + CMP.B #$02                                                 ;82D52E|C902    |      ;
    BNE +                                                      ;82D530|D003    |82D535;
    JMP.W .howToPlay02                                         ;82D532|4CA8D5  |82D5A8;
 
 
  + CMP.B #$03                                                 ;82D535|C903    |      ;
    BNE +                                                      ;82D537|D003    |82D53C;
    JMP.W .howToPlay03                                         ;82D539|4CC2D5  |82D5C2;
 
 
  + CMP.B #$04                                                 ;82D53C|C904    |      ;
    BNE +                                                      ;82D53E|D003    |82D543;
    JMP.W .howToPlay04                                         ;82D540|4CDCD5  |82D5DC;
 
 
  + CMP.B #$05                                                 ;82D543|C905    |      ;
    BNE +                                                      ;82D545|D003    |82D54A;
    JMP.W .howToPlay05                                         ;82D547|4CF6D5  |82D5F6;
 
 
  + CMP.B #$06                                                 ;82D54A|C906    |      ;
    BNE +                                                      ;82D54C|D003    |82D551;
    JMP.W .howToPlay06                                         ;82D54E|4C10D6  |82D610;
 
 
  + CMP.B #$07                                                 ;82D551|C907    |      ;
    BNE +                                                      ;82D553|D003    |82D558;
    JMP.W .howToPlay07                                         ;82D555|4C2AD6  |82D62A;
 
 
  + CMP.B #$08                                                 ;82D558|C908    |      ;
    BNE +                                                      ;82D55A|D003    |82D55F;
    JMP.W .howToPlay08                                         ;82D55C|4C44D6  |82D644;
 
 
  + CMP.B #$09                                                 ;82D55F|C909    |      ;
    BNE +                                                      ;82D561|D003    |82D566;
    JMP.W .howToPlay09                                         ;82D563|4C5ED6  |82D65E;
 
 
  + CMP.B #$0A                                                 ;82D566|C90A    |      ;
    BNE +                                                      ;82D568|D003    |82D56D;
    JMP.W .howToPlay0A                                         ;82D56A|4C78D6  |82D678;
 
 
  + CMP.B #$0B                                                 ;82D56D|C90B    |      ;
    BNE .howToPlay_default                                     ;82D56F|D003    |82D574;
    JMP.W .howToPlay0B                                         ;82D571|4C92D6  |82D692;
 
 
.howToPlay_default:
    REP #$30                                                   ;82D574|C230    |      ;
    %AIExecute($0000, $0047, $0002)
    SEP #$20                                                   ;82D583|E220    |      ;
    LDA.B #$01                                                 ;82D585|A901    |      ;
    STA.L nIntroHowToPlayIndex                                 ;82D587|8F481F7F|7F1F48;
    JMP.W fMainMenu_PrepareHowToPlay                           ;82D58B|4CACD6  |82D6AC;
 
 
.howToPlay01:
    REP #$30                                                   ;82D58E|C230    |      ;
    %AIExecute($0000, $0047, $0004)
    SEP #$20                                                   ;82D59D|E220    |      ;
    LDA.B #$02                                                 ;82D59F|A902    |      ;
    STA.L nIntroHowToPlayIndex                                 ;82D5A1|8F481F7F|7F1F48;
    JMP.W fMainMenu_PrepareHowToPlay                           ;82D5A5|4CACD6  |82D6AC;
 
 
.howToPlay02:
    REP #$30                                                   ;82D5A8|C230    |      ;
    %AIExecute($0000, $0047, $0006)
    SEP #$20                                                   ;82D5B7|E220    |      ;
    LDA.B #$03                                                 ;82D5B9|A903    |      ;
    STA.L nIntroHowToPlayIndex                                 ;82D5BB|8F481F7F|7F1F48;
    JMP.W fMainMenu_PrepareHowToPlay                           ;82D5BF|4CACD6  |82D6AC;
 
 
.howToPlay03:
    REP #$30                                                   ;82D5C2|C230    |      ;
    %AIExecute($0000, $0047, $0007)
    SEP #$20                                                   ;82D5D1|E220    |      ;
    LDA.B #$04                                                 ;82D5D3|A904    |      ;
    STA.L nIntroHowToPlayIndex                                 ;82D5D5|8F481F7F|7F1F48;
    JMP.W fMainMenu_PrepareHowToPlay                           ;82D5D9|4CACD6  |82D6AC;
 
 
.howToPlay04:
    REP #$30                                                   ;82D5DC|C230    |      ;
    %AIExecute($0000, $0047, $0009)
    SEP #$20                                                   ;82D5EB|E220    |      ;
    LDA.B #$05                                                 ;82D5ED|A905    |      ;
    STA.L nIntroHowToPlayIndex                                 ;82D5EF|8F481F7F|7F1F48;
    JMP.W fMainMenu_PrepareHowToPlay                           ;82D5F3|4CACD6  |82D6AC;
 
 
.howToPlay05:
    REP #$30                                                   ;82D5F6|C230    |      ;
    %AIExecute($0000, $0047, $000B)
    SEP #$20                                                   ;82D605|E220    |      ;
    LDA.B #$06                                                 ;82D607|A906    |      ;
    STA.L nIntroHowToPlayIndex                                 ;82D609|8F481F7F|7F1F48;
    JMP.W fMainMenu_PrepareHowToPlay                           ;82D60D|4CACD6  |82D6AC;
 
 
.howToPlay06:
    REP #$30                                                   ;82D610|C230    |      ;
    %AIExecute($0000, $0047, $000D)
    SEP #$20                                                   ;82D61F|E220    |      ;
    LDA.B #$07                                                 ;82D621|A907    |      ;
    STA.L nIntroHowToPlayIndex                                 ;82D623|8F481F7F|7F1F48;
    JMP.W fMainMenu_PrepareHowToPlay                           ;82D627|4CACD6  |82D6AC;
 
 
.howToPlay07:
    REP #$30                                                   ;82D62A|C230    |      ;
    %AIExecute($0000, $0047, $0011)
    SEP #$20                                                   ;82D639|E220    |      ;
    LDA.B #$08                                                 ;82D63B|A908    |      ;
    STA.L nIntroHowToPlayIndex                                 ;82D63D|8F481F7F|7F1F48;
    JMP.W fMainMenu_PrepareHowToPlay                           ;82D641|4CACD6  |82D6AC;
 
 
.howToPlay08:
    REP #$30                                                   ;82D644|C230    |      ;
    %AIExecute($0000, $0047, $0015)
    SEP #$20                                                   ;82D653|E220    |      ;
    LDA.B #$09                                                 ;82D655|A909    |      ;
    STA.L nIntroHowToPlayIndex                                 ;82D657|8F481F7F|7F1F48;
    JMP.W fMainMenu_PrepareHowToPlay                           ;82D65B|4CACD6  |82D6AC;
 
 
.howToPlay09:
    REP #$30                                                   ;82D65E|C230    |      ;
    %AIExecute($0000, $0047, $0017)
    SEP #$20                                                   ;82D66D|E220    |      ;
    LDA.B #$0A                                                 ;82D66F|A90A    |      ;
    STA.L nIntroHowToPlayIndex                                 ;82D671|8F481F7F|7F1F48;
    JMP.W fMainMenu_PrepareHowToPlay                           ;82D675|4CACD6  |82D6AC;
 
 
.howToPlay0A:
    REP #$30                                                   ;82D678|C230    |      ;
    %AIExecute($0000, $0047, $0019)
    SEP #$20                                                   ;82D687|E220    |      ;
    LDA.B #$0B                                                 ;82D689|A90B    |      ;
    STA.L nIntroHowToPlayIndex                                 ;82D68B|8F481F7F|7F1F48;
    JMP.W fMainMenu_PrepareHowToPlay                           ;82D68F|4CACD6  |82D6AC;
 
 
.howToPlay0B:
    REP #$30                                                   ;82D692|C230    |      ;
    %AIExecute($0000, $0047, $001B)
    SEP #$20                                                   ;82D6A1|E220    |      ;
    LDA.B #$00                                                 ;82D6A3|A900    |      ;
    STA.L nIntroHowToPlayIndex                                 ;82D6A5|8F481F7F|7F1F48;
    JMP.W fMainMenu_PrepareHowToPlay                           ;82D6A9|4CACD6  |82D6AC;
 
 
fMainMenu_PrepareHowToPlay:
    JSL.L fAI_HowToPlaySetup                                   ;82D6AC|226F8184|84816F;
    SEP #$20                                                   ;82D6B0|E220    |      ;
    LDA.W nDestinationAreaId                                   ;82D6B2|AD8B09  |00098B;
    STA.B strcMap.loadAreaId                                   ;82D6B5|8522    |000022;
    JSL.L fAudioEngine_MapMusicHandler                         ;82D6B7|22DE9580|8095DE;
    SEP #$20                                                   ;82D6BB|E220    |      ;
    LDA.W nDestinationAreaId                                   ;82D6BD|AD8B09  |00098B;
    JSL.L fMap_SetupArea                                       ;82D6C0|222C9780|80972C;
    REP #$30                                                   ;82D6C4|C230    |      ;
    LDY.W #$0000                                               ;82D6C6|A00000  |      ;
 
  - REP #$20                                                   ;82D6C9|C220    |      ;
    STZ.B strcVariables.n16Unk90                               ;82D6CB|6490    |000090;
    SEP #$20                                                   ;82D6CD|E220    |      ;
    LDA.B $00                                                  ;82D6CF|A500    |000000;
    BEQ -                                                      ;82D6D1|F0F6    |82D6C9;
    REP #$20                                                   ;82D6D3|C220    |      ;
    LDA.W #$1800                                               ;82D6D5|A90018  |      ;
    STA.B $C7                                                  ;82D6D8|85C7    |0000C7;
    JSL.L fAudioEngine_MapChangeHandler                        ;82D6DA|22719680|809671;
    JSL.L fMapChangeHandler_809A64                             ;82D6DE|22649A80|809A64;
    JSL.L fGame_TimeHandler                                    ;82D6E2|22008082|828000;
    JSL.L fDialog_IterateText                                  ;82D6E6|221C9583|83951C;
    JSL.L fPallete_ChangeHandler                               ;82D6EA|220C9080|80900C;
    JSL.L fPalette_ProcessColorAnimSlots                                  ;82D6EE|22698E80|808E69;
    JSL.L fInput_Handler                                       ;82D6F2|2234C084|84C034;
    JSL.L fObjectSlots_UpdateAll                                      ;82D6F6|2283A381|81A383;
    JSL.L fPlayer_UpdateHandler                      ;82D6FA|22B7BF81|81BFB7;
    JSL.L fGraphics_MapScrool                                  ;82D6FE|22B39580|8095B3;
    JSL.L fAI_HowToPlaySetup                                   ;82D702|226F8184|84816F;
    JSL.L fTileScript_Update                                    ;82D706|2200A681|81A600;
    JSL.L fObject_UpdateAllAnimations                                ;82D70A|22C78285|8582C7;
    JSL.L fObject_ProcessTileLoadQueue                                      ;82D70E|22B28C85|858CB2;
    JSL.L fObject_RenderAll                                      ;82D712|22E08385|8583E0;
    REP #$20                                                   ;82D716|C220    |      ;
    %CheckFlag(daily2, $0004)
    BNE fMainMenu_HowToPlayCleanup                                        ;82D71F|D010    |82D731;
    %CheckFlag(daily4, $0080)
    BNE fMainMenu_HowToPlayCleanup                                        ;82D728|D007    |82D731;
    SEP #$20                                                   ;82D72A|E220    |      ;
    STZ.B $00                                                  ;82D72C|6400    |000000;
    if !REGION_DE
    JMP.W $D886                                            ;82D8EB|4C86D8  |82D886;
    else
    JMP.W $D6C9                                                ;82D72E|4CC9D6  |82D6C9;
    endif
 
 
fMainMenu_HowToPlayCleanup:
    REP #$30                                                   ;82D731|C230    |      ;
    LDX.W #$0000                                               ;82D733|A20000  |      ;
 
  - SEP #$20                                                   ;82D736|E220    |      ;
    LDA.B #$00                                                 ;82D738|A900    |      ;
    STA.L strcChickenData,X                                    ;82D73A|9F86C27E|7EC286;
    INX                                                        ;82D73E|E8      |      ;
    CPX.W #$0008                                               ;82D73F|E00800  |      ;
    BNE -                                                      ;82D742|D0F2    |82D736;
    SEP #$20                                                   ;82D744|E220    |      ;
    LDA.B strcMap.loadAreaId                                   ;82D746|A522    |000022;
    CMP.B #$04                                                 ;82D748|C904    |      ;
    BCS fMainMenu_SetStateReturnToTitle                                        ;82D74A|B004    |82D750;
    JSL.L fObjectMap_LoadFarm                                  ;82D74C|2282A682|82A682;
 
fMainMenu_SetStateReturnToTitle:
    SEP #$20                                                   ;82D750|E220    |      ;
    LDA.B #$09                                                 ;82D752|A909    |      ;
    STA.B strcVariables.n8Temp4                                ;82D754|8595    |000095;
    REP #$20                                                   ;82D756|C220    |      ;
    STZ.B strcVariables.n16Unk90                               ;82D758|6490    |000090;
    JML.L fMainMenu_EndFrame                                      ;82D75A|5C71D882|82D871;
 
 
fMainMenu_TitleScreenInit:
    REP #$30                                                   ;82D75E|C230    |      ;
    SEP #$20                                                   ;82D760|E220    |      ;
    LDA.B #$04                                                 ;82D762|A904    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;82D764|8D9A01  |00019A;
    SEP #$20                                                   ;82D767|E220    |      ;
    STZ.W nUnknownFlags09D                                     ;82D769|9C8D09  |00098D;
    REP #$20                                                   ;82D76C|C220    |      ;
    %CheckFlag(daily4, $0800)
    BEQ +                                                      ;82D775|F007    |82D77E;
    SEP #$20                                                   ;82D777|E220    |      ;
    LDA.B #$02                                                 ;82D779|A902    |      ;
    STA.W nUnknownFlags09D                                     ;82D77B|8D8D09  |00098D;
 
  + SEP #$20                                                   ;82D77E|E220    |      ;
    LDA.B #$00                                                 ;82D780|A900    |      ;
    STA.L nIntroHowToPlayIndex                                 ;82D782|8F481F7F|7F1F48;
    STA.L nIntroHowToPlayIndex2                                ;82D786|8F491F7F|7F1F49;
    JSL.L fObjectMap_LoadDefaultFarm                           ;82D78A|225AA682|82A65A;
    SEP #$20                                                   ;82D78E|E220    |      ;
    LDA.B #$03                                                 ;82D790|A903    |      ;
    JSL.L fCore_ManageGraphicsPresets                          ;82D792|22598C80|808C59;
    JSL.L fCore_SetForceBlank                                  ;82D796|220F8E80|808E0F;
    if !REGION_DE
    JSL.L fCore_ZeroVRAM                                   ;82D957|22468880|808846;
    else
    JSL.L fCore_ZeroVRAM                                       ;82D79A|22468880|808846;
    SEP #$20                                                   ;82D79E|E220    |      ;
    LDA.B #$5D                                                 ;82D7A0|A95D    |      ;
    STA.B strcMap.loadAreaId                                   ;82D7A2|8522    |000022;
    JSL.L fTileMap_MapChangeHandler                            ;82D7A4|22C6A780|80A7C6;
    REP #$20                                                   ;82D7A8|C220    |      ;
    LDA.W #$006E                                               ;82D7AA|A96E00  |      ;
    JSL.L fPalette_LoadFirstHalf                               ;82D7AD|22CF9180|8091CF;
    SEP #$20                                                   ;82D7B1|E220    |      ;
    REP #$10                                                   ;82D7B3|C210    |      ;
    LDA.B #$00                                                 ;82D7B5|A900    |      ;
    STA.B strcSystem.arrayIndex                                ;82D7B7|8527    |000027;
    LDA.B #$22                                                 ;82D7B9|A922    |      ;
    STA.B strcSystem.destinationRegister                       ;82D7BB|8529    |000029;
    REP #$20                                                   ;82D7BD|C220    |      ;
    LDY.W #$0200                                               ;82D7BF|A00002  |      ;
    LDX.W #$0000                                               ;82D7C2|A20000  |      ;
    LDA.W #$DA00                                               ;82D7C5|A900DA  |      ;
    STA.B ptrTemp0x72                                          ;82D7C8|8572    |000072;
    SEP #$20                                                   ;82D7CA|E220    |      ;
    LDA.B #$A9                                                 ;82D7CC|A9A9    |      ;
    STA.B ptrTemp0x72+2                                        ;82D7CE|8574    |000074;
    JSL.L fCore_PrepareTransfer                                ;82D7D0|22338A80|808A33;
    JSL.L fCore_StartPreparedTransfer                          ;82D7D4|22B28A80|808AB2;
    REP #$20                                                   ;82D7D8|C220    |      ;
    STZ.W strcBGScrool.BG1HorOffs                              ;82D7DA|9C3C01  |00013C;
    STZ.W strcBGScrool.BG1VerOffs                              ;82D7DD|9C3E01  |00013E;
    STZ.W strcBGScrool.BG2HorOffs                              ;82D7E0|9C4001  |000140;
    STZ.W strcBGScrool.BG2VerOffs                              ;82D7E3|9C4201  |000142;
    JSL.L fCore_ResetForceBlank                                ;82D7E6|221E8E80|808E1E;
    JSL.L fCore_WaitForNextNMI                                 ;82D7EA|22458680|808645;
    SEP #$20                                                   ;82D7EE|E220    |      ;
    LDA.B #$03                                                 ;82D7F0|A903    |      ;
    STA.B strcVariables.n8Temp1                                ;82D7F2|8592    |000092;
    LDA.B #$03                                                 ;82D7F4|A903    |      ;
    STA.B strcVariables.n8Temp2                                ;82D7F6|8593    |000093;
    LDA.B #$0F                                                 ;82D7F8|A90F    |      ;
    STA.B strcVariables.n8Temp3                                ;82D7FA|8594    |000094;
    JSL.L fCore_ScreenFadein                                   ;82D7FC|22CE8780|8087CE;
    endif
    SEP #$20                                                   ;82D800|E220    |      ;
    STZ.B strcVariables.u8Unk97                                ;82D802|6497    |000097;
    REP #$20                                                   ;82D804|C220    |      ;
    STZ.B strcVariables.n16Unk90                               ;82D806|6490    |000090;
    LDA.W #$0001                                               ;82D808|A90100  |      ;
    STA.B strcObject.bankAddress                               ;82D80B|85AF    |0000AF;
 
fMainMenu_StateLoop:
    SEP #$20                                                   ;82D80D|E220    |      ;
    LDA.B $00                                                  ;82D80F|A500    |000000;
    BEQ fMainMenu_StateLoop                                        ;82D811|F0FA    |82D80D;
    JSL.L fPalette_ProcessColorAnimSlots                                  ;82D813|22698E80|808E69;
    JSL.L fInput_Handler                                       ;82D817|2234C084|84C034;
    SEP #$20                                                   ;82D81B|E220    |      ;
    LDA.B strcVariables.n8Temp4                                ;82D81D|A595    |000095;
    BEQ fMainMenu_StateInitialDelay                                        ;82D81F|F062    |82D883;
    CMP.B #$01                                                 ;82D821|C901    |      ;
    BNE +                                                      ;82D823|D004    |82D829;
    JML.L fMainMenu_StateOpeningDemo                                      ;82D825|5CB0D882|82D8B0;
 
 
  + CMP.B #$02                                                 ;82D829|C902    |      ;
    BNE +                                                      ;82D82B|D004    |82D831;
    JML.L fMainMenu_StateLogoScrollHorizontal                                      ;82D82D|5C8CDA82|82DA8C;
 
 
  + CMP.B #$03                                                 ;82D831|C903    |      ;
    BNE +                                                      ;82D833|D004    |82D839;
    JML.L fMainMenu_StateLogoScrollDiagonal                                      ;82D835|5CC9DA82|82DAC9;
 
 
  + CMP.B #$04                                                 ;82D839|C904    |      ;
    BNE +                                                      ;82D83B|D004    |82D841;
    JML.L fMainMenu_StateTitleStartCursorAnim                                      ;82D83D|5C0DDC82|82DC0D;
 
 
  + CMP.B #$05                                                 ;82D841|C905    |      ;
    BNE +                                                      ;82D843|D004    |82D849;
    JML.L fMainMenu_StateTitleMenuInput                                      ;82D845|5C8CDD82|82DD8C;
 
 
  + CMP.B #$06                                                 ;82D849|C906    |      ;
    BNE +                                                      ;82D84B|D004    |82D851;
    JML.L fMainMenu_StateSkipToTitleScreen                                      ;82D84D|5C8EDB82|82DB8E;
 
 
  + CMP.B #$07                                                 ;82D851|C907    |      ;
    BNE +                                                      ;82D853|D004    |82D859;
    JML.L fMainMenu_StateNewGameSlotSelect                                      ;82D855|5C92DF82|82DF92;
 
 
  + CMP.B #$08                                                 ;82D859|C908    |      ;
    BNE +                                                      ;82D85B|D004    |82D861;
    JML.L fMainMenu_StateLoadGameSlotSelect                                      ;82D85D|5CF1E182|82E1F1;
 
 
  + CMP.B #$09                                                 ;82D861|C909    |      ;
    BNE +                                                      ;82D863|D004    |82D869;
    JML.L fMainMenu_StateReinitTitleScreen                                      ;82D865|5CF5DA82|82DAF5;
 
 
  + CMP.B #$0A                                                 ;82D869|C90A    |      ;
    BNE fMainMenu_EndFrame                                        ;82D86B|D004    |82D871;
    JML.L fMainMenu_StartHowToPlayDemo                                      ;82D86D|5CC0D182|82D1C0;
 
 
fMainMenu_EndFrame:
    SEP #$20                                                   ;82D871|E220    |      ;
    STZ.B $00                                                  ;82D873|6400    |000000;
    REP #$20                                                   ;82D875|C220    |      ;
    LDA.B strcVariables.n16Unk90                               ;82D877|A590    |000090;
    CMP.W #$0258                                               ;82D879|C95802  |      ;
    BNE +                                                      ;82D87C|D003    |82D881;
    JMP.W fMainMenu_AutoHowToPlay                              ;82D87E|4CC7D3  |82D3C7;
 
 
  + BRA fMainMenu_StateLoop                                        ;82D881|808A    |82D80D;
 
 
fMainMenu_StateInitialDelay:
    LDY.W #$0000                                               ;82D883|A00000  |      ;
 
  - PHY                                                        ;82D886|5A      |      ;
    JSL.L fCore_WaitForNextNMI                                 ;82D887|22458680|808645;
    REP #$30                                                   ;82D88B|C230    |      ;
    PLY                                                        ;82D88D|7A      |      ;
    INY                                                        ;82D88E|C8      |      ;
    if !REGION_DE
    CPY.W #$0001                                           ;82D9EA|C00100  |      ;
    else
    CPY.W #$0078                                               ;82D88F|C07800  |      ;
    endif
    BNE -                                                      ;82D892|D0F2    |82D886;
    SEP #$20                                                   ;82D894|E220    |      ;
    LDA.B #$0F                                                 ;82D896|A90F    |      ;
    STA.B strcVariables.n8Temp1                                ;82D898|8592    |000092;
    LDA.B #$03                                                 ;82D89A|A903    |      ;
    STA.B strcVariables.n8Temp2                                ;82D89C|8593    |000093;
    LDA.B #$01                                                 ;82D89E|A901    |      ;
    STA.B strcVariables.n8Temp3                                ;82D8A0|8594    |000094;
    JSL.L fCore_ScreenFadeout                                  ;82D8A2|220A8880|80880A;
    SEP #$20                                                   ;82D8A6|E220    |      ;
    LDA.B #$01                                                 ;82D8A8|A901    |      ;
    STA.B strcVariables.n8Temp4                                ;82D8AA|8595    |000095;
    STZ.B strcVariables.n8Temp3                                ;82D8AC|6494    |000094;
    BRA fMainMenu_EndFrame                                        ;82D8AE|80C1    |82D871;
 
 
fMainMenu_StateOpeningDemo:
    REP #$30                                                   ;82D8B0|C230    |      ;
    JSL.L fCore_ZeroVRAM                                       ;82D8B2|22468880|808846;
    JSL.L fCore_ZeroCGRAM                                      ;82D8B6|22808980|808980;
    JSL.L fCore_Zero0x42Ptr                                    ;82D8BA|22AB8F80|808FAB;
    JSL.L fObject_InitTileCache                                  ;82D8BE|22D78E85|858ED7;
    JSL.L fObject_ClearGameObject                              ;82D8C2|220F8285|85820F;
    JSL.L fObjectSlots_ClearAll                                   ;82D8C6|22C7A481|81A4C7;
    JSL.L fAI_ZeroCCPtr                                        ;82D8CA|22008084|848000;
    REP #$20                                                   ;82D8CE|C220    |      ;
    %SetPlayerFlag(!PFLAGS_ACTIVE)
    %SetPlayerAction(!PACTION_NONE)
    %SetPlayerDirection(!PDIR_DOWN)
    %SetObjectDirection(!PDIR_DOWN)
    REP #$30                                                   ;82D8EF|C230    |      ;
    LDA.W #$0000                                               ;82D8F1|A90000  |      ;
    STA.W strcObjectData.spriteIdx                             ;82D8F4|8D0109  |000901;
    REP #$20                                                   ;82D8F7|C220    |      ;
    LDA.W #$0100                                               ;82D8F9|A90001  |      ;
    STA.W strcBGScrool.BG3VerOffs                              ;82D8FC|8D4601  |000146;
    REP #$30                                                   ;82D8FF|C230    |      ;
    %AIExecute($0000, $0009, $0000)
    JSL.L fAI_HowToPlaySetup                                   ;82D90E|226F8184|84816F;
    SEP #$20                                                   ;82D912|E220    |      ;
    LDA.W nDestinationAreaId                                   ;82D914|AD8B09  |00098B;
    STA.B strcMap.loadAreaId                                   ;82D917|8522    |000022;
    JSL.L fAudioEngine_MapMusicHandler                         ;82D919|22DE9580|8095DE;
    JSL.L fAudio_FadeOutOnTrackChangeFast                                 ;82D91D|221F8483|83841F;
    JSL.L fAudio_LoadPendingTrack                                 ;82D921|22A48383|8383A4;
    JSL.L fAudio_StartPendingTrack                                 ;82D925|22808383|838380;
    SEP #$20                                                   ;82D929|E220    |      ;
    LDA.W strcAudio.trackId                                    ;82D92B|AD1001  |000110;
    STA.W strcAudio.trackIdCopy                                ;82D92E|8D1701  |000117;
    SEP #$20                                                   ;82D931|E220    |      ;
    LDA.W nDestinationAreaId                                   ;82D933|AD8B09  |00098B;
    JSL.L fMap_SetupArea                                       ;82D936|222C9780|80972C;
    REP #$30                                                   ;82D93A|C230    |      ;
    LDY.W #$0000                                               ;82D93C|A00000  |      ;
 
  - SEP #$20                                                   ;82D93F|E220    |      ;
    LDA.B $00                                                  ;82D941|A500    |000000;
    BEQ -                                                      ;82D943|F0FA    |82D93F;
    REP #$20                                                   ;82D945|C220    |      ;
    LDA.W #$1800                                               ;82D947|A90018  |      ;
    STA.B $C7                                                  ;82D94A|85C7    |0000C7;
    JSL.L fAudioEngine_MapChangeHandler                        ;82D94C|22719680|809671;
    JSL.L fMapChangeHandler_809A64                             ;82D950|22649A80|809A64;
    JSL.L fGame_TimeHandler                                    ;82D954|22008082|828000;
    JSL.L fDialog_IterateText                                  ;82D958|221C9583|83951C;
    JSL.L fPallete_ChangeHandler                               ;82D95C|220C9080|80900C;
    JSL.L fPalette_ProcessColorAnimSlots                                  ;82D960|22698E80|808E69;
    JSL.L fInput_Handler                                       ;82D964|2234C084|84C034;
    JSL.L fObjectSlots_UpdateAll                                      ;82D968|2283A381|81A383;
    JSL.L fPlayer_UpdateHandler                      ;82D96C|22B7BF81|81BFB7;
    JSL.L fGraphics_MapScrool                                  ;82D970|22B39580|8095B3;
    JSL.L fAI_HowToPlaySetup                                   ;82D974|226F8184|84816F;
    JSL.L fTileScript_Update                                    ;82D978|2200A681|81A600;
    JSL.L fObject_UpdateAllAnimations                                ;82D97C|22C78285|8582C7;
    JSL.L fObject_ProcessTileLoadQueue                                      ;82D980|22B28C85|858CB2;
    JSL.L fObject_RenderAll                                      ;82D984|22E08385|8583E0;
    REP #$20                                                   ;82D988|C220    |      ;
    %CheckFlag(daily2, $0004)
    BNE +                                                      ;82D991|D020    |82D9B3;
    SEP #$20                                                   ;82D993|E220    |      ;
    STZ.B $00                                                  ;82D995|6400    |000000;
    if !REGION_DE
    JMP.W $DA9A                                            ;82DAF2|4C9ADA  |82DA9A;
    else
    JMP.W $D93F                                                ;82D997|4C3FD9  |82D93F;
    endif
 
    PLY                                                        ;82D99A|7A      |      ;
    INY                                                        ;82D99B|C8      |      ;
    CPY.W #$0168                                               ;82D99C|C06801  |      ;
    BNE -                                                      ;82D99F|D09E    |82D93F;
    SEP #$20                                                   ;82D9A1|E220    |      ;
    LDA.B #$0F                                                 ;82D9A3|A90F    |      ;
    STA.B strcVariables.n8Temp1                                ;82D9A5|8592    |000092;
    LDA.B #$03                                                 ;82D9A7|A903    |      ;
    STA.B strcVariables.n8Temp2                                ;82D9A9|8593    |000093;
    LDA.B #$01                                                 ;82D9AB|A901    |      ;
    STA.B strcVariables.n8Temp3                                ;82D9AD|8594    |000094;
    JSL.L fCore_ScreenFadeout                                  ;82D9AF|220A8880|80880A;
 
  + SEP #$20                                                   ;82D9B3|E220    |      ;
    LDA.B strcVariables.n8Temp4                                ;82D9B5|A595    |000095;
    CMP.B #$09                                                 ;82D9B7|C909    |      ;
    BNE +                                                      ;82D9B9|D003    |82D9BE;
    JMP.W fMainMenu_EndFrame                                      ;82D9BB|4C71D8  |82D871;
 
 
  + SEP #$20                                                   ;82D9BE|E220    |      ;
    LDA.B #$0F                                                 ;82D9C0|A90F    |      ;
    STA.B strcVariables.n8Temp1                                ;82D9C2|8592    |000092;
    LDA.B #$03                                                 ;82D9C4|A903    |      ;
    STA.B strcVariables.n8Temp2                                ;82D9C6|8593    |000093;
    LDA.B #$01                                                 ;82D9C8|A901    |      ;
    STA.B strcVariables.n8Temp3                                ;82D9CA|8594    |000094;
    JSL.L fCore_ScreenFadeout                                  ;82D9CC|220A8880|80880A;
    JSL.L fCore_SetForceBlank                                  ;82D9D0|220F8E80|808E0F;
    SEP #$20                                                   ;82D9D4|E220    |      ;
    LDA.B #$03                                                 ;82D9D6|A903    |      ;
    JSL.L fCore_ManageGraphicsPresets                          ;82D9D8|22598C80|808C59;
    JSL.L fCore_ZeroVRAM                                       ;82D9DC|22468880|808846;
    JSL.L fCore_ZeroCGRAM                                      ;82D9E0|22808980|808980;
    JSL.L fCore_Zero0x42Ptr                                    ;82D9E4|22AB8F80|808FAB;
    JSL.L fObject_InitTileCache                                  ;82D9E8|22D78E85|858ED7;
    JSL.L fObject_ClearGameObject                              ;82D9EC|220F8285|85820F;
    JSL.L fObjectSlots_ClearAll                                   ;82D9F0|22C7A481|81A4C7;
    JSL.L fAI_ZeroCCPtr                                        ;82D9F4|22008084|848000;
    SEP #$20                                                   ;82D9F8|E220    |      ;
    LDA.B #$5B                                                 ;82D9FA|A95B    |      ;
    STA.B strcMap.loadAreaId                                   ;82D9FC|8522    |000022;
    JSL.L fTileMap_MapChangeHandler                            ;82D9FE|22C6A780|80A7C6;
    REP #$20                                                   ;82DA02|C220    |      ;
    LDA.W #$006D                                               ;82DA04|A96D00  |      ;
    JSL.L fPalette_LoadFirstHalf                               ;82DA07|22CF9180|8091CF;
    SEP #$20                                                   ;82DA0B|E220    |      ;
    REP #$10                                                   ;82DA0D|C210    |      ;
    LDA.B #$00                                                 ;82DA0F|A900    |      ;
    STA.B strcSystem.arrayIndex                                ;82DA11|8527    |000027;
    LDA.B #$22                                                 ;82DA13|A922    |      ;
    STA.B strcSystem.destinationRegister                       ;82DA15|8529    |000029;
    REP #$20                                                   ;82DA17|C220    |      ;
    LDY.W #$0200                                               ;82DA19|A00002  |      ;
    LDX.W #$0000                                               ;82DA1C|A20000  |      ;
    LDA.W #$D800                                               ;82DA1F|A900D8  |      ;
    STA.B ptrTemp0x72                                          ;82DA22|8572    |000072;
    SEP #$20                                                   ;82DA24|E220    |      ;
    LDA.B #$A9                                                 ;82DA26|A9A9    |      ;
    STA.B ptrTemp0x72+2                                        ;82DA28|8574    |000074; A9D8000 -> $72 (sPalette_0x6C)
    JSL.L fCore_PrepareTransfer                                ;82DA2A|22338A80|808A33;
    JSL.L fCore_StartPreparedTransfer                          ;82DA2E|22B28A80|808AB2;
    REP #$20                                                   ;82DA32|C220    |      ;
    LDA.W #$0100                                               ;82DA34|A90001  |      ;
    STA.W strcBGScrool.BG1HorOffs                              ;82DA37|8D3C01  |00013C;
    LDA.W #$0100                                               ;82DA3A|A90001  |      ;
    STA.W strcBGScrool.BG2HorOffs                              ;82DA3D|8D4001  |000140;
    LDA.W #$0100                                               ;82DA40|A90001  |      ;
    STA.W strcBGScrool.BG1VerOffs                              ;82DA43|8D3E01  |00013E;
    LDA.W #$0100                                               ;82DA46|A90001  |      ;
    STA.W strcBGScrool.BG2VerOffs                              ;82DA49|8D4201  |000142;
    JSL.L fAudioEngine_MapMusicHandler                         ;82DA4C|22DE9580|8095DE;
    JSL.L fAudio_FadeOutOnTrackChangeFast                                 ;82DA50|221F8483|83841F;
    JSL.L fAudio_LoadPendingTrack                                 ;82DA54|22A48383|8383A4;
    JSL.L fAudio_StartPendingTrack                                 ;82DA58|22808383|838380;
    SEP #$20                                                   ;82DA5C|E220    |      ;
    LDA.W strcAudio.trackId                                    ;82DA5E|AD1001  |000110;
    STA.W strcAudio.trackIdCopy                                ;82DA61|8D1701  |000117;
    JSL.L fCore_ResetForceBlank                                ;82DA64|221E8E80|808E1E;
    JSL.L fCore_WaitForNextNMI                                 ;82DA68|22458680|808645;
    SEP #$20                                                   ;82DA6C|E220    |      ;
    LDA.B #$01                                                 ;82DA6E|A901    |      ;
    STA.B strcVariables.n8Temp1                                ;82DA70|8592    |000092;
    LDA.B #$06                                                 ;82DA72|A906    |      ;
    STA.B strcVariables.n8Temp2                                ;82DA74|8593    |000093;
    LDA.B #$0F                                                 ;82DA76|A90F    |      ;
    STA.B strcVariables.n8Temp3                                ;82DA78|8594    |000094;
    JSL.L fCore_ScreenFadein                                   ;82DA7A|22CE8780|8087CE;
    SEP #$20                                                   ;82DA7E|E220    |      ;
    LDA.B #$02                                                 ;82DA80|A902    |      ;
    STA.B strcVariables.n8Temp4                                ;82DA82|8595    |000095;
    STZ.B strcVariables.n8Temp3                                ;82DA84|6494    |000094;
    STZ.B strcVariables.u8Unk96                                ;82DA86|6496    |000096;
    JML.L fMainMenu_EndFrame                                      ;82DA88|5C71D882|82D871;
 
 
fMainMenu_StateLogoScrollHorizontal:
    SEP #$20                                                   ;82DA8C|E220    |      ;
    LDA.B strcVariables.n8Temp3                                ;82DA8E|A594    |000094;
    AND.B #$01                                                 ;82DA90|2901    |      ;
    BNE .label1                                                ;82DA92|D012    |82DAA6;
    REP #$20                                                   ;82DA94|C220    |      ;
    LDA.W strcBGScrool.BG2HorOffs                              ;82DA96|AD4001  |000140;
    INC A                                                      ;82DA99|1A      |      ;
    STA.W strcBGScrool.BG2HorOffs                              ;82DA9A|8D4001  |000140;
    LDA.W strcBGScrool.BG1HorOffs                              ;82DA9D|AD3C01  |00013C;
    BEQ +                                                      ;82DAA0|F00C    |82DAAE;
    DEC A                                                      ;82DAA2|3A      |      ;
    STA.W strcBGScrool.BG1HorOffs                              ;82DAA3|8D3C01  |00013C;
 
.label1:
    SEP #$20                                                   ;82DAA6|E220    |      ;
    INC.B strcVariables.n8Temp3                                ;82DAA8|E694    |000094;
    JML.L fMainMenu_EndFrame                                      ;82DAAA|5C71D882|82D871;
 
 
  + SEP #$20                                                   ;82DAAE|E220    |      ;
    LDA.B strcVariables.u8Unk96                                ;82DAB0|A596    |000096;
    INC A                                                      ;82DAB2|1A      |      ;
    STA.B strcVariables.u8Unk96                                ;82DAB3|8596    |000096;
    CMP.B #$3C                                                 ;82DAB5|C93C    |      ;
    BEQ +                                                      ;82DAB7|F004    |82DABD;
    JML.L .label1                                              ;82DAB9|5CA6DA82|82DAA6;
 
 
  + SEP #$20                                                   ;82DABD|E220    |      ;
    LDA.B #$03                                                 ;82DABF|A903    |      ;
    STA.B strcVariables.n8Temp4                                ;82DAC1|8595    |000095;
    STZ.B strcVariables.n8Temp3                                ;82DAC3|6494    |000094;
    JML.L fMainMenu_EndFrame                                      ;82DAC5|5C71D882|82D871;
 
 
fMainMenu_StateLogoScrollDiagonal:
    SEP #$20                                                   ;82DAC9|E220    |      ;
    LDA.B strcVariables.n8Temp3                                ;82DACB|A594    |000094;
    AND.B #$01                                                 ;82DACD|2901    |      ;
    BNE .skip                                                  ;82DACF|D01C    |82DAED;
    REP #$20                                                   ;82DAD1|C220    |      ;
    LDA.W strcBGScrool.BG2HorOffs                              ;82DAD3|AD4001  |000140;
    INC A                                                      ;82DAD6|1A      |      ;
    STA.W strcBGScrool.BG2HorOffs                              ;82DAD7|8D4001  |000140;
    LDA.W strcBGScrool.BG1VerOffs                              ;82DADA|AD3E01  |00013E;
    BNE +                                                      ;82DADD|D003    |82DAE2;
    JMP.W fMainMenu_StateSkipToTitleScreen                                      ;82DADF|4C8EDB  |82DB8E;
 
 
  + DEC A                                                      ;82DAE2|3A      |      ;
    STA.W strcBGScrool.BG1VerOffs                              ;82DAE3|8D3E01  |00013E;
    LDA.W strcBGScrool.BG2VerOffs                              ;82DAE6|AD4201  |000142;
    DEC A                                                      ;82DAE9|3A      |      ;
    STA.W strcBGScrool.BG2VerOffs                              ;82DAEA|8D4201  |000142;
 
.skip:
    SEP #$20                                                   ;82DAED|E220    |      ;
    INC.B strcVariables.n8Temp3                                ;82DAEF|E694    |000094;
    JML.L fMainMenu_EndFrame                                      ;82DAF1|5C71D882|82D871;
 
 
fMainMenu_StateReinitTitleScreen:
    SEP #$20                                                   ;82DAF5|E220    |      ;
    LDA.B #$5C                                                 ;82DAF7|A95C    |      ;
    STA.B strcMap.loadAreaId                                   ;82DAF9|8522    |000022;
    JSL.L fAudioEngine_MapMusicHandler                         ;82DAFB|22DE9580|8095DE;
    JSL.L fAudio_FadeOutOnTrackChangeSlow                                 ;82DAFF|22018483|838401;
    SEP #$20                                                   ;82DB03|E220    |      ;
    LDA.B #$0F                                                 ;82DB05|A90F    |      ;
    STA.B strcVariables.n8Temp1                                ;82DB07|8592    |000092;
    LDA.B #$01                                                 ;82DB09|A901    |      ;
    STA.B strcVariables.n8Temp2                                ;82DB0B|8593    |000093;
    LDA.B #$01                                                 ;82DB0D|A901    |      ;
    STA.B strcVariables.n8Temp3                                ;82DB0F|8594    |000094;
    JSL.L fCore_ScreenFadeout                                  ;82DB11|220A8880|80880A;
    JSL.L fCore_SetForceBlank                                  ;82DB15|220F8E80|808E0F;
    SEP #$20                                                   ;82DB19|E220    |      ;
    LDA.B #$03                                                 ;82DB1B|A903    |      ;
    JSL.L fCore_ManageGraphicsPresets                          ;82DB1D|22598C80|808C59;
    JSL.L fCore_ZeroVRAM                                       ;82DB21|22468880|808846;
    JSL.L fCore_ZeroCGRAM                                      ;82DB25|22808980|808980;
    JSL.L fCore_Zero0x42Ptr                                    ;82DB29|22AB8F80|808FAB;
    JSL.L fObject_InitTileCache                                  ;82DB2D|22D78E85|858ED7;
    JSL.L fObject_ClearGameObject                              ;82DB31|220F8285|85820F;
    JSL.L fObjectSlots_ClearAll                                   ;82DB35|22C7A481|81A4C7;
    JSL.L fAI_ZeroCCPtr                                        ;82DB39|22008084|848000;
    REP #$20                                                   ;82DB3D|C220    |      ;
    STZ.B strcPlayer.posX                                      ;82DB3F|64D6    |0000D6;
    STZ.B strcPlayer.posY                                      ;82DB41|64D8    |0000D8;
    STZ.W strcDialogDisplay.mapDestX                           ;82DB43|9C7D01  |00017D;
    STZ.W strcDialogDisplay.mapDestY                           ;82DB46|9C7F01  |00017F;
    STZ.W strcDialogDisplay.mapFlags                           ;82DB49|9C9601  |000196;
    SEP #$20                                                   ;82DB4C|E220    |      ;
    LDA.B #$5B                                                 ;82DB4E|A95B    |      ;
    STA.B strcMap.loadAreaId                                   ;82DB50|8522    |000022;
    JSL.L fTileMap_MapChangeHandler                            ;82DB52|22C6A780|80A7C6;
    REP #$20                                                   ;82DB56|C220    |      ;
    LDA.W #$006D                                               ;82DB58|A96D00  |      ;
    JSL.L fPalette_LoadFirstHalf                               ;82DB5B|22CF9180|8091CF;
    SEP #$20                                                   ;82DB5F|E220    |      ;
    REP #$10                                                   ;82DB61|C210    |      ;
    LDA.B #$00                                                 ;82DB63|A900    |      ;
    STA.B strcSystem.arrayIndex                                ;82DB65|8527    |000027;
    LDA.B #$22                                                 ;82DB67|A922    |      ;
    STA.B strcSystem.destinationRegister                       ;82DB69|8529    |000029;
    REP #$20                                                   ;82DB6B|C220    |      ;
    LDY.W #$0200                                               ;82DB6D|A00002  |      ;
    LDX.W #$0000                                               ;82DB70|A20000  |      ;
    LDA.W #$D800                                               ;82DB73|A900D8  |      ;
    STA.B ptrTemp0x72                                          ;82DB76|8572    |000072;
    SEP #$20                                                   ;82DB78|E220    |      ;
    LDA.B #$A9                                                 ;82DB7A|A9A9    |      ;
    STA.B ptrTemp0x72+2                                        ;82DB7C|8574    |000074; A9D800 -> $72 (sPalette_0x6C)
    JSL.L fCore_PrepareTransfer                                ;82DB7E|22338A80|808A33;
    JSL.L fCore_StartPreparedTransfer                          ;82DB82|22B28A80|808AB2;
    SEP #$20                                                   ;82DB86|E220    |      ;
    LDA.B #$5C                                                 ;82DB88|A95C    |      ;
    STA.B strcMap.loadAreaId                                   ;82DB8A|8522    |000022;
    BRA fMainMenu_ShowTitleScreen                                        ;82DB8C|8024    |82DBB2;
 
 
fMainMenu_StateSkipToTitleScreen:
    SEP #$20                                                   ;82DB8E|E220    |      ;
    LDA.B #$5C                                                 ;82DB90|A95C    |      ;
    STA.B strcMap.loadAreaId                                   ;82DB92|8522    |000022;
    JSL.L fAudioEngine_MapMusicHandler                         ;82DB94|22DE9580|8095DE;
    JSL.L fAudio_FadeOutOnTrackChangeSlow                                 ;82DB98|22018483|838401;
    SEP #$20                                                   ;82DB9C|E220    |      ;
    LDA.B #$0F                                                 ;82DB9E|A90F    |      ;
    STA.B strcVariables.n8Temp1                                ;82DBA0|8592    |000092;
    LDA.B #$01                                                 ;82DBA2|A901    |      ;
    STA.B strcVariables.n8Temp2                                ;82DBA4|8593    |000093;
    LDA.B #$01                                                 ;82DBA6|A901    |      ;
    STA.B strcVariables.n8Temp3                                ;82DBA8|8594    |000094;
    JSL.L fCore_ScreenFadeout                                  ;82DBAA|220A8880|80880A;
    JSL.L fCore_SetForceBlank                                  ;82DBAE|220F8E80|808E0F;
 
fMainMenu_ShowTitleScreen:
    REP #$20                                                   ;82DBB2|C220    |      ;
    STZ.B strcVariables.n16Unk90                               ;82DBB4|6490    |000090;
    STZ.W strcBGScrool.BG1HorOffs                              ;82DBB6|9C3C01  |00013C;
    STZ.W strcBGScrool.BG1VerOffs                              ;82DBB9|9C3E01  |00013E;
    STZ.W strcBGScrool.BG2HorOffs                              ;82DBBC|9C4001  |000140;
    STZ.W strcBGScrool.BG2VerOffs                              ;82DBBF|9C4201  |000142;
    STZ.B strcPlayer.posX                                      ;82DBC2|64D6    |0000D6;
    STZ.B strcPlayer.posY                                      ;82DBC4|64D8    |0000D8;
    STZ.W strcDialogDisplay.mapDestX                           ;82DBC6|9C7D01  |00017D;
    STZ.W strcDialogDisplay.mapDestY                           ;82DBC9|9C7F01  |00017F;
    STZ.W strcDialogDisplay.mapFlags                           ;82DBCC|9C9601  |000196;
    JSL.L fTileMap_MapChangeHandler                            ;82DBCF|22C6A780|80A7C6;
    JSL.L fAudio_FadeOutOnTrackChangeFast                                 ;82DBD3|221F8483|83841F;
    JSL.L fAudio_LoadPendingTrack                                 ;82DBD7|22A48383|8383A4;
    JSL.L fAudio_StartPendingTrack                                 ;82DBDB|22808383|838380;
    SEP #$20                                                   ;82DBDF|E220    |      ;
    LDA.W strcAudio.trackId                                    ;82DBE1|AD1001  |000110;
    STA.W strcAudio.trackIdCopy                                ;82DBE4|8D1701  |000117;
    JSL.L fCore_ResetForceBlank                                ;82DBE7|221E8E80|808E1E;
    JSL.L fCore_WaitForNextNMI                                 ;82DBEB|22458680|808645;
    SEP #$20                                                   ;82DBEF|E220    |      ;
    LDA.B #$01                                                 ;82DBF1|A901    |      ;
    STA.B strcVariables.n8Temp1                                ;82DBF3|8592    |000092;
    LDA.B #$01                                                 ;82DBF5|A901    |      ;
    STA.B strcVariables.n8Temp2                                ;82DBF7|8593    |000093;
    LDA.B #$0F                                                 ;82DBF9|A90F    |      ;
    STA.B strcVariables.n8Temp3                                ;82DBFB|8594    |000094;
    JSL.L fCore_ScreenFadein                                   ;82DBFD|22CE8780|8087CE;
    SEP #$20                                                   ;82DC01|E220    |      ;
    LDA.B #$04                                                 ;82DC03|A904    |      ;
    STA.B strcVariables.n8Temp4                                ;82DC05|8595    |000095;
    STZ.B strcVariables.n8Temp3                                ;82DC07|6494    |000094;
    JML.L fMainMenu_EndFrame                                      ;82DC09|5C71D882|82D871;
 
 
fMainMenu_StateTitleStartCursorAnim:
    SEP #$20                                                   ;82DC0D|E220    |      ;
    LDA.B strcVariables.n8Temp3                                ;82DC0F|A594    |000094;
    AND.B #$01                                                 ;82DC11|2901    |      ;
    BEQ +                                                      ;82DC13|F004    |82DC19;
    JML.L .skip                                                ;82DC15|5C22DC82|82DC22;
 
 
  + REP #$20                                                   ;82DC19|C220    |      ;
    LDA.W strcBGScrool.BG2HorOffs                              ;82DC1B|AD4001  |000140;
    INC A                                                      ;82DC1E|1A      |      ;
    STA.W strcBGScrool.BG2HorOffs                              ;82DC1F|8D4001  |000140;
 
.skip:
    SEP #$20                                                   ;82DC22|E220    |      ;
    LDA.B strcVariables.n8Temp3                                ;82DC24|A594    |000094;
    CMP.B #$3C                                                 ;82DC26|C93C    |      ;
    BEQ +                                                      ;82DC28|F008    |82DC32;
    SEP #$20                                                   ;82DC2A|E220    |      ;
    INC.B strcVariables.n8Temp3                                ;82DC2C|E694    |000094;
    JML.L fMainMenu_EndFrame                                      ;82DC2E|5C71D882|82D871;
 
 
  + JSL.L fCore_Zero0x42Ptr                                    ;82DC32|22AB8F80|808FAB;
    REP #$20                                                   ;82DC36|C220    |      ;
    SEP #$10                                                   ;82DC38|E210    |      ;
    if !REGION_DE
    LDA.W #$F459                                           ;82DD95|A959F4  |      ;
    else
    LDA.W #$F2A4                                               ;82DC3A|A9A4F2  |      ;
    endif
    STA.B ptrTemp0x72                                          ;82DC3D|8572    |000072;
    SEP #$20                                                   ;82DC3F|E220    |      ;
    LDA.B #$82                                                 ;82DC41|A982    |      ;
    STA.B ptrTemp0x72+2                                        ;82DC43|8574    |000074; 82F2A4 -> $72 ()
    SEP #$20                                                   ;82DC45|E220    |      ;
    LDA.B #$0A                                                 ;82DC47|A90A    |      ;
    LDX.B #$04                                                 ;82DC49|A204    |      ;
    LDY.B #$07                                                 ;82DC4B|A007    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;82DC4D|22488E80|808E48;
    REP #$20                                                   ;82DC51|C220    |      ;
    SEP #$10                                                   ;82DC53|E210    |      ;
    if !REGION_DE
    LDA.W #$F46A                                           ;82DDB0|A96AF4  |      ;
    else
    LDA.W #$F2B5                                               ;82DC55|A9B5F2  |      ;
    endif
    STA.B ptrTemp0x72                                          ;82DC58|8572    |000072;
    SEP #$20                                                   ;82DC5A|E220    |      ;
    LDA.B #$82                                                 ;82DC5C|A982    |      ;
    STA.B ptrTemp0x72+2                                        ;82DC5E|8574    |000074; 82F2B5 -> $72 ()
    SEP #$20                                                   ;82DC60|E220    |      ;
    LDA.B #$0B                                                 ;82DC62|A90B    |      ;
    LDX.B #$05                                                 ;82DC64|A205    |      ;
    LDY.B #$07                                                 ;82DC66|A007    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;82DC68|22488E80|808E48;
    SEP #$20                                                   ;82DC6C|E220    |      ;
    LDA.W nUnknownFlags09D                                     ;82DC6E|AD8D09  |00098D;
    CMP.B #$01                                                 ;82DC71|C901    |      ;
    BNE +                                                      ;82DC73|D004    |82DC79;
    JML.L .case01                                              ;82DC75|5CD6DC82|82DCD6;
 
 
  + CMP.B #$02                                                 ;82DC79|C902    |      ;
    BNE +                                                      ;82DC7B|D004    |82DC81;
    JML.L .case02                                              ;82DC7D|5C2BDD82|82DD2B;
 
 
  + REP #$20                                                   ;82DC81|C220    |      ;
    SEP #$10                                                   ;82DC83|E210    |      ;
    if !REGION_DE
    LDA.W #$F47E                                           ;82DDE0|A97EF4  |      ;
    else
    LDA.W #$F2C9                                               ;82DC85|A9C9F2  |      ;
    endif
    STA.B ptrTemp0x72                                          ;82DC88|8572    |000072;
    SEP #$20                                                   ;82DC8A|E220    |      ;
    LDA.B #$82                                                 ;82DC8C|A982    |      ;
    STA.B ptrTemp0x72+2                                        ;82DC8E|8574    |000074; 82F2C9 -> $72 ()
    SEP #$20                                                   ;82DC90|E220    |      ;
    LDA.B #$0D                                                 ;82DC92|A90D    |      ;
    LDX.B #$06                                                 ;82DC94|A206    |      ;
    LDY.B #$07                                                 ;82DC96|A007    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;82DC98|22488E80|808E48;
    REP #$20                                                   ;82DC9C|C220    |      ;
    SEP #$10                                                   ;82DC9E|E210    |      ;
    if !REGION_DE
    LDA.W #$F48F                                           ;82DDFB|A98FF4  |      ;
    else
    LDA.W #$F2DA                                               ;82DCA0|A9DAF2  |      ;
    endif
    STA.B ptrTemp0x72                                          ;82DCA3|8572    |000072;
    SEP #$20                                                   ;82DCA5|E220    |      ;
    LDA.B #$82                                                 ;82DCA7|A982    |      ;
    STA.B ptrTemp0x72+2                                        ;82DCA9|8574    |000074; 82F2DA -> $72 ()
    SEP #$20                                                   ;82DCAB|E220    |      ;
    LDA.B #$0F                                                 ;82DCAD|A90F    |      ;
    LDX.B #$07                                                 ;82DCAF|A207    |      ;
    LDY.B #$07                                                 ;82DCB1|A007    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;82DCB3|22488E80|808E48;
    REP #$20                                                   ;82DCB7|C220    |      ;
    SEP #$10                                                   ;82DCB9|E210    |      ;
    if !REGION_DE
    LDA.W #$F48F                                           ;82DE16|A98FF4  |      ;
    else
    LDA.W #$F2DA                                               ;82DCBB|A9DAF2  |      ;
    endif
    STA.B ptrTemp0x72                                          ;82DCBE|8572    |000072;
    SEP #$20                                                   ;82DCC0|E220    |      ;
    LDA.B #$82                                                 ;82DCC2|A982    |      ;
    STA.B ptrTemp0x72+2                                        ;82DCC4|8574    |000074; 82F2DA -> $72 ()
    SEP #$20                                                   ;82DCC6|E220    |      ;
    LDA.B #$09                                                 ;82DCC8|A909    |      ;
    LDX.B #$08                                                 ;82DCCA|A208    |      ;
    LDY.B #$02                                                 ;82DCCC|A002    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;82DCCE|22488E80|808E48;
    if !REGION_DE
    JML.L $82DEDB                                          ;82DE2D|5CDBDE82|82DEDB;
.case01:
    REP #$20                                               ;82DE31|C220    |      ;
    SEP #$10                                               ;82DE33|E210    |      ;
    LDA.W #$F48F                                           ;82DE35|A98FF4  |      ;
    else
    JML.L $82DD80                                              ;82DCD2|5C80DD82|82DD80;
 
 
.case01:
    REP #$20                                                   ;82DCD6|C220    |      ;
    SEP #$10                                                   ;82DCD8|E210    |      ;
    LDA.W #$F2DA                                               ;82DCDA|A9DAF2  |      ;
    endif
    STA.B ptrTemp0x72                                          ;82DCDD|8572    |000072;
    SEP #$20                                                   ;82DCDF|E220    |      ;
    LDA.B #$82                                                 ;82DCE1|A982    |      ;
    STA.B ptrTemp0x72+2                                        ;82DCE3|8574    |000074; 82F2DA -> $72 ()
    SEP #$20                                                   ;82DCE5|E220    |      ;
    LDA.B #$0D                                                 ;82DCE7|A90D    |      ;
    LDX.B #$06                                                 ;82DCE9|A206    |      ;
    LDY.B #$07                                                 ;82DCEB|A007    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;82DCED|22488E80|808E48;
    REP #$20                                                   ;82DCF1|C220    |      ;
    SEP #$10                                                   ;82DCF3|E210    |      ;
    if !REGION_DE
    LDA.W #$F47E                                           ;82DE50|A97EF4  |      ;
    else
    LDA.W #$F2C9                                               ;82DCF5|A9C9F2  |      ;
    endif
    STA.B ptrTemp0x72                                          ;82DCF8|8572    |000072;
    SEP #$20                                                   ;82DCFA|E220    |      ;
    LDA.B #$82                                                 ;82DCFC|A982    |      ;
    STA.B ptrTemp0x72+2                                        ;82DCFE|8574    |000074; 82F2C9 -> $72 ()
    SEP #$20                                                   ;82DD00|E220    |      ;
    LDA.B #$0F                                                 ;82DD02|A90F    |      ;
    LDX.B #$07                                                 ;82DD04|A207    |      ;
    LDY.B #$07                                                 ;82DD06|A007    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;82DD08|22488E80|808E48;
    REP #$20                                                   ;82DD0C|C220    |      ;
    SEP #$10                                                   ;82DD0E|E210    |      ;
    if !REGION_DE
    LDA.W #$F48F                                           ;82DE6B|A98FF4  |      ;
    else
    LDA.W #$F2DA                                               ;82DD10|A9DAF2  |      ;
    endif
    STA.B ptrTemp0x72                                          ;82DD13|8572    |000072;
    SEP #$20                                                   ;82DD15|E220    |      ;
    LDA.B #$82                                                 ;82DD17|A982    |      ;
    STA.B ptrTemp0x72+2                                        ;82DD19|8574    |000074; 82F2DA -> $72 ()
    SEP #$20                                                   ;82DD1B|E220    |      ;
    LDA.B #$09                                                 ;82DD1D|A909    |      ;
    LDX.B #$08                                                 ;82DD1F|A208    |      ;
    LDY.B #$02                                                 ;82DD21|A002    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;82DD23|22488E80|808E48;
    if !REGION_DE
    JML.L $82DEDB                                          ;82DE82|5CDBDE82|82DEDB;
.case02:
    REP #$20                                               ;82DE86|C220    |      ;
    SEP #$10                                               ;82DE88|E210    |      ;
    LDA.W #$F48F                                           ;82DE8A|A98FF4  |      ;
    else
    JML.L $82DD80                                              ;82DD27|5C80DD82|82DD80;
 
 
.case02:
    REP #$20                                                   ;82DD2B|C220    |      ;
    SEP #$10                                                   ;82DD2D|E210    |      ;
    LDA.W #$F2DA                                               ;82DD2F|A9DAF2  |      ;
    endif
    STA.B ptrTemp0x72                                          ;82DD32|8572    |000072;
    SEP #$20                                                   ;82DD34|E220    |      ;
    LDA.B #$82                                                 ;82DD36|A982    |      ;
    STA.B ptrTemp0x72+2                                        ;82DD38|8574    |000074; 82F2DA -> $72 ()
    SEP #$20                                                   ;82DD3A|E220    |      ;
    LDA.B #$0D                                                 ;82DD3C|A90D    |      ;
    LDX.B #$06                                                 ;82DD3E|A206    |      ;
    LDY.B #$07                                                 ;82DD40|A007    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;82DD42|22488E80|808E48;
    REP #$20                                                   ;82DD46|C220    |      ;
    SEP #$10                                                   ;82DD48|E210    |      ;
    if !REGION_DE
    LDA.W #$F48F                                           ;82DEA5|A98FF4  |      ;
    else
    LDA.W #$F2DA                                               ;82DD4A|A9DAF2  |      ;
    endif
    STA.B ptrTemp0x72                                          ;82DD4D|8572    |000072;
    SEP #$20                                                   ;82DD4F|E220    |      ;
    LDA.B #$82                                                 ;82DD51|A982    |      ;
    STA.B ptrTemp0x72+2                                        ;82DD53|8574    |000074; 82F2DA -> $72 ()
    SEP #$20                                                   ;82DD55|E220    |      ;
    LDA.B #$0F                                                 ;82DD57|A90F    |      ;
    LDX.B #$07                                                 ;82DD59|A207    |      ;
    LDY.B #$07                                                 ;82DD5B|A007    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;82DD5D|22488E80|808E48;
    REP #$20                                                   ;82DD61|C220    |      ;
    SEP #$10                                                   ;82DD63|E210    |      ;
    if !REGION_DE
    LDA.W #$F47E                                           ;82DEC0|A97EF4  |      ;
    else
    LDA.W #$F2C9                                               ;82DD65|A9C9F2  |      ;
    endif
    STA.B ptrTemp0x72                                          ;82DD68|8572    |000072;
    SEP #$20                                                   ;82DD6A|E220    |      ;
    LDA.B #$82                                                 ;82DD6C|A982    |      ;
    STA.B ptrTemp0x72+2                                        ;82DD6E|8574    |000074; 82F2C9 -> $72 ()
    SEP #$20                                                   ;82DD70|E220    |      ;
    LDA.B #$09                                                 ;82DD72|A909    |      ;
    LDX.B #$08                                                 ;82DD74|A208    |      ;
    LDY.B #$02                                                 ;82DD76|A002    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;82DD78|22488E80|808E48;
    if !REGION_DE
    JML.L $82DEDB                                          ;82DED7|5CDBDE82|82DEDB;
    else
    JML.L $82DD80                                              ;82DD7C|5C80DD82|82DD80;
    endif
 
 
  + SEP #$20                                                   ;82DD80|E220    |      ;
    LDA.B #$05                                                 ;82DD82|A905    |      ;
    STA.B strcVariables.n8Temp4                                ;82DD84|8595    |000095;
    STZ.B strcVariables.n8Temp3                                ;82DD86|6494    |000094;
    JML.L fMainMenu_EndFrame                                      ;82DD88|5C71D882|82D871;
 
 
fMainMenu_StateTitleMenuInput:
    SEP #$20                                                   ;82DD8C|E220    |      ;
    LDA.B strcVariables.n8Temp3                                ;82DD8E|A594    |000094;
    AND.B #$01                                                 ;82DD90|2901    |      ;
    BNE +                                                      ;82DD92|D009    |82DD9D;
    REP #$20                                                   ;82DD94|C220    |      ;
    LDA.W strcBGScrool.BG2HorOffs                              ;82DD96|AD4001  |000140;
    INC A                                                      ;82DD99|1A      |      ;
    STA.W strcBGScrool.BG2HorOffs                              ;82DD9A|8D4001  |000140;
 
  + SEP #$20                                                   ;82DD9D|E220    |      ;
    INC.B strcVariables.n8Temp3                                ;82DD9F|E694    |000094;
    LDA.B strcVariables.u8Unk97                                ;82DDA1|A597    |000097;
    BNE +                                                      ;82DDA3|D004    |82DDA9;
    JML.L .return                                              ;82DDA5|5CBDDE82|82DEBD;
 
 
  + STZ.B strcVariables.u8Unk97                                ;82DDA9|6497    |000097;
    LDA.W nUnknownFlags09D                                     ;82DDAB|AD8D09  |00098D;
    CMP.B #$01                                                 ;82DDAE|C901    |      ;
    BNE +                                                      ;82DDB0|D004    |82DDB6;
    JML.L .case01                                              ;82DDB2|5C13DE82|82DE13;
 
 
  + CMP.B #$02                                                 ;82DDB6|C902    |      ;
    BNE +                                                      ;82DDB8|D004    |82DDBE;
    JML.L .case02                                              ;82DDBA|5C68DE82|82DE68;
 
 
  + REP #$20                                                   ;82DDBE|C220    |      ;
    SEP #$10                                                   ;82DDC0|E210    |      ;
    if !REGION_DE
    LDA.W #$F47E                                           ;82DF1D|A97EF4  |      ;
    else
    LDA.W #$F2C9                                               ;82DDC2|A9C9F2  |      ;
    endif
    STA.B ptrTemp0x72                                          ;82DDC5|8572    |000072;
    SEP #$20                                                   ;82DDC7|E220    |      ;
    LDA.B #$82                                                 ;82DDC9|A982    |      ;
    STA.B ptrTemp0x72+2                                        ;82DDCB|8574    |000074; 82F2C9 -> $72 ()
    SEP #$20                                                   ;82DDCD|E220    |      ;
    LDA.B #$0D                                                 ;82DDCF|A90D    |      ;
    LDX.B #$06                                                 ;82DDD1|A206    |      ;
    LDY.B #$07                                                 ;82DDD3|A007    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;82DDD5|22488E80|808E48;
    REP #$20                                                   ;82DDD9|C220    |      ;
    SEP #$10                                                   ;82DDDB|E210    |      ;
    if !REGION_DE
    LDA.W #$F48F                                           ;82DF38|A98FF4  |      ;
    else
    LDA.W #$F2DA                                               ;82DDDD|A9DAF2  |      ;
    endif
    STA.B ptrTemp0x72                                          ;82DDE0|8572    |000072;
    SEP #$20                                                   ;82DDE2|E220    |      ;
    LDA.B #$82                                                 ;82DDE4|A982    |      ;
    STA.B ptrTemp0x72+2                                        ;82DDE6|8574    |000074; 82F2DA -> $72 ()
    SEP #$20                                                   ;82DDE8|E220    |      ;
    LDA.B #$0F                                                 ;82DDEA|A90F    |      ;
    LDX.B #$07                                                 ;82DDEC|A207    |      ;
    LDY.B #$07                                                 ;82DDEE|A007    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;82DDF0|22488E80|808E48;
    REP #$20                                                   ;82DDF4|C220    |      ;
    SEP #$10                                                   ;82DDF6|E210    |      ;
    if !REGION_DE
    LDA.W #$F48F                                           ;82DF53|A98FF4  |      ;
    else
    LDA.W #$F2DA                                               ;82DDF8|A9DAF2  |      ;
    endif
    STA.B ptrTemp0x72                                          ;82DDFB|8572    |000072;
    SEP #$20                                                   ;82DDFD|E220    |      ;
    LDA.B #$82                                                 ;82DDFF|A982    |      ;
    STA.B ptrTemp0x72+2                                        ;82DE01|8574    |000074; 82F2DA -> $72 ()
    SEP #$20                                                   ;82DE03|E220    |      ;
    LDA.B #$09                                                 ;82DE05|A909    |      ;
    LDX.B #$08                                                 ;82DE07|A208    |      ;
    LDY.B #$02                                                 ;82DE09|A002    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;82DE0B|22488E80|808E48;
    JML.L .return                                              ;82DE0F|5CBDDE82|82DEBD;
 
 
.case01:
    REP #$20                                                   ;82DE13|C220    |      ;
    SEP #$10                                                   ;82DE15|E210    |      ;
    if !REGION_DE
    LDA.W #$F48F                                           ;82DF72|A98FF4  |      ;
    else
    LDA.W #$F2DA                                               ;82DE17|A9DAF2  |      ;
    endif
    STA.B ptrTemp0x72                                          ;82DE1A|8572    |000072;
    SEP #$20                                                   ;82DE1C|E220    |      ;
    LDA.B #$82                                                 ;82DE1E|A982    |      ;
    STA.B ptrTemp0x72+2                                        ;82DE20|8574    |000074; 82F2DA -> $72 ()
    SEP #$20                                                   ;82DE22|E220    |      ;
    LDA.B #$0D                                                 ;82DE24|A90D    |      ;
    LDX.B #$06                                                 ;82DE26|A206    |      ;
    LDY.B #$07                                                 ;82DE28|A007    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;82DE2A|22488E80|808E48;
    REP #$20                                                   ;82DE2E|C220    |      ;
    SEP #$10                                                   ;82DE30|E210    |      ;
    if !REGION_DE
    LDA.W #$F47E                                           ;82DF8D|A97EF4  |      ;
    else
    LDA.W #$F2C9                                               ;82DE32|A9C9F2  |      ;
    endif
    STA.B ptrTemp0x72                                          ;82DE35|8572    |000072;
    SEP #$20                                                   ;82DE37|E220    |      ;
    LDA.B #$82                                                 ;82DE39|A982    |      ;
    STA.B ptrTemp0x72+2                                        ;82DE3B|8574    |000074; 82F2C9 -> $72 ()
    SEP #$20                                                   ;82DE3D|E220    |      ;
    LDA.B #$0F                                                 ;82DE3F|A90F    |      ;
    LDX.B #$07                                                 ;82DE41|A207    |      ;
    LDY.B #$07                                                 ;82DE43|A007    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;82DE45|22488E80|808E48;
    REP #$20                                                   ;82DE49|C220    |      ;
    SEP #$10                                                   ;82DE4B|E210    |      ;
    if !REGION_DE
    LDA.W #$F48F                                           ;82DFA8|A98FF4  |      ;
    else
    LDA.W #$F2DA                                               ;82DE4D|A9DAF2  |      ;
    endif
    STA.B ptrTemp0x72                                          ;82DE50|8572    |000072;
    SEP #$20                                                   ;82DE52|E220    |      ;
    LDA.B #$82                                                 ;82DE54|A982    |      ;
    STA.B ptrTemp0x72+2                                        ;82DE56|8574    |000074; 82F2DA -> $72 ()
    SEP #$20                                                   ;82DE58|E220    |      ;
    LDA.B #$09                                                 ;82DE5A|A909    |      ;
    LDX.B #$08                                                 ;82DE5C|A208    |      ;
    LDY.B #$02                                                 ;82DE5E|A002    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;82DE60|22488E80|808E48;
    JML.L .return                                              ;82DE64|5CBDDE82|82DEBD;
 
 
.case02:
    REP #$20                                                   ;82DE68|C220    |      ;
    SEP #$10                                                   ;82DE6A|E210    |      ;
    if !REGION_DE
    LDA.W #$F48F                                           ;82DFC7|A98FF4  |      ;
    else
    LDA.W #$F2DA                                               ;82DE6C|A9DAF2  |      ;
    endif
    STA.B ptrTemp0x72                                          ;82DE6F|8572    |000072;
    SEP #$20                                                   ;82DE71|E220    |      ;
    LDA.B #$82                                                 ;82DE73|A982    |      ;
    STA.B ptrTemp0x72+2                                        ;82DE75|8574    |000074; 82F2DA -> $72 ()
    SEP #$20                                                   ;82DE77|E220    |      ;
    LDA.B #$0D                                                 ;82DE79|A90D    |      ;
    LDX.B #$06                                                 ;82DE7B|A206    |      ;
    LDY.B #$07                                                 ;82DE7D|A007    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;82DE7F|22488E80|808E48;
    REP #$20                                                   ;82DE83|C220    |      ;
    SEP #$10                                                   ;82DE85|E210    |      ;
    if !REGION_DE
    LDA.W #$F48F                                           ;82DFE2|A98FF4  |      ;
    else
    LDA.W #$F2DA                                               ;82DE87|A9DAF2  |      ;
    endif
    STA.B ptrTemp0x72                                          ;82DE8A|8572    |000072;
    SEP #$20                                                   ;82DE8C|E220    |      ;
    LDA.B #$82                                                 ;82DE8E|A982    |      ;
    STA.B ptrTemp0x72+2                                        ;82DE90|8574    |000074; 82F2DA -> $72 ()
    SEP #$20                                                   ;82DE92|E220    |      ;
    LDA.B #$0F                                                 ;82DE94|A90F    |      ;
    LDX.B #$07                                                 ;82DE96|A207    |      ;
    LDY.B #$07                                                 ;82DE98|A007    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;82DE9A|22488E80|808E48;
    REP #$20                                                   ;82DE9E|C220    |      ;
    SEP #$10                                                   ;82DEA0|E210    |      ;
    if !REGION_DE
    LDA.W #$F47E                                           ;82DFFD|A97EF4  |      ;
    else
    LDA.W #$F2C9                                               ;82DEA2|A9C9F2  |      ;
    endif
    STA.B ptrTemp0x72                                          ;82DEA5|8572    |000072;
    SEP #$20                                                   ;82DEA7|E220    |      ;
    LDA.B #$82                                                 ;82DEA9|A982    |      ;
    STA.B ptrTemp0x72+2                                        ;82DEAB|8574    |000074; 82F2C9 -> $72 ()
    SEP #$20                                                   ;82DEAD|E220    |      ;
    LDA.B #$09                                                 ;82DEAF|A909    |      ;
    LDX.B #$08                                                 ;82DEB1|A208    |      ;
    LDY.B #$02                                                 ;82DEB3|A002    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;82DEB5|22488E80|808E48;
    JML.L .return                                              ;82DEB9|5CBDDE82|82DEBD;
 
 
.return:
    REP #$30                                                   ;82DEBD|C230    |      ;
    INC.B strcVariables.n16Unk90                               ;82DEBF|E690    |000090;
    JML.L fMainMenu_EndFrame                                      ;82DEC1|5C71D882|82D871;
 
 
fMainMenu_ReturnToTitleFromSlotSelect:
    SEP #$20                                                   ;82DEC5|E220    |      ;
    LDA.B #$5C                                                 ;82DEC7|A95C    |      ;
    STA.B strcMap.loadAreaId                                   ;82DEC9|8522    |000022;
    JSL.L fAudioEngine_MapMusicHandler                         ;82DECB|22DE9580|8095DE;
    JSL.L fAudio_FadeOutOnTrackChangeSlow                                 ;82DECF|22018483|838401;
    SEP #$20                                                   ;82DED3|E220    |      ;
    LDA.B #$0F                                                 ;82DED5|A90F    |      ;
    STA.B strcVariables.n8Temp1                                ;82DED7|8592    |000092;
    LDA.B #$01                                                 ;82DED9|A901    |      ;
    STA.B strcVariables.n8Temp2                                ;82DEDB|8593    |000093;
    LDA.B #$01                                                 ;82DEDD|A901    |      ;
    STA.B strcVariables.n8Temp3                                ;82DEDF|8594    |000094;
    JSL.L fCore_ScreenFadeout                                  ;82DEE1|220A8880|80880A;
    JSL.L fCore_SetForceBlank                                  ;82DEE5|220F8E80|808E0F;
    JSL.L fCore_ZeroVRAM                                       ;82DEE9|22468880|808846;
    SEP #$20                                                   ;82DEED|E220    |      ;
    LDA.B #$03                                                 ;82DEEF|A903    |      ;
    JSL.L fCore_ManageGraphicsPresets                          ;82DEF1|22598C80|808C59;
    REP #$20                                                   ;82DEF5|C220    |      ;
    STZ.W strcBGScrool.BG1HorOffs                              ;82DEF7|9C3C01  |00013C;
    STZ.W strcBGScrool.BG1VerOffs                              ;82DEFA|9C3E01  |00013E;
    STZ.W strcBGScrool.BG2HorOffs                              ;82DEFD|9C4001  |000140;
    STZ.W strcBGScrool.BG2VerOffs                              ;82DF00|9C4201  |000142;
    STZ.B strcPlayer.posX                                      ;82DF03|64D6    |0000D6;
    STZ.B strcPlayer.posY                                      ;82DF05|64D8    |0000D8;
    STZ.W strcDialogDisplay.mapDestX                           ;82DF07|9C7D01  |00017D;
    STZ.W strcDialogDisplay.mapDestY                           ;82DF0A|9C7F01  |00017F;
    STZ.W strcDialogDisplay.mapFlags                           ;82DF0D|9C9601  |000196;
    SEP #$20                                                   ;82DF10|E220    |      ;
    LDA.B #$5B                                                 ;82DF12|A95B    |      ;
    STA.B strcMap.loadAreaId                                   ;82DF14|8522    |000022;
    JSL.L fTileMap_MapChangeHandler                            ;82DF16|22C6A780|80A7C6;
    SEP #$20                                                   ;82DF1A|E220    |      ;
    LDA.B #$5C                                                 ;82DF1C|A95C    |      ;
    STA.B strcMap.loadAreaId                                   ;82DF1E|8522    |000022;
    JSL.L fTileMap_MapChangeHandler                            ;82DF20|22C6A780|80A7C6;
    REP #$20                                                   ;82DF24|C220    |      ;
    LDA.W #$006D                                               ;82DF26|A96D00  |      ;
    JSL.L fPalette_LoadFirstHalf                               ;82DF29|22CF9180|8091CF;
    SEP #$20                                                   ;82DF2D|E220    |      ;
    REP #$10                                                   ;82DF2F|C210    |      ;
    LDA.B #$00                                                 ;82DF31|A900    |      ;
    STA.B strcSystem.arrayIndex                                ;82DF33|8527    |000027;
    LDA.B #$22                                                 ;82DF35|A922    |      ;
    STA.B strcSystem.destinationRegister                       ;82DF37|8529    |000029;
    REP #$20                                                   ;82DF39|C220    |      ;
    LDY.W #$0200                                               ;82DF3B|A00002  |      ;
    LDX.W #$0000                                               ;82DF3E|A20000  |      ;
    LDA.W #$D800                                               ;82DF41|A900D8  |      ;
    STA.B ptrTemp0x72                                          ;82DF44|8572    |000072;
    SEP #$20                                                   ;82DF46|E220    |      ;
    LDA.B #$A9                                                 ;82DF48|A9A9    |      ;
    STA.B ptrTemp0x72+2                                        ;82DF4A|8574    |000074;
    JSL.L fCore_PrepareTransfer                                ;82DF4C|22338A80|808A33;
    JSL.L fCore_StartPreparedTransfer                          ;82DF50|22B28A80|808AB2;
    JSL.L fAudio_FadeOutOnTrackChangeFast                                 ;82DF54|221F8483|83841F;
    JSL.L fAudio_LoadPendingTrack                                 ;82DF58|22A48383|8383A4;
    JSL.L fAudio_StartPendingTrack                                 ;82DF5C|22808383|838380;
    SEP #$20                                                   ;82DF60|E220    |      ;
    LDA.W strcAudio.trackId                                    ;82DF62|AD1001  |000110;
    STA.W strcAudio.trackIdCopy                                ;82DF65|8D1701  |000117;
    JSL.L fCore_ResetForceBlank                                ;82DF68|221E8E80|808E1E;
    JSL.L fCore_WaitForNextNMI                                 ;82DF6C|22458680|808645;
    SEP #$20                                                   ;82DF70|E220    |      ;
    LDA.B #$01                                                 ;82DF72|A901    |      ;
    STA.B strcVariables.n8Temp1                                ;82DF74|8592    |000092;
    LDA.B #$01                                                 ;82DF76|A901    |      ;
    STA.B strcVariables.n8Temp2                                ;82DF78|8593    |000093;
    LDA.B #$0F                                                 ;82DF7A|A90F    |      ;
    STA.B strcVariables.n8Temp3                                ;82DF7C|8594    |000094;
    JSL.L fCore_ScreenFadein                                   ;82DF7E|22CE8780|8087CE;
    SEP #$20                                                   ;82DF82|E220    |      ;
    LDA.B #$04                                                 ;82DF84|A904    |      ;
    STA.B strcVariables.n8Temp4                                ;82DF86|8595    |000095;
    STZ.B strcVariables.n8Temp3                                ;82DF88|6494    |000094;
    REP #$20                                                   ;82DF8A|C220    |      ;
    STZ.B strcVariables.n16Unk90                               ;82DF8C|6490    |000090;
    JML.L fMainMenu_EndFrame                                      ;82DF8E|5C71D882|82D871;
 
 
fMainMenu_StateNewGameSlotSelect:
    SEP #$20                                                   ;82DF92|E220    |      ;
    LDA.B #$5E                                                 ;82DF94|A95E    |      ;
    STA.B strcMap.loadAreaId                                   ;82DF96|8522    |000022;
    JSL.L fAudioEngine_MapMusicHandler                         ;82DF98|22DE9580|8095DE;
    JSL.L fAudio_FadeOutOnTrackChangeSlow                                 ;82DF9C|22018483|838401;
    SEP #$20                                                   ;82DFA0|E220    |      ;
    LDA.B #$0F                                                 ;82DFA2|A90F    |      ;
    STA.B strcVariables.n8Temp1                                ;82DFA4|8592    |000092;
    LDA.B #$03                                                 ;82DFA6|A903    |      ;
    STA.B strcVariables.n8Temp2                                ;82DFA8|8593    |000093;
    LDA.B #$01                                                 ;82DFAA|A901    |      ;
    STA.B strcVariables.n8Temp3                                ;82DFAC|8594    |000094;
    JSL.L fCore_ScreenFadeout                                  ;82DFAE|220A8880|80880A;
    JSL.L fCore_SetForceBlank                                  ;82DFB2|220F8E80|808E0F;
    JSL.L fCore_ZeroVRAM                                       ;82DFB6|22468880|808846;
    SEP #$20                                                   ;82DFBA|E220    |      ;
    LDA.B #$04                                                 ;82DFBC|A904    |      ;
    JSL.L fCore_ManageGraphicsPresets                          ;82DFBE|22598C80|808C59;
    JSL.L fTileMap_MapChangeHandler                            ;82DFC2|22C6A780|80A7C6;
    REP #$20                                                   ;82DFC6|C220    |      ;
    LDA.W #$006F                                               ;82DFC8|A96F00  |      ;
    JSL.L fPalette_LoadFirstHalf                               ;82DFCB|22CF9180|8091CF;
    SEP #$20                                                   ;82DFCF|E220    |      ;
    REP #$10                                                   ;82DFD1|C210    |      ;
    LDA.B #$00                                                 ;82DFD3|A900    |      ;
    STA.B strcSystem.arrayIndex                                ;82DFD5|8527    |000027;
    LDA.B #$22                                                 ;82DFD7|A922    |      ;
    STA.B strcSystem.destinationRegister                       ;82DFD9|8529    |000029;
    REP #$20                                                   ;82DFDB|C220    |      ;
    LDY.W #$0200                                               ;82DFDD|A00002  |      ;
    LDX.W #$0000                                               ;82DFE0|A20000  |      ;
    LDA.W #$8C00                                               ;82DFE3|A9008C  |      ;
    STA.B ptrTemp0x72                                          ;82DFE6|8572    |000072;
    SEP #$20                                                   ;82DFE8|E220    |      ;
    LDA.B #$A9                                                 ;82DFEA|A9A9    |      ;
    STA.B ptrTemp0x72+2                                        ;82DFEC|8574    |000074;
    JSL.L fCore_PrepareTransfer                                ;82DFEE|22338A80|808A33;
    JSL.L fCore_StartPreparedTransfer                          ;82DFF2|22B28A80|808AB2;
    JSR.W fMainMenu_DrawSaveSlotFrames                                      ;82DFF6|2042E7  |82E742;
    REP #$30                                                   ;82DFF9|C230    |      ;
    LDA.W #$0000                                               ;82DFFB|A90000  |      ;
    LDY.W #$0000                                               ;82DFFE|A00000  |      ;
    JSR.W fMainMenu_DrawSaveSlotInfo                                      ;82E001|2005E4  |82E405;
    REP #$30                                                   ;82E004|C230    |      ;
    LDA.W #$0001                                               ;82E006|A90100  |      ;
    LDY.W #$0000                                               ;82E009|A00000  |      ;
    JSR.W fMainMenu_DrawSaveSlotInfo                                      ;82E00C|2005E4  |82E405;
    JSL.L fCore_Zero0x42Ptr                                    ;82E00F|22AB8F80|808FAB;
    REP #$20                                                   ;82E013|C220    |      ;
    STZ.W strcBGScrool.BG1HorOffs                              ;82E015|9C3C01  |00013C;
    STZ.W strcBGScrool.BG1VerOffs                              ;82E018|9C3E01  |00013E;
    STZ.W strcBGScrool.BG2HorOffs                              ;82E01B|9C4001  |000140;
    STZ.W strcBGScrool.BG2VerOffs                              ;82E01E|9C4201  |000142;
    STZ.W strcBGScrool.BG3HorOffs                              ;82E021|9C4401  |000144;
    STZ.W strcBGScrool.BG3VerOffs                              ;82E024|9C4601  |000146;
    SEP #$20                                                   ;82E027|E220    |      ;
    LDA.B #$00                                                 ;82E029|A900    |      ;
    XBA                                                        ;82E02B|EB      |      ;
    LDA.W $098E+!DE_RAM_SHIFT                              ;82E02C|AD8E09  |00098E;
    JSL.L fGameEngine_LoadContinue                             ;82E02F|2245BA83|83BA45;
    REP #$30                                                   ;82E033|C230    |      ;
    CPX.W #$0000                                               ;82E035|E00000  |      ;
    BEQ +                                                      ;82E038|F000    |82E03A;
 
  + SEP #$20                                                   ;82E03A|E220    |      ;
    LDA.W $098E+!DE_RAM_SHIFT                              ;82E03C|AD8E09  |00098E;
    BEQ +                                                      ;82E03F|F004    |82E045;
    JML.L fMainMenu_NewGameSlotSelect_InitCursorSlot2                                      ;82E041|5C7FE082|82E07F;
 
 
  + REP #$20                                                   ;82E045|C220    |      ;
    SEP #$10                                                   ;82E047|E210    |      ;
    if !REGION_DE
    LDA.W #$F497                                           ;82E1A4|A997F4  |      ;
    else
    LDA.W #$F2E2                                               ;82E049|A9E2F2  |      ;
    endif
    STA.B ptrTemp0x72                                          ;82E04C|8572    |000072;
    SEP #$20                                                   ;82E04E|E220    |      ;
    LDA.B #$82                                                 ;82E050|A982    |      ;
    STA.B ptrTemp0x72+2                                        ;82E052|8574    |000074;
    SEP #$20                                                   ;82E054|E220    |      ;
    LDA.B #$06                                                 ;82E056|A906    |      ;
    LDX.B #$04                                                 ;82E058|A204    |      ;
    LDY.B #$00                                                 ;82E05A|A000    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;82E05C|22488E80|808E48;
    REP #$20                                                   ;82E060|C220    |      ;
    SEP #$10                                                   ;82E062|E210    |      ;
    if !REGION_DE
    LDA.W #$F4AE                                           ;82E1BF|A9AEF4  |      ;
    else
    LDA.W #$F2F9                                               ;82E064|A9F9F2  |      ;
    endif
    STA.B ptrTemp0x72                                          ;82E067|8572    |000072;
    SEP #$20                                                   ;82E069|E220    |      ;
    LDA.B #$82                                                 ;82E06B|A982    |      ;
    STA.B ptrTemp0x72+2                                        ;82E06D|8574    |000074;
    SEP #$20                                                   ;82E06F|E220    |      ;
    LDA.B #$06                                                 ;82E071|A906    |      ;
    LDX.B #$05                                                 ;82E073|A205    |      ;
    LDY.B #$01                                                 ;82E075|A001    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;82E077|22488E80|808E48;
    JML.L fMainMenu_NewGameSlotSelect_FadeIn                                      ;82E07B|5CB5E082|82E0B5;
 
 
fMainMenu_NewGameSlotSelect_InitCursorSlot2:
    REP #$20                                                   ;82E07F|C220    |      ;
    SEP #$10                                                   ;82E081|E210    |      ;
    if !REGION_DE
    LDA.W #$F4AE                                           ;82E1DE|A9AEF4  |      ;
    else
    LDA.W #$F2F9                                               ;82E083|A9F9F2  |      ;
    endif
    STA.B ptrTemp0x72                                          ;82E086|8572    |000072;
    SEP #$20                                                   ;82E088|E220    |      ;
    LDA.B #$82                                                 ;82E08A|A982    |      ;
    STA.B ptrTemp0x72+2                                        ;82E08C|8574    |000074;
    SEP #$20                                                   ;82E08E|E220    |      ;
    LDA.B #$06                                                 ;82E090|A906    |      ;
    LDX.B #$04                                                 ;82E092|A204    |      ;
    LDY.B #$00                                                 ;82E094|A000    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;82E096|22488E80|808E48;
    REP #$20                                                   ;82E09A|C220    |      ;
    SEP #$10                                                   ;82E09C|E210    |      ;
    if !REGION_DE
    LDA.W #$F497                                           ;82E1F9|A997F4  |      ;
    else
    LDA.W #$F2E2                                               ;82E09E|A9E2F2  |      ;
    endif
    STA.B ptrTemp0x72                                          ;82E0A1|8572    |000072;
    SEP #$20                                                   ;82E0A3|E220    |      ;
    LDA.B #$82                                                 ;82E0A5|A982    |      ;
    STA.B ptrTemp0x72+2                                        ;82E0A7|8574    |000074;
    SEP #$20                                                   ;82E0A9|E220    |      ;
    LDA.B #$06                                                 ;82E0AB|A906    |      ;
    LDX.B #$05                                                 ;82E0AD|A205    |      ;
    LDY.B #$01                                                 ;82E0AF|A001    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;82E0B1|22488E80|808E48;
 
fMainMenu_NewGameSlotSelect_FadeIn:
    JSL.L fAudio_FadeOutOnTrackChangeFast                                 ;82E0B5|221F8483|83841F;
    JSL.L fAudio_LoadPendingTrack                                 ;82E0B9|22A48383|8383A4;
    JSL.L fAudio_StartPendingTrack                                 ;82E0BD|22808383|838380;
    SEP #$20                                                   ;82E0C1|E220    |      ;
    LDA.W strcAudio.trackId                                    ;82E0C3|AD1001  |000110;
    STA.W strcAudio.trackIdCopy                                ;82E0C6|8D1701  |000117;
    JSL.L fCore_ResetForceBlank                                ;82E0C9|221E8E80|808E1E;
    JSL.L fCore_WaitForNextNMI                                 ;82E0CD|22458680|808645;
    SEP #$20                                                   ;82E0D1|E220    |      ;
    LDA.B #$03                                                 ;82E0D3|A903    |      ;
    STA.B strcVariables.n8Temp1                                ;82E0D5|8592    |000092;
    LDA.B #$03                                                 ;82E0D7|A903    |      ;
    STA.B strcVariables.n8Temp2                                ;82E0D9|8593    |000093;
    LDA.B #$0F                                                 ;82E0DB|A90F    |      ;
    STA.B strcVariables.n8Temp3                                ;82E0DD|8594    |000094;
    JSL.L fCore_ScreenFadein                                   ;82E0DF|22CE8780|8087CE;
    SEP #$20                                                   ;82E0E3|E220    |      ;
    STZ.B strcVariables.n8Temp3                                ;82E0E5|6494    |000094;
    STZ.B strcVariables.u8Unk96                                ;82E0E7|6496    |000096;
    STZ.B strcVariables.u8Unk97                                ;82E0E9|6497    |000097;
 
fMainMenu_NewGameSlotSelect_WaitFrame:
    SEP #$20                                                   ;82E0EB|E220    |      ;
    LDA.B $00                                                  ;82E0ED|A500    |000000;
    BEQ fMainMenu_NewGameSlotSelect_WaitFrame                                        ;82E0EF|F0FA    |82E0EB;
    REP #$20                                                   ;82E0F1|C220    |      ;
    LDA.W #$1800                                               ;82E0F3|A90018  |      ;
    STA.B $C7                                                  ;82E0F6|85C7    |0000C7;
    JSL.L fPalette_ProcessColorAnimSlots                                  ;82E0F8|22698E80|808E69;
    JSL.L fInput_Handler                                       ;82E0FC|2234C084|84C034;
    SEP #$20                                                   ;82E100|E220    |      ;
    LDA.B strcVariables.u8Unk97                                ;82E102|A597    |000097;
    BNE +                                                      ;82E104|D004    |82E10A;
    JML.L fMainMenu_NewGameSlotSelect_FrameTail                                      ;82E106|5CBDE182|82E1BD;
 
 
  + STZ.B strcVariables.u8Unk97                                ;82E10A|6497    |000097;
    LDA.W $098E+!DE_RAM_SHIFT                              ;82E10C|AD8E09  |00098E;
    BEQ +                                                      ;82E10F|F004    |82E115;
    JML.L fMainMenu_NewGameSlotSelect_MoveCursorSlot2                                      ;82E111|5C6BE182|82E16B;
 
 
  + REP #$20                                                   ;82E115|C220    |      ;
    LDA.W #$0000                                               ;82E117|A90000  |      ;
    JSL.L fGameEngine_LoadContinue                             ;82E11A|2245BA83|83BA45;
    REP #$30                                                   ;82E11E|C230    |      ;
    CPX.W #$0000                                               ;82E120|E00000  |      ;
    BEQ +                                                      ;82E123|F002    |82E127;
    BRA .label2                                                ;82E125|800A    |82E131;
 
 
  + REP #$30                                                   ;82E127|C230    |      ;
    LDA.W #$0000                                               ;82E129|A90000  |      ;
    STA.W strcBGScrool.BG1HorOffs                              ;82E12C|8D3C01  |00013C;
    BRA .label2                                                ;82E12F|8000    |82E131;
 
 
.label2:
    REP #$20                                                   ;82E131|C220    |      ;
    SEP #$10                                                   ;82E133|E210    |      ;
    if !REGION_DE
    LDA.W #$F497                                           ;82E290|A997F4  |      ;
    else
    LDA.W #$F2E2                                               ;82E135|A9E2F2  |      ;
    endif
    STA.B ptrTemp0x72                                          ;82E138|8572    |000072;
    SEP #$20                                                   ;82E13A|E220    |      ;
    LDA.B #$82                                                 ;82E13C|A982    |      ;
    STA.B ptrTemp0x72+2                                        ;82E13E|8574    |000074;
    SEP #$20                                                   ;82E140|E220    |      ;
    LDA.B #$06                                                 ;82E142|A906    |      ;
    LDX.B #$04                                                 ;82E144|A204    |      ;
    LDY.B #$00                                                 ;82E146|A000    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;82E148|22488E80|808E48;
    REP #$20                                                   ;82E14C|C220    |      ;
    SEP #$10                                                   ;82E14E|E210    |      ;
    if !REGION_DE
    LDA.W #$F4AE                                           ;82E2AB|A9AEF4  |      ;
    else
    LDA.W #$F2F9                                               ;82E150|A9F9F2  |      ;
    endif
    STA.B ptrTemp0x72                                          ;82E153|8572    |000072;
    SEP #$20                                                   ;82E155|E220    |      ;
    LDA.B #$82                                                 ;82E157|A982    |      ;
    STA.B ptrTemp0x72+2                                        ;82E159|8574    |000074;
    SEP #$20                                                   ;82E15B|E220    |      ;
    LDA.B #$06                                                 ;82E15D|A906    |      ;
    LDX.B #$05                                                 ;82E15F|A205    |      ;
    LDY.B #$01                                                 ;82E161|A001    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;82E163|22488E80|808E48;
    JML.L fMainMenu_NewGameSlotSelect_FrameTail                                      ;82E167|5CBDE182|82E1BD;
 
 
fMainMenu_NewGameSlotSelect_MoveCursorSlot2:
    REP #$20                                                   ;82E16B|C220    |      ;
    LDA.W #$0001                                               ;82E16D|A90100  |      ;
    JSL.L fGameEngine_LoadContinue                             ;82E170|2245BA83|83BA45;
    REP #$30                                                   ;82E174|C230    |      ;
    CPX.W #$0000                                               ;82E176|E00000  |      ;
    BEQ +                                                      ;82E179|F002    |82E17D;
    BRA .label1                                                ;82E17B|800A    |82E187;
 
 
  + REP #$30                                                   ;82E17D|C230    |      ;
    LDA.W #$0000                                               ;82E17F|A90000  |      ;
    STA.W strcBGScrool.BG1HorOffs                              ;82E182|8D3C01  |00013C;
    BRA .label1                                                ;82E185|8000    |82E187;
 
 
.label1:
    REP #$20                                                   ;82E187|C220    |      ;
    SEP #$10                                                   ;82E189|E210    |      ;
    if !REGION_DE
    LDA.W #$F4AE                                           ;82E2E6|A9AEF4  |      ;
    else
    LDA.W #$F2F9                                               ;82E18B|A9F9F2  |      ;
    endif
    STA.B ptrTemp0x72                                          ;82E18E|8572    |000072;
    SEP #$20                                                   ;82E190|E220    |      ;
    LDA.B #$82                                                 ;82E192|A982    |      ;
    STA.B ptrTemp0x72+2                                        ;82E194|8574    |000074;
    SEP #$20                                                   ;82E196|E220    |      ;
    LDA.B #$06                                                 ;82E198|A906    |      ;
    LDX.B #$04                                                 ;82E19A|A204    |      ;
    LDY.B #$00                                                 ;82E19C|A000    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;82E19E|22488E80|808E48;
    REP #$20                                                   ;82E1A2|C220    |      ;
    SEP #$10                                                   ;82E1A4|E210    |      ;
    if !REGION_DE
    LDA.W #$F497                                           ;82E301|A997F4  |      ;
    else
    LDA.W #$F2E2                                               ;82E1A6|A9E2F2  |      ;
    endif
    STA.B ptrTemp0x72                                          ;82E1A9|8572    |000072;
    SEP #$20                                                   ;82E1AB|E220    |      ;
    LDA.B #$82                                                 ;82E1AD|A982    |      ;
    STA.B ptrTemp0x72+2                                        ;82E1AF|8574    |000074;
    SEP #$20                                                   ;82E1B1|E220    |      ;
    LDA.B #$06                                                 ;82E1B3|A906    |      ;
    LDX.B #$05                                                 ;82E1B5|A205    |      ;
    LDY.B #$01                                                 ;82E1B7|A001    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;82E1B9|22488E80|808E48;
 
fMainMenu_NewGameSlotSelect_FrameTail:
    SEP #$20                                                   ;82E1BD|E220    |      ;
    LDA.B strcVariables.u8Unk96                                ;82E1BF|A596    |000096;
    CMP.B #$01                                                 ;82E1C1|C901    |      ;
    BNE .label1                                                ;82E1C3|D00C    |82E1D1;
    STZ.B strcVariables.u8Unk96                                ;82E1C5|6496    |000096;
    REP #$20                                                   ;82E1C7|C220    |      ;
    INC.W strcBGScrool.BG2HorOffs                              ;82E1C9|EE4001  |000140;
    DEC.W strcBGScrool.BG2VerOffs                              ;82E1CC|CE4201  |000142;
    BRA +                                                      ;82E1CF|8004    |82E1D5;
 
 
.label1:
    SEP #$20                                                   ;82E1D1|E220    |      ;
    INC.B strcVariables.u8Unk96                                ;82E1D3|E696    |000096;
 
  + SEP #$20                                                   ;82E1D5|E220    |      ;
    LDA.B strcVariables.n8Temp3                                ;82E1D7|A594    |000094;
    CMP.B #$01                                                 ;82E1D9|C901    |      ;
    BNE +                                                      ;82E1DB|D004    |82E1E1;
    JML.L fMainMenu_ReturnToTitleFromSlotSelect                                      ;82E1DD|5CC5DE82|82DEC5;
 
 
  + CMP.B #$02                                                 ;82E1E1|C902    |      ;
    BNE +                                                      ;82E1E3|D004    |82E1E9;
    JML.L fStartNewGame                                        ;82E1E5|5CF9E782|82E7F9;
 
 
  + SEP #$20                                                   ;82E1E9|E220    |      ;
    STZ.B $00                                                  ;82E1EB|6400    |000000;
    JML.L fMainMenu_NewGameSlotSelect_WaitFrame                                      ;82E1ED|5CEBE082|82E0EB;
 
 
fMainMenu_StateLoadGameSlotSelect:
    SEP #$20                                                   ;82E1F1|E220    |      ;
    LDA.B #$5E                                                 ;82E1F3|A95E    |      ;
    STA.B strcMap.loadAreaId                                   ;82E1F5|8522    |000022;
    JSL.L fAudioEngine_MapMusicHandler                         ;82E1F7|22DE9580|8095DE;
    JSL.L fAudio_FadeOutOnTrackChangeSlow                                 ;82E1FB|22018483|838401;
    SEP #$20                                                   ;82E1FF|E220    |      ;
    LDA.B #$0F                                                 ;82E201|A90F    |      ;
    STA.B strcVariables.n8Temp1                                ;82E203|8592    |000092;
    LDA.B #$03                                                 ;82E205|A903    |      ;
    STA.B strcVariables.n8Temp2                                ;82E207|8593    |000093;
    LDA.B #$01                                                 ;82E209|A901    |      ;
    STA.B strcVariables.n8Temp3                                ;82E20B|8594    |000094;
    JSL.L fCore_ScreenFadeout                                  ;82E20D|220A8880|80880A;
    JSL.L fCore_SetForceBlank                                  ;82E211|220F8E80|808E0F;
    JSL.L fCore_ZeroVRAM                                       ;82E215|22468880|808846;
    SEP #$20                                                   ;82E219|E220    |      ;
    LDA.B #$04                                                 ;82E21B|A904    |      ;
    JSL.L fCore_ManageGraphicsPresets                          ;82E21D|22598C80|808C59;
    JSL.L fTileMap_MapChangeHandler                            ;82E221|22C6A780|80A7C6;
    REP #$20                                                   ;82E225|C220    |      ;
    LDA.W #$006F                                               ;82E227|A96F00  |      ;
    JSL.L fPalette_LoadFirstHalf                               ;82E22A|22CF9180|8091CF;
    SEP #$20                                                   ;82E22E|E220    |      ;
    REP #$10                                                   ;82E230|C210    |      ;
    LDA.B #$00                                                 ;82E232|A900    |      ;
    STA.B strcSystem.arrayIndex                                ;82E234|8527    |000027;
    LDA.B #$22                                                 ;82E236|A922    |      ;
    STA.B strcSystem.destinationRegister                       ;82E238|8529    |000029;
    REP #$20                                                   ;82E23A|C220    |      ;
    LDY.W #$0200                                               ;82E23C|A00002  |      ;
    LDX.W #$0000                                               ;82E23F|A20000  |      ;
    LDA.W #$8C00                                               ;82E242|A9008C  |      ;
    STA.B ptrTemp0x72                                          ;82E245|8572    |000072;
    SEP #$20                                                   ;82E247|E220    |      ;
    LDA.B #$A9                                                 ;82E249|A9A9    |      ;
    STA.B ptrTemp0x72+2                                        ;82E24B|8574    |000074;
    JSL.L fCore_PrepareTransfer                                ;82E24D|22338A80|808A33;
    JSL.L fCore_StartPreparedTransfer                          ;82E251|22B28A80|808AB2;
    JSR.W fMainMenu_DrawSaveSlotFrames                                      ;82E255|2042E7  |82E742;
    REP #$30                                                   ;82E258|C230    |      ;
    LDA.W #$0000                                               ;82E25A|A90000  |      ;
    LDY.W #$0001                                               ;82E25D|A00100  |      ;
    JSR.W fMainMenu_DrawSaveSlotInfo                                      ;82E260|2005E4  |82E405;
    REP #$30                                                   ;82E263|C230    |      ;
    LDA.W #$0001                                               ;82E265|A90100  |      ;
    LDY.W #$0001                                               ;82E268|A00100  |      ;
    JSR.W fMainMenu_DrawSaveSlotInfo                                      ;82E26B|2005E4  |82E405;
    JSL.L fCore_Zero0x42Ptr                                    ;82E26E|22AB8F80|808FAB;
    SEP #$20                                                   ;82E272|E220    |      ;
    LDA.W $098E+!DE_RAM_SHIFT                              ;82E274|AD8E09  |00098E;
    BEQ +                                                      ;82E277|F004    |82E27D;
    JML.L .label1                                              ;82E279|5CB7E282|82E2B7;
 
 
  + REP #$20                                                   ;82E27D|C220    |      ;
    SEP #$10                                                   ;82E27F|E210    |      ;
    if !REGION_DE
    LDA.W #$F497                                           ;82E3DC|A997F4  |      ;
    else
    LDA.W #$F2E2                                               ;82E281|A9E2F2  |      ;
    endif
    STA.B ptrTemp0x72                                          ;82E284|8572    |000072;
    SEP #$20                                                   ;82E286|E220    |      ;
    LDA.B #$82                                                 ;82E288|A982    |      ;
    STA.B ptrTemp0x72+2                                        ;82E28A|8574    |000074;
    SEP #$20                                                   ;82E28C|E220    |      ;
    LDA.B #$06                                                 ;82E28E|A906    |      ;
    LDX.B #$04                                                 ;82E290|A204    |      ;
    LDY.B #$00                                                 ;82E292|A000    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;82E294|22488E80|808E48;
    REP #$20                                                   ;82E298|C220    |      ;
    SEP #$10                                                   ;82E29A|E210    |      ;
    if !REGION_DE
    LDA.W #$F4AE                                           ;82E3F7|A9AEF4  |      ;
    else
    LDA.W #$F2F9                                               ;82E29C|A9F9F2  |      ;
    endif
    STA.B ptrTemp0x72                                          ;82E29F|8572    |000072;
    SEP #$20                                                   ;82E2A1|E220    |      ;
    LDA.B #$82                                                 ;82E2A3|A982    |      ;
    STA.B ptrTemp0x72+2                                        ;82E2A5|8574    |000074;
    SEP #$20                                                   ;82E2A7|E220    |      ;
    LDA.B #$06                                                 ;82E2A9|A906    |      ;
    LDX.B #$05                                                 ;82E2AB|A205    |      ;
    LDY.B #$01                                                 ;82E2AD|A001    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;82E2AF|22488E80|808E48;
    JML.L .label2                                              ;82E2B3|5CEDE282|82E2ED;
 
 
.label1:
    REP #$20                                                   ;82E2B7|C220    |      ;
    SEP #$10                                                   ;82E2B9|E210    |      ;
    if !REGION_DE
    LDA.W #$F4AE                                           ;82E416|A9AEF4  |      ;
    else
    LDA.W #$F2F9                                               ;82E2BB|A9F9F2  |      ;
    endif
    STA.B ptrTemp0x72                                          ;82E2BE|8572    |000072;
    SEP #$20                                                   ;82E2C0|E220    |      ;
    LDA.B #$82                                                 ;82E2C2|A982    |      ;
    STA.B ptrTemp0x72+2                                        ;82E2C4|8574    |000074;
    SEP #$20                                                   ;82E2C6|E220    |      ;
    LDA.B #$06                                                 ;82E2C8|A906    |      ;
    LDX.B #$04                                                 ;82E2CA|A204    |      ;
    LDY.B #$00                                                 ;82E2CC|A000    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;82E2CE|22488E80|808E48;
    REP #$20                                                   ;82E2D2|C220    |      ;
    SEP #$10                                                   ;82E2D4|E210    |      ;
    if !REGION_DE
    LDA.W #$F497                                           ;82E431|A997F4  |      ;
    else
    LDA.W #$F2E2                                               ;82E2D6|A9E2F2  |      ;
    endif
    STA.B ptrTemp0x72                                          ;82E2D9|8572    |000072;
    SEP #$20                                                   ;82E2DB|E220    |      ;
    LDA.B #$82                                                 ;82E2DD|A982    |      ;
    STA.B ptrTemp0x72+2                                        ;82E2DF|8574    |000074;
    SEP #$20                                                   ;82E2E1|E220    |      ;
    LDA.B #$06                                                 ;82E2E3|A906    |      ;
    LDX.B #$05                                                 ;82E2E5|A205    |      ;
    LDY.B #$01                                                 ;82E2E7|A001    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;82E2E9|22488E80|808E48;
 
.label2:
    REP #$20                                                   ;82E2ED|C220    |      ;
    STZ.W strcBGScrool.BG1HorOffs                              ;82E2EF|9C3C01  |00013C;
    STZ.W strcBGScrool.BG1VerOffs                              ;82E2F2|9C3E01  |00013E;
    STZ.W strcBGScrool.BG2HorOffs                              ;82E2F5|9C4001  |000140;
    STZ.W strcBGScrool.BG2VerOffs                              ;82E2F8|9C4201  |000142;
    STZ.W strcBGScrool.BG3HorOffs                              ;82E2FB|9C4401  |000144;
    STZ.W strcBGScrool.BG3VerOffs                              ;82E2FE|9C4601  |000146;
    JSL.L fAudio_FadeOutOnTrackChangeFast                                 ;82E301|221F8483|83841F;
    JSL.L fAudio_LoadPendingTrack                                 ;82E305|22A48383|8383A4;
    JSL.L fAudio_StartPendingTrack                                 ;82E309|22808383|838380;
    SEP #$20                                                   ;82E30D|E220    |      ;
    LDA.W strcAudio.trackId                                    ;82E30F|AD1001  |000110;
    STA.W strcAudio.trackIdCopy                                ;82E312|8D1701  |000117;
    JSL.L fCore_ResetForceBlank                                ;82E315|221E8E80|808E1E;
    JSL.L fCore_WaitForNextNMI                                 ;82E319|22458680|808645;
    SEP #$20                                                   ;82E31D|E220    |      ;
    LDA.B #$03                                                 ;82E31F|A903    |      ;
    STA.B strcVariables.n8Temp1                                ;82E321|8592    |000092;
    LDA.B #$03                                                 ;82E323|A903    |      ;
    STA.B strcVariables.n8Temp2                                ;82E325|8593    |000093;
    LDA.B #$0F                                                 ;82E327|A90F    |      ;
    STA.B strcVariables.n8Temp3                                ;82E329|8594    |000094;
    JSL.L fCore_ScreenFadein                                   ;82E32B|22CE8780|8087CE;
    SEP #$20                                                   ;82E32F|E220    |      ;
    STZ.B strcVariables.n8Temp3                                ;82E331|6494    |000094;
    STZ.B strcVariables.u8Unk96                                ;82E333|6496    |000096;
    STZ.B strcVariables.u8Unk97                                ;82E335|6497    |000097;
 
fMainMenu_LoadGameSlotSelect_WaitFrame:
    SEP #$20                                                   ;82E337|E220    |      ;
    LDA.B $00                                                  ;82E339|A500    |000000;
    BEQ fMainMenu_LoadGameSlotSelect_WaitFrame                                        ;82E33B|F0FA    |82E337;
    REP #$20                                                   ;82E33D|C220    |      ;
    LDA.W #$1800                                               ;82E33F|A90018  |      ;
    STA.B $C7                                                  ;82E342|85C7    |0000C7;
    JSL.L fPalette_ProcessColorAnimSlots                                  ;82E344|22698E80|808E69;
    JSL.L fInput_Handler                                       ;82E348|2234C084|84C034;
    SEP #$20                                                   ;82E34C|E220    |      ;
    LDA.B strcVariables.u8Unk97                                ;82E34E|A597    |000097;
    BNE +                                                      ;82E350|D004    |82E356;
    JML.L fMainMenu_LoadGameSlotSelect_FrameTail                                      ;82E352|5CD1E382|82E3D1;
 
 
  + STZ.B strcVariables.u8Unk97                                ;82E356|6497    |000097;
    LDA.W $098E+!DE_RAM_SHIFT                              ;82E358|AD8E09  |00098E;
    BEQ +                                                      ;82E35B|F004    |82E361;
    JML.L fMainMenu_LoadGameSlotSelect_MoveCursorSlot2                                      ;82E35D|5C9BE382|82E39B;
 
 
  + REP #$20                                                   ;82E361|C220    |      ;
    SEP #$10                                                   ;82E363|E210    |      ;
    if !REGION_DE
    LDA.W #$F497                                           ;82E4C0|A997F4  |      ;
    else
    LDA.W #$F2E2                                               ;82E365|A9E2F2  |      ;
    endif
    STA.B ptrTemp0x72                                          ;82E368|8572    |000072;
    SEP #$20                                                   ;82E36A|E220    |      ;
    LDA.B #$82                                                 ;82E36C|A982    |      ;
    STA.B ptrTemp0x72+2                                        ;82E36E|8574    |000074;
    SEP #$20                                                   ;82E370|E220    |      ;
    LDA.B #$06                                                 ;82E372|A906    |      ;
    LDX.B #$04                                                 ;82E374|A204    |      ;
    LDY.B #$00                                                 ;82E376|A000    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;82E378|22488E80|808E48;
    REP #$20                                                   ;82E37C|C220    |      ;
    SEP #$10                                                   ;82E37E|E210    |      ;
    if !REGION_DE
    LDA.W #$F4AE                                           ;82E4DB|A9AEF4  |      ;
    else
    LDA.W #$F2F9                                               ;82E380|A9F9F2  |      ;
    endif
    STA.B ptrTemp0x72                                          ;82E383|8572    |000072;
    SEP #$20                                                   ;82E385|E220    |      ;
    LDA.B #$82                                                 ;82E387|A982    |      ;
    STA.B ptrTemp0x72+2                                        ;82E389|8574    |000074;
    SEP #$20                                                   ;82E38B|E220    |      ;
    LDA.B #$06                                                 ;82E38D|A906    |      ;
    LDX.B #$05                                                 ;82E38F|A205    |      ;
    LDY.B #$01                                                 ;82E391|A001    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;82E393|22488E80|808E48;
    JML.L fMainMenu_LoadGameSlotSelect_FrameTail                                      ;82E397|5CD1E382|82E3D1;
 
 
fMainMenu_LoadGameSlotSelect_MoveCursorSlot2:
    REP #$20                                                   ;82E39B|C220    |      ;
    SEP #$10                                                   ;82E39D|E210    |      ;
    if !REGION_DE
    LDA.W #$F4AE                                           ;82E4FA|A9AEF4  |      ;
    else
    LDA.W #$F2F9                                               ;82E39F|A9F9F2  |      ;
    endif
    STA.B ptrTemp0x72                                          ;82E3A2|8572    |000072;
    SEP #$20                                                   ;82E3A4|E220    |      ;
    LDA.B #$82                                                 ;82E3A6|A982    |      ;
    STA.B ptrTemp0x72+2                                        ;82E3A8|8574    |000074;
    SEP #$20                                                   ;82E3AA|E220    |      ;
    LDA.B #$06                                                 ;82E3AC|A906    |      ;
    LDX.B #$04                                                 ;82E3AE|A204    |      ;
    LDY.B #$00                                                 ;82E3B0|A000    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;82E3B2|22488E80|808E48;
    REP #$20                                                   ;82E3B6|C220    |      ;
    SEP #$10                                                   ;82E3B8|E210    |      ;
    if !REGION_DE
    LDA.W #$F497                                           ;82E515|A997F4  |      ;
    else
    LDA.W #$F2E2                                               ;82E3BA|A9E2F2  |      ;
    endif
    STA.B ptrTemp0x72                                          ;82E3BD|8572    |000072;
    SEP #$20                                                   ;82E3BF|E220    |      ;
    LDA.B #$82                                                 ;82E3C1|A982    |      ;
    STA.B ptrTemp0x72+2                                        ;82E3C3|8574    |000074;
    SEP #$20                                                   ;82E3C5|E220    |      ;
    LDA.B #$06                                                 ;82E3C7|A906    |      ;
    LDX.B #$05                                                 ;82E3C9|A205    |      ;
    LDY.B #$01                                                 ;82E3CB|A001    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;82E3CD|22488E80|808E48;
 
fMainMenu_LoadGameSlotSelect_FrameTail:
    SEP #$20                                                   ;82E3D1|E220    |      ;
    LDA.B strcVariables.u8Unk96                                ;82E3D3|A596    |000096;
    CMP.B #$01                                                 ;82E3D5|C901    |      ;
    BNE .label1                                                ;82E3D7|D00C    |82E3E5;
    STZ.B strcVariables.u8Unk96                                ;82E3D9|6496    |000096;
    REP #$20                                                   ;82E3DB|C220    |      ;
    INC.W strcBGScrool.BG2HorOffs                              ;82E3DD|EE4001  |000140;
    DEC.W strcBGScrool.BG2VerOffs                              ;82E3E0|CE4201  |000142;
    BRA +                                                      ;82E3E3|8004    |82E3E9;
 
 
.label1:
    SEP #$20                                                   ;82E3E5|E220    |      ;
    INC.B strcVariables.u8Unk96                                ;82E3E7|E696    |000096;
 
  + SEP #$20                                                   ;82E3E9|E220    |      ;
    LDA.B strcVariables.n8Temp3                                ;82E3EB|A594    |000094;
    CMP.B #$01                                                 ;82E3ED|C901    |      ;
    BNE +                                                      ;82E3EF|D004    |82E3F5;
    JML.L fMainMenu_ReturnToTitleFromSlotSelect                                      ;82E3F1|5CC5DE82|82DEC5;
 
 
  + CMP.B #$02                                                 ;82E3F5|C902    |      ;
    BNE +                                                      ;82E3F7|D004    |82E3FD;
    JML.L fLoadAndStartGame                                    ;82E3F9|5CE9E782|82E7E9;
 
 
  + SEP #$20                                                   ;82E3FD|E220    |      ;
    STZ.B $00                                                  ;82E3FF|6400    |000000;
    JML.L fMainMenu_LoadGameSlotSelect_WaitFrame                                      ;82E401|5C37E382|82E337;
 
 
fMainMenu_DrawSaveSlotInfo:
    REP #$30                                                   ;82E405|C230    |      ;
    PHA                                                        ;82E407|48      |      ;
    PHY                                                        ;82E408|5A      |      ;
    JSL.L fGameEngine_LoadContinue                             ;82E409|2245BA83|83BA45;
    REP #$30                                                   ;82E40D|C230    |      ;
    PLY                                                        ;82E40F|7A      |      ;
    PLA                                                        ;82E410|68      |      ;
    CPX.W #$0000                                               ;82E411|E00000  |      ;
    BNE +                                                      ;82E414|D004    |82E41A;
    JML.L fMainMenu_DrawEmptySaveSlot                                      ;82E416|5CE7E582|82E5E7;
 
 
  + ASL A                                                      ;82E41A|0A      |      ;
    ASL A                                                      ;82E41B|0A      |      ;
    ASL A                                                      ;82E41C|0A      |      ;
    TAX                                                        ;82E41D|AA      |      ;
    LDA.L aMainMenu_SlotInfoTextVramAddr,X                                    ;82E41E|BF78F282|82F278;
    PHX                                                        ;82E422|DA      |      ;
    STA.B strcVariables.n16Temp3                               ;82E423|8582    |000082;
    LDX.W #$0000                                               ;82E425|A20000  |      ;
 
  - REP #$20                                                   ;82E428|C220    |      ;
    PHX                                                        ;82E42A|DA      |      ;
    LDA.B strcVariables.n16Temp3                               ;82E42B|A582    |000082;
    STA.L strcDialogDisplay.dialogUnk185+$20000                ;82E42D|8F850180|800185;
    SEP #$20                                                   ;82E431|E220    |      ;
    LDA.B #$00                                                 ;82E433|A900    |      ;
    XBA                                                        ;82E435|EB      |      ;
    LDA.W strcNames.sPlayer,X                                  ;82E436|BD8108  |000881;
    LDX.W #$0000                                               ;82E439|A20000  |      ;
    JSL.L fDialog_TransferGlyph                                ;82E43C|22239883|839823;
    JSL.L fCore_StartTransfer                                  ;82E440|22F08A80|808AF0;
    REP #$30                                                   ;82E444|C230    |      ;
    LDA.B strcVariables.n16Temp3                               ;82E446|A582    |000082;
    CLC                                                        ;82E448|18      |      ;
    ADC.W #$0008                                               ;82E449|690800  |      ;
    STA.B strcVariables.n16Temp3                               ;82E44C|8582    |000082;
    PLX                                                        ;82E44E|FA      |      ;
    INX                                                        ;82E44F|E8      |      ;
    CPX.W #$0004                                               ;82E450|E00400  |      ;
    BNE -                                                      ;82E453|D0D3    |82E428;
    REP #$30                                                   ;82E455|C230    |      ;
    PLX                                                        ;82E457|FA      |      ;
    INX                                                        ;82E458|E8      |      ;
    INX                                                        ;82E459|E8      |      ;
    LDA.L aMainMenu_SlotInfoTextVramAddr,X                                    ;82E45A|BF78F282|82F278;
    PHX                                                        ;82E45E|DA      |      ;
    STA.L strcDialogDisplay.dialogUnk185+$20000                ;82E45F|8F850180|800185;
    SEP #$20                                                   ;82E463|E220    |      ;
    LDA.L nCurrentYearID                                       ;82E465|AF181F7F|7F1F18;
    INC A                                                      ;82E469|1A      |      ;
    STA.W strcDialogDisplay.dialogNumericVarSize               ;82E46A|8D9201  |000192;
    REP #$20                                                   ;82E46D|C220    |      ;
    STZ.W strcDialogDisplay.dialogNumericVarSize+1             ;82E46F|9C9301  |000193;
    SEP #$20                                                   ;82E472|E220    |      ;
    LDA.B #$00                                                 ;82E474|A900    |      ;
    STA.W strcDialogDisplay.dialogVarSize                      ;82E476|8D8C01  |00018C;
    LDA.W strcDialogDisplay.dialogFlags                        ;82E479|AD9B01  |00019B;
    AND.B #~!DFLAGS_NUMERICVAR                                                 
    STA.W strcDialogDisplay.dialogFlags                        ;82E47E|8D9B01  |00019B;
    JSL.L fDialog_DrawNumericVarDigit                               ;82E481|22A69783|8397A6;
    JSL.L fCore_StartTransfer                                  ;82E485|22F08A80|808AF0;
    REP #$30                                                   ;82E489|C230    |      ;
    if !REGION_DE
    ; (nothing in DE)
    else
    LDA.L strcDialogDisplay.dialogUnk185+$20000                ;82E48B|AF850180|800185;
    CLC                                                        ;82E48F|18      |      ;
    ADC.W #$0008                                               ;82E490|690800  |      ;
    STA.L strcDialogDisplay.dialogUnk185+$20000                ;82E493|8F850180|800185;
    REP #$20                                                   ;82E497|C220    |      ;
    LDA.W #$0000                                               ;82E499|A90000  |      ;
    SEP #$20                                                   ;82E49C|E220    |      ;
    LDA.L nCurrentYearID                                       ;82E49E|AF181F7F|7F1F18;
    REP #$20                                                   ;82E4A2|C220    |      ;
    ASL A                                                      ;82E4A4|0A      |      ;
    ASL A                                                      ;82E4A5|0A      |      ;
    TAX                                                        ;82E4A6|AA      |      ;
    LDA.L sYearOrdinal_82F298,X                                ;82E4A7|BF98F282|82F298;
    LDX.W #$0000                                               ;82E4AB|A20000  |      ;
    JSL.L fDialog_TransferGlyph                                ;82E4AE|22239883|839823;
    JSL.L fCore_StartTransfer                                  ;82E4B2|22F08A80|808AF0;
    REP #$30                                                   ;82E4B6|C230    |      ;
    LDA.L strcDialogDisplay.dialogUnk185+$20000                ;82E4B8|AF850180|800185;
    CLC                                                        ;82E4BC|18      |      ;
    ADC.W #$0008                                               ;82E4BD|690800  |      ;
    STA.L strcDialogDisplay.dialogUnk185+$20000                ;82E4C0|8F850180|800185;
    REP #$20                                                   ;82E4C4|C220    |      ;
    LDA.W #$0000                                               ;82E4C6|A90000  |      ;
    SEP #$20                                                   ;82E4C9|E220    |      ;
    LDA.L nCurrentYearID                                       ;82E4CB|AF181F7F|7F1F18;
    REP #$20                                                   ;82E4CF|C220    |      ;
    ASL A                                                      ;82E4D1|0A      |      ;
    ASL A                                                      ;82E4D2|0A      |      ;
    CLC                                                        ;82E4D3|18      |      ;
    ADC.W #$0002                                               ;82E4D4|690200  |      ;
    TAX                                                        ;82E4D7|AA      |      ;
    LDA.L sYearOrdinal_82F298,X                                ;82E4D8|BF98F282|82F298;
    LDX.W #$0000                                               ;82E4DC|A20000  |      ;
    JSL.L fDialog_TransferGlyph                                ;82E4DF|22239883|839823;
    JSL.L fCore_StartTransfer                                  ;82E4E3|22F08A80|808AF0;
    REP #$30                                                   ;82E4E7|C230    |      ;
    endif
    PLX                                                        ;82E4E9|FA      |      ;
    INX                                                        ;82E4EA|E8      |      ;
    INX                                                        ;82E4EB|E8      |      ;
    LDA.L aMainMenu_SlotInfoTextVramAddr,X                                    ;82E4EC|BF78F282|82F278;
    PHX                                                        ;82E4F0|DA      |      ;
    STA.L strcDialogDisplay.dialogUnk185+$20000                ;82E4F1|8F850180|800185;
    SEP #$20                                                   ;82E4F5|E220    |      ;
    LDA.L nCurrentDay                                          ;82E4F7|AF1B1F7F|7F1F1B;
    STA.W strcDialogDisplay.dialogNumericVarSize               ;82E4FB|8D9201  |000192;
    REP #$20                                                   ;82E4FE|C220    |      ;
    STZ.W strcDialogDisplay.dialogNumericVarSize+1             ;82E500|9C9301  |000193;
    SEP #$20                                                   ;82E503|E220    |      ;
    LDA.B #$01                                                 ;82E505|A901    |      ;
    STA.W strcDialogDisplay.dialogVarSize                      ;82E507|8D8C01  |00018C;
    LDA.W strcDialogDisplay.dialogFlags                        ;82E50A|AD9B01  |00019B;
    AND.B #~!DFLAGS_NUMERICVAR                                                 
    STA.W strcDialogDisplay.dialogFlags                        ;82E50F|8D9B01  |00019B;
    JSL.L fDialog_DrawNumericVarDigit                               ;82E512|22A69783|8397A6;
    JSL.L fCore_StartTransfer                                  ;82E516|22F08A80|808AF0;
    REP #$30                                                   ;82E51A|C230    |      ;
    PLX                                                        ;82E51C|FA      |      ;
    LDA.L aMainMenu_SlotInfoTextVramAddr,X                                    ;82E51D|BF78F282|82F278;
    PHX                                                        ;82E521|DA      |      ;
    CLC                                                        ;82E522|18      |      ;
    ADC.W #$0008                                               ;82E523|690800  |      ;
    STA.L strcDialogDisplay.dialogUnk185+$20000                ;82E526|8F850180|800185;
    SEP #$20                                                   ;82E52A|E220    |      ;
    LDA.B #$00                                                 ;82E52C|A900    |      ;
    STA.W strcDialogDisplay.dialogVarSize                      ;82E52E|8D8C01  |00018C;
    JSL.L fDialog_DrawNumericVarDigit                               ;82E531|22A69783|8397A6;
    JSL.L fCore_StartTransfer                                  ;82E535|22F08A80|808AF0;
    REP #$30                                                   ;82E539|C230    |      ;
    JSL.L fWriteSeasonWeekdayAndDayOrdinal                     ;82E53B|22D68982|8289D6;
    if !REGION_DE
    REP #$30                                               ;82E63C|C230    |      ;
    else
    REP #$20                                                   ;82E53F|C220    |      ;
    endif
    PLX                                                        ;82E541|FA      |      ;
    INX                                                        ;82E542|E8      |      ;
    INX                                                        ;82E543|E8      |      ;
    LDA.L aMainMenu_SlotInfoTextVramAddr,X                                    ;82E544|BF78F282|82F278;
    STA.L strcDialogDisplay.dialogUnk185+$20000                ;82E548|8F850180|800185;
    LDA.W strcNames.wSeason                                    ;82E54C|ADB308  |0008B3;
    LDX.W #$0000                                               ;82E54F|A20000  |      ;
    JSL.L fDialog_TransferGlyph                                ;82E552|22239883|839823;
    JSL.L fCore_StartTransfer                                  ;82E556|22F08A80|808AF0;
    REP #$30                                                   ;82E55A|C230    |      ;
    LDA.L strcDialogDisplay.dialogUnk185+$20000                ;82E55C|AF850180|800185;
    CLC                                                        ;82E560|18      |      ;
    ADC.W #$0008                                               ;82E561|690800  |      ;
    STA.L strcDialogDisplay.dialogUnk185+$20000                ;82E564|8F850180|800185;
    LDA.W strcNames.wSeason+2                                  ;82E568|ADB508  |0008B5;
    LDX.W #$0000                                               ;82E56B|A20000  |      ;
    JSL.L fDialog_TransferGlyph                                ;82E56E|22239883|839823;
    JSL.L fCore_StartTransfer                                  ;82E572|22F08A80|808AF0;
    REP #$30                                                   ;82E576|C230    |      ;
    LDA.L strcDialogDisplay.dialogUnk185+$20000                ;82E578|AF850180|800185;
    CLC                                                        ;82E57C|18      |      ;
    ADC.W #$0008                                               ;82E57D|690800  |      ;
    STA.L strcDialogDisplay.dialogUnk185+$20000                ;82E580|8F850180|800185;
    LDA.W strcNames.wSeason+4                                  ;82E584|ADB708  |0008B7;
    LDX.W #$0000                                               ;82E587|A20000  |      ;
    JSL.L fDialog_TransferGlyph                                ;82E58A|22239883|839823;
    JSL.L fCore_StartTransfer                                  ;82E58E|22F08A80|808AF0;
    REP #$30                                                   ;82E592|C230    |      ;
    LDA.L strcDialogDisplay.dialogUnk185+$20000                ;82E594|AF850180|800185;
    CLC                                                        ;82E598|18      |      ;
    ADC.W #$0008                                               ;82E599|690800  |      ;
    STA.L strcDialogDisplay.dialogUnk185+$20000                ;82E59C|8F850180|800185;
    LDA.W strcNames.wSeason+6                                  ;82E5A0|ADB908  |0008B9;
    LDX.W #$0000                                               ;82E5A3|A20000  |      ;
    JSL.L fDialog_TransferGlyph                                ;82E5A6|22239883|839823;
    JSL.L fCore_StartTransfer                                  ;82E5AA|22F08A80|808AF0;
    REP #$30                                                   ;82E5AE|C230    |      ;
    LDA.L strcDialogDisplay.dialogUnk185+$20000                ;82E5B0|AF850180|800185;
    CLC                                                        ;82E5B4|18      |      ;
    ADC.W #$0008                                               ;82E5B5|690800  |      ;
    STA.L strcDialogDisplay.dialogUnk185+$20000                ;82E5B8|8F850180|800185;
    LDA.W strcNames.wSeason+8                                  ;82E5BC|ADBB08  |0008BB;
    LDX.W #$0000                                               ;82E5BF|A20000  |      ;
    JSL.L fDialog_TransferGlyph                                ;82E5C2|22239883|839823;
    JSL.L fCore_StartTransfer                                  ;82E5C6|22F08A80|808AF0;
    REP #$30                                                   ;82E5CA|C230    |      ;
    LDA.L strcDialogDisplay.dialogUnk185+$20000                ;82E5CC|AF850180|800185;
    CLC                                                        ;82E5D0|18      |      ;
    ADC.W #$0008                                               ;82E5D1|690800  |      ;
    STA.L strcDialogDisplay.dialogUnk185+$20000                ;82E5D4|8F850180|800185;
    LDA.W strcNames.wSeason+10                                 ;82E5D8|ADBD08  |0008BD;
    LDX.W #$0000                                               ;82E5DB|A20000  |      ;
    if !REGION_DE
    JSL.L fDialog_TransferGlyph                            ;82E6DB|222F9883|83982F;
    JSL.L fCore_StartTransfer                              ;82E6DF|22F08A80|808AF0;
    REP #$30                                               ;82E6E3|C230    |      ;
    LDA.L $800185                                          ;82E6E5|AF850180|      ;
    CLC                                                    ;82E6E9|18      |      ;
    ADC.W #$0008                                           ;82E6EA|690800  |      ;
    STA.L $800185                                          ;82E6ED|8F850180|      ;
    LDA.W strcNames.wWeekday                               ;82E6F1|ADBF08  |      ;
    LDX.W #$0000                                           ;82E6F4|A20000  |      ;
    JSL.L fDialog_TransferGlyph                            ;82E6F7|222F9883|83982F;
    JSL.L fCore_StartTransfer                              ;82E6FB|22F08A80|808AF0;
    REP #$30                                               ;82E6FF|C230    |      ;
    LDA.L $800185                                          ;82E701|AF850180|      ;
    CLC                                                    ;82E705|18      |      ;
    ADC.W #$0008                                           ;82E706|690800  |      ;
    STA.L $800185                                          ;82E709|8F850180|      ;
    LDA.W strcNames.wWeekday+2                             ;82E70D|ADC108  |      ;
    LDX.W #$0000                                           ;82E710|A20000  |      ;
    JSL.L fDialog_TransferGlyph                            ;82E713|222F9883|83982F;
    else
    JSL.L fDialog_TransferGlyph                                ;82E5DE|22239883|839823;
    endif
    JSL.L fCore_StartTransfer                                  ;82E5E2|22F08A80|808AF0;
    RTS                                                        ;82E5E6|60      |      ; GIGAEND
 
 
fMainMenu_DrawEmptySaveSlot:
    REP #$30                                                   ;82E5E7|C230    |      ; A: nArg1, Y: nArg2
    ASL A                                                      ;82E5E9|0A      |      ;
    TAX                                                        ;82E5EA|AA      |      ;
    if !REGION_DE
    LDA.L $82E8BB,X                                        ;82E720|BFBBE882|      ;
    else
    LDA.L aSystemTransferArgument,X                            ;82E5EB|BF3EE782|82E73E; X = A * 2
    endif
    STA.B strcVariables.n16Temp2                               ;82E5EF|8580    |000080; $80 = nTableValue (0x10E8 / 0x1228)
    STZ.B strcVariables.n16Temp3                               ;82E5F1|6482    |000082; $82 = 0
    STY.B strcVariables.n16Temp4                               ;82E5F3|8484    |000084; $84 = nArg2
 
 -- REP #$30                                                   ;82E5F5|C230    |      ;
    LDA.B strcVariables.n16Temp2                               ;82E5F7|A580    |000080; A = nTableValue (0x10E8 / 0x1228)
    TAX                                                        ;82E5F9|AA      |      ; X = nTableValue
    LDY.W #$0024                                               ;82E5FA|A02400  |      ; Y = 0x0024
    STZ.B strcVariables.n16Temp1                               ;82E5FD|647E    |00007E; $7E = 0
    LDA.B strcVariables.n16Temp4                               ;82E5FF|A584    |000084; A = Arg2
    BEQ +                                                      ;82E601|F005    |82E608;
    if !REGION_DE
    LDA.W #$0090                                           ;82E738|A99000  |      ;
    else
    LDA.W #$006C                                               ;82E603|A96C00  |      ; A = 0x6C (default)
    endif
    STA.B strcVariables.n16Temp1                               ;82E606|857E    |00007E; $7E = 0x6C
 
  + REP #$30                                                   ;82E608|C230    |      ;
    LDA.W #$0000                                               ;82E60A|A90000  |      ; A = 0
 
  - REP #$20                                                   ;82E60D|C220    |      ;
    PHA                                                        ;82E60F|48      |      ; A -> stack1
    SEP #$20                                                   ;82E610|E220    |      ;
    REP #$10                                                   ;82E612|C210    |      ;
    LDA.B #$00                                                 ;82E614|A900    |      ; A = 0x00
    STA.B strcSystem.arrayIndex                                ;82E616|8527    |000027; $27 = 0x00
    LDA.B #$18                                                 ;82E618|A918    |      ;
    STA.B strcSystem.destinationRegister                       ;82E61A|8529    |000029; $29 = 0x18
    REP #$20                                                   ;82E61C|C220    |      ;
    if !REGION_DE
    LDA.W #$E79B                                           ;82E753|A99BE7  |      ;
    else
    LDA.W #$E666                                               ;82E61E|A966E6  |      ;
    endif
    CLC                                                        ;82E621|18      |      ;
    ADC.B strcVariables.n16Temp1                               ;82E622|657E    |00007E; A = 0xE666 / 0xE666 + 0x6C
    STA.B ptrTemp0x72                                          ;82E624|8572    |000072;
    SEP #$20                                                   ;82E626|E220    |      ;
    LDA.B #$82                                                 ;82E628|A982    |      ;
    STA.B ptrTemp0x72+2                                        ;82E62A|8574    |000074; 82E666/82E6D2 -> $72
    LDA.B #$80                                                 ;82E62C|A980    |      ; A = nTableValue
    PHY                                                        ;82E62E|5A      |      ; Y -> stack2
    PHX                                                        ;82E62F|DA      |      ; nTableValue -> stack3
    JSL.L fCore_PrepareTransfer                                ;82E630|22338A80|808A33;
    JSL.L fCore_StartPreparedTransfer                          ;82E634|22B28A80|808AB2;
    REP #$30                                                   ;82E638|C230    |      ;
    PLX                                                        ;82E63A|FA      |      ; X = nTableValue
    PLY                                                        ;82E63B|7A      |      ; Y = stack2
    TXA                                                        ;82E63C|8A      |      ; A = nTableValue
    CLC                                                        ;82E63D|18      |      ;
    ADC.W #$0020                                               ;82E63E|692000  |      ;
    TAX                                                        ;82E641|AA      |      ; X = nTableValue + 0x20
    LDA.B strcVariables.n16Temp1                               ;82E642|A57E    |00007E; A = 0x00 / 0x6C
    CLC                                                        ;82E644|18      |      ;
    ADC.W #$0024                                               ;82E645|692400  |      ; A = 0x24 / 0x90
    STA.B strcVariables.n16Temp1                               ;82E648|857E    |00007E; $7E = 0x24 / 0x90
    PLA                                                        ;82E64A|68      |      ; A = 0
    INC A                                                      ;82E64B|1A      |      ; A++
    if !REGION_DE
    CMP.W #$0004                                           ;82E781|C90400  |      ;
    else
    CMP.W #$0003                                               ;82E64C|C90300  |      ;
    endif
    BNE -                                                      ;82E64F|D0BC    |82E60D;
    REP #$20                                                   ;82E651|C220    |      ;
    LDA.B strcVariables.n16Temp2                               ;82E653|A580    |000080;
    CLC                                                        ;82E655|18      |      ;
    ADC.W #$0400                                               ;82E656|690004  |      ;
    STA.B strcVariables.n16Temp2                               ;82E659|8580    |000080;
    LDA.B strcVariables.n16Temp3                               ;82E65B|A582    |000082;
    INC A                                                      ;82E65D|1A      |      ;
    STA.B strcVariables.n16Temp3                               ;82E65E|8582    |000082;
    CMP.W #$0002                                               ;82E660|C90200  |      ;
    BNE --                                                     ;82E663|D090    |82E5F5;
    RTS                                                        ;82E665|60      |      ;
