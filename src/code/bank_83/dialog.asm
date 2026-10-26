; Bank $83 module "dialog" - starts at $8392BB
 
fDialog_LoadDialogBoxGraphics:
    REP #$30                                                   ;8392BB|C230    |      ;
    REP #$20                                                   ;8392BD|C220    |      ;
    LDA.W #Screen_DialogBox                                    ;8392BF; region specific blob, label moves with the layout
    STA.B ptrTemp0x72                                          ;8392C2|8572    |000072;
    LDA.W #$2000                                               ;8392C4|A90020  |      ;
    STA.B ptrUnknown0x75                                       ;8392C7|8575    |000075;
    SEP #$20                                                   ;8392C9|E220    |      ;
    LDA.B #Screen_DialogBox>>16                                ;8392CB|A9A5    |      ;
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
    LDA.W #sFontGlyphs_Dialog                                    ;839314|A9A3BB  |      ;
    STA.B ptrTemp0x72                                          ;839317|8572    |000072;
    SEP #$20                                                   ;839319|E220    |      ;
    LDA.B #sFontGlyphs_Dialog>>16                                ;83931B|A99C    |      ;
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
    LDA.W #sFontGlyphs_Dialog                                    ;839340|A9A3BB  |      ;
    STA.B ptrTemp0x72                                          ;839343|8572    |000072;
    SEP #$20                                                   ;839345|E220    |      ;
    LDA.B #sFontGlyphs_Dialog>>16                                ;839347|A99C    |      ;
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
    BRA .set_glyph_type                                                ;83959B|8007    |8395A4;
 
 
.NUMBERS_wide:
    CMP.W #$0270                                               ;83959D|C97002  |      ;
    BNE .set_glyph_type                                                ;8395A0|D002    |8395A4;
    LDX.B #$00                                                 ;8395A2|A200    |      ;
 
.set_glyph_type:
    STX.W strcDialogDisplay.fontGlyphType                      ;8395A4|8E9001  |000190;
    JSL.L fDialog_TransferGlyph                                ;8395A7|22239883|839823;
    SEP #$20                                                   ;8395AB|E220    |      ;
    REP #$10                                                   ;8395AD|C210    |      ;
    LDA.B #!SFX_MENUCURSOR                                                 ;8395AF|A903    |      ;
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
    BNE .var_not_finished
    LDA.W strcDialogDisplay.dialogFlags
    ORA.B #$80
    STA.W strcDialogDisplay.dialogFlags
.var_not_finished:
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

; Dialog engine tables: font page pointers, option/number/text variable tables and aDialogPointers (generated by tools/dialogs/texttables.py,
; docs/formats/dialog-tables.md)
    incsrc "../../../build/gen/dialogs/!{DLGDIR}/text_tables.asm"
