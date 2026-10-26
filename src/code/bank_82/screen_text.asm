; Bank $82 module "screen_text" - starts at $82E80C
 
 
fScreen_NameInput:
    SEP #$20                                                   ;82E80C|E220    |      ;
    LDA.B #!AREA_NAMEINPUT                                                 
    STA.B strcMap.loadAreaId                                   ;82E810|8522    |000022;
    JSL.L fAudioEngine_MapMusicHandler                         ;82E812|22DE9580|8095DE;
    JSL.L fAudio_FadeOutOnTrackChangeSlow                                 ;82E816|22018483|838401;
    SEP #$20                                                   ;82E81A|E220    |      ;
    LDA.B #$0F                                                 ;82E81C|A90F    |      ;
    STA.B strcVariables.n8Temp1                                ;82E81E|8592    |000092;
    LDA.B #$03                                                 ;82E820|A903    |      ;
    STA.B strcVariables.n8Temp2                                ;82E822|8593    |000093;
    LDA.B #$01                                                 ;82E824|A901    |      ;
    STA.B strcVariables.n8Temp3                                ;82E826|8594    |000094;
    JSL.L fCore_ScreenFadeout                                  ;82E828|220A8880|80880A;
    JSL.L fCore_SetForceBlank                                  ;82E82C|220F8E80|808E0F;
    JSL.L fCore_ZeroVRAM                                       ;82E830|22468880|808846;
    JSL.L fCore_Zero0x42Ptr                                    ;82E834|22AB8F80|808FAB;
    JSL.L fObject_InitTileCache                                  ;82E838|22D78E85|858ED7;
    JSL.L fObject_ClearGameObject                              ;82E83C|220F8285|85820F;
    REP #$20                                                   ;82E840|C220    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;82E842|AD9601  |000196;
    STA.W strcDialogDisplay.mapFlagsBackup                     ;82E845|8D9801  |000198;
    STZ.W strcDialogDisplay.mapFlags                           ;82E848|9C9601  |000196;
    STZ.W strcObjectData.gameObjectIdx                         ;82E84B|9C0509  |000905;
    SEP #$20                                                   ;82E84E|E220    |      ;
    LDA.B #$05                                                 ;82E850|A905    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;82E852|8D9A01  |00019A;
    SEP #$20                                                   ;82E855|E220    |      ;
    LDA.B #$04                                                 ;82E857|A904    |      ;
    JSL.L fCore_ManageGraphicsPresets                          ;82E859|22598C80|808C59;
    JSL.L fTileMap_MapChangeHandler                            ;82E85D|22C6A780|80A7C6;
    REP #$20                                                   ;82E861|C220    |      ;
    LDA.W #$006F                                               ;82E863|A96F00  |      ;
    JSL.L fPalette_LoadFirstHalf                               ;82E866|22CF9180|8091CF;
    SEP #$20                                                   ;82E86A|E220    |      ;
    REP #$10                                                   ;82E86C|C210    |      ;
    LDA.B #$00                                                 ;82E86E|A900    |      ;
    STA.B strcSystem.arrayIndex                                ;82E870|8527    |000027;
    LDA.B #$22                                                 ;82E872|A922    |      ;
    STA.B strcSystem.destinationRegister                       ;82E874|8529    |000029;
    REP #$20                                                   ;82E876|C220    |      ;
    LDY.W #$0100                                               ;82E878|A00001  |      ;
    LDX.W #$0000                                               ;82E87B|A20000  |      ;
    LDA.W #$8C00                                               ;82E87E|A9008C  |      ;
    STA.B ptrTemp0x72                                          ;82E881|8572    |000072;
    SEP #$20                                                   ;82E883|E220    |      ;
    LDA.B #$A9                                                 ;82E885|A9A9    |      ;
    STA.B ptrTemp0x72+2                                        ;82E887|8574    |000074;
    JSL.L fCore_PrepareTransfer                                ;82E889|22338A80|808A33;
    SEP #$20                                                   ;82E88D|E220    |      ;
    REP #$10                                                   ;82E88F|C210    |      ;
    LDA.B #$01                                                 ;82E891|A901    |      ;
    STA.B strcSystem.arrayIndex                                ;82E893|8527    |000027;
    LDA.B #$22                                                 ;82E895|A922    |      ;
    STA.B strcSystem.destinationRegister                       ;82E897|8529    |000029;
    REP #$20                                                   ;82E899|C220    |      ;
    LDY.W #$0100                                               ;82E89B|A00001  |      ;
    LDX.W #$0080                                               ;82E89E|A28000  |      ;
    LDA.W #$DE00                                               ;82E8A1|A900DE  |      ;
    STA.B ptrTemp0x72                                          ;82E8A4|8572    |000072;
    SEP #$20                                                   ;82E8A6|E220    |      ;
    LDA.B #$A9                                                 ;82E8A8|A9A9    |      ;
    STA.B ptrTemp0x72+2                                        ;82E8AA|8574    |000074;
    JSL.L fCore_PrepareTransfer                                ;82E8AC|22338A80|808A33;
    JSL.L fCore_StartTransfer                                  ;82E8B0|22F08A80|808AF0;
    JSL.L fObjectSlots_ClearAll                                   ;82E8B4|22C7A481|81A4C7;
    REP #$20                                                   ;82E8B8|C220    |      ;
    LDA.W #$0219                                               ;82E8BA|A91902  |      ;
    STA.B strcObject.spriteTableIdx                            ;82E8BD|85A1    |0000A1;
    STA.W strcMenuData.spriteTableIdx                          ;82E8BF|8D9709  |000997;
    LDA.W #$0000                                               ;82E8C2|A90000  |      ;
    STA.B strcObject.flip                                      ;82E8C5|859F    |00009F;
    STA.W strcMenuData.flip                                    ;82E8C7|8D9909  |000999;
    LDA.W #$0028                                               ;82E8CA|A92800  |      ;
    STA.B strcObject.posX                                      ;82E8CD|859B    |00009B;
    STA.W strcMenuData.posX                                    ;82E8CF|8D9B09  |00099B;
    LDA.W #$0044                                               ;82E8D2|A94400  |      ;
    STA.B strcObject.posY                                      ;82E8D5|859D    |00009D;
    STA.W strcMenuData.posY                                    ;82E8D7|8D9D09  |00099D;
    STZ.B strcObject.unkA3                                     ;82E8DA|64A3    |0000A3;
    JSL.L fObject_Create                                      ;82E8DC|22008085|858000;
    REP #$20                                                   ;82E8E0|C220    |      ;
    LDA.B strcObject.gameObjectIdx                             ;82E8E2|A5A5    |0000A5;
    STA.W strcMenuData.gameObjectIdx                           ;82E8E4|8D9509  |000995;
    JSL.L fScreen_NameInput_DrawNameBox                                      ;82E8E7|22B4EA82|82EAB4;
    JSL.L fScreen_NameInput_DrawEmptyNameSlots                                      ;82E8EB|2280EA82|82EA80;
    REP #$20                                                   ;82E8EF|C220    |      ;
    STZ.W strcBGScrool.BG1HorOffs                              ;82E8F1|9C3C01  |00013C;
    STZ.W strcBGScrool.BG1VerOffs                              ;82E8F4|9C3E01  |00013E;
    STZ.W strcBGScrool.BG2HorOffs                              ;82E8F7|9C4001  |000140;
    STZ.W strcBGScrool.BG2VerOffs                              ;82E8FA|9C4201  |000142;
    STZ.W strcBGScrool.BG3HorOffs                              ;82E8FD|9C4401  |000144;
    STZ.W strcBGScrool.BG3VerOffs                              ;82E900|9C4601  |000146;
    JSL.L fAudio_FadeOutOnTrackChangeFast                                 ;82E903|221F8483|83841F;
    JSL.L fAudio_LoadPendingTrack                                 ;82E907|22A48383|8383A4;
    JSL.L fAudio_StartPendingTrack                                 ;82E90B|22808383|838380;
    SEP #$20                                                   ;82E90F|E220    |      ;
    LDA.W strcAudio.trackId                                    ;82E911|AD1001  |000110;
    STA.W strcAudio.trackIdCopy                                ;82E914|8D1701  |000117;
    JSL.L fCore_ResetForceBlank                                ;82E917|221E8E80|808E1E;
    JSL.L fCore_WaitForNextNMI                                 ;82E91B|22458680|808645;
    SEP #$20                                                   ;82E91F|E220    |      ;
    LDA.B #$03                                                 ;82E921|A903    |      ;
    STA.B strcVariables.n8Temp1                                ;82E923|8592    |000092;
    LDA.B #$03                                                 ;82E925|A903    |      ;
    STA.B strcVariables.n8Temp2                                ;82E927|8593    |000093;
    LDA.B #$0F                                                 ;82E929|A90F    |      ;
    STA.B strcVariables.n8Temp3                                ;82E92B|8594    |000094;
    JSL.L fCore_ScreenFadein                                   ;82E92D|22CE8780|8087CE;
    REP #$20                                                   ;82E931|C220    |      ;
    STZ.W strcMenuData.menuIdx                                 ;82E933|9C9109  |000991;
    SEP #$20                                                   ;82E936|E220    |      ;
    LDA.B #$00                                                 ;82E938|A900    |      ;
    STA.W strcMenuData.tableSelector                           ;82E93A|8D9309  |000993;
    STZ.W strcMenuData.nameEntryIdx                            ;82E93D|9C9409  |000994;
    STZ.W strcDialogDisplay.dialogBlinkTimer                   ;82E940|9C8B01  |00018B;
    SEP #$20                                                   ;82E943|E220    |      ;
    LDA.B #$B1                                                 ;82E945|A9B1    |      ;
    STA.W strcNames.sTemp                                      ;82E947|8D8508  |000885;
    LDA.B #$B1                                                 ;82E94A|A9B1    |      ;
    STA.W strcNames.sTemp+1                                    ;82E94C|8D8608  |000886;
    LDA.B #$B1                                                 ;82E94F|A9B1    |      ;
    STA.W strcNames.sTemp+2                                    ;82E951|8D8708  |000887;
    LDA.B #$B1                                                 ;82E954|A9B1    |      ;
    STA.W strcNames.sTemp+3                                    ;82E956|8D8808  |000888;
    STZ.B strcVariables.n8Temp3                                ;82E959|6494    |000094;
    STZ.B strcVariables.u8Unk96                                ;82E95B|6496    |000096;
    STZ.B strcVariables.u8Unk97                                ;82E95D|6497    |000097;
 
  - SEP #$20                                                   ;82E95F|E220    |      ;
    LDA.B $00                                                  ;82E961|A500    |000000;
    BEQ -                                                      ;82E963|F0FA    |82E95F;
    REP #$20                                                   ;82E965|C220    |      ;
    LDA.W #$1800                                               ;82E967|A90018  |      ;
    STA.B $C7                                                  ;82E96A|85C7    |0000C7;
    JSR.W fScreen_NameInput_BlinkCursor                                      ;82E96C|2015EA  |82EA15;
    JSL.L fInput_Handler                                       ;82E96F|2234C084|84C034;
    SEP #$20                                                   ;82E973|E220    |      ;
    LDA.W strcMenuData.tableSelector                           ;82E975|AD9309  |000993;
    CMP.B #$03                                                 ;82E978|C903    |      ;
    BNE +                                                      ;82E97A|D003    |82E97F;
    JMP.W .nameHandler                                         ;82E97C|4CCEE9  |82E9CE;
 
 
  + JSL.L fMenu_LoadNameInputCursorPos                                  ;82E97F|2257EB82|82EB57;
    SEP #$20                                                   ;82E983|E220    |      ;
    LDA.B strcVariables.u8Unk96                                ;82E985|A596    |000096;
    CMP.B #$01                                                 ;82E987|C901    |      ;
    BNE .continue                                              ;82E989|D00C    |82E997;
    STZ.B strcVariables.u8Unk96                                ;82E98B|6496    |000096;
    REP #$20                                                   ;82E98D|C220    |      ;
    INC.W strcBGScrool.BG2HorOffs                              ;82E98F|EE4001  |000140;
    DEC.W strcBGScrool.BG2VerOffs                              ;82E992|CE4201  |000142;
    BRA +                                                      ;82E995|8004    |82E99B;
 
 
