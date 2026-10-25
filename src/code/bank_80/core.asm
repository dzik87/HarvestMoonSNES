 
    ORG $808000
 
 
fCore_GameStart:
    REP #$30                                                   ;808000|C230    |      ;
    SEP #$20                                                   ;808002|E220    |      ;
    LDA.B #!AREA_HOUSE1                                                 
    STA.B strcMap.loadAreaId                                   ;808006|8522    |000022;
    JSL.L fAudioEngine_MapMusicHandler                         ;808008|22DE9580|8095DE;
    JSL.L fAudio_FadeOutOnTrackChangeSlow                                 ;80800C|22018483|838401;
    SEP #$20                                                   ;808010|E220    |      ;
    LDA.B #$0F                                                 ;808012|A90F    |      ;
    STA.B strcVariables.n8Temp1                                ;808014|8592    |000092;
    LDA.B #$03                                                 ;808016|A903    |      ;
    STA.B strcVariables.n8Temp2                                ;808018|8593    |000093;
    LDA.B #$01                                                 ;80801A|A901    |      ;
    STA.B strcVariables.n8Temp3                                ;80801C|8594    |000094;
    JSL.L fCore_ScreenFadeout                                  ;80801E|220A8880|80880A;
    JSL.L fCore_SetForceBlank                                  ;808022|220F8E80|808E0F;
    JSL.L fCore_ZeroVRAM                                       ;808026|22468880|808846;
    JSL.L fCore_ZeroCGRAM                                      ;80802A|22808980|808980;
    JSL.L fGameEngine_FirstNight                               ;80802E|22F0AB83|83ABF0;
    JSL.L fAudioEngine_MapMusicHandler                         ;808032|22DE9580|8095DE;
    REP #$20                                                   ;808036|C220    |      ;
    LDA.W #$0100                                               ;808038|A90001  |      ;
    STA.W strcBGScrool.BG3VerOffs                              ;80803B|8D4601  |000146;
    SEP #$20                                                   ;80803E|E220    |      ;
    LDA.B #$01                                                 ;808040|A901    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;808042|8D9A01  |00019A;
    REP #$30                                                   ;808045|C230    |      ;
    LDA.W #$0088                                               ;808047|A98800  |      ;
    STA.W strcDialogDisplay.mapDestX                           ;80804A|8D7D01  |00017D;
    LDA.W #$0078                                               ;80804D|A97800  |      ;
    STA.W strcDialogDisplay.mapDestY                           ;808050|8D7F01  |00017F;
    SEP #$20                                                   ;808053|E220    |      ;
    LDA.B #$15                                                 ;808055|A915    |      ;
    STA.W nDestinationAreaId                                   ;808057|8D8B09  |00098B;
    JSL.L fCore_FindBestLove                                   ;80805A|22C68E82|828EC6;
    JSL.L fMap_ResetAndLoadDestinationArea                                      ;80805E|22D39680|8096D3;
    REP #$20                                                   ;808062|C220    |      ;
    %CheckFlag(event3, $0001)
    BEQ fCore_MainLoop                                         ;80806B|F016    |808083;
    SEP #$20                                                   ;80806D|E220    |      ;
    LDA.B #$03                                                 ;80806F|A903    |      ;
    JSL.L fCore_GetRandomNumber                                ;808071|22F98980|8089F9;
    SEP #$20                                                   ;808075|E220    |      ;
    STA.W strcPlayerData.eatFood                               ;808077|8D2409  |000924;
    %SetPlayerFlag(!PFLAGS_EATINGMEAL)
 
fCore_MainLoop:
    SEP #$20                                                   ;808083|E220    |      ;
    LDA.B $00                                                  ;808085|A500    |000000;
    BEQ fCore_MainLoop                                         ;808087|F0FA    |808083;
    REP #$20                                                   ;808089|C220    |      ;
    LDA.W #$1800                                               ;80808B|A90018  |      ;
    STA.B $C7                                                  ;80808E|85C7    |0000C7;
    LDA.W strcDialogDisplay.mapFlags                           ;808090|AD9601  |000196;
    AND.W #!AFLAGS_NAMEINPUTREQUEST                                               
    BEQ +                                                      ;808096|F003    |80809B;
    JMP.W .continue                                            ;808098|4CDE80  |8080DE;
 
 
  + JSL.L fAudioEngine_MapChangeHandler                        ;80809B|22719680|809671;
    JSL.L fMapChangeHandler_809A64                             ;80809F|22649A80|809A64;
    JSL.L fGame_TimeHandler                                    ;8080A3|22008082|828000;
    JSL.L fDialog_IterateText                                  ;8080A7|221C9583|83951C;
    JSL.L fPallete_ChangeHandler                               ;8080AB|220C9080|80900C;
    JSL.L fPalette_ProcessColorAnimSlots                                  ;8080AF|22698E80|808E69;
    JSL.L fInput_Handler                                       ;8080B3|2234C084|84C034;
    JSL.L fObjectSlots_UpdateAll                                      ;8080B7|2283A381|81A383;
    JSL.L fPlayer_UpdateHandler                      ;8080BB|22B7BF81|81BFB7;
    JSL.L fGraphics_MapScrool                                  ;8080BF|22B39580|8095B3;
    JSL.L fAI_HowToPlaySetup                                   ;8080C3|226F8184|84816F;
    JSL.L fTileScript_Update                                    ;8080C7|2200A681|81A600;
    JSL.L fObject_UpdateAllAnimations                                ;8080CB|22C78285|8582C7;
    JSL.L fObject_ProcessTileLoadQueue                                      ;8080CF|22B28C85|858CB2;
    JSL.L fObject_RenderAll                                      ;8080D3|22E08385|8583E0;
    SEP #$20                                                   ;8080D7|E220    |      ;
    STZ.B $00                                                  ;8080D9|6400    |000000;
    JMP.W fCore_MainLoop                                       ;8080DB|4C8380  |808083;
 
 
.continue:
    REP #$30                                                   ;8080DE|C230    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;8080E0|AD9601  |000196;
    AND.W #~!AFLAGS_NAMEINPUTREQUEST                                               
    STA.W strcDialogDisplay.mapFlags                           ;8080E6|8D9601  |000196;
    JML.L fScreen_NameInput                                    ;8080E9|5C0CE882|82E80C;
 
 
fCore_SetPlayerName:
    SEP #$20                                                   ;8080ED|E220    |      ;
    REP #$10                                                   ;8080EF|C210    |      ;
    LDA.B #$0F                                                 ;8080F1|A90F    |      ;
    STA.B strcVariables.n8Temp1                                ;8080F3|8592    |000092;
    LDA.B #$03                                                 ;8080F5|A903    |      ;
    STA.B strcVariables.n8Temp2                                ;8080F7|8593    |000093;
    LDA.B #$01                                                 ;8080F9|A901    |      ;
    STA.B strcVariables.n8Temp3                                ;8080FB|8594    |000094;
    JSL.L fCore_ScreenFadeout                                  ;8080FD|220A8880|80880A;
    JSL.L fCore_SetForceBlank                                  ;808101|220F8E80|808E0F;
    JSL.L fCore_ZeroVRAM                                       ;808105|22468880|808846;
    JSL.L fCore_ZeroCGRAM                                      ;808109|22808980|808980;
    SEP #$20                                                   ;80810D|E220    |      ;
    LDA.B #$00                                                 ;80810F|A900    |      ;
    XBA                                                        ;808111|EB      |      ;
    LDA.W strcNames.sTemp                                      ;808112|AD8508  |000885;
    STA.W strcNames.sPlayer                                    ;808115|8D8108  |000881;
    REP #$20                                                   ;808118|C220    |      ;
    STA.W strcNames.wPlayer                                    ;80811A|8DD508  |0008D5;
    SEP #$20                                                   ;80811D|E220    |      ;
    LDA.W strcNames.sTemp+1                                    ;80811F|AD8608  |000886;
    STA.W strcNames.sPlayer+1                                  ;808122|8D8208  |000882;
    REP #$20                                                   ;808125|C220    |      ;
    STA.W strcNames.wPlayer+2                                  ;808127|8DD708  |0008D7;
    SEP #$20                                                   ;80812A|E220    |      ;
    LDA.W strcNames.sTemp+2                                    ;80812C|AD8708  |000887;
    STA.W strcNames.sPlayer+2                                  ;80812F|8D8308  |000883;
    REP #$20                                                   ;808132|C220    |      ;
    STA.W strcNames.wPlayer+4                                  ;808134|8DD908  |0008D9;
    SEP #$20                                                   ;808137|E220    |      ;
    LDA.W strcNames.sTemp+3                                    ;808139|AD8808  |000888;
    STA.W strcNames.sPlayer+3                                  ;80813C|8D8408  |000884;
    REP #$20                                                   ;80813F|C220    |      ;
    STA.W strcNames.wPlayer+6                                  ;808141|8DDB08  |0008DB;
    REP #$20                                                   ;808144|C220    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;808146|AD9601  |000196;
    ORA.W #!AFLAGS_FORCETELEPORT                                               
    STA.W strcDialogDisplay.mapFlags                           ;80814C|8D9601  |000196;
    LDA.W #$0100                                               ;80814F|A90001  |      ;
    STA.W strcBGScrool.BG3VerOffs                              ;808152|8D4601  |000146;
    SEP #$20                                                   ;808155|E220    |      ;
    LDA.B #$01                                                 ;808157|A901    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;808159|8D9A01  |00019A;
    JMP.W fCore_MainLoop                                       ;80815C|4C8380  |808083;
 
 
fCore_SetBoughtCowName:
    SEP #$20                                                   ;80815F|E220    |      ;
    REP #$10                                                   ;808161|C210    |      ;
    LDA.B #$0F                                                 ;808163|A90F    |      ;
    STA.B strcVariables.n8Temp1                                ;808165|8592    |000092;
    LDA.B #$03                                                 ;808167|A903    |      ;
    STA.B strcVariables.n8Temp2                                ;808169|8593    |000093;
    LDA.B #$01                                                 ;80816B|A901    |      ;
    STA.B strcVariables.n8Temp3                                ;80816D|8594    |000094;
    JSL.L fCore_ScreenFadeout                                  ;80816F|220A8880|80880A;
    JSL.L fCore_SetForceBlank                                  ;808173|220F8E80|808E0F;
    JSL.L fCore_ZeroVRAM                                       ;808177|22468880|808846;
    JSL.L fCore_ZeroCGRAM                                      ;80817B|22808980|808980;
    REP #$20                                                   ;80817F|C220    |      ;
    LDA.W #$0000                                               ;808181|A90000  |      ;
    JSL.L fGameEngine_AddCow                                   ;808184|22DCC883|83C8DC;
    SEP #$20                                                   ;808188|E220    |      ;
    REP #$10                                                   ;80818A|C210    |      ;
    LDY.W #$000C                                               ;80818C|A00C00  |      ;
    LDA.W strcNames.sTemp                                      ;80818F|AD8508  |000885;
    STA.B [ptrTemp0x72],Y                                      ;808192|9772    |000072;
    LDY.W #$000D                                               ;808194|A00D00  |      ;
    LDA.W strcNames.sTemp+1                                    ;808197|AD8608  |000886;
    STA.B [ptrTemp0x72],Y                                      ;80819A|9772    |000072;
    LDY.W #$000E                                               ;80819C|A00E00  |      ;
    LDA.W strcNames.sTemp+2                                    ;80819F|AD8708  |000887;
    STA.B [ptrTemp0x72],Y                                      ;8081A2|9772    |000072;
    LDY.W #$000F                                               ;8081A4|A00F00  |      ;
    LDA.W strcNames.sTemp+3                                    ;8081A7|AD8808  |000888;
    STA.B [ptrTemp0x72],Y                                      ;8081AA|9772    |000072;
    REP #$20                                                   ;8081AC|C220    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;8081AE|AD9601  |000196;
    ORA.W #!AFLAGS_FORCETELEPORT                                               
    STA.W strcDialogDisplay.mapFlags                           ;8081B4|8D9601  |000196;
    %UnsetFlag(daily1, $0002)
    LDA.W #$0100                                               ;8081C2|A90001  |      ;
    STA.W strcBGScrool.BG3VerOffs                              ;8081C5|8D4601  |000146;
    SEP #$20                                                   ;8081C8|E220    |      ;
    LDA.B #$01                                                 ;8081CA|A901    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;8081CC|8D9A01  |00019A;
    JMP.W fCore_MainLoop                                       ;8081CF|4C8380  |808083;
 
 
fCore_SetBornCowName:
    SEP #$20                                                   ;8081D2|E220    |      ;
    REP #$10                                                   ;8081D4|C210    |      ;
    LDA.B #$0F                                                 ;8081D6|A90F    |      ;
    STA.B strcVariables.n8Temp1                                ;8081D8|8592    |000092;
    LDA.B #$03                                                 ;8081DA|A903    |      ;
    STA.B strcVariables.n8Temp2                                ;8081DC|8593    |000093;
    LDA.B #$01                                                 ;8081DE|A901    |      ;
    STA.B strcVariables.n8Temp3                                ;8081E0|8594    |000094;
    JSL.L fCore_ScreenFadeout                                  ;8081E2|220A8880|80880A;
    JSL.L fCore_SetForceBlank                                  ;8081E6|220F8E80|808E0F;
    JSL.L fCore_ZeroVRAM                                       ;8081EA|22468880|808846;
    JSL.L fCore_ZeroCGRAM                                      ;8081EE|22808980|808980;
    REP #$20                                                   ;8081F2|C220    |      ;
    LDA.W #$0001                                               ;8081F4|A90100  |      ;
    JSL.L fGameEngine_AddCow                                   ;8081F7|22DCC883|83C8DC;
    SEP #$20                                                   ;8081FB|E220    |      ;
    REP #$10                                                   ;8081FD|C210    |      ;
    LDY.W #$000C                                               ;8081FF|A00C00  |      ;
    LDA.W strcNames.sTemp                                      ;808202|AD8508  |000885;
    STA.B [ptrTemp0x72],Y                                      ;808205|9772    |000072;
    LDY.W #$000D                                               ;808207|A00D00  |      ;
    LDA.W strcNames.sTemp+1                                    ;80820A|AD8608  |000886;
    STA.B [ptrTemp0x72],Y                                      ;80820D|9772    |000072;
    LDY.W #$000E                                               ;80820F|A00E00  |      ;
    LDA.W strcNames.sTemp+2                                    ;808212|AD8708  |000887;
    STA.B [ptrTemp0x72],Y                                      ;808215|9772    |000072;
    LDY.W #$000F                                               ;808217|A00F00  |      ;
    LDA.W strcNames.sTemp+3                                    ;80821A|AD8808  |000888;
    STA.B [ptrTemp0x72],Y                                      ;80821D|9772    |000072;
    REP #$20                                                   ;80821F|C220    |      ;
    %UnsetFlag(event1, $0004)
    REP #$20                                                   ;80822C|C220    |      ;
    %UnsetFlag(event1, $0008)
    REP #$20                                                   ;808239|C220    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;80823B|AD9601  |000196;
    ORA.W #!AFLAGS_FORCETELEPORT                                               
    STA.W strcDialogDisplay.mapFlags                           ;808241|8D9601  |000196;
    LDA.W #$0100                                               ;808244|A90001  |      ;
    STA.W strcBGScrool.BG3VerOffs                              ;808247|8D4601  |000146;
    SEP #$20                                                   ;80824A|E220    |      ;
    LDA.B #$01                                                 ;80824C|A901    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;80824E|8D9A01  |00019A;
    JMP.W fCore_MainLoop                                       ;808251|4C8380  |808083;
 
 
