; Bank $83 module "dialog" - starts at $8392BB
 
fDialog_LoadDialogBoxGraphics:
    REP #$30                                                   ;8392BB|C230    |      ;
    REP #$20                                                   ;8392BD|C220    |      ;
    if !REGION_DE
    LDA.W #$CBC3
    elseif !REGION_EU
    LDA.W #$CAFA
    elseif !REGION_JP
    LDA.W #$CBEE
    else
    LDA.W #$CB05                                               ;8392BF|A905CB  |      ;
    endif
    STA.B ptrTemp0x72                                          ;8392C2|8572    |000072;
    LDA.W #$2000                                               ;8392C4|A90020  |      ;
    STA.B ptrUnknown0x75                                       ;8392C7|8575    |000075;
    SEP #$20                                                   ;8392C9|E220    |      ;
    LDA.B #$A5                                                 ;8392CB|A9A5    |      ;
    STA.B ptrTemp0x72+2                                        ;8392CD|8574    |000074;
    LDA.B #$7E                                                 ;8392CF|A97E    |      ;
    STA.B ptrUnknown0x75+2                                     ;8392D1|8577    |000077;
    JSL.L fGraphicsDecompressTilemap                           ;8392D3|22F88183|8381F8;
    SEP #$20                                                   ;8392D7|E220    |      ;
    LDA.B #$00                                                 ;8392D9|A900    |      ;
    STA.B strcSystem.arrayIndex                                ;8392DB|8527    |000027;
    LDA.B #$18                                                 ;8392DD|A918    |      ;
    STA.B strcSystem.destinationRegister                       ;8392DF|8529    |000029;
    REP #$30                                                   ;8392E1|C230    |      ;
    LDY.W #$0400                                               ;8392E3|A00004  |      ;
    LDX.W #$7800                                               ;8392E6|A20078  |      ;
    LDA.W #$2000                                               ;8392E9|A90020  |      ;
    STA.B ptrTemp0x72                                          ;8392EC|8572    |000072;
    SEP #$20                                                   ;8392EE|E220    |      ;
    LDA.B #$7E                                                 ;8392F0|A97E    |      ;
    STA.B ptrTemp0x72+2                                        ;8392F2|8574    |000074;
    REP #$20                                                   ;8392F4|C220    |      ;
    LDA.W #$0080                                               ;8392F6|A98000  |      ;
    JSL.L fCore_PrepareTransfer                                ;8392F9|22338A80|808A33;
    JSL.L fCore_StartPreparedTransfer                          ;8392FD|22B28A80|808AB2;
    SEP #$20                                                   ;839301|E220    |      ;
    LDA.B #$00                                                 ;839303|A900    |      ;
    STA.B strcSystem.arrayIndex                                ;839305|8527    |000027;
    LDA.B #$18                                                 ;839307|A918    |      ;
    STA.B strcSystem.destinationRegister                       ;839309|8529    |000029;
    REP #$30                                                   ;83930B|C230    |      ;
    LDA.W #$5000                                               ;83930D|A90050  |      ;
    TAX                                                        ;839310|AA      |      ;
    LDY.W #$1000                                               ;839311|A00010  |      ;
    LDA.W #$BBA3                                               ;839314|A9A3BB  |      ;
    STA.B ptrTemp0x72                                          ;839317|8572    |000072;
    SEP #$20                                                   ;839319|E220    |      ;
    LDA.B #$9C                                                 ;83931B|A99C    |      ;
    STA.B ptrTemp0x72+2                                        ;83931D|8574    |000074;
    REP #$20                                                   ;83931F|C220    |      ;
    LDA.W #$0080                                               ;839321|A98000  |      ;
    JSL.L fCore_PrepareTransfer                                ;839324|22338A80|808A33;
    JSL.L fCore_StartPreparedTransfer                          ;839328|22B28A80|808AB2;
    RTL                                                        ;83932C|6B      |      ;
 
 
fDialog_ReloadFontTiles:
    SEP #$20                                                   ;83932D|E220    |      ;
    LDA.B #$06                                                 ;83932F|A906    |      ;
    STA.B strcSystem.arrayIndex                                ;839331|8527    |000027;
    LDA.B #$18                                                 ;839333|A918    |      ;
    STA.B strcSystem.destinationRegister                       ;839335|8529    |000029;
    REP #$30                                                   ;839337|C230    |      ;
    LDA.W #$5000                                               ;839339|A90050  |      ;
    TAX                                                        ;83933C|AA      |      ;
    LDY.W #$0C00                                               ;83933D|A0000C  |      ;
    LDA.W #$BBA3                                               ;839340|A9A3BB  |      ;
    STA.B ptrTemp0x72                                          ;839343|8572    |000072;
    SEP #$20                                                   ;839345|E220    |      ;
    LDA.B #$9C                                                 ;839347|A99C    |      ;
    STA.B ptrTemp0x72+2                                        ;839349|8574    |000074;
    REP #$20                                                   ;83934B|C220    |      ;
    LDA.W #$0080                                               ;83934D|A98000  |      ;
    JSL.L fCore_PrepareTransfer                                ;839350|22338A80|808A33;
    SEP #$20                                                   ;839354|E220    |      ;
    LDA.B #$07                                                 ;839356|A907    |      ;
    STA.B strcSystem.arrayIndex                                ;839358|8527    |000027;
    JSL.L fCore_RemoveTransfer                                 ;83935A|22A08A80|808AA0;
    RTL                                                        ;83935E|6B      |      ;
 
 
fDialog_DialogHandler:
    REP #$30                                                   ;83935F|C230    |      ; X: nDialogPointerIndex
    STX.W strcDialogDisplay.dialogId                           ;839361|8E8301  |000183;
    LDA.W #$5000                                               ;839364|A90050  |      ;
    CLC                                                        ;839367|18      |      ;
    ADC.W #$0010                                               ;839368|691000  |      ;
    STA.W strcDialogDisplay.dialogUnk185                       ;83936B|8D8501  |000185;
    STZ.W strcDialogDisplay.dialogCurrentOffset                ;83936E|9C8701  |000187;
    SEP #$20                                                   ;839371|E220    |      ;
    LDA.W strcDialogDisplay.dialogFlags                        ;839373|AD9B01  |00019B;
    ORA.B #!DFLAGS_PROCESSDIALOG                                                 
    STA.W strcDialogDisplay.dialogFlags                        ;839378|8D9B01  |00019B;
    STZ.W strcDialogDisplay.dialoUnk189                        ;83937B|9C8901  |000189;
    STZ.W strcDialogDisplay.dialogBlinkTimer                   ;83937E|9C8B01  |00018B;
    STZ.W strcDialogDisplay.dialogVarSize                      ;839381|9C8C01  |00018C;
    STZ.W strcDialogDisplay.dialogOptionsCount                 ;839384|9C8E01  |00018E;
    STZ.W strcDialogDisplay.dialogOptionsAnswer                ;839387|9C8F01  |00018F;
    STZ.W strcDialogDisplay.fontGlyphType                      ;83938A|9C9001  |000190;
    REP #$20                                                   ;83938D|C220    |      ;
    LDA.W strcDialogDisplay.dialogId                           ;83938F|AD8301  |000183;
    ASL A                                                      ;839392|0A      |      ;
    CLC                                                        ;839393|18      |      ;
    ADC.W strcDialogDisplay.dialogId                           ;839394|6D8301  |000183;
    TAX                                                        ;839397|AA      |      ;
    LDA.L aDialogPointers,X                                    ;839398|BFF69B83|839BF6;
    STA.B ptrDialog                                            ;83939C|8501    |000001;
    INX                                                        ;83939E|E8      |      ;
    INX                                                        ;83939F|E8      |      ;
    SEP #$20                                                   ;8393A0|E220    |      ;
    LDA.L aDialogPointers,X                                    ;8393A2|BFF69B83|839BF6;
    STA.B ptrDialog+2                                          ;8393A6|8503    |000003;
    SEP #$20                                                   ;8393A8|E220    |      ;
    LDA.W strcDialogDisplay.dialogUnk191                       ;8393AA|AD9101  |000191;
    BNE +                                                      ;8393AD|D016    |8393C5;
    LDA.B #$01                                                 ;8393AF|A901    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;8393B1|8D9101  |000191;
    REP #$20                                                   ;8393B4|C220    |      ;
    LDA.W strcObjectData.camY                                  ;8393B6|AD0D09  |00090D;
    CMP.W #$0081                                               ;8393B9|C98100  |      ;
    BCS +                                                      ;8393BC|B007    |8393C5;
    SEP #$20                                                   ;8393BE|E220    |      ;
    LDA.B #$02                                                 ;8393C0|A902    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;8393C2|8D9101  |000191;
 
  + SEP #$20                                                   ;8393C5|E220    |      ;
    LDA.B #$00                                                 ;8393C7|A900    |      ;
    XBA                                                        ;8393C9|EB      |      ;
    LDA.W strcDialogDisplay.dialogUnk191                       ;8393CA|AD9101  |000191;
    DEC A                                                      ;8393CD|3A      |      ;
    REP #$30                                                   ;8393CE|C230    |      ;
    ASL A                                                      ;8393D0|0A      |      ;
    ASL A                                                      ;8393D1|0A      |      ;
    ASL A                                                      ;8393D2|0A      |      ;
    ASL A                                                      ;8393D3|0A      |      ;
    ASL A                                                      ;8393D4|0A      |      ;
    ASL A                                                      ;8393D5|0A      |      ;
    ASL A                                                      ;8393D6|0A      |      ;
    STA.B strcVariables.n16Temp1                               ;8393D7|857E    |00007E;
    LDA.W strcBGScrool.BG3VerOffs                              ;8393D9|AD4601  |000146;
    SEC                                                        ;8393DC|38      |      ;
    SBC.W #$0100                                               ;8393DD|E90001  |      ;
    SEC                                                        ;8393E0|38      |      ;
    SBC.B strcVariables.n16Temp1                               ;8393E1|E57E    |00007E;
    STA.W strcBGScrool.BG3VerOffs                              ;8393E3|8D4601  |000146;
    SEP #$20                                                   ;8393E6|E220    |      ;
    STZ.W nTimeState                                           ;8393E8|9C7309  |000973;
    REP #$20                                                   ;8393EB|C220    |      ;
    %SetFlag(daily1, $4000)
    RTL                                                        ;8393F8|6B      |      ;
 
 
fDialog_EndDialogRestoreScroll:
    SEP #$20                                                   ;8393F9|E220    |      ;
    REP #$10                                                   ;8393FB|C210    |      ;
    STZ.W strcDialogDisplay.dialogFlags                        ;8393FD|9C9B01  |00019B;
    SEP #$20                                                   ;839400|E220    |      ;
    LDA.B #$00                                                 ;839402|A900    |      ;
    XBA                                                        ;839404|EB      |      ;
    LDA.W strcDialogDisplay.dialogUnk191                       ;839405|AD9101  |000191;
    DEC A                                                      ;839408|3A      |      ;
    REP #$20                                                   ;839409|C220    |      ;
    ASL A                                                      ;83940B|0A      |      ;
    ASL A                                                      ;83940C|0A      |      ;
    ASL A                                                      ;83940D|0A      |      ;
    ASL A                                                      ;83940E|0A      |      ;
    ASL A                                                      ;83940F|0A      |      ;
    ASL A                                                      ;839410|0A      |      ;
    ASL A                                                      ;839411|0A      |      ;
    STA.B strcVariables.n16Temp1                               ;839412|857E    |00007E;
    LDA.W strcBGScrool.BG3VerOffs                              ;839414|AD4601  |000146;
    CLC                                                        ;839417|18      |      ;
    ADC.W #$0100                                               ;839418|690001  |      ;
    CLC                                                        ;83941B|18      |      ;
    ADC.B strcVariables.n16Temp1                               ;83941C|657E    |00007E;
    STA.W strcBGScrool.BG3VerOffs                              ;83941E|8D4601  |000146;
    JSL.L fDialog_ReloadFontTiles                               ;839421|222D9383|83932D;
    REP #$20                                                   ;839425|C220    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;839427|AD9601  |000196;
    AND.W #$0020                                               ;83942A|292000  |      ;
    BEQ +                                                      ;83942D|F00A    |839439;
    SEP #$20                                                   ;83942F|E220    |      ;
    LDA.W nTimeState                                           ;839431|AD7309  |000973;
    ORA.B #$01                                                 ;839434|0901    |      ;
    STA.W nTimeState                                           ;839436|8D7309  |000973;
 
  + REP #$20                                                   ;839439|C220    |      ;
    %UnsetFlag(daily1, $4000)
    RTL                                                        ;839446|6B      |      ;
 
 
fDialog_AnimateBlinkIconLong:
    REP #$30                                                   ;839447|C230    |      ;
    JSR.W fDialog_AnimateBlinkIcon                               ;839449|209594  |839495;
    RTL                                                        ;83944C|6B      |      ;
 
 
aDialogUnused_83944D:
    db $10,$50,$70,$51,$50,$53,$70,$50,$50,$52                 ;83944D|        |      ;
 
aDialogBlinkIconTiles_Frame0:
    dw $21A0,$21A1,$21B0,$21B1                                 ;839457|        |      ;
 
aDialogBlinkIconTiles_Frame1:
    dw $21A2,$21A3,$21B2,$21B3                                 ;83945F|        |      ;
 
aDialogDialogPointerIndexes_839467:
    dw $000F,$0010,$0011,$0012,$0013,$0014                     ;839467|        |      ; 0x0B * [n16 nDialogPointerIndex]
    dw $0015,$0016,$0017,$0018,$0019                           ;839473|        |      ;
 
aDialogBlinkIconVramAddrByLine:
    dw $7088,$70C8,$7108,$7148,$7188,$71C8                     ;83947D|        |      ;
    dw $7208,$7248,$7288,$72C8,$7308,$7090                     ;839489|        |      ;
 
fDialog_AnimateBlinkIcon:
    REP #$30                                                   ;839495|C230    |      ;
    STA.B strcVariables.n16Temp1                               ;839497|857E    |00007E;
    LDA.W strcDialogDisplay.dialogBlinkTimer                   ;839499|AD8B01  |00018B;
    AND.W #$007F                                               ;83949C|297F00  |      ;
    CMP.W #$0014                                               ;83949F|C91400  |      ;
    BNE +                                                      ;8394A2|D00C    |8394B0;
    SEP #$20                                                   ;8394A4|E220    |      ;
    LDA.W strcDialogDisplay.dialogBlinkTimer                   ;8394A6|AD8B01  |00018B;
    AND.B #$80                                                 ;8394A9|2980    |      ;
    EOR.B #$80                                                 ;8394AB|4980    |      ;
    STA.W strcDialogDisplay.dialogBlinkTimer                   ;8394AD|8D8B01  |00018B;
 
  + SEP #$20                                                   ;8394B0|E220    |      ;
    LDA.W strcDialogDisplay.dialogBlinkTimer                   ;8394B2|AD8B01  |00018B;
    AND.B #$80                                                 ;8394B5|2980    |      ;
    BNE +                                                      ;8394B7|D00B    |8394C4;
    REP #$20                                                   ;8394B9|C220    |      ;
    LDA.W #$0000                                               ;8394BB|A90000  |      ;
    JSL.L fDialog_DrawBlinkIconFrame                               ;8394BE|22D79483|8394D7;
    BRA .return                                                ;8394C2|8009    |8394CD;
 
 
  + REP #$20                                                   ;8394C4|C220    |      ;
    LDA.W #$0001                                               ;8394C6|A90100  |      ;
    JSL.L fDialog_DrawBlinkIconFrame                               ;8394C9|22D79483|8394D7;
 
.return:
    SEP #$20                                                   ;8394CD|E220    |      ;
    LDA.W strcDialogDisplay.dialogBlinkTimer                   ;8394CF|AD8B01  |00018B;
    INC A                                                      ;8394D2|1A      |      ;
    STA.W strcDialogDisplay.dialogBlinkTimer                   ;8394D3|8D8B01  |00018B;
    RTS                                                        ;8394D6|60      |      ;
 
 
fDialog_DrawBlinkIconFrame:
    REP #$30                                                   ;8394D7|C230    |      ;
    PHA                                                        ;8394D9|48      |      ;
    SEP #$20                                                   ;8394DA|E220    |      ;
    REP #$10                                                   ;8394DC|C210    |      ;
    LDA.B #$00                                                 ;8394DE|A900    |      ;
    XBA                                                        ;8394E0|EB      |      ;
    LDA.W strcDialogDisplay.dialoUnk18A                        ;8394E1|AD8A01  |00018A;
    CMP.B #$0B                                                 ;8394E4|C90B    |      ;
    BCC +                                                      ;8394E6|9002    |8394EA;
    LDA.B #$0B                                                 ;8394E8|A90B    |      ;
 
  + REP #$20                                                   ;8394EA|C220    |      ;
    ASL A                                                      ;8394EC|0A      |      ;
    TAX                                                        ;8394ED|AA      |      ;
    LDA.L aDialogBlinkIconVramAddrByLine,X                              ;8394EE|BF7D9483|83947D;
    TAX                                                        ;8394F2|AA      |      ;
    REP #$20                                                   ;8394F3|C220    |      ;
    PLA                                                        ;8394F5|68      |      ;
    CMP.W #$0001                                               ;8394F6|C90100  |      ;
    BEQ +                                                      ;8394F9|F00F    |83950A;
    REP #$20                                                   ;8394FB|C220    |      ;
    LDA.W #$9457                                               ;8394FD|A95794  |      ;
    STA.B ptrTemp0x72                                          ;839500|8572    |000072;
    SEP #$20                                                   ;839502|E220    |      ;
    LDA.B #$83                                                 ;839504|A983    |      ;
    STA.B ptrTemp0x72+2                                        ;839506|8574    |000074; $72 = 0x839457
    BRA .return                                                ;839508|800D    |839517;
 
 
  + REP #$20                                                   ;83950A|C220    |      ;
    LDA.W #$945F                                               ;83950C|A95F94  |      ;
    STA.B ptrTemp0x72                                          ;83950F|8572    |000072;
    SEP #$20                                                   ;839511|E220    |      ;
    LDA.B #$83                                                 ;839513|A983    |      ;
    STA.B ptrTemp0x72+2                                        ;839515|8574    |000074; $72 = 0x83945F
 
.return:
    JSL.L fGraphics_WriteTilemap2x2                              ;839517|22B78183|8381B7;
    RTL                                                        ;83951B|6B      |      ;
 
 
fDialog_IterateText:
    SEP #$20                                                   ;83951C|E220    |      ;
    REP #$10                                                   ;83951E|C210    |      ;
    LDA.W strcDialogDisplay.dialogFlags                        ;839520|AD9B01  |00019B;
    AND.B #!DFLAGS_UNK20                                                 
    BEQ +                                                      ;839525|F003    |83952A;
    JMP.W fDialog_AnimateBlinkIconLong                               ;839527|4C4794  |839447;
 
 
  + LDA.W strcDialogDisplay.dialogFlags                        ;83952A|AD9B01  |00019B;
    AND.B #!DFLAGS_PROCESSDIALOG                                                 
    BNE .getCurrentLetter                                      ;83952F|D003    |839534;
    JMP.W .justReturn                                          ;839531|4CF095  |8395F0;
 
 
.getCurrentLetter:
    SEP #$20                                                   ;839534|E220    |      ;
    LDA.W strcDialogDisplay.dialogFlags                        ;839536|AD9B01  |00019B;
    AND.B #~!DFLAGS_UNK02                                                 
    STA.W strcDialogDisplay.dialogFlags                        ;83953B|8D9B01  |00019B;
    REP #$20                                                   ;83953E|C220    |      ;
    LDA.W strcDialogDisplay.dialogCurrentOffset                ;839540|AD8701  |000187; A = nCurrentTextIndex
    ASL A                                                      ;839543|0A      |      ;
    TAY                                                        ;839544|A8      |      ;
    LDA.B [ptrDialog],Y                                        ;839545|B701    |000001; Y = nCurrentTextIndex * 2
    CMP.W #!DIALOG_NEXTSCREEN                                               
    BNE +                                                      ;83954A|D003    |83954F;
    JMP.W .A2_nextScreen                                       ;83954C|4CF195  |8395F1;
 
 
  + CMP.W #!DIALOG_SPACE                                               
    BNE +                                                      ;839552|D003    |839557;
    JMP.W .B1_space                                            ;839554|4C0D96  |83960D;
 
 
  + CMP.W #!DIALOG_NUMERICVARIABLE                                               
    BNE +                                                      ;83955A|D003    |83955F;
    JMP.W .FFFC_numberVariable                                 ;83955C|4C2196  |839621;
 
 
  + CMP.W #!DIALOG_OPTIONS                                               
    BNE +                                                      ;839562|D003    |839567;
    JMP.W .FFFE_optionSelect                                   ;839564|4C1997  |839719;
 
 
  + CMP.W #!DIALOG_END                                               
    BNE +                                                      ;83956A|D003    |83956F;
    JMP.W .FFFF_endDialog                                      ;83956C|4C5297  |839752;
 
 
  + SEP #$20                                                   ;83956F|E220    |      ;
    LDA.W strcDialogDisplay.dialoUnk189                        ;839571|AD8901  |000189;
    CMP.B #$04                                                 ;839574|C904    |      ;
    BNE .return                                                ;839576|D06F    |8395E7;
    STZ.W strcDialogDisplay.dialoUnk189                        ;839578|9C8901  |000189;
    REP #$20                                                   ;83957B|C220    |      ;
    LDA.B [ptrDialog],Y                                        ;83957D|B701    |000001;
    CMP.W #!DIALOG_TEXTVARIABLE                                               
    BNE +                                                      ;839582|D003    |839587;
    JMP.W .FFFD_textVariable                                   ;839584|4CA196  |8396A1;
 
 
    if !REGION_JP
  + REP #$20
    SEP #$10
    LDX.B #$01
    LDA.B [ptrDialog],Y
    else
  + REP #$30                                                   ;839587|C230    |      ;
    LDA.B [ptrDialog],Y                                        ;839589|B701    |000001;
    SEP #$10                                                   ;83958B|E210    |      ;
    LDX.B #$01                                                 ;83958D|A201    |      ;
    endif
    CMP.W #$00BC                                               ;83958F|C9BC00  |      ;
    BCC .NUMBERS_wide                                          ;839592|9009    |83959D;
    CMP.W #$00C6                                               ;839594|C9C600  |      ;
    BCS .NUMBERS_wide                                          ;839597|B004    |83959D;
    LDX.B #$00                                                 ;839599|A200    |      ;
    BRA .label5                                                ;83959B|8007    |8395A4;
 
 
.NUMBERS_wide:
    CMP.W #$0270                                               ;83959D|C97002  |      ;
    BNE .label5                                                ;8395A0|D002    |8395A4;
    LDX.B #$00                                                 ;8395A2|A200    |      ;
 
.label5:
    STX.W strcDialogDisplay.fontGlyphType                      ;8395A4|8E9001  |000190;
    JSL.L fDialog_TransferGlyph                                ;8395A7|22239883|839823;
    SEP #$20                                                   ;8395AB|E220    |      ;
    REP #$10                                                   ;8395AD|C210    |      ;
    LDA.B #$03                                                 ;8395AF|A903    |      ;
    STA.W strcAudio.reg114                                     ;8395B1|8D1401  |000114;
    LDA.B #$06                                                 ;8395B4|A906    |      ;
    STA.W strcAudio.reg115                                     ;8395B6|8D1501  |000115;
    JSL.L fAudioSetRegister2to0A                               ;8395B9|22328383|838332;
    SEP #$20                                                   ;8395BD|E220    |      ;
    LDA.W strcDialogDisplay.dialogFlags                        ;8395BF|AD9B01  |00019B;
    ORA.B #!DFLAGS_UNK02                                                 
    STA.W strcDialogDisplay.dialogFlags                        ;8395C4|8D9B01  |00019B;
    REP #$30                                                   ;8395C7|C230    |      ;
 
.loop:
    SEP #$20                                                   ;8395C9|E220    |      ;
    LDA.W strcDialogDisplay.dialogVarSize                      ;8395CB|AD8C01  |00018C;
    BNE +                                                      ;8395CE|D009    |8395D9;
    REP #$20                                                   ;8395D0|C220    |      ;
    LDA.W strcDialogDisplay.dialogCurrentOffset                ;8395D2|AD8701  |000187;
    INC A                                                      ;8395D5|1A      |      ;
    STA.W strcDialogDisplay.dialogCurrentOffset                ;8395D6|8D8701  |000187;
 
  + SEP #$20                                                   ;8395D9|E220    |      ;
    LDA.B #$00                                                 ;8395DB|A900    |      ;
    XBA                                                        ;8395DD|EB      |      ;
    LDA.W strcDialogDisplay.fontGlyphType                      ;8395DE|AD9001  |000190;
    REP #$30                                                   ;8395E1|C230    |      ;
    TAX                                                        ;8395E3|AA      |      ;
    JSR.W fDialog_AdvanceGlyphDestination                                ;8395E4|203898  |839838;
 
.return:
    SEP #$20                                                   ;8395E7|E220    |      ;
    LDA.W strcDialogDisplay.dialoUnk189                        ;8395E9|AD8901  |000189;
    INC A                                                      ;8395EC|1A      |      ;
    STA.W strcDialogDisplay.dialoUnk189                        ;8395ED|8D8901  |000189;
 
.justReturn:
    RTL                                                        ;8395F0|6B      |      ;
 
 
.A2_nextScreen:
    SEP #$20                                                   ;8395F1|E220    |      ;
    LDA.W strcDialogDisplay.dialogFlags                        ;8395F3|AD9B01  |00019B;
    ORA.B #!DFLAGS_NEXTSCREEN                                                 
    STA.W strcDialogDisplay.dialogFlags                        ;8395F8|8D9B01  |00019B;
    REP #$20                                                   ;8395FB|C220    |      ;
    if !REGION_JP
    LDA.W #$5520
    else
    LDA.W #$5528                                               ;8395FD|A92855  |      ;
    endif
    STA.W strcDialogDisplay.dialogUnk185                       ;839600|8D8501  |000185; $0185 = 0x5528
    REP #$20                                                   ;839603|C220    |      ;
    LDA.W #!DIALOG_NEXTSCREEN                                               
    JSR.W fDialog_NextScreenHandler                            ;839608|205F97  |83975F;
    BRA .justReturn                                            ;83960B|80E3    |8395F0;
 
 
.B1_space:
    REP #$20                                                   ;83960D|C220    |      ;
    LDA.W strcDialogDisplay.dialogCurrentOffset                ;83960F|AD8701  |000187;
    INC A                                                      ;839612|1A      |      ;
    STA.W strcDialogDisplay.dialogCurrentOffset                ;839613|8D8701  |000187; nCurrentTextIndex++
    REP #$30                                                   ;839616|C230    |      ;
    LDX.W #$0001                                               ;839618|A20100  |      ;
    JSR.W fDialog_AdvanceGlyphDestination                                ;83961B|203898  |839838;
    JMP.W .getCurrentLetter                                    ;83961E|4C3495  |839534;
 
 
.FFFC_numberVariable:
    SEP #$20                                                   ;839621|E220    |      ;
    LDA.W strcDialogDisplay.dialogVarSize                      ;839623|AD8C01  |00018C;
    BNE +                                                      ;839626|D052    |83967A;
    REP #$20                                                   ;839628|C220    |      ;
    LDA.W strcDialogDisplay.dialogCurrentOffset                ;83962A|AD8701  |000187;
    ASL A                                                      ;83962D|0A      |      ;
    TAY                                                        ;83962E|A8      |      ;
    INY                                                        ;83962F|C8      |      ;
    INY                                                        ;839630|C8      |      ;
    SEP #$20                                                   ;839631|E220    |      ;
    LDA.B [ptrDialog],Y                                        ;839633|B701    |000001;
    STA.W strcDialogDisplay.dialogVarSize                      ;839635|8D8C01  |00018C;
    REP #$20                                                   ;839638|C220    |      ;
    INY                                                        ;83963A|C8      |      ;
    INY                                                        ;83963B|C8      |      ;
    LDA.B [ptrDialog],Y                                        ;83963C|B701    |000001;
    DEC A                                                      ;83963E|3A      |      ;
    ASL A                                                      ;83963F|0A      |      ;
    ASL A                                                      ;839640|0A      |      ;
    TAX                                                        ;839641|AA      |      ;
    LDA.L aTextDataTableFFFC,X                                 ;839642|BFEE9883|8398EE;
    STA.B ptrTemp0x72                                          ;839646|8572    |000072;
    INX                                                        ;839648|E8      |      ;
    INX                                                        ;839649|E8      |      ;
    SEP #$20                                                   ;83964A|E220    |      ;
    LDA.L aTextDataTableFFFC,X                                 ;83964C|BFEE9883|8398EE;
    STA.B ptrTemp0x72+2                                        ;839650|8574    |000074;
    STZ.W strcDialogDisplay.dialogNumericVarSize               ;839652|9C9201  |000192;
    STZ.W strcDialogDisplay.dialogNumericVarSize+1             ;839655|9C9301  |000193;
    STZ.W strcDialogDisplay.dialogNumericVarSize+2             ;839658|9C9401  |000194;
    LDA.W strcDialogDisplay.dialogFlags                        ;83965B|AD9B01  |00019B;
    AND.B #~!DFLAGS_NUMERICVAR                                                 
    STA.W strcDialogDisplay.dialogFlags                        ;839660|8D9B01  |00019B;
    INX                                                        ;839663|E8      |      ;
    LDA.L aTextDataTableFFFC,X                                 ;839664|BFEE9883|8398EE;
    LDY.W #$0000                                               ;839668|A00000  |      ;
    LDX.W #$0000                                               ;83966B|A20000  |      ;
 
  - PHA                                                        ;83966E|48      |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83966F|B772    |000072;
    STA.W strcDialogDisplay.dialogNumericVarSize,X             ;839671|9D9201  |000192;
    INY                                                        ;839674|C8      |      ;
    INX                                                        ;839675|E8      |      ;
    PLA                                                        ;839676|68      |      ;
    DEC A                                                      ;839677|3A      |      ;
    BNE -                                                      ;839678|D0F4    |83966E;
 
  + SEP #$20                                                   ;83967A|E220    |      ;
    LDA.W strcDialogDisplay.dialogVarSize                      ;83967C|AD8C01  |00018C;
    DEC A                                                      ;83967F|3A      |      ;
    if !REGION_EUDE
    STA.W strcDialogDisplay.dialogVarSize
    BNE .r_839680_1
    LDA.W strcDialogDisplay.dialogFlags
    ORA.B #$80
    STA.W strcDialogDisplay.dialogFlags
.r_839680_1:
    REP #$30
    JSL.L fDialog_DrawNumericVarDigit
    else
    STA.W strcDialogDisplay.dialogVarSize                      ;839680|8D8C01  |00018C;
    JSL.L fDialog_DrawNumericVarDigit                               ;839683|22A69783|8397A6;
    endif
    SEP #$20                                                   ;839687|E220    |      ;
    STZ.W strcDialogDisplay.fontGlyphType                      ;839689|9C9001  |000190;
    SEP #$20                                                   ;83968C|E220    |      ;
    STZ.W strcDialogDisplay.dialoUnk189                        ;83968E|9C8901  |000189;
    LDA.W strcDialogDisplay.dialogVarSize                      ;839691|AD8C01  |00018C;
    BNE +                                                      ;839694|D008    |83969E;
    LDA.W strcDialogDisplay.dialogCurrentOffset                ;839696|AD8701  |000187;
    INC A                                                      ;839699|1A      |      ;
    INC A                                                      ;83969A|1A      |      ;
    STA.W strcDialogDisplay.dialogCurrentOffset                ;83969B|8D8701  |000187;
 
  + JMP.W .loop                                                ;83969E|4CC995  |8395C9;
 
 