.continue:
    SEP #$20                                                   ;82E997|E220    |      ;
    INC.B strcVariables.u8Unk96                                ;82E999|E696    |000096;
 
  + REP #$20                                                   ;82E99B|C220    |      ;
    LDA.W strcMenuData.spriteTableIdx                          ;82E99D|AD9709  |000997;
    STA.B strcObject.spriteTableIdx                            ;82E9A0|85A1    |0000A1;
    LDA.W strcMenuData.flip                                    ;82E9A2|AD9909  |000999;
    STA.B strcObject.flip                                      ;82E9A5|859F    |00009F;
    LDA.W strcMenuData.posX                                    ;82E9A7|AD9B09  |00099B;
    STA.B strcObject.posX                                      ;82E9AA|859B    |00009B;
    LDA.W strcMenuData.posY                                    ;82E9AC|AD9D09  |00099D;
    STA.B strcObject.posY                                      ;82E9AF|859D    |00009D;
    LDA.W strcMenuData.gameObjectIdx                           ;82E9B1|AD9509  |000995;
    STA.B strcObject.gameObjectIdx                             ;82E9B4|85A5    |0000A5;
    JSL.L fObject_UpdatePositionAndFlip                                ;82E9B6|22B98085|8580B9;
    JSL.L fObject_UpdateAllAnimations                                ;82E9BA|22C78285|8582C7;
    JSL.L fObject_ProcessTileLoadQueue                                      ;82E9BE|22B28C85|858CB2;
    JSL.L fObject_RenderAll                                      ;82E9C2|22E08385|8583E0;
    SEP #$20                                                   ;82E9C6|E220    |      ;
    STZ.B $00                                                  ;82E9C8|6400    |000000;
    if !REGION_EUDE
    JML.L L_82E95F
    elseif !REGION_JP
    JML.L L_82E95F
    else
    JML.L $82E95F                                              ;82E9CA|5C5FE982|82E95F;
    endif
 
 
