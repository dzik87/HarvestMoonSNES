; Bank $80 module "routines" - starts at $809553
 
 
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
    JSL.L fAudio_FadeOutOnTrackChangeSlow                                 ;8096A7|22018483|838401;
 
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
 
fMap_ResetAndLoadDestinationArea:
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
    JSL.L fObject_InitTileCache                                  ;809703|22D78E85|858ED7;
    JSL.L fObject_ClearGameObject                              ;809707|220F8285|85820F;
    JSL.L fObjectSlots_ClearAll                                   ;80970B|22C7A481|81A4C7;
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
    JSL.L fDialog_LoadDialogBoxGraphics                               ;8098A8|22BB9283|8392BB;
    SEP #$20                                                   ;8098AC|E220    |      ;
    PLA                                                        ;8098AE|68      |      ;
    STA.B strcMap.loadAreaId                                   ;8098AF|8522    |000022;
    JSL.L fObjectMap_LoadData                                  ;8098B1|22FBA582|82A5FB;
    JSL.L fTileMap_MapChangeHandler                            ;8098B5|22C6A780|80A7C6;
    JSL.L fPalette_ChangeTimePallete                           ;8098B9|22E29280|8092E2;
    JSL.L fPalette_PrepareSpritePalette                        ;8098BD|22299380|809329;
    JSL.L fSubrutinesExecute_809553                            ;8098C1|22539580|809553;
    JSL.L fPalette_LoadMapPallete                              ;8098C5|22419280|809241;
    JSL.L fPalette_ProcessColorAnimSlots                                  ;8098C9|22698E80|808E69;
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
    JSL.L fItemCarried_LoadPoseData                                      ;80997F|22B78081|8180B7;
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
    JSL.L fObjectSlots_Allocate                                      ;8099A0|2200A581|81A500;
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
    JSL.L fPlayer_InitSpriteObject                                      ;8099CD|22A0CF81|81CFA0;
    JSL.L fPlayer_UpdateHandler                      ;8099D1|22B7BF81|81BFB7;
    REP #$30                                                   ;8099D5|C230    |      ;
    %CheckFlag(daily3, $0002)
    BNE .label13                                               ;8099DE|D004    |8099E4;
    JSL.L fGameEngine_SpawnChickensOnMap                     ;8099E0|2296C283|83C296;
 
.label13:
    %SetPlayerAction(!PACTION_NONE)
    JSL.L fAudio_FadeOutOnTrackChangeFast                                 ;8099EB|221F8483|83841F;
    JSL.L fAudio_LoadPendingTrack                                 ;8099EF|22A48383|8383A4;
    JSL.L fAudio_StartPendingTrack                                 ;8099F3|22808383|838380;
    JSL.L fToolUsedSound_PlayOnToolChange                         ;8099F7|22F38F82|828FF3;
    SEP #$20                                                   ;8099FB|E220    |      ;
    LDA.W strcAudio.trackId                                    ;8099FD|AD1001  |000110;
    STA.W strcAudio.trackIdCopy                                ;809A00|8D1701  |000117;
    JSL.L fCore_WaitForNextNMI                                 ;809A03|22458680|808645;
    REP #$20                                                   ;809A07|C220    |      ;
    LDA.W #$1800                                               ;809A09|A90018  |      ;
    STA.B $C7                                                  ;809A0C|85C7    |0000C7;
    JSL.L fObjectSlots_UpdateAll                                      ;809A0E|2283A381|81A383;
    JSL.L fAI_HowToPlaySetup                                   ;809A12|226F8184|84816F;
    JSL.L fObject_UpdateAllAnimations                                ;809A16|22C78285|8582C7;
    JSL.L fObject_ProcessTileLoadQueue                                      ;809A1A|22B28C85|858CB2;
    JSL.L fObject_RenderAll                                      ;809A1E|22E08385|8583E0;
    SEP #$20                                                   ;809A22|E220    |      ;
    STZ.B $00                                                  ;809A24|6400    |000000;
    JSL.L fCore_WaitForNextNMI                                 ;809A26|22458680|808645;
    REP #$20                                                   ;809A2A|C220    |      ;
    LDA.W #$1800                                               ;809A2C|A90018  |      ;
    STA.B $C7                                                  ;809A2F|85C7    |0000C7;
    JSL.L fObjectSlots_UpdateAll                                      ;809A31|2283A381|81A383;
    JSL.L fAI_HowToPlaySetup                                   ;809A35|226F8184|84816F;
    JSL.L fObject_UpdateAllAnimations                                ;809A39|22C78285|8582C7;
    JSL.L fObject_ProcessTileLoadQueue                                      ;809A3D|22B28C85|858CB2;
    JSL.L fObject_RenderAll                                      ;809A41|22E08385|8583E0;
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
    JSL.L fTileScript_Start                                ;809C56|22E1A581|81A5E1;
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
    JSL.L fEvents_NoonMealCheck                                      ;809CFB|22AA8082|8280AA;
 
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
 
 
fCamera_UpdateFromPlayerPos:
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
 
 
fCamera_UpdateBG2Scroll:
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
 
 
fCamera_ScrollDownStep:
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
    JSL.L fMap_StreamRowDown                                      ;80A0DC|228DA180|80A18D;
 
.return:
    RTL                                                        ;80A0E0|6B      |      ;
 
 
fCamera_ScrollUpStep:
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
    JSL.L fMap_StreamRowUp                                      ;80A117|2208A380|80A308;
 
.return:
    RTL                                                        ;80A11B|6B      |      ;
 
 
fCamera_ScrollRightStep:
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
    JSL.L fMap_StreamColumnRight                                      ;80A14D|2281A480|80A481;
 
.return:
    RTL                                                        ;80A151|6B      |      ;
 
 
fCamera_ScrollLeftStep:
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
    JSL.L fMap_StreamColumnLeft                                      ;80A188|2217A680|80A617;
 
.return:
    RTL                                                        ;80A18C|6B      |      ;
 
 
fMap_StreamRowDown:
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
 
 
fMap_StreamRowUp:
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
 
 
fMap_StreamColumnRight:
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
 
 
fMap_StreamColumnLeft:
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