.FFFD_textVariable:
    SEP #$20                                                   ;8396A1|E220    |      ;
    LDA.W strcDialogDisplay.dialogVarSize                      ;8396A3|AD8C01  |00018C;
    BNE +                                                      ;8396A6|D014    |8396BC;
    REP #$20                                                   ;8396A8|C220    |      ;
    LDA.W strcDialogDisplay.dialogCurrentOffset                ;8396AA|AD8701  |000187;
    ASL A                                                      ;8396AD|0A      |      ;
    TAY                                                        ;8396AE|A8      |      ;
    INY                                                        ;8396AF|C8      |      ;
    INY                                                        ;8396B0|C8      |      ;
    SEP #$20                                                   ;8396B1|E220    |      ;
    LDA.B [ptrDialog],Y                                        ;8396B3|B701    |000001;
    STA.W strcDialogDisplay.dialogVarSize                      ;8396B5|8D8C01  |00018C;
    DEC A                                                      ;8396B8|3A      |      ;
    STA.W strcDialogDisplay.dialogNameVarSize                  ;8396B9|8D8D01  |00018D;
 
  + REP #$20                                                   ;8396BC|C220    |      ;
    LDA.W strcDialogDisplay.dialogCurrentOffset                ;8396BE|AD8701  |000187;
    ASL A                                                      ;8396C1|0A      |      ;
    CLC                                                        ;8396C2|18      |      ;
    ADC.W #$0004                                               ;8396C3|690400  |      ;
    TAY                                                        ;8396C6|A8      |      ;
    LDA.B [ptrDialog],Y                                        ;8396C7|B701    |000001;
    DEC A                                                      ;8396C9|3A      |      ;
    ASL A                                                      ;8396CA|0A      |      ;
    ASL A                                                      ;8396CB|0A      |      ;
    TAX                                                        ;8396CC|AA      |      ;
    if !REGION_DE
    LDA.L aTextDataTableFFFD,X
    elseif !REGION_JP
    LDA.L aTextDataTableFFFD,X
    else
    LDA.L aTextDataTableFFFD,X                                 ;8396CD|BFAE9A83|839AAE;
    endif
    STA.B ptrTemp0x72                                          ;8396D1|8572    |000072;
    INX                                                        ;8396D3|E8      |      ;
    INX                                                        ;8396D4|E8      |      ;
    SEP #$20                                                   ;8396D5|E220    |      ;
    if !REGION_DE
    LDA.L aTextDataTableFFFD,X
    elseif !REGION_JP
    LDA.L aTextDataTableFFFD,X
    else
    LDA.L aTextDataTableFFFD,X                                 ;8396D7|BFAE9A83|839AAE;
    endif
    STA.B ptrTemp0x72+2                                        ;8396DB|8574    |000074;
    SEP #$20                                                   ;8396DD|E220    |      ;
    LDA.W strcDialogDisplay.dialogVarSize                      ;8396DF|AD8C01  |00018C;
    DEC A                                                      ;8396E2|3A      |      ;
    STA.W strcDialogDisplay.dialogVarSize                      ;8396E3|8D8C01  |00018C;
    LDA.B #$00                                                 ;8396E6|A900    |      ;
    XBA                                                        ;8396E8|EB      |      ;
    LDA.W strcDialogDisplay.dialogNameVarSize                  ;8396E9|AD8D01  |00018D;
    SEC                                                        ;8396EC|38      |      ;
    SBC.W strcDialogDisplay.dialogVarSize                      ;8396ED|ED8C01  |00018C;
    REP #$30                                                   ;8396F0|C230    |      ;
    ASL A                                                      ;8396F2|0A      |      ;
    TAY                                                        ;8396F3|A8      |      ;
    LDA.B [ptrTemp0x72],Y                                      ;8396F4|B772    |000072;
    LDX.W #$0001                                               ;8396F6|A20100  |      ;
    JSL.L fDialog_TransferGlyph                                ;8396F9|22239883|839823;
    SEP #$20                                                   ;8396FD|E220    |      ;
    LDA.B #$01                                                 ;8396FF|A901    |      ;
    STA.W strcDialogDisplay.fontGlyphType                      ;839701|8D9001  |000190;
    SEP #$20                                                   ;839704|E220    |      ;
    STZ.W strcDialogDisplay.dialoUnk189                        ;839706|9C8901  |000189;
    LDA.W strcDialogDisplay.dialogVarSize                      ;839709|AD8C01  |00018C;
    BNE +                                                      ;83970C|D008    |839716;
    LDA.W strcDialogDisplay.dialogCurrentOffset                ;83970E|AD8701  |000187;
    INC A                                                      ;839711|1A      |      ;
    INC A                                                      ;839712|1A      |      ;
    STA.W strcDialogDisplay.dialogCurrentOffset                ;839713|8D8701  |000187;
 
  + JMP.W .loop                                                ;839716|4CC995  |8395C9;
 
 
.FFFE_optionSelect:
    SEP #$20                                                   ;839719|E220    |      ;
    LDA.W strcDialogDisplay.dialogFlags                        ;83971B|AD9B01  |00019B;
    ORA.B #!DFLAGS_OPTIONS                                                 
    STA.W strcDialogDisplay.dialogFlags                        ;839720|8D9B01  |00019B;
    REP #$20                                                   ;839723|C220    |      ;
    LDA.W strcDialogDisplay.dialogCurrentOffset                ;839725|AD8701  |000187;
    ASL A                                                      ;839728|0A      |      ;
    TAY                                                        ;839729|A8      |      ;
    INY                                                        ;83972A|C8      |      ;
    INY                                                        ;83972B|C8      |      ;
    SEP #$20                                                   ;83972C|E220    |      ;
    LDA.B [ptrDialog],Y                                        ;83972E|B701    |000001;
    DEC A                                                      ;839730|3A      |      ;
    STA.W strcDialogDisplay.dialogOptionsCount                 ;839731|8D8E01  |00018E;
    SEP #$20                                                   ;839734|E220    |      ;
    LDA.B #$00                                                 ;839736|A900    |      ;
    XBA                                                        ;839738|EB      |      ;
    LDA.W strcDialogDisplay.dialogOptionsAnswer                ;839739|AD8F01  |00018F;
    ASL A                                                      ;83973C|0A      |      ;
    TAX                                                        ;83973D|AA      |      ;
    REP #$20                                                   ;83973E|C220    |      ;
    LDA.L aTextDataTableFFFE,X                                 ;839740|BFCC9883|8398CC;
    STA.W strcDialogDisplay.dialogUnk185                       ;839744|8D8501  |000185;
    REP #$20                                                   ;839747|C220    |      ;
    LDA.W #$0275                                               ;839749|A97502  |      ;
    JSR.W fDialog_NextScreenHandler                            ;83974C|205F97  |83975F;
    JMP.W .justReturn                                          ;83974F|4CF095  |8395F0;
 
 
.FFFF_endDialog:
    SEP #$20                                                   ;839752|E220    |      ;
    LDA.W strcDialogDisplay.dialogFlags                        ;839754|AD9B01  |00019B;
    ORA.B #!DFLAGS_ENDDIALOG                                                 
    STA.W strcDialogDisplay.dialogFlags                        ;839759|8D9B01  |00019B;
    JMP.W .justReturn                                          ;83975C|4CF095  |8395F0;
 
 
fDialog_NextScreenHandler:
    REP #$20                                                   ;83975F|C220    |      ; A: nLetterCode
    STA.B strcVariables.n16Temp1                               ;839761|857E    |00007E;
    LDA.W strcDialogDisplay.dialogBlinkTimer                   ;839763|AD8B01  |00018B;
    AND.W #$007F                                               ;839766|297F00  |      ;
    CMP.W #$0014                                               ;839769|C91400  |      ;
    BNE +                                                      ;83976C|D00C    |83977A;
    SEP #$20                                                   ;83976E|E220    |      ;
    LDA.W strcDialogDisplay.dialogBlinkTimer                   ;839770|AD8B01  |00018B;
    AND.B #$80                                                 ;839773|2980    |      ;
    EOR.B #$80                                                 ;839775|4980    |      ;
    STA.W strcDialogDisplay.dialogBlinkTimer                   ;839777|8D8B01  |00018B;
 
  + SEP #$20                                                   ;83977A|E220    |      ;
    LDA.W strcDialogDisplay.dialogBlinkTimer                   ;83977C|AD8B01  |00018B;
    AND.B #$80                                                 ;83977F|2980    |      ;
    BNE .noSign                                                ;839781|D00D    |839790;
    REP #$30                                                   ;839783|C230    |      ;
    LDX.W #$0001                                               ;839785|A20100  |      ;
    LDA.B strcVariables.n16Temp1                               ;839788|A57E    |00007E;
    JSL.L fDialog_TransferGlyph                                ;83978A|22239883|839823;
    BRA .return                                                ;83978E|800C    |83979C;
 
 
.noSign:
    REP #$30                                                   ;839790|C230    |      ;
    LDX.W #$0001                                               ;839792|A20100  |      ;
    LDA.W #!DIALOG_SPACE                                               
    JSL.L fDialog_TransferGlyph                                ;839798|22239883|839823;
 
.return:
    SEP #$20                                                   ;83979C|E220    |      ;
    LDA.W strcDialogDisplay.dialogBlinkTimer                   ;83979E|AD8B01  |00018B;
    INC A                                                      ;8397A1|1A      |      ;
    STA.W strcDialogDisplay.dialogBlinkTimer                   ;8397A2|8D8B01  |00018B;
    RTS                                                        ;8397A5|60      |      ;
 
 
fDialog_DrawNumericVarDigit:
    SEP #$20                                                   ;8397A6|E220    |      ;
    REP #$10                                                   ;8397A8|C210    |      ;
    LDA.B #$00                                                 ;8397AA|A900    |      ;
    XBA                                                        ;8397AC|EB      |      ;
    LDA.W strcDialogDisplay.dialogVarSize                      ;8397AD|AD8C01  |00018C;
    ASL A                                                      ;8397B0|0A      |      ;
    CLC                                                        ;8397B1|18      |      ;
    ADC.W strcDialogDisplay.dialogVarSize                      ;8397B2|6D8C01  |00018C;
    REP #$20                                                   ;8397B5|C220    |      ;
    TAX                                                        ;8397B7|AA      |      ;
    LDA.L pTextAmmountTable,X                                  ;8397B8|BFD69883|8398D6;
    STA.B strcVariables.n16Temp1                               ;8397BC|857E    |00007E;
    INX                                                        ;8397BE|E8      |      ;
    INX                                                        ;8397BF|E8      |      ;
    SEP #$20                                                   ;8397C0|E220    |      ;
    LDA.L pTextAmmountTable,X                                  ;8397C2|BFD69883|8398D6;
    STA.B strcVariables.n16Temp2                               ;8397C6|8580    |000080;
    LDX.W #$0000                                               ;8397C8|A20000  |      ;
 
  - REP #$20                                                   ;8397CB|C220    |      ;
    LDA.W strcDialogDisplay.dialogNumericVarSize               ;8397CD|AD9201  |000192;
    SEC                                                        ;8397D0|38      |      ;
    SBC.B strcVariables.n16Temp1                               ;8397D1|E57E    |00007E;
    STA.W strcDialogDisplay.dialogNumericVarSize               ;8397D3|8D9201  |000192;
    SEP #$20                                                   ;8397D6|E220    |      ;
    LDA.W strcDialogDisplay.dialogNumericVarSize+2             ;8397D8|AD9401  |000194;
    SBC.B strcVariables.n16Temp2                               ;8397DB|E580    |000080;
    STA.W strcDialogDisplay.dialogNumericVarSize+2             ;8397DD|8D9401  |000194;
    BMI +                                                      ;8397E0|3003    |8397E5;
    INX                                                        ;8397E2|E8      |      ;
    BRA -                                                      ;8397E3|80E6    |8397CB;
 
 
  + REP #$20                                                   ;8397E5|C220    |      ;
    LDA.W strcDialogDisplay.dialogNumericVarSize               ;8397E7|AD9201  |000192;
    CLC                                                        ;8397EA|18      |      ;
    ADC.B strcVariables.n16Temp1                               ;8397EB|657E    |00007E;
    STA.W strcDialogDisplay.dialogNumericVarSize               ;8397ED|8D9201  |000192;
    SEP #$20                                                   ;8397F0|E220    |      ;
    LDA.W strcDialogDisplay.dialogNumericVarSize+2             ;8397F2|AD9401  |000194;
    ADC.B strcVariables.n16Temp2                               ;8397F5|6580    |000080;
    STA.W strcDialogDisplay.dialogNumericVarSize+2             ;8397F7|8D9401  |000194;
    SEP #$20                                                   ;8397FA|E220    |      ;
    LDA.W strcDialogDisplay.dialogFlags                        ;8397FC|AD9B01  |00019B;
    AND.B #!DFLAGS_NUMERICVAR                                                 
    BNE +                                                      ;839801|D00D    |839810;
    CPX.W #$0000                                               ;839803|E00000  |      ;
    BEQ .return                                                ;839806|F01A    |839822;
    LDA.W strcDialogDisplay.dialogFlags                        ;839808|AD9B01  |00019B;
    ORA.B #!DFLAGS_NUMERICVAR                                                 
    STA.W strcDialogDisplay.dialogFlags                        ;83980D|8D9B01  |00019B;
 
  + REP #$30                                                   ;839810|C230    |      ;
    TXA                                                        ;839812|8A      |      ;
    STA.B strcVariables.n16Temp1                               ;839813|857E    |00007E;
    LDA.W #$00BC                                               ;839815|A9BC00  |      ; ZERO GLYPH
    CLC                                                        ;839818|18      |      ;
    ADC.B strcVariables.n16Temp1                               ;839819|657E    |00007E;
    LDX.W #$0000                                               ;83981B|A20000  |      ;
    JSL.L fDialog_TransferGlyph                                ;83981E|22239883|839823;
 
.return:
    RTL                                                        ;839822|6B      |      ;
 
 
fDialog_TransferGlyph:
    REP #$30                                                   ;839823|C230    |      ; A: nLetterCode, X: nUnkown
    if !REGION_JP
    ; (no code in this region)
    else
    LDX.W #$0000                                               ;839825|A20000  |      ;
    endif
    PHX                                                        ;839828|DA      |      ;
    JSR.W fDialog_GetGlyphPointer                              ;839829|206298  |839862;
    REP #$30                                                   ;83982C|C230    |      ;
    PLX                                                        ;83982E|FA      |      ;
    TXA                                                        ;83982F|8A      |      ;
    LDX.W strcDialogDisplay.dialogUnk185                       ;839830|AE8501  |000185;
    JSL.L fGraphicsTransferData                                ;839833|22668183|838166;
    RTL                                                        ;839837|6B      |      ;
 
 
fDialog_AdvanceGlyphDestination:
    REP #$30                                                   ;839838|C230    |      ;
    if !REGION_JP
    ; (no code in this region)
    else
    LDX.W #$0000                                               ;83983A|A20000  |      ; X = 0
    endif
    TXA                                                        ;83983D|8A      |      ; X -> A
    ASL A                                                      ;83983E|0A      |      ;
    ASL A                                                      ;83983F|0A      |      ;
    ASL A                                                      ;839840|0A      |      ;
    ADC.W #$0008                                               ;839841|690800  |      ;
    STA.B strcVariables.n16Temp2                               ;839844|8580    |000080; $80 = A * 8 + 8
    LDA.W strcDialogDisplay.dialogUnk185                       ;839846|AD8501  |000185;
    CLC                                                        ;839849|18      |      ;
    ADC.B strcVariables.n16Temp2                               ;83984A|6580    |000080;
    STA.W strcDialogDisplay.dialogUnk185                       ;83984C|8D8501  |000185; $0185 += A * 8 + 8
    AND.W #$00FF                                               ;83984F|29FF00  |      ;
    CMP.W #$0080                                               ;839852|C98000  |      ;
    BNE .return                                                ;839855|D00A    |839861;
    LDA.W strcDialogDisplay.dialogUnk185                       ;839857|AD8501  |000185;
    CLC                                                        ;83985A|18      |      ;
    ADC.W #$0080                                               ;83985B|698000  |      ;
    STA.W strcDialogDisplay.dialogUnk185                       ;83985E|8D8501  |000185;
 
.return:
    RTS                                                        ;839861|60      |      ;
 
 
fDialog_GetGlyphPointer:
    REP #$30                                                   ;839862|C230    |      ; A: nLetterCode, return $72: ptr24 pGlyph
    STA.B strcVariables.n16Temp1                               ;839864|857E    |00007E;
    LSR A                                                      ;839866|4A      |      ;
    LSR A                                                      ;839867|4A      |      ;
    LSR A                                                      ;839868|4A      |      ;
    LSR A                                                      ;839869|4A      |      ;
    LSR A                                                      ;83986A|4A      |      ;
    LSR A                                                      ;83986B|4A      |      ;
    STA.B strcVariables.n16Temp2                               ;83986C|8580    |000080;
    ASL A                                                      ;83986E|0A      |      ;
    CLC                                                        ;83986F|18      |      ;
    ADC.B strcVariables.n16Temp2                               ;839870|6580    |000080;
    TAX                                                        ;839872|AA      |      ; Store pTable index into X
    LDA.L aLetterGlyphsPointers,X                              ;839873|BFAE9883|8398AE;
    STA.B ptrTemp0x72                                          ;839877|8572    |000072;
    INX                                                        ;839879|E8      |      ;
    INX                                                        ;83987A|E8      |      ;
    SEP #$20                                                   ;83987B|E220    |      ;
    LDA.L aLetterGlyphsPointers,X                              ;83987D|BFAE9883|8398AE;
    STA.B ptrTemp0x72+2                                        ;839881|8574    |000074;
    REP #$20                                                   ;839883|C220    |      ;
    LDA.B strcVariables.n16Temp1                               ;839885|A57E    |00007E;
    AND.W #$003F                                               ;839887|293F00  |      ;
    LSR A                                                      ;83988A|4A      |      ;
    LSR A                                                      ;83988B|4A      |      ;
    LSR A                                                      ;83988C|4A      |      ;
    ASL A                                                      ;83988D|0A      |      ;
    ASL A                                                      ;83988E|0A      |      ;
    ASL A                                                      ;83988F|0A      |      ;
    ASL A                                                      ;839890|0A      |      ;
    ASL A                                                      ;839891|0A      |      ;
    ASL A                                                      ;839892|0A      |      ;
    ASL A                                                      ;839893|0A      |      ;
    ASL A                                                      ;839894|0A      |      ;
    ASL A                                                      ;839895|0A      |      ;
    STA.B strcVariables.n16Temp2                               ;839896|8580    |000080; store calculated row offset
    LDA.B strcVariables.n16Temp1                               ;839898|A57E    |00007E;
    AND.W #$0007                                               ;83989A|290700  |      ;
    ASL A                                                      ;83989D|0A      |      ;
    ASL A                                                      ;83989E|0A      |      ;
    ASL A                                                      ;83989F|0A      |      ;
    ASL A                                                      ;8398A0|0A      |      ;
    ASL A                                                      ;8398A1|0A      |      ;
    STA.B strcVariables.n16Temp1                               ;8398A2|857E    |00007E; store calculated column offset
    LDA.B ptrTemp0x72                                          ;8398A4|A572    |000072;
    CLC                                                        ;8398A6|18      |      ;
    ADC.B strcVariables.n16Temp1                               ;8398A7|657E    |00007E; add column offset to pointer
    ADC.B strcVariables.n16Temp2                               ;8398A9|6580    |000080; add row offset to pointer
    STA.B ptrTemp0x72                                          ;8398AB|8572    |000072; save calculated offset to memory
    RTS                                                        ;8398AD|60      |      ;
 
aLetterGlyphsPointers:
    dl sFontGlyphs_0x00                                        ;8398AE|        |949843; 0x0A * [ptr24]
    dl sFontGlyphs_0x01                                        ;8398B1|        |94A843;
    dl sFontGlyphs_0x02                                        ;8398B4|        |94B843;
    dl sFontGlyphs_0x03                                        ;8398B7|        |94C843;
    dl sFontGlyphs_0x04                                        ;8398BA|        |94D843;
    dl sFontGlyphs_0x05                                        ;8398BD|        |94E843;
    dl sFontGlyphs_0x06                                        ;8398C0|        |958000;
    dl sFontGlyphs_0x07                                        ;8398C3|        |959000;
    dl sFontGlyphs_0x08                                        ;8398C6|        |95A000;
    dl sFontGlyphs_0x09                                        ;8398C9|        |95B000;
 
aTextDataTableFFFE:
    if !REGION_DE
    dw $5010,$5170,$5350,$5100,$5260
    elseif !REGION_JP
    dw $5010,$5170,$5350,$5070,$5250
    else
    dw $5010,$5170,$5350,$5108,$5268                           ;8398CC|        |      ; 0x05 * [n16] (stored at $185)
    endif
 
pTextAmmountTable:
    dl $000001,$00000A,$000064,$0003E8                         ;8398D6|        |      ; 0x06 * [n24/ptr24] (used for example to show any variable number for example: money, logs, etc on text screen. Last entry seems to be ptr24)
    dl $002710,$0186A0,$0F4240,$989680                         ;8398E2|        |      ;
aTextDataTableFFFC:
    dl $7F1F04                                                 ;8398EE|        |7F1F04; 0x70 * [ptr28 pData, n8 nSize]
    db $03                                                     ;8398F1|        |      ;
    dl $7F1F0A                                                 ;8398F2|        |7F1F0A;
    db $01                                                     ;8398F5|        |      ;
    dl $7F1F0B                                                 ;8398F6|        |7F1F0B;
    db $01                                                     ;8398F9|        |      ;
    dl $7F1F0E                                                 ;8398FA|        |7F1F0E;
    db $02                                                     ;8398FD|        |      ;
    dl $7F1F0C                                                 ;8398FE|        |7F1F0C;
    db $02                                                     ;839901|        |      ;
    dl $7F1F10                                                 ;839902|        |7F1F10;
    db $02                                                     ;839905|        |      ;
    dl $7F1F12                                                 ;839906|        |7F1F12;
    db $01                                                     ;839909|        |      ;
    dl $7F1F04                                                 ;83990A|        |7F1F04;
    db $03                                                     ;83990D|        |      ;
    dl $7F1F04                                                 ;83990E|        |7F1F04;
    db $03                                                     ;839911|        |      ;
    dl $7F1F04                                                 ;839912|        |7F1F04;
    db $03                                                     ;839915|        |      ;
    dl $7F1F1B                                                 ;839916|        |7F1F1B;
    db $01                                                     ;839919|        |      ;
    dl $7F1F1B                                                 ;83991A|        |7F1F1B;
    db $01                                                     ;83991D|        |      ;
    dl $7F1F1B                                                 ;83991E|        |7F1F1B;
    db $01                                                     ;839921|        |      ;
    dl $7F1F04                                                 ;839922|        |7F1F04;
    db $03                                                     ;839925|        |      ;
    dl $7F1F04                                                 ;839926|        |7F1F04;
    db $03                                                     ;839929|        |      ;
    dl $7F1F04                                                 ;83992A|        |7F1F04;
    db $03                                                     ;83992D|        |      ;
    dl $7F1F04                                                 ;83992E|        |7F1F04;
    db $03                                                     ;839931|        |      ;
    dl $7F1F04                                                 ;839932|        |7F1F04;
    db $03                                                     ;839935|        |      ;
    dl $7F1F04                                                 ;839936|        |7F1F04;
    db $03                                                     ;839939|        |      ;
    dl $7F1F04                                                 ;83993A|        |7F1F04;
    db $03                                                     ;83993D|        |      ;
    dl $7F1F04                                                 ;83993E|        |7F1F04;
    db $03                                                     ;839941|        |      ;
    dl $7F1F04                                                 ;839942|        |7F1F04;
    db $03                                                     ;839945|        |      ;
    dl $7F1F04                                                 ;839946|        |7F1F04;
    db $03                                                     ;839949|        |      ;
    dl $7F1F04                                                 ;83994A|        |7F1F04;
    db $03                                                     ;83994D|        |      ;
    dl $7F1F04                                                 ;83994E|        |7F1F04;
    db $03                                                     ;839951|        |      ;
    dl $7F1F15                                                 ;839952|        |7F1F15;
    db $03                                                     ;839955|        |      ;
    dl $7F1F04                                                 ;839956|        |7F1F04;
    db $03                                                     ;839959|        |      ;
    dl $7F1F04                                                 ;83995A|        |7F1F04;
    db $03                                                     ;83995D|        |      ;
    dl $7F1F04                                                 ;83995E|        |7F1F04;
    db $03                                                     ;839961|        |      ;
    dl $7F1F07                                                 ;839962|        |7F1F07;
    db $03                                                     ;839965|        |      ;
    dl $7F1F04                                                 ;839966|        |7F1F04;
    db $03                                                     ;839969|        |      ;
    dl $7F1F04                                                 ;83996A|        |7F1F04;
    db $03                                                     ;83996D|        |      ;
    dl $7F1F04                                                 ;83996E|        |7F1F04;
    db $03                                                     ;839971|        |      ;
    dl $7F1F04                                                 ;839972|        |7F1F04;
    db $03                                                     ;839975|        |      ;
    dl $7F1F04                                                 ;839976|        |7F1F04;
    db $03                                                     ;839979|        |      ;
    dl $7F1F04                                                 ;83997A|        |7F1F04;
    db $03                                                     ;83997D|        |      ;
    dl $7F1F04                                                 ;83997E|        |7F1F04;
    db $03                                                     ;839981|        |      ;
    dl $7F1F04                                                 ;839982|        |7F1F04;
    db $03                                                     ;839985|        |      ;
    dl $7F1F04                                                 ;839986|        |7F1F04;
    db $03                                                     ;839989|        |      ;
    dl $7F1F04                                                 ;83998A|        |7F1F04;
    db $03                                                     ;83998D|        |      ;
    dl $7F1F04                                                 ;83998E|        |7F1F04;
    db $03                                                     ;839991|        |      ;
    dl $7F1F04                                                 ;839992|        |7F1F04;
    db $03                                                     ;839995|        |      ;
    dl $7F1F04                                                 ;839996|        |7F1F04;
    db $03                                                     ;839999|        |      ;
    dl $7F1F04                                                 ;83999A|        |7F1F04;
    db $03                                                     ;83999D|        |      ;
    dl $7F1F04                                                 ;83999E|        |7F1F04;
    db $03                                                     ;8399A1|        |      ;
    dl $7F1F04                                                 ;8399A2|        |7F1F04;
    db $03                                                     ;8399A5|        |      ;
    dl $7F1F04                                                 ;8399A6|        |7F1F04;
    db $03                                                     ;8399A9|        |      ;
    dl $7F1F04                                                 ;8399AA|        |7F1F04;
    db $03                                                     ;8399AD|        |      ;
    dl $7F1F04                                                 ;8399AE|        |7F1F04;
    db $03                                                     ;8399B1|        |      ;
    dl $7F1F04                                                 ;8399B2|        |7F1F04;
    db $03                                                     ;8399B5|        |      ;
    dl $7F1F04                                                 ;8399B6|        |7F1F04;
    db $03                                                     ;8399B9|        |      ;
    dl $7F1F04                                                 ;8399BA|        |7F1F04;
    db $03                                                     ;8399BD|        |      ;
    dl $7F1F04                                                 ;8399BE|        |7F1F04;
    db $03                                                     ;8399C1|        |      ;
    dl $7F1F04                                                 ;8399C2|        |7F1F04;
    db $03                                                     ;8399C5|        |      ;
    dl $7F1F04                                                 ;8399C6|        |7F1F04;
    db $03                                                     ;8399C9|        |      ;
    dl $7F1F04                                                 ;8399CA|        |7F1F04;
    db $03                                                     ;8399CD|        |      ;
    dl $7F1F04                                                 ;8399CE|        |7F1F04;
    db $03                                                     ;8399D1|        |      ;
    dl $7F1F04                                                 ;8399D2|        |7F1F04;
    db $03                                                     ;8399D5|        |      ;
    dl $7F1F04                                                 ;8399D6|        |7F1F04;
    db $03                                                     ;8399D9|        |      ;
    dl $7F1F04                                                 ;8399DA|        |7F1F04;
    db $03                                                     ;8399DD|        |      ;
    dl $7F1F1B                                                 ;8399DE|        |7F1F1B;
    db $01                                                     ;8399E1|        |      ;
    dl $7F1F04                                                 ;8399E2|        |7F1F04;
    db $03                                                     ;8399E5|        |      ;
    dl $7F1F0A                                                 ;8399E6|        |7F1F0A;
    db $01                                                     ;8399E9|        |      ;
    dl $7F1F0B                                                 ;8399EA|        |7F1F0B;
    db $01                                                     ;8399ED|        |      ;
    dl $800917+!RAM_SHIFT                                  ;8399EE|        |800917;
    db $01                                                     ;8399F1|        |      ;
    dl $8009B5+!RAM_SHIFT                                  ;8399F2|        |8009B5;
    db $01                                                     ;8399F5|        |      ;
    dl $7F1F1F                                                 ;8399F6|        |7F1F1F;
    db $02                                                     ;8399F9|        |      ;
    dl $7F1F21                                                 ;8399FA|        |7F1F21;
    db $02                                                     ;8399FD|        |      ;
    dl $7F1F23                                                 ;8399FE|        |7F1F23;
    db $02                                                     ;839A01|        |      ;
    dl $7F1F25                                                 ;839A02|        |7F1F25;
    db $02                                                     ;839A05|        |      ;
    dl $7F1F27                                                 ;839A06|        |7F1F27;
    db $02                                                     ;839A09|        |      ;
    dl $7F1F4C                                                 ;839A0A|        |7F1F4C;
    db $02                                                     ;839A0D|        |      ;
    dl $7F1F4A                                                 ;839A0E|        |7F1F4A;
    db $02                                                     ;839A11|        |      ;
    dl $7F1F50                                                 ;839A12|        |7F1F50;
    db $02                                                     ;839A15|        |      ;
    dl $7F1F4E                                                 ;839A16|        |7F1F4E;
    db $02                                                     ;839A19|        |      ;
    dl $7F1F33                                                 ;839A1A|        |7F1F33;
    db $02                                                     ;839A1D|        |      ;
    dl $7F1F1B                                                 ;839A1E|        |7F1F1B;
    db $01                                                     ;839A21|        |      ;
    dl $7F1F04                                                 ;839A22|        |7F1F04;
    db $03                                                     ;839A25|        |      ;
    dl $7F1F1B                                                 ;839A26|        |7F1F1B;
    db $01                                                     ;839A29|        |      ;
    dl $7F1F04                                                 ;839A2A|        |7F1F04;
    db $03                                                     ;839A2D|        |      ;
    dl $7F1F1B                                                 ;839A2E|        |7F1F1B;
    db $01                                                     ;839A31|        |      ;
    dl $7F1F04                                                 ;839A32|        |7F1F04;
    db $03                                                     ;839A35|        |      ;
    dl $7F1F1B                                                 ;839A36|        |7F1F1B;
    db $01                                                     ;839A39|        |      ;
    dl $7F1F04                                                 ;839A3A|        |7F1F04;
    db $03                                                     ;839A3D|        |      ;
    dl $7F1F1B                                                 ;839A3E|        |7F1F1B;
    db $01                                                     ;839A41|        |      ;
    dl $7F1F04                                                 ;839A42|        |7F1F04;
    db $03                                                     ;839A45|        |      ;
    dl $7F1F1B                                                 ;839A46|        |7F1F1B;
    db $01                                                     ;839A49|        |      ;
    dl $7F1F04                                                 ;839A4A|        |7F1F04;
    db $03                                                     ;839A4D|        |      ;
    dl $7F1F1B                                                 ;839A4E|        |7F1F1B;
    db $01                                                     ;839A51|        |      ;
    dl $7F1F04                                                 ;839A52|        |7F1F04;
    db $03                                                     ;839A55|        |      ;
    dl $7F1F1B                                                 ;839A56|        |7F1F1B;
    db $01                                                     ;839A59|        |      ;
    dl $7F1F04                                                 ;839A5A|        |7F1F04;
    db $03                                                     ;839A5D|        |      ;
    dl $7F1F1B                                                 ;839A5E|        |7F1F1B;
    db $01                                                     ;839A61|        |      ;
    dl $7F1F04                                                 ;839A62|        |7F1F04;
    db $03                                                     ;839A65|        |      ;
    dl $7F1F1B                                                 ;839A66|        |7F1F1B;
    db $01                                                     ;839A69|        |      ;
    dl $7F1F04                                                 ;839A6A|        |7F1F04;
    db $03                                                     ;839A6D|        |      ;
    dl $7F1F1B                                                 ;839A6E|        |7F1F1B;
    db $01                                                     ;839A71|        |      ;
    dl $7F1F04                                                 ;839A72|        |7F1F04;
    db $03                                                     ;839A75|        |      ;
    dl $7F1F1B                                                 ;839A76|        |7F1F1B;
    db $01                                                     ;839A79|        |      ;
    dl $7F1F04                                                 ;839A7A|        |7F1F04;
    db $03                                                     ;839A7D|        |      ;
    dl $7F1F1B                                                 ;839A7E|        |7F1F1B;
    db $01                                                     ;839A81|        |      ;
    dl $7F1F04                                                 ;839A82|        |7F1F04;
    db $03                                                     ;839A85|        |      ;
    dl $7F1F1B                                                 ;839A86|        |7F1F1B;
    db $01                                                     ;839A89|        |      ;
    dl $7F1F04                                                 ;839A8A|        |7F1F04;
    db $03                                                     ;839A8D|        |      ;
    dl $7F1F1B                                                 ;839A8E|        |7F1F1B;
    db $01                                                     ;839A91|        |      ;
    dl $7F1F04                                                 ;839A92|        |7F1F04;
    db $03                                                     ;839A95|        |      ;
    dl $7F1F54                                                 ;839A96|        |7F1F54;
    db $02                                                     ;839A99|        |      ;
    dl $7F1F54                                                 ;839A9A|        |7F1F54;
    db $02                                                     ;839A9D|        |      ;
    dl $7F1F54                                                 ;839A9E|        |7F1F54;
    db $02                                                     ;839AA1|        |      ;
    dl $7F1F54                                                 ;839AA2|        |7F1F54;
    db $02                                                     ;839AA5|        |      ;
    dl $7F1F54                                                 ;839AA6|        |7F1F54;
    db $02                                                     ;839AA9|        |      ;
    dl $7F1F56                                                 ;839AAA|        |7F1F56;
    db $02                                                     ;839AAD|        |      ;