.nameHandler:
    REP #$20                                                   ;82E9CE|C220    |      ;
    LDA.W strcDialogDisplay.mapFlagsBackup                     ;82E9D0|AD9801  |000198;
    STA.W strcDialogDisplay.mapFlags                           ;82E9D3|8D9601  |000196;
    SEP #$20                                                   ;82E9D6|E220    |      ;
    LDA.W strcMenuData.nameDestinationIdx                      ;82E9D8|AD9F09  |00099F;
    CMP.B #!NI_PLAYER                                                 
    BNE +                                                      ;82E9DD|D004    |82E9E3;
    JML.L fCore_SetPlayerName                                  ;82E9DF|5CED8080|8080ED;
 
 
  + CMP.B #!NI_COWBOUGHT                                                 
    BNE +                                                      ;82E9E5|D004    |82E9EB;
    JML.L fCore_SetBoughtCowName                               ;82E9E7|5C5F8180|80815F;
 
 
  + CMP.B #!NI_COWBORN                                                 
    BNE +                                                      ;82E9ED|D004    |82E9F3;
    JML.L fCore_SetBornCowName                                 ;82E9EF|5CD28180|8081D2;
 
 
  + CMP.B #!NI_DOG                                                 
    BNE +                                                      ;82E9F5|D004    |82E9FB;
    JML.L fCore_SetDogName                                     ;82E9F7|5C548280|808254;
 
 
  + CMP.B #!NI_HORSE                                                 
    BNE +                                                      ;82E9FD|D004    |82EA03;
    JML.L fCore_SetHorseName                                   ;82E9FF|5CC68280|8082C6;
 
 
  + CMP.B #!NI_FIRSTHILD                                                 
    BNE +                                                      ;82EA05|D004    |82EA0B;
    JML.L fCore_SetFirstChildName                              ;82EA07|5C388380|808338;
 
 
  + CMP.B #!NI_SECONDCHILD                                                 
    BNE +                                                      ;82EA0D|D004    |82EA13;
    JML.L fCore_SetSecondChildName                             ;82EA0F|5CAE8380|8083AE;
 
 
  + BRA .nameHandler                                           ;82EA13|80B9    |82E9CE;
 
 