fCore_SetDogName:
    SEP #$20                                                   ;808254|E220    |      ;
    REP #$10                                                   ;808256|C210    |      ;
    LDA.B #$0F                                                 ;808258|A90F    |      ;
    STA.B strcVariables.n8Temp1                                ;80825A|8592    |000092;
    LDA.B #$03                                                 ;80825C|A903    |      ;
    STA.B strcVariables.n8Temp2                                ;80825E|8593    |000093;
    LDA.B #$01                                                 ;808260|A901    |      ;
    STA.B strcVariables.n8Temp3                                ;808262|8594    |000094;
    JSL.L fCore_ScreenFadeout                                  ;808264|220A8880|80880A;
    JSL.L fCore_SetForceBlank                                  ;808268|220F8E80|808E0F;
    JSL.L fCore_ZeroVRAM                                       ;80826C|22468880|808846;
    JSL.L fCore_ZeroCGRAM                                      ;808270|22808980|808980;
    SEP #$20                                                   ;808274|E220    |      ;
    LDA.B #$00                                                 ;808276|A900    |      ;
    XBA                                                        ;808278|EB      |      ;
    LDA.W strcNames.sTemp                                      ;808279|AD8508  |000885;
    STA.W strcNames.sDog                                       ;80827C|8D9908  |000899;
    REP #$20                                                   ;80827F|C220    |      ;
    STA.W strcNames.wDog                                       ;808281|8DDD08  |0008DD;
    SEP #$20                                                   ;808284|E220    |      ;
    LDA.W strcNames.sTemp+1                                    ;808286|AD8608  |000886;
    STA.W strcNames.sDog+1                                     ;808289|8D9A08  |00089A;
    REP #$20                                                   ;80828C|C220    |      ;
    STA.W strcNames.wDog+2                                     ;80828E|8DDF08  |0008DF;
    SEP #$20                                                   ;808291|E220    |      ;
    LDA.W strcNames.sTemp+2                                    ;808293|AD8708  |000887;
    STA.W strcNames.sDog+2                                     ;808296|8D9B08  |00089B;
    REP #$20                                                   ;808299|C220    |      ;
    STA.W strcNames.wDog+4                                     ;80829B|8DE108  |0008E1;
    SEP #$20                                                   ;80829E|E220    |      ;
    LDA.W strcNames.sTemp+3                                    ;8082A0|AD8808  |000888;
    STA.W strcNames.sDog+3                                     ;8082A3|8D9C08  |00089C;
    REP #$20                                                   ;8082A6|C220    |      ;
    STA.W strcNames.wDog+6                                     ;8082A8|8DE308  |0008E3;
    REP #$20                                                   ;8082AB|C220    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;8082AD|AD9601  |000196;
    ORA.W #!AFLAGS_FORCETELEPORT                                               
    STA.W strcDialogDisplay.mapFlags                           ;8082B3|8D9601  |000196;
    LDA.W #$0100                                               ;8082B6|A90001  |      ;
    STA.W strcBGScrool.BG3VerOffs                              ;8082B9|8D4601  |000146;
    SEP #$20                                                   ;8082BC|E220    |      ;
    LDA.B #$01                                                 ;8082BE|A901    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;8082C0|8D9A01  |00019A;
    JMP.W fCore_MainLoop                                       ;8082C3|4C8380  |808083;
 
 
fCore_SetHorseName:
    SEP #$20                                                   ;8082C6|E220    |      ;
    REP #$10                                                   ;8082C8|C210    |      ;
    LDA.B #$0F                                                 ;8082CA|A90F    |      ;
    STA.B strcVariables.n8Temp1                                ;8082CC|8592    |000092;
    LDA.B #$03                                                 ;8082CE|A903    |      ;
    STA.B strcVariables.n8Temp2                                ;8082D0|8593    |000093;
    LDA.B #$01                                                 ;8082D2|A901    |      ;
    STA.B strcVariables.n8Temp3                                ;8082D4|8594    |000094;
    JSL.L fCore_ScreenFadeout                                  ;8082D6|220A8880|80880A;
    JSL.L fCore_SetForceBlank                                  ;8082DA|220F8E80|808E0F;
    JSL.L fCore_ZeroVRAM                                       ;8082DE|22468880|808846;
    JSL.L fCore_ZeroCGRAM                                      ;8082E2|22808980|808980;
    SEP #$20                                                   ;8082E6|E220    |      ;
    LDA.B #$00                                                 ;8082E8|A900    |      ;
    XBA                                                        ;8082EA|EB      |      ;
    LDA.W strcNames.sTemp                                      ;8082EB|AD8508  |000885;
    STA.W strcNames.sHorse                                     ;8082EE|8D9D08  |00089D;
    REP #$20                                                   ;8082F1|C220    |      ;
    STA.W strcNames.wHorse                                     ;8082F3|8DE508  |0008E5;
    SEP #$20                                                   ;8082F6|E220    |      ;
    LDA.W strcNames.sTemp+1                                    ;8082F8|AD8608  |000886;
    STA.W strcNames.sHorse+1                                   ;8082FB|8D9E08  |00089E;
    REP #$20                                                   ;8082FE|C220    |      ;
    STA.W strcNames.wHorse+2                                   ;808300|8DE708  |0008E7;
    SEP #$20                                                   ;808303|E220    |      ;
    LDA.W strcNames.sTemp+2                                    ;808305|AD8708  |000887;
    STA.W strcNames.sHorse+2                                   ;808308|8D9F08  |00089F;
    REP #$20                                                   ;80830B|C220    |      ;
    STA.W strcNames.wHorse+4                                   ;80830D|8DE908  |0008E9;
    SEP #$20                                                   ;808310|E220    |      ;
    LDA.W strcNames.sTemp+3                                    ;808312|AD8808  |000888;
    STA.W strcNames.sHorse+3                                   ;808315|8DA008  |0008A0;
    REP #$20                                                   ;808318|C220    |      ;
    STA.W strcNames.wHorse+6                                   ;80831A|8DEB08  |0008EB;
    REP #$20                                                   ;80831D|C220    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;80831F|AD9601  |000196;
    ORA.W #!AFLAGS_FORCETELEPORT                                               
    STA.W strcDialogDisplay.mapFlags                           ;808325|8D9601  |000196;
    LDA.W #$0100                                               ;808328|A90001  |      ;
    STA.W strcBGScrool.BG3VerOffs                              ;80832B|8D4601  |000146;
    SEP #$20                                                   ;80832E|E220    |      ;
    LDA.B #$01                                                 ;808330|A901    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;808332|8D9A01  |00019A;
    JMP.W fCore_MainLoop                                       ;808335|4C8380  |808083;
 
 
fCore_SetFirstChildName:
    SEP #$20                                                   ;808338|E220    |      ;
    REP #$10                                                   ;80833A|C210    |      ;
    LDA.B #$0F                                                 ;80833C|A90F    |      ;
    STA.B strcVariables.n8Temp1                                ;80833E|8592    |000092;
    LDA.B #$03                                                 ;808340|A903    |      ;
    STA.B strcVariables.n8Temp2                                ;808342|8593    |000093;
    LDA.B #$01                                                 ;808344|A901    |      ;
    STA.B strcVariables.n8Temp3                                ;808346|8594    |000094;
    JSL.L fCore_ScreenFadeout                                  ;808348|220A8880|80880A;
    JSL.L fCore_SetForceBlank                                  ;80834C|220F8E80|808E0F;
    JSL.L fCore_ZeroVRAM                                       ;808350|22468880|808846;
    JSL.L fCore_ZeroCGRAM                                      ;808354|22808980|808980;
    SEP #$20                                                   ;808358|E220    |      ;
    LDA.B #$00                                                 ;80835A|A900    |      ;
    XBA                                                        ;80835C|EB      |      ;
    LDA.W strcNames.sTemp                                      ;80835D|AD8508  |000885;
    STA.L sFirstChildNameShort                                 ;808360|8F3D1F7F|7F1F3D;
    REP #$20                                                   ;808364|C220    |      ;
    STA.W strcNames.wFirstChild                                ;808366|8DED08  |0008ED;
    SEP #$20                                                   ;808369|E220    |      ;
    LDA.W strcNames.sTemp+1                                    ;80836B|AD8608  |000886;
    STA.L sFirstChildNameShort+1                               ;80836E|8F3E1F7F|7F1F3E;
    REP #$20                                                   ;808372|C220    |      ;
    STA.W strcNames.wFirstChild+2                              ;808374|8DEF08  |0008EF;
    SEP #$20                                                   ;808377|E220    |      ;
    LDA.W strcNames.sTemp+2                                    ;808379|AD8708  |000887;
    STA.L sFirstChildNameShort+2                               ;80837C|8F3F1F7F|7F1F3F;
    REP #$20                                                   ;808380|C220    |      ;
    STA.W strcNames.wFirstChild+4                              ;808382|8DF108  |0008F1;
    SEP #$20                                                   ;808385|E220    |      ;
    LDA.W strcNames.sTemp+3                                    ;808387|AD8808  |000888;
    STA.L sFirstChildNameShort+3                               ;80838A|8F401F7F|7F1F40;
    REP #$20                                                   ;80838E|C220    |      ;
    STA.W strcNames.wFirstChild+6                              ;808390|8DF308  |0008F3;
    REP #$20                                                   ;808393|C220    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;808395|AD9601  |000196;
    ORA.W #!AFLAGS_FORCETELEPORT                                               
    STA.W strcDialogDisplay.mapFlags                           ;80839B|8D9601  |000196;
    LDA.W #$0100                                               ;80839E|A90001  |      ;
    STA.W strcBGScrool.BG3VerOffs                              ;8083A1|8D4601  |000146;
    SEP #$20                                                   ;8083A4|E220    |      ;
    LDA.B #$01                                                 ;8083A6|A901    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;8083A8|8D9A01  |00019A;
    JMP.W fCore_MainLoop                                       ;8083AB|4C8380  |808083;
 
 
fCore_SetSecondChildName:
    SEP #$20                                                   ;8083AE|E220    |      ;
    REP #$10                                                   ;8083B0|C210    |      ;
    LDA.B #$0F                                                 ;8083B2|A90F    |      ;
    STA.B strcVariables.n8Temp1                                ;8083B4|8592    |000092;
    LDA.B #$03                                                 ;8083B6|A903    |      ;
    STA.B strcVariables.n8Temp2                                ;8083B8|8593    |000093;
    LDA.B #$01                                                 ;8083BA|A901    |      ;
    STA.B strcVariables.n8Temp3                                ;8083BC|8594    |000094;
    JSL.L fCore_ScreenFadeout                                  ;8083BE|220A8880|80880A;
    JSL.L fCore_SetForceBlank                                  ;8083C2|220F8E80|808E0F;
    JSL.L fCore_ZeroVRAM                                       ;8083C6|22468880|808846;
    JSL.L fCore_ZeroCGRAM                                      ;8083CA|22808980|808980;
    SEP #$20                                                   ;8083CE|E220    |      ;
    LDA.B #$00                                                 ;8083D0|A900    |      ;
    XBA                                                        ;8083D2|EB      |      ;
    LDA.W strcNames.sTemp                                      ;8083D3|AD8508  |000885;
    STA.L sSecondChildNameShort                                ;8083D6|8F411F7F|7F1F41;
    REP #$20                                                   ;8083DA|C220    |      ;
    STA.W strcNames.wSecondChild                               ;8083DC|8DF508  |0008F5;
    SEP #$20                                                   ;8083DF|E220    |      ;
    LDA.W strcNames.sTemp+1                                    ;8083E1|AD8608  |000886;
    STA.L sSecondChildNameShort+1                              ;8083E4|8F421F7F|7F1F42;
    REP #$20                                                   ;8083E8|C220    |      ;
    STA.W strcNames.wSecondChild+2                             ;8083EA|8DF708  |0008F7;
    SEP #$20                                                   ;8083ED|E220    |      ;
    LDA.W strcNames.sTemp+2                                    ;8083EF|AD8708  |000887;
    STA.L sSecondChildNameShort+2                              ;8083F2|8F431F7F|7F1F43;
    REP #$20                                                   ;8083F6|C220    |      ;
    STA.W strcNames.wSecondChild+4                             ;8083F8|8DF908  |0008F9;
    SEP #$20                                                   ;8083FB|E220    |      ;
    LDA.W strcNames.sTemp+3                                    ;8083FD|AD8808  |000888;
    STA.L sSecondChildNameShort+3                              ;808400|8F441F7F|7F1F44;
    REP #$20                                                   ;808404|C220    |      ;
    STA.W strcNames.wSecondChild+6                             ;808406|8DFB08  |0008FB;
    REP #$20                                                   ;808409|C220    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;80840B|AD9601  |000196;
    ORA.W #!AFLAGS_FORCETELEPORT                                               
    STA.W strcDialogDisplay.mapFlags                           ;808411|8D9601  |000196;
    LDA.W #$0100                                               ;808414|A90001  |      ;
    STA.W strcBGScrool.BG3VerOffs                              ;808417|8D4601  |000146;
    SEP #$20                                                   ;80841A|E220    |      ;
    LDA.B #$01                                                 ;80841C|A901    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;80841E|8D9A01  |00019A;
    JMP.W fCore_MainLoop                                       ;808421|4C8380  |808083;
 
    dw $0000,$00F0                                             ;808424|        |      ;
 
