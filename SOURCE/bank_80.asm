 
    ORG $808000
 
 
fCore_GameStart:
    REP #$30                                                   ;808000|C230    |      ;
    SEP #$20                                                   ;808002|E220    |      ;
    LDA.B #!AREA_HOUSE1                                                 
    STA.B strcMap.loadAreaId                                   ;808006|8522    |000022;
    JSL.L fAudioEngine_MapMusicHandler                         ;808008|22DE9580|8095DE;
    JSL.L fAudioUnknown_838401                                 ;80800C|22018483|838401;
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
    JSL.L fUnknown_8096D3                                      ;80805E|22D39680|8096D3;
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
    JSL.L fCore_Unknown808E69                                  ;8080AF|22698E80|808E69;
    JSL.L fInput_Handler                                       ;8080B3|2234C084|84C034;
    JSL.L fUnknown_81A383                                      ;8080B7|2283A381|81A383;
    JSL.L fUnknownSubrutineHandler_81BFB7                      ;8080BB|22B7BF81|81BFB7;
    JSL.L fGraphics_MapScrool                                  ;8080BF|22B39580|8095B3;
    JSL.L fAI_HowToPlaySetup                                   ;8080C3|226F8184|84816F;
    JSL.L fUnknownCF_81A600                                    ;8080C7|2200A681|81A600;
    JSL.L fObject_Unknown8582C7                                ;8080CB|22C78285|8582C7;
    JSL.L fUnknown_858CB2                                      ;8080CF|22B28C85|858CB2;
    JSL.L fUnknown_8583E0                                      ;8080D3|22E08385|8583E0;
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
    JSL.L fAudioUnknown_838E32                                 ;808604|22328E83|838E32;
    JSL.L fAudio_PlayAudio_Unknown838598                       ;808608|22988583|838598;
    JSL.L fAudioUnknown_8384D3                                 ;80860C|22D38483|8384D3;
    JSL.L fCore_InitializeScreenStatus                         ;808610|224C8C80|808C4C;
    JSL.L fCore_ZeroVRAM                                       ;808614|22468880|808846;
    JSL.L fCore_ZeroOAM                                        ;808618|22878880|808887;
    JSL.L fCore_ZeroCGRAM                                      ;80861C|22808980|808980;
    JSL.L fUnknown_Zero7EA220                                  ;808620|22D78E85|858ED7;
    JSL.L fObject_ClearGameObject                              ;808624|220F8285|85820F;
    JSL.L fGameEngine_SaveCheck                                ;808628|22D4BA83|83BAD4;
    SEP #$20                                                   ;80862C|E220    |      ;
    REP #$10                                                   ;80862E|C210    |      ;
    LDA.B #$80                                                 ;808630|A980    |      ;
    STA.W SNES_INIDISP                                         ;808632|8D0021  |002100;
    STZ.W strcBGScrool.unk148                                  ;808635|9C4801  |000148;
    LDA.B #$80                                                 ;808638|A980    |      ;
    STA.W SNES_NMITIMEN                                        ;80863A|8D0042  |004200;
    STZ.W SNES_INIDISP                                         ;80863D|9C0021  |002100;
    CLI                                                        ;808640|58      |      ;
    JML.L fUnknown_82D75E                                      ;808641|5C5ED782|82D75E;
 
 
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
    JSL.L fUnknown_858E57                                      ;8086C8|22578E85|858E57;
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
    STA.W strcPalette.unk15A,X                                 ;808E4A|9D5A01  |00015A;
    TYA                                                        ;808E4D|98      |      ;
    STA.W strcPalette.unk16A,X                                 ;808E4E|9D6A01  |00016A;
    STZ.W strcPalette.unk14A,X                                 ;808E51|9E4A01  |00014A;
    REP #$20                                                   ;808E54|C220    |      ;
    TXA                                                        ;808E56|8A      |      ;
    STA.B strcVariables.n16Temp1                               ;808E57|857E    |00007E;
    ASL A                                                      ;808E59|0A      |      ;
    CLC                                                        ;808E5A|18      |      ;
    ADC.B strcVariables.n16Temp1                               ;808E5B|657E    |00007E; X * 3
    TAX                                                        ;808E5D|AA      |      ;
    LDA.B ptrTemp0x72                                          ;808E5E|A572    |000072;
    STA.B ptrUnknown0x42,X                                     ;808E60|9542    |000042; $72 -> $42
    SEP #$20                                                   ;808E62|E220    |      ;
    LDA.B ptrTemp0x72+2                                        ;808E64|A574    |000074;
    STA.B ptrUnknown0x42+2,X                                   ;808E66|9544    |000044;
    RTL                                                        ;808E68|6B      |      ;
 
 
fCore_Unknown808E69:
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
    LDA.B ptrUnknown0x42,X                                     ;808E8B|B542    |000042;
    BNE .label2                                                ;808E8D|D00E    |808E9D;
    SEP #$20                                                   ;808E8F|E220    |      ;
    LDA.B ptrUnknown0x42+2,X                                   ;808E91|B544    |000044;
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
    LDA.B ptrUnknown0x42,X                                     ;808EA6|B542    |000042;
    STA.B ptrTemp0x72                                          ;808EA8|8572    |000072;
    SEP #$20                                                   ;808EAA|E220    |      ;
    LDA.B ptrUnknown0x42+2,X                                   ;808EAC|B544    |000044;
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
    LDA.W strcPalette.unk14A,X                                 ;808EC8|BD4A01  |00014A;
    BEQ .label5                                                ;808ECB|F003    |808ED0;
    JMP.W .label8                                              ;808ECD|4C528F  |808F52;
 
 
.label5:
    PHY                                                        ;808ED0|5A      |      ;
    TYX                                                        ;808ED1|BB      |      ;
    LDA.B #$00                                                 ;808ED2|A900    |      ;
    XBA                                                        ;808ED4|EB      |      ;
    LDA.W strcPalette.unk16A,X                                 ;808ED5|BD6A01  |00016A;
    REP #$20                                                   ;808ED8|C220    |      ;
    PHA                                                        ;808EDA|48      |      ;
    TYX                                                        ;808EDB|BB      |      ;
    SEP #$20                                                   ;808EDC|E220    |      ;
    LDA.B #$00                                                 ;808EDE|A900    |      ;
    XBA                                                        ;808EE0|EB      |      ;
    LDA.W strcPalette.unk15A,X                                 ;808EE1|BD5A01  |00015A;
    REP #$20                                                   ;808EE4|C220    |      ;
    PHA                                                        ;808EE6|48      |      ;
    LDA.B [ptrTemp0x72]                                        ;808EE7|A772    |000072;
    PLX                                                        ;808EE9|FA      |      ;
    PLY                                                        ;808EEA|7A      |      ;
    JSL.L fPalette_Unknown80916F                               ;808EEB|226F9180|80916F;
    REP #$30                                                   ;808EEF|C230    |      ;
    PLY                                                        ;808EF1|7A      |      ;
    PHY                                                        ;808EF2|5A      |      ;
    TYX                                                        ;808EF3|BB      |      ;
    LDY.W #$0002                                               ;808EF4|A00200  |      ;
    SEP #$20                                                   ;808EF7|E220    |      ;
    LDA.B [ptrTemp0x72],Y                                      ;808EF9|B772    |000072;
    STA.W strcPalette.unk14A,X                                 ;808EFB|9D4A01  |00014A;
    REP #$20                                                   ;808EFE|C220    |      ;
    PLY                                                        ;808F00|7A      |      ;
    TYA                                                        ;808F01|98      |      ;
    STA.B strcVariables.n16Temp1                               ;808F02|857E    |00007E;
    ASL A                                                      ;808F04|0A      |      ;
    CLC                                                        ;808F05|18      |      ;
    ADC.B strcVariables.n16Temp1                               ;808F06|657E    |00007E;
    TAX                                                        ;808F08|AA      |      ;
    LDA.B ptrUnknown0x42,X                                     ;808F09|B542    |000042;
    CLC                                                        ;808F0B|18      |      ;
    ADC.W #$0003                                               ;808F0C|690300  |      ;
    STA.B ptrUnknown0x42,X                                     ;808F0F|9542    |000042;
    SEP #$20                                                   ;808F11|E220    |      ;
    LDA.B ptrUnknown0x42+2,X                                   ;808F13|B544    |000044;
    ADC.B #$00                                                 ;808F15|6900    |      ;
    STA.B ptrUnknown0x42+2,X                                   ;808F17|9544    |000044;
 
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
    DEC.W strcPalette.unk14A,X                                 ;808F52|DE4A01  |00014A;
    BRA .label6                                                ;808F55|80C2    |808F19;
 
 
.noMoreData:
    REP #$20                                                   ;808F57|C220    |      ;
    STZ.B ptrUnknown0x42,X                                     ;808F59|7442    |000042;
    SEP #$20                                                   ;808F5B|E220    |      ;
    STZ.B ptrUnknown0x42+2,X                                   ;808F5D|7444    |000044;
    JMP.W .loop                                                ;808F5F|4CC48E  |808EC4;
 
 
.loadNextPointer:
    REP #$20                                                   ;808F62|C220    |      ;
    LDY.W #$0002                                               ;808F64|A00200  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;808F67|B772    |000072;
    STA.B ptrUnknown0x42,X                                     ;808F69|9542    |000042;
    INY                                                        ;808F6B|C8      |      ;
    INY                                                        ;808F6C|C8      |      ;
    SEP #$20                                                   ;808F6D|E220    |      ;
    LDA.B [ptrTemp0x72],Y                                      ;808F6F|B772    |000072;
    STA.B ptrUnknown0x42+2,X                                   ;808F71|9544    |000044;
    REP #$20                                                   ;808F73|C220    |      ;
    LDA.B ptrUnknown0x42,X                                     ;808F75|B542    |000042;
    STA.B ptrTemp0x72                                          ;808F77|8572    |000072;
    SEP #$20                                                   ;808F79|E220    |      ;
    LDA.B ptrUnknown0x42+2,X                                   ;808F7B|B544    |000044;
    STA.B ptrTemp0x72+2                                        ;808F7D|8574    |000074;
    JMP.W .loop                                                ;808F7F|4CC48E  |808EC4;
 
 
fCore_Zero0x42PtrAtIndex:
    REP #$30                                                   ;808F82|C230    |      ; A: nIndex
    STA.B strcVariables.n16Temp1                               ;808F84|857E    |00007E;
    ASL A                                                      ;808F86|0A      |      ;
    CLC                                                        ;808F87|18      |      ;
    ADC.B strcVariables.n16Temp1                               ;808F88|657E    |00007E;
    TAX                                                        ;808F8A|AA      |      ;
    STZ.B ptrUnknown0x42,X                                     ;808F8B|7442    |000042;
    SEP #$20                                                   ;808F8D|E220    |      ;
    STZ.B ptrUnknown0x42+2,X                                   ;808F8F|7444    |000044;
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
    STZ.B ptrUnknown0x42,X                                     ;808F9E|7442    |000042;
    SEP #$20                                                   ;808FA0|E220    |      ;
    STZ.B ptrUnknown0x42+2,X                                   ;808FA2|7444    |000044;
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
    STZ.B ptrUnknown0x42,X                                     ;808FBA|7442    |000042;
    SEP #$20                                                   ;808FBC|E220    |      ;
    STZ.B ptrUnknown0x42+2,X                                   ;808FBE|7444    |000044;
    INY                                                        ;808FC0|C8      |      ;
    CPY.W #$0010                                               ;808FC1|C01000  |      ;
    BNE -                                                      ;808FC4|D0EA    |808FB0;
    RTL                                                        ;808FC6|6B      |      ;
 
 
fPalette_Unknown808FC7:
    SEP #$20                                                   ;808FC7|E220    |      ;
    REP #$10                                                   ;808FC9|C210    |      ;
    STA.W strcPalette.nextHourIdx                              ;808FCB|8D7C01  |00017C;
    STZ.W strcPalette.countDown                                ;808FCE|9C7A01  |00017A;
    XBA                                                        ;808FD1|EB      |      ;
    LDA.B #$00                                                 ;808FD2|A900    |      ;
    XBA                                                        ;808FD4|EB      |      ;
    REP #$20                                                   ;808FD5|C220    |      ;
    STA.B strcVariables.n16Temp1                               ;808FD7|857E    |00007E;
    SEP #$20                                                   ;808FD9|E220    |      ;
    LDA.L nCurrentTimeID                                       ;808FDB|AF1C1F7F|7F1F1C;
    CMP.B #$12                                                 ;808FDF|C912    |      ;
    BCC .label1                                                ;808FE1|900F    |808FF2;
    REP #$20                                                   ;808FE3|C220    |      ;
    LDA.W #$0B00                                               ;808FE5|A9000B  |      ;
    STA.B ptrPaletteNext                                       ;808FE8|8504    |000004;
    SEP #$20                                                   ;808FEA|E220    |      ;
    LDA.B #$7F                                                 ;808FEC|A97F    |      ;
    STA.B ptrPaletteNext+2                                     ;808FEE|8506    |000006;
    BRA .return                                                ;808FF0|8019    |80900B;
 
 
.label1:
    REP #$20                                                   ;808FF2|C220    |      ;
    LDA.B strcVariables.n16Temp1                               ;808FF4|A57E    |00007E;
    ASL A                                                      ;808FF6|0A      |      ;
    CLC                                                        ;808FF7|18      |      ;
    ADC.B strcVariables.n16Temp1                               ;808FF8|657E    |00007E;
    TAX                                                        ;808FFA|AA      |      ;
    LDA.L aPalettes,X                                          ;808FFB|BFFDB980|80B9FD;
    STA.B ptrPaletteNext                                       ;808FFF|8504    |000004;
    INX                                                        ;809001|E8      |      ;
    INX                                                        ;809002|E8      |      ;
    SEP #$20                                                   ;809003|E220    |      ;
    LDA.L aPalettes,X                                          ;809005|BFFDB980|80B9FD;
    STA.B ptrPaletteNext+2                                     ;809009|8506    |000006;
 
.return:
    RTL                                                        ;80900B|6B      |      ;
 
 
fPallete_ChangeHandler:
    SEP #$20                                                   ;80900C|E220    |      ;
    REP #$10                                                   ;80900E|C210    |      ;
    LDA.W nTimeState                                           ;809010|AD7309  |000973;
    AND.B #$01                                                 ;809013|2901    |      ;
    BNE +                                                      ;809015|D003    |80901A;
    JMP.W .return                                              ;809017|4C5691  |809156;
 
 
  + REP #$20                                                   ;80901A|C220    |      ;
    LDA.B ptrPaletteNext                                       ;80901C|A504    |000004;
    BNE +                                                      ;80901E|D009    |809029;
    SEP #$20                                                   ;809020|E220    |      ;
    LDA.B ptrPaletteNext+2                                     ;809022|A506    |000006;
    BNE +                                                      ;809024|D003    |809029;
    JMP.W .return                                              ;809026|4C5691  |809156;
 
 
  + SEP #$20                                                   ;809029|E220    |      ;
    LDA.W strcPalette.countDown                                ;80902B|AD7A01  |00017A;
    INC A                                                      ;80902E|1A      |      ;
    STA.W strcPalette.countDown                                ;80902F|8D7A01  |00017A;
    CMP.B #$20                                                 ;809032|C920    |      ;
    BEQ +                                                      ;809034|F003    |809039;
    JMP.W .return                                              ;809036|4C5691  |809156;
 
 
  + STZ.W strcPalette.countDown                                ;809039|9C7A01  |00017A;
    REP #$20                                                   ;80903C|C220    |      ;
    LDA.W #$0100                                               ;80903E|A90001  |      ;
    STA.B strcVariables.n16Temp4                               ;809041|8584    |000084;
    SEP #$20                                                   ;809043|E220    |      ;
    LDA.L nCurrentTimeID                                       ;809045|AF1C1F7F|7F1F1C;
    CMP.B #$12                                                 ;809049|C912    |      ;
    BCC +                                                      ;80904B|9007    |809054;
    REP #$20                                                   ;80904D|C220    |      ;
    LDA.W #$0200                                               ;80904F|A90002  |      ;
    STA.B strcVariables.n16Temp4                               ;809052|8584    |000084;
 
  + SEP #$20                                                   ;809054|E220    |      ; Is 6PM
    STZ.B strcVariables.n8Temp1                                ;809056|6492    |000092;
    LDY.W #$0000                                               ;809058|A00000  |      ;
 
.loop:
    SEP #$20                                                   ;80905B|E220    |      ;
    REP #$10                                                   ;80905D|C210    |      ;
    CPY.W #$0002                                               ;80905F|C00200  |      ;
    BNE +                                                      ;809062|D010    |809074;
    LDY.W #$0018                                               ;809064|A01800  |      ;
    REP #$20                                                   ;809067|C220    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;809069|AD9601  |000196;
    AND.W #$0004                                               ;80906C|290400  |      ;
    BNE +                                                      ;80906F|D003    |809074;
    LDY.W #$0020                                               ;809071|A02000  |      ;
 
  + TYX                                                        ;809074|BB      |      ;
    REP #$20                                                   ;809075|C220    |      ;
    LDA.L sPalette_7F0D00,X                                    ;809077|BF000D7F|7F0D00;
    AND.W #$001F                                               ;80907B|291F00  |      ;
    STA.B strcVariables.n16Temp1                               ;80907E|857E    |00007E;
    LDA.B [ptrPaletteNext],Y                                   ;809080|B704    |000004;
    AND.W #$001F                                               ;809082|291F00  |      ;
    CMP.B strcVariables.n16Temp1                               ;809085|C57E    |00007E;
    BEQ .label3                                                ;809087|F00E    |809097;
    BCS .inc7E                                                 ;809089|B004    |80908F;
    DEC.B strcVariables.n16Temp1                               ;80908B|C67E    |00007E;
    BRA .store01to92                                           ;80908D|8002    |809091;
 
 
.inc7E:
    INC.B strcVariables.n16Temp1                               ;80908F|E67E    |00007E;
 
.store01to92:
    SEP #$20                                                   ;809091|E220    |      ;
    LDA.B #$01                                                 ;809093|A901    |      ;
    STA.B strcVariables.n8Temp1                                ;809095|8592    |000092;
 
.label3:
    REP #$20                                                   ;809097|C220    |      ;
    LDA.L sPalette_7F0D00,X                                    ;809099|BF000D7F|7F0D00;
    AND.W #$03E0                                               ;80909D|29E003  |      ;
    LSR A                                                      ;8090A0|4A      |      ;
    LSR A                                                      ;8090A1|4A      |      ;
    LSR A                                                      ;8090A2|4A      |      ;
    LSR A                                                      ;8090A3|4A      |      ;
    LSR A                                                      ;8090A4|4A      |      ;
    STA.B strcVariables.n16Temp2                               ;8090A5|8580    |000080;
    LDA.B [ptrPaletteNext],Y                                   ;8090A7|B704    |000004;
    AND.W #$03E0                                               ;8090A9|29E003  |      ;
    LSR A                                                      ;8090AC|4A      |      ;
    LSR A                                                      ;8090AD|4A      |      ;
    LSR A                                                      ;8090AE|4A      |      ;
    LSR A                                                      ;8090AF|4A      |      ;
    LSR A                                                      ;8090B0|4A      |      ;
    CMP.B strcVariables.n16Temp2                               ;8090B1|C580    |000080;
    BEQ .label4                                                ;8090B3|F00E    |8090C3;
    BCS .inc80                                                 ;8090B5|B004    |8090BB;
    DEC.B strcVariables.n16Temp2                               ;8090B7|C680    |000080;
    BRA .store011to92ex                                        ;8090B9|8002    |8090BD;
 
 
.inc80:
    INC.B strcVariables.n16Temp2                               ;8090BB|E680    |000080;
 
.store011to92ex:
    SEP #$20                                                   ;8090BD|E220    |      ;
    LDA.B #$01                                                 ;8090BF|A901    |      ;
    STA.B strcVariables.n8Temp1                                ;8090C1|8592    |000092;
 
.label4:
    REP #$20                                                   ;8090C3|C220    |      ;
    LDA.L sPalette_7F0D00,X                                    ;8090C5|BF000D7F|7F0D00;
    AND.W #$7C00                                               ;8090C9|29007C  |      ;
    LSR A                                                      ;8090CC|4A      |      ;
    LSR A                                                      ;8090CD|4A      |      ;
    LSR A                                                      ;8090CE|4A      |      ;
    LSR A                                                      ;8090CF|4A      |      ;
    LSR A                                                      ;8090D0|4A      |      ;
    LSR A                                                      ;8090D1|4A      |      ;
    LSR A                                                      ;8090D2|4A      |      ;
    LSR A                                                      ;8090D3|4A      |      ;
    LSR A                                                      ;8090D4|4A      |      ;
    LSR A                                                      ;8090D5|4A      |      ;
    STA.B strcVariables.n16Temp3                               ;8090D6|8582    |000082;
    LDA.B [ptrPaletteNext],Y                                   ;8090D8|B704    |000004;
    AND.W #$7C00                                               ;8090DA|29007C  |      ;
    LSR A                                                      ;8090DD|4A      |      ;
    LSR A                                                      ;8090DE|4A      |      ;
    LSR A                                                      ;8090DF|4A      |      ;
    LSR A                                                      ;8090E0|4A      |      ;
    LSR A                                                      ;8090E1|4A      |      ;
    LSR A                                                      ;8090E2|4A      |      ;
    LSR A                                                      ;8090E3|4A      |      ;
    LSR A                                                      ;8090E4|4A      |      ;
    LSR A                                                      ;8090E5|4A      |      ;
    LSR A                                                      ;8090E6|4A      |      ;
    CMP.B strcVariables.n16Temp3                               ;8090E7|C582    |000082;
    BEQ .label5                                                ;8090E9|F00E    |8090F9;
    BCS .inc82                                                 ;8090EB|B004    |8090F1;
    DEC.B strcVariables.n16Temp3                               ;8090ED|C682    |000082;
    BRA .store01to92ex2                                        ;8090EF|8002    |8090F3;
 
 
.inc82:
    INC.B strcVariables.n16Temp3                               ;8090F1|E682    |000082;
 
.store01to92ex2:
    SEP #$20                                                   ;8090F3|E220    |      ;
    LDA.B #$01                                                 ;8090F5|A901    |      ;
    STA.B strcVariables.n8Temp1                                ;8090F7|8592    |000092;
 
.label5:
    REP #$20                                                   ;8090F9|C220    |      ;
    ASL.B strcVariables.n16Temp2                               ;8090FB|0680    |000080;
    ASL.B strcVariables.n16Temp2                               ;8090FD|0680    |000080;
    ASL.B strcVariables.n16Temp2                               ;8090FF|0680    |000080;
    ASL.B strcVariables.n16Temp2                               ;809101|0680    |000080;
    ASL.B strcVariables.n16Temp2                               ;809103|0680    |000080;
    ASL.B strcVariables.n16Temp3                               ;809105|0682    |000082;
    ASL.B strcVariables.n16Temp3                               ;809107|0682    |000082;
    ASL.B strcVariables.n16Temp3                               ;809109|0682    |000082;
    ASL.B strcVariables.n16Temp3                               ;80910B|0682    |000082;
    ASL.B strcVariables.n16Temp3                               ;80910D|0682    |000082;
    ASL.B strcVariables.n16Temp3                               ;80910F|0682    |000082;
    ASL.B strcVariables.n16Temp3                               ;809111|0682    |000082;
    ASL.B strcVariables.n16Temp3                               ;809113|0682    |000082;
    ASL.B strcVariables.n16Temp3                               ;809115|0682    |000082;
    ASL.B strcVariables.n16Temp3                               ;809117|0682    |000082;
    LDA.B strcVariables.n16Temp1                               ;809119|A57E    |00007E;
    ORA.B strcVariables.n16Temp2                               ;80911B|0580    |000080;
    ORA.B strcVariables.n16Temp3                               ;80911D|0582    |000082;
    STA.L sPalette_7F0900,X                                    ;80911F|9F00097F|7F0900;
    STA.L sPalette_7F0D00,X                                    ;809123|9F000D7F|7F0D00;
    INY                                                        ;809127|C8      |      ;
    INY                                                        ;809128|C8      |      ;
    CPY.B strcVariables.n16Temp4                               ;809129|C484    |000084;
    BEQ .exit                                                  ;80912B|F003    |809130;
    JMP.W .loop                                                ;80912D|4C5B90  |80905B;
 
 
.exit:
    SEP #$20                                                   ;809130|E220    |      ;
    LDA.B strcVariables.n8Temp1                                ;809132|A592    |000092;
    BEQ .label7                                                ;809134|F021    |809157;
    SEP #$20                                                   ;809136|E220    |      ;
    LDA.B #$06                                                 ;809138|A906    |      ;
    STA.B strcSystem.arrayIndex                                ;80913A|8527    |000027;
    LDA.B #$22                                                 ;80913C|A922    |      ;
    STA.B strcSystem.destinationRegister                       ;80913E|8529    |000029;
    REP #$20                                                   ;809140|C220    |      ;
    LDY.B strcVariables.n16Temp4                               ;809142|A484    |000084;
    LDX.W #$0000                                               ;809144|A20000  |      ;
    LDA.W #$0900                                               ;809147|A90009  |      ;
    STA.B ptrTemp0x72                                          ;80914A|8572    |000072;
    SEP #$20                                                   ;80914C|E220    |      ;
    LDA.B #$7F                                                 ;80914E|A97F    |      ;
    STA.B ptrTemp0x72+2                                        ;809150|8574    |000074;
    JSL.L fCore_PrepareTransfer                                ;809152|22338A80|808A33;
 
.return:
    RTL                                                        ;809156|6B      |      ;
 
 
.label7:
    REP #$20                                                   ;809157|C220    |      ;
    STZ.B ptrPaletteNext                                       ;809159|6404    |000004;
    SEP #$20                                                   ;80915B|E220    |      ;
    STZ.B ptrPaletteNext+2                                     ;80915D|6406    |000006;
    LDA.W strcPalette.nextHourIdx                              ;80915F|AD7C01  |00017C;
    STA.W strcPalette.nextIdx                                  ;809162|8D7B01  |00017B;
    RTL                                                        ;809165|6B      |      ;
 
 
fPalette_ZeroNextPalletePtr:
    REP #$30                                                   ;809166|C230    |      ;
    STZ.B ptrPaletteNext                                       ;809168|6404    |000004;
    SEP #$20                                                   ;80916A|E220    |      ;
    STZ.B ptrPaletteNext+2                                     ;80916C|6406    |000006;
    RTL                                                        ;80916E|6B      |      ;
 
 
fPalette_Unknown80916F:
    REP #$30                                                   ;80916F|C230    |      ; A: nValue, X: nColorIndex, Y: nOffsetindex (32Y+2X)
    STA.B strcVariables.n16Temp3                               ;809171|8582    |000082;
    STY.B strcVariables.n16Temp1                               ;809173|847E    |00007E;
    TXA                                                        ;809175|8A      |      ;
    ASL A                                                      ;809176|0A      |      ;
    STA.B strcVariables.n16Temp2                               ;809177|8580    |000080;
    LDA.B strcVariables.n16Temp1                               ;809179|A57E    |00007E;
    ASL A                                                      ;80917B|0A      |      ;
    ASL A                                                      ;80917C|0A      |      ;
    ASL A                                                      ;80917D|0A      |      ;
    ASL A                                                      ;80917E|0A      |      ;
    ASL A                                                      ;80917F|0A      |      ;
    CLC                                                        ;809180|18      |      ;
    ADC.B strcVariables.n16Temp2                               ;809181|6580    |000080;
    TAX                                                        ;809183|AA      |      ;
    SEP #$20                                                   ;809184|E220    |      ;
    LDA.B strcVariables.n8Temp1                                ;809186|A592    |000092;
    BNE .label1                                                ;809188|D00A    |809194;
    REP #$20                                                   ;80918A|C220    |      ;
    LDA.B strcVariables.n16Temp3                               ;80918C|A582    |000082;
    STA.L sPalette_7F0900,X                                    ;80918E|9F00097F|7F0900;
    BRA .return                                                ;809192|8008    |80919C;
 
 
.label1:
    REP #$20                                                   ;809194|C220    |      ;
    LDA.B strcVariables.n16Temp3                               ;809196|A582    |000082;
    STA.L sPalette_7F0B00,X                                    ;809198|9F000B7F|7F0B00;
 
.return:
    RTL                                                        ;80919C|6B      |      ;
 
 
fPalette_ModifyPalette:
    REP #$30                                                   ;80919D|C230    |      ; A: nValue, X: nColorIndex, Y: nOffsetIndex (32Y+2X)
    STA.B strcVariables.n16Temp3                               ;80919F|8582    |000082;
    STY.B strcVariables.n16Temp1                               ;8091A1|847E    |00007E;
    TXA                                                        ;8091A3|8A      |      ;
    ASL A                                                      ;8091A4|0A      |      ;
    STA.B strcVariables.n16Temp2                               ;8091A5|8580    |000080;
    LDA.B strcVariables.n16Temp1                               ;8091A7|A57E    |00007E;
    ASL A                                                      ;8091A9|0A      |      ;
    ASL A                                                      ;8091AA|0A      |      ;
    ASL A                                                      ;8091AB|0A      |      ;
    ASL A                                                      ;8091AC|0A      |      ;
    ASL A                                                      ;8091AD|0A      |      ;
    CLC                                                        ;8091AE|18      |      ;
    ADC.B strcVariables.n16Temp2                               ;8091AF|6580    |000080;
    TAX                                                        ;8091B1|AA      |      ;
    SEP #$20                                                   ;8091B2|E220    |      ;
    LDA.B strcVariables.n8Temp1                                ;8091B4|A592    |000092;
    BNE .label1                                                ;8091B6|D00E    |8091C6;
    REP #$20                                                   ;8091B8|C220    |      ;
    LDA.B strcVariables.n16Temp3                               ;8091BA|A582    |000082;
    STA.L sPalette_7F0900,X                                    ;8091BC|9F00097F|7F0900;
    STA.L sPalette_7F0D00,X                                    ;8091C0|9F000D7F|7F0D00;
    BRA .return                                                ;8091C4|8008    |8091CE;
 
 
.label1:
    REP #$20                                                   ;8091C6|C220    |      ;
    LDA.B strcVariables.n16Temp3                               ;8091C8|A582    |000082;
    STA.L sPalette_7F0B00,X                                    ;8091CA|9F000B7F|7F0B00;
 
.return:
    RTL                                                        ;8091CE|6B      |      ;
 
 
fPalette_LoadFirstHalf:
    REP #$30                                                   ;8091CF|C230    |      ; A: nIndex
    STA.B strcVariables.n16Temp1                               ;8091D1|857E    |00007E;
    ASL A                                                      ;8091D3|0A      |      ;
    CLC                                                        ;8091D4|18      |      ;
    ADC.B strcVariables.n16Temp1                               ;8091D5|657E    |00007E;
    TAX                                                        ;8091D7|AA      |      ;
    LDA.L aPalettes,X                                          ;8091D8|BFFDB980|80B9FD; X = nIndex * 3
    STA.B ptrTemp0x72                                          ;8091DC|8572    |000072;
    INX                                                        ;8091DE|E8      |      ;
    INX                                                        ;8091DF|E8      |      ;
    SEP #$20                                                   ;8091E0|E220    |      ;
    LDA.L aPalettes,X                                          ;8091E2|BFFDB980|80B9FD; X = X + 2
    STA.B ptrTemp0x72+2                                        ;8091E6|8574    |000074;
    REP #$20                                                   ;8091E8|C220    |      ;
    LDA.W #$0100                                               ;8091EA|A90001  |      ;
    STA.B strcVariables.n16Temp1                               ;8091ED|857E    |00007E; $7E = 0x100
    LDX.W #$0000                                               ;8091EF|A20000  |      ;
    LDY.W #$0000                                               ;8091F2|A00000  |      ;
 
  - LDA.B [ptrTemp0x72],Y                                      ;8091F5|B772    |000072; Y = 0x0000 - 0x009F
    STA.L sPalette_7F0900,X                                    ;8091F7|9F00097F|7F0900; X = 0x0000 - 0x009F
    STA.L sPalette_7F0D00,X                                    ;8091FB|9F000D7F|7F0D00; Y = 0x0000 - 0x009F
    INY                                                        ;8091FF|C8      |      ;
    INY                                                        ;809200|C8      |      ;
    INX                                                        ;809201|E8      |      ;
    INX                                                        ;809202|E8      |      ;
    CPY.B strcVariables.n16Temp1                               ;809203|C47E    |00007E;
    BNE -                                                      ;809205|D0EE    |8091F5;
    RTL                                                        ;809207|6B      |      ;
 
 
fPalette_LoadSecondHalf:
    REP #$30                                                   ;809208|C230    |      ; A: nIndex
    STA.B strcVariables.n16Temp1                               ;80920A|857E    |00007E;
    ASL A                                                      ;80920C|0A      |      ;
    CLC                                                        ;80920D|18      |      ;
    ADC.B strcVariables.n16Temp1                               ;80920E|657E    |00007E;
    TAX                                                        ;809210|AA      |      ;
    LDA.L aPalettes,X                                          ;809211|BFFDB980|80B9FD; X = nIndex * 3
    STA.B ptrTemp0x72                                          ;809215|8572    |000072;
    INX                                                        ;809217|E8      |      ;
    INX                                                        ;809218|E8      |      ;
    SEP #$20                                                   ;809219|E220    |      ;
    LDA.L aPalettes,X                                          ;80921B|BFFDB980|80B9FD; X = X + 2
    STA.B ptrTemp0x72+2                                        ;80921F|8574    |000074;
    REP #$20                                                   ;809221|C220    |      ;
    LDA.W #$0100                                               ;809223|A90001  |      ;
    STA.B strcVariables.n16Temp1                               ;809226|857E    |00007E; $7E = 0x100
    LDX.W #$0100                                               ;809228|A20001  |      ;
    LDY.W #$0000                                               ;80922B|A00000  |      ;
 
  - LDA.B [ptrTemp0x72],Y                                      ;80922E|B772    |000072; Y = 0x0000 - 0x009F
    STA.L sPalette_7F0900,X                                    ;809230|9F00097F|7F0900; X = 0x0100 - 0x019F
    STA.L sPalette_7F0D00,X                                    ;809234|9F000D7F|7F0D00; X = 0x0100 - 0x019F
    INY                                                        ;809238|C8      |      ;
    INY                                                        ;809239|C8      |      ;
    INX                                                        ;80923A|E8      |      ;
    INX                                                        ;80923B|E8      |      ;
    CPY.B strcVariables.n16Temp1                               ;80923C|C47E    |00007E;
    BNE -                                                      ;80923E|D0EE    |80922E;
    RTL                                                        ;809240|6B      |      ;
 
 
fPalette_LoadMapPallete:
    SEP #$20                                                   ;809241|E220    |      ;
    REP #$10                                                   ;809243|C210    |      ;
    LDA.B #$00                                                 ;809245|A900    |      ;
    XBA                                                        ;809247|EB      |      ; A <-> B
    LDA.B strcMap.loadAreaId                                   ;809248|A522    |000022;
    REP #$20                                                   ;80924A|C220    |      ;
    STA.B strcVariables.n16Temp2                               ;80924C|8580    |000080; $80 = nSelectedTilemapId
    ASL A                                                      ;80924E|0A      |      ;
    ASL A                                                      ;80924F|0A      |      ;
    CLC                                                        ;809250|18      |      ;
    ADC.B strcVariables.n16Temp2                               ;809251|6580    |000080;
    ADC.B strcVariables.n16Temp2                               ;809253|6580    |000080;
    ADC.W #$0004                                               ;809255|690400  |      ;
    TAX                                                        ;809258|AA      |      ;
    SEP #$20                                                   ;809259|E220    |      ;
    LDA.B #$00                                                 ;80925B|A900    |      ;
    XBA                                                        ;80925D|EB      |      ; A <-> B
    LDA.L aMapPalettesIndexes,X                                ;80925E|BF5CBB80|80BB5C; X = nSelectedTilemapId * 6 + 4
    REP #$20                                                   ;809262|C220    |      ;
    STA.B strcVariables.n16Temp1                               ;809264|857E    |00007E;
    ASL A                                                      ;809266|0A      |      ;
    CLC                                                        ;809267|18      |      ;
    ADC.B strcVariables.n16Temp1                               ;809268|657E    |00007E;
    TAX                                                        ;80926A|AA      |      ;
    LDA.L aPalettes,X                                          ;80926B|BFFDB980|80B9FD; X = nPalettedIndex * 3
    STA.B ptrTemp0x72                                          ;80926F|8572    |000072;
    INX                                                        ;809271|E8      |      ;
    INX                                                        ;809272|E8      |      ;
    SEP #$20                                                   ;809273|E220    |      ;
    LDA.L aPalettes,X                                          ;809275|BFFDB980|80B9FD; X = X + 2
    STA.B ptrTemp0x72+2                                        ;809279|8574    |000074;
    REP #$20                                                   ;80927B|C220    |      ;
    LDA.W #$0100                                               ;80927D|A90001  |      ;
    STA.B strcVariables.n16Temp1                               ;809280|857E    |00007E;
    LDX.W #$0000                                               ;809282|A20000  |      ;
    LDY.W #$0000                                               ;809285|A00000  |      ;
 
  - LDA.B [ptrTemp0x72],Y                                      ;809288|B772    |000072;
    STA.L sPalette_7F0B00,X                                    ;80928A|9F000B7F|7F0B00;
    INY                                                        ;80928E|C8      |      ;
    INY                                                        ;80928F|C8      |      ;
    INX                                                        ;809290|E8      |      ;
    INX                                                        ;809291|E8      |      ;
    CPY.B strcVariables.n16Temp1                               ;809292|C47E    |00007E;
    BNE -                                                      ;809294|D0F2    |809288;
    SEP #$20                                                   ;809296|E220    |      ;
    LDA.B #$00                                                 ;809298|A900    |      ;
    XBA                                                        ;80929A|EB      |      ;
    LDA.B strcMap.loadAreaId                                   ;80929B|A522    |000022;
    ASL A                                                      ;80929D|0A      |      ;
    TAX                                                        ;80929E|AA      |      ;
    INX                                                        ;80929F|E8      |      ;
    LDA.W aMapPalettesId,X                                     ;8092A0|BD44BE  |80BE44;
    REP #$20                                                   ;8092A3|C220    |      ;
    STA.B strcVariables.n16Temp1                               ;8092A5|857E    |00007E;
    ASL A                                                      ;8092A7|0A      |      ;
    CLC                                                        ;8092A8|18      |      ;
    ADC.B strcVariables.n16Temp1                               ;8092A9|657E    |00007E;
    TAX                                                        ;8092AB|AA      |      ;
    LDA.L aPalettes,X                                          ;8092AC|BFFDB980|80B9FD;
    STA.B ptrTemp0x72                                          ;8092B0|8572    |000072;
    INX                                                        ;8092B2|E8      |      ;
    INX                                                        ;8092B3|E8      |      ;
    SEP #$20                                                   ;8092B4|E220    |      ;
    LDA.L aPalettes,X                                          ;8092B6|BFFDB980|80B9FD;
    STA.B ptrTemp0x72+2                                        ;8092BA|8574    |000074;
    REP #$20                                                   ;8092BC|C220    |      ;
    LDA.W #$0100                                               ;8092BE|A90001  |      ;
    STA.B strcVariables.n16Temp1                               ;8092C1|857E    |00007E;
    LDX.W #$0100                                               ;8092C3|A20001  |      ;
    LDY.W #$0000                                               ;8092C6|A00000  |      ;
 
  - LDA.B [ptrTemp0x72],Y                                      ;8092C9|B772    |000072;
    STA.L sPalette_7F0B00,X                                    ;8092CB|9F000B7F|7F0B00;
    INY                                                        ;8092CF|C8      |      ;
    INY                                                        ;8092D0|C8      |      ;
    INX                                                        ;8092D1|E8      |      ;
    INX                                                        ;8092D2|E8      |      ;
    CPY.B strcVariables.n16Temp1                               ;8092D3|C47E    |00007E;
    BNE -                                                      ;8092D5|D0F2    |8092C9;
    SEP #$20                                                   ;8092D7|E220    |      ;
    LDA.B #$01                                                 ;8092D9|A901    |      ;
    STA.B strcVariables.n8Temp1                                ;8092DB|8592    |000092;
    JSL.L fPalette_LoadSpritePallete                           ;8092DD|22A49380|8093A4;
    RTL                                                        ;8092E1|6B      |      ;
 
 
fPalette_ChangeTimePallete:
    SEP #$20                                                   ;8092E2|E220    |      ;
    REP #$10                                                   ;8092E4|C210    |      ;
    LDX.W #$0000                                               ;8092E6|A20000  |      ; X = 0
    LDA.L nCurrentTimeID                                       ;8092E9|AF1C1F7F|7F1F1C;
    CMP.B #$07                                                 ;8092ED|C907    |      ;
    BCC +                                                      ;8092EF|9010    |809301;
    INX                                                        ;8092F1|E8      |      ; X = 1
    CMP.B #$0F                                                 ;8092F2|C90F    |      ;
    BCC +                                                      ;8092F4|900B    |809301;
    INX                                                        ;8092F6|E8      |      ; X = 2
    CMP.B #$11                                                 ;8092F7|C911    |      ;
    BCC +                                                      ;8092F9|9006    |809301;
    INX                                                        ;8092FB|E8      |      ; X = 3
    CMP.B #$12                                                 ;8092FC|C912    |      ;
    BCC +                                                      ;8092FE|9001    |809301;
    INX                                                        ;809300|E8      |      ; X = 4
 
  + STX.B strcVariables.n16Temp1                               ;809301|867E    |00007E; $7E = X
    LDA.B #$00                                                 ;809303|A900    |      ; A = 0
    XBA                                                        ;809305|EB      |      ; A <-> B
    LDA.B strcMap.loadAreaId                                   ;809306|A522    |000022;
    REP #$20                                                   ;809308|C220    |      ;
    STA.B strcVariables.n16Temp2                               ;80930A|8580    |000080;
    ASL A                                                      ;80930C|0A      |      ;
    ASL A                                                      ;80930D|0A      |      ;
    CLC                                                        ;80930E|18      |      ;
    ADC.B strcVariables.n16Temp2                               ;80930F|6580    |000080;
    ADC.B strcVariables.n16Temp2                               ;809311|6580    |000080;
    ADC.B strcVariables.n16Temp1                               ;809313|657E    |00007E;
    TAX                                                        ;809315|AA      |      ;
    SEP #$20                                                   ;809316|E220    |      ;
    LDA.B #$00                                                 ;809318|A900    |      ;
    XBA                                                        ;80931A|EB      |      ;
    LDA.L aMapPalettesIndexes,X                                ;80931B|BF5CBB80|80BB5C; X = nSelectedTilemapId * 6 + X
    STA.W strcPalette.nextIdx                                  ;80931F|8D7B01  |00017B;
    REP #$20                                                   ;809322|C220    |      ;
    JSL.L fPalette_LoadFirstHalf                               ;809324|22CF9180|8091CF;
    RTL                                                        ;809328|6B      |      ;
 
 
fPalette_PrepareSpritePalette:
    REP #$30                                                   ;809329|C230    |      ;
    %CheckFlag(daily3, $0080)
    BNE .notAnd0080                                            ;809332|D03A    |80936E;
    %CheckFlag(daily3, $0100)
    BNE .notAnd0100                                            ;80933B|D043    |809380;
    %CheckFlag(daily3, $0200)
    BNE .notAnd0200                                            ;809344|D04C    |809392;
    SEP #$20                                                   ;809346|E220    |      ;
    LDA.B #$00                                                 ;809348|A900    |      ;
    XBA                                                        ;80934A|EB      |      ;
    LDA.B strcMap.loadAreaId                                   ;80934B|A522    |000022;
    ASL A                                                      ;80934D|0A      |      ;
    TAX                                                        ;80934E|AA      |      ;
    LDA.L nCurrentTimeID                                       ;80934F|AF1C1F7F|7F1F1C;
    CMP.B #$12                                                 ;809353|C912    |      ;
    BCC .time6PM                                               ;809355|9001    |809358;
    INX                                                        ;809357|E8      |      ;
 
.time6PM:
    SEP #$20                                                   ;809358|E220    |      ;
    REP #$10                                                   ;80935A|C210    |      ;
    LDA.W aMapPalettesId,X                                     ;80935C|BD44BE  |80BE44;
    REP #$20                                                   ;80935F|C220    |      ;
    JSL.L fPalette_LoadSecondHalf                              ;809361|22089280|809208;
    SEP #$20                                                   ;809365|E220    |      ;
    STZ.B strcVariables.n8Temp1                                ;809367|6492    |000092;
    JSL.L fPalette_LoadSpritePallete                           ;809369|22A49380|8093A4;
    RTL                                                        ;80936D|6B      |      ;
 
 
.notAnd0080:
    REP #$30                                                   ;80936E|C230    |      ;
    LDA.W #$0071                                               ;809370|A97100  |      ;
    JSL.L fPalette_LoadSecondHalf                              ;809373|22089280|809208;
    SEP #$20                                                   ;809377|E220    |      ;
    STZ.B strcVariables.n8Temp1                                ;809379|6492    |000092;
    JSL.L fPalette_LoadSpritePallete                           ;80937B|22A49380|8093A4;
    RTL                                                        ;80937F|6B      |      ;
 
 
.notAnd0100:
    REP #$30                                                   ;809380|C230    |      ;
    LDA.W #$0072                                               ;809382|A97200  |      ;
    JSL.L fPalette_LoadSecondHalf                              ;809385|22089280|809208;
    SEP #$20                                                   ;809389|E220    |      ;
    STZ.B strcVariables.n8Temp1                                ;80938B|6492    |000092;
    JSL.L fPalette_LoadSpritePallete                           ;80938D|22A49380|8093A4;
    RTL                                                        ;809391|6B      |      ;
 
 
.notAnd0200:
    REP #$30                                                   ;809392|C230    |      ;
    LDA.W #$0073                                               ;809394|A97300  |      ;
    JSL.L fPalette_LoadSecondHalf                              ;809397|22089280|809208;
    SEP #$20                                                   ;80939B|E220    |      ;
    STZ.B strcVariables.n8Temp1                                ;80939D|6492    |000092;
    JSL.L fPalette_LoadSpritePallete                           ;80939F|22A49380|8093A4;
    RTL                                                        ;8093A3|6B      |      ;
 
 
fPalette_LoadSpritePallete:
    REP #$30                                                   ;8093A4|C230    |      ;
    STZ.B strcVariables.n16Temp1                               ;8093A6|647E    |00007E;
    SEP #$20                                                   ;8093A8|E220    |      ;
    LDA.B strcVariables.n8Temp1                                ;8093AA|A592    |000092;
    BNE .label1                                                ;8093AC|D012    |8093C0;
    LDA.L nCurrentTimeID                                       ;8093AE|AF1C1F7F|7F1F1C;
    CMP.B #$12                                                 ;8093B2|C912    |      ;
    BCC .label2                                                ;8093B4|9011    |8093C7;
    LDA.B strcMap.loadAreaId                                   ;8093B6|A522    |000022;
    CMP.B #$31                                                 ;8093B8|C931    |      ;
    BCS .label1                                                ;8093BA|B004    |8093C0;
    CMP.B #$15                                                 ;8093BC|C915    |      ;
    BCS .label2                                                ;8093BE|B007    |8093C7;
 
.label1:
    REP #$20                                                   ;8093C0|C220    |      ;
    LDA.W #$0004                                               ;8093C2|A90400  |      ;
    STA.B strcVariables.n16Temp1                               ;8093C5|857E    |00007E;
 
.label2:
    SEP #$20                                                   ;8093C7|E220    |      ;
    LDA.B #$00                                                 ;8093C9|A900    |      ;
    XBA                                                        ;8093CB|EB      |      ;
    LDA.W strcMap.loadAreaId                                   ;8093CC|AD2200  |000022;
    CMP.B #$04                                                 ;8093CF|C904    |      ;
    BCS .label3                                                ;8093D1|B00C    |8093DF;
 
.getSeasonId:
    SEP #$20                                                   ;8093D3|E220    |      ;
    LDA.L nCurrentSeasonID                                     ;8093D5|AF191F7F|7F1F19;
    REP #$20                                                   ;8093D9|C220    |      ;
    STA.B strcVariables.n16Temp3                               ;8093DB|8582    |000082;
    BRA .loadData                                              ;8093DD|8012    |8093F1;
 
 
.label3:
    SEP #$20                                                   ;8093DF|E220    |      ;
    CMP.B #$10                                                 ;8093E1|C910    |      ;
    BCC .getSeasonId                                           ;8093E3|90EE    |8093D3;
    CMP.B #$14                                                 ;8093E5|C914    |      ;
    BCS .getSeasonId                                           ;8093E7|B0EA    |8093D3;
    REP #$20                                                   ;8093E9|C220    |      ;
    SEC                                                        ;8093EB|38      |      ;
    SBC.W #$0008                                               ;8093EC|E90800  |      ;
    STA.B strcVariables.n16Temp3                               ;8093EF|8582    |000082;
 
.loadData:
    SEP #$20                                                   ;8093F1|E220    |      ;
    LDA.B #$00                                                 ;8093F3|A900    |      ;
    XBA                                                        ;8093F5|EB      |      ;
    LDA.B strcVariables.n16Temp3                               ;8093F6|A582    |000082;
    CLC                                                        ;8093F8|18      |      ;
    ADC.B strcVariables.n16Temp1                               ;8093F9|657E    |00007E;
    STA.B strcVariables.n16Temp2                               ;8093FB|8580    |000080;
    REP #$20                                                   ;8093FD|C220    |      ;
    ASL A                                                      ;8093FF|0A      |      ;
    CLC                                                        ;809400|18      |      ;
    ADC.B strcVariables.n16Temp2                               ;809401|6580    |000080;
    ASL A                                                      ;809403|0A      |      ;
    TAX                                                        ;809404|AA      |      ;
    PHX                                                        ;809405|DA      |      ;
    %PaletteModify(nPaletteOverwrite_80BD9C,X, $000A, $000F)
    REP #$30                                                   ;809414|C230    |      ;
    PLX                                                        ;809416|FA      |      ;
    INX                                                        ;809417|E8      |      ;
    INX                                                        ;809418|E8      |      ;
    PHX                                                        ;809419|DA      |      ;
    %PaletteModify(nPaletteOverwrite_80BD9C,X, $000B, $000F)
    REP #$30                                                   ;809428|C230    |      ;
    PLX                                                        ;80942A|FA      |      ;
    INX                                                        ;80942B|E8      |      ;
    INX                                                        ;80942C|E8      |      ;
    %PaletteModify(nPaletteOverwrite_80BD9C,X, $000C, $000F)
    REP #$30                                                   ;80943B|C230    |      ;
    STZ.B strcVariables.n16Temp1                               ;80943D|647E    |00007E;
    SEP #$20                                                   ;80943F|E220    |      ;
    LDA.B strcVariables.n8Temp1                                ;809441|A592    |000092;
    BNE .label4                                                ;809443|D012    |809457;
    LDA.L nCurrentTimeID                                       ;809445|AF1C1F7F|7F1F1C;
    CMP.B #$12                                                 ;809449|C912    |      ;
    BCC .checkPregnacy                                         ;80944B|9013    |809460;
    LDA.B strcMap.loadAreaId                                   ;80944D|A522    |000022;
    CMP.B #$31                                                 ;80944F|C931    |      ;
    BCS .label4                                                ;809451|B004    |809457;
    CMP.B #$15                                                 ;809453|C915    |      ;
    BCS .checkPregnacy                                         ;809455|B009    |809460;
 
.label4:
    REP #$20                                                   ;809457|C220    |      ;
    LDA.W #$0006                                               ;809459|A90600  |      ;
    STA.B strcVariables.n16Temp1                               ;80945C|857E    |00007E;
    BRA .checkPregnacy                                         ;80945E|8000    |809460;
 
 
.checkPregnacy:
    REP #$30                                                   ;809460|C230    |      ;
    LDA.L nMarriedDaysCounter                                  ;809462|AF3B1F7F|7F1F3B;
    BNE .checkMarriedGirl                                      ;809466|D003    |80946B;
    JMP.W .return                                              ;809468|4C0095  |809500;
 
 
.checkMarriedGirl:
    %CheckFlag(event2, !EFLAGS2_MARRIEDMARIA)
    BNE .marriedMaria                                          ;809472|D026    |80949A;
    %CheckFlag(event2, !EFLAGS2_MARRIEDANN)
    BNE .marriedAnn                                            ;80947B|D024    |8094A1;
    %CheckFlag(event2, !EFLAGS2_MARRIEDNINA)
    BNE .marriedNina                                           ;809484|D022    |8094A8;
    %CheckFlag(event2, !EFLAGS2_MARRIEDELLEN)
    BNE .marriedEllen                                          ;80948D|D020    |8094AF;
    %CheckFlag(event2, !EFLAGS2_MARRIEDEVE)
    BNE .marriedEve                                            ;809496|D01E    |8094B6;
    BRA .return                                                ;809498|8066    |809500;
 
 
.marriedMaria:
    REP #$30                                                   ;80949A|C230    |      ;
    LDA.W #$0001                                               ;80949C|A90100  |      ;
    BRA +                                                      ;80949F|801C    |8094BD;
 
 
.marriedAnn:
    REP #$30                                                   ;8094A1|C230    |      ;
    LDA.W #$0002                                               ;8094A3|A90200  |      ;
    BRA +                                                      ;8094A6|8015    |8094BD;
 
 
.marriedNina:
    REP #$30                                                   ;8094A8|C230    |      ;
    LDA.W #$0003                                               ;8094AA|A90300  |      ;
    BRA +                                                      ;8094AD|800E    |8094BD;
 
 
.marriedEllen:
    REP #$30                                                   ;8094AF|C230    |      ;
    LDA.W #$0004                                               ;8094B1|A90400  |      ;
    BRA +                                                      ;8094B4|8007    |8094BD;
 
 
.marriedEve:
    REP #$30                                                   ;8094B6|C230    |      ;
    LDA.W #$0005                                               ;8094B8|A90500  |      ;
    BRA +                                                      ;8094BB|8000    |8094BD;
 
 
  + REP #$30                                                   ;8094BD|C230    |      ;
    CLC                                                        ;8094BF|18      |      ;
    ADC.B strcVariables.n16Temp1                               ;8094C0|657E    |00007E;
    STA.B strcVariables.n16Temp2                               ;8094C2|8580    |000080;
    ASL A                                                      ;8094C4|0A      |      ;
    CLC                                                        ;8094C5|18      |      ;
    ADC.B strcVariables.n16Temp2                               ;8094C6|6580    |000080;
    ASL A                                                      ;8094C8|0A      |      ;
    TAX                                                        ;8094C9|AA      |      ;
    PHX                                                        ;8094CA|DA      |      ;
    %PaletteModify(sPallete_MarriedGirlTable,X, $0008, $000B)
    REP #$30                                                   ;8094D9|C230    |      ;
    PLX                                                        ;8094DB|FA      |      ;
    INX                                                        ;8094DC|E8      |      ;
    INX                                                        ;8094DD|E8      |      ;
    PHX                                                        ;8094DE|DA      |      ;
    %PaletteModify(sPallete_MarriedGirlTable,X, $0009, $000B)
    REP #$30                                                   ;8094ED|C230    |      ;
    PLX                                                        ;8094EF|FA      |      ;
    INX                                                        ;8094F0|E8      |      ;
    INX                                                        ;8094F1|E8      |      ;
    %PaletteModify(sPallete_MarriedGirlTable,X, $000A, $000B)
 
.return:
    RTL                                                        ;809500|6B      |      ;
 
 
fPalette_AdjustTimePalette:
    SEP #$20                                                   ;809501|E220    |      ;
    REP #$10                                                   ;809503|C210    |      ;
    LDX.W #$0000                                               ;809505|A20000  |      ;
    LDA.L nCurrentTimeID                                       ;809508|AF1C1F7F|7F1F1C;
    CMP.B #$07                                                 ;80950C|C907    |      ;
    BCC +                                                      ;80950E|9010    |809520;
    INX                                                        ;809510|E8      |      ;
    CMP.B #$0F                                                 ;809511|C90F    |      ;
    BCC +                                                      ;809513|900B    |809520;
    INX                                                        ;809515|E8      |      ;
    CMP.B #$11                                                 ;809516|C911    |      ;
    BCC +                                                      ;809518|9006    |809520;
    INX                                                        ;80951A|E8      |      ;
    CMP.B #$12                                                 ;80951B|C912    |      ;
    BCC +                                                      ;80951D|9001    |809520;
    INX                                                        ;80951F|E8      |      ;
 
  + STX.B strcVariables.n16Temp1                               ;809520|867E    |00007E;
    LDA.B #$00                                                 ;809522|A900    |      ;
    XBA                                                        ;809524|EB      |      ;
    LDA.B strcMap.loadAreaId                                   ;809525|A522    |000022;
    REP #$20                                                   ;809527|C220    |      ;
    STA.B strcVariables.n16Temp2                               ;809529|8580    |000080;
    ASL A                                                      ;80952B|0A      |      ;
    ASL A                                                      ;80952C|0A      |      ;
    CLC                                                        ;80952D|18      |      ;
    ADC.B strcVariables.n16Temp2                               ;80952E|6580    |000080;
    ADC.B strcVariables.n16Temp2                               ;809530|6580    |000080;
    ADC.B strcVariables.n16Temp1                               ;809532|657E    |00007E;
    TAX                                                        ;809534|AA      |      ;
    SEP #$20                                                   ;809535|E220    |      ;
    LDA.B #$00                                                 ;809537|A900    |      ;
    XBA                                                        ;809539|EB      |      ;
    LDA.L aMapPalettesIndexes,X                                ;80953A|BF5CBB80|80BB5C;
    CMP.W strcPalette.nextIdx                                  ;80953E|CD7B01  |00017B;
    BEQ +                                                      ;809541|F00F    |809552;
    CMP.B #$FF                                                 ;809543|C9FF    |      ;
    BEQ +                                                      ;809545|F00B    |809552;
    PHA                                                        ;809547|48      |      ;
    JSL.L fPalette_Unknown808FC7                               ;809548|22C78F80|808FC7;
    SEP #$20                                                   ;80954C|E220    |      ;
    PLA                                                        ;80954E|68      |      ;
    STA.W strcPalette.nextIdx                                  ;80954F|8D7B01  |00017B;
 
  + RTL                                                        ;809552|6B      |      ;
 
 
fSubrutinesExecute_809553:
    SEP #$20                                                   ;809553|E220    |      ;
    REP #$10                                                   ;809555|C210    |      ;
    LDX.W #$0000                                               ;809557|A20000  |      ;
    LDA.L nCurrentTimeID                                       ;80955A|AF1C1F7F|7F1F1C;
    CMP.B #$07                                                 ;80955E|C907    |      ;
    BCC +                                                      ;809560|9010    |809572;
    INX                                                        ;809562|E8      |      ;
    CMP.B #$0F                                                 ;809563|C90F    |      ;
    BCC +                                                      ;809565|900B    |809572;
    INX                                                        ;809567|E8      |      ;
    CMP.B #$11                                                 ;809568|C911    |      ;
    BCC +                                                      ;80956A|9006    |809572;
    INX                                                        ;80956C|E8      |      ;
    CMP.B #$12                                                 ;80956D|C912    |      ;
    BCC +                                                      ;80956F|9001    |809572;
    INX                                                        ;809571|E8      |      ;
 
  + STX.B strcVariables.n16Temp1                               ;809572|867E    |00007E;
    LDA.B #$00                                                 ;809574|A900    |      ;
    XBA                                                        ;809576|EB      |      ;
    LDA.B strcMap.loadAreaId                                   ;809577|A522    |000022;
    REP #$20                                                   ;809579|C220    |      ;
    STA.B strcVariables.n16Temp2                               ;80957B|8580    |000080;
    ASL A                                                      ;80957D|0A      |      ;
    ASL A                                                      ;80957E|0A      |      ;
    CLC                                                        ;80957F|18      |      ;
    ADC.B strcVariables.n16Temp2                               ;809580|6580    |000080;
    ADC.B strcVariables.n16Temp2                               ;809582|6580    |000080;
    STA.B strcVariables.n16Temp2                               ;809584|8580    |000080;
    ASL A                                                      ;809586|0A      |      ;
    CLC                                                        ;809587|18      |      ;
    ADC.W #$000A                                               ;809588|690A00  |      ;
    TAX                                                        ;80958B|AA      |      ;
    LDA.W pSubrutineTable_80BEEC,X                             ;80958C|BDECBE  |80BEEC;
    CMP.W #$FFFF                                               ;80958F|C9FFFF  |      ;
    BEQ .load                                                  ;809592|F00A    |80959E;
    SEP #$20                                                   ;809594|E220    |      ;
    LDA.L nCurrentSeasonID                                     ;809596|AF191F7F|7F1F19;
    CMP.B #!SEASON_FALL                                                 
    BCC +                                                      ;80959C|9014    |8095B2;
 
.load:
    REP #$20                                                   ;80959E|C220    |      ;
    LDA.B strcVariables.n16Temp2                               ;8095A0|A580    |000080;
    CLC                                                        ;8095A2|18      |      ;
    ADC.B strcVariables.n16Temp1                               ;8095A3|657E    |00007E;
    ASL A                                                      ;8095A5|0A      |      ;
    TAX                                                        ;8095A6|AA      |      ;
    LDA.W pSubrutineTable_80BEEC,X                             ;8095A7|BDECBE  |80BEEC;
    CMP.W #$FFFF                                               ;8095AA|C9FFFF  |      ;
    BEQ +                                                      ;8095AD|F003    |8095B2;
    JSR.W (pSubrutineTable_80BEEC,X)                           ;8095AF|FCECBE  |80BEEC;
 
  + RTL                                                        ;8095B2|6B      |      ;
 
 
fGraphics_MapScrool:
    SEP #$20                                                   ;8095B3|E220    |      ;
    REP #$10                                                   ;8095B5|C210    |      ;
    LDA.W strcMapScrool.timer                                  ;8095B7|AD8008  |000880;
    BEQ +                                                      ;8095BA|F021    |8095DD;
    DEC A                                                      ;8095BC|3A      |      ;
    STA.W strcMapScrool.timer                                  ;8095BD|8D8008  |000880;
    REP #$20                                                   ;8095C0|C220    |      ;
    LDA.B strcCamera.cameraX                                   ;8095C2|A5F5    |0000F5;
    CLC                                                        ;8095C4|18      |      ;
    ADC.W strcMapScrool.speedX                                 ;8095C5|6D7C08  |00087C;
    STA.B strcCamera.cameraX                                   ;8095C8|85F5    |0000F5;
    STA.W strcBGScrool.BG1HorOffs                              ;8095CA|8D3C01  |00013C;
    LDA.B strcCamera.cameraY                                   ;8095CD|A5F7    |0000F7;
    CLC                                                        ;8095CF|18      |      ;
    ADC.W strcMapScrool.speedY                                 ;8095D0|6D7E08  |00087E;
    STA.B strcCamera.cameraY                                   ;8095D3|85F7    |0000F7;
    STA.W strcBGScrool.BG1VerOffs                              ;8095D5|8D3E01  |00013E;
    BPL +                                                      ;8095D8|1003    |8095DD;
    STZ.W strcBGScrool.BG1VerOffs                              ;8095DA|9C3E01  |00013E;
 
  + RTL                                                        ;8095DD|6B      |      ;
 
 
fAudioEngine_MapMusicHandler:
    SEP #$20                                                   ;8095DE|E220    |      ;
    REP #$10                                                   ;8095E0|C210    |      ;
    LDA.B strcMap.loadAreaId                                   ;8095E2|A522    |000022;
    CMP.B #$1E                                                 ;8095E4|C91E    |      ;
    BEQ fAudioEngine_SelectMapMusic                            ;8095E6|F00D    |8095F5;
    SEP #$20                                                   ;8095E8|E220    |      ;
    LDA.L nCurrentTimeID                                       ;8095EA|AF1C1F7F|7F1F1C;
    CMP.B #$12                                                 ;8095EE|C912    |      ;
    BCC fAudioEngine_SelectMapMusic                            ;8095F0|9003    |8095F5;
    JMP.W fAudioEngine_TurnOffMusic                            ;8095F2|4C6996  |809669;
 
 
fAudioEngine_SelectMapMusic:
    SEP #$20                                                   ;8095F5|E220    |      ;
    REP #$10                                                   ;8095F7|C210    |      ;
    STZ.W strcAudio.trackId                                    ;8095F9|9C1001  |000110;
    REP #$20                                                   ;8095FC|C220    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;8095FE|AD9601  |000196;
    AND.W #$0010                                               ;809601|291000  |      ;
    BNE .return                                                ;809604|D059    |80965F;
    LDA.W strcDialogDisplay.mapFlags                           ;809606|AD9601  |000196;
    AND.W #$0002                                               ;809609|290200  |      ;
    BNE .label1                                                ;80960C|D02B    |809639;
 
.default:
    SEP #$20                                                   ;80960E|E220    |      ;
    LDA.B #$00                                                 ;809610|A900    |      ;
    XBA                                                        ;809612|EB      |      ;
    LDA.B strcMap.loadAreaId                                   ;809613|A522    |000022;
    REP #$20                                                   ;809615|C220    |      ;
    ASL A                                                      ;809617|0A      |      ;
    TAX                                                        ;809618|AA      |      ;
    LDA.L pAudioEngine_MapMusic,X                              ;809619|BFE7B880|80B8E7; X = A * 2
    CMP.W #$FFFF                                               ;80961D|C9FFFF  |      ;
    BEQ .justReturn                                            ;809620|F046    |809668;
    STA.B strcVariables.n16Temp1                               ;809622|857E    |00007E;
    SEP #$20                                                   ;809624|E220    |      ;
    LDA.B #$00                                                 ;809626|A900    |      ;
    XBA                                                        ;809628|EB      |      ;
    LDA.L nCurrentSeasonID                                     ;809629|AF191F7F|7F1F19;
    REP #$20                                                   ;80962D|C220    |      ;
    TAY                                                        ;80962F|A8      |      ;
    SEP #$20                                                   ;809630|E220    |      ;
    LDA.B (strcVariables.n16Temp1),Y                           ;809632|B17E    |00007E; Y = SeasonId
    STA.W strcAudio.trackId                                    ;809634|8D1001  |000110;
    BRA .justReturn                                            ;809637|802F    |809668;
 
 
.label1:
    SEP #$20                                                   ;809639|E220    |      ;
    LDA.B strcMap.loadAreaId                                   ;80963B|A522    |000022;
    CMP.B #$5B                                                 ;80963D|C95B    |      ;
    BCS .default                                               ;80963F|B0CD    |80960E;
    CMP.B #$57                                                 ;809641|C957    |      ;
    BCS .justReturn                                            ;809643|B023    |809668;
    CMP.B #$31                                                 ;809645|C931    |      ;
    BCS ..case31                                               ;809647|B004    |80964D;
    CMP.B #$15                                                 ;809649|C915    |      ;
    BCS ..case15                                               ;80964B|B009    |809656;
 
..case31:
    SEP #$20                                                   ;80964D|E220    |      ;
    LDA.B #$13                                                 ;80964F|A913    |      ;
    STA.W strcAudio.trackId                                    ;809651|8D1001  |000110;
    BRA .justReturn                                            ;809654|8012    |809668;
 
 
..case15:
    SEP #$20                                                   ;809656|E220    |      ;
    LDA.B #$14                                                 ;809658|A914    |      ;
    STA.W strcAudio.trackId                                    ;80965A|8D1001  |000110;
    BRA .justReturn                                            ;80965D|8009    |809668;
 
 
.return:
    SEP #$20                                                   ;80965F|E220    |      ;
    LDA.B #$16                                                 ;809661|A916    |      ;
    STA.W strcAudio.trackId                                    ;809663|8D1001  |000110;
    BRA .justReturn                                            ;809666|8000    |809668;
 
 
.justReturn:
    RTL                                                        ;809668|6B      |      ;
 
 
fAudioEngine_TurnOffMusic:
    SEP #$20                                                   ;809669|E220    |      ;
    LDA.B #$FF                                                 ;80966B|A9FF    |      ;
    STA.W strcAudio.trackId                                    ;80966D|8D1001  |000110;
    RTL                                                        ;809670|6B      |      ;
 
 
fAudioEngine_MapChangeHandler:
    REP #$30                                                   ;809671|C230    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;809673|AD9601  |000196;
    AND.W #!AFLAGS_FORCETELEPORT                                               
    BNE +                                                      ;809679|D003    |80967E;
    JMP.W fReturn_80972B                                       ;80967B|4C2B97  |80972B; BUG: jump to .return
 
 
  + %CheckFlag(daily3, $8000)
    BNE .label2                                                ;809685|D024    |8096AB;
    %CheckFlag(daily4, $0100)
    BNE .label1                                                ;80968E|D00C    |80969C;
    %CheckFlag(daily4, $0040)
    BEQ .label1                                                ;809697|F003    |80969C;
 
.return:
    JMP.W fReturn_80972B                                       ;809699|4C2B97  |80972B; BUG: why not RTL ?
 
 
.label1:
    SEP #$20                                                   ;80969C|E220    |      ;
    LDA.W nDestinationAreaId                                   ;80969E|AD8B09  |00098B;
    STA.B strcMap.loadAreaId                                   ;8096A1|8522    |000022;
    JSL.L fAudioEngine_MapMusicHandler                         ;8096A3|22DE9580|8095DE;
    JSL.L fAudioUnknown_838401                                 ;8096A7|22018483|838401;
 
.label2:
    REP #$20                                                   ;8096AB|C220    |      ;
    %CheckFlag(daily4, $0008)
    BEQ +                                                      ;8096B4|F007    |8096BD;
    SEP #$20                                                   ;8096B6|E220    |      ;
    LDA.B #$3C                                                 ;8096B8|A93C    |      ;
    STA.W nDestinationAreaId                                   ;8096BA|8D8B09  |00098B;
 
  + SEP #$20                                                   ;8096BD|E220    |      ;
    LDA.B #$0F                                                 ;8096BF|A90F    |      ;
    STA.B strcVariables.n8Temp1                                ;8096C1|8592    |000092;
    LDA.B #$03                                                 ;8096C3|A903    |      ;
    STA.B strcVariables.n8Temp2                                ;8096C5|8593    |000093;
    LDA.B #$01                                                 ;8096C7|A901    |      ;
    STA.B strcVariables.n8Temp3                                ;8096C9|8594    |000094;
    JSL.L fCore_ScreenFadeout                                  ;8096CB|220A8880|80880A;
    JSL.L fCore_SetForceBlank                                  ;8096CF|220F8E80|808E0F;
 
fUnknown_8096D3:
    REP #$30                                                   ;8096D3|C230    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;8096D5|AD9601  |000196;
    AND.W #$3FDE                                               ;8096D8|29DE3F  |      ;
    STA.W strcDialogDisplay.mapFlags                           ;8096DB|8D9601  |000196;
    %UnsetFlag(daily2, $000F)
    %SetPlayerFlag(!PFLAGS_USERCONTROL)
    REP #$20                                                   ;8096F2|C220    |      ;
    LDA.W #$7000                                               ;8096F4|A90070  |      ;
    JSL.L fCore_ZeroVRAMatOffset                               ;8096F7|22BC8980|8089BC;
    JSL.L fCore_Zero0x42Ptr                                    ;8096FB|22AB8F80|808FAB;
    JSL.L fPalette_ZeroNextPalletePtr                          ;8096FF|22669180|809166;
    JSL.L fUnknown_Zero7EA220                                  ;809703|22D78E85|858ED7;
    JSL.L fObject_ClearGameObject                              ;809707|220F8285|85820F;
    JSL.L fUnknown_Zero07Ptr                                   ;80970B|22C7A481|81A4C7;
    JSL.L fAI_ZeroCCPtr                                        ;80970F|22008084|848000;
    SEP #$20                                                   ;809713|E220    |      ;
    LDA.W nDestinationAreaId                                   ;809715|AD8B09  |00098B;
    STA.B strcMap.loadAreaId                                   ;809718|8522    |000022;
    JSL.L fMapEngine_AreaEvents                                ;80971A|2298CA83|83CA98;
    JSL.L fAI_HowToPlaySetup                                   ;80971E|226F8184|84816F;
    SEP #$20                                                   ;809722|E220    |      ;
    LDA.W nDestinationAreaId                                   ;809724|AD8B09  |00098B;
    JSL.L fMap_SetupArea                                       ;809727|222C9780|80972C;
 
fReturn_80972B:
    RTL                                                        ;80972B|6B      |      ; FIXME: I want to be .return
 
 
fMap_SetupArea:
    SEP #$20                                                   ;80972C|E220    |      ; A: nAreaId
    REP #$10                                                   ;80972E|C210    |      ;
    STA.B strcMap.loadAreaId                                   ;809730|8522    |000022;
    PHA                                                        ;809732|48      |      ;
    SEP #$20                                                   ;809733|E220    |      ;
    STZ.W nTimeState                                           ;809735|9C7309  |000973;
    REP #$30                                                   ;809738|C230    |      ;
    LDY.W #$0001                                               ;80973A|A00100  |      ;
    JSL.L fTileMap_SetTileMapPointerGetAreaFlags               ;80973D|22AEA780|80A7AE;
    SEP #$20                                                   ;809741|E220    |      ;
    PHA                                                        ;809743|48      |      ;
    AND.B #$20                                                 ;809744|2920    |      ;
    BEQ .label1                                                ;809746|F012    |80975A;
    REP #$20                                                   ;809748|C220    |      ;
    %CheckFlag(daily2, $0001)
    BNE .label1                                                ;809751|D007    |80975A;
    SEP #$20                                                   ;809753|E220    |      ;
    LDA.B #$01                                                 ;809755|A901    |      ;
    STA.W nTimeState                                           ;809757|8D7309  |000973;
 
.label1:
    SEP #$20                                                   ;80975A|E220    |      ;
    PLA                                                        ;80975C|68      |      ;
    AND.B #$C0                                                 ;80975D|29C0    |      ;
    BNE .label2                                                ;80975F|D003    |809764;
    JMP.W .label8                                              ;809761|4CA898  |8098A8;
 
 
.label2:
    AND.B #$80                                                 ;809764|2980    |      ;
    BNE .label3                                                ;809766|D00D    |809775;
    REP #$20                                                   ;809768|C220    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;80976A|AD9601  |000196;
    AND.W #$0004                                               ;80976D|290400  |      ;
    BEQ .label3                                                ;809770|F003    |809775;
    JMP.W .label8                                              ;809772|4CA898  |8098A8;
 
 
.label3:
    REP #$20                                                   ;809775|C220    |      ;
    %CheckFlag(daily2, $0002)
    BEQ .label4                                                ;80977E|F003    |809783;
    JMP.W .label8                                              ;809780|4CA898  |8098A8;
 
 
.label4:
    REP #$20                                                   ;809783|C220    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;809785|AD9601  |000196;
    AND.W #$0002                                               ;809788|290200  |      ;
    BEQ .label5                                                ;80978B|F079    |809806;
    SEP #$20                                                   ;80978D|E220    |      ;
    LDA.B #$57                                                 ;80978F|A957    |      ;
    STA.B strcMap.loadAreaId                                   ;809791|8522    |000022;
    JSL.L fTileMap_MapChangeHandler                            ;809793|22C6A780|80A7C6;
    REP #$20                                                   ;809797|C220    |      ;
    SEP #$10                                                   ;809799|E210    |      ;
    LDA.W #$B9D7                                               ;80979B|A9D7B9  |      ;
    STA.B ptrTemp0x72                                          ;80979E|8572    |000072;
    SEP #$20                                                   ;8097A0|E220    |      ;
    LDA.B #$80                                                 ;8097A2|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;8097A4|8574    |000074; $72 = 0x80B9D7
    SEP #$20                                                   ;8097A6|E220    |      ;
    LDA.B #$0C                                                 ;8097A8|A90C    |      ;
    LDX.B #$00                                                 ;8097AA|A200    |      ;
    LDY.B #$00                                                 ;8097AC|A000    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;8097AE|22488E80|808E48;
    REP #$20                                                   ;8097B2|C220    |      ;
    SEP #$10                                                   ;8097B4|E210    |      ;
    LDA.W #$B9DC                                               ;8097B6|A9DCB9  |      ;
    STA.B ptrTemp0x72                                          ;8097B9|8572    |000072;
    SEP #$20                                                   ;8097BB|E220    |      ;
    LDA.B #$80                                                 ;8097BD|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;8097BF|8574    |000074; $72 = 0x80B9DC
    SEP #$20                                                   ;8097C1|E220    |      ;
    LDA.B #$0D                                                 ;8097C3|A90D    |      ;
    LDX.B #$01                                                 ;8097C5|A201    |      ;
    LDY.B #$00                                                 ;8097C7|A000    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;8097C9|22488E80|808E48;
    REP #$20                                                   ;8097CD|C220    |      ;
    SEP #$10                                                   ;8097CF|E210    |      ;
    LDA.W #$B9E2                                               ;8097D1|A9E2B9  |      ;
    STA.B ptrTemp0x72                                          ;8097D4|8572    |000072;
    SEP #$20                                                   ;8097D6|E220    |      ;
    LDA.B #$80                                                 ;8097D8|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;8097DA|8574    |000074; $72 = 0x80B9E2
    SEP #$20                                                   ;8097DC|E220    |      ;
    LDA.B #$0E                                                 ;8097DE|A90E    |      ;
    LDX.B #$02                                                 ;8097E0|A202    |      ;
    LDY.B #$00                                                 ;8097E2|A000    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;8097E4|22488E80|808E48;
    REP #$20                                                   ;8097E8|C220    |      ;
    SEP #$10                                                   ;8097EA|E210    |      ;
    LDA.W #$B9DF                                               ;8097EC|A9DFB9  |      ;
    STA.B ptrTemp0x72                                          ;8097EF|8572    |000072;
    SEP #$20                                                   ;8097F1|E220    |      ;
    LDA.B #$80                                                 ;8097F3|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;8097F5|8574    |000074; $72 - 0x80B9DF
    SEP #$20                                                   ;8097F7|E220    |      ;
    LDA.B #$0F                                                 ;8097F9|A90F    |      ;
    LDX.B #$03                                                 ;8097FB|A203    |      ;
    LDY.B #$00                                                 ;8097FD|A000    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;8097FF|22488E80|808E48;
    JMP.W .label8                                              ;809803|4CA898  |8098A8;
 
 
.label5:
    REP #$20                                                   ;809806|C220    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;809808|AD9601  |000196;
    AND.W #$0004                                               ;80980B|290400  |      ;
    BEQ .label7                                                ;80980E|F018    |809828;
    SEP #$20                                                   ;809810|E220    |      ;
    LDA.L nCurrentTimeID                                       ;809812|AF1C1F7F|7F1F1C;
    CMP.B #$11                                                 ;809816|C911    |      ;
    BCC .label6                                                ;809818|9003    |80981D;
    JMP.W .label8                                              ;80981A|4CA898  |8098A8;
 
 
.label6:
    LDA.B #$58                                                 ;80981D|A958    |      ;
    STA.B strcMap.loadAreaId                                   ;80981F|8522    |000022;
    JSL.L fTileMap_MapChangeHandler                            ;809821|22C6A780|80A7C6;
    JMP.W .label8                                              ;809825|4CA898  |8098A8;
 
 
.label7:
    REP #$20                                                   ;809828|C220    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;80982A|AD9601  |000196;
    AND.W #$0008                                               ;80982D|290800  |      ;
    BEQ .label8                                                ;809830|F076    |8098A8;
    SEP #$20                                                   ;809832|E220    |      ;
    LDA.B #$59                                                 ;809834|A959    |      ;
    STA.B strcMap.loadAreaId                                   ;809836|8522    |000022;
    JSL.L fTileMap_MapChangeHandler                            ;809838|22C6A780|80A7C6;
    REP #$20                                                   ;80983C|C220    |      ;
    SEP #$10                                                   ;80983E|E210    |      ;
    LDA.W #$B9EA                                               ;809840|A9EAB9  |      ;
    STA.B ptrTemp0x72                                          ;809843|8572    |000072;
    SEP #$20                                                   ;809845|E220    |      ;
    LDA.B #$80                                                 ;809847|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;809849|8574    |000074; $72 = 0x80B9EA
    SEP #$20                                                   ;80984B|E220    |      ;
    LDA.B #$0C                                                 ;80984D|A90C    |      ;
    LDX.B #$00                                                 ;80984F|A200    |      ;
    LDY.B #$00                                                 ;809851|A000    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;809853|22488E80|808E48;
    REP #$20                                                   ;809857|C220    |      ;
    SEP #$10                                                   ;809859|E210    |      ;
    LDA.W #$B9EF                                               ;80985B|A9EFB9  |      ;
    STA.B ptrTemp0x72                                          ;80985E|8572    |000072;
    SEP #$20                                                   ;809860|E220    |      ;
    LDA.B #$80                                                 ;809862|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;809864|8574    |000074; $72 = 0x80B9EF
    SEP #$20                                                   ;809866|E220    |      ;
    LDA.B #$0D                                                 ;809868|A90D    |      ;
    LDX.B #$01                                                 ;80986A|A201    |      ;
    LDY.B #$00                                                 ;80986C|A000    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80986E|22488E80|808E48;
    REP #$20                                                   ;809872|C220    |      ;
    SEP #$10                                                   ;809874|E210    |      ;
    LDA.W #$B9F2                                               ;809876|A9F2B9  |      ;
    STA.B ptrTemp0x72                                          ;809879|8572    |000072;
    SEP #$20                                                   ;80987B|E220    |      ;
    LDA.B #$80                                                 ;80987D|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80987F|8574    |000074; $72 = 0x80B9F2
    SEP #$20                                                   ;809881|E220    |      ;
    LDA.B #$0E                                                 ;809883|A90E    |      ;
    LDX.B #$02                                                 ;809885|A202    |      ;
    LDY.B #$00                                                 ;809887|A000    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;809889|22488E80|808E48;
    REP #$20                                                   ;80988D|C220    |      ;
    SEP #$10                                                   ;80988F|E210    |      ;
    LDA.W #$B9F5                                               ;809891|A9F5B9  |      ;
    STA.B ptrTemp0x72                                          ;809894|8572    |000072;
    SEP #$20                                                   ;809896|E220    |      ;
    LDA.B #$80                                                 ;809898|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80989A|8574    |000074; $72 = 0x80B9F5
    SEP #$20                                                   ;80989C|E220    |      ;
    LDA.B #$0F                                                 ;80989E|A90F    |      ;
    LDX.B #$03                                                 ;8098A0|A203    |      ;
    LDY.B #$00                                                 ;8098A2|A000    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;8098A4|22488E80|808E48;
 
.label8:
    JSL.L fDialog_Unknown_8392BB                               ;8098A8|22BB9283|8392BB;
    SEP #$20                                                   ;8098AC|E220    |      ;
    PLA                                                        ;8098AE|68      |      ;
    STA.B strcMap.loadAreaId                                   ;8098AF|8522    |000022;
    JSL.L fObjectMap_LoadData                                  ;8098B1|22FBA582|82A5FB;
    JSL.L fTileMap_MapChangeHandler                            ;8098B5|22C6A780|80A7C6;
    JSL.L fPalette_ChangeTimePallete                           ;8098B9|22E29280|8092E2;
    JSL.L fPalette_PrepareSpritePalette                        ;8098BD|22299380|809329;
    JSL.L fSubrutinesExecute_809553                            ;8098C1|22539580|809553;
    JSL.L fPalette_LoadMapPallete                              ;8098C5|22419280|809241;
    JSL.L fCore_Unknown808E69                                  ;8098C9|22698E80|808E69;
    SEP #$20                                                   ;8098CD|E220    |      ;
    REP #$10                                                   ;8098CF|C210    |      ;
    LDA.B #$00                                                 ;8098D1|A900    |      ;
    STA.B strcSystem.arrayIndex                                ;8098D3|8527    |000027;
    LDA.B #$22                                                 ;8098D5|A922    |      ;
    STA.B strcSystem.destinationRegister                       ;8098D7|8529    |000029;
    REP #$20                                                   ;8098D9|C220    |      ;
    LDY.W #$0200                                               ;8098DB|A00002  |      ;
    LDX.W #$0000                                               ;8098DE|A20000  |      ;
    LDA.W #$0900                                               ;8098E1|A90009  |      ;
    STA.B ptrTemp0x72                                          ;8098E4|8572    |000072;
    SEP #$20                                                   ;8098E6|E220    |      ;
    LDA.B #$7F                                                 ;8098E8|A97F    |      ;
    STA.B ptrTemp0x72+2                                        ;8098EA|8574    |000074;
    JSL.L fCore_PrepareTransfer                                ;8098EC|22338A80|808A33;
    JSL.L fCore_StartPreparedTransfer                          ;8098F0|22B28A80|808AB2;
    REP #$30                                                   ;8098F4|C230    |      ;
    STZ.B strcMap.unk1E                                        ;8098F6|641E    |00001E;
    LDA.B strcCamera.cameraX                                   ;8098F8|A5F5    |0000F5;
    STA.W strcBGScrool.BG2HorOffs                              ;8098FA|8D4001  |000140;
    LDA.B strcCamera.cameraY                                   ;8098FD|A5F7    |0000F7;
    STA.W strcBGScrool.BG2VerOffs                              ;8098FF|8D4201  |000142;
    SEP #$20                                                   ;809902|E220    |      ;
    LDA.B strcMap.loadAreaId                                   ;809904|A522    |000022;
    CMP.B #$26                                                 ;809906|C926    |      ;
    BNE .label9                                                ;809908|D008    |809912;
    REP #$20                                                   ;80990A|C220    |      ;
    LDA.W #$0100                                               ;80990C|A90001  |      ;
    STA.W strcBGScrool.BG2VerOffs                              ;80990F|8D4201  |000142;
 
.label9:
    SEP #$20                                                   ;809912|E220    |      ;
    STZ.W strcPlayerData.unkCounter91C                         ;809914|9C1C09  |00091C;
    REP #$20                                                   ;809917|C220    |      ;
    %UnsetFlag(daily1, $0200)
    LDA.W #$0000                                               ;809924|A90000  |      ;
    STA.L $7F1F7A                                              ;809927|8F7A1F7F|7F1F7A;
    STZ.W $0878                                                ;80992B|9C7808  |000878;
    LDA.B strcPlayer.posX                                      ;80992E|A5D6    |0000D6;
    STA.W strcObjectData.playerX                               ;809930|8D0709  |000907;
    LDA.B strcPlayer.posY                                      ;809933|A5D8    |0000D8;
    STA.W strcObjectData.playerY                               ;809935|8D0909  |000909;
    SEP #$20                                                   ;809938|E220    |      ;
    STZ.W $098A                                                ;80993A|9C8A09  |00098A;
    STZ.W strcPlayerData.unkCounter919                         ;80993D|9C1909  |000919;
    %UnsetPlayerFlag(!PFLAGS_INTRANSITION)
    REP #$20                                                   ;80994C|C220    |      ;
    STZ.W strcAiControlData.input                              ;80994E|9CFD08  |0008FD;
    STZ.W strcAiControlData.counter                            ;809951|9CFF08  |0008FF;
    %UnsetPlayerFlag(!PFLAGS_AISTEERING)
    SEP #$20                                                   ;809960|E220    |      ;
    LDA.W strcPlayerData.carryItemId                           ;809962|AD1D09  |00091D;
    BEQ .label11                                               ;809965|F055    |8099BC;
    CMP.B #!EITEM_PAINT                                                 
    BEQ .label10                                               ;809969|F046    |8099B1;
    CMP.B #!EITEM_MILKER                                                 
    BEQ .label10                                               ;80996D|F042    |8099B1;
    CMP.B #!EITEM_BRUSH                                                 
    BEQ .label10                                               ;809971|F03E    |8099B1;
    CMP.B #$57                                                 ;809973|C957    |      ;
    BEQ .label10                                               ;809975|F03A    |8099B1;
    STA.W nCarriedItemId                                       ;809977|8D8409  |000984;
    REP #$20                                                   ;80997A|C220    |      ;
    LDY.W #$0001                                               ;80997C|A00100  |      ;
    JSL.L fUnknown_8180B7                                      ;80997F|22B78081|8180B7;
    LDA.W strcObjectData.camX                                  ;809983|AD0B09  |00090B;
    STA.W nUnknownX                                            ;809986|8D8009  |000980;
    LDA.W strcObjectData.camY                                  ;809989|AD0D09  |00090D;
    STA.W nUnknownY                                            ;80998C|8D8209  |000982;
    SEP #$20                                                   ;80998F|E220    |      ;
    LDA.B #$01                                                 ;809991|A901    |      ;
    STA.W $0974                                                ;809993|8D7409  |000974;
    LDA.B #$01                                                 ;809996|A901    |      ;
    STA.W $0975                                                ;809998|8D7509  |000975;
    LDA.B #$02                                                 ;80999B|A902    |      ;
    STA.W $0976                                                ;80999D|8D7609  |000976;
    JSL.L fUnknown_81A500                                      ;8099A0|2200A581|81A500;
    REP #$30                                                   ;8099A4|C230    |      ;
    LDA.W #$0014                                               ;8099A6|A91400  |      ;
    CLC                                                        ;8099A9|18      |      ;
    ADC.B strcPlayer.direction                                 ;8099AA|65DA    |0000DA;
    STA.W strcObjectData.spriteIdx                             ;8099AC|8D0109  |000901;
    BRA .label12                                               ;8099AF|801C    |8099CD;
 
 
.label10:
    REP #$30                                                   ;8099B1|C230    |      ;
    LDA.W #$0000                                               ;8099B3|A90000  |      ;
    CLC                                                        ;8099B6|18      |      ;
    ADC.B strcPlayer.direction                                 ;8099B7|65DA    |0000DA;
    STA.W strcObjectData.spriteIdx                             ;8099B9|8D0109  |000901;
 
.label11:
    SEP #$20                                                   ;8099BC|E220    |      ;
    STZ.W strcPlayerData.carryItemId                           ;8099BE|9C1D09  |00091D;
    %UnsetPlayerFlag(!PFLAGS_HOLDINGITEM)
 
.label12:
    JSL.L fUnknown_81CFA0                                      ;8099CD|22A0CF81|81CFA0;
    JSL.L fUnknownSubrutineHandler_81BFB7                      ;8099D1|22B7BF81|81BFB7;
    REP #$30                                                   ;8099D5|C230    |      ;
    %CheckFlag(daily3, $0002)
    BNE .label13                                               ;8099DE|D004    |8099E4;
    JSL.L fGameEngine_ChichenUnknown83C296                     ;8099E0|2296C283|83C296;
 
.label13:
    %SetPlayerAction(!PACTION_NONE)
    JSL.L fAudioUnknown_83841F                                 ;8099EB|221F8483|83841F;
    JSL.L fAudioUnknown_8383A4                                 ;8099EF|22A48383|8383A4;
    JSL.L fAudioUnknown_838380                                 ;8099F3|22808383|838380;
    JSL.L fToolUsedSound_Unknown828FF3                         ;8099F7|22F38F82|828FF3;
    SEP #$20                                                   ;8099FB|E220    |      ;
    LDA.W strcAudio.trackId                                    ;8099FD|AD1001  |000110;
    STA.W strcAudio.trackIdCopy                                ;809A00|8D1701  |000117;
    JSL.L fCore_WaitForNextNMI                                 ;809A03|22458680|808645;
    REP #$20                                                   ;809A07|C220    |      ;
    LDA.W #$1800                                               ;809A09|A90018  |      ;
    STA.B $C7                                                  ;809A0C|85C7    |0000C7;
    JSL.L fUnknown_81A383                                      ;809A0E|2283A381|81A383;
    JSL.L fAI_HowToPlaySetup                                   ;809A12|226F8184|84816F;
    JSL.L fObject_Unknown8582C7                                ;809A16|22C78285|8582C7;
    JSL.L fUnknown_858CB2                                      ;809A1A|22B28C85|858CB2;
    JSL.L fUnknown_8583E0                                      ;809A1E|22E08385|8583E0;
    SEP #$20                                                   ;809A22|E220    |      ;
    STZ.B $00                                                  ;809A24|6400    |000000;
    JSL.L fCore_WaitForNextNMI                                 ;809A26|22458680|808645;
    REP #$20                                                   ;809A2A|C220    |      ;
    LDA.W #$1800                                               ;809A2C|A90018  |      ;
    STA.B $C7                                                  ;809A2F|85C7    |0000C7;
    JSL.L fUnknown_81A383                                      ;809A31|2283A381|81A383;
    JSL.L fAI_HowToPlaySetup                                   ;809A35|226F8184|84816F;
    JSL.L fObject_Unknown8582C7                                ;809A39|22C78285|8582C7;
    JSL.L fUnknown_858CB2                                      ;809A3D|22B28C85|858CB2;
    JSL.L fUnknown_8583E0                                      ;809A41|22E08385|8583E0;
    SEP #$20                                                   ;809A45|E220    |      ;
    STZ.B $00                                                  ;809A47|6400    |000000;
    JSL.L fCore_WaitForNextNMI                                 ;809A49|22458680|808645;
    JSL.L fCore_ResetForceBlank                                ;809A4D|221E8E80|808E1E;
    SEP #$20                                                   ;809A51|E220    |      ;
    LDA.B #$03                                                 ;809A53|A903    |      ;
    STA.B strcVariables.n8Temp1                                ;809A55|8592    |000092;
    LDA.B #$03                                                 ;809A57|A903    |      ;
    STA.B strcVariables.n8Temp2                                ;809A59|8593    |000093;
    LDA.B #$0F                                                 ;809A5B|A90F    |      ;
    STA.B strcVariables.n8Temp3                                ;809A5D|8594    |000094;
    JSL.L fCore_ScreenFadein                                   ;809A5F|22CE8780|8087CE;
    RTL                                                        ;809A63|6B      |      ;
 
 
fMapChangeHandler_809A64:
    REP #$30                                                   ;809A64|C230    |      ;
    LDA.W $0878                                                ;809A66|AD7808  |000878;
    CMP.W #$00C0                                               ;809A69|C9C000  |      ;
    BCS .label1                                                ;809A6C|B003    |809A71;
    JMP.W .return                                              ;809A6E|4C0A9D  |809D0A;
 
 
.label1:
    CMP.W #$00D0                                               ;809A71|C9D000  |      ;
    BCC .label2                                                ;809A74|9003    |809A79;
    JMP.W .caseD0                                              ;809A76|4C0B9D  |809D0B;
 
 
.label2:
    LDA.W $087A                                                ;809A79|AD7A08  |00087A;
    CMP.W #$00C0                                               ;809A7C|C9C000  |      ;
    BCS .label3                                                ;809A7F|B003    |809A84;
    JMP.W .return                                              ;809A81|4C0A9D  |809D0A;
 
 
.label3:
    CMP.W #$00D0                                               ;809A84|C9D000  |      ;
    BCC .label4                                                ;809A87|9003    |809A8C;
    JMP.W .caseD0                                              ;809A89|4C0B9D  |809D0B;
 
 
.label4:
    %CheckPlayerFlags(!PFLAGS_RIDINGHORSE)
    BEQ .label5                                                ;809A93|F003    |809A98;
    JMP.W .return                                              ;809A95|4C0A9D  |809D0A;
 
 
.label5:
    REP #$20                                                   ;809A98|C220    |      ;
    %CheckFlag(daily4, $0006)
    BEQ .label6                                                ;809AA1|F003    |809AA6;
    JMP.W .return                                              ;809AA3|4C0A9D  |809D0A;
 
 
.label6:
    REP #$20                                                   ;809AA6|C220    |      ;
    %CheckFlag(event5, $0001)
    BEQ .label7                                                ;809AAF|F022    |809AD3;
    REP #$20                                                   ;809AB1|C220    |      ;
    LDA.W $0878                                                ;809AB3|AD7808  |000878;
    ASL A                                                      ;809AB6|0A      |      ;
    ASL A                                                      ;809AB7|0A      |      ;
    TAY                                                        ;809AB8|A8      |      ;
    SEP #$20                                                   ;809AB9|E220    |      ;
    LDA.B #$00                                                 ;809ABB|A900    |      ;
    XBA                                                        ;809ABD|EB      |      ;
    LDA.B [strcMap.pSelected],Y                                ;809ABE|B70D    |00000D;
    REP #$20                                                   ;809AC0|C220    |      ;
    ASL A                                                      ;809AC2|0A      |      ;
    ASL A                                                      ;809AC3|0A      |      ;
    ASL A                                                      ;809AC4|0A      |      ;
    TAX                                                        ;809AC5|AA      |      ;
    SEP #$20                                                   ;809AC6|E220    |      ;
    LDA.L aScreenTransitionTable,X                             ;809AC8|BFF5B680|80B6F5;
    CMP.B #$1C                                                 ;809ACC|C91C    |      ;
    BNE .label7                                                ;809ACE|D003    |809AD3;
    JMP.W .return                                              ;809AD0|4C0A9D  |809D0A;
 
 
.label7:
    %SetPlayerAction(!PACTION_NONE)
    %SetPlayerFlag(!PFLAGS_INTRANSITION)
    SEP #$20                                                   ;809AE3|E220    |      ;
    LDA.W $098A                                                ;809AE5|AD8A09  |00098A;
    CMP.B #$01                                                 ;809AE8|C901    |      ;
    BNE .label8                                                ;809AEA|D003    |809AEF;
    JMP.W .label24                                             ;809AEC|4C5D9C  |809C5D;
 
 
.label8:
    CMP.B #$02                                                 ;809AEF|C902    |      ;
    BCC .label9                                                ;809AF1|9003    |809AF6;
    JMP.W .label25                                             ;809AF3|4C679C  |809C67;
 
 
.label9:
    INC A                                                      ;809AF6|1A      |      ;
    STA.W $098A                                                ;809AF7|8D8A09  |00098A;
    REP #$20                                                   ;809AFA|C220    |      ;
    LDA.W $0878                                                ;809AFC|AD7808  |000878;
    ASL A                                                      ;809AFF|0A      |      ;
    ASL A                                                      ;809B00|0A      |      ;
    TAY                                                        ;809B01|A8      |      ;
    SEP #$20                                                   ;809B02|E220    |      ;
    LDA.B #$00                                                 ;809B04|A900    |      ;
    XBA                                                        ;809B06|EB      |      ;
    LDA.B [strcMap.pSelected],Y                                ;809B07|B70D    |00000D;
    REP #$20                                                   ;809B09|C220    |      ;
    ASL A                                                      ;809B0B|0A      |      ;
    ASL A                                                      ;809B0C|0A      |      ;
    ASL A                                                      ;809B0D|0A      |      ;
    TAX                                                        ;809B0E|AA      |      ;
    SEP #$20                                                   ;809B0F|E220    |      ;
    LDA.L aScreenTransitionTable,X                             ;809B11|BFF5B680|80B6F5;
    STA.W nDestinationAreaId                                   ;809B15|8D8B09  |00098B;
    INX                                                        ;809B18|E8      |      ;
    INX                                                        ;809B19|E8      |      ;
    SEP #$20                                                   ;809B1A|E220    |      ;
    LDA.L aScreenTransitionTable,X                             ;809B1C|BFF5B680|80B6F5;
    STA.B strcVariables.n8Temp1                                ;809B20|8592    |000092;
    INX                                                        ;809B22|E8      |      ;
    LDA.L aScreenTransitionTable,X                             ;809B23|BFF5B680|80B6F5;
    AND.B #$01                                                 ;809B27|2901    |      ;
    BEQ .label10                                               ;809B29|F00B    |809B36;
    LDA.W nDestinationAreaId                                   ;809B2B|AD8B09  |00098B;
    CLC                                                        ;809B2E|18      |      ;
    ADC.L nCurrentSeasonID                                     ;809B2F|6F191F7F|7F1F19;
    STA.W nDestinationAreaId                                   ;809B33|8D8B09  |00098B;
 
.label10:
    SEP #$20                                                   ;809B36|E220    |      ;
    LDA.L aScreenTransitionTable,X                             ;809B38|BFF5B680|80B6F5;
    AND.B #$40                                                 ;809B3C|2940    |      ;
    BEQ .label13                                               ;809B3E|F03D    |809B7D;
    LDA.L nCurrentDay                                          ;809B40|AF1B1F7F|7F1F1B;
    CMP.B #$01                                                 ;809B44|C901    |      ;
    BEQ .label11                                               ;809B46|F017    |809B5F;
    CMP.B #$18                                                 ;809B48|C918    |      ;
    BEQ .label12                                               ;809B4A|F022    |809B6E;
    CMP.B #$0A                                                 ;809B4C|C90A    |      ;
    BCC .label13                                               ;809B4E|902D    |809B7D;
    CMP.B #$0D                                                 ;809B50|C90D    |      ;
    BCS .label13                                               ;809B52|B029    |809B7D;
    LDA.W nDestinationAreaId                                   ;809B54|AD8B09  |00098B;
    CLC                                                        ;809B57|18      |      ;
    ADC.B #$04                                                 ;809B58|6904    |      ;
    STA.W nDestinationAreaId                                   ;809B5A|8D8B09  |00098B;
    BRA .label13                                               ;809B5D|801E    |809B7D;
 
 
.label11:
    SEP #$20                                                   ;809B5F|E220    |      ;
    LDA.L nCurrentSeasonID                                     ;809B61|AF191F7F|7F1F19;
    BNE .label13                                               ;809B65|D016    |809B7D;
    LDA.B #$3A                                                 ;809B67|A93A    |      ;
    STA.W nDestinationAreaId                                   ;809B69|8D8B09  |00098B;
    BRA .label13                                               ;809B6C|800F    |809B7D;
 
 
.label12:
    SEP #$20                                                   ;809B6E|E220    |      ;
    LDA.L nCurrentSeasonID                                     ;809B70|AF191F7F|7F1F19;
    CMP.B #!SEASON_WINTER                                                 
    BNE .label13                                               ;809B76|D005    |809B7D;
    LDA.B #!AREA_NY_MOUNTAINTOP                                                 
    STA.W nDestinationAreaId                                   ;809B7A|8D8B09  |00098B;
 
.label13:
    SEP #$20                                                   ;809B7D|E220    |      ;
    LDA.B strcMap.loadAreaId                                   ;809B7F|A522    |000022;
    CMP.B #!AREA_EGGFESTIVAL                                                 
    BNE .label14                                               ;809B83|D003    |809B88;
    JMP.W .label21                                             ;809B85|4C149C  |809C14;
 
 
.label14:
    LDA.L aScreenTransitionTable,X                             ;809B88|BFF5B680|80B6F5;
    AND.B #$02                                                 ;809B8C|2902    |      ;
    BEQ .label15                                               ;809B8E|F00A    |809B9A;
    LDA.L nCurrentTimeID                                       ;809B90|AF1C1F7F|7F1F1C;
    CMP.B #$11                                                 ;809B94|C911    |      ;
    BCC .label15                                               ;809B96|9002    |809B9A;
    BRA .label21                                               ;809B98|807A    |809C14;
 
 
.label15:
    SEP #$20                                                   ;809B9A|E220    |      ;
    LDA.L aScreenTransitionTable,X                             ;809B9C|BFF5B680|80B6F5;
    AND.B #$04                                                 ;809BA0|2904    |      ;
    BEQ .label16                                               ;809BA2|F00A    |809BAE;
    LDA.L nCurrentTimeID                                       ;809BA4|AF1C1F7F|7F1F1C;
    CMP.B #$11                                                 ;809BA8|C911    |      ;
    BCS .label16                                               ;809BAA|B002    |809BAE;
    BRA .label21                                               ;809BAC|8066    |809C14;
 
 
.label16:
    SEP #$20                                                   ;809BAE|E220    |      ;
    LDA.L aScreenTransitionTable,X                             ;809BB0|BFF5B680|80B6F5;
    AND.B #$08                                                 ;809BB4|2908    |      ;
    BEQ .label17                                               ;809BB6|F00C    |809BC4;
    LDA.L nCurrentWeekdayID                                    ;809BB8|AF1A1F7F|7F1F1A;
    BEQ .label17                                               ;809BBC|F006    |809BC4;
    CMP.B #!DAY_SATURDAY                                                 
    BEQ .label17                                               ;809BC0|F002    |809BC4;
    BRA .label21                                               ;809BC2|8050    |809C14;
 
 
.label17:
    SEP #$20                                                   ;809BC4|E220    |      ;
    LDA.L aScreenTransitionTable,X                             ;809BC6|BFF5B680|80B6F5;
    AND.B #$10                                                 ;809BCA|2910    |      ;
    BEQ .label19                                               ;809BCC|F01E    |809BEC;
    LDA.L nCurrentSeasonID                                     ;809BCE|AF191F7F|7F1F19;
    CMP.B #!SEASON_WINTER                                                 
    BNE .label18                                               ;809BD4|D00A    |809BE0;
    LDA.L nCurrentDay                                          ;809BD6|AF1B1F7F|7F1F1B;
    CMP.B #$0A                                                 ;809BDA|C90A    |      ;
    BNE .label18                                               ;809BDC|D002    |809BE0;
    BRA .label21                                               ;809BDE|8034    |809C14;
 
 
.label18:
    SEP #$20                                                   ;809BE0|E220    |      ;
    LDA.L nCurrentWeekdayID                                    ;809BE2|AF1A1F7F|7F1F1A;
    CMP.B #!DAY_SATURDAY                                                 
    BNE .label19                                               ;809BE8|D002    |809BEC;
    BRA .label21                                               ;809BEA|8028    |809C14;
 
 
.label19:
    SEP #$20                                                   ;809BEC|E220    |      ;
    LDA.L aScreenTransitionTable,X                             ;809BEE|BFF5B680|80B6F5;
    AND.B #$20                                                 ;809BF2|2920    |      ;
    BEQ .label20                                               ;809BF4|F008    |809BFE;
    LDA.L nCurrentWeekdayID                                    ;809BF6|AF1A1F7F|7F1F1A;
    BNE .label20                                               ;809BFA|D002    |809BFE;
    BRA .label21                                               ;809BFC|8016    |809C14;
 
 
.label20:
    SEP #$20                                                   ;809BFE|E220    |      ;
    LDA.L aScreenTransitionTable,X                             ;809C00|BFF5B680|80B6F5;
    AND.B #$80                                                 ;809C04|2980    |      ;
    BEQ .label22                                               ;809C06|F028    |809C30;
    REP #$20                                                   ;809C08|C220    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;809C0A|AD9601  |000196;
    AND.W #$0010                                               ;809C0D|291000  |      ;
    BEQ .label22                                               ;809C10|F01E    |809C30;
    BRA .label21                                               ;809C12|8000    |809C14;
 
 
.label21:
    %UnsetPlayerFlag(!PFLAGS_INTRANSITION)
    REP #$20                                                   ;809C20|C220    |      ;
    STZ.W $0878                                                ;809C22|9C7808  |000878;
    STZ.W $087A                                                ;809C25|9C7A08  |00087A;
    SEP #$20                                                   ;809C28|E220    |      ;
    STZ.W $098A                                                ;809C2A|9C8A09  |00098A;
    JMP.W .return                                              ;809C2D|4C0A9D  |809D0A;
 
 
.label22:
    SEP #$20                                                   ;809C30|E220    |      ;
    STZ.W nTimeState                                           ;809C32|9C7309  |000973;
    INX                                                        ;809C35|E8      |      ;
    REP #$20                                                   ;809C36|C220    |      ;
    LDA.L aScreenTransitionTable,X                             ;809C38|BFF5B680|80B6F5;
    STA.W strcDialogDisplay.mapDestX                           ;809C3C|8D7D01  |00017D;
    INX                                                        ;809C3F|E8      |      ;
    INX                                                        ;809C40|E8      |      ;
    LDA.L aScreenTransitionTable,X                             ;809C41|BFF5B680|80B6F5;
    STA.W strcDialogDisplay.mapDestY                           ;809C45|8D7F01  |00017F;
    SEP #$20                                                   ;809C48|E220    |      ;
    LDA.B #$00                                                 ;809C4A|A900    |      ;
    XBA                                                        ;809C4C|EB      |      ;
    LDA.B strcVariables.n8Temp1                                ;809C4D|A592    |000092;
    CMP.B #$00                                                 ;809C4F|C900    |      ;
    BNE .label23                                               ;809C51|D003    |809C56;
    JMP.W .return                                              ;809C53|4C0A9D  |809D0A;
 
 
.label23:
    JSL.L fUnknownCF_SetPointer                                ;809C56|22E1A581|81A5E1;
    JMP.W .return                                              ;809C5A|4C0A9D  |809D0A;
 
 
.label24:
    REP #$20                                                   ;809C5D|C220    |      ;
    LDA.W ptrUnknown0xCF                                       ;809C5F|ADCF00  |0000CF;
    BEQ .label25                                               ;809C62|F003    |809C67;
    JMP.W .return                                              ;809C64|4C0A9D  |809D0A;
 
 
.label25:
    SEP #$20                                                   ;809C67|E220    |      ;
    LDA.W $098A                                                ;809C69|AD8A09  |00098A;
    CMP.B #$0D                                                 ;809C6C|C90D    |      ;
    BEQ .destinationFarm                                       ;809C6E|F063    |809CD3;
    INC A                                                      ;809C70|1A      |      ;
    STA.W $098A                                                ;809C71|8D8A09  |00098A;
    %SetPlayerAction(!PACTION_WALK)
    REP #$20                                                   ;809C7B|C220    |      ;
    LDA.B strcPlayer.direction                                 ;809C7D|A5DA    |0000DA;
    CMP.W #!PDIR_DOWN                                               
    BEQ .setDirectionDown                                      ;809C82|F01C    |809CA0;
    CMP.W #!PDIR_UP                                               
    BEQ .setDirectionUp                                        ;809C87|F028    |809CB1;
    CMP.W #!PDIR_LEFT                                               
    BEQ .setDirectionLeft                                      ;809C8C|F034    |809CC2;
    %SetPlayerDirection(!PDIR_RIGHT)
    %SetObjectDirection(!PDIR_RIGHT)
    JMP.W .return                                              ;809C9D|4C0A9D  |809D0A;
 
 
.setDirectionDown:
    %SetPlayerDirection(!PDIR_DOWN)
    %SetObjectDirection(!PDIR_DOWN)
    BRA .return                                                ;809CAF|8059    |809D0A;
 
 
.setDirectionUp:
    %SetPlayerDirection(!PDIR_UP)
    %SetObjectDirection(!PDIR_UP)
    BRA .return                                                ;809CC0|8048    |809D0A;
 
 
.setDirectionLeft:
    %SetPlayerDirection(!PDIR_LEFT)
    %SetObjectDirection(!PDIR_LEFT)
    BRA .return                                                ;809CD1|8037    |809D0A;
 
 
.destinationFarm:
    SEP #$20                                                   ;809CD3|E220    |      ;
    LDA.W strcMap.loadAreaId                                   ;809CD5|AD2200  |000022;
    CMP.B #!AREA_TOWNSPRING                                                 
    BCS .destinationNotFarm                                    ;809CDA|B004    |809CE0;
    JSL.L fObjectMap_LoadFarm                                  ;809CDC|2282A682|82A682;
 
.destinationNotFarm:
    SEP #$20                                                   ;809CE0|E220    |      ;
    LDA.B strcMap.loadAreaId                                   ;809CE2|A522    |000022;
    CMP.B #!AREA_CROSSROADSPRING                                                 
    BCC .destinationCrossRoad                                  ;809CE6|9017    |809CFF;
    LDA.B strcMap.loadAreaId                                   ;809CE8|A522    |000022;
    CMP.B #!AREA_WOODSSPRING                                                 
    BCS .destinationCrossRoad                                  ;809CEC|B011    |809CFF;
    LDA.L nCurrentTimeID                                       ;809CEE|AF1C1F7F|7F1F1C;
    CMP.B #$12                                                 ;809CF2|C912    |      ;
    BEQ .destinationCrossRoad                                  ;809CF4|F009    |809CFF;
    INC A                                                      ;809CF6|1A      |      ;
    STA.L nCurrentTimeID                                       ;809CF7|8F1C1F7F|7F1F1C; changing area increase time by 1 hour
    JSL.L fUnknown_8280AA                                      ;809CFB|22AA8082|8280AA;
 
.destinationCrossRoad:
    REP #$30                                                   ;809CFF|C230    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;809D01|AD9601  |000196;
    ORA.W #!AFLAGS_FORCETELEPORT                                               
    STA.W strcDialogDisplay.mapFlags                           ;809D07|8D9601  |000196;
 
.return:
    RTL                                                        ;809D0A|6B      |      ;
 
 
.caseD0:
    SEP #$20                                                   ;809D0B|E220    |      ;
    REP #$10                                                   ;809D0D|C210    |      ;
    LDA.B strcMap.loadAreaId                                   ;809D0F|A522    |000022;
    CMP.B #!AREA_TOWNSPRING                                                 
    BCS .destinationNotFarm2                                   ;809D13|B003    |809D18;
    JMP.W .return2                                             ;809D15|4CBB9E  |809EBB;
 
 
.destinationNotFarm2:
    SEP #$20                                                   ;809D18|E220    |      ;
    LDA.B strcMap.loadAreaId                                   ;809D1A|A522    |000022;
    CMP.B #!AREA_WOODSSPRING                                                 
    BCS .label34                                               ;809D1E|B003    |809D23;
    JMP.W .return2                                             ;809D20|4CBB9E  |809EBB;
 
 
.label34:
    CMP.B #!AREA_NY_SPA                                                 
    BCC .label35                                               ;809D25|9003    |809D2A;
    JMP.W .return2                                             ;809D27|4CBB9E  |809EBB;
 
 
.label35:
    REP #$30                                                   ;809D2A|C230    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;809D2C|AD9601  |000196;
    AND.W #$001A                                               ;809D2F|291A00  |      ;
    BEQ .label36                                               ;809D32|F003    |809D37;
    JMP.W .return2                                             ;809D34|4CBB9E  |809EBB;
 
 
.label36:
    LDA.W $0878                                                ;809D37|AD7808  |000878;
    CMP.W #$00F9                                               ;809D3A|C9F900  |      ;
    BNE .label37                                               ;809D3D|D003    |809D42;
    JMP.W .caseF9                                              ;809D3F|4CFD9D  |809DFD;
 
 
.label37:
    LDA.W $087A                                                ;809D42|AD7A08  |00087A;
    CMP.W #$00F9                                               ;809D45|C9F900  |      ;
    BNE .label38                                               ;809D48|D003    |809D4D;
    JMP.W .caseF9                                              ;809D4A|4CFD9D  |809DFD;
 
 
.label38:
    LDA.W $0878                                                ;809D4D|AD7808  |000878;
    CMP.W #$00FA                                               ;809D50|C9FA00  |      ;
    BNE .label39                                               ;809D53|D003    |809D58;
    JMP.W .caseFA                                              ;809D55|4C3F9E  |809E3F;
 
 
.label39:
    LDA.W $087A                                                ;809D58|AD7A08  |00087A;
    CMP.W #$00FA                                               ;809D5B|C9FA00  |      ;
    BNE .label40                                               ;809D5E|D003    |809D63;
    JMP.W .caseFA                                              ;809D60|4C3F9E  |809E3F;
 
 
.label40:
    LDA.W $0878                                                ;809D63|AD7808  |000878;
    CMP.W #$00FB                                               ;809D66|C9FB00  |      ;
    BNE .label41                                               ;809D69|D003    |809D6E;
    JMP.W .case7B                                              ;809D6B|4C7D9E  |809E7D;
 
 
.label41:
    LDA.W $087A                                                ;809D6E|AD7A08  |00087A;
    CMP.W #$00FB                                               ;809D71|C9FB00  |      ;
    BNE .label42                                               ;809D74|D003    |809D79;
    JMP.W .case7B                                              ;809D76|4C7D9E  |809E7D;
 
 
.label42:
    REP #$20                                                   ;809D79|C220    |      ;
    %CheckFlag(daily1, $0200)
    BNE .label43                                               ;809D82|D003    |809D87;
    JMP.W .return2                                             ;809D84|4CBB9E  |809EBB;
 
 
.label43:
    %CheckPlayerFlags(!PFLAGS_HOLDINGITEM)
    BEQ .label44                                               ;809D8E|F003    |809D93;
    JMP.W .return2                                             ;809D90|4CBB9E  |809EBB;
 
 
.label44:
    %CheckPlayerFlags(!PFLAGS_RIDINGHORSE)
    BEQ .label45                                               ;809D9A|F003    |809D9F;
    JMP.W .return2                                             ;809D9C|4CBB9E  |809EBB;
 
 
.label45:
    %CheckPlayerFlags(!PFLAGS_DOGHUGGING)
    BEQ .label46                                               ;809DA6|F003    |809DAB;
    JMP.W .return2                                             ;809DA8|4CBB9E  |809EBB;
 
 
.label46:
    REP #$20                                                   ;809DAB|C220    |      ;
    LDA.W $0878                                                ;809DAD|AD7808  |000878;
    CMP.W #$00F8                                               ;809DB0|C9F800  |      ;
    BEQ .label47                                               ;809DB3|F003    |809DB8;
    JMP.W .return2                                             ;809DB5|4CBB9E  |809EBB;
 
 
.label47:
    LDA.W $087A                                                ;809DB8|AD7A08  |00087A;
    CMP.W #$00F8                                               ;809DBB|C9F800  |      ;
    BEQ .label48                                               ;809DBE|F003    |809DC3;
    JMP.W .return2                                             ;809DC0|4CBB9E  |809EBB;
 
 
.label48:
    %CheckPlayerAction(!PACTION_10)
    BNE .label49                                               ;809DCA|D003    |809DCF;
    JMP.W .return2                                             ;809DCC|4CBB9E  |809EBB;
 
 
.label49:
    %CheckPlayerAction(!PACTION_FISHING)
    BNE .label50                                               ;809DD6|D003    |809DDB;
    JMP.W .return2                                             ;809DD8|4CBB9E  |809EBB;
 
 
.label50:
    %CheckPlayerAction(!PACTION_FISHINGBITE)
    BNE .label51                                               ;809DE2|D003    |809DE7;
    JMP.W .return2                                             ;809DE4|4CBB9E  |809EBB;
 
 
.label51:
    %CheckPlayerAction(!PACTION_REELING)
    BNE .label52                                               ;809DEE|D003    |809DF3;
    JMP.W .return2                                             ;809DF0|4CBB9E  |809EBB;
 
 
.label52:
    %SetPlayerAction(!PACTION_0F)
    JMP.W .return2                                             ;809DFA|4CBB9E  |809EBB;
 
 
.caseF9:
    SEP #$20                                                   ;809DFD|E220    |      ;
    REP #$10                                                   ;809DFF|C210    |      ;
    LDA.L nCurrentSeasonID                                     ;809E01|AF191F7F|7F1F19;
    BEQ .label54                                               ;809E05|F003    |809E0A;
    JMP.W .return2                                             ;809E07|4CBB9E  |809EBB;
 
 
.label54:
    LDA.B #$10                                                 ;809E0A|A910    |      ;
    JSL.L fCore_GetRandomNumber                                ;809E0C|22F98980|8089F9;
    BEQ .label55                                               ;809E10|F003    |809E15;
    JMP.W .return2                                             ;809E12|4CBB9E  |809EBB;
 
 
.label55:
    REP #$20                                                   ;809E15|C220    |      ;
    %CheckFlag(daily2, $2000)
    BEQ .label56                                               ;809E1E|F003    |809E23;
    JMP.W .return2                                             ;809E20|4CBB9E  |809EBB;
 
 
.label56:
    %SetFlag(daily2, $2000)
    REP #$30                                                   ;809E2E|C230    |      ;
    %AIExecute($0011, $002C, $0000)
    BRA .return2                                               ;809E3D|807C    |809EBB;
 
 
.caseFA:
    SEP #$20                                                   ;809E3F|E220    |      ;
    REP #$10                                                   ;809E41|C210    |      ;
    LDA.L nCurrentSeasonID                                     ;809E43|AF191F7F|7F1F19;
    CMP.B #!SEASON_FALL                                                 
    BNE .return2                                               ;809E49|D070    |809EBB;
    LDA.B #$10                                                 ;809E4B|A910    |      ;
    JSL.L fCore_GetRandomNumber                                ;809E4D|22F98980|8089F9;
    BEQ .label58                                               ;809E51|F003    |809E56;
    JMP.W .return2                                             ;809E53|4CBB9E  |809EBB;
 
 
.label58:
    REP #$20                                                   ;809E56|C220    |      ;
    %CheckFlag(daily2, $4000)
    BNE .return2                                               ;809E5F|D05A    |809EBB;
    %SetFlag(daily2, $4000)
    REP #$30                                                   ;809E6C|C230    |      ;
    %AIExecute($0013, $002B, $0000)
    BRA .return2                                               ;809E7B|803E    |809EBB;
 
 
.case7B:
    SEP #$20                                                   ;809E7D|E220    |      ;
    REP #$10                                                   ;809E7F|C210    |      ;
    LDA.L nCurrentSeasonID                                     ;809E81|AF191F7F|7F1F19;
    CMP.B #!SEASON_WINTER                                                 
    BNE .return2                                               ;809E87|D032    |809EBB;
    LDA.B #$10                                                 ;809E89|A910    |      ;
    JSL.L fCore_GetRandomNumber                                ;809E8B|22F98980|8089F9;
    BEQ .label60                                               ;809E8F|F003    |809E94;
    JMP.W .return2                                             ;809E91|4CBB9E  |809EBB;
 
 
.label60:
    REP #$20                                                   ;809E94|C220    |      ;
    %CheckFlag(daily2, $8000)
    BNE .return2                                               ;809E9D|D01C    |809EBB;
    %SetFlag(daily2, $8000)
    REP #$30                                                   ;809EAA|C230    |      ;
    %AIExecute($0012, $002A, $0000)
    BRA .return2                                               ;809EB9|8000    |809EBB;
 
 
.return2:
    RTL                                                        ;809EBB|6B      |      ;
 
 
fUnknown_809EBC:
    REP #$30                                                   ;809EBC|C230    |      ;
    LDA.B strcPlayer.posX                                      ;809EBE|A5D6    |0000D6;
    SEC                                                        ;809EC0|38      |      ;
    SBC.W #$0080                                               ;809EC1|E98000  |      ;
    CMP.B strcPlayer.offsetCamX                                ;809EC4|C5ED    |0000ED;
    BMI .label1                                                ;809EC6|3004    |809ECC;
    BEQ .label1                                                ;809EC8|F002    |809ECC;
    BCS .label2                                                ;809ECA|B01A    |809EE6;
 
.label1:
    REP #$20                                                   ;809ECC|C220    |      ;
    CLC                                                        ;809ECE|18      |      ;
    ADC.W #$0080                                               ;809ECF|698000  |      ;
    SEC                                                        ;809ED2|38      |      ;
    SBC.B strcPlayer.offsetCamX                                ;809ED3|E5ED    |0000ED;
    STA.W strcObjectData.camX                                  ;809ED5|8D0B09  |00090B;
    SEP #$20                                                   ;809ED8|E220    |      ;
    LDA.B #$00                                                 ;809EDA|A900    |      ;
    STA.B strcMap.unk20                                        ;809EDC|8520    |000020;
    REP #$20                                                   ;809EDE|C220    |      ;
    LDA.B strcPlayer.offsetCamX                                ;809EE0|A5ED    |0000ED;
    STA.B strcCamera.cameraX                                   ;809EE2|85F5    |0000F5;
    BRA .label4                                                ;809EE4|8028    |809F0E;
 
 
.label2:
    REP #$20                                                   ;809EE6|C220    |      ;
    CMP.B strcCamera.offsetCamX                                ;809EE8|C5F1    |0000F1;
    BCS .label3                                                ;809EEA|B00A    |809EF6;
    STA.B strcCamera.cameraX                                   ;809EEC|85F5    |0000F5;
    LDA.W #$0080                                               ;809EEE|A98000  |      ;
    STA.W strcObjectData.camX                                  ;809EF1|8D0B09  |00090B;
    BRA .label4                                                ;809EF4|8018    |809F0E;
 
 
.label3:
    REP #$20                                                   ;809EF6|C220    |      ;
    CLC                                                        ;809EF8|18      |      ;
    ADC.W #$0080                                               ;809EF9|698000  |      ;
    SEC                                                        ;809EFC|38      |      ;
    SBC.B strcCamera.offsetCamX                                ;809EFD|E5F1    |0000F1;
    STA.W strcObjectData.camX                                  ;809EFF|8D0B09  |00090B;
    SEP #$20                                                   ;809F02|E220    |      ;
    LDA.B #$08                                                 ;809F04|A908    |      ;
    STA.B strcMap.unk20                                        ;809F06|8520    |000020;
    REP #$20                                                   ;809F08|C220    |      ;
    LDA.B strcCamera.offsetCamX                                ;809F0A|A5F1    |0000F1;
    STA.B strcCamera.cameraX                                   ;809F0C|85F5    |0000F5;
 
.label4:
    REP #$20                                                   ;809F0E|C220    |      ;
    LDA.B strcPlayer.posY                                      ;809F10|A5D8    |0000D8;
    SEC                                                        ;809F12|38      |      ;
    SBC.W #$0080                                               ;809F13|E98000  |      ;
    CMP.B strcPlayer.offsetCamY                                ;809F16|C5EF    |0000EF;
    BMI .label5                                                ;809F18|3004    |809F1E;
    BEQ .label5                                                ;809F1A|F002    |809F1E;
    BCS .label6                                                ;809F1C|B01A    |809F38;
 
.label5:
    REP #$20                                                   ;809F1E|C220    |      ;
    CLC                                                        ;809F20|18      |      ;
    ADC.W #$0080                                               ;809F21|698000  |      ;
    SEC                                                        ;809F24|38      |      ;
    SBC.B strcPlayer.offsetCamY                                ;809F25|E5EF    |0000EF;
    STA.W strcObjectData.camY                                  ;809F27|8D0D09  |00090D;
    SEP #$20                                                   ;809F2A|E220    |      ;
    LDA.B #$00                                                 ;809F2C|A900    |      ;
    STA.B strcMap.unk21                                        ;809F2E|8521    |000021;
    REP #$20                                                   ;809F30|C220    |      ;
    LDA.B strcPlayer.offsetCamY                                ;809F32|A5EF    |0000EF;
    STA.B strcCamera.cameraY                                   ;809F34|85F7    |0000F7;
    BRA .return                                                ;809F36|8028    |809F60;
 
 
.label6:
    REP #$20                                                   ;809F38|C220    |      ;
    CMP.B strcCamera.offsetCamY                                ;809F3A|C5F3    |0000F3;
    BCS .label7                                                ;809F3C|B00A    |809F48;
    STA.B strcCamera.cameraY                                   ;809F3E|85F7    |0000F7;
    LDA.W #$0080                                               ;809F40|A98000  |      ;
    STA.W strcObjectData.camY                                  ;809F43|8D0D09  |00090D;
    BRA .return                                                ;809F46|8018    |809F60;
 
 
.label7:
    REP #$20                                                   ;809F48|C220    |      ;
    CLC                                                        ;809F4A|18      |      ;
    ADC.W #$0080                                               ;809F4B|698000  |      ;
    SEC                                                        ;809F4E|38      |      ;
    SBC.B strcCamera.offsetCamY                                ;809F4F|E5F3    |0000F3;
    STA.W strcObjectData.camY                                  ;809F51|8D0D09  |00090D;
    SEP #$20                                                   ;809F54|E220    |      ;
    LDA.B #$08                                                 ;809F56|A908    |      ;
    STA.B strcMap.unk21                                        ;809F58|8521    |000021;
    REP #$20                                                   ;809F5A|C220    |      ;
    LDA.B strcCamera.offsetCamY                                ;809F5C|A5F3    |0000F3;
    STA.B strcCamera.cameraY                                   ;809F5E|85F7    |0000F7;
 
.return:
    RTL                                                        ;809F60|6B      |      ;
 
 
fUnknown_809F61:
    SEP #$20                                                   ;809F61|E220    |      ;
    REP #$10                                                   ;809F63|C210    |      ;
    LDA.B strcMap.loadAreaId                                   ;809F65|A522    |000022;
    CMP.B #!AREA_SHED                                                 
    BNE .label1                                                ;809F69|D003    |809F6E;
    JMP.W .return                                              ;809F6B|4CAAA0  |80A0AA;
 
 
.label1:
    CMP.B #$31                                                 ;809F6E|C931    |      ;
    BCC .label6                                                ;809F70|9041    |809FB3;
    REP #$20                                                   ;809F72|C220    |      ;
    LDA.B strcCamera.cameraY                                   ;809F74|A5F7    |0000F7;
    CMP.B strcPlayer.offsetCamY                                ;809F76|C5EF    |0000EF;
    BNE .label2                                                ;809F78|D003    |809F7D;
    JMP.W .return                                              ;809F7A|4CAAA0  |80A0AA;
 
 
.label2:
    CMP.B strcCamera.offsetCamY                                ;809F7D|C5F3    |0000F3;
    BNE .label3                                                ;809F7F|D003    |809F84;
    JMP.W .return                                              ;809F81|4CAAA0  |80A0AA;
 
 
.label3:
    LDA.B strcCamera.cameraX                                   ;809F84|A5F5    |0000F5;
    STA.W strcBGScrool.BG2HorOffs                              ;809F86|8D4001  |000140;
    LDA.B strcMap.unk1E                                        ;809F89|A51E    |00001E;
    ASL A                                                      ;809F8B|0A      |      ;
    STA.B strcMap.unk1E                                        ;809F8C|851E    |00001E;
    REP #$30                                                   ;809F8E|C230    |      ;
    LDA.B strcPlayer.direction                                 ;809F90|A5DA    |0000DA;
    CMP.W #!PDIR_LEFT                                               
    BNE .label4                                                ;809F95|D003    |809F9A;
    JMP.W .return                                              ;809F97|4CAAA0  |80A0AA;
 
 
.label4:
    REP #$30                                                   ;809F9A|C230    |      ;
    LDA.B strcPlayer.direction                                 ;809F9C|A5DA    |0000DA;
    CMP.W #!PDIR_RIGHT                                               
    BNE .label5                                                ;809FA1|D003    |809FA6;
    JMP.W .return                                              ;809FA3|4CAAA0  |80A0AA;
 
 
.label5:
    LDA.B strcCamera.cameraY                                   ;809FA6|A5F7    |0000F7;
    LSR A                                                      ;809FA8|4A      |      ;
    CLC                                                        ;809FA9|18      |      ;
    ADC.W #$0080                                               ;809FAA|698000  |      ;
    STA.W strcBGScrool.BG2VerOffs                              ;809FAD|8D4201  |000142;
    JMP.W .return                                              ;809FB0|4CAAA0  |80A0AA;
 
 
.label6:
    REP #$30                                                   ;809FB3|C230    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;809FB5|AD9601  |000196;
    AND.W #$0002                                               ;809FB8|290200  |      ;
    BEQ .label7                                                ;809FBB|F00D    |809FCA;
    LDA.B strcCamera.cameraX                                   ;809FBD|A5F5    |0000F5;
    STA.W strcBGScrool.BG2HorOffs                              ;809FBF|8D4001  |000140;
    LDA.B strcCamera.cameraY                                   ;809FC2|A5F7    |0000F7;
    STA.W strcBGScrool.BG2VerOffs                              ;809FC4|8D4201  |000142;
    JMP.W .return                                              ;809FC7|4CAAA0  |80A0AA;
 
 
.label7:
    REP #$30                                                   ;809FCA|C230    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;809FCC|AD9601  |000196;
    AND.W #$0004                                               ;809FCF|290400  |      ;
    BNE .label8                                                ;809FD2|D003    |809FD7;
    JMP.W .label15                                             ;809FD4|4C96A0  |80A096;
 
 
.label8:
    REP #$30                                                   ;809FD7|C230    |      ;
    LDA.B strcPlayer.direction                                 ;809FD9|A5DA    |0000DA;
    CMP.W #!PDIR_DOWN                                               
    BNE .label9                                                ;809FDE|D003    |809FE3;
    JMP.W .and0000                                             ;809FE0|4C33A0  |80A033;
 
 
.label9:
    REP #$30                                                   ;809FE3|C230    |      ;
    LDA.B strcPlayer.direction                                 ;809FE5|A5DA    |0000DA;
    CMP.W #!PDIR_UP                                               
    BNE .label10                                               ;809FEA|D003    |809FEF;
    JMP.W .and0001                                             ;809FEC|4C4AA0  |80A04A;
 
 
.label10:
    REP #$30                                                   ;809FEF|C230    |      ;
    LDA.B strcPlayer.direction                                 ;809FF1|A5DA    |0000DA;
    CMP.W #!PDIR_LEFT                                               
    BNE .label11                                               ;809FF6|D003    |809FFB;
    JMP.W .and0002                                             ;809FF8|4C61A0  |80A061;
 
 
.label11:
    REP #$30                                                   ;809FFB|C230    |      ;
    LDA.B strcPlayer.direction                                 ;809FFD|A5DA    |0000DA;
    CMP.W #!PDIR_RIGHT                                               
    BNE .back                                                  ;80A002|D003    |80A007;
    JMP.W .and0003                                             ;80A004|4C78A0  |80A078;
 
 
.back:
    SEP #$20                                                   ;80A007|E220    |      ;
    LDA.W strcPlayerData.unkCounter91C                         ;80A009|AD1C09  |00091C;
    INC A                                                      ;80A00C|1A      |      ;
    STA.W strcPlayerData.unkCounter91C                         ;80A00D|8D1C09  |00091C;
    CMP.B #$0A                                                 ;80A010|C90A    |      ;
    BEQ .label12                                               ;80A012|F003    |80A017;
    JMP.W .return                                              ;80A014|4CAAA0  |80A0AA;
 
 
.label12:
    STZ.W strcPlayerData.unkCounter91C                         ;80A017|9C1C09  |00091C;
    REP #$20                                                   ;80A01A|C220    |      ;
    LDA.W strcBGScrool.BG2HorOffs                              ;80A01C|AD4001  |000140;
    CLC                                                        ;80A01F|18      |      ;
    ADC.W #$0001                                               ;80A020|690100  |      ;
    STA.W strcBGScrool.BG2HorOffs                              ;80A023|8D4001  |000140;
    LDA.W strcBGScrool.BG2VerOffs                              ;80A026|AD4201  |000142;
    SEC                                                        ;80A029|38      |      ;
    SBC.W #$0001                                               ;80A02A|E90100  |      ;
    STA.W strcBGScrool.BG2VerOffs                              ;80A02D|8D4201  |000142;
    JMP.W .return                                              ;80A030|4CAAA0  |80A0AA;
 
 
.and0000:
    REP #$30                                                   ;80A033|C230    |      ;
    LDA.B strcCamera.cameraY                                   ;80A035|A5F7    |0000F7;
    CMP.B strcPlayer.offsetCamY                                ;80A037|C5EF    |0000EF;
    BEQ .back                                                  ;80A039|F0CC    |80A007;
    CMP.B strcCamera.offsetCamY                                ;80A03B|C5F3    |0000F3;
    BEQ .back                                                  ;80A03D|F0C8    |80A007;
    LDA.W strcBGScrool.BG2VerOffs                              ;80A03F|AD4201  |000142;
    CLC                                                        ;80A042|18      |      ;
    ADC.B strcMap.unk1E                                        ;80A043|651E    |00001E;
    STA.W strcBGScrool.BG2VerOffs                              ;80A045|8D4201  |000142;
    BRA .back                                                  ;80A048|80BD    |80A007;
 
 
.and0001:
    REP #$30                                                   ;80A04A|C230    |      ;
    LDA.B strcCamera.cameraY                                   ;80A04C|A5F7    |0000F7;
    CMP.B strcPlayer.offsetCamY                                ;80A04E|C5EF    |0000EF;
    BEQ .back                                                  ;80A050|F0B5    |80A007;
    CMP.B strcCamera.offsetCamY                                ;80A052|C5F3    |0000F3;
    BEQ .back                                                  ;80A054|F0B1    |80A007;
    LDA.W strcBGScrool.BG2VerOffs                              ;80A056|AD4201  |000142;
    SEC                                                        ;80A059|38      |      ;
    SBC.B strcMap.unk1E                                        ;80A05A|E51E    |00001E;
    STA.W strcBGScrool.BG2VerOffs                              ;80A05C|8D4201  |000142;
    BRA .back                                                  ;80A05F|80A6    |80A007;
 
 
.and0002:
    REP #$30                                                   ;80A061|C230    |      ;
    LDA.B strcCamera.cameraX                                   ;80A063|A5F5    |0000F5;
    CMP.B strcPlayer.offsetCamX                                ;80A065|C5ED    |0000ED;
    BEQ .back                                                  ;80A067|F09E    |80A007;
    CMP.B strcCamera.offsetCamX                                ;80A069|C5F1    |0000F1;
    BEQ .back                                                  ;80A06B|F09A    |80A007;
    LDA.W strcBGScrool.BG2HorOffs                              ;80A06D|AD4001  |000140;
    CLC                                                        ;80A070|18      |      ;
    ADC.B strcMap.unk1E                                        ;80A071|651E    |00001E;
    STA.W strcBGScrool.BG2HorOffs                              ;80A073|8D4001  |000140;
    BRA .back                                                  ;80A076|808F    |80A007;
 
 
.and0003:
    REP #$30                                                   ;80A078|C230    |      ;
    LDA.B strcCamera.cameraX                                   ;80A07A|A5F5    |0000F5;
    CMP.B strcPlayer.offsetCamX                                ;80A07C|C5ED    |0000ED;
    BNE .label13                                               ;80A07E|D003    |80A083;
    JMP.W .back                                                ;80A080|4C07A0  |80A007;
 
 
.label13:
    CMP.B strcCamera.offsetCamX                                ;80A083|C5F1    |0000F1;
    BNE .label14                                               ;80A085|D003    |80A08A;
    JMP.W .back                                                ;80A087|4C07A0  |80A007;
 
 
.label14:
    LDA.W strcBGScrool.BG2HorOffs                              ;80A08A|AD4001  |000140;
    SEC                                                        ;80A08D|38      |      ;
    SBC.B strcMap.unk1E                                        ;80A08E|E51E    |00001E;
    STA.W strcBGScrool.BG2HorOffs                              ;80A090|8D4001  |000140;
    JMP.W .back                                                ;80A093|4C07A0  |80A007;
 
 
.label15:
    REP #$30                                                   ;80A096|C230    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;80A098|AD9601  |000196;
    AND.W #$0008                                               ;80A09B|290800  |      ;
    BEQ .return                                                ;80A09E|F00A    |80A0AA;
    LDA.B strcCamera.cameraX                                   ;80A0A0|A5F5    |0000F5;
    STA.W strcBGScrool.BG2HorOffs                              ;80A0A2|8D4001  |000140;
    LDA.B strcCamera.cameraY                                   ;80A0A5|A5F7    |0000F7;
    STA.W strcBGScrool.BG2VerOffs                              ;80A0A7|8D4201  |000142;
 
.return:
    RTL                                                        ;80A0AA|6B      |      ;
 
 
fUnknown_80A0AB:
    REP #$30                                                   ;80A0AB|C230    |      ;
    LDA.B strcCamera.cameraY                                   ;80A0AD|A5F7    |0000F7;
    STA.W strcBGScrool.BG1VerOffs                              ;80A0AF|8D3E01  |00013E;
    CMP.B strcPlayer.offsetCamY                                ;80A0B2|C5EF    |0000EF;
    BEQ .return                                                ;80A0B4|F02A    |80A0E0;
    CMP.B strcCamera.offsetCamY                                ;80A0B6|C5F3    |0000F3;
    BEQ .return                                                ;80A0B8|F026    |80A0E0;
    CMP.B strcMap.unk1E                                        ;80A0BA|C51E    |00001E;
    BCS .label1                                                ;80A0BC|B002    |80A0C0;
    STA.B strcMap.unk1E                                        ;80A0BE|851E    |00001E;
 
.label1:
    REP #$20                                                   ;80A0C0|C220    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;80A0C2|AD9601  |000196;
    AND.W #$0001                                               ;80A0C5|290100  |      ;
    BEQ .return                                                ;80A0C8|F016    |80A0E0;
    SEP #$20                                                   ;80A0CA|E220    |      ;
    LDA.B strcMap.unk21                                        ;80A0CC|A521    |000021;
    CLC                                                        ;80A0CE|18      |      ;
    ADC.B strcMap.unk1E                                        ;80A0CF|651E    |00001E;
    STA.B strcMap.unk21                                        ;80A0D1|8521    |000021;
    CMP.B #$08                                                 ;80A0D3|C908    |      ;
    BCC .return                                                ;80A0D5|9009    |80A0E0;
    SEC                                                        ;80A0D7|38      |      ;
    SBC.B #$08                                                 ;80A0D8|E908    |      ;
    STA.B strcMap.unk21                                        ;80A0DA|8521    |000021;
    JSL.L fUnknown_80A18D                                      ;80A0DC|228DA180|80A18D;
 
.return:
    RTL                                                        ;80A0E0|6B      |      ;
 
 
fUnknown_80A0E1:
    REP #$30                                                   ;80A0E1|C230    |      ;
    LDA.B strcCamera.cameraY                                   ;80A0E3|A5F7    |0000F7;
    STA.W strcBGScrool.BG1VerOffs                              ;80A0E5|8D3E01  |00013E;
    CMP.B strcPlayer.offsetCamY                                ;80A0E8|C5EF    |0000EF;
    BEQ .return                                                ;80A0EA|F02F    |80A11B;
    CMP.B strcCamera.offsetCamY                                ;80A0EC|C5F3    |0000F3;
    BEQ .return                                                ;80A0EE|F02B    |80A11B;
    LDA.B strcCamera.offsetCamY                                ;80A0F0|A5F3    |0000F3;
    SEC                                                        ;80A0F2|38      |      ;
    SBC.B strcCamera.cameraY                                   ;80A0F3|E5F7    |0000F7;
    CMP.B strcMap.unk1E                                        ;80A0F5|C51E    |00001E;
    BCS .label1                                                ;80A0F7|B002    |80A0FB;
    STA.B strcMap.unk1E                                        ;80A0F9|851E    |00001E;
 
.label1:
    REP #$20                                                   ;80A0FB|C220    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;80A0FD|AD9601  |000196;
    AND.W #$0001                                               ;80A100|290100  |      ;
    BEQ .return                                                ;80A103|F016    |80A11B;
    SEP #$20                                                   ;80A105|E220    |      ;
    LDA.B strcMap.unk21                                        ;80A107|A521    |000021;
    SEC                                                        ;80A109|38      |      ;
    SBC.B strcMap.unk1E                                        ;80A10A|E51E    |00001E;
    STA.B strcMap.unk21                                        ;80A10C|8521    |000021;
    BPL .return                                                ;80A10E|100B    |80A11B;
    LDA.B #$08                                                 ;80A110|A908    |      ;
    CLC                                                        ;80A112|18      |      ;
    ADC.B strcMap.unk21                                        ;80A113|6521    |000021;
    STA.B strcMap.unk21                                        ;80A115|8521    |000021;
    JSL.L fUnknown_80A308                                      ;80A117|2208A380|80A308;
 
.return:
    RTL                                                        ;80A11B|6B      |      ;
 
 
fUnknown_80A11C:
    REP #$30                                                   ;80A11C|C230    |      ;
    LDA.B strcCamera.cameraX                                   ;80A11E|A5F5    |0000F5;
    STA.W strcBGScrool.BG1HorOffs                              ;80A120|8D3C01  |00013C;
    CMP.B strcPlayer.offsetCamX                                ;80A123|C5ED    |0000ED;
    BEQ .return                                                ;80A125|F02A    |80A151;
    CMP.B strcCamera.offsetCamX                                ;80A127|C5F1    |0000F1;
    BEQ .return                                                ;80A129|F026    |80A151;
    CMP.B strcMap.unk1E                                        ;80A12B|C51E    |00001E;
    BCS .label1                                                ;80A12D|B002    |80A131;
    STA.B strcMap.unk1E                                        ;80A12F|851E    |00001E;
 
.label1:
    REP #$20                                                   ;80A131|C220    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;80A133|AD9601  |000196;
    AND.W #$0001                                               ;80A136|290100  |      ;
    BEQ .return                                                ;80A139|F016    |80A151;
    SEP #$20                                                   ;80A13B|E220    |      ;
    LDA.B strcMap.unk20                                        ;80A13D|A520    |000020;
    CLC                                                        ;80A13F|18      |      ;
    ADC.B strcMap.unk1E                                        ;80A140|651E    |00001E;
    STA.B strcMap.unk20                                        ;80A142|8520    |000020;
    CMP.B #$08                                                 ;80A144|C908    |      ;
    BCC .return                                                ;80A146|9009    |80A151;
    SEC                                                        ;80A148|38      |      ;
    SBC.B #$08                                                 ;80A149|E908    |      ;
    STA.B strcMap.unk20                                        ;80A14B|8520    |000020;
    JSL.L fUnknown_80A481                                      ;80A14D|2281A480|80A481;
 
.return:
    RTL                                                        ;80A151|6B      |      ;
 
 
fUnknown_80A152:
    REP #$30                                                   ;80A152|C230    |      ;
    LDA.B strcCamera.cameraX                                   ;80A154|A5F5    |0000F5;
    STA.W strcBGScrool.BG1HorOffs                              ;80A156|8D3C01  |00013C;
    CMP.B strcPlayer.offsetCamX                                ;80A159|C5ED    |0000ED;
    BEQ .return                                                ;80A15B|F02F    |80A18C;
    CMP.B strcCamera.offsetCamX                                ;80A15D|C5F1    |0000F1;
    BEQ .return                                                ;80A15F|F02B    |80A18C;
    LDA.B strcCamera.offsetCamX                                ;80A161|A5F1    |0000F1;
    SEC                                                        ;80A163|38      |      ;
    SBC.B strcCamera.cameraX                                   ;80A164|E5F5    |0000F5;
    CMP.B strcMap.unk1E                                        ;80A166|C51E    |00001E;
    BCS .label1                                                ;80A168|B002    |80A16C;
    STA.B strcMap.unk1E                                        ;80A16A|851E    |00001E;
 
.label1:
    REP #$20                                                   ;80A16C|C220    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;80A16E|AD9601  |000196;
    AND.W #$0001                                               ;80A171|290100  |      ;
    BEQ .return                                                ;80A174|F016    |80A18C;
    SEP #$20                                                   ;80A176|E220    |      ;
    LDA.B strcMap.unk20                                        ;80A178|A520    |000020;
    SEC                                                        ;80A17A|38      |      ;
    SBC.B strcMap.unk1E                                        ;80A17B|E51E    |00001E;
    STA.B strcMap.unk20                                        ;80A17D|8520    |000020;
    BPL .return                                                ;80A17F|100B    |80A18C;
    LDA.B #$08                                                 ;80A181|A908    |      ;
    CLC                                                        ;80A183|18      |      ;
    ADC.B strcMap.unk20                                        ;80A184|6520    |000020;
    STA.B strcMap.unk20                                        ;80A186|8520    |000020;
    JSL.L fUnknown_80A617                                      ;80A188|2217A680|80A617;
 
.return:
    RTL                                                        ;80A18C|6B      |      ;
 
 
fUnknown_80A18D:
    REP #$30                                                   ;80A18D|C230    |      ;
    LDA.B strcMap.unk12                                        ;80A18F|A512    |000012;
    CMP.W #$0020                                               ;80A191|C92000  |      ;
    BCC .cmp0020                                               ;80A194|901B    |80A1B1;
    CMP.W #$0040                                               ;80A196|C94000  |      ;
    BCC .cmp0040                                               ;80A199|9020    |80A1BB;
    CMP.W #$0060                                               ;80A19B|C96000  |      ;
    BCC .cmp0060                                               ;80A19E|902B    |80A1CB;
    CMP.W #$0080                                               ;80A1A0|C98000  |      ;
    BCC .cmp0080                                               ;80A1A3|9036    |80A1DB;
    CMP.W #$00A0                                               ;80A1A5|C9A000  |      ;
    BCC .cmp00A0                                               ;80A1A8|9044    |80A1EE;
    CMP.W #$00C0                                               ;80A1AA|C9C000  |      ;
    BCC .cmp00C0                                               ;80A1AD|9052    |80A201;
    BRA .continue                                              ;80A1AF|8069    |80A21A;
 
 
.cmp0020:
    STZ.B strcVariables.n16Temp1                               ;80A1B1|647E    |00007E;
    STZ.B strcVariables.n16Temp2                               ;80A1B3|6480    |000080;
    STZ.B strcVariables.n16Temp3                               ;80A1B5|6482    |000082;
    STZ.B strcVariables.n16Temp4                               ;80A1B7|6484    |000084;
    BRA .continue                                              ;80A1B9|805F    |80A21A;
 
 
.cmp0040:
    LDA.B strcMap.unk12                                        ;80A1BB|A512    |000012;
    SEC                                                        ;80A1BD|38      |      ;
    SBC.W #$0020                                               ;80A1BE|E92000  |      ;
    STA.B strcVariables.n16Temp1                               ;80A1C1|857E    |00007E;
    STA.B strcVariables.n16Temp2                               ;80A1C3|8580    |000080;
    STZ.B strcVariables.n16Temp3                               ;80A1C5|6482    |000082;
    STZ.B strcVariables.n16Temp4                               ;80A1C7|6484    |000084;
    BRA .continue                                              ;80A1C9|804F    |80A21A;
 
 
.cmp0060:
    LDA.B strcMap.unk12                                        ;80A1CB|A512    |000012;
    SEC                                                        ;80A1CD|38      |      ;
    SBC.W #$0020                                               ;80A1CE|E92000  |      ;
    STA.B strcVariables.n16Temp1                               ;80A1D1|857E    |00007E;
    STA.B strcVariables.n16Temp2                               ;80A1D3|8580    |000080;
    STZ.B strcVariables.n16Temp3                               ;80A1D5|6482    |000082;
    STZ.B strcVariables.n16Temp4                               ;80A1D7|6484    |000084;
    BRA .continue                                              ;80A1D9|803F    |80A21A;
 
 
.cmp0080:
    LDA.W #$0080                                               ;80A1DB|A98000  |      ;
    STA.B strcVariables.n16Temp1                               ;80A1DE|857E    |00007E;
    STZ.B strcVariables.n16Temp2                               ;80A1E0|6480    |000080;
    LDA.B strcMap.unk12                                        ;80A1E2|A512    |000012;
    SEC                                                        ;80A1E4|38      |      ;
    SBC.W #$0060                                               ;80A1E5|E96000  |      ;
    STA.B strcVariables.n16Temp3                               ;80A1E8|8582    |000082;
    STA.B strcVariables.n16Temp4                               ;80A1EA|8584    |000084;
    BRA .continue                                              ;80A1EC|802C    |80A21A;
 
 
.cmp00A0:
    LDA.W #$0080                                               ;80A1EE|A98000  |      ;
    STA.B strcVariables.n16Temp1                               ;80A1F1|857E    |00007E;
    STZ.B strcVariables.n16Temp2                               ;80A1F3|6480    |000080;
    LDA.B strcMap.unk12                                        ;80A1F5|A512    |000012;
    SEC                                                        ;80A1F7|38      |      ;
    SBC.W #$0060                                               ;80A1F8|E96000  |      ;
    STA.B strcVariables.n16Temp3                               ;80A1FB|8582    |000082;
    STA.B strcVariables.n16Temp4                               ;80A1FD|8584    |000084;
    BRA .continue                                              ;80A1FF|8019    |80A21A;
 
 
.cmp00C0:
    LDA.B strcMap.unk12                                        ;80A201|A512    |000012;
    SEC                                                        ;80A203|38      |      ;
    SBC.W #$0020                                               ;80A204|E92000  |      ;
    STA.B strcVariables.n16Temp1                               ;80A207|857E    |00007E;
    LDA.B strcMap.unk12                                        ;80A209|A512    |000012;
    SEC                                                        ;80A20B|38      |      ;
    SBC.W #$00A0                                               ;80A20C|E9A000  |      ;
    STA.B strcVariables.n16Temp2                               ;80A20F|8580    |000080;
    LDA.W #$0080                                               ;80A211|A98000  |      ;
    STA.B strcVariables.n16Temp3                               ;80A214|8582    |000082;
    STZ.B strcVariables.n16Temp4                               ;80A216|6484    |000084;
    BRA .continue                                              ;80A218|8000    |80A21A;
 
 
.continue:
    LDA.B strcMap.unk1C                                        ;80A21A|A51C    |00001C;
    LSR A                                                      ;80A21C|4A      |      ;
    LSR A                                                      ;80A21D|4A      |      ;
    STA.B strcVariables.n16Unk86                               ;80A21E|8586    |000086;
    LDA.W #$2000                                               ;80A220|A90020  |      ;
    CLC                                                        ;80A223|18      |      ;
    ADC.B strcMap.unk16                                        ;80A224|6516    |000016;
    ADC.B strcMap.unk1C                                        ;80A226|651C    |00001C;
    SEC                                                        ;80A228|38      |      ;
    SBC.B strcVariables.n16Unk86                               ;80A229|E586    |000086;
    STA.B ptrTemp0x72                                          ;80A22B|8572    |000072;
    CLC                                                        ;80A22D|18      |      ;
    ADC.W #$0040                                               ;80A22E|694000  |      ;
    STA.B ptrUnknown0x75                                       ;80A231|8575    |000075;
    SEP #$20                                                   ;80A233|E220    |      ;
    LDA.B #$7E                                                 ;80A235|A97E    |      ;
    STA.B ptrTemp0x72+2                                        ;80A237|8574    |000074;
    STA.B ptrUnknown0x75+2                                     ;80A239|8577    |000077;
    REP #$20                                                   ;80A23B|C220    |      ;
    LDX.W #$0000                                               ;80A23D|A20000  |      ;
 
.label1:
    PHX                                                        ;80A240|DA      |      ;
    LDA.B strcVariables.n16Temp2                               ;80A241|A580    |000080;
    CMP.W #$0040                                               ;80A243|C94000  |      ;
    BNE .label2                                                ;80A246|D00A    |80A252;
    STZ.B strcVariables.n16Temp2                               ;80A248|6480    |000080;
    LDA.B strcVariables.n16Temp1                               ;80A24A|A57E    |00007E;
    CLC                                                        ;80A24C|18      |      ;
    ADC.W #$0040                                               ;80A24D|694000  |      ;
    STA.B strcVariables.n16Temp1                               ;80A250|857E    |00007E;
 
.label2:
    LDA.B strcVariables.n16Temp4                               ;80A252|A584    |000084;
    CMP.W #$0040                                               ;80A254|C94000  |      ;
    BNE .label3                                                ;80A257|D00A    |80A263;
    STZ.B strcVariables.n16Temp4                               ;80A259|6484    |000084;
    LDA.B strcVariables.n16Temp3                               ;80A25B|A582    |000082;
    CLC                                                        ;80A25D|18      |      ;
    ADC.W #$0040                                               ;80A25E|694000  |      ;
    STA.B strcVariables.n16Temp3                               ;80A261|8582    |000082;
 
.label3:
    LDY.B strcVariables.n16Temp1                               ;80A263|A47E    |00007E;
    LDX.B strcVariables.n16Temp2                               ;80A265|A680    |000080;
    LDA.B [ptrTemp0x72],Y                                      ;80A267|B772    |000072;
    STA.W $0746,X                                              ;80A269|9D4607  |000746;
    LDY.B strcVariables.n16Temp3                               ;80A26C|A482    |000082;
    LDX.B strcVariables.n16Temp4                               ;80A26E|A684    |000084;
    LDA.B [ptrUnknown0x75],Y                                   ;80A270|B775    |000075;
    STA.W $07C6,X                                              ;80A272|9DC607  |0007C6;
    INC.B strcVariables.n16Temp1                               ;80A275|E67E    |00007E;
    INC.B strcVariables.n16Temp1                               ;80A277|E67E    |00007E;
    INC.B strcVariables.n16Temp2                               ;80A279|E680    |000080;
    INC.B strcVariables.n16Temp2                               ;80A27B|E680    |000080;
    INC.B strcVariables.n16Temp3                               ;80A27D|E682    |000082;
    INC.B strcVariables.n16Temp3                               ;80A27F|E682    |000082;
    INC.B strcVariables.n16Temp4                               ;80A281|E684    |000084;
    INC.B strcVariables.n16Temp4                               ;80A283|E684    |000084;
    PLX                                                        ;80A285|FA      |      ;
    INX                                                        ;80A286|E8      |      ;
    INX                                                        ;80A287|E8      |      ;
    CPX.W #$0040                                               ;80A288|E04000  |      ;
    BNE .label1                                                ;80A28B|D0B3    |80A240;
    SEP #$20                                                   ;80A28D|E220    |      ;
    LDA.B #$00                                                 ;80A28F|A900    |      ;
    STA.B strcSystem.arrayIndex                                ;80A291|8527    |000027;
    LDA.B #$18                                                 ;80A293|A918    |      ;
    STA.B strcSystem.destinationRegister                       ;80A295|8529    |000029;
    REP #$20                                                   ;80A297|C220    |      ;
    LDY.W #$0040                                               ;80A299|A04000  |      ;
    LDA.B strcMap.unk14                                        ;80A29C|A514    |000014;
    CLC                                                        ;80A29E|18      |      ;
    ADC.W #$6000                                               ;80A29F|690060  |      ;
    TAX                                                        ;80A2A2|AA      |      ;
    LDA.W #$0746                                               ;80A2A3|A94607  |      ;
    STA.B ptrTemp0x72                                          ;80A2A6|8572    |000072;
    SEP #$20                                                   ;80A2A8|E220    |      ;
    LDA.B #$80                                                 ;80A2AA|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80A2AC|8574    |000074;
    REP #$20                                                   ;80A2AE|C220    |      ;
    LDA.W #$0080                                               ;80A2B0|A98000  |      ;
    JSL.L fCore_PrepareTransfer                                ;80A2B3|22338A80|808A33;
    SEP #$20                                                   ;80A2B7|E220    |      ;
    LDA.B #$01                                                 ;80A2B9|A901    |      ;
    STA.B strcSystem.arrayIndex                                ;80A2BB|8527    |000027;
    LDA.B #$18                                                 ;80A2BD|A918    |      ;
    STA.B strcSystem.destinationRegister                       ;80A2BF|8529    |000029;
    REP #$20                                                   ;80A2C1|C220    |      ;
    LDY.W #$0040                                               ;80A2C3|A04000  |      ;
    LDA.B strcMap.unk14                                        ;80A2C6|A514    |000014;
    CLC                                                        ;80A2C8|18      |      ;
    ADC.W #$6000                                               ;80A2C9|690060  |      ;
    ADC.W #$0400                                               ;80A2CC|690004  |      ;
    TAX                                                        ;80A2CF|AA      |      ;
    LDA.W #$07C6                                               ;80A2D0|A9C607  |      ;
    STA.B ptrTemp0x72                                          ;80A2D3|8572    |000072;
    SEP #$20                                                   ;80A2D5|E220    |      ;
    LDA.B #$80                                                 ;80A2D7|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80A2D9|8574    |000074;
    REP #$20                                                   ;80A2DB|C220    |      ;
    LDA.W #$0080                                               ;80A2DD|A98000  |      ;
    JSL.L fCore_PrepareTransfer                                ;80A2E0|22338A80|808A33;
    REP #$30                                                   ;80A2E4|C230    |      ;
    LDA.B strcMap.unk16                                        ;80A2E6|A516    |000016;
    CLC                                                        ;80A2E8|18      |      ;
    ADC.B strcMap.pCurrent+2                                   ;80A2E9|651A    |00001A;
    STA.B strcMap.unk16                                        ;80A2EB|8516    |000016;
    LDA.B strcMap.unk14                                        ;80A2ED|A514    |000014;
    CLC                                                        ;80A2EF|18      |      ;
    ADC.W #$0020                                               ;80A2F0|692000  |      ;
    CMP.W #$0400                                               ;80A2F3|C90004  |      ;
    BNE .label4                                                ;80A2F6|D005    |80A2FD;
    LDA.W #$0800                                               ;80A2F8|A90008  |      ;
    BRA .return                                                ;80A2FB|8008    |80A305;
 
 
.label4:
    CMP.W #$0C00                                               ;80A2FD|C9000C  |      ;
    BNE .return                                                ;80A300|D003    |80A305;
    LDA.W #$0000                                               ;80A302|A90000  |      ;
 
.return:
    STA.B strcMap.unk14                                        ;80A305|8514    |000014;
    RTL                                                        ;80A307|6B      |      ;
 
 
fUnknown_80A308:
    REP #$30                                                   ;80A308|C230    |      ;
    LDA.B strcMap.unk12                                        ;80A30A|A512    |000012;
    CMP.W #$0020                                               ;80A30C|C92000  |      ;
    BCC .case0020                                              ;80A30F|901B    |80A32C;
    CMP.W #$0040                                               ;80A311|C94000  |      ;
    BCC .case0040                                              ;80A314|9020    |80A336;
    CMP.W #$0060                                               ;80A316|C96000  |      ;
    BCC .case0060                                              ;80A319|902B    |80A346;
    CMP.W #$0080                                               ;80A31B|C98000  |      ;
    BCC .case0080                                              ;80A31E|9036    |80A356;
    CMP.W #$00A0                                               ;80A320|C9A000  |      ;
    BCC .case00A0                                              ;80A323|9044    |80A369;
    CMP.W #$00C0                                               ;80A325|C9C000  |      ;
    BCC .case00C0                                              ;80A328|9052    |80A37C;
    BRA .continue                                              ;80A32A|8069    |80A395;
 
 
.case0020:
    STZ.B strcVariables.n16Temp1                               ;80A32C|647E    |00007E;
    STZ.B strcVariables.n16Temp2                               ;80A32E|6480    |000080;
    STZ.B strcVariables.n16Temp3                               ;80A330|6482    |000082;
    STZ.B strcVariables.n16Temp4                               ;80A332|6484    |000084;
    BRA .continue                                              ;80A334|805F    |80A395;
 
 
.case0040:
    LDA.B strcMap.unk12                                        ;80A336|A512    |000012;
    SEC                                                        ;80A338|38      |      ;
    SBC.W #$0020                                               ;80A339|E92000  |      ;
    STA.B strcVariables.n16Temp1                               ;80A33C|857E    |00007E;
    STA.B strcVariables.n16Temp2                               ;80A33E|8580    |000080;
    STZ.B strcVariables.n16Temp3                               ;80A340|6482    |000082;
    STZ.B strcVariables.n16Temp4                               ;80A342|6484    |000084;
    BRA .continue                                              ;80A344|804F    |80A395;
 
 
.case0060:
    LDA.B strcMap.unk12                                        ;80A346|A512    |000012;
    SEC                                                        ;80A348|38      |      ;
    SBC.W #$0020                                               ;80A349|E92000  |      ;
    STA.B strcVariables.n16Temp1                               ;80A34C|857E    |00007E;
    STA.B strcVariables.n16Temp2                               ;80A34E|8580    |000080;
    STZ.B strcVariables.n16Temp3                               ;80A350|6482    |000082;
    STZ.B strcVariables.n16Temp4                               ;80A352|6484    |000084;
    BRA .continue                                              ;80A354|803F    |80A395;
 
 
.case0080:
    LDA.W #$0080                                               ;80A356|A98000  |      ;
    STA.B strcVariables.n16Temp1                               ;80A359|857E    |00007E;
    STZ.B strcVariables.n16Temp2                               ;80A35B|6480    |000080;
    LDA.B strcMap.unk12                                        ;80A35D|A512    |000012;
    SEC                                                        ;80A35F|38      |      ;
    SBC.W #$0060                                               ;80A360|E96000  |      ;
    STA.B strcVariables.n16Temp3                               ;80A363|8582    |000082;
    STA.B strcVariables.n16Temp4                               ;80A365|8584    |000084;
    BRA .continue                                              ;80A367|802C    |80A395;
 
 
.case00A0:
    LDA.W #$0080                                               ;80A369|A98000  |      ;
    STA.B strcVariables.n16Temp1                               ;80A36C|857E    |00007E;
    STZ.B strcVariables.n16Temp2                               ;80A36E|6480    |000080;
    LDA.B strcMap.unk12                                        ;80A370|A512    |000012;
    SEC                                                        ;80A372|38      |      ;
    SBC.W #$0060                                               ;80A373|E96000  |      ;
    STA.B strcVariables.n16Temp3                               ;80A376|8582    |000082;
    STA.B strcVariables.n16Temp4                               ;80A378|8584    |000084;
    BRA .continue                                              ;80A37A|8019    |80A395;
 
 
.case00C0:
    LDA.B strcMap.unk12                                        ;80A37C|A512    |000012;
    SEC                                                        ;80A37E|38      |      ;
    SBC.W #$0020                                               ;80A37F|E92000  |      ;
    STA.B strcVariables.n16Temp1                               ;80A382|857E    |00007E;
    LDA.B strcMap.unk12                                        ;80A384|A512    |000012;
    SEC                                                        ;80A386|38      |      ;
    SBC.W #$00A0                                               ;80A387|E9A000  |      ;
    STA.B strcVariables.n16Temp2                               ;80A38A|8580    |000080;
    LDA.W #$0080                                               ;80A38C|A98000  |      ;
    STA.B strcVariables.n16Temp3                               ;80A38F|8582    |000082;
    STZ.B strcVariables.n16Temp4                               ;80A391|6484    |000084;
    BRA .continue                                              ;80A393|8000    |80A395;
 
 
.continue:
    LDA.B strcMap.unk1C                                        ;80A395|A51C    |00001C;
    LSR A                                                      ;80A397|4A      |      ;
    LSR A                                                      ;80A398|4A      |      ;
    STA.B strcVariables.n16Unk86                               ;80A399|8586    |000086;
    LDA.W #$2000                                               ;80A39B|A90020  |      ;
    CLC                                                        ;80A39E|18      |      ;
    ADC.B strcMap.unk16                                        ;80A39F|6516    |000016;
    SEC                                                        ;80A3A1|38      |      ;
    SBC.B strcVariables.n16Unk86                               ;80A3A2|E586    |000086;
    STA.B ptrTemp0x72                                          ;80A3A4|8572    |000072;
    CLC                                                        ;80A3A6|18      |      ;
    ADC.W #$0040                                               ;80A3A7|694000  |      ;
    STA.B ptrUnknown0x75                                       ;80A3AA|8575    |000075;
    SEP #$20                                                   ;80A3AC|E220    |      ;
    LDA.B #$7E                                                 ;80A3AE|A97E    |      ;
    STA.B ptrTemp0x72+2                                        ;80A3B0|8574    |000074;
    STA.B ptrUnknown0x75+2                                     ;80A3B2|8577    |000077;
    REP #$20                                                   ;80A3B4|C220    |      ;
    LDX.W #$0000                                               ;80A3B6|A20000  |      ;
 
.label1:
    PHX                                                        ;80A3B9|DA      |      ;
    LDA.B strcVariables.n16Temp2                               ;80A3BA|A580    |000080;
    CMP.W #$0040                                               ;80A3BC|C94000  |      ;
    BNE .label2                                                ;80A3BF|D00A    |80A3CB;
    STZ.B strcVariables.n16Temp2                               ;80A3C1|6480    |000080;
    LDA.B strcVariables.n16Temp1                               ;80A3C3|A57E    |00007E;
    CLC                                                        ;80A3C5|18      |      ;
    ADC.W #$0040                                               ;80A3C6|694000  |      ;
    STA.B strcVariables.n16Temp1                               ;80A3C9|857E    |00007E;
 
.label2:
    LDA.B strcVariables.n16Temp4                               ;80A3CB|A584    |000084;
    CMP.W #$0040                                               ;80A3CD|C94000  |      ;
    BNE .label3                                                ;80A3D0|D00A    |80A3DC;
    STZ.B strcVariables.n16Temp4                               ;80A3D2|6484    |000084;
    LDA.B strcVariables.n16Temp3                               ;80A3D4|A582    |000082;
    CLC                                                        ;80A3D6|18      |      ;
    ADC.W #$0040                                               ;80A3D7|694000  |      ;
    STA.B strcVariables.n16Temp3                               ;80A3DA|8582    |000082;
 
.label3:
    LDY.B strcVariables.n16Temp1                               ;80A3DC|A47E    |00007E;
    LDX.B strcVariables.n16Temp2                               ;80A3DE|A680    |000080;
    LDA.B [ptrTemp0x72],Y                                      ;80A3E0|B772    |000072;
    STA.W $0746,X                                              ;80A3E2|9D4607  |000746;
    LDY.B strcVariables.n16Temp3                               ;80A3E5|A482    |000082;
    LDX.B strcVariables.n16Temp4                               ;80A3E7|A684    |000084;
    LDA.B [ptrUnknown0x75],Y                                   ;80A3E9|B775    |000075;
    STA.W $07C6,X                                              ;80A3EB|9DC607  |0007C6;
    INC.B strcVariables.n16Temp1                               ;80A3EE|E67E    |00007E;
    INC.B strcVariables.n16Temp1                               ;80A3F0|E67E    |00007E;
    INC.B strcVariables.n16Temp2                               ;80A3F2|E680    |000080;
    INC.B strcVariables.n16Temp2                               ;80A3F4|E680    |000080;
    INC.B strcVariables.n16Temp3                               ;80A3F6|E682    |000082;
    INC.B strcVariables.n16Temp3                               ;80A3F8|E682    |000082;
    INC.B strcVariables.n16Temp4                               ;80A3FA|E684    |000084;
    INC.B strcVariables.n16Temp4                               ;80A3FC|E684    |000084;
    PLX                                                        ;80A3FE|FA      |      ;
    INX                                                        ;80A3FF|E8      |      ;
    INX                                                        ;80A400|E8      |      ;
    CPX.W #$0040                                               ;80A401|E04000  |      ;
    BNE .label1                                                ;80A404|D0B3    |80A3B9;
    SEP #$20                                                   ;80A406|E220    |      ;
    LDA.B #$00                                                 ;80A408|A900    |      ;
    STA.B strcSystem.arrayIndex                                ;80A40A|8527    |000027;
    LDA.B #$18                                                 ;80A40C|A918    |      ;
    STA.B strcSystem.destinationRegister                       ;80A40E|8529    |000029;
    REP #$20                                                   ;80A410|C220    |      ;
    LDY.W #$0040                                               ;80A412|A04000  |      ;
    LDA.B strcMap.unk14                                        ;80A415|A514    |000014;
    CLC                                                        ;80A417|18      |      ;
    ADC.W #$6000                                               ;80A418|690060  |      ;
    TAX                                                        ;80A41B|AA      |      ;
    LDA.W #$0746                                               ;80A41C|A94607  |      ;
    STA.B ptrTemp0x72                                          ;80A41F|8572    |000072;
    SEP #$20                                                   ;80A421|E220    |      ;
    LDA.B #$80                                                 ;80A423|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80A425|8574    |000074;
    REP #$20                                                   ;80A427|C220    |      ;
    LDA.W #$0080                                               ;80A429|A98000  |      ;
    JSL.L fCore_PrepareTransfer                                ;80A42C|22338A80|808A33;
    SEP #$20                                                   ;80A430|E220    |      ;
    LDA.B #$01                                                 ;80A432|A901    |      ;
    STA.B strcSystem.arrayIndex                                ;80A434|8527    |000027;
    LDA.B #$18                                                 ;80A436|A918    |      ;
    STA.B strcSystem.destinationRegister                       ;80A438|8529    |000029;
    REP #$20                                                   ;80A43A|C220    |      ;
    LDY.W #$0040                                               ;80A43C|A04000  |      ;
    LDA.B strcMap.unk14                                        ;80A43F|A514    |000014;
    CLC                                                        ;80A441|18      |      ;
    ADC.W #$6000                                               ;80A442|690060  |      ;
    ADC.W #$0400                                               ;80A445|690004  |      ;
    TAX                                                        ;80A448|AA      |      ;
    LDA.W #$07C6                                               ;80A449|A9C607  |      ;
    STA.B ptrTemp0x72                                          ;80A44C|8572    |000072;
    SEP #$20                                                   ;80A44E|E220    |      ;
    LDA.B #$80                                                 ;80A450|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80A452|8574    |000074;
    REP #$20                                                   ;80A454|C220    |      ;
    LDA.W #$0080                                               ;80A456|A98000  |      ;
    JSL.L fCore_PrepareTransfer                                ;80A459|22338A80|808A33;
    REP #$30                                                   ;80A45D|C230    |      ;
    LDA.B strcMap.unk16                                        ;80A45F|A516    |000016;
    SEC                                                        ;80A461|38      |      ;
    SBC.B strcMap.pCurrent+2                                   ;80A462|E51A    |00001A;
    STA.B strcMap.unk16                                        ;80A464|8516    |000016;
    LDA.B strcMap.unk14                                        ;80A466|A514    |000014;
    SEC                                                        ;80A468|38      |      ;
    SBC.W #$0020                                               ;80A469|E92000  |      ;
    CMP.W #$FFE0                                               ;80A46C|C9E0FF  |      ;
    BNE .label4                                                ;80A46F|D005    |80A476;
    LDA.W #$0BE0                                               ;80A471|A9E00B  |      ;
    BRA .return                                                ;80A474|8008    |80A47E;
 
 
.label4:
    CMP.W #$07E0                                               ;80A476|C9E007  |      ;
    BNE .return                                                ;80A479|D003    |80A47E;
    LDA.W #$03E0                                               ;80A47B|A9E003  |      ;
 
.return:
    STA.B strcMap.unk14                                        ;80A47E|8514    |000014;
    RTL                                                        ;80A480|6B      |      ;
 
 
fUnknown_80A481:
    REP #$30                                                   ;80A481|C230    |      ;
    LDA.B strcMap.unk16                                        ;80A483|A516    |000016;
    CMP.W #$1000                                               ;80A485|C90010  |      ;
    BCC .case0100                                              ;80A488|901C    |80A4A6;
    CMP.W #$2000                                               ;80A48A|C90020  |      ;
    BCC .case0200                                              ;80A48D|9022    |80A4B1;
    CMP.W #$3000                                               ;80A48F|C90030  |      ;
    BCC .case0300                                              ;80A492|9032    |80A4C6;
    CMP.W #$4000                                               ;80A494|C90040  |      ;
    BCC .case0400                                              ;80A497|9042    |80A4DB;
    CMP.W #$5000                                               ;80A499|C90050  |      ;
    BCC .case0500                                              ;80A49C|9055    |80A4F3;
    CMP.W #$6000                                               ;80A49E|C90060  |      ;
    BCC .case0600                                              ;80A4A1|9068    |80A50B;
    JMP.W .continue                                            ;80A4A3|4C29A5  |80A529;
 
 
.case0100:
    STZ.B strcVariables.n16Temp1                               ;80A4A6|647E    |00007E;
    STZ.B strcVariables.n16Temp2                               ;80A4A8|6480    |000080;
    STZ.B strcVariables.n16Temp3                               ;80A4AA|6482    |000082;
    STZ.B strcVariables.n16Temp4                               ;80A4AC|6484    |000084;
    JMP.W .continue                                            ;80A4AE|4C29A5  |80A529;
 
 
.case0200:
    LDA.B strcMap.unk16                                        ;80A4B1|A516    |000016;
    SEC                                                        ;80A4B3|38      |      ;
    SBC.W #$1000                                               ;80A4B4|E90010  |      ;
    STA.B strcVariables.n16Temp1                               ;80A4B7|857E    |00007E;
    XBA                                                        ;80A4B9|EB      |      ;
    AND.W #$001F                                               ;80A4BA|291F00  |      ;
    ASL A                                                      ;80A4BD|0A      |      ;
    STA.B strcVariables.n16Temp2                               ;80A4BE|8580    |000080;
    STZ.B strcVariables.n16Temp3                               ;80A4C0|6482    |000082;
    STZ.B strcVariables.n16Temp4                               ;80A4C2|6484    |000084;
    BRA .continue                                              ;80A4C4|8063    |80A529;
 
 
.case0300:
    LDA.B strcMap.unk16                                        ;80A4C6|A516    |000016;
    SEC                                                        ;80A4C8|38      |      ;
    SBC.W #$1000                                               ;80A4C9|E90010  |      ;
    STA.B strcVariables.n16Temp1                               ;80A4CC|857E    |00007E;
    XBA                                                        ;80A4CE|EB      |      ;
    AND.W #$001F                                               ;80A4CF|291F00  |      ;
    ASL A                                                      ;80A4D2|0A      |      ;
    STA.B strcVariables.n16Temp2                               ;80A4D3|8580    |000080;
    STZ.B strcVariables.n16Temp3                               ;80A4D5|6482    |000082;
    STZ.B strcVariables.n16Temp4                               ;80A4D7|6484    |000084;
    BRA .continue                                              ;80A4D9|804E    |80A529;
 
 
.case0400:
    LDA.W #$4000                                               ;80A4DB|A90040  |      ;
    STA.B strcVariables.n16Temp1                               ;80A4DE|857E    |00007E;
    STZ.B strcVariables.n16Temp2                               ;80A4E0|6480    |000080;
    LDA.B strcMap.unk16                                        ;80A4E2|A516    |000016;
    SEC                                                        ;80A4E4|38      |      ;
    SBC.W #$3000                                               ;80A4E5|E90030  |      ;
    STA.B strcVariables.n16Temp3                               ;80A4E8|8582    |000082;
    XBA                                                        ;80A4EA|EB      |      ;
    AND.W #$001F                                               ;80A4EB|291F00  |      ;
    ASL A                                                      ;80A4EE|0A      |      ;
    STA.B strcVariables.n16Temp4                               ;80A4EF|8584    |000084;
    BRA .continue                                              ;80A4F1|8036    |80A529;
 
 
.case0500:
    LDA.W #$4000                                               ;80A4F3|A90040  |      ;
    STA.B strcVariables.n16Temp1                               ;80A4F6|857E    |00007E;
    STZ.B strcVariables.n16Temp2                               ;80A4F8|6480    |000080;
    LDA.B strcMap.unk16                                        ;80A4FA|A516    |000016;
    SEC                                                        ;80A4FC|38      |      ;
    SBC.W #$3000                                               ;80A4FD|E90030  |      ;
    STA.B strcVariables.n16Temp3                               ;80A500|8582    |000082;
    XBA                                                        ;80A502|EB      |      ;
    AND.W #$001F                                               ;80A503|291F00  |      ;
    ASL A                                                      ;80A506|0A      |      ;
    STA.B strcVariables.n16Temp4                               ;80A507|8584    |000084;
    BRA .continue                                              ;80A509|801E    |80A529;
 
 
.case0600:
    LDA.B strcMap.unk16                                        ;80A50B|A516    |000016;
    SEC                                                        ;80A50D|38      |      ;
    SBC.W #$1000                                               ;80A50E|E90010  |      ;
    STA.B strcVariables.n16Temp1                               ;80A511|857E    |00007E;
    LDA.B strcMap.unk16                                        ;80A513|A516    |000016;
    SEC                                                        ;80A515|38      |      ;
    SBC.W #$5000                                               ;80A516|E90050  |      ;
    XBA                                                        ;80A519|EB      |      ;
    AND.W #$000F                                               ;80A51A|290F00  |      ;
    ASL A                                                      ;80A51D|0A      |      ;
    STA.B strcVariables.n16Temp2                               ;80A51E|8580    |000080;
    LDA.W #$4000                                               ;80A520|A90040  |      ;
    STA.B strcVariables.n16Temp3                               ;80A523|8582    |000082;
    STZ.B strcVariables.n16Temp4                               ;80A525|6484    |000084;
    BRA .continue                                              ;80A527|8000    |80A529;
 
 
.continue:
    LDA.W #$2000                                               ;80A529|A90020  |      ;
    CLC                                                        ;80A52C|18      |      ;
    ADC.B strcMap.unk12                                        ;80A52D|6512    |000012;
    ADC.W #$0060                                               ;80A52F|696000  |      ;
    STA.B ptrTemp0x72                                          ;80A532|8572    |000072;
    ADC.W #$2000                                               ;80A534|690020  |      ;
    STA.B ptrUnknown0x75                                       ;80A537|8575    |000075;
    SEP #$20                                                   ;80A539|E220    |      ;
    LDA.B #$7E                                                 ;80A53B|A97E    |      ;
    STA.B ptrTemp0x72+2                                        ;80A53D|8574    |000074;
    STA.B ptrUnknown0x75+2                                     ;80A53F|8577    |000077;
    REP #$20                                                   ;80A541|C220    |      ;
    LDX.W #$0000                                               ;80A543|A20000  |      ;
 
.label1:
    PHX                                                        ;80A546|DA      |      ;
    LDA.B strcVariables.n16Temp2                               ;80A547|A580    |000080;
    CMP.W #$0040                                               ;80A549|C94000  |      ;
    BNE .label2                                                ;80A54C|D00A    |80A558;
    STZ.B strcVariables.n16Temp2                               ;80A54E|6480    |000080;
    LDA.B strcVariables.n16Temp1                               ;80A550|A57E    |00007E;
    CLC                                                        ;80A552|18      |      ;
    ADC.W #$2000                                               ;80A553|690020  |      ;
    STA.B strcVariables.n16Temp1                               ;80A556|857E    |00007E;
 
.label2:
    LDA.B strcVariables.n16Temp4                               ;80A558|A584    |000084;
    CMP.W #$0040                                               ;80A55A|C94000  |      ;
    BNE .label3                                                ;80A55D|D00A    |80A569;
    STZ.B strcVariables.n16Temp4                               ;80A55F|6484    |000084;
    LDA.B strcVariables.n16Temp3                               ;80A561|A582    |000082;
    CLC                                                        ;80A563|18      |      ;
    ADC.W #$2000                                               ;80A564|690020  |      ;
    STA.B strcVariables.n16Temp3                               ;80A567|8582    |000082;
 
.label3:
    LDY.B strcVariables.n16Temp1                               ;80A569|A47E    |00007E;
    LDX.B strcVariables.n16Temp2                               ;80A56B|A680    |000080;
    LDA.B [ptrTemp0x72],Y                                      ;80A56D|B772    |000072;
    STA.W $0746,X                                              ;80A56F|9D4607  |000746;
    LDY.B strcVariables.n16Temp3                               ;80A572|A482    |000082;
    LDX.B strcVariables.n16Temp4                               ;80A574|A684    |000084;
    LDA.B [ptrUnknown0x75],Y                                   ;80A576|B775    |000075;
    STA.W $07C6,X                                              ;80A578|9DC607  |0007C6;
    LDA.B strcVariables.n16Temp1                               ;80A57B|A57E    |00007E;
    CLC                                                        ;80A57D|18      |      ;
    ADC.W #$0100                                               ;80A57E|690001  |      ;
    STA.B strcVariables.n16Temp1                               ;80A581|857E    |00007E;
    INC.B strcVariables.n16Temp2                               ;80A583|E680    |000080;
    INC.B strcVariables.n16Temp2                               ;80A585|E680    |000080;
    LDA.B strcVariables.n16Temp3                               ;80A587|A582    |000082;
    CLC                                                        ;80A589|18      |      ;
    ADC.W #$0100                                               ;80A58A|690001  |      ;
    STA.B strcVariables.n16Temp3                               ;80A58D|8582    |000082;
    INC.B strcVariables.n16Temp4                               ;80A58F|E684    |000084;
    INC.B strcVariables.n16Temp4                               ;80A591|E684    |000084;
    PLX                                                        ;80A593|FA      |      ;
    INX                                                        ;80A594|E8      |      ;
    INX                                                        ;80A595|E8      |      ;
    CPX.W #$0040                                               ;80A596|E04000  |      ;
    BNE .label1                                                ;80A599|D0AB    |80A546;
    SEP #$20                                                   ;80A59B|E220    |      ;
    LDA.B #$00                                                 ;80A59D|A900    |      ;
    STA.B strcSystem.arrayIndex                                ;80A59F|8527    |000027;
    LDA.B #$18                                                 ;80A5A1|A918    |      ;
    STA.B strcSystem.destinationRegister                       ;80A5A3|8529    |000029;
    REP #$20                                                   ;80A5A5|C220    |      ;
    LDY.W #$0040                                               ;80A5A7|A04000  |      ;
    LDA.B strcMap.unk10                                        ;80A5AA|A510    |000010;
    CLC                                                        ;80A5AC|18      |      ;
    ADC.W #$6000                                               ;80A5AD|690060  |      ;
    TAX                                                        ;80A5B0|AA      |      ;
    LDA.W #$0746                                               ;80A5B1|A94607  |      ;
    STA.B ptrTemp0x72                                          ;80A5B4|8572    |000072;
    SEP #$20                                                   ;80A5B6|E220    |      ;
    LDA.B #$80                                                 ;80A5B8|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80A5BA|8574    |000074;
    REP #$20                                                   ;80A5BC|C220    |      ;
    LDA.W #$0081                                               ;80A5BE|A98100  |      ;
    JSL.L fCore_PrepareTransfer                                ;80A5C1|22338A80|808A33;
    SEP #$20                                                   ;80A5C5|E220    |      ;
    LDA.B #$01                                                 ;80A5C7|A901    |      ;
    STA.B strcSystem.arrayIndex                                ;80A5C9|8527    |000027;
    LDA.B #$18                                                 ;80A5CB|A918    |      ;
    STA.B strcSystem.destinationRegister                       ;80A5CD|8529    |000029;
    REP #$20                                                   ;80A5CF|C220    |      ;
    LDY.W #$0040                                               ;80A5D1|A04000  |      ;
    LDA.B strcMap.unk10                                        ;80A5D4|A510    |000010;
    CLC                                                        ;80A5D6|18      |      ;
    ADC.W #$6000                                               ;80A5D7|690060  |      ;
    ADC.W #$0800                                               ;80A5DA|690008  |      ;
    TAX                                                        ;80A5DD|AA      |      ;
    LDA.W #$07C6                                               ;80A5DE|A9C607  |      ;
    STA.B ptrTemp0x72                                          ;80A5E1|8572    |000072;
    SEP #$20                                                   ;80A5E3|E220    |      ;
    LDA.B #$80                                                 ;80A5E5|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80A5E7|8574    |000074;
    REP #$20                                                   ;80A5E9|C220    |      ;
    LDA.W #$0081                                               ;80A5EB|A98100  |      ;
    JSL.L fCore_PrepareTransfer                                ;80A5EE|22338A80|808A33;
    REP #$30                                                   ;80A5F2|C230    |      ;
    LDA.B strcMap.unk12                                        ;80A5F4|A512    |000012;
    CLC                                                        ;80A5F6|18      |      ;
    ADC.W #$0002                                               ;80A5F7|690200  |      ;
    STA.B strcMap.unk12                                        ;80A5FA|8512    |000012;
    LDA.B strcMap.unk10                                        ;80A5FC|A510    |000010;
    CLC                                                        ;80A5FE|18      |      ;
    ADC.W #$0001                                               ;80A5FF|690100  |      ;
    CMP.W #$0020                                               ;80A602|C92000  |      ;
    BNE .label4                                                ;80A605|D005    |80A60C;
    LDA.W #$0400                                               ;80A607|A90004  |      ;
    BRA .return                                                ;80A60A|8008    |80A614;
 
 
.label4:
    CMP.W #$0420                                               ;80A60C|C92004  |      ;
    BNE .return                                                ;80A60F|D003    |80A614;
    LDA.W #$0000                                               ;80A611|A90000  |      ;
 
.return:
    STA.B strcMap.unk10                                        ;80A614|8510    |000010;
    RTL                                                        ;80A616|6B      |      ;
 
 
fUnknown_80A617:
    REP #$30                                                   ;80A617|C230    |      ;
    LDA.B strcMap.unk16                                        ;80A619|A516    |000016;
    CMP.W #$1000                                               ;80A61B|C90010  |      ;
    BCC .case1000                                              ;80A61E|901C    |80A63C;
    CMP.W #$2000                                               ;80A620|C90020  |      ;
    BCC .case2000                                              ;80A623|9021    |80A646;
    CMP.W #$3000                                               ;80A625|C90030  |      ;
    BCC .case3000                                              ;80A628|9031    |80A65B;
    CMP.W #$4000                                               ;80A62A|C90040  |      ;
    BCC .case4000                                              ;80A62D|9041    |80A670;
    CMP.W #$5000                                               ;80A62F|C90050  |      ;
    BCC .case5000                                              ;80A632|9054    |80A688;
    CMP.W #$6000                                               ;80A634|C90060  |      ;
    BCC .case6000                                              ;80A637|9067    |80A6A0;
    JMP.W .continue                                            ;80A639|4CBEA6  |80A6BE;
 
 
.case1000:
    STZ.B strcVariables.n16Temp1                               ;80A63C|647E    |00007E;
    STZ.B strcVariables.n16Temp2                               ;80A63E|6480    |000080;
    STZ.B strcVariables.n16Temp3                               ;80A640|6482    |000082;
    STZ.B strcVariables.n16Temp4                               ;80A642|6484    |000084;
    BRA .continue                                              ;80A644|8078    |80A6BE;
 
 
.case2000:
    LDA.B strcMap.unk16                                        ;80A646|A516    |000016;
    SEC                                                        ;80A648|38      |      ;
    SBC.W #$1000                                               ;80A649|E90010  |      ;
    STA.B strcVariables.n16Temp1                               ;80A64C|857E    |00007E;
    XBA                                                        ;80A64E|EB      |      ;
    AND.W #$001F                                               ;80A64F|291F00  |      ;
    ASL A                                                      ;80A652|0A      |      ;
    STA.B strcVariables.n16Temp2                               ;80A653|8580    |000080;
    STZ.B strcVariables.n16Temp3                               ;80A655|6482    |000082;
    STZ.B strcVariables.n16Temp4                               ;80A657|6484    |000084;
    BRA .continue                                              ;80A659|8063    |80A6BE;
 
 
.case3000:
    LDA.B strcMap.unk16                                        ;80A65B|A516    |000016;
    SEC                                                        ;80A65D|38      |      ;
    SBC.W #$1000                                               ;80A65E|E90010  |      ;
    STA.B strcVariables.n16Temp1                               ;80A661|857E    |00007E;
    XBA                                                        ;80A663|EB      |      ;
    AND.W #$001F                                               ;80A664|291F00  |      ;
    ASL A                                                      ;80A667|0A      |      ;
    STA.B strcVariables.n16Temp2                               ;80A668|8580    |000080;
    STZ.B strcVariables.n16Temp3                               ;80A66A|6482    |000082;
    STZ.B strcVariables.n16Temp4                               ;80A66C|6484    |000084;
    BRA .continue                                              ;80A66E|804E    |80A6BE;
 
 
.case4000:
    LDA.W #$4000                                               ;80A670|A90040  |      ;
    STA.B strcVariables.n16Temp1                               ;80A673|857E    |00007E;
    STZ.B strcVariables.n16Temp2                               ;80A675|6480    |000080;
    LDA.B strcMap.unk16                                        ;80A677|A516    |000016;
    SEC                                                        ;80A679|38      |      ;
    SBC.W #$3000                                               ;80A67A|E90030  |      ;
    STA.B strcVariables.n16Temp3                               ;80A67D|8582    |000082;
    XBA                                                        ;80A67F|EB      |      ;
    AND.W #$001F                                               ;80A680|291F00  |      ;
    ASL A                                                      ;80A683|0A      |      ;
    STA.B strcVariables.n16Temp4                               ;80A684|8584    |000084;
    BRA .continue                                              ;80A686|8036    |80A6BE;
 
 
.case5000:
    LDA.W #$4000                                               ;80A688|A90040  |      ;
    STA.B strcVariables.n16Temp1                               ;80A68B|857E    |00007E;
    STZ.B strcVariables.n16Temp2                               ;80A68D|6480    |000080;
    LDA.B strcMap.unk16                                        ;80A68F|A516    |000016;
    SEC                                                        ;80A691|38      |      ;
    SBC.W #$3000                                               ;80A692|E90030  |      ;
    STA.B strcVariables.n16Temp3                               ;80A695|8582    |000082;
    XBA                                                        ;80A697|EB      |      ;
    AND.W #$001F                                               ;80A698|291F00  |      ;
    ASL A                                                      ;80A69B|0A      |      ;
    STA.B strcVariables.n16Temp4                               ;80A69C|8584    |000084;
    BRA .continue                                              ;80A69E|801E    |80A6BE;
 
 
.case6000:
    LDA.B strcMap.unk16                                        ;80A6A0|A516    |000016;
    SEC                                                        ;80A6A2|38      |      ;
    SBC.W #$1000                                               ;80A6A3|E90010  |      ;
    STA.B strcVariables.n16Temp1                               ;80A6A6|857E    |00007E;
    LDA.B strcMap.unk16                                        ;80A6A8|A516    |000016;
    SEC                                                        ;80A6AA|38      |      ;
    SBC.W #$5000                                               ;80A6AB|E90050  |      ;
    XBA                                                        ;80A6AE|EB      |      ;
    AND.W #$001F                                               ;80A6AF|291F00  |      ;
    ASL A                                                      ;80A6B2|0A      |      ;
    STA.B strcVariables.n16Temp2                               ;80A6B3|8580    |000080;
    LDA.W #$4000                                               ;80A6B5|A90040  |      ;
    STA.B strcVariables.n16Temp3                               ;80A6B8|8582    |000082;
    STZ.B strcVariables.n16Temp4                               ;80A6BA|6484    |000084;
    BRA .continue                                              ;80A6BC|8000    |80A6BE;
 
 
.continue:
    LDA.W #$2000                                               ;80A6BE|A90020  |      ;
    CLC                                                        ;80A6C1|18      |      ;
    ADC.B strcMap.unk12                                        ;80A6C2|6512    |000012;
    SEC                                                        ;80A6C4|38      |      ;
    SBC.W #$0020                                               ;80A6C5|E92000  |      ;
    STA.B ptrTemp0x72                                          ;80A6C8|8572    |000072;
    CLC                                                        ;80A6CA|18      |      ;
    ADC.W #$2000                                               ;80A6CB|690020  |      ;
    STA.B ptrUnknown0x75                                       ;80A6CE|8575    |000075;
    SEP #$20                                                   ;80A6D0|E220    |      ;
    LDA.B #$7E                                                 ;80A6D2|A97E    |      ;
    STA.B ptrTemp0x72+2                                        ;80A6D4|8574    |000074;
    STA.B ptrUnknown0x75+2                                     ;80A6D6|8577    |000077;
    REP #$20                                                   ;80A6D8|C220    |      ;
    LDX.W #$0000                                               ;80A6DA|A20000  |      ;
 
.label1:
    PHX                                                        ;80A6DD|DA      |      ;
    LDA.B strcVariables.n16Temp2                               ;80A6DE|A580    |000080;
    CMP.W #$0040                                               ;80A6E0|C94000  |      ;
    BNE .label2                                                ;80A6E3|D00A    |80A6EF;
    STZ.B strcVariables.n16Temp2                               ;80A6E5|6480    |000080;
    LDA.B strcVariables.n16Temp1                               ;80A6E7|A57E    |00007E;
    CLC                                                        ;80A6E9|18      |      ;
    ADC.W #$2000                                               ;80A6EA|690020  |      ;
    STA.B strcVariables.n16Temp1                               ;80A6ED|857E    |00007E;
 
.label2:
    LDA.B strcVariables.n16Temp4                               ;80A6EF|A584    |000084;
    CMP.W #$0040                                               ;80A6F1|C94000  |      ;
    BNE .label3                                                ;80A6F4|D00A    |80A700;
    STZ.B strcVariables.n16Temp4                               ;80A6F6|6484    |000084;
    LDA.B strcVariables.n16Temp3                               ;80A6F8|A582    |000082;
    CLC                                                        ;80A6FA|18      |      ;
    ADC.W #$2000                                               ;80A6FB|690020  |      ;
    STA.B strcVariables.n16Temp3                               ;80A6FE|8582    |000082;
 
.label3:
    LDY.B strcVariables.n16Temp1                               ;80A700|A47E    |00007E;
    LDX.B strcVariables.n16Temp2                               ;80A702|A680    |000080;
    LDA.B [ptrTemp0x72],Y                                      ;80A704|B772    |000072;
    STA.W $0746,X                                              ;80A706|9D4607  |000746;
    LDY.B strcVariables.n16Temp3                               ;80A709|A482    |000082;
    LDX.B strcVariables.n16Temp4                               ;80A70B|A684    |000084;
    LDA.B [ptrUnknown0x75],Y                                   ;80A70D|B775    |000075;
    STA.W $07C6,X                                              ;80A70F|9DC607  |0007C6;
    LDA.B strcVariables.n16Temp1                               ;80A712|A57E    |00007E;
    CLC                                                        ;80A714|18      |      ;
    ADC.W #$0100                                               ;80A715|690001  |      ;
    STA.B strcVariables.n16Temp1                               ;80A718|857E    |00007E;
    INC.B strcVariables.n16Temp2                               ;80A71A|E680    |000080;
    INC.B strcVariables.n16Temp2                               ;80A71C|E680    |000080;
    LDA.B strcVariables.n16Temp3                               ;80A71E|A582    |000082;
    CLC                                                        ;80A720|18      |      ;
    ADC.W #$0100                                               ;80A721|690001  |      ;
    STA.B strcVariables.n16Temp3                               ;80A724|8582    |000082;
    INC.B strcVariables.n16Temp4                               ;80A726|E684    |000084;
    INC.B strcVariables.n16Temp4                               ;80A728|E684    |000084;
    PLX                                                        ;80A72A|FA      |      ;
    INX                                                        ;80A72B|E8      |      ;
    INX                                                        ;80A72C|E8      |      ;
    CPX.W #$0040                                               ;80A72D|E04000  |      ;
    BNE .label1                                                ;80A730|D0AB    |80A6DD;
    SEP #$20                                                   ;80A732|E220    |      ;
    LDA.B #$00                                                 ;80A734|A900    |      ;
    STA.B strcSystem.arrayIndex                                ;80A736|8527    |000027;
    LDA.B #$18                                                 ;80A738|A918    |      ;
    STA.B strcSystem.destinationRegister                       ;80A73A|8529    |000029;
    REP #$20                                                   ;80A73C|C220    |      ;
    LDY.W #$0040                                               ;80A73E|A04000  |      ;
    LDA.B strcMap.unk10                                        ;80A741|A510    |000010;
    CLC                                                        ;80A743|18      |      ;
    ADC.W #$6000                                               ;80A744|690060  |      ;
    TAX                                                        ;80A747|AA      |      ;
    LDA.W #$0746                                               ;80A748|A94607  |      ;
    STA.B ptrTemp0x72                                          ;80A74B|8572    |000072;
    SEP #$20                                                   ;80A74D|E220    |      ;
    LDA.B #$80                                                 ;80A74F|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80A751|8574    |000074;
    REP #$20                                                   ;80A753|C220    |      ;
    LDA.W #$0081                                               ;80A755|A98100  |      ;
    JSL.L fCore_PrepareTransfer                                ;80A758|22338A80|808A33;
    SEP #$20                                                   ;80A75C|E220    |      ;
    LDA.B #$01                                                 ;80A75E|A901    |      ;
    STA.B strcSystem.arrayIndex                                ;80A760|8527    |000027;
    LDA.B #$18                                                 ;80A762|A918    |      ;
    STA.B strcSystem.destinationRegister                       ;80A764|8529    |000029;
    REP #$20                                                   ;80A766|C220    |      ;
    LDY.W #$0040                                               ;80A768|A04000  |      ;
    LDA.B strcMap.unk10                                        ;80A76B|A510    |000010;
    CLC                                                        ;80A76D|18      |      ;
    ADC.W #$6000                                               ;80A76E|690060  |      ;
    ADC.W #$0800                                               ;80A771|690008  |      ;
    TAX                                                        ;80A774|AA      |      ;
    LDA.W #$07C6                                               ;80A775|A9C607  |      ;
    STA.B ptrTemp0x72                                          ;80A778|8572    |000072;
    SEP #$20                                                   ;80A77A|E220    |      ;
    LDA.B #$80                                                 ;80A77C|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80A77E|8574    |000074;
    REP #$20                                                   ;80A780|C220    |      ;
    LDA.W #$0081                                               ;80A782|A98100  |      ;
    JSL.L fCore_PrepareTransfer                                ;80A785|22338A80|808A33;
    REP #$30                                                   ;80A789|C230    |      ;
    LDA.B strcMap.unk12                                        ;80A78B|A512    |000012;
    SEC                                                        ;80A78D|38      |      ;
    SBC.W #$0002                                               ;80A78E|E90200  |      ;
    STA.B strcMap.unk12                                        ;80A791|8512    |000012;
    LDA.B strcMap.unk10                                        ;80A793|A510    |000010;
    SEC                                                        ;80A795|38      |      ;
    SBC.W #$0001                                               ;80A796|E90100  |      ;
    CMP.W #$FFFF                                               ;80A799|C9FFFF  |      ;
    BNE .label4                                                ;80A79C|D005    |80A7A3;
    LDA.W #$041F                                               ;80A79E|A91F04  |      ;
    BRA .return                                                ;80A7A1|8008    |80A7AB;
 
 
.label4:
    CMP.W #$03FF                                               ;80A7A3|C9FF03  |      ;
    BNE .return                                                ;80A7A6|D003    |80A7AB;
    LDA.W #$001F                                               ;80A7A8|A91F00  |      ;
 
.return:
    STA.B strcMap.unk10                                        ;80A7AB|8510    |000010;
    RTL                                                        ;80A7AD|6B      |      ;
 
 
fTileMap_SetTileMapPointerGetAreaFlags:
    SEP #$20                                                   ;80A7AE|E220    |      ; $22: nIndex, Y: nFieldOffset, return A: nPresetId, $18: pTileMap
    REP #$10                                                   ;80A7B0|C210    |      ;
    LDA.B #$00                                                 ;80A7B2|A900    |      ;
    XBA                                                        ;80A7B4|EB      |      ;
    LDA.B strcMap.loadAreaId                                   ;80A7B5|A522    |000022;
    REP #$20                                                   ;80A7B7|C220    |      ;
    ASL A                                                      ;80A7B9|0A      |      ;
    TAX                                                        ;80A7BA|AA      |      ;
    LDA.L aTileMapData,X                                       ;80A7BB|BF7CAA80|80AA7C;
    STA.B strcMap.pCurrent                                     ;80A7BF|8518    |000018;
    SEP #$20                                                   ;80A7C1|E220    |      ;
    LDA.B (strcMap.pCurrent),Y                                 ;80A7C3|B118    |000018;
    RTL                                                        ;80A7C5|6B      |      ;
 
 
fTileMap_MapChangeHandler:
    SEP #$20                                                   ;80A7C6|E220    |      ;
    REP #$10                                                   ;80A7C8|C210    |      ;
    LDA.B #$00                                                 ;80A7CA|A900    |      ;
    XBA                                                        ;80A7CC|EB      |      ; B = 0
    LDA.B strcMap.loadAreaId                                   ;80A7CD|A522    |000022;
    REP #$20                                                   ;80A7CF|C220    |      ;
    ASL A                                                      ;80A7D1|0A      |      ;
    TAX                                                        ;80A7D2|AA      |      ;
    LDA.L aTileMapData,X                                       ;80A7D3|BF7CAA80|80AA7C; X = nSelectedTilemapId * 2
    STA.B strcMap.pCurrent                                     ;80A7D7|8518    |000018;
    SEP #$20                                                   ;80A7D9|E220    |      ;
    LDY.W #$0000                                               ;80A7DB|A00000  |      ;
    LDA.B strcMap.loadAreaId                                   ;80A7DE|A522    |000022;
    CMP.B #$57                                                 ;80A7E0|C957    |      ;
    BCS .label2                                                ;80A7E2|B02E    |80A812;
    LDA.B (strcMap.pCurrent),Y                                 ;80A7E4|B118    |000018; Y = 0
    STA.W strcDialogDisplay.mapCurrentPresetId                 ;80A7E6|8D9501  |000195;
    JSL.L fCore_ManageGraphicsPresets                          ;80A7E9|22598C80|808C59;
    REP #$30                                                   ;80A7ED|C230    |      ;
    INY                                                        ;80A7EF|C8      |      ;
    LDA.B (strcMap.pCurrent),Y                                 ;80A7F0|B118    |000018; Y = 1
    ORA.W strcDialogDisplay.mapFlags                           ;80A7F2|0D9601  |000196;
    STA.W strcDialogDisplay.mapFlags                           ;80A7F5|8D9601  |000196;
    REP #$20                                                   ;80A7F8|C220    |      ;
    %CheckFlag(daily2, $0001)
    BEQ .label1                                                ;80A801|F00B    |80A80E;
    REP #$30                                                   ;80A803|C230    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;80A805|AD9601  |000196;
    AND.W #$FFDF                                               ;80A808|29DFFF  |      ;
    STA.W strcDialogDisplay.mapFlags                           ;80A80B|8D9601  |000196;
 
.label1:
    REP #$30                                                   ;80A80E|C230    |      ;
    INY                                                        ;80A810|C8      |      ;
    INY                                                        ;80A811|C8      |      ;
 
.label2:
    SEP #$20                                                   ;80A812|E220    |      ;
    LDA.B (strcMap.pCurrent),Y                                 ;80A814|B118    |000018; Y = 3
    STA.W strcDialogDisplay.mapMultiWidth                      ;80A816|8D8101  |000181;
    INY                                                        ;80A819|C8      |      ;
    LDA.B (strcMap.pCurrent),Y                                 ;80A81A|B118    |000018; Y = 4
    STA.W strcDialogDisplay.mapMultiHeight                     ;80A81C|8D8201  |000182;
    CMP.B #$03                                                 ;80A81F|C903    |      ;
    BCC .label3                                                ;80A821|900B    |80A82E;
    REP #$20                                                   ;80A823|C220    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;80A825|AD9601  |000196;
    ORA.W #$0001                                               ;80A828|090100  |      ;
    STA.W strcDialogDisplay.mapFlags                           ;80A82B|8D9601  |000196;
 
.label3:
    SEP #$20                                                   ;80A82E|E220    |      ;
    INY                                                        ;80A830|C8      |      ;
    LDA.B (strcMap.pCurrent),Y                                 ;80A831|B118    |000018; Y = 5
    STA.B strcVariables.n8Temp1                                ;80A833|8592    |000092; $92 = nTilemapCount
    INY                                                        ;80A835|C8      |      ;
    LDA.B (strcMap.pCurrent),Y                                 ;80A836|B118    |000018; Y = 6
    STA.B strcVariables.n8Temp2                                ;80A838|8593    |000093; $93 = nChacatermapCount
    INY                                                        ;80A83A|C8      |      ;
    LDA.B strcMap.loadAreaId                                   ;80A83B|A522    |000022;
    CMP.B #$57                                                 ;80A83D|C957    |      ;
    BCS .label4                                                ;80A83F|B01A    |80A85B;
    REP #$20                                                   ;80A841|C220    |      ;
    LDA.B (strcMap.pCurrent),Y                                 ;80A843|B118    |000018; Y = 7
    STA.B strcPlayer.offsetCamX                                ;80A845|85ED    |0000ED;
    INY                                                        ;80A847|C8      |      ;
    INY                                                        ;80A848|C8      |      ;
    LDA.B (strcMap.pCurrent),Y                                 ;80A849|B118    |000018; Y = 9
    STA.B strcCamera.offsetCamX                                ;80A84B|85F1    |0000F1;
    INY                                                        ;80A84D|C8      |      ;
    INY                                                        ;80A84E|C8      |      ;
    LDA.B (strcMap.pCurrent),Y                                 ;80A84F|B118    |000018; Y = 11
    STA.B strcPlayer.offsetCamY                                ;80A851|85EF    |0000EF;
    INY                                                        ;80A853|C8      |      ;
    INY                                                        ;80A854|C8      |      ;
    LDA.B (strcMap.pCurrent),Y                                 ;80A855|B118    |000018; Y = 13
    STA.B strcCamera.offsetCamY                                ;80A857|85F3    |0000F3;
    INY                                                        ;80A859|C8      |      ;
    INY                                                        ;80A85A|C8      |      ;
 
.label4:
    SEP #$20                                                   ;80A85B|E220    |      ;
    LDA.B strcVariables.n8Temp1                                ;80A85D|A592    |000092;
    BEQ .charactermaps                                         ;80A85F|F05D    |80A8BE;
 
.tilemaps:
    REP #$20                                                   ;80A861|C220    |      ;
    LDA.B (strcMap.pCurrent),Y                                 ;80A863|B118    |000018; Y = 15
    PHA                                                        ;80A865|48      |      ; nDestinationAddress -> stack1
    INY                                                        ;80A866|C8      |      ;
    INY                                                        ;80A867|C8      |      ;
    LDA.B (strcMap.pCurrent),Y                                 ;80A868|B118    |000018; Y = 17
    STA.B ptrTemp0x72                                          ;80A86A|8572    |000072;
    INY                                                        ;80A86C|C8      |      ;
    INY                                                        ;80A86D|C8      |      ;
    SEP #$20                                                   ;80A86E|E220    |      ;
    LDA.B (strcMap.pCurrent),Y                                 ;80A870|B118    |000018; Y = 19
    STA.B ptrTemp0x72+2                                        ;80A872|8574    |000074; $72 = pCompressedMap
    REP #$20                                                   ;80A874|C220    |      ;
    INY                                                        ;80A876|C8      |      ; Y++
    PHY                                                        ;80A877|5A      |      ; Y -> stack2
    LDA.W #$2000                                               ;80A878|A90020  |      ;
    STA.B ptrUnknown0x75                                       ;80A87B|8575    |000075;
    SEP #$20                                                   ;80A87D|E220    |      ;
    LDA.B #$7E                                                 ;80A87F|A97E    |      ;
    STA.B ptrUnknown0x75+2                                     ;80A881|8577    |000077; $75 = 0x7E2000
    JSL.L fGraphicsDecompressTilemap                           ;80A883|22F88183|8381F8;
    SEP #$20                                                   ;80A887|E220    |      ;
    LDA.B #$00                                                 ;80A889|A900    |      ;
    STA.B strcSystem.arrayIndex                                ;80A88B|8527    |000027;
    LDA.B #$18                                                 ;80A88D|A918    |      ;
    STA.B strcSystem.destinationRegister                       ;80A88F|8529    |000029;
    REP #$30                                                   ;80A891|C230    |      ;
    PLY                                                        ;80A893|7A      |      ; Y = stack2
    PLA                                                        ;80A894|68      |      ; A = nDestinationAddress
    PHY                                                        ;80A895|5A      |      ; Y -> stack1
    TAX                                                        ;80A896|AA      |      ; X = nDestinationAddress
    LDY.W #$2000                                               ;80A897|A00020  |      ;
    LDA.W #$2000                                               ;80A89A|A90020  |      ;
    STA.B ptrTemp0x72                                          ;80A89D|8572    |000072;
    SEP #$20                                                   ;80A89F|E220    |      ;
    LDA.B #$7E                                                 ;80A8A1|A97E    |      ;
    STA.B ptrTemp0x72+2                                        ;80A8A3|8574    |000074; $72 = 0x7E2000
    REP #$20                                                   ;80A8A5|C220    |      ;
    LDA.W #$0080                                               ;80A8A7|A98000  |      ; A = 0x80
    JSL.L fCore_PrepareTransfer                                ;80A8AA|22338A80|808A33;
    JSL.L fCore_StartPreparedTransfer                          ;80A8AE|22B28A80|808AB2;
    REP #$30                                                   ;80A8B2|C230    |      ;
    PLY                                                        ;80A8B4|7A      |      ; Y = stack1
    SEP #$20                                                   ;80A8B5|E220    |      ;
    LDA.B strcVariables.n8Temp1                                ;80A8B7|A592    |000092;
    DEC A                                                      ;80A8B9|3A      |      ;
    STA.B strcVariables.n8Temp1                                ;80A8BA|8592    |000092;
    BNE .tilemaps                                              ;80A8BC|D0A3    |80A861;
 
.charactermaps:
    REP #$30                                                   ;80A8BE|C230    |      ;
    LDA.B (strcMap.pCurrent),Y                                 ;80A8C0|B118    |000018;
    STA.B strcVariables.n16Unk8A                               ;80A8C2|858A    |00008A;
    INY                                                        ;80A8C4|C8      |      ;
    INY                                                        ;80A8C5|C8      |      ;
    LDA.B (strcMap.pCurrent),Y                                 ;80A8C6|B118    |000018;
    STA.B ptrTemp0x72                                          ;80A8C8|8572    |000072;
    INY                                                        ;80A8CA|C8      |      ;
    INY                                                        ;80A8CB|C8      |      ;
    SEP #$20                                                   ;80A8CC|E220    |      ;
    LDA.B (strcMap.pCurrent),Y                                 ;80A8CE|B118    |000018;
    STA.B ptrTemp0x72+2                                        ;80A8D0|8574    |000074;
    REP #$20                                                   ;80A8D2|C220    |      ;
    INY                                                        ;80A8D4|C8      |      ;
    PHY                                                        ;80A8D5|5A      |      ;
    LDA.W #$2000                                               ;80A8D6|A90020  |      ;
    STA.B ptrUnknown0x75                                       ;80A8D9|8575    |000075;
    SEP #$20                                                   ;80A8DB|E220    |      ;
    LDA.B #$7E                                                 ;80A8DD|A97E    |      ;
    STA.B ptrUnknown0x75+2                                     ;80A8DF|8577    |000077;
    REP #$20                                                   ;80A8E1|C220    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;80A8E3|AD9601  |000196;
    AND.W #$8000                                               ;80A8E6|290080  |      ;
    BNE .label7                                                ;80A8E9|D006    |80A8F1;
    JSL.L fGraphicsDecompressTilemap                           ;80A8EB|22F88183|8381F8;
    BRA .label9                                                ;80A8EF|8010    |80A901;
 
 
.label7:
    REP #$30                                                   ;80A8F1|C230    |      ;
    LDY.W #$0000                                               ;80A8F3|A00000  |      ;
 
.loop:
    LDA.B [ptrTemp0x72],Y                                      ;80A8F6|B772    |000072;
    STA.B [ptrUnknown0x75],Y                                   ;80A8F8|9775    |000075;
    INY                                                        ;80A8FA|C8      |      ;
    INY                                                        ;80A8FB|C8      |      ;
    CPY.W #$8000                                               ;80A8FC|C00080  |      ;
    BNE .loop                                                  ;80A8FF|D0F5    |80A8F6;
 
.label9:
    SEP #$20                                                   ;80A901|E220    |      ;
    LDA.B strcMap.loadAreaId                                   ;80A903|A522    |000022;
    CMP.B #!AREA_TOWNSPRING                                                 
    BCS .loadFarm                                              ;80A907|B004    |80A90D;
    JSL.L fUnknown_82AF00                                      ;80A909|2200AF82|82AF00;
 
.loadFarm:
    SEP #$20                                                   ;80A90D|E220    |      ;
    LDA.B strcVariables.n8Temp2                                ;80A90F|A593    |000093;
    CMP.B #$01                                                 ;80A911|C901    |      ;
    BNE .label11                                               ;80A913|D00F    |80A924;
    REP #$30                                                   ;80A915|C230    |      ;
    %CheckFlag(daily3, $0002)
    BNE .label11                                               ;80A91E|D004    |80A924;
    JSL.L fItemSubrutineHandler_81A9E5                         ;80A920|22E5A981|81A9E5;
 
.label11:
    REP #$20                                                   ;80A924|C220    |      ;
    STZ.B strcCamera.cameraX                                   ;80A926|64F5    |0000F5;
    STZ.B strcCamera.cameraY                                   ;80A928|64F7    |0000F7;
    LDA.W #$0410                                               ;80A92A|A91004  |      ;
    STA.B strcMap.unk10                                        ;80A92D|8510    |000010;
    LDA.W #$0A00                                               ;80A92F|A9000A  |      ;
    STA.B strcMap.unk14                                        ;80A932|8514    |000014;
    STZ.B strcMap.unk12                                        ;80A934|6412    |000012;
    STZ.B strcMap.unk16                                        ;80A936|6416    |000016;
    SEP #$20                                                   ;80A938|E220    |      ;
    STZ.B strcMap.unk20                                        ;80A93A|6420    |000020;
    STZ.B strcMap.unk21                                        ;80A93C|6421    |000021;
    REP #$20                                                   ;80A93E|C220    |      ;
    STZ.B strcPlayer.posX                                      ;80A940|64D6    |0000D6;
    STZ.B strcPlayer.posY                                      ;80A942|64D8    |0000D8;
    SEP #$20                                                   ;80A944|E220    |      ;
    LDA.B #$00                                                 ;80A946|A900    |      ;
    XBA                                                        ;80A948|EB      |      ;
    LDA.W strcDialogDisplay.mapMultiWidth                      ;80A949|AD8101  |000181;
    REP #$20                                                   ;80A94C|C220    |      ;
    ASL A                                                      ;80A94E|0A      |      ;
    TAX                                                        ;80A94F|AA      |      ;
    LDA.L nTable_80AA68,X                                      ;80A950|BF68AA80|80AA68;
    STA.B strcMap.pCurrent+2                                   ;80A954|851A    |00001A;
    SEC                                                        ;80A956|38      |      ;
    SBC.W #$0040                                               ;80A957|E94000  |      ;
    STA.B strcVariables.n16Temp2                               ;80A95A|8580    |000080;
    LDA.L nTable_80AA72,X                                      ;80A95C|BF72AA80|80AA72;
    STA.B strcMap.unk1C                                        ;80A960|851C    |00001C;
    REP #$20                                                   ;80A962|C220    |      ;
    LDA.W #$0000                                               ;80A964|A90000  |      ;
    STA.B strcVariables.n16Temp1                               ;80A967|857E    |00007E;
    LDX.B strcVariables.n16Unk8A                               ;80A969|A68A    |00008A;
    LDY.W #$0040                                               ;80A96B|A04000  |      ;
    LDA.W #$0000                                               ;80A96E|A90000  |      ;
 
.copy40characters:
    REP #$20                                                   ;80A971|C220    |      ;
    PHA                                                        ;80A973|48      |      ;
    LDA.W #$0000                                               ;80A974|A90000  |      ;
 
.label13:
    REP #$30                                                   ;80A977|C230    |      ;
    PHA                                                        ;80A979|48      |      ;
    JSR.W fTileMap_Unknown80AA38                               ;80A97A|2038AA  |80AA38;
    REP #$30                                                   ;80A97D|C230    |      ;
    LDA.B strcVariables.n16Temp1                               ;80A97F|A57E    |00007E;
    CLC                                                        ;80A981|18      |      ;
    ADC.W #$0040                                               ;80A982|694000  |      ;
    STA.B strcVariables.n16Temp1                               ;80A985|857E    |00007E;
    TXA                                                        ;80A987|8A      |      ;
    CLC                                                        ;80A988|18      |      ;
    ADC.W #$0400                                               ;80A989|690004  |      ;
    TAX                                                        ;80A98C|AA      |      ;
    SEP #$20                                                   ;80A98D|E220    |      ;
    LDA.B strcMap.loadAreaId                                   ;80A98F|A522    |000022;
    CMP.B #$5B                                                 ;80A991|C95B    |      ;
    BCS .label14                                               ;80A993|B007    |80A99C;
    LDY.B strcVariables.n16Unk8A                               ;80A995|A48A    |00008A;
    CPY.W #$7000                                               ;80A997|C00070  |      ;
    BEQ .label15                                               ;80A99A|F006    |80A9A2;
 
.label14:
    LDY.W #$0040                                               ;80A99C|A04000  |      ;
    JSR.W fTileMap_Unknown80AA38                               ;80A99F|2038AA  |80AA38;
 
.label15:
    REP #$30                                                   ;80A9A2|C230    |      ;
    LDA.B strcVariables.n16Temp1                               ;80A9A4|A57E    |00007E;
    CLC                                                        ;80A9A6|18      |      ;
    ADC.B strcVariables.n16Temp2                               ;80A9A7|6580    |000080;
    STA.B strcVariables.n16Temp1                               ;80A9A9|857E    |00007E;
    TXA                                                        ;80A9AB|8A      |      ;
    SEC                                                        ;80A9AC|38      |      ;
    SBC.W #$03E0                                               ;80A9AD|E9E003  |      ;
    TAX                                                        ;80A9B0|AA      |      ;
    LDY.W #$0040                                               ;80A9B1|A04000  |      ;
    PLA                                                        ;80A9B4|68      |      ;
    INC A                                                      ;80A9B5|1A      |      ;
    CMP.W #$0020                                               ;80A9B6|C92000  |      ;
    BNE .label13                                               ;80A9B9|D0BC    |80A977;
    SEP #$20                                                   ;80A9BB|E220    |      ;
    LDA.B strcMap.loadAreaId                                   ;80A9BD|A522    |000022;
    CMP.B #$5B                                                 ;80A9BF|C95B    |      ;
    BCS .label16                                               ;80A9C1|B007    |80A9CA;
    LDY.B strcVariables.n16Unk8A                               ;80A9C3|A48A    |00008A;
    CPY.W #$7000                                               ;80A9C5|C00070  |      ;
    BEQ .label17                                               ;80A9C8|F008    |80A9D2;
 
.label16:
    REP #$20                                                   ;80A9CA|C220    |      ;
    TXA                                                        ;80A9CC|8A      |      ;
    CLC                                                        ;80A9CD|18      |      ;
    ADC.W #$0400                                               ;80A9CE|690004  |      ;
    TAX                                                        ;80A9D1|AA      |      ;
 
.label17:
    REP #$30                                                   ;80A9D2|C230    |      ;
    LDY.W #$0040                                               ;80A9D4|A04000  |      ;
    PLA                                                        ;80A9D7|68      |      ;
    INC A                                                      ;80A9D8|1A      |      ;
    CMP.W #$0002                                               ;80A9D9|C90200  |      ;
    BNE .copy40characters                                      ;80A9DC|D093    |80A971;
    REP #$30                                                   ;80A9DE|C230    |      ;
    PLY                                                        ;80A9E0|7A      |      ;
    SEP #$20                                                   ;80A9E1|E220    |      ;
    LDA.B strcVariables.n8Temp2                                ;80A9E3|A593    |000093;
    DEC A                                                      ;80A9E5|3A      |      ;
    STA.B strcVariables.n8Temp2                                ;80A9E6|8593    |000093;
    BEQ .continue                                              ;80A9E8|F003    |80A9ED;
    JMP.W .charactermaps                                       ;80A9EA|4CBEA8  |80A8BE;
 
 
.continue:
    SEP #$20                                                   ;80A9ED|E220    |      ;
    LDA.B strcMap.loadAreaId                                   ;80A9EF|A522    |000022;
    CMP.B #$57                                                 ;80A9F1|C957    |      ;
    BCS .return                                                ;80A9F3|B042    |80AA37;
    SEP #$20                                                   ;80A9F5|E220    |      ;
    LDA.B #$08                                                 ;80A9F7|A908    |      ;
    STA.B strcMap.unk1E                                        ;80A9F9|851E    |00001E;
 
.destinationX:
    REP #$20                                                   ;80A9FB|C220    |      ;
    LDA.B strcPlayer.posX                                      ;80A9FD|A5D6    |0000D6;
    CMP.W strcDialogDisplay.mapDestX                           ;80A9FF|CD7D01  |00017D;
    BEQ .destinationY                                          ;80AA02|F015    |80AA19;
    LDA.B strcPlayer.posX                                      ;80AA04|A5D6    |0000D6;
    CLC                                                        ;80AA06|18      |      ;
    ADC.B strcMap.unk1E                                        ;80AA07|651E    |00001E;
    STA.B strcPlayer.posX                                      ;80AA09|85D6    |0000D6;
    JSL.L fUnknown_809EBC                                      ;80AA0B|22BC9E80|809EBC;
    JSL.L fUnknown_80A11C                                      ;80AA0F|221CA180|80A11C;
    JSL.L fCore_StartTransfer                                  ;80AA13|22F08A80|808AF0;
    BRA .destinationX                                          ;80AA17|80E2    |80A9FB;
 
 
.destinationY:
    REP #$20                                                   ;80AA19|C220    |      ;
    LDA.B strcPlayer.posY                                      ;80AA1B|A5D8    |0000D8;
    CMP.W strcDialogDisplay.mapDestY                           ;80AA1D|CD7F01  |00017F;
    BEQ .return                                                ;80AA20|F015    |80AA37;
    LDA.B strcPlayer.posY                                      ;80AA22|A5D8    |0000D8;
    CLC                                                        ;80AA24|18      |      ;
    ADC.B strcMap.unk1E                                        ;80AA25|651E    |00001E;
    STA.B strcPlayer.posY                                      ;80AA27|85D8    |0000D8;
    JSL.L fUnknown_809EBC                                      ;80AA29|22BC9E80|809EBC;
    JSL.L fUnknown_80A0AB                                      ;80AA2D|22ABA080|80A0AB;
    JSL.L fCore_StartTransfer                                  ;80AA31|22F08A80|808AF0;
    BRA .destinationY                                          ;80AA35|80E2    |80AA19;
 
 
.return:
    RTL                                                        ;80AA37|6B      |      ;
 
 
fTileMap_Unknown80AA38:
    REP #$30                                                   ;80AA38|C230    |      ;
    PHX                                                        ;80AA3A|DA      |      ;
    PHY                                                        ;80AA3B|5A      |      ;
    SEP #$20                                                   ;80AA3C|E220    |      ;
    LDA.B #$00                                                 ;80AA3E|A900    |      ;
    STA.B strcSystem.arrayIndex                                ;80AA40|8527    |000027;
    LDA.B #$18                                                 ;80AA42|A918    |      ;
    STA.B strcSystem.destinationRegister                       ;80AA44|8529    |000029;
    REP #$20                                                   ;80AA46|C220    |      ;
    LDA.W #$2000                                               ;80AA48|A90020  |      ;
    CLC                                                        ;80AA4B|18      |      ;
    ADC.B strcVariables.n16Temp1                               ;80AA4C|657E    |00007E;
    STA.B ptrTemp0x72                                          ;80AA4E|8572    |000072;
    SEP #$20                                                   ;80AA50|E220    |      ;
    LDA.B #$7E                                                 ;80AA52|A97E    |      ;
    STA.B ptrTemp0x72+2                                        ;80AA54|8574    |000074;
    REP #$20                                                   ;80AA56|C220    |      ;
    LDA.W #$0080                                               ;80AA58|A98000  |      ;
    JSL.L fCore_PrepareTransfer                                ;80AA5B|22338A80|808A33;
    JSL.L fCore_StartPreparedTransfer                          ;80AA5F|22B28A80|808AB2;
    REP #$30                                                   ;80AA63|C230    |      ;
    PLY                                                        ;80AA65|7A      |      ;
    PLX                                                        ;80AA66|FA      |      ;
    RTS                                                        ;80AA67|60      |      ;
 
 
nTable_80AA68:
    dw $0000,$0040,$0080,$0100,$0100                           ;80AA68|        |      ;
 
nTable_80AA72:
    dw $0000,$1000,$2000,$4000,$4000                           ;80AA72|        |      ;
aTileMapData:
    dw sFarmSpringMap                                          ;80AA7C|        |80AB3C; 0x60 * [ptr16]
    dw sFarmSummerMap                                          ;80AA7E|        |80AB5F;
    dw sFarmFallMap                                            ;80AA80|        |80AB82;
    dw sFarmWinterMap                                          ;80AA82|        |80ABA5;
    dw sTownSpringMap                                          ;80AA84|        |80ABC8;
    dw sTownSummerMap                                          ;80AA86|        |80ABEB;
    dw sTownFallMap                                            ;80AA88|        |80AC0E;
    dw sTownWinterMap                                          ;80AA8A|        |80AC31;
    dw sFlowerFestivalMap                                      ;80AA8C|        |80AC54;
    dw sHarvestFestivalMap                                     ;80AA8E|        |80AC77;
    dw sStarNightFestivalSquareMap                             ;80AA90|        |80AC9A;
    dw sEggFestivalMap                                         ;80AA92|        |80ACBD;
    dw sRoadSpringMap                                          ;80AA94|        |80ACE0;
    dw sRoadSummerMap                                          ;80AA96|        |80ACF9;
    dw sRoadFallMap                                            ;80AA98|        |80AD12;
    dw sRoadWinterMap                                          ;80AA9A|        |80AD2B;
    dw sMountainSpring                                         ;80AA9C|        |80AD44;
    dw sMountainSummerMap                                      ;80AA9E|        |80AD67;
    dw sMountainFallMap                                        ;80AAA0|        |80AD8A;
    dw sMountainWinterMap                                      ;80AAA2|        |80ADAD;
    dw sStarNightFestivalSpaMap                                ;80AAA4|        |80ADD0;
    dw sHouseMap                                               ;80AAA6|        |80ADF3;
    dw sHouseUpgrade1Map                                       ;80AAA8|        |80AE11;
    dw sHouseUpgrade2Map                                       ;80AAAA|        |80AE2F;
    dw sMayorHouseMap                                          ;80AAAC|        |80AE4D;
    dw sMayorHouseHallMap                                      ;80AAAE|        |80AE66;
    dw sMayorHouseMariaRoomMap                                 ;80AAB0|        |80AE7F;
    dw sChurchMap                                              ;80AAB2|        |80AE98;
    dw sFlowerShopMap                                          ;80AAB4|        |80AEB1;
    dw sFlowerShopRoomMap                                      ;80AAB6|        |80AECA;
    dw sBarMap                                                 ;80AAB8|        |80AEE3;
    dw sBarRoomMap                                             ;80AABA|        |80AEFC;
    dw sRestaurantMap                                          ;80AABC|        |80AF15;
    dw sRestaurantRoomMap                                      ;80AABE|        |80AF2E;
    dw sGeneralStoreMap                                        ;80AAC0|        |80AF47;
    dw sGeneralStoreRoomMap                                    ;80AAC2|        |80AF60;
    dw sAnimalShopMap                                          ;80AAC4|        |80AF79;
    dw sFortuneTellerHouseMap                                  ;80AAC6|        |80AF92;
    dw sToolShedMap                                            ;80AAC8|        |80AFAB;
    dw sBarnMap                                                ;80AACA|        |80AFCE;
    dw sCoopMap                                                ;80AACC|        |80AFE7;
    dw sMountainCaveMap                                        ;80AACE|        |80B000;
    dw sElfTunnelMap                                           ;80AAD0|        |80B019;
    dw sMap_80B032                                             ;80AAD2|        |80B032;
    dw sMap_80B04B                                             ;80AAD4|        |80B04B;
    dw sMap_80B064                                             ;80AAD6|        |80B064;
    dw sMap_80B087                                             ;80AAD8|        |80B087;
    dw sMap_80B0AA                                             ;80AADA|        |80B0AA;
    dw sMap_80B0CD                                             ;80AADC|        |80B0CD;
    dw sSummitSpringMap                                        ;80AADE|        |80B0F0;
    dw sSummitSummerMap                                        ;80AAE0|        |80B113;
    dw sSummitFallMap                                          ;80AAE2|        |80B136;
    dw sSummitWinterMap                                        ;80AAE4|        |80B159;
    dw sMap_80B17C                                             ;80AAE6|        |80B17C;
    dw sMap_80B19F                                             ;80AAE8|        |80B19F;
    dw sMap_80B1C2                                             ;80AAEA|        |80B1C2;
    dw sMap_80B1E5                                             ;80AAEC|        |80B1E5;
    dw sStarNightFestivalMountainTopMap                        ;80AAEE|        |80B208;
    dw sNewYearsFestivalMap                                    ;80AAF0|        |80B22B;
    dw sMap_80B24E                                             ;80AAF2|        |80B24E;
    dw sMap_80B271                                             ;80AAF4|        |80B271;
    dw sMap_80B28A                                             ;80AAF6|        |80B28A;
    dw sMap_80B2AD                                             ;80AAF8|        |80B2AD;
    dw sMap_80B2D0                                             ;80AAFA|        |80B2D0;
    dw sMap_80B2F3                                             ;80AAFC|        |80B2F3;
    dw sMap_80B316                                             ;80AAFE|        |80B316;
    dw sMap_80B339                                             ;80AB00|        |80B339;
    dw sMap_80B35C                                             ;80AB02|        |80B35C;
    dw sMap_80B37F                                             ;80AB04|        |80B37F;
    dw sMap_80B3A2                                             ;80AB06|        |80B3A2;
    dw sMap_80B3C5                                             ;80AB08|        |80B3C5;
    dw sMap_80B3E8                                             ;80AB0A|        |80B3E8;
    dw sMap_80B40B                                             ;80AB0C|        |80B40B;
    dw sMap_80B42E                                             ;80AB0E|        |80B42E;
    dw sMap_80B451                                             ;80AB10|        |80B451;
    dw sMap_80B474                                             ;80AB12|        |80B474;
    dw sMap_80B49C                                             ;80AB14|        |80B49C;
    dw sMap_80B4C4                                             ;80AB16|        |80B4C4;
    dw sMap_80B4EC                                             ;80AB18|        |80B4EC;
    dw sMap_80B514                                             ;80AB1A|        |80B514;
    dw sMap_80B537                                             ;80AB1C|        |80B537;
    dw sMap_80B55F                                             ;80AB1E|        |80B55F;
    dw sMap_80B587                                             ;80AB20|        |80B587;
    dw sMap_80B5AF                                             ;80AB22|        |80B5AF;
    dw sMap_80B5D2                                             ;80AB24|        |80B5D2;
    dw sMap_80B5F5                                             ;80AB26|        |80B5F5;
    dw sMap_80B618                                             ;80AB28|        |80B618;
    dw sRainOverlay                                            ;80AB2A|        |80B640;
    dw sCloudsOverlay                                          ;80AB2C|        |80B64E;
    dw sSnowOverlay                                            ;80AB2E|        |80B65C;
    dw sHeavySnowOverlay                                       ;80AB30|        |80B66A;
    dw sIntroFarmScrool                                        ;80AB32|        |80B678;
    dw sHarvestMoonLogo                                        ;80AB34|        |80B69A;
    dw sNatsumeLogo                                            ;80AB36|        |80B6A3;
    dw sMenuScreenBackgrounds                                  ;80AB38|        |80B6B1;
    dw sMenuCharacters                                         ;80AB3A|        |80B6D3;
 
sFarmSpringMap:
    db $00                                                     ;80AB3C|        |      ; Graphic Preset
 
  + dw !AFLAGS_RAWCHARMAP|!AFLAGS_UNK0080|!AFLAGS_FOR0040|!AFLAGS_UNK0020                                                   
 
  + db $04                                                     ;80AB3F|        |      ; room width multi
 
  + db $04                                                     ;80AB40|        |      ; room height multi
 
  + db $03                                                     ;80AB41|        |      ; number_of_tilemaps
 
  + db $01                                                     ;80AB42|        |      ; number_of_charactermaps
 
  + dw $0000                                                   ;80AB43|        |      ; OBJ_clamp_left
 
  + dw $0300                                                   ;80AB45|        |      ; OBJ_clamp_right
 
  + dw $0000                                                   ;80AB47|        |      ; OBJ_clamp_up
 
  + dw $0300                                                   ;80AB49|        |      ; OBJ_clamp_down
 
  + dw $2000                                                   ;80AB4B|        |      ; Destination in VRAM 1
    dl sCompressedTilemap_92D3AB                               ;80AB4D|        |92D3AB; Compressed Location 1
    dw $3000                                                   ;80AB50|        |      ; Destination in VRAM 2
    dl sCompressedTilemap_938000                               ;80AB52|        |938000; Compressed Location 2
    dw $4000                                                   ;80AB55|        |      ; Destination in VRAM 3
    dl sCompressedTilemap_939E8E                               ;80AB57|        |939E8E; Compressed Location 3
    dw $6000                                                   ;80AB5A|        |      ; Destination in VRAM
    dl sCharactermap_A18000                                    ;80AB5C|        |A18000; Compressed Location
 
sFarmSummerMap:
    db $00                                                     ;80AB5F|        |      ;
    dw !AFLAGS_RAWCHARMAP|!AFLAGS_UNK0080|!AFLAGS_FOR0040|!AFLAGS_UNK0020                                                   
    db $04,$04,$03,$01                                         ;80AB62|        |      ;
    dw $0000,$0300,$0000,$0300,$2000                           ;80AB66|        |      ;
    dl sCompressedTilemap_92D3AB                               ;80AB70|        |92D3AB;
    dw $3000                                                   ;80AB73|        |      ;
    dl sCompressedTilemap_938000                               ;80AB75|        |938000;
    dw $4000                                                   ;80AB78|        |      ;
    dl sCompressedTilemap_939E8E                               ;80AB7A|        |939E8E;
    dw $6000                                                   ;80AB7D|        |      ;
    dl sCharactermap_A18000                                    ;80AB7F|        |A18000;
 
sFarmFallMap:
    db $00                                                     ;80AB82|        |      ;
    dw !AFLAGS_RAWCHARMAP|!AFLAGS_UNK0080|!AFLAGS_FOR0040|!AFLAGS_UNK0020                                                   
    db $04,$04,$03,$01                                         ;80AB85|        |      ;
    dw $0000,$0300,$0000,$0300,$2000                           ;80AB89|        |      ;
    dl sCompressedTilemap_9282CB                               ;80AB93|        |9282CB;
    dw $3000                                                   ;80AB96|        |      ;
    dl sCompressedTilemap_929D10                               ;80AB98|        |929D10;
    dw $4000                                                   ;80AB9B|        |      ;
    dl sCompressedTilemap_92BB03                               ;80AB9D|        |92BB03;
    dw $6000                                                   ;80ABA0|        |      ;
    dl sCharactermap_A18000                                    ;80ABA2|        |A18000;
 
sFarmWinterMap:
    db $00                                                     ;80ABA5|        |      ;
    dw !AFLAGS_RAWCHARMAP|!AFLAGS_UNK0080|!AFLAGS_FOR0040|!AFLAGS_UNK0020                                                   
    db $04,$04,$03,$01                                         ;80ABA8|        |      ;
    dw $0000,$0300,$0000,$0300,$2000                           ;80ABAC|        |      ;
    dl sCompressedTilemap_93B736                               ;80ABB6|        |93B736;
    dw $3000                                                   ;80ABB9|        |      ;
    dl sCompressedTilemap_93D049                               ;80ABBB|        |93D049;
    dw $4000                                                   ;80ABBE|        |      ;
    dl sCompressedTilemap_93E12B                               ;80ABC0|        |93E12B;
    dw $6000                                                   ;80ABC3|        |      ;
    dl sCharactermap_A18000                                    ;80ABC5|        |A18000;
 
sTownSpringMap:
    db $00                                                     ;80ABC8|        |      ;
    dw !AFLAGS_RAWCHARMAP|!AFLAGS_FOR0040|!AFLAGS_UNK0020                                                   
    db $04,$04,$03,$01                                         ;80ABCB|        |      ;
    dw $0000,$0200,$0000,$0300,$2000                           ;80ABCF|        |      ;
    dl sCompressedTilemap_97B45F                               ;80ABD9|        |97B45F;
    dw $3000                                                   ;80ABDC|        |      ;
    dl sCompressedTilemap_998000                               ;80ABDE|        |998000;
    dw $4000                                                   ;80ABE1|        |      ;
    dl sCompressedTilemap_999A74                               ;80ABE3|        |999A74;
    dw $6000                                                   ;80ABE6|        |      ;
    dl sCharactermap_A38000                                    ;80ABE8|        |A38000;
 
sTownSummerMap:
    db $00                                                     ;80ABEB|        |      ;
    dw !AFLAGS_RAWCHARMAP|!AFLAGS_FOR0040|!AFLAGS_UNK0020                                                   
    db $04,$04,$03,$01                                         ;80ABEE|        |      ;
    dw $0000,$0200,$0000,$0300,$2000                           ;80ABF2|        |      ;
    dl sCompressedTilemap_97B45F                               ;80ABFC|        |97B45F;
    dw $3000                                                   ;80ABFF|        |      ;
    dl sCompressedTilemap_97CD20                               ;80AC01|        |97CD20;
    dw $4000                                                   ;80AC04|        |      ;
    dl sCompressedTilemap_97E7A2                               ;80AC06|        |97E7A2;
    dw $6000                                                   ;80AC09|        |      ;
    dl sCharactermap_A38000                                    ;80AC0B|        |A38000;
 
sTownFallMap:
    db $00                                                     ;80AC0E|        |      ;
    dw !AFLAGS_RAWCHARMAP|!AFLAGS_FOR0040|!AFLAGS_UNK0020                                                   
    db $04,$04,$03,$01                                         ;80AC11|        |      ;
    dw $0000,$0200,$0000,$0300,$2000                           ;80AC15|        |      ;
    dl sCompressedTilemap_97B45F                               ;80AC1F|        |97B45F;
    dw $3000                                                   ;80AC22|        |      ;
    dl sCompressedTilemap_988000                               ;80AC24|        |988000;
    dw $4000                                                   ;80AC27|        |      ;
    dl sCompressedTilemap_989A52                               ;80AC29|        |989A52;
    dw $6000                                                   ;80AC2C|        |      ;
    dl sCharactermap_A38000                                    ;80AC2E|        |A38000;
 
sTownWinterMap:
    db $00                                                     ;80AC31|        |      ;
    dw !AFLAGS_RAWCHARMAP|!AFLAGS_FOR0040|!AFLAGS_UNK0020                                                   
    db $04,$04,$03,$01                                         ;80AC34|        |      ;
    dw $0000,$0200,$0000,$0300,$2000                           ;80AC38|        |      ;
    dl sCompressedTilemap_99DCBD                               ;80AC42|        |99DCBD;
    dw $3000                                                   ;80AC45|        |      ;
    dl sCompressedTilemap_9A8000                               ;80AC47|        |9A8000;
    dw $4000                                                   ;80AC4A|        |      ;
    dl sCompressedTilemap_9A9921                               ;80AC4C|        |9A9921;
    dw $6000                                                   ;80AC4F|        |      ;
    dl sCharactermap_A38000                                    ;80AC51|        |A38000;
 
sFlowerFestivalMap:
    db $00                                                     ;80AC54|        |      ;
    dw !AFLAGS_FOR0040|!AFLAGS_UNK0020                                                   
    db $02,$02,$03,$01                                         ;80AC57|        |      ;
    dw $0000,$0100,$0000,$0100,$2000                           ;80AC5B|        |      ;
    dl sCompressedTilemap_97B45F                               ;80AC65|        |97B45F;
    dw $3000                                                   ;80AC68|        |      ;
    dl sCompressedTilemap_998000                               ;80AC6A|        |998000;
    dw $4000                                                   ;80AC6D|        |      ;
    dl sCompressedTilemap_99AEC3                               ;80AC6F|        |99AEC3;
    dw $6000                                                   ;80AC72|        |      ;
    dl sCompressedCharactermap_A4D379                          ;80AC74|        |A4D379;
 
sHarvestFestivalMap:
    db $00                                                     ;80AC77|        |      ;
    dw !AFLAGS_FOR0040|!AFLAGS_UNK0020                                                   
    db $02,$02,$03,$01                                         ;80AC7A|        |      ;
    dw $0000,$0100,$0000,$0100,$2000                           ;80AC7E|        |      ;
    dl sCompressedTilemap_97B45F                               ;80AC88|        |97B45F;
    dw $3000                                                   ;80AC8B|        |      ;
    dl sCompressedTilemap_988000                               ;80AC8D|        |988000;
    dw $4000                                                   ;80AC90|        |      ;
    dl sCompressedTilemap_98AEDB                               ;80AC92|        |98AEDB;
    dw $6000                                                   ;80AC95|        |      ;
    dl sCompressedCharactermap_A4C5DE                          ;80AC97|        |A4C5DE;
 
sStarNightFestivalSquareMap:
    db $00                                                     ;80AC9A|        |      ;
    dw !AFLAGS_FOR0040|!AFLAGS_UNK0020                                                   
    db $02,$02,$03,$01                                         ;80AC9D|        |      ;
    dw $0000,$0100,$0000,$0100,$2000                           ;80ACA1|        |      ;
    dl sCompressedTilemap_99DCBD                               ;80ACAB|        |99DCBD;
    dw $3000                                                   ;80ACAE|        |      ;
    dl sCompressedTilemap_9A8000                               ;80ACB0|        |9A8000;
    dw $4000                                                   ;80ACB3|        |      ;
    dl sCompressedTilemap_9AAEAB                               ;80ACB5|        |9AAEAB;
    dw $6000                                                   ;80ACB8|        |      ;
    dl sCompressedCharactermap_A58327                          ;80ACBA|        |A58327;
 
sEggFestivalMap:
    db $00                                                     ;80ACBD|        |      ;
    dw !AFLAGS_FOR0040|!AFLAGS_UNK0020                                                   
    db $04,$04,$03,$01                                         ;80ACC0|        |      ;
    dw $0000,$0200,$0000,$0300,$2000                           ;80ACC4|        |      ;
    dl sCompressedTilemap_97B45F                               ;80ACCE|        |97B45F;
    dw $3000                                                   ;80ACD1|        |      ;
    dl sCompressedTilemap_988000                               ;80ACD3|        |988000;
    dw $4000                                                   ;80ACD6|        |      ;
    dl sCompressedTilemap_99C3F2                               ;80ACD8|        |99C3F2;
    dw $6000                                                   ;80ACDB|        |      ;
    dl sCompressedCharactermap_A4DC7E                          ;80ACDD|        |A4DC7E;
 
sRoadSpringMap:
    db $00                                                     ;80ACE0|        |      ;
    dw !AFLAGS_FOR0040|!AFLAGS_UNK0020                                                   
    db $01,$01,$01,$01                                         ;80ACE3|        |      ;
    dw $0000,$0000,$0000,$0000,$2000                           ;80ACE7|        |      ;
    dl sCompressedTilemap_98CC6B                               ;80ACF1|        |98CC6B;
    dw $6000                                                   ;80ACF4|        |      ;
    dl sCompressedCharactermap_A4CFAB                          ;80ACF6|        |A4CFAB;
 
sRoadSummerMap:
    db $00                                                     ;80ACF9|        |      ;
    dw !AFLAGS_FOR0040|!AFLAGS_UNK0020                                                   
    db $01,$01,$01,$01                                         ;80ACFC|        |      ;
    dw $0000,$0000,$0000,$0000,$2000                           ;80AD00|        |      ;
    dl sCompressedTilemap_98CC6B                               ;80AD0A|        |98CC6B;
    dw $6000                                                   ;80AD0D|        |      ;
    dl sCompressedCharactermap_A4CFAB                          ;80AD0F|        |A4CFAB;
 
sRoadFallMap:
    db $00                                                     ;80AD12|        |      ;
    dw !AFLAGS_FOR0040|!AFLAGS_UNK0020                                                   
    db $01,$01,$01,$01                                         ;80AD15|        |      ;
    dw $0000,$0000,$0000,$0000,$2000                           ;80AD19|        |      ;
    dl sCompressedTilemap_98CC6B                               ;80AD23|        |98CC6B;
    dw $6000                                                   ;80AD26|        |      ;
    dl sCompressedCharactermap_A4CFAB                          ;80AD28|        |A4CFAB;
 
sRoadWinterMap:
    db $00                                                     ;80AD2B|        |      ;
    dw !AFLAGS_FOR0040|!AFLAGS_UNK0020                                                   
    db $01,$01,$01,$01                                         ;80AD2E|        |      ;
    dw $0000,$0000,$0000,$0000,$2000                           ;80AD32|        |      ;
    dl sCompressedTilemap_98E41D                               ;80AD3C|        |98E41D;
    dw $6000                                                   ;80AD3F|        |      ;
    dl sCompressedCharactermap_A4CFAB                          ;80AD41|        |A4CFAB;
 
sMountainSpring:
    db $00                                                     ;80AD44|        |      ;
    dw !AFLAGS_RAWCHARMAP|!AFLAGS_UNK0080|!AFLAGS_FOR0040|!AFLAGS_UNK0020                                                   
    db $04,$04,$03,$01                                         ;80AD47|        |      ;
    dw $0000,$0200,$0000,$0200,$2000                           ;80AD4B|        |      ;
    dl sCompressedTilemap_9DE7CE                               ;80AD55|        |9DE7CE;
    dw $3000                                                   ;80AD58|        |      ;
    dl sCompressedTilemap_9E8000                               ;80AD5A|        |9E8000;
    dw $4000                                                   ;80AD5D|        |      ;
    dl sCompressedTilemap_9D8000                               ;80AD5F|        |9D8000;
    dw $6000                                                   ;80AD62|        |      ;
    dl sCharactermap_A28000                                    ;80AD64|        |A28000;
 
sMountainSummerMap:
    db $00                                                     ;80AD67|        |      ;
    dw !AFLAGS_RAWCHARMAP|!AFLAGS_UNK0080|!AFLAGS_FOR0040|!AFLAGS_UNK0020                                                   
    db $04,$04,$03,$01                                         ;80AD6A|        |      ;
    dw $0000,$0200,$0000,$0200,$2000                           ;80AD6E|        |      ;
    dl sCompressedTilemap_9CCBA3                               ;80AD78|        |9CCBA3;
    dw $3000                                                   ;80AD7B|        |      ;
    dl sCompressedTilemap_9CE37D                               ;80AD7D|        |9CE37D;
    dw $4000                                                   ;80AD80|        |      ;
    dl sCompressedTilemap_9D8000                               ;80AD82|        |9D8000;
    dw $6000                                                   ;80AD85|        |      ;
    dl sCharactermap_A28000                                    ;80AD87|        |A28000;
 
sMountainFallMap:
    db $00                                                     ;80AD8A|        |      ;
    dw !AFLAGS_RAWCHARMAP|!AFLAGS_UNK0080|!AFLAGS_FOR0040|!AFLAGS_UNK0020                                                   
    db $04,$04,$03,$01                                         ;80AD8D|        |      ;
    dw $0000,$0200,$0000,$0200,$2000                           ;80AD91|        |      ;
    dl sCompressedTilemap_9D991C                               ;80AD9B|        |9D991C;
    dw $3000                                                   ;80AD9E|        |      ;
    dl sCompressedTilemap_9DB15E                               ;80ADA0|        |9DB15E;
    dw $4000                                                   ;80ADA3|        |      ;
    dl sCompressedTilemap_9DCE31                               ;80ADA5|        |9DCE31;
    dw $6000                                                   ;80ADA8|        |      ;
    dl sCharactermap_A28000                                    ;80ADAA|        |A28000;
 
sMountainWinterMap:
    db $00                                                     ;80ADAD|        |      ;
    dw !AFLAGS_RAWCHARMAP|!AFLAGS_UNK0080|!AFLAGS_FOR0040|!AFLAGS_UNK0020                                                   
    db $04,$04,$03,$01                                         ;80ADB0|        |      ;
    dw $0000,$0200,$0000,$0200,$2000                           ;80ADB4|        |      ;
    dl sCompressedTilemap_9E9EDC                               ;80ADBE|        |9E9EDC;
    dw $3000                                                   ;80ADC1|        |      ;
    dl sCompressedTilemap_9EB75D                               ;80ADC3|        |9EB75D;
    dw $4000                                                   ;80ADC6|        |      ;
    dl sCompressedTilemap_9ED208                               ;80ADC8|        |9ED208;
    dw $6000                                                   ;80ADCB|        |      ;
    dl sCharactermap_A28000                                    ;80ADCD|        |A28000;
 
sStarNightFestivalSpaMap:
    db $00                                                     ;80ADD0|        |      ;
    dw !AFLAGS_UNK0080|!AFLAGS_FOR0040|!AFLAGS_UNK0020                                                   
    db $01,$01,$03,$01                                         ;80ADD3|        |      ;
    dw $0000,$0000,$0000,$0000,$2000                           ;80ADD7|        |      ;
    dl sCompressedTilemap_9E9EDC                               ;80ADE1|        |9E9EDC;
    dw $3000                                                   ;80ADE4|        |      ;
    dl sCompressedTilemap_9EB75D                               ;80ADE6|        |9EB75D;
    dw $4000                                                   ;80ADE9|        |      ;
    dl sCompressedTilemap_9ED208                               ;80ADEB|        |9ED208;
    dw $6000                                                   ;80ADEE|        |      ;
    dl sCompressedCharactermap_A59E0B                          ;80ADF0|        |A59E0B;
 
sHouseMap:
    db $00                                                     ;80ADF3|        |      ;
    dw !AFLAGS_NONE                                                   
    db $01,$01,$02,$01                                         ;80ADF6|        |      ;
    dw $0000,$0000,$0000,$0000,$2000                           ;80ADFA|        |      ;
    dl sCompressedTilemap_95C000                               ;80AE04|        |95C000;
    dw $3000                                                   ;80AE07|        |      ;
    dl sCompressedTilemap_95D6E2                               ;80AE09|        |95D6E2;
    dw $6000                                                   ;80AE0C|        |      ;
    dl sCompressedCharactermap_A49B84                          ;80AE0E|        |A49B84;
 
sHouseUpgrade1Map:
    db $00                                                     ;80AE11|        |      ;
    dw !AFLAGS_NONE                                                   
    db $01,$01,$02,$01                                         ;80AE14|        |      ;
    dw $0000,$0000,$0000,$0000,$2000                           ;80AE18|        |      ;
    dl sCompressedTilemap_95C000                               ;80AE22|        |95C000;
    dw $3000                                                   ;80AE25|        |      ;
    dl sCompressedTilemap_95D6E2                               ;80AE27|        |95D6E2;
    dw $6000                                                   ;80AE2A|        |      ;
    dl sCompressedCharactermap_A4945C                          ;80AE2C|        |A4945C;
 
sHouseUpgrade2Map:
    db $00                                                     ;80AE2F|        |      ;
    dw !AFLAGS_NONE                                                   
    db $02,$01,$02,$01                                         ;80AE32|        |      ;
    dw $0000,$00A0,$0000,$0000,$2000                           ;80AE36|        |      ;
    dl sCompressedTilemap_95C000                               ;80AE40|        |95C000;
    dw $3000                                                   ;80AE43|        |      ;
    dl sCompressedTilemap_95D6E2                               ;80AE45|        |95D6E2;
    dw $6000                                                   ;80AE48|        |      ;
    dl sCompressedCharactermap_A49745                          ;80AE4A|        |A49745;
 
sMayorHouseMap:
    db $00                                                     ;80AE4D|        |      ;
    dw !AFLAGS_NONE                                                   
    db $02,$02,$01,$01                                         ;80AE50|        |      ;
    dw $0010,$00C0,$0000,$0000,$2000                           ;80AE54|        |      ;
    dl sCompressedTilemap_95E8A3                               ;80AE5E|        |95E8A3;
    dw $6000                                                   ;80AE61|        |      ;
    dl sCompressedCharactermap_A49E2E                          ;80AE63|        |A49E2E;
 
sMayorHouseHallMap:
    db $00                                                     ;80AE66|        |      ;
    dw !AFLAGS_NONE                                                   
    db $02,$02,$01,$01                                         ;80AE69|        |      ;
    dw $0100,$0100,$0100,$0100,$2000                           ;80AE6D|        |      ;
    dl sCompressedTilemap_95E8A3                               ;80AE77|        |95E8A3;
    dw $6000                                                   ;80AE7A|        |      ;
    dl sCompressedCharactermap_A49E2E                          ;80AE7C|        |A49E2E;
 
sMayorHouseMariaRoomMap:
    db $00                                                     ;80AE7F|        |      ;
    dw !AFLAGS_NONE                                                   
    db $02,$02,$01,$01                                         ;80AE82|        |      ;
    dw $0000,$0000,$0100,$0100,$2000                           ;80AE86|        |      ;
    dl sCompressedTilemap_95E8A3                               ;80AE90|        |95E8A3;
    dw $6000                                                   ;80AE93|        |      ;
    dl sCompressedCharactermap_A49E2E                          ;80AE95|        |A49E2E;
 
sChurchMap:
    db $00                                                     ;80AE98|        |      ;
    dw !AFLAGS_NONE                                                   
    db $01,$02,$01,$01                                         ;80AE9B|        |      ;
    dw $0000,$0000,$0000,$0100,$2000                           ;80AE9F|        |      ;
    dl sCompressedTilemap_968000                               ;80AEA9|        |968000;
    dw $6000                                                   ;80AEAC|        |      ;
    dl sCompressedCharactermap_A4A597                          ;80AEAE|        |A4A597;
 
sFlowerShopMap:
    db $00                                                     ;80AEB1|        |      ;
    dw !AFLAGS_NONE                                                   
    db $01,$02,$01,$01                                         ;80AEB4|        |      ;
    dw $0000,$0000,$0100,$0100,$3000                           ;80AEB8|        |      ;
    dl sCompressedTilemap_969437                               ;80AEC2|        |969437;
    dw $6000                                                   ;80AEC5|        |      ;
    dl sCompressedCharactermap_A4AA99                          ;80AEC7|        |A4AA99;
 
sFlowerShopRoomMap:
    db $00                                                     ;80AECA|        |      ;
    dw !AFLAGS_NONE                                                   
    db $01,$02,$01,$01                                         ;80AECD|        |      ;
    dw $0000,$0000,$0000,$0000,$3000                           ;80AED1|        |      ;
    dl sCompressedTilemap_969437                               ;80AEDB|        |969437;
    dw $6000                                                   ;80AEDE|        |      ;
    dl sCompressedCharactermap_A4AA99                          ;80AEE0|        |A4AA99;
 
sBarMap:
    db $00                                                     ;80AEE3|        |      ;
    dw !AFLAGS_NONE                                                   
    db $01,$02,$01,$01                                         ;80AEE6|        |      ;
    dw $0000,$0000,$0100,$0100,$3000                           ;80AEEA|        |      ;
    dl sCompressedTilemap_96AD11                               ;80AEF4|        |96AD11;
    dw $6000                                                   ;80AEF7|        |      ;
    dl sCompressedCharactermap_A4AE95                          ;80AEF9|        |A4AE95;
 
sBarRoomMap:
    db $00                                                     ;80AEFC|        |      ;
    dw !AFLAGS_NONE                                                   
    db $01,$02,$01,$01                                         ;80AEFF|        |      ;
    dw $0000,$0000,$0000,$0000,$3000                           ;80AF03|        |      ;
    dl sCompressedTilemap_96AD11                               ;80AF0D|        |96AD11;
    dw $6000                                                   ;80AF10|        |      ;
    dl sCompressedCharactermap_A4AE95                          ;80AF12|        |A4AE95;
 
sRestaurantMap:
    db $00                                                     ;80AF15|        |      ;
    dw !AFLAGS_NONE                                                   
    db $01,$02,$01,$01                                         ;80AF18|        |      ;
    dw $0000,$0000,$0100,$0100,$3000                           ;80AF1C|        |      ;
    dl sCompressedTilemap_96C489                               ;80AF26|        |96C489;
    dw $6000                                                   ;80AF29|        |      ;
    dl sCompressedCharactermap_A4B3D1                          ;80AF2B|        |A4B3D1;
 
sRestaurantRoomMap:
    db $00                                                     ;80AF2E|        |      ;
    dw !AFLAGS_NONE                                                   
    db $01,$02,$01,$01                                         ;80AF31|        |      ;
    dw $0000,$0000,$0000,$0000,$3000                           ;80AF35|        |      ;
    dl sCompressedTilemap_96C489                               ;80AF3F|        |96C489;
    dw $6000                                                   ;80AF42|        |      ;
    dl sCompressedCharactermap_A4B3D1                          ;80AF44|        |A4B3D1;
 
sGeneralStoreMap:
    db $00                                                     ;80AF47|        |      ;
    dw !AFLAGS_NONE                                                   
    db $01,$02,$01,$01                                         ;80AF4A|        |      ;
    dw $0000,$0000,$0100,$0100,$3000                           ;80AF4E|        |      ;
    dl sCompressedTilemap_96DC6D                               ;80AF58|        |96DC6D;
    dw $6000                                                   ;80AF5B|        |      ;
    dl sCompressedCharactermap_A4B8E0                          ;80AF5D|        |A4B8E0;
 
sGeneralStoreRoomMap:
    db $00                                                     ;80AF60|        |      ;
    dw !AFLAGS_NONE                                                   
    db $01,$02,$01,$01                                         ;80AF63|        |      ;
    dw $0000,$0000,$0000,$0000,$3000                           ;80AF67|        |      ;
    dl sCompressedTilemap_96DC6D                               ;80AF71|        |96DC6D;
    dw $6000                                                   ;80AF74|        |      ;
    dl sCompressedCharactermap_A4B8E0                          ;80AF76|        |A4B8E0;
 
sAnimalShopMap:
    db $00                                                     ;80AF79|        |      ;
    dw !AFLAGS_NONE                                                   
    db $01,$01,$01,$01                                         ;80AF7C|        |      ;
    dw $0000,$0000,$0000,$0000,$3000                           ;80AF80|        |      ;
    dl sCompressedTilemap_978000                               ;80AF8A|        |978000;
    dw $6000                                                   ;80AF8D|        |      ;
    dl sCompressedCharactermap_A4BCC1                          ;80AF8F|        |A4BCC1;
 
sFortuneTellerHouseMap:
    db $00                                                     ;80AF92|        |      ;
    dw !AFLAGS_NONE                                                   
    db $01,$01,$01,$01                                         ;80AF95|        |      ;
    dw $0000,$0000,$0000,$0000,$3000                           ;80AF99|        |      ;
    dl sCompressedTilemap_979A88                               ;80AFA3|        |979A88;
    dw $6000                                                   ;80AFA6|        |      ;
    dl sCompressedCharactermap_A4C065                          ;80AFA8|        |A4C065;
 
sToolShedMap:
    db $02                                                     ;80AFAB|        |      ;
    dw !AFLAGS_NONE                                                   
    db $01,$01,$02,$02                                         ;80AFAE|        |      ;
    dw $0000,$0000,$0000,$0000,$2000                           ;80AFB2|        |      ;
    dl sCompressedTilemap_9AE02D                               ;80AFBC|        |9AE02D;
    dw $3000                                                   ;80AFBF|        |      ;
    dl sCompressedTilemap_9B8000                               ;80AFC1|        |9B8000;
    dw $7000                                                   ;80AFC4|        |      ;
    dl sCompressedCharactermap_A59C08                          ;80AFC6|        |A59C08;
    dw $6000                                                   ;80AFC9|        |      ;
    dl sCompressedCharactermap_A58B49                          ;80AFCB|        |A58B49;
 
sBarnMap:
    db $00                                                     ;80AFCE|        |      ;
    dw !AFLAGS_NONE                                                   
    db $01,$02,$01,$01                                         ;80AFD1|        |      ;
    dw $0000,$0000,$0000,$00A0,$2000                           ;80AFD5|        |      ;
    dl sCompressedTilemap_9CA40C                               ;80AFDF|        |9CA40C;
    dw $6000                                                   ;80AFE2|        |      ;
    dl sCompressedCharactermap_A5C4CD                          ;80AFE4|        |A5C4CD;
 
sCoopMap:
    db $00                                                     ;80AFE7|        |      ;
    dw !AFLAGS_NONE                                                   
    db $01,$01,$01,$01                                         ;80AFEA|        |      ;
    dw $0000,$0000,$0000,$0000,$2000                           ;80AFEE|        |      ;
    dl sCompressedTilemap_9CA40C                               ;80AFF8|        |9CA40C;
    dw $6000                                                   ;80AFFB|        |      ;
    dl sCompressedCharactermap_A5C258                          ;80AFFD|        |A5C258;
 
sMountainCaveMap:
    db $00                                                     ;80B000|        |      ;
    dw !AFLAGS_UNK0020                                                   
    db $02,$02,$01,$01                                         ;80B003|        |      ;
    dw $0000,$0100,$0000,$0100,$2000                           ;80B007|        |      ;
    dl sCompressedTilemap_948000                               ;80B011|        |948000;
    dw $6000                                                   ;80B014|        |      ;
    dl sCompressedCharactermap_A48A2D                          ;80B016|        |A48A2D;
 
sElfTunnelMap:
    db $00                                                     ;80B019|        |      ;
    dw !AFLAGS_UNK0020                                                   
    db $01,$03,$01,$01                                         ;80B01C|        |      ;
    dw $0000,$0000,$0000,$0200,$2000                           ;80B020|        |      ;
    dl sCompressedTilemap_948000                               ;80B02A|        |948000;
    dw $6000                                                   ;80B02D|        |      ;
    dl sCompressedCharactermap_A481AE                          ;80B02F|        |A481AE;
 
sMap_80B032:
    db $00                                                     ;80B032|        |      ;
    dw !AFLAGS_NONE                                                   
    db $01,$01,$01,$01                                         ;80B035|        |      ;
    dw $0000,$0000,$0000,$0000,$2000                           ;80B039|        |      ;
    dl sCompressedTilemap_9B9F53                               ;80B043|        |9B9F53;
    dw $6000                                                   ;80B046|        |      ;
    dl sCompressedCharactermap_A5B63B                          ;80B048|        |A5B63B;
 
sMap_80B04B:
    db $00                                                     ;80B04B|        |      ;
    dw !AFLAGS_NONE                                                   
    db $01,$03,$01,$01                                         ;80B04E|        |      ;
    dw $0000,$0000,$0000,$0200,$2000                           ;80B052|        |      ;
    dl sCompressedTilemap_9B86AD                               ;80B05C|        |9B86AD;
    dw $6000                                                   ;80B05F|        |      ;
    dl sCompressedCharactermap_A5A6A0                          ;80B061|        |A5A6A0;
 
sMap_80B064:
    db $00                                                     ;80B064|        |      ;
    dw !AFLAGS_NONE                                                   
    db $01,$02,$03,$01                                         ;80B067|        |      ;
    dw $0000,$0000,$0000,$0100,$2000                           ;80B06B|        |      ;
    dl sCompressedTilemap_97B45F                               ;80B075|        |97B45F;
    dw $3000                                                   ;80B078|        |      ;
    dl sCompressedTilemap_998000                               ;80B07A|        |998000;
    dw $4000                                                   ;80B07D|        |      ;
    dl sCompressedTilemap_999A74                               ;80B07F|        |999A74;
    dw $6000                                                   ;80B082|        |      ;
    dl sCharactermap_A38000                                    ;80B084|        |A38000;
 
sMap_80B087:
    db $00                                                     ;80B087|        |      ;
    dw !AFLAGS_NONE                                                   
    db $01,$02,$03,$01                                         ;80B08A|        |      ;
    dw $0000,$0000,$0000,$0100,$2000                           ;80B08E|        |      ;
    dl sCompressedTilemap_97B45F                               ;80B098|        |97B45F;
    dw $3000                                                   ;80B09B|        |      ;
    dl sCompressedTilemap_97CD20                               ;80B09D|        |97CD20;
    dw $4000                                                   ;80B0A0|        |      ;
    dl sCompressedTilemap_97E7A2                               ;80B0A2|        |97E7A2;
    dw $6000                                                   ;80B0A5|        |      ;
    dl sCharactermap_A38000                                    ;80B0A7|        |A38000;
 
sMap_80B0AA:
    db $00                                                     ;80B0AA|        |      ;
    dw !AFLAGS_NONE                                                   
    db $01,$02,$03,$01                                         ;80B0AD|        |      ;
    dw $0000,$0000,$0000,$0100,$2000                           ;80B0B1|        |      ;
    dl sCompressedTilemap_97B45F                               ;80B0BB|        |97B45F;
    dw $3000                                                   ;80B0BE|        |      ;
    dl sCompressedTilemap_988000                               ;80B0C0|        |988000;
    dw $4000                                                   ;80B0C3|        |      ;
    dl sCompressedTilemap_989A52                               ;80B0C5|        |989A52;
    dw $6000                                                   ;80B0C8|        |      ;
    dl sCharactermap_A38000                                    ;80B0CA|        |A38000;
 
sMap_80B0CD:
    db $00                                                     ;80B0CD|        |      ;
    dw !AFLAGS_NONE                                                   
    db $01,$02,$03,$01                                         ;80B0D0|        |      ;
    dw $0000,$0000,$0000,$0100,$2000                           ;80B0D4|        |      ;
    dl sCompressedTilemap_99DCBD                               ;80B0DE|        |99DCBD;
    dw $3000                                                   ;80B0E1|        |      ;
    dl sCompressedTilemap_9A8000                               ;80B0E3|        |9A8000;
    dw $4000                                                   ;80B0E6|        |      ;
    dl sCompressedTilemap_9A9921                               ;80B0E8|        |9A9921;
    dw $6000                                                   ;80B0EB|        |      ;
    dl sCharactermap_A38000                                    ;80B0ED|        |A38000;
 
sSummitSpringMap:
    db $01                                                     ;80B0F0|        |      ;
    dw !AFLAGS_UNK0020                                                   
    db $01,$02,$02,$02                                         ;80B0F3|        |      ;
    dw $0000,$0000,$0000,$0100,$2000                           ;80B0F7|        |      ;
    dl sCompressedTilemap_9BB76D                               ;80B101|        |9BB76D;
    dw $3000                                                   ;80B104|        |      ;
    dl sCompressedTilemap_9C8000                               ;80B106|        |9C8000;
    dw $6000                                                   ;80B109|        |      ;
    dl sCompressedCharactermap_A5B943                          ;80B10B|        |A5B943;
    dw $7000                                                   ;80B10E|        |      ;
    dl sCompressedCharactermap_A5AD17                          ;80B110|        |A5AD17;
 
sSummitSummerMap:
    db $01                                                     ;80B113|        |      ;
    dw !AFLAGS_UNK0020                                                   
    db $01,$02,$02,$02                                         ;80B116|        |      ;
    dw $0000,$0000,$0000,$0100,$2000                           ;80B11A|        |      ;
    dl sCompressedTilemap_9BB76D                               ;80B124|        |9BB76D;
    dw $3000                                                   ;80B127|        |      ;
    dl sCompressedTilemap_9C8000                               ;80B129|        |9C8000;
    dw $6000                                                   ;80B12C|        |      ;
    dl sCompressedCharactermap_A5B943                          ;80B12E|        |A5B943;
    dw $7000                                                   ;80B131|        |      ;
    dl sCompressedCharactermap_A5AD17                          ;80B133|        |A5AD17;
 
sSummitFallMap:
    db $01                                                     ;80B136|        |      ;
    dw !AFLAGS_UNK0020                                                   
    db $01,$02,$02,$02                                         ;80B139|        |      ;
    dw $0000,$0000,$0000,$0100,$2000                           ;80B13D|        |      ;
    dl sCompressedTilemap_9BB76D                               ;80B147|        |9BB76D;
    dw $3000                                                   ;80B14A|        |      ;
    dl sCompressedTilemap_9C8000                               ;80B14C|        |9C8000;
    dw $6000                                                   ;80B14F|        |      ;
    dl sCompressedCharactermap_A5B943                          ;80B151|        |A5B943;
    dw $7000                                                   ;80B154|        |      ;
    dl sCompressedCharactermap_A5AD17                          ;80B156|        |A5AD17;
 
sSummitWinterMap:
    db $01                                                     ;80B159|        |      ;
    dw !AFLAGS_UNK0020                                                   
    db $01,$02,$02,$02                                         ;80B15C|        |      ;
    dw $0000,$0000,$0000,$0100,$2000                           ;80B160|        |      ;
    dl sCompressedTilemap_9BCF8F                               ;80B16A|        |9BCF8F;
    dw $3000                                                   ;80B16D|        |      ;
    dl sCompressedTilemap_9C965F                               ;80B16F|        |9C965F;
    dw $6000                                                   ;80B172|        |      ;
    dl sCompressedCharactermap_A5B943                          ;80B174|        |A5B943;
    dw $7000                                                   ;80B177|        |      ;
    dl sCompressedCharactermap_A5AD17                          ;80B179|        |A5AD17;
 
sMap_80B17C:
    db $01                                                     ;80B17C|        |      ;
    dw !AFLAGS_UNK0020                                                   
    db $01,$02,$02,$02                                         ;80B17F|        |      ;
    dw $0000,$0000,$0000,$0100,$2000                           ;80B183|        |      ;
    dl sCompressedTilemap_9BB76D                               ;80B18D|        |9BB76D;
    dw $3000                                                   ;80B190|        |      ;
    dl sCompressedTilemap_9C8000                               ;80B192|        |9C8000;
    dw $6000                                                   ;80B195|        |      ;
    dl sCompressedCharactermap_A5B943                          ;80B197|        |A5B943;
    dw $7000                                                   ;80B19A|        |      ;
    dl sCompressedCharactermap_A5B042                          ;80B19C|        |A5B042;
 
sMap_80B19F:
    db $01                                                     ;80B19F|        |      ;
    dw !AFLAGS_UNK0020                                                   
    db $01,$02,$02,$02                                         ;80B1A2|        |      ;
    dw $0000,$0000,$0000,$0100,$2000                           ;80B1A6|        |      ;
    dl sCompressedTilemap_9BB76D                               ;80B1B0|        |9BB76D;
    dw $3000                                                   ;80B1B3|        |      ;
    dl sCompressedTilemap_9C8000                               ;80B1B5|        |9C8000;
    dw $6000                                                   ;80B1B8|        |      ;
    dl sCompressedCharactermap_A5B943                          ;80B1BA|        |A5B943;
    dw $7000                                                   ;80B1BD|        |      ;
    dl sCompressedCharactermap_A5B042                          ;80B1BF|        |A5B042;
 
sMap_80B1C2:
    db $01                                                     ;80B1C2|        |      ;
    dw !AFLAGS_UNK0020                                                   
    db $01,$02,$02,$02                                         ;80B1C5|        |      ;
    dw $0000,$0000,$0000,$0100,$2000                           ;80B1C9|        |      ;
    dl sCompressedTilemap_9BB76D                               ;80B1D3|        |9BB76D;
    dw $3000                                                   ;80B1D6|        |      ;
    dl sCompressedTilemap_9C8000                               ;80B1D8|        |9C8000;
    dw $7000                                                   ;80B1DB|        |      ;
    dl sCompressedCharactermap_A5B042                          ;80B1DD|        |A5B042;
    dw $6000                                                   ;80B1E0|        |      ;
    dl sCompressedCharactermap_A5B943                          ;80B1E2|        |A5B943;
 
sMap_80B1E5:
    db $01                                                     ;80B1E5|        |      ;
    dw !AFLAGS_UNK0020                                                   
    db $01,$02,$02,$02                                         ;80B1E8|        |      ;
    dw $0000,$0000,$0000,$0100,$2000                           ;80B1EC|        |      ;
    dl sCompressedTilemap_9BCF8F                               ;80B1F6|        |9BCF8F;
    dw $3000                                                   ;80B1F9|        |      ;
    dl sCompressedTilemap_9C965F                               ;80B1FB|        |9C965F;
    dw $6000                                                   ;80B1FE|        |      ;
    dl sCompressedCharactermap_A5B943                          ;80B200|        |A5B943;
    dw $7000                                                   ;80B203|        |      ;
    dl sCompressedCharactermap_A5B042                          ;80B205|        |A5B042;
 
sStarNightFestivalMountainTopMap:
    db $01                                                     ;80B208|        |      ;
    dw !AFLAGS_UNK0020                                                   
    db $01,$02,$02,$02                                         ;80B20B|        |      ;
    dw $0000,$0000,$0000,$0100,$2000                           ;80B20F|        |      ;
    dl sCompressedTilemap_9BCF8F                               ;80B219|        |9BCF8F;
    dw $3000                                                   ;80B21C|        |      ;
    dl sCompressedTilemap_9C965F                               ;80B21E|        |9C965F;
    dw $6000                                                   ;80B221|        |      ;
    dl sCompressedCharactermap_A5B943                          ;80B223|        |A5B943;
    dw $7000                                                   ;80B226|        |      ;
    dl sCompressedCharactermap_A5B361                          ;80B228|        |A5B361;
 
sNewYearsFestivalMap:
    db $01                                                     ;80B22B|        |      ;
    dw !AFLAGS_UNK0020                                                   
    db $01,$02,$02,$02                                         ;80B22E|        |      ;
    dw $0000,$0000,$0000,$0100,$2000                           ;80B232|        |      ;
    dl sCompressedTilemap_9BB76D                               ;80B23C|        |9BB76D;
    dw $3000                                                   ;80B23F|        |      ;
    dl sCompressedTilemap_9C8000                               ;80B241|        |9C8000;
    dw $6000                                                   ;80B244|        |      ;
    dl sCompressedCharactermap_A5B943                          ;80B246|        |A5B943;
    dw $7000                                                   ;80B249|        |      ;
    dl sCompressedCharactermap_A5AD17                          ;80B24B|        |A5AD17;
 
sMap_80B24E:
    db $01                                                     ;80B24E|        |      ;
    dw !AFLAGS_UNK0020                                                   
    db $01,$02,$02,$02                                         ;80B251|        |      ;
    dw $0000,$0000,$0000,$0100,$2000                           ;80B255|        |      ;
    dl sCompressedTilemap_9BB76D                               ;80B25F|        |9BB76D;
    dw $3000                                                   ;80B262|        |      ;
    dl sCompressedTilemap_9C8000                               ;80B264|        |9C8000;
    dw $6000                                                   ;80B267|        |      ;
    dl sCompressedTilemap_A5BD8A                               ;80B269|        |A5BD8A;
    dw $7000                                                   ;80B26C|        |      ;
    dl sCompressedCharactermap_A5AD17                          ;80B26E|        |A5AD17;
 
sMap_80B271:
    db $00                                                     ;80B271|        |      ;
    dw !AFLAGS_NONE                                                   
    db $01,$01,$01,$01                                         ;80B274|        |      ;
    dw $0000,$0000,$0000,$0000,$2000                           ;80B278|        |      ;
    dl sCompressedTilemap_98CC6B                               ;80B282|        |98CC6B;
    dw $6000                                                   ;80B285|        |      ;
    dl sCompressedCharactermap_A68DCF                          ;80B287|        |A68DCF;
 
sMap_80B28A:
    db $00                                                     ;80B28A|        |      ;
    dw !AFLAGS_NONE                                                   
    db $01,$01,$03,$01                                         ;80B28D|        |      ;
    dw $0000,$0000,$0000,$0000,$2000                           ;80B291|        |      ;
    dl sCompressedTilemap_92D3AB                               ;80B29B|        |92D3AB;
    dw $3000                                                   ;80B29E|        |      ;
    dl sCompressedTilemap_938000                               ;80B2A0|        |938000;
    dw $4000                                                   ;80B2A3|        |      ;
    dl sCompressedTilemap_939E8E                               ;80B2A5|        |939E8E;
    dw $6000                                                   ;80B2A8|        |      ;
    dl sCompressedCharactermap_A5E253                          ;80B2AA|        |A5E253;
 
sMap_80B2AD:
    db $00                                                     ;80B2AD|        |      ;
    dw !AFLAGS_NONE                                                   
    db $01,$01,$03,$01                                         ;80B2B0|        |      ;
    dw $0000,$0000,$0000,$0000,$2000                           ;80B2B4|        |      ;
    dl sCompressedTilemap_92D3AB                               ;80B2BE|        |92D3AB;
    dw $3000                                                   ;80B2C1|        |      ;
    dl sCompressedTilemap_938000                               ;80B2C3|        |938000;
    dw $4000                                                   ;80B2C6|        |      ;
    dl sCompressedTilemap_939E8E                               ;80B2C8|        |939E8E;
    dw $6000                                                   ;80B2CB|        |      ;
    dl sCompressedCharactermap_A5E5CE                          ;80B2CD|        |A5E5CE;
 
sMap_80B2D0:
    db $00                                                     ;80B2D0|        |      ;
    dw !AFLAGS_NONE                                                   
    db $01,$01,$03,$01                                         ;80B2D3|        |      ;
    dw $0000,$0000,$0000,$0000,$2000                           ;80B2D7|        |      ;
    dl sCompressedTilemap_92D3AB                               ;80B2E1|        |92D3AB;
    dw $3000                                                   ;80B2E4|        |      ;
    dl sCompressedTilemap_938000                               ;80B2E6|        |938000;
    dw $4000                                                   ;80B2E9|        |      ;
    dl sCompressedTilemap_939E8E                               ;80B2EB|        |939E8E;
    dw $6000                                                   ;80B2EE|        |      ;
    dl sCompressedCharactermap_A5E977                          ;80B2F0|        |A5E977;
 
sMap_80B2F3:
    db $00                                                     ;80B2F3|        |      ;
    dw !AFLAGS_NONE                                                   
    db $01,$01,$03,$01                                         ;80B2F6|        |      ;
    dw $0000,$0000,$0000,$0000,$2000                           ;80B2FA|        |      ;
    dl sCompressedTilemap_92D3AB                               ;80B304|        |92D3AB;
    dw $3000                                                   ;80B307|        |      ;
    dl sCompressedTilemap_938000                               ;80B309|        |938000;
    dw $4000                                                   ;80B30C|        |      ;
    dl sCompressedTilemap_939E8E                               ;80B30E|        |939E8E;
    dw $6000                                                   ;80B311|        |      ;
    dl sCompressedCharactermap_A5ECFB                          ;80B313|        |A5ECFB;
 
sMap_80B316:
    db $00                                                     ;80B316|        |      ;
    dw !AFLAGS_NONE                                                   
    db $01,$01,$03,$01                                         ;80B319|        |      ;
    dw $0000,$0000,$0000,$0000,$2000                           ;80B31D|        |      ;
    dl sCompressedTilemap_92D3AB                               ;80B327|        |92D3AB;
    dw $3000                                                   ;80B32A|        |      ;
    dl sCompressedTilemap_938000                               ;80B32C|        |938000;
    dw $4000                                                   ;80B32F|        |      ;
    dl sCompressedTilemap_939E8E                               ;80B331|        |939E8E;
    dw $6000                                                   ;80B334|        |      ;
    dl sCompressedCharactermap_A5F671                          ;80B336|        |A5F671;
 
sMap_80B339:
    db $00                                                     ;80B339|        |      ;
    dw !AFLAGS_NONE                                                   
    db $01,$01,$03,$01                                         ;80B33C|        |      ;
    dw $0000,$0000,$0000,$0000,$2000                           ;80B340|        |      ;
    dl sCompressedTilemap_97B45F                               ;80B34A|        |97B45F;
    dw $3000                                                   ;80B34D|        |      ;
    dl sCompressedTilemap_97CD20                               ;80B34F|        |97CD20;
    dw $4000                                                   ;80B352|        |      ;
    dl sCompressedTilemap_97E7A2                               ;80B354|        |97E7A2;
    dw $6000                                                   ;80B357|        |      ;
    dl sCompressedCharactermap_A5F95C                          ;80B359|        |A5F95C;
 
sMap_80B35C:
    db $00                                                     ;80B35C|        |      ;
    dw !AFLAGS_NONE                                                   
    db $01,$01,$03,$01                                         ;80B35F|        |      ;
    dw $0000,$0000,$0000,$0000,$2000                           ;80B363|        |      ;
    dl sCompressedTilemap_92D3AB                               ;80B36D|        |92D3AB;
    dw $3000                                                   ;80B370|        |      ;
    dl sCompressedTilemap_938000                               ;80B372|        |938000;
    dw $4000                                                   ;80B375|        |      ;
    dl sCompressedTilemap_939E8E                               ;80B377|        |939E8E;
    dw $6000                                                   ;80B37A|        |      ;
    dl sCompressedCharactermap_A5FBCE                          ;80B37C|        |A5FBCE;
 
sMap_80B37F:
    db $00                                                     ;80B37F|        |      ;
    dw !AFLAGS_NONE                                                   
    db $01,$01,$03,$01                                         ;80B382|        |      ;
    dw $0000,$0000,$0000,$0000,$2000                           ;80B386|        |      ;
    dl sCompressedTilemap_92D3AB                               ;80B390|        |92D3AB;
    dw $3000                                                   ;80B393|        |      ;
    dl sCompressedTilemap_938000                               ;80B395|        |938000;
    dw $4000                                                   ;80B398|        |      ;
    dl sCompressedTilemap_939E8E                               ;80B39A|        |939E8E;
    dw $6000                                                   ;80B39D|        |      ;
    dl sCompressedCharactermap_A68000                          ;80B39F|        |A68000;
 
sMap_80B3A2:
    db $00                                                     ;80B3A2|        |      ;
    dw !AFLAGS_NONE                                                   
    db $01,$01,$03,$01                                         ;80B3A5|        |      ;
    dw $0000,$0000,$0000,$0000,$2000                           ;80B3A9|        |      ;
    dl sCompressedTilemap_92D3AB                               ;80B3B3|        |92D3AB;
    dw $3000                                                   ;80B3B6|        |      ;
    dl sCompressedTilemap_938000                               ;80B3B8|        |938000;
    dw $4000                                                   ;80B3BB|        |      ;
    dl sCompressedTilemap_939E8E                               ;80B3BD|        |939E8E;
    dw $6000                                                   ;80B3C0|        |      ;
    dl sCompressedCharactermap_A68229                          ;80B3C2|        |A68229;
 
sMap_80B3C5:
    db $00                                                     ;80B3C5|        |      ;
    dw !AFLAGS_NONE                                                   
    db $01,$01,$03,$01                                         ;80B3C8|        |      ;
    dw $0000,$0000,$0000,$0000,$2000                           ;80B3CC|        |      ;
    dl sCompressedTilemap_92D3AB                               ;80B3D6|        |92D3AB;
    dw $3000                                                   ;80B3D9|        |      ;
    dl sCompressedTilemap_938000                               ;80B3DB|        |938000;
    dw $4000                                                   ;80B3DE|        |      ;
    dl sCompressedTilemap_939E8E                               ;80B3E0|        |939E8E;
    dw $6000                                                   ;80B3E3|        |      ;
    dl sCompressedCharactermap_A68433                          ;80B3E5|        |A68433;
 
sMap_80B3E8:
    db $00                                                     ;80B3E8|        |      ;
    dw !AFLAGS_NONE                                                   
    db $01,$01,$03,$01                                         ;80B3EB|        |      ;
    dw $0000,$0000,$0000,$0000,$2000                           ;80B3EF|        |      ;
    dl sCompressedTilemap_92D3AB                               ;80B3F9|        |92D3AB;
    dw $3000                                                   ;80B3FC|        |      ;
    dl sCompressedTilemap_938000                               ;80B3FE|        |938000;
    dw $4000                                                   ;80B401|        |      ;
    dl sCompressedTilemap_939E8E                               ;80B403|        |939E8E;
    dw $6000                                                   ;80B406|        |      ;
    dl sCompressedCharactermap_A6867E                          ;80B408|        |A6867E;
 
sMap_80B40B:
    db $00                                                     ;80B40B|        |      ;
    dw !AFLAGS_NONE                                                   
    db $01,$01,$03,$01                                         ;80B40E|        |      ;
    dw $0000,$0000,$0000,$0000,$2000                           ;80B412|        |      ;
    dl sCompressedTilemap_9CCBA3                               ;80B41C|        |9CCBA3;
    dw $3000                                                   ;80B41F|        |      ;
    dl sCompressedTilemap_9CE37D                               ;80B421|        |9CE37D;
    dw $4000                                                   ;80B424|        |      ;
    dl sCompressedTilemap_9D8000                               ;80B426|        |9D8000;
    dw $6000                                                   ;80B429|        |      ;
    dl sCompressedCharactermap_A68864                          ;80B42B|        |A68864;
 
sMap_80B42E:
    db $00                                                     ;80B42E|        |      ;
    dw !AFLAGS_NONE                                                   
    db $01,$01,$03,$01                                         ;80B431|        |      ;
    dw $0000,$0000,$0000,$0000,$2000                           ;80B435|        |      ;
    dl sCompressedTilemap_92D3AB                               ;80B43F|        |92D3AB;
    dw $3000                                                   ;80B442|        |      ;
    dl sCompressedTilemap_938000                               ;80B444|        |938000;
    dw $4000                                                   ;80B447|        |      ;
    dl sCompressedTilemap_939E8E                               ;80B449|        |939E8E;
    dw $6000                                                   ;80B44C|        |      ;
    dl sCompressedCharactermap_A5F059                          ;80B44E|        |A5F059;
 
sMap_80B451:
    db $00                                                     ;80B451|        |      ;
    dw !AFLAGS_NONE                                                   
    db $01,$01,$03,$01                                         ;80B454|        |      ;
    dw $0000,$0000,$0000,$0000,$2000                           ;80B458|        |      ;
    dl sCompressedTilemap_92D3AB                               ;80B462|        |92D3AB;
    dw $3000                                                   ;80B465|        |      ;
    dl sCompressedTilemap_938000                               ;80B467|        |938000;
    dw $4000                                                   ;80B46A|        |      ;
    dl sCompressedTilemap_939E8E                               ;80B46C|        |939E8E;
    dw $6000                                                   ;80B46F|        |      ;
    dl sCompressedCharactermap_A5F45A                          ;80B471|        |A5F45A;
 
sMap_80B474:
    db $05                                                     ;80B474|        |      ;
    dw !AFLAGS_NONE                                                   
    db $02,$02,$04,$01                                         ;80B477|        |      ;
    dw $0000,$0100,$0000,$0100,$2000                           ;80B47B|        |      ;
    dl sCompressedTilemap_9EEB3D                               ;80B485|        |9EEB3D;
    dw $3000                                                   ;80B488|        |      ;
    dl sCompressedTilemap_A08000                               ;80B48A|        |A08000;
    dw $4000                                                   ;80B48D|        |      ;
    dl sCompressedTilemap_A088E9                               ;80B48F|        |A088E9;
    dw $5000                                                   ;80B492|        |      ;
    dl sCompressedTilemap_A09232                               ;80B494|        |A09232;
    dw $6000                                                   ;80B497|        |      ;
    dl sCompressedCharactermap_A690A6                          ;80B499|        |A690A6;
 
sMap_80B49C:
    db $05                                                     ;80B49C|        |      ;
    dw !AFLAGS_NONE                                                   
    db $02,$02,$04,$01                                         ;80B49F|        |      ;
    dw $0000,$0100,$0000,$0100,$2000                           ;80B4A3|        |      ;
    dl sCompressedTilemap_9EEB3D                               ;80B4AD|        |9EEB3D;
    dw $3000                                                   ;80B4B0|        |      ;
    dl sCompressedTilemap_A08000                               ;80B4B2|        |A08000;
    dw $4000                                                   ;80B4B5|        |      ;
    dl sCompressedTilemap_A088E9                               ;80B4B7|        |A088E9;
    dw $5000                                                   ;80B4BA|        |      ;
    dl sCompressedTilemap_A09232                               ;80B4BC|        |A09232;
    dw $6000                                                   ;80B4BF|        |      ;
    dl sCompressedCharactermap_A690A6                          ;80B4C1|        |A690A6;
 
sMap_80B4C4:
    db $05                                                     ;80B4C4|        |      ;
    dw !AFLAGS_NONE                                                   
    db $02,$02,$04,$01                                         ;80B4C7|        |      ;
    dw $0000,$0100,$0000,$0100,$2000                           ;80B4CB|        |      ;
    dl sCompressedTilemap_9EEB3D                               ;80B4D5|        |9EEB3D;
    dw $3000                                                   ;80B4D8|        |      ;
    dl sCompressedTilemap_A08000                               ;80B4DA|        |A08000;
    dw $4000                                                   ;80B4DD|        |      ;
    dl sCompressedTilemap_A088E9                               ;80B4DF|        |A088E9;
    dw $5000                                                   ;80B4E2|        |      ;
    dl sCompressedTilemap_A09232                               ;80B4E4|        |A09232;
    dw $6000                                                   ;80B4E7|        |      ;
    dl sCompressedCharactermap_A690A6                          ;80B4E9|        |A690A6;
 
sMap_80B4EC:
    db $05                                                     ;80B4EC|        |      ;
    dw !AFLAGS_NONE                                                   
    db $02,$02,$04,$01                                         ;80B4EF|        |      ;
    dw $0000,$0100,$0000,$0100,$2000                           ;80B4F3|        |      ;
    dl sCompressedTilemap_9EEB3D                               ;80B4FD|        |9EEB3D;
    dw $3000                                                   ;80B500|        |      ;
    dl sCompressedTilemap_A08000                               ;80B502|        |A08000;
    dw $4000                                                   ;80B505|        |      ;
    dl sCompressedTilemap_A088E9                               ;80B507|        |A088E9;
    dw $5000                                                   ;80B50A|        |      ;
    dl sCompressedTilemap_A09232                               ;80B50C|        |A09232;
    dw $6000                                                   ;80B50F|        |      ;
    dl sCompressedCharactermap_A690A6                          ;80B511|        |A690A6;
 
sMap_80B514:
    db $05                                                     ;80B514|        |      ;
    dw !AFLAGS_NONE                                                   
    db $02,$02,$03,$01                                         ;80B517|        |      ;
    dw $0000,$0100,$0000,$0100,$2000                           ;80B51B|        |      ;
    dl sCompressedTilemap_9EEB3D                               ;80B525|        |9EEB3D;
    dw $3000                                                   ;80B528|        |      ;
    dl sCompressedTilemap_A08000                               ;80B52A|        |A08000;
    dw $4000                                                   ;80B52D|        |      ;
    dl sCompressedTilemap_A088E9                               ;80B52F|        |A088E9;
    dw $6000                                                   ;80B532|        |      ;
    dl sCompressedCharactermap_A694EE                          ;80B534|        |A694EE;
 
sMap_80B537:
    db $05                                                     ;80B537|        |      ;
    dw !AFLAGS_NONE                                                   
    db $02,$02,$04,$01                                         ;80B53A|        |      ;
    dw $0000,$0100,$0000,$0100,$2000                           ;80B53E|        |      ;
    dl sCompressedTilemap_9EEB3D                               ;80B548|        |9EEB3D;
    dw $3000                                                   ;80B54B|        |      ;
    dl sCompressedTilemap_A08000                               ;80B54D|        |A08000;
    dw $4000                                                   ;80B550|        |      ;
    dl sCompressedTilemap_A088E9                               ;80B552|        |A088E9;
    dw $5000                                                   ;80B555|        |      ;
    dl sCompressedTilemap_A0E682                               ;80B557|        |A0E682;
    dw $6000                                                   ;80B55A|        |      ;
    dl sCompressedCharactermap_A694EE                          ;80B55C|        |A694EE;
 
sMap_80B55F:
    db $05                                                     ;80B55F|        |      ;
    dw !AFLAGS_NONE                                                   
    db $02,$02,$04,$01                                         ;80B562|        |      ;
    dw $0000,$0100,$0000,$0100,$2000                           ;80B566|        |      ;
    dl sCompressedTilemap_9EEB3D                               ;80B570|        |9EEB3D;
    dw $3000                                                   ;80B573|        |      ;
    dl sCompressedTilemap_A08000                               ;80B575|        |A08000;
    dw $4000                                                   ;80B578|        |      ;
    dl sCompressedTilemap_A088E9                               ;80B57A|        |A088E9;
    dw $5000                                                   ;80B57D|        |      ;
    dl sCompressedTilemap_A0AB1E                               ;80B57F|        |A0AB1E;
    dw $6000                                                   ;80B582|        |      ;
    dl sCompressedCharactermap_A694EE                          ;80B584|        |A694EE;
 
sMap_80B587:
    db $05                                                     ;80B587|        |      ;
    dw !AFLAGS_NONE                                                   
    db $02,$02,$04,$01                                         ;80B58A|        |      ;
    dw $0000,$0100,$0000,$0100,$2000                           ;80B58E|        |      ;
    dl sCompressedTilemap_9EEB3D                               ;80B598|        |9EEB3D;
    dw $3000                                                   ;80B59B|        |      ;
    dl sCompressedTilemap_A08000                               ;80B59D|        |A08000;
    dw $4000                                                   ;80B5A0|        |      ;
    dl sCompressedTilemap_A088E9                               ;80B5A2|        |A088E9;
    dw $5000                                                   ;80B5A5|        |      ;
    dl sCompressedTilemap_A09232                               ;80B5A7|        |A09232;
    dw $6000                                                   ;80B5AA|        |      ;
    dl sCompressedCharactermap_A694EE                          ;80B5AC|        |A694EE;
 
sMap_80B5AF:
    db $05                                                     ;80B5AF|        |      ;
    dw !AFLAGS_NONE                                                   
    db $02,$02,$03,$01                                         ;80B5B2|        |      ;
    dw $0000,$0100,$0000,$0100,$2000                           ;80B5B6|        |      ;
    dl sCompressedTilemap_9EEB3D                               ;80B5C0|        |9EEB3D;
    dw $3000                                                   ;80B5C3|        |      ;
    dl sCompressedTilemap_A08000                               ;80B5C5|        |A08000;
    dw $4000                                                   ;80B5C8|        |      ;
    dl sCompressedTilemap_A088E9                               ;80B5CA|        |A088E9;
    dw $6000                                                   ;80B5CD|        |      ;
    dl sCompressedCharactermap_A69996                          ;80B5CF|        |A69996;
 
sMap_80B5D2:
    db $05                                                     ;80B5D2|        |      ;
    dw !AFLAGS_NONE                                                   
    db $02,$02,$03,$01                                         ;80B5D5|        |      ;
    dw $0000,$0100,$0000,$0100,$2000                           ;80B5D9|        |      ;
    dl sCompressedTilemap_9EEB3D                               ;80B5E3|        |9EEB3D;
    dw $3000                                                   ;80B5E6|        |      ;
    dl sCompressedTilemap_A08000                               ;80B5E8|        |A08000;
    dw $4000                                                   ;80B5EB|        |      ;
    dl sCompressedTilemap_A088E9                               ;80B5ED|        |A088E9;
    dw $6000                                                   ;80B5F0|        |      ;
    dl sCompressedCharactermap_A69996                          ;80B5F2|        |A69996;
 
sMap_80B5F5:
    db $05                                                     ;80B5F5|        |      ;
    dw !AFLAGS_NONE                                                   
    db $02,$02,$03,$01                                         ;80B5F8|        |      ;
    dw $0000,$0100,$0000,$0100,$2000                           ;80B5FC|        |      ;
    dl sCompressedTilemap_9EEB3D                               ;80B606|        |9EEB3D;
    dw $3000                                                   ;80B609|        |      ;
    dl sCompressedTilemap_A08000                               ;80B60B|        |A08000;
    dw $4000                                                   ;80B60E|        |      ;
    dl sCompressedTilemap_A088E9                               ;80B610|        |A088E9;
    dw $6000                                                   ;80B613|        |      ;
    dl sCompressedCharactermap_A69996                          ;80B615|        |A69996;
 
sMap_80B618:
    db $05                                                     ;80B618|        |      ;
    dw !AFLAGS_NONE                                                   
    db $02,$02,$04,$01                                         ;80B61B|        |      ;
    dw $0000,$0100,$0000,$0100,$2000                           ;80B61F|        |      ;
    dl sCompressedTilemap_9EEB3D                               ;80B629|        |9EEB3D;
    dw $3000                                                   ;80B62C|        |      ;
    dl sCompressedTilemap_A08000                               ;80B62E|        |A08000;
    dw $4000                                                   ;80B631|        |      ;
    dl sCompressedTilemap_A088E9                               ;80B633|        |A088E9;
    dw $5000                                                   ;80B636|        |      ;
    dl sCompressedTilemap_A0CAAF                               ;80B638|        |A0CAAF;
    dw $6000                                                   ;80B63B|        |      ;
    dl sCompressedCharactermap_A69996                          ;80B63D|        |A69996;
 
sRainOverlay:
    db $01,$02,$01,$01                                         ;80B640|        |      ;
    dw $5000                                                   ;80B644|        |      ;
    dl sCompressedTilemap_928000                               ;80B646|        |928000;
    dw $7000                                                   ;80B649|        |      ;
    dl sCompressedCharactermap_A48000                          ;80B64B|        |A48000;
 
sCloudsOverlay:
    db $01,$02,$01,$01                                         ;80B64E|        |      ;
    dw $5000                                                   ;80B652|        |      ;
    dl sCompressedTilemap_97B11A                               ;80B654|        |97B11A;
    dw $7000                                                   ;80B657|        |      ;
    dl sCompressedCharactermap_A4C3E2                          ;80B659|        |A4C3E2;
 
sSnowOverlay:
    db $01,$02,$01,$01                                         ;80B65C|        |      ;
    dw $5000                                                   ;80B660|        |      ;
    dl sCompressedTilemap_9E9C6D                               ;80B662|        |9E9C6D;
    dw $7000                                                   ;80B665|        |      ;
    dl sCompressedCharactermap_A5C955                          ;80B667|        |A5C955;
 
sHeavySnowOverlay:
    db $01,$02,$01,$01                                         ;80B66A|        |      ;
    dw $5000                                                   ;80B66E|        |      ;
    dl sCompressedTilemap_9B8441                               ;80B670|        |9B8441;
    dw $7000                                                   ;80B673|        |      ;
    dl sCompressedCharactermap_A5A3D5                          ;80B675|        |A5A3D5;
 
sIntroFarmScrool:
    db $02,$02,$04,$02                                         ;80B678|        |      ;
    dw $2000                                                   ;80B67C|        |      ;
    dl sCompressedTilemap_9F8000                               ;80B67E|        |9F8000;
    dw $3000                                                   ;80B681|        |      ;
    dl sCompressedTilemap_9F946C                               ;80B683|        |9F946C;
    dw $4000                                                   ;80B686|        |      ;
    dl sCompressedTilemap_9FAA75                               ;80B688|        |9FAA75;
    dw $5000                                                   ;80B68B|        |      ;
    dl sCompressedTilemap_9FC04C                               ;80B68D|        |9FC04C;
    dw $6000                                                   ;80B690|        |      ;
    dl sCompressedCharactermap_A5CD88                          ;80B692|        |A5CD88;
    dw $7000                                                   ;80B695|        |      ;
    dl sCompressedCharactermap_A5D44C                          ;80B697|        |A5D44C;
 
sHarvestMoonLogo:
    db $02,$02,$00,$01                                         ;80B69A|        |      ;
    dw $6000                                                   ;80B69E|        |      ;
    dl sCompressedCharactermap_A5D94A                          ;80B6A0|        |A5D94A;
 
sNatsumeLogo:
    db $02,$02,$01,$01                                         ;80B6A3|        |      ;
    dw $2000                                                   ;80B6A7|        |      ;
    dl sCompressedTilemap_9FEF97                               ;80B6A9|        |9FEF97;
    dw $6000                                                   ;80B6AC|        |      ;
    dl sCompressedCharactermap_A5DE84                          ;80B6AE|        |A5DE84;
 
sMenuScreenBackgrounds:
    db $02,$02,$04,$02                                         ;80B6B1|        |      ;
    dw $2000                                                   ;80B6B5|        |      ;
    dl sCompressedTilemap_9ABF97                               ;80B6B7|        |9ABF97;
    dw $3000                                                   ;80B6BA|        |      ;
    dl sCompressedTilemap_9AC489                               ;80B6BC|        |9AC489;
    dw $4000                                                   ;80B6BF|        |      ;
    dl sCompressedTilemap_9ACB41                               ;80B6C1|        |9ACB41;
    dw $5000                                                   ;80B6C4|        |      ;
    dl sCompressedTilemap_9AD357                               ;80B6C6|        |9AD357;
    dw $1000                                                   ;80B6C9|        |      ;
    dl sCompressedCharactermap_A58000                          ;80B6CB|        |A58000;
    dw $6000                                                   ;80B6CE|        |      ;
    dl sCompressedCharactermap_A5970F                          ;80B6D0|        |A5970F;
 
sMenuCharacters:
    db $02,$02,$04,$02                                         ;80B6D3|        |      ;
    dw $2000                                                   ;80B6D7|        |      ;
    dl sCompressedTilemap_9ABF97                               ;80B6D9|        |9ABF97;
    dw $3000                                                   ;80B6DC|        |      ;
    dl sCompressedTilemap_9AC489                               ;80B6DE|        |9AC489;
    dw $4000                                                   ;80B6E1|        |      ;
    dl sCompressedTilemap_9ACB41                               ;80B6E3|        |9ACB41;
    dw $5000                                                   ;80B6E6|        |      ;
    dl sCompressedTilemap_9AD357                               ;80B6E8|        |9AD357;
    dw $1000                                                   ;80B6EB|        |      ;
    dl sCompressedCharactermap_A58D8E                          ;80B6ED|        |A58D8E;
    dw $6000                                                   ;80B6F0|        |      ;
    dl sCompressedCharactermap_A5970F                          ;80B6F2|        |A5970F;
 
aScreenTransitionTable:
    db $0C,$00,$00,$01                                         ;80B6F5|        |      ; 0x3B * [n8 nTransitionDestination, n8 nUnknown, n8 nIndex0xCF, n8 nFlags, n16 nDestX, n16 nDestY]
    dw $00E8,$0080                                             ;80B6F9|        |      ;
    db $15,$01,$0D,$00                                         ;80B6FD|        |      ;
    dw $0080,$00C8                                             ;80B701|        |      ;
    db $16,$01,$0D,$00                                         ;80B705|        |      ;
    dw $0080,$00C8                                             ;80B709|        |      ;
    db $17,$01,$0D,$00                                         ;80B70D|        |      ;
    dw $0080,$00C8                                             ;80B711|        |      ;
    db $27,$01,$0E,$00                                         ;80B715|        |      ;
    dw $0080,$0168                                             ;80B719|        |      ;
    db $28,$01,$0F,$00                                         ;80B71D|        |      ;
    dw $0080,$00C8                                             ;80B721|        |      ;
    db $26,$01,$10,$00                                         ;80B725|        |      ;
    dw $0080,$00C8                                             ;80B729|        |      ;
    db $2A,$00,$00,$00                                         ;80B72D|        |      ;
    dw $0090,$0290                                             ;80B731|        |      ;
    db $2A,$00,$00,$00                                         ;80B735|        |      ;
    dw $00B0,$0160                                             ;80B739|        |      ;
    db $00,$00,$00,$81                                         ;80B73D|        |      ;
    dw $0088,$0158                                             ;80B741|        |      ;
    db $00,$00,$00,$01                                         ;80B745|        |      ;
    dw $01A8,$01E8                                             ;80B749|        |      ;
    db $2A,$00,$23,$00                                         ;80B74D|        |      ;
    dw $0060,$0098                                             ;80B751|        |      ;
    db $00,$00,$00,$01                                         ;80B755|        |      ;
    dw $0148,$0168                                             ;80B759|        |      ;
    db $00,$00,$00,$01                                         ;80B75D|        |      ;
    dw $01C8,$0168                                             ;80B761|        |      ;
    db $00,$02,$00,$01                                         ;80B765|        |      ;
    dw $0018,$01C0                                             ;80B769|        |      ;
    db $04,$03,$00,$01                                         ;80B76D|        |      ;
    dw $02E8,$01A8                                             ;80B771|        |      ;
    db $10,$01,$00,$01                                         ;80B775|        |      ;
    dw $0148,$02D8                                             ;80B779|        |      ;
    db $0C,$02,$00,$01                                         ;80B77D|        |      ;
    dw $0018,$0080                                             ;80B781|        |      ;
    db $18,$01,$14,$22                                         ;80B785|        |      ;
    dw $0080,$00A8                                             ;80B789|        |      ;
    db $1B,$01,$15,$02                                         ;80B78D|        |      ;
    dw $0080,$01C8                                             ;80B791|        |      ;
    db $1C,$01,$16,$32                                         ;80B795|        |      ;
    dw $0090,$01C8                                             ;80B799|        |      ;
    db $1E,$01,$17,$24                                         ;80B79D|        |      ;
    dw $0090,$01C8                                             ;80B7A1|        |      ;
    db $20,$01,$18,$32                                         ;80B7A5|        |      ;
    dw $0090,$01C8                                             ;80B7A9|        |      ;
    db $22,$01,$19,$32                                         ;80B7AD|        |      ;
    dw $0090,$01C8                                             ;80B7B1|        |      ;
    db $24,$01,$1A,$32                                         ;80B7B5|        |      ;
    dw $0080,$00C8                                             ;80B7B9|        |      ;
    db $24,$00,$00,$32                                         ;80B7BD|        |      ;
    dw $0058,$0048                                             ;80B7C1|        |      ;
    db $25,$01,$1B,$32                                         ;80B7C5|        |      ;
    dw $0080,$00C8                                             ;80B7C9|        |      ;
    db $0C,$00,$00,$01                                         ;80B7CD|        |      ;
    dw $0080,$0018                                             ;80B7D1|        |      ;
    db $2B,$01,$13,$32                                         ;80B7D5|        |      ;
    dw $0080,$00C8                                             ;80B7D9|        |      ;
    db $29,$01,$00,$00                                         ;80B7DD|        |      ;
    dw $0178,$0080                                             ;80B7E1|        |      ;
    db $29,$05,$00,$00                                         ;80B7E5|        |      ;
    dw $00C8,$0188                                             ;80B7E9|        |      ;
    db $31,$01,$00,$41                                         ;80B7ED|        |      ;
    dw $0080,$01C8                                             ;80B7F1|        |      ;
    db $10,$00,$00,$01                                         ;80B7F5|        |      ;
    dw $00A8,$01A8                                             ;80B7F9|        |      ;
    db $10,$00,$00,$01                                         ;80B7FD|        |      ;
    dw $0188,$0018                                             ;80B801|        |      ;
    db $10,$00,$00,$01                                         ;80B805|        |      ;
    dw $0208,$0228                                             ;80B809|        |      ;
    db $04,$00,$00,$01                                         ;80B80D|        |      ;
    dw $0098,$0098                                             ;80B811|        |      ;
    db $19,$01,$1C,$00                                         ;80B815|        |      ;
    dw $01B0,$0198                                             ;80B819|        |      ;
    db $18,$00,$00,$00                                         ;80B81D|        |      ;
    dw $0098,$0048                                             ;80B821|        |      ;
    db $1A,$00,$00,$00                                         ;80B825|        |      ;
    dw $0098,$0158                                             ;80B829|        |      ;
    db $19,$01,$1D,$00                                         ;80B82D|        |      ;
    dw $0150,$0198                                             ;80B831|        |      ;
    db $04,$00,$00,$01                                         ;80B835|        |      ;
    dw $0170,$0098                                             ;80B839|        |      ;
    db $04,$00,$00,$01                                         ;80B83D|        |      ;
    dw $0258,$00E8                                             ;80B841|        |      ;
    db $1D,$01,$1E,$00                                         ;80B845|        |      ;
    dw $0068,$00B8                                             ;80B849|        |      ;
    db $1C,$00,$00,$00                                         ;80B84D|        |      ;
    dw $0068,$0148                                             ;80B851|        |      ;
    db $04,$00,$00,$01                                         ;80B855|        |      ;
    dw $0258,$0378                                             ;80B859|        |      ;
    db $04,$01,$1F,$01                                         ;80B85D|        |      ;
    dw $0248,$0328                                             ;80B861|        |      ;
    db $04,$00,$00,$01                                         ;80B865|        |      ;
    dw $0118,$0368                                             ;80B869|        |      ;
    db $21,$01,$20,$00                                         ;80B86D|        |      ;
    dw $0068,$00C8                                             ;80B871|        |      ;
    db $20,$00,$00,$00                                         ;80B875|        |      ;
    dw $0068,$0148                                             ;80B879|        |      ;
    db $04,$00,$00,$01                                         ;80B87D|        |      ;
    dw $0198,$0368                                             ;80B881|        |      ;
    db $23,$01,$21,$00                                         ;80B885|        |      ;
    dw $0068,$00B8                                             ;80B889|        |      ;
    db $22,$00,$00,$00                                         ;80B88D|        |      ;
    dw $0068,$0148                                             ;80B891|        |      ;
    db $04,$00,$00,$01                                         ;80B895|        |      ;
    dw $0098,$0368                                             ;80B899|        |      ;
    db $1F,$01,$22,$00                                         ;80B89D|        |      ;
    dw $0088,$00C8                                             ;80B8A1|        |      ;
    db $1E,$00,$00,$00                                         ;80B8A5|        |      ;
    dw $0088,$0148                                             ;80B8A9|        |      ;
    db $04,$00,$00,$01                                         ;80B8AD|        |      ;
    dw $0248,$0268                                             ;80B8B1|        |      ;
    db $26,$00,$00,$00                                         ;80B8B5|        |      ;
    dw $0078,$0048                                             ;80B8B9|        |      ;
    db $00,$00,$00,$01                                         ;80B8BD|        |      ;
    dw $0328,$0358                                             ;80B8C1|        |      ;
    db $04,$03,$00,$01                                         ;80B8C5|        |      ;
    dw $0268,$0168                                             ;80B8C9|        |      ;
 
nToolSoundData_80B8CD:
    dw $0400,$0502,$0303,$0403,$0103,$0302                     ;80B8CD|        |      ; 0x0D * [n16]
    dw $0303,$0401,$0303,$0104,$0301,$0101                     ;80B8D9|        |      ;
    dw $0201                                                   ;80B8E5|        |      ;
pAudioEngine_MapMusic:
    dw aAudioEngine_MapMusicId_0x00                            ;80B8E7|        |80B9A7; 0x60 * [ptr16]
    dw aAudioEngine_MapMusicId_0x00                            ;80B8E9|        |80B9A7;
    dw aAudioEngine_MapMusicId_0x00                            ;80B8EB|        |80B9A7;
    dw aAudioEngine_MapMusicId_0x00                            ;80B8ED|        |80B9A7;
    dw aAudioEngine_MapMusicId_0x01                            ;80B8EF|        |80B9AB;
    dw aAudioEngine_MapMusicId_0x01                            ;80B8F1|        |80B9AB;
    dw aAudioEngine_MapMusicId_0x01                            ;80B8F3|        |80B9AB;
    dw aAudioEngine_MapMusicId_0x01                            ;80B8F5|        |80B9AB;
    dw aAudioEngine_MapMusicId_0x03                            ;80B8F7|        |80B9B3;
    dw aAudioEngine_MapMusicId_0x03                            ;80B8F9|        |80B9B3;
    dw aAudioEngine_MapMusicId_0x04                            ;80B8FB|        |80B9B7;
    dw aAudioEngine_MapMusicId_0x05                            ;80B8FD|        |80B9BB;
    dw aAudioEngine_MapMusicId_0x00                            ;80B8FF|        |80B9A7;
    dw aAudioEngine_MapMusicId_0x00                            ;80B901|        |80B9A7;
    dw aAudioEngine_MapMusicId_0x00                            ;80B903|        |80B9A7;
    dw aAudioEngine_MapMusicId_0x00                            ;80B905|        |80B9A7;
    dw aAudioEngine_MapMusicId_0x02                            ;80B907|        |80B9AF;
    dw aAudioEngine_MapMusicId_0x02                            ;80B909|        |80B9AF;
    dw aAudioEngine_MapMusicId_0x02                            ;80B90B|        |80B9AF;
    dw aAudioEngine_MapMusicId_0x02                            ;80B90D|        |80B9AF;
    dw aAudioEngine_MapMusicId_0x02                            ;80B90F|        |80B9AF;
    dw aAudioEngine_MapMusicId_0x00                            ;80B911|        |80B9A7;
    dw aAudioEngine_MapMusicId_0x00                            ;80B913|        |80B9A7;
    dw aAudioEngine_MapMusicId_0x00                            ;80B915|        |80B9A7;
    dw aAudioEngine_MapMusicId_0x01                            ;80B917|        |80B9AB;
    dw aAudioEngine_MapMusicId_0x01                            ;80B919|        |80B9AB;
    dw aAudioEngine_MapMusicId_0x01                            ;80B91B|        |80B9AB;
    dw aAudioEngine_MapMusicId_0x06                            ;80B91D|        |80B9BF;
    dw aAudioEngine_MapMusicId_0x01                            ;80B91F|        |80B9AB;
    dw aAudioEngine_MapMusicId_0x01                            ;80B921|        |80B9AB;
    dw aAudioEngine_MapMusicId_0x0B                            ;80B923|        |80B9D3;
    dw aAudioEngine_MapMusicId_0x01                            ;80B925|        |80B9AB;
    dw aAudioEngine_MapMusicId_0x01                            ;80B927|        |80B9AB;
    dw aAudioEngine_MapMusicId_0x01                            ;80B929|        |80B9AB;
    dw aAudioEngine_MapMusicId_0x01                            ;80B92B|        |80B9AB;
    dw aAudioEngine_MapMusicId_0x01                            ;80B92D|        |80B9AB;
    dw aAudioEngine_MapMusicId_0x01                            ;80B92F|        |80B9AB;
    dw aAudioEngine_MapMusicId_0x01                            ;80B931|        |80B9AB;
    dw aAudioEngine_MapMusicId_0x00                            ;80B933|        |80B9A7;
    dw aAudioEngine_MapMusicId_0x00                            ;80B935|        |80B9A7;
    dw aAudioEngine_MapMusicId_0x00                            ;80B937|        |80B9A7;
    dw PTR16_80FFFF                                            ;80B939|        |80FFFF;
    dw aAudioEngine_MapMusicId_0x07                            ;80B93B|        |80B9C3;
    dw aAudioEngine_MapMusicId_0x02                            ;80B93D|        |80B9AF;
    dw aAudioEngine_MapMusicId_0x08                            ;80B93F|        |80B9C7;
    dw aAudioEngine_MapMusicId_0x00                            ;80B941|        |80B9A7;
    dw aAudioEngine_MapMusicId_0x00                            ;80B943|        |80B9A7;
    dw aAudioEngine_MapMusicId_0x00                            ;80B945|        |80B9A7;
    dw aAudioEngine_MapMusicId_0x00                            ;80B947|        |80B9A7;
    dw aAudioEngine_MapMusicId_0x02                            ;80B949|        |80B9AF;
    dw aAudioEngine_MapMusicId_0x02                            ;80B94B|        |80B9AF;
    dw aAudioEngine_MapMusicId_0x02                            ;80B94D|        |80B9AF;
    dw aAudioEngine_MapMusicId_0x02                            ;80B94F|        |80B9AF;
    dw aAudioEngine_MapMusicId_0x02                            ;80B951|        |80B9AF;
    dw aAudioEngine_MapMusicId_0x02                            ;80B953|        |80B9AF;
    dw aAudioEngine_MapMusicId_0x02                            ;80B955|        |80B9AF;
    dw aAudioEngine_MapMusicId_0x02                            ;80B957|        |80B9AF;
    dw aAudioEngine_MapMusicId_0x02                            ;80B959|        |80B9AF;
    dw aAudioEngine_MapMusicId_0x02                            ;80B95B|        |80B9AF;
    dw aAudioEngine_MapMusicId_0x02                            ;80B95D|        |80B9AF;
    dw aAudioEngine_MapMusicId_0x0A                            ;80B95F|        |80B9CF;
    dw PTR16_80FFFF                                            ;80B961|        |80FFFF;
    dw PTR16_80FFFF                                            ;80B963|        |80FFFF;
    dw PTR16_80FFFF                                            ;80B965|        |80FFFF;
    dw PTR16_80FFFF                                            ;80B967|        |80FFFF;
    dw PTR16_80FFFF                                            ;80B969|        |80FFFF;
    dw PTR16_80FFFF                                            ;80B96B|        |80FFFF;
    dw PTR16_80FFFF                                            ;80B96D|        |80FFFF;
    dw PTR16_80FFFF                                            ;80B96F|        |80FFFF;
    dw PTR16_80FFFF                                            ;80B971|        |80FFFF;
    dw PTR16_80FFFF                                            ;80B973|        |80FFFF;
    dw PTR16_80FFFF                                            ;80B975|        |80FFFF;
    dw PTR16_80FFFF                                            ;80B977|        |80FFFF;
    dw PTR16_80FFFF                                            ;80B979|        |80FFFF;
    dw PTR16_80FFFF                                            ;80B97B|        |80FFFF;
    dw PTR16_80FFFF                                            ;80B97D|        |80FFFF;
    dw PTR16_80FFFF                                            ;80B97F|        |80FFFF;
    dw PTR16_80FFFF                                            ;80B981|        |80FFFF;
    dw PTR16_80FFFF                                            ;80B983|        |80FFFF;
    dw PTR16_80FFFF                                            ;80B985|        |80FFFF;
    dw PTR16_80FFFF                                            ;80B987|        |80FFFF;
    dw PTR16_80FFFF                                            ;80B989|        |80FFFF;
    dw PTR16_80FFFF                                            ;80B98B|        |80FFFF;
    dw PTR16_80FFFF                                            ;80B98D|        |80FFFF;
    dw PTR16_80FFFF                                            ;80B98F|        |80FFFF;
    dw PTR16_80FFFF                                            ;80B991|        |80FFFF;
    dw PTR16_80FFFF                                            ;80B993|        |80FFFF;
    dw PTR16_80FFFF                                            ;80B995|        |80FFFF;
    dw PTR16_80FFFF                                            ;80B997|        |80FFFF;
    dw PTR16_80FFFF                                            ;80B999|        |80FFFF;
    dw PTR16_80FFFF                                            ;80B99B|        |80FFFF;
    dw aAudioEngine_MapMusicId_0x0A                            ;80B99D|        |80B9CF;
    dw aAudioEngine_MapMusicId_0x09                            ;80B99F|        |80B9CB;
    dw PTR16_80FFFF                                            ;80B9A1|        |80FFFF;
    dw aAudioEngine_MapMusicId_0x08                            ;80B9A3|        |80B9C7;
    dw aAudioEngine_MapMusicId_0x08                            ;80B9A5|        |80B9C7;
 
aAudioEngine_MapMusicId_0x00:
    db $01,$02,$07,$04                                         ;80B9A7|        |      ; 0x04 * [n8][nSeasonId]
 
aAudioEngine_MapMusicId_0x01:
    db $05,$05,$05,$05                                         ;80B9AB|        |      ; 0x04 * [n8][nSeasonId]
 
aAudioEngine_MapMusicId_0x02:
    db $06,$06,$06,$06                                         ;80B9AF|        |      ; 0x04 * [n8][nSeasonId]
 
aAudioEngine_MapMusicId_0x03:
    db $03,$03,$03,$03                                         ;80B9B3|        |      ; 0x04 * [n8][nSeasonId]
 
aAudioEngine_MapMusicId_0x04:
    db $0E,$0E,$0E,$0E                                         ;80B9B7|        |      ; 0x04 * [n8][nSeasonId]
 
aAudioEngine_MapMusicId_0x05:
    db $0D,$0D,$0D,$0D                                         ;80B9BB|        |      ; 0x04 * [n8][nSeasonId]
 
aAudioEngine_MapMusicId_0x06:
    db $09,$09,$09,$09                                         ;80B9BF|        |      ; 0x04 * [n8][nSeasonId]
 
aAudioEngine_MapMusicId_0x07:
    db $0F,$0F,$0F,$0F                                         ;80B9C3|        |      ; 0x04 * [n8][nSeasonId]
 
aAudioEngine_MapMusicId_0x08:
    db $0A,$0A,$0A,$0A                                         ;80B9C7|        |      ; 0x04 * [n8][nSeasonId]
 
aAudioEngine_MapMusicId_0x09:
    db $0B,$0B,$0B,$0B                                         ;80B9CB|        |      ; 0x04 * [n8][nSeasonId]
 
aAudioEngine_MapMusicId_0x0A:
    db $12,$12,$12,$12                                         ;80B9CF|        |      ; 0x04 * [n8][nSeasonId]
 
aAudioEngine_MapMusicId_0x0B:
    db $08,$08,$08,$08                                         ;80B9D3|        |      ; 0x04 * [n8][nSeasonId]
 
sData42_80B9D7:
    db $68,$49,$08                                             ;80B9D7|        |      ;
    dw $FFFF                                                   ;80B9DA|        |      ;
 
sData42_80B9DC:
    db $68,$49,$08                                             ;80B9DC|        |      ;
 
sData42_80B9DF:
    db $17,$7F,$08                                             ;80B9DF|        |      ;
 
sData42_80B9E2:
    db $71,$72,$08                                             ;80B9E2|        |      ;
    dw $FFFE                                                   ;80B9E5|        |      ;
    dl sData42_80B9DC                                          ;80B9E7|        |80B9DC;
 
sData42_80B9EA:
    db $10,$52,$28                                             ;80B9EA|        |      ;
    dw $FFFF                                                   ;80B9ED|        |      ;
 
sData42_80B9EF:
    db $10,$52,$28                                             ;80B9EF|        |      ;
 
sData42_80B9F2:
    db $10,$52,$28                                             ;80B9F2|        |      ;
 
sData42_80B9F5:
    db $BD,$7F,$28                                             ;80B9F5|        |      ;
    dw $FFFE                                                   ;80B9F8|        |      ;
    dl sData42_80B9EF                                          ;80B9FA|        |80B9EF;
aPalettes:
    dl sPalette_0x0A                                           ;80B9FD|        |A89400; 0x75 * [ptr24]
    dl sPalette_0x0B                                           ;80BA00|        |A89600;
    dl sPalette_0x0C                                           ;80BA03|        |A89800;
    dl sPalette_0x05                                           ;80BA06|        |A88A00;
    dl sPalette_0x06                                           ;80BA09|        |A88C00;
    dl sPalette_0x07                                           ;80BA0C|        |A88E00;
    dl sPalette_0x08                                           ;80BA0F|        |A89000;
    dl sPalette_0x09                                           ;80BA12|        |A89200;
    dl sPalette_0x00                                           ;80BA15|        |A88000;
    dl sPalette_0x01                                           ;80BA18|        |A88200;
    dl sPalette_0x02                                           ;80BA1B|        |A88400;
    dl sPalette_0x03                                           ;80BA1E|        |A88600;
    dl sPalette_0x04                                           ;80BA21|        |A88800;
    dl sPalette_0x0D                                           ;80BA24|        |A89A00;
    dl sPalette_0x0E                                           ;80BA27|        |A89C00;
    dl sPalette_0x0F                                           ;80BA2A|        |A89E00;
    dl sPalette_0x10                                           ;80BA2D|        |A8A000;
    dl sPalette_0x11                                           ;80BA30|        |A8A200;
    dl sPalette_0x3A                                           ;80BA33|        |A8F400;
    dl sPalette_0x3C                                           ;80BA36|        |A8F800;
    dl sPalette_0x3D                                           ;80BA39|        |A8FA00;
    dl sPalette_0x3E                                           ;80BA3C|        |A8FC00;
    dl sPalette_0x1D                                           ;80BA3F|        |A8BA00;
    dl sPalette_0x1E                                           ;80BA42|        |A8BC00;
    dl sPalette_0x1F                                           ;80BA45|        |A8BE00;
    dl sPalette_0x20                                           ;80BA48|        |A8C000;
    dl sPalette_0x21                                           ;80BA4B|        |A8C200;
    dl sPalette_0x23                                           ;80BA4E|        |A8C600;
    dl sPalette_0x24                                           ;80BA51|        |A8C800;
    dl sPalette_0x25                                           ;80BA54|        |A8CA00;
    dl sPalette_0x40                                           ;80BA57|        |A98000;
    dl sPalette_0x41                                           ;80BA5A|        |A98200;
    dl sPalette_0x42                                           ;80BA5D|        |A98400;
    dl sPalette_0x43                                           ;80BA60|        |A98600;
    dl sPalette_0x3B                                           ;80BA63|        |A8F600;
    dl sPalette_0x22                                           ;80BA66|        |A8C400;
    dl sPalette_0x45                                           ;80BA69|        |A98A00;
    dl sPalette_0x44                                           ;80BA6C|        |A98800;
    dl sPalette_0x3F                                           ;80BA6F|        |A8FE00;
    dl sPalette_0x26                                           ;80BA72|        |A8CC00;
    dl sPalette_0x27                                           ;80BA75|        |A8CE00;
    dl sPalette_0x28                                           ;80BA78|        |A8D000;
    dl sPalette_0x29                                           ;80BA7B|        |A8D200;
    dl sPalette_0x2A                                           ;80BA7E|        |A8D400;
    dl sPalette_0x35                                           ;80BA81|        |A8EA00;
    dl sPalette_0x36                                           ;80BA84|        |A8EC00;
    dl sPalette_0x37                                           ;80BA87|        |A8EE00;
    dl sPalette_0x38                                           ;80BA8A|        |A8F000;
    dl sPalette_0x39                                           ;80BA8D|        |A8F200;
    dl sPalette_0x2B                                           ;80BA90|        |A8D600;
    dl sPalette_0x2C                                           ;80BA93|        |A8D800;
    dl sPalette_0x2D                                           ;80BA96|        |A8DA00;
    dl sPalette_0x2E                                           ;80BA99|        |A8DC00;
    dl sPalette_0x2F                                           ;80BA9C|        |A8DE00;
    dl sPalette_0x30                                           ;80BA9F|        |A8E000;
    dl sPalette_0x31                                           ;80BAA2|        |A8E200;
    dl sPalette_0x32                                           ;80BAA5|        |A8E400;
    dl sPalette_0x33                                           ;80BAA8|        |A8E600;
    dl sPalette_0x34                                           ;80BAAB|        |A8E800;
    dl sPalette_0x64                                           ;80BAAE|        |A9C800;
    dl sPalette_0x65                                           ;80BAB1|        |A9CA00;
    dl sPalette_0x66                                           ;80BAB4|        |A9CC00;
    dl sPalette_0x67                                           ;80BAB7|        |A9CE00;
    dl sPalette_0x5C                                           ;80BABA|        |A9B800;
    dl sPalette_0x5D                                           ;80BABD|        |A9BA00;
    dl sPalette_0x5E                                           ;80BAC0|        |A9BC00;
    dl sPalette_0x5F                                           ;80BAC3|        |A9BE00;
    dl sPalette_0x60                                           ;80BAC6|        |A9C000;
    dl sPalette_0x61                                           ;80BAC9|        |A9C200;
    dl sPalette_0x62                                           ;80BACC|        |A9C400;
    dl sPalette_0x63                                           ;80BACF|        |A9C600;
    dl sPalette_0x68                                           ;80BAD2|        |A9D000;
    dl sPalette_0x69                                           ;80BAD5|        |A9D200;
    dl sPalette_0x6A                                           ;80BAD8|        |A9D400;
    dl sPalette_0x6B                                           ;80BADB|        |A9D600;
    dl sPalette_0x13                                           ;80BADE|        |A8A600;
    dl sPalette_0x14                                           ;80BAE1|        |A8A800;
    dl sPalette_0x15                                           ;80BAE4|        |A8AA00;
    dl sPalette_0x16                                           ;80BAE7|        |A8AC00;
    dl sPalette_0x17                                           ;80BAEA|        |A8AE00;
    dl sPalette_0x18                                           ;80BAED|        |A8B000;
    dl sPalette_0x19                                           ;80BAF0|        |A8B200;
    dl sPalette_0x1A                                           ;80BAF3|        |A8B400;
    dl sPalette_0x1B                                           ;80BAF6|        |A8B600;
    dl sPalette_0x1C                                           ;80BAF9|        |A8B800;
    dl sPalette_0x47                                           ;80BAFC|        |A98E00;
    dl sPalette_0x5B                                           ;80BAFF|        |A9B600;
    dl sPalette_0x12                                           ;80BB02|        |A8A400;
    dl sPalette_0x49                                           ;80BB05|        |A99200;
    dl sPalette_0x48                                           ;80BB08|        |A99000;
    dl sPalette_0x53                                           ;80BB0B|        |A9A600;
    dl sPalette_0x54                                           ;80BB0E|        |A9A800;
    dl sPalette_0x55                                           ;80BB11|        |A9AA00;
    dl sPalette_0x56                                           ;80BB14|        |A9AC00;
    dl sPalette_0x4E                                           ;80BB17|        |A99C00;
    dl sPalette_0x4F                                           ;80BB1A|        |A99E00;
    dl sPalette_0x50                                           ;80BB1D|        |A9A000;
    dl sPalette_0x51                                           ;80BB20|        |A9A200;
    dl sPalette_0x4A                                           ;80BB23|        |A99400;
    dl sPalette_0x4B                                           ;80BB26|        |A99600;
    dl sPalette_0x4C                                           ;80BB29|        |A99800;
    dl sPalette_0x4D                                           ;80BB2C|        |A99A00;
    dl sPalette_0x57                                           ;80BB2F|        |A9AE00;
    dl sPalette_0x58                                           ;80BB32|        |A9B000;
    dl sPalette_0x59                                           ;80BB35|        |A9B200;
    dl sPalette_0x5A                                           ;80BB38|        |A9B400;
    dl sPalette_0x52                                           ;80BB3B|        |A9A400;
    dl sPalette_0x6F                                           ;80BB3E|        |A9DE00;
    dl sPalette_0x70                                           ;80BB41|        |A9E000;
    dl sPalette_0x6C                                           ;80BB44|        |A9D800;
    dl sPalette_0x6D                                           ;80BB47|        |A9DA00;
    dl sPalette_0x46                                           ;80BB4A|        |A98C00;
    dl sPalette_0x6E                                           ;80BB4D|        |A9DC00;
    dl sPalette_0x71                                           ;80BB50|        |A9E200;
    dl sPalette_0x72                                           ;80BB53|        |A9E400;
    dl sPalette_0x73                                           ;80BB56|        |A9E600;
    dl sPalette_0x74                                           ;80BB59|        |A9E800;
 
aMapPalettesIndexes:
    db $00,$01,$02,$06,$07,$FF,$03,$04,$05,$06,$07,$FF         ;80BB5C|        |      ; 0x60 * [n8 nPaletteIndex0, n8 nPaletteIndex1, n8 nPaletteIndex2, n8 nPaletteIndex3, n8 nPaletteIndex4, n8 nPaletteIndex5]
    db $08,$09,$0A,$0B,$0C,$FF,$0D,$0E,$0F,$10,$11,$FF         ;80BB68|        |      ;
    db $FF,$12,$13,$14,$15,$FF,$FF,$16,$17,$18,$19,$FF         ;80BB74|        |      ;
    db $FF,$1A,$1B,$1C,$1D,$FF,$FF,$1E,$1F,$20,$21,$FF         ;80BB80|        |      ;
    db $FF,$22,$22,$FF,$FF,$FF,$FF,$23,$23,$FF,$FF,$FF         ;80BB8C|        |      ;
    db $FF,$FF,$FF,$24,$25,$FF,$FF,$26,$FF,$FF,$FF,$FF         ;80BB98|        |      ;
    db $27,$28,$29,$2A,$2B,$FF,$2C,$2D,$2E,$2F,$30,$FF         ;80BBA4|        |      ;
    db $31,$32,$33,$34,$35,$FF,$36,$37,$38,$39,$3A,$FF         ;80BBB0|        |      ;
    db $FF,$3B,$3C,$3D,$3E,$FF,$FF,$3F,$40,$41,$42,$FF         ;80BBBC|        |      ;
    db $FF,$43,$44,$45,$46,$FF,$FF,$47,$48,$49,$4A,$FF         ;80BBC8|        |      ;
    db $FF,$FF,$FF,$FF,$4A,$FF,$4B,$4B,$4B,$4B,$4B,$4C         ;80BBD4|        |      ;
    db $4B,$4B,$4B,$4B,$4B,$4C,$4B,$4B,$4B,$4B,$4B,$4C         ;80BBE0|        |      ;
    db $FF,$4D,$4D,$FF,$FF,$FF,$FF,$4D,$4D,$FF,$FF,$FF         ;80BBEC|        |      ;
    db $FF,$4D,$4D,$FF,$FF,$FF,$FF,$4E,$4E,$FF,$FF,$FF         ;80BBF8|        |      ;
    db $FF,$4F,$4F,$FF,$FF,$FF,$FF,$4F,$4F,$FF,$FF,$FF         ;80BC04|        |      ;
    db $FF,$FF,$FF,$50,$50,$FF,$FF,$FF,$FF,$50,$50,$FF         ;80BC10|        |      ;
    db $FF,$51,$51,$FF,$FF,$FF,$FF,$51,$51,$FF,$FF,$FF         ;80BC1C|        |      ;
    db $FF,$52,$52,$FF,$FF,$FF,$FF,$52,$52,$FF,$FF,$FF         ;80BC28|        |      ;
    db $FF,$53,$53,$FF,$FF,$FF,$FF,$54,$54,$FF,$FF,$FF         ;80BC34|        |      ;
    db $55,$55,$55,$55,$55,$FF,$56,$56,$56,$56,$56,$FF         ;80BC40|        |      ;
    db $56,$56,$56,$56,$56,$FF,$FF,$57,$57,$57,$57,$FF         ;80BC4C|        |      ;
    db $57,$57,$57,$57,$57,$FF,$FF,$58,$58,$FF,$FF,$FF         ;80BC58|        |      ;
    db $FF,$59,$FF,$FF,$FF,$FF,$FF,$12,$FF,$FF,$FF,$FF         ;80BC64|        |      ;
    db $FF,$16,$FF,$FF,$FF,$FF,$FF,$1A,$FF,$FF,$FF,$FF         ;80BC70|        |      ;
    db $FF,$1E,$FF,$FF,$FF,$FF,$FF,$5A,$5B,$5C,$5D,$FF         ;80BC7C|        |      ;
    db $FF,$5E,$5F,$60,$61,$FF,$FF,$62,$63,$64,$65,$FF         ;80BC88|        |      ;
    db $FF,$66,$67,$68,$69,$FF,$FF,$5A,$5B,$5C,$5D,$FF         ;80BC94|        |      ;
    db $FF,$5E,$5F,$60,$61,$FF,$FF,$62,$63,$64,$65,$FF         ;80BCA0|        |      ;
    db $FF,$66,$67,$68,$69,$FF,$FF,$FF,$FF,$FF,$69,$FF         ;80BCAC|        |      ;
    db $69,$6A,$6A,$6A,$6A,$FF,$FF,$5A,$5B,$5C,$5D,$FF         ;80BCB8|        |      ;
    db $28,$FF,$FF,$FF,$FF,$FF,$04,$FF,$FF,$FF,$FF,$FF         ;80BCC4|        |      ;
    db $04,$FF,$FF,$FF,$FF,$FF,$04,$FF,$FF,$FF,$FF,$FF         ;80BCD0|        |      ;
    db $04,$FF,$FF,$FF,$FF,$FF,$04,$FF,$FF,$FF,$FF,$FF         ;80BCDC|        |      ;
    db $16,$FF,$FF,$FF,$FF,$FF,$04,$FF,$FF,$FF,$FF,$FF         ;80BCE8|        |      ;
    db $04,$FF,$FF,$FF,$FF,$FF,$04,$FF,$FF,$FF,$FF,$FF         ;80BCF4|        |      ;
    db $04,$FF,$FF,$FF,$FF,$FF,$04,$FF,$FF,$FF,$FF,$FF         ;80BD00|        |      ;
    db $3F,$FF,$FF,$FF,$FF,$FF,$04,$FF,$FF,$FF,$FF,$FF         ;80BD0C|        |      ;
    db $04,$FF,$FF,$FF,$FF,$FF,$70,$FF,$FF,$FF,$FF,$FF         ;80BD18|        |      ;
    db $70,$FF,$FF,$FF,$FF,$FF,$70,$FF,$FF,$FF,$FF,$FF         ;80BD24|        |      ;
    db $70,$FF,$FF,$FF,$FF,$FF,$70,$FF,$FF,$FF,$FF,$FF         ;80BD30|        |      ;
    db $70,$FF,$FF,$FF,$FF,$FF,$70,$FF,$FF,$FF,$FF,$FF         ;80BD3C|        |      ;
    db $70,$FF,$FF,$FF,$FF,$FF,$70,$FF,$FF,$FF,$FF,$FF         ;80BD48|        |      ;
    db $70,$FF,$FF,$FF,$FF,$FF,$70,$FF,$FF,$FF,$FF,$FF         ;80BD54|        |      ;
    db $70,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF         ;80BD60|        |      ;
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF         ;80BD6C|        |      ;
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF         ;80BD78|        |      ;
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF         ;80BD84|        |      ;
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF         ;80BD90|        |      ;
 
nPaletteOverwrite_80BD9C:
    dw $3BF8,$26D0,$0946,$238C,$1648,$0124                     ;80BD9C|        |      ; ? * [16b, 16b, 16b]
    dw $22D7,$0171,$0CA9,$238C,$3DEF,$7F7B                     ;80BDA8|        |      ;
    dw $15A8,$1507,$00A2,$15A8,$1507,$00A2                     ;80BDB4|        |      ;
    dw $014C,$00E8,$0066,$15A8,$3DEF,$5673                     ;80BDC0|        |      ;
    dw $3B76,$2A92,$1107,$238C,$1648,$0124                     ;80BDCC|        |      ;
    dw $0A7C,$0154,$08A8,$3B76,$2A92,$1107                     ;80BDD8|        |      ;
    dw $19CE,$112A,$0885,$1DCF,$0D2B,$0066                     ;80BDE4|        |      ;
    dw $0170,$04CC,$0024,$19CE,$112A,$0885                     ;80BDF0|        |      ;
 
sPallete_MarriedGirlTable:
    dw $0000,$0000,$0000,$7A29,$5DA0,$4100                     ;80BDFC|        |      ; 0x06 * [16b, 16b, 16b, 16b, 16b, 16b] - index by married gitl id 0-5
    dw $031F,$01DF,$00F8,$731F,$625E,$41B9                     ;80BE08|        |      ;
    dw $1A56,$0DB0,$1D2D,$53FF,$02FE,$0216                     ;80BE14|        |      ;
    dw $0000,$0000,$0000,$61EA,$5180,$4520                     ;80BE20|        |      ;
    dw $1DDB,$0178,$00B5,$6A7D,$55F9,$3114                     ;80BE2C|        |      ;
    dw $098F,$1D2B,$1509,$0AFC,$027B,$0192                     ;80BE38|        |      ;
 
aMapPalettesId:
    db $6B,$6C,$6B,$6C,$6B,$6C,$6B,$6C,$6B,$6C,$6B,$6C         ;80BE44|        |      ; 0x60 * [n8 nPaletteIndex]
    db $6B,$6C,$6B,$6C,$6B,$6B,$6B,$6B,$6B,$6C,$6B,$6B         ;80BE50|        |      ;
    db $6B,$6C,$6B,$6C,$6B,$6C,$6B,$6C,$6B,$6C,$6B,$6C         ;80BE5C|        |      ;
    db $6B,$6C,$6B,$6C,$6B,$6B,$6B,$6B,$6B,$6B,$6B,$6B         ;80BE68|        |      ;
    db $6B,$6B,$6B,$6B,$6B,$6B,$6B,$6B,$6B,$6B,$6B,$6B         ;80BE74|        |      ;
    db $6B,$6B,$6B,$6B,$6B,$6B,$6B,$6B,$6B,$6B,$6B,$6B         ;80BE80|        |      ;
    db $6B,$6B,$6B,$6B,$6B,$6B,$6B,$6B,$6B,$6B,$6C,$6C         ;80BE8C|        |      ;
    db $6C,$6C,$6B,$6B,$6B,$6B,$6B,$6B,$6B,$6B,$6B,$6B         ;80BE98|        |      ;
    db $6B,$6B,$6B,$6C,$6B,$6C,$6B,$6C,$6B,$6C,$6B,$6C         ;80BEA4|        |      ;
    db $6B,$6C,$6B,$6C,$6B,$6C,$6B,$6C,$6B,$6B,$6B,$6C         ;80BEB0|        |      ;
    db $6B,$6C,$6B,$6C,$6B,$6C,$6B,$6C,$6B,$6C,$6B,$6C         ;80BEBC|        |      ;
    db $6B,$6C,$6B,$6C,$6B,$6C,$6B,$6C,$6B,$6C,$6B,$6C         ;80BEC8|        |      ;
    db $6B,$6C,$6B,$6C,$6B,$6C,$FF,$FF,$FF,$FF,$FF,$FF         ;80BED4|        |      ;
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF         ;80BEE0|        |      ;
pSubrutineTable_80BEEC:
    dw subUnknown_80C36C                                       ;80BEEC|        |80C36C; 0x60 * [ptr16, ptr16, ptr16, ptr16, ptr16, n16]
    dw subUnknown_80C36C                                       ;80BEEE|        |80C36C;
    dw subUnknown_80C3D9                                       ;80BEF0|        |80C3D9;
    dw subUnknown_80C446                                       ;80BEF2|        |80C446;
    dw subUnknown_80C4B3                                       ;80BEF4|        |80C4B3;
    dw $FFFF                                                   ;80BEF6|        |      ;
    dw subUnknown_80C36C                                       ;80BEF8|        |80C36C;
    dw subUnknown_80C36C                                       ;80BEFA|        |80C36C;
    dw subUnknown_80C3D9                                       ;80BEFC|        |80C3D9;
    dw subUnknown_80C446                                       ;80BEFE|        |80C446;
    dw subUnknown_80C4B3                                       ;80BF00|        |80C4B3;
    dw $FFFF                                                   ;80BF02|        |      ;
    dw subUnknown_80C520                                       ;80BF04|        |80C520;
    dw subUnknown_80C520                                       ;80BF06|        |80C520;
    dw subUnknown_80C58D                                       ;80BF08|        |80C58D;
    dw subUnknown_80C5FA                                       ;80BF0A|        |80C5FA;
    dw subUnknown_80C667                                       ;80BF0C|        |80C667;
    dw $FFFF                                                   ;80BF0E|        |      ;
    dw PTR16_80FFFF                                            ;80BF10|        |80FFFF;
    dw PTR16_80FFFF                                            ;80BF12|        |80FFFF;
    dw PTR16_80FFFF                                            ;80BF14|        |80FFFF;
    dw PTR16_80FFFF                                            ;80BF16|        |80FFFF;
    dw PTR16_80FFFF                                            ;80BF18|        |80FFFF;
    dw $FFFF                                                   ;80BF1A|        |      ;
    dw PTR16_80FFFF                                            ;80BF1C|        |80FFFF;
    dw subUnknown_80CADE                                       ;80BF1E|        |80CADE;
    dw subUnknown_80CB30                                       ;80BF20|        |80CB30;
    dw subUnknown_80CB82                                       ;80BF22|        |80CB82;
    dw subUnknown_80CBD4                                       ;80BF24|        |80CBD4;
    dw $FFFF                                                   ;80BF26|        |      ;
    dw PTR16_80FFFF                                            ;80BF28|        |80FFFF;
    dw subUnknown_80CC92                                       ;80BF2A|        |80CC92;
    dw subUnknown_80CCE4                                       ;80BF2C|        |80CCE4;
    dw subUnknown_80CD36                                       ;80BF2E|        |80CD36;
    dw subUnknown_80CD88                                       ;80BF30|        |80CD88;
    dw $FFFF                                                   ;80BF32|        |      ;
    dw PTR16_80FFFF                                            ;80BF34|        |80FFFF;
    dw subUnknown_80CE46                                       ;80BF36|        |80CE46;
    dw subUnknown_80CE98                                       ;80BF38|        |80CE98;
    dw subUnknown_80CEEA                                       ;80BF3A|        |80CEEA;
    dw subUnknown_80CF3C                                       ;80BF3C|        |80CF3C;
    dw $FFFF                                                   ;80BF3E|        |      ;
    dw PTR16_80FFFF                                            ;80BF40|        |80FFFF;
    dw PTR16_80FFFF                                            ;80BF42|        |80FFFF;
    dw PTR16_80FFFF                                            ;80BF44|        |80FFFF;
    dw PTR16_80FFFF                                            ;80BF46|        |80FFFF;
    dw subUnknown_80CFFA                                       ;80BF48|        |80CFFA;
    dw $FFFF                                                   ;80BF4A|        |      ;
    dw PTR16_80FFFF                                            ;80BF4C|        |80FFFF;
    dw subUnknown_80CADE                                       ;80BF4E|        |80CADE;
    dw PTR16_80FFFF                                            ;80BF50|        |80FFFF;
    dw PTR16_80FFFF                                            ;80BF52|        |80FFFF;
    dw PTR16_80FFFF                                            ;80BF54|        |80FFFF;
    dw $FFFF                                                   ;80BF56|        |      ;
    dw PTR16_80FFFF                                            ;80BF58|        |80FFFF;
    dw subUnknown_80DC30                                       ;80BF5A|        |80DC30;
    dw PTR16_80FFFF                                            ;80BF5C|        |80FFFF;
    dw PTR16_80FFFF                                            ;80BF5E|        |80FFFF;
    dw PTR16_80FFFF                                            ;80BF60|        |80FFFF;
    dw $FFFF                                                   ;80BF62|        |      ;
    dw PTR16_80FFFF                                            ;80BF64|        |80FFFF;
    dw subUnknown_80CE46                                       ;80BF66|        |80CE46;
    dw PTR16_80FFFF                                            ;80BF68|        |80FFFF;
    dw PTR16_80FFFF                                            ;80BF6A|        |80FFFF;
    dw subUnknown_80DAB4                                       ;80BF6C|        |80DAB4;
    dw $FFFF                                                   ;80BF6E|        |      ;
    dw PTR16_80FFFF                                            ;80BF70|        |80FFFF;
    dw subUnknown_80CADE                                       ;80BF72|        |80CADE;
    dw PTR16_80FFFF                                            ;80BF74|        |80FFFF;
    dw PTR16_80FFFF                                            ;80BF76|        |80FFFF;
    dw PTR16_80FFFF                                            ;80BF78|        |80FFFF;
    dw $FFFF                                                   ;80BF7A|        |      ;
    dw PTR16_80FFFF                                            ;80BF7C|        |80FFFF;
    dw PTR16_80FFFF                                            ;80BF7E|        |80FFFF;
    dw PTR16_80FFFF                                            ;80BF80|        |80FFFF;
    dw PTR16_80FFFF                                            ;80BF82|        |80FFFF;
    dw PTR16_80FFFF                                            ;80BF84|        |80FFFF;
    dw $FFFF                                                   ;80BF86|        |      ;
    dw PTR16_80FFFF                                            ;80BF88|        |80FFFF;
    dw PTR16_80FFFF                                            ;80BF8A|        |80FFFF;
    dw PTR16_80FFFF                                            ;80BF8C|        |80FFFF;
    dw PTR16_80FFFF                                            ;80BF8E|        |80FFFF;
    dw PTR16_80FFFF                                            ;80BF90|        |80FFFF;
    dw $FFFF                                                   ;80BF92|        |      ;
    dw PTR16_80FFFF                                            ;80BF94|        |80FFFF;
    dw PTR16_80FFFF                                            ;80BF96|        |80FFFF;
    dw PTR16_80FFFF                                            ;80BF98|        |80FFFF;
    dw PTR16_80FFFF                                            ;80BF9A|        |80FFFF;
    dw PTR16_80FFFF                                            ;80BF9C|        |80FFFF;
    dw $FFFF                                                   ;80BF9E|        |      ;
    dw PTR16_80FFFF                                            ;80BFA0|        |80FFFF;
    dw PTR16_80FFFF                                            ;80BFA2|        |80FFFF;
    dw PTR16_80FFFF                                            ;80BFA4|        |80FFFF;
    dw PTR16_80FFFF                                            ;80BFA6|        |80FFFF;
    dw PTR16_80FFFF                                            ;80BFA8|        |80FFFF;
    dw $FFFF                                                   ;80BFAA|        |      ;
    dw PTR16_80FFFF                                            ;80BFAC|        |80FFFF;
    dw subUnknown_80D067                                       ;80BFAE|        |80D067;
    dw subUnknown_80D125                                       ;80BFB0|        |80D125;
    dw subUnknown_80D1E3                                       ;80BFB2|        |80D1E3;
    dw subUnknown_80D2A1                                       ;80BFB4|        |80D2A1;
    dw $FFFF                                                   ;80BFB6|        |      ;
    dw PTR16_80FFFF                                            ;80BFB8|        |80FFFF;
    dw subUnknown_80D344                                       ;80BFBA|        |80D344;
    dw subUnknown_80D402                                       ;80BFBC|        |80D402;
    dw subUnknown_80D4C0                                       ;80BFBE|        |80D4C0;
    dw subUnknown_80D563                                       ;80BFC0|        |80D563;
    dw $FFFF                                                   ;80BFC2|        |      ;
    dw PTR16_80FFFF                                            ;80BFC4|        |80FFFF;
    dw subUnknown_80D606                                       ;80BFC6|        |80D606;
    dw subUnknown_80D6FA                                       ;80BFC8|        |80D6FA;
    dw subUnknown_80D7EE                                       ;80BFCA|        |80D7EE;
    dw subUnknown_80D891                                       ;80BFCC|        |80D891;
    dw $FFFF                                                   ;80BFCE|        |      ;
    dw PTR16_80FFFF                                            ;80BFD0|        |80FFFF;
    dw subUnknown_80D934                                       ;80BFD2|        |80D934;
    dw subUnknown_80D96B                                       ;80BFD4|        |80D96B;
    dw subUnknown_80D9A2                                       ;80BFD6|        |80D9A2;
    dw subUnknown_80D9D9                                       ;80BFD8|        |80D9D9;
    dw $FFFF                                                   ;80BFDA|        |      ;
    dw PTR16_80FFFF                                            ;80BFDC|        |80FFFF;
    dw subUnknown_80D934                                       ;80BFDE|        |80D934;
    dw subUnknown_80D96B                                       ;80BFE0|        |80D96B;
    dw subUnknown_80D9A2                                       ;80BFE2|        |80D9A2;
    dw subUnknown_80D9D9                                       ;80BFE4|        |80D9D9;
    dw $FFFF                                                   ;80BFE6|        |      ;
    dw subUnknown_80C792                                       ;80BFE8|        |80C792;
    dw subUnknown_80C792                                       ;80BFEA|        |80C792;
    dw subUnknown_80C792                                       ;80BFEC|        |80C792;
    dw subUnknown_80C792                                       ;80BFEE|        |80C792;
    dw subUnknown_80C792                                       ;80BFF0|        |80C792;
    dw $0001                                                   ;80BFF2|        |      ;
    dw subUnknown_80C792                                       ;80BFF4|        |80C792;
    dw subUnknown_80C792                                       ;80BFF6|        |80C792;
    dw subUnknown_80C792                                       ;80BFF8|        |80C792;
    dw subUnknown_80C792                                       ;80BFFA|        |80C792;
    dw subUnknown_80C792                                       ;80BFFC|        |80C792;
    dw $0001                                                   ;80BFFE|        |      ;
    dw subUnknown_80C792                                       ;80C000|        |80C792;
    dw subUnknown_80C792                                       ;80C002|        |80C792;
    dw subUnknown_80C792                                       ;80C004|        |80C792;
    dw subUnknown_80C792                                       ;80C006|        |80C792;
    dw subUnknown_80C792                                       ;80C008|        |80C792;
    dw $0001                                                   ;80C00A|        |      ;
    dw PTR16_80FFFF                                            ;80C00C|        |80FFFF;
    dw subUnknown_80C7FF                                       ;80C00E|        |80C7FF;
    dw subUnknown_80C7FF                                       ;80C010|        |80C7FF;
    dw subUnknown_80C7FF                                       ;80C012|        |80C7FF;
    dw subUnknown_80C7FF                                       ;80C014|        |80C7FF;
    dw $0001                                                   ;80C016|        |      ;
    dw PTR16_80FFFF                                            ;80C018|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C01A|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C01C|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C01E|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C020|        |80FFFF;
    dw $0001                                                   ;80C022|        |      ;
    dw PTR16_80FFFF                                            ;80C024|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C026|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C028|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C02A|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C02C|        |80FFFF;
    dw $0001                                                   ;80C02E|        |      ;
    dw PTR16_80FFFF                                            ;80C030|        |80FFFF;
    dw subUnknown_80C86C                                       ;80C032|        |80C86C;
    dw subUnknown_80C86C                                       ;80C034|        |80C86C;
    dw subUnknown_80C86C                                       ;80C036|        |80C86C;
    dw subUnknown_80C86C                                       ;80C038|        |80C86C;
    dw $FFFF                                                   ;80C03A|        |      ;
    dw PTR16_80FFFF                                            ;80C03C|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C03E|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C040|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C042|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C044|        |80FFFF;
    dw $0001                                                   ;80C046|        |      ;
    dw PTR16_80FFFF                                            ;80C048|        |80FFFF;
    dw subUnknown_80C945                                       ;80C04A|        |80C945;
    dw subUnknown_80C945                                       ;80C04C|        |80C945;
    dw subUnknown_80C945                                       ;80C04E|        |80C945;
    dw subUnknown_80C945                                       ;80C050|        |80C945;
    dw $0001                                                   ;80C052|        |      ;
    dw PTR16_80FFFF                                            ;80C054|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C056|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C058|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C05A|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C05C|        |80FFFF;
    dw $0001                                                   ;80C05E|        |      ;
    dw PTR16_80FFFF                                            ;80C060|        |80FFFF;
    dw subUnknown_80C9B2                                       ;80C062|        |80C9B2;
    dw subUnknown_80C9B2                                       ;80C064|        |80C9B2;
    dw subUnknown_80C9B2                                       ;80C066|        |80C9B2;
    dw subUnknown_80C9B2                                       ;80C068|        |80C9B2;
    dw $0001                                                   ;80C06A|        |      ;
    dw PTR16_80FFFF                                            ;80C06C|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C06E|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C070|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C072|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C074|        |80FFFF;
    dw $0001                                                   ;80C076|        |      ;
    dw PTR16_80FFFF                                            ;80C078|        |80FFFF;
    dw subUnknown_80DD09                                       ;80C07A|        |80DD09;
    dw subUnknown_80DD09                                       ;80C07C|        |80DD09;
    dw subUnknown_80DD09                                       ;80C07E|        |80DD09;
    dw subUnknown_80DD09                                       ;80C080|        |80DD09;
    dw $0001                                                   ;80C082|        |      ;
    dw PTR16_80FFFF                                            ;80C084|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C086|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C088|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C08A|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C08C|        |80FFFF;
    dw $0001                                                   ;80C08E|        |      ;
    dw PTR16_80FFFF                                            ;80C090|        |80FFFF;
    dw subUnknown_80CA1F                                       ;80C092|        |80CA1F;
    dw subUnknown_80CA1F                                       ;80C094|        |80CA1F;
    dw subUnknown_80CA1F                                       ;80C096|        |80CA1F;
    dw subUnknown_80CA1F                                       ;80C098|        |80CA1F;
    dw $0001                                                   ;80C09A|        |      ;
    dw PTR16_80FFFF                                            ;80C09C|        |80FFFF;
    dw subUnknown_80CA8C                                       ;80C09E|        |80CA8C;
    dw subUnknown_80CA8C                                       ;80C0A0|        |80CA8C;
    dw subUnknown_80CA8C                                       ;80C0A2|        |80CA8C;
    dw subUnknown_80CA8C                                       ;80C0A4|        |80CA8C;
    dw $0001                                                   ;80C0A6|        |      ;
    dw PTR16_80FFFF                                            ;80C0A8|        |80FFFF;
    dw subUnknown_80DB06                                       ;80C0AA|        |80DB06;
    dw subUnknown_80DB06                                       ;80C0AC|        |80DB06;
    dw subUnknown_80DB06                                       ;80C0AE|        |80DB06;
    dw subUnknown_80DB06                                       ;80C0B0|        |80DB06;
    dw $FFFF                                                   ;80C0B2|        |      ;
    dw PTR16_80FFFF                                            ;80C0B4|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C0B6|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C0B8|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C0BA|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C0BC|        |80FFFF;
    dw $FFFF                                                   ;80C0BE|        |      ;
    dw PTR16_80FFFF                                            ;80C0C0|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C0C2|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C0C4|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C0C6|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C0C8|        |80FFFF;
    dw $FFFF                                                   ;80C0CA|        |      ;
    dw PTR16_80FFFF                                            ;80C0CC|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C0CE|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C0D0|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C0D2|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C0D4|        |80FFFF;
    dw $FFFF                                                   ;80C0D6|        |      ;
    dw PTR16_80FFFF                                            ;80C0D8|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C0DA|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C0DC|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C0DE|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C0E0|        |80FFFF;
    dw $FFFF                                                   ;80C0E2|        |      ;
    dw subUnknown_80C6D4                                       ;80C0E4|        |80C6D4;
    dw subUnknown_80C6D4                                       ;80C0E6|        |80C6D4;
    dw subUnknown_80C6D4                                       ;80C0E8|        |80C6D4;
    dw subUnknown_80C6D4                                       ;80C0EA|        |80C6D4;
    dw subUnknown_80C6D4                                       ;80C0EC|        |80C6D4;
    dw $FFFF                                                   ;80C0EE|        |      ;
    dw PTR16_80FFFF                                            ;80C0F0|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C0F2|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C0F4|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C0F6|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C0F8|        |80FFFF;
    dw $FFFF                                                   ;80C0FA|        |      ;
    dw subUnknown_80DA47                                       ;80C0FC|        |80DA47;
    dw subUnknown_80DA47                                       ;80C0FE|        |80DA47;
    dw subUnknown_80DA47                                       ;80C100|        |80DA47;
    dw subUnknown_80DA47                                       ;80C102|        |80DA47;
    dw subUnknown_80DA47                                       ;80C104|        |80DA47;
    dw $FFFF                                                   ;80C106|        |      ;
    dw PTR16_80FFFF                                            ;80C108|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C10A|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C10C|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C10E|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C110|        |80FFFF;
    dw $FFFF                                                   ;80C112|        |      ;
    dw PTR16_80FFFF                                            ;80C114|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C116|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C118|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C11A|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C11C|        |80FFFF;
    dw $FFFF                                                   ;80C11E|        |      ;
    dw PTR16_80FFFF                                            ;80C120|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C122|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C124|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C126|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C128|        |80FFFF;
    dw $FFFF                                                   ;80C12A|        |      ;
    dw PTR16_80FFFF                                            ;80C12C|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C12E|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C130|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C132|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C134|        |80FFFF;
    dw $FFFF                                                   ;80C136|        |      ;
    dw PTR16_80FFFF                                            ;80C138|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C13A|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C13C|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C13E|        |80FFFF;
    dw subUnknown_80DA10                                       ;80C140|        |80DA10;
    dw $FFFF                                                   ;80C142|        |      ;
    dw PTR16_80FFFF                                            ;80C144|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C146|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C148|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C14A|        |80FFFF;
    dw subUnknown_80DA10                                       ;80C14C|        |80DA10;
    dw $FFFF                                                   ;80C14E|        |      ;
    dw PTR16_80FFFF                                            ;80C150|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C152|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C154|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C156|        |80FFFF;
    dw subUnknown_80DA10                                       ;80C158|        |80DA10;
    dw $FFFF                                                   ;80C15A|        |      ;
    dw PTR16_80FFFF                                            ;80C15C|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C15E|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C160|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C162|        |80FFFF;
    dw subUnknown_80DA10                                       ;80C164|        |80DA10;
    dw $FFFF                                                   ;80C166|        |      ;
    dw PTR16_80FFFF                                            ;80C168|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C16A|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C16C|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C16E|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C170|        |80FFFF;
    dw $FFFF                                                   ;80C172|        |      ;
    dw PTR16_80FFFF                                            ;80C174|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C176|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C178|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C17A|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C17C|        |80FFFF;
    dw $FFFF                                                   ;80C17E|        |      ;
    dw PTR16_80FFFF                                            ;80C180|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C182|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C184|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C186|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C188|        |80FFFF;
    dw $FFFF                                                   ;80C18A|        |      ;
    dw PTR16_80FFFF                                            ;80C18C|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C18E|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C190|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C192|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C194|        |80FFFF;
    dw $FFFF                                                   ;80C196|        |      ;
    dw PTR16_80FFFF                                            ;80C198|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C19A|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C19C|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C19E|        |80FFFF;
    dw subUnknown_80DA10                                       ;80C1A0|        |80DA10;
    dw $FFFF                                                   ;80C1A2|        |      ;
    dw PTR16_80FFFF                                            ;80C1A4|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C1A6|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C1A8|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C1AA|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C1AC|        |80FFFF;
    dw $FFFF                                                   ;80C1AE|        |      ;
    dw PTR16_80FFFF                                            ;80C1B0|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C1B2|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C1B4|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C1B6|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C1B8|        |80FFFF;
    dw $FFFF                                                   ;80C1BA|        |      ;
    dw PTR16_80FFFF                                            ;80C1BC|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C1BE|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C1C0|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C1C2|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C1C4|        |80FFFF;
    dw $FFFF                                                   ;80C1C6|        |      ;
    dw PTR16_80FFFF                                            ;80C1C8|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C1CA|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C1CC|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C1CE|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C1D0|        |80FFFF;
    dw $FFFF                                                   ;80C1D2|        |      ;
    dw PTR16_80FFFF                                            ;80C1D4|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C1D6|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C1D8|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C1DA|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C1DC|        |80FFFF;
    dw $FFFF                                                   ;80C1DE|        |      ;
    dw PTR16_80FFFF                                            ;80C1E0|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C1E2|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C1E4|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C1E6|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C1E8|        |80FFFF;
    dw $FFFF                                                   ;80C1EA|        |      ;
    dw PTR16_80FFFF                                            ;80C1EC|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C1EE|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C1F0|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C1F2|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C1F4|        |80FFFF;
    dw $FFFF                                                   ;80C1F6|        |      ;
    dw PTR16_80FFFF                                            ;80C1F8|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C1FA|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C1FC|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C1FE|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C200|        |80FFFF;
    dw $FFFF                                                   ;80C202|        |      ;
    dw PTR16_80FFFF                                            ;80C204|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C206|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C208|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C20A|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C20C|        |80FFFF;
    dw $FFFF                                                   ;80C20E|        |      ;
    dw PTR16_80FFFF                                            ;80C210|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C212|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C214|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C216|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C218|        |80FFFF;
    dw $FFFF                                                   ;80C21A|        |      ;
    dw PTR16_80FFFF                                            ;80C21C|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C21E|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C220|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C222|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C224|        |80FFFF;
    dw $FFFF                                                   ;80C226|        |      ;
    dw PTR16_80FFFF                                            ;80C228|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C22A|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C22C|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C22E|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C230|        |80FFFF;
    dw $FFFF                                                   ;80C232|        |      ;
    dw PTR16_80FFFF                                            ;80C234|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C236|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C238|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C23A|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C23C|        |80FFFF;
    dw $FFFF                                                   ;80C23E|        |      ;
    dw PTR16_80FFFF                                            ;80C240|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C242|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C244|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C246|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C248|        |80FFFF;
    dw $FFFF                                                   ;80C24A|        |      ;
    dw PTR16_80FFFF                                            ;80C24C|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C24E|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C250|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C252|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C254|        |80FFFF;
    dw $FFFF                                                   ;80C256|        |      ;
    dw PTR16_80FFFF                                            ;80C258|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C25A|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C25C|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C25E|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C260|        |80FFFF;
    dw $FFFF                                                   ;80C262|        |      ;
    dw PTR16_80FFFF                                            ;80C264|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C266|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C268|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C26A|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C26C|        |80FFFF;
    dw $FFFF                                                   ;80C26E|        |      ;
    dw PTR16_80FFFF                                            ;80C270|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C272|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C274|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C276|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C278|        |80FFFF;
    dw $FFFF                                                   ;80C27A|        |      ;
    dw PTR16_80FFFF                                            ;80C27C|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C27E|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C280|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C282|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C284|        |80FFFF;
    dw $FFFF                                                   ;80C286|        |      ;
    dw PTR16_80FFFF                                            ;80C288|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C28A|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C28C|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C28E|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C290|        |80FFFF;
    dw $FFFF                                                   ;80C292|        |      ;
    dw PTR16_80FFFF                                            ;80C294|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C296|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C298|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C29A|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C29C|        |80FFFF;
    dw $FFFF                                                   ;80C29E|        |      ;
    dw PTR16_80FFFF                                            ;80C2A0|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C2A2|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C2A4|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C2A6|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C2A8|        |80FFFF;
    dw $FFFF                                                   ;80C2AA|        |      ;
    dw PTR16_80FFFF                                            ;80C2AC|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C2AE|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C2B0|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C2B2|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C2B4|        |80FFFF;
    dw $FFFF                                                   ;80C2B6|        |      ;
    dw PTR16_80FFFF                                            ;80C2B8|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C2BA|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C2BC|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C2BE|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C2C0|        |80FFFF;
    dw $FFFF                                                   ;80C2C2|        |      ;
    dw PTR16_80FFFF                                            ;80C2C4|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C2C6|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C2C8|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C2CA|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C2CC|        |80FFFF;
    dw $FFFF                                                   ;80C2CE|        |      ;
    dw PTR16_80FFFF                                            ;80C2D0|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C2D2|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C2D4|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C2D6|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C2D8|        |80FFFF;
    dw $FFFF                                                   ;80C2DA|        |      ;
    dw PTR16_80FFFF                                            ;80C2DC|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C2DE|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C2E0|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C2E2|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C2E4|        |80FFFF;
    dw $FFFF                                                   ;80C2E6|        |      ;
    dw PTR16_80FFFF                                            ;80C2E8|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C2EA|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C2EC|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C2EE|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C2F0|        |80FFFF;
    dw $FFFF                                                   ;80C2F2|        |      ;
    dw PTR16_80FFFF                                            ;80C2F4|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C2F6|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C2F8|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C2FA|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C2FC|        |80FFFF;
    dw $FFFF                                                   ;80C2FE|        |      ;
    dw PTR16_80FFFF                                            ;80C300|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C302|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C304|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C306|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C308|        |80FFFF;
    dw $FFFF                                                   ;80C30A|        |      ;
    dw PTR16_80FFFF                                            ;80C30C|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C30E|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C310|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C312|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C314|        |80FFFF;
    dw $FFFF                                                   ;80C316|        |      ;
    dw PTR16_80FFFF                                            ;80C318|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C31A|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C31C|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C31E|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C320|        |80FFFF;
    dw $FFFF                                                   ;80C322|        |      ;
    dw PTR16_80FFFF                                            ;80C324|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C326|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C328|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C32A|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C32C|        |80FFFF;
    dw $FFFF                                                   ;80C32E|        |      ;
    dw PTR16_80FFFF                                            ;80C330|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C332|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C334|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C336|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C338|        |80FFFF;
    dw $FFFF                                                   ;80C33A|        |      ;
    dw PTR16_80FFFF                                            ;80C33C|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C33E|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C340|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C342|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C344|        |80FFFF;
    dw $FFFF                                                   ;80C346|        |      ;
    dw PTR16_80FFFF                                            ;80C348|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C34A|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C34C|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C34E|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C350|        |80FFFF;
    dw $FFFF                                                   ;80C352|        |      ;
    dw PTR16_80FFFF                                            ;80C354|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C356|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C358|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C35A|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C35C|        |80FFFF;
    dw $FFFF                                                   ;80C35E|        |      ;
    dw PTR16_80FFFF                                            ;80C360|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C362|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C364|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C366|        |80FFFF;
    dw PTR16_80FFFF                                            ;80C368|        |80FFFF;
    dw $FFFF                                                   ;80C36A|        |      ;
 
subUnknown_80C36C:
    REP #$20                                                   ;80C36C|C220    |      ;
    SEP #$10                                                   ;80C36E|E210    |      ;
    LDA.W #$DD5B                                               ;80C370|A95BDD  |      ;
    STA.B ptrTemp0x72                                          ;80C373|8572    |000072;
    SEP #$20                                                   ;80C375|E220    |      ;
    LDA.B #$80                                                 ;80C377|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80C379|8574    |000074;
    SEP #$20                                                   ;80C37B|E220    |      ;
    LDA.B #$09                                                 ;80C37D|A909    |      ;
    LDX.B #$04                                                 ;80C37F|A204    |      ;
    LDY.B #$04                                                 ;80C381|A004    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80C383|22488E80|808E48;
    REP #$20                                                   ;80C387|C220    |      ;
    SEP #$10                                                   ;80C389|E210    |      ;
    LDA.W #$DD78                                               ;80C38B|A978DD  |      ;
    STA.B ptrTemp0x72                                          ;80C38E|8572    |000072;
    SEP #$20                                                   ;80C390|E220    |      ;
    LDA.B #$80                                                 ;80C392|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80C394|8574    |000074;
    SEP #$20                                                   ;80C396|E220    |      ;
    LDA.B #$0A                                                 ;80C398|A90A    |      ;
    LDX.B #$05                                                 ;80C39A|A205    |      ;
    LDY.B #$04                                                 ;80C39C|A004    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80C39E|22488E80|808E48;
    REP #$20                                                   ;80C3A2|C220    |      ;
    SEP #$10                                                   ;80C3A4|E210    |      ;
    LDA.W #$DD95                                               ;80C3A6|A995DD  |      ;
    STA.B ptrTemp0x72                                          ;80C3A9|8572    |000072;
    SEP #$20                                                   ;80C3AB|E220    |      ;
    LDA.B #$80                                                 ;80C3AD|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80C3AF|8574    |000074;
    SEP #$20                                                   ;80C3B1|E220    |      ;
    LDA.B #$0B                                                 ;80C3B3|A90B    |      ;
    LDX.B #$06                                                 ;80C3B5|A206    |      ;
    LDY.B #$04                                                 ;80C3B7|A004    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80C3B9|22488E80|808E48;
    REP #$20                                                   ;80C3BD|C220    |      ;
    SEP #$10                                                   ;80C3BF|E210    |      ;
    LDA.W #$DDB2                                               ;80C3C1|A9B2DD  |      ;
    STA.B ptrTemp0x72                                          ;80C3C4|8572    |000072;
    SEP #$20                                                   ;80C3C6|E220    |      ;
    LDA.B #$80                                                 ;80C3C8|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80C3CA|8574    |000074;
    SEP #$20                                                   ;80C3CC|E220    |      ;
    LDA.B #$0C                                                 ;80C3CE|A90C    |      ;
    LDX.B #$07                                                 ;80C3D0|A207    |      ;
    LDY.B #$04                                                 ;80C3D2|A004    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80C3D4|22488E80|808E48;
    RTS                                                        ;80C3D8|60      |      ;
 
 
subUnknown_80C3D9:
    REP #$20                                                   ;80C3D9|C220    |      ;
    SEP #$10                                                   ;80C3DB|E210    |      ;
    LDA.W #$DDCF                                               ;80C3DD|A9CFDD  |      ;
    STA.B ptrTemp0x72                                          ;80C3E0|8572    |000072;
    SEP #$20                                                   ;80C3E2|E220    |      ;
    LDA.B #$80                                                 ;80C3E4|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80C3E6|8574    |000074;
    SEP #$20                                                   ;80C3E8|E220    |      ;
    LDA.B #$09                                                 ;80C3EA|A909    |      ;
    LDX.B #$04                                                 ;80C3EC|A204    |      ;
    LDY.B #$04                                                 ;80C3EE|A004    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80C3F0|22488E80|808E48;
    REP #$20                                                   ;80C3F4|C220    |      ;
    SEP #$10                                                   ;80C3F6|E210    |      ;
    LDA.W #$DDEC                                               ;80C3F8|A9ECDD  |      ;
    STA.B ptrTemp0x72                                          ;80C3FB|8572    |000072;
    SEP #$20                                                   ;80C3FD|E220    |      ;
    LDA.B #$80                                                 ;80C3FF|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80C401|8574    |000074;
    SEP #$20                                                   ;80C403|E220    |      ;
    LDA.B #$0A                                                 ;80C405|A90A    |      ;
    LDX.B #$05                                                 ;80C407|A205    |      ;
    LDY.B #$04                                                 ;80C409|A004    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80C40B|22488E80|808E48;
    REP #$20                                                   ;80C40F|C220    |      ;
    SEP #$10                                                   ;80C411|E210    |      ;
    LDA.W #$DE09                                               ;80C413|A909DE  |      ;
    STA.B ptrTemp0x72                                          ;80C416|8572    |000072;
    SEP #$20                                                   ;80C418|E220    |      ;
    LDA.B #$80                                                 ;80C41A|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80C41C|8574    |000074;
    SEP #$20                                                   ;80C41E|E220    |      ;
    LDA.B #$0B                                                 ;80C420|A90B    |      ;
    LDX.B #$06                                                 ;80C422|A206    |      ;
    LDY.B #$04                                                 ;80C424|A004    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80C426|22488E80|808E48;
    REP #$20                                                   ;80C42A|C220    |      ;
    SEP #$10                                                   ;80C42C|E210    |      ;
    LDA.W #$DE26                                               ;80C42E|A926DE  |      ;
    STA.B ptrTemp0x72                                          ;80C431|8572    |000072;
    SEP #$20                                                   ;80C433|E220    |      ;
    LDA.B #$80                                                 ;80C435|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80C437|8574    |000074;
    SEP #$20                                                   ;80C439|E220    |      ;
    LDA.B #$0C                                                 ;80C43B|A90C    |      ;
    LDX.B #$07                                                 ;80C43D|A207    |      ;
    LDY.B #$04                                                 ;80C43F|A004    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80C441|22488E80|808E48;
    RTS                                                        ;80C445|60      |      ;
 
 
subUnknown_80C446:
    REP #$20                                                   ;80C446|C220    |      ;
    SEP #$10                                                   ;80C448|E210    |      ;
    LDA.W #$DE43                                               ;80C44A|A943DE  |      ;
    STA.B ptrTemp0x72                                          ;80C44D|8572    |000072;
    SEP #$20                                                   ;80C44F|E220    |      ;
    LDA.B #$80                                                 ;80C451|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80C453|8574    |000074;
    SEP #$20                                                   ;80C455|E220    |      ;
    LDA.B #$09                                                 ;80C457|A909    |      ;
    LDX.B #$04                                                 ;80C459|A204    |      ;
    LDY.B #$04                                                 ;80C45B|A004    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80C45D|22488E80|808E48;
    REP #$20                                                   ;80C461|C220    |      ;
    SEP #$10                                                   ;80C463|E210    |      ;
    LDA.W #$DE60                                               ;80C465|A960DE  |      ;
    STA.B ptrTemp0x72                                          ;80C468|8572    |000072;
    SEP #$20                                                   ;80C46A|E220    |      ;
    LDA.B #$80                                                 ;80C46C|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80C46E|8574    |000074;
    SEP #$20                                                   ;80C470|E220    |      ;
    LDA.B #$0A                                                 ;80C472|A90A    |      ;
    LDX.B #$05                                                 ;80C474|A205    |      ;
    LDY.B #$04                                                 ;80C476|A004    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80C478|22488E80|808E48;
    REP #$20                                                   ;80C47C|C220    |      ;
    SEP #$10                                                   ;80C47E|E210    |      ;
    LDA.W #$DE7D                                               ;80C480|A97DDE  |      ;
    STA.B ptrTemp0x72                                          ;80C483|8572    |000072;
    SEP #$20                                                   ;80C485|E220    |      ;
    LDA.B #$80                                                 ;80C487|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80C489|8574    |000074;
    SEP #$20                                                   ;80C48B|E220    |      ;
    LDA.B #$0B                                                 ;80C48D|A90B    |      ;
    LDX.B #$06                                                 ;80C48F|A206    |      ;
    LDY.B #$04                                                 ;80C491|A004    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80C493|22488E80|808E48;
    REP #$20                                                   ;80C497|C220    |      ;
    SEP #$10                                                   ;80C499|E210    |      ;
    LDA.W #$DE9A                                               ;80C49B|A99ADE  |      ;
    STA.B ptrTemp0x72                                          ;80C49E|8572    |000072;
    SEP #$20                                                   ;80C4A0|E220    |      ;
    LDA.B #$80                                                 ;80C4A2|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80C4A4|8574    |000074;
    SEP #$20                                                   ;80C4A6|E220    |      ;
    LDA.B #$0C                                                 ;80C4A8|A90C    |      ;
    LDX.B #$07                                                 ;80C4AA|A207    |      ;
    LDY.B #$04                                                 ;80C4AC|A004    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80C4AE|22488E80|808E48;
    RTS                                                        ;80C4B2|60      |      ;
 
 
subUnknown_80C4B3:
    REP #$20                                                   ;80C4B3|C220    |      ;
    SEP #$10                                                   ;80C4B5|E210    |      ;
    LDA.W #$DEB7                                               ;80C4B7|A9B7DE  |      ;
    STA.B ptrTemp0x72                                          ;80C4BA|8572    |000072;
    SEP #$20                                                   ;80C4BC|E220    |      ;
    LDA.B #$80                                                 ;80C4BE|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80C4C0|8574    |000074;
    SEP #$20                                                   ;80C4C2|E220    |      ;
    LDA.B #$09                                                 ;80C4C4|A909    |      ;
    LDX.B #$04                                                 ;80C4C6|A204    |      ;
    LDY.B #$04                                                 ;80C4C8|A004    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80C4CA|22488E80|808E48;
    REP #$20                                                   ;80C4CE|C220    |      ;
    SEP #$10                                                   ;80C4D0|E210    |      ;
    LDA.W #$DED4                                               ;80C4D2|A9D4DE  |      ;
    STA.B ptrTemp0x72                                          ;80C4D5|8572    |000072;
    SEP #$20                                                   ;80C4D7|E220    |      ;
    LDA.B #$80                                                 ;80C4D9|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80C4DB|8574    |000074;
    SEP #$20                                                   ;80C4DD|E220    |      ;
    LDA.B #$0A                                                 ;80C4DF|A90A    |      ;
    LDX.B #$05                                                 ;80C4E1|A205    |      ;
    LDY.B #$04                                                 ;80C4E3|A004    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80C4E5|22488E80|808E48;
    REP #$20                                                   ;80C4E9|C220    |      ;
    SEP #$10                                                   ;80C4EB|E210    |      ;
    LDA.W #$DEF1                                               ;80C4ED|A9F1DE  |      ;
    STA.B ptrTemp0x72                                          ;80C4F0|8572    |000072;
    SEP #$20                                                   ;80C4F2|E220    |      ;
    LDA.B #$80                                                 ;80C4F4|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80C4F6|8574    |000074;
    SEP #$20                                                   ;80C4F8|E220    |      ;
    LDA.B #$0B                                                 ;80C4FA|A90B    |      ;
    LDX.B #$06                                                 ;80C4FC|A206    |      ;
    LDY.B #$04                                                 ;80C4FE|A004    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80C500|22488E80|808E48;
    REP #$20                                                   ;80C504|C220    |      ;
    SEP #$10                                                   ;80C506|E210    |      ;
    LDA.W #$DF0E                                               ;80C508|A90EDF  |      ;
    STA.B ptrTemp0x72                                          ;80C50B|8572    |000072;
    SEP #$20                                                   ;80C50D|E220    |      ;
    LDA.B #$80                                                 ;80C50F|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80C511|8574    |000074;
    SEP #$20                                                   ;80C513|E220    |      ;
    LDA.B #$0C                                                 ;80C515|A90C    |      ;
    LDX.B #$07                                                 ;80C517|A207    |      ;
    LDY.B #$04                                                 ;80C519|A004    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80C51B|22488E80|808E48;
    RTS                                                        ;80C51F|60      |      ;
 
 
subUnknown_80C520:
    REP #$20                                                   ;80C520|C220    |      ;
    SEP #$10                                                   ;80C522|E210    |      ;
    LDA.W #$DF2B                                               ;80C524|A92BDF  |      ;
    STA.B ptrTemp0x72                                          ;80C527|8572    |000072;
    SEP #$20                                                   ;80C529|E220    |      ;
    LDA.B #$80                                                 ;80C52B|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80C52D|8574    |000074;
    SEP #$20                                                   ;80C52F|E220    |      ;
    LDA.B #$09                                                 ;80C531|A909    |      ;
    LDX.B #$04                                                 ;80C533|A204    |      ;
    LDY.B #$04                                                 ;80C535|A004    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80C537|22488E80|808E48;
    REP #$20                                                   ;80C53B|C220    |      ;
    SEP #$10                                                   ;80C53D|E210    |      ;
    LDA.W #$DF48                                               ;80C53F|A948DF  |      ;
    STA.B ptrTemp0x72                                          ;80C542|8572    |000072;
    SEP #$20                                                   ;80C544|E220    |      ;
    LDA.B #$80                                                 ;80C546|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80C548|8574    |000074;
    SEP #$20                                                   ;80C54A|E220    |      ;
    LDA.B #$0A                                                 ;80C54C|A90A    |      ;
    LDX.B #$05                                                 ;80C54E|A205    |      ;
    LDY.B #$04                                                 ;80C550|A004    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80C552|22488E80|808E48;
    REP #$20                                                   ;80C556|C220    |      ;
    SEP #$10                                                   ;80C558|E210    |      ;
    LDA.W #$DF65                                               ;80C55A|A965DF  |      ;
    STA.B ptrTemp0x72                                          ;80C55D|8572    |000072;
    SEP #$20                                                   ;80C55F|E220    |      ;
    LDA.B #$80                                                 ;80C561|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80C563|8574    |000074;
    SEP #$20                                                   ;80C565|E220    |      ;
    LDA.B #$0B                                                 ;80C567|A90B    |      ;
    LDX.B #$06                                                 ;80C569|A206    |      ;
    LDY.B #$04                                                 ;80C56B|A004    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80C56D|22488E80|808E48;
    REP #$20                                                   ;80C571|C220    |      ;
    SEP #$10                                                   ;80C573|E210    |      ;
    LDA.W #$DF82                                               ;80C575|A982DF  |      ;
    STA.B ptrTemp0x72                                          ;80C578|8572    |000072;
    SEP #$20                                                   ;80C57A|E220    |      ;
    LDA.B #$80                                                 ;80C57C|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80C57E|8574    |000074;
    SEP #$20                                                   ;80C580|E220    |      ;
    LDA.B #$0C                                                 ;80C582|A90C    |      ;
    LDX.B #$07                                                 ;80C584|A207    |      ;
    LDY.B #$04                                                 ;80C586|A004    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80C588|22488E80|808E48;
    RTS                                                        ;80C58C|60      |      ;
 
 
subUnknown_80C58D:
    REP #$20                                                   ;80C58D|C220    |      ;
    SEP #$10                                                   ;80C58F|E210    |      ;
    LDA.W #$DF9F                                               ;80C591|A99FDF  |      ;
    STA.B ptrTemp0x72                                          ;80C594|8572    |000072;
    SEP #$20                                                   ;80C596|E220    |      ;
    LDA.B #$80                                                 ;80C598|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80C59A|8574    |000074;
    SEP #$20                                                   ;80C59C|E220    |      ;
    LDA.B #$09                                                 ;80C59E|A909    |      ;
    LDX.B #$04                                                 ;80C5A0|A204    |      ;
    LDY.B #$04                                                 ;80C5A2|A004    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80C5A4|22488E80|808E48;
    REP #$20                                                   ;80C5A8|C220    |      ;
    SEP #$10                                                   ;80C5AA|E210    |      ;
    LDA.W #$DFBC                                               ;80C5AC|A9BCDF  |      ;
    STA.B ptrTemp0x72                                          ;80C5AF|8572    |000072;
    SEP #$20                                                   ;80C5B1|E220    |      ;
    LDA.B #$80                                                 ;80C5B3|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80C5B5|8574    |000074;
    SEP #$20                                                   ;80C5B7|E220    |      ;
    LDA.B #$0A                                                 ;80C5B9|A90A    |      ;
    LDX.B #$05                                                 ;80C5BB|A205    |      ;
    LDY.B #$04                                                 ;80C5BD|A004    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80C5BF|22488E80|808E48;
    REP #$20                                                   ;80C5C3|C220    |      ;
    SEP #$10                                                   ;80C5C5|E210    |      ;
    LDA.W #$DFD9                                               ;80C5C7|A9D9DF  |      ;
    STA.B ptrTemp0x72                                          ;80C5CA|8572    |000072;
    SEP #$20                                                   ;80C5CC|E220    |      ;
    LDA.B #$80                                                 ;80C5CE|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80C5D0|8574    |000074;
    SEP #$20                                                   ;80C5D2|E220    |      ;
    LDA.B #$0B                                                 ;80C5D4|A90B    |      ;
    LDX.B #$06                                                 ;80C5D6|A206    |      ;
    LDY.B #$04                                                 ;80C5D8|A004    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80C5DA|22488E80|808E48;
    REP #$20                                                   ;80C5DE|C220    |      ;
    SEP #$10                                                   ;80C5E0|E210    |      ;
    LDA.W #$DFF6                                               ;80C5E2|A9F6DF  |      ;
    STA.B ptrTemp0x72                                          ;80C5E5|8572    |000072;
    SEP #$20                                                   ;80C5E7|E220    |      ;
    LDA.B #$80                                                 ;80C5E9|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80C5EB|8574    |000074;
    SEP #$20                                                   ;80C5ED|E220    |      ;
    LDA.B #$0C                                                 ;80C5EF|A90C    |      ;
    LDX.B #$07                                                 ;80C5F1|A207    |      ;
    LDY.B #$04                                                 ;80C5F3|A004    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80C5F5|22488E80|808E48;
    RTS                                                        ;80C5F9|60      |      ;
 
 
subUnknown_80C5FA:
    REP #$20                                                   ;80C5FA|C220    |      ;
    SEP #$10                                                   ;80C5FC|E210    |      ;
    LDA.W #$E013                                               ;80C5FE|A913E0  |      ;
    STA.B ptrTemp0x72                                          ;80C601|8572    |000072;
    SEP #$20                                                   ;80C603|E220    |      ;
    LDA.B #$80                                                 ;80C605|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80C607|8574    |000074;
    SEP #$20                                                   ;80C609|E220    |      ;
    LDA.B #$09                                                 ;80C60B|A909    |      ;
    LDX.B #$04                                                 ;80C60D|A204    |      ;
    LDY.B #$04                                                 ;80C60F|A004    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80C611|22488E80|808E48;
    REP #$20                                                   ;80C615|C220    |      ;
    SEP #$10                                                   ;80C617|E210    |      ;
    LDA.W #$E030                                               ;80C619|A930E0  |      ;
    STA.B ptrTemp0x72                                          ;80C61C|8572    |000072;
    SEP #$20                                                   ;80C61E|E220    |      ;
    LDA.B #$80                                                 ;80C620|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80C622|8574    |000074;
    SEP #$20                                                   ;80C624|E220    |      ;
    LDA.B #$0A                                                 ;80C626|A90A    |      ;
    LDX.B #$05                                                 ;80C628|A205    |      ;
    LDY.B #$04                                                 ;80C62A|A004    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80C62C|22488E80|808E48;
    REP #$20                                                   ;80C630|C220    |      ;
    SEP #$10                                                   ;80C632|E210    |      ;
    LDA.W #$E04D                                               ;80C634|A94DE0  |      ;
    STA.B ptrTemp0x72                                          ;80C637|8572    |000072;
    SEP #$20                                                   ;80C639|E220    |      ;
    LDA.B #$80                                                 ;80C63B|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80C63D|8574    |000074;
    SEP #$20                                                   ;80C63F|E220    |      ;
    LDA.B #$0B                                                 ;80C641|A90B    |      ;
    LDX.B #$06                                                 ;80C643|A206    |      ;
    LDY.B #$04                                                 ;80C645|A004    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80C647|22488E80|808E48;
    REP #$20                                                   ;80C64B|C220    |      ;
    SEP #$10                                                   ;80C64D|E210    |      ;
    LDA.W #$E06A                                               ;80C64F|A96AE0  |      ;
    STA.B ptrTemp0x72                                          ;80C652|8572    |000072;
    SEP #$20                                                   ;80C654|E220    |      ;
    LDA.B #$80                                                 ;80C656|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80C658|8574    |000074;
    SEP #$20                                                   ;80C65A|E220    |      ;
    LDA.B #$0C                                                 ;80C65C|A90C    |      ;
    LDX.B #$07                                                 ;80C65E|A207    |      ;
    LDY.B #$04                                                 ;80C660|A004    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80C662|22488E80|808E48;
    RTS                                                        ;80C666|60      |      ;
 
 
subUnknown_80C667:
    REP #$20                                                   ;80C667|C220    |      ;
    SEP #$10                                                   ;80C669|E210    |      ;
    LDA.W #$E087                                               ;80C66B|A987E0  |      ;
    STA.B ptrTemp0x72                                          ;80C66E|8572    |000072;
    SEP #$20                                                   ;80C670|E220    |      ;
    LDA.B #$80                                                 ;80C672|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80C674|8574    |000074;
    SEP #$20                                                   ;80C676|E220    |      ;
    LDA.B #$09                                                 ;80C678|A909    |      ;
    LDX.B #$04                                                 ;80C67A|A204    |      ;
    LDY.B #$04                                                 ;80C67C|A004    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80C67E|22488E80|808E48;
    REP #$20                                                   ;80C682|C220    |      ;
    SEP #$10                                                   ;80C684|E210    |      ;
    LDA.W #$E0A4                                               ;80C686|A9A4E0  |      ;
    STA.B ptrTemp0x72                                          ;80C689|8572    |000072;
    SEP #$20                                                   ;80C68B|E220    |      ;
    LDA.B #$80                                                 ;80C68D|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80C68F|8574    |000074;
    SEP #$20                                                   ;80C691|E220    |      ;
    LDA.B #$0A                                                 ;80C693|A90A    |      ;
    LDX.B #$05                                                 ;80C695|A205    |      ;
    LDY.B #$04                                                 ;80C697|A004    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80C699|22488E80|808E48;
    REP #$20                                                   ;80C69D|C220    |      ;
    SEP #$10                                                   ;80C69F|E210    |      ;
    LDA.W #$E0C1                                               ;80C6A1|A9C1E0  |      ;
    STA.B ptrTemp0x72                                          ;80C6A4|8572    |000072;
    SEP #$20                                                   ;80C6A6|E220    |      ;
    LDA.B #$80                                                 ;80C6A8|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80C6AA|8574    |000074;
    SEP #$20                                                   ;80C6AC|E220    |      ;
    LDA.B #$0B                                                 ;80C6AE|A90B    |      ;
    LDX.B #$06                                                 ;80C6B0|A206    |      ;
    LDY.B #$04                                                 ;80C6B2|A004    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80C6B4|22488E80|808E48;
    REP #$20                                                   ;80C6B8|C220    |      ;
    SEP #$10                                                   ;80C6BA|E210    |      ;
    LDA.W #$E0DE                                               ;80C6BC|A9DEE0  |      ;
    STA.B ptrTemp0x72                                          ;80C6BF|8572    |000072;
    SEP #$20                                                   ;80C6C1|E220    |      ;
    LDA.B #$80                                                 ;80C6C3|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80C6C5|8574    |000074;
    SEP #$20                                                   ;80C6C7|E220    |      ;
    LDA.B #$0C                                                 ;80C6C9|A90C    |      ;
    LDX.B #$07                                                 ;80C6CB|A207    |      ;
    LDY.B #$04                                                 ;80C6CD|A004    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80C6CF|22488E80|808E48;
    RTS                                                        ;80C6D3|60      |      ;
 
 
subUnknown_80C6D4:
    REP #$20                                                   ;80C6D4|C220    |      ;
    SEP #$10                                                   ;80C6D6|E210    |      ;
    LDA.W #$E0FB                                               ;80C6D8|A9FBE0  |      ;
    STA.B ptrTemp0x72                                          ;80C6DB|8572    |000072;
    SEP #$20                                                   ;80C6DD|E220    |      ;
    LDA.B #$80                                                 ;80C6DF|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80C6E1|8574    |000074;
    SEP #$20                                                   ;80C6E3|E220    |      ;
    LDA.B #$06                                                 ;80C6E5|A906    |      ;
    LDX.B #$04                                                 ;80C6E7|A204    |      ;
    LDY.B #$02                                                 ;80C6E9|A002    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80C6EB|22488E80|808E48;
    REP #$20                                                   ;80C6EF|C220    |      ;
    SEP #$10                                                   ;80C6F1|E210    |      ;
    LDA.W #$E10C                                               ;80C6F3|A90CE1  |      ;
    STA.B ptrTemp0x72                                          ;80C6F6|8572    |000072;
    SEP #$20                                                   ;80C6F8|E220    |      ;
    LDA.B #$80                                                 ;80C6FA|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80C6FC|8574    |000074;
    SEP #$20                                                   ;80C6FE|E220    |      ;
    LDA.B #$07                                                 ;80C700|A907    |      ;
    LDX.B #$05                                                 ;80C702|A205    |      ;
    LDY.B #$02                                                 ;80C704|A002    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80C706|22488E80|808E48;
    REP #$20                                                   ;80C70A|C220    |      ;
    SEP #$10                                                   ;80C70C|E210    |      ;
    LDA.W #$E11D                                               ;80C70E|A91DE1  |      ;
    STA.B ptrTemp0x72                                          ;80C711|8572    |000072;
    SEP #$20                                                   ;80C713|E220    |      ;
    LDA.B #$80                                                 ;80C715|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80C717|8574    |000074;
    SEP #$20                                                   ;80C719|E220    |      ;
    LDA.B #$0B                                                 ;80C71B|A90B    |      ;
    LDX.B #$06                                                 ;80C71D|A206    |      ;
    LDY.B #$02                                                 ;80C71F|A002    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80C721|22488E80|808E48;
    REP #$20                                                   ;80C725|C220    |      ;
    SEP #$10                                                   ;80C727|E210    |      ;
    LDA.W #$E12E                                               ;80C729|A92EE1  |      ;
    STA.B ptrTemp0x72                                          ;80C72C|8572    |000072;
    SEP #$20                                                   ;80C72E|E220    |      ;
    LDA.B #$80                                                 ;80C730|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80C732|8574    |000074;
    SEP #$20                                                   ;80C734|E220    |      ;
    LDA.B #$0C                                                 ;80C736|A90C    |      ;
    LDX.B #$07                                                 ;80C738|A207    |      ;
    LDY.B #$02                                                 ;80C73A|A002    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80C73C|22488E80|808E48;
    REP #$20                                                   ;80C740|C220    |      ;
    SEP #$10                                                   ;80C742|E210    |      ;
    LDA.W #$E13F                                               ;80C744|A93FE1  |      ;
    STA.B ptrTemp0x72                                          ;80C747|8572    |000072;
    SEP #$20                                                   ;80C749|E220    |      ;
    LDA.B #$80                                                 ;80C74B|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80C74D|8574    |000074;
    SEP #$20                                                   ;80C74F|E220    |      ;
    LDA.B #$0D                                                 ;80C751|A90D    |      ;
    LDX.B #$08                                                 ;80C753|A208    |      ;
    LDY.B #$02                                                 ;80C755|A002    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80C757|22488E80|808E48;
    REP #$20                                                   ;80C75B|C220    |      ;
    SEP #$10                                                   ;80C75D|E210    |      ;
    LDA.W #$E150                                               ;80C75F|A950E1  |      ;
    STA.B ptrTemp0x72                                          ;80C762|8572    |000072;
    SEP #$20                                                   ;80C764|E220    |      ;
    LDA.B #$80                                                 ;80C766|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80C768|8574    |000074;
    SEP #$20                                                   ;80C76A|E220    |      ;
    LDA.B #$0E                                                 ;80C76C|A90E    |      ;
    LDX.B #$09                                                 ;80C76E|A209    |      ;
    LDY.B #$02                                                 ;80C770|A002    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80C772|22488E80|808E48;
    REP #$20                                                   ;80C776|C220    |      ;
    SEP #$10                                                   ;80C778|E210    |      ;
    LDA.W #$E161                                               ;80C77A|A961E1  |      ;
    STA.B ptrTemp0x72                                          ;80C77D|8572    |000072;
    SEP #$20                                                   ;80C77F|E220    |      ;
    LDA.B #$80                                                 ;80C781|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80C783|8574    |000074;
    SEP #$20                                                   ;80C785|E220    |      ;
    LDA.B #$0F                                                 ;80C787|A90F    |      ;
    LDX.B #$0A                                                 ;80C789|A20A    |      ;
    LDY.B #$02                                                 ;80C78B|A002    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80C78D|22488E80|808E48;
    RTS                                                        ;80C791|60      |      ;
 
 
subUnknown_80C792:
    REP #$20                                                   ;80C792|C220    |      ;
    SEP #$10                                                   ;80C794|E210    |      ;
    LDA.W #$E172                                               ;80C796|A972E1  |      ;
    STA.B ptrTemp0x72                                          ;80C799|8572    |000072;
    SEP #$20                                                   ;80C79B|E220    |      ;
    LDA.B #$80                                                 ;80C79D|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80C79F|8574    |000074;
    SEP #$20                                                   ;80C7A1|E220    |      ;
    LDA.B #$02                                                 ;80C7A3|A902    |      ;
    LDX.B #$04                                                 ;80C7A5|A204    |      ;
    LDY.B #$03                                                 ;80C7A7|A003    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80C7A9|22488E80|808E48;
    REP #$20                                                   ;80C7AD|C220    |      ;
    SEP #$10                                                   ;80C7AF|E210    |      ;
    LDA.W #$E17D                                               ;80C7B1|A97DE1  |      ;
    STA.B ptrTemp0x72                                          ;80C7B4|8572    |000072;
    SEP #$20                                                   ;80C7B6|E220    |      ;
    LDA.B #$80                                                 ;80C7B8|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80C7BA|8574    |000074;
    SEP #$20                                                   ;80C7BC|E220    |      ;
    LDA.B #$0D                                                 ;80C7BE|A90D    |      ;
    LDX.B #$05                                                 ;80C7C0|A205    |      ;
    LDY.B #$03                                                 ;80C7C2|A003    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80C7C4|22488E80|808E48;
    REP #$20                                                   ;80C7C8|C220    |      ;
    SEP #$10                                                   ;80C7CA|E210    |      ;
    LDA.W #$E188                                               ;80C7CC|A988E1  |      ;
    STA.B ptrTemp0x72                                          ;80C7CF|8572    |000072;
    SEP #$20                                                   ;80C7D1|E220    |      ;
    LDA.B #$80                                                 ;80C7D3|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80C7D5|8574    |000074;
    SEP #$20                                                   ;80C7D7|E220    |      ;
    LDA.B #$0E                                                 ;80C7D9|A90E    |      ;
    LDX.B #$06                                                 ;80C7DB|A206    |      ;
    LDY.B #$03                                                 ;80C7DD|A003    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80C7DF|22488E80|808E48;
    REP #$20                                                   ;80C7E3|C220    |      ;
    SEP #$10                                                   ;80C7E5|E210    |      ;
    LDA.W #$E193                                               ;80C7E7|A993E1  |      ;
    STA.B ptrTemp0x72                                          ;80C7EA|8572    |000072;
    SEP #$20                                                   ;80C7EC|E220    |      ;
    LDA.B #$80                                                 ;80C7EE|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80C7F0|8574    |000074;
    SEP #$20                                                   ;80C7F2|E220    |      ;
    LDA.B #$0F                                                 ;80C7F4|A90F    |      ;
    LDX.B #$07                                                 ;80C7F6|A207    |      ;
    LDY.B #$03                                                 ;80C7F8|A003    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80C7FA|22488E80|808E48;
    RTS                                                        ;80C7FE|60      |      ;
 
 
subUnknown_80C7FF:
    REP #$20                                                   ;80C7FF|C220    |      ;
    SEP #$10                                                   ;80C801|E210    |      ;
    LDA.W #$E19E                                               ;80C803|A99EE1  |      ;
    STA.B ptrTemp0x72                                          ;80C806|8572    |000072;
    SEP #$20                                                   ;80C808|E220    |      ;
    LDA.B #$80                                                 ;80C80A|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80C80C|8574    |000074;
    SEP #$20                                                   ;80C80E|E220    |      ;
    LDA.B #$07                                                 ;80C810|A907    |      ;
    LDX.B #$04                                                 ;80C812|A204    |      ;
    LDY.B #$01                                                 ;80C814|A001    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80C816|22488E80|808E48;
    REP #$20                                                   ;80C81A|C220    |      ;
    SEP #$10                                                   ;80C81C|E210    |      ;
    LDA.W #$E1A9                                               ;80C81E|A9A9E1  |      ;
    STA.B ptrTemp0x72                                          ;80C821|8572    |000072;
    SEP #$20                                                   ;80C823|E220    |      ;
    LDA.B #$80                                                 ;80C825|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80C827|8574    |000074;
    SEP #$20                                                   ;80C829|E220    |      ;
    LDA.B #$08                                                 ;80C82B|A908    |      ;
    LDX.B #$05                                                 ;80C82D|A205    |      ;
    LDY.B #$01                                                 ;80C82F|A001    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80C831|22488E80|808E48;
    REP #$20                                                   ;80C835|C220    |      ;
    SEP #$10                                                   ;80C837|E210    |      ;
    LDA.W #$E1B4                                               ;80C839|A9B4E1  |      ;
    STA.B ptrTemp0x72                                          ;80C83C|8572    |000072;
    SEP #$20                                                   ;80C83E|E220    |      ;
    LDA.B #$80                                                 ;80C840|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80C842|8574    |000074;
    SEP #$20                                                   ;80C844|E220    |      ;
    LDA.B #$09                                                 ;80C846|A909    |      ;
    LDX.B #$06                                                 ;80C848|A206    |      ;
    LDY.B #$01                                                 ;80C84A|A001    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80C84C|22488E80|808E48;
    REP #$20                                                   ;80C850|C220    |      ;
    SEP #$10                                                   ;80C852|E210    |      ;
    LDA.W #$E1BF                                               ;80C854|A9BFE1  |      ;
    STA.B ptrTemp0x72                                          ;80C857|8572    |000072;
    SEP #$20                                                   ;80C859|E220    |      ;
    LDA.B #$80                                                 ;80C85B|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80C85D|8574    |000074;
    SEP #$20                                                   ;80C85F|E220    |      ;
    LDA.B #$09                                                 ;80C861|A909    |      ;
    LDX.B #$07                                                 ;80C863|A207    |      ;
    LDY.B #$02                                                 ;80C865|A002    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80C867|22488E80|808E48;
    RTS                                                        ;80C86B|60      |      ;
 
 
subUnknown_80C86C:
    REP #$20                                                   ;80C86C|C220    |      ;
    SEP #$10                                                   ;80C86E|E210    |      ;
    LDA.W #$E1CA                                               ;80C870|A9CAE1  |      ;
    STA.B ptrTemp0x72                                          ;80C873|8572    |000072;
    SEP #$20                                                   ;80C875|E220    |      ;
    LDA.B #$80                                                 ;80C877|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80C879|8574    |000074;
    SEP #$20                                                   ;80C87B|E220    |      ;
    LDA.B #$01                                                 ;80C87D|A901    |      ;
    LDX.B #$04                                                 ;80C87F|A204    |      ;
    LDY.B #$05                                                 ;80C881|A005    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80C883|22488E80|808E48;
    REP #$20                                                   ;80C887|C220    |      ;
    SEP #$10                                                   ;80C889|E210    |      ;
    LDA.W #$E1DB                                               ;80C88B|A9DBE1  |      ;
    STA.B ptrTemp0x72                                          ;80C88E|8572    |000072;
    SEP #$20                                                   ;80C890|E220    |      ;
    LDA.B #$80                                                 ;80C892|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80C894|8574    |000074;
    SEP #$20                                                   ;80C896|E220    |      ;
    LDA.B #$04                                                 ;80C898|A904    |      ;
    LDX.B #$05                                                 ;80C89A|A205    |      ;
    LDY.B #$05                                                 ;80C89C|A005    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80C89E|22488E80|808E48;
    REP #$20                                                   ;80C8A2|C220    |      ;
    SEP #$10                                                   ;80C8A4|E210    |      ;
    LDA.W #$E1EC                                               ;80C8A6|A9ECE1  |      ;
    STA.B ptrTemp0x72                                          ;80C8A9|8572    |000072;
    SEP #$20                                                   ;80C8AB|E220    |      ;
    LDA.B #$80                                                 ;80C8AD|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80C8AF|8574    |000074;
    SEP #$20                                                   ;80C8B1|E220    |      ;
    LDA.B #$07                                                 ;80C8B3|A907    |      ;
    LDX.B #$06                                                 ;80C8B5|A206    |      ;
    LDY.B #$05                                                 ;80C8B7|A005    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80C8B9|22488E80|808E48;
    REP #$20                                                   ;80C8BD|C220    |      ;
    SEP #$10                                                   ;80C8BF|E210    |      ;
    LDA.W #$E1FD                                               ;80C8C1|A9FDE1  |      ;
    STA.B ptrTemp0x72                                          ;80C8C4|8572    |000072;
    SEP #$20                                                   ;80C8C6|E220    |      ;
    LDA.B #$80                                                 ;80C8C8|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80C8CA|8574    |000074;
    SEP #$20                                                   ;80C8CC|E220    |      ;
    LDA.B #$08                                                 ;80C8CE|A908    |      ;
    LDX.B #$07                                                 ;80C8D0|A207    |      ;
    LDY.B #$05                                                 ;80C8D2|A005    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80C8D4|22488E80|808E48;
    REP #$20                                                   ;80C8D8|C220    |      ;
    SEP #$10                                                   ;80C8DA|E210    |      ;
    LDA.W #$E20E                                               ;80C8DC|A90EE2  |      ;
    STA.B ptrTemp0x72                                          ;80C8DF|8572    |000072;
    SEP #$20                                                   ;80C8E1|E220    |      ;
    LDA.B #$80                                                 ;80C8E3|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80C8E5|8574    |000074;
    SEP #$20                                                   ;80C8E7|E220    |      ;
    LDA.B #$09                                                 ;80C8E9|A909    |      ;
    LDX.B #$08                                                 ;80C8EB|A208    |      ;
    LDY.B #$05                                                 ;80C8ED|A005    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80C8EF|22488E80|808E48;
    REP #$20                                                   ;80C8F3|C220    |      ;
    SEP #$10                                                   ;80C8F5|E210    |      ;
    LDA.W #$E21F                                               ;80C8F7|A91FE2  |      ;
    STA.B ptrTemp0x72                                          ;80C8FA|8572    |000072;
    SEP #$20                                                   ;80C8FC|E220    |      ;
    LDA.B #$80                                                 ;80C8FE|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80C900|8574    |000074;
    SEP #$20                                                   ;80C902|E220    |      ;
    LDA.B #$0B                                                 ;80C904|A90B    |      ;
    LDX.B #$09                                                 ;80C906|A209    |      ;
    LDY.B #$05                                                 ;80C908|A005    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80C90A|22488E80|808E48;
    REP #$20                                                   ;80C90E|C220    |      ;
    SEP #$10                                                   ;80C910|E210    |      ;
    LDA.W #$E230                                               ;80C912|A930E2  |      ;
    STA.B ptrTemp0x72                                          ;80C915|8572    |000072;
    SEP #$20                                                   ;80C917|E220    |      ;
    LDA.B #$80                                                 ;80C919|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80C91B|8574    |000074;
    SEP #$20                                                   ;80C91D|E220    |      ;
    LDA.B #$0D                                                 ;80C91F|A90D    |      ;
    LDX.B #$0A                                                 ;80C921|A20A    |      ;
    LDY.B #$05                                                 ;80C923|A005    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80C925|22488E80|808E48;
    REP #$20                                                   ;80C929|C220    |      ;
    SEP #$10                                                   ;80C92B|E210    |      ;
    LDA.W #$E241                                               ;80C92D|A941E2  |      ;
    STA.B ptrTemp0x72                                          ;80C930|8572    |000072;
    SEP #$20                                                   ;80C932|E220    |      ;
    LDA.B #$80                                                 ;80C934|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80C936|8574    |000074;
    SEP #$20                                                   ;80C938|E220    |      ;
    LDA.B #$0E                                                 ;80C93A|A90E    |      ;
    LDX.B #$0B                                                 ;80C93C|A20B    |      ;
    LDY.B #$05                                                 ;80C93E|A005    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80C940|22488E80|808E48;
    RTS                                                        ;80C944|60      |      ;
 
 
subUnknown_80C945:
    REP #$20                                                   ;80C945|C220    |      ;
    SEP #$10                                                   ;80C947|E210    |      ;
    LDA.W #$E252                                               ;80C949|A952E2  |      ;
    STA.B ptrTemp0x72                                          ;80C94C|8572    |000072;
    SEP #$20                                                   ;80C94E|E220    |      ;
    LDA.B #$80                                                 ;80C950|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80C952|8574    |000074;
    SEP #$20                                                   ;80C954|E220    |      ;
    LDA.B #$08                                                 ;80C956|A908    |      ;
    LDX.B #$04                                                 ;80C958|A204    |      ;
    LDY.B #$01                                                 ;80C95A|A001    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80C95C|22488E80|808E48;
    REP #$20                                                   ;80C960|C220    |      ;
    SEP #$10                                                   ;80C962|E210    |      ;
    LDA.W #$E25D                                               ;80C964|A95DE2  |      ;
    STA.B ptrTemp0x72                                          ;80C967|8572    |000072;
    SEP #$20                                                   ;80C969|E220    |      ;
    LDA.B #$80                                                 ;80C96B|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80C96D|8574    |000074;
    SEP #$20                                                   ;80C96F|E220    |      ;
    LDA.B #$0B                                                 ;80C971|A90B    |      ;
    LDX.B #$05                                                 ;80C973|A205    |      ;
    LDY.B #$01                                                 ;80C975|A001    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80C977|22488E80|808E48;
    REP #$20                                                   ;80C97B|C220    |      ;
    SEP #$10                                                   ;80C97D|E210    |      ;
    LDA.W #$E268                                               ;80C97F|A968E2  |      ;
    STA.B ptrTemp0x72                                          ;80C982|8572    |000072;
    SEP #$20                                                   ;80C984|E220    |      ;
    LDA.B #$80                                                 ;80C986|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80C988|8574    |000074;
    SEP #$20                                                   ;80C98A|E220    |      ;
    LDA.B #$0C                                                 ;80C98C|A90C    |      ;
    LDX.B #$06                                                 ;80C98E|A206    |      ;
    LDY.B #$01                                                 ;80C990|A001    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80C992|22488E80|808E48;
    REP #$20                                                   ;80C996|C220    |      ;
    SEP #$10                                                   ;80C998|E210    |      ;
    LDA.W #$E273                                               ;80C99A|A973E2  |      ;
    STA.B ptrTemp0x72                                          ;80C99D|8572    |000072;
    SEP #$20                                                   ;80C99F|E220    |      ;
    LDA.B #$80                                                 ;80C9A1|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80C9A3|8574    |000074;
    SEP #$20                                                   ;80C9A5|E220    |      ;
    LDA.B #$0D                                                 ;80C9A7|A90D    |      ;
    LDX.B #$07                                                 ;80C9A9|A207    |      ;
    LDY.B #$01                                                 ;80C9AB|A001    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80C9AD|22488E80|808E48;
    RTS                                                        ;80C9B1|60      |      ;
 
 
subUnknown_80C9B2:
    REP #$20                                                   ;80C9B2|C220    |      ;
    SEP #$10                                                   ;80C9B4|E210    |      ;
    LDA.W #$E27E                                               ;80C9B6|A97EE2  |      ;
    STA.B ptrTemp0x72                                          ;80C9B9|8572    |000072;
    SEP #$20                                                   ;80C9BB|E220    |      ;
    LDA.B #$80                                                 ;80C9BD|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80C9BF|8574    |000074;
    SEP #$20                                                   ;80C9C1|E220    |      ;
    LDA.B #$07                                                 ;80C9C3|A907    |      ;
    LDX.B #$04                                                 ;80C9C5|A204    |      ;
    LDY.B #$02                                                 ;80C9C7|A002    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80C9C9|22488E80|808E48;
    REP #$20                                                   ;80C9CD|C220    |      ;
    SEP #$10                                                   ;80C9CF|E210    |      ;
    LDA.W #$E289                                               ;80C9D1|A989E2  |      ;
    STA.B ptrTemp0x72                                          ;80C9D4|8572    |000072;
    SEP #$20                                                   ;80C9D6|E220    |      ;
    LDA.B #$80                                                 ;80C9D8|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80C9DA|8574    |000074;
    SEP #$20                                                   ;80C9DC|E220    |      ;
    LDA.B #$08                                                 ;80C9DE|A908    |      ;
    LDX.B #$05                                                 ;80C9E0|A205    |      ;
    LDY.B #$02                                                 ;80C9E2|A002    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80C9E4|22488E80|808E48;
    REP #$20                                                   ;80C9E8|C220    |      ;
    SEP #$10                                                   ;80C9EA|E210    |      ;
    LDA.W #$E294                                               ;80C9EC|A994E2  |      ;
    STA.B ptrTemp0x72                                          ;80C9EF|8572    |000072;
    SEP #$20                                                   ;80C9F1|E220    |      ;
    LDA.B #$80                                                 ;80C9F3|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80C9F5|8574    |000074;
    SEP #$20                                                   ;80C9F7|E220    |      ;
    LDA.B #$0D                                                 ;80C9F9|A90D    |      ;
    LDX.B #$06                                                 ;80C9FB|A206    |      ;
    LDY.B #$02                                                 ;80C9FD|A002    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80C9FF|22488E80|808E48;
    REP #$20                                                   ;80CA03|C220    |      ;
    SEP #$10                                                   ;80CA05|E210    |      ;
    LDA.W #$E29F                                               ;80CA07|A99FE2  |      ;
    STA.B ptrTemp0x72                                          ;80CA0A|8572    |000072;
    SEP #$20                                                   ;80CA0C|E220    |      ;
    LDA.B #$80                                                 ;80CA0E|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80CA10|8574    |000074;
    SEP #$20                                                   ;80CA12|E220    |      ;
    LDA.B #$0E                                                 ;80CA14|A90E    |      ;
    LDX.B #$07                                                 ;80CA16|A207    |      ;
    LDY.B #$02                                                 ;80CA18|A002    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80CA1A|22488E80|808E48;
    RTS                                                        ;80CA1E|60      |      ;
 
 
subUnknown_80CA1F:
    REP #$20                                                   ;80CA1F|C220    |      ;
    SEP #$10                                                   ;80CA21|E210    |      ;
    LDA.W #$E2AA                                               ;80CA23|A9AAE2  |      ;
    STA.B ptrTemp0x72                                          ;80CA26|8572    |000072;
    SEP #$20                                                   ;80CA28|E220    |      ;
    LDA.B #$80                                                 ;80CA2A|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80CA2C|8574    |000074;
    SEP #$20                                                   ;80CA2E|E220    |      ;
    LDA.B #$0A                                                 ;80CA30|A90A    |      ;
    LDX.B #$04                                                 ;80CA32|A204    |      ;
    LDY.B #$01                                                 ;80CA34|A001    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80CA36|22488E80|808E48;
    REP #$20                                                   ;80CA3A|C220    |      ;
    SEP #$10                                                   ;80CA3C|E210    |      ;
    LDA.W #$E2B5                                               ;80CA3E|A9B5E2  |      ;
    STA.B ptrTemp0x72                                          ;80CA41|8572    |000072;
    SEP #$20                                                   ;80CA43|E220    |      ;
    LDA.B #$80                                                 ;80CA45|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80CA47|8574    |000074;
    SEP #$20                                                   ;80CA49|E220    |      ;
    LDA.B #$0B                                                 ;80CA4B|A90B    |      ;
    LDX.B #$05                                                 ;80CA4D|A205    |      ;
    LDY.B #$01                                                 ;80CA4F|A001    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80CA51|22488E80|808E48;
    REP #$20                                                   ;80CA55|C220    |      ;
    SEP #$10                                                   ;80CA57|E210    |      ;
    LDA.W #$E2C0                                               ;80CA59|A9C0E2  |      ;
    STA.B ptrTemp0x72                                          ;80CA5C|8572    |000072;
    SEP #$20                                                   ;80CA5E|E220    |      ;
    LDA.B #$80                                                 ;80CA60|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80CA62|8574    |000074;
    SEP #$20                                                   ;80CA64|E220    |      ;
    LDA.B #$0C                                                 ;80CA66|A90C    |      ;
    LDX.B #$06                                                 ;80CA68|A206    |      ;
    LDY.B #$01                                                 ;80CA6A|A001    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80CA6C|22488E80|808E48;
    REP #$20                                                   ;80CA70|C220    |      ;
    SEP #$10                                                   ;80CA72|E210    |      ;
    LDA.W #$E2CB                                               ;80CA74|A9CBE2  |      ;
    STA.B ptrTemp0x72                                          ;80CA77|8572    |000072;
    SEP #$20                                                   ;80CA79|E220    |      ;
    LDA.B #$80                                                 ;80CA7B|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80CA7D|8574    |000074;
    SEP #$20                                                   ;80CA7F|E220    |      ;
    LDA.B #$0D                                                 ;80CA81|A90D    |      ;
    LDX.B #$07                                                 ;80CA83|A207    |      ;
    LDY.B #$01                                                 ;80CA85|A001    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80CA87|22488E80|808E48;
    RTS                                                        ;80CA8B|60      |      ;
 
 
subUnknown_80CA8C:
    REP #$20                                                   ;80CA8C|C220    |      ;
    SEP #$10                                                   ;80CA8E|E210    |      ;
    LDA.W #$E2D6                                               ;80CA90|A9D6E2  |      ;
    STA.B ptrTemp0x72                                          ;80CA93|8572    |000072;
    SEP #$20                                                   ;80CA95|E220    |      ;
    LDA.B #$80                                                 ;80CA97|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80CA99|8574    |000074;
    SEP #$20                                                   ;80CA9B|E220    |      ;
    LDA.B #$0D                                                 ;80CA9D|A90D    |      ;
    LDX.B #$04                                                 ;80CA9F|A204    |      ;
    LDY.B #$02                                                 ;80CAA1|A002    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80CAA3|22488E80|808E48;
    REP #$20                                                   ;80CAA7|C220    |      ;
    SEP #$10                                                   ;80CAA9|E210    |      ;
    LDA.W #$E2E1                                               ;80CAAB|A9E1E2  |      ;
    STA.B ptrTemp0x72                                          ;80CAAE|8572    |000072;
    SEP #$20                                                   ;80CAB0|E220    |      ;
    LDA.B #$80                                                 ;80CAB2|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80CAB4|8574    |000074;
    SEP #$20                                                   ;80CAB6|E220    |      ;
    LDA.B #$0E                                                 ;80CAB8|A90E    |      ;
    LDX.B #$05                                                 ;80CABA|A205    |      ;
    LDY.B #$02                                                 ;80CABC|A002    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80CABE|22488E80|808E48;
    REP #$20                                                   ;80CAC2|C220    |      ;
    SEP #$10                                                   ;80CAC4|E210    |      ;
    LDA.W #$E2EC                                               ;80CAC6|A9ECE2  |      ;
    STA.B ptrTemp0x72                                          ;80CAC9|8572    |000072;
    SEP #$20                                                   ;80CACB|E220    |      ;
    LDA.B #$80                                                 ;80CACD|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80CACF|8574    |000074;
    SEP #$20                                                   ;80CAD1|E220    |      ;
    LDA.B #$0F                                                 ;80CAD3|A90F    |      ;
    LDX.B #$06                                                 ;80CAD5|A206    |      ;
    LDY.B #$02                                                 ;80CAD7|A002    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80CAD9|22488E80|808E48;
    RTS                                                        ;80CADD|60      |      ;
 
 
subUnknown_80CADE:
    REP #$20                                                   ;80CADE|C220    |      ;
    SEP #$10                                                   ;80CAE0|E210    |      ;
    LDA.W #$E2F7                                               ;80CAE2|A9F7E2  |      ;
    STA.B ptrTemp0x72                                          ;80CAE5|8572    |000072;
    SEP #$20                                                   ;80CAE7|E220    |      ;
    LDA.B #$80                                                 ;80CAE9|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80CAEB|8574    |000074;
    SEP #$20                                                   ;80CAED|E220    |      ;
    LDA.B #$06                                                 ;80CAEF|A906    |      ;
    LDX.B #$04                                                 ;80CAF1|A204    |      ;
    LDY.B #$02                                                 ;80CAF3|A002    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80CAF5|22488E80|808E48;
    REP #$20                                                   ;80CAF9|C220    |      ;
    SEP #$10                                                   ;80CAFB|E210    |      ;
    LDA.W #$E305                                               ;80CAFD|A905E3  |      ;
    STA.B ptrTemp0x72                                          ;80CB00|8572    |000072;
    SEP #$20                                                   ;80CB02|E220    |      ;
    LDA.B #$80                                                 ;80CB04|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80CB06|8574    |000074;
    SEP #$20                                                   ;80CB08|E220    |      ;
    LDA.B #$0E                                                 ;80CB0A|A90E    |      ;
    LDX.B #$05                                                 ;80CB0C|A205    |      ;
    LDY.B #$02                                                 ;80CB0E|A002    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80CB10|22488E80|808E48;
    REP #$20                                                   ;80CB14|C220    |      ;
    SEP #$10                                                   ;80CB16|E210    |      ;
    LDA.W #$E313                                               ;80CB18|A913E3  |      ;
    STA.B ptrTemp0x72                                          ;80CB1B|8572    |000072;
    SEP #$20                                                   ;80CB1D|E220    |      ;
    LDA.B #$80                                                 ;80CB1F|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80CB21|8574    |000074;
    SEP #$20                                                   ;80CB23|E220    |      ;
    LDA.B #$0F                                                 ;80CB25|A90F    |      ;
    LDX.B #$06                                                 ;80CB27|A206    |      ;
    LDY.B #$02                                                 ;80CB29|A002    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80CB2B|22488E80|808E48;
    RTS                                                        ;80CB2F|60      |      ;
 
 
subUnknown_80CB30:
    REP #$20                                                   ;80CB30|C220    |      ;
    SEP #$10                                                   ;80CB32|E210    |      ;
    LDA.W #$E321                                               ;80CB34|A921E3  |      ;
    STA.B ptrTemp0x72                                          ;80CB37|8572    |000072;
    SEP #$20                                                   ;80CB39|E220    |      ;
    LDA.B #$80                                                 ;80CB3B|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80CB3D|8574    |000074;
    SEP #$20                                                   ;80CB3F|E220    |      ;
    LDA.B #$06                                                 ;80CB41|A906    |      ;
    LDX.B #$04                                                 ;80CB43|A204    |      ;
    LDY.B #$02                                                 ;80CB45|A002    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80CB47|22488E80|808E48;
    REP #$20                                                   ;80CB4B|C220    |      ;
    SEP #$10                                                   ;80CB4D|E210    |      ;
    LDA.W #$E32F                                               ;80CB4F|A92FE3  |      ;
    STA.B ptrTemp0x72                                          ;80CB52|8572    |000072;
    SEP #$20                                                   ;80CB54|E220    |      ;
    LDA.B #$80                                                 ;80CB56|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80CB58|8574    |000074;
    SEP #$20                                                   ;80CB5A|E220    |      ;
    LDA.B #$0E                                                 ;80CB5C|A90E    |      ;
    LDX.B #$05                                                 ;80CB5E|A205    |      ;
    LDY.B #$02                                                 ;80CB60|A002    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80CB62|22488E80|808E48;
    REP #$20                                                   ;80CB66|C220    |      ;
    SEP #$10                                                   ;80CB68|E210    |      ;
    LDA.W #$E33D                                               ;80CB6A|A93DE3  |      ;
    STA.B ptrTemp0x72                                          ;80CB6D|8572    |000072;
    SEP #$20                                                   ;80CB6F|E220    |      ;
    LDA.B #$80                                                 ;80CB71|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80CB73|8574    |000074;
    SEP #$20                                                   ;80CB75|E220    |      ;
    LDA.B #$0F                                                 ;80CB77|A90F    |      ;
    LDX.B #$06                                                 ;80CB79|A206    |      ;
    LDY.B #$02                                                 ;80CB7B|A002    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80CB7D|22488E80|808E48;
    RTS                                                        ;80CB81|60      |      ;
 
 
subUnknown_80CB82:
    REP #$20                                                   ;80CB82|C220    |      ;
    SEP #$10                                                   ;80CB84|E210    |      ;
    LDA.W #$E34B                                               ;80CB86|A94BE3  |      ;
    STA.B ptrTemp0x72                                          ;80CB89|8572    |000072;
    SEP #$20                                                   ;80CB8B|E220    |      ;
    LDA.B #$80                                                 ;80CB8D|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80CB8F|8574    |000074;
    SEP #$20                                                   ;80CB91|E220    |      ;
    LDA.B #$06                                                 ;80CB93|A906    |      ;
    LDX.B #$04                                                 ;80CB95|A204    |      ;
    LDY.B #$02                                                 ;80CB97|A002    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80CB99|22488E80|808E48;
    REP #$20                                                   ;80CB9D|C220    |      ;
    SEP #$10                                                   ;80CB9F|E210    |      ;
    LDA.W #$E359                                               ;80CBA1|A959E3  |      ;
    STA.B ptrTemp0x72                                          ;80CBA4|8572    |000072;
    SEP #$20                                                   ;80CBA6|E220    |      ;
    LDA.B #$80                                                 ;80CBA8|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80CBAA|8574    |000074;
    SEP #$20                                                   ;80CBAC|E220    |      ;
    LDA.B #$0E                                                 ;80CBAE|A90E    |      ;
    LDX.B #$05                                                 ;80CBB0|A205    |      ;
    LDY.B #$02                                                 ;80CBB2|A002    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80CBB4|22488E80|808E48;
    REP #$20                                                   ;80CBB8|C220    |      ;
    SEP #$10                                                   ;80CBBA|E210    |      ;
    LDA.W #$E367                                               ;80CBBC|A967E3  |      ;
    STA.B ptrTemp0x72                                          ;80CBBF|8572    |000072;
    SEP #$20                                                   ;80CBC1|E220    |      ;
    LDA.B #$80                                                 ;80CBC3|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80CBC5|8574    |000074;
    SEP #$20                                                   ;80CBC7|E220    |      ;
    LDA.B #$0F                                                 ;80CBC9|A90F    |      ;
    LDX.B #$06                                                 ;80CBCB|A206    |      ;
    LDY.B #$02                                                 ;80CBCD|A002    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80CBCF|22488E80|808E48;
    RTS                                                        ;80CBD3|60      |      ;
 
 
subUnknown_80CBD4:
    REP #$20                                                   ;80CBD4|C220    |      ;
    SEP #$10                                                   ;80CBD6|E210    |      ;
    LDA.W #$E375                                               ;80CBD8|A975E3  |      ;
    STA.B ptrTemp0x72                                          ;80CBDB|8572    |000072;
    SEP #$20                                                   ;80CBDD|E220    |      ;
    LDA.B #$80                                                 ;80CBDF|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80CBE1|8574    |000074;
    SEP #$20                                                   ;80CBE3|E220    |      ;
    LDA.B #$06                                                 ;80CBE5|A906    |      ;
    LDX.B #$04                                                 ;80CBE7|A204    |      ;
    LDY.B #$02                                                 ;80CBE9|A002    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80CBEB|22488E80|808E48;
    REP #$20                                                   ;80CBEF|C220    |      ;
    SEP #$10                                                   ;80CBF1|E210    |      ;
    LDA.W #$E383                                               ;80CBF3|A983E3  |      ;
    STA.B ptrTemp0x72                                          ;80CBF6|8572    |000072;
    SEP #$20                                                   ;80CBF8|E220    |      ;
    LDA.B #$80                                                 ;80CBFA|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80CBFC|8574    |000074;
    SEP #$20                                                   ;80CBFE|E220    |      ;
    LDA.B #$0E                                                 ;80CC00|A90E    |      ;
    LDX.B #$05                                                 ;80CC02|A205    |      ;
    LDY.B #$02                                                 ;80CC04|A002    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80CC06|22488E80|808E48;
    REP #$20                                                   ;80CC0A|C220    |      ;
    SEP #$10                                                   ;80CC0C|E210    |      ;
    LDA.W #$E391                                               ;80CC0E|A991E3  |      ;
    STA.B ptrTemp0x72                                          ;80CC11|8572    |000072;
    SEP #$20                                                   ;80CC13|E220    |      ;
    LDA.B #$80                                                 ;80CC15|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80CC17|8574    |000074;
    SEP #$20                                                   ;80CC19|E220    |      ;
    LDA.B #$0F                                                 ;80CC1B|A90F    |      ;
    LDX.B #$06                                                 ;80CC1D|A206    |      ;
    LDY.B #$02                                                 ;80CC1F|A002    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80CC21|22488E80|808E48;
    REP #$20                                                   ;80CC25|C220    |      ;
    SEP #$10                                                   ;80CC27|E210    |      ;
    LDA.W #$E4EF                                               ;80CC29|A9EFE4  |      ;
    STA.B ptrTemp0x72                                          ;80CC2C|8572    |000072;
    SEP #$20                                                   ;80CC2E|E220    |      ;
    LDA.B #$80                                                 ;80CC30|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80CC32|8574    |000074;
    SEP #$20                                                   ;80CC34|E220    |      ;
    LDA.B #$03                                                 ;80CC36|A903    |      ;
    LDX.B #$07                                                 ;80CC38|A207    |      ;
    LDY.B #$02                                                 ;80CC3A|A002    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80CC3C|22488E80|808E48;
    REP #$20                                                   ;80CC40|C220    |      ;
    SEP #$10                                                   ;80CC42|E210    |      ;
    LDA.W #$E500                                               ;80CC44|A900E5  |      ;
    STA.B ptrTemp0x72                                          ;80CC47|8572    |000072;
    SEP #$20                                                   ;80CC49|E220    |      ;
    LDA.B #$80                                                 ;80CC4B|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80CC4D|8574    |000074;
    SEP #$20                                                   ;80CC4F|E220    |      ;
    LDA.B #$04                                                 ;80CC51|A904    |      ;
    LDX.B #$08                                                 ;80CC53|A208    |      ;
    LDY.B #$02                                                 ;80CC55|A002    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80CC57|22488E80|808E48;
    REP #$20                                                   ;80CC5B|C220    |      ;
    SEP #$10                                                   ;80CC5D|E210    |      ;
    LDA.W #$E511                                               ;80CC5F|A911E5  |      ;
    STA.B ptrTemp0x72                                          ;80CC62|8572    |000072;
    SEP #$20                                                   ;80CC64|E220    |      ;
    LDA.B #$80                                                 ;80CC66|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80CC68|8574    |000074;
    SEP #$20                                                   ;80CC6A|E220    |      ;
    LDA.B #$05                                                 ;80CC6C|A905    |      ;
    LDX.B #$09                                                 ;80CC6E|A209    |      ;
    LDY.B #$02                                                 ;80CC70|A002    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80CC72|22488E80|808E48;
    REP #$20                                                   ;80CC76|C220    |      ;
    SEP #$10                                                   ;80CC78|E210    |      ;
    LDA.W #$E522                                               ;80CC7A|A922E5  |      ;
    STA.B ptrTemp0x72                                          ;80CC7D|8572    |000072;
    SEP #$20                                                   ;80CC7F|E220    |      ;
    LDA.B #$80                                                 ;80CC81|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80CC83|8574    |000074;
    SEP #$20                                                   ;80CC85|E220    |      ;
    LDA.B #$07                                                 ;80CC87|A907    |      ;
    LDX.B #$0A                                                 ;80CC89|A20A    |      ;
    LDY.B #$02                                                 ;80CC8B|A002    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80CC8D|22488E80|808E48;
    RTS                                                        ;80CC91|60      |      ;
 
 
subUnknown_80CC92:
    REP #$20                                                   ;80CC92|C220    |      ;
    SEP #$10                                                   ;80CC94|E210    |      ;
    LDA.W #$E39F                                               ;80CC96|A99FE3  |      ;
    STA.B ptrTemp0x72                                          ;80CC99|8572    |000072;
    SEP #$20                                                   ;80CC9B|E220    |      ;
    LDA.B #$80                                                 ;80CC9D|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80CC9F|8574    |000074;
    SEP #$20                                                   ;80CCA1|E220    |      ;
    LDA.B #$06                                                 ;80CCA3|A906    |      ;
    LDX.B #$04                                                 ;80CCA5|A204    |      ;
    LDY.B #$02                                                 ;80CCA7|A002    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80CCA9|22488E80|808E48;
    REP #$20                                                   ;80CCAD|C220    |      ;
    SEP #$10                                                   ;80CCAF|E210    |      ;
    LDA.W #$E3AD                                               ;80CCB1|A9ADE3  |      ;
    STA.B ptrTemp0x72                                          ;80CCB4|8572    |000072;
    SEP #$20                                                   ;80CCB6|E220    |      ;
    LDA.B #$80                                                 ;80CCB8|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80CCBA|8574    |000074;
    SEP #$20                                                   ;80CCBC|E220    |      ;
    LDA.B #$0E                                                 ;80CCBE|A90E    |      ;
    LDX.B #$05                                                 ;80CCC0|A205    |      ;
    LDY.B #$02                                                 ;80CCC2|A002    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80CCC4|22488E80|808E48;
    REP #$20                                                   ;80CCC8|C220    |      ;
    SEP #$10                                                   ;80CCCA|E210    |      ;
    LDA.W #$E3BB                                               ;80CCCC|A9BBE3  |      ;
    STA.B ptrTemp0x72                                          ;80CCCF|8572    |000072;
    SEP #$20                                                   ;80CCD1|E220    |      ;
    LDA.B #$80                                                 ;80CCD3|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80CCD5|8574    |000074;
    SEP #$20                                                   ;80CCD7|E220    |      ;
    LDA.B #$0F                                                 ;80CCD9|A90F    |      ;
    LDX.B #$06                                                 ;80CCDB|A206    |      ;
    LDY.B #$02                                                 ;80CCDD|A002    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80CCDF|22488E80|808E48;
    RTS                                                        ;80CCE3|60      |      ;
 
 
subUnknown_80CCE4:
    REP #$20                                                   ;80CCE4|C220    |      ;
    SEP #$10                                                   ;80CCE6|E210    |      ;
    LDA.W #$E3C9                                               ;80CCE8|A9C9E3  |      ;
    STA.B ptrTemp0x72                                          ;80CCEB|8572    |000072;
    SEP #$20                                                   ;80CCED|E220    |      ;
    LDA.B #$80                                                 ;80CCEF|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80CCF1|8574    |000074;
    SEP #$20                                                   ;80CCF3|E220    |      ;
    LDA.B #$06                                                 ;80CCF5|A906    |      ;
    LDX.B #$04                                                 ;80CCF7|A204    |      ;
    LDY.B #$02                                                 ;80CCF9|A002    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80CCFB|22488E80|808E48;
    REP #$20                                                   ;80CCFF|C220    |      ;
    SEP #$10                                                   ;80CD01|E210    |      ;
    LDA.W #$E3D7                                               ;80CD03|A9D7E3  |      ;
    STA.B ptrTemp0x72                                          ;80CD06|8572    |000072;
    SEP #$20                                                   ;80CD08|E220    |      ;
    LDA.B #$80                                                 ;80CD0A|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80CD0C|8574    |000074;
    SEP #$20                                                   ;80CD0E|E220    |      ;
    LDA.B #$0E                                                 ;80CD10|A90E    |      ;
    LDX.B #$05                                                 ;80CD12|A205    |      ;
    LDY.B #$02                                                 ;80CD14|A002    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80CD16|22488E80|808E48;
    REP #$20                                                   ;80CD1A|C220    |      ;
    SEP #$10                                                   ;80CD1C|E210    |      ;
    LDA.W #$E3E5                                               ;80CD1E|A9E5E3  |      ;
    STA.B ptrTemp0x72                                          ;80CD21|8572    |000072;
    SEP #$20                                                   ;80CD23|E220    |      ;
    LDA.B #$80                                                 ;80CD25|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80CD27|8574    |000074;
    SEP #$20                                                   ;80CD29|E220    |      ;
    LDA.B #$0F                                                 ;80CD2B|A90F    |      ;
    LDX.B #$06                                                 ;80CD2D|A206    |      ;
    LDY.B #$02                                                 ;80CD2F|A002    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80CD31|22488E80|808E48;
    RTS                                                        ;80CD35|60      |      ;
 
 
subUnknown_80CD36:
    REP #$20                                                   ;80CD36|C220    |      ;
    SEP #$10                                                   ;80CD38|E210    |      ;
    LDA.W #$E3F3                                               ;80CD3A|A9F3E3  |      ;
    STA.B ptrTemp0x72                                          ;80CD3D|8572    |000072;
    SEP #$20                                                   ;80CD3F|E220    |      ;
    LDA.B #$80                                                 ;80CD41|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80CD43|8574    |000074;
    SEP #$20                                                   ;80CD45|E220    |      ;
    LDA.B #$06                                                 ;80CD47|A906    |      ;
    LDX.B #$04                                                 ;80CD49|A204    |      ;
    LDY.B #$02                                                 ;80CD4B|A002    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80CD4D|22488E80|808E48;
    REP #$20                                                   ;80CD51|C220    |      ;
    SEP #$10                                                   ;80CD53|E210    |      ;
    LDA.W #$E401                                               ;80CD55|A901E4  |      ;
    STA.B ptrTemp0x72                                          ;80CD58|8572    |000072;
    SEP #$20                                                   ;80CD5A|E220    |      ;
    LDA.B #$80                                                 ;80CD5C|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80CD5E|8574    |000074;
    SEP #$20                                                   ;80CD60|E220    |      ;
    LDA.B #$0E                                                 ;80CD62|A90E    |      ;
    LDX.B #$05                                                 ;80CD64|A205    |      ;
    LDY.B #$02                                                 ;80CD66|A002    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80CD68|22488E80|808E48;
    REP #$20                                                   ;80CD6C|C220    |      ;
    SEP #$10                                                   ;80CD6E|E210    |      ;
    LDA.W #$E40F                                               ;80CD70|A90FE4  |      ;
    STA.B ptrTemp0x72                                          ;80CD73|8572    |000072;
    SEP #$20                                                   ;80CD75|E220    |      ;
    LDA.B #$80                                                 ;80CD77|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80CD79|8574    |000074;
    SEP #$20                                                   ;80CD7B|E220    |      ;
    LDA.B #$0F                                                 ;80CD7D|A90F    |      ;
    LDX.B #$06                                                 ;80CD7F|A206    |      ;
    LDY.B #$02                                                 ;80CD81|A002    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80CD83|22488E80|808E48;
    RTS                                                        ;80CD87|60      |      ;
 
 
subUnknown_80CD88:
    REP #$20                                                   ;80CD88|C220    |      ;
    SEP #$10                                                   ;80CD8A|E210    |      ;
    LDA.W #$E41D                                               ;80CD8C|A91DE4  |      ;
    STA.B ptrTemp0x72                                          ;80CD8F|8572    |000072;
    SEP #$20                                                   ;80CD91|E220    |      ;
    LDA.B #$80                                                 ;80CD93|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80CD95|8574    |000074;
    SEP #$20                                                   ;80CD97|E220    |      ;
    LDA.B #$06                                                 ;80CD99|A906    |      ;
    LDX.B #$04                                                 ;80CD9B|A204    |      ;
    LDY.B #$02                                                 ;80CD9D|A002    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80CD9F|22488E80|808E48;
    REP #$20                                                   ;80CDA3|C220    |      ;
    SEP #$10                                                   ;80CDA5|E210    |      ;
    LDA.W #$E42B                                               ;80CDA7|A92BE4  |      ;
    STA.B ptrTemp0x72                                          ;80CDAA|8572    |000072;
    SEP #$20                                                   ;80CDAC|E220    |      ;
    LDA.B #$80                                                 ;80CDAE|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80CDB0|8574    |000074;
    SEP #$20                                                   ;80CDB2|E220    |      ;
    LDA.B #$0E                                                 ;80CDB4|A90E    |      ;
    LDX.B #$05                                                 ;80CDB6|A205    |      ;
    LDY.B #$02                                                 ;80CDB8|A002    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80CDBA|22488E80|808E48;
    REP #$20                                                   ;80CDBE|C220    |      ;
    SEP #$10                                                   ;80CDC0|E210    |      ;
    LDA.W #$E439                                               ;80CDC2|A939E4  |      ;
    STA.B ptrTemp0x72                                          ;80CDC5|8572    |000072;
    SEP #$20                                                   ;80CDC7|E220    |      ;
    LDA.B #$80                                                 ;80CDC9|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80CDCB|8574    |000074;
    SEP #$20                                                   ;80CDCD|E220    |      ;
    LDA.B #$0F                                                 ;80CDCF|A90F    |      ;
    LDX.B #$06                                                 ;80CDD1|A206    |      ;
    LDY.B #$02                                                 ;80CDD3|A002    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80CDD5|22488E80|808E48;
    REP #$20                                                   ;80CDD9|C220    |      ;
    SEP #$10                                                   ;80CDDB|E210    |      ;
    LDA.W #$E533                                               ;80CDDD|A933E5  |      ;
    STA.B ptrTemp0x72                                          ;80CDE0|8572    |000072;
    SEP #$20                                                   ;80CDE2|E220    |      ;
    LDA.B #$80                                                 ;80CDE4|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80CDE6|8574    |000074;
    SEP #$20                                                   ;80CDE8|E220    |      ;
    LDA.B #$03                                                 ;80CDEA|A903    |      ;
    LDX.B #$07                                                 ;80CDEC|A207    |      ;
    LDY.B #$02                                                 ;80CDEE|A002    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80CDF0|22488E80|808E48;
    REP #$20                                                   ;80CDF4|C220    |      ;
    SEP #$10                                                   ;80CDF6|E210    |      ;
    LDA.W #$E544                                               ;80CDF8|A944E5  |      ;
    STA.B ptrTemp0x72                                          ;80CDFB|8572    |000072;
    SEP #$20                                                   ;80CDFD|E220    |      ;
    LDA.B #$80                                                 ;80CDFF|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80CE01|8574    |000074;
    SEP #$20                                                   ;80CE03|E220    |      ;
    LDA.B #$04                                                 ;80CE05|A904    |      ;
    LDX.B #$08                                                 ;80CE07|A208    |      ;
    LDY.B #$02                                                 ;80CE09|A002    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80CE0B|22488E80|808E48;
    REP #$20                                                   ;80CE0F|C220    |      ;
    SEP #$10                                                   ;80CE11|E210    |      ;
    LDA.W #$E555                                               ;80CE13|A955E5  |      ;
    STA.B ptrTemp0x72                                          ;80CE16|8572    |000072;
    SEP #$20                                                   ;80CE18|E220    |      ;
    LDA.B #$80                                                 ;80CE1A|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80CE1C|8574    |000074;
    SEP #$20                                                   ;80CE1E|E220    |      ;
    LDA.B #$05                                                 ;80CE20|A905    |      ;
    LDX.B #$09                                                 ;80CE22|A209    |      ;
    LDY.B #$02                                                 ;80CE24|A002    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80CE26|22488E80|808E48;
    REP #$20                                                   ;80CE2A|C220    |      ;
    SEP #$10                                                   ;80CE2C|E210    |      ;
    LDA.W #$E566                                               ;80CE2E|A966E5  |      ;
    STA.B ptrTemp0x72                                          ;80CE31|8572    |000072;
    SEP #$20                                                   ;80CE33|E220    |      ;
    LDA.B #$80                                                 ;80CE35|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80CE37|8574    |000074;
    SEP #$20                                                   ;80CE39|E220    |      ;
    LDA.B #$07                                                 ;80CE3B|A907    |      ;
    LDX.B #$0A                                                 ;80CE3D|A20A    |      ;
    LDY.B #$02                                                 ;80CE3F|A002    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80CE41|22488E80|808E48;
    RTS                                                        ;80CE45|60      |      ;
 
 
subUnknown_80CE46:
    REP #$20                                                   ;80CE46|C220    |      ;
    SEP #$10                                                   ;80CE48|E210    |      ;
    LDA.W #$E447                                               ;80CE4A|A947E4  |      ;
    STA.B ptrTemp0x72                                          ;80CE4D|8572    |000072;
    SEP #$20                                                   ;80CE4F|E220    |      ;
    LDA.B #$80                                                 ;80CE51|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80CE53|8574    |000074;
    SEP #$20                                                   ;80CE55|E220    |      ;
    LDA.B #$06                                                 ;80CE57|A906    |      ;
    LDX.B #$04                                                 ;80CE59|A204    |      ;
    LDY.B #$02                                                 ;80CE5B|A002    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80CE5D|22488E80|808E48;
    REP #$20                                                   ;80CE61|C220    |      ;
    SEP #$10                                                   ;80CE63|E210    |      ;
    LDA.W #$E455                                               ;80CE65|A955E4  |      ;
    STA.B ptrTemp0x72                                          ;80CE68|8572    |000072;
    SEP #$20                                                   ;80CE6A|E220    |      ;
    LDA.B #$80                                                 ;80CE6C|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80CE6E|8574    |000074;
    SEP #$20                                                   ;80CE70|E220    |      ;
    LDA.B #$0E                                                 ;80CE72|A90E    |      ;
    LDX.B #$05                                                 ;80CE74|A205    |      ;
    LDY.B #$02                                                 ;80CE76|A002    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80CE78|22488E80|808E48;
    REP #$20                                                   ;80CE7C|C220    |      ;
    SEP #$10                                                   ;80CE7E|E210    |      ;
    LDA.W #$E463                                               ;80CE80|A963E4  |      ;
    STA.B ptrTemp0x72                                          ;80CE83|8572    |000072;
    SEP #$20                                                   ;80CE85|E220    |      ;
    LDA.B #$80                                                 ;80CE87|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80CE89|8574    |000074;
    SEP #$20                                                   ;80CE8B|E220    |      ;
    LDA.B #$0F                                                 ;80CE8D|A90F    |      ;
    LDX.B #$06                                                 ;80CE8F|A206    |      ;
    LDY.B #$02                                                 ;80CE91|A002    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80CE93|22488E80|808E48;
    RTS                                                        ;80CE97|60      |      ;
 
 
subUnknown_80CE98:
    REP #$20                                                   ;80CE98|C220    |      ;
    SEP #$10                                                   ;80CE9A|E210    |      ;
    LDA.W #$E471                                               ;80CE9C|A971E4  |      ;
    STA.B ptrTemp0x72                                          ;80CE9F|8572    |000072;
    SEP #$20                                                   ;80CEA1|E220    |      ;
    LDA.B #$80                                                 ;80CEA3|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80CEA5|8574    |000074;
    SEP #$20                                                   ;80CEA7|E220    |      ;
    LDA.B #$06                                                 ;80CEA9|A906    |      ;
    LDX.B #$04                                                 ;80CEAB|A204    |      ;
    LDY.B #$02                                                 ;80CEAD|A002    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80CEAF|22488E80|808E48;
    REP #$20                                                   ;80CEB3|C220    |      ;
    SEP #$10                                                   ;80CEB5|E210    |      ;
    LDA.W #$E47F                                               ;80CEB7|A97FE4  |      ;
    STA.B ptrTemp0x72                                          ;80CEBA|8572    |000072;
    SEP #$20                                                   ;80CEBC|E220    |      ;
    LDA.B #$80                                                 ;80CEBE|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80CEC0|8574    |000074;
    SEP #$20                                                   ;80CEC2|E220    |      ;
    LDA.B #$0E                                                 ;80CEC4|A90E    |      ;
    LDX.B #$05                                                 ;80CEC6|A205    |      ;
    LDY.B #$02                                                 ;80CEC8|A002    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80CECA|22488E80|808E48;
    REP #$20                                                   ;80CECE|C220    |      ;
    SEP #$10                                                   ;80CED0|E210    |      ;
    LDA.W #$E48D                                               ;80CED2|A98DE4  |      ;
    STA.B ptrTemp0x72                                          ;80CED5|8572    |000072;
    SEP #$20                                                   ;80CED7|E220    |      ;
    LDA.B #$80                                                 ;80CED9|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80CEDB|8574    |000074;
    SEP #$20                                                   ;80CEDD|E220    |      ;
    LDA.B #$0F                                                 ;80CEDF|A90F    |      ;
    LDX.B #$06                                                 ;80CEE1|A206    |      ;
    LDY.B #$02                                                 ;80CEE3|A002    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80CEE5|22488E80|808E48;
    RTS                                                        ;80CEE9|60      |      ;
 
 
subUnknown_80CEEA:
    REP #$20                                                   ;80CEEA|C220    |      ;
    SEP #$10                                                   ;80CEEC|E210    |      ;
    LDA.W #$E49B                                               ;80CEEE|A99BE4  |      ;
    STA.B ptrTemp0x72                                          ;80CEF1|8572    |000072;
    SEP #$20                                                   ;80CEF3|E220    |      ;
    LDA.B #$80                                                 ;80CEF5|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80CEF7|8574    |000074;
    SEP #$20                                                   ;80CEF9|E220    |      ;
    LDA.B #$06                                                 ;80CEFB|A906    |      ;
    LDX.B #$04                                                 ;80CEFD|A204    |      ;
    LDY.B #$02                                                 ;80CEFF|A002    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80CF01|22488E80|808E48;
    REP #$20                                                   ;80CF05|C220    |      ;
    SEP #$10                                                   ;80CF07|E210    |      ;
    LDA.W #$E4A9                                               ;80CF09|A9A9E4  |      ;
    STA.B ptrTemp0x72                                          ;80CF0C|8572    |000072;
    SEP #$20                                                   ;80CF0E|E220    |      ;
    LDA.B #$80                                                 ;80CF10|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80CF12|8574    |000074;
    SEP #$20                                                   ;80CF14|E220    |      ;
    LDA.B #$0E                                                 ;80CF16|A90E    |      ;
    LDX.B #$05                                                 ;80CF18|A205    |      ;
    LDY.B #$02                                                 ;80CF1A|A002    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80CF1C|22488E80|808E48;
    REP #$20                                                   ;80CF20|C220    |      ;
    SEP #$10                                                   ;80CF22|E210    |      ;
    LDA.W #$E4B7                                               ;80CF24|A9B7E4  |      ;
    STA.B ptrTemp0x72                                          ;80CF27|8572    |000072;
    SEP #$20                                                   ;80CF29|E220    |      ;
    LDA.B #$80                                                 ;80CF2B|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80CF2D|8574    |000074;
    SEP #$20                                                   ;80CF2F|E220    |      ;
    LDA.B #$0F                                                 ;80CF31|A90F    |      ;
    LDX.B #$06                                                 ;80CF33|A206    |      ;
    LDY.B #$02                                                 ;80CF35|A002    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80CF37|22488E80|808E48;
    RTS                                                        ;80CF3B|60      |      ;
 
 
subUnknown_80CF3C:
    REP #$20                                                   ;80CF3C|C220    |      ;
    SEP #$10                                                   ;80CF3E|E210    |      ;
    LDA.W #$E4C5                                               ;80CF40|A9C5E4  |      ;
    STA.B ptrTemp0x72                                          ;80CF43|8572    |000072;
    SEP #$20                                                   ;80CF45|E220    |      ;
    LDA.B #$80                                                 ;80CF47|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80CF49|8574    |000074;
    SEP #$20                                                   ;80CF4B|E220    |      ;
    LDA.B #$06                                                 ;80CF4D|A906    |      ;
    LDX.B #$04                                                 ;80CF4F|A204    |      ;
    LDY.B #$02                                                 ;80CF51|A002    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80CF53|22488E80|808E48;
    REP #$20                                                   ;80CF57|C220    |      ;
    SEP #$10                                                   ;80CF59|E210    |      ;
    LDA.W #$E4D3                                               ;80CF5B|A9D3E4  |      ;
    STA.B ptrTemp0x72                                          ;80CF5E|8572    |000072;
    SEP #$20                                                   ;80CF60|E220    |      ;
    LDA.B #$80                                                 ;80CF62|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80CF64|8574    |000074;
    SEP #$20                                                   ;80CF66|E220    |      ;
    LDA.B #$0E                                                 ;80CF68|A90E    |      ;
    LDX.B #$05                                                 ;80CF6A|A205    |      ;
    LDY.B #$02                                                 ;80CF6C|A002    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80CF6E|22488E80|808E48;
    REP #$20                                                   ;80CF72|C220    |      ;
    SEP #$10                                                   ;80CF74|E210    |      ;
    LDA.W #$E4E1                                               ;80CF76|A9E1E4  |      ;
    STA.B ptrTemp0x72                                          ;80CF79|8572    |000072;
    SEP #$20                                                   ;80CF7B|E220    |      ;
    LDA.B #$80                                                 ;80CF7D|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80CF7F|8574    |000074;
    SEP #$20                                                   ;80CF81|E220    |      ;
    LDA.B #$0F                                                 ;80CF83|A90F    |      ;
    LDX.B #$06                                                 ;80CF85|A206    |      ;
    LDY.B #$02                                                 ;80CF87|A002    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80CF89|22488E80|808E48;
    REP #$20                                                   ;80CF8D|C220    |      ;
    SEP #$10                                                   ;80CF8F|E210    |      ;
    LDA.W #$E577                                               ;80CF91|A977E5  |      ;
    STA.B ptrTemp0x72                                          ;80CF94|8572    |000072;
    SEP #$20                                                   ;80CF96|E220    |      ;
    LDA.B #$80                                                 ;80CF98|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80CF9A|8574    |000074;
    SEP #$20                                                   ;80CF9C|E220    |      ;
    LDA.B #$03                                                 ;80CF9E|A903    |      ;
    LDX.B #$07                                                 ;80CFA0|A207    |      ;
    LDY.B #$02                                                 ;80CFA2|A002    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80CFA4|22488E80|808E48;
    REP #$20                                                   ;80CFA8|C220    |      ;
    SEP #$10                                                   ;80CFAA|E210    |      ;
    LDA.W #$E588                                               ;80CFAC|A988E5  |      ;
    STA.B ptrTemp0x72                                          ;80CFAF|8572    |000072;
    SEP #$20                                                   ;80CFB1|E220    |      ;
    LDA.B #$80                                                 ;80CFB3|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80CFB5|8574    |000074;
    SEP #$20                                                   ;80CFB7|E220    |      ;
    LDA.B #$04                                                 ;80CFB9|A904    |      ;
    LDX.B #$08                                                 ;80CFBB|A208    |      ;
    LDY.B #$02                                                 ;80CFBD|A002    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80CFBF|22488E80|808E48;
    REP #$20                                                   ;80CFC3|C220    |      ;
    SEP #$10                                                   ;80CFC5|E210    |      ;
    LDA.W #$E599                                               ;80CFC7|A999E5  |      ;
    STA.B ptrTemp0x72                                          ;80CFCA|8572    |000072;
    SEP #$20                                                   ;80CFCC|E220    |      ;
    LDA.B #$80                                                 ;80CFCE|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80CFD0|8574    |000074;
    SEP #$20                                                   ;80CFD2|E220    |      ;
    LDA.B #$05                                                 ;80CFD4|A905    |      ;
    LDX.B #$09                                                 ;80CFD6|A209    |      ;
    LDY.B #$02                                                 ;80CFD8|A002    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80CFDA|22488E80|808E48;
    REP #$20                                                   ;80CFDE|C220    |      ;
    SEP #$10                                                   ;80CFE0|E210    |      ;
    LDA.W #$E5AA                                               ;80CFE2|A9AAE5  |      ;
    STA.B ptrTemp0x72                                          ;80CFE5|8572    |000072;
    SEP #$20                                                   ;80CFE7|E220    |      ;
    LDA.B #$80                                                 ;80CFE9|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80CFEB|8574    |000074;
    SEP #$20                                                   ;80CFED|E220    |      ;
    LDA.B #$07                                                 ;80CFEF|A907    |      ;
    LDX.B #$0A                                                 ;80CFF1|A20A    |      ;
    LDY.B #$02                                                 ;80CFF3|A002    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80CFF5|22488E80|808E48;
    RTS                                                        ;80CFF9|60      |      ;
 
 
subUnknown_80CFFA:
    REP #$20                                                   ;80CFFA|C220    |      ;
    SEP #$10                                                   ;80CFFC|E210    |      ;
    LDA.W #$E5BB                                               ;80CFFE|A9BBE5  |      ;
    STA.B ptrTemp0x72                                          ;80D001|8572    |000072;
    SEP #$20                                                   ;80D003|E220    |      ;
    LDA.B #$80                                                 ;80D005|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D007|8574    |000074;
    SEP #$20                                                   ;80D009|E220    |      ;
    LDA.B #$03                                                 ;80D00B|A903    |      ;
    LDX.B #$04                                                 ;80D00D|A204    |      ;
    LDY.B #$02                                                 ;80D00F|A002    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D011|22488E80|808E48;
    REP #$20                                                   ;80D015|C220    |      ;
    SEP #$10                                                   ;80D017|E210    |      ;
    LDA.W #$E5CC                                               ;80D019|A9CCE5  |      ;
    STA.B ptrTemp0x72                                          ;80D01C|8572    |000072;
    SEP #$20                                                   ;80D01E|E220    |      ;
    LDA.B #$80                                                 ;80D020|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D022|8574    |000074;
    SEP #$20                                                   ;80D024|E220    |      ;
    LDA.B #$04                                                 ;80D026|A904    |      ;
    LDX.B #$05                                                 ;80D028|A205    |      ;
    LDY.B #$02                                                 ;80D02A|A002    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D02C|22488E80|808E48;
    REP #$20                                                   ;80D030|C220    |      ;
    SEP #$10                                                   ;80D032|E210    |      ;
    LDA.W #$E5DD                                               ;80D034|A9DDE5  |      ;
    STA.B ptrTemp0x72                                          ;80D037|8572    |000072;
    SEP #$20                                                   ;80D039|E220    |      ;
    LDA.B #$80                                                 ;80D03B|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D03D|8574    |000074;
    SEP #$20                                                   ;80D03F|E220    |      ;
    LDA.B #$05                                                 ;80D041|A905    |      ;
    LDX.B #$06                                                 ;80D043|A206    |      ;
    LDY.B #$02                                                 ;80D045|A002    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D047|22488E80|808E48;
    REP #$20                                                   ;80D04B|C220    |      ;
    SEP #$10                                                   ;80D04D|E210    |      ;
    LDA.W #$E5EE                                               ;80D04F|A9EEE5  |      ;
    STA.B ptrTemp0x72                                          ;80D052|8572    |000072;
    SEP #$20                                                   ;80D054|E220    |      ;
    LDA.B #$80                                                 ;80D056|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D058|8574    |000074;
    SEP #$20                                                   ;80D05A|E220    |      ;
    LDA.B #$07                                                 ;80D05C|A907    |      ;
    LDX.B #$07                                                 ;80D05E|A207    |      ;
    LDY.B #$02                                                 ;80D060|A002    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D062|22488E80|808E48;
    RTS                                                        ;80D066|60      |      ;
 
 
subUnknown_80D067:
    REP #$20                                                   ;80D067|C220    |      ;
    SEP #$10                                                   ;80D069|E210    |      ;
    LDA.W #$E5FF                                               ;80D06B|A9FFE5  |      ;
    STA.B ptrTemp0x72                                          ;80D06E|8572    |000072;
    SEP #$20                                                   ;80D070|E220    |      ;
    LDA.B #$80                                                 ;80D072|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D074|8574    |000074;
    SEP #$20                                                   ;80D076|E220    |      ;
    LDA.B #$08                                                 ;80D078|A908    |      ;
    LDX.B #$04                                                 ;80D07A|A204    |      ;
    LDY.B #$03                                                 ;80D07C|A003    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D07E|22488E80|808E48;
    REP #$20                                                   ;80D082|C220    |      ;
    SEP #$10                                                   ;80D084|E210    |      ;
    LDA.W #$E616                                               ;80D086|A916E6  |      ;
    STA.B ptrTemp0x72                                          ;80D089|8572    |000072;
    SEP #$20                                                   ;80D08B|E220    |      ;
    LDA.B #$80                                                 ;80D08D|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D08F|8574    |000074;
    SEP #$20                                                   ;80D091|E220    |      ;
    LDA.B #$09                                                 ;80D093|A909    |      ;
    LDX.B #$05                                                 ;80D095|A205    |      ;
    LDY.B #$03                                                 ;80D097|A003    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D099|22488E80|808E48;
    REP #$20                                                   ;80D09D|C220    |      ;
    SEP #$10                                                   ;80D09F|E210    |      ;
    LDA.W #$E62D                                               ;80D0A1|A92DE6  |      ;
    STA.B ptrTemp0x72                                          ;80D0A4|8572    |000072;
    SEP #$20                                                   ;80D0A6|E220    |      ;
    LDA.B #$80                                                 ;80D0A8|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D0AA|8574    |000074;
    SEP #$20                                                   ;80D0AC|E220    |      ;
    LDA.B #$0A                                                 ;80D0AE|A90A    |      ;
    LDX.B #$06                                                 ;80D0B0|A206    |      ;
    LDY.B #$03                                                 ;80D0B2|A003    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D0B4|22488E80|808E48;
    REP #$20                                                   ;80D0B8|C220    |      ;
    SEP #$10                                                   ;80D0BA|E210    |      ;
    LDA.W #$E644                                               ;80D0BC|A944E6  |      ;
    STA.B ptrTemp0x72                                          ;80D0BF|8572    |000072;
    SEP #$20                                                   ;80D0C1|E220    |      ;
    LDA.B #$80                                                 ;80D0C3|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D0C5|8574    |000074;
    SEP #$20                                                   ;80D0C7|E220    |      ;
    LDA.B #$0B                                                 ;80D0C9|A90B    |      ;
    LDX.B #$07                                                 ;80D0CB|A207    |      ;
    LDY.B #$03                                                 ;80D0CD|A003    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D0CF|22488E80|808E48;
    REP #$20                                                   ;80D0D3|C220    |      ;
    SEP #$10                                                   ;80D0D5|E210    |      ;
    LDA.W #$E65B                                               ;80D0D7|A95BE6  |      ;
    STA.B ptrTemp0x72                                          ;80D0DA|8572    |000072;
    SEP #$20                                                   ;80D0DC|E220    |      ;
    LDA.B #$80                                                 ;80D0DE|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D0E0|8574    |000074;
    SEP #$20                                                   ;80D0E2|E220    |      ;
    LDA.B #$0C                                                 ;80D0E4|A90C    |      ;
    LDX.B #$08                                                 ;80D0E6|A208    |      ;
    LDY.B #$03                                                 ;80D0E8|A003    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D0EA|22488E80|808E48;
    REP #$20                                                   ;80D0EE|C220    |      ;
    SEP #$10                                                   ;80D0F0|E210    |      ;
    LDA.W #$EB4C                                               ;80D0F2|A94CEB  |      ;
    STA.B ptrTemp0x72                                          ;80D0F5|8572    |000072;
    SEP #$20                                                   ;80D0F7|E220    |      ;
    LDA.B #$80                                                 ;80D0F9|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D0FB|8574    |000074;
    SEP #$20                                                   ;80D0FD|E220    |      ;
    LDA.B #$0A                                                 ;80D0FF|A90A    |      ;
    LDX.B #$09                                                 ;80D101|A209    |      ;
    LDY.B #$04                                                 ;80D103|A004    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D105|22488E80|808E48;
    REP #$20                                                   ;80D109|C220    |      ;
    SEP #$10                                                   ;80D10B|E210    |      ;
    LDA.W #$EB5D                                               ;80D10D|A95DEB  |      ;
    STA.B ptrTemp0x72                                          ;80D110|8572    |000072;
    SEP #$20                                                   ;80D112|E220    |      ;
    LDA.B #$80                                                 ;80D114|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D116|8574    |000074;
    SEP #$20                                                   ;80D118|E220    |      ;
    LDA.B #$0B                                                 ;80D11A|A90B    |      ;
    LDX.B #$0A                                                 ;80D11C|A20A    |      ;
    LDY.B #$04                                                 ;80D11E|A004    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D120|22488E80|808E48;
    RTS                                                        ;80D124|60      |      ;
 
 
subUnknown_80D125:
    REP #$20                                                   ;80D125|C220    |      ;
    SEP #$10                                                   ;80D127|E210    |      ;
    LDA.W #$E672                                               ;80D129|A972E6  |      ;
    STA.B ptrTemp0x72                                          ;80D12C|8572    |000072;
    SEP #$20                                                   ;80D12E|E220    |      ;
    LDA.B #$80                                                 ;80D130|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D132|8574    |000074;
    SEP #$20                                                   ;80D134|E220    |      ;
    LDA.B #$08                                                 ;80D136|A908    |      ;
    LDX.B #$04                                                 ;80D138|A204    |      ;
    LDY.B #$03                                                 ;80D13A|A003    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D13C|22488E80|808E48;
    REP #$20                                                   ;80D140|C220    |      ;
    SEP #$10                                                   ;80D142|E210    |      ;
    LDA.W #$E689                                               ;80D144|A989E6  |      ;
    STA.B ptrTemp0x72                                          ;80D147|8572    |000072;
    SEP #$20                                                   ;80D149|E220    |      ;
    LDA.B #$80                                                 ;80D14B|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D14D|8574    |000074;
    SEP #$20                                                   ;80D14F|E220    |      ;
    LDA.B #$09                                                 ;80D151|A909    |      ;
    LDX.B #$05                                                 ;80D153|A205    |      ;
    LDY.B #$03                                                 ;80D155|A003    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D157|22488E80|808E48;
    REP #$20                                                   ;80D15B|C220    |      ;
    SEP #$10                                                   ;80D15D|E210    |      ;
    LDA.W #$E6A0                                               ;80D15F|A9A0E6  |      ;
    STA.B ptrTemp0x72                                          ;80D162|8572    |000072;
    SEP #$20                                                   ;80D164|E220    |      ;
    LDA.B #$80                                                 ;80D166|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D168|8574    |000074;
    SEP #$20                                                   ;80D16A|E220    |      ;
    LDA.B #$0A                                                 ;80D16C|A90A    |      ;
    LDX.B #$06                                                 ;80D16E|A206    |      ;
    LDY.B #$03                                                 ;80D170|A003    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D172|22488E80|808E48;
    REP #$20                                                   ;80D176|C220    |      ;
    SEP #$10                                                   ;80D178|E210    |      ;
    LDA.W #$E6B7                                               ;80D17A|A9B7E6  |      ;
    STA.B ptrTemp0x72                                          ;80D17D|8572    |000072;
    SEP #$20                                                   ;80D17F|E220    |      ;
    LDA.B #$80                                                 ;80D181|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D183|8574    |000074;
    SEP #$20                                                   ;80D185|E220    |      ;
    LDA.B #$0B                                                 ;80D187|A90B    |      ;
    LDX.B #$07                                                 ;80D189|A207    |      ;
    LDY.B #$03                                                 ;80D18B|A003    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D18D|22488E80|808E48;
    REP #$20                                                   ;80D191|C220    |      ;
    SEP #$10                                                   ;80D193|E210    |      ;
    LDA.W #$E6CE                                               ;80D195|A9CEE6  |      ;
    STA.B ptrTemp0x72                                          ;80D198|8572    |000072;
    SEP #$20                                                   ;80D19A|E220    |      ;
    LDA.B #$80                                                 ;80D19C|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D19E|8574    |000074;
    SEP #$20                                                   ;80D1A0|E220    |      ;
    LDA.B #$0C                                                 ;80D1A2|A90C    |      ;
    LDX.B #$08                                                 ;80D1A4|A208    |      ;
    LDY.B #$03                                                 ;80D1A6|A003    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D1A8|22488E80|808E48;
    REP #$20                                                   ;80D1AC|C220    |      ;
    SEP #$10                                                   ;80D1AE|E210    |      ;
    LDA.W #$EB6E                                               ;80D1B0|A96EEB  |      ;
    STA.B ptrTemp0x72                                          ;80D1B3|8572    |000072;
    SEP #$20                                                   ;80D1B5|E220    |      ;
    LDA.B #$80                                                 ;80D1B7|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D1B9|8574    |000074;
    SEP #$20                                                   ;80D1BB|E220    |      ;
    LDA.B #$0A                                                 ;80D1BD|A90A    |      ;
    LDX.B #$09                                                 ;80D1BF|A209    |      ;
    LDY.B #$04                                                 ;80D1C1|A004    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D1C3|22488E80|808E48;
    REP #$20                                                   ;80D1C7|C220    |      ;
    SEP #$10                                                   ;80D1C9|E210    |      ;
    LDA.W #$EB7F                                               ;80D1CB|A97FEB  |      ;
    STA.B ptrTemp0x72                                          ;80D1CE|8572    |000072;
    SEP #$20                                                   ;80D1D0|E220    |      ;
    LDA.B #$80                                                 ;80D1D2|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D1D4|8574    |000074;
    SEP #$20                                                   ;80D1D6|E220    |      ;
    LDA.B #$0B                                                 ;80D1D8|A90B    |      ;
    LDX.B #$0A                                                 ;80D1DA|A20A    |      ;
    LDY.B #$04                                                 ;80D1DC|A004    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D1DE|22488E80|808E48;
    RTS                                                        ;80D1E2|60      |      ;
 
 
subUnknown_80D1E3:
    REP #$20                                                   ;80D1E3|C220    |      ;
    SEP #$10                                                   ;80D1E5|E210    |      ;
    LDA.W #$E6E5                                               ;80D1E7|A9E5E6  |      ;
    STA.B ptrTemp0x72                                          ;80D1EA|8572    |000072;
    SEP #$20                                                   ;80D1EC|E220    |      ;
    LDA.B #$80                                                 ;80D1EE|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D1F0|8574    |000074;
    SEP #$20                                                   ;80D1F2|E220    |      ;
    LDA.B #$08                                                 ;80D1F4|A908    |      ;
    LDX.B #$04                                                 ;80D1F6|A204    |      ;
    LDY.B #$03                                                 ;80D1F8|A003    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D1FA|22488E80|808E48;
    REP #$20                                                   ;80D1FE|C220    |      ;
    SEP #$10                                                   ;80D200|E210    |      ;
    LDA.W #$E6FC                                               ;80D202|A9FCE6  |      ;
    STA.B ptrTemp0x72                                          ;80D205|8572    |000072;
    SEP #$20                                                   ;80D207|E220    |      ;
    LDA.B #$80                                                 ;80D209|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D20B|8574    |000074;
    SEP #$20                                                   ;80D20D|E220    |      ;
    LDA.B #$09                                                 ;80D20F|A909    |      ;
    LDX.B #$05                                                 ;80D211|A205    |      ;
    LDY.B #$03                                                 ;80D213|A003    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D215|22488E80|808E48;
    REP #$20                                                   ;80D219|C220    |      ;
    SEP #$10                                                   ;80D21B|E210    |      ;
    LDA.W #$E713                                               ;80D21D|A913E7  |      ;
    STA.B ptrTemp0x72                                          ;80D220|8572    |000072;
    SEP #$20                                                   ;80D222|E220    |      ;
    LDA.B #$80                                                 ;80D224|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D226|8574    |000074;
    SEP #$20                                                   ;80D228|E220    |      ;
    LDA.B #$0A                                                 ;80D22A|A90A    |      ;
    LDX.B #$06                                                 ;80D22C|A206    |      ;
    LDY.B #$03                                                 ;80D22E|A003    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D230|22488E80|808E48;
    REP #$20                                                   ;80D234|C220    |      ;
    SEP #$10                                                   ;80D236|E210    |      ;
    LDA.W #$E72A                                               ;80D238|A92AE7  |      ;
    STA.B ptrTemp0x72                                          ;80D23B|8572    |000072;
    SEP #$20                                                   ;80D23D|E220    |      ;
    LDA.B #$80                                                 ;80D23F|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D241|8574    |000074;
    SEP #$20                                                   ;80D243|E220    |      ;
    LDA.B #$0B                                                 ;80D245|A90B    |      ;
    LDX.B #$07                                                 ;80D247|A207    |      ;
    LDY.B #$03                                                 ;80D249|A003    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D24B|22488E80|808E48;
    REP #$20                                                   ;80D24F|C220    |      ;
    SEP #$10                                                   ;80D251|E210    |      ;
    LDA.W #$E741                                               ;80D253|A941E7  |      ;
    STA.B ptrTemp0x72                                          ;80D256|8572    |000072;
    SEP #$20                                                   ;80D258|E220    |      ;
    LDA.B #$80                                                 ;80D25A|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D25C|8574    |000074;
    SEP #$20                                                   ;80D25E|E220    |      ;
    LDA.B #$0C                                                 ;80D260|A90C    |      ;
    LDX.B #$08                                                 ;80D262|A208    |      ;
    LDY.B #$03                                                 ;80D264|A003    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D266|22488E80|808E48;
    REP #$20                                                   ;80D26A|C220    |      ;
    SEP #$10                                                   ;80D26C|E210    |      ;
    LDA.W #$EB90                                               ;80D26E|A990EB  |      ;
    STA.B ptrTemp0x72                                          ;80D271|8572    |000072;
    SEP #$20                                                   ;80D273|E220    |      ;
    LDA.B #$80                                                 ;80D275|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D277|8574    |000074;
    SEP #$20                                                   ;80D279|E220    |      ;
    LDA.B #$0A                                                 ;80D27B|A90A    |      ;
    LDX.B #$09                                                 ;80D27D|A209    |      ;
    LDY.B #$04                                                 ;80D27F|A004    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D281|22488E80|808E48;
    REP #$20                                                   ;80D285|C220    |      ;
    SEP #$10                                                   ;80D287|E210    |      ;
    LDA.W #$EBA1                                               ;80D289|A9A1EB  |      ;
    STA.B ptrTemp0x72                                          ;80D28C|8572    |000072;
    SEP #$20                                                   ;80D28E|E220    |      ;
    LDA.B #$80                                                 ;80D290|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D292|8574    |000074;
    SEP #$20                                                   ;80D294|E220    |      ;
    LDA.B #$0B                                                 ;80D296|A90B    |      ;
    LDX.B #$0A                                                 ;80D298|A20A    |      ;
    LDY.B #$04                                                 ;80D29A|A004    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D29C|22488E80|808E48;
    RTS                                                        ;80D2A0|60      |      ;
 
 
subUnknown_80D2A1:
    REP #$20                                                   ;80D2A1|C220    |      ;
    SEP #$10                                                   ;80D2A3|E210    |      ;
    LDA.W #$E758                                               ;80D2A5|A958E7  |      ;
    STA.B ptrTemp0x72                                          ;80D2A8|8572    |000072;
    SEP #$20                                                   ;80D2AA|E220    |      ;
    LDA.B #$80                                                 ;80D2AC|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D2AE|8574    |000074;
    SEP #$20                                                   ;80D2B0|E220    |      ;
    LDA.B #$08                                                 ;80D2B2|A908    |      ;
    LDX.B #$04                                                 ;80D2B4|A204    |      ;
    LDY.B #$03                                                 ;80D2B6|A003    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D2B8|22488E80|808E48;
    REP #$20                                                   ;80D2BC|C220    |      ;
    SEP #$10                                                   ;80D2BE|E210    |      ;
    LDA.W #$E76F                                               ;80D2C0|A96FE7  |      ;
    STA.B ptrTemp0x72                                          ;80D2C3|8572    |000072;
    SEP #$20                                                   ;80D2C5|E220    |      ;
    LDA.B #$80                                                 ;80D2C7|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D2C9|8574    |000074;
    SEP #$20                                                   ;80D2CB|E220    |      ;
    LDA.B #$09                                                 ;80D2CD|A909    |      ;
    LDX.B #$05                                                 ;80D2CF|A205    |      ;
    LDY.B #$03                                                 ;80D2D1|A003    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D2D3|22488E80|808E48;
    REP #$20                                                   ;80D2D7|C220    |      ;
    SEP #$10                                                   ;80D2D9|E210    |      ;
    LDA.W #$E786                                               ;80D2DB|A986E7  |      ;
    STA.B ptrTemp0x72                                          ;80D2DE|8572    |000072;
    SEP #$20                                                   ;80D2E0|E220    |      ;
    LDA.B #$80                                                 ;80D2E2|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D2E4|8574    |000074;
    SEP #$20                                                   ;80D2E6|E220    |      ;
    LDA.B #$0A                                                 ;80D2E8|A90A    |      ;
    LDX.B #$06                                                 ;80D2EA|A206    |      ;
    LDY.B #$03                                                 ;80D2EC|A003    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D2EE|22488E80|808E48;
    REP #$20                                                   ;80D2F2|C220    |      ;
    SEP #$10                                                   ;80D2F4|E210    |      ;
    LDA.W #$E79D                                               ;80D2F6|A99DE7  |      ;
    STA.B ptrTemp0x72                                          ;80D2F9|8572    |000072;
    SEP #$20                                                   ;80D2FB|E220    |      ;
    LDA.B #$80                                                 ;80D2FD|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D2FF|8574    |000074;
    SEP #$20                                                   ;80D301|E220    |      ;
    LDA.B #$0B                                                 ;80D303|A90B    |      ;
    LDX.B #$07                                                 ;80D305|A207    |      ;
    LDY.B #$03                                                 ;80D307|A003    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D309|22488E80|808E48;
    REP #$20                                                   ;80D30D|C220    |      ;
    SEP #$10                                                   ;80D30F|E210    |      ;
    LDA.W #$EBB2                                               ;80D311|A9B2EB  |      ;
    STA.B ptrTemp0x72                                          ;80D314|8572    |000072;
    SEP #$20                                                   ;80D316|E220    |      ;
    LDA.B #$80                                                 ;80D318|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D31A|8574    |000074;
    SEP #$20                                                   ;80D31C|E220    |      ;
    LDA.B #$0A                                                 ;80D31E|A90A    |      ;
    LDX.B #$08                                                 ;80D320|A208    |      ;
    LDY.B #$04                                                 ;80D322|A004    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D324|22488E80|808E48;
    REP #$20                                                   ;80D328|C220    |      ;
    SEP #$10                                                   ;80D32A|E210    |      ;
    LDA.W #$EBC3                                               ;80D32C|A9C3EB  |      ;
    STA.B ptrTemp0x72                                          ;80D32F|8572    |000072;
    SEP #$20                                                   ;80D331|E220    |      ;
    LDA.B #$80                                                 ;80D333|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D335|8574    |000074;
    SEP #$20                                                   ;80D337|E220    |      ;
    LDA.B #$0B                                                 ;80D339|A90B    |      ;
    LDX.B #$09                                                 ;80D33B|A209    |      ;
    LDY.B #$04                                                 ;80D33D|A004    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D33F|22488E80|808E48;
    RTS                                                        ;80D343|60      |      ;
 
 
subUnknown_80D344:
    REP #$20                                                   ;80D344|C220    |      ;
    SEP #$10                                                   ;80D346|E210    |      ;
    LDA.W #$E7B4                                               ;80D348|A9B4E7  |      ;
    STA.B ptrTemp0x72                                          ;80D34B|8572    |000072;
    SEP #$20                                                   ;80D34D|E220    |      ;
    LDA.B #$80                                                 ;80D34F|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D351|8574    |000074;
    SEP #$20                                                   ;80D353|E220    |      ;
    LDA.B #$08                                                 ;80D355|A908    |      ;
    LDX.B #$04                                                 ;80D357|A204    |      ;
    LDY.B #$03                                                 ;80D359|A003    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D35B|22488E80|808E48;
    REP #$20                                                   ;80D35F|C220    |      ;
    SEP #$10                                                   ;80D361|E210    |      ;
    LDA.W #$E7CB                                               ;80D363|A9CBE7  |      ;
    STA.B ptrTemp0x72                                          ;80D366|8572    |000072;
    SEP #$20                                                   ;80D368|E220    |      ;
    LDA.B #$80                                                 ;80D36A|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D36C|8574    |000074;
    SEP #$20                                                   ;80D36E|E220    |      ;
    LDA.B #$09                                                 ;80D370|A909    |      ;
    LDX.B #$05                                                 ;80D372|A205    |      ;
    LDY.B #$03                                                 ;80D374|A003    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D376|22488E80|808E48;
    REP #$20                                                   ;80D37A|C220    |      ;
    SEP #$10                                                   ;80D37C|E210    |      ;
    LDA.W #$E7E2                                               ;80D37E|A9E2E7  |      ;
    STA.B ptrTemp0x72                                          ;80D381|8572    |000072;
    SEP #$20                                                   ;80D383|E220    |      ;
    LDA.B #$80                                                 ;80D385|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D387|8574    |000074;
    SEP #$20                                                   ;80D389|E220    |      ;
    LDA.B #$0A                                                 ;80D38B|A90A    |      ;
    LDX.B #$06                                                 ;80D38D|A206    |      ;
    LDY.B #$03                                                 ;80D38F|A003    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D391|22488E80|808E48;
    REP #$20                                                   ;80D395|C220    |      ;
    SEP #$10                                                   ;80D397|E210    |      ;
    LDA.W #$E7F9                                               ;80D399|A9F9E7  |      ;
    STA.B ptrTemp0x72                                          ;80D39C|8572    |000072;
    SEP #$20                                                   ;80D39E|E220    |      ;
    LDA.B #$80                                                 ;80D3A0|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D3A2|8574    |000074;
    SEP #$20                                                   ;80D3A4|E220    |      ;
    LDA.B #$0B                                                 ;80D3A6|A90B    |      ;
    LDX.B #$07                                                 ;80D3A8|A207    |      ;
    LDY.B #$03                                                 ;80D3AA|A003    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D3AC|22488E80|808E48;
    REP #$20                                                   ;80D3B0|C220    |      ;
    SEP #$10                                                   ;80D3B2|E210    |      ;
    LDA.W #$E810                                               ;80D3B4|A910E8  |      ;
    STA.B ptrTemp0x72                                          ;80D3B7|8572    |000072;
    SEP #$20                                                   ;80D3B9|E220    |      ;
    LDA.B #$80                                                 ;80D3BB|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D3BD|8574    |000074;
    SEP #$20                                                   ;80D3BF|E220    |      ;
    LDA.B #$0C                                                 ;80D3C1|A90C    |      ;
    LDX.B #$08                                                 ;80D3C3|A208    |      ;
    LDY.B #$03                                                 ;80D3C5|A003    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D3C7|22488E80|808E48;
    REP #$20                                                   ;80D3CB|C220    |      ;
    SEP #$10                                                   ;80D3CD|E210    |      ;
    LDA.W #$EBD4                                               ;80D3CF|A9D4EB  |      ;
    STA.B ptrTemp0x72                                          ;80D3D2|8572    |000072;
    SEP #$20                                                   ;80D3D4|E220    |      ;
    LDA.B #$80                                                 ;80D3D6|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D3D8|8574    |000074;
    SEP #$20                                                   ;80D3DA|E220    |      ;
    LDA.B #$0A                                                 ;80D3DC|A90A    |      ;
    LDX.B #$09                                                 ;80D3DE|A209    |      ;
    LDY.B #$04                                                 ;80D3E0|A004    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D3E2|22488E80|808E48;
    REP #$20                                                   ;80D3E6|C220    |      ;
    SEP #$10                                                   ;80D3E8|E210    |      ;
    LDA.W #$EBE5                                               ;80D3EA|A9E5EB  |      ;
    STA.B ptrTemp0x72                                          ;80D3ED|8572    |000072;
    SEP #$20                                                   ;80D3EF|E220    |      ;
    LDA.B #$80                                                 ;80D3F1|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D3F3|8574    |000074;
    SEP #$20                                                   ;80D3F5|E220    |      ;
    LDA.B #$0B                                                 ;80D3F7|A90B    |      ;
    LDX.B #$0A                                                 ;80D3F9|A20A    |      ;
    LDY.B #$04                                                 ;80D3FB|A004    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D3FD|22488E80|808E48;
    RTS                                                        ;80D401|60      |      ;
 
 
subUnknown_80D402:
    REP #$20                                                   ;80D402|C220    |      ;
    SEP #$10                                                   ;80D404|E210    |      ;
    LDA.W #$E827                                               ;80D406|A927E8  |      ;
    STA.B ptrTemp0x72                                          ;80D409|8572    |000072;
    SEP #$20                                                   ;80D40B|E220    |      ;
    LDA.B #$80                                                 ;80D40D|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D40F|8574    |000074;
    SEP #$20                                                   ;80D411|E220    |      ;
    LDA.B #$08                                                 ;80D413|A908    |      ;
    LDX.B #$04                                                 ;80D415|A204    |      ;
    LDY.B #$03                                                 ;80D417|A003    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D419|22488E80|808E48;
    REP #$20                                                   ;80D41D|C220    |      ;
    SEP #$10                                                   ;80D41F|E210    |      ;
    LDA.W #$E83E                                               ;80D421|A93EE8  |      ;
    STA.B ptrTemp0x72                                          ;80D424|8572    |000072;
    SEP #$20                                                   ;80D426|E220    |      ;
    LDA.B #$80                                                 ;80D428|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D42A|8574    |000074;
    SEP #$20                                                   ;80D42C|E220    |      ;
    LDA.B #$09                                                 ;80D42E|A909    |      ;
    LDX.B #$05                                                 ;80D430|A205    |      ;
    LDY.B #$03                                                 ;80D432|A003    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D434|22488E80|808E48;
    REP #$20                                                   ;80D438|C220    |      ;
    SEP #$10                                                   ;80D43A|E210    |      ;
    LDA.W #$E855                                               ;80D43C|A955E8  |      ;
    STA.B ptrTemp0x72                                          ;80D43F|8572    |000072;
    SEP #$20                                                   ;80D441|E220    |      ;
    LDA.B #$80                                                 ;80D443|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D445|8574    |000074;
    SEP #$20                                                   ;80D447|E220    |      ;
    LDA.B #$0A                                                 ;80D449|A90A    |      ;
    LDX.B #$06                                                 ;80D44B|A206    |      ;
    LDY.B #$03                                                 ;80D44D|A003    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D44F|22488E80|808E48;
    REP #$20                                                   ;80D453|C220    |      ;
    SEP #$10                                                   ;80D455|E210    |      ;
    LDA.W #$E86C                                               ;80D457|A96CE8  |      ;
    STA.B ptrTemp0x72                                          ;80D45A|8572    |000072;
    SEP #$20                                                   ;80D45C|E220    |      ;
    LDA.B #$80                                                 ;80D45E|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D460|8574    |000074;
    SEP #$20                                                   ;80D462|E220    |      ;
    LDA.B #$0B                                                 ;80D464|A90B    |      ;
    LDX.B #$07                                                 ;80D466|A207    |      ;
    LDY.B #$03                                                 ;80D468|A003    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D46A|22488E80|808E48;
    REP #$20                                                   ;80D46E|C220    |      ;
    SEP #$10                                                   ;80D470|E210    |      ;
    LDA.W #$E883                                               ;80D472|A983E8  |      ;
    STA.B ptrTemp0x72                                          ;80D475|8572    |000072;
    SEP #$20                                                   ;80D477|E220    |      ;
    LDA.B #$80                                                 ;80D479|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D47B|8574    |000074;
    SEP #$20                                                   ;80D47D|E220    |      ;
    LDA.B #$0C                                                 ;80D47F|A90C    |      ;
    LDX.B #$08                                                 ;80D481|A208    |      ;
    LDY.B #$03                                                 ;80D483|A003    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D485|22488E80|808E48;
    REP #$20                                                   ;80D489|C220    |      ;
    SEP #$10                                                   ;80D48B|E210    |      ;
    LDA.W #$EBF6                                               ;80D48D|A9F6EB  |      ;
    STA.B ptrTemp0x72                                          ;80D490|8572    |000072;
    SEP #$20                                                   ;80D492|E220    |      ;
    LDA.B #$80                                                 ;80D494|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D496|8574    |000074;
    SEP #$20                                                   ;80D498|E220    |      ;
    LDA.B #$0A                                                 ;80D49A|A90A    |      ;
    LDX.B #$09                                                 ;80D49C|A209    |      ;
    LDY.B #$04                                                 ;80D49E|A004    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D4A0|22488E80|808E48;
    REP #$20                                                   ;80D4A4|C220    |      ;
    SEP #$10                                                   ;80D4A6|E210    |      ;
    LDA.W #$EC07                                               ;80D4A8|A907EC  |      ;
    STA.B ptrTemp0x72                                          ;80D4AB|8572    |000072;
    SEP #$20                                                   ;80D4AD|E220    |      ;
    LDA.B #$80                                                 ;80D4AF|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D4B1|8574    |000074;
    SEP #$20                                                   ;80D4B3|E220    |      ;
    LDA.B #$0B                                                 ;80D4B5|A90B    |      ;
    LDX.B #$0A                                                 ;80D4B7|A20A    |      ;
    LDY.B #$04                                                 ;80D4B9|A004    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D4BB|22488E80|808E48;
    RTS                                                        ;80D4BF|60      |      ;
 
 
subUnknown_80D4C0:
    REP #$20                                                   ;80D4C0|C220    |      ;
    SEP #$10                                                   ;80D4C2|E210    |      ;
    LDA.W #$E89A                                               ;80D4C4|A99AE8  |      ;
    STA.B ptrTemp0x72                                          ;80D4C7|8572    |000072;
    SEP #$20                                                   ;80D4C9|E220    |      ;
    LDA.B #$80                                                 ;80D4CB|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D4CD|8574    |000074;
    SEP #$20                                                   ;80D4CF|E220    |      ;
    LDA.B #$08                                                 ;80D4D1|A908    |      ;
    LDX.B #$04                                                 ;80D4D3|A204    |      ;
    LDY.B #$03                                                 ;80D4D5|A003    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D4D7|22488E80|808E48;
    REP #$20                                                   ;80D4DB|C220    |      ;
    SEP #$10                                                   ;80D4DD|E210    |      ;
    LDA.W #$E8B1                                               ;80D4DF|A9B1E8  |      ;
    STA.B ptrTemp0x72                                          ;80D4E2|8572    |000072;
    SEP #$20                                                   ;80D4E4|E220    |      ;
    LDA.B #$80                                                 ;80D4E6|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D4E8|8574    |000074;
    SEP #$20                                                   ;80D4EA|E220    |      ;
    LDA.B #$09                                                 ;80D4EC|A909    |      ;
    LDX.B #$05                                                 ;80D4EE|A205    |      ;
    LDY.B #$03                                                 ;80D4F0|A003    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D4F2|22488E80|808E48;
    REP #$20                                                   ;80D4F6|C220    |      ;
    SEP #$10                                                   ;80D4F8|E210    |      ;
    LDA.W #$E8C8                                               ;80D4FA|A9C8E8  |      ;
    STA.B ptrTemp0x72                                          ;80D4FD|8572    |000072;
    SEP #$20                                                   ;80D4FF|E220    |      ;
    LDA.B #$80                                                 ;80D501|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D503|8574    |000074;
    SEP #$20                                                   ;80D505|E220    |      ;
    LDA.B #$0A                                                 ;80D507|A90A    |      ;
    LDX.B #$06                                                 ;80D509|A206    |      ;
    LDY.B #$03                                                 ;80D50B|A003    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D50D|22488E80|808E48;
    REP #$20                                                   ;80D511|C220    |      ;
    SEP #$10                                                   ;80D513|E210    |      ;
    LDA.W #$E8DF                                               ;80D515|A9DFE8  |      ;
    STA.B ptrTemp0x72                                          ;80D518|8572    |000072;
    SEP #$20                                                   ;80D51A|E220    |      ;
    LDA.B #$80                                                 ;80D51C|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D51E|8574    |000074;
    SEP #$20                                                   ;80D520|E220    |      ;
    LDA.B #$0B                                                 ;80D522|A90B    |      ;
    LDX.B #$07                                                 ;80D524|A207    |      ;
    LDY.B #$03                                                 ;80D526|A003    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D528|22488E80|808E48;
    REP #$20                                                   ;80D52C|C220    |      ;
    SEP #$10                                                   ;80D52E|E210    |      ;
    LDA.W #$EC18                                               ;80D530|A918EC  |      ;
    STA.B ptrTemp0x72                                          ;80D533|8572    |000072;
    SEP #$20                                                   ;80D535|E220    |      ;
    LDA.B #$80                                                 ;80D537|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D539|8574    |000074;
    SEP #$20                                                   ;80D53B|E220    |      ;
    LDA.B #$0A                                                 ;80D53D|A90A    |      ;
    LDX.B #$08                                                 ;80D53F|A208    |      ;
    LDY.B #$04                                                 ;80D541|A004    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D543|22488E80|808E48;
    REP #$20                                                   ;80D547|C220    |      ;
    SEP #$10                                                   ;80D549|E210    |      ;
    LDA.W #$EC29                                               ;80D54B|A929EC  |      ;
    STA.B ptrTemp0x72                                          ;80D54E|8572    |000072;
    SEP #$20                                                   ;80D550|E220    |      ;
    LDA.B #$80                                                 ;80D552|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D554|8574    |000074;
    SEP #$20                                                   ;80D556|E220    |      ;
    LDA.B #$0B                                                 ;80D558|A90B    |      ;
    LDX.B #$09                                                 ;80D55A|A209    |      ;
    LDY.B #$04                                                 ;80D55C|A004    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D55E|22488E80|808E48;
    RTS                                                        ;80D562|60      |      ;
 
 
subUnknown_80D563:
    REP #$20                                                   ;80D563|C220    |      ;
    SEP #$10                                                   ;80D565|E210    |      ;
    LDA.W #$E8F6                                               ;80D567|A9F6E8  |      ;
    STA.B ptrTemp0x72                                          ;80D56A|8572    |000072;
    SEP #$20                                                   ;80D56C|E220    |      ;
    LDA.B #$80                                                 ;80D56E|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D570|8574    |000074;
    SEP #$20                                                   ;80D572|E220    |      ;
    LDA.B #$08                                                 ;80D574|A908    |      ;
    LDX.B #$04                                                 ;80D576|A204    |      ;
    LDY.B #$03                                                 ;80D578|A003    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D57A|22488E80|808E48;
    REP #$20                                                   ;80D57E|C220    |      ;
    SEP #$10                                                   ;80D580|E210    |      ;
    LDA.W #$E90D                                               ;80D582|A90DE9  |      ;
    STA.B ptrTemp0x72                                          ;80D585|8572    |000072;
    SEP #$20                                                   ;80D587|E220    |      ;
    LDA.B #$80                                                 ;80D589|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D58B|8574    |000074;
    SEP #$20                                                   ;80D58D|E220    |      ;
    LDA.B #$09                                                 ;80D58F|A909    |      ;
    LDX.B #$05                                                 ;80D591|A205    |      ;
    LDY.B #$03                                                 ;80D593|A003    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D595|22488E80|808E48;
    REP #$20                                                   ;80D599|C220    |      ;
    SEP #$10                                                   ;80D59B|E210    |      ;
    LDA.W #$E924                                               ;80D59D|A924E9  |      ;
    STA.B ptrTemp0x72                                          ;80D5A0|8572    |000072;
    SEP #$20                                                   ;80D5A2|E220    |      ;
    LDA.B #$80                                                 ;80D5A4|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D5A6|8574    |000074;
    SEP #$20                                                   ;80D5A8|E220    |      ;
    LDA.B #$0A                                                 ;80D5AA|A90A    |      ;
    LDX.B #$06                                                 ;80D5AC|A206    |      ;
    LDY.B #$03                                                 ;80D5AE|A003    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D5B0|22488E80|808E48;
    REP #$20                                                   ;80D5B4|C220    |      ;
    SEP #$10                                                   ;80D5B6|E210    |      ;
    LDA.W #$E93B                                               ;80D5B8|A93BE9  |      ;
    STA.B ptrTemp0x72                                          ;80D5BB|8572    |000072;
    SEP #$20                                                   ;80D5BD|E220    |      ;
    LDA.B #$80                                                 ;80D5BF|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D5C1|8574    |000074;
    SEP #$20                                                   ;80D5C3|E220    |      ;
    LDA.B #$0B                                                 ;80D5C5|A90B    |      ;
    LDX.B #$07                                                 ;80D5C7|A207    |      ;
    LDY.B #$03                                                 ;80D5C9|A003    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D5CB|22488E80|808E48;
    REP #$20                                                   ;80D5CF|C220    |      ;
    SEP #$10                                                   ;80D5D1|E210    |      ;
    LDA.W #$EC3A                                               ;80D5D3|A93AEC  |      ;
    STA.B ptrTemp0x72                                          ;80D5D6|8572    |000072;
    SEP #$20                                                   ;80D5D8|E220    |      ;
    LDA.B #$80                                                 ;80D5DA|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D5DC|8574    |000074;
    SEP #$20                                                   ;80D5DE|E220    |      ;
    LDA.B #$0A                                                 ;80D5E0|A90A    |      ;
    LDX.B #$08                                                 ;80D5E2|A208    |      ;
    LDY.B #$04                                                 ;80D5E4|A004    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D5E6|22488E80|808E48;
    REP #$20                                                   ;80D5EA|C220    |      ;
    SEP #$10                                                   ;80D5EC|E210    |      ;
    LDA.W #$EC4B                                               ;80D5EE|A94BEC  |      ;
    STA.B ptrTemp0x72                                          ;80D5F1|8572    |000072;
    SEP #$20                                                   ;80D5F3|E220    |      ;
    LDA.B #$80                                                 ;80D5F5|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D5F7|8574    |000074;
    SEP #$20                                                   ;80D5F9|E220    |      ;
    LDA.B #$0B                                                 ;80D5FB|A90B    |      ;
    LDX.B #$09                                                 ;80D5FD|A209    |      ;
    LDY.B #$04                                                 ;80D5FF|A004    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D601|22488E80|808E48;
    RTS                                                        ;80D605|60      |      ;
 
 
subUnknown_80D606:
    REP #$20                                                   ;80D606|C220    |      ;
    SEP #$10                                                   ;80D608|E210    |      ;
    LDA.W #$E952                                               ;80D60A|A952E9  |      ;
    STA.B ptrTemp0x72                                          ;80D60D|8572    |000072;
    SEP #$20                                                   ;80D60F|E220    |      ;
    LDA.B #$80                                                 ;80D611|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D613|8574    |000074;
    SEP #$20                                                   ;80D615|E220    |      ;
    LDA.B #$06                                                 ;80D617|A906    |      ;
    LDX.B #$04                                                 ;80D619|A204    |      ;
    LDY.B #$03                                                 ;80D61B|A003    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D61D|22488E80|808E48;
    REP #$20                                                   ;80D621|C220    |      ;
    SEP #$10                                                   ;80D623|E210    |      ;
    LDA.W #$E969                                               ;80D625|A969E9  |      ;
    STA.B ptrTemp0x72                                          ;80D628|8572    |000072;
    SEP #$20                                                   ;80D62A|E220    |      ;
    LDA.B #$80                                                 ;80D62C|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D62E|8574    |000074;
    SEP #$20                                                   ;80D630|E220    |      ;
    LDA.B #$07                                                 ;80D632|A907    |      ;
    LDX.B #$05                                                 ;80D634|A205    |      ;
    LDY.B #$03                                                 ;80D636|A003    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D638|22488E80|808E48;
    REP #$20                                                   ;80D63C|C220    |      ;
    SEP #$10                                                   ;80D63E|E210    |      ;
    LDA.W #$E980                                               ;80D640|A980E9  |      ;
    STA.B ptrTemp0x72                                          ;80D643|8572    |000072;
    SEP #$20                                                   ;80D645|E220    |      ;
    LDA.B #$80                                                 ;80D647|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D649|8574    |000074;
    SEP #$20                                                   ;80D64B|E220    |      ;
    LDA.B #$08                                                 ;80D64D|A908    |      ;
    LDX.B #$06                                                 ;80D64F|A206    |      ;
    LDY.B #$03                                                 ;80D651|A003    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D653|22488E80|808E48;
    REP #$20                                                   ;80D657|C220    |      ;
    SEP #$10                                                   ;80D659|E210    |      ;
    LDA.W #$E997                                               ;80D65B|A997E9  |      ;
    STA.B ptrTemp0x72                                          ;80D65E|8572    |000072;
    SEP #$20                                                   ;80D660|E220    |      ;
    LDA.B #$80                                                 ;80D662|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D664|8574    |000074;
    SEP #$20                                                   ;80D666|E220    |      ;
    LDA.B #$09                                                 ;80D668|A909    |      ;
    LDX.B #$07                                                 ;80D66A|A207    |      ;
    LDY.B #$03                                                 ;80D66C|A003    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D66E|22488E80|808E48;
    REP #$20                                                   ;80D672|C220    |      ;
    SEP #$10                                                   ;80D674|E210    |      ;
    LDA.W #$E9AE                                               ;80D676|A9AEE9  |      ;
    STA.B ptrTemp0x72                                          ;80D679|8572    |000072;
    SEP #$20                                                   ;80D67B|E220    |      ;
    LDA.B #$80                                                 ;80D67D|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D67F|8574    |000074;
    SEP #$20                                                   ;80D681|E220    |      ;
    LDA.B #$0A                                                 ;80D683|A90A    |      ;
    LDX.B #$08                                                 ;80D685|A208    |      ;
    LDY.B #$03                                                 ;80D687|A003    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D689|22488E80|808E48;
    REP #$20                                                   ;80D68D|C220    |      ;
    SEP #$10                                                   ;80D68F|E210    |      ;
    LDA.W #$E9C5                                               ;80D691|A9C5E9  |      ;
    STA.B ptrTemp0x72                                          ;80D694|8572    |000072;
    SEP #$20                                                   ;80D696|E220    |      ;
    LDA.B #$80                                                 ;80D698|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D69A|8574    |000074;
    SEP #$20                                                   ;80D69C|E220    |      ;
    LDA.B #$0B                                                 ;80D69E|A90B    |      ;
    LDX.B #$09                                                 ;80D6A0|A209    |      ;
    LDY.B #$03                                                 ;80D6A2|A003    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D6A4|22488E80|808E48;
    REP #$20                                                   ;80D6A8|C220    |      ;
    SEP #$10                                                   ;80D6AA|E210    |      ;
    LDA.W #$E9DC                                               ;80D6AC|A9DCE9  |      ;
    STA.B ptrTemp0x72                                          ;80D6AF|8572    |000072;
    SEP #$20                                                   ;80D6B1|E220    |      ;
    LDA.B #$80                                                 ;80D6B3|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D6B5|8574    |000074;
    SEP #$20                                                   ;80D6B7|E220    |      ;
    LDA.B #$0C                                                 ;80D6B9|A90C    |      ;
    LDX.B #$0A                                                 ;80D6BB|A20A    |      ;
    LDY.B #$03                                                 ;80D6BD|A003    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D6BF|22488E80|808E48;
    REP #$20                                                   ;80D6C3|C220    |      ;
    SEP #$10                                                   ;80D6C5|E210    |      ;
    LDA.W #$EC5C                                               ;80D6C7|A95CEC  |      ;
    STA.B ptrTemp0x72                                          ;80D6CA|8572    |000072;
    SEP #$20                                                   ;80D6CC|E220    |      ;
    LDA.B #$80                                                 ;80D6CE|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D6D0|8574    |000074;
    SEP #$20                                                   ;80D6D2|E220    |      ;
    LDA.B #$0A                                                 ;80D6D4|A90A    |      ;
    LDX.B #$0B                                                 ;80D6D6|A20B    |      ;
    LDY.B #$04                                                 ;80D6D8|A004    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D6DA|22488E80|808E48;
    REP #$20                                                   ;80D6DE|C220    |      ;
    SEP #$10                                                   ;80D6E0|E210    |      ;
    LDA.W #$EC6D                                               ;80D6E2|A96DEC  |      ;
    STA.B ptrTemp0x72                                          ;80D6E5|8572    |000072;
    SEP #$20                                                   ;80D6E7|E220    |      ;
    LDA.B #$80                                                 ;80D6E9|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D6EB|8574    |000074;
    SEP #$20                                                   ;80D6ED|E220    |      ;
    LDA.B #$0B                                                 ;80D6EF|A90B    |      ;
    LDX.B #$0C                                                 ;80D6F1|A20C    |      ;
    LDY.B #$04                                                 ;80D6F3|A004    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D6F5|22488E80|808E48;
    RTS                                                        ;80D6F9|60      |      ;
 
 
subUnknown_80D6FA:
    REP #$20                                                   ;80D6FA|C220    |      ;
    SEP #$10                                                   ;80D6FC|E210    |      ;
    LDA.W #$E9F3                                               ;80D6FE|A9F3E9  |      ;
    STA.B ptrTemp0x72                                          ;80D701|8572    |000072;
    SEP #$20                                                   ;80D703|E220    |      ;
    LDA.B #$80                                                 ;80D705|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D707|8574    |000074;
    SEP #$20                                                   ;80D709|E220    |      ;
    LDA.B #$06                                                 ;80D70B|A906    |      ;
    LDX.B #$04                                                 ;80D70D|A204    |      ;
    LDY.B #$03                                                 ;80D70F|A003    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D711|22488E80|808E48;
    REP #$20                                                   ;80D715|C220    |      ;
    SEP #$10                                                   ;80D717|E210    |      ;
    LDA.W #$EA0A                                               ;80D719|A90AEA  |      ;
    STA.B ptrTemp0x72                                          ;80D71C|8572    |000072;
    SEP #$20                                                   ;80D71E|E220    |      ;
    LDA.B #$80                                                 ;80D720|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D722|8574    |000074;
    SEP #$20                                                   ;80D724|E220    |      ;
    LDA.B #$07                                                 ;80D726|A907    |      ;
    LDX.B #$05                                                 ;80D728|A205    |      ;
    LDY.B #$03                                                 ;80D72A|A003    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D72C|22488E80|808E48;
    REP #$20                                                   ;80D730|C220    |      ;
    SEP #$10                                                   ;80D732|E210    |      ;
    LDA.W #$EA21                                               ;80D734|A921EA  |      ;
    STA.B ptrTemp0x72                                          ;80D737|8572    |000072;
    SEP #$20                                                   ;80D739|E220    |      ;
    LDA.B #$80                                                 ;80D73B|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D73D|8574    |000074;
    SEP #$20                                                   ;80D73F|E220    |      ;
    LDA.B #$08                                                 ;80D741|A908    |      ;
    LDX.B #$06                                                 ;80D743|A206    |      ;
    LDY.B #$03                                                 ;80D745|A003    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D747|22488E80|808E48;
    REP #$20                                                   ;80D74B|C220    |      ;
    SEP #$10                                                   ;80D74D|E210    |      ;
    LDA.W #$EA38                                               ;80D74F|A938EA  |      ;
    STA.B ptrTemp0x72                                          ;80D752|8572    |000072;
    SEP #$20                                                   ;80D754|E220    |      ;
    LDA.B #$80                                                 ;80D756|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D758|8574    |000074;
    SEP #$20                                                   ;80D75A|E220    |      ;
    LDA.B #$09                                                 ;80D75C|A909    |      ;
    LDX.B #$07                                                 ;80D75E|A207    |      ;
    LDY.B #$03                                                 ;80D760|A003    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D762|22488E80|808E48;
    REP #$20                                                   ;80D766|C220    |      ;
    SEP #$10                                                   ;80D768|E210    |      ;
    LDA.W #$EA4F                                               ;80D76A|A94FEA  |      ;
    STA.B ptrTemp0x72                                          ;80D76D|8572    |000072;
    SEP #$20                                                   ;80D76F|E220    |      ;
    LDA.B #$80                                                 ;80D771|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D773|8574    |000074;
    SEP #$20                                                   ;80D775|E220    |      ;
    LDA.B #$0A                                                 ;80D777|A90A    |      ;
    LDX.B #$08                                                 ;80D779|A208    |      ;
    LDY.B #$03                                                 ;80D77B|A003    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D77D|22488E80|808E48;
    REP #$20                                                   ;80D781|C220    |      ;
    SEP #$10                                                   ;80D783|E210    |      ;
    LDA.W #$EA66                                               ;80D785|A966EA  |      ;
    STA.B ptrTemp0x72                                          ;80D788|8572    |000072;
    SEP #$20                                                   ;80D78A|E220    |      ;
    LDA.B #$80                                                 ;80D78C|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D78E|8574    |000074;
    SEP #$20                                                   ;80D790|E220    |      ;
    LDA.B #$0B                                                 ;80D792|A90B    |      ;
    LDX.B #$09                                                 ;80D794|A209    |      ;
    LDY.B #$03                                                 ;80D796|A003    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D798|22488E80|808E48;
    REP #$20                                                   ;80D79C|C220    |      ;
    SEP #$10                                                   ;80D79E|E210    |      ;
    LDA.W #$EA7D                                               ;80D7A0|A97DEA  |      ;
    STA.B ptrTemp0x72                                          ;80D7A3|8572    |000072;
    SEP #$20                                                   ;80D7A5|E220    |      ;
    LDA.B #$80                                                 ;80D7A7|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D7A9|8574    |000074;
    SEP #$20                                                   ;80D7AB|E220    |      ;
    LDA.B #$0C                                                 ;80D7AD|A90C    |      ;
    LDX.B #$0A                                                 ;80D7AF|A20A    |      ;
    LDY.B #$03                                                 ;80D7B1|A003    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D7B3|22488E80|808E48;
    REP #$20                                                   ;80D7B7|C220    |      ;
    SEP #$10                                                   ;80D7B9|E210    |      ;
    LDA.W #$EC7E                                               ;80D7BB|A97EEC  |      ;
    STA.B ptrTemp0x72                                          ;80D7BE|8572    |000072;
    SEP #$20                                                   ;80D7C0|E220    |      ;
    LDA.B #$80                                                 ;80D7C2|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D7C4|8574    |000074;
    SEP #$20                                                   ;80D7C6|E220    |      ;
    LDA.B #$0A                                                 ;80D7C8|A90A    |      ;
    LDX.B #$0B                                                 ;80D7CA|A20B    |      ;
    LDY.B #$04                                                 ;80D7CC|A004    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D7CE|22488E80|808E48;
    REP #$20                                                   ;80D7D2|C220    |      ;
    SEP #$10                                                   ;80D7D4|E210    |      ;
    LDA.W #$EC8F                                               ;80D7D6|A98FEC  |      ;
    STA.B ptrTemp0x72                                          ;80D7D9|8572    |000072;
    SEP #$20                                                   ;80D7DB|E220    |      ;
    LDA.B #$80                                                 ;80D7DD|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D7DF|8574    |000074;
    SEP #$20                                                   ;80D7E1|E220    |      ;
    LDA.B #$0B                                                 ;80D7E3|A90B    |      ;
    LDX.B #$0C                                                 ;80D7E5|A20C    |      ;
    LDY.B #$04                                                 ;80D7E7|A004    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D7E9|22488E80|808E48;
    RTS                                                        ;80D7ED|60      |      ;
 
 
subUnknown_80D7EE:
    REP #$20                                                   ;80D7EE|C220    |      ;
    SEP #$10                                                   ;80D7F0|E210    |      ;
    LDA.W #$EA94                                               ;80D7F2|A994EA  |      ;
    STA.B ptrTemp0x72                                          ;80D7F5|8572    |000072;
    SEP #$20                                                   ;80D7F7|E220    |      ;
    LDA.B #$80                                                 ;80D7F9|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D7FB|8574    |000074;
    SEP #$20                                                   ;80D7FD|E220    |      ;
    LDA.B #$08                                                 ;80D7FF|A908    |      ;
    LDX.B #$04                                                 ;80D801|A204    |      ;
    LDY.B #$03                                                 ;80D803|A003    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D805|22488E80|808E48;
    REP #$20                                                   ;80D809|C220    |      ;
    SEP #$10                                                   ;80D80B|E210    |      ;
    LDA.W #$EAAB                                               ;80D80D|A9ABEA  |      ;
    STA.B ptrTemp0x72                                          ;80D810|8572    |000072;
    SEP #$20                                                   ;80D812|E220    |      ;
    LDA.B #$80                                                 ;80D814|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D816|8574    |000074;
    SEP #$20                                                   ;80D818|E220    |      ;
    LDA.B #$09                                                 ;80D81A|A909    |      ;
    LDX.B #$05                                                 ;80D81C|A205    |      ;
    LDY.B #$03                                                 ;80D81E|A003    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D820|22488E80|808E48;
    REP #$20                                                   ;80D824|C220    |      ;
    SEP #$10                                                   ;80D826|E210    |      ;
    LDA.W #$EAC2                                               ;80D828|A9C2EA  |      ;
    STA.B ptrTemp0x72                                          ;80D82B|8572    |000072;
    SEP #$20                                                   ;80D82D|E220    |      ;
    LDA.B #$80                                                 ;80D82F|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D831|8574    |000074;
    SEP #$20                                                   ;80D833|E220    |      ;
    LDA.B #$0A                                                 ;80D835|A90A    |      ;
    LDX.B #$06                                                 ;80D837|A206    |      ;
    LDY.B #$03                                                 ;80D839|A003    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D83B|22488E80|808E48;
    REP #$20                                                   ;80D83F|C220    |      ;
    SEP #$10                                                   ;80D841|E210    |      ;
    LDA.W #$EAD9                                               ;80D843|A9D9EA  |      ;
    STA.B ptrTemp0x72                                          ;80D846|8572    |000072;
    SEP #$20                                                   ;80D848|E220    |      ;
    LDA.B #$80                                                 ;80D84A|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D84C|8574    |000074;
    SEP #$20                                                   ;80D84E|E220    |      ;
    LDA.B #$0B                                                 ;80D850|A90B    |      ;
    LDX.B #$07                                                 ;80D852|A207    |      ;
    LDY.B #$03                                                 ;80D854|A003    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D856|22488E80|808E48;
    REP #$20                                                   ;80D85A|C220    |      ;
    SEP #$10                                                   ;80D85C|E210    |      ;
    LDA.W #$ECA0                                               ;80D85E|A9A0EC  |      ;
    STA.B ptrTemp0x72                                          ;80D861|8572    |000072;
    SEP #$20                                                   ;80D863|E220    |      ;
    LDA.B #$80                                                 ;80D865|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D867|8574    |000074;
    SEP #$20                                                   ;80D869|E220    |      ;
    LDA.B #$0A                                                 ;80D86B|A90A    |      ;
    LDX.B #$08                                                 ;80D86D|A208    |      ;
    LDY.B #$04                                                 ;80D86F|A004    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D871|22488E80|808E48;
    REP #$20                                                   ;80D875|C220    |      ;
    SEP #$10                                                   ;80D877|E210    |      ;
    LDA.W #$ECB1                                               ;80D879|A9B1EC  |      ;
    STA.B ptrTemp0x72                                          ;80D87C|8572    |000072;
    SEP #$20                                                   ;80D87E|E220    |      ;
    LDA.B #$80                                                 ;80D880|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D882|8574    |000074;
    SEP #$20                                                   ;80D884|E220    |      ;
    LDA.B #$0B                                                 ;80D886|A90B    |      ;
    LDX.B #$09                                                 ;80D888|A209    |      ;
    LDY.B #$04                                                 ;80D88A|A004    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D88C|22488E80|808E48;
    RTS                                                        ;80D890|60      |      ;
 
 
subUnknown_80D891:
    REP #$20                                                   ;80D891|C220    |      ;
    SEP #$10                                                   ;80D893|E210    |      ;
    LDA.W #$EAF0                                               ;80D895|A9F0EA  |      ;
    STA.B ptrTemp0x72                                          ;80D898|8572    |000072;
    SEP #$20                                                   ;80D89A|E220    |      ;
    LDA.B #$80                                                 ;80D89C|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D89E|8574    |000074;
    SEP #$20                                                   ;80D8A0|E220    |      ;
    LDA.B #$08                                                 ;80D8A2|A908    |      ;
    LDX.B #$04                                                 ;80D8A4|A204    |      ;
    LDY.B #$03                                                 ;80D8A6|A003    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D8A8|22488E80|808E48;
    REP #$20                                                   ;80D8AC|C220    |      ;
    SEP #$10                                                   ;80D8AE|E210    |      ;
    LDA.W #$EB07                                               ;80D8B0|A907EB  |      ;
    STA.B ptrTemp0x72                                          ;80D8B3|8572    |000072;
    SEP #$20                                                   ;80D8B5|E220    |      ;
    LDA.B #$80                                                 ;80D8B7|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D8B9|8574    |000074;
    SEP #$20                                                   ;80D8BB|E220    |      ;
    LDA.B #$09                                                 ;80D8BD|A909    |      ;
    LDX.B #$05                                                 ;80D8BF|A205    |      ;
    LDY.B #$03                                                 ;80D8C1|A003    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D8C3|22488E80|808E48;
    REP #$20                                                   ;80D8C7|C220    |      ;
    SEP #$10                                                   ;80D8C9|E210    |      ;
    LDA.W #$EB1E                                               ;80D8CB|A91EEB  |      ;
    STA.B ptrTemp0x72                                          ;80D8CE|8572    |000072;
    SEP #$20                                                   ;80D8D0|E220    |      ;
    LDA.B #$80                                                 ;80D8D2|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D8D4|8574    |000074;
    SEP #$20                                                   ;80D8D6|E220    |      ;
    LDA.B #$0A                                                 ;80D8D8|A90A    |      ;
    LDX.B #$06                                                 ;80D8DA|A206    |      ;
    LDY.B #$03                                                 ;80D8DC|A003    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D8DE|22488E80|808E48;
    REP #$20                                                   ;80D8E2|C220    |      ;
    SEP #$10                                                   ;80D8E4|E210    |      ;
    LDA.W #$EB35                                               ;80D8E6|A935EB  |      ;
    STA.B ptrTemp0x72                                          ;80D8E9|8572    |000072;
    SEP #$20                                                   ;80D8EB|E220    |      ;
    LDA.B #$80                                                 ;80D8ED|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D8EF|8574    |000074;
    SEP #$20                                                   ;80D8F1|E220    |      ;
    LDA.B #$0B                                                 ;80D8F3|A90B    |      ;
    LDX.B #$07                                                 ;80D8F5|A207    |      ;
    LDY.B #$03                                                 ;80D8F7|A003    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D8F9|22488E80|808E48;
    REP #$20                                                   ;80D8FD|C220    |      ;
    SEP #$10                                                   ;80D8FF|E210    |      ;
    LDA.W #$ECC2                                               ;80D901|A9C2EC  |      ;
    STA.B ptrTemp0x72                                          ;80D904|8572    |000072;
    SEP #$20                                                   ;80D906|E220    |      ;
    LDA.B #$80                                                 ;80D908|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D90A|8574    |000074;
    SEP #$20                                                   ;80D90C|E220    |      ;
    LDA.B #$0A                                                 ;80D90E|A90A    |      ;
    LDX.B #$08                                                 ;80D910|A208    |      ;
    LDY.B #$04                                                 ;80D912|A004    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D914|22488E80|808E48;
    REP #$20                                                   ;80D918|C220    |      ;
    SEP #$10                                                   ;80D91A|E210    |      ;
    LDA.W #$ECD3                                               ;80D91C|A9D3EC  |      ;
    STA.B ptrTemp0x72                                          ;80D91F|8572    |000072;
    SEP #$20                                                   ;80D921|E220    |      ;
    LDA.B #$80                                                 ;80D923|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D925|8574    |000074;
    SEP #$20                                                   ;80D927|E220    |      ;
    LDA.B #$0B                                                 ;80D929|A90B    |      ;
    LDX.B #$09                                                 ;80D92B|A209    |      ;
    LDY.B #$04                                                 ;80D92D|A004    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D92F|22488E80|808E48;
    RTS                                                        ;80D933|60      |      ;
 
 
subUnknown_80D934:
    REP #$20                                                   ;80D934|C220    |      ;
    SEP #$10                                                   ;80D936|E210    |      ;
    LDA.W #$ECE4                                               ;80D938|A9E4EC  |      ;
    STA.B ptrTemp0x72                                          ;80D93B|8572    |000072;
    SEP #$20                                                   ;80D93D|E220    |      ;
    LDA.B #$80                                                 ;80D93F|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D941|8574    |000074;
    SEP #$20                                                   ;80D943|E220    |      ;
    LDA.B #$0A                                                 ;80D945|A90A    |      ;
    LDX.B #$04                                                 ;80D947|A204    |      ;
    LDY.B #$04                                                 ;80D949|A004    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D94B|22488E80|808E48;
    REP #$20                                                   ;80D94F|C220    |      ;
    SEP #$10                                                   ;80D951|E210    |      ;
    LDA.W #$ECF5                                               ;80D953|A9F5EC  |      ;
    STA.B ptrTemp0x72                                          ;80D956|8572    |000072;
    SEP #$20                                                   ;80D958|E220    |      ;
    LDA.B #$80                                                 ;80D95A|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D95C|8574    |000074;
    SEP #$20                                                   ;80D95E|E220    |      ;
    LDA.B #$0B                                                 ;80D960|A90B    |      ;
    LDX.B #$05                                                 ;80D962|A205    |      ;
    LDY.B #$04                                                 ;80D964|A004    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D966|22488E80|808E48;
    RTS                                                        ;80D96A|60      |      ;
 
 
subUnknown_80D96B:
    REP #$20                                                   ;80D96B|C220    |      ;
    SEP #$10                                                   ;80D96D|E210    |      ;
    LDA.W #$ED06                                               ;80D96F|A906ED  |      ;
    STA.B ptrTemp0x72                                          ;80D972|8572    |000072;
    SEP #$20                                                   ;80D974|E220    |      ;
    LDA.B #$80                                                 ;80D976|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D978|8574    |000074;
    SEP #$20                                                   ;80D97A|E220    |      ;
    LDA.B #$0A                                                 ;80D97C|A90A    |      ;
    LDX.B #$04                                                 ;80D97E|A204    |      ;
    LDY.B #$04                                                 ;80D980|A004    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D982|22488E80|808E48;
    REP #$20                                                   ;80D986|C220    |      ;
    SEP #$10                                                   ;80D988|E210    |      ;
    LDA.W #$ED17                                               ;80D98A|A917ED  |      ;
    STA.B ptrTemp0x72                                          ;80D98D|8572    |000072;
    SEP #$20                                                   ;80D98F|E220    |      ;
    LDA.B #$80                                                 ;80D991|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D993|8574    |000074;
    SEP #$20                                                   ;80D995|E220    |      ;
    LDA.B #$0B                                                 ;80D997|A90B    |      ;
    LDX.B #$05                                                 ;80D999|A205    |      ;
    LDY.B #$04                                                 ;80D99B|A004    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D99D|22488E80|808E48;
    RTS                                                        ;80D9A1|60      |      ;
 
 
subUnknown_80D9A2:
    REP #$20                                                   ;80D9A2|C220    |      ;
    SEP #$10                                                   ;80D9A4|E210    |      ;
    LDA.W #$ED28                                               ;80D9A6|A928ED  |      ;
    STA.B ptrTemp0x72                                          ;80D9A9|8572    |000072;
    SEP #$20                                                   ;80D9AB|E220    |      ;
    LDA.B #$80                                                 ;80D9AD|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D9AF|8574    |000074;
    SEP #$20                                                   ;80D9B1|E220    |      ;
    LDA.B #$0A                                                 ;80D9B3|A90A    |      ;
    LDX.B #$04                                                 ;80D9B5|A204    |      ;
    LDY.B #$04                                                 ;80D9B7|A004    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D9B9|22488E80|808E48;
    REP #$20                                                   ;80D9BD|C220    |      ;
    SEP #$10                                                   ;80D9BF|E210    |      ;
    LDA.W #$ED39                                               ;80D9C1|A939ED  |      ;
    STA.B ptrTemp0x72                                          ;80D9C4|8572    |000072;
    SEP #$20                                                   ;80D9C6|E220    |      ;
    LDA.B #$80                                                 ;80D9C8|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D9CA|8574    |000074;
    SEP #$20                                                   ;80D9CC|E220    |      ;
    LDA.B #$0B                                                 ;80D9CE|A90B    |      ;
    LDX.B #$05                                                 ;80D9D0|A205    |      ;
    LDY.B #$04                                                 ;80D9D2|A004    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D9D4|22488E80|808E48;
    RTS                                                        ;80D9D8|60      |      ;
 
 
subUnknown_80D9D9:
    REP #$20                                                   ;80D9D9|C220    |      ;
    SEP #$10                                                   ;80D9DB|E210    |      ;
    LDA.W #$ED4A                                               ;80D9DD|A94AED  |      ;
    STA.B ptrTemp0x72                                          ;80D9E0|8572    |000072;
    SEP #$20                                                   ;80D9E2|E220    |      ;
    LDA.B #$80                                                 ;80D9E4|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80D9E6|8574    |000074;
    SEP #$20                                                   ;80D9E8|E220    |      ;
    LDA.B #$0A                                                 ;80D9EA|A90A    |      ;
    LDX.B #$04                                                 ;80D9EC|A204    |      ;
    LDY.B #$04                                                 ;80D9EE|A004    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80D9F0|22488E80|808E48;
    REP #$20                                                   ;80D9F4|C220    |      ;
    SEP #$10                                                   ;80D9F6|E210    |      ;
    LDA.W #$ED5B                                               ;80D9F8|A95BED  |      ;
    STA.B ptrTemp0x72                                          ;80D9FB|8572    |000072;
    SEP #$20                                                   ;80D9FD|E220    |      ;
    LDA.B #$80                                                 ;80D9FF|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80DA01|8574    |000074;
    SEP #$20                                                   ;80DA03|E220    |      ;
    LDA.B #$0B                                                 ;80DA05|A90B    |      ;
    LDX.B #$05                                                 ;80DA07|A205    |      ;
    LDY.B #$04                                                 ;80DA09|A004    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80DA0B|22488E80|808E48;
    RTS                                                        ;80DA0F|60      |      ;
 
 
subUnknown_80DA10:
    REP #$20                                                   ;80DA10|C220    |      ;
    SEP #$10                                                   ;80DA12|E210    |      ;
    LDA.W #$ED6C                                               ;80DA14|A96CED  |      ;
    STA.B ptrTemp0x72                                          ;80DA17|8572    |000072;
    SEP #$20                                                   ;80DA19|E220    |      ;
    LDA.B #$80                                                 ;80DA1B|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80DA1D|8574    |000074;
    SEP #$20                                                   ;80DA1F|E220    |      ;
    LDA.B #$03                                                 ;80DA21|A903    |      ;
    LDX.B #$04                                                 ;80DA23|A204    |      ;
    LDY.B #$04                                                 ;80DA25|A004    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80DA27|22488E80|808E48;
    REP #$20                                                   ;80DA2B|C220    |      ;
    SEP #$10                                                   ;80DA2D|E210    |      ;
    LDA.W #$ED83                                               ;80DA2F|A983ED  |      ;
    STA.B ptrTemp0x72                                          ;80DA32|8572    |000072;
    SEP #$20                                                   ;80DA34|E220    |      ;
    LDA.B #$80                                                 ;80DA36|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80DA38|8574    |000074;
    SEP #$20                                                   ;80DA3A|E220    |      ;
    LDA.B #$05                                                 ;80DA3C|A905    |      ;
    LDX.B #$05                                                 ;80DA3E|A205    |      ;
    LDY.B #$04                                                 ;80DA40|A004    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80DA42|22488E80|808E48;
    RTS                                                        ;80DA46|60      |      ;
 
 
subUnknown_80DA47:
    REP #$20                                                   ;80DA47|C220    |      ;
    SEP #$10                                                   ;80DA49|E210    |      ;
    LDA.W #$ED9A                                               ;80DA4B|A99AED  |      ;
    STA.B ptrTemp0x72                                          ;80DA4E|8572    |000072;
    SEP #$20                                                   ;80DA50|E220    |      ;
    LDA.B #$80                                                 ;80DA52|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80DA54|8574    |000074;
    SEP #$20                                                   ;80DA56|E220    |      ;
    LDA.B #$0B                                                 ;80DA58|A90B    |      ;
    LDX.B #$04                                                 ;80DA5A|A204    |      ;
    LDY.B #$04                                                 ;80DA5C|A004    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80DA5E|22488E80|808E48;
    REP #$20                                                   ;80DA62|C220    |      ;
    SEP #$10                                                   ;80DA64|E210    |      ;
    LDA.W #$EDAB                                               ;80DA66|A9ABED  |      ;
    STA.B ptrTemp0x72                                          ;80DA69|8572    |000072;
    SEP #$20                                                   ;80DA6B|E220    |      ;
    LDA.B #$80                                                 ;80DA6D|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80DA6F|8574    |000074;
    SEP #$20                                                   ;80DA71|E220    |      ;
    LDA.B #$0C                                                 ;80DA73|A90C    |      ;
    LDX.B #$05                                                 ;80DA75|A205    |      ;
    LDY.B #$04                                                 ;80DA77|A004    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80DA79|22488E80|808E48;
    REP #$20                                                   ;80DA7D|C220    |      ;
    SEP #$10                                                   ;80DA7F|E210    |      ;
    LDA.W #$EDBC                                               ;80DA81|A9BCED  |      ;
    STA.B ptrTemp0x72                                          ;80DA84|8572    |000072;
    SEP #$20                                                   ;80DA86|E220    |      ;
    LDA.B #$80                                                 ;80DA88|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80DA8A|8574    |000074;
    SEP #$20                                                   ;80DA8C|E220    |      ;
    LDA.B #$0D                                                 ;80DA8E|A90D    |      ;
    LDX.B #$06                                                 ;80DA90|A206    |      ;
    LDY.B #$04                                                 ;80DA92|A004    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80DA94|22488E80|808E48;
    REP #$20                                                   ;80DA98|C220    |      ;
    SEP #$10                                                   ;80DA9A|E210    |      ;
    LDA.W #$EDCD                                               ;80DA9C|A9CDED  |      ;
    STA.B ptrTemp0x72                                          ;80DA9F|8572    |000072;
    SEP #$20                                                   ;80DAA1|E220    |      ;
    LDA.B #$80                                                 ;80DAA3|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80DAA5|8574    |000074;
    SEP #$20                                                   ;80DAA7|E220    |      ;
    LDA.B #$0E                                                 ;80DAA9|A90E    |      ;
    LDX.B #$07                                                 ;80DAAB|A207    |      ;
    LDY.B #$04                                                 ;80DAAD|A004    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80DAAF|22488E80|808E48;
    RTS                                                        ;80DAB3|60      |      ;
 
 
subUnknown_80DAB4:
    REP #$20                                                   ;80DAB4|C220    |      ;
    SEP #$10                                                   ;80DAB6|E210    |      ;
    LDA.W #$EDDE                                               ;80DAB8|A9DEED  |      ;
    STA.B ptrTemp0x72                                          ;80DABB|8572    |000072;
    SEP #$20                                                   ;80DABD|E220    |      ;
    LDA.B #$80                                                 ;80DABF|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80DAC1|8574    |000074;
    SEP #$20                                                   ;80DAC3|E220    |      ;
    LDA.B #$0C                                                 ;80DAC5|A90C    |      ;
    LDX.B #$04                                                 ;80DAC7|A204    |      ;
    LDY.B #$04                                                 ;80DAC9|A004    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80DACB|22488E80|808E48;
    REP #$20                                                   ;80DACF|C220    |      ;
    SEP #$10                                                   ;80DAD1|E210    |      ;
    LDA.W #$EDEC                                               ;80DAD3|A9ECED  |      ;
    STA.B ptrTemp0x72                                          ;80DAD6|8572    |000072;
    SEP #$20                                                   ;80DAD8|E220    |      ;
    LDA.B #$80                                                 ;80DADA|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80DADC|8574    |000074;
    SEP #$20                                                   ;80DADE|E220    |      ;
    LDA.B #$0D                                                 ;80DAE0|A90D    |      ;
    LDX.B #$05                                                 ;80DAE2|A205    |      ;
    LDY.B #$04                                                 ;80DAE4|A004    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80DAE6|22488E80|808E48;
    REP #$20                                                   ;80DAEA|C220    |      ;
    SEP #$10                                                   ;80DAEC|E210    |      ;
    LDA.W #$EDFA                                               ;80DAEE|A9FAED  |      ;
    STA.B ptrTemp0x72                                          ;80DAF1|8572    |000072;
    SEP #$20                                                   ;80DAF3|E220    |      ;
    LDA.B #$80                                                 ;80DAF5|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80DAF7|8574    |000074;
    SEP #$20                                                   ;80DAF9|E220    |      ;
    LDA.B #$0E                                                 ;80DAFB|A90E    |      ;
    LDX.B #$06                                                 ;80DAFD|A206    |      ;
    LDY.B #$04                                                 ;80DAFF|A004    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80DB01|22488E80|808E48;
    RTS                                                        ;80DB05|60      |      ;
 
 
subUnknown_80DB06:
    REP #$20                                                   ;80DB06|C220    |      ;
    SEP #$10                                                   ;80DB08|E210    |      ;
    LDA.W #$EE08                                               ;80DB0A|A908EE  |      ;
    STA.B ptrTemp0x72                                          ;80DB0D|8572    |000072;
    SEP #$20                                                   ;80DB0F|E220    |      ;
    LDA.B #$80                                                 ;80DB11|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80DB13|8574    |000074;
    SEP #$20                                                   ;80DB15|E220    |      ;
    LDA.B #$07                                                 ;80DB17|A907    |      ;
    LDX.B #$04                                                 ;80DB19|A204    |      ;
    LDY.B #$01                                                 ;80DB1B|A001    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80DB1D|22488E80|808E48;
    REP #$20                                                   ;80DB21|C220    |      ;
    SEP #$10                                                   ;80DB23|E210    |      ;
    LDA.W #$EE16                                               ;80DB25|A916EE  |      ;
    STA.B ptrTemp0x72                                          ;80DB28|8572    |000072;
    SEP #$20                                                   ;80DB2A|E220    |      ;
    LDA.B #$80                                                 ;80DB2C|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80DB2E|8574    |000074;
    SEP #$20                                                   ;80DB30|E220    |      ;
    LDA.B #$08                                                 ;80DB32|A908    |      ;
    LDX.B #$05                                                 ;80DB34|A205    |      ;
    LDY.B #$01                                                 ;80DB36|A001    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80DB38|22488E80|808E48;
    REP #$20                                                   ;80DB3C|C220    |      ;
    SEP #$10                                                   ;80DB3E|E210    |      ;
    LDA.W #$EE24                                               ;80DB40|A924EE  |      ;
    STA.B ptrTemp0x72                                          ;80DB43|8572    |000072;
    SEP #$20                                                   ;80DB45|E220    |      ;
    LDA.B #$80                                                 ;80DB47|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80DB49|8574    |000074;
    SEP #$20                                                   ;80DB4B|E220    |      ;
    LDA.B #$0D                                                 ;80DB4D|A90D    |      ;
    LDX.B #$06                                                 ;80DB4F|A206    |      ;
    LDY.B #$01                                                 ;80DB51|A001    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80DB53|22488E80|808E48;
    REP #$20                                                   ;80DB57|C220    |      ;
    SEP #$10                                                   ;80DB59|E210    |      ;
    LDA.W #$EE32                                               ;80DB5B|A932EE  |      ;
    STA.B ptrTemp0x72                                          ;80DB5E|8572    |000072;
    SEP #$20                                                   ;80DB60|E220    |      ;
    LDA.B #$80                                                 ;80DB62|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80DB64|8574    |000074;
    SEP #$20                                                   ;80DB66|E220    |      ;
    LDA.B #$0E                                                 ;80DB68|A90E    |      ;
    LDX.B #$07                                                 ;80DB6A|A207    |      ;
    LDY.B #$01                                                 ;80DB6C|A001    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80DB6E|22488E80|808E48;
    REP #$20                                                   ;80DB72|C220    |      ;
    SEP #$10                                                   ;80DB74|E210    |      ;
    LDA.W #$EE40                                               ;80DB76|A940EE  |      ;
    STA.B ptrTemp0x72                                          ;80DB79|8572    |000072;
    SEP #$20                                                   ;80DB7B|E220    |      ;
    LDA.B #$80                                                 ;80DB7D|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80DB7F|8574    |000074;
    SEP #$20                                                   ;80DB81|E220    |      ;
    LDA.B #$06                                                 ;80DB83|A906    |      ;
    LDX.B #$08                                                 ;80DB85|A208    |      ;
    LDY.B #$03                                                 ;80DB87|A003    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80DB89|22488E80|808E48;
    REP #$20                                                   ;80DB8D|C220    |      ;
    SEP #$10                                                   ;80DB8F|E210    |      ;
    LDA.W #$EE4E                                               ;80DB91|A94EEE  |      ;
    STA.B ptrTemp0x72                                          ;80DB94|8572    |000072;
    SEP #$20                                                   ;80DB96|E220    |      ;
    LDA.B #$80                                                 ;80DB98|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80DB9A|8574    |000074;
    SEP #$20                                                   ;80DB9C|E220    |      ;
    LDA.B #$09                                                 ;80DB9E|A909    |      ;
    LDX.B #$09                                                 ;80DBA0|A209    |      ;
    LDY.B #$03                                                 ;80DBA2|A003    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80DBA4|22488E80|808E48;
    REP #$20                                                   ;80DBA8|C220    |      ;
    SEP #$10                                                   ;80DBAA|E210    |      ;
    LDA.W #$EE5C                                               ;80DBAC|A95CEE  |      ;
    STA.B ptrTemp0x72                                          ;80DBAF|8572    |000072;
    SEP #$20                                                   ;80DBB1|E220    |      ;
    LDA.B #$80                                                 ;80DBB3|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80DBB5|8574    |000074;
    SEP #$20                                                   ;80DBB7|E220    |      ;
    LDA.B #$0A                                                 ;80DBB9|A90A    |      ;
    LDX.B #$0A                                                 ;80DBBB|A20A    |      ;
    LDY.B #$03                                                 ;80DBBD|A003    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80DBBF|22488E80|808E48;
    REP #$20                                                   ;80DBC3|C220    |      ;
    SEP #$10                                                   ;80DBC5|E210    |      ;
    LDA.W #$EE6A                                               ;80DBC7|A96AEE  |      ;
    STA.B ptrTemp0x72                                          ;80DBCA|8572    |000072;
    SEP #$20                                                   ;80DBCC|E220    |      ;
    LDA.B #$80                                                 ;80DBCE|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80DBD0|8574    |000074;
    SEP #$20                                                   ;80DBD2|E220    |      ;
    LDA.B #$0B                                                 ;80DBD4|A90B    |      ;
    LDX.B #$0B                                                 ;80DBD6|A20B    |      ;
    LDY.B #$03                                                 ;80DBD8|A003    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80DBDA|22488E80|808E48;
    REP #$20                                                   ;80DBDE|C220    |      ;
    SEP #$10                                                   ;80DBE0|E210    |      ;
    LDA.W #$EE78                                               ;80DBE2|A978EE  |      ;
    STA.B ptrTemp0x72                                          ;80DBE5|8572    |000072;
    SEP #$20                                                   ;80DBE7|E220    |      ;
    LDA.B #$80                                                 ;80DBE9|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80DBEB|8574    |000074;
    SEP #$20                                                   ;80DBED|E220    |      ;
    LDA.B #$0C                                                 ;80DBEF|A90C    |      ;
    LDX.B #$0C                                                 ;80DBF1|A20C    |      ;
    LDY.B #$03                                                 ;80DBF3|A003    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80DBF5|22488E80|808E48;
    REP #$20                                                   ;80DBF9|C220    |      ;
    SEP #$10                                                   ;80DBFB|E210    |      ;
    LDA.W #$EE86                                               ;80DBFD|A986EE  |      ;
    STA.B ptrTemp0x72                                          ;80DC00|8572    |000072;
    SEP #$20                                                   ;80DC02|E220    |      ;
    LDA.B #$80                                                 ;80DC04|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80DC06|8574    |000074;
    SEP #$20                                                   ;80DC08|E220    |      ;
    LDA.B #$0D                                                 ;80DC0A|A90D    |      ;
    LDX.B #$0D                                                 ;80DC0C|A20D    |      ;
    LDY.B #$03                                                 ;80DC0E|A003    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80DC10|22488E80|808E48;
    REP #$20                                                   ;80DC14|C220    |      ;
    SEP #$10                                                   ;80DC16|E210    |      ;
    LDA.W #$EE94                                               ;80DC18|A994EE  |      ;
    STA.B ptrTemp0x72                                          ;80DC1B|8572    |000072;
    SEP #$20                                                   ;80DC1D|E220    |      ;
    LDA.B #$80                                                 ;80DC1F|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80DC21|8574    |000074;
    SEP #$20                                                   ;80DC23|E220    |      ;
    LDA.B #$0E                                                 ;80DC25|A90E    |      ;
    LDX.B #$0E                                                 ;80DC27|A20E    |      ;
    LDY.B #$03                                                 ;80DC29|A003    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80DC2B|22488E80|808E48;
    RTS                                                        ;80DC2F|60      |      ;
 
 
subUnknown_80DC30:
    REP #$20                                                   ;80DC30|C220    |      ;
    SEP #$10                                                   ;80DC32|E210    |      ;
    LDA.W #$E447                                               ;80DC34|A947E4  |      ;
    STA.B ptrTemp0x72                                          ;80DC37|8572    |000072;
    SEP #$20                                                   ;80DC39|E220    |      ;
    LDA.B #$80                                                 ;80DC3B|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80DC3D|8574    |000074;
    SEP #$20                                                   ;80DC3F|E220    |      ;
    LDA.B #$06                                                 ;80DC41|A906    |      ;
    LDX.B #$04                                                 ;80DC43|A204    |      ;
    LDY.B #$02                                                 ;80DC45|A002    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80DC47|22488E80|808E48;
    REP #$20                                                   ;80DC4B|C220    |      ;
    SEP #$10                                                   ;80DC4D|E210    |      ;
    LDA.W #$E455                                               ;80DC4F|A955E4  |      ;
    STA.B ptrTemp0x72                                          ;80DC52|8572    |000072;
    SEP #$20                                                   ;80DC54|E220    |      ;
    LDA.B #$80                                                 ;80DC56|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80DC58|8574    |000074;
    SEP #$20                                                   ;80DC5A|E220    |      ;
    LDA.B #$0E                                                 ;80DC5C|A90E    |      ;
    LDX.B #$05                                                 ;80DC5E|A205    |      ;
    LDY.B #$02                                                 ;80DC60|A002    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80DC62|22488E80|808E48;
    REP #$20                                                   ;80DC66|C220    |      ;
    SEP #$10                                                   ;80DC68|E210    |      ;
    LDA.W #$E463                                               ;80DC6A|A963E4  |      ;
    STA.B ptrTemp0x72                                          ;80DC6D|8572    |000072;
    SEP #$20                                                   ;80DC6F|E220    |      ;
    LDA.B #$80                                                 ;80DC71|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80DC73|8574    |000074;
    SEP #$20                                                   ;80DC75|E220    |      ;
    LDA.B #$0F                                                 ;80DC77|A90F    |      ;
    LDX.B #$06                                                 ;80DC79|A206    |      ;
    LDY.B #$02                                                 ;80DC7B|A002    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80DC7D|22488E80|808E48;
    REP #$20                                                   ;80DC81|C220    |      ;
    SEP #$10                                                   ;80DC83|E210    |      ;
    LDA.W #$EEA2                                               ;80DC85|A9A2EE  |      ;
    STA.B ptrTemp0x72                                          ;80DC88|8572    |000072;
    SEP #$20                                                   ;80DC8A|E220    |      ;
    LDA.B #$80                                                 ;80DC8C|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80DC8E|8574    |000074;
    SEP #$20                                                   ;80DC90|E220    |      ;
    LDA.B #$0C                                                 ;80DC92|A90C    |      ;
    LDX.B #$07                                                 ;80DC94|A207    |      ;
    LDY.B #$06                                                 ;80DC96|A006    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80DC98|22488E80|808E48;
    REP #$20                                                   ;80DC9C|C220    |      ;
    SEP #$10                                                   ;80DC9E|E210    |      ;
    LDA.W #$EEB3                                               ;80DCA0|A9B3EE  |      ;
    STA.B ptrTemp0x72                                          ;80DCA3|8572    |000072;
    SEP #$20                                                   ;80DCA5|E220    |      ;
    LDA.B #$80                                                 ;80DCA7|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80DCA9|8574    |000074;
    SEP #$20                                                   ;80DCAB|E220    |      ;
    LDA.B #$0D                                                 ;80DCAD|A90D    |      ;
    LDX.B #$08                                                 ;80DCAF|A208    |      ;
    LDY.B #$06                                                 ;80DCB1|A006    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80DCB3|22488E80|808E48;
    REP #$20                                                   ;80DCB7|C220    |      ;
    SEP #$10                                                   ;80DCB9|E210    |      ;
    LDA.W #$EEC4                                               ;80DCBB|A9C4EE  |      ;
    STA.B ptrTemp0x72                                          ;80DCBE|8572    |000072;
    SEP #$20                                                   ;80DCC0|E220    |      ;
    LDA.B #$80                                                 ;80DCC2|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80DCC4|8574    |000074;
    SEP #$20                                                   ;80DCC6|E220    |      ;
    LDA.B #$0F                                                 ;80DCC8|A90F    |      ;
    LDX.B #$09                                                 ;80DCCA|A209    |      ;
    LDY.B #$06                                                 ;80DCCC|A006    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80DCCE|22488E80|808E48;
    REP #$20                                                   ;80DCD2|C220    |      ;
    SEP #$10                                                   ;80DCD4|E210    |      ;
    LDA.W #$EED5                                               ;80DCD6|A9D5EE  |      ;
    STA.B ptrTemp0x72                                          ;80DCD9|8572    |000072;
    SEP #$20                                                   ;80DCDB|E220    |      ;
    LDA.B #$80                                                 ;80DCDD|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80DCDF|8574    |000074;
    SEP #$20                                                   ;80DCE1|E220    |      ;
    LDA.B #$05                                                 ;80DCE3|A905    |      ;
    LDX.B #$0A                                                 ;80DCE5|A20A    |      ;
    LDY.B #$06                                                 ;80DCE7|A006    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80DCE9|22488E80|808E48;
    REP #$20                                                   ;80DCED|C220    |      ;
    SEP #$10                                                   ;80DCEF|E210    |      ;
    LDA.W #$EEEC                                               ;80DCF1|A9ECEE  |      ;
    STA.B ptrTemp0x72                                          ;80DCF4|8572    |000072;
    SEP #$20                                                   ;80DCF6|E220    |      ;
    LDA.B #$80                                                 ;80DCF8|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80DCFA|8574    |000074;
    SEP #$20                                                   ;80DCFC|E220    |      ;
    LDA.B #$0E                                                 ;80DCFE|A90E    |      ;
    LDX.B #$0B                                                 ;80DD00|A20B    |      ;
    LDY.B #$06                                                 ;80DD02|A006    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80DD04|22488E80|808E48;
    RTS                                                        ;80DD08|60      |      ;
 
 
subUnknown_80DD09:
    REP #$20                                                   ;80DD09|C220    |      ;
    SEP #$10                                                   ;80DD0B|E210    |      ;
    LDA.W #$EF06                                               ;80DD0D|A906EF  |      ;
    STA.B ptrTemp0x72                                          ;80DD10|8572    |000072;
    SEP #$20                                                   ;80DD12|E220    |      ;
    LDA.B #$80                                                 ;80DD14|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80DD16|8574    |000074;
    SEP #$20                                                   ;80DD18|E220    |      ;
    LDA.B #$07                                                 ;80DD1A|A907    |      ;
    LDX.B #$04                                                 ;80DD1C|A204    |      ;
    LDY.B #$02                                                 ;80DD1E|A002    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80DD20|22488E80|808E48;
    REP #$20                                                   ;80DD24|C220    |      ;
    SEP #$10                                                   ;80DD26|E210    |      ;
    LDA.W #$EF11                                               ;80DD28|A911EF  |      ;
    STA.B ptrTemp0x72                                          ;80DD2B|8572    |000072;
    SEP #$20                                                   ;80DD2D|E220    |      ;
    LDA.B #$80                                                 ;80DD2F|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80DD31|8574    |000074;
    SEP #$20                                                   ;80DD33|E220    |      ;
    LDA.B #$0D                                                 ;80DD35|A90D    |      ;
    LDX.B #$05                                                 ;80DD37|A205    |      ;
    LDY.B #$02                                                 ;80DD39|A002    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80DD3B|22488E80|808E48;
    REP #$20                                                   ;80DD3F|C220    |      ;
    SEP #$10                                                   ;80DD41|E210    |      ;
    LDA.W #$EF1C                                               ;80DD43|A91CEF  |      ;
    STA.B ptrTemp0x72                                          ;80DD46|8572    |000072;
    SEP #$20                                                   ;80DD48|E220    |      ;
    LDA.B #$80                                                 ;80DD4A|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;80DD4C|8574    |000074;
    SEP #$20                                                   ;80DD4E|E220    |      ;
    LDA.B #$0E                                                 ;80DD50|A90E    |      ;
    LDX.B #$06                                                 ;80DD52|A206    |      ;
    LDY.B #$02                                                 ;80DD54|A002    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;80DD56|22488E80|808E48;
    RTS                                                        ;80DD5A|60      |      ;
 
 
Table_80DD5B:
    dl $107F79,$103A11,$106A8E,$105E0D                         ;80DD5B|        |      ;
    dl $106AD2,$105E0D,$106A8E,$103A11                         ;80DD67|        |      ;
    dw $FFFE                                                   ;80DD73|        |      ;
    dl Table_80DD5B                                            ;80DD75|        |80DD5B;
 
DATA24_80DD78:
    dl $106AD2,$106A8E,$105E0D,$106AD2                         ;80DD78|        |      ;
    dl $103A11,$106AD2,$105E0D,$106A8E                         ;80DD84|        |      ;
    dw $FFFE                                                   ;80DD90|        |      ;
    dl DATA24_80DD78                                           ;80DD92|        |80DD78;
 
DATA24_80DD95:
    dl $106A8E,$105E0D,$106AD2,$103A11                         ;80DD95|        |      ;
    dl $105E0D,$103A11,$106AD2,$105E0D                         ;80DDA1|        |      ;
    dw $FFFE                                                   ;80DDAD|        |      ;
    dl DATA24_80DD95                                           ;80DDAF|        |80DD95;
 
DATA24_80DDB2:
    dl $105E0D,$106AD2,$104253,$105E0D                         ;80DDB2|        |      ;
    dl $106A8E,$105E0D,$104253,$106AD2                         ;80DDBE|        |      ;
    dw $FFFE                                                   ;80DDCA|        |      ;
    dl DATA24_80DDB2                                           ;80DDCC|        |80DDB2;
 
DATA24_80DDCF:
    dl $10539D,$102E12,$101DFB,$101D94                         ;80DDCF|        |      ;
    dl $102EFE,$101D94,$101DFB,$102E12                         ;80DDDB|        |      ;
    dw $FFFE                                                   ;80DDE7|        |      ;
    dl DATA24_80DDCF                                           ;80DDE9|        |80DDCF;
 
DATA24_80DDEC:
    dl $102EFE,$101DFB,$101D94,$102EFE                         ;80DDEC|        |      ;
    dl $102E12,$102EFE,$101D94,$101DFB                         ;80DDF8|        |      ;
    dw $FFFE                                                   ;80DE04|        |      ;
    dl DATA24_80DDEC                                           ;80DE06|        |80DDEC;
 
DATA24_80DE09:
    dl $101DFB,$101D94,$102EFE,$102E12                         ;80DE09|        |      ;
    dl $101D94,$102E12,$102EFE,$101D94                         ;80DE15|        |      ;
    dw $FFFE                                                   ;80DE21|        |      ;
    dl DATA24_80DE09                                           ;80DE23|        |80DE09;
 
DATA24_80DE26:
    dl $101D94,$102EFE,$102E74,$101DFB                         ;80DE26|        |      ;
    dl $101DFB,$101DFB,$102E74,$102EFE                         ;80DE32|        |      ;
    dw $FFFE                                                   ;80DE3E|        |      ;
    dl DATA24_80DE26                                           ;80DE40|        |80DE26;
 
DATA24_80DE43:
    dl $105A52,$10314C,$10356B,$102908                         ;80DE43|        |      ;
    dl $105A52,$102908,$10356B,$10314C                         ;80DE4F|        |      ;
    dw $FFFE                                                   ;80DE5B|        |      ;
    dl DATA24_80DE43                                           ;80DE5D|        |80DE43;
 
DATA24_80DE60:
    dl $1045EF,$1049EF,$102908,$105A52                         ;80DE60|        |      ;
    dl $10314C,$105A52,$102908,$1049EF                         ;80DE6C|        |      ;
    dw $FFFE                                                   ;80DE78|        |      ;
    dl DATA24_80DE60                                           ;80DE7A|        |80DE60;
 
DATA24_80DE7D:
    dl $10356B,$10394A,$105A52,$10314C                         ;80DE7D|        |      ;
    dl $102908,$10314C,$105A52,$10394A                         ;80DE89|        |      ;
    dw $FFFE                                                   ;80DE95|        |      ;
    dl DATA24_80DE7D                                           ;80DE97|        |80DE7D;
 
DATA24_80DE9A:
    dl $102908,$105A52,$10314C,$10356B                         ;80DE9A|        |      ;
    dl $10356B,$10356B,$10314C,$105A52                         ;80DEA6|        |      ;
    dw $FFFE                                                   ;80DEB2|        |      ;
    dl DATA24_80DE9A                                           ;80DEB4|        |80DE9A;
 
DATA24_80DEB7:
    dl $10456B,$101CE7,$1028E7,$102908                         ;80DEB7|        |      ;
    dl $10456B,$102908,$1028E7,$101CE7                         ;80DEC3|        |      ;
    dw $FFFE                                                   ;80DECF|        |      ;
    dl DATA24_80DEB7                                           ;80DED1|        |80DEB7;
 
DATA24_80DED4:
    dl $103508,$103508,$1028E7,$102908                         ;80DED4|        |      ;
    dl $10456B,$102908,$1028E7,$103508                         ;80DEE0|        |      ;
    dw $FFFE                                                   ;80DEEC|        |      ;
    dl DATA24_80DED4                                           ;80DEEE|        |80DED4;
 
DATA24_80DEF1:
    dl $1028E7,$1028E7,$10456B,$101CE7                         ;80DEF1|        |      ;
    dl $10290B,$101CE7,$10456B,$1028E7                         ;80DEFD|        |      ;
    dw $FFFE                                                   ;80DF09|        |      ;
    dl DATA24_80DEF1                                           ;80DF0B|        |80DEF1;
 
DATA24_80DF0E:
    dl $1028C5,$10456B,$103508,$1028E7                         ;80DF0E|        |      ;
    dl $101CE7,$1028E7,$103508,$10456B                         ;80DF1A|        |      ;
    dw $FFFE                                                   ;80DF26|        |      ;
    dl DATA24_80DF0E                                           ;80DF28|        |80DF0E;
 
DATA24_80DF2B:
    dl $107F99,$10320F,$105A8E,$10524D                         ;80DF2B|        |      ;
    dl $1062D2,$10524D,$105A8E,$10320F                         ;80DF37|        |      ;
    dw $FFFE                                                   ;80DF43|        |      ;
    dl DATA24_80DF2B                                           ;80DF45|        |80DF2B;
 
DATA24_80DF48:
    dl $1062D2,$105A8E,$10524D,$1062D2                         ;80DF48|        |      ;
    dl $10320F,$1062D2,$10524D,$105A8E                         ;80DF54|        |      ;
    dw $FFFE                                                   ;80DF60|        |      ;
    dl DATA24_80DF48                                           ;80DF62|        |80DF48;
 
DATA24_80DF65:
    dl $105A8E,$10524D,$1062D2,$10320F                         ;80DF65|        |      ;
    dl $105A8E,$10320F,$1062D2,$10524D                         ;80DF71|        |      ;
    dw $FFFE                                                   ;80DF7D|        |      ;
    dl DATA24_80DF65                                           ;80DF7F|        |80DF65;
 
DATA24_80DF82:
    dl $10524D,$1062D2,$10320F,$105A8E                         ;80DF82|        |      ;
    dl $10524D,$105A8E,$10320F,$1062D2                         ;80DF8E|        |      ;
    dw $FFFE                                                   ;80DF9A|        |      ;
    dl DATA24_80DF82                                           ;80DF9C|        |80DF82;
 
DATA24_80DF9F:
    dl $1023FE,$102298,$1011DB,$10029B                         ;80DF9F|        |      ;
    dl $10031F,$10029B,$1011DB,$102298                         ;80DFAB|        |      ;
    dw $FFFE                                                   ;80DFB7|        |      ;
    dl DATA24_80DF9F                                           ;80DFB9|        |80DF9F;
 
DATA24_80DFBC:
    dl $10031F,$1011DC,$1001B6,$10031F                         ;80DFBC|        |      ;
    dl $102276,$10031F,$1001B6,$1011DC                         ;80DFC8|        |      ;
    dw $FFFE                                                   ;80DFD4|        |      ;
    dl DATA24_80DFBC                                           ;80DFD6|        |80DFBC;
 
DATA24_80DFD9:
    dl $1011DB,$1001B6,$10031F,$102276                         ;80DFD9|        |      ;
    dl $10125F,$102276,$10031F,$1001B6                         ;80DFE5|        |      ;
    dw $FFFE                                                   ;80DFF1|        |      ;
    dl DATA24_80DFD9                                           ;80DFF3|        |80DFD9;
 
DATA24_80DFF6:
    dl $1001B6,$10031F,$102276,$1011DB                         ;80DFF6|        |      ;
    dl $1001B6,$1011DB,$102276,$10031F                         ;80E002|        |      ;
    dw $FFFE                                                   ;80E00E|        |      ;
    dl DATA24_80DFF6                                           ;80E010|        |80DFF6;
 
DATA24_80E013:
    dl $1051CD,$10216B,$10496B,$104587                         ;80E013|        |      ;
    dl $1051CD,$104587,$10496B,$10216B                         ;80E01F|        |      ;
    dw $FFFE                                                   ;80E02B|        |      ;
    dl DATA24_80E013                                           ;80E02D|        |80E013;
 
DATA24_80E030:
    dl $10496B,$10496B,$104587,$1051CD                         ;80E030|        |      ;
    dl $10216B,$1051CD,$104587,$10496B                         ;80E03C|        |      ;
    dw $FFFE                                                   ;80E048|        |      ;
    dl DATA24_80E030                                           ;80E04A|        |80E030;
 
DATA24_80E04D:
    dl $1011DB,$1001B6,$10031F,$102276                         ;80E04D|        |      ;
    dl $10125F,$102276,$10031F,$1001B6                         ;80E059|        |      ;
    dw $FFFE                                                   ;80E065|        |      ;
    dl DATA24_80E04D                                           ;80E067|        |80E04D;
 
DATA24_80E06A:
    dl $103507,$1051CD,$10216B,$10696B                         ;80E06A|        |      ;
    dl $104587,$10496B,$10216B,$1051CD                         ;80E076|        |      ;
    dw $FFFE                                                   ;80E082|        |      ;
    dl DATA24_80E06A                                           ;80E084|        |80E06A;
 
DATA24_80E087:
    dl $106140,$1020C6,$104104,$1030C0                         ;80E087|        |      ;
    dl $104564,$1030C0,$104104,$1020C6                         ;80E093|        |      ;
    dw $FFFE                                                   ;80E09F|        |      ;
    dl DATA24_80E087                                           ;80E0A1|        |80E087;
 
DATA24_80E0A4:
    dl $104564,$104104,$1030C0,$104564                         ;80E0A4|        |      ;
    dl $1020C6,$104564,$1030C0,$104104                         ;80E0B0|        |      ;
    dw $FFFE                                                   ;80E0BC|        |      ;
    dl DATA24_80E0A4                                           ;80E0BE|        |80E0A4;
 
DATA24_80E0C1:
    dl $104104,$1030C0,$104564,$1020C6                         ;80E0C1|        |      ;
    dl $104104,$1020C6,$104564,$1030C0                         ;80E0CD|        |      ;
    dw $FFFE                                                   ;80E0D9|        |      ;
    dl DATA24_80E0C1                                           ;80E0DB|        |80E0C1;
 
DATA24_80E0DE:
    dl $1030C0,$104564,$1020C6,$104104                         ;80E0DE|        |      ;
    dl $1030C0,$104104,$1020C6,$104564                         ;80E0EA|        |      ;
    dw $FFFE                                                   ;80E0F6|        |      ;
    dl DATA24_80E0DE                                           ;80E0F8|        |80E0DE;
 
DATA24_80E0FB:
    dl $080150,$080153,$080150,$080153                         ;80E0FB|        |      ;
    dw $FFFE                                                   ;80E107|        |      ;
    dl DATA24_80E0FB                                           ;80E109|        |80E0FB;
 
DATA24_80E10C:
    dl $0809D7,$0809D9,$0809D7,$0809D9                         ;80E10C|        |      ;
    dw $FFFE                                                   ;80E118|        |      ;
    dl DATA24_80E10C                                           ;80E11A|        |80E10C;
 
DATA24_80E11D:
    dl $08029F,$08039F,$08029F,$08039F                         ;80E11D|        |      ;
    dw $FFFE                                                   ;80E129|        |      ;
    dl DATA24_80E11D                                           ;80E12B|        |80E11D;
 
DATA24_80E12E:
    dl $08019C,$08029F,$08019C,$08029F                         ;80E12E|        |      ;
    dw $FFFE                                                   ;80E13A|        |      ;
    dl DATA24_80E12E                                           ;80E13C|        |80E12E;
 
DATA24_80E13F:
    dl $080138,$08019C,$080138,$08019C                         ;80E13F|        |      ;
    dw $FFFE                                                   ;80E14B|        |      ;
    dl DATA24_80E13F                                           ;80E14D|        |80E13F;
 
DATA24_80E150:
    dl $0800EA,$08011C,$0800EA,$0800EA                         ;80E150|        |      ;
    dw $FFFE                                                   ;80E15C|        |      ;
    dl DATA24_80E150                                           ;80E15E|        |80E150;
 
DATA24_80E161:
    dl $08012D,$08012D,$08012D,$08013B                         ;80E161|        |      ;
    dw $FFFE                                                   ;80E16D|        |      ;
    dl DATA24_80E161                                           ;80E16F|        |80E161;
 
DATA24_80E172:
    dl $080048,$08000C                                         ;80E172|        |      ;
    dw $FFFE                                                   ;80E178|        |      ;
    dl DATA24_80E172                                           ;80E17A|        |80E172;
 
DATA24_80E17D:
    dl $080017,$08001A                                         ;80E17D|        |      ;
    dw $FFFE                                                   ;80E183|        |      ;
    dl DATA24_80E17D                                           ;80E185|        |80E17D;
 
DATA24_80E188:
    dl $08001F,$08017F                                         ;80E188|        |      ;
    dw $FFFE                                                   ;80E18E|        |      ;
    dl DATA24_80E188                                           ;80E190|        |80E188;
 
DATA24_80E193:
    dl $0801B4,$080219                                         ;80E193|        |      ;
    dw $FFFE                                                   ;80E199|        |      ;
    dl DATA24_80E193                                           ;80E19B|        |80E193;
 
DATA24_80E19E:
    dl $08004C,$080052                                         ;80E19E|        |      ;
    dw $FFFE                                                   ;80E1A4|        |      ;
    dl DATA24_80E19E                                           ;80E1A6|        |80E19E;
 
DATA24_80E1A9:
    dl $0802BF,$08017F                                         ;80E1A9|        |      ;
    dw $FFFE                                                   ;80E1AF|        |      ;
    dl DATA24_80E1A9                                           ;80E1B1|        |80E1A9;
 
DATA24_80E1B4:
    dl $08009F,$08035F                                         ;80E1B4|        |      ;
    dw $FFFE                                                   ;80E1BA|        |      ;
    dl DATA24_80E1B4                                           ;80E1BC|        |80E1B4;
 
DATA24_80E1BF:
    dl $08029F,$08039F                                         ;80E1BF|        |      ;
    dw $FFFE                                                   ;80E1C5|        |      ;
    dl DATA24_80E1BF                                           ;80E1C7|        |80E1BF;
 
DATA24_80E1CA:
    dl $08218D,$082E10,$082E10,$082E10                         ;80E1CA|        |      ;
    dw $FFFE                                                   ;80E1D6|        |      ;
    dl DATA24_80E1CA                                           ;80E1D8|        |80E1CA;
 
DATA24_80E1DB:
    dl $085F9C,$085F7B,$084AF9,$085F7B                         ;80E1DB|        |      ;
    dw $FFFE                                                   ;80E1E7|        |      ;
    dl DATA24_80E1DB                                           ;80E1E9|        |80E1DB;
 
DATA24_80E1EC:
    dl $084AF9,$084AF9,$08261F,$084AF9                         ;80E1EC|        |      ;
    dw $FFFE                                                   ;80E1F8|        |      ;
    dl DATA24_80E1EC                                           ;80E1FA|        |80E1EC;
 
DATA24_80E1FD:
    dl $08261F,$08261F,$08053E,$08261F                         ;80E1FD|        |      ;
    dw $FFFE                                                   ;80E209|        |      ;
    dl DATA24_80E1FD                                           ;80E20B|        |80E1FD;
 
DATA24_80E20E:
    dl $08053E,$08261F,$084AF9,$08261F                         ;80E20E|        |      ;
    dw $FFFE                                                   ;80E21A|        |      ;
    dl DATA24_80E20E                                           ;80E21C|        |80E20E;
 
DATA24_80E21F:
    dl $08261F,$084AF9,$084AF9,$084AF9                         ;80E21F|        |      ;
    dw $FFFE                                                   ;80E22B|        |      ;
    dl DATA24_80E21F                                           ;80E22D|        |80E21F;
 
DATA24_80E230:
    dl $0803BF,$08261F,$0803BF,$08261F                         ;80E230|        |      ;
    dw $FFFE                                                   ;80E23C|        |      ;
    dl DATA24_80E230                                           ;80E23E|        |80E230;
 
DATA24_80E241:
    dl $0803BF,$08261F,$08053E,$08261F                         ;80E241|        |      ;
    dw $FFFE                                                   ;80E24D|        |      ;
    dl DATA24_80E241                                           ;80E24F|        |80E241;
 
DATA24_80E252:
    dl $08123F,$0806BF                                         ;80E252|        |      ;
    dw $FFFE                                                   ;80E258|        |      ;
    dl DATA24_80E252                                           ;80E25A|        |80E252;
 
DATA24_80E25D:
    dl $080048,$08004D                                         ;80E25D|        |      ;
    dw $FFFE                                                   ;80E263|        |      ;
    dl DATA24_80E25D                                           ;80E265|        |80E25D;
 
DATA24_80E268:
    dl $08021F,$08013A                                         ;80E268|        |      ;
    dw $FFFE                                                   ;80E26E|        |      ;
    dl DATA24_80E268                                           ;80E270|        |80E268;
 
DATA24_80E273:
    dl $0800FA,$08033F                                         ;80E273|        |      ;
    dw $FFFE                                                   ;80E279|        |      ;
    dl DATA24_80E273                                           ;80E27B|        |80E273;
 
DATA24_80E27E:
    dl $080048,$08004F                                         ;80E27E|        |      ;
    dw $FFFE                                                   ;80E284|        |      ;
    dl DATA24_80E27E                                           ;80E286|        |80E27E;
 
DATA24_80E289:
    dl $081E9A,$081F1F                                         ;80E289|        |      ;
    dw $FFFE                                                   ;80E28F|        |      ;
    dl DATA24_80E289                                           ;80E291|        |80E289;
 
DATA24_80E294:
    dl $08021F,$080037                                         ;80E294|        |      ;
    dw $FFFE                                                   ;80E29A|        |      ;
    dl DATA24_80E294                                           ;80E29C|        |80E294;
 
DATA24_80E29F:
    dl $080019,$080025                                         ;80E29F|        |      ;
    dw $FFFE                                                   ;80E2A5|        |      ;
    dl DATA24_80E29F                                           ;80E2A7|        |80E29F;
 
DATA24_80E2AA:
    dl $082E7F,$08233F                                         ;80E2AA|        |      ;
    dw $FFFE                                                   ;80E2B0|        |      ;
    dl DATA24_80E2AA                                           ;80E2B2|        |80E2AA;
 
DATA24_80E2B5:
    dl $080088,$08008C                                         ;80E2B5|        |      ;
    dw $FFFE                                                   ;80E2BB|        |      ;
    dl DATA24_80E2B5                                           ;80E2BD|        |80E2B5;
 
DATA24_80E2C0:
    dl $08009D,$08029F                                         ;80E2C0|        |      ;
    dw $FFFE                                                   ;80E2C6|        |      ;
    dl DATA24_80E2C0                                           ;80E2C8|        |80E2C0;
 
DATA24_80E2CB:
    dl $08021F,$08011F                                         ;80E2CB|        |      ;
    dw $FFFE                                                   ;80E2D1|        |      ;
    dl DATA24_80E2CB                                           ;80E2D3|        |80E2CB;
 
DATA24_80E2D6:
    dl $080090,$08009C                                         ;80E2D6|        |      ;
    dw $FFFE                                                   ;80E2DC|        |      ;
    dl DATA24_80E2D6                                           ;80E2DE|        |80E2D6;
 
DATA24_80E2E1:
    dl $0801DE,$0802BF                                         ;80E2E1|        |      ;
    dw $FFFE                                                   ;80E2E7|        |      ;
    dl DATA24_80E2E1                                           ;80E2E9|        |80E2E1;
 
DATA24_80E2EC:
    dl $08004F,$0800D0                                         ;80E2EC|        |      ;
    dw $FFFE                                                   ;80E2F2|        |      ;
    dl DATA24_80E2EC                                           ;80E2F4|        |80E2EC;
 
DATA24_80E2F7:
    dl $105E0F,$104A54,$107F17                                 ;80E2F7|        |      ;
    dw $FFFE                                                   ;80E300|        |      ;
    dl DATA24_80E2F7                                           ;80E302|        |80E2F7;
 
DATA24_80E305:
    dl $104A54,$107F17,$105E0F                                 ;80E305|        |      ;
    dw $FFFE                                                   ;80E30E|        |      ;
    dl DATA24_80E305                                           ;80E310|        |80E305;
 
DATA24_80E313:
    dl $107F17,$105E0F,$104A54                                 ;80E313|        |      ;
    dw $FFFE                                                   ;80E31C|        |      ;
    dl DATA24_80E313                                           ;80E31E|        |80E313;
 
DATA24_80E321:
    dl $104213,$104257,$1056FC                                 ;80E321|        |      ;
    dw $FFFE                                                   ;80E32A|        |      ;
    dl DATA24_80E321                                           ;80E32C|        |80E321;
 
DATA24_80E32F:
    dl $104257,$1056FC,$104213                                 ;80E32F|        |      ;
    dw $FFFE                                                   ;80E338|        |      ;
    dl DATA24_80E32F                                           ;80E33A|        |80E32F;
 
DATA24_80E33D:
    dl $1056FC,$104213,$104257                                 ;80E33D|        |      ;
    dw $FFFE                                                   ;80E346|        |      ;
    dl DATA24_80E33D                                           ;80E348|        |80E33D;
 
DATA24_80E34B:
    dl $103D4A,$103D4A,$10458C                                 ;80E34B|        |      ;
    dw $FFFE                                                   ;80E354|        |      ;
    dl DATA24_80E34B                                           ;80E356|        |80E34B;
 
DATA24_80E359:
    dl $103D4A,$10458C,$103D4A                                 ;80E359|        |      ;
    dw $FFFE                                                   ;80E362|        |      ;
    dl DATA24_80E359                                           ;80E364|        |80E359;
 
DATA24_80E367:
    dl $10458C,$103D4A,$103D4A                                 ;80E367|        |      ;
    dw $FFFE                                                   ;80E370|        |      ;
    dl DATA24_80E367                                           ;80E372|        |80E367;
 
DATA24_80E375:
    dl $103129,$102908,$10316B                                 ;80E375|        |      ;
    dw $FFFE                                                   ;80E37E|        |      ;
    dl DATA24_80E375                                           ;80E380|        |80E375;
 
DATA24_80E383:
    dl $102908,$10316B,$103129                                 ;80E383|        |      ;
    dw $FFFE                                                   ;80E38C|        |      ;
    dl DATA24_80E383                                           ;80E38E|        |80E383;
 
DATA24_80E391:
    dl $10316B,$103129,$102908                                 ;80E391|        |      ;
    dw $FFFE                                                   ;80E39A|        |      ;
    dl DATA24_80E391                                           ;80E39C|        |80E391;
 
DATA24_80E39F:
    dl $106250,$107271,$107F79                                 ;80E39F|        |      ;
    dw $FFFE                                                   ;80E3A8|        |      ;
    dl DATA24_80E39F                                           ;80E3AA|        |80E39F;
 
DATA24_80E3AD:
    dl $107271,$107F79,$106250                                 ;80E3AD|        |      ;
    dw $FFFE                                                   ;80E3B6|        |      ;
    dl DATA24_80E3AD                                           ;80E3B8|        |80E3AD;
 
DATA24_80E3BB:
    dl $107F79,$106250,$107271                                 ;80E3BB|        |      ;
    dw $FFFE                                                   ;80E3C4|        |      ;
    dl DATA24_80E3BB                                           ;80E3C6|        |80E3BB;
 
DATA24_80E3C9:
    dl $105E78,$105654,$107F19                                 ;80E3C9|        |      ;
    dw $FFFE                                                   ;80E3D2|        |      ;
    dl DATA24_80E3C9                                           ;80E3D4|        |80E3C9;
 
DATA24_80E3D7:
    dl $105654,$107F19,$105E78                                 ;80E3D7|        |      ;
    dw $FFFE                                                   ;80E3E0|        |      ;
    dl DATA24_80E3D7                                           ;80E3E2|        |80E3D7;
 
DATA24_80E3E5:
    dl $107F19,$105E78,$105654                                 ;80E3E5|        |      ;
    dw $FFFE                                                   ;80E3EE|        |      ;
    dl DATA24_80E3E5                                           ;80E3F0|        |80E3E5;
 
DATA24_80E3F3:
    dl $103D4A,$103D4A,$10458C                                 ;80E3F3|        |      ;
    dw $FFFE                                                   ;80E3FC|        |      ;
    dl DATA24_80E3F3                                           ;80E3FE|        |80E3F3;
 
DATA24_80E401:
    dl $103D4A,$10458C,$103D4A                                 ;80E401|        |      ;
    dw $FFFE                                                   ;80E40A|        |      ;
    dl DATA24_80E401                                           ;80E40C|        |80E401;
 
DATA24_80E40F:
    dl $10458C,$103D4A,$103D4A                                 ;80E40F|        |      ;
    dw $FFFE                                                   ;80E418|        |      ;
    dl DATA24_80E40F                                           ;80E41A|        |80E40F;
 
DATA24_80E41D:
    dl $1030E7,$1030E7,$103529                                 ;80E41D|        |      ;
    dw $FFFE                                                   ;80E426|        |      ;
    dl DATA24_80E41D                                           ;80E428|        |80E41D;
 
DATA24_80E42B:
    dl $1030E7,$103529,$1030E7                                 ;80E42B|        |      ;
    dw $FFFE                                                   ;80E434|        |      ;
    dl DATA24_80E42B                                           ;80E436|        |80E42B;
 
DATA24_80E439:
    dl $103529,$1030E7,$1030E7                                 ;80E439|        |      ;
    dw $FFFE                                                   ;80E442|        |      ;
    dl DATA24_80E439                                           ;80E444|        |80E439;
 
DATA24_80E447:
    dl $104A91,$1062CE,$106374                                 ;80E447|        |      ;
    dw $FFFE                                                   ;80E450|        |      ;
    dl DATA24_80E447                                           ;80E452|        |80E447;
 
DATA24_80E455:
    dl $1062CE,$106374,$104A91                                 ;80E455|        |      ;
    dw $FFFE                                                   ;80E45E|        |      ;
    dl DATA24_80E455                                           ;80E460|        |80E455;
 
DATA24_80E463:
    dl $106374,$104A91,$1062CE                                 ;80E463|        |      ;
    dw $FFFE                                                   ;80E46C|        |      ;
    dl DATA24_80E463                                           ;80E46E|        |80E463;
 
DATA24_80E471:
    dl $103694,$103254,$103AFC                                 ;80E471|        |      ;
    dw $FFFE                                                   ;80E47A|        |      ;
    dl DATA24_80E471                                           ;80E47C|        |80E471;
 
DATA24_80E47F:
    dl $103254,$103AFC,$103694                                 ;80E47F|        |      ;
    dw $FFFE                                                   ;80E488|        |      ;
    dl DATA24_80E47F                                           ;80E48A|        |80E47F;
 
DATA24_80E48D:
    dl $103AEC,$103694,$103254                                 ;80E48D|        |      ;
    dw $FFFE                                                   ;80E496|        |      ;
    dl DATA24_80E48D                                           ;80E498|        |80E48D;
 
DATA24_80E49B:
    dl $102DCB,$102DCB,$10360E                                 ;80E49B|        |      ;
    dw $FFFE                                                   ;80E4A4|        |      ;
    dl DATA24_80E49B                                           ;80E4A6|        |80E49B;
 
DATA24_80E4A9:
    dl $102DCB,$10360E,$102DCB                                 ;80E4A9|        |      ;
    dw $FFFE                                                   ;80E4B2|        |      ;
    dl DATA24_80E4A9                                           ;80E4B4|        |80E4A9;
 
DATA24_80E4B7:
    dl $10360E,$102DCB,$102DCB                                 ;80E4B7|        |      ;
    dw $FFFE                                                   ;80E4C0|        |      ;
    dl DATA24_80E4B7                                           ;80E4C2|        |80E4B7;
 
DATA24_80E4C5:
    dl $1030E7,$103127,$10356A                                 ;80E4C5|        |      ;
    dw $FFFE                                                   ;80E4CE|        |      ;
    dl DATA24_80E4C5                                           ;80E4D0|        |80E4C5;
 
DATA24_80E4D3:
    dl $103127,$10356A,$1030E7                                 ;80E4D3|        |      ;
    dw $FFFE                                                   ;80E4DC|        |      ;
    dl DATA24_80E4D3                                           ;80E4DE|        |80E4D3;
 
DATA24_80E4E1:
    dl $10356A,$1030E7,$103127                                 ;80E4E1|        |      ;
    dw $FFFE                                                   ;80E4EA|        |      ;
    dl DATA24_80E4E1                                           ;80E4EC|        |80E4E1;
 
DATA24_80E4EF:
    dl $0A2162,$0A2190,$1025D2,$0A2190                         ;80E4EF|        |      ;
    dw $FFFE                                                   ;80E4FB|        |      ;
    dl DATA24_80E4EF                                           ;80E4FD|        |80E4EF;
 
DATA24_80E500:
    dl $0A0E58,$0A129A,$1016DC,$0A129A                         ;80E500|        |      ;
    dw $FFFE                                                   ;80E50C|        |      ;
    dl DATA24_80E500                                           ;80E50E|        |80E500;
 
DATA24_80E511:
    dl $0A377D,$0A479F,$1053DF,$0A479F                         ;80E511|        |      ;
    dw $FFFE                                                   ;80E51D|        |      ;
    dl DATA24_80E511                                           ;80E51F|        |80E511;
 
DATA24_80E522:
    dl $0A092C,$0A116F,$1011B1,$0A116F                         ;80E522|        |      ;
    dw $FFFE                                                   ;80E52E|        |      ;
    dl DATA24_80E522                                           ;80E530|        |80E522;
 
DATA24_80E533:
    dl $0A0D8E,$0A0DB1,$100DB4,$0A0DB1                         ;80E533|        |      ;
    dw $FFFE                                                   ;80E53F|        |      ;
    dl DATA24_80E533                                           ;80E541|        |80E533;
 
DATA24_80E544:
    dl $0A36D7,$0A3719,$10377F,$0A3719                         ;80E544|        |      ;
    dw $FFFE                                                   ;80E550|        |      ;
    dl DATA24_80E544                                           ;80E552|        |80E544;
 
DATA24_80E555:
    dl $0A27DE,$0A3FFF,$1053FF,$0A3FFF                         ;80E555|        |      ;
    dw $FFFE                                                   ;80E561|        |      ;
    dl DATA24_80E555                                           ;80E563|        |80E555;
 
DATA24_80E566:
    dl $0A196E,$0A1970,$101992,$0A1970                         ;80E566|        |      ;
    dw $FFFE                                                   ;80E572|        |      ;
    dl DATA24_80E566                                           ;80E574|        |80E566;
 
DATA24_80E577:
    dl $0A150A,$0A1D4F,$101D90,$0A1D4F                         ;80E577|        |      ;
    dw $FFFE                                                   ;80E583|        |      ;
    dl DATA24_80E577                                           ;80E585|        |80E577;
 
DATA24_80E588:
    dl $0A0A18,$0A0A1C,$100A9F,$0A0A1C                         ;80E588|        |      ;
    dw $FFFE                                                   ;80E594|        |      ;
    dl DATA24_80E588                                           ;80E596|        |80E588;
 
DATA24_80E599:
    dl $0A2F7C,$0A2FBE,$104BDF,$0A2FBE                         ;80E599|        |      ;
    dw $FFFE                                                   ;80E5A5|        |      ;
    dl DATA24_80E599                                           ;80E5A7|        |80E599;
 
DATA24_80E5AA:
    dl $0A090C,$0A116E,$101190,$0A116E                         ;80E5AA|        |      ;
    dw $FFFE                                                   ;80E5B6|        |      ;
    dl DATA24_80E5AA                                           ;80E5B8|        |80E5AA;
 
DATA24_80E5BB:
    dl $0A1CE8,$0A210A,$10216F,$0A210A                         ;80E5BB|        |      ;
    dw $FFFE                                                   ;80E5C7|        |      ;
    dl DATA24_80E5BB                                           ;80E5C9|        |80E5BB;
 
DATA24_80E5CC:
    dl $0A29F3,$0A2A19,$10327B,$0A2A19                         ;80E5CC|        |      ;
    dw $FFFE                                                   ;80E5D8|        |      ;
    dl DATA24_80E5CC                                           ;80E5DA|        |80E5CC;
 
DATA24_80E5DD:
    dl $0A3EB8,$0A3F3D,$10437F,$0A3F3D                         ;80E5DD|        |      ;
    dw $FFFE                                                   ;80E5E9|        |      ;
    dl DATA24_80E5DD                                           ;80E5EB|        |80E5DD;
 
DATA24_80E5EE:
    dl $0A1D6C,$0A218E,$1025AF,$0A218E                         ;80E5EE|        |      ;
    dw $FFFE                                                   ;80E5FA|        |      ;
    dl DATA24_80E5EE                                           ;80E5FC|        |80E5EE;
 
DATA24_80E5FF:
    dl $107F3B,$106EB5,$0F5E2E,$1051F0                         ;80E5FF|        |      ;
    dl $0C5233,$106EB7                                         ;80E60B|        |      ;
    dw $FFFE                                                   ;80E611|        |      ;
    dl DATA24_80E5FF                                           ;80E613|        |80E5FF;
 
DATA24_80E616:
    dl $106EB7,$105E2E,$0F51F0,$107F39                         ;80E616|        |      ;
    dl $0C51F0,$105233                                         ;80E622|        |      ;
    dw $FFFE                                                   ;80E628|        |      ;
    dl DATA24_80E616                                           ;80E62A|        |80E616;
 
DATA24_80E62D:
    dl $105E2E,$1051F0,$0F7F3B,$106EB7                         ;80E62D|        |      ;
    dl $0C7F39,$104DD1                                         ;80E639|        |      ;
    dw $FFFE                                                   ;80E63F|        |      ;
    dl DATA24_80E62D                                           ;80E641|        |80E62D;
 
DATA24_80E644:
    dl $1051F0,$107F39,$0F6EB7,$105E2E                         ;80E644|        |      ;
    dl $0C6EB7,$107F39                                         ;80E650|        |      ;
    dw $FFFE                                                   ;80E656|        |      ;
    dl DATA24_80E644                                           ;80E658|        |80E644;
 
DATA24_80E65B:
    dl $1041F0,$103DF1,$0F4211,$1041F1                         ;80E65B|        |      ;
    dl $0C4211,$103DF1                                         ;80E667|        |      ;
    dw $FFFE                                                   ;80E66D|        |      ;
    dl DATA24_80E65B                                           ;80E66F|        |80E65B;
 
DATA24_80E672:
    dl $10537B,$1042BB,$0F3234,$103233                         ;80E672|        |      ;
    dl $0C3234,$1042BB                                         ;80E67E|        |      ;
    dw $FFFE                                                   ;80E684|        |      ;
    dl DATA24_80E672                                           ;80E686|        |80E672;
 
DATA24_80E689:
    dl $1042B8,$103234,$0F3233,$1042DB                         ;80E689|        |      ;
    dl $0C3233,$103234                                         ;80E695|        |      ;
    dw $FFFE                                                   ;80E69B|        |      ;
    dl DATA24_80E689                                           ;80E69D|        |80E689;
 
DATA24_80E6A0:
    dl $103234,$103233,$0F42DB,$1032B8                         ;80E6A0|        |      ;
    dl $0C42DB,$103233                                         ;80E6AC|        |      ;
    dw $FFFE                                                   ;80E6B2|        |      ;
    dl DATA24_80E6A0                                           ;80E6B4|        |80E6A0;
 
DATA24_80E6B7:
    dl $103233,$1042DB,$0F32B8,$103234                         ;80E6B7|        |      ;
    dl $0C32B8,$1042DB                                         ;80E6C3|        |      ;
    dw $FFFE                                                   ;80E6C9|        |      ;
    dl DATA24_80E6B7                                           ;80E6CB|        |80E6B7;
 
DATA24_80E6CE:
    dl $1021B1,$1025D1,$0F29D1,$103234                         ;80E6CE|        |      ;
    dl $0C29D1,$1025D1                                         ;80E6DA|        |      ;
    dw $FFFE                                                   ;80E6E0|        |      ;
    dl DATA24_80E6CE                                           ;80E6E2|        |80E6CE;
 
DATA24_80E6E5:
    dl $103213,$101D8C,$0F29CF,$102E11                         ;80E6E5|        |      ;
    dl $0C29CF,$101D8C                                         ;80E6F1|        |      ;
    dw $FFFE                                                   ;80E6F7|        |      ;
    dl DATA24_80E6E5                                           ;80E6F9|        |80E6E5;
 
DATA24_80E6FC:
    dl $102DF1,$103233,$0F1D8C,$1029CF                         ;80E6FC|        |      ;
    dl $0C1D8C,$103233                                         ;80E708|        |      ;
    dw $FFFE                                                   ;80E70E|        |      ;
    dl DATA24_80E6FC                                           ;80E710|        |80E6FC;
 
DATA24_80E713:
    dl $1021AF,$102E11,$0F3233,$101D8C                         ;80E713|        |      ;
    dl $0C3233,$102E11                                         ;80E71F|        |      ;
    dw $FFFE                                                   ;80E725|        |      ;
    dl DATA24_80E713                                           ;80E727|        |80E713;
 
DATA24_80E72A:
    dl $101D6C,$1029CF,$0F2E11,$103233                         ;80E72A|        |      ;
    dl $0C2E11,$1029CF                                         ;80E736|        |      ;
    dw $FFFE                                                   ;80E73C|        |      ;
    dl DATA24_80E72A                                           ;80E73E|        |80E72A;
 
DATA24_80E741:
    dl $101D4C,$101D4C,$0F214C,$10214C                         ;80E741|        |      ;
    dl $0C214C,$101D4C                                         ;80E74D|        |      ;
    dw $FFFE                                                   ;80E753|        |      ;
    dl DATA24_80E741                                           ;80E755|        |80E741;
 
DATA24_80E758:
    dl $10218B,$10192A,$0F1D4B,$101D4B                         ;80E758|        |      ;
    dl $0C1D4B,$10192A                                         ;80E764|        |      ;
    dw $FFFE                                                   ;80E76A|        |      ;
    dl DATA24_80E758                                           ;80E76C|        |80E758;
 
DATA24_80E76F:
    dl $101D4B,$10216B,$0F192A,$101D4B                         ;80E76F|        |      ;
    dl $0C192A,$10216B                                         ;80E77B|        |      ;
    dw $FFFE                                                   ;80E781|        |      ;
    dl DATA24_80E76F                                           ;80E783|        |80E76F;
 
DATA24_80E786:
    dl $101D2A,$101D48,$0F214B,$10192A                         ;80E786|        |      ;
    dl $0C214B,$101D48                                         ;80E792|        |      ;
    dw $FFFE                                                   ;80E798|        |      ;
    dl DATA24_80E786                                           ;80E79A|        |80E786;
 
DATA24_80E79D:
    dl $101928,$101D4B,$0F1D4B,$101D6B                         ;80E79D|        |      ;
    dl $0C1D4B,$101D4B                                         ;80E7A9|        |      ;
    dw $FFFE                                                   ;80E7AF|        |      ;
    dl DATA24_80E79D                                           ;80E7B1|        |80E79D;
 
DATA24_80E7B4:
    dl $107F52,$105D66,$0F7D86,$107E4B                         ;80E7B4|        |      ;
    dl $0C7D86,$105D66                                         ;80E7C0|        |      ;
    dw $FFFE                                                   ;80E7C6|        |      ;
    dl DATA24_80E7B4                                           ;80E7C8|        |80E7B4;
 
DATA24_80E7CB:
    dl $107E4B,$104F32,$0F5D66,$107D86                         ;80E7CB|        |      ;
    dl $0C5D66,$107F32                                         ;80E7D7|        |      ;
    dw $FFFE                                                   ;80E7DD|        |      ;
    dl DATA24_80E7CB                                           ;80E7DF|        |80E7CB;
 
DATA24_80E7E2:
    dl $107D86,$107E4B,$0F7F32,$105D66                         ;80E7E2|        |      ;
    dl $0C7F32,$107E4B                                         ;80E7EE|        |      ;
    dw $FFFE                                                   ;80E7F4|        |      ;
    dl DATA24_80E7E2                                           ;80E7F6|        |80E7E2;
 
DATA24_80E7F9:
    dl $105D66,$107D86,$0F7E4B,$107F32                         ;80E7F9|        |      ;
    dl $0C7E4B,$107D86                                         ;80E805|        |      ;
    dw $FFFE                                                   ;80E80B|        |      ;
    dl DATA24_80E7F9                                           ;80E80D|        |80E7F9;
 
DATA24_80E810:
    dl $105D66,$106186,$0F6586,$1069A6                         ;80E810|        |      ;
    dl $0C6586,$106186                                         ;80E81C|        |      ;
    dw $FFFE                                                   ;80E822|        |      ;
    dl DATA24_80E810                                           ;80E824|        |80E810;
 
DATA24_80E827:
    dl $103F9E,$10169E,$0F1218,$101174                         ;80E827|        |      ;
    dl $0C1218,$10169E                                         ;80E833|        |      ;
    dw $FFFE                                                   ;80E839|        |      ;
    dl DATA24_80E827                                           ;80E83B|        |80E827;
 
DATA24_80E83E:
    dl $10169E,$101218,$0F1174,$102AFA                         ;80E83E|        |      ;
    dl $0C1174,$101218                                         ;80E84A|        |      ;
    dw $FFFE                                                   ;80E850|        |      ;
    dl DATA24_80E83E                                           ;80E852|        |80E83E;
 
DATA24_80E855:
    dl $101218,$101174,$0F3F9E,$10169E                         ;80E855|        |      ;
    dl $0C3F9E,$101174                                         ;80E861|        |      ;
    dw $FFFE                                                   ;80E867|        |      ;
    dl DATA24_80E855                                           ;80E869|        |80E855;
 
DATA24_80E86C:
    dl $101174,$10267B,$0F169E,$101218                         ;80E86C|        |      ;
    dl $0C169E,$10267B                                         ;80E878|        |      ;
    dw $FFFE                                                   ;80E87E|        |      ;
    dl DATA24_80E86C                                           ;80E880|        |80E86C;
 
DATA24_80E883:
    dl $101DB1,$101DB2,$0F1DB3,$101DB3                         ;80E883|        |      ;
    dl $0C1DB3,$101DB2                                         ;80E88F|        |      ;
    dw $FFFE                                                   ;80E895|        |      ;
    dl DATA24_80E883                                           ;80E897|        |80E883;
 
DATA24_80E89A:
    dl $100DB3,$1009B3,$0F0991,$100172                         ;80E89A|        |      ;
    dl $0C0991,$1009B3                                         ;80E8A6|        |      ;
    dw $FFFE                                                   ;80E8AC|        |      ;
    dl DATA24_80E89A                                           ;80E8AE|        |80E89A;
 
DATA24_80E8B1:
    dl $1009B3,$100991,$0F0172,$100DB3                         ;80E8B1|        |      ;
    dl $0C0172,$100991                                         ;80E8BD|        |      ;
    dw $FFFE                                                   ;80E8C3|        |      ;
    dl DATA24_80E8B1                                           ;80E8C5|        |80E8B1;
 
DATA24_80E8C8:
    dl $100991,$100172,$0F0DB3,$1009B3                         ;80E8C8|        |      ;
    dl $0C0DB3,$100172                                         ;80E8D4|        |      ;
    dw $FFFE                                                   ;80E8DA|        |      ;
    dl DATA24_80E8C8                                           ;80E8DC|        |80E8C8;
 
DATA24_80E8DF:
    dl $100172,$100DB3,$0F09B3,$100991                         ;80E8DF|        |      ;
    dl $0C09B3,$100DB3                                         ;80E8EB|        |      ;
    dw $FFFE                                                   ;80E8F1|        |      ;
    dl DATA24_80E8DF                                           ;80E8F3|        |80E8DF;
 
DATA24_80E8F6:
    dl $10194E,$10110C,$0F110B,$10110B                         ;80E8F6|        |      ;
    dl $0C110B,$10110C                                         ;80E902|        |      ;
    dw $FFFE                                                   ;80E908|        |      ;
    dl DATA24_80E8F6                                           ;80E90A|        |80E8F6;
 
DATA24_80E90D:
    dl $10110C,$10110B,$0F110B,$10194E                         ;80E90D|        |      ;
    dl $0C110B,$10110B                                         ;80E919|        |      ;
    dw $FFFE                                                   ;80E91F|        |      ;
    dl DATA24_80E90D                                           ;80E921|        |80E90D;
 
DATA24_80E924:
    dl $10110B,$10110B,$0F194E,$10110C                         ;80E924|        |      ;
    dl $0C194E,$10110B                                         ;80E930|        |      ;
    dw $FFFE                                                   ;80E936|        |      ;
    dl DATA24_80E924                                           ;80E938|        |80E924;
 
DATA24_80E93B:
    dl $10110B,$10194E,$0F110C,$10110B                         ;80E93B|        |      ;
    dl $0C110C,$10194E                                         ;80E947|        |      ;
    dw $FFFE                                                   ;80E94D|        |      ;
    dl DATA24_80E93B                                           ;80E94F|        |80E93B;
 
DATA24_80E952:
    dl $1021AC,$101D8B,$0F0D2B,$100D2B                         ;80E952|        |      ;
    dl $0C0D2B,$101D8B                                         ;80E95E|        |      ;
    dw $FFFE                                                   ;80E964|        |      ;
    dl DATA24_80E952                                           ;80E966|        |80E952;
 
DATA24_80E969:
    dl $100D2B,$100D2B,$0F1D8B,$1021AC                         ;80E969|        |      ;
    dl $0C1D8B,$100D2B                                         ;80E975|        |      ;
    dw $FFFE                                                   ;80E97B|        |      ;
    dl DATA24_80E969                                           ;80E97D|        |80E969;
 
DATA24_80E980:
    dl $1032FE,$1021EE,$0F29D1,$102214                         ;80E980|        |      ;
    dl $0C29D1,$1021EE                                         ;80E98C|        |      ;
    dw $FFFE                                                   ;80E992|        |      ;
    dl DATA24_80E980                                           ;80E994|        |80E980;
 
DATA24_80E997:
    dl $1029F5,$102E76,$0F21EE,$1029D1                         ;80E997|        |      ;
    dl $0C21EE,$102E76                                         ;80E9A3|        |      ;
    dw $FFFE                                                   ;80E9A9|        |      ;
    dl DATA24_80E997                                           ;80E9AB|        |80E997;
 
DATA24_80E9AE:
    dl $1015F4,$103214,$0F2E33,$1021EE                         ;80E9AE|        |      ;
    dl $0C2E33,$103214                                         ;80E9BA|        |      ;
    dw $FFFE                                                   ;80E9C0|        |      ;
    dl DATA24_80E9AE                                           ;80E9C2|        |80E9AE;
 
DATA24_80E9C5:
    dl $101DD3,$1029D1,$0F2E34,$101DD1                         ;80E9C5|        |      ;
    dl $0C2E34,$1029D1                                         ;80E9D1|        |      ;
    dw $FFFE                                                   ;80E9D7|        |      ;
    dl DATA24_80E9C5                                           ;80E9D9|        |80E9C5;
 
DATA24_80E9DC:
    dl $1025EF,$1025CE,$0F25AE,$1025AD                         ;80E9DC|        |      ;
    dl $0C25AE,$1025CE                                         ;80E9E8|        |      ;
    dw $FFFE                                                   ;80E9EE|        |      ;
    dl DATA24_80E9DC                                           ;80E9F0|        |80E9DC;
 
DATA24_80E9F3:
    dl $10214E,$101D4F,$0F1DB4,$101DB4                         ;80E9F3|        |      ;
    dl $0C1DB4,$101D4F                                         ;80E9FF|        |      ;
    dw $FFFE                                                   ;80EA05|        |      ;
    dl DATA24_80E9F3                                           ;80EA07|        |80E9F3;
 
DATA24_80EA0A:
    dl $101DB4,$101D72,$0F1D72,$101D4F                         ;80EA0A|        |      ;
    dl $0C1D72,$101D72                                         ;80EA16|        |      ;
    dw $FFFE                                                   ;80EA1C|        |      ;
    dl DATA24_80EA0A                                           ;80EA1E|        |80EA0A;
 
DATA24_80EA21:
    dl $10377F,$1021B0,$0F161C,$101A59                         ;80EA21|        |      ;
    dl $0C161C,$1021B0                                         ;80EA2D|        |      ;
    dw $FFFE                                                   ;80EA33|        |      ;
    dl DATA24_80EA21                                           ;80EA35|        |80EA21;
 
DATA24_80EA38:
    dl $101A59,$101A9B,$0F21B0,$10161C                         ;80EA38|        |      ;
    dl $0C21B0,$101A9B                                         ;80EA44|        |      ;
    dw $FFFE                                                   ;80EA4A|        |      ;
    dl DATA24_80EA38                                           ;80EA4C|        |80EA38;
 
DATA24_80EA4F:
    dl $10161C,$101A59,$0F1B1F,$1021B0                         ;80EA4F|        |      ;
    dl $0C1B1F,$101A59                                         ;80EA5B|        |      ;
    dw $FFFE                                                   ;80EA61|        |      ;
    dl DATA24_80EA4F                                           ;80EA63|        |80EA4F;
 
DATA24_80EA66:
    dl $100994,$10161C,$0F1A59,$101A9B                         ;80EA66|        |      ;
    dl $0C1A59,$10161C                                         ;80EA72|        |      ;
    dw $FFFE                                                   ;80EA78|        |      ;
    dl DATA24_80EA66                                           ;80EA7A|        |80EA66;
 
DATA24_80EA7D:
    dl $102190,$1021B0,$0F2191,$1021B1                         ;80EA7D|        |      ;
    dl $0C2191,$1021B0                                         ;80EA89|        |      ;
    dw $FFFE                                                   ;80EA8F|        |      ;
    dl DATA24_80EA7D                                           ;80EA91|        |80EA7D;
 
DATA24_80EA94:
    dl $101D4C,$10218E,$0F21B0,$1021B2                         ;80EA94|        |      ;
    dl $0C21B0,$10218E                                         ;80EAA0|        |      ;
    dw $FFFE                                                   ;80EAA6|        |      ;
    dl DATA24_80EA94                                           ;80EAA8|        |80EA94;
 
DATA24_80EAAB:
    dl $1021B2,$101D4C,$0F218E,$1021B0                         ;80EAAB|        |      ;
    dl $0C218E,$101D4C                                         ;80EAB7|        |      ;
    dw $FFFE                                                   ;80EABD|        |      ;
    dl DATA24_80EAAB                                           ;80EABF|        |80EAAB;
 
DATA24_80EAC2:
    dl $1021B0,$1021B2,$0F1D4C,$10218E                         ;80EAC2|        |      ;
    dl $0C1D4C,$1021B2                                         ;80EACE|        |      ;
    dw $FFFE                                                   ;80EAD4|        |      ;
    dl DATA24_80EAC2                                           ;80EAD6|        |80EAC2;
 
DATA24_80EAD9:
    dl $10218E,$1021B0,$0F21B2,$101D4C                         ;80EAD9|        |      ;
    dl $0C21B2,$1021B0                                         ;80EAE5|        |      ;
    dw $FFFE                                                   ;80EAEB|        |      ;
    dl DATA24_80EAD9                                           ;80EAED|        |80EAD9;
 
DATA24_80EAF0:
    dl $101D6C,$101509,$0F1D2C,$101D4C                         ;80EAF0|        |      ;
    dl $0C1D2C,$101509                                         ;80EAFC|        |      ;
    dw $FFFE                                                   ;80EB02|        |      ;
    dl DATA24_80EAF0                                           ;80EB04|        |80EAF0;
 
DATA24_80EB07:
    dl $101D4C,$101D6C,$0F1509,$101D2C                         ;80EB07|        |      ;
    dl $0C1509,$101D6C                                         ;80EB13|        |      ;
    dw $FFFE                                                   ;80EB19|        |      ;
    dl DATA24_80EB07                                           ;80EB1B|        |80EB07;
 
DATA24_80EB1E:
    dl $101D2C,$101D4C,$0F1D6C,$101509                         ;80EB1E|        |      ;
    dl $0C1D6C,$101D4C                                         ;80EB2A|        |      ;
    dw $FFFE                                                   ;80EB30|        |      ;
    dl DATA24_80EB1E                                           ;80EB32|        |80EB1E;
 
DATA24_80EB35:
    dl $101509,$101D2C,$0F1D4C,$101D6C                         ;80EB35|        |      ;
    dl $0C1D4C,$101D2C                                         ;80EB41|        |      ;
    dw $FFFE                                                   ;80EB47|        |      ;
    dl DATA24_80EB35                                           ;80EB49|        |80EB35;
 
DATA24_80EB4C:
    dl $1077DB,$107398,$107398,$107398                         ;80EB4C|        |      ;
    dw $FFFE                                                   ;80EB58|        |      ;
    dl DATA24_80EB4C                                           ;80EB5A|        |80EB4C;
 
DATA24_80EB5D:
    dl $107398,$107398,$1077DB,$107398                         ;80EB5D|        |      ;
    dw $FFFE                                                   ;80EB69|        |      ;
    dl DATA24_80EB5D                                           ;80EB6B|        |80EB5D;
 
DATA24_80EB6E:
    dl $105F7D,$104B3B,$104B3B,$104B3B                         ;80EB6E|        |      ;
    dw $FFFE                                                   ;80EB7A|        |      ;
    dl DATA24_80EB6E                                           ;80EB7C|        |80EB6E;
 
DATA24_80EB7F:
    dl $104B3B,$104B3B,$105F7D,$104B3B                         ;80EB7F|        |      ;
    dw $FFFE                                                   ;80EB8B|        |      ;
    dl DATA24_80EB7F                                           ;80EB8D|        |80EB7F;
 
DATA24_80EB90:
    dl $103295,$102E52,$102E52,$102E52                         ;80EB90|        |      ;
    dw $FFFE                                                   ;80EB9C|        |      ;
    dl DATA24_80EB90                                           ;80EB9E|        |80EB90;
 
DATA24_80EBA1:
    dl $102E52,$102E52,$103295,$102E52                         ;80EBA1|        |      ;
    dw $FFFE                                                   ;80EBAD|        |      ;
    dl DATA24_80EBA1                                           ;80EBAF|        |80EBA1;
 
DATA24_80EBB2:
    dl $10314A,$102D29,$102D29,$102D29                         ;80EBB2|        |      ;
    dw $FFFE                                                   ;80EBBE|        |      ;
    dl DATA24_80EBB2                                           ;80EBC0|        |80EBB2;
 
DATA24_80EBC3:
    dl $102D29,$102D29,$10314A,$102D29                         ;80EBC3|        |      ;
    dw $FFFE                                                   ;80EBCF|        |      ;
    dl DATA24_80EBC3                                           ;80EBD1|        |80EBC3;
 
DATA24_80EBD4:
    dl $107799,$106334,$106334,$106334                         ;80EBD4|        |      ;
    dw $FFFE                                                   ;80EBE0|        |      ;
    dl DATA24_80EBD4                                           ;80EBE2|        |80EBD4;
 
DATA24_80EBE5:
    dl $106334,$106334,$1077DB,$106334                         ;80EBE5|        |      ;
    dw $FFFE                                                   ;80EBF1|        |      ;
    dl DATA24_80EBE5                                           ;80EBF3|        |80EBE5;
 
DATA24_80EBF6:
    dl $10677E,$10471C,$10471C,$10471C                         ;80EBF6|        |      ;
    dw $FFFE                                                   ;80EC02|        |      ;
    dl DATA24_80EBF6                                           ;80EC04|        |80EBF6;
 
DATA24_80EC07:
    dl $10471C,$10471C,$10677E,$10471C                         ;80EC07|        |      ;
    dw $FFFE                                                   ;80EC13|        |      ;
    dl DATA24_80EC07                                           ;80EC15|        |80EC07;
 
DATA24_80EC18:
    dl $105694,$104E31,$104E31,$104E31                         ;80EC18|        |      ;
    dw $FFFE                                                   ;80EC24|        |      ;
    dl DATA24_80EC18                                           ;80EC26|        |80EC18;
 
DATA24_80EC29:
    dl $104E31,$104E31,$105694,$104E31                         ;80EC29|        |      ;
    dw $FFFE                                                   ;80EC35|        |      ;
    dl DATA24_80EC29                                           ;80EC37|        |80EC29;
 
DATA24_80EC3A:
    dl $10498C,$10414A,$10414A,$10414A                         ;80EC3A|        |      ;
    dw $FFFE                                                   ;80EC46|        |      ;
    dl DATA24_80EC3A                                           ;80EC48|        |80EC3A;
 
DATA24_80EC4B:
    dl $10414A,$10414A,$10498C,$10414A                         ;80EC4B|        |      ;
    dw $FFFE                                                   ;80EC57|        |      ;
    dl DATA24_80EC4B                                           ;80EC59|        |80EC4B;
 
DATA24_80EC5C:
    dl $107376,$106334,$106334,$106334                         ;80EC5C|        |      ;
    dw $FFFE                                                   ;80EC68|        |      ;
    dl DATA24_80EC5C                                           ;80EC6A|        |80EC5C;
 
DATA24_80EC6D:
    dl $106334,$106334,$107376,$106334                         ;80EC6D|        |      ;
    dw $FFFE                                                   ;80EC79|        |      ;
    dl DATA24_80EC6D                                           ;80EC7B|        |80EC6D;
 
DATA24_80EC7E:
    dl $10537F,$1042FB,$1042FB,$1042FB                         ;80EC7E|        |      ;
    dw $FFFE                                                   ;80EC8A|        |      ;
    dl DATA24_80EC7E                                           ;80EC8C|        |80EC7E;
 
DATA24_80EC8F:
    dl $1042FB,$1042FB,$10537F,$1042FB                         ;80EC8F|        |      ;
    dw $FFFE                                                   ;80EC9B|        |      ;
    dl DATA24_80EC8F                                           ;80EC9D|        |80EC8F;
 
DATA24_80ECA0:
    dl $104671,$103E31,$103E31,$103E31                         ;80ECA0|        |      ;
    dw $FFFE                                                   ;80ECAC|        |      ;
    dl DATA24_80ECA0                                           ;80ECAE|        |80ECA0;
 
DATA24_80ECB1:
    dl $103E31,$103E31,$104671,$103E31                         ;80ECB1|        |      ;
    dw $FFFE                                                   ;80ECBD|        |      ;
    dl DATA24_80ECB1                                           ;80ECBF|        |80ECB1;
 
DATA24_80ECC2:
    dl $10316A,$102D49,$102D49,$102D49                         ;80ECC2|        |      ;
    dw $FFFE                                                   ;80ECCE|        |      ;
    dl DATA24_80ECC2                                           ;80ECD0|        |80ECC2;
    dl $102D49,$102D49,$10316A,$102D49                         ;80ECD3|        |      ;
    dw $FFFE                                                   ;80ECDF|        |      ;
    dl DATA24_80ECC2                                           ;80ECE1|        |80ECC2;
 
DATA24_80ECE4:
    dl $10779B,$107377,$107377,$107377                         ;80ECE4|        |      ;
    dw $FFFE                                                   ;80ECF0|        |      ;
    dl DATA24_80ECE4                                           ;80ECF2|        |80ECE4;
 
DATA24_80ECF5:
    dl $107377,$107377,$10779B,$107377                         ;80ECF5|        |      ;
    dw $FFFE                                                   ;80ED01|        |      ;
    dl DATA24_80ECF5                                           ;80ED03|        |80ECF5;
 
DATA24_80ED06:
    dl $106F59,$106B37,$106B37,$106B37                         ;80ED06|        |      ;
    dw $FFFE                                                   ;80ED12|        |      ;
    dl DATA24_80ED06                                           ;80ED14|        |80ED06;
 
DATA24_80ED17:
    dl $106B37,$106B37,$106F59,$106B37                         ;80ED17|        |      ;
    dw $FFFE                                                   ;80ED23|        |      ;
    dl DATA24_80ED17                                           ;80ED25|        |80ED17;
 
DATA24_80ED28:
    dl $105AB5,$105273,$105273,$105273                         ;80ED28|        |      ;
    dw $FFFE                                                   ;80ED34|        |      ;
    dl DATA24_80ED28                                           ;80ED36|        |80ED28;
 
DATA24_80ED39:
    dl $105273,$105273,$105AB5,$105273                         ;80ED39|        |      ;
    dw $FFFE                                                   ;80ED45|        |      ;
    dl DATA24_80ED39                                           ;80ED47|        |80ED39;
 
DATA24_80ED4A:
    dl $104DEE,$1045CE,$1045CE,$1045CE                         ;80ED4A|        |      ;
    dw $FFFE                                                   ;80ED56|        |      ;
    dl DATA24_80ED4A                                           ;80ED58|        |80ED4A;
 
DATA24_80ED5B:
    dl $1045CE,$1045CE,$104DEE,$1045CE                         ;80ED5B|        |      ;
    dw $FFFE                                                   ;80ED67|        |      ;
    dl DATA24_80ED5B                                           ;80ED69|        |80ED5B;
 
DATA24_80ED6C:
    dl $0C5185,$0C61E8,$0C6E4C,$0C7F0C                         ;80ED6C|        |      ;
    dl $0C6E4C,$0C61E8                                         ;80ED78|        |      ;
    dw $FFFE                                                   ;80ED7E|        |      ;
    dl DATA24_80ED6C                                           ;80ED80|        |80ED6C;
 
DATA24_80ED83:
    dl $0C69E7,$0C7988,$0C69E7,$0C6167                         ;80ED83|        |      ;
    dl $0C69E7,$0C7988                                         ;80ED8F|        |      ;
    dw $FFFE                                                   ;80ED95|        |      ;
    dl DATA24_80ED83                                           ;80ED97|        |80ED83;
 
DATA24_80ED9A:
    dl $0F7E2C,$0F7F97,$0F7F53,$0F7EE7                         ;80ED9A|        |      ;
    dw $FFFE                                                   ;80EDA6|        |      ;
    dl DATA24_80ED9A                                           ;80EDA8|        |80ED9A;
 
DATA24_80EDAB:
    dl $0F7EEF,$0F7E2C,$0F7F97,$0F7F53                         ;80EDAB|        |      ;
    dw $FFFE                                                   ;80EDB7|        |      ;
    dl DATA24_80EDAB                                           ;80EDB9|        |80EDAB;
 
DATA24_80EDBC:
    dl $0F7F53,$0F7EEF,$0F7E2C,$0F7F97                         ;80EDBC|        |      ;
    dw $FFFE                                                   ;80EDC8|        |      ;
    dl DATA24_80EDBC                                           ;80EDCA|        |80EDBC;
 
DATA24_80EDCD:
    dl $0F7F97,$0F7F53,$0F7EE7,$0F7E2C                         ;80EDCD|        |      ;
    dw $FFFE                                                   ;80EDD9|        |      ;
    dl DATA24_80EDCD                                           ;80EDDB|        |80EDCD;
 
DATA24_80EDDE:
    dl $0F0070,$0F0E5F,$0F03FF                                 ;80EDDE|        |      ;
    dw $FFFE                                                   ;80EDE7|        |      ;
    dl DATA24_80EDDE                                           ;80EDE9|        |80EDDE;
 
DATA24_80EDEC:
    dl $0F0E5F,$0F0070,$0F03FF                                 ;80EDEC|        |      ;
    dw $FFFE                                                   ;80EDF5|        |      ;
    dl DATA24_80EDEC                                           ;80EDF7|        |80EDEC;
 
DATA24_80EDFA:
    dl $0F03FF,$0F0E5F,$0F0070                                 ;80EDFA|        |      ;
    dw $FFFE                                                   ;80EE03|        |      ;
    dl DATA24_80EDFA                                           ;80EE05|        |80EDFA;
 
DATA24_80EE08:
    dl $08000C,$08000A,$080009                                 ;80EE08|        |      ;
    dw $FFFE                                                   ;80EE11|        |      ;
    dl DATA24_80EE08                                           ;80EE13|        |80EE08;
 
DATA24_80EE16:
    dl $08000A,$0800D8,$08027E                                 ;80EE16|        |      ;
    dw $FFFE                                                   ;80EE1F|        |      ;
    dl DATA24_80EE16                                           ;80EE21|        |80EE16;
 
DATA24_80EE24:
    dl $08017F,$08029F,$0800D2                                 ;80EE24|        |      ;
    dw $FFFE                                                   ;80EE2D|        |      ;
    dl DATA24_80EE24                                           ;80EE2F|        |80EE24;
 
DATA24_80EE32:
    dl $08031F,$08035F,$0803FF                                 ;80EE32|        |      ;
    dw $FFFE                                                   ;80EE3B|        |      ;
    dl DATA24_80EE32                                           ;80EE3D|        |80EE32;
 
DATA24_80EE40:
    dl $102279,$10229B,$1022DC                                 ;80EE40|        |      ;
    dw $FFFE                                                   ;80EE49|        |      ;
    dl DATA24_80EE40                                           ;80EE4B|        |80EE40;
 
DATA24_80EE4E:
    dl $100854,$1008DE,$1008DC                                 ;80EE4E|        |      ;
    dw $FFFE                                                   ;80EE57|        |      ;
    dl DATA24_80EE4E                                           ;80EE59|        |80EE4E;
 
DATA24_80EE5C:
    dl $10089D,$1008DE,$10091F                                 ;80EE5C|        |      ;
    dw $FFFE                                                   ;80EE65|        |      ;
    dl DATA24_80EE5C                                           ;80EE67|        |80EE5C;
 
DATA24_80EE6A:
    dl $1008DF,$1008DF,$100A1F                                 ;80EE6A|        |      ;
    dw $FFFE                                                   ;80EE73|        |      ;
    dl DATA24_80EE6A                                           ;80EE75|        |80EE6A;
 
DATA24_80EE78:
    dl $1008DF,$100A3F,$100A9F                                 ;80EE78|        |      ;
    dw $FFFE                                                   ;80EE81|        |      ;
    dl DATA24_80EE78                                           ;80EE83|        |80EE78;
 
DATA24_80EE86:
    dl $10029F,$10029F,$10031F                                 ;80EE86|        |      ;
    dw $FFFE                                                   ;80EE8F|        |      ;
    dl DATA24_80EE86                                           ;80EE91|        |80EE86;
 
DATA24_80EE94:
    dl $10035F,$1003DF,$1003FF                                 ;80EE94|        |      ;
    dw $FFFE                                                   ;80EE9D|        |      ;
    dl DATA24_80EE94                                           ;80EE9F|        |80EE94;
 
DATA24_80EEA2:
    dl $0C0A3C,$0C00DB,$0C00DF,$0C00DF                         ;80EEA2|        |      ;
    dw $FFFE                                                   ;80EEAE|        |      ;
    dl DATA24_80EEA2                                           ;80EEB0|        |80EEA2;
 
DATA24_80EEB3:
    dl $0C09B3,$0C11FF,$0C0A5F,$0C125F                         ;80EEB3|        |      ;
    dw $FFFE                                                   ;80EEBF|        |      ;
    dl DATA24_80EEB3                                           ;80EEC1|        |80EEB3;
 
DATA24_80EEC4:
    dl $0C0992,$0C0A15,$0C023A,$0C133F                         ;80EEC4|        |      ;
    dw $FFFE                                                   ;80EED0|        |      ;
    dl DATA24_80EEC4                                           ;80EED2|        |80EEC4;
 
DATA24_80EED5:
    dl $102A98,$10433D,$102A98,$104F7F                         ;80EED5|        |      ;
    dl $104F5F,$10433D                                         ;80EEE1|        |      ;
    dw $FFFE                                                   ;80EEE7|        |      ;
    dl DATA24_80EED5                                           ;80EEE9|        |80EED5;
 
DATA24_80EEEC:
    dl $1042FA,$102A98,$1042FA,$102ADB                         ;80EEEC|        |      ;
    dl $10371C,$102A98,$102ADB                                 ;80EEF8|        |      ;
    dw $FFFE                                                   ;80EF01|        |      ;
    dl DATA24_80EEEC                                           ;80EF03|        |80EEEC;
 
DATA24_80EF06:
    dl $080049,$08004C                                         ;80EF06|        |      ;
    dw $FFFE                                                   ;80EF0C|        |      ;
    dl DATA24_80EF06                                           ;80EF0E|        |80EF06;
 
DATA24_80EF11:
    dl $080037,$08013D                                         ;80EF11|        |      ;
    dw $FFFE                                                   ;80EF17|        |      ;
    dl DATA24_80EF11                                           ;80EF19|        |80EF11;
 
DATA24_80EF1C:
    dl $08025F,$0802DF                                         ;80EF1C|        |      ;
    dw $FFFE                                                   ;80EF22|        |      ;
    dl DATA24_80EF1C                                           ;80EF24|        |80EF1C;
 
    pad $80FFB0
