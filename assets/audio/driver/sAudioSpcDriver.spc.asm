; Harvest Moon (SNES) SPC700 sound driver, N-SPC family, loaded to SPC RAM $0500 by the boot upload (4054 bytes).
; Assembled by tools/audio/spcasm.py (syntax = tools/audio/spc700.py listing syntax + labels). Analysis: docs/audio.md.
; Tables: command jump table $1053 (13 words), stream command handlers $13E0 (27 words), parameter counts $141E,
;         pitch table $143D, pan table $1457, FIR sets $146C, gate/velocity tables $14A0/$14A8, slot ids $14B8.

    ORG $0500

c_0500:
    CLRP
    MOV X,#$CF
    MOV SP,X
    MOV A,#$30
    MOV !$00F1,A
    CALL !c_0F7D

c_050C:
    MOV Y,#$0A

c_050E:
    CMP Y,#$05
    BEQ c_0519
    BCS c_051C
    CMP $88,$89
    BNE c_052A

c_0519:
    BBS $88.7,c_052A

c_051C:
    MOV A,!d_148B+Y
    MOV !$00F2,A
    MOV A,!d_1495+Y
    MOV X,A
    MOV A,(X)
    MOV !$00F3,A

c_052A:
    DBNZ Y,c_050E
    MOV $81,Y
    MOV $82,Y
    MOV A,$74
    EOR A,$75
    LSR A
    LSR A
    NOTC
    ROR $74
    ROR $75

c_053B:
    MOV Y,!$00FD
    BEQ c_053B
    MOV !$036B,Y
    PUSH Y
    MOV A,#$20
    MUL YA
    CLRC
    ADC A,$90
    MOV $90,A
    BCC c_0555
    CMP $88,$89
    BEQ c_0555
    INC $88

c_0555:
    MOV A,$D2
    BEQ c_055C
    CALL !c_0C93

c_055C:
    MOV A,$93
    POP Y
    MUL YA
    CLRC
    ADC A,$91
    MOV $91,A
    BCC c_056F
    BBC $CF.0,c_059B
    CALL !c_05A9
    BRA c_058D

c_056F:
    BBS $CF.4,c_058D
    BBC $CF.0,c_059B
    MOV X,#$00
    MOV $83,#$01

c_057A:
    MOV A,$83
    AND A,$D2
    BNE c_0587
    MOV A,$01+X
    BEQ c_0587
    CALL !c_0B38

c_0587:
    INC X
    INC X
    ASL $83
    BNE c_057A

c_058D:
    BBC $CF.5,c_059B
    MOV A,$9A
    BNE c_059B
    CLR1 $CF.5
    CLR1 $CF.0
    MOV $99,#$E0

c_059B:
    BBS $CF.3,c_05A4
    CALL !c_103C

c_05A1:
    JMP !c_050C

c_05A4:
    CLR1 $CF.3
    JMP !c_050C

c_05A9:
    BBC $CF.4,c_05B4
    CALL !c_0BC9
    CALL !c_0BFD
    CLR1 $CF.4

c_05B4:
    MOV X,#$00
    MOV $9E,X
    MOV $83,#$01

c_05BB:
    MOV A,$83
    AND A,$D2
    BNE c_05FC
    MOV $76,X
    MOV A,$01+X
    BEQ c_05FC
    DEC $10+X
    BNE c_05FE

c_05CB:
    MOV A,[$00+X]
    INC $00+X
    BNE c_05D3
    INC $01+X

c_05D3:
    MOV Y,A
    BNE c_0600
    MOV A,$60+X
    BNE c_05DD
    JMP !c_0BFD

c_05DD:
    PUSH Y
    MOV A,!$0341+X
    MOV Y,A
    MOV A,!$0340+X
    ADDW YA,$AC
    MOV $00+X,A
    MOV $01+X,Y
    POP Y
    DEC $60+X
    BNE c_05CB
    MOV A,!$0330+X
    MOV $00+X,A
    MOV A,!$0331+X
    MOV $01+X,A
    BRA c_05CB

c_05FC:
    BRA c_0656

c_05FE:
    BRA c_0650

c_0600:
    BMI c_062E
    MOV !$0200+X,A
    MOV A,[$00+X]
    INC $00+X
    BNE c_060D
    INC $01+X

c_060D:
    MOV Y,A
    BMI c_062E
    PUSH A
    XCN A
    AND A,#$07
    MOV Y,A
    MOV A,!d_14A0+Y
    MOV !$0201+X,A
    POP A
    AND A,#$0F
    MOV Y,A
    MOV A,!d_14A8+Y
    MOV !$0310+X,A
    MOV A,[$00+X]
    INC $00+X
    BNE c_062D
    INC $01+X

c_062D:
    MOV Y,A

c_062E:
    CMP A,#$DE
    BEQ c_0661
    CMP A,#$E0
    BCC c_063B
    CALL !c_06BB
    BRA c_05CB

c_063B:
    CALL !c_0E0C
    MOV A,!$0200+X
    MOV $10+X,A
    MOV Y,A
    MOV A,!$0201+X
    MUL YA
    MOV A,Y
    BNE c_064C
    INC A

c_064C:
    MOV $11+X,A
    BRA c_0653

c_0650:
    CALL !c_0A54

c_0653:
    CALL !c_0902

c_0656:
    INC X
    INC X
    ASL $83
    BNE c_065E
    BRA c_0668

c_065E:
    JMP !c_05BB

c_0661:
    CLR1 $CF.0
    SET1 $CF.3
    JMP !c_05CB

c_0668:
    MOV A,$94
    BEQ c_0677
    MOVW YA,$96
    ADDW YA,$92
    DBNZ $94,c_0675
    MOVW YA,$94

c_0675:
    MOVW $92,YA

c_0677:
    MOV A,$A7
    BEQ c_0690
    MOVW YA,$A3
    ADDW YA,$9F
    MOVW $9F,YA
    MOVW YA,$A5
    ADDW YA,$A1
    DBNZ $A7,c_068E
    MOVW YA,$A7
    MOVW $9F,YA
    MOV Y,$A9

c_068E:
    MOVW $A1,YA

c_0690:
    MOV A,$9A
    BEQ c_06A2
    MOVW YA,$9C
    ADDW YA,$98
    DBNZ $9A,c_069D
    MOVW YA,$9A

c_069D:
    MOVW $98,YA
    MOV $9E,#$FF

c_06A2:
    MOV X,#$00
    MOV $83,#$01

c_06A7:
    MOV A,$83
    AND A,$D2
    BNE c_06B4
    MOV A,$01+X
    BEQ c_06B4
    CALL !c_099D

c_06B4:
    INC X
    INC X
    ASL $83
    BNE c_06A7
    RET

