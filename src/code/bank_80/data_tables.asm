; Bank $80 module "data_tables" - starts at $80B9D7
 
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