fCore_InterruptIRQ5:
    SEI                                                        ;808428|78      |      ;
    CLC                                                        ;808429|18      |      ;
    XCE                                                        ;80842A|FB      |      ;
    REP #$30                                                   ;80842B|C230    |      ;
    LDX.W #$1F00                                               ;80842D|A2001F  |      ;
    TXS                                                        ;808430|9A      |      ;
    LDA.W #$0000                                               ;808431|A90000  |      ;
    TCD                                                        ;808434|5B      |      ;
    SEP #$30                                                   ;808435|E230    |      ;
    STZ.W SNES_NMITIMEN                                        ;808437|9C0042  |004200;
    STZ.W SNES_MDMAEN                                          ;80843A|9C0B42  |00420B;
    STZ.W SNES_HDMAEN                                          ;80843D|9C0C42  |00420C;
    LDA.B #$FF                                                 ;808440|A9FF    |      ;
    STA.W SNES_WRIO                                            ;808442|8D0142  |004201;
    STZ.W SNES_WRMPYA                                          ;808445|9C0242  |004202;
    STZ.W SNES_WRMPYB                                          ;808448|9C0342  |004203;
    STZ.W SNES_WRDIVL                                          ;80844B|9C0442  |004204;
    STZ.W SNES_WRDIVH                                          ;80844E|9C0542  |004205;
    STZ.W SNES_WRDIVB                                          ;808451|9C0642  |004206;
    STZ.W SNES_HTIMEL                                          ;808454|9C0742  |004207;
    STZ.W SNES_HTIMEH                                          ;808457|9C0842  |004208;
    STZ.W SNES_VTIMEL                                          ;80845A|9C0942  |004209;
    STZ.W SNES_VTIMEH                                          ;80845D|9C0A42  |00420A;
    STZ.W SNES_MDMAEN                                          ;808460|9C0B42  |00420B;
    STZ.W SNES_HDMAEN                                          ;808463|9C0C42  |00420C;
    LDA.B #$01                                                 ;808466|A901    |      ;
    STA.W SNES_MEMSEL                                          ;808468|8D0D42  |00420D;
    STZ.W SNES_RDNMI                                           ;80846B|9C1042  |004210;
    STZ.W SNES_TIMEUP                                          ;80846E|9C1142  |004211;
    STZ.W SNES_HVBJOY                                          ;808471|9C1242  |004212;
    STZ.W SNES_RDIO                                            ;808474|9C1342  |004213;
    STZ.W SNES_RDDIVL                                          ;808477|9C1442  |004214;
    STZ.W SNES_RDDIVH                                          ;80847A|9C1542  |004215;
    STZ.W SNES_RDMPYL                                          ;80847D|9C1642  |004216;
    STZ.W SNES_RDMPYH                                          ;808480|9C1742  |004217;
    STZ.W SNES_JOY1L                                           ;808483|9C1842  |004218;
    STZ.W SNES_JOY1H                                           ;808486|9C1942  |004219;
    STZ.W SNES_JOY2L                                           ;808489|9C1A42  |00421A;
    STZ.W SNES_JOY2H                                           ;80848C|9C1B42  |00421B;
    STZ.W SNES_JOY3L                                           ;80848F|9C1C42  |00421C;
    STZ.W SNES_JOY3H                                           ;808492|9C1D42  |00421D;
    STZ.W SNES_JOY4L                                           ;808495|9C1E42  |00421E;
    STZ.W SNES_JOY4H                                           ;808498|9C1F42  |00421F;
    STZ.W SNES_INIDISP                                         ;80849B|9C0021  |002100;
    STZ.W SNES_OBSEL                                           ;80849E|9C0121  |002101;
    STZ.W SNES_OAMADDL                                         ;8084A1|9C0221  |002102;
    STZ.W SNES_OAMADDH                                         ;8084A4|9C0321  |002103;
    STZ.W SNES_OAMDATA                                         ;8084A7|9C0421  |002104;
    STZ.W SNES_OAMDATA                                         ;8084AA|9C0421  |002104;
    STZ.W SNES_BGMODE                                          ;8084AD|9C0521  |002105;
    STZ.W SNES_MOSAIC                                          ;8084B0|9C0621  |002106;
    STZ.W SNES_BG1SC                                           ;8084B3|9C0721  |002107;
    STZ.W SNES_BG2SC                                           ;8084B6|9C0821  |002108;
    STZ.W SNES_BG3SC                                           ;8084B9|9C0921  |002109;
    STZ.W SNES_BG4SC                                           ;8084BC|9C0A21  |00210A;
    STZ.W SNES_BG12NBA                                         ;8084BF|9C0B21  |00210B;
    STZ.W SNES_BG34NBA                                         ;8084C2|9C0C21  |00210C;
    STZ.W SNES_BG1HOFS                                         ;8084C5|9C0D21  |00210D;
    STZ.W SNES_BG1HOFS                                         ;8084C8|9C0D21  |00210D;
    STZ.W SNES_BG1VOFS                                         ;8084CB|9C0E21  |00210E;
    STZ.W SNES_BG1VOFS                                         ;8084CE|9C0E21  |00210E;
    STZ.W SNES_BG2HOFS                                         ;8084D1|9C0F21  |00210F;
    STZ.W SNES_BG2HOFS                                         ;8084D4|9C0F21  |00210F;
    STZ.W SNES_BG2VOFS                                         ;8084D7|9C1021  |002110;
    STZ.W SNES_BG2VOFS                                         ;8084DA|9C1021  |002110;
    STZ.W SNES_BG3HOFS                                         ;8084DD|9C1121  |002111;
    STZ.W SNES_BG3HOFS                                         ;8084E0|9C1121  |002111;
    STZ.W SNES_BG3VOFS                                         ;8084E3|9C1221  |002112;
    STZ.W SNES_BG3VOFS                                         ;8084E6|9C1221  |002112;
    STZ.W SNES_BG4HOFS                                         ;8084E9|9C1321  |002113;
    STZ.W SNES_BG4HOFS                                         ;8084EC|9C1321  |002113;
    STZ.W SNES_BG4VOFS                                         ;8084EF|9C1421  |002114;
    STZ.W SNES_BG4VOFS                                         ;8084F2|9C1421  |002114;
    LDA.B #$80                                                 ;8084F5|A980    |      ;
    STA.W SNES_VMAIN                                           ;8084F7|8D1521  |002115;
    STZ.W SNES_VMADDL                                          ;8084FA|9C1621  |002116;
    STZ.W SNES_VMADDH                                          ;8084FD|9C1721  |002117;
    STZ.W SNES_VMDATAL                                         ;808500|9C1821  |002118;
    STZ.W SNES_VMDATAH                                         ;808503|9C1921  |002119;
    STZ.W SNES_M7SEL                                           ;808506|9C1A21  |00211A;
    STZ.W SNES_M7A                                             ;808509|9C1B21  |00211B;
    STZ.W SNES_M7A                                             ;80850C|9C1B21  |00211B;
    STZ.W SNES_M7B                                             ;80850F|9C1C21  |00211C;
    STZ.W SNES_M7B                                             ;808512|9C1C21  |00211C;
    STZ.W SNES_M7C                                             ;808515|9C1D21  |00211D;
    STZ.W SNES_M7C                                             ;808518|9C1D21  |00211D;
    STZ.W SNES_M7D                                             ;80851B|9C1E21  |00211E;
    STZ.W SNES_M7D                                             ;80851E|9C1E21  |00211E;
    STZ.W SNES_M7X                                             ;808521|9C1F21  |00211F;
    STZ.W SNES_M7X                                             ;808524|9C1F21  |00211F;
    STZ.W SNES_M7Y                                             ;808527|9C2021  |002120;
    STZ.W SNES_M7Y                                             ;80852A|9C2021  |002120;
    STZ.W SNES_CGADD                                           ;80852D|9C2121  |002121;
    STZ.W SNES_CGDATA                                          ;808530|9C2221  |002122;
    STZ.W SNES_CGDATA                                          ;808533|9C2221  |002122;
    STZ.W SNES_W12SEL                                          ;808536|9C2321  |002123;
    STZ.W SNES_W34SEL                                          ;808539|9C2421  |002124;
    STZ.W SNES_WOBJSEL                                         ;80853C|9C2521  |002125;
    STZ.W SNES_WH0                                             ;80853F|9C2621  |002126;
    STZ.W SNES_WH1                                             ;808542|9C2721  |002127;
    STZ.W SNES_WH2                                             ;808545|9C2821  |002128;
    STZ.W SNES_WH3                                             ;808548|9C2921  |002129;
    STZ.W SNES_WBGLOG                                          ;80854B|9C2A21  |00212A;
    STZ.W SNES_WOBJLOG                                         ;80854E|9C2B21  |00212B;
    STZ.W SNES_TM                                              ;808551|9C2C21  |00212C;
    STZ.W SNES_TS                                              ;808554|9C2D21  |00212D;
    STZ.W SNES_TMW                                             ;808557|9C2E21  |00212E;
    STZ.W SNES_TSW                                             ;80855A|9C2F21  |00212F;
    LDA.B #$30                                                 ;80855D|A930    |      ;
    STA.W SNES_CGWSEL                                          ;80855F|8D3021  |002130;
    STZ.W SNES_CGADSUB                                         ;808562|9C3121  |002131;
    LDA.B #$E0                                                 ;808565|A9E0    |      ;
    STA.W SNES_COLDATA                                         ;808567|8D3221  |002132;
    STZ.W SNES_SETINI                                          ;80856A|9C3321  |002133;
    STZ.W SNES_MPYL                                            ;80856D|9C3421  |002134;
    STZ.W SNES_MPYM                                            ;808570|9C3521  |002135;
    STZ.W SNES_MPYH                                            ;808573|9C3621  |002136;
    STZ.W SNES_SLHV                                            ;808576|9C3721  |002137;
    STZ.W SNES_OAMDATAREAD                                     ;808579|9C3821  |002138;
    STZ.W SNES_VMDATALREAD                                     ;80857C|9C3921  |002139;
    STZ.W SNES_VMDATAHREAD                                     ;80857F|9C3A21  |00213A;
    STZ.W SNES_CGDATAREAD                                      ;808582|9C3B21  |00213B;
    STZ.W SNES_CGDATAREAD                                      ;808585|9C3B21  |00213B;
    STZ.W SNES_OPHCT                                           ;808588|9C3C21  |00213C;
    STZ.W SNES_OPVCT                                           ;80858B|9C3D21  |00213D;
    STZ.W SNES_STAT77                                          ;80858E|9C3E21  |00213E;
    STZ.W SNES_STAT78                                          ;808591|9C3F21  |00213F;
    STZ.W SNES_WMDATA                                          ;808594|9C8021  |002180;
    STZ.W SNES_WMADDL                                          ;808597|9C8121  |002181;
    STZ.W SNES_WMADDM                                          ;80859A|9C8221  |002182;
    STZ.W SNES_WMADDH                                          ;80859D|9C8321  |002183;
    REP #$30                                                   ;8085A0|C230    |      ;
    LDX.W #$0000                                               ;8085A2|A20000  |      ;
    LDA.W #$0000                                               ;8085A5|A90000  |      ;
 
  - STA.W $0000,X                                              ;8085A8|9D0000  |000000;
    INX                                                        ;8085AB|E8      |      ;
    INX                                                        ;8085AC|E8      |      ;
    CPX.W #$2000                                               ;8085AD|E00020  |      ;
    BNE -                                                      ;8085B0|D0F6    |8085A8;
    REP #$30                                                   ;8085B2|C230    |      ;
    LDX.W #$0000                                               ;8085B4|A20000  |      ;
    LDA.W #$0000                                               ;8085B7|A90000  |      ;
 
  - STA.L $7E2000,X                                            ;8085BA|9F00207E|7E2000;
    INX                                                        ;8085BE|E8      |      ;
    INX                                                        ;8085BF|E8      |      ;
    CPX.W #$E000                                               ;8085C0|E000E0  |      ;
    BNE -                                                      ;8085C3|D0F5    |8085BA;
    REP #$30                                                   ;8085C5|C230    |      ;
    LDX.W #$0000                                               ;8085C7|A20000  |      ;
    LDA.W #$0000                                               ;8085CA|A90000  |      ;
 
  - STA.L $7F0000,X                                            ;8085CD|9F00007F|7F0000;
    INX                                                        ;8085D1|E8      |      ;
    INX                                                        ;8085D2|E8      |      ;
    CPX.W #$0000                                               ;8085D3|E00000  |      ;
    BNE -                                                      ;8085D6|D0F5    |8085CD;
    STZ.W strcJoypad1.current                                  ;8085D8|9C2401  |000124;
    STZ.W strcJoypad1.newInput                                 ;8085DB|9C2801  |000128;
    STZ.W strcJoypad1.lastFrame                                ;8085DE|9C2601  |000126;
    STZ.W strcJoypad1.newUnpressed                             ;8085E1|9C2A01  |00012A;
    STZ.W strcJoypad2.current                                  ;8085E4|9C3001  |000130;
    STZ.W strcJoypad2.newInput                                 ;8085E7|9C3401  |000134;
    STZ.W strcJoypad2.lastFrame                                ;8085EA|9C3201  |000132;
    STZ.W strcJoypad2.newUnpressed                             ;8085ED|9C3601  |000136;
    REP #$30                                                   ;8085F0|C230    |      ;
    LDA.W #$8000                                               ;8085F2|A90080  |      ;
    STA.B ptrAudioData                                         ;8085F5|850A    |00000A;
    LDA.W #$00AD                                               ;8085F7|A9AD00  |      ;
    STA.B ptrAudioData+2                                       ;8085FA|850C    |00000C; prtAudioData = 0xAD8000
    JSL.L fAudio_UploadData                                    ;8085FC|223D8483|83843D;
    SEP #$20                                                   ;808600|E220    |      ;
    LDA.B #$00                                                 ;808602|A900    |      ;
    JSL.L fAudio_SendCommand0B                                 ;808604|22328E83|838E32;
    JSL.L fAudio_LoadCommonSamples                       ;808608|22988583|838598;
    JSL.L fAudio_UploadSpcDataBlock_B2D120                                 ;80860C|22D38483|8384D3;
    JSL.L fCore_InitializeScreenStatus                         ;808610|224C8C80|808C4C;
    JSL.L fCore_ZeroVRAM                                       ;808614|22468880|808846;
    JSL.L fCore_ZeroOAM                                        ;808618|22878880|808887;
    JSL.L fCore_ZeroCGRAM                                      ;80861C|22808980|808980;
    JSL.L fObject_InitTileCache                                  ;808620|22D78E85|858ED7;
    JSL.L fObject_ClearGameObject                              ;808624|220F8285|85820F;
    JSL.L fGameEngine_SaveCheck                                ;808628|22D4BA83|83BAD4;
    SEP #$20                                                   ;80862C|E220    |      ;
    REP #$10                                                   ;80862E|C210    |      ;
    LDA.B #$80                                                 ;808630|A980    |      ;
    STA.W SNES_INIDISP                                         ;808632|8D0021  |002100;
    STZ.W $0148                                                ;808635|9C4801  |000148;
    LDA.B #$80                                                 ;808638|A980    |      ;
    STA.W SNES_NMITIMEN                                        ;80863A|8D0042  |004200;
    STZ.W SNES_INIDISP                                         ;80863D|9C0021  |002100;
    CLI                                                        ;808640|58      |      ;
    JML.L fMainMenu_TitleScreenInit                                      ;808641|5C5ED782|82D75E;
 
 
