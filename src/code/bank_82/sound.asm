; Bank $82 module "sound" - starts at $82AA71
 
 
fSound_GetToolSound:
    SEP #$20                                                   ;82AA71|E220    |      ; X: nTileX, Y: nTileY, return A: nToolSoundId (0/1/2)
    REP #$10                                                   ;82AA73|C210    |      ;
    LDA.W strcPlayerData.toolEquipped                          ;82AA75|AD2109  |000921;
    CMP.B #$01                                                 ;82AA78|C901    |      ;
    BEQ .sickle                                                ;82AA7A|F069    |82AAE5;
    CMP.B #$11                                                 ;82AA7C|C911    |      ;
    BEQ .sickle                                                ;82AA7E|F065    |82AAE5;
    CMP.B #$02                                                 ;82AA80|C902    |      ;
    BNE +                                                      ;82AA82|D003    |82AA87;
    JMP.W .plow                                                ;82AA84|4C0AAB  |82AB0A;
 
 
  + CMP.B #$12                                                 ;82AA87|C912    |      ;
    BEQ .plow                                                  ;82AA89|F07F    |82AB0A;
    CMP.B #$03                                                 ;82AA8B|C903    |      ;
    BNE +                                                      ;82AA8D|D003    |82AA92;
    JMP.W .hammer                                              ;82AA8F|4C2FAB  |82AB2F;
 
 
  + CMP.B #$13                                                 ;82AA92|C913    |      ;
    BNE +                                                      ;82AA94|D003    |82AA99;
    JMP.W .hammer                                              ;82AA96|4C2FAB  |82AB2F;
 
 
  + CMP.B #$04                                                 ;82AA99|C904    |      ;
    BNE +                                                      ;82AA9B|D003    |82AAA0;
    JMP.W .axe                                                 ;82AA9D|4C54AB  |82AB54;
 
 
  + CMP.B #$14                                                 ;82AAA0|C914    |      ;
    BNE +                                                      ;82AAA2|D003    |82AAA7;
    JMP.W .axe                                                 ;82AAA4|4C54AB  |82AB54;
 
 
  + CMP.B #$10                                                 ;82AAA7|C910    |      ;
    BNE +                                                      ;82AAA9|D003    |82AAAE;
    JMP.W .wateringCan                                         ;82AAAB|4C79AB  |82AB79;
 
 
  + CMP.B #$15                                                 ;82AAAE|C915    |      ;
    BNE +                                                      ;82AAB0|D003    |82AAB5;
    JMP.W .sprinkler                                           ;82AAB2|4CEBAB  |82ABEB;
 
 
  + CMP.B #$0C                                                 ;82AAB5|C90C    |      ;
    BNE +                                                      ;82AAB7|D003    |82AABC;
    JMP.W .anySeedBag                                          ;82AAB9|4C10AC  |82AC10;
 
 
  + CMP.B #$05                                                 ;82AABC|C905    |      ;
    BNE +                                                      ;82AABE|D003    |82AAC3;
    JMP.W .anySeedBag                                          ;82AAC0|4C10AC  |82AC10;
 
 
  + CMP.B #$06                                                 ;82AAC3|C906    |      ;
    BNE +                                                      ;82AAC5|D003    |82AACA;
    JMP.W .anySeedBag                                          ;82AAC7|4C10AC  |82AC10;
 
 
  + CMP.B #$07                                                 ;82AACA|C907    |      ;
    BNE +                                                      ;82AACC|D003    |82AAD1;
    JMP.W .anySeedBag                                          ;82AACE|4C10AC  |82AC10;
 
 
  + CMP.B #$08                                                 ;82AAD1|C908    |      ;
    BNE +                                                      ;82AAD3|D003    |82AAD8;
    JMP.W .anySeedBag                                          ;82AAD5|4C10AC  |82AC10;
 
 
  + CMP.B #$0D                                                 ;82AAD8|C90D    |      ;
    BNE +                                                      ;82AADA|D003    |82AADF;
    JMP.W .paint                                               ;82AADC|4C35AC  |82AC35;
 
 
  + REP #$20                                                   ;82AADF|C220    |      ;
    LDA.W #$0001                                               ;82AAE1|A90100  |      ;
    RTL                                                        ;82AAE4|6B      |      ;
 
 
.sickle:
    REP #$30                                                   ;82AAE5|C230    |      ;
    LDA.W #$0001                                               ;82AAE7|A90100  |      ;
    JSL.L fObjectEngine_GetObjectPropertyByDirSeason                                      ;82AAEA|2261AC82|82AC61;
    CPX.W #$00A0                                               ;82AAEE|E0A000  |      ;
    BCS +                                                      ;82AAF1|B011    |82AB04;
    CPX.W #$0000                                               ;82AAF3|E00000  |      ;
    BEQ +                                                      ;82AAF6|F00C    |82AB04;
    SEP #$20                                                   ;82AAF8|E220    |      ;
    AND.B #$01                                                 ;82AAFA|2901    |      ;
    BEQ +                                                      ;82AAFC|F006    |82AB04;
    REP #$20                                                   ;82AAFE|C220    |      ;
    LDA.W #$0001                                               ;82AB00|A90100  |      ;
    RTL                                                        ;82AB03|6B      |      ;
 
 
  + REP #$20                                                   ;82AB04|C220    |      ;
    LDA.W #$0000                                               ;82AB06|A90000  |      ;
    RTL                                                        ;82AB09|6B      |      ;
 
 
.plow:
    REP #$30                                                   ;82AB0A|C230    |      ;
    LDA.W #$0001                                               ;82AB0C|A90100  |      ;
    JSL.L fObjectEngine_GetObjectPropertyByDirSeason                                      ;82AB0F|2261AC82|82AC61;
    CPX.W #$00A0                                               ;82AB13|E0A000  |      ;
    BCS +                                                      ;82AB16|B011    |82AB29;
    CPX.W #$0000                                               ;82AB18|E00000  |      ;
    BEQ +                                                      ;82AB1B|F00C    |82AB29;
    SEP #$20                                                   ;82AB1D|E220    |      ;
    AND.B #$02                                                 ;82AB1F|2902    |      ;
    BEQ +                                                      ;82AB21|F006    |82AB29;
    REP #$20                                                   ;82AB23|C220    |      ;
    LDA.W #$0001                                               ;82AB25|A90100  |      ;
    RTL                                                        ;82AB28|6B      |      ;
 
 
  + REP #$20                                                   ;82AB29|C220    |      ;
    LDA.W #$0000                                               ;82AB2B|A90000  |      ;
    RTL                                                        ;82AB2E|6B      |      ;
 
 
