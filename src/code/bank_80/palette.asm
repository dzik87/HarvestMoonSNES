; Bank $80 module "palette" - starts at $808FC7
 
 
fPalette_SetNextHourPalette:
    SEP #$20                                                   ;808FC7|E220    |      ;
    REP #$10                                                   ;808FC9|C210    |      ;
    STA.W strcPalette.nextHourIdx                              ;808FCB|8D7C01  |00017C;
    STZ.W strcPalette.countDown                                ;808FCE|9C7A01  |00017A;
    XBA                                                        ;808FD1|EB      |      ;
    LDA.B #$00                                                 ;808FD2|A900    |      ;
    XBA                                                        ;808FD4|EB      |      ;
    REP #$20                                                   ;808FD5|C220    |      ;
    STA.B strcVariables.n16Temp1                               ;808FD7|857E    |00007E;
    SEP #$20                                                   ;808FD9|E220    |      ;
    LDA.L nCurrentTimeID                                       ;808FDB|AF1C1F7F|7F1F1C;
    CMP.B #$12                                                 ;808FDF|C912    |      ;
    BCC .use_indexed_palette                                                ;808FE1|900F    |808FF2;
    REP #$20                                                   ;808FE3|C220    |      ;
    LDA.W #$0B00                                               ;808FE5|A9000B  |      ;
    STA.B ptrPaletteNext                                       ;808FE8|8504    |000004;
    SEP #$20                                                   ;808FEA|E220    |      ;
    LDA.B #$7F                                                 ;808FEC|A97F    |      ;
    STA.B ptrPaletteNext+2                                     ;808FEE|8506    |000006;
    BRA .return                                                ;808FF0|8019    |80900B;
 
 
.use_indexed_palette:
    REP #$20                                                   ;808FF2|C220    |      ;
    LDA.B strcVariables.n16Temp1                               ;808FF4|A57E    |00007E;
    ASL A                                                      ;808FF6|0A      |      ;
    CLC                                                        ;808FF7|18      |      ;
    ADC.B strcVariables.n16Temp1                               ;808FF8|657E    |00007E;
    TAX                                                        ;808FFA|AA      |      ;
    LDA.L aPalettes,X                                          ;808FFB|BFFDB980|80B9FD;
    STA.B ptrPaletteNext                                       ;808FFF|8504    |000004;
    INX                                                        ;809001|E8      |      ;
    INX                                                        ;809002|E8      |      ;
    SEP #$20                                                   ;809003|E220    |      ;
    LDA.L aPalettes,X                                          ;809005|BFFDB980|80B9FD;
    STA.B ptrPaletteNext+2                                     ;809009|8506    |000006;
 
.return:
    RTL                                                        ;80900B|6B      |      ;
 
 
fPallete_ChangeHandler:
    SEP #$20                                                   ;80900C|E220    |      ;
    REP #$10                                                   ;80900E|C210    |      ;
    LDA.W nTimeState                                           ;809010|AD7309  |000973;
    AND.B #$01                                                 ;809013|2901    |      ;
    BNE +                                                      ;809015|D003    |80901A;
    JMP.W .return                                              ;809017|4C5691  |809156;
 
 
  + REP #$20                                                   ;80901A|C220    |      ;
    LDA.B ptrPaletteNext                                       ;80901C|A504    |000004;
    BNE +                                                      ;80901E|D009    |809029;
    SEP #$20                                                   ;809020|E220    |      ;
    LDA.B ptrPaletteNext+2                                     ;809022|A506    |000006;
    BNE +                                                      ;809024|D003    |809029;
    JMP.W .return                                              ;809026|4C5691  |809156;
 
 
  + SEP #$20                                                   ;809029|E220    |      ;
    LDA.W strcPalette.countDown                                ;80902B|AD7A01  |00017A;
    INC A                                                      ;80902E|1A      |      ;
    STA.W strcPalette.countDown                                ;80902F|8D7A01  |00017A;
    CMP.B #$20                                                 ;809032|C920    |      ;
    BEQ +                                                      ;809034|F003    |809039;
    JMP.W .return                                              ;809036|4C5691  |809156;
 
 
  + STZ.W strcPalette.countDown                                ;809039|9C7A01  |00017A;
    REP #$20                                                   ;80903C|C220    |      ;
    LDA.W #$0100                                               ;80903E|A90001  |      ;
    STA.B strcVariables.n16Temp4                               ;809041|8584    |000084;
    SEP #$20                                                   ;809043|E220    |      ;
    LDA.L nCurrentTimeID                                       ;809045|AF1C1F7F|7F1F1C;
    CMP.B #$12                                                 ;809049|C912    |      ;
    BCC +                                                      ;80904B|9007    |809054;
    REP #$20                                                   ;80904D|C220    |      ;
    LDA.W #$0200                                               ;80904F|A90002  |      ;
    STA.B strcVariables.n16Temp4                               ;809052|8584    |000084;
 
  + SEP #$20                                                   ;809054|E220    |      ; Is 6PM
    STZ.B strcVariables.n8Temp1                                ;809056|6492    |000092;
    LDY.W #$0000                                               ;809058|A00000  |      ;
 
.loop:
    SEP #$20                                                   ;80905B|E220    |      ;
    REP #$10                                                   ;80905D|C210    |      ;
    CPY.W #$0002                                               ;80905F|C00200  |      ;
    BNE +                                                      ;809062|D010    |809074;
    LDY.W #$0018                                               ;809064|A01800  |      ;
    REP #$20                                                   ;809067|C220    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;809069|AD9601  |000196;
    AND.W #$0004                                               ;80906C|290400  |      ;
    BNE +                                                      ;80906F|D003    |809074;
    LDY.W #$0020                                               ;809071|A02000  |      ;
 
  + TYX                                                        ;809074|BB      |      ;
    REP #$20                                                   ;809075|C220    |      ;
    LDA.L sPalette_7F0D00,X                                    ;809077|BF000D7F|7F0D00;
    AND.W #$001F                                               ;80907B|291F00  |      ;
    STA.B strcVariables.n16Temp1                               ;80907E|857E    |00007E;
    LDA.B [ptrPaletteNext],Y                                   ;809080|B704    |000004;
    AND.W #$001F                                               ;809082|291F00  |      ;
    CMP.B strcVariables.n16Temp1                               ;809085|C57E    |00007E;
    BEQ .adjust_green                                                ;809087|F00E    |809097;
    BCS .inc7E                                                 ;809089|B004    |80908F;
    DEC.B strcVariables.n16Temp1                               ;80908B|C67E    |00007E;
    BRA .store01to92                                           ;80908D|8002    |809091;
 
 