fCore_WaitForNextNMI:
    PHP                                                        ;808645|08      |      ;
    REP #$20                                                   ;808646|C220    |      ;
    PHA                                                        ;808648|48      |      ;
    SEP #$20                                                   ;808649|E220    |      ;
    LDA.B #$A1                                                 ;80864B|A9A1    |      ;
    STA.L SNES_NMITIMEN                                        ;80864D|8F004200|004200;
    CLI                                                        ;808651|58      |      ;
    STZ.B $00                                                  ;808652|6400    |000000;
 
  - LDA.B $00                                                  ;808654|A500    |000000;
    BEQ -                                                      ;808656|F0FC    |808654;
    REP #$20                                                   ;808658|C220    |      ;
    PLA                                                        ;80865A|68      |      ;
    PLP                                                        ;80865B|28      |      ;
    RTL                                                        ;80865C|6B      |      ;
 
 
fCore_WaitForNMITimes:
    PHP                                                        ;80865D|08      |      ; A: nCount
 
 -- REP #$20                                                   ;80865E|C220    |      ;
    PHA                                                        ;808660|48      |      ;
    SEP #$20                                                   ;808661|E220    |      ;
    LDA.B #$A1                                                 ;808663|A9A1    |      ;
    STA.L SNES_NMITIMEN                                        ;808665|8F004200|004200;
    CLI                                                        ;808669|58      |      ;
    STZ.B $00                                                  ;80866A|6400    |000000;
 
  - LDA.B $00                                                  ;80866C|A500    |000000;
    BEQ -                                                      ;80866E|F0FC    |80866C;
    REP #$20                                                   ;808670|C220    |      ;
    PLA                                                        ;808672|68      |      ;
    DEC A                                                      ;808673|3A      |      ;
    CMP.W #$0000                                               ;808674|C90000  |      ;
    BNE --                                                     ;808677|D0E5    |80865E;
    PLP                                                        ;808679|28      |      ;
    RTL                                                        ;80867A|6B      |      ;
 
 
fCore_InterruptNMI1:
    REP #$30                                                   ;80867B|C230    |      ;
    PHA                                                        ;80867D|48      |      ;
    PHX                                                        ;80867E|DA      |      ;
    PHY                                                        ;80867F|5A      |      ;
    PHD                                                        ;808680|0B      |      ;
    PHB                                                        ;808681|8B      |      ;
    SEP #$20                                                   ;808682|E220    |      ;
    LDA.B #$00                                                 ;808684|A900    |      ;
    XBA                                                        ;808686|EB      |      ;
    LDA.B #$A1                                                 ;808687|A9A1    |      ;
    STA.L SNES_NMITIMEN                                        ;808689|8F004200|004200;
    CLI                                                        ;80868D|58      |      ;
    JSR.W fCore_UpdateGFX                                      ;80868E|20B186  |8086B1;
    REP #$30                                                   ;808691|C230    |      ;
    PLB                                                        ;808693|AB      |      ;
    PLD                                                        ;808694|2B      |      ;
    PLY                                                        ;808695|7A      |      ;
    PLX                                                        ;808696|FA      |      ;
    PLA                                                        ;808697|68      |      ;
 
fCore_InterruptReturn:
    RTI                                                        ;808698|40      |      ;
 
 
fCore_InterruptNMI3:
    REP #$30                                                   ;808699|C230    |      ;
    PHB                                                        ;80869B|8B      |      ;
    PHA                                                        ;80869C|48      |      ;
    PHX                                                        ;80869D|DA      |      ;
    PHY                                                        ;80869E|5A      |      ;
    SEP #$20                                                   ;80869F|E220    |      ;
    LDA.B #$00                                                 ;8086A1|A900    |      ;
    XBA                                                        ;8086A3|EB      |      ;
    LDA.W SNES_TIMEUP                                          ;8086A4|AD1142  |004211;
    JSR.W fCore_Return80872A                                   ;8086A7|202A87  |80872A;
    REP #$30                                                   ;8086AA|C230    |      ;
    PLY                                                        ;8086AC|7A      |      ;
    PLX                                                        ;8086AD|FA      |      ;
    PLA                                                        ;8086AE|68      |      ;
    PLB                                                        ;8086AF|AB      |      ;
    RTI                                                        ;8086B0|40      |      ;
 
 
fCore_UpdateGFX:
    PHP                                                        ;8086B1|08      |      ;
    SEP #$20                                                   ;8086B2|E220    |      ;
    LDA.B $00                                                  ;8086B4|A500    |000000;
    BNE +                                                      ;8086B6|D019    |8086D1;
    JSL.L fCore_StartTransfer                                  ;8086B8|22F08A80|808AF0;
    SEP #$20                                                   ;8086BC|E220    |      ;
    LDA.B $9A                                                  ;8086BE|A59A    |00009A;
    STA.W SNES_MDMAEN                                          ;8086C0|8D0B42  |00420B;
    STZ.B $9A                                                  ;8086C3|649A    |00009A;
    STZ.W SNES_MDMAEN                                          ;8086C5|9C0B42  |00420B;
    JSL.L fObject_ExecuteTileDmaQueue                                      ;8086C8|22578E85|858E57;
    STZ.B $9A                                                  ;8086CC|649A    |00009A;
    STZ.W SNES_MDMAEN                                          ;8086CE|9C0B42  |00420B;
 
  + JSR.W fCore_ReadJoypad                                     ;8086D1|202B87  |80872B;
    JSL.L fGetRandomNumber                                     ;8086D4|22388183|838138;
    SEP #$20                                                   ;8086D8|E220    |      ;
    LDA.W strcBGScrool.BG1HorOffs                              ;8086DA|AD3C01  |00013C;
    STA.W SNES_BG1HOFS                                         ;8086DD|8D0D21  |00210D;
    LDA.W strcBGScrool.BG1HorOffs+1                            ;8086E0|AD3D01  |00013D;
    STA.W SNES_BG1HOFS                                         ;8086E3|8D0D21  |00210D;
    LDA.W strcBGScrool.BG1VerOffs                              ;8086E6|AD3E01  |00013E;
    STA.W SNES_BG1VOFS                                         ;8086E9|8D0E21  |00210E;
    LDA.W strcBGScrool.BG1VerOffs+1                            ;8086EC|AD3F01  |00013F;
    STA.W SNES_BG1VOFS                                         ;8086EF|8D0E21  |00210E;
    LDA.W strcBGScrool.BG2HorOffs                              ;8086F2|AD4001  |000140;
    STA.W SNES_BG2HOFS                                         ;8086F5|8D0F21  |00210F;
    LDA.W strcBGScrool.BG2HorOffs+1                            ;8086F8|AD4101  |000141;
    STA.W SNES_BG2HOFS                                         ;8086FB|8D0F21  |00210F;
    LDA.W strcBGScrool.BG2VerOffs                              ;8086FE|AD4201  |000142;
    STA.W SNES_BG2VOFS                                         ;808701|8D1021  |002110;
    LDA.W strcBGScrool.BG2VerOffs+1                            ;808704|AD4301  |000143;
    STA.W SNES_BG2VOFS                                         ;808707|8D1021  |002110;
    LDA.W strcBGScrool.BG3HorOffs                              ;80870A|AD4401  |000144;
    STA.W SNES_BG3HOFS                                         ;80870D|8D1121  |002111;
    LDA.W strcBGScrool.BG3HorOffs+1                            ;808710|AD4501  |000145;
    STA.W SNES_BG3HOFS                                         ;808713|8D1121  |002111;
    LDA.W strcBGScrool.BG3VerOffs                              ;808716|AD4601  |000146;
    STA.W SNES_BG3VOFS                                         ;808719|8D1221  |002112;
    LDA.W strcBGScrool.BG3VerOffs+1                            ;80871C|AD4701  |000147;
    STA.W SNES_BG3VOFS                                         ;80871F|8D1221  |002112;
    SEP #$20                                                   ;808722|E220    |      ;
    LDA.B #$01                                                 ;808724|A901    |      ;
    STA.B $00                                                  ;808726|8500    |000000;
    PLP                                                        ;808728|28      |      ;
    RTS                                                        ;808729|60      |      ;
 
 
fCore_Return80872A:
    RTS                                                        ;80872A|60      |      ;
 
 
fCore_ReadJoypad:
    PHP                                                        ;80872B|08      |      ;
 
  - SEP #$20                                                   ;80872C|E220    |      ;
    LDA.W SNES_HVBJOY                                          ;80872E|AD1242  |004212;
    BIT.B #$01                                                 ;808731|8901    |      ;
    BNE -                                                      ;808733|D0F7    |80872C;
    REP #$30                                                   ;808735|C230    |      ;
    LDA.W strcJoypad1.current                                  ;808737|AD2401  |000124;
    STA.W strcJoypad1.lastFrame                                ;80873A|8D2601  |000126;
    LDA.W strcJoypad2.current                                  ;80873D|AD3001  |000130;
    STA.W strcJoypad2.lastFrame                                ;808740|8D3201  |000132;
    SEP #$20                                                   ;808743|E220    |      ;
    LDA.B $00                                                  ;808745|A500    |000000;
    BEQ .label1                                                ;808747|F00E    |808757;
    LDA.W SNES_JOY1L                                           ;808749|AD1842  |004218;
    STA.W strcJoypad1.unused0A                                 ;80874C|8D2E01  |00012E;
    LDA.W SNES_JOY2L                                           ;80874F|AD1A42  |00421A;
    STA.W strcJoypad2.current                                  ;808752|8D3001  |000130;
    BRA .label2                                                ;808755|801A    |808771;
 
 
.label1:
    REP #$20                                                   ;808757|C220    |      ;
    LDA.W SNES_JOY1L                                           ;808759|AD1842  |004218;
    ORA.W strcJoypad1.unused0A                                 ;80875C|0D2E01  |00012E;
    STA.W strcJoypad1.current                                  ;80875F|8D2401  |000124;
    LDA.W SNES_JOY2L                                           ;808762|AD1A42  |00421A;
    ORA.W strcJoypad2.unused0A                                 ;808765|0D3A01  |00013A;
    STA.W strcJoypad2.current                                  ;808768|8D3001  |000130;
    STZ.W strcJoypad1.unused0A                                 ;80876B|9C2E01  |00012E;
    STZ.W strcJoypad2.unused0A                                 ;80876E|9C3A01  |00013A;
 
.label2:
    REP #$20                                                   ;808771|C220    |      ;
    LDA.W SNES_JOY1L                                           ;808773|AD1842  |004218;
    EOR.W strcJoypad1.lastFrame                                ;808776|4D2601  |000126;
    AND.W strcJoypad1.current                                  ;808779|2D2401  |000124;
    STA.W strcJoypad1.newInput                                 ;80877C|8D2801  |000128;
    STA.W strcJoypad1.autorepeat                               ;80877F|8D2C01  |00012C;
    LDA.W SNES_JOY1L                                           ;808782|AD1842  |004218;
    EOR.W strcJoypad1.lastFrame                                ;808785|4D2601  |000126;
    AND.W strcJoypad1.lastFrame                                ;808788|2D2601  |000126;
    STA.W strcJoypad1.newUnpressed                             ;80878B|8D2A01  |00012A;
    LDA.W SNES_JOY2L                                           ;80878E|AD1A42  |00421A;
    EOR.W strcJoypad2.lastFrame                                ;808791|4D3201  |000132;
    AND.W strcJoypad2.current                                  ;808794|2D3001  |000130;
    STA.W strcJoypad2.newInput                                 ;808797|8D3401  |000134;
    STA.W strcJoypad2.autorepeat                               ;80879A|8D3801  |000138;
    LDA.W SNES_JOY1L                                           ;80879D|AD1842  |004218;
    EOR.W strcJoypad2.lastFrame                                ;8087A0|4D3201  |000132;
    AND.W strcJoypad2.lastFrame                                ;8087A3|2D3201  |000132;
    STA.W strcJoypad2.newUnpressed                             ;8087A6|8D3601  |000136;
    LDA.W strcJoypad1.current                                  ;8087A9|AD2401  |000124;
    BEQ .label3                                                ;8087AC|F004    |8087B2;
    INC.B strcSystem.unk23                                     ;8087AE|E623    |000023;
    BRA .label4                                                ;8087B0|8002    |8087B4;
 
 
.label3:
    STZ.B strcSystem.unk23                                     ;8087B2|6423    |000023;
 
.label4:
    SEP #$20                                                   ;8087B4|E220    |      ;
    LDA.B strcSystem.unk23                                     ;8087B6|A523    |000023;
    CMP.B #$1E                                                 ;8087B8|C91E    |      ;
    BEQ .label5                                                ;8087BA|F002    |8087BE;
    BRA .return                                                ;8087BC|800E    |8087CC;
 
 
.label5:
    REP #$20                                                   ;8087BE|C220    |      ;
    LDA.W strcJoypad1.current                                  ;8087C0|AD2401  |000124;
    STA.W strcJoypad1.autorepeat                               ;8087C3|8D2C01  |00012C;
    SEP #$20                                                   ;8087C6|E220    |      ;
    LDA.B #$19                                                 ;8087C8|A919    |      ;
    STA.B strcSystem.unk23                                     ;8087CA|8523    |000023;
 
.return:
    PLP                                                        ;8087CC|28      |      ;
    RTS                                                        ;8087CD|60      |      ;
 
 
fCore_ScreenFadein:
    SEP #$30                                                   ;8087CE|E230    |      ; $92: nStartBrightness, $93: nFramesPerStep, $94: nTargetBrighntess
    LDA.B strcVariables.n8Temp1                                ;8087D0|A592    |000092;
    CMP.B #$FF                                                 ;8087D2|C9FF    |      ;
    BEQ +                                                      ;8087D4|F004    |8087DA;
    LDA.B strcVariables.n8Temp1                                ;8087D6|A592    |000092;
    STA.B strcSystem.nBrightness                               ;8087D8|8525    |000025;
 
  + LDA.B strcVariables.n8Temp2                                ;8087DA|A593    |000093;
    STA.B strcSystem.nBrightnessStep                           ;8087DC|8526    |000026;
 
 -- LDA.B strcSystem.nBrightness                               ;8087DE|A525    |000025;
    JSL.L fCore_SetBrightness                                  ;8087E0|222D8E80|808E2D;
    LDA.B strcSystem.nBrightness                               ;8087E4|A525    |000025;
    CMP.B strcVariables.n8Temp3                                ;8087E6|C594    |000094;
    BEQ +                                                      ;8087E8|F012    |8087FC;
    INC.B strcSystem.nBrightness                               ;8087EA|E625    |000025;
 
  - JSL.L fCore_WaitForNextNMI                                 ;8087EC|22458680|808645;
    DEC.B strcSystem.nBrightnessStep                           ;8087F0|C626    |000026;
    LDA.B strcSystem.nBrightnessStep                           ;8087F2|A526    |000026;
    BNE -                                                      ;8087F4|D0F6    |8087EC;
    LDA.B strcVariables.n8Temp2                                ;8087F6|A593    |000093;
    STA.B strcSystem.nBrightnessStep                           ;8087F8|8526    |000026;
    BRA --                                                     ;8087FA|80E2    |8087DE;
 
 
  + REP #$20                                                   ;8087FC|C220    |      ;
    %SetFlag(daily1, $8000)
    RTL                                                        ;808809|6B      |      ;
 
 
