; Bank $82 module "interaction_data" - starts at $82CFB4
 
    incsrc "../../../build/gen/blocks/interaction_items.asm"
 
fMainMenu_StartHowToPlayDemo:
    SEP #$20                                                   ;82D1C0|E220    |      ; GIGASTART
    REP #$10                                                   ;82D1C2|C210    |      ;
    LDA.B #$0F                                                 ;82D1C4|A90F    |      ;
    STA.B strcVariables.n8Temp1                                ;82D1C6|8592    |000092;
    LDA.B #$03                                                 ;82D1C8|A903    |      ;
    STA.B strcVariables.n8Temp2                                ;82D1CA|8593    |000093;
    LDA.B #$01                                                 ;82D1CC|A901    |      ;
    STA.B strcVariables.n8Temp3                                ;82D1CE|8594    |000094;
    JSL.L fCore_ScreenFadeout                                  ;82D1D0|220A8880|80880A;
    SEP #$20                                                   ;82D1D4|E220    |      ;
    LDA.B #$06                                                 ;82D1D6|A906    |      ;
    STA.L nCurrentTimeID                                       ;82D1D8|8F1C1F7F|7F1F1C;
    LDA.B #$00                                                 ;82D1DC|A900    |      ;
    STA.L nInGameHourCounter                                   ;82D1DE|8F1D1F7F|7F1F1D;
    LDA.B #$00                                                 ;82D1E2|A900    |      ;
    STA.L nInGameMinuteCounter                                 ;82D1E4|8F1E1F7F|7F1F1E;
    LDA.B #$01                                                 ;82D1E8|A901    |      ;
    STA.B strcVariables.n8Temp4                                ;82D1EA|8595    |000095;
    STZ.B strcVariables.n8Temp3                                ;82D1EC|6494    |000094;
    REP #$20                                                   ;82D1EE|C220    |      ;
    LDA.W #$0000                                               ;82D1F0|A90000  |      ;
    STA.L strcFlags.daily1                                     ;82D1F3|8F5A1F7F|7F1F5A;
    LDA.W #$0000                                               ;82D1F7|A90000  |      ;
    STA.L strcFlags.daily2                                     ;82D1FA|8F5C1F7F|7F1F5C;
    LDA.W #$0000                                               ;82D1FE|A90000  |      ;
    STA.L strcFlags.daily3                                     ;82D201|8F5E1F7F|7F1F5E;
    LDA.W #$0000                                               ;82D205|A90000  |      ;
    STA.L strcFlags.daily4                                     ;82D208|8F601F7F|7F1F60;
    LDA.W #$0000                                               ;82D20C|A90000  |      ;
    STA.L strcFlags.unknown1                                   ;82D20F|8F741F7F|7F1F74;
    STA.L strcFlags.unknown2                                   ;82D213|8F761F7F|7F1F76;
    STA.L strcFlags.unknown3                                   ;82D217|8F781F7F|7F1F78;
    LDA.W #$0108                                               ;82D21B|A90801  |      ;
    STA.L strcFlags.daily4                                     ;82D21E|8F601F7F|7F1F60;
    REP #$20                                                   ;82D222|C220    |      ;
    LDA.W #$0000                                               ;82D224|A90000  |      ;
    STA.L strcFlags.event1                                     ;82D227|8F641F7F|7F1F64;
    LDA.W #$0000                                               ;82D22B|A90000  |      ;
    STA.L strcFlags.event2                                     ;82D22E|8F661F7F|7F1F66;
    LDA.W #$0000                                               ;82D232|A90000  |      ;
    STA.L strcFlags.event3                                     ;82D235|8F681F7F|7F1F68;
    LDA.W #$0000                                               ;82D239|A90000  |      ;
    STA.L strcFlags.event4                                     ;82D23C|8F6A1F7F|7F1F6A;
    LDA.W #$0000                                               ;82D240|A90000  |      ;
    STA.L strcFlags.event5                                     ;82D243|8F6C1F7F|7F1F6C;
    LDA.W #$0000                                               ;82D247|A90000  |      ;
    STA.L strcFlags.event6                                     ;82D24A|8F6E1F7F|7F1F6E;
    LDA.W #$0000                                               ;82D24E|A90000  |      ;
    STA.L strcFlags.event7                                     ;82D251|8F701F7F|7F1F70;
    LDA.W #$0000                                               ;82D255|A90000  |      ;
    STA.L strcFlags.event8                                     ;82D258|8F721F7F|7F1F72;
    SEP #$20                                                   ;82D25C|E220    |      ;
    LDA.B #$00                                                 ;82D25E|A900    |      ;
    STA.L nIntroHowToPlayIndex2                                ;82D260|8F491F7F|7F1F49;
    SEP #$20                                                   ;82D264|E220    |      ;
    LDA.B #$8F                                                 ;82D266|A98F    |      ;
    STA.L strcShedItems.row1                                   ;82D268|8F001F7F|7F1F00;
    LDA.B #$88                                                 ;82D26C|A988    |      ;
    STA.L strcShedItems.row2                                   ;82D26E|8F011F7F|7F1F01;
    LDA.B #$00                                                 ;82D272|A900    |      ;
    STA.L strcShedItems.row3                                   ;82D274|8F021F7F|7F1F02;
    LDA.B #$00                                                 ;82D278|A900    |      ;
    STA.L strcShedItems.row4                                   ;82D27A|8F031F7F|7F1F03;
    STZ.W strcPlayerData.toolEquipped                          ;82D27E|9C2109  |000921;
    STZ.W strcPlayerData.toolSecond                            ;82D281|9C2309  |000923;
    LDA.B #$01                                                 ;82D284|A901    |      ;
    STA.W strcPlayerData.leftGrassSeeds                        ;82D286|8D2709  |000927;
    STA.W strcPlayerData.leftTurnipSeeds                       ;82D289|8D2B09  |00092B;
    STA.W strcPlayerData.leftCornSeeds                         ;82D28C|8D2809  |000928;
    STA.W strcPlayerData.leftTomatoSeeds                       ;82D28F|8D2909  |000929;
    REP #$20                                                   ;82D292|C220    |      ;
    STZ.W strcObjectData.exist                                 ;82D294|9C1509  |000915;
    STZ.B strcPlayer.flags                                     ;82D297|64D2    |0000D2;
    STZ.B strcPlayer.action                                    ;82D299|64D4    |0000D4;
    SEP #$20                                                   ;82D29B|E220    |      ;
    %SetPlayerFlag(!PFLAGS_ACTIVE)
    %SetPlayerAction(!PACTION_NONE)
    %SetPlayerDirection(!PDIR_DOWN)
    %SetObjectDirection(!PDIR_DOWN)
    REP #$30                                                   ;82D2BC|C230    |      ;
    LDA.W #$0000                                               ;82D2BE|A90000  |      ;
    STA.W strcObjectData.spriteIdx                             ;82D2C1|8D0109  |000901;
    SEP #$20                                                   ;82D2C4|E220    |      ;
    STZ.W nTimeState                                           ;82D2C6|9C7309  |000973;
    LDA.B #$00                                                 ;82D2C9|A900    |      ;
    STA.L nCurrentSeasonID                                     ;82D2CB|8F191F7F|7F1F19;
    SEP #$20                                                   ;82D2CF|E220    |      ;
    STZ.W strcPlayerData.carryItemId                           ;82D2D1|9C1D09  |00091D;
    %UnsetPlayerFlag(!PFLAGS_HOLDINGITEM)
    REP #$30                                                   ;82D2E0|C230    |      ;
    STZ.W strcPlayerData.placedCowFeedFlags                    ;82D2E2|9C3209  |000932;
    STZ.W strcPlayerData.placedChickenFeedFlags                ;82D2E5|9C3409  |000934;
    %UnsetFlag(daily2, $0004)
    JSL.L fCore_ZeroVRAM                                       ;82D2F3|22468880|808846;
    JSL.L fCore_ZeroCGRAM                                      ;82D2F7|22808980|808980;
    JSL.L fCore_Zero0x42Ptr                                    ;82D2FB|22AB8F80|808FAB;
    JSL.L fObject_InitTileCache                                  ;82D2FF|22D78E85|858ED7;
    JSL.L fObject_ClearGameObject                              ;82D303|220F8285|85820F;
    JSL.L fObjectSlots_ClearAll                                   ;82D307|22C7A481|81A4C7;
    JSL.L fAI_ZeroCCPtr                                        ;82D30B|22008084|848000;
    JSL.L fObjectMap_LoadDefaultFarm                           ;82D30F|225AA682|82A65A;
    REP #$20                                                   ;82D313|C220    |      ;
    LDA.W #$0100                                               ;82D315|A90001  |      ;
    STA.W strcBGScrool.BG3VerOffs                              ;82D318|8D4601  |000146;
    REP #$30                                                   ;82D31B|C230    |      ;
    %AIExecute($0000, $0047, $0000)
    JSL.L fAI_HowToPlaySetup                                   ;82D32A|226F8184|84816F;
    SEP #$20                                                   ;82D32E|E220    |      ;
    LDA.W nDestinationAreaId                                   ;82D330|AD8B09  |00098B;
    STA.B strcMap.loadAreaId                                   ;82D333|8522    |000022;
    JSL.L fAudioEngine_MapMusicHandler                         ;82D335|22DE9580|8095DE;
    SEP #$20                                                   ;82D339|E220    |      ;
    LDA.W nDestinationAreaId                                   ;82D33B|AD8B09  |00098B;
    JSL.L fMap_SetupArea                                       ;82D33E|222C9780|80972C;
    REP #$30                                                   ;82D342|C230    |      ;
    LDY.W #$0000                                               ;82D344|A00000  |      ;
 
  - REP #$20                                                   ;82D347|C220    |      ;
    STZ.B strcVariables.n16Unk90                               ;82D349|6490    |000090;
    SEP #$20                                                   ;82D34B|E220    |      ;
    LDA.B $00                                                  ;82D34D|A500    |000000;
    BEQ -                                                      ;82D34F|F0F6    |82D347;
    REP #$20                                                   ;82D351|C220    |      ;
    LDA.W #$1800                                               ;82D353|A90018  |      ;
    STA.B $C7                                                  ;82D356|85C7    |0000C7;
    JSL.L fAudioEngine_MapChangeHandler                        ;82D358|22719680|809671;
    JSL.L fMapChangeHandler_809A64                             ;82D35C|22649A80|809A64;
    JSL.L fGame_TimeHandler                                    ;82D360|22008082|828000;
    JSL.L fDialog_IterateText                                  ;82D364|221C9583|83951C;
    JSL.L fPallete_ChangeHandler                               ;82D368|220C9080|80900C;
    JSL.L fPalette_ProcessColorAnimSlots                                  ;82D36C|22698E80|808E69;
    JSL.L fInput_Handler                                       ;82D370|2234C084|84C034;
    JSL.L fObjectSlots_UpdateAll                                      ;82D374|2283A381|81A383;
    JSL.L fPlayer_UpdateHandler                      ;82D378|22B7BF81|81BFB7;
    JSL.L fGraphics_MapScrool                                  ;82D37C|22B39580|8095B3;
    JSL.L fAI_HowToPlaySetup                                   ;82D380|226F8184|84816F;
    JSL.L fTileScript_Update                                    ;82D384|2200A681|81A600;
    JSL.L fObject_UpdateAllAnimations                                ;82D388|22C78285|8582C7;
    JSL.L fObject_ProcessTileLoadQueue                                      ;82D38C|22B28C85|858CB2;
    JSL.L fObject_RenderAll                                      ;82D390|22E08385|8583E0;
    REP #$20                                                   ;82D394|C220    |      ;
    %CheckFlag(daily2, $0004)
    BNE +                                                      ;82D39D|D007    |82D3A6;
    SEP #$20                                                   ;82D39F|E220    |      ;
    STZ.B $00                                                  ;82D3A1|6400    |000000;
    if !REGION_EUDE
    JMP.W L_82D347
    elseif !REGION_JP
    JMP.W L_82D347
    else
    JMP.W $D347                                                ;82D3A3|4C47D3  |82D347;
    endif
 
 
  + REP #$30                                                   ;82D3A6|C230    |      ;
    LDX.W #$0000                                               ;82D3A8|A20000  |      ;
 
  - SEP #$20                                                   ;82D3AB|E220    |      ;
    LDA.B #$00                                                 ;82D3AD|A900    |      ;
    STA.L strcChickenData,X                                    ;82D3AF|9F86C27E|7EC286;
    INX                                                        ;82D3B3|E8      |      ;
    CPX.W #$0008                                               ;82D3B4|E00800  |      ;
    BNE -                                                      ;82D3B7|D0F2    |82D3AB;
    SEP #$20                                                   ;82D3B9|E220    |      ;
    LDA.B #$09                                                 ;82D3BB|A909    |      ;
    STA.B strcVariables.n8Temp4                                ;82D3BD|8595    |000095;
    REP #$20                                                   ;82D3BF|C220    |      ;
    STZ.B strcVariables.n16Unk90                               ;82D3C1|6490    |000090;
    JML.L fMainMenu_EndFrame                                      ;82D3C3|5C71D882|82D871;
