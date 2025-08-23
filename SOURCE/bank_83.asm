 
    ORG $838000
 
 
fMathMultiply_7EbyA:
    PHP                                                        ;838000|08      |      ;
    REP #$30                                                   ;838001|C230    |      ;
    STA.W strcAudio.unkMulti11C                                ;838003|8D1C01  |00011C;
    STZ.W strcAudio.unkMulti11E                                ;838006|9C1E01  |00011E;
    STZ.W strcAudio.unkMulti120                                ;838009|9C2001  |000120;
    STZ.W strcAudio.unkMulti122                                ;83800C|9C2201  |000122;
    SEP #$20                                                   ;83800F|E220    |      ;
    STA.W strcAudio.unkMulti11A                                ;838011|8D1A01  |00011A;
    LDA.B strcVariables.n16Temp1                               ;838014|A57E    |00007E;
    STA.W strcAudio.unkMulti11B                                ;838016|8D1B01  |00011B;
    JSR.W fMathMultiply                                        ;838019|206780  |838067;
    REP #$20                                                   ;83801C|C220    |      ;
    STA.W strcAudio.unkMulti11E                                ;83801E|8D1E01  |00011E;
    LDA.W strcAudio.unkMulti11C                                ;838021|AD1C01  |00011C;
    AND.W #$FF00                                               ;838024|2900FF  |      ;
    BEQ +                                                      ;838027|F012    |83803B;
    SEP #$20                                                   ;838029|E220    |      ;
    XBA                                                        ;83802B|EB      |      ;
    STA.W strcAudio.unkMulti11A                                ;83802C|8D1A01  |00011A;
    JSR.W fMathMultiply                                        ;83802F|206780  |838067;
    REP #$20                                                   ;838032|C220    |      ;
    AND.W #$00FF                                               ;838034|29FF00  |      ;
    XBA                                                        ;838037|EB      |      ;
    STA.W strcAudio.unkMulti120                                ;838038|8D2001  |000120;
 
  + LDA.B strcVariables.n16Temp1                               ;83803B|A57E    |00007E;
    AND.W #$FF00                                               ;83803D|2900FF  |      ;
    BEQ +                                                      ;838040|F018    |83805A;
    SEP #$20                                                   ;838042|E220    |      ;
    XBA                                                        ;838044|EB      |      ;
    STA.W strcAudio.unkMulti11B                                ;838045|8D1B01  |00011B;
    LDA.W strcAudio.unkMulti11C                                ;838048|AD1C01  |00011C;
    STA.W strcAudio.unkMulti11A                                ;83804B|8D1A01  |00011A;
    JSR.W fMathMultiply                                        ;83804E|206780  |838067;
    REP #$20                                                   ;838051|C220    |      ;
    AND.W #$00FF                                               ;838053|29FF00  |      ;
    XBA                                                        ;838056|EB      |      ;
    STA.W strcAudio.unkMulti122                                ;838057|8D2201  |000122;
 
  + LDA.W strcAudio.unkMulti11E                                ;83805A|AD1E01  |00011E;
    CLC                                                        ;83805D|18      |      ;
    ADC.W strcAudio.unkMulti120                                ;83805E|6D2001  |000120;
    CLC                                                        ;838061|18      |      ;
    ADC.W strcAudio.unkMulti122                                ;838062|6D2201  |000122;
    PLP                                                        ;838065|28      |      ;
    RTL                                                        ;838066|6B      |      ;
 
 
fMathMultiply:
    SEP #$20                                                   ;838067|E220    |      ; $011A: nA, $011B, return A = $011A * $011B
    LDA.W strcAudio.unkMulti11A                                ;838069|AD1A01  |00011A;
    STA.L SNES_WRMPYA                                          ;83806C|8F024200|004202;
    LDA.W strcAudio.unkMulti11B                                ;838070|AD1B01  |00011B;
    STA.L SNES_WRMPYB                                          ;838073|8F034200|004203;
    REP #$20                                                   ;838077|C220    |      ;
    NOP                                                        ;838079|EA      |      ;
    NOP                                                        ;83807A|EA      |      ;
    NOP                                                        ;83807B|EA      |      ;
    NOP                                                        ;83807C|EA      |      ;
    LDA.L SNES_RDMPYL                                          ;83807D|AF164200|004216;
    RTS                                                        ;838081|60      |      ;
 
 
fMathDivide:
    REP #$30                                                   ;838082|C230    |      ;
    LDY.W #$0000                                               ;838084|A00000  |      ;
    LDA.B strcVariables.n16Temp2                               ;838087|A580    |000080;
    CMP.W #$00FF                                               ;838089|C9FF00  |      ;
    BCS +                                                      ;83808C|B020    |8380AE;
    LDA.B strcVariables.n16Temp1                               ;83808E|A57E    |00007E;
    STA.L SNES_WRDIVL                                          ;838090|8F044200|004204;
    SEP #$20                                                   ;838094|E220    |      ;
    LDA.B strcVariables.n16Temp2                               ;838096|A580    |000080; $7E: nA, $80: nB, return A: $7E / $80
    STA.L SNES_WRDIVB                                          ;838098|8F064200|004206;
    REP #$20                                                   ;83809C|C220    |      ;
    NOP                                                        ;83809E|EA      |      ;
    NOP                                                        ;83809F|EA      |      ;
    NOP                                                        ;8380A0|EA      |      ;
    TYA                                                        ;8380A1|98      |      ;
    LSR A                                                      ;8380A2|4A      |      ;
    LDA.L SNES_RDMPYL                                          ;8380A3|AF164200|004216;
    STA.B strcVariables.n16Temp1                               ;8380A7|857E    |00007E;
    LDA.L SNES_RDDIVL                                          ;8380A9|AF144200|004214;
 
.justReturn:
    RTL                                                        ;8380AD|6B      |      ;
 
 
  + PHY                                                        ;8380AE|5A      |      ;
    LDY.W #$0010                                               ;8380AF|A01000  |      ;
    LDA.W #$0000                                               ;8380B2|A90000  |      ;
    STA.B strcVariables.n16Temp3                               ;8380B5|8582    |000082;
 
  - ASL.B strcVariables.n16Temp3                               ;8380B7|0682    |000082;
    ASL.B strcVariables.n16Temp1                               ;8380B9|067E    |00007E;
    ROL A                                                      ;8380BB|2A      |      ;
    CMP.B strcVariables.n16Temp2                               ;8380BC|C580    |000080;
    BCC +                                                      ;8380BE|9004    |8380C4;
    SBC.B strcVariables.n16Temp2                               ;8380C0|E580    |000080;
    INC.B strcVariables.n16Temp3                               ;8380C2|E682    |000082;
 
  + DEY                                                        ;8380C4|88      |      ;
    BNE -                                                      ;8380C5|D0F0    |8380B7;
    STA.B strcVariables.n16Temp1                               ;8380C7|857E    |00007E;
    PLA                                                        ;8380C9|68      |      ;
    LSR A                                                      ;8380CA|4A      |      ;
    LDA.B strcVariables.n16Temp3                               ;8380CB|A582    |000082;
    JMP.W .justReturn                                          ;8380CD|4CAD80  |8380AD;
 
    REP #$30                                                   ;8380D0|C230    |      ;
    LDY.W #$0000                                               ;8380D2|A00000  |      ;
    LDA.B strcVariables.n16Temp1                               ;8380D5|A57E    |00007E;
    BPL +                                                      ;8380D7|1007    |8380E0;
    EOR.W #$FFFF                                               ;8380D9|49FFFF  |      ;
    INC A                                                      ;8380DC|1A      |      ;
    STA.B strcVariables.n16Temp1                               ;8380DD|857E    |00007E;
    INY                                                        ;8380DF|C8      |      ;
 
  + LDA.B strcVariables.n16Temp2                               ;8380E0|A580    |000080;
    BPL +                                                      ;8380E2|1007    |8380EB;
    EOR.W #$FFFF                                               ;8380E4|49FFFF  |      ;
    INC A                                                      ;8380E7|1A      |      ;
    STA.B strcVariables.n16Temp2                               ;8380E8|8580    |000080;
    INY                                                        ;8380EA|C8      |      ;
 
  + CMP.W #$00FF                                               ;8380EB|C9FF00  |      ;
    BCS .label1                                                ;8380EE|B026    |838116;
    LDA.B strcVariables.n16Temp1                               ;8380F0|A57E    |00007E;
    STA.L SNES_WRDIVL                                          ;8380F2|8F044200|004204;
    SEP #$20                                                   ;8380F6|E220    |      ;
    LDA.B strcVariables.n16Temp2                               ;8380F8|A580    |000080;
    STA.L SNES_WRDIVB                                          ;8380FA|8F064200|004206;
    REP #$20                                                   ;8380FE|C220    |      ;
    NOP                                                        ;838100|EA      |      ;
    NOP                                                        ;838101|EA      |      ;
    NOP                                                        ;838102|EA      |      ;
    TYA                                                        ;838103|98      |      ;
    LSR A                                                      ;838104|4A      |      ;
    LDA.L SNES_RDMPYL                                          ;838105|AF164200|004216;
    STA.B strcVariables.n16Temp1                               ;838109|857E    |00007E;
    LDA.L SNES_RDDIVL                                          ;83810B|AF144200|004214;
 
 -- BCC +                                                      ;83810F|9004    |838115;
    EOR.W #$FFFF                                               ;838111|49FFFF  |      ;
    INC A                                                      ;838114|1A      |      ;
 
  + RTL                                                        ;838115|6B      |      ;
 
 
.label1:
    PHY                                                        ;838116|5A      |      ;
    LDY.W #$0010                                               ;838117|A01000  |      ;
    LDA.W #$0000                                               ;83811A|A90000  |      ;
    STA.B strcVariables.n16Temp3                               ;83811D|8582    |000082;
 
  - ASL.B strcVariables.n16Temp3                               ;83811F|0682    |000082;
    ASL.B strcVariables.n16Temp1                               ;838121|067E    |00007E;
    ROL A                                                      ;838123|2A      |      ;
    CMP.B strcVariables.n16Temp2                               ;838124|C580    |000080;
    BCC +                                                      ;838126|9004    |83812C;
    SBC.B strcVariables.n16Temp2                               ;838128|E580    |000080;
    INC.B strcVariables.n16Temp3                               ;83812A|E682    |000082;
 
  + DEY                                                        ;83812C|88      |      ;
    BNE -                                                      ;83812D|D0F0    |83811F;
    STA.B strcVariables.n16Temp1                               ;83812F|857E    |00007E;
    PLA                                                        ;838131|68      |      ;
    LSR A                                                      ;838132|4A      |      ;
    LDA.B strcVariables.n16Temp3                               ;838133|A582    |000082;
    JMP.W $810F                                                ;838135|4C0F81  |83810F;
 
 
fGetRandomNumber:
    SEP #$20                                                   ;838138|E220    |      ; return A: nRandomNumber (0x00-0xFF)
    LDA.W strcRandom.b                                         ;83813A|AD0101  |000101;
    EOR.W strcRandom.a                                         ;83813D|4D0001  |000100;
    AND.B #$02                                                 ;838140|2902    |      ;
    CLC                                                        ;838142|18      |      ;
    BEQ +                                                      ;838143|F001    |838146;
    SEC                                                        ;838145|38      |      ;
 
  + ROR.W strcRandom.b                                         ;838146|6E0101  |000101;
    ROR.W strcRandom.a                                         ;838149|6E0001  |000100;
    ROR.W strcRandom.c                                         ;83814C|6E0201  |000102;
    CLC                                                        ;83814F|18      |      ;
    LDA.W strcRandom.b                                         ;838150|AD0101  |000101;
    ADC.B #$47                                                 ;838153|6947    |      ;
    ROR A                                                      ;838155|6A      |      ;
    ROR A                                                      ;838156|6A      |      ;
    EOR.W strcRandom.a                                         ;838157|4D0001  |000100;
    ADC.W strcRandom.c                                         ;83815A|6D0201  |000102;
    STA.W strcRandom.a                                         ;83815D|8D0001  |000100;
    REP #$20                                                   ;838160|C220    |      ;
    AND.W #$00FF                                               ;838162|29FF00  |      ;
    RTL                                                        ;838165|6B      |      ;
 
 
fGraphicsTransferData:
    REP #$30                                                   ;838166|C230    |      ; A: nArg1, X: nArg2
    ASL A                                                      ;838168|0A      |      ;
    ASL A                                                      ;838169|0A      |      ;
    ASL A                                                      ;83816A|0A      |      ;
    ASL A                                                      ;83816B|0A      |      ;
    STA.B strcVariables.n16Temp1                               ;83816C|857E    |00007E;
    SEP #$20                                                   ;83816E|E220    |      ;
    LDA.B #$06                                                 ;838170|A906    |      ;
    STA.B strcSystem.arrayIndex                                ;838172|8527    |000027; $27 = 0x06
    LDA.B #$18                                                 ;838174|A918    |      ;
    STA.B strcSystem.destinationRegister                       ;838176|8529    |000029; $29 = 0x18
    REP #$20                                                   ;838178|C220    |      ;
    LDA.W #$0010                                               ;83817A|A91000  |      ;
    CLC                                                        ;83817D|18      |      ;
    ADC.B strcVariables.n16Temp1                               ;83817E|657E    |00007E;
    TAY                                                        ;838180|A8      |      ; Y = nArg1 * 16 + 0x10
    REP #$20                                                   ;838181|C220    |      ;
    LDA.W #$0080                                               ;838183|A98000  |      ; A = 0x80
    PHX                                                        ;838186|DA      |      ; X -> stack1
    JSL.L fCore_PrepareTransfer                                ;838187|22338A80|808A33;
    SEP #$20                                                   ;83818B|E220    |      ;
    LDA.B #$07                                                 ;83818D|A907    |      ;
    STA.B strcSystem.arrayIndex                                ;83818F|8527    |000027; $27 = 0x07
    LDA.B #$18                                                 ;838191|A918    |      ;
    STA.B strcSystem.destinationRegister                       ;838193|8529    |000029; $29 = 0x18
    REP #$30                                                   ;838195|C230    |      ;
    PLX                                                        ;838197|FA      |      ; X = stack1
    TXA                                                        ;838198|8A      |      ;
    CLC                                                        ;838199|18      |      ;
    ADC.W #$0080                                               ;83819A|698000  |      ;
    TAX                                                        ;83819D|AA      |      ;
    LDA.W #$0010                                               ;83819E|A91000  |      ;
    CLC                                                        ;8381A1|18      |      ;
    ADC.B strcVariables.n16Temp1                               ;8381A2|657E    |00007E;
    TAY                                                        ;8381A4|A8      |      ;
    LDA.B ptrTemp0x72                                          ;8381A5|A572    |000072;
    CLC                                                        ;8381A7|18      |      ;
    ADC.W #$0100                                               ;8381A8|690001  |      ;
    STA.B ptrTemp0x72                                          ;8381AB|8572    |000072;
    REP #$20                                                   ;8381AD|C220    |      ;
    LDA.W #$0080                                               ;8381AF|A98000  |      ;
    JSL.L fCore_PrepareTransfer                                ;8381B2|22338A80|808A33;
    RTL                                                        ;8381B6|6B      |      ;
 
 
fGraphicsUnknown_8381B7:
    SEP #$20                                                   ;8381B7|E220    |      ; X: nArg1, $72: ptr24
    REP #$10                                                   ;8381B9|C210    |      ;
    LDA.B #$06                                                 ;8381BB|A906    |      ;
    STA.B strcSystem.arrayIndex                                ;8381BD|8527    |000027; $27 = 0x06
    LDA.B #$18                                                 ;8381BF|A918    |      ;
    STA.B strcSystem.destinationRegister                       ;8381C1|8529    |000029; $29 = 0x18
    LDY.W #$0004                                               ;8381C3|A00400  |      ; Y = 0x04
    REP #$20                                                   ;8381C6|C220    |      ;
    LDA.W #$0080                                               ;8381C8|A98000  |      ; A = 0x80
    PHX                                                        ;8381CB|DA      |      ; X -> stack1
    JSL.L fCore_PrepareTransfer                                ;8381CC|22338A80|808A33;
    SEP #$20                                                   ;8381D0|E220    |      ;
    LDA.B #$07                                                 ;8381D2|A907    |      ;
    STA.B strcSystem.arrayIndex                                ;8381D4|8527    |000027; $27 = 0x07
    LDA.B #$18                                                 ;8381D6|A918    |      ;
    STA.B strcSystem.destinationRegister                       ;8381D8|8529    |000029; $29 = 0x18
    REP #$30                                                   ;8381DA|C230    |      ;
    PLX                                                        ;8381DC|FA      |      ;
    TXA                                                        ;8381DD|8A      |      ;
    CLC                                                        ;8381DE|18      |      ;
    ADC.W #$0020                                               ;8381DF|692000  |      ;
    TAX                                                        ;8381E2|AA      |      ; X = nArg1 + 0x20
    LDY.W #$0004                                               ;8381E3|A00400  |      ;
    REP #$20                                                   ;8381E6|C220    |      ;
    LDA.B ptrTemp0x72                                          ;8381E8|A572    |000072;
    CLC                                                        ;8381EA|18      |      ;
    ADC.W #$0004                                               ;8381EB|690400  |      ;
    STA.B ptrTemp0x72                                          ;8381EE|8572    |000072; $72 += 0x04
    LDA.W #$0080                                               ;8381F0|A98000  |      ;
    JSL.L fCore_PrepareTransfer                                ;8381F3|22338A80|808A33;
    RTL                                                        ;8381F7|6B      |      ;
 
 
fGraphicsDecompressTilemap:
    PHP                                                        ;8381F8|08      |      ;
    REP #$30                                                   ;8381F9|C230    |      ;
    LDA.W #$0000                                               ;8381FB|A90000  |      ;
    TAX                                                        ;8381FE|AA      |      ;
 
  - STA.L $7F0000,X                                            ;8381FF|9F00007F|7F0000;
    INX                                                        ;838203|E8      |      ;
    INX                                                        ;838204|E8      |      ;
    CPX.W #$0800                                               ;838205|E00008  |      ;
    BCC -                                                      ;838208|90F5    |8381FF;
    REP #$20                                                   ;83820A|C220    |      ;
    LDA.B [ptrTemp0x72]                                        ;83820C|A772    |000072;
    STA.B strcVariables.n16Temp1                               ;83820E|857E    |00007E;
    INC.B ptrTemp0x72                                          ;838210|E672    |000072;
    INC.B ptrTemp0x72                                          ;838212|E672    |000072;
    INC.B ptrTemp0x72                                          ;838214|E672    |000072;
    INC.B ptrTemp0x72                                          ;838216|E672    |000072;
    STZ.B strcVariables.n16Temp2                               ;838218|6480    |000080;
    STZ.B strcVariables.n16Temp3                               ;83821A|6482    |000082;
    LDA.W #$07DE                                               ;83821C|A9DE07  |      ;
    STA.B strcVariables.n16Temp4                               ;83821F|8584    |000084;
    LDA.B strcVariables.n16Temp1                               ;838221|A57E    |00007E;
    BNE .loop                                                  ;838223|D000    |838225;
 
.loop:
    DEC.B strcVariables.n16Temp3                               ;838225|C682    |000082;
    BPL +                                                      ;838227|1010    |838239;
    REP #$20                                                   ;838229|C220    |      ;
    LDA.B [ptrTemp0x72]                                        ;83822B|A772    |000072;
    INC.B ptrTemp0x72                                          ;83822D|E672    |000072;
    AND.W #$00FF                                               ;83822F|29FF00  |      ;
    STA.B strcVariables.n16Temp2                               ;838232|8580    |000080;
    LDA.W #$0007                                               ;838234|A90700  |      ;
    STA.B strcVariables.n16Temp3                               ;838237|8582    |000082;
 
  + LSR.B strcVariables.n16Temp2                               ;838239|4680    |000080;
    BCC +                                                      ;83823B|9028    |838265;
    REP #$20                                                   ;83823D|C220    |      ;
    LDA.B [ptrTemp0x72]                                        ;83823F|A772    |000072;
    INC.B ptrTemp0x72                                          ;838241|E672    |000072;
    AND.W #$00FF                                               ;838243|29FF00  |      ;
    SEP #$20                                                   ;838246|E220    |      ;
    STA.B [ptrUnknown0x75]                                     ;838248|8775    |000075;
    REP #$30                                                   ;83824A|C230    |      ;
    INC.B ptrUnknown0x75                                       ;83824C|E675    |000075;
    DEC.B strcVariables.n16Temp1                               ;83824E|C67E    |00007E;
    BEQ .return                                                ;838250|F070    |8382C2;
    LDX.B strcVariables.n16Temp4                               ;838252|A684    |000084;
    SEP #$20                                                   ;838254|E220    |      ;
    STA.L $7F0000,X                                            ;838256|9F00007F|7F0000;
    REP #$30                                                   ;83825A|C230    |      ;
    TXA                                                        ;83825C|8A      |      ;
    INC A                                                      ;83825D|1A      |      ;
    AND.W #$07FF                                               ;83825E|29FF07  |      ;
    STA.B strcVariables.n16Temp4                               ;838261|8584    |000084;
    BRA .loop                                                  ;838263|80C0    |838225;
 
 
  + REP #$20                                                   ;838265|C220    |      ;
    LDA.B [ptrTemp0x72]                                        ;838267|A772    |000072;
    INC.B ptrTemp0x72                                          ;838269|E672    |000072;
    AND.W #$00FF                                               ;83826B|29FF00  |      ;
    STA.B strcVariables.n16Unk86                               ;83826E|8586    |000086;
    REP #$20                                                   ;838270|C220    |      ;
    LDA.B [ptrTemp0x72]                                        ;838272|A772    |000072;
    INC.B ptrTemp0x72                                          ;838274|E672    |000072;
    AND.W #$00FF                                               ;838276|29FF00  |      ;
    TAX                                                        ;838279|AA      |      ;
    AND.W #$001F                                               ;83827A|291F00  |      ;
    INC A                                                      ;83827D|1A      |      ;
    INC A                                                      ;83827E|1A      |      ;
    INC A                                                      ;83827F|1A      |      ;
    STA.B strcVariables.n16Unk88                               ;838280|8588    |000088;
    TXA                                                        ;838282|8A      |      ;
    AND.W #$00E0                                               ;838283|29E000  |      ;
    ASL A                                                      ;838286|0A      |      ;
    ASL A                                                      ;838287|0A      |      ;
    ASL A                                                      ;838288|0A      |      ;
    ORA.B strcVariables.n16Unk86                               ;838289|0586    |000086;
    STA.B strcVariables.n16Unk86                               ;83828B|8586    |000086;
 
  - LDX.B strcVariables.n16Unk86                               ;83828D|A686    |000086;
    LDA.L $7F0000,X                                            ;83828F|BF00007F|7F0000;
    AND.W #$00FF                                               ;838293|29FF00  |      ;
    SEP #$20                                                   ;838296|E220    |      ;
    STA.B [ptrUnknown0x75]                                     ;838298|8775    |000075;
    REP #$30                                                   ;83829A|C230    |      ;
    INC.B ptrUnknown0x75                                       ;83829C|E675    |000075;
    DEC.B strcVariables.n16Temp1                               ;83829E|C67E    |00007E;
    BEQ .return                                                ;8382A0|F020    |8382C2;
    LDX.B strcVariables.n16Temp4                               ;8382A2|A684    |000084;
    SEP #$20                                                   ;8382A4|E220    |      ;
    STA.L $7F0000,X                                            ;8382A6|9F00007F|7F0000;
    REP #$30                                                   ;8382AA|C230    |      ;
    TXA                                                        ;8382AC|8A      |      ;
    INC A                                                      ;8382AD|1A      |      ;
    AND.W #$07FF                                               ;8382AE|29FF07  |      ;
    STA.B strcVariables.n16Temp4                               ;8382B1|8584    |000084;
    LDA.B strcVariables.n16Unk86                               ;8382B3|A586    |000086;
    INC A                                                      ;8382B5|1A      |      ;
    AND.W #$07FF                                               ;8382B6|29FF07  |      ;
    STA.B strcVariables.n16Unk86                               ;8382B9|8586    |000086;
    DEC.B strcVariables.n16Unk88                               ;8382BB|C688    |000088;
    BNE -                                                      ;8382BD|D0CE    |83828D;
    JMP.W .loop                                                ;8382BF|4C2582  |838225;
 
 
.return:
    LDA.B strcVariables.n16Temp1                               ;8382C2|A57E    |00007E;
    PLP                                                        ;8382C4|28      |      ;
    RTL                                                        ;8382C5|6B      |      ;
 
 
fAudioUnknown_8382C6:
    SEP #$20                                                   ;8382C6|E220    |      ;
    REP #$10                                                   ;8382C8|C210    |      ;
    PHA                                                        ;8382CA|48      |      ;
    JSL.L fAudioUnknown_83841F                                 ;8382CB|221F8483|83841F;
    SEP #$20                                                   ;8382CF|E220    |      ;
    PLA                                                        ;8382D1|68      |      ;
    STA.W strcAudio.trackId                                    ;8382D2|8D1001  |000110;
    JSL.L fAudioUnknown_8383A4                                 ;8382D5|22A48383|8383A4;
    JSL.L fAudioUnknown_838380                                 ;8382D9|22808383|838380;
    SEP #$20                                                   ;8382DD|E220    |      ;
    LDA.W strcAudio.trackId                                    ;8382DF|AD1001  |000110;
    STA.W strcAudio.trackIdCopy                                ;8382E2|8D1701  |000117;
    REP #$30                                                   ;8382E5|C230    |      ;
    LDA.W #$00B4                                               ;8382E7|A9B400  |      ;
    JSL.L fCore_WaitForNMITimes                                ;8382EA|225D8680|80865D;
    SEP #$20                                                   ;8382EE|E220    |      ;
    LDA.W nDestinationAreaId                                   ;8382F0|AD8B09  |00098B;
    STA.B strcMap.loadAreaId                                   ;8382F3|8522    |000022;
    JSL.L fAudioEngine_MapMusicHandler                         ;8382F5|22DE9580|8095DE;
    JSL.L fAudioUnknown_838401                                 ;8382F9|22018483|838401;
    RTL                                                        ;8382FD|6B      |      ;
 
 
fAudioUnknown_8382FE:
    SEP #$20                                                   ;8382FE|E220    |      ;
    REP #$10                                                   ;838300|C210    |      ;
    STA.W strcAudio.reg114                                     ;838302|8D1401  |000114;
    PHY                                                        ;838305|5A      |      ;
    REP #$20                                                   ;838306|C220    |      ;
    TXA                                                        ;838308|8A      |      ;
    SEP #$20                                                   ;838309|E220    |      ;
    STA.W strcAudio.reg115                                     ;83830B|8D1501  |000115;
    LDA.B #$00                                                 ;83830E|A900    |      ;
    XBA                                                        ;838310|EB      |      ;
    LDA.W strcAudio.unk118                                     ;838311|AD1801  |000118;
    REP #$20                                                   ;838314|C220    |      ;
    TAX                                                        ;838316|AA      |      ;
    SEP #$20                                                   ;838317|E220    |      ;
    LDA.L nToolSoundData_80B8CD,X                              ;838319|BFCDB880|80B8CD;
    INC A                                                      ;83831D|1A      |      ;
    STA.W strcAudio.index                                      ;83831E|8D0301  |000103;
    JSL.L fAudioUnknown_83833E                                 ;838321|223E8383|83833E;
    JSL.L fAudioSetRegister2to0A                               ;838325|22328383|838332;
    REP #$30                                                   ;838329|C230    |      ;
    PLY                                                        ;83832B|7A      |      ;
    TYA                                                        ;83832C|98      |      ;
    JSL.L fCore_WaitForNMITimes                                ;83832D|225D8680|80865D;
    RTL                                                        ;838331|6B      |      ;
 
 
fAudioSetRegister2to0A:
    SEP #$20                                                   ;838332|E220    |      ;
    LDA.B #$0A                                                 ;838334|A90A    |      ;
    STA.W strcAudio.reg116                                     ;838336|8D1601  |000116;
    JSL.L fAudioUnknown_838DDF                                 ;838339|22DF8D83|838DDF;
    RTL                                                        ;83833D|6B      |      ;
 
 
fAudioUnknown_83833E:
    SEP #$20                                                   ;83833E|E220    |      ;
    LDA.B #$00                                                 ;838340|A900    |      ;
    XBA                                                        ;838342|EB      |      ;
    LDA.W strcAudio.index                                      ;838343|AD0301  |000103;
    REP #$20                                                   ;838346|C220    |      ;
    TAX                                                        ;838348|AA      |      ;
    SEP #$20                                                   ;838349|E220    |      ;
    LDA.W strcAudio.list,X                                     ;83834B|BD0401  |000104;
    BEQ +                                                      ;83834E|F00E    |83835E;
    REP #$20                                                   ;838350|C220    |      ;
    TXA                                                        ;838352|8A      |      ;
    INC A                                                      ;838353|1A      |      ;
    SEP #$20                                                   ;838354|E220    |      ;
    JSL.L fAudioUnknown_8389C7                                 ;838356|22C78983|8389C7;
    JSL.L fCore_WaitForNextNMI                                 ;83835A|22458680|808645;
 
  + SEP #$20                                                   ;83835E|E220    |      ;
    LDA.B #$00                                                 ;838360|A900    |      ;
    XBA                                                        ;838362|EB      |      ;
    LDA.W strcAudio.reg114                                     ;838363|AD1401  |000114;
    REP #$20                                                   ;838366|C220    |      ;
    TAX                                                        ;838368|AA      |      ;
    SEP #$20                                                   ;838369|E220    |      ;
    LDA.L aAudioUnknown_83927F,X                               ;83836B|BF7F9283|83927F;
    BEQ +                                                      ;83836F|F004    |838375;
    JSL.L fAudioUnknown_838AFF                                 ;838371|22FF8A83|838AFF;
 
  + RTL                                                        ;838375|6B      |      ;
 
 
fAudioUnused_838376:
    SEP #$20                                                   ;838376|E220    |      ;
    LDA.W strcAudio.index                                      ;838378|AD0301  |000103;
    INC A                                                      ;83837B|1A      |      ;
    STA.W strcAudio.index                                      ;83837C|8D0301  |000103;
    RTL                                                        ;83837F|6B      |      ;
 
 
fAudioUnknown_838380:
    SEP #$20                                                   ;838380|E220    |      ;
    LDA.W strcAudio.trackId                                    ;838382|AD1001  |000110;
    BEQ +                                                      ;838385|F017    |83839E;
    CMP.W strcAudio.trackIdCopy                                ;838387|CD1701  |000117;
    BEQ +                                                      ;83838A|F012    |83839E;
    CMP.B #$FF                                                 ;83838C|C9FF    |      ;
    BEQ +                                                      ;83838E|F00E    |83839E;
    LDA.B #$01                                                 ;838390|A901    |      ;
    STA.W strcAudio.unk111                                     ;838392|8D1101  |000111;
    LDA.B #$40                                                 ;838395|A940    |      ;
    STA.W strcAudio.unk113                                     ;838397|8D1301  |000113;
    JSL.L fAudioUnknown_838D39                                 ;83839A|22398D83|838D39;
 
  + SEP #$20                                                   ;83839E|E220    |      ;
    STZ.W strcAudio.toolId                                     ;8383A0|9C1901  |000119;
    RTL                                                        ;8383A3|6B      |      ;
 
 
fAudioUnknown_8383A4:
    SEP #$20                                                   ;8383A4|E220    |      ;
    LDA.W strcAudio.trackId                                    ;8383A6|AD1001  |000110;
    CMP.W strcAudio.trackIdCopy                                ;8383A9|CD1701  |000117;
    BEQ +                                                      ;8383AC|F022    |8383D0;
    LDA.B #$00                                                 ;8383AE|A900    |      ;
    JSL.L fAudioUnknown_8389C7                                 ;8383B0|22C78983|8389C7;
    SEP #$20                                                   ;8383B4|E220    |      ;
    LDA.W strcAudio.trackId                                    ;8383B6|AD1001  |000110;
    BEQ +                                                      ;8383B9|F015    |8383D0;
    CMP.B #$FF                                                 ;8383BB|C9FF    |      ;
    BEQ +                                                      ;8383BD|F011    |8383D0;
    JSL.L fAudioUnknown_838A26                                 ;8383BF|22268A83|838A26;
    JSL.L fAudioUnknown_83878C                                 ;8383C3|228C8783|83878C;
    BRA +                                                      ;8383C7|8007    |8383D0;
 
    SEP #$20                                                   ;8383C9|E220    |      ;
    LDA.B #$00                                                 ;8383CB|A900    |      ;
    STA.W strcAudio.trackId                                    ;8383CD|8D1001  |000110;
 
  + SEP #$20                                                   ;8383D0|E220    |      ;
    LDA.B #$06                                                 ;8383D2|A906    |      ;
    STA.W strcAudio.reg115                                     ;8383D4|8D1501  |000115;
    LDA.B #$03                                                 ;8383D7|A903    |      ;
    STA.W strcAudio.reg114                                     ;8383D9|8D1401  |000114;
    SEP #$20                                                   ;8383DC|E220    |      ;
    LDA.B #$00                                                 ;8383DE|A900    |      ;
    XBA                                                        ;8383E0|EB      |      ;
    LDA.W strcAudio.trackId                                    ;8383E1|AD1001  |000110;
    STA.W strcAudio.unk118                                     ;8383E4|8D1801  |000118;
    CMP.B #$FF                                                 ;8383E7|C9FF    |      ;
    BNE +                                                      ;8383E9|D005    |8383F0;
    LDA.B #$00                                                 ;8383EB|A900    |      ;
    STA.W strcAudio.unk118                                     ;8383ED|8D1801  |000118;
 
  + REP #$20                                                   ;8383F0|C220    |      ;
    TAX                                                        ;8383F2|AA      |      ;
    SEP #$20                                                   ;8383F3|E220    |      ;
    LDA.L nToolSoundData_80B8CD,X                              ;8383F5|BFCDB880|80B8CD;
    STA.W strcAudio.index                                      ;8383F9|8D0301  |000103;
    JSL.L fAudioUnknown_83833E                                 ;8383FC|223E8383|83833E;
 
fAudioReturn_838400:
    RTL                                                        ;838400|6B      |      ; FIXME: I want to be .return
 
 
fAudioUnknown_838401:
    SEP #$20                                                   ;838401|E220    |      ;
    LDA.W strcAudio.trackId                                    ;838403|AD1001  |000110;
    CMP.W strcAudio.trackIdCopy                                ;838406|CD1701  |000117;
    BEQ .return                                                ;838409|F013    |83841E;
    LDA.W strcAudio.trackIdCopy                                ;83840B|AD1701  |000117;
    BEQ fAudioReturn_838400                                    ;83840E|F0F0    |838400; BUG - should be .return in this function rather than previous one since we are out of function scope
    LDA.B #$01                                                 ;838410|A901    |      ;
    STA.W strcAudio.unk112                                     ;838412|8D1201  |000112;
    LDA.B #$40                                                 ;838415|A940    |      ;
    STA.W strcAudio.unk113                                     ;838417|8D1301  |000113;
    JSL.L fAudioUnknown_838D8B                                 ;83841A|228B8D83|838D8B;
 
.return:
    RTL                                                        ;83841E|6B      |      ;
 
 
fAudioUnknown_83841F:
    SEP #$20                                                   ;83841F|E220    |      ;
    LDA.W strcAudio.trackId                                    ;838421|AD1001  |000110;
    CMP.W strcAudio.trackIdCopy                                ;838424|CD1701  |000117;
    BEQ .return                                                ;838427|F013    |83843C;
    LDA.W strcAudio.trackIdCopy                                ;838429|AD1701  |000117;
    BEQ .return                                                ;83842C|F00E    |83843C;
    LDA.B #$01                                                 ;83842E|A901    |      ;
    STA.W strcAudio.unk112                                     ;838430|8D1201  |000112;
    LDA.B #$10                                                 ;838433|A910    |      ;
    STA.W strcAudio.unk113                                     ;838435|8D1301  |000113;
    JSL.L fAudioUnknown_838D8B                                 ;838438|228B8D83|838D8B;
 
.return:
    RTL                                                        ;83843C|6B      |      ;
 
 
fAudio_UploadData:
    PHP                                                        ;83843D|08      |      ;
    REP #$30                                                   ;83843E|C230    |      ;
    REP #$30                                                   ;838440|C230    |      ;
    LDY.W #$0000                                               ;838442|A00000  |      ;
    LDA.W #$BBAA                                               ;838445|A9AABB  |      ;
 
  - CMP.W SNES_APUIO0                                          ;838448|CD4021  |002140;
    BNE -                                                      ;83844B|D0FB    |838448;
    SEP #$20                                                   ;83844D|E220    |      ;
    SEP #$20                                                   ;83844F|E220    |      ;
    LDA.B #$CC                                                 ;838451|A9CC    |      ;
    PHA                                                        ;838453|48      |      ;
    REP #$20                                                   ;838454|C220    |      ;
    REP #$20                                                   ;838456|C220    |      ;
    LDA.W #$0FD6                                               ;838458|A9D60F  |      ;
    TAX                                                        ;83845B|AA      |      ;
    SEP #$20                                                   ;83845C|E220    |      ;
    LDA.B #$00                                                 ;83845E|A900    |      ;
    STA.W SNES_APUIO2                                          ;838460|8D4221  |002142;
    LDA.B #$05                                                 ;838463|A905    |      ;
    STA.W SNES_APUIO3                                          ;838465|8D4321  |002143;
    SEP #$20                                                   ;838468|E220    |      ;
    CPX.W #$0001                                               ;83846A|E00100  |      ;
    LDA.B #$00                                                 ;83846D|A900    |      ;
    ROL A                                                      ;83846F|2A      |      ;
    STA.W SNES_APUIO1                                          ;838470|8D4121  |002141;
    ADC.B #$7F                                                 ;838473|697F    |      ;
    PLA                                                        ;838475|68      |      ;
    STA.W SNES_APUIO0                                          ;838476|8D4021  |002140;
 
  - CMP.W SNES_APUIO0                                          ;838479|CD4021  |002140;
    BNE -                                                      ;83847C|D0FB    |838479;
 
.loop:
    LDA.B [ptrAudioData],Y                                     ;83847E|B70A    |00000A;
    INY                                                        ;838480|C8      |      ;
    XBA                                                        ;838481|EB      |      ;
    LDA.B #$00                                                 ;838482|A900    |      ;
    BRA +                                                      ;838484|800B    |838491;
 
 
 -- XBA                                                        ;838486|EB      |      ;
    LDA.B [ptrAudioData],Y                                     ;838487|B70A    |00000A;
    INY                                                        ;838489|C8      |      ;
    XBA                                                        ;83848A|EB      |      ;
 
  - CMP.W SNES_APUIO0                                          ;83848B|CD4021  |002140;
    BNE -                                                      ;83848E|D0FB    |83848B;
    INC A                                                      ;838490|1A      |      ;
 
  + REP #$20                                                   ;838491|C220    |      ;
    STA.W SNES_APUIO0                                          ;838493|8D4021  |002140;
    SEP #$20                                                   ;838496|E220    |      ;
    DEX                                                        ;838498|CA      |      ;
    BNE --                                                     ;838499|D0EB    |838486;
 
  - CMP.W SNES_APUIO0                                          ;83849B|CD4021  |002140;
    BNE -                                                      ;83849E|D0FB    |83849B;
 
  - ADC.B #$03                                                 ;8384A0|6903    |      ;
    BEQ -                                                      ;8384A2|F0FC    |8384A0;
    PHA                                                        ;8384A4|48      |      ;
    REP #$20                                                   ;8384A5|C220    |      ;
    REP #$20                                                   ;8384A7|C220    |      ;
    LDA.W #$0000                                               ;8384A9|A90000  |      ;
    TAX                                                        ;8384AC|AA      |      ;
    SEP #$20                                                   ;8384AD|E220    |      ;
    LDA.B #$00                                                 ;8384AF|A900    |      ;
    STA.W SNES_APUIO2                                          ;8384B1|8D4221  |002142;
    LDA.B #$05                                                 ;8384B4|A905    |      ;
    STA.W SNES_APUIO3                                          ;8384B6|8D4321  |002143;
    SEP #$20                                                   ;8384B9|E220    |      ;
    CPX.W #$0001                                               ;8384BB|E00100  |      ;
    LDA.B #$00                                                 ;8384BE|A900    |      ;
    ROL A                                                      ;8384C0|2A      |      ;
    STA.W SNES_APUIO1                                          ;8384C1|8D4121  |002141;
    ADC.B #$7F                                                 ;8384C4|697F    |      ;
    PLA                                                        ;8384C6|68      |      ;
    STA.W SNES_APUIO0                                          ;8384C7|8D4021  |002140;
 
  - CMP.W SNES_APUIO0                                          ;8384CA|CD4021  |002140;
    BNE -                                                      ;8384CD|D0FB    |8384CA;
    BVS .loop                                                  ;8384CF|70AD    |83847E;
    PLP                                                        ;8384D1|28      |      ;
    RTL                                                        ;8384D2|6B      |      ;
 
 
fAudioUnknown_8384D3:
    SEP #$20                                                   ;8384D3|E220    |      ;
    REP #$10                                                   ;8384D5|C210    |      ;
    LDA.B #$01                                                 ;8384D7|A901    |      ;
    STA.B strcVariables.n8Temp1                                ;8384D9|8592    |000092;
    JSR.W fAudioUnknown_838E8B                                 ;8384DB|208B8E  |838E8B;
 
.wait1:
    SEP #$20                                                   ;8384DE|E220    |      ;
    LDA.W SNES_APUIO3                                          ;8384E0|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;8384E3|8593    |000093;
    LDA.W SNES_APUIO3                                          ;8384E5|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;8384E8|C593    |000093;
    BNE .wait1                                                 ;8384EA|D0F2    |8384DE;
    LDA.B #$01                                                 ;8384EC|A901    |      ;
    CMP.W SNES_APUIO3                                          ;8384EE|CD4321  |002143;
    BNE .wait1                                                 ;8384F1|D0EB    |8384DE;
    REP #$20                                                   ;8384F3|C220    |      ;
    LDA.W #$03F2                                               ;8384F5|A9F203  |      ;
    STA.B strcVariables.n16Temp1                               ;8384F8|857E    |00007E;
    LDA.W #$0003                                               ;8384FA|A90300  |      ;
    STA.B strcVariables.n16Temp2                               ;8384FD|8580    |000080;
    JSL.L fMathDivide                                          ;8384FF|22828083|838082;
    STA.B strcVariables.n16Temp2                               ;838503|8580    |000080;
    LDA.B strcVariables.n16Temp1                               ;838505|A57E    |00007E;
    BEQ +                                                      ;838507|F002    |83850B;
    INC.B strcVariables.n16Temp2                               ;838509|E680    |000080;
 
  + LDA.B strcVariables.n16Temp2                               ;83850B|A580    |000080;
    SEP #$20                                                   ;83850D|E220    |      ;
    STA.W SNES_APUIO0                                          ;83850F|8D4021  |002140;
    XBA                                                        ;838512|EB      |      ;
    STA.W SNES_APUIO1                                          ;838513|8D4121  |002141;
    STZ.W SNES_APUIO2                                          ;838516|9C4221  |002142;
    LDA.B #$02                                                 ;838519|A902    |      ;
    STA.W SNES_APUIO3                                          ;83851B|8D4321  |002143;
 
.wait2:
    SEP #$20                                                   ;83851E|E220    |      ;
    LDA.W SNES_APUIO3                                          ;838520|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;838523|8593    |000093;
    LDA.W SNES_APUIO3                                          ;838525|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;838528|C593    |000093;
    BNE .wait2                                                 ;83852A|D0F2    |83851E;
    LDA.W SNES_APUIO3                                          ;83852C|AD4321  |002143;
    CMP.B #$04                                                 ;83852F|C904    |      ;
    BNE .wait2                                                 ;838531|D0EB    |83851E;
    SEP #$20                                                   ;838533|E220    |      ;
    STZ.W SNES_APUIO3                                          ;838535|9C4321  |002143;
    LDY.W #$0000                                               ;838538|A00000  |      ;
    REP #$20                                                   ;83853B|C220    |      ;
    LDA.W #$D120                                               ;83853D|A920D1  |      ;
    STA.B ptrAudioData                                         ;838540|850A    |00000A;
    SEP #$20                                                   ;838542|E220    |      ;
    LDA.B #$B2                                                 ;838544|A9B2    |      ;
    STA.B ptrAudioData+2                                       ;838546|850C    |00000C;
    REP #$20                                                   ;838548|C220    |      ;
    LDA.B strcVariables.n16Temp2                               ;83854A|A580    |000080;
    TAX                                                        ;83854C|AA      |      ;
 
.wait3:
    SEP #$20                                                   ;83854D|E220    |      ;
    LDA.W SNES_APUIO3                                          ;83854F|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;838552|8593    |000093;
    LDA.W SNES_APUIO3                                          ;838554|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;838557|C593    |000093;
    BNE .wait3                                                 ;838559|D0F2    |83854D;
    LDA.B #$01                                                 ;83855B|A901    |      ;
    CMP.W SNES_APUIO3                                          ;83855D|CD4321  |002143;
    BNE .wait3                                                 ;838560|D0EB    |83854D;
    LDA.B [ptrAudioData],Y                                     ;838562|B70A    |00000A;
    STA.W SNES_APUIO0                                          ;838564|8D4021  |002140;
    INY                                                        ;838567|C8      |      ;
    LDA.B [ptrAudioData],Y                                     ;838568|B70A    |00000A;
    STA.W SNES_APUIO1                                          ;83856A|8D4121  |002141;
    INY                                                        ;83856D|C8      |      ;
    LDA.B [ptrAudioData],Y                                     ;83856E|B70A    |00000A;
    STA.W SNES_APUIO2                                          ;838570|8D4221  |002142;
    INY                                                        ;838573|C8      |      ;
    DEX                                                        ;838574|CA      |      ;
    LDA.B #$02                                                 ;838575|A902    |      ;
    STA.W SNES_APUIO3                                          ;838577|8D4321  |002143;
 
.wait4:
    SEP #$20                                                   ;83857A|E220    |      ;
    LDA.W SNES_APUIO3                                          ;83857C|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;83857F|8593    |000093;
    LDA.W SNES_APUIO3                                          ;838581|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;838584|C593    |000093;
    BNE .wait4                                                 ;838586|D0F2    |83857A;
    LDA.B #$00                                                 ;838588|A900    |      ;
    CMP.W SNES_APUIO3                                          ;83858A|CD4321  |002143;
    BNE .wait4                                                 ;83858D|D0EB    |83857A;
    STZ.W SNES_APUIO3                                          ;83858F|9C4321  |002143;
    CPX.W #$0000                                               ;838592|E00000  |      ;
    BNE .wait3                                                 ;838595|D0B6    |83854D;
    RTL                                                        ;838597|6B      |      ;
 
 
fAudio_PlayAudio_Unknown838598:
    SEP #$20                                                   ;838598|E220    |      ; X: nAudioId (0x00 - 0x09)
    REP #$10                                                   ;83859A|C210    |      ;
    LDX.W #$0000                                               ;83859C|A20000  |      ;
 
.loop:
    LDA.L aAudioSampleLookupTable,X                            ;83859F|BFB19283|8392B1;
    STA.B strcVariables.n8Temp3                                ;8385A3|8594    |000094; sAudioData2Index
    BNE +                                                      ;8385A5|D009    |8385B0;
    INX                                                        ;8385A7|E8      |      ;
    CPX.W #$000A                                               ;8385A8|E00A00  |      ;
    BNE .loop                                                  ;8385AB|D0F2    |83859F;
    JMP.W .return                                              ;8385AD|4C8B87  |83878B;
 
 
  + SEP #$20                                                   ;8385B0|E220    |      ;
    LDA.B #$02                                                 ;8385B2|A902    |      ;
    STA.B strcVariables.n8Temp1                                ;8385B4|8592    |000092;
    JSR.W fAudioUnknown_838E8B                                 ;8385B6|208B8E  |838E8B;
 
.wait1:
    SEP #$20                                                   ;8385B9|E220    |      ;
    LDA.W SNES_APUIO3                                          ;8385BB|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;8385BE|8593    |000093;
    LDA.W SNES_APUIO3                                          ;8385C0|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;8385C3|C593    |000093;
    BNE .wait1                                                 ;8385C5|D0F2    |8385B9;
    LDA.B #$01                                                 ;8385C7|A901    |      ;
    CMP.W SNES_APUIO3                                          ;8385C9|CD4321  |002143;
    BNE .wait1                                                 ;8385CC|D0EB    |8385B9;
    PHX                                                        ;8385CE|DA      |      ;
    LDA.B #$00                                                 ;8385CF|A900    |      ;
    XBA                                                        ;8385D1|EB      |      ;
    LDA.B strcVariables.n8Temp3                                ;8385D2|A594    |000094; sAudioData2Index
    REP #$20                                                   ;8385D4|C220    |      ;
    STA.B strcVariables.n16Temp1                               ;8385D6|857E    |00007E;
    LDA.W #$000A                                               ;8385D8|A90A00  |      ;
    JSL.L fMathMultiply_7EbyA                                  ;8385DB|22008083|838000; Calculate new X offset (X * 0x0A)
    TAX                                                        ;8385DF|AA      |      ;
    SEP #$20                                                   ;8385E0|E220    |      ;
    LDA.B strcVariables.n8Temp3                                ;8385E2|A594    |000094; sAudioData2Index
    STA.W SNES_APUIO0                                          ;8385E4|8D4021  |002140;
    REP #$20                                                   ;8385E7|C220    |      ;
    LDA.L sAudioSampleData,X                                   ;8385E9|BFEF9083|8390EF;
    SEP #$20                                                   ;8385ED|E220    |      ;
    STA.W SNES_APUIO1                                          ;8385EF|8D4121  |002141;
    XBA                                                        ;8385F2|EB      |      ;
    STA.W SNES_APUIO2                                          ;8385F3|8D4221  |002142;
    LDA.B #$02                                                 ;8385F6|A902    |      ;
    STA.W SNES_APUIO3                                          ;8385F8|8D4321  |002143;
    INX                                                        ;8385FB|E8      |      ;
    INX                                                        ;8385FC|E8      |      ;
 
.wait2:
    SEP #$20                                                   ;8385FD|E220    |      ;
    LDA.W SNES_APUIO3                                          ;8385FF|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;838602|8593    |000093;
    LDA.W SNES_APUIO3                                          ;838604|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;838607|C593    |000093;
    BNE .wait2                                                 ;838609|D0F2    |8385FD;
    LDA.W SNES_APUIO3                                          ;83860B|AD4321  |002143;
    CMP.B #$04                                                 ;83860E|C904    |      ;
    BEQ +                                                      ;838610|F002    |838614;
    BRA .wait2                                                 ;838612|80E9    |8385FD;
 
 
  + STZ.W SNES_APUIO3                                          ;838614|9C4321  |002143;
 
  - SEP #$20                                                   ;838617|E220    |      ;
    LDA.W SNES_APUIO3                                          ;838619|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;83861C|8593    |000093;
    LDA.W SNES_APUIO3                                          ;83861E|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;838621|C593    |000093;
    BNE -                                                      ;838623|D0F2    |838617;
 
  - LDA.B #$01                                                 ;838625|A901    |      ;
    CMP.W SNES_APUIO3                                          ;838627|CD4321  |002143;
    BNE -                                                      ;83862A|D0F9    |838625;
    LDA.L sAudioSampleData,X                                   ;83862C|BFEF9083|8390EF;
    STA.W SNES_APUIO0                                          ;838630|8D4021  |002140;
    INX                                                        ;838633|E8      |      ;
    LDA.L sAudioSampleData,X                                   ;838634|BFEF9083|8390EF;
    STA.W SNES_APUIO1                                          ;838638|8D4121  |002141;
    INX                                                        ;83863B|E8      |      ;
    LDA.L sAudioSampleData,X                                   ;83863C|BFEF9083|8390EF;
    STA.W SNES_APUIO2                                          ;838640|8D4221  |002142;
    LDA.B #$02                                                 ;838643|A902    |      ;
    STA.W SNES_APUIO3                                          ;838645|8D4321  |002143;
    INX                                                        ;838648|E8      |      ;
 
.wait3:
    SEP #$20                                                   ;838649|E220    |      ;
    LDA.W SNES_APUIO3                                          ;83864B|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;83864E|8593    |000093;
    LDA.W SNES_APUIO3                                          ;838650|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;838653|C593    |000093;
    BNE .wait3                                                 ;838655|D0F2    |838649;
    LDA.W SNES_APUIO3                                          ;838657|AD4321  |002143;
    CMP.B #$04                                                 ;83865A|C904    |      ;
    BEQ +                                                      ;83865C|F002    |838660;
    BRA .wait3                                                 ;83865E|80E9    |838649;
 
 
  + STZ.W SNES_APUIO3                                          ;838660|9C4321  |002143;
 
  - SEP #$20                                                   ;838663|E220    |      ;
    LDA.W SNES_APUIO3                                          ;838665|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;838668|8593    |000093;
    LDA.W SNES_APUIO3                                          ;83866A|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;83866D|C593    |000093;
    BNE -                                                      ;83866F|D0F2    |838663;
 
  - LDA.B #$01                                                 ;838671|A901    |      ;
    CMP.W SNES_APUIO3                                          ;838673|CD4321  |002143;
    BNE -                                                      ;838676|D0F9    |838671;
    LDA.L sAudioSampleData,X                                   ;838678|BFEF9083|8390EF;
    STA.W SNES_APUIO0                                          ;83867C|8D4021  |002140;
    INX                                                        ;83867F|E8      |      ;
    LDA.L sAudioSampleData,X                                   ;838680|BFEF9083|8390EF;
    STA.W SNES_APUIO1                                          ;838684|8D4121  |002141;
    STZ.W SNES_APUIO2                                          ;838687|9C4221  |002142;
    LDA.B #$02                                                 ;83868A|A902    |      ;
    STA.W SNES_APUIO3                                          ;83868C|8D4321  |002143;
    INX                                                        ;83868F|E8      |      ;
 
.wait4:
    SEP #$20                                                   ;838690|E220    |      ;
    LDA.W SNES_APUIO3                                          ;838692|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;838695|8593    |000093;
    LDA.W SNES_APUIO3                                          ;838697|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;83869A|C593    |000093;
    BNE .wait4                                                 ;83869C|D0F2    |838690;
    LDA.W SNES_APUIO3                                          ;83869E|AD4321  |002143;
    CMP.B #$04                                                 ;8386A1|C904    |      ;
    BEQ +                                                      ;8386A3|F002    |8386A7;
    BRA .wait4                                                 ;8386A5|80E9    |838690;
 
 
  + STZ.W SNES_APUIO3                                          ;8386A7|9C4321  |002143;
 
  - SEP #$20                                                   ;8386AA|E220    |      ;
    LDA.W SNES_APUIO3                                          ;8386AC|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;8386AF|8593    |000093;
    LDA.W SNES_APUIO3                                          ;8386B1|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;8386B4|C593    |000093;
    BNE -                                                      ;8386B6|D0F2    |8386AA;
 
  - LDA.B #$01                                                 ;8386B8|A901    |      ;
    CMP.W SNES_APUIO3                                          ;8386BA|CD4321  |002143;
    BNE -                                                      ;8386BD|D0F9    |8386B8;
    REP #$20                                                   ;8386BF|C220    |      ;
    LDA.L sAudioSampleData,X                                   ;8386C1|BFEF9083|8390EF; read ptr at offset 7
    STA.B ptrAudioData                                         ;8386C5|850A    |00000A; store 16b to $0A
    INX                                                        ;8386C7|E8      |      ;
    INX                                                        ;8386C8|E8      |      ;
    SEP #$20                                                   ;8386C9|E220    |      ;
    LDA.L sAudioSampleData,X                                   ;8386CB|BFEF9083|8390EF;
    STA.B ptrAudioData+2                                       ;8386CF|850C    |00000C; store 8b to $0C
    LDA.B #$00                                                 ;8386D1|A900    |      ;
    XBA                                                        ;8386D3|EB      |      ;
    LDA.B strcVariables.n8Temp3                                ;8386D4|A594    |000094; sAudioData2Index
    ASL A                                                      ;8386D6|0A      |      ;
    REP #$20                                                   ;8386D7|C220    |      ;
    TAX                                                        ;8386D9|AA      |      ;
    LDA.L aAudioSampleSize,X                                   ;8386DA|BFFF8E83|838EFF;
    STA.B strcVariables.n16Temp1                               ;8386DE|857E    |00007E;
    LDA.W #$0003                                               ;8386E0|A90300  |      ;
    STA.B strcVariables.n16Temp2                               ;8386E3|8580    |000080;
    JSL.L fMathDivide                                          ;8386E5|22828083|838082;
    STA.B strcVariables.n16Temp2                               ;8386E9|8580    |000080;
    LDA.B strcVariables.n16Temp1                               ;8386EB|A57E    |00007E;
    BEQ +                                                      ;8386ED|F002    |8386F1;
    INC.B strcVariables.n16Temp2                               ;8386EF|E680    |000080;
 
  + LDA.B strcVariables.n16Temp2                               ;8386F1|A580    |000080;
    TAX                                                        ;8386F3|AA      |      ; X = nAudioTrackSize / 3 (we copy 3 bytes at time
    SEP #$20                                                   ;8386F4|E220    |      ;
    STA.W SNES_APUIO0                                          ;8386F6|8D4021  |002140;
    XBA                                                        ;8386F9|EB      |      ;
    STA.W SNES_APUIO1                                          ;8386FA|8D4121  |002141;
    STZ.W SNES_APUIO2                                          ;8386FD|9C4221  |002142;
    LDA.B #$02                                                 ;838700|A902    |      ;
    STA.W SNES_APUIO3                                          ;838702|8D4321  |002143;
    LDY.W #$0000                                               ;838705|A00000  |      ;
 
.wait5:
    SEP #$20                                                   ;838708|E220    |      ;
    LDA.W SNES_APUIO3                                          ;83870A|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;83870D|8593    |000093;
    LDA.W SNES_APUIO3                                          ;83870F|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;838712|C593    |000093;
    BNE .wait5                                                 ;838714|D0F2    |838708;
    LDA.W SNES_APUIO3                                          ;838716|AD4321  |002143;
    CMP.B #$04                                                 ;838719|C904    |      ;
    BEQ +                                                      ;83871B|F002    |83871F;
    BRA .wait5                                                 ;83871D|80E9    |838708;
 
 
  + STZ.W SNES_APUIO3                                          ;83871F|9C4321  |002143;
 
  - SEP #$20                                                   ;838722|E220    |      ;
    LDA.W SNES_APUIO3                                          ;838724|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;838727|8593    |000093;
    LDA.W SNES_APUIO3                                          ;838729|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;83872C|C593    |000093;
    BNE -                                                      ;83872E|D0F2    |838722;
 
  - LDA.B #$01                                                 ;838730|A901    |      ;
    CMP.W SNES_APUIO3                                          ;838732|CD4321  |002143;
    BNE -                                                      ;838735|D0F9    |838730;
 
.copyData:
    LDA.B [ptrAudioData],Y                                     ;838737|B70A    |00000A;
    STA.W SNES_APUIO0                                          ;838739|8D4021  |002140;
    INY                                                        ;83873C|C8      |      ;
    LDA.B [ptrAudioData],Y                                     ;83873D|B70A    |00000A;
    STA.W SNES_APUIO1                                          ;83873F|8D4121  |002141;
    INY                                                        ;838742|C8      |      ;
    LDA.B [ptrAudioData],Y                                     ;838743|B70A    |00000A;
    STA.W SNES_APUIO2                                          ;838745|8D4221  |002142;
    INY                                                        ;838748|C8      |      ;
    DEX                                                        ;838749|CA      |      ;
    LDA.B #$02                                                 ;83874A|A902    |      ;
    STA.W SNES_APUIO3                                          ;83874C|8D4321  |002143;
 
.wait6:
    SEP #$20                                                   ;83874F|E220    |      ;
    LDA.W SNES_APUIO3                                          ;838751|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;838754|8593    |000093;
    LDA.W SNES_APUIO3                                          ;838756|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;838759|C593    |000093;
    BNE .wait6                                                 ;83875B|D0F2    |83874F;
    LDA.B #$00                                                 ;83875D|A900    |      ;
    CMP.W SNES_APUIO3                                          ;83875F|CD4321  |002143;
    BNE .wait6                                                 ;838762|D0EB    |83874F;
    STZ.W SNES_APUIO3                                          ;838764|9C4321  |002143;
 
  - SEP #$20                                                   ;838767|E220    |      ;
    LDA.W SNES_APUIO3                                          ;838769|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;83876C|8593    |000093;
    LDA.W SNES_APUIO3                                          ;83876E|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;838771|C593    |000093;
    BNE -                                                      ;838773|D0F2    |838767;
 
  - LDA.B #$01                                                 ;838775|A901    |      ;
    CMP.W SNES_APUIO3                                          ;838777|CD4321  |002143;
    BNE -                                                      ;83877A|D0F9    |838775;
    CPX.W #$0000                                               ;83877C|E00000  |      ;
    BNE .copyData                                              ;83877F|D0B6    |838737;
    PLX                                                        ;838781|FA      |      ;
    INX                                                        ;838782|E8      |      ;
    CPX.W #$000A                                               ;838783|E00A00  |      ;
    BEQ .return                                                ;838786|F003    |83878B;
    JMP.W .loop                                                ;838788|4C9F85  |83859F;
 
 
.return:
    RTL                                                        ;83878B|6B      |      ;
 
 
fAudioUnknown_83878C:
    SEP #$20                                                   ;83878C|E220    |      ;
    REP #$10                                                   ;83878E|C210    |      ;
    LDX.W #$0000                                               ;838790|A20000  |      ;
    STZ.W strcAudio.index                                      ;838793|9C0301  |000103;
    STZ.W strcAudio.unk10F                                     ;838796|9C0F01  |00010F;
 
  - STZ.W strcAudio.list,X                                     ;838799|9E0401  |000104;
    INX                                                        ;83879C|E8      |      ;
    CPX.W #$000B                                               ;83879D|E00B00  |      ;
    BNE -                                                      ;8387A0|D0F7    |838799;
    LDY.W #$0000                                               ;8387A2|A00000  |      ;
    LDA.B #$00                                                 ;8387A5|A900    |      ;
    XBA                                                        ;8387A7|EB      |      ;
    LDA.W strcAudio.trackId                                    ;8387A8|AD1001  |000110;
    REP #$20                                                   ;8387AB|C220    |      ;
    STA.B strcVariables.n16Temp1                               ;8387AD|857E    |00007E;
    LDA.W #$000E                                               ;8387AF|A90E00  |      ;
    JSL.L fMathMultiply_7EbyA                                  ;8387B2|22008083|838000;
    TAX                                                        ;8387B6|AA      |      ;
    INX                                                        ;8387B7|E8      |      ;
    INX                                                        ;8387B8|E8      |      ;
    INX                                                        ;8387B9|E8      |      ;
    CLC                                                        ;8387BA|18      |      ;
    ADC.W #$000E                                               ;8387BB|690E00  |      ;
    STA.B strcVariables.n16Temp4                               ;8387BE|8584    |000084; nIndex = nAudioMusicTrackId * 0x0E + 0x0E + 3
 
.loop:
    SEP #$20                                                   ;8387C0|E220    |      ;
    LDA.L sAudioData1_838F83,X                                 ;8387C2|BF838F83|838F83;
    STA.B strcVariables.n8Temp3                                ;8387C6|8594    |000094;
    BNE .label1                                                ;8387C8|D010    |8387DA;
    REP #$20                                                   ;8387CA|C220    |      ;
    INX                                                        ;8387CC|E8      |      ;
    CPX.B strcVariables.n16Temp4                               ;8387CD|E484    |000084;
    BNE .loop                                                  ;8387CF|D0EF    |8387C0;
    SEP #$20                                                   ;8387D1|E220    |      ;
    LDA.B #$06                                                 ;8387D3|A906    |      ;
    STA.B strcVariables.n8Temp3                                ;8387D5|8594    |000094;
    DEX                                                        ;8387D7|CA      |      ;
    BRA .label2                                                ;8387D8|800D    |8387E7;
 
 
.label1:
    SEP #$20                                                   ;8387DA|E220    |      ;
    LDA.B strcVariables.n8Temp3                                ;8387DC|A594    |000094;
    STA.W strcAudio.list,Y                                     ;8387DE|990401  |000104;
    INC.W strcAudio.index                                      ;8387E1|EE0301  |000103;
    INC.W strcAudio.unk10F                                     ;8387E4|EE0F01  |00010F;
 
.label2:
    SEP #$20                                                   ;8387E7|E220    |      ;
    LDA.B #$03                                                 ;8387E9|A903    |      ;
    STA.B strcVariables.n8Temp1                                ;8387EB|8592    |000092;
    JSR.W fAudioUnknown_838E8B                                 ;8387ED|208B8E  |838E8B;
 
.wait1:
    SEP #$20                                                   ;8387F0|E220    |      ;
    LDA.W SNES_APUIO3                                          ;8387F2|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;8387F5|8593    |000093;
    LDA.W SNES_APUIO3                                          ;8387F7|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;8387FA|C593    |000093;
    BNE .wait1                                                 ;8387FC|D0F2    |8387F0;
    LDA.B #$01                                                 ;8387FE|A901    |      ;
    CMP.W SNES_APUIO3                                          ;838800|CD4321  |002143;
    BNE .wait1                                                 ;838803|D0EB    |8387F0;
    PHX                                                        ;838805|DA      |      ;
    PHY                                                        ;838806|5A      |      ;
    LDA.B #$00                                                 ;838807|A900    |      ;
    XBA                                                        ;838809|EB      |      ;
    LDA.B strcVariables.n8Temp3                                ;83880A|A594    |000094;
    REP #$20                                                   ;83880C|C220    |      ;
    STA.B strcVariables.n16Temp1                               ;83880E|857E    |00007E;
    LDA.W #$000A                                               ;838810|A90A00  |      ;
    JSL.L fMathMultiply_7EbyA                                  ;838813|22008083|838000;
    TAX                                                        ;838817|AA      |      ;
    SEP #$20                                                   ;838818|E220    |      ;
    LDA.B strcVariables.n8Temp3                                ;83881A|A594    |000094;
    STA.W SNES_APUIO0                                          ;83881C|8D4021  |002140;
    REP #$20                                                   ;83881F|C220    |      ;
    LDA.L sAudioSampleData,X                                   ;838821|BFEF9083|8390EF;
    SEP #$20                                                   ;838825|E220    |      ;
    STA.W SNES_APUIO1                                          ;838827|8D4121  |002141;
    XBA                                                        ;83882A|EB      |      ;
    STA.W SNES_APUIO2                                          ;83882B|8D4221  |002142;
    LDA.B #$02                                                 ;83882E|A902    |      ;
    STA.W SNES_APUIO3                                          ;838830|8D4321  |002143;
    INX                                                        ;838833|E8      |      ;
    INX                                                        ;838834|E8      |      ;
 
.wait2:
    SEP #$20                                                   ;838835|E220    |      ;
    LDA.W SNES_APUIO3                                          ;838837|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;83883A|8593    |000093;
    LDA.W SNES_APUIO3                                          ;83883C|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;83883F|C593    |000093;
    BNE .wait2                                                 ;838841|D0F2    |838835;
    LDA.W SNES_APUIO3                                          ;838843|AD4321  |002143;
    CMP.B #$04                                                 ;838846|C904    |      ;
    BEQ +                                                      ;838848|F002    |83884C;
    BRA .wait2                                                 ;83884A|80E9    |838835;
 
 
  + STZ.W SNES_APUIO3                                          ;83884C|9C4321  |002143;
 
  - SEP #$20                                                   ;83884F|E220    |      ;
    LDA.W SNES_APUIO3                                          ;838851|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;838854|8593    |000093;
    LDA.W SNES_APUIO3                                          ;838856|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;838859|C593    |000093;
    BNE -                                                      ;83885B|D0F2    |83884F;
 
  - LDA.B #$01                                                 ;83885D|A901    |      ;
    CMP.W SNES_APUIO3                                          ;83885F|CD4321  |002143;
    BNE -                                                      ;838862|D0F9    |83885D;
    LDA.L sAudioSampleData,X                                   ;838864|BFEF9083|8390EF;
    STA.W SNES_APUIO0                                          ;838868|8D4021  |002140;
    INX                                                        ;83886B|E8      |      ;
    LDA.L sAudioSampleData,X                                   ;83886C|BFEF9083|8390EF;
    STA.W SNES_APUIO1                                          ;838870|8D4121  |002141;
    INX                                                        ;838873|E8      |      ;
    LDA.L sAudioSampleData,X                                   ;838874|BFEF9083|8390EF;
    STA.W SNES_APUIO2                                          ;838878|8D4221  |002142;
    LDA.B #$02                                                 ;83887B|A902    |      ;
    STA.W SNES_APUIO3                                          ;83887D|8D4321  |002143;
    INX                                                        ;838880|E8      |      ;
 
.wait3:
    SEP #$20                                                   ;838881|E220    |      ;
    LDA.W SNES_APUIO3                                          ;838883|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;838886|8593    |000093;
    LDA.W SNES_APUIO3                                          ;838888|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;83888B|C593    |000093;
    BNE .wait3                                                 ;83888D|D0F2    |838881;
    LDA.W SNES_APUIO3                                          ;83888F|AD4321  |002143;
    CMP.B #$04                                                 ;838892|C904    |      ;
    BEQ +                                                      ;838894|F002    |838898;
    BRA .wait3                                                 ;838896|80E9    |838881;
 
 
  + STZ.W SNES_APUIO3                                          ;838898|9C4321  |002143;
 
  - SEP #$20                                                   ;83889B|E220    |      ;
    LDA.W SNES_APUIO3                                          ;83889D|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;8388A0|8593    |000093;
    LDA.W SNES_APUIO3                                          ;8388A2|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;8388A5|C593    |000093;
    BNE -                                                      ;8388A7|D0F2    |83889B;
 
  - LDA.B #$01                                                 ;8388A9|A901    |      ;
    CMP.W SNES_APUIO3                                          ;8388AB|CD4321  |002143;
    BNE -                                                      ;8388AE|D0F9    |8388A9;
    LDA.L sAudioSampleData,X                                   ;8388B0|BFEF9083|8390EF;
    STA.W SNES_APUIO0                                          ;8388B4|8D4021  |002140;
    INX                                                        ;8388B7|E8      |      ;
    LDA.L sAudioSampleData,X                                   ;8388B8|BFEF9083|8390EF;
    STA.W SNES_APUIO1                                          ;8388BC|8D4121  |002141;
    STZ.W SNES_APUIO2                                          ;8388BF|9C4221  |002142;
    LDA.B #$02                                                 ;8388C2|A902    |      ;
    STA.W SNES_APUIO3                                          ;8388C4|8D4321  |002143;
    INX                                                        ;8388C7|E8      |      ;
 
.wait4:
    SEP #$20                                                   ;8388C8|E220    |      ;
    LDA.W SNES_APUIO3                                          ;8388CA|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;8388CD|8593    |000093;
    LDA.W SNES_APUIO3                                          ;8388CF|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;8388D2|C593    |000093;
    BNE .wait4                                                 ;8388D4|D0F2    |8388C8;
    LDA.W SNES_APUIO3                                          ;8388D6|AD4321  |002143;
    CMP.B #$04                                                 ;8388D9|C904    |      ;
    BEQ +                                                      ;8388DB|F002    |8388DF;
    BRA .wait4                                                 ;8388DD|80E9    |8388C8;
 
 
  + STZ.W SNES_APUIO3                                          ;8388DF|9C4321  |002143;
 
  - SEP #$20                                                   ;8388E2|E220    |      ;
    LDA.W SNES_APUIO3                                          ;8388E4|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;8388E7|8593    |000093;
    LDA.W SNES_APUIO3                                          ;8388E9|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;8388EC|C593    |000093;
    BNE -                                                      ;8388EE|D0F2    |8388E2;
 
  - LDA.B #$01                                                 ;8388F0|A901    |      ;
    CMP.W SNES_APUIO3                                          ;8388F2|CD4321  |002143;
    BNE -                                                      ;8388F5|D0F9    |8388F0;
    REP #$20                                                   ;8388F7|C220    |      ;
    LDA.L sAudioSampleData,X                                   ;8388F9|BFEF9083|8390EF;
    STA.B ptrAudioData                                         ;8388FD|850A    |00000A;
    INX                                                        ;8388FF|E8      |      ;
    INX                                                        ;838900|E8      |      ;
    SEP #$20                                                   ;838901|E220    |      ;
    LDA.L sAudioSampleData,X                                   ;838903|BFEF9083|8390EF;
    STA.B ptrAudioData+2                                       ;838907|850C    |00000C;
    LDA.B #$00                                                 ;838909|A900    |      ;
    XBA                                                        ;83890B|EB      |      ;
    LDA.B strcVariables.n8Temp3                                ;83890C|A594    |000094;
    ASL A                                                      ;83890E|0A      |      ;
    REP #$20                                                   ;83890F|C220    |      ;
    TAX                                                        ;838911|AA      |      ;
    LDA.L aAudioSampleSize,X                                   ;838912|BFFF8E83|838EFF;
    STA.B strcVariables.n16Temp1                               ;838916|857E    |00007E;
    LDA.W #$0003                                               ;838918|A90300  |      ;
    STA.B strcVariables.n16Temp2                               ;83891B|8580    |000080;
    JSL.L fMathDivide                                          ;83891D|22828083|838082;
    STA.B strcVariables.n16Temp2                               ;838921|8580    |000080;
    LDA.B strcVariables.n16Temp1                               ;838923|A57E    |00007E;
    BEQ +                                                      ;838925|F002    |838929;
    INC.B strcVariables.n16Temp2                               ;838927|E680    |000080;
 
  + LDA.B strcVariables.n16Temp2                               ;838929|A580    |000080;
    TAX                                                        ;83892B|AA      |      ;
    SEP #$20                                                   ;83892C|E220    |      ;
    STA.W SNES_APUIO0                                          ;83892E|8D4021  |002140;
    XBA                                                        ;838931|EB      |      ;
    STA.W SNES_APUIO1                                          ;838932|8D4121  |002141;
    STZ.W SNES_APUIO2                                          ;838935|9C4221  |002142;
    LDA.B #$02                                                 ;838938|A902    |      ;
    STA.W SNES_APUIO3                                          ;83893A|8D4321  |002143;
    LDY.W #$0000                                               ;83893D|A00000  |      ;
 
.wait5:
    SEP #$20                                                   ;838940|E220    |      ;
    LDA.W SNES_APUIO3                                          ;838942|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;838945|8593    |000093;
    LDA.W SNES_APUIO3                                          ;838947|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;83894A|C593    |000093;
    BNE .wait5                                                 ;83894C|D0F2    |838940;
    LDA.W SNES_APUIO3                                          ;83894E|AD4321  |002143;
    CMP.B #$04                                                 ;838951|C904    |      ;
    BEQ +                                                      ;838953|F002    |838957;
    BRA .wait5                                                 ;838955|80E9    |838940;
 
 
  + STZ.W SNES_APUIO3                                          ;838957|9C4321  |002143;
 
  - SEP #$20                                                   ;83895A|E220    |      ;
    LDA.W SNES_APUIO3                                          ;83895C|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;83895F|8593    |000093;
    LDA.W SNES_APUIO3                                          ;838961|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;838964|C593    |000093;
    BNE -                                                      ;838966|D0F2    |83895A;
 
  - LDA.B #$01                                                 ;838968|A901    |      ;
    CMP.W SNES_APUIO3                                          ;83896A|CD4321  |002143;
    BNE -                                                      ;83896D|D0F9    |838968;
 
.copyData:
    LDA.B [ptrAudioData],Y                                     ;83896F|B70A    |00000A;
    STA.W SNES_APUIO0                                          ;838971|8D4021  |002140;
    INY                                                        ;838974|C8      |      ;
    LDA.B [ptrAudioData],Y                                     ;838975|B70A    |00000A;
    STA.W SNES_APUIO1                                          ;838977|8D4121  |002141;
    INY                                                        ;83897A|C8      |      ;
    LDA.B [ptrAudioData],Y                                     ;83897B|B70A    |00000A;
    STA.W SNES_APUIO2                                          ;83897D|8D4221  |002142;
    INY                                                        ;838980|C8      |      ;
    DEX                                                        ;838981|CA      |      ;
    LDA.B #$02                                                 ;838982|A902    |      ;
    STA.W SNES_APUIO3                                          ;838984|8D4321  |002143;
 
.wait6:
    SEP #$20                                                   ;838987|E220    |      ;
    LDA.W SNES_APUIO3                                          ;838989|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;83898C|8593    |000093;
    LDA.W SNES_APUIO3                                          ;83898E|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;838991|C593    |000093;
    BNE .wait6                                                 ;838993|D0F2    |838987;
    LDA.B #$00                                                 ;838995|A900    |      ;
    CMP.W SNES_APUIO3                                          ;838997|CD4321  |002143;
    BNE .wait6                                                 ;83899A|D0EB    |838987;
    STZ.W SNES_APUIO3                                          ;83899C|9C4321  |002143;
 
  - SEP #$20                                                   ;83899F|E220    |      ;
    LDA.W SNES_APUIO3                                          ;8389A1|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;8389A4|8593    |000093;
    LDA.W SNES_APUIO3                                          ;8389A6|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;8389A9|C593    |000093;
    BNE -                                                      ;8389AB|D0F2    |83899F;
 
  - LDA.B #$01                                                 ;8389AD|A901    |      ;
    CMP.W SNES_APUIO3                                          ;8389AF|CD4321  |002143;
    BNE -                                                      ;8389B2|D0F9    |8389AD;
    CPX.W #$0000                                               ;8389B4|E00000  |      ;
    BNE .copyData                                              ;8389B7|D0B6    |83896F;
    REP #$20                                                   ;8389B9|C220    |      ;
    PLY                                                        ;8389BB|7A      |      ;
    PLX                                                        ;8389BC|FA      |      ;
    INX                                                        ;8389BD|E8      |      ;
    INY                                                        ;8389BE|C8      |      ;
    CPX.B strcVariables.n16Temp4                               ;8389BF|E484    |000084;
    BEQ .return                                                ;8389C1|F003    |8389C6;
    JMP.W .loop                                                ;8389C3|4CC087  |8387C0;
 
 
.return:
    RTL                                                        ;8389C6|6B      |      ;
 
 
fAudioUnknown_8389C7:
    SEP #$20                                                   ;8389C7|E220    |      ;
    PHA                                                        ;8389C9|48      |      ;
    STA.B strcVariables.n8Temp3                                ;8389CA|8594    |000094;
 
  - LDA.B strcVariables.n8Temp3                                ;8389CC|A594    |000094;
    BNE .label1                                                ;8389CE|D005    |8389D5;
    JSR.W fAudioUnknown_838EC9                                 ;8389D0|20C98E  |838EC9;
    BNE -                                                      ;8389D3|D0F7    |8389CC;
 
.label1:
    REP #$10                                                   ;8389D5|C210    |      ;
    LDA.B #$04                                                 ;8389D7|A904    |      ;
    STA.B strcVariables.n8Temp1                                ;8389D9|8592    |000092;
    JSR.W fAudioUnknown_838E8B                                 ;8389DB|208B8E  |838E8B;
 
.wait1:
    SEP #$20                                                   ;8389DE|E220    |      ;
    LDA.W SNES_APUIO3                                          ;8389E0|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;8389E3|8593    |000093;
    LDA.W SNES_APUIO3                                          ;8389E5|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;8389E8|C593    |000093;
    BNE .wait1                                                 ;8389EA|D0F2    |8389DE;
    LDA.B #$01                                                 ;8389EC|A901    |      ;
    CMP.W SNES_APUIO3                                          ;8389EE|CD4321  |002143;
    BNE .wait1                                                 ;8389F1|D0EB    |8389DE;
    LDA.B strcVariables.n8Temp3                                ;8389F3|A594    |000094;
    STA.W SNES_APUIO0                                          ;8389F5|8D4021  |002140;
    STZ.W SNES_APUIO1                                          ;8389F8|9C4121  |002141;
    STZ.W SNES_APUIO2                                          ;8389FB|9C4221  |002142;
    LDA.B #$02                                                 ;8389FE|A902    |      ;
    STA.W SNES_APUIO3                                          ;838A00|8D4321  |002143;
 
  - LDA.W SNES_APUIO3                                          ;838A03|AD4321  |002143;
    CMP.B #$08                                                 ;838A06|C908    |      ;
    BEQ +                                                      ;838A08|F002    |838A0C;
    BRA -                                                      ;838A0A|80F7    |838A03;
 
 
  + STZ.W SNES_APUIO3                                          ;838A0C|9C4321  |002143;
    SEP #$20                                                   ;838A0F|E220    |      ;
    LDA.B #$00                                                 ;838A11|A900    |      ;
    XBA                                                        ;838A13|EB      |      ;
    PLA                                                        ;838A14|68      |      ;
    REP #$20                                                   ;838A15|C220    |      ;
    TAX                                                        ;838A17|AA      |      ;
    SEP #$20                                                   ;838A18|E220    |      ;
 
.zeroArray104:
    LDA.B #$00                                                 ;838A1A|A900    |      ;
    STA.W strcAudio.list,X                                     ;838A1C|9D0401  |000104;
    INX                                                        ;838A1F|E8      |      ;
    CPX.W #$000B                                               ;838A20|E00B00  |      ;
    BNE .zeroArray104                                          ;838A23|D0F5    |838A1A;
    RTL                                                        ;838A25|6B      |      ;
 
 
fAudioUnknown_838A26:
    SEP #$20                                                   ;838A26|E220    |      ;
    REP #$10                                                   ;838A28|C210    |      ;
    LDA.B #$05                                                 ;838A2A|A905    |      ;
    STA.B strcVariables.n8Temp1                                ;838A2C|8592    |000092;
    JSR.W fAudioUnknown_838E8B                                 ;838A2E|208B8E  |838E8B;
 
.wait1:
    SEP #$20                                                   ;838A31|E220    |      ;
    LDA.W SNES_APUIO3                                          ;838A33|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;838A36|8593    |000093;
    LDA.W SNES_APUIO3                                          ;838A38|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;838A3B|C593    |000093;
    BNE .wait1                                                 ;838A3D|D0F2    |838A31;
    LDA.B #$01                                                 ;838A3F|A901    |      ;
    CMP.W SNES_APUIO3                                          ;838A41|CD4321  |002143;
    BNE .wait1                                                 ;838A44|D0EB    |838A31;
    LDA.B #$00                                                 ;838A46|A900    |      ;
    XBA                                                        ;838A48|EB      |      ;
    LDA.W strcAudio.trackId                                    ;838A49|AD1001  |000110;
    ASL A                                                      ;838A4C|0A      |      ;
    REP #$20                                                   ;838A4D|C220    |      ;
    TAX                                                        ;838A4F|AA      |      ;
    LDA.L aAudioUnknown_838F4F,X                               ;838A50|BF4F8F83|838F4F;
    STA.B strcVariables.n16Temp1                               ;838A54|857E    |00007E;
    LDA.W #$0003                                               ;838A56|A90300  |      ;
    STA.B strcVariables.n16Temp2                               ;838A59|8580    |000080;
    JSL.L fMathDivide                                          ;838A5B|22828083|838082;
    STA.B strcVariables.n16Temp2                               ;838A5F|8580    |000080;
    LDA.B strcVariables.n16Temp1                               ;838A61|A57E    |00007E;
    BEQ +                                                      ;838A63|F002    |838A67;
    INC.B strcVariables.n16Temp2                               ;838A65|E680    |000080;
 
  + LDA.B strcVariables.n16Temp2                               ;838A67|A580    |000080;
    SEP #$20                                                   ;838A69|E220    |      ;
    STA.W SNES_APUIO0                                          ;838A6B|8D4021  |002140;
    XBA                                                        ;838A6E|EB      |      ;
    STA.W SNES_APUIO1                                          ;838A6F|8D4121  |002141;
    STZ.W SNES_APUIO2                                          ;838A72|9C4221  |002142;
    LDA.B #$02                                                 ;838A75|A902    |      ;
    STA.W SNES_APUIO3                                          ;838A77|8D4321  |002143;
 
  - LDA.W SNES_APUIO3                                          ;838A7A|AD4321  |002143;
    CMP.B #$04                                                 ;838A7D|C904    |      ;
    BEQ +                                                      ;838A7F|F002    |838A83;
    BRA -                                                      ;838A81|80F7    |838A7A;
 
 
  + LDY.W #$0000                                               ;838A83|A00000  |      ;
    SEP #$20                                                   ;838A86|E220    |      ;
    LDA.B #$00                                                 ;838A88|A900    |      ;
    XBA                                                        ;838A8A|EB      |      ;
    LDA.W strcAudio.trackId                                    ;838A8B|AD1001  |000110;
    REP #$20                                                   ;838A8E|C220    |      ;
    STA.B strcVariables.n16Temp1                               ;838A90|857E    |00007E;
    LDA.W #$000E                                               ;838A92|A90E00  |      ;
    JSL.L fMathMultiply_7EbyA                                  ;838A95|22008083|838000;
    TAX                                                        ;838A99|AA      |      ;
    LDA.L sAudioData1_838F83,X                                 ;838A9A|BF838F83|838F83;
    STA.B ptrAudioData                                         ;838A9E|850A    |00000A;
    INX                                                        ;838AA0|E8      |      ;
    INX                                                        ;838AA1|E8      |      ;
    SEP #$20                                                   ;838AA2|E220    |      ;
    LDA.L sAudioData1_838F83,X                                 ;838AA4|BF838F83|838F83;
    STA.B ptrAudioData+2                                       ;838AA8|850C    |00000C;
    REP #$20                                                   ;838AAA|C220    |      ;
    LDA.B strcVariables.n16Temp2                               ;838AAC|A580    |000080;
    TAX                                                        ;838AAE|AA      |      ;
 
.loop:
    SEP #$20                                                   ;838AAF|E220    |      ;
    STZ.W SNES_APUIO3                                          ;838AB1|9C4321  |002143;
 
.wait2:
    SEP #$20                                                   ;838AB4|E220    |      ;
    LDA.W SNES_APUIO3                                          ;838AB6|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;838AB9|8593    |000093;
    LDA.W SNES_APUIO3                                          ;838ABB|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;838ABE|C593    |000093;
    BNE .wait2                                                 ;838AC0|D0F2    |838AB4;
    LDA.B #$01                                                 ;838AC2|A901    |      ;
    CMP.W SNES_APUIO3                                          ;838AC4|CD4321  |002143;
    BNE .wait2                                                 ;838AC7|D0EB    |838AB4;
    LDA.B [ptrAudioData],Y                                     ;838AC9|B70A    |00000A;
    STA.W SNES_APUIO0                                          ;838ACB|8D4021  |002140;
    INY                                                        ;838ACE|C8      |      ;
    LDA.B [ptrAudioData],Y                                     ;838ACF|B70A    |00000A;
    STA.W SNES_APUIO1                                          ;838AD1|8D4121  |002141;
    INY                                                        ;838AD4|C8      |      ;
    LDA.B [ptrAudioData],Y                                     ;838AD5|B70A    |00000A;
    STA.W SNES_APUIO2                                          ;838AD7|8D4221  |002142;
    INY                                                        ;838ADA|C8      |      ;
    DEX                                                        ;838ADB|CA      |      ;
    LDA.B #$02                                                 ;838ADC|A902    |      ;
    STA.W SNES_APUIO3                                          ;838ADE|8D4321  |002143;
 
  - SEP #$20                                                   ;838AE1|E220    |      ;
    LDA.W SNES_APUIO3                                          ;838AE3|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;838AE6|8593    |000093;
    LDA.W SNES_APUIO3                                          ;838AE8|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;838AEB|C593    |000093;
    BNE -                                                      ;838AED|D0F2    |838AE1;
    LDA.B #$00                                                 ;838AEF|A900    |      ;
    CMP.W SNES_APUIO3                                          ;838AF1|CD4321  |002143;
    BNE -                                                      ;838AF4|D0EB    |838AE1;
    STZ.W SNES_APUIO3                                          ;838AF6|9C4321  |002143;
    CPX.W #$0000                                               ;838AF9|E00000  |      ;
    BNE .loop                                                  ;838AFC|D0B1    |838AAF;
    RTL                                                        ;838AFE|6B      |      ;
 
 
fAudioUnknown_838AFF:
    SEP #$20                                                   ;838AFF|E220    |      ;
    REP #$10                                                   ;838B01|C210    |      ;
    LDX.W #$0000                                               ;838B03|A20000  |      ;
    LDA.B #$03                                                 ;838B06|A903    |      ;
    STA.B strcVariables.n8Temp1                                ;838B08|8592    |000092;
    JSR.W fAudioUnknown_838E8B                                 ;838B0A|208B8E  |838E8B;
 
.wait1:
    SEP #$20                                                   ;838B0D|E220    |      ;
    LDA.W SNES_APUIO3                                          ;838B0F|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;838B12|8593    |000093;
    LDA.W SNES_APUIO3                                          ;838B14|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;838B17|C593    |000093;
    BNE .wait1                                                 ;838B19|D0F2    |838B0D;
    LDA.B #$01                                                 ;838B1B|A901    |      ;
    CMP.W SNES_APUIO3                                          ;838B1D|CD4321  |002143;
    BNE .wait1                                                 ;838B20|D0EB    |838B0D;
    LDA.B #$00                                                 ;838B22|A900    |      ;
    XBA                                                        ;838B24|EB      |      ;
    LDA.W strcAudio.reg114                                     ;838B25|AD1401  |000114;
    TAX                                                        ;838B28|AA      |      ;
    LDA.L aAudioUnknown_83927F,X                               ;838B29|BF7F9283|83927F;
    STA.B strcVariables.n8Temp3                                ;838B2D|8594    |000094;
    LDA.W strcAudio.index                                      ;838B2F|AD0301  |000103;
    TAX                                                        ;838B32|AA      |      ;
    LDA.B strcVariables.n8Temp3                                ;838B33|A594    |000094;
    STA.W strcAudio.list,X                                     ;838B35|9D0401  |000104;
    INC.W strcAudio.index                                      ;838B38|EE0301  |000103;
    LDA.B #$00                                                 ;838B3B|A900    |      ;
    XBA                                                        ;838B3D|EB      |      ;
    LDA.B strcVariables.n8Temp3                                ;838B3E|A594    |000094;
    REP #$20                                                   ;838B40|C220    |      ;
    STA.B strcVariables.n16Temp1                               ;838B42|857E    |00007E;
    LDA.W #$000A                                               ;838B44|A90A00  |      ;
    JSL.L fMathMultiply_7EbyA                                  ;838B47|22008083|838000;
    TAX                                                        ;838B4B|AA      |      ;
    SEP #$20                                                   ;838B4C|E220    |      ;
    LDA.B strcVariables.n8Temp3                                ;838B4E|A594    |000094;
    STA.W SNES_APUIO0                                          ;838B50|8D4021  |002140;
    REP #$20                                                   ;838B53|C220    |      ;
    LDA.L sAudioSampleData,X                                   ;838B55|BFEF9083|8390EF; X = 0
    SEP #$20                                                   ;838B59|E220    |      ;
    STA.W SNES_APUIO1                                          ;838B5B|8D4121  |002141;
    XBA                                                        ;838B5E|EB      |      ;
    STA.W SNES_APUIO2                                          ;838B5F|8D4221  |002142;
    LDA.B #$02                                                 ;838B62|A902    |      ;
    STA.W SNES_APUIO3                                          ;838B64|8D4321  |002143;
    INX                                                        ;838B67|E8      |      ;
    INX                                                        ;838B68|E8      |      ;
 
.wait2:
    SEP #$20                                                   ;838B69|E220    |      ;
    LDA.W SNES_APUIO3                                          ;838B6B|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;838B6E|8593    |000093;
    LDA.W SNES_APUIO3                                          ;838B70|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;838B73|C593    |000093;
    BNE .wait2                                                 ;838B75|D0F2    |838B69;
    LDA.W SNES_APUIO3                                          ;838B77|AD4321  |002143;
    CMP.B #$04                                                 ;838B7A|C904    |      ;
    BEQ +                                                      ;838B7C|F002    |838B80;
    BRA .wait2                                                 ;838B7E|80E9    |838B69;
 
 
  + STZ.W SNES_APUIO3                                          ;838B80|9C4321  |002143;
 
  - SEP #$20                                                   ;838B83|E220    |      ;
    LDA.W SNES_APUIO3                                          ;838B85|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;838B88|8593    |000093;
    LDA.W SNES_APUIO3                                          ;838B8A|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;838B8D|C593    |000093;
    BNE -                                                      ;838B8F|D0F2    |838B83;
 
  - LDA.B #$01                                                 ;838B91|A901    |      ;
    CMP.W SNES_APUIO3                                          ;838B93|CD4321  |002143;
    BNE -                                                      ;838B96|D0F9    |838B91;
    LDA.L sAudioSampleData,X                                   ;838B98|BFEF9083|8390EF; X = 2
    STA.W SNES_APUIO0                                          ;838B9C|8D4021  |002140;
    INX                                                        ;838B9F|E8      |      ;
    LDA.L sAudioSampleData,X                                   ;838BA0|BFEF9083|8390EF; X = 3
    STA.W SNES_APUIO1                                          ;838BA4|8D4121  |002141;
    INX                                                        ;838BA7|E8      |      ;
    LDA.L sAudioSampleData,X                                   ;838BA8|BFEF9083|8390EF; X = 4
    STA.W SNES_APUIO2                                          ;838BAC|8D4221  |002142;
    LDA.B #$02                                                 ;838BAF|A902    |      ;
    STA.W SNES_APUIO3                                          ;838BB1|8D4321  |002143;
    INX                                                        ;838BB4|E8      |      ;
 
.wait3:
    SEP #$20                                                   ;838BB5|E220    |      ;
    LDA.W SNES_APUIO3                                          ;838BB7|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;838BBA|8593    |000093;
    LDA.W SNES_APUIO3                                          ;838BBC|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;838BBF|C593    |000093;
    BNE .wait3                                                 ;838BC1|D0F2    |838BB5;
    LDA.W SNES_APUIO3                                          ;838BC3|AD4321  |002143;
    CMP.B #$04                                                 ;838BC6|C904    |      ;
    BEQ +                                                      ;838BC8|F002    |838BCC;
    BRA .wait3                                                 ;838BCA|80E9    |838BB5;
 
 
  + STZ.W SNES_APUIO3                                          ;838BCC|9C4321  |002143;
 
  - SEP #$20                                                   ;838BCF|E220    |      ;
    LDA.W SNES_APUIO3                                          ;838BD1|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;838BD4|8593    |000093;
    LDA.W SNES_APUIO3                                          ;838BD6|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;838BD9|C593    |000093;
    BNE -                                                      ;838BDB|D0F2    |838BCF;
 
  - LDA.B #$01                                                 ;838BDD|A901    |      ;
    CMP.W SNES_APUIO3                                          ;838BDF|CD4321  |002143;
    BNE -                                                      ;838BE2|D0F9    |838BDD;
    LDA.L sAudioSampleData,X                                   ;838BE4|BFEF9083|8390EF; X = 5
    STA.W SNES_APUIO0                                          ;838BE8|8D4021  |002140;
    INX                                                        ;838BEB|E8      |      ;
    LDA.L sAudioSampleData,X                                   ;838BEC|BFEF9083|8390EF; X = 6
    STA.W SNES_APUIO1                                          ;838BF0|8D4121  |002141;
    STZ.W SNES_APUIO2                                          ;838BF3|9C4221  |002142;
    LDA.B #$02                                                 ;838BF6|A902    |      ;
    STA.W SNES_APUIO3                                          ;838BF8|8D4321  |002143;
    INX                                                        ;838BFB|E8      |      ;
 
.wait4:
    SEP #$20                                                   ;838BFC|E220    |      ;
    LDA.W SNES_APUIO3                                          ;838BFE|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;838C01|8593    |000093;
    LDA.W SNES_APUIO3                                          ;838C03|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;838C06|C593    |000093;
    BNE .wait4                                                 ;838C08|D0F2    |838BFC;
    LDA.W SNES_APUIO3                                          ;838C0A|AD4321  |002143;
    CMP.B #$04                                                 ;838C0D|C904    |      ;
    BEQ +                                                      ;838C0F|F002    |838C13;
    BRA .wait4                                                 ;838C11|80E9    |838BFC;
 
 
  + STZ.W SNES_APUIO3                                          ;838C13|9C4321  |002143;
 
  - SEP #$20                                                   ;838C16|E220    |      ;
    LDA.W SNES_APUIO3                                          ;838C18|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;838C1B|8593    |000093;
    LDA.W SNES_APUIO3                                          ;838C1D|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;838C20|C593    |000093;
    BNE -                                                      ;838C22|D0F2    |838C16;
 
  - LDA.B #$01                                                 ;838C24|A901    |      ;
    CMP.W SNES_APUIO3                                          ;838C26|CD4321  |002143;
    BNE -                                                      ;838C29|D0F9    |838C24;
    REP #$20                                                   ;838C2B|C220    |      ;
    LDA.L sAudioSampleData,X                                   ;838C2D|BFEF9083|8390EF; X = 7
    STA.B ptrAudioData                                         ;838C31|850A    |00000A;
    INX                                                        ;838C33|E8      |      ;
    INX                                                        ;838C34|E8      |      ;
    SEP #$20                                                   ;838C35|E220    |      ;
    LDA.L sAudioSampleData,X                                   ;838C37|BFEF9083|8390EF; X = 9
    STA.B ptrAudioData+2                                       ;838C3B|850C    |00000C;
    LDA.B #$00                                                 ;838C3D|A900    |      ;
    XBA                                                        ;838C3F|EB      |      ;
    LDA.B strcVariables.n8Temp3                                ;838C40|A594    |000094;
    ASL A                                                      ;838C42|0A      |      ;
    REP #$20                                                   ;838C43|C220    |      ;
    TAX                                                        ;838C45|AA      |      ;
    LDA.L aAudioSampleSize,X                                   ;838C46|BFFF8E83|838EFF;
    STA.B strcVariables.n16Temp1                               ;838C4A|857E    |00007E;
    LDA.W #$0003                                               ;838C4C|A90300  |      ;
    STA.B strcVariables.n16Temp2                               ;838C4F|8580    |000080;
    JSL.L fMathDivide                                          ;838C51|22828083|838082;
    STA.B strcVariables.n16Temp2                               ;838C55|8580    |000080;
    LDA.B strcVariables.n16Temp1                               ;838C57|A57E    |00007E;
    BEQ +                                                      ;838C59|F002    |838C5D;
    INC.B strcVariables.n16Temp2                               ;838C5B|E680    |000080;
 
  + LDA.B strcVariables.n16Temp2                               ;838C5D|A580    |000080;
    TAX                                                        ;838C5F|AA      |      ;
    SEP #$20                                                   ;838C60|E220    |      ;
    STA.W SNES_APUIO0                                          ;838C62|8D4021  |002140;
    XBA                                                        ;838C65|EB      |      ;
    STA.W SNES_APUIO1                                          ;838C66|8D4121  |002141;
    STZ.W SNES_APUIO2                                          ;838C69|9C4221  |002142;
    LDA.B #$02                                                 ;838C6C|A902    |      ;
    STA.W SNES_APUIO3                                          ;838C6E|8D4321  |002143;
    LDY.W #$0000                                               ;838C71|A00000  |      ;
 
.wait5:
    SEP #$20                                                   ;838C74|E220    |      ;
    LDA.W SNES_APUIO3                                          ;838C76|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;838C79|8593    |000093;
    LDA.W SNES_APUIO3                                          ;838C7B|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;838C7E|C593    |000093;
    BNE .wait5                                                 ;838C80|D0F2    |838C74;
    LDA.W SNES_APUIO3                                          ;838C82|AD4321  |002143;
    CMP.B #$04                                                 ;838C85|C904    |      ;
    BEQ +                                                      ;838C87|F002    |838C8B;
    BRA .wait5                                                 ;838C89|80E9    |838C74;
 
 
  + STZ.W SNES_APUIO3                                          ;838C8B|9C4321  |002143;
 
  - SEP #$20                                                   ;838C8E|E220    |      ;
    LDA.W SNES_APUIO3                                          ;838C90|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;838C93|8593    |000093;
    LDA.W SNES_APUIO3                                          ;838C95|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;838C98|C593    |000093;
    BNE -                                                      ;838C9A|D0F2    |838C8E;
 
  - LDA.B #$01                                                 ;838C9C|A901    |      ;
    CMP.W SNES_APUIO3                                          ;838C9E|CD4321  |002143;
    BNE -                                                      ;838CA1|D0F9    |838C9C;
 
.copyData:
    SEP #$20                                                   ;838CA3|E220    |      ;
    LDA.B [ptrAudioData],Y                                     ;838CA5|B70A    |00000A;
    STA.W SNES_APUIO0                                          ;838CA7|8D4021  |002140;
    INY                                                        ;838CAA|C8      |      ;
    LDA.B [ptrAudioData],Y                                     ;838CAB|B70A    |00000A;
    STA.W SNES_APUIO1                                          ;838CAD|8D4121  |002141;
    INY                                                        ;838CB0|C8      |      ;
    LDA.B [ptrAudioData],Y                                     ;838CB1|B70A    |00000A;
    STA.W SNES_APUIO2                                          ;838CB3|8D4221  |002142;
    INY                                                        ;838CB6|C8      |      ;
    DEX                                                        ;838CB7|CA      |      ;
    LDA.B #$02                                                 ;838CB8|A902    |      ;
    STA.W SNES_APUIO3                                          ;838CBA|8D4321  |002143;
 
.wait6:
    SEP #$20                                                   ;838CBD|E220    |      ;
    LDA.W SNES_APUIO3                                          ;838CBF|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;838CC2|8593    |000093;
    LDA.W SNES_APUIO3                                          ;838CC4|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;838CC7|C593    |000093;
    BNE .wait6                                                 ;838CC9|D0F2    |838CBD;
    LDA.B #$00                                                 ;838CCB|A900    |      ;
    CMP.W SNES_APUIO3                                          ;838CCD|CD4321  |002143;
    BNE .wait6                                                 ;838CD0|D0EB    |838CBD;
    STZ.W SNES_APUIO3                                          ;838CD2|9C4321  |002143;
 
  - SEP #$20                                                   ;838CD5|E220    |      ;
    LDA.W SNES_APUIO3                                          ;838CD7|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;838CDA|8593    |000093;
    LDA.W SNES_APUIO3                                          ;838CDC|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;838CDF|C593    |000093;
    BNE -                                                      ;838CE1|D0F2    |838CD5;
 
  - LDA.B #$01                                                 ;838CE3|A901    |      ;
    CMP.W SNES_APUIO3                                          ;838CE5|CD4321  |002143;
    BNE -                                                      ;838CE8|D0F9    |838CE3;
    CPX.W #$0000                                               ;838CEA|E00000  |      ;
    BNE .copyData                                              ;838CED|D0B4    |838CA3;
    STZ.W SNES_APUIO3                                          ;838CEF|9C4321  |002143;
    RTL                                                        ;838CF2|6B      |      ;
 
 
fAudioUnused_838CF3:
    SEP #$20                                                   ;838CF3|E220    |      ;
    REP #$10                                                   ;838CF5|C210    |      ;
    STA.B strcVariables.n8Temp3                                ;838CF7|8594    |000094;
    LDA.B #$07                                                 ;838CF9|A907    |      ;
    STA.B strcVariables.n8Temp1                                ;838CFB|8592    |000092;
 
  - LDA.W SNES_APUIO3                                          ;838CFD|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;838D00|8593    |000093;
    LDA.W SNES_APUIO3                                          ;838D02|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;838D05|C593    |000093;
    BNE -                                                      ;838D07|D0F4    |838CFD;
 
  - LDA.B #$01                                                 ;838D09|A901    |      ;
    CMP.W SNES_APUIO3                                          ;838D0B|CD4321  |002143;
    BNE -                                                      ;838D0E|D0F9    |838D09;
    LDA.B strcVariables.n8Temp1                                ;838D10|A592    |000092;
    STA.W SNES_APUIO0                                          ;838D12|8D4021  |002140;
    STZ.W SNES_APUIO1                                          ;838D15|9C4121  |002141;
    STZ.W SNES_APUIO2                                          ;838D18|9C4221  |002142;
    LDA.B #$02                                                 ;838D1B|A902    |      ;
    STA.W SNES_APUIO3                                          ;838D1D|8D4321  |002143;
 
  - SEP #$20                                                   ;838D20|E220    |      ;
    LDA.W SNES_APUIO3                                          ;838D22|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;838D25|8593    |000093;
    LDA.W SNES_APUIO3                                          ;838D27|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;838D2A|C593    |000093;
    BNE -                                                      ;838D2C|D0F2    |838D20;
    LDA.B #$04                                                 ;838D2E|A904    |      ;
    CMP.W SNES_APUIO3                                          ;838D30|CD4321  |002143;
    BNE -                                                      ;838D33|D0EB    |838D20;
    STZ.W SNES_APUIO3                                          ;838D35|9C4321  |002143;
    RTL                                                        ;838D38|6B      |      ;
 
 
fAudioUnknown_838D39:
    JSR.W fAudioUnknown_838EC9                                 ;838D39|20C98E  |838EC9;
    BNE fAudioUnknown_838D39                                   ;838D3C|D0FB    |838D39;
    SEP #$20                                                   ;838D3E|E220    |      ;
    LDA.B #$08                                                 ;838D40|A908    |      ;
    STA.B strcVariables.n8Temp1                                ;838D42|8592    |000092;
    JSR.W fAudioUnknown_838E8B                                 ;838D44|208B8E  |838E8B;
 
  - SEP #$20                                                   ;838D47|E220    |      ;
    LDA.W SNES_APUIO3                                          ;838D49|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;838D4C|8593    |000093;
    LDA.W SNES_APUIO3                                          ;838D4E|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;838D51|C593    |000093;
    BNE -                                                      ;838D53|D0F2    |838D47;
    LDA.B #$01                                                 ;838D55|A901    |      ;
    CMP.W SNES_APUIO3                                          ;838D57|CD4321  |002143;
    BNE -                                                      ;838D5A|D0EB    |838D47;
    LDA.W strcAudio.unk111                                     ;838D5C|AD1101  |000111;
    STA.W SNES_APUIO0                                          ;838D5F|8D4021  |002140;
    LDA.W strcAudio.unk113                                     ;838D62|AD1301  |000113;
    STA.W SNES_APUIO1                                          ;838D65|8D4121  |002141;
    STZ.W SNES_APUIO2                                          ;838D68|9C4221  |002142;
    LDA.B #$02                                                 ;838D6B|A902    |      ;
    STA.W SNES_APUIO3                                          ;838D6D|8D4321  |002143;
 
  - SEP #$20                                                   ;838D70|E220    |      ;
    LDA.W SNES_APUIO3                                          ;838D72|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;838D75|8593    |000093;
    LDA.W SNES_APUIO3                                          ;838D77|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;838D7A|C593    |000093;
    BNE -                                                      ;838D7C|D0F2    |838D70;
    LDA.W SNES_APUIO3                                          ;838D7E|AD4321  |002143;
    CMP.B #$08                                                 ;838D81|C908    |      ;
    BEQ +                                                      ;838D83|F002    |838D87;
    BRA -                                                      ;838D85|80E9    |838D70;
 
 
  + STZ.W SNES_APUIO3                                          ;838D87|9C4321  |002143;
    RTL                                                        ;838D8A|6B      |      ;
 
 
fAudioUnknown_838D8B:
    SEP #$20                                                   ;838D8B|E220    |      ;
    JSR.W fAudioUnknown_838EC9                                 ;838D8D|20C98E  |838EC9;
    BEQ .return                                                ;838D90|F04C    |838DDE;
    SEP #$20                                                   ;838D92|E220    |      ;
    LDA.B #$09                                                 ;838D94|A909    |      ;
    STA.B strcVariables.n8Temp1                                ;838D96|8592    |000092;
    JSR.W fAudioUnknown_838E8B                                 ;838D98|208B8E  |838E8B;
 
  - SEP #$20                                                   ;838D9B|E220    |      ;
    LDA.W SNES_APUIO3                                          ;838D9D|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;838DA0|8593    |000093;
    LDA.W SNES_APUIO3                                          ;838DA2|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;838DA5|C593    |000093;
    BNE -                                                      ;838DA7|D0F2    |838D9B;
    LDA.B #$01                                                 ;838DA9|A901    |      ;
    CMP.W SNES_APUIO3                                          ;838DAB|CD4321  |002143;
    BNE -                                                      ;838DAE|D0EB    |838D9B;
    LDA.W strcAudio.unk112                                     ;838DB0|AD1201  |000112;
    STA.W SNES_APUIO0                                          ;838DB3|8D4021  |002140;
    LDA.W strcAudio.unk113                                     ;838DB6|AD1301  |000113;
    STA.W SNES_APUIO1                                          ;838DB9|8D4121  |002141;
    STZ.W SNES_APUIO2                                          ;838DBC|9C4221  |002142;
    LDA.B #$02                                                 ;838DBF|A902    |      ;
    STA.W SNES_APUIO3                                          ;838DC1|8D4321  |002143;
 
  - SEP #$20                                                   ;838DC4|E220    |      ;
    LDA.W SNES_APUIO3                                          ;838DC6|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;838DC9|8593    |000093;
    LDA.W SNES_APUIO3                                          ;838DCB|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;838DCE|C593    |000093;
    BNE -                                                      ;838DD0|D0F2    |838DC4;
    LDA.W SNES_APUIO3                                          ;838DD2|AD4321  |002143;
    CMP.B #$08                                                 ;838DD5|C908    |      ;
    BEQ +                                                      ;838DD7|F002    |838DDB;
    BRA -                                                      ;838DD9|80E9    |838DC4;
 
 
  + STZ.W SNES_APUIO3                                          ;838DDB|9C4321  |002143;
 
.return:
    RTL                                                        ;838DDE|6B      |      ;
 
 
fAudioUnknown_838DDF:
    JSR.W fAudioUnknown_838EE4                                 ;838DDF|20E48E  |838EE4; A: nArg1
    BNE .return                                                ;838DE2|D04D    |838E31;
    SEP #$20                                                   ;838DE4|E220    |      ;
    LDA.B #$0A                                                 ;838DE6|A90A    |      ;
    STA.B strcVariables.n8Temp1                                ;838DE8|8592    |000092;
    JSR.W fAudioUnknown_838E8B                                 ;838DEA|208B8E  |838E8B;
 
  - SEP #$20                                                   ;838DED|E220    |      ;
    LDA.W SNES_APUIO3                                          ;838DEF|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;838DF2|8593    |000093;
    LDA.W SNES_APUIO3                                          ;838DF4|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;838DF7|C593    |000093;
    BNE -                                                      ;838DF9|D0F2    |838DED;
    LDA.B #$01                                                 ;838DFB|A901    |      ;
    CMP.W SNES_APUIO3                                          ;838DFD|CD4321  |002143;
    BNE -                                                      ;838E00|D0EB    |838DED;
    LDA.W strcAudio.reg114                                     ;838E02|AD1401  |000114;
    STA.W SNES_APUIO0                                          ;838E05|8D4021  |002140;
    LDA.W strcAudio.reg115                                     ;838E08|AD1501  |000115;
    STA.W SNES_APUIO1                                          ;838E0B|8D4121  |002141;
    LDA.W strcAudio.reg116                                     ;838E0E|AD1601  |000116;
    STA.W SNES_APUIO2                                          ;838E11|8D4221  |002142;
    LDA.B #$02                                                 ;838E14|A902    |      ;
    STA.W SNES_APUIO3                                          ;838E16|8D4321  |002143;
 
  - SEP #$20                                                   ;838E19|E220    |      ;
    LDA.W SNES_APUIO3                                          ;838E1B|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;838E1E|8593    |000093;
    LDA.W SNES_APUIO3                                          ;838E20|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;838E23|C593    |000093;
    BNE -                                                      ;838E25|D0F2    |838E19;
    LDA.W SNES_APUIO3                                          ;838E27|AD4321  |002143;
    CMP.B #$08                                                 ;838E2A|C908    |      ;
    BNE -                                                      ;838E2C|D0EB    |838E19;
    STZ.W SNES_APUIO3                                          ;838E2E|9C4321  |002143;
 
.return:
    RTL                                                        ;838E31|6B      |      ;
 
 
fAudioUnknown_838E32:
    SEP #$20                                                   ;838E32|E220    |      ;
    STA.B strcVariables.n8Temp3                                ;838E34|8594    |000094;
    REP #$10                                                   ;838E36|C210    |      ;
    LDA.B #$0B                                                 ;838E38|A90B    |      ;
    STA.B strcVariables.n8Temp1                                ;838E3A|8592    |000092;
    JSR.W fAudioUnknown_838E8B                                 ;838E3C|208B8E  |838E8B;
 
  - SEP #$20                                                   ;838E3F|E220    |      ;
    LDA.W SNES_APUIO3                                          ;838E41|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;838E44|8593    |000093;
    LDA.W SNES_APUIO3                                          ;838E46|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;838E49|C593    |000093;
    BNE -                                                      ;838E4B|D0F2    |838E3F;
    LDA.B #$01                                                 ;838E4D|A901    |      ;
    CMP.W SNES_APUIO3                                          ;838E4F|CD4321  |002143;
    BNE -                                                      ;838E52|D0EB    |838E3F;
    LDA.B strcVariables.n8Temp3                                ;838E54|A594    |000094;
    STA.W SNES_APUIO0                                          ;838E56|8D4021  |002140;
    STZ.W SNES_APUIO1                                          ;838E59|9C4121  |002141;
    STZ.W SNES_APUIO2                                          ;838E5C|9C4221  |002142;
    LDA.B #$02                                                 ;838E5F|A902    |      ;
    STA.W SNES_APUIO3                                          ;838E61|8D4321  |002143;
 
  - SEP #$20                                                   ;838E64|E220    |      ;
    LDA.W SNES_APUIO3                                          ;838E66|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;838E69|8593    |000093;
    LDA.W SNES_APUIO3                                          ;838E6B|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;838E6E|C593    |000093;
    BNE -                                                      ;838E70|D0F2    |838E64;
    LDA.W SNES_APUIO3                                          ;838E72|AD4321  |002143;
    CMP.B #$08                                                 ;838E75|C908    |      ;
    BEQ +                                                      ;838E77|F002    |838E7B;
    BRA -                                                      ;838E79|80E9    |838E64;
 
 
  + STZ.W SNES_APUIO3                                          ;838E7B|9C4321  |002143;
    RTL                                                        ;838E7E|6B      |      ;
 
    SEP #$20                                                   ;838E7F|E220    |      ;
    REP #$10                                                   ;838E81|C210    |      ;
    LDA.B #$0C                                                 ;838E83|A90C    |      ;
    STA.B strcVariables.n8Temp1                                ;838E85|8592    |000092;
    JSR.W fAudioUnknown_838E8B                                 ;838E87|208B8E  |838E8B;
    RTL                                                        ;838E8A|6B      |      ;
 
 
fAudioUnknown_838E8B:
    SEP #$20                                                   ;838E8B|E220    |      ;
    LDA.W SNES_APUIO3                                          ;838E8D|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;838E90|8593    |000093;
    LDA.W SNES_APUIO3                                          ;838E92|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;838E95|C593    |000093;
    BNE fAudioUnknown_838E8B                                   ;838E97|D0F2    |838E8B;
 
  - LDA.B #$01                                                 ;838E99|A901    |      ;
    CMP.W SNES_APUIO3                                          ;838E9B|CD4321  |002143;
    BNE -                                                      ;838E9E|D0F9    |838E99;
    LDA.B strcVariables.n8Temp1                                ;838EA0|A592    |000092;
    STA.W SNES_APUIO0                                          ;838EA2|8D4021  |002140;
    STZ.W SNES_APUIO1                                          ;838EA5|9C4121  |002141;
    STZ.W SNES_APUIO2                                          ;838EA8|9C4221  |002142;
    LDA.B #$02                                                 ;838EAB|A902    |      ;
    STA.W SNES_APUIO3                                          ;838EAD|8D4321  |002143;
 
  - LDA.W SNES_APUIO3                                          ;838EB0|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;838EB3|8593    |000093;
    LDA.W SNES_APUIO3                                          ;838EB5|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;838EB8|C593    |000093;
    BNE -                                                      ;838EBA|D0F4    |838EB0;
 
  - LDA.W SNES_APUIO3                                          ;838EBC|AD4321  |002143;
    CMP.B #$04                                                 ;838EBF|C904    |      ;
    BEQ +                                                      ;838EC1|F002    |838EC5;
    BRA -                                                      ;838EC3|80F7    |838EBC;
 
 
  + STZ.W SNES_APUIO3                                          ;838EC5|9C4321  |002143;
    RTS                                                        ;838EC8|60      |      ;
 
 
fAudioUnknown_838EC9:
    SEP #$20                                                   ;838EC9|E220    |      ;
    LDA.W SNES_APUIO3                                          ;838ECB|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;838ECE|8593    |000093;
    LDA.W SNES_APUIO3                                          ;838ED0|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;838ED3|C593    |000093;
    BNE fAudioUnknown_838EC9                                   ;838ED5|D0F2    |838EC9;
    LDA.B #$01                                                 ;838ED7|A901    |      ;
    CMP.W SNES_APUIO3                                          ;838ED9|CD4321  |002143;
    BNE fAudioUnknown_838EC9                                   ;838EDC|D0EB    |838EC9;
    LDA.W SNES_APUIO0                                          ;838EDE|AD4021  |002140;
    AND.B #$11                                                 ;838EE1|2911    |      ;
    RTS                                                        ;838EE3|60      |      ;
 
 
fAudioUnknown_838EE4:
    SEP #$20                                                   ;838EE4|E220    |      ;
    LDA.W SNES_APUIO3                                          ;838EE6|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;838EE9|8593    |000093;
    LDA.W SNES_APUIO3                                          ;838EEB|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;838EEE|C593    |000093;
    BNE fAudioUnknown_838EE4                                   ;838EF0|D0F2    |838EE4;
    LDA.B #$01                                                 ;838EF2|A901    |      ;
    CMP.W SNES_APUIO3                                          ;838EF4|CD4321  |002143;
    BNE fAudioUnknown_838EE4                                   ;838EF7|D0EB    |838EE4;
    LDA.W SNES_APUIO0                                          ;838EF9|AD4021  |002140;
    AND.B #$10                                                 ;838EFC|2910    |      ;
    RTS                                                        ;838EFE|60      |      ;
 
 
aAudioSampleSize:
    dw $10C0,$10C0,$2EE0,$0BB0,$0780,$0D10                     ;838EFF|        |      ;
    dw $0040,$1F30,$1950,$1300,$02D0,$1B80                     ;838F0B|        |      ;
    dw $0340,$0670,$0DA0,$1240,$0FA0,$07D0                     ;838F17|        |      ;
    dw $1B40,$1F30,$06B0,$1940,$0730,$03E0                     ;838F23|        |      ;
    dw $1380,$04E0,$0C80,$0F90,$0E50,$3E70                     ;838F2F|        |      ;
    dw $0F90,$0BB0,$0BB0,$0BB0,$0BB0,$07C0                     ;838F3B|        |      ;
    dw $1380,$0340,$07C0,$1F30                                 ;838F47|        |      ;
 
aAudioUnknown_838F4F:
    dw $02EC,$02EC,$0272,$03AB,$02B6,$0443                     ;838F4F|        |      ;
    dw $0399,$02AD,$01F6,$0260,$019A,$018E                     ;838F5B|        |      ;
    dw $01D1,$0293,$023D,$02F2,$0435,$0113                     ;838F67|        |      ;
    dw $04B7,$007A,$0080,$00DB,$011E,$00B0                     ;838F73|        |      ;
    dw $005C,$00BC                                             ;838F7F|        |      ;
sAudioData1_838F83:
    dl sAudioTrack_Spring                                      ;838F83|        |AD8FD6; 0x1A * [ptr24 pAudioTrack, n8, n8, n8, n8, n8, n8, n8, n8, n8, n8, n8]
    db $07,$03,$01,$0C,$05,$26,$24,$00,$00,$00,$00             ;838F86|        |      ;
    dl sAudioTrack_Spring                                      ;838F91|        |AD8FD6;
    db $07,$03,$01,$0C,$00,$00,$00,$00,$00,$00,$00             ;838F94|        |      ;
    dl sAudioTrack_Summer                                      ;838F9F|        |ADB44A;
    db $01,$05,$00,$00,$00,$00,$00,$00,$00,$00,$00             ;838FA2|        |      ;
    dl sAudioTrack_HarvestFestival                             ;838FAD|        |AD9FFD;
    db $03,$07,$01,$16,$05,$00,$00,$00,$00,$00,$00             ;838FB0|        |      ;
    dl sAudioTrack_Winter                                      ;838FBB|        |AD92C2;
    db $03,$07,$01,$00,$00,$00,$00,$00,$00,$00,$00             ;838FBE|        |      ;
    dl sAudioTrack_AD9AA7                                      ;838FC9|        |AD9AA7;
    db $05,$01,$07,$00,$00,$00,$00,$00,$00,$00,$00             ;838FCC|        |      ;
    dl sAudioTrack_Mountain                                    ;838FD7|        |ADAC0E;
    db $03,$07,$01,$00,$00,$00,$00,$00,$00,$00,$00             ;838FDA|        |      ;
    dl sAudioTrack_Fall                                        ;838FE5|        |ADAFA7;
    db $01,$04,$0C,$08,$00,$00,$00,$00,$00,$00,$00             ;838FE8|        |      ;
    dl sAudioTrack_Dance                                       ;838FF3|        |ADB254;
    db $01,$07,$16,$00,$00,$00,$00,$00,$00,$00,$00             ;838FF6|        |      ;
    dl sAudioTrack_Church                                      ;839001|        |ADA9AE;
    db $02,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00             ;839004|        |      ;
    dl sAudioTrack_NamingScreen                                ;83900F|        |ADBE06;
    db $05,$07,$00,$00,$00,$00,$00,$00,$00,$00,$00             ;839012|        |      ;
    dl sAudioTrack_Title                                       ;83901D|        |ADBFA0;
    db $05,$01,$07,$00,$00,$00,$00,$00,$00,$00,$00             ;839020|        |      ;
    dl sAudioTrack_ADA3A8                                      ;83902B|        |ADA3A8;
    db $05,$07,$01,$00,$00,$00,$00,$00,$00,$00,$00             ;83902E|        |      ;
    dl sAudioTrack_EggFestival                                 ;839039|        |ADB6BC;
    db $05,$01,$08,$00,$00,$00,$00,$00,$00,$00,$00             ;83903C|        |      ;
    dl sAudioTrack_StarNightFestival                           ;839047|        |AD986A;
    db $05,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00             ;83904A|        |      ;
    dl sAudioTrack_TrollsCave                                  ;839055|        |AD9578;
    db $05,$0B,$01,$08,$00,$00,$00,$00,$00,$00,$00             ;839058|        |      ;
    dl sAudioTrack_Ending                                      ;839063|        |ADA579;
    db $05,$01,$0C,$00,$00,$00,$00,$00,$00,$00,$00             ;839066|        |      ;
    dl sAudioTrack_BadEnding                                   ;839071|        |AD9EEA;
    db $05,$03,$07,$00,$00,$00,$00,$00,$00,$00,$00             ;839074|        |      ;
    dl sAudioTrack_Opening                                     ;83907F|        |ADB94F;
    db $04,$03,$07,$0B,$00,$00,$00,$00,$00,$00,$00             ;839082|        |      ;
    dl sAudioTrack_Rain                                        ;83908D|        |ADC12E;
    db $0D,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00             ;839090|        |      ;
    dl sAudioTrack_ADC1A8                                      ;83909B|        |ADC1A8;
    db $0D,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00             ;83909E|        |      ;
    dl sAudioTrack_ADC228                                      ;8390A9|        |ADC228;
    db $15,$0D,$18,$00,$00,$00,$00,$00,$00,$00,$00             ;8390AC|        |      ;
    dl sAudioTrack_Hurricane                                   ;8390B7|        |ADC303;
    db $10,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00             ;8390BA|        |      ;
    dl sAudioTrack_ADC421                                      ;8390C5|        |ADC421;
    db $1D,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00             ;8390C8|        |      ;
    dl sAudioTrack_Bell                                        ;8390D3|        |ADC4D1;
    db $1D,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00             ;8390D6|        |      ;
    dl sAudioTrack_ADC52D                                      ;8390E1|        |ADC52D;
    db $13,$15,$00,$00,$00,$00,$00,$00,$00,$00,$00             ;8390E4|        |      ;
 
sAudioSampleData:
    dw $01B0                                                   ;8390EF|        |      ; 0x28 * [n16 ?, n8 nAttackVolumeEnvelope, n8 nSustainVolumeEnvelope, n8 ?, n16 nPitch, ptr24 pAudioSample]
    db $FF,$E0,$B8                                             ;8390F1|        |      ;
    dw $2005                                                   ;8390F4|        |      ;
    dl sAudioTrack_ADC5E9                                      ;8390F6|        |ADC5E9;
    db $B0,$01,$FF,$E0,$B8,$05,$20                             ;8390F9|        |      ;
    dl sAudioTrack_ADC5E9                                      ;839100|        |ADC5E9;
    db $76,$02,$FF,$E0,$B8,$06,$B0                             ;839103|        |      ;
    dl sAudioTrack_AE8000                                      ;83910A|        |AE8000;
    db $DF,$05,$FF,$E3,$B8,$01,$E0                             ;83910D|        |      ;
    dl sAudioTrack_ADD6A9                                      ;839114|        |ADD6A9;
    db $3E,$07,$FF,$EF,$B8,$05,$F0                             ;839117|        |      ;
    dl sAudioTrack_ADE259                                      ;83911E|        |ADE259;
    db $F2,$07,$FF,$EB,$B8,$03,$E0                             ;839121|        |      ;
    dl sAudioTrack_ADE9D9                                      ;839128|        |ADE9D9;
    db $1B,$00,$FF,$E0,$B8,$04,$00                             ;83912B|        |      ;
    dl sAudioTrack_ADF6E9                                      ;839132|        |ADF6E9;
    db $0C,$06,$FF,$E0,$B8,$05,$A0                             ;839135|        |      ;
    dl sAudioTrack_AEAEE0                                      ;83913C|        |AEAEE0;
    db $50,$19,$FF,$E0,$B8,$05,$A0                             ;83913F|        |      ;
    dl sAudioTrack_AECE10                                      ;839146|        |AECE10;
    db $D8,$12,$86,$EB,$B8,$04,$00                             ;839149|        |      ;
    dl sAudioTrack_AF8000                                      ;839150|        |AF8000;
    db $A3,$02,$FF,$EE,$B8,$03,$F0                             ;839153|        |      ;
    dl sAudioTrack_AEE760                                      ;83915A|        |AEE760;
    db $B6,$0D,$FF,$E0,$B8,$03,$50                             ;83915D|        |      ;
    dl sAudioTrack_AF9300                                      ;839164|        |AF9300;
    db $01,$02,$FF,$E9,$B8,$01,$E0                             ;839167|        |      ;
    dl sAudioTrack_AEEA30                                      ;83916E|        |AEEA30;
    db $1B,$00,$FF,$E0,$B8,$01,$30                             ;839171|        |      ;
    dl sAudioTrack_ADF729                                      ;839178|        |ADF729;
    db $9B,$0D,$FF,$E0,$B8,$07,$A0                             ;83917B|        |      ;
    dl sAudioTrack_AEED70                                      ;839182|        |AEED70;
    db $1B,$00,$FF,$E0,$B8,$00,$D0                             ;839185|        |      ;
    dl sAudioTrack_AFAE80                                      ;83918C|        |AFAE80;
    db $D1,$04,$FF,$E0,$B8,$00,$B0                             ;83918F|        |      ;
    dl sAudioTrack_AFC0C0                                      ;839196|        |AFC0C0;
    db $1B,$00,$FF,$E0,$B8,$00,$50                             ;839199|        |      ;
    dl sAudioTrack_AFD060                                      ;8391A0|        |AFD060;
    db $3F,$1B,$FF,$E0,$B8,$03,$C0                             ;8391A3|        |      ;
    dl sAudioTrack_AFD830                                      ;8391AA|        |AFD830;
    db $02,$25,$FF,$E0,$B8,$07,$A0                             ;8391AD|        |      ;
    dl sAudioTrack_B08000                                      ;8391B4|        |B08000;
    db $1B,$00,$FF,$E0,$B8,$00,$90                             ;8391B7|        |      ;
    dl sAudioTrack_AFF370                                      ;8391BE|        |AFF370;
    db $3E,$19,$FF,$E9,$B8,$01,$E0                             ;8391C1|        |      ;
    dl sAudioTrack_B09F30                                      ;8391C8|        |B09F30;
    db $2C,$07,$FF,$E0,$B8,$07,$A0                             ;8391CB|        |      ;
    dl sAudioTrack_B0B870                                      ;8391D2|        |B0B870;
    db $D5,$03,$FF,$E0,$B8,$04,$20                             ;8391D5|        |      ;
    dl sAudioTrack_B0BFA0                                      ;8391DC|        |B0BFA0;
    db $71,$13,$FF,$E0,$B8,$05,$20                             ;8391DF|        |      ;
    dl sAudioTrack_B0C380                                      ;8391E6|        |B0C380;
    db $DA,$04,$FF,$E0,$B8,$07,$A0                             ;8391E9|        |      ;
    dl sAudioTrack_AFFA20                                      ;8391F0|        |AFFA20;
    db $72,$0C,$FF,$E0,$B8,$07,$A0                             ;8391F3|        |      ;
    dl sAudioTrack_B0D700                                      ;8391FA|        |B0D700;
    db $8A,$0F,$FF,$E0,$B8,$01,$50                             ;8391FD|        |      ;
    dl sAudioTrack_B0E380                                      ;839204|        |B0E380;
    db $46,$0E,$FF,$E0,$B8,$07,$A0                             ;839207|        |      ;
    dl sAudioTrack_B18000                                      ;83920E|        |B18000;
    db $67,$3E,$FF,$E0,$B8,$05,$40                             ;839211|        |      ;
    dl sAudioTrack_B18E50                                      ;839218|        |B18E50;
    db $8A,$0F,$FF,$E0,$B8,$01,$C0                             ;83921B|        |      ;
    dl sAudioTrack_B1CCC0                                      ;839222|        |B1CCC0;
    db $A3,$0B,$FF,$E0,$B8,$01,$10                             ;839225|        |      ;
    dl sAudioTrack_B1DC50                                      ;83922C|        |B1DC50;
    db $A3,$0B,$FF,$E0,$B8,$00,$B0                             ;83922F|        |      ;
    dl sAudioTrack_B1E800                                      ;839236|        |B1E800;
    db $A3,$0B,$FF,$E0,$B8,$02,$90                             ;839239|        |      ;
    dl sAudioTrack_B1F3B0                                      ;839240|        |B1F3B0;
    db $12,$00,$FF,$E0,$B8,$00,$20                             ;839243|        |      ;
    dl sAudioTrack_B29380                                      ;83924A|        |B29380;
    db $BC,$07,$FF,$E0,$B8,$01,$10                             ;83924D|        |      ;
    dl sAudioTrack_B29F30                                      ;839254|        |B29F30;
    db $71,$13,$FF,$E0,$B8,$01,$A0                             ;839257|        |      ;
    dl sAudioTrack_B28000                                      ;83925E|        |B28000;
    db $01,$02,$FF,$E9,$B8,$01,$E0                             ;839261|        |      ;
    dl sAudioTrack_B2A6F0                                      ;839268|        |B2A6F0;
    db $BC,$07,$FF,$E0,$B8,$01,$00                             ;83926B|        |      ;
    dl sAudioTrack_B2AA30                                      ;839272|        |B2AA30;
    db $26,$1F,$FF,$E0,$B8,$01,$E0                             ;839275|        |      ;
    dl sAudioTrack_B2B1F0                                      ;83927C|        |B2B1F0;
 
aAudioUnknown_83927F:
    db $00,$00,$00,$05,$00,$00,$00,$00,$00,$00,$00,$00         ;83927F|        |      ;
    db $0D,$13,$1D,$26,$00,$00,$00,$00,$10,$23,$23,$00         ;83928B|        |      ;
    db $00,$24,$0D,$00,$25,$1E,$1E,$27,$21,$14,$0E,$14         ;839297|        |      ;
    db $14,$1C,$1F,$14,$11,$0F,$12,$10,$11,$11,$11,$07         ;8392A3|        |      ;
    db $26,$06                                                 ;8392AF|        |      ;
 
aAudioSampleLookupTable:
    db $17,$18,$19,$1A,$15,$06,$0A,$00,$00,$00                 ;8392B1|        |      ;
 
fDialog_Unknown_8392BB:
    REP #$30                                                   ;8392BB|C230    |      ;
    REP #$20                                                   ;8392BD|C220    |      ;
    LDA.W #$CB05                                               ;8392BF|A905CB  |      ;
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
 
 
fDialog_Unknown_83932D:
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
 
 
fDialog_Unknown_8393F9:
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
    JSL.L fDialog_Unknown_83932D                               ;839421|222D9383|83932D;
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
 
 
fDialog_Unknown_839447:
    REP #$30                                                   ;839447|C230    |      ;
    JSR.W fDialog_Unknown_839495                               ;839449|209594  |839495;
    RTL                                                        ;83944C|6B      |      ;
 
 
aDialogUnknown_83944D:
    db $10,$50,$70,$51,$50,$53,$70,$50,$50,$52                 ;83944D|        |      ;
 
aDialogUnknown_839457:
    dw $21A0,$21A1,$21B0,$21B1                                 ;839457|        |      ;
 
aDialogUnknown_83945F:
    dw $21A2,$21A3,$21B2,$21B3                                 ;83945F|        |      ;
 
aDialogDialogPointerIndexes_839467:
    dw $000F,$0010,$0011,$0012,$0013,$0014                     ;839467|        |      ; 0x0B * [n16 nDialogPointerIndex]
    dw $0015,$0016,$0017,$0018,$0019                           ;839473|        |      ;
 
aDialogUnknown_83947D:
    dw $7088,$70C8,$7108,$7148,$7188,$71C8                     ;83947D|        |      ;
    dw $7208,$7248,$7288,$72C8,$7308,$7090                     ;839489|        |      ;
 
fDialog_Unknown_839495:
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
    JSL.L fDialog_Unknown_8394D7                               ;8394BE|22D79483|8394D7;
    BRA .return                                                ;8394C2|8009    |8394CD;
 
 
  + REP #$20                                                   ;8394C4|C220    |      ;
    LDA.W #$0001                                               ;8394C6|A90100  |      ;
    JSL.L fDialog_Unknown_8394D7                               ;8394C9|22D79483|8394D7;
 
.return:
    SEP #$20                                                   ;8394CD|E220    |      ;
    LDA.W strcDialogDisplay.dialogBlinkTimer                   ;8394CF|AD8B01  |00018B;
    INC A                                                      ;8394D2|1A      |      ;
    STA.W strcDialogDisplay.dialogBlinkTimer                   ;8394D3|8D8B01  |00018B;
    RTS                                                        ;8394D6|60      |      ;
 
 
fDialog_Unknown_8394D7:
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
    LDA.L aDialogUnknown_83947D,X                              ;8394EE|BF7D9483|83947D;
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
    JSL.L fGraphicsUnknown_8381B7                              ;839517|22B78183|8381B7;
    RTL                                                        ;83951B|6B      |      ;
 
 
fDialog_IterateText:
    SEP #$20                                                   ;83951C|E220    |      ;
    REP #$10                                                   ;83951E|C210    |      ;
    LDA.W strcDialogDisplay.dialogFlags                        ;839520|AD9B01  |00019B;
    AND.B #!DFLAGS_UNK20                                                 
    BEQ +                                                      ;839525|F003    |83952A;
    JMP.W fDialog_Unknown_839447                               ;839527|4C4794  |839447;
 
 
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
 
 
  + REP #$30                                                   ;839587|C230    |      ;
    LDA.B [ptrDialog],Y                                        ;839589|B701    |000001;
    SEP #$10                                                   ;83958B|E210    |      ;
    LDX.B #$01                                                 ;83958D|A201    |      ;
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
    JSR.W fDialog_Unknown839838                                ;8395E4|203898  |839838;
 
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
    LDA.W #$5528                                               ;8395FD|A92855  |      ;
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
    JSR.W fDialog_Unknown839838                                ;83961B|203898  |839838;
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
    STA.W strcDialogDisplay.dialogVarSize                      ;839680|8D8C01  |00018C;
    JSL.L fDialog_Unknown_8397A6                               ;839683|22A69783|8397A6;
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
    LDA.L aTextDataTableFFFD,X                                 ;8396CD|BFAE9A83|839AAE;
    STA.B ptrTemp0x72                                          ;8396D1|8572    |000072;
    INX                                                        ;8396D3|E8      |      ;
    INX                                                        ;8396D4|E8      |      ;
    SEP #$20                                                   ;8396D5|E220    |      ;
    LDA.L aTextDataTableFFFD,X                                 ;8396D7|BFAE9A83|839AAE;
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
 
 
fDialog_Unknown_8397A6:
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
    LDX.W #$0000                                               ;839825|A20000  |      ;
    PHX                                                        ;839828|DA      |      ;
    JSR.W fDialog_GetGlyphPointer                              ;839829|206298  |839862;
    REP #$30                                                   ;83982C|C230    |      ;
    PLX                                                        ;83982E|FA      |      ;
    TXA                                                        ;83982F|8A      |      ;
    LDX.W strcDialogDisplay.dialogUnk185                       ;839830|AE8501  |000185;
    JSL.L fGraphicsTransferData                                ;839833|22668183|838166;
    RTL                                                        ;839837|6B      |      ;
 
 
fDialog_Unknown839838:
    REP #$30                                                   ;839838|C230    |      ;
    LDX.W #$0000                                               ;83983A|A20000  |      ; X = 0
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
    dw $5010,$5170,$5350,$5108,$5268                           ;8398CC|        |      ; 0x05 * [n16] (stored at $185)
 
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
    dl $800917                                                 ;8399EE|        |800917;
    db $01                                                     ;8399F1|        |      ;
    dl $8009B5                                                 ;8399F2|        |8009B5;
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
    dl $800889                                                 ;839B16|        |800889;
    db $08                                                     ;839B19|        |      ;
    dl $8008D5                                                 ;839B1A|        |8008D5;
    db $08                                                     ;839B1D|        |      ;
    dl $8008D5                                                 ;839B1E|        |8008D5;
    db $08                                                     ;839B21|        |      ;
    dl $8008ED                                                 ;839B22|        |8008ED;
    db $08                                                     ;839B25|        |      ;
    dl $8008F5                                                 ;839B26|        |8008F5;
    db $08                                                     ;839B29|        |      ;
    dl $8008DD                                                 ;839B2A|        |8008DD;
    db $08                                                     ;839B2D|        |      ;
    dl $8008DD                                                 ;839B2E|        |8008DD;
    db $08                                                     ;839B31|        |      ;
    dl $8008E5                                                 ;839B32|        |8008E5;
    db $08                                                     ;839B35|        |      ;
    dl $8008E5                                                 ;839B36|        |8008E5;
    db $08                                                     ;839B39|        |      ;
    dl $800889                                                 ;839B3A|        |800889;
    db $08                                                     ;839B3D|        |      ;
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
    STZ.W strcBGScrool.unk148                                  ;83AD89|9C4801  |000148;
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
 
 
fGameEngine_Unknown83AEC3:
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
    JSR.W fGameEngine_Unknown83B0F6                            ;83AF5C|20F6B0  |83B0F6;
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
    JSR.W fGameEngine_Unknown83B0F6                            ;83AF70|20F6B0  |83B0F6;
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
    JSR.W fGameEngine_Unknown83B0F6                            ;83AFC4|20F6B0  |83B0F6;
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
    JSR.W fGameEngine_Unknown83B0F6                            ;83AFD8|20F6B0  |83B0F6;
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
    JSR.W fGameEngine_Unknown83B0F6                            ;83B02C|20F6B0  |83B0F6;
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
    JSR.W fGameEngine_Unknown83B0F6                            ;83B040|20F6B0  |83B0F6;
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
    JSR.W fGameEngine_Unknown83B0F6                            ;83B092|20F6B0  |83B0F6;
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
    JSR.W fGameEngine_Unknown83B0F6                            ;83B0A6|20F6B0  |83B0F6;
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
 
 
fGameEngine_Unknown83B0F6:
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
 
 
fGameEngine_AnimalsUnknown83BC5A:
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
    JSL.L fUnknown_84A5D4                                      ;83BD15|22D4A584|84A5D4;
    REP #$30                                                   ;83BD19|C230    |      ;
    LDY.W #$0004                                               ;83BD1B|A00400  |      ;
    BRA .label7                                                ;83BD1E|8030    |83BD50;
 
 
.label4:
    REP #$20                                                   ;83BD20|C220    |      ;
    LDA.W #$FFF0                                               ;83BD22|A9F0FF  |      ;
    JSL.L fUnknown_84A5D4                                      ;83BD25|22D4A584|84A5D4;
    REP #$30                                                   ;83BD29|C230    |      ;
    LDY.W #$0002                                               ;83BD2B|A00200  |      ;
    BRA .label7                                                ;83BD2E|8020    |83BD50;
 
 
.label5:
    REP #$20                                                   ;83BD30|C220    |      ;
    LDA.W #$FFE8                                               ;83BD32|A9E8FF  |      ;
    JSL.L fUnknown_84A5D4                                      ;83BD35|22D4A584|84A5D4;
    REP #$30                                                   ;83BD39|C230    |      ;
    LDY.W #$0002                                               ;83BD3B|A00200  |      ;
    BRA .label7                                                ;83BD3E|8010    |83BD50;
 
 
.label6:
    REP #$20                                                   ;83BD40|C220    |      ;
    LDA.W #$FFF8                                               ;83BD42|A9F8FF  |      ;
    JSL.L fUnknown_84A5D4                                      ;83BD45|22D4A584|84A5D4;
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
    JSL.L fUnknown_84A5D4                                      ;83BD91|22D4A584|84A5D4;
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
    JSL.L fUnknown_84A5D4                                      ;83BDD0|22D4A584|84A5D4;
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
    JSL.L fUnknown_84A5D4                                      ;83BE28|22D4A584|84A5D4;
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
    LDA.L aEngineUnknown_83CA78,X                              ;83C23D|BF78CA83|83CA78;
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
 
 
fGameEngine_ChichenUnknown83C296:
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
    JSL.L fAI_Unknown8480F8                                    ;83C39A|22F88084|8480F8;
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
    JSL.L fAI_Unknown8480F8                                    ;83C3C3|22F88084|8480F8;
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
    JSL.L fAI_Unknown8480F8                                    ;83C3E1|22F88084|8480F8;
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
    JSL.L fAI_Unknown8480F8                                    ;83C3FD|22F88084|8480F8;
 
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
    JSL.L fAI_Unknown8480F8                                    ;83C562|22F88084|8480F8;
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
    JSL.L fAI_Unknown8480F8                                    ;83C5A6|22F88084|8480F8;
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
    JSL.L fAI_Unknown8480F8                                    ;83C62E|22F88084|8480F8;
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
    JSL.L fAI_Unknown8480F8                                    ;83C722|22F88084|8480F8;
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
    JSL.L fAI_Unknown8480F8                                    ;83C7FD|22F88084|8480F8;
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
 
aEngineUnknown_83CA78:
    dw $0001,$0002,$0004,$0008,$0010,$0020                     ;83CA78|        |      ;
    dw $0040,$0080,$0100,$0200,$0400,$0800                     ;83CA84|        |      ;
    dw $1000,$2000,$4000,$8000                                 ;83CA90|        |      ;
 
fMapEngine_AreaEvents:
    SEP #$20                                                   ;83CA98|E220    |      ;
    REP #$10                                                   ;83CA9A|C210    |      ;
    LDA.B #$00                                                 ;83CA9C|A900    |      ;
    XBA                                                        ;83CA9E|EB      |      ;
    LDA.B strcMap.loadAreaId                                   ;83CA9F|A522    |000022;
    REP #$20                                                   ;83CAA1|C220    |      ;
    ASL A                                                      ;83CAA3|0A      |      ;
    TAX                                                        ;83CAA4|AA      |      ;
    JSR.W (.areaEventsJumpTable,X)                             ;83CAA5|FCA9CA  |83CAA9;
    RTL                                                        ;83CAA8|6B      |      ;
 
.areaEventsJumpTable:
    dw fAreaEvents_Farm                                        ;83CAA9|        |83CB69; 0x60 * [ptr16]
    dw fAreaEvents_Farm                                        ;83CAAB|        |83CB69;
    dw fAreaEvents_Farm                                        ;83CAAD|        |83CB69;
    dw fAreaEvents_Farm                                        ;83CAAF|        |83CB69;
    dw fAreaEvents_Town                                        ;83CAB1|        |83D2E0;
    dw fAreaEvents_Town                                        ;83CAB3|        |83D2E0;
    dw fAreaEvents_Town                                        ;83CAB5|        |83D2E0;
    dw fAreaEvents_Town                                        ;83CAB7|        |83D2E0;
    dw fAreaEvents_Festival1                                   ;83CAB9|        |83E5DF;
    dw fAreaEvents_Festival2                                   ;83CABB|        |83E5F1;
    dw fAreaEvents_Festival3                                   ;83CABD|        |83E603;
    dw fAreaEvents_EggFestival                                 ;83CABF|        |83E6B2;
    dw fAreaEvents_CrossRoad                                   ;83CAC1|        |83E407;
    dw fAreaEvents_CrossRoad                                   ;83CAC3|        |83E407;
    dw fAreaEvents_CrossRoad                                   ;83CAC5|        |83E407;
    dw fAreaEvents_CrossRoad                                   ;83CAC7|        |83E407;
    dw fAreaEvents_Woods                                       ;83CAC9|        |83DC4A;
    dw fAreaEvents_Woods                                       ;83CACB|        |83DC4A;
    dw fAreaEvents_Woods                                       ;83CACD|        |83DC4A;
    dw fAreaEvents_Woods                                       ;83CACF|        |83DC4A;
    dw fAreaEvents_SNF_Spa                                     ;83CAD1|        |83E661;
    dw fAreaEvents_House                                       ;83CAD3|        |83DED3;
    dw fAreaEvents_House                                       ;83CAD5|        |83DED3;
    dw fAreaEvents_House                                       ;83CAD7|        |83DED3;
    dw fAreaEvents_MajorHouse                                  ;83CAD9|        |83D4D7;
    dw fAreaEvents_MajorHouse                                  ;83CADB|        |83D4D7;
    dw fAreaEvents_MariaBedroom                                ;83CADD|        |83D5E7;
    dw fAreaEvents_Church                                      ;83CADF|        |83D613;
    dw fAreaEvents_Florist                                     ;83CAE1|        |83D74E;
    dw fAreaEvents_NinaBedroom                                 ;83CAE3|        |83D818;
    dw fAreaEvents_Bar                                         ;83CAE5|        |83DB8F;
    dw fAreaEvents_EveBedroom                                  ;83CAE7|        |83DC1E;
    dw fAreaEvents_Restaurant                                  ;83CAE9|        |83D955;
    dw fAreaEvents_EllenBedroom                                ;83CAEB|        |83DA1F;
    dw fAreaEvents_Toolshop                                    ;83CAED|        |83D844;
    dw fAreaEvents_AnnBedroom                                  ;83CAEF|        |83D929;
    dw fAreaEvents_AnimalShop                                  ;83CAF1|        |83DAED;
    dw fAreaEvents_FortuneTeller                               ;83CAF3|        |83DA4B;
    dw fAreaEvents_Shed                                        ;83CAF5|        |83E6C4;
    dw fAreaEvents_CowBarn                                     ;83CAF7|        |83DE9B;
    dw fAreaEvents_Coop                                        ;83CAF9|        |83E5B4;
    dw fAreaEvents_Mine                                        ;83CAFB|        |83E4CB;
    dw fAreaEvents_ImpsUnderground                             ;83CAFD|        |83DE64;
    dw fAreaEvents_WorksmanHouse                               ;83CAFF|        |83DD95;
    dw fAreaEvents_GoldChicken                                 ;83CB01|        |83E5A2;
    dw fAreaEvents_Wedding                                     ;83CB03|        |83E5CD;
    dw fAreaEvents_Wedding                                     ;83CB05|        |83E5CD;
    dw fAreaEvents_Wedding                                     ;83CB07|        |83E5CD;
    dw fAreaEvents_Wedding                                     ;83CB09|        |83E5CD;
    dw fAreaEvents_MountainTop                                 ;83CB0B|        |83E586;
    dw fAreaEvents_MountainTop                                 ;83CB0D|        |83E586;
    dw fAreaEvents_MountainTop                                 ;83CB0F|        |83E586;
    dw fAreaEvents_MountainTop                                 ;83CB11|        |83E586;
    dw fAreaEvents_MountainTop                                 ;83CB13|        |83E586;
    dw fAreaEvents_MountainTop                                 ;83CB15|        |83E586;
    dw fAreaEvents_MountainTop                                 ;83CB17|        |83E586;
    dw fAreaEvents_MountainTop                                 ;83CB19|        |83E586;
    dw fAreaEvents_SNF_MountainTop                             ;83CB1B|        |83E632;
    dw fAreaEvents_MountainTopUnknown                          ;83CB1D|        |83E690;
    dw fAreaEvents_MountainTopBean                             ;83CB1F|        |83E74C;
    dw fAreaEvents_Intro                                       ;83CB21|        |83E76D;
    dw fAreaEvents_Endings                                     ;83CB23|        |83EBA6;
    dw fAreaEvents_MountainTopBean                             ;83CB25|        |83E74C;
    dw fAreaEvents_MountainTopBean                             ;83CB27|        |83E74C;
    dw fAreaEvents_MountainTopBean                             ;83CB29|        |83E74C;
    dw fAreaEvents_MountainTopBean                             ;83CB2B|        |83E74C;
    dw fAreaEvents_MountainTopBean                             ;83CB2D|        |83E74C;
    dw fAreaEvents_MountainTopBean                             ;83CB2F|        |83E74C;
    dw fAreaEvents_MountainTopBean                             ;83CB31|        |83E74C;
    dw fAreaEvents_MountainTopBean                             ;83CB33|        |83E74C;
    dw fAreaEvents_MountainTopBean                             ;83CB35|        |83E74C;
    dw fAreaEvents_MountainTopBean                             ;83CB37|        |83E74C;
    dw fAreaEvents_MountainTopBean                             ;83CB39|        |83E74C;
    dw fAreaEvents_MountainTopBean                             ;83CB3B|        |83E74C;
    dw fAreaEvents_MountainTopBean                             ;83CB3D|        |83E74C;
    dw fAreaEvents_Endings                                     ;83CB3F|        |83EBA6;
    dw fAreaEvents_MountainTopBean                             ;83CB41|        |83E74C;
    dw fAreaEvents_MountainTopBean                             ;83CB43|        |83E74C;
    dw fAreaEvents_MountainTopBean                             ;83CB45|        |83E74C;
    dw fAreaEvents_MountainTopBean                             ;83CB47|        |83E74C;
    dw fAreaEvents_MountainTopBean                             ;83CB49|        |83E74C;
    dw fAreaEvents_MountainTopBean                             ;83CB4B|        |83E74C;
    dw fAreaEvents_MountainTopBean                             ;83CB4D|        |83E74C;
    dw fAreaEvents_MountainTopBean                             ;83CB4F|        |83E74C;
    dw fAreaEvents_MountainTopBean                             ;83CB51|        |83E74C;
    dw fAreaEvents_MountainTopBean                             ;83CB53|        |83E74C;
    dw fAreaEvents_MountainTopBean                             ;83CB55|        |83E74C;
    dw fAreaEvents_MountainTopBean                             ;83CB57|        |83E74C;
    dw fAreaEvents_MountainTopBean                             ;83CB59|        |83E74C;
    dw fAreaEvents_MountainTopBean                             ;83CB5B|        |83E74C;
    dw fAreaEvents_MountainTopBean                             ;83CB5D|        |83E74C;
    dw fAreaEvents_MountainTopBean                             ;83CB5F|        |83E74C;
    dw fAreaEvents_MountainTopBean                             ;83CB61|        |83E74C;
    dw fAreaEvents_MountainTopBean                             ;83CB63|        |83E74C;
    dw fAreaEvents_MountainTopBean                             ;83CB65|        |83E74C;
    dw fAreaEvents_MountainTopBean                             ;83CB67|        |83E74C;
 
fAreaEvents_Farm:
    REP #$30                                                   ;83CB69|C230    |      ;
    %CheckFlag(event6, $0002)
    BNE +                                                      ;83CB72|D050    |83CBC4;
    %CheckFlag(event2, !EFLAGS2_MARRIEDMARIA)
    BNE .maria                                                 ;83CB7B|D014    |83CB91;
    %CheckFlag(event2, !EFLAGS2_MARRIEDNINA)
    BNE .nina                                                  ;83CB84|D01C    |83CBA2;
    %CheckFlag(event2, !EFLAGS2_MARRIEDELLEN)
    BNE .ellen                                                 ;83CB8D|D024    |83CBB3;
    BRA +                                                      ;83CB8F|8033    |83CBC4;
 
 
.maria:
    REP #$30                                                   ;83CB91|C230    |      ;
    %AIExecute($0013, $0044, $0000)
    BRA +                                                      ;83CBA0|8022    |83CBC4;
 
 
.nina:
    REP #$30                                                   ;83CBA2|C230    |      ;
    %AIExecute($0013, $0044, $0002)
    BRA +                                                      ;83CBB1|8011    |83CBC4;
 
 
.ellen:
    REP #$30                                                   ;83CBB3|C230    |      ;
    %AIExecute($0013, $0044, $0003)
    BRA +                                                      ;83CBC2|8000    |83CBC4;
 
 
  + REP #$30                                                   ;83CBC4|C230    |      ;
    %CheckFlag(event6, $0004)
    BEQ +                                                      ;83CBCD|F018    |83CBE7;
    LDA.L nFirstChildAge                                       ;83CBCF|AF371F7F|7F1F37;
    CMP.W #$003C                                               ;83CBD3|C93C00  |      ;
    BCC +                                                      ;83CBD6|900F    |83CBE7;
    REP #$30                                                   ;83CBD8|C230    |      ;
    %AIExecute($0014, $0045, $0001)
 
  + REP #$30                                                   ;83CBE7|C230    |      ;
    %CheckFlag(event6, $0008)
    BEQ +                                                      ;83CBF0|F018    |83CC0A;
    LDA.L nSecondChildAge                                      ;83CBF2|AF391F7F|7F1F39;
    CMP.W #$003C                                               ;83CBF6|C93C00  |      ;
    BCC +                                                      ;83CBF9|900F    |83CC0A;
    REP #$30                                                   ;83CBFB|C230    |      ;
    %AIExecute($0015, $0045, $0004)
 
  + REP #$30                                                   ;83CC0A|C230    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;83CC0C|AD9601  |000196;
    AND.W #$001A                                               ;83CC0F|291A00  |      ;
    BEQ +                                                      ;83CC12|F003    |83CC17;
    JMP.W .label9                                              ;83CC14|4C5BCE  |83CE5B;
 
 
  + %CheckFlag(event2, !EFLAGS2_MARRIEDMARIA)
    BEQ +                                                      ;83CC1E|F003    |83CC23;
    JMP.W .label9                                              ;83CC20|4C5BCE  |83CE5B;
 
 
  + %CheckFlag(event2, !EFLAGS2_MARRIEDANN)
    BEQ +                                                      ;83CC2A|F003    |83CC2F;
    JMP.W .label9                                              ;83CC2C|4C5BCE  |83CE5B;
 
 
  + %CheckFlag(event2, !EFLAGS2_MARRIEDNINA)
    BEQ +                                                      ;83CC36|F003    |83CC3B;
    JMP.W .label9                                              ;83CC38|4C5BCE  |83CE5B;
 
 
  + %CheckFlag(event2, !EFLAGS2_MARRIEDELLEN)
    BEQ +                                                      ;83CC42|F003    |83CC47;
    JMP.W .label9                                              ;83CC44|4C5BCE  |83CE5B;
 
 
  + %CheckFlag(event2, !EFLAGS2_MARRIEDEVE)
    BEQ +                                                      ;83CC4E|F003    |83CC53;
    JMP.W .label9                                              ;83CC50|4C5BCE  |83CE5B;
 
 
  + SEP #$20                                                   ;83CC53|E220    |      ;
    LDA.L nCurrentTimeID                                       ;83CC55|AF1C1F7F|7F1F1C;
    CMP.B #$06                                                 ;83CC59|C906    |      ;
    BEQ +                                                      ;83CC5B|F003    |83CC60;
    JMP.W .label9                                              ;83CC5D|4C5BCE  |83CE5B;
 
 
  + LDA.L nInGameHourCounter                                   ;83CC60|AF1D1F7F|7F1F1D;
    BEQ +                                                      ;83CC64|F003    |83CC69;
    JMP.W .label9                                              ;83CC66|4C5BCE  |83CE5B;
 
 
  + LDA.L nInGameMinuteCounter                                 ;83CC69|AF1E1F7F|7F1F1E;
    BEQ +                                                      ;83CC6D|F003    |83CC72;
    JMP.W .label9                                              ;83CC6F|4C5BCE  |83CE5B;
 
 
  + LDA.L nCurrentDay                                          ;83CC72|AF1B1F7F|7F1F1B;
    CMP.B #$01                                                 ;83CC76|C901    |      ;
    BNE +                                                      ;83CC78|D003    |83CC7D;
    JMP.W .label9                                              ;83CC7A|4C5BCE  |83CE5B;
 
 
  + CMP.B #$08                                                 ;83CC7D|C908    |      ;
    BCC .label4                                                ;83CC7F|9019    |83CC9A;
    CMP.B #$0D                                                 ;83CC81|C90D    |      ;
    BCS +                                                      ;83CC83|B003    |83CC88;
    JMP.W .label9                                              ;83CC85|4C5BCE  |83CE5B;
 
 
  + CMP.B #$12                                                 ;83CC88|C912    |      ;
    BCC .label4                                                ;83CC8A|900E    |83CC9A;
    CMP.B #$19                                                 ;83CC8C|C919    |      ;
    BCS +                                                      ;83CC8E|B003    |83CC93;
    JMP.W .label9                                              ;83CC90|4C5BCE  |83CE5B;
 
 
  + CMP.B #$1D                                                 ;83CC93|C91D    |      ;
    BCC .label4                                                ;83CC95|9003    |83CC9A;
    JMP.W .label9                                              ;83CC97|4C5BCE  |83CE5B;
 
 
.label4:
    REP #$20                                                   ;83CC9A|C220    |      ;
    %CheckFlag(event2, !EFLAGS2_MARRIEDMARIA)
    BNE .label5                                                ;83CCA3|D044    |83CCE9;
    %CheckFlag(event2, $0080)
    BNE .label5                                                ;83CCAC|D03B    |83CCE9;
    %CheckFlag(event4, $2000)
    BNE .label5                                                ;83CCB5|D032    |83CCE9;
    %CheckFlag(event4, $1000)
    BNE .label5                                                ;83CCBE|D029    |83CCE9;
    LDA.L nLove_Maria                                          ;83CCC0|AF1F1F7F|7F1F1F;
    CMP.W #$00C8                                               ;83CCC4|C9C800  |      ;
    BCC .label5                                                ;83CCC7|9020    |83CCE9;
    %SetFlag(event4, $1000)
    REP #$30                                                   ;83CCD4|C230    |      ;
    %AIExecute($0000, $0019, $0000)
    SEP #$20                                                   ;83CCE3|E220    |      ;
    STZ.W $09A3                                                ;83CCE5|9CA309  |0009A3;
    RTS                                                        ;83CCE8|60      |      ;
 
 
.label5:
    REP #$20                                                   ;83CCE9|C220    |      ;
    %CheckFlag(event4, $1000)
    BNE .label6                                                ;83CCF2|D044    |83CD38;
    %CheckFlag(event2, !EFLAGS2_MARRIEDANN)
    BNE .label6                                                ;83CCFB|D03B    |83CD38;
    %CheckFlag(event4, $8000)
    BNE .label6                                                ;83CD04|D032    |83CD38;
    %CheckFlag(event4, $4000)
    BNE .label6                                                ;83CD0D|D029    |83CD38;
    LDA.L nLove_Ann                                            ;83CD0F|AF211F7F|7F1F21;
    CMP.W #$00C8                                               ;83CD13|C9C800  |      ;
    BCC .label6                                                ;83CD16|9020    |83CD38;
    %SetFlag(event4, $4000)
    REP #$30                                                   ;83CD23|C230    |      ;
    %AIExecute($0000, $001A, $0000)
    SEP #$20                                                   ;83CD32|E220    |      ;
    STZ.W $09A3                                                ;83CD34|9CA309  |0009A3;
    RTS                                                        ;83CD37|60      |      ;
 
 
.label6:
    REP #$20                                                   ;83CD38|C220    |      ;
    %CheckFlag(event4, $1000)
    BNE .label7                                                ;83CD41|D04D    |83CD90;
    %CheckFlag(event4, $4000)
    BNE .label7                                                ;83CD4A|D044    |83CD90;
    %CheckFlag(event2, !EFLAGS2_MARRIEDNINA)
    BNE .label7                                                ;83CD53|D03B    |83CD90;
    %CheckFlag(event5, $0002)
    BNE .label7                                                ;83CD5C|D032    |83CD90;
    %CheckFlag(event5, $0001)
    BNE .label7                                                ;83CD65|D029    |83CD90;
    LDA.L nLove_Nina                                           ;83CD67|AF231F7F|7F1F23;
    CMP.W #$00C8                                               ;83CD6B|C9C800  |      ;
    BCC .label7                                                ;83CD6E|9020    |83CD90;
    %SetFlag(event5, $0001)
    REP #$30                                                   ;83CD7B|C230    |      ;
    %AIExecute($0000, $001B, $0000)
    SEP #$20                                                   ;83CD8A|E220    |      ;
    STZ.W $09A3                                                ;83CD8C|9CA309  |0009A3;
    RTS                                                        ;83CD8F|60      |      ;
 
 
.label7:
    REP #$20                                                   ;83CD90|C220    |      ;
    %CheckFlag(event4, $1000)
    BNE .label8                                                ;83CD99|D056    |83CDF1;
    %CheckFlag(event4, $4000)
    BNE .label8                                                ;83CDA2|D04D    |83CDF1;
    %CheckFlag(event5, $0001)
    BNE .label8                                                ;83CDAB|D044    |83CDF1;
    %CheckFlag(event2, !EFLAGS2_MARRIEDELLEN)
    BNE .label8                                                ;83CDB4|D03B    |83CDF1;
    %CheckFlag(event5, $0008)
    BNE .label8                                                ;83CDBD|D032    |83CDF1;
    %CheckFlag(event5, $0004)
    BNE .label8                                                ;83CDC6|D029    |83CDF1;
    LDA.L nLove_Ellen                                          ;83CDC8|AF251F7F|7F1F25;
    CMP.W #$00C8                                               ;83CDCC|C9C800  |      ;
    BCC .label8                                                ;83CDCF|9020    |83CDF1;
    %SetFlag(event5, $0004)
    REP #$30                                                   ;83CDDC|C230    |      ;
    %AIExecute($0000, $001C, $0000)
    SEP #$20                                                   ;83CDEB|E220    |      ;
    STZ.W $09A3                                                ;83CDED|9CA309  |0009A3;
    RTS                                                        ;83CDF0|60      |      ;
 
 
.label8:
    REP #$20                                                   ;83CDF1|C220    |      ;
    %CheckFlag(event4, $1000)
    BNE .label9                                                ;83CDFA|D05F    |83CE5B;
    %CheckFlag(event4, $4000)
    BNE .label9                                                ;83CE03|D056    |83CE5B;
    %CheckFlag(event5, $0001)
    BNE .label9                                                ;83CE0C|D04D    |83CE5B;
    %CheckFlag(event5, $0004)
    BNE .label9                                                ;83CE15|D044    |83CE5B;
    %CheckFlag(event2, !EFLAGS2_MARRIEDEVE)
    BNE .label9                                                ;83CE1E|D03B    |83CE5B;
    %CheckFlag(event5, $0020)
    BNE .label9                                                ;83CE27|D032    |83CE5B;
    %CheckFlag(event5, $0010)
    BNE .label9                                                ;83CE30|D029    |83CE5B;
    LDA.L nLove_Eve                                            ;83CE32|AF271F7F|7F1F27;
    CMP.W #$00C8                                               ;83CE36|C9C800  |      ;
    BCC .label9                                                ;83CE39|9020    |83CE5B;
    %SetFlag(event5, $0010)
    REP #$30                                                   ;83CE46|C230    |      ;
    %AIExecute($0000, $001D, $0000)
    SEP #$20                                                   ;83CE55|E220    |      ;
    STZ.W $09A3                                                ;83CE57|9CA309  |0009A3;
    RTS                                                        ;83CE5A|60      |      ;
 
 
.label9:
    REP #$30                                                   ;83CE5B|C230    |      ;
    %CheckFlag(daily1, $0002)
    BEQ .label10                                               ;83CE64|F02D    |83CE93;
    REP #$20                                                   ;83CE66|C220    |      ;
    %AIExecute($0007, $0000, $0020)
    SEP #$20                                                   ;83CE75|E220    |      ;
    LDA.B #$42                                                 ;83CE77|A942    |      ;
    STA.W nPlayerInteractionIndex                              ;83CE79|8D6E09  |00096E;
    STZ.W nPlayerInteractionArg1                               ;83CE7C|9C6F09  |00096F;
    STZ.W nPlayerInteractionArg2                               ;83CE7F|9C7009  |000970;
    %SetPlayerFlag(!PFLAGS_INTERACTING)
    %SetPlayerAction(!PACTION_NONE)
    RTS                                                        ;83CE92|60      |      ;
 
 
.label10:
    REP #$30                                                   ;83CE93|C230    |      ;
    %CheckFlag(event3, $0001)
    BNE .label11                                               ;83CE9C|D010    |83CEAE;
    REP #$30                                                   ;83CE9E|C230    |      ;
    %AIExecute($0000, $000A, $0002)
    RTS                                                        ;83CEAD|60      |      ;
 
 
.label11:
    REP #$30                                                   ;83CEAE|C230    |      ;
    %CheckFlag(event3, $0020)
    BNE .label12                                               ;83CEB7|D024    |83CEDD;
    REP #$30                                                   ;83CEB9|C230    |      ;
    %AIExecute($0000, $000C, $0000)
    REP #$20                                                   ;83CEC8|C220    |      ;
    %SetFlag(event3, $0020)
    SEP #$20                                                   ;83CED5|E220    |      ;
    LDA.B #$03                                                 ;83CED7|A903    |      ;
    STA.W strcMenuData.nameDestinationIdx                      ;83CED9|8D9F09  |00099F;
    RTS                                                        ;83CEDC|60      |      ;
 
 
.label12:
    REP #$30                                                   ;83CEDD|C230    |      ;
    %CheckFlag(event3, $0080)
    BNE .label13                                               ;83CEE6|D028    |83CF10;
    REP #$30                                                   ;83CEE8|C230    |      ;
    %AIExecute($0000, $000C, $0001)
    REP #$20                                                   ;83CEF7|C220    |      ;
    LDA.W #$0078                                               ;83CEF9|A97800  |      ;
    STA.L nDogX                                                ;83CEFC|8F2C1F7F|7F1F2C;
    LDA.W #$01A8                                               ;83CF00|A9A801  |      ;
    STA.L nDogY                                                ;83CF03|8F2E1F7F|7F1F2E;
    SEP #$20                                                   ;83CF07|E220    |      ;
    LDA.B #$00                                                 ;83CF09|A900    |      ;
    STA.L nDogAreaId                                           ;83CF0B|8F301F7F|7F1F30;
    RTS                                                        ;83CF0F|60      |      ;
 
 
.label13:
    SEP #$20                                                   ;83CF10|E220    |      ;
    REP #$10                                                   ;83CF12|C210    |      ;
    LDA.W nWeatherForecast                                     ;83CF14|AD8C09  |00098C;
    CMP.B #$06                                                 ;83CF17|C906    |      ;
    BCC .label14                                               ;83CF19|9027    |83CF42;
    LDA.L nCurrentTimeID                                       ;83CF1B|AF1C1F7F|7F1F1C;
    CMP.B #$06                                                 ;83CF1F|C906    |      ;
    BNE .label14                                               ;83CF21|D01F    |83CF42;
    LDA.L nInGameHourCounter                                   ;83CF23|AF1D1F7F|7F1F1D;
    BNE .label14                                               ;83CF27|D019    |83CF42;
    LDA.L nInGameMinuteCounter                                 ;83CF29|AF1E1F7F|7F1F1E;
    BEQ +                                                      ;83CF2D|F003    |83CF32;
    JMP.W .label17                                             ;83CF2F|4CF8CF  |83CFF8;
 
 
  + REP #$30                                                   ;83CF32|C230    |      ;
    %AIExecute($0006, $0024, $0000)
    RTS                                                        ;83CF41|60      |      ;
 
 
.label14:
    REP #$30                                                   ;83CF42|C230    |      ;
    %CheckFlag(event7, $0002)
    BEQ .label15                                               ;83CF4B|F026    |83CF73;
    SEP #$20                                                   ;83CF4D|E220    |      ;
    LDA.L nCurrentTimeID                                       ;83CF4F|AF1C1F7F|7F1F1C;
    CMP.B #$06                                                 ;83CF53|C906    |      ;
    BNE .label15                                               ;83CF55|D01C    |83CF73;
    LDA.L nInGameHourCounter                                   ;83CF57|AF1D1F7F|7F1F1D;
    BNE .label15                                               ;83CF5B|D016    |83CF73;
    LDA.L nInGameMinuteCounter                                 ;83CF5D|AF1E1F7F|7F1F1E;
    BNE .label15                                               ;83CF61|D010    |83CF73;
    REP #$30                                                   ;83CF63|C230    |      ;
    %AIExecute($0006, $0024, $0002)
    RTS                                                        ;83CF72|60      |      ;
 
 
.label15:
    REP #$30                                                   ;83CF73|C230    |      ;
    %CheckFlag(event1, $0010)
    BEQ .label16                                               ;83CF7C|F026    |83CFA4;
    SEP #$20                                                   ;83CF7E|E220    |      ;
    LDA.L nCurrentTimeID                                       ;83CF80|AF1C1F7F|7F1F1C;
    CMP.B #$06                                                 ;83CF84|C906    |      ;
    BNE .label16                                               ;83CF86|D01C    |83CFA4;
    LDA.L nInGameHourCounter                                   ;83CF88|AF1D1F7F|7F1F1D;
    BNE .label16                                               ;83CF8C|D016    |83CFA4;
    LDA.L nInGameMinuteCounter                                 ;83CF8E|AF1E1F7F|7F1F1E;
    BNE .label16                                               ;83CF92|D010    |83CFA4;
    REP #$30                                                   ;83CF94|C230    |      ;
    %AIExecute($0006, $0024, $0003)
    RTS                                                        ;83CFA3|60      |      ;
 
 
.label16:
    REP #$30                                                   ;83CFA4|C230    |      ;
    %CheckFlag(event7, $0001)
    BNE .label17                                               ;83CFAD|D049    |83CFF8;
    SEP #$20                                                   ;83CFAF|E220    |      ;
    LDA.L nCurrentYearID                                       ;83CFB1|AF181F7F|7F1F18;
    BNE .label17                                               ;83CFB5|D041    |83CFF8;
    LDA.L nCurrentSeasonID                                     ;83CFB7|AF191F7F|7F1F19;
    CMP.B #$01                                                 ;83CFBB|C901    |      ;
    BNE .label17                                               ;83CFBD|D039    |83CFF8;
    LDA.L nCurrentDay                                          ;83CFBF|AF1B1F7F|7F1F1B;
    CMP.B #$14                                                 ;83CFC3|C914    |      ;
    BCS .label17                                               ;83CFC5|B031    |83CFF8;
    LDA.L nCurrentTimeID                                       ;83CFC7|AF1C1F7F|7F1F1C;
    CMP.B #$06                                                 ;83CFCB|C906    |      ;
    BNE .label17                                               ;83CFCD|D029    |83CFF8;
    LDA.L nInGameHourCounter                                   ;83CFCF|AF1D1F7F|7F1F1D;
    BNE .label17                                               ;83CFD3|D023    |83CFF8;
    LDA.L nInGameMinuteCounter                                 ;83CFD5|AF1E1F7F|7F1F1E;
    BNE .label17                                               ;83CFD9|D01D    |83CFF8;
    REP #$20                                                   ;83CFDB|C220    |      ;
    %SetFlag(event7, $0001)
    REP #$30                                                   ;83CFE8|C230    |      ;
    %AIExecute($000B, $0024, $0001)
    RTS                                                        ;83CFF7|60      |      ;
 
 
.label17:
    REP #$30                                                   ;83CFF8|C230    |      ;
    %CheckFlag(event2, $0040)
    BEQ .label18                                               ;83D001|F03A    |83D03D;
    REP #$20                                                   ;83D003|C220    |      ;
    %AIExecute($0009, $0000, $002C)
    SEP #$20                                                   ;83D012|E220    |      ;
    LDA.B #$47                                                 ;83D014|A947    |      ;
    STA.W nPlayerInteractionIndex                              ;83D016|8D6E09  |00096E;
    STZ.W nPlayerInteractionArg1                               ;83D019|9C6F09  |00096F;
    STZ.W nPlayerInteractionArg2                               ;83D01C|9C7009  |000970;
    %SetPlayerFlag(!PFLAGS_INTERACTING)
    %SetPlayerAction(!PACTION_NONE)
    REP #$20                                                   ;83D02F|C220    |      ;
    %UnsetFlag(event2, $0040)
    RTS                                                        ;83D03C|60      |      ;
 
 
.label18:
    REP #$30                                                   ;83D03D|C230    |      ;
    %CheckFlag(event2, $0080)
    BEQ .label19                                               ;83D046|F018    |83D060;
    SEP #$20                                                   ;83D048|E220    |      ;
    LDA.L nConstructionDayCounter                              ;83D04A|AF351F7F|7F1F35;
    BEQ .label19                                               ;83D04E|F010    |83D060;
    REP #$30                                                   ;83D050|C230    |      ;
    %AIExecute($0000, $0000, $002E)
    RTS                                                        ;83D05F|60      |      ;
 
 
.label19:
    REP #$30                                                   ;83D060|C230    |      ;
    %CheckFlag(event2, $0100)
    BEQ .label20                                               ;83D069|F047    |83D0B2;
    %UnsetFlag(event2, $0100)
    REP #$30                                                   ;83D076|C230    |      ;
    %AIExecute($0009, $0000, $0036)
    REP #$30                                                   ;83D085|C230    |      ;
    %AIExecute($000A, $0000, $0037)
    SEP #$20                                                   ;83D094|E220    |      ;
    LDA.B #$48                                                 ;83D096|A948    |      ;
    STA.W nPlayerInteractionIndex                              ;83D098|8D6E09  |00096E;
    STZ.W nPlayerInteractionArg1                               ;83D09B|9C6F09  |00096F;
    STZ.W nPlayerInteractionArg2                               ;83D09E|9C7009  |000970;
    %SetPlayerFlag(!PFLAGS_INTERACTING)
    %SetPlayerAction(!PACTION_NONE)
    RTS                                                        ;83D0B1|60      |      ;
 
 
.label20:
    REP #$30                                                   ;83D0B2|C230    |      ;
    %CheckFlag(event1, $0100)
    BNE .label21                                               ;83D0BB|D042    |83D0FF;
    SEP #$20                                                   ;83D0BD|E220    |      ;
    LDA.L nHorseAge                                            ;83D0BF|AF321F7F|7F1F32;
    CMP.B #$15                                                 ;83D0C3|C915    |      ;
    BNE .label21                                               ;83D0C5|D038    |83D0FF;
    REP #$30                                                   ;83D0C7|C230    |      ;
    %SetFlag(event1, $0100)
    %AIExecute($000B, $0000, $001D)
    SEP #$20                                                   ;83D0E1|E220    |      ;
    LDA.B #$49                                                 ;83D0E3|A949    |      ;
    STA.W nPlayerInteractionIndex                              ;83D0E5|8D6E09  |00096E;
    STZ.W nPlayerInteractionArg1                               ;83D0E8|9C6F09  |00096F;
    STZ.W nPlayerInteractionArg2                               ;83D0EB|9C7009  |000970;
    %SetPlayerFlag(!PFLAGS_INTERACTING)
    %SetPlayerAction(!PACTION_NONE)
    RTS                                                        ;83D0FE|60      |      ;
 
 
.label21:
    SEP #$20                                                   ;83D0FF|E220    |      ;
    REP #$10                                                   ;83D101|C210    |      ;
    LDA.L nCurrentYearID                                       ;83D103|AF181F7F|7F1F18;
    BEQ .label22                                               ;83D107|F05A    |83D163;
    LDA.L nCurrentTimeID                                       ;83D109|AF1C1F7F|7F1F1C;
    CMP.B #$06                                                 ;83D10D|C906    |      ;
    BNE .label22                                               ;83D10F|D052    |83D163;
    LDA.L nInGameHourCounter                                   ;83D111|AF1D1F7F|7F1F1D;
    BNE .label22                                               ;83D115|D04C    |83D163;
    LDA.L nInGameMinuteCounter                                 ;83D117|AF1E1F7F|7F1F1E;
    BNE .label22                                               ;83D11B|D046    |83D163;
    REP #$20                                                   ;83D11D|C220    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;83D11F|AD9601  |000196;
    AND.W #$001A                                               ;83D122|291A00  |      ;
    BNE .label22                                               ;83D125|D03C    |83D163;
    REP #$20                                                   ;83D127|C220    |      ;
    LDA.L nMoney                                               ;83D129|AF041F7F|7F1F04;
    CLC                                                        ;83D12D|18      |      ;
    ADC.W #$F448                                               ;83D12E|6948F4  |      ;
    SEP #$20                                                   ;83D131|E220    |      ;
    LDA.L nMoney+2                                             ;83D133|AF061F7F|7F1F06;
    ADC.B #$FF                                                 ;83D137|69FF    |      ;
    BMI .label22                                               ;83D139|3028    |83D163;
    REP #$30                                                   ;83D13B|C230    |      ;
    %CheckFlag(event3, $0400)
    BNE .label22                                               ;83D144|D01D    |83D163;
    REP #$30                                                   ;83D146|C230    |      ;
    %AIExecute($0000, $0013, $0000)
    REP #$20                                                   ;83D155|C220    |      ;
    %SetFlag(event3, $0400)
    RTS                                                        ;83D162|60      |      ;
 
 
.label22:
    SEP #$20                                                   ;83D163|E220    |      ;
    REP #$10                                                   ;83D165|C210    |      ;
    LDA.L nCurrentYearID                                       ;83D167|AF181F7F|7F1F18;
    BNE .label23                                               ;83D16B|D008    |83D175;
    LDA.L nCurrentSeasonID                                     ;83D16D|AF191F7F|7F1F19;
    CMP.B #$03                                                 ;83D171|C903    |      ;
    BNE .label24                                               ;83D173|D059    |83D1CE;
 
.label23:
    SEP #$20                                                   ;83D175|E220    |      ;
    LDA.L nCurrentTimeID                                       ;83D177|AF1C1F7F|7F1F1C;
    CMP.B #$06                                                 ;83D17B|C906    |      ;
    BNE .label24                                               ;83D17D|D04F    |83D1CE;
    LDA.L nInGameHourCounter                                   ;83D17F|AF1D1F7F|7F1F1D;
    BNE .label24                                               ;83D183|D049    |83D1CE;
    LDA.L nInGameMinuteCounter                                 ;83D185|AF1E1F7F|7F1F1E;
    BNE .label24                                               ;83D189|D043    |83D1CE;
    LDA.L nCurrentWeekdayID                                    ;83D18B|AF1A1F7F|7F1F1A;
    CMP.B #$06                                                 ;83D18F|C906    |      ;
    BNE .label24                                               ;83D191|D03B    |83D1CE;
    REP #$20                                                   ;83D193|C220    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;83D195|AD9601  |000196;
    AND.W #$001A                                               ;83D198|291A00  |      ;
    BNE .label24                                               ;83D19B|D031    |83D1CE;
    REP #$30                                                   ;83D19D|C230    |      ;
    %CheckFlag(event1, $00C0)
    BEQ .label24                                               ;83D1A6|F026    |83D1CE;
    REP #$30                                                   ;83D1A8|C230    |      ;
    %CheckFlag(event3, $4000)
    BNE .label24                                               ;83D1B1|D01B    |83D1CE;
    %SetFlag(event3, $4000)
    REP #$30                                                   ;83D1BE|C230    |      ;
    %AIExecute($0000, $0016, $0000)
    RTS                                                        ;83D1CD|60      |      ;
 
 
.label24:
    SEP #$20                                                   ;83D1CE|E220    |      ;
    REP #$10                                                   ;83D1D0|C210    |      ;
    LDA.L nCurrentSeasonID                                     ;83D1D2|AF191F7F|7F1F19;
    CMP.B #$02                                                 ;83D1D6|C902    |      ;
    BNE .label26                                               ;83D1D8|D064    |83D23E;
    LDA.L nCurrentDay                                          ;83D1DA|AF1B1F7F|7F1F1B;
    CMP.B #$01                                                 ;83D1DE|C901    |      ;
    BEQ .label26                                               ;83D1E0|F05C    |83D23E;
    CMP.B #$08                                                 ;83D1E2|C908    |      ;
    BCC .label25                                               ;83D1E4|9012    |83D1F8;
    CMP.B #$0D                                                 ;83D1E6|C90D    |      ;
    BCC .label26                                               ;83D1E8|9054    |83D23E;
    CMP.B #$12                                                 ;83D1EA|C912    |      ;
    BCC .label25                                               ;83D1EC|900A    |83D1F8;
    CMP.B #$19                                                 ;83D1EE|C919    |      ;
    BCC .label26                                               ;83D1F0|904C    |83D23E;
    CMP.B #$1D                                                 ;83D1F2|C91D    |      ;
    BCC .label25                                               ;83D1F4|9002    |83D1F8;
    BRA .label26                                               ;83D1F6|8046    |83D23E;
 
 
.label25:
    REP #$20                                                   ;83D1F8|C220    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;83D1FA|AD9601  |000196;
    AND.W #$001A                                               ;83D1FD|291A00  |      ;
    BNE .label26                                               ;83D200|D03C    |83D23E;
    REP #$30                                                   ;83D202|C230    |      ;
    %CheckFlag(event1, $00C0)
    BEQ .label26                                               ;83D20B|F031    |83D23E;
    REP #$30                                                   ;83D20D|C230    |      ;
    %CheckFlag(event3, $2000)
    BEQ .label26                                               ;83D216|F026    |83D23E;
    REP #$30                                                   ;83D218|C230    |      ;
    %CheckFlag(event4, $0100)
    BNE .label26                                               ;83D221|D01B    |83D23E;
    %SetFlag(event4, $0080)
    REP #$30                                                   ;83D22E|C230    |      ;
    %AIExecute($0000, $0018, $0000)
    RTS                                                        ;83D23D|60      |      ;
 
 
.label26:
    REP #$30                                                   ;83D23E|C230    |      ;
    %CheckFlag(event4, $0800)
    BNE .label28                                               ;83D247|D055    |83D29E;
    %CheckFlag(event4, $0400)
    BNE .label27                                               ;83D250|D03C    |83D28E;
    LDA.W strcDialogDisplay.mapFlags                           ;83D252|AD9601  |000196;
    AND.W #$001E                                               ;83D255|291E00  |      ;
    BNE .label28                                               ;83D258|D044    |83D29E;
    %CheckFlag(event6, $0400)
    BEQ .label28                                               ;83D261|F03B    |83D29E;
    SEP #$20                                                   ;83D263|E220    |      ;
    LDA.L nOwnedChickens                                       ;83D265|AF0B1F7F|7F1F0B;
    CMP.B #$06                                                 ;83D269|C906    |      ;
    BCC .label28                                               ;83D26B|9031    |83D29E;
    LDA.L nCurrentTimeID                                       ;83D26D|AF1C1F7F|7F1F1C;
    CMP.B #$06                                                 ;83D271|C906    |      ;
    BNE .label28                                               ;83D273|D029    |83D29E;
    LDA.L nInGameHourCounter                                   ;83D275|AF1D1F7F|7F1F1D;
    BNE .label28                                               ;83D279|D023    |83D29E;
    LDA.L nInGameMinuteCounter                                 ;83D27B|AF1E1F7F|7F1F1E;
    BNE .label28                                               ;83D27F|D01D    |83D29E;
    REP #$20                                                   ;83D281|C220    |      ;
    %SetFlag(event4, $0400)
 
.label27:
    REP #$30                                                   ;83D28E|C230    |      ;
    %AIExecute($0000, $0029, $0000)
    RTS                                                        ;83D29D|60      |      ;
 
 
.label28:
    REP #$30                                                   ;83D29E|C230    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;83D2A0|AD9601  |000196;
    AND.W #$001A                                               ;83D2A3|291A00  |      ;
    BNE .justReturn                                            ;83D2A6|D037    |83D2DF;
    SEP #$20                                                   ;83D2A8|E220    |      ;
    LDA.L nCurrentTimeID                                       ;83D2AA|AF1C1F7F|7F1F1C;
    CMP.B #$06                                                 ;83D2AE|C906    |      ;
    BNE .justReturn                                            ;83D2B0|D02D    |83D2DF;
    LDA.L nInGameHourCounter                                   ;83D2B2|AF1D1F7F|7F1F1D;
    BNE .justReturn                                            ;83D2B6|D027    |83D2DF;
    LDA.L nInGameMinuteCounter                                 ;83D2B8|AF1E1F7F|7F1F1E;
    BNE .justReturn                                            ;83D2BC|D021    |83D2DF;
    LDA.B #$08                                                 ;83D2BE|A908    |      ;
    JSL.L fCore_GetRandomNumber                                ;83D2C0|22F98980|8089F9;
    BNE .justReturn                                            ;83D2C4|D019    |83D2DF;
    REP #$30                                                   ;83D2C6|C230    |      ;
    %AIExecute($0000, $0023, $0000)
    REP #$30                                                   ;83D2D5|C230    |      ;
    LDA.W #$0002                                               ;83D2D7|A90200  |      ;
    JSL.L fGameEngine_AddHappiness                             ;83D2DA|2282B283|83B282;
    RTS                                                        ;83D2DE|60      |      ;
 
 
.justReturn:
    RTS                                                        ;83D2DF|60      |      ;
 
 
fAreaEvents_Town:
    REP #$30                                                   ;83D2E0|C230    |      ;
    %CheckFlag(daily4, $0400)
    BEQ +                                                      ;83D2E9|F019    |83D304;
    %CheckFlag(daily4, $FBFF)
    STA.B $60                                                  ;83D2F2|8560    |000060;
    REP #$30                                                   ;83D2F4|C230    |      ;
    %AIExecute($0000, $0014, $0003)
    RTS                                                        ;83D303|60      |      ;
 
 
  + SEP #$20                                                   ;83D304|E220    |      ;
    REP #$10                                                   ;83D306|C210    |      ;
    LDA.L nCurrentSeasonID                                     ;83D308|AF191F7F|7F1F19;
    CMP.B #$02                                                 ;83D30C|C902    |      ;
    BEQ +                                                      ;83D30E|F003    |83D313;
    JMP.W .label1                                              ;83D310|4CB8D3  |83D3B8;
 
 
  + LDA.L nCurrentDay                                          ;83D313|AF1B1F7F|7F1F1B;
    CMP.B #$14                                                 ;83D317|C914    |      ;
    BEQ +                                                      ;83D319|F003    |83D31E;
    JMP.W .label1                                              ;83D31B|4CB8D3  |83D3B8;
 
 
  + LDA.L nCurrentTimeID                                       ;83D31E|AF1C1F7F|7F1F1C;
    CMP.B #$0F                                                 ;83D322|C90F    |      ;
    BCC +                                                      ;83D324|9003    |83D329;
    JMP.W .label1                                              ;83D326|4CB8D3  |83D3B8;
 
 
  + REP #$30                                                   ;83D329|C230    |      ;
    %AIExecute($0015, $0000, $007E)
    REP #$20                                                   ;83D338|C220    |      ;
    STZ.B strcVariables.n16Temp1                               ;83D33A|647E    |00007E;
    SEP #$20                                                   ;83D33C|E220    |      ;
    LDA.B #$00                                                 ;83D33E|A900    |      ;
    STA.W $09A4                                                ;83D340|8DA409  |0009A4;
    LDA.B #$01                                                 ;83D343|A901    |      ;
    STA.W $09A5                                                ;83D345|8DA509  |0009A5;
    LDA.B #$02                                                 ;83D348|A902    |      ;
    STA.W $09A6                                                ;83D34A|8DA609  |0009A6;
    LDA.B #$03                                                 ;83D34D|A903    |      ;
    STA.W $09A7                                                ;83D34F|8DA709  |0009A7;
    LDA.B #$04                                                 ;83D352|A904    |      ;
    STA.W $09A8                                                ;83D354|8DA809  |0009A8;
    LDA.B #$05                                                 ;83D357|A905    |      ;
    STA.W $09A9                                                ;83D359|8DA909  |0009A9;
    LDA.B #$00                                                 ;83D35C|A900    |      ;
    STA.W $09AA                                                ;83D35E|8DAA09  |0009AA;
    LDA.B #$00                                                 ;83D361|A900    |      ;
    STA.W $09AB                                                ;83D363|8DAB09  |0009AB;
    LDY.W #$0000                                               ;83D366|A00000  |      ;
 
  - SEP #$20                                                   ;83D369|E220    |      ;
    REP #$10                                                   ;83D36B|C210    |      ;
    PHY                                                        ;83D36D|5A      |      ;
    TYX                                                        ;83D36E|BB      |      ;
    STY.B strcVariables.n16Temp4                               ;83D36F|8484    |000084;
    LDA.W $09A4,X                                              ;83D371|BDA409  |0009A4;
    STA.B strcVariables.n8Temp4                                ;83D374|8595    |000095;
    SEP #$20                                                   ;83D376|E220    |      ;
    LDA.B #$08                                                 ;83D378|A908    |      ;
    JSL.L fCore_GetRandomNumber                                ;83D37A|22F98980|8089F9;
    SEP #$20                                                   ;83D37E|E220    |      ;
    REP #$10                                                   ;83D380|C210    |      ;
    XBA                                                        ;83D382|EB      |      ;
    LDA.B #$00                                                 ;83D383|A900    |      ;
    XBA                                                        ;83D385|EB      |      ;
    REP #$20                                                   ;83D386|C220    |      ;
    TAX                                                        ;83D388|AA      |      ;
    STX.B strcVariables.n16Unk86                               ;83D389|8686    |000086;
    SEP #$20                                                   ;83D38B|E220    |      ;
    LDA.W $09A4,X                                              ;83D38D|BDA409  |0009A4;
    LDX.B strcVariables.n16Temp4                               ;83D390|A684    |000084;
    STA.W $09A4,X                                              ;83D392|9DA409  |0009A4;
    LDA.B strcVariables.n8Temp4                                ;83D395|A595    |000095;
    LDX.B strcVariables.n16Unk86                               ;83D397|A686    |000086;
    STA.W $09A4,X                                              ;83D399|9DA409  |0009A4;
    PLY                                                        ;83D39C|7A      |      ;
    INY                                                        ;83D39D|C8      |      ;
    CPY.W #$0007                                               ;83D39E|C00700  |      ;
    BNE -                                                      ;83D3A1|D0C6    |83D369;
    SEP #$20                                                   ;83D3A3|E220    |      ;
    STZ.W $09A2                                                ;83D3A5|9CA209  |0009A2;
    REP #$30                                                   ;83D3A8|C230    |      ;
    %AIExecute($0000, $0028, $0002)
    RTS                                                        ;83D3B7|60      |      ;
 
 
.label1:
    SEP #$20                                                   ;83D3B8|E220    |      ;
    REP #$10                                                   ;83D3BA|C210    |      ;
    LDA.L nCurrentSeasonID                                     ;83D3BC|AF191F7F|7F1F19;
    BNE +                                                      ;83D3C0|D020    |83D3E2;
    LDA.L nCurrentDay                                          ;83D3C2|AF1B1F7F|7F1F1B;
    CMP.B #$17                                                 ;83D3C6|C917    |      ;
    BNE +                                                      ;83D3C8|D018    |83D3E2;
    LDA.L nCurrentTimeID                                       ;83D3CA|AF1C1F7F|7F1F1C;
    CMP.B #$0F                                                 ;83D3CE|C90F    |      ;
    BCS +                                                      ;83D3D0|B010    |83D3E2;
    REP #$30                                                   ;83D3D2|C230    |      ;
    %AIExecute($0000, $000E, $0000)
    RTS                                                        ;83D3E1|60      |      ;
 
 
  + SEP #$20                                                   ;83D3E2|E220    |      ;
    REP #$10                                                   ;83D3E4|C210    |      ;
    LDA.L nCurrentSeasonID                                     ;83D3E6|AF191F7F|7F1F19;
    CMP.B #$02                                                 ;83D3EA|C902    |      ;
    BNE +                                                      ;83D3EC|D020    |83D40E;
    LDA.L nCurrentDay                                          ;83D3EE|AF1B1F7F|7F1F1B;
    CMP.B #$0C                                                 ;83D3F2|C90C    |      ;
    BNE +                                                      ;83D3F4|D018    |83D40E;
    LDA.L nCurrentTimeID                                       ;83D3F6|AF1C1F7F|7F1F1C;
    CMP.B #$0F                                                 ;83D3FA|C90F    |      ;
    BCS +                                                      ;83D3FC|B010    |83D40E;
    REP #$30                                                   ;83D3FE|C230    |      ;
    %AIExecute($0000, $0026, $0000)
    RTS                                                        ;83D40D|60      |      ;
 
 
  + SEP #$20                                                   ;83D40E|E220    |      ;
    REP #$10                                                   ;83D410|C210    |      ;
    LDA.L nCurrentSeasonID                                     ;83D412|AF191F7F|7F1F19;
    CMP.B #$03                                                 ;83D416|C903    |      ;
    BNE +                                                      ;83D418|D020    |83D43A;
    LDA.L nCurrentDay                                          ;83D41A|AF1B1F7F|7F1F1B;
    CMP.B #$0A                                                 ;83D41E|C90A    |      ;
    BNE +                                                      ;83D420|D018    |83D43A;
    LDA.L nCurrentTimeID                                       ;83D422|AF1C1F7F|7F1F1C;
    CMP.B #$11                                                 ;83D426|C911    |      ;
    BCS +                                                      ;83D428|B010    |83D43A;
    REP #$30                                                   ;83D42A|C230    |      ;
    %AIExecute($0000, $0027, $0000)
    RTS                                                        ;83D439|60      |      ;
 
 
  + REP #$30                                                   ;83D43A|C230    |      ;
    %CheckFlag(event4, $4000)
    BNE +                                                      ;83D443|D00D    |83D452;
    %AIExecute($0015, $0000, $007E)
 
  + REP #$30                                                   ;83D452|C230    |      ;
    %CheckFlag(event3, $0001)
    BNE +                                                      ;83D45B|D010    |83D46D;
    REP #$30                                                   ;83D45D|C230    |      ;
    %AIExecute($0000, $000B, $0000)
    RTS                                                        ;83D46C|60      |      ;
 
 
  + REP #$20                                                   ;83D46D|C220    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;83D46F|AD9601  |000196;
    AND.W #$0008                                               ;83D472|290800  |      ;
    BNE +                                                      ;83D475|D03F    |83D4B6;
    SEP #$20                                                   ;83D477|E220    |      ;
    LDA.W nWeatherForecast                                     ;83D479|AD8C09  |00098C;
    CMP.B #$03                                                 ;83D47C|C903    |      ;
    BEQ +                                                      ;83D47E|F036    |83D4B6;
    REP #$30                                                   ;83D480|C230    |      ;
    %CheckFlag(event1, $0020)
    BNE +                                                      ;83D489|D02B    |83D4B6;
    LDA.W strcDialogDisplay.mapFlags                           ;83D48B|AD9601  |000196;
    AND.W #$0200                                               ;83D48E|290002  |      ;
    BNE +                                                      ;83D491|D023    |83D4B6;
    LDA.W strcDialogDisplay.mapFlags                           ;83D493|AD9601  |000196;
    AND.W #$0002                                               ;83D496|290200  |      ;
    BNE +                                                      ;83D499|D01B    |83D4B6;
    SEP #$20                                                   ;83D49B|E220    |      ;
    LDA.L nCurrentWeekdayID                                    ;83D49D|AF1A1F7F|7F1F1A;
    BEQ .return1                                               ;83D4A1|F014    |83D4B7;
    CMP.B #$06                                                 ;83D4A3|C906    |      ;
    BEQ .return2                                               ;83D4A5|F020    |83D4C7;
    REP #$30                                                   ;83D4A7|C230    |      ;
    %AIExecute($0000, $0001, $0000)
 
  + RTS                                                        ;83D4B6|60      |      ;
 
 
.return1:
    REP #$30                                                   ;83D4B7|C230    |      ;
    %AIExecute($0000, $0003, $0000)
    RTS                                                        ;83D4C6|60      |      ;
 
 
.return2:
    REP #$30                                                   ;83D4C7|C230    |      ;
    %AIExecute($0000, $0002, $0000)
    RTS                                                        ;83D4D6|60      |      ;
 
 
fAreaEvents_MajorHouse:
    REP #$30                                                   ;83D4D7|C230    |      ;
    %CheckFlag(event2, !EFLAGS2_MARRIEDMARIA)
    BNE +                                                      ;83D4E0|D002    |83D4E4;
    BRA fAreaEvents_MajorHouseHandler                          ;83D4E2|801B    |83D4FF;
 
 
  + REP #$30                                                   ;83D4E4|C230    |      ;
    %CheckFlag(event6, $0002)
    BEQ fAreaEvents_MajorHouseHandler                          ;83D4ED|F010    |83D4FF;
    REP #$30                                                   ;83D4EF|C230    |      ;
    %AIExecute($0000, $0022, $0003)
    RTS                                                        ;83D4FE|60      |      ;
 
 
fAreaEvents_MajorHouseHandler:
    SEP #$20                                                   ;83D4FF|E220    |      ;
    REP #$10                                                   ;83D501|C210    |      ;
    LDA.L nCurrentSeasonID                                     ;83D503|AF191F7F|7F1F19;
    CMP.B #$03                                                 ;83D507|C903    |      ;
    BNE +                                                      ;83D509|D020    |83D52B;
    LDA.L nCurrentDay                                          ;83D50B|AF1B1F7F|7F1F1B;
    CMP.B #$0A                                                 ;83D50F|C90A    |      ;
    BNE +                                                      ;83D511|D018    |83D52B;
    LDA.L nCurrentTimeID                                       ;83D513|AF1C1F7F|7F1F1C;
    CMP.B #$11                                                 ;83D517|C911    |      ;
    BCS +                                                      ;83D519|B010    |83D52B;
    REP #$30                                                   ;83D51B|C230    |      ;
    %AIExecute($0000, $0027, $0003)
    RTS                                                        ;83D52A|60      |      ;
 
 
  + REP #$30                                                   ;83D52B|C230    |      ;
    %CheckFlag(event3, $0001)
    BNE +                                                      ;83D534|D010    |83D546;
    REP #$30                                                   ;83D536|C230    |      ;
    %AIExecute($0000, $000B, $0001)
    RTS                                                        ;83D545|60      |      ;
 
 
  + REP #$20                                                   ;83D546|C220    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;83D548|AD9601  |000196;
    AND.W #$0008                                               ;83D54B|290800  |      ;
    BNE .label2                                                ;83D54E|D067    |83D5B7;
    SEP #$20                                                   ;83D550|E220    |      ;
    REP #$10                                                   ;83D552|C210    |      ;
    LDA.W nWeatherForecast                                     ;83D554|AD8C09  |00098C;
    CMP.B #!WEATHER_FLOWERFESTIVAL                                                 
    BCS .anyFestival                                           ;83D559|B02C    |83D587;
    LDA.W nWeatherForecast                                     ;83D55B|AD8C09  |00098C;
    CMP.B #!WEATHER_HURRICANE                                                 
    BEQ .hurricane                                             ;83D560|F065    |83D5C7;
    REP #$30                                                   ;83D562|C230    |      ;
    %CheckFlag(event1, $0020)
    BNE .hurricane                                             ;83D56B|D05A    |83D5C7;
    LDA.W strcDialogDisplay.mapFlags                           ;83D56D|AD9601  |000196;
    AND.W #$0200                                               ;83D570|290002  |      ;
    BNE .label3                                                ;83D573|D062    |83D5D7;
    LDA.W strcDialogDisplay.mapFlags                           ;83D575|AD9601  |000196;
    AND.W #$0002                                               ;83D578|290200  |      ;
    BNE .label1                                                ;83D57B|D02A    |83D5A7;
    SEP #$20                                                   ;83D57D|E220    |      ;
    LDA.L nCurrentWeekdayID                                    ;83D57F|AF1A1F7F|7F1F1A;
    CMP.B #!DAY_SATURDAY                                                 
    BEQ .saturday                                              ;83D585|F010    |83D597;
 
.anyFestival:
    REP #$30                                                   ;83D587|C230    |      ;
    %AIExecute($0000, $0001, $0001)
    RTS                                                        ;83D596|60      |      ;
 
 
.saturday:
    REP #$30                                                   ;83D597|C230    |      ;
    %AIExecute($0000, $0002, $0001)
    RTS                                                        ;83D5A6|60      |      ;
 
 
.label1:
    REP #$30                                                   ;83D5A7|C230    |      ;
    %AIExecute($0000, $0004, $0000)
    RTS                                                        ;83D5B6|60      |      ;
 
 
.label2:
    REP #$30                                                   ;83D5B7|C230    |      ;
    %AIExecute($0000, $0007, $0000)
    RTS                                                        ;83D5C6|60      |      ;
 
 
.hurricane:
    REP #$30                                                   ;83D5C7|C230    |      ;
    %AIExecute($0000, $0006, $0000)
    RTS                                                        ;83D5D6|60      |      ;
 
 
.label3:
    REP #$30                                                   ;83D5D7|C230    |      ;
    %AIExecute($0000, $0008, $0000)
    RTS                                                        ;83D5E6|60      |      ;
 
 
fAreaEvents_MariaBedroom:
    REP #$30                                                   ;83D5E7|C230    |      ;
    %CheckFlag(event2, !EFLAGS2_MARRIEDMARIA)
    BNE +                                                      ;83D5F0|D003    |83D5F5;
    JMP.W fAreaEvents_MajorHouseHandler                        ;83D5F2|4CFFD4  |83D4FF;
 
 
  + REP #$30                                                   ;83D5F5|C230    |      ;
    %CheckFlag(event6, $0002)
    BNE +                                                      ;83D5FE|D003    |83D603;
    JMP.W fAreaEvents_MajorHouseHandler                        ;83D600|4CFFD4  |83D4FF;
 
 
  + REP #$30                                                   ;83D603|C230    |      ;
    %AIExecute($0000, $0022, $0004)
    RTS                                                        ;83D612|60      |      ;
 
 
fAreaEvents_Church:
    SEP #$20                                                   ;83D613|E220    |      ;
    REP #$10                                                   ;83D615|C210    |      ;
    LDA.L nCurrentSeasonID                                     ;83D617|AF191F7F|7F1F19;
    CMP.B #!SEASON_WINTER                                                 
    BNE +                                                      ;83D61D|D020    |83D63F;
    LDA.L nCurrentDay                                          ;83D61F|AF1B1F7F|7F1F1B;
    CMP.B #$0A                                                 ;83D623|C90A    |      ;
    BNE +                                                      ;83D625|D018    |83D63F;
    LDA.L nCurrentTimeID                                       ;83D627|AF1C1F7F|7F1F1C;
    CMP.B #$11                                                 ;83D62B|C911    |      ;
    BCS +                                                      ;83D62D|B010    |83D63F;
    REP #$30                                                   ;83D62F|C230    |      ;
    %AIExecute($0000, $0027, $0002)
    RTS                                                        ;83D63E|60      |      ;
 
 
  + SEP #$20                                                   ;83D63F|E220    |      ;
    REP #$10                                                   ;83D641|C210    |      ;
    LDA.L nCurrentSeasonID                                     ;83D643|AF191F7F|7F1F19;
    CMP.B #!SEASON_WINTER                                                 
    BNE +                                                      ;83D649|D023    |83D66E;
    LDA.L nCurrentDay                                          ;83D64B|AF1B1F7F|7F1F1B;
    CMP.B #$18                                                 ;83D64F|C918    |      ;
    BNE +                                                      ;83D651|D01B    |83D66E;
    REP #$20                                                   ;83D653|C220    |      ;
    %CheckFlag(unknown1, $0002)
    BEQ +                                                      ;83D65C|F010    |83D66E;
    REP #$30                                                   ;83D65E|C230    |      ;
    %AIExecute($0000, $000F, $0002)
    RTS                                                        ;83D66D|60      |      ;
 
 
  + REP #$30                                                   ;83D66E|C230    |      ;
    %CheckFlag(event3, $0001)
    BNE +                                                      ;83D677|D010    |83D689;
    REP #$30                                                   ;83D679|C230    |      ;
    %AIExecute($0000, $000B, $000C)
    RTS                                                        ;83D688|60      |      ;
 
 
  + REP #$20                                                   ;83D689|C220    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;83D68B|AD9601  |000196;
    AND.W #!AFLAGS_UNK0008                                               
    BEQ +                                                      ;83D691|F003    |83D696;
    JMP.W .label4                                              ;83D693|4C1ED7  |83D71E;
 
 
  + SEP #$20                                                   ;83D696|E220    |      ;
    REP #$10                                                   ;83D698|C210    |      ;
    LDA.W nWeatherForecast                                     ;83D69A|AD8C09  |00098C;
    CMP.B #!WEATHER_FLOWERFESTIVAL                                                 
    BCS .anyFestival                                           ;83D69F|B03D    |83D6DE;
    LDA.W nWeatherForecast                                     ;83D6A1|AD8C09  |00098C;
    CMP.B #!WEATHER_HURRICANE                                                 
    BNE +                                                      ;83D6A6|D003    |83D6AB;
    JMP.W .hurricane                                           ;83D6A8|4C2ED7  |83D72E;
 
 
  + REP #$30                                                   ;83D6AB|C230    |      ;
    %CheckFlag(event1, $0020)
    BNE .hurricane                                             ;83D6B4|D078    |83D72E;
    LDA.W strcDialogDisplay.mapFlags                           ;83D6B6|AD9601  |000196;
    AND.W #$0200                                               ;83D6B9|290002  |      ;
    BEQ +                                                      ;83D6BC|F003    |83D6C1;
    JMP.W .label5                                              ;83D6BE|4C3ED7  |83D73E;
 
 
  + %CheckFlag(event3, $0001)
    BEQ .justReturn                                            ;83D6C8|F023    |83D6ED;
    LDA.W strcDialogDisplay.mapFlags                           ;83D6CA|AD9601  |000196;
    AND.W #$0002                                               ;83D6CD|290200  |      ;
    BNE .label3                                                ;83D6D0|D03C    |83D70E;
    SEP #$20                                                   ;83D6D2|E220    |      ;
    LDA.L nCurrentWeekdayID                                    ;83D6D4|AF1A1F7F|7F1F1A;
    BEQ .notSunday                                             ;83D6D8|F014    |83D6EE;
    CMP.B #$06                                                 ;83D6DA|C906    |      ;
    BEQ .saturday                                              ;83D6DC|F020    |83D6FE;
 
.anyFestival:
    REP #$30                                                   ;83D6DE|C230    |      ;
    %AIExecute($0000, $0001, $0002)
 
.justReturn:
    RTS                                                        ;83D6ED|60      |      ;
 
 
.notSunday:
    REP #$30                                                   ;83D6EE|C230    |      ;
    %AIExecute($0000, $0003, $0001)
    RTS                                                        ;83D6FD|60      |      ;
 
 
.saturday:
    REP #$30                                                   ;83D6FE|C230    |      ;
    %AIExecute($0000, $0002, $0002)
    RTS                                                        ;83D70D|60      |      ;
 
 
.label3:
    REP #$30                                                   ;83D70E|C230    |      ;
    %AIExecute($0000, $0004, $0001)
    RTS                                                        ;83D71D|60      |      ;
 
 
.label4:
    REP #$30                                                   ;83D71E|C230    |      ;
    %AIExecute($0000, $0007, $0001)
    RTS                                                        ;83D72D|60      |      ;
 
 
.hurricane:
    REP #$30                                                   ;83D72E|C230    |      ;
    %AIExecute($0000, $0006, $0001)
    RTS                                                        ;83D73D|60      |      ;
 
 
.label5:
    REP #$30                                                   ;83D73E|C230    |      ;
    %AIExecute($0000, $0008, $0001)
    RTS                                                        ;83D74D|60      |      ;
 
 
fAreaEvents_Florist:
    REP #$30                                                   ;83D74E|C230    |      ;
    %CheckFlag(event2, !EFLAGS2_MARRIEDNINA)
    BNE +                                                      ;83D757|D002    |83D75B;
    BRA fAreaEvents_FloristHandler                             ;83D759|801B    |83D776;
 
 
  + REP #$30                                                   ;83D75B|C230    |      ;
    %CheckFlag(event6, $0002)
    BEQ fAreaEvents_FloristHandler                             ;83D764|F010    |83D776;
    REP #$30                                                   ;83D766|C230    |      ;
    %AIExecute($0000, $0022, $0007)
    RTS                                                        ;83D775|60      |      ;
 
 
fAreaEvents_FloristHandler:
    REP #$30                                                   ;83D776|C230    |      ;
    %CheckFlag(event3, $0001)
    BNE +                                                      ;83D77F|D010    |83D791;
    REP #$30                                                   ;83D781|C230    |      ;
    %AIExecute($0000, $000B, $0003)
    RTS                                                        ;83D790|60      |      ;
 
 
  + REP #$20                                                   ;83D791|C220    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;83D793|AD9601  |000196;
    AND.W #$0008                                               ;83D796|290800  |      ;
    BNE .label5                                                ;83D799|D04D    |83D7E8;
    SEP #$20                                                   ;83D79B|E220    |      ;
    REP #$10                                                   ;83D79D|C210    |      ;
    LDA.W nWeatherForecast                                     ;83D79F|AD8C09  |00098C;
    CMP.B #!WEATHER_FLOWERFESTIVAL                                                 
    BCS .anyFestival                                           ;83D7A4|B022    |83D7C8;
    LDA.W nWeatherForecast                                     ;83D7A6|AD8C09  |00098C;
    CMP.B #!WEATHER_HURRICANE                                                 
    BEQ .hurricane                                             ;83D7AB|F04B    |83D7F8;
    REP #$30                                                   ;83D7AD|C230    |      ;
    %CheckFlag(event1, $0020)
    BNE .hurricane                                             ;83D7B6|D040    |83D7F8;
    LDA.W strcDialogDisplay.mapFlags                           ;83D7B8|AD9601  |000196;
    AND.W #$0200                                               ;83D7BB|290002  |      ;
    BNE .label7                                                ;83D7BE|D048    |83D808;
    LDA.W strcDialogDisplay.mapFlags                           ;83D7C0|AD9601  |000196;
    AND.W #$0002                                               ;83D7C3|290200  |      ;
    BNE .label4                                                ;83D7C6|D010    |83D7D8;
 
.anyFestival:
    REP #$30                                                   ;83D7C8|C230    |      ;
    %AIExecute($0000, $0001, $0003)
    RTS                                                        ;83D7D7|60      |      ;
 
 
.label4:
    REP #$30                                                   ;83D7D8|C230    |      ;
    %AIExecute($0000, $0004, $0002)
    RTS                                                        ;83D7E7|60      |      ;
 
 
.label5:
    REP #$30                                                   ;83D7E8|C230    |      ;
    %AIExecute($0000, $0007, $0002)
    RTS                                                        ;83D7F7|60      |      ;
 
 
.hurricane:
    REP #$30                                                   ;83D7F8|C230    |      ;
    %AIExecute($0000, $0006, $0002)
    RTS                                                        ;83D807|60      |      ;
 
 
.label7:
    REP #$30                                                   ;83D808|C230    |      ;
    %AIExecute($0000, $0008, $0002)
    RTS                                                        ;83D817|60      |      ;
 
 
fAreaEvents_NinaBedroom:
    REP #$30                                                   ;83D818|C230    |      ;
    %CheckFlag(event2, !EFLAGS2_MARRIEDNINA)
    BNE +                                                      ;83D821|D003    |83D826;
    JMP.W fAreaEvents_FloristHandler                           ;83D823|4C76D7  |83D776;
 
 
  + REP #$30                                                   ;83D826|C230    |      ;
    %CheckFlag(event6, $0002)
    BNE +                                                      ;83D82F|D003    |83D834;
    JMP.W fAreaEvents_FloristHandler                           ;83D831|4C76D7  |83D776;
 
 
  + REP #$30                                                   ;83D834|C230    |      ;
    %AIExecute($0000, $0022, $0008)
    RTS                                                        ;83D843|60      |      ;
 
 
fAreaEvents_Toolshop:
    REP #$30                                                   ;83D844|C230    |      ;
    %CheckFlag(event2, !EFLAGS2_MARRIEDANN)
    BNE +                                                      ;83D84D|D002    |83D851;
    BRA fAreaEvents_ToolshopHandler                            ;83D84F|801B    |83D86C;
 
 
  + REP #$30                                                   ;83D851|C230    |      ;
    %CheckFlag(event6, $0002)
    BEQ fAreaEvents_ToolshopHandler                            ;83D85A|F010    |83D86C;
    REP #$30                                                   ;83D85C|C230    |      ;
    %AIExecute($0000, $0022, $0005)
    RTS                                                        ;83D86B|60      |      ;
 
 
fAreaEvents_ToolshopHandler:
    REP #$30                                                   ;83D86C|C230    |      ;
    %CheckFlag(daily3, $0010)
    BEQ +                                                      ;83D875|F010    |83D887;
    REP #$30                                                   ;83D877|C230    |      ;
    %AIExecute($0000, $001A, $0001)
    RTS                                                        ;83D886|60      |      ;
 
 
  + REP #$30                                                   ;83D887|C230    |      ;
    %CheckFlag(event3, $0001)
    BNE .label1                                                ;83D890|D010    |83D8A2;
    REP #$30                                                   ;83D892|C230    |      ;
    %AIExecute($0000, $000B, $0002)
    RTS                                                        ;83D8A1|60      |      ;
 
 
.label1:
    REP #$20                                                   ;83D8A2|C220    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;83D8A4|AD9601  |000196;
    AND.W #$0008                                               ;83D8A7|290800  |      ;
    BNE .label3                                                ;83D8AA|D04D    |83D8F9;
    SEP #$20                                                   ;83D8AC|E220    |      ;
    REP #$10                                                   ;83D8AE|C210    |      ;
    LDA.W nWeatherForecast                                     ;83D8B0|AD8C09  |00098C;
    CMP.B #!WEATHER_FLOWERFESTIVAL                                                 
    BCS .anyFestival                                           ;83D8B5|B022    |83D8D9;
    LDA.W nWeatherForecast                                     ;83D8B7|AD8C09  |00098C;
    CMP.B #!WEATHER_HURRICANE                                                 
    BEQ .hurricane                                             ;83D8BC|F04B    |83D909;
    REP #$30                                                   ;83D8BE|C230    |      ;
    %CheckFlag(event1, $0020)
    BNE .hurricane                                             ;83D8C7|D040    |83D909;
    LDA.W strcDialogDisplay.mapFlags                           ;83D8C9|AD9601  |000196;
    AND.W #$0200                                               ;83D8CC|290002  |      ;
    BNE .label4                                                ;83D8CF|D048    |83D919;
    LDA.W strcDialogDisplay.mapFlags                           ;83D8D1|AD9601  |000196;
    AND.W #$0002                                               ;83D8D4|290200  |      ;
    BNE .label2                                                ;83D8D7|D010    |83D8E9;
 
.anyFestival:
    REP #$30                                                   ;83D8D9|C230    |      ;
    %AIExecute($0000, $0001, $0004)
    RTS                                                        ;83D8E8|60      |      ;
 
 
.label2:
    REP #$30                                                   ;83D8E9|C230    |      ;
    %AIExecute($0000, $0004, $0003)
    RTS                                                        ;83D8F8|60      |      ;
 
 
.label3:
    REP #$30                                                   ;83D8F9|C230    |      ;
    %AIExecute($0000, $0007, $0003)
    RTS                                                        ;83D908|60      |      ;
 
 
.hurricane:
    REP #$30                                                   ;83D909|C230    |      ;
    %AIExecute($0000, $0006, $0003)
    RTS                                                        ;83D918|60      |      ;
 
 
.label4:
    REP #$30                                                   ;83D919|C230    |      ;
    %AIExecute($0000, $0008, $0003)
    RTS                                                        ;83D928|60      |      ;
 
 
fAreaEvents_AnnBedroom:
    REP #$30                                                   ;83D929|C230    |      ;
    %CheckFlag(event2, !EFLAGS2_MARRIEDANN)
    BNE +                                                      ;83D932|D003    |83D937;
    JMP.W fAreaEvents_ToolshopHandler                          ;83D934|4C6CD8  |83D86C;
 
 
  + REP #$30                                                   ;83D937|C230    |      ;
    %CheckFlag(event6, $0002)
    BNE +                                                      ;83D940|D003    |83D945;
    JMP.W fAreaEvents_ToolshopHandler                          ;83D942|4C6CD8  |83D86C;
 
 
  + REP #$30                                                   ;83D945|C230    |      ;
    %AIExecute($0000, $0022, $0006)
    RTS                                                        ;83D954|60      |      ;
 
 
fAreaEvents_Restaurant:
    REP #$30                                                   ;83D955|C230    |      ;
    %CheckFlag(event2, !EFLAGS2_MARRIEDELLEN)
    BNE +                                                      ;83D95E|D002    |83D962;
    BRA fAreaEvents_RestaurantHandler                          ;83D960|801B    |83D97D;
 
 
  + REP #$30                                                   ;83D962|C230    |      ;
    %CheckFlag(event6, $0002)
    BEQ fAreaEvents_RestaurantHandler                          ;83D96B|F010    |83D97D;
    REP #$30                                                   ;83D96D|C230    |      ;
    %AIExecute($0000, $0022, $0009)
    RTS                                                        ;83D97C|60      |      ;
 
 
fAreaEvents_RestaurantHandler:
    REP #$30                                                   ;83D97D|C230    |      ;
    %CheckFlag(event3, $0001)
    BNE +                                                      ;83D986|D010    |83D998;
    REP #$30                                                   ;83D988|C230    |      ;
    %AIExecute($0000, $000B, $0004)
    RTS                                                        ;83D997|60      |      ;
 
 
  + REP #$20                                                   ;83D998|C220    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;83D99A|AD9601  |000196;
    AND.W #$0008                                               ;83D99D|290800  |      ;
    BNE .label2                                                ;83D9A0|D04D    |83D9EF;
    SEP #$20                                                   ;83D9A2|E220    |      ;
    REP #$10                                                   ;83D9A4|C210    |      ;
    LDA.W nWeatherForecast                                     ;83D9A6|AD8C09  |00098C;
    CMP.B #!WEATHER_FLOWERFESTIVAL                                                 
    BCS .anyFestival                                           ;83D9AB|B022    |83D9CF;
    LDA.W nWeatherForecast                                     ;83D9AD|AD8C09  |00098C;
    CMP.B #!WEATHER_HURRICANE                                                 
    BEQ .hurricane                                             ;83D9B2|F04B    |83D9FF;
    REP #$30                                                   ;83D9B4|C230    |      ;
    %CheckFlag(event1, $0020)
    BNE .hurricane                                             ;83D9BD|D040    |83D9FF;
    LDA.W strcDialogDisplay.mapFlags                           ;83D9BF|AD9601  |000196;
    AND.W #$0200                                               ;83D9C2|290002  |      ;
    BNE .label3                                                ;83D9C5|D048    |83DA0F;
    LDA.W strcDialogDisplay.mapFlags                           ;83D9C7|AD9601  |000196;
    AND.W #$0002                                               ;83D9CA|290200  |      ;
    BNE .label1                                                ;83D9CD|D010    |83D9DF;
 
.anyFestival:
    REP #$30                                                   ;83D9CF|C230    |      ;
    %AIExecute($0000, $0001, $0005)
    RTS                                                        ;83D9DE|60      |      ;
 
 
.label1:
    REP #$30                                                   ;83D9DF|C230    |      ;
    %AIExecute($0000, $0004, $0004)
    RTS                                                        ;83D9EE|60      |      ;
 
 
.label2:
    REP #$30                                                   ;83D9EF|C230    |      ;
    %AIExecute($0000, $0007, $0004)
    RTS                                                        ;83D9FE|60      |      ;
 
 
.hurricane:
    REP #$30                                                   ;83D9FF|C230    |      ;
    %AIExecute($0000, $0006, $0004)
    RTS                                                        ;83DA0E|60      |      ;
 
 
.label3:
    REP #$30                                                   ;83DA0F|C230    |      ;
    %AIExecute($0000, $0008, $0004)
    RTS                                                        ;83DA1E|60      |      ;
 
 
fAreaEvents_EllenBedroom:
    REP #$30                                                   ;83DA1F|C230    |      ;
    %CheckFlag(event2, !EFLAGS2_MARRIEDELLEN)
    BNE +                                                      ;83DA28|D003    |83DA2D;
    JMP.W fAreaEvents_RestaurantHandler                        ;83DA2A|4C7DD9  |83D97D;
 
 
  + REP #$30                                                   ;83DA2D|C230    |      ;
    %CheckFlag(event6, $0002)
    BNE +                                                      ;83DA36|D003    |83DA3B;
    JMP.W fAreaEvents_RestaurantHandler                        ;83DA38|4C7DD9  |83D97D;
 
 
  + REP #$30                                                   ;83DA3B|C230    |      ;
    %AIExecute($0000, $0022, $000A)
    RTS                                                        ;83DA4A|60      |      ;
 
 
fAreaEvents_FortuneTeller:
    REP #$30                                                   ;83DA4B|C230    |      ;
    %CheckFlag(event3, $0001)
    BNE +                                                      ;83DA54|D010    |83DA66;
    REP #$30                                                   ;83DA56|C230    |      ;
    %AIExecute($0000, $000B, $0005)
    RTS                                                        ;83DA65|60      |      ;
 
 
  + REP #$20                                                   ;83DA66|C220    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;83DA68|AD9601  |000196;
    AND.W #$0008                                               ;83DA6B|290800  |      ;
    BNE .label2                                                ;83DA6E|D04D    |83DABD;
    SEP #$20                                                   ;83DA70|E220    |      ;
    REP #$10                                                   ;83DA72|C210    |      ;
    LDA.W nWeatherForecast                                     ;83DA74|AD8C09  |00098C;
    CMP.B #!WEATHER_FLOWERFESTIVAL                                                 
    BCS .anyFestival                                           ;83DA79|B022    |83DA9D;
    LDA.W nWeatherForecast                                     ;83DA7B|AD8C09  |00098C;
    CMP.B #!WEATHER_HURRICANE                                                 
    BEQ .hurricane                                             ;83DA80|F04B    |83DACD;
    REP #$30                                                   ;83DA82|C230    |      ;
    %CheckFlag(event1, $0020)
    BNE .hurricane                                             ;83DA8B|D040    |83DACD;
    LDA.W strcDialogDisplay.mapFlags                           ;83DA8D|AD9601  |000196;
    AND.W #$0200                                               ;83DA90|290002  |      ;
    BNE .label3                                                ;83DA93|D048    |83DADD;
    LDA.W strcDialogDisplay.mapFlags                           ;83DA95|AD9601  |000196;
    AND.W #$0002                                               ;83DA98|290200  |      ;
    BNE .label1                                                ;83DA9B|D010    |83DAAD;
 
.anyFestival:
    REP #$30                                                   ;83DA9D|C230    |      ;
    %AIExecute($0000, $0001, $0006)
    RTS                                                        ;83DAAC|60      |      ;
 
 
.label1:
    REP #$30                                                   ;83DAAD|C230    |      ;
    %AIExecute($0000, $0004, $0005)
    RTS                                                        ;83DABC|60      |      ;
 
 
.label2:
    REP #$30                                                   ;83DABD|C230    |      ;
    %AIExecute($0000, $0007, $0005)
    RTS                                                        ;83DACC|60      |      ;
 
 
.hurricane:
    REP #$30                                                   ;83DACD|C230    |      ;
    %AIExecute($0000, $0006, $0005)
    RTS                                                        ;83DADC|60      |      ;
 
 
.label3:
    REP #$30                                                   ;83DADD|C230    |      ;
    %AIExecute($0000, $0008, $0005)
    RTS                                                        ;83DAEC|60      |      ;
 
 
fAreaEvents_AnimalShop:
    REP #$30                                                   ;83DAED|C230    |      ;
    %CheckFlag(event3, $0001)
    BNE +                                                      ;83DAF6|D010    |83DB08;
    REP #$30                                                   ;83DAF8|C230    |      ;
    %AIExecute($0000, $000B, $0006)
    RTS                                                        ;83DB07|60      |      ;
 
 
  + REP #$20                                                   ;83DB08|C220    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;83DB0A|AD9601  |000196;
    AND.W #$0008                                               ;83DB0D|290800  |      ;
    BNE .label2                                                ;83DB10|D04D    |83DB5F;
    SEP #$20                                                   ;83DB12|E220    |      ;
    REP #$10                                                   ;83DB14|C210    |      ;
    LDA.W nWeatherForecast                                     ;83DB16|AD8C09  |00098C;
    CMP.B #!WEATHER_FLOWERFESTIVAL                                                 
    BCS .anyFestival                                           ;83DB1B|B022    |83DB3F;
    LDA.W nWeatherForecast                                     ;83DB1D|AD8C09  |00098C;
    CMP.B #!WEATHER_HURRICANE                                                 
    BEQ .hurricane                                             ;83DB22|F04B    |83DB6F;
    REP #$30                                                   ;83DB24|C230    |      ;
    %CheckFlag(event1, $0020)
    BNE .hurricane                                             ;83DB2D|D040    |83DB6F;
    LDA.W strcDialogDisplay.mapFlags                           ;83DB2F|AD9601  |000196;
    AND.W #$0200                                               ;83DB32|290002  |      ;
    BNE .label3                                                ;83DB35|D048    |83DB7F;
    LDA.W strcDialogDisplay.mapFlags                           ;83DB37|AD9601  |000196;
    AND.W #$0002                                               ;83DB3A|290200  |      ;
    BNE .label1                                                ;83DB3D|D010    |83DB4F;
 
.anyFestival:
    REP #$30                                                   ;83DB3F|C230    |      ;
    %AIExecute($0000, $0001, $0007)
    RTS                                                        ;83DB4E|60      |      ;
 
 
.label1:
    REP #$30                                                   ;83DB4F|C230    |      ;
    %AIExecute($0000, $0004, $0006)
    RTS                                                        ;83DB5E|60      |      ;
 
 
.label2:
    REP #$30                                                   ;83DB5F|C230    |      ;
    %AIExecute($0000, $0007, $0006)
    RTS                                                        ;83DB6E|60      |      ;
 
 
.hurricane:
    REP #$30                                                   ;83DB6F|C230    |      ;
    %AIExecute($0000, $0006, $0006)
    RTS                                                        ;83DB7E|60      |      ;
 
 
.label3:
    REP #$30                                                   ;83DB7F|C230    |      ;
    %AIExecute($0000, $0008, $0006)
    RTS                                                        ;83DB8E|60      |      ;
 
 
fAreaEvents_Bar:
    REP #$30                                                   ;83DB8F|C230    |      ;
    %CheckFlag(event2, !EFLAGS2_MARRIEDEVE)
    BNE +                                                      ;83DB98|D002    |83DB9C;
    BRA fAreaEvents_BarHandler                                 ;83DB9A|801B    |83DBB7;
 
 
  + REP #$30                                                   ;83DB9C|C230    |      ;
    %CheckFlag(event6, $0002)
    BEQ fAreaEvents_BarHandler                                 ;83DBA5|F010    |83DBB7;
    REP #$30                                                   ;83DBA7|C230    |      ;
    %AIExecute($0000, $0022, $000B)
    RTS                                                        ;83DBB6|60      |      ;
 
 
fAreaEvents_BarHandler:
    SEP #$20                                                   ;83DBB7|E220    |      ;
    REP #$10                                                   ;83DBB9|C210    |      ;
    LDA.L nCurrentSeasonID                                     ;83DBBB|AF191F7F|7F1F19;
    CMP.B #$03                                                 ;83DBBF|C903    |      ;
    BNE +                                                      ;83DBC1|D023    |83DBE6;
    LDA.L nCurrentDay                                          ;83DBC3|AF1B1F7F|7F1F1B;
    CMP.B #$18                                                 ;83DBC7|C918    |      ;
    BNE +                                                      ;83DBC9|D01B    |83DBE6;
    REP #$20                                                   ;83DBCB|C220    |      ;
    %CheckFlag(unknown1, $0004)
    BEQ +                                                      ;83DBD4|F010    |83DBE6;
    REP #$30                                                   ;83DBD6|C230    |      ;
    %AIExecute($0000, $000F, $0003)
    RTS                                                        ;83DBE5|60      |      ;
 
 
  + REP #$30                                                   ;83DBE6|C230    |      ;
    %CheckFlag(event3, $0002)
    BNE +                                                      ;83DBEF|D01D    |83DC0E;
    REP #$30                                                   ;83DBF1|C230    |      ;
    %AIExecute($0000, $000B, $0007)
    REP #$30                                                   ;83DC00|C230    |      ;
    %SetFlag(event3, $0002)
    RTS                                                        ;83DC0D|60      |      ;
 
 
  + REP #$30                                                   ;83DC0E|C230    |      ;
    %AIExecute($0000, $0005, $0000)
    RTS                                                        ;83DC1D|60      |      ;
 
 
fAreaEvents_EveBedroom:
    REP #$30                                                   ;83DC1E|C230    |      ;
    %CheckFlag(event2, !EFLAGS2_MARRIEDEVE)
    BNE +                                                      ;83DC27|D003    |83DC2C;
    JMP.W fAreaEvents_BarHandler                               ;83DC29|4CB7DB  |83DBB7;
 
 
  + REP #$30                                                   ;83DC2C|C230    |      ;
    %CheckFlag(event6, $0002)
    BNE +                                                      ;83DC35|D003    |83DC3A;
    JMP.W fAreaEvents_BarHandler                               ;83DC37|4CB7DB  |83DBB7;
 
 
  + REP #$30                                                   ;83DC3A|C230    |      ;
    %AIExecute($0000, $0022, $000C)
    RTS                                                        ;83DC49|60      |      ;
 
 
fAreaEvents_Woods:
    REP #$30                                                   ;83DC4A|C230    |      ;
    %CheckFlag(event3, $0004)
    BNE +                                                      ;83DC53|D01D    |83DC72;
    REP #$30                                                   ;83DC55|C230    |      ;
    %AIExecute($0000, $000B, $0009)
    REP #$20                                                   ;83DC64|C220    |      ;
    %SetFlag(event3, $0004)
    RTS                                                        ;83DC71|60      |      ;
 
 
  + REP #$30                                                   ;83DC72|C230    |      ;
    %CheckFlag(daily3, $0020)
    BEQ +                                                      ;83DC7B|F010    |83DC8D;
    REP #$30                                                   ;83DC7D|C230    |      ;
    %AIExecute($0000, $001D, $0003)
    RTS                                                        ;83DC8C|60      |      ;
 
 
  + REP #$30                                                   ;83DC8D|C230    |      ;
    %CheckFlag(event5, $0010)
    BEQ +                                                      ;83DC96|F010    |83DCA8;
    REP #$30                                                   ;83DC98|C230    |      ;
    %AIExecute($0000, $001D, $0001)
    RTS                                                        ;83DCA7|60      |      ;
 
 
  + REP #$30                                                   ;83DCA8|C230    |      ;
    %CheckFlag(event5, $0004)
    BEQ .label1                                                ;83DCB1|F02C    |83DCDF;
    %CheckFlag(daily3, $0008)
    BNE +                                                      ;83DCBA|D011    |83DCCD;
    REP #$30                                                   ;83DCBC|C230    |      ;
    %AIExecute($0009, $001C, $0001)
    BRA .label2                                                ;83DCCB|8072    |83DD3F;
 
 
  + REP #$30                                                   ;83DCCD|C230    |      ;
    %AIExecute($0009, $001C, $0002)
    JMP.W .justReturn                                          ;83DCDC|4C74DD  |83DD74;
 
 
.label1:
    SEP #$20                                                   ;83DCDF|E220    |      ;
    REP #$10                                                   ;83DCE1|C210    |      ;
    LDA.L nCurrentYearID                                       ;83DCE3|AF181F7F|7F1F18;
    BEQ .label2                                                ;83DCE7|F056    |83DD3F;
    LDA.L nCurrentSeasonID                                     ;83DCE9|AF191F7F|7F1F19;
    CMP.B #$02                                                 ;83DCED|C902    |      ;
    BCC .label2                                                ;83DCEF|904E    |83DD3F;
    LDA.L nCurrentDay                                          ;83DCF1|AF1B1F7F|7F1F1B;
    CMP.B #$01                                                 ;83DCF5|C901    |      ;
    BEQ .label2                                                ;83DCF7|F046    |83DD3F;
    CMP.B #$08                                                 ;83DCF9|C908    |      ;
    BCC +                                                      ;83DCFB|9012    |83DD0F;
    CMP.B #$0D                                                 ;83DCFD|C90D    |      ;
    BCC .label2                                                ;83DCFF|903E    |83DD3F;
    CMP.B #$12                                                 ;83DD01|C912    |      ;
    BCC +                                                      ;83DD03|900A    |83DD0F;
    CMP.B #$19                                                 ;83DD05|C919    |      ;
    BCC .label2                                                ;83DD07|9036    |83DD3F;
    CMP.B #$1D                                                 ;83DD09|C91D    |      ;
    BCC +                                                      ;83DD0B|9002    |83DD0F;
    BRA .label2                                                ;83DD0D|8030    |83DD3F;
 
 
  + REP #$20                                                   ;83DD0F|C220    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;83DD11|AD9601  |000196;
    AND.W #$001A                                               ;83DD14|291A00  |      ;
    BNE .label2                                                ;83DD17|D026    |83DD3F;
    %CheckFlag(event4, $0200)
    BNE .label2                                                ;83DD20|D01D    |83DD3F;
    SEP #$20                                                   ;83DD22|E220    |      ;
    LDA.L nCurrentWeekdayID                                    ;83DD24|AF1A1F7F|7F1F1A;
    BEQ .label2                                                ;83DD28|F015    |83DD3F;
    CMP.B #$06                                                 ;83DD2A|C906    |      ;
    BEQ .label2                                                ;83DD2C|F011    |83DD3F;
    REP #$30                                                   ;83DD2E|C230    |      ;
    %AIExecute($0009, $0021, $0000)
    BRA .label2                                                ;83DD3D|8000    |83DD3F;
 
 
.label2:
    REP #$30                                                   ;83DD3F|C230    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;83DD41|AD9601  |000196;
    AND.W #$0008                                               ;83DD44|290800  |      ;
    BNE .justReturn                                            ;83DD47|D02B    |83DD74;
    LDA.W strcDialogDisplay.mapFlags                           ;83DD49|AD9601  |000196;
    AND.W #$0200                                               ;83DD4C|290002  |      ;
    BNE .justReturn                                            ;83DD4F|D023    |83DD74;
    LDA.W strcDialogDisplay.mapFlags                           ;83DD51|AD9601  |000196;
    AND.W #$0002                                               ;83DD54|290200  |      ;
    BNE .justReturn                                            ;83DD57|D01B    |83DD74;
    SEP #$20                                                   ;83DD59|E220    |      ;
    LDA.L nCurrentWeekdayID                                    ;83DD5B|AF1A1F7F|7F1F1A;
    BEQ .notSunday                                             ;83DD5F|F014    |83DD75;
    CMP.B #$06                                                 ;83DD61|C906    |      ;
    BEQ .saturday                                              ;83DD63|F020    |83DD85;
    REP #$30                                                   ;83DD65|C230    |      ;
    %AIExecute($0000, $0001, $0008)
 
.justReturn:
    RTS                                                        ;83DD74|60      |      ;
 
 
.notSunday:
    REP #$30                                                   ;83DD75|C230    |      ;
    %AIExecute($0000, $0003, $0002)
    RTS                                                        ;83DD84|60      |      ;
 
 
.saturday:
    REP #$30                                                   ;83DD85|C230    |      ;
    %AIExecute($0000, $0002, $0003)
    RTS                                                        ;83DD94|60      |      ;
 
 
fAreaEvents_WorksmanHouse:
    REP #$30                                                   ;83DD95|C230    |      ;
    %CheckFlag(event4, $2000)
    BNE +                                                      ;83DD9E|D019    |83DDB9;
    %CheckFlag(event4, $1000)
    BEQ +                                                      ;83DDA7|F010    |83DDB9;
    REP #$30                                                   ;83DDA9|C230    |      ;
    %AIExecute($0000, $0019, $0001)
    RTS                                                        ;83DDB8|60      |      ;
 
 
  + REP #$30                                                   ;83DDB9|C230    |      ;
    %CheckFlag(event3, $0008)
    BNE .label2                                                ;83DDC2|D046    |83DE0A;
    SEP #$20                                                   ;83DDC4|E220    |      ;
    LDA.L nCurrentYearID                                       ;83DDC6|AF181F7F|7F1F18;
    BNE .label1                                                ;83DDCA|D031    |83DDFD;
    LDA.L nCurrentSeasonID                                     ;83DDCC|AF191F7F|7F1F19;
    CMP.B #!SEASON_FALL                                                 
    BCS .label1                                                ;83DDD2|B029    |83DDFD;
    CMP.B #!SEASON_SPRING                                                 
    BEQ +                                                      ;83DDD6|F008    |83DDE0;
    LDA.L nCurrentDay                                          ;83DDD8|AF1B1F7F|7F1F1B;
    CMP.B #$1A                                                 ;83DDDC|C91A    |      ;
    BCS .label1                                                ;83DDDE|B01D    |83DDFD;
 
  + REP #$30                                                   ;83DDE0|C230    |      ;
    %AIExecute($0000, $000B, $000A)
    REP #$20                                                   ;83DDEF|C220    |      ;
    %SetFlag(event3, $0008)
    RTS                                                        ;83DDFC|60      |      ;
 
 
.label1:
    REP #$20                                                   ;83DDFD|C220    |      ;
    %SetFlag(event3, $0008)
 
.label2:
    REP #$30                                                   ;83DE0A|C230    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;83DE0C|AD9601  |000196;
    AND.W #$0008                                               ;83DE0F|290800  |      ;
    BNE .label4                                                ;83DE12|D030    |83DE44;
    LDA.W strcDialogDisplay.mapFlags                           ;83DE14|AD9601  |000196;
    AND.W #$0200                                               ;83DE17|290002  |      ;
    BNE .label5                                                ;83DE1A|D038    |83DE54;
    LDA.W strcDialogDisplay.mapFlags                           ;83DE1C|AD9601  |000196;
    AND.W #$0002                                               ;83DE1F|290200  |      ;
    BNE .label3                                                ;83DE22|D010    |83DE34;
    REP #$30                                                   ;83DE24|C230    |      ;
    %AIExecute($0000, $0001, $0009)
    RTS                                                        ;83DE33|60      |      ;
 
 
.label3:
    REP #$30                                                   ;83DE34|C230    |      ;
    %AIExecute($0000, $0004, $0007)
    RTS                                                        ;83DE43|60      |      ;
 
 
.label4:
    REP #$30                                                   ;83DE44|C230    |      ;
    %AIExecute($0000, $0007, $0007)
    RTS                                                        ;83DE53|60      |      ;
 
 
.label5:
    REP #$30                                                   ;83DE54|C230    |      ;
    %AIExecute($0000, $0008, $0007)
    RTS                                                        ;83DE63|60      |      ;
 
 
fAreaEvents_ImpsUnderground:
    REP #$30                                                   ;83DE64|C230    |      ;
    %CheckFlag(event3, $2000)
    BNE +                                                      ;83DE6D|D010    |83DE7F;
    REP #$30                                                   ;83DE6F|C230    |      ;
    %AIExecute($0000, $0015, $0000)
    RTS                                                        ;83DE7E|60      |      ;
 
 
  + REP #$30                                                   ;83DE7F|C230    |      ;
    %CheckFlag(event1, $0002)
    BEQ .justReturn                                            ;83DE88|F010    |83DE9A;
    REP #$30                                                   ;83DE8A|C230    |      ;
    %AIExecute($0000, $0001, $000A)
    RTS                                                        ;83DE99|60      |      ;
 
 
.justReturn:
    RTS                                                        ;83DE9A|60      |      ;
 
 
fAreaEvents_CowBarn:
    REP #$20                                                   ;83DE9B|C220    |      ;
    %CheckFlag(event1, $0008)
    BEQ .justReturn                                            ;83DEA4|F02C    |83DED2;
    REP #$20                                                   ;83DEA6|C220    |      ;
    %AIExecute($0015, $0000, $0025)
    SEP #$20                                                   ;83DEB5|E220    |      ;
    LDA.B #$45                                                 ;83DEB7|A945    |      ;
    STA.W nPlayerInteractionIndex                              ;83DEB9|8D6E09  |00096E;
    STZ.W nPlayerInteractionArg1                               ;83DEBC|9C6F09  |00096F;
    STZ.W nPlayerInteractionArg2                               ;83DEBF|9C7009  |000970;
    %SetPlayerFlag(!PFLAGS_INTERACTING)
    %SetPlayerAction(!PACTION_NONE)
 
.justReturn:
    RTS                                                        ;83DED2|60      |      ;
 
 
fAreaEvents_House:
    SEP #$20                                                   ;83DED3|E220    |      ;
    REP #$10                                                   ;83DED5|C210    |      ;
    LDA.L nCurrentYearID                                       ;83DED7|AF181F7F|7F1F18;
    CMP.B #$02                                                 ;83DEDB|C902    |      ;
    BNE +                                                      ;83DEDD|D013    |83DEF2;
    LDA.L nCurrentSeasonID                                     ;83DEDF|AF191F7F|7F1F19;
    CMP.B #!SEASON_SUMMER                                                 
    BNE +                                                      ;83DEE5|D00B    |83DEF2;
    LDA.L nCurrentDay                                          ;83DEE7|AF1B1F7F|7F1F1B;
    CMP.B #$1E                                                 ;83DEEB|C91E    |      ;
    BNE +                                                      ;83DEED|D003    |83DEF2;
    JMP.W fAreaInit_HouseHelper                                ;83DEEF|4CD8F4  |83F4D8;
 
 
  + REP #$30                                                   ;83DEF2|C230    |      ;
    %CheckFlag(event1, $0080)
    BEQ +                                                      ;83DEFB|F009    |83DF06;
    SEP #$20                                                   ;83DEFD|E220    |      ;
    LDA.B #!AREA_HOUSE3                                                 
    STA.W nDestinationAreaId                                   ;83DF01|8D8B09  |00098B;
    BRA .jump                                                  ;83DF04|8014    |83DF1A;
 
 
  + REP #$30                                                   ;83DF06|C230    |      ;
    %CheckFlag(event1, $0040)
    BEQ .jump                                                  ;83DF0F|F009    |83DF1A;
    SEP #$20                                                   ;83DF11|E220    |      ;
    LDA.B #!AREA_HOUSE2                                                 
    STA.W nDestinationAreaId                                   ;83DF15|8D8B09  |00098B;
    BRA .jump                                                  ;83DF18|8000    |83DF1A;
 
 
.jump:
    REP #$30                                                   ;83DF1A|C230    |      ;
    %CheckFlag(event5, $2000)
    BEQ +                                                      ;83DF23|F022    |83DF47;
    %CheckFlag(event5, $4000)
    BNE +                                                      ;83DF2C|D019    |83DF47;
    LDA.W #$009C                                               ;83DF2E|A99C00  |      ;
    STA.W nTileInFrontOfPlayerX                                ;83DF31|8D8509  |000985;
    LDA.W #$0090                                               ;83DF34|A99000  |      ;
    STA.W nTileInFrontOfPlayerY                                ;83DF37|8D8709  |000987;
    LDA.W #$0010                                               ;83DF3A|A91000  |      ;
    LDX.W #$0000                                               ;83DF3D|A20000  |      ;
    LDY.W #$001F                                               ;83DF40|A01F00  |      ;
    JSL.L fAI_Unknown8480F8                                    ;83DF43|22F88084|8480F8;
 
  + REP #$30                                                   ;83DF47|C230    |      ;
    %CheckFlag(event6, $0080)
    BNE .label1                                                ;83DF50|D003    |83DF55;
    JMP.W .label2                                              ;83DF52|4CF8DF  |83DFF8;
 
 
.label1:
    %UnsetFlag(event6, $0080)
    SEP #$20                                                   ;83DF60|E220    |      ;
    LDA.B #$19                                                 ;83DF62|A919    |      ;
    JSL.L fAudioUnknown_8382C6                                 ;83DF64|22C68283|8382C6;
    SEP #$20                                                   ;83DF68|E220    |      ;
    REP #$10                                                   ;83DF6A|C210    |      ;
    LDA.B #$02                                                 ;83DF6C|A902    |      ;
    LDX.W #$0240                                               ;83DF6E|A24002  |      ;
    LDY.W #$02C0                                               ;83DF71|A0C002  |      ;
    JSL.L fMap_UpdateFarmTilemapCoords                         ;83DF74|2249B082|82B049;
    SEP #$20                                                   ;83DF78|E220    |      ;
    REP #$10                                                   ;83DF7A|C210    |      ;
    LDA.B #$02                                                 ;83DF7C|A902    |      ;
    LDX.W #$0250                                               ;83DF7E|A25002  |      ;
    LDY.W #$02C0                                               ;83DF81|A0C002  |      ;
    JSL.L fMap_UpdateFarmTilemapCoords                         ;83DF84|2249B082|82B049;
    SEP #$20                                                   ;83DF88|E220    |      ;
    REP #$10                                                   ;83DF8A|C210    |      ;
    LDA.B #$02                                                 ;83DF8C|A902    |      ;
    LDX.W #$0260                                               ;83DF8E|A26002  |      ;
    LDY.W #$02C0                                               ;83DF91|A0C002  |      ;
    JSL.L fMap_UpdateFarmTilemapCoords                         ;83DF94|2249B082|82B049;
    SEP #$20                                                   ;83DF98|E220    |      ;
    REP #$10                                                   ;83DF9A|C210    |      ;
    LDA.B #$02                                                 ;83DF9C|A902    |      ;
    LDX.W #$0240                                               ;83DF9E|A24002  |      ;
    LDY.W #$02D0                                               ;83DFA1|A0D002  |      ;
    JSL.L fMap_UpdateFarmTilemapCoords                         ;83DFA4|2249B082|82B049;
    SEP #$20                                                   ;83DFA8|E220    |      ;
    REP #$10                                                   ;83DFAA|C210    |      ;
    LDA.B #$02                                                 ;83DFAC|A902    |      ;
    LDX.W #$0250                                               ;83DFAE|A25002  |      ;
    LDY.W #$02D0                                               ;83DFB1|A0D002  |      ;
    JSL.L fMap_UpdateFarmTilemapCoords                         ;83DFB4|2249B082|82B049;
    SEP #$20                                                   ;83DFB8|E220    |      ;
    REP #$10                                                   ;83DFBA|C210    |      ;
    LDA.B #$02                                                 ;83DFBC|A902    |      ;
    LDX.W #$0260                                               ;83DFBE|A26002  |      ;
    LDY.W #$02D0                                               ;83DFC1|A0D002  |      ;
    JSL.L fMap_UpdateFarmTilemapCoords                         ;83DFC4|2249B082|82B049;
    SEP #$20                                                   ;83DFC8|E220    |      ;
    REP #$10                                                   ;83DFCA|C210    |      ;
    LDA.B #$02                                                 ;83DFCC|A902    |      ;
    LDX.W #$0240                                               ;83DFCE|A24002  |      ;
    LDY.W #$02E0                                               ;83DFD1|A0E002  |      ;
    JSL.L fMap_UpdateFarmTilemapCoords                         ;83DFD4|2249B082|82B049;
    SEP #$20                                                   ;83DFD8|E220    |      ;
    REP #$10                                                   ;83DFDA|C210    |      ;
    LDA.B #$02                                                 ;83DFDC|A902    |      ;
    LDX.W #$0250                                               ;83DFDE|A25002  |      ;
    LDY.W #$02E0                                               ;83DFE1|A0E002  |      ;
    JSL.L fMap_UpdateFarmTilemapCoords                         ;83DFE4|2249B082|82B049;
    SEP #$20                                                   ;83DFE8|E220    |      ;
    REP #$10                                                   ;83DFEA|C210    |      ;
    LDA.B #$02                                                 ;83DFEC|A902    |      ;
    LDX.W #$0260                                               ;83DFEE|A26002  |      ;
    LDY.W #$02E0                                               ;83DFF1|A0E002  |      ;
    JSL.L fMap_UpdateFarmTilemapCoords                         ;83DFF4|2249B082|82B049;
 
.label2:
    REP #$30                                                   ;83DFF8|C230    |      ;
    %CheckFlag(event6, $0100)
    BEQ +                                                      ;83E001|F013    |83E016;
    %UnsetFlag(event6, $0100)
    SEP #$20                                                   ;83E00E|E220    |      ;
    LDA.B #$15                                                 ;83E010|A915    |      ;
    JSL.L fAudioUnknown_8382C6                                 ;83E012|22C68283|8382C6;
 
  + REP #$30                                                   ;83E016|C230    |      ;
    %CheckFlag(event6, $0200)
    BEQ +                                                      ;83E01F|F02B    |83E04C;
    %UnsetFlag(event6, $0200)
    SEP #$20                                                   ;83E02C|E220    |      ;
    REP #$10                                                   ;83E02E|C210    |      ;
    LDA.B #$22                                                 ;83E030|A922    |      ;
    LDX.W #$0007                                               ;83E032|A20700  |      ;
    LDY.W #$0014                                               ;83E035|A01400  |      ;
    JSL.L fAudioUnknown_8382FE                                 ;83E038|22FE8283|8382FE;
    SEP #$20                                                   ;83E03C|E220    |      ;
    REP #$10                                                   ;83E03E|C210    |      ;
    LDA.B #$22                                                 ;83E040|A922    |      ;
    LDX.W #$0007                                               ;83E042|A20700  |      ;
    LDY.W #$001E                                               ;83E045|A01E00  |      ;
    JSL.L fAudioUnknown_8382FE                                 ;83E048|22FE8283|8382FE;
 
  + REP #$30                                                   ;83E04C|C230    |      ;
    %CheckFlag(event6, $0020)
    BEQ +                                                      ;83E055|F01D    |83E074;
    SEP #$20                                                   ;83E057|E220    |      ;
    REP #$10                                                   ;83E059|C210    |      ;
    LDA.B #$20                                                 ;83E05B|A920    |      ;
    LDX.W #$0007                                               ;83E05D|A20700  |      ;
    LDY.W #$003C                                               ;83E060|A03C00  |      ;
    JSL.L fAudioUnknown_8382FE                                 ;83E063|22FE8283|8382FE;
    REP #$30                                                   ;83E067|C230    |      ;
    %UnsetFlag(event6, $0020)
 
  + REP #$30                                                   ;83E074|C230    |      ;
    %CheckFlag(event6, $0010)
    BEQ .label6                                                ;83E07D|F05C    |83E0DB;
    %CheckFlag(daily3, $4000)
    BNE .label5                                                ;83E086|D043    |83E0CB;
    %CheckFlag(daily3, $2000)
    BNE +                                                      ;83E08F|D010    |83E0A1;
    REP #$30                                                   ;83E091|C230    |      ;
    %AIExecute($0000, $001F, $0000)
    RTS                                                        ;83E0A0|60      |      ;
 
 
  + REP #$30                                                   ;83E0A1|C230    |      ;
    %AIExecute($0000, $001F, $0001)
    REP #$20                                                   ;83E0B0|C220    |      ;
    LDA.L nFirstChildAge                                       ;83E0B2|AF371F7F|7F1F37;
    CMP.W #$003C                                               ;83E0B6|C93C00  |      ;
    BNE +                                                      ;83E0B9|D008    |83E0C3;
    SEP #$20                                                   ;83E0BB|E220    |      ;
    LDA.B #$05                                                 ;83E0BD|A905    |      ;
    STA.W strcMenuData.nameDestinationIdx                      ;83E0BF|8D9F09  |00099F;
    RTS                                                        ;83E0C2|60      |      ;
 
 
  + SEP #$20                                                   ;83E0C3|E220    |      ;
    LDA.B #$06                                                 ;83E0C5|A906    |      ;
    STA.W strcMenuData.nameDestinationIdx                      ;83E0C7|8D9F09  |00099F;
    RTS                                                        ;83E0CA|60      |      ;
 
 
.label5:
    REP #$30                                                   ;83E0CB|C230    |      ;
    %AIExecute($0000, $001F, $0002)
    RTS                                                        ;83E0DA|60      |      ;
 
 
.label6:
    REP #$30                                                   ;83E0DB|C230    |      ;
    %CheckFlag(event6, $0040)
    BEQ .label7                                                ;83E0E4|F05E    |83E144;
    REP #$30                                                   ;83E0E6|C230    |      ;
    %UnsetFlag(event6, $0040)
    SEP #$20                                                   ;83E0F3|E220    |      ;
    LDA.B #$00                                                 ;83E0F5|A900    |      ;
    XBA                                                        ;83E0F7|EB      |      ;
    LDA.W strcStockData.unkCow                                 ;83E0F8|AD3709  |000937;
    REP #$20                                                   ;83E0FB|C220    |      ;
    JSL.L fGameEngine_GetCowData                               ;83E0FD|22A7C983|83C9A7;
    SEP #$20                                                   ;83E101|E220    |      ;
    REP #$10                                                   ;83E103|C210    |      ;
    LDA.B #$00                                                 ;83E105|A900    |      ;
    XBA                                                        ;83E107|EB      |      ;
    LDY.W #$000C                                               ;83E108|A00C00  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83E10B|B772    |000072;
    REP #$20                                                   ;83E10D|C220    |      ;
    STA.W strcNames.wCurrentCow                                ;83E10F|8D8908  |000889;
    SEP #$20                                                   ;83E112|E220    |      ;
    LDY.W #$000D                                               ;83E114|A00D00  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83E117|B772    |000072;
    REP #$20                                                   ;83E119|C220    |      ;
    STA.W strcNames.wCurrentCow+2                              ;83E11B|8D8B08  |00088B;
    SEP #$20                                                   ;83E11E|E220    |      ;
    LDY.W #$000E                                               ;83E120|A00E00  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83E123|B772    |000072;
    REP #$20                                                   ;83E125|C220    |      ;
    STA.W strcNames.wCurrentCow+4                              ;83E127|8D8D08  |00088D;
    SEP #$20                                                   ;83E12A|E220    |      ;
    LDY.W #$000F                                               ;83E12C|A00F00  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83E12F|B772    |000072;
    STA.W strcNames.wCurrentCow+6                              ;83E131|8D8F08  |00088F;
    REP #$30                                                   ;83E134|C230    |      ;
    %AIExecute($0000, $0020, $0000)
    RTS                                                        ;83E143|60      |      ;
 
 
.label7:
    REP #$30                                                   ;83E144|C230    |      ;
    %CheckFlag(event2, !EFLAGS2_MARRIEDMARIA)
    BNE .label8                                                ;83E14D|D027    |83E176;
    %CheckFlag(event2, !EFLAGS2_MARRIEDANN)
    BNE .label9                                                ;83E156|D02E    |83E186;
    %CheckFlag(event2, !EFLAGS2_MARRIEDNINA)
    BNE .label10                                               ;83E15F|D032    |83E193;
    %CheckFlag(event2, !EFLAGS2_MARRIEDELLEN)
    BNE .label11                                               ;83E168|D036    |83E1A0;
    %CheckFlag(event2, !EFLAGS2_MARRIEDEVE)
    BNE .label12                                               ;83E171|D03A    |83E1AD;
    JMP.W .label23                                             ;83E173|4CC6E2  |83E2C6;
 
 
.label8:
    REP #$30                                                   ;83E176|C230    |      ;
    LDA.L nLove_Maria                                          ;83E178|AF1F1F7F|7F1F1F;
    CMP.W #$00C8                                               ;83E17C|C9C800  |      ;
    BCC +                                                      ;83E17F|9003    |83E184;
    JMP.W .label14                                             ;83E181|4C10E2  |83E210;
 
 
  + BRA .label13                                               ;83E184|8034    |83E1BA;
 
 
.label9:
    REP #$30                                                   ;83E186|C230    |      ;
    LDA.L nLove_Ann                                            ;83E188|AF211F7F|7F1F21;
    CMP.W #$00C8                                               ;83E18C|C9C800  |      ;
    BCS .label14                                               ;83E18F|B07F    |83E210;
    BRA .label13                                               ;83E191|8027    |83E1BA;
 
 
.label10:
    REP #$30                                                   ;83E193|C230    |      ;
    LDA.L nLove_Nina                                           ;83E195|AF231F7F|7F1F23;
    CMP.W #$00C8                                               ;83E199|C9C800  |      ;
    BCS .label14                                               ;83E19C|B072    |83E210;
    BRA .label13                                               ;83E19E|801A    |83E1BA;
 
 
.label11:
    REP #$30                                                   ;83E1A0|C230    |      ;
    LDA.L nLove_Ellen                                          ;83E1A2|AF251F7F|7F1F25;
    CMP.W #$00C8                                               ;83E1A6|C9C800  |      ;
    BCS .label14                                               ;83E1A9|B065    |83E210;
    BRA .label13                                               ;83E1AB|800D    |83E1BA;
 
 
.label12:
    REP #$30                                                   ;83E1AD|C230    |      ;
    LDA.L nLove_Eve                                            ;83E1AF|AF271F7F|7F1F27;
    CMP.W #$00C8                                               ;83E1B3|C9C800  |      ;
    BCS .label14                                               ;83E1B6|B058    |83E210;
    BRA .label13                                               ;83E1B8|8000    |83E1BA;
 
 
.label13:
    SEP #$20                                                   ;83E1BA|E220    |      ;
    REP #$10                                                   ;83E1BC|C210    |      ;
    LDA.L nCurrentTimeID                                       ;83E1BE|AF1C1F7F|7F1F1C;
    CMP.B #$06                                                 ;83E1C2|C906    |      ;
    BNE .label14                                               ;83E1C4|D04A    |83E210;
    LDA.L nInGameHourCounter                                   ;83E1C6|AF1D1F7F|7F1F1D;
    BNE .label14                                               ;83E1CA|D044    |83E210;
    LDA.L nInGameMinuteCounter                                 ;83E1CC|AF1E1F7F|7F1F1E;
    BNE .label14                                               ;83E1D0|D03E    |83E210;
    REP #$20                                                   ;83E1D2|C220    |      ;
    %CheckFlag(event6, $000C)
    BNE .label14                                               ;83E1DB|D033    |83E210;
    %CheckFlag(event6, $0001)
    BNE .label14                                               ;83E1E4|D02A    |83E210;
    REP #$30                                                   ;83E1E6|C230    |      ;
    %AIExecute($0000, $0022, $0000)
    REP #$30                                                   ;83E1F5|C230    |      ;
    %SetFlag(event6, $0003)
    %SetFlag(daily3, $1000)
    JMP.W .label23                                             ;83E20D|4CC6E2  |83E2C6;
 
 
.label14:
    REP #$30                                                   ;83E210|C230    |      ;
    %UnsetFlag(daily3, $1000)
    %CheckFlag(event6, $0002)
    BNE .label17                                               ;83E224|D03C    |83E262;
    %CheckFlag(event2, !EFLAGS2_MARRIEDMARIA)
    BNE .label18                                               ;83E22D|D042    |83E271;
    %CheckFlag(event2, !EFLAGS2_MARRIEDANN)
    BEQ +                                                      ;83E236|F003    |83E23B;
    JMP.W .label19                                             ;83E238|4C82E2  |83E282;
 
 
  + %CheckFlag(event2, !EFLAGS2_MARRIEDNINA)
    BEQ .label15                                               ;83E242|F003    |83E247;
    JMP.W .label20                                             ;83E244|4C93E2  |83E293;
 
 
.label15:
    %CheckFlag(event2, !EFLAGS2_MARRIEDELLEN)
    BEQ .label16                                               ;83E24E|F003    |83E253;
    JMP.W .label21                                             ;83E250|4CA4E2  |83E2A4;
 
 
.label16:
    %CheckFlag(event2, !EFLAGS2_MARRIEDEVE)
    BEQ +                                                      ;83E25A|F003    |83E25F;
    JMP.W .label22                                             ;83E25C|4CB5E2  |83E2B5;
 
 
  + JMP.W .label23                                             ;83E25F|4CC6E2  |83E2C6;
 
 
.label17:
    REP #$30                                                   ;83E262|C230    |      ;
    %SetFlag(daily3, $1000)
    BRA .label23                                               ;83E26F|8055    |83E2C6;
 
 
.label18:
    REP #$30                                                   ;83E271|C230    |      ;
    %AIExecute($0013, $0043, $0000)
    BRA .label23                                               ;83E280|8044    |83E2C6;
 
 
.label19:
    REP #$30                                                   ;83E282|C230    |      ;
    %AIExecute($0013, $0043, $0001)
    BRA .label23                                               ;83E291|8033    |83E2C6;
 
 
.label20:
    REP #$30                                                   ;83E293|C230    |      ;
    %AIExecute($0013, $0043, $0002)
    BRA .label23                                               ;83E2A2|8022    |83E2C6;
 
 
.label21:
    REP #$30                                                   ;83E2A4|C230    |      ;
    %AIExecute($0013, $0043, $0003)
    BRA .label23                                               ;83E2B3|8011    |83E2C6;
 
 
.label22:
    REP #$30                                                   ;83E2B5|C230    |      ;
    %AIExecute($0013, $0043, $0004)
    BRA .label23                                               ;83E2C4|8000    |83E2C6;
 
 
.label23:
    REP #$30                                                   ;83E2C6|C230    |      ;
    %CheckFlag(event6, $0004)
    BEQ .label24                                               ;83E2CF|F018    |83E2E9;
    LDA.L nFirstChildAge                                       ;83E2D1|AF371F7F|7F1F37;
    CMP.W #$003C                                               ;83E2D5|C93C00  |      ;
    BCC .label24                                               ;83E2D8|900F    |83E2E9;
    REP #$30                                                   ;83E2DA|C230    |      ;
    %AIExecute($0014, $0045, $0000)
 
.label24:
    REP #$30                                                   ;83E2E9|C230    |      ;
    %CheckFlag(event6, $0008)
    BEQ .label25                                               ;83E2F2|F018    |83E30C;
    LDA.L nSecondChildAge                                      ;83E2F4|AF391F7F|7F1F39;
    CMP.W #$003C                                               ;83E2F8|C93C00  |      ;
    BCC .label25                                               ;83E2FB|900F    |83E30C;
    REP #$30                                                   ;83E2FD|C230    |      ;
    %AIExecute($0015, $0045, $0003)
 
.label25:
    REP #$30                                                   ;83E30C|C230    |      ;
    %CheckFlag(daily4, $0020)
    BNE .label26                                               ;83E315|D019    |83E330;
    %CheckFlag(event3, $0001)
    BNE .label27                                               ;83E31E|D020    |83E340;
    REP #$30                                                   ;83E320|C230    |      ;
    %AIExecute($0000, $000A, $0000)
    RTS                                                        ;83E32F|60      |      ;
 
 
.label26:
    REP #$30                                                   ;83E330|C230    |      ;
    %AIExecute($0000, $000A, $0003)
    RTS                                                        ;83E33F|60      |      ;
 
 
.label27:
    SEP #$20                                                   ;83E340|E220    |      ;
    REP #$10                                                   ;83E342|C210    |      ;
    LDA.L nCurrentYearID                                       ;83E344|AF181F7F|7F1F18;
    CMP.B #$01                                                 ;83E348|C901    |      ;
    BNE .label28                                               ;83E34A|D034    |83E380;
    LDA.L nCurrentSeasonID                                     ;83E34C|AF191F7F|7F1F19;
    CMP.B #$01                                                 ;83E350|C901    |      ;
    BNE .label28                                               ;83E352|D02C    |83E380;
    LDA.L nCurrentDay                                          ;83E354|AF1B1F7F|7F1F1B;
    CMP.B #$01                                                 ;83E358|C901    |      ;
    BNE .label28                                               ;83E35A|D024    |83E380;
    LDA.L nCurrentTimeID                                       ;83E35C|AF1C1F7F|7F1F1C;
    CMP.B #$06                                                 ;83E360|C906    |      ;
    BNE .label28                                               ;83E362|D01C    |83E380;
    LDA.L nInGameHourCounter                                   ;83E364|AF1D1F7F|7F1F1D;
    BNE .label28                                               ;83E368|D016    |83E380;
    LDA.L nInGameMinuteCounter                                 ;83E36A|AF1E1F7F|7F1F1E;
    BNE .label28                                               ;83E36E|D010    |83E380;
    REP #$30                                                   ;83E370|C230    |      ;
    %AIExecute($0000, $000A, $0004)
    RTS                                                        ;83E37F|60      |      ;
 
 
.label28:
    SEP #$20                                                   ;83E380|E220    |      ;
    REP #$10                                                   ;83E382|C210    |      ;
    LDA.L nCurrentYearID                                       ;83E384|AF181F7F|7F1F18;
    CMP.B #$02                                                 ;83E388|C902    |      ;
    BNE .label29                                               ;83E38A|D034    |83E3C0;
    LDA.L nCurrentSeasonID                                     ;83E38C|AF191F7F|7F1F19;
    CMP.B #$01                                                 ;83E390|C901    |      ;
    BNE .label29                                               ;83E392|D02C    |83E3C0;
    LDA.L nCurrentDay                                          ;83E394|AF1B1F7F|7F1F1B;
    CMP.B #$1D                                                 ;83E398|C91D    |      ;
    BNE .label29                                               ;83E39A|D024    |83E3C0;
    LDA.L nCurrentTimeID                                       ;83E39C|AF1C1F7F|7F1F1C;
    CMP.B #$06                                                 ;83E3A0|C906    |      ;
    BNE .label29                                               ;83E3A2|D01C    |83E3C0;
    LDA.L nInGameHourCounter                                   ;83E3A4|AF1D1F7F|7F1F1D;
    BNE .label29                                               ;83E3A8|D016    |83E3C0;
    LDA.L nInGameMinuteCounter                                 ;83E3AA|AF1E1F7F|7F1F1E;
    BNE .label29                                               ;83E3AE|D010    |83E3C0;
    REP #$30                                                   ;83E3B0|C230    |      ;
    %AIExecute($0000, $000A, $0005)
    RTS                                                        ;83E3BF|60      |      ;
 
 
.label29:
    SEP #$20                                                   ;83E3C0|E220    |      ;
    REP #$10                                                   ;83E3C2|C210    |      ;
    LDA.L nCurrentSeasonID                                     ;83E3C4|AF191F7F|7F1F19;
    BNE .label30                                               ;83E3C8|D018    |83E3E2;
    LDA.L nCurrentDay                                          ;83E3CA|AF1B1F7F|7F1F1B;
    CMP.B #$01                                                 ;83E3CE|C901    |      ;
    BNE .label30                                               ;83E3D0|D010    |83E3E2;
    REP #$30                                                   ;83E3D2|C230    |      ;
    %AIExecute($0000, $0028, $0000)
    RTS                                                        ;83E3E1|60      |      ;
 
 
.label30:
    SEP #$20                                                   ;83E3E2|E220    |      ;
    REP #$10                                                   ;83E3E4|C210    |      ;
    LDA.L nCurrentSeasonID                                     ;83E3E6|AF191F7F|7F1F19;
    CMP.B #$03                                                 ;83E3EA|C903    |      ;
    BNE .justReturn                                            ;83E3EC|D018    |83E406;
    LDA.L nCurrentDay                                          ;83E3EE|AF1B1F7F|7F1F1B;
    CMP.B #$18                                                 ;83E3F2|C918    |      ;
    BNE .justReturn                                            ;83E3F4|D010    |83E406;
    REP #$30                                                   ;83E3F6|C230    |      ;
    %AIExecute($0000, $000F, $0000)
    RTS                                                        ;83E405|60      |      ;
 
 
.justReturn:
    RTS                                                        ;83E406|60      |      ;
 
 
fAreaEvents_CrossRoad:
    REP #$30                                                   ;83E407|C230    |      ;
    %UnsetFlag(daily2, $0080)
    REP #$30                                                   ;83E414|C230    |      ;
    %AIExecute($0015, $0000, $0015)
    REP #$20                                                   ;83E423|C220    |      ;
    %CheckFlag(event3, $0001)
    BNE .horseEventCheck                                       ;83E42C|D036    |83E464;
    %CheckFlag(event3, $0010)
    BNE .houseExtensionCampain                                 ;83E435|D01D    |83E454;
    REP #$30                                                   ;83E437|C230    |      ;
    %AIExecute($0000, $000A, $0001)
    REP #$20                                                   ;83E446|C220    |      ;
    %SetFlag(event3, $0010)
    RTS                                                        ;83E453|60      |      ;
 
 
.houseExtensionCampain:
    REP #$30                                                   ;83E454|C230    |      ;
    %AIExecute($0000, $000B, $000B)
    RTS                                                        ;83E463|60      |      ;
 
 
.horseEventCheck:
    SEP #$20                                                   ;83E464|E220    |      ;
    REP #$10                                                   ;83E466|C210    |      ;
    LDA.L nCurrentYearID                                       ;83E468|AF181F7F|7F1F18;
    BNE .launchHorseEvent                                      ;83E46C|D00A    |83E478;
    SEP #$20                                                   ;83E46E|E220    |      ;
    LDA.L nCurrentSeasonID                                     ;83E470|AF191F7F|7F1F19;
    CMP.B #$03                                                 ;83E474|C903    |      ;
    BNE .justReturn                                            ;83E476|D052    |83E4CA;
 
.launchHorseEvent:
    REP #$20                                                   ;83E478|C220    |      ;
    %CheckFlag(event3, $0040)
    BNE .label2                                                ;83E481|D024    |83E4A7;
    REP #$30                                                   ;83E483|C230    |      ;
    %AIExecute($0000, $000D, $0000)
    REP #$20                                                   ;83E492|C220    |      ;
    %SetFlag(event3, $0040)
    SEP #$20                                                   ;83E49F|E220    |      ;
    LDA.B #$04                                                 ;83E4A1|A904    |      ;
    STA.W strcMenuData.nameDestinationIdx                      ;83E4A3|8D9F09  |00099F;
    RTS                                                        ;83E4A6|60      |      ;
 
 
.label2:
    REP #$30                                                   ;83E4A7|C230    |      ;
    %CheckFlag(event3, $0100)
    BNE .justReturn                                            ;83E4B0|D018    |83E4CA;
    REP #$30                                                   ;83E4B2|C230    |      ;
    %AIExecute($0000, $000D, $0001)
    SEP #$20                                                   ;83E4C1|E220    |      ;
    LDA.B #$00                                                 ;83E4C3|A900    |      ;
    STA.L nHorseAreaIdMaybe                                    ;83E4C5|8F311F7F|7F1F31;
    RTS                                                        ;83E4C9|60      |      ;
 
 
.justReturn:
    RTS                                                        ;83E4CA|60      |      ;
 
 
fAreaEvents_Mine:
    REP #$30                                                   ;83E4CB|C230    |      ;
    %CheckFlag(event4, $0040)
    BNE +                                                      ;83E4D4|D019    |83E4EF;
    LDA.W #$00E0                                               ;83E4D6|A9E000  |      ;
    STA.W nTileInFrontOfPlayerX                                ;83E4D9|8D8509  |000985;
    LDA.W #$0180                                               ;83E4DC|A98001  |      ;
    STA.W nTileInFrontOfPlayerY                                ;83E4DF|8D8709  |000987;
    LDA.W #$0010                                               ;83E4E2|A91000  |      ;
    LDX.W #$0000                                               ;83E4E5|A20000  |      ;
    LDY.W #$001F                                               ;83E4E8|A01F00  |      ;
    JSL.L fAI_Unknown8480F8                                    ;83E4EB|22F88084|8480F8;
 
  + REP #$30                                                   ;83E4EF|C230    |      ;
    LDA.B strcPlayer.posY                                      ;83E4F1|A5D8    |0000D8;
    CMP.W #$0200                                               ;83E4F3|C90002  |      ;
    BCC .label1                                                ;83E4F6|903D    |83E535;
    %CheckPlayerFlags(!PFLAGS_DOGHUGGING)
    BNE +                                                      ;83E4FF|D003    |83E504;
    JMP.W .label1                                              ;83E501|4C35E5  |83E535;
 
 
  + %UnsetPlayerFlag(!PFLAGS_DOGHUGGING)
    SEP #$20                                                   ;83E510|E220    |      ;
    LDA.L nCurrentSeasonID                                     ;83E512|AF191F7F|7F1F19;
    STA.L nDogAreaId                                           ;83E516|8F301F7F|7F1F30;
    REP #$30                                                   ;83E51A|C230    |      ;
    LDA.W #$0078                                               ;83E51C|A97800  |      ;
    STA.L nDogX                                                ;83E51F|8F2C1F7F|7F1F2C;
    LDA.W #$01A8                                               ;83E523|A9A801  |      ;
    STA.L nDogY                                                ;83E526|8F2E1F7F|7F1F2E;
    REP #$30                                                   ;83E52A|C230    |      ;
    LDA.W #$0000                                               ;83E52C|A90000  |      ;
    CLC                                                        ;83E52F|18      |      ;
    ADC.B strcPlayer.direction                                 ;83E530|65DA    |0000DA;
    STA.W strcObjectData.spriteIdx                             ;83E532|8D0109  |000901;
 
.label1:
    REP #$30                                                   ;83E535|C230    |      ;
    %CheckFlag(event5, $0010)
    BEQ +                                                      ;83E53E|F010    |83E550;
    REP #$30                                                   ;83E540|C230    |      ;
    %AIExecute($0000, $001D, $0002)
    RTS                                                        ;83E54F|60      |      ;
 
 
  + REP #$30                                                   ;83E550|C230    |      ;
    %CheckFlag(event5, $0001)
    BEQ +                                                      ;83E559|F010    |83E56B;
    REP #$30                                                   ;83E55B|C230    |      ;
    %AIExecute($0000, $001B, $0001)
    RTS                                                        ;83E56A|60      |      ;
 
 
  + SEP #$20                                                   ;83E56B|E220    |      ;
    LDA.L nCurrentWeekdayID                                    ;83E56D|AF1A1F7F|7F1F1A;
    CMP.B #!DAY_SATURDAY                                                 
    BNE .justReturn                                            ;83E573|D010    |83E585;
    REP #$30                                                   ;83E575|C230    |      ;
    %AIExecute($0000, $0002, $0004)
    RTS                                                        ;83E584|60      |      ;
 
 
.justReturn:
    RTS                                                        ;83E585|60      |      ;
 
 
fAreaEvents_MountainTop:
    REP #$30                                                   ;83E586|C230    |      ;
    %CheckFlag(event3, $0200)
    BEQ .justReturn                                            ;83E58F|F010    |83E5A1;
    REP #$30                                                   ;83E591|C230    |      ;
    %AIExecute($0000, $0014, $0001)
    RTS                                                        ;83E5A0|60      |      ;
 
 
.justReturn:
    RTS                                                        ;83E5A1|60      |      ;
 
 
fAreaEvents_GoldChicken:
    REP #$30                                                   ;83E5A2|C230    |      ;
    REP #$30                                                   ;83E5A4|C230    |      ;
    %AIExecute($0000, $0014, $0002)
    RTS                                                        ;83E5B3|60      |      ;
 
 
fAreaEvents_Coop:
    REP #$30                                                   ;83E5B4|C230    |      ;
    %CheckFlag(event4, $4000)
    BEQ .justReturn                                            ;83E5BD|F00D    |83E5CC;
    %AIExecute($0015, $0000, $007F)
 
.justReturn:
    RTS                                                        ;83E5CC|60      |      ;
 
 
fAreaEvents_Wedding:
    REP #$30                                                   ;83E5CD|C230    |      ;
    REP #$30                                                   ;83E5CF|C230    |      ;
    %AIExecute($0000, $001E, $0000)
    RTS                                                        ;83E5DE|60      |      ;
 
 
fAreaEvents_Festival1:
    REP #$30                                                   ;83E5DF|C230    |      ;
    REP #$30                                                   ;83E5E1|C230    |      ;
    %AIExecute($0000, $000E, $0001)
    RTS                                                        ;83E5F0|60      |      ;
 
 
fAreaEvents_Festival2:
    REP #$30                                                   ;83E5F1|C230    |      ;
    REP #$30                                                   ;83E5F3|C230    |      ;
    %AIExecute($0000, $0026, $0001)
    RTS                                                        ;83E602|60      |      ;
 
 
fAreaEvents_Festival3:
    SEP #$20                                                   ;83E603|E220    |      ;
    REP #$10                                                   ;83E605|C210    |      ;
    LDA.L nCurrentSeasonID                                     ;83E607|AF191F7F|7F1F19;
    CMP.B #$03                                                 ;83E60B|C903    |      ;
    BNE .justReturn                                            ;83E60D|D022    |83E631;
    LDA.L nCurrentDay                                          ;83E60F|AF1B1F7F|7F1F1B;
    CMP.B #$18                                                 ;83E613|C918    |      ;
    BNE .justReturn                                            ;83E615|D01A    |83E631;
    REP #$20                                                   ;83E617|C220    |      ;
    %CheckFlag(unknown1, $0001)
    BEQ .justReturn                                            ;83E620|F00F    |83E631;
    REP #$30                                                   ;83E622|C230    |      ;
    %AIExecute($0000, $000F, $0001)
 
.justReturn:
    RTS                                                        ;83E631|60      |      ;
 
 
fAreaEvents_SNF_MountainTop:
    SEP #$20                                                   ;83E632|E220    |      ;
    REP #$10                                                   ;83E634|C210    |      ;
    LDA.L nCurrentSeasonID                                     ;83E636|AF191F7F|7F1F19;
    CMP.B #$03                                                 ;83E63A|C903    |      ;
    BNE .justReturn                                            ;83E63C|D022    |83E660;
    LDA.L nCurrentDay                                          ;83E63E|AF1B1F7F|7F1F1B;
    CMP.B #$18                                                 ;83E642|C918    |      ;
    BNE .justReturn                                            ;83E644|D01A    |83E660;
    REP #$20                                                   ;83E646|C220    |      ;
    %CheckFlag(unknown1, $0008)
    BEQ .justReturn                                            ;83E64F|F00F    |83E660;
    REP #$30                                                   ;83E651|C230    |      ;
    %AIExecute($0000, $000F, $0004)
 
.justReturn:
    RTS                                                        ;83E660|60      |      ;
 
 
fAreaEvents_SNF_Spa:
    SEP #$20                                                   ;83E661|E220    |      ;
    REP #$10                                                   ;83E663|C210    |      ;
    LDA.L nCurrentSeasonID                                     ;83E665|AF191F7F|7F1F19;
    CMP.B #$03                                                 ;83E669|C903    |      ;
    BNE .justReturn                                            ;83E66B|D022    |83E68F;
    LDA.L nCurrentDay                                          ;83E66D|AF1B1F7F|7F1F1B;
    CMP.B #$18                                                 ;83E671|C918    |      ;
    BNE .justReturn                                            ;83E673|D01A    |83E68F;
    REP #$20                                                   ;83E675|C220    |      ;
    %CheckFlag(unknown1, $0010)
    BEQ .justReturn                                            ;83E67E|F00F    |83E68F;
    REP #$30                                                   ;83E680|C230    |      ;
    %AIExecute($0000, $000F, $0005)
 
.justReturn:
    RTS                                                        ;83E68F|60      |      ;
 
 
fAreaEvents_MountainTopUnknown:
    SEP #$20                                                   ;83E690|E220    |      ;
    REP #$10                                                   ;83E692|C210    |      ;
    LDA.L nCurrentSeasonID                                     ;83E694|AF191F7F|7F1F19;
    BNE .justReturn                                            ;83E698|D017    |83E6B1;
    LDA.L nCurrentDay                                          ;83E69A|AF1B1F7F|7F1F1B;
    CMP.B #$01                                                 ;83E69E|C901    |      ;
    BNE .justReturn                                            ;83E6A0|D00F    |83E6B1;
    REP #$30                                                   ;83E6A2|C230    |      ;
    %AIExecute($0000, $0028, $0001)
 
.justReturn:
    RTS                                                        ;83E6B1|60      |      ;
 
 
fAreaEvents_EggFestival:
    REP #$30                                                   ;83E6B2|C230    |      ;
    REP #$30                                                   ;83E6B4|C230    |      ;
    %AIExecute($0000, $0028, $0003)
    RTS                                                        ;83E6C3|60      |      ;
 
 
fAreaEvents_Shed:
    REP #$30                                                   ;83E6C4|C230    |      ;
    %CheckFlag(event6, $0002)
    BNE .label3                                                ;83E6CD|D036    |83E705;
    %CheckFlag(event2, !EFLAGS2_MARRIEDANN)
    BNE .label1                                                ;83E6D6|D00B    |83E6E3;
    %CheckFlag(event2, !EFLAGS2_MARRIEDEVE)
    BNE .label2                                                ;83E6DF|D013    |83E6F4;
    BRA .label3                                                ;83E6E1|8022    |83E705;
 
 
.label1:
    REP #$30                                                   ;83E6E3|C230    |      ;
    %AIExecute($0013, $0044, $0001)
    BRA .label3                                                ;83E6F2|8011    |83E705;
 
 
.label2:
    REP #$30                                                   ;83E6F4|C230    |      ;
    %AIExecute($0013, $0044, $0004)
    BRA .label3                                                ;83E703|8000    |83E705;
 
 
.label3:
    REP #$30                                                   ;83E705|C230    |      ;
    %CheckFlag(event6, $0004)
    BEQ +                                                      ;83E70E|F018    |83E728;
    LDA.L nFirstChildAge                                       ;83E710|AF371F7F|7F1F37;
    CMP.W #$003C                                               ;83E714|C93C00  |      ;
    BCC +                                                      ;83E717|900F    |83E728;
    REP #$30                                                   ;83E719|C230    |      ;
    %AIExecute($0014, $0045, $0002)
 
  + REP #$30                                                   ;83E728|C230    |      ;
    %CheckFlag(event6, $0008)
    BEQ .justReturn                                            ;83E731|F018    |83E74B;
    LDA.L nSecondChildAge                                      ;83E733|AF391F7F|7F1F39;
    CMP.W #$003C                                               ;83E737|C93C00  |      ;
    BCC .justReturn                                            ;83E73A|900F    |83E74B;
    REP #$30                                                   ;83E73C|C230    |      ;
    %AIExecute($0015, $0045, $0005)
 
.justReturn:
    RTS                                                        ;83E74B|60      |      ;
 
 
fAreaEvents_MountainTopBean:
    RTS                                                        ;83E74C|60      |      ;
 
 
aUnusedTable_83E74D:
    dw $0001,$0002,$0004,$0008,$0010,$0020                     ;83E74D|        |      ;
    dw $0040,$0080,$0100,$0200,$0400,$0800                     ;83E759|        |      ;
    dw $1000,$2000,$4000,$8000                                 ;83E765|        |      ;
 
fAreaEvents_Intro:
    SEP #$20                                                   ;83E76D|E220    |      ;
    REP #$10                                                   ;83E76F|C210    |      ;
    SEP #$20                                                   ;83E771|E220    |      ;
    LDA.B #$07                                                 ;83E773|A907    |      ;
    STA.L nCurrentTimeID                                       ;83E775|8F1C1F7F|7F1F1C;
    LDA.B #$00                                                 ;83E779|A900    |      ;
    STA.L nInGameHourCounter                                   ;83E77B|8F1D1F7F|7F1F1D;
    LDA.B #$00                                                 ;83E77F|A900    |      ;
    STA.L nInGameMinuteCounter                                 ;83E781|8F1E1F7F|7F1F1E;
    REP #$20                                                   ;83E785|C220    |      ;
    STZ.W strcObjectData.exist                                 ;83E787|9C1509  |000915;
    STZ.B strcPlayer.flags                                     ;83E78A|64D2    |0000D2;
    STZ.B strcPlayer.action                                    ;83E78C|64D4    |0000D4;
    SEP #$20                                                   ;83E78E|E220    |      ;
    LDA.W strcPlayerData.stamina                               ;83E790|AD1709  |000917;
    STA.W strcPlayerData.energy                                ;83E793|8D1809  |000918;
    STZ.W strcPlayerData.lastExcercise                         ;83E796|9C2509  |000925;
    %SetPlayerFlag(!PFLAGS_ACTIVE)
    %SetPlayerAction(!PACTION_NONE)
    %SetPlayerDirection(!PDIR_DOWN)
    %SetObjectDirection(!PDIR_DOWN)
    REP #$30                                                   ;83E7B8|C230    |      ;
    LDA.W #$0000                                               ;83E7BA|A90000  |      ;
    STA.W strcObjectData.spriteIdx                             ;83E7BD|8D0109  |000901;
    SEP #$20                                                   ;83E7C0|E220    |      ;
    STZ.W nTimeState                                           ;83E7C2|9C7309  |000973;
    SEP #$20                                                   ;83E7C5|E220    |      ;
    STZ.W strcPlayerData.carryItemId                           ;83E7C7|9C1D09  |00091D;
    %UnsetPlayerFlag(!PFLAGS_HOLDINGITEM)
    SEP #$20                                                   ;83E7D6|E220    |      ;
    LDA.L nIntroHowToPlayIndex2                                ;83E7D8|AF491F7F|7F1F49;
    BNE +                                                      ;83E7DC|D003    |83E7E1;
    JMP.W .howToPlay00                                         ;83E7DE|4CADE8  |83E8AD;
 
 
  + CMP.B #$01                                                 ;83E7E1|C901    |      ;
    BNE +                                                      ;83E7E3|D003    |83E7E8;
    JMP.W .howToPlay01                                         ;83E7E5|4CC5E8  |83E8C5;
 
 
  + CMP.B #$02                                                 ;83E7E8|C902    |      ;
    BNE +                                                      ;83E7EA|D003    |83E7EF;
    JMP.W .howToPlay02                                         ;83E7EC|4CDDE8  |83E8DD;
 
 
  + CMP.B #$03                                                 ;83E7EF|C903    |      ;
    BNE +                                                      ;83E7F1|D003    |83E7F6;
    JMP.W .howToPlay03                                         ;83E7F3|4CF5E8  |83E8F5;
 
 
  + CMP.B #$04                                                 ;83E7F6|C904    |      ;
    BNE +                                                      ;83E7F8|D003    |83E7FD;
    JMP.W .howToPlay04                                         ;83E7FA|4C0DE9  |83E90D;
 
 
  + CMP.B #$05                                                 ;83E7FD|C905    |      ;
    BNE +                                                      ;83E7FF|D003    |83E804;
    JMP.W .howToPlay05                                         ;83E801|4C25E9  |83E925;
 
 
  + CMP.B #$06                                                 ;83E804|C906    |      ;
    BNE +                                                      ;83E806|D003    |83E80B;
    JMP.W .howToPlay06                                         ;83E808|4C3DE9  |83E93D;
 
 
  + CMP.B #$07                                                 ;83E80B|C907    |      ;
    BNE +                                                      ;83E80D|D003    |83E812;
    JMP.W .howToPlay07                                         ;83E80F|4C55E9  |83E955;
 
 
  + CMP.B #$08                                                 ;83E812|C908    |      ;
    BNE +                                                      ;83E814|D003    |83E819;
    JMP.W .howToPlay08                                         ;83E816|4C8DE9  |83E98D;
 
 
  + CMP.B #$09                                                 ;83E819|C909    |      ;
    BNE +                                                      ;83E81B|D003    |83E820;
    JMP.W .howToPlay09                                         ;83E81D|4CA5E9  |83E9A5;
 
 
  + CMP.B #$0A                                                 ;83E820|C90A    |      ;
    BNE +                                                      ;83E822|D003    |83E827;
    JMP.W .howToPlay0A                                         ;83E824|4CBDE9  |83E9BD;
 
 
  + CMP.B #$0B                                                 ;83E827|C90B    |      ;
    BNE +                                                      ;83E829|D003    |83E82E;
    JMP.W .howToPlay0B                                         ;83E82B|4CD5E9  |83E9D5;
 
 
  + CMP.B #$0C                                                 ;83E82E|C90C    |      ;
    BNE +                                                      ;83E830|D003    |83E835;
    JMP.W .howToPlay0C                                         ;83E832|4CEDE9  |83E9ED;
 
 
  + CMP.B #$0D                                                 ;83E835|C90D    |      ;
    BNE +                                                      ;83E837|D003    |83E83C;
    JMP.W .howToPlay0D                                         ;83E839|4C05EA  |83EA05;
 
 
  + CMP.B #$0E                                                 ;83E83C|C90E    |      ;
    BNE +                                                      ;83E83E|D003    |83E843;
    JMP.W .howToPlay0E                                         ;83E840|4C3DEA  |83EA3D;
 
 
  + CMP.B #$0F                                                 ;83E843|C90F    |      ;
    BNE +                                                      ;83E845|D003    |83E84A;
    JMP.W .howToPlay0F                                         ;83E847|4C55EA  |83EA55;
 
 
  + CMP.B #$10                                                 ;83E84A|C910    |      ;
    BNE +                                                      ;83E84C|D003    |83E851;
    JMP.W .howToPlay10                                         ;83E84E|4C6DEA  |83EA6D;
 
 
  + CMP.B #$11                                                 ;83E851|C911    |      ;
    BNE +                                                      ;83E853|D003    |83E858;
    JMP.W .howToPlay11                                         ;83E855|4C85EA  |83EA85;
 
 
  + CMP.B #$12                                                 ;83E858|C912    |      ;
    BNE +                                                      ;83E85A|D003    |83E85F;
    JMP.W .howToPlay12                                         ;83E85C|4C9DEA  |83EA9D;
 
 
  + CMP.B #$13                                                 ;83E85F|C913    |      ;
    BNE +                                                      ;83E861|D003    |83E866;
    JMP.W .howToPlay13                                         ;83E863|4CB5EA  |83EAB5;
 
 
  + CMP.B #$14                                                 ;83E866|C914    |      ;
    BNE +                                                      ;83E868|D003    |83E86D;
    JMP.W .howToPlay14                                         ;83E86A|4CCDEA  |83EACD;
 
 
  + CMP.B #$15                                                 ;83E86D|C915    |      ;
    BNE +                                                      ;83E86F|D003    |83E874;
    JMP.W .howToPlay15                                         ;83E871|4CE5EA  |83EAE5;
 
 
  + CMP.B #$16                                                 ;83E874|C916    |      ;
    BNE +                                                      ;83E876|D003    |83E87B;
    JMP.W .howToPlay16                                         ;83E878|4CFDEA  |83EAFD;
 
 
  + CMP.B #$17                                                 ;83E87B|C917    |      ;
    BNE +                                                      ;83E87D|D003    |83E882;
    JMP.W .howToPlay17                                         ;83E87F|4C15EB  |83EB15;
 
 
  + CMP.B #$18                                                 ;83E882|C918    |      ;
    BNE +                                                      ;83E884|D003    |83E889;
    JMP.W .howToPlay18                                         ;83E886|4C2DEB  |83EB2D;
 
 
  + CMP.B #$19                                                 ;83E889|C919    |      ;
    BNE +                                                      ;83E88B|D003    |83E890;
    JMP.W .howToPlay19                                         ;83E88D|4C45EB  |83EB45;
 
 
  + CMP.B #$1A                                                 ;83E890|C91A    |      ;
    BNE +                                                      ;83E892|D003    |83E897;
    JMP.W .howToPlay1A                                         ;83E894|4C5DEB  |83EB5D;
 
 
  + CMP.B #$1B                                                 ;83E897|C91B    |      ;
    BNE +                                                      ;83E899|D003    |83E89E;
    JMP.W .howToPlay1B                                         ;83E89B|4C75EB  |83EB75;
 
 
  + CMP.B #$1C                                                 ;83E89E|C91C    |      ;
    BNE +                                                      ;83E8A0|D003    |83E8A5;
    JMP.W .howToPlay1C                                         ;83E8A2|4C8DEB  |83EB8D;
 
 
  + CMP.B #$1D                                                 ;83E8A5|C91D    |      ;
    BNE +                                                      ;83E8A7|D003    |83E8AC;
    JMP.W .howToPlay1D                                         ;83E8A9|4CA5EB  |83EBA5;
 
 
  + RTS                                                        ;83E8AC|60      |      ;
 
 
.howToPlay00:
    REP #$30                                                   ;83E8AD|C230    |      ;
    %AIExecute($0000, $0047, $0001)
    SEP #$20                                                   ;83E8BC|E220    |      ;
    LDA.B #$01                                                 ;83E8BE|A901    |      ;
    STA.L nIntroHowToPlayIndex2                                ;83E8C0|8F491F7F|7F1F49;
    RTS                                                        ;83E8C4|60      |      ;
 
 
.howToPlay01:
    REP #$30                                                   ;83E8C5|C230    |      ;
    %AIExecute($0000, $0047, $0002)
    SEP #$20                                                   ;83E8D4|E220    |      ;
    LDA.B #$02                                                 ;83E8D6|A902    |      ;
    STA.L nIntroHowToPlayIndex2                                ;83E8D8|8F491F7F|7F1F49;
    RTS                                                        ;83E8DC|60      |      ;
 
 
.howToPlay02:
    REP #$30                                                   ;83E8DD|C230    |      ;
    %AIExecute($0000, $0047, $0003)
    SEP #$20                                                   ;83E8EC|E220    |      ;
    LDA.B #$03                                                 ;83E8EE|A903    |      ;
    STA.L nIntroHowToPlayIndex2                                ;83E8F0|8F491F7F|7F1F49;
    RTS                                                        ;83E8F4|60      |      ;
 
 
.howToPlay03:
    REP #$30                                                   ;83E8F5|C230    |      ;
    %AIExecute($0000, $0047, $0004)
    SEP #$20                                                   ;83E904|E220    |      ;
    LDA.B #$04                                                 ;83E906|A904    |      ;
    STA.L nIntroHowToPlayIndex2                                ;83E908|8F491F7F|7F1F49;
    RTS                                                        ;83E90C|60      |      ;
 
 
.howToPlay04:
    REP #$30                                                   ;83E90D|C230    |      ;
    %AIExecute($0000, $0047, $0005)
    SEP #$20                                                   ;83E91C|E220    |      ;
    LDA.B #$05                                                 ;83E91E|A905    |      ;
    STA.L nIntroHowToPlayIndex2                                ;83E920|8F491F7F|7F1F49;
    RTS                                                        ;83E924|60      |      ;
 
 
.howToPlay05:
    REP #$30                                                   ;83E925|C230    |      ;
    %AIExecute($0000, $0047, $0006)
    SEP #$20                                                   ;83E934|E220    |      ;
    LDA.B #$06                                                 ;83E936|A906    |      ;
    STA.L nIntroHowToPlayIndex2                                ;83E938|8F491F7F|7F1F49;
    RTS                                                        ;83E93C|60      |      ;
 
 
.howToPlay06:
    REP #$30                                                   ;83E93D|C230    |      ;
    %AIExecute($0000, $0047, $0007)
    SEP #$20                                                   ;83E94C|E220    |      ;
    LDA.B #$07                                                 ;83E94E|A907    |      ;
    STA.L nIntroHowToPlayIndex2                                ;83E950|8F491F7F|7F1F49;
    RTS                                                        ;83E954|60      |      ;
 
 
.howToPlay07:
    SEP #$20                                                   ;83E955|E220    |      ;
    LDA.B #$3D                                                 ;83E957|A93D    |      ;
    STA.L strcShedItems.row1                                   ;83E959|8F001F7F|7F1F00;
    LDA.B #$00                                                 ;83E95D|A900    |      ;
    STA.L strcShedItems.row2                                   ;83E95F|8F011F7F|7F1F01;
    LDA.B #$12                                                 ;83E963|A912    |      ;
    STA.L strcShedItems.row3                                   ;83E965|8F021F7F|7F1F02;
    LDA.B #$00                                                 ;83E969|A900    |      ;
    STA.L strcShedItems.row4                                   ;83E96B|8F031F7F|7F1F03;
    STZ.W strcPlayerData.toolEquipped                          ;83E96F|9C2109  |000921;
    STZ.W strcPlayerData.toolSecond                            ;83E972|9C2309  |000923;
    REP #$30                                                   ;83E975|C230    |      ;
    %AIExecute($0000, $0047, $0008)
    SEP #$20                                                   ;83E984|E220    |      ;
    LDA.B #$08                                                 ;83E986|A908    |      ;
    STA.L nIntroHowToPlayIndex2                                ;83E988|8F491F7F|7F1F49;
    RTS                                                        ;83E98C|60      |      ;
 
 
.howToPlay08:
    REP #$30                                                   ;83E98D|C230    |      ;
    %AIExecute($0000, $0047, $0009)
    SEP #$20                                                   ;83E99C|E220    |      ;
    LDA.B #$09                                                 ;83E99E|A909    |      ;
    STA.L nIntroHowToPlayIndex2                                ;83E9A0|8F491F7F|7F1F49;
    RTS                                                        ;83E9A4|60      |      ;
 
 
.howToPlay09:
    REP #$30                                                   ;83E9A5|C230    |      ;
    %AIExecute($0000, $0047, $000A)
    SEP #$20                                                   ;83E9B4|E220    |      ;
    LDA.B #$0A                                                 ;83E9B6|A90A    |      ;
    STA.L nIntroHowToPlayIndex2                                ;83E9B8|8F491F7F|7F1F49;
    RTS                                                        ;83E9BC|60      |      ;
 
 
.howToPlay0A:
    REP #$30                                                   ;83E9BD|C230    |      ;
    %AIExecute($0000, $0047, $000B)
    SEP #$20                                                   ;83E9CC|E220    |      ;
    LDA.B #$0B                                                 ;83E9CE|A90B    |      ;
    STA.L nIntroHowToPlayIndex2                                ;83E9D0|8F491F7F|7F1F49;
    RTS                                                        ;83E9D4|60      |      ;
 
 
.howToPlay0B:
    REP #$30                                                   ;83E9D5|C230    |      ;
    %AIExecute($0000, $0047, $000C)
    SEP #$20                                                   ;83E9E4|E220    |      ;
    LDA.B #$0C                                                 ;83E9E6|A90C    |      ;
    STA.L nIntroHowToPlayIndex2                                ;83E9E8|8F491F7F|7F1F49;
    RTS                                                        ;83E9EC|60      |      ;
 
 
.howToPlay0C:
    REP #$30                                                   ;83E9ED|C230    |      ;
    %AIExecute($0000, $0047, $000D)
    SEP #$20                                                   ;83E9FC|E220    |      ;
    LDA.B #$0D                                                 ;83E9FE|A90D    |      ;
    STA.L nIntroHowToPlayIndex2                                ;83EA00|8F491F7F|7F1F49;
    RTS                                                        ;83EA04|60      |      ;
 
 
.howToPlay0D:
    SEP #$20                                                   ;83EA05|E220    |      ;
    LDA.B #$0D                                                 ;83EA07|A90D    |      ;
    STA.L strcShedItems.row1                                   ;83EA09|8F001F7F|7F1F00;
    LDA.B #$64                                                 ;83EA0D|A964    |      ;
    STA.L strcShedItems.row2                                   ;83EA0F|8F011F7F|7F1F01;
    LDA.B #$12                                                 ;83EA13|A912    |      ;
    STA.L strcShedItems.row3                                   ;83EA15|8F021F7F|7F1F02;
    LDA.B #$00                                                 ;83EA19|A900    |      ;
    STA.L strcShedItems.row4                                   ;83EA1B|8F031F7F|7F1F03;
    STZ.W strcPlayerData.toolEquipped                          ;83EA1F|9C2109  |000921;
    STZ.W strcPlayerData.toolSecond                            ;83EA22|9C2309  |000923;
    REP #$30                                                   ;83EA25|C230    |      ;
    %AIExecute($0000, $0047, $000E)
    SEP #$20                                                   ;83EA34|E220    |      ;
    LDA.B #$0E                                                 ;83EA36|A90E    |      ;
    STA.L nIntroHowToPlayIndex2                                ;83EA38|8F491F7F|7F1F49;
    RTS                                                        ;83EA3C|60      |      ;
 
 
.howToPlay0E:
    REP #$30                                                   ;83EA3D|C230    |      ;
    %AIExecute($0000, $0047, $000F)
    SEP #$20                                                   ;83EA4C|E220    |      ;
    LDA.B #$0F                                                 ;83EA4E|A90F    |      ;
    STA.L nIntroHowToPlayIndex2                                ;83EA50|8F491F7F|7F1F49;
    RTS                                                        ;83EA54|60      |      ;
 
 
.howToPlay0F:
    REP #$30                                                   ;83EA55|C230    |      ;
    %AIExecute($0000, $0047, $0010)
    SEP #$20                                                   ;83EA64|E220    |      ;
    LDA.B #$10                                                 ;83EA66|A910    |      ;
    STA.L nIntroHowToPlayIndex2                                ;83EA68|8F491F7F|7F1F49;
    RTS                                                        ;83EA6C|60      |      ;
 
 
.howToPlay10:
    REP #$30                                                   ;83EA6D|C230    |      ;
    %AIExecute($0000, $0047, $0011)
    SEP #$20                                                   ;83EA7C|E220    |      ;
    LDA.B #$11                                                 ;83EA7E|A911    |      ;
    STA.L nIntroHowToPlayIndex2                                ;83EA80|8F491F7F|7F1F49;
    RTS                                                        ;83EA84|60      |      ;
 
 
.howToPlay11:
    REP #$30                                                   ;83EA85|C230    |      ;
    %AIExecute($0000, $0047, $0012)
    SEP #$20                                                   ;83EA94|E220    |      ;
    LDA.B #$12                                                 ;83EA96|A912    |      ;
    STA.L nIntroHowToPlayIndex2                                ;83EA98|8F491F7F|7F1F49;
    RTS                                                        ;83EA9C|60      |      ;
 
 
.howToPlay12:
    REP #$30                                                   ;83EA9D|C230    |      ;
    %AIExecute($0000, $0047, $0013)
    SEP #$20                                                   ;83EAAC|E220    |      ;
    LDA.B #$13                                                 ;83EAAE|A913    |      ;
    STA.L nIntroHowToPlayIndex2                                ;83EAB0|8F491F7F|7F1F49;
    RTS                                                        ;83EAB4|60      |      ;
 
 
.howToPlay13:
    REP #$30                                                   ;83EAB5|C230    |      ;
    %AIExecute($0000, $0047, $0014)
    SEP #$20                                                   ;83EAC4|E220    |      ;
    LDA.B #$14                                                 ;83EAC6|A914    |      ;
    STA.L nIntroHowToPlayIndex2                                ;83EAC8|8F491F7F|7F1F49;
    RTS                                                        ;83EACC|60      |      ;
 
 
.howToPlay14:
    REP #$30                                                   ;83EACD|C230    |      ;
    %AIExecute($0000, $0047, $0015)
    SEP #$20                                                   ;83EADC|E220    |      ;
    LDA.B #$15                                                 ;83EADE|A915    |      ;
    STA.L nIntroHowToPlayIndex2                                ;83EAE0|8F491F7F|7F1F49;
    RTS                                                        ;83EAE4|60      |      ;
 
 
.howToPlay15:
    REP #$30                                                   ;83EAE5|C230    |      ;
    %AIExecute($0000, $0047, $0016)
    SEP #$20                                                   ;83EAF4|E220    |      ;
    LDA.B #$16                                                 ;83EAF6|A916    |      ;
    STA.L nIntroHowToPlayIndex2                                ;83EAF8|8F491F7F|7F1F49;
    RTS                                                        ;83EAFC|60      |      ;
 
 
.howToPlay16:
    REP #$30                                                   ;83EAFD|C230    |      ;
    %AIExecute($0000, $0047, $0017)
    SEP #$20                                                   ;83EB0C|E220    |      ;
    LDA.B #$17                                                 ;83EB0E|A917    |      ;
    STA.L nIntroHowToPlayIndex2                                ;83EB10|8F491F7F|7F1F49;
    RTS                                                        ;83EB14|60      |      ;
 
 
.howToPlay17:
    REP #$30                                                   ;83EB15|C230    |      ;
    %AIExecute($0000, $0047, $0018)
    SEP #$20                                                   ;83EB24|E220    |      ;
    LDA.B #$18                                                 ;83EB26|A918    |      ;
    STA.L nIntroHowToPlayIndex2                                ;83EB28|8F491F7F|7F1F49;
    RTS                                                        ;83EB2C|60      |      ;
 
 
.howToPlay18:
    REP #$30                                                   ;83EB2D|C230    |      ;
    %AIExecute($0000, $0047, $0019)
    SEP #$20                                                   ;83EB3C|E220    |      ;
    LDA.B #$19                                                 ;83EB3E|A919    |      ;
    STA.L nIntroHowToPlayIndex2                                ;83EB40|8F491F7F|7F1F49;
    RTS                                                        ;83EB44|60      |      ;
 
 
.howToPlay19:
    REP #$30                                                   ;83EB45|C230    |      ;
    %AIExecute($0000, $0047, $001A)
    SEP #$20                                                   ;83EB54|E220    |      ;
    LDA.B #$1A                                                 ;83EB56|A91A    |      ;
    STA.L nIntroHowToPlayIndex2                                ;83EB58|8F491F7F|7F1F49;
    RTS                                                        ;83EB5C|60      |      ;
 
 
.howToPlay1A:
    REP #$30                                                   ;83EB5D|C230    |      ;
    %AIExecute($0000, $0047, $001B)
    SEP #$20                                                   ;83EB6C|E220    |      ;
    LDA.B #$1B                                                 ;83EB6E|A91B    |      ;
    STA.L nIntroHowToPlayIndex2                                ;83EB70|8F491F7F|7F1F49;
    RTS                                                        ;83EB74|60      |      ;
 
 
.howToPlay1B:
    REP #$30                                                   ;83EB75|C230    |      ;
    %AIExecute($0000, $0047, $001C)
    SEP #$20                                                   ;83EB84|E220    |      ;
    LDA.B #$1C                                                 ;83EB86|A91C    |      ;
    STA.L nIntroHowToPlayIndex2                                ;83EB88|8F491F7F|7F1F49;
    RTS                                                        ;83EB8C|60      |      ;
 
 
.howToPlay1C:
    REP #$30                                                   ;83EB8D|C230    |      ;
    %AIExecute($0000, $0047, $001D)
    SEP #$20                                                   ;83EB9C|E220    |      ;
    LDA.B #$1D                                                 ;83EB9E|A91D    |      ;
    STA.L nIntroHowToPlayIndex2                                ;83EBA0|8F491F7F|7F1F49;
    RTS                                                        ;83EBA4|60      |      ;
 
 
.howToPlay1D:
    RTS                                                        ;83EBA5|60      |      ;
 
 
fAreaEvents_Endings:
    SEP #$20                                                   ;83EBA6|E220    |      ;
    REP #$10                                                   ;83EBA8|C210    |      ;
    SEP #$20                                                   ;83EBAA|E220    |      ;
    LDA.B #$06                                                 ;83EBAC|A906    |      ;
    STA.L nCurrentTimeID                                       ;83EBAE|8F1C1F7F|7F1F1C;
    LDA.B #$00                                                 ;83EBB2|A900    |      ;
    STA.L nInGameHourCounter                                   ;83EBB4|8F1D1F7F|7F1F1D;
    LDA.B #$00                                                 ;83EBB8|A900    |      ;
    STA.L nInGameMinuteCounter                                 ;83EBBA|8F1E1F7F|7F1F1E;
    REP #$20                                                   ;83EBBE|C220    |      ;
    STZ.W strcObjectData.exist                                 ;83EBC0|9C1509  |000915;
    STZ.B strcPlayer.flags                                     ;83EBC3|64D2    |0000D2;
    STZ.B strcPlayer.action                                    ;83EBC5|64D4    |0000D4;
    SEP #$20                                                   ;83EBC7|E220    |      ;
    LDA.W strcPlayerData.stamina                               ;83EBC9|AD1709  |000917;
    STA.W strcPlayerData.energy                                ;83EBCC|8D1809  |000918;
    STZ.W strcPlayerData.lastExcercise                         ;83EBCF|9C2509  |000925;
    %SetPlayerFlag(!PFLAGS_ACTIVE)
    %SetPlayerAction(!PACTION_NONE)
    %SetPlayerDirection(!PDIR_DOWN)
    %SetObjectDirection(!PDIR_DOWN)
    REP #$30                                                   ;83EBF1|C230    |      ;
    LDA.W #$0000                                               ;83EBF3|A90000  |      ;
    STA.W strcObjectData.spriteIdx                             ;83EBF6|8D0109  |000901;
    SEP #$20                                                   ;83EBF9|E220    |      ;
    STZ.W nTimeState                                           ;83EBFB|9C7309  |000973;
    SEP #$20                                                   ;83EBFE|E220    |      ;
    STZ.W strcPlayerData.carryItemId                           ;83EC00|9C1D09  |00091D;
    %UnsetPlayerFlag(!PFLAGS_HOLDINGITEM)
    SEP #$20                                                   ;83EC0F|E220    |      ;
    LDA.L nEndingStep                                          ;83EC11|AF471F7F|7F1F47;
    BNE +                                                      ;83EC15|D003    |83EC1A;
    JMP.W .ending00                                            ;83EC17|4C1EED  |83ED1E;
 
 
  + CMP.B #$01                                                 ;83EC1A|C901    |      ;
    BNE +                                                      ;83EC1C|D003    |83EC21;
    JMP.W .ending01                                            ;83EC1E|4C5AED  |83ED5A;
 
 
  + CMP.B #$02                                                 ;83EC21|C902    |      ;
    BNE +                                                      ;83EC23|D003    |83EC28;
    JMP.W .ending02                                            ;83EC25|4C8BED  |83ED8B;
 
 
  + CMP.B #$03                                                 ;83EC28|C903    |      ;
    BNE +                                                      ;83EC2A|D003    |83EC2F;
    JMP.W .ending03                                            ;83EC2C|4CB1ED  |83EDB1;
 
 
  + CMP.B #$04                                                 ;83EC2F|C904    |      ;
    BNE +                                                      ;83EC31|D003    |83EC36;
    JMP.W .ending04                                            ;83EC33|4CD3ED  |83EDD3;
 
 
  + CMP.B #$05                                                 ;83EC36|C905    |      ;
    BNE +                                                      ;83EC38|D003    |83EC3D;
    JMP.W .ending05                                            ;83EC3A|4CF6ED  |83EDF6;
 
 
  + CMP.B #$06                                                 ;83EC3D|C906    |      ;
    BNE +                                                      ;83EC3F|D003    |83EC44;
    JMP.W .ending06                                            ;83EC41|4C19EE  |83EE19;
 
 
  + CMP.B #$07                                                 ;83EC44|C907    |      ;
    BNE +                                                      ;83EC46|D003    |83EC4B;
    JMP.W .ending07                                            ;83EC48|4C3CEE  |83EE3C;
 
 
  + CMP.B #$08                                                 ;83EC4B|C908    |      ;
    BNE +                                                      ;83EC4D|D003    |83EC52;
    JMP.W .ending08                                            ;83EC4F|4C5FEE  |83EE5F;
 
 
  + CMP.B #$09                                                 ;83EC52|C909    |      ;
    BNE +                                                      ;83EC54|D003    |83EC59;
    JMP.W .ending09                                            ;83EC56|4C82EE  |83EE82;
 
 
  + CMP.B #$0A                                                 ;83EC59|C90A    |      ;
    BNE +                                                      ;83EC5B|D003    |83EC60;
    JMP.W .ending0A                                            ;83EC5D|4CAEEE  |83EEAE;
 
 
  + CMP.B #$0B                                                 ;83EC60|C90B    |      ;
    BNE +                                                      ;83EC62|D003    |83EC67;
    JMP.W .ending0B                                            ;83EC64|4CDAEE  |83EEDA;
 
 
  + CMP.B #$0C                                                 ;83EC67|C90C    |      ;
    BNE +                                                      ;83EC69|D003    |83EC6E;
    JMP.W .ending0C                                            ;83EC6B|4C15EF  |83EF15;
 
 
  + CMP.B #$0D                                                 ;83EC6E|C90D    |      ;
    BNE +                                                      ;83EC70|D003    |83EC75;
    JMP.W .ending0D                                            ;83EC72|4C50EF  |83EF50;
 
 
  + CMP.B #$0E                                                 ;83EC75|C90E    |      ;
    BNE +                                                      ;83EC77|D003    |83EC7C;
    JMP.W .ending0E                                            ;83EC79|4C8BEF  |83EF8B;
 
 
  + CMP.B #$0F                                                 ;83EC7C|C90F    |      ;
    BNE +                                                      ;83EC7E|D003    |83EC83;
    JMP.W .ending0F                                            ;83EC80|4CC6EF  |83EFC6;
 
 
  + CMP.B #$10                                                 ;83EC83|C910    |      ;
    BNE +                                                      ;83EC85|D003    |83EC8A;
    JMP.W .ending10                                            ;83EC87|4CE9EF  |83EFE9;
 
 
  + CMP.B #$11                                                 ;83EC8A|C911    |      ;
    BNE +                                                      ;83EC8C|D003    |83EC91;
    JMP.W .ending11                                            ;83EC8E|4C2FF0  |83F02F;
 
 
  + CMP.B #$12                                                 ;83EC91|C912    |      ;
    BNE +                                                      ;83EC93|D003    |83EC98;
    JMP.W .ending12                                            ;83EC95|4C52F0  |83F052;
 
 
  + CMP.B #$13                                                 ;83EC98|C913    |      ;
    BNE +                                                      ;83EC9A|D003    |83EC9F;
    JMP.W .ending13                                            ;83EC9C|4C75F0  |83F075;
 
 
  + CMP.B #$14                                                 ;83EC9F|C914    |      ;
    BNE +                                                      ;83ECA1|D003    |83ECA6;
    JMP.W .ending14                                            ;83ECA3|4CE3F0  |83F0E3;
 
 
  + CMP.B #$15                                                 ;83ECA6|C915    |      ;
    BNE +                                                      ;83ECA8|D003    |83ECAD;
    JMP.W .ending15                                            ;83ECAA|4C4BF1  |83F14B;
 
 
  + CMP.B #$16                                                 ;83ECAD|C916    |      ;
    BNE +                                                      ;83ECAF|D003    |83ECB4;
    JMP.W .ending16                                            ;83ECB1|4C63F1  |83F163;
 
 
  + CMP.B #$17                                                 ;83ECB4|C917    |      ;
    BNE +                                                      ;83ECB6|D003    |83ECBB;
    JMP.W .ending17                                            ;83ECB8|4C7BF1  |83F17B;
 
 
  + CMP.B #$18                                                 ;83ECBB|C918    |      ;
    BNE +                                                      ;83ECBD|D003    |83ECC2;
    JMP.W .ending18                                            ;83ECBF|4C93F1  |83F193;
 
 
  + CMP.B #$19                                                 ;83ECC2|C919    |      ;
    BNE +                                                      ;83ECC4|D003    |83ECC9;
    JMP.W .ending19                                            ;83ECC6|4CABF1  |83F1AB;
 
 
  + CMP.B #$1A                                                 ;83ECC9|C91A    |      ;
    BNE +                                                      ;83ECCB|D003    |83ECD0;
    JMP.W .ending1A                                            ;83ECCD|4CC3F1  |83F1C3;
 
 
  + CMP.B #$1B                                                 ;83ECD0|C91B    |      ;
    BNE +                                                      ;83ECD2|D003    |83ECD7;
    JMP.W .ending1B                                            ;83ECD4|4CDBF1  |83F1DB;
 
 
  + CMP.B #$1C                                                 ;83ECD7|C91C    |      ;
    BNE +                                                      ;83ECD9|D003    |83ECDE;
    JMP.W .ending1C                                            ;83ECDB|4C00F2  |83F200;
 
 
  + CMP.B #$1D                                                 ;83ECDE|C91D    |      ;
    BNE +                                                      ;83ECE0|D003    |83ECE5;
    JMP.W .ending1D                                            ;83ECE2|4C18F2  |83F218;
 
 
  + CMP.B #$1E                                                 ;83ECE5|C91E    |      ;
    BNE +                                                      ;83ECE7|D003    |83ECEC;
    JMP.W .ending1E                                            ;83ECE9|4C30F2  |83F230;
 
 
  + CMP.B #$1F                                                 ;83ECEC|C91F    |      ;
    BNE +                                                      ;83ECEE|D003    |83ECF3;
    JMP.W .ending1F                                            ;83ECF0|4C48F2  |83F248;
 
 
  + CMP.B #$20                                                 ;83ECF3|C920    |      ;
    BNE +                                                      ;83ECF5|D003    |83ECFA;
    JMP.W .ending20                                            ;83ECF7|4C6DF2  |83F26D;
 
 
  + CMP.B #$21                                                 ;83ECFA|C921    |      ;
    BNE +                                                      ;83ECFC|D003    |83ED01;
    JMP.W .ending21                                            ;83ECFE|4CFDEE  |83EEFD;
 
 
  + CMP.B #$22                                                 ;83ED01|C922    |      ;
    BNE +                                                      ;83ED03|D003    |83ED08;
    JMP.W .ending22                                            ;83ED05|4C38EF  |83EF38;
 
 
  + CMP.B #$23                                                 ;83ED08|C923    |      ;
    BNE +                                                      ;83ED0A|D003    |83ED0F;
    JMP.W .ending23                                            ;83ED0C|4C73EF  |83EF73;
 
 
  + CMP.B #$24                                                 ;83ED0F|C924    |      ;
    BNE +                                                      ;83ED11|D003    |83ED16;
    JMP.W .ending24                                            ;83ED13|4CAEEF  |83EFAE;
 
 
  + CMP.B #$25                                                 ;83ED16|C925    |      ;
    BNE +                                                      ;83ED18|D003    |83ED1D;
    JMP.W .justReturn                                          ;83ED1A|4CD7F4  |83F4D7;
 
 
  + RTS                                                        ;83ED1D|60      |      ;
 
 
.ending00:
    REP #$30                                                   ;83ED1E|C230    |      ;
    %CheckFlag(event2, !EFLAGS2_MARRIED)
    BNE .ending01                                              ;83ED27|D031    |83ED5A;
    LDA.L nPlayerHappiness                                     ;83ED29|AF331F7F|7F1F33;
    CMP.W #$0064                                               ;83ED2D|C96400  |      ;
    BCS .ending01                                              ;83ED30|B028    |83ED5A;
    SEP #$20                                                   ;83ED32|E220    |      ;
    LDA.L nOwnedCows                                           ;83ED34|AF0A1F7F|7F1F0A;
    BNE .ending01                                              ;83ED38|D020    |83ED5A;
    SEP #$20                                                   ;83ED3A|E220    |      ;
    LDA.L nOwnedChickens                                       ;83ED3C|AF0B1F7F|7F1F0B;
    BNE .ending01                                              ;83ED40|D018    |83ED5A;
    REP #$30                                                   ;83ED42|C230    |      ;
    %AIExecute($0000, $002F, $0000)
    SEP #$20                                                   ;83ED51|E220    |      ;
    LDA.B #$14                                                 ;83ED53|A914    |      ;
    STA.L nEndingStep                                          ;83ED55|8F471F7F|7F1F47;
    RTS                                                        ;83ED59|60      |      ;
 
 
.ending01:
    REP #$20                                                   ;83ED5A|C220    |      ;
    %SetFlag(daily3, $8000)
    SEP #$20                                                   ;83ED67|E220    |      ;
    REP #$10                                                   ;83ED69|C210    |      ;
    LDA.L nOwnedCows                                           ;83ED6B|AF0A1F7F|7F1F0A;
    CMP.B #$07                                                 ;83ED6F|C907    |      ;
    BCC .ending02                                              ;83ED71|9018    |83ED8B;
    REP #$30                                                   ;83ED73|C230    |      ;
    %AIExecute($0000, $0030, $0000)
    SEP #$20                                                   ;83ED82|E220    |      ;
    LDA.B #$02                                                 ;83ED84|A902    |      ;
    STA.L nEndingStep                                          ;83ED86|8F471F7F|7F1F47;
    RTS                                                        ;83ED8A|60      |      ;
 
 
.ending02:
    SEP #$20                                                   ;83ED8B|E220    |      ;
    REP #$10                                                   ;83ED8D|C210    |      ;
    LDA.L nOwnedCows                                           ;83ED8F|AF0A1F7F|7F1F0A;
    BEQ .ending03                                              ;83ED93|F01C    |83EDB1;
    CMP.B #$07                                                 ;83ED95|C907    |      ;
    BCS .ending03                                              ;83ED97|B018    |83EDB1;
    REP #$30                                                   ;83ED99|C230    |      ;
    %AIExecute($0000, $0031, $0000)
    SEP #$20                                                   ;83EDA8|E220    |      ;
    LDA.B #$03                                                 ;83EDAA|A903    |      ;
    STA.L nEndingStep                                          ;83EDAC|8F471F7F|7F1F47;
    RTS                                                        ;83EDB0|60      |      ;
 
 
.ending03:
    SEP #$20                                                   ;83EDB1|E220    |      ;
    REP #$10                                                   ;83EDB3|C210    |      ;
    LDA.L nOwnedChickens                                       ;83EDB5|AF0B1F7F|7F1F0B;
    BEQ .ending04                                              ;83EDB9|F018    |83EDD3;
    REP #$30                                                   ;83EDBB|C230    |      ;
    %AIExecute($0000, $0032, $0000)
    SEP #$20                                                   ;83EDCA|E220    |      ;
    LDA.B #$04                                                 ;83EDCC|A904    |      ;
    STA.L nEndingStep                                          ;83EDCE|8F471F7F|7F1F47;
    RTS                                                        ;83EDD2|60      |      ;
 
 
.ending04:
    SEP #$20                                                   ;83EDD3|E220    |      ;
    REP #$10                                                   ;83EDD5|C210    |      ;
    LDA.W $09B5                                                ;83EDD7|ADB509  |0009B5;
    CMP.B #$C0                                                 ;83EDDA|C9C0    |      ;
    BCC .ending05                                              ;83EDDC|9018    |83EDF6;
    REP #$30                                                   ;83EDDE|C230    |      ;
    %AIExecute($0000, $0033, $0000)
    SEP #$20                                                   ;83EDED|E220    |      ;
    LDA.B #$05                                                 ;83EDEF|A905    |      ;
    STA.L nEndingStep                                          ;83EDF1|8F471F7F|7F1F47;
    RTS                                                        ;83EDF5|60      |      ;
 
 
.ending05:
    REP #$30                                                   ;83EDF6|C230    |      ;
    LDA.L nStatShippedCorns                                    ;83EDF8|AF4A1F7F|7F1F4A;
    CMP.W #$00C8                                               ;83EDFC|C9C800  |      ;
    BCC .ending06                                              ;83EDFF|9018    |83EE19;
    REP #$30                                                   ;83EE01|C230    |      ;
    %AIExecute($0000, $0034, $0000)
    SEP #$20                                                   ;83EE10|E220    |      ;
    LDA.B #$06                                                 ;83EE12|A906    |      ;
    STA.L nEndingStep                                          ;83EE14|8F471F7F|7F1F47;
    RTS                                                        ;83EE18|60      |      ;
 
 
.ending06:
    REP #$30                                                   ;83EE19|C230    |      ;
    LDA.L nStatShippedTomatoes                                 ;83EE1B|AF4C1F7F|7F1F4C;
    CMP.W #$00C8                                               ;83EE1F|C9C800  |      ;
    BCC .ending07                                              ;83EE22|9018    |83EE3C;
    REP #$30                                                   ;83EE24|C230    |      ;
    %AIExecute($0000, $0035, $0000)
    SEP #$20                                                   ;83EE33|E220    |      ;
    LDA.B #$07                                                 ;83EE35|A907    |      ;
    STA.L nEndingStep                                          ;83EE37|8F471F7F|7F1F47;
    RTS                                                        ;83EE3B|60      |      ;
 
 
.ending07:
    REP #$30                                                   ;83EE3C|C230    |      ;
    LDA.L nStatShippedTurnips                                  ;83EE3E|AF4E1F7F|7F1F4E;
    CMP.W #$00C8                                               ;83EE42|C9C800  |      ;
    BCC .ending08                                              ;83EE45|9018    |83EE5F;
    REP #$30                                                   ;83EE47|C230    |      ;
    %AIExecute($0000, $0037, $0000)
    SEP #$20                                                   ;83EE56|E220    |      ;
    LDA.B #$08                                                 ;83EE58|A908    |      ;
    STA.L nEndingStep                                          ;83EE5A|8F471F7F|7F1F47;
    RTS                                                        ;83EE5E|60      |      ;
 
 
.ending08:
    REP #$30                                                   ;83EE5F|C230    |      ;
    LDA.L nStatShippedPotatoes                                 ;83EE61|AF501F7F|7F1F50;
    CMP.W #$00C8                                               ;83EE65|C9C800  |      ;
    BCC .ending09                                              ;83EE68|9018    |83EE82;
    REP #$30                                                   ;83EE6A|C230    |      ;
    %AIExecute($0000, $0036, $0000)
    SEP #$20                                                   ;83EE79|E220    |      ;
    LDA.B #$09                                                 ;83EE7B|A909    |      ;
    STA.L nEndingStep                                          ;83EE7D|8F471F7F|7F1F47;
    RTS                                                        ;83EE81|60      |      ;
 
 
.ending09:
    REP #$30                                                   ;83EE82|C230    |      ;
    %CheckFlag(event2, !EFLAGS2_MARRIED)
    BNE .ending0A                                              ;83EE8B|D021    |83EEAE;
    LDA.L nPlayerHappiness                                     ;83EE8D|AF331F7F|7F1F33;
    CMP.W #$0064                                               ;83EE91|C96400  |      ;
    BCC .ending0A                                              ;83EE94|9018    |83EEAE;
    REP #$30                                                   ;83EE96|C230    |      ;
    %AIExecute($0000, $0038, $0000)
    SEP #$20                                                   ;83EEA5|E220    |      ;
    LDA.B #$0A                                                 ;83EEA7|A90A    |      ;
    STA.L nEndingStep                                          ;83EEA9|8F471F7F|7F1F47;
    RTS                                                        ;83EEAD|60      |      ;
 
 
.ending0A:
    REP #$30                                                   ;83EEAE|C230    |      ;
    %CheckFlag(event2, !EFLAGS2_MARRIED)
    BNE .ending0B                                              ;83EEB7|D021    |83EEDA;
    LDA.L nPlayerHappiness                                     ;83EEB9|AF331F7F|7F1F33;
    CMP.W #$0320                                               ;83EEBD|C92003  |      ;
    BCC .ending0B                                              ;83EEC0|9018    |83EEDA;
    REP #$30                                                   ;83EEC2|C230    |      ;
    %AIExecute($0000, $0039, $0000)
    SEP #$20                                                   ;83EED1|E220    |      ;
    LDA.B #$0B                                                 ;83EED3|A90B    |      ;
    STA.L nEndingStep                                          ;83EED5|8F471F7F|7F1F47;
    RTS                                                        ;83EED9|60      |      ;
 
 
.ending0B:
    REP #$30                                                   ;83EEDA|C230    |      ;
    %CheckFlag(event2, !EFLAGS2_MARRIEDMARIA)
    BEQ .ending0C                                              ;83EEE3|F030    |83EF15;
    REP #$30                                                   ;83EEE5|C230    |      ;
    %AIExecute($0000, $003A, $0000)
    SEP #$20                                                   ;83EEF4|E220    |      ;
    LDA.B #$21                                                 ;83EEF6|A921    |      ;
    STA.L nEndingStep                                          ;83EEF8|8F471F7F|7F1F47;
    RTS                                                        ;83EEFC|60      |      ;
 
 
.ending21:
    REP #$30                                                   ;83EEFD|C230    |      ;
    %AIExecute($0000, $003A, $0001)
    SEP #$20                                                   ;83EF0C|E220    |      ;
    LDA.B #$0C                                                 ;83EF0E|A90C    |      ;
    STA.L nEndingStep                                          ;83EF10|8F471F7F|7F1F47;
    RTS                                                        ;83EF14|60      |      ;
 
 
.ending0C:
    REP #$30                                                   ;83EF15|C230    |      ;
    %CheckFlag(event2, !EFLAGS2_MARRIEDANN)
    BEQ .ending0D                                              ;83EF1E|F030    |83EF50;
    REP #$30                                                   ;83EF20|C230    |      ;
    %AIExecute($0000, $003B, $0000)
    SEP #$20                                                   ;83EF2F|E220    |      ;
    LDA.B #$22                                                 ;83EF31|A922    |      ;
    STA.L nEndingStep                                          ;83EF33|8F471F7F|7F1F47;
    RTS                                                        ;83EF37|60      |      ;
 
 
.ending22:
    REP #$30                                                   ;83EF38|C230    |      ;
    %AIExecute($0000, $003B, $0001)
    SEP #$20                                                   ;83EF47|E220    |      ;
    LDA.B #$0D                                                 ;83EF49|A90D    |      ;
    STA.L nEndingStep                                          ;83EF4B|8F471F7F|7F1F47;
    RTS                                                        ;83EF4F|60      |      ;
 
 
.ending0D:
    REP #$30                                                   ;83EF50|C230    |      ;
    %CheckFlag(event2, !EFLAGS2_MARRIEDNINA)
    BEQ .ending0E                                              ;83EF59|F030    |83EF8B;
    REP #$30                                                   ;83EF5B|C230    |      ;
    %AIExecute($0000, $003C, $0000)
    SEP #$20                                                   ;83EF6A|E220    |      ;
    LDA.B #$23                                                 ;83EF6C|A923    |      ;
    STA.L nEndingStep                                          ;83EF6E|8F471F7F|7F1F47;
    RTS                                                        ;83EF72|60      |      ;
 
 
.ending23:
    REP #$30                                                   ;83EF73|C230    |      ;
    %AIExecute($0000, $003C, $0001)
    SEP #$20                                                   ;83EF82|E220    |      ;
    LDA.B #$0E                                                 ;83EF84|A90E    |      ;
    STA.L nEndingStep                                          ;83EF86|8F471F7F|7F1F47;
    RTS                                                        ;83EF8A|60      |      ;
 
 
.ending0E:
    REP #$30                                                   ;83EF8B|C230    |      ;
    %CheckFlag(event2, !EFLAGS2_MARRIEDELLEN)
    BEQ .ending0F                                              ;83EF94|F030    |83EFC6;
    REP #$30                                                   ;83EF96|C230    |      ;
    %AIExecute($0000, $003D, $0000)
    SEP #$20                                                   ;83EFA5|E220    |      ;
    LDA.B #$24                                                 ;83EFA7|A924    |      ;
    STA.L nEndingStep                                          ;83EFA9|8F471F7F|7F1F47;
    RTS                                                        ;83EFAD|60      |      ;
 
 
.ending24:
    REP #$30                                                   ;83EFAE|C230    |      ;
    %AIExecute($0000, $003D, $0001)
    SEP #$20                                                   ;83EFBD|E220    |      ;
    LDA.B #$0F                                                 ;83EFBF|A90F    |      ;
    STA.L nEndingStep                                          ;83EFC1|8F471F7F|7F1F47;
    RTS                                                        ;83EFC5|60      |      ;
 
 
.ending0F:
    REP #$30                                                   ;83EFC6|C230    |      ;
    %CheckFlag(event2, !EFLAGS2_MARRIEDEVE)
    BEQ .ending10                                              ;83EFCF|F018    |83EFE9;
    REP #$30                                                   ;83EFD1|C230    |      ;
    %AIExecute($0000, $003E, $0000)
    SEP #$20                                                   ;83EFE0|E220    |      ;
    LDA.B #$10                                                 ;83EFE2|A910    |      ;
    STA.L nEndingStep                                          ;83EFE4|8F471F7F|7F1F47;
    RTS                                                        ;83EFE8|60      |      ;
 
 
.ending10:
    REP #$30                                                   ;83EFE9|C230    |      ;
    %CheckFlag(event2, !EFLAGS2_MARRIED)
    BNE .ending11                                              ;83EFF2|D03B    |83F02F;
    LDA.L nPlayerHappiness                                     ;83EFF4|AF331F7F|7F1F33;
    CMP.W #$00C8                                               ;83EFF8|C9C800  |      ;
    BCC .ending11                                              ;83EFFB|9032    |83F02F;
    LDA.L nLove_Maria                                          ;83EFFD|AF1F1F7F|7F1F1F;
    CLC                                                        ;83F001|18      |      ;
    ADC.L nLove_Ann                                            ;83F002|6F211F7F|7F1F21;
    ADC.L nLove_Nina                                           ;83F006|6F231F7F|7F1F23;
    ADC.L nLove_Ellen                                          ;83F00A|6F251F7F|7F1F25;
    ADC.L nLove_Eve                                            ;83F00E|6F271F7F|7F1F27;
    CMP.W #$05DC                                               ;83F012|C9DC05  |      ;
    BCC .ending11                                              ;83F015|9018    |83F02F;
    REP #$30                                                   ;83F017|C230    |      ;
    %AIExecute($0000, $003F, $0000)
    SEP #$20                                                   ;83F026|E220    |      ;
    LDA.B #$11                                                 ;83F028|A911    |      ;
    STA.L nEndingStep                                          ;83F02A|8F471F7F|7F1F47;
    RTS                                                        ;83F02E|60      |      ;
 
 
.ending11:
    REP #$30                                                   ;83F02F|C230    |      ;
    %CheckFlag(event6, $000C)
    BEQ .ending12                                              ;83F038|F018    |83F052;
    REP #$30                                                   ;83F03A|C230    |      ;
    %AIExecute($0000, $0040, $0000)
    SEP #$20                                                   ;83F049|E220    |      ;
    LDA.B #$12                                                 ;83F04B|A912    |      ;
    STA.L nEndingStep                                          ;83F04D|8F471F7F|7F1F47;
    RTS                                                        ;83F051|60      |      ;
 
 
.ending12:
    REP #$30                                                   ;83F052|C230    |      ;
    %CheckFlag(event6, $0008)
    BEQ .ending13                                              ;83F05B|F018    |83F075;
    REP #$30                                                   ;83F05D|C230    |      ;
    %AIExecute($0000, $0041, $0000)
    SEP #$20                                                   ;83F06C|E220    |      ;
    LDA.B #$13                                                 ;83F06E|A913    |      ;
    STA.L nEndingStep                                          ;83F070|8F471F7F|7F1F47;
    RTS                                                        ;83F074|60      |      ;
 
 
.ending13:
    REP #$30                                                   ;83F075|C230    |      ;
    %CheckFlag(event6, $0008)
    BEQ .ending14                                              ;83F07E|F063    |83F0E3;
    LDA.L nPlayerHappiness                                     ;83F080|AF331F7F|7F1F33;
    CMP.W #$0384                                               ;83F084|C98403  |      ;
    BCC .ending14                                              ;83F087|905A    |83F0E3;
    SEP #$20                                                   ;83F089|E220    |      ;
    LDA.L nOwnedCows                                           ;83F08B|AF0A1F7F|7F1F0A;
    BEQ .ending14                                              ;83F08F|F052    |83F0E3;
    LDA.L nOwnedChickens                                       ;83F091|AF0B1F7F|7F1F0B;
    BEQ .ending14                                              ;83F095|F04C    |83F0E3;
    LDA.L nPowerBerryEaten                                     ;83F097|AF361F7F|7F1F36;
    CMP.B #$0A                                                 ;83F09B|C90A    |      ;
    BNE .ending14                                              ;83F09D|D044    |83F0E3;
    REP #$20                                                   ;83F09F|C220    |      ;
    LDA.L nMoney                                               ;83F0A1|AF041F7F|7F1F04;
    CLC                                                        ;83F0A5|18      |      ;
    ADC.W #$FC18                                               ;83F0A6|6918FC  |      ;
    SEP #$20                                                   ;83F0A9|E220    |      ;
    LDA.L nMoney+2                                             ;83F0AB|AF061F7F|7F1F06;
    ADC.B #$FF                                                 ;83F0AF|69FF    |      ;
    BMI .ending14                                              ;83F0B1|3030    |83F0E3;
    REP #$20                                                   ;83F0B3|C220    |      ;
    LDA.L nDogHugs                                             ;83F0B5|AF521F7F|7F1F52;
    CMP.W #$0064                                               ;83F0B9|C96400  |      ;
    BCC .ending14                                              ;83F0BC|9025    |83F0E3;
    REP #$30                                                   ;83F0BE|C230    |      ;
    %AIExecute($0000, $0042, $0000)
    SEP #$20                                                   ;83F0CD|E220    |      ;
    LDA.B #$14                                                 ;83F0CF|A914    |      ;
    STA.L nEndingStep                                          ;83F0D1|8F471F7F|7F1F47;
    REP #$20                                                   ;83F0D5|C220    |      ;
    %UnsetFlag(daily3, $8000)
    RTS                                                        ;83F0E2|60      |      ;
 
 
.ending14:
    REP #$30                                                   ;83F0E3|C230    |      ;
    LDA.L nLove_Maria                                          ;83F0E5|AF1F1F7F|7F1F1F;
    STA.W $09B3                                                ;83F0E9|8DB309  |0009B3;
    CMP.L nLove_Ann                                            ;83F0EC|CF211F7F|7F1F21;
    BCS +                                                      ;83F0F0|B007    |83F0F9;
    LDA.L nLove_Ann                                            ;83F0F2|AF211F7F|7F1F21;
    STA.W $09B3                                                ;83F0F6|8DB309  |0009B3;
 
  + REP #$30                                                   ;83F0F9|C230    |      ;
    CMP.L nLove_Nina                                           ;83F0FB|CF231F7F|7F1F23;
    BCS +                                                      ;83F0FF|B007    |83F108;
    LDA.L nLove_Nina                                           ;83F101|AF231F7F|7F1F23;
    STA.W $09B3                                                ;83F105|8DB309  |0009B3;
 
  + REP #$30                                                   ;83F108|C230    |      ;
    CMP.L nLove_Ellen                                          ;83F10A|CF251F7F|7F1F25;
    BCS +                                                      ;83F10E|B007    |83F117;
    LDA.L nLove_Ellen                                          ;83F110|AF251F7F|7F1F25;
    STA.W $09B3                                                ;83F114|8DB309  |0009B3;
 
  + REP #$30                                                   ;83F117|C230    |      ;
    CMP.L nLove_Eve                                            ;83F119|CF271F7F|7F1F27;
    BCS +                                                      ;83F11D|B007    |83F126;
    LDA.L nLove_Eve                                            ;83F11F|AF271F7F|7F1F27;
    STA.W $09B3                                                ;83F123|8DB309  |0009B3;
 
  + REP #$30                                                   ;83F126|C230    |      ;
    %AIExecute($0000, $0046, $0000)
    SEP #$20                                                   ;83F135|E220    |      ;
    LDA.B #$15                                                 ;83F137|A915    |      ;
    STA.L nEndingStep                                          ;83F139|8F471F7F|7F1F47;
    REP #$20                                                   ;83F13D|C220    |      ;
    %SetFlag(daily3, $8000)
    RTS                                                        ;83F14A|60      |      ;
 
 
.ending15:
    REP #$30                                                   ;83F14B|C230    |      ;
    %AIExecute($0000, $0046, $0001)
    SEP #$20                                                   ;83F15A|E220    |      ;
    LDA.B #$16                                                 ;83F15C|A916    |      ;
    STA.L nEndingStep                                          ;83F15E|8F471F7F|7F1F47;
    RTS                                                        ;83F162|60      |      ;
 
 
.ending16:
    REP #$30                                                   ;83F163|C230    |      ;
    %AIExecute($0000, $0046, $0002)
    SEP #$20                                                   ;83F172|E220    |      ;
    LDA.B #$17                                                 ;83F174|A917    |      ;
    STA.L nEndingStep                                          ;83F176|8F471F7F|7F1F47;
    RTS                                                        ;83F17A|60      |      ;
 
 
.ending17:
    REP #$30                                                   ;83F17B|C230    |      ;
    %AIExecute($0000, $0046, $0003)
    SEP #$20                                                   ;83F18A|E220    |      ;
    LDA.B #$18                                                 ;83F18C|A918    |      ;
    STA.L nEndingStep                                          ;83F18E|8F471F7F|7F1F47;
    RTS                                                        ;83F192|60      |      ;
 
 
.ending18:
    REP #$30                                                   ;83F193|C230    |      ;
    %AIExecute($0000, $0046, $0004)
    SEP #$20                                                   ;83F1A2|E220    |      ;
    LDA.B #$19                                                 ;83F1A4|A919    |      ;
    STA.L nEndingStep                                          ;83F1A6|8F471F7F|7F1F47;
    RTS                                                        ;83F1AA|60      |      ;
 
 
.ending19:
    REP #$30                                                   ;83F1AB|C230    |      ;
    %AIExecute($0000, $0046, $0005)
    SEP #$20                                                   ;83F1BA|E220    |      ;
    LDA.B #$1A                                                 ;83F1BC|A91A    |      ;
    STA.L nEndingStep                                          ;83F1BE|8F471F7F|7F1F47;
    RTS                                                        ;83F1C2|60      |      ;
 
 
.ending1A:
    REP #$30                                                   ;83F1C3|C230    |      ;
    %AIExecute($0000, $0046, $0006)
    SEP #$20                                                   ;83F1D2|E220    |      ;
    LDA.B #$1B                                                 ;83F1D4|A91B    |      ;
    STA.L nEndingStep                                          ;83F1D6|8F471F7F|7F1F47;
    RTS                                                        ;83F1DA|60      |      ;
 
 
.ending1B:
    REP #$30                                                   ;83F1DB|C230    |      ;
    %AIExecute($0000, $0046, $0007)
    SEP #$20                                                   ;83F1EA|E220    |      ;
    LDA.B #$20                                                 ;83F1EC|A920    |      ;
    STA.L nEndingStep                                          ;83F1EE|8F471F7F|7F1F47;
    REP #$20                                                   ;83F1F2|C220    |      ;
    %UnsetFlag(daily3, $8000)
    RTS                                                        ;83F1FF|60      |      ;
 
 
.ending1C:
    REP #$30                                                   ;83F200|C230    |      ;
    %AIExecute($0000, $0046, $0008)
    SEP #$20                                                   ;83F20F|E220    |      ;
    LDA.B #$1D                                                 ;83F211|A91D    |      ;
    STA.L nEndingStep                                          ;83F213|8F471F7F|7F1F47;
    RTS                                                        ;83F217|60      |      ;
 
 
.ending1D:
    REP #$30                                                   ;83F218|C230    |      ;
    %AIExecute($0000, $0046, $0009)
    SEP #$20                                                   ;83F227|E220    |      ;
    LDA.B #$1E                                                 ;83F229|A91E    |      ;
    STA.L nEndingStep                                          ;83F22B|8F471F7F|7F1F47;
    RTS                                                        ;83F22F|60      |      ;
 
 
.ending1E:
    REP #$30                                                   ;83F230|C230    |      ;
    %AIExecute($0000, $0046, $000A)
    SEP #$20                                                   ;83F23F|E220    |      ;
    LDA.B #$1F                                                 ;83F241|A91F    |      ;
    STA.L nEndingStep                                          ;83F243|8F471F7F|7F1F47;
    RTS                                                        ;83F247|60      |      ;
 
 
.ending1F:
    REP #$30                                                   ;83F248|C230    |      ;
    %AIExecute($0000, $0046, $000B)
    SEP #$20                                                   ;83F257|E220    |      ;
    LDA.B #$20                                                 ;83F259|A920    |      ;
    STA.L nEndingStep                                          ;83F25B|8F471F7F|7F1F47;
    REP #$20                                                   ;83F25F|C220    |      ;
    %UnsetFlag(daily3, $8000)
    RTS                                                        ;83F26C|60      |      ;
 
 
.ending20:
    REP #$20                                                   ;83F26D|C220    |      ;
    LDA.W #$0000                                               ;83F26F|A90000  |      ;
    STA.L nRanchMasteringRate                                  ;83F272|8F541F7F|7F1F54;
    LDA.L nMoney                                               ;83F276|AF041F7F|7F1F04;
    LSR A                                                      ;83F27A|4A      |      ;
    LSR A                                                      ;83F27B|4A      |      ;
    LSR A                                                      ;83F27C|4A      |      ;
    LSR A                                                      ;83F27D|4A      |      ;
    LSR A                                                      ;83F27E|4A      |      ;
    LSR A                                                      ;83F27F|4A      |      ;
    LSR A                                                      ;83F280|4A      |      ;
    CMP.W #$004E                                               ;83F281|C94E00  |      ;
    BCC +                                                      ;83F284|9003    |83F289;
    LDA.W #$004E                                               ;83F286|A94E00  |      ;
 
  + STA.L nRanchMasteringRate                                  ;83F289|8F541F7F|7F1F54;
    SEP #$20                                                   ;83F28D|E220    |      ;
    LDA.B #$00                                                 ;83F28F|A900    |      ;
    XBA                                                        ;83F291|EB      |      ;
    LDA.L nOwnedCows                                           ;83F292|AF0A1F7F|7F1F0A;
    ASL A                                                      ;83F296|0A      |      ;
    CLC                                                        ;83F297|18      |      ;
    ADC.L nOwnedCows                                           ;83F298|6F0A1F7F|7F1F0A;
    REP #$20                                                   ;83F29C|C220    |      ;
    ADC.L nRanchMasteringRate                                  ;83F29E|6F541F7F|7F1F54;
    STA.L nRanchMasteringRate                                  ;83F2A2|8F541F7F|7F1F54;
    SEP #$20                                                   ;83F2A6|E220    |      ;
    LDA.B #$00                                                 ;83F2A8|A900    |      ;
    XBA                                                        ;83F2AA|EB      |      ;
    LDA.L nOwnedChickens                                       ;83F2AB|AF0B1F7F|7F1F0B;
    ASL A                                                      ;83F2AF|0A      |      ;
    CLC                                                        ;83F2B0|18      |      ;
    ADC.L nOwnedChickens                                       ;83F2B1|6F0B1F7F|7F1F0B;
    REP #$20                                                   ;83F2B5|C220    |      ;
    ADC.L nRanchMasteringRate                                  ;83F2B7|6F541F7F|7F1F54;
    STA.L nRanchMasteringRate                                  ;83F2BB|8F541F7F|7F1F54;
    SEP #$20                                                   ;83F2BF|E220    |      ;
    LDA.B #$00                                                 ;83F2C1|A900    |      ;
    XBA                                                        ;83F2C3|EB      |      ;
    LDA.W strcPlayerData.stamina                               ;83F2C4|AD1709  |000917;
    SEC                                                        ;83F2C7|38      |      ;
    SBC.B #$64                                                 ;83F2C8|E964    |      ;
    LSR A                                                      ;83F2CA|4A      |      ;
    REP #$20                                                   ;83F2CB|C220    |      ;
    CLC                                                        ;83F2CD|18      |      ;
    ADC.L nRanchMasteringRate                                  ;83F2CE|6F541F7F|7F1F54;
    STA.L nRanchMasteringRate                                  ;83F2D2|8F541F7F|7F1F54;
    REP #$20                                                   ;83F2D6|C220    |      ;
    LDA.L nLove_Maria                                          ;83F2D8|AF1F1F7F|7F1F1F;
    AND.W #$01FF                                               ;83F2DC|29FF01  |      ;
    LSR A                                                      ;83F2DF|4A      |      ;
    LSR A                                                      ;83F2E0|4A      |      ;
    LSR A                                                      ;83F2E1|4A      |      ;
    LSR A                                                      ;83F2E2|4A      |      ;
    CLC                                                        ;83F2E3|18      |      ;
    ADC.L nRanchMasteringRate                                  ;83F2E4|6F541F7F|7F1F54;
    STA.L nRanchMasteringRate                                  ;83F2E8|8F541F7F|7F1F54;
    REP #$20                                                   ;83F2EC|C220    |      ;
    LDA.L nLove_Ann                                            ;83F2EE|AF211F7F|7F1F21;
    AND.W #$01FF                                               ;83F2F2|29FF01  |      ;
    LSR A                                                      ;83F2F5|4A      |      ;
    LSR A                                                      ;83F2F6|4A      |      ;
    LSR A                                                      ;83F2F7|4A      |      ;
    LSR A                                                      ;83F2F8|4A      |      ;
    CLC                                                        ;83F2F9|18      |      ;
    ADC.L nRanchMasteringRate                                  ;83F2FA|6F541F7F|7F1F54;
    STA.L nRanchMasteringRate                                  ;83F2FE|8F541F7F|7F1F54;
    REP #$20                                                   ;83F302|C220    |      ;
    LDA.L nLove_Nina                                           ;83F304|AF231F7F|7F1F23;
    AND.W #$01FF                                               ;83F308|29FF01  |      ;
    LSR A                                                      ;83F30B|4A      |      ;
    LSR A                                                      ;83F30C|4A      |      ;
    LSR A                                                      ;83F30D|4A      |      ;
    LSR A                                                      ;83F30E|4A      |      ;
    CLC                                                        ;83F30F|18      |      ;
    ADC.L nRanchMasteringRate                                  ;83F310|6F541F7F|7F1F54;
    STA.L nRanchMasteringRate                                  ;83F314|8F541F7F|7F1F54;
    REP #$20                                                   ;83F318|C220    |      ;
    LDA.L nLove_Ellen                                          ;83F31A|AF251F7F|7F1F25;
    AND.W #$01FF                                               ;83F31E|29FF01  |      ;
    LSR A                                                      ;83F321|4A      |      ;
    LSR A                                                      ;83F322|4A      |      ;
    LSR A                                                      ;83F323|4A      |      ;
    LSR A                                                      ;83F324|4A      |      ;
    CLC                                                        ;83F325|18      |      ;
    ADC.L nRanchMasteringRate                                  ;83F326|6F541F7F|7F1F54;
    STA.L nRanchMasteringRate                                  ;83F32A|8F541F7F|7F1F54;
    REP #$20                                                   ;83F32E|C220    |      ;
    LDA.L nLove_Eve                                            ;83F330|AF271F7F|7F1F27;
    AND.W #$01FF                                               ;83F334|29FF01  |      ;
    LSR A                                                      ;83F337|4A      |      ;
    LSR A                                                      ;83F338|4A      |      ;
    LSR A                                                      ;83F339|4A      |      ;
    LSR A                                                      ;83F33A|4A      |      ;
    CLC                                                        ;83F33B|18      |      ;
    ADC.L nRanchMasteringRate                                  ;83F33C|6F541F7F|7F1F54;
    STA.L nRanchMasteringRate                                  ;83F340|8F541F7F|7F1F54;
    REP #$20                                                   ;83F344|C220    |      ;
    LDA.L nStatShippedTomatoes                                 ;83F346|AF4C1F7F|7F1F4C;
    AND.W #$01FF                                               ;83F34A|29FF01  |      ;
    LSR A                                                      ;83F34D|4A      |      ;
    LSR A                                                      ;83F34E|4A      |      ;
    LSR A                                                      ;83F34F|4A      |      ;
    LSR A                                                      ;83F350|4A      |      ;
    CLC                                                        ;83F351|18      |      ;
    ADC.L nRanchMasteringRate                                  ;83F352|6F541F7F|7F1F54;
    STA.L nRanchMasteringRate                                  ;83F356|8F541F7F|7F1F54;
    REP #$20                                                   ;83F35A|C220    |      ;
    LDA.L nStatShippedCorns                                    ;83F35C|AF4A1F7F|7F1F4A;
    AND.W #$01FF                                               ;83F360|29FF01  |      ;
    LSR A                                                      ;83F363|4A      |      ;
    LSR A                                                      ;83F364|4A      |      ;
    LSR A                                                      ;83F365|4A      |      ;
    LSR A                                                      ;83F366|4A      |      ;
    CLC                                                        ;83F367|18      |      ;
    ADC.L nRanchMasteringRate                                  ;83F368|6F541F7F|7F1F54;
    STA.L nRanchMasteringRate                                  ;83F36C|8F541F7F|7F1F54;
    REP #$20                                                   ;83F370|C220    |      ;
    LDA.L nStatShippedPotatoes                                 ;83F372|AF501F7F|7F1F50;
    AND.W #$01FF                                               ;83F376|29FF01  |      ;
    LSR A                                                      ;83F379|4A      |      ;
    LSR A                                                      ;83F37A|4A      |      ;
    LSR A                                                      ;83F37B|4A      |      ;
    LSR A                                                      ;83F37C|4A      |      ;
    CLC                                                        ;83F37D|18      |      ;
    ADC.L nRanchMasteringRate                                  ;83F37E|6F541F7F|7F1F54;
    STA.L nRanchMasteringRate                                  ;83F382|8F541F7F|7F1F54;
    REP #$20                                                   ;83F386|C220    |      ;
    LDA.L nStatShippedTurnips                                  ;83F388|AF4E1F7F|7F1F4E;
    AND.W #$01FF                                               ;83F38C|29FF01  |      ;
    LSR A                                                      ;83F38F|4A      |      ;
    LSR A                                                      ;83F390|4A      |      ;
    LSR A                                                      ;83F391|4A      |      ;
    LSR A                                                      ;83F392|4A      |      ;
    CLC                                                        ;83F393|18      |      ;
    ADC.L nRanchMasteringRate                                  ;83F394|6F541F7F|7F1F54;
    STA.L nRanchMasteringRate                                  ;83F398|8F541F7F|7F1F54;
    REP #$20                                                   ;83F39C|C220    |      ;
    LDA.L nPlayerHappiness                                     ;83F39E|AF331F7F|7F1F33;
    LSR A                                                      ;83F3A2|4A      |      ;
    LSR A                                                      ;83F3A3|4A      |      ;
    LSR A                                                      ;83F3A4|4A      |      ;
    LSR A                                                      ;83F3A5|4A      |      ;
    LSR A                                                      ;83F3A6|4A      |      ;
    CLC                                                        ;83F3A7|18      |      ;
    ADC.L nRanchMasteringRate                                  ;83F3A8|6F541F7F|7F1F54;
    STA.L nRanchMasteringRate                                  ;83F3AC|8F541F7F|7F1F54;
    REP #$20                                                   ;83F3B0|C220    |      ;
    %CheckFlag(event1, $0080)
    BEQ +                                                      ;83F3B9|F00C    |83F3C7;
    LDA.L nRanchMasteringRate                                  ;83F3BB|AF541F7F|7F1F54;
    CLC                                                        ;83F3BF|18      |      ;
    ADC.W #$0010                                               ;83F3C0|691000  |      ;
    STA.L nRanchMasteringRate                                  ;83F3C3|8F541F7F|7F1F54;
 
  + REP #$20                                                   ;83F3C7|C220    |      ;
    %CheckFlag(event1, $0040)
    BEQ +                                                      ;83F3D0|F00C    |83F3DE;
    LDA.L nRanchMasteringRate                                  ;83F3D2|AF541F7F|7F1F54;
    CLC                                                        ;83F3D6|18      |      ;
    ADC.W #$0010                                               ;83F3D7|691000  |      ;
    STA.L nRanchMasteringRate                                  ;83F3DA|8F541F7F|7F1F54;
 
  + REP #$20                                                   ;83F3DE|C220    |      ;
    %CheckFlag(event6, $0008)
    BEQ +                                                      ;83F3E7|F00C    |83F3F5;
    LDA.L nRanchMasteringRate                                  ;83F3E9|AF541F7F|7F1F54;
    CLC                                                        ;83F3ED|18      |      ;
    ADC.W #$0010                                               ;83F3EE|691000  |      ;
    STA.L nRanchMasteringRate                                  ;83F3F1|8F541F7F|7F1F54;
 
  + REP #$20                                                   ;83F3F5|C220    |      ;
    %CheckFlag(event6, $0004)
    BEQ +                                                      ;83F3FE|F00C    |83F40C;
    LDA.L nRanchMasteringRate                                  ;83F400|AF541F7F|7F1F54;
    CLC                                                        ;83F404|18      |      ;
    ADC.W #$0010                                               ;83F405|691000  |      ;
    STA.L nRanchMasteringRate                                  ;83F408|8F541F7F|7F1F54;
 
  + REP #$20                                                   ;83F40C|C220    |      ;
    %CheckFlag(event2, !EFLAGS2_MARRIED)
    BEQ +                                                      ;83F415|F00C    |83F423;
    LDA.L nRanchMasteringRate                                  ;83F417|AF541F7F|7F1F54;
    CLC                                                        ;83F41B|18      |      ;
    ADC.W #$0020                                               ;83F41C|692000  |      ;
    STA.L nRanchMasteringRate                                  ;83F41F|8F541F7F|7F1F54;
 
  + REP #$20                                                   ;83F423|C220    |      ;
    %CheckFlag(event6, $4000)
    BEQ +                                                      ;83F42C|F00C    |83F43A;
    LDA.L nRanchMasteringRate                                  ;83F42E|AF541F7F|7F1F54;
    CLC                                                        ;83F432|18      |      ;
    ADC.W #$0016                                               ;83F433|691600  |      ;
    STA.L nRanchMasteringRate                                  ;83F436|8F541F7F|7F1F54;
 
  + REP #$20                                                   ;83F43A|C220    |      ;
    %CheckFlag(event5, $1000)
    BEQ +                                                      ;83F443|F00C    |83F451;
    LDA.L nRanchMasteringRate                                  ;83F445|AF541F7F|7F1F54;
    CLC                                                        ;83F449|18      |      ;
    ADC.W #$0015                                               ;83F44A|691500  |      ;
    STA.L nRanchMasteringRate                                  ;83F44D|8F541F7F|7F1F54;
 
  + REP #$20                                                   ;83F451|C220    |      ;
    LDA.L nRanchDevelopmentRate                                ;83F453|AF561F7F|7F1F56;
    LSR A                                                      ;83F457|4A      |      ;
    CLC                                                        ;83F458|18      |      ;
    ADC.L nRanchMasteringRate                                  ;83F459|6F541F7F|7F1F54;
    STA.L nRanchMasteringRate                                  ;83F45D|8F541F7F|7F1F54;
    REP #$20                                                   ;83F461|C220    |      ;
    LDX.W #$0000                                               ;83F463|A20000  |      ;
 
  - REP #$30                                                   ;83F466|C230    |      ;
    PHX                                                        ;83F468|DA      |      ;
    TXA                                                        ;83F469|8A      |      ;
    JSL.L fGameEngine_GetCowData                               ;83F46A|22A7C983|83C9A7;
    SEP #$20                                                   ;83F46E|E220    |      ;
    REP #$10                                                   ;83F470|C210    |      ;
    LDY.W #$0000                                               ;83F472|A00000  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83F475|B772    |000072;
    AND.B #$01                                                 ;83F477|2901    |      ;
    BEQ ++                                                     ;83F479|F01C    |83F497;
    LDY.W #$0004                                               ;83F47B|A00400  |      ;
    LDA.B #$00                                                 ;83F47E|A900    |      ;
    XBA                                                        ;83F480|EB      |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83F481|B772    |000072;
    LSR A                                                      ;83F483|4A      |      ;
    LSR A                                                      ;83F484|4A      |      ;
    LSR A                                                      ;83F485|4A      |      ;
    CMP.B #$19                                                 ;83F486|C919    |      ;
    BCC +                                                      ;83F488|9002    |83F48C;
    LDA.B #$19                                                 ;83F48A|A919    |      ;
 
  + REP #$20                                                   ;83F48C|C220    |      ;
    CLC                                                        ;83F48E|18      |      ;
    ADC.L nRanchMasteringRate                                  ;83F48F|6F541F7F|7F1F54;
    STA.L nRanchMasteringRate                                  ;83F493|8F541F7F|7F1F54;
 
 ++ REP #$30                                                   ;83F497|C230    |      ;
    PLX                                                        ;83F499|FA      |      ;
    INX                                                        ;83F49A|E8      |      ;
    CPX.W #$000C                                               ;83F49B|E00C00  |      ;
    BNE -                                                      ;83F49E|D0C6    |83F466;
    REP #$20                                                   ;83F4A0|C220    |      ;
    LDA.L nRanchMasteringRate                                  ;83F4A2|AF541F7F|7F1F54;
    CMP.W #$03E7                                               ;83F4A6|C9E703  |      ;
    BCC +                                                      ;83F4A9|9007    |83F4B2;
    LDA.W #$03E7                                               ;83F4AB|A9E703  |      ;
    STA.L nRanchMasteringRate                                  ;83F4AE|8F541F7F|7F1F54;
 
  + REP #$30                                                   ;83F4B2|C230    |      ;
    %AIExecute($0000, $0046, $000C)
    SEP #$20                                                   ;83F4C1|E220    |      ;
    LDA.B #$25                                                 ;83F4C3|A925    |      ;
    STA.L nEndingStep                                          ;83F4C5|8F471F7F|7F1F47;
    REP #$20                                                   ;83F4C9|C220    |      ;
    %SetFlag(daily3, $8000)
    RTS                                                        ;83F4D6|60      |      ;
 
 
.justReturn:
    RTS                                                        ;83F4D7|60      |      ;
 
 
fAreaInit_HouseHelper:
    REP #$30                                                   ;83F4D8|C230    |      ;
    %AIExecute($0000, $002E, $0000)
    REP #$30                                                   ;83F4E7|C230    |      ;
    STZ.W strcDialogDisplay.mapFlags                           ;83F4E9|9C9601  |000196;
    %SetFlag(daily3, $0002)
    SEP #$20                                                   ;83F4F7|E220    |      ;
    LDA.B #$00                                                 ;83F4F9|A900    |      ;
    STA.L nEndingStep                                          ;83F4FB|8F471F7F|7F1F47;
    SEP #$20                                                   ;83F4FF|E220    |      ;
    REP #$10                                                   ;83F501|C210    |      ;
    STZ.W $09B5                                                ;83F503|9CB509  |0009B5;
    REP #$20                                                   ;83F506|C220    |      ;
    LDA.W #!DIALOG_SPACE                                               
    STA.W strcNames.wCurrentCow                                ;83F50B|8D8908  |000889;
    STA.W strcNames.wCurrentCow+2                              ;83F50E|8D8B08  |00088B;
    STA.W strcNames.wCurrentCow+4                              ;83F511|8D8D08  |00088D;
    STA.W strcNames.wCurrentCow+6                              ;83F514|8D8F08  |00088F;
    LDX.W #$0000                                               ;83F517|A20000  |      ;
 
  - REP #$30                                                   ;83F51A|C230    |      ;
    PHX                                                        ;83F51C|DA      |      ;
    TXA                                                        ;83F51D|8A      |      ;
    JSL.L fGameEngine_GetCowData                               ;83F51E|22A7C983|83C9A7;
    SEP #$20                                                   ;83F522|E220    |      ;
    REP #$10                                                   ;83F524|C210    |      ;
    LDY.W #$0000                                               ;83F526|A00000  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83F529|B772    |000072;
    AND.B #$01                                                 ;83F52B|2901    |      ;
    BEQ .label2                                                ;83F52D|F044    |83F573;
    LDY.W #$0004                                               ;83F52F|A00400  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83F532|B772    |000072;
    CMP.W $09B5                                                ;83F534|CDB509  |0009B5;
    BCS .label1                                                ;83F537|B002    |83F53B;
    BRA .label2                                                ;83F539|8038    |83F573;
 
 
.label1:
    SEP #$20                                                   ;83F53B|E220    |      ;
    STA.W $09B5                                                ;83F53D|8DB509  |0009B5;
    SEP #$20                                                   ;83F540|E220    |      ;
    LDA.B #$00                                                 ;83F542|A900    |      ;
    XBA                                                        ;83F544|EB      |      ;
    LDY.W #$000C                                               ;83F545|A00C00  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83F548|B772    |000072;
    REP #$20                                                   ;83F54A|C220    |      ;
    STA.W strcNames.wCurrentCow                                ;83F54C|8D8908  |000889;
    SEP #$20                                                   ;83F54F|E220    |      ;
    LDY.W #$000D                                               ;83F551|A00D00  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83F554|B772    |000072;
    REP #$20                                                   ;83F556|C220    |      ;
    STA.W strcNames.wCurrentCow+2                              ;83F558|8D8B08  |00088B;
    SEP #$20                                                   ;83F55B|E220    |      ;
    LDY.W #$000E                                               ;83F55D|A00E00  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83F560|B772    |000072;
    REP #$20                                                   ;83F562|C220    |      ;
    STA.W strcNames.wCurrentCow+4                              ;83F564|8D8D08  |00088D;
    SEP #$20                                                   ;83F567|E220    |      ;
    LDY.W #$000F                                               ;83F569|A00F00  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83F56C|B772    |000072;
    REP #$20                                                   ;83F56E|C220    |      ;
    STA.W strcNames.wCurrentCow+6                              ;83F570|8D8F08  |00088F;
 
.label2:
    REP #$30                                                   ;83F573|C230    |      ;
    PLX                                                        ;83F575|FA      |      ;
    INX                                                        ;83F576|E8      |      ;
    CPX.W #$000C                                               ;83F577|E00C00  |      ;
    BNE -                                                      ;83F57A|D09E    |83F51A;
    JSL.L fObjectMap_CalculateRanchDev                         ;83F57C|220CAA82|82AA0C;
    REP #$30                                                   ;83F580|C230    |      ;
    LDA.L nRanchDevelopmentRate                                ;83F582|AF561F7F|7F1F56;
    STA.B strcVariables.n16Temp1                               ;83F586|857E    |00007E;
    LDA.W #$000A                                               ;83F588|A90A00  |      ;
    JSL.L fMathMultiply_7EbyA                                  ;83F58B|22008083|838000;
    REP #$30                                                   ;83F58F|C230    |      ;
    STA.B strcVariables.n16Temp1                               ;83F591|857E    |00007E;
    LDA.W #$0127                                               ;83F593|A92701  |      ;
    STA.B strcVariables.n16Temp2                               ;83F596|8580    |000080;
    JSL.L fMathDivide                                          ;83F598|22828083|838082;
    REP #$30                                                   ;83F59C|C230    |      ;
    STA.L nRanchDevelopmentRate                                ;83F59E|8F561F7F|7F1F56;
    CMP.W #$0064                                               ;83F5A2|C96400  |      ;
    BCC .justReturn                                            ;83F5A5|9007    |83F5AE;
    LDA.W #$0064                                               ;83F5A7|A96400  |      ;
    STA.L nRanchDevelopmentRate                                ;83F5AA|8F561F7F|7F1F56;
 
.justReturn:
    RTS                                                        ;83F5AE|60      |      ;
 
 
    pad $83FFFF