.inc7E:
    INC.B strcVariables.n16Temp1                               ;80908F|E67E    |00007E;
 
.store01to92:
    SEP #$20                                                   ;809091|E220    |      ;
    LDA.B #$01                                                 ;809093|A901    |      ;
    STA.B strcVariables.n8Temp1                                ;809095|8592    |000092;
 
.adjust_green:
    REP #$20                                                   ;809097|C220    |      ;
    LDA.L sPalette_7F0D00,X                                    ;809099|BF000D7F|7F0D00;
    AND.W #$03E0                                               ;80909D|29E003  |      ;
    LSR A                                                      ;8090A0|4A      |      ;
    LSR A                                                      ;8090A1|4A      |      ;
    LSR A                                                      ;8090A2|4A      |      ;
    LSR A                                                      ;8090A3|4A      |      ;
    LSR A                                                      ;8090A4|4A      |      ;
    STA.B strcVariables.n16Temp2                               ;8090A5|8580    |000080;
    LDA.B [ptrPaletteNext],Y                                   ;8090A7|B704    |000004;
    AND.W #$03E0                                               ;8090A9|29E003  |      ;
    LSR A                                                      ;8090AC|4A      |      ;
    LSR A                                                      ;8090AD|4A      |      ;
    LSR A                                                      ;8090AE|4A      |      ;
    LSR A                                                      ;8090AF|4A      |      ;
    LSR A                                                      ;8090B0|4A      |      ;
    CMP.B strcVariables.n16Temp2                               ;8090B1|C580    |000080;
    BEQ .adjust_blue                                                ;8090B3|F00E    |8090C3;
    BCS .inc80                                                 ;8090B5|B004    |8090BB;
    DEC.B strcVariables.n16Temp2                               ;8090B7|C680    |000080;
    BRA .store011to92ex                                        ;8090B9|8002    |8090BD;
 
 
.inc80:
    INC.B strcVariables.n16Temp2                               ;8090BB|E680    |000080;
 
.store011to92ex:
    SEP #$20                                                   ;8090BD|E220    |      ;
    LDA.B #$01                                                 ;8090BF|A901    |      ;
    STA.B strcVariables.n8Temp1                                ;8090C1|8592    |000092;
 
.adjust_blue:
    REP #$20                                                   ;8090C3|C220    |      ;
    LDA.L sPalette_7F0D00,X                                    ;8090C5|BF000D7F|7F0D00;
    AND.W #$7C00                                               ;8090C9|29007C  |      ;
    LSR A                                                      ;8090CC|4A      |      ;
    LSR A                                                      ;8090CD|4A      |      ;
    LSR A                                                      ;8090CE|4A      |      ;
    LSR A                                                      ;8090CF|4A      |      ;
    LSR A                                                      ;8090D0|4A      |      ;
    LSR A                                                      ;8090D1|4A      |      ;
    LSR A                                                      ;8090D2|4A      |      ;
    LSR A                                                      ;8090D3|4A      |      ;
    LSR A                                                      ;8090D4|4A      |      ;
    LSR A                                                      ;8090D5|4A      |      ;
    STA.B strcVariables.n16Temp3                               ;8090D6|8582    |000082;
    LDA.B [ptrPaletteNext],Y                                   ;8090D8|B704    |000004;
    AND.W #$7C00                                               ;8090DA|29007C  |      ;
    LSR A                                                      ;8090DD|4A      |      ;
    LSR A                                                      ;8090DE|4A      |      ;
    LSR A                                                      ;8090DF|4A      |      ;
    LSR A                                                      ;8090E0|4A      |      ;
    LSR A                                                      ;8090E1|4A      |      ;
    LSR A                                                      ;8090E2|4A      |      ;
    LSR A                                                      ;8090E3|4A      |      ;
    LSR A                                                      ;8090E4|4A      |      ;
    LSR A                                                      ;8090E5|4A      |      ;
    LSR A                                                      ;8090E6|4A      |      ;
    CMP.B strcVariables.n16Temp3                               ;8090E7|C582    |000082;
    BEQ .pack_color                                                ;8090E9|F00E    |8090F9;
    BCS .inc82                                                 ;8090EB|B004    |8090F1;
    DEC.B strcVariables.n16Temp3                               ;8090ED|C682    |000082;
    BRA .store01to92ex2                                        ;8090EF|8002    |8090F3;
 
 
.inc82:
    INC.B strcVariables.n16Temp3                               ;8090F1|E682    |000082;
 
.store01to92ex2:
    SEP #$20                                                   ;8090F3|E220    |      ;
    LDA.B #$01                                                 ;8090F5|A901    |      ;
    STA.B strcVariables.n8Temp1                                ;8090F7|8592    |000092;
 
