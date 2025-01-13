 
    ORG $848000
 
 
fAI_ZeroCCPtr:
    REP #$30                                                   ;848000|C230    |      ;
    LDX.W #$0000                                               ;848002|A20000  |      ;
 
  - PHX                                                        ;848005|DA      |      ;
    TXA                                                        ;848006|8A      |      ;
    JSL.L fAI_Unknown84887C                                    ;848007|227C8884|84887C;
    SEP #$20                                                   ;84800B|E220    |      ;
    REP #$10                                                   ;84800D|C210    |      ;
    LDY.W #$0000                                               ;84800F|A00000  |      ;
    LDA.B #$00                                                 ;848012|A900    |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;848014|97CC    |0000CC;
    REP #$30                                                   ;848016|C230    |      ;
    PLX                                                        ;848018|FA      |      ;
    INX                                                        ;848019|E8      |      ;
    CPX.W #$0031                                               ;84801A|E03100  |      ;
    BNE -                                                      ;84801D|D0E6    |848005;
    RTL                                                        ;84801F|6B      |      ;
 
 
fAI_Unknown848020:
    REP #$30                                                   ;848020|C230    |      ;
    JSL.L fAI_Unknown84887C                                    ;848022|227C8884|84887C;
    SEP #$20                                                   ;848026|E220    |      ;
    REP #$10                                                   ;848028|C210    |      ;
    LDY.W #$0000                                               ;84802A|A00000  |      ;
    LDA.B #$00                                                 ;84802D|A900    |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84802F|97CC    |0000CC;
    REP #$30                                                   ;848031|C230    |      ;
    LDY.W #$0012                                               ;848033|A01200  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;848036|B7CC    |0000CC;
    STA.B $A5                                                  ;848038|85A5    |0000A5;
    JSL.L fUnknown_8581A2                                      ;84803A|22A28185|8581A2;
    RTL                                                        ;84803E|6B      |      ;
 
 
fAI_Unknown84803F:
    REP #$30                                                   ;84803F|C230    |      ; A: nArg1, X: nIndex, Y: nSubindex
    JSL.L fAI_Unknown84887C                                    ;848041|227C8884|84887C; $0xCC = 7EB586 + A * 64
    REP #$30                                                   ;848045|C230    |      ;
    STX.B n16TempVar1                                          ;848047|867E    |00007E;
    STY.B n16TempVar2                                          ;848049|8480    |000080;
    LDX.W #$0000                                               ;84804B|A20000  |      ;
    LDA.L pppAITable_8494CD,X                                  ;84804E|BFCD9484|8494CD; index = 0
    STA.B ptrUnknown0x75                                       ;848052|8575    |000075;
    INX                                                        ;848054|E8      |      ;
    INX                                                        ;848055|E8      |      ;
    SEP #$20                                                   ;848056|E220    |      ;
    LDA.L pppAITable_8494CD,X                                  ;848058|BFCD9484|8494CD;
    STA.B ptrUnknown0x75+2                                     ;84805C|8577    |000077; $0x75 = 0xB38000
    REP #$20                                                   ;84805E|C220    |      ;
    LDA.B n16TempVar1                                          ;848060|A57E    |00007E;
    ASL A                                                      ;848062|0A      |      ;
    CLC                                                        ;848063|18      |      ;
    ADC.B n16TempVar1                                          ;848064|657E    |00007E;
    TAY                                                        ;848066|A8      |      ;
    LDA.B [ptrUnknown0x75],Y                                   ;848067|B775    |000075; index = nIndex * 2
    STA.B ptrUnknown0x78                                       ;848069|8578    |000078;
    INY                                                        ;84806B|C8      |      ;
    INY                                                        ;84806C|C8      |      ;
    SEP #$20                                                   ;84806D|E220    |      ;
    LDA.B [ptrUnknown0x75],Y                                   ;84806F|B775    |000075;
    STA.B ptrUnknown0x78+2                                     ;848071|857A    |00007A; $78 = 0xB38BB8
    REP #$20                                                   ;848073|C220    |      ;
    LDA.B n16TempVar2                                          ;848075|A580    |000080;
    ASL A                                                      ;848077|0A      |      ;
    TAY                                                        ;848078|A8      |      ;
    LDA.B [ptrUnknown0x78],Y                                   ;848079|B778    |000078; index = nSubindex * 2
    REP #$30                                                   ;84807B|C230    |      ;
    LDY.W #$0030                                               ;84807D|A03000  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;848080|97CC    |0000CC;
    STA.B ptrAIActionData                                      ;848082|85C9    |0000C9;
    SEP #$20                                                   ;848084|E220    |      ;
    LDA.B ptrUnknown0x78+2                                     ;848086|A57A    |00007A;
    SEP #$20                                                   ;848088|E220    |      ;
    REP #$10                                                   ;84808A|C210    |      ;
    LDY.W #$0032                                               ;84808C|A03200  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84808F|97CC    |0000CC;
    STA.B ptrAIActionData+2                                    ;848091|85CB    |0000CB;
    JSR.W fAI_Unknown848961                                    ;848093|206189  |848961;
    RTL                                                        ;848096|6B      |      ;
 
 
fAI_Unknown848097:
    REP #$30                                                   ;848097|C230    |      ; A: nArg1, X: nIndex, Y: nSubindex
    PHA                                                        ;848099|48      |      ;
    JSL.L fAI_Unknown84887C                                    ;84809A|227C8884|84887C; $0xCC = 7EB586 + A * 64
    REP #$30                                                   ;84809E|C230    |      ;
    STX.B n16TempVar1                                          ;8480A0|867E    |00007E;
    STY.B n16TempVar2                                          ;8480A2|8480    |000080;
    LDX.W #$0000                                               ;8480A4|A20000  |      ;
    LDA.L pppAITable_8494CD,X                                  ;8480A7|BFCD9484|8494CD; index = 0
    STA.B ptrUnknown0x72                                       ;8480AB|8572    |000072;
    INX                                                        ;8480AD|E8      |      ;
    INX                                                        ;8480AE|E8      |      ;
    SEP #$20                                                   ;8480AF|E220    |      ;
    LDA.L pppAITable_8494CD,X                                  ;8480B1|BFCD9484|8494CD;
    STA.B ptrUnknown0x72+2                                     ;8480B5|8574    |000074; $0x72 = 0xB38000
    REP #$20                                                   ;8480B7|C220    |      ;
    LDA.B n16TempVar1                                          ;8480B9|A57E    |00007E;
    ASL A                                                      ;8480BB|0A      |      ;
    CLC                                                        ;8480BC|18      |      ;
    ADC.B n16TempVar1                                          ;8480BD|657E    |00007E;
    TAY                                                        ;8480BF|A8      |      ;
    LDA.B [ptrUnknown0x72],Y                                   ;8480C0|B772    |000072; index = nIndex * 2
    STA.B ptrAIActionData                                      ;8480C2|85C9    |0000C9;
    INY                                                        ;8480C4|C8      |      ;
    INY                                                        ;8480C5|C8      |      ;
    SEP #$20                                                   ;8480C6|E220    |      ;
    LDA.B [ptrUnknown0x72],Y                                   ;8480C8|B772    |000072;
    STA.B ptrAIActionData+2                                    ;8480CA|85CB    |0000CB; $C9 = 0xB38BB8
    REP #$20                                                   ;8480CC|C220    |      ;
    LDA.B n16TempVar2                                          ;8480CE|A580    |000080;
    ASL A                                                      ;8480D0|0A      |      ;
    TAY                                                        ;8480D1|A8      |      ;
    LDA.B [ptrAIActionData],Y                                  ;8480D2|B7C9    |0000C9;
    REP #$30                                                   ;8480D4|C230    |      ;
    LDY.W #$0030                                               ;8480D6|A03000  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;8480D9|97CC    |0000CC;
    SEP #$20                                                   ;8480DB|E220    |      ;
    LDA.B ptrAIActionData+2                                    ;8480DD|A5CB    |0000CB;
    SEP #$20                                                   ;8480DF|E220    |      ;
    REP #$10                                                   ;8480E1|C210    |      ;
    LDY.W #$0032                                               ;8480E3|A03200  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;8480E6|97CC    |0000CC;
    JSR.W fAI_Unknown8488D4                                    ;8480E8|20D488  |8488D4;
    REP #$30                                                   ;8480EB|C230    |      ;
    PLA                                                        ;8480ED|68      |      ;
    SEP #$20                                                   ;8480EE|E220    |      ;
    REP #$10                                                   ;8480F0|C210    |      ;
    LDY.W #$003F                                               ;8480F2|A03F00  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;8480F5|97CC    |0000CC;
    RTL                                                        ;8480F7|6B      |      ;
 
 
fAI_Unknown8480F8:
    REP #$30                                                   ;8480F8|C230    |      ; A: nArg1, X: nIndex, Y: nSubindex
    PHA                                                        ;8480FA|48      |      ;
    JSL.L fAI_Unknown84887C                                    ;8480FB|227C8884|84887C; $0xCC = 7EB586 + A * 64
    REP #$30                                                   ;8480FF|C230    |      ;
    STX.B n16TempVar1                                          ;848101|867E    |00007E;
    STY.B n16TempVar2                                          ;848103|8480    |000080;
    LDX.W #$0000                                               ;848105|A20000  |      ;
    LDA.L pppAITable_8494CD,X                                  ;848108|BFCD9484|8494CD;
    STA.B ptrUnknown0x72                                       ;84810C|8572    |000072;
    INX                                                        ;84810E|E8      |      ;
    INX                                                        ;84810F|E8      |      ;
    SEP #$20                                                   ;848110|E220    |      ;
    LDA.L pppAITable_8494CD,X                                  ;848112|BFCD9484|8494CD;
    STA.B ptrUnknown0x72+2                                     ;848116|8574    |000074; $0x72 = 0xB38000
    REP #$20                                                   ;848118|C220    |      ;
    LDA.B n16TempVar1                                          ;84811A|A57E    |00007E;
    ASL A                                                      ;84811C|0A      |      ;
    CLC                                                        ;84811D|18      |      ;
    ADC.B n16TempVar1                                          ;84811E|657E    |00007E;
    TAY                                                        ;848120|A8      |      ;
    LDA.B [ptrUnknown0x72],Y                                   ;848121|B772    |000072;
    STA.B ptrAIActionData                                      ;848123|85C9    |0000C9;
    INY                                                        ;848125|C8      |      ;
    INY                                                        ;848126|C8      |      ;
    SEP #$20                                                   ;848127|E220    |      ;
    LDA.B [ptrUnknown0x72],Y                                   ;848129|B772    |000072;
    STA.B ptrAIActionData+2                                    ;84812B|85CB    |0000CB;
    REP #$20                                                   ;84812D|C220    |      ;
    LDA.B n16TempVar2                                          ;84812F|A580    |000080;
    ASL A                                                      ;848131|0A      |      ;
    TAY                                                        ;848132|A8      |      ;
    LDA.B [ptrAIActionData],Y                                  ;848133|B7C9    |0000C9;
    REP #$30                                                   ;848135|C230    |      ;
    LDY.W #$0030                                               ;848137|A03000  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84813A|97CC    |0000CC;
    SEP #$20                                                   ;84813C|E220    |      ;
    LDA.B ptrAIActionData+2                                    ;84813E|A5CB    |0000CB;
    SEP #$20                                                   ;848140|E220    |      ;
    REP #$10                                                   ;848142|C210    |      ;
    LDY.W #$0032                                               ;848144|A03200  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;848147|97CC    |0000CC;
    JSR.W fAI_Unknown8488D4                                    ;848149|20D488  |8488D4;
    REP #$30                                                   ;84814C|C230    |      ;
    PLA                                                        ;84814E|68      |      ;
    SEP #$20                                                   ;84814F|E220    |      ;
    REP #$10                                                   ;848151|C210    |      ;
    LDY.W #$003F                                               ;848153|A03F00  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;848156|97CC    |0000CC;
    REP #$30                                                   ;848158|C230    |      ;
    LDA.W nTileInFrontOfPlayerX                                ;84815A|AD8509  |000985;
    REP #$30                                                   ;84815D|C230    |      ;
    LDY.W #$001A                                               ;84815F|A01A00  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;848162|97CC    |0000CC;
    LDA.W nTileInFrontOfPlayerY                                ;848164|AD8709  |000987;
    REP #$30                                                   ;848167|C230    |      ;
    LDY.W #$001C                                               ;848169|A01C00  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84816C|97CC    |0000CC;
    RTL                                                        ;84816E|6B      |      ;
 
 
fAI_Unknown84816F:
    SEP #$20                                                   ;84816F|E220    |      ;
    REP #$10                                                   ;848171|C210    |      ;
    LDA.W $019A                                                ;848173|AD9A01  |00019A;
    CMP.B #$02                                                 ;848176|C902    |      ;
    BNE +                                                      ;848178|D003    |84817D;
    JMP.W .return                                              ;84817A|4C1A82  |84821A;
 
 
  + CMP.B #$06                                                 ;84817D|C906    |      ;
    BNE +                                                      ;84817F|D003    |848184;
    JMP.W .return                                              ;848181|4C1A82  |84821A;
 
 
  + REP #$30                                                   ;848184|C230    |      ;
    LDA.B nPlayerAction                                        ;848186|A5D4    |0000D4;
    CMP.W #$0003                                               ;848188|C90300  |      ;
    BNE +                                                      ;84818B|D003    |848190;
    JMP.W .return                                              ;84818D|4C1A82  |84821A;
 
 
  + JSL.L fGetRandomNumber                                     ;848190|22388183|838138;
    SEP #$20                                                   ;848194|E220    |      ;
    STA.B $DE                                                  ;848196|85DE    |0000DE;
    REP #$20                                                   ;848198|C220    |      ;
    LDA.W #$B586                                               ;84819A|A986B5  |      ;
    STA.B ptrAIUnknown0xCC                                     ;84819D|85CC    |0000CC;
    SEP #$20                                                   ;84819F|E220    |      ;
    LDA.B #$7E                                                 ;8481A1|A97E    |      ;
    STA.B ptrAIUnknown0xCC+2                                   ;8481A3|85CE    |0000CE; 7EB586 -> $CC
    REP #$20                                                   ;8481A5|C220    |      ;
    LDX.W #$0000                                               ;8481A7|A20000  |      ;
 
 -- REP #$30                                                   ;8481AA|C230    |      ;
    PHX                                                        ;8481AC|DA      |      ;
    SEP #$20                                                   ;8481AD|E220    |      ;
    REP #$10                                                   ;8481AF|C210    |      ;
    LDY.W #$0000                                               ;8481B1|A00000  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;8481B4|B7CC    |0000CC;
    AND.B #$01                                                 ;8481B6|2901    |      ;
    BEQ .label6                                                ;8481B8|F04F    |848209;
    REP #$30                                                   ;8481BA|C230    |      ;
    LDY.W #$0010                                               ;8481BC|A01000  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;8481BF|B7CC    |0000CC;
    BNE .label4                                                ;8481C1|D01C    |8481DF;
 
  - SEP #$20                                                   ;8481C3|E220    |      ;
    REP #$10                                                   ;8481C5|C210    |      ;
    LDY.W #$0001                                               ;8481C7|A00100  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;8481CA|B7CC    |0000CC;
    AND.B #$08                                                 ;8481CC|2908    |      ;
    BNE +                                                      ;8481CE|D00A    |8481DA;
    REP #$20                                                   ;8481D0|C220    |      ;
    LDY.W #$0003                                               ;8481D2|A00300  |      ;
    LDA.W #$0000                                               ;8481D5|A90000  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;8481D8|97CC    |0000CC;
 
  + JSR.W fAI_ExecuteAiAction                                  ;8481DA|204982  |848249;
    BRA +                                                      ;8481DD|8008    |8481E7;
 
 
.label4:
    DEC A                                                      ;8481DF|3A      |      ;
    REP #$30                                                   ;8481E0|C230    |      ;
    LDY.W #$0010                                               ;8481E2|A01000  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;8481E5|97CC    |0000CC;
 
  + REP #$30                                                   ;8481E7|C230    |      ;
    LDY.W #$0010                                               ;8481E9|A01000  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;8481EC|B7CC    |0000CC;
    BEQ -                                                      ;8481EE|F0D3    |8481C3;
    SEP #$20                                                   ;8481F0|E220    |      ;
    LDA.B $DE                                                  ;8481F2|A5DE    |0000DE;
    CLC                                                        ;8481F4|18      |      ;
    ADC.B #$33                                                 ;8481F5|6933    |      ;
    STA.B $DE                                                  ;8481F7|85DE    |0000DE;
    SEP #$20                                                   ;8481F9|E220    |      ;
    REP #$10                                                   ;8481FB|C210    |      ;
    LDY.W #$0001                                               ;8481FD|A00100  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;848200|B7CC    |0000CC;
    AND.B #$01                                                 ;848202|2901    |      ;
    BEQ .label6                                                ;848204|F003    |848209;
    JSR.W fAI_Unknown848286                                    ;848206|208682  |848286;
 
.label6:
    REP #$30                                                   ;848209|C230    |      ;
    LDA.B ptrAIUnknown0xCC                                     ;84820B|A5CC    |0000CC;
    CLC                                                        ;84820D|18      |      ;
    ADC.W #$0040                                               ;84820E|694000  |      ;
    STA.B ptrAIUnknown0xCC                                     ;848211|85CC    |0000CC;
    PLX                                                        ;848213|FA      |      ;
    INX                                                        ;848214|E8      |      ;
    CPX.W #$0031                                               ;848215|E03100  |      ;
    BNE --                                                     ;848218|D090    |8481AA;
 
.return:
    REP #$20                                                   ;84821A|C220    |      ;
    LDA.L strcDailyFlags.flags1                                ;84821C|AF5A1F7F|7F1F5A;
    AND.W #$FE2F                                               ;848220|292FFE  |      ;
    STA.L strcDailyFlags.flags1                                ;848223|8F5A1F7F|7F1F5A;
    LDA.L strcDailyFlags.flags2                                ;848227|AF5C1F7F|7F1F5C;
    AND.W #$FBFF                                               ;84822B|29FFFB  |      ;
    STA.L strcDailyFlags.flags2                                ;84822E|8F5C1F7F|7F1F5C;
    LDA.L strcDailyFlags.flags3                                ;848232|AF5E1F7F|7F1F5E;
    AND.W #$FFBF                                               ;848236|29BFFF  |      ;
    STA.L strcDailyFlags.flags3                                ;848239|8F5E1F7F|7F1F5E;
    LDA.L strcDailyFlags.flags4                                ;84823D|AF601F7F|7F1F60;
    AND.W #$FFEF                                               ;848241|29EFFF  |      ;
    STA.L strcDailyFlags.flags4                                ;848244|8F601F7F|7F1F60;
    RTL                                                        ;848248|6B      |      ;
 
 
fAI_ExecuteAiAction:
    REP #$30                                                   ;848249|C230    |      ;
    REP #$30                                                   ;84824B|C230    |      ;
    LDY.W #$0030                                               ;84824D|A03000  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;848250|B7CC    |0000CC;
    STA.B ptrAIActionData                                      ;848252|85C9    |0000C9;
    SEP #$20                                                   ;848254|E220    |      ;
    REP #$10                                                   ;848256|C210    |      ;
    LDY.W #$0032                                               ;848258|A03200  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84825B|B7CC    |0000CC;
    STA.B ptrAIActionData+2                                    ;84825D|85CB    |0000CB;
    SEP #$20                                                   ;84825F|E220    |      ;
    LDA.B #$00                                                 ;848261|A900    |      ;
    XBA                                                        ;848263|EB      |      ;
    LDA.B [ptrAIActionData]                                    ;848264|A7C9    |0000C9;
    REP #$20                                                   ;848266|C220    |      ;
    ASL A                                                      ;848268|0A      |      ;
    TAX                                                        ;848269|AA      |      ;
    JSR.W (aAIActions,X)                                       ;84826A|FC1994  |849419;
    REP #$30                                                   ;84826D|C230    |      ;
    LDA.B ptrAIActionData                                      ;84826F|A5C9    |0000C9;
    REP #$30                                                   ;848271|C230    |      ;
    LDY.W #$0030                                               ;848273|A03000  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;848276|97CC    |0000CC;
    SEP #$20                                                   ;848278|E220    |      ;
    LDA.B ptrAIActionData+2                                    ;84827A|A5CB    |0000CB;
    SEP #$20                                                   ;84827C|E220    |      ;
    REP #$10                                                   ;84827E|C210    |      ;
    LDY.W #$0032                                               ;848280|A03200  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;848283|97CC    |0000CC;
    RTS                                                        ;848285|60      |      ;
 
 
fAI_Unknown848286:
    REP #$30                                                   ;848286|C230    |      ;
    SEP #$20                                                   ;848288|E220    |      ;
    REP #$10                                                   ;84828A|C210    |      ;
    LDY.W #$0001                                               ;84828C|A00100  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84828F|B7CC    |0000CC;
    AND.B #$10                                                 ;848291|2910    |      ;
    BNE +                                                      ;848293|D006    |84829B;
    JSR.W fAI_Unknown8483CC                                    ;848295|20CC83  |8483CC;
    JSR.W fAI_Unknown848331                                    ;848298|203183  |848331;
 
  + REP #$30                                                   ;84829B|C230    |      ;
    LDY.W #$0012                                               ;84829D|A01200  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;8482A0|B7CC    |0000CC;
    STA.B $A5                                                  ;8482A2|85A5    |0000A5;
    LDY.W #$0014                                               ;8482A4|A01400  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;8482A7|B7CC    |0000CC;
    STA.B $9F                                                  ;8482A9|859F    |00009F;
    LDY.W #$001A                                               ;8482AB|A01A00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;8482AE|B7CC    |0000CC;
    STA.B $9B                                                  ;8482B0|859B    |00009B;
    LDY.W #$001C                                               ;8482B2|A01C00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;8482B5|B7CC    |0000CC;
    STA.B $9D                                                  ;8482B7|859D    |00009D;
    LDY.W #$0016                                               ;8482B9|A01600  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;8482BC|B7CC    |0000CC;
    STA.B $A1                                                  ;8482BE|85A1    |0000A1;
    SEP #$20                                                   ;8482C0|E220    |      ;
    REP #$10                                                   ;8482C2|C210    |      ;
    LDY.W #$0001                                               ;8482C4|A00100  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;8482C7|B7CC    |0000CC;
    AND.B #$40                                                 ;8482C9|2940    |      ;
    BNE .label3                                                ;8482CB|D03D    |84830A;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;8482CD|B7CC    |0000CC;
    AND.B #$02                                                 ;8482CF|2902    |      ;
    BNE .label1                                                ;8482D1|D00C    |8482DF;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;8482D3|B7CC    |0000CC;
    AND.B #$04                                                 ;8482D5|2904    |      ;
    BNE .label2                                                ;8482D7|D017    |8482F0;
    JSL.L fUnknown_8580B9                                      ;8482D9|22B98085|8580B9;
    BRA .return                                                ;8482DD|802F    |84830E;
 
 
.label1:
    JSL.L fUnknown_858000                                      ;8482DF|22008085|858000;
    REP #$30                                                   ;8482E3|C230    |      ;
    LDA.B $A5                                                  ;8482E5|A5A5    |0000A5;
    REP #$30                                                   ;8482E7|C230    |      ;
    LDY.W #$0012                                               ;8482E9|A01200  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;8482EC|97CC    |0000CC;
    BRA .return                                                ;8482EE|801E    |84830E;
 
 
.label2:
    REP #$30                                                   ;8482F0|C230    |      ;
    LDY.W #$0016                                               ;8482F2|A01600  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;8482F5|B7CC    |0000CC;
    STA.B n16TempVar1                                          ;8482F7|857E    |00007E;
    REP #$30                                                   ;8482F9|C230    |      ;
    LDY.W #$0018                                               ;8482FB|A01800  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;8482FE|B7CC    |0000CC;
    CMP.B n16TempVar1                                          ;848300|C57E    |00007E;
    BEQ .return                                                ;848302|F00A    |84830E;
    JSL.L fUnknown_858100                                      ;848304|22008185|858100;
    BRA .return                                                ;848308|8004    |84830E;
 
 
.label3:
    JSL.L fUnknown_8581A2                                      ;84830A|22A28185|8581A2;
 
.return:
    REP #$30                                                   ;84830E|C230    |      ;
    LDY.W #$0016                                               ;848310|A01600  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;848313|B7CC    |0000CC;
    REP #$30                                                   ;848315|C230    |      ;
    LDY.W #$0018                                               ;848317|A01800  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84831A|97CC    |0000CC;
    SEP #$20                                                   ;84831C|E220    |      ;
    REP #$10                                                   ;84831E|C210    |      ;
    LDY.W #$0001                                               ;848320|A00100  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;848323|B7CC    |0000CC;
    AND.B #$E9                                                 ;848325|29E9    |      ;
    SEP #$20                                                   ;848327|E220    |      ;
    REP #$10                                                   ;848329|C210    |      ;
    LDY.W #$0001                                               ;84832B|A00100  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84832E|97CC    |0000CC;
    RTS                                                        ;848330|60      |      ;
 
 
fAI_Unknown848331:
    REP #$30                                                   ;848331|C230    |      ;
    SEP #$20                                                   ;848333|E220    |      ;
    REP #$10                                                   ;848335|C210    |      ;
    LDY.W #$0001                                               ;848337|A00100  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84833A|B7CC    |0000CC;
    AND.B #$20                                                 ;84833C|2920    |      ;
    BNE +                                                      ;84833E|D003    |848343;
    JMP.W .return                                              ;848340|4CCB83  |8483CB;
 
 
  + SEP #$20                                                   ;848343|E220    |      ;
    REP #$10                                                   ;848345|C210    |      ;
    LDY.W #$0006                                               ;848347|A00600  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84834A|B7CC    |0000CC;
    DEC A                                                      ;84834C|3A      |      ;
    SEP #$20                                                   ;84834D|E220    |      ;
    REP #$10                                                   ;84834F|C210    |      ;
    LDY.W #$0006                                               ;848351|A00600  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;848354|97CC    |0000CC;
    SEP #$20                                                   ;848356|E220    |      ;
    REP #$10                                                   ;848358|C210    |      ;
    LDY.W #$0006                                               ;84835A|A00600  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84835D|B7CC    |0000CC;
    BNE .return                                                ;84835F|D06A    |8483CB;
    SEP #$20                                                   ;848361|E220    |      ;
    REP #$10                                                   ;848363|C210    |      ;
    LDY.W #$0005                                               ;848365|A00500  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;848368|B7CC    |0000CC;
    SEP #$20                                                   ;84836A|E220    |      ;
    REP #$10                                                   ;84836C|C210    |      ;
    LDY.W #$0006                                               ;84836E|A00600  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;848371|97CC    |0000CC;
    REP #$20                                                   ;848373|C220    |      ;
    LDA.W #$0000                                               ;848375|A90000  |      ;
    SEP #$20                                                   ;848378|E220    |      ;
    REP #$10                                                   ;84837A|C210    |      ;
    LDY.W #$0003                                               ;84837C|A00300  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84837F|B7CC    |0000CC;
    BMI +                                                      ;848381|3002    |848385;
    BRA .label1                                                ;848383|8006    |84838B;
 
 
  + SEP #$20                                                   ;848385|E220    |      ;
    XBA                                                        ;848387|EB      |      ;
    LDA.B #$FF                                                 ;848388|A9FF    |      ;
    XBA                                                        ;84838A|EB      |      ;
 
.label1:
    REP #$20                                                   ;84838B|C220    |      ;
    STA.B n16TempVar1                                          ;84838D|857E    |00007E;
    LDA.W #$0000                                               ;84838F|A90000  |      ;
    SEP #$20                                                   ;848392|E220    |      ;
    REP #$10                                                   ;848394|C210    |      ;
    LDY.W #$0004                                               ;848396|A00400  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;848399|B7CC    |0000CC;
    BMI +                                                      ;84839B|3002    |84839F;
    BRA .label2                                                ;84839D|8006    |8483A5;
 
 
  + SEP #$20                                                   ;84839F|E220    |      ;
    XBA                                                        ;8483A1|EB      |      ;
    LDA.B #$FF                                                 ;8483A2|A9FF    |      ;
    XBA                                                        ;8483A4|EB      |      ;
 
.label2:
    REP #$20                                                   ;8483A5|C220    |      ;
    STA.B n16TempVar2                                          ;8483A7|8580    |000080;
    REP #$30                                                   ;8483A9|C230    |      ;
    LDY.W #$001A                                               ;8483AB|A01A00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;8483AE|B7CC    |0000CC;
    CLC                                                        ;8483B0|18      |      ;
    ADC.B n16TempVar1                                          ;8483B1|657E    |00007E;
    REP #$30                                                   ;8483B3|C230    |      ;
    LDY.W #$001A                                               ;8483B5|A01A00  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;8483B8|97CC    |0000CC;
    REP #$30                                                   ;8483BA|C230    |      ;
    LDY.W #$001C                                               ;8483BC|A01C00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;8483BF|B7CC    |0000CC;
    CLC                                                        ;8483C1|18      |      ;
    ADC.B n16TempVar2                                          ;8483C2|6580    |000080;
    REP #$30                                                   ;8483C4|C230    |      ;
    LDY.W #$001C                                               ;8483C6|A01C00  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;8483C9|97CC    |0000CC;
 
.return:
    RTS                                                        ;8483CB|60      |      ;
 
 
fAI_Unknown8483CC:
    REP #$30                                                   ;8483CC|C230    |      ;
    SEP #$20                                                   ;8483CE|E220    |      ;
    LDY.W #$0001                                               ;8483D0|A00100  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;8483D3|B7CC    |0000CC;
    AND.B #$08                                                 ;8483D5|2908    |      ;
    BNE +                                                      ;8483D7|D003    |8483DC;
    JMP.W .justReturn                                          ;8483D9|4C1688  |848816;
 
 
  + LDY.W #$0006                                               ;8483DC|A00600  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;8483DF|B7CC    |0000CC;
    STA.B n8TempVar1                                           ;8483E1|8592    |000092;
    LDY.W #$0005                                               ;8483E3|A00500  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;8483E6|B7CC    |0000CC;
    CMP.B n8TempVar1                                           ;8483E8|C592    |000092;
    BEQ +                                                      ;8483EA|F003    |8483EF;
    JMP.W .justReturn                                          ;8483EC|4C1688  |848816;
 
 
  + LDY.W #$0008                                               ;8483EF|A00800  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;8483F2|B7CC    |0000CC;
    BNE .label2                                                ;8483F4|D050    |848446;
    LDY.W #$0007                                               ;8483F6|A00700  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;8483F9|B7CC    |0000CC;
    LDY.W #$0008                                               ;8483FB|A00800  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;8483FE|97CC    |0000CC;
    LDY.W #$000F                                               ;848400|A00F00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;848403|B7CC    |0000CC;
    BEQ .default                                               ;848405|F01C    |848423;
    CMP.B #$01                                                 ;848407|C901    |      ;
    BNE +                                                      ;848409|D003    |84840E;
    JMP.W .case01                                              ;84840B|4C2C85  |84852C;
 
 
  + CMP.B #$02                                                 ;84840E|C902    |      ;
    BNE +                                                      ;848410|D003    |848415;
    JMP.W .case02                                              ;848412|4C8E85  |84858E;
 
 
  + CMP.B #$04                                                 ;848415|C904    |      ;
    BNE +                                                      ;848417|D003    |84841C;
    JMP.W .case04                                              ;848419|4CF085  |8485F0;
 
 
  + CMP.B #$08                                                 ;84841C|C908    |      ;
    BNE .default                                               ;84841E|D003    |848423;
    JMP.W .case08                                              ;848420|4C5286  |848652;
 
 
.default:
    SEP #$20                                                   ;848423|E220    |      ;
    LDA.B $DE                                                  ;848425|A5DE    |0000DE;
    CMP.B #$00                                                 ;848427|C900    |      ;
    BNE +                                                      ;848429|D003    |84842E;
    JMP.W .case01                                              ;84842B|4C2C85  |84852C;
 
 
  + CMP.B #$01                                                 ;84842E|C901    |      ;
    BNE +                                                      ;848430|D003    |848435;
    JMP.W .case02                                              ;848432|4C8E85  |84858E;
 
 
  + CMP.B #$02                                                 ;848435|C902    |      ;
    BNE +                                                      ;848437|D003    |84843C;
    JMP.W .case04                                              ;848439|4CF085  |8485F0;
 
 
  + CMP.B #$03                                                 ;84843C|C903    |      ;
    BNE +                                                      ;84843E|D003    |848443;
    JMP.W .case08                                              ;848440|4C5286  |848652;
 
 
  + JMP.W .label11                                             ;848443|4CB386  |8486B3;
 
 
.label2:
    SEP #$20                                                   ;848446|E220    |      ;
    REP #$10                                                   ;848448|C210    |      ;
    LDY.W #$0001                                               ;84844A|A00100  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84844D|B7CC    |0000CC;
    AND.B #$80                                                 ;84844F|2980    |      ;
    BEQ +                                                      ;848451|F003    |848456;
    JMP.W .label13                                             ;848453|4C1D87  |84871D;
 
 
  + SEP #$20                                                   ;848456|E220    |      ;
    LDY.W #$0002                                               ;848458|A00200  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84845B|B7CC    |0000CC;
    CMP.B #$00                                                 ;84845D|C900    |      ;
    BEQ .label3                                                ;84845F|F00F    |848470;
    CMP.B #$01                                                 ;848461|C901    |      ;
    BEQ .label4                                                ;848463|F03A    |84849F;
    CMP.B #$02                                                 ;848465|C902    |      ;
    BEQ .label5                                                ;848467|F065    |8484CE;
    CMP.B #$03                                                 ;848469|C903    |      ;
    BNE .label3                                                ;84846B|D003    |848470;
    JMP.W .label6                                              ;84846D|4CFD84  |8484FD;
 
 
.label3:
    REP #$20                                                   ;848470|C220    |      ;
    LDA.W #$0000                                               ;848472|A90000  |      ;
    SEP #$20                                                   ;848475|E220    |      ;
    REP #$10                                                   ;848477|C210    |      ;
    LDY.W #$000A                                               ;848479|A00A00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84847C|B7CC    |0000CC;
    REP #$20                                                   ;84847E|C220    |      ;
    STA.B n16TempVar1                                          ;848480|857E    |00007E;
    REP #$30                                                   ;848482|C230    |      ;
    LDY.W #$001C                                               ;848484|A01C00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;848487|B7CC    |0000CC;
    STA.B n16TempVar2                                          ;848489|8580    |000080;
    REP #$30                                                   ;84848B|C230    |      ;
    LDY.W #$0020                                               ;84848D|A02000  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;848490|B7CC    |0000CC;
    CLC                                                        ;848492|18      |      ;
    ADC.B n16TempVar1                                          ;848493|657E    |00007E;
    CMP.B n16TempVar2                                          ;848495|C580    |000080;
    BCS +                                                      ;848497|B003    |84849C;
    JMP.W .label11                                             ;848499|4CB386  |8486B3;
 
 
  + JMP.W .label13                                             ;84849C|4C1D87  |84871D;
 
 
.label4:
    REP #$20                                                   ;84849F|C220    |      ;
    LDA.W #$0000                                               ;8484A1|A90000  |      ;
    SEP #$20                                                   ;8484A4|E220    |      ;
    REP #$10                                                   ;8484A6|C210    |      ;
    LDY.W #$000A                                               ;8484A8|A00A00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;8484AB|B7CC    |0000CC;
    REP #$20                                                   ;8484AD|C220    |      ;
    STA.B n16TempVar1                                          ;8484AF|857E    |00007E;
    REP #$30                                                   ;8484B1|C230    |      ;
    LDY.W #$001C                                               ;8484B3|A01C00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;8484B6|B7CC    |0000CC;
    STA.B n16TempVar2                                          ;8484B8|8580    |000080;
    REP #$30                                                   ;8484BA|C230    |      ;
    LDY.W #$0020                                               ;8484BC|A02000  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;8484BF|B7CC    |0000CC;
    SEC                                                        ;8484C1|38      |      ;
    SBC.B n16TempVar1                                          ;8484C2|E57E    |00007E;
    CMP.B n16TempVar2                                          ;8484C4|C580    |000080;
    BCC +                                                      ;8484C6|9003    |8484CB;
    JMP.W .label11                                             ;8484C8|4CB386  |8486B3;
 
 
  + JMP.W .label13                                             ;8484CB|4C1D87  |84871D;
 
 
.label5:
    REP #$20                                                   ;8484CE|C220    |      ;
    LDA.W #$0000                                               ;8484D0|A90000  |      ;
    SEP #$20                                                   ;8484D3|E220    |      ;
    REP #$10                                                   ;8484D5|C210    |      ;
    LDY.W #$0009                                               ;8484D7|A00900  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;8484DA|B7CC    |0000CC;
    REP #$20                                                   ;8484DC|C220    |      ;
    STA.B n16TempVar1                                          ;8484DE|857E    |00007E;
    REP #$30                                                   ;8484E0|C230    |      ;
    LDY.W #$001A                                               ;8484E2|A01A00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;8484E5|B7CC    |0000CC;
    STA.B n16TempVar2                                          ;8484E7|8580    |000080;
    REP #$30                                                   ;8484E9|C230    |      ;
    LDY.W #$001E                                               ;8484EB|A01E00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;8484EE|B7CC    |0000CC;
    CLC                                                        ;8484F0|18      |      ;
    ADC.B n16TempVar1                                          ;8484F1|657E    |00007E;
    CMP.B n16TempVar2                                          ;8484F3|C580    |000080;
    BCS +                                                      ;8484F5|B003    |8484FA;
    JMP.W .label11                                             ;8484F7|4CB386  |8486B3;
 
 
  + JMP.W .label13                                             ;8484FA|4C1D87  |84871D;
 
 
.label6:
    REP #$20                                                   ;8484FD|C220    |      ;
    LDA.W #$0000                                               ;8484FF|A90000  |      ;
    SEP #$20                                                   ;848502|E220    |      ;
    REP #$10                                                   ;848504|C210    |      ;
    LDY.W #$0009                                               ;848506|A00900  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;848509|B7CC    |0000CC;
    REP #$20                                                   ;84850B|C220    |      ;
    STA.B n16TempVar1                                          ;84850D|857E    |00007E;
    REP #$30                                                   ;84850F|C230    |      ;
    LDY.W #$001A                                               ;848511|A01A00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;848514|B7CC    |0000CC;
    STA.B n16TempVar2                                          ;848516|8580    |000080;
    REP #$30                                                   ;848518|C230    |      ;
    LDY.W #$001E                                               ;84851A|A01E00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84851D|B7CC    |0000CC;
    SEC                                                        ;84851F|38      |      ;
    SBC.B n16TempVar1                                          ;848520|E57E    |00007E;
    CMP.B n16TempVar2                                          ;848522|C580    |000080;
    BCC +                                                      ;848524|9003    |848529;
    JMP.W .label11                                             ;848526|4CB386  |8486B3;
 
 
  + JMP.W .label13                                             ;848529|4C1D87  |84871D;
 
 
.case01:
    SEP #$20                                                   ;84852C|E220    |      ;
    REP #$10                                                   ;84852E|C210    |      ;
    LDY.W #$0001                                               ;848530|A00100  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;848533|B7CC    |0000CC;
    AND.B #$80                                                 ;848535|2980    |      ;
    BNE .label7                                                ;848537|D02C    |848565;
    REP #$20                                                   ;848539|C220    |      ;
    LDA.W #$0000                                               ;84853B|A90000  |      ;
    SEP #$20                                                   ;84853E|E220    |      ;
    REP #$10                                                   ;848540|C210    |      ;
    LDY.W #$000A                                               ;848542|A00A00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;848545|B7CC    |0000CC;
    REP #$20                                                   ;848547|C220    |      ;
    STA.B n16TempVar1                                          ;848549|857E    |00007E;
    REP #$30                                                   ;84854B|C230    |      ;
    LDY.W #$001C                                               ;84854D|A01C00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;848550|B7CC    |0000CC;
    STA.B n16TempVar2                                          ;848552|8580    |000080;
    REP #$30                                                   ;848554|C230    |      ;
    LDY.W #$0020                                               ;848556|A02000  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;848559|B7CC    |0000CC;
    CLC                                                        ;84855B|18      |      ;
    ADC.B n16TempVar1                                          ;84855C|657E    |00007E;
    CMP.B n16TempVar2                                          ;84855E|C580    |000080;
    BCS .label7                                                ;848560|B003    |848565;
    JMP.W .label11                                             ;848562|4CB386  |8486B3;
 
 
.label7:
    SEP #$20                                                   ;848565|E220    |      ;
    LDY.W #$000B                                               ;848567|A00B00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84856A|B7CC    |0000CC;
    LDY.W #$0005                                               ;84856C|A00500  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84856F|97CC    |0000CC;
    LDY.W #$0006                                               ;848571|A00600  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;848574|97CC    |0000CC;
    LDY.W #$0003                                               ;848576|A00300  |      ;
    LDA.B #$00                                                 ;848579|A900    |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84857B|97CC    |0000CC;
    LDY.W #$0004                                               ;84857D|A00400  |      ;
    LDA.B #$01                                                 ;848580|A901    |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;848582|97CC    |0000CC;
    LDY.W #$0002                                               ;848584|A00200  |      ;
    LDA.B #$00                                                 ;848587|A900    |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;848589|97CC    |0000CC;
    JMP.W .label12                                             ;84858B|4CF486  |8486F4;
 
 
.case02:
    SEP #$20                                                   ;84858E|E220    |      ;
    REP #$10                                                   ;848590|C210    |      ;
    LDY.W #$0001                                               ;848592|A00100  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;848595|B7CC    |0000CC;
    AND.B #$80                                                 ;848597|2980    |      ;
    BNE .label8                                                ;848599|D02C    |8485C7;
    REP #$20                                                   ;84859B|C220    |      ;
    LDA.W #$0000                                               ;84859D|A90000  |      ;
    SEP #$20                                                   ;8485A0|E220    |      ;
    REP #$10                                                   ;8485A2|C210    |      ;
    LDY.W #$000A                                               ;8485A4|A00A00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;8485A7|B7CC    |0000CC;
    REP #$20                                                   ;8485A9|C220    |      ;
    STA.B n16TempVar1                                          ;8485AB|857E    |00007E;
    REP #$30                                                   ;8485AD|C230    |      ;
    LDY.W #$001C                                               ;8485AF|A01C00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;8485B2|B7CC    |0000CC;
    STA.B n16TempVar2                                          ;8485B4|8580    |000080;
    REP #$30                                                   ;8485B6|C230    |      ;
    LDY.W #$0020                                               ;8485B8|A02000  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;8485BB|B7CC    |0000CC;
    SEC                                                        ;8485BD|38      |      ;
    SBC.B n16TempVar1                                          ;8485BE|E57E    |00007E;
    CMP.B n16TempVar2                                          ;8485C0|C580    |000080;
    BCC .label8                                                ;8485C2|9003    |8485C7;
    JMP.W .label11                                             ;8485C4|4CB386  |8486B3;
 
 
.label8:
    SEP #$20                                                   ;8485C7|E220    |      ;
    LDY.W #$000B                                               ;8485C9|A00B00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;8485CC|B7CC    |0000CC;
    LDY.W #$0005                                               ;8485CE|A00500  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;8485D1|97CC    |0000CC;
    LDY.W #$0006                                               ;8485D3|A00600  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;8485D6|97CC    |0000CC;
    LDY.W #$0003                                               ;8485D8|A00300  |      ;
    LDA.B #$00                                                 ;8485DB|A900    |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;8485DD|97CC    |0000CC;
    LDY.W #$0004                                               ;8485DF|A00400  |      ;
    LDA.B #$FF                                                 ;8485E2|A9FF    |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;8485E4|97CC    |0000CC;
    LDY.W #$0002                                               ;8485E6|A00200  |      ;
    LDA.B #$01                                                 ;8485E9|A901    |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;8485EB|97CC    |0000CC;
    JMP.W .label12                                             ;8485ED|4CF486  |8486F4;
 
 
.case04:
    SEP #$20                                                   ;8485F0|E220    |      ;
    REP #$10                                                   ;8485F2|C210    |      ;
    LDY.W #$0001                                               ;8485F4|A00100  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;8485F7|B7CC    |0000CC;
    AND.B #$80                                                 ;8485F9|2980    |      ;
    BNE .label9                                                ;8485FB|D02C    |848629;
    REP #$20                                                   ;8485FD|C220    |      ;
    LDA.W #$0000                                               ;8485FF|A90000  |      ;
    SEP #$20                                                   ;848602|E220    |      ;
    REP #$10                                                   ;848604|C210    |      ;
    LDY.W #$0009                                               ;848606|A00900  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;848609|B7CC    |0000CC;
    REP #$20                                                   ;84860B|C220    |      ;
    STA.B n16TempVar1                                          ;84860D|857E    |00007E;
    REP #$30                                                   ;84860F|C230    |      ;
    LDY.W #$001A                                               ;848611|A01A00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;848614|B7CC    |0000CC;
    STA.B n16TempVar2                                          ;848616|8580    |000080;
    REP #$30                                                   ;848618|C230    |      ;
    LDY.W #$001E                                               ;84861A|A01E00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84861D|B7CC    |0000CC;
    CLC                                                        ;84861F|18      |      ;
    ADC.B n16TempVar1                                          ;848620|657E    |00007E;
    CMP.B n16TempVar2                                          ;848622|C580    |000080;
    BCS .label9                                                ;848624|B003    |848629;
    JMP.W .label11                                             ;848626|4CB386  |8486B3;
 
 
.label9:
    SEP #$20                                                   ;848629|E220    |      ;
    LDY.W #$000B                                               ;84862B|A00B00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84862E|B7CC    |0000CC;
    LDY.W #$0005                                               ;848630|A00500  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;848633|97CC    |0000CC;
    LDY.W #$0006                                               ;848635|A00600  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;848638|97CC    |0000CC;
    LDY.W #$0003                                               ;84863A|A00300  |      ;
    LDA.B #$01                                                 ;84863D|A901    |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84863F|97CC    |0000CC;
    LDY.W #$0004                                               ;848641|A00400  |      ;
    LDA.B #$00                                                 ;848644|A900    |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;848646|97CC    |0000CC;
    LDY.W #$0002                                               ;848648|A00200  |      ;
    LDA.B #$02                                                 ;84864B|A902    |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84864D|97CC    |0000CC;
    JMP.W .label12                                             ;84864F|4CF486  |8486F4;
 
 
.case08:
    SEP #$20                                                   ;848652|E220    |      ;
    REP #$10                                                   ;848654|C210    |      ;
    LDY.W #$0001                                               ;848656|A00100  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;848659|B7CC    |0000CC;
    AND.B #$80                                                 ;84865B|2980    |      ;
    BNE .label10                                               ;84865D|D02C    |84868B;
    REP #$20                                                   ;84865F|C220    |      ;
    LDA.W #$0000                                               ;848661|A90000  |      ;
    SEP #$20                                                   ;848664|E220    |      ;
    REP #$10                                                   ;848666|C210    |      ;
    LDY.W #$0009                                               ;848668|A00900  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84866B|B7CC    |0000CC;
    REP #$20                                                   ;84866D|C220    |      ;
    STA.B n16TempVar1                                          ;84866F|857E    |00007E;
    REP #$30                                                   ;848671|C230    |      ;
    LDY.W #$001A                                               ;848673|A01A00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;848676|B7CC    |0000CC;
    STA.B n16TempVar2                                          ;848678|8580    |000080;
    REP #$30                                                   ;84867A|C230    |      ;
    LDY.W #$001E                                               ;84867C|A01E00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84867F|B7CC    |0000CC;
    SEC                                                        ;848681|38      |      ;
    SBC.B n16TempVar1                                          ;848682|E57E    |00007E;
    CMP.B n16TempVar2                                          ;848684|C580    |000080;
    BCC .label10                                               ;848686|9003    |84868B;
    JMP.W .label11                                             ;848688|4CB386  |8486B3;
 
 
.label10:
    SEP #$20                                                   ;84868B|E220    |      ;
    LDY.W #$000B                                               ;84868D|A00B00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;848690|B7CC    |0000CC;
    LDY.W #$0005                                               ;848692|A00500  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;848695|97CC    |0000CC;
    LDY.W #$0006                                               ;848697|A00600  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84869A|97CC    |0000CC;
    LDY.W #$0003                                               ;84869C|A00300  |      ;
    LDA.B #$FF                                                 ;84869F|A9FF    |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;8486A1|97CC    |0000CC;
    LDY.W #$0004                                               ;8486A3|A00400  |      ;
    LDA.B #$00                                                 ;8486A6|A900    |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;8486A8|97CC    |0000CC;
    LDY.W #$0002                                               ;8486AA|A00200  |      ;
    LDA.B #$03                                                 ;8486AD|A903    |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;8486AF|97CC    |0000CC;
    BRA .label12                                               ;8486B1|8041    |8486F4;
 
 
.label11:
    SEP #$20                                                   ;8486B3|E220    |      ;
    LDY.W #$0003                                               ;8486B5|A00300  |      ;
    LDA.B #$00                                                 ;8486B8|A900    |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;8486BA|97CC    |0000CC;
    LDY.W #$0004                                               ;8486BC|A00400  |      ;
    LDA.B #$00                                                 ;8486BF|A900    |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;8486C1|97CC    |0000CC;
    LDY.W #$0008                                               ;8486C3|A00800  |      ;
    LDA.B #$00                                                 ;8486C6|A900    |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;8486C8|97CC    |0000CC;
    REP #$30                                                   ;8486CA|C230    |      ;
    LDY.W #$0033                                               ;8486CC|A03300  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;8486CF|B7CC    |0000CC;
    STA.B ptrUnknown0x72                                       ;8486D1|8572    |000072;
    SEP #$20                                                   ;8486D3|E220    |      ;
    LDA.B #$B3                                                 ;8486D5|A9B3    |      ;
    STA.B ptrUnknown0x72+2                                     ;8486D7|8574    |000074;
    JSL.L fAI_Unknown848895                                    ;8486D9|22958884|848895;
    SEP #$20                                                   ;8486DD|E220    |      ;
    REP #$10                                                   ;8486DF|C210    |      ;
    LDY.W #$0001                                               ;8486E1|A00100  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;8486E4|B7CC    |0000CC;
    ORA.B #$04                                                 ;8486E6|0904    |      ;
    SEP #$20                                                   ;8486E8|E220    |      ;
    REP #$10                                                   ;8486EA|C210    |      ;
    LDY.W #$0001                                               ;8486EC|A00100  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;8486EF|97CC    |0000CC;
    JMP.W .justReturn                                          ;8486F1|4C1688  |848816;
 
 
.label12:
    REP #$30                                                   ;8486F4|C230    |      ;
    LDY.W #$0036                                               ;8486F6|A03600  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;8486F9|B7CC    |0000CC;
    STA.B ptrUnknown0x72                                       ;8486FB|8572    |000072;
    SEP #$20                                                   ;8486FD|E220    |      ;
    LDA.B #$B3                                                 ;8486FF|A9B3    |      ;
    STA.B ptrUnknown0x72+2                                     ;848701|8574    |000074;
    JSL.L fAI_Unknown848895                                    ;848703|22958884|848895;
    SEP #$20                                                   ;848707|E220    |      ;
    REP #$10                                                   ;848709|C210    |      ;
    LDY.W #$0001                                               ;84870B|A00100  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84870E|B7CC    |0000CC;
    ORA.B #$04                                                 ;848710|0904    |      ;
    SEP #$20                                                   ;848712|E220    |      ;
    REP #$10                                                   ;848714|C210    |      ;
    LDY.W #$0001                                               ;848716|A00100  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;848719|97CC    |0000CC;
    BRA .label14                                               ;84871B|8013    |848730;
 
 
.label13:
    SEP #$20                                                   ;84871D|E220    |      ;
    REP #$10                                                   ;84871F|C210    |      ;
    LDY.W #$0008                                               ;848721|A00800  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;848724|B7CC    |0000CC;
    DEC A                                                      ;848726|3A      |      ;
    SEP #$20                                                   ;848727|E220    |      ;
    REP #$10                                                   ;848729|C210    |      ;
    LDY.W #$0008                                               ;84872B|A00800  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84872E|97CC    |0000CC;
 
.label14:
    SEP #$20                                                   ;848730|E220    |      ;
    REP #$10                                                   ;848732|C210    |      ;
    LDY.W #$0003                                               ;848734|A00300  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;848737|B7CC    |0000CC;
    BNE .label15                                               ;848739|D00E    |848749;
    SEP #$20                                                   ;84873B|E220    |      ;
    REP #$10                                                   ;84873D|C210    |      ;
    LDY.W #$0004                                               ;84873F|A00400  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;848742|B7CC    |0000CC;
    BNE .label15                                               ;848744|D003    |848749;
    JMP.W .justReturn                                          ;848746|4C1688  |848816;
 
 
.label15:
    REP #$20                                                   ;848749|C220    |      ;
    REP #$30                                                   ;84874B|C230    |      ;
    LDY.W #$001A                                               ;84874D|A01A00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;848750|B7CC    |0000CC;
    STA.B $DF                                                  ;848752|85DF    |0000DF;
    REP #$30                                                   ;848754|C230    |      ;
    LDY.W #$001C                                               ;848756|A01C00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;848759|B7CC    |0000CC;
    STA.B $E1                                                  ;84875B|85E1    |0000E1;
    LDA.W #$0000                                               ;84875D|A90000  |      ;
    SEP #$20                                                   ;848760|E220    |      ;
    REP #$10                                                   ;848762|C210    |      ;
    LDY.W #$0003                                               ;848764|A00300  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;848767|B7CC    |0000CC;
    BMI +                                                      ;848769|3002    |84876D;
    BRA .label16                                               ;84876B|8005    |848772;
 
 
  + SEP #$20                                                   ;84876D|E220    |      ;
    EOR.B #$FF                                                 ;84876F|49FF    |      ;
    INC A                                                      ;848771|1A      |      ;
 
.label16:
    REP #$20                                                   ;848772|C220    |      ;
    STA.B $E5                                                  ;848774|85E5    |0000E5;
    LDA.W #$0000                                               ;848776|A90000  |      ;
    SEP #$20                                                   ;848779|E220    |      ;
    REP #$10                                                   ;84877B|C210    |      ;
    LDY.W #$0004                                               ;84877D|A00400  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;848780|B7CC    |0000CC;
    BMI +                                                      ;848782|3002    |848786;
    BRA .label17                                               ;848784|8005    |84878B;
 
 
  + SEP #$20                                                   ;848786|E220    |      ;
    EOR.B #$FF                                                 ;848788|49FF    |      ;
    INC A                                                      ;84878A|1A      |      ;
 
.label17:
    REP #$20                                                   ;84878B|C220    |      ;
    STA.B $E7                                                  ;84878D|85E7    |0000E7;
    STZ.B $E3                                                  ;84878F|64E3    |0000E3;
    SEP #$20                                                   ;848791|E220    |      ;
    REP #$10                                                   ;848793|C210    |      ;
    LDY.W #$0001                                               ;848795|A00100  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;848798|B7CC    |0000CC;
    AND.B #$80                                                 ;84879A|2980    |      ;
    BEQ .label18                                               ;84879C|F045    |8487E3;
    REP #$20                                                   ;84879E|C220    |      ;
    LDA.W #$0000                                               ;8487A0|A90000  |      ;
    SEP #$20                                                   ;8487A3|E220    |      ;
    REP #$10                                                   ;8487A5|C210    |      ;
    LDY.W #$0002                                               ;8487A7|A00200  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;8487AA|B7CC    |0000CC;
    REP #$20                                                   ;8487AC|C220    |      ;
    JSL.L fGameEngine_Unknown83AF37                            ;8487AE|2237AF83|83AF37;
    REP #$20                                                   ;8487B2|C220    |      ;
    PHA                                                        ;8487B4|48      |      ;
    LDA.B $E9                                                  ;8487B5|A5E9    |0000E9;
    SEP #$20                                                   ;8487B7|E220    |      ;
    REP #$10                                                   ;8487B9|C210    |      ;
    LDY.W #$000E                                               ;8487BB|A00E00  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;8487BE|97CC    |0000CC;
    REP #$20                                                   ;8487C0|C220    |      ;
    PLA                                                        ;8487C2|68      |      ;
    CMP.W #$0000                                               ;8487C3|C90000  |      ;
    BEQ +                                                      ;8487C6|F003    |8487CB;
    JMP.W .return                                              ;8487C8|4C1788  |848817;
 
 
  + LDA.B $E9                                                  ;8487CB|A5E9    |0000E9;
    CMP.W #$00FF                                               ;8487CD|C9FF00  |      ;
    BEQ .return                                                ;8487D0|F045    |848817;
    CMP.W #$00E1                                               ;8487D2|C9E100  |      ;
    BEQ .label20                                               ;8487D5|F07D    |848854;
    CMP.W #$00C0                                               ;8487D7|C9C000  |      ;
    BCC .label18                                               ;8487DA|9007    |8487E3;
    CMP.W #$00D0                                               ;8487DC|C9D000  |      ;
    BCS .label18                                               ;8487DF|B002    |8487E3;
    BRA .return                                                ;8487E1|8034    |848817;
 
 
.label18:
    REP #$20                                                   ;8487E3|C220    |      ;
    LDA.B $EB                                                  ;8487E5|A5EB    |0000EB;
    CMP.W #$00FF                                               ;8487E7|C9FF00  |      ;
    BEQ .return                                                ;8487EA|F02B    |848817;
    CMP.W #$00E1                                               ;8487EC|C9E100  |      ;
    BEQ .label21                                               ;8487EF|F077    |848868;
    CMP.W #$00C0                                               ;8487F1|C9C000  |      ;
    BCC .label19                                               ;8487F4|9007    |8487FD;
    CMP.W #$00D0                                               ;8487F6|C9D000  |      ;
    BCS .label19                                               ;8487F9|B002    |8487FD;
    BRA .return                                                ;8487FB|801A    |848817;
 
 
.label19:
    REP #$20                                                   ;8487FD|C220    |      ;
    LDA.W #$0000                                               ;8487FF|A90000  |      ;
    SEP #$20                                                   ;848802|E220    |      ;
    REP #$10                                                   ;848804|C210    |      ;
    LDY.W #$0002                                               ;848806|A00200  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;848809|B7CC    |0000CC;
    REP #$20                                                   ;84880B|C220    |      ;
    JSL.L fGameEngine_Unknown83AEC3                            ;84880D|22C3AE83|83AEC3;
    CMP.W #$0000                                               ;848811|C90000  |      ;
    BNE .return                                                ;848814|D001    |848817;
 
.justReturn:
    RTS                                                        ;848816|60      |      ;
 
 
.return:
    SEP #$20                                                   ;848817|E220    |      ;
    REP #$10                                                   ;848819|C210    |      ;
    LDY.W #$0003                                               ;84881B|A00300  |      ;
    LDA.B #$00                                                 ;84881E|A900    |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;848820|97CC    |0000CC;
    SEP #$20                                                   ;848822|E220    |      ;
    REP #$10                                                   ;848824|C210    |      ;
    LDY.W #$0004                                               ;848826|A00400  |      ;
    LDA.B #$00                                                 ;848829|A900    |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84882B|97CC    |0000CC;
    SEP #$20                                                   ;84882D|E220    |      ;
    REP #$10                                                   ;84882F|C210    |      ;
    LDY.W #$000B                                               ;848831|A00B00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;848834|B7CC    |0000CC;
    SEP #$20                                                   ;848836|E220    |      ;
    REP #$10                                                   ;848838|C210    |      ;
    LDY.W #$0005                                               ;84883A|A00500  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84883D|97CC    |0000CC;
    SEP #$20                                                   ;84883F|E220    |      ;
    REP #$10                                                   ;848841|C210    |      ;
    LDY.W #$0006                                               ;848843|A00600  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;848846|97CC    |0000CC;
    SEP #$20                                                   ;848848|E220    |      ;
    REP #$10                                                   ;84884A|C210    |      ;
    LDY.W #$000F                                               ;84884C|A00F00  |      ;
    LDA.B #$00                                                 ;84884F|A900    |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;848851|97CC    |0000CC;
    RTS                                                        ;848853|60      |      ;
 
 
.label20:
    SEP #$20                                                   ;848854|E220    |      ;
    REP #$10                                                   ;848856|C210    |      ;
    LDY.W #$003F                                               ;848858|A03F00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84885B|B7CC    |0000CC;
    CMP.B #$24                                                 ;84885D|C924    |      ;
    BCS .return                                                ;84885F|B0B6    |848817;
    CMP.B #$18                                                 ;848861|C918    |      ;
    BCC .return                                                ;848863|90B2    |848817;
    JMP.W .label18                                             ;848865|4CE387  |8487E3;
 
 
.label21:
    SEP #$20                                                   ;848868|E220    |      ;
    REP #$10                                                   ;84886A|C210    |      ;
    LDY.W #$003F                                               ;84886C|A03F00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84886F|B7CC    |0000CC;
    CMP.B #$24                                                 ;848871|C924    |      ;
    BCS .return                                                ;848873|B0A2    |848817;
    CMP.B #$18                                                 ;848875|C918    |      ;
    BCC .return                                                ;848877|909E    |848817;
    JMP.W .label19                                             ;848879|4CFD87  |8487FD;
 
 
fAI_Unknown84887C:
    REP #$30                                                   ;84887C|C230    |      ; A: nArg, return $0xCC
    ASL A                                                      ;84887E|0A      |      ;
    ASL A                                                      ;84887F|0A      |      ;
    ASL A                                                      ;848880|0A      |      ;
    ASL A                                                      ;848881|0A      |      ;
    ASL A                                                      ;848882|0A      |      ;
    ASL A                                                      ;848883|0A      |      ;
    STA.B n16TempVar1                                          ;848884|857E    |00007E; nTempVar1 = A * 64
    LDA.W #$B586                                               ;848886|A986B5  |      ;
    CLC                                                        ;848889|18      |      ;
    ADC.B n16TempVar1                                          ;84888A|657E    |00007E;
    STA.B ptrAIUnknown0xCC                                     ;84888C|85CC    |0000CC;
    SEP #$20                                                   ;84888E|E220    |      ;
    LDA.B #$7E                                                 ;848890|A97E    |      ;
    STA.B ptrAIUnknown0xCC+2                                   ;848892|85CE    |0000CE; $0xCC = 7EB586 + A * 64
    RTL                                                        ;848894|6B      |      ;
 
 
fAI_Unknown848895:
    REP #$30                                                   ;848895|C230    |      ;
    SEP #$20                                                   ;848897|E220    |      ;
    LDA.B #$00                                                 ;848899|A900    |      ;
    XBA                                                        ;84889B|EB      |      ;
    SEP #$20                                                   ;84889C|E220    |      ;
    REP #$10                                                   ;84889E|C210    |      ;
    LDY.W #$0002                                               ;8488A0|A00200  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;8488A3|B7CC    |0000CC;
    REP #$20                                                   ;8488A5|C220    |      ;
    STA.B n16TempVar1                                          ;8488A7|857E    |00007E;
    ASL A                                                      ;8488A9|0A      |      ;
    CLC                                                        ;8488AA|18      |      ;
    ADC.B n16TempVar1                                          ;8488AB|657E    |00007E;
    TAY                                                        ;8488AD|A8      |      ;
    REP #$20                                                   ;8488AE|C220    |      ;
    LDA.B [ptrUnknown0x72],Y                                   ;8488B0|B772    |000072;
    PHY                                                        ;8488B2|5A      |      ;
    REP #$30                                                   ;8488B3|C230    |      ;
    LDY.W #$0016                                               ;8488B5|A01600  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;8488B8|97CC    |0000CC;
    PLY                                                        ;8488BA|7A      |      ;
    INY                                                        ;8488BB|C8      |      ;
    INY                                                        ;8488BC|C8      |      ;
    SEP #$20                                                   ;8488BD|E220    |      ;
    LDA.B #$00                                                 ;8488BF|A900    |      ;
    XBA                                                        ;8488C1|EB      |      ;
    LDA.B [ptrUnknown0x72],Y                                   ;8488C2|B772    |000072;
    REP #$20                                                   ;8488C4|C220    |      ;
    ASL A                                                      ;8488C6|0A      |      ;
    ASL A                                                      ;8488C7|0A      |      ;
    ASL A                                                      ;8488C8|0A      |      ;
    ASL A                                                      ;8488C9|0A      |      ;
    ASL A                                                      ;8488CA|0A      |      ;
    ASL A                                                      ;8488CB|0A      |      ;
    REP #$30                                                   ;8488CC|C230    |      ;
    LDY.W #$0014                                               ;8488CE|A01400  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;8488D1|97CC    |0000CC;
    RTL                                                        ;8488D3|6B      |      ;
 
 
fAI_Unknown8488D4:
    REP #$30                                                   ;8488D4|C230    |      ;
    SEP #$20                                                   ;8488D6|E220    |      ;
    REP #$10                                                   ;8488D8|C210    |      ;
    LDY.W #$0000                                               ;8488DA|A00000  |      ;
    LDA.B #$01                                                 ;8488DD|A901    |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;8488DF|97CC    |0000CC;
    SEP #$20                                                   ;8488E1|E220    |      ;
    REP #$10                                                   ;8488E3|C210    |      ;
    LDY.W #$0001                                               ;8488E5|A00100  |      ;
    LDA.B #$00                                                 ;8488E8|A900    |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;8488EA|97CC    |0000CC;
    SEP #$20                                                   ;8488EC|E220    |      ;
    REP #$10                                                   ;8488EE|C210    |      ;
    LDY.W #$000F                                               ;8488F0|A00F00  |      ;
    LDA.B #$00                                                 ;8488F3|A900    |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;8488F5|97CC    |0000CC;
    SEP #$20                                                   ;8488F7|E220    |      ;
    REP #$10                                                   ;8488F9|C210    |      ;
    LDY.W #$0003                                               ;8488FB|A00300  |      ;
    LDA.B #$00                                                 ;8488FE|A900    |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;848900|97CC    |0000CC;
    SEP #$20                                                   ;848902|E220    |      ;
    REP #$10                                                   ;848904|C210    |      ;
    LDY.W #$0004                                               ;848906|A00400  |      ;
    LDA.B #$00                                                 ;848909|A900    |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84890B|97CC    |0000CC;
    SEP #$20                                                   ;84890D|E220    |      ;
    REP #$10                                                   ;84890F|C210    |      ;
    LDY.W #$0005                                               ;848911|A00500  |      ;
    LDA.B #$00                                                 ;848914|A900    |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;848916|97CC    |0000CC;
    SEP #$20                                                   ;848918|E220    |      ;
    REP #$10                                                   ;84891A|C210    |      ;
    LDY.W #$0006                                               ;84891C|A00600  |      ;
    LDA.B #$00                                                 ;84891F|A900    |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;848921|97CC    |0000CC;
    SEP #$20                                                   ;848923|E220    |      ;
    REP #$10                                                   ;848925|C210    |      ;
    LDY.W #$000C                                               ;848927|A00C00  |      ;
    LDA.B #$00                                                 ;84892A|A900    |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84892C|97CC    |0000CC;
    REP #$30                                                   ;84892E|C230    |      ;
    LDY.W #$0010                                               ;848930|A01000  |      ;
    LDA.W #$0000                                               ;848933|A90000  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;848936|97CC    |0000CC;
    REP #$30                                                   ;848938|C230    |      ;
    LDY.W #$001A                                               ;84893A|A01A00  |      ;
    LDA.W #$0000                                               ;84893D|A90000  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;848940|97CC    |0000CC;
    REP #$30                                                   ;848942|C230    |      ;
    LDY.W #$001C                                               ;848944|A01C00  |      ;
    LDA.W #$0000                                               ;848947|A90000  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84894A|97CC    |0000CC;
    REP #$30                                                   ;84894C|C230    |      ;
    LDY.W #$0012                                               ;84894E|A01200  |      ;
    LDA.W #$0000                                               ;848951|A90000  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;848954|97CC    |0000CC;
    REP #$30                                                   ;848956|C230    |      ;
    LDY.W #$0014                                               ;848958|A01400  |      ;
    LDA.W #$0000                                               ;84895B|A90000  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84895E|97CC    |0000CC;
    RTS                                                        ;848960|60      |      ;
 
 
fAI_Unknown848961:
    REP #$30                                                   ;848961|C230    |      ;
    SEP #$20                                                   ;848963|E220    |      ;
    REP #$10                                                   ;848965|C210    |      ;
    LDY.W #$0000                                               ;848967|A00000  |      ;
    LDA.B #$01                                                 ;84896A|A901    |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84896C|97CC    |0000CC;
    SEP #$20                                                   ;84896E|E220    |      ;
    REP #$10                                                   ;848970|C210    |      ;
    LDY.W #$0001                                               ;848972|A00100  |      ;
    LDA.B #$01                                                 ;848975|A901    |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;848977|97CC    |0000CC;
    SEP #$20                                                   ;848979|E220    |      ;
    REP #$10                                                   ;84897B|C210    |      ;
    LDY.W #$000F                                               ;84897D|A00F00  |      ;
    LDA.B #$00                                                 ;848980|A900    |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;848982|97CC    |0000CC;
    SEP #$20                                                   ;848984|E220    |      ;
    REP #$10                                                   ;848986|C210    |      ;
    LDY.W #$0003                                               ;848988|A00300  |      ;
    LDA.B #$00                                                 ;84898B|A900    |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84898D|97CC    |0000CC;
    SEP #$20                                                   ;84898F|E220    |      ;
    REP #$10                                                   ;848991|C210    |      ;
    LDY.W #$0004                                               ;848993|A00400  |      ;
    LDA.B #$00                                                 ;848996|A900    |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;848998|97CC    |0000CC;
    SEP #$20                                                   ;84899A|E220    |      ;
    REP #$10                                                   ;84899C|C210    |      ;
    LDY.W #$0005                                               ;84899E|A00500  |      ;
    LDA.B #$00                                                 ;8489A1|A900    |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;8489A3|97CC    |0000CC;
    SEP #$20                                                   ;8489A5|E220    |      ;
    REP #$10                                                   ;8489A7|C210    |      ;
    LDY.W #$0006                                               ;8489A9|A00600  |      ;
    LDA.B #$00                                                 ;8489AC|A900    |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;8489AE|97CC    |0000CC;
    REP #$30                                                   ;8489B0|C230    |      ;
    LDY.W #$0010                                               ;8489B2|A01000  |      ;
    LDA.W #$0000                                               ;8489B5|A90000  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;8489B8|97CC    |0000CC;
    RTS                                                        ;8489BA|60      |      ;
 
 
fAIAction0x00_SetMusicTrack:
    REP #$30                                                   ;8489BB|C230    |      ;
    REP #$30                                                   ;8489BD|C230    |      ;
    LDA.B ptrAIActionData                                      ;8489BF|A5C9    |0000C9;
    CLC                                                        ;8489C1|18      |      ;
    ADC.W #$0001                                               ;8489C2|690100  |      ;
    STA.B ptrAIActionData                                      ;8489C5|85C9    |0000C9;
    SEP #$20                                                   ;8489C7|E220    |      ;
    LDA.B [ptrAIActionData]                                    ;8489C9|A7C9    |0000C9;
    STA.W nAudioMusicTrackId                                   ;8489CB|8D1001  |000110;
    REP #$30                                                   ;8489CE|C230    |      ;
    LDA.B ptrAIActionData                                      ;8489D0|A5C9    |0000C9;
    CLC                                                        ;8489D2|18      |      ;
    ADC.W #$0001                                               ;8489D3|690100  |      ;
    STA.B ptrAIActionData                                      ;8489D6|85C9    |0000C9;
    REP #$30                                                   ;8489D8|C230    |      ;
    LDA.B ptrAIActionData                                      ;8489DA|A5C9    |0000C9;
    CLC                                                        ;8489DC|18      |      ;
    ADC.W #$0001                                               ;8489DD|690100  |      ;
    STA.B ptrAIActionData                                      ;8489E0|85C9    |0000C9;
    RTS                                                        ;8489E2|60      |      ;
 
 
fAIAction0x01_UnfreezeTime:
    REP #$30                                                   ;8489E3|C230    |      ;
    REP #$30                                                   ;8489E5|C230    |      ;
    LDA.B ptrAIActionData                                      ;8489E7|A5C9    |0000C9;
    CLC                                                        ;8489E9|18      |      ;
    ADC.W #$0001                                               ;8489EA|690100  |      ;
    STA.B ptrAIActionData                                      ;8489ED|85C9    |0000C9;
    SEP #$20                                                   ;8489EF|E220    |      ;
    LDA.B #$01                                                 ;8489F1|A901    |      ;
    STA.W nTimeState                                           ;8489F3|8D7309  |000973;
    REP #$20                                                   ;8489F6|C220    |      ;
    LDA.L strcDailyFlags.flags2                                ;8489F8|AF5C1F7F|7F1F5C;
    AND.W #$FFFE                                               ;8489FC|29FEFF  |      ;
    STA.L strcDailyFlags.flags2                                ;8489FF|8F5C1F7F|7F1F5C;
    LDA.W nMapEngine_CurrentMapId                              ;848A03|AD9601  |000196;
    ORA.W #$0020                                               ;848A06|092000  |      ;
    STA.W nMapEngine_CurrentMapId                              ;848A09|8D9601  |000196;
    RTS                                                        ;848A0C|60      |      ;
 
 
fAIAction0x02_FreezeTime:
    REP #$30                                                   ;848A0D|C230    |      ;
    REP #$30                                                   ;848A0F|C230    |      ;
    LDA.B ptrAIActionData                                      ;848A11|A5C9    |0000C9;
    CLC                                                        ;848A13|18      |      ;
    ADC.W #$0001                                               ;848A14|690100  |      ;
    STA.B ptrAIActionData                                      ;848A17|85C9    |0000C9;
    SEP #$20                                                   ;848A19|E220    |      ;
    LDA.B #$00                                                 ;848A1B|A900    |      ;
    STA.W nTimeState                                           ;848A1D|8D7309  |000973;
    REP #$20                                                   ;848A20|C220    |      ;
    LDA.L strcDailyFlags.flags2                                ;848A22|AF5C1F7F|7F1F5C;
    ORA.W #$0001                                               ;848A26|090100  |      ;
    STA.L strcDailyFlags.flags2                                ;848A29|8F5C1F7F|7F1F5C;
    REP #$30                                                   ;848A2D|C230    |      ;
    LDA.W nMapEngine_CurrentMapId                              ;848A2F|AD9601  |000196;
    AND.W #$FFDF                                               ;848A32|29DFFF  |      ;
    STA.W nMapEngine_CurrentMapId                              ;848A35|8D9601  |000196;
    RTS                                                        ;848A38|60      |      ;
 
 
fAIAction0x03_SetHour:
    REP #$30                                                   ;848A39|C230    |      ;
    REP #$30                                                   ;848A3B|C230    |      ;
    LDA.B ptrAIActionData                                      ;848A3D|A5C9    |0000C9;
    CLC                                                        ;848A3F|18      |      ;
    ADC.W #$0001                                               ;848A40|690100  |      ;
    STA.B ptrAIActionData                                      ;848A43|85C9    |0000C9;
    SEP #$20                                                   ;848A45|E220    |      ;
    LDA.B [ptrAIActionData]                                    ;848A47|A7C9    |0000C9;
    STA.L nCurrentTimeID                                       ;848A49|8F1C1F7F|7F1F1C;
    REP #$30                                                   ;848A4D|C230    |      ;
    LDA.B ptrAIActionData                                      ;848A4F|A5C9    |0000C9;
    CLC                                                        ;848A51|18      |      ;
    ADC.W #$0001                                               ;848A52|690100  |      ;
    STA.B ptrAIActionData                                      ;848A55|85C9    |0000C9;
    RTS                                                        ;848A57|60      |      ;
 
 
fAIAction0x04_DoesNothing:
    REP #$30                                                   ;848A58|C230    |      ;
    REP #$30                                                   ;848A5A|C230    |      ;
    LDA.B ptrAIActionData                                      ;848A5C|A5C9    |0000C9;
    CLC                                                        ;848A5E|18      |      ;
    ADC.W #$0001                                               ;848A5F|690100  |      ;
    STA.B ptrAIActionData                                      ;848A62|85C9    |0000C9;
    RTS                                                        ;848A64|60      |      ;
 
 
fAIAction0x05_SetMapDestinationCoords:
    REP #$30                                                   ;848A65|C230    |      ;
    REP #$30                                                   ;848A67|C230    |      ;
    LDA.B ptrAIActionData                                      ;848A69|A5C9    |0000C9;
    CLC                                                        ;848A6B|18      |      ;
    ADC.W #$0001                                               ;848A6C|690100  |      ;
    STA.B ptrAIActionData                                      ;848A6F|85C9    |0000C9;
    LDA.B [ptrAIActionData]                                    ;848A71|A7C9    |0000C9;
    STA.W nMapEngine_DestinationX                              ;848A73|8D7D01  |00017D;
    STA.B nPlayerPosX                                          ;848A76|85D6    |0000D6;
    REP #$30                                                   ;848A78|C230    |      ;
    LDA.B ptrAIActionData                                      ;848A7A|A5C9    |0000C9;
    CLC                                                        ;848A7C|18      |      ;
    ADC.W #$0002                                               ;848A7D|690200  |      ;
    STA.B ptrAIActionData                                      ;848A80|85C9    |0000C9;
    LDA.B [ptrAIActionData]                                    ;848A82|A7C9    |0000C9;
    STA.W nMapEngine_DestinationY                              ;848A84|8D7F01  |00017F;
    STA.B nPlayerPosY                                          ;848A87|85D8    |0000D8;
    REP #$30                                                   ;848A89|C230    |      ;
    LDA.B ptrAIActionData                                      ;848A8B|A5C9    |0000C9;
    CLC                                                        ;848A8D|18      |      ;
    ADC.W #$0002                                               ;848A8E|690200  |      ;
    STA.B ptrAIActionData                                      ;848A91|85C9    |0000C9;
    RTS                                                        ;848A93|60      |      ;
 
 
fAIAction0x06_SetMapDestinationId:
    REP #$30                                                   ;848A94|C230    |      ;
    REP #$30                                                   ;848A96|C230    |      ;
    LDA.B ptrAIActionData                                      ;848A98|A5C9    |0000C9;
    CLC                                                        ;848A9A|18      |      ;
    ADC.W #$0001                                               ;848A9B|690100  |      ;
    STA.B ptrAIActionData                                      ;848A9E|85C9    |0000C9;
    SEP #$20                                                   ;848AA0|E220    |      ;
    LDA.B [ptrAIActionData]                                    ;848AA2|A7C9    |0000C9;
    STA.W n8DestinationId                                      ;848AA4|8D8B09  |00098B;
    REP #$30                                                   ;848AA7|C230    |      ;
    LDA.B ptrAIActionData                                      ;848AA9|A5C9    |0000C9;
    CLC                                                        ;848AAB|18      |      ;
    ADC.W #$0001                                               ;848AAC|690100  |      ;
    STA.B ptrAIActionData                                      ;848AAF|85C9    |0000C9;
    REP #$30                                                   ;848AB1|C230    |      ;
    LDY.W #$0010                                               ;848AB3|A01000  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;848AB6|B7CC    |0000CC;
    CLC                                                        ;848AB8|18      |      ;
    ADC.W #$0001                                               ;848AB9|690100  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;848ABC|97CC    |0000CC;
    RTS                                                        ;848ABE|60      |      ;
 
 
fAIAction0x07_SetPlayerDirection:
    REP #$30                                                   ;848ABF|C230    |      ;
    REP #$30                                                   ;848AC1|C230    |      ;
    LDA.B ptrAIActionData                                      ;848AC3|A5C9    |0000C9;
    CLC                                                        ;848AC5|18      |      ;
    ADC.W #$0001                                               ;848AC6|690100  |      ;
    STA.B ptrAIActionData                                      ;848AC9|85C9    |0000C9;
    SEP #$20                                                   ;848ACB|E220    |      ;
    LDA.B #$00                                                 ;848ACD|A900    |      ;
    XBA                                                        ;848ACF|EB      |      ;
    LDA.B [ptrAIActionData]                                    ;848AD0|A7C9    |0000C9;
    REP #$20                                                   ;848AD2|C220    |      ;
    STA.B nPlayerDirection                                     ;848AD4|85DA    |0000DA;
    STA.W $0911                                                ;848AD6|8D1109  |000911;
    STA.W $0901                                                ;848AD9|8D0109  |000901;
    REP #$30                                                   ;848ADC|C230    |      ;
    LDA.B ptrAIActionData                                      ;848ADE|A5C9    |0000C9;
    CLC                                                        ;848AE0|18      |      ;
    ADC.W #$0001                                               ;848AE1|690100  |      ;
    STA.B ptrAIActionData                                      ;848AE4|85C9    |0000C9;
    RTS                                                        ;848AE6|60      |      ;
 
 
fAIAction0x08_ClearPlayerStateFlags:
    REP #$30                                                   ;848AE7|C230    |      ;
    REP #$30                                                   ;848AE9|C230    |      ;
    LDA.B ptrAIActionData                                      ;848AEB|A5C9    |0000C9;
    CLC                                                        ;848AED|18      |      ;
    ADC.W #$0001                                               ;848AEE|690100  |      ;
    STA.B ptrAIActionData                                      ;848AF1|85C9    |0000C9;
    REP #$30                                                   ;848AF3|C230    |      ;
    LDA.W #$4000                                               ;848AF5|A90040  |      ;
    EOR.W #$FFFF                                               ;848AF8|49FFFF  |      ;
    AND.B strcPlayerFlags                                      ;848AFB|25D2    |0000D2;
    STA.B strcPlayerFlags                                      ;848AFD|85D2    |0000D2;
    REP #$20                                                   ;848AFF|C220    |      ;
    STZ.W nUnknownFlags08FD                                    ;848B01|9CFD08  |0008FD;
    STZ.W $08FF                                                ;848B04|9CFF08  |0008FF;
    RTS                                                        ;848B07|60      |      ;
 
 
fAIAction0x09:
    REP #$30                                                   ;848B08|C230    |      ;
    REP #$30                                                   ;848B0A|C230    |      ;
    LDA.B ptrAIActionData                                      ;848B0C|A5C9    |0000C9;
    CLC                                                        ;848B0E|18      |      ;
    ADC.W #$0001                                               ;848B0F|690100  |      ;
    STA.B ptrAIActionData                                      ;848B12|85C9    |0000C9;
    LDA.B ptrAIUnknown0xCC                                     ;848B14|A5CC    |0000CC;
    STA.B ptrUnknown0x72                                       ;848B16|8572    |000072;
    SEP #$20                                                   ;848B18|E220    |      ;
    LDA.B ptrAIUnknown0xCC+2                                   ;848B1A|A5CE    |0000CE;
    STA.B ptrUnknown0x72+2                                     ;848B1C|8574    |000074;
    SEP #$20                                                   ;848B1E|E220    |      ;
    REP #$10                                                   ;848B20|C210    |      ;
    LDY.W #$0032                                               ;848B22|A03200  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;848B25|B7CC    |0000CC;
    SEP #$20                                                   ;848B27|E220    |      ;
    PHA                                                        ;848B29|48      |      ;
    SEP #$20                                                   ;848B2A|E220    |      ;
    LDA.B #$00                                                 ;848B2C|A900    |      ;
    XBA                                                        ;848B2E|EB      |      ;
    LDA.B [ptrAIActionData]                                    ;848B2F|A7C9    |0000C9;
    REP #$20                                                   ;848B31|C220    |      ;
    JSL.L fAI_Unknown84887C                                    ;848B33|227C8884|84887C;
    SEP #$20                                                   ;848B37|E220    |      ;
    REP #$10                                                   ;848B39|C210    |      ;
    PLA                                                        ;848B3B|68      |      ;
    SEP #$20                                                   ;848B3C|E220    |      ;
    REP #$10                                                   ;848B3E|C210    |      ;
    LDY.W #$0032                                               ;848B40|A03200  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;848B43|97CC    |0000CC;
    SEP #$20                                                   ;848B45|E220    |      ;
    LDA.B [ptrAIActionData]                                    ;848B47|A7C9    |0000C9;
    PHA                                                        ;848B49|48      |      ;
    REP #$30                                                   ;848B4A|C230    |      ;
    LDA.B ptrAIActionData                                      ;848B4C|A5C9    |0000C9;
    CLC                                                        ;848B4E|18      |      ;
    ADC.W #$0001                                               ;848B4F|690100  |      ;
    STA.B ptrAIActionData                                      ;848B52|85C9    |0000C9;
    LDA.B [ptrAIActionData]                                    ;848B54|A7C9    |0000C9;
    REP #$30                                                   ;848B56|C230    |      ;
    LDY.W #$0030                                               ;848B58|A03000  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;848B5B|97CC    |0000CC;
    JSR.W fAI_Unknown8488D4                                    ;848B5D|20D488  |8488D4;
    SEP #$20                                                   ;848B60|E220    |      ;
    PLA                                                        ;848B62|68      |      ;
    SEP #$20                                                   ;848B63|E220    |      ;
    REP #$10                                                   ;848B65|C210    |      ;
    LDY.W #$003F                                               ;848B67|A03F00  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;848B6A|97CC    |0000CC;
    REP #$20                                                   ;848B6C|C220    |      ;
    LDA.B ptrUnknown0x72                                       ;848B6E|A572    |000072;
    STA.B ptrAIUnknown0xCC                                     ;848B70|85CC    |0000CC;
    SEP #$20                                                   ;848B72|E220    |      ;
    LDA.B ptrUnknown0x72+2                                     ;848B74|A574    |000074;
    STA.B ptrAIUnknown0xCC+2                                   ;848B76|85CE    |0000CE;
    REP #$30                                                   ;848B78|C230    |      ;
    LDA.B ptrAIActionData                                      ;848B7A|A5C9    |0000C9;
    CLC                                                        ;848B7C|18      |      ;
    ADC.W #$0002                                               ;848B7D|690200  |      ;
    STA.B ptrAIActionData                                      ;848B80|85C9    |0000C9;
    RTS                                                        ;848B82|60      |      ;
 
 
fAIAction0x0A:
    REP #$30                                                   ;848B83|C230    |      ;
    REP #$30                                                   ;848B85|C230    |      ;
    LDA.B ptrAIActionData                                      ;848B87|A5C9    |0000C9;
    CLC                                                        ;848B89|18      |      ;
    ADC.W #$0001                                               ;848B8A|690100  |      ;
    STA.B ptrAIActionData                                      ;848B8D|85C9    |0000C9;
    REP #$30                                                   ;848B8F|C230    |      ;
    LDA.B ptrAIActionData                                      ;848B91|A5C9    |0000C9;
    CLC                                                        ;848B93|18      |      ;
    ADC.W #$0001                                               ;848B94|690100  |      ;
    STA.B ptrAIActionData                                      ;848B97|85C9    |0000C9;
    SEP #$20                                                   ;848B99|E220    |      ;
    LDA.B #$03                                                 ;848B9B|A903    |      ;
    STA.B n8TempVar1                                           ;848B9D|8592    |000092;
    LDA.B #$03                                                 ;848B9F|A903    |      ;
    STA.B n8TempVar2                                           ;848BA1|8593    |000093;
    LDA.B #$0F                                                 ;848BA3|A90F    |      ;
    STA.B n8TempVar3                                           ;848BA5|8594    |000094;
    JSL.L fCore_ScreenFadein                                   ;848BA7|22CE8780|8087CE;
    RTS                                                        ;848BAB|60      |      ;
 
 
fAIAction0x0B:
    REP #$30                                                   ;848BAC|C230    |      ;
    REP #$30                                                   ;848BAE|C230    |      ;
    LDA.B ptrAIActionData                                      ;848BB0|A5C9    |0000C9;
    CLC                                                        ;848BB2|18      |      ;
    ADC.W #$0001                                               ;848BB3|690100  |      ;
    STA.B ptrAIActionData                                      ;848BB6|85C9    |0000C9;
    SEP #$20                                                   ;848BB8|E220    |      ;
    LDA.B #$00                                                 ;848BBA|A900    |      ;
    XBA                                                        ;848BBC|EB      |      ;
    LDA.B [ptrAIActionData]                                    ;848BBD|A7C9    |0000C9;
    REP #$20                                                   ;848BBF|C220    |      ;
    ASL A                                                      ;848BC1|0A      |      ;
    TAX                                                        ;848BC2|AA      |      ;
    REP #$20                                                   ;848BC3|C220    |      ;
    LDA.L aAISetMask,X                                         ;848BC5|BFD39484|8494D3;
    ORA.L $7F1F7A                                              ;848BC9|0F7A1F7F|7F1F7A;
    STA.L $7F1F7A                                              ;848BCD|8F7A1F7F|7F1F7A;
    REP #$30                                                   ;848BD1|C230    |      ;
    LDA.B ptrAIActionData                                      ;848BD3|A5C9    |0000C9;
    CLC                                                        ;848BD5|18      |      ;
    ADC.W #$0001                                               ;848BD6|690100  |      ;
    STA.B ptrAIActionData                                      ;848BD9|85C9    |0000C9;
    RTS                                                        ;848BDB|60      |      ;
 
 
fAIAction0x0C:
    REP #$30                                                   ;848BDC|C230    |      ;
    REP #$30                                                   ;848BDE|C230    |      ;
    LDA.B ptrAIActionData                                      ;848BE0|A5C9    |0000C9;
    CLC                                                        ;848BE2|18      |      ;
    ADC.W #$0001                                               ;848BE3|690100  |      ;
    STA.B ptrAIActionData                                      ;848BE6|85C9    |0000C9;
    SEP #$20                                                   ;848BE8|E220    |      ;
    LDA.B #$00                                                 ;848BEA|A900    |      ;
    XBA                                                        ;848BEC|EB      |      ;
    LDA.B [ptrAIActionData]                                    ;848BED|A7C9    |0000C9;
    REP #$20                                                   ;848BEF|C220    |      ;
    ASL A                                                      ;848BF1|0A      |      ;
    TAX                                                        ;848BF2|AA      |      ;
    REP #$20                                                   ;848BF3|C220    |      ;
    LDA.L aAISetMask,X                                         ;848BF5|BFD39484|8494D3;
    AND.L $7F1F7A                                              ;848BF9|2F7A1F7F|7F1F7A;
    BEQ +                                                      ;848BFD|F00B    |848C0A;
    REP #$30                                                   ;848BFF|C230    |      ;
    LDA.B ptrAIActionData                                      ;848C01|A5C9    |0000C9;
    CLC                                                        ;848C03|18      |      ;
    ADC.W #$0001                                               ;848C04|690100  |      ;
    STA.B ptrAIActionData                                      ;848C07|85C9    |0000C9;
    RTS                                                        ;848C09|60      |      ;
 
 
  + REP #$30                                                   ;848C0A|C230    |      ;
    LDA.B ptrAIActionData                                      ;848C0C|A5C9    |0000C9;
    SEC                                                        ;848C0E|38      |      ;
    SBC.W #$0001                                               ;848C0F|E90100  |      ;
    STA.B ptrAIActionData                                      ;848C12|85C9    |0000C9;
    REP #$30                                                   ;848C14|C230    |      ;
    LDY.W #$0010                                               ;848C16|A01000  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;848C19|B7CC    |0000CC;
    CLC                                                        ;848C1B|18      |      ;
    ADC.W #$0001                                               ;848C1C|690100  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;848C1F|97CC    |0000CC;
    RTS                                                        ;848C21|60      |      ;
 
 
fAIAction0x0D:
    REP #$30                                                   ;848C22|C230    |      ;
    REP #$30                                                   ;848C24|C230    |      ;
    LDA.B ptrAIActionData                                      ;848C26|A5C9    |0000C9;
    CLC                                                        ;848C28|18      |      ;
    ADC.W #$0001                                               ;848C29|690100  |      ;
    STA.B ptrAIActionData                                      ;848C2C|85C9    |0000C9;
    SEP #$20                                                   ;848C2E|E220    |      ;
    LDA.B [ptrAIActionData]                                    ;848C30|A7C9    |0000C9;
    SEP #$20                                                   ;848C32|E220    |      ;
    REP #$10                                                   ;848C34|C210    |      ;
    LDY.W #$0003                                               ;848C36|A00300  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;848C39|97CC    |0000CC;
    REP #$30                                                   ;848C3B|C230    |      ;
    LDA.B ptrAIActionData                                      ;848C3D|A5C9    |0000C9;
    CLC                                                        ;848C3F|18      |      ;
    ADC.W #$0001                                               ;848C40|690100  |      ;
    STA.B ptrAIActionData                                      ;848C43|85C9    |0000C9;
    SEP #$20                                                   ;848C45|E220    |      ;
    LDA.B [ptrAIActionData]                                    ;848C47|A7C9    |0000C9;
    SEP #$20                                                   ;848C49|E220    |      ;
    REP #$10                                                   ;848C4B|C210    |      ;
    LDY.W #$0004                                               ;848C4D|A00400  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;848C50|97CC    |0000CC;
    REP #$30                                                   ;848C52|C230    |      ;
    LDA.B ptrAIActionData                                      ;848C54|A5C9    |0000C9;
    CLC                                                        ;848C56|18      |      ;
    ADC.W #$0001                                               ;848C57|690100  |      ;
    STA.B ptrAIActionData                                      ;848C5A|85C9    |0000C9;
    SEP #$20                                                   ;848C5C|E220    |      ;
    LDA.B [ptrAIActionData]                                    ;848C5E|A7C9    |0000C9;
    SEP #$20                                                   ;848C60|E220    |      ;
    REP #$10                                                   ;848C62|C210    |      ;
    LDY.W #$0010                                               ;848C64|A01000  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;848C67|97CC    |0000CC;
    REP #$30                                                   ;848C69|C230    |      ;
    LDA.B ptrAIActionData                                      ;848C6B|A5C9    |0000C9;
    CLC                                                        ;848C6D|18      |      ;
    ADC.W #$0001                                               ;848C6E|690100  |      ;
    STA.B ptrAIActionData                                      ;848C71|85C9    |0000C9;
    SEP #$20                                                   ;848C73|E220    |      ;
    LDA.B [ptrAIActionData]                                    ;848C75|A7C9    |0000C9;
    SEP #$20                                                   ;848C77|E220    |      ;
    REP #$10                                                   ;848C79|C210    |      ;
    LDY.W #$0005                                               ;848C7B|A00500  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;848C7E|97CC    |0000CC;
    SEP #$20                                                   ;848C80|E220    |      ;
    REP #$10                                                   ;848C82|C210    |      ;
    LDY.W #$0006                                               ;848C84|A00600  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;848C87|97CC    |0000CC;
    SEP #$20                                                   ;848C89|E220    |      ;
    REP #$10                                                   ;848C8B|C210    |      ;
    LDY.W #$0001                                               ;848C8D|A00100  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;848C90|B7CC    |0000CC;
    ORA.B #$20                                                 ;848C92|0920    |      ;
    SEP #$20                                                   ;848C94|E220    |      ;
    REP #$10                                                   ;848C96|C210    |      ;
    LDY.W #$0001                                               ;848C98|A00100  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;848C9B|97CC    |0000CC;
    REP #$30                                                   ;848C9D|C230    |      ;
    LDA.B ptrAIActionData                                      ;848C9F|A5C9    |0000C9;
    CLC                                                        ;848CA1|18      |      ;
    ADC.W #$0001                                               ;848CA2|690100  |      ;
    STA.B ptrAIActionData                                      ;848CA5|85C9    |0000C9;
    RTS                                                        ;848CA7|60      |      ;
 
 
fAIAction0x0E:
    REP #$30                                                   ;848CA8|C230    |      ;
    REP #$30                                                   ;848CAA|C230    |      ;
    LDA.B ptrAIActionData                                      ;848CAC|A5C9    |0000C9;
    CLC                                                        ;848CAE|18      |      ;
    ADC.W #$0002                                               ;848CAF|690200  |      ;
    STA.B ptrAIActionData                                      ;848CB2|85C9    |0000C9;
    JSL.L fAudioUnknown_838401                                 ;848CB4|22018483|838401;
    RTS                                                        ;848CB8|60      |      ;
 
 
fAIAction0x0F:
    REP #$30                                                   ;848CB9|C230    |      ;
    REP #$30                                                   ;848CBB|C230    |      ;
    LDA.B ptrAIActionData                                      ;848CBD|A5C9    |0000C9;
    CLC                                                        ;848CBF|18      |      ;
    ADC.W #$0001                                               ;848CC0|690100  |      ;
    STA.B ptrAIActionData                                      ;848CC3|85C9    |0000C9;
    REP #$30                                                   ;848CC5|C230    |      ;
    LDA.B ptrAIActionData                                      ;848CC7|A5C9    |0000C9;
    CLC                                                        ;848CC9|18      |      ;
    ADC.W #$0001                                               ;848CCA|690100  |      ;
    STA.B ptrAIActionData                                      ;848CCD|85C9    |0000C9;
    SEP #$20                                                   ;848CCF|E220    |      ;
    LDA.B #$0F                                                 ;848CD1|A90F    |      ;
    STA.B n8TempVar1                                           ;848CD3|8592    |000092;
    LDA.B #$03                                                 ;848CD5|A903    |      ;
    STA.B n8TempVar2                                           ;848CD7|8593    |000093;
    LDA.B #$00                                                 ;848CD9|A900    |      ;
    STA.B n8TempVar3                                           ;848CDB|8594    |000094;
    JSL.L fCore_ScreenFadeout                                  ;848CDD|220A8880|80880A;
    RTS                                                        ;848CE1|60      |      ;
 
 
fAIAction0x10:
    REP #$30                                                   ;848CE2|C230    |      ;
    SEP #$20                                                   ;848CE4|E220    |      ;
    REP #$10                                                   ;848CE6|C210    |      ;
    LDY.W #$0000                                               ;848CE8|A00000  |      ;
    LDA.B #$00                                                 ;848CEB|A900    |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;848CED|97CC    |0000CC;
    REP #$30                                                   ;848CEF|C230    |      ;
    LDY.W #$0010                                               ;848CF1|A01000  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;848CF4|B7CC    |0000CC;
    CLC                                                        ;848CF6|18      |      ;
    ADC.W #$0001                                               ;848CF7|690100  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;848CFA|97CC    |0000CC;
    RTS                                                        ;848CFC|60      |      ;
 
 
fAIAction0x11:
    REP #$30                                                   ;848CFD|C230    |      ;
    REP #$30                                                   ;848CFF|C230    |      ;
    LDA.B ptrAIActionData                                      ;848D01|A5C9    |0000C9;
    CLC                                                        ;848D03|18      |      ;
    ADC.W #$0001                                               ;848D04|690100  |      ;
    STA.B ptrAIActionData                                      ;848D07|85C9    |0000C9;
    REP #$30                                                   ;848D09|C230    |      ;
    LDA.B strcPlayerFlags                                      ;848D0B|A5D2    |0000D2;
    ORA.W #$4000                                               ;848D0D|090040  |      ;
    STA.B strcPlayerFlags                                      ;848D10|85D2    |0000D2;
    RTS                                                        ;848D12|60      |      ;
 
 
fAIAction0x12_AlwaysJump:
    REP #$30                                                   ;848D13|C230    |      ;
    REP #$30                                                   ;848D15|C230    |      ;
    LDA.B ptrAIActionData                                      ;848D17|A5C9    |0000C9;
    CLC                                                        ;848D19|18      |      ;
    ADC.W #$0001                                               ;848D1A|690100  |      ;
    STA.B ptrAIActionData                                      ;848D1D|85C9    |0000C9;
    LDA.B [ptrAIActionData]                                    ;848D1F|A7C9    |0000C9;
    STA.B ptrAIActionData                                      ;848D21|85C9    |0000C9;
    RTS                                                        ;848D23|60      |      ;
 
 
fAIAction0x13:
    REP #$30                                                   ;848D24|C230    |      ;
    REP #$30                                                   ;848D26|C230    |      ;
    LDA.B ptrAIActionData                                      ;848D28|A5C9    |0000C9;
    CLC                                                        ;848D2A|18      |      ;
    ADC.W #$0001                                               ;848D2B|690100  |      ;
    STA.B ptrAIActionData                                      ;848D2E|85C9    |0000C9;
    LDA.B [ptrAIActionData]                                    ;848D30|A7C9    |0000C9;
    REP #$30                                                   ;848D32|C230    |      ;
    LDY.W #$0010                                               ;848D34|A01000  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;848D37|97CC    |0000CC;
    REP #$30                                                   ;848D39|C230    |      ;
    LDA.B ptrAIActionData                                      ;848D3B|A5C9    |0000C9;
    CLC                                                        ;848D3D|18      |      ;
    ADC.W #$0002                                               ;848D3E|690200  |      ;
    STA.B ptrAIActionData                                      ;848D41|85C9    |0000C9;
    RTS                                                        ;848D43|60      |      ;
 
 
fAIAction0x14:
    REP #$30                                                   ;848D44|C230    |      ;
    REP #$30                                                   ;848D46|C230    |      ;
    LDA.B ptrAIActionData                                      ;848D48|A5C9    |0000C9;
    CLC                                                        ;848D4A|18      |      ;
    ADC.W #$0001                                               ;848D4B|690100  |      ;
    STA.B ptrAIActionData                                      ;848D4E|85C9    |0000C9;
    REP #$20                                                   ;848D50|C220    |      ;
    LDA.B [ptrAIActionData]                                    ;848D52|A7C9    |0000C9;
    STA.B ptrUnknown0x72                                       ;848D54|8572    |000072;
    REP #$30                                                   ;848D56|C230    |      ;
    LDA.B ptrAIActionData                                      ;848D58|A5C9    |0000C9;
    CLC                                                        ;848D5A|18      |      ;
    ADC.W #$0002                                               ;848D5B|690200  |      ;
    STA.B ptrAIActionData                                      ;848D5E|85C9    |0000C9;
    SEP #$20                                                   ;848D60|E220    |      ;
    LDA.B [ptrAIActionData]                                    ;848D62|A7C9    |0000C9;
    STA.B ptrUnknown0x72+2                                     ;848D64|8574    |000074;
    REP #$30                                                   ;848D66|C230    |      ;
    LDA.B ptrAIActionData                                      ;848D68|A5C9    |0000C9;
    CLC                                                        ;848D6A|18      |      ;
    ADC.W #$0001                                               ;848D6B|690100  |      ;
    STA.B ptrAIActionData                                      ;848D6E|85C9    |0000C9;
    SEP #$20                                                   ;848D70|E220    |      ;
    LDA.B #$00                                                 ;848D72|A900    |      ;
    XBA                                                        ;848D74|EB      |      ;
    LDA.B [ptrAIActionData]                                    ;848D75|A7C9    |0000C9;
    REP #$20                                                   ;848D77|C220    |      ;
    ASL A                                                      ;848D79|0A      |      ;
    TAX                                                        ;848D7A|AA      |      ;
    LDA.L aAISetMask,X                                         ;848D7B|BFD39484|8494D3;
    STA.B n16TempVar1                                          ;848D7F|857E    |00007E;
    REP #$30                                                   ;848D81|C230    |      ;
    LDA.B ptrAIActionData                                      ;848D83|A5C9    |0000C9;
    CLC                                                        ;848D85|18      |      ;
    ADC.W #$0001                                               ;848D86|690100  |      ;
    STA.B ptrAIActionData                                      ;848D89|85C9    |0000C9;
    REP #$20                                                   ;848D8B|C220    |      ;
    LDA.B [ptrUnknown0x72]                                     ;848D8D|A772    |000072;
    AND.B n16TempVar1                                          ;848D8F|257E    |00007E;
    BEQ +                                                      ;848D91|F007    |848D9A;
    REP #$20                                                   ;848D93|C220    |      ;
    LDA.B [ptrAIActionData]                                    ;848D95|A7C9    |0000C9;
    STA.B ptrAIActionData                                      ;848D97|85C9    |0000C9;
    RTS                                                        ;848D99|60      |      ;
 
 
  + REP #$30                                                   ;848D9A|C230    |      ;
    LDA.B ptrAIActionData                                      ;848D9C|A5C9    |0000C9;
    CLC                                                        ;848D9E|18      |      ;
    ADC.W #$0002                                               ;848D9F|690200  |      ;
    STA.B ptrAIActionData                                      ;848DA2|85C9    |0000C9;
    RTS                                                        ;848DA4|60      |      ;
 
 
fAIAction0x15:
    REP #$30                                                   ;848DA5|C230    |      ;
    REP #$30                                                   ;848DA7|C230    |      ;
    LDA.B ptrAIActionData                                      ;848DA9|A5C9    |0000C9;
    CLC                                                        ;848DAB|18      |      ;
    ADC.W #$0001                                               ;848DAC|690100  |      ;
    STA.B ptrAIActionData                                      ;848DAF|85C9    |0000C9;
    REP #$20                                                   ;848DB1|C220    |      ;
    LDA.B [ptrAIActionData]                                    ;848DB3|A7C9    |0000C9;
    STA.B ptrUnknown0x72                                       ;848DB5|8572    |000072;
    REP #$30                                                   ;848DB7|C230    |      ;
    LDA.B ptrAIActionData                                      ;848DB9|A5C9    |0000C9;
    CLC                                                        ;848DBB|18      |      ;
    ADC.W #$0002                                               ;848DBC|690200  |      ;
    STA.B ptrAIActionData                                      ;848DBF|85C9    |0000C9;
    SEP #$20                                                   ;848DC1|E220    |      ;
    LDA.B [ptrAIActionData]                                    ;848DC3|A7C9    |0000C9;
    STA.B ptrUnknown0x72+2                                     ;848DC5|8574    |000074;
    REP #$30                                                   ;848DC7|C230    |      ;
    LDA.B ptrAIActionData                                      ;848DC9|A5C9    |0000C9;
    CLC                                                        ;848DCB|18      |      ;
    ADC.W #$0001                                               ;848DCC|690100  |      ;
    STA.B ptrAIActionData                                      ;848DCF|85C9    |0000C9;
    SEP #$20                                                   ;848DD1|E220    |      ;
    LDA.B [ptrAIActionData]                                    ;848DD3|A7C9    |0000C9;
    STA.B n8TempVar1                                           ;848DD5|8592    |000092;
    REP #$30                                                   ;848DD7|C230    |      ;
    LDA.B ptrAIActionData                                      ;848DD9|A5C9    |0000C9;
    CLC                                                        ;848DDB|18      |      ;
    ADC.W #$0001                                               ;848DDC|690100  |      ;
    STA.B ptrAIActionData                                      ;848DDF|85C9    |0000C9;
    SEP #$20                                                   ;848DE1|E220    |      ;
    LDA.B [ptrUnknown0x72]                                     ;848DE3|A772    |000072;
    CMP.B n8TempVar1                                           ;848DE5|C592    |000092;
    BNE +                                                      ;848DE7|D007    |848DF0;
    REP #$20                                                   ;848DE9|C220    |      ;
    LDA.B [ptrAIActionData]                                    ;848DEB|A7C9    |0000C9;
    STA.B ptrAIActionData                                      ;848DED|85C9    |0000C9;
    RTS                                                        ;848DEF|60      |      ;
 
 
  + REP #$30                                                   ;848DF0|C230    |      ;
    LDA.B ptrAIActionData                                      ;848DF2|A5C9    |0000C9;
    CLC                                                        ;848DF4|18      |      ;
    ADC.W #$0002                                               ;848DF5|690200  |      ;
    STA.B ptrAIActionData                                      ;848DF8|85C9    |0000C9;
    RTS                                                        ;848DFA|60      |      ;
 
 
fAIAction0x16:
    REP #$30                                                   ;848DFB|C230    |      ;
    REP #$30                                                   ;848DFD|C230    |      ;
    LDA.B ptrAIActionData                                      ;848DFF|A5C9    |0000C9;
    CLC                                                        ;848E01|18      |      ;
    ADC.W #$0001                                               ;848E02|690100  |      ;
    STA.B ptrAIActionData                                      ;848E05|85C9    |0000C9;
    REP #$20                                                   ;848E07|C220    |      ;
    LDA.B [ptrAIActionData]                                    ;848E09|A7C9    |0000C9;
    STA.B ptrUnknown0x72                                       ;848E0B|8572    |000072;
    REP #$30                                                   ;848E0D|C230    |      ;
    LDA.B ptrAIActionData                                      ;848E0F|A5C9    |0000C9;
    CLC                                                        ;848E11|18      |      ;
    ADC.W #$0002                                               ;848E12|690200  |      ;
    STA.B ptrAIActionData                                      ;848E15|85C9    |0000C9;
    SEP #$20                                                   ;848E17|E220    |      ;
    LDA.B [ptrAIActionData]                                    ;848E19|A7C9    |0000C9;
    STA.B ptrUnknown0x72+2                                     ;848E1B|8574    |000074;
    REP #$30                                                   ;848E1D|C230    |      ;
    LDA.B ptrAIActionData                                      ;848E1F|A5C9    |0000C9;
    CLC                                                        ;848E21|18      |      ;
    ADC.W #$0001                                               ;848E22|690100  |      ;
    STA.B ptrAIActionData                                      ;848E25|85C9    |0000C9;
    SEP #$20                                                   ;848E27|E220    |      ;
    LDA.B [ptrAIActionData]                                    ;848E29|A7C9    |0000C9;
    STA.B n8TempVar1                                           ;848E2B|8592    |000092;
    REP #$30                                                   ;848E2D|C230    |      ;
    LDA.B ptrAIActionData                                      ;848E2F|A5C9    |0000C9;
    CLC                                                        ;848E31|18      |      ;
    ADC.W #$0001                                               ;848E32|690100  |      ;
    STA.B ptrAIActionData                                      ;848E35|85C9    |0000C9;
    SEP #$20                                                   ;848E37|E220    |      ;
    LDA.B [ptrAIActionData]                                    ;848E39|A7C9    |0000C9;
    INC A                                                      ;848E3B|1A      |      ;
    STA.B n8TempVar2                                           ;848E3C|8593    |000093;
    REP #$30                                                   ;848E3E|C230    |      ;
    LDA.B ptrAIActionData                                      ;848E40|A5C9    |0000C9;
    CLC                                                        ;848E42|18      |      ;
    ADC.W #$0001                                               ;848E43|690100  |      ;
    STA.B ptrAIActionData                                      ;848E46|85C9    |0000C9;
    SEP #$20                                                   ;848E48|E220    |      ;
    LDA.B [ptrUnknown0x72]                                     ;848E4A|A772    |000072;
    CMP.B n8TempVar1                                           ;848E4C|C592    |000092;
    BCC +                                                      ;848E4E|900D    |848E5D;
    LDA.B [ptrUnknown0x72]                                     ;848E50|A772    |000072;
    CMP.B n8TempVar2                                           ;848E52|C593    |000093;
    BCS +                                                      ;848E54|B007    |848E5D;
    REP #$20                                                   ;848E56|C220    |      ;
    LDA.B [ptrAIActionData]                                    ;848E58|A7C9    |0000C9;
    STA.B ptrAIActionData                                      ;848E5A|85C9    |0000C9;
    RTS                                                        ;848E5C|60      |      ;
 
 
  + REP #$30                                                   ;848E5D|C230    |      ;
    LDA.B ptrAIActionData                                      ;848E5F|A5C9    |0000C9;
    CLC                                                        ;848E61|18      |      ;
    ADC.W #$0002                                               ;848E62|690200  |      ;
    STA.B ptrAIActionData                                      ;848E65|85C9    |0000C9;
    RTS                                                        ;848E67|60      |      ;
 
 
fAIAction0x17:
    REP #$30                                                   ;848E68|C230    |      ;
    REP #$30                                                   ;848E6A|C230    |      ;
    LDA.B ptrAIActionData                                      ;848E6C|A5C9    |0000C9;
    CLC                                                        ;848E6E|18      |      ;
    ADC.W #$0001                                               ;848E6F|690100  |      ;
    STA.B ptrAIActionData                                      ;848E72|85C9    |0000C9;
    SEP #$20                                                   ;848E74|E220    |      ;
    LDA.B [ptrAIActionData]                                    ;848E76|A7C9    |0000C9;
    JSL.L fCore_GetRandomNumber                                ;848E78|22F98980|8089F9;
    SEP #$20                                                   ;848E7C|E220    |      ;
    REP #$10                                                   ;848E7E|C210    |      ;
    LDY.W #$000D                                               ;848E80|A00D00  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;848E83|97CC    |0000CC;
    REP #$30                                                   ;848E85|C230    |      ;
    LDA.B ptrAIActionData                                      ;848E87|A5C9    |0000C9;
    CLC                                                        ;848E89|18      |      ;
    ADC.W #$0001                                               ;848E8A|690100  |      ;
    STA.B ptrAIActionData                                      ;848E8D|85C9    |0000C9;
    RTS                                                        ;848E8F|60      |      ;
 
 
fAIAction0x18:
    REP #$30                                                   ;848E90|C230    |      ;
    REP #$30                                                   ;848E92|C230    |      ;
    LDA.B ptrAIActionData                                      ;848E94|A5C9    |0000C9;
    CLC                                                        ;848E96|18      |      ;
    ADC.W #$0001                                               ;848E97|690100  |      ;
    STA.B ptrAIActionData                                      ;848E9A|85C9    |0000C9;
    LDA.B [ptrAIActionData]                                    ;848E9C|A7C9    |0000C9;
    STA.B n8TempVar1                                           ;848E9E|8592    |000092;
    SEP #$20                                                   ;848EA0|E220    |      ;
    REP #$10                                                   ;848EA2|C210    |      ;
    LDY.W #$000D                                               ;848EA4|A00D00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;848EA7|B7CC    |0000CC;
    CMP.B n8TempVar1                                           ;848EA9|C592    |000092;
    BNE +                                                      ;848EAB|D011    |848EBE;
    REP #$30                                                   ;848EAD|C230    |      ;
    LDA.B ptrAIActionData                                      ;848EAF|A5C9    |0000C9;
    CLC                                                        ;848EB1|18      |      ;
    ADC.W #$0001                                               ;848EB2|690100  |      ;
    STA.B ptrAIActionData                                      ;848EB5|85C9    |0000C9;
    REP #$20                                                   ;848EB7|C220    |      ;
    LDA.B [ptrAIActionData]                                    ;848EB9|A7C9    |0000C9;
    STA.B ptrAIActionData                                      ;848EBB|85C9    |0000C9;
    RTS                                                        ;848EBD|60      |      ;
 
 
  + REP #$30                                                   ;848EBE|C230    |      ;
    LDA.B ptrAIActionData                                      ;848EC0|A5C9    |0000C9;
    CLC                                                        ;848EC2|18      |      ;
    ADC.W #$0003                                               ;848EC3|690300  |      ;
    STA.B ptrAIActionData                                      ;848EC6|85C9    |0000C9;
    RTS                                                        ;848EC8|60      |      ;
 
 
fAIAction0x19:
    REP #$30                                                   ;848EC9|C230    |      ;
    REP #$30                                                   ;848ECB|C230    |      ;
    LDA.B ptrAIActionData                                      ;848ECD|A5C9    |0000C9;
    CLC                                                        ;848ECF|18      |      ;
    ADC.W #$0001                                               ;848ED0|690100  |      ;
    STA.B ptrAIActionData                                      ;848ED3|85C9    |0000C9;
    LDA.B [ptrAIActionData]                                    ;848ED5|A7C9    |0000C9;
    STA.W $0901                                                ;848ED7|8D0109  |000901;
    REP #$30                                                   ;848EDA|C230    |      ;
    LDA.B ptrAIActionData                                      ;848EDC|A5C9    |0000C9;
    CLC                                                        ;848EDE|18      |      ;
    ADC.W #$0002                                               ;848EDF|690200  |      ;
    STA.B ptrAIActionData                                      ;848EE2|85C9    |0000C9;
    SEP #$20                                                   ;848EE4|E220    |      ;
    LDA.B #$00                                                 ;848EE6|A900    |      ;
    XBA                                                        ;848EE8|EB      |      ;
    LDA.B [ptrAIActionData]                                    ;848EE9|A7C9    |0000C9;
    REP #$20                                                   ;848EEB|C220    |      ;
    ASL A                                                      ;848EED|0A      |      ;
    ASL A                                                      ;848EEE|0A      |      ;
    ASL A                                                      ;848EEF|0A      |      ;
    ASL A                                                      ;848EF0|0A      |      ;
    ASL A                                                      ;848EF1|0A      |      ;
    ASL A                                                      ;848EF2|0A      |      ;
    STA.W $090F                                                ;848EF3|8D0F09  |00090F;
    REP #$30                                                   ;848EF6|C230    |      ;
    LDA.B ptrAIActionData                                      ;848EF8|A5C9    |0000C9;
    CLC                                                        ;848EFA|18      |      ;
    ADC.W #$0001                                               ;848EFB|690100  |      ;
    STA.B ptrAIActionData                                      ;848EFE|85C9    |0000C9;
    REP #$30                                                   ;848F00|C230    |      ;
    LDA.B strcPlayerFlags                                      ;848F02|A5D2    |0000D2;
    ORA.W #$2000                                               ;848F04|090020  |      ;
    STA.B strcPlayerFlags                                      ;848F07|85D2    |0000D2;
    RTS                                                        ;848F09|60      |      ;
 
 
fAIAction0x1A:
    REP #$30                                                   ;848F0A|C230    |      ;
    REP #$30                                                   ;848F0C|C230    |      ;
    LDA.B ptrAIActionData                                      ;848F0E|A5C9    |0000C9;
    CLC                                                        ;848F10|18      |      ;
    ADC.W #$0001                                               ;848F11|690100  |      ;
    STA.B ptrAIActionData                                      ;848F14|85C9    |0000C9;
    LDA.B [ptrAIActionData]                                    ;848F16|A7C9    |0000C9;
    REP #$30                                                   ;848F18|C230    |      ;
    LDY.W #$001A                                               ;848F1A|A01A00  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;848F1D|97CC    |0000CC;
    REP #$30                                                   ;848F1F|C230    |      ;
    LDA.B ptrAIActionData                                      ;848F21|A5C9    |0000C9;
    CLC                                                        ;848F23|18      |      ;
    ADC.W #$0002                                               ;848F24|690200  |      ;
    STA.B ptrAIActionData                                      ;848F27|85C9    |0000C9;
    LDA.B [ptrAIActionData]                                    ;848F29|A7C9    |0000C9;
    REP #$30                                                   ;848F2B|C230    |      ;
    LDY.W #$001C                                               ;848F2D|A01C00  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;848F30|97CC    |0000CC;
    REP #$30                                                   ;848F32|C230    |      ;
    LDA.B ptrAIActionData                                      ;848F34|A5C9    |0000C9;
    CLC                                                        ;848F36|18      |      ;
    ADC.W #$0002                                               ;848F37|690200  |      ;
    STA.B ptrAIActionData                                      ;848F3A|85C9    |0000C9;
    LDA.B [ptrAIActionData]                                    ;848F3C|A7C9    |0000C9;
    REP #$30                                                   ;848F3E|C230    |      ;
    LDY.W #$0033                                               ;848F40|A03300  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;848F43|97CC    |0000CC;
    REP #$30                                                   ;848F45|C230    |      ;
    LDA.B ptrAIActionData                                      ;848F47|A5C9    |0000C9;
    CLC                                                        ;848F49|18      |      ;
    ADC.W #$0002                                               ;848F4A|690200  |      ;
    STA.B ptrAIActionData                                      ;848F4D|85C9    |0000C9;
    SEP #$20                                                   ;848F4F|E220    |      ;
    LDA.B [ptrAIActionData]                                    ;848F51|A7C9    |0000C9;
    SEP #$20                                                   ;848F53|E220    |      ;
    REP #$10                                                   ;848F55|C210    |      ;
    LDY.W #$0002                                               ;848F57|A00200  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;848F5A|97CC    |0000CC;
    REP #$30                                                   ;848F5C|C230    |      ;
    LDA.B ptrAIActionData                                      ;848F5E|A5C9    |0000C9;
    CLC                                                        ;848F60|18      |      ;
    ADC.W #$0001                                               ;848F61|690100  |      ;
    STA.B ptrAIActionData                                      ;848F64|85C9    |0000C9;
    SEP #$20                                                   ;848F66|E220    |      ;
    REP #$10                                                   ;848F68|C210    |      ;
    LDY.W #$0001                                               ;848F6A|A00100  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;848F6D|B7CC    |0000CC;
    ORA.B #$03                                                 ;848F6F|0903    |      ;
    SEP #$20                                                   ;848F71|E220    |      ;
    REP #$10                                                   ;848F73|C210    |      ;
    LDY.W #$0001                                               ;848F75|A00100  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;848F78|97CC    |0000CC;
    REP #$30                                                   ;848F7A|C230    |      ;
    LDY.W #$0033                                               ;848F7C|A03300  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;848F7F|B7CC    |0000CC;
    STA.B ptrUnknown0x72                                       ;848F81|8572    |000072;
    SEP #$20                                                   ;848F83|E220    |      ;
    LDA.B #$B3                                                 ;848F85|A9B3    |      ;
    STA.B ptrUnknown0x72+2                                     ;848F87|8574    |000074;
    JSL.L fAI_Unknown848895                                    ;848F89|22958884|848895;
    REP #$30                                                   ;848F8D|C230    |      ;
    LDY.W #$0010                                               ;848F8F|A01000  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;848F92|B7CC    |0000CC;
    CLC                                                        ;848F94|18      |      ;
    ADC.W #$0001                                               ;848F95|690100  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;848F98|97CC    |0000CC;
    RTS                                                        ;848F9A|60      |      ;
 
 
fAIAction0x1B:
    REP #$30                                                   ;848F9B|C230    |      ;
    REP #$30                                                   ;848F9D|C230    |      ;
    LDA.B ptrAIActionData                                      ;848F9F|A5C9    |0000C9;
    CLC                                                        ;848FA1|18      |      ;
    ADC.W #$0001                                               ;848FA2|690100  |      ;
    STA.B ptrAIActionData                                      ;848FA5|85C9    |0000C9;
    LDA.B [ptrAIActionData]                                    ;848FA7|A7C9    |0000C9;
    REP #$30                                                   ;848FA9|C230    |      ;
    LDY.W #$0016                                               ;848FAB|A01600  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;848FAE|97CC    |0000CC;
    REP #$30                                                   ;848FB0|C230    |      ;
    LDA.B ptrAIActionData                                      ;848FB2|A5C9    |0000C9;
    CLC                                                        ;848FB4|18      |      ;
    ADC.W #$0002                                               ;848FB5|690200  |      ;
    STA.B ptrAIActionData                                      ;848FB8|85C9    |0000C9;
    SEP #$20                                                   ;848FBA|E220    |      ;
    LDA.B #$00                                                 ;848FBC|A900    |      ;
    XBA                                                        ;848FBE|EB      |      ;
    LDA.B [ptrAIActionData]                                    ;848FBF|A7C9    |0000C9;
    REP #$20                                                   ;848FC1|C220    |      ;
    ASL A                                                      ;848FC3|0A      |      ;
    ASL A                                                      ;848FC4|0A      |      ;
    ASL A                                                      ;848FC5|0A      |      ;
    ASL A                                                      ;848FC6|0A      |      ;
    ASL A                                                      ;848FC7|0A      |      ;
    ASL A                                                      ;848FC8|0A      |      ;
    REP #$30                                                   ;848FC9|C230    |      ;
    LDY.W #$0014                                               ;848FCB|A01400  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;848FCE|97CC    |0000CC;
    REP #$30                                                   ;848FD0|C230    |      ;
    LDA.B ptrAIActionData                                      ;848FD2|A5C9    |0000C9;
    CLC                                                        ;848FD4|18      |      ;
    ADC.W #$0001                                               ;848FD5|690100  |      ;
    STA.B ptrAIActionData                                      ;848FD8|85C9    |0000C9;
    SEP #$20                                                   ;848FDA|E220    |      ;
    REP #$10                                                   ;848FDC|C210    |      ;
    LDY.W #$0001                                               ;848FDE|A00100  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;848FE1|B7CC    |0000CC;
    ORA.B #$04                                                 ;848FE3|0904    |      ;
    SEP #$20                                                   ;848FE5|E220    |      ;
    REP #$10                                                   ;848FE7|C210    |      ;
    LDY.W #$0001                                               ;848FE9|A00100  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;848FEC|97CC    |0000CC;
    RTS                                                        ;848FEE|60      |      ;
 
 
fAIAction0x1C:
    REP #$30                                                   ;848FEF|C230    |      ;
    REP #$30                                                   ;848FF1|C230    |      ;
    LDA.B ptrAIActionData                                      ;848FF3|A5C9    |0000C9;
    CLC                                                        ;848FF5|18      |      ;
    ADC.W #$0001                                               ;848FF6|690100  |      ;
    STA.B ptrAIActionData                                      ;848FF9|85C9    |0000C9;
    REP #$20                                                   ;848FFB|C220    |      ;
    LDA.B [ptrAIActionData]                                    ;848FFD|A7C9    |0000C9;
    TAX                                                        ;848FFF|AA      |      ;
    REP #$30                                                   ;849000|C230    |      ;
    LDA.B ptrAIActionData                                      ;849002|A5C9    |0000C9;
    CLC                                                        ;849004|18      |      ;
    ADC.W #$0002                                               ;849005|690200  |      ;
    STA.B ptrAIActionData                                      ;849008|85C9    |0000C9;
    SEP #$20                                                   ;84900A|E220    |      ;
    LDA.B [ptrAIActionData]                                    ;84900C|A7C9    |0000C9;
    STA.W $0191                                                ;84900E|8D9101  |000191;
    SEP #$20                                                   ;849011|E220    |      ;
    LDA.B #$02                                                 ;849013|A902    |      ;
    STA.W $019A                                                ;849015|8D9A01  |00019A;
    JSL.L fDialog_DialogHandler                                ;849018|225F9383|83935F;
    REP #$30                                                   ;84901C|C230    |      ;
    LDA.B ptrAIActionData                                      ;84901E|A5C9    |0000C9;
    CLC                                                        ;849020|18      |      ;
    ADC.W #$0001                                               ;849021|690100  |      ;
    STA.B ptrAIActionData                                      ;849024|85C9    |0000C9;
    REP #$30                                                   ;849026|C230    |      ;
    LDY.W #$0010                                               ;849028|A01000  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84902B|B7CC    |0000CC;
    CLC                                                        ;84902D|18      |      ;
    ADC.W #$0001                                               ;84902E|690100  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;849031|97CC    |0000CC;
    RTS                                                        ;849033|60      |      ;
 
 
fAIAction0x1D:
    REP #$30                                                   ;849034|C230    |      ;
    REP #$30                                                   ;849036|C230    |      ;
    LDA.B ptrAIActionData                                      ;849038|A5C9    |0000C9;
    CLC                                                        ;84903A|18      |      ;
    ADC.W #$0001                                               ;84903B|690100  |      ;
    STA.B ptrAIActionData                                      ;84903E|85C9    |0000C9;
    REP #$20                                                   ;849040|C220    |      ;
    LDA.B [ptrAIActionData]                                    ;849042|A7C9    |0000C9;
    TAX                                                        ;849044|AA      |      ;
    REP #$30                                                   ;849045|C230    |      ;
    LDA.B ptrAIActionData                                      ;849047|A5C9    |0000C9;
    CLC                                                        ;849049|18      |      ;
    ADC.W #$0002                                               ;84904A|690200  |      ;
    STA.B ptrAIActionData                                      ;84904D|85C9    |0000C9;
    SEP #$20                                                   ;84904F|E220    |      ;
    LDA.B [ptrAIActionData]                                    ;849051|A7C9    |0000C9;
    STA.W $0191                                                ;849053|8D9101  |000191;
    SEP #$20                                                   ;849056|E220    |      ;
    LDA.B #$02                                                 ;849058|A902    |      ;
    STA.W $019A                                                ;84905A|8D9A01  |00019A;
    JSL.L fDialog_DialogHandler                                ;84905D|225F9383|83935F;
    REP #$30                                                   ;849061|C230    |      ;
    LDA.B ptrAIActionData                                      ;849063|A5C9    |0000C9;
    CLC                                                        ;849065|18      |      ;
    ADC.W #$0001                                               ;849066|690100  |      ;
    STA.B ptrAIActionData                                      ;849069|85C9    |0000C9;
    REP #$30                                                   ;84906B|C230    |      ;
    LDY.W #$0010                                               ;84906D|A01000  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;849070|B7CC    |0000CC;
    CLC                                                        ;849072|18      |      ;
    ADC.W #$0001                                               ;849073|690100  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;849076|97CC    |0000CC;
    RTS                                                        ;849078|60      |      ;
 
 
fAIAction0x1E:
    REP #$30                                                   ;849079|C230    |      ;
    REP #$30                                                   ;84907B|C230    |      ;
    LDA.B ptrAIActionData                                      ;84907D|A5C9    |0000C9;
    CLC                                                        ;84907F|18      |      ;
    ADC.W #$0001                                               ;849080|690100  |      ;
    STA.B ptrAIActionData                                      ;849083|85C9    |0000C9;
    SEP #$20                                                   ;849085|E220    |      ;
    REP #$10                                                   ;849087|C210    |      ;
    LDY.W #$000C                                               ;849089|A00C00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84908C|B7CC    |0000CC;
    CMP.B #$00                                                 ;84908E|C900    |      ;
    BNE +                                                      ;849090|D003    |849095;
    JMP.W .return                                              ;849092|4C8591  |849185;
 
 
  + REP #$30                                                   ;849095|C230    |      ;
    LDA.B nPlayerAction                                        ;849097|A5D4    |0000D4;
    CMP.W #$000A                                               ;849099|C90A00  |      ;
    BNE +                                                      ;84909C|D003    |8490A1;
    JMP.W .return                                              ;84909E|4C8591  |849185;
 
 
  + REP #$30                                                   ;8490A1|C230    |      ;
    LDA.B nPlayerAction                                        ;8490A3|A5D4    |0000D4;
    CMP.W #$000C                                               ;8490A5|C90C00  |      ;
    BNE +                                                      ;8490A8|D003    |8490AD;
    JMP.W .return                                              ;8490AA|4C8591  |849185;
 
 
  + REP #$30                                                   ;8490AD|C230    |      ;
    LDA.B nPlayerAction                                        ;8490AF|A5D4    |0000D4;
    CMP.W #$000D                                               ;8490B1|C90D00  |      ;
    BNE +                                                      ;8490B4|D003    |8490B9;
    JMP.W .return                                              ;8490B6|4C8591  |849185;
 
 
  + REP #$30                                                   ;8490B9|C230    |      ;
    LDA.B nPlayerAction                                        ;8490BB|A5D4    |0000D4;
    CMP.W #$001B                                               ;8490BD|C91B00  |      ;
    BNE +                                                      ;8490C0|D003    |8490C5;
    JMP.W .return                                              ;8490C2|4C8591  |849185;
 
 
  + REP #$20                                                   ;8490C5|C220    |      ;
    LDA.B strcPlayerFlags                                      ;8490C7|A5D2    |0000D2;
    AND.W #$0004                                               ;8490C9|290400  |      ;
    BEQ +                                                      ;8490CC|F003    |8490D1;
    JMP.W .return                                              ;8490CE|4C8591  |849185;
 
 
  + LDA.L strcDailyFlags.flags4                                ;8490D1|AF601F7F|7F1F60;
    AND.W #$0006                                               ;8490D5|290600  |      ;
    BEQ +                                                      ;8490D8|F003    |8490DD;
    JMP.W .return                                              ;8490DA|4C8591  |849185;
 
 
  + REP #$20                                                   ;8490DD|C220    |      ;
    LDA.W strcJoypad1.newInput                                 ;8490DF|AD2801  |000128;
    BIT.W #$0080                                               ;8490E2|898000  |      ;
    BNE .continue                                              ;8490E5|D003    |8490EA;
    JMP.W .return                                              ;8490E7|4C8591  |849185;
 
 
.continue:
    REP #$20                                                   ;8490EA|C220    |      ;
    LDA.B [ptrAIActionData]                                    ;8490EC|A7C9    |0000C9;
    STA.B ptrAIActionData                                      ;8490EE|85C9    |0000C9;
    SEP #$20                                                   ;8490F0|E220    |      ;
    REP #$10                                                   ;8490F2|C210    |      ;
    LDY.W #$0007                                               ;8490F4|A00700  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;8490F7|B7CC    |0000CC;
    SEP #$20                                                   ;8490F9|E220    |      ;
    REP #$10                                                   ;8490FB|C210    |      ;
    LDY.W #$0008                                               ;8490FD|A00800  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;849100|97CC    |0000CC;
    SEP #$20                                                   ;849102|E220    |      ;
    REP #$10                                                   ;849104|C210    |      ;
    LDY.W #$0003                                               ;849106|A00300  |      ;
    LDA.B #$00                                                 ;849109|A900    |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84910B|97CC    |0000CC;
    SEP #$20                                                   ;84910D|E220    |      ;
    REP #$10                                                   ;84910F|C210    |      ;
    LDY.W #$0004                                               ;849111|A00400  |      ;
    LDA.B #$00                                                 ;849114|A900    |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;849116|97CC    |0000CC;
    SEP #$20                                                   ;849118|E220    |      ;
    REP #$10                                                   ;84911A|C210    |      ;
    LDY.W #$000C                                               ;84911C|A00C00  |      ;
    LDA.B #$00                                                 ;84911F|A900    |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;849121|97CC    |0000CC;
    REP #$20                                                   ;849123|C220    |      ;
    LDA.B nPlayerDirection                                     ;849125|A5DA    |0000DA;
    EOR.W #$0001                                               ;849127|490100  |      ;
    SEP #$20                                                   ;84912A|E220    |      ;
    REP #$10                                                   ;84912C|C210    |      ;
    LDY.W #$0002                                               ;84912E|A00200  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;849131|97CC    |0000CC;
    REP #$30                                                   ;849133|C230    |      ;
    LDY.W #$0033                                               ;849135|A03300  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;849138|B7CC    |0000CC;
    STA.B ptrUnknown0x72                                       ;84913A|8572    |000072;
    SEP #$20                                                   ;84913C|E220    |      ;
    LDA.B #$B3                                                 ;84913E|A9B3    |      ;
    STA.B ptrUnknown0x72+2                                     ;849140|8574    |000074;
    JSL.L fAI_Unknown848895                                    ;849142|22958884|848895;
    SEP #$20                                                   ;849146|E220    |      ;
    REP #$10                                                   ;849148|C210    |      ;
    LDY.W #$0001                                               ;84914A|A00100  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84914D|B7CC    |0000CC;
    ORA.B #$14                                                 ;84914F|0914    |      ;
    SEP #$20                                                   ;849151|E220    |      ;
    REP #$10                                                   ;849153|C210    |      ;
    LDY.W #$0001                                               ;849155|A00100  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;849158|97CC    |0000CC;
    SEP #$20                                                   ;84915A|E220    |      ;
    LDA.B #$56                                                 ;84915C|A956    |      ;
    STA.W nPlayerInteractionIndex                              ;84915E|8D6E09  |00096E;
    STZ.W nPlayerInteractionArg1                               ;849161|9C6F09  |00096F;
    STZ.W nPlayerInteractionArg2                               ;849164|9C7009  |000970;
    REP #$30                                                   ;849167|C230    |      ;
    LDA.B strcPlayerFlags                                      ;849169|A5D2    |0000D2;
    ORA.W #$0040                                               ;84916B|094000  |      ;
    STA.B strcPlayerFlags                                      ;84916E|85D2    |0000D2;
    REP #$30                                                   ;849170|C230    |      ;
    LDA.W #$0000                                               ;849172|A90000  |      ;
    STA.B nPlayerAction                                        ;849175|85D4    |0000D4;
    REP #$30                                                   ;849177|C230    |      ;
    LDY.W #$0010                                               ;849179|A01000  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84917C|B7CC    |0000CC;
    CLC                                                        ;84917E|18      |      ;
    ADC.W #$0001                                               ;84917F|690100  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;849182|97CC    |0000CC;
    RTS                                                        ;849184|60      |      ;
 
 
.return:
    REP #$30                                                   ;849185|C230    |      ;
    LDA.B ptrAIActionData                                      ;849187|A5C9    |0000C9;
    CLC                                                        ;849189|18      |      ;
    ADC.W #$0002                                               ;84918A|690200  |      ;
    STA.B ptrAIActionData                                      ;84918D|85C9    |0000C9;
    REP #$30                                                   ;84918F|C230    |      ;
    LDY.W #$0010                                               ;849191|A01000  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;849194|B7CC    |0000CC;
    CLC                                                        ;849196|18      |      ;
    ADC.W #$0001                                               ;849197|690100  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84919A|97CC    |0000CC;
    RTS                                                        ;84919C|60      |      ;
 
 
fAIAction0x20:
    REP #$30                                                   ;84919D|C230    |      ;
    REP #$30                                                   ;84919F|C230    |      ;
    LDA.B ptrAIActionData                                      ;8491A1|A5C9    |0000C9;
    CLC                                                        ;8491A3|18      |      ;
    ADC.W #$0001                                               ;8491A4|690100  |      ;
    STA.B ptrAIActionData                                      ;8491A7|85C9    |0000C9;
    SEP #$20                                                   ;8491A9|E220    |      ;
    LDA.B [ptrAIActionData]                                    ;8491AB|A7C9    |0000C9;
    STA.B n8TempVar1                                           ;8491AD|8592    |000092;
    LDA.W $018F                                                ;8491AF|AD8F01  |00018F;
    CMP.B n8TempVar1                                           ;8491B2|C592    |000092;
    BNE +                                                      ;8491B4|D011    |8491C7;
    REP #$30                                                   ;8491B6|C230    |      ;
    LDA.B ptrAIActionData                                      ;8491B8|A5C9    |0000C9;
    CLC                                                        ;8491BA|18      |      ;
    ADC.W #$0001                                               ;8491BB|690100  |      ;
    STA.B ptrAIActionData                                      ;8491BE|85C9    |0000C9;
    REP #$20                                                   ;8491C0|C220    |      ;
    LDA.B [ptrAIActionData]                                    ;8491C2|A7C9    |0000C9;
    STA.B ptrAIActionData                                      ;8491C4|85C9    |0000C9;
    RTS                                                        ;8491C6|60      |      ;
 
 
  + REP #$30                                                   ;8491C7|C230    |      ;
    LDA.B ptrAIActionData                                      ;8491C9|A5C9    |0000C9;
    CLC                                                        ;8491CB|18      |      ;
    ADC.W #$0003                                               ;8491CC|690300  |      ;
    STA.B ptrAIActionData                                      ;8491CF|85C9    |0000C9;
    RTS                                                        ;8491D1|60      |      ;
 
 
fAIAction0x21:
    REP #$30                                                   ;8491D2|C230    |      ;
    REP #$30                                                   ;8491D4|C230    |      ;
    LDA.B ptrAIActionData                                      ;8491D6|A5C9    |0000C9;
    CLC                                                        ;8491D8|18      |      ;
    ADC.W #$0001                                               ;8491D9|690100  |      ;
    STA.B ptrAIActionData                                      ;8491DC|85C9    |0000C9;
    REP #$20                                                   ;8491DE|C220    |      ;
    LDA.B [ptrAIActionData]                                    ;8491E0|A7C9    |0000C9;
    STA.B ptrUnknown0x72                                       ;8491E2|8572    |000072;
    REP #$30                                                   ;8491E4|C230    |      ;
    LDA.B ptrAIActionData                                      ;8491E6|A5C9    |0000C9;
    CLC                                                        ;8491E8|18      |      ;
    ADC.W #$0002                                               ;8491E9|690200  |      ;
    STA.B ptrAIActionData                                      ;8491EC|85C9    |0000C9;
    SEP #$20                                                   ;8491EE|E220    |      ;
    LDA.B [ptrAIActionData]                                    ;8491F0|A7C9    |0000C9;
    STA.B ptrUnknown0x72+2                                     ;8491F2|8574    |000074;
    REP #$30                                                   ;8491F4|C230    |      ;
    LDA.B ptrAIActionData                                      ;8491F6|A5C9    |0000C9;
    CLC                                                        ;8491F8|18      |      ;
    ADC.W #$0001                                               ;8491F9|690100  |      ;
    STA.B ptrAIActionData                                      ;8491FC|85C9    |0000C9;
    SEP #$20                                                   ;8491FE|E220    |      ;
    LDA.B #$00                                                 ;849200|A900    |      ;
    XBA                                                        ;849202|EB      |      ;
    LDA.B [ptrAIActionData]                                    ;849203|A7C9    |0000C9;
    BPL +                                                      ;849205|1004    |84920B;
    XBA                                                        ;849207|EB      |      ;
    LDA.B #$FF                                                 ;849208|A9FF    |      ;
    XBA                                                        ;84920A|EB      |      ;
 
  + REP #$20                                                   ;84920B|C220    |      ;
    STA.B n16TempVar1                                          ;84920D|857E    |00007E;
    REP #$30                                                   ;84920F|C230    |      ;
    LDA.B ptrAIActionData                                      ;849211|A5C9    |0000C9;
    CLC                                                        ;849213|18      |      ;
    ADC.W #$0001                                               ;849214|690100  |      ;
    STA.B ptrAIActionData                                      ;849217|85C9    |0000C9;
    SEP #$20                                                   ;849219|E220    |      ;
    LDA.B #$00                                                 ;84921B|A900    |      ;
    XBA                                                        ;84921D|EB      |      ;
    LDA.B [ptrUnknown0x72]                                     ;84921E|A772    |000072;
    REP #$20                                                   ;849220|C220    |      ;
    CLC                                                        ;849222|18      |      ;
    ADC.B n16TempVar1                                          ;849223|657E    |00007E;
    BMI +                                                      ;849225|300B    |849232;
    CMP.W #$00FF                                               ;849227|C9FF00  |      ;
    BCC .return                                                ;84922A|900C    |849238;
    SEP #$20                                                   ;84922C|E220    |      ;
    LDA.B #$FF                                                 ;84922E|A9FF    |      ;
    BRA .return                                                ;849230|8006    |849238;
 
 
  + SEP #$20                                                   ;849232|E220    |      ;
    REP #$10                                                   ;849234|C210    |      ;
    LDA.B #$00                                                 ;849236|A900    |      ;
 
.return:
    SEP #$20                                                   ;849238|E220    |      ;
    REP #$10                                                   ;84923A|C210    |      ;
    STA.B [ptrUnknown0x72]                                     ;84923C|8772    |000072;
    RTS                                                        ;84923E|60      |      ;
 
 
fAIAction0x22:
    REP #$30                                                   ;84923F|C230    |      ;
    REP #$30                                                   ;849241|C230    |      ;
    LDA.B ptrAIActionData                                      ;849243|A5C9    |0000C9;
    CLC                                                        ;849245|18      |      ;
    ADC.W #$0001                                               ;849246|690100  |      ;
    STA.B ptrAIActionData                                      ;849249|85C9    |0000C9;
    SEP #$20                                                   ;84924B|E220    |      ;
    LDA.B [ptrAIActionData]                                    ;84924D|A7C9    |0000C9;
    SEP #$20                                                   ;84924F|E220    |      ;
    REP #$10                                                   ;849251|C210    |      ;
    LDY.W #$0009                                               ;849253|A00900  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;849256|97CC    |0000CC;
    REP #$30                                                   ;849258|C230    |      ;
    LDA.B ptrAIActionData                                      ;84925A|A5C9    |0000C9;
    CLC                                                        ;84925C|18      |      ;
    ADC.W #$0001                                               ;84925D|690100  |      ;
    STA.B ptrAIActionData                                      ;849260|85C9    |0000C9;
    SEP #$20                                                   ;849262|E220    |      ;
    LDA.B [ptrAIActionData]                                    ;849264|A7C9    |0000C9;
    SEP #$20                                                   ;849266|E220    |      ;
    REP #$10                                                   ;849268|C210    |      ;
    LDY.W #$000A                                               ;84926A|A00A00  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84926D|97CC    |0000CC;
    REP #$30                                                   ;84926F|C230    |      ;
    LDA.B ptrAIActionData                                      ;849271|A5C9    |0000C9;
    CLC                                                        ;849273|18      |      ;
    ADC.W #$0001                                               ;849274|690100  |      ;
    STA.B ptrAIActionData                                      ;849277|85C9    |0000C9;
    SEP #$20                                                   ;849279|E220    |      ;
    LDA.B [ptrAIActionData]                                    ;84927B|A7C9    |0000C9;
    SEP #$20                                                   ;84927D|E220    |      ;
    REP #$10                                                   ;84927F|C210    |      ;
    LDY.W #$000B                                               ;849281|A00B00  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;849284|97CC    |0000CC;
    SEP #$20                                                   ;849286|E220    |      ;
    REP #$10                                                   ;849288|C210    |      ;
    LDY.W #$0005                                               ;84928A|A00500  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84928D|97CC    |0000CC;
    SEP #$20                                                   ;84928F|E220    |      ;
    REP #$10                                                   ;849291|C210    |      ;
    LDY.W #$0006                                               ;849293|A00600  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;849296|97CC    |0000CC;
    REP #$30                                                   ;849298|C230    |      ;
    LDA.B ptrAIActionData                                      ;84929A|A5C9    |0000C9;
    CLC                                                        ;84929C|18      |      ;
    ADC.W #$0001                                               ;84929D|690100  |      ;
    STA.B ptrAIActionData                                      ;8492A0|85C9    |0000C9;
    LDA.B [ptrAIActionData]                                    ;8492A2|A7C9    |0000C9;
    REP #$30                                                   ;8492A4|C230    |      ;
    LDY.W #$0036                                               ;8492A6|A03600  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;8492A9|97CC    |0000CC;
    REP #$30                                                   ;8492AB|C230    |      ;
    LDA.B ptrAIActionData                                      ;8492AD|A5C9    |0000C9;
    CLC                                                        ;8492AF|18      |      ;
    ADC.W #$0002                                               ;8492B0|690200  |      ;
    STA.B ptrAIActionData                                      ;8492B3|85C9    |0000C9;
    SEP #$20                                                   ;8492B5|E220    |      ;
    LDA.B [ptrAIActionData]                                    ;8492B7|A7C9    |0000C9;
    SEP #$20                                                   ;8492B9|E220    |      ;
    REP #$10                                                   ;8492BB|C210    |      ;
    LDY.W #$0007                                               ;8492BD|A00700  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;8492C0|97CC    |0000CC;
    SEP #$20                                                   ;8492C2|E220    |      ;
    REP #$10                                                   ;8492C4|C210    |      ;
    LDY.W #$0008                                               ;8492C6|A00800  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;8492C9|97CC    |0000CC;
    REP #$30                                                   ;8492CB|C230    |      ;
    LDA.B ptrAIActionData                                      ;8492CD|A5C9    |0000C9;
    CLC                                                        ;8492CF|18      |      ;
    ADC.W #$0001                                               ;8492D0|690100  |      ;
    STA.B ptrAIActionData                                      ;8492D3|85C9    |0000C9;
    SEP #$20                                                   ;8492D5|E220    |      ;
    REP #$10                                                   ;8492D7|C210    |      ;
    LDY.W #$0001                                               ;8492D9|A00100  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;8492DC|B7CC    |0000CC;
    ORA.B #$28                                                 ;8492DE|0928    |      ;
    SEP #$20                                                   ;8492E0|E220    |      ;
    REP #$10                                                   ;8492E2|C210    |      ;
    LDY.W #$0001                                               ;8492E4|A00100  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;8492E7|97CC    |0000CC;
    REP #$30                                                   ;8492E9|C230    |      ;
    LDY.W #$001A                                               ;8492EB|A01A00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;8492EE|B7CC    |0000CC;
    REP #$30                                                   ;8492F0|C230    |      ;
    LDY.W #$001E                                               ;8492F2|A01E00  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;8492F5|97CC    |0000CC;
    REP #$30                                                   ;8492F7|C230    |      ;
    LDY.W #$001C                                               ;8492F9|A01C00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;8492FC|B7CC    |0000CC;
    REP #$30                                                   ;8492FE|C230    |      ;
    LDY.W #$0020                                               ;849300|A02000  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;849303|97CC    |0000CC;
    RTS                                                        ;849305|60      |      ;
 
 
fAIAction0x23:
    REP #$30                                                   ;849306|C230    |      ;
    REP #$30                                                   ;849308|C230    |      ;
    LDA.B ptrAIActionData                                      ;84930A|A5C9    |0000C9;
    CLC                                                        ;84930C|18      |      ;
    ADC.W #$0001                                               ;84930D|690100  |      ;
    STA.B ptrAIActionData                                      ;849310|85C9    |0000C9;
    REP #$20                                                   ;849312|C220    |      ;
    LDA.B [ptrAIActionData]                                    ;849314|A7C9    |0000C9;
    STA.B ptrUnknown0x72                                       ;849316|8572    |000072;
    REP #$30                                                   ;849318|C230    |      ;
    LDA.B ptrAIActionData                                      ;84931A|A5C9    |0000C9;
    CLC                                                        ;84931C|18      |      ;
    ADC.W #$0002                                               ;84931D|690200  |      ;
    STA.B ptrAIActionData                                      ;849320|85C9    |0000C9;
    SEP #$20                                                   ;849322|E220    |      ;
    LDA.B [ptrAIActionData]                                    ;849324|A7C9    |0000C9;
    STA.B ptrUnknown0x72+2                                     ;849326|8574    |000074;
    REP #$30                                                   ;849328|C230    |      ;
    LDA.B ptrAIActionData                                      ;84932A|A5C9    |0000C9;
    CLC                                                        ;84932C|18      |      ;
    ADC.W #$0001                                               ;84932D|690100  |      ;
    STA.B ptrAIActionData                                      ;849330|85C9    |0000C9;
    SEP #$20                                                   ;849332|E220    |      ;
    LDA.B #$00                                                 ;849334|A900    |      ;
    XBA                                                        ;849336|EB      |      ;
    LDA.B [ptrAIActionData]                                    ;849337|A7C9    |0000C9;
    REP #$20                                                   ;849339|C220    |      ;
    ASL A                                                      ;84933B|0A      |      ;
    TAX                                                        ;84933C|AA      |      ;
    LDA.L aAISetMask,X                                         ;84933D|BFD39484|8494D3;
    STA.B n16TempVar1                                          ;849341|857E    |00007E;
    REP #$20                                                   ;849343|C220    |      ;
    LDA.B [ptrUnknown0x72]                                     ;849345|A772    |000072;
    ORA.B n16TempVar1                                          ;849347|057E    |00007E;
    STA.B [ptrUnknown0x72]                                     ;849349|8772    |000072;
    REP #$30                                                   ;84934B|C230    |      ;
    LDA.B ptrAIActionData                                      ;84934D|A5C9    |0000C9;
    CLC                                                        ;84934F|18      |      ;
    ADC.W #$0001                                               ;849350|690100  |      ;
    STA.B ptrAIActionData                                      ;849353|85C9    |0000C9;
    RTS                                                        ;849355|60      |      ;
 
 
fAIAction0x24:
    REP #$30                                                   ;849356|C230    |      ;
    REP #$30                                                   ;849358|C230    |      ;
    LDA.B ptrAIActionData                                      ;84935A|A5C9    |0000C9;
    CLC                                                        ;84935C|18      |      ;
    ADC.W #$0001                                               ;84935D|690100  |      ;
    STA.B ptrAIActionData                                      ;849360|85C9    |0000C9;
    SEP #$20                                                   ;849362|E220    |      ;
    LDA.B [ptrAIActionData]                                    ;849364|A7C9    |0000C9;
    JSL.L fPalette_Unknown808FC7                               ;849366|22C78F80|808FC7;
    REP #$30                                                   ;84936A|C230    |      ;
    LDA.B ptrAIActionData                                      ;84936C|A5C9    |0000C9;
    CLC                                                        ;84936E|18      |      ;
    ADC.W #$0001                                               ;84936F|690100  |      ;
    STA.B ptrAIActionData                                      ;849372|85C9    |0000C9;
    RTS                                                        ;849374|60      |      ;
 
 
fAIAction0x25:
    REP #$30                                                   ;849375|C230    |      ;
    REP #$30                                                   ;849377|C230    |      ;
    LDA.B ptrAIActionData                                      ;849379|A5C9    |0000C9;
    CLC                                                        ;84937B|18      |      ;
    ADC.W #$0001                                               ;84937C|690100  |      ;
    STA.B ptrAIActionData                                      ;84937F|85C9    |0000C9;
    LDA.B ptrAIUnknown0xCC                                     ;849381|A5CC    |0000CC;
    STA.B ptrUnknown0x72                                       ;849383|8572    |000072;
    SEP #$20                                                   ;849385|E220    |      ;
    LDA.B ptrAIUnknown0xCC+2                                   ;849387|A5CE    |0000CE;
    STA.B ptrUnknown0x72+2                                     ;849389|8574    |000074;
    SEP #$20                                                   ;84938B|E220    |      ;
    LDA.B #$00                                                 ;84938D|A900    |      ;
    XBA                                                        ;84938F|EB      |      ;
    LDA.B [ptrAIActionData]                                    ;849390|A7C9    |0000C9;
    REP #$20                                                   ;849392|C220    |      ;
    JSL.L fAI_Unknown84887C                                    ;849394|227C8884|84887C;
    REP #$30                                                   ;849398|C230    |      ;
    LDA.B ptrAIActionData                                      ;84939A|A5C9    |0000C9;
    CLC                                                        ;84939C|18      |      ;
    ADC.W #$0001                                               ;84939D|690100  |      ;
    STA.B ptrAIActionData                                      ;8493A0|85C9    |0000C9;
    REP #$30                                                   ;8493A2|C230    |      ;
    SEP #$20                                                   ;8493A4|E220    |      ;
    REP #$10                                                   ;8493A6|C210    |      ;
    LDY.W #$0000                                               ;8493A8|A00000  |      ;
    LDA.B #$00                                                 ;8493AB|A900    |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;8493AD|97CC    |0000CC;
    REP #$30                                                   ;8493AF|C230    |      ;
    LDY.W #$0012                                               ;8493B1|A01200  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;8493B4|B7CC    |0000CC;
    STA.B $A5                                                  ;8493B6|85A5    |0000A5;
    JSL.L fUnknown_8581A2                                      ;8493B8|22A28185|8581A2;
    REP #$20                                                   ;8493BC|C220    |      ;
    LDA.B ptrUnknown0x72                                       ;8493BE|A572    |000072;
    STA.B ptrAIUnknown0xCC                                     ;8493C0|85CC    |0000CC;
    SEP #$20                                                   ;8493C2|E220    |      ;
    LDA.B ptrUnknown0x72+2                                     ;8493C4|A574    |000074;
    STA.B ptrAIUnknown0xCC+2                                   ;8493C6|85CE    |0000CE;
    RTS                                                        ;8493C8|60      |      ;
 
 
fAIAction0x26:
    REP #$30                                                   ;8493C9|C230    |      ;
    REP #$30                                                   ;8493CB|C230    |      ;
    LDA.B ptrAIActionData                                      ;8493CD|A5C9    |0000C9;
    CLC                                                        ;8493CF|18      |      ;
    ADC.W #$0001                                               ;8493D0|690100  |      ;
    STA.B ptrAIActionData                                      ;8493D3|85C9    |0000C9;
    REP #$20                                                   ;8493D5|C220    |      ;
    LDA.B [ptrAIActionData]                                    ;8493D7|A7C9    |0000C9;
    STA.B ptrUnknown0x72                                       ;8493D9|8572    |000072;
    REP #$30                                                   ;8493DB|C230    |      ;
    LDA.B ptrAIActionData                                      ;8493DD|A5C9    |0000C9;
    CLC                                                        ;8493DF|18      |      ;
    ADC.W #$0002                                               ;8493E0|690200  |      ;
    STA.B ptrAIActionData                                      ;8493E3|85C9    |0000C9;
    SEP #$20                                                   ;8493E5|E220    |      ;
    LDA.B [ptrAIActionData]                                    ;8493E7|A7C9    |0000C9;
    STA.B ptrUnknown0x72+2                                     ;8493E9|8574    |000074;
    REP #$30                                                   ;8493EB|C230    |      ;
    LDA.B ptrAIActionData                                      ;8493ED|A5C9    |0000C9;
    CLC                                                        ;8493EF|18      |      ;
    ADC.W #$0001                                               ;8493F0|690100  |      ;
    STA.B ptrAIActionData                                      ;8493F3|85C9    |0000C9;
    SEP #$20                                                   ;8493F5|E220    |      ;
    LDA.B #$00                                                 ;8493F7|A900    |      ;
    XBA                                                        ;8493F9|EB      |      ;
    LDA.B [ptrAIActionData]                                    ;8493FA|A7C9    |0000C9;
    REP #$20                                                   ;8493FC|C220    |      ;
    ASL A                                                      ;8493FE|0A      |      ;
    TAX                                                        ;8493FF|AA      |      ;
    LDA.L aAIResetMask,X                                       ;849400|BFF39484|8494F3;
    STA.B n16TempVar1                                          ;849404|857E    |00007E;
    REP #$20                                                   ;849406|C220    |      ;
    LDA.B [ptrUnknown0x72]                                     ;849408|A772    |000072;
    AND.B n16TempVar1                                          ;84940A|257E    |00007E;
    STA.B [ptrUnknown0x72]                                     ;84940C|8772    |000072;
    REP #$30                                                   ;84940E|C230    |      ;
    LDA.B ptrAIActionData                                      ;849410|A5C9    |0000C9;
    CLC                                                        ;849412|18      |      ;
    ADC.W #$0001                                               ;849413|690100  |      ;
    STA.B ptrAIActionData                                      ;849416|85C9    |0000C9;
    RTS                                                        ;849418|60      |      ;
 
 
aAIActions:
    dw fAIAction0x00_SetMusicTrack                             ;849419|        |8489BB; 0x5A * [ptr16]
    dw fAIAction0x01_UnfreezeTime                              ;84941B|        |8489E3;
    dw fAIAction0x02_FreezeTime                                ;84941D|        |848A0D;
    dw fAIAction0x03_SetHour                                   ;84941F|        |848A39;
    dw fAIAction0x04_DoesNothing                               ;849421|        |848A58;
    dw fAIAction0x05_SetMapDestinationCoords                   ;849423|        |848A65;
    dw fAIAction0x06_SetMapDestinationId                       ;849425|        |848A94;
    dw fAIAction0x07_SetPlayerDirection                        ;849427|        |848ABF;
    dw fAIAction0x08_ClearPlayerStateFlags                     ;849429|        |848AE7;
    dw fAIAction0x09                                           ;84942B|        |848B08;
    dw fAIAction0x0A                                           ;84942D|        |848B83;
    dw fAIAction0x0B                                           ;84942F|        |848BAC;
    dw fAIAction0x0C                                           ;849431|        |848BDC;
    dw fAIAction0x0D                                           ;849433|        |848C22;
    dw fAIAction0x0E                                           ;849435|        |848CA8;
    dw fAIAction0x0F                                           ;849437|        |848CB9;
    dw fAIAction0x10                                           ;849439|        |848CE2;
    dw fAIAction0x11                                           ;84943B|        |848CFD;
    dw fAIAction0x12_AlwaysJump                                ;84943D|        |848D13;
    dw fAIAction0x13                                           ;84943F|        |848D24;
    dw fAIAction0x14                                           ;849441|        |848D44;
    dw fAIAction0x15                                           ;849443|        |848DA5;
    dw fAIAction0x16                                           ;849445|        |848DFB;
    dw fAIAction0x17                                           ;849447|        |848E68;
    dw fAIAction0x18                                           ;849449|        |848E90;
    dw fAIAction0x19                                           ;84944B|        |848EC9;
    dw fAIAction0x1A                                           ;84944D|        |848F0A;
    dw fAIAction0x1B                                           ;84944F|        |848F9B;
    dw fAIAction0x1C                                           ;849451|        |848FEF;
    dw fAIAction0x1D                                           ;849453|        |849034;
    dw fAIAction0x1E                                           ;849455|        |849079;
    dw fAIAction0x1E                                           ;849457|        |849079;
    dw fAIAction0x20                                           ;849459|        |84919D;
    dw fAIAction0x21                                           ;84945B|        |8491D2;
    dw fAIAction0x22                                           ;84945D|        |84923F;
    dw fAIAction0x23                                           ;84945F|        |849306;
    dw fAIAction0x24                                           ;849461|        |849356;
    dw fAIAction0x25                                           ;849463|        |849375;
    dw fAIAction0x26                                           ;849465|        |8493C9;
    dw fAIAction0x26                                           ;849467|        |8493C9;
    dw fAIAction0x26                                           ;849469|        |8493C9;
    dw fAIAction0x29                                           ;84946B|        |849513;
    dw fAIAction0x2A                                           ;84946D|        |849553;
    dw fAIAction0x2B                                           ;84946F|        |84957D;
    dw fAIAction0x2C                                           ;849471|        |8495E8;
    dw fAIAction0x2D_ConditionalJump                           ;849473|        |849633;
    dw fAIAction0x2E                                           ;849475|        |849777;
    dw fAIAction0x2F                                           ;849477|        |849810;
    dw fAIAction0x30_UpdateChicken                             ;849479|        |849857;
    dw fAIAction0x31_UpdateCow                                 ;84947B|        |849AD4;
    dw fAIAction0x32                                           ;84947D|        |84A90F;
    dw fAIAction0x33_UpdateMole                                ;84947F|        |84A94C;
    dw fAIAction0x34                                           ;849481|        |84AA5D;
    dw fAIAction0x35_UpdateHorse                               ;849483|        |84AB27;
    dw fAIAction0x36_UpdateDog                                 ;849485|        |84AF06;
    dw fAIAction0x37                                           ;849487|        |84B34B;
    dw fAIAction0x38                                           ;849489|        |84B365;
    dw fAIAction0x39                                           ;84948B|        |84B389;
    dw fAIAction0x3A                                           ;84948D|        |84B427;
    dw fAIAction0x3B                                           ;84948F|        |84B4DC;
    dw fAIAction0x3C                                           ;849491|        |84B503;
    dw fAIAction0x3D                                           ;849493|        |84B52D;
    dw fAIAction0x3E                                           ;849495|        |84B556;
    dw fAIAction0x3F_ThrowHeldItem                             ;849497|        |84B57B;
    dw fAIAction0x40_DisableTileInteractions                   ;849499|        |84B58F;
    dw fAIAction0x41                                           ;84949B|        |84B5A9;
    dw fAIAction0x42                                           ;84949D|        |84B602;
    dw fAIAction0x43                                           ;84949F|        |84B666;
    dw fAIAction0x44                                           ;8494A1|        |84B6BC;
    dw fAIAction0x45                                           ;8494A3|        |84B72D;
    dw fAIAction0x46                                           ;8494A5|        |84B79A;
    dw fAIAction0x47                                           ;8494A7|        |84B84C;
    dw fAIAction0x48                                           ;8494A9|        |84B889;
    dw fAIAction0x49                                           ;8494AB|        |84B8D9;
    dw fAIAction0x4A_UpdatePowerBerry                          ;8494AD|        |84B93C;
    dw fAIAction0x4B                                           ;8494AF|        |84BA10;
    dw fAIAction0x4C                                           ;8494B1|        |84BA51;
    dw fAIAction0x4D                                           ;8494B3|        |84BA72;
    dw fAIAction0x4E                                           ;8494B5|        |84BB31;
    dw fAIAction0x4F                                           ;8494B7|        |84BB4B;
    dw fAIAction0x50                                           ;8494B9|        |84BBDA;
    dw fAIAction0x51                                           ;8494BB|        |84BC9C;
    dw fAIAction0x52                                           ;8494BD|        |84BD44;
    dw fAIAction0x53                                           ;8494BF|        |84BE0D;
    dw fAIAction0x54                                           ;8494C1|        |84BED6;
    dw fAIAction0x55                                           ;8494C3|        |84BF20;
    dw fAIAction0x56_UseEquippedItem                           ;8494C5|        |84BF81;
    dw fAIAction0x57_UpdateStamina                             ;8494C7|        |84BFA0;
    dw fAIAction0x58                                           ;8494C9|        |84BFBF;
    dw fAIAction0x59_SwapEquippedItems                         ;8494CB|        |84C000;
 
pppAITable_8494CD:
    dl ppTable_B38000                                          ;8494CD|        |B38000;
    dl pScripting_B48000                                       ;8494D0|        |B48000;
 
aAISetMask:
    dw $0001,$0002,$0004,$0008,$0010,$0020                     ;8494D3|        |      ;
    dw $0040,$0080,$0100,$0200,$0400,$0800                     ;8494DF|        |      ;
    dw $1000,$2000,$4000,$8000                                 ;8494EB|        |      ;
 
aAIResetMask:
    dw $FFFE,$FFFD,$FFFB,$FFF7,$FFEF,$FFDF                     ;8494F3|        |      ;
    dw $FFBF,$FF7F,$FEFF,$FDFF,$FBFF,$F7FF                     ;8494FF|        |      ;
    dw $EFFF,$DFFF,$BFFF,$7FFF                                 ;84950B|        |      ;
 
fAIAction0x29:
    REP #$30                                                   ;849513|C230    |      ;
    REP #$30                                                   ;849515|C230    |      ;
    LDA.B ptrAIActionData                                      ;849517|A5C9    |0000C9;
    CLC                                                        ;849519|18      |      ;
    ADC.W #$0001                                               ;84951A|690100  |      ;
    STA.B ptrAIActionData                                      ;84951D|85C9    |0000C9;
    REP #$20                                                   ;84951F|C220    |      ;
    LDA.B [ptrAIActionData]                                    ;849521|A7C9    |0000C9;
    STA.W nMapScrool_SpeedX                                    ;849523|8D7C08  |00087C;
    REP #$30                                                   ;849526|C230    |      ;
    LDA.B ptrAIActionData                                      ;849528|A5C9    |0000C9;
    CLC                                                        ;84952A|18      |      ;
    ADC.W #$0002                                               ;84952B|690200  |      ;
    STA.B ptrAIActionData                                      ;84952E|85C9    |0000C9;
    REP #$20                                                   ;849530|C220    |      ;
    LDA.B [ptrAIActionData]                                    ;849532|A7C9    |0000C9;
    STA.W nMapScrool_SpeedY                                    ;849534|8D7E08  |00087E;
    REP #$30                                                   ;849537|C230    |      ;
    LDA.B ptrAIActionData                                      ;849539|A5C9    |0000C9;
    CLC                                                        ;84953B|18      |      ;
    ADC.W #$0002                                               ;84953C|690200  |      ;
    STA.B ptrAIActionData                                      ;84953F|85C9    |0000C9;
    SEP #$20                                                   ;849541|E220    |      ;
    LDA.B [ptrAIActionData]                                    ;849543|A7C9    |0000C9;
    STA.W nMapScrool_Timer                                     ;849545|8D8008  |000880;
    REP #$30                                                   ;849548|C230    |      ;
    LDA.B ptrAIActionData                                      ;84954A|A5C9    |0000C9;
    CLC                                                        ;84954C|18      |      ;
    ADC.W #$0001                                               ;84954D|690100  |      ;
    STA.B ptrAIActionData                                      ;849550|85C9    |0000C9;
    RTS                                                        ;849552|60      |      ;
 
 
fAIAction0x2A:
    REP #$30                                                   ;849553|C230    |      ;
    REP #$30                                                   ;849555|C230    |      ;
    LDA.B ptrAIActionData                                      ;849557|A5C9    |0000C9;
    CLC                                                        ;849559|18      |      ;
    ADC.W #$0001                                               ;84955A|690100  |      ;
    STA.B ptrAIActionData                                      ;84955D|85C9    |0000C9;
    LDA.B [ptrAIActionData]                                    ;84955F|A7C9    |0000C9;
    JSL.L fUnknownCF_SetPointer                                ;849561|22E1A581|81A5E1;
    REP #$30                                                   ;849565|C230    |      ;
    LDA.B ptrAIActionData                                      ;849567|A5C9    |0000C9;
    CLC                                                        ;849569|18      |      ;
    ADC.W #$0002                                               ;84956A|690200  |      ;
    STA.B ptrAIActionData                                      ;84956D|85C9    |0000C9;
    REP #$30                                                   ;84956F|C230    |      ;
    LDY.W #$0010                                               ;849571|A01000  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;849574|B7CC    |0000CC;
    CLC                                                        ;849576|18      |      ;
    ADC.W #$0001                                               ;849577|690100  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84957A|97CC    |0000CC;
    RTS                                                        ;84957C|60      |      ;
 
 
fAIAction0x2B:
    REP #$30                                                   ;84957D|C230    |      ;
    REP #$30                                                   ;84957F|C230    |      ;
    LDA.B ptrAIActionData                                      ;849581|A5C9    |0000C9;
    CLC                                                        ;849583|18      |      ;
    ADC.W #$0001                                               ;849584|690100  |      ;
    STA.B ptrAIActionData                                      ;849587|85C9    |0000C9;
    LDA.B [ptrAIActionData]                                    ;849589|A7C9    |0000C9;
    REP #$30                                                   ;84958B|C230    |      ;
    LDY.W #$0033                                               ;84958D|A03300  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;849590|97CC    |0000CC;
    REP #$30                                                   ;849592|C230    |      ;
    LDA.B ptrAIActionData                                      ;849594|A5C9    |0000C9;
    CLC                                                        ;849596|18      |      ;
    ADC.W #$0002                                               ;849597|690200  |      ;
    STA.B ptrAIActionData                                      ;84959A|85C9    |0000C9;
    SEP #$20                                                   ;84959C|E220    |      ;
    LDA.B [ptrAIActionData]                                    ;84959E|A7C9    |0000C9;
    SEP #$20                                                   ;8495A0|E220    |      ;
    REP #$10                                                   ;8495A2|C210    |      ;
    LDY.W #$0002                                               ;8495A4|A00200  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;8495A7|97CC    |0000CC;
    REP #$30                                                   ;8495A9|C230    |      ;
    LDA.B ptrAIActionData                                      ;8495AB|A5C9    |0000C9;
    CLC                                                        ;8495AD|18      |      ;
    ADC.W #$0001                                               ;8495AE|690100  |      ;
    STA.B ptrAIActionData                                      ;8495B1|85C9    |0000C9;
    SEP #$20                                                   ;8495B3|E220    |      ;
    REP #$10                                                   ;8495B5|C210    |      ;
    LDY.W #$0001                                               ;8495B7|A00100  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;8495BA|B7CC    |0000CC;
    ORA.B #$03                                                 ;8495BC|0903    |      ;
    SEP #$20                                                   ;8495BE|E220    |      ;
    REP #$10                                                   ;8495C0|C210    |      ;
    LDY.W #$0001                                               ;8495C2|A00100  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;8495C5|97CC    |0000CC;
    REP #$30                                                   ;8495C7|C230    |      ;
    LDY.W #$0033                                               ;8495C9|A03300  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;8495CC|B7CC    |0000CC;
    STA.B ptrUnknown0x72                                       ;8495CE|8572    |000072;
    SEP #$20                                                   ;8495D0|E220    |      ;
    LDA.B #$B3                                                 ;8495D2|A9B3    |      ;
    STA.B ptrUnknown0x72+2                                     ;8495D4|8574    |000074;
    JSL.L fAI_Unknown848895                                    ;8495D6|22958884|848895;
    REP #$30                                                   ;8495DA|C230    |      ;
    LDY.W #$0010                                               ;8495DC|A01000  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;8495DF|B7CC    |0000CC;
    CLC                                                        ;8495E1|18      |      ;
    ADC.W #$0001                                               ;8495E2|690100  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;8495E5|97CC    |0000CC;
    RTS                                                        ;8495E7|60      |      ;
 
 
fAIAction0x2C:
    REP #$30                                                   ;8495E8|C230    |      ;
    REP #$30                                                   ;8495EA|C230    |      ;
    LDA.B ptrAIActionData                                      ;8495EC|A5C9    |0000C9;
    CLC                                                        ;8495EE|18      |      ;
    ADC.W #$0001                                               ;8495EF|690100  |      ;
    STA.B ptrAIActionData                                      ;8495F2|85C9    |0000C9;
    SEP #$20                                                   ;8495F4|E220    |      ;
    LDA.B [ptrAIActionData]                                    ;8495F6|A7C9    |0000C9;
    PHA                                                        ;8495F8|48      |      ;
    REP #$30                                                   ;8495F9|C230    |      ;
    LDA.B ptrAIActionData                                      ;8495FB|A5C9    |0000C9;
    CLC                                                        ;8495FD|18      |      ;
    ADC.W #$0001                                               ;8495FE|690100  |      ;
    STA.B ptrAIActionData                                      ;849601|85C9    |0000C9;
    REP #$20                                                   ;849603|C220    |      ;
    LDA.B [ptrAIActionData]                                    ;849605|A7C9    |0000C9;
    PHA                                                        ;849607|48      |      ;
    REP #$30                                                   ;849608|C230    |      ;
    LDA.B ptrAIActionData                                      ;84960A|A5C9    |0000C9;
    CLC                                                        ;84960C|18      |      ;
    ADC.W #$0002                                               ;84960D|690200  |      ;
    STA.B ptrAIActionData                                      ;849610|85C9    |0000C9;
    REP #$20                                                   ;849612|C220    |      ;
    LDA.B [ptrAIActionData]                                    ;849614|A7C9    |0000C9;
    TAY                                                        ;849616|A8      |      ;
    PLX                                                        ;849617|FA      |      ;
    SEP #$20                                                   ;849618|E220    |      ;
    PLA                                                        ;84961A|68      |      ;
    JSL.L fAudioUnknown_8382FE                                 ;84961B|22FE8283|8382FE;
    SEP #$20                                                   ;84961F|E220    |      ;
    STZ.W $0119                                                ;849621|9C1901  |000119;
    JSL.L fToolUsed_SoundUnknown828FF3                         ;849624|22F38F82|828FF3;
    REP #$30                                                   ;849628|C230    |      ;
    LDA.B ptrAIActionData                                      ;84962A|A5C9    |0000C9;
    CLC                                                        ;84962C|18      |      ;
    ADC.W #$0002                                               ;84962D|690200  |      ;
    STA.B ptrAIActionData                                      ;849630|85C9    |0000C9;
    RTS                                                        ;849632|60      |      ;
 
 
fAIAction0x2D_ConditionalJump:
    REP #$30                                                   ;849633|C230    |      ;
    REP #$30                                                   ;849635|C230    |      ;
    LDA.B ptrAIActionData                                      ;849637|A5C9    |0000C9;
    CLC                                                        ;849639|18      |      ;
    ADC.W #$0001                                               ;84963A|690100  |      ;
    STA.B ptrAIActionData                                      ;84963D|85C9    |0000C9;
    SEP #$20                                                   ;84963F|E220    |      ;
    REP #$10                                                   ;849641|C210    |      ;
    LDY.W #$000C                                               ;849643|A00C00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;849646|B7CC    |0000CC;
    CMP.B #$00                                                 ;849648|C900    |      ;
    BNE +                                                      ;84964A|D003    |84964F;
    JMP.W .return                                              ;84964C|4C5F97  |84975F;
 
 
  + REP #$30                                                   ;84964F|C230    |      ;
    LDA.B nPlayerAction                                        ;849651|A5D4    |0000D4;
    CMP.W #$000A                                               ;849653|C90A00  |      ;
    BNE +                                                      ;849656|D003    |84965B;
    JMP.W .return                                              ;849658|4C5F97  |84975F;
 
 
  + REP #$30                                                   ;84965B|C230    |      ;
    LDA.B nPlayerAction                                        ;84965D|A5D4    |0000D4;
    CMP.W #$000C                                               ;84965F|C90C00  |      ;
    BNE +                                                      ;849662|D003    |849667;
    JMP.W .return                                              ;849664|4C5F97  |84975F;
 
 
  + REP #$30                                                   ;849667|C230    |      ;
    LDA.B nPlayerAction                                        ;849669|A5D4    |0000D4;
    CMP.W #$000D                                               ;84966B|C90D00  |      ;
    BNE +                                                      ;84966E|D003    |849673;
    JMP.W .return                                              ;849670|4C5F97  |84975F;
 
 
  + REP #$30                                                   ;849673|C230    |      ;
    LDA.B nPlayerAction                                        ;849675|A5D4    |0000D4;
    CMP.W #$001B                                               ;849677|C91B00  |      ;
    BNE +                                                      ;84967A|D003    |84967F;
    JMP.W .return                                              ;84967C|4C5F97  |84975F;
 
 
  + REP #$20                                                   ;84967F|C220    |      ;
    LDA.B strcPlayerFlags                                      ;849681|A5D2    |0000D2;
    AND.W #$0004                                               ;849683|290400  |      ;
    BEQ +                                                      ;849686|F003    |84968B;
    JMP.W .return                                              ;849688|4C5F97  |84975F;
 
 
  + LDA.L strcDailyFlags.flags4                                ;84968B|AF601F7F|7F1F60;
    AND.W #$0006                                               ;84968F|290600  |      ;
    BEQ +                                                      ;849692|F003    |849697;
    JMP.W .return                                              ;849694|4C5F97  |84975F;
 
 
  + REP #$20                                                   ;849697|C220    |      ;
    LDA.W strcJoypad1.newInput                                 ;849699|AD2801  |000128;
    BIT.W #$0080                                               ;84969C|898000  |      ;
    BNE +                                                      ;84969F|D003    |8496A4;
    JMP.W .return                                              ;8496A1|4C5F97  |84975F;
 
 
  + REP #$30                                                   ;8496A4|C230    |      ;
    LDA.B nPlayerAction                                        ;8496A6|A5D4    |0000D4;
    CMP.W #$0005                                               ;8496A8|C90500  |      ;
    BEQ +                                                      ;8496AB|F003    |8496B0;
    JMP.W .continue                                            ;8496AD|4CC496  |8496C4;
 
 
  + SEP #$20                                                   ;8496B0|E220    |      ;
    LDA.W $091D                                                ;8496B2|AD1D09  |00091D;
    BEQ .continue                                              ;8496B5|F00D    |8496C4;
    STA.W $091E                                                ;8496B7|8D1E09  |00091E;
    REP #$30                                                   ;8496BA|C230    |      ;
    LDA.B ptrAIActionData                                      ;8496BC|A5C9    |0000C9;
    CLC                                                        ;8496BE|18      |      ;
    ADC.W #$0002                                               ;8496BF|690200  |      ;
    STA.B ptrAIActionData                                      ;8496C2|85C9    |0000C9;
 
.continue:
    REP #$20                                                   ;8496C4|C220    |      ;
    LDA.B [ptrAIActionData]                                    ;8496C6|A7C9    |0000C9;
    STA.B ptrAIActionData                                      ;8496C8|85C9    |0000C9;
    SEP #$20                                                   ;8496CA|E220    |      ;
    REP #$10                                                   ;8496CC|C210    |      ;
    LDY.W #$0007                                               ;8496CE|A00700  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;8496D1|B7CC    |0000CC;
    SEP #$20                                                   ;8496D3|E220    |      ;
    REP #$10                                                   ;8496D5|C210    |      ;
    LDY.W #$0008                                               ;8496D7|A00800  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;8496DA|97CC    |0000CC;
    SEP #$20                                                   ;8496DC|E220    |      ;
    REP #$10                                                   ;8496DE|C210    |      ;
    LDY.W #$0003                                               ;8496E0|A00300  |      ;
    LDA.B #$00                                                 ;8496E3|A900    |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;8496E5|97CC    |0000CC;
    SEP #$20                                                   ;8496E7|E220    |      ;
    REP #$10                                                   ;8496E9|C210    |      ;
    LDY.W #$0004                                               ;8496EB|A00400  |      ;
    LDA.B #$00                                                 ;8496EE|A900    |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;8496F0|97CC    |0000CC;
    SEP #$20                                                   ;8496F2|E220    |      ;
    REP #$10                                                   ;8496F4|C210    |      ;
    LDY.W #$000C                                               ;8496F6|A00C00  |      ;
    LDA.B #$00                                                 ;8496F9|A900    |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;8496FB|97CC    |0000CC;
    REP #$20                                                   ;8496FD|C220    |      ;
    LDA.B nPlayerDirection                                     ;8496FF|A5DA    |0000DA;
    EOR.W #$0001                                               ;849701|490100  |      ;
    SEP #$20                                                   ;849704|E220    |      ;
    REP #$10                                                   ;849706|C210    |      ;
    LDY.W #$0002                                               ;849708|A00200  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84970B|97CC    |0000CC;
    REP #$30                                                   ;84970D|C230    |      ;
    LDY.W #$0033                                               ;84970F|A03300  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;849712|B7CC    |0000CC;
    STA.B ptrUnknown0x72                                       ;849714|8572    |000072;
    SEP #$20                                                   ;849716|E220    |      ;
    LDA.B #$B3                                                 ;849718|A9B3    |      ;
    STA.B ptrUnknown0x72+2                                     ;84971A|8574    |000074;
    JSL.L fAI_Unknown848895                                    ;84971C|22958884|848895;
    SEP #$20                                                   ;849720|E220    |      ;
    REP #$10                                                   ;849722|C210    |      ;
    LDY.W #$0001                                               ;849724|A00100  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;849727|B7CC    |0000CC;
    ORA.B #$14                                                 ;849729|0914    |      ;
    SEP #$20                                                   ;84972B|E220    |      ;
    REP #$10                                                   ;84972D|C210    |      ;
    LDY.W #$0001                                               ;84972F|A00100  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;849732|97CC    |0000CC;
    SEP #$20                                                   ;849734|E220    |      ;
    LDA.B #$56                                                 ;849736|A956    |      ;
    STA.W nPlayerInteractionIndex                              ;849738|8D6E09  |00096E;
    STZ.W nPlayerInteractionArg1                               ;84973B|9C6F09  |00096F;
    STZ.W nPlayerInteractionArg2                               ;84973E|9C7009  |000970;
    REP #$30                                                   ;849741|C230    |      ;
    LDA.B strcPlayerFlags                                      ;849743|A5D2    |0000D2;
    ORA.W #$0040                                               ;849745|094000  |      ;
    STA.B strcPlayerFlags                                      ;849748|85D2    |0000D2;
    REP #$30                                                   ;84974A|C230    |      ;
    LDA.W #$0000                                               ;84974C|A90000  |      ;
    STA.B nPlayerAction                                        ;84974F|85D4    |0000D4;
    REP #$30                                                   ;849751|C230    |      ;
    LDY.W #$0010                                               ;849753|A01000  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;849756|B7CC    |0000CC;
    CLC                                                        ;849758|18      |      ;
    ADC.W #$0001                                               ;849759|690100  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84975C|97CC    |0000CC;
    RTS                                                        ;84975E|60      |      ;
 
 
.return:
    REP #$30                                                   ;84975F|C230    |      ;
    LDA.B ptrAIActionData                                      ;849761|A5C9    |0000C9;
    CLC                                                        ;849763|18      |      ;
    ADC.W #$0004                                               ;849764|690400  |      ;
    STA.B ptrAIActionData                                      ;849767|85C9    |0000C9;
    REP #$30                                                   ;849769|C230    |      ;
    LDY.W #$0010                                               ;84976B|A01000  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84976E|B7CC    |0000CC;
    CLC                                                        ;849770|18      |      ;
    ADC.W #$0001                                               ;849771|690100  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;849774|97CC    |0000CC;
    RTS                                                        ;849776|60      |      ;
 
 
fAIAction0x2E:
    REP #$30                                                   ;849777|C230    |      ;
    REP #$30                                                   ;849779|C230    |      ;
    LDA.B ptrAIActionData                                      ;84977B|A5C9    |0000C9;
    CLC                                                        ;84977D|18      |      ;
    ADC.W #$0001                                               ;84977E|690100  |      ;
    STA.B ptrAIActionData                                      ;849781|85C9    |0000C9;
    SEP #$20                                                   ;849783|E220    |      ;
    LDA.B [ptrAIActionData]                                    ;849785|A7C9    |0000C9;
    SEP #$20                                                   ;849787|E220    |      ;
    REP #$10                                                   ;849789|C210    |      ;
    LDY.W #$000B                                               ;84978B|A00B00  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84978E|97CC    |0000CC;
    SEP #$20                                                   ;849790|E220    |      ;
    REP #$10                                                   ;849792|C210    |      ;
    LDY.W #$0005                                               ;849794|A00500  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;849797|97CC    |0000CC;
    SEP #$20                                                   ;849799|E220    |      ;
    REP #$10                                                   ;84979B|C210    |      ;
    LDY.W #$0006                                               ;84979D|A00600  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;8497A0|97CC    |0000CC;
    REP #$30                                                   ;8497A2|C230    |      ;
    LDA.B ptrAIActionData                                      ;8497A4|A5C9    |0000C9;
    CLC                                                        ;8497A6|18      |      ;
    ADC.W #$0001                                               ;8497A7|690100  |      ;
    STA.B ptrAIActionData                                      ;8497AA|85C9    |0000C9;
    LDA.B [ptrAIActionData]                                    ;8497AC|A7C9    |0000C9;
    REP #$30                                                   ;8497AE|C230    |      ;
    LDY.W #$0036                                               ;8497B0|A03600  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;8497B3|97CC    |0000CC;
    REP #$30                                                   ;8497B5|C230    |      ;
    LDA.B ptrAIActionData                                      ;8497B7|A5C9    |0000C9;
    CLC                                                        ;8497B9|18      |      ;
    ADC.W #$0002                                               ;8497BA|690200  |      ;
    STA.B ptrAIActionData                                      ;8497BD|85C9    |0000C9;
    SEP #$20                                                   ;8497BF|E220    |      ;
    LDA.B [ptrAIActionData]                                    ;8497C1|A7C9    |0000C9;
    SEP #$20                                                   ;8497C3|E220    |      ;
    REP #$10                                                   ;8497C5|C210    |      ;
    LDY.W #$0007                                               ;8497C7|A00700  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;8497CA|97CC    |0000CC;
    SEP #$20                                                   ;8497CC|E220    |      ;
    REP #$10                                                   ;8497CE|C210    |      ;
    LDY.W #$0008                                               ;8497D0|A00800  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;8497D3|97CC    |0000CC;
    REP #$30                                                   ;8497D5|C230    |      ;
    LDA.B ptrAIActionData                                      ;8497D7|A5C9    |0000C9;
    CLC                                                        ;8497D9|18      |      ;
    ADC.W #$0001                                               ;8497DA|690100  |      ;
    STA.B ptrAIActionData                                      ;8497DD|85C9    |0000C9;
    SEP #$20                                                   ;8497DF|E220    |      ;
    REP #$10                                                   ;8497E1|C210    |      ;
    LDY.W #$0001                                               ;8497E3|A00100  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;8497E6|B7CC    |0000CC;
    ORA.B #$A8                                                 ;8497E8|09A8    |      ;
    SEP #$20                                                   ;8497EA|E220    |      ;
    REP #$10                                                   ;8497EC|C210    |      ;
    LDY.W #$0001                                               ;8497EE|A00100  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;8497F1|97CC    |0000CC;
    REP #$30                                                   ;8497F3|C230    |      ;
    LDY.W #$001A                                               ;8497F5|A01A00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;8497F8|B7CC    |0000CC;
    REP #$30                                                   ;8497FA|C230    |      ;
    LDY.W #$001E                                               ;8497FC|A01E00  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;8497FF|97CC    |0000CC;
    REP #$30                                                   ;849801|C230    |      ;
    LDY.W #$001C                                               ;849803|A01C00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;849806|B7CC    |0000CC;
    REP #$30                                                   ;849808|C230    |      ;
    LDY.W #$0020                                               ;84980A|A02000  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84980D|97CC    |0000CC;
    RTS                                                        ;84980F|60      |      ;
 
 
fAIAction0x2F:
    REP #$30                                                   ;849810|C230    |      ;
    REP #$30                                                   ;849812|C230    |      ;
    LDA.B ptrAIActionData                                      ;849814|A5C9    |0000C9;
    CLC                                                        ;849816|18      |      ;
    ADC.W #$0001                                               ;849817|690100  |      ;
    STA.B ptrAIActionData                                      ;84981A|85C9    |0000C9;
    LDA.B [ptrAIActionData]                                    ;84981C|A7C9    |0000C9;
    REP #$30                                                   ;84981E|C230    |      ;
    LDY.W #$0033                                               ;849820|A03300  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;849823|97CC    |0000CC;
    REP #$30                                                   ;849825|C230    |      ;
    LDA.B ptrAIActionData                                      ;849827|A5C9    |0000C9;
    CLC                                                        ;849829|18      |      ;
    ADC.W #$0002                                               ;84982A|690200  |      ;
    STA.B ptrAIActionData                                      ;84982D|85C9    |0000C9;
    REP #$30                                                   ;84982F|C230    |      ;
    LDY.W #$0033                                               ;849831|A03300  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;849834|B7CC    |0000CC;
    STA.B ptrUnknown0x72                                       ;849836|8572    |000072;
    SEP #$20                                                   ;849838|E220    |      ;
    LDA.B #$B3                                                 ;84983A|A9B3    |      ;
    STA.B ptrUnknown0x72+2                                     ;84983C|8574    |000074;
    JSL.L fAI_Unknown848895                                    ;84983E|22958884|848895;
    SEP #$20                                                   ;849842|E220    |      ;
    REP #$10                                                   ;849844|C210    |      ;
    LDY.W #$0001                                               ;849846|A00100  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;849849|B7CC    |0000CC;
    ORA.B #$04                                                 ;84984B|0904    |      ;
    SEP #$20                                                   ;84984D|E220    |      ;
    REP #$10                                                   ;84984F|C210    |      ;
    LDY.W #$0001                                               ;849851|A00100  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;849854|97CC    |0000CC;
    RTS                                                        ;849856|60      |      ;
 
 
fAIAction0x30_UpdateChicken:
    REP #$30                                                   ;849857|C230    |      ;
    REP #$30                                                   ;849859|C230    |      ;
    LDA.B ptrAIActionData                                      ;84985B|A5C9    |0000C9;
    CLC                                                        ;84985D|18      |      ;
    ADC.W #$0001                                               ;84985E|690100  |      ;
    STA.B ptrAIActionData                                      ;849861|85C9    |0000C9;
    SEP #$20                                                   ;849863|E220    |      ;
    REP #$10                                                   ;849865|C210    |      ;
    LDY.W #$003F                                               ;849867|A03F00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84986A|B7CC    |0000CC;
    SEC                                                        ;84986C|38      |      ;
    SBC.B #$24                                                 ;84986D|E924    |      ;
    XBA                                                        ;84986F|EB      |      ;
    LDA.B #$00                                                 ;849870|A900    |      ;
    XBA                                                        ;849872|EB      |      ;
    REP #$20                                                   ;849873|C220    |      ;
    JSL.L fGameEngine_GetChickenData                           ;849875|2295C983|83C995;
    REP #$30                                                   ;849879|C230    |      ;
    LDY.W #$001A                                               ;84987B|A01A00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84987E|B7CC    |0000CC;
    LDY.W #$0004                                               ;849880|A00400  |      ;
    STA.B [ptrUnknown0x72],Y                                   ;849883|9772    |000072;
    REP #$30                                                   ;849885|C230    |      ;
    LDY.W #$001C                                               ;849887|A01C00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84988A|B7CC    |0000CC;
    LDY.W #$0006                                               ;84988C|A00600  |      ;
    STA.B [ptrUnknown0x72],Y                                   ;84988F|9772    |000072;
    SEP #$20                                                   ;849891|E220    |      ;
    REP #$10                                                   ;849893|C210    |      ;
    LDY.W #$000E                                               ;849895|A00E00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;849898|B7CC    |0000CC;
    CMP.B #$E0                                                 ;84989A|C9E0    |      ;
    BNE .loop                                                  ;84989C|D003    |8498A1;
    JMP.W .label3                                              ;84989E|4C4F9A  |849A4F;
 
 
.loop:
    SEP #$20                                                   ;8498A1|E220    |      ;
    REP #$10                                                   ;8498A3|C210    |      ;
    LDY.W #$000C                                               ;8498A5|A00C00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;8498A8|B7CC    |0000CC;
    CMP.B #$00                                                 ;8498AA|C900    |      ;
    BNE +                                                      ;8498AC|D003    |8498B1;
    JMP.W .label1                                              ;8498AE|4CC899  |8499C8;
 
 
  + REP #$20                                                   ;8498B1|C220    |      ;
    LDA.B nPlayerAction                                        ;8498B3|A5D4    |0000D4;
    CMP.W #$000A                                               ;8498B5|C90A00  |      ;
    BNE +                                                      ;8498B8|D003    |8498BD;
    JMP.W .label1                                              ;8498BA|4CC899  |8499C8;
 
 
  + CMP.W #$000C                                               ;8498BD|C90C00  |      ;
    BNE +                                                      ;8498C0|D003    |8498C5;
    JMP.W .label1                                              ;8498C2|4CC899  |8499C8;
 
 
  + CMP.W #$000D                                               ;8498C5|C90D00  |      ;
    BNE +                                                      ;8498C8|D003    |8498CD;
    JMP.W .label1                                              ;8498CA|4CC899  |8499C8;
 
 
  + CMP.W #$001B                                               ;8498CD|C91B00  |      ;
    BNE +                                                      ;8498D0|D003    |8498D5;
    JMP.W .label1                                              ;8498D2|4CC899  |8499C8;
 
 
  + LDA.B strcPlayerFlags                                      ;8498D5|A5D2    |0000D2;
    AND.W #$0004                                               ;8498D7|290400  |      ;
    BEQ +                                                      ;8498DA|F003    |8498DF;
    JMP.W .label1                                              ;8498DC|4CC899  |8499C8;
 
 
  + LDA.B strcPlayerFlags                                      ;8498DF|A5D2    |0000D2;
    AND.W #$0040                                               ;8498E1|294000  |      ;
    BEQ +                                                      ;8498E4|F003    |8498E9;
    JMP.W .label1                                              ;8498E6|4CC899  |8499C8;
 
 
  + LDA.L strcDailyFlags.flags4                                ;8498E9|AF601F7F|7F1F60;
    AND.W #$0006                                               ;8498ED|290600  |      ;
    BEQ +                                                      ;8498F0|F003    |8498F5;
    JMP.W .label1                                              ;8498F2|4CC899  |8499C8;
 
 
  + REP #$20                                                   ;8498F5|C220    |      ;
    LDA.W strcJoypad1.newInput                                 ;8498F7|AD2801  |000128;
    BIT.W #$0080                                               ;8498FA|898000  |      ;
    BNE +                                                      ;8498FD|D003    |849902;
    JMP.W .label1                                              ;8498FF|4CC899  |8499C8;
 
 
  + REP #$30                                                   ;849902|C230    |      ;
    LDA.B strcPlayerFlags                                      ;849904|A5D2    |0000D2;
    AND.W #$0800                                               ;849906|290008  |      ;
    BEQ +                                                      ;849909|F003    |84990E;
    JMP.W .label1                                              ;84990B|4CC899  |8499C8;
 
 
  + LDA.B nPlayerAction                                        ;84990E|A5D4    |0000D4;
    CMP.W #$0017                                               ;849910|C91700  |      ;
    BNE +                                                      ;849913|D003    |849918;
    JMP.W .label1                                              ;849915|4CC899  |8499C8;
 
 
  + LDA.B nPlayerAction                                        ;849918|A5D4    |0000D4;
    CMP.W #$0004                                               ;84991A|C90400  |      ;
    BNE +                                                      ;84991D|D003    |849922;
    JMP.W .label1                                              ;84991F|4CC899  |8499C8;
 
 
  + SEP #$20                                                   ;849922|E220    |      ;
    LDA.W $091D                                                ;849924|AD1D09  |00091D;
    BEQ +                                                      ;849927|F003    |84992C;
    JMP.W .label1                                              ;849929|4CC899  |8499C8;
 
 
  + SEP #$20                                                   ;84992C|E220    |      ;
    LDY.W #$0000                                               ;84992E|A00000  |      ;
    LDA.B [ptrUnknown0x72],Y                                   ;849931|B772    |000072;
    AND.B #$40                                                 ;849933|2940    |      ;
    BEQ +                                                      ;849935|F003    |84993A;
    JMP.W .label2                                              ;849937|4C419A  |849A41;
 
 
  + LDA.B [ptrUnknown0x72],Y                                   ;84993A|B772    |000072;
    AND.B #$0E                                                 ;84993C|290E    |      ;
    BNE +                                                      ;84993E|D003    |849943;
    JMP.W .label2                                              ;849940|4C419A  |849A41;
 
 
  + LDA.B [ptrUnknown0x72],Y                                   ;849943|B772    |000072;
    ORA.B #$20                                                 ;849945|0920    |      ;
    STA.B [ptrUnknown0x72],Y                                   ;849947|9772    |000072;
    SEP #$20                                                   ;849949|E220    |      ;
    REP #$10                                                   ;84994B|C210    |      ;
    LDY.W #$003F                                               ;84994D|A03F00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;849950|B7CC    |0000CC;
    STA.W $0920                                                ;849952|8D2009  |000920;
    SEP #$20                                                   ;849955|E220    |      ;
    REP #$10                                                   ;849957|C210    |      ;
    LDY.W #$0000                                               ;849959|A00000  |      ;
    LDA.B #$00                                                 ;84995C|A900    |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84995E|97CC    |0000CC;
    SEP #$20                                                   ;849960|E220    |      ;
    REP #$10                                                   ;849962|C210    |      ;
    LDY.W #$0001                                               ;849964|A00100  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;849967|B7CC    |0000CC;
    ORA.B #$40                                                 ;849969|0940    |      ;
    SEP #$20                                                   ;84996B|E220    |      ;
    REP #$10                                                   ;84996D|C210    |      ;
    LDY.W #$0001                                               ;84996F|A00100  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;849972|97CC    |0000CC;
    REP #$30                                                   ;849974|C230    |      ;
    LDY.W #$0010                                               ;849976|A01000  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;849979|B7CC    |0000CC;
    CLC                                                        ;84997B|18      |      ;
    ADC.W #$0001                                               ;84997C|690100  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84997F|97CC    |0000CC;
    SEP #$20                                                   ;849981|E220    |      ;
    REP #$10                                                   ;849983|C210    |      ;
    LDY.W #$003F                                               ;849985|A03F00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;849988|B7CC    |0000CC;
    CMP.B #$24                                                 ;84998A|C924    |      ;
    BCS +                                                      ;84998C|B003    |849991;
    JMP.W .label2                                              ;84998E|4C419A  |849A41;
 
 
  + SEP #$20                                                   ;849991|E220    |      ;
    LDY.W #$0000                                               ;849993|A00000  |      ;
    LDA.B [ptrUnknown0x72],Y                                   ;849996|B772    |000072;
    AND.B #$04                                                 ;849998|2904    |      ;
    BEQ +                                                      ;84999A|F00F    |8499AB;
    SEP #$20                                                   ;84999C|E220    |      ;
    LDA.B #$26                                                 ;84999E|A926    |      ;
    STA.W $091D                                                ;8499A0|8D1D09  |00091D;
    REP #$30                                                   ;8499A3|C230    |      ;
    LDA.W #$0004                                               ;8499A5|A90400  |      ;
    STA.B nPlayerAction                                        ;8499A8|85D4    |0000D4;
    RTS                                                        ;8499AA|60      |      ;
 
 
  + SEP #$20                                                   ;8499AB|E220    |      ;
    LDY.W #$0000                                               ;8499AD|A00000  |      ;
    LDA.B [ptrUnknown0x72],Y                                   ;8499B0|B772    |000072;
    AND.B #$08                                                 ;8499B2|2908    |      ;
    BNE +                                                      ;8499B4|D003    |8499B9;
    JMP.W .label2                                              ;8499B6|4C419A  |849A41;
 
 
  + SEP #$20                                                   ;8499B9|E220    |      ;
    LDA.B #$25                                                 ;8499BB|A925    |      ;
    STA.W $091D                                                ;8499BD|8D1D09  |00091D;
    REP #$30                                                   ;8499C0|C230    |      ;
    LDA.W #$0004                                               ;8499C2|A90400  |      ;
    STA.B nPlayerAction                                        ;8499C5|85D4    |0000D4;
    RTS                                                        ;8499C7|60      |      ;
 
 
.label1:
    SEP #$20                                                   ;8499C8|E220    |      ;
    REP #$10                                                   ;8499CA|C210    |      ;
    LDY.W #$0000                                               ;8499CC|A00000  |      ;
    LDA.B [ptrUnknown0x72],Y                                   ;8499CF|B772    |000072;
    AND.B #$08                                                 ;8499D1|2908    |      ;
    BEQ .label2                                                ;8499D3|F06C    |849A41;
    SEP #$20                                                   ;8499D5|E220    |      ;
    REP #$10                                                   ;8499D7|C210    |      ;
    LDY.W #$003F                                               ;8499D9|A03F00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;8499DC|B7CC    |0000CC;
    SEC                                                        ;8499DE|38      |      ;
    SBC.B #$24                                                 ;8499DF|E924    |      ;
    XBA                                                        ;8499E1|EB      |      ;
    LDA.B #$00                                                 ;8499E2|A900    |      ;
    XBA                                                        ;8499E4|EB      |      ;
    REP #$20                                                   ;8499E5|C220    |      ;
    ASL A                                                      ;8499E7|0A      |      ;
    TAX                                                        ;8499E8|AA      |      ;
    LDA.W $093B,X                                              ;8499E9|BD3B09  |00093B;
    CMP.W #$0200                                               ;8499EC|C90002  |      ;
    BEQ +                                                      ;8499EF|F007    |8499F8;
    INC A                                                      ;8499F1|1A      |      ;
    STA.W $093B,X                                              ;8499F2|9D3B09  |00093B;
    JMP.W .label2                                              ;8499F5|4C419A  |849A41;
 
 
  + REP #$30                                                   ;8499F8|C230    |      ;
    STZ.W $093B,X                                              ;8499FA|9E3B09  |00093B;
    SEP #$20                                                   ;8499FD|E220    |      ;
    LDA.B $DE                                                  ;8499FF|A5DE    |0000DE;
    CMP.B #$55                                                 ;849A01|C955    |      ;
    BCC +                                                      ;849A03|901E    |849A23;
    REP #$30                                                   ;849A05|C230    |      ;
    SEP #$20                                                   ;849A07|E220    |      ;
    REP #$10                                                   ;849A09|C210    |      ;
    LDY.W #$003F                                               ;849A0B|A03F00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;849A0E|B7CC    |0000CC;
    XBA                                                        ;849A10|EB      |      ;
    LDA.B #$00                                                 ;849A11|A900    |      ;
    XBA                                                        ;849A13|EB      |      ;
    REP #$20                                                   ;849A14|C220    |      ;
    LDX.W #$0000                                               ;849A16|A20000  |      ;
    LDY.W #$005D                                               ;849A19|A05D00  |      ;
    JSL.L fAI_Unknown84803F                                    ;849A1C|223F8084|84803F;
    JMP.W .label2                                              ;849A20|4C419A  |849A41;
 
 
  + REP #$30                                                   ;849A23|C230    |      ;
    SEP #$20                                                   ;849A25|E220    |      ;
    REP #$10                                                   ;849A27|C210    |      ;
    LDY.W #$003F                                               ;849A29|A03F00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;849A2C|B7CC    |0000CC;
    XBA                                                        ;849A2E|EB      |      ;
    LDA.B #$00                                                 ;849A2F|A900    |      ;
    XBA                                                        ;849A31|EB      |      ;
    REP #$20                                                   ;849A32|C220    |      ;
    LDX.W #$0000                                               ;849A34|A20000  |      ;
    LDY.W #$005C                                               ;849A37|A05C00  |      ;
    JSL.L fAI_Unknown84803F                                    ;849A3A|223F8084|84803F;
    JMP.W .label2                                              ;849A3E|4C419A  |849A41;
 
 
.label2:
    REP #$30                                                   ;849A41|C230    |      ;
    LDY.W #$0010                                               ;849A43|A01000  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;849A46|B7CC    |0000CC;
    CLC                                                        ;849A48|18      |      ;
    ADC.W #$0001                                               ;849A49|690100  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;849A4C|97CC    |0000CC;
    RTS                                                        ;849A4E|60      |      ;
 
 
.label3:
    SEP #$20                                                   ;849A4F|E220    |      ;
    REP #$10                                                   ;849A51|C210    |      ;
    LDY.W #$0000                                               ;849A53|A00000  |      ;
    LDA.B [ptrUnknown0x72],Y                                   ;849A56|B772    |000072;
    AND.B #$08                                                 ;849A58|2908    |      ;
    BNE +                                                      ;849A5A|D003    |849A5F;
    JMP.W .loop                                                ;849A5C|4CA198  |8498A1;
 
 
  + REP #$20                                                   ;849A5F|C220    |      ;
    LDA.L strcDailyFlags.flags1                                ;849A61|AF5A1F7F|7F1F5A;
    AND.W #$0008                                               ;849A65|290800  |      ;
    BNE +                                                      ;849A68|D003    |849A6D;
    JMP.W .loop                                                ;849A6A|4CA198  |8498A1;
 
 
  + LDA.L strcDailyFlags.flags1                                ;849A6D|AF5A1F7F|7F1F5A;
    AND.W #$FFF7                                               ;849A71|29F7FF  |      ;
    STA.L strcDailyFlags.flags1                                ;849A74|8F5A1F7F|7F1F5A;
    REP #$20                                                   ;849A78|C220    |      ;
    LDA.W #$0032                                               ;849A7A|A93200  |      ;
    STA.L nGameUnk7F1F15                                       ;849A7D|8F151F7F|7F1F15;
    SEP #$20                                                   ;849A81|E220    |      ;
    LDA.B #$00                                                 ;849A83|A900    |      ;
    STA.L nGameUnk7F1F15+2                                     ;849A85|8F171F7F|7F1F17;
    SEP #$20                                                   ;849A89|E220    |      ;
    REP #$10                                                   ;849A8B|C210    |      ;
    LDY.W #$003F                                               ;849A8D|A03F00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;849A90|B7CC    |0000CC;
    STA.W $09A1                                                ;849A92|8DA109  |0009A1;
    SEP #$20                                                   ;849A95|E220    |      ;
    LDA.B #$44                                                 ;849A97|A944    |      ;
    STA.W nPlayerInteractionIndex                              ;849A99|8D6E09  |00096E;
    STZ.W nPlayerInteractionArg1                               ;849A9C|9C6F09  |00096F;
    STZ.W nPlayerInteractionArg2                               ;849A9F|9C7009  |000970;
    REP #$30                                                   ;849AA2|C230    |      ;
    LDA.B strcPlayerFlags                                      ;849AA4|A5D2    |0000D2;
    ORA.W #$0040                                               ;849AA6|094000  |      ;
    STA.B strcPlayerFlags                                      ;849AA9|85D2    |0000D2;
    REP #$30                                                   ;849AAB|C230    |      ;
    LDA.W #$0000                                               ;849AAD|A90000  |      ;
    STA.B nPlayerAction                                        ;849AB0|85D4    |0000D4;
    SEP #$20                                                   ;849AB2|E220    |      ;
    REP #$10                                                   ;849AB4|C210    |      ;
    LDY.W #$000E                                               ;849AB6|A00E00  |      ;
    LDA.B #$00                                                 ;849AB9|A900    |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;849ABB|97CC    |0000CC;
    SEP #$20                                                   ;849ABD|E220    |      ;
    REP #$10                                                   ;849ABF|C210    |      ;
    LDY.W #$0001                                               ;849AC1|A00100  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;849AC4|B7CC    |0000CC;
    AND.B #$57                                                 ;849AC6|2957    |      ;
    SEP #$20                                                   ;849AC8|E220    |      ;
    REP #$10                                                   ;849ACA|C210    |      ;
    LDY.W #$0001                                               ;849ACC|A00100  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;849ACF|97CC    |0000CC;
    JMP.W .label2                                              ;849AD1|4C419A  |849A41;
 
 
fAIAction0x31_UpdateCow:
    REP #$30                                                   ;849AD4|C230    |      ; ANOTHER SPAGHETTI
    REP #$30                                                   ;849AD6|C230    |      ;
    LDA.B ptrAIActionData                                      ;849AD8|A5C9    |0000C9;
    CLC                                                        ;849ADA|18      |      ;
    ADC.W #$0001                                               ;849ADB|690100  |      ;
    STA.B ptrAIActionData                                      ;849ADE|85C9    |0000C9;
    SEP #$20                                                   ;849AE0|E220    |      ;
    REP #$10                                                   ;849AE2|C210    |      ;
    LDY.W #$003F                                               ;849AE4|A03F00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;849AE7|B7CC    |0000CC;
    SEC                                                        ;849AE9|38      |      ;
    SBC.B #$18                                                 ;849AEA|E918    |      ;
    XBA                                                        ;849AEC|EB      |      ;
    LDA.B #$00                                                 ;849AED|A900    |      ;
    XBA                                                        ;849AEF|EB      |      ;
    REP #$20                                                   ;849AF0|C220    |      ;
    JSL.L fGameEngine_GetCowData                               ;849AF2|22A7C983|83C9A7;
    REP #$30                                                   ;849AF6|C230    |      ;
    LDY.W #$001A                                               ;849AF8|A01A00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;849AFB|B7CC    |0000CC;
    LDY.W #$0008                                               ;849AFD|A00800  |      ;
    STA.B [ptrUnknown0x72],Y                                   ;849B00|9772    |000072;
    REP #$30                                                   ;849B02|C230    |      ;
    LDY.W #$001C                                               ;849B04|A01C00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;849B07|B7CC    |0000CC;
    LDY.W #$000A                                               ;849B09|A00A00  |      ;
    STA.B [ptrUnknown0x72],Y                                   ;849B0C|9772    |000072;
    SEP #$20                                                   ;849B0E|E220    |      ;
    LDA.B nMapEngine_DestinationId                             ;849B10|A522    |000022;
    CMP.B #$27                                                 ;849B12|C927    |      ;
    BNE CODE_849B26                                            ;849B14|D010    |849B26;
    SEP #$20                                                   ;849B16|E220    |      ;
    REP #$10                                                   ;849B18|C210    |      ;
    LDY.W #$000E                                               ;849B1A|A00E00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;849B1D|B7CC    |0000CC;
    CMP.B #$C2                                                 ;849B1F|C9C2    |      ;
    BNE CODE_849B26                                            ;849B21|D003    |849B26;
    JMP.W CODE_84A595                                          ;849B23|4C95A5  |84A595;
 
 
CODE_849B26:
    SEP #$20                                                   ;849B26|E220    |      ;
    LDA.B nMapEngine_DestinationId                             ;849B28|A522    |000022;
    CMP.B #$04                                                 ;849B2A|C904    |      ;
    BCS CODE_849B45                                            ;849B2C|B017    |849B45;
    SEP #$20                                                   ;849B2E|E220    |      ;
    REP #$10                                                   ;849B30|C210    |      ;
    LDY.W #$000E                                               ;849B32|A00E00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;849B35|B7CC    |0000CC;
    CMP.B #$E0                                                 ;849B37|C9E0    |      ;
    BNE CODE_849B3E                                            ;849B39|D003    |849B3E;
    JMP.W fAI_Unknwon84A498                                    ;849B3B|4C98A4  |84A498;
 
 
CODE_849B3E:
    CMP.B #$E1                                                 ;849B3E|C9E1    |      ;
    BNE CODE_849B45                                            ;849B40|D003    |849B45;
    JMP.W CODE_84A540                                          ;849B42|4C40A5  |84A540;
 
 
CODE_849B45:
    SEP #$20                                                   ;849B45|E220    |      ;
    REP #$10                                                   ;849B47|C210    |      ;
    LDY.W #$000C                                               ;849B49|A00C00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;849B4C|B7CC    |0000CC;
    CMP.B #$00                                                 ;849B4E|C900    |      ;
    BNE fAI_Unknown849B55                                      ;849B50|D003    |849B55;
    JMP.W CODE_84A0B9                                          ;849B52|4CB9A0  |84A0B9;
 
 
fAI_Unknown849B55:
    REP #$30                                                   ;849B55|C230    |      ;
    LDA.B nPlayerAction                                        ;849B57|A5D4    |0000D4;
    CMP.W #$000A                                               ;849B59|C90A00  |      ;
    BNE CODE_849B61                                            ;849B5C|D003    |849B61;
    JMP.W CODE_84A0B9                                          ;849B5E|4CB9A0  |84A0B9;
 
 
CODE_849B61:
    REP #$30                                                   ;849B61|C230    |      ;
    LDA.B nPlayerAction                                        ;849B63|A5D4    |0000D4;
    CMP.W #$000C                                               ;849B65|C90C00  |      ;
    BNE CODE_849B6D                                            ;849B68|D003    |849B6D;
    JMP.W CODE_84A0B9                                          ;849B6A|4CB9A0  |84A0B9;
 
 
CODE_849B6D:
    REP #$30                                                   ;849B6D|C230    |      ;
    LDA.B nPlayerAction                                        ;849B6F|A5D4    |0000D4;
    CMP.W #$000D                                               ;849B71|C90D00  |      ;
    BNE CODE_849B79                                            ;849B74|D003    |849B79;
    JMP.W CODE_84A0B9                                          ;849B76|4CB9A0  |84A0B9;
 
 
CODE_849B79:
    REP #$30                                                   ;849B79|C230    |      ;
    LDA.B nPlayerAction                                        ;849B7B|A5D4    |0000D4;
    CMP.W #$001B                                               ;849B7D|C91B00  |      ;
    BNE CODE_849B85                                            ;849B80|D003    |849B85;
    JMP.W CODE_84A0B9                                          ;849B82|4CB9A0  |84A0B9;
 
 
CODE_849B85:
    REP #$20                                                   ;849B85|C220    |      ;
    LDA.B strcPlayerFlags                                      ;849B87|A5D2    |0000D2;
    AND.W #$0004                                               ;849B89|290400  |      ;
    BEQ CODE_849B91                                            ;849B8C|F003    |849B91;
    JMP.W CODE_84A0B9                                          ;849B8E|4CB9A0  |84A0B9;
 
 
CODE_849B91:
    LDA.B strcPlayerFlags                                      ;849B91|A5D2    |0000D2;
    AND.W #$0040                                               ;849B93|294000  |      ;
    BEQ CODE_849B9B                                            ;849B96|F003    |849B9B;
    JMP.W CODE_84A0B9                                          ;849B98|4CB9A0  |84A0B9;
 
 
CODE_849B9B:
    LDA.L strcDailyFlags.flags4                                ;849B9B|AF601F7F|7F1F60;
    AND.W #$0006                                               ;849B9F|290600  |      ;
    BEQ fAI_Unknown849BA7                                      ;849BA2|F003    |849BA7;
    JMP.W CODE_84A0B9                                          ;849BA4|4CB9A0  |84A0B9;
 
 
fAI_Unknown849BA7:
    REP #$20                                                   ;849BA7|C220    |      ;
    LDA.W strcJoypad1.newInput                                 ;849BA9|AD2801  |000128;
    BIT.W #$0080                                               ;849BAC|898000  |      ;
    BNE fAI_Unknown849BEC                                      ;849BAF|D03B    |849BEC;
    SEP #$20                                                   ;849BB1|E220    |      ;
    LDY.W #$0000                                               ;849BB3|A00000  |      ;
    LDA.B [ptrUnknown0x72],Y                                   ;849BB6|B772    |000072;
    AND.B #$08                                                 ;849BB8|2908    |      ;
    BNE CODE_849BBF                                            ;849BBA|D003    |849BBF;
    JMP.W CODE_849BDB                                          ;849BBC|4CDB9B  |849BDB;
 
 
CODE_849BBF:
    REP #$20                                                   ;849BBF|C220    |      ;
    LDA.L strcDailyFlags.flags1                                ;849BC1|AF5A1F7F|7F1F5A;
    AND.W #$0100                                               ;849BC5|290001  |      ;
    BEQ CODE_849BCD                                            ;849BC8|F003    |849BCD;
    JMP.W CODE_849E4E                                          ;849BCA|4C4E9E  |849E4E;
 
 
CODE_849BCD:
    REP #$20                                                   ;849BCD|C220    |      ;
    LDA.L strcDailyFlags.flags1                                ;849BCF|AF5A1F7F|7F1F5A;
    AND.W #$0080                                               ;849BD3|298000  |      ;
    BEQ CODE_849BDB                                            ;849BD6|F003    |849BDB;
    JMP.W CODE_849FBC                                          ;849BD8|4CBC9F  |849FBC;
 
 
CODE_849BDB:
    REP #$20                                                   ;849BDB|C220    |      ;
    LDA.L strcDailyFlags.flags1                                ;849BDD|AF5A1F7F|7F1F5A;
    AND.W #$0040                                               ;849BE1|294000  |      ;
    BEQ CODE_849BE9                                            ;849BE4|F003    |849BE9;
    JMP.W fAI_Unknown849DBE                                    ;849BE6|4CBE9D  |849DBE;
 
 
CODE_849BE9:
    JMP.W CODE_84A0B9                                          ;849BE9|4CB9A0  |84A0B9;
 
 
fAI_Unknown849BEC:
    SEP #$20                                                   ;849BEC|E220    |      ;
    REP #$10                                                   ;849BEE|C210    |      ;
    LDA.B #$00                                                 ;849BF0|A900    |      ;
    XBA                                                        ;849BF2|EB      |      ;
    LDY.W #$000C                                               ;849BF3|A00C00  |      ;
    LDA.B [ptrUnknown0x72],Y                                   ;849BF6|B772    |000072;
    REP #$20                                                   ;849BF8|C220    |      ;
    STA.W $0889                                                ;849BFA|8D8908  |000889;
    SEP #$20                                                   ;849BFD|E220    |      ;
    LDY.W #$000D                                               ;849BFF|A00D00  |      ;
    LDA.B [ptrUnknown0x72],Y                                   ;849C02|B772    |000072;
    REP #$20                                                   ;849C04|C220    |      ;
    STA.W $088B                                                ;849C06|8D8B08  |00088B;
    SEP #$20                                                   ;849C09|E220    |      ;
    LDY.W #$000E                                               ;849C0B|A00E00  |      ;
    LDA.B [ptrUnknown0x72],Y                                   ;849C0E|B772    |000072;
    REP #$20                                                   ;849C10|C220    |      ;
    STA.W $088D                                                ;849C12|8D8D08  |00088D;
    SEP #$20                                                   ;849C15|E220    |      ;
    LDY.W #$000F                                               ;849C17|A00F00  |      ;
    LDA.B [ptrUnknown0x72],Y                                   ;849C1A|B772    |000072;
    REP #$20                                                   ;849C1C|C220    |      ;
    STA.W $088F                                                ;849C1E|8D8F08  |00088F;
    SEP #$20                                                   ;849C21|E220    |      ;
    LDY.W #$0000                                               ;849C23|A00000  |      ;
    LDA.B [ptrUnknown0x72],Y                                   ;849C26|B772    |000072;
    AND.B #$40                                                 ;849C28|2940    |      ;
    BNE CODE_849C4D                                            ;849C2A|D021    |849C4D;
    LDA.B [ptrUnknown0x72],Y                                   ;849C2C|B772    |000072;
    AND.B #$20                                                 ;849C2E|2920    |      ;
    BNE CODE_849C46                                            ;849C30|D014    |849C46;
    LDA.B [ptrUnknown0x72],Y                                   ;849C32|B772    |000072;
    AND.B #$10                                                 ;849C34|2910    |      ;
    BNE CODE_849C3F                                            ;849C36|D007    |849C3F;
    REP #$30                                                   ;849C38|C230    |      ;
    LDX.W #$002F                                               ;849C3A|A22F00  |      ;
    BRA CODE_849C64                                            ;849C3D|8025    |849C64;
 
 
CODE_849C3F:
    REP #$30                                                   ;849C3F|C230    |      ;
    LDX.W #$0030                                               ;849C41|A23000  |      ;
    BRA CODE_849C64                                            ;849C44|801E    |849C64;
 
 
CODE_849C46:
    REP #$30                                                   ;849C46|C230    |      ;
    LDX.W #$0031                                               ;849C48|A23100  |      ;
    BRA CODE_849C64                                            ;849C4B|8017    |849C64;
 
 
CODE_849C4D:
    SEP #$20                                                   ;849C4D|E220    |      ;
    REP #$10                                                   ;849C4F|C210    |      ;
    LDY.W #$0003                                               ;849C51|A00300  |      ;
    LDA.B [ptrUnknown0x72],Y                                   ;849C54|B772    |000072;
    BEQ CODE_849C5D                                            ;849C56|F005    |849C5D;
    LDX.W #$0032                                               ;849C58|A23200  |      ;
    BRA CODE_849C64                                            ;849C5B|8007    |849C64;
 
 
CODE_849C5D:
    REP #$30                                                   ;849C5D|C230    |      ;
    LDX.W #$0145                                               ;849C5F|A24501  |      ;
    BRA CODE_849C64                                            ;849C62|8000    |849C64;
 
 
CODE_849C64:
    SEP #$20                                                   ;849C64|E220    |      ;
    REP #$10                                                   ;849C66|C210    |      ;
    LDA.B #$00                                                 ;849C68|A900    |      ;
    STA.W $0191                                                ;849C6A|8D9101  |000191;
    LDA.B #$02                                                 ;849C6D|A902    |      ;
    STA.W $019A                                                ;849C6F|8D9A01  |00019A;
    JSL.L fDialog_DialogHandler                                ;849C72|225F9383|83935F;
    SEP #$20                                                   ;849C76|E220    |      ;
    REP #$10                                                   ;849C78|C210    |      ;
    LDY.W #$0001                                               ;849C7A|A00100  |      ;
    LDA.B [ptrUnknown0x72],Y                                   ;849C7D|B772    |000072;
    AND.B #$04                                                 ;849C7F|2904    |      ;
    BEQ CODE_849C86                                            ;849C81|F003    |849C86;
    JMP.W CODE_84A0B9                                          ;849C83|4CB9A0  |84A0B9;
 
 
CODE_849C86:
    LDY.W #$0001                                               ;849C86|A00100  |      ;
    LDA.B [ptrUnknown0x72],Y                                   ;849C89|B772    |000072;
    ORA.B #$04                                                 ;849C8B|0904    |      ;
    STA.B [ptrUnknown0x72],Y                                   ;849C8D|9772    |000072;
    REP #$20                                                   ;849C8F|C220    |      ;
    LDA.W #$0001                                               ;849C91|A90100  |      ;
    JSL.L fAI_Unknown84A5D4                                    ;849C94|22D4A584|84A5D4;
    SEP #$20                                                   ;849C98|E220    |      ;
    REP #$10                                                   ;849C9A|C210    |      ;
    LDY.W #$0000                                               ;849C9C|A00000  |      ;
    LDA.B [ptrUnknown0x72],Y                                   ;849C9F|B772    |000072;
    AND.B #$30                                                 ;849CA1|2930    |      ;
    BEQ CODE_849CA8                                            ;849CA3|F003    |849CA8;
    JMP.W CODE_84A0B9                                          ;849CA5|4CB9A0  |84A0B9;
 
 
CODE_849CA8:
    SEP #$20                                                   ;849CA8|E220    |      ;
    LDY.W #$0000                                               ;849CAA|A00000  |      ;
    LDA.B [ptrUnknown0x72],Y                                   ;849CAD|B772    |000072;
    AND.B #$02                                                 ;849CAF|2902    |      ;
    BEQ CODE_849CB6                                            ;849CB1|F003    |849CB6;
    JMP.W CODE_849CCE                                          ;849CB3|4CCE9C  |849CCE;
 
 
CODE_849CB6:
    LDA.B [ptrUnknown0x72],Y                                   ;849CB6|B772    |000072;
    AND.B #$04                                                 ;849CB8|2904    |      ;
    BEQ CODE_849CBF                                            ;849CBA|F003    |849CBF;
    JMP.W CODE_849D46                                          ;849CBC|4C469D  |849D46;
 
 
CODE_849CBF:
    LDY.W #$0000                                               ;849CBF|A00000  |      ;
    LDA.B [ptrUnknown0x72],Y                                   ;849CC2|B772    |000072;
    AND.B #$40                                                 ;849CC4|2940    |      ;
    BEQ CODE_849CCB                                            ;849CC6|F003    |849CCB;
    JMP.W CODE_84A044                                          ;849CC8|4C44A0  |84A044;
 
 
CODE_849CCB:
    JMP.W CODE_849FD0                                          ;849CCB|4CD09F  |849FD0;
 
 
CODE_849CCE:
    SEP #$20                                                   ;849CCE|E220    |      ;
    REP #$10                                                   ;849CD0|C210    |      ;
    LDY.W #$0002                                               ;849CD2|A00200  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;849CD5|B7CC    |0000CC;
    CMP.B #$00                                                 ;849CD7|C900    |      ;
    BEQ CODE_849CE7                                            ;849CD9|F00C    |849CE7;
    CMP.B #$01                                                 ;849CDB|C901    |      ;
    BEQ CODE_849CFD                                            ;849CDD|F01E    |849CFD;
    CMP.B #$02                                                 ;849CDF|C902    |      ;
    BEQ CODE_849D13                                            ;849CE1|F030    |849D13;
    CMP.B #$03                                                 ;849CE3|C903    |      ;
    BEQ CODE_849D29                                            ;849CE5|F042    |849D29;
 
CODE_849CE7:
    REP #$20                                                   ;849CE7|C220    |      ;
    LDA.W #$0000                                               ;849CE9|A90000  |      ;
    SEP #$20                                                   ;849CEC|E220    |      ;
    REP #$10                                                   ;849CEE|C210    |      ;
    LDY.W #$003F                                               ;849CF0|A03F00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;849CF3|B7CC    |0000CC;
    LDX.W #$0000                                               ;849CF5|A20000  |      ;
    LDY.W #$0064                                               ;849CF8|A06400  |      ;
    BRA CODE_849D3F                                            ;849CFB|8042    |849D3F;
 
 
CODE_849CFD:
    REP #$20                                                   ;849CFD|C220    |      ;
    LDA.W #$0000                                               ;849CFF|A90000  |      ;
    SEP #$20                                                   ;849D02|E220    |      ;
    REP #$10                                                   ;849D04|C210    |      ;
    LDY.W #$003F                                               ;849D06|A03F00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;849D09|B7CC    |0000CC;
    LDX.W #$0000                                               ;849D0B|A20000  |      ;
    LDY.W #$0065                                               ;849D0E|A06500  |      ;
    BRA CODE_849D3F                                            ;849D11|802C    |849D3F;
 
 
CODE_849D13:
    REP #$20                                                   ;849D13|C220    |      ;
    LDA.W #$0000                                               ;849D15|A90000  |      ;
    SEP #$20                                                   ;849D18|E220    |      ;
    REP #$10                                                   ;849D1A|C210    |      ;
    LDY.W #$003F                                               ;849D1C|A03F00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;849D1F|B7CC    |0000CC;
    LDX.W #$0000                                               ;849D21|A20000  |      ;
    LDY.W #$0066                                               ;849D24|A06600  |      ;
    BRA CODE_849D3F                                            ;849D27|8016    |849D3F;
 
 
CODE_849D29:
    REP #$20                                                   ;849D29|C220    |      ;
    LDA.W #$0000                                               ;849D2B|A90000  |      ;
    SEP #$20                                                   ;849D2E|E220    |      ;
    REP #$10                                                   ;849D30|C210    |      ;
    LDY.W #$003F                                               ;849D32|A03F00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;849D35|B7CC    |0000CC;
    LDX.W #$0000                                               ;849D37|A20000  |      ;
    LDY.W #$0067                                               ;849D3A|A06700  |      ;
    BRA CODE_849D3F                                            ;849D3D|8000    |849D3F;
 
 
CODE_849D3F:
    JSL.L fAI_Unknown84803F                                    ;849D3F|223F8084|84803F;
    JMP.W fAI_Unknown84A46E                                    ;849D43|4C6EA4  |84A46E;
 
 
CODE_849D46:
    SEP #$20                                                   ;849D46|E220    |      ;
    REP #$10                                                   ;849D48|C210    |      ;
    LDY.W #$0002                                               ;849D4A|A00200  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;849D4D|B7CC    |0000CC;
    CMP.B #$00                                                 ;849D4F|C900    |      ;
    BEQ CODE_849D5F                                            ;849D51|F00C    |849D5F;
    CMP.B #$01                                                 ;849D53|C901    |      ;
    BEQ CODE_849D75                                            ;849D55|F01E    |849D75;
    CMP.B #$02                                                 ;849D57|C902    |      ;
    BEQ CODE_849D8B                                            ;849D59|F030    |849D8B;
    CMP.B #$03                                                 ;849D5B|C903    |      ;
    BEQ CODE_849DA1                                            ;849D5D|F042    |849DA1;
 
CODE_849D5F:
    REP #$20                                                   ;849D5F|C220    |      ;
    LDA.W #$0000                                               ;849D61|A90000  |      ;
    SEP #$20                                                   ;849D64|E220    |      ;
    REP #$10                                                   ;849D66|C210    |      ;
    LDY.W #$003F                                               ;849D68|A03F00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;849D6B|B7CC    |0000CC;
    LDX.W #$0000                                               ;849D6D|A20000  |      ;
    LDY.W #$0060                                               ;849D70|A06000  |      ;
    BRA CODE_849DB7                                            ;849D73|8042    |849DB7;
 
 
CODE_849D75:
    REP #$20                                                   ;849D75|C220    |      ;
    LDA.W #$0000                                               ;849D77|A90000  |      ;
    SEP #$20                                                   ;849D7A|E220    |      ;
    REP #$10                                                   ;849D7C|C210    |      ;
    LDY.W #$003F                                               ;849D7E|A03F00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;849D81|B7CC    |0000CC;
    LDX.W #$0000                                               ;849D83|A20000  |      ;
    LDY.W #$0061                                               ;849D86|A06100  |      ;
    BRA CODE_849DB7                                            ;849D89|802C    |849DB7;
 
 
CODE_849D8B:
    REP #$20                                                   ;849D8B|C220    |      ;
    LDA.W #$0000                                               ;849D8D|A90000  |      ;
    SEP #$20                                                   ;849D90|E220    |      ;
    REP #$10                                                   ;849D92|C210    |      ;
    LDY.W #$003F                                               ;849D94|A03F00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;849D97|B7CC    |0000CC;
    LDX.W #$0000                                               ;849D99|A20000  |      ;
    LDY.W #$0062                                               ;849D9C|A06200  |      ;
    BRA CODE_849DB7                                            ;849D9F|8016    |849DB7;
 
 
CODE_849DA1:
    REP #$20                                                   ;849DA1|C220    |      ;
    LDA.W #$0000                                               ;849DA3|A90000  |      ;
    SEP #$20                                                   ;849DA6|E220    |      ;
    REP #$10                                                   ;849DA8|C210    |      ;
    LDY.W #$003F                                               ;849DAA|A03F00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;849DAD|B7CC    |0000CC;
    LDX.W #$0000                                               ;849DAF|A20000  |      ;
    LDY.W #$0063                                               ;849DB2|A06300  |      ;
    BRA CODE_849DB7                                            ;849DB5|8000    |849DB7;
 
 
CODE_849DB7:
    JSL.L fAI_Unknown84803F                                    ;849DB7|223F8084|84803F;
    JMP.W fAI_Unknown84A46E                                    ;849DBB|4C6EA4  |84A46E;
 
 
fAI_Unknown849DBE:
    SEP #$20                                                   ;849DBE|E220    |      ;
    REP #$10                                                   ;849DC0|C210    |      ;
    LDA.W nToolEquipped                                        ;849DC2|AD2109  |000921;
    BNE CODE_849DCA                                            ;849DC5|D003    |849DCA;
    JMP.W CODE_84A0B9                                          ;849DC7|4CB9A0  |84A0B9;
 
 
CODE_849DCA:
    CMP.B #$05                                                 ;849DCA|C905    |      ;
    BCS CODE_849DD1                                            ;849DCC|B003    |849DD1;
    JMP.W CODE_849F04                                          ;849DCE|4C049F  |849F04;
 
 
CODE_849DD1:
    CMP.B #$0E                                                 ;849DD1|C90E    |      ;
    BEQ CODE_849DED                                            ;849DD3|F018    |849DED;
    CMP.B #$0F                                                 ;849DD5|C90F    |      ;
    BNE CODE_849DDC                                            ;849DD7|D003    |849DDC;
    JMP.W CODE_849EAE                                          ;849DD9|4CAE9E  |849EAE;
 
 
CODE_849DDC:
    CMP.B #$11                                                 ;849DDC|C911    |      ;
    BCS CODE_849DE3                                            ;849DDE|B003    |849DE3;
    JMP.W CODE_84A0B9                                          ;849DE0|4CB9A0  |84A0B9;
 
 
CODE_849DE3:
    CMP.B #$15                                                 ;849DE3|C915    |      ;
    BCS CODE_849DEA                                            ;849DE5|B003    |849DEA;
    JMP.W CODE_849F04                                          ;849DE7|4C049F  |849F04;
 
 
CODE_849DEA:
    JMP.W CODE_84A0B9                                          ;849DEA|4CB9A0  |84A0B9;
 
 
CODE_849DED:
    SEP #$20                                                   ;849DED|E220    |      ;
    LDY.W #$0000                                               ;849DEF|A00000  |      ;
    LDA.B [ptrUnknown0x72],Y                                   ;849DF2|B772    |000072;
    AND.B #$08                                                 ;849DF4|2908    |      ;
    BNE CODE_849DFB                                            ;849DF6|D003    |849DFB;
    JMP.W CODE_84A0B9                                          ;849DF8|4CB9A0  |84A0B9;
 
 
CODE_849DFB:
    SEP #$20                                                   ;849DFB|E220    |      ;
    REP #$10                                                   ;849DFD|C210    |      ;
    LDY.W #$0001                                               ;849DFF|A00100  |      ;
    LDA.B [ptrUnknown0x72],Y                                   ;849E02|B772    |000072;
    AND.B #$02                                                 ;849E04|2902    |      ;
    BEQ CODE_849E0B                                            ;849E06|F003    |849E0B;
    JMP.W CODE_84A0B9                                          ;849E08|4CB9A0  |84A0B9;
 
 
CODE_849E0B:
    LDY.W #$0000                                               ;849E0B|A00000  |      ;
    LDA.B [ptrUnknown0x72],Y                                   ;849E0E|B772    |000072;
    AND.B #$70                                                 ;849E10|2970    |      ;
    BEQ CODE_849E17                                            ;849E12|F003    |849E17;
    JMP.W CODE_84A0B9                                          ;849E14|4CB9A0  |84A0B9;
 
 
CODE_849E17:
    LDY.W #$0001                                               ;849E17|A00100  |      ;
    LDA.B [ptrUnknown0x72],Y                                   ;849E1A|B772    |000072;
    ORA.B #$02                                                 ;849E1C|0902    |      ;
    STA.B [ptrUnknown0x72],Y                                   ;849E1E|9772    |000072;
    SEP #$20                                                   ;849E20|E220    |      ;
    LDA.B #$15                                                 ;849E22|A915    |      ;
    STA.W $091D                                                ;849E24|8D1D09  |00091D;
    LDY.W #$0004                                               ;849E27|A00400  |      ;
    LDA.B [ptrUnknown0x72],Y                                   ;849E2A|B772    |000072;
    CMP.B #$60                                                 ;849E2C|C960    |      ;
    BCC CODE_849E44                                            ;849E2E|9014    |849E44;
    CMP.B #$C0                                                 ;849E30|C9C0    |      ;
    BCC CODE_849E3D                                            ;849E32|9009    |849E3D;
    SEP #$20                                                   ;849E34|E220    |      ;
    LDA.B #$17                                                 ;849E36|A917    |      ;
    STA.W $091D                                                ;849E38|8D1D09  |00091D;
    BRA CODE_849E44                                            ;849E3B|8007    |849E44;
 
 
CODE_849E3D:
    SEP #$20                                                   ;849E3D|E220    |      ;
    LDA.B #$16                                                 ;849E3F|A916    |      ;
    STA.W $091D                                                ;849E41|8D1D09  |00091D;
 
CODE_849E44:
    REP #$30                                                   ;849E44|C230    |      ;
    LDA.W #$0004                                               ;849E46|A90400  |      ;
    STA.B nPlayerAction                                        ;849E49|85D4    |0000D4;
    JMP.W CODE_849FD0                                          ;849E4B|4CD09F  |849FD0;
 
 
CODE_849E4E:
    REP #$30                                                   ;849E4E|C230    |      ;
    LDA.L strcEventFlags.flags1                                ;849E50|AF641F7F|7F1F64;
    AND.W #$0004                                               ;849E54|290400  |      ;
    BEQ CODE_849E5C                                            ;849E57|F003    |849E5C;
    JMP.W CODE_84A0B9                                          ;849E59|4CB9A0  |84A0B9;
 
 
CODE_849E5C:
    SEP #$20                                                   ;849E5C|E220    |      ;
    LDA.L nOwnedCows                                           ;849E5E|AF0A1F7F|7F1F0A;
    CMP.B #$0C                                                 ;849E62|C90C    |      ;
    BNE CODE_849E69                                            ;849E64|D003    |849E69;
    JMP.W CODE_84A0B9                                          ;849E66|4CB9A0  |84A0B9;
 
 
CODE_849E69:
    REP #$20                                                   ;849E69|C220    |      ;
    LDA.L strcEventFlags.flags1                                ;849E6B|AF641F7F|7F1F64;
    ORA.W #$0004                                               ;849E6F|090400  |      ;
    STA.L strcEventFlags.flags1                                ;849E72|8F641F7F|7F1F64;
    SEP #$20                                                   ;849E76|E220    |      ;
    LDY.W #$0000                                               ;849E78|A00000  |      ;
    LDA.B [ptrUnknown0x72],Y                                   ;849E7B|B772    |000072;
    AND.B #$CF                                                 ;849E7D|29CF    |      ;
    STA.B [ptrUnknown0x72],Y                                   ;849E7F|9772    |000072;
    LDY.W #$0001                                               ;849E81|A00100  |      ;
    LDA.B [ptrUnknown0x72],Y                                   ;849E84|B772    |000072;
    ORA.B #$80                                                 ;849E86|0980    |      ;
    STA.B [ptrUnknown0x72],Y                                   ;849E88|9772    |000072;
    REP #$20                                                   ;849E8A|C220    |      ;
    LDA.W #$000A                                               ;849E8C|A90A00  |      ;
    JSL.L fAI_Unknown84A5D4                                    ;849E8F|22D4A584|84A5D4;
    SEP #$20                                                   ;849E93|E220    |      ;
    LDY.W #$0003                                               ;849E95|A00300  |      ;
    LDA.B #$15                                                 ;849E98|A915    |      ;
    STA.B [ptrUnknown0x72],Y                                   ;849E9A|9772    |000072;
    STA.L nCowPregnacyDays                                     ;849E9C|8F121F7F|7F1F12;
    SEP #$20                                                   ;849EA0|E220    |      ;
    LDA.L nOwnedCows                                           ;849EA2|AF0A1F7F|7F1F0A;
    INC A                                                      ;849EA6|1A      |      ;
    STA.L nOwnedCows                                           ;849EA7|8F0A1F7F|7F1F0A;
    JMP.W CODE_849FD0                                          ;849EAB|4CD09F  |849FD0;
 
 
CODE_849EAE:
    SEP #$20                                                   ;849EAE|E220    |      ;
    REP #$10                                                   ;849EB0|C210    |      ;
    LDY.W #$0001                                               ;849EB2|A00100  |      ;
    LDA.B [ptrUnknown0x72],Y                                   ;849EB5|B772    |000072;
    AND.B #$01                                                 ;849EB7|2901    |      ;
    BEQ CODE_849EBE                                            ;849EB9|F003    |849EBE;
    JMP.W CODE_84A0B9                                          ;849EBB|4CB9A0  |84A0B9;
 
 
CODE_849EBE:
    LDY.W #$0001                                               ;849EBE|A00100  |      ;
    LDA.B [ptrUnknown0x72],Y                                   ;849EC1|B772    |000072;
    ORA.B #$01                                                 ;849EC3|0901    |      ;
    STA.B [ptrUnknown0x72],Y                                   ;849EC5|9772    |000072;
    REP #$20                                                   ;849EC7|C220    |      ;
    LDA.W #$0003                                               ;849EC9|A90300  |      ;
    JSL.L fAI_Unknown84A5D4                                    ;849ECC|22D4A584|84A5D4;
    SEP #$20                                                   ;849ED0|E220    |      ;
    REP #$10                                                   ;849ED2|C210    |      ;
    LDY.W #$0000                                               ;849ED4|A00000  |      ;
    LDA.B [ptrUnknown0x72],Y                                   ;849ED7|B772    |000072;
    AND.B #$30                                                 ;849ED9|2930    |      ;
    BEQ CODE_849EE0                                            ;849EDB|F003    |849EE0;
    JMP.W CODE_84A0B9                                          ;849EDD|4CB9A0  |84A0B9;
 
 
CODE_849EE0:
    LDY.W #$0000                                               ;849EE0|A00000  |      ;
    LDA.B [ptrUnknown0x72],Y                                   ;849EE3|B772    |000072;
    AND.B #$02                                                 ;849EE5|2902    |      ;
    BEQ CODE_849EEC                                            ;849EE7|F003    |849EEC;
    JMP.W CODE_849CCE                                          ;849EE9|4CCE9C  |849CCE;
 
 
CODE_849EEC:
    LDA.B [ptrUnknown0x72],Y                                   ;849EEC|B772    |000072;
    AND.B #$04                                                 ;849EEE|2904    |      ;
    BEQ CODE_849EF5                                            ;849EF0|F003    |849EF5;
    JMP.W CODE_849D46                                          ;849EF2|4C469D  |849D46;
 
 
CODE_849EF5:
    LDY.W #$0000                                               ;849EF5|A00000  |      ;
    LDA.B [ptrUnknown0x72],Y                                   ;849EF8|B772    |000072;
    AND.B #$40                                                 ;849EFA|2940    |      ;
    BEQ CODE_849F01                                            ;849EFC|F003    |849F01;
    JMP.W CODE_84A044                                          ;849EFE|4C44A0  |84A044;
 
 
CODE_849F01:
    JMP.W CODE_849FD0                                          ;849F01|4CD09F  |849FD0;
 
 
CODE_849F04:
    SEP #$20                                                   ;849F04|E220    |      ;
    LDY.W #$0000                                               ;849F06|A00000  |      ;
    LDA.B [ptrUnknown0x72],Y                                   ;849F09|B772    |000072;
    AND.B #$08                                                 ;849F0B|2908    |      ;
    BEQ CODE_849F12                                            ;849F0D|F003    |849F12;
    JMP.W CODE_849F24                                          ;849F0F|4C249F  |849F24;
 
 
CODE_849F12:
    LDA.B [ptrUnknown0x72],Y                                   ;849F12|B772    |000072;
    AND.B #$04                                                 ;849F14|2904    |      ;
    BEQ CODE_849F1B                                            ;849F16|F003    |849F1B;
    JMP.W CODE_849F43                                          ;849F18|4C439F  |849F43;
 
 
CODE_849F1B:
    LDA.B [ptrUnknown0x72],Y                                   ;849F1B|B772    |000072;
    AND.B #$02                                                 ;849F1D|2902    |      ;
    BEQ CODE_849F24                                            ;849F1F|F003    |849F24;
    JMP.W CODE_849F62                                          ;849F21|4C629F  |849F62;
 
 
CODE_849F24:
    REP #$30                                                   ;849F24|C230    |      ;
    LDA.W #$000A                                               ;849F26|A90A00  |      ;
    STA.B n16TempVar1                                          ;849F29|857E    |00007E;
    SEP #$20                                                   ;849F2B|E220    |      ;
    REP #$10                                                   ;849F2D|C210    |      ;
    LDY.W #$0002                                               ;849F2F|A00200  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;849F32|B7CC    |0000CC;
    BEQ CODE_849F81                                            ;849F34|F04B    |849F81;
    CMP.B #$02                                                 ;849F36|C902    |      ;
    BEQ CODE_849F81                                            ;849F38|F047    |849F81;
    REP #$20                                                   ;849F3A|C220    |      ;
    LDA.W #$000B                                               ;849F3C|A90B00  |      ;
    STA.B n16TempVar1                                          ;849F3F|857E    |00007E;
    BRA CODE_849F81                                            ;849F41|803E    |849F81;
 
 
CODE_849F43:
    REP #$30                                                   ;849F43|C230    |      ;
    LDA.W #$0068                                               ;849F45|A96800  |      ;
    STA.B n16TempVar1                                          ;849F48|857E    |00007E;
    SEP #$20                                                   ;849F4A|E220    |      ;
    REP #$10                                                   ;849F4C|C210    |      ;
    LDY.W #$0002                                               ;849F4E|A00200  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;849F51|B7CC    |0000CC;
    BEQ CODE_849F81                                            ;849F53|F02C    |849F81;
    CMP.B #$02                                                 ;849F55|C902    |      ;
    BEQ CODE_849F81                                            ;849F57|F028    |849F81;
    REP #$20                                                   ;849F59|C220    |      ;
    LDA.W #$0069                                               ;849F5B|A96900  |      ;
    STA.B n16TempVar1                                          ;849F5E|857E    |00007E;
    BRA CODE_849F81                                            ;849F60|801F    |849F81;
 
 
CODE_849F62:
    REP #$30                                                   ;849F62|C230    |      ;
    LDA.W #$006A                                               ;849F64|A96A00  |      ;
    STA.B n16TempVar1                                          ;849F67|857E    |00007E;
    SEP #$20                                                   ;849F69|E220    |      ;
    REP #$10                                                   ;849F6B|C210    |      ;
    LDY.W #$0002                                               ;849F6D|A00200  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;849F70|B7CC    |0000CC;
    BEQ CODE_849F81                                            ;849F72|F00D    |849F81;
    CMP.B #$02                                                 ;849F74|C902    |      ;
    BEQ CODE_849F81                                            ;849F76|F009    |849F81;
    REP #$20                                                   ;849F78|C220    |      ;
    LDA.W #$006B                                               ;849F7A|A96B00  |      ;
    STA.B n16TempVar1                                          ;849F7D|857E    |00007E;
    BRA CODE_849F81                                            ;849F7F|8000    |849F81;
 
 
CODE_849F81:
    SEP #$20                                                   ;849F81|E220    |      ;
    REP #$10                                                   ;849F83|C210    |      ;
    LDY.W #$0000                                               ;849F85|A00000  |      ;
    LDA.B [ptrUnknown0x72],Y                                   ;849F88|B772    |000072;
    AND.B #$70                                                 ;849F8A|2970    |      ;
    BEQ CODE_849F91                                            ;849F8C|F003    |849F91;
    JMP.W CODE_84A0B9                                          ;849F8E|4CB9A0  |84A0B9;
 
 
CODE_849F91:
    REP #$20                                                   ;849F91|C220    |      ;
    LDA.W #$0000                                               ;849F93|A90000  |      ;
    SEP #$20                                                   ;849F96|E220    |      ;
    REP #$10                                                   ;849F98|C210    |      ;
    LDY.W #$003F                                               ;849F9A|A03F00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;849F9D|B7CC    |0000CC;
    LDX.W #$0000                                               ;849F9F|A20000  |      ;
    LDY.B n16TempVar1                                          ;849FA2|A47E    |00007E;
    JSL.L fAI_Unknown84803F                                    ;849FA4|223F8084|84803F;
    SEP #$20                                                   ;849FA8|E220    |      ;
    LDY.W #$0005                                               ;849FAA|A00500  |      ;
    LDA.B [ptrUnknown0x72],Y                                   ;849FAD|B772    |000072;
    CMP.B #$0A                                                 ;849FAF|C90A    |      ;
    BNE CODE_849FB6                                            ;849FB1|D003    |849FB6;
    JMP.W CODE_84A0B9                                          ;849FB3|4CB9A0  |84A0B9;
 
 
CODE_849FB6:
    INC A                                                      ;849FB6|1A      |      ;
    STA.B [ptrUnknown0x72],Y                                   ;849FB7|9772    |000072;
    JMP.W CODE_84A0B9                                          ;849FB9|4CB9A0  |84A0B9;
 
 
CODE_849FBC:
    SEP #$20                                                   ;849FBC|E220    |      ;
    REP #$10                                                   ;849FBE|C210    |      ;
    LDY.W #$0000                                               ;849FC0|A00000  |      ;
    LDA.B [ptrUnknown0x72],Y                                   ;849FC3|B772    |000072;
    AND.B #$DF                                                 ;849FC5|29DF    |      ;
    STA.B [ptrUnknown0x72],Y                                   ;849FC7|9772    |000072;
    LDY.W #$0003                                               ;849FC9|A00300  |      ;
    LDA.B #$00                                                 ;849FCC|A900    |      ;
    STA.B [ptrUnknown0x72],Y                                   ;849FCE|9772    |000072;
 
CODE_849FD0:
    SEP #$20                                                   ;849FD0|E220    |      ;
    REP #$10                                                   ;849FD2|C210    |      ;
    LDY.W #$0002                                               ;849FD4|A00200  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;849FD7|B7CC    |0000CC;
    CMP.B #$00                                                 ;849FD9|C900    |      ;
    BEQ CODE_849FE9                                            ;849FDB|F00C    |849FE9;
    CMP.B #$01                                                 ;849FDD|C901    |      ;
    BEQ CODE_84A000                                            ;849FDF|F01F    |84A000;
    CMP.B #$02                                                 ;849FE1|C902    |      ;
    BEQ CODE_84A017                                            ;849FE3|F032    |84A017;
    CMP.B #$03                                                 ;849FE5|C903    |      ;
    BEQ CODE_84A02E                                            ;849FE7|F045    |84A02E;
 
CODE_849FE9:
    REP #$20                                                   ;849FE9|C220    |      ;
    LDA.W #$0000                                               ;849FEB|A90000  |      ;
    SEP #$20                                                   ;849FEE|E220    |      ;
    REP #$10                                                   ;849FF0|C210    |      ;
    LDY.W #$003F                                               ;849FF2|A03F00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;849FF5|B7CC    |0000CC;
    LDX.W #$0000                                               ;849FF7|A20000  |      ;
    LDY.W #$000C                                               ;849FFA|A00C00  |      ;
    JMP.W CODE_84A0B5                                          ;849FFD|4CB5A0  |84A0B5;
 
 
CODE_84A000:
    REP #$20                                                   ;84A000|C220    |      ;
    LDA.W #$0000                                               ;84A002|A90000  |      ;
    SEP #$20                                                   ;84A005|E220    |      ;
    REP #$10                                                   ;84A007|C210    |      ;
    LDY.W #$003F                                               ;84A009|A03F00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84A00C|B7CC    |0000CC;
    LDX.W #$0000                                               ;84A00E|A20000  |      ;
    LDY.W #$000D                                               ;84A011|A00D00  |      ;
    JMP.W CODE_84A0B5                                          ;84A014|4CB5A0  |84A0B5;
 
 
CODE_84A017:
    REP #$20                                                   ;84A017|C220    |      ;
    LDA.W #$0000                                               ;84A019|A90000  |      ;
    SEP #$20                                                   ;84A01C|E220    |      ;
    REP #$10                                                   ;84A01E|C210    |      ;
    LDY.W #$003F                                               ;84A020|A03F00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84A023|B7CC    |0000CC;
    LDX.W #$0000                                               ;84A025|A20000  |      ;
    LDY.W #$000E                                               ;84A028|A00E00  |      ;
    JMP.W CODE_84A0B5                                          ;84A02B|4CB5A0  |84A0B5;
 
 
CODE_84A02E:
    REP #$20                                                   ;84A02E|C220    |      ;
    LDA.W #$0000                                               ;84A030|A90000  |      ;
    SEP #$20                                                   ;84A033|E220    |      ;
    REP #$10                                                   ;84A035|C210    |      ;
    LDY.W #$003F                                               ;84A037|A03F00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84A03A|B7CC    |0000CC;
    LDX.W #$0000                                               ;84A03C|A20000  |      ;
    LDY.W #$000F                                               ;84A03F|A00F00  |      ;
    BRA CODE_84A0B5                                            ;84A042|8071    |84A0B5;
 
 
CODE_84A044:
    SEP #$20                                                   ;84A044|E220    |      ;
    REP #$10                                                   ;84A046|C210    |      ;
    LDY.W #$0002                                               ;84A048|A00200  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84A04B|B7CC    |0000CC;
    CMP.B #$00                                                 ;84A04D|C900    |      ;
    BEQ CODE_84A05D                                            ;84A04F|F00C    |84A05D;
    CMP.B #$01                                                 ;84A051|C901    |      ;
    BEQ CODE_84A073                                            ;84A053|F01E    |84A073;
    CMP.B #$02                                                 ;84A055|C902    |      ;
    BEQ CODE_84A089                                            ;84A057|F030    |84A089;
    CMP.B #$03                                                 ;84A059|C903    |      ;
    BEQ CODE_84A09F                                            ;84A05B|F042    |84A09F;
 
CODE_84A05D:
    REP #$20                                                   ;84A05D|C220    |      ;
    LDA.W #$0000                                               ;84A05F|A90000  |      ;
    SEP #$20                                                   ;84A062|E220    |      ;
    REP #$10                                                   ;84A064|C210    |      ;
    LDY.W #$003F                                               ;84A066|A03F00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84A069|B7CC    |0000CC;
    LDX.W #$0000                                               ;84A06B|A20000  |      ;
    LDY.W #$0082                                               ;84A06E|A08200  |      ;
    BRA CODE_84A0B5                                            ;84A071|8042    |84A0B5;
 
 
CODE_84A073:
    REP #$20                                                   ;84A073|C220    |      ;
    LDA.W #$0000                                               ;84A075|A90000  |      ;
    SEP #$20                                                   ;84A078|E220    |      ;
    REP #$10                                                   ;84A07A|C210    |      ;
    LDY.W #$003F                                               ;84A07C|A03F00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84A07F|B7CC    |0000CC;
    LDX.W #$0000                                               ;84A081|A20000  |      ;
    LDY.W #$0083                                               ;84A084|A08300  |      ;
    BRA CODE_84A0B5                                            ;84A087|802C    |84A0B5;
 
 
CODE_84A089:
    REP #$20                                                   ;84A089|C220    |      ;
    LDA.W #$0000                                               ;84A08B|A90000  |      ;
    SEP #$20                                                   ;84A08E|E220    |      ;
    REP #$10                                                   ;84A090|C210    |      ;
    LDY.W #$003F                                               ;84A092|A03F00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84A095|B7CC    |0000CC;
    LDX.W #$0000                                               ;84A097|A20000  |      ;
    LDY.W #$0084                                               ;84A09A|A08400  |      ;
    BRA CODE_84A0B5                                            ;84A09D|8016    |84A0B5;
 
 
CODE_84A09F:
    REP #$20                                                   ;84A09F|C220    |      ;
    LDA.W #$0000                                               ;84A0A1|A90000  |      ;
    SEP #$20                                                   ;84A0A4|E220    |      ;
    REP #$10                                                   ;84A0A6|C210    |      ;
    LDY.W #$003F                                               ;84A0A8|A03F00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84A0AB|B7CC    |0000CC;
    LDX.W #$0000                                               ;84A0AD|A20000  |      ;
    LDY.W #$0085                                               ;84A0B0|A08500  |      ;
    BRA CODE_84A0B5                                            ;84A0B3|8000    |84A0B5;
 
 
CODE_84A0B5:
    JSL.L fAI_Unknown84803F                                    ;84A0B5|223F8084|84803F;
 
CODE_84A0B9:
    SEP #$20                                                   ;84A0B9|E220    |      ;
    LDY.W #$0000                                               ;84A0BB|A00000  |      ;
    LDA.B [ptrUnknown0x72],Y                                   ;84A0BE|B772    |000072;
    AND.B #$08                                                 ;84A0C0|2908    |      ;
    BEQ CODE_84A0C7                                            ;84A0C2|F003    |84A0C7;
    JMP.W CODE_84A2B6                                          ;84A0C4|4CB6A2  |84A2B6;
 
 
CODE_84A0C7:
    LDA.B [ptrUnknown0x72],Y                                   ;84A0C7|B772    |000072;
    AND.B #$04                                                 ;84A0C9|2904    |      ;
    BEQ CODE_84A0D0                                            ;84A0CB|F003    |84A0D0;
    JMP.W CODE_84A1C9                                          ;84A0CD|4CC9A1  |84A1C9;
 
 
CODE_84A0D0:
    LDA.B [ptrUnknown0x72],Y                                   ;84A0D0|B772    |000072;
    AND.B #$02                                                 ;84A0D2|2902    |      ;
    BEQ CODE_84A0D9                                            ;84A0D4|F003    |84A0D9;
    JMP.W CODE_84A0DC                                          ;84A0D6|4CDCA0  |84A0DC;
 
 
CODE_84A0D9:
    JMP.W fAI_Unknown84A46E                                    ;84A0D9|4C6EA4  |84A46E;
 
 
CODE_84A0DC:
    SEP #$20                                                   ;84A0DC|E220    |      ;
    REP #$10                                                   ;84A0DE|C210    |      ;
    LDY.W #$003F                                               ;84A0E0|A03F00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84A0E3|B7CC    |0000CC;
    SEC                                                        ;84A0E5|38      |      ;
    SBC.B #$18                                                 ;84A0E6|E918    |      ;
    XBA                                                        ;84A0E8|EB      |      ;
    LDA.B #$00                                                 ;84A0E9|A900    |      ;
    XBA                                                        ;84A0EB|EB      |      ;
    REP #$20                                                   ;84A0EC|C220    |      ;
    ASL A                                                      ;84A0EE|0A      |      ;
    TAX                                                        ;84A0EF|AA      |      ;
    LDA.W $0953,X                                              ;84A0F0|BD5309  |000953;
    CMP.W #$0100                                               ;84A0F3|C90001  |      ;
    BEQ CODE_84A0FF                                            ;84A0F6|F007    |84A0FF;
    INC A                                                      ;84A0F8|1A      |      ;
    STA.W $0953,X                                              ;84A0F9|9D5309  |000953;
    JMP.W fAI_Unknown84A46E                                    ;84A0FC|4C6EA4  |84A46E;
 
 
CODE_84A0FF:
    REP #$30                                                   ;84A0FF|C230    |      ;
    STZ.W $0953,X                                              ;84A101|9E5309  |000953;
    SEP #$20                                                   ;84A104|E220    |      ;
    LDA.B $DE                                                  ;84A106|A5DE    |0000DE;
    CMP.B #$40                                                 ;84A108|C940    |      ;
    BCC CODE_84A11D                                            ;84A10A|9011    |84A11D;
    CMP.B #$80                                                 ;84A10C|C980    |      ;
    BCS CODE_84A113                                            ;84A10E|B003    |84A113;
    JMP.W CODE_84A148                                          ;84A110|4C48A1  |84A148;
 
 
CODE_84A113:
    CMP.B #$C0                                                 ;84A113|C9C0    |      ;
    BCS CODE_84A11A                                            ;84A115|B003    |84A11A;
    JMP.W CODE_84A173                                          ;84A117|4C73A1  |84A173;
 
 
CODE_84A11A:
    JMP.W CODE_84A19E                                          ;84A11A|4C9EA1  |84A19E;
 
 
CODE_84A11D:
    REP #$30                                                   ;84A11D|C230    |      ;
    SEP #$20                                                   ;84A11F|E220    |      ;
    REP #$10                                                   ;84A121|C210    |      ;
    LDY.W #$0001                                               ;84A123|A00100  |      ;
    LDA.B [ptrUnknown0x72],Y                                   ;84A126|B772    |000072;
    ORA.B #$08                                                 ;84A128|0908    |      ;
    STA.B [ptrUnknown0x72],Y                                   ;84A12A|9772    |000072;
    SEP #$20                                                   ;84A12C|E220    |      ;
    REP #$10                                                   ;84A12E|C210    |      ;
    LDY.W #$003F                                               ;84A130|A03F00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84A133|B7CC    |0000CC;
    XBA                                                        ;84A135|EB      |      ;
    LDA.B #$00                                                 ;84A136|A900    |      ;
    XBA                                                        ;84A138|EB      |      ;
    REP #$20                                                   ;84A139|C220    |      ;
    LDX.W #$0000                                               ;84A13B|A20000  |      ;
    LDY.W #$0078                                               ;84A13E|A07800  |      ;
    JSL.L fAI_Unknown84803F                                    ;84A141|223F8084|84803F;
    JMP.W fAI_Unknown84A46E                                    ;84A145|4C6EA4  |84A46E;
 
 
CODE_84A148:
    REP #$30                                                   ;84A148|C230    |      ;
    SEP #$20                                                   ;84A14A|E220    |      ;
    REP #$10                                                   ;84A14C|C210    |      ;
    LDY.W #$0001                                               ;84A14E|A00100  |      ;
    LDA.B [ptrUnknown0x72],Y                                   ;84A151|B772    |000072;
    AND.B #$F7                                                 ;84A153|29F7    |      ;
    STA.B [ptrUnknown0x72],Y                                   ;84A155|9772    |000072;
    SEP #$20                                                   ;84A157|E220    |      ;
    REP #$10                                                   ;84A159|C210    |      ;
    LDY.W #$003F                                               ;84A15B|A03F00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84A15E|B7CC    |0000CC;
    XBA                                                        ;84A160|EB      |      ;
    LDA.B #$00                                                 ;84A161|A900    |      ;
    XBA                                                        ;84A163|EB      |      ;
    REP #$20                                                   ;84A164|C220    |      ;
    LDX.W #$0000                                               ;84A166|A20000  |      ;
    LDY.W #$0079                                               ;84A169|A07900  |      ;
    JSL.L fAI_Unknown84803F                                    ;84A16C|223F8084|84803F;
    JMP.W fAI_Unknown84A46E                                    ;84A170|4C6EA4  |84A46E;
 
 
CODE_84A173:
    REP #$30                                                   ;84A173|C230    |      ;
    SEP #$20                                                   ;84A175|E220    |      ;
    REP #$10                                                   ;84A177|C210    |      ;
    LDY.W #$0001                                               ;84A179|A00100  |      ;
    LDA.B [ptrUnknown0x72],Y                                   ;84A17C|B772    |000072;
    AND.B #$F7                                                 ;84A17E|29F7    |      ;
    STA.B [ptrUnknown0x72],Y                                   ;84A180|9772    |000072;
    SEP #$20                                                   ;84A182|E220    |      ;
    REP #$10                                                   ;84A184|C210    |      ;
    LDY.W #$003F                                               ;84A186|A03F00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84A189|B7CC    |0000CC;
    XBA                                                        ;84A18B|EB      |      ;
    LDA.B #$00                                                 ;84A18C|A900    |      ;
    XBA                                                        ;84A18E|EB      |      ;
    REP #$20                                                   ;84A18F|C220    |      ;
    LDX.W #$0000                                               ;84A191|A20000  |      ;
    LDY.W #$007A                                               ;84A194|A07A00  |      ;
    JSL.L fAI_Unknown84803F                                    ;84A197|223F8084|84803F;
    JMP.W fAI_Unknown84A46E                                    ;84A19B|4C6EA4  |84A46E;
 
 
CODE_84A19E:
    REP #$30                                                   ;84A19E|C230    |      ;
    SEP #$20                                                   ;84A1A0|E220    |      ;
    REP #$10                                                   ;84A1A2|C210    |      ;
    LDY.W #$0001                                               ;84A1A4|A00100  |      ;
    LDA.B [ptrUnknown0x72],Y                                   ;84A1A7|B772    |000072;
    AND.B #$F7                                                 ;84A1A9|29F7    |      ;
    STA.B [ptrUnknown0x72],Y                                   ;84A1AB|9772    |000072;
    SEP #$20                                                   ;84A1AD|E220    |      ;
    REP #$10                                                   ;84A1AF|C210    |      ;
    LDY.W #$003F                                               ;84A1B1|A03F00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84A1B4|B7CC    |0000CC;
    XBA                                                        ;84A1B6|EB      |      ;
    LDA.B #$00                                                 ;84A1B7|A900    |      ;
    XBA                                                        ;84A1B9|EB      |      ;
    REP #$20                                                   ;84A1BA|C220    |      ;
    LDX.W #$0000                                               ;84A1BC|A20000  |      ;
    LDY.W #$007B                                               ;84A1BF|A07B00  |      ;
    JSL.L fAI_Unknown84803F                                    ;84A1C2|223F8084|84803F;
    JMP.W fAI_Unknown84A46E                                    ;84A1C6|4C6EA4  |84A46E;
 
 
CODE_84A1C9:
    SEP #$20                                                   ;84A1C9|E220    |      ;
    REP #$10                                                   ;84A1CB|C210    |      ;
    LDY.W #$003F                                               ;84A1CD|A03F00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84A1D0|B7CC    |0000CC;
    SEC                                                        ;84A1D2|38      |      ;
    SBC.B #$18                                                 ;84A1D3|E918    |      ;
    XBA                                                        ;84A1D5|EB      |      ;
    LDA.B #$00                                                 ;84A1D6|A900    |      ;
    XBA                                                        ;84A1D8|EB      |      ;
    REP #$20                                                   ;84A1D9|C220    |      ;
    ASL A                                                      ;84A1DB|0A      |      ;
    TAX                                                        ;84A1DC|AA      |      ;
    LDA.W $0953,X                                              ;84A1DD|BD5309  |000953;
    CMP.W #$0100                                               ;84A1E0|C90001  |      ;
    BEQ CODE_84A1EC                                            ;84A1E3|F007    |84A1EC;
    INC A                                                      ;84A1E5|1A      |      ;
    STA.W $0953,X                                              ;84A1E6|9D5309  |000953;
    JMP.W fAI_Unknown84A46E                                    ;84A1E9|4C6EA4  |84A46E;
 
 
CODE_84A1EC:
    REP #$30                                                   ;84A1EC|C230    |      ;
    STZ.W $0953,X                                              ;84A1EE|9E5309  |000953;
    SEP #$20                                                   ;84A1F1|E220    |      ;
    LDA.B $DE                                                  ;84A1F3|A5DE    |0000DE;
    CMP.B #$40                                                 ;84A1F5|C940    |      ;
    BCC CODE_84A20A                                            ;84A1F7|9011    |84A20A;
    CMP.B #$80                                                 ;84A1F9|C980    |      ;
    BCS CODE_84A200                                            ;84A1FB|B003    |84A200;
    JMP.W CODE_84A235                                          ;84A1FD|4C35A2  |84A235;
 
 
CODE_84A200:
    CMP.B #$C0                                                 ;84A200|C9C0    |      ;
    BCS CODE_84A207                                            ;84A202|B003    |84A207;
    JMP.W CODE_84A260                                          ;84A204|4C60A2  |84A260;
 
 
CODE_84A207:
    JMP.W CODE_84A28B                                          ;84A207|4C8BA2  |84A28B;
 
 
CODE_84A20A:
    REP #$30                                                   ;84A20A|C230    |      ;
    SEP #$20                                                   ;84A20C|E220    |      ;
    REP #$10                                                   ;84A20E|C210    |      ;
    LDY.W #$0001                                               ;84A210|A00100  |      ;
    LDA.B [ptrUnknown0x72],Y                                   ;84A213|B772    |000072;
    ORA.B #$08                                                 ;84A215|0908    |      ;
    STA.B [ptrUnknown0x72],Y                                   ;84A217|9772    |000072;
    SEP #$20                                                   ;84A219|E220    |      ;
    REP #$10                                                   ;84A21B|C210    |      ;
    LDY.W #$003F                                               ;84A21D|A03F00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84A220|B7CC    |0000CC;
    XBA                                                        ;84A222|EB      |      ;
    LDA.B #$00                                                 ;84A223|A900    |      ;
    XBA                                                        ;84A225|EB      |      ;
    REP #$20                                                   ;84A226|C220    |      ;
    LDX.W #$0000                                               ;84A228|A20000  |      ;
    LDY.W #$0074                                               ;84A22B|A07400  |      ;
    JSL.L fAI_Unknown84803F                                    ;84A22E|223F8084|84803F;
    JMP.W fAI_Unknown84A46E                                    ;84A232|4C6EA4  |84A46E;
 
 
CODE_84A235:
    REP #$30                                                   ;84A235|C230    |      ;
    SEP #$20                                                   ;84A237|E220    |      ;
    REP #$10                                                   ;84A239|C210    |      ;
    LDY.W #$0001                                               ;84A23B|A00100  |      ;
    LDA.B [ptrUnknown0x72],Y                                   ;84A23E|B772    |000072;
    AND.B #$F7                                                 ;84A240|29F7    |      ;
    STA.B [ptrUnknown0x72],Y                                   ;84A242|9772    |000072;
    SEP #$20                                                   ;84A244|E220    |      ;
    REP #$10                                                   ;84A246|C210    |      ;
    LDY.W #$003F                                               ;84A248|A03F00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84A24B|B7CC    |0000CC;
    XBA                                                        ;84A24D|EB      |      ;
    LDA.B #$00                                                 ;84A24E|A900    |      ;
    XBA                                                        ;84A250|EB      |      ;
    REP #$20                                                   ;84A251|C220    |      ;
    LDX.W #$0000                                               ;84A253|A20000  |      ;
    LDY.W #$0076                                               ;84A256|A07600  |      ;
    JSL.L fAI_Unknown84803F                                    ;84A259|223F8084|84803F;
    JMP.W fAI_Unknown84A46E                                    ;84A25D|4C6EA4  |84A46E;
 
 
CODE_84A260:
    REP #$30                                                   ;84A260|C230    |      ;
    SEP #$20                                                   ;84A262|E220    |      ;
    REP #$10                                                   ;84A264|C210    |      ;
    LDY.W #$0001                                               ;84A266|A00100  |      ;
    LDA.B [ptrUnknown0x72],Y                                   ;84A269|B772    |000072;
    AND.B #$F7                                                 ;84A26B|29F7    |      ;
    STA.B [ptrUnknown0x72],Y                                   ;84A26D|9772    |000072;
    SEP #$20                                                   ;84A26F|E220    |      ;
    REP #$10                                                   ;84A271|C210    |      ;
    LDY.W #$003F                                               ;84A273|A03F00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84A276|B7CC    |0000CC;
    XBA                                                        ;84A278|EB      |      ;
    LDA.B #$00                                                 ;84A279|A900    |      ;
    XBA                                                        ;84A27B|EB      |      ;
    REP #$20                                                   ;84A27C|C220    |      ;
    LDX.W #$0000                                               ;84A27E|A20000  |      ;
    LDY.W #$0077                                               ;84A281|A07700  |      ;
    JSL.L fAI_Unknown84803F                                    ;84A284|223F8084|84803F;
    JMP.W fAI_Unknown84A46E                                    ;84A288|4C6EA4  |84A46E;
 
 
CODE_84A28B:
    REP #$30                                                   ;84A28B|C230    |      ;
    SEP #$20                                                   ;84A28D|E220    |      ;
    REP #$10                                                   ;84A28F|C210    |      ;
    LDY.W #$0001                                               ;84A291|A00100  |      ;
    LDA.B [ptrUnknown0x72],Y                                   ;84A294|B772    |000072;
    AND.B #$F7                                                 ;84A296|29F7    |      ;
    STA.B [ptrUnknown0x72],Y                                   ;84A298|9772    |000072;
    SEP #$20                                                   ;84A29A|E220    |      ;
    REP #$10                                                   ;84A29C|C210    |      ;
    LDY.W #$003F                                               ;84A29E|A03F00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84A2A1|B7CC    |0000CC;
    XBA                                                        ;84A2A3|EB      |      ;
    LDA.B #$00                                                 ;84A2A4|A900    |      ;
    XBA                                                        ;84A2A6|EB      |      ;
    REP #$20                                                   ;84A2A7|C220    |      ;
    LDX.W #$0000                                               ;84A2A9|A20000  |      ;
    LDY.W #$0075                                               ;84A2AC|A07500  |      ;
    JSL.L fAI_Unknown84803F                                    ;84A2AF|223F8084|84803F;
    JMP.W fAI_Unknown84A46E                                    ;84A2B3|4C6EA4  |84A46E;
 
 
CODE_84A2B6:
    SEP #$20                                                   ;84A2B6|E220    |      ;
    REP #$10                                                   ;84A2B8|C210    |      ;
    LDY.W #$003F                                               ;84A2BA|A03F00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84A2BD|B7CC    |0000CC;
    SEC                                                        ;84A2BF|38      |      ;
    SBC.B #$18                                                 ;84A2C0|E918    |      ;
    XBA                                                        ;84A2C2|EB      |      ;
    LDA.B #$00                                                 ;84A2C3|A900    |      ;
    XBA                                                        ;84A2C5|EB      |      ;
    REP #$20                                                   ;84A2C6|C220    |      ;
    ASL A                                                      ;84A2C8|0A      |      ;
    TAX                                                        ;84A2C9|AA      |      ;
    LDA.W $0953,X                                              ;84A2CA|BD5309  |000953;
    CMP.W #$0100                                               ;84A2CD|C90001  |      ;
    BEQ CODE_84A2D9                                            ;84A2D0|F007    |84A2D9;
    INC A                                                      ;84A2D2|1A      |      ;
    STA.W $0953,X                                              ;84A2D3|9D5309  |000953;
    JMP.W fAI_Unknown84A46E                                    ;84A2D6|4C6EA4  |84A46E;
 
 
CODE_84A2D9:
    REP #$30                                                   ;84A2D9|C230    |      ;
    STZ.W $0953,X                                              ;84A2DB|9E5309  |000953;
    SEP #$20                                                   ;84A2DE|E220    |      ;
    LDY.W #$0000                                               ;84A2E0|A00000  |      ;
    LDA.B [ptrUnknown0x72],Y                                   ;84A2E3|B772    |000072;
    AND.B #$40                                                 ;84A2E5|2940    |      ;
    BEQ CODE_84A2EC                                            ;84A2E7|F003    |84A2EC;
    JMP.W fAI_Unknown84A46E                                    ;84A2E9|4C6EA4  |84A46E;
 
 
CODE_84A2EC:
    REP #$30                                                   ;84A2EC|C230    |      ;
    SEP #$20                                                   ;84A2EE|E220    |      ;
    LDA.B $DE                                                  ;84A2F0|A5DE    |0000DE;
    CMP.B #$33                                                 ;84A2F2|C933    |      ;
    BCC CODE_84A30B                                            ;84A2F4|9015    |84A30B;
    CMP.B #$66                                                 ;84A2F6|C966    |      ;
    BCC CODE_84A352                                            ;84A2F8|9058    |84A352;
    CMP.B #$99                                                 ;84A2FA|C999    |      ;
    BCS CODE_84A301                                            ;84A2FC|B003    |84A301;
    JMP.W CODE_84A399                                          ;84A2FE|4C99A3  |84A399;
 
 
CODE_84A301:
    CMP.B #$CC                                                 ;84A301|C9CC    |      ;
    BCS CODE_84A308                                            ;84A303|B003    |84A308;
    JMP.W CODE_84A3E0                                          ;84A305|4CE0A3  |84A3E0;
 
 
CODE_84A308:
    JMP.W CODE_84A427                                          ;84A308|4C27A4  |84A427;
 
 
CODE_84A30B:
    REP #$30                                                   ;84A30B|C230    |      ;
    SEP #$20                                                   ;84A30D|E220    |      ;
    REP #$10                                                   ;84A30F|C210    |      ;
    LDY.W #$0001                                               ;84A311|A00100  |      ;
    LDA.B [ptrUnknown0x72],Y                                   ;84A314|B772    |000072;
    ORA.B #$08                                                 ;84A316|0908    |      ;
    STA.B [ptrUnknown0x72],Y                                   ;84A318|9772    |000072;
    SEP #$20                                                   ;84A31A|E220    |      ;
    LDY.W #$0000                                               ;84A31C|A00000  |      ;
    LDA.B [ptrUnknown0x72],Y                                   ;84A31F|B772    |000072;
    AND.B #$20                                                 ;84A321|2920    |      ;
    BNE CODE_84A335                                            ;84A323|D010    |84A335;
    LDA.B [ptrUnknown0x72],Y                                   ;84A325|B772    |000072;
    AND.B #$10                                                 ;84A327|2910    |      ;
    BNE CODE_84A330                                            ;84A329|D005    |84A330;
    LDX.W #$005E                                               ;84A32B|A25E00  |      ;
    BRA CODE_84A338                                            ;84A32E|8008    |84A338;
 
 
CODE_84A330:
    LDX.W #$0070                                               ;84A330|A27000  |      ;
    BRA CODE_84A338                                            ;84A333|8003    |84A338;
 
 
CODE_84A335:
    LDX.W #$006C                                               ;84A335|A26C00  |      ;
 
CODE_84A338:
    SEP #$20                                                   ;84A338|E220    |      ;
    REP #$10                                                   ;84A33A|C210    |      ;
    LDY.W #$003F                                               ;84A33C|A03F00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84A33F|B7CC    |0000CC;
    XBA                                                        ;84A341|EB      |      ;
    LDA.B #$00                                                 ;84A342|A900    |      ;
    XBA                                                        ;84A344|EB      |      ;
    REP #$20                                                   ;84A345|C220    |      ;
    TXY                                                        ;84A347|9B      |      ;
    LDX.W #$0000                                               ;84A348|A20000  |      ;
    JSL.L fAI_Unknown84803F                                    ;84A34B|223F8084|84803F;
    JMP.W fAI_Unknown84A46E                                    ;84A34F|4C6EA4  |84A46E;
 
 
CODE_84A352:
    REP #$30                                                   ;84A352|C230    |      ;
    SEP #$20                                                   ;84A354|E220    |      ;
    REP #$10                                                   ;84A356|C210    |      ;
    LDY.W #$0001                                               ;84A358|A00100  |      ;
    LDA.B [ptrUnknown0x72],Y                                   ;84A35B|B772    |000072;
    AND.B #$F7                                                 ;84A35D|29F7    |      ;
    STA.B [ptrUnknown0x72],Y                                   ;84A35F|9772    |000072;
    SEP #$20                                                   ;84A361|E220    |      ;
    LDY.W #$0000                                               ;84A363|A00000  |      ;
    LDA.B [ptrUnknown0x72],Y                                   ;84A366|B772    |000072;
    AND.B #$20                                                 ;84A368|2920    |      ;
    BNE CODE_84A37C                                            ;84A36A|D010    |84A37C;
    LDA.B [ptrUnknown0x72],Y                                   ;84A36C|B772    |000072;
    AND.B #$10                                                 ;84A36E|2910    |      ;
    BNE CODE_84A377                                            ;84A370|D005    |84A377;
    LDX.W #$0051                                               ;84A372|A25100  |      ;
    BRA CODE_84A37F                                            ;84A375|8008    |84A37F;
 
 
CODE_84A377:
    LDX.W #$0071                                               ;84A377|A27100  |      ;
    BRA CODE_84A37F                                            ;84A37A|8003    |84A37F;
 
 
CODE_84A37C:
    LDX.W #$006D                                               ;84A37C|A26D00  |      ;
 
CODE_84A37F:
    SEP #$20                                                   ;84A37F|E220    |      ;
    REP #$10                                                   ;84A381|C210    |      ;
    LDY.W #$003F                                               ;84A383|A03F00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84A386|B7CC    |0000CC;
    XBA                                                        ;84A388|EB      |      ;
    LDA.B #$00                                                 ;84A389|A900    |      ;
    XBA                                                        ;84A38B|EB      |      ;
    REP #$20                                                   ;84A38C|C220    |      ;
    TXY                                                        ;84A38E|9B      |      ;
    LDX.W #$0000                                               ;84A38F|A20000  |      ;
    JSL.L fAI_Unknown84803F                                    ;84A392|223F8084|84803F;
    JMP.W fAI_Unknown84A46E                                    ;84A396|4C6EA4  |84A46E;
 
 
CODE_84A399:
    REP #$30                                                   ;84A399|C230    |      ;
    SEP #$20                                                   ;84A39B|E220    |      ;
    REP #$10                                                   ;84A39D|C210    |      ;
    LDY.W #$0001                                               ;84A39F|A00100  |      ;
    LDA.B [ptrUnknown0x72],Y                                   ;84A3A2|B772    |000072;
    AND.B #$F7                                                 ;84A3A4|29F7    |      ;
    STA.B [ptrUnknown0x72],Y                                   ;84A3A6|9772    |000072;
    SEP #$20                                                   ;84A3A8|E220    |      ;
    LDY.W #$0000                                               ;84A3AA|A00000  |      ;
    LDA.B [ptrUnknown0x72],Y                                   ;84A3AD|B772    |000072;
    AND.B #$20                                                 ;84A3AF|2920    |      ;
    BNE CODE_84A3C3                                            ;84A3B1|D010    |84A3C3;
    LDA.B [ptrUnknown0x72],Y                                   ;84A3B3|B772    |000072;
    AND.B #$10                                                 ;84A3B5|2910    |      ;
    BNE CODE_84A3BE                                            ;84A3B7|D005    |84A3BE;
    LDX.W #$0053                                               ;84A3B9|A25300  |      ;
    BRA CODE_84A3C6                                            ;84A3BC|8008    |84A3C6;
 
 
CODE_84A3BE:
    LDX.W #$0072                                               ;84A3BE|A27200  |      ;
    BRA CODE_84A3C6                                            ;84A3C1|8003    |84A3C6;
 
 
CODE_84A3C3:
    LDX.W #$006E                                               ;84A3C3|A26E00  |      ;
 
CODE_84A3C6:
    SEP #$20                                                   ;84A3C6|E220    |      ;
    REP #$10                                                   ;84A3C8|C210    |      ;
    LDY.W #$003F                                               ;84A3CA|A03F00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84A3CD|B7CC    |0000CC;
    XBA                                                        ;84A3CF|EB      |      ;
    LDA.B #$00                                                 ;84A3D0|A900    |      ;
    XBA                                                        ;84A3D2|EB      |      ;
    REP #$20                                                   ;84A3D3|C220    |      ;
    TXY                                                        ;84A3D5|9B      |      ;
    LDX.W #$0000                                               ;84A3D6|A20000  |      ;
    JSL.L fAI_Unknown84803F                                    ;84A3D9|223F8084|84803F;
    JMP.W fAI_Unknown84A46E                                    ;84A3DD|4C6EA4  |84A46E;
 
 
CODE_84A3E0:
    REP #$30                                                   ;84A3E0|C230    |      ;
    SEP #$20                                                   ;84A3E2|E220    |      ;
    REP #$10                                                   ;84A3E4|C210    |      ;
    LDY.W #$0001                                               ;84A3E6|A00100  |      ;
    LDA.B [ptrUnknown0x72],Y                                   ;84A3E9|B772    |000072;
    AND.B #$F7                                                 ;84A3EB|29F7    |      ;
    STA.B [ptrUnknown0x72],Y                                   ;84A3ED|9772    |000072;
    SEP #$20                                                   ;84A3EF|E220    |      ;
    LDY.W #$0000                                               ;84A3F1|A00000  |      ;
    LDA.B [ptrUnknown0x72],Y                                   ;84A3F4|B772    |000072;
    AND.B #$20                                                 ;84A3F6|2920    |      ;
    BNE CODE_84A40A                                            ;84A3F8|D010    |84A40A;
    LDA.B [ptrUnknown0x72],Y                                   ;84A3FA|B772    |000072;
    AND.B #$10                                                 ;84A3FC|2910    |      ;
    BNE CODE_84A405                                            ;84A3FE|D005    |84A405;
    LDX.W #$0054                                               ;84A400|A25400  |      ;
    BRA CODE_84A40D                                            ;84A403|8008    |84A40D;
 
 
CODE_84A405:
    LDX.W #$0073                                               ;84A405|A27300  |      ;
    BRA CODE_84A40D                                            ;84A408|8003    |84A40D;
 
 
CODE_84A40A:
    LDX.W #$006F                                               ;84A40A|A26F00  |      ;
 
CODE_84A40D:
    SEP #$20                                                   ;84A40D|E220    |      ;
    REP #$10                                                   ;84A40F|C210    |      ;
    LDY.W #$003F                                               ;84A411|A03F00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84A414|B7CC    |0000CC;
    XBA                                                        ;84A416|EB      |      ;
    LDA.B #$00                                                 ;84A417|A900    |      ;
    XBA                                                        ;84A419|EB      |      ;
    REP #$20                                                   ;84A41A|C220    |      ;
    TXY                                                        ;84A41C|9B      |      ;
    LDX.W #$0000                                               ;84A41D|A20000  |      ;
    JSL.L fAI_Unknown84803F                                    ;84A420|223F8084|84803F;
    JMP.W fAI_Unknown84A46E                                    ;84A424|4C6EA4  |84A46E;
 
 
CODE_84A427:
    REP #$30                                                   ;84A427|C230    |      ;
    SEP #$20                                                   ;84A429|E220    |      ;
    REP #$10                                                   ;84A42B|C210    |      ;
    LDY.W #$0001                                               ;84A42D|A00100  |      ;
    LDA.B [ptrUnknown0x72],Y                                   ;84A430|B772    |000072;
    AND.B #$F7                                                 ;84A432|29F7    |      ;
    STA.B [ptrUnknown0x72],Y                                   ;84A434|9772    |000072;
    SEP #$20                                                   ;84A436|E220    |      ;
    LDY.W #$0000                                               ;84A438|A00000  |      ;
    LDA.B [ptrUnknown0x72],Y                                   ;84A43B|B772    |000072;
    AND.B #$20                                                 ;84A43D|2920    |      ;
    BNE CODE_84A451                                            ;84A43F|D010    |84A451;
    LDA.B [ptrUnknown0x72],Y                                   ;84A441|B772    |000072;
    AND.B #$10                                                 ;84A443|2910    |      ;
    BNE CODE_84A44C                                            ;84A445|D005    |84A44C;
    LDX.W #$0055                                               ;84A447|A25500  |      ;
    BRA CODE_84A454                                            ;84A44A|8008    |84A454;
 
 
CODE_84A44C:
    LDX.W #$0071                                               ;84A44C|A27100  |      ;
    BRA CODE_84A454                                            ;84A44F|8003    |84A454;
 
 
CODE_84A451:
    LDX.W #$006D                                               ;84A451|A26D00  |      ;
 
CODE_84A454:
    SEP #$20                                                   ;84A454|E220    |      ;
    REP #$10                                                   ;84A456|C210    |      ;
    LDY.W #$003F                                               ;84A458|A03F00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84A45B|B7CC    |0000CC;
    XBA                                                        ;84A45D|EB      |      ;
    LDA.B #$00                                                 ;84A45E|A900    |      ;
    XBA                                                        ;84A460|EB      |      ;
    REP #$20                                                   ;84A461|C220    |      ;
    TXY                                                        ;84A463|9B      |      ;
    LDX.W #$0000                                               ;84A464|A20000  |      ;
    JSL.L fAI_Unknown84803F                                    ;84A467|223F8084|84803F;
    JMP.W fAI_Unknown84A46E                                    ;84A46B|4C6EA4  |84A46E;
 
 
fAI_Unknown84A46E:
    REP #$30                                                   ;84A46E|C230    |      ;
    LDA.L strcDailyFlags.flags1                                ;84A470|AF5A1F7F|7F1F5A;
    AND.W #$0010                                               ;84A474|291000  |      ;
    BEQ CODE_84A47C                                            ;84A477|F003    |84A47C;
    JMP.W CODE_84A740                                          ;84A479|4C40A7  |84A740;
 
 
CODE_84A47C:
    SEP #$20                                                   ;84A47C|E220    |      ;
    REP #$10                                                   ;84A47E|C210    |      ;
    LDY.W #$000C                                               ;84A480|A00C00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84A483|B7CC    |0000CC;
    BEQ CODE_84A48A                                            ;84A485|F003    |84A48A;
    JMP.W fAI_Unknown84A607                                    ;84A487|4C07A6  |84A607;
 
 
CODE_84A48A:
    REP #$30                                                   ;84A48A|C230    |      ;
    LDY.W #$0010                                               ;84A48C|A01000  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84A48F|B7CC    |0000CC;
    CLC                                                        ;84A491|18      |      ;
    ADC.W #$0001                                               ;84A492|690100  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84A495|97CC    |0000CC;
    RTS                                                        ;84A497|60      |      ;
 
 
fAI_Unknwon84A498:
    REP #$30                                                   ;84A498|C230    |      ;
    LDA.L strcDailyFlags.flags1                                ;84A49A|AF5A1F7F|7F1F5A;
    AND.W #$0004                                               ;84A49E|290400  |      ;
    BNE CODE_84A4A6                                            ;84A4A1|D003    |84A4A6;
    JMP.W CODE_849B45                                          ;84A4A3|4C459B  |849B45;
 
 
CODE_84A4A6:
    LDA.L strcDailyFlags.flags1                                ;84A4A6|AF5A1F7F|7F1F5A;
    AND.W #$FFFB                                               ;84A4AA|29FBFF  |      ;
    STA.L strcDailyFlags.flags1                                ;84A4AD|8F5A1F7F|7F1F5A;
    REP #$20                                                   ;84A4B1|C220    |      ;
    LDA.W #$01F4                                               ;84A4B3|A9F401  |      ;
    STA.L nGameUnk7F1F15                                       ;84A4B6|8F151F7F|7F1F15;
    SEP #$20                                                   ;84A4BA|E220    |      ;
    LDA.B #$00                                                 ;84A4BC|A900    |      ;
    STA.L nGameUnk7F1F15+2                                     ;84A4BE|8F171F7F|7F1F17;
    SEP #$20                                                   ;84A4C2|E220    |      ;
    LDY.W #$0004                                               ;84A4C4|A00400  |      ;
    LDA.B [ptrUnknown0x72],Y                                   ;84A4C7|B772    |000072;
    CMP.B #$60                                                 ;84A4C9|C960    |      ;
    BCC CODE_84A4F5                                            ;84A4CB|9028    |84A4F5;
    CMP.B #$C0                                                 ;84A4CD|C9C0    |      ;
    BCC CODE_84A4E4                                            ;84A4CF|9013    |84A4E4;
    REP #$20                                                   ;84A4D1|C220    |      ;
    LDA.W #$03E8                                               ;84A4D3|A9E803  |      ;
    STA.L nGameUnk7F1F15                                       ;84A4D6|8F151F7F|7F1F15;
    SEP #$20                                                   ;84A4DA|E220    |      ;
    LDA.B #$00                                                 ;84A4DC|A900    |      ;
    STA.L nGameUnk7F1F15+2                                     ;84A4DE|8F171F7F|7F1F17;
    BRA CODE_84A4F5                                            ;84A4E2|8011    |84A4F5;
 
 
CODE_84A4E4:
    REP #$20                                                   ;84A4E4|C220    |      ;
    LDA.W #$0320                                               ;84A4E6|A92003  |      ;
    STA.L nGameUnk7F1F15                                       ;84A4E9|8F151F7F|7F1F15;
    SEP #$20                                                   ;84A4ED|E220    |      ;
    LDA.B #$00                                                 ;84A4EF|A900    |      ;
    STA.L nGameUnk7F1F15+2                                     ;84A4F1|8F171F7F|7F1F17;
 
CODE_84A4F5:
    SEP #$20                                                   ;84A4F5|E220    |      ;
    REP #$10                                                   ;84A4F7|C210    |      ;
    LDY.W #$003F                                               ;84A4F9|A03F00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84A4FC|B7CC    |0000CC;
    STA.W $09A0                                                ;84A4FE|8DA009  |0009A0;
    SEP #$20                                                   ;84A501|E220    |      ;
    LDA.B #$43                                                 ;84A503|A943    |      ;
    STA.W nPlayerInteractionIndex                              ;84A505|8D6E09  |00096E;
    STZ.W nPlayerInteractionArg1                               ;84A508|9C6F09  |00096F;
    STZ.W nPlayerInteractionArg2                               ;84A50B|9C7009  |000970;
    REP #$30                                                   ;84A50E|C230    |      ;
    LDA.B strcPlayerFlags                                      ;84A510|A5D2    |0000D2;
    ORA.W #$0040                                               ;84A512|094000  |      ;
    STA.B strcPlayerFlags                                      ;84A515|85D2    |0000D2;
    REP #$30                                                   ;84A517|C230    |      ;
    LDA.W #$0000                                               ;84A519|A90000  |      ;
    STA.B nPlayerAction                                        ;84A51C|85D4    |0000D4;
    SEP #$20                                                   ;84A51E|E220    |      ;
    REP #$10                                                   ;84A520|C210    |      ;
    LDY.W #$000E                                               ;84A522|A00E00  |      ;
    LDA.B #$00                                                 ;84A525|A900    |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84A527|97CC    |0000CC;
    SEP #$20                                                   ;84A529|E220    |      ;
    REP #$10                                                   ;84A52B|C210    |      ;
    LDY.W #$0001                                               ;84A52D|A00100  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84A530|B7CC    |0000CC;
    AND.B #$57                                                 ;84A532|2957    |      ;
    SEP #$20                                                   ;84A534|E220    |      ;
    REP #$10                                                   ;84A536|C210    |      ;
    LDY.W #$0001                                               ;84A538|A00100  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84A53B|97CC    |0000CC;
    JMP.W fAI_Unknown84A46E                                    ;84A53D|4C6EA4  |84A46E;
 
 
CODE_84A540:
    SEP #$20                                                   ;84A540|E220    |      ;
    REP #$10                                                   ;84A542|C210    |      ;
    LDY.W #$0000                                               ;84A544|A00000  |      ;
    LDA.B #$00                                                 ;84A547|A900    |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84A549|97CC    |0000CC;
    SEP #$20                                                   ;84A54B|E220    |      ;
    REP #$10                                                   ;84A54D|C210    |      ;
    LDY.W #$0001                                               ;84A54F|A00100  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84A552|B7CC    |0000CC;
    ORA.B #$40                                                 ;84A554|0940    |      ;
    SEP #$20                                                   ;84A556|E220    |      ;
    REP #$10                                                   ;84A558|C210    |      ;
    LDY.W #$0001                                               ;84A55A|A00100  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84A55D|97CC    |0000CC;
    REP #$30                                                   ;84A55F|C230    |      ;
    LDA.W #$0000                                               ;84A561|A90000  |      ;
    SEP #$20                                                   ;84A564|E220    |      ;
    REP #$10                                                   ;84A566|C210    |      ;
    LDY.W #$003F                                               ;84A568|A03F00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84A56B|B7CC    |0000CC;
    SEC                                                        ;84A56D|38      |      ;
    SBC.B #$18                                                 ;84A56E|E918    |      ;
    REP #$20                                                   ;84A570|C220    |      ;
    ASL A                                                      ;84A572|0A      |      ;
    ASL A                                                      ;84A573|0A      |      ;
    TAX                                                        ;84A574|AA      |      ;
    SEP #$20                                                   ;84A575|E220    |      ;
    LDY.W #$0002                                               ;84A577|A00200  |      ;
    LDA.B #$27                                                 ;84A57A|A927    |      ;
    STA.B [ptrUnknown0x72],Y                                   ;84A57C|9772    |000072;
    REP #$20                                                   ;84A57E|C220    |      ;
    LDY.W #$0008                                               ;84A580|A00800  |      ;
    LDA.L aGameEngine_AddCowPositionsData,X                    ;84A583|BF44CA83|83CA44;
    STA.B [ptrUnknown0x72],Y                                   ;84A587|9772    |000072;
    LDY.W #$000A                                               ;84A589|A00A00  |      ;
    LDA.L aGameEngine_AddCowPositionsData,X                    ;84A58C|BF44CA83|83CA44;
    STA.B [ptrUnknown0x72],Y                                   ;84A590|9772    |000072;
    JMP.W fAI_Unknown84A46E                                    ;84A592|4C6EA4  |84A46E;
 
 
CODE_84A595:
    SEP #$20                                                   ;84A595|E220    |      ;
    REP #$10                                                   ;84A597|C210    |      ;
    LDY.W #$0000                                               ;84A599|A00000  |      ;
    LDA.B #$00                                                 ;84A59C|A900    |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84A59E|97CC    |0000CC;
    SEP #$20                                                   ;84A5A0|E220    |      ;
    REP #$10                                                   ;84A5A2|C210    |      ;
    LDY.W #$0001                                               ;84A5A4|A00100  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84A5A7|B7CC    |0000CC;
    ORA.B #$40                                                 ;84A5A9|0940    |      ;
    SEP #$20                                                   ;84A5AB|E220    |      ;
    REP #$10                                                   ;84A5AD|C210    |      ;
    LDY.W #$0001                                               ;84A5AF|A00100  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84A5B2|97CC    |0000CC;
    SEP #$20                                                   ;84A5B4|E220    |      ;
    LDY.W #$0002                                               ;84A5B6|A00200  |      ;
    LDA.L nCurrentSeasonID                                     ;84A5B9|AF191F7F|7F1F19;
    STA.B [ptrUnknown0x72],Y                                   ;84A5BD|9772    |000072;
    REP #$20                                                   ;84A5BF|C220    |      ;
    LDY.W #$0008                                               ;84A5C1|A00800  |      ;
    LDA.W #$0148                                               ;84A5C4|A94801  |      ;
    STA.B [ptrUnknown0x72],Y                                   ;84A5C7|9772    |000072;
    LDY.W #$000A                                               ;84A5C9|A00A00  |      ;
    LDA.W #$0178                                               ;84A5CC|A97801  |      ;
    STA.B [ptrUnknown0x72],Y                                   ;84A5CF|9772    |000072;
    JMP.W fAI_Unknown84A46E                                    ;84A5D1|4C6EA4  |84A46E;
 
 
fAI_Unknown84A5D4:
    REP #$30                                                   ;84A5D4|C230    |      ;
    STA.B n16TempVar1                                          ;84A5D6|857E    |00007E;
    LDA.W #$0000                                               ;84A5D8|A90000  |      ;
    SEP #$20                                                   ;84A5DB|E220    |      ;
    LDY.W #$0004                                               ;84A5DD|A00400  |      ;
    LDA.B [ptrUnknown0x72],Y                                   ;84A5E0|B772    |000072;
    REP #$20                                                   ;84A5E2|C220    |      ;
    STA.B n16TempVar2                                          ;84A5E4|8580    |000080;
    LDA.B n16TempVar2                                          ;84A5E6|A580    |000080;
    CLC                                                        ;84A5E8|18      |      ;
    ADC.B n16TempVar1                                          ;84A5E9|657E    |00007E;
    BMI .label1                                                ;84A5EB|300B    |84A5F8;
    CMP.W #$0100                                               ;84A5ED|C90001  |      ;
    BCS .label2                                                ;84A5F0|B00E    |84A600;
    SEP #$20                                                   ;84A5F2|E220    |      ;
    STA.B [ptrUnknown0x72],Y                                   ;84A5F4|9772    |000072;
    BRA .return                                                ;84A5F6|800E    |84A606;
 
 
.label1:
    SEP #$20                                                   ;84A5F8|E220    |      ;
    LDA.B #$00                                                 ;84A5FA|A900    |      ;
    STA.B [ptrUnknown0x72],Y                                   ;84A5FC|9772    |000072;
    BRA .return                                                ;84A5FE|8006    |84A606;
 
 
.label2:
    SEP #$20                                                   ;84A600|E220    |      ;
    LDA.B #$FF                                                 ;84A602|A9FF    |      ;
    STA.B [ptrUnknown0x72],Y                                   ;84A604|9772    |000072;
 
.return:
    RTL                                                        ;84A606|6B      |      ;
 
 
fAI_Unknown84A607:
    SEP #$20                                                   ;84A607|E220    |      ;
    REP #$10                                                   ;84A609|C210    |      ;
    LDY.W #$0001                                               ;84A60B|A00100  |      ;
    LDA.B [ptrUnknown0x72],Y                                   ;84A60E|B772    |000072;
    AND.B #$08                                                 ;84A610|2908    |      ;
    BEQ CODE_84A617                                            ;84A612|F003    |84A617;
    JMP.W CODE_84A70E                                          ;84A614|4C0EA7  |84A70E;
 
 
CODE_84A617:
    LDY.W #$0001                                               ;84A617|A00100  |      ;
    LDA.B [ptrUnknown0x72],Y                                   ;84A61A|B772    |000072;
    ORA.B #$08                                                 ;84A61C|0908    |      ;
    STA.B [ptrUnknown0x72],Y                                   ;84A61E|9772    |000072;
    SEP #$20                                                   ;84A620|E220    |      ;
    REP #$10                                                   ;84A622|C210    |      ;
    LDY.W #$003F                                               ;84A624|A03F00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84A627|B7CC    |0000CC;
    SEC                                                        ;84A629|38      |      ;
    SBC.B #$18                                                 ;84A62A|E918    |      ;
    XBA                                                        ;84A62C|EB      |      ;
    LDA.B #$00                                                 ;84A62D|A900    |      ;
    XBA                                                        ;84A62F|EB      |      ;
    REP #$20                                                   ;84A630|C220    |      ;
    ASL A                                                      ;84A632|0A      |      ;
    TAX                                                        ;84A633|AA      |      ;
    STZ.W $0953,X                                              ;84A634|9E5309  |000953;
    SEP #$20                                                   ;84A637|E220    |      ;
    LDY.W #$0000                                               ;84A639|A00000  |      ;
    LDA.B [ptrUnknown0x72],Y                                   ;84A63C|B772    |000072;
    AND.B #$08                                                 ;84A63E|2908    |      ;
    BEQ CODE_84A645                                            ;84A640|F003    |84A645;
    JMP.W CODE_84A6BD                                          ;84A642|4CBDA6  |84A6BD;
 
 
CODE_84A645:
    LDA.B [ptrUnknown0x72],Y                                   ;84A645|B772    |000072;
    AND.B #$04                                                 ;84A647|2904    |      ;
    BEQ CODE_84A64E                                            ;84A649|F003    |84A64E;
    JMP.W CODE_84A68C                                          ;84A64B|4C8CA6  |84A68C;
 
 
CODE_84A64E:
    LDA.B [ptrUnknown0x72],Y                                   ;84A64E|B772    |000072;
    AND.B #$02                                                 ;84A650|2902    |      ;
    BEQ CODE_84A657                                            ;84A652|F003    |84A657;
    JMP.W CODE_84A65A                                          ;84A654|4C5AA6  |84A65A;
 
 
CODE_84A657:
    JMP.W CODE_84A70E                                          ;84A657|4C0EA7  |84A70E;
 
 
CODE_84A65A:
    SEP #$20                                                   ;84A65A|E220    |      ;
    REP #$10                                                   ;84A65C|C210    |      ;
    LDY.W #$0001                                               ;84A65E|A00100  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84A661|B7CC    |0000CC;
    ORA.B #$28                                                 ;84A663|0928    |      ;
    SEP #$20                                                   ;84A665|E220    |      ;
    REP #$10                                                   ;84A667|C210    |      ;
    LDY.W #$0001                                               ;84A669|A00100  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84A66C|97CC    |0000CC;
    REP #$30                                                   ;84A66E|C230    |      ;
    SEP #$20                                                   ;84A670|E220    |      ;
    REP #$10                                                   ;84A672|C210    |      ;
    LDY.W #$003F                                               ;84A674|A03F00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84A677|B7CC    |0000CC;
    XBA                                                        ;84A679|EB      |      ;
    LDA.B #$00                                                 ;84A67A|A900    |      ;
    XBA                                                        ;84A67C|EB      |      ;
    REP #$20                                                   ;84A67D|C220    |      ;
    LDX.W #$0000                                               ;84A67F|A20000  |      ;
    LDY.W #$0078                                               ;84A682|A07800  |      ;
    JSL.L fAI_Unknown84803F                                    ;84A685|223F8084|84803F;
    JMP.W CODE_84A70E                                          ;84A689|4C0EA7  |84A70E;
 
 
CODE_84A68C:
    SEP #$20                                                   ;84A68C|E220    |      ;
    REP #$10                                                   ;84A68E|C210    |      ;
    LDY.W #$0001                                               ;84A690|A00100  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84A693|B7CC    |0000CC;
    ORA.B #$28                                                 ;84A695|0928    |      ;
    SEP #$20                                                   ;84A697|E220    |      ;
    REP #$10                                                   ;84A699|C210    |      ;
    LDY.W #$0001                                               ;84A69B|A00100  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84A69E|97CC    |0000CC;
    REP #$30                                                   ;84A6A0|C230    |      ;
    SEP #$20                                                   ;84A6A2|E220    |      ;
    REP #$10                                                   ;84A6A4|C210    |      ;
    LDY.W #$003F                                               ;84A6A6|A03F00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84A6A9|B7CC    |0000CC;
    XBA                                                        ;84A6AB|EB      |      ;
    LDA.B #$00                                                 ;84A6AC|A900    |      ;
    XBA                                                        ;84A6AE|EB      |      ;
    REP #$20                                                   ;84A6AF|C220    |      ;
    LDX.W #$0000                                               ;84A6B1|A20000  |      ;
    LDY.W #$0074                                               ;84A6B4|A07400  |      ;
    JSL.L fAI_Unknown84803F                                    ;84A6B7|223F8084|84803F;
    BRA CODE_84A70E                                            ;84A6BB|8051    |84A70E;
 
 
CODE_84A6BD:
    SEP #$20                                                   ;84A6BD|E220    |      ;
    LDY.W #$0000                                               ;84A6BF|A00000  |      ;
    LDA.B [ptrUnknown0x72],Y                                   ;84A6C2|B772    |000072;
    AND.B #$40                                                 ;84A6C4|2940    |      ;
    BNE CODE_84A70E                                            ;84A6C6|D046    |84A70E;
    LDA.B [ptrUnknown0x72],Y                                   ;84A6C8|B772    |000072;
    AND.B #$20                                                 ;84A6CA|2920    |      ;
    BNE CODE_84A6DE                                            ;84A6CC|D010    |84A6DE;
    LDA.B [ptrUnknown0x72],Y                                   ;84A6CE|B772    |000072;
    AND.B #$10                                                 ;84A6D0|2910    |      ;
    BNE CODE_84A6D9                                            ;84A6D2|D005    |84A6D9;
    LDX.W #$005E                                               ;84A6D4|A25E00  |      ;
    BRA CODE_84A6E1                                            ;84A6D7|8008    |84A6E1;
 
 
CODE_84A6D9:
    LDX.W #$0070                                               ;84A6D9|A27000  |      ;
    BRA CODE_84A6E1                                            ;84A6DC|8003    |84A6E1;
 
 
CODE_84A6DE:
    LDX.W #$006C                                               ;84A6DE|A26C00  |      ;
 
CODE_84A6E1:
    SEP #$20                                                   ;84A6E1|E220    |      ;
    REP #$10                                                   ;84A6E3|C210    |      ;
    LDY.W #$0001                                               ;84A6E5|A00100  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84A6E8|B7CC    |0000CC;
    ORA.B #$28                                                 ;84A6EA|0928    |      ;
    SEP #$20                                                   ;84A6EC|E220    |      ;
    REP #$10                                                   ;84A6EE|C210    |      ;
    LDY.W #$0001                                               ;84A6F0|A00100  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84A6F3|97CC    |0000CC;
    REP #$30                                                   ;84A6F5|C230    |      ;
    SEP #$20                                                   ;84A6F7|E220    |      ;
    REP #$10                                                   ;84A6F9|C210    |      ;
    LDY.W #$003F                                               ;84A6FB|A03F00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84A6FE|B7CC    |0000CC;
    XBA                                                        ;84A700|EB      |      ;
    LDA.B #$00                                                 ;84A701|A900    |      ;
    XBA                                                        ;84A703|EB      |      ;
    REP #$20                                                   ;84A704|C220    |      ;
    TXY                                                        ;84A706|9B      |      ;
    LDX.W #$0000                                               ;84A707|A20000  |      ;
    JSL.L fAI_Unknown84803F                                    ;84A70A|223F8084|84803F;
 
CODE_84A70E:
    REP #$30                                                   ;84A70E|C230    |      ;
    REP #$30                                                   ;84A710|C230    |      ;
    LDA.B nPlayerDirection                                     ;84A712|A5DA    |0000DA;
    CMP.W #$0000                                               ;84A714|C90000  |      ;
    BNE CODE_84A71C                                            ;84A717|D003    |84A71C;
    JMP.W CODE_84A8D7                                          ;84A719|4CD7A8  |84A8D7;
 
 
CODE_84A71C:
    REP #$30                                                   ;84A71C|C230    |      ;
    LDA.B nPlayerDirection                                     ;84A71E|A5DA    |0000DA;
    CMP.W #$0001                                               ;84A720|C90100  |      ;
    BNE CODE_84A728                                            ;84A723|D003    |84A728;
    JMP.W CODE_84A8E5                                          ;84A725|4CE5A8  |84A8E5;
 
 
CODE_84A728:
    REP #$30                                                   ;84A728|C230    |      ;
    LDA.B nPlayerDirection                                     ;84A72A|A5DA    |0000DA;
    CMP.W #$0002                                               ;84A72C|C90200  |      ;
    BNE CODE_84A734                                            ;84A72F|D003    |84A734;
    JMP.W CODE_84A8F3                                          ;84A731|4CF3A8  |84A8F3;
 
 
CODE_84A734:
    REP #$30                                                   ;84A734|C230    |      ;
    LDA.B nPlayerDirection                                     ;84A736|A5DA    |0000DA;
    CMP.W #$0003                                               ;84A738|C90300  |      ;
    BNE CODE_84A740                                            ;84A73B|D003    |84A740;
    JMP.W CODE_84A901                                          ;84A73D|4C01A9  |84A901;
 
 
CODE_84A740:
    SEP #$20                                                   ;84A740|E220    |      ;
    REP #$10                                                   ;84A742|C210    |      ;
    LDY.W #$0001                                               ;84A744|A00100  |      ;
    LDA.B [ptrUnknown0x72],Y                                   ;84A747|B772    |000072;
    AND.B #$08                                                 ;84A749|2908    |      ;
    BEQ CODE_84A750                                            ;84A74B|F003    |84A750;
    JMP.W CODE_84A84A                                          ;84A74D|4C4AA8  |84A84A;
 
 
CODE_84A750:
    LDY.W #$0001                                               ;84A750|A00100  |      ;
    LDA.B [ptrUnknown0x72],Y                                   ;84A753|B772    |000072;
    ORA.B #$08                                                 ;84A755|0908    |      ;
    STA.B [ptrUnknown0x72],Y                                   ;84A757|9772    |000072;
    SEP #$20                                                   ;84A759|E220    |      ;
    REP #$10                                                   ;84A75B|C210    |      ;
    LDY.W #$003F                                               ;84A75D|A03F00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84A760|B7CC    |0000CC;
    SEC                                                        ;84A762|38      |      ;
    SBC.B #$18                                                 ;84A763|E918    |      ;
    XBA                                                        ;84A765|EB      |      ;
    LDA.B #$00                                                 ;84A766|A900    |      ;
    XBA                                                        ;84A768|EB      |      ;
    REP #$20                                                   ;84A769|C220    |      ;
    ASL A                                                      ;84A76B|0A      |      ;
    TAX                                                        ;84A76C|AA      |      ;
    STZ.W $0953,X                                              ;84A76D|9E5309  |000953;
    SEP #$20                                                   ;84A770|E220    |      ;
    LDY.W #$0000                                               ;84A772|A00000  |      ;
    LDA.B [ptrUnknown0x72],Y                                   ;84A775|B772    |000072;
    AND.B #$08                                                 ;84A777|2908    |      ;
    BEQ CODE_84A77E                                            ;84A779|F003    |84A77E;
    JMP.W CODE_84A7F6                                          ;84A77B|4CF6A7  |84A7F6;
 
 
CODE_84A77E:
    LDA.B [ptrUnknown0x72],Y                                   ;84A77E|B772    |000072;
    AND.B #$04                                                 ;84A780|2904    |      ;
    BEQ CODE_84A787                                            ;84A782|F003    |84A787;
    JMP.W CODE_84A7C5                                          ;84A784|4CC5A7  |84A7C5;
 
 
CODE_84A787:
    LDA.B [ptrUnknown0x72],Y                                   ;84A787|B772    |000072;
    AND.B #$02                                                 ;84A789|2902    |      ;
    BEQ CODE_84A790                                            ;84A78B|F003    |84A790;
    JMP.W CODE_84A793                                          ;84A78D|4C93A7  |84A793;
 
 
CODE_84A790:
    JMP.W CODE_84A84A                                          ;84A790|4C4AA8  |84A84A;
 
 
CODE_84A793:
    SEP #$20                                                   ;84A793|E220    |      ;
    REP #$10                                                   ;84A795|C210    |      ;
    LDY.W #$0001                                               ;84A797|A00100  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84A79A|B7CC    |0000CC;
    ORA.B #$28                                                 ;84A79C|0928    |      ;
    SEP #$20                                                   ;84A79E|E220    |      ;
    REP #$10                                                   ;84A7A0|C210    |      ;
    LDY.W #$0001                                               ;84A7A2|A00100  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84A7A5|97CC    |0000CC;
    REP #$30                                                   ;84A7A7|C230    |      ;
    SEP #$20                                                   ;84A7A9|E220    |      ;
    REP #$10                                                   ;84A7AB|C210    |      ;
    LDY.W #$003F                                               ;84A7AD|A03F00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84A7B0|B7CC    |0000CC;
    XBA                                                        ;84A7B2|EB      |      ;
    LDA.B #$00                                                 ;84A7B3|A900    |      ;
    XBA                                                        ;84A7B5|EB      |      ;
    REP #$20                                                   ;84A7B6|C220    |      ;
    LDX.W #$0000                                               ;84A7B8|A20000  |      ;
    LDY.W #$0078                                               ;84A7BB|A07800  |      ;
    JSL.L fAI_Unknown84803F                                    ;84A7BE|223F8084|84803F;
    JMP.W CODE_84A84A                                          ;84A7C2|4C4AA8  |84A84A;
 
 
CODE_84A7C5:
    SEP #$20                                                   ;84A7C5|E220    |      ;
    REP #$10                                                   ;84A7C7|C210    |      ;
    LDY.W #$0001                                               ;84A7C9|A00100  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84A7CC|B7CC    |0000CC;
    ORA.B #$28                                                 ;84A7CE|0928    |      ;
    SEP #$20                                                   ;84A7D0|E220    |      ;
    REP #$10                                                   ;84A7D2|C210    |      ;
    LDY.W #$0001                                               ;84A7D4|A00100  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84A7D7|97CC    |0000CC;
    REP #$30                                                   ;84A7D9|C230    |      ;
    SEP #$20                                                   ;84A7DB|E220    |      ;
    REP #$10                                                   ;84A7DD|C210    |      ;
    LDY.W #$003F                                               ;84A7DF|A03F00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84A7E2|B7CC    |0000CC;
    XBA                                                        ;84A7E4|EB      |      ;
    LDA.B #$00                                                 ;84A7E5|A900    |      ;
    XBA                                                        ;84A7E7|EB      |      ;
    REP #$20                                                   ;84A7E8|C220    |      ;
    LDX.W #$0000                                               ;84A7EA|A20000  |      ;
    LDY.W #$0074                                               ;84A7ED|A07400  |      ;
    JSL.L fAI_Unknown84803F                                    ;84A7F0|223F8084|84803F;
    BRA CODE_84A84A                                            ;84A7F4|8054    |84A84A;
 
 
CODE_84A7F6:
    SEP #$20                                                   ;84A7F6|E220    |      ;
    LDY.W #$0000                                               ;84A7F8|A00000  |      ;
    LDA.B [ptrUnknown0x72],Y                                   ;84A7FB|B772    |000072;
    AND.B #$40                                                 ;84A7FD|2940    |      ;
    BEQ CODE_84A804                                            ;84A7FF|F003    |84A804;
    JMP.W CODE_84A84A                                          ;84A801|4C4AA8  |84A84A;
 
 
CODE_84A804:
    LDA.B [ptrUnknown0x72],Y                                   ;84A804|B772    |000072;
    AND.B #$20                                                 ;84A806|2920    |      ;
    BNE CODE_84A81A                                            ;84A808|D010    |84A81A;
    LDA.B [ptrUnknown0x72],Y                                   ;84A80A|B772    |000072;
    AND.B #$10                                                 ;84A80C|2910    |      ;
    BNE CODE_84A815                                            ;84A80E|D005    |84A815;
    LDX.W #$005E                                               ;84A810|A25E00  |      ;
    BRA CODE_84A81D                                            ;84A813|8008    |84A81D;
 
 
CODE_84A815:
    LDX.W #$0070                                               ;84A815|A27000  |      ;
    BRA CODE_84A81D                                            ;84A818|8003    |84A81D;
 
 
CODE_84A81A:
    LDX.W #$006C                                               ;84A81A|A26C00  |      ;
 
CODE_84A81D:
    SEP #$20                                                   ;84A81D|E220    |      ;
    REP #$10                                                   ;84A81F|C210    |      ;
    LDY.W #$0001                                               ;84A821|A00100  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84A824|B7CC    |0000CC;
    ORA.B #$28                                                 ;84A826|0928    |      ;
    SEP #$20                                                   ;84A828|E220    |      ;
    REP #$10                                                   ;84A82A|C210    |      ;
    LDY.W #$0001                                               ;84A82C|A00100  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84A82F|97CC    |0000CC;
    REP #$30                                                   ;84A831|C230    |      ;
    SEP #$20                                                   ;84A833|E220    |      ;
    REP #$10                                                   ;84A835|C210    |      ;
    LDY.W #$003F                                               ;84A837|A03F00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84A83A|B7CC    |0000CC;
    XBA                                                        ;84A83C|EB      |      ;
    LDA.B #$00                                                 ;84A83D|A900    |      ;
    XBA                                                        ;84A83F|EB      |      ;
    REP #$20                                                   ;84A840|C220    |      ;
    TXY                                                        ;84A842|9B      |      ;
    LDX.W #$0000                                               ;84A843|A20000  |      ;
    JSL.L fAI_Unknown84803F                                    ;84A846|223F8084|84803F;
 
CODE_84A84A:
    REP #$30                                                   ;84A84A|C230    |      ;
    STZ.B n16TempVar3                                          ;84A84C|6482    |000082;
    STZ.B n16TempVar4                                          ;84A84E|6484    |000084;
    REP #$30                                                   ;84A850|C230    |      ;
    LDY.W #$001A                                               ;84A852|A01A00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84A855|B7CC    |0000CC;
    SEC                                                        ;84A857|38      |      ;
    SBC.B nPlayerPosX                                          ;84A858|E5D6    |0000D6;
    STA.B n16TempVar1                                          ;84A85A|857E    |00007E;
    BMI CODE_84A860                                            ;84A85C|3002    |84A860;
    BRA CODE_84A86D                                            ;84A85E|800D    |84A86D;
 
 
CODE_84A860:
    REP #$20                                                   ;84A860|C220    |      ;
    EOR.W #$FFFF                                               ;84A862|49FFFF  |      ;
    INC A                                                      ;84A865|1A      |      ;
    STA.B n16TempVar1                                          ;84A866|857E    |00007E;
    LDA.W #$0001                                               ;84A868|A90100  |      ;
    STA.B n16TempVar3                                          ;84A86B|8582    |000082;
 
CODE_84A86D:
    REP #$30                                                   ;84A86D|C230    |      ;
    LDY.W #$001C                                               ;84A86F|A01C00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84A872|B7CC    |0000CC;
    SEC                                                        ;84A874|38      |      ;
    SBC.B nPlayerPosY                                          ;84A875|E5D8    |0000D8;
    STA.B n16TempVar2                                          ;84A877|8580    |000080;
    BMI CODE_84A87D                                            ;84A879|3002    |84A87D;
    BRA CODE_84A88A                                            ;84A87B|800D    |84A88A;
 
 
CODE_84A87D:
    REP #$20                                                   ;84A87D|C220    |      ;
    EOR.W #$FFFF                                               ;84A87F|49FFFF  |      ;
    INC A                                                      ;84A882|1A      |      ;
    STA.B n16TempVar2                                          ;84A883|8580    |000080;
    LDA.W #$0001                                               ;84A885|A90100  |      ;
    STA.B n16TempVar4                                          ;84A888|8584    |000084;
 
CODE_84A88A:
    SEP #$20                                                   ;84A88A|E220    |      ;
    LDA.B #$20                                                 ;84A88C|A920    |      ;
    SEP #$20                                                   ;84A88E|E220    |      ;
    REP #$10                                                   ;84A890|C210    |      ;
    LDY.W #$0008                                               ;84A892|A00800  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84A895|97CC    |0000CC;
    REP #$20                                                   ;84A897|C220    |      ;
    LDA.B n16TempVar2                                          ;84A899|A580    |000080;
    CMP.B n16TempVar1                                          ;84A89B|C57E    |00007E;
    BCS CODE_84A8B2                                            ;84A89D|B013    |84A8B2;
    SEP #$20                                                   ;84A89F|E220    |      ;
    LDY.W #$0000                                               ;84A8A1|A00000  |      ;
    LDA.B [ptrUnknown0x72],Y                                   ;84A8A4|B772    |000072;
    AND.B #$10                                                 ;84A8A6|2910    |      ;
    BNE CODE_84A8C7                                            ;84A8A8|D01D    |84A8C7;
    REP #$20                                                   ;84A8AA|C220    |      ;
    LDA.B n16TempVar3                                          ;84A8AC|A582    |000082;
    BEQ CODE_84A901                                            ;84A8AE|F051    |84A901;
    BRA CODE_84A8F3                                            ;84A8B0|8041    |84A8F3;
 
 
CODE_84A8B2:
    SEP #$20                                                   ;84A8B2|E220    |      ;
    REP #$10                                                   ;84A8B4|C210    |      ;
    LDY.W #$0000                                               ;84A8B6|A00000  |      ;
    LDA.B [ptrUnknown0x72],Y                                   ;84A8B9|B772    |000072;
    AND.B #$10                                                 ;84A8BB|2910    |      ;
    BNE CODE_84A8CF                                            ;84A8BD|D010    |84A8CF;
    REP #$20                                                   ;84A8BF|C220    |      ;
    LDA.B n16TempVar4                                          ;84A8C1|A584    |000084;
    BEQ CODE_84A8E5                                            ;84A8C3|F020    |84A8E5;
    BRA CODE_84A8D7                                            ;84A8C5|8010    |84A8D7;
 
 
CODE_84A8C7:
    REP #$20                                                   ;84A8C7|C220    |      ;
    LDA.B n16TempVar3                                          ;84A8C9|A582    |000082;
    BEQ CODE_84A8F3                                            ;84A8CB|F026    |84A8F3;
    BRA CODE_84A901                                            ;84A8CD|8032    |84A901;
 
 
CODE_84A8CF:
    REP #$20                                                   ;84A8CF|C220    |      ;
    LDA.B n16TempVar4                                          ;84A8D1|A584    |000084;
    BEQ CODE_84A8D7                                            ;84A8D3|F002    |84A8D7;
    BRA CODE_84A8E5                                            ;84A8D5|800E    |84A8E5;
 
 
CODE_84A8D7:
    SEP #$20                                                   ;84A8D7|E220    |      ;
    REP #$10                                                   ;84A8D9|C210    |      ;
    LDY.W #$000F                                               ;84A8DB|A00F00  |      ;
    LDA.B #$01                                                 ;84A8DE|A901    |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84A8E0|97CC    |0000CC;
    JMP.W CODE_84A48A                                          ;84A8E2|4C8AA4  |84A48A;
 
 
CODE_84A8E5:
    SEP #$20                                                   ;84A8E5|E220    |      ;
    REP #$10                                                   ;84A8E7|C210    |      ;
    LDY.W #$000F                                               ;84A8E9|A00F00  |      ;
    LDA.B #$02                                                 ;84A8EC|A902    |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84A8EE|97CC    |0000CC;
    JMP.W CODE_84A48A                                          ;84A8F0|4C8AA4  |84A48A;
 
 
CODE_84A8F3:
    SEP #$20                                                   ;84A8F3|E220    |      ;
    REP #$10                                                   ;84A8F5|C210    |      ;
    LDY.W #$000F                                               ;84A8F7|A00F00  |      ;
    LDA.B #$04                                                 ;84A8FA|A904    |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84A8FC|97CC    |0000CC;
    JMP.W CODE_84A48A                                          ;84A8FE|4C8AA4  |84A48A;
 
 
CODE_84A901:
    SEP #$20                                                   ;84A901|E220    |      ;
    REP #$10                                                   ;84A903|C210    |      ;
    LDY.W #$000F                                               ;84A905|A00F00  |      ;
    LDA.B #$08                                                 ;84A908|A908    |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84A90A|97CC    |0000CC;
    JMP.W CODE_84A48A                                          ;84A90C|4C8AA4  |84A48A;
 
 
fAIAction0x32:
    REP #$30                                                   ;84A90F|C230    |      ;
    REP #$30                                                   ;84A911|C230    |      ;
    LDA.B ptrAIActionData                                      ;84A913|A5C9    |0000C9;
    CLC                                                        ;84A915|18      |      ;
    ADC.W #$0001                                               ;84A916|690100  |      ;
    STA.B ptrAIActionData                                      ;84A919|85C9    |0000C9;
    REP #$20                                                   ;84A91B|C220    |      ;
    LDA.B [ptrAIActionData]                                    ;84A91D|A7C9    |0000C9;
    STA.B ptrUnknown0x72                                       ;84A91F|8572    |000072;
    REP #$30                                                   ;84A921|C230    |      ;
    LDA.B ptrAIActionData                                      ;84A923|A5C9    |0000C9;
    CLC                                                        ;84A925|18      |      ;
    ADC.W #$0002                                               ;84A926|690200  |      ;
    STA.B ptrAIActionData                                      ;84A929|85C9    |0000C9;
    SEP #$20                                                   ;84A92B|E220    |      ;
    LDA.B [ptrAIActionData]                                    ;84A92D|A7C9    |0000C9;
    STA.B ptrUnknown0x72+2                                     ;84A92F|8574    |000074;
    REP #$30                                                   ;84A931|C230    |      ;
    LDA.B ptrAIActionData                                      ;84A933|A5C9    |0000C9;
    CLC                                                        ;84A935|18      |      ;
    ADC.W #$0001                                               ;84A936|690100  |      ;
    STA.B ptrAIActionData                                      ;84A939|85C9    |0000C9;
    REP #$20                                                   ;84A93B|C220    |      ;
    LDA.B [ptrAIActionData]                                    ;84A93D|A7C9    |0000C9;
    STA.B [ptrUnknown0x72]                                     ;84A93F|8772    |000072;
    REP #$30                                                   ;84A941|C230    |      ;
    LDA.B ptrAIActionData                                      ;84A943|A5C9    |0000C9;
    CLC                                                        ;84A945|18      |      ;
    ADC.W #$0002                                               ;84A946|690200  |      ;
    STA.B ptrAIActionData                                      ;84A949|85C9    |0000C9;
    RTS                                                        ;84A94B|60      |      ;
 
 
fAIAction0x33_UpdateMole:
    REP #$30                                                   ;84A94C|C230    |      ;
    REP #$30                                                   ;84A94E|C230    |      ;
    LDA.B ptrAIActionData                                      ;84A950|A5C9    |0000C9;
    CLC                                                        ;84A952|18      |      ;
    ADC.W #$0001                                               ;84A953|690100  |      ;
    STA.B ptrAIActionData                                      ;84A956|85C9    |0000C9;
    SEP #$20                                                   ;84A958|E220    |      ;
    REP #$10                                                   ;84A95A|C210    |      ;
    LDY.W #$000C                                               ;84A95C|A00C00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84A95F|B7CC    |0000CC;
    CMP.B #$00                                                 ;84A961|C900    |      ;
    BNE +                                                      ;84A963|D003    |84A968;
    JMP.W .label1                                              ;84A965|4C1EAA  |84AA1E;
 
 
  + REP #$30                                                   ;84A968|C230    |      ;
    LDA.B nPlayerAction                                        ;84A96A|A5D4    |0000D4;
    CMP.W #$000A                                               ;84A96C|C90A00  |      ;
    BNE +                                                      ;84A96F|D003    |84A974;
    JMP.W .label1                                              ;84A971|4C1EAA  |84AA1E;
 
 
  + REP #$30                                                   ;84A974|C230    |      ;
    LDA.B nPlayerAction                                        ;84A976|A5D4    |0000D4;
    CMP.W #$000C                                               ;84A978|C90C00  |      ;
    BNE +                                                      ;84A97B|D003    |84A980;
    JMP.W .label1                                              ;84A97D|4C1EAA  |84AA1E;
 
 
  + REP #$30                                                   ;84A980|C230    |      ;
    LDA.B nPlayerAction                                        ;84A982|A5D4    |0000D4;
    CMP.W #$000D                                               ;84A984|C90D00  |      ;
    BNE +                                                      ;84A987|D003    |84A98C;
    JMP.W .label1                                              ;84A989|4C1EAA  |84AA1E;
 
 
  + REP #$30                                                   ;84A98C|C230    |      ;
    LDA.B nPlayerAction                                        ;84A98E|A5D4    |0000D4;
    CMP.W #$001B                                               ;84A990|C91B00  |      ;
    BNE +                                                      ;84A993|D003    |84A998;
    JMP.W .label1                                              ;84A995|4C1EAA  |84AA1E;
 
 
  + REP #$20                                                   ;84A998|C220    |      ;
    LDA.B strcPlayerFlags                                      ;84A99A|A5D2    |0000D2;
    AND.W #$0004                                               ;84A99C|290400  |      ;
    BNE .label1                                                ;84A99F|D07D    |84AA1E;
    LDA.L strcDailyFlags.flags4                                ;84A9A1|AF601F7F|7F1F60;
    AND.W #$0006                                               ;84A9A5|290600  |      ;
    BNE .label1                                                ;84A9A8|D074    |84AA1E;
    REP #$20                                                   ;84A9AA|C220    |      ;
    LDA.W strcJoypad1.newInput                                 ;84A9AC|AD2801  |000128;
    BIT.W #$0080                                               ;84A9AF|898000  |      ;
    BNE +                                                      ;84A9B2|D003    |84A9B7;
    JMP.W .label1                                              ;84A9B4|4C1EAA  |84AA1E;
 
 
  + REP #$30                                                   ;84A9B7|C230    |      ;
    LDA.B strcPlayerFlags                                      ;84A9B9|A5D2    |0000D2;
    AND.W #$0800                                               ;84A9BB|290008  |      ;
    BEQ +                                                      ;84A9BE|F003    |84A9C3;
    JMP.W .label1                                              ;84A9C0|4C1EAA  |84AA1E;
 
 
  + LDA.B nPlayerAction                                        ;84A9C3|A5D4    |0000D4;
    CMP.W #$0017                                               ;84A9C5|C91700  |      ;
    BNE +                                                      ;84A9C8|D003    |84A9CD;
    JMP.W .label1                                              ;84A9CA|4C1EAA  |84AA1E;
 
 
  + SEP #$20                                                   ;84A9CD|E220    |      ;
    LDA.W $091D                                                ;84A9CF|AD1D09  |00091D;
    BEQ +                                                      ;84A9D2|F003    |84A9D7;
    JMP.W .label1                                              ;84A9D4|4C1EAA  |84AA1E;
 
 
  + SEP #$20                                                   ;84A9D7|E220    |      ;
    REP #$10                                                   ;84A9D9|C210    |      ;
    LDY.W #$003F                                               ;84A9DB|A03F00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84A9DE|B7CC    |0000CC;
    STA.W $0920                                                ;84A9E0|8D2009  |000920;
    SEP #$20                                                   ;84A9E3|E220    |      ;
    REP #$10                                                   ;84A9E5|C210    |      ;
    LDY.W #$0000                                               ;84A9E7|A00000  |      ;
    LDA.B #$00                                                 ;84A9EA|A900    |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84A9EC|97CC    |0000CC;
    SEP #$20                                                   ;84A9EE|E220    |      ;
    REP #$10                                                   ;84A9F0|C210    |      ;
    LDY.W #$0001                                               ;84A9F2|A00100  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84A9F5|B7CC    |0000CC;
    ORA.B #$40                                                 ;84A9F7|0940    |      ;
    SEP #$20                                                   ;84A9F9|E220    |      ;
    REP #$10                                                   ;84A9FB|C210    |      ;
    LDY.W #$0001                                               ;84A9FD|A00100  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84AA00|97CC    |0000CC;
    REP #$30                                                   ;84AA02|C230    |      ;
    LDY.W #$0010                                               ;84AA04|A01000  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84AA07|B7CC    |0000CC;
    CLC                                                        ;84AA09|18      |      ;
    ADC.W #$0001                                               ;84AA0A|690100  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84AA0D|97CC    |0000CC;
    SEP #$20                                                   ;84AA0F|E220    |      ;
    LDA.B #$29                                                 ;84AA11|A929    |      ;
    STA.W $091D                                                ;84AA13|8D1D09  |00091D;
    REP #$30                                                   ;84AA16|C230    |      ;
    LDA.W #$0004                                               ;84AA18|A90400  |      ;
    STA.B nPlayerAction                                        ;84AA1B|85D4    |0000D4;
    RTS                                                        ;84AA1D|60      |      ;
 
 
.label1:
    SEP #$20                                                   ;84AA1E|E220    |      ;
    LDA.W $093A                                                ;84AA20|AD3A09  |00093A;
    CMP.B #$B4                                                 ;84AA23|C9B4    |      ;
    BEQ +                                                      ;84AA25|F007    |84AA2E;
    INC A                                                      ;84AA27|1A      |      ;
    STA.W $093A                                                ;84AA28|8D3A09  |00093A;
    JMP.W .return                                              ;84AA2B|4C4FAA  |84AA4F;
 
 
  + SEP #$20                                                   ;84AA2E|E220    |      ;
    STZ.W $093A                                                ;84AA30|9C3A09  |00093A;
    REP #$30                                                   ;84AA33|C230    |      ;
    SEP #$20                                                   ;84AA35|E220    |      ;
    LDA.B $DE                                                  ;84AA37|A5DE    |0000DE;
    AND.B #$80                                                 ;84AA39|2980    |      ;
    BNE +                                                      ;84AA3B|D003    |84AA40;
    JMP.W .return                                              ;84AA3D|4C4FAA  |84AA4F;
 
 
  + REP #$30                                                   ;84AA40|C230    |      ;
    LDA.W #$0011                                               ;84AA42|A91100  |      ;
    LDX.W #$0000                                               ;84AA45|A20000  |      ;
    LDY.W #$0081                                               ;84AA48|A08100  |      ;
    JSL.L fAI_Unknown84803F                                    ;84AA4B|223F8084|84803F;
 
.return:
    REP #$30                                                   ;84AA4F|C230    |      ;
    LDY.W #$0010                                               ;84AA51|A01000  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84AA54|B7CC    |0000CC;
    CLC                                                        ;84AA56|18      |      ;
    ADC.W #$0001                                               ;84AA57|690100  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84AA5A|97CC    |0000CC;
    RTS                                                        ;84AA5C|60      |      ;
 
 
fAIAction0x34:
    REP #$30                                                   ;84AA5D|C230    |      ;
    REP #$30                                                   ;84AA5F|C230    |      ;
    LDA.B ptrAIActionData                                      ;84AA61|A5C9    |0000C9;
    CLC                                                        ;84AA63|18      |      ;
    ADC.W #$0001                                               ;84AA64|690100  |      ;
    STA.B ptrAIActionData                                      ;84AA67|85C9    |0000C9;
    SEP #$20                                                   ;84AA69|E220    |      ;
    REP #$10                                                   ;84AA6B|C210    |      ;
    LDY.W #$000C                                               ;84AA6D|A00C00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84AA70|B7CC    |0000CC;
    CMP.B #$00                                                 ;84AA72|C900    |      ;
    BNE +                                                      ;84AA74|D003    |84AA79;
    JMP.W .return                                              ;84AA76|4C19AB  |84AB19;
 
 
  + REP #$30                                                   ;84AA79|C230    |      ;
    LDA.B nPlayerAction                                        ;84AA7B|A5D4    |0000D4;
    CMP.W #$000A                                               ;84AA7D|C90A00  |      ;
    BNE +                                                      ;84AA80|D003    |84AA85;
    JMP.W .return                                              ;84AA82|4C19AB  |84AB19;
 
 
  + REP #$30                                                   ;84AA85|C230    |      ;
    LDA.B nPlayerAction                                        ;84AA87|A5D4    |0000D4;
    CMP.W #$000C                                               ;84AA89|C90C00  |      ;
    BNE +                                                      ;84AA8C|D003    |84AA91;
    JMP.W .return                                              ;84AA8E|4C19AB  |84AB19;
 
 
  + REP #$30                                                   ;84AA91|C230    |      ;
    LDA.B nPlayerAction                                        ;84AA93|A5D4    |0000D4;
    CMP.W #$000D                                               ;84AA95|C90D00  |      ;
    BNE +                                                      ;84AA98|D003    |84AA9D;
    JMP.W .return                                              ;84AA9A|4C19AB  |84AB19;
 
 
  + REP #$30                                                   ;84AA9D|C230    |      ;
    LDA.B nPlayerAction                                        ;84AA9F|A5D4    |0000D4;
    CMP.W #$001B                                               ;84AAA1|C91B00  |      ;
    BNE +                                                      ;84AAA4|D003    |84AAA9;
    JMP.W .return                                              ;84AAA6|4C19AB  |84AB19;
 
 
  + REP #$20                                                   ;84AAA9|C220    |      ;
    LDA.B strcPlayerFlags                                      ;84AAAB|A5D2    |0000D2;
    AND.W #$0004                                               ;84AAAD|290400  |      ;
    BNE .return                                                ;84AAB0|D067    |84AB19;
    LDA.L strcDailyFlags.flags4                                ;84AAB2|AF601F7F|7F1F60;
    AND.W #$0006                                               ;84AAB6|290600  |      ;
    BNE .return                                                ;84AAB9|D05E    |84AB19;
    REP #$20                                                   ;84AABB|C220    |      ;
    LDA.W strcJoypad1.newInput                                 ;84AABD|AD2801  |000128;
    BIT.W #$0080                                               ;84AAC0|898000  |      ;
    BNE +                                                      ;84AAC3|D003    |84AAC8;
    JMP.W .return                                              ;84AAC5|4C19AB  |84AB19;
 
 
  + SEP #$20                                                   ;84AAC8|E220    |      ;
    LDA.W $091D                                                ;84AACA|AD1D09  |00091D;
    BEQ +                                                      ;84AACD|F003    |84AAD2;
    JMP.W .return                                              ;84AACF|4C19AB  |84AB19;
 
 
  + SEP #$20                                                   ;84AAD2|E220    |      ;
    REP #$10                                                   ;84AAD4|C210    |      ;
    LDY.W #$003F                                               ;84AAD6|A03F00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84AAD9|B7CC    |0000CC;
    STA.W $0920                                                ;84AADB|8D2009  |000920;
    SEP #$20                                                   ;84AADE|E220    |      ;
    REP #$10                                                   ;84AAE0|C210    |      ;
    LDY.W #$0000                                               ;84AAE2|A00000  |      ;
    LDA.B #$00                                                 ;84AAE5|A900    |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84AAE7|97CC    |0000CC;
    SEP #$20                                                   ;84AAE9|E220    |      ;
    REP #$10                                                   ;84AAEB|C210    |      ;
    LDY.W #$0001                                               ;84AAED|A00100  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84AAF0|B7CC    |0000CC;
    ORA.B #$40                                                 ;84AAF2|0940    |      ;
    SEP #$20                                                   ;84AAF4|E220    |      ;
    REP #$10                                                   ;84AAF6|C210    |      ;
    LDY.W #$0001                                               ;84AAF8|A00100  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84AAFB|97CC    |0000CC;
    REP #$30                                                   ;84AAFD|C230    |      ;
    LDY.W #$0010                                               ;84AAFF|A01000  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84AB02|B7CC    |0000CC;
    CLC                                                        ;84AB04|18      |      ;
    ADC.W #$0001                                               ;84AB05|690100  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84AB08|97CC    |0000CC;
    SEP #$20                                                   ;84AB0A|E220    |      ;
    LDA.B #$07                                                 ;84AB0C|A907    |      ;
    STA.W $091D                                                ;84AB0E|8D1D09  |00091D;
    REP #$30                                                   ;84AB11|C230    |      ;
    LDA.W #$0004                                               ;84AB13|A90400  |      ;
    STA.B nPlayerAction                                        ;84AB16|85D4    |0000D4;
    RTS                                                        ;84AB18|60      |      ;
 
 
.return:
    REP #$30                                                   ;84AB19|C230    |      ;
    LDY.W #$0010                                               ;84AB1B|A01000  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84AB1E|B7CC    |0000CC;
    CLC                                                        ;84AB20|18      |      ;
    ADC.W #$0001                                               ;84AB21|690100  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84AB24|97CC    |0000CC;
    RTS                                                        ;84AB26|60      |      ;
 
 
fAIAction0x35_UpdateHorse:
    REP #$30                                                   ;84AB27|C230    |      ;
    REP #$30                                                   ;84AB29|C230    |      ;
    LDA.B ptrAIActionData                                      ;84AB2B|A5C9    |0000C9;
    CLC                                                        ;84AB2D|18      |      ;
    ADC.W #$0001                                               ;84AB2E|690100  |      ;
    STA.B ptrAIActionData                                      ;84AB31|85C9    |0000C9;
    REP #$20                                                   ;84AB33|C220    |      ;
    LDA.L strcDailyFlags.flags2                                ;84AB35|AF5C1F7F|7F1F5C;
    AND.W #$FFEF                                               ;84AB39|29EFFF  |      ;
    STA.L strcDailyFlags.flags2                                ;84AB3C|8F5C1F7F|7F1F5C;
    SEP #$20                                                   ;84AB40|E220    |      ;
    LDA.L nHorseAge                                            ;84AB42|AF321F7F|7F1F32;
    CMP.B #$15                                                 ;84AB46|C915    |      ;
    BEQ .label1                                                ;84AB48|F029    |84AB73;
    SEP #$20                                                   ;84AB4A|E220    |      ;
    LDA.W $0939                                                ;84AB4C|AD3909  |000939;
    CMP.B #$78                                                 ;84AB4F|C978    |      ;
    BEQ +                                                      ;84AB51|F007    |84AB5A;
    INC A                                                      ;84AB53|1A      |      ;
    STA.W $0939                                                ;84AB54|8D3909  |000939;
    JMP.W .label8                                              ;84AB57|4C88AD  |84AD88;
 
 
  + SEP #$20                                                   ;84AB5A|E220    |      ;
    REP #$10                                                   ;84AB5C|C210    |      ;
    STZ.W $0939                                                ;84AB5E|9C3909  |000939;
    REP #$20                                                   ;84AB61|C220    |      ;
    LDA.W #$0017                                               ;84AB63|A91700  |      ;
    LDX.W #$0000                                               ;84AB66|A20000  |      ;
    LDY.W #$0080                                               ;84AB69|A08000  |      ;
    JSL.L fAI_Unknown84803F                                    ;84AB6C|223F8084|84803F;
    JMP.W .label8                                              ;84AB70|4C88AD  |84AD88;
 
 
.label1:
    REP #$20                                                   ;84AB73|C220    |      ;
    LDA.L strcDailyFlags.flags2                                ;84AB75|AF5C1F7F|7F1F5C;
    AND.W #$0040                                               ;84AB79|294000  |      ;
    BNE +                                                      ;84AB7C|D003    |84AB81;
    JMP.W .loop                                                ;84AB7E|4CDFAB  |84ABDF;
 
 
  + SEP #$20                                                   ;84AB81|E220    |      ;
    REP #$10                                                   ;84AB83|C210    |      ;
    LDY.W #$0002                                               ;84AB85|A00200  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84AB88|B7CC    |0000CC;
    CMP.B #$00                                                 ;84AB8A|C900    |      ;
    BEQ .case0                                                 ;84AB8C|F00C    |84AB9A;
    CMP.B #$01                                                 ;84AB8E|C901    |      ;
    BEQ .case1                                                 ;84AB90|F015    |84ABA7;
    CMP.B #$02                                                 ;84AB92|C902    |      ;
    BEQ .case2                                                 ;84AB94|F01E    |84ABB4;
    CMP.B #$03                                                 ;84AB96|C903    |      ;
    BEQ .case3                                                 ;84AB98|F027    |84ABC1;
 
.case0:
    REP #$20                                                   ;84AB9A|C220    |      ;
    LDA.W #$0017                                               ;84AB9C|A91700  |      ;
    LDX.W #$0000                                               ;84AB9F|A20000  |      ;
    LDY.W #$0028                                               ;84ABA2|A02800  |      ;
    BRA .break                                                 ;84ABA5|8027    |84ABCE;
 
 
.case1:
    REP #$20                                                   ;84ABA7|C220    |      ;
    LDA.W #$0017                                               ;84ABA9|A91700  |      ;
    LDX.W #$0000                                               ;84ABAC|A20000  |      ;
    LDY.W #$0029                                               ;84ABAF|A02900  |      ;
    BRA .break                                                 ;84ABB2|801A    |84ABCE;
 
 
.case2:
    REP #$20                                                   ;84ABB4|C220    |      ;
    LDA.W #$0017                                               ;84ABB6|A91700  |      ;
    LDX.W #$0000                                               ;84ABB9|A20000  |      ;
    LDY.W #$002A                                               ;84ABBC|A02A00  |      ;
    BRA .break                                                 ;84ABBF|800D    |84ABCE;
 
 
.case3:
    REP #$20                                                   ;84ABC1|C220    |      ;
    LDA.W #$0017                                               ;84ABC3|A91700  |      ;
    LDX.W #$0000                                               ;84ABC6|A20000  |      ;
    LDY.W #$002B                                               ;84ABC9|A02B00  |      ;
    BRA .break                                                 ;84ABCC|8000    |84ABCE;
 
 
.break:
    JSL.L fAI_Unknown84803F                                    ;84ABCE|223F8084|84803F;
    REP #$30                                                   ;84ABD2|C230    |      ;
    LDA.L strcDailyFlags.flags2                                ;84ABD4|AF5C1F7F|7F1F5C;
    AND.W #$FFBF                                               ;84ABD8|29BFFF  |      ;
    STA.L strcDailyFlags.flags2                                ;84ABDB|8F5C1F7F|7F1F5C;
 
.loop:
    REP #$30                                                   ;84ABDF|C230    |      ;
    LDA.L strcDailyFlags.flags2                                ;84ABE1|AF5C1F7F|7F1F5C;
    AND.W #$0800                                               ;84ABE5|290008  |      ;
    BEQ +                                                      ;84ABE8|F003    |84ABED;
    JMP.W .label2                                              ;84ABEA|4CEEAC  |84ACEE;
 
 
  + LDA.L strcDailyFlags.flags2                                ;84ABED|AF5C1F7F|7F1F5C;
    AND.W #$0020                                               ;84ABF1|292000  |      ;
    BEQ +                                                      ;84ABF4|F003    |84ABF9;
    JMP.W .label9                                              ;84ABF6|4CA4AD  |84ADA4;
 
 
  + SEP #$20                                                   ;84ABF9|E220    |      ;
    REP #$10                                                   ;84ABFB|C210    |      ;
    LDY.W #$000C                                               ;84ABFD|A00C00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84AC00|B7CC    |0000CC;
    CMP.B #$00                                                 ;84AC02|C900    |      ;
    BNE +                                                      ;84AC04|D003    |84AC09;
    JMP.W .label2                                              ;84AC06|4CEEAC  |84ACEE;
 
 
  + REP #$30                                                   ;84AC09|C230    |      ;
    LDA.B nPlayerAction                                        ;84AC0B|A5D4    |0000D4;
    CMP.W #$000A                                               ;84AC0D|C90A00  |      ;
    BNE +                                                      ;84AC10|D003    |84AC15;
    JMP.W .label2                                              ;84AC12|4CEEAC  |84ACEE;
 
 
  + REP #$30                                                   ;84AC15|C230    |      ;
    LDA.B nPlayerAction                                        ;84AC17|A5D4    |0000D4;
    CMP.W #$000C                                               ;84AC19|C90C00  |      ;
    BNE +                                                      ;84AC1C|D003    |84AC21;
    JMP.W .label2                                              ;84AC1E|4CEEAC  |84ACEE;
 
 
  + REP #$30                                                   ;84AC21|C230    |      ;
    LDA.B nPlayerAction                                        ;84AC23|A5D4    |0000D4;
    CMP.W #$000D                                               ;84AC25|C90D00  |      ;
    BNE +                                                      ;84AC28|D003    |84AC2D;
    JMP.W .label2                                              ;84AC2A|4CEEAC  |84ACEE;
 
 
  + REP #$30                                                   ;84AC2D|C230    |      ;
    LDA.B nPlayerAction                                        ;84AC2F|A5D4    |0000D4;
    CMP.W #$001B                                               ;84AC31|C91B00  |      ;
    BNE +                                                      ;84AC34|D003    |84AC39;
    JMP.W .label2                                              ;84AC36|4CEEAC  |84ACEE;
 
 
  + REP #$20                                                   ;84AC39|C220    |      ;
    LDA.B strcPlayerFlags                                      ;84AC3B|A5D2    |0000D2;
    AND.W #$0004                                               ;84AC3D|290400  |      ;
    BEQ +                                                      ;84AC40|F003    |84AC45;
    JMP.W .label2                                              ;84AC42|4CEEAC  |84ACEE;
 
 
  + LDA.L strcDailyFlags.flags4                                ;84AC45|AF601F7F|7F1F60;
    AND.W #$0006                                               ;84AC49|290600  |      ;
    BEQ +                                                      ;84AC4C|F003    |84AC51;
    JMP.W .label2                                              ;84AC4E|4CEEAC  |84ACEE;
 
 
  + REP #$20                                                   ;84AC51|C220    |      ;
    LDA.L strcDailyFlags.flags2                                ;84AC53|AF5C1F7F|7F1F5C;
    ORA.W #$0010                                               ;84AC57|091000  |      ;
    STA.L strcDailyFlags.flags2                                ;84AC5A|8F5C1F7F|7F1F5C;
    REP #$20                                                   ;84AC5E|C220    |      ;
    LDA.W strcJoypad1.newInput                                 ;84AC60|AD2801  |000128;
    BIT.W #$0080                                               ;84AC63|898000  |      ;
    BNE +                                                      ;84AC66|D003    |84AC6B;
    JMP.W .label2                                              ;84AC68|4CEEAC  |84ACEE;
 
 
  + REP #$30                                                   ;84AC6B|C230    |      ;
    LDA.W #$000D                                               ;84AC6D|A90D00  |      ;
    STA.B $E3                                                  ;84AC70|85E3    |0000E3;
    LDA.B nPlayerPosX                                          ;84AC72|A5D6    |0000D6;
    STA.B $DF                                                  ;84AC74|85DF    |0000DF;
    LDA.B nPlayerPosY                                          ;84AC76|A5D8    |0000D8;
    STA.B $E1                                                  ;84AC78|85E1    |0000E1;
    STZ.B $E5                                                  ;84AC7A|64E5    |0000E5;
    STZ.B $E7                                                  ;84AC7C|64E7    |0000E7;
    LDA.W $0913                                                ;84AC7E|AD1309  |000913;
    JSL.L fGameEngine_Unknown83AF37                            ;84AC81|2237AF83|83AF37;
    REP #$30                                                   ;84AC85|C230    |      ;
    BEQ +                                                      ;84AC87|F003    |84AC8C;
    JMP.W .label2                                              ;84AC89|4CEEAC  |84ACEE;
 
 
  + LDA.B $E9                                                  ;84AC8C|A5E9    |0000E9;
    SEC                                                        ;84AC8E|38      |      ;
    SBC.W #$00C0                                               ;84AC8F|E9C000  |      ;
    CMP.W #$0010                                               ;84AC92|C91000  |      ;
    BCS +                                                      ;84AC95|B003    |84AC9A;
    JMP.W .label2                                              ;84AC97|4CEEAC  |84ACEE;
 
 
  + LDA.B $EB                                                  ;84AC9A|A5EB    |0000EB;
    SEC                                                        ;84AC9C|38      |      ;
    SBC.W #$00C0                                               ;84AC9D|E9C000  |      ;
    CMP.W #$0010                                               ;84ACA0|C91000  |      ;
    BCS +                                                      ;84ACA3|B003    |84ACA8;
    JMP.W .label2                                              ;84ACA5|4CEEAC  |84ACEE;
 
 
  + REP #$20                                                   ;84ACA8|C220    |      ;
    LDA.W #$0020                                               ;84ACAA|A92000  |      ;
    STA.B $E3                                                  ;84ACAD|85E3    |0000E3;
    LDA.W $0913                                                ;84ACAF|AD1309  |000913;
    JSL.L fGameEngine_Unknown83AD91                            ;84ACB2|2291AD83|83AD91;
    REP #$30                                                   ;84ACB6|C230    |      ;
    CMP.W #$0000                                               ;84ACB8|C90000  |      ;
    BEQ +                                                      ;84ACBB|F003    |84ACC0;
    JMP.W .label2                                              ;84ACBD|4CEEAC  |84ACEE;
 
 
  + REP #$30                                                   ;84ACC0|C230    |      ;
    LDA.B strcPlayerFlags                                      ;84ACC2|A5D2    |0000D2;
    AND.W #$0002                                               ;84ACC4|290200  |      ;
    BEQ +                                                      ;84ACC7|F003    |84ACCC;
    JMP.W .label8                                              ;84ACC9|4C88AD  |84AD88;
 
 
  + REP #$30                                                   ;84ACCC|C230    |      ;
    LDA.B strcPlayerFlags                                      ;84ACCE|A5D2    |0000D2;
    AND.W #$0800                                               ;84ACD0|290008  |      ;
    BEQ +                                                      ;84ACD3|F003    |84ACD8;
    JMP.W .label8                                              ;84ACD5|4C88AD  |84AD88;
 
 
  + REP #$30                                                   ;84ACD8|C230    |      ;
    LDA.B nPlayerAction                                        ;84ACDA|A5D4    |0000D4;
    CMP.W #$0004                                               ;84ACDC|C90400  |      ;
    BNE +                                                      ;84ACDF|D003    |84ACE4;
    JMP.W .label8                                              ;84ACE1|4C88AD  |84AD88;
 
 
  + REP #$30                                                   ;84ACE4|C230    |      ;
    LDA.W #$0017                                               ;84ACE6|A91700  |      ;
    STA.B nPlayerAction                                        ;84ACE9|85D4    |0000D4;
    JMP.W .label8                                              ;84ACEB|4C88AD  |84AD88;
 
 
.label2:
    REP #$30                                                   ;84ACEE|C230    |      ;
    LDA.L strcDailyFlags.flags2                                ;84ACF0|AF5C1F7F|7F1F5C;
    AND.W #$F7FF                                               ;84ACF4|29FFF7  |      ;
    STA.L strcDailyFlags.flags2                                ;84ACF7|8F5C1F7F|7F1F5C;
    SEP #$20                                                   ;84ACFB|E220    |      ;
    LDA.W $0939                                                ;84ACFD|AD3909  |000939;
    CMP.B #$78                                                 ;84AD00|C978    |      ;
    BEQ +                                                      ;84AD02|F007    |84AD0B;
    INC A                                                      ;84AD04|1A      |      ;
    STA.W $0939                                                ;84AD05|8D3909  |000939;
    JMP.W .label8                                              ;84AD08|4C88AD  |84AD88;
 
 
  + SEP #$20                                                   ;84AD0B|E220    |      ;
    STZ.W $0939                                                ;84AD0D|9C3909  |000939;
    SEP #$20                                                   ;84AD10|E220    |      ;
    LDA.B $DE                                                  ;84AD12|A5DE    |0000DE;
    CMP.B #$24                                                 ;84AD14|C924    |      ;
    BCC .label3                                                ;84AD16|9016    |84AD2E;
    CMP.B #$48                                                 ;84AD18|C948    |      ;
    BCC .label3                                                ;84AD1A|9012    |84AD2E;
    CMP.B #$6C                                                 ;84AD1C|C96C    |      ;
    BCC .label4                                                ;84AD1E|9020    |84AD40;
    CMP.B #$90                                                 ;84AD20|C990    |      ;
    BCC .label5                                                ;84AD22|902E    |84AD52;
    CMP.B #$B4                                                 ;84AD24|C9B4    |      ;
    BCC .label6                                                ;84AD26|903C    |84AD64;
    CMP.B #$D8                                                 ;84AD28|C9D8    |      ;
    BCC .label6                                                ;84AD2A|9038    |84AD64;
    BRA .label7                                                ;84AD2C|8048    |84AD76;
 
 
.label3:
    REP #$30                                                   ;84AD2E|C230    |      ;
    LDA.W #$0017                                               ;84AD30|A91700  |      ;
    LDX.W #$0000                                               ;84AD33|A20000  |      ;
    LDY.W #$004B                                               ;84AD36|A04B00  |      ;
    JSL.L fAI_Unknown84803F                                    ;84AD39|223F8084|84803F;
    JMP.W .label8                                              ;84AD3D|4C88AD  |84AD88;
 
 
.label4:
    REP #$30                                                   ;84AD40|C230    |      ;
    LDA.W #$0017                                               ;84AD42|A91700  |      ;
    LDX.W #$0000                                               ;84AD45|A20000  |      ;
    LDY.W #$004D                                               ;84AD48|A04D00  |      ;
    JSL.L fAI_Unknown84803F                                    ;84AD4B|223F8084|84803F;
    JMP.W .label8                                              ;84AD4F|4C88AD  |84AD88;
 
 
.label5:
    REP #$30                                                   ;84AD52|C230    |      ;
    LDA.W #$0017                                               ;84AD54|A91700  |      ;
    LDX.W #$0000                                               ;84AD57|A20000  |      ;
    LDY.W #$004E                                               ;84AD5A|A04E00  |      ;
    JSL.L fAI_Unknown84803F                                    ;84AD5D|223F8084|84803F;
    JMP.W .label8                                              ;84AD61|4C88AD  |84AD88;
 
 
.label6:
    REP #$30                                                   ;84AD64|C230    |      ;
    LDA.W #$0017                                               ;84AD66|A91700  |      ;
    LDX.W #$0000                                               ;84AD69|A20000  |      ;
    LDY.W #$004F                                               ;84AD6C|A04F00  |      ;
    JSL.L fAI_Unknown84803F                                    ;84AD6F|223F8084|84803F;
    JMP.W .label8                                              ;84AD73|4C88AD  |84AD88;
 
 
.label7:
    REP #$30                                                   ;84AD76|C230    |      ;
    LDA.W #$0017                                               ;84AD78|A91700  |      ;
    LDX.W #$0000                                               ;84AD7B|A20000  |      ;
    LDY.W #$0050                                               ;84AD7E|A05000  |      ;
    JSL.L fAI_Unknown84803F                                    ;84AD81|223F8084|84803F;
    JMP.W .label8                                              ;84AD85|4C88AD  |84AD88;
 
 
.label8:
    REP #$30                                                   ;84AD88|C230    |      ;
    LDA.L strcDailyFlags.flags2                                ;84AD8A|AF5C1F7F|7F1F5C;
    AND.W #$0400                                               ;84AD8E|290004  |      ;
    BEQ .loop2                                                 ;84AD91|F003    |84AD96;
    JMP.W .label10                                             ;84AD93|4CF2AD  |84ADF2;
 
 
.loop2:
    REP #$30                                                   ;84AD96|C230    |      ;
    LDY.W #$0010                                               ;84AD98|A01000  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84AD9B|B7CC    |0000CC;
    CLC                                                        ;84AD9D|18      |      ;
    ADC.W #$0001                                               ;84AD9E|690100  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84ADA1|97CC    |0000CC;
    RTS                                                        ;84ADA3|60      |      ;
 
 
.label9:
    REP #$30                                                   ;84ADA4|C230    |      ;
    LDA.B strcPlayerFlags                                      ;84ADA6|A5D2    |0000D2;
    ORA.W #$0010                                               ;84ADA8|091000  |      ;
    STA.B strcPlayerFlags                                      ;84ADAB|85D2    |0000D2;
    REP #$20                                                   ;84ADAD|C220    |      ;
    LDA.L strcDailyFlags.flags2                                ;84ADAF|AF5C1F7F|7F1F5C;
    AND.W #$FFDF                                               ;84ADB3|29DFFF  |      ;
    STA.L strcDailyFlags.flags2                                ;84ADB6|8F5C1F7F|7F1F5C;
    SEP #$20                                                   ;84ADBA|E220    |      ;
    REP #$10                                                   ;84ADBC|C210    |      ;
    LDY.W #$0000                                               ;84ADBE|A00000  |      ;
    LDA.B #$00                                                 ;84ADC1|A900    |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84ADC3|97CC    |0000CC;
    SEP #$20                                                   ;84ADC5|E220    |      ;
    REP #$10                                                   ;84ADC7|C210    |      ;
    LDY.W #$0001                                               ;84ADC9|A00100  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84ADCC|B7CC    |0000CC;
    ORA.B #$40                                                 ;84ADCE|0940    |      ;
    SEP #$20                                                   ;84ADD0|E220    |      ;
    REP #$10                                                   ;84ADD2|C210    |      ;
    LDY.W #$0001                                               ;84ADD4|A00100  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84ADD7|97CC    |0000CC;
    SEP #$20                                                   ;84ADD9|E220    |      ;
    REP #$10                                                   ;84ADDB|C210    |      ;
    LDY.W #$000C                                               ;84ADDD|A00C00  |      ;
    LDA.B #$00                                                 ;84ADE0|A900    |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84ADE2|97CC    |0000CC;
    REP #$30                                                   ;84ADE4|C230    |      ;
    LDY.W #$0010                                               ;84ADE6|A01000  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84ADE9|B7CC    |0000CC;
    CLC                                                        ;84ADEB|18      |      ;
    ADC.W #$0001                                               ;84ADEC|690100  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84ADEF|97CC    |0000CC;
    RTS                                                        ;84ADF1|60      |      ;
 
 
.label10:
    SEP #$20                                                   ;84ADF2|E220    |      ;
    REP #$10                                                   ;84ADF4|C210    |      ;
    LDA.L nHorseAge                                            ;84ADF6|AF321F7F|7F1F32;
    CMP.B #$15                                                 ;84ADFA|C915    |      ;
    BEQ +                                                      ;84ADFC|F003    |84AE01;
    JMP.W .label11                                             ;84ADFE|4C35AE  |84AE35;
 
 
  + STZ.W $0939                                                ;84AE01|9C3909  |000939;
    SEP #$20                                                   ;84AE04|E220    |      ;
    REP #$10                                                   ;84AE06|C210    |      ;
    LDY.W #$0001                                               ;84AE08|A00100  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84AE0B|B7CC    |0000CC;
    ORA.B #$28                                                 ;84AE0D|0928    |      ;
    SEP #$20                                                   ;84AE0F|E220    |      ;
    REP #$10                                                   ;84AE11|C210    |      ;
    LDY.W #$0001                                               ;84AE13|A00100  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84AE16|97CC    |0000CC;
    REP #$30                                                   ;84AE18|C230    |      ;
    SEP #$20                                                   ;84AE1A|E220    |      ;
    REP #$10                                                   ;84AE1C|C210    |      ;
    LDY.W #$003F                                               ;84AE1E|A03F00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84AE21|B7CC    |0000CC;
    XBA                                                        ;84AE23|EB      |      ;
    LDA.B #$00                                                 ;84AE24|A900    |      ;
    XBA                                                        ;84AE26|EB      |      ;
    REP #$20                                                   ;84AE27|C220    |      ;
    LDX.W #$0000                                               ;84AE29|A20000  |      ;
    LDY.W #$004C                                               ;84AE2C|A04C00  |      ;
    JSL.L fAI_Unknown84803F                                    ;84AE2F|223F8084|84803F;
    BRA .label12                                               ;84AE33|8034    |84AE69;
 
 
.label11:
    STZ.W $0939                                                ;84AE35|9C3909  |000939;
    SEP #$20                                                   ;84AE38|E220    |      ;
    REP #$10                                                   ;84AE3A|C210    |      ;
    LDY.W #$0001                                               ;84AE3C|A00100  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84AE3F|B7CC    |0000CC;
    ORA.B #$28                                                 ;84AE41|0928    |      ;
    SEP #$20                                                   ;84AE43|E220    |      ;
    REP #$10                                                   ;84AE45|C210    |      ;
    LDY.W #$0001                                               ;84AE47|A00100  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84AE4A|97CC    |0000CC;
    REP #$30                                                   ;84AE4C|C230    |      ;
    SEP #$20                                                   ;84AE4E|E220    |      ;
    REP #$10                                                   ;84AE50|C210    |      ;
    LDY.W #$003F                                               ;84AE52|A03F00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84AE55|B7CC    |0000CC;
    XBA                                                        ;84AE57|EB      |      ;
    LDA.B #$00                                                 ;84AE58|A900    |      ;
    XBA                                                        ;84AE5A|EB      |      ;
    REP #$20                                                   ;84AE5B|C220    |      ;
    LDX.W #$0000                                               ;84AE5D|A20000  |      ;
    LDY.W #$004A                                               ;84AE60|A04A00  |      ;
    JSL.L fAI_Unknown84803F                                    ;84AE63|223F8084|84803F;
    BRA .label12                                               ;84AE67|8000    |84AE69;
 
 
.label12:
    REP #$30                                                   ;84AE69|C230    |      ;
    STZ.B n16TempVar3                                          ;84AE6B|6482    |000082;
    STZ.B n16TempVar4                                          ;84AE6D|6484    |000084;
    REP #$30                                                   ;84AE6F|C230    |      ;
    LDY.W #$001A                                               ;84AE71|A01A00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84AE74|B7CC    |0000CC;
    SEC                                                        ;84AE76|38      |      ;
    SBC.B nPlayerPosX                                          ;84AE77|E5D6    |0000D6;
    STA.B n16TempVar1                                          ;84AE79|857E    |00007E;
    BMI +                                                      ;84AE7B|3002    |84AE7F;
    BRA .label13                                               ;84AE7D|800D    |84AE8C;
 
 
  + REP #$20                                                   ;84AE7F|C220    |      ;
    EOR.W #$FFFF                                               ;84AE81|49FFFF  |      ;
    INC A                                                      ;84AE84|1A      |      ;
    STA.B n16TempVar1                                          ;84AE85|857E    |00007E;
    LDA.W #$0001                                               ;84AE87|A90100  |      ;
    STA.B n16TempVar3                                          ;84AE8A|8582    |000082;
 
.label13:
    REP #$30                                                   ;84AE8C|C230    |      ;
    LDY.W #$001C                                               ;84AE8E|A01C00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84AE91|B7CC    |0000CC;
    SEC                                                        ;84AE93|38      |      ;
    SBC.B nPlayerPosY                                          ;84AE94|E5D8    |0000D8;
    STA.B n16TempVar2                                          ;84AE96|8580    |000080;
    BMI +                                                      ;84AE98|3002    |84AE9C;
    BRA .label14                                               ;84AE9A|800D    |84AEA9;
 
 
  + REP #$20                                                   ;84AE9C|C220    |      ;
    EOR.W #$FFFF                                               ;84AE9E|49FFFF  |      ;
    INC A                                                      ;84AEA1|1A      |      ;
    STA.B n16TempVar2                                          ;84AEA2|8580    |000080;
    LDA.W #$0001                                               ;84AEA4|A90100  |      ;
    STA.B n16TempVar4                                          ;84AEA7|8584    |000084;
 
.label14:
    SEP #$20                                                   ;84AEA9|E220    |      ;
    LDA.B #$20                                                 ;84AEAB|A920    |      ;
    SEP #$20                                                   ;84AEAD|E220    |      ;
    REP #$10                                                   ;84AEAF|C210    |      ;
    LDY.W #$0008                                               ;84AEB1|A00800  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84AEB4|97CC    |0000CC;
    REP #$20                                                   ;84AEB6|C220    |      ;
    LDA.B n16TempVar2                                          ;84AEB8|A580    |000080;
    CMP.B n16TempVar1                                          ;84AEBA|C57E    |00007E;
    BCS .label15                                               ;84AEBC|B008    |84AEC6;
    REP #$20                                                   ;84AEBE|C220    |      ;
    LDA.B n16TempVar3                                          ;84AEC0|A582    |000082;
    BEQ .label19                                               ;84AEC2|F034    |84AEF8;
    BRA .label18                                               ;84AEC4|8024    |84AEEA;
 
 
.label15:
    REP #$20                                                   ;84AEC6|C220    |      ;
    LDA.B n16TempVar4                                          ;84AEC8|A584    |000084;
    BEQ .label17                                               ;84AECA|F010    |84AEDC;
    BRA .label16                                               ;84AECC|8000    |84AECE;
 
 
.label16:
    SEP #$20                                                   ;84AECE|E220    |      ;
    REP #$10                                                   ;84AED0|C210    |      ;
    LDY.W #$000F                                               ;84AED2|A00F00  |      ;
    LDA.B #$01                                                 ;84AED5|A901    |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84AED7|97CC    |0000CC;
    JMP.W .loop2                                               ;84AED9|4C96AD  |84AD96;
 
 
.label17:
    SEP #$20                                                   ;84AEDC|E220    |      ;
    REP #$10                                                   ;84AEDE|C210    |      ;
    LDY.W #$000F                                               ;84AEE0|A00F00  |      ;
    LDA.B #$02                                                 ;84AEE3|A902    |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84AEE5|97CC    |0000CC;
    JMP.W .loop2                                               ;84AEE7|4C96AD  |84AD96;
 
 
.label18:
    SEP #$20                                                   ;84AEEA|E220    |      ;
    REP #$10                                                   ;84AEEC|C210    |      ;
    LDY.W #$000F                                               ;84AEEE|A00F00  |      ;
    LDA.B #$04                                                 ;84AEF1|A904    |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84AEF3|97CC    |0000CC;
    JMP.W .loop2                                               ;84AEF5|4C96AD  |84AD96;
 
 
.label19:
    SEP #$20                                                   ;84AEF8|E220    |      ;
    REP #$10                                                   ;84AEFA|C210    |      ;
    LDY.W #$000F                                               ;84AEFC|A00F00  |      ;
    LDA.B #$08                                                 ;84AEFF|A908    |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84AF01|97CC    |0000CC;
    JMP.W .loop2                                               ;84AF03|4C96AD  |84AD96;
 
 
fAIAction0x36_UpdateDog:
    REP #$30                                                   ;84AF06|C230    |      ;
    REP #$30                                                   ;84AF08|C230    |      ;
    LDA.B ptrAIActionData                                      ;84AF0A|A5C9    |0000C9;
    CLC                                                        ;84AF0C|18      |      ;
    ADC.W #$0001                                               ;84AF0D|690100  |      ;
    STA.B ptrAIActionData                                      ;84AF10|85C9    |0000C9;
    REP #$30                                                   ;84AF12|C230    |      ;
    LDY.W #$001A                                               ;84AF14|A01A00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84AF17|B7CC    |0000CC;
    STA.L nDogX                                                ;84AF19|8F2C1F7F|7F1F2C;
    REP #$30                                                   ;84AF1D|C230    |      ;
    LDY.W #$001C                                               ;84AF1F|A01C00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84AF22|B7CC    |0000CC;
    STA.L nDogY                                                ;84AF24|8F2E1F7F|7F1F2E;
    SEP #$20                                                   ;84AF28|E220    |      ;
    REP #$10                                                   ;84AF2A|C210    |      ;
    LDY.W #$000C                                               ;84AF2C|A00C00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84AF2F|B7CC    |0000CC;
    CMP.B #$00                                                 ;84AF31|C900    |      ;
    BNE +                                                      ;84AF33|D003    |84AF38;
    JMP.W .label1                                              ;84AF35|4CF4AF  |84AFF4;
 
 
  + REP #$30                                                   ;84AF38|C230    |      ;
    LDA.B nPlayerAction                                        ;84AF3A|A5D4    |0000D4;
    CMP.W #$000A                                               ;84AF3C|C90A00  |      ;
    BNE +                                                      ;84AF3F|D003    |84AF44;
    JMP.W .label1                                              ;84AF41|4CF4AF  |84AFF4;
 
 
  + REP #$30                                                   ;84AF44|C230    |      ;
    LDA.B nPlayerAction                                        ;84AF46|A5D4    |0000D4;
    CMP.W #$000C                                               ;84AF48|C90C00  |      ;
    BNE +                                                      ;84AF4B|D003    |84AF50;
    JMP.W .label1                                              ;84AF4D|4CF4AF  |84AFF4;
 
 
  + REP #$30                                                   ;84AF50|C230    |      ;
    LDA.B nPlayerAction                                        ;84AF52|A5D4    |0000D4;
    CMP.W #$000D                                               ;84AF54|C90D00  |      ;
    BNE +                                                      ;84AF57|D003    |84AF5C;
    JMP.W .label1                                              ;84AF59|4CF4AF  |84AFF4;
 
 
  + REP #$30                                                   ;84AF5C|C230    |      ;
    LDA.B nPlayerAction                                        ;84AF5E|A5D4    |0000D4;
    CMP.W #$001B                                               ;84AF60|C91B00  |      ;
    BNE +                                                      ;84AF63|D003    |84AF68;
    JMP.W .label1                                              ;84AF65|4CF4AF  |84AFF4;
 
 
  + REP #$20                                                   ;84AF68|C220    |      ;
    LDA.B strcPlayerFlags                                      ;84AF6A|A5D2    |0000D2;
    AND.W #$0004                                               ;84AF6C|290400  |      ;
    BEQ +                                                      ;84AF6F|F003    |84AF74;
    JMP.W .label1                                              ;84AF71|4CF4AF  |84AFF4;
 
 
  + LDA.L strcDailyFlags.flags4                                ;84AF74|AF601F7F|7F1F60;
    AND.W #$0006                                               ;84AF78|290600  |      ;
    BNE .label1                                                ;84AF7B|D077    |84AFF4;
    REP #$20                                                   ;84AF7D|C220    |      ;
    LDA.W strcJoypad1.newInput                                 ;84AF7F|AD2801  |000128;
    BIT.W #$0080                                               ;84AF82|898000  |      ;
    BNE +                                                      ;84AF85|D003    |84AF8A;
    JMP.W .label1                                              ;84AF87|4CF4AF  |84AFF4;
 
 
  + SEP #$20                                                   ;84AF8A|E220    |      ;
    LDA.W $091D                                                ;84AF8C|AD1D09  |00091D;
    BEQ +                                                      ;84AF8F|F003    |84AF94;
    JMP.W .label1                                              ;84AF91|4CF4AF  |84AFF4;
 
 
  + REP #$30                                                   ;84AF94|C230    |      ;
    LDA.B strcPlayerFlags                                      ;84AF96|A5D2    |0000D2;
    AND.W #$0800                                               ;84AF98|290008  |      ;
    BEQ +                                                      ;84AF9B|F003    |84AFA0;
    JMP.W .label1                                              ;84AF9D|4CF4AF  |84AFF4;
 
 
  + LDA.B strcPlayerFlags                                      ;84AFA0|A5D2    |0000D2;
    AND.W #$0010                                               ;84AFA2|291000  |      ;
    BEQ +                                                      ;84AFA5|F003    |84AFAA;
    JMP.W .label1                                              ;84AFA7|4CF4AF  |84AFF4;
 
 
  + LDA.B nPlayerAction                                        ;84AFAA|A5D4    |0000D4;
    CMP.W #$0017                                               ;84AFAC|C91700  |      ;
    BNE +                                                      ;84AFAF|D003    |84AFB4;
    JMP.W .label1                                              ;84AFB1|4CF4AF  |84AFF4;
 
 
  + LDA.B nPlayerAction                                        ;84AFB4|A5D4    |0000D4;
    CMP.W #$0004                                               ;84AFB6|C90400  |      ;
    BNE +                                                      ;84AFB9|D003    |84AFBE;
    JMP.W .label1                                              ;84AFBB|4CF4AF  |84AFF4;
 
 
  + SEP #$20                                                   ;84AFBE|E220    |      ;
    REP #$10                                                   ;84AFC0|C210    |      ;
    LDY.W #$0000                                               ;84AFC2|A00000  |      ;
    LDA.B #$00                                                 ;84AFC5|A900    |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84AFC7|97CC    |0000CC;
    SEP #$20                                                   ;84AFC9|E220    |      ;
    REP #$10                                                   ;84AFCB|C210    |      ;
    LDY.W #$0001                                               ;84AFCD|A00100  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84AFD0|B7CC    |0000CC;
    ORA.B #$40                                                 ;84AFD2|0940    |      ;
    SEP #$20                                                   ;84AFD4|E220    |      ;
    REP #$10                                                   ;84AFD6|C210    |      ;
    LDY.W #$0001                                               ;84AFD8|A00100  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84AFDB|97CC    |0000CC;
    REP #$30                                                   ;84AFDD|C230    |      ;
    LDA.B strcPlayerFlags                                      ;84AFDF|A5D2    |0000D2;
    ORA.W #$0800                                               ;84AFE1|090008  |      ;
    STA.B strcPlayerFlags                                      ;84AFE4|85D2    |0000D2;
    REP #$30                                                   ;84AFE6|C230    |      ;
    LDA.L nDogHugs                                             ;84AFE8|AF521F7F|7F1F52;
    INC A                                                      ;84AFEC|1A      |      ;
    STA.L nDogHugs                                             ;84AFED|8F521F7F|7F1F52;
    JMP.W .label24                                             ;84AFF1|4C5CB2  |84B25C;
 
 
.label1:
    SEP #$20                                                   ;84AFF4|E220    |      ;
    LDA.W $0938                                                ;84AFF6|AD3809  |000938;
    CMP.B #$78                                                 ;84AFF9|C978    |      ;
    BEQ +                                                      ;84AFFB|F007    |84B004;
    INC A                                                      ;84AFFD|1A      |      ;
    STA.W $0938                                                ;84AFFE|8D3809  |000938;
    JMP.W .label24                                             ;84B001|4C5CB2  |84B25C;
 
 
  + SEP #$20                                                   ;84B004|E220    |      ;
    STZ.W $0938                                                ;84B006|9C3809  |000938;
    REP #$30                                                   ;84B009|C230    |      ;
    LDA.L $7F1F58                                              ;84B00B|AF581F7F|7F1F58;
    AND.W #$0001                                               ;84B00F|290100  |      ;
    BNE .label2                                                ;84B012|D033    |84B047;
    LDA.L $7F1F58                                              ;84B014|AF581F7F|7F1F58;
    AND.W #$0002                                               ;84B018|290200  |      ;
    BEQ +                                                      ;84B01B|F003    |84B020;
    JMP.W .label11                                             ;84B01D|4CFEB0  |84B0FE;
 
 
  + LDA.L $7F1F58                                              ;84B020|AF581F7F|7F1F58;
    AND.W #$0004                                               ;84B024|290400  |      ;
    BEQ +                                                      ;84B027|F003    |84B02C;
    JMP.W .label16                                             ;84B029|4C7FB1  |84B17F;
 
 
  + LDA.L $7F1F58                                              ;84B02C|AF581F7F|7F1F58;
    AND.W #$0008                                               ;84B030|290800  |      ;
    BEQ +                                                      ;84B033|F003    |84B038;
    JMP.W .label20                                             ;84B035|4CEAB1  |84B1EA;
 
 
  + LDA.L $7F1F58                                              ;84B038|AF581F7F|7F1F58;
    AND.W #$0010                                               ;84B03C|291000  |      ;
    BEQ +                                                      ;84B03F|F003    |84B044;
    JMP.W .label23                                             ;84B041|4C2DB2  |84B22D;
 
 
  + JMP.W .label24                                             ;84B044|4C5CB2  |84B25C;
 
 
.label2:
    REP #$30                                                   ;84B047|C230    |      ;
    SEP #$20                                                   ;84B049|E220    |      ;
    LDA.B $DE                                                  ;84B04B|A5DE    |0000DE;
    CMP.B #$40                                                 ;84B04D|C940    |      ;
    BCC .label3                                                ;84B04F|900B    |84B05C;
    CMP.B #$80                                                 ;84B051|C980    |      ;
    BCC .label4                                                ;84B053|9029    |84B07E;
    CMP.B #$C0                                                 ;84B055|C9C0    |      ;
    BCC .label4                                                ;84B057|9025    |84B07E;
    JMP.W .label24                                             ;84B059|4C5CB2  |84B25C;
 
 
.label3:
    REP #$30                                                   ;84B05C|C230    |      ;
    LDA.W #$0016                                               ;84B05E|A91600  |      ;
    LDX.W #$0000                                               ;84B061|A20000  |      ;
    LDY.W #$003D                                               ;84B064|A03D00  |      ;
    JSL.L fAI_Unknown84803F                                    ;84B067|223F8084|84803F;
    REP #$30                                                   ;84B06B|C230    |      ;
    LDA.L $7F1F58                                              ;84B06D|AF581F7F|7F1F58;
    AND.W #$FFFE                                               ;84B071|29FEFF  |      ;
    ORA.W #$0002                                               ;84B074|090200  |      ;
    STA.L $7F1F58                                              ;84B077|8F581F7F|7F1F58;
    JMP.W .label24                                             ;84B07B|4C5CB2  |84B25C;
 
 
.label4:
    REP #$30                                                   ;84B07E|C230    |      ;
    SEP #$20                                                   ;84B080|E220    |      ;
    LDA.B $DE                                                  ;84B082|A5DE    |0000DE;
    CMP.B #$33                                                 ;84B084|C933    |      ;
    BCC .label6                                                ;84B086|9021    |84B0A9;
    CMP.B #$66                                                 ;84B088|C966    |      ;
    BCC .label7                                                ;84B08A|902E    |84B0BA;
    CMP.B #$99                                                 ;84B08C|C999    |      ;
    BCC .label8                                                ;84B08E|903B    |84B0CB;
    CMP.B #$CC                                                 ;84B090|C9CC    |      ;
    BCC .label9                                                ;84B092|9048    |84B0DC;
    BRA .label10                                               ;84B094|8057    |84B0ED;
 
 
.loop:
    REP #$30                                                   ;84B096|C230    |      ;
    LDA.L $7F1F58                                              ;84B098|AF581F7F|7F1F58;
    AND.W #$FFFE                                               ;84B09C|29FEFF  |      ;
    ORA.W #$0010                                               ;84B09F|091000  |      ;
    STA.L $7F1F58                                              ;84B0A2|8F581F7F|7F1F58;
    JMP.W .label24                                             ;84B0A6|4C5CB2  |84B25C;
 
 
.label6:
    REP #$30                                                   ;84B0A9|C230    |      ;
    LDA.W #$0016                                               ;84B0AB|A91600  |      ;
    LDX.W #$0000                                               ;84B0AE|A20000  |      ;
    LDY.W #$003E                                               ;84B0B1|A03E00  |      ;
    JSL.L fAI_Unknown84803F                                    ;84B0B4|223F8084|84803F;
    BRA .loop                                                  ;84B0B8|80DC    |84B096;
 
 
.label7:
    REP #$30                                                   ;84B0BA|C230    |      ;
    LDA.W #$0016                                               ;84B0BC|A91600  |      ;
    LDX.W #$0000                                               ;84B0BF|A20000  |      ;
    LDY.W #$0040                                               ;84B0C2|A04000  |      ;
    JSL.L fAI_Unknown84803F                                    ;84B0C5|223F8084|84803F;
    BRA .loop                                                  ;84B0C9|80CB    |84B096;
 
 
.label8:
    REP #$30                                                   ;84B0CB|C230    |      ;
    LDA.W #$0016                                               ;84B0CD|A91600  |      ;
    LDX.W #$0000                                               ;84B0D0|A20000  |      ;
    LDY.W #$0040                                               ;84B0D3|A04000  |      ;
    JSL.L fAI_Unknown84803F                                    ;84B0D6|223F8084|84803F;
    BRA .loop                                                  ;84B0DA|80BA    |84B096;
 
 
.label9:
    REP #$30                                                   ;84B0DC|C230    |      ;
    LDA.W #$0016                                               ;84B0DE|A91600  |      ;
    LDX.W #$0000                                               ;84B0E1|A20000  |      ;
    LDY.W #$0047                                               ;84B0E4|A04700  |      ;
    JSL.L fAI_Unknown84803F                                    ;84B0E7|223F8084|84803F;
    BRA .loop                                                  ;84B0EB|80A9    |84B096;
 
 
.label10:
    REP #$30                                                   ;84B0ED|C230    |      ;
    LDA.W #$0016                                               ;84B0EF|A91600  |      ;
    LDX.W #$0000                                               ;84B0F2|A20000  |      ;
    LDY.W #$0048                                               ;84B0F5|A04800  |      ;
    JSL.L fAI_Unknown84803F                                    ;84B0F8|223F8084|84803F;
    BRA .loop                                                  ;84B0FC|8098    |84B096;
 
 
.label11:
    REP #$30                                                   ;84B0FE|C230    |      ;
    SEP #$20                                                   ;84B100|E220    |      ;
    LDA.B $DE                                                  ;84B102|A5DE    |0000DE;
    CMP.B #$2A                                                 ;84B104|C92A    |      ;
    BCC .label12                                               ;84B106|900F    |84B117;
    CMP.B #$54                                                 ;84B108|C954    |      ;
    BCC .label13                                               ;84B10A|902D    |84B139;
    CMP.B #$7E                                                 ;84B10C|C97E    |      ;
    BCC .label14                                               ;84B10E|904B    |84B15B;
    CMP.B #$A8                                                 ;84B110|C9A8    |      ;
    BCC .label15                                               ;84B112|9059    |84B16D;
    JMP.W .label24                                             ;84B114|4C5CB2  |84B25C;
 
 
.label12:
    REP #$30                                                   ;84B117|C230    |      ;
    LDA.W #$0016                                               ;84B119|A91600  |      ;
    LDX.W #$0000                                               ;84B11C|A20000  |      ;
    LDY.W #$003C                                               ;84B11F|A03C00  |      ;
    JSL.L fAI_Unknown84803F                                    ;84B122|223F8084|84803F;
    REP #$30                                                   ;84B126|C230    |      ;
    LDA.L $7F1F58                                              ;84B128|AF581F7F|7F1F58;
    AND.W #$FFFD                                               ;84B12C|29FDFF  |      ;
    ORA.W #$0001                                               ;84B12F|090100  |      ;
    STA.L $7F1F58                                              ;84B132|8F581F7F|7F1F58;
    JMP.W .label24                                             ;84B136|4C5CB2  |84B25C;
 
 
.label13:
    REP #$30                                                   ;84B139|C230    |      ;
    LDA.W #$0016                                               ;84B13B|A91600  |      ;
    LDX.W #$0000                                               ;84B13E|A20000  |      ;
    LDY.W #$0041                                               ;84B141|A04100  |      ;
    JSL.L fAI_Unknown84803F                                    ;84B144|223F8084|84803F;
    REP #$30                                                   ;84B148|C230    |      ;
    LDA.L $7F1F58                                              ;84B14A|AF581F7F|7F1F58;
    AND.W #$FFFD                                               ;84B14E|29FDFF  |      ;
    ORA.W #$0004                                               ;84B151|090400  |      ;
    STA.L $7F1F58                                              ;84B154|8F581F7F|7F1F58;
    JMP.W .label24                                             ;84B158|4C5CB2  |84B25C;
 
 
.label14:
    REP #$30                                                   ;84B15B|C230    |      ;
    LDA.W #$0016                                               ;84B15D|A91600  |      ;
    LDX.W #$0000                                               ;84B160|A20000  |      ;
    LDY.W #$0049                                               ;84B163|A04900  |      ;
    JSL.L fAI_Unknown84803F                                    ;84B166|223F8084|84803F;
    JMP.W .label24                                             ;84B16A|4C5CB2  |84B25C;
 
 
.label15:
    REP #$30                                                   ;84B16D|C230    |      ;
    LDA.W #$0016                                               ;84B16F|A91600  |      ;
    LDX.W #$0000                                               ;84B172|A20000  |      ;
    LDY.W #$0044                                               ;84B175|A04400  |      ;
    JSL.L fAI_Unknown84803F                                    ;84B178|223F8084|84803F;
    JMP.W .label24                                             ;84B17C|4C5CB2  |84B25C;
 
 
.label16:
    REP #$30                                                   ;84B17F|C230    |      ;
    SEP #$20                                                   ;84B181|E220    |      ;
    LDA.B $DE                                                  ;84B183|A5DE    |0000DE;
    CMP.B #$2A                                                 ;84B185|C92A    |      ;
    BCC .label17                                               ;84B187|900B    |84B194;
    CMP.B #$54                                                 ;84B189|C954    |      ;
    BCC .label18                                               ;84B18B|9029    |84B1B6;
    CMP.B #$7E                                                 ;84B18D|C97E    |      ;
    BCC .label19                                               ;84B18F|9047    |84B1D8;
    JMP.W .label24                                             ;84B191|4C5CB2  |84B25C;
 
 
.label17:
    REP #$30                                                   ;84B194|C230    |      ;
    LDA.W #$0016                                               ;84B196|A91600  |      ;
    LDX.W #$0000                                               ;84B199|A20000  |      ;
    LDY.W #$003D                                               ;84B19C|A03D00  |      ;
    JSL.L fAI_Unknown84803F                                    ;84B19F|223F8084|84803F;
    REP #$30                                                   ;84B1A3|C230    |      ;
    LDA.L $7F1F58                                              ;84B1A5|AF581F7F|7F1F58;
    AND.W #$FFFB                                               ;84B1A9|29FBFF  |      ;
    ORA.W #$0002                                               ;84B1AC|090200  |      ;
    STA.L $7F1F58                                              ;84B1AF|8F581F7F|7F1F58;
    JMP.W .label24                                             ;84B1B3|4C5CB2  |84B25C;
 
 
.label18:
    REP #$30                                                   ;84B1B6|C230    |      ;
    LDA.W #$0016                                               ;84B1B8|A91600  |      ;
    LDX.W #$0000                                               ;84B1BB|A20000  |      ;
    LDY.W #$0045                                               ;84B1BE|A04500  |      ;
    JSL.L fAI_Unknown84803F                                    ;84B1C1|223F8084|84803F;
    REP #$30                                                   ;84B1C5|C230    |      ;
    LDA.L $7F1F58                                              ;84B1C7|AF581F7F|7F1F58;
    AND.W #$FFFB                                               ;84B1CB|29FBFF  |      ;
    ORA.W #$0008                                               ;84B1CE|090800  |      ;
    STA.L $7F1F58                                              ;84B1D1|8F581F7F|7F1F58;
    JMP.W .label24                                             ;84B1D5|4C5CB2  |84B25C;
 
 
.label19:
    REP #$30                                                   ;84B1D8|C230    |      ;
    LDA.W #$0016                                               ;84B1DA|A91600  |      ;
    LDX.W #$0000                                               ;84B1DD|A20000  |      ;
    LDY.W #$0043                                               ;84B1E0|A04300  |      ;
    JSL.L fAI_Unknown84803F                                    ;84B1E3|223F8084|84803F;
    JMP.W .label24                                             ;84B1E7|4C5CB2  |84B25C;
 
 
.label20:
    REP #$30                                                   ;84B1EA|C230    |      ;
    SEP #$20                                                   ;84B1EC|E220    |      ;
    LDA.B $DE                                                  ;84B1EE|A5DE    |0000DE;
    CMP.B #$2A                                                 ;84B1F0|C92A    |      ;
    BCC .label21                                               ;84B1F2|9007    |84B1FB;
    CMP.B #$54                                                 ;84B1F4|C954    |      ;
    BCC .label22                                               ;84B1F6|9024    |84B21C;
    JMP.W .label24                                             ;84B1F8|4C5CB2  |84B25C;
 
 
.label21:
    REP #$30                                                   ;84B1FB|C230    |      ;
    LDA.W #$0016                                               ;84B1FD|A91600  |      ;
    LDX.W #$0000                                               ;84B200|A20000  |      ;
    LDY.W #$0041                                               ;84B203|A04100  |      ;
    JSL.L fAI_Unknown84803F                                    ;84B206|223F8084|84803F;
    REP #$30                                                   ;84B20A|C230    |      ;
    LDA.L $7F1F58                                              ;84B20C|AF581F7F|7F1F58;
    AND.W #$FFF7                                               ;84B210|29F7FF  |      ;
    ORA.W #$0004                                               ;84B213|090400  |      ;
    STA.L $7F1F58                                              ;84B216|8F581F7F|7F1F58;
    BRA .label24                                               ;84B21A|8040    |84B25C;
 
 
.label22:
    REP #$30                                                   ;84B21C|C230    |      ;
    LDA.W #$0016                                               ;84B21E|A91600  |      ;
    LDX.W #$0000                                               ;84B221|A20000  |      ;
    LDY.W #$0046                                               ;84B224|A04600  |      ;
    JSL.L fAI_Unknown84803F                                    ;84B227|223F8084|84803F;
    BRA .label24                                               ;84B22B|802F    |84B25C;
 
 
.label23:
    REP #$30                                                   ;84B22D|C230    |      ;
    SEP #$20                                                   ;84B22F|E220    |      ;
    LDA.B $DE                                                  ;84B231|A5DE    |0000DE;
    CMP.B #$40                                                 ;84B233|C940    |      ;
    BCC +                                                      ;84B235|9003    |84B23A;
    JMP.W .label24                                             ;84B237|4C5CB2  |84B25C;
 
 
  + REP #$30                                                   ;84B23A|C230    |      ;
    LDA.W #$0016                                               ;84B23C|A91600  |      ;
    LDX.W #$0000                                               ;84B23F|A20000  |      ;
    LDY.W #$003C                                               ;84B242|A03C00  |      ;
    JSL.L fAI_Unknown84803F                                    ;84B245|223F8084|84803F;
    REP #$30                                                   ;84B249|C230    |      ;
    LDA.L $7F1F58                                              ;84B24B|AF581F7F|7F1F58;
    AND.W #$FFEF                                               ;84B24F|29EFFF  |      ;
    ORA.W #$0001                                               ;84B252|090100  |      ;
    STA.L $7F1F58                                              ;84B255|8F581F7F|7F1F58;
    JMP.W .label24                                             ;84B259|4C5CB2  |84B25C;
 
 
.label24:
    REP #$30                                                   ;84B25C|C230    |      ;
    LDA.L strcDailyFlags.flags4                                ;84B25E|AF601F7F|7F1F60;
    AND.W #$0010                                               ;84B262|291000  |      ;
    BEQ .loop2                                                 ;84B265|F003    |84B26A;
    JMP.W .whistledog                                          ;84B267|4C78B2  |84B278;
 
 
.loop2:
    REP #$30                                                   ;84B26A|C230    |      ;
    LDY.W #$0010                                               ;84B26C|A01000  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84B26F|B7CC    |0000CC;
    CLC                                                        ;84B271|18      |      ;
    ADC.W #$0001                                               ;84B272|690100  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84B275|97CC    |0000CC;
    RTS                                                        ;84B277|60      |      ;
 
 
.whistledog:
    SEP #$20                                                   ;84B278|E220    |      ;
    REP #$10                                                   ;84B27A|C210    |      ;
    STZ.W $0938                                                ;84B27C|9C3809  |000938;
    SEP #$20                                                   ;84B27F|E220    |      ;
    REP #$10                                                   ;84B281|C210    |      ;
    LDY.W #$0001                                               ;84B283|A00100  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84B286|B7CC    |0000CC;
    ORA.B #$28                                                 ;84B288|0928    |      ;
    SEP #$20                                                   ;84B28A|E220    |      ;
    REP #$10                                                   ;84B28C|C210    |      ;
    LDY.W #$0001                                               ;84B28E|A00100  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84B291|97CC    |0000CC;
    REP #$30                                                   ;84B293|C230    |      ;
    SEP #$20                                                   ;84B295|E220    |      ;
    REP #$10                                                   ;84B297|C210    |      ;
    LDY.W #$003F                                               ;84B299|A03F00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84B29C|B7CC    |0000CC;
    XBA                                                        ;84B29E|EB      |      ;
    LDA.B #$00                                                 ;84B29F|A900    |      ;
    XBA                                                        ;84B2A1|EB      |      ;
    REP #$20                                                   ;84B2A2|C220    |      ;
    LDX.W #$0000                                               ;84B2A4|A20000  |      ;
    LDY.W #$003F                                               ;84B2A7|A03F00  |      ;
    JSL.L fAI_Unknown84803F                                    ;84B2AA|223F8084|84803F;
    REP #$30                                                   ;84B2AE|C230    |      ;
    STZ.B n16TempVar3                                          ;84B2B0|6482    |000082;
    STZ.B n16TempVar4                                          ;84B2B2|6484    |000084;
    REP #$30                                                   ;84B2B4|C230    |      ;
    LDY.W #$001A                                               ;84B2B6|A01A00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84B2B9|B7CC    |0000CC;
    SEC                                                        ;84B2BB|38      |      ;
    SBC.B nPlayerPosX                                          ;84B2BC|E5D6    |0000D6;
    STA.B n16TempVar1                                          ;84B2BE|857E    |00007E;
    BMI +                                                      ;84B2C0|3002    |84B2C4;
    BRA .label26                                               ;84B2C2|800D    |84B2D1;
 
 
  + REP #$20                                                   ;84B2C4|C220    |      ;
    EOR.W #$FFFF                                               ;84B2C6|49FFFF  |      ;
    INC A                                                      ;84B2C9|1A      |      ;
    STA.B n16TempVar1                                          ;84B2CA|857E    |00007E;
    LDA.W #$0001                                               ;84B2CC|A90100  |      ;
    STA.B n16TempVar3                                          ;84B2CF|8582    |000082;
 
.label26:
    REP #$30                                                   ;84B2D1|C230    |      ;
    LDY.W #$001C                                               ;84B2D3|A01C00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84B2D6|B7CC    |0000CC;
    SEC                                                        ;84B2D8|38      |      ;
    SBC.B nPlayerPosY                                          ;84B2D9|E5D8    |0000D8;
    STA.B n16TempVar2                                          ;84B2DB|8580    |000080;
    BMI +                                                      ;84B2DD|3002    |84B2E1;
    BRA .label27                                               ;84B2DF|800D    |84B2EE;
 
 
  + REP #$20                                                   ;84B2E1|C220    |      ;
    EOR.W #$FFFF                                               ;84B2E3|49FFFF  |      ;
    INC A                                                      ;84B2E6|1A      |      ;
    STA.B n16TempVar2                                          ;84B2E7|8580    |000080;
    LDA.W #$0001                                               ;84B2E9|A90100  |      ;
    STA.B n16TempVar4                                          ;84B2EC|8584    |000084;
 
.label27:
    SEP #$20                                                   ;84B2EE|E220    |      ;
    LDA.B #$20                                                 ;84B2F0|A920    |      ;
    SEP #$20                                                   ;84B2F2|E220    |      ;
    REP #$10                                                   ;84B2F4|C210    |      ;
    LDY.W #$0008                                               ;84B2F6|A00800  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84B2F9|97CC    |0000CC;
    REP #$20                                                   ;84B2FB|C220    |      ;
    LDA.B n16TempVar2                                          ;84B2FD|A580    |000080;
    CMP.B n16TempVar1                                          ;84B2FF|C57E    |00007E;
    BCS .label28                                               ;84B301|B008    |84B30B;
    REP #$20                                                   ;84B303|C220    |      ;
    LDA.B n16TempVar3                                          ;84B305|A582    |000082;
    BEQ .label31                                               ;84B307|F034    |84B33D;
    BRA .label30                                               ;84B309|8024    |84B32F;
 
 
.label28:
    REP #$20                                                   ;84B30B|C220    |      ;
    LDA.B n16TempVar4                                          ;84B30D|A584    |000084;
    BEQ .label29                                               ;84B30F|F010    |84B321;
    BRA +                                                      ;84B311|8000    |84B313;
 
 
  + SEP #$20                                                   ;84B313|E220    |      ;
    REP #$10                                                   ;84B315|C210    |      ;
    LDY.W #$000F                                               ;84B317|A00F00  |      ;
    LDA.B #$01                                                 ;84B31A|A901    |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84B31C|97CC    |0000CC;
    JMP.W .loop2                                               ;84B31E|4C6AB2  |84B26A;
 
 
.label29:
    SEP #$20                                                   ;84B321|E220    |      ;
    REP #$10                                                   ;84B323|C210    |      ;
    LDY.W #$000F                                               ;84B325|A00F00  |      ;
    LDA.B #$02                                                 ;84B328|A902    |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84B32A|97CC    |0000CC;
    JMP.W .loop2                                               ;84B32C|4C6AB2  |84B26A;
 
 
.label30:
    SEP #$20                                                   ;84B32F|E220    |      ;
    REP #$10                                                   ;84B331|C210    |      ;
    LDY.W #$000F                                               ;84B333|A00F00  |      ;
    LDA.B #$04                                                 ;84B336|A904    |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84B338|97CC    |0000CC;
    JMP.W .loop2                                               ;84B33A|4C6AB2  |84B26A;
 
 
.label31:
    SEP #$20                                                   ;84B33D|E220    |      ;
    REP #$10                                                   ;84B33F|C210    |      ;
    LDY.W #$000F                                               ;84B341|A00F00  |      ;
    LDA.B #$08                                                 ;84B344|A908    |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84B346|97CC    |0000CC;
    JMP.W .loop2                                               ;84B348|4C6AB2  |84B26A;
 
 
fAIAction0x37:
    REP #$30                                                   ;84B34B|C230    |      ;
    REP #$30                                                   ;84B34D|C230    |      ;
    LDA.B ptrAIActionData                                      ;84B34F|A5C9    |0000C9;
    CLC                                                        ;84B351|18      |      ;
    ADC.W #$0001                                               ;84B352|690100  |      ;
    STA.B ptrAIActionData                                      ;84B355|85C9    |0000C9;
    REP #$30                                                   ;84B357|C230    |      ;
    LDY.W #$0012                                               ;84B359|A01200  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84B35C|B7CC    |0000CC;
    STA.B $A5                                                  ;84B35E|85A5    |0000A5;
    JSL.L fUnknown_8581A2                                      ;84B360|22A28185|8581A2;
    RTS                                                        ;84B364|60      |      ;
 
 
fAIAction0x38:
    REP #$30                                                   ;84B365|C230    |      ;
    LDA.L strcDailyFlags.flags1                                ;84B367|AF5A1F7F|7F1F5A;
    AND.W #$8000                                               ;84B36B|290080  |      ;
    BEQ +                                                      ;84B36E|F00B    |84B37B;
    REP #$30                                                   ;84B370|C230    |      ;
    LDA.B ptrAIActionData                                      ;84B372|A5C9    |0000C9;
    CLC                                                        ;84B374|18      |      ;
    ADC.W #$0001                                               ;84B375|690100  |      ;
    STA.B ptrAIActionData                                      ;84B378|85C9    |0000C9;
    RTS                                                        ;84B37A|60      |      ;
 
 
  + REP #$30                                                   ;84B37B|C230    |      ;
    LDY.W #$0010                                               ;84B37D|A01000  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84B380|B7CC    |0000CC;
    CLC                                                        ;84B382|18      |      ;
    ADC.W #$0001                                               ;84B383|690100  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84B386|97CC    |0000CC;
    RTS                                                        ;84B388|60      |      ;
 
 
fAIAction0x39:
    REP #$30                                                   ;84B389|C230    |      ;
    REP #$30                                                   ;84B38B|C230    |      ;
    LDA.B strcPlayerFlags                                      ;84B38D|A5D2    |0000D2;
    AND.W #$1000                                               ;84B38F|290010  |      ;
    BEQ +                                                      ;84B392|F003    |84B397;
    JMP.W .label1                                              ;84B394|4CE8B3  |84B3E8;
 
 
  + REP #$30                                                   ;84B397|C230    |      ;
    LDA.B ptrAIActionData                                      ;84B399|A5C9    |0000C9;
    CLC                                                        ;84B39B|18      |      ;
    ADC.W #$0001                                               ;84B39C|690100  |      ;
    STA.B ptrAIActionData                                      ;84B39F|85C9    |0000C9;
    SEP #$20                                                   ;84B3A1|E220    |      ;
    LDA.B #$00                                                 ;84B3A3|A900    |      ;
    XBA                                                        ;84B3A5|EB      |      ;
    LDA.B [ptrAIActionData]                                    ;84B3A6|A7C9    |0000C9;
    REP #$20                                                   ;84B3A8|C220    |      ;
    ASL A                                                      ;84B3AA|0A      |      ;
    TAX                                                        ;84B3AB|AA      |      ;
    LDA.L aAISetFlags_08FD,X                                   ;84B3AC|BFD2B484|84B4D2;
    ORA.W nUnknownFlags08FD                                    ;84B3B0|0DFD08  |0008FD;
    STA.W nUnknownFlags08FD                                    ;84B3B3|8DFD08  |0008FD;
    REP #$30                                                   ;84B3B6|C230    |      ;
    LDA.B ptrAIActionData                                      ;84B3B8|A5C9    |0000C9;
    CLC                                                        ;84B3BA|18      |      ;
    ADC.W #$0001                                               ;84B3BB|690100  |      ;
    STA.B ptrAIActionData                                      ;84B3BE|85C9    |0000C9;
    REP #$20                                                   ;84B3C0|C220    |      ;
    LDA.B [ptrAIActionData]                                    ;84B3C2|A7C9    |0000C9;
    STA.W $08FF                                                ;84B3C4|8DFF08  |0008FF;
    REP #$30                                                   ;84B3C7|C230    |      ;
    LDA.B ptrAIActionData                                      ;84B3C9|A5C9    |0000C9;
    SEC                                                        ;84B3CB|38      |      ;
    SBC.W #$0002                                               ;84B3CC|E90200  |      ;
    STA.B ptrAIActionData                                      ;84B3CF|85C9    |0000C9;
    REP #$30                                                   ;84B3D1|C230    |      ;
    LDY.W #$0010                                               ;84B3D3|A01000  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84B3D6|B7CC    |0000CC;
    CLC                                                        ;84B3D8|18      |      ;
    ADC.W #$0001                                               ;84B3D9|690100  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84B3DC|97CC    |0000CC;
    REP #$30                                                   ;84B3DE|C230    |      ;
    LDA.B strcPlayerFlags                                      ;84B3E0|A5D2    |0000D2;
    ORA.W #$1000                                               ;84B3E2|090010  |      ;
    STA.B strcPlayerFlags                                      ;84B3E5|85D2    |0000D2;
    RTS                                                        ;84B3E7|60      |      ;
 
 
.label1:
    REP #$20                                                   ;84B3E8|C220    |      ;
    LDA.W $08FF                                                ;84B3EA|ADFF08  |0008FF;
    BEQ +                                                      ;84B3ED|F012    |84B401;
    DEC A                                                      ;84B3EF|3A      |      ;
    STA.W $08FF                                                ;84B3F0|8DFF08  |0008FF;
    REP #$30                                                   ;84B3F3|C230    |      ;
    LDY.W #$0010                                               ;84B3F5|A01000  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84B3F8|B7CC    |0000CC;
    CLC                                                        ;84B3FA|18      |      ;
    ADC.W #$0001                                               ;84B3FB|690100  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84B3FE|97CC    |0000CC;
    RTS                                                        ;84B400|60      |      ;
 
 
  + REP #$20                                                   ;84B401|C220    |      ;
    STZ.W nUnknownFlags08FD                                    ;84B403|9CFD08  |0008FD;
    STZ.W $08FF                                                ;84B406|9CFF08  |0008FF;
    REP #$30                                                   ;84B409|C230    |      ;
    LDA.W #$1000                                               ;84B40B|A90010  |      ;
    EOR.W #$FFFF                                               ;84B40E|49FFFF  |      ;
    AND.B strcPlayerFlags                                      ;84B411|25D2    |0000D2;
    STA.B strcPlayerFlags                                      ;84B413|85D2    |0000D2;
    REP #$30                                                   ;84B415|C230    |      ;
    LDA.W #$0000                                               ;84B417|A90000  |      ;
    STA.B nPlayerAction                                        ;84B41A|85D4    |0000D4;
    REP #$30                                                   ;84B41C|C230    |      ;
    LDA.B ptrAIActionData                                      ;84B41E|A5C9    |0000C9;
    CLC                                                        ;84B420|18      |      ;
    ADC.W #$0004                                               ;84B421|690400  |      ;
    STA.B ptrAIActionData                                      ;84B424|85C9    |0000C9;
    RTS                                                        ;84B426|60      |      ;
 
 
fAIAction0x3A:
    REP #$30                                                   ;84B427|C230    |      ;
    REP #$30                                                   ;84B429|C230    |      ;
    LDA.B strcPlayerFlags                                      ;84B42B|A5D2    |0000D2;
    AND.W #$1000                                               ;84B42D|290010  |      ;
    BEQ +                                                      ;84B430|F003    |84B435;
    JMP.W .label1                                              ;84B432|4C93B4  |84B493;
 
 
  + REP #$30                                                   ;84B435|C230    |      ;
    LDA.B ptrAIActionData                                      ;84B437|A5C9    |0000C9;
    CLC                                                        ;84B439|18      |      ;
    ADC.W #$0001                                               ;84B43A|690100  |      ;
    STA.B ptrAIActionData                                      ;84B43D|85C9    |0000C9;
    SEP #$20                                                   ;84B43F|E220    |      ;
    LDA.B #$00                                                 ;84B441|A900    |      ;
    XBA                                                        ;84B443|EB      |      ;
    LDA.B [ptrAIActionData]                                    ;84B444|A7C9    |0000C9;
    REP #$20                                                   ;84B446|C220    |      ;
    ASL A                                                      ;84B448|0A      |      ;
    TAX                                                        ;84B449|AA      |      ;
    LDA.L aAISetFlags_08FD,X                                   ;84B44A|BFD2B484|84B4D2;
    ORA.W nUnknownFlags08FD                                    ;84B44E|0DFD08  |0008FD;
    STA.W nUnknownFlags08FD                                    ;84B451|8DFD08  |0008FD;
    LDX.W #$0008                                               ;84B454|A20800  |      ;
    LDA.L aAISetFlags_08FD,X                                   ;84B457|BFD2B484|84B4D2;
    ORA.W nUnknownFlags08FD                                    ;84B45B|0DFD08  |0008FD;
    STA.W nUnknownFlags08FD                                    ;84B45E|8DFD08  |0008FD;
    REP #$30                                                   ;84B461|C230    |      ;
    LDA.B ptrAIActionData                                      ;84B463|A5C9    |0000C9;
    CLC                                                        ;84B465|18      |      ;
    ADC.W #$0001                                               ;84B466|690100  |      ;
    STA.B ptrAIActionData                                      ;84B469|85C9    |0000C9;
    REP #$20                                                   ;84B46B|C220    |      ;
    LDA.B [ptrAIActionData]                                    ;84B46D|A7C9    |0000C9;
    STA.W $08FF                                                ;84B46F|8DFF08  |0008FF;
    REP #$30                                                   ;84B472|C230    |      ;
    LDA.B ptrAIActionData                                      ;84B474|A5C9    |0000C9;
    SEC                                                        ;84B476|38      |      ;
    SBC.W #$0002                                               ;84B477|E90200  |      ;
    STA.B ptrAIActionData                                      ;84B47A|85C9    |0000C9;
    REP #$30                                                   ;84B47C|C230    |      ;
    LDY.W #$0010                                               ;84B47E|A01000  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84B481|B7CC    |0000CC;
    CLC                                                        ;84B483|18      |      ;
    ADC.W #$0001                                               ;84B484|690100  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84B487|97CC    |0000CC;
    REP #$30                                                   ;84B489|C230    |      ;
    LDA.B strcPlayerFlags                                      ;84B48B|A5D2    |0000D2;
    ORA.W #$1000                                               ;84B48D|090010  |      ;
    STA.B strcPlayerFlags                                      ;84B490|85D2    |0000D2;
    RTS                                                        ;84B492|60      |      ;
 
 
.label1:
    REP #$20                                                   ;84B493|C220    |      ;
    LDA.W $08FF                                                ;84B495|ADFF08  |0008FF;
    BEQ +                                                      ;84B498|F012    |84B4AC;
    DEC A                                                      ;84B49A|3A      |      ;
    STA.W $08FF                                                ;84B49B|8DFF08  |0008FF;
    REP #$30                                                   ;84B49E|C230    |      ;
    LDY.W #$0010                                               ;84B4A0|A01000  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84B4A3|B7CC    |0000CC;
    CLC                                                        ;84B4A5|18      |      ;
    ADC.W #$0001                                               ;84B4A6|690100  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84B4A9|97CC    |0000CC;
    RTS                                                        ;84B4AB|60      |      ;
 
 
  + REP #$20                                                   ;84B4AC|C220    |      ;
    STZ.W nUnknownFlags08FD                                    ;84B4AE|9CFD08  |0008FD;
    STZ.W $08FF                                                ;84B4B1|9CFF08  |0008FF;
    REP #$30                                                   ;84B4B4|C230    |      ;
    LDA.W #$1000                                               ;84B4B6|A90010  |      ;
    EOR.W #$FFFF                                               ;84B4B9|49FFFF  |      ;
    AND.B strcPlayerFlags                                      ;84B4BC|25D2    |0000D2;
    STA.B strcPlayerFlags                                      ;84B4BE|85D2    |0000D2;
    REP #$30                                                   ;84B4C0|C230    |      ;
    LDA.W #$0000                                               ;84B4C2|A90000  |      ;
    STA.B nPlayerAction                                        ;84B4C5|85D4    |0000D4;
    REP #$30                                                   ;84B4C7|C230    |      ;
    LDA.B ptrAIActionData                                      ;84B4C9|A5C9    |0000C9;
    CLC                                                        ;84B4CB|18      |      ;
    ADC.W #$0004                                               ;84B4CC|690400  |      ;
    STA.B ptrAIActionData                                      ;84B4CF|85C9    |0000C9;
    RTS                                                        ;84B4D1|60      |      ;
 
 
aAISetFlags_08FD:
    dw $0400,$0800,$0100,$0200,$8000                           ;84B4D2|        |      ; 0x05 * [n16]
 
fAIAction0x3B:
    REP #$30                                                   ;84B4DC|C230    |      ;
    REP #$30                                                   ;84B4DE|C230    |      ;
    LDA.B ptrAIActionData                                      ;84B4E0|A5C9    |0000C9;
    CLC                                                        ;84B4E2|18      |      ;
    ADC.W #$0001                                               ;84B4E3|690100  |      ;
    STA.B ptrAIActionData                                      ;84B4E6|85C9    |0000C9;
    SEP #$20                                                   ;84B4E8|E220    |      ;
    LDA.B [ptrAIActionData]                                    ;84B4EA|A7C9    |0000C9;
    STA.W $091D                                                ;84B4EC|8D1D09  |00091D;
    REP #$30                                                   ;84B4EF|C230    |      ;
    LDA.B ptrAIActionData                                      ;84B4F1|A5C9    |0000C9;
    CLC                                                        ;84B4F3|18      |      ;
    ADC.W #$0001                                               ;84B4F4|690100  |      ;
    STA.B ptrAIActionData                                      ;84B4F7|85C9    |0000C9;
    REP #$30                                                   ;84B4F9|C230    |      ;
    LDA.B strcPlayerFlags                                      ;84B4FB|A5D2    |0000D2;
    ORA.W #$0002                                               ;84B4FD|090200  |      ;
    STA.B strcPlayerFlags                                      ;84B500|85D2    |0000D2;
    RTS                                                        ;84B502|60      |      ;
 
 
fAIAction0x3C:
    REP #$30                                                   ;84B503|C230    |      ;
    REP #$30                                                   ;84B505|C230    |      ;
    LDA.B ptrAIActionData                                      ;84B507|A5C9    |0000C9;
    CLC                                                        ;84B509|18      |      ;
    ADC.W #$0001                                               ;84B50A|690100  |      ;
    STA.B ptrAIActionData                                      ;84B50D|85C9    |0000C9;
    SEP #$20                                                   ;84B50F|E220    |      ;
    LDA.B #$15                                                 ;84B511|A915    |      ;
    STA.W n8DestinationId                                      ;84B513|8D8B09  |00098B;
    REP #$30                                                   ;84B516|C230    |      ;
    LDA.W nMapEngine_CurrentMapId                              ;84B518|AD9601  |000196;
    ORA.W #$4000                                               ;84B51B|090040  |      ;
    STA.W nMapEngine_CurrentMapId                              ;84B51E|8D9601  |000196;
    LDA.L strcDailyFlags.flags4                                ;84B521|AF601F7F|7F1F60;
    ORA.W #$0020                                               ;84B525|092000  |      ;
    STA.L strcDailyFlags.flags4                                ;84B528|8F601F7F|7F1F60;
    RTS                                                        ;84B52C|60      |      ;
 
 
fAIAction0x3D:
    REP #$30                                                   ;84B52D|C230    |      ;
    REP #$30                                                   ;84B52F|C230    |      ;
    LDA.B ptrAIActionData                                      ;84B531|A5C9    |0000C9;
    CLC                                                        ;84B533|18      |      ;
    ADC.W #$0001                                               ;84B534|690100  |      ;
    STA.B ptrAIActionData                                      ;84B537|85C9    |0000C9;
    SEP #$20                                                   ;84B539|E220    |      ;
    LDA.B [ptrAIActionData]                                    ;84B53B|A7C9    |0000C9;
    STA.W n8DestinationId                                      ;84B53D|8D8B09  |00098B;
    REP #$30                                                   ;84B540|C230    |      ;
    LDA.B ptrAIActionData                                      ;84B542|A5C9    |0000C9;
    CLC                                                        ;84B544|18      |      ;
    ADC.W #$0001                                               ;84B545|690100  |      ;
    STA.B ptrAIActionData                                      ;84B548|85C9    |0000C9;
    REP #$30                                                   ;84B54A|C230    |      ;
    LDA.W nMapEngine_CurrentMapId                              ;84B54C|AD9601  |000196;
    ORA.W #$4000                                               ;84B54F|090040  |      ;
    STA.W nMapEngine_CurrentMapId                              ;84B552|8D9601  |000196;
    RTS                                                        ;84B555|60      |      ;
 
 
fAIAction0x3E:
    REP #$30                                                   ;84B556|C230    |      ;
    REP #$30                                                   ;84B558|C230    |      ;
    LDA.B ptrAIActionData                                      ;84B55A|A5C9    |0000C9;
    CLC                                                        ;84B55C|18      |      ;
    ADC.W #$0001                                               ;84B55D|690100  |      ;
    STA.B ptrAIActionData                                      ;84B560|85C9    |0000C9;
    SEP #$20                                                   ;84B562|E220    |      ;
    LDA.B [ptrAIActionData]                                    ;84B564|A7C9    |0000C9;
    STA.W $091D                                                ;84B566|8D1D09  |00091D;
    REP #$30                                                   ;84B569|C230    |      ;
    LDA.B ptrAIActionData                                      ;84B56B|A5C9    |0000C9;
    CLC                                                        ;84B56D|18      |      ;
    ADC.W #$0001                                               ;84B56E|690100  |      ;
    STA.B ptrAIActionData                                      ;84B571|85C9    |0000C9;
    REP #$30                                                   ;84B573|C230    |      ;
    LDA.W #$0004                                               ;84B575|A90400  |      ;
    STA.B nPlayerAction                                        ;84B578|85D4    |0000D4;
    RTS                                                        ;84B57A|60      |      ;
 
 
fAIAction0x3F_ThrowHeldItem:
    REP #$30                                                   ;84B57B|C230    |      ;
    REP #$30                                                   ;84B57D|C230    |      ;
    LDA.B ptrAIActionData                                      ;84B57F|A5C9    |0000C9;
    CLC                                                        ;84B581|18      |      ;
    ADC.W #$0001                                               ;84B582|690100  |      ;
    STA.B ptrAIActionData                                      ;84B585|85C9    |0000C9;
    REP #$30                                                   ;84B587|C230    |      ;
    LDA.W #$0005                                               ;84B589|A90500  |      ;
    STA.B nPlayerAction                                        ;84B58C|85D4    |0000D4;
    RTS                                                        ;84B58E|60      |      ;
 
 
fAIAction0x40_DisableTileInteractions:
    REP #$30                                                   ;84B58F|C230    |      ;
    REP #$30                                                   ;84B591|C230    |      ;
    LDA.B ptrAIActionData                                      ;84B593|A5C9    |0000C9;
    CLC                                                        ;84B595|18      |      ;
    ADC.W #$0001                                               ;84B596|690100  |      ;
    STA.B ptrAIActionData                                      ;84B599|85C9    |0000C9;
    REP #$20                                                   ;84B59B|C220    |      ;
    LDA.L strcDailyFlags.flags2                                ;84B59D|AF5C1F7F|7F1F5C;
    ORA.W #$0008                                               ;84B5A1|090800  |      ;
    STA.L strcDailyFlags.flags2                                ;84B5A4|8F5C1F7F|7F1F5C;
    RTS                                                        ;84B5A8|60      |      ;
 
 
fAIAction0x41:
    REP #$30                                                   ;84B5A9|C230    |      ;
    REP #$30                                                   ;84B5AB|C230    |      ;
    LDA.B ptrAIActionData                                      ;84B5AD|A5C9    |0000C9;
    CLC                                                        ;84B5AF|18      |      ;
    ADC.W #$0001                                               ;84B5B0|690100  |      ;
    STA.B ptrAIActionData                                      ;84B5B3|85C9    |0000C9;
    REP #$20                                                   ;84B5B5|C220    |      ;
    LDA.B [ptrAIActionData]                                    ;84B5B7|A7C9    |0000C9;
    STA.B ptrUnknown0x72                                       ;84B5B9|8572    |000072;
    REP #$30                                                   ;84B5BB|C230    |      ;
    LDA.B ptrAIActionData                                      ;84B5BD|A5C9    |0000C9;
    CLC                                                        ;84B5BF|18      |      ;
    ADC.W #$0002                                               ;84B5C0|690200  |      ;
    STA.B ptrAIActionData                                      ;84B5C3|85C9    |0000C9;
    SEP #$20                                                   ;84B5C5|E220    |      ;
    LDA.B [ptrAIActionData]                                    ;84B5C7|A7C9    |0000C9;
    STA.B ptrUnknown0x72+2                                     ;84B5C9|8574    |000074;
    REP #$30                                                   ;84B5CB|C230    |      ;
    LDA.B ptrAIActionData                                      ;84B5CD|A5C9    |0000C9;
    CLC                                                        ;84B5CF|18      |      ;
    ADC.W #$0001                                               ;84B5D0|690100  |      ;
    STA.B ptrAIActionData                                      ;84B5D3|85C9    |0000C9;
    REP #$20                                                   ;84B5D5|C220    |      ;
    LDA.B [ptrAIActionData]                                    ;84B5D7|A7C9    |0000C9;
    STA.B n16TempVar1                                          ;84B5D9|857E    |00007E;
    REP #$30                                                   ;84B5DB|C230    |      ;
    LDA.B ptrAIActionData                                      ;84B5DD|A5C9    |0000C9;
    CLC                                                        ;84B5DF|18      |      ;
    ADC.W #$0002                                               ;84B5E0|690200  |      ;
    STA.B ptrAIActionData                                      ;84B5E3|85C9    |0000C9;
    LDA.B [ptrUnknown0x72]                                     ;84B5E5|A772    |000072;
    CLC                                                        ;84B5E7|18      |      ;
    ADC.B n16TempVar1                                          ;84B5E8|657E    |00007E;
    STA.B [ptrUnknown0x72]                                     ;84B5EA|8772    |000072;
    BMI .return                                                ;84B5EC|300C    |84B5FA;
    CMP.W #$03E7                                               ;84B5EE|C9E703  |      ;
    BCC .justReturn                                            ;84B5F1|900E    |84B601;
    LDA.W #$03E7                                               ;84B5F3|A9E703  |      ;
    STA.B [ptrUnknown0x72]                                     ;84B5F6|8772    |000072;
    BRA .justReturn                                            ;84B5F8|8007    |84B601;
 
 
.return:
    REP #$30                                                   ;84B5FA|C230    |      ;
    LDA.W #$0000                                               ;84B5FC|A90000  |      ;
    STA.B [ptrUnknown0x72]                                     ;84B5FF|8772    |000072;
 
.justReturn:
    RTS                                                        ;84B601|60      |      ;
 
 
fAIAction0x42:
    REP #$30                                                   ;84B602|C230    |      ;
    REP #$30                                                   ;84B604|C230    |      ;
    LDA.B ptrAIActionData                                      ;84B606|A5C9    |0000C9;
    CLC                                                        ;84B608|18      |      ;
    ADC.W #$0001                                               ;84B609|690100  |      ;
    STA.B ptrAIActionData                                      ;84B60C|85C9    |0000C9;
    REP #$20                                                   ;84B60E|C220    |      ;
    LDA.B [ptrAIActionData]                                    ;84B610|A7C9    |0000C9;
    STA.B ptrUnknown0x72                                       ;84B612|8572    |000072;
    REP #$30                                                   ;84B614|C230    |      ;
    LDA.B ptrAIActionData                                      ;84B616|A5C9    |0000C9;
    CLC                                                        ;84B618|18      |      ;
    ADC.W #$0002                                               ;84B619|690200  |      ;
    STA.B ptrAIActionData                                      ;84B61C|85C9    |0000C9;
    SEP #$20                                                   ;84B61E|E220    |      ;
    LDA.B [ptrAIActionData]                                    ;84B620|A7C9    |0000C9;
    STA.B ptrUnknown0x72+2                                     ;84B622|8574    |000074;
    REP #$30                                                   ;84B624|C230    |      ;
    LDA.B ptrAIActionData                                      ;84B626|A5C9    |0000C9;
    CLC                                                        ;84B628|18      |      ;
    ADC.W #$0001                                               ;84B629|690100  |      ;
    STA.B ptrAIActionData                                      ;84B62C|85C9    |0000C9;
    REP #$20                                                   ;84B62E|C220    |      ;
    LDA.B [ptrAIActionData]                                    ;84B630|A7C9    |0000C9;
    STA.B ptrUnknown0x72                                       ;84B632|8572    |000072;
    REP #$30                                                   ;84B634|C230    |      ;
    LDA.B ptrAIActionData                                      ;84B636|A5C9    |0000C9;
    CLC                                                        ;84B638|18      |      ;
    ADC.W #$0002                                               ;84B639|690200  |      ;
    STA.B ptrAIActionData                                      ;84B63C|85C9    |0000C9;
    SEP #$20                                                   ;84B63E|E220    |      ;
    LDA.B [ptrAIActionData]                                    ;84B640|A7C9    |0000C9;
    STA.B ptrUnknown0x72+2                                     ;84B642|8574    |000074;
    REP #$30                                                   ;84B644|C230    |      ;
    LDA.B ptrAIActionData                                      ;84B646|A5C9    |0000C9;
    CLC                                                        ;84B648|18      |      ;
    ADC.W #$0001                                               ;84B649|690100  |      ;
    STA.B ptrAIActionData                                      ;84B64C|85C9    |0000C9;
    JSL.L fGameEngine_AddProfit                                ;84B64E|22C9B183|83B1C9;
    REP #$20                                                   ;84B652|C220    |      ;
    BEQ .justReturn                                            ;84B654|F00F    |84B665;
    LDA.W #$0000                                               ;84B656|A90000  |      ;
    STA.L nMoney                                               ;84B659|8F041F7F|7F1F04;
    SEP #$20                                                   ;84B65D|E220    |      ;
    LDA.B #$00                                                 ;84B65F|A900    |      ;
    STA.L nMoney+2                                             ;84B661|8F061F7F|7F1F06;
 
.justReturn:
    RTS                                                        ;84B665|60      |      ;
 
 
fAIAction0x43:
    REP #$30                                                   ;84B666|C230    |      ;
    REP #$30                                                   ;84B668|C230    |      ;
    LDA.B ptrAIActionData                                      ;84B66A|A5C9    |0000C9;
    CLC                                                        ;84B66C|18      |      ;
    ADC.W #$0001                                               ;84B66D|690100  |      ;
    STA.B ptrAIActionData                                      ;84B670|85C9    |0000C9;
    REP #$20                                                   ;84B672|C220    |      ;
    LDA.B [ptrAIActionData]                                    ;84B674|A7C9    |0000C9;
    STA.B ptrUnknown0x72                                       ;84B676|8572    |000072;
    REP #$30                                                   ;84B678|C230    |      ;
    LDA.B ptrAIActionData                                      ;84B67A|A5C9    |0000C9;
    CLC                                                        ;84B67C|18      |      ;
    ADC.W #$0002                                               ;84B67D|690200  |      ;
    STA.B ptrAIActionData                                      ;84B680|85C9    |0000C9;
    SEP #$20                                                   ;84B682|E220    |      ;
    LDA.B [ptrAIActionData]                                    ;84B684|A7C9    |0000C9;
    STA.B ptrUnknown0x72+2                                     ;84B686|8574    |000074;
    REP #$30                                                   ;84B688|C230    |      ;
    LDA.B ptrAIActionData                                      ;84B68A|A5C9    |0000C9;
    CLC                                                        ;84B68C|18      |      ;
    ADC.W #$0001                                               ;84B68D|690100  |      ;
    STA.B ptrAIActionData                                      ;84B690|85C9    |0000C9;
    REP #$20                                                   ;84B692|C220    |      ;
    LDA.B [ptrAIActionData]                                    ;84B694|A7C9    |0000C9;
    STA.B n16TempVar1                                          ;84B696|857E    |00007E;
    REP #$30                                                   ;84B698|C230    |      ;
    LDA.B ptrAIActionData                                      ;84B69A|A5C9    |0000C9;
    CLC                                                        ;84B69C|18      |      ;
    ADC.W #$0002                                               ;84B69D|690200  |      ;
    STA.B ptrAIActionData                                      ;84B6A0|85C9    |0000C9;
    REP #$20                                                   ;84B6A2|C220    |      ;
    LDA.B [ptrUnknown0x72]                                     ;84B6A4|A772    |000072;
    CMP.B n16TempVar1                                          ;84B6A6|C57E    |00007E;
    BNE +                                                      ;84B6A8|D007    |84B6B1;
    REP #$20                                                   ;84B6AA|C220    |      ;
    LDA.B [ptrAIActionData]                                    ;84B6AC|A7C9    |0000C9;
    STA.B ptrAIActionData                                      ;84B6AE|85C9    |0000C9;
    RTS                                                        ;84B6B0|60      |      ;
 
 
  + REP #$30                                                   ;84B6B1|C230    |      ;
    LDA.B ptrAIActionData                                      ;84B6B3|A5C9    |0000C9;
    CLC                                                        ;84B6B5|18      |      ;
    ADC.W #$0002                                               ;84B6B6|690200  |      ;
    STA.B ptrAIActionData                                      ;84B6B9|85C9    |0000C9;
    RTS                                                        ;84B6BB|60      |      ;
 
 
fAIAction0x44:
    REP #$30                                                   ;84B6BC|C230    |      ;
    REP #$30                                                   ;84B6BE|C230    |      ;
    LDA.B ptrAIActionData                                      ;84B6C0|A5C9    |0000C9;
    CLC                                                        ;84B6C2|18      |      ;
    ADC.W #$0001                                               ;84B6C3|690100  |      ;
    STA.B ptrAIActionData                                      ;84B6C6|85C9    |0000C9;
    REP #$20                                                   ;84B6C8|C220    |      ;
    LDA.B [ptrAIActionData]                                    ;84B6CA|A7C9    |0000C9;
    STA.B ptrUnknown0x72                                       ;84B6CC|8572    |000072;
    REP #$30                                                   ;84B6CE|C230    |      ;
    LDA.B ptrAIActionData                                      ;84B6D0|A5C9    |0000C9;
    CLC                                                        ;84B6D2|18      |      ;
    ADC.W #$0002                                               ;84B6D3|690200  |      ;
    STA.B ptrAIActionData                                      ;84B6D6|85C9    |0000C9;
    SEP #$20                                                   ;84B6D8|E220    |      ;
    LDA.B [ptrAIActionData]                                    ;84B6DA|A7C9    |0000C9;
    STA.B ptrUnknown0x72+2                                     ;84B6DC|8574    |000074;
    REP #$30                                                   ;84B6DE|C230    |      ;
    LDA.B ptrAIActionData                                      ;84B6E0|A5C9    |0000C9;
    CLC                                                        ;84B6E2|18      |      ;
    ADC.W #$0001                                               ;84B6E3|690100  |      ;
    STA.B ptrAIActionData                                      ;84B6E6|85C9    |0000C9;
    REP #$20                                                   ;84B6E8|C220    |      ;
    LDA.B [ptrAIActionData]                                    ;84B6EA|A7C9    |0000C9;
    STA.B n16TempVar1                                          ;84B6EC|857E    |00007E;
    REP #$30                                                   ;84B6EE|C230    |      ;
    LDA.B ptrAIActionData                                      ;84B6F0|A5C9    |0000C9;
    CLC                                                        ;84B6F2|18      |      ;
    ADC.W #$0002                                               ;84B6F3|690200  |      ;
    STA.B ptrAIActionData                                      ;84B6F6|85C9    |0000C9;
    SEP #$20                                                   ;84B6F8|E220    |      ;
    LDA.B [ptrAIActionData]                                    ;84B6FA|A7C9    |0000C9;
    STA.B n16TempVar2                                          ;84B6FC|8580    |000080;
    REP #$30                                                   ;84B6FE|C230    |      ;
    LDA.B ptrAIActionData                                      ;84B700|A5C9    |0000C9;
    CLC                                                        ;84B702|18      |      ;
    ADC.W #$0001                                               ;84B703|690100  |      ;
    STA.B ptrAIActionData                                      ;84B706|85C9    |0000C9;
    REP #$20                                                   ;84B708|C220    |      ;
    LDA.B [ptrUnknown0x72]                                     ;84B70A|A772    |000072;
    CMP.B n16TempVar1                                          ;84B70C|C57E    |00007E;
    BNE +                                                      ;84B70E|D012    |84B722;
    SEP #$20                                                   ;84B710|E220    |      ;
    LDY.W #$0002                                               ;84B712|A00200  |      ;
    LDA.B [ptrUnknown0x72],Y                                   ;84B715|B772    |000072;
    CMP.B n16TempVar2                                          ;84B717|C580    |000080;
    BNE +                                                      ;84B719|D007    |84B722;
    REP #$20                                                   ;84B71B|C220    |      ;
    LDA.B [ptrAIActionData]                                    ;84B71D|A7C9    |0000C9;
    STA.B ptrAIActionData                                      ;84B71F|85C9    |0000C9;
    RTS                                                        ;84B721|60      |      ;
 
 
  + REP #$30                                                   ;84B722|C230    |      ;
    LDA.B ptrAIActionData                                      ;84B724|A5C9    |0000C9;
    CLC                                                        ;84B726|18      |      ;
    ADC.W #$0002                                               ;84B727|690200  |      ;
    STA.B ptrAIActionData                                      ;84B72A|85C9    |0000C9;
    RTS                                                        ;84B72C|60      |      ;
 
 
fAIAction0x45:
    REP #$30                                                   ;84B72D|C230    |      ;
    REP #$30                                                   ;84B72F|C230    |      ;
    LDA.B ptrAIActionData                                      ;84B731|A5C9    |0000C9;
    CLC                                                        ;84B733|18      |      ;
    ADC.W #$0001                                               ;84B734|690100  |      ;
    STA.B ptrAIActionData                                      ;84B737|85C9    |0000C9;
    REP #$20                                                   ;84B739|C220    |      ;
    LDA.B [ptrAIActionData]                                    ;84B73B|A7C9    |0000C9;
    STA.B ptrUnknown0x72                                       ;84B73D|8572    |000072;
    REP #$30                                                   ;84B73F|C230    |      ;
    LDA.B ptrAIActionData                                      ;84B741|A5C9    |0000C9;
    CLC                                                        ;84B743|18      |      ;
    ADC.W #$0002                                               ;84B744|690200  |      ;
    STA.B ptrAIActionData                                      ;84B747|85C9    |0000C9;
    SEP #$20                                                   ;84B749|E220    |      ;
    LDA.B [ptrAIActionData]                                    ;84B74B|A7C9    |0000C9;
    STA.B ptrUnknown0x72+2                                     ;84B74D|8574    |000074;
    REP #$30                                                   ;84B74F|C230    |      ;
    LDA.B ptrAIActionData                                      ;84B751|A5C9    |0000C9;
    CLC                                                        ;84B753|18      |      ;
    ADC.W #$0001                                               ;84B754|690100  |      ;
    STA.B ptrAIActionData                                      ;84B757|85C9    |0000C9;
    REP #$20                                                   ;84B759|C220    |      ;
    LDA.B [ptrAIActionData]                                    ;84B75B|A7C9    |0000C9;
    STA.B n16TempVar1                                          ;84B75D|857E    |00007E;
    REP #$30                                                   ;84B75F|C230    |      ;
    LDA.B ptrAIActionData                                      ;84B761|A5C9    |0000C9;
    CLC                                                        ;84B763|18      |      ;
    ADC.W #$0002                                               ;84B764|690200  |      ;
    STA.B ptrAIActionData                                      ;84B767|85C9    |0000C9;
    REP #$20                                                   ;84B769|C220    |      ;
    LDA.B [ptrAIActionData]                                    ;84B76B|A7C9    |0000C9;
    INC A                                                      ;84B76D|1A      |      ;
    STA.B n16TempVar2                                          ;84B76E|8580    |000080;
    REP #$30                                                   ;84B770|C230    |      ;
    LDA.B ptrAIActionData                                      ;84B772|A5C9    |0000C9;
    CLC                                                        ;84B774|18      |      ;
    ADC.W #$0002                                               ;84B775|690200  |      ;
    STA.B ptrAIActionData                                      ;84B778|85C9    |0000C9;
    REP #$20                                                   ;84B77A|C220    |      ;
    LDA.B [ptrUnknown0x72]                                     ;84B77C|A772    |000072;
    CMP.B n16TempVar1                                          ;84B77E|C57E    |00007E;
    BCC +                                                      ;84B780|900D    |84B78F;
    LDA.B [ptrUnknown0x72]                                     ;84B782|A772    |000072;
    CMP.B n16TempVar2                                          ;84B784|C580    |000080;
    BCS +                                                      ;84B786|B007    |84B78F;
    REP #$20                                                   ;84B788|C220    |      ;
    LDA.B [ptrAIActionData]                                    ;84B78A|A7C9    |0000C9;
    STA.B ptrAIActionData                                      ;84B78C|85C9    |0000C9;
    RTS                                                        ;84B78E|60      |      ;
 
 
  + REP #$30                                                   ;84B78F|C230    |      ;
    LDA.B ptrAIActionData                                      ;84B791|A5C9    |0000C9;
    CLC                                                        ;84B793|18      |      ;
    ADC.W #$0002                                               ;84B794|690200  |      ;
    STA.B ptrAIActionData                                      ;84B797|85C9    |0000C9;
    RTS                                                        ;84B799|60      |      ;
 
 
fAIAction0x46:
    REP #$30                                                   ;84B79A|C230    |      ;
    REP #$30                                                   ;84B79C|C230    |      ;
    LDA.B ptrAIActionData                                      ;84B79E|A5C9    |0000C9;
    CLC                                                        ;84B7A0|18      |      ;
    ADC.W #$0001                                               ;84B7A1|690100  |      ;
    STA.B ptrAIActionData                                      ;84B7A4|85C9    |0000C9;
    REP #$20                                                   ;84B7A6|C220    |      ;
    LDA.B [ptrAIActionData]                                    ;84B7A8|A7C9    |0000C9;
    STA.B ptrUnknown0x72                                       ;84B7AA|8572    |000072;
    REP #$30                                                   ;84B7AC|C230    |      ;
    LDA.B ptrAIActionData                                      ;84B7AE|A5C9    |0000C9;
    CLC                                                        ;84B7B0|18      |      ;
    ADC.W #$0002                                               ;84B7B1|690200  |      ;
    STA.B ptrAIActionData                                      ;84B7B4|85C9    |0000C9;
    SEP #$20                                                   ;84B7B6|E220    |      ;
    LDA.B [ptrAIActionData]                                    ;84B7B8|A7C9    |0000C9;
    STA.B ptrUnknown0x72+2                                     ;84B7BA|8574    |000074;
    REP #$30                                                   ;84B7BC|C230    |      ;
    LDA.B ptrAIActionData                                      ;84B7BE|A5C9    |0000C9;
    CLC                                                        ;84B7C0|18      |      ;
    ADC.W #$0001                                               ;84B7C1|690100  |      ;
    STA.B ptrAIActionData                                      ;84B7C4|85C9    |0000C9;
    REP #$20                                                   ;84B7C6|C220    |      ;
    LDA.B [ptrAIActionData]                                    ;84B7C8|A7C9    |0000C9;
    STA.B n16TempVar1                                          ;84B7CA|857E    |00007E;
    REP #$30                                                   ;84B7CC|C230    |      ;
    LDA.B ptrAIActionData                                      ;84B7CE|A5C9    |0000C9;
    CLC                                                        ;84B7D0|18      |      ;
    ADC.W #$0002                                               ;84B7D1|690200  |      ;
    STA.B ptrAIActionData                                      ;84B7D4|85C9    |0000C9;
    SEP #$20                                                   ;84B7D6|E220    |      ;
    LDA.B [ptrAIActionData]                                    ;84B7D8|A7C9    |0000C9;
    STA.B n16TempVar2                                          ;84B7DA|8580    |000080;
    REP #$30                                                   ;84B7DC|C230    |      ;
    LDA.B ptrAIActionData                                      ;84B7DE|A5C9    |0000C9;
    CLC                                                        ;84B7E0|18      |      ;
    ADC.W #$0001                                               ;84B7E1|690100  |      ;
    STA.B ptrAIActionData                                      ;84B7E4|85C9    |0000C9;
    REP #$20                                                   ;84B7E6|C220    |      ;
    LDA.B [ptrAIActionData]                                    ;84B7E8|A7C9    |0000C9;
    STA.B n16TempVar3                                          ;84B7EA|8582    |000082;
    REP #$30                                                   ;84B7EC|C230    |      ;
    LDA.B ptrAIActionData                                      ;84B7EE|A5C9    |0000C9;
    CLC                                                        ;84B7F0|18      |      ;
    ADC.W #$0002                                               ;84B7F1|690200  |      ;
    STA.B ptrAIActionData                                      ;84B7F4|85C9    |0000C9;
    SEP #$20                                                   ;84B7F6|E220    |      ;
    LDA.B [ptrAIActionData]                                    ;84B7F8|A7C9    |0000C9;
    STA.B n16TempVar4                                          ;84B7FA|8584    |000084;
    REP #$30                                                   ;84B7FC|C230    |      ;
    LDA.B ptrAIActionData                                      ;84B7FE|A5C9    |0000C9;
    CLC                                                        ;84B800|18      |      ;
    ADC.W #$0001                                               ;84B801|690100  |      ;
    STA.B ptrAIActionData                                      ;84B804|85C9    |0000C9;
    REP #$20                                                   ;84B806|C220    |      ;
    LDA.B n16TempVar3                                          ;84B808|A582    |000082;
    CLC                                                        ;84B80A|18      |      ;
    ADC.W #$0001                                               ;84B80B|690100  |      ;
    STA.B n16TempVar3                                          ;84B80E|8582    |000082;
    SEP #$20                                                   ;84B810|E220    |      ;
    LDA.B n16TempVar4                                          ;84B812|A584    |000084;
    ADC.B #$00                                                 ;84B814|6900    |      ;
    STA.B n16TempVar4                                          ;84B816|8584    |000084;
    REP #$20                                                   ;84B818|C220    |      ;
    LDA.B [ptrUnknown0x72]                                     ;84B81A|A772    |000072;
    CMP.B n16TempVar1                                          ;84B81C|C57E    |00007E;
    SEP #$20                                                   ;84B81E|E220    |      ;
    LDY.W #$0002                                               ;84B820|A00200  |      ;
    LDA.B [ptrUnknown0x72],Y                                   ;84B823|B772    |000072;
    SBC.B n16TempVar2                                          ;84B825|E580    |000080;
    BCC +                                                      ;84B827|9018    |84B841;
    REP #$20                                                   ;84B829|C220    |      ;
    LDA.B [ptrUnknown0x72]                                     ;84B82B|A772    |000072;
    CMP.B n16TempVar3                                          ;84B82D|C582    |000082;
    SEP #$20                                                   ;84B82F|E220    |      ;
    LDY.W #$0002                                               ;84B831|A00200  |      ;
    LDA.B [ptrUnknown0x72],Y                                   ;84B834|B772    |000072;
    SBC.B n16TempVar4                                          ;84B836|E584    |000084;
    BCS +                                                      ;84B838|B007    |84B841;
    REP #$20                                                   ;84B83A|C220    |      ;
    LDA.B [ptrAIActionData]                                    ;84B83C|A7C9    |0000C9;
    STA.B ptrAIActionData                                      ;84B83E|85C9    |0000C9;
    RTS                                                        ;84B840|60      |      ;
 
 
  + REP #$30                                                   ;84B841|C230    |      ;
    LDA.B ptrAIActionData                                      ;84B843|A5C9    |0000C9;
    CLC                                                        ;84B845|18      |      ;
    ADC.W #$0002                                               ;84B846|690200  |      ;
    STA.B ptrAIActionData                                      ;84B849|85C9    |0000C9;
    RTS                                                        ;84B84B|60      |      ;
 
 
fAIAction0x47:
    REP #$30                                                   ;84B84C|C230    |      ;
    REP #$30                                                   ;84B84E|C230    |      ;
    LDA.B ptrAIActionData                                      ;84B850|A5C9    |0000C9;
    CLC                                                        ;84B852|18      |      ;
    ADC.W #$0001                                               ;84B853|690100  |      ;
    STA.B ptrAIActionData                                      ;84B856|85C9    |0000C9;
    REP #$20                                                   ;84B858|C220    |      ;
    LDA.B [ptrAIActionData]                                    ;84B85A|A7C9    |0000C9;
    STA.B ptrUnknown0x72                                       ;84B85C|8572    |000072;
    REP #$30                                                   ;84B85E|C230    |      ;
    LDA.B ptrAIActionData                                      ;84B860|A5C9    |0000C9;
    CLC                                                        ;84B862|18      |      ;
    ADC.W #$0002                                               ;84B863|690200  |      ;
    STA.B ptrAIActionData                                      ;84B866|85C9    |0000C9;
    SEP #$20                                                   ;84B868|E220    |      ;
    LDA.B [ptrAIActionData]                                    ;84B86A|A7C9    |0000C9;
    STA.B ptrUnknown0x72+2                                     ;84B86C|8574    |000074;
    REP #$30                                                   ;84B86E|C230    |      ;
    LDA.B ptrAIActionData                                      ;84B870|A5C9    |0000C9;
    CLC                                                        ;84B872|18      |      ;
    ADC.W #$0001                                               ;84B873|690100  |      ;
    STA.B ptrAIActionData                                      ;84B876|85C9    |0000C9;
    SEP #$20                                                   ;84B878|E220    |      ;
    LDA.B [ptrAIActionData]                                    ;84B87A|A7C9    |0000C9;
    STA.B [ptrUnknown0x72]                                     ;84B87C|8772    |000072;
    REP #$30                                                   ;84B87E|C230    |      ;
    LDA.B ptrAIActionData                                      ;84B880|A5C9    |0000C9;
    CLC                                                        ;84B882|18      |      ;
    ADC.W #$0001                                               ;84B883|690100  |      ;
    STA.B ptrAIActionData                                      ;84B886|85C9    |0000C9;
    RTS                                                        ;84B888|60      |      ;
 
 
fAIAction0x48:
    REP #$30                                                   ;84B889|C230    |      ;
    REP #$30                                                   ;84B88B|C230    |      ;
    LDA.B ptrAIActionData                                      ;84B88D|A5C9    |0000C9;
    CLC                                                        ;84B88F|18      |      ;
    ADC.W #$0001                                               ;84B890|690100  |      ;
    STA.B ptrAIActionData                                      ;84B893|85C9    |0000C9;
    REP #$20                                                   ;84B895|C220    |      ;
    LDA.B [ptrAIActionData]                                    ;84B897|A7C9    |0000C9;
    STA.B ptrUnknown0x72                                       ;84B899|8572    |000072;
    REP #$30                                                   ;84B89B|C230    |      ;
    LDA.B ptrAIActionData                                      ;84B89D|A5C9    |0000C9;
    CLC                                                        ;84B89F|18      |      ;
    ADC.W #$0002                                               ;84B8A0|690200  |      ;
    STA.B ptrAIActionData                                      ;84B8A3|85C9    |0000C9;
    SEP #$20                                                   ;84B8A5|E220    |      ;
    LDA.B [ptrAIActionData]                                    ;84B8A7|A7C9    |0000C9;
    STA.B ptrUnknown0x72+2                                     ;84B8A9|8574    |000074;
    REP #$30                                                   ;84B8AB|C230    |      ;
    LDA.B ptrAIActionData                                      ;84B8AD|A5C9    |0000C9;
    CLC                                                        ;84B8AF|18      |      ;
    ADC.W #$0001                                               ;84B8B0|690100  |      ;
    STA.B ptrAIActionData                                      ;84B8B3|85C9    |0000C9;
    REP #$20                                                   ;84B8B5|C220    |      ;
    LDA.B [ptrAIActionData]                                    ;84B8B7|A7C9    |0000C9;
    STA.B [ptrUnknown0x72]                                     ;84B8B9|8772    |000072;
    REP #$30                                                   ;84B8BB|C230    |      ;
    LDA.B ptrAIActionData                                      ;84B8BD|A5C9    |0000C9;
    CLC                                                        ;84B8BF|18      |      ;
    ADC.W #$0002                                               ;84B8C0|690200  |      ;
    STA.B ptrAIActionData                                      ;84B8C3|85C9    |0000C9;
    SEP #$20                                                   ;84B8C5|E220    |      ;
    LDA.B [ptrAIActionData]                                    ;84B8C7|A7C9    |0000C9;
    LDY.W #$0002                                               ;84B8C9|A00200  |      ;
    STA.B [ptrUnknown0x72],Y                                   ;84B8CC|9772    |000072;
    REP #$30                                                   ;84B8CE|C230    |      ;
    LDA.B ptrAIActionData                                      ;84B8D0|A5C9    |0000C9;
    CLC                                                        ;84B8D2|18      |      ;
    ADC.W #$0001                                               ;84B8D3|690100  |      ;
    STA.B ptrAIActionData                                      ;84B8D6|85C9    |0000C9;
    RTS                                                        ;84B8D8|60      |      ;
 
 
fAIAction0x49:
    REP #$30                                                   ;84B8D9|C230    |      ;
    REP #$30                                                   ;84B8DB|C230    |      ;
    LDA.B ptrAIActionData                                      ;84B8DD|A5C9    |0000C9;
    CLC                                                        ;84B8DF|18      |      ;
    ADC.W #$0001                                               ;84B8E0|690100  |      ;
    STA.B ptrAIActionData                                      ;84B8E3|85C9    |0000C9;
    LDA.B [ptrAIActionData]                                    ;84B8E5|A7C9    |0000C9;
    REP #$30                                                   ;84B8E7|C230    |      ;
    LDY.W #$0033                                               ;84B8E9|A03300  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84B8EC|97CC    |0000CC;
    REP #$30                                                   ;84B8EE|C230    |      ;
    LDA.B ptrAIActionData                                      ;84B8F0|A5C9    |0000C9;
    CLC                                                        ;84B8F2|18      |      ;
    ADC.W #$0002                                               ;84B8F3|690200  |      ;
    STA.B ptrAIActionData                                      ;84B8F6|85C9    |0000C9;
    REP #$20                                                   ;84B8F8|C220    |      ;
    LDA.B nPlayerDirection                                     ;84B8FA|A5DA    |0000DA;
    SEP #$20                                                   ;84B8FC|E220    |      ;
    SEP #$20                                                   ;84B8FE|E220    |      ;
    REP #$10                                                   ;84B900|C210    |      ;
    LDY.W #$0002                                               ;84B902|A00200  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84B905|97CC    |0000CC;
    SEP #$20                                                   ;84B907|E220    |      ;
    REP #$10                                                   ;84B909|C210    |      ;
    LDY.W #$0001                                               ;84B90B|A00100  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84B90E|B7CC    |0000CC;
    ORA.B #$03                                                 ;84B910|0903    |      ;
    SEP #$20                                                   ;84B912|E220    |      ;
    REP #$10                                                   ;84B914|C210    |      ;
    LDY.W #$0001                                               ;84B916|A00100  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84B919|97CC    |0000CC;
    REP #$30                                                   ;84B91B|C230    |      ;
    LDY.W #$0033                                               ;84B91D|A03300  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84B920|B7CC    |0000CC;
    STA.B ptrUnknown0x72                                       ;84B922|8572    |000072;
    SEP #$20                                                   ;84B924|E220    |      ;
    LDA.B #$B3                                                 ;84B926|A9B3    |      ;
    STA.B ptrUnknown0x72+2                                     ;84B928|8574    |000074;
    JSL.L fAI_Unknown848895                                    ;84B92A|22958884|848895;
    REP #$30                                                   ;84B92E|C230    |      ;
    LDY.W #$0010                                               ;84B930|A01000  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84B933|B7CC    |0000CC;
    CLC                                                        ;84B935|18      |      ;
    ADC.W #$0001                                               ;84B936|690100  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84B939|97CC    |0000CC;
    RTS                                                        ;84B93B|60      |      ;
 
 
fAIAction0x4A_UpdatePowerBerry:
    REP #$30                                                   ;84B93C|C230    |      ;
    REP #$30                                                   ;84B93E|C230    |      ;
    LDA.B ptrAIActionData                                      ;84B940|A5C9    |0000C9;
    CLC                                                        ;84B942|18      |      ;
    ADC.W #$0001                                               ;84B943|690100  |      ;
    STA.B ptrAIActionData                                      ;84B946|85C9    |0000C9;
    SEP #$20                                                   ;84B948|E220    |      ;
    REP #$10                                                   ;84B94A|C210    |      ;
    LDY.W #$000C                                               ;84B94C|A00C00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84B94F|B7CC    |0000CC;
    CMP.B #$00                                                 ;84B951|C900    |      ;
    BNE +                                                      ;84B953|D003    |84B958;
    JMP.W .return                                              ;84B955|4C02BA  |84BA02;
 
 
  + REP #$30                                                   ;84B958|C230    |      ;
    LDA.B nPlayerAction                                        ;84B95A|A5D4    |0000D4;
    CMP.W #$000A                                               ;84B95C|C90A00  |      ;
    BNE +                                                      ;84B95F|D003    |84B964;
    JMP.W .return                                              ;84B961|4C02BA  |84BA02;
 
 
  + REP #$30                                                   ;84B964|C230    |      ;
    LDA.B nPlayerAction                                        ;84B966|A5D4    |0000D4;
    CMP.W #$000C                                               ;84B968|C90C00  |      ;
    BNE +                                                      ;84B96B|D003    |84B970;
    JMP.W .return                                              ;84B96D|4C02BA  |84BA02;
 
 
  + REP #$30                                                   ;84B970|C230    |      ;
    LDA.B nPlayerAction                                        ;84B972|A5D4    |0000D4;
    CMP.W #$000D                                               ;84B974|C90D00  |      ;
    BNE +                                                      ;84B977|D003    |84B97C;
    JMP.W .return                                              ;84B979|4C02BA  |84BA02;
 
 
  + REP #$30                                                   ;84B97C|C230    |      ;
    LDA.B nPlayerAction                                        ;84B97E|A5D4    |0000D4;
    CMP.W #$001B                                               ;84B980|C91B00  |      ;
    BNE +                                                      ;84B983|D003    |84B988;
    JMP.W .return                                              ;84B985|4C02BA  |84BA02;
 
 
  + REP #$20                                                   ;84B988|C220    |      ;
    LDA.B strcPlayerFlags                                      ;84B98A|A5D2    |0000D2;
    AND.W #$0004                                               ;84B98C|290400  |      ;
    BNE .return                                                ;84B98F|D071    |84BA02;
    LDA.L strcDailyFlags.flags4                                ;84B991|AF601F7F|7F1F60;
    AND.W #$0006                                               ;84B995|290600  |      ;
    BNE .return                                                ;84B998|D068    |84BA02;
    REP #$20                                                   ;84B99A|C220    |      ;
    LDA.W strcJoypad1.newInput                                 ;84B99C|AD2801  |000128;
    BIT.W #$0080                                               ;84B99F|898000  |      ;
    BNE +                                                      ;84B9A2|D003    |84B9A7;
    JMP.W .return                                              ;84B9A4|4C02BA  |84BA02;
 
 
  + REP #$30                                                   ;84B9A7|C230    |      ;
    LDA.B strcPlayerFlags                                      ;84B9A9|A5D2    |0000D2;
    AND.W #$0800                                               ;84B9AB|290008  |      ;
    BEQ +                                                      ;84B9AE|F003    |84B9B3;
    JMP.W .return                                              ;84B9B0|4C02BA  |84BA02;
 
 
  + LDA.B nPlayerAction                                        ;84B9B3|A5D4    |0000D4;
    CMP.W #$0017                                               ;84B9B5|C91700  |      ;
    BNE +                                                      ;84B9B8|D003    |84B9BD;
    JMP.W .return                                              ;84B9BA|4C02BA  |84BA02;
 
 
  + SEP #$20                                                   ;84B9BD|E220    |      ;
    LDA.W $091D                                                ;84B9BF|AD1D09  |00091D;
    BEQ +                                                      ;84B9C2|F003    |84B9C7;
    JMP.W .return                                              ;84B9C4|4C02BA  |84BA02;
 
 
  + SEP #$20                                                   ;84B9C7|E220    |      ;
    REP #$10                                                   ;84B9C9|C210    |      ;
    LDY.W #$0000                                               ;84B9CB|A00000  |      ;
    LDA.B #$00                                                 ;84B9CE|A900    |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84B9D0|97CC    |0000CC;
    SEP #$20                                                   ;84B9D2|E220    |      ;
    REP #$10                                                   ;84B9D4|C210    |      ;
    LDY.W #$0001                                               ;84B9D6|A00100  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84B9D9|B7CC    |0000CC;
    ORA.B #$40                                                 ;84B9DB|0940    |      ;
    SEP #$20                                                   ;84B9DD|E220    |      ;
    REP #$10                                                   ;84B9DF|C210    |      ;
    LDY.W #$0001                                               ;84B9E1|A00100  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84B9E4|97CC    |0000CC;
    REP #$30                                                   ;84B9E6|C230    |      ;
    LDY.W #$0010                                               ;84B9E8|A01000  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84B9EB|B7CC    |0000CC;
    CLC                                                        ;84B9ED|18      |      ;
    ADC.W #$0001                                               ;84B9EE|690100  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84B9F1|97CC    |0000CC;
    SEP #$20                                                   ;84B9F3|E220    |      ;
    LDA.B #$08                                                 ;84B9F5|A908    |      ;
    STA.W $091D                                                ;84B9F7|8D1D09  |00091D;
    REP #$30                                                   ;84B9FA|C230    |      ;
    LDA.W #$0004                                               ;84B9FC|A90400  |      ;
    STA.B nPlayerAction                                        ;84B9FF|85D4    |0000D4;
    RTS                                                        ;84BA01|60      |      ;
 
 
.return:
    REP #$30                                                   ;84BA02|C230    |      ;
    LDY.W #$0010                                               ;84BA04|A01000  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84BA07|B7CC    |0000CC;
    CLC                                                        ;84BA09|18      |      ;
    ADC.W #$0001                                               ;84BA0A|690100  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84BA0D|97CC    |0000CC;
    RTS                                                        ;84BA0F|60      |      ;
 
 
fAIAction0x4B:
    REP #$30                                                   ;84BA10|C230    |      ;
    REP #$30                                                   ;84BA12|C230    |      ;
    LDA.B ptrAIActionData                                      ;84BA14|A5C9    |0000C9;
    CLC                                                        ;84BA16|18      |      ;
    ADC.W #$0001                                               ;84BA17|690100  |      ;
    STA.B ptrAIActionData                                      ;84BA1A|85C9    |0000C9;
    SEP #$20                                                   ;84BA1C|E220    |      ;
    LDA.B [ptrAIActionData]                                    ;84BA1E|A7C9    |0000C9;
    PHA                                                        ;84BA20|48      |      ;
    REP #$30                                                   ;84BA21|C230    |      ;
    LDA.B ptrAIActionData                                      ;84BA23|A5C9    |0000C9;
    CLC                                                        ;84BA25|18      |      ;
    ADC.W #$0001                                               ;84BA26|690100  |      ;
    STA.B ptrAIActionData                                      ;84BA29|85C9    |0000C9;
    REP #$20                                                   ;84BA2B|C220    |      ;
    LDA.B [ptrAIActionData]                                    ;84BA2D|A7C9    |0000C9;
    PHA                                                        ;84BA2F|48      |      ;
    REP #$30                                                   ;84BA30|C230    |      ;
    LDA.B ptrAIActionData                                      ;84BA32|A5C9    |0000C9;
    CLC                                                        ;84BA34|18      |      ;
    ADC.W #$0002                                               ;84BA35|690200  |      ;
    STA.B ptrAIActionData                                      ;84BA38|85C9    |0000C9;
    LDA.B [ptrAIActionData]                                    ;84BA3A|A7C9    |0000C9;
    PHA                                                        ;84BA3C|48      |      ;
    REP #$30                                                   ;84BA3D|C230    |      ;
    LDA.B ptrAIActionData                                      ;84BA3F|A5C9    |0000C9;
    CLC                                                        ;84BA41|18      |      ;
    ADC.W #$0002                                               ;84BA42|690200  |      ;
    STA.B ptrAIActionData                                      ;84BA45|85C9    |0000C9;
    PLY                                                        ;84BA47|7A      |      ;
    PLX                                                        ;84BA48|FA      |      ;
    SEP #$20                                                   ;84BA49|E220    |      ;
    PLA                                                        ;84BA4B|68      |      ;
    JSL.L fUnknown_82B03A                                      ;84BA4C|223AB082|82B03A;
    RTS                                                        ;84BA50|60      |      ;
 
 
fAIAction0x4C:
    REP #$30                                                   ;84BA51|C230    |      ;
    REP #$30                                                   ;84BA53|C230    |      ;
    LDA.B ptrAIActionData                                      ;84BA55|A5C9    |0000C9;
    CLC                                                        ;84BA57|18      |      ;
    ADC.W #$0001                                               ;84BA58|690100  |      ;
    STA.B ptrAIActionData                                      ;84BA5B|85C9    |0000C9;
    SEP #$20                                                   ;84BA5D|E220    |      ;
    REP #$10                                                   ;84BA5F|C210    |      ;
    LDY.W #$0000                                               ;84BA61|A00000  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84BA64|B7CC    |0000CC;
    ORA.B #$02                                                 ;84BA66|0902    |      ;
    SEP #$20                                                   ;84BA68|E220    |      ;
    REP #$10                                                   ;84BA6A|C210    |      ;
    LDY.W #$0000                                               ;84BA6C|A00000  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84BA6F|97CC    |0000CC;
    RTS                                                        ;84BA71|60      |      ;
 
 
fAIAction0x4D:
    REP #$30                                                   ;84BA72|C230    |      ;
    REP #$30                                                   ;84BA74|C230    |      ;
    LDA.B ptrAIActionData                                      ;84BA76|A5C9    |0000C9;
    CLC                                                        ;84BA78|18      |      ;
    ADC.W #$0001                                               ;84BA79|690100  |      ;
    STA.B ptrAIActionData                                      ;84BA7C|85C9    |0000C9;
    SEP #$20                                                   ;84BA7E|E220    |      ;
    REP #$10                                                   ;84BA80|C210    |      ;
    LDY.W #$000C                                               ;84BA82|A00C00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84BA85|B7CC    |0000CC;
    CMP.B #$00                                                 ;84BA87|C900    |      ;
    BNE +                                                      ;84BA89|D003    |84BA8E;
    JMP.W .return                                              ;84BA8B|4C26BB  |84BB26;
 
 
  + REP #$30                                                   ;84BA8E|C230    |      ;
    LDA.B nPlayerAction                                        ;84BA90|A5D4    |0000D4;
    CMP.W #$000A                                               ;84BA92|C90A00  |      ;
    BNE +                                                      ;84BA95|D003    |84BA9A;
    JMP.W .return                                              ;84BA97|4C26BB  |84BB26;
 
 
  + REP #$20                                                   ;84BA9A|C220    |      ;
    LDA.L strcDailyFlags.flags3                                ;84BA9C|AF5E1F7F|7F1F5E;
    AND.W #$0040                                               ;84BAA0|294000  |      ;
    BNE +                                                      ;84BAA3|D003    |84BAA8;
    JMP.W .return                                              ;84BAA5|4C26BB  |84BB26;
 
 
  + REP #$20                                                   ;84BAA8|C220    |      ;
    LDA.B [ptrAIActionData]                                    ;84BAAA|A7C9    |0000C9;
    STA.B ptrAIActionData                                      ;84BAAC|85C9    |0000C9;
    SEP #$20                                                   ;84BAAE|E220    |      ;
    REP #$10                                                   ;84BAB0|C210    |      ;
    LDY.W #$0007                                               ;84BAB2|A00700  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84BAB5|B7CC    |0000CC;
    SEP #$20                                                   ;84BAB7|E220    |      ;
    REP #$10                                                   ;84BAB9|C210    |      ;
    LDY.W #$0008                                               ;84BABB|A00800  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84BABE|97CC    |0000CC;
    SEP #$20                                                   ;84BAC0|E220    |      ;
    REP #$10                                                   ;84BAC2|C210    |      ;
    LDY.W #$0003                                               ;84BAC4|A00300  |      ;
    LDA.B #$00                                                 ;84BAC7|A900    |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84BAC9|97CC    |0000CC;
    SEP #$20                                                   ;84BACB|E220    |      ;
    REP #$10                                                   ;84BACD|C210    |      ;
    LDY.W #$0004                                               ;84BACF|A00400  |      ;
    LDA.B #$00                                                 ;84BAD2|A900    |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84BAD4|97CC    |0000CC;
    SEP #$20                                                   ;84BAD6|E220    |      ;
    REP #$10                                                   ;84BAD8|C210    |      ;
    LDY.W #$000C                                               ;84BADA|A00C00  |      ;
    LDA.B #$00                                                 ;84BADD|A900    |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84BADF|97CC    |0000CC;
    REP #$20                                                   ;84BAE1|C220    |      ;
    LDA.B nPlayerDirection                                     ;84BAE3|A5DA    |0000DA;
    EOR.W #$0001                                               ;84BAE5|490100  |      ;
    SEP #$20                                                   ;84BAE8|E220    |      ;
    REP #$10                                                   ;84BAEA|C210    |      ;
    LDY.W #$0002                                               ;84BAEC|A00200  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84BAEF|97CC    |0000CC;
    REP #$30                                                   ;84BAF1|C230    |      ;
    LDY.W #$0033                                               ;84BAF3|A03300  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84BAF6|B7CC    |0000CC;
    STA.B ptrUnknown0x72                                       ;84BAF8|8572    |000072;
    SEP #$20                                                   ;84BAFA|E220    |      ;
    LDA.B #$B3                                                 ;84BAFC|A9B3    |      ;
    STA.B ptrUnknown0x72+2                                     ;84BAFE|8574    |000074;
    JSL.L fAI_Unknown848895                                    ;84BB00|22958884|848895;
    SEP #$20                                                   ;84BB04|E220    |      ;
    REP #$10                                                   ;84BB06|C210    |      ;
    LDY.W #$0001                                               ;84BB08|A00100  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84BB0B|B7CC    |0000CC;
    ORA.B #$14                                                 ;84BB0D|0914    |      ;
    SEP #$20                                                   ;84BB0F|E220    |      ;
    REP #$10                                                   ;84BB11|C210    |      ;
    LDY.W #$0001                                               ;84BB13|A00100  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84BB16|97CC    |0000CC;
    REP #$30                                                   ;84BB18|C230    |      ;
    LDY.W #$0010                                               ;84BB1A|A01000  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84BB1D|B7CC    |0000CC;
    CLC                                                        ;84BB1F|18      |      ;
    ADC.W #$0001                                               ;84BB20|690100  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84BB23|97CC    |0000CC;
    RTS                                                        ;84BB25|60      |      ;
 
 
.return:
    REP #$30                                                   ;84BB26|C230    |      ;
    LDA.B ptrAIActionData                                      ;84BB28|A5C9    |0000C9;
    CLC                                                        ;84BB2A|18      |      ;
    ADC.W #$0002                                               ;84BB2B|690200  |      ;
    STA.B ptrAIActionData                                      ;84BB2E|85C9    |0000C9;
    RTS                                                        ;84BB30|60      |      ;
 
 
fAIAction0x4E:
    REP #$30                                                   ;84BB31|C230    |      ;
    REP #$30                                                   ;84BB33|C230    |      ;
    LDA.B ptrAIActionData                                      ;84BB35|A5C9    |0000C9;
    CLC                                                        ;84BB37|18      |      ;
    ADC.W #$0001                                               ;84BB38|690100  |      ;
    STA.B ptrAIActionData                                      ;84BB3B|85C9    |0000C9;
    REP #$20                                                   ;84BB3D|C220    |      ;
    LDA.L strcDailyFlags.flags2                                ;84BB3F|AF5C1F7F|7F1F5C;
    AND.W #$FFF7                                               ;84BB43|29F7FF  |      ;
    STA.L strcDailyFlags.flags2                                ;84BB46|8F5C1F7F|7F1F5C;
    RTS                                                        ;84BB4A|60      |      ;
 
 
fAIAction0x4F:
    REP #$30                                                   ;84BB4B|C230    |      ;
    REP #$30                                                   ;84BB4D|C230    |      ;
    LDA.B ptrAIActionData                                      ;84BB4F|A5C9    |0000C9;
    CLC                                                        ;84BB51|18      |      ;
    ADC.W #$0001                                               ;84BB52|690100  |      ;
    STA.B ptrAIActionData                                      ;84BB55|85C9    |0000C9;
    REP #$20                                                   ;84BB57|C220    |      ;
    LDA.L strcDailyFlags.flags4                                ;84BB59|AF601F7F|7F1F60;
    ORA.W #$8000                                               ;84BB5D|090080  |      ;
    STA.L strcDailyFlags.flags4                                ;84BB60|8F601F7F|7F1F60;
    RTS                                                        ;84BB64|60      |      ;
 
    SEP #$20                                                   ;84BB65|E220    |      ;
    LDA.B #$00                                                 ;84BB67|A900    |      ;
    XBA                                                        ;84BB69|EB      |      ;
    LDA.W nToolEquipped                                        ;84BB6A|AD2109  |000921;
    BEQ +                                                      ;84BB6D|F02F    |84BB9E;
    REP #$20                                                   ;84BB6F|C220    |      ;
    ASL A                                                      ;84BB71|0A      |      ;
    ASL A                                                      ;84BB72|0A      |      ;
    ASL A                                                      ;84BB73|0A      |      ;
    CLC                                                        ;84BB74|18      |      ;
    ADC.W #$0006                                               ;84BB75|690600  |      ;
    TAX                                                        ;84BB78|AA      |      ;
    SEP #$20                                                   ;84BB79|E220    |      ;
    LDA.L nCarriedItemTable_81BE0F,X                           ;84BB7B|BF0FBE81|81BE0F;
    PHA                                                        ;84BB7F|48      |      ;
    INX                                                        ;84BB80|E8      |      ;
    LDA.L nCarriedItemTable_81BE0F,X                           ;84BB81|BF0FBE81|81BE0F;
    STA.B n8TempVar1                                           ;84BB85|8592    |000092;
    PLA                                                        ;84BB87|68      |      ;
    XBA                                                        ;84BB88|EB      |      ;
    LDA.B #$00                                                 ;84BB89|A900    |      ;
    XBA                                                        ;84BB8B|EB      |      ;
    REP #$20                                                   ;84BB8C|C220    |      ;
    TAX                                                        ;84BB8E|AA      |      ;
    SEP #$20                                                   ;84BB8F|E220    |      ;
    LDA.L strcShedItems,X                                      ;84BB91|BF001F7F|7F1F00;
    ORA.B n8TempVar1                                           ;84BB95|0592    |000092;
    STA.L strcShedItems,X                                      ;84BB97|9F001F7F|7F1F00;
    STZ.W nToolEquipped                                        ;84BB9B|9C2109  |000921;
 
  + SEP #$20                                                   ;84BB9E|E220    |      ;
    REP #$10                                                   ;84BBA0|C210    |      ;
    LDA.B #$00                                                 ;84BBA2|A900    |      ;
    XBA                                                        ;84BBA4|EB      |      ;
    LDA.W nToolSecond                                          ;84BBA5|AD2309  |000923;
    BEQ .return                                                ;84BBA8|F02F    |84BBD9;
    REP #$20                                                   ;84BBAA|C220    |      ;
    ASL A                                                      ;84BBAC|0A      |      ;
    ASL A                                                      ;84BBAD|0A      |      ;
    ASL A                                                      ;84BBAE|0A      |      ;
    CLC                                                        ;84BBAF|18      |      ;
    ADC.W #$0006                                               ;84BBB0|690600  |      ;
    TAX                                                        ;84BBB3|AA      |      ;
    SEP #$20                                                   ;84BBB4|E220    |      ;
    LDA.L nCarriedItemTable_81BE0F,X                           ;84BBB6|BF0FBE81|81BE0F;
    PHA                                                        ;84BBBA|48      |      ;
    INX                                                        ;84BBBB|E8      |      ;
    LDA.L nCarriedItemTable_81BE0F,X                           ;84BBBC|BF0FBE81|81BE0F;
    STA.B n8TempVar1                                           ;84BBC0|8592    |000092;
    PLA                                                        ;84BBC2|68      |      ;
    XBA                                                        ;84BBC3|EB      |      ;
    LDA.B #$00                                                 ;84BBC4|A900    |      ;
    XBA                                                        ;84BBC6|EB      |      ;
    REP #$20                                                   ;84BBC7|C220    |      ;
    TAX                                                        ;84BBC9|AA      |      ;
    SEP #$20                                                   ;84BBCA|E220    |      ;
    LDA.L strcShedItems,X                                      ;84BBCC|BF001F7F|7F1F00;
    ORA.B n8TempVar1                                           ;84BBD0|0592    |000092;
    STA.L strcShedItems,X                                      ;84BBD2|9F001F7F|7F1F00;
    STZ.W nToolSecond                                          ;84BBD6|9C2309  |000923;
 
.return:
    RTS                                                        ;84BBD9|60      |      ;
 
 
fAIAction0x50:
    REP #$30                                                   ;84BBDA|C230    |      ;
    REP #$30                                                   ;84BBDC|C230    |      ;
    LDA.B ptrAIActionData                                      ;84BBDE|A5C9    |0000C9;
    CLC                                                        ;84BBE0|18      |      ;
    ADC.W #$0001                                               ;84BBE1|690100  |      ;
    STA.B ptrAIActionData                                      ;84BBE4|85C9    |0000C9;
    SEP #$20                                                   ;84BBE6|E220    |      ;
    LDA.W $091D                                                ;84BBE8|AD1D09  |00091D;
    BEQ .label2                                                ;84BBEB|F06F    |84BC5C;
    CMP.B #$25                                                 ;84BBED|C925    |      ;
    BEQ .label1                                                ;84BBEF|F015    |84BC06;
    CMP.B #$26                                                 ;84BBF1|C926    |      ;
    BEQ .label1                                                ;84BBF3|F011    |84BC06;
    STZ.W $091D                                                ;84BBF5|9C1D09  |00091D;
    REP #$30                                                   ;84BBF8|C230    |      ;
    LDA.W #$0000                                               ;84BBFA|A90000  |      ;
    CLC                                                        ;84BBFD|18      |      ;
    ADC.B nPlayerDirection                                     ;84BBFE|65DA    |0000DA;
    STA.W $0901                                                ;84BC00|8D0109  |000901;
    JMP.W .return                                              ;84BC03|4C9BBC  |84BC9B;
 
 
.label1:
    SEP #$20                                                   ;84BC06|E220    |      ;
    REP #$10                                                   ;84BC08|C210    |      ;
    LDA.B #$00                                                 ;84BC0A|A900    |      ;
    XBA                                                        ;84BC0C|EB      |      ;
    LDA.W $0920                                                ;84BC0D|AD2009  |000920;
    SEC                                                        ;84BC10|38      |      ;
    SBC.B #$24                                                 ;84BC11|E924    |      ;
    REP #$20                                                   ;84BC13|C220    |      ;
    PHA                                                        ;84BC15|48      |      ;
    JSL.L fGameEngine_GetChickenData                           ;84BC16|2295C983|83C995;
    SEP #$20                                                   ;84BC1A|E220    |      ;
    LDY.W #$0001                                               ;84BC1C|A00100  |      ;
    LDA.B #$28                                                 ;84BC1F|A928    |      ;
    STA.B [ptrUnknown0x72],Y                                   ;84BC21|9772    |000072;
    LDY.W #$0000                                               ;84BC23|A00000  |      ;
    LDA.B [ptrUnknown0x72],Y                                   ;84BC26|B772    |000072;
    AND.B #$DF                                                 ;84BC28|29DF    |      ;
    STA.B [ptrUnknown0x72],Y                                   ;84BC2A|9772    |000072;
    REP #$20                                                   ;84BC2C|C220    |      ;
    PLA                                                        ;84BC2E|68      |      ;
    ASL A                                                      ;84BC2F|0A      |      ;
    ASL A                                                      ;84BC30|0A      |      ;
    TAX                                                        ;84BC31|AA      |      ;
    LDY.W #$0004                                               ;84BC32|A00400  |      ;
    LDA.L aGameEngine_AddChickenPositionsData,X                ;84BC35|BF10CA83|83CA10;
    CLC                                                        ;84BC39|18      |      ;
    ADC.W #$0010                                               ;84BC3A|691000  |      ;
    STA.B [ptrUnknown0x72],Y                                   ;84BC3D|9772    |000072;
    INX                                                        ;84BC3F|E8      |      ;
    INX                                                        ;84BC40|E8      |      ;
    LDY.W #$0006                                               ;84BC41|A00600  |      ;
    LDA.L aGameEngine_AddChickenPositionsData,X                ;84BC44|BF10CA83|83CA10;
    STA.B [ptrUnknown0x72],Y                                   ;84BC48|9772    |000072;
    SEP #$20                                                   ;84BC4A|E220    |      ;
    STZ.W $091D                                                ;84BC4C|9C1D09  |00091D;
    REP #$30                                                   ;84BC4F|C230    |      ;
    LDA.W #$0000                                               ;84BC51|A90000  |      ;
    CLC                                                        ;84BC54|18      |      ;
    ADC.B nPlayerDirection                                     ;84BC55|65DA    |0000DA;
    STA.W $0901                                                ;84BC57|8D0109  |000901;
    BRA .return                                                ;84BC5A|803F    |84BC9B;
 
 
.label2:
    REP #$30                                                   ;84BC5C|C230    |      ;
    LDA.B strcPlayerFlags                                      ;84BC5E|A5D2    |0000D2;
    AND.W #$0800                                               ;84BC60|290008  |      ;
    BNE +                                                      ;84BC63|D003    |84BC68;
    JMP.W .return                                              ;84BC65|4C9BBC  |84BC9B;
 
 
  + REP #$30                                                   ;84BC68|C230    |      ;
    LDA.W #$0800                                               ;84BC6A|A90008  |      ;
    EOR.W #$FFFF                                               ;84BC6D|49FFFF  |      ;
    AND.B strcPlayerFlags                                      ;84BC70|25D2    |0000D2;
    STA.B strcPlayerFlags                                      ;84BC72|85D2    |0000D2;
    SEP #$20                                                   ;84BC74|E220    |      ;
    LDA.L nCurrentSeasonID                                     ;84BC76|AF191F7F|7F1F19;
    STA.L nDogMapId                                            ;84BC7A|8F301F7F|7F1F30;
    REP #$30                                                   ;84BC7E|C230    |      ;
    LDA.W #$0078                                               ;84BC80|A97800  |      ;
    STA.L nDogX                                                ;84BC83|8F2C1F7F|7F1F2C;
    LDA.W #$01A8                                               ;84BC87|A9A801  |      ;
    STA.L nDogY                                                ;84BC8A|8F2E1F7F|7F1F2E;
    REP #$30                                                   ;84BC8E|C230    |      ;
    LDA.W #$0000                                               ;84BC90|A90000  |      ;
    CLC                                                        ;84BC93|18      |      ;
    ADC.B nPlayerDirection                                     ;84BC94|65DA    |0000DA;
    STA.W $0901                                                ;84BC96|8D0109  |000901;
    BRA .return                                                ;84BC99|8000    |84BC9B;
 
 
.return:
    RTS                                                        ;84BC9B|60      |      ;
 
 
fAIAction0x51:
    REP #$30                                                   ;84BC9C|C230    |      ;
    REP #$30                                                   ;84BC9E|C230    |      ;
    LDA.B ptrAIActionData                                      ;84BCA0|A5C9    |0000C9;
    CLC                                                        ;84BCA2|18      |      ;
    ADC.W #$0001                                               ;84BCA3|690100  |      ;
    STA.B ptrAIActionData                                      ;84BCA6|85C9    |0000C9;
    SEP #$20                                                   ;84BCA8|E220    |      ;
    LDA.W $091D                                                ;84BCAA|AD1D09  |00091D;
    BEQ .label3                                                ;84BCAD|F060    |84BD0F;
    CMP.B #$25                                                 ;84BCAF|C925    |      ;
    BEQ .label2                                                ;84BCB1|F011    |84BCC4;
    CMP.B #$26                                                 ;84BCB3|C926    |      ;
    BEQ .label2                                                ;84BCB5|F00D    |84BCC4;
    CMP.B #$29                                                 ;84BCB7|C929    |      ;
    BEQ .label1                                                ;84BCB9|F003    |84BCBE;
    JMP.W .return                                              ;84BCBB|4C43BD  |84BD43;
 
 
.label1:
    STZ.W $091D                                                ;84BCBE|9C1D09  |00091D;
    JMP.W .return                                              ;84BCC1|4C43BD  |84BD43;
 
 
.label2:
    SEP #$20                                                   ;84BCC4|E220    |      ;
    REP #$10                                                   ;84BCC6|C210    |      ;
    LDA.B #$00                                                 ;84BCC8|A900    |      ;
    XBA                                                        ;84BCCA|EB      |      ;
    LDA.W $0920                                                ;84BCCB|AD2009  |000920;
    SEC                                                        ;84BCCE|38      |      ;
    SBC.B #$24                                                 ;84BCCF|E924    |      ;
    REP #$20                                                   ;84BCD1|C220    |      ;
    PHA                                                        ;84BCD3|48      |      ;
    JSL.L fGameEngine_GetChickenData                           ;84BCD4|2295C983|83C995;
    SEP #$20                                                   ;84BCD8|E220    |      ;
    LDY.W #$0001                                               ;84BCDA|A00100  |      ;
    LDA.B #$28                                                 ;84BCDD|A928    |      ;
    STA.B [ptrUnknown0x72],Y                                   ;84BCDF|9772    |000072;
    LDY.W #$0000                                               ;84BCE1|A00000  |      ;
    LDA.B [ptrUnknown0x72],Y                                   ;84BCE4|B772    |000072;
    AND.B #$DF                                                 ;84BCE6|29DF    |      ;
    STA.B [ptrUnknown0x72],Y                                   ;84BCE8|9772    |000072;
    REP #$20                                                   ;84BCEA|C220    |      ;
    PLA                                                        ;84BCEC|68      |      ;
    ASL A                                                      ;84BCED|0A      |      ;
    ASL A                                                      ;84BCEE|0A      |      ;
    TAX                                                        ;84BCEF|AA      |      ;
    LDY.W #$0004                                               ;84BCF0|A00400  |      ;
    LDA.L aGameEngine_AddChickenPositionsData,X                ;84BCF3|BF10CA83|83CA10;
    CLC                                                        ;84BCF7|18      |      ;
    ADC.W #$0010                                               ;84BCF8|691000  |      ;
    STA.B [ptrUnknown0x72],Y                                   ;84BCFB|9772    |000072;
    INX                                                        ;84BCFD|E8      |      ;
    INX                                                        ;84BCFE|E8      |      ;
    LDY.W #$0006                                               ;84BCFF|A00600  |      ;
    LDA.L aGameEngine_AddChickenPositionsData,X                ;84BD02|BF10CA83|83CA10;
    STA.B [ptrUnknown0x72],Y                                   ;84BD06|9772    |000072;
    SEP #$20                                                   ;84BD08|E220    |      ;
    STZ.W $091D                                                ;84BD0A|9C1D09  |00091D;
    BRA .return                                                ;84BD0D|8034    |84BD43;
 
 
.label3:
    REP #$30                                                   ;84BD0F|C230    |      ;
    LDA.B strcPlayerFlags                                      ;84BD11|A5D2    |0000D2;
    AND.W #$0800                                               ;84BD13|290008  |      ;
    BNE +                                                      ;84BD16|D003    |84BD1B;
    JMP.W .return                                              ;84BD18|4C43BD  |84BD43;
 
 
  + REP #$30                                                   ;84BD1B|C230    |      ;
    LDA.W #$0800                                               ;84BD1D|A90008  |      ;
    EOR.W #$FFFF                                               ;84BD20|49FFFF  |      ;
    AND.B strcPlayerFlags                                      ;84BD23|25D2    |0000D2;
    STA.B strcPlayerFlags                                      ;84BD25|85D2    |0000D2;
    SEP #$20                                                   ;84BD27|E220    |      ;
    LDA.L nCurrentSeasonID                                     ;84BD29|AF191F7F|7F1F19;
    STA.L nDogMapId                                            ;84BD2D|8F301F7F|7F1F30;
    REP #$30                                                   ;84BD31|C230    |      ;
    LDA.W #$0078                                               ;84BD33|A97800  |      ;
    STA.L nDogX                                                ;84BD36|8F2C1F7F|7F1F2C;
    LDA.W #$01A8                                               ;84BD3A|A9A801  |      ;
    STA.L nDogY                                                ;84BD3D|8F2E1F7F|7F1F2E;
    BRA .return                                                ;84BD41|8000    |84BD43;
 
 
.return:
    RTS                                                        ;84BD43|60      |      ;
 
 
fAIAction0x52:
    REP #$30                                                   ;84BD44|C230    |      ;
    REP #$30                                                   ;84BD46|C230    |      ;
    LDA.B ptrAIActionData                                      ;84BD48|A5C9    |0000C9;
    CLC                                                        ;84BD4A|18      |      ;
    ADC.W #$0001                                               ;84BD4B|690100  |      ;
    STA.B ptrAIActionData                                      ;84BD4E|85C9    |0000C9;
    SEP #$20                                                   ;84BD50|E220    |      ;
    REP #$10                                                   ;84BD52|C210    |      ;
    LDY.W #$000C                                               ;84BD54|A00C00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84BD57|B7CC    |0000CC;
    CMP.B #$00                                                 ;84BD59|C900    |      ;
    BNE +                                                      ;84BD5B|D003    |84BD60;
    JMP.W .return                                              ;84BD5D|4CFFBD  |84BDFF;
 
 
  + REP #$30                                                   ;84BD60|C230    |      ;
    LDA.B nPlayerAction                                        ;84BD62|A5D4    |0000D4;
    CMP.W #$000A                                               ;84BD64|C90A00  |      ;
    BNE +                                                      ;84BD67|D003    |84BD6C;
    JMP.W .return                                              ;84BD69|4CFFBD  |84BDFF;
 
 
  + REP #$30                                                   ;84BD6C|C230    |      ;
    LDA.B nPlayerAction                                        ;84BD6E|A5D4    |0000D4;
    CMP.W #$000C                                               ;84BD70|C90C00  |      ;
    BNE +                                                      ;84BD73|D003    |84BD78;
    JMP.W .return                                              ;84BD75|4CFFBD  |84BDFF;
 
 
  + REP #$30                                                   ;84BD78|C230    |      ;
    LDA.B nPlayerAction                                        ;84BD7A|A5D4    |0000D4;
    CMP.W #$000D                                               ;84BD7C|C90D00  |      ;
    BNE +                                                      ;84BD7F|D003    |84BD84;
    JMP.W .return                                              ;84BD81|4CFFBD  |84BDFF;
 
 
  + REP #$30                                                   ;84BD84|C230    |      ;
    LDA.B nPlayerAction                                        ;84BD86|A5D4    |0000D4;
    CMP.W #$001B                                               ;84BD88|C91B00  |      ;
    BNE +                                                      ;84BD8B|D003    |84BD90;
    JMP.W .return                                              ;84BD8D|4CFFBD  |84BDFF;
 
 
  + REP #$20                                                   ;84BD90|C220    |      ;
    LDA.B strcPlayerFlags                                      ;84BD92|A5D2    |0000D2;
    AND.W #$0004                                               ;84BD94|290400  |      ;
    BNE .return                                                ;84BD97|D066    |84BDFF;
    LDA.L strcDailyFlags.flags4                                ;84BD99|AF601F7F|7F1F60;
    AND.W #$0006                                               ;84BD9D|290600  |      ;
    BNE .return                                                ;84BDA0|D05D    |84BDFF;
    REP #$20                                                   ;84BDA2|C220    |      ;
    LDA.W strcJoypad1.newInput                                 ;84BDA4|AD2801  |000128;
    BIT.W #$0080                                               ;84BDA7|898000  |      ;
    BNE +                                                      ;84BDAA|D003    |84BDAF;
    JMP.W .return                                              ;84BDAC|4CFFBD  |84BDFF;
 
 
  + REP #$30                                                   ;84BDAF|C230    |      ;
    LDA.B strcPlayerFlags                                      ;84BDB1|A5D2    |0000D2;
    AND.W #$0800                                               ;84BDB3|290008  |      ;
    BEQ +                                                      ;84BDB6|F003    |84BDBB;
    JMP.W .return                                              ;84BDB8|4CFFBD  |84BDFF;
 
 
  + SEP #$20                                                   ;84BDBB|E220    |      ;
    LDA.W $091D                                                ;84BDBD|AD1D09  |00091D;
    BEQ +                                                      ;84BDC0|F003    |84BDC5;
    JMP.W .return                                              ;84BDC2|4CFFBD  |84BDFF;
 
 
  + SEP #$20                                                   ;84BDC5|E220    |      ;
    REP #$10                                                   ;84BDC7|C210    |      ;
    LDY.W #$0000                                               ;84BDC9|A00000  |      ;
    LDA.B #$00                                                 ;84BDCC|A900    |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84BDCE|97CC    |0000CC;
    SEP #$20                                                   ;84BDD0|E220    |      ;
    REP #$10                                                   ;84BDD2|C210    |      ;
    LDY.W #$0001                                               ;84BDD4|A00100  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84BDD7|B7CC    |0000CC;
    ORA.B #$40                                                 ;84BDD9|0940    |      ;
    SEP #$20                                                   ;84BDDB|E220    |      ;
    REP #$10                                                   ;84BDDD|C210    |      ;
    LDY.W #$0001                                               ;84BDDF|A00100  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84BDE2|97CC    |0000CC;
    REP #$30                                                   ;84BDE4|C230    |      ;
    LDY.W #$0010                                               ;84BDE6|A01000  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84BDE9|B7CC    |0000CC;
    CLC                                                        ;84BDEB|18      |      ;
    ADC.W #$0001                                               ;84BDEC|690100  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84BDEF|97CC    |0000CC;
    REP #$30                                                   ;84BDF1|C230    |      ;
    LDA.L strcDailyFlags.flags4                                ;84BDF3|AF601F7F|7F1F60;
    ORA.W #$0002                                               ;84BDF7|090200  |      ;
    STA.L strcDailyFlags.flags4                                ;84BDFA|8F601F7F|7F1F60;
    RTS                                                        ;84BDFE|60      |      ;
 
 
.return:
    REP #$30                                                   ;84BDFF|C230    |      ;
    LDY.W #$0010                                               ;84BE01|A01000  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84BE04|B7CC    |0000CC;
    CLC                                                        ;84BE06|18      |      ;
    ADC.W #$0001                                               ;84BE07|690100  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84BE0A|97CC    |0000CC;
    RTS                                                        ;84BE0C|60      |      ;
 
 
fAIAction0x53:
    REP #$30                                                   ;84BE0D|C230    |      ;
    REP #$30                                                   ;84BE0F|C230    |      ;
    LDA.B ptrAIActionData                                      ;84BE11|A5C9    |0000C9;
    CLC                                                        ;84BE13|18      |      ;
    ADC.W #$0001                                               ;84BE14|690100  |      ;
    STA.B ptrAIActionData                                      ;84BE17|85C9    |0000C9;
    SEP #$20                                                   ;84BE19|E220    |      ;
    REP #$10                                                   ;84BE1B|C210    |      ;
    LDY.W #$000C                                               ;84BE1D|A00C00  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84BE20|B7CC    |0000CC;
    CMP.B #$00                                                 ;84BE22|C900    |      ;
    BNE +                                                      ;84BE24|D003    |84BE29;
    JMP.W .return                                              ;84BE26|4CC8BE  |84BEC8;
 
 
  + REP #$30                                                   ;84BE29|C230    |      ;
    LDA.B nPlayerAction                                        ;84BE2B|A5D4    |0000D4;
    CMP.W #$000A                                               ;84BE2D|C90A00  |      ;
    BNE +                                                      ;84BE30|D003    |84BE35;
    JMP.W .return                                              ;84BE32|4CC8BE  |84BEC8;
 
 
  + REP #$30                                                   ;84BE35|C230    |      ;
    LDA.B nPlayerAction                                        ;84BE37|A5D4    |0000D4;
    CMP.W #$000C                                               ;84BE39|C90C00  |      ;
    BNE +                                                      ;84BE3C|D003    |84BE41;
    JMP.W .return                                              ;84BE3E|4CC8BE  |84BEC8;
 
 
  + REP #$30                                                   ;84BE41|C230    |      ;
    LDA.B nPlayerAction                                        ;84BE43|A5D4    |0000D4;
    CMP.W #$000D                                               ;84BE45|C90D00  |      ;
    BNE +                                                      ;84BE48|D003    |84BE4D;
    JMP.W .return                                              ;84BE4A|4CC8BE  |84BEC8;
 
 
  + REP #$30                                                   ;84BE4D|C230    |      ;
    LDA.B nPlayerAction                                        ;84BE4F|A5D4    |0000D4;
    CMP.W #$001B                                               ;84BE51|C91B00  |      ;
    BNE +                                                      ;84BE54|D003    |84BE59;
    JMP.W .return                                              ;84BE56|4CC8BE  |84BEC8;
 
 
  + REP #$20                                                   ;84BE59|C220    |      ;
    LDA.B strcPlayerFlags                                      ;84BE5B|A5D2    |0000D2;
    AND.W #$0004                                               ;84BE5D|290400  |      ;
    BNE .return                                                ;84BE60|D066    |84BEC8;
    LDA.L strcDailyFlags.flags4                                ;84BE62|AF601F7F|7F1F60;
    AND.W #$0006                                               ;84BE66|290600  |      ;
    BNE .return                                                ;84BE69|D05D    |84BEC8;
    REP #$20                                                   ;84BE6B|C220    |      ;
    LDA.W strcJoypad1.newInput                                 ;84BE6D|AD2801  |000128;
    BIT.W #$0080                                               ;84BE70|898000  |      ;
    BNE +                                                      ;84BE73|D003    |84BE78;
    JMP.W .return                                              ;84BE75|4CC8BE  |84BEC8;
 
 
  + REP #$30                                                   ;84BE78|C230    |      ;
    LDA.B strcPlayerFlags                                      ;84BE7A|A5D2    |0000D2;
    AND.W #$0800                                               ;84BE7C|290008  |      ;
    BEQ +                                                      ;84BE7F|F003    |84BE84;
    JMP.W .return                                              ;84BE81|4CC8BE  |84BEC8;
 
 
  + SEP #$20                                                   ;84BE84|E220    |      ;
    LDA.W $091D                                                ;84BE86|AD1D09  |00091D;
    BEQ +                                                      ;84BE89|F003    |84BE8E;
    JMP.W .return                                              ;84BE8B|4CC8BE  |84BEC8;
 
 
  + SEP #$20                                                   ;84BE8E|E220    |      ;
    REP #$10                                                   ;84BE90|C210    |      ;
    LDY.W #$0000                                               ;84BE92|A00000  |      ;
    LDA.B #$00                                                 ;84BE95|A900    |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84BE97|97CC    |0000CC;
    SEP #$20                                                   ;84BE99|E220    |      ;
    REP #$10                                                   ;84BE9B|C210    |      ;
    LDY.W #$0001                                               ;84BE9D|A00100  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84BEA0|B7CC    |0000CC;
    ORA.B #$40                                                 ;84BEA2|0940    |      ;
    SEP #$20                                                   ;84BEA4|E220    |      ;
    REP #$10                                                   ;84BEA6|C210    |      ;
    LDY.W #$0001                                               ;84BEA8|A00100  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84BEAB|97CC    |0000CC;
    REP #$30                                                   ;84BEAD|C230    |      ;
    LDY.W #$0010                                               ;84BEAF|A01000  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84BEB2|B7CC    |0000CC;
    CLC                                                        ;84BEB4|18      |      ;
    ADC.W #$0001                                               ;84BEB5|690100  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84BEB8|97CC    |0000CC;
    REP #$30                                                   ;84BEBA|C230    |      ;
    LDA.L strcDailyFlags.flags4                                ;84BEBC|AF601F7F|7F1F60;
    ORA.W #$0004                                               ;84BEC0|090400  |      ;
    STA.L strcDailyFlags.flags4                                ;84BEC3|8F601F7F|7F1F60;
    RTS                                                        ;84BEC7|60      |      ;
 
 
.return:
    REP #$30                                                   ;84BEC8|C230    |      ;
    LDY.W #$0010                                               ;84BECA|A01000  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84BECD|B7CC    |0000CC;
    CLC                                                        ;84BECF|18      |      ;
    ADC.W #$0001                                               ;84BED0|690100  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84BED3|97CC    |0000CC;
    RTS                                                        ;84BED5|60      |      ;
 
 
fAIAction0x54:
    REP #$30                                                   ;84BED6|C230    |      ;
    REP #$30                                                   ;84BED8|C230    |      ;
    LDA.B ptrAIActionData                                      ;84BEDA|A5C9    |0000C9;
    CLC                                                        ;84BEDC|18      |      ;
    ADC.W #$0001                                               ;84BEDD|690100  |      ;
    STA.B ptrAIActionData                                      ;84BEE0|85C9    |0000C9;
    REP #$20                                                   ;84BEE2|C220    |      ;
    LDA.B [ptrAIActionData]                                    ;84BEE4|A7C9    |0000C9;
    TAX                                                        ;84BEE6|AA      |      ;
    REP #$30                                                   ;84BEE7|C230    |      ;
    LDA.B ptrAIActionData                                      ;84BEE9|A5C9    |0000C9;
    CLC                                                        ;84BEEB|18      |      ;
    ADC.W #$0002                                               ;84BEEC|690200  |      ;
    STA.B ptrAIActionData                                      ;84BEEF|85C9    |0000C9;
    SEP #$20                                                   ;84BEF1|E220    |      ;
    LDA.B [ptrAIActionData]                                    ;84BEF3|A7C9    |0000C9;
    STA.W $0191                                                ;84BEF5|8D9101  |000191;
    REP #$20                                                   ;84BEF8|C220    |      ;
    STZ.W $09B1                                                ;84BEFA|9CB109  |0009B1;
    SEP #$20                                                   ;84BEFD|E220    |      ;
    LDA.B #$06                                                 ;84BEFF|A906    |      ;
    STA.W $019A                                                ;84BF01|8D9A01  |00019A;
    JSL.L fDialog_DialogHandler                                ;84BF04|225F9383|83935F;
    REP #$30                                                   ;84BF08|C230    |      ;
    LDA.B ptrAIActionData                                      ;84BF0A|A5C9    |0000C9;
    CLC                                                        ;84BF0C|18      |      ;
    ADC.W #$0001                                               ;84BF0D|690100  |      ;
    STA.B ptrAIActionData                                      ;84BF10|85C9    |0000C9;
    REP #$30                                                   ;84BF12|C230    |      ;
    LDY.W #$0010                                               ;84BF14|A01000  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;84BF17|B7CC    |0000CC;
    CLC                                                        ;84BF19|18      |      ;
    ADC.W #$0001                                               ;84BF1A|690100  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;84BF1D|97CC    |0000CC;
    RTS                                                        ;84BF1F|60      |      ;
 
 
fAIAction0x55:
    REP #$30                                                   ;84BF20|C230    |      ;
    REP #$30                                                   ;84BF22|C230    |      ;
    LDA.B ptrAIActionData                                      ;84BF24|A5C9    |0000C9;
    CLC                                                        ;84BF26|18      |      ;
    ADC.W #$0001                                               ;84BF27|690100  |      ;
    STA.B ptrAIActionData                                      ;84BF2A|85C9    |0000C9;
    REP #$20                                                   ;84BF2C|C220    |      ;
    LDA.B [ptrAIActionData]                                    ;84BF2E|A7C9    |0000C9;
    STA.B ptrUnknown0x72                                       ;84BF30|8572    |000072;
    REP #$30                                                   ;84BF32|C230    |      ;
    LDA.B ptrAIActionData                                      ;84BF34|A5C9    |0000C9;
    CLC                                                        ;84BF36|18      |      ;
    ADC.W #$0002                                               ;84BF37|690200  |      ;
    STA.B ptrAIActionData                                      ;84BF3A|85C9    |0000C9;
    SEP #$20                                                   ;84BF3C|E220    |      ;
    LDA.B [ptrAIActionData]                                    ;84BF3E|A7C9    |0000C9;
    STA.B ptrUnknown0x72+2                                     ;84BF40|8574    |000074;
    REP #$30                                                   ;84BF42|C230    |      ;
    LDA.B ptrAIActionData                                      ;84BF44|A5C9    |0000C9;
    CLC                                                        ;84BF46|18      |      ;
    ADC.W #$0001                                               ;84BF47|690100  |      ;
    STA.B ptrAIActionData                                      ;84BF4A|85C9    |0000C9;
    SEP #$20                                                   ;84BF4C|E220    |      ;
    LDA.B #$00                                                 ;84BF4E|A900    |      ;
    XBA                                                        ;84BF50|EB      |      ;
    LDA.B [ptrAIActionData]                                    ;84BF51|A7C9    |0000C9;
    REP #$20                                                   ;84BF53|C220    |      ;
    ASL A                                                      ;84BF55|0A      |      ;
    TAX                                                        ;84BF56|AA      |      ;
    LDA.L aAICheckFlags,X                                      ;84BF57|BF14C084|84C014;
    STA.B n16TempVar1                                          ;84BF5B|857E    |00007E;
    REP #$30                                                   ;84BF5D|C230    |      ;
    LDA.B ptrAIActionData                                      ;84BF5F|A5C9    |0000C9;
    CLC                                                        ;84BF61|18      |      ;
    ADC.W #$0001                                               ;84BF62|690100  |      ;
    STA.B ptrAIActionData                                      ;84BF65|85C9    |0000C9;
    REP #$20                                                   ;84BF67|C220    |      ;
    LDA.B [ptrUnknown0x72]                                     ;84BF69|A772    |000072;
    AND.B n16TempVar1                                          ;84BF6B|257E    |00007E;
    BNE .return                                                ;84BF6D|D007    |84BF76;
    REP #$20                                                   ;84BF6F|C220    |      ;
    LDA.B [ptrAIActionData]                                    ;84BF71|A7C9    |0000C9;
    STA.B ptrAIActionData                                      ;84BF73|85C9    |0000C9;
    RTS                                                        ;84BF75|60      |      ;
 
 
.return:
    REP #$30                                                   ;84BF76|C230    |      ;
    LDA.B ptrAIActionData                                      ;84BF78|A5C9    |0000C9;
    CLC                                                        ;84BF7A|18      |      ;
    ADC.W #$0002                                               ;84BF7B|690200  |      ;
    STA.B ptrAIActionData                                      ;84BF7E|85C9    |0000C9;
    RTS                                                        ;84BF80|60      |      ;
 
 
fAIAction0x56_UseEquippedItem:
    REP #$30                                                   ;84BF81|C230    |      ;
    REP #$30                                                   ;84BF83|C230    |      ;
    LDA.B ptrAIActionData                                      ;84BF85|A5C9    |0000C9;
    CLC                                                        ;84BF87|18      |      ;
    ADC.W #$0001                                               ;84BF88|690100  |      ;
    STA.B ptrAIActionData                                      ;84BF8B|85C9    |0000C9;
    SEP #$20                                                   ;84BF8D|E220    |      ;
    LDA.W nToolEquipped                                        ;84BF8F|AD2109  |000921;
    BEQ .return                                                ;84BF92|F00B    |84BF9F;
    REP #$30                                                   ;84BF94|C230    |      ;
    LDA.W #$000A                                               ;84BF96|A90A00  |      ;
    STA.B nPlayerAction                                        ;84BF99|85D4    |0000D4;
    JSL.L fToolUsed_AnimationSubrutines                        ;84BF9B|22A89082|8290A8;
 
.return:
    RTS                                                        ;84BF9F|60      |      ;
 
 
fAIAction0x57_UpdateStamina:
    REP #$30                                                   ;84BFA0|C230    |      ;
    REP #$30                                                   ;84BFA2|C230    |      ;
    LDA.B ptrAIActionData                                      ;84BFA4|A5C9    |0000C9;
    CLC                                                        ;84BFA6|18      |      ;
    ADC.W #$0001                                               ;84BFA7|690100  |      ;
    STA.B ptrAIActionData                                      ;84BFAA|85C9    |0000C9;
    SEP #$20                                                   ;84BFAC|E220    |      ;
    LDA.B [ptrAIActionData]                                    ;84BFAE|A7C9    |0000C9;
    JSL.L fPlayerEnergyHandler_81D061                          ;84BFB0|2261D081|81D061;
    REP #$30                                                   ;84BFB4|C230    |      ;
    LDA.B ptrAIActionData                                      ;84BFB6|A5C9    |0000C9;
    CLC                                                        ;84BFB8|18      |      ;
    ADC.W #$0001                                               ;84BFB9|690100  |      ;
    STA.B ptrAIActionData                                      ;84BFBC|85C9    |0000C9;
    RTS                                                        ;84BFBE|60      |      ;
 
 
fAIAction0x58:
    REP #$30                                                   ;84BFBF|C230    |      ;
    REP #$30                                                   ;84BFC1|C230    |      ;
    LDA.B ptrAIActionData                                      ;84BFC3|A5C9    |0000C9;
    CLC                                                        ;84BFC5|18      |      ;
    ADC.W #$0001                                               ;84BFC6|690100  |      ;
    STA.B ptrAIActionData                                      ;84BFC9|85C9    |0000C9;
    SEP #$20                                                   ;84BFCB|E220    |      ;
    LDA.B [ptrAIActionData]                                    ;84BFCD|A7C9    |0000C9;
    PHA                                                        ;84BFCF|48      |      ;
    REP #$30                                                   ;84BFD0|C230    |      ;
    LDA.B ptrAIActionData                                      ;84BFD2|A5C9    |0000C9;
    CLC                                                        ;84BFD4|18      |      ;
    ADC.W #$0001                                               ;84BFD5|690100  |      ;
    STA.B ptrAIActionData                                      ;84BFD8|85C9    |0000C9;
    REP #$20                                                   ;84BFDA|C220    |      ;
    LDA.B [ptrAIActionData]                                    ;84BFDC|A7C9    |0000C9;
    PHA                                                        ;84BFDE|48      |      ;
    REP #$30                                                   ;84BFDF|C230    |      ;
    LDA.B ptrAIActionData                                      ;84BFE1|A5C9    |0000C9;
    CLC                                                        ;84BFE3|18      |      ;
    ADC.W #$0002                                               ;84BFE4|690200  |      ;
    STA.B ptrAIActionData                                      ;84BFE7|85C9    |0000C9;
    LDA.B [ptrAIActionData]                                    ;84BFE9|A7C9    |0000C9;
    PHA                                                        ;84BFEB|48      |      ;
    REP #$30                                                   ;84BFEC|C230    |      ;
    LDA.B ptrAIActionData                                      ;84BFEE|A5C9    |0000C9;
    CLC                                                        ;84BFF0|18      |      ;
    ADC.W #$0002                                               ;84BFF1|690200  |      ;
    STA.B ptrAIActionData                                      ;84BFF4|85C9    |0000C9;
    PLY                                                        ;84BFF6|7A      |      ;
    PLX                                                        ;84BFF7|FA      |      ;
    SEP #$20                                                   ;84BFF8|E220    |      ;
    PLA                                                        ;84BFFA|68      |      ;
    JSL.L fUnknown_82B049                                      ;84BFFB|2249B082|82B049;
    RTS                                                        ;84BFFF|60      |      ;
 
 
fAIAction0x59_SwapEquippedItems:
    REP #$30                                                   ;84C000|C230    |      ;
    REP #$30                                                   ;84C002|C230    |      ;
    LDA.B ptrAIActionData                                      ;84C004|A5C9    |0000C9;
    CLC                                                        ;84C006|18      |      ;
    ADC.W #$0001                                               ;84C007|690100  |      ;
    STA.B ptrAIActionData                                      ;84C00A|85C9    |0000C9;
    REP #$30                                                   ;84C00C|C230    |      ;
    LDA.W #$001C                                               ;84C00E|A91C00  |      ;
    STA.B nPlayerAction                                        ;84C011|85D4    |0000D4;
    RTS                                                        ;84C013|60      |      ;
 
 
aAICheckFlags:
    dw $0001,$0002,$0004,$0008,$0010,$0020                     ;84C014|        |      ; 0x10 * [n16]
    dw $0040,$0080,$0100,$0200,$0400,$0800                     ;84C020|        |      ;
    dw $1000,$2000,$4000,$8000                                 ;84C02C|        |      ;
 
fInput_Handler:
    SEP #$20                                                   ;84C034|E220    |      ;
    REP #$10                                                   ;84C036|C210    |      ;
    LDA.W $019A                                                ;84C038|AD9A01  |00019A;
    CMP.B #$01                                                 ;84C03B|C901    |      ;
    BNE +                                                      ;84C03D|D003    |84C042;
    JMP.W fInput_Handler_case01                                ;84C03F|4CB7C6  |84C6B7;
 
 
  + CMP.B #$02                                                 ;84C042|C902    |      ;
    BNE +                                                      ;84C044|D003    |84C049;
    JMP.W fInput_Handler_case02                                ;84C046|4C05CF  |84CF05;
 
 
  + CMP.B #$03                                                 ;84C049|C903    |      ;
    BNE +                                                      ;84C04B|D003    |84C050;
    JMP.W fInput_Handler_case03                                ;84C04D|4C40C5  |84C540;
 
 
  + CMP.B #$04                                                 ;84C050|C904    |      ;
    BNE +                                                      ;84C052|D003    |84C057;
    JMP.W fInput_Handler_case04                                ;84C054|4C88C2  |84C288;
 
 
  + CMP.B #$05                                                 ;84C057|C905    |      ;
    BNE +                                                      ;84C059|D003    |84C05E;
    JMP.W fInput_NameInput                                     ;84C05B|4C66C0  |84C066;
 
 
  + CMP.B #$06                                                 ;84C05E|C906    |      ;
    BNE +                                                      ;84C060|D003    |84C065;
    JMP.W fInput_Handler_case06                                ;84C062|4CD2CE  |84CED2;
 
 
  + RTL                                                        ;84C065|6B      |      ;
 
 
fInput_NameInput:
    REP #$30                                                   ;84C066|C230    |      ;
    LDA.W strcJoypad1.autorepeat                               ;84C068|AD2C01  |00012C;
    BIT.W #$0400                                               ;84C06B|890004  |      ;
    BEQ +                                                      ;84C06E|F003    |84C073;
    JMP.W fInput_Unknown84C204                                 ;84C070|4C04C2  |84C204;
 
 
  + LDA.W strcJoypad1.autorepeat                               ;84C073|AD2C01  |00012C;
    BIT.W #$0800                                               ;84C076|890008  |      ;
    BEQ +                                                      ;84C079|F003    |84C07E;
    JMP.W fInput_Unknown84C225                                 ;84C07B|4C25C2  |84C225;
 
 
  + LDA.W strcJoypad1.autorepeat                               ;84C07E|AD2C01  |00012C;
    BIT.W #$0100                                               ;84C081|890001  |      ;
    BEQ +                                                      ;84C084|F003    |84C089;
    JMP.W fInput_Unknown84C246                                 ;84C086|4C46C2  |84C246;
 
 
  + LDA.W strcJoypad1.autorepeat                               ;84C089|AD2C01  |00012C;
    BIT.W #$0200                                               ;84C08C|890002  |      ;
    BEQ +                                                      ;84C08F|F003    |84C094;
    JMP.W fInput_Unknown84C267                                 ;84C091|4C67C2  |84C267;
 
 
  + LDA.W strcJoypad1.newInput                                 ;84C094|AD2801  |000128;
    BIT.W #$8000                                               ;84C097|890080  |      ;
    BEQ +                                                      ;84C09A|F003    |84C09F;
    JMP.W fInput_Unknown84C0AB                                 ;84C09C|4CABC0  |84C0AB;
 
 
  + LDA.W strcJoypad1.newInput                                 ;84C09F|AD2801  |000128;
    BIT.W #$0080                                               ;84C0A2|898000  |      ;
    BEQ .return                                                ;84C0A5|F003    |84C0AA;
    JMP.W fInput_Unknown84C0EE                                 ;84C0A7|4CEEC0  |84C0EE;
 
 
.return:
    RTL                                                        ;84C0AA|6B      |      ;
 
 
fInput_Unknown84C0AB:
    SEP #$20                                                   ;84C0AB|E220    |      ;
    LDA.W nNameEntryIndex                                      ;84C0AD|AD9409  |000994;
    BEQ .label2                                                ;84C0B0|F029    |84C0DB;
    CMP.B #$04                                                 ;84C0B2|C904    |      ;
    BEQ .label1                                                ;84C0B4|F009    |84C0BF;
    REP #$20                                                   ;84C0B6|C220    |      ;
    LDA.W #$00A8                                               ;84C0B8|A9A800  |      ;
    JSL.L fTextUnknown_82EA60                                  ;84C0BB|2260EA82|82EA60;
 
.label1:
    SEP #$20                                                   ;84C0BF|E220    |      ;
    LDA.B #$00                                                 ;84C0C1|A900    |      ;
    XBA                                                        ;84C0C3|EB      |      ;
    LDA.W nNameEntryIndex                                      ;84C0C4|AD9409  |000994;
    DEC A                                                      ;84C0C7|3A      |      ;
    REP #$20                                                   ;84C0C8|C220    |      ;
    TAX                                                        ;84C0CA|AA      |      ;
    SEP #$20                                                   ;84C0CB|E220    |      ;
    LDA.B #$B1                                                 ;84C0CD|A9B1    |      ;
    STA.W sTempNameVariable,X                                  ;84C0CF|9D8508  |000885;
    SEP #$20                                                   ;84C0D2|E220    |      ;
    LDA.W nNameEntryIndex                                      ;84C0D4|AD9409  |000994;
    DEC A                                                      ;84C0D7|3A      |      ;
    STA.W nNameEntryIndex                                      ;84C0D8|8D9409  |000994;
 
.label2:
    SEP #$20                                                   ;84C0DB|E220    |      ;
    REP #$10                                                   ;84C0DD|C210    |      ;
    LDA.B #$02                                                 ;84C0DF|A902    |      ;
    STA.W nAudioRegisterValue0                                 ;84C0E1|8D1401  |000114;
    LDA.B #$06                                                 ;84C0E4|A906    |      ;
    STA.W nAudioRegisterValue1                                 ;84C0E6|8D1501  |000115;
    JSL.L fAudioSetRegister2to0A                               ;84C0E9|22328383|838332;
    RTL                                                        ;84C0ED|6B      |      ;
 
 
fInput_Unknown84C0EE:
    REP #$20                                                   ;84C0EE|C220    |      ;
    LDA.W #$0005                                               ;84C0F0|A90500  |      ;
    JSL.L fMenuUnknown_82EBAC                                  ;84C0F3|22ACEB82|82EBAC;
    REP #$20                                                   ;84C0F7|C220    |      ;
    CMP.W #$0001                                               ;84C0F9|C90100  |      ;
    BEQ fInput_Unknown84C157                                   ;84C0FC|F059    |84C157;
    CMP.W #$0002                                               ;84C0FE|C90200  |      ;
    BEQ fInput_Unknown84C17E                                   ;84C101|F07B    |84C17E;
    CMP.W #$0003                                               ;84C103|C90300  |      ;
    BNE +                                                      ;84C106|D003    |84C10B;
    JMP.W fInput_Unknown84C1A8                                 ;84C108|4CA8C1  |84C1A8;
 
 
  + CMP.W #$0004                                               ;84C10B|C90400  |      ;
    BNE +                                                      ;84C10E|D003    |84C113;
    JMP.W fInput_Unknown84C1D2                                 ;84C110|4CD2C1  |84C1D2;
 
 
  + SEP #$20                                                   ;84C113|E220    |      ;
    LDA.W nNameEntryIndex                                      ;84C115|AD9409  |000994;
    CMP.B #$04                                                 ;84C118|C904    |      ;
    BEQ .lastLetterInput                                       ;84C11A|F028    |84C144;
    REP #$20                                                   ;84C11C|C220    |      ;
    LDA.W #$0004                                               ;84C11E|A90400  |      ;
    JSL.L fMenuUnknown_82EBAC                                  ;84C121|22ACEB82|82EBAC;
    SEP #$20                                                   ;84C125|E220    |      ;
    PHA                                                        ;84C127|48      |      ;
    LDA.B #$00                                                 ;84C128|A900    |      ;
    XBA                                                        ;84C12A|EB      |      ;
    LDA.W nNameEntryIndex                                      ;84C12B|AD9409  |000994;
    REP #$20                                                   ;84C12E|C220    |      ;
    TAX                                                        ;84C130|AA      |      ;
    SEP #$20                                                   ;84C131|E220    |      ;
    PLA                                                        ;84C133|68      |      ;
    STA.W sTempNameVariable,X                                  ;84C134|9D8508  |000885;
    JSL.L fTextUnknown_82EA60                                  ;84C137|2260EA82|82EA60;
    SEP #$20                                                   ;84C13B|E220    |      ;
    LDA.W nNameEntryIndex                                      ;84C13D|AD9409  |000994;
    INC A                                                      ;84C140|1A      |      ;
    STA.W nNameEntryIndex                                      ;84C141|8D9409  |000994;
 
.lastLetterInput:
    SEP #$20                                                   ;84C144|E220    |      ;
    REP #$10                                                   ;84C146|C210    |      ;
    LDA.B #$01                                                 ;84C148|A901    |      ;
    STA.W nAudioRegisterValue0                                 ;84C14A|8D1401  |000114;
    LDA.B #$06                                                 ;84C14D|A906    |      ;
    STA.W nAudioRegisterValue1                                 ;84C14F|8D1501  |000115;
    JSL.L fAudioSetRegister2to0A                               ;84C152|22328383|838332;
    RTL                                                        ;84C156|6B      |      ;
 
 
fInput_Unknown84C157:
    SEP #$20                                                   ;84C157|E220    |      ;
    LDA.B #$00                                                 ;84C159|A900    |      ;
    STA.W nMenuTableSelector                                   ;84C15B|8D9309  |000993;
    REP #$20                                                   ;84C15E|C220    |      ;
    STZ.W $013C                                                ;84C160|9C3C01  |00013C;
    STZ.W $013E                                                ;84C163|9C3E01  |00013E;
    REP #$20                                                   ;84C166|C220    |      ;
    STZ.W nMenuIndex                                           ;84C168|9C9109  |000991;
    SEP #$20                                                   ;84C16B|E220    |      ;
    REP #$10                                                   ;84C16D|C210    |      ;
    LDA.B #$01                                                 ;84C16F|A901    |      ;
    STA.W nAudioRegisterValue0                                 ;84C171|8D1401  |000114;
    LDA.B #$06                                                 ;84C174|A906    |      ;
    STA.W nAudioRegisterValue1                                 ;84C176|8D1501  |000115;
    JSL.L fAudioSetRegister2to0A                               ;84C179|22328383|838332;
    RTL                                                        ;84C17D|6B      |      ;
 
 
fInput_Unknown84C17E:
    SEP #$20                                                   ;84C17E|E220    |      ;
    LDA.B #$01                                                 ;84C180|A901    |      ;
    STA.W nMenuTableSelector                                   ;84C182|8D9309  |000993;
    REP #$20                                                   ;84C185|C220    |      ;
    LDA.W #$0100                                               ;84C187|A90001  |      ;
    STA.W $013C                                                ;84C18A|8D3C01  |00013C;
    STZ.W $013E                                                ;84C18D|9C3E01  |00013E;
    REP #$20                                                   ;84C190|C220    |      ;
    STZ.W nMenuIndex                                           ;84C192|9C9109  |000991;
    SEP #$20                                                   ;84C195|E220    |      ;
    REP #$10                                                   ;84C197|C210    |      ;
    LDA.B #$01                                                 ;84C199|A901    |      ;
    STA.W nAudioRegisterValue0                                 ;84C19B|8D1401  |000114;
    LDA.B #$06                                                 ;84C19E|A906    |      ;
    STA.W nAudioRegisterValue1                                 ;84C1A0|8D1501  |000115;
    JSL.L fAudioSetRegister2to0A                               ;84C1A3|22328383|838332;
    RTL                                                        ;84C1A7|6B      |      ;
 
 
fInput_Unknown84C1A8:
    SEP #$20                                                   ;84C1A8|E220    |      ;
    LDA.B #$02                                                 ;84C1AA|A902    |      ;
    STA.W nMenuTableSelector                                   ;84C1AC|8D9309  |000993;
    REP #$20                                                   ;84C1AF|C220    |      ;
    STZ.W $013C                                                ;84C1B1|9C3C01  |00013C;
    LDA.W #$0100                                               ;84C1B4|A90001  |      ;
    STA.W $013E                                                ;84C1B7|8D3E01  |00013E;
    REP #$20                                                   ;84C1BA|C220    |      ;
    STZ.W nMenuIndex                                           ;84C1BC|9C9109  |000991;
    SEP #$20                                                   ;84C1BF|E220    |      ;
    REP #$10                                                   ;84C1C1|C210    |      ;
    LDA.B #$01                                                 ;84C1C3|A901    |      ;
    STA.W nAudioRegisterValue0                                 ;84C1C5|8D1401  |000114;
    LDA.B #$06                                                 ;84C1C8|A906    |      ;
    STA.W nAudioRegisterValue1                                 ;84C1CA|8D1501  |000115;
    JSL.L fAudioSetRegister2to0A                               ;84C1CD|22328383|838332;
    RTL                                                        ;84C1D1|6B      |      ;
 
 
fInput_Unknown84C1D2:
    SEP #$20                                                   ;84C1D2|E220    |      ;
    LDA.W nNameEntryIndex                                      ;84C1D4|AD9409  |000994;
    BEQ +                                                      ;84C1D7|F018    |84C1F1;
    LDA.B #$03                                                 ;84C1D9|A903    |      ;
    STA.W nMenuTableSelector                                   ;84C1DB|8D9309  |000993;
    SEP #$20                                                   ;84C1DE|E220    |      ;
    REP #$10                                                   ;84C1E0|C210    |      ;
    LDA.B #$01                                                 ;84C1E2|A901    |      ;
    STA.W nAudioRegisterValue0                                 ;84C1E4|8D1401  |000114;
    LDA.B #$06                                                 ;84C1E7|A906    |      ;
    STA.W nAudioRegisterValue1                                 ;84C1E9|8D1501  |000115;
    JSL.L fAudioSetRegister2to0A                               ;84C1EC|22328383|838332;
    RTL                                                        ;84C1F0|6B      |      ;
 
 
  + SEP #$20                                                   ;84C1F1|E220    |      ;
    REP #$10                                                   ;84C1F3|C210    |      ;
    LDA.B #$02                                                 ;84C1F5|A902    |      ;
    STA.W nAudioRegisterValue0                                 ;84C1F7|8D1401  |000114;
    LDA.B #$06                                                 ;84C1FA|A906    |      ;
    STA.W nAudioRegisterValue1                                 ;84C1FC|8D1501  |000115;
    JSL.L fAudioSetRegister2to0A                               ;84C1FF|22328383|838332;
    RTL                                                        ;84C203|6B      |      ;
 
 
fInput_Unknown84C204:
    REP #$20                                                   ;84C204|C220    |      ;
    LDA.W #$0000                                               ;84C206|A90000  |      ;
    JSL.L fMenuUnknown_82EBAC                                  ;84C209|22ACEB82|82EBAC;
    REP #$20                                                   ;84C20D|C220    |      ;
    STA.W nMenuIndex                                           ;84C20F|8D9109  |000991;
    SEP #$20                                                   ;84C212|E220    |      ;
    REP #$10                                                   ;84C214|C210    |      ;
    LDA.B #$03                                                 ;84C216|A903    |      ;
    STA.W nAudioRegisterValue0                                 ;84C218|8D1401  |000114;
    LDA.B #$06                                                 ;84C21B|A906    |      ;
    STA.W nAudioRegisterValue1                                 ;84C21D|8D1501  |000115;
    JSL.L fAudioSetRegister2to0A                               ;84C220|22328383|838332;
    RTL                                                        ;84C224|6B      |      ;
 
 
fInput_Unknown84C225:
    REP #$20                                                   ;84C225|C220    |      ;
    LDA.W #$0001                                               ;84C227|A90100  |      ;
    JSL.L fMenuUnknown_82EBAC                                  ;84C22A|22ACEB82|82EBAC;
    REP #$20                                                   ;84C22E|C220    |      ;
    STA.W nMenuIndex                                           ;84C230|8D9109  |000991;
    SEP #$20                                                   ;84C233|E220    |      ;
    REP #$10                                                   ;84C235|C210    |      ;
    LDA.B #$03                                                 ;84C237|A903    |      ;
    STA.W nAudioRegisterValue0                                 ;84C239|8D1401  |000114;
    LDA.B #$06                                                 ;84C23C|A906    |      ;
    STA.W nAudioRegisterValue1                                 ;84C23E|8D1501  |000115;
    JSL.L fAudioSetRegister2to0A                               ;84C241|22328383|838332;
    RTL                                                        ;84C245|6B      |      ;
 
 
fInput_Unknown84C246:
    REP #$20                                                   ;84C246|C220    |      ;
    LDA.W #$0002                                               ;84C248|A90200  |      ;
    JSL.L fMenuUnknown_82EBAC                                  ;84C24B|22ACEB82|82EBAC;
    REP #$20                                                   ;84C24F|C220    |      ;
    STA.W nMenuIndex                                           ;84C251|8D9109  |000991;
    SEP #$20                                                   ;84C254|E220    |      ;
    REP #$10                                                   ;84C256|C210    |      ;
    LDA.B #$03                                                 ;84C258|A903    |      ;
    STA.W nAudioRegisterValue0                                 ;84C25A|8D1401  |000114;
    LDA.B #$06                                                 ;84C25D|A906    |      ;
    STA.W nAudioRegisterValue1                                 ;84C25F|8D1501  |000115;
    JSL.L fAudioSetRegister2to0A                               ;84C262|22328383|838332;
    RTL                                                        ;84C266|6B      |      ;
 
 
fInput_Unknown84C267:
    REP #$20                                                   ;84C267|C220    |      ;
    LDA.W #$0003                                               ;84C269|A90300  |      ;
    JSL.L fMenuUnknown_82EBAC                                  ;84C26C|22ACEB82|82EBAC;
    REP #$20                                                   ;84C270|C220    |      ;
    STA.W nMenuIndex                                           ;84C272|8D9109  |000991;
    SEP #$20                                                   ;84C275|E220    |      ;
    REP #$10                                                   ;84C277|C210    |      ;
    LDA.B #$03                                                 ;84C279|A903    |      ;
    STA.W nAudioRegisterValue0                                 ;84C27B|8D1401  |000114;
    LDA.B #$06                                                 ;84C27E|A906    |      ;
    STA.W nAudioRegisterValue1                                 ;84C280|8D1501  |000115;
    JSL.L fAudioSetRegister2to0A                               ;84C283|22328383|838332;
    RTL                                                        ;84C287|6B      |      ;
 
 
fInput_Handler_case04:
    SEP #$20                                                   ;84C288|E220    |      ;
    LDA.B nUnknown0x95                                         ;84C28A|A595    |000095;
    CMP.B #$01                                                 ;84C28C|C901    |      ;
    BNE +                                                      ;84C28E|D003    |84C293;
    JMP.W fInput_Unknown84C2B4                                 ;84C290|4CB4C2  |84C2B4;
 
 
  + CMP.B #$02                                                 ;84C293|C902    |      ;
    BNE +                                                      ;84C295|D003    |84C29A;
    JMP.W fInput_Unknown84C428                                 ;84C297|4C28C4  |84C428;
 
 
  + CMP.B #$03                                                 ;84C29A|C903    |      ;
    BNE +                                                      ;84C29C|D003    |84C2A1;
    JMP.W fInput_Unknown84C428                                 ;84C29E|4C28C4  |84C428;
 
 
  + CMP.B #$05                                                 ;84C2A1|C905    |      ;
    BNE +                                                      ;84C2A3|D003    |84C2A8;
    JMP.W fInput_Unknown84C458                                 ;84C2A5|4C58C4  |84C458;
 
 
  + CMP.B #$07                                                 ;84C2A8|C907    |      ;
    BEQ fInput_Unknown84C2FE                                   ;84C2AA|F052    |84C2FE;
    CMP.B #$08                                                 ;84C2AC|C908    |      ;
    BNE +                                                      ;84C2AE|D003    |84C2B3;
    JMP.W fInput_Unkown84C380                                  ;84C2B0|4C80C3  |84C380;
 
 
  + RTL                                                        ;84C2B3|6B      |      ;
 
 
fInput_Unknown84C2B4:
    REP #$30                                                   ;84C2B4|C230    |      ;
    LDA.B nPlayerAction                                        ;84C2B6|A5D4    |0000D4;
    CMP.W #$0003                                               ;84C2B8|C90300  |      ;
    BEQ +                                                      ;84C2BB|F004    |84C2C1;
    JSL.L fInput_Unknown84C7D6                                 ;84C2BD|22D6C784|84C7D6;
 
  + REP #$30                                                   ;84C2C1|C230    |      ;
    LDA.L strcDailyFlags.flags1                                ;84C2C3|AF5A1F7F|7F1F5A;
    AND.W #$8000                                               ;84C2C7|290080  |      ;
    BEQ .justReturn                                            ;84C2CA|F00B    |84C2D7;
    LDA.W strcJoypad1.newInput                                 ;84C2CC|AD2801  |000128;
    BIT.W #$1000                                               ;84C2CF|890010  |      ;
    BEQ .justReturn                                            ;84C2D2|F003    |84C2D7;
    JMP.W +                                                    ;84C2D4|4CD8C2  |84C2D8;
 
 
.justReturn:
    RTL                                                        ;84C2D7|6B      |      ;
 
 
  + SEP #$20                                                   ;84C2D8|E220    |      ;
    LDA.B #$09                                                 ;84C2DA|A909    |      ;
    STA.B nUnknown0x95                                         ;84C2DC|8595    |000095;
    SEP #$20                                                   ;84C2DE|E220    |      ;
    REP #$10                                                   ;84C2E0|C210    |      ;
    LDA.B #$03                                                 ;84C2E2|A903    |      ;
    STA.W nAudioRegisterValue0                                 ;84C2E4|8D1401  |000114;
    LDA.B #$06                                                 ;84C2E7|A906    |      ;
    STA.W nAudioRegisterValue1                                 ;84C2E9|8D1501  |000115;
    JSL.L fAudioSetRegister2to0A                               ;84C2EC|22328383|838332;
    REP #$20                                                   ;84C2F0|C220    |      ;
    LDA.L strcDailyFlags.flags2                                ;84C2F2|AF5C1F7F|7F1F5C;
    ORA.W #$0004                                               ;84C2F6|090400  |      ;
    STA.L strcDailyFlags.flags2                                ;84C2F9|8F5C1F7F|7F1F5C;
    RTL                                                        ;84C2FD|6B      |      ;
 
 
fInput_Unknown84C2FE:
    REP #$30                                                   ;84C2FE|C230    |      ;
    LDA.W strcJoypad1.newInput                                 ;84C300|AD2801  |000128;
    BIT.W #$0400                                               ;84C303|890004  |      ;
    BEQ +                                                      ;84C306|F003    |84C30B;
    JMP.W .label1                                              ;84C308|4C2DC3  |84C32D;
 
 
  + LDA.W strcJoypad1.newInput                                 ;84C30B|AD2801  |000128;
    BIT.W #$0800                                               ;84C30E|890008  |      ;
    BEQ +                                                      ;84C311|F003    |84C316;
    JMP.W .label1                                              ;84C313|4C2DC3  |84C32D;
 
 
  + LDA.W strcJoypad1.newInput                                 ;84C316|AD2801  |000128;
    BIT.W #$8000                                               ;84C319|890080  |      ;
    BEQ +                                                      ;84C31C|F003    |84C321;
    JMP.W .label2                                              ;84C31E|4C4EC3  |84C34E;
 
 
  + LDA.W strcJoypad1.newInput                                 ;84C321|AD2801  |000128;
    BIT.W #$0080                                               ;84C324|898000  |      ;
    BEQ .justReturn                                            ;84C327|F003    |84C32C;
    JMP.W .label3                                              ;84C329|4C67C3  |84C367;
 
 
.justReturn:
    RTL                                                        ;84C32C|6B      |      ;
 
 
.label1:
    SEP #$20                                                   ;84C32D|E220    |      ;
    LDA.W $098E                                                ;84C32F|AD8E09  |00098E;
    EOR.B #$01                                                 ;84C332|4901    |      ;
    STA.W $098E                                                ;84C334|8D8E09  |00098E;
    LDA.B #$01                                                 ;84C337|A901    |      ;
    STA.B $97                                                  ;84C339|8597    |000097;
    SEP #$20                                                   ;84C33B|E220    |      ;
    REP #$10                                                   ;84C33D|C210    |      ;
    LDA.B #$03                                                 ;84C33F|A903    |      ;
    STA.W nAudioRegisterValue0                                 ;84C341|8D1401  |000114;
    LDA.B #$06                                                 ;84C344|A906    |      ;
    STA.W nAudioRegisterValue1                                 ;84C346|8D1501  |000115;
    JSL.L fAudioSetRegister2to0A                               ;84C349|22328383|838332;
    RTL                                                        ;84C34D|6B      |      ;
 
 
.label2:
    SEP #$20                                                   ;84C34E|E220    |      ;
    LDA.B #$01                                                 ;84C350|A901    |      ;
    STA.B n8TempVar3                                           ;84C352|8594    |000094;
    SEP #$20                                                   ;84C354|E220    |      ;
    REP #$10                                                   ;84C356|C210    |      ;
    LDA.B #$03                                                 ;84C358|A903    |      ;
    STA.W nAudioRegisterValue0                                 ;84C35A|8D1401  |000114;
    LDA.B #$06                                                 ;84C35D|A906    |      ;
    STA.W nAudioRegisterValue1                                 ;84C35F|8D1501  |000115;
    JSL.L fAudioSetRegister2to0A                               ;84C362|22328383|838332;
    RTL                                                        ;84C366|6B      |      ;
 
 
.label3:
    SEP #$20                                                   ;84C367|E220    |      ;
    LDA.B #$02                                                 ;84C369|A902    |      ;
    STA.B n8TempVar3                                           ;84C36B|8594    |000094;
    SEP #$20                                                   ;84C36D|E220    |      ;
    REP #$10                                                   ;84C36F|C210    |      ;
    LDA.B #$01                                                 ;84C371|A901    |      ;
    STA.W nAudioRegisterValue0                                 ;84C373|8D1401  |000114;
    LDA.B #$06                                                 ;84C376|A906    |      ;
    STA.W nAudioRegisterValue1                                 ;84C378|8D1501  |000115;
    JSL.L fAudioSetRegister2to0A                               ;84C37B|22328383|838332;
    RTL                                                        ;84C37F|6B      |      ;
 
 
fInput_Unkown84C380:
    REP #$30                                                   ;84C380|C230    |      ;
    LDA.W strcJoypad1.newInput                                 ;84C382|AD2801  |000128;
    BIT.W #$0400                                               ;84C385|890004  |      ;
    BEQ +                                                      ;84C388|F003    |84C38D;
    JMP.W .label1                                              ;84C38A|4CAFC3  |84C3AF;
 
 
  + LDA.W strcJoypad1.newInput                                 ;84C38D|AD2801  |000128;
    BIT.W #$0800                                               ;84C390|890008  |      ;
    BEQ +                                                      ;84C393|F003    |84C398;
    JMP.W .label1                                              ;84C395|4CAFC3  |84C3AF;
 
 
  + LDA.W strcJoypad1.newInput                                 ;84C398|AD2801  |000128;
    BIT.W #$8000                                               ;84C39B|890080  |      ;
    BEQ +                                                      ;84C39E|F003    |84C3A3;
    JMP.W .label2                                              ;84C3A0|4CD0C3  |84C3D0;
 
 
  + LDA.W strcJoypad1.newInput                                 ;84C3A3|AD2801  |000128;
    BIT.W #$0080                                               ;84C3A6|898000  |      ;
    BEQ .justReturn                                            ;84C3A9|F003    |84C3AE;
    JMP.W .label3                                              ;84C3AB|4CE9C3  |84C3E9;
 
 
.justReturn:
    RTL                                                        ;84C3AE|6B      |      ;
 
 
.label1:
    SEP #$20                                                   ;84C3AF|E220    |      ;
    LDA.W $098E                                                ;84C3B1|AD8E09  |00098E;
    EOR.B #$01                                                 ;84C3B4|4901    |      ;
    STA.W $098E                                                ;84C3B6|8D8E09  |00098E;
    LDA.B #$01                                                 ;84C3B9|A901    |      ;
    STA.B $97                                                  ;84C3BB|8597    |000097;
    SEP #$20                                                   ;84C3BD|E220    |      ;
    REP #$10                                                   ;84C3BF|C210    |      ;
    LDA.B #$03                                                 ;84C3C1|A903    |      ;
    STA.W nAudioRegisterValue0                                 ;84C3C3|8D1401  |000114;
    LDA.B #$06                                                 ;84C3C6|A906    |      ;
    STA.W nAudioRegisterValue1                                 ;84C3C8|8D1501  |000115;
    JSL.L fAudioSetRegister2to0A                               ;84C3CB|22328383|838332;
    RTL                                                        ;84C3CF|6B      |      ;
 
 
.label2:
    SEP #$20                                                   ;84C3D0|E220    |      ;
    LDA.B #$01                                                 ;84C3D2|A901    |      ;
    STA.B n8TempVar3                                           ;84C3D4|8594    |000094;
    SEP #$20                                                   ;84C3D6|E220    |      ;
    REP #$10                                                   ;84C3D8|C210    |      ;
    LDA.B #$03                                                 ;84C3DA|A903    |      ;
    STA.W nAudioRegisterValue0                                 ;84C3DC|8D1401  |000114;
    LDA.B #$06                                                 ;84C3DF|A906    |      ;
    STA.W nAudioRegisterValue1                                 ;84C3E1|8D1501  |000115;
    JSL.L fAudioSetRegister2to0A                               ;84C3E4|22328383|838332;
    RTL                                                        ;84C3E8|6B      |      ;
 
 
.label3:
    SEP #$20                                                   ;84C3E9|E220    |      ;
    LDA.B #$00                                                 ;84C3EB|A900    |      ;
    XBA                                                        ;84C3ED|EB      |      ;
    LDA.W $098E                                                ;84C3EE|AD8E09  |00098E;
    JSL.L fGameEngine_LoadContinue                             ;84C3F1|2245BA83|83BA45;
    REP #$30                                                   ;84C3F5|C230    |      ;
    CPX.W #$0000                                               ;84C3F7|E00000  |      ;
    BEQ +                                                      ;84C3FA|F019    |84C415;
    SEP #$20                                                   ;84C3FC|E220    |      ;
    LDA.B #$02                                                 ;84C3FE|A902    |      ;
    STA.B n8TempVar3                                           ;84C400|8594    |000094;
    SEP #$20                                                   ;84C402|E220    |      ;
    REP #$10                                                   ;84C404|C210    |      ;
    LDA.B #$01                                                 ;84C406|A901    |      ;
    STA.W nAudioRegisterValue0                                 ;84C408|8D1401  |000114;
    LDA.B #$06                                                 ;84C40B|A906    |      ;
    STA.W nAudioRegisterValue1                                 ;84C40D|8D1501  |000115;
    JSL.L fAudioSetRegister2to0A                               ;84C410|22328383|838332;
    RTL                                                        ;84C414|6B      |      ;
 
 
  + SEP #$20                                                   ;84C415|E220    |      ;
    REP #$10                                                   ;84C417|C210    |      ;
    LDA.B #$02                                                 ;84C419|A902    |      ;
    STA.W nAudioRegisterValue0                                 ;84C41B|8D1401  |000114;
    LDA.B #$06                                                 ;84C41E|A906    |      ;
    STA.W nAudioRegisterValue1                                 ;84C420|8D1501  |000115;
    JSL.L fAudioSetRegister2to0A                               ;84C423|22328383|838332;
    RTL                                                        ;84C427|6B      |      ;
 
 
fInput_Unknown84C428:
    REP #$30                                                   ;84C428|C230    |      ;
    LDA.L strcDailyFlags.flags1                                ;84C42A|AF5A1F7F|7F1F5A;
    AND.W #$8000                                               ;84C42E|290080  |      ;
    BEQ .justReturn                                            ;84C431|F00B    |84C43E;
    LDA.W strcJoypad1.newInput                                 ;84C433|AD2801  |000128;
    BIT.W #$1000                                               ;84C436|890010  |      ;
    BEQ .justReturn                                            ;84C439|F003    |84C43E;
    JMP.W .label1                                              ;84C43B|4C3FC4  |84C43F;
 
 
.justReturn:
    RTL                                                        ;84C43E|6B      |      ;
 
 
.label1:
    SEP #$20                                                   ;84C43F|E220    |      ;
    LDA.B #$06                                                 ;84C441|A906    |      ;
    STA.B nUnknown0x95                                         ;84C443|8595    |000095;
    SEP #$20                                                   ;84C445|E220    |      ;
    REP #$10                                                   ;84C447|C210    |      ;
    LDA.B #$03                                                 ;84C449|A903    |      ;
    STA.W nAudioRegisterValue0                                 ;84C44B|8D1401  |000114;
    LDA.B #$06                                                 ;84C44E|A906    |      ;
    STA.W nAudioRegisterValue1                                 ;84C450|8D1501  |000115;
    JSL.L fAudioSetRegister2to0A                               ;84C453|22328383|838332;
    RTL                                                        ;84C457|6B      |      ;
 
 
fInput_Unknown84C458:
    REP #$30                                                   ;84C458|C230    |      ;
    LDA.W strcJoypad1.newInput                                 ;84C45A|AD2801  |000128;
    BIT.W #$0400                                               ;84C45D|890004  |      ;
    BEQ +                                                      ;84C460|F003    |84C465;
    JMP.W .label1                                              ;84C462|4C7CC4  |84C47C;
 
 
  + LDA.W strcJoypad1.newInput                                 ;84C465|AD2801  |000128;
    BIT.W #$0800                                               ;84C468|890008  |      ;
    BEQ +                                                      ;84C46B|F003    |84C470;
    JMP.W .label2                                              ;84C46D|4CC4C4  |84C4C4;
 
 
  + LDA.W strcJoypad1.newInput                                 ;84C470|AD2801  |000128;
    BIT.W #$0080                                               ;84C473|898000  |      ;
    BEQ +                                                      ;84C476|F003    |84C47B;
    JMP.W .label3                                              ;84C478|4C0CC5  |84C50C;
 
 
  + RTL                                                        ;84C47B|6B      |      ;
 
 
.label1:
    REP #$20                                                   ;84C47C|C220    |      ;
    STZ.B $90                                                  ;84C47E|6490    |000090;
    SEP #$20                                                   ;84C480|E220    |      ;
    LDA.W nUnknownFlags09D                                     ;84C482|AD8D09  |00098D;
    CMP.B #$02                                                 ;84C485|C902    |      ;
    BEQ +                                                      ;84C487|F01B    |84C4A4;
    INC A                                                      ;84C489|1A      |      ;
    STA.W nUnknownFlags09D                                     ;84C48A|8D8D09  |00098D;
    LDA.B #$01                                                 ;84C48D|A901    |      ;
    STA.B $97                                                  ;84C48F|8597    |000097;
    SEP #$20                                                   ;84C491|E220    |      ;
    REP #$10                                                   ;84C493|C210    |      ;
    LDA.B #$03                                                 ;84C495|A903    |      ;
    STA.W nAudioRegisterValue0                                 ;84C497|8D1401  |000114;
    LDA.B #$06                                                 ;84C49A|A906    |      ;
    STA.W nAudioRegisterValue1                                 ;84C49C|8D1501  |000115;
    JSL.L fAudioSetRegister2to0A                               ;84C49F|22328383|838332;
    RTL                                                        ;84C4A3|6B      |      ;
 
 
  + REP #$20                                                   ;84C4A4|C220    |      ;
    STZ.B $90                                                  ;84C4A6|6490    |000090;
    SEP #$20                                                   ;84C4A8|E220    |      ;
    STZ.W nUnknownFlags09D                                     ;84C4AA|9C8D09  |00098D;
    LDA.B #$01                                                 ;84C4AD|A901    |      ;
    STA.B $97                                                  ;84C4AF|8597    |000097;
    SEP #$20                                                   ;84C4B1|E220    |      ;
    REP #$10                                                   ;84C4B3|C210    |      ;
    LDA.B #$03                                                 ;84C4B5|A903    |      ;
    STA.W nAudioRegisterValue0                                 ;84C4B7|8D1401  |000114;
    LDA.B #$06                                                 ;84C4BA|A906    |      ;
    STA.W nAudioRegisterValue1                                 ;84C4BC|8D1501  |000115;
    JSL.L fAudioSetRegister2to0A                               ;84C4BF|22328383|838332;
    RTL                                                        ;84C4C3|6B      |      ;
 
 
.label2:
    REP #$20                                                   ;84C4C4|C220    |      ;
    STZ.B $90                                                  ;84C4C6|6490    |000090;
    SEP #$20                                                   ;84C4C8|E220    |      ;
    LDA.W nUnknownFlags09D                                     ;84C4CA|AD8D09  |00098D;
    BEQ +                                                      ;84C4CD|F01B    |84C4EA;
    DEC A                                                      ;84C4CF|3A      |      ;
    STA.W nUnknownFlags09D                                     ;84C4D0|8D8D09  |00098D;
    LDA.B #$01                                                 ;84C4D3|A901    |      ;
    STA.B $97                                                  ;84C4D5|8597    |000097;
    SEP #$20                                                   ;84C4D7|E220    |      ;
    REP #$10                                                   ;84C4D9|C210    |      ;
    LDA.B #$03                                                 ;84C4DB|A903    |      ;
    STA.W nAudioRegisterValue0                                 ;84C4DD|8D1401  |000114;
    LDA.B #$06                                                 ;84C4E0|A906    |      ;
    STA.W nAudioRegisterValue1                                 ;84C4E2|8D1501  |000115;
    JSL.L fAudioSetRegister2to0A                               ;84C4E5|22328383|838332;
    RTL                                                        ;84C4E9|6B      |      ;
 
 
  + REP #$20                                                   ;84C4EA|C220    |      ;
    STZ.B $90                                                  ;84C4EC|6490    |000090;
    SEP #$20                                                   ;84C4EE|E220    |      ;
    LDA.B #$02                                                 ;84C4F0|A902    |      ;
    STA.W nUnknownFlags09D                                     ;84C4F2|8D8D09  |00098D;
    LDA.B #$01                                                 ;84C4F5|A901    |      ;
    STA.B $97                                                  ;84C4F7|8597    |000097;
    SEP #$20                                                   ;84C4F9|E220    |      ;
    REP #$10                                                   ;84C4FB|C210    |      ;
    LDA.B #$03                                                 ;84C4FD|A903    |      ;
    STA.W nAudioRegisterValue0                                 ;84C4FF|8D1401  |000114;
    LDA.B #$06                                                 ;84C502|A906    |      ;
    STA.W nAudioRegisterValue1                                 ;84C504|8D1501  |000115;
    JSL.L fAudioSetRegister2to0A                               ;84C507|22328383|838332;
    RTL                                                        ;84C50B|6B      |      ;
 
 
.label3:
    SEP #$20                                                   ;84C50C|E220    |      ;
    LDA.W nUnknownFlags09D                                     ;84C50E|AD8D09  |00098D;
    BEQ ..label1                                               ;84C511|F00A    |84C51D;
    CMP.B #$01                                                 ;84C513|C901    |      ;
    BEQ ..label2                                               ;84C515|F00E    |84C525;
    LDA.B #$0A                                                 ;84C517|A90A    |      ;
    STA.B nUnknown0x95                                         ;84C519|8595    |000095;
    BRA +                                                      ;84C51B|8010    |84C52D;
 
 
..label1:
    SEP #$20                                                   ;84C51D|E220    |      ;
    LDA.B #$08                                                 ;84C51F|A908    |      ;
    STA.B nUnknown0x95                                         ;84C521|8595    |000095;
    BRA +                                                      ;84C523|8008    |84C52D;
 
 
..label2:
    SEP #$20                                                   ;84C525|E220    |      ;
    LDA.B #$07                                                 ;84C527|A907    |      ;
    STA.B nUnknown0x95                                         ;84C529|8595    |000095;
    BRA +                                                      ;84C52B|8000    |84C52D;
 
 
  + SEP #$20                                                   ;84C52D|E220    |      ;
    REP #$10                                                   ;84C52F|C210    |      ;
    LDA.B #$01                                                 ;84C531|A901    |      ;
    STA.W nAudioRegisterValue0                                 ;84C533|8D1401  |000114;
    LDA.B #$06                                                 ;84C536|A906    |      ;
    STA.W nAudioRegisterValue1                                 ;84C538|8D1501  |000115;
    JSL.L fAudioSetRegister2to0A                               ;84C53B|22328383|838332;
    RTL                                                        ;84C53F|6B      |      ;
 
 
fInput_Handler_case03:
    REP #$30                                                   ;84C540|C230    |      ;
    LDA.W strcJoypad1.autorepeat                               ;84C542|AD2C01  |00012C;
    BIT.W #$0400                                               ;84C545|890004  |      ;
    BEQ +                                                      ;84C548|F003    |84C54D;
    JMP.W fInput_Unknown84C5D1                                 ;84C54A|4CD1C5  |84C5D1;
 
 
  + LDA.W strcJoypad1.autorepeat                               ;84C54D|AD2C01  |00012C;
    BIT.W #$0800                                               ;84C550|890008  |      ;
    BEQ +                                                      ;84C553|F003    |84C558;
    JMP.W fInput_Unknown84C612                                 ;84C555|4C12C6  |84C612;
 
 
  + LDA.W strcJoypad1.autorepeat                               ;84C558|AD2C01  |00012C;
    BIT.W #$0100                                               ;84C55B|890001  |      ;
    BEQ +                                                      ;84C55E|F003    |84C563;
    JMP.W fInput_Unknown84C651                                 ;84C560|4C51C6  |84C651;
 
 
  + LDA.W strcJoypad1.autorepeat                               ;84C563|AD2C01  |00012C;
    BIT.W #$0200                                               ;84C566|890002  |      ;
    BEQ +                                                      ;84C569|F003    |84C56E;
    JMP.W fInput_Unknown84C684                                 ;84C56B|4C84C6  |84C684;
 
 
  + LDA.W strcJoypad1.newInput                                 ;84C56E|AD2801  |000128;
    BIT.W #$0080                                               ;84C571|898000  |      ;
    BEQ +                                                      ;84C574|F003    |84C579;
    JMP.W fInput_Unknown84C57A                                 ;84C576|4C7AC5  |84C57A;
 
 
  + RTL                                                        ;84C579|6B      |      ;
 
 
fInput_Unknown84C57A:
    SEP #$20                                                   ;84C57A|E220    |      ;
    REP #$10                                                   ;84C57C|C210    |      ;
    LDA.B #$01                                                 ;84C57E|A901    |      ;
    STA.W nAudioRegisterValue0                                 ;84C580|8D1401  |000114;
    LDA.B #$06                                                 ;84C583|A906    |      ;
    STA.W nAudioRegisterValue1                                 ;84C585|8D1501  |000115;
    JSL.L fAudioSetRegister2to0A                               ;84C588|22328383|838332;
    SEP #$20                                                   ;84C58C|E220    |      ;
    STZ.W $019B                                                ;84C58E|9C9B01  |00019B;
    SEP #$20                                                   ;84C591|E220    |      ;
    LDA.B #$02                                                 ;84C593|A902    |      ;
    STA.W $019A                                                ;84C595|8D9A01  |00019A;
    LDA.B #$00                                                 ;84C598|A900    |      ;
    XBA                                                        ;84C59A|EB      |      ;
    LDA.W $018A                                                ;84C59B|AD8A01  |00018A;
    CMP.B #$0B                                                 ;84C59E|C90B    |      ;
    BCC .label1                                                ;84C5A0|9012    |84C5B4;
    SEP #$20                                                   ;84C5A2|E220    |      ;
    LDA.B #$01                                                 ;84C5A4|A901    |      ;
    STA.W $019A                                                ;84C5A6|8D9A01  |00019A;
    REP #$20                                                   ;84C5A9|C220    |      ;
    LDA.W #$0001                                               ;84C5AB|A90100  |      ;
    JSL.L fDialog_Unknown_8394D7                               ;84C5AE|22D79483|8394D7;
    BRA +                                                      ;84C5B2|8014    |84C5C8;
 
 
.label1:
    REP #$20                                                   ;84C5B4|C220    |      ;
    ASL A                                                      ;84C5B6|0A      |      ;
    TAX                                                        ;84C5B7|AA      |      ;
    LDA.L aDialogDialogPointerIndexes_839467,X                 ;84C5B8|BF679483|839467;
    TAX                                                        ;84C5BC|AA      |      ;
    SEP #$20                                                   ;84C5BD|E220    |      ;
    LDA.B #$00                                                 ;84C5BF|A900    |      ;
    STA.W $0191                                                ;84C5C1|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;84C5C4|225F9383|83935F;
 
  + REP #$20                                                   ;84C5C8|C220    |      ;
    LDA.W #$0100                                               ;84C5CA|A90001  |      ;
    STA.W $0142                                                ;84C5CD|8D4201  |000142;
    RTL                                                        ;84C5D0|6B      |      ;
 
 
fInput_Unknown84C5D1:
    SEP #$20                                                   ;84C5D1|E220    |      ;
    REP #$10                                                   ;84C5D3|C210    |      ;
    LDA.B #$03                                                 ;84C5D5|A903    |      ;
    STA.W nAudioRegisterValue0                                 ;84C5D7|8D1401  |000114;
    LDA.B #$06                                                 ;84C5DA|A906    |      ;
    STA.W nAudioRegisterValue1                                 ;84C5DC|8D1501  |000115;
    JSL.L fAudioSetRegister2to0A                               ;84C5DF|22328383|838332;
    SEP #$20                                                   ;84C5E3|E220    |      ;
    LDA.W $018A                                                ;84C5E5|AD8A01  |00018A;
    CMP.B #$0B                                                 ;84C5E8|C90B    |      ;
    BCS .return                                                ;84C5EA|B025    |84C611;
    REP #$20                                                   ;84C5EC|C220    |      ;
    LDA.W #$0001                                               ;84C5EE|A90100  |      ;
    JSL.L fDialog_Unknown_8394D7                               ;84C5F1|22D79483|8394D7;
    SEP #$20                                                   ;84C5F5|E220    |      ;
    LDA.W $018A                                                ;84C5F7|AD8A01  |00018A;
    CMP.B #$0A                                                 ;84C5FA|C90A    |      ;
    BNE +                                                      ;84C5FC|D007    |84C605;
    LDA.B #$00                                                 ;84C5FE|A900    |      ;
    STA.W $018A                                                ;84C600|8D8A01  |00018A;
    BRA .return                                                ;84C603|800C    |84C611;
 
 
  + SEP #$20                                                   ;84C605|E220    |      ;
    LDA.W $018A                                                ;84C607|AD8A01  |00018A;
    INC A                                                      ;84C60A|1A      |      ;
    STA.W $018A                                                ;84C60B|8D8A01  |00018A;
    STZ.W $018B                                                ;84C60E|9C8B01  |00018B;
 
.return:
    RTL                                                        ;84C611|6B      |      ;
 
 
fInput_Unknown84C612:
    SEP #$20                                                   ;84C612|E220    |      ;
    REP #$10                                                   ;84C614|C210    |      ;
    LDA.B #$03                                                 ;84C616|A903    |      ;
    STA.W nAudioRegisterValue0                                 ;84C618|8D1401  |000114;
    LDA.B #$06                                                 ;84C61B|A906    |      ;
    STA.W nAudioRegisterValue1                                 ;84C61D|8D1501  |000115;
    JSL.L fAudioSetRegister2to0A                               ;84C620|22328383|838332;
    SEP #$20                                                   ;84C624|E220    |      ;
    LDA.W $018A                                                ;84C626|AD8A01  |00018A;
    CMP.B #$0B                                                 ;84C629|C90B    |      ;
    BCS .return                                                ;84C62B|B023    |84C650;
    REP #$20                                                   ;84C62D|C220    |      ;
    LDA.W #$0001                                               ;84C62F|A90100  |      ;
    JSL.L fDialog_Unknown_8394D7                               ;84C632|22D79483|8394D7;
    SEP #$20                                                   ;84C636|E220    |      ;
    LDA.W $018A                                                ;84C638|AD8A01  |00018A;
    BNE +                                                      ;84C63B|D007    |84C644;
    LDA.B #$0A                                                 ;84C63D|A90A    |      ;
    STA.W $018A                                                ;84C63F|8D8A01  |00018A;
    BRA .return                                                ;84C642|800C    |84C650;
 
 
  + SEP #$20                                                   ;84C644|E220    |      ;
    LDA.W $018A                                                ;84C646|AD8A01  |00018A;
    DEC A                                                      ;84C649|3A      |      ;
    STA.W $018A                                                ;84C64A|8D8A01  |00018A;
    STZ.W $018B                                                ;84C64D|9C8B01  |00018B;
 
.return:
    RTL                                                        ;84C650|6B      |      ;
 
 
fInput_Unknown84C651:
    SEP #$20                                                   ;84C651|E220    |      ;
    REP #$10                                                   ;84C653|C210    |      ;
    LDA.B #$03                                                 ;84C655|A903    |      ;
    STA.W nAudioRegisterValue0                                 ;84C657|8D1401  |000114;
    LDA.B #$06                                                 ;84C65A|A906    |      ;
    STA.W nAudioRegisterValue1                                 ;84C65C|8D1501  |000115;
    JSL.L fAudioSetRegister2to0A                               ;84C65F|22328383|838332;
    SEP #$20                                                   ;84C663|E220    |      ;
    LDA.W $018A                                                ;84C665|AD8A01  |00018A;
    CMP.B #$0B                                                 ;84C668|C90B    |      ;
    BCS .return                                                ;84C66A|B017    |84C683;
    REP #$20                                                   ;84C66C|C220    |      ;
    LDA.W #$0001                                               ;84C66E|A90100  |      ;
    JSL.L fDialog_Unknown_8394D7                               ;84C671|22D79483|8394D7;
    SEP #$20                                                   ;84C675|E220    |      ;
    LDA.W $018A                                                ;84C677|AD8A01  |00018A;
    CLC                                                        ;84C67A|18      |      ;
    ADC.B #$0B                                                 ;84C67B|690B    |      ;
    STA.W $018A                                                ;84C67D|8D8A01  |00018A;
    STZ.W $018B                                                ;84C680|9C8B01  |00018B;
 
.return:
    RTL                                                        ;84C683|6B      |      ;
 
 
fInput_Unknown84C684:
    SEP #$20                                                   ;84C684|E220    |      ;
    REP #$10                                                   ;84C686|C210    |      ;
    LDA.B #$03                                                 ;84C688|A903    |      ;
    STA.W nAudioRegisterValue0                                 ;84C68A|8D1401  |000114;
    LDA.B #$06                                                 ;84C68D|A906    |      ;
    STA.W nAudioRegisterValue1                                 ;84C68F|8D1501  |000115;
    JSL.L fAudioSetRegister2to0A                               ;84C692|22328383|838332;
    SEP #$20                                                   ;84C696|E220    |      ;
    LDA.W $018A                                                ;84C698|AD8A01  |00018A;
    CMP.B #$0B                                                 ;84C69B|C90B    |      ;
    BCC .return                                                ;84C69D|9017    |84C6B6;
    REP #$20                                                   ;84C69F|C220    |      ;
    LDA.W #$0001                                               ;84C6A1|A90100  |      ;
    JSL.L fDialog_Unknown_8394D7                               ;84C6A4|22D79483|8394D7;
    SEP #$20                                                   ;84C6A8|E220    |      ;
    LDA.W $018A                                                ;84C6AA|AD8A01  |00018A;
    SEC                                                        ;84C6AD|38      |      ;
    SBC.B #$0B                                                 ;84C6AE|E90B    |      ;
    STA.W $018A                                                ;84C6B0|8D8A01  |00018A;
    STZ.W $018B                                                ;84C6B3|9C8B01  |00018B;
 
.return:
    RTL                                                        ;84C6B6|6B      |      ;
 
 
fInput_Handler_case01:
    REP #$30                                                   ;84C6B7|C230    |      ;
    LDA.B strcPlayerFlags                                      ;84C6B9|A5D2    |0000D2;
    AND.W #$00C4                                               ;84C6BB|29C400  |      ;
    BEQ +                                                      ;84C6BE|F003    |84C6C3;
    JMP.W fInput_Return84C7B5                                  ;84C6C0|4CB5C7  |84C7B5;
 
 
  + LDA.B nPlayerAction                                        ;84C6C3|A5D4    |0000D4;
    CMP.W #$0003                                               ;84C6C5|C90300  |      ;
    BNE +                                                      ;84C6C8|D003    |84C6CD;
    JMP.W fInput_Return84C7B5                                  ;84C6CA|4CB5C7  |84C7B5;
 
 
  + LDA.L strcDailyFlags.flags2                                ;84C6CD|AF5C1F7F|7F1F5C;
    AND.W #$0020                                               ;84C6D1|292000  |      ;
    BEQ +                                                      ;84C6D4|F003    |84C6D9;
    JMP.W fInput_Return84C7B5                                  ;84C6D6|4CB5C7  |84C7B5;
 
 
  + REP #$30                                                   ;84C6D9|C230    |      ;
    LDA.B strcPlayerFlags                                      ;84C6DB|A5D2    |0000D2;
    AND.W #$1000                                               ;84C6DD|290010  |      ;
    BEQ +                                                      ;84C6E0|F003    |84C6E5;
    JMP.W fInput_Unknown84C7D6                                 ;84C6E2|4CD6C7  |84C7D6;
 
 
  + REP #$30                                                   ;84C6E5|C230    |      ;
    LDA.B strcPlayerFlags                                      ;84C6E7|A5D2    |0000D2;
    AND.W #$4000                                               ;84C6E9|290040  |      ;
    BNE +                                                      ;84C6EC|D003    |84C6F1;
    JMP.W fInput_Return84C7B5                                  ;84C6EE|4CB5C7  |84C7B5;
 
 
  + REP #$30                                                   ;84C6F1|C230    |      ;
    LDA.B nPlayerAction                                        ;84C6F3|A5D4    |0000D4;
    CMP.W #$0011                                               ;84C6F5|C91100  |      ;
    BNE +                                                      ;84C6F8|D003    |84C6FD;
    JMP.W fInput_Unknown84C7AA                                 ;84C6FA|4CAAC7  |84C7AA;
 
 
  + CMP.W #$0012                                               ;84C6FD|C91200  |      ;
    BNE +                                                      ;84C700|D003    |84C705;
    JMP.W fInput_Unknown84C7AA                                 ;84C702|4CAAC7  |84C7AA;
 
 
  + SEP #$20                                                   ;84C705|E220    |      ;
    LDX.B nPlayerAction                                        ;84C707|A6D4    |0000D4;
    LDA.L aLoopupTable_84C7B6,X                                ;84C709|BFB6C784|84C7B6;
    BEQ +                                                      ;84C70D|F003    |84C712;
    JMP.W fInput_Return84C7B5                                  ;84C70F|4CB5C7  |84C7B5;
 
 
  + REP #$30                                                   ;84C712|C230    |      ;
    LDA.W strcJoypad1.current                                  ;84C714|AD2401  |000124;
    BIT.W #$0400                                               ;84C717|890004  |      ;
    BEQ +                                                      ;84C71A|F003    |84C71F;
    JMP.W fInput_Unknown84C935                                 ;84C71C|4C35C9  |84C935;
 
 
  + LDA.W strcJoypad1.current                                  ;84C71F|AD2401  |000124;
    BIT.W #$0800                                               ;84C722|890008  |      ;
    BEQ +                                                      ;84C725|F003    |84C72A;
    JMP.W fInput_Unknown84C96F                                 ;84C727|4C6FC9  |84C96F;
 
 
  + LDA.W strcJoypad1.current                                  ;84C72A|AD2401  |000124;
    BIT.W #$0100                                               ;84C72D|890001  |      ;
    BEQ +                                                      ;84C730|F003    |84C735;
    JMP.W fInput_Unknown84C9A9                                 ;84C732|4CA9C9  |84C9A9;
 
 
  + LDA.W strcJoypad1.current                                  ;84C735|AD2401  |000124;
    BIT.W #$0200                                               ;84C738|890002  |      ;
    BEQ fInput_Unknown84C740                                   ;84C73B|F003    |84C740;
    JMP.W fInput_Unknown84C9E3                                 ;84C73D|4CE3C9  |84C9E3;
 
 
fInput_Unknown84C740:
    REP #$30                                                   ;84C740|C230    |      ;
    LDA.B strcPlayerFlags                                      ;84C742|A5D2    |0000D2;
    AND.W #$1000                                               ;84C744|290010  |      ;
    BEQ +                                                      ;84C747|F003    |84C74C;
    JMP.W fInput_Unknown08FD_case0200                          ;84C749|4C04C8  |84C804;
 
 
  + REP #$30                                                   ;84C74C|C230    |      ;
    LDA.B nPlayerAction                                        ;84C74E|A5D4    |0000D4;
    CMP.W #$000F                                               ;84C750|C90F00  |      ;
    BNE +                                                      ;84C753|D003    |84C758;
    JMP.W fInput_Unknown84C7AA                                 ;84C755|4CAAC7  |84C7AA;
 
 
  + REP #$20                                                   ;84C758|C220    |      ;
    LDA.W strcJoypad1.newInput                                 ;84C75A|AD2801  |000128;
    BIT.W #$0080                                               ;84C75D|898000  |      ;
    BEQ +                                                      ;84C760|F003    |84C765;
    JMP.W fInput_Unknown84CAA5                                 ;84C762|4CA5CA  |84CAA5;
 
 
  + REP #$30                                                   ;84C765|C230    |      ;
    LDA.B strcPlayerFlags                                      ;84C767|A5D2    |0000D2;
    AND.W #$0020                                               ;84C769|292000  |      ;
    BEQ +                                                      ;84C76C|F003    |84C771;
    JMP.W fInput_Return84C7B5                                  ;84C76E|4CB5C7  |84C7B5;
 
 
  + REP #$20                                                   ;84C771|C220    |      ;
    LDA.W strcJoypad1.current                                  ;84C773|AD2401  |000124;
    BIT.W #$8000                                               ;84C776|890080  |      ;
    BEQ +                                                      ;84C779|F003    |84C77E;
    JMP.W fInput_Unknown84CA1D                                 ;84C77B|4C1DCA  |84CA1D;
 
 
  + LDA.W strcJoypad1.newInput                                 ;84C77E|AD2801  |000128;
    BIT.W #$2000                                               ;84C781|890020  |      ;
    BEQ +                                                      ;84C784|F003    |84C789;
    JMP.W fInput_SetPlayerAction0x0C                           ;84C786|4C7ACE  |84CE7A;
 
 
  + LDA.W strcJoypad1.newInput                                 ;84C789|AD2801  |000128;
    BIT.W #$0040                                               ;84C78C|894000  |      ;
    BEQ +                                                      ;84C78F|F003    |84C794;
    JMP.W fInput_SetPlayerAction0x1C                           ;84C791|4CA6CE  |84CEA6;
 
 
  + LDA.W strcJoypad1.newInput                                 ;84C794|AD2801  |000128;
    BIT.W #$0010                                               ;84C797|891000  |      ;
    BEQ +                                                      ;84C79A|F003    |84C79F;
    JMP.W fInput_SetPlayerAction0x0D_WhistleR                  ;84C79C|4C0CCE  |84CE0C;
 
 
  + LDA.W strcJoypad1.newInput                                 ;84C79F|AD2801  |000128;
    BIT.W #$0020                                               ;84C7A2|892000  |      ;
    BEQ fInput_Unknown84C7AA                                   ;84C7A5|F003    |84C7AA;
    JMP.W fInput_SetPlayerAction0x1B_WhistleL                  ;84C7A7|4C43CE  |84CE43;
 
 
fInput_Unknown84C7AA:
    LDA.W strcJoypad1.newInput                                 ;84C7AA|AD2801  |000128;
    BIT.W #$4000                                               ;84C7AD|890040  |      ;
    BEQ fInput_Return84C7B5                                    ;84C7B0|F003    |84C7B5;
    JMP.W fInput_Unknown84CD77                                 ;84C7B2|4C77CD  |84CD77;
 
 
fInput_Return84C7B5:
    RTL                                                        ;84C7B5|6B      |      ;
 
 
aLoopupTable_84C7B6:
    db $00,$00,$00,$00,$01,$01,$00,$00,$01,$00,$01,$01         ;84C7B6|        |      ;
    db $01,$01,$00,$00,$01,$00,$00,$01,$01,$01,$01,$01         ;84C7C2|        |      ;
    db $01,$00,$01,$01,$01,$00,$00,$00                         ;84C7CE|        |      ;
 
fInput_Unknown84C7D6:
    REP #$30                                                   ;84C7D6|C230    |      ;
    LDA.W nUnknownFlags08FD                                    ;84C7D8|ADFD08  |0008FD;
    BIT.W #$0400                                               ;84C7DB|890004  |      ;
    BEQ +                                                      ;84C7DE|F003    |84C7E3;
    JMP.W fInput_Unknown84C935                                 ;84C7E0|4C35C9  |84C935;
 
 
  + LDA.W nUnknownFlags08FD                                    ;84C7E3|ADFD08  |0008FD;
    BIT.W #$0800                                               ;84C7E6|890008  |      ;
    BEQ +                                                      ;84C7E9|F003    |84C7EE;
    JMP.W fInput_Unknown84C96F                                 ;84C7EB|4C6FC9  |84C96F;
 
 
  + LDA.W nUnknownFlags08FD                                    ;84C7EE|ADFD08  |0008FD;
    BIT.W #$0100                                               ;84C7F1|890001  |      ;
    BEQ +                                                      ;84C7F4|F003    |84C7F9;
    JMP.W fInput_Unknown84C9A9                                 ;84C7F6|4CA9C9  |84C9A9;
 
 
  + LDA.W nUnknownFlags08FD                                    ;84C7F9|ADFD08  |0008FD;
    BIT.W #$0200                                               ;84C7FC|890002  |      ;
    BEQ fInput_Unknown08FD_case0200                            ;84C7FF|F003    |84C804;
    JMP.W fInput_Unknown84C9E3                                 ;84C801|4CE3C9  |84C9E3;
 
 
fInput_Unknown08FD_case0200:
    LDA.W nUnknownFlags08FD                                    ;84C804|ADFD08  |0008FD;
    BIT.W #$0080                                               ;84C807|898000  |      ;
    BEQ +                                                      ;84C80A|F003    |84C80F;
    JMP.W fInput_Unknown84CAA5                                 ;84C80C|4CA5CA  |84CAA5;
 
 
  + LDA.W nUnknownFlags08FD                                    ;84C80F|ADFD08  |0008FD;
    BIT.W #$8000                                               ;84C812|890080  |      ;
    BEQ +                                                      ;84C815|F003    |84C81A;
    JMP.W fInput_Unknown84CA1D                                 ;84C817|4C1DCA  |84CA1D;
 
 
  + LDA.W nUnknownFlags08FD                                    ;84C81A|ADFD08  |0008FD;
    BIT.W #$2000                                               ;84C81D|890020  |      ;
    BEQ +                                                      ;84C820|F003    |84C825;
    JMP.W fInput_SetPlayerAction0x0C                           ;84C822|4C7ACE  |84CE7A;
 
 
  + LDA.W nUnknownFlags08FD                                    ;84C825|ADFD08  |0008FD;
    BIT.W #$0040                                               ;84C828|894000  |      ;
    BEQ +                                                      ;84C82B|F003    |84C830;
    JMP.W fInput_SetPlayerAction0x1C                           ;84C82D|4CA6CE  |84CEA6;
 
 
  + LDA.W nUnknownFlags08FD                                    ;84C830|ADFD08  |0008FD;
    BIT.W #$0010                                               ;84C833|891000  |      ;
    BEQ +                                                      ;84C836|F003    |84C83B;
    JMP.W fInput_SetPlayerAction0x0D_WhistleR                  ;84C838|4C0CCE  |84CE0C;
 
 
  + LDA.W nUnknownFlags08FD                                    ;84C83B|ADFD08  |0008FD;
    BIT.W #$0020                                               ;84C83E|892000  |      ;
    BEQ +                                                      ;84C841|F003    |84C846;
    JMP.W fInput_SetPlayerAction0x1B_WhistleL                  ;84C843|4C43CE  |84CE43;
 
 
  + LDA.W nUnknownFlags08FD                                    ;84C846|ADFD08  |0008FD;
    BIT.W #$4000                                               ;84C849|890040  |      ;
    BEQ +                                                      ;84C84C|F003    |84C851;
    JMP.W fInput_Unknown84CD77                                 ;84C84E|4C77CD  |84CD77;
 
 
  + RTL                                                        ;84C851|6B      |      ;
 
 
fInput_Unused84C852:
    REP #$30                                                   ;84C852|C230    |      ;
    LDA.W strcJoypad1.newUnpressed                             ;84C854|AD2A01  |00012A;
    BIT.W #$0080                                               ;84C857|898000  |      ;
    BEQ +                                                      ;84C85A|F003    |84C85F;
    JMP.W .return                                              ;84C85C|4C2BC9  |84C92B;
 
 
  + LDA.W strcJoypad1.current                                  ;84C85F|AD2401  |000124;
    BIT.W #$0400                                               ;84C862|890004  |      ;
    BNE .label1                                                ;84C865|D023    |84C88A;
    LDA.W strcJoypad1.current                                  ;84C867|AD2401  |000124;
    BIT.W #$0800                                               ;84C86A|890008  |      ;
    BNE .label2                                                ;84C86D|D03E    |84C8AD;
    LDA.W strcJoypad1.current                                  ;84C86F|AD2401  |000124;
    BIT.W #$0100                                               ;84C872|890001  |      ;
    BNE .label3                                                ;84C875|D059    |84C8D0;
    LDA.W strcJoypad1.current                                  ;84C877|AD2401  |000124;
    BIT.W #$0200                                               ;84C87A|890002  |      ;
    BEQ +                                                      ;84C87D|F003    |84C882;
    JMP.W .label4                                              ;84C87F|4CF3C8  |84C8F3;
 
 
  + REP #$30                                                   ;84C882|C230    |      ;
    LDA.W #$0000                                               ;84C884|A90000  |      ;
    STA.B nPlayerAction                                        ;84C887|85D4    |0000D4;
 
.justReturn:
    RTL                                                        ;84C889|6B      |      ;
 
 
.label1:
    REP #$30                                                   ;84C88A|C230    |      ;
    LDA.W $0911                                                ;84C88C|AD1109  |000911;
    CMP.W #$0000                                               ;84C88F|C90000  |      ;
    BNE +                                                      ;84C892|D003    |84C897;
    JMP.W .setPlayerAction7                                    ;84C894|4C17C9  |84C917;
 
 
  + REP #$30                                                   ;84C897|C230    |      ;
    LDA.W $0911                                                ;84C899|AD1109  |000911;
    CMP.W #$0001                                               ;84C89C|C90100  |      ;
    BNE +                                                      ;84C89F|D003    |84C8A4;
    JMP.W .setPlayerAction6                                    ;84C8A1|4C21C9  |84C921;
 
 
  + REP #$30                                                   ;84C8A4|C230    |      ;
    LDA.W #$0000                                               ;84C8A6|A90000  |      ;
    STA.B nPlayerAction                                        ;84C8A9|85D4    |0000D4;
    BRA .justReturn                                            ;84C8AB|80DC    |84C889;
 
 
.label2:
    REP #$30                                                   ;84C8AD|C230    |      ;
    LDA.W $0911                                                ;84C8AF|AD1109  |000911;
    CMP.W #$0001                                               ;84C8B2|C90100  |      ;
    BNE +                                                      ;84C8B5|D003    |84C8BA;
    JMP.W .setPlayerAction7                                    ;84C8B7|4C17C9  |84C917;
 
 
  + REP #$30                                                   ;84C8BA|C230    |      ;
    LDA.W $0911                                                ;84C8BC|AD1109  |000911;
    CMP.W #$0000                                               ;84C8BF|C90000  |      ;
    BNE +                                                      ;84C8C2|D003    |84C8C7;
    JMP.W .setPlayerAction6                                    ;84C8C4|4C21C9  |84C921;
 
 
  + REP #$30                                                   ;84C8C7|C230    |      ;
    LDA.W #$0000                                               ;84C8C9|A90000  |      ;
    STA.B nPlayerAction                                        ;84C8CC|85D4    |0000D4;
    BRA .justReturn                                            ;84C8CE|80B9    |84C889;
 
 
.label3:
    REP #$30                                                   ;84C8D0|C230    |      ;
    LDA.W $0911                                                ;84C8D2|AD1109  |000911;
    CMP.W #$0002                                               ;84C8D5|C90200  |      ;
    BNE +                                                      ;84C8D8|D003    |84C8DD;
    JMP.W .setPlayerAction7                                    ;84C8DA|4C17C9  |84C917;
 
 
  + REP #$30                                                   ;84C8DD|C230    |      ;
    LDA.W $0911                                                ;84C8DF|AD1109  |000911;
    CMP.W #$0003                                               ;84C8E2|C90300  |      ;
    BNE +                                                      ;84C8E5|D003    |84C8EA;
    JMP.W .setPlayerAction6                                    ;84C8E7|4C21C9  |84C921;
 
 
  + REP #$30                                                   ;84C8EA|C230    |      ;
    LDA.W #$0000                                               ;84C8EC|A90000  |      ;
    STA.B nPlayerAction                                        ;84C8EF|85D4    |0000D4;
    BRA .justReturn                                            ;84C8F1|8096    |84C889;
 
 
.label4:
    REP #$30                                                   ;84C8F3|C230    |      ;
    LDA.W $0911                                                ;84C8F5|AD1109  |000911;
    CMP.W #$0003                                               ;84C8F8|C90300  |      ;
    BNE +                                                      ;84C8FB|D003    |84C900;
    JMP.W .setPlayerAction7                                    ;84C8FD|4C17C9  |84C917;
 
 
  + REP #$30                                                   ;84C900|C230    |      ;
    LDA.W $0911                                                ;84C902|AD1109  |000911;
    CMP.W #$0002                                               ;84C905|C90200  |      ;
    BNE +                                                      ;84C908|D003    |84C90D;
    JMP.W .setPlayerAction6                                    ;84C90A|4C21C9  |84C921;
 
 
  + REP #$30                                                   ;84C90D|C230    |      ;
    LDA.W #$0000                                               ;84C90F|A90000  |      ;
    STA.B nPlayerAction                                        ;84C912|85D4    |0000D4;
    JMP.W .justReturn                                          ;84C914|4C89C8  |84C889;
 
 
.setPlayerAction7:
    REP #$30                                                   ;84C917|C230    |      ;
    LDA.W #$0007                                               ;84C919|A90700  |      ;
    STA.B nPlayerAction                                        ;84C91C|85D4    |0000D4;
    JMP.W .justReturn                                          ;84C91E|4C89C8  |84C889;
 
 
.setPlayerAction6:
    REP #$30                                                   ;84C921|C230    |      ;
    LDA.W #$0006                                               ;84C923|A90600  |      ;
    STA.B nPlayerAction                                        ;84C926|85D4    |0000D4;
    JMP.W .justReturn                                          ;84C928|4C89C8  |84C889;
 
 
.return:
    REP #$30                                                   ;84C92B|C230    |      ;
    LDA.W #$0000                                               ;84C92D|A90000  |      ;
    STA.B nPlayerAction                                        ;84C930|85D4    |0000D4;
    JMP.W .justReturn                                          ;84C932|4C89C8  |84C889;
 
 
fInput_Unknown84C935:
    REP #$30                                                   ;84C935|C230    |      ;
    LDA.W #$0001                                               ;84C937|A90100  |      ;
    STA.B nPlayerAction                                        ;84C93A|85D4    |0000D4;
    REP #$30                                                   ;84C93C|C230    |      ;
    LDA.W #$0000                                               ;84C93E|A90000  |      ;
    STA.B nPlayerDirection                                     ;84C941|85DA    |0000DA;
    REP #$30                                                   ;84C943|C230    |      ;
    LDA.W #$0000                                               ;84C945|A90000  |      ;
    STA.W $0911                                                ;84C948|8D1109  |000911;
    JMP.W fInput_Unknown84C740                                 ;84C94B|4C40C7  |84C740;
 
    REP #$30                                                   ;84C94E|C230    |      ;
    LDA.W $0911                                                ;84C950|AD1109  |000911;
    CMP.W #$0001                                               ;84C953|C90100  |      ;
    BNE +                                                      ;84C956|D003    |84C95B;
    JMP.W fInput_Unknown84C95E                                 ;84C958|4C5EC9  |84C95E;
 
 
  + JMP.W fInput_Return84C7B5                                  ;84C95B|4CB5C7  |84C7B5;
 
 
fInput_Unknown84C95E:
    REP #$30                                                   ;84C95E|C230    |      ;
    LDA.W #$0001                                               ;84C960|A90100  |      ;
    STA.B nPlayerAction                                        ;84C963|85D4    |0000D4;
    REP #$30                                                   ;84C965|C230    |      ;
    LDA.W #$0001                                               ;84C967|A90100  |      ;
    STA.B nPlayerDirection                                     ;84C96A|85DA    |0000DA;
    JMP.W fInput_Return84C7B5                                  ;84C96C|4CB5C7  |84C7B5;
 
 
fInput_Unknown84C96F:
    REP #$30                                                   ;84C96F|C230    |      ;
    LDA.W #$0001                                               ;84C971|A90100  |      ;
    STA.B nPlayerAction                                        ;84C974|85D4    |0000D4;
    REP #$30                                                   ;84C976|C230    |      ;
    LDA.W #$0001                                               ;84C978|A90100  |      ;
    STA.B nPlayerDirection                                     ;84C97B|85DA    |0000DA;
    REP #$30                                                   ;84C97D|C230    |      ;
    LDA.W #$0001                                               ;84C97F|A90100  |      ;
    STA.W $0911                                                ;84C982|8D1109  |000911;
    JMP.W fInput_Unknown84C740                                 ;84C985|4C40C7  |84C740;
 
    REP #$30                                                   ;84C988|C230    |      ;
    LDA.W $0911                                                ;84C98A|AD1109  |000911;
    CMP.W #$0000                                               ;84C98D|C90000  |      ;
    BNE +                                                      ;84C990|D003    |84C995;
    JMP.W fInput_Unknown84C998                                 ;84C992|4C98C9  |84C998;
 
 
  + JMP.W fInput_Unknown84C740                                 ;84C995|4C40C7  |84C740;
 
 
fInput_Unknown84C998:
    REP #$30                                                   ;84C998|C230    |      ;
    LDA.W #$0001                                               ;84C99A|A90100  |      ;
    STA.B nPlayerAction                                        ;84C99D|85D4    |0000D4;
    REP #$30                                                   ;84C99F|C230    |      ;
    LDA.W #$0000                                               ;84C9A1|A90000  |      ;
    STA.B nPlayerDirection                                     ;84C9A4|85DA    |0000DA;
    JMP.W fInput_Return84C7B5                                  ;84C9A6|4CB5C7  |84C7B5;
 
 
fInput_Unknown84C9A9:
    REP #$30                                                   ;84C9A9|C230    |      ;
    LDA.W #$0001                                               ;84C9AB|A90100  |      ;
    STA.B nPlayerAction                                        ;84C9AE|85D4    |0000D4;
    REP #$30                                                   ;84C9B0|C230    |      ;
    LDA.W #$0002                                               ;84C9B2|A90200  |      ;
    STA.B nPlayerDirection                                     ;84C9B5|85DA    |0000DA;
    REP #$30                                                   ;84C9B7|C230    |      ;
    LDA.W #$0002                                               ;84C9B9|A90200  |      ;
    STA.W $0911                                                ;84C9BC|8D1109  |000911;
    JMP.W fInput_Unknown84C740                                 ;84C9BF|4C40C7  |84C740;
 
    REP #$30                                                   ;84C9C2|C230    |      ;
    LDA.W $0911                                                ;84C9C4|AD1109  |000911;
    CMP.W #$0003                                               ;84C9C7|C90300  |      ;
    BNE +                                                      ;84C9CA|D003    |84C9CF;
    JMP.W fInput_Unknown84C9D2                                 ;84C9CC|4CD2C9  |84C9D2;
 
 
  + JMP.W fInput_Unknown84C740                                 ;84C9CF|4C40C7  |84C740;
 
 
fInput_Unknown84C9D2:
    REP #$30                                                   ;84C9D2|C230    |      ;
    LDA.W #$0001                                               ;84C9D4|A90100  |      ;
    STA.B nPlayerAction                                        ;84C9D7|85D4    |0000D4;
    REP #$30                                                   ;84C9D9|C230    |      ;
    LDA.W #$0003                                               ;84C9DB|A90300  |      ;
    STA.B nPlayerDirection                                     ;84C9DE|85DA    |0000DA;
    JMP.W fInput_Return84C7B5                                  ;84C9E0|4CB5C7  |84C7B5;
 
 
fInput_Unknown84C9E3:
    REP #$30                                                   ;84C9E3|C230    |      ;
    LDA.W #$0001                                               ;84C9E5|A90100  |      ;
    STA.B nPlayerAction                                        ;84C9E8|85D4    |0000D4;
    REP #$30                                                   ;84C9EA|C230    |      ;
    LDA.W #$0003                                               ;84C9EC|A90300  |      ;
    STA.B nPlayerDirection                                     ;84C9EF|85DA    |0000DA;
    REP #$30                                                   ;84C9F1|C230    |      ;
    LDA.W #$0003                                               ;84C9F3|A90300  |      ;
    STA.W $0911                                                ;84C9F6|8D1109  |000911;
    JMP.W fInput_Unknown84C740                                 ;84C9F9|4C40C7  |84C740;
 
    REP #$30                                                   ;84C9FC|C230    |      ;
    LDA.W $0911                                                ;84C9FE|AD1109  |000911;
    CMP.W #$0002                                               ;84CA01|C90200  |      ;
    BNE +                                                      ;84CA04|D003    |84CA09;
    JMP.W fInput_Unknown84CA0C                                 ;84CA06|4C0CCA  |84CA0C;
 
 
  + JMP.W fInput_Unknown84C740                                 ;84CA09|4C40C7  |84C740;
 
 
fInput_Unknown84CA0C:
    REP #$30                                                   ;84CA0C|C230    |      ;
    LDA.W #$0001                                               ;84CA0E|A90100  |      ;
    STA.B nPlayerAction                                        ;84CA11|85D4    |0000D4;
    REP #$30                                                   ;84CA13|C230    |      ;
    LDA.W #$0002                                               ;84CA15|A90200  |      ;
    STA.B nPlayerDirection                                     ;84CA18|85DA    |0000DA;
    JMP.W fInput_Return84C7B5                                  ;84CA1A|4CB5C7  |84C7B5;
 
 
fInput_Unknown84CA1D:
    REP #$30                                                   ;84CA1D|C230    |      ;
    LDA.B strcPlayerFlags                                      ;84CA1F|A5D2    |0000D2;
    AND.W #$0800                                               ;84CA21|290008  |      ;
    BEQ +                                                      ;84CA24|F003    |84CA29;
    JMP.W .return                                              ;84CA26|4C9DCA  |84CA9D;
 
 
  + LDA.W #$0000                                               ;84CA29|A90000  |      ;
    LDX.W #$0007                                               ;84CA2C|A20700  |      ;
    LDY.W #$0007                                               ;84CA2F|A00700  |      ;
    JSL.L fUnknown_81D14E                                      ;84CA32|224ED181|81D14E;
    REP #$30                                                   ;84CA36|C230    |      ;
    LDX.W nTileInFrontOfPlayerX                                ;84CA38|AE8509  |000985;
    LDY.W nTileInFrontOfPlayerY                                ;84CA3B|AC8709  |000987;
    LDA.W #$0002                                               ;84CA3E|A90200  |      ;
    JSL.L fUnknown_82AC61                                      ;84CA41|2261AC82|82AC61;
    SEP #$20                                                   ;84CA45|E220    |      ;
    AND.B #$60                                                 ;84CA47|2960    |      ;
    BEQ .return                                                ;84CA49|F052    |84CA9D;
    AND.B #$20                                                 ;84CA4B|2920    |      ;
    BNE .label1                                                ;84CA4D|D010    |84CA5F;
    REP #$30                                                   ;84CA4F|C230    |      ;
    LDA.B strcPlayerFlags                                      ;84CA51|A5D2    |0000D2;
    ORA.W #$0200                                               ;84CA53|090002  |      ;
    STA.B strcPlayerFlags                                      ;84CA56|85D2    |0000D2;
    REP #$20                                                   ;84CA58|C220    |      ;
    LDA.W #$0021                                               ;84CA5A|A92100  |      ;
    BRA .jump                                                  ;84CA5D|8007    |84CA66;
 
 
.label1:
    REP #$20                                                   ;84CA5F|C220    |      ;
    LDA.W #$001C                                               ;84CA61|A91C00  |      ;
    BRA .jump                                                  ;84CA64|8000    |84CA66;
 
 
.jump:
    REP #$30                                                   ;84CA66|C230    |      ;
    STA.B $E3                                                  ;84CA68|85E3    |0000E3;
    LDA.B nPlayerPosX                                          ;84CA6A|A5D6    |0000D6;
    STA.B $DF                                                  ;84CA6C|85DF    |0000DF;
    LDA.B nPlayerPosY                                          ;84CA6E|A5D8    |0000D8;
    STA.B $E1                                                  ;84CA70|85E1    |0000E1;
    STZ.B $E5                                                  ;84CA72|64E5    |0000E5;
    STZ.B $E7                                                  ;84CA74|64E7    |0000E7;
    LDA.B nPlayerDirection                                     ;84CA76|A5DA    |0000DA;
    JSL.L fGameEngine_Unknown83AF37                            ;84CA78|2237AF83|83AF37;
    REP #$30                                                   ;84CA7C|C230    |      ;
    BNE .return                                                ;84CA7E|D01D    |84CA9D;
    REP #$20                                                   ;84CA80|C220    |      ;
    LDA.W #$0020                                               ;84CA82|A92000  |      ;
    STA.B $E3                                                  ;84CA85|85E3    |0000E3;
    LDA.B nPlayerDirection                                     ;84CA87|A5DA    |0000DA;
    JSL.L fGameEngine_Unknown83AD91                            ;84CA89|2291AD83|83AD91;
    REP #$30                                                   ;84CA8D|C230    |      ;
    CMP.W #$0000                                               ;84CA8F|C90000  |      ;
    BNE .return                                                ;84CA92|D009    |84CA9D;
    REP #$30                                                   ;84CA94|C230    |      ;
    LDA.W #$0003                                               ;84CA96|A90300  |      ;
    STA.B nPlayerAction                                        ;84CA99|85D4    |0000D4;
    BRA .justReturn                                            ;84CA9B|8007    |84CAA4;
 
 
.return:
    REP #$30                                                   ;84CA9D|C230    |      ;
    LDA.W #$0002                                               ;84CA9F|A90200  |      ;
    STA.B nPlayerAction                                        ;84CAA2|85D4    |0000D4;
 
.justReturn:
    RTL                                                        ;84CAA4|6B      |      ;
 
 
fInput_Unknown84CAA5:
    REP #$30                                                   ;84CAA5|C230    |      ;
    LDA.B strcPlayerFlags                                      ;84CAA7|A5D2    |0000D2;
    AND.W #$0800                                               ;84CAA9|290008  |      ;
    BEQ +                                                      ;84CAAC|F003    |84CAB1;
    JMP.W .label3                                              ;84CAAE|4C2BCB  |84CB2B;
 
 
  + LDA.B strcPlayerFlags                                      ;84CAB1|A5D2    |0000D2;
    AND.W #$0010                                               ;84CAB3|291000  |      ;
    BEQ +                                                      ;84CAB6|F003    |84CABB;
    JMP.W .label4                                              ;84CAB8|4C1CCC  |84CC1C;
 
 
  + LDA.L strcDailyFlags.flags4                                ;84CABB|AF601F7F|7F1F60;
    AND.W #$0006                                               ;84CABF|290600  |      ;
    BEQ +                                                      ;84CAC2|F003    |84CAC7;
    JMP.W .label2                                              ;84CAC4|4CFECA  |84CAFE;
 
 
  + REP #$30                                                   ;84CAC7|C230    |      ;
    LDA.B strcPlayerFlags                                      ;84CAC9|A5D2    |0000D2;
    AND.W #$0002                                               ;84CACB|290200  |      ;
    BEQ +                                                      ;84CACE|F003    |84CAD3;
    JMP.W .label1                                              ;84CAD0|4CF6CA  |84CAF6;
 
 
  + REP #$20                                                   ;84CAD3|C220    |      ;
    LDA.W #$0000                                               ;84CAD5|A90000  |      ;
    LDX.W #$0007                                               ;84CAD8|A20700  |      ;
    LDY.W #$0007                                               ;84CADB|A00700  |      ;
    JSL.L fUnknown_81D14E                                      ;84CADE|224ED181|81D14E;
    REP #$30                                                   ;84CAE2|C230    |      ;
    LDX.W nTileInFrontOfPlayerX                                ;84CAE4|AE8509  |000985;
    LDY.W nTileInFrontOfPlayerY                                ;84CAE7|AC8709  |000987;
    LDA.W #$0002                                               ;84CAEA|A90200  |      ;
    JSL.L fUnknown_82AC61                                      ;84CAED|2261AC82|82AC61;
    JSL.L fUnknown_82AD0E                                      ;84CAF1|220EAD82|82AD0E;
    RTL                                                        ;84CAF5|6B      |      ;
 
 
.label1:
    REP #$30                                                   ;84CAF6|C230    |      ;
    LDA.W #$0005                                               ;84CAF8|A90500  |      ;
    STA.B nPlayerAction                                        ;84CAFB|85D4    |0000D4;
    RTL                                                        ;84CAFD|6B      |      ;
 
 
.label2:
    REP #$30                                                   ;84CAFE|C230    |      ;
    LDA.W #$0000                                               ;84CB00|A90000  |      ;
    LDX.W #$0007                                               ;84CB03|A20700  |      ;
    LDY.W #$0007                                               ;84CB06|A00700  |      ;
    JSL.L fUnknown_81D14E                                      ;84CB09|224ED181|81D14E;
    REP #$30                                                   ;84CB0D|C230    |      ;
    LDX.W nTileInFrontOfPlayerX                                ;84CB0F|AE8509  |000985;
    LDY.W nTileInFrontOfPlayerY                                ;84CB12|AC8709  |000987;
    LDA.W #$0000                                               ;84CB15|A90000  |      ;
    JSL.L fUnknown_82AC61                                      ;84CB18|2261AC82|82AC61;
    REP #$30                                                   ;84CB1C|C230    |      ;
    CPX.W #$00F5                                               ;84CB1E|E0F500  |      ;
    BNE .justReturn                                            ;84CB21|D007    |84CB2A;
    REP #$30                                                   ;84CB23|C230    |      ;
    LDA.W #$001A                                               ;84CB25|A91A00  |      ;
    STA.B nPlayerAction                                        ;84CB28|85D4    |0000D4;
 
.justReturn:
    RTL                                                        ;84CB2A|6B      |      ;
 
 
.label3:
    REP #$30                                                   ;84CB2B|C230    |      ;
    LDA.B nPlayerPosX                                          ;84CB2D|A5D6    |0000D6;
    STA.B $DF                                                  ;84CB2F|85DF    |0000DF;
    LDA.B nPlayerPosY                                          ;84CB31|A5D8    |0000D8;
    STA.B $E1                                                  ;84CB33|85E1    |0000E1;
    STZ.B $E5                                                  ;84CB35|64E5    |0000E5;
    STZ.B $E7                                                  ;84CB37|64E7    |0000E7;
    LDA.W #$0010                                               ;84CB39|A91000  |      ;
    STA.B $E3                                                  ;84CB3C|85E3    |0000E3;
    LDA.B nPlayerDirection                                     ;84CB3E|A5DA    |0000DA;
    JSL.L fGameEngine_Unknown83AD91                            ;84CB40|2291AD83|83AD91;
    REP #$30                                                   ;84CB44|C230    |      ;
    CMP.W #$0000                                               ;84CB46|C90000  |      ;
    BEQ +                                                      ;84CB49|F003    |84CB4E;
    JMP.W .justReturn2                                         ;84CB4B|4C1BCC  |84CC1B;
 
 
  + REP #$20                                                   ;84CB4E|C220    |      ;
    LDA.W #$0000                                               ;84CB50|A90000  |      ;
    LDX.W #$0007                                               ;84CB53|A20700  |      ;
    LDY.W #$0007                                               ;84CB56|A00700  |      ;
    JSL.L fUnknown_81D14E                                      ;84CB59|224ED181|81D14E;
    REP #$20                                                   ;84CB5D|C220    |      ;
    LDA.W #$0002                                               ;84CB5F|A90200  |      ;
    LDX.W nTileInFrontOfPlayerX                                ;84CB62|AE8509  |000985;
    LDY.W nTileInFrontOfPlayerY                                ;84CB65|AC8709  |000987;
    JSL.L fUnknown_82AC61                                      ;84CB68|2261AC82|82AC61;
    SEP #$20                                                   ;84CB6C|E220    |      ;
    AND.B #$1F                                                 ;84CB6E|291F    |      ;
    BEQ +                                                      ;84CB70|F003    |84CB75;
    JMP.W .justReturn2                                         ;84CB72|4C1BCC  |84CC1B;
 
 
  + CPX.W #$00FF                                               ;84CB75|E0FF00  |      ;
    BNE +                                                      ;84CB78|D003    |84CB7D;
    JMP.W .justReturn2                                         ;84CB7A|4C1BCC  |84CC1B;
 
 
  + REP #$20                                                   ;84CB7D|C220    |      ;
    LDA.W #$0001                                               ;84CB7F|A90100  |      ;
    LDX.W #$000A                                               ;84CB82|A20A00  |      ;
    LDY.W #$000A                                               ;84CB85|A00A00  |      ;
    JSL.L fUnknown_81D14E                                      ;84CB88|224ED181|81D14E;
    REP #$20                                                   ;84CB8C|C220    |      ;
    LDA.W #$0002                                               ;84CB8E|A90200  |      ;
    LDX.W nTileInFrontOfPlayerX                                ;84CB91|AE8509  |000985;
    LDY.W nTileInFrontOfPlayerY                                ;84CB94|AC8709  |000987;
    JSL.L fUnknown_82AC61                                      ;84CB97|2261AC82|82AC61;
    SEP #$20                                                   ;84CB9B|E220    |      ;
    AND.B #$1F                                                 ;84CB9D|291F    |      ;
    BEQ +                                                      ;84CB9F|F003    |84CBA4;
    JMP.W .justReturn2                                         ;84CBA1|4C1BCC  |84CC1B;
 
 
  + CPX.W #$00FF                                               ;84CBA4|E0FF00  |      ;
    BNE +                                                      ;84CBA7|D003    |84CBAC;
    JMP.W .justReturn2                                         ;84CBA9|4C1BCC  |84CC1B;
 
 
  + REP #$20                                                   ;84CBAC|C220    |      ;
    LDA.W #$0001                                               ;84CBAE|A90100  |      ;
    LDX.W #$0000                                               ;84CBB1|A20000  |      ;
    LDY.W #$0000                                               ;84CBB4|A00000  |      ;
    JSL.L fUnknown_81D14E                                      ;84CBB7|224ED181|81D14E;
    REP #$20                                                   ;84CBBB|C220    |      ;
    LDA.W #$0002                                               ;84CBBD|A90200  |      ;
    LDX.W nTileInFrontOfPlayerX                                ;84CBC0|AE8509  |000985;
    LDY.W nTileInFrontOfPlayerY                                ;84CBC3|AC8709  |000987;
    JSL.L fUnknown_82AC61                                      ;84CBC6|2261AC82|82AC61;
    SEP #$20                                                   ;84CBCA|E220    |      ;
    AND.B #$1F                                                 ;84CBCC|291F    |      ;
    BEQ +                                                      ;84CBCE|F003    |84CBD3;
    JMP.W .justReturn2                                         ;84CBD0|4C1BCC  |84CC1B;
 
 
  + CPX.W #$00E1                                               ;84CBD3|E0E100  |      ;
    BNE +                                                      ;84CBD6|D003    |84CBDB;
    JMP.W .justReturn2                                         ;84CBD8|4C1BCC  |84CC1B;
 
 
  + CPX.W #$00FF                                               ;84CBDB|E0FF00  |      ;
    BNE +                                                      ;84CBDE|D003    |84CBE3;
    JMP.W .justReturn2                                         ;84CBE0|4C1BCC  |84CC1B;
 
 
  + CPX.W #$00C0                                               ;84CBE3|E0C000  |      ;
    BCC +                                                      ;84CBE6|9007    |84CBEF;
    CPX.W #$00D0                                               ;84CBE8|E0D000  |      ;
    BCS +                                                      ;84CBEB|B002    |84CBEF;
    BRA .justReturn2                                           ;84CBED|802C    |84CC1B;
 
 
  + REP #$30                                                   ;84CBEF|C230    |      ;
    LDA.W nTileInFrontOfPlayerX                                ;84CBF1|AD8509  |000985;
    STA.L nDogX                                                ;84CBF4|8F2C1F7F|7F1F2C;
    LDA.W nTileInFrontOfPlayerY                                ;84CBF8|AD8709  |000987;
    STA.L nDogY                                                ;84CBFB|8F2E1F7F|7F1F2E;
    SEP #$20                                                   ;84CBFF|E220    |      ;
    LDA.B nMapEngine_DestinationId                             ;84CC01|A522    |000022;
    STA.L nDogMapId                                            ;84CC03|8F301F7F|7F1F30;
    REP #$30                                                   ;84CC07|C230    |      ;
    LDA.W #$0016                                               ;84CC09|A91600  |      ;
    STA.B nPlayerAction                                        ;84CC0C|85D4    |0000D4;
    REP #$30                                                   ;84CC0E|C230    |      ;
    LDA.W #$0800                                               ;84CC10|A90008  |      ;
    EOR.W #$FFFF                                               ;84CC13|49FFFF  |      ;
    AND.B strcPlayerFlags                                      ;84CC16|25D2    |0000D2;
    STA.B strcPlayerFlags                                      ;84CC18|85D2    |0000D2;
    RTL                                                        ;84CC1A|6B      |      ;
 
 
.justReturn2:
    RTL                                                        ;84CC1B|6B      |      ;
 
 
.label4:
    REP #$30                                                   ;84CC1C|C230    |      ;
    LDA.B nPlayerDirection                                     ;84CC1E|A5DA    |0000DA;
    CMP.W #$0000                                               ;84CC20|C90000  |      ;
    BNE +                                                      ;84CC23|D003    |84CC28;
    JMP.W .label5                                              ;84CC25|4C40CC  |84CC40;
 
 
  + CMP.W #$0001                                               ;84CC28|C90100  |      ;
    BNE +                                                      ;84CC2B|D003    |84CC30;
    JMP.W .label6                                              ;84CC2D|4C6FCC  |84CC6F;
 
 
  + CMP.W #$0002                                               ;84CC30|C90200  |      ;
    BNE +                                                      ;84CC33|D003    |84CC38;
    JMP.W .label7                                              ;84CC35|4C98CC  |84CC98;
 
 
  + CMP.W #$0003                                               ;84CC38|C90300  |      ;
    BNE .label5                                                ;84CC3B|D003    |84CC40;
    JMP.W .label8                                              ;84CC3D|4CC0CC  |84CCC0;
 
 
.label5:
    REP #$30                                                   ;84CC40|C230    |      ;
    LDA.W #$0002                                               ;84CC42|A90200  |      ;
    STA.W $0911                                                ;84CC45|8D1109  |000911;
    JSL.L fInput_Unknown84CD16                                 ;84CC48|2216CD84|84CD16;
    REP #$30                                                   ;84CC4C|C230    |      ;
    BNE +                                                      ;84CC4E|D003    |84CC53;
    JMP.W .label9                                              ;84CC50|4CE8CC  |84CCE8;
 
 
  + LDA.W #$0003                                               ;84CC53|A90300  |      ;
    STA.W $0911                                                ;84CC56|8D1109  |000911;
    JSL.L fInput_Unknown84CD16                                 ;84CC59|2216CD84|84CD16;
    REP #$30                                                   ;84CC5D|C230    |      ;
    BNE +                                                      ;84CC5F|D003    |84CC64;
    JMP.W .label9                                              ;84CC61|4CE8CC  |84CCE8;
 
 
  + LDA.W #$0000                                               ;84CC64|A90000  |      ;
    STA.B nPlayerDirection                                     ;84CC67|85DA    |0000DA;
    STA.W $0911                                                ;84CC69|8D1109  |000911;
    JMP.W .justReturn3                                         ;84CC6C|4C15CD  |84CD15;
 
 
.label6:
    REP #$30                                                   ;84CC6F|C230    |      ;
    LDA.W #$0003                                               ;84CC71|A90300  |      ;
    STA.W $0911                                                ;84CC74|8D1109  |000911;
    JSL.L fInput_Unknown84CD16                                 ;84CC77|2216CD84|84CD16;
    REP #$30                                                   ;84CC7B|C230    |      ;
    BEQ .label9                                                ;84CC7D|F069    |84CCE8;
    LDA.W #$0002                                               ;84CC7F|A90200  |      ;
    STA.W $0911                                                ;84CC82|8D1109  |000911;
    JSL.L fInput_Unknown84CD16                                 ;84CC85|2216CD84|84CD16;
    REP #$30                                                   ;84CC89|C230    |      ;
    BEQ .label9                                                ;84CC8B|F05B    |84CCE8;
    LDA.W #$0001                                               ;84CC8D|A90100  |      ;
    STA.B nPlayerDirection                                     ;84CC90|85DA    |0000DA;
    STA.W $0911                                                ;84CC92|8D1109  |000911;
    JMP.W .justReturn3                                         ;84CC95|4C15CD  |84CD15;
 
 
.label7:
    REP #$30                                                   ;84CC98|C230    |      ;
    LDA.W #$0000                                               ;84CC9A|A90000  |      ;
    STA.W $0911                                                ;84CC9D|8D1109  |000911;
    JSL.L fInput_Unknown84CD16                                 ;84CCA0|2216CD84|84CD16;
    REP #$30                                                   ;84CCA4|C230    |      ;
    BEQ .label9                                                ;84CCA6|F040    |84CCE8;
    LDA.W #$0001                                               ;84CCA8|A90100  |      ;
    STA.W $0911                                                ;84CCAB|8D1109  |000911;
    JSL.L fInput_Unknown84CD16                                 ;84CCAE|2216CD84|84CD16;
    REP #$30                                                   ;84CCB2|C230    |      ;
    BEQ .label9                                                ;84CCB4|F032    |84CCE8;
    LDA.W #$0002                                               ;84CCB6|A90200  |      ;
    STA.B nPlayerDirection                                     ;84CCB9|85DA    |0000DA;
    STA.W $0911                                                ;84CCBB|8D1109  |000911;
    BRA .justReturn3                                           ;84CCBE|8055    |84CD15;
 
 
.label8:
    REP #$30                                                   ;84CCC0|C230    |      ;
    LDA.W #$0000                                               ;84CCC2|A90000  |      ;
    STA.W $0911                                                ;84CCC5|8D1109  |000911;
    JSL.L fInput_Unknown84CD16                                 ;84CCC8|2216CD84|84CD16;
    REP #$30                                                   ;84CCCC|C230    |      ;
    BEQ .label9                                                ;84CCCE|F018    |84CCE8;
    LDA.W #$0001                                               ;84CCD0|A90100  |      ;
    STA.W $0911                                                ;84CCD3|8D1109  |000911;
    JSL.L fInput_Unknown84CD16                                 ;84CCD6|2216CD84|84CD16;
    REP #$30                                                   ;84CCDA|C230    |      ;
    BEQ .label9                                                ;84CCDC|F00A    |84CCE8;
    LDA.W #$0003                                               ;84CCDE|A90300  |      ;
    STA.B nPlayerDirection                                     ;84CCE1|85DA    |0000DA;
    STA.W $0911                                                ;84CCE3|8D1109  |000911;
    BRA .justReturn3                                           ;84CCE6|802D    |84CD15;
 
 
.label9:
    REP #$30                                                   ;84CCE8|C230    |      ;
    LDA.W #$0018                                               ;84CCEA|A91800  |      ;
    STA.B nPlayerAction                                        ;84CCED|85D4    |0000D4;
    REP #$30                                                   ;84CCEF|C230    |      ;
    LDA.B nPlayerPosX                                          ;84CCF1|A5D6    |0000D6;
    STA.W nTileInFrontOfPlayerX                                ;84CCF3|8D8509  |000985;
    LDA.B nPlayerPosY                                          ;84CCF6|A5D8    |0000D8;
    STA.W nTileInFrontOfPlayerY                                ;84CCF8|8D8709  |000987;
    LDA.W #$0017                                               ;84CCFB|A91700  |      ;
    LDX.W #$0000                                               ;84CCFE|A20000  |      ;
    LDY.W #$0014                                               ;84CD01|A01400  |      ;
    JSL.L fAI_Unknown8480F8                                    ;84CD04|22F88084|8480F8;
    REP #$20                                                   ;84CD08|C220    |      ;
    STZ.W $0878                                                ;84CD0A|9C7808  |000878;
    STZ.W $087A                                                ;84CD0D|9C7A08  |00087A;
    SEP #$20                                                   ;84CD10|E220    |      ;
    STZ.W $0939                                                ;84CD12|9C3909  |000939;
 
.justReturn3:
    RTL                                                        ;84CD15|6B      |      ;
 
 
fInput_Unknown84CD16:
    REP #$30                                                   ;84CD16|C230    |      ;
    LDA.W #$0010                                               ;84CD18|A91000  |      ;
    STA.B $E3                                                  ;84CD1B|85E3    |0000E3;
    LDA.B nPlayerPosX                                          ;84CD1D|A5D6    |0000D6;
    STA.B $DF                                                  ;84CD1F|85DF    |0000DF;
    LDA.B nPlayerPosY                                          ;84CD21|A5D8    |0000D8;
    STA.B $E1                                                  ;84CD23|85E1    |0000E1;
    STZ.B $E5                                                  ;84CD25|64E5    |0000E5;
    STZ.B $E7                                                  ;84CD27|64E7    |0000E7;
    LDA.W $0911                                                ;84CD29|AD1109  |000911;
    JSL.L fGameEngine_Unknown83AF37                            ;84CD2C|2237AF83|83AF37;
    REP #$30                                                   ;84CD30|C230    |      ;
    BEQ +                                                      ;84CD32|F003    |84CD37;
    JMP.W .return                                              ;84CD34|4C71CD  |84CD71;
 
 
  + LDA.B $E9                                                  ;84CD37|A5E9    |0000E9;
    SEC                                                        ;84CD39|38      |      ;
    SBC.W #$00C0                                               ;84CD3A|E9C000  |      ;
    CMP.W #$0010                                               ;84CD3D|C91000  |      ;
    BCS +                                                      ;84CD40|B003    |84CD45;
    JMP.W .return                                              ;84CD42|4C71CD  |84CD71;
 
 
  + LDA.B $EB                                                  ;84CD45|A5EB    |0000EB;
    SEC                                                        ;84CD47|38      |      ;
    SBC.W #$00C0                                               ;84CD48|E9C000  |      ;
    CMP.W #$0010                                               ;84CD4B|C91000  |      ;
    BCS +                                                      ;84CD4E|B003    |84CD53;
    JMP.W .return                                              ;84CD50|4C71CD  |84CD71;
 
 
  + REP #$20                                                   ;84CD53|C220    |      ;
    LDA.W #$0010                                               ;84CD55|A91000  |      ;
    STA.B $E3                                                  ;84CD58|85E3    |0000E3;
    LDA.W $0911                                                ;84CD5A|AD1109  |000911;
    JSL.L fGameEngine_Unknown83AD91                            ;84CD5D|2291AD83|83AD91;
    REP #$30                                                   ;84CD61|C230    |      ;
    CMP.W #$0000                                               ;84CD63|C90000  |      ;
    BEQ +                                                      ;84CD66|F003    |84CD6B;
    JMP.W .return                                              ;84CD68|4C71CD  |84CD71;
 
 
  + REP #$30                                                   ;84CD6B|C230    |      ;
    LDA.W #$0000                                               ;84CD6D|A90000  |      ;
    RTL                                                        ;84CD70|6B      |      ;
 
 
.return:
    REP #$30                                                   ;84CD71|C230    |      ;
    LDA.W #$0001                                               ;84CD73|A90100  |      ;
    RTL                                                        ;84CD76|6B      |      ;
 
 
fInput_Unknown84CD77:
    REP #$30                                                   ;84CD77|C230    |      ;
    LDA.B strcPlayerFlags                                      ;84CD79|A5D2    |0000D2;
    AND.W #$0002                                               ;84CD7B|290200  |      ;
    BEQ +                                                      ;84CD7E|F003    |84CD83;
    JMP.W fInput_Return84CDDC                                  ;84CD80|4CDCCD  |84CDDC;
 
 
  + REP #$30                                                   ;84CD83|C230    |      ;
    LDA.B strcPlayerFlags                                      ;84CD85|A5D2    |0000D2;
    AND.W #$0010                                               ;84CD87|291000  |      ;
    BEQ +                                                      ;84CD8A|F003    |84CD8F;
    JMP.W fInput_Return84CDDC                                  ;84CD8C|4CDCCD  |84CDDC;
 
 
  + REP #$30                                                   ;84CD8F|C230    |      ;
    LDA.B strcPlayerFlags                                      ;84CD91|A5D2    |0000D2;
    AND.W #$0800                                               ;84CD93|290008  |      ;
    BEQ +                                                      ;84CD96|F003    |84CD9B;
    JMP.W fInput_Return84CDDC                                  ;84CD98|4CDCCD  |84CDDC;
 
 
  + REP #$30                                                   ;84CD9B|C230    |      ;
    LDA.B nPlayerAction                                        ;84CD9D|A5D4    |0000D4;
    CMP.W #$000F                                               ;84CD9F|C90F00  |      ;
    BNE +                                                      ;84CDA2|D003    |84CDA7;
    JMP.W fInput_SetPlayerAction0x10                           ;84CDA4|4CDDCD  |84CDDD;
 
 
  + REP #$30                                                   ;84CDA7|C230    |      ;
    LDA.B nPlayerAction                                        ;84CDA9|A5D4    |0000D4;
    CMP.W #$0011                                               ;84CDAB|C91100  |      ;
    BNE +                                                      ;84CDAE|D003    |84CDB3;
    JMP.W fInput_SetPlayerAction0x0F                           ;84CDB0|4CE5CD  |84CDE5;
 
 
  + REP #$30                                                   ;84CDB3|C230    |      ;
    LDA.B nPlayerAction                                        ;84CDB5|A5D4    |0000D4;
    CMP.W #$0012                                               ;84CDB7|C91200  |      ;
    BNE fInput_SetPlayerAction0x0A                             ;84CDBA|D003    |84CDBF;
    JMP.W fInput_SetPlayerAction0x13                           ;84CDBC|4CEDCD  |84CDED;
 
 
fInput_SetPlayerAction0x0A:
    REP #$20                                                   ;84CDBF|C220    |      ;
    LDA.L strcDailyFlags.flags4                                ;84CDC1|AF601F7F|7F1F60;
    AND.W #$8000                                               ;84CDC5|290080  |      ;
    BNE fInput_Return84CDDC                                    ;84CDC8|D012    |84CDDC;
    SEP #$20                                                   ;84CDCA|E220    |      ;
    LDA.W nToolEquipped                                        ;84CDCC|AD2109  |000921;
    BEQ fInput_Return84CDDC                                    ;84CDCF|F00B    |84CDDC;
    REP #$30                                                   ;84CDD1|C230    |      ;
    LDA.W #$000A                                               ;84CDD3|A90A00  |      ;
    STA.B nPlayerAction                                        ;84CDD6|85D4    |0000D4;
    JSL.L fToolUsed_AnimationSubrutines                        ;84CDD8|22A89082|8290A8;
 
fInput_Return84CDDC:
    RTL                                                        ;84CDDC|6B      |      ;
 
 
fInput_SetPlayerAction0x10:
    REP #$30                                                   ;84CDDD|C230    |      ;
    LDA.W #$0010                                               ;84CDDF|A91000  |      ;
    STA.B nPlayerAction                                        ;84CDE2|85D4    |0000D4;
    RTL                                                        ;84CDE4|6B      |      ;
 
 
fInput_SetPlayerAction0x0F:
    REP #$30                                                   ;84CDE5|C230    |      ;
    LDA.W #$000F                                               ;84CDE7|A90F00  |      ;
    STA.B nPlayerAction                                        ;84CDEA|85D4    |0000D4;
    RTL                                                        ;84CDEC|6B      |      ;
 
 
fInput_SetPlayerAction0x13:
    REP #$30                                                   ;84CDED|C230    |      ;
    LDA.W #$0013                                               ;84CDEF|A91300  |      ;
    STA.B nPlayerAction                                        ;84CDF2|85D4    |0000D4;
    SEP #$20                                                   ;84CDF4|E220    |      ;
    LDA.B #$03                                                 ;84CDF6|A903    |      ;
    JSL.L fCore_GetRandomNumber                                ;84CDF8|22F98980|8089F9;
    SEP #$20                                                   ;84CDFC|E220    |      ;
    XBA                                                        ;84CDFE|EB      |      ;
    LDA.B #$00                                                 ;84CDFF|A900    |      ;
    XBA                                                        ;84CE01|EB      |      ;
    REP #$20                                                   ;84CE02|C220    |      ;
    CLC                                                        ;84CE04|18      |      ;
    ADC.W #$008B                                               ;84CE05|698B00  |      ;
    STA.W $0901                                                ;84CE08|8D0109  |000901;
    RTL                                                        ;84CE0B|6B      |      ;
 
 
fInput_SetPlayerAction0x0D_WhistleR:
    REP #$30                                                   ;84CE0C|C230    |      ;
    LDA.B strcPlayerFlags                                      ;84CE0E|A5D2    |0000D2;
    AND.W #$0002                                               ;84CE10|290200  |      ;
    BEQ +                                                      ;84CE13|F003    |84CE18;
    JMP.W .justReturn                                          ;84CE15|4C42CE  |84CE42;
 
 
  + REP #$30                                                   ;84CE18|C230    |      ;
    LDA.B strcPlayerFlags                                      ;84CE1A|A5D2    |0000D2;
    AND.W #$0010                                               ;84CE1C|291000  |      ;
    BEQ +                                                      ;84CE1F|F003    |84CE24;
    JMP.W .justReturn                                          ;84CE21|4C42CE  |84CE42;
 
 
  + REP #$30                                                   ;84CE24|C230    |      ;
    LDA.B strcPlayerFlags                                      ;84CE26|A5D2    |0000D2;
    AND.W #$0800                                               ;84CE28|290008  |      ;
    BEQ +                                                      ;84CE2B|F003    |84CE30;
    JMP.W .justReturn                                          ;84CE2D|4C42CE  |84CE42;
 
 
  + REP #$30                                                   ;84CE30|C230    |      ;
    LDA.L strcEventFlags.flags3                                ;84CE32|AF681F7F|7F1F68;
    AND.W #$0100                                               ;84CE36|290001  |      ;
    BEQ .justReturn                                            ;84CE39|F007    |84CE42;
    REP #$30                                                   ;84CE3B|C230    |      ;
    LDA.W #$000D                                               ;84CE3D|A90D00  |      ;
    STA.B nPlayerAction                                        ;84CE40|85D4    |0000D4;
 
.justReturn:
    RTL                                                        ;84CE42|6B      |      ;
 
 
fInput_SetPlayerAction0x1B_WhistleL:
    REP #$30                                                   ;84CE43|C230    |      ;
    LDA.B strcPlayerFlags                                      ;84CE45|A5D2    |0000D2;
    AND.W #$0002                                               ;84CE47|290200  |      ;
    BEQ +                                                      ;84CE4A|F003    |84CE4F;
    JMP.W .justReturn                                          ;84CE4C|4C79CE  |84CE79;
 
 
  + REP #$30                                                   ;84CE4F|C230    |      ;
    LDA.B strcPlayerFlags                                      ;84CE51|A5D2    |0000D2;
    AND.W #$0010                                               ;84CE53|291000  |      ;
    BEQ +                                                      ;84CE56|F003    |84CE5B;
    JMP.W .justReturn                                          ;84CE58|4C79CE  |84CE79;
 
 
  + REP #$30                                                   ;84CE5B|C230    |      ;
    LDA.B strcPlayerFlags                                      ;84CE5D|A5D2    |0000D2;
    AND.W #$0800                                               ;84CE5F|290008  |      ;
    BEQ +                                                      ;84CE62|F003    |84CE67;
    JMP.W .justReturn                                          ;84CE64|4C79CE  |84CE79;
 
 
  + REP #$30                                                   ;84CE67|C230    |      ;
    LDA.L strcEventFlags.flags3                                ;84CE69|AF681F7F|7F1F68;
    AND.W #$0080                                               ;84CE6D|298000  |      ;
    BEQ .justReturn                                            ;84CE70|F007    |84CE79;
    REP #$30                                                   ;84CE72|C230    |      ;
    LDA.W #$001B                                               ;84CE74|A91B00  |      ;
    STA.B nPlayerAction                                        ;84CE77|85D4    |0000D4;
 
.justReturn:
    RTL                                                        ;84CE79|6B      |      ;
 
 
fInput_SetPlayerAction0x0C:
    REP #$30                                                   ;84CE7A|C230    |      ;
    LDA.B strcPlayerFlags                                      ;84CE7C|A5D2    |0000D2;
    AND.W #$0002                                               ;84CE7E|290200  |      ;
    BEQ CODE_84CE86                                            ;84CE81|F003    |84CE86;
    JMP.W CODE_84CEA5                                          ;84CE83|4CA5CE  |84CEA5;
 
 
CODE_84CE86:
    REP #$30                                                   ;84CE86|C230    |      ;
    LDA.B strcPlayerFlags                                      ;84CE88|A5D2    |0000D2;
    AND.W #$0010                                               ;84CE8A|291000  |      ;
    BEQ CODE_84CE92                                            ;84CE8D|F003    |84CE92;
    JMP.W CODE_84CEA5                                          ;84CE8F|4CA5CE  |84CEA5;
 
 
CODE_84CE92:
    REP #$30                                                   ;84CE92|C230    |      ;
    LDA.B strcPlayerFlags                                      ;84CE94|A5D2    |0000D2;
    AND.W #$0800                                               ;84CE96|290008  |      ;
    BEQ CODE_84CE9E                                            ;84CE99|F003    |84CE9E;
    JMP.W CODE_84CEA5                                          ;84CE9B|4CA5CE  |84CEA5;
 
 
CODE_84CE9E:
    REP #$30                                                   ;84CE9E|C230    |      ;
    LDA.W #$000C                                               ;84CEA0|A90C00  |      ;
    STA.B nPlayerAction                                        ;84CEA3|85D4    |0000D4;
 
CODE_84CEA5:
    RTL                                                        ;84CEA5|6B      |      ;
 
 
fInput_SetPlayerAction0x1C:
    REP #$30                                                   ;84CEA6|C230    |      ;
    LDA.B strcPlayerFlags                                      ;84CEA8|A5D2    |0000D2;
    AND.W #$0002                                               ;84CEAA|290200  |      ;
    BEQ CODE_84CEB2                                            ;84CEAD|F003    |84CEB2;
    JMP.W CODE_84CED1                                          ;84CEAF|4CD1CE  |84CED1;
 
 
CODE_84CEB2:
    REP #$30                                                   ;84CEB2|C230    |      ;
    LDA.B strcPlayerFlags                                      ;84CEB4|A5D2    |0000D2;
    AND.W #$0010                                               ;84CEB6|291000  |      ;
    BEQ CODE_84CEBE                                            ;84CEB9|F003    |84CEBE;
    JMP.W CODE_84CED1                                          ;84CEBB|4CD1CE  |84CED1;
 
 
CODE_84CEBE:
    REP #$30                                                   ;84CEBE|C230    |      ;
    LDA.B strcPlayerFlags                                      ;84CEC0|A5D2    |0000D2;
    AND.W #$0800                                               ;84CEC2|290008  |      ;
    BEQ CODE_84CECA                                            ;84CEC5|F003    |84CECA;
    JMP.W CODE_84CED1                                          ;84CEC7|4CD1CE  |84CED1;
 
 
CODE_84CECA:
    REP #$30                                                   ;84CECA|C230    |      ;
    LDA.W #$001C                                               ;84CECC|A91C00  |      ;
    STA.B nPlayerAction                                        ;84CECF|85D4    |0000D4;
 
CODE_84CED1:
    RTL                                                        ;84CED1|6B      |      ;
 
 
fInput_Handler_case06:
    SEP #$20                                                   ;84CED2|E220    |      ;
    REP #$10                                                   ;84CED4|C210    |      ;
    LDA.W $019B                                                ;84CED6|AD9B01  |00019B;
    AND.B #$04                                                 ;84CED9|2904    |      ;
    BEQ CODE_84CF04                                            ;84CEDB|F027    |84CF04;
    REP #$30                                                   ;84CEDD|C230    |      ;
    LDA.W $09B1                                                ;84CEDF|ADB109  |0009B1;
    INC A                                                      ;84CEE2|1A      |      ;
    STA.W $09B1                                                ;84CEE3|8DB109  |0009B1;
    CMP.W #$0078                                               ;84CEE6|C97800  |      ;
    BNE CODE_84CF04                                            ;84CEE9|D019    |84CF04;
    STZ.W $09B1                                                ;84CEEB|9CB109  |0009B1;
    JSL.L fDialog_Unknown_8393F9                               ;84CEEE|22F99383|8393F9;
    SEP #$20                                                   ;84CEF2|E220    |      ;
    LDA.B #$01                                                 ;84CEF4|A901    |      ;
    STA.W $019A                                                ;84CEF6|8D9A01  |00019A;
    REP #$20                                                   ;84CEF9|C220    |      ;
    LDA.W strcJoypad1.newInput                                 ;84CEFB|AD2801  |000128;
    AND.W #$FF7F                                               ;84CEFE|297FFF  |      ;
    STA.W strcJoypad1.newInput                                 ;84CF01|8D2801  |000128;
 
CODE_84CF04:
    RTL                                                        ;84CF04|6B      |      ;
 
 
fInput_Handler_case02:
    SEP #$20                                                   ;84CF05|E220    |      ;
    REP #$10                                                   ;84CF07|C210    |      ;
    LDA.W $019B                                                ;84CF09|AD9B01  |00019B;
    AND.B #$02                                                 ;84CF0C|2902    |      ;
    BNE fInput_Unknown84CF2D                                   ;84CF0E|D01D    |84CF2D;
    LDA.W $019B                                                ;84CF10|AD9B01  |00019B;
    AND.B #$04                                                 ;84CF13|2904    |      ;
    BNE fInput_Unknown84CF40                                   ;84CF15|D029    |84CF40;
    LDA.W $019B                                                ;84CF17|AD9B01  |00019B;
    AND.B #$08                                                 ;84CF1A|2908    |      ;
    BNE fInput_Unknown84CF62                                   ;84CF1C|D044    |84CF62;
    LDA.W $019B                                                ;84CF1E|AD9B01  |00019B;
    AND.B #$10                                                 ;84CF21|2910    |      ;
    BNE fInput_Unknown84CF95                                   ;84CF23|D070    |84CF95;
    LDA.W $019B                                                ;84CF25|AD9B01  |00019B;
    AND.B #$20                                                 ;84CF28|2920    |      ;
    BNE fInput_Unknown84CF40                                   ;84CF2A|D014    |84CF40;
    RTL                                                        ;84CF2C|6B      |      ;
 
 
fInput_Unknown84CF2D:
    REP #$30                                                   ;84CF2D|C230    |      ;
    LDA.W strcJoypad1.current                                  ;84CF2F|AD2401  |000124;
    BIT.W #$0080                                               ;84CF32|898000  |      ;
    BNE fInput_Unknown84CF38                                   ;84CF35|D001    |84CF38;
    RTL                                                        ;84CF37|6B      |      ;
 
 
fInput_Unknown84CF38:
    SEP #$20                                                   ;84CF38|E220    |      ;
    LDA.B #$04                                                 ;84CF3A|A904    |      ;
    STA.W $0189                                                ;84CF3C|8D8901  |000189;
    RTL                                                        ;84CF3F|6B      |      ;
 
 
fInput_Unknown84CF40:
    REP #$30                                                   ;84CF40|C230    |      ;
    LDA.W strcJoypad1.newInput                                 ;84CF42|AD2801  |000128;
    BIT.W #$0080                                               ;84CF45|898000  |      ;
    BNE +                                                      ;84CF48|D001    |84CF4B;
    RTL                                                        ;84CF4A|6B      |      ;
 
 
  + JSL.L fDialog_Unknown_8393F9                               ;84CF4B|22F99383|8393F9;
    SEP #$20                                                   ;84CF4F|E220    |      ;
    LDA.B #$01                                                 ;84CF51|A901    |      ;
    STA.W $019A                                                ;84CF53|8D9A01  |00019A;
    REP #$20                                                   ;84CF56|C220    |      ;
    LDA.W strcJoypad1.newInput                                 ;84CF58|AD2801  |000128;
    AND.W #$FF7F                                               ;84CF5B|297FFF  |      ;
    STA.W strcJoypad1.newInput                                 ;84CF5E|8D2801  |000128;
    RTL                                                        ;84CF61|6B      |      ;
 
 
fInput_Unknown84CF62:
    REP #$30                                                   ;84CF62|C230    |      ;
    LDA.W strcJoypad1.newInput                                 ;84CF64|AD2801  |000128;
    BIT.W #$0080                                               ;84CF67|898000  |      ;
    BNE +                                                      ;84CF6A|D001    |84CF6D;
    RTL                                                        ;84CF6C|6B      |      ;
 
 
  + JSL.L fDialog_Unknown_83932D                               ;84CF6D|222D9383|83932D;
    REP #$20                                                   ;84CF71|C220    |      ;
    LDA.W nCurrentTextIndex                                    ;84CF73|AD8701  |000187;
    INC A                                                      ;84CF76|1A      |      ;
    STA.W nCurrentTextIndex                                    ;84CF77|8D8701  |000187;
    LDA.W #$5000                                               ;84CF7A|A90050  |      ;
    CLC                                                        ;84CF7D|18      |      ;
    ADC.W #$0010                                               ;84CF7E|691000  |      ;
    STA.W $0185                                                ;84CF81|8D8501  |000185;
    SEP #$20                                                   ;84CF84|E220    |      ;
    STZ.W $018B                                                ;84CF86|9C8B01  |00018B;
    LDA.W $019B                                                ;84CF89|AD9B01  |00019B;
    AND.B #$F7                                                 ;84CF8C|29F7    |      ;
    STA.W $019B                                                ;84CF8E|8D9B01  |00019B;
    STZ.W $0189                                                ;84CF91|9C8901  |000189;
    RTL                                                        ;84CF94|6B      |      ;
 
 
fInput_Unknown84CF95:
    REP #$30                                                   ;84CF95|C230    |      ;
    LDA.W strcJoypad1.newInput                                 ;84CF97|AD2801  |000128;
    BIT.W #$0400                                               ;84CF9A|890004  |      ;
    BNE fInput_Unknown84CFEA                                   ;84CF9D|D04B    |84CFEA;
    LDA.W strcJoypad1.newInput                                 ;84CF9F|AD2801  |000128;
    BIT.W #$0800                                               ;84CFA2|890008  |      ;
    BEQ +                                                      ;84CFA5|F003    |84CFAA;
    JMP.W fInput_Unknown84D03A                                 ;84CFA7|4C3AD0  |84D03A;
 
 
  + LDA.W strcJoypad1.newInput                                 ;84CFAA|AD2801  |000128;
    BIT.W #$0100                                               ;84CFAD|890001  |      ;
    BEQ +                                                      ;84CFB0|F003    |84CFB5;
    JMP.W fInput_Unknown84D08E                                 ;84CFB2|4C8ED0  |84D08E;
 
 
  + LDA.W strcJoypad1.newInput                                 ;84CFB5|AD2801  |000128;
    BIT.W #$0200                                               ;84CFB8|890002  |      ;
    BEQ +                                                      ;84CFBB|F003    |84CFC0;
    JMP.W fInput_Unknown84D0F4                                 ;84CFBD|4CF4D0  |84D0F4;
 
 
  + LDA.W strcJoypad1.newInput                                 ;84CFC0|AD2801  |000128;
    BIT.W #$0080                                               ;84CFC3|898000  |      ;
    BEQ +                                                      ;84CFC6|F003    |84CFCB;
    JMP.W fInput_Unknown84CFCC                                 ;84CFC8|4CCCCF  |84CFCC;
 
 
  + RTL                                                        ;84CFCB|6B      |      ;
 
 
fInput_Unknown84CFCC:
    SEP #$20                                                   ;84CFCC|E220    |      ;
    REP #$10                                                   ;84CFCE|C210    |      ;
    LDA.B #$01                                                 ;84CFD0|A901    |      ;
    STA.W nAudioRegisterValue0                                 ;84CFD2|8D1401  |000114;
    LDA.B #$06                                                 ;84CFD5|A906    |      ;
    STA.W nAudioRegisterValue1                                 ;84CFD7|8D1501  |000115;
    JSL.L fAudioSetRegister2to0A                               ;84CFDA|22328383|838332;
    JSL.L fDialog_Unknown_8393F9                               ;84CFDE|22F99383|8393F9;
    SEP #$20                                                   ;84CFE2|E220    |      ;
    LDA.B #$01                                                 ;84CFE4|A901    |      ;
    STA.W $019A                                                ;84CFE6|8D9A01  |00019A;
    RTL                                                        ;84CFE9|6B      |      ;
 
 
fInput_Unknown84CFEA:
    SEP #$20                                                   ;84CFEA|E220    |      ;
    REP #$10                                                   ;84CFEC|C210    |      ;
    LDA.B #$03                                                 ;84CFEE|A903    |      ;
    STA.W nAudioRegisterValue0                                 ;84CFF0|8D1401  |000114;
    LDA.B #$06                                                 ;84CFF3|A906    |      ;
    STA.W nAudioRegisterValue1                                 ;84CFF5|8D1501  |000115;
    JSL.L fAudioSetRegister2to0A                               ;84CFF8|22328383|838332;
    REP #$30                                                   ;84CFFC|C230    |      ;
    LDX.W #$0001                                               ;84CFFE|A20100  |      ;
    LDA.W #$00B1                                               ;84D001|A9B100  |      ;
    JSL.L fDialog_TransferGlyph                                ;84D004|22239883|839823;
    SEP #$20                                                   ;84D008|E220    |      ;
    LDA.W $018F                                                ;84D00A|AD8F01  |00018F;
    CMP.B #$03                                                 ;84D00D|C903    |      ;
    BCC .label1                                                ;84D00F|900B    |84D01C;
    CMP.W $018E                                                ;84D011|CD8E01  |00018E;
    BEQ .label2                                                ;84D014|F01A    |84D030;
    INC A                                                      ;84D016|1A      |      ;
    STA.W $018F                                                ;84D017|8D8F01  |00018F;
    BRA fInput_Unknown84D036                                   ;84D01A|801A    |84D036;
 
 
.label1:
    CMP.W $018E                                                ;84D01C|CD8E01  |00018E;
    BEQ +                                                      ;84D01F|F00A    |84D02B;
    CMP.B #$02                                                 ;84D021|C902    |      ;
    BEQ +                                                      ;84D023|F006    |84D02B;
    INC A                                                      ;84D025|1A      |      ;
    STA.W $018F                                                ;84D026|8D8F01  |00018F;
    BRA fInput_Unknown84D036                                   ;84D029|800B    |84D036;
 
 
  + STZ.W $018F                                                ;84D02B|9C8F01  |00018F;
    BRA fInput_Unknown84D036                                   ;84D02E|8006    |84D036;
 
 
.label2:
    DEC A                                                      ;84D030|3A      |      ;
    STA.W $018F                                                ;84D031|8D8F01  |00018F;
    BRA fInput_Unknown84D036                                   ;84D034|8000    |84D036;
 
 
fInput_Unknown84D036:
    STZ.W $018B                                                ;84D036|9C8B01  |00018B;
    RTL                                                        ;84D039|6B      |      ;
 
 
fInput_Unknown84D03A:
    SEP #$20                                                   ;84D03A|E220    |      ;
    REP #$10                                                   ;84D03C|C210    |      ;
    LDA.B #$03                                                 ;84D03E|A903    |      ;
    STA.W nAudioRegisterValue0                                 ;84D040|8D1401  |000114;
    LDA.B #$06                                                 ;84D043|A906    |      ;
    STA.W nAudioRegisterValue1                                 ;84D045|8D1501  |000115;
    JSL.L fAudioSetRegister2to0A                               ;84D048|22328383|838332;
    REP #$30                                                   ;84D04C|C230    |      ;
    LDX.W #$0001                                               ;84D04E|A20100  |      ;
    LDA.W #$00B1                                               ;84D051|A9B100  |      ;
    JSL.L fDialog_TransferGlyph                                ;84D054|22239883|839823;
    SEP #$20                                                   ;84D058|E220    |      ;
    LDA.W $018F                                                ;84D05A|AD8F01  |00018F;
    BEQ .label1                                                ;84D05D|F00A    |84D069;
    CMP.B #$03                                                 ;84D05F|C903    |      ;
    BEQ .label2                                                ;84D061|F019    |84D07C;
    DEC A                                                      ;84D063|3A      |      ;
    STA.W $018F                                                ;84D064|8D8F01  |00018F;
    BRA fInput_Unknown84D036                                   ;84D067|80CD    |84D036;
 
 
.label1:
    LDA.W $018E                                                ;84D069|AD8E01  |00018E;
    CMP.B #$03                                                 ;84D06C|C903    |      ;
    BCC +                                                      ;84D06E|9007    |84D077;
    LDA.B #$02                                                 ;84D070|A902    |      ;
    STA.W $018F                                                ;84D072|8D8F01  |00018F;
    BRA .return                                                ;84D075|8013    |84D08A;
 
 
  + STA.W $018F                                                ;84D077|8D8F01  |00018F;
    BRA .return                                                ;84D07A|800E    |84D08A;
 
 
.label2:
    LDA.W $018E                                                ;84D07C|AD8E01  |00018E;
    CMP.B #$03                                                 ;84D07F|C903    |      ;
    BEQ .return                                                ;84D081|F007    |84D08A;
    LDA.W $018F                                                ;84D083|AD8F01  |00018F;
    INC A                                                      ;84D086|1A      |      ;
    STA.W $018F                                                ;84D087|8D8F01  |00018F;
 
.return:
    STZ.W $018B                                                ;84D08A|9C8B01  |00018B;
    RTL                                                        ;84D08D|6B      |      ;
 
 
fInput_Unknown84D08E:
    SEP #$20                                                   ;84D08E|E220    |      ;
    REP #$10                                                   ;84D090|C210    |      ;
    LDA.B #$03                                                 ;84D092|A903    |      ;
    STA.W nAudioRegisterValue0                                 ;84D094|8D1401  |000114;
    LDA.B #$06                                                 ;84D097|A906    |      ;
    STA.W nAudioRegisterValue1                                 ;84D099|8D1501  |000115;
    JSL.L fAudioSetRegister2to0A                               ;84D09C|22328383|838332;
    SEP #$20                                                   ;84D0A0|E220    |      ;
    LDA.W $018E                                                ;84D0A2|AD8E01  |00018E;
    CMP.B #$03                                                 ;84D0A5|C903    |      ;
    BCC .return                                                ;84D0A7|9047    |84D0F0;
    LDA.W $018F                                                ;84D0A9|AD8F01  |00018F;
    CMP.B #$02                                                 ;84D0AC|C902    |      ;
    BEQ .return                                                ;84D0AE|F040    |84D0F0;
    REP #$30                                                   ;84D0B0|C230    |      ;
    LDX.W #$0001                                               ;84D0B2|A20100  |      ;
    LDA.W #$00B1                                               ;84D0B5|A9B100  |      ;
    JSL.L fDialog_TransferGlyph                                ;84D0B8|22239883|839823;
    SEP #$20                                                   ;84D0BC|E220    |      ;
    LDA.W $018F                                                ;84D0BE|AD8F01  |00018F;
    CMP.B #$02                                                 ;84D0C1|C902    |      ;
    BCC +                                                      ;84D0C3|9008    |84D0CD;
    SEC                                                        ;84D0C5|38      |      ;
    SBC.B #$03                                                 ;84D0C6|E903    |      ;
    STA.W $018F                                                ;84D0C8|8D8F01  |00018F;
    BRA .return                                                ;84D0CB|8023    |84D0F0;
 
 
  + SEP #$20                                                   ;84D0CD|E220    |      ;
    LDA.W $018F                                                ;84D0CF|AD8F01  |00018F;
    CMP.B #$01                                                 ;84D0D2|C901    |      ;
    BEQ +                                                      ;84D0D4|F008    |84D0DE;
    CLC                                                        ;84D0D6|18      |      ;
    ADC.B #$03                                                 ;84D0D7|6903    |      ;
    STA.W $018F                                                ;84D0D9|8D8F01  |00018F;
    BRA .return                                                ;84D0DC|8012    |84D0F0;
 
 
  + SEP #$20                                                   ;84D0DE|E220    |      ;
    LDA.W $018E                                                ;84D0E0|AD8E01  |00018E;
    CMP.B #$03                                                 ;84D0E3|C903    |      ;
    BEQ .return                                                ;84D0E5|F009    |84D0F0;
    LDA.W $018F                                                ;84D0E7|AD8F01  |00018F;
    CLC                                                        ;84D0EA|18      |      ;
    ADC.B #$03                                                 ;84D0EB|6903    |      ;
    STA.W $018F                                                ;84D0ED|8D8F01  |00018F;
 
.return:
    STZ.W $018B                                                ;84D0F0|9C8B01  |00018B;
    RTL                                                        ;84D0F3|6B      |      ;
 
 
fInput_Unknown84D0F4:
    SEP #$20                                                   ;84D0F4|E220    |      ;
    REP #$10                                                   ;84D0F6|C210    |      ;
    LDA.B #$03                                                 ;84D0F8|A903    |      ;
    STA.W nAudioRegisterValue0                                 ;84D0FA|8D1401  |000114;
    LDA.B #$06                                                 ;84D0FD|A906    |      ;
    STA.W nAudioRegisterValue1                                 ;84D0FF|8D1501  |000115;
    JSL.L fAudioSetRegister2to0A                               ;84D102|22328383|838332;
    SEP #$20                                                   ;84D106|E220    |      ;
    LDA.W $018E                                                ;84D108|AD8E01  |00018E;
    CMP.B #$03                                                 ;84D10B|C903    |      ;
    BCC .return                                                ;84D10D|9047    |84D156;
    LDA.W $018F                                                ;84D10F|AD8F01  |00018F;
    CMP.B #$02                                                 ;84D112|C902    |      ;
    BEQ .return                                                ;84D114|F040    |84D156;
    REP #$30                                                   ;84D116|C230    |      ;
    LDX.W #$0001                                               ;84D118|A20100  |      ;
    LDA.W #$00B1                                               ;84D11B|A9B100  |      ;
    JSL.L fDialog_TransferGlyph                                ;84D11E|22239883|839823;
    SEP #$20                                                   ;84D122|E220    |      ;
    LDA.W $018F                                                ;84D124|AD8F01  |00018F;
    CMP.B #$02                                                 ;84D127|C902    |      ;
    BCC +                                                      ;84D129|9008    |84D133;
    SEC                                                        ;84D12B|38      |      ;
    SBC.B #$03                                                 ;84D12C|E903    |      ;
    STA.W $018F                                                ;84D12E|8D8F01  |00018F;
    BRA .return                                                ;84D131|8023    |84D156;
 
 
  + SEP #$20                                                   ;84D133|E220    |      ;
    LDA.W $018F                                                ;84D135|AD8F01  |00018F;
    CMP.B #$01                                                 ;84D138|C901    |      ;
    BEQ +                                                      ;84D13A|F008    |84D144;
    CLC                                                        ;84D13C|18      |      ;
    ADC.B #$03                                                 ;84D13D|6903    |      ;
    STA.W $018F                                                ;84D13F|8D8F01  |00018F;
    BRA .return                                                ;84D142|8012    |84D156;
 
 
  + SEP #$20                                                   ;84D144|E220    |      ;
    LDA.W $018E                                                ;84D146|AD8E01  |00018E;
    CMP.B #$03                                                 ;84D149|C903    |      ;
    BEQ .return                                                ;84D14B|F009    |84D156;
    LDA.W $018F                                                ;84D14D|AD8F01  |00018F;
    CLC                                                        ;84D150|18      |      ;
    ADC.B #$03                                                 ;84D151|6903    |      ;
    STA.W $018F                                                ;84D153|8D8F01  |00018F;
 
.return:
    STZ.W $018B                                                ;84D156|9C8B01  |00018B;
    RTL                                                        ;84D159|6B      |      ;
 
 
Padding_840000:
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D15A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D166|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D172|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D17E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D18A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D196|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D1A2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D1AE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D1BA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D1C6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D1D2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D1DE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D1EA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D1F6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D202|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D20E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D21A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D226|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D232|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D23E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D24A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D256|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D262|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D26E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D27A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D286|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D292|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D29E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D2AA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D2B6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D2C2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D2CE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D2DA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D2E6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D2F2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D2FE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D30A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D316|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D322|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D32E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D33A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D346|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D352|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D35E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D36A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D376|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D382|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D38E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D39A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D3A6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D3B2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D3BE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D3CA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D3D6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D3E2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D3EE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D3FA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D406|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D412|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D41E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D42A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D436|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D442|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D44E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D45A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D466|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D472|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D47E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D48A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D496|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D4A2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D4AE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D4BA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D4C6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D4D2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D4DE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D4EA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D4F6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D502|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D50E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D51A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D526|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D532|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D53E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D54A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D556|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D562|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D56E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D57A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D586|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D592|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D59E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D5AA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D5B6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D5C2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D5CE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D5DA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D5E6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D5F2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D5FE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D60A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D616|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D622|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D62E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D63A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D646|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D652|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D65E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D66A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D676|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D682|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D68E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D69A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D6A6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D6B2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D6BE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D6CA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D6D6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D6E2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D6EE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D6FA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D706|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D712|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D71E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D72A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D736|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D742|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D74E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D75A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D766|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D772|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D77E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D78A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D796|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D7A2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D7AE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D7BA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D7C6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D7D2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D7DE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D7EA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D7F6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D802|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D80E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D81A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D826|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D832|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D83E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D84A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D856|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D862|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D86E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D87A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D886|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D892|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D89E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D8AA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D8B6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D8C2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D8CE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D8DA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D8E6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D8F2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D8FE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D90A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D916|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D922|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D92E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D93A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D946|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D952|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D95E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D96A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D976|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D982|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D98E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D99A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D9A6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D9B2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D9BE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D9CA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D9D6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D9E2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D9EE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84D9FA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DA06|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DA12|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DA1E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DA2A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DA36|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DA42|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DA4E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DA5A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DA66|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DA72|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DA7E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DA8A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DA96|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DAA2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DAAE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DABA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DAC6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DAD2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DADE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DAEA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DAF6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DB02|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DB0E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DB1A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DB26|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DB32|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DB3E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DB4A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DB56|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DB62|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DB6E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DB7A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DB86|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DB92|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DB9E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DBAA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DBB6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DBC2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DBCE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DBDA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DBE6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DBF2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DBFE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DC0A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DC16|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DC22|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DC2E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DC3A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DC46|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DC52|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DC5E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DC6A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DC76|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DC82|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DC8E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DC9A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DCA6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DCB2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DCBE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DCCA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DCD6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DCE2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DCEE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DCFA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DD06|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DD12|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DD1E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DD2A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DD36|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DD42|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DD4E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DD5A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DD66|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DD72|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DD7E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DD8A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DD96|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DDA2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DDAE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DDBA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DDC6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DDD2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DDDE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DDEA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DDF6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DE02|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DE0E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DE1A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DE26|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DE32|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DE3E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DE4A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DE56|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DE62|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DE6E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DE7A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DE86|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DE92|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DE9E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DEAA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DEB6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DEC2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DECE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DEDA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DEE6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DEF2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DEFE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DF0A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DF16|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DF22|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DF2E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DF3A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DF46|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DF52|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DF5E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DF6A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DF76|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DF82|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DF8E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DF9A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DFA6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DFB2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DFBE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DFCA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DFD6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DFE2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DFEE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84DFFA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E006|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E012|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E01E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E02A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E036|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E042|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E04E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E05A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E066|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E072|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E07E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E08A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E096|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E0A2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E0AE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E0BA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E0C6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E0D2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E0DE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E0EA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E0F6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E102|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E10E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E11A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E126|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E132|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E13E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E14A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E156|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E162|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E16E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E17A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E186|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E192|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E19E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E1AA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E1B6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E1C2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E1CE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E1DA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E1E6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E1F2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E1FE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E20A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E216|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E222|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E22E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E23A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E246|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E252|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E25E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E26A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E276|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E282|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E28E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E29A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E2A6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E2B2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E2BE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E2CA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E2D6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E2E2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E2EE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E2FA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E306|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E312|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E31E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E32A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E336|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E342|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E34E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E35A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E366|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E372|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E37E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E38A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E396|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E3A2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E3AE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E3BA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E3C6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E3D2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E3DE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E3EA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E3F6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E402|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E40E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E41A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E426|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E432|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E43E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E44A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E456|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E462|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E46E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E47A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E486|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E492|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E49E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E4AA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E4B6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E4C2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E4CE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E4DA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E4E6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E4F2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E4FE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E50A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E516|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E522|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E52E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E53A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E546|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E552|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E55E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E56A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E576|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E582|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E58E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E59A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E5A6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E5B2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E5BE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E5CA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E5D6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E5E2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E5EE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E5FA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E606|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E612|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E61E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E62A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E636|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E642|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E64E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E65A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E666|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E672|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E67E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E68A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E696|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E6A2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E6AE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E6BA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E6C6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E6D2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E6DE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E6EA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E6F6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E702|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E70E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E71A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E726|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E732|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E73E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E74A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E756|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E762|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E76E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E77A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E786|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E792|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E79E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E7AA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E7B6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E7C2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E7CE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E7DA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E7E6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E7F2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E7FE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E80A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E816|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E822|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E82E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E83A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E846|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E852|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E85E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E86A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E876|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E882|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E88E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E89A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E8A6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E8B2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E8BE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E8CA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E8D6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E8E2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E8EE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E8FA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E906|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E912|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E91E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E92A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E936|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E942|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E94E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E95A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E966|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E972|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E97E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E98A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E996|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E9A2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E9AE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E9BA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E9C6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E9D2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E9DE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E9EA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84E9F6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EA02|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EA0E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EA1A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EA26|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EA32|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EA3E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EA4A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EA56|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EA62|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EA6E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EA7A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EA86|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EA92|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EA9E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EAAA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EAB6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EAC2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EACE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EADA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EAE6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EAF2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EAFE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EB0A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EB16|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EB22|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EB2E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EB3A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EB46|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EB52|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EB5E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EB6A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EB76|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EB82|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EB8E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EB9A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EBA6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EBB2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EBBE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EBCA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EBD6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EBE2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EBEE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EBFA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EC06|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EC12|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EC1E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EC2A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EC36|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EC42|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EC4E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EC5A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EC66|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EC72|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EC7E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EC8A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EC96|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84ECA2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84ECAE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84ECBA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84ECC6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84ECD2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84ECDE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84ECEA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84ECF6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84ED02|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84ED0E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84ED1A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84ED26|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84ED32|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84ED3E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84ED4A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84ED56|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84ED62|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84ED6E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84ED7A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84ED86|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84ED92|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84ED9E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EDAA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EDB6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EDC2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EDCE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EDDA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EDE6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EDF2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EDFE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EE0A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EE16|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EE22|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EE2E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EE3A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EE46|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EE52|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EE5E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EE6A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EE76|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EE82|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EE8E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EE9A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EEA6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EEB2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EEBE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EECA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EED6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EEE2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EEEE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EEFA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EF06|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EF12|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EF1E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EF2A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EF36|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EF42|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EF4E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EF5A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EF66|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EF72|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EF7E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EF8A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EF96|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EFA2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EFAE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EFBA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EFC6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EFD2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EFDE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EFEA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84EFF6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F002|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F00E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F01A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F026|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F032|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F03E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F04A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F056|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F062|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F06E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F07A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F086|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F092|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F09E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F0AA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F0B6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F0C2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F0CE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F0DA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F0E6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F0F2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F0FE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F10A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F116|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F122|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F12E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F13A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F146|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F152|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F15E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F16A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F176|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F182|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F18E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F19A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F1A6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F1B2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F1BE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F1CA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F1D6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F1E2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F1EE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F1FA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F206|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F212|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F21E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F22A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F236|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F242|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F24E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F25A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F266|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F272|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F27E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F28A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F296|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F2A2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F2AE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F2BA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F2C6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F2D2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F2DE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F2EA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F2F6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F302|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F30E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F31A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F326|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F332|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F33E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F34A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F356|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F362|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F36E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F37A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F386|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F392|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F39E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F3AA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F3B6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F3C2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F3CE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F3DA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F3E6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F3F2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F3FE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F40A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F416|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F422|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F42E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F43A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F446|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F452|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F45E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F46A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F476|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F482|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F48E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F49A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F4A6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F4B2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F4BE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F4CA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F4D6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F4E2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F4EE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F4FA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F506|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F512|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F51E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F52A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F536|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F542|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F54E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F55A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F566|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F572|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F57E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F58A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F596|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F5A2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F5AE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F5BA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F5C6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F5D2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F5DE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F5EA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F5F6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F602|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F60E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F61A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F626|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F632|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F63E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F64A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F656|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F662|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F66E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F67A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F686|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F692|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F69E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F6AA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F6B6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F6C2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F6CE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F6DA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F6E6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F6F2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F6FE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F70A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F716|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F722|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F72E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F73A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F746|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F752|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F75E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F76A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F776|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F782|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F78E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F79A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F7A6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F7B2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F7BE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F7CA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F7D6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F7E2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F7EE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F7FA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F806|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F812|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F81E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F82A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F836|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F842|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F84E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F85A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F866|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F872|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F87E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F88A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F896|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F8A2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F8AE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F8BA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F8C6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F8D2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F8DE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F8EA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F8F6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F902|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F90E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F91A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F926|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F932|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F93E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F94A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F956|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F962|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F96E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F97A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F986|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F992|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F99E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F9AA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F9B6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F9C2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F9CE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F9DA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F9E6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F9F2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84F9FE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FA0A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FA16|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FA22|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FA2E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FA3A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FA46|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FA52|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FA5E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FA6A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FA76|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FA82|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FA8E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FA9A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FAA6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FAB2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FABE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FACA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FAD6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FAE2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FAEE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FAFA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FB06|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FB12|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FB1E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FB2A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FB36|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FB42|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FB4E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FB5A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FB66|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FB72|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FB7E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FB8A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FB96|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FBA2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FBAE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FBBA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FBC6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FBD2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FBDE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FBEA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FBF6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FC02|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FC0E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FC1A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FC26|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FC32|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FC3E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FC4A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FC56|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FC62|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FC6E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FC7A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FC86|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FC92|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FC9E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FCAA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FCB6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FCC2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FCCE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FCDA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FCE6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FCF2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FCFE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FD0A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FD16|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FD22|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FD2E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FD3A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FD46|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FD52|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FD5E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FD6A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FD76|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FD82|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FD8E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FD9A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FDA6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FDB2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FDBE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FDCA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FDD6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FDE2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FDEE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FDFA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FE06|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FE12|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FE1E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FE2A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FE36|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FE42|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FE4E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FE5A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FE66|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FE72|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FE7E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FE8A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FE96|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FEA2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FEAE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FEBA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FEC6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FED2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FEDE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FEEA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FEF6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FF02|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FF0E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FF1A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FF26|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FF32|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FF3E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FF4A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FF56|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FF62|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FF6E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FF7A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FF86|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FF92|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FF9E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FFAA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FFB6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FFC2|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FFCE|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FFDA|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FFE6|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;84FFF2|        |      ;
    db $00,$00                                                 ;84FFFE|        |      ;