c_06BB:
    ASL A
    MOV Y,A
    MOV A,!c_1321+Y
    PUSH A
    MOV A,!$1320+Y
    PUSH A
    MOV A,Y
    LSR A
    MOV Y,A
    MOV A,!c_13BE+Y
    BEQ c_06D0
    JMP !c_0F64

c_06D0:
    JMP !c_0F6C

c_06D3:
    BBC $CF.6,c_06D8
    MOV A,#$0A

c_06D8:
    MOV !$0261+X,A
    AND A,#$1F
    MOV !$0241+X,A
    MOV A,#$00
    MOV !$0240+X,A
    RET

c_06E6:
    BBC $CF.6,c_06F3
    MOV A,[$00+X]
    INC $00+X
    BNE c_06F1
    INC $01+X

c_06F1:
    MOV Y,A
    RET

c_06F3:
    MOV $21+X,A
    PUSH A
    MOV A,[$00+X]
    INC $00+X
    BNE c_06FE
    INC $01+X

c_06FE:
    MOV Y,A
    MOV !$0260+X,A
    SETC
    SBC A,!$0241+X
    POP X
    CALL !c_0957
    MOV !$0250+X,A
    MOV A,Y
    MOV !$0251+X,A
    RET

c_0712:
    MOV !$02D0+X,A
    MOV A,[$00+X]
    INC $00+X
    BNE c_071D
    INC $01+X

c_071D:
    MOV Y,A
    MOV !$02C1+X,A
    MOV A,[$00+X]
    INC $00+X
    BNE c_0729
    INC $01+X

c_0729:
    MOV Y,A

c_072A:
    MOV $41+X,A
    MOV !$02E1+X,A
    MOV A,#$00
    MOV !$02D1+X,A
    RET

c_0735:
    MOV !$02D1+X,A
    PUSH A
    MOV Y,#$00
    MOV A,$41+X
    POP X
    DIV YA,X
    MOV X,$76
    MOV !$02E0+X,A
    RET

c_0745:
    MOV A,#$00
    MOVW $98,YA
    RET

c_074A:
    MOV $9A,A
    MOV A,[$00+X]
    INC $00+X
    BNE c_0754
    INC $01+X

c_0754:
    MOV Y,A
    MOV $9B,A

c_0757:
    SETC
    SBC A,$99
    MOV X,$9A
    CALL !c_0957
    MOVW $9C,YA
    RET

c_0762:
    MOV A,#$00
    MOVW $92,YA
    RET

c_0767:
    MOV $94,A
    MOV A,[$00+X]
    INC $00+X
    BNE c_0771
    INC $01+X

c_0771:
    MOV Y,A
    MOV $95,A
    SETC
    SBC A,$93
    MOV X,$94
    CALL !c_0957
    MOVW $96,YA
    RET

c_077F:
    MOV $8B,A
    RET

c_0782:
    MOV !$0350+X,A
    RET

c_0786:
    MOV !$0300+X,A
    MOV A,[$00+X]
    INC $00+X
    BNE c_0791
    INC $01+X

c_0791:
    MOV Y,A
    MOV !$02F1+X,A
    MOV A,[$00+X]
    INC $00+X
    BNE c_079D
    INC $01+X

c_079D:
    MOV Y,A

c_079E:
    MOV $51+X,A
    RET

c_07A1:
    MOV A,#$01
    BRA c_07A7

c_07A5:
    MOV A,#$00

c_07A7:
    MOV !$0280+X,A
    MOV A,Y
    MOV !$0271+X,A
    MOV A,[$00+X]
    INC $00+X
    BNE c_07B6
    INC $01+X

c_07B6:
    MOV Y,A
    MOV !$0270+X,A
    MOV A,[$00+X]
    INC $00+X
    BNE c_07C2
    INC $01+X

c_07C2:
    MOV Y,A
    MOV !$0281+X,A
    RET

c_07C7:
    MOV !$0270+X,A
    RET

c_07CB:
    MOV !$0211+X,A
    MOV A,#$00
    MOV !$0210+X,A
    RET

c_07D4:
    MOV $20+X,A
    PUSH A
    MOV A,[$00+X]
    INC $00+X
    BNE c_07DF
    INC $01+X

c_07DF:
    MOV Y,A
    MOV !$0230+X,A
    SETC
    SBC A,!$0211+X
    POP X
    CALL !c_0957
    MOV !$0220+X,A
    MOV A,Y
    MOV !$0221+X,A
    RET

c_07F3:
    MOV !$02B1+X,A
    RET

c_07F7:
    MOV !$0340+X,A
    MOV A,[$00+X]
    INC $00+X
    BNE c_0802
    INC $01+X

c_0802:
    MOV Y,A
    MOV !$0341+X,A
    MOV A,[$00+X]
    INC $00+X
    BNE c_080E
    INC $01+X

c_080E:
    MOV Y,A
    MOV $60+X,A
    MOV A,$00+X
    MOV !$0330+X,A
    MOV A,$01+X
    MOV !$0331+X,A
    PUSH Y
    MOV A,!$0341+X
    MOV Y,A
    MOV A,!$0340+X
    ADDW YA,$AC
    MOV $00+X,A
    MOV $01+X,Y
    POP Y
    RET

c_082B:
    MOV $86,A
    MOV A,[$00+X]
    INC $00+X
    BNE c_0835
    INC $01+X

c_0835:
    MOV Y,A
    MOV A,#$00
    MOVW $9F,YA
    MOV A,[$00+X]
    INC $00+X
    BNE c_0842
    INC $01+X

c_0842:
    MOV Y,A
    MOV A,#$00
    MOVW $A1,YA
    CLR1 $84.5
    RET

c_084A:
    MOV $A7,A
    MOV A,[$00+X]
    INC $00+X
    BNE c_0854
    INC $01+X

c_0854:
    MOV Y,A
    MOV $A8,A
    SETC
    SBC A,$A0
    MOV X,$A7
    CALL !c_0957

c_085F:
    MOVW $A3,YA
    BBS $D0.5,c_087A
    MOV A,[$00+X]
    INC $00+X
    BNE c_086C
    INC $01+X

c_086C:
    MOV Y,A
    MOV $A9,A

c_086F:
    SETC
    SBC A,$A2
    MOV X,$A7
    CALL !c_0957
    MOVW $A5,YA
    RET

c_087A:
    MOV A,#$00
    BRA c_086F

c_087E:
    MOVW $9F,YA
    MOVW $A1,YA
    SET1 $84.5
    RET

c_0885:
    CALL !c_08B3
    MOV A,[$00+X]
    INC $00+X
    BNE c_0890
    INC $01+X

c_0890:
    MOV Y,A
    MOV $8A,A
    MOV A,[$00+X]
    INC $00+X
    BNE c_089B
    INC $01+X

c_089B:
    MOV Y,A
    MOV Y,#$08
    MUL YA
    MOV X,A
    MOV Y,#$0F

