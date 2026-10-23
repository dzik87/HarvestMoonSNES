; Bank $82 module "object_map" - starts at $82A5FB
 
fObjectMap_LoadData:
    SEP #$20                                                   ;82A5FB|E220    |      ;
    REP #$10                                                   ;82A5FD|C210    |      ;
    LDA.B #$00                                                 ;82A5FF|A900    |      ;
    XBA                                                        ;82A601|EB      |      ; B <-> A
    LDA.B strcMap.loadAreaId                                   ;82A602|A522    |000022;
    CMP.B #$04                                                 ;82A604|C904    |      ;
    BCS .notFarm                                               ;82A606|B013    |82A61B;
    REP #$20                                                   ;82A608|C220    |      ;
    LDA.W #$A4E6                                               ;82A60A|A9E6A4  |      ;
    STA.B ptrTemp0x72                                          ;82A60D|8572    |000072;
    SEP #$20                                                   ;82A60F|E220    |      ;
    LDA.B #$7E                                                 ;82A611|A97E    |      ;
    STA.B ptrTemp0x72+2                                        ;82A613|8574    |000074; $72 = 0x7EA4E6
    LDX.W #$0000                                               ;82A615|A20000  |      ;
    PHX                                                        ;82A618|DA      |      ;
    BRA .label2                                                ;82A619|801A    |82A635;
 
 
.notFarm:
    SEP #$20                                                   ;82A61B|E220    |      ;
    ASL A                                                      ;82A61D|0A      |      ;
    CLC                                                        ;82A61E|18      |      ;
    ADC.B strcMap.loadAreaId                                   ;82A61F|6522    |000022;
    REP #$20                                                   ;82A621|C220    |      ;
    TAX                                                        ;82A623|AA      |      ;
    PHX                                                        ;82A624|DA      |      ;
    LDA.L pObjectMap,X                                         ;82A625|BF74B182|82B174;
    STA.B ptrTemp0x72                                          ;82A629|8572    |000072;
    SEP #$20                                                   ;82A62B|E220    |      ;
    INX                                                        ;82A62D|E8      |      ;
    INX                                                        ;82A62E|E8      |      ;
    LDA.L pObjectMap,X                                         ;82A62F|BF74B182|82B174;
    STA.B ptrTemp0x72+2                                        ;82A633|8574    |000074;
 
.label2:
    REP #$30                                                   ;82A635|C230    |      ;
    PLX                                                        ;82A637|FA      |      ;
    LDA.L pObjectMap2,X                                        ;82A638|BF94B282|82B294;
    STA.B strcMap.pSelected                                    ;82A63C|850D    |00000D;
    INX                                                        ;82A63E|E8      |      ;
    INX                                                        ;82A63F|E8      |      ;
    SEP #$20                                                   ;82A640|E220    |      ;
    LDA.L pObjectMap2,X                                        ;82A642|BF94B282|82B294;
    STA.B strcMap.pSelected+2                                  ;82A646|850F    |00000F;
    SEP #$20                                                   ;82A648|E220    |      ;
    LDY.W #$0000                                               ;82A64A|A00000  |      ;
 
  - TYX                                                        ;82A64D|BB      |      ; copy data
    LDA.B [ptrTemp0x72],Y                                      ;82A64E|B772    |000072;
    STA.W sCurrentObjectMap,X                                  ;82A650|9DB609  |0009B6;
    INY                                                        ;82A653|C8      |      ;
    CPY.W #$1000                                               ;82A654|C00010  |      ;
    BNE -                                                      ;82A657|D0F4    |82A64D;
    RTL                                                        ;82A659|6B      |      ;
 
 
fObjectMap_LoadDefaultFarm:
    REP #$30                                                   ;82A65A|C230    |      ;
    LDX.W #$0000                                               ;82A65C|A20000  |      ;
    LDA.L pObjectMap,X                                         ;82A65F|BF74B182|82B174;
    STA.B ptrTemp0x72                                          ;82A663|8572    |000072;
    INX                                                        ;82A665|E8      |      ;
    INX                                                        ;82A666|E8      |      ;
    SEP #$20                                                   ;82A667|E220    |      ;
    LDA.L pObjectMap,X                                         ;82A669|BF74B182|82B174;
    STA.B ptrTemp0x72+2                                        ;82A66D|8574    |000074;
    SEP #$20                                                   ;82A66F|E220    |      ;
    LDY.W #$0000                                               ;82A671|A00000  |      ;
 
  - TYX                                                        ;82A674|BB      |      ;
    LDA.B [ptrTemp0x72],Y                                      ;82A675|B772    |000072;
    STA.L sFarmTilemap,X                                       ;82A677|9FE6A47E|7EA4E6;
    INY                                                        ;82A67B|C8      |      ;
    CPY.W #$1000                                               ;82A67C|C00010  |      ;
    BNE -                                                      ;82A67F|D0F3    |82A674;
    RTL                                                        ;82A681|6B      |      ;
 
 