fScreen_NameInput_BlinkCursor:
    SEP #$20                                                   ;82EA15|E220    |      ;
    REP #$10                                                   ;82EA17|C210    |      ;
    LDA.W strcMenuData.nameEntryIdx                            ;82EA19|AD9409  |000994;
    CMP.B #$04                                                 ;82EA1C|C904    |      ;
    BEQ .return                                                ;82EA1E|F03F    |82EA5F;
    REP #$20                                                   ;82EA20|C220    |      ;
    LDA.W strcDialogDisplay.dialogBlinkTimer                   ;82EA22|AD8B01  |00018B;
    AND.W #$007F                                               ;82EA25|297F00  |      ;
    CMP.W #$0014                                               ;82EA28|C91400  |      ;
    BNE +                                                      ;82EA2B|D00C    |82EA39;
    SEP #$20                                                   ;82EA2D|E220    |      ;
    LDA.W strcDialogDisplay.dialogBlinkTimer                   ;82EA2F|AD8B01  |00018B;
    AND.B #$80                                                 ;82EA32|2980    |      ;
    EOR.B #$80                                                 ;82EA34|4980    |      ;
    STA.W strcDialogDisplay.dialogBlinkTimer                   ;82EA36|8D8B01  |00018B;
 
  + SEP #$20                                                   ;82EA39|E220    |      ;
    LDA.W strcDialogDisplay.dialogBlinkTimer                   ;82EA3B|AD8B01  |00018B;
    AND.B #$80                                                 ;82EA3E|2980    |      ;
    BNE .drawBlank                                                ;82EA40|D00B    |82EA4D;
    REP #$20                                                   ;82EA42|C220    |      ;
    LDA.W #$00A8                                               ;82EA44|A9A800  |      ;
    JSL.L fScreen_NameInput_DrawLetterAtCursor                                  ;82EA47|2260EA82|82EA60;
    BRA .advanceBlinkTimer                                                ;82EA4B|8009    |82EA56;
 
 