c_08A2:
    MOV A,!d_146C+X
    CALL !c_0F76
    INC X
    MOV A,Y
    CLRC
    ADC A,#$10
    MOV Y,A
    BPL c_08A2
    MOV X,$76
    RET

c_08B3:
    MOV $89,A
    MOV Y,#$7D
    MOV !$00F2,Y
    MOV A,!$00F3
    CMP A,$89
    BEQ c_08F2
    AND A,#$0F
    EOR A,#$FF
    BBC $88.7,c_08CB
    CLRC
    ADC A,$88

c_08CB:
    MOV $88,A
    MOV Y,#$04

c_08CF:
    MOV A,!d_148B+Y
    MOV !$00F2,A
    MOV A,#$00
    MOV !$00F3,A
    DBNZ Y,c_08CF
    MOV A,$84

c_08DE:
    OR A,#$20
    MOV Y,#$6C
    MOV !$00F2,Y
    MOV !$00F3,A
    MOV A,$89
    MOV Y,#$7D
    MOV !$00F2,Y
    MOV !$00F3,A

c_08F2:
    ASL A
    ASL A
    ASL A
    EOR A,#$FF
    SETC
    ADC A,#$FF
    MOV Y,#$6D
    JMP !c_0F76

c_08FF:
    MOV $8C,A
    RET

c_0902:
    MOV A,$30+X
    BNE c_094B
    MOV A,[$00+X]
    CMP A,#$F9
    BNE c_094B
    CALL !c_0F66
    MOV A,[$00+X]
    INC $00+X
    BNE c_0917
    INC $01+X

c_0917:
    MOV Y,A

c_0918:
    MOV $31+X,A
    MOV A,[$00+X]
    INC $00+X
    BNE c_0922
    INC $01+X

c_0922:
    MOV Y,A
    MOV $30+X,A
    MOV A,[$00+X]
    INC $00+X
    BNE c_092D
    INC $01+X

c_092D:
    MOV Y,A
    CLRC
    ADC A,$8B
    ADC A,!$0350+X

c_0934:
    AND A,#$7F
    MOV !$02B0+X,A
    SETC
    SBC A,!$0291+X
    MOV Y,$30+X
    PUSH Y
    POP X
    CALL !c_0957
    MOV !$02A0+X,A
    MOV A,Y
    MOV !$02A1+X,A

c_094B:
    RET

c_094C:
    MOV A,!$0291+X
    MOV $7A,A
    MOV A,!$0290+X
    MOV $79,A
    RET

c_0957:
    NOTC
    ROR $7B
    BPL c_095F
    EOR A,#$FF
    INC A

c_095F:
    MOV Y,#$00
    DIV YA,X
    PUSH A
    MOV A,#$00

c_0965:
    DIV YA,X
    POP Y
    MOV X,$76

c_0969:
    BBC $7B.7,c_0972
    MOVW $70,YA
    MOVW YA,$DF
    SUBW YA,$70

c_0972:
    RET

c_0973:
    SET1 $7C.7
    MOV Y,$91
    MOV A,!$02F1+X
    MUL YA
    MOV A,Y
    CLRC
    ADC A,!$02F0+X

c_0980:
    ASL A
    BCC c_0985
    EOR A,#$FF

c_0985:
    MOV Y,$51+X
    MUL YA
    MOV A,Y
    EOR A,#$FF

c_098B:
    MOV Y,$99
    MUL YA
    MOV A,!$0310+X
    MUL YA
    MOV A,!$0211+X
    MUL YA
    MOV A,Y
    MUL YA
    MOV A,Y
    MOV !$0231+X,A
    RET

c_099D:
    MOV A,$20+X
    BEQ c_09AA
    MOV A,#$10
    MOV Y,#$02
    DEC $20+X
    CALL !c_0A30

c_09AA:
    MOV Y,$51+X
    BEQ c_09D1
    MOV A,!$0300+X
    CBNE $50+X,c_09CF
    OR $9E,$83
    MOV A,!$02F0+X
    BPL c_09C3
    INC Y
    BNE c_09C3
    MOV A,#$80
    BRA c_09C7

c_09C3:
    CLRC
    ADC A,!$02F1+X

c_09C7:
    MOV !$02F0+X,A
    CALL !c_0980
    BRA c_09D6

c_09CF:
    INC $50+X

c_09D1:
    MOV A,#$FF
    CALL !c_098B

c_09D6:
    MOV A,$21+X
    BEQ c_09E3
    MOV A,#$40
    MOV Y,#$02
    DEC $21+X
    CALL !c_0A30

c_09E3:
    MOV A,$83
    AND A,$9E
    BEQ c_0A2F
    MOV A,!$0241+X
    MOV Y,A
    MOV A,!$0240+X
    MOVW $79,YA

c_09F2:
    MOV A,X
    XCN A

c_09F4:
    LSR A
    MOV $7B,A

c_09F7:
    MOV Y,$7A
    MOV A,!d_1458+Y
    SETC
    SBC A,!d_1457+Y
    MOV Y,$79
    MUL YA
    MOV A,Y
    MOV Y,$7A
    CLRC
    ADC A,!d_1457+Y
    MOV Y,A
    MOV A,!$0231+X
    MUL YA
    MOV A,!$0261+X
    ASL A
    BBC $7B.0,c_0A17
    ASL A

c_0A17:
    MOV A,Y
    BCC c_0A1D
    EOR A,#$FF
    INC A

c_0A1D:
    MOV Y,$7B
    CALL !c_0F6E
    MOV Y,#$14
    MOV A,#$00
    SUBW YA,$79
    MOVW $79,YA
    INC $7B
    BBC $7B.1,c_09F7

c_0A2F:
    RET

c_0A30:
    OR $9E,$83

c_0A33:
    MOVW $70,YA
    MOVW $72,YA
    PUSH X
    POP Y
    CLRC
    BNE c_0A46
    ADC $72,#$1F
    MOV A,#$00
    MOV [$70]+Y,A
    INC Y
    BRA c_0A4F

c_0A46:
    ADC $72,#$10
    CALL !c_0A4D
    INC Y

c_0A4D:
    MOV A,[$70]+Y

c_0A4F:
    ADC A,[$72]+Y
    MOV [$70]+Y,A
    RET

c_0A54:
    MOV A,$11+X
    BEQ c_0AC8
    DEC $11+X
    BEQ c_0A61
    MOV A,#$02
    CBNE $10+X,c_0AC8

c_0A61:
    MOV A,$60+X
    MOV $73,A
    MOV A,$00+X
    MOV Y,$01+X

c_0A69:
    MOVW $70,YA
    MOV Y,#$00

c_0A6D:
    MOV A,[$70]+Y
    BEQ c_0A8F
    BMI c_0A7A

c_0A73:
    INC Y
    BMI c_0AB6
    MOV A,[$70]+Y
    BPL c_0A73