fObjectMap_LoadFarm:
    REP #$30                                                   ;82A682|C230    |      ;
    LDA.W #$09B6                                               ;82A684|A9B609  |      ;
    STA.B ptrTemp0x72                                          ;82A687|8572    |000072;
    SEP #$20                                                   ;82A689|E220    |      ;
    LDA.B #$80                                                 ;82A68B|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;82A68D|8574    |000074;
    SEP #$20                                                   ;82A68F|E220    |      ;
    LDY.W #$0000                                               ;82A691|A00000  |      ;
 
.loop:
    TYX                                                        ;82A694|BB      |      ;
    LDA.B [ptrTemp0x72],Y                                      ;82A695|B772    |000072;
    STA.L sFarmTilemap,X                                       ;82A697|9FE6A47E|7EA4E6;
    INY                                                        ;82A69B|C8      |      ;
    CPY.W #$1000                                               ;82A69C|C00010  |      ;
    BNE .loop                                                  ;82A69F|D0F3    |82A694;
    RTL                                                        ;82A6A1|6B      |      ;
 
 
fObjectMap_CurrentMapToFarmMap:
    SEP #$20                                                   ;82A6A2|E220    |      ;
    REP #$10                                                   ;82A6A4|C210    |      ;
    LDA.L nCurrentSeasonID                                     ;82A6A6|AF191F7F|7F1F19;
    CMP.B #$03                                                 ;82A6AA|C903    |      ;
    BNE .return                                                ;82A6AC|D064    |82A712;
    LDA.B #$04                                                 ;82A6AE|A904    |      ;
    STA.W strcDialogDisplay.mapMultiWidth                      ;82A6B0|8D8101  |000181;
    REP #$20                                                   ;82A6B3|C220    |      ;
    LDY.W #$0000                                               ;82A6B5|A00000  |      ;
 
.loop:
    LDX.W #$0000                                               ;82A6B8|A20000  |      ;
 
.continue:
    PHY                                                        ;82A6BB|5A      |      ;
    PHX                                                        ;82A6BC|DA      |      ;
    STX.B strcVariables.n16Temp3                               ;82A6BD|8682    |000082;
    STY.B strcVariables.n16Temp4                               ;82A6BF|8484    |000084;
    JSR.W fObjectEngine_ConvertCoordsToOffset                  ;82A6C1|203CB1  |82B13C;
    SEP #$20                                                   ;82A6C4|E220    |      ;
    LDA.L sFarmTilemap,X                                       ;82A6C6|BFE6A47E|7EA4E6;
    BNE +                                                      ;82A6CA|D003    |82A6CF;
    JMP.W .label7                                              ;82A6CC|4CF2A6  |82A6F2;
 
 
  + CMP.B #$A0                                                 ;82A6CF|C9A0    |      ;
    BCC +                                                      ;82A6D1|9003    |82A6D6;
    JMP.W .label7                                              ;82A6D3|4CF2A6  |82A6F2;
 
 
  + CMP.B #$70                                                 ;82A6D6|C970    |      ;
    BCS .label5                                                ;82A6D8|B006    |82A6E0;
    CMP.B #$1D                                                 ;82A6DA|C91D    |      ;
    BCS .label6                                                ;82A6DC|B00C    |82A6EA;
    BRA .label7                                                ;82A6DE|8012    |82A6F2;
 
 
.label5:
    SEP #$20                                                   ;82A6E0|E220    |      ;
    LDA.B #$7A                                                 ;82A6E2|A97A    |      ;
    STA.L sFarmTilemap,X                                       ;82A6E4|9FE6A47E|7EA4E6;
    BRA .label7                                                ;82A6E8|8008    |82A6F2;
 
 
.label6:
    SEP #$20                                                   ;82A6EA|E220    |      ;
    LDA.B #$07                                                 ;82A6EC|A907    |      ;
    STA.L sFarmTilemap,X                                       ;82A6EE|9FE6A47E|7EA4E6;
 
.label7:
    REP #$30                                                   ;82A6F2|C230    |      ;
    PLX                                                        ;82A6F4|FA      |      ;
    PLY                                                        ;82A6F5|7A      |      ;
    TXA                                                        ;82A6F6|8A      |      ;
    CLC                                                        ;82A6F7|18      |      ;
    ADC.W #$0010                                               ;82A6F8|691000  |      ;
    TAX                                                        ;82A6FB|AA      |      ;
    CPX.W #$0400                                               ;82A6FC|E00004  |      ;
    BEQ +                                                      ;82A6FF|F003    |82A704;
    JMP.W .continue                                            ;82A701|4CBBA6  |82A6BB;
 
 
  + TYA                                                        ;82A704|98      |      ;
    CLC                                                        ;82A705|18      |      ;
    ADC.W #$0010                                               ;82A706|691000  |      ;
    TAY                                                        ;82A709|A8      |      ;
    CPY.W #$0400                                               ;82A70A|C00004  |      ;
 
  + BEQ .return                                                ;82A70D|F003    |82A712;
    JMP.W .loop                                                ;82A70F|4CB8A6  |82A6B8;
 
 