.drawBlank:
    REP #$20                                                   ;82EA4D|C220    |      ;
    LDA.W #!DIALOG_SPACE                                               
    JSL.L fScreen_NameInput_DrawLetterAtCursor                                  ;82EA52|2260EA82|82EA60;
 
.advanceBlinkTimer:
    SEP #$20                                                   ;82EA56|E220    |      ;
    LDA.W strcDialogDisplay.dialogBlinkTimer                   ;82EA58|AD8B01  |00018B;
    INC A                                                      ;82EA5B|1A      |      ;
    STA.W strcDialogDisplay.dialogBlinkTimer                   ;82EA5C|8D8B01  |00018B;
 
.return:
    RTS                                                        ;82EA5F|60      |      ; BIGEND
 
 
fScreen_NameInput_DrawLetterAtCursor:
    REP #$20                                                   ;82EA60|C220    |      ; A: nLetterCode
    PHA                                                        ;82EA62|48      |      ; nLetterCode -> stack1
    SEP #$20                                                   ;82EA63|E220    |      ;
    LDA.B #$00                                                 ;82EA65|A900    |      ;
    XBA                                                        ;82EA67|EB      |      ;
    LDA.W strcMenuData.nameEntryIdx                            ;82EA68|AD9409  |000994;
    REP #$20                                                   ;82EA6B|C220    |      ;
    ASL A                                                      ;82EA6D|0A      |      ;
    TAX                                                        ;82EA6E|AA      |      ;
    LDA.L aScreen_NameInput_LetterVramAddr,X                                    ;82EA6F|BF4DEB82|82EB4D;
    STA.L strcDialogDisplay.dialogUnk185+$20000                ;82EA73|8F850180|800185;
    PLA                                                        ;82EA77|68      |      ; A = nLetterCode
    LDX.W #$0001                                               ;82EA78|A20100  |      ;
    JSL.L fDialog_TransferGlyph                                ;82EA7B|22239883|839823;
    RTL                                                        ;82EA7F|6B      |      ;
 
 