aTextDataTableFFFD:
    if !REGION_JP
    db $BD,$08,$80,$08,$C5,$08,$80,$08,$89,$08,$80,$08,$89,$08,$80,$08
    db $89,$08,$80,$08,$89,$08,$80,$08,$B5,$08,$80,$08,$BD,$08,$80,$08
    db $B5,$08,$80,$08,$B5,$08,$80,$08,$BD,$08,$80,$08,$B1,$08,$80,$02
    db $B3,$08,$80,$02,$C5,$08,$80,$08,$B1,$08,$80,$02,$B1,$08,$80,$02
    db $A1,$08,$80,$08,$BD,$08,$80,$08,$B5,$08,$80,$08,$B1,$08,$80,$02
    db $89,$08,$80,$08,$B5,$08,$80,$08,$B5,$08,$80,$08,$CD,$08,$80,$08
    db $D5,$08,$80,$08,$BD,$08,$80,$08,$BD,$08,$80,$08,$C5,$08,$80,$08
    db $C5,$08,$80
    else
    if !REGION_DE
    db $E3,$08,$80,$08,$EB,$08,$80,$08,$89,$08,$80,$08,$89,$08,$80,$08
    db $89,$08,$80,$08,$89,$08,$80,$08,$DB,$08,$80,$08,$E3,$08,$80,$08
    db $DB,$08,$80,$08,$DB,$08,$80,$08,$E3,$08,$80,$08,$C3,$08,$80,$14
    db $B3,$08,$80,$10,$EB,$08,$80,$08,$C3,$08,$80,$14,$B3,$08,$80,$10
    db $C3,$08,$80,$14,$B3,$08,$80,$10,$A1,$08,$80,$0A,$E3,$08,$80,$08
    db $DB,$08,$80,$08,$B3,$08,$80,$10
    else
    dl $8008DD                                                 ;839AAE|        |8008DD; 0x52 * [ptr28 pData, n8 nSize]
    db $08                                                     ;839AB1|        |      ;
    dl $8008E5                                                 ;839AB2|        |8008E5;
    db $08                                                     ;839AB5|        |      ;
    dl $800889                                                 ;839AB6|        |800889;
    db $08                                                     ;839AB9|        |      ;
    dl $800889                                                 ;839ABA|        |800889;
    db $08                                                     ;839ABD|        |      ;
    dl $800889                                                 ;839ABE|        |800889;
    db $08                                                     ;839AC1|        |      ;
    dl $800889                                                 ;839AC2|        |800889;
    db $08                                                     ;839AC5|        |      ;
    dl $8008D5                                                 ;839AC6|        |8008D5;
    db $08                                                     ;839AC9|        |      ;
    dl $8008DD                                                 ;839ACA|        |8008DD;
    db $08                                                     ;839ACD|        |      ;
    dl $8008D5                                                 ;839ACE|        |8008D5;
    db $08                                                     ;839AD1|        |      ;
    dl $8008D5                                                 ;839AD2|        |8008D5;
    db $08                                                     ;839AD5|        |      ;
    dl $8008DD                                                 ;839AD6|        |8008DD;
    db $08                                                     ;839AD9|        |      ;
    dl $8008BF                                                 ;839ADA|        |8008BF;
    db $12                                                     ;839ADD|        |      ;
    dl $8008D1                                                 ;839ADE|        |8008D1;
    db $04                                                     ;839AE1|        |      ;
    dl $8008B3                                                 ;839AE2|        |8008B3;
    db $0C                                                     ;839AE5|        |      ;
    dl $8008E5                                                 ;839AE6|        |8008E5;
    db $08                                                     ;839AE9|        |      ;
    dl $8008BF                                                 ;839AEA|        |8008BF;
    db $12                                                     ;839AED|        |      ;
    dl $8008D1                                                 ;839AEE|        |8008D1;
    db $04                                                     ;839AF1|        |      ;
    dl $8008B3                                                 ;839AF2|        |8008B3;
    db $0C                                                     ;839AF5|        |      ;
    dl $8008BF                                                 ;839AF6|        |8008BF;
    db $12                                                     ;839AF9|        |      ;
    dl $8008D1                                                 ;839AFA|        |8008D1;
    db $04                                                     ;839AFD|        |      ;
    dl $8008B3                                                 ;839AFE|        |8008B3;
    db $0C                                                     ;839B01|        |      ;
    dl $8008A1                                                 ;839B02|        |8008A1;
    db $0A                                                     ;839B05|        |      ;
    dl $8008DD                                                 ;839B06|        |8008DD;
    db $08                                                     ;839B09|        |      ;
    dl $8008D5                                                 ;839B0A|        |8008D5;
    db $08                                                     ;839B0D|        |      ;
    dl $8008D1                                                 ;839B0E|        |8008D1;
    db $04                                                     ;839B11|        |      ;
    dl $8008B3                                                 ;839B12|        |8008B3;
    db $0C                                                     ;839B15|        |      ;
    endif
    dl $800889                                                 ;839B16|        |800889;
    db $08                                                     ;839B19|        |      ;
    dl $8008D5+!RAM_SHIFT                                  ;839B1A|        |8008D5;
    db $08                                                     ;839B1D|        |      ;
    dl $8008D5+!RAM_SHIFT                                  ;839B1E|        |8008D5;
    db $08                                                     ;839B21|        |      ;
    dl $8008ED+!RAM_SHIFT                                  ;839B22|        |8008ED;
    db $08                                                     ;839B25|        |      ;
    dl $8008F5+!RAM_SHIFT                                  ;839B26|        |8008F5;
    db $08                                                     ;839B29|        |      ;
    dl $8008DD+!RAM_SHIFT                                  ;839B2A|        |8008DD;
    db $08                                                     ;839B2D|        |      ;
    dl $8008DD+!RAM_SHIFT                                  ;839B2E|        |8008DD;
    db $08                                                     ;839B31|        |      ;
    dl $8008E5+!RAM_SHIFT                                  ;839B32|        |8008E5;
    db $08                                                     ;839B35|        |      ;
    dl $8008E5+!RAM_SHIFT                                  ;839B36|        |8008E5;
    endif
    db $08                                                     ;839B39|        |      ;
    dl $800889                                                 ;839B3A|        |800889;
    db $08                                                     ;839B3D|        |      ;
    if !REGION_DE
    db $C3,$08,$80,$14,$B3,$08,$80,$10,$C3,$08,$80,$14,$B3,$08,$80,$10
    db $C3,$08,$80,$14,$B3,$08,$80,$10,$C3,$08,$80,$14,$B3,$08,$80,$10
    db $C3,$08,$80,$14,$B3,$08,$80,$10,$C3,$08,$80,$14,$B3,$08,$80,$10
    db $C3,$08,$80,$14,$B3,$08,$80,$10,$C3,$08,$80,$14,$B3,$08,$80,$10
    db $C3,$08,$80,$14,$B3,$08,$80,$10,$C3,$08,$80,$14,$B3,$08,$80,$10
    db $C3,$08,$80,$14,$B3,$08,$80,$10,$C3,$08,$80,$14,$B3,$08,$80,$10
    db $C3,$08,$80,$14,$B3,$08,$80,$10,$C3,$08,$80,$14,$B3,$08,$80,$10
    db $C3,$08,$80,$14,$B3,$08,$80,$10,$DB,$08,$80,$08
aDialogPointers:
    db $00,$80,$B6,$BA,$80,$B6,$4C,$81,$B6,$2C,$82,$B6,$C8,$82,$B6,$7C
    db $83,$B6,$4C,$84,$B6,$E2,$84,$B6,$7C,$85,$B6,$88,$86,$B6,$92,$87
    db $B6,$44,$88,$B6,$A2,$88,$B6,$2C,$89,$B6,$44,$89,$B6,$F6,$89,$B6
    db $2E,$8B,$B6,$92,$8C,$B6,$26,$8E,$B6,$78,$8F,$B6,$DC,$90,$B6,$62
    db $91,$B6,$9A,$92,$B6,$8C,$93,$B6,$36,$95,$B6,$0C,$97,$B6,$8C,$97
    db $B6,$28,$98,$B6,$B4,$98,$B6,$46,$99,$B6,$F8,$99,$B6,$50,$9A,$B6
    db $7E,$9A,$B6,$9E,$9A,$B6,$D0,$9A,$B6,$6E,$9B,$B6,$EA,$9B,$B6,$6A
    db $9C,$B6,$F0,$9C,$B6,$4C,$9D,$B6,$AC,$9D,$B6,$1C,$9E,$B6,$7C,$9E
    db $B6,$E6,$9E,$B6,$94,$9F,$B6,$F6,$9F,$B6,$1E,$A0,$B6,$4C,$A0,$B6
    db $B4,$A0,$B6,$E4,$A0,$B6,$70,$A1,$B6,$D4,$A1,$B6,$28,$A2,$B6,$60
    db $A2,$B6,$E6,$A2,$B6,$1A,$A4,$B6,$68,$A4,$B6,$04,$A5,$B6,$C4,$A5
    db $B6,$02,$A7,$B6,$DA,$A7,$B6,$72,$A8,$B6,$D4,$A8,$B6,$BC,$A9,$B6
    db $30,$AB,$B6,$D2,$AB,$B6,$D4,$AC,$B6,$40,$AD,$B6,$EA,$AD,$B6,$2C
    db $AF,$B6,$60,$B0,$B6,$FA,$B0,$B6,$9E,$B1,$B6,$F4,$B1,$B6,$02,$B2
    db $B6,$B8,$B2,$B6,$74,$B3,$B6,$D4,$B3,$B6,$46,$B4,$B6,$E0,$B4,$B6
    db $CA,$B5,$B6,$7E,$B6,$B6,$E0,$B6,$B6,$50,$B7,$B6,$BE,$B7,$B6,$BA
    db $B8,$B6,$3E,$B9,$B6,$E6,$B9,$B6,$EC,$BA,$B6,$98,$BB,$B6,$B6,$BC
    db $B6,$BA,$BD,$B6,$A6,$BE,$B6,$D4,$BF,$B6,$22,$C1,$B6,$E0,$C1,$B6
    db $2C,$C3,$B6,$06,$C4,$B6,$D4,$C4,$B6,$8A,$C5,$B6,$D6,$C6,$B6,$A6
    db $C7,$B6,$2E,$C8,$B6,$60,$C9,$B6,$B0,$C9,$B6,$9C,$CA,$B6,$F0,$CA
    db $B6,$B0,$CB,$B6,$22,$CC,$B6,$80,$CC,$B6,$F2,$CC,$B6,$60,$CD,$B6
    db $8E,$CE,$B6,$0E,$CF,$B6,$44,$D0,$B6,$3A,$D1,$B6,$9E,$D1,$B6,$8E
    db $D2,$B6,$2E,$D3,$B6,$04,$D4,$B6,$C0,$D4,$B6,$F8,$D5,$B6,$F4,$D6
    db $B6,$DE,$D7,$B6,$94,$D8,$B6,$06,$D9,$B6,$5E,$D9,$B6,$EE,$D9,$B6
    db $70,$DA,$B6,$92,$DA,$B6,$C4,$DA,$B6,$06,$DB,$B6,$4C,$DB,$B6,$9C
    db $DB,$B6,$E8,$DB,$B6,$58,$DC,$B6,$08,$DD,$B6,$DE,$DD,$B6,$74,$DE
    db $B6,$EA,$DE,$B6,$56,$DF,$B6,$66,$DF,$B6,$FC,$DF,$B6,$96,$E0,$B6
    db $C8,$E0,$B6,$0E,$E1,$B6,$98,$E1,$B6,$FC,$E1,$B6,$AE,$E2,$B6,$18
    db $E3,$B6,$82,$E3,$B6,$DA,$E3,$B6,$BE,$E4,$B6,$DA,$E4,$B6,$20,$E5
    db $B6,$88,$E5,$B6,$20,$E6,$B6,$48,$E6,$B6,$08,$E7,$B6,$C8,$E7,$B6
    db $18,$E8,$B6,$BC,$E8,$B6,$3E,$E9,$B6,$E2,$E9,$B6,$32,$EA,$B6,$64
    db $EA,$B6,$EE,$EA,$B6,$6E,$EB,$B6,$9E,$EB,$B6,$FE,$EB,$B6,$62,$EC
    db $B6,$72,$ED,$B6,$12,$EF,$B6,$4A,$EF,$B6,$04,$F0,$B6,$96,$F0,$B6
    db $20,$F1,$B6,$70,$F1,$B6,$80,$F1,$B6,$14,$F2,$B6,$FC,$F2,$B6,$30
    db $F3,$B6,$FE,$F3,$B6,$9E,$F4,$B6,$46,$F5,$B6,$40,$F6,$B6,$E8,$F6
    db $B6,$68,$F7,$B6,$C4,$F7,$B6,$94,$F8,$B6,$F8,$F8,$B6,$1E,$F9,$B6
    db $B4,$F9,$B6,$4C,$FA,$B6,$E6,$FB,$B6,$F2,$FC,$B6,$28,$FD,$B6,$8E
    db $FD,$B6,$DA,$FD,$B6,$88,$FE,$B6,$00,$80,$B7,$D4,$80,$B7,$F0,$80
    db $B7,$58,$81,$B7,$E4,$81,$B7,$28,$82,$B7,$B2,$82,$B7,$6C,$83,$B7
    db $72,$84,$B7,$FC,$84,$B7,$7C,$85,$B7,$48,$86,$B7,$24,$87,$B7,$A0
    db $87,$B7,$30,$88,$B7,$8C,$88,$B7,$D2,$88,$B7,$42,$89,$B7,$FC,$89
    db $B7,$A6,$8A,$B7,$18,$8B,$B7,$DA,$8B,$B7,$F2,$8B,$B7,$C4,$8C,$B7
    db $60,$8D,$B7,$CC,$8D,$B7,$02,$8E,$B7,$B6,$8E,$B7,$FE,$8E,$B7,$46
    db $8F,$B7,$88,$8F,$B7,$6E,$90,$B7,$F4,$90,$B7,$88,$91,$B7,$D8,$91
    db $B7,$1A,$92,$B7,$52,$92,$B7,$C4,$92,$B7,$8C,$93,$B7,$5E,$94,$B7
    db $A6,$95,$B7,$F2,$96,$B7,$B6,$97,$B7,$56,$98,$B7,$26,$9A,$B7,$B4
    db $9B,$B7,$90,$9D,$B7,$B8,$9E,$B7,$A4,$9F,$B7,$02,$A0,$B7,$0C,$A1
    db $B7,$70,$A1,$B7,$70,$A2,$B7,$8A,$A2,$B7,$DE,$A3,$B7,$CC,$A4,$B7
    db $AE,$A6,$B7,$A6,$A7,$B7,$9A,$A8,$B7,$56,$A9,$B7,$3A,$AA,$B7,$22
    db $AB,$B7,$AC,$AC,$B7,$2C,$AD,$B7,$12,$AE,$B7,$70,$AE,$B7,$08,$AF
    db $B7,$86,$AF,$B7,$D8,$AF,$B7,$C8,$B1,$B7,$90,$B2,$B7,$BE,$B3,$B7
    db $04,$B5,$B7,$AC,$B5,$B7,$E8,$B7,$B7,$2C,$B9,$B7,$D6,$B9,$B7,$48
    db $BA,$B7,$52,$BB,$B7,$10,$BC,$B7,$90,$BC,$B7,$76,$BD,$B7,$CA,$BD
    db $B7,$4E,$BE,$B7,$4A,$BF,$B7,$CA,$BF,$B7,$16,$C0,$B7,$D2,$C0,$B7
    db $3A,$C1,$B7,$9A,$C1,$B7,$88,$C2,$B7,$CA,$C3,$B7,$78,$C4,$B7,$92
    db $C4,$B7,$FC,$C5,$B7,$8E,$C6,$B7,$80,$C7,$B7,$1A,$C8,$B7,$64,$C9
    db $B7,$96,$CA,$B7,$D8,$CB,$B7,$7E,$CC,$B7,$B2,$CC,$B7,$1A,$CD,$B7
    db $E6,$CD,$B7,$76,$CE,$B7,$D8,$CE,$B7,$42,$CF,$B7,$EE,$CF,$B7,$16
    db $D1,$B7,$60,$D1,$B7,$B8,$D1,$B7,$E6,$D3,$B7,$E2,$D4,$B7,$32,$D5
    db $B7,$98,$D5,$B7,$CA,$D6,$B7,$18,$D7,$B7,$A0,$D7,$B7,$EC,$D7,$B7
    db $D0,$D8,$B7,$BC,$D9,$B7,$DC,$DA,$B7,$FE,$DB,$B7,$2E,$DC,$B7,$D0
    db $DC,$B7,$6C,$DD,$B7,$10,$DE,$B7,$98,$DE,$B7,$68,$E0,$B7,$62,$E2
    db $B7,$F6,$E2,$B7,$3E,$E4,$B7,$02,$E5,$B7,$8A,$E7,$B7,$08,$E8,$B7
    db $8A,$E8,$B7,$D0,$E8,$B7,$22,$E9,$B7,$84,$E9,$B7,$F4,$E9,$B7,$58
    db $EA,$B7,$C2,$EA,$B7,$6C,$EB,$B7,$06,$EC,$B7,$B4,$EC,$B7,$48,$ED
    db $B7,$18,$EE,$B7,$26,$EF,$B7,$86,$EF,$B7,$56,$F0,$B7,$00,$F1,$B7
    db $9C,$F1,$B7,$FC,$F1,$B7,$96,$F2,$B7,$00,$F3,$B7,$44,$F3,$B7,$72
    db $F3,$B7,$C4,$F3,$B7,$86,$F4,$B7,$36,$F5,$B7,$9A,$F5,$B7,$F2,$F5
    db $B7,$D4,$F6,$B7,$68,$F7,$B7,$24,$F8,$B7,$0E,$F9,$B7,$A4,$F9,$B7
    db $F4,$F9,$B7,$52,$FA,$B7,$0E,$FB,$B7,$30,$FC,$B7,$5A,$FC,$B7,$BC
    db $FC,$B7,$E8,$FC,$B7,$16,$FD,$B7,$2A,$FD,$B7,$82,$FD,$B7,$A0,$FD
    db $B7,$34,$FE,$B7,$6A,$FE,$B7,$A0,$FE,$B7,$0C,$FF,$B7,$24,$FF,$B7
    db $4E,$FF,$B7,$A4,$FF,$B7,$00,$80,$B8,$46,$80,$B8,$90,$80,$B8,$7C
    db $81,$B8,$D8,$81,$B8,$98,$82,$B8,$6C,$83,$B8,$48,$84,$B8,$E2,$84
    db $B8,$A0,$85,$B8,$54,$86,$B8,$2E,$87,$B8,$FC,$87,$B8,$BA,$88,$B8
    db $18,$89,$B8,$E6,$89,$B8,$6C,$8A,$B8,$B4,$8A,$B8,$DE,$8A,$B8,$2A
    db $8B,$B8,$74,$8B,$B8,$C6,$8B,$B8,$4C,$8C,$B8,$D0,$8C,$B8,$3C,$8D
    db $B8,$92,$8D,$B8,$E6,$8D,$B8,$4A,$8E,$B8,$94,$8E,$B8,$C4,$8E,$B8
    db $72,$8F,$B8,$04,$90,$B8,$50,$90,$B8,$D6,$90,$B8,$3A,$91,$B8,$96
    db $91,$B8,$EA,$91,$B8,$3E,$92,$B8,$90,$92,$B8,$10,$93,$B8,$62,$93
    db $B8,$1A,$94,$B8,$4C,$94,$B8,$82,$94,$B8,$9E,$94,$B8,$E4,$94,$B8
    db $FE,$94,$B8,$18,$95,$B8,$4A,$95,$B8,$E8,$95,$B8,$08,$96,$B8,$6E
    db $96,$B8,$88,$96,$B8,$D4,$96,$B8,$6C,$97,$B8,$B4,$97,$B8,$FC,$97
    db $B8,$58,$98,$B8,$A6,$98,$B8,$FC,$98,$B8,$7C,$99,$B8,$94,$99,$B8
    db $EE,$99,$B8,$FA,$99,$B8,$0A,$9A,$B8,$1C,$9A,$B8,$86,$9B,$B8,$A8
    db $9B,$B8,$18,$9C,$B8,$72,$9C,$B8,$D6,$9C,$B8,$06,$9D,$B8,$60,$9D
    db $B8,$1E,$9E,$B8,$68,$9E,$B8,$4C,$A0,$B8,$CC,$A0,$B8,$D0,$A1,$B8
    db $54,$A2,$B8,$E0,$A2,$B8,$A8,$A3,$B8,$02,$A4,$B8,$72,$A4,$B8,$F4
    db $A4,$B8,$B8,$A5,$B8,$2A,$A6,$B8,$58,$A6,$B8,$64,$A7,$B8,$86,$A7
    db $B8,$C0,$A7,$B8,$12,$A9,$B8,$00,$AA,$B8,$E0,$AA,$B8,$2E,$AB,$B8
    db $F4,$AB,$B8,$48,$AD,$B8,$DA,$AD,$B8,$90,$AE,$B8,$7E,$AF,$B8,$E0
    db $AF,$B8,$62,$B0,$B8,$1E,$B1,$B8,$A0,$B1,$B8,$F8,$B1,$B8,$AA,$B2
    db $B8,$36,$B3,$B8,$0E,$B4,$B8,$66,$B4,$B8,$00,$B5,$B8,$0E,$B5,$B8
    db $B8,$B5,$B8,$32,$B6,$B8,$8A,$B7,$B8,$EA,$B7,$B8,$36,$B8,$B8,$88
    db $B8,$B8,$18,$B9,$B8,$52,$B9,$B8,$B4,$B9,$B8,$1A,$BA,$B8,$6C,$BA
    db $B8,$98,$BA,$B8,$5A,$BB,$B8,$82,$BC,$B8,$10,$BD,$B8,$5E,$BD,$B8
    db $0C,$BE,$B8,$26,$BE,$B8,$1E,$BF,$B8,$1E,$C1,$B8,$B0,$C1,$B8,$2A
    db $C2,$B8,$F8,$C2,$B8,$94,$C3,$B8,$44,$C4,$B8,$E6,$C4,$B8,$32,$C5
    db $B8,$A2,$C5,$B8,$46,$C6,$B8,$E8,$C6,$B8,$92,$C8,$B8,$3E,$CA,$B8
    db $FE,$CB,$B8,$46,$CC,$B8,$62,$CC,$B8,$C0,$CC,$B8,$10,$CD,$B8,$22
    db $CF,$B8,$C8,$CF,$B8,$A0,$D0,$B8,$02,$D1,$B8,$90,$D1,$B8,$30,$D2
    db $B8,$98,$D2,$B8,$F4,$D2,$B8,$64,$D3,$B8,$36,$D4,$B8,$94,$D4,$B8
    db $E8,$D4,$B8,$EA,$D5,$B8,$DE,$D6,$B8,$46,$D7,$B8,$8C,$D7,$B8,$C0
    db $D7,$B8,$42,$D8,$B8,$B4,$D8,$B8,$56,$D9,$B8,$02,$DA,$B8,$2E,$DA
    db $B8,$B8,$DA,$B8,$0E,$DB,$B8,$64,$DB,$B8,$02,$DC,$B8,$82,$DC,$B8
    db $E6,$DC,$B8,$48,$DD,$B8,$26,$DE,$B8,$C6,$DE,$B8,$82,$DF,$B8,$A8
    db $E0,$B8,$DC,$E0,$B8,$3A,$E1,$B8,$1A,$E3,$B8,$70,$E3,$B8,$70,$E4
    db $B8,$B4,$E4,$B8,$56,$E5,$B8,$E6,$E5,$B8,$54,$E6,$B8,$B4,$E6,$B8
    db $22,$E7,$B8,$BA,$E8,$B8,$36,$E9,$B8,$88,$E9,$B8,$BA,$E9,$B8,$08
    db $EA,$B8,$50,$EA,$B8,$74,$EB,$B8,$EC,$EC,$B8,$42,$ED,$B8,$5E,$ED
    db $B8,$38,$EF,$B8,$E2,$F0,$B8,$30,$F1,$B8,$9E,$F1,$B8,$32,$F2,$B8
    db $14,$F3,$B8,$5C,$F3,$B8,$8E,$F3,$B8,$30,$F4,$B8,$90,$F4,$B8,$FE
    db $F4,$B8,$52,$F5,$B8,$E0,$F5,$B8,$F8,$F5,$B8,$08,$F6,$B8,$D6,$F6
    db $B8,$42,$F7,$B8,$AA,$F7,$B8,$72,$F8,$B8,$18,$F9,$B8,$12,$FA,$B8
    db $46,$FA,$B8,$7A,$FA,$B8,$DE,$FA,$B8,$E0,$FB,$B8,$38,$FC,$B8,$2E
    db $FD,$B8,$9A,$FD,$B8,$CA,$FD,$B8,$D4,$FE,$B8,$22,$FF,$B8,$00,$80
    db $B9,$18,$81,$B9,$F2,$81,$B9,$06,$82,$B9,$AC,$82,$B9,$78,$83,$B9
    db $72,$84,$B9,$CC,$84,$B9,$10,$85,$B9,$2E,$87,$B9,$4A,$88,$B9,$2A
    db $8A,$B9,$D8,$8A,$B9,$0E,$8B,$B9,$EE,$8B,$B9,$32,$8C,$B9,$82,$8C
    db $B9,$E4,$8C,$B9,$2C,$8E,$B9,$8E,$8E,$B9,$12,$8F,$B9,$98,$8F,$B9
    db $B6,$8F,$B9,$FC,$8F,$B9,$8A,$90,$B9,$26,$91,$B9,$82,$91,$B9,$EE
    db $91,$B9,$18,$92,$B9,$38,$92,$B9,$80,$92,$B9,$C8,$92,$B9,$56,$93
    db $B9,$DA,$93,$B9,$1C,$94,$B9,$CE,$94,$B9,$CC,$95,$B9,$22,$97,$B9
    db $00,$98,$B9,$46,$98,$B9,$FC,$98,$B9,$BE,$99,$B9,$EC,$99,$B9,$46
    db $9A,$B9,$68,$9A,$B9,$54,$9B,$B9,$E8,$9B,$B9,$44,$9C,$B9,$72,$9C
    db $B9,$DC,$9C,$B9,$3C,$9D,$B9,$8A,$9D,$B9,$1C,$9E,$B9,$7A,$9E,$B9
    db $D8,$9E,$B9,$E6,$9E,$B9,$40,$9F,$B9,$96,$9F,$B9,$1E,$A0,$B9,$8A
    db $A0,$B9,$0A,$A1,$B9,$A4,$A1,$B9,$F2,$A1,$B9,$20,$A2,$B9,$A0,$A2
    db $B9,$00,$A3,$B9,$58,$A3,$B9,$40,$A4,$B9,$D8,$A4,$B9,$56,$A5,$B9
    db $C2,$A5,$B9,$26,$A6,$B9,$74,$A6,$B9,$FC,$A6,$B9,$32,$A7,$B9,$A0
    db $A7,$B9,$6C,$A8,$B9,$4C,$A9,$B9,$B4,$A9,$B9,$80,$AA,$B9,$CC,$AA
    db $B9,$72,$AB,$B9,$EC,$AB,$B9,$6E,$AC,$B9,$60,$AD,$B9,$CE,$AD,$B9
    db $96,$AF,$B9,$3C,$B0,$B9,$68,$B0,$B9,$82,$B0,$B9,$E6,$B0,$B9,$90
    db $B1,$B9,$DC,$B1,$B9,$04,$B2,$B9,$9A,$B2,$B9,$34,$B3,$B9,$EE,$B3
    db $B9,$88,$B4,$B9,$AA,$B5,$B9,$7A,$B6,$B9,$0C,$B7,$B9,$8A,$B7,$B9
    db $24,$B8,$B9,$CE,$B8,$B9,$78,$B9,$B9,$E6,$B9,$B9,$A8,$BA,$B9,$6C
    db $BB,$B9,$00,$BC,$B9,$9C,$BC,$B9,$30,$BD,$B9,$52,$BD,$B9,$A6,$BD
    db $B9,$00,$BE,$B9,$88,$BE,$B9,$A8,$BE,$B9,$64,$C0,$B9,$AA,$C0,$B9
    db $F4,$C0,$B9,$4C,$C1,$B9,$7E,$C1,$B9,$D2,$C1,$B9,$1E,$C2,$B9,$6A
    db $C2,$B9,$FA,$C2,$B9,$66,$C3,$B9,$06,$C4,$B9,$A8,$C4,$B9,$00,$C5
    db $B9,$84,$C5,$B9,$4C,$C6,$B9,$B6,$C6,$B9,$18,$C7,$B9,$6A,$C7,$B9
    db $C4,$C7,$B9,$30,$C8,$B9,$42,$C8,$B9,$A8,$C8,$B9,$FA,$C8,$B9,$6C
    db $C9,$B9,$F2,$C9,$B9,$7C,$CB,$B9,$D6,$CB,$B9,$F0,$CB,$B9,$5E,$CC
    db $B9,$A6,$CC,$B9,$3A,$CE,$B9,$7E,$CF,$B9,$E8,$CF,$B9,$1E,$D0,$B9
    db $72,$D0,$B9,$58,$D2,$B9,$26,$D4,$B9,$72,$D4,$B9,$7C,$D4,$B9,$64
    db $D5,$B9,$3E,$D6,$B9,$A4,$D6,$B9,$A0,$D7,$B9,$EE,$D7,$B9,$5E,$D8
    db $B9,$7E,$D9,$B9,$26,$DA,$B9,$12,$DB,$B9,$D8,$DB,$B9,$CE,$DC,$B9
    db $10,$DD,$B9,$66,$DD,$B9,$62,$DE,$B9,$84,$DF,$B9,$D2,$DF,$B9,$52
    db $E1,$B9,$A8,$E1,$B9,$AA,$E2,$B9,$34,$E3,$B9,$B2,$E3,$B9,$E6,$E3
    db $B9,$90,$E4,$B9,$F0,$E4,$B9,$D2,$E5,$B9,$1A,$E6,$B9,$66,$E7,$B9
    db $F4,$E7,$B9,$A2,$E9,$B9,$46,$EA,$B9,$B6,$EA,$B9,$FA,$EA,$B9,$E4
    db $EB,$B9,$3E,$EC,$B9,$68,$EC,$B9,$68,$ED,$B9,$18,$EE,$B9,$84,$EE
    db $B9,$A6,$EE,$B9,$F6,$EE,$B9,$4A,$EF,$B9,$CA,$F0,$B9,$38,$F1,$B9
    db $B8,$F1,$B9,$88,$F2,$B9,$74,$F3,$B9,$A0,$F3,$B9,$58,$F4,$B9,$B8
    db $F4,$B9,$AE,$F5,$B9,$C2,$F6,$B9,$86,$F7,$B9,$D6,$F7,$B9,$0A,$F9
    db $B9,$08,$FA,$B9,$28,$FC,$B9,$C0,$FD,$B9,$00,$80,$BA,$52,$81,$BA
    db $9A,$83,$BA,$66,$85,$BA,$56,$87,$BA,$44,$89,$BA,$20,$8B,$BA,$E8
    db $8C,$BA,$20,$8E,$BA,$BE,$8F,$BA,$1C,$91,$BA,$72,$92,$BA,$E2,$92
    db $BA,$6A,$93,$BA,$F6,$93,$BA,$20,$94,$BA,$4C,$94,$BA,$A4,$94,$BA
    db $22,$95,$BA,$1C,$96,$BA,$16,$97,$BA,$10,$98,$BA,$12,$99,$BA,$3E
    db $9A,$BA,$3A,$9B,$BA,$44,$9C,$BA,$52,$9D,$BA,$3A,$9E,$BA,$D4,$9F
    db $BA,$F6,$A0,$BA,$FC,$A1,$BA,$0A,$A3,$BA,$9E,$A4,$BA,$AA,$A5,$BA
    db $C2,$A5,$BA,$78,$A7,$BA,$C4,$A7,$BA,$48,$A8,$BA,$D6,$A8,$BA,$2C
    db $A9,$BA,$C8,$A9,$BA,$36,$AA,$BA,$B0,$AA,$BA,$32,$AB,$BA,$AC,$AB
    db $BA,$28,$AC,$BA,$A4,$AC,$BA,$20,$AD,$BA,$82,$AD,$BA,$C4,$AD,$BA
    db $DA,$AD,$BA,$FE,$AD,$BA,$8C,$AE,$BA,$E8,$AE,$BA,$F4,$AF,$BA,$A6
    db $B0,$BA,$5E,$B1,$BA,$F8,$B1,$BA,$48,$B2,$BA,$70,$B2,$BA,$AA,$B2
    db $BA,$12,$B3,$BA,$6E,$B3,$BA,$EA,$B3,$BA,$08,$B4,$BA,$4C,$B4,$BA
    db $A0,$B4,$BA,$D6,$B4,$BA,$5E,$B5,$BA,$94,$B5,$BA,$EC,$B5,$BA,$AC
    db $B6,$BA,$E2,$B6,$BA,$0A,$B7,$BA,$CC,$B7,$BA,$06,$B8,$BA,$5C,$B8
    db $BA,$FE,$B8,$BA,$A4,$B9,$BA,$5A,$BA,$BA,$70,$BA,$BA,$96,$BA,$BA
    db $3A,$BB,$BA,$8C,$BB,$BA,$F6,$BB,$BA,$24,$BC,$BA,$FC,$BC,$BA,$FC
    db $BD,$BA,$9E,$BE,$BA,$10,$BF,$BA,$B2,$BF,$BA,$3C,$C0,$BA,$18,$C1
    db $BA,$80,$C1,$BA,$50,$C2,$BA,$00,$C3,$BA,$8A,$C3,$BA,$F4,$C4,$BA
    db $24,$C5,$BA,$DC,$C5,$BA,$F4,$C5,$BA,$62,$C6,$BA,$B4,$C6,$BA,$12
    db $C7,$BA,$34,$C9,$BA,$38,$C9,$BA,$3E,$C9,$BA,$46,$C9,$BA,$50,$C9
    db $BA,$5C,$C9,$BA,$6A,$C9,$BA,$7A,$C9,$BA,$8C,$C9,$BA,$A0,$C9,$BA
    db $B8,$C9,$BA,$CE,$C9,$BA,$22,$CA,$BA,$78,$CA,$BA,$DA,$CA,$BA,$2A
    db $CB,$BA,$78,$CB,$BA,$52,$CC,$BA,$3C,$CD,$BA,$74,$CD,$BA,$A4,$CD
    db $BA,$C8,$CD,$BA,$14,$CE,$BA,$60,$CE,$BA,$A6,$CE,$BA,$58,$CF,$BA
    db $E8,$CF,$BA,$74,$D0,$BA,$D0,$D0,$BA,$84,$D1,$BA,$30,$D2,$BA,$FA
    db $D2,$BA,$00,$D4,$BA,$AE,$D4,$BA,$9E,$D5,$BA,$A2,$D6,$BA,$92,$D7
    db $BA,$D6,$D7,$BA,$D8,$D8,$BA,$58,$D9,$BA,$48,$DA,$BA,$AC,$DA,$BA
    db $36,$DC,$BA,$0C,$DD,$BA,$CA,$DD,$BA,$7C,$DE,$BA,$02,$DF,$BA,$98
    db $DF,$BA,$2C,$E0,$BA,$7E,$E0,$BA,$26,$E1,$BA,$0C,$E2,$BA,$38,$E2
    db $BA,$2A,$E3,$BA,$B8,$E3,$BA,$24,$E4,$BA,$B2,$E4,$BA,$6C,$E5,$BA
    db $30,$E6,$BA,$B4,$E6,$BA,$54,$E7,$BA,$02,$E8,$BA,$90,$E8,$BA,$0E
    db $E9,$BA,$0A,$EA,$BA,$62,$EB,$BA,$B6,$EC,$BA,$14,$EE,$BA,$6A,$EE
    db $BA,$B8,$EE,$BA,$36,$EF,$BA,$98,$EF,$BA,$04,$F0,$BA,$88,$F0,$BA
    db $52,$F1,$BA,$A6,$F1,$BA,$06,$F2,$BA,$F6,$F2,$BA,$8A,$F3,$BA,$24
    db $F4,$BA,$D0,$F4,$BA,$86,$F5,$BA,$F4,$F5,$BA,$D0,$F6,$BA,$A4,$F7
    db $BA,$4E,$F8,$BA,$E4,$F8,$BA,$8A,$F9,$BA,$96,$FA,$BA,$82,$FB,$BA
    db $80,$FC,$BA,$EE,$FC,$BA,$5E,$FD,$BA,$CE,$FD,$BA,$BE,$FE,$BA,$4E
    db $FF,$BA,$00,$80,$BB,$94,$80,$BB,$74,$81,$BB,$50,$82,$BB,$00,$83
    db $BB,$0E,$84,$BB,$78,$84,$BB,$30,$85,$BB,$92,$85,$BB,$5A,$86,$BB
    db $C8,$86,$BB,$F8,$86,$BB,$BA,$87,$BB,$36,$88,$BB,$DE,$88,$BB,$6E
    db $89,$BB,$62,$8A,$BB,$B2,$8A,$BB,$4E,$8B,$BB,$88,$8B,$BB,$F4,$8B
    db $BB,$6E,$8C,$BB,$DA,$8C,$BB,$EA,$8C,$BB,$AA,$8D,$BB,$12,$8E,$BB
    db $72,$8E,$BB,$44,$8F,$BB,$E6,$8F,$BB,$76,$90,$BB,$02,$91,$BB,$5E
    db $91,$BB,$B6,$91,$BB,$62,$92,$BB,$C6,$92,$BB,$32,$93,$BB,$78,$93
    db $BB,$1A,$94,$BB,$54,$95,$BB,$DC,$95,$BB,$60,$96,$BB,$DE,$96,$BB
    db $42,$97,$BB,$EE,$97,$BB,$EC,$98,$BB,$5C,$99,$BB,$30,$9B,$BB,$A0
    db $9B,$BB,$52,$9C,$BB,$5E,$9D,$BB,$66,$9E,$BB,$F8,$9E,$BB,$B2,$9F
    db $BB,$7C,$A0,$BB,$D0,$A1,$BB,$54,$A2,$BB,$56,$A3,$BB,$6A,$A4,$BB
    db $A2,$A5,$BB,$92,$A6,$BB,$F2,$A7,$BB,$14,$A8,$BB,$7A,$A8,$BB,$94
    db $A8,$BB,$EA,$A8,$BB,$06,$A9,$BB,$76,$A9,$BB,$B0,$A9,$BB,$EA,$A9
    db $BB,$24,$AA,$BB,$5E,$AA,$BB,$98,$AA,$BB,$0A,$AB,$BB,$7C,$AB,$BB
    db $EE,$AB,$BB,$60,$AC,$BB,$74,$AC,$BB,$94,$AC,$BB,$CE,$AC,$BB,$08
    db $AD,$BB,$BC,$AD,$BB,$34,$B0,$BB,$68,$B2,$BB,$18,$B4,$BB,$A8,$B4
    db $BB,$A2,$B7,$BB,$DE,$B9,$BB,$CA,$BB,$BB,$36,$BE,$BB,$76,$C0,$BB
    db $24,$C1,$BB,$90,$C2,$BB,$1E,$C3,$BB,$38,$C5,$BB,$B2,$C6,$BB,$04
    db $C9,$BB,$EA,$CA,$BB,$C6,$CC,$BB,$10,$CD,$BB,$72,$CD,$BB,$DC,$CD
    db $BB,$1A,$CE,$BB,$FC,$CE,$BB,$72,$CF,$BB,$E8,$CF,$BB,$5E,$D0,$BB
    db $D4,$D0,$BB,$5C,$D1,$BB,$E4,$D1,$BB,$5A,$D2,$BB,$D0,$D2,$BB,$AC
    db $D3,$BB,$4C,$D4,$BB,$E2,$D4,$BB,$C2,$D5,$BB,$38,$D6,$BB,$4E,$D8
    db $BB,$38,$D9,$BB,$8A,$D9,$BB,$16,$DA,$BB,$A0,$DA,$BB,$1C,$DB,$BB
    db $3C,$DC,$BB,$9E,$DC,$BB,$EA,$DC,$BB,$76,$DD,$BB,$D2,$DD,$BB,$54
    db $DE,$BB,$96,$DE,$BB,$8A,$DF,$BB,$18,$E0,$BB,$88,$E0,$BB,$E4,$E0
    db $BB,$64,$E1,$BB,$F6,$E1,$BB,$30,$E2,$BB,$96,$E2,$BB,$14,$E3,$BB
    db $B0,$E3,$BB,$F6,$E3,$BB,$86,$E4,$BB,$26,$E5,$BB,$AC,$E5,$BB,$58
    db $E6,$BB,$B6,$E6,$BB,$58,$E7,$BB
    elseif !REGION_EU
    dl $8008BF
    db $12
    dl $8008D1
    db $04
    dl $8008B3
    db $0C
    dl $8008BF
    db $12
    dl $8008D1
    db $04
    dl $8008B3
    db $0C
    dl $8008BF
    db $12
    dl $8008D1
    db $04
    dl $8008B3
    db $0C
    dl $8008BF
    db $12
    dl $8008D1
    db $04
    dl $8008B3
    db $0C
    dl $8008BF
    db $12
    dl $8008D1
    db $04
    dl $8008B3
    db $0C
    dl $8008BF
    db $12
    dl $8008D1
    db $04
    dl $8008B3
    db $0C
    dl $8008BF
    db $12
    dl $8008D1
    db $04
    dl $8008B3
    db $0C
    dl $8008BF
    db $12
    dl $8008D1
    db $04
    dl $8008B3
    db $0C
    dl $8008BF
    db $12
    dl $8008D1
    db $04
    dl $8008B3
    db $0C
    dl $8008BF
    db $12
    dl $8008D1
    db $04
    dl $8008B3
    db $0C
    dl $8008BF
    db $12
    dl $8008D1
    db $04
    dl $8008B3
    db $0C
    dl $8008BF
    db $12
    dl $8008D1
    db $04
    dl $8008B3
    db $0C
    dl $8008BF
    db $12
    dl $8008D1
    db $04
    dl $8008B3
    db $0C
    dl $8008BF
    db $12
    dl $8008D1
    db $04
    dl $8008B3
    db $0C
    dl $8008BF
    db $12
    dl $8008D1
    db $04
    dl $8008B3
    db $0C
    dl $8008D5
    db $08