.return:
    RTL                                                        ;82A712|6B      |      ;
 
 
fObjectMap_HuricaneDamage:
    REP #$30                                                   ;82A713|C230    |      ; A: nArg1, X: nArg2, Y: nArg3
    STA.B strcVariables.n16Unk86                               ;82A715|8586    |000086;
    STX.B strcVariables.n16Unk88                               ;82A717|8688    |000088;
    STY.B strcVariables.n16Unk8A                               ;82A719|848A    |00008A;
    SEP #$20                                                   ;82A71B|E220    |      ;
    LDA.B #$04                                                 ;82A71D|A904    |      ;
    STA.W strcDialogDisplay.mapMultiWidth                      ;82A71F|8D8101  |000181;
    REP #$20                                                   ;82A722|C220    |      ;
    LDY.W #$0000                                               ;82A724|A00000  |      ;
 
 -- LDX.W #$0000                                               ;82A727|A20000  |      ;
 
  - PHY                                                        ;82A72A|5A      |      ;
    PHX                                                        ;82A72B|DA      |      ;
    STX.B strcVariables.n16Temp3                               ;82A72C|8682    |000082;
    STY.B strcVariables.n16Temp4                               ;82A72E|8484    |000084;
    JSR.W fObjectEngine_ConvertCoordsToOffset                  ;82A730|203CB1  |82B13C;
    SEP #$20                                                   ;82A733|E220    |      ;
    LDA.L sFarmTilemap,X                                       ;82A735|BFE6A47E|7EA4E6;
    CMP.B #$A0                                                 ;82A739|C9A0    |      ;
    BCC +                                                      ;82A73B|9003    |82A740;
    JMP.W .label7                                              ;82A73D|4CF0A7  |82A7F0;
 
 
  + CMP.B #$05                                                 ;82A740|C905    |      ;
    BEQ .label1                                                ;82A742|F01A    |82A75E;
    CMP.B #$1D                                                 ;82A744|C91D    |      ;
    BEQ .label5                                                ;82A746|F070    |82A7B8;
    CMP.B #$70                                                 ;82A748|C970    |      ;
    BCS .label2                                                ;82A74A|B031    |82A77D;
    CMP.B #$07                                                 ;82A74C|C907    |      ;
    BNE +                                                      ;82A74E|D003    |82A753;
    JMP.W .label6                                              ;82A750|4CD4A7  |82A7D4;
 
 
  + CMP.B #$08                                                 ;82A753|C908    |      ;
    BEQ .label6                                                ;82A755|F07D    |82A7D4;
    CMP.B #$1E                                                 ;82A757|C91E    |      ;
    BCS .label6                                                ;82A759|B079    |82A7D4;
    JMP.W .label7                                              ;82A75B|4CF0A7  |82A7F0;
 
 
.label1:
    REP #$30                                                   ;82A75E|C230    |      ;
    LDA.B strcVariables.n16Unk86                               ;82A760|A586    |000086;
    BNE +                                                      ;82A762|D003    |82A767;
    JMP.W .label7                                              ;82A764|4CF0A7  |82A7F0;
 
 
  + PHX                                                        ;82A767|DA      |      ;
    JSL.L fCore_GetRandomNumber                                ;82A768|22F98980|8089F9;
    SEP #$20                                                   ;82A76C|E220    |      ;
    REP #$10                                                   ;82A76E|C210    |      ;
    PLX                                                        ;82A770|FA      |      ;
    CMP.B #$00                                                 ;82A771|C900    |      ;
    BNE .label7                                                ;82A773|D07B    |82A7F0;
    LDA.B #$06                                                 ;82A775|A906    |      ;
    STA.L sFarmTilemap,X                                       ;82A777|9FE6A47E|7EA4E6;
    BRA .label7                                                ;82A77B|8073    |82A7F0;
 
 
.label2:
    REP #$30                                                   ;82A77D|C230    |      ;
    CMP.W #$0079                                               ;82A77F|C97900  |      ;
    BEQ .label4                                                ;82A782|F029    |82A7AD;
 