fScreen_NameInput_DrawEmptyNameSlots:
    REP #$20                                                   ;82EA80|C220    |      ;
    LDA.L aScreen_NameInput_LetterVramAddr                                      ;82EA82|AF4DEB82|82EB4D;
    STA.B strcVariables.n16Temp3                               ;82EA86|8582    |000082;
    LDX.W #$0000                                               ;82EA88|A20000  |      ;
 
  - REP #$20                                                   ;82EA8B|C220    |      ;
    PHX                                                        ;82EA8D|DA      |      ;
    LDA.B strcVariables.n16Temp3                               ;82EA8E|A582    |000082;
    STA.L strcDialogDisplay.dialogUnk185+$20000                ;82EA90|8F850180|800185;
    LDA.W #$00A8                                               ;82EA94|A9A800  |      ; nLetterCode
    LDX.W #$0001                                               ;82EA97|A20100  |      ;
    JSL.L fDialog_TransferGlyph                                ;82EA9A|22239883|839823;
    JSL.L fCore_StartTransfer                                  ;82EA9E|22F08A80|808AF0;
    REP #$30                                                   ;82EAA2|C230    |      ;
    LDA.B strcVariables.n16Temp3                               ;82EAA4|A582    |000082;
    CLC                                                        ;82EAA6|18      |      ;
    ADC.W #$0010                                               ;82EAA7|691000  |      ;
    STA.B strcVariables.n16Temp3                               ;82EAAA|8582    |000082;
    PLX                                                        ;82EAAC|FA      |      ;
    INX                                                        ;82EAAD|E8      |      ;
    CPX.W #$0004                                               ;82EAAE|E00400  |      ;
    BNE -                                                      ;82EAB1|D0D8    |82EA8B;
    RTL                                                        ;82EAB3|6B      |      ;
 
 