c_0A7A:
    CMP A,#$C8
    BEQ c_0AC8
    CMP A,#$EF
    BEQ c_0AAB
    CMP A,#$E0
    BCC c_0AB6
    PUSH Y
    MOV Y,A
    POP A
    ADC A,!c_133E+Y

c_0A8C:
    MOV Y,A
    BRA c_0A6D

c_0A8F:
    MOV A,$73
    BEQ c_0AB6
    DEC $73
    BNE c_0AA1
    MOV A,!$0331+X
    PUSH A
    MOV A,!$0330+X
    POP Y
    BRA c_0A69

c_0AA1:
    MOV A,!$0341+X
    PUSH A
    MOV A,!$0340+X
    POP Y
    BRA c_0A69

c_0AAB:
    INC Y
    MOV A,[$70]+Y
    PUSH A
    INC Y
    MOV A,[$70]+Y
    MOV Y,A
    POP A
    BRA c_0A69

c_0AB6:
    MOV A,$83
    MOV Y,#$5C
    PUSH A
    MOV A,$83
    AND A,$80
    POP A
    BNE c_0AC8
    MOV !$00F2,Y
    MOV !$00F3,A

c_0AC8:
    CLR1 $7C.7
    MOV A,$30+X
    BEQ c_0AE1
    MOV A,$31+X
    BEQ c_0AD6
    DEC $31+X
    BRA c_0AE1

c_0AD6:
    SET1 $7C.7
    MOV A,#$90
    MOV Y,#$02
    DEC $30+X
    CALL !c_0A33

c_0AE1:
    CALL !c_094C
    MOV A,$41+X
    BEQ c_0B34
    MOV A,!$02D0+X
    CBNE $40+X,c_0B32
    MOV A,!$0100+X
    CMP A,!$02D1+X
    BNE c_0AFB
    MOV A,!$02E1+X
    BRA c_0B08

c_0AFB:
    SETP
    INC $00+X
    CLRP
    MOV Y,A
    BEQ c_0B04
    MOV A,$41+X

c_0B04:
    CLRC
    ADC A,!$02E0+X

c_0B08:
    MOV $41+X,A
    MOV A,!$02C0+X
    CLRC
    ADC A,!$02C1+X
    MOV !$02C0+X,A

c_0B14:
    MOV $7B,A
    ASL A
    ASL A
    BCC c_0B1C
    EOR A,#$FF

c_0B1C:
    MOV Y,A
    MOV A,$41+X
    CMP A,#$F1
    BCC c_0B28
    AND A,#$0F
    MUL YA
    BRA c_0B2C

c_0B28:
    MUL YA
    MOV A,Y
    MOV Y,#$00

c_0B2C:
    CALL !c_0BA9

c_0B2F:
    JMP !c_0E7A

c_0B32:
    INC $40+X

c_0B34:
    BBS $7C.7,c_0B2F
    RET

c_0B38:
    CLR1 $7C.7
    MOV A,$51+X
    BEQ c_0B47
    MOV A,!$0300+X
    CBNE $50+X,c_0B47
    CALL !c_0973

c_0B47:
    MOV A,!$0241+X
    MOV Y,A
    MOV A,!$0240+X
    MOVW $79,YA
    MOV A,$21+X
    BEQ c_0B5E
    MOV A,!$0251+X
    MOV Y,A
    MOV A,!$0250+X
    CALL !c_0B93

c_0B5E:
    BBC $7C.7,c_0B64
    CALL !c_09F2

c_0B64:
    CLR1 $7C.7
    CALL !c_094C
    MOV A,$30+X
    BEQ c_0B7B
    MOV A,$31+X
    BNE c_0B7B
    MOV A,!$02A1+X
    MOV Y,A
    MOV A,!$02A0+X
    CALL !c_0B93

c_0B7B:
    MOV A,$41+X
    BEQ c_0B34
    MOV A,!$02D0+X
    CBNE $40+X,c_0B34
    MOV Y,$91
    MOV A,!$02C1+X
    MUL YA
    MOV A,Y
    CLRC
    ADC A,!$02C0+X
    JMP !c_0B14

c_0B93:
    SET1 $7C.7
    MOV $7B,Y
    CALL !c_0969
    PUSH Y
    MOV Y,$91
    MUL YA
    MOV $70,Y
    MOV $71,#$00
    MOV Y,$91
    POP A
    MUL YA
    ADDW YA,$70

c_0BA9:
    CALL !c_0969
    ADDW YA,$79
    MOVW $79,YA
    RET

c_0BB1:
    MOVW YA,$DC
    MOVW $AC,YA
    MOVW $B0,YA
    SET1 $CF.4
    SET1 $CF.0
    MOV A,#$00
    MOV $DE,A
    MOV $D2,A

c_0BC1:
    MOV A,$80
    EOR A,#$FF
    TSET1 !$0082
    RET

c_0BC9:
    MOV X,#$0E
    MOV $83,#$80

c_0BCE:
    MOV A,#$FF
    MOV !$0211+X,A
    MOV A,#$0A
    CALL !c_06D3
    MOV !$0311+X,A
    MOV !$02B1+X,A
    MOV !$0350+X,A
    MOV !$0270+X,A
    MOV $41+X,A
    MOV $51+X,A
    DEC X
    DEC X
    LSR $83
    BNE c_0BCE
    MOV $A7,A
    MOV $94,A
    MOV $8B,A
    MOV $B2,A
    MOV $8C,#$0B
    MOV $93,#$20
    RET

c_0BFD:
    CALL !c_0C7B
    CMP Y,#$00
    BNE c_0C18
    MOV Y,A
    BEQ c_0BC1
    DEC $B2
    BPL c_0C0D
    MOV $B2,A

c_0C0D:
    CALL !c_0C7B
    MOV X,$B2
    BEQ c_0BFD
    MOVW $B0,YA
    BRA c_0BFD

c_0C18:
    MOVW $72,YA
    MOV Y,#$0F
    MOV $D7,#$80

c_0C1F:
    PUSH Y
    MOV A,[$72]+Y
    DEC Y
    PUSH A
    MOV A,[$72]+Y
    POP Y
    CMP Y,#$00
    BNE c_0C2F
    CMP A,#$00
    BEQ c_0C31

c_0C2F:
    ADDW YA,$AC

c_0C31:
    MOVW $AE,YA
    POP Y
    MOV A,$D7
    AND A,$D2
    BNE c_0C4C
    MOV A,$AF
    MOV !$0000+Y,A
    DEC Y
    MOV A,$AE
    MOV !$0000+Y,A
    LSR $D7
    DEC Y
    BPL c_0C1F
    BRA c_0C52

c_0C4C:
    LSR $D7
    DEC Y
    DEC Y
    BPL c_0C1F

c_0C52:
    MOV X,#$00
    MOV $83,#$01