.hammer:
    REP #$30                                                   ;82AB2F|C230    |      ;
    LDA.W #$0001                                               ;82AB31|A90100  |      ;
    JSL.L fObjectEngine_GetObjectPropertyByDirSeason                                      ;82AB34|2261AC82|82AC61;
    CPX.W #$00A0                                               ;82AB38|E0A000  |      ;
    BCS +                                                      ;82AB3B|B011    |82AB4E;
    CPX.W #$0000                                               ;82AB3D|E00000  |      ;
    BEQ +                                                      ;82AB40|F00C    |82AB4E;
    SEP #$20                                                   ;82AB42|E220    |      ;
    AND.B #$04                                                 ;82AB44|2904    |      ;
    BEQ +                                                      ;82AB46|F006    |82AB4E;
    REP #$20                                                   ;82AB48|C220    |      ;
    LDA.W #$0001                                               ;82AB4A|A90100  |      ;
    RTL                                                        ;82AB4D|6B      |      ;
 
 
  + REP #$20                                                   ;82AB4E|C220    |      ;
    LDA.W #$0000                                               ;82AB50|A90000  |      ;
    RTL                                                        ;82AB53|6B      |      ;
 
 
.axe:
    REP #$30                                                   ;82AB54|C230    |      ;
    LDA.W #$0001                                               ;82AB56|A90100  |      ;
    JSL.L fObjectEngine_GetObjectPropertyByDirSeason                                      ;82AB59|2261AC82|82AC61;
    CPX.W #$00A0                                               ;82AB5D|E0A000  |      ;
    BCS +                                                      ;82AB60|B011    |82AB73;
    CPX.W #$0000                                               ;82AB62|E00000  |      ;
    BEQ +                                                      ;82AB65|F00C    |82AB73;
    SEP #$20                                                   ;82AB67|E220    |      ;
    AND.B #$08                                                 ;82AB69|2908    |      ;
    BEQ +                                                      ;82AB6B|F006    |82AB73;
    REP #$20                                                   ;82AB6D|C220    |      ;
    LDA.W #$0001                                               ;82AB6F|A90100  |      ;
    RTL                                                        ;82AB72|6B      |      ;
 
 
  + REP #$20                                                   ;82AB73|C220    |      ;
    LDA.W #$0000                                               ;82AB75|A90000  |      ;
    RTL                                                        ;82AB78|6B      |      ;
 
 
.wateringCan:
    SEP #$20                                                   ;82AB79|E220    |      ;
    LDA.B strcMap.loadAreaId                                   ;82AB7B|A522    |000022;
    CMP.B #$04                                                 ;82AB7D|C904    |      ;
    BCC +                                                      ;82AB7F|9021    |82ABA2;
    CMP.B #$10                                                 ;82AB81|C910    |      ;
    BCC .wcreturn2                                             ;82AB83|9060    |82ABE5;
    CMP.B #$3D                                                 ;82AB85|C93D    |      ;
    BCS +                                                      ;82AB87|B019    |82ABA2;
    CMP.B #$14                                                 ;82AB89|C914    |      ;
    BCS .wcreturn2                                             ;82AB8B|B058    |82ABE5;
    REP #$30                                                   ;82AB8D|C230    |      ;
    LDA.W #$0001                                               ;82AB8F|A90100  |      ;
    JSL.L fObjectEngine_GetObjectPropertyByDirSeason                                      ;82AB92|2261AC82|82AC61;
    CPX.W #$00F0                                               ;82AB96|E0F000  |      ;
    BEQ .wcreturn1                                             ;82AB99|F044    |82ABDF;
    CPX.W #$00F4                                               ;82AB9B|E0F400  |      ;
    BEQ .wcreturn1                                             ;82AB9E|F03F    |82ABDF;
    BRA .wcreturn2                                             ;82ABA0|8043    |82ABE5;
 
 
  + REP #$30                                                   ;82ABA2|C230    |      ;
    LDA.W #$0001                                               ;82ABA4|A90100  |      ;
    JSL.L fObjectEngine_GetObjectPropertyByDirSeason                                      ;82ABA7|2261AC82|82AC61;
    CPX.W #$00F0                                               ;82ABAB|E0F000  |      ;
    BEQ .wcreturn1                                             ;82ABAE|F02F    |82ABDF;
    CPX.W #$00F9                                               ;82ABB0|E0F900  |      ;
    BEQ .wcreturn1                                             ;82ABB3|F02A    |82ABDF;
    CPX.W #$00FA                                               ;82ABB5|E0FA00  |      ;
    BEQ .wcreturn1                                             ;82ABB8|F025    |82ABDF;
    CPX.W #$00FB                                               ;82ABBA|E0FB00  |      ;
    BEQ .wcreturn1                                             ;82ABBD|F020    |82ABDF;
    CPX.W #$00FC                                               ;82ABBF|E0FC00  |      ;
    BEQ .wcreturn1                                             ;82ABC2|F01B    |82ABDF;
    CPX.W #$00FD                                               ;82ABC4|E0FD00  |      ;
    BEQ .wcreturn1                                             ;82ABC7|F016    |82ABDF;
    CPX.W #$00A0                                               ;82ABC9|E0A000  |      ;
    BCS .wcreturn2                                             ;82ABCC|B017    |82ABE5;
    CPX.W #$0000                                               ;82ABCE|E00000  |      ;
    BEQ .wcreturn2                                             ;82ABD1|F012    |82ABE5;
    SEP #$20                                                   ;82ABD3|E220    |      ;
    AND.B #$10                                                 ;82ABD5|2910    |      ;
    BEQ .wcreturn2                                             ;82ABD7|F00C    |82ABE5;
    REP #$20                                                   ;82ABD9|C220    |      ;
    LDA.W #$0001                                               ;82ABDB|A90100  |      ;
    RTL                                                        ;82ABDE|6B      |      ;
 
 
.wcreturn1:
    REP #$20                                                   ;82ABDF|C220    |      ;
    LDA.W #$0002                                               ;82ABE1|A90200  |      ;
    RTL                                                        ;82ABE4|6B      |      ;
 
 
.wcreturn2:
    REP #$20                                                   ;82ABE5|C220    |      ;
    LDA.W #$0000                                               ;82ABE7|A90000  |      ;
    RTL                                                        ;82ABEA|6B      |      ;
 
 