.label3:
    REP #$30                                                   ;82A784|C230    |      ;
    LDA.B strcVariables.n16Unk88                               ;82A786|A588    |000088;
    BEQ .label7                                                ;82A788|F066    |82A7F0;
    PHX                                                        ;82A78A|DA      |      ;
    JSL.L fCore_GetRandomNumber                                ;82A78B|22F98980|8089F9;
    SEP #$20                                                   ;82A78F|E220    |      ;
    REP #$10                                                   ;82A791|C210    |      ;
    PLX                                                        ;82A793|FA      |      ;
    CMP.B #$00                                                 ;82A794|C900    |      ;
    BNE .label7                                                ;82A796|D058    |82A7F0;
    LDA.B #$02                                                 ;82A798|A902    |      ;
    STA.L sFarmTilemap,X                                       ;82A79A|9FE6A47E|7EA4E6;
    REP #$20                                                   ;82A79E|C220    |      ;
    LDA.L nPlantedGrassCount                                   ;82A7A0|AF291F7F|7F1F29;
    BEQ .label7                                                ;82A7A4|F04A    |82A7F0;
    DEC A                                                      ;82A7A6|3A      |      ;
    STA.L nPlantedGrassCount                                   ;82A7A7|8F291F7F|7F1F29;
    BRA .label7                                                ;82A7AB|8043    |82A7F0;
 
 
.label4:
    REP #$30                                                   ;82A7AD|C230    |      ;
    LDA.W strcPlayerData.leftGrassToCut                        ;82A7AF|AD2E09  |00092E;
    DEC A                                                      ;82A7B2|3A      |      ;
    STA.W strcPlayerData.leftGrassToCut                        ;82A7B3|8D2E09  |00092E;
    BRA .label3                                                ;82A7B6|80CC    |82A784;
 
 
.label5:
    REP #$30                                                   ;82A7B8|C230    |      ;
    LDA.B strcVariables.n16Unk88                               ;82A7BA|A588    |000088;
    BEQ .label7                                                ;82A7BC|F032    |82A7F0;
    PHX                                                        ;82A7BE|DA      |      ;
    JSL.L fCore_GetRandomNumber                                ;82A7BF|22F98980|8089F9;
    SEP #$20                                                   ;82A7C3|E220    |      ;
    REP #$10                                                   ;82A7C5|C210    |      ;
    PLX                                                        ;82A7C7|FA      |      ;
    CMP.B #$00                                                 ;82A7C8|C900    |      ;
    BNE .label7                                                ;82A7CA|D024    |82A7F0;
    LDA.B #$02                                                 ;82A7CC|A902    |      ;
    STA.L sFarmTilemap,X                                       ;82A7CE|9FE6A47E|7EA4E6;
    BRA .label7                                                ;82A7D2|801C    |82A7F0;
 
 
.label6:
    REP #$30                                                   ;82A7D4|C230    |      ;
    LDA.B strcVariables.n16Unk8A                               ;82A7D6|A58A    |00008A;
    BEQ .label7                                                ;82A7D8|F016    |82A7F0;
    PHX                                                        ;82A7DA|DA      |      ;
    JSL.L fCore_GetRandomNumber                                ;82A7DB|22F98980|8089F9;
    SEP #$20                                                   ;82A7DF|E220    |      ;
    REP #$10                                                   ;82A7E1|C210    |      ;
    PLX                                                        ;82A7E3|FA      |      ;
    CMP.B #$00                                                 ;82A7E4|C900    |      ;
    BNE .label7                                                ;82A7E6|D008    |82A7F0;
    LDA.B #$02                                                 ;82A7E8|A902    |      ;
    STA.L sFarmTilemap,X                                       ;82A7EA|9FE6A47E|7EA4E6;
    BRA .label7                                                ;82A7EE|8000    |82A7F0;
 
 
.label7:
    REP #$30                                                   ;82A7F0|C230    |      ;
    PLX                                                        ;82A7F2|FA      |      ;
    PLY                                                        ;82A7F3|7A      |      ;
    TXA                                                        ;82A7F4|8A      |      ;
    CLC                                                        ;82A7F5|18      |      ;
    ADC.W #$0010                                               ;82A7F6|691000  |      ;
    TAX                                                        ;82A7F9|AA      |      ;
    CPX.W #$0400                                               ;82A7FA|E00004  |      ;
    BEQ +                                                      ;82A7FD|F003    |82A802;
    JMP.W $A72A                                                ;82A7FF|4C2AA7  |82A72A;
 
 
  + TYA                                                        ;82A802|98      |      ;
    CLC                                                        ;82A803|18      |      ;
    ADC.W #$0010                                               ;82A804|691000  |      ;
    TAY                                                        ;82A807|A8      |      ;
    CPY.W #$0400                                               ;82A808|C00004  |      ;
    BEQ .return                                                ;82A80B|F003    |82A810;
    JMP.W $A727                                                ;82A80D|4C27A7  |82A727;
 
 
.return:
    RTL                                                        ;82A810|6B      |      ;
 
 
fObjectMap_Unknown82A811:
    SEP #$20                                                   ;82A811|E220    |      ;
    REP #$10                                                   ;82A813|C210    |      ;
    LDA.B #$04                                                 ;82A815|A904    |      ;
    STA.W strcDialogDisplay.mapMultiWidth                      ;82A817|8D8101  |000181;
    REP #$20                                                   ;82A81A|C220    |      ;
    LDY.W #$0000                                               ;82A81C|A00000  |      ;
 