c_0C57:
    MOV A,$83
    AND A,$D2
    BNE c_0C74
    MOV A,$01+X
    BEQ c_0C69
    MOV A,!$0311+X
    BNE c_0C69
    CALL !c_0F0B

c_0C69:
    MOV A,#$00
    MOV $60+X,A
    MOV $20+X,A
    MOV $21+X,A
    INC A
    MOV $10+X,A

c_0C74:
    INC X
    INC X
    ASL $83
    BNE c_0C57
    RET

c_0C7B:
    MOV Y,#$00
    MOV A,[$B0]+Y
    INCW $B0
    PUSH A
    MOV A,[$B0]+Y
    INCW $B0
    MOV Y,A
    CLRC
    ASL A
    BCS c_0C8F

c_0C8B:
    POP A
    ADDW YA,$AC
    RET

c_0C8F:
    MOV Y,#$00
    POP A
    RET

c_0C93:
    CALL !c_0DA2
    MOV X,#$00
    MOV $83,#$01

c_0C9B:
    MOV A,$83
    AND A,$DE
    BNE c_0CAE
    MOV A,$83
    AND A,$D2
    BEQ c_0CAE
    MOV A,$01+X
    BEQ c_0CAE
    CALL !c_0B38

c_0CAE:
    MOV $DE,#$00
    INC X
    INC X
    ASL $83
    BNE c_0C9B
    CALL !c_0DBD
    MOV A,$C1
    MOV Y,!$036B
    MUL YA
    CLRC
    ADC A,$BF
    MOV $BF,A
    BCC c_0CC9
    BRA c_0CCA

c_0CC9:
    RET

c_0CCA:
    CALL !c_0DA2
    MOV X,#$00
    MOV $9E,X
    MOV $83,#$01

c_0CD4:
    MOV A,$83
    AND A,$D2
    BEQ c_0CFF
    MOV $76,X
    DEC $10+X
    BNE c_0D02

c_0CE0:
    MOV A,[$00+X]
    INC $00+X
    BNE c_0CE8
    INC $01+X

c_0CE8:
    MOV Y,A
    BNE c_0D05
    MOV A,$83
    TCLR1 !$00D2
    TCLR1 !$0085
    MOV A,#$00
    MOV !$0330+X,A
    MOV $00+X,A
    MOV !$0331+X,A
    MOV $01+X,A

c_0CFF:
    JMP !c_0D69

c_0D02:
    JMP !c_0D63

c_0D05:
    BMI c_0D33
    MOV !$0200+X,A
    MOV A,[$00+X]
    INC $00+X
    BNE c_0D12
    INC $01+X

c_0D12:
    MOV Y,A
    BMI c_0D33
    PUSH A
    XCN A
    AND A,#$07
    MOV Y,A
    MOV A,!d_14A0+Y
    MOV !$0201+X,A
    POP A
    AND A,#$0F
    MOV Y,A
    MOV A,!d_14A8+Y
    MOV !$0310+X,A
    MOV A,[$00+X]
    INC $00+X
    BNE c_0D32
    INC $01+X

c_0D32:
    MOV Y,A

c_0D33:
    CMP A,#$E0
    BEQ c_0D3F
    CMP A,#$DF
    BEQ c_0D44
    BCC c_0D4E
    BRA c_0D49

c_0D3F:
    CALL !c_0DD8
    BRA c_0CE0

c_0D44:
    CALL !c_0DF4
    BRA c_0CE0

c_0D49:
    CALL !c_06BB
    BRA c_0CE0

c_0D4E:
    CALL !c_0E0C
    MOV A,!$0200+X
    MOV $10+X,A
    MOV Y,A
    MOV A,!$0201+X
    MUL YA
    MOV A,Y
    BNE c_0D5F
    INC A

c_0D5F:
    MOV $11+X,A
    BRA c_0D66

c_0D63:
    CALL !c_0A54

c_0D66:
    CALL !c_0902

c_0D69:
    INC X
    INC X
    ASL $83
    BNE c_0D71
    BRA c_0D74

c_0D71:
    JMP !c_0CD4

c_0D74:
    MOV A,$94
    BEQ c_0D83
    MOVW YA,$96
    ADDW YA,$92
    DBNZ $94,c_0D81
    MOVW YA,$94

c_0D81:
    MOVW $92,YA

c_0D83:
    MOV $9E,#$FF
    MOV X,#$00
    MOV $83,#$01

c_0D8B:
    MOV A,$83
    AND A,$D2
    BEQ c_0D98
    MOV A,$01+X
    BEQ c_0D98
    CALL !c_099D

c_0D98:
    INC X
    INC X
    ASL $83
    BNE c_0D8B
    CALL !c_0DBD
    RET

c_0DA2:
    MOV Y,#$00

c_0DA4:
    MOV A,!$0090+Y
    MOV !$036D+Y,A
    INC Y
    CMP Y,#$08
    BNE c_0DA4
    MOV Y,#$00

c_0DB1:
    MOV A,!$00BE+Y
    MOV !$0090+Y,A
    INC Y
    CMP Y,#$08
    BNE c_0DB1
    RET

c_0DBD:
    MOV Y,#$00

c_0DBF:
    MOV A,!$0090+Y
    MOV !$00BE+Y,A
    INC Y
    CMP Y,#$08
    BNE c_0DBF
    MOV Y,#$00

c_0DCC:
    MOV A,!$036D+Y
    MOV !$0090+Y,A
    INC Y
    CMP Y,#$08
    BNE c_0DCC
    RET

c_0DD8:
    MOV A,[$00+X]
    INC $00+X
    BNE c_0DE0
    INC $01+X

c_0DE0:
    MOV Y,A
    MOV Y,#$00

c_0DE3:
    CMP A,!d_14B8+Y
    BEQ c_0DEF
    INC Y
    CMP Y,#$1A
    BNE c_0DE3
    MOV Y,#$0E

c_0DEF:
    MOV A,Y
    CALL !c_0F0B
    RET

c_0DF4:
    CALL !c_0F64
    CLR1 $84.0
    CLR1 $84.1
    CLR1 $84.2
    CLR1 $84.3
    CLR1 $84.4
    OR A,$84
    MOV $84,A
    MOV A,$83
    TSET1 !$0085
    RET

c_0E0B:
    RET

c_0E0C:
    CMP Y,#$CA
    BCC c_0E15
    CALL !c_0F0B
    MOV Y,#$A4