.sprinkler:
    REP #$30                                                   ;82ABEB|C230    |      ;
    LDA.W #$0001                                               ;82ABED|A90100  |      ;
    JSL.L fObjectEngine_GetObjectPropertyByDirSeason                                      ;82ABF0|2261AC82|82AC61;
    CPX.W #$00A0                                               ;82ABF4|E0A000  |      ;
    BCS +                                                      ;82ABF7|B011    |82AC0A;
    CPX.W #$0000                                               ;82ABF9|E00000  |      ;
    BEQ +                                                      ;82ABFC|F00C    |82AC0A;
    SEP #$20                                                   ;82ABFE|E220    |      ;
    AND.B #$10                                                 ;82AC00|2910    |      ;
    BEQ +                                                      ;82AC02|F006    |82AC0A;
    REP #$20                                                   ;82AC04|C220    |      ;
    LDA.W #$0001                                               ;82AC06|A90100  |      ;
    RTL                                                        ;82AC09|6B      |      ;
 
 
  + REP #$20                                                   ;82AC0A|C220    |      ;
    LDA.W #$0000                                               ;82AC0C|A90000  |      ;
    RTL                                                        ;82AC0F|6B      |      ;
 
 
.anySeedBag:
    REP #$30                                                   ;82AC10|C230    |      ;
    LDA.W #$0001                                               ;82AC12|A90100  |      ;
    JSL.L fObjectEngine_GetObjectPropertyByDirSeason                                      ;82AC15|2261AC82|82AC61;
    CPX.W #$00A0                                               ;82AC19|E0A000  |      ;
    BCS +                                                      ;82AC1C|B011    |82AC2F;
    CPX.W #$0000                                               ;82AC1E|E00000  |      ;
    BEQ +                                                      ;82AC21|F00C    |82AC2F;
    SEP #$20                                                   ;82AC23|E220    |      ;
    AND.B #$20                                                 ;82AC25|2920    |      ;
    BEQ +                                                      ;82AC27|F006    |82AC2F;
    REP #$20                                                   ;82AC29|C220    |      ;
    LDA.W #$0001                                               ;82AC2B|A90100  |      ;
    RTL                                                        ;82AC2E|6B      |      ;
 
 
  + REP #$20                                                   ;82AC2F|C220    |      ;
    LDA.W #$0000                                               ;82AC31|A90000  |      ;
    RTL                                                        ;82AC34|6B      |      ;
 
 
.paint:
    SEP #$20                                                   ;82AC35|E220    |      ;
    LDA.B strcMap.loadAreaId                                   ;82AC37|A522    |000022;
    CMP.B #$04                                                 ;82AC39|C904    |      ;
    BCS ..return0                                              ;82AC3B|B01E    |82AC5B;
    REP #$30                                                   ;82AC3D|C230    |      ;
    LDA.W #$0001                                               ;82AC3F|A90100  |      ;
    JSL.L fObjectEngine_GetObjectPropertyByDirSeason                                      ;82AC42|2261AC82|82AC61;
    CPX.W #$00C3                                               ;82AC46|E0C300  |      ;
    BEQ ..return1                                              ;82AC49|F00A    |82AC55;
    CPX.W #$00E2                                               ;82AC4B|E0E200  |      ;
    BCC ..return0                                              ;82AC4E|900B    |82AC5B;
    CPX.W #$00E5                                               ;82AC50|E0E500  |      ;
    BCS ..return0                                              ;82AC53|B006    |82AC5B;
 
..return1:
    REP #$20                                                   ;82AC55|C220    |      ;
    LDA.W #$0001                                               ;82AC57|A90100  |      ;
    RTL                                                        ;82AC5A|6B      |      ;
 
 
..return0:
    REP #$20                                                   ;82AC5B|C220    |      ;
    LDA.W #$0000                                               ;82AC5D|A90000  |      ;
    RTL                                                        ;82AC60|6B      |      ;
 
 