.loop:
    LDX.W #$0000                                               ;82A81F|A20000  |      ;
 
.continue:
    PHY                                                        ;82A822|5A      |      ;
    PHX                                                        ;82A823|DA      |      ;
    STX.B strcVariables.n16Temp3                               ;82A824|8682    |000082;
    STY.B strcVariables.n16Temp4                               ;82A826|8484    |000084;
    JSR.W fObjectEngine_ConvertCoordsToOffset                  ;82A828|203CB1  |82B13C;
    SEP #$20                                                   ;82A82B|E220    |      ;
    LDA.L sFarmTilemap,X                                       ;82A82D|BFE6A47E|7EA4E6;
    BNE +                                                      ;82A831|D003    |82A836;
    JMP.W .label9                                              ;82A833|4C69A9  |82A969;
 
 
  + CMP.B #$03                                                 ;82A836|C903    |      ;
    BCS +                                                      ;82A838|B003    |82A83D;
    JMP.W .label7                                              ;82A83A|4C1BA9  |82A91B;
 
 
  + CMP.B #$A0                                                 ;82A83D|C9A0    |      ;
    BCC +                                                      ;82A83F|9003    |82A844;
    JMP.W .label9                                              ;82A841|4C69A9  |82A969;
 
 
  + CMP.B #$06                                                 ;82A844|C906    |      ;
    BNE +                                                      ;82A846|D003    |82A84B;
    JMP.W .label8                                              ;82A848|4C49A9  |82A949;
 
 
  + CMP.B #$07                                                 ;82A84B|C907    |      ;
    BEQ .label1                                                ;82A84D|F055    |82A8A4;
    CMP.B #$08                                                 ;82A84F|C908    |      ;
    BNE +                                                      ;82A851|D003    |82A856;
    JMP.W .label2                                              ;82A853|4CB4A8  |82A8B4;
 
 
  + CMP.B #$1E                                                 ;82A856|C91E    |      ;
    BEQ .label1                                                ;82A858|F04A    |82A8A4;
    CMP.B #$1F                                                 ;82A85A|C91F    |      ;
    BNE +                                                      ;82A85C|D003    |82A861;
    JMP.W .label2                                              ;82A85E|4CB4A8  |82A8B4;
 
 
  + CMP.B #$1D                                                 ;82A861|C91D    |      ;
    BNE +                                                      ;82A863|D003    |82A868;
    JMP.W .label9                                              ;82A865|4C69A9  |82A969;
 
 
  + CMP.B #$20                                                 ;82A868|C920    |      ;
    BCS +                                                      ;82A86A|B003    |82A86F;
    JMP.W .label9                                              ;82A86C|4C69A9  |82A969;
 
 
  + CMP.B #$39                                                 ;82A86F|C939    |      ;
    BNE +                                                      ;82A871|D003    |82A876;
    JMP.W .label2                                              ;82A873|4CB4A8  |82A8B4;
 
 
  + CMP.B #$53                                                 ;82A876|C953    |      ;
    BNE +                                                      ;82A878|D003    |82A87D;
    JMP.W .label2                                              ;82A87A|4CB4A8  |82A8B4;
 
 
  + CMP.B #$61                                                 ;82A87D|C961    |      ;
    BNE +                                                      ;82A87F|D003    |82A884;
    JMP.W .label2                                              ;82A881|4CB4A8  |82A8B4;
 
 
  + CMP.B #$6F                                                 ;82A884|C96F    |      ;
    BNE +                                                      ;82A886|D003    |82A88B;
    JMP.W .label2                                              ;82A888|4CB4A8  |82A8B4;
 
 
  + CMP.B #$79                                                 ;82A88B|C979    |      ;
    BNE +                                                      ;82A88D|D003    |82A892;
    JMP.W .label9                                              ;82A88F|4C69A9  |82A969;
 
 
  + CMP.B #$7C                                                 ;82A892|C97C    |      ;
    BNE +                                                      ;82A894|D003    |82A899;
    JMP.W .label3                                              ;82A896|4CCFA8  |82A8CF;
 
 
  + CMP.B #$70                                                 ;82A899|C970    |      ;
    BCS .label6                                                ;82A89B|B069    |82A906;
    AND.B #$01                                                 ;82A89D|2901    |      ;
    BEQ .label1                                                ;82A89F|F003    |82A8A4;
    JMP.W .label4                                              ;82A8A1|4CDAA8  |82A8DA;
 
 
.label1:
    REP #$20                                                   ;82A8A4|C220    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;82A8A6|AD9601  |000196;
    AND.W #$0002                                               ;82A8A9|290200  |      ;
    BEQ +                                                      ;82A8AC|F003    |82A8B1;
    JMP.W .label6                                              ;82A8AE|4C06A9  |82A906;
 
 
  + JMP.W .label9                                              ;82A8B1|4C69A9  |82A969;
 
 