c_0E15:
    CMP Y,#$C8
    BCS c_0E0B
    MOV A,$80
    AND A,$83
    BNE c_0E0B
    MOV A,Y
    AND A,#$7F
    CLRC
    ADC A,$8B
    CLRC
    ADC A,!$0350+X
    MOV !$0291+X,A
    MOV A,!$02B1+X
    MOV !$0290+X,A
    MOV A,!$02D1+X
    LSR A
    MOV A,#$00
    ROR A
    MOV !$02C0+X,A
    MOV A,#$00
    MOV !$0040+X,A
    MOV !$0050+X,A
    MOV !$0100+X,A
    MOV !$02F0+X,A
    OR $9E,$83
    OR $81,$83
    MOV A,!$0270+X
    MOV !$0030+X,A
    BEQ c_0E77
    MOV A,!$0271+X
    MOV !$0031+X,A
    MOV A,!$0280+X
    BNE c_0E6D
    MOV A,!$0291+X
    SETC
    SBC A,!$0281+X
    MOV !$0291+X,A

c_0E6D:
    MOV A,!$0281+X
    CLRC
    ADC A,!$0291+X
    CALL !c_0934

c_0E77:
    CALL !c_094C

c_0E7A:
    MOV Y,#$00
    MOV A,$7A
    SETC
    SBC A,#$34
    BCS c_0E8C
    MOV A,$7A
    SETC
    SBC A,#$13
    BCS c_0E90
    DEC Y
    ASL A

c_0E8C:
    ADDW YA,$79
    MOVW $79,YA

c_0E90:
    PUSH X
    MOV A,$7A
    ASL A
    MOV Y,#$00
    MOV X,#$18
    DIV YA,X
    MOV X,A
    MOV A,!$143E+Y
    MOV $71,A
    MOV A,!d_143D+Y
    MOV $70,A
    MOV A,!$1440+Y
    PUSH A
    MOV A,!d_143F+Y
    POP Y
    SUBW YA,$70
    MOV Y,$79
    MUL YA
    MOV A,Y
    MOV Y,#$00
    ADDW YA,$70
    MOV $71,Y
    ASL A
    ROL $71
    MOV $70,A
    BRA c_0EC3

c_0EBF:
    LSR $71
    ROR A
    INC X

c_0EC3:
    CMP X,#$06
    BNE c_0EBF
    MOV $70,A
    POP X
    MOV A,!$0320+X
    MOV Y,$71
    MUL YA
    MOVW $72,YA
    MOV A,!$0320+X
    MOV Y,$70
    MUL YA
    PUSH Y
    MOV A,!$0321+X
    MOV Y,$70
    MUL YA
    ADDW YA,$72
    MOVW $72,YA
    MOV A,!$0321+X
    MOV Y,$71
    MUL YA
    MOV Y,A

c_0EEA:
    POP A
    ADDW YA,$72
    MOVW $72,YA
    MOV A,X
    XCN A
    LSR A
    OR A,#$02
    MOV Y,A
    MOV A,$72
    PUSH A
    MOV A,$83
    AND A,$80
    POP A
    BNE c_0F05
    MOV !$00F2,Y
    MOV !$00F3,A

c_0F05:
    INC Y
    MOV A,$73
    JMP !c_0F6E

c_0F0B:
    MOV !$0311+X,A
    MOV Y,A
    BPL c_0F17
    SETC
    SBC A,#$CA
    CLRC
    ADC A,$8C

c_0F17:
    MOV Y,#$06
    MUL YA
    MOVW $70,YA
    CLRC
    ADC $70,#$00
    ADC $71,#$04
    MOV A,$80
    AND A,$83
    BNE c_0F63
    PUSH X
    MOV A,X
    XCN A
    LSR A
    OR A,#$04
    MOV X,A
    MOV Y,#$00
    MOV A,[$70]+Y
    BPL c_0F44
    AND A,#$1F
    AND $84,#$20
    TSET1 !$0084
    OR $85,$83
    MOV A,Y
    BRA c_0F4B

c_0F44:
    MOV A,$83
    TCLR1 !$0085

c_0F49:
    MOV A,[$70]+Y

c_0F4B:
    MOV !$00F2,X
    MOV !$00F3,A
    INC X
    INC Y
    CMP Y,#$04
    BNE c_0F49
    POP X
    MOV A,[$70]+Y
    MOV !$0321+X,A
    INC Y
    MOV A,[$70]+Y
    MOV !$0320+X,A

c_0F63:
    RET

c_0F64:
    MOV A,[$00+X]

c_0F66:
    INC $00+X
    BNE c_0F6C
    INC $01+X

c_0F6C:
    MOV Y,A
    RET

c_0F6E:
    PUSH A
    MOV A,$83
    AND A,$80
    POP A
    BNE c_0F7C

c_0F76:
    MOV !$00F2,Y
    MOV !$00F3,A

c_0F7C:
    RET

c_0F7D:
    MOV A,#$00
    MOV !$00F7,A
    MOV !$00F7,A
    MOV A,#$00
    MOV X,A

c_0F88:
    MOV (X)+,A
    CMP X,#$E8
    BNE c_0F88
    PUSH A
    MOV Y,#$02
    MOV A,#$00
    MOVW $AC,YA

c_0F94:
    MOV A,#$00
    MOV Y,#$00
    MOV [$AC]+Y,A
    INCW $AC
    MOV Y,#$03
    MOV A,#$FF
    CMPW YA,$AC
    BNE c_0F94
    MOV Y,#$15
    MOV A,#$00
    MOVW $AC,YA

c_0FAA:
    MOV A,#$00
    MOV Y,#$00
    MOV [$AC]+Y,A
    INCW $AC
    MOV Y,#$D0
    MOV A,#$00
    CMPW YA,$AC
    BNE c_0FAA
    POP A
    INC A
    CALL !c_08B3
    SET1 $84.5
    MOV A,#$6E
    MOV Y,#$0C
    MOV !$00F2,Y
    MOV !$00F3,A
    MOV Y,#$1C

c_0FCD:
    MOV !$00F2,Y
    MOV !$00F3,A
    MOV A,#$00
    MOV A,#$15
    MOV Y,#$5D
    MOV !$00F2,Y
    MOV !$00F3,A
    MOV A,#$00
    MOV !$00BA,A
    MOV !$00B6,A
    MOV A,#$15
    MOV !$00BB,A
    MOV A,#$30
    MOV !$00B7,A
    MOV A,#$F4
    MOV Y,#$19
    MOVW $DC,YA
    MOV A,#$F4
    MOV Y,#$1F
    MOVW $C9,YA
    MOV A,#$F4
    MOV Y,#$65
    MOVW $CB,YA
    MOVW $D8,YA
    MOV A,#$F4
    MOV Y,#$B7
    MOVW $CD,YA
    MOVW $DA,YA
    MOV A,#$F0
    MOV !$00F1,A
    MOV A,#$10
    MOV !$00FA,A
    MOV !$00FB,A
    MOV $93,A
    MOV $C1,A
    MOV A,#$03
    MOV !$00F1,A
    AND $CF,#$00
    MOV A,#$0B
    MOV !$0377,A
    MOV A,#$00
    MOV !$0378,A
    MOV A,#$15
    MOV !$0379,A
    MOV $C1,#$25
    MOV $99,#$E0
    RET