fObjectEngine_GetObjectPropertyByDirSeason:
    REP #$30                                                   ;82AC61|C230    |      ; A: nArg1, X: nPosX, Y: nPosY
    STA.B strcVariables.n16Temp3                               ;82AC63|8582    |000082;
    REP #$20                                                   ;82AC65|C220    |      ;
    %CheckFlag(daily2, $0008)
    BEQ +                                                      ;82AC6E|F003    |82AC73;
    JMP.W .return                                              ;82AC70|4CF5AC  |82ACF5;
 
 
  + JSL.L fObjectEngine_GetObjectAtCoords                      ;82AC73|2224B182|82B124;
    SEP #$20                                                   ;82AC77|E220    |      ;
    XBA                                                        ;82AC79|EB      |      ;
    LDA.B #$00                                                 ;82AC7A|A900    |      ;
    XBA                                                        ;82AC7C|EB      |      ;
    TAX                                                        ;82AC7D|AA      |      ;
    REP #$20                                                   ;82AC7E|C220    |      ;
    PHX                                                        ;82AC80|DA      |      ;
    PHA                                                        ;82AC81|48      |      ;
    ASL A                                                      ;82AC82|0A      |      ;
    ASL A                                                      ;82AC83|0A      |      ;
    INC A                                                      ;82AC84|1A      |      ;
    INC A                                                      ;82AC85|1A      |      ;
    INC A                                                      ;82AC86|1A      |      ;
    TAY                                                        ;82AC87|A8      |      ; Y = A * 7
    LDA.B strcPlayer.direction                                 ;82AC88|A5DA    |0000DA;
    ASL A                                                      ;82AC8A|0A      |      ;
    TAX                                                        ;82AC8B|AA      |      ; X = $DA * 2
    LDA.L .data1,X                                             ;82AC8C|BFFEAC82|82ACFE;
    STA.B strcVariables.n16Temp4                               ;82AC90|8584    |000084;
    SEP #$20                                                   ;82AC92|E220    |      ;
    LDA.B #$00                                                 ;82AC94|A900    |      ;
    XBA                                                        ;82AC96|EB      |      ;
    LDA.B [strcMap.pSelected],Y                                ;82AC97|B70D    |00000D;
    REP #$20                                                   ;82AC99|C220    |      ;
    AND.B strcVariables.n16Temp4                               ;82AC9B|2584    |000084;
    BEQ +                                                      ;82AC9D|F02D    |82ACCC;
    SEP #$20                                                   ;82AC9F|E220    |      ;
    LDA.B #$00                                                 ;82ACA1|A900    |      ;
    XBA                                                        ;82ACA3|EB      |      ;
    LDA.L nCurrentSeasonID                                     ;82ACA4|AF191F7F|7F1F19;
    REP #$20                                                   ;82ACA8|C220    |      ;
    ASL A                                                      ;82ACAA|0A      |      ;
    TAX                                                        ;82ACAB|AA      |      ; X = nSeasonId * 2
    LDA.L .data2,X                                             ;82ACAC|BF06AD82|82AD06;
    STA.B strcVariables.n16Temp4                               ;82ACB0|8584    |000084;
    SEP #$20                                                   ;82ACB2|E220    |      ;
    LDA.B #$00                                                 ;82ACB4|A900    |      ;
    XBA                                                        ;82ACB6|EB      |      ;
    LDA.B [strcMap.pSelected],Y                                ;82ACB7|B70D    |00000D;
    REP #$20                                                   ;82ACB9|C220    |      ;
    AND.B strcVariables.n16Temp4                               ;82ACBB|2584    |000084;
    BEQ +                                                      ;82ACBD|F00D    |82ACCC;
    REP #$30                                                   ;82ACBF|C230    |      ;
    PLA                                                        ;82ACC1|68      |      ;
    PLX                                                        ;82ACC2|FA      |      ;
    ASL A                                                      ;82ACC3|0A      |      ;
    ASL A                                                      ;82ACC4|0A      |      ;
    ADC.B strcVariables.n16Temp3                               ;82ACC5|6582    |000082;
    TAY                                                        ;82ACC7|A8      |      ;
    LDA.B [strcMap.pSelected],Y                                ;82ACC8|B70D    |00000D;
    BRA .justReturn                                            ;82ACCA|8031    |82ACFD;
 
 
  + REP #$30                                                   ;82ACCC|C230    |      ;
    TYA                                                        ;82ACCE|98      |      ;
    DEC A                                                      ;82ACCF|3A      |      ;
    TAY                                                        ;82ACD0|A8      |      ;
    SEP #$20                                                   ;82ACD1|E220    |      ;
    LDA.B [strcMap.pSelected],Y                                ;82ACD3|B70D    |00000D;
    AND.B #$80                                                 ;82ACD5|2980    |      ;
    BNE +                                                      ;82ACD7|D010    |82ACE9;
    REP #$20                                                   ;82ACD9|C220    |      ;
    PLA                                                        ;82ACDB|68      |      ;
    PLX                                                        ;82ACDC|FA      |      ;
    ASL A                                                      ;82ACDD|0A      |      ;
    ASL A                                                      ;82ACDE|0A      |      ;
    ADC.B strcVariables.n16Temp3                               ;82ACDF|6582    |000082;
    TAY                                                        ;82ACE1|A8      |      ;
    LDA.B [strcMap.pSelected],Y                                ;82ACE2|B70D    |00000D;
    LDX.W #$0000                                               ;82ACE4|A20000  |      ;
    BRA .justReturn                                            ;82ACE7|8014    |82ACFD;
 
 
  + REP #$30                                                   ;82ACE9|C230    |      ;
    PLA                                                        ;82ACEB|68      |      ;
    PLX                                                        ;82ACEC|FA      |      ;
    LDA.W #$0000                                               ;82ACED|A90000  |      ;
    LDX.W #$0000                                               ;82ACF0|A20000  |      ;
    BRA .justReturn                                            ;82ACF3|8008    |82ACFD;
 
 
.return:
    REP #$30                                                   ;82ACF5|C230    |      ;
    LDA.W #$0000                                               ;82ACF7|A90000  |      ;
    LDX.W #$0000                                               ;82ACFA|A20000  |      ;
 
.justReturn:
    RTL                                                        ;82ACFD|6B      |      ;
 
 
.data1:
    dw $0001,$0002,$0004,$0008                                 ;82ACFE|        |      ; 0x04 * [n16][nSeasonId]
 
.data2:
    dw $0010,$0020,$0040,$0080                                 ;82AD06|        |      ; 0x04 * [n16][nSeasonId]
 
fPlayer_InteractWithFrontObject:
    SEP #$20                                                   ;82AD0E|E220    |      ;
    REP #$10                                                   ;82AD10|C210    |      ;
    CPX.W #$00F0                                               ;82AD12|E0F000  |      ;
    BCC +                                                      ;82AD15|9003    |82AD1A;
    JMP.W .case00F0                                            ;82AD17|4CBAAE  |82AEBA;
 
 
  + CPX.W #$00E0                                               ;82AD1A|E0E000  |      ;
    BCC +                                                      ;82AD1D|9003    |82AD22;
    JMP.W .case00E0                                            ;82AD1F|4CB8AE  |82AEB8;
 
 
  + CPX.W #$00D0                                               ;82AD22|E0D000  |      ;
    BCC +                                                      ;82AD25|9003    |82AD2A;
    JMP.W .case00D0                                            ;82AD27|4C9BAE  |82AE9B;
 
 
  + CPX.W #$00C0                                               ;82AD2A|E0C000  |      ;
    BCC +                                                      ;82AD2D|9003    |82AD32;
    JMP.W .case00C0                                            ;82AD2F|4CE0AD  |82ADE0;
 
 
  + SEP #$20                                                   ;82AD32|E220    |      ;
    LDA.L nCurrentSeasonID                                     ;82AD34|AF191F7F|7F1F19;
    CMP.B #$02                                                 ;82AD38|C902    |      ;
    BEQ +                                                      ;82AD3A|F006    |82AD42;
    CMP.B #$03                                                 ;82AD3C|C903    |      ;
    BEQ +                                                      ;82AD3E|F002    |82AD42;
    BRA .notWinterNotFall                                      ;82AD40|8042    |82AD84;
 
 
  + REP #$30                                                   ;82AD42|C230    |      ;
    CPX.W #$0038                                               ;82AD44|E03800  |      ;
    BNE +                                                      ;82AD47|D003    |82AD4C;
    JMP.W .justReturn                                          ;82AD49|4CE5AE  |82AEE5;
 
 
  + CPX.W #$0039                                               ;82AD4C|E03900  |      ;
    BNE +                                                      ;82AD4F|D003    |82AD54;
    JMP.W .justReturn                                          ;82AD51|4CE5AE  |82AEE5;
 
 
  + CPX.W #$0052                                               ;82AD54|E05200  |      ;
    BNE +                                                      ;82AD57|D003    |82AD5C;
    JMP.W .justReturn                                          ;82AD59|4CE5AE  |82AEE5;
 
 
  + CPX.W #$0053                                               ;82AD5C|E05300  |      ;
    BNE +                                                      ;82AD5F|D003    |82AD64;
    JMP.W .justReturn                                          ;82AD61|4CE5AE  |82AEE5;
 
 
  + CPX.W #$0060                                               ;82AD64|E06000  |      ;
    BNE +                                                      ;82AD67|D003    |82AD6C;
    JMP.W .justReturn                                          ;82AD69|4CE5AE  |82AEE5;
 
 
  + CPX.W #$0061                                               ;82AD6C|E06100  |      ;
    BNE +                                                      ;82AD6F|D003    |82AD74;
    JMP.W .justReturn                                          ;82AD71|4CE5AE  |82AEE5;
 
 
  + CPX.W #$006E                                               ;82AD74|E06E00  |      ;
    BNE +                                                      ;82AD77|D003    |82AD7C;
    JMP.W .justReturn                                          ;82AD79|4CE5AE  |82AEE5;
 
 
  + CPX.W #$006F                                               ;82AD7C|E06F00  |      ;
    BNE .notWinterNotFall                                      ;82AD7F|D003    |82AD84;
    JMP.W .justReturn                                          ;82AD81|4CE5AE  |82AEE5;
 
 