.label2:
    REP #$20                                                   ;82A8B4|C220    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;82A8B6|AD9601  |000196;
    AND.W #$0002                                               ;82A8B9|290200  |      ;
    BEQ +                                                      ;82A8BC|F003    |82A8C1;
    JMP.W .label9                                              ;82A8BE|4C69A9  |82A969;
 
 
  + SEP #$20                                                   ;82A8C1|E220    |      ;
    LDA.L sFarmTilemap,X                                       ;82A8C3|BFE6A47E|7EA4E6;
    DEC A                                                      ;82A8C7|3A      |      ;
    STA.L sFarmTilemap,X                                       ;82A8C8|9FE6A47E|7EA4E6;
    JMP.W .label9                                              ;82A8CC|4C69A9  |82A969;
 
 
.label3:
    SEP #$20                                                   ;82A8CF|E220    |      ;
    LDA.B #$73                                                 ;82A8D1|A973    |      ;
    STA.L sFarmTilemap,X                                       ;82A8D3|9FE6A47E|7EA4E6;
    JMP.W .label9                                              ;82A8D7|4C69A9  |82A969;
 
 
.label4:
    SEP #$20                                                   ;82A8DA|E220    |      ;
    LDA.L nCurrentSeasonID                                     ;82A8DC|AF191F7F|7F1F19;
    CMP.B #$02                                                 ;82A8E0|C902    |      ;
    BNE .label5                                                ;82A8E2|D00C    |82A8F0;
    LDA.L sFarmTilemap,X                                       ;82A8E4|BFE6A47E|7EA4E6;
    DEC A                                                      ;82A8E8|3A      |      ;
    STA.L sFarmTilemap,X                                       ;82A8E9|9FE6A47E|7EA4E6;
    JMP.W .label9                                              ;82A8ED|4C69A9  |82A969;
 
 
.label5:
    SEP #$20                                                   ;82A8F0|E220    |      ;
    LDA.L nCurrentSeasonID                                     ;82A8F2|AF191F7F|7F1F19;
    CMP.B #$03                                                 ;82A8F6|C903    |      ;
    BEQ .label9                                                ;82A8F8|F06F    |82A969;
    LDA.L sFarmTilemap,X                                       ;82A8FA|BFE6A47E|7EA4E6;
    INC A                                                      ;82A8FE|1A      |      ;
    STA.L sFarmTilemap,X                                       ;82A8FF|9FE6A47E|7EA4E6;
    JMP.W .label1                                              ;82A903|4CA4A8  |82A8A4;
 
 
.label6:
    SEP #$20                                                   ;82A906|E220    |      ;
    LDA.L nCurrentSeasonID                                     ;82A908|AF191F7F|7F1F19;
    CMP.B #$03                                                 ;82A90C|C903    |      ;
    BEQ .label9                                                ;82A90E|F059    |82A969;
    LDA.L sFarmTilemap,X                                       ;82A910|BFE6A47E|7EA4E6;
    INC A                                                      ;82A914|1A      |      ;
    STA.L sFarmTilemap,X                                       ;82A915|9FE6A47E|7EA4E6;
    BRA .label9                                                ;82A919|804E    |82A969;
 
 
.label7:
    SEP #$20                                                   ;82A91B|E220    |      ;
    LDA.L nCurrentSeasonID                                     ;82A91D|AF191F7F|7F1F19;
    CMP.B #$02                                                 ;82A921|C902    |      ;
    BEQ .label9                                                ;82A923|F044    |82A969;
    CMP.B #$03                                                 ;82A925|C903    |      ;
    BEQ .label9                                                ;82A927|F040    |82A969;
    LDA.L nCurrentDay                                          ;82A929|AF1B1F7F|7F1F1B;
    AND.B #$03                                                 ;82A92D|2903    |      ;
    BNE .label9                                                ;82A92F|D038    |82A969;
    REP #$10                                                   ;82A931|C210    |      ;
    PHX                                                        ;82A933|DA      |      ;
    JSL.L fGetRandomNumber                                     ;82A934|22388183|838138;
    SEP #$20                                                   ;82A938|E220    |      ;
    REP #$10                                                   ;82A93A|C210    |      ;
    PLX                                                        ;82A93C|FA      |      ;
    CMP.B #$00                                                 ;82A93D|C900    |      ;
    BNE .label9                                                ;82A93F|D028    |82A969;
    LDA.B #$03                                                 ;82A941|A903    |      ;
    STA.L sFarmTilemap,X                                       ;82A943|9FE6A47E|7EA4E6;
    BRA .label9                                                ;82A947|8020    |82A969;
 
 
.label8:
    SEP #$20                                                   ;82A949|E220    |      ;
    LDA.B #$08                                                 ;82A94B|A908    |      ;
    JSL.L fCore_GetRandomNumber                                ;82A94D|22F98980|8089F9;
    BNE .label9                                                ;82A951|D016    |82A969;
    REP #$20                                                   ;82A953|C220    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;82A955|AD9601  |000196;
    ORA.W #$0400                                               ;82A958|090004  |      ;
    STA.W strcDialogDisplay.mapFlags                           ;82A95B|8D9601  |000196;
    %SetFlag(event6, $0200)
 