fCore_ScreenFadeout:
    SEP #$30                                                   ;80880A|E230    |      ; $92: nStartBrightness, $93: nFramesPerStep, $94: nTargetBrighntess
    LDA.B strcVariables.n8Temp1                                ;80880C|A592    |000092;
    CMP.B #$FF                                                 ;80880E|C9FF    |      ;
    BEQ +                                                      ;808810|F004    |808816;
    LDA.B strcVariables.n8Temp1                                ;808812|A592    |000092;
    STA.B strcSystem.nBrightness                               ;808814|8525    |000025;
 
  + LDA.B strcVariables.n8Temp2                                ;808816|A593    |000093;
    STA.B strcSystem.nBrightnessStep                           ;808818|8526    |000026;
 
 -- LDA.B strcSystem.nBrightness                               ;80881A|A525    |000025;
    JSL.L fCore_SetBrightness                                  ;80881C|222D8E80|808E2D;
    LDA.B strcSystem.nBrightness                               ;808820|A525    |000025;
    CMP.B strcVariables.n8Temp3                                ;808822|C594    |000094;
    BEQ +                                                      ;808824|F012    |808838;
    DEC.B strcSystem.nBrightness                               ;808826|C625    |000025;
 
  - JSL.L fCore_WaitForNextNMI                                 ;808828|22458680|808645;
    DEC.B strcSystem.nBrightnessStep                           ;80882C|C626    |000026;
    LDA.B strcSystem.nBrightnessStep                           ;80882E|A526    |000026;
    BNE -                                                      ;808830|D0F6    |808828;
    LDA.B strcVariables.n8Temp2                                ;808832|A593    |000093;
    STA.B strcSystem.nBrightnessStep                           ;808834|8526    |000026;
    BRA --                                                     ;808836|80E2    |80881A;
 
 
  + REP #$20                                                   ;808838|C220    |      ;
    %UnsetFlag(daily1, $8000)
    RTL                                                        ;808845|6B      |      ;
 
 
fCore_ZeroVRAM:
    SEP #$20                                                   ;808846|E220    |      ;
    REP #$10                                                   ;808848|C210    |      ;
    LDA.B #$80                                                 ;80884A|A980    |      ;
    STA.W SNES_INIDISP                                         ;80884C|8D0021  |002100;
    STZ.W SNES_NMITIMEN                                        ;80884F|9C0042  |004200;
    LDA.B #$80                                                 ;808852|A980    |      ;
    STA.W SNES_VMAIN                                           ;808854|8D1521  |002115;
    REP #$20                                                   ;808857|C220    |      ;
    STZ.W SNES_VMADDL                                          ;808859|9C1621  |002116;
    SEP #$20                                                   ;80885C|E220    |      ;
    LDA.B #$09                                                 ;80885E|A909    |      ;
    STA.W SNES_DMAP0                                           ;808860|8D0043  |004300;
    LDA.B #$18                                                 ;808863|A918    |      ;
    STA.W SNES_BBAD0                                           ;808865|8D0143  |004301;
    REP #$20                                                   ;808868|C220    |      ;
    LDA.W #$8424                                               ;80886A|A92484  |      ;
    STA.W SNES_A1T0L                                           ;80886D|8D0243  |004302;
    SEP #$20                                                   ;808870|E220    |      ;
    LDA.B #$80                                                 ;808872|A980    |      ;
    STA.W SNES_A1B0                                            ;808874|8D0443  |004304;
    REP #$20                                                   ;808877|C220    |      ;
    LDA.W #$0000                                               ;808879|A90000  |      ;
    STA.W SNES_DAS0L                                           ;80887C|8D0543  |004305;
    SEP #$20                                                   ;80887F|E220    |      ;
    LDA.B #$01                                                 ;808881|A901    |      ;
    STA.W SNES_MDMAEN                                          ;808883|8D0B42  |00420B;
    RTL                                                        ;808886|6B      |      ;
 
 
fCore_ZeroOAM:
    SEP #$20                                                   ;808887|E220    |      ;
    REP #$10                                                   ;808889|C210    |      ;
    LDA.B #!INIDISP_FORCEBLANK|!INIDISP_BRIGHTNESS0                                                 
    STA.W SNES_INIDISP                                         ;80888D|8D0021  |002100;
    STZ.W SNES_NMITIMEN                                        ;808890|9C0042  |004200;
    REP #$20                                                   ;808893|C220    |      ;
    STZ.W SNES_OAMADDL                                         ;808895|9C0221  |002102;
    SEP #$20                                                   ;808898|E220    |      ;
    LDA.B #$09                                                 ;80889A|A909    |      ;
    STA.W SNES_DMAP0                                           ;80889C|8D0043  |004300;
    LDA.B #$04                                                 ;80889F|A904    |      ;
    STA.W SNES_BBAD0                                           ;8088A1|8D0143  |004301;
    REP #$20                                                   ;8088A4|C220    |      ;
    LDA.W #$8424                                               ;8088A6|A92484  |      ;
    STA.W SNES_A1T0L                                           ;8088A9|8D0243  |004302;
    SEP #$20                                                   ;8088AC|E220    |      ;
    LDA.B #$80                                                 ;8088AE|A980    |      ;
    STA.W SNES_A1B0                                            ;8088B0|8D0443  |004304;
    REP #$20                                                   ;8088B3|C220    |      ;
    LDA.W #$043F                                               ;8088B5|A93F04  |      ;
    STA.W SNES_DAS0L                                           ;8088B8|8D0543  |004305;
    SEP #$20                                                   ;8088BB|E220    |      ;
    LDA.B #$01                                                 ;8088BD|A901    |      ;
    STA.W SNES_MDMAEN                                          ;8088BF|8D0B42  |00420B;
    RTL                                                        ;8088C2|6B      |      ;
 
 
fCore_Unused8088C3:
    REP #$30                                                   ;8088C3|C230    |      ;
    STZ.W SNES_OAMADDL                                         ;8088C5|9C0221  |002102;
    SEP #$20                                                   ;8088C8|E220    |      ;
    LDA.B #$08                                                 ;8088CA|A908    |      ;
    STA.W SNES_DMAP0                                           ;8088CC|8D0043  |004300;
    LDA.B #$04                                                 ;8088CF|A904    |      ;
    STA.W SNES_BBAD0                                           ;8088D1|8D0143  |004301;
    REP #$20                                                   ;8088D4|C220    |      ;
    LDA.W #$8426                                               ;8088D6|A92684  |      ;
    STA.W SNES_A1T0L                                           ;8088D9|8D0243  |004302;
    SEP #$20                                                   ;8088DC|E220    |      ;
    LDA.B #$80                                                 ;8088DE|A980    |      ;
    STA.W SNES_A1B0                                            ;8088E0|8D0443  |004304;
    REP #$20                                                   ;8088E3|C220    |      ;
    LDA.W #$0200                                               ;8088E5|A90002  |      ;
    STA.W SNES_DAS0L                                           ;8088E8|8D0543  |004305;
    SEP #$20                                                   ;8088EB|E220    |      ;
    LDA.B #$01                                                 ;8088ED|A901    |      ;
    STA.W SNES_MDMAEN                                          ;8088EF|8D0B42  |00420B;
    REP #$30                                                   ;8088F2|C230    |      ;
    LDA.W #$0100                                               ;8088F4|A90001  |      ;
    STA.W SNES_OAMADDL                                         ;8088F7|8D0221  |002102;
    SEP #$20                                                   ;8088FA|E220    |      ;
    LDA.B #$08                                                 ;8088FC|A908    |      ;
    STA.W SNES_DMAP0                                           ;8088FE|8D0043  |004300;
    LDA.B #$04                                                 ;808901|A904    |      ;
    STA.W SNES_BBAD0                                           ;808903|8D0143  |004301;
    REP #$20                                                   ;808906|C220    |      ;
    LDA.W #$8424                                               ;808908|A92484  |      ;
    STA.W SNES_A1T0L                                           ;80890B|8D0243  |004302;
    SEP #$20                                                   ;80890E|E220    |      ;
    LDA.B #$80                                                 ;808910|A980    |      ;
    STA.W SNES_A1B0                                            ;808912|8D0443  |004304;
    REP #$20                                                   ;808915|C220    |      ;
    LDA.W #$0020                                               ;808917|A92000  |      ;
    STA.W SNES_DAS0L                                           ;80891A|8D0543  |004305;
    SEP #$20                                                   ;80891D|E220    |      ;
    LDA.B #$01                                                 ;80891F|A901    |      ;
    STA.W SNES_MDMAEN                                          ;808921|8D0B42  |00420B;
    REP #$20                                                   ;808924|C220    |      ;
    STZ.W SNES_OAMADDL                                         ;808926|9C0221  |002102;
    SEP #$20                                                   ;808929|E220    |      ;
    REP #$10                                                   ;80892B|C210    |      ;
    LDX.W #$0000                                               ;80892D|A20000  |      ;
    STX.W SNES_OAMADDL                                         ;808930|8E0221  |002102;
    STZ.W SNES_DMAP4                                           ;808933|9C4043  |004340;
    LDA.B #$04                                                 ;808936|A904    |      ;
    STA.W SNES_BBAD4                                           ;808938|8D4143  |004341;
    LDA.B #$00                                                 ;80893B|A900    |      ;
    STA.W SNES_A1T4L                                           ;80893D|8D4243  |004342;
    LDA.B #$A0                                                 ;808940|A9A0    |      ;
    STA.W SNES_A1T4H                                           ;808942|8D4343  |004343;
    LDA.B #$7E                                                 ;808945|A97E    |      ;
    STA.W SNES_A1B4                                            ;808947|8D4443  |004344;
    LDX.B strcObject.bankAddress                               ;80894A|A6AF    |0000AF;
    STX.W SNES_DAS4L                                           ;80894C|8E4543  |004345;
    LDA.B #$10                                                 ;80894F|A910    |      ;
    STA.W SNES_MDMAEN                                          ;808951|8D0B42  |00420B;
    LDX.W #$0100                                               ;808954|A20001  |      ;
    STX.W SNES_OAMADDL                                         ;808957|8E0221  |002102;
    STZ.W SNES_DMAP4                                           ;80895A|9C4043  |004340;
    LDA.B #$04                                                 ;80895D|A904    |      ;
    STA.W SNES_BBAD4                                           ;80895F|8D4143  |004341;
    LDA.B #$00                                                 ;808962|A900    |      ;
    STA.W SNES_A1T4L                                           ;808964|8D4243  |004342;
    LDA.B #$A0                                                 ;808967|A9A0    |      ;
    CLC                                                        ;808969|18      |      ;
    ADC.B #$02                                                 ;80896A|6902    |      ;
    STA.W SNES_A1T4H                                           ;80896C|8D4343  |004343;
    LDA.B #$7E                                                 ;80896F|A97E    |      ;
    STA.W SNES_A1B4                                            ;808971|8D4443  |004344;
    LDX.W #$0020                                               ;808974|A22000  |      ;
    STX.W SNES_DAS4L                                           ;808977|8E4543  |004345;
    LDA.B #$10                                                 ;80897A|A910    |      ;
    STA.W SNES_MDMAEN                                          ;80897C|8D0B42  |00420B;
    RTL                                                        ;80897F|6B      |      ;
 
 
fCore_ZeroCGRAM:
    SEP #$20                                                   ;808980|E220    |      ;
    REP #$10                                                   ;808982|C210    |      ;
    LDA.B #!INIDISP_FORCEBLANK|!INIDISP_BRIGHTNESS0                                                 
    STA.W SNES_INIDISP                                         ;808986|8D0021  |002100;
    STZ.W SNES_NMITIMEN                                        ;808989|9C0042  |004200;
    REP #$20                                                   ;80898C|C220    |      ;
    STZ.W SNES_CGADD                                           ;80898E|9C2121  |002121;
    SEP #$20                                                   ;808991|E220    |      ;
    LDA.B #$09                                                 ;808993|A909    |      ;
    STA.W SNES_DMAP0                                           ;808995|8D0043  |004300;
    LDA.B #$22                                                 ;808998|A922    |      ;
    STA.W SNES_BBAD0                                           ;80899A|8D0143  |004301;
    REP #$20                                                   ;80899D|C220    |      ;
    LDA.W #$8424                                               ;80899F|A92484  |      ;
    STA.W SNES_A1T0L                                           ;8089A2|8D0243  |004302;
    SEP #$20                                                   ;8089A5|E220    |      ;
    LDA.B #$80                                                 ;8089A7|A980    |      ;
    STA.W SNES_A1B0                                            ;8089A9|8D0443  |004304;
    REP #$20                                                   ;8089AC|C220    |      ;
    LDA.W #$03FF                                               ;8089AE|A9FF03  |      ;
    STA.W SNES_DAS0L                                           ;8089B1|8D0543  |004305;
    SEP #$20                                                   ;8089B4|E220    |      ;
    LDA.B #$01                                                 ;8089B6|A901    |      ;
    STA.W SNES_MDMAEN                                          ;8089B8|8D0B42  |00420B;
    RTL                                                        ;8089BB|6B      |      ;
 
 
fCore_ZeroVRAMatOffset:
    REP #$30                                                   ;8089BC|C230    |      ; A: nOffset
    STA.W SNES_VMADDL                                          ;8089BE|8D1621  |002116;
    SEP #$20                                                   ;8089C1|E220    |      ;
    LDA.B #!INIDISP_FORCEBLANK|!INIDISP_BRIGHTNESS0                                                 
    STA.W SNES_INIDISP                                         ;8089C5|8D0021  |002100;
    STZ.W SNES_NMITIMEN                                        ;8089C8|9C0042  |004200;
    LDA.B #$80                                                 ;8089CB|A980    |      ;
    STA.W SNES_VMAIN                                           ;8089CD|8D1521  |002115;
    LDA.B #$09                                                 ;8089D0|A909    |      ;
    STA.W SNES_DMAP0                                           ;8089D2|8D0043  |004300;
    LDA.B #$18                                                 ;8089D5|A918    |      ;
    STA.W SNES_BBAD0                                           ;8089D7|8D0143  |004301;
    REP #$20                                                   ;8089DA|C220    |      ;
    LDA.W #$8424                                               ;8089DC|A92484  |      ;
    STA.W SNES_A1T0L                                           ;8089DF|8D0243  |004302;
    SEP #$20                                                   ;8089E2|E220    |      ;
    LDA.B #$80                                                 ;8089E4|A980    |      ;
    STA.W SNES_A1B0                                            ;8089E6|8D0443  |004304;
    REP #$20                                                   ;8089E9|C220    |      ;
    LDA.W #$0FFF                                               ;8089EB|A9FF0F  |      ;
    STA.W SNES_DAS0L                                           ;8089EE|8D0543  |004305;
    SEP #$20                                                   ;8089F1|E220    |      ;
    LDA.B #$01                                                 ;8089F3|A901    |      ;
    STA.W SNES_MDMAEN                                          ;8089F5|8D0B42  |00420B;
    RTL                                                        ;8089F8|6B      |      ;
 
 