.notWinterNotFall:
    REP #$20                                                   ;82AD84|C220    |      ;
    TXA                                                        ;82AD86|8A      |      ;
    ASL A                                                      ;82AD87|0A      |      ;
    ASL A                                                      ;82AD88|0A      |      ;
    TAY                                                        ;82AD89|A8      |      ;
    INY                                                        ;82AD8A|C8      |      ;
    SEP #$20                                                   ;82AD8B|E220    |      ;
    LDA.B [strcMap.pSelected],Y                                ;82AD8D|B70D    |00000D;
    AND.B #$80                                                 ;82AD8F|2980    |      ;
    BNE +                                                      ;82AD91|D003    |82AD96;
    JMP.W .label1                                              ;82AD93|4CC5AD  |82ADC5;
 
 
  + DEY                                                        ;82AD96|88      |      ;
    LDA.B [strcMap.pSelected],Y                                ;82AD97|B70D    |00000D;
    STA.W strcPlayerData.unkMap91F                             ;82AD99|8D1F09  |00091F;
    REP #$20                                                   ;82AD9C|C220    |      ;
    TXA                                                        ;82AD9E|8A      |      ;
    ASL A                                                      ;82AD9F|0A      |      ;
    ASL A                                                      ;82ADA0|0A      |      ;
    STA.B strcVariables.n16Temp1                               ;82ADA1|857E    |00007E;
    SEP #$20                                                   ;82ADA3|E220    |      ;
    LDA.B #$00                                                 ;82ADA5|A900    |      ;
    XBA                                                        ;82ADA7|EB      |      ;
    LDA.L nCurrentSeasonID                                     ;82ADA8|AF191F7F|7F1F19;
    REP #$20                                                   ;82ADAC|C220    |      ;
    CLC                                                        ;82ADAE|18      |      ;
    ADC.B strcVariables.n16Temp1                               ;82ADAF|657E    |00007E;
    TAX                                                        ;82ADB1|AA      |      ;
    SEP #$20                                                   ;82ADB2|E220    |      ;
    LDA.L aInteractionItemTable,X                              ;82ADB4|BFB4CF82|82CFB4;
    STA.W strcPlayerData.carryItemId                           ;82ADB8|8D1D09  |00091D;
    %SetPlayerAction(!PACTION_ITEMONHAND)
    JMP.W .justReturn                                          ;82ADC2|4CE5AE  |82AEE5;
 
 
.label1:
    SEP #$20                                                   ;82ADC5|E220    |      ;
    INY                                                        ;82ADC7|C8      |      ;
    LDA.B [strcMap.pSelected],Y                                ;82ADC8|B70D    |00000D;
    AND.B #$01                                                 ;82ADCA|2901    |      ;
    BNE +                                                      ;82ADCC|D003    |82ADD1;
    JMP.W .return                                              ;82ADCE|4CE6AE  |82AEE6;
 
 
  + %CheckPlayerFlags(!PFLAGS_INSPRINGS)
    BEQ +                                                      ;82ADD8|F003    |82ADDD;
    JMP.W .justReturn                                          ;82ADDA|4CE5AE  |82AEE5;
 
 
  + JMP.W .justReturn                                          ;82ADDD|4CE5AE  |82AEE5;
 
 