.pack_color:
    REP #$20                                                   ;8090F9|C220    |      ;
    ASL.B strcVariables.n16Temp2                               ;8090FB|0680    |000080;
    ASL.B strcVariables.n16Temp2                               ;8090FD|0680    |000080;
    ASL.B strcVariables.n16Temp2                               ;8090FF|0680    |000080;
    ASL.B strcVariables.n16Temp2                               ;809101|0680    |000080;
    ASL.B strcVariables.n16Temp2                               ;809103|0680    |000080;
    ASL.B strcVariables.n16Temp3                               ;809105|0682    |000082;
    ASL.B strcVariables.n16Temp3                               ;809107|0682    |000082;
    ASL.B strcVariables.n16Temp3                               ;809109|0682    |000082;
    ASL.B strcVariables.n16Temp3                               ;80910B|0682    |000082;
    ASL.B strcVariables.n16Temp3                               ;80910D|0682    |000082;
    ASL.B strcVariables.n16Temp3                               ;80910F|0682    |000082;
    ASL.B strcVariables.n16Temp3                               ;809111|0682    |000082;
    ASL.B strcVariables.n16Temp3                               ;809113|0682    |000082;
    ASL.B strcVariables.n16Temp3                               ;809115|0682    |000082;
    ASL.B strcVariables.n16Temp3                               ;809117|0682    |000082;
    LDA.B strcVariables.n16Temp1                               ;809119|A57E    |00007E;
    ORA.B strcVariables.n16Temp2                               ;80911B|0580    |000080;
    ORA.B strcVariables.n16Temp3                               ;80911D|0582    |000082;
    STA.L sPalette_7F0900,X                                    ;80911F|9F00097F|7F0900;
    STA.L sPalette_7F0D00,X                                    ;809123|9F000D7F|7F0D00;
    INY                                                        ;809127|C8      |      ;
    INY                                                        ;809128|C8      |      ;
    CPY.B strcVariables.n16Temp4                               ;809129|C484    |000084;
    BEQ .exit                                                  ;80912B|F003    |809130;
    JMP.W .loop                                                ;80912D|4C5B90  |80905B;
 
 
.exit:
    SEP #$20                                                   ;809130|E220    |      ;
    LDA.B strcVariables.n8Temp1                                ;809132|A592    |000092;
    BEQ .fade_finished                                                ;809134|F021    |809157;
    SEP #$20                                                   ;809136|E220    |      ;
    LDA.B #$06                                                 ;809138|A906    |      ;
    STA.B strcSystem.arrayIndex                                ;80913A|8527    |000027;
    LDA.B #$22                                                 ;80913C|A922    |      ;
    STA.B strcSystem.destinationRegister                       ;80913E|8529    |000029;
    REP #$20                                                   ;809140|C220    |      ;
    LDY.B strcVariables.n16Temp4                               ;809142|A484    |000084;
    LDX.W #$0000                                               ;809144|A20000  |      ;
    LDA.W #$0900                                               ;809147|A90009  |      ;
    STA.B ptrTemp0x72                                          ;80914A|8572    |000072;
    SEP #$20                                                   ;80914C|E220    |      ;
    LDA.B #$7F                                                 ;80914E|A97F    |      ;
    STA.B ptrTemp0x72+2                                        ;809150|8574    |000074;
    JSL.L fCore_PrepareTransfer                                ;809152|22338A80|808A33;
 
.return:
    RTL                                                        ;809156|6B      |      ;
 
 
.fade_finished:
    REP #$20                                                   ;809157|C220    |      ;
    STZ.B ptrPaletteNext                                       ;809159|6404    |000004;
    SEP #$20                                                   ;80915B|E220    |      ;
    STZ.B ptrPaletteNext+2                                     ;80915D|6406    |000006;
    LDA.W strcPalette.nextHourIdx                              ;80915F|AD7C01  |00017C;
    STA.W strcPalette.nextIdx                                  ;809162|8D7B01  |00017B;
    RTL                                                        ;809165|6B      |      ;
 
 
fPalette_ZeroNextPalletePtr:
    REP #$30                                                   ;809166|C230    |      ;
    STZ.B ptrPaletteNext                                       ;809168|6404    |000004;
    SEP #$20                                                   ;80916A|E220    |      ;
    STZ.B ptrPaletteNext+2                                     ;80916C|6406    |000006;
    RTL                                                        ;80916E|6B      |      ;
 
 
fPalette_WriteColorToBuffer:
    REP #$30                                                   ;80916F|C230    |      ; A: nValue, X: nColorIndex, Y: nOffsetindex (32Y+2X)
    STA.B strcVariables.n16Temp3                               ;809171|8582    |000082;
    STY.B strcVariables.n16Temp1                               ;809173|847E    |00007E;
    TXA                                                        ;809175|8A      |      ;
    ASL A                                                      ;809176|0A      |      ;
    STA.B strcVariables.n16Temp2                               ;809177|8580    |000080;
    LDA.B strcVariables.n16Temp1                               ;809179|A57E    |00007E;
    ASL A                                                      ;80917B|0A      |      ;
    ASL A                                                      ;80917C|0A      |      ;
    ASL A                                                      ;80917D|0A      |      ;
    ASL A                                                      ;80917E|0A      |      ;
    ASL A                                                      ;80917F|0A      |      ;
    CLC                                                        ;809180|18      |      ;
    ADC.B strcVariables.n16Temp2                               ;809181|6580    |000080;
    TAX                                                        ;809183|AA      |      ;
    SEP #$20                                                   ;809184|E220    |      ;
    LDA.B strcVariables.n8Temp1                                ;809186|A592    |000092;
    BNE .write_second_buffer                                                ;809188|D00A    |809194;
    REP #$20                                                   ;80918A|C220    |      ;
    LDA.B strcVariables.n16Temp3                               ;80918C|A582    |000082;
    STA.L sPalette_7F0900,X                                    ;80918E|9F00097F|7F0900;
    BRA .return                                                ;809192|8008    |80919C;
 
 
.write_second_buffer:
    REP #$20                                                   ;809194|C220    |      ;
    LDA.B strcVariables.n16Temp3                               ;809196|A582    |000082;
    STA.L sPalette_7F0B00,X                                    ;809198|9F000B7F|7F0B00;
 
.return:
    RTL                                                        ;80919C|6B      |      ;
 
 