fCore_GetRandomNumber:
    SEP #$30                                                   ;8089F9|E230    |      ; A: nMaxValue, return A: nRandomNumber (0x00-nMaxValue)
    STA.B strcVariables.n8Temp1                                ;8089FB|8592    |000092;
    PHA                                                        ;8089FD|48      |      ;
    STZ.B strcVariables.n8Temp2                                ;8089FE|6493    |000093;
    REP #$20                                                   ;808A00|C220    |      ;
    LDA.W #$00FF                                               ;808A02|A9FF00  |      ;
    STA.B strcVariables.n16Temp1                               ;808A05|857E    |00007E;
    LDA.B strcVariables.n8Temp1                                ;808A07|A592    |000092;
    STA.B strcVariables.n16Temp2                               ;808A09|8580    |000080;
    JSL.L fMathDivide                                          ;808A0B|22828083|838082;
    SEP #$20                                                   ;808A0F|E220    |      ;
    STA.B strcVariables.n8Temp2                                ;808A11|8593    |000093;
    JSL.L fGetRandomNumber                                     ;808A13|22388183|838138;
    SEP #$30                                                   ;808A17|E230    |      ;
    STA.B strcVariables.n8Temp3                                ;808A19|8594    |000094;
    PLA                                                        ;808A1B|68      |      ;
    DEC A                                                      ;808A1C|3A      |      ;
    STA.B strcVariables.n8Temp1                                ;808A1D|8592    |000092;
    LDX.B #$00                                                 ;808A1F|A200    |      ;
    LDA.B strcVariables.n8Temp2                                ;808A21|A593    |000093;
 
  - CMP.B strcVariables.n8Temp3                                ;808A23|C594    |000094;
    BCS +                                                      ;808A25|B00A    |808A31;
    INX                                                        ;808A27|E8      |      ;
    CPX.B strcVariables.n8Temp1                                ;808A28|E492    |000092;
    BEQ +                                                      ;808A2A|F005    |808A31;
    CLC                                                        ;808A2C|18      |      ;
    ADC.B strcVariables.n8Temp2                                ;808A2D|6593    |000093;
    BRA -                                                      ;808A2F|80F2    |808A23;
 
 
  + TXA                                                        ;808A31|8A      |      ;
    RTL                                                        ;808A32|6B      |      ;
 
 
fCore_PrepareTransfer:
    REP #$30                                                   ;808A33|C230    |      ; A: nArg1, X: nArg2, $72: ptr24Destination
    PHA                                                        ;808A35|48      |      ; A -> stack1
    TXA                                                        ;808A36|8A      |      ;
    PHA                                                        ;808A37|48      |      ; X -> stack2
    SEP #$20                                                   ;808A38|E220    |      ;
    LDA.B #$00                                                 ;808A3A|A900    |      ;
    XBA                                                        ;808A3C|EB      |      ; B = 0x00
    LDA.B strcSystem.arrayIndex                                ;808A3D|A527    |000027;
    ASL A                                                      ;808A3F|0A      |      ;
    TAX                                                        ;808A40|AA      |      ;
    REP #$20                                                   ;808A41|C220    |      ;
    PLA                                                        ;808A43|68      |      ;
    STA.B strcSystem.array32,X                                 ;808A44|9532    |000032; X = $27 * 2
    TXA                                                        ;808A46|8A      |      ;
    LSR A                                                      ;808A47|4A      |      ;
    TAX                                                        ;808A48|AA      |      ;
    PLA                                                        ;808A49|68      |      ;
    SEP #$20                                                   ;808A4A|E220    |      ;
    STA.B strcSystem.array2A,X                                 ;808A4C|952A    |00002A;
    SEP #$20                                                   ;808A4E|E220    |      ;
    LDA.B #$00                                                 ;808A50|A900    |      ;
    XBA                                                        ;808A52|EB      |      ;
    LDA.B strcSystem.arrayIndex                                ;808A53|A527    |000027;
    ASL A                                                      ;808A55|0A      |      ;
    ASL A                                                      ;808A56|0A      |      ;
    ASL A                                                      ;808A57|0A      |      ;
    ASL A                                                      ;808A58|0A      |      ;
    REP #$20                                                   ;808A59|C220    |      ;
    TAX                                                        ;808A5B|AA      |      ;
    SEP #$20                                                   ;808A5C|E220    |      ;
    LDA.B strcSystem.destinationRegister                       ;808A5E|A529    |000029;
    CMP.B #$18                                                 ;808A60|C918    |      ;
    BNE .label1                                                ;808A62|D007    |808A6B;
    LDA.B #$01                                                 ;808A64|A901    |      ;
    STA.W SNES_DMAP0,X                                         ;808A66|9D0043  |004300;
    BRA .label2                                                ;808A69|8003    |808A6E;
 
 
.label1:
    STZ.W SNES_DMAP0,X                                         ;808A6B|9E0043  |004300;
 
.label2:
    LDA.B strcSystem.destinationRegister                       ;808A6E|A529    |000029;
    STA.W SNES_BBAD0,X                                         ;808A70|9D0143  |004301;
    REP #$20                                                   ;808A73|C220    |      ;
    LDA.B ptrTemp0x72                                          ;808A75|A572    |000072;
    STA.W SNES_A1T0L,X                                         ;808A77|9D0243  |004302;
    SEP #$20                                                   ;808A7A|E220    |      ;
    LDA.B ptrTemp0x72+2                                        ;808A7C|A574    |000074;
    STA.W SNES_A1B0,X                                          ;808A7E|9D0443  |004304;
    REP #$20                                                   ;808A81|C220    |      ;
    TYA                                                        ;808A83|98      |      ;
    STA.W SNES_DAS0L,X                                         ;808A84|9D0543  |004305;
    LDA.B $C7                                                  ;808A87|A5C7    |0000C7;
    SEC                                                        ;808A89|38      |      ;
    SBC.W SNES_DAS0L,X                                         ;808A8A|FD0543  |004305;
    STA.B $C7                                                  ;808A8D|85C7    |0000C7;
    TXA                                                        ;808A8F|8A      |      ;
    LSR A                                                      ;808A90|4A      |      ;
    LSR A                                                      ;808A91|4A      |      ;
    LSR A                                                      ;808A92|4A      |      ;
    LSR A                                                      ;808A93|4A      |      ;
    TAX                                                        ;808A94|AA      |      ;
    SEP #$20                                                   ;808A95|E220    |      ;
    LDA.B strcSystem.DMAchannelFlags                           ;808A97|A528    |000028;
    ORA.L DMA_Channels_Flag_Table,X                            ;808A99|1F3C8B80|808B3C;
    STA.B strcSystem.DMAchannelFlags                           ;808A9D|8528    |000028;
    RTL                                                        ;808A9F|6B      |      ;
 
 
fCore_RemoveTransfer:
    SEP #$20                                                   ;808AA0|E220    |      ;
    REP #$10                                                   ;808AA2|C210    |      ;
    LDA.B strcSystem.arrayIndex                                ;808AA4|A527    |000027;
    TAX                                                        ;808AA6|AA      |      ;
    LDA.L DMA_Channels_Flag_Table,X                            ;808AA7|BF3C8B80|808B3C;
    EOR.B #$FF                                                 ;808AAB|49FF    |      ;
    AND.B strcSystem.DMAchannelFlags                           ;808AAD|2528    |000028;
    STA.B strcSystem.DMAchannelFlags                           ;808AAF|8528    |000028;
    RTL                                                        ;808AB1|6B      |      ;
 
 
fCore_StartPreparedTransfer:
    SEP #$30                                                   ;808AB2|E230    |      ;
    LDA.B strcSystem.arrayIndex                                ;808AB4|A527    |000027;
    PHA                                                        ;808AB6|48      |      ;
    ASL A                                                      ;808AB7|0A      |      ;
    ASL A                                                      ;808AB8|0A      |      ;
    ASL A                                                      ;808AB9|0A      |      ;
    ASL A                                                      ;808ABA|0A      |      ;
    TAX                                                        ;808ABB|AA      |      ;
    LDA.W SNES_BBAD0,X                                         ;808ABC|BD0143  |004301;
    CMP.B #$18                                                 ;808ABF|C918    |      ;
    BNE .label1                                                ;808AC1|D012    |808AD5;
    PLX                                                        ;808AC3|FA      |      ;
    LDA.B strcSystem.array2A,X                                 ;808AC4|B52A    |00002A;
    STA.W SNES_VMAIN                                           ;808AC6|8D1521  |002115;
    REP #$20                                                   ;808AC9|C220    |      ;
    TXA                                                        ;808ACB|8A      |      ;
    ASL A                                                      ;808ACC|0A      |      ;
    TAX                                                        ;808ACD|AA      |      ;
    LDA.B strcSystem.array32,X                                 ;808ACE|B532    |000032;
    STA.W SNES_VMADDL                                          ;808AD0|8D1621  |002116;
    BRA .label2                                                ;808AD3|8009    |808ADE;
 
 
.label1:
    PLX                                                        ;808AD5|FA      |      ;
    TXA                                                        ;808AD6|8A      |      ;
    ASL A                                                      ;808AD7|0A      |      ;
    TAX                                                        ;808AD8|AA      |      ;
    LDA.B strcSystem.array32,X                                 ;808AD9|B532    |000032;
    STA.W SNES_CGADD                                           ;808ADB|8D2121  |002121;
 
.label2:
    SEP #$20                                                   ;808ADE|E220    |      ;
    TXA                                                        ;808AE0|8A      |      ;
    LSR A                                                      ;808AE1|4A      |      ;
    TAX                                                        ;808AE2|AA      |      ;
    LDA.L DMA_Channels_Flag_Table,X                            ;808AE3|BF3C8B80|808B3C;
    STA.W SNES_MDMAEN                                          ;808AE7|8D0B42  |00420B;
    STZ.B strcSystem.DMAchannelFlags                           ;808AEA|6428    |000028;
    STZ.W SNES_MDMAEN                                          ;808AEC|9C0B42  |00420B;
    RTL                                                        ;808AEF|6B      |      ;
 
 
fCore_StartTransfer:
    SEP #$30                                                   ;808AF0|E230    |      ;
    LDX.B #$00                                                 ;808AF2|A200    |      ;
 
  - LDA.L DMA_Channels_Flag_Table,X                            ;808AF4|BF3C8B80|808B3C;
    AND.B strcSystem.DMAchannelFlags                           ;808AF8|2528    |000028;
    BEQ +                                                      ;808AFA|F035    |808B31;
    PHX                                                        ;808AFC|DA      |      ;
    TXA                                                        ;808AFD|8A      |      ;
    ASL A                                                      ;808AFE|0A      |      ;
    ASL A                                                      ;808AFF|0A      |      ;
    ASL A                                                      ;808B00|0A      |      ;
    ASL A                                                      ;808B01|0A      |      ;
    TAX                                                        ;808B02|AA      |      ;
    LDA.W SNES_BBAD0,X                                         ;808B03|BD0143  |004301;
    CMP.B #$18                                                 ;808B06|C918    |      ;
    BNE .label2                                                ;808B08|D012    |808B1C;
    PLX                                                        ;808B0A|FA      |      ;
    LDA.B strcSystem.array2A,X                                 ;808B0B|B52A    |00002A;
    STA.W SNES_VMAIN                                           ;808B0D|8D1521  |002115;
    REP #$20                                                   ;808B10|C220    |      ;
    TXA                                                        ;808B12|8A      |      ;
    ASL A                                                      ;808B13|0A      |      ;
    TAX                                                        ;808B14|AA      |      ;
    LDA.B strcSystem.array32,X                                 ;808B15|B532    |000032;
    STA.W SNES_VMADDL                                          ;808B17|8D1621  |002116;
    BRA .label3                                                ;808B1A|8009    |808B25;
 
 
.label2:
    PLX                                                        ;808B1C|FA      |      ;
    TXA                                                        ;808B1D|8A      |      ;
    ASL A                                                      ;808B1E|0A      |      ;
    TAX                                                        ;808B1F|AA      |      ;
    LDA.B strcSystem.array32,X                                 ;808B20|B532    |000032;
    STA.W SNES_CGADD                                           ;808B22|8D2121  |002121;
 
.label3:
    SEP #$20                                                   ;808B25|E220    |      ;
    TXA                                                        ;808B27|8A      |      ;
    LSR A                                                      ;808B28|4A      |      ;
    TAX                                                        ;808B29|AA      |      ;
    LDA.L DMA_Channels_Flag_Table,X                            ;808B2A|BF3C8B80|808B3C;
    STA.W SNES_MDMAEN                                          ;808B2E|8D0B42  |00420B;
 
  + INX                                                        ;808B31|E8      |      ;
    CPX.B #$08                                                 ;808B32|E008    |      ;
    BNE -                                                      ;808B34|D0BE    |808AF4;
    STZ.B strcSystem.DMAchannelFlags                           ;808B36|6428    |000028;
    STZ.W SNES_MDMAEN                                          ;808B38|9C0B42  |00420B;
    RTL                                                        ;808B3B|6B      |      ;
 
 
DMA_Channels_Flag_Table:
    db $01,$02,$04,$08,$10,$20,$40,$80                         ;808B3C|        |      ;
 
Table_OBSEL_Presets:
    db $60,$60,$60,$60,$60,$60,$03,$03,$03,$03,$63             ;808B44|        |      ;
 
Table_BGMODE_Presets:
    db $09,$09,$09,$09,$09,$09,$09,$09,$09,$09,$09             ;808B4F|        |      ;
 
Table_BG1SC_Presets:
    db $63,$63,$63,$63,$13,$13,$51,$51,$51,$51,$51             ;808B5A|        |      ;
 
Table_BG2SC_Presets:
    db $72,$72,$72,$73,$63,$63,$59,$59,$59,$59,$59             ;808B65|        |      ;
 
Table_BG3SC_Presets:
    db $7A,$7A,$7A,$7A,$7A,$7A,$09,$09,$0A,$0A,$09             ;808B70|        |      ;
 
Table_BG4SC_Presets:
    db $7C,$7C,$7C,$7C,$7C,$7C,$70,$70,$70,$70,$70             ;808B7B|        |      ;
 
Table_BG12NBA_Presets:
    db $22,$22,$22,$22,$22,$22,$11,$11,$11,$11,$11             ;808B86|        |      ;
 