.case00C0:
    REP #$20                                                   ;82ADE0|C220    |      ;
    TXA                                                        ;82ADE2|8A      |      ;
    ASL A                                                      ;82ADE3|0A      |      ;
    ASL A                                                      ;82ADE4|0A      |      ;
    TAY                                                        ;82ADE5|A8      |      ;
    SEP #$20                                                   ;82ADE6|E220    |      ;
    LDA.B #$00                                                 ;82ADE8|A900    |      ;
    XBA                                                        ;82ADEA|EB      |      ;
    LDA.B [strcMap.pSelected],Y                                ;82ADEB|B70D    |00000D;
    STA.B strcVariables.n8Temp1                                ;82ADED|8592    |000092;
    INY                                                        ;82ADEF|C8      |      ;
    LDA.B [strcMap.pSelected],Y                                ;82ADF0|B70D    |00000D;
    STA.B strcVariables.n8Temp2                                ;82ADF2|8593    |000093;
    BNE +                                                      ;82ADF4|D003    |82ADF9;
    JMP.W .justReturn                                          ;82ADF6|4CE5AE  |82AEE5;
 
 
  + LDA.B #$00                                                 ;82ADF9|A900    |      ;
    XBA                                                        ;82ADFB|EB      |      ;
    LDA.B strcVariables.n8Temp1                                ;82ADFC|A592    |000092;
    REP #$20                                                   ;82ADFE|C220    |      ;
    ASL A                                                      ;82AE00|0A      |      ;
    ASL A                                                      ;82AE01|0A      |      ;
    ASL A                                                      ;82AE02|0A      |      ;
    INC A                                                      ;82AE03|1A      |      ;
    INC A                                                      ;82AE04|1A      |      ;
    INC A                                                      ;82AE05|1A      |      ;
    TAX                                                        ;82AE06|AA      |      ;
    SEP #$20                                                   ;82AE07|E220    |      ;
    LDA.L aScreenTransitionTable,X                             ;82AE09|BFF5B680|80B6F5;
    AND.B #$02                                                 ;82AE0D|2902    |      ;
    BEQ +                                                      ;82AE0F|F00A    |82AE1B;
    LDA.L nCurrentTimeID                                       ;82AE11|AF1C1F7F|7F1F1C;
    CMP.B #$11                                                 ;82AE15|C911    |      ;
    BCC +                                                      ;82AE17|9002    |82AE1B;
    BRA .label2                                                ;82AE19|8066    |82AE81;
 
 
  + SEP #$20                                                   ;82AE1B|E220    |      ;
    LDA.L aScreenTransitionTable,X                             ;82AE1D|BFF5B680|80B6F5;
    AND.B #$04                                                 ;82AE21|2904    |      ;
    BEQ +                                                      ;82AE23|F00A    |82AE2F;
    LDA.L nCurrentTimeID                                       ;82AE25|AF1C1F7F|7F1F1C;
    CMP.B #$11                                                 ;82AE29|C911    |      ;
    BCS +                                                      ;82AE2B|B002    |82AE2F;
    BRA .label2                                                ;82AE2D|8052    |82AE81;
 
 
  + SEP #$20                                                   ;82AE2F|E220    |      ;
    LDA.L aScreenTransitionTable,X                             ;82AE31|BFF5B680|80B6F5;
    AND.B #$08                                                 ;82AE35|2908    |      ;
    BEQ +                                                      ;82AE37|F00C    |82AE45;
    LDA.L nCurrentWeekdayID                                    ;82AE39|AF1A1F7F|7F1F1A;
    BEQ +                                                      ;82AE3D|F006    |82AE45;
    CMP.B #$06                                                 ;82AE3F|C906    |      ;
    BEQ +                                                      ;82AE41|F002    |82AE45;
    BRA .label2                                                ;82AE43|803C    |82AE81;
 
 
  + SEP #$20                                                   ;82AE45|E220    |      ;
    LDA.L aScreenTransitionTable,X                             ;82AE47|BFF5B680|80B6F5;
    AND.B #$10                                                 ;82AE4B|2910    |      ;
    BEQ +                                                      ;82AE4D|F00A    |82AE59;
    LDA.L nCurrentWeekdayID                                    ;82AE4F|AF1A1F7F|7F1F1A;
    CMP.B #$06                                                 ;82AE53|C906    |      ;
    BNE +                                                      ;82AE55|D002    |82AE59;
    BRA .label2                                                ;82AE57|8028    |82AE81;
 
 
  + SEP #$20                                                   ;82AE59|E220    |      ;
    LDA.L aScreenTransitionTable,X                             ;82AE5B|BFF5B680|80B6F5;
    AND.B #$20                                                 ;82AE5F|2920    |      ;
    BEQ +                                                      ;82AE61|F008    |82AE6B;
    LDA.L nCurrentWeekdayID                                    ;82AE63|AF1A1F7F|7F1F1A;
    BNE +                                                      ;82AE67|D002    |82AE6B;
    BRA .label2                                                ;82AE69|8016    |82AE81;
 
 
  + SEP #$20                                                   ;82AE6B|E220    |      ;
    LDA.L aScreenTransitionTable,X                             ;82AE6D|BFF5B680|80B6F5;
    AND.B #$80                                                 ;82AE71|2980    |      ;
    BEQ .justReturn                                            ;82AE73|F070    |82AEE5;
    REP #$20                                                   ;82AE75|C220    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;82AE77|AD9601  |000196;
    AND.W #$0010                                               ;82AE7A|291000  |      ;
    BEQ .justReturn                                            ;82AE7D|F066    |82AEE5;
    BRA .label2                                                ;82AE7F|8000    |82AE81;
 
 
.label2:
    SEP #$20                                                   ;82AE81|E220    |      ;
    LDA.B #$02                                                 ;82AE83|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;82AE85|8D9A01  |00019A;
    LDA.B #$00                                                 ;82AE88|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;82AE8A|8D9101  |000191;
    LDA.B #$00                                                 ;82AE8D|A900    |      ;
    XBA                                                        ;82AE8F|EB      |      ;
    LDA.B strcVariables.n8Temp2                                ;82AE90|A593    |000093;
    REP #$20                                                   ;82AE92|C220    |      ;
    TAX                                                        ;82AE94|AA      |      ;
    JSL.L fDialog_DialogHandler                                ;82AE95|225F9383|83935F;
    BRA .justReturn                                            ;82AE99|804A    |82AEE5;
 
 
.case00D0:
    REP #$20                                                   ;82AE9B|C220    |      ;
    TXA                                                        ;82AE9D|8A      |      ;
    ASL A                                                      ;82AE9E|0A      |      ;
    ASL A                                                      ;82AE9F|0A      |      ;
    TAY                                                        ;82AEA0|A8      |      ;
    LDA.B [strcMap.pSelected],Y                                ;82AEA1|B70D    |00000D;
    TAX                                                        ;82AEA3|AA      |      ;
    SEP #$20                                                   ;82AEA4|E220    |      ;
    REP #$10                                                   ;82AEA6|C210    |      ;
    LDA.B #$02                                                 ;82AEA8|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;82AEAA|8D9A01  |00019A;
    LDA.B #$00                                                 ;82AEAD|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;82AEAF|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;82AEB2|225F9383|83935F;
    BRA .justReturn                                            ;82AEB6|802D    |82AEE5;
 
 
.case00E0:
    BRA .justReturn                                            ;82AEB8|802B    |82AEE5;
 
 
.case00F0:
    REP #$20                                                   ;82AEBA|C220    |      ;
    TXA                                                        ;82AEBC|8A      |      ;
    ASL A                                                      ;82AEBD|0A      |      ;
    ASL A                                                      ;82AEBE|0A      |      ;
    TAY                                                        ;82AEBF|A8      |      ;
    INY                                                        ;82AEC0|C8      |      ;
    SEP #$20                                                   ;82AEC1|E220    |      ;
    LDA.B [strcMap.pSelected],Y                                ;82AEC3|B70D    |00000D;
    AND.B #$01                                                 ;82AEC5|2901    |      ;
    BEQ .justReturn                                            ;82AEC7|F01C    |82AEE5;
    DEY                                                        ;82AEC9|88      |      ;
    LDA.B [strcMap.pSelected],Y                                ;82AECA|B70D    |00000D;
    STA.W nPlayerInteractionIndex                              ;82AECC|8D6E09  |00096E;
    STZ.W nPlayerInteractionArg1                               ;82AECF|9C6F09  |00096F;
    STZ.W nPlayerInteractionArg2                               ;82AED2|9C7009  |000970;
    %SetPlayerFlag(!PFLAGS_INTERACTING)
    %SetPlayerAction(!PACTION_NONE)
 