fScreen_NameInput_DrawNameBox:
    REP #$30                                                   ;82EAB4|C230    |      ;
    LDA.L nScreen_NameInput_BoxTileStart                                      ;82EAB6|AF4BEB82|82EB4B;
    STA.B strcVariables.n16Temp1                               ;82EABA|857E    |00007E;
    INC A                                                      ;82EABC|1A      |      ;
    STA.B strcVariables.n16Temp2                               ;82EABD|8580    |000080;
    CLC                                                        ;82EABF|18      |      ;
    ADC.W #$000F                                               ;82EAC0|690F00  |      ;
    STA.B strcVariables.n16Temp3                               ;82EAC3|8582    |000082;
    INC A                                                      ;82EAC5|1A      |      ;
    STA.B strcVariables.n16Temp4                               ;82EAC6|8584    |000084;
    LDA.L nScreen_NameInput_BoxVramAddr                                      ;82EAC8|AF49EB82|82EB49;
    STA.B strcVariables.n16Unk86                               ;82EACC|8586    |000086;
    LDY.W #$0000                                               ;82EACE|A00000  |      ;
 
  - PHY                                                        ;82EAD1|5A      |      ;
    SEP #$20                                                   ;82EAD2|E220    |      ;
    LDA.B #$00                                                 ;82EAD4|A900    |      ;
    STA.B strcSystem.arrayIndex                                ;82EAD6|8527    |000027;
    LDA.B #$18                                                 ;82EAD8|A918    |      ;
    STA.B strcSystem.destinationRegister                       ;82EADA|8529    |000029;
    REP #$30                                                   ;82EADC|C230    |      ;
    LDY.W #$0004                                               ;82EADE|A00400  |      ;
    LDX.B strcVariables.n16Unk86                               ;82EAE1|A686    |000086;
    LDA.W #$007E                                               ;82EAE3|A97E00  |      ;
    STA.B ptrTemp0x72                                          ;82EAE6|8572    |000072;
    SEP #$20                                                   ;82EAE8|E220    |      ;
    LDA.B #$80                                                 ;82EAEA|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;82EAEC|8574    |000074; 80007E -> $72
    REP #$20                                                   ;82EAEE|C220    |      ;
    LDA.W #$0080                                               ;82EAF0|A98000  |      ;
    JSL.L fCore_PrepareTransfer                                ;82EAF3|22338A80|808A33;
    SEP #$20                                                   ;82EAF7|E220    |      ;
    LDA.B #$01                                                 ;82EAF9|A901    |      ;
    STA.B strcSystem.arrayIndex                                ;82EAFB|8527    |000027;
    LDA.B #$18                                                 ;82EAFD|A918    |      ;
    STA.B strcSystem.destinationRegister                       ;82EAFF|8529    |000029;
    REP #$30                                                   ;82EB01|C230    |      ;
    LDY.W #$0004                                               ;82EB03|A00400  |      ;
    LDX.B strcVariables.n16Unk86                               ;82EB06|A686    |000086;
    TXA                                                        ;82EB08|8A      |      ;
    CLC                                                        ;82EB09|18      |      ;
    ADC.W #$0020                                               ;82EB0A|692000  |      ;
    TAX                                                        ;82EB0D|AA      |      ;
    LDA.W #$0082                                               ;82EB0E|A98200  |      ;
    STA.B ptrTemp0x72                                          ;82EB11|8572    |000072;
    SEP #$20                                                   ;82EB13|E220    |      ;
    LDA.B #$80                                                 ;82EB15|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;82EB17|8574    |000074;
    REP #$20                                                   ;82EB19|C220    |      ;
    LDA.W #$0080                                               ;82EB1B|A98000  |      ;
    JSL.L fCore_PrepareTransfer                                ;82EB1E|22338A80|808A33;
    JSL.L fCore_StartTransfer                                  ;82EB22|22F08A80|808AF0;
    REP #$30                                                   ;82EB26|C230    |      ;
    INC.B strcVariables.n16Temp1                               ;82EB28|E67E    |00007E;
    INC.B strcVariables.n16Temp1                               ;82EB2A|E67E    |00007E;
    INC.B strcVariables.n16Temp2                               ;82EB2C|E680    |000080;
    INC.B strcVariables.n16Temp2                               ;82EB2E|E680    |000080;
    INC.B strcVariables.n16Temp3                               ;82EB30|E682    |000082;
    INC.B strcVariables.n16Temp3                               ;82EB32|E682    |000082;
    INC.B strcVariables.n16Temp4                               ;82EB34|E684    |000084;
    INC.B strcVariables.n16Temp4                               ;82EB36|E684    |000084;
    INC.B strcVariables.n16Unk86                               ;82EB38|E686    |000086;
    INC.B strcVariables.n16Unk86                               ;82EB3A|E686    |000086;
    PLY                                                        ;82EB3C|7A      |      ;
    INY                                                        ;82EB3D|C8      |      ;
    LDA.L nScreen_NameInput_BoxTileCount                                       ;82EB3E|AF55EB82|82EB55;
    STA.B strcVariables.n16Unk88                               ;82EB42|8588    |000088;
    CPY.B strcVariables.n16Unk88                               ;82EB44|C488    |000088;
    BNE -                                                      ;82EB46|D089    |82EAD1;
    RTS                                                        ;82EB48|60      |      ;
 
 
nScreen_NameInput_BoxVramAddr:
    dw $788C                                                   ;82EB49|        |      ; n16
 
nScreen_NameInput_BoxTileStart:
    dw $2002                                                   ;82EB4B|        |      ; n16
 
aScreen_NameInput_LetterVramAddr:
    dw $5010,$5020,$5030,$5040                                 ;82EB4D|        |      ; 0x04 * [n16]
 
nScreen_NameInput_BoxTileCount:
    dw $0004                                                   ;82EB55|        |      ; n16