fPalette_ModifyPalette:
    REP #$30                                                   ;80919D|C230    |      ; A: nValue, X: nColorIndex, Y: nOffsetIndex (32Y+2X)
    STA.B strcVariables.n16Temp3                               ;80919F|8582    |000082;
    STY.B strcVariables.n16Temp1                               ;8091A1|847E    |00007E;
    TXA                                                        ;8091A3|8A      |      ;
    ASL A                                                      ;8091A4|0A      |      ;
    STA.B strcVariables.n16Temp2                               ;8091A5|8580    |000080;
    LDA.B strcVariables.n16Temp1                               ;8091A7|A57E    |00007E;
    ASL A                                                      ;8091A9|0A      |      ;
    ASL A                                                      ;8091AA|0A      |      ;
    ASL A                                                      ;8091AB|0A      |      ;
    ASL A                                                      ;8091AC|0A      |      ;
    ASL A                                                      ;8091AD|0A      |      ;
    CLC                                                        ;8091AE|18      |      ;
    ADC.B strcVariables.n16Temp2                               ;8091AF|6580    |000080;
    TAX                                                        ;8091B1|AA      |      ;
    SEP #$20                                                   ;8091B2|E220    |      ;
    LDA.B strcVariables.n8Temp1                                ;8091B4|A592    |000092;
    BNE .write_second_buffer                                                ;8091B6|D00E    |8091C6;
    REP #$20                                                   ;8091B8|C220    |      ;
    LDA.B strcVariables.n16Temp3                               ;8091BA|A582    |000082;
    STA.L sPalette_7F0900,X                                    ;8091BC|9F00097F|7F0900;
    STA.L sPalette_7F0D00,X                                    ;8091C0|9F000D7F|7F0D00;
    BRA .return                                                ;8091C4|8008    |8091CE;
 
 
.write_second_buffer:
    REP #$20                                                   ;8091C6|C220    |      ;
    LDA.B strcVariables.n16Temp3                               ;8091C8|A582    |000082;
    STA.L sPalette_7F0B00,X                                    ;8091CA|9F000B7F|7F0B00;
 
.return:
    RTL                                                        ;8091CE|6B      |      ;
 
 
fPalette_LoadFirstHalf:
    REP #$30                                                   ;8091CF|C230    |      ; A: nIndex
    STA.B strcVariables.n16Temp1                               ;8091D1|857E    |00007E;
    ASL A                                                      ;8091D3|0A      |      ;
    CLC                                                        ;8091D4|18      |      ;
    ADC.B strcVariables.n16Temp1                               ;8091D5|657E    |00007E;
    TAX                                                        ;8091D7|AA      |      ;
    LDA.L aPalettes,X                                          ;8091D8|BFFDB980|80B9FD; X = nIndex * 3
    STA.B ptrTemp0x72                                          ;8091DC|8572    |000072;
    INX                                                        ;8091DE|E8      |      ;
    INX                                                        ;8091DF|E8      |      ;
    SEP #$20                                                   ;8091E0|E220    |      ;
    LDA.L aPalettes,X                                          ;8091E2|BFFDB980|80B9FD; X = X + 2
    STA.B ptrTemp0x72+2                                        ;8091E6|8574    |000074;
    REP #$20                                                   ;8091E8|C220    |      ;
    LDA.W #$0100                                               ;8091EA|A90001  |      ;
    STA.B strcVariables.n16Temp1                               ;8091ED|857E    |00007E; $7E = 0x100
    LDX.W #$0000                                               ;8091EF|A20000  |      ;
    LDY.W #$0000                                               ;8091F2|A00000  |      ;
 
  - LDA.B [ptrTemp0x72],Y                                      ;8091F5|B772    |000072; Y = 0x0000 - 0x009F
    STA.L sPalette_7F0900,X                                    ;8091F7|9F00097F|7F0900; X = 0x0000 - 0x009F
    STA.L sPalette_7F0D00,X                                    ;8091FB|9F000D7F|7F0D00; Y = 0x0000 - 0x009F
    INY                                                        ;8091FF|C8      |      ;
    INY                                                        ;809200|C8      |      ;
    INX                                                        ;809201|E8      |      ;
    INX                                                        ;809202|E8      |      ;
    CPY.B strcVariables.n16Temp1                               ;809203|C47E    |00007E;
    BNE -                                                      ;809205|D0EE    |8091F5;
    RTL                                                        ;809207|6B      |      ;
 
 
fPalette_LoadSecondHalf:
    REP #$30                                                   ;809208|C230    |      ; A: nIndex
    STA.B strcVariables.n16Temp1                               ;80920A|857E    |00007E;
    ASL A                                                      ;80920C|0A      |      ;
    CLC                                                        ;80920D|18      |      ;
    ADC.B strcVariables.n16Temp1                               ;80920E|657E    |00007E;
    TAX                                                        ;809210|AA      |      ;
    LDA.L aPalettes,X                                          ;809211|BFFDB980|80B9FD; X = nIndex * 3
    STA.B ptrTemp0x72                                          ;809215|8572    |000072;
    INX                                                        ;809217|E8      |      ;
    INX                                                        ;809218|E8      |      ;
    SEP #$20                                                   ;809219|E220    |      ;
    LDA.L aPalettes,X                                          ;80921B|BFFDB980|80B9FD; X = X + 2
    STA.B ptrTemp0x72+2                                        ;80921F|8574    |000074;
    REP #$20                                                   ;809221|C220    |      ;
    LDA.W #$0100                                               ;809223|A90001  |      ;
    STA.B strcVariables.n16Temp1                               ;809226|857E    |00007E; $7E = 0x100
    LDX.W #$0100                                               ;809228|A20001  |      ;
    LDY.W #$0000                                               ;80922B|A00000  |      ;
 
  - LDA.B [ptrTemp0x72],Y                                      ;80922E|B772    |000072; Y = 0x0000 - 0x009F
    STA.L sPalette_7F0900,X                                    ;809230|9F00097F|7F0900; X = 0x0100 - 0x019F
    STA.L sPalette_7F0D00,X                                    ;809234|9F000D7F|7F0D00; X = 0x0100 - 0x019F
    INY                                                        ;809238|C8      |      ;
    INY                                                        ;809239|C8      |      ;
    INX                                                        ;80923A|E8      |      ;
    INX                                                        ;80923B|E8      |      ;
    CPY.B strcVariables.n16Temp1                               ;80923C|C47E    |00007E;
    BNE -                                                      ;80923E|D0EE    |80922E;
    RTL                                                        ;809240|6B      |      ;
 
 