aDialogPointers:
    dl sDialogUS_0x0000
    dl $B680C6
    dl $B6815A
    dl $B6820C
    dl $B682AC
    dl $B68392
    dl $B6847C
    dl $B68524
    dl $B685B8
    dl $B686EE
    dl $B687E4
    dl $B68886
    dl $B688D2
    dl $B68954
    dl $B6896C
    dl $B68A2A
    dl $B68B38
    dl $B68C42
    dl $B68D48
    dl $B68E7A
    dl $B68FBA
    dl $B6902C
    dl $B69126
    dl $B691FC
    dl $B69364
    dl $B694FA
    dl $B69560
    dl $B695F4
    dl $B6969E
    dl $B69748
    dl $B697CE
    dl $B6981C
    dl $B6984C
    dl $B69874
    dl $B698AE
    dl $B6995C
    dl $B699CC
    dl $B69A4A
    dl $B69AC4
    dl $B69B2E
    dl $B69B8C
    dl $B69BF8
    dl $B69C56
    dl $B69CC4
    dl $B69D7C
    dl $B69DDC
    dl $B69DFA
    dl $B69E1E
    dl $B69E7E
    dl $B69EA2
    dl $B69F3A
    dl $B69F8E
    dl $B69FC8
    dl $B6A026
    dl $B6A0B6
    dl $B6A1B4
    dl $B6A218
    dl $B6A2AC
    dl $B6A350
    dl $B6A4E8
    dl $B6A5F8
    dl $B6A6A6
    dl $B6A73C
    dl $B6A7E0
    dl $B6A98E
    dl $B6AA0A
    dl $B6AAB4
    dl $B6AB22
    dl $B6ABE4
    dl $B6AD12
    dl $B6AE68
    dl $B6AF2E
    dl $B6AFAE
    dl $B6B010
    dl $B6B01A
    dl $B6B0B0
    dl $B6B1B2
    dl $B6B21E
    dl $B6B2A6
    dl $B6B37C
    dl $B6B444
    dl $B6B4E6
    dl $B6B530
    dl $B6B5A2
    dl $B6B624
    dl $B6B6FA
    dl $B6B7A0
    dl $B6B83A
    dl $B6B906
    dl $B6BA0C
    dl $B6BB1C
    dl $B6BBD4
    dl $B6BC7A
    dl $B6BDC0
    dl $B6BEF2
    dl $B6BFA0
    dl $B6C102
    dl $B6C1BC
    dl $B6C2A4
    dl $B6C33A
    dl $B6C438
    dl $B6C532
    dl $B6C5AA
    dl $B6C6A8
    dl $B6C702
    dl $B6C800
    dl $B6C84A
    dl $B6C914
    dl $B6C994
    dl $B6C9FE
    dl $B6CA78
    dl $B6CB04
    dl $B6CBAE
    dl $B6CBFA
    dl $B6CCE4
    dl $B6CDB4
    dl $B6CE3E
    dl $B6CF2E
    dl $B6CFCA
    dl $B6D060
    dl $B6D128
    dl $B6D24C
    dl $B6D32C
    dl $B6D422
    dl $B6D4CC
    dl $B6D56E
    dl $B6D5D8
    dl $B6D64C
    dl $B6D6B2
    dl $B6D73A
    dl $B6D75A
    dl $B6D794
    dl $B6D7F2
    dl $B6D83C
    dl $B6D872
    dl $B6D8E2
    dl $B6D976
    dl $B6DA10
    dl $B6DAA2
    dl $B6DB3A
    dl $B6DBC0
    dl $B6DBCE
    dl $B6DC74
    dl $B6DD0C
    dl $B6DD2C
    dl $B6DD7C
    dl $B6DDFC
    dl $B6DE6E
    dl $B6DF1E
    dl $B6DF82
    dl $B6E006
    dl $B6E064
    dl $B6E14E
    dl $B6E162
    dl $B6E19A
    dl $B6E21E
    dl $B6E2B0
    dl $B6E2DE
    dl $B6E39C
    dl $B6E462
    dl $B6E4A4
    dl $B6E54C
    dl $B6E5DC
    dl $B6E67A
    dl $B6E6C6
    dl $B6E6F6
    dl $B6E780
    dl $B6E7C4
    dl $B6E7FE
    dl $B6E850
    dl $B6E8BE
    dl $B6EA06
    dl $B6EB8A
    dl $B6EBCA
    dl $B6EC8C
    dl $B6ECF4
    dl $B6ED7E
    dl $B6EDB2
    dl $B6EDC0
    dl $B6EE62
    dl $B6EF44
    dl $B6EF70
    dl $B6F014
    dl $B6F0B0
    dl $B6F158
    dl $B6F1FC
    dl $B6F2B8
    dl $B6F31E
    dl $B6F3A0
    dl $B6F44E
    dl $B6F4A4
    dl $B6F4B8
    dl $B6F544
    dl $B6F5C2
    dl $B6F71A
    dl $B6F820
    dl $B6F84E
    dl $B6F89C
    dl $B6F8D6
    dl $B6F960
    dl $B6F9E2
    dl $B6FA80
    dl $B6FA96
    dl $B6FB1C
    dl $B6FBAE
    dl $B6FBE0
    dl $B6FC66
    dl $B6FD04
    dl $B6FE58
    dl $B6FF08
    dl sDialogUS_0x00D2
    dl sDialogUS_0x00D3
    dl sDialogUS_0x00D4
    dl sDialogUS_0x00D5
    dl sDialogUS_0x00D6
    dl sDialogUS_0x00D7
    dl sDialogUS_0x00D8
    dl sDialogUS_0x00D9
    dl sDialogUS_0x00DA
    dl sDialogUS_0x00DB
    dl sDialogUS_0x00DC
    dl sDialogUS_0x00DD
    dl sDialogUS_0x00DE
    dl sDialogUS_0x00DF
    dl sDialogUS_0x00E0
    dl sDialogUS_0x00E1
    dl sDialogUS_0x00E2
    dl sDialogUS_0x00E3
    dl sDialogUS_0x00E4
    dl sDialogUS_0x00E5
    dl sDialogUS_0x00E6
    dl sDialogUS_0x00E7
    dl sDialogUS_0x00E8
    dl sDialogUS_0x00E9
    dl $B78B42
    dl $B78B70
    dl $B78BA4
    dl $B78C26
    dl sDialogUS_0x00EE
    dl sDialogUS_0x00EF
    dl sDialogUS_0x00F0
    dl $B78FE6
    dl $B79080
    dl $B7912E
    dl $B792DC
    dl $B79468
    dl $B795DC
    dl $B79720
    dl $B79812
    dl $B79856
    dl $B79900
    dl $B79956
    dl $B79A8E
    dl $B79AA4
    dl $B79BE6
    dl $B79CA6
    dl $B79E02
    dl $B79EC2
    dl $B79F94
    dl $B7A072
    dl $B7A106
    dl $B7A1B0
    dl $B7A34A
    dl $B7A3B4
    dl $B7A4D6
    dl $B7A554
    dl $B7A5D4
    dl $B7A62A
    dl $B7A672
    dl $B7A852
    dl $B7A92E
    dl $B7AA4E
    dl $B7AB84
    dl $B7AC22
    dl $B7ADD0
    dl $B7AF1E
    dl $B7AFC6
    dl $B7B018
    dl $B7B0F8
    dl $B7B194
    dl $B7B226
    dl $B7B306
    dl $B7B34A
    dl $B7B3BC
    dl $B7B498
    dl $B7B4FA
    dl $B7B53E
    dl $B7B604
    dl $B7B62E
    dl $B7B686
    dl $B7B77E
    dl $B7B8A2
    dl $B7B936
    dl $B7B94E
    dl $B7BB3E
    dl $B7BBFC
    dl $B7BCB6
    dl $B7BD4E
    dl $B7BE56
    dl $B7BF5E
    dl $B7C0AC
    dl $B7C10A
    dl $B7C15A
    dl $B7C1DE
    dl $B7C276
    dl $B7C2FE
    dl $B7C34A
    dl $B7C3A0
    dl $B7C440
    dl $B7C530
    dl $B7C57C
    dl $B7C5C0
    dl $B7C7D4
    dl $B7C884
    dl $B7C8BE
    dl $B7C91E
    dl $B7CA0E
    dl $B7CA5A
    dl $B7CAE2
    dl $B7CB2C
    dl $B7CBD8
    dl $B7CCB4
    dl $B7CDAE
    dl $B7CE94
    dl $B7CEC2
    dl $B7CFA2
    dl $B7D04C
    dl $B7D0F4
    dl $B7D13E
    dl $B7D304
    dl $B7D4DE
    dl $B7D54A
    dl $B7D678
    dl $B7D736
    dl $B7D928
    dl $B7D9A6
    dl $B7DA4C
    dl $B7DAAA
    dl $B7DACA
    dl $B7DB48
    dl $B7DBCA
    dl $B7DC2E
    dl $B7DC9A
    dl $B7DD40
    dl $B7DDEA
    dl $B7DE72
    dl $B7DEFE
    dl $B7DFA0
    dl $B7E094
    dl $B7E0EA
    dl $B7E198
    dl $B7E232
    dl $B7E2D8
    dl $B7E31E
    dl $B7E3A4
    dl $B7E416
    dl $B7E44E
    dl $B7E47C
    dl $B7E4CC
    dl $B7E562
    dl $B7E616
    dl $B7E664
    dl $B7E6C4
    dl $B7E7C2
    dl $B7E818
    dl $B7E8DA
    dl $B7E9C6
    dl $B7EA5C
    dl $B7EAAA
    dl $B7EB06
    dl $B7EBC2
    dl $B7EC7C
    dl $B7EC98
    dl $B7ECE4
    dl $B7ED0E
    dl $B7ED32
    dl $B7ED46
    dl $B7ED80
    dl $B7EDA2
    dl $B7EE0C
    dl $B7EE44
    dl $B7EE7C
    dl $B7EEFC
    dl $B7EF24
    dl $B7EF4A
    dl $B7EF94
    dl $B7EFCC
    dl $B7F010
    dl $B7F070
    dl $B7F100
    dl $B7F17A
    dl $B7F234
    dl $B7F2F6
    dl $B7F382
    dl $B7F416
    dl $B7F4A4
    dl $B7F550
    dl $B7F644
    dl $B7F6AE
    dl $B7F78E
    dl $B7F7C0
    dl $B7F88E
    dl $B7F93C
    dl $B7F986
    dl $B7F9B8
    dl $B7F9FE
    dl $B7FA5E
    dl $B7FAA2
    dl $B7FB1E
    dl $B7FB6E
    dl $B7FBBE
    dl $B7FC14
    dl $B7FC66
    dl $B7FCC0
    dl $B7FCE6
    dl $B7FD48
    dl $B7FDEE
    dl $B7FE6C
    dl $B7FEB2
    dl $B7FF4E
    dl $B7FF94
    dl $B88000
    dl $B88058
    dl $B880A6
    dl $B880F0
    dl $B8815E
    dl $B88196
    dl $B88246
    dl $B88268
    dl $B882A0
    dl $B882BC
    dl $B88304
    dl $B8832E
    dl $B8834A
    dl $B8837A
    dl $B8840E
    dl $B88428
    dl $B88484
    dl $B88492
    dl $B884F0
    dl $B8856E
    dl $B885BA
    dl $B88606
    dl $B8863A
    dl $B88680
    dl $B886D2
    dl $B8875C
    dl $B8876E
    dl $B887C6
    dl $B887D4
    dl $B887E6
    dl $B887FC
    dl $B88996
    dl $B889B4
    dl $B88A44
    dl $B88A7C
    dl $B88AD0
    dl $B88AF8
    dl $B88B4C
    dl $B88BEC
    dl $B88C42
    dl $B88E2A
    dl $B88EB2
    dl $B88FB8
    dl $B89020
    dl $B890C4
    dl $B89166
    dl $B891C8
    dl $B89214
    dl $B89294
    dl $B89346
    dl $B8939C
    dl $B893DE
    dl $B894E0
    dl $B894F4
    dl $B89538
    dl $B896FE
    dl $B897F8
    dl $B898E8
    dl $B8991E
    dl $B899D4
    dl $B89ADE
    dl $B89B7C
    dl $B89C26
    dl $B89CDC
    dl $B89D32
    dl $B89DB6
    dl $B89E70
    dl $B89ED2
    dl $B89F16
    dl $B89FE0
    dl $B8A05E
    dl $B8A0E6
    dl $B8A134
    dl $B8A19E
    dl $B8A1AC
    dl $B8A26A
    dl $B8A2FA
    dl $B8A48C
    dl $B8A4D0
    dl $B8A51E
    dl $B8A54E
    dl $B8A5AE
    dl $B8A5DE
    dl $B8A63A
    dl $B8A6C0
    dl $B8A722
    dl $B8A76C
    dl $B8A838
    dl $B8A900
    dl $B8A96C
    dl $B8A9C6
    dl $B8AA9A
    dl $B8AAB0
    dl $B8ABF4
    dl $B8ADBE
    dl $B8AE6E
    dl $B8AECC
    dl $B8AF8A
    dl $B8B022
    dl $B8B0B4
    dl $B8B150
    dl $B8B1B6
    dl $B8B21C
    dl $B8B2A0
    dl $B8B362
    dl $B8B4CA
    dl $B8B64E
    dl $B8B7BC
    dl $B8B852
    dl $B8B8A6
    dl $B8B8FE
    dl $B8B95C
    dl $B8BB6A
    dl $B8BC02
    dl $B8BC9C
    dl $B8BCF8
    dl $B8BD50
    dl $B8BDB0
    dl $B8BE16
    dl $B8BE76
    dl $B8BED8
    dl $B8BFC2
    dl $B8C042
    dl $B8C0C4
    dl $B8C178
    dl $B8C202
    dl $B8C26E
    dl $B8C2A6
    dl $B8C2EA
    dl $B8C36C
    dl $B8C3EE
    dl $B8C47A
    dl $B8C500
    dl $B8C582
    dl $B8C654
    dl $B8C696
    dl $B8C6E2
    dl $B8C796
    dl $B8C81A
    dl $B8C87A
    dl $B8C8E8
    dl $B8C9D4
    dl $B8CA7C
    dl $B8CAE8
    dl $B8CC14
    dl $B8CC48
    dl $B8CC94
    dl $B8CE3A
    dl $B8CE86
    dl $B8CF58
    dl $B8CFCA
    dl $B8D062
    dl $B8D100
    dl $B8D1AC
    dl $B8D22E
    dl $B8D29E
    dl $B8D458
    dl $B8D4C2
    dl $B8D522
    dl $B8D556
    dl $B8D5BC
    dl $B8D60E
    dl $B8D756
    dl $B8D8A0
    dl $B8D91E
    dl $B8D938
    dl $B8DA9A
    dl $B8DC50
    dl $B8DCA4
    dl $B8DD0E
    dl $B8DDB0
    dl $B8DE68
    dl $B8DEA2
    dl $B8DEE6
    dl $B8DFC8
    dl $B8E04C
    dl $B8E0A6
    dl $B8E0F8
    dl $B8E182
    dl $B8E1BA
    dl $B8E1C6
    dl $B8E272
    dl $B8E2D0
    dl $B8E342
    dl $B8E40E
    dl $B8E4C2
    dl $B8E582
    dl $B8E59E
    dl $B8E5CE
    dl $B8E5FE
    dl $B8E71C
    dl $B8E79C
    dl $B8E83A
    dl $B8E8CC
    dl $B8E916
    dl $B8EA0E
    dl $B8EA5A
    dl $B8EA90
    dl $B8EBAA
    dl $B8EC64
    dl $B8EC78
    dl $B8ED10
    dl $B8EE10
    dl $B8EECC
    dl $B8EF12
    dl $B8EF5C
    dl $B8F16E
    dl $B8F2AA
    dl $B8F490
    dl $B8F54A
    dl $B8F592
    dl $B8F664
    dl $B8F6AA
    dl $B8F6F2
    dl $B8F75E
    dl $B8F8C0
    dl $B8F908
    dl $B8F9A6
    dl $B8FA52
    dl $B8FA74
    dl $B8FAC6
    dl $B8FB2A
    dl $B8FBA4
    dl $B8FBF8
    dl $B8FC56
    dl $B8FC80
    dl $B8FCA4
    dl $B8FD08
    dl $B8FD4E
    dl $B8FDF2
    dl $B8FE96
    dl $B8FF2A
    dl $B98000
    dl $B98104
    dl $B9829E
    dl $B98346
    dl $B98396
    dl $B9846E
    dl $B9854C
    dl $B98594
    dl $B985AA
    dl $B985D4
    dl $B986C6
    dl $B98748
    dl $B9877E
    dl $B987A2
    dl $B98808
    dl $B98858
    dl $B9889E
    dl $B9893C
    dl $B98998
    dl $B989E6
    dl $B989F4
    dl $B98A6E
    dl $B98AB2
    dl $B98B38
    dl $B98B86
    dl $B98BEE
    dl $B98C92
    dl $B98CD6
    dl $B98D1E
    dl $B98DE4
    dl $B98E2E
    dl $B98E56
    dl $B98F3E
    dl $B9903E
    dl $B990BC
    dl $B99112
    dl $B99176
    dl $B991D6
    dl $B99238
    dl $B9929A
    dl $B99330
    dl $B993FE
    dl $B994E6
    dl $B99552
    dl $B99636
    dl $B9967E
    dl $B9971C
    dl $B99796
    dl $B997DA
    dl $B99860
    dl $B99902
    dl $B99A88
    dl $B99B72
    dl $B99B9E
    dl $B99BB8
    dl $B99C0E
    dl $B99CB0
    dl $B99D0C
    dl $B99D3C
    dl $B99E0C
    dl $B99EC0
    dl $B99F14
    dl $B99FB8
    dl $B9A0B2
    dl $B9A140
    dl $B9A1F6
    dl $B9A260
    dl $B9A328
    dl $B9A37E
    dl $B9A3C4
    dl $B9A410
    dl $B9A49C
    dl $B9A554
    dl $B9A5F0
    dl $B9A67E
    dl $B9A6EE
    dl $B9A744
    dl $B9A792
    dl $B9A7DC
    dl $B9A860
    dl $B9A886
    dl $B9AA26
    dl $B9AA6A
    dl $B9AAC2
    dl $B9AB12
    dl $B9AB3A
    dl $B9AB94
    dl $B9ABCE
    dl $B9AC1C
    dl $B9AC7C
    dl $B9ACDE
    dl $B9AD62
    dl $B9AE0A
    dl $B9AE66
    dl $B9AEE8
    dl $B9AF88
    dl $B9B004
    dl $B9B064
    dl $B9B0B2
    dl $B9B110
    dl $B9B154
    dl $B9B16A
    dl $B9B1C2
    dl $B9B228
    dl $B9B2AE
    dl $B9B31A
    dl $B9B454
    dl $B9B4A8
    dl $B9B4D2
    dl $B9B526
    dl $B9B56C
    dl $B9B70A
    dl $B9B836
    dl $B9B88A
    dl $B9B8BA
    dl $B9B90E
    dl $B9BA7E
    dl $B9BC38
    dl $B9BC7C
    dl $B9BC86
    dl $B9BD30
    dl $B9BDFA
    dl $B9BE5A
    dl $B9BF46
    dl $B9BF80
    dl $B9BFFA
    dl $B9C0D4
    dl $B9C180
    dl $B9C26A
    dl $B9C316
    dl $B9C3F2
    dl $B9C426
    dl $B9C476
    dl $B9C576
    dl $B9C68C
    dl $B9C6D0
    dl $B9C846
    dl $B9C8B6
    dl $B9C9CE
    dl $B9CA22
    dl $B9CA76
    dl $B9CAB0
    dl $B9CB6C
    dl $B9CBB4
    dl $B9CC58
    dl $B9CCA0
    dl $B9CE1A
    dl $B9CEAC
    dl $B9D020
    dl $B9D0B4
    dl $B9D11C
    dl $B9D160
    dl $B9D226
    dl $B9D288
    dl $B9D2BC
    dl $B9D3BE
    dl $B9D456
    dl $B9D4D6
    dl $B9D4E8
    dl $B9D52A
    dl $B9D582
    dl $B9D6B2
    dl $B9D720
    dl $B9D788
    dl $B9D85E
    dl $B9D958
    dl $B9D986
    dl $B9DA76
    dl $B9DAF0
    dl $B9DBE8
    dl $B9DD28
    dl $B9DDE8
    dl $B9DE22
    dl $B9DF28
    dl $B9DFE8
    dl $B9E1B6
    dl $B9E346
    dl $B9E480
    dl $B9E616
    dl $B9E7E8
    dl $B9E952
    dl $B9EAD0
    dl $B9EC92
    dl $B9EE34
    dl $B9EF86
    dl $B9F0D2
    dl $B9F262
    dl $B9F3C8
    dl $B9F4F8
    dl $B9F568
    dl $B9F5C0
    dl $B9F628
    dl $B9F658
    dl $B9F688
    dl $B9F6F0
    dl $B9F762
    dl $B9F844
    dl $B9F926
    dl $B9FA08
    dl $B9FAFC
    dl $B9FC20
    dl $B9FD14
    dl $B9FE26
    dl $BA8000
    dl $BA80D6
    dl $BA822E
    dl $BA832E
    dl $BA8452
    dl $BA856A
    dl $BA86BA
    dl $BA87CC
    dl $BA87E0
    dl $BA897A
    dl $BA89CE
    dl $BA8A4E
    dl $BA8ABA
    dl $BA8B3C
    dl $BA8BCE
    dl $BA8C32
    dl $BA8CD0
    dl $BA8D66
    dl $BA8DFC
    dl $BA8E80
    dl $BA8EDA
    dl $BA8F36
    dl $BA8F7A
    dl $BA8FB2
    dl $BA8FCE
    dl $BA9000
    dl $BA9092
    dl $BA90FC
    dl $BA9208
    dl $BA9312
    dl $BA93AA
    dl $BA9426
    dl $BA946C
    dl $BA94A6
    dl $BA94D8
    dl $BA953C
    dl $BA9584
    dl $BA9616
    dl $BA964A
    dl $BA968E
    dl $BA96DE
    dl $BA9722
    dl $BA97AE
    dl $BA97DA
    dl $BA9844
    dl $BA98F8
    dl $BA9926
    dl $BA9950
    dl $BA99F4
    dl $BA9A18
    dl $BA9A50
    dl $BA9B0E
    dl $BA9BAA
    dl $BA9C4E
    dl $BA9C62
    dl $BA9C90
    dl $BA9D2C
    dl $BA9D64
    dl $BA9DB0
    dl $BA9DD8
    dl $BA9ED0
    dl $BA9FA4
    dl $BAA032
    dl $BAA0B6
    dl $BAA238
    dl $BAA2CC
    dl $BAA36E
    dl $BAA3CE
    dl $BAA476
    dl $BAA54C
    dl $BAA5F2
    dl $BAA768
    dl $BAA7BA
    dl $BAA85A
    dl $BAA86C
    dl $BAA912
    dl $BAA95E
    dl $BAA9A8
    dl $BAAC14
    dl $BAAC1A
    dl $BAAC22
    dl $BAAC2C
    dl $BAAC38
    dl $BAAC46
    dl $BAAC56
    dl $BAAC68
    dl $BAAC7C
    dl $BAAC92
    dl $BAACAA
    dl $BAACD2
    dl $BAAD42
    dl $BAAD90
    dl $BAADE4
    dl $BAAE36
    dl $BAAEBC
    dl $BAAF66
    dl $BAB008
    dl $BAB02A
    dl $BAB058
    dl $BAB074
    dl $BAB0C0
    dl $BAB0F8
    dl $BAB14C
    dl $BAB20C
    dl $BAB2AE
    dl $BAB330
    dl $BAB38C
    dl $BAB43C
    dl $BAB508
    dl $BAB5BA
    dl $BAB66C
    dl $BAB710
    dl $BAB7D0
    dl $BAB8EA
    dl $BAB9E2
    dl $BABA2C
    dl $BABB5A
    dl $BABC04
    dl $BABCD6
    dl $BABD28
    dl $BABE5C
    dl $BABF32
    dl $BAC006
    dl $BAC0E2
    dl $BAC172
    dl $BAC20A
    dl $BAC274
    dl $BAC2C4
    dl $BAC34A
    dl $BAC42A
    dl $BAC44A
    dl $BAC502
    dl $BAC586
    dl $BAC64C
    dl $BAC6DE
    dl $BAC782
    dl $BAC862
    dl $BAC8A6
    dl $BAC924
    dl $BAC9A8
    dl $BAC9EC
    dl $BACA46
    dl $BACB7C
    dl $BACC88
    dl $BACDA8
    dl $BACEA4
    dl $BACEFC
    dl $BACF50
    dl $BACFB0
    dl $BACFF6
    dl $BAD05E
    dl $BAD0AC
    dl $BAD146
    dl $BAD1DC
    dl $BAD23E
    dl $BAD2FE
    dl $BAD382
    dl $BAD3E0
    dl $BAD484
    dl $BAD508
    dl $BAD57A
    dl $BAD64C
    dl $BAD6EE
    dl $BAD78C
    dl $BAD7FC
    dl $BAD898
    dl $BAD95E
    dl $BADA1A
    dl $BADABE
    dl $BADB18
    dl $BADB84
    dl $BADBFE
    dl $BADC60
    dl $BADCB2
    dl $BADD1C
    dl $BADDA6
    dl $BADE40
    dl $BADF18
    dl $BADFAE
    dl $BAE072
    dl $BAE0C6
    dl $BAE18A
    dl $BAE1F0
    dl $BAE2AC
    dl $BAE312
    dl $BAE348
    dl $BAE422
    dl $BAE4A2
    dl $BAE4FE
    dl $BAE556
    dl $BAE628
    dl $BAE692
    dl $BAE732
    dl $BAE758
    dl $BAE7B2
    dl $BAE812
    dl $BAE870
    dl $BAE882
    dl $BAE922
    dl $BAE98C
    dl $BAE9D8
    dl $BAEA94
    dl $BAEAE2
    dl $BAEB84
    dl $BAEBE6
    dl $BAEC44
    dl $BAEC98
    dl $BAED4A
    dl $BAEDB6
    dl $BAEE4E
    dl $BAEE7C
    dl $BAEF2E
    dl $BAF06E
    dl $BAF0EA
    dl $BAF190
    dl $BAF1FA
    dl $BAF23E
    dl $BAF2D0
    dl $BAF38C
    dl $BAF3FC
    dl $BAF5B8
    dl $BAF626
    dl $BAF6DA
    dl $BAF7E2
    dl $BAF8D2
    dl $BAF966
    dl $BAFA52
    dl $BAFB0E
    dl $BAFC80
    dl $BAFCF0
    dl $BAFDE8
    dl $BB8000
    dl $BB8136
    dl $BB8282
    dl $BB841E
    dl $BB8446
    dl $BB849C
    dl $BB84B6
    dl $BB850A
    dl $BB8524
    dl $BB856E
    dl $BB8592
    dl $BB85B6
    dl $BB85DA
    dl $BB85FE
    dl $BB8622
    dl $BB8664
    dl $BB86A6
    dl $BB86E8
    dl $BB872A
    dl $BB8742
    dl $BB8766
    dl $BB87B6
    dl $BB87DE
    dl $BB888C
    dl $BB8A9A
    dl $BB8C74
    dl $BB8DB2
    dl $BB8E56
    dl $BB9102
    dl $BB92E4
    dl $BB943A
    dl $BB95F8
    dl $BB97A0
    dl $BB984A
    dl $BB996C
    dl $BB99F0
    dl $BB9BA0
    dl $BB9CA2
    dl $BB9DF6
    dl $BB9F9A
    dl $BBA122
    dl $BBA16C
    dl $BBA1D2
    dl $BBA254
    dl $BBA298
    dl $BBA376
    dl $BBA3F2
    dl $BBA46E
    dl $BBA4EA
    dl $BBA566
    dl $BBA5FC
    dl $BBA694
    dl $BBA710
    dl $BBA78C
    dl $BBA840
    dl $BBA8E8
    dl $BBA97C
    dl $BBAA64
    dl $BBAB4E
    dl $BBACE0
    dl $BBADA4
    dl $BBAE0E
    dl $BBAE94
    dl $BBAF06
    dl $BBAFAE
    dl $BBB0A8
    dl $BBB102
    dl $BBB136
    dl $BBB1D6
    dl $BBB240
    dl $BBB2AE
    dl $BBB2FA
    dl $BBB3E8
    dl $BBB484
    dl $BBB4D6
    dl $BBB544
    dl $BBB5D2
    dl $BBB676
    dl $BBB6AE
    dl $BBB71C
    dl $BBB79C
    dl $BBB842
    dl $BBB874
    dl $BBB8F8
    dl $BBB988
    dl $BBB9E6
    dl $BBBA88
    dl $BBBB00
    dl $BBBBA2
    elseif !REGION_JP
    db $B1,$08,$80,$02,$B3,$08,$80,$02,$B1,$08,$80,$02,$B3,$08,$80,$02
    db $B1,$08,$80,$02,$B3,$08,$80,$02,$B1,$08,$80,$02,$B3,$08,$80,$02
    db $B1,$08,$80,$02,$B3,$08,$80,$02,$B1,$08,$80,$02,$B3,$08,$80,$02
    db $B1,$08,$80,$02,$B3,$08,$80,$02,$B1,$08,$80,$02,$B3,$08,$80,$02
    db $B1,$08,$80,$02,$B3,$08,$80,$02,$B1,$08,$80,$02,$B3,$08,$80,$02
    db $B1,$08,$80,$02,$B3,$08,$80,$02,$B1,$08,$80,$02,$B3,$08,$80,$02
    db $B1,$08,$80,$02,$B3,$08,$80,$02,$B1,$08,$80,$02,$B3,$08,$80,$02
    db $B1,$08,$80,$02,$B3,$08,$80,$02,$B5,$08,$80,$08