.justReturn:
    RTL                                                        ;82AEE5|6B      |      ;
 
 
.return:
    REP #$20                                                   ;82AEE6|C220    |      ;
    LDA.B strcPlayer.posX                                      ;82AEE8|A5D6    |0000D6;
    STA.B strcPlayer.lastX                                     ;82AEEA|85DF    |0000DF;
    LDA.B strcPlayer.posY                                      ;82AEEC|A5D8    |0000D8;
    STA.B strcPlayer.lastY                                     ;82AEEE|85E1    |0000E1;
    STZ.B strcPlayer.newX                                      ;82AEF0|64E5    |0000E5;
    STZ.B strcPlayer.newY                                      ;82AEF2|64E7    |0000E7;
    LDA.W #$0010                                               ;82AEF4|A91000  |      ;
    STA.B strcPlayer.unkE3                                     ;82AEF7|85E3    |0000E3;
    LDA.B strcPlayer.direction                                 ;82AEF9|A5DA    |0000DA;
    JSL.L fGameEngine_DirectionHandler83AD91                   ;82AEFB|2291AD83|83AD91;
    RTL                                                        ;82AEFF|6B      |      ;
 
 
fObjectMap_ConnectAdjacentObjectTiles:
    REP #$30                                                   ;82AF00|C230    |      ;
    LDY.W #$0000                                               ;82AF02|A00000  |      ;
 
.loop:
    LDX.W #$0000                                               ;82AF05|A20000  |      ;
 
.continue:
    PHY                                                        ;82AF08|5A      |      ;
    PHX                                                        ;82AF09|DA      |      ;
    STX.B strcVariables.n16Temp3                               ;82AF0A|8682    |000082;
    STY.B strcVariables.n16Temp4                               ;82AF0C|8484    |000084;
    JSR.W fObjectEngine_ConvertCoordsToOffset                  ;82AF0E|203CB1  |82B13C;
    SEP #$20                                                   ;82AF11|E220    |      ;
    REP #$10                                                   ;82AF13|C210    |      ;
    LDA.W sCurrentObjectMap,X                                  ;82AF15|BDB609  |0009B6;
    BNE +                                                      ;82AF18|D003    |82AF1D;
    JMP.W .caseA0                                              ;82AF1A|4C09B0  |82B009;
 
 
  + CMP.B #$A0                                                 ;82AF1D|C9A0    |      ;
    BCC +                                                      ;82AF1F|9003    |82AF24;
    JMP.W .caseA0                                              ;82AF21|4C09B0  |82B009;
 
 
  + CMP.B #$73                                                 ;82AF24|C973    |      ;
    BCS +                                                      ;82AF26|B003    |82AF2B;
    JMP.W .case7A                                              ;82AF28|4CE5AF  |82AFE5;
 
 
  + CMP.B #$7A                                                 ;82AF2B|C97A    |      ;
    BCC +                                                      ;82AF2D|9003    |82AF32;
    JMP.W .case7A                                              ;82AF2F|4CE5AF  |82AFE5;
 
 
  + REP #$20                                                   ;82AF32|C220    |      ;
    STZ.B strcVariables.n16Unk86                               ;82AF34|6486    |000086;
    PHX                                                        ;82AF36|DA      |      ;
    TXA                                                        ;82AF37|8A      |      ;
    SEC                                                        ;82AF38|38      |      ;
    SBC.W #$0001                                               ;82AF39|E90100  |      ;
    TAX                                                        ;82AF3C|AA      |      ;
    SEP #$20                                                   ;82AF3D|E220    |      ;
    REP #$10                                                   ;82AF3F|C210    |      ;
    LDA.W sCurrentObjectMap,X                                  ;82AF41|BDB609  |0009B6;
    PLX                                                        ;82AF44|FA      |      ;
    CMP.B #$73                                                 ;82AF45|C973    |      ;
    BCC +                                                      ;82AF47|900D    |82AF56;
    CMP.B #$7A                                                 ;82AF49|C97A    |      ;
    BCS +                                                      ;82AF4B|B009    |82AF56;
    REP #$20                                                   ;82AF4D|C220    |      ;
    LDA.B strcVariables.n16Unk86                               ;82AF4F|A586    |000086;
    ORA.W #$0008                                               ;82AF51|090800  |      ;
    STA.B strcVariables.n16Unk86                               ;82AF54|8586    |000086;
 
  + REP #$30                                                   ;82AF56|C230    |      ;
    PHX                                                        ;82AF58|DA      |      ;
    TXA                                                        ;82AF59|8A      |      ;
    CLC                                                        ;82AF5A|18      |      ;
    ADC.W #$0001                                               ;82AF5B|690100  |      ;
    TAX                                                        ;82AF5E|AA      |      ;
    SEP #$20                                                   ;82AF5F|E220    |      ;
    REP #$10                                                   ;82AF61|C210    |      ;
    LDA.W sCurrentObjectMap,X                                  ;82AF63|BDB609  |0009B6;
    PLX                                                        ;82AF66|FA      |      ;
    CMP.B #$73                                                 ;82AF67|C973    |      ;
    BCC +                                                      ;82AF69|900D    |82AF78;
    CMP.B #$7A                                                 ;82AF6B|C97A    |      ;
    BCS +                                                      ;82AF6D|B009    |82AF78;
    REP #$20                                                   ;82AF6F|C220    |      ;
    LDA.B strcVariables.n16Unk86                               ;82AF71|A586    |000086;
    ORA.W #$0002                                               ;82AF73|090200  |      ;
    STA.B strcVariables.n16Unk86                               ;82AF76|8586    |000086;
 
  + REP #$30                                                   ;82AF78|C230    |      ;
    PHX                                                        ;82AF7A|DA      |      ;
    TXA                                                        ;82AF7B|8A      |      ;
    SEC                                                        ;82AF7C|38      |      ;
    SBC.W #$0040                                               ;82AF7D|E94000  |      ;
    TAX                                                        ;82AF80|AA      |      ;
    SEP #$20                                                   ;82AF81|E220    |      ;
    REP #$10                                                   ;82AF83|C210    |      ;
    LDA.W sCurrentObjectMap,X                                  ;82AF85|BDB609  |0009B6;
    PLX                                                        ;82AF88|FA      |      ;
    CMP.B #$73                                                 ;82AF89|C973    |      ;
    BCC +                                                      ;82AF8B|900D    |82AF9A;
    CMP.B #$7A                                                 ;82AF8D|C97A    |      ;
    BCS +                                                      ;82AF8F|B009    |82AF9A;
    REP #$20                                                   ;82AF91|C220    |      ;
    LDA.B strcVariables.n16Unk86                               ;82AF93|A586    |000086;
    ORA.W #$0004                                               ;82AF95|090400  |      ;
    STA.B strcVariables.n16Unk86                               ;82AF98|8586    |000086;
 
  + REP #$30                                                   ;82AF9A|C230    |      ;
    PHX                                                        ;82AF9C|DA      |      ;
    TXA                                                        ;82AF9D|8A      |      ;
    CLC                                                        ;82AF9E|18      |      ;
    ADC.W #$0040                                               ;82AF9F|694000  |      ;
    TAX                                                        ;82AFA2|AA      |      ;
    SEP #$20                                                   ;82AFA3|E220    |      ;
    REP #$10                                                   ;82AFA5|C210    |      ;
    LDA.W sCurrentObjectMap,X                                  ;82AFA7|BDB609  |0009B6;
    PLX                                                        ;82AFAA|FA      |      ;
    CMP.B #$73                                                 ;82AFAB|C973    |      ;
    BCC +                                                      ;82AFAD|900D    |82AFBC;
    CMP.B #$7A                                                 ;82AFAF|C97A    |      ;
    BCS +                                                      ;82AFB1|B009    |82AFBC;
    REP #$20                                                   ;82AFB3|C220    |      ;
    LDA.B strcVariables.n16Unk86                               ;82AFB5|A586    |000086;
    ORA.W #$0001                                               ;82AFB7|090100  |      ;
    STA.B strcVariables.n16Unk86                               ;82AFBA|8586    |000086;
 
  + REP #$30                                                   ;82AFBC|C230    |      ;
    PHX                                                        ;82AFBE|DA      |      ;
    LDA.B strcVariables.n16Unk86                               ;82AFBF|A586    |000086;
    TAX                                                        ;82AFC1|AA      |      ;
    SEP #$20                                                   ;82AFC2|E220    |      ;
    LDA.L .unknownData,X                                       ;82AFC4|BF2AB082|82B02A;
    DEC A                                                      ;82AFC8|3A      |      ;
    STA.B strcVariables.n8Temp3                                ;82AFC9|8594    |000094;
    PLX                                                        ;82AFCB|FA      |      ;
    SEP #$20                                                   ;82AFCC|E220    |      ;
    LDA.B #$00                                                 ;82AFCE|A900    |      ;
    XBA                                                        ;82AFD0|EB      |      ;
    LDA.W sCurrentObjectMap,X                                  ;82AFD1|BDB609  |0009B6;
    REP #$20                                                   ;82AFD4|C220    |      ;
    ASL A                                                      ;82AFD6|0A      |      ;
    ASL A                                                      ;82AFD7|0A      |      ;
    TAY                                                        ;82AFD8|A8      |      ;
    SEP #$20                                                   ;82AFD9|E220    |      ;
    LDA.B #$00                                                 ;82AFDB|A900    |      ;
    XBA                                                        ;82AFDD|EB      |      ;
    LDA.B [strcMap.pSelected],Y                                ;82AFDE|B70D    |00000D;
    CLC                                                        ;82AFE0|18      |      ;
    ADC.B strcVariables.n8Temp3                                ;82AFE1|6594    |000094;
    BRA +                                                      ;82AFE3|801A    |82AFFF;
 
 