fPalette_LoadMapPallete:
    SEP #$20                                                   ;809241|E220    |      ;
    REP #$10                                                   ;809243|C210    |      ;
    LDA.B #$00                                                 ;809245|A900    |      ;
    XBA                                                        ;809247|EB      |      ; A <-> B
    LDA.B strcMap.loadAreaId                                   ;809248|A522    |000022;
    REP #$20                                                   ;80924A|C220    |      ;
    STA.B strcVariables.n16Temp2                               ;80924C|8580    |000080; $80 = nSelectedTilemapId
    ASL A                                                      ;80924E|0A      |      ;
    ASL A                                                      ;80924F|0A      |      ;
    CLC                                                        ;809250|18      |      ;
    ADC.B strcVariables.n16Temp2                               ;809251|6580    |000080;
    ADC.B strcVariables.n16Temp2                               ;809253|6580    |000080;
    ADC.W #$0004                                               ;809255|690400  |      ;
    TAX                                                        ;809258|AA      |      ;
    SEP #$20                                                   ;809259|E220    |      ;
    LDA.B #$00                                                 ;80925B|A900    |      ;
    XBA                                                        ;80925D|EB      |      ; A <-> B
    LDA.L aMapPalettesIndexes,X                                ;80925E|BF5CBB80|80BB5C; X = nSelectedTilemapId * 6 + 4
    REP #$20                                                   ;809262|C220    |      ;
    STA.B strcVariables.n16Temp1                               ;809264|857E    |00007E;
    ASL A                                                      ;809266|0A      |      ;
    CLC                                                        ;809267|18      |      ;
    ADC.B strcVariables.n16Temp1                               ;809268|657E    |00007E;
    TAX                                                        ;80926A|AA      |      ;
    LDA.L aPalettes,X                                          ;80926B|BFFDB980|80B9FD; X = nPalettedIndex * 3
    STA.B ptrTemp0x72                                          ;80926F|8572    |000072;
    INX                                                        ;809271|E8      |      ;
    INX                                                        ;809272|E8      |      ;
    SEP #$20                                                   ;809273|E220    |      ;
    LDA.L aPalettes,X                                          ;809275|BFFDB980|80B9FD; X = X + 2
    STA.B ptrTemp0x72+2                                        ;809279|8574    |000074;
    REP #$20                                                   ;80927B|C220    |      ;
    LDA.W #$0100                                               ;80927D|A90001  |      ;
    STA.B strcVariables.n16Temp1                               ;809280|857E    |00007E;
    LDX.W #$0000                                               ;809282|A20000  |      ;
    LDY.W #$0000                                               ;809285|A00000  |      ;
 
  - LDA.B [ptrTemp0x72],Y                                      ;809288|B772    |000072;
    STA.L sPalette_7F0B00,X                                    ;80928A|9F000B7F|7F0B00;
    INY                                                        ;80928E|C8      |      ;
    INY                                                        ;80928F|C8      |      ;
    INX                                                        ;809290|E8      |      ;
    INX                                                        ;809291|E8      |      ;
    CPY.B strcVariables.n16Temp1                               ;809292|C47E    |00007E;
    BNE -                                                      ;809294|D0F2    |809288;
    SEP #$20                                                   ;809296|E220    |      ;
    LDA.B #$00                                                 ;809298|A900    |      ;
    XBA                                                        ;80929A|EB      |      ;
    LDA.B strcMap.loadAreaId                                   ;80929B|A522    |000022;
    ASL A                                                      ;80929D|0A      |      ;
    TAX                                                        ;80929E|AA      |      ;
    INX                                                        ;80929F|E8      |      ;
    LDA.W aMapPalettesId,X                                     ;8092A0|BD44BE  |80BE44;
    REP #$20                                                   ;8092A3|C220    |      ;
    STA.B strcVariables.n16Temp1                               ;8092A5|857E    |00007E;
    ASL A                                                      ;8092A7|0A      |      ;
    CLC                                                        ;8092A8|18      |      ;
    ADC.B strcVariables.n16Temp1                               ;8092A9|657E    |00007E;
    TAX                                                        ;8092AB|AA      |      ;
    LDA.L aPalettes,X                                          ;8092AC|BFFDB980|80B9FD;
    STA.B ptrTemp0x72                                          ;8092B0|8572    |000072;
    INX                                                        ;8092B2|E8      |      ;
    INX                                                        ;8092B3|E8      |      ;
    SEP #$20                                                   ;8092B4|E220    |      ;
    LDA.L aPalettes,X                                          ;8092B6|BFFDB980|80B9FD;
    STA.B ptrTemp0x72+2                                        ;8092BA|8574    |000074;
    REP #$20                                                   ;8092BC|C220    |      ;
    LDA.W #$0100                                               ;8092BE|A90001  |      ;
    STA.B strcVariables.n16Temp1                               ;8092C1|857E    |00007E;
    LDX.W #$0100                                               ;8092C3|A20001  |      ;
    LDY.W #$0000                                               ;8092C6|A00000  |      ;
 
  - LDA.B [ptrTemp0x72],Y                                      ;8092C9|B772    |000072;
    STA.L sPalette_7F0B00,X                                    ;8092CB|9F000B7F|7F0B00;
    INY                                                        ;8092CF|C8      |      ;
    INY                                                        ;8092D0|C8      |      ;
    INX                                                        ;8092D1|E8      |      ;
    INX                                                        ;8092D2|E8      |      ;
    CPY.B strcVariables.n16Temp1                               ;8092D3|C47E    |00007E;
    BNE -                                                      ;8092D5|D0F2    |8092C9;
    SEP #$20                                                   ;8092D7|E220    |      ;
    LDA.B #$01                                                 ;8092D9|A901    |      ;
    STA.B strcVariables.n8Temp1                                ;8092DB|8592    |000092;
    JSL.L fPalette_LoadSpritePallete                           ;8092DD|22A49380|8093A4;
    RTL                                                        ;8092E1|6B      |      ;
 
 