aDialogPointers:
    db $00,$80,$AA,$4E,$80,$AA,$90,$80,$AA,$D8,$80,$AA,$28,$81,$AA,$74
    db $81,$AA,$C4,$81,$AA,$0E,$82,$AA,$60,$82,$AA,$E4,$82,$AA,$94,$83
    db $AA,$DC,$83,$AA,$F0,$83,$AA,$2A,$84,$AA,$34,$84,$AA,$8A,$84,$AA
    db $F6,$84,$AA,$70,$85,$AA,$0C,$86,$AA,$A6,$86,$AA,$24,$87,$AA,$6A
    db $87,$AA,$DE,$87,$AA,$30,$88,$AA,$C0,$88,$AA,$8C,$89,$AA,$BE,$89
    db $AA,$06,$8A,$AA,$5E,$8A,$AA,$B8,$8A,$AA,$EA,$8A,$AA,$14,$8B,$AA
    db $24,$8B,$AA,$40,$8B,$AA,$58,$8B,$AA,$A4,$8B,$AA,$E0,$8B,$AA,$1A
    db $8C,$AA,$50,$8C,$AA,$7E,$8C,$AA,$AE,$8C,$AA,$E0,$8C,$AA,$10,$8D
    db $AA,$3E,$8D,$AA,$70,$8D,$AA,$9E,$8D,$AA,$B4,$8D,$AA,$C8,$8D,$AA
    db $F4,$8D,$AA,$10,$8E,$AA,$44,$8E,$AA,$7A,$8E,$AA,$98,$8E,$AA,$BE
    db $8E,$AA,$00,$8F,$AA,$5C,$8F,$AA,$96,$8F,$AA,$D8,$8F,$AA,$12,$90
    db $AA,$B0,$90,$AA,$10,$91,$AA,$66,$91,$AA,$BA,$91,$AA,$FE,$91,$AA
    db $A6,$92,$AA,$E0,$92,$AA,$2A,$93,$AA,$5C,$93,$AA,$B2,$93,$AA,$24
    db $94,$AA,$C2,$94,$AA,$16,$95,$AA,$64,$95,$AA,$9A,$95,$AA,$A8,$95
    db $AA,$FA,$95,$AA,$74,$96,$AA,$A4,$96,$AA,$DE,$96,$AA,$54,$97,$AA
    db $AA,$97,$AA,$F4,$97,$AA,$26,$98,$AA,$56,$98,$AA,$8A,$98,$AA,$FA
    db $98,$AA,$46,$99,$AA,$9A,$99,$AA,$FE,$99,$AA,$82,$9A,$AA,$FA,$9A
    db $AA,$7E,$9B,$AA,$E4,$9B,$AA,$76,$9C,$AA,$F8,$9C,$AA,$3A,$9D,$AA
    db $DC,$9D,$AA,$4C,$9E,$AA,$B8,$9E,$AA,$0C,$9F,$AA,$90,$9F,$AA,$EE
    db $9F,$AA,$44,$A0,$AA,$BA,$A0,$AA,$E6,$A0,$AA,$56,$A1,$AA,$8E,$A1
    db $AA,$0A,$A2,$AA,$58,$A2,$AA,$9E,$A2,$AA,$EC,$A2,$AA,$2E,$A3,$AA
    db $78,$A3,$AA,$A2,$A3,$AA,$F8,$A3,$AA,$3C,$A4,$AA,$84,$A4,$AA,$DA
    db $A4,$AA,$10,$A5,$AA,$6C,$A5,$AA,$BC,$A5,$AA,$26,$A6,$AA,$AA,$A6
    db $AA,$10,$A7,$AA,$56,$A7,$AA,$8C,$A7,$AA,$C6,$A7,$AA,$08,$A8,$AA
    db $58,$A8,$AA,$9E,$A8,$AA,$B4,$A8,$AA,$E6,$A8,$AA,$02,$A9,$AA,$2A
    db $A9,$AA,$46,$A9,$AA,$8C,$A9,$AA,$D8,$A9,$AA,$1A,$AA,$AA,$44,$AA
    db $AA,$98,$AA,$AA,$DA,$AA,$AA,$E8,$AA,$AA,$14,$AB,$AA,$68,$AB,$AA
    db $7A,$AB,$AA,$B2,$AB,$AA,$F6,$AB,$AA,$2E,$AC,$AA,$86,$AC,$AA,$D6
    db $AC,$AA,$1E,$AD,$AA,$46,$AD,$AA,$A4,$AD,$AA,$BE,$AD,$AA,$D6,$AD
    db $AA,$1C,$AE,$AA,$72,$AE,$AA,$88,$AE,$AA,$D6,$AE,$AA,$1C,$AF,$AA
    db $3A,$AF,$AA,$7C,$AF,$AA,$B4,$AF,$AA,$12,$B0,$AA,$44,$B0,$AA,$5E
    db $B0,$AA,$90,$B0,$AA,$BA,$B0,$AA,$D4,$B0,$AA,$F2,$B0,$AA,$46,$B1
    db $AA,$D0,$B1,$AA,$74,$B2,$AA,$92,$B2,$AA,$DA,$B2,$AA,$06,$B3,$AA
    db $5A,$B3,$AA,$74,$B3,$AA,$7C,$B3,$AA,$D2,$B3,$AA,$20,$B4,$AA,$38
    db $B4,$AA,$8E,$B4,$AA,$DA,$B4,$AA,$10,$B5,$AA,$56,$B5,$AA,$A2,$B5
    db $AA,$E2,$B5,$AA,$0E,$B6,$AA,$6A,$B6,$AA,$9A,$B6,$AA,$AA,$B6,$AA
    db $F8,$B6,$AA,$32,$B7,$AA,$D4,$B7,$AA,$52,$B8,$AA,$64,$B8,$AA,$92
    db $B8,$AA,$AC,$B8,$AA,$02,$B9,$AA,$44,$B9,$AA,$7C,$B9,$AA,$8C,$B9
    db $AA,$B4,$B9,$AA,$F4,$B9,$AA,$10,$BA,$AA,$42,$BA,$AA,$8A,$BA,$AA
    db $1C,$BB,$AA,$70,$BB,$AA,$D4,$BB,$AA,$3E,$BC,$AA,$82,$BC,$AA,$A0
    db $BC,$AA,$EA,$BC,$AA,$18,$BD,$AA,$42,$BD,$AA,$6C,$BD,$AA,$CE,$BD
    db $AA,$10,$BE,$AA,$44,$BE,$AA,$96,$BE,$AA,$A0,$BE,$AA,$F4,$BE,$AA
    db $42,$BF,$AA,$6C,$BF,$AA,$9E,$BF,$AA,$04,$C0,$AA,$1C,$C0,$AA,$3A
    db $C0,$AA,$58,$C0,$AA,$AC,$C0,$AA,$E2,$C0,$AA,$30,$C1,$AA,$5C,$C1
    db $AA,$70,$C1,$AA,$96,$C1,$AA,$C4,$C1,$AA,$14,$C2,$AA,$62,$C2,$AA
    db $E0,$C2,$AA,$6A,$C3,$AA,$B8,$C3,$AA,$0A,$C4,$AA,$BE,$C4,$AA,$56
    db $C5,$AA,$F0,$C5,$AA,$72,$C6,$AA,$00,$C7,$AA,$1C,$C7,$AA,$7E,$C7
    db $AA,$CE,$C7,$AA,$34,$C8,$AA,$46,$C8,$AA,$F0,$C8,$AA,$58,$C9,$AA
    db $C8,$C9,$AA,$1E,$CA,$AA,$86,$CA,$AA,$DA,$CA,$AA,$0E,$CB,$AA,$60
    db $CB,$AA,$FA,$CB,$AA,$32,$CC,$AA,$AC,$CC,$AA,$DC,$CC,$AA,$2E,$CD
    db $AA,$5C,$CD,$AA,$84,$CD,$AA,$54,$CE,$AA,$CA,$CE,$AA,$58,$CF,$AA
    db $DA,$CF,$AA,$30,$D0,$AA,$E8,$D0,$AA,$86,$D1,$AA,$D0,$D1,$AA,$04
    db $D2,$AA,$8A,$D2,$AA,$DA,$D2,$AA,$18,$D3,$AA,$88,$D3,$AA,$CC,$D3
    db $AA,$FA,$D3,$AA,$68,$D4,$AA,$9A,$D4,$AA,$D4,$D4,$AA,$1C,$D5,$AA
    db $42,$D5,$AA,$8A,$D5,$AA,$0C,$D6,$AA,$AC,$D6,$AA,$F2,$D6,$AA,$08
    db $D7,$AA,$F4,$D7,$AA,$42,$D8,$AA,$94,$D8,$AA,$E6,$D8,$AA,$4A,$D9
    db $AA,$A0,$D9,$AA,$24,$DA,$AA,$58,$DA,$AA,$A4,$DA,$AA,$D0,$DA,$AA
    db $12,$DB,$AA,$52,$DB,$AA,$82,$DB,$AA,$B0,$DB,$AA,$FA,$DB,$AA,$78
    db $DC,$AA,$A4,$DC,$AA,$D8,$DC,$AA,$BC,$DD,$AA,$0E,$DE,$AA,$2C,$DE
    db $AA,$5E,$DE,$AA,$E0,$DE,$AA,$12,$DF,$AA,$4C,$DF,$AA,$7C,$DF,$AA
    db $D8,$DF,$AA,$48,$E0,$AA,$AC,$E0,$AA,$04,$E1,$AA,$2C,$E1,$AA,$74
    db $E1,$AA,$AE,$E1,$AA,$06,$E2,$AA,$40,$E2,$AA,$FE,$E2,$AA,$CA,$E3
    db $AA,$20,$E4,$AA,$A8,$E4,$AA,$FE,$E4,$AA,$E0,$E5,$AA,$18,$E6,$AA
    db $52,$E6,$AA,$76,$E6,$AA,$90,$E6,$AA,$C0,$E6,$AA,$FA,$E6,$AA,$16
    db $E7,$AA,$3E,$E7,$AA,$8C,$E7,$AA,$BC,$E7,$AA,$EC,$E7,$AA,$24,$E8
    db $AA,$70,$E8,$AA,$DA,$E8,$AA,$F4,$E8,$AA,$42,$E9,$AA,$76,$E9,$AA
    db $AE,$E9,$AA,$CA,$E9,$AA,$FC,$E9,$AA,$28,$EA,$AA,$40,$EA,$AA,$50
    db $EA,$AA,$88,$EA,$AA,$C2,$EA,$AA,$12,$EB,$AA,$3A,$EB,$AA,$58,$EB
    db $AA,$AC,$EB,$AA,$E2,$EB,$AA,$34,$EC,$AA,$80,$EC,$AA,$B2,$EC,$AA
    db $CC,$EC,$AA,$FE,$EC,$AA,$4E,$ED,$AA,$BC,$ED,$AA,$CA,$ED,$AA,$04
    db $EE,$AA,$20,$EE,$AA,$2E,$EE,$AA,$3E,$EE,$AA,$5C,$EE,$AA,$70,$EE
    db $AA,$8E,$EE,$AA,$A6,$EE,$AA,$C0,$EE,$AA,$F6,$EE,$AA,$14,$EF,$AA
    db $32,$EF,$AA,$4A,$EF,$AA,$60,$EF,$AA,$7E,$EF,$AA,$B0,$EF,$AA,$FC
    db $EF,$AA,$2E,$F0,$AA,$8A,$F0,$AA,$E0,$F0,$AA,$30,$F1,$AA,$82,$F1
    db $AA,$C6,$F1,$AA,$08,$F2,$AA,$5C,$F2,$AA,$8E,$F2,$AA,$EE,$F2,$AA
    db $18,$F3,$AA,$88,$F3,$AA,$CC,$F3,$AA,$E4,$F3,$AA,$02,$F4,$AA,$2E
    db $F4,$AA,$62,$F4,$AA,$7C,$F4,$AA,$AC,$F4,$AA,$DA,$F4,$AA,$14,$F5
    db $AA,$3E,$F5,$AA,$70,$F5,$AA,$A0,$F5,$AA,$BE,$F5,$AA,$F6,$F5,$AA
    db $52,$F6,$AA,$8A,$F6,$AA,$A6,$F6,$AA,$F6,$F6,$AA,$14,$F7,$AA,$42
    db $F7,$AA,$58,$F7,$AA,$72,$F7,$AA,$A0,$F7,$AA,$D6,$F7,$AA,$F0,$F7
    db $AA,$66,$F8,$AA,$78,$F8,$AA,$96,$F8,$AA,$A8,$F8,$AA,$BE,$F8,$AA
    db $D2,$F8,$AA,$EC,$F8,$AA,$0A,$F9,$AA,$3E,$F9,$AA,$56,$F9,$AA,$86
    db $F9,$AA,$94,$F9,$AA,$DE,$F9,$AA,$24,$FA,$AA,$4E,$FA,$AA,$7A,$FA
    db $AA,$96,$FA,$AA,$C8,$FA,$AA,$0A,$FB,$AA,$5C,$FB,$AA,$64,$FB,$AA
    db $A4,$FB,$AA,$AC,$FB,$AA,$B4,$FB,$AA,$BC,$FB,$AA,$6A,$FC,$AA,$82
    db $FC,$AA,$BC,$FC,$AA,$D2,$FC,$AA,$FA,$FC,$AA,$12,$FD,$AA,$38,$FD
    db $AA,$82,$FD,$AA,$B0,$FD,$AA,$5A,$FE,$AA,$AA,$FE,$AA,$2E,$FF,$AA
    db $7C,$FF,$AA,$00,$80,$AB,$52,$80,$AB,$8C,$80,$AB,$B8,$80,$AB,$E6
    db $80,$AB,$56,$81,$AB,$A6,$81,$AB,$C2,$81,$AB,$2C,$82,$AB,$3E,$82
    db $AB,$58,$82,$AB,$E6,$82,$AB,$6E,$83,$AB,$C2,$83,$AB,$DC,$83,$AB
    db $2C,$84,$AB,$92,$84,$AB,$F8,$84,$AB,$42,$85,$AB,$8E,$85,$AB,$C4
    db $85,$AB,$FE,$85,$AB,$4A,$86,$AB,$82,$86,$AB,$A0,$86,$AB,$D6,$86
    db $AB,$08,$87,$AB,$68,$87,$AB,$9E,$87,$AB,$F0,$87,$AB,$02,$88,$AB
    db $4E,$88,$AB,$94,$88,$AB,$54,$89,$AB,$72,$89,$AB,$A4,$89,$AB,$C0
    db $89,$AB,$12,$8A,$AB,$3A,$8A,$AB,$66,$8A,$AB,$96,$8A,$AB,$C6,$8A
    db $AB,$F0,$8A,$AB,$42,$8B,$AB,$B4,$8B,$AB,$EA,$8B,$AB,$08,$8C,$AB
    db $58,$8C,$AB,$66,$8C,$AB,$E0,$8C,$AB,$A6,$8D,$AB,$DE,$8D,$AB,$FA
    db $8D,$AB,$44,$8E,$AB,$78,$8E,$AB,$A8,$8E,$AB,$EC,$8E,$AB,$20,$8F
    db $AB,$4A,$8F,$AB,$80,$8F,$AB,$EE,$8F,$AB,$AC,$90,$AB,$62,$91,$AB
    db $38,$92,$AB,$7C,$92,$AB,$8E,$92,$AB,$C2,$92,$AB,$F2,$92,$AB,$D0
    db $93,$AB,$06,$94,$AB,$3C,$94,$AB,$86,$94,$AB,$AE,$94,$AB,$DE,$94
    db $AB,$10,$95,$AB,$3A,$95,$AB,$64,$95,$AB,$DC,$95,$AB,$04,$96,$AB
    db $36,$96,$AB,$84,$96,$AB,$D8,$96,$AB,$0E,$97,$AB,$2C,$97,$AB,$5E
    db $97,$AB,$92,$97,$AB,$C8,$97,$AB,$F2,$97,$AB,$26,$98,$AB,$7C,$98
    db $AB,$C4,$98,$AB,$E8,$98,$AB,$0E,$99,$AB,$5E,$99,$AB,$98,$99,$AB
    db $C2,$99,$AB,$F8,$99,$AB,$4E,$9A,$AB,$E4,$9A,$AB,$16,$9B,$AB,$9A
    db $9B,$AB,$C6,$9B,$AB,$F6,$9B,$AB,$92,$9C,$AB,$A4,$9C,$AB,$F2,$9C
    db $AB,$34,$9D,$AB,$76,$9D,$AB,$BC,$9D,$AB,$F2,$9D,$AB,$3A,$9E,$AB
    db $C8,$9E,$AB,$98,$9F,$AB,$E2,$9F,$AB,$2C,$A0,$AB,$5A,$A0,$AB,$96
    db $A0,$AB,$D0,$A0,$AB,$5E,$A1,$AB,$06,$A2,$AB,$48,$A2,$AB,$60,$A2
    db $AB,$02,$A3,$AB,$C0,$A3,$AB,$F6,$A3,$AB,$36,$A4,$AB,$8C,$A4,$AB
    db $D6,$A4,$AB,$0A,$A5,$AB,$26,$A5,$AB,$86,$A5,$AB,$D0,$A5,$AB,$F4
    db $A5,$AB,$1E,$A6,$AB,$80,$A6,$AB,$B2,$A6,$AB,$C0,$A6,$AB,$22,$A7
    db $AB,$40,$A7,$AB,$6A,$A7,$AB,$C8,$A7,$AB,$12,$A8,$AB,$8E,$A8,$AB
    db $9E,$A8,$AB,$BC,$A8,$AB,$CC,$A8,$AB,$54,$A9,$AB,$86,$A9,$AB,$D6
    db $A9,$AB,$10,$AA,$AB,$26,$AA,$AB,$94,$AA,$AB,$C2,$AA,$AB,$D4,$AA
    db $AB,$58,$AB,$AB,$D0,$AB,$AB,$E2,$AB,$AB,$56,$AC,$AB,$AC,$AC,$AB
    db $0E,$AD,$AB,$2A,$AD,$AB,$44,$AD,$AB,$14,$AE,$AB,$A0,$AE,$AB,$6E
    db $AF,$AB,$CE,$AF,$AB,$EA,$AF,$AB,$48,$B0,$AB,$66,$B0,$AB,$90,$B0
    db $AB,$CA,$B0,$AB,$76,$B1,$AB,$A4,$B1,$AB,$DA,$B1,$AB,$20,$B2,$AB
    db $2E,$B2,$AB,$54,$B2,$AB,$86,$B2,$AB,$E6,$B2,$AB,$1E,$B3,$AB,$50
    db $B3,$AB,$62,$B3,$AB,$76,$B3,$AB,$A6,$B3,$AB,$D0,$B3,$AB,$1A,$B4
    db $AB,$6A,$B4,$AB,$C4,$B4,$AB,$0A,$B5,$AB,$6C,$B5,$AB,$18,$B6,$AB
    db $A6,$B6,$AB,$C4,$B6,$AB,$32,$B7,$AB,$76,$B7,$AB,$94,$B7,$AB,$A2
    db $B7,$AB,$B0,$B7,$AB,$20,$B8,$AB,$62,$B8,$AB,$98,$B8,$AB,$AE,$B8
    db $AB,$E8,$B8,$AB,$1A,$B9,$AB,$4A,$B9,$AB,$9C,$B9,$AB,$DE,$B9,$AB
    db $FA,$B9,$AB,$08,$BA,$AB,$52,$BA,$AB,$6A,$BA,$AB,$CC,$BA,$AB,$02
    db $BB,$AB,$34,$BB,$AB,$76,$BB,$AB,$A4,$BB,$AB,$C0,$BB,$AB,$06,$BC
    db $AB,$3C,$BC,$AB,$4C,$BC,$AB,$A2,$BC,$AB,$06,$BD,$AB,$52,$BD,$AB
    db $70,$BD,$AB,$A4,$BD,$AB,$D2,$BD,$AB,$04,$BE,$AB,$2E,$BE,$AB,$64
    db $BE,$AB,$AE,$BE,$AB,$20,$BF,$AB,$58,$BF,$AB,$92,$BF,$AB,$C6,$BF
    db $AB,$08,$C0,$AB,$38,$C0,$AB,$6A,$C0,$AB,$9E,$C0,$AB,$02,$C1,$AB
    db $B2,$C1,$AB,$20,$C2,$AB,$4A,$C2,$AB,$54,$C2,$AB,$78,$C2,$AB,$CC
    db $C2,$AB,$00,$C3,$AB,$16,$C3,$AB,$5C,$C3,$AB,$CC,$C3,$AB,$00,$C4
    db $AB,$3E,$C4,$AB,$84,$C4,$AB,$C8,$C4,$AB,$04,$C5,$AB,$5A,$C5,$AB
    db $A2,$C5,$AB,$DA,$C5,$AB,$F8,$C5,$AB,$2C,$C6,$AB,$8C,$C6,$AB,$E6
    db $C6,$AB,$1E,$C7,$AB,$54,$C7,$AB,$8E,$C7,$AB,$C8,$C7,$AB,$00,$C8
    db $AB,$36,$C8,$AB,$6C,$C8,$AB,$7E,$C8,$AB,$44,$C9,$AB,$72,$C9,$AB
    db $98,$C9,$AB,$B6,$C9,$AB,$C4,$C9,$AB,$F2,$C9,$AB,$1C,$CA,$AB,$54
    db $CA,$AB,$7C,$CA,$AB,$A6,$CA,$AB,$D2,$CA,$AB,$24,$CB,$AB,$50,$CB
    db $AB,$7A,$CB,$AB,$B4,$CB,$AB,$EC,$CB,$AB,$24,$CC,$AB,$52,$CC,$AB
    db $84,$CC,$AB,$A2,$CC,$AB,$AE,$CC,$AB,$D6,$CC,$AB,$02,$CD,$AB,$2E
    db $CD,$AB,$62,$CD,$AB,$02,$CE,$AB,$3C,$CE,$AB,$52,$CE,$AB,$88,$CE
    db $AB,$A6,$CE,$AB,$40,$CF,$AB,$C8,$CF,$AB,$0E,$D0,$AB,$2A,$D0,$AB
    db $60,$D0,$AB,$1C,$D1,$AB,$F8,$D1,$AB,$16,$D2,$AB,$22,$D2,$AB,$74
    db $D2,$AB,$DA,$D2,$AB,$02,$D3,$AB,$72,$D3,$AB,$8C,$D3,$AB,$BC,$D3
    db $AB,$38,$D4,$AB,$7E,$D4,$AB,$EA,$D4,$AB,$3C,$D5,$AB,$BE,$D5,$AB
    db $D8,$D5,$AB,$0C,$D6,$AB,$8C,$D6,$AB,$2C,$D7,$AB,$58,$D7,$AB,$2A
    db $D8,$AB,$74,$D8,$AB,$EE,$D8,$AB,$28,$D9,$AB,$62,$D9,$AB,$9C,$D9
    db $AB,$F0,$D9,$AB,$22,$DA,$AB,$6E,$DA,$AB,$A2,$DA,$AB,$6A,$DB,$AB
    db $E8,$DB,$AB,$B6,$DC,$AB,$0A,$DD,$AB,$3E,$DD,$AB,$6E,$DD,$AB,$C4
    db $DD,$AB,$FC,$DD,$AB,$14,$DE,$AB,$90,$DE,$AB,$EC,$DE,$AB,$2E,$DF
    db $AB,$3C,$DF,$AB,$5A,$DF,$AB,$92,$DF,$AB,$22,$E0,$AB,$62,$E0,$AB
    db $98,$E0,$AB,$00,$E1,$AB,$9A,$E1,$AB,$CA,$E1,$AB,$4E,$E2,$AB,$A8
    db $E2,$AB,$FE,$E2,$AB,$76,$E3,$AB,$C0,$E3,$AB,$D4,$E3,$AB,$46,$E4
    db $AB,$A8,$E4,$AB,$68,$E5,$AB,$0C,$E6,$AB,$AE,$E6,$AB,$50,$E7,$AB
    db $2A,$E8,$AB,$CE,$E8,$AB,$74,$E9,$AB,$48,$EA,$AB,$2C,$EB,$AB,$EA
    db $EB,$AB,$A8,$EC,$AB,$76,$ED,$AB,$38,$EE,$AB,$E2,$EE,$AB,$18,$EF
    db $AB,$34,$EF,$AB,$6E,$EF,$AB,$86,$EF,$AB,$9E,$EF,$AB,$D4,$EF,$AB
    db $0A,$F0,$AB,$86,$F0,$AB,$04,$F1,$AB,$82,$F1,$AB,$0E,$F2,$AB,$98
    db $F2,$AB,$22,$F3,$AB,$AC,$F3,$AB,$24,$F4,$AB,$A8,$F4,$AB,$34,$F5
    db $AB,$C0,$F5,$AB,$60,$F6,$AB,$E4,$F6,$AB,$8A,$F7,$AB,$14,$F8,$AB
    db $20,$F8,$AB,$F8,$F8,$AB,$14,$F9,$AB,$3C,$F9,$AB,$74,$F9,$AB,$A8
    db $F9,$AB,$EA,$F9,$AB,$20,$FA,$AB,$66,$FA,$AB,$A2,$FA,$AB,$E8,$FA
    db $AB,$2C,$FB,$AB,$60,$FB,$AB,$96,$FB,$AB,$B0,$FB,$AB,$C4,$FB,$AB
    db $CE,$FB,$AB,$E6,$FB,$AB,$3A,$FC,$AB,$54,$FC,$AB,$A6,$FC,$AB,$F4
    db $FC,$AB,$2C,$FD,$AB,$58,$FD,$AB,$82,$FD,$AB,$A0,$FD,$AB,$B0,$FD
    db $AB,$DC,$FD,$AB,$F4,$FD,$AB,$2C,$FE,$AB,$3E,$FE,$AB,$5C,$FE,$AB
    db $82,$FE,$AB,$A0,$FE,$AB,$EC,$FE,$AB,$06,$FF,$AB,$38,$FF,$AB,$66
    db $FF,$AB,$7E,$FF,$AB,$98,$FF,$AB,$00,$80,$AC,$18,$80,$AC,$2A,$80
    db $AC,$82,$80,$AC,$B2,$80,$AC,$08,$81,$AC,$18,$81,$AC,$4A,$81,$AC
    db $76,$81,$AC,$A4,$81,$AC,$D8,$81,$AC,$F0,$81,$AC,$46,$82,$AC,$9C
    db $82,$AC,$D0,$82,$AC,$04,$83,$AC,$84,$83,$AC,$D6,$83,$AC,$1E,$84
    db $AC,$56,$84,$AC,$9E,$84,$AC,$EE,$84,$AC,$3A,$85,$AC,$B0,$85,$AC
    db $CE,$85,$AC,$06,$86,$AC,$16,$86,$AC,$6C,$86,$AC,$A4,$86,$AC,$D8
    db $86,$AC,$9C,$87,$AC,$A2,$87,$AC,$AA,$87,$AC,$B4,$87,$AC,$C0,$87
    db $AC,$CE,$87,$AC,$DE,$87,$AC,$F0,$87,$AC,$04,$88,$AC,$1A,$88,$AC
    db $32,$88,$AC,$4E,$88,$AC,$72,$88,$AC,$8E,$88,$AC,$BE,$88,$AC,$CC
    db $88,$AC,$00,$89,$AC,$4E,$89,$AC,$9E,$89,$AC,$AC,$89,$AC,$B8,$89
    db $AC,$C8,$89,$AC,$F0,$89,$AC,$06,$8A,$AC,$2C,$8A,$AC,$A2,$8A,$AC
    db $F6,$8A,$AC,$36,$8B,$AC,$82,$8B,$AC,$D4,$8B,$AC,$3E,$8C,$AC,$94
    db $8C,$AC,$E0,$8C,$AC,$2A,$8D,$AC,$86,$8D,$AC,$EC,$8D,$AC,$40,$8E
    db $AC,$72,$8E,$AC,$C4,$8E,$AC,$14,$8F,$AC,$72,$8F,$AC,$8A,$8F,$AC
    db $1E,$90,$AC,$90,$90,$AC,$D2,$90,$AC,$36,$91,$AC,$86,$91,$AC,$BE
    db $91,$AC,$E8,$91,$AC,$0E,$92,$AC,$36,$92,$AC,$88,$92,$AC,$A0,$92
    db $AC,$F2,$92,$AC,$1E,$93,$AC,$88,$93,$AC,$C2,$93,$AC,$02,$94,$AC
    db $50,$94,$AC,$8A,$94,$AC,$BE,$94,$AC,$0A,$95,$AC,$4C,$95,$AC,$86
    db $95,$AC,$12,$96,$AC,$B2,$96,$AC,$52,$97,$AC,$D4,$97,$AC,$08,$98
    db $AC,$3A,$98,$AC,$70,$98,$AC,$8C,$98,$AC,$B4,$98,$AC,$DA,$98,$AC
    db $1C,$99,$AC,$7E,$99,$AC,$98,$99,$AC,$CC,$99,$AC,$FE,$99,$AC,$26
    db $9A,$AC,$5E,$9A,$AC,$AC,$9A,$AC,$E2,$9A,$AC,$3A,$9B,$AC,$88,$9B
    db $AC,$DC,$9B,$AC,$2A,$9C,$AC,$70,$9C,$AC,$B2,$9C,$AC,$F6,$9C,$AC
    db $2E,$9D,$AC,$5E,$9D,$AC,$94,$9D,$AC,$C6,$9D,$AC,$F6,$9D,$AC,$14
    db $9E,$AC,$42,$9E,$AC,$68,$9E,$AC,$B0,$9E,$AC,$F2,$9E,$AC,$28,$9F
    db $AC,$80,$9F,$AC,$B2,$9F,$AC,$06,$A0,$AC,$34,$A0,$AC,$9C,$A0,$AC
    db $DC,$A0,$AC,$F8,$A0,$AC,$7E,$A1,$AC,$B4,$A1,$AC,$FC,$A1,$AC,$22
    db $A2,$AC,$84,$A2,$AC,$B2,$A2,$AC,$F4,$A2,$AC,$10,$A3,$AC,$36,$A3
    db $AC,$7E,$A3,$AC,$B6,$A3,$AC,$C8,$A3,$AC,$0E,$A4,$AC,$42,$A4,$AC
    db $6E,$A4,$AC,$BE,$A4,$AC,$E0,$A4,$AC,$2E,$A5,$AC,$62,$A5,$AC,$8E
    db $A5,$AC,$C6,$A5,$AC,$0A,$A6,$AC,$52,$A6,$AC,$92,$A6,$AC,$BA,$A6
    db $AC,$EE,$A6,$AC,$64,$A7,$AC,$9E,$A7,$AC,$D4,$A7,$AC,$08,$A8,$AC
    db $22,$A8,$AC,$62,$A8,$AC,$B0,$A8,$AC,$E4,$A8,$AC,$9A,$A9,$AC,$DC
    db $A9,$AC,$2C,$AA,$AC,$AC,$AA,$AC,$18,$AB,$AC,$86,$AB,$AC,$0C,$AC
    db $AC,$5A,$AC,$AC,$F8,$AC,$AC,$3E,$AD,$AC,$9E,$AD,$AC,$14,$AE,$AC
    db $8E,$AE,$AC,$24,$AF,$AC,$BA,$AF,$AC,$D0,$AF,$AC,$1A,$B0,$AC,$52
    db $B0,$AC,$90,$B0,$AC,$C8,$B0,$AC,$02,$B1,$AC,$3C,$B1,$AC,$76,$B1
    db $AC,$B0,$B1,$AC,$EA,$B1,$AC,$24,$B2,$AC,$5E,$B2,$AC,$98,$B2,$AC
    db $D2,$B2,$AC,$0C,$B3,$AC,$3A,$B3,$AC,$6C,$B3,$AC,$A4,$B3,$AC,$DE
    db $B3,$AC,$38,$B4,$AC,$34,$B5,$AC,$FA,$B5,$AC,$9A,$B6,$AC,$EA,$B6
    db $AC,$DC,$B7,$AC,$B2,$B8,$AC,$74,$B9,$AC,$1E,$BA,$AC,$BE,$BA,$AC
    db $16,$BB,$AC,$AC,$BB,$AC,$E2,$BB,$AC,$7E,$BC,$AC,$1E,$BD,$AC,$A8
    db $BD,$AC,$44,$BE,$AC,$E0,$BE,$AC,$14,$BF,$AC,$4E,$BF,$AC,$A2,$BF
    db $AC,$E0,$BF,$AC,$3C,$C0,$AC,$98,$C0,$AC,$F4,$C0,$AC,$50,$C1,$AC
    db $AC,$C1,$AC,$08,$C2,$AC,$64,$C2,$AC,$C0,$C2,$AC,$1C,$C3,$AC,$78
    db $C3,$AC,$D4,$C3,$AC,$30,$C4,$AC,$8C,$C4,$AC,$E8,$C4,$AC,$BE,$C5
    db $AC,$14,$C6,$AC,$66,$C6,$AC,$90,$C6,$AC,$BE,$C6,$AC,$E6,$C6,$AC
    db $66,$C7,$AC,$92,$C7,$AC,$BC,$C7,$AC,$04,$C8,$AC,$3C,$C8,$AC,$6C
    db $C8,$AC,$8A,$C8,$AC,$F0,$C8,$AC,$40,$C9,$AC,$78,$C9,$AC,$B4,$C9
    db $AC,$06,$CA,$AC,$5E,$CA,$AC,$9A,$CA,$AC,$CA,$CA,$AC,$10,$CB,$AC
    db $60,$CB,$AC,$74,$CB,$AC,$E0,$CB,$AC,$18,$CC,$AC,$4C,$CC,$AC,$9A
    db $CC,$AC,$EA,$CC,$AC,$34,$CD,$AC
    else
    dl $8008BF                                                 ;839B3E|        |8008BF;
    db $12                                                     ;839B41|        |      ;
    dl $8008D1                                                 ;839B42|        |8008D1;
    db $04                                                     ;839B45|        |      ;
    dl $8008B3                                                 ;839B46|        |8008B3;
    db $0C                                                     ;839B49|        |      ;
    dl $8008BF                                                 ;839B4A|        |8008BF;
    db $12                                                     ;839B4D|        |      ;
    dl $8008D1                                                 ;839B4E|        |8008D1;
    db $04                                                     ;839B51|        |      ;
    dl $8008B3                                                 ;839B52|        |8008B3;
    db $0C                                                     ;839B55|        |      ;
    dl $8008BF                                                 ;839B56|        |8008BF;
    db $12                                                     ;839B59|        |      ;
    dl $8008D1                                                 ;839B5A|        |8008D1;
    db $04                                                     ;839B5D|        |      ;
    dl $8008B3                                                 ;839B5E|        |8008B3;
    db $0C                                                     ;839B61|        |      ;
    dl $8008BF                                                 ;839B62|        |8008BF;
    db $12                                                     ;839B65|        |      ;
    dl $8008D1                                                 ;839B66|        |8008D1;
    db $04                                                     ;839B69|        |      ;
    dl $8008B3                                                 ;839B6A|        |8008B3;
    db $0C                                                     ;839B6D|        |      ;
    dl $8008BF                                                 ;839B6E|        |8008BF;
    db $12                                                     ;839B71|        |      ;
    dl $8008D1                                                 ;839B72|        |8008D1;
    db $04                                                     ;839B75|        |      ;
    dl $8008B3                                                 ;839B76|        |8008B3;
    db $0C                                                     ;839B79|        |      ;
    dl $8008BF                                                 ;839B7A|        |8008BF;
    db $12                                                     ;839B7D|        |      ;
    dl $8008D1                                                 ;839B7E|        |8008D1;
    db $04                                                     ;839B81|        |      ;
    dl $8008B3                                                 ;839B82|        |8008B3;
    db $0C                                                     ;839B85|        |      ;
    dl $8008BF                                                 ;839B86|        |8008BF;
    db $12                                                     ;839B89|        |      ;
    dl $8008D1                                                 ;839B8A|        |8008D1;
    db $04                                                     ;839B8D|        |      ;
    dl $8008B3                                                 ;839B8E|        |8008B3;
    db $0C                                                     ;839B91|        |      ;
    dl $8008BF                                                 ;839B92|        |8008BF;
    db $12                                                     ;839B95|        |      ;
    dl $8008D1                                                 ;839B96|        |8008D1;
    db $04                                                     ;839B99|        |      ;
    dl $8008B3                                                 ;839B9A|        |8008B3;
    db $0C                                                     ;839B9D|        |      ;
    dl $8008BF                                                 ;839B9E|        |8008BF;
    db $12                                                     ;839BA1|        |      ;
    dl $8008D1                                                 ;839BA2|        |8008D1;
    db $04                                                     ;839BA5|        |      ;
    dl $8008B3                                                 ;839BA6|        |8008B3;
    db $0C                                                     ;839BA9|        |      ;
    dl $8008BF                                                 ;839BAA|        |8008BF;
    db $12                                                     ;839BAD|        |      ;
    dl $8008D1                                                 ;839BAE|        |8008D1;
    db $04                                                     ;839BB1|        |      ;
    dl $8008B3                                                 ;839BB2|        |8008B3;
    db $0C                                                     ;839BB5|        |      ;
    dl $8008BF                                                 ;839BB6|        |8008BF;
    db $12                                                     ;839BB9|        |      ;
    dl $8008D1                                                 ;839BBA|        |8008D1;
    db $04                                                     ;839BBD|        |      ;
    dl $8008B3                                                 ;839BBE|        |8008B3;
    db $0C                                                     ;839BC1|        |      ;
    dl $8008BF                                                 ;839BC2|        |8008BF;
    db $12                                                     ;839BC5|        |      ;
    dl $8008D1                                                 ;839BC6|        |8008D1;
    db $04                                                     ;839BC9|        |      ;
    dl $8008B3                                                 ;839BCA|        |8008B3;
    db $0C                                                     ;839BCD|        |      ;
    dl $8008BF                                                 ;839BCE|        |8008BF;
    db $12                                                     ;839BD1|        |      ;
    dl $8008D1                                                 ;839BD2|        |8008D1;
    db $04                                                     ;839BD5|        |      ;
    dl $8008B3                                                 ;839BD6|        |8008B3;
    db $0C                                                     ;839BD9|        |      ;
    dl $8008BF                                                 ;839BDA|        |8008BF;
    db $12                                                     ;839BDD|        |      ;
    dl $8008D1                                                 ;839BDE|        |8008D1;
    db $04                                                     ;839BE1|        |      ;
    dl $8008B3                                                 ;839BE2|        |8008B3;
    db $0C                                                     ;839BE5|        |      ;
    dl $8008BF                                                 ;839BE6|        |8008BF;
    db $12                                                     ;839BE9|        |      ;
    dl $8008D1                                                 ;839BEA|        |8008D1;
    db $04                                                     ;839BED|        |      ;
    dl $8008B3                                                 ;839BEE|        |8008B3;
    db $0C                                                     ;839BF1|        |      ;
    dl $8008D5                                                 ;839BF2|        |8008D5;
    db $08                                                     ;839BF5|        |      ;
