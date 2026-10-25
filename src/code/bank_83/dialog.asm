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
    elseif !REGION_JP
    db $B1,$08,$80,$02,$B3,$08,$80,$02,$B1,$08,$80,$02,$B3,$08,$80,$02
    db $B1,$08,$80,$02,$B3,$08,$80,$02,$B1,$08,$80,$02,$B3,$08,$80,$02
    db $B1,$08,$80,$02,$B3,$08,$80,$02,$B1,$08,$80,$02,$B3,$08,$80,$02
    db $B1,$08,$80,$02,$B3,$08,$80,$02,$B1,$08,$80,$02,$B3,$08,$80,$02
    db $B1,$08,$80,$02,$B3,$08,$80,$02,$B1,$08,$80,$02,$B3,$08,$80,$02
    db $B1,$08,$80,$02,$B3,$08,$80,$02,$B1,$08,$80,$02,$B3,$08,$80,$02
    db $B1,$08,$80,$02,$B3,$08,$80,$02,$B1,$08,$80,$02,$B3,$08,$80,$02
    db $B1,$08,$80,$02,$B3,$08,$80,$02,$B5,$08,$80,$08
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
    endif
aDialogPointers:
    dl sDialog_0x0000
    dl sDialog_0x0001
    dl sDialog_0x0002
    dl sDialog_0x0003
    dl sDialog_0x0004
    dl sDialog_0x0005
    dl sDialog_0x0006
    dl sDialog_0x0007
    dl sDialog_0x0008
    dl sDialog_0x0009
    dl sDialog_0x000A
    dl sDialog_0x000B
    dl sDialog_0x000C
    dl sDialog_0x000D
    dl sDialog_0x000E
    dl sDialog_0x000F
    dl sDialog_0x0010
    dl sDialog_0x0011
    dl sDialog_0x0012
    dl sDialog_0x0013
    dl sDialog_0x0014
    dl sDialog_0x0015
    dl sDialog_0x0016
    dl sDialog_0x0017
    dl sDialog_0x0018
    dl sDialog_0x0019
    dl sDialog_0x001A
    dl sDialog_0x001B
    dl sDialog_0x001C
    dl sDialog_0x001D
    dl sDialog_0x001E
    dl sDialog_0x001F
    dl sDialog_0x0020
    dl sDialog_0x0021
    dl sDialog_0x0022
    dl sDialog_0x0023
    dl sDialog_0x0024
    dl sDialog_0x0025
    dl sDialog_0x0026
    dl sDialog_0x0027
    dl sDialog_0x0028
    dl sDialog_0x0029
    dl sDialog_0x002A
    dl sDialog_0x002B
    dl sDialog_0x002C
    dl sDialog_0x002D
    dl sDialog_0x002E
    dl sDialog_0x002F
    dl sDialog_0x0030
    dl sDialog_0x0031
    dl sDialog_0x0032
    dl sDialog_0x0033
    dl sDialog_0x0034
    dl sDialog_0x0035
    dl sDialog_0x0036
    dl sDialog_0x0037
    dl sDialog_0x0038
    dl sDialog_0x0039
    dl sDialog_0x003A
    dl sDialog_0x003B
    dl sDialog_0x003C
    dl sDialog_0x003D
    dl sDialog_0x003E
    dl sDialog_0x003F
    dl sDialog_0x0040
    dl sDialog_0x0041
    dl sDialog_0x0042
    dl sDialog_0x0043
    dl sDialog_0x0044
    dl sDialog_0x0045
    dl sDialog_0x0046
    dl sDialog_0x0047
    dl sDialog_0x0048
    dl sDialog_0x0049
    dl sDialog_0x004A
    dl sDialog_0x004B
    dl sDialog_0x004C
    dl sDialog_0x004D
    dl sDialog_0x004E
    dl sDialog_0x004F
    dl sDialog_0x0050
    dl sDialog_0x0051
    dl sDialog_0x0052
    dl sDialog_0x0053
    dl sDialog_0x0054
    dl sDialog_0x0055
    dl sDialog_0x0056
    dl sDialog_0x0057
    dl sDialog_0x0058
    dl sDialog_0x0059
    dl sDialog_0x005A
    dl sDialog_0x005B
    dl sDialog_0x005C
    dl sDialog_0x005D
    dl sDialog_0x005E
    dl sDialog_0x005F
    dl sDialog_0x0060
    dl sDialog_0x0061
    dl sDialog_0x0062
    dl sDialog_0x0063
    dl sDialog_0x0064
    dl sDialog_0x0065
    dl sDialog_0x0066
    dl sDialog_0x0067
    dl sDialog_0x0068
    dl sDialog_0x0069
    dl sDialog_0x006A
    dl sDialog_0x006B
    dl sDialog_0x006C
    dl sDialog_0x006D
    dl sDialog_0x006E
    dl sDialog_0x006F
    dl sDialog_0x0070
    dl sDialog_0x0071
    dl sDialog_0x0072
    dl sDialog_0x0073
    dl sDialog_0x0074
    dl sDialog_0x0075
    dl sDialog_0x0076
    dl sDialog_0x0077
    dl sDialog_0x0078
    dl sDialog_0x0079
    dl sDialog_0x007A
    dl sDialog_0x007B
    dl sDialog_0x007C
    dl sDialog_0x007D
    dl sDialog_0x007E
    dl sDialog_0x007F
    dl sDialog_0x0080
    dl sDialog_0x0081
    dl sDialog_0x0082
    dl sDialog_0x0083
    dl sDialog_0x0084
    dl sDialog_0x0085
    dl sDialog_0x0086
    dl sDialog_0x0087
    dl sDialog_0x0088
    dl sDialog_0x0089
    dl sDialog_0x008A
    dl sDialog_0x008B
    dl sDialog_0x008C
    dl sDialog_0x008D
    dl sDialog_0x008E
    dl sDialog_0x008F
    dl sDialog_0x0090
    dl sDialog_0x0091
    dl sDialog_0x0092
    dl sDialog_0x0093
    dl sDialog_0x0094
    dl sDialog_0x0095
    dl sDialog_0x0096
    dl sDialog_0x0097
    dl sDialog_0x0098
    dl sDialog_0x0099
    dl sDialog_0x009A
    dl sDialog_0x009B
    dl sDialog_0x009C
    dl sDialog_0x009D
    dl sDialog_0x009E
    dl sDialog_0x009F
    dl sDialog_0x00A0
    dl sDialog_0x00A1
    dl sDialog_0x00A2
    dl sDialog_0x00A3
    dl sDialog_0x00A4
    dl sDialog_0x00A5
    dl sDialog_0x00A6
    dl sDialog_0x00A7
    dl sDialog_0x00A8
    dl sDialog_0x00A9
    dl sDialog_0x00AA
    dl sDialog_0x00AB
    dl sDialog_0x00AC
    dl sDialog_0x00AD
    dl sDialog_0x00AE
    dl sDialog_0x00AF
    dl sDialog_0x00B0
    dl sDialog_0x00B1
    dl sDialog_0x00B2
    dl sDialog_0x00B3
    dl sDialog_0x00B4
    dl sDialog_0x00B5
    dl sDialog_0x00B6
    dl sDialog_0x00B7
    dl sDialog_0x00B8
    dl sDialog_0x00B9
    dl sDialog_0x00BA
    dl sDialog_0x00BB
    dl sDialog_0x00BC
    dl sDialog_0x00BD
    dl sDialog_0x00BE
    dl sDialog_0x00BF
    dl sDialog_0x00C0
    dl sDialog_0x00C1
    dl sDialog_0x00C2
    dl sDialog_0x00C3
    dl sDialog_0x00C4
    dl sDialog_0x00C5
    dl sDialog_0x00C6
    dl sDialog_0x00C7
    dl sDialog_0x00C8
    dl sDialog_0x00C9
    dl sDialog_0x00CA
    dl sDialog_0x00CB
    dl sDialog_0x00CC
    dl sDialog_0x00CD
    dl sDialog_0x00CE
    dl sDialog_0x00CF
    dl sDialog_0x00D0
    dl sDialog_0x00D1
    dl sDialog_0x00D2
    dl sDialog_0x00D3
    dl sDialog_0x00D4
    dl sDialog_0x00D5
    dl sDialog_0x00D6
    dl sDialog_0x00D7
    dl sDialog_0x00D8
    dl sDialog_0x00D9
    dl sDialog_0x00DA
    dl sDialog_0x00DB
    dl sDialog_0x00DC
    dl sDialog_0x00DD
    dl sDialog_0x00DE
    dl sDialog_0x00DF
    dl sDialog_0x00E0
    dl sDialog_0x00E1
    dl sDialog_0x00E2
    dl sDialog_0x00E3
    dl sDialog_0x00E4
    dl sDialog_0x00E5
    dl sDialog_0x00E6
    dl sDialog_0x00E7
    dl sDialog_0x00E8
    dl sDialog_0x00E9
    dl sDialog_0x00EA
    dl sDialog_0x00EB
    dl sDialog_0x00EC
    dl sDialog_0x00ED
    dl sDialog_0x00EE
    dl sDialog_0x00EF
    dl sDialog_0x00F0
    dl sDialog_0x00F1
    dl sDialog_0x00F2
    dl sDialog_0x00F3
    dl sDialog_0x00F4
    dl sDialog_0x00F5
    dl sDialog_0x00F6
    dl sDialog_0x00F7
    dl sDialog_0x00F8
    dl sDialog_0x00F9
    dl sDialog_0x00FA
    dl sDialog_0x00FB
    dl sDialog_0x00FC
    dl sDialog_0x00FD
    dl sDialog_0x00FE
    dl sDialog_0x00FF
    dl sDialog_0x0100
    dl sDialog_0x0101
    dl sDialog_0x0102
    dl sDialog_0x0103
    dl sDialog_0x0104
    dl sDialog_0x0105
    dl sDialog_0x0106
    dl sDialog_0x0107
    dl sDialog_0x0108
    dl sDialog_0x0109
    dl sDialog_0x010A
    dl sDialog_0x010B
    dl sDialog_0x010C
    dl sDialog_0x010D
    dl sDialog_0x010E
    dl sDialog_0x010F
    dl sDialog_0x0110
    dl sDialog_0x0111
    dl sDialog_0x0112
    dl sDialog_0x0113
    dl sDialog_0x0114
    dl sDialog_0x0115
    dl sDialog_0x0116
    dl sDialog_0x0117
    dl sDialog_0x0118
    dl sDialog_0x0119
    dl sDialog_0x011A
    dl sDialog_0x011B
    dl sDialog_0x011C
    dl sDialog_0x011D
    dl sDialog_0x011E
    dl sDialog_0x011F
    dl sDialog_0x0120
    dl sDialog_0x0121
    dl sDialog_0x0122
    dl sDialog_0x0123
    dl sDialog_0x0124
    dl sDialog_0x0125
    dl sDialog_0x0126
    dl sDialog_0x0127
    dl sDialog_0x0128
    dl sDialog_0x0129
    dl sDialog_0x012A
    dl sDialog_0x012B
    dl sDialog_0x012C
    dl sDialog_0x012D
    dl sDialog_0x012E
    dl sDialog_0x012F
    dl sDialog_0x0130
    dl sDialog_0x0131
    dl sDialog_0x0132
    dl sDialog_0x0133
    dl sDialog_0x0134
    dl sDialog_0x0135
    dl sDialog_0x0136
    dl sDialog_0x0137
    dl sDialog_0x0138
    dl sDialog_0x0139
    dl sDialog_0x013A
    dl sDialog_0x013B
    dl sDialog_0x013C
    dl sDialog_0x013D
    dl sDialog_0x013E
    dl sDialog_0x013F
    dl sDialog_0x0140
    dl sDialog_0x0141
    dl sDialog_0x0142
    dl sDialog_0x0143
    dl sDialog_0x0144
    dl sDialog_0x0145
    dl sDialog_0x0146
    dl sDialog_0x0147
    dl sDialog_0x0148
    dl sDialog_0x0149
    dl sDialog_0x014A
    dl sDialog_0x014B
    dl sDialog_0x014C
    dl sDialog_0x014D
    dl sDialog_0x014E
    dl sDialog_0x014F
    dl sDialog_0x0150
    dl sDialog_0x0151
    dl sDialog_0x0152
    dl sDialog_0x0153
    dl sDialog_0x0154
    dl sDialog_0x0155
    dl sDialog_0x0156
    dl sDialog_0x0157
    dl sDialog_0x0158
    dl sDialog_0x0159
    dl sDialog_0x015A
    dl sDialog_0x015B
    dl sDialog_0x015C
    dl sDialog_0x015D
    dl sDialog_0x015E
    dl sDialog_0x015F
    dl sDialog_0x0160
    dl sDialog_0x0161
    dl sDialog_0x0162
    dl sDialog_0x0163
    dl sDialog_0x0164
    dl sDialog_0x0165
    dl sDialog_0x0166
    dl sDialog_0x0167
    dl sDialog_0x0168
    dl sDialog_0x0169
    dl sDialog_0x016A
    dl sDialog_0x016B
    dl sDialog_0x016C
    dl sDialog_0x016D
    dl sDialog_0x016E
    dl sDialog_0x016F
    dl sDialog_0x0170
    dl sDialog_0x0171
    dl sDialog_0x0172
    dl sDialog_0x0173
    dl sDialog_0x0174
    dl sDialog_0x0175
    dl sDialog_0x0176
    dl sDialog_0x0177
    dl sDialog_0x0178
    dl sDialog_0x0179
    dl sDialog_0x017A
    dl sDialog_0x017B
    dl sDialog_0x017C
    dl sDialog_0x017D
    dl sDialog_0x017E
    dl sDialog_0x017F
    dl sDialog_0x0180
    dl sDialog_0x0181
    dl sDialog_0x0182
    dl sDialog_0x0183
    dl sDialog_0x0184
    dl sDialog_0x0185
    dl sDialog_0x0186
    dl sDialog_0x0187
    dl sDialog_0x0188
    dl sDialog_0x0189
    dl sDialog_0x018A
    dl sDialog_0x018B
    dl sDialog_0x018C
    dl sDialog_0x018D
    dl sDialog_0x018E
    dl sDialog_0x018F
    dl sDialog_0x0190
    dl sDialog_0x0191
    dl sDialog_0x0192
    dl sDialog_0x0193
    dl sDialog_0x0194
    dl sDialog_0x0195
    dl sDialog_0x0196
    dl sDialog_0x0197
    dl sDialog_0x0198
    dl sDialog_0x0199
    dl sDialog_0x019A
    dl sDialog_0x019B
    dl sDialog_0x019C
    dl sDialog_0x019D
    dl sDialog_0x019E
    dl sDialog_0x019F
    dl sDialog_0x01A0
    dl sDialog_0x01A1
    dl sDialog_0x01A2
    dl sDialog_0x01A3
    dl sDialog_0x01A4
    dl sDialog_0x01A5
    dl sDialog_0x01A6
    dl sDialog_0x01A7
    dl sDialog_0x01A8
    dl sDialog_0x01A9
    dl sDialog_0x01AA
    dl sDialog_0x01AB
    dl sDialog_0x01AC
    dl sDialog_0x01AD
    dl sDialog_0x01AE
    dl sDialog_0x01AF
    dl sDialog_0x01B0
    dl sDialog_0x01B1
    dl sDialog_0x01B2
    dl sDialog_0x01B3
    dl sDialog_0x01B4
    dl sDialog_0x01B5
    dl sDialog_0x01B6
    dl sDialog_0x01B7
    dl sDialog_0x01B8
    dl sDialog_0x01B9
    dl sDialog_0x01BA
    dl sDialog_0x01BB
    dl sDialog_0x01BC
    dl sDialog_0x01BD
    dl sDialog_0x01BE
    dl sDialog_0x01BF
    dl sDialog_0x01C0
    dl sDialog_0x01C1
    dl sDialog_0x01C2
    dl sDialog_0x01C3
    dl sDialog_0x01C4
    dl sDialog_0x01C5
    dl sDialog_0x01C6
    dl sDialog_0x01C7
    dl sDialog_0x01C8
    dl sDialog_0x01C9
    dl sDialog_0x01CA
    dl sDialog_0x01CB
    dl sDialog_0x01CC
    dl sDialog_0x01CD
    dl sDialog_0x01CE
    dl sDialog_0x01CF
    dl sDialog_0x01D0
    dl sDialog_0x01D1
    dl sDialog_0x01D2
    dl sDialog_0x01D3
    dl sDialog_0x01D4
    dl sDialog_0x01D5
    dl sDialog_0x01D6
    dl sDialog_0x01D7
    dl sDialog_0x01D8
    dl sDialog_0x01D9
    dl sDialog_0x01DA
    dl sDialog_0x01DB
    dl sDialog_0x01DC
    dl sDialog_0x01DD
    dl sDialog_0x01DE
    dl sDialog_0x01DF
    dl sDialog_0x01E0
    dl sDialog_0x01E1
    dl sDialog_0x01E2
    dl sDialog_0x01E3
    dl sDialog_0x01E4
    dl sDialog_0x01E5
    dl sDialog_0x01E6
    dl sDialog_0x01E7
    dl sDialog_0x01E8
    dl sDialog_0x01E9
    dl sDialog_0x01EA
    dl sDialog_0x01EB
    dl sDialog_0x01EC
    dl sDialog_0x01ED
    dl sDialog_0x01EE
    dl sDialog_0x01EF
    dl sDialog_0x01F0
    dl sDialog_0x01F1
    dl sDialog_0x01F2
    dl sDialog_0x01F3
    dl sDialog_0x01F4
    dl sDialog_0x01F5
    dl sDialog_0x01F6
    dl sDialog_0x01F7
    dl sDialog_0x01F8
    dl sDialog_0x01F9
    dl sDialog_0x01FA
    dl sDialog_0x01FB
    dl sDialog_0x01FC
    dl sDialog_0x01FD
    dl sDialog_0x01FE
    dl sDialog_0x01FF
    dl sDialog_0x0200
    dl sDialog_0x0201
    dl sDialog_0x0202
    dl sDialog_0x0203
    dl sDialog_0x0204
    dl sDialog_0x0205
    dl sDialog_0x0206
    dl sDialog_0x0207
    dl sDialog_0x0208
    dl sDialog_0x0209
    dl sDialog_0x020A
    dl sDialog_0x020B
    dl sDialog_0x020C
    dl sDialog_0x020D
    dl sDialog_0x020E
    dl sDialog_0x020F
    dl sDialog_0x0210
    dl sDialog_0x0211
    dl sDialog_0x0212
    dl sDialog_0x0213
    dl sDialog_0x0214
    dl sDialog_0x0215
    dl sDialog_0x0216
    dl sDialog_0x0217
    dl sDialog_0x0218
    dl sDialog_0x0219
    dl sDialog_0x021A
    dl sDialog_0x021B
    dl sDialog_0x021C
    dl sDialog_0x021D
    dl sDialog_0x021E
    dl sDialog_0x021F
    dl sDialog_0x0220
    dl sDialog_0x0221
    dl sDialog_0x0222
    dl sDialog_0x0223
    dl sDialog_0x0224
    dl sDialog_0x0225
    dl sDialog_0x0226
    dl sDialog_0x0227
    dl sDialog_0x0228
    dl sDialog_0x0229
    dl sDialog_0x022A
    dl sDialog_0x022B
    dl sDialog_0x022C
    dl sDialog_0x022D
    dl sDialog_0x022E
    dl sDialog_0x022F
    dl sDialog_0x0230
    dl sDialog_0x0231
    dl sDialog_0x0232
    dl sDialog_0x0233
    dl sDialog_0x0234
    dl sDialog_0x0235
    dl sDialog_0x0236
    dl sDialog_0x0237
    dl sDialog_0x0238
    dl sDialog_0x0239
    dl sDialog_0x023A
    dl sDialog_0x023B
    dl sDialog_0x023C
    dl sDialog_0x023D
    dl sDialog_0x023E
    dl sDialog_0x023F
    dl sDialog_0x0240
    dl sDialog_0x0241
    dl sDialog_0x0242
    dl sDialog_0x0243
    dl sDialog_0x0244
    dl sDialog_0x0245
    dl sDialog_0x0246
    dl sDialog_0x0247
    dl sDialog_0x0248
    dl sDialog_0x0249
    dl sDialog_0x024A
    dl sDialog_0x024B
    dl sDialog_0x024C
    dl sDialog_0x024D
    dl sDialog_0x024E
    dl sDialog_0x024F
    dl sDialog_0x0250
    dl sDialog_0x0251
    dl sDialog_0x0252
    dl sDialog_0x0253
    dl sDialog_0x0254
    dl sDialog_0x0255
    dl sDialog_0x0256
    dl sDialog_0x0257
    dl sDialog_0x0258
    dl sDialog_0x0259
    dl sDialog_0x025A
    dl sDialog_0x025B
    dl sDialog_0x025C
    dl sDialog_0x025D
    dl sDialog_0x025E
    dl sDialog_0x025F
    dl sDialog_0x0260
    dl sDialog_0x0261
    dl sDialog_0x0262
    dl sDialog_0x0263
    dl sDialog_0x0264
    dl sDialog_0x0265
    dl sDialog_0x0266
    dl sDialog_0x0267
    dl sDialog_0x0268
    dl sDialog_0x0269
    dl sDialog_0x026A
    dl sDialog_0x026B
    dl sDialog_0x026C
    dl sDialog_0x026D
    dl sDialog_0x026E
    dl sDialog_0x026F
    dl sDialog_0x0270
    dl sDialog_0x0271
    dl sDialog_0x0272
    dl sDialog_0x0273
    dl sDialog_0x0274
    dl sDialog_0x0275
    dl sDialog_0x0276
    dl sDialog_0x0277
    dl sDialog_0x0278
    dl sDialog_0x0279
    dl sDialog_0x027A
    dl sDialog_0x027B
    dl sDialog_0x027C
    dl sDialog_0x027D
    dl sDialog_0x027E
    dl sDialog_0x027F
    dl sDialog_0x0280
    dl sDialog_0x0281
    dl sDialog_0x0282
    dl sDialog_0x0283
    dl sDialog_0x0284
    dl sDialog_0x0285
    dl sDialog_0x0286
    dl sDialog_0x0287
    dl sDialog_0x0288
    dl sDialog_0x0289
    dl sDialog_0x028A
    dl sDialog_0x028B
    dl sDialog_0x028C
    dl sDialog_0x028D
    dl sDialog_0x028E
    dl sDialog_0x028F
    dl sDialog_0x0290
    dl sDialog_0x0291
    dl sDialog_0x0292
    dl sDialog_0x0293
    dl sDialog_0x0294
    dl sDialog_0x0295
    dl sDialog_0x0296
    dl sDialog_0x0297
    dl sDialog_0x0298
    dl sDialog_0x0299
    dl sDialog_0x029A
    dl sDialog_0x029B
    dl sDialog_0x029C
    dl sDialog_0x029D
    dl sDialog_0x029E
    dl sDialog_0x029F
    dl sDialog_0x02A0
    dl sDialog_0x02A1
    dl sDialog_0x02A2
    dl sDialog_0x02A3
    dl sDialog_0x02A4
    dl sDialog_0x02A5
    dl sDialog_0x02A6
    dl sDialog_0x02A7
    dl sDialog_0x02A8
    dl sDialog_0x02A9
    dl sDialog_0x02AA
    dl sDialog_0x02AB
    dl sDialog_0x02AC
    dl sDialog_0x02AD
    dl sDialog_0x02AE
    dl sDialog_0x02AF
    dl sDialog_0x02B0
    dl sDialog_0x02B1
    dl sDialog_0x02B2
    dl sDialog_0x02B3
    dl sDialog_0x02B4
    dl sDialog_0x02B5
    dl sDialog_0x02B6
    dl sDialog_0x02B7
    dl sDialog_0x02B8
    dl sDialog_0x02B9
    dl sDialog_0x02BA
    dl sDialog_0x02BB
    dl sDialog_0x02BC
    dl sDialog_0x02BD
    dl sDialog_0x02BE
    dl sDialog_0x02BF
    dl sDialog_0x02C0
    dl sDialog_0x02C1
    dl sDialog_0x02C2
    dl sDialog_0x02C3
    dl sDialog_0x02C4
    dl sDialog_0x02C5
    dl sDialog_0x02C6
    dl sDialog_0x02C7
    dl sDialog_0x02C8
    dl sDialog_0x02C9
    dl sDialog_0x02CA
    dl sDialog_0x02CB
    dl sDialog_0x02CC
    dl sDialog_0x02CD
    dl sDialog_0x02CE
    dl sDialog_0x02CF
    dl sDialog_0x02D0
    dl sDialog_0x02D1
    dl sDialog_0x02D2
    dl sDialog_0x02D3
    dl sDialog_0x02D4
    dl sDialog_0x02D5
    dl sDialog_0x02D6
    dl sDialog_0x02D7
    dl sDialog_0x02D8
    dl sDialog_0x02D9
    dl sDialog_0x02DA
    dl sDialog_0x02DB
    dl sDialog_0x02DC
    dl sDialog_0x02DD
    dl sDialog_0x02DE
    dl sDialog_0x02DF
    dl sDialog_0x02E0
    dl sDialog_0x02E1
    dl sDialog_0x02E2
    dl sDialog_0x02E3
    dl sDialog_0x02E4
    dl sDialog_0x02E5
    dl sDialog_0x02E6
    dl sDialog_0x02E7
    dl sDialog_0x02E8
    dl sDialog_0x02E9
    dl sDialog_0x02EA
    dl sDialog_0x02EB
    dl sDialog_0x02EC
    dl sDialog_0x02ED
    dl sDialog_0x02EE
    dl sDialog_0x02EF
    dl sDialog_0x02F0
    dl sDialog_0x02F1
    dl sDialog_0x02F2
    dl sDialog_0x02F3
    dl sDialog_0x02F4
    dl sDialog_0x02F5
    dl sDialog_0x02F6
    dl sDialog_0x02F7
    dl sDialog_0x02F8
    dl sDialog_0x02F9
    dl sDialog_0x02FA
    dl sDialog_0x02FB
    dl sDialog_0x02FC
    dl sDialog_0x02FD
    dl sDialog_0x02FE
    dl sDialog_0x02FF
    dl sDialog_0x0300
    dl sDialog_0x0301
    dl sDialog_0x0302
    dl sDialog_0x0303
    dl sDialog_0x0304
    dl sDialog_0x0305
    dl sDialog_0x0306
    dl sDialog_0x0307
    dl sDialog_0x0308
    dl sDialog_0x0309
    dl sDialog_0x030A
    dl sDialog_0x030B
    dl sDialog_0x030C
    dl sDialog_0x030D
    dl sDialog_0x030E
    dl sDialog_0x030F
    dl sDialog_0x0310
    dl sDialog_0x0311
    dl sDialog_0x0312
    dl sDialog_0x0313
    dl sDialog_0x0314
    dl sDialog_0x0315
    dl sDialog_0x0316
    dl sDialog_0x0317
    dl sDialog_0x0318
    dl sDialog_0x0319
    dl sDialog_0x031A
    dl sDialog_0x031B
    dl sDialog_0x031C
    dl sDialog_0x031D
    dl sDialog_0x031E
    dl sDialog_0x031F
    dl sDialog_0x0320
    dl sDialog_0x0321
    dl sDialog_0x0322
    dl sDialog_0x0323
    dl sDialog_0x0324
    dl sDialog_0x0325
    dl sDialog_0x0326
    dl sDialog_0x0327
    dl sDialog_0x0328
    dl sDialog_0x0329
    dl sDialog_0x032A
    dl sDialog_0x032B
    dl sDialog_0x032C
    dl sDialog_0x032D
    dl sDialog_0x032E
    dl sDialog_0x032F
    dl sDialog_0x0330
    dl sDialog_0x0331
    dl sDialog_0x0332
    dl sDialog_0x0333
    dl sDialog_0x0334
    dl sDialog_0x0335
    dl sDialog_0x0336
    dl sDialog_0x0337
    dl sDialog_0x0338
    dl sDialog_0x0339
    dl sDialog_0x033A
    dl sDialog_0x033B
    dl sDialog_0x033C
    dl sDialog_0x033D
    dl sDialog_0x033E
    dl sDialog_0x033F
    dl sDialog_0x0340
    dl sDialog_0x0341
    dl sDialog_0x0342
    dl sDialog_0x0343
    dl sDialog_0x0344
    dl sDialog_0x0345
    dl sDialog_0x0346
    dl sDialog_0x0347
    dl sDialog_0x0348
    dl sDialog_0x0349
    dl sDialog_0x034A
    dl sDialog_0x034B
    dl sDialog_0x034C
    dl sDialog_0x034D
    dl sDialog_0x034E
    dl sDialog_0x034F
    dl sDialog_0x0350
    dl sDialog_0x0351
    dl sDialog_0x0352
    dl sDialog_0x0353
    dl sDialog_0x0354
    dl sDialog_0x0355
    dl sDialog_0x0356
    dl sDialog_0x0357
    dl sDialog_0x0358
    dl sDialog_0x0359
    dl sDialog_0x035A
    dl sDialog_0x035B
    dl sDialog_0x035C
    dl sDialog_0x035D
    dl sDialog_0x035E
    dl sDialog_0x035F
    dl sDialog_0x0360
    dl sDialog_0x0361
    dl sDialog_0x0362
    dl sDialog_0x0363
    dl sDialog_0x0364
    dl sDialog_0x0365
    dl sDialog_0x0366
    dl sDialog_0x0367
    dl sDialog_0x0368
    dl sDialog_0x0369
    dl sDialog_0x036A
    dl sDialog_0x036B
    dl sDialog_0x036C
    dl sDialog_0x036D
    dl sDialog_0x036E
    dl sDialog_0x036F
    dl sDialog_0x0370
    dl sDialog_0x0371
    dl sDialog_0x0372
    dl sDialog_0x0373
    dl sDialog_0x0374
    dl sDialog_0x0375
    dl sDialog_0x0376
    dl sDialog_0x0377
    dl sDialog_0x0378
    dl sDialog_0x0379
    dl sDialog_0x037A
    dl sDialog_0x037B
    dl sDialog_0x037C
    dl sDialog_0x037D
    dl sDialog_0x037E
    dl sDialog_0x037F
    dl sDialog_0x0380
    dl sDialog_0x0381
    dl sDialog_0x0382
    dl sDialog_0x0383
    dl sDialog_0x0384
    dl sDialog_0x0385
    dl sDialog_0x0386
    dl sDialog_0x0387
    dl sDialog_0x0388
    dl sDialog_0x0389
    dl sDialog_0x038A
    dl sDialog_0x038B
    dl sDialog_0x038C
    dl sDialog_0x038D
    dl sDialog_0x038E
    dl sDialog_0x038F
    dl sDialog_0x0390
    dl sDialog_0x0391
    dl sDialog_0x0392
    dl sDialog_0x0393
    dl sDialog_0x0394
    dl sDialog_0x0395
    dl sDialog_0x0396
    dl sDialog_0x0397
    dl sDialog_0x0398
    dl sDialog_0x0399
    dl sDialog_0x039A
    dl sDialog_0x039B
    dl sDialog_0x039C
    dl sDialog_0x039D
    dl sDialog_0x039E
    dl sDialog_0x039F
    dl sDialog_0x03A0
    dl sDialog_0x03A1
    dl sDialog_0x03A2
    dl sDialog_0x03A3
    dl sDialog_0x03A4
    dl sDialog_0x03A5
    dl sDialog_0x03A6
    dl sDialog_0x03A7
    dl sDialog_0x03A8
    dl sDialog_0x03A9
    dl sDialog_0x03AA
    dl sDialog_0x03AB
    dl sDialog_0x03AC
    dl sDialog_0x03AD
    dl sDialog_0x03AE
    dl sDialog_0x03AF
    dl sDialog_0x03B0
    dl sDialog_0x03B1
    dl sDialog_0x03B2
    dl sDialog_0x03B3
    dl sDialog_0x03B4
    dl sDialog_0x03B5
    dl sDialog_0x03B6
    dl sDialog_0x03B7
    dl sDialog_0x03B8
    dl sDialog_0x03B9
    dl sDialog_0x03BA
    dl sDialog_0x03BB
    dl sDialog_0x03BC
    dl sDialog_0x03BD
    dl sDialog_0x03BE
    dl sDialog_0x03BF
    dl sDialog_0x03C0
    dl sDialog_0x03C1
    dl sDialog_0x03C2
    dl sDialog_0x03C3
    dl sDialog_0x03C4
    dl sDialog_0x03C5
    dl sDialog_0x03C6
    dl sDialog_0x03C7
    dl sDialog_0x03C8
    dl sDialog_0x03C9
    dl sDialog_0x03CA
    dl sDialog_0x03CB
    dl sDialog_0x03CC
    dl sDialog_0x03CD
    dl sDialog_0x03CE
    dl sDialog_0x03CF
    dl sDialog_0x03D0
    dl sDialog_0x03D1
    dl sDialog_0x03D2
    dl sDialog_0x03D3
    dl sDialog_0x03D4
    dl sDialog_0x03D5
    dl sDialog_0x03D6
    dl sDialog_0x03D7
    dl sDialog_0x03D8
    dl sDialog_0x03D9
    dl sDialog_0x03DA
    dl sDialog_0x03DB
    dl sDialog_0x03DC
    dl sDialog_0x03DD
    dl sDialog_0x03DE
    dl sDialog_0x03DF
    dl sDialog_0x03E0
    dl sDialog_0x03E1
    dl sDialog_0x03E2
    dl sDialog_0x03E3
    dl sDialog_0x03E4
    dl sDialog_0x03E5
    dl sDialog_0x03E6
    dl sDialog_0x03E7
    dl sDialog_0x03E8
    dl sDialog_0x03E9
    dl sDialog_0x03EA
    dl sDialog_0x03EB
    dl sDialog_0x03EC
    dl sDialog_0x03ED
    dl sDialog_0x03EE
    dl sDialog_0x03EF
    dl sDialog_0x03F0
    dl sDialog_0x03F1
    dl sDialog_0x03F2
    dl sDialog_0x03F3
    dl sDialog_0x03F4
    dl sDialog_0x03F5
    dl sDialog_0x03F6
    dl sDialog_0x03F7
    dl sDialog_0x03F8
    dl sDialog_0x03F9
    dl sDialog_0x03FA
    dl sDialog_0x03FB
    dl sDialog_0x03FC
    dl sDialog_0x03FD
    dl sDialog_0x03FE
    dl sDialog_0x03FF
    dl sDialog_0x0400
    dl sDialog_0x0401
    dl sDialog_0x0402
    dl sDialog_0x0403
    dl sDialog_0x0404
    dl sDialog_0x0405
    dl sDialog_0x0406
    dl sDialog_0x0407
    dl sDialog_0x0408
    dl sDialog_0x0409
    dl sDialog_0x040A
    dl sDialog_0x040B
    dl sDialog_0x040C
    dl sDialog_0x040D
    dl sDialog_0x040E
    dl sDialog_0x040F
    dl sDialog_0x0410
    dl sDialog_0x0411
    dl sDialog_0x0412
    dl sDialog_0x0413
    dl sDialog_0x0414
    dl sDialog_0x0415
    dl sDialog_0x0416
    dl sDialog_0x0417
    dl sDialog_0x0418
    dl sDialog_0x0419
    dl sDialog_0x041A
    dl sDialog_0x041B
    dl sDialog_0x041C
    dl sDialog_0x041D
    dl sDialog_0x041E
    dl sDialog_0x041F
    dl sDialog_0x0420
    dl sDialog_0x0421
    dl sDialog_0x0422
    dl sDialog_0x0423
    dl sDialog_0x0424
    dl sDialog_0x0425
    dl sDialog_0x0426
    dl sDialog_0x0427
    dl sDialog_0x0428
    dl sDialog_0x0429
    dl sDialog_0x042A
    dl sDialog_0x042B
    dl sDialog_0x042C
    dl sDialog_0x042D
    dl sDialog_0x042E
    dl sDialog_0x042F
    dl sDialog_0x0430
    dl sDialog_0x0431
    dl sDialog_0x0432
    dl sDialog_0x0433
    dl sDialog_0x0434
    dl sDialog_0x0435
    dl sDialog_0x0436
    dl sDialog_0x0437
    dl sDialog_0x0438
    dl sDialog_0x0439
    dl sDialog_0x043A
    dl sDialog_0x043B
    dl sDialog_0x043C
    dl sDialog_0x043D
    dl sDialog_0x043E
    dl sDialog_0x043F
    dl sDialog_0x0440
    dl sDialog_0x0441
    dl sDialog_0x0442
    dl sDialog_0x0443
    dl sDialog_0x0444
    dl sDialog_0x0445
    dl sDialog_0x0446
    dl sDialog_0x0447
    dl sDialog_0x0448
    dl sDialog_0x0449
    dl sDialog_0x044A
    dl sDialog_0x044B
    dl sDialog_0x044C
    dl sDialog_0x044D
    dl sDialog_0x044E
    dl sDialog_0x044F
    dl sDialog_0x0450
    dl sDialog_0x0451
    dl sDialog_0x0452
    dl sDialog_0x0453
    dl sDialog_0x0454
    dl sDialog_0x0455
    dl sDialog_0x0456
    dl sDialog_0x0457
    dl sDialog_0x0458
    dl sDialog_0x0459
    dl sDialog_0x045A
    dl sDialog_0x045B
    dl sDialog_0x045C
    dl sDialog_0x045D
    dl sDialog_0x045E
    dl sDialog_0x045F
    dl sDialog_0x0460
    dl sDialog_0x0461
    dl sDialog_0x0462
    dl sDialog_0x0463
    dl sDialog_0x0464
    dl sDialog_0x0465
    dl sDialog_0x0466
    dl sDialog_0x0467
    dl sDialog_0x0468
    dl sDialog_0x0469
    dl sDialog_0x046A
    dl sDialog_0x046B
    dl sDialog_0x046C
    dl sDialog_0x046D
    dl sDialog_0x046E
    dl sDialog_0x046F
    dl sDialog_0x0470
    dl sDialog_0x0471
    dl sDialog_0x0472
    dl sDialog_0x0473
    dl sDialog_0x0474
    dl sDialog_0x0475
    dl sDialog_0x0476
    dl sDialog_0x0477
    dl sDialog_0x0478
    dl sDialog_0x0479
    dl sDialog_0x047A
    dl sDialog_0x047B
    dl sDialog_0x047C
    dl sDialog_0x047D
    dl sDialog_0x047E
    dl sDialog_0x047F
    dl sDialog_0x0480
    dl sDialog_0x0481
    dl sDialog_0x0482
    dl sDialog_0x0483
    dl sDialog_0x0484
    dl sDialog_0x0485
    dl sDialog_0x0486
    dl sDialog_0x0487
    dl sDialog_0x0488
    dl sDialog_0x0489
    dl sDialog_0x048A
    dl sDialog_0x048B
    dl sDialog_0x048C
    dl sDialog_0x048D
    dl sDialog_0x048E
    dl sDialog_0x048F
    dl sDialog_0x0490
    dl sDialog_0x0491
    dl sDialog_0x0492
    dl sDialog_0x0493
    dl sDialog_0x0494
    dl sDialog_0x0495
    dl sDialog_0x0496
    dl sDialog_0x0497