.label9:
    REP #$30                                                   ;82A969|C230    |      ;
    PLX                                                        ;82A96B|FA      |      ;
    PLY                                                        ;82A96C|7A      |      ;
    TXA                                                        ;82A96D|8A      |      ;
    CLC                                                        ;82A96E|18      |      ;
    ADC.W #$0010                                               ;82A96F|691000  |      ;
    TAX                                                        ;82A972|AA      |      ;
    CPX.W #$0400                                               ;82A973|E00004  |      ;
    BEQ +                                                      ;82A976|F003    |82A97B;
    JMP.W .continue                                            ;82A978|4C22A8  |82A822;
 
 
  + TYA                                                        ;82A97B|98      |      ;
    CLC                                                        ;82A97C|18      |      ;
    ADC.W #$0010                                               ;82A97D|691000  |      ;
    TAY                                                        ;82A980|A8      |      ;
    CPY.W #$0400                                               ;82A981|C00004  |      ;
    BEQ +                                                      ;82A984|F003    |82A989;
    JMP.W .loop                                                ;82A986|4C1FA8  |82A81F;
 
 
  + SEP #$20                                                   ;82A989|E220    |      ;
    LDA.L nCurrentSeasonID                                     ;82A98B|AF191F7F|7F1F19;
    CMP.B #$03                                                 ;82A98F|C903    |      ;
    BNE .justReturn                                            ;82A991|D00C    |82A99F;
    LDA.L nCurrentDay                                          ;82A993|AF1B1F7F|7F1F1B;
    CMP.B #$01                                                 ;82A997|C901    |      ;
    BNE .justReturn                                            ;82A999|D004    |82A99F;
    JSL.L fObjectMap_CurrentMapToFarmMap                       ;82A99B|22A2A682|82A6A2;
 
.justReturn:
    RTL                                                        ;82A99F|6B      |      ;
 
 
fObjectMap_EatingGrass:
    SEP #$20                                                   ;82A9A0|E220    |      ;
    REP #$10                                                   ;82A9A2|C210    |      ;
    LDA.B #$04                                                 ;82A9A4|A904    |      ;
    STA.W strcDialogDisplay.mapMultiWidth                      ;82A9A6|8D8101  |000181;
    REP #$20                                                   ;82A9A9|C220    |      ;
    STZ.W strcPlayerData.leftGrassToCut                        ;82A9AB|9C2E09  |00092E;
    LDY.W #$0000                                               ;82A9AE|A00000  |      ;
 
 -- LDX.W #$0000                                               ;82A9B1|A20000  |      ;
 
  - PHY                                                        ;82A9B4|5A      |      ;
    PHX                                                        ;82A9B5|DA      |      ;
    STX.B strcVariables.n16Temp3                               ;82A9B6|8682    |000082;
    STY.B strcVariables.n16Temp4                               ;82A9B8|8484    |000084;
    JSR.W fObjectEngine_ConvertCoordsToOffset                  ;82A9BA|203CB1  |82B13C;
    SEP #$20                                                   ;82A9BD|E220    |      ;
    LDA.L sFarmTilemap,X                                       ;82A9BF|BFE6A47E|7EA4E6;
    CMP.B #$76                                                 ;82A9C3|C976    |      ;
    BEQ +                                                      ;82A9C5|F00E    |82A9D5;
    CMP.B #$77                                                 ;82A9C7|C977    |      ;
    BEQ +                                                      ;82A9C9|F00A    |82A9D5;
    CMP.B #$78                                                 ;82A9CB|C978    |      ;
    BEQ +                                                      ;82A9CD|F006    |82A9D5;
    CMP.B #$79                                                 ;82A9CF|C979    |      ;
    BEQ +                                                      ;82A9D1|F002    |82A9D5;
    BRA .label1                                                ;82A9D3|8011    |82A9E6;
 
 
  + SEP #$20                                                   ;82A9D5|E220    |      ;
    LDA.B #$7A                                                 ;82A9D7|A97A    |      ;
    STA.L sFarmTilemap,X                                       ;82A9D9|9FE6A47E|7EA4E6;
    REP #$20                                                   ;82A9DD|C220    |      ;
    LDA.W strcPlayerData.leftGrassToCut                        ;82A9DF|AD2E09  |00092E;
    INC A                                                      ;82A9E2|1A      |      ;
    STA.W strcPlayerData.leftGrassToCut                        ;82A9E3|8D2E09  |00092E;
 