aDialogPointers:
    dl sDialogUS_0x0000                                        ;839BF6|        |B68000; 0x0498 * [ptr24]
    dl sDialogUS_0x0001                                        ;839BF9|        |B680D8;
    dl sDialogUS_0x0002                                        ;839BFC|        |B6816C;
    dl sDialogUS_0x0003                                        ;839BFF|        |B6821E;
    dl sDialogUS_0x0004                                        ;839C02|        |B682BE;
    dl sDialogUS_0x0005                                        ;839C05|        |B683B0;
    dl sDialogUS_0x0006                                        ;839C08|        |B6849A;
    dl sDialogUS_0x0007                                        ;839C0B|        |B68542;
    dl sDialogUS_0x0008                                        ;839C0E|        |B685D6;
    dl sDialogUS_0x0009                                        ;839C11|        |B6870C;
    dl sDialogUS_0x000A                                        ;839C14|        |B68802;
    dl sDialogUS_0x000B                                        ;839C17|        |B688A4;
    dl sDialogUS_0x000C                                        ;839C1A|        |B688F0;
    dl sDialogUS_0x000D                                        ;839C1D|        |B68972;
    dl sDialogUS_0x000E                                        ;839C20|        |B6898A;
    dl sDialogUS_0x000F                                        ;839C23|        |B68A46;
    dl sDialogUS_0x0010                                        ;839C26|        |B68B5E;
    dl sDialogUS_0x0011                                        ;839C29|        |B68C68;
    dl sDialogUS_0x0012                                        ;839C2C|        |B68D6E;
    dl sDialogUS_0x0013                                        ;839C2F|        |B68EC6;
    dl sDialogUS_0x0014                                        ;839C32|        |B69006;
    dl sDialogUS_0x0015                                        ;839C35|        |B69078;
    dl sDialogUS_0x0016                                        ;839C38|        |B69172;
    dl sDialogUS_0x0017                                        ;839C3B|        |B69248;
    dl sDialogUS_0x0018                                        ;839C3E|        |B693A8;
    dl sDialogUS_0x0019                                        ;839C41|        |B6953E;
    dl sDialogUS_0x001A                                        ;839C44|        |B695A4;
    dl sDialogUS_0x001B                                        ;839C47|        |B69638;
    dl sDialogUS_0x001C                                        ;839C4A|        |B696E2;
    dl sDialogUS_0x001D                                        ;839C4D|        |B6978C;
    dl sDialogUS_0x001E                                        ;839C50|        |B69812;
    dl sDialogUS_0x001F                                        ;839C53|        |B69860;
    dl sDialogUS_0x0020                                        ;839C56|        |B69878;
    dl sDialogUS_0x0021                                        ;839C59|        |B698A0;
    dl sDialogUS_0x0022                                        ;839C5C|        |B698DA;
    dl sDialogUS_0x0023                                        ;839C5F|        |B69982;
    dl sDialogUS_0x0024                                        ;839C62|        |B699F2;
    dl sDialogUS_0x0025                                        ;839C65|        |B69A70;
    dl sDialogUS_0x0026                                        ;839C68|        |B69ADC;
    dl sDialogUS_0x0027                                        ;839C6B|        |B69B46;
    dl sDialogUS_0x0028                                        ;839C6E|        |B69BA4;
    dl sDialogUS_0x0029                                        ;839C71|        |B69C10;
    dl sDialogUS_0x002A                                        ;839C74|        |B69C6E;
    dl sDialogUS_0x002B                                        ;839C77|        |B69CDC;
    dl sDialogUS_0x002C                                        ;839C7A|        |B69D94;
    dl sDialogUS_0x002D                                        ;839C7D|        |B69DF4;
    dl sDialogUS_0x002E                                        ;839C80|        |B69E12;
    dl sDialogUS_0x002F                                        ;839C83|        |B69E36;
    dl sDialogUS_0x0030                                        ;839C86|        |B69E96;
    dl sDialogUS_0x0031                                        ;839C89|        |B69EBA;
    dl sDialogUS_0x0032                                        ;839C8C|        |B69F52;
    dl sDialogUS_0x0033                                        ;839C8F|        |B69FA6;
    dl sDialogUS_0x0034                                        ;839C92|        |B69FE0;
    dl sDialogUS_0x0035                                        ;839C95|        |B6A03E;
    dl sDialogUS_0x0036                                        ;839C98|        |B6A0CE;
    dl sDialogUS_0x0037                                        ;839C9B|        |B6A1C8;
    dl sDialogUS_0x0038                                        ;839C9E|        |B6A22C;
    dl sDialogUS_0x0039                                        ;839CA1|        |B6A2C0;
    dl sDialogUS_0x003A                                        ;839CA4|        |B6A364;
    dl sDialogUS_0x003B                                        ;839CA7|        |B6A4FC;
    dl sDialogUS_0x003C                                        ;839CAA|        |B6A604;
    dl sDialogUS_0x003D                                        ;839CAD|        |B6A6B2;
    dl sDialogUS_0x003E                                        ;839CB0|        |B6A748;
    dl sDialogUS_0x003F                                        ;839CB3|        |B6A7EC;
    dl sDialogUS_0x0040                                        ;839CB6|        |B6A99A;
    dl sDialogUS_0x0041                                        ;839CB9|        |B6AA16;
    dl sDialogUS_0x0042                                        ;839CBC|        |B6AAC0;
    dl sDialogUS_0x0043                                        ;839CBF|        |B6AB2E;
    dl sDialogUS_0x0044                                        ;839CC2|        |B6ABF0;
    dl sDialogUS_0x0045                                        ;839CC5|        |B6AD1E;
    dl sDialogUS_0x0046                                        ;839CC8|        |B6AE86;
    dl sDialogUS_0x0047                                        ;839CCB|        |B6AF4C;
    dl sDialogUS_0x0048                                        ;839CCE|        |B6AFDA;
    dl sDialogUS_0x0049                                        ;839CD1|        |B6B03C;
    dl sDialogUS_0x004A                                        ;839CD4|        |B6B046;
    dl sDialogUS_0x004B                                        ;839CD7|        |B6B0DC;
    dl sDialogUS_0x004C                                        ;839CDA|        |B6B1DE;
    dl sDialogUS_0x004D                                        ;839CDD|        |B6B24A;
    dl sDialogUS_0x004E                                        ;839CE0|        |B6B2D2;
    dl sDialogUS_0x004F                                        ;839CE3|        |B6B3A8;
    dl sDialogUS_0x0050                                        ;839CE6|        |B6B470;
    dl sDialogUS_0x0051                                        ;839CE9|        |B6B512;
    dl sDialogUS_0x0052                                        ;839CEC|        |B6B55C;
    dl sDialogUS_0x0053                                        ;839CEF|        |B6B5CE;
    dl sDialogUS_0x0054                                        ;839CF2|        |B6B650;
    dl sDialogUS_0x0055                                        ;839CF5|        |B6B726;
    dl sDialogUS_0x0056                                        ;839CF8|        |B6B7CC;
    dl sDialogUS_0x0057                                        ;839CFB|        |B6B866;
    dl sDialogUS_0x0058                                        ;839CFE|        |B6B932;
    dl sDialogUS_0x0059                                        ;839D01|        |B6BA38;
    dl sDialogUS_0x005A                                        ;839D04|        |B6BB48;
    dl sDialogUS_0x005B                                        ;839D07|        |B6BC00;
    dl sDialogUS_0x005C                                        ;839D0A|        |B6BCA6;
    dl sDialogUS_0x005D                                        ;839D0D|        |B6BDEC;
    dl sDialogUS_0x005E                                        ;839D10|        |B6BF10;
    dl sDialogUS_0x005F                                        ;839D13|        |B6BFBE;
    dl sDialogUS_0x0060                                        ;839D16|        |B6C120;
    dl sDialogUS_0x0061                                        ;839D19|        |B6C1DA;
    dl sDialogUS_0x0062                                        ;839D1C|        |B6C2C2;
    dl sDialogUS_0x0063                                        ;839D1F|        |B6C358;
    dl sDialogUS_0x0064                                        ;839D22|        |B6C456;
    dl sDialogUS_0x0065                                        ;839D25|        |B6C550;
    dl sDialogUS_0x0066                                        ;839D28|        |B6C5C8;
    dl sDialogUS_0x0067                                        ;839D2B|        |B6C6C6;
    dl sDialogUS_0x0068                                        ;839D2E|        |B6C720;
    dl sDialogUS_0x0069                                        ;839D31|        |B6C81E;
    dl sDialogUS_0x006A                                        ;839D34|        |B6C868;
    dl sDialogUS_0x006B                                        ;839D37|        |B6C932;
    dl sDialogUS_0x006C                                        ;839D3A|        |B6C9B2;
    dl sDialogUS_0x006D                                        ;839D3D|        |B6CA1C;
    dl sDialogUS_0x006E                                        ;839D40|        |B6CA96;
    dl sDialogUS_0x006F                                        ;839D43|        |B6CB22;
    dl sDialogUS_0x0070                                        ;839D46|        |B6CBCE;
    dl sDialogUS_0x0071                                        ;839D49|        |B6CC1A;
    dl sDialogUS_0x0072                                        ;839D4C|        |B6CD04;
    dl sDialogUS_0x0073                                        ;839D4F|        |B6CDD0;
    dl sDialogUS_0x0074                                        ;839D52|        |B6CE5A;
    dl sDialogUS_0x0075                                        ;839D55|        |B6CF4A;
    dl sDialogUS_0x0076                                        ;839D58|        |B6CFE6;
    dl sDialogUS_0x0077                                        ;839D5B|        |B6D07C;
    dl sDialogUS_0x0078                                        ;839D5E|        |B6D144;
    dl sDialogUS_0x0079                                        ;839D61|        |B6D27A;
    dl sDialogUS_0x007A                                        ;839D64|        |B6D358;
    dl sDialogUS_0x007B                                        ;839D67|        |B6D44E;
    dl sDialogUS_0x007C                                        ;839D6A|        |B6D4F8;
    dl sDialogUS_0x007D                                        ;839D6D|        |B6D59A;
    dl sDialogUS_0x007E                                        ;839D70|        |B6D604;
    dl sDialogUS_0x007F                                        ;839D73|        |B6D678;
    dl sDialogUS_0x0080                                        ;839D76|        |B6D6D6;
    dl sDialogUS_0x0081                                        ;839D79|        |B6D75E;
    dl sDialogUS_0x0082                                        ;839D7C|        |B6D77E;
    dl sDialogUS_0x0083                                        ;839D7F|        |B6D7B8;
    dl sDialogUS_0x0084                                        ;839D82|        |B6D816;
    dl sDialogUS_0x0085                                        ;839D85|        |B6D860;
    dl sDialogUS_0x0086                                        ;839D88|        |B6D896;
    dl sDialogUS_0x0087                                        ;839D8B|        |B6D906;
    dl sDialogUS_0x0088                                        ;839D8E|        |B6D99A;
    dl sDialogUS_0x0089                                        ;839D91|        |B6DA34;
    dl sDialogUS_0x008A                                        ;839D94|        |B6DABE;
    dl sDialogUS_0x008B                                        ;839D97|        |B6DB56;
    dl sDialogUS_0x008C                                        ;839D9A|        |B6DBDC;
    dl sDialogUS_0x008D                                        ;839D9D|        |B6DBEA;
    dl sDialogUS_0x008E                                        ;839DA0|        |B6DC76;
    dl sDialogUS_0x008F                                        ;839DA3|        |B6DD0E;
    dl sDialogUS_0x0090                                        ;839DA6|        |B6DD2E;
    dl sDialogUS_0x0091                                        ;839DA9|        |B6DD7E;
    dl sDialogUS_0x0092                                        ;839DAC|        |B6DDFE;
    dl sDialogUS_0x0093                                        ;839DAF|        |B6DE70;
    dl sDialogUS_0x0094                                        ;839DB2|        |B6DF20;
    dl sDialogUS_0x0095                                        ;839DB5|        |B6DF84;
    dl sDialogUS_0x0096                                        ;839DB8|        |B6E008;
    dl sDialogUS_0x0097                                        ;839DBB|        |B6E066;
    dl sDialogUS_0x0098                                        ;839DBE|        |B6E150;
    dl sDialogUS_0x0099                                        ;839DC1|        |B6E164;
    dl sDialogUS_0x009A                                        ;839DC4|        |B6E19C;
    dl sDialogUS_0x009B                                        ;839DC7|        |B6E220;
    dl sDialogUS_0x009C                                        ;839DCA|        |B6E2AE;
    dl sDialogUS_0x009D                                        ;839DCD|        |B6E2DC;
    dl sDialogUS_0x009E                                        ;839DD0|        |B6E39A;
    dl sDialogUS_0x009F                                        ;839DD3|        |B6E460;
    dl sDialogUS_0x00A0                                        ;839DD6|        |B6E4A2;
    dl sDialogUS_0x00A1                                        ;839DD9|        |B6E54A;
    dl sDialogUS_0x00A2                                        ;839DDC|        |B6E5DA;
    dl sDialogUS_0x00A3                                        ;839DDF|        |B6E678;
    dl sDialogUS_0x00A4                                        ;839DE2|        |B6E6C4;
    dl sDialogUS_0x00A5                                        ;839DE5|        |B6E6F4;
    dl sDialogUS_0x00A6                                        ;839DE8|        |B6E77E;
    dl sDialogUS_0x00A7                                        ;839DEB|        |B6E7C2;
    dl sDialogUS_0x00A8                                        ;839DEE|        |B6E7FC;
    dl sDialogUS_0x00A9                                        ;839DF1|        |B6E84E;
    dl sDialogUS_0x00AA                                        ;839DF4|        |B6E8CC;
    dl sDialogUS_0x00AB                                        ;839DF7|        |B6EA14;
    dl sDialogUS_0x00AC                                        ;839DFA|        |B6EB9E;
    dl sDialogUS_0x00AD                                        ;839DFD|        |B6EBDE;
    dl sDialogUS_0x00AE                                        ;839E00|        |B6ECA2;
    dl sDialogUS_0x00AF                                        ;839E03|        |B6ED0A;
    dl sDialogUS_0x00B0                                        ;839E06|        |B6ED94;
    dl sDialogUS_0x00B1                                        ;839E09|        |B6EDC8;
    dl sDialogUS_0x00B2                                        ;839E0C|        |B6EDD6;
    dl sDialogUS_0x00B3                                        ;839E0F|        |B6EE78;
    dl sDialogUS_0x00B4                                        ;839E12|        |B6EF5A;
    dl sDialogUS_0x00B5                                        ;839E15|        |B6EF86;
    dl sDialogUS_0x00B6                                        ;839E18|        |B6F02A;
    dl sDialogUS_0x00B7                                        ;839E1B|        |B6F0C6;
    dl sDialogUS_0x00B8                                        ;839E1E|        |B6F16E;
    dl sDialogUS_0x00B9                                        ;839E21|        |B6F212;
    dl sDialogUS_0x00BA                                        ;839E24|        |B6F2CC;
    dl sDialogUS_0x00BB                                        ;839E27|        |B6F332;
    dl sDialogUS_0x00BC                                        ;839E2A|        |B6F3B4;
    dl sDialogUS_0x00BD                                        ;839E2D|        |B6F462;
    dl sDialogUS_0x00BE                                        ;839E30|        |B6F4B8;
    dl sDialogUS_0x00BF                                        ;839E33|        |B6F4CC;
    dl sDialogUS_0x00C0                                        ;839E36|        |B6F558;
    dl sDialogUS_0x00C1                                        ;839E39|        |B6F5D6;
    dl sDialogUS_0x00C2                                        ;839E3C|        |B6F72E;
    dl sDialogUS_0x00C3                                        ;839E3F|        |B6F84E;
    dl sDialogUS_0x00C4                                        ;839E42|        |B6F87C;
    dl sDialogUS_0x00C5                                        ;839E45|        |B6F8CA;
    dl sDialogUS_0x00C6                                        ;839E48|        |B6F904;
    dl sDialogUS_0x00C7                                        ;839E4B|        |B6F98E;
    dl sDialogUS_0x00C8                                        ;839E4E|        |B6FA10;
    dl sDialogUS_0x00C9                                        ;839E51|        |B6FAAE;
    dl sDialogUS_0x00CA                                        ;839E54|        |B6FAC4;
    dl sDialogUS_0x00CB                                        ;839E57|        |B6FB4A;
    dl sDialogUS_0x00CC                                        ;839E5A|        |B6FBDC;
    dl sDialogUS_0x00CD                                        ;839E5D|        |B6FC0E;
    dl sDialogUS_0x00CE                                        ;839E60|        |B6FC94;
    dl sDialogUS_0x00CF                                        ;839E63|        |B6FD32;
    dl sDialogUS_0x00D0                                        ;839E66|        |B6FE84;
    dl sDialogUS_0x00D1                                        ;839E69|        |B6FF34;
    dl sDialogUS_0x00D2                                        ;839E6C|        |B78000;
    dl sDialogUS_0x00D3                                        ;839E6F|        |B780AE;
    dl sDialogUS_0x00D4                                        ;839E72|        |B78184;
    dl sDialogUS_0x00D5                                        ;839E75|        |B781D6;
    dl sDialogUS_0x00D6                                        ;839E78|        |B78282;
    dl sDialogUS_0x00D7                                        ;839E7B|        |B782C4;
    dl sDialogUS_0x00D8                                        ;839E7E|        |B78322;
    dl sDialogUS_0x00D9                                        ;839E81|        |B7837C;
    dl sDialogUS_0x00DA                                        ;839E84|        |B78422;
    dl sDialogUS_0x00DB                                        ;839E87|        |B784DE;
    dl sDialogUS_0x00DC                                        ;839E8A|        |B78562;
    dl sDialogUS_0x00DD                                        ;839E8D|        |B785FA;
    dl sDialogUS_0x00DE                                        ;839E90|        |B78610;
    dl sDialogUS_0x00DF                                        ;839E93|        |B786E2;
    dl sDialogUS_0x00E0                                        ;839E96|        |B7877A;
    dl sDialogUS_0x00E1                                        ;839E99|        |B787CC;
    dl sDialogUS_0x00E2                                        ;839E9C|        |B787FE;
    dl sDialogUS_0x00E3                                        ;839E9F|        |B788D2;
    dl sDialogUS_0x00E4                                        ;839EA2|        |B78900;
    dl sDialogUS_0x00E5                                        ;839EA5|        |B78930;
    dl sDialogUS_0x00E6                                        ;839EA8|        |B78962;
    dl sDialogUS_0x00E7                                        ;839EAB|        |B78A1E;
    dl sDialogUS_0x00E8                                        ;839EAE|        |B78A7C;
    dl sDialogUS_0x00E9                                        ;839EB1|        |B78AFC;
    dl sDialogUS_0x00EA                                        ;839EB4|        |B78B42;
    dl sDialogUS_0x00EB                                        ;839EB7|        |B78B72;
    dl sDialogUS_0x00EC                                        ;839EBA|        |B78BA6;
    dl sDialogUS_0x00ED                                        ;839EBD|        |B78C28;
    dl sDialogUS_0x00EE                                        ;839EC0|        |B78CEA;
    dl sDialogUS_0x00EF                                        ;839EC3|        |B78D94;
    dl sDialogUS_0x00F0                                        ;839EC6|        |B78E84;
    dl sDialogUS_0x00F1                                        ;839EC9|        |B78FE8;
    dl sDialogUS_0x00F2                                        ;839ECC|        |B7908A;
    dl sDialogUS_0x00F3                                        ;839ECF|        |B79138;
    dl sDialogUS_0x00F4                                        ;839ED2|        |B792E6;
    dl sDialogUS_0x00F5                                        ;839ED5|        |B7946E;
    dl sDialogUS_0x00F6                                        ;839ED8|        |B795F8;
    dl sDialogUS_0x00F7                                        ;839EDB|        |B7973C;
    dl sDialogUS_0x00F8                                        ;839EDE|        |B7982E;
    dl sDialogUS_0x00F9                                        ;839EE1|        |B79872;
    dl sDialogUS_0x00FA                                        ;839EE4|        |B7991C;
    dl sDialogUS_0x00FB                                        ;839EE7|        |B79972;
    dl sDialogUS_0x00FC                                        ;839EEA|        |B79AAA;
    dl sDialogUS_0x00FD                                        ;839EED|        |B79AC0;
    dl sDialogUS_0x00FE                                        ;839EF0|        |B79C02;
    dl sDialogUS_0x00FF                                        ;839EF3|        |B79CC2;
    dl sDialogUS_0x0100                                        ;839EF6|        |B79E1E;
    dl sDialogUS_0x0101                                        ;839EF9|        |B79EDE;
    dl sDialogUS_0x0102                                        ;839EFC|        |B79FBA;
    dl sDialogUS_0x0103                                        ;839EFF|        |B7A098;
    dl sDialogUS_0x0104                                        ;839F02|        |B7A12C;
    dl sDialogUS_0x0105                                        ;839F05|        |B7A1D6;
    dl sDialogUS_0x0106                                        ;839F08|        |B7A370;
    dl sDialogUS_0x0107                                        ;839F0B|        |B7A3DA;
    dl sDialogUS_0x0108                                        ;839F0E|        |B7A4FC;
    dl sDialogUS_0x0109                                        ;839F11|        |B7A57A;
    dl sDialogUS_0x010A                                        ;839F14|        |B7A5FA;
    dl sDialogUS_0x010B                                        ;839F17|        |B7A650;
    dl sDialogUS_0x010C                                        ;839F1A|        |B7A698;
    dl sDialogUS_0x010D                                        ;839F1D|        |B7A878;
    dl sDialogUS_0x010E                                        ;839F20|        |B7A960;
    dl sDialogUS_0x010F                                        ;839F23|        |B7AA7E;
    dl sDialogUS_0x0110                                        ;839F26|        |B7ABB4;
    dl sDialogUS_0x0111                                        ;839F29|        |B7AC52;
    dl sDialogUS_0x0112                                        ;839F2C|        |B7AE14;
    dl sDialogUS_0x0113                                        ;839F2F|        |B7AF62;
    dl sDialogUS_0x0114                                        ;839F32|        |B7B016;
    dl sDialogUS_0x0115                                        ;839F35|        |B7B068;
    dl sDialogUS_0x0116                                        ;839F38|        |B7B148;
    dl sDialogUS_0x0117                                        ;839F3B|        |B7B1E4;
    dl sDialogUS_0x0118                                        ;839F3E|        |B7B276;
    dl sDialogUS_0x0119                                        ;839F41|        |B7B376;
    dl sDialogUS_0x011A                                        ;839F44|        |B7B3BA;
    dl sDialogUS_0x011B                                        ;839F47|        |B7B42C;
    dl sDialogUS_0x011C                                        ;839F4A|        |B7B508;
    dl sDialogUS_0x011D                                        ;839F4D|        |B7B574;
    dl sDialogUS_0x011E                                        ;839F50|        |B7B5B8;
    dl sDialogUS_0x011F                                        ;839F53|        |B7B67E;
    dl sDialogUS_0x0120                                        ;839F56|        |B7B6A8;
    dl sDialogUS_0x0121                                        ;839F59|        |B7B700;
    dl sDialogUS_0x0122                                        ;839F5C|        |B7B7F8;
    dl sDialogUS_0x0123                                        ;839F5F|        |B7B936;
    dl sDialogUS_0x0124                                        ;839F62|        |B7B9CA;
    dl sDialogUS_0x0125                                        ;839F65|        |B7B9E2;
    dl sDialogUS_0x0126                                        ;839F68|        |B7BBD2;
    dl sDialogUS_0x0127                                        ;839F6B|        |B7BC90;
    dl sDialogUS_0x0128                                        ;839F6E|        |B7BD58;
    dl sDialogUS_0x0129                                        ;839F71|        |B7BDF0;
    dl sDialogUS_0x012A                                        ;839F74|        |B7BEF8;
    dl sDialogUS_0x012B                                        ;839F77|        |B7C000;
    dl sDialogUS_0x012C                                        ;839F7A|        |B7C14C;
    dl sDialogUS_0x012D                                        ;839F7D|        |B7C1AA;
    dl sDialogUS_0x012E                                        ;839F80|        |B7C1FA;
    dl sDialogUS_0x012F                                        ;839F83|        |B7C27E;
    dl sDialogUS_0x0130                                        ;839F86|        |B7C316;
    dl sDialogUS_0x0131                                        ;839F89|        |B7C39E;
    dl sDialogUS_0x0132                                        ;839F8C|        |B7C3EA;
    dl sDialogUS_0x0133                                        ;839F8F|        |B7C440;
    dl sDialogUS_0x0134                                        ;839F92|        |B7C4E0;
    dl sDialogUS_0x0135                                        ;839F95|        |B7C5D0;
    dl sDialogUS_0x0136                                        ;839F98|        |B7C61C;
    dl sDialogUS_0x0137                                        ;839F9B|        |B7C660;
    dl sDialogUS_0x0138                                        ;839F9E|        |B7C88E;
    dl sDialogUS_0x0139                                        ;839FA1|        |B7C952;
    dl sDialogUS_0x013A                                        ;839FA4|        |B7C98C;
    dl sDialogUS_0x013B                                        ;839FA7|        |B7C9EC;
    dl sDialogUS_0x013C                                        ;839FAA|        |B7CADC;
    dl sDialogUS_0x013D                                        ;839FAD|        |B7CB28;
    dl sDialogUS_0x013E                                        ;839FB0|        |B7CBB0;
    dl sDialogUS_0x013F                                        ;839FB3|        |B7CBFA;
    dl sDialogUS_0x0140                                        ;839FB6|        |B7CCA6;
    dl sDialogUS_0x0141                                        ;839FB9|        |B7CD82;
    dl sDialogUS_0x0142                                        ;839FBC|        |B7CE7C;
    dl sDialogUS_0x0143                                        ;839FBF|        |B7CF62;
    dl sDialogUS_0x0144                                        ;839FC2|        |B7CF94;
    dl sDialogUS_0x0145                                        ;839FC5|        |B7D074;
    dl sDialogUS_0x0146                                        ;839FC8|        |B7D11E;
    dl sDialogUS_0x0147                                        ;839FCB|        |B7D1D0;
    dl sDialogUS_0x0148                                        ;839FCE|        |B7D21A;
    dl sDialogUS_0x0149                                        ;839FD1|        |B7D3E0;
    dl sDialogUS_0x014A                                        ;839FD4|        |B7D5BA;
    dl sDialogUS_0x014B                                        ;839FD7|        |B7D63C;
    dl sDialogUS_0x014C                                        ;839FDA|        |B7D76A;
    dl sDialogUS_0x014D                                        ;839FDD|        |B7D836;
    dl sDialogUS_0x014E                                        ;839FE0|        |B7DA28;
    dl sDialogUS_0x014F                                        ;839FE3|        |B7DAA6;
    dl sDialogUS_0x0150                                        ;839FE6|        |B7DB4C;
    dl sDialogUS_0x0151                                        ;839FE9|        |B7DBAA;
    dl sDialogUS_0x0152                                        ;839FEC|        |B7DBCA;
    dl sDialogUS_0x0153                                        ;839FEF|        |B7DC48;
    dl sDialogUS_0x0154                                        ;839FF2|        |B7DCCA;
    dl sDialogUS_0x0155                                        ;839FF5|        |B7DD2E;
    dl sDialogUS_0x0156                                        ;839FF8|        |B7DD9A;
    dl sDialogUS_0x0157                                        ;839FFB|        |B7DE40;
    dl sDialogUS_0x0158                                        ;839FFE|        |B7DEEA;
    dl sDialogUS_0x0159                                        ;83A001|        |B7DF72;
    dl sDialogUS_0x015A                                        ;83A004|        |B7DFFE;
    dl sDialogUS_0x015B                                        ;83A007|        |B7E0A0;
    dl sDialogUS_0x015C                                        ;83A00A|        |B7E194;
    dl sDialogUS_0x015D                                        ;83A00D|        |B7E1EA;
    dl sDialogUS_0x015E                                        ;83A010|        |B7E296;
    dl sDialogUS_0x015F                                        ;83A013|        |B7E330;
    dl sDialogUS_0x0160                                        ;83A016|        |B7E3D6;
    dl sDialogUS_0x0161                                        ;83A019|        |B7E41C;
    dl sDialogUS_0x0162                                        ;83A01C|        |B7E4A2;
    dl sDialogUS_0x0163                                        ;83A01F|        |B7E514;
    dl sDialogUS_0x0164                                        ;83A022|        |B7E54C;
    dl sDialogUS_0x0165                                        ;83A025|        |B7E57A;
    dl sDialogUS_0x0166                                        ;83A028|        |B7E5CA;
    dl sDialogUS_0x0167                                        ;83A02B|        |B7E660;
    dl sDialogUS_0x0168                                        ;83A02E|        |B7E714;
    dl sDialogUS_0x0169                                        ;83A031|        |B7E762;
    dl sDialogUS_0x016A                                        ;83A034|        |B7E7C2;
    dl sDialogUS_0x016B                                        ;83A037|        |B7E8C0;
    dl sDialogUS_0x016C                                        ;83A03A|        |B7E916;
    dl sDialogUS_0x016D                                        ;83A03D|        |B7E9E0;
    dl sDialogUS_0x016E                                        ;83A040|        |B7EACC;
    dl sDialogUS_0x016F                                        ;83A043|        |B7EB62;
    dl sDialogUS_0x0170                                        ;83A046|        |B7EBB0;
    dl sDialogUS_0x0171                                        ;83A049|        |B7EC0C;
    dl sDialogUS_0x0172                                        ;83A04C|        |B7ECC8;
    dl sDialogUS_0x0173                                        ;83A04F|        |B7ED9C;
    dl sDialogUS_0x0174                                        ;83A052|        |B7EDB8;
    dl sDialogUS_0x0175                                        ;83A055|        |B7EE04;
    dl sDialogUS_0x0176                                        ;83A058|        |B7EE2E;
    dl sDialogUS_0x0177                                        ;83A05B|        |B7EE52;
    dl sDialogUS_0x0178                                        ;83A05E|        |B7EE66;
    dl sDialogUS_0x0179                                        ;83A061|        |B7EEA0;
    dl sDialogUS_0x017A                                        ;83A064|        |B7EEC2;
    dl sDialogUS_0x017B                                        ;83A067|        |B7EF2C;
    dl sDialogUS_0x017C                                        ;83A06A|        |B7EF64;
    dl sDialogUS_0x017D                                        ;83A06D|        |B7EF9C;
    dl sDialogUS_0x017E                                        ;83A070|        |B7F01C;
    dl sDialogUS_0x017F                                        ;83A073|        |B7F044;
    dl sDialogUS_0x0180                                        ;83A076|        |B7F06A;
    dl sDialogUS_0x0181                                        ;83A079|        |B7F0B4;
    dl sDialogUS_0x0182                                        ;83A07C|        |B7F0EC;
    dl sDialogUS_0x0183                                        ;83A07F|        |B7F130;
    dl sDialogUS_0x0184                                        ;83A082|        |B7F190;
    dl sDialogUS_0x0185                                        ;83A085|        |B7F220;
    dl sDialogUS_0x0186                                        ;83A088|        |B7F29A;
    dl sDialogUS_0x0187                                        ;83A08B|        |B7F354;
    dl sDialogUS_0x0188                                        ;83A08E|        |B7F416;
    dl sDialogUS_0x0189                                        ;83A091|        |B7F4A2;
    dl sDialogUS_0x018A                                        ;83A094|        |B7F538;
    dl sDialogUS_0x018B                                        ;83A097|        |B7F5C6;
    dl sDialogUS_0x018C                                        ;83A09A|        |B7F684;
    dl sDialogUS_0x018D                                        ;83A09D|        |B7F778;
    dl sDialogUS_0x018E                                        ;83A0A0|        |B7F7E2;
    dl sDialogUS_0x018F                                        ;83A0A3|        |B7F8C2;
    dl sDialogUS_0x0190                                        ;83A0A6|        |B7F8F4;
    dl sDialogUS_0x0191                                        ;83A0A9|        |B7F9C2;
    dl sDialogUS_0x0192                                        ;83A0AC|        |B7FA70;
    dl sDialogUS_0x0193                                        ;83A0AF|        |B7FABA;
    dl sDialogUS_0x0194                                        ;83A0B2|        |B7FAEC;
    dl sDialogUS_0x0195                                        ;83A0B5|        |B7FB32;
    dl sDialogUS_0x0196                                        ;83A0B8|        |B7FB92;
    dl sDialogUS_0x0197                                        ;83A0BB|        |B7FBD6;
    dl sDialogUS_0x0198                                        ;83A0BE|        |B7FC52;
    dl sDialogUS_0x0199                                        ;83A0C1|        |B7FCA2;
    dl sDialogUS_0x019A                                        ;83A0C4|        |B7FCF2;
    dl sDialogUS_0x019B                                        ;83A0C7|        |B7FD48;
    dl sDialogUS_0x019C                                        ;83A0CA|        |B7FD9A;
    dl sDialogUS_0x019D                                        ;83A0CD|        |B7FDF4;
    dl sDialogUS_0x019E                                        ;83A0D0|        |B7FE1A;
    dl sDialogUS_0x019F                                        ;83A0D3|        |B7FE7C;
    dl sDialogUS_0x01A0                                        ;83A0D6|        |B7FF22;
    dl sDialogUS_0x01A1                                        ;83A0D9|        |B7FFA0;
    dl sDialogUS_0x01A2                                        ;83A0DC|        |B88000;
    dl sDialogUS_0x01A3                                        ;83A0DF|        |B8809C;
    dl sDialogUS_0x01A4                                        ;83A0E2|        |B880E2;
    dl sDialogUS_0x01A5                                        ;83A0E5|        |B8812E;
    dl sDialogUS_0x01A6                                        ;83A0E8|        |B88186;
    dl sDialogUS_0x01A7                                        ;83A0EB|        |B881D4;
    dl sDialogUS_0x01A8                                        ;83A0EE|        |B8821E;
    dl sDialogUS_0x01A9                                        ;83A0F1|        |B8828C;
    dl sDialogUS_0x01AA                                        ;83A0F4|        |B882C4;
    dl sDialogUS_0x01AB                                        ;83A0F7|        |B88374;
    dl sDialogUS_0x01AC                                        ;83A0FA|        |B88396;
    dl sDialogUS_0x01AD                                        ;83A0FD|        |B883CE;
    dl sDialogUS_0x01AE                                        ;83A100|        |B883EA;
    dl sDialogUS_0x01AF                                        ;83A103|        |B88432;
    dl sDialogUS_0x01B0                                        ;83A106|        |B8845C;
    dl sDialogUS_0x01B1                                        ;83A109|        |B88478;
    dl sDialogUS_0x01B2                                        ;83A10C|        |B884A8;
    dl sDialogUS_0x01B3                                        ;83A10F|        |B8853C;
    dl sDialogUS_0x01B4                                        ;83A112|        |B88556;
    dl sDialogUS_0x01B5                                        ;83A115|        |B885B2;
    dl sDialogUS_0x01B6                                        ;83A118|        |B885C0;
    dl sDialogUS_0x01B7                                        ;83A11B|        |B8861E;
    dl sDialogUS_0x01B8                                        ;83A11E|        |B8869C;
    dl sDialogUS_0x01B9                                        ;83A121|        |B886E8;
    dl sDialogUS_0x01BA                                        ;83A124|        |B88734;
    dl sDialogUS_0x01BB                                        ;83A127|        |B88768;
    dl sDialogUS_0x01BC                                        ;83A12A|        |B887AE;
    dl sDialogUS_0x01BD                                        ;83A12D|        |B88800;
    dl sDialogUS_0x01BE                                        ;83A130|        |B8888A;
    dl sDialogUS_0x01BF                                        ;83A133|        |B8889C;
    dl sDialogUS_0x01C0                                        ;83A136|        |B888F4;
    dl sDialogUS_0x01C1                                        ;83A139|        |B88902;
    dl sDialogUS_0x01C2                                        ;83A13C|        |B88914;
    dl sDialogUS_0x01C3                                        ;83A13F|        |B8892A;
    dl sDialogUS_0x01C4                                        ;83A142|        |B88AC4;
    dl sDialogUS_0x01C5                                        ;83A145|        |B88AE2;
    dl sDialogUS_0x01C6                                        ;83A148|        |B88B7A;
    dl sDialogUS_0x01C7                                        ;83A14B|        |B88BB2;
    dl sDialogUS_0x01C8                                        ;83A14E|        |B88C06;
    dl sDialogUS_0x01C9                                        ;83A151|        |B88C2E;
    dl sDialogUS_0x01CA                                        ;83A154|        |B88C82;
    dl sDialogUS_0x01CB                                        ;83A157|        |B88D22;
    dl sDialogUS_0x01CC                                        ;83A15A|        |B88D78;
    dl sDialogUS_0x01CD                                        ;83A15D|        |B88F60;
    dl sDialogUS_0x01CE                                        ;83A160|        |B88FE8;
    dl sDialogUS_0x01CF                                        ;83A163|        |B890FE;
    dl sDialogUS_0x01D0                                        ;83A166|        |B89166;
    dl sDialogUS_0x01D1                                        ;83A169|        |B8920A;
    dl sDialogUS_0x01D2                                        ;83A16C|        |B892A6;
    dl sDialogUS_0x01D3                                        ;83A16F|        |B89308;
    dl sDialogUS_0x01D4                                        ;83A172|        |B89354;
    dl sDialogUS_0x01D5                                        ;83A175|        |B893D4;
    dl sDialogUS_0x01D6                                        ;83A178|        |B89486;
    dl sDialogUS_0x01D7                                        ;83A17B|        |B894DC;
    dl sDialogUS_0x01D8                                        ;83A17E|        |B8951E;
    dl sDialogUS_0x01D9                                        ;83A181|        |B89620;
    dl sDialogUS_0x01DA                                        ;83A184|        |B89634;
    dl sDialogUS_0x01DB                                        ;83A187|        |B89678;
    dl sDialogUS_0x01DC                                        ;83A18A|        |B8983E;
    dl sDialogUS_0x01DD                                        ;83A18D|        |B89938;
    dl sDialogUS_0x01DE                                        ;83A190|        |B89A38;
    dl sDialogUS_0x01DF                                        ;83A193|        |B89A6E;
    dl sDialogUS_0x01E0                                        ;83A196|        |B89B24;
    dl sDialogUS_0x01E1                                        ;83A199|        |B89C2E;
    dl sDialogUS_0x01E2                                        ;83A19C|        |B89CCC;
    dl sDialogUS_0x01E3                                        ;83A19F|        |B89D76;
    dl sDialogUS_0x01E4                                        ;83A1A2|        |B89E2A;
    dl sDialogUS_0x01E5                                        ;83A1A5|        |B89E80;
    dl sDialogUS_0x01E6                                        ;83A1A8|        |B89F04;
    dl sDialogUS_0x01E7                                        ;83A1AB|        |B89FBE;
    dl sDialogUS_0x01E8                                        ;83A1AE|        |B8A020;
    dl sDialogUS_0x01E9                                        ;83A1B1|        |B8A064;
    dl sDialogUS_0x01EA                                        ;83A1B4|        |B8A12E;
    dl sDialogUS_0x01EB                                        ;83A1B7|        |B8A1AC;
    dl sDialogUS_0x01EC                                        ;83A1BA|        |B8A234;
    dl sDialogUS_0x01ED                                        ;83A1BD|        |B8A282;
    dl sDialogUS_0x01EE                                        ;83A1C0|        |B8A2EC;
    dl sDialogUS_0x01EF                                        ;83A1C3|        |B8A2FA;
    dl sDialogUS_0x01F0                                        ;83A1C6|        |B8A3B8;
    dl sDialogUS_0x01F1                                        ;83A1C9|        |B8A448;
    dl sDialogUS_0x01F2                                        ;83A1CC|        |B8A5DA;
    dl sDialogUS_0x01F3                                        ;83A1CF|        |B8A61E;
    dl sDialogUS_0x01F4                                        ;83A1D2|        |B8A66C;
    dl sDialogUS_0x01F5                                        ;83A1D5|        |B8A69C;
    dl sDialogUS_0x01F6                                        ;83A1D8|        |B8A6FC;
    dl sDialogUS_0x01F7                                        ;83A1DB|        |B8A72C;
    dl sDialogUS_0x01F8                                        ;83A1DE|        |B8A788;
    dl sDialogUS_0x01F9                                        ;83A1E1|        |B8A80E;
    dl sDialogUS_0x01FA                                        ;83A1E4|        |B8A870;
    dl sDialogUS_0x01FB                                        ;83A1E7|        |B8A8BA;
    dl sDialogUS_0x01FC                                        ;83A1EA|        |B8A986;
    dl sDialogUS_0x01FD                                        ;83A1ED|        |B8AA4E;
    dl sDialogUS_0x01FE                                        ;83A1F0|        |B8AABA;
    dl sDialogUS_0x01FF                                        ;83A1F3|        |B8AB14;
    dl sDialogUS_0x0200                                        ;83A1F6|        |B8ABE8;
    dl sDialogUS_0x0201                                        ;83A1F9|        |B8ABFE;
    dl sDialogUS_0x0202                                        ;83A1FC|        |B8AD42;
    dl sDialogUS_0x0203                                        ;83A1FF|        |B8AF26;
    dl sDialogUS_0x0204                                        ;83A202|        |B8AFD6;
    dl sDialogUS_0x0205                                        ;83A205|        |B8B034;
    dl sDialogUS_0x0206                                        ;83A208|        |B8B0F2;
    dl sDialogUS_0x0207                                        ;83A20B|        |B8B18A;
    dl sDialogUS_0x0208                                        ;83A20E|        |B8B21C;
    dl sDialogUS_0x0209                                        ;83A211|        |B8B2B8;
    dl sDialogUS_0x020A                                        ;83A214|        |B8B31E;
    dl sDialogUS_0x020B                                        ;83A217|        |B8B384;
    dl sDialogUS_0x020C                                        ;83A21A|        |B8B408;
    dl sDialogUS_0x020D                                        ;83A21D|        |B8B4CA;
    dl sDialogUS_0x020E                                        ;83A220|        |B8B63C;
    dl sDialogUS_0x020F                                        ;83A223|        |B8B7C0;
    dl sDialogUS_0x0210                                        ;83A226|        |B8B92E;
    dl sDialogUS_0x0211                                        ;83A229|        |B8B9C4;
    dl sDialogUS_0x0212                                        ;83A22C|        |B8BA18;
    dl sDialogUS_0x0213                                        ;83A22F|        |B8BA70;
    dl sDialogUS_0x0214                                        ;83A232|        |B8BACE;
    dl sDialogUS_0x0215                                        ;83A235|        |B8BCDC;
    dl sDialogUS_0x0216                                        ;83A238|        |B8BD76;
    dl sDialogUS_0x0217                                        ;83A23B|        |B8BE10;
    dl sDialogUS_0x0218                                        ;83A23E|        |B8BE6C;
    dl sDialogUS_0x0219                                        ;83A241|        |B8BEC4;
    dl sDialogUS_0x021A                                        ;83A244|        |B8BF24;
    dl sDialogUS_0x021B                                        ;83A247|        |B8BF8A;
    dl sDialogUS_0x021C                                        ;83A24A|        |B8BFEA;
    dl sDialogUS_0x021D                                        ;83A24D|        |B8C04C;
    dl sDialogUS_0x021E                                        ;83A250|        |B8C136;
    dl sDialogUS_0x021F                                        ;83A253|        |B8C1B6;
    dl sDialogUS_0x0220                                        ;83A256|        |B8C238;
    dl sDialogUS_0x0221                                        ;83A259|        |B8C2EC;
    dl sDialogUS_0x0222                                        ;83A25C|        |B8C37E;
    dl sDialogUS_0x0223                                        ;83A25F|        |B8C3EA;
    dl sDialogUS_0x0224                                        ;83A262|        |B8C422;
    dl sDialogUS_0x0225                                        ;83A265|        |B8C466;
    dl sDialogUS_0x0226                                        ;83A268|        |B8C4E8;
    dl sDialogUS_0x0227                                        ;83A26B|        |B8C56A;
    dl sDialogUS_0x0228                                        ;83A26E|        |B8C5F6;
    dl sDialogUS_0x0229                                        ;83A271|        |B8C67C;
    dl sDialogUS_0x022A                                        ;83A274|        |B8C700;
    dl sDialogUS_0x022B                                        ;83A277|        |B8C7D2;
    dl sDialogUS_0x022C                                        ;83A27A|        |B8C814;
    dl sDialogUS_0x022D                                        ;83A27D|        |B8C860;
    dl sDialogUS_0x022E                                        ;83A280|        |B8C914;
    dl sDialogUS_0x022F                                        ;83A283|        |B8C998;
    dl sDialogUS_0x0230                                        ;83A286|        |B8C9F8;
    dl sDialogUS_0x0231                                        ;83A289|        |B8CA66;
    dl sDialogUS_0x0232                                        ;83A28C|        |B8CB52;
    dl sDialogUS_0x0233                                        ;83A28F|        |B8CBFA;
    dl sDialogUS_0x0234                                        ;83A292|        |B8CC66;
    dl sDialogUS_0x0235                                        ;83A295|        |B8CD94;
    dl sDialogUS_0x0236                                        ;83A298|        |B8CDC8;
    dl sDialogUS_0x0237                                        ;83A29B|        |B8CE14;
    dl sDialogUS_0x0238                                        ;83A29E|        |B8CFBA;
    dl sDialogUS_0x0239                                        ;83A2A1|        |B8D006;
    dl sDialogUS_0x023A                                        ;83A2A4|        |B8D0D8;
    dl sDialogUS_0x023B                                        ;83A2A7|        |B8D14A;
    dl sDialogUS_0x023C                                        ;83A2AA|        |B8D1E2;
    dl sDialogUS_0x023D                                        ;83A2AD|        |B8D280;
    dl sDialogUS_0x023E                                        ;83A2B0|        |B8D32C;
    dl sDialogUS_0x023F                                        ;83A2B3|        |B8D3AE;
    dl sDialogUS_0x0240                                        ;83A2B6|        |B8D41E;
    dl sDialogUS_0x0241                                        ;83A2B9|        |B8D5E6;
    dl sDialogUS_0x0242                                        ;83A2BC|        |B8D650;
    dl sDialogUS_0x0243                                        ;83A2BF|        |B8D6AE;
    dl sDialogUS_0x0244                                        ;83A2C2|        |B8D6E2;
    dl sDialogUS_0x0245                                        ;83A2C5|        |B8D748;
    dl sDialogUS_0x0246                                        ;83A2C8|        |B8D79A;
    dl sDialogUS_0x0247                                        ;83A2CB|        |B8D8DE;
    dl sDialogUS_0x0248                                        ;83A2CE|        |B8DA26;
    dl sDialogUS_0x0249                                        ;83A2D1|        |B8DAA4;
    dl sDialogUS_0x024A                                        ;83A2D4|        |B8DABE;
    dl sDialogUS_0x024B                                        ;83A2D7|        |B8DC20;
    dl sDialogUS_0x024C                                        ;83A2DA|        |B8DDD6;
    dl sDialogUS_0x024D                                        ;83A2DD|        |B8DE2A;
    dl sDialogUS_0x024E                                        ;83A2E0|        |B8DE94;
    dl sDialogUS_0x024F                                        ;83A2E3|        |B8DF36;
    dl sDialogUS_0x0250                                        ;83A2E6|        |B8DFEE;
    dl sDialogUS_0x0251                                        ;83A2E9|        |B8E028;
    dl sDialogUS_0x0252                                        ;83A2EC|        |B8E06C;
    dl sDialogUS_0x0253                                        ;83A2EF|        |B8E14E;
    dl sDialogUS_0x0254                                        ;83A2F2|        |B8E1D2;
    dl sDialogUS_0x0255                                        ;83A2F5|        |B8E22C;
    dl sDialogUS_0x0256                                        ;83A2F8|        |B8E27E;
    dl sDialogUS_0x0257                                        ;83A2FB|        |B8E308;
    dl sDialogUS_0x0258                                        ;83A2FE|        |B8E340;
    dl sDialogUS_0x0259                                        ;83A301|        |B8E34C;
    dl sDialogUS_0x025A                                        ;83A304|        |B8E3F8;
    dl sDialogUS_0x025B                                        ;83A307|        |B8E456;
    dl sDialogUS_0x025C                                        ;83A30A|        |B8E4C8;
    dl sDialogUS_0x025D                                        ;83A30D|        |B8E594;
    dl sDialogUS_0x025E                                        ;83A310|        |B8E648;
    dl sDialogUS_0x025F                                        ;83A313|        |B8E708;
    dl sDialogUS_0x0260                                        ;83A316|        |B8E724;
    dl sDialogUS_0x0261                                        ;83A319|        |B8E754;
    dl sDialogUS_0x0262                                        ;83A31C|        |B8E784;
    dl sDialogUS_0x0263                                        ;83A31F|        |B8E8A2;
    dl sDialogUS_0x0264                                        ;83A322|        |B8E922;
    dl sDialogUS_0x0265                                        ;83A325|        |B8E9C0;
    dl sDialogUS_0x0266                                        ;83A328|        |B8EA52;
    dl sDialogUS_0x0267                                        ;83A32B|        |B8EA9C;
    dl sDialogUS_0x0268                                        ;83A32E|        |B8EB94;
    dl sDialogUS_0x0269                                        ;83A331|        |B8EBE0;
    dl sDialogUS_0x026A                                        ;83A334|        |B8EC16;
    dl sDialogUS_0x026B                                        ;83A337|        |B8ED30;
    dl sDialogUS_0x026C                                        ;83A33A|        |B8EDEA;
    dl sDialogUS_0x026D                                        ;83A33D|        |B8EDFE;
    dl sDialogUS_0x026E                                        ;83A340|        |B8EE96;
    dl sDialogUS_0x026F                                        ;83A343|        |B8EF96;
    dl sDialogUS_0x0270                                        ;83A346|        |B8F052;
    dl sDialogUS_0x0271                                        ;83A349|        |B8F098;
    dl sDialogUS_0x0272                                        ;83A34C|        |B8F0E8;
    dl sDialogUS_0x0273                                        ;83A34F|        |B8F2FA;
    dl sDialogUS_0x0274                                        ;83A352|        |B8F436;
    dl sDialogUS_0x0275                                        ;83A355|        |B8F61C;
    dl sDialogUS_0x0276                                        ;83A358|        |B8F6D6;
    dl sDialogUS_0x0277                                        ;83A35B|        |B8F71E;
    dl sDialogUS_0x0278                                        ;83A35E|        |B8F7F0;
    dl sDialogUS_0x0279                                        ;83A361|        |B8F836;
    dl sDialogUS_0x027A                                        ;83A364|        |B8F87E;
    dl sDialogUS_0x027B                                        ;83A367|        |B8F8EC;
    dl sDialogUS_0x027C                                        ;83A36A|        |B8FA4E;
    dl sDialogUS_0x027D                                        ;83A36D|        |B8FA96;
    dl sDialogUS_0x027E                                        ;83A370|        |B8FB34;
    dl sDialogUS_0x027F                                        ;83A373|        |B8FBF2;
    dl sDialogUS_0x0280                                        ;83A376|        |B8FC14;
    dl sDialogUS_0x0281                                        ;83A379|        |B8FC66;
    dl sDialogUS_0x0282                                        ;83A37C|        |B8FCCC;
    dl sDialogUS_0x0283                                        ;83A37F|        |B8FD46;
    dl sDialogUS_0x0284                                        ;83A382|        |B8FD9A;
    dl sDialogUS_0x0285                                        ;83A385|        |B8FDF8;
    dl sDialogUS_0x0286                                        ;83A388|        |B8FE22;
    dl sDialogUS_0x0287                                        ;83A38B|        |B8FE46;
    dl sDialogUS_0x0288                                        ;83A38E|        |B8FEAA;
    dl sDialogUS_0x0289                                        ;83A391|        |B8FEF0;
    dl sDialogUS_0x028A                                        ;83A394|        |B98000;
    dl sDialogUS_0x028B                                        ;83A397|        |B980A4;
    dl sDialogUS_0x028C                                        ;83A39A|        |B98138;
    dl sDialogUS_0x028D                                        ;83A39D|        |B981C4;
    dl sDialogUS_0x028E                                        ;83A3A0|        |B982C8;
    dl sDialogUS_0x028F                                        ;83A3A3|        |B9846C;
    dl sDialogUS_0x0290                                        ;83A3A6|        |B9852A;
    dl sDialogUS_0x0291                                        ;83A3A9|        |B9857A;
    dl sDialogUS_0x0292                                        ;83A3AC|        |B98654;
    dl sDialogUS_0x0293                                        ;83A3AF|        |B98732;
    dl sDialogUS_0x0294                                        ;83A3B2|        |B9877A;
    dl sDialogUS_0x0295                                        ;83A3B5|        |B98790;
    dl sDialogUS_0x0296                                        ;83A3B8|        |B987BA;
    dl sDialogUS_0x0297                                        ;83A3BB|        |B988AC;
    dl sDialogUS_0x0298                                        ;83A3BE|        |B9892E;
    dl sDialogUS_0x0299                                        ;83A3C1|        |B98964;
    dl sDialogUS_0x029A                                        ;83A3C4|        |B98988;
    dl sDialogUS_0x029B                                        ;83A3C7|        |B989EE;
    dl sDialogUS_0x029C                                        ;83A3CA|        |B98A3E;
    dl sDialogUS_0x029D                                        ;83A3CD|        |B98A84;
    dl sDialogUS_0x029E                                        ;83A3D0|        |B98B22;
    dl sDialogUS_0x029F                                        ;83A3D3|        |B98B7E;
    dl sDialogUS_0x02A0                                        ;83A3D6|        |B98BCC;
    dl sDialogUS_0x02A1                                        ;83A3D9|        |B98BDA;
    dl sDialogUS_0x02A2                                        ;83A3DC|        |B98C54;
    dl sDialogUS_0x02A3                                        ;83A3DF|        |B98C98;
    dl sDialogUS_0x02A4                                        ;83A3E2|        |B98D1E;
    dl sDialogUS_0x02A5                                        ;83A3E5|        |B98D6C;
    dl sDialogUS_0x02A6                                        ;83A3E8|        |B98DD4;
    dl sDialogUS_0x02A7                                        ;83A3EB|        |B98E78;
    dl sDialogUS_0x02A8                                        ;83A3EE|        |B98EBC;
    dl sDialogUS_0x02A9                                        ;83A3F1|        |B98F04;
    dl sDialogUS_0x02AA                                        ;83A3F4|        |B98FCA;
    dl sDialogUS_0x02AB                                        ;83A3F7|        |B99014;
    dl sDialogUS_0x02AC                                        ;83A3FA|        |B9903C;
    dl sDialogUS_0x02AD                                        ;83A3FD|        |B99148;
    dl sDialogUS_0x02AE                                        ;83A400|        |B99248;
    dl sDialogUS_0x02AF                                        ;83A403|        |B992C6;
    dl sDialogUS_0x02B0                                        ;83A406|        |B99316;
    dl sDialogUS_0x02B1                                        ;83A409|        |B9937A;
    dl sDialogUS_0x02B2                                        ;83A40C|        |B993DA;
    dl sDialogUS_0x02B3                                        ;83A40F|        |B9943C;
    dl sDialogUS_0x02B4                                        ;83A412|        |B9949E;
    dl sDialogUS_0x02B5                                        ;83A415|        |B99534;
    dl sDialogUS_0x02B6                                        ;83A418|        |B99602;
    dl sDialogUS_0x02B7                                        ;83A41B|        |B996EA;
    dl sDialogUS_0x02B8                                        ;83A41E|        |B99756;
    dl sDialogUS_0x02B9                                        ;83A421|        |B9983A;
    dl sDialogUS_0x02BA                                        ;83A424|        |B99882;
    dl sDialogUS_0x02BB                                        ;83A427|        |B99920;
    dl sDialogUS_0x02BC                                        ;83A42A|        |B9999A;
    dl sDialogUS_0x02BD                                        ;83A42D|        |B999DE;
    dl sDialogUS_0x02BE                                        ;83A430|        |B99A64;
    dl sDialogUS_0x02BF                                        ;83A433|        |B99B06;
    dl sDialogUS_0x02C0                                        ;83A436|        |B99CA4;
    dl sDialogUS_0x02C1                                        ;83A439|        |B99D8E;
    dl sDialogUS_0x02C2                                        ;83A43C|        |B99DBA;
    dl sDialogUS_0x02C3                                        ;83A43F|        |B99DD4;
    dl sDialogUS_0x02C4                                        ;83A442|        |B99E2A;
    dl sDialogUS_0x02C5                                        ;83A445|        |B99ECA;
    dl sDialogUS_0x02C6                                        ;83A448|        |B99F26;
    dl sDialogUS_0x02C7                                        ;83A44B|        |B99F56;
    dl sDialogUS_0x02C8                                        ;83A44E|        |B9A020;
    dl sDialogUS_0x02C9                                        ;83A451|        |B9A0D4;
    dl sDialogUS_0x02CA                                        ;83A454|        |B9A128;
    dl sDialogUS_0x02CB                                        ;83A457|        |B9A1C8;
    dl sDialogUS_0x02CC                                        ;83A45A|        |B9A2C2;
    dl sDialogUS_0x02CD                                        ;83A45D|        |B9A350;
    dl sDialogUS_0x02CE                                        ;83A460|        |B9A406;
    dl sDialogUS_0x02CF                                        ;83A463|        |B9A470;
    dl sDialogUS_0x02D0                                        ;83A466|        |B9A538;
    dl sDialogUS_0x02D1                                        ;83A469|        |B9A58E;
    dl sDialogUS_0x02D2                                        ;83A46C|        |B9A5D4;
    dl sDialogUS_0x02D3                                        ;83A46F|        |B9A620;
    dl sDialogUS_0x02D4                                        ;83A472|        |B9A6AC;
    dl sDialogUS_0x02D5                                        ;83A475|        |B9A764;
    dl sDialogUS_0x02D6                                        ;83A478|        |B9A800;
    dl sDialogUS_0x02D7                                        ;83A47B|        |B9A88E;
    dl sDialogUS_0x02D8                                        ;83A47E|        |B9A8FE;
    dl sDialogUS_0x02D9                                        ;83A481|        |B9A954;
    dl sDialogUS_0x02DA                                        ;83A484|        |B9A9A2;
    dl sDialogUS_0x02DB                                        ;83A487|        |B9A9EC;
    dl sDialogUS_0x02DC                                        ;83A48A|        |B9AA70;
    dl sDialogUS_0x02DD                                        ;83A48D|        |B9AA96;
    dl sDialogUS_0x02DE                                        ;83A490|        |B9AC36;
    dl sDialogUS_0x02DF                                        ;83A493|        |B9AC7A;
    dl sDialogUS_0x02E0                                        ;83A496|        |B9ACD2;
    dl sDialogUS_0x02E1                                        ;83A499|        |B9AD22;
    dl sDialogUS_0x02E2                                        ;83A49C|        |B9AD4A;
    dl sDialogUS_0x02E3                                        ;83A49F|        |B9ADA4;
    dl sDialogUS_0x02E4                                        ;83A4A2|        |B9ADDA;
    dl sDialogUS_0x02E5                                        ;83A4A5|        |B9AE28;
    dl sDialogUS_0x02E6                                        ;83A4A8|        |B9AE88;
    dl sDialogUS_0x02E7                                        ;83A4AB|        |B9AEEA;
    dl sDialogUS_0x02E8                                        ;83A4AE|        |B9AF6E;
    dl sDialogUS_0x02E9                                        ;83A4B1|        |B9B016;
    dl sDialogUS_0x02EA                                        ;83A4B4|        |B9B072;
    dl sDialogUS_0x02EB                                        ;83A4B7|        |B9B0F4;
    dl sDialogUS_0x02EC                                        ;83A4BA|        |B9B1A2;
    dl sDialogUS_0x02ED                                        ;83A4BD|        |B9B21E;
    dl sDialogUS_0x02EE                                        ;83A4C0|        |B9B27E;
    dl sDialogUS_0x02EF                                        ;83A4C3|        |B9B2CC;
    dl sDialogUS_0x02F0                                        ;83A4C6|        |B9B32A;
    dl sDialogUS_0x02F1                                        ;83A4C9|        |B9B36E;
    dl sDialogUS_0x02F2                                        ;83A4CC|        |B9B384;
    dl sDialogUS_0x02F3                                        ;83A4CF|        |B9B3DC;
    dl sDialogUS_0x02F4                                        ;83A4D2|        |B9B442;
    dl sDialogUS_0x02F5                                        ;83A4D5|        |B9B4C8;
    dl sDialogUS_0x02F6                                        ;83A4D8|        |B9B534;
    dl sDialogUS_0x02F7                                        ;83A4DB|        |B9B66E;
    dl sDialogUS_0x02F8                                        ;83A4DE|        |B9B6C2;
    dl sDialogUS_0x02F9                                        ;83A4E1|        |B9B6EC;
    dl sDialogUS_0x02FA                                        ;83A4E4|        |B9B740;
    dl sDialogUS_0x02FB                                        ;83A4E7|        |B9B786;
    dl sDialogUS_0x02FC                                        ;83A4EA|        |B9B924;
    dl sDialogUS_0x02FD                                        ;83A4ED|        |B9BA58;
    dl sDialogUS_0x02FE                                        ;83A4F0|        |B9BAAC;
    dl sDialogUS_0x02FF                                        ;83A4F3|        |B9BADC;
    dl sDialogUS_0x0300                                        ;83A4F6|        |B9BB30;
    dl sDialogUS_0x0301                                        ;83A4F9|        |B9BCA0;
    dl sDialogUS_0x0302                                        ;83A4FC|        |B9BE94;
    dl sDialogUS_0x0303                                        ;83A4FF|        |B9BED8;
    dl sDialogUS_0x0304                                        ;83A502|        |B9BEE2;
    dl sDialogUS_0x0305                                        ;83A505|        |B9BF8C;
    dl sDialogUS_0x0306                                        ;83A508|        |B9C056;
    dl sDialogUS_0x0307                                        ;83A50B|        |B9C0B6;
    dl sDialogUS_0x0308                                        ;83A50E|        |B9C1A2;
    dl sDialogUS_0x0309                                        ;83A511|        |B9C1DC;
    dl sDialogUS_0x030A                                        ;83A514|        |B9C256;
    dl sDialogUS_0x030B                                        ;83A517|        |B9C33E;
    dl sDialogUS_0x030C                                        ;83A51A|        |B9C3EA;
    dl sDialogUS_0x030D                                        ;83A51D|        |B9C4D2;
    dl sDialogUS_0x030E                                        ;83A520|        |B9C57E;
    dl sDialogUS_0x030F                                        ;83A523|        |B9C65A;
    dl sDialogUS_0x0310                                        ;83A526|        |B9C68E;
    dl sDialogUS_0x0311                                        ;83A529|        |B9C6DE;
    dl sDialogUS_0x0312                                        ;83A52C|        |B9C7E4;
    dl sDialogUS_0x0313                                        ;83A52F|        |B9C8FA;
    dl sDialogUS_0x0314                                        ;83A532|        |B9C93E;
    dl sDialogUS_0x0315                                        ;83A535|        |B9CAB4;
    dl sDialogUS_0x0316                                        ;83A538|        |B9CB24;
    dl sDialogUS_0x0317                                        ;83A53B|        |B9CC3C;
    dl sDialogUS_0x0318                                        ;83A53E|        |B9CC90;
    dl sDialogUS_0x0319                                        ;83A541|        |B9CCE4;
    dl sDialogUS_0x031A                                        ;83A544|        |B9CD1E;
    dl sDialogUS_0x031B                                        ;83A547|        |B9CDDC;
    dl sDialogUS_0x031C                                        ;83A54A|        |B9CE24;
    dl sDialogUS_0x031D                                        ;83A54D|        |B9CEC8;
    dl sDialogUS_0x031E                                        ;83A550|        |B9CF10;
    dl sDialogUS_0x031F                                        ;83A553|        |B9D08C;
    dl sDialogUS_0x0320                                        ;83A556|        |B9D11E;
    dl sDialogUS_0x0321                                        ;83A559|        |B9D292;
    dl sDialogUS_0x0322                                        ;83A55C|        |B9D326;
    dl sDialogUS_0x0323                                        ;83A55F|        |B9D38E;
    dl sDialogUS_0x0324                                        ;83A562|        |B9D3D2;
    dl sDialogUS_0x0325                                        ;83A565|        |B9D4A0;
    dl sDialogUS_0x0326                                        ;83A568|        |B9D502;
    dl sDialogUS_0x0327                                        ;83A56B|        |B9D536;
    dl sDialogUS_0x0328                                        ;83A56E|        |B9D614;
    dl sDialogUS_0x0329                                        ;83A571|        |B9D6AC;
    dl sDialogUS_0x032A                                        ;83A574|        |B9D72C;
    dl sDialogUS_0x032B                                        ;83A577|        |B9D73E;
    dl sDialogUS_0x032C                                        ;83A57A|        |B9D780;
    dl sDialogUS_0x032D                                        ;83A57D|        |B9D7D8;
    dl sDialogUS_0x032E                                        ;83A580|        |B9D908;
    dl sDialogUS_0x032F                                        ;83A583|        |B9D976;
    dl sDialogUS_0x0330                                        ;83A586|        |B9D9DE;
    dl sDialogUS_0x0331                                        ;83A589|        |B9DAB4;
    dl sDialogUS_0x0332                                        ;83A58C|        |B9DBAE;
    dl sDialogUS_0x0333                                        ;83A58F|        |B9DBDC;
    dl sDialogUS_0x0334                                        ;83A592|        |B9DCCC;
    dl sDialogUS_0x0335                                        ;83A595|        |B9DD46;
    dl sDialogUS_0x0336                                        ;83A598|        |B9DE38;
    dl sDialogUS_0x0337                                        ;83A59B|        |B9DF78;
    dl sDialogUS_0x0338                                        ;83A59E|        |B9E038;
    dl sDialogUS_0x0339                                        ;83A5A1|        |B9E072;
    dl sDialogUS_0x033A                                        ;83A5A4|        |B9E178;
    dl sDialogUS_0x033B                                        ;83A5A7|        |B9E238;
    dl sDialogUS_0x033C                                        ;83A5AA|        |B9E408;
    dl sDialogUS_0x033D                                        ;83A5AD|        |B9E598;
    dl sDialogUS_0x033E                                        ;83A5B0|        |B9E6D2;
    dl sDialogUS_0x033F                                        ;83A5B3|        |B9E868;
    dl sDialogUS_0x0340                                        ;83A5B6|        |B9EA40;
    dl sDialogUS_0x0341                                        ;83A5B9|        |B9EBAA;
    dl sDialogUS_0x0342                                        ;83A5BC|        |B9ED36;
    dl sDialogUS_0x0343                                        ;83A5BF|        |B9EEF8;
    dl sDialogUS_0x0344                                        ;83A5C2|        |B9F09A;
    dl sDialogUS_0x0345                                        ;83A5C5|        |B9F1EC;
    dl sDialogUS_0x0346                                        ;83A5C8|        |B9F338;
    dl sDialogUS_0x0347                                        ;83A5CB|        |B9F4C8;
    dl sDialogUS_0x0348                                        ;83A5CE|        |B9F62C;
    dl sDialogUS_0x0349                                        ;83A5D1|        |B9F75A;
    dl sDialogUS_0x034A                                        ;83A5D4|        |B9F7CA;
    dl sDialogUS_0x034B                                        ;83A5D7|        |B9F822;
    dl sDialogUS_0x034C                                        ;83A5DA|        |B9F88A;
    dl sDialogUS_0x034D                                        ;83A5DD|        |B9F8BA;
    dl sDialogUS_0x034E                                        ;83A5E0|        |B9F8EA;
    dl sDialogUS_0x034F                                        ;83A5E3|        |B9F952;
    dl sDialogUS_0x0350                                        ;83A5E6|        |B9F9C4;
    dl sDialogUS_0x0351                                        ;83A5E9|        |B9FAA6;
    dl sDialogUS_0x0352                                        ;83A5EC|        |B9FB88;
    dl sDialogUS_0x0353                                        ;83A5EF|        |B9FC6A;
    dl sDialogUS_0x0354                                        ;83A5F2|        |B9FD5E;
    dl sDialogUS_0x0355                                        ;83A5F5|        |B9FE82;
    dl sDialogUS_0x0356                                        ;83A5F8|        |BA8000;
    dl sDialogUS_0x0357                                        ;83A5FB|        |BA8112;
    dl sDialogUS_0x0358                                        ;83A5FE|        |BA8218;
    dl sDialogUS_0x0359                                        ;83A601|        |BA82EE;
    dl sDialogUS_0x035A                                        ;83A604|        |BA8446;
    dl sDialogUS_0x035B                                        ;83A607|        |BA8546;
    dl sDialogUS_0x035C                                        ;83A60A|        |BA866A;
    dl sDialogUS_0x035D                                        ;83A60D|        |BA8782;
    dl sDialogUS_0x035E                                        ;83A610|        |BA88D2;
    dl sDialogUS_0x035F                                        ;83A613|        |BA89E4;
    dl sDialogUS_0x0360                                        ;83A616|        |BA89F8;
    dl sDialogUS_0x0361                                        ;83A619|        |BA8B92;
    dl sDialogUS_0x0362                                        ;83A61C|        |BA8BE6;
    dl sDialogUS_0x0363                                        ;83A61F|        |BA8C66;
    dl sDialogUS_0x0364                                        ;83A622|        |BA8CD2;
    dl sDialogUS_0x0365                                        ;83A625|        |BA8D54;
    dl sDialogUS_0x0366                                        ;83A628|        |BA8DE6;
    dl sDialogUS_0x0367                                        ;83A62B|        |BA8E4A;
    dl sDialogUS_0x0368                                        ;83A62E|        |BA8EE8;
    dl sDialogUS_0x0369                                        ;83A631|        |BA8F7E;
    dl sDialogUS_0x036A                                        ;83A634|        |BA9014;
    dl sDialogUS_0x036B                                        ;83A637|        |BA9098;
    dl sDialogUS_0x036C                                        ;83A63A|        |BA90F2;
    dl sDialogUS_0x036D                                        ;83A63D|        |BA914E;
    dl sDialogUS_0x036E                                        ;83A640|        |BA9192;
    dl sDialogUS_0x036F                                        ;83A643|        |BA91CA;
    dl sDialogUS_0x0370                                        ;83A646|        |BA91E6;
    dl sDialogUS_0x0371                                        ;83A649|        |BA9218;
    dl sDialogUS_0x0372                                        ;83A64C|        |BA92AA;
    dl sDialogUS_0x0373                                        ;83A64F|        |BA9314;
    dl sDialogUS_0x0374                                        ;83A652|        |BA941E;
    dl sDialogUS_0x0375                                        ;83A655|        |BA9528;
    dl sDialogUS_0x0376                                        ;83A658|        |BA95C0;
    dl sDialogUS_0x0377                                        ;83A65B|        |BA963C;
    dl sDialogUS_0x0378                                        ;83A65E|        |BA9682;
    dl sDialogUS_0x0379                                        ;83A661|        |BA96BC;
    dl sDialogUS_0x037A                                        ;83A664|        |BA96EE;
    dl sDialogUS_0x037B                                        ;83A667|        |BA9752;
    dl sDialogUS_0x037C                                        ;83A66A|        |BA979A;
    dl sDialogUS_0x037D                                        ;83A66D|        |BA982C;
    dl sDialogUS_0x037E                                        ;83A670|        |BA9860;
    dl sDialogUS_0x037F                                        ;83A673|        |BA98A4;
    dl sDialogUS_0x0380                                        ;83A676|        |BA98F4;
    dl sDialogUS_0x0381                                        ;83A679|        |BA9938;
    dl sDialogUS_0x0382                                        ;83A67C|        |BA99C4;
    dl sDialogUS_0x0383                                        ;83A67F|        |BA99F0;
    dl sDialogUS_0x0384                                        ;83A682|        |BA9A5A;
    dl sDialogUS_0x0385                                        ;83A685|        |BA9B0E;
    dl sDialogUS_0x0386                                        ;83A688|        |BA9B3C;
    dl sDialogUS_0x0387                                        ;83A68B|        |BA9B66;
    dl sDialogUS_0x0388                                        ;83A68E|        |BA9C00;
    dl sDialogUS_0x0389                                        ;83A691|        |BA9C24;
    dl sDialogUS_0x038A                                        ;83A694|        |BA9C5C;
    dl sDialogUS_0x038B                                        ;83A697|        |BA9D1A;
    dl sDialogUS_0x038C                                        ;83A69A|        |BA9DB6;
    dl sDialogUS_0x038D                                        ;83A69D|        |BA9E5A;
    dl sDialogUS_0x038E                                        ;83A6A0|        |BA9E6E;
    dl sDialogUS_0x038F                                        ;83A6A3|        |BA9E9C;
    dl sDialogUS_0x0390                                        ;83A6A6|        |BA9F38;
    dl sDialogUS_0x0391                                        ;83A6A9|        |BA9F70;
    dl sDialogUS_0x0392                                        ;83A6AC|        |BA9FBC;
    dl sDialogUS_0x0393                                        ;83A6AF|        |BA9FE4;
    dl sDialogUS_0x0394                                        ;83A6B2|        |BAA0DC;
    dl sDialogUS_0x0395                                        ;83A6B5|        |BAA1B0;
    dl sDialogUS_0x0396                                        ;83A6B8|        |BAA240;
    dl sDialogUS_0x0397                                        ;83A6BB|        |BAA2C4;
    dl sDialogUS_0x0398                                        ;83A6BE|        |BAA438;
    dl sDialogUS_0x0399                                        ;83A6C1|        |BAA4CC;
    dl sDialogUS_0x039A                                        ;83A6C4|        |BAA56E;
    dl sDialogUS_0x039B                                        ;83A6C7|        |BAA5CE;
    dl sDialogUS_0x039C                                        ;83A6CA|        |BAA676;
    dl sDialogUS_0x039D                                        ;83A6CD|        |BAA74C;
    dl sDialogUS_0x039E                                        ;83A6D0|        |BAA7F2;
    dl sDialogUS_0x039F                                        ;83A6D3|        |BAA968;
    dl sDialogUS_0x03A0                                        ;83A6D6|        |BAA9B2;
    dl sDialogUS_0x03A1                                        ;83A6D9|        |BAAA52;
    dl sDialogUS_0x03A2                                        ;83A6DC|        |BAAA64;
    dl sDialogUS_0x03A3                                        ;83A6DF|        |BAAB0A;
    dl sDialogUS_0x03A4                                        ;83A6E2|        |BAAB56;
    dl sDialogUS_0x03A5                                        ;83A6E5|        |BAABA0;
    dl sDialogUS_0x03A6                                        ;83A6E8|        |BAAE0C;
    dl sDialogUS_0x03A7                                        ;83A6EB|        |BAAE12;
    dl sDialogUS_0x03A8                                        ;83A6EE|        |BAAE1A;
    dl sDialogUS_0x03A9                                        ;83A6F1|        |BAAE24;
    dl sDialogUS_0x03AA                                        ;83A6F4|        |BAAE30;
    dl sDialogUS_0x03AB                                        ;83A6F7|        |BAAE3E;
    dl sDialogUS_0x03AC                                        ;83A6FA|        |BAAE4E;
    dl sDialogUS_0x03AD                                        ;83A6FD|        |BAAE60;
    dl sDialogUS_0x03AE                                        ;83A700|        |BAAE74;
    dl sDialogUS_0x03AF                                        ;83A703|        |BAAE8A;
    dl sDialogUS_0x03B0                                        ;83A706|        |BAAEA2;
    dl sDialogUS_0x03B1                                        ;83A709|        |BAAECA;
    dl sDialogUS_0x03B2                                        ;83A70C|        |BAAF3A;
    dl sDialogUS_0x03B3                                        ;83A70F|        |BAAF88;
    dl sDialogUS_0x03B4                                        ;83A712|        |BAAFDC;
    dl sDialogUS_0x03B5                                        ;83A715|        |BAB02E;
    dl sDialogUS_0x03B6                                        ;83A718|        |BAB0B4;
    dl sDialogUS_0x03B7                                        ;83A71B|        |BAB15E;
    dl sDialogUS_0x03B8                                        ;83A71E|        |BAB200;
    dl sDialogUS_0x03B9                                        ;83A721|        |BAB222;
    dl sDialogUS_0x03BA                                        ;83A724|        |BAB250;
    dl sDialogUS_0x03BB                                        ;83A727|        |BAB26C;
    dl sDialogUS_0x03BC                                        ;83A72A|        |BAB2B8;
    dl sDialogUS_0x03BD                                        ;83A72D|        |BAB2F0;
    dl sDialogUS_0x03BE                                        ;83A730|        |BAB344;
    dl sDialogUS_0x03BF                                        ;83A733|        |BAB40A;
    dl sDialogUS_0x03C0                                        ;83A736|        |BAB4AC;
    dl sDialogUS_0x03C1                                        ;83A739|        |BAB52E;
    dl sDialogUS_0x03C2                                        ;83A73C|        |BAB58A;
    dl sDialogUS_0x03C3                                        ;83A73F|        |BAB63A;
    dl sDialogUS_0x03C4                                        ;83A742|        |BAB706;
    dl sDialogUS_0x03C5                                        ;83A745|        |BAB7B8;
    dl sDialogUS_0x03C6                                        ;83A748|        |BAB86A;
    dl sDialogUS_0x03C7                                        ;83A74B|        |BAB90E;
    dl sDialogUS_0x03C8                                        ;83A74E|        |BAB9CE;
    dl sDialogUS_0x03C9                                        ;83A751|        |BABAE8;
    dl sDialogUS_0x03CA                                        ;83A754|        |BABBE0;
    dl sDialogUS_0x03CB                                        ;83A757|        |BABC28;
    dl sDialogUS_0x03CC                                        ;83A75A|        |BABD56;
    dl sDialogUS_0x03CD                                        ;83A75D|        |BABE00;
    dl sDialogUS_0x03CE                                        ;83A760|        |BABED4;
    dl sDialogUS_0x03CF                                        ;83A763|        |BABF26;
    dl sDialogUS_0x03D0                                        ;83A766|        |BAC05A;
    dl sDialogUS_0x03D1                                        ;83A769|        |BAC130;
    dl sDialogUS_0x03D2                                        ;83A76C|        |BAC204;
    dl sDialogUS_0x03D3                                        ;83A76F|        |BAC2E2;
    dl sDialogUS_0x03D4                                        ;83A772|        |BAC372;
    dl sDialogUS_0x03D5                                        ;83A775|        |BAC40A;
    dl sDialogUS_0x03D6                                        ;83A778|        |BAC474;
    dl sDialogUS_0x03D7                                        ;83A77B|        |BAC4C4;
    dl sDialogUS_0x03D8                                        ;83A77E|        |BAC54A;
    dl sDialogUS_0x03D9                                        ;83A781|        |BAC62A;
    dl sDialogUS_0x03DA                                        ;83A784|        |BAC64A;
    dl sDialogUS_0x03DB                                        ;83A787|        |BAC702;
    dl sDialogUS_0x03DC                                        ;83A78A|        |BAC786;
    dl sDialogUS_0x03DD                                        ;83A78D|        |BAC84C;
    dl sDialogUS_0x03DE                                        ;83A790|        |BAC8DE;
    dl sDialogUS_0x03DF                                        ;83A793|        |BAC982;
    dl sDialogUS_0x03E0                                        ;83A796|        |BACA62;
    dl sDialogUS_0x03E1                                        ;83A799|        |BACAA6;
    dl sDialogUS_0x03E2                                        ;83A79C|        |BACB24;
    dl sDialogUS_0x03E3                                        ;83A79F|        |BACBA8;
    dl sDialogUS_0x03E4                                        ;83A7A2|        |BACBEC;
    dl sDialogUS_0x03E5                                        ;83A7A5|        |BACC46;
    dl sDialogUS_0x03E6                                        ;83A7A8|        |BACD7E;
    dl sDialogUS_0x03E7                                        ;83A7AB|        |BACE88;
    dl sDialogUS_0x03E8                                        ;83A7AE|        |BACFA8;
    dl sDialogUS_0x03E9                                        ;83A7B1|        |BAD0A4;
    dl sDialogUS_0x03EA                                        ;83A7B4|        |BAD0FC;
    dl sDialogUS_0x03EB                                        ;83A7B7|        |BAD150;
    dl sDialogUS_0x03EC                                        ;83A7BA|        |BAD1B0;
    dl sDialogUS_0x03ED                                        ;83A7BD|        |BAD1F6;
    dl sDialogUS_0x03EE                                        ;83A7C0|        |BAD25E;
    dl sDialogUS_0x03EF                                        ;83A7C3|        |BAD2AC;
    dl sDialogUS_0x03F0                                        ;83A7C6|        |BAD344;
    dl sDialogUS_0x03F1                                        ;83A7C9|        |BAD3D4;
    dl sDialogUS_0x03F2                                        ;83A7CC|        |BAD436;
    dl sDialogUS_0x03F3                                        ;83A7CF|        |BAD4F6;
    dl sDialogUS_0x03F4                                        ;83A7D2|        |BAD57A;
    dl sDialogUS_0x03F5                                        ;83A7D5|        |BAD5D8;
    dl sDialogUS_0x03F6                                        ;83A7D8|        |BAD67C;
    dl sDialogUS_0x03F7                                        ;83A7DB|        |BAD700;
    dl sDialogUS_0x03F8                                        ;83A7DE|        |BAD772;
    dl sDialogUS_0x03F9                                        ;83A7E1|        |BAD844;
    dl sDialogUS_0x03FA                                        ;83A7E4|        |BAD8E6;
    dl sDialogUS_0x03FB                                        ;83A7E7|        |BAD984;
    dl sDialogUS_0x03FC                                        ;83A7EA|        |BAD9F2;
    dl sDialogUS_0x03FD                                        ;83A7ED|        |BADA8E;
    dl sDialogUS_0x03FE                                        ;83A7F0|        |BADB66;
    dl sDialogUS_0x03FF                                        ;83A7F3|        |BADC24;
    dl sDialogUS_0x0400                                        ;83A7F6|        |BADCC8;
    dl sDialogUS_0x0401                                        ;83A7F9|        |BADD22;
    dl sDialogUS_0x0402                                        ;83A7FC|        |BADD8E;
    dl sDialogUS_0x0403                                        ;83A7FF|        |BADE08;
    dl sDialogUS_0x0404                                        ;83A802|        |BADE6A;
    dl sDialogUS_0x0405                                        ;83A805|        |BADEBC;
    dl sDialogUS_0x0406                                        ;83A808|        |BADF26;
    dl sDialogUS_0x0407                                        ;83A80B|        |BADFB2;
    dl sDialogUS_0x0408                                        ;83A80E|        |BAE04C;
    dl sDialogUS_0x0409                                        ;83A811|        |BAE12A;
    dl sDialogUS_0x040A                                        ;83A814|        |BAE1C0;
    dl sDialogUS_0x040B                                        ;83A817|        |BAE280;
    dl sDialogUS_0x040C                                        ;83A81A|        |BAE2D4;
    dl sDialogUS_0x040D                                        ;83A81D|        |BAE39A;
    dl sDialogUS_0x040E                                        ;83A820|        |BAE400;
    dl sDialogUS_0x040F                                        ;83A823|        |BAE4B6;
    dl sDialogUS_0x0410                                        ;83A826|        |BAE51C;
    dl sDialogUS_0x0411                                        ;83A829|        |BAE552;
    dl sDialogUS_0x0412                                        ;83A82C|        |BAE636;
    dl sDialogUS_0x0413                                        ;83A82F|        |BAE6B6;
    dl sDialogUS_0x0414                                        ;83A832|        |BAE712;
    dl sDialogUS_0x0415                                        ;83A835|        |BAE76C;
    dl sDialogUS_0x0416                                        ;83A838|        |BAE83E;
    dl sDialogUS_0x0417                                        ;83A83B|        |BAE8A8;
    dl sDialogUS_0x0418                                        ;83A83E|        |BAE948;
    dl sDialogUS_0x0419                                        ;83A841|        |BAE96E;
    dl sDialogUS_0x041A                                        ;83A844|        |BAE9C8;
    dl sDialogUS_0x041B                                        ;83A847|        |BAEA28;
    dl sDialogUS_0x041C                                        ;83A84A|        |BAEA88;
    dl sDialogUS_0x041D                                        ;83A84D|        |BAEA9A;
    dl sDialogUS_0x041E                                        ;83A850|        |BAEB3A;
    dl sDialogUS_0x041F                                        ;83A853|        |BAEBA2;
    dl sDialogUS_0x0420                                        ;83A856|        |BAEBEE;
    dl sDialogUS_0x0421                                        ;83A859|        |BAECAA;
    dl sDialogUS_0x0422                                        ;83A85C|        |BAECEE;
    dl sDialogUS_0x0423                                        ;83A85F|        |BAED90;
    dl sDialogUS_0x0424                                        ;83A862|        |BAEDF2;
    dl sDialogUS_0x0425                                        ;83A865|        |BAEE50;
    dl sDialogUS_0x0426                                        ;83A868|        |BAEEA4;
    dl sDialogUS_0x0427                                        ;83A86B|        |BAEF56;
    dl sDialogUS_0x0428                                        ;83A86E|        |BAEFC2;
    dl sDialogUS_0x0429                                        ;83A871|        |BAF05A;
    dl sDialogUS_0x042A                                        ;83A874|        |BAF088;
    dl sDialogUS_0x042B                                        ;83A877|        |BAF13A;
    dl sDialogUS_0x042C                                        ;83A87A|        |BAF27A;
    dl sDialogUS_0x042D                                        ;83A87D|        |BAF2F6;
    dl sDialogUS_0x042E                                        ;83A880|        |BAF39C;
    dl sDialogUS_0x042F                                        ;83A883|        |BAF406;
    dl sDialogUS_0x0430                                        ;83A886|        |BAF44A;
    dl sDialogUS_0x0431                                        ;83A889|        |BAF4DC;
    dl sDialogUS_0x0432                                        ;83A88C|        |BAF598;
    dl sDialogUS_0x0433                                        ;83A88F|        |BAF608;
    dl sDialogUS_0x0434                                        ;83A892|        |BAF7C4;
    dl sDialogUS_0x0435                                        ;83A895|        |BAF832;
    dl sDialogUS_0x0436                                        ;83A898|        |BAF8E6;
    dl sDialogUS_0x0437                                        ;83A89B|        |BAF9EE;
    dl sDialogUS_0x0438                                        ;83A89E|        |BAFADE;
    dl sDialogUS_0x0439                                        ;83A8A1|        |BAFB7C;
    dl sDialogUS_0x043A                                        ;83A8A4|        |BAFC68;
    dl sDialogUS_0x043B                                        ;83A8A7|        |BAFD24;
    dl sDialogUS_0x043C                                        ;83A8AA|        |BAFE96;
    dl sDialogUS_0x043D                                        ;83A8AD|        |BAFF06;
    dl sDialogUS_0x043E                                        ;83A8B0|        |BB8000;
    dl sDialogUS_0x043F                                        ;83A8B3|        |BB812A;
    dl sDialogUS_0x0440                                        ;83A8B6|        |BB8260;
    dl sDialogUS_0x0441                                        ;83A8B9|        |BB83AC;
    dl sDialogUS_0x0442                                        ;83A8BC|        |BB8548;
    dl sDialogUS_0x0443                                        ;83A8BF|        |BB8570;
    dl sDialogUS_0x0444                                        ;83A8C2|        |BB85C6;
    dl sDialogUS_0x0445                                        ;83A8C5|        |BB85E0;
    dl sDialogUS_0x0446                                        ;83A8C8|        |BB8634;
    dl sDialogUS_0x0447                                        ;83A8CB|        |BB864E;
    dl sDialogUS_0x0448                                        ;83A8CE|        |BB8698;
    dl sDialogUS_0x0449                                        ;83A8D1|        |BB86BC;
    dl sDialogUS_0x044A                                        ;83A8D4|        |BB86E0;
    dl sDialogUS_0x044B                                        ;83A8D7|        |BB8704;
    dl sDialogUS_0x044C                                        ;83A8DA|        |BB8728;
    dl sDialogUS_0x044D                                        ;83A8DD|        |BB874C;
    dl sDialogUS_0x044E                                        ;83A8E0|        |BB878E;
    dl sDialogUS_0x044F                                        ;83A8E3|        |BB87D0;
    dl sDialogUS_0x0450                                        ;83A8E6|        |BB8812;
    dl sDialogUS_0x0451                                        ;83A8E9|        |BB8854;
    dl sDialogUS_0x0452                                        ;83A8EC|        |BB886C;
    dl sDialogUS_0x0453                                        ;83A8EF|        |BB8890;
    dl sDialogUS_0x0454                                        ;83A8F2|        |BB88E0;
    dl sDialogUS_0x0455                                        ;83A8F5|        |BB8908;
    dl sDialogUS_0x0456                                        ;83A8F8|        |BB89B6;
    dl sDialogUS_0x0457                                        ;83A8FB|        |BB8BF6;
    dl sDialogUS_0x0458                                        ;83A8FE|        |BB8DD0;
    dl sDialogUS_0x0459                                        ;83A901|        |BB8F0E;
    dl sDialogUS_0x045A                                        ;83A904|        |BB8FB2;
    dl sDialogUS_0x045B                                        ;83A907|        |BB9280;
    dl sDialogUS_0x045C                                        ;83A90A|        |BB9454;
    dl sDialogUS_0x045D                                        ;83A90D|        |BB95BA;
    dl sDialogUS_0x045E                                        ;83A910|        |BB978C;
    dl sDialogUS_0x045F                                        ;83A913|        |BB9932;
    dl sDialogUS_0x0460                                        ;83A916|        |BB99DC;
    dl sDialogUS_0x0461                                        ;83A919|        |BB9AFE;
    dl sDialogUS_0x0462                                        ;83A91C|        |BB9B82;
    dl sDialogUS_0x0463                                        ;83A91F|        |BB9D32;
    dl sDialogUS_0x0464                                        ;83A922|        |BB9E42;
    dl sDialogUS_0x0465                                        ;83A925|        |BB9FA4;
    dl sDialogUS_0x0466                                        ;83A928|        |BBA138;
    dl sDialogUS_0x0467                                        ;83A92B|        |BBA2C0;
    dl sDialogUS_0x0468                                        ;83A92E|        |BBA30A;
    dl sDialogUS_0x0469                                        ;83A931|        |BBA370;
    dl sDialogUS_0x046A                                        ;83A934|        |BBA3F2;
    dl sDialogUS_0x046B                                        ;83A937|        |BBA436;
    dl sDialogUS_0x046C                                        ;83A93A|        |BBA514;
    dl sDialogUS_0x046D                                        ;83A93D|        |BBA590;
    dl sDialogUS_0x046E                                        ;83A940|        |BBA60C;
    dl sDialogUS_0x046F                                        ;83A943|        |BBA688;
    dl sDialogUS_0x0470                                        ;83A946|        |BBA704;
    dl sDialogUS_0x0471                                        ;83A949|        |BBA79A;
    dl sDialogUS_0x0472                                        ;83A94C|        |BBA832;
    dl sDialogUS_0x0473                                        ;83A94F|        |BBA8AE;
    dl sDialogUS_0x0474                                        ;83A952|        |BBA92A;
    dl sDialogUS_0x0475                                        ;83A955|        |BBA9DE;
    dl sDialogUS_0x0476                                        ;83A958|        |BBAA86;
    dl sDialogUS_0x0477                                        ;83A95B|        |BBAB1A;
    dl sDialogUS_0x0478                                        ;83A95E|        |BBAC02;
    dl sDialogUS_0x0479                                        ;83A961|        |BBACEC;
    dl sDialogUS_0x047A                                        ;83A964|        |BBAE80;
    dl sDialogUS_0x047B                                        ;83A967|        |BBAF44;
    dl sDialogUS_0x047C                                        ;83A96A|        |BBAFAE;
    dl sDialogUS_0x047D                                        ;83A96D|        |BBB034;
    dl sDialogUS_0x047E                                        ;83A970|        |BBB0A6;
    dl sDialogUS_0x047F                                        ;83A973|        |BBB14E;
    dl sDialogUS_0x0480                                        ;83A976|        |BBB248;
    dl sDialogUS_0x0481                                        ;83A979|        |BBB2A2;
    dl sDialogUS_0x0482                                        ;83A97C|        |BBB2D6;
    dl sDialogUS_0x0483                                        ;83A97F|        |BBB384;
    dl sDialogUS_0x0484                                        ;83A982|        |BBB3EE;
    dl sDialogUS_0x0485                                        ;83A985|        |BBB46A;
    dl sDialogUS_0x0486                                        ;83A988|        |BBB4B6;
    dl sDialogUS_0x0487                                        ;83A98B|        |BBB5A4;
    dl sDialogUS_0x0488                                        ;83A98E|        |BBB640;
    dl sDialogUS_0x0489                                        ;83A991|        |BBB692;
    dl sDialogUS_0x048A                                        ;83A994|        |BBB700;
    dl sDialogUS_0x048B                                        ;83A997|        |BBB78E;
    dl sDialogUS_0x048C                                        ;83A99A|        |BBB832;
    dl sDialogUS_0x048D                                        ;83A99D|        |BBB86A;
    dl sDialogUS_0x048E                                        ;83A9A0|        |BBB8D8;
    dl sDialogUS_0x048F                                        ;83A9A3|        |BBB958;
    dl sDialogUS_0x0490                                        ;83A9A6|        |BBB9FE;
    dl sDialogUS_0x0491                                        ;83A9A9|        |BBBA30;
    dl sDialogUS_0x0492                                        ;83A9AC|        |BBBAB4;
    dl sDialogUS_0x0493                                        ;83A9AF|        |BBBB44;
    dl sDialogUS_0x0494                                        ;83A9B2|        |BBBBA2;
    dl sDialogUS_0x0495                                        ;83A9B5|        |BBBC44;
    dl sDialogUS_0x0496                                        ;83A9B8|        |BBBCBC;
    dl sDialogUS_0x0497                                        ;83A9BB|        |BBBD54;
    endif