fPalette_ChangeTimePallete:
    SEP #$20                                                   ;8092E2|E220    |      ;
    REP #$10                                                   ;8092E4|C210    |      ;
    LDX.W #$0000                                               ;8092E6|A20000  |      ; X = 0
    LDA.L nCurrentTimeID                                       ;8092E9|AF1C1F7F|7F1F1C;
    CMP.B #$07                                                 ;8092ED|C907    |      ;
    BCC +                                                      ;8092EF|9010    |809301;
    INX                                                        ;8092F1|E8      |      ; X = 1
    CMP.B #$0F                                                 ;8092F2|C90F    |      ;
    BCC +                                                      ;8092F4|900B    |809301;
    INX                                                        ;8092F6|E8      |      ; X = 2
    CMP.B #$11                                                 ;8092F7|C911    |      ;
    BCC +                                                      ;8092F9|9006    |809301;
    INX                                                        ;8092FB|E8      |      ; X = 3
    CMP.B #$12                                                 ;8092FC|C912    |      ;
    BCC +                                                      ;8092FE|9001    |809301;
    INX                                                        ;809300|E8      |      ; X = 4
 
  + STX.B strcVariables.n16Temp1                               ;809301|867E    |00007E; $7E = X
    LDA.B #$00                                                 ;809303|A900    |      ; A = 0
    XBA                                                        ;809305|EB      |      ; A <-> B
    LDA.B strcMap.loadAreaId                                   ;809306|A522    |000022;
    REP #$20                                                   ;809308|C220    |      ;
    STA.B strcVariables.n16Temp2                               ;80930A|8580    |000080;
    ASL A                                                      ;80930C|0A      |      ;
    ASL A                                                      ;80930D|0A      |      ;
    CLC                                                        ;80930E|18      |      ;
    ADC.B strcVariables.n16Temp2                               ;80930F|6580    |000080;
    ADC.B strcVariables.n16Temp2                               ;809311|6580    |000080;
    ADC.B strcVariables.n16Temp1                               ;809313|657E    |00007E;
    TAX                                                        ;809315|AA      |      ;
    SEP #$20                                                   ;809316|E220    |      ;
    LDA.B #$00                                                 ;809318|A900    |      ;
    XBA                                                        ;80931A|EB      |      ;
    LDA.L aMapPalettesIndexes,X                                ;80931B|BF5CBB80|80BB5C; X = nSelectedTilemapId * 6 + X
    STA.W strcPalette.nextIdx                                  ;80931F|8D7B01  |00017B;
    REP #$20                                                   ;809322|C220    |      ;
    JSL.L fPalette_LoadFirstHalf                               ;809324|22CF9180|8091CF;
    RTL                                                        ;809328|6B      |      ;
 
 
fPalette_PrepareSpritePalette:
    REP #$30                                                   ;809329|C230    |      ;
    %CheckFlag(daily3, $0080)
    BNE .notAnd0080                                            ;809332|D03A    |80936E;
    %CheckFlag(daily3, $0100)
    BNE .notAnd0100                                            ;80933B|D043    |809380;
    %CheckFlag(daily3, $0200)
    BNE .notAnd0200                                            ;809344|D04C    |809392;
    SEP #$20                                                   ;809346|E220    |      ;
    LDA.B #$00                                                 ;809348|A900    |      ;
    XBA                                                        ;80934A|EB      |      ;
    LDA.B strcMap.loadAreaId                                   ;80934B|A522    |000022;
    ASL A                                                      ;80934D|0A      |      ;
    TAX                                                        ;80934E|AA      |      ;
    LDA.L nCurrentTimeID                                       ;80934F|AF1C1F7F|7F1F1C;
    CMP.B #$12                                                 ;809353|C912    |      ;
    BCC .time6PM                                               ;809355|9001    |809358;
    INX                                                        ;809357|E8      |      ;
 
.time6PM:
    SEP #$20                                                   ;809358|E220    |      ;
    REP #$10                                                   ;80935A|C210    |      ;
    LDA.W aMapPalettesId,X                                     ;80935C|BD44BE  |80BE44;
    REP #$20                                                   ;80935F|C220    |      ;
    JSL.L fPalette_LoadSecondHalf                              ;809361|22089280|809208;
    SEP #$20                                                   ;809365|E220    |      ;
    STZ.B strcVariables.n8Temp1                                ;809367|6492    |000092;
    JSL.L fPalette_LoadSpritePallete                           ;809369|22A49380|8093A4;
    RTL                                                        ;80936D|6B      |      ;
 
 
.notAnd0080:
    REP #$30                                                   ;80936E|C230    |      ;
    LDA.W #$0071                                               ;809370|A97100  |      ;
    JSL.L fPalette_LoadSecondHalf                              ;809373|22089280|809208;
    SEP #$20                                                   ;809377|E220    |      ;
    STZ.B strcVariables.n8Temp1                                ;809379|6492    |000092;
    JSL.L fPalette_LoadSpritePallete                           ;80937B|22A49380|8093A4;
    RTL                                                        ;80937F|6B      |      ;
 
 
.notAnd0100:
    REP #$30                                                   ;809380|C230    |      ;
    LDA.W #$0072                                               ;809382|A97200  |      ;
    JSL.L fPalette_LoadSecondHalf                              ;809385|22089280|809208;
    SEP #$20                                                   ;809389|E220    |      ;
    STZ.B strcVariables.n8Temp1                                ;80938B|6492    |000092;
    JSL.L fPalette_LoadSpritePallete                           ;80938D|22A49380|8093A4;
    RTL                                                        ;809391|6B      |      ;
 
 
.notAnd0200:
    REP #$30                                                   ;809392|C230    |      ;
    LDA.W #$0073                                               ;809394|A97300  |      ;
    JSL.L fPalette_LoadSecondHalf                              ;809397|22089280|809208;
    SEP #$20                                                   ;80939B|E220    |      ;
    STZ.B strcVariables.n8Temp1                                ;80939D|6492    |000092;
    JSL.L fPalette_LoadSpritePallete                           ;80939F|22A49380|8093A4;
    RTL                                                        ;8093A3|6B      |      ;
 
 