.label1:
    REP #$30                                                   ;82A9E6|C230    |      ;
    PLX                                                        ;82A9E8|FA      |      ;
    PLY                                                        ;82A9E9|7A      |      ;
    LDA.W strcPlayerData.leftGrassToCut                        ;82A9EA|AD2E09  |00092E;
    BNE .justReturn                                            ;82A9ED|D01C    |82AA0B;
    TXA                                                        ;82A9EF|8A      |      ;
    CLC                                                        ;82A9F0|18      |      ;
    ADC.W #$0010                                               ;82A9F1|691000  |      ;
    TAX                                                        ;82A9F4|AA      |      ;
    CPX.W #$0400                                               ;82A9F5|E00004  |      ;
    BEQ +                                                      ;82A9F8|F003    |82A9FD;
    JMP.W $A9B4                                                ;82A9FA|4CB4A9  |82A9B4;
 
 
  + TYA                                                        ;82A9FD|98      |      ;
    CLC                                                        ;82A9FE|18      |      ;
    ADC.W #$0010                                               ;82A9FF|691000  |      ;
    TAY                                                        ;82AA02|A8      |      ;
    CPY.W #$0400                                               ;82AA03|C00004  |      ;
    BEQ .justReturn                                            ;82AA06|F003    |82AA0B;
    JMP.W $A9B1                                                ;82AA08|4CB1A9  |82A9B1;
 
 
.justReturn:
    RTL                                                        ;82AA0B|6B      |      ;
 
 
fObjectMap_CalculateRanchDev:
    SEP #$20                                                   ;82AA0C|E220    |      ;
    REP #$10                                                   ;82AA0E|C210    |      ;
    LDA.B #$04                                                 ;82AA10|A904    |      ;
    STA.W strcDialogDisplay.mapMultiWidth                      ;82AA12|8D8101  |000181;
    REP #$20                                                   ;82AA15|C220    |      ;
    LDA.W #$0000                                               ;82AA17|A90000  |      ;
    STA.L nRanchDevelopmentRate                                ;82AA1A|8F561F7F|7F1F56;
    LDY.W #$0000                                               ;82AA1E|A00000  |      ;
 
 -- LDX.W #$0000                                               ;82AA21|A20000  |      ;
 
  - PHY                                                        ;82AA24|5A      |      ;
    PHX                                                        ;82AA25|DA      |      ;
    STX.B strcVariables.n16Temp3                               ;82AA26|8682    |000082;
    STY.B strcVariables.n16Temp4                               ;82AA28|8484    |000084;
    JSR.W fObjectEngine_ConvertCoordsToOffset                  ;82AA2A|203CB1  |82B13C;
    SEP #$20                                                   ;82AA2D|E220    |      ;
    LDA.L sFarmTilemap,X                                       ;82AA2F|BFE6A47E|7EA4E6;
    CMP.B #$A0                                                 ;82AA33|C9A0    |      ;
    BCS +                                                      ;82AA35|B019    |82AA50;
    CMP.B #$05                                                 ;82AA37|C905    |      ;
    BEQ .increaseRanchDevRate                                  ;82AA39|F00A    |82AA45;
    CMP.B #$06                                                 ;82AA3B|C906    |      ;
    BEQ .increaseRanchDevRate                                  ;82AA3D|F006    |82AA45;
    CMP.B #$1D                                                 ;82AA3F|C91D    |      ;
    BCS .increaseRanchDevRate                                  ;82AA41|B002    |82AA45;
    BRA +                                                      ;82AA43|800B    |82AA50;
 
 
.increaseRanchDevRate:
    REP #$20                                                   ;82AA45|C220    |      ;
    LDA.L nRanchDevelopmentRate                                ;82AA47|AF561F7F|7F1F56;
    INC A                                                      ;82AA4B|1A      |      ;
    STA.L nRanchDevelopmentRate                                ;82AA4C|8F561F7F|7F1F56;
 
  + REP #$30                                                   ;82AA50|C230    |      ;
    PLX                                                        ;82AA52|FA      |      ;
    PLY                                                        ;82AA53|7A      |      ;
    TXA                                                        ;82AA54|8A      |      ;
    CLC                                                        ;82AA55|18      |      ;
    ADC.W #$0010                                               ;82AA56|691000  |      ;
    TAX                                                        ;82AA59|AA      |      ;
    CPX.W #$0400                                               ;82AA5A|E00004  |      ;
    BEQ +                                                      ;82AA5D|F003    |82AA62;
    JMP.W $AA24                                                ;82AA5F|4C24AA  |82AA24;
 
 
  + TYA                                                        ;82AA62|98      |      ;
    CLC                                                        ;82AA63|18      |      ;
    ADC.W #$0010                                               ;82AA64|691000  |      ;
    TAY                                                        ;82AA67|A8      |      ;
    CPY.W #$0400                                               ;82AA68|C00004  |      ;
    BEQ .justReturn                                            ;82AA6B|F003    |82AA70;
    JMP.W $AA21                                                ;82AA6D|4C21AA  |82AA21;
 
 
.justReturn:
    RTL                                                        ;82AA70|6B      |      ;