Table_BG34NBA_Presets:
    db $55,$55,$55,$55,$55,$22,$00,$00,$00,$00,$00             ;808B91|        |      ;
 
Table_TM_Presets:
    db $15,$17,$17,$17,$17,$17,$13,$13,$13,$13,$15             ;808B9C|        |      ;
 
Table_TS_Presets:
    db $02,$00,$00,$00,$00,$00,$04,$04,$04,$04,$00             ;808BA7|        |      ;
 
Table_TMW_Presets:
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00             ;808BB2|        |      ;
 
Table_TSW_Presets:
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00             ;808BBD|        |      ;
 
Table_CGWSEL_Presets:
    db $02,$02,$02,$02,$02,$02,$00,$02,$02,$02,$00             ;808BC8|        |      ;
 
Table_CGADSUB_Presets:
    db $73,$73,$73,$73,$73,$73,$00,$53,$13,$53,$00             ;808BD3|        |      ;
 
Table_SETINI_Presets:
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00             ;808BDE|        |      ;
 
Table_W12SEL_Presets:
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00             ;808BE9|        |      ;
 
Table_W34SEL_Presets:
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00             ;808BF4|        |      ;
 
Table_WOBJSEL_Presets:
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00             ;808BFF|        |      ;
 
Table_WH0_Presets:
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00             ;808C0A|        |      ;
 
Table_WH1_Presets:
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00             ;808C15|        |      ;
 
Table_WH2_Presets:
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00             ;808C20|        |      ;
 
Table_WH3_Presets:
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00             ;808C2B|        |      ;
 
Table_WBGLOG_Presets:
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00             ;808C36|        |      ;
 
Table_WOBJLOG_Presets:
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00             ;808C41|        |      ;
 
fCore_InitializeScreenStatus:
    PHP                                                        ;808C4C|08      |      ;
    REP #$10                                                   ;808C4D|C210    |      ;
    SEP #$20                                                   ;808C4F|E220    |      ;
    STZ.B strcSystem.INIDISP                                   ;808C51|6424    |000024;
    REP #$20                                                   ;808C53|C220    |      ;
    PLP                                                        ;808C55|28      |      ;
    JMP.W fCore_SetForceBlank                                  ;808C56|4C0F8E  |808E0F;
 
 
fCore_ManageGraphicsPresets:
    PHP                                                        ;808C59|08      |      ;
    SEP #$30                                                   ;808C5A|E230    |      ;
    STA.L $8019B6                                              ;808C5C|8FB61980|8019B6;
    TAX                                                        ;808C60|AA      |      ;
    LDA.L Table_OBSEL_Presets,X                                ;808C61|BF448B80|808B44;
    STA.L $8019B7                                              ;808C65|8FB71980|8019B7;
    STA.L SNES_OBSEL                                           ;808C69|8F012100|002101;
    XBA                                                        ;808C6D|EB      |      ;
    REP #$20                                                   ;808C6E|C220    |      ;
    AND.W #$0700                                               ;808C70|290007  |      ;
    ASL A                                                      ;808C73|0A      |      ;
    ASL A                                                      ;808C74|0A      |      ;
    ASL A                                                      ;808C75|0A      |      ;
    ASL A                                                      ;808C76|0A      |      ;
    ASL A                                                      ;808C77|0A      |      ;
    STA.L $8019EA                                              ;808C78|8FEA1980|8019EA;
    SEP #$20                                                   ;808C7C|E220    |      ;
    LDA.L Table_BGMODE_Presets,X                               ;808C7E|BF4F8B80|808B4F;
    STA.L $8019B8                                              ;808C82|8FB81980|8019B8;
    STA.L SNES_BGMODE                                          ;808C86|8F052100|002105;
    STZ.W $19E2                                                ;808C8A|9CE219  |0019E2;
    STZ.W $19E4                                                ;808C8D|9CE419  |0019E4;
    STZ.W $19E6                                                ;808C90|9CE619  |0019E6;
    STZ.W $19E8                                                ;808C93|9CE819  |0019E8;
    LDA.L Table_BG1SC_Presets,X                                ;808C96|BF5A8B80|808B5A;
    STA.L $8019BA                                              ;808C9A|8FBA1980|8019BA;
    STA.L SNES_BG1SC                                           ;808C9E|8F072100|002107;
    AND.B #$FC                                                 ;808CA2|29FC    |      ;
    STA.L $8019E3                                              ;808CA4|8FE31980|8019E3;
    LDA.L Table_BG2SC_Presets,X                                ;808CA8|BF658B80|808B65;
    STA.L $8019BB                                              ;808CAC|8FBB1980|8019BB;
    STA.L SNES_BG2SC                                           ;808CB0|8F082100|002108;
    AND.B #$FC                                                 ;808CB4|29FC    |      ;
    STA.L $8019E5                                              ;808CB6|8FE51980|8019E5;
    LDA.L Table_BG3SC_Presets,X                                ;808CBA|BF708B80|808B70;
    STA.L $8019BC                                              ;808CBE|8FBC1980|8019BC;
    STA.L SNES_BG3SC                                           ;808CC2|8F092100|002109;
    AND.B #$FC                                                 ;808CC6|29FC    |      ;
    STA.L $8019E7                                              ;808CC8|8FE71980|8019E7;
    LDA.L Table_BG4SC_Presets,X                                ;808CCC|BF7B8B80|808B7B;
    STA.L $8019BD                                              ;808CD0|8FBD1980|8019BD;
    STA.L SNES_BG4SC                                           ;808CD4|8F0A2100|00210A;
    AND.B #$FC                                                 ;808CD8|29FC    |      ;
    STA.L $8019E9                                              ;808CDA|8FE91980|8019E9;
    LDA.L Table_BG12NBA_Presets,X                              ;808CDE|BF868B80|808B86;
    STA.L $8019BE                                              ;808CE2|8FBE1980|8019BE;
    STA.L SNES_BG12NBA                                         ;808CE6|8F0B2100|00210B;
    LDA.L Table_BG34NBA_Presets,X                              ;808CEA|BF918B80|808B91;
    STA.L $8019BF                                              ;808CEE|8FBF1980|8019BF;
    STA.L SNES_BG34NBA                                         ;808CF2|8F0C2100|00210C;
    REP #$20                                                   ;808CF6|C220    |      ;
    LDA.W #$0000                                               ;808CF8|A90000  |      ;
    STA.L $8019C0                                              ;808CFB|8FC01980|8019C0;
    STA.L $8019C2                                              ;808CFF|8FC21980|8019C2;
    STA.L $8019C4                                              ;808D03|8FC41980|8019C4;
    STA.L $8019C6                                              ;808D07|8FC61980|8019C6;
    STA.L $8019C8                                              ;808D0B|8FC81980|8019C8;
    STA.L $8019CA                                              ;808D0F|8FCA1980|8019CA;
    STA.L $8019CC                                              ;808D13|8FCC1980|8019CC;
    STA.L $8019CE                                              ;808D17|8FCE1980|8019CE;
    SEP #$20                                                   ;808D1B|E220    |      ;
    BIT.B strcSystem.INIDISP                                   ;808D1D|2424    |000024;
    BPL +                                                      ;808D1F|101A    |808D3B;
    PHX                                                        ;808D21|DA      |      ;
    LDX.B #$00                                                 ;808D22|A200    |      ;
 
  - STA.L SNES_BG1HOFS,X                                       ;808D24|9F0D2100|00210D;
    STA.L SNES_BG1HOFS,X                                       ;808D28|9F0D2100|00210D;
    STA.L SNES_BG1VOFS,X                                       ;808D2C|9F0E2100|00210E;
    STA.L SNES_BG1VOFS,X                                       ;808D30|9F0E2100|00210E;
    INX                                                        ;808D34|E8      |      ;
    INX                                                        ;808D35|E8      |      ;
    CPX.B #$08                                                 ;808D36|E008    |      ;
    BNE -                                                      ;808D38|D0EA    |808D24;
    PLX                                                        ;808D3A|FA      |      ;
 
  + STA.L $8019D0                                              ;808D3B|8FD01980|8019D0;
    STA.L SNES_M7SEL                                           ;808D3F|8F1A2100|00211A;
    LDA.L Table_W12SEL_Presets,X                               ;808D43|BFE98B80|808BE9;
    STA.L $8019D1                                              ;808D47|8FD11980|8019D1;
    STA.L SNES_W12SEL                                          ;808D4B|8F232100|002123;
    LDA.L Table_W34SEL_Presets,X                               ;808D4F|BFF48B80|808BF4;
    STA.L $8019D2                                              ;808D53|8FD21980|8019D2;
    STA.L SNES_W34SEL                                          ;808D57|8F242100|002124;
    LDA.L Table_WOBJSEL_Presets,X                              ;808D5B|BFFF8B80|808BFF;
    STA.L $8019D3                                              ;808D5F|8FD31980|8019D3;
    STA.L SNES_WOBJSEL                                         ;808D63|8F252100|002125;
    LDA.L Table_WBGLOG_Presets,X                               ;808D67|BF368C80|808C36;
    STA.L $8019D8                                              ;808D6B|8FD81980|8019D8;
    STA.L SNES_WBGLOG                                          ;808D6F|8F2A2100|00212A;
    LDA.L Table_WOBJLOG_Presets,X                              ;808D73|BF418C80|808C41;
    STA.L $8019D9                                              ;808D77|8FD91980|8019D9;
    STA.L SNES_WOBJLOG                                         ;808D7B|8F2B2100|00212B;
    LDA.L Table_WH0_Presets,X                                  ;808D7F|BF0A8C80|808C0A;
    STA.L $8019D4                                              ;808D83|8FD41980|8019D4;
    STA.L SNES_WH0                                             ;808D87|8F262100|002126;
    LDA.L Table_WH1_Presets,X                                  ;808D8B|BF158C80|808C15;
    STA.L $8019D5                                              ;808D8F|8FD51980|8019D5;
    STA.L SNES_WH1                                             ;808D93|8F272100|002127;
    LDA.L Table_WH2_Presets,X                                  ;808D97|BF208C80|808C20;
    STA.L $8019D6                                              ;808D9B|8FD61980|8019D6;
    STA.L SNES_WH2                                             ;808D9F|8F282100|002128;
    LDA.L Table_WH3_Presets,X                                  ;808DA3|BF2B8C80|808C2B;
    STA.L $8019D7                                              ;808DA7|8FD71980|8019D7;
    STA.L SNES_WH3                                             ;808DAB|8F292100|002129;
    LDA.L Table_TM_Presets,X                                   ;808DAF|BF9C8B80|808B9C;
    STA.L $8019DA                                              ;808DB3|8FDA1980|8019DA;
    STA.L SNES_TM                                              ;808DB7|8F2C2100|00212C;
    LDA.L Table_TS_Presets,X                                   ;808DBB|BFA78B80|808BA7;
    STA.L $8019DB                                              ;808DBF|8FDB1980|8019DB;
    STA.L SNES_TS                                              ;808DC3|8F2D2100|00212D;
    LDA.L Table_TMW_Presets,X                                  ;808DC7|BFB28B80|808BB2;
    STA.L $8019DC                                              ;808DCB|8FDC1980|8019DC;
    STA.L SNES_TMW                                             ;808DCF|8F2E2100|00212E;
    LDA.L Table_TSW_Presets,X                                  ;808DD3|BFBD8B80|808BBD;
    STA.L $8019DD                                              ;808DD7|8FDD1980|8019DD;
    STA.L SNES_TSW                                             ;808DDB|8F2F2100|00212F;
    LDA.L Table_CGWSEL_Presets,X                               ;808DDF|BFC88B80|808BC8;
    STA.L $8019DE                                              ;808DE3|8FDE1980|8019DE;
    STA.L SNES_CGWSEL                                          ;808DE7|8F302100|002130;
    LDA.L Table_CGADSUB_Presets,X                              ;808DEB|BFD38B80|808BD3;
    STA.L $8019DF                                              ;808DEF|8FDF1980|8019DF;
    STA.L SNES_CGADSUB                                         ;808DF3|8F312100|002131;
    LDA.B #$E0                                                 ;808DF7|A9E0    |      ;
    STA.L $8019E0                                              ;808DF9|8FE01980|8019E0;
    STA.L SNES_COLDATA                                         ;808DFD|8F322100|002132;
    LDA.L Table_SETINI_Presets,X                               ;808E01|BFDE8B80|808BDE;
    STA.L $8019E1                                              ;808E05|8FE11980|8019E1;
    STA.L SNES_SETINI                                          ;808E09|8F332100|002133;
    PLP                                                        ;808E0D|28      |      ;
    RTL                                                        ;808E0E|6B      |      ;
 
 
fCore_SetForceBlank:
    PHP                                                        ;808E0F|08      |      ;
    SEP #$20                                                   ;808E10|E220    |      ;
    LDA.B strcSystem.INIDISP                                   ;808E12|A524    |000024;
    ORA.B #!INIDISP_FORCEBLANK|!INIDISP_BRIGHTNESS0                                                 
    STA.B strcSystem.INIDISP                                   ;808E16|8524    |000024;
    STA.L SNES_INIDISP                                         ;808E18|8F002100|002100;
    PLP                                                        ;808E1C|28      |      ;
    RTL                                                        ;808E1D|6B      |      ;
 
 
fCore_ResetForceBlank:
    PHP                                                        ;808E1E|08      |      ;
    SEP #$20                                                   ;808E1F|E220    |      ;
    LDA.B strcSystem.INIDISP                                   ;808E21|A524    |000024;
    AND.B #!INIDISP_BRIGHTNESS15                                                 
    STA.B strcSystem.INIDISP                                   ;808E25|8524    |000024;
    STA.L SNES_INIDISP                                         ;808E27|8F002100|002100;
    PLP                                                        ;808E2B|28      |      ;
    RTL                                                        ;808E2C|6B      |      ;
 
 
fCore_SetBrightness:
    PHP                                                        ;808E2D|08      |      ; A: nBrightness
    SEP #$20                                                   ;808E2E|E220    |      ;
    AND.B #$0F                                                 ;808E30|290F    |      ;
    BNE +                                                      ;808E32|D002    |808E36;
    LDA.B #$80                                                 ;808E34|A980    |      ;
 
  + STA.L strcVariables.n16Temp1+$20000                        ;808E36|8F7E0080|80007E;
    LDA.B strcSystem.INIDISP                                   ;808E3A|A524    |000024;
    AND.B #!INIDISP_FORCEBLANK                                                 
    ORA.B strcVariables.n16Temp1                               ;808E3E|057E    |00007E;
    STA.B strcSystem.INIDISP                                   ;808E40|8524    |000024;
    STA.L SNES_INIDISP                                         ;808E42|8F002100|002100;
    PLP                                                        ;808E46|28      |      ;
    RTL                                                        ;808E47|6B      |      ;
 
 