fPalette_LoadSpritePallete:
    REP #$30                                                   ;8093A4|C230    |      ;
    STZ.B strcVariables.n16Temp1                               ;8093A6|647E    |00007E;
    SEP #$20                                                   ;8093A8|E220    |      ;
    LDA.B strcVariables.n8Temp1                                ;8093AA|A592    |000092;
    BNE .use_night_variant                                                ;8093AC|D012    |8093C0;
    LDA.L nCurrentTimeID                                       ;8093AE|AF1C1F7F|7F1F1C;
    CMP.B #$12                                                 ;8093B2|C912    |      ;
    BCC .select_season                                                ;8093B4|9011    |8093C7;
    LDA.B strcMap.loadAreaId                                   ;8093B6|A522    |000022;
    CMP.B #$31                                                 ;8093B8|C931    |      ;
    BCS .use_night_variant                                                ;8093BA|B004    |8093C0;
    CMP.B #$15                                                 ;8093BC|C915    |      ;
    BCS .select_season                                                ;8093BE|B007    |8093C7;
 
.use_night_variant:
    REP #$20                                                   ;8093C0|C220    |      ;
    LDA.W #$0004                                               ;8093C2|A90400  |      ;
    STA.B strcVariables.n16Temp1                               ;8093C5|857E    |00007E;
 
.select_season:
    SEP #$20                                                   ;8093C7|E220    |      ;
    LDA.B #$00                                                 ;8093C9|A900    |      ;
    XBA                                                        ;8093CB|EB      |      ;
    LDA.W strcMap.loadAreaId                                   ;8093CC|AD2200  |000022;
    CMP.B #$04                                                 ;8093CF|C904    |      ;
    BCS .season_from_area_index                                                ;8093D1|B00C    |8093DF;
 
.getSeasonId:
    SEP #$20                                                   ;8093D3|E220    |      ;
    LDA.L nCurrentSeasonID                                     ;8093D5|AF191F7F|7F1F19;
    REP #$20                                                   ;8093D9|C220    |      ;
    STA.B strcVariables.n16Temp3                               ;8093DB|8582    |000082;
    BRA .loadData                                              ;8093DD|8012    |8093F1;
 
 
.season_from_area_index:
    SEP #$20                                                   ;8093DF|E220    |      ;
    CMP.B #$10                                                 ;8093E1|C910    |      ;
    BCC .getSeasonId                                           ;8093E3|90EE    |8093D3;
    CMP.B #$14                                                 ;8093E5|C914    |      ;
    BCS .getSeasonId                                           ;8093E7|B0EA    |8093D3;
    REP #$20                                                   ;8093E9|C220    |      ;
    SEC                                                        ;8093EB|38      |      ;
    SBC.W #$0008                                               ;8093EC|E90800  |      ;
    STA.B strcVariables.n16Temp3                               ;8093EF|8582    |000082;
 
.loadData:
    SEP #$20                                                   ;8093F1|E220    |      ;
    LDA.B #$00                                                 ;8093F3|A900    |      ;
    XBA                                                        ;8093F5|EB      |      ;
    LDA.B strcVariables.n16Temp3                               ;8093F6|A582    |000082;
    CLC                                                        ;8093F8|18      |      ;
    ADC.B strcVariables.n16Temp1                               ;8093F9|657E    |00007E;
    STA.B strcVariables.n16Temp2                               ;8093FB|8580    |000080;
    REP #$20                                                   ;8093FD|C220    |      ;
    ASL A                                                      ;8093FF|0A      |      ;
    CLC                                                        ;809400|18      |      ;
    ADC.B strcVariables.n16Temp2                               ;809401|6580    |000080;
    ASL A                                                      ;809403|0A      |      ;
    TAX                                                        ;809404|AA      |      ;
    PHX                                                        ;809405|DA      |      ;
    %PaletteModify(nPaletteSeasonOverwriteTable,X, $000A, $000F)
    REP #$30                                                   ;809414|C230    |      ;
    PLX                                                        ;809416|FA      |      ;
    INX                                                        ;809417|E8      |      ;
    INX                                                        ;809418|E8      |      ;
    PHX                                                        ;809419|DA      |      ;
    %PaletteModify(nPaletteSeasonOverwriteTable,X, $000B, $000F)
    REP #$30                                                   ;809428|C230    |      ;
    PLX                                                        ;80942A|FA      |      ;
    INX                                                        ;80942B|E8      |      ;
    INX                                                        ;80942C|E8      |      ;
    %PaletteModify(nPaletteSeasonOverwriteTable,X, $000C, $000F)
    REP #$30                                                   ;80943B|C230    |      ;
    STZ.B strcVariables.n16Temp1                               ;80943D|647E    |00007E;
    SEP #$20                                                   ;80943F|E220    |      ;
    LDA.B strcVariables.n8Temp1                                ;809441|A592    |000092;
    BNE .use_night_married_variant                                                ;809443|D012    |809457;
    LDA.L nCurrentTimeID                                       ;809445|AF1C1F7F|7F1F1C;
    CMP.B #$12                                                 ;809449|C912    |      ;
    BCC .checkPregnacy                                         ;80944B|9013    |809460;
    LDA.B strcMap.loadAreaId                                   ;80944D|A522    |000022;
    CMP.B #$31                                                 ;80944F|C931    |      ;
    BCS .use_night_married_variant                                                ;809451|B004    |809457;
    CMP.B #$15                                                 ;809453|C915    |      ;
    BCS .checkPregnacy                                         ;809455|B009    |809460;
 
.use_night_married_variant:
    REP #$20                                                   ;809457|C220    |      ;
    LDA.W #$0006                                               ;809459|A90600  |      ;
    STA.B strcVariables.n16Temp1                               ;80945C|857E    |00007E;
    BRA .checkPregnacy                                         ;80945E|8000    |809460;
 
 
.checkPregnacy:
    REP #$30                                                   ;809460|C230    |      ;
    LDA.L nMarriedDaysCounter                                  ;809462|AF3B1F7F|7F1F3B;
    BNE .checkMarriedGirl                                      ;809466|D003    |80946B;
    JMP.W .return                                              ;809468|4C0095  |809500;
 
 