c_103C:
    BBS $D0.0,c_1041
    BRA c_104B

c_1041:
    POP A
    POP A
    JMP !c_123C
    db $AE $AE $5F $96 $13

c_104B:
    CALL !c_131A
    ASL A
    MOV X,A
    JMP [!d_1053+X]

d_1053:
    dw c_1330
    dw c_106D
    dw c_1089
    dw c_109E
    dw c_10B3
    dw c_10F6
    dw c_1112
    dw c_1130
    dw c_1152
    dw c_1177
    dw c_11A5
    dw c_121F
    dw c_122D

c_106D:
    CALL !c_1371
    MOV Y,#$16
    MOV A,#$00
    MOVW $C7,YA
    MOVW $B3,YA
    MOV Y,!$0365
    MOV A,!$0364
    MOVW $AA,YA
    MOV A,#$00
    MOV !$0362,A
    CALL !c_123C
    RET

c_1089:
    MOVW YA,$C9
    MOVW $B6,YA
    MOV A,!$0377
    MOV !$037A,A
    CALL !c_1286
    INC !$0377
    MOVW YA,$B3
    MOVW $C9,YA
    RET

c_109E:
    MOVW YA,$CB
    MOVW $B6,YA
    MOV A,!$0378
    MOV !$037A,A
    CALL !c_1286
    INC !$0378
    MOVW YA,$B3
    MOVW $CB,YA
    RET

c_10B3:
    CALL !c_1389
    MOV A,!$0364
    MOV !$0378,A
    MOV !$037A,A
    MOV Y,A
    MOV A,#$00

c_10C2:
    MOV !d_14B8+Y,A
    INC Y
    CMP Y,#$0B
    BNE c_10C2
    MOV A,!$0378
    CMP A,#$00
    BEQ c_10F1
    INC !$037A
    MOV Y,!$037A
    MOV A,#$04
    MUL YA
    CLRC
    SBC A,#$03
    ADDW YA,$BA
    MOV !$00B8,A
    MOV !$00B9,Y
    MOV Y,#$00
    MOV A,[$B8]+Y
    MOV $CB,A
    INC Y
    MOV A,[$B8]+Y
    MOV $CC,A
    RET

c_10F1:
    MOVW YA,$D8
    MOVW $CB,YA
    RET

c_10F6:
    CALL !c_1371
    MOVW YA,$DC
    MOVW $AC,YA
    MOVW $B0,YA
    MOVW $B3,YA
    MOV Y,!$0365
    MOV A,!$0364
    MOVW $AA,YA
    MOV A,#$00
    MOV !$0362,A
    CALL !c_123C
    RET

c_1112:
    MOVW YA,$CD
    MOVW $B6,YA
    MOV A,!$0379
    MOV !$037A,A
    CALL !c_1286
    INC !$0379
    MOV A,!$0379
    CMP A,#$19
    BNE c_112B
    SET1 $CF.2

c_112B:
    MOVW YA,$B3
    MOVW $CD,YA
    RET

c_1130:
    CLR1 $CF.2
    MOV A,#$15
    MOV !$0379,A
    MOV A,#$00
    MOV Y,#$15
    MOV !d_14B8+Y,A
    MOV Y,#$16
    MOV !d_14B8+Y,A
    MOV Y,#$17
    MOV !d_14B8+Y,A
    MOV Y,#$18
    MOV !d_14B8+Y,A
    MOVW YA,$DA
    MOVW $CD,YA
    RET

c_1152:
    CALL !c_1379
    MOV A,!$0364
    BNE c_1163
    MOV $99,#$E0
    MOV $9A,#$00
    JMP !c_0BB1

c_1163:
    CLR1 $CF.5
    MOV $99,#$00
    MOV A,!$0365
    MOV $9A,A
    MOV A,#$E0
    MOV $9B,A
    CALL !c_0757
    JMP !c_0BB1

c_1177:
    CALL !c_1379
    MOV A,!$0364
    BNE c_1186
    CLR1 $CF.0
    SET1 $CF.3
    JMP !c_0BC1

c_1186:
    MOV A,!$0365
    MOV $9A,A
    MOV A,#$00
    MOV $9B,A
    CALL !c_0757
    SET1 $CF.5
    RET

d_1195:
    db $01 $02 $04 $08 $10 $20 $40 $80

d_119D:
    db $00 $02 $04 $06 $08 $0A $0C $0E

c_11A5:
    CALL !c_1389
    MOV X,!$0365
    MOV A,!d_1195+X
    PUSH A
    MOV X,!$0365
    MOV A,!d_119D+X
    MOV X,A
    MOV A,#$00
    MOV !$0211+X,A
    MOV !$0311+X,A
    MOV !$02B1+X,A
    MOV !$0350+X,A
    MOV !$0270+X,A
    MOV $41+X,A
    MOV $51+X,A
    MOV !$0291+X,A
    MOV !$0290+X,A
    POP A
    TSET1 !$0082
    TCLR1 !$0081
    TCLR1 !$0085
    MOV $DE,A
    OR A,$D2
    MOV $D2,A
    MOVW YA,$C7
    MOVW $D3,YA
    MOV A,!$0364
    MOV Y,#$02
    MUL YA
    ADDW YA,$D3
    MOVW $D3,YA
    MOV Y,#$00
    MOV A,[$D3]+Y
    PUSH A
    INCW $D3
    MOV A,[$D3]+Y
    PUSH A
    MOV X,!$0365
    MOV A,!d_119D+X
    MOV X,A
    POP A
    MOV $01+X,A
    POP A
    MOV $00+X,A
    MOV A,#$00
    MOV $60+X,A
    MOV $20+X,A
    MOV $21+X,A
    INC A
    MOV $10+X,A
    MOV X,!$0365
    MOV A,!d_119D+X
    MOV X,A
    MOV A,!$0366
    CALL !c_06D3
    RET

c_121F:
    CALL !c_1358
    MOV A,!$0364
    BNE c_122A
    CLR1 $CF.6
    RET

c_122A:
    SET1 $CF.6
    RET

c_122D:
    BBS $CF.7,c_1237
    CLR1 $CF.0
    SET1 $CF.7
    JMP !c_0BC1

c_1237:
    SET1 $CF.0
    CLR1 $CF.7
    RET

c_123C:
    MOV A,#$0C
    MOV !$0362,A
    MOV Y,#$00

c_1243:
    MOV A,#$01
    MOV !$00F7,A

c_1248:
    MOV A,!$00F7
    CMP A,#$02
    BNE c_1248
    MOV A,$F4
    MOV [$B3]+Y,A
    INCW $B3
    MOV A,$F5
    MOV [$B3]+Y,A
    INCW $B3
    MOV A,$F6
    MOV [$B3]+Y,A
    INCW $B3
    MOV A,#$00
    MOV !$00F7,A

