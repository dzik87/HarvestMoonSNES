 
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
    BCS .software_divide                                                ;8380EE|B026    |838116;
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
 
 
.software_divide:
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