.case7A:
    SEP #$20                                                   ;82AFE5|E220    |      ;
    REP #$10                                                   ;82AFE7|C210    |      ;
    LDA.B #$00                                                 ;82AFE9|A900    |      ;
    XBA                                                        ;82AFEB|EB      |      ;
    LDA.W sCurrentObjectMap,X                                  ;82AFEC|BDB609  |0009B6;
    REP #$20                                                   ;82AFEF|C220    |      ;
    ASL A                                                      ;82AFF1|0A      |      ;
    ASL A                                                      ;82AFF2|0A      |      ;
    TAY                                                        ;82AFF3|A8      |      ;
    SEP #$20                                                   ;82AFF4|E220    |      ;
    LDA.B #$00                                                 ;82AFF6|A900    |      ;
    XBA                                                        ;82AFF8|EB      |      ;
    LDA.B [strcMap.pSelected],Y                                ;82AFF9|B70D    |00000D;
    BEQ .caseA0                                                ;82AFFB|F00C    |82B009;
    REP #$20                                                   ;82AFFD|C220    |      ;
 
  + REP #$30                                                   ;82AFFF|C230    |      ;
    LDX.B strcVariables.n16Temp3                               ;82B001|A682    |000082;
    LDY.B strcVariables.n16Temp4                               ;82B003|A484    |000084;
    JSL.L fMap_CalcTilemapBufferOffset                                      ;82B005|223AA881|81A83A;
 
.caseA0:
    REP #$30                                                   ;82B009|C230    |      ;
    PLX                                                        ;82B00B|FA      |      ;
    PLY                                                        ;82B00C|7A      |      ;
    TXA                                                        ;82B00D|8A      |      ;
    CLC                                                        ;82B00E|18      |      ;
    ADC.W #$0010                                               ;82B00F|691000  |      ;
    TAX                                                        ;82B012|AA      |      ;
    CPX.W #$0400                                               ;82B013|E00004  |      ;
    BEQ +                                                      ;82B016|F003    |82B01B;
    JMP.W .continue                                            ;82B018|4C08AF  |82AF08;
 
 
  + TYA                                                        ;82B01B|98      |      ;
    CLC                                                        ;82B01C|18      |      ;
    ADC.W #$0010                                               ;82B01D|691000  |      ;
    TAY                                                        ;82B020|A8      |      ;
    CPY.W #$0400                                               ;82B021|C00004  |      ;
    BEQ .justReturn                                            ;82B024|F003    |82B029;
    JMP.W .loop                                                ;82B026|4C05AF  |82AF05;
 
 
.justReturn:
    RTL                                                        ;82B029|6B      |      ;
 
 
.unknownData:
    db $09,$02,$07,$01,$07,$04,$07,$04,$09,$03,$08,$02         ;82B02A|        |      ;
    db $09,$06,$08,$05                                         ;82B036|        |      ;