c_1266:
    MOV A,!$00F7
    CMP A,#$02
    BEQ c_1266
    DECW $AA
    BEQ c_1283
    BBS $CF.0,c_1276
    BRA c_123C

c_1276:
    DEC !$0362
    BNE c_1280
    SET1 $D0.0
    JMP !c_05A1

c_1280:
    JMP !c_1243

c_1283:
    CLR1 $D0.0
    RET

c_1286:
    CALL !c_1381
    MOV A,!$0364
    MOV Y,!$037A
    MOV !d_14B8+Y,A
    MOV A,#$06
    MOV Y,!$037A
    MUL YA
    MOV Y,A
    MOV A,!$037A
    MOV !$0400+Y,A
    INC !$037A
    INC Y
    MOV !$00B5,Y
    MOV Y,!$037A
    MOV A,#$04
    MUL YA
    CLRC
    SBC A,#$03
    ADDW YA,$BA
    MOV !$00B8,A
    MOV !$00B9,Y
    MOV A,!$0365
    MOV Y,!$0366
    ADDW YA,$B6
    MOVW $BC,YA
    MOV Y,#$00
    MOV A,$B6
    MOV [$B8]+Y,A
    INC Y
    MOV A,$B7
    MOV [$B8]+Y,A
    INC Y
    MOV A,$BC
    MOV [$B8]+Y,A
    INC Y
    MOV A,$BD
    MOV [$B8]+Y,A
    CALL !c_1381
    MOV Y,!$00B5
    MOV A,!$0364
    MOV !$0400+Y,A
    INC Y
    MOV A,!$0365
    MOV !$0400+Y,A
    INC Y
    MOV A,!$0366
    MOV !$0400+Y,A
    INC Y
    MOV !$00B5,Y
    CALL !c_1371
    MOV Y,!$00B5
    MOV A,!$0364
    MOV !$0400+Y,A
    INC Y
    MOV A,!$0365
    MOV !$0400+Y,A
    CALL !c_1371
    MOV Y,!$0365
    MOV A,!$0364
    MOVW $AA,YA
    MOVW YA,$B6
    MOVW $B3,YA
    CALL !c_123C
    RET

c_131A:
    MOV A,$CF
    MOV !$00F4,A
    MOV A,#$01

c_1321:
    MOV !$00F7,A

c_1324:
    MOV A,!$00F7
    CMP A,!$00F7
    BNE c_1324
    AND A,#$02
    BNE c_1331

c_1330:
    RET

c_1331:
    MOV A,#$00
    MOV !$00F7,A
    BRA c_1363

c_1338:
    MOV A,!$00F4
    MOV Y,!$00F5

c_133E:
    MOV !$0364,A
    MOV !$0365,Y
    RET

c_1345:
    MOV Y,!$00F4
    MOV A,!$00F5
    MOV X,!$00F6
    MOV !$0364,Y
    MOV !$0365,A
    MOV !$0366,X
    RET

c_1358:
    CALL !c_13A5
    MOV A,!$00F4
    MOV !$0364,A
    BRA c_13BE

c_1363:
    MOV A,!$00F4
    CMP A,!$00F4
    BNE c_1363
    MOV !$0364,A
    JMP !c_13C8

c_1371:
    CALL !c_13A5
    CALL !c_1338
    BRA c_13C8

c_1379:
    CALL !c_1391
    CALL !c_1338
    BRA c_13BE

c_1381:
    CALL !c_13A5
    CALL !c_1345
    BRA c_13C8

c_1389:
    CALL !c_13A5
    CALL !c_1345
    BRA c_13BE

c_1391:
    MOV A,#$01
    MOV !$00F7,A

c_1396:
    MOV A,!$00F7
    CMP A,#$02
    BNE c_1396
    MOV A,!$00F7
    CMP A,#$02
    BNE c_1396
    RET

c_13A5:
    MOV A,#$01
    MOV !$00F7,A

c_13AA:
    MOV A,!$00F7
    CMP A,#$02
    BNE c_13AA
    MOV A,!$00F7
    CMP A,#$02
    BNE c_13AA
    MOV A,#$00
    MOV !$00F7,A
    RET

c_13BE:
    PUSH Y
    MOV Y,#$08
    MOV !$00F7,Y
    POP Y
    PUSH A
    BRA c_13D0

c_13C8:
    PUSH Y
    MOV Y,#$04
    MOV !$00F7,Y
    POP Y
    PUSH A

c_13D0:
    MOV A,!$00F7
    AND A,#$02
    BNE c_13D0
    MOV A,!$00F7
    AND A,#$02
    BNE c_13D0
    POP A
    RET
    dw c_0F0B
    dw c_06D3
    dw c_06E6
    dw c_0712
    dw c_072A
    dw c_0745
    dw c_074A
    dw c_0762
    dw c_0767
    dw c_077F
    dw c_0782
    dw c_0786
    dw c_079E
    dw c_07CB
    dw c_07D4
    dw c_07F7
    dw c_0735
    dw c_07A1
    dw c_07A5
    dw c_07C7
    dw c_07F3
    dw c_082B
    dw c_087E
    dw c_0885
    dw c_084A
    dw c_0918
    dw c_08FF
    db $00 $00 $00 $00 $00 $00 $00 $00 $01 $01 $02 $03 $00 $01 $02 $01
    db $02 $01 $01 $03 $00 $01 $02 $03 $01 $03 $03 $00 $01 $03 $00 $03
    db $03 $03 $01 $02 $00 $00 $00

d_143D:
    dw c_085F

d_143F:
    dw c_08DE
    dw c_0965
    dw c_09F4
    dw c_0A8C
    dw c_0B2C
    dw $0BD6
    dw c_0C8B
    dw $0D4A
    dw $0E14
    dw c_0EEA
    dw c_0FCD
    dw $10BE

d_1457:
    db $00

d_1458:
    db $01 $03 $07 $0D $15 $1E $29 $34 $42 $51 $5E $67 $6E $73 $77 $7A
    db $7C $7D $7E $7F

d_146C:
    db $7F $00 $00 $00 $00 $00 $00 $00 $58 $BF $DB $F0 $FE $07 $0C $0C
    db $0C $21 $2B $2B $13 $FE $F3 $F9 $34 $33 $00 $D9 $E5 $01 $FC

d_148B:
    db $EB $2C $3C $0D $4D $6C $4C $5C $3D $2D

d_1495:
    db $5C $A0 $A2 $8A $86 $84 $81 $DF $85 $87 $82

d_14A0:
    db $32 $B2 $BF $CB $D8 $E5 $F2 $FC

d_14A8:
    db $19 $32 $4C $65 $72 $7F $8C $98 $A5 $B2 $BF $CB $D8 $E5 $F2 $FC

d_14B8:
    db $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00
    db $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00 $00