fCore_Store0x72To0x42AtIndex:
    SEP #$30                                                   ;808E48|E230    |      ; A: nValue1, X nIndex, Y: nValue2, Y, $72: ptr24
    STA.W strcPalette.animColorIndex,X                                 ;808E4A|9D5A01  |00015A;
    TYA                                                        ;808E4D|98      |      ;
    STA.W strcPalette.animPaletteRow,X                                 ;808E4E|9D6A01  |00016A;
    STZ.W strcPalette.animTimer,X                                 ;808E51|9E4A01  |00014A;
    REP #$20                                                   ;808E54|C220    |      ;
    TXA                                                        ;808E56|8A      |      ;
    STA.B strcVariables.n16Temp1                               ;808E57|857E    |00007E;
    ASL A                                                      ;808E59|0A      |      ;
    CLC                                                        ;808E5A|18      |      ;
    ADC.B strcVariables.n16Temp1                               ;808E5B|657E    |00007E; X * 3
    TAX                                                        ;808E5D|AA      |      ;
    LDA.B ptrTemp0x72                                          ;808E5E|A572    |000072;
    STA.B ptrPaletteAnimScripts,X                                     ;808E60|9542    |000042; $72 -> $42
    SEP #$20                                                   ;808E62|E220    |      ;
    LDA.B ptrTemp0x72+2                                        ;808E64|A574    |000074;
    STA.B ptrPaletteAnimScripts+2,X                                   ;808E66|9544    |000044;
    RTL                                                        ;808E68|6B      |      ;
 
 
fPalette_ProcessColorAnimSlots:
    REP #$30                                                   ;808E69|C230    |      ;
    SEP #$20                                                   ;808E6B|E220    |      ;
    STZ.B strcVariables.n8Temp1                                ;808E6D|6492    |000092;
    STZ.B strcVariables.n8Temp2                                ;808E6F|6493    |000093;
    LDY.W #$0000                                               ;808E71|A00000  |      ;
    REP #$20                                                   ;808E74|C220    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;808E76|AD9601  |000196;
    AND.W #$000A                                               ;808E79|290A00  |      ;
    BNE .label1                                                ;808E7C|D003    |808E81;
    LDY.W #$0004                                               ;808E7E|A00400  |      ;
 
.label1:
    REP #$20                                                   ;808E81|C220    |      ;
    TYA                                                        ;808E83|98      |      ;
    STA.B strcVariables.n16Temp1                               ;808E84|857E    |00007E;
    ASL A                                                      ;808E86|0A      |      ;
    CLC                                                        ;808E87|18      |      ;
    ADC.B strcVariables.n16Temp1                               ;808E88|657E    |00007E;
    TAX                                                        ;808E8A|AA      |      ;
    LDA.B ptrPaletteAnimScripts,X                                     ;808E8B|B542    |000042;
    BNE .label2                                                ;808E8D|D00E    |808E9D;
    SEP #$20                                                   ;808E8F|E220    |      ;
    LDA.B ptrPaletteAnimScripts+2,X                                   ;808E91|B544    |000044;
    BNE .label2                                                ;808E93|D008    |808E9D;
    CPY.W #$0004                                               ;808E95|C00400  |      ;
    BCC .label6                                                ;808E98|907F    |808F19;
    JMP.W .label7                                              ;808E9A|4C2C8F  |808F2C;
 
 
.label2:
    SEP #$20                                                   ;808E9D|E220    |      ;
    LDA.B #$01                                                 ;808E9F|A901    |      ;
    STA.B strcVariables.n8Temp2                                ;808EA1|8593    |000093;
    REP #$20                                                   ;808EA3|C220    |      ;
    PHY                                                        ;808EA5|5A      |      ;
    LDA.B ptrPaletteAnimScripts,X                                     ;808EA6|B542    |000042;
    STA.B ptrTemp0x72                                          ;808EA8|8572    |000072;
    SEP #$20                                                   ;808EAA|E220    |      ;
    LDA.B ptrPaletteAnimScripts+2,X                                   ;808EAC|B544    |000044;
    STA.B ptrTemp0x72+2                                        ;808EAE|8574    |000074;
    REP #$20                                                   ;808EB0|C220    |      ;
    LDA.B [ptrTemp0x72]                                        ;808EB2|A772    |000072;
    CMP.W #$FFFF                                               ;808EB4|C9FFFF  |      ;
    BNE .notFFFF                                               ;808EB7|D003    |808EBC;
    JMP.W .noMoreData                                          ;808EB9|4C578F  |808F57;
 
 
.notFFFF:
    CMP.W #$FFFE                                               ;808EBC|C9FEFF  |      ;
    BNE .loop                                                  ;808EBF|D003    |808EC4;
    JMP.W .loadNextPointer                                     ;808EC1|4C628F  |808F62;
 
 
.loop:
    PLY                                                        ;808EC4|7A      |      ;
    TYX                                                        ;808EC5|BB      |      ;
    SEP #$20                                                   ;808EC6|E220    |      ;
    LDA.W strcPalette.animTimer,X                                 ;808EC8|BD4A01  |00014A;
    BEQ .label5                                                ;808ECB|F003    |808ED0;
    JMP.W .label8                                              ;808ECD|4C528F  |808F52;
 
 
.label5:
    PHY                                                        ;808ED0|5A      |      ;
    TYX                                                        ;808ED1|BB      |      ;
    LDA.B #$00                                                 ;808ED2|A900    |      ;
    XBA                                                        ;808ED4|EB      |      ;
    LDA.W strcPalette.animPaletteRow,X                                 ;808ED5|BD6A01  |00016A;
    REP #$20                                                   ;808ED8|C220    |      ;
    PHA                                                        ;808EDA|48      |      ;
    TYX                                                        ;808EDB|BB      |      ;
    SEP #$20                                                   ;808EDC|E220    |      ;
    LDA.B #$00                                                 ;808EDE|A900    |      ;
    XBA                                                        ;808EE0|EB      |      ;
    LDA.W strcPalette.animColorIndex,X                                 ;808EE1|BD5A01  |00015A;
    REP #$20                                                   ;808EE4|C220    |      ;
    PHA                                                        ;808EE6|48      |      ;
    LDA.B [ptrTemp0x72]                                        ;808EE7|A772    |000072;
    PLX                                                        ;808EE9|FA      |      ;
    PLY                                                        ;808EEA|7A      |      ;
    JSL.L fPalette_WriteColorToBuffer                               ;808EEB|226F9180|80916F;
    REP #$30                                                   ;808EEF|C230    |      ;
    PLY                                                        ;808EF1|7A      |      ;
    PHY                                                        ;808EF2|5A      |      ;
    TYX                                                        ;808EF3|BB      |      ;
    LDY.W #$0002                                               ;808EF4|A00200  |      ;
    SEP #$20                                                   ;808EF7|E220    |      ;
    LDA.B [ptrTemp0x72],Y                                      ;808EF9|B772    |000072;
    STA.W strcPalette.animTimer,X                                 ;808EFB|9D4A01  |00014A;
    REP #$20                                                   ;808EFE|C220    |      ;
    PLY                                                        ;808F00|7A      |      ;
    TYA                                                        ;808F01|98      |      ;
    STA.B strcVariables.n16Temp1                               ;808F02|857E    |00007E;
    ASL A                                                      ;808F04|0A      |      ;
    CLC                                                        ;808F05|18      |      ;
    ADC.B strcVariables.n16Temp1                               ;808F06|657E    |00007E;
    TAX                                                        ;808F08|AA      |      ;
    LDA.B ptrPaletteAnimScripts,X                                     ;808F09|B542    |000042;
    CLC                                                        ;808F0B|18      |      ;
    ADC.W #$0003                                               ;808F0C|690300  |      ;
    STA.B ptrPaletteAnimScripts,X                                     ;808F0F|9542    |000042;
    SEP #$20                                                   ;808F11|E220    |      ;
    LDA.B ptrPaletteAnimScripts+2,X                                   ;808F13|B544    |000044;
    ADC.B #$00                                                 ;808F15|6900    |      ;
    STA.B ptrPaletteAnimScripts+2,X                                   ;808F17|9544    |000044;
 
.label6:
    REP #$20                                                   ;808F19|C220    |      ;
    TYA                                                        ;808F1B|98      |      ;
    STA.B strcVariables.n16Temp1                               ;808F1C|857E    |00007E;
    ASL A                                                      ;808F1E|0A      |      ;
    CLC                                                        ;808F1F|18      |      ;
    ADC.B strcVariables.n16Temp1                               ;808F20|657E    |00007E;
    TAX                                                        ;808F22|AA      |      ;
    INY                                                        ;808F23|C8      |      ;
    CPY.W #$0010                                               ;808F24|C01000  |      ;
    BEQ .label7                                                ;808F27|F003    |808F2C;
    JMP.W .label1                                              ;808F29|4C818E  |808E81;
 
 
.label7:
    SEP #$20                                                   ;808F2C|E220    |      ;
    LDA.B strcVariables.n8Temp2                                ;808F2E|A593    |000093;
    BEQ .return                                                ;808F30|F01F    |808F51;
    LDA.B #$05                                                 ;808F32|A905    |      ;
    STA.B strcSystem.arrayIndex                                ;808F34|8527    |000027;
    LDA.B #$22                                                 ;808F36|A922    |      ;
    STA.B strcSystem.destinationRegister                       ;808F38|8529    |000029;
    REP #$20                                                   ;808F3A|C220    |      ;
    LDY.W #$0100                                               ;808F3C|A00001  |      ;
    LDX.W #$0000                                               ;808F3F|A20000  |      ;
    LDA.W #$0900                                               ;808F42|A90009  |      ;
    STA.B ptrTemp0x72                                          ;808F45|8572    |000072;
    SEP #$20                                                   ;808F47|E220    |      ;
    LDA.B #$7F                                                 ;808F49|A97F    |      ;
    STA.B ptrTemp0x72+2                                        ;808F4B|8574    |000074; $72 = 0x7F0900 (sPalette_7F0900)
    JSL.L fCore_PrepareTransfer                                ;808F4D|22338A80|808A33;
 
.return:
    RTL                                                        ;808F51|6B      |      ;
 
 
.label8:
    DEC.W strcPalette.animTimer,X                                 ;808F52|DE4A01  |00014A;
    BRA .label6                                                ;808F55|80C2    |808F19;
 
 
.noMoreData:
    REP #$20                                                   ;808F57|C220    |      ;
    STZ.B ptrPaletteAnimScripts,X                                     ;808F59|7442    |000042;
    SEP #$20                                                   ;808F5B|E220    |      ;
    STZ.B ptrPaletteAnimScripts+2,X                                   ;808F5D|7444    |000044;
    JMP.W .loop                                                ;808F5F|4CC48E  |808EC4;
 
 
.loadNextPointer:
    REP #$20                                                   ;808F62|C220    |      ;
    LDY.W #$0002                                               ;808F64|A00200  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;808F67|B772    |000072;
    STA.B ptrPaletteAnimScripts,X                                     ;808F69|9542    |000042;
    INY                                                        ;808F6B|C8      |      ;
    INY                                                        ;808F6C|C8      |      ;
    SEP #$20                                                   ;808F6D|E220    |      ;
    LDA.B [ptrTemp0x72],Y                                      ;808F6F|B772    |000072;
    STA.B ptrPaletteAnimScripts+2,X                                   ;808F71|9544    |000044;
    REP #$20                                                   ;808F73|C220    |      ;
    LDA.B ptrPaletteAnimScripts,X                                     ;808F75|B542    |000042;
    STA.B ptrTemp0x72                                          ;808F77|8572    |000072;
    SEP #$20                                                   ;808F79|E220    |      ;
    LDA.B ptrPaletteAnimScripts+2,X                                   ;808F7B|B544    |000044;
    STA.B ptrTemp0x72+2                                        ;808F7D|8574    |000074;
    JMP.W .loop                                                ;808F7F|4CC48E  |808EC4;
 
 
fCore_Zero0x42PtrAtIndex:
    REP #$30                                                   ;808F82|C230    |      ; A: nIndex
    STA.B strcVariables.n16Temp1                               ;808F84|857E    |00007E;
    ASL A                                                      ;808F86|0A      |      ;
    CLC                                                        ;808F87|18      |      ;
    ADC.B strcVariables.n16Temp1                               ;808F88|657E    |00007E;
    TAX                                                        ;808F8A|AA      |      ;
    STZ.B ptrPaletteAnimScripts,X                                     ;808F8B|7442    |000042;
    SEP #$20                                                   ;808F8D|E220    |      ;
    STZ.B ptrPaletteAnimScripts+2,X                                   ;808F8F|7444    |000044;
    RTL                                                        ;808F91|6B      |      ;
 
 
fCore_Zero0x42PtrFromIndex:
    REP #$30                                                   ;808F92|C230    |      ; A: nIndex
 
  - REP #$20                                                   ;808F94|C220    |      ;
    TYA                                                        ;808F96|98      |      ;
    STA.B strcVariables.n16Temp1                               ;808F97|857E    |00007E;
    ASL A                                                      ;808F99|0A      |      ;
    CLC                                                        ;808F9A|18      |      ;
    ADC.B strcVariables.n16Temp1                               ;808F9B|657E    |00007E;
    TAX                                                        ;808F9D|AA      |      ;
    STZ.B ptrPaletteAnimScripts,X                                     ;808F9E|7442    |000042;
    SEP #$20                                                   ;808FA0|E220    |      ;
    STZ.B ptrPaletteAnimScripts+2,X                                   ;808FA2|7444    |000044;
    INY                                                        ;808FA4|C8      |      ;
    CPY.W #$0010                                               ;808FA5|C01000  |      ;
    BNE -                                                      ;808FA8|D0EA    |808F94;
    RTL                                                        ;808FAA|6B      |      ;
 
 
fCore_Zero0x42Ptr:
    REP #$30                                                   ;808FAB|C230    |      ;
    LDY.W #$0000                                               ;808FAD|A00000  |      ;
 
  - REP #$20                                                   ;808FB0|C220    |      ;
    TYA                                                        ;808FB2|98      |      ;
    STA.B strcVariables.n16Temp1                               ;808FB3|857E    |00007E;
    ASL A                                                      ;808FB5|0A      |      ;
    CLC                                                        ;808FB6|18      |      ;
    ADC.B strcVariables.n16Temp1                               ;808FB7|657E    |00007E;
    TAX                                                        ;808FB9|AA      |      ;
    STZ.B ptrPaletteAnimScripts,X                                     ;808FBA|7442    |000042;
    SEP #$20                                                   ;808FBC|E220    |      ;
    STZ.B ptrPaletteAnimScripts+2,X                                   ;808FBE|7444    |000044;
    INY                                                        ;808FC0|C8      |      ;
    CPY.W #$0010                                               ;808FC1|C01000  |      ;
    BNE -                                                      ;808FC4|D0EA    |808FB0;
    RTL                                                        ;808FC6|6B      |      ;