.checkMarriedGirl:
    %CheckFlag(event2, !EFLAGS2_MARRIEDMARIA)
    BNE .marriedMaria                                          ;809472|D026    |80949A;
    %CheckFlag(event2, !EFLAGS2_MARRIEDANN)
    BNE .marriedAnn                                            ;80947B|D024    |8094A1;
    %CheckFlag(event2, !EFLAGS2_MARRIEDNINA)
    BNE .marriedNina                                           ;809484|D022    |8094A8;
    %CheckFlag(event2, !EFLAGS2_MARRIEDELLEN)
    BNE .marriedEllen                                          ;80948D|D020    |8094AF;
    %CheckFlag(event2, !EFLAGS2_MARRIEDEVE)
    BNE .marriedEve                                            ;809496|D01E    |8094B6;
    BRA .return                                                ;809498|8066    |809500;
 
 
.marriedMaria:
    REP #$30                                                   ;80949A|C230    |      ;
    LDA.W #$0001                                               ;80949C|A90100  |      ;
    BRA +                                                      ;80949F|801C    |8094BD;
 
 
.marriedAnn:
    REP #$30                                                   ;8094A1|C230    |      ;
    LDA.W #$0002                                               ;8094A3|A90200  |      ;
    BRA +                                                      ;8094A6|8015    |8094BD;
 
 
.marriedNina:
    REP #$30                                                   ;8094A8|C230    |      ;
    LDA.W #$0003                                               ;8094AA|A90300  |      ;
    BRA +                                                      ;8094AD|800E    |8094BD;
 
 
.marriedEllen:
    REP #$30                                                   ;8094AF|C230    |      ;
    LDA.W #$0004                                               ;8094B1|A90400  |      ;
    BRA +                                                      ;8094B4|8007    |8094BD;
 
 
.marriedEve:
    REP #$30                                                   ;8094B6|C230    |      ;
    LDA.W #$0005                                               ;8094B8|A90500  |      ;
    BRA +                                                      ;8094BB|8000    |8094BD;
 
 
  + REP #$30                                                   ;8094BD|C230    |      ;
    CLC                                                        ;8094BF|18      |      ;
    ADC.B strcVariables.n16Temp1                               ;8094C0|657E    |00007E;
    STA.B strcVariables.n16Temp2                               ;8094C2|8580    |000080;
    ASL A                                                      ;8094C4|0A      |      ;
    CLC                                                        ;8094C5|18      |      ;
    ADC.B strcVariables.n16Temp2                               ;8094C6|6580    |000080;
    ASL A                                                      ;8094C8|0A      |      ;
    TAX                                                        ;8094C9|AA      |      ;
    PHX                                                        ;8094CA|DA      |      ;
    %PaletteModify(sPallete_MarriedGirlTable,X, $0008, $000B)
    REP #$30                                                   ;8094D9|C230    |      ;
    PLX                                                        ;8094DB|FA      |      ;
    INX                                                        ;8094DC|E8      |      ;
    INX                                                        ;8094DD|E8      |      ;
    PHX                                                        ;8094DE|DA      |      ;
    %PaletteModify(sPallete_MarriedGirlTable,X, $0009, $000B)
    REP #$30                                                   ;8094ED|C230    |      ;
    PLX                                                        ;8094EF|FA      |      ;
    INX                                                        ;8094F0|E8      |      ;
    INX                                                        ;8094F1|E8      |      ;
    %PaletteModify(sPallete_MarriedGirlTable,X, $000A, $000B)
 
.return:
    RTL                                                        ;809500|6B      |      ;
 
 
fPalette_AdjustTimePalette:
    SEP #$20                                                   ;809501|E220    |      ;
    REP #$10                                                   ;809503|C210    |      ;
    LDX.W #$0000                                               ;809505|A20000  |      ;
    LDA.L nCurrentTimeID                                       ;809508|AF1C1F7F|7F1F1C;
    CMP.B #$07                                                 ;80950C|C907    |      ;
    BCC +                                                      ;80950E|9010    |809520;
    INX                                                        ;809510|E8      |      ;
    CMP.B #$0F                                                 ;809511|C90F    |      ;
    BCC +                                                      ;809513|900B    |809520;
    INX                                                        ;809515|E8      |      ;
    CMP.B #$11                                                 ;809516|C911    |      ;
    BCC +                                                      ;809518|9006    |809520;
    INX                                                        ;80951A|E8      |      ;
    CMP.B #$12                                                 ;80951B|C912    |      ;
    BCC +                                                      ;80951D|9001    |809520;
    INX                                                        ;80951F|E8      |      ;
 
  + STX.B strcVariables.n16Temp1                               ;809520|867E    |00007E;
    LDA.B #$00                                                 ;809522|A900    |      ;
    XBA                                                        ;809524|EB      |      ;
    LDA.B strcMap.loadAreaId                                   ;809525|A522    |000022;
    REP #$20                                                   ;809527|C220    |      ;
    STA.B strcVariables.n16Temp2                               ;809529|8580    |000080;
    ASL A                                                      ;80952B|0A      |      ;
    ASL A                                                      ;80952C|0A      |      ;
    CLC                                                        ;80952D|18      |      ;
    ADC.B strcVariables.n16Temp2                               ;80952E|6580    |000080;
    ADC.B strcVariables.n16Temp2                               ;809530|6580    |000080;
    ADC.B strcVariables.n16Temp1                               ;809532|657E    |00007E;
    TAX                                                        ;809534|AA      |      ;
    SEP #$20                                                   ;809535|E220    |      ;
    LDA.B #$00                                                 ;809537|A900    |      ;
    XBA                                                        ;809539|EB      |      ;
    LDA.L aMapPalettesIndexes,X                                ;80953A|BF5CBB80|80BB5C;
    CMP.W strcPalette.nextIdx                                  ;80953E|CD7B01  |00017B;
    BEQ +                                                      ;809541|F00F    |809552;
    CMP.B #$FF                                                 ;809543|C9FF    |      ;
    BEQ +                                                      ;809545|F00B    |809552;
    PHA                                                        ;809547|48      |      ;
    JSL.L fPalette_SetNextHourPalette                               ;809548|22C78F80|808FC7;
    SEP #$20                                                   ;80954C|E220    |      ;
    PLA                                                        ;80954E|68      |      ;
    STA.W strcPalette.nextIdx                                  ;80954F|8D7B01  |00017B;
 
  + RTL                                                        ;809552|6B      |      ;
