; Bank $80 module "tilemaps" - starts at $80A7AE
 
 
fTileMap_SetTileMapPointerGetAreaFlags:
    SEP #$20                                                   ;80A7AE|E220    |      ; $22: nIndex, Y: nFieldOffset, return A: nPresetId, $18: pTileMap
    REP #$10                                                   ;80A7B0|C210    |      ;
    LDA.B #$00                                                 ;80A7B2|A900    |      ;
    XBA                                                        ;80A7B4|EB      |      ;
    LDA.B strcMap.loadAreaId                                   ;80A7B5|A522    |000022;
    REP #$20                                                   ;80A7B7|C220    |      ;
    ASL A                                                      ;80A7B9|0A      |      ;
    TAX                                                        ;80A7BA|AA      |      ;
    LDA.L aTileMapData,X                                       ;80A7BB|BF7CAA80|80AA7C;
    STA.B strcMap.pCurrent                                     ;80A7BF|8518    |000018;
    SEP #$20                                                   ;80A7C1|E220    |      ;
    LDA.B (strcMap.pCurrent),Y                                 ;80A7C3|B118    |000018;
    RTL                                                        ;80A7C5|6B      |      ;
 
 
fTileMap_MapChangeHandler:
    SEP #$20                                                   ;80A7C6|E220    |      ;
    REP #$10                                                   ;80A7C8|C210    |      ;
    LDA.B #$00                                                 ;80A7CA|A900    |      ;
    XBA                                                        ;80A7CC|EB      |      ; B = 0
    LDA.B strcMap.loadAreaId                                   ;80A7CD|A522    |000022;
    REP #$20                                                   ;80A7CF|C220    |      ;
    ASL A                                                      ;80A7D1|0A      |      ;
    TAX                                                        ;80A7D2|AA      |      ;
    LDA.L aTileMapData,X                                       ;80A7D3|BF7CAA80|80AA7C; X = nSelectedTilemapId * 2
    STA.B strcMap.pCurrent                                     ;80A7D7|8518    |000018;
    SEP #$20                                                   ;80A7D9|E220    |      ;
    LDY.W #$0000                                               ;80A7DB|A00000  |      ;
    LDA.B strcMap.loadAreaId                                   ;80A7DE|A522    |000022;
    CMP.B #$57                                                 ;80A7E0|C957    |      ;
    BCS .label2                                                ;80A7E2|B02E    |80A812;
    LDA.B (strcMap.pCurrent),Y                                 ;80A7E4|B118    |000018; Y = 0
    STA.W strcDialogDisplay.mapCurrentPresetId                 ;80A7E6|8D9501  |000195;
    JSL.L fCore_ManageGraphicsPresets                          ;80A7E9|22598C80|808C59;
    REP #$30                                                   ;80A7ED|C230    |      ;
    INY                                                        ;80A7EF|C8      |      ;
    LDA.B (strcMap.pCurrent),Y                                 ;80A7F0|B118    |000018; Y = 1
    ORA.W strcDialogDisplay.mapFlags                           ;80A7F2|0D9601  |000196;
    STA.W strcDialogDisplay.mapFlags                           ;80A7F5|8D9601  |000196;
    REP #$20                                                   ;80A7F8|C220    |      ;
    %CheckFlag(daily2, $0001)
    BEQ .label1                                                ;80A801|F00B    |80A80E;
    REP #$30                                                   ;80A803|C230    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;80A805|AD9601  |000196;
    AND.W #$FFDF                                               ;80A808|29DFFF  |      ;
    STA.W strcDialogDisplay.mapFlags                           ;80A80B|8D9601  |000196;
 
.label1:
    REP #$30                                                   ;80A80E|C230    |      ;
    INY                                                        ;80A810|C8      |      ;
    INY                                                        ;80A811|C8      |      ;
 
.label2:
    SEP #$20                                                   ;80A812|E220    |      ;
    LDA.B (strcMap.pCurrent),Y                                 ;80A814|B118    |000018; Y = 3
    STA.W strcDialogDisplay.mapMultiWidth                      ;80A816|8D8101  |000181;
    INY                                                        ;80A819|C8      |      ;
    LDA.B (strcMap.pCurrent),Y                                 ;80A81A|B118    |000018; Y = 4
    STA.W strcDialogDisplay.mapMultiHeight                     ;80A81C|8D8201  |000182;
    CMP.B #$03                                                 ;80A81F|C903    |      ;
    BCC .label3                                                ;80A821|900B    |80A82E;
    REP #$20                                                   ;80A823|C220    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;80A825|AD9601  |000196;
    ORA.W #$0001                                               ;80A828|090100  |      ;
    STA.W strcDialogDisplay.mapFlags                           ;80A82B|8D9601  |000196;
 
.label3:
    SEP #$20                                                   ;80A82E|E220    |      ;
    INY                                                        ;80A830|C8      |      ;
    LDA.B (strcMap.pCurrent),Y                                 ;80A831|B118    |000018; Y = 5
    STA.B strcVariables.n8Temp1                                ;80A833|8592    |000092; $92 = nTilemapCount
    INY                                                        ;80A835|C8      |      ;
    LDA.B (strcMap.pCurrent),Y                                 ;80A836|B118    |000018; Y = 6
    STA.B strcVariables.n8Temp2                                ;80A838|8593    |000093; $93 = nChacatermapCount
    INY                                                        ;80A83A|C8      |      ;
    LDA.B strcMap.loadAreaId                                   ;80A83B|A522    |000022;
    CMP.B #$57                                                 ;80A83D|C957    |      ;
    BCS .label4                                                ;80A83F|B01A    |80A85B;
    REP #$20                                                   ;80A841|C220    |      ;
    LDA.B (strcMap.pCurrent),Y                                 ;80A843|B118    |000018; Y = 7
    STA.B strcPlayer.offsetCamX                                ;80A845|85ED    |0000ED;
    INY                                                        ;80A847|C8      |      ;
    INY                                                        ;80A848|C8      |      ;
    LDA.B (strcMap.pCurrent),Y                                 ;80A849|B118    |000018; Y = 9
    STA.B strcCamera.offsetCamX                                ;80A84B|85F1    |0000F1;
    INY                                                        ;80A84D|C8      |      ;
    INY                                                        ;80A84E|C8      |      ;
    LDA.B (strcMap.pCurrent),Y                                 ;80A84F|B118    |000018; Y = 11
    STA.B strcPlayer.offsetCamY                                ;80A851|85EF    |0000EF;
    INY                                                        ;80A853|C8      |      ;
    INY                                                        ;80A854|C8      |      ;
    LDA.B (strcMap.pCurrent),Y                                 ;80A855|B118    |000018; Y = 13
    STA.B strcCamera.offsetCamY                                ;80A857|85F3    |0000F3;
    INY                                                        ;80A859|C8      |      ;
    INY                                                        ;80A85A|C8      |      ;
 
.label4:
    SEP #$20                                                   ;80A85B|E220    |      ;
    LDA.B strcVariables.n8Temp1                                ;80A85D|A592    |000092;
    BEQ .charactermaps                                         ;80A85F|F05D    |80A8BE;
 
.tilemaps:
    REP #$20                                                   ;80A861|C220    |      ;
    LDA.B (strcMap.pCurrent),Y                                 ;80A863|B118    |000018; Y = 15
    PHA                                                        ;80A865|48      |      ; nDestinationAddress -> stack1
    INY                                                        ;80A866|C8      |      ;
    INY                                                        ;80A867|C8      |      ;
    LDA.B (strcMap.pCurrent),Y                                 ;80A868|B118    |000018; Y = 17
    STA.B ptrTemp0x72                                          ;80A86A|8572    |000072;
    INY                                                        ;80A86C|C8      |      ;
    INY                                                        ;80A86D|C8      |      ;
    SEP #$20                                                   ;80A86E|E220    |      ;
    LDA.B (strcMap.pCurrent),Y                                 ;80A870|B118    |000018; Y = 19
    STA.B ptrTemp0x72+2                                        ;80A872|8574    |000074; $72 = pCompressedMap
    REP #$20                                                   ;80A874|C220    |      ;
    INY                                                        ;80A876|C8      |      ; Y++
    PHY                                                        ;80A877|5A      |      ; Y -> stack2
    LDA.W #$2000                                               ;80A878|A90020  |      ;
    STA.B ptrUnknown0x75                                       ;80A87B|8575    |000075;
    SEP #$20                                                   ;80A87D|E220    |      ;
    LDA.B #$7E                                                 ;80A87F|A97E    |      ;
    STA.B ptrUnknown0x75+2                                     ;80A881|8577    |000077; $75 = 0x7E2000
    JSL.L fGraphicsDecompressTilemap                           ;80A883|22F88183|8381F8;
    SEP #$20                                                   ;80A887|E220    |      ;
    LDA.B #$00                                                 ;80A889|A900    |      ;
    STA.B strcSystem.arrayIndex                                ;80A88B|8527    |000027;
    LDA.B #$18                                                 ;80A88D|A918    |      ;
    STA.B strcSystem.destinationRegister                       ;80A88F|8529    |000029;
    REP #$30                                                   ;80A891|C230    |      ;
    PLY                                                        ;80A893|7A      |      ; Y = stack2
    PLA                                                        ;80A894|68      |      ; A = nDestinationAddress
    PHY                                                        ;80A895|5A      |      ; Y -> stack1
    TAX                                                        ;80A896|AA      |      ; X = nDestinationAddress
    LDY.W #$2000                                               ;80A897|A00020  |      ;
    LDA.W #$2000                                               ;80A89A|A90020  |      ;
    STA.B ptrTemp0x72                                          ;80A89D|8572    |000072;
    SEP #$20                                                   ;80A89F|E220    |      ;
    LDA.B #$7E                                                 ;80A8A1|A97E    |      ;
    STA.B ptrTemp0x72+2                                        ;80A8A3|8574    |000074; $72 = 0x7E2000
    REP #$20                                                   ;80A8A5|C220    |      ;
    LDA.W #$0080                                               ;80A8A7|A98000  |      ; A = 0x80
    JSL.L fCore_PrepareTransfer                                ;80A8AA|22338A80|808A33;
    JSL.L fCore_StartPreparedTransfer                          ;80A8AE|22B28A80|808AB2;
    REP #$30                                                   ;80A8B2|C230    |      ;
    PLY                                                        ;80A8B4|7A      |      ; Y = stack1
    SEP #$20                                                   ;80A8B5|E220    |      ;
    LDA.B strcVariables.n8Temp1                                ;80A8B7|A592    |000092;
    DEC A                                                      ;80A8B9|3A      |      ;
    STA.B strcVariables.n8Temp1                                ;80A8BA|8592    |000092;
    BNE .tilemaps                                              ;80A8BC|D0A3    |80A861;
 
.charactermaps:
    REP #$30                                                   ;80A8BE|C230    |      ;
    LDA.B (strcMap.pCurrent),Y                                 ;80A8C0|B118    |000018;
    STA.B strcVariables.n16Unk8A                               ;80A8C2|858A    |00008A;
    INY                                                        ;80A8C4|C8      |      ;
    INY                                                        ;80A8C5|C8      |      ;
    LDA.B (strcMap.pCurrent),Y                                 ;80A8C6|B118    |000018;
    STA.B ptrTemp0x72                                          ;80A8C8|8572    |000072;
    INY                                                        ;80A8CA|C8      |      ;
    INY                                                        ;80A8CB|C8      |      ;
    SEP #$20                                                   ;80A8CC|E220    |      ;
    LDA.B (strcMap.pCurrent),Y                                 ;80A8CE|B118    |000018;
    STA.B ptrTemp0x72+2                                        ;80A8D0|8574    |000074;
    REP #$20                                                   ;80A8D2|C220    |      ;
    INY                                                        ;80A8D4|C8      |      ;
    PHY                                                        ;80A8D5|5A      |      ;
    LDA.W #$2000                                               ;80A8D6|A90020  |      ;
    STA.B ptrUnknown0x75                                       ;80A8D9|8575    |000075;
    SEP #$20                                                   ;80A8DB|E220    |      ;
    LDA.B #$7E                                                 ;80A8DD|A97E    |      ;
    STA.B ptrUnknown0x75+2                                     ;80A8DF|8577    |000077;
    REP #$20                                                   ;80A8E1|C220    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;80A8E3|AD9601  |000196;
    AND.W #$8000                                               ;80A8E6|290080  |      ;
    BNE .label7                                                ;80A8E9|D006    |80A8F1;
    JSL.L fGraphicsDecompressTilemap                           ;80A8EB|22F88183|8381F8;
    BRA .label9                                                ;80A8EF|8010    |80A901;
 
 
.label7:
    REP #$30                                                   ;80A8F1|C230    |      ;
    LDY.W #$0000                                               ;80A8F3|A00000  |      ;
 
.loop:
    LDA.B [ptrTemp0x72],Y                                      ;80A8F6|B772    |000072;
    STA.B [ptrUnknown0x75],Y                                   ;80A8F8|9775    |000075;
    INY                                                        ;80A8FA|C8      |      ;
    INY                                                        ;80A8FB|C8      |      ;
    CPY.W #$8000                                               ;80A8FC|C00080  |      ;
    BNE .loop                                                  ;80A8FF|D0F5    |80A8F6;
 
.label9:
    SEP #$20                                                   ;80A901|E220    |      ;
    LDA.B strcMap.loadAreaId                                   ;80A903|A522    |000022;
    CMP.B #!AREA_TOWNSPRING                                                 
    BCS .loadFarm                                              ;80A907|B004    |80A90D;
    JSL.L fObjectMap_ConnectAdjacentObjectTiles                                      ;80A909|2200AF82|82AF00;
 
.loadFarm:
    SEP #$20                                                   ;80A90D|E220    |      ;
    LDA.B strcVariables.n8Temp2                                ;80A90F|A593    |000093;
    CMP.B #$01                                                 ;80A911|C901    |      ;
    BNE .label11                                               ;80A913|D00F    |80A924;
    REP #$30                                                   ;80A915|C230    |      ;
    %CheckFlag(daily3, $0002)
    BNE .label11                                               ;80A91E|D004    |80A924;
    JSL.L fItemSubrutineHandler_81A9E5                         ;80A920|22E5A981|81A9E5;
 
.label11:
    REP #$20                                                   ;80A924|C220    |      ;
    STZ.B strcCamera.cameraX                                   ;80A926|64F5    |0000F5;
    STZ.B strcCamera.cameraY                                   ;80A928|64F7    |0000F7;
    LDA.W #$0410                                               ;80A92A|A91004  |      ;
    STA.B strcMap.unk10                                        ;80A92D|8510    |000010;
    LDA.W #$0A00                                               ;80A92F|A9000A  |      ;
    STA.B strcMap.unk14                                        ;80A932|8514    |000014;
    STZ.B strcMap.unk12                                        ;80A934|6412    |000012;
    STZ.B strcMap.unk16                                        ;80A936|6416    |000016;
    SEP #$20                                                   ;80A938|E220    |      ;
    STZ.B strcMap.unk20                                        ;80A93A|6420    |000020;
    STZ.B strcMap.unk21                                        ;80A93C|6421    |000021;
    REP #$20                                                   ;80A93E|C220    |      ;
    STZ.B strcPlayer.posX                                      ;80A940|64D6    |0000D6;
    STZ.B strcPlayer.posY                                      ;80A942|64D8    |0000D8;
    SEP #$20                                                   ;80A944|E220    |      ;
    LDA.B #$00                                                 ;80A946|A900    |      ;
    XBA                                                        ;80A948|EB      |      ;
    LDA.W strcDialogDisplay.mapMultiWidth                      ;80A949|AD8101  |000181;
    REP #$20                                                   ;80A94C|C220    |      ;
    ASL A                                                      ;80A94E|0A      |      ;
    TAX                                                        ;80A94F|AA      |      ;
    LDA.L nTable_80AA68,X                                      ;80A950|BF68AA80|80AA68;
    STA.B strcMap.pCurrent+2                                   ;80A954|851A    |00001A;
    SEC                                                        ;80A956|38      |      ;
    SBC.W #$0040                                               ;80A957|E94000  |      ;
    STA.B strcVariables.n16Temp2                               ;80A95A|8580    |000080;
    LDA.L nTable_80AA72,X                                      ;80A95C|BF72AA80|80AA72;
    STA.B strcMap.unk1C                                        ;80A960|851C    |00001C;
    REP #$20                                                   ;80A962|C220    |      ;
    LDA.W #$0000                                               ;80A964|A90000  |      ;
    STA.B strcVariables.n16Temp1                               ;80A967|857E    |00007E;
    LDX.B strcVariables.n16Unk8A                               ;80A969|A68A    |00008A;
    LDY.W #$0040                                               ;80A96B|A04000  |      ;
    LDA.W #$0000                                               ;80A96E|A90000  |      ;
 
.copy40characters:
    REP #$20                                                   ;80A971|C220    |      ;
    PHA                                                        ;80A973|48      |      ;
    LDA.W #$0000                                               ;80A974|A90000  |      ;
 
.label13:
    REP #$30                                                   ;80A977|C230    |      ;
    PHA                                                        ;80A979|48      |      ;
    JSR.W fTileMap_UploadRowToVRAM                               ;80A97A|2038AA  |80AA38;
    REP #$30                                                   ;80A97D|C230    |      ;
    LDA.B strcVariables.n16Temp1                               ;80A97F|A57E    |00007E;
    CLC                                                        ;80A981|18      |      ;
    ADC.W #$0040                                               ;80A982|694000  |      ;
    STA.B strcVariables.n16Temp1                               ;80A985|857E    |00007E;
    TXA                                                        ;80A987|8A      |      ;
    CLC                                                        ;80A988|18      |      ;
    ADC.W #$0400                                               ;80A989|690004  |      ;
    TAX                                                        ;80A98C|AA      |      ;
    SEP #$20                                                   ;80A98D|E220    |      ;
    LDA.B strcMap.loadAreaId                                   ;80A98F|A522    |000022;
    CMP.B #$5B                                                 ;80A991|C95B    |      ;
    BCS .label14                                               ;80A993|B007    |80A99C;
    LDY.B strcVariables.n16Unk8A                               ;80A995|A48A    |00008A;
    CPY.W #$7000                                               ;80A997|C00070  |      ;
    BEQ .label15                                               ;80A99A|F006    |80A9A2;
 
.label14:
    LDY.W #$0040                                               ;80A99C|A04000  |      ;
    JSR.W fTileMap_UploadRowToVRAM                               ;80A99F|2038AA  |80AA38;
 
.label15:
    REP #$30                                                   ;80A9A2|C230    |      ;
    LDA.B strcVariables.n16Temp1                               ;80A9A4|A57E    |00007E;
    CLC                                                        ;80A9A6|18      |      ;
    ADC.B strcVariables.n16Temp2                               ;80A9A7|6580    |000080;
    STA.B strcVariables.n16Temp1                               ;80A9A9|857E    |00007E;
    TXA                                                        ;80A9AB|8A      |      ;
    SEC                                                        ;80A9AC|38      |      ;
    SBC.W #$03E0                                               ;80A9AD|E9E003  |      ;
    TAX                                                        ;80A9B0|AA      |      ;
    LDY.W #$0040                                               ;80A9B1|A04000  |      ;
    PLA                                                        ;80A9B4|68      |      ;
    INC A                                                      ;80A9B5|1A      |      ;
    CMP.W #$0020                                               ;80A9B6|C92000  |      ;
    BNE .label13                                               ;80A9B9|D0BC    |80A977;
    SEP #$20                                                   ;80A9BB|E220    |      ;
    LDA.B strcMap.loadAreaId                                   ;80A9BD|A522    |000022;
    CMP.B #$5B                                                 ;80A9BF|C95B    |      ;
    BCS .label16                                               ;80A9C1|B007    |80A9CA;
    LDY.B strcVariables.n16Unk8A                               ;80A9C3|A48A    |00008A;
    CPY.W #$7000                                               ;80A9C5|C00070  |      ;
    BEQ .label17                                               ;80A9C8|F008    |80A9D2;
 
.label16:
    REP #$20                                                   ;80A9CA|C220    |      ;
    TXA                                                        ;80A9CC|8A      |      ;
    CLC                                                        ;80A9CD|18      |      ;
    ADC.W #$0400                                               ;80A9CE|690004  |      ;
    TAX                                                        ;80A9D1|AA      |      ;
 
.label17:
    REP #$30                                                   ;80A9D2|C230    |      ;
    LDY.W #$0040                                               ;80A9D4|A04000  |      ;
    PLA                                                        ;80A9D7|68      |      ;
    INC A                                                      ;80A9D8|1A      |      ;
    CMP.W #$0002                                               ;80A9D9|C90200  |      ;
    BNE .copy40characters                                      ;80A9DC|D093    |80A971;
    REP #$30                                                   ;80A9DE|C230    |      ;
    PLY                                                        ;80A9E0|7A      |      ;
    SEP #$20                                                   ;80A9E1|E220    |      ;
    LDA.B strcVariables.n8Temp2                                ;80A9E3|A593    |000093;
    DEC A                                                      ;80A9E5|3A      |      ;
    STA.B strcVariables.n8Temp2                                ;80A9E6|8593    |000093;
    BEQ .continue                                              ;80A9E8|F003    |80A9ED;
    JMP.W .charactermaps                                       ;80A9EA|4CBEA8  |80A8BE;
 
 
.continue:
    SEP #$20                                                   ;80A9ED|E220    |      ;
    LDA.B strcMap.loadAreaId                                   ;80A9EF|A522    |000022;
    CMP.B #$57                                                 ;80A9F1|C957    |      ;
    BCS .return                                                ;80A9F3|B042    |80AA37;
    SEP #$20                                                   ;80A9F5|E220    |      ;
    LDA.B #$08                                                 ;80A9F7|A908    |      ;
    STA.B strcMap.unk1E                                        ;80A9F9|851E    |00001E;
 
.destinationX:
    REP #$20                                                   ;80A9FB|C220    |      ;
    LDA.B strcPlayer.posX                                      ;80A9FD|A5D6    |0000D6;
    CMP.W strcDialogDisplay.mapDestX                           ;80A9FF|CD7D01  |00017D;
    BEQ .destinationY                                          ;80AA02|F015    |80AA19;
    LDA.B strcPlayer.posX                                      ;80AA04|A5D6    |0000D6;
    CLC                                                        ;80AA06|18      |      ;
    ADC.B strcMap.unk1E                                        ;80AA07|651E    |00001E;
    STA.B strcPlayer.posX                                      ;80AA09|85D6    |0000D6;
    JSL.L fCamera_UpdateFromPlayerPos                                      ;80AA0B|22BC9E80|809EBC;
    JSL.L fCamera_ScrollRightStep                                      ;80AA0F|221CA180|80A11C;
    JSL.L fCore_StartTransfer                                  ;80AA13|22F08A80|808AF0;
    BRA .destinationX                                          ;80AA17|80E2    |80A9FB;
 
 
.destinationY:
    REP #$20                                                   ;80AA19|C220    |      ;
    LDA.B strcPlayer.posY                                      ;80AA1B|A5D8    |0000D8;
    CMP.W strcDialogDisplay.mapDestY                           ;80AA1D|CD7F01  |00017F;
    BEQ .return                                                ;80AA20|F015    |80AA37;
    LDA.B strcPlayer.posY                                      ;80AA22|A5D8    |0000D8;
    CLC                                                        ;80AA24|18      |      ;
    ADC.B strcMap.unk1E                                        ;80AA25|651E    |00001E;
    STA.B strcPlayer.posY                                      ;80AA27|85D8    |0000D8;
    JSL.L fCamera_UpdateFromPlayerPos                                      ;80AA29|22BC9E80|809EBC;
    JSL.L fCamera_ScrollDownStep                                      ;80AA2D|22ABA080|80A0AB;
    JSL.L fCore_StartTransfer                                  ;80AA31|22F08A80|808AF0;
    BRA .destinationY                                          ;80AA35|80E2    |80AA19;
 
 
.return:
    RTL                                                        ;80AA37|6B      |      ;
 
 
fTileMap_UploadRowToVRAM:
    REP #$30                                                   ;80AA38|C230    |      ;
    PHX                                                        ;80AA3A|DA      |      ;
    PHY                                                        ;80AA3B|5A      |      ;
    SEP #$20                                                   ;80AA3C|E220    |      ;
    LDA.B #$00                                                 ;80AA3E|A900    |      ;
    STA.B strcSystem.arrayIndex                                ;80AA40|8527    |000027;
    LDA.B #$18                                                 ;80AA42|A918    |      ;
    STA.B strcSystem.destinationRegister                       ;80AA44|8529    |000029;
    REP #$20                                                   ;80AA46|C220    |      ;
    LDA.W #$2000                                               ;80AA48|A90020  |      ;
    CLC                                                        ;80AA4B|18      |      ;
    ADC.B strcVariables.n16Temp1                               ;80AA4C|657E    |00007E;
    STA.B ptrTemp0x72                                          ;80AA4E|8572    |000072;
    SEP #$20                                                   ;80AA50|E220    |      ;
    LDA.B #$7E                                                 ;80AA52|A97E    |      ;
    STA.B ptrTemp0x72+2                                        ;80AA54|8574    |000074;
    REP #$20                                                   ;80AA56|C220    |      ;
    LDA.W #$0080                                               ;80AA58|A98000  |      ;
    JSL.L fCore_PrepareTransfer                                ;80AA5B|22338A80|808A33;
    JSL.L fCore_StartPreparedTransfer                          ;80AA5F|22B28A80|808AB2;
    REP #$30                                                   ;80AA63|C230    |      ;
    PLY                                                        ;80AA65|7A      |      ;
    PLX                                                        ;80AA66|FA      |      ;
    RTS                                                        ;80AA67|60      |      ;
 
 
nTable_80AA68:
    dw $0000,$0040,$0080,$0100,$0100                           ;80AA68|        |      ;
 
nTable_80AA72:
    dw $0000,$1000,$2000,$4000,$4000                           ;80AA72|        |      ;
aTileMapData:
    dw sFarmSpringMap                                          ;80AA7C|        |80AB3C; 0x60 * [ptr16]
    dw sFarmSummerMap                                          ;80AA7E|        |80AB5F;
    dw sFarmFallMap                                            ;80AA80|        |80AB82;
    dw sFarmWinterMap                                          ;80AA82|        |80ABA5;
    dw sTownSpringMap                                          ;80AA84|        |80ABC8;
    dw sTownSummerMap                                          ;80AA86|        |80ABEB;
    dw sTownFallMap                                            ;80AA88|        |80AC0E;
    dw sTownWinterMap                                          ;80AA8A|        |80AC31;
    dw sFlowerFestivalMap                                      ;80AA8C|        |80AC54;
    dw sHarvestFestivalMap                                     ;80AA8E|        |80AC77;
    dw sStarNightFestivalSquareMap                             ;80AA90|        |80AC9A;
    dw sEggFestivalMap                                         ;80AA92|        |80ACBD;
    dw sRoadSpringMap                                          ;80AA94|        |80ACE0;
    dw sRoadSummerMap                                          ;80AA96|        |80ACF9;
    dw sRoadFallMap                                            ;80AA98|        |80AD12;
    dw sRoadWinterMap                                          ;80AA9A|        |80AD2B;
    dw sMountainSpring                                         ;80AA9C|        |80AD44;
    dw sMountainSummerMap                                      ;80AA9E|        |80AD67;
    dw sMountainFallMap                                        ;80AAA0|        |80AD8A;
    dw sMountainWinterMap                                      ;80AAA2|        |80ADAD;
    dw sStarNightFestivalSpaMap                                ;80AAA4|        |80ADD0;
    dw sHouseMap                                               ;80AAA6|        |80ADF3;
    dw sHouseUpgrade1Map                                       ;80AAA8|        |80AE11;
    dw sHouseUpgrade2Map                                       ;80AAAA|        |80AE2F;
    dw sMayorHouseMap                                          ;80AAAC|        |80AE4D;
    dw sMayorHouseHallMap                                      ;80AAAE|        |80AE66;
    dw sMayorHouseMariaRoomMap                                 ;80AAB0|        |80AE7F;
    dw sChurchMap                                              ;80AAB2|        |80AE98;
    dw sFlowerShopMap                                          ;80AAB4|        |80AEB1;
    dw sFlowerShopRoomMap                                      ;80AAB6|        |80AECA;
    dw sBarMap                                                 ;80AAB8|        |80AEE3;
    dw sBarRoomMap                                             ;80AABA|        |80AEFC;
    dw sRestaurantMap                                          ;80AABC|        |80AF15;
    dw sRestaurantRoomMap                                      ;80AABE|        |80AF2E;
    dw sGeneralStoreMap                                        ;80AAC0|        |80AF47;
    dw sGeneralStoreRoomMap                                    ;80AAC2|        |80AF60;
    dw sAnimalShopMap                                          ;80AAC4|        |80AF79;
    dw sFortuneTellerHouseMap                                  ;80AAC6|        |80AF92;
    dw sToolShedMap                                            ;80AAC8|        |80AFAB;
    dw sBarnMap                                                ;80AACA|        |80AFCE;
    dw sCoopMap                                                ;80AACC|        |80AFE7;
    dw sMountainCaveMap                                        ;80AACE|        |80B000;
    dw sElfTunnelMap                                           ;80AAD0|        |80B019;
    dw sMap_80B032                                             ;80AAD2|        |80B032;
    dw sMap_80B04B                                             ;80AAD4|        |80B04B;
    dw sMap_80B064                                             ;80AAD6|        |80B064;
    dw sMap_80B087                                             ;80AAD8|        |80B087;
    dw sMap_80B0AA                                             ;80AADA|        |80B0AA;
    dw sMap_80B0CD                                             ;80AADC|        |80B0CD;
    dw sSummitSpringMap                                        ;80AADE|        |80B0F0;
    dw sSummitSummerMap                                        ;80AAE0|        |80B113;
    dw sSummitFallMap                                          ;80AAE2|        |80B136;
    dw sSummitWinterMap                                        ;80AAE4|        |80B159;
    dw sMap_80B17C                                             ;80AAE6|        |80B17C;
    dw sMap_80B19F                                             ;80AAE8|        |80B19F;
    dw sMap_80B1C2                                             ;80AAEA|        |80B1C2;
    dw sMap_80B1E5                                             ;80AAEC|        |80B1E5;
    dw sStarNightFestivalMountainTopMap                        ;80AAEE|        |80B208;
    dw sNewYearsFestivalMap                                    ;80AAF0|        |80B22B;
    dw sMap_80B24E                                             ;80AAF2|        |80B24E;
    dw sMap_80B271                                             ;80AAF4|        |80B271;
    dw sMap_80B28A                                             ;80AAF6|        |80B28A;
    dw sMap_80B2AD                                             ;80AAF8|        |80B2AD;
    dw sMap_80B2D0                                             ;80AAFA|        |80B2D0;
    dw sMap_80B2F3                                             ;80AAFC|        |80B2F3;
    dw sMap_80B316                                             ;80AAFE|        |80B316;
    dw sMap_80B339                                             ;80AB00|        |80B339;
    dw sMap_80B35C                                             ;80AB02|        |80B35C;
    dw sMap_80B37F                                             ;80AB04|        |80B37F;
    dw sMap_80B3A2                                             ;80AB06|        |80B3A2;
    dw sMap_80B3C5                                             ;80AB08|        |80B3C5;
    dw sMap_80B3E8                                             ;80AB0A|        |80B3E8;
    dw sMap_80B40B                                             ;80AB0C|        |80B40B;
    dw sMap_80B42E                                             ;80AB0E|        |80B42E;
    dw sMap_80B451                                             ;80AB10|        |80B451;
    dw sMap_80B474                                             ;80AB12|        |80B474;
    dw sMap_80B49C                                             ;80AB14|        |80B49C;
    dw sMap_80B4C4                                             ;80AB16|        |80B4C4;
    dw sMap_80B4EC                                             ;80AB18|        |80B4EC;
    dw sMap_80B514                                             ;80AB1A|        |80B514;
    dw sMap_80B537                                             ;80AB1C|        |80B537;
    dw sMap_80B55F                                             ;80AB1E|        |80B55F;
    dw sMap_80B587                                             ;80AB20|        |80B587;
    dw sMap_80B5AF                                             ;80AB22|        |80B5AF;
    dw sMap_80B5D2                                             ;80AB24|        |80B5D2;
    dw sMap_80B5F5                                             ;80AB26|        |80B5F5;
    dw sMap_80B618                                             ;80AB28|        |80B618;
    dw sRainOverlay                                            ;80AB2A|        |80B640;
    dw sCloudsOverlay                                          ;80AB2C|        |80B64E;
    dw sSnowOverlay                                            ;80AB2E|        |80B65C;
    dw sHeavySnowOverlay                                       ;80AB30|        |80B66A;
    dw sIntroFarmScrool                                        ;80AB32|        |80B678;
    dw sHarvestMoonLogo                                        ;80AB34|        |80B69A;
    dw sNatsumeLogo                                            ;80AB36|        |80B6A3;
    dw sMenuScreenBackgrounds                                  ;80AB38|        |80B6B1;
    dw sMenuCharacters                                         ;80AB3A|        |80B6D3;
 
sFarmSpringMap:
    db $00                                                     ;80AB3C|        |      ; Graphic Preset
 
  + dw !AFLAGS_RAWCHARMAP|!AFLAGS_UNK0080|!AFLAGS_FOR0040|!AFLAGS_UNK0020                                                   
 
  + db $04                                                     ;80AB3F|        |      ; room width multi
 
  + db $04                                                     ;80AB40|        |      ; room height multi
 
  + db $03                                                     ;80AB41|        |      ; number_of_tilemaps
 
  + db $01                                                     ;80AB42|        |      ; number_of_charactermaps
 
  + dw $0000                                                   ;80AB43|        |      ; OBJ_clamp_left
 
  + dw $0300                                                   ;80AB45|        |      ; OBJ_clamp_right
 
  + dw $0000                                                   ;80AB47|        |      ; OBJ_clamp_up
 
  + dw $0300                                                   ;80AB49|        |      ; OBJ_clamp_down
 
  + dw $2000                                                   ;80AB4B|        |      ; Destination in VRAM 1
    dl Tiles_Farm_SpringSummer_0                               ;80AB4D|        |92D3AB; Compressed Location 1
    dw $3000                                                   ;80AB50|        |      ; Destination in VRAM 2
    dl Tiles_Farm_SpringSummer_1                               ;80AB52|        |938000; Compressed Location 2
    dw $4000                                                   ;80AB55|        |      ; Destination in VRAM 3
    dl Tiles_Farm_SpringSummer_2                               ;80AB57|        |939E8E; Compressed Location 3
    dw $6000                                                   ;80AB5A|        |      ; Destination in VRAM
    dl ScreenRaw_Farm                                    ;80AB5C|        |A18000; Compressed Location
 
sFarmSummerMap:
    db $00                                                     ;80AB5F|        |      ;
    dw !AFLAGS_RAWCHARMAP|!AFLAGS_UNK0080|!AFLAGS_FOR0040|!AFLAGS_UNK0020                                                   
    db $04,$04,$03,$01                                         ;80AB62|        |      ;
    dw $0000,$0300,$0000,$0300,$2000                           ;80AB66|        |      ;
    dl Tiles_Farm_SpringSummer_0                               ;80AB70|        |92D3AB;
    dw $3000                                                   ;80AB73|        |      ;
    dl Tiles_Farm_SpringSummer_1                               ;80AB75|        |938000;
    dw $4000                                                   ;80AB78|        |      ;
    dl Tiles_Farm_SpringSummer_2                               ;80AB7A|        |939E8E;
    dw $6000                                                   ;80AB7D|        |      ;
    dl ScreenRaw_Farm                                    ;80AB7F|        |A18000;
 
sFarmFallMap:
    db $00                                                     ;80AB82|        |      ;
    dw !AFLAGS_RAWCHARMAP|!AFLAGS_UNK0080|!AFLAGS_FOR0040|!AFLAGS_UNK0020                                                   
    db $04,$04,$03,$01                                         ;80AB85|        |      ;
    dw $0000,$0300,$0000,$0300,$2000                           ;80AB89|        |      ;
    dl Tiles_Farm_Fall_0                               ;80AB93|        |9282CB;
    dw $3000                                                   ;80AB96|        |      ;
    dl Tiles_Farm_Fall_1                               ;80AB98|        |929D10;
    dw $4000                                                   ;80AB9B|        |      ;
    dl Tiles_Farm_Fall_2                               ;80AB9D|        |92BB03;
    dw $6000                                                   ;80ABA0|        |      ;
    dl ScreenRaw_Farm                                    ;80ABA2|        |A18000;
 
sFarmWinterMap:
    db $00                                                     ;80ABA5|        |      ;
    dw !AFLAGS_RAWCHARMAP|!AFLAGS_UNK0080|!AFLAGS_FOR0040|!AFLAGS_UNK0020                                                   
    db $04,$04,$03,$01                                         ;80ABA8|        |      ;
    dw $0000,$0300,$0000,$0300,$2000                           ;80ABAC|        |      ;
    dl Tiles_Farm_Winter_0                               ;80ABB6|        |93B736;
    dw $3000                                                   ;80ABB9|        |      ;
    dl Tiles_Farm_Winter_1                               ;80ABBB|        |93D049;
    dw $4000                                                   ;80ABBE|        |      ;
    dl Tiles_Farm_Winter_2                               ;80ABC0|        |93E12B;
    dw $6000                                                   ;80ABC3|        |      ;
    dl ScreenRaw_Farm                                    ;80ABC5|        |A18000;
 
sTownSpringMap:
    db $00                                                     ;80ABC8|        |      ;
    dw !AFLAGS_RAWCHARMAP|!AFLAGS_FOR0040|!AFLAGS_UNK0020                                                   
    db $04,$04,$03,$01                                         ;80ABCB|        |      ;
    dw $0000,$0200,$0000,$0300,$2000                           ;80ABCF|        |      ;
    dl Tiles_Town_SpringToFall_0                               ;80ABD9|        |97B45F;
    dw $3000                                                   ;80ABDC|        |      ;
    dl Tiles_Town_Spring_1                               ;80ABDE|        |998000;
    dw $4000                                                   ;80ABE1|        |      ;
    dl Tiles_Town_Spring_2                               ;80ABE3|        |999A74;
    dw $6000                                                   ;80ABE6|        |      ;
    dl ScreenRaw_Town                                    ;80ABE8|        |A38000;
 
sTownSummerMap:
    db $00                                                     ;80ABEB|        |      ;
    dw !AFLAGS_RAWCHARMAP|!AFLAGS_FOR0040|!AFLAGS_UNK0020                                                   
    db $04,$04,$03,$01                                         ;80ABEE|        |      ;
    dw $0000,$0200,$0000,$0300,$2000                           ;80ABF2|        |      ;
    dl Tiles_Town_SpringToFall_0                               ;80ABFC|        |97B45F;
    dw $3000                                                   ;80ABFF|        |      ;
    dl Tiles_Town_Summer_1                               ;80AC01|        |97CD20;
    dw $4000                                                   ;80AC04|        |      ;
    dl Tiles_Town_Summer_2                               ;80AC06|        |97E7A2;
    dw $6000                                                   ;80AC09|        |      ;
    dl ScreenRaw_Town                                    ;80AC0B|        |A38000;
 
sTownFallMap:
    db $00                                                     ;80AC0E|        |      ;
    dw !AFLAGS_RAWCHARMAP|!AFLAGS_FOR0040|!AFLAGS_UNK0020                                                   
    db $04,$04,$03,$01                                         ;80AC11|        |      ;
    dw $0000,$0200,$0000,$0300,$2000                           ;80AC15|        |      ;
    dl Tiles_Town_SpringToFall_0                               ;80AC1F|        |97B45F;
    dw $3000                                                   ;80AC22|        |      ;
    dl Tiles_Town_Fall_1                               ;80AC24|        |988000;
    dw $4000                                                   ;80AC27|        |      ;
    dl Tiles_Town_Fall_2                               ;80AC29|        |989A52;
    dw $6000                                                   ;80AC2C|        |      ;
    dl ScreenRaw_Town                                    ;80AC2E|        |A38000;
 
sTownWinterMap:
    db $00                                                     ;80AC31|        |      ;
    dw !AFLAGS_RAWCHARMAP|!AFLAGS_FOR0040|!AFLAGS_UNK0020                                                   
    db $04,$04,$03,$01                                         ;80AC34|        |      ;
    dw $0000,$0200,$0000,$0300,$2000                           ;80AC38|        |      ;
    dl Tiles_Town_Winter_0                               ;80AC42|        |99DCBD;
    dw $3000                                                   ;80AC45|        |      ;
    dl Tiles_Town_Winter_1                               ;80AC47|        |9A8000;
    dw $4000                                                   ;80AC4A|        |      ;
    dl Tiles_Town_Winter_2                               ;80AC4C|        |9A9921;
    dw $6000                                                   ;80AC4F|        |      ;
    dl ScreenRaw_Town                                    ;80AC51|        |A38000;
 
sFlowerFestivalMap:
    db $00                                                     ;80AC54|        |      ;
    dw !AFLAGS_FOR0040|!AFLAGS_UNK0020                                                   
    db $02,$02,$03,$01                                         ;80AC57|        |      ;
    dw $0000,$0100,$0000,$0100,$2000                           ;80AC5B|        |      ;
    dl Tiles_Town_SpringToFall_0                               ;80AC65|        |97B45F;
    dw $3000                                                   ;80AC68|        |      ;
    dl Tiles_Town_Spring_1                               ;80AC6A|        |998000;
    dw $4000                                                   ;80AC6D|        |      ;
    dl Tiles_FlowerFestival_2                               ;80AC6F|        |99AEC3;
    dw $6000                                                   ;80AC72|        |      ;
    dl Screen_FlowerFestival                          ;80AC74|        |A4D379;
 
sHarvestFestivalMap:
    db $00                                                     ;80AC77|        |      ;
    dw !AFLAGS_FOR0040|!AFLAGS_UNK0020                                                   
    db $02,$02,$03,$01                                         ;80AC7A|        |      ;
    dw $0000,$0100,$0000,$0100,$2000                           ;80AC7E|        |      ;
    dl Tiles_Town_SpringToFall_0                               ;80AC88|        |97B45F;
    dw $3000                                                   ;80AC8B|        |      ;
    dl Tiles_Town_Fall_1                               ;80AC8D|        |988000;
    dw $4000                                                   ;80AC90|        |      ;
    dl Tiles_HarvestFestival_2                               ;80AC92|        |98AEDB;
    dw $6000                                                   ;80AC95|        |      ;
    dl Screen_HarvestFestival                          ;80AC97|        |A4C5DE;
 
sStarNightFestivalSquareMap:
    db $00                                                     ;80AC9A|        |      ;
    dw !AFLAGS_FOR0040|!AFLAGS_UNK0020                                                   
    db $02,$02,$03,$01                                         ;80AC9D|        |      ;
    dw $0000,$0100,$0000,$0100,$2000                           ;80ACA1|        |      ;
    dl Tiles_Town_Winter_0                               ;80ACAB|        |99DCBD;
    dw $3000                                                   ;80ACAE|        |      ;
    dl Tiles_Town_Winter_1                               ;80ACB0|        |9A8000;
    dw $4000                                                   ;80ACB3|        |      ;
    dl Tiles_StarNightFestivalSquare_2                               ;80ACB5|        |9AAEAB;
    dw $6000                                                   ;80ACB8|        |      ;
    dl Screen_StarNightFestivalSquare                          ;80ACBA|        |A58327;
 
sEggFestivalMap:
    db $00                                                     ;80ACBD|        |      ;
    dw !AFLAGS_FOR0040|!AFLAGS_UNK0020                                                   
    db $04,$04,$03,$01                                         ;80ACC0|        |      ;
    dw $0000,$0200,$0000,$0300,$2000                           ;80ACC4|        |      ;
    dl Tiles_Town_SpringToFall_0                               ;80ACCE|        |97B45F;
    dw $3000                                                   ;80ACD1|        |      ;
    dl Tiles_Town_Fall_1                               ;80ACD3|        |988000;
    dw $4000                                                   ;80ACD6|        |      ;
    dl Tiles_EggFestival_2                               ;80ACD8|        |99C3F2;
    dw $6000                                                   ;80ACDB|        |      ;
    dl Screen_EggFestival                          ;80ACDD|        |A4DC7E;
 
sRoadSpringMap:
    db $00                                                     ;80ACE0|        |      ;
    dw !AFLAGS_FOR0040|!AFLAGS_UNK0020                                                   
    db $01,$01,$01,$01                                         ;80ACE3|        |      ;
    dw $0000,$0000,$0000,$0000,$2000                           ;80ACE7|        |      ;
    dl Tiles_Road_SpringToFall                               ;80ACF1|        |98CC6B;
    dw $6000                                                   ;80ACF4|        |      ;
    dl Screen_Road                          ;80ACF6|        |A4CFAB;
 
sRoadSummerMap:
    db $00                                                     ;80ACF9|        |      ;
    dw !AFLAGS_FOR0040|!AFLAGS_UNK0020                                                   
    db $01,$01,$01,$01                                         ;80ACFC|        |      ;
    dw $0000,$0000,$0000,$0000,$2000                           ;80AD00|        |      ;
    dl Tiles_Road_SpringToFall                               ;80AD0A|        |98CC6B;
    dw $6000                                                   ;80AD0D|        |      ;
    dl Screen_Road                          ;80AD0F|        |A4CFAB;
 
sRoadFallMap:
    db $00                                                     ;80AD12|        |      ;
    dw !AFLAGS_FOR0040|!AFLAGS_UNK0020                                                   
    db $01,$01,$01,$01                                         ;80AD15|        |      ;
    dw $0000,$0000,$0000,$0000,$2000                           ;80AD19|        |      ;
    dl Tiles_Road_SpringToFall                               ;80AD23|        |98CC6B;
    dw $6000                                                   ;80AD26|        |      ;
    dl Screen_Road                          ;80AD28|        |A4CFAB;
 
sRoadWinterMap:
    db $00                                                     ;80AD2B|        |      ;
    dw !AFLAGS_FOR0040|!AFLAGS_UNK0020                                                   
    db $01,$01,$01,$01                                         ;80AD2E|        |      ;
    dw $0000,$0000,$0000,$0000,$2000                           ;80AD32|        |      ;
    dl Tiles_Road_Winter                               ;80AD3C|        |98E41D;
    dw $6000                                                   ;80AD3F|        |      ;
    dl Screen_Road                          ;80AD41|        |A4CFAB;
 
sMountainSpring:
    db $00                                                     ;80AD44|        |      ;
    dw !AFLAGS_RAWCHARMAP|!AFLAGS_UNK0080|!AFLAGS_FOR0040|!AFLAGS_UNK0020                                                   
    db $04,$04,$03,$01                                         ;80AD47|        |      ;
    dw $0000,$0200,$0000,$0200,$2000                           ;80AD4B|        |      ;
    dl Tiles_Mountain_Spring_0                               ;80AD55|        |9DE7CE;
    dw $3000                                                   ;80AD58|        |      ;
    dl Tiles_Mountain_Spring_1                               ;80AD5A|        |9E8000;
    dw $4000                                                   ;80AD5D|        |      ;
    dl Tiles_Mountain_SpringSummer_2                               ;80AD5F|        |9D8000;
    dw $6000                                                   ;80AD62|        |      ;
    dl ScreenRaw_Mountain                                    ;80AD64|        |A28000;
 
sMountainSummerMap:
    db $00                                                     ;80AD67|        |      ;
    dw !AFLAGS_RAWCHARMAP|!AFLAGS_UNK0080|!AFLAGS_FOR0040|!AFLAGS_UNK0020                                                   
    db $04,$04,$03,$01                                         ;80AD6A|        |      ;
    dw $0000,$0200,$0000,$0200,$2000                           ;80AD6E|        |      ;
    dl Tiles_Mountain_Summer_0                               ;80AD78|        |9CCBA3;
    dw $3000                                                   ;80AD7B|        |      ;
    dl Tiles_Mountain_Summer_1                               ;80AD7D|        |9CE37D;
    dw $4000                                                   ;80AD80|        |      ;
    dl Tiles_Mountain_SpringSummer_2                               ;80AD82|        |9D8000;
    dw $6000                                                   ;80AD85|        |      ;
    dl ScreenRaw_Mountain                                    ;80AD87|        |A28000;
 
sMountainFallMap:
    db $00                                                     ;80AD8A|        |      ;
    dw !AFLAGS_RAWCHARMAP|!AFLAGS_UNK0080|!AFLAGS_FOR0040|!AFLAGS_UNK0020                                                   
    db $04,$04,$03,$01                                         ;80AD8D|        |      ;
    dw $0000,$0200,$0000,$0200,$2000                           ;80AD91|        |      ;
    dl Tiles_Mountain_Fall_0                               ;80AD9B|        |9D991C;
    dw $3000                                                   ;80AD9E|        |      ;
    dl Tiles_Mountain_Fall_1                               ;80ADA0|        |9DB15E;
    dw $4000                                                   ;80ADA3|        |      ;
    dl Tiles_Mountain_Fall_2                               ;80ADA5|        |9DCE31;
    dw $6000                                                   ;80ADA8|        |      ;
    dl ScreenRaw_Mountain                                    ;80ADAA|        |A28000;
 
sMountainWinterMap:
    db $00                                                     ;80ADAD|        |      ;
    dw !AFLAGS_RAWCHARMAP|!AFLAGS_UNK0080|!AFLAGS_FOR0040|!AFLAGS_UNK0020                                                   
    db $04,$04,$03,$01                                         ;80ADB0|        |      ;
    dw $0000,$0200,$0000,$0200,$2000                           ;80ADB4|        |      ;
    dl Tiles_Mountain_Winter_0                               ;80ADBE|        |9E9EDC;
    dw $3000                                                   ;80ADC1|        |      ;
    dl Tiles_Mountain_Winter_1                               ;80ADC3|        |9EB75D;
    dw $4000                                                   ;80ADC6|        |      ;
    dl Tiles_Mountain_Winter_2                               ;80ADC8|        |9ED208;
    dw $6000                                                   ;80ADCB|        |      ;
    dl ScreenRaw_Mountain                                    ;80ADCD|        |A28000;
 
sStarNightFestivalSpaMap:
    db $00                                                     ;80ADD0|        |      ;
    dw !AFLAGS_UNK0080|!AFLAGS_FOR0040|!AFLAGS_UNK0020                                                   
    db $01,$01,$03,$01                                         ;80ADD3|        |      ;
    dw $0000,$0000,$0000,$0000,$2000                           ;80ADD7|        |      ;
    dl Tiles_Mountain_Winter_0                               ;80ADE1|        |9E9EDC;
    dw $3000                                                   ;80ADE4|        |      ;
    dl Tiles_Mountain_Winter_1                               ;80ADE6|        |9EB75D;
    dw $4000                                                   ;80ADE9|        |      ;
    dl Tiles_Mountain_Winter_2                               ;80ADEB|        |9ED208;
    dw $6000                                                   ;80ADEE|        |      ;
    dl Screen_StarNightFestivalSpa                          ;80ADF0|        |A59E0B;
 
sHouseMap:
    db $00                                                     ;80ADF3|        |      ;
    dw !AFLAGS_NONE                                                   
    db $01,$01,$02,$01                                         ;80ADF6|        |      ;
    dw $0000,$0000,$0000,$0000,$2000                           ;80ADFA|        |      ;
    dl Tiles_House_0                               ;80AE04|        |95C000;
    dw $3000                                                   ;80AE07|        |      ;
    dl Tiles_House_1                               ;80AE09|        |95D6E2;
    dw $6000                                                   ;80AE0C|        |      ;
    dl Screen_House                          ;80AE0E|        |A49B84;
 
sHouseUpgrade1Map:
    db $00                                                     ;80AE11|        |      ;
    dw !AFLAGS_NONE                                                   
    db $01,$01,$02,$01                                         ;80AE14|        |      ;
    dw $0000,$0000,$0000,$0000,$2000                           ;80AE18|        |      ;
    dl Tiles_House_0                               ;80AE22|        |95C000;
    dw $3000                                                   ;80AE25|        |      ;
    dl Tiles_House_1                               ;80AE27|        |95D6E2;
    dw $6000                                                   ;80AE2A|        |      ;
    dl Screen_House_Upgrade1                          ;80AE2C|        |A4945C;
 
sHouseUpgrade2Map:
    db $00                                                     ;80AE2F|        |      ;
    dw !AFLAGS_NONE                                                   
    db $02,$01,$02,$01                                         ;80AE32|        |      ;
    dw $0000,$00A0,$0000,$0000,$2000                           ;80AE36|        |      ;
    dl Tiles_House_0                               ;80AE40|        |95C000;
    dw $3000                                                   ;80AE43|        |      ;
    dl Tiles_House_1                               ;80AE45|        |95D6E2;
    dw $6000                                                   ;80AE48|        |      ;
    dl Screen_House_Upgrade2                          ;80AE4A|        |A49745;
 
sMayorHouseMap:
    db $00                                                     ;80AE4D|        |      ;
    dw !AFLAGS_NONE                                                   
    db $02,$02,$01,$01                                         ;80AE50|        |      ;
    dw $0010,$00C0,$0000,$0000,$2000                           ;80AE54|        |      ;
    dl Tiles_MayorHouse                               ;80AE5E|        |95E8A3;
    dw $6000                                                   ;80AE61|        |      ;
    dl Screen_MayorHouse                          ;80AE63|        |A49E2E;
 
sMayorHouseHallMap:
    db $00                                                     ;80AE66|        |      ;
    dw !AFLAGS_NONE                                                   
    db $02,$02,$01,$01                                         ;80AE69|        |      ;
    dw $0100,$0100,$0100,$0100,$2000                           ;80AE6D|        |      ;
    dl Tiles_MayorHouse                               ;80AE77|        |95E8A3;
    dw $6000                                                   ;80AE7A|        |      ;
    dl Screen_MayorHouse                          ;80AE7C|        |A49E2E;
 
sMayorHouseMariaRoomMap:
    db $00                                                     ;80AE7F|        |      ;
    dw !AFLAGS_NONE                                                   
    db $02,$02,$01,$01                                         ;80AE82|        |      ;
    dw $0000,$0000,$0100,$0100,$2000                           ;80AE86|        |      ;
    dl Tiles_MayorHouse                               ;80AE90|        |95E8A3;
    dw $6000                                                   ;80AE93|        |      ;
    dl Screen_MayorHouse                          ;80AE95|        |A49E2E;
 
sChurchMap:
    db $00                                                     ;80AE98|        |      ;
    dw !AFLAGS_NONE                                                   
    db $01,$02,$01,$01                                         ;80AE9B|        |      ;
    dw $0000,$0000,$0000,$0100,$2000                           ;80AE9F|        |      ;
    dl Tiles_Church                               ;80AEA9|        |968000;
    dw $6000                                                   ;80AEAC|        |      ;
    dl Screen_Church                          ;80AEAE|        |A4A597;
 
sFlowerShopMap:
    db $00                                                     ;80AEB1|        |      ;
    dw !AFLAGS_NONE                                                   
    db $01,$02,$01,$01                                         ;80AEB4|        |      ;
    dw $0000,$0000,$0100,$0100,$3000                           ;80AEB8|        |      ;
    dl Tiles_FlowerShop                               ;80AEC2|        |969437;
    dw $6000                                                   ;80AEC5|        |      ;
    dl Screen_FlowerShop                          ;80AEC7|        |A4AA99;
 
sFlowerShopRoomMap:
    db $00                                                     ;80AECA|        |      ;
    dw !AFLAGS_NONE                                                   
    db $01,$02,$01,$01                                         ;80AECD|        |      ;
    dw $0000,$0000,$0000,$0000,$3000                           ;80AED1|        |      ;
    dl Tiles_FlowerShop                               ;80AEDB|        |969437;
    dw $6000                                                   ;80AEDE|        |      ;
    dl Screen_FlowerShop                          ;80AEE0|        |A4AA99;
 
sBarMap:
    db $00                                                     ;80AEE3|        |      ;
    dw !AFLAGS_NONE                                                   
    db $01,$02,$01,$01                                         ;80AEE6|        |      ;
    dw $0000,$0000,$0100,$0100,$3000                           ;80AEEA|        |      ;
    dl Tiles_Bar                               ;80AEF4|        |96AD11;
    dw $6000                                                   ;80AEF7|        |      ;
    dl Screen_Bar                          ;80AEF9|        |A4AE95;
 
sBarRoomMap:
    db $00                                                     ;80AEFC|        |      ;
    dw !AFLAGS_NONE                                                   
    db $01,$02,$01,$01                                         ;80AEFF|        |      ;
    dw $0000,$0000,$0000,$0000,$3000                           ;80AF03|        |      ;
    dl Tiles_Bar                               ;80AF0D|        |96AD11;
    dw $6000                                                   ;80AF10|        |      ;
    dl Screen_Bar                          ;80AF12|        |A4AE95;
 
sRestaurantMap:
    db $00                                                     ;80AF15|        |      ;
    dw !AFLAGS_NONE                                                   
    db $01,$02,$01,$01                                         ;80AF18|        |      ;
    dw $0000,$0000,$0100,$0100,$3000                           ;80AF1C|        |      ;
    dl Tiles_Restaurant                               ;80AF26|        |96C489;
    dw $6000                                                   ;80AF29|        |      ;
    dl Screen_Restaurant                          ;80AF2B|        |A4B3D1;
 
sRestaurantRoomMap:
    db $00                                                     ;80AF2E|        |      ;
    dw !AFLAGS_NONE                                                   
    db $01,$02,$01,$01                                         ;80AF31|        |      ;
    dw $0000,$0000,$0000,$0000,$3000                           ;80AF35|        |      ;
    dl Tiles_Restaurant                               ;80AF3F|        |96C489;
    dw $6000                                                   ;80AF42|        |      ;
    dl Screen_Restaurant                          ;80AF44|        |A4B3D1;
 
sGeneralStoreMap:
    db $00                                                     ;80AF47|        |      ;
    dw !AFLAGS_NONE                                                   
    db $01,$02,$01,$01                                         ;80AF4A|        |      ;
    dw $0000,$0000,$0100,$0100,$3000                           ;80AF4E|        |      ;
    dl Tiles_GeneralStore                               ;80AF58|        |96DC6D;
    dw $6000                                                   ;80AF5B|        |      ;
    dl Screen_GeneralStore                          ;80AF5D|        |A4B8E0;
 
sGeneralStoreRoomMap:
    db $00                                                     ;80AF60|        |      ;
    dw !AFLAGS_NONE                                                   
    db $01,$02,$01,$01                                         ;80AF63|        |      ;
    dw $0000,$0000,$0000,$0000,$3000                           ;80AF67|        |      ;
    dl Tiles_GeneralStore                               ;80AF71|        |96DC6D;
    dw $6000                                                   ;80AF74|        |      ;
    dl Screen_GeneralStore                          ;80AF76|        |A4B8E0;
 
sAnimalShopMap:
    db $00                                                     ;80AF79|        |      ;
    dw !AFLAGS_NONE                                                   
    db $01,$01,$01,$01                                         ;80AF7C|        |      ;
    dw $0000,$0000,$0000,$0000,$3000                           ;80AF80|        |      ;
    dl Tiles_AnimalShop                               ;80AF8A|        |978000;
    dw $6000                                                   ;80AF8D|        |      ;
    dl Screen_AnimalShop                          ;80AF8F|        |A4BCC1;
 
sFortuneTellerHouseMap:
    db $00                                                     ;80AF92|        |      ;
    dw !AFLAGS_NONE                                                   
    db $01,$01,$01,$01                                         ;80AF95|        |      ;
    dw $0000,$0000,$0000,$0000,$3000                           ;80AF99|        |      ;
    dl Tiles_FortuneTellerHouse                               ;80AFA3|        |979A88;
    dw $6000                                                   ;80AFA6|        |      ;
    dl Screen_FortuneTellerHouse                          ;80AFA8|        |A4C065;
 
sToolShedMap:
    db $02                                                     ;80AFAB|        |      ;
    dw !AFLAGS_NONE                                                   
    db $01,$01,$02,$02                                         ;80AFAE|        |      ;
    dw $0000,$0000,$0000,$0000,$2000                           ;80AFB2|        |      ;
    dl Tiles_ToolShed_0                               ;80AFBC|        |9AE02D;
    dw $3000                                                   ;80AFBF|        |      ;
    dl Tiles_ToolShed_1                               ;80AFC1|        |9B8000;
    dw $7000                                                   ;80AFC4|        |      ;
    dl Screen_ToolShed_Layer2                          ;80AFC6|        |A59C08;
    dw $6000                                                   ;80AFC9|        |      ;
    dl Screen_ToolShed                          ;80AFCB|        |A58B49;
 
sBarnMap:
    db $00                                                     ;80AFCE|        |      ;
    dw !AFLAGS_NONE                                                   
    db $01,$02,$01,$01                                         ;80AFD1|        |      ;
    dw $0000,$0000,$0000,$00A0,$2000                           ;80AFD5|        |      ;
    dl Tiles_BarnCoop                               ;80AFDF|        |9CA40C;
    dw $6000                                                   ;80AFE2|        |      ;
    dl Screen_Barn                          ;80AFE4|        |A5C4CD;
 
sCoopMap:
    db $00                                                     ;80AFE7|        |      ;
    dw !AFLAGS_NONE                                                   
    db $01,$01,$01,$01                                         ;80AFEA|        |      ;
    dw $0000,$0000,$0000,$0000,$2000                           ;80AFEE|        |      ;
    dl Tiles_BarnCoop                               ;80AFF8|        |9CA40C;
    dw $6000                                                   ;80AFFB|        |      ;
    dl Screen_Coop                          ;80AFFD|        |A5C258;
 
sMountainCaveMap:
    db $00                                                     ;80B000|        |      ;
    dw !AFLAGS_UNK0020                                                   
    db $02,$02,$01,$01                                         ;80B003|        |      ;
    dw $0000,$0100,$0000,$0100,$2000                           ;80B007|        |      ;
    dl Tiles_MountainCave                               ;80B011|        |948000;
    dw $6000                                                   ;80B014|        |      ;
    dl Screen_MountainCave                          ;80B016|        |A48A2D;
 
sElfTunnelMap:
    db $00                                                     ;80B019|        |      ;
    dw !AFLAGS_UNK0020                                                   
    db $01,$03,$01,$01                                         ;80B01C|        |      ;
    dw $0000,$0000,$0000,$0200,$2000                           ;80B020|        |      ;
    dl Tiles_MountainCave                               ;80B02A|        |948000;
    dw $6000                                                   ;80B02D|        |      ;
    dl Screen_ElfTunnel                          ;80B02F|        |A481AE;
 
sMap_80B032:
    db $00                                                     ;80B032|        |      ;
    dw !AFLAGS_NONE                                                   
    db $01,$01,$01,$01                                         ;80B035|        |      ;
    dw $0000,$0000,$0000,$0000,$2000                           ;80B039|        |      ;
    dl Tiles_WorksmanHouse                               ;80B043|        |9B9F53;
    dw $6000                                                   ;80B046|        |      ;
    dl Screen_WorksmanHouse                          ;80B048|        |A5B63B;
 
sMap_80B04B:
    db $00                                                     ;80B04B|        |      ;
    dw !AFLAGS_NONE                                                   
    db $01,$03,$01,$01                                         ;80B04E|        |      ;
    dw $0000,$0000,$0000,$0200,$2000                           ;80B052|        |      ;
    dl Tiles_GoldChicken                               ;80B05C|        |9B86AD;
    dw $6000                                                   ;80B05F|        |      ;
    dl Screen_GoldChicken                          ;80B061|        |A5A6A0;
 
sMap_80B064:
    db $00                                                     ;80B064|        |      ;
    dw !AFLAGS_NONE                                                   
    db $01,$02,$03,$01                                         ;80B067|        |      ;
    dw $0000,$0000,$0000,$0100,$2000                           ;80B06B|        |      ;
    dl Tiles_Town_SpringToFall_0                               ;80B075|        |97B45F;
    dw $3000                                                   ;80B078|        |      ;
    dl Tiles_Town_Spring_1                               ;80B07A|        |998000;
    dw $4000                                                   ;80B07D|        |      ;
    dl Tiles_Town_Spring_2                               ;80B07F|        |999A74;
    dw $6000                                                   ;80B082|        |      ;
    dl ScreenRaw_Town                                    ;80B084|        |A38000;
 
sMap_80B087:
    db $00                                                     ;80B087|        |      ;
    dw !AFLAGS_NONE                                                   
    db $01,$02,$03,$01                                         ;80B08A|        |      ;
    dw $0000,$0000,$0000,$0100,$2000                           ;80B08E|        |      ;
    dl Tiles_Town_SpringToFall_0                               ;80B098|        |97B45F;
    dw $3000                                                   ;80B09B|        |      ;
    dl Tiles_Town_Summer_1                               ;80B09D|        |97CD20;
    dw $4000                                                   ;80B0A0|        |      ;
    dl Tiles_Town_Summer_2                               ;80B0A2|        |97E7A2;
    dw $6000                                                   ;80B0A5|        |      ;
    dl ScreenRaw_Town                                    ;80B0A7|        |A38000;
 
sMap_80B0AA:
    db $00                                                     ;80B0AA|        |      ;
    dw !AFLAGS_NONE                                                   
    db $01,$02,$03,$01                                         ;80B0AD|        |      ;
    dw $0000,$0000,$0000,$0100,$2000                           ;80B0B1|        |      ;
    dl Tiles_Town_SpringToFall_0                               ;80B0BB|        |97B45F;
    dw $3000                                                   ;80B0BE|        |      ;
    dl Tiles_Town_Fall_1                               ;80B0C0|        |988000;
    dw $4000                                                   ;80B0C3|        |      ;
    dl Tiles_Town_Fall_2                               ;80B0C5|        |989A52;
    dw $6000                                                   ;80B0C8|        |      ;
    dl ScreenRaw_Town                                    ;80B0CA|        |A38000;
 
sMap_80B0CD:
    db $00                                                     ;80B0CD|        |      ;
    dw !AFLAGS_NONE                                                   
    db $01,$02,$03,$01                                         ;80B0D0|        |      ;
    dw $0000,$0000,$0000,$0100,$2000                           ;80B0D4|        |      ;
    dl Tiles_Town_Winter_0                               ;80B0DE|        |99DCBD;
    dw $3000                                                   ;80B0E1|        |      ;
    dl Tiles_Town_Winter_1                               ;80B0E3|        |9A8000;
    dw $4000                                                   ;80B0E6|        |      ;
    dl Tiles_Town_Winter_2                               ;80B0E8|        |9A9921;
    dw $6000                                                   ;80B0EB|        |      ;
    dl ScreenRaw_Town                                    ;80B0ED|        |A38000;
 
sSummitSpringMap:
    db $01                                                     ;80B0F0|        |      ;
    dw !AFLAGS_UNK0020                                                   
    db $01,$02,$02,$02                                         ;80B0F3|        |      ;
    dw $0000,$0000,$0000,$0100,$2000                           ;80B0F7|        |      ;
    dl Tiles_Summit_SpringToFall_0                               ;80B101|        |9BB76D;
    dw $3000                                                   ;80B104|        |      ;
    dl Tiles_Summit_SpringToFall_1                               ;80B106|        |9C8000;
    dw $6000                                                   ;80B109|        |      ;
    dl Screen_Summit                          ;80B10B|        |A5B943;
    dw $7000                                                   ;80B10E|        |      ;
    dl Screen_Summit_Layer2                          ;80B110|        |A5AD17;
 
sSummitSummerMap:
    db $01                                                     ;80B113|        |      ;
    dw !AFLAGS_UNK0020                                                   
    db $01,$02,$02,$02                                         ;80B116|        |      ;
    dw $0000,$0000,$0000,$0100,$2000                           ;80B11A|        |      ;
    dl Tiles_Summit_SpringToFall_0                               ;80B124|        |9BB76D;
    dw $3000                                                   ;80B127|        |      ;
    dl Tiles_Summit_SpringToFall_1                               ;80B129|        |9C8000;
    dw $6000                                                   ;80B12C|        |      ;
    dl Screen_Summit                          ;80B12E|        |A5B943;
    dw $7000                                                   ;80B131|        |      ;
    dl Screen_Summit_Layer2                          ;80B133|        |A5AD17;
 
sSummitFallMap:
    db $01                                                     ;80B136|        |      ;
    dw !AFLAGS_UNK0020                                                   
    db $01,$02,$02,$02                                         ;80B139|        |      ;
    dw $0000,$0000,$0000,$0100,$2000                           ;80B13D|        |      ;
    dl Tiles_Summit_SpringToFall_0                               ;80B147|        |9BB76D;
    dw $3000                                                   ;80B14A|        |      ;
    dl Tiles_Summit_SpringToFall_1                               ;80B14C|        |9C8000;
    dw $6000                                                   ;80B14F|        |      ;
    dl Screen_Summit                          ;80B151|        |A5B943;
    dw $7000                                                   ;80B154|        |      ;
    dl Screen_Summit_Layer2                          ;80B156|        |A5AD17;
 
sSummitWinterMap:
    db $01                                                     ;80B159|        |      ;
    dw !AFLAGS_UNK0020                                                   
    db $01,$02,$02,$02                                         ;80B15C|        |      ;
    dw $0000,$0000,$0000,$0100,$2000                           ;80B160|        |      ;
    dl Tiles_Summit_Winter_0                               ;80B16A|        |9BCF8F;
    dw $3000                                                   ;80B16D|        |      ;
    dl Tiles_Summit_Winter_1                               ;80B16F|        |9C965F;
    dw $6000                                                   ;80B172|        |      ;
    dl Screen_Summit                          ;80B174|        |A5B943;
    dw $7000                                                   ;80B177|        |      ;
    dl Screen_Summit_Layer2                          ;80B179|        |A5AD17;
 
sMap_80B17C:
    db $01                                                     ;80B17C|        |      ;
    dw !AFLAGS_UNK0020                                                   
    db $01,$02,$02,$02                                         ;80B17F|        |      ;
    dw $0000,$0000,$0000,$0100,$2000                           ;80B183|        |      ;
    dl Tiles_Summit_SpringToFall_0                               ;80B18D|        |9BB76D;
    dw $3000                                                   ;80B190|        |      ;
    dl Tiles_Summit_SpringToFall_1                               ;80B192|        |9C8000;
    dw $6000                                                   ;80B195|        |      ;
    dl Screen_Summit                          ;80B197|        |A5B943;
    dw $7000                                                   ;80B19A|        |      ;
    dl Screen_MountainTop2_Layer2                          ;80B19C|        |A5B042;
 
sMap_80B19F:
    db $01                                                     ;80B19F|        |      ;
    dw !AFLAGS_UNK0020                                                   
    db $01,$02,$02,$02                                         ;80B1A2|        |      ;
    dw $0000,$0000,$0000,$0100,$2000                           ;80B1A6|        |      ;
    dl Tiles_Summit_SpringToFall_0                               ;80B1B0|        |9BB76D;
    dw $3000                                                   ;80B1B3|        |      ;
    dl Tiles_Summit_SpringToFall_1                               ;80B1B5|        |9C8000;
    dw $6000                                                   ;80B1B8|        |      ;
    dl Screen_Summit                          ;80B1BA|        |A5B943;
    dw $7000                                                   ;80B1BD|        |      ;
    dl Screen_MountainTop2_Layer2                          ;80B1BF|        |A5B042;
 
sMap_80B1C2:
    db $01                                                     ;80B1C2|        |      ;
    dw !AFLAGS_UNK0020                                                   
    db $01,$02,$02,$02                                         ;80B1C5|        |      ;
    dw $0000,$0000,$0000,$0100,$2000                           ;80B1C9|        |      ;
    dl Tiles_Summit_SpringToFall_0                               ;80B1D3|        |9BB76D;
    dw $3000                                                   ;80B1D6|        |      ;
    dl Tiles_Summit_SpringToFall_1                               ;80B1D8|        |9C8000;
    dw $7000                                                   ;80B1DB|        |      ;
    dl Screen_MountainTop2_Layer2                          ;80B1DD|        |A5B042;
    dw $6000                                                   ;80B1E0|        |      ;
    dl Screen_Summit                          ;80B1E2|        |A5B943;
 
sMap_80B1E5:
    db $01                                                     ;80B1E5|        |      ;
    dw !AFLAGS_UNK0020                                                   
    db $01,$02,$02,$02                                         ;80B1E8|        |      ;
    dw $0000,$0000,$0000,$0100,$2000                           ;80B1EC|        |      ;
    dl Tiles_Summit_Winter_0                               ;80B1F6|        |9BCF8F;
    dw $3000                                                   ;80B1F9|        |      ;
    dl Tiles_Summit_Winter_1                               ;80B1FB|        |9C965F;
    dw $6000                                                   ;80B1FE|        |      ;
    dl Screen_Summit                          ;80B200|        |A5B943;
    dw $7000                                                   ;80B203|        |      ;
    dl Screen_MountainTop2_Layer2                          ;80B205|        |A5B042;
 
sStarNightFestivalMountainTopMap:
    db $01                                                     ;80B208|        |      ;
    dw !AFLAGS_UNK0020                                                   
    db $01,$02,$02,$02                                         ;80B20B|        |      ;
    dw $0000,$0000,$0000,$0100,$2000                           ;80B20F|        |      ;
    dl Tiles_Summit_Winter_0                               ;80B219|        |9BCF8F;
    dw $3000                                                   ;80B21C|        |      ;
    dl Tiles_Summit_Winter_1                               ;80B21E|        |9C965F;
    dw $6000                                                   ;80B221|        |      ;
    dl Screen_Summit                          ;80B223|        |A5B943;
    dw $7000                                                   ;80B226|        |      ;
    dl Screen_StarNightFestivalMountainTop_Layer2                          ;80B228|        |A5B361;
 
sNewYearsFestivalMap:
    db $01                                                     ;80B22B|        |      ;
    dw !AFLAGS_UNK0020                                                   
    db $01,$02,$02,$02                                         ;80B22E|        |      ;
    dw $0000,$0000,$0000,$0100,$2000                           ;80B232|        |      ;
    dl Tiles_Summit_SpringToFall_0                               ;80B23C|        |9BB76D;
    dw $3000                                                   ;80B23F|        |      ;
    dl Tiles_Summit_SpringToFall_1                               ;80B241|        |9C8000;
    dw $6000                                                   ;80B244|        |      ;
    dl Screen_Summit                          ;80B246|        |A5B943;
    dw $7000                                                   ;80B249|        |      ;
    dl Screen_Summit_Layer2                          ;80B24B|        |A5AD17;
 
sMap_80B24E:
    db $01                                                     ;80B24E|        |      ;
    dw !AFLAGS_UNK0020                                                   
    db $01,$02,$02,$02                                         ;80B251|        |      ;
    dw $0000,$0000,$0000,$0100,$2000                           ;80B255|        |      ;
    dl Tiles_Summit_SpringToFall_0                               ;80B25F|        |9BB76D;
    dw $3000                                                   ;80B262|        |      ;
    dl Tiles_Summit_SpringToFall_1                               ;80B264|        |9C8000;
    dw $6000                                                   ;80B267|        |      ;
    dl Screen_MountainTopBean                               ;80B269|        |A5BD8A;
    dw $7000                                                   ;80B26C|        |      ;
    dl Screen_Summit_Layer2                          ;80B26E|        |A5AD17;
 
sMap_80B271:
    db $00                                                     ;80B271|        |      ;
    dw !AFLAGS_NONE                                                   
    db $01,$01,$01,$01                                         ;80B274|        |      ;
    dw $0000,$0000,$0000,$0000,$2000                           ;80B278|        |      ;
    dl Tiles_Road_SpringToFall                               ;80B282|        |98CC6B;
    dw $6000                                                   ;80B285|        |      ;
    dl Screen_Intro                          ;80B287|        |A68DCF;
 
sMap_80B28A:
    db $00                                                     ;80B28A|        |      ;
    dw !AFLAGS_NONE                                                   
    db $01,$01,$03,$01                                         ;80B28D|        |      ;
    dw $0000,$0000,$0000,$0000,$2000                           ;80B291|        |      ;
    dl Tiles_Farm_SpringSummer_0                               ;80B29B|        |92D3AB;
    dw $3000                                                   ;80B29E|        |      ;
    dl Tiles_Farm_SpringSummer_1                               ;80B2A0|        |938000;
    dw $4000                                                   ;80B2A3|        |      ;
    dl Tiles_Farm_SpringSummer_2                               ;80B2A5|        |939E8E;
    dw $6000                                                   ;80B2A8|        |      ;
    dl Screen_Ending00                          ;80B2AA|        |A5E253;
 
sMap_80B2AD:
    db $00                                                     ;80B2AD|        |      ;
    dw !AFLAGS_NONE                                                   
    db $01,$01,$03,$01                                         ;80B2B0|        |      ;
    dw $0000,$0000,$0000,$0000,$2000                           ;80B2B4|        |      ;
    dl Tiles_Farm_SpringSummer_0                               ;80B2BE|        |92D3AB;
    dw $3000                                                   ;80B2C1|        |      ;
    dl Tiles_Farm_SpringSummer_1                               ;80B2C3|        |938000;
    dw $4000                                                   ;80B2C6|        |      ;
    dl Tiles_Farm_SpringSummer_2                               ;80B2C8|        |939E8E;
    dw $6000                                                   ;80B2CB|        |      ;
    dl Screen_Ending01                          ;80B2CD|        |A5E5CE;
 
sMap_80B2D0:
    db $00                                                     ;80B2D0|        |      ;
    dw !AFLAGS_NONE                                                   
    db $01,$01,$03,$01                                         ;80B2D3|        |      ;
    dw $0000,$0000,$0000,$0000,$2000                           ;80B2D7|        |      ;
    dl Tiles_Farm_SpringSummer_0                               ;80B2E1|        |92D3AB;
    dw $3000                                                   ;80B2E4|        |      ;
    dl Tiles_Farm_SpringSummer_1                               ;80B2E6|        |938000;
    dw $4000                                                   ;80B2E9|        |      ;
    dl Tiles_Farm_SpringSummer_2                               ;80B2EB|        |939E8E;
    dw $6000                                                   ;80B2EE|        |      ;
    dl Screen_Ending02                          ;80B2F0|        |A5E977;
 
sMap_80B2F3:
    db $00                                                     ;80B2F3|        |      ;
    dw !AFLAGS_NONE                                                   
    db $01,$01,$03,$01                                         ;80B2F6|        |      ;
    dw $0000,$0000,$0000,$0000,$2000                           ;80B2FA|        |      ;
    dl Tiles_Farm_SpringSummer_0                               ;80B304|        |92D3AB;
    dw $3000                                                   ;80B307|        |      ;
    dl Tiles_Farm_SpringSummer_1                               ;80B309|        |938000;
    dw $4000                                                   ;80B30C|        |      ;
    dl Tiles_Farm_SpringSummer_2                               ;80B30E|        |939E8E;
    dw $6000                                                   ;80B311|        |      ;
    dl Screen_Ending03                          ;80B313|        |A5ECFB;
 
sMap_80B316:
    db $00                                                     ;80B316|        |      ;
    dw !AFLAGS_NONE                                                   
    db $01,$01,$03,$01                                         ;80B319|        |      ;
    dw $0000,$0000,$0000,$0000,$2000                           ;80B31D|        |      ;
    dl Tiles_Farm_SpringSummer_0                               ;80B327|        |92D3AB;
    dw $3000                                                   ;80B32A|        |      ;
    dl Tiles_Farm_SpringSummer_1                               ;80B32C|        |938000;
    dw $4000                                                   ;80B32F|        |      ;
    dl Tiles_Farm_SpringSummer_2                               ;80B331|        |939E8E;
    dw $6000                                                   ;80B334|        |      ;
    dl Screen_Ending04                          ;80B336|        |A5F671;
 
sMap_80B339:
    db $00                                                     ;80B339|        |      ;
    dw !AFLAGS_NONE                                                   
    db $01,$01,$03,$01                                         ;80B33C|        |      ;
    dw $0000,$0000,$0000,$0000,$2000                           ;80B340|        |      ;
    dl Tiles_Town_SpringToFall_0                               ;80B34A|        |97B45F;
    dw $3000                                                   ;80B34D|        |      ;
    dl Tiles_Town_Summer_1                               ;80B34F|        |97CD20;
    dw $4000                                                   ;80B352|        |      ;
    dl Tiles_Town_Summer_2                               ;80B354|        |97E7A2;
    dw $6000                                                   ;80B357|        |      ;
    dl Screen_Ending05                          ;80B359|        |A5F95C;
 
sMap_80B35C:
    db $00                                                     ;80B35C|        |      ;
    dw !AFLAGS_NONE                                                   
    db $01,$01,$03,$01                                         ;80B35F|        |      ;
    dw $0000,$0000,$0000,$0000,$2000                           ;80B363|        |      ;
    dl Tiles_Farm_SpringSummer_0                               ;80B36D|        |92D3AB;
    dw $3000                                                   ;80B370|        |      ;
    dl Tiles_Farm_SpringSummer_1                               ;80B372|        |938000;
    dw $4000                                                   ;80B375|        |      ;
    dl Tiles_Farm_SpringSummer_2                               ;80B377|        |939E8E;
    dw $6000                                                   ;80B37A|        |      ;
    dl Screen_Ending06                          ;80B37C|        |A5FBCE;
 
sMap_80B37F:
    db $00                                                     ;80B37F|        |      ;
    dw !AFLAGS_NONE                                                   
    db $01,$01,$03,$01                                         ;80B382|        |      ;
    dw $0000,$0000,$0000,$0000,$2000                           ;80B386|        |      ;
    dl Tiles_Farm_SpringSummer_0                               ;80B390|        |92D3AB;
    dw $3000                                                   ;80B393|        |      ;
    dl Tiles_Farm_SpringSummer_1                               ;80B395|        |938000;
    dw $4000                                                   ;80B398|        |      ;
    dl Tiles_Farm_SpringSummer_2                               ;80B39A|        |939E8E;
    dw $6000                                                   ;80B39D|        |      ;
    dl Screen_Ending07                          ;80B39F|        |A68000;
 
sMap_80B3A2:
    db $00                                                     ;80B3A2|        |      ;
    dw !AFLAGS_NONE                                                   
    db $01,$01,$03,$01                                         ;80B3A5|        |      ;
    dw $0000,$0000,$0000,$0000,$2000                           ;80B3A9|        |      ;
    dl Tiles_Farm_SpringSummer_0                               ;80B3B3|        |92D3AB;
    dw $3000                                                   ;80B3B6|        |      ;
    dl Tiles_Farm_SpringSummer_1                               ;80B3B8|        |938000;
    dw $4000                                                   ;80B3BB|        |      ;
    dl Tiles_Farm_SpringSummer_2                               ;80B3BD|        |939E8E;
    dw $6000                                                   ;80B3C0|        |      ;
    dl Screen_Ending08                          ;80B3C2|        |A68229;
 
sMap_80B3C5:
    db $00                                                     ;80B3C5|        |      ;
    dw !AFLAGS_NONE                                                   
    db $01,$01,$03,$01                                         ;80B3C8|        |      ;
    dw $0000,$0000,$0000,$0000,$2000                           ;80B3CC|        |      ;
    dl Tiles_Farm_SpringSummer_0                               ;80B3D6|        |92D3AB;
    dw $3000                                                   ;80B3D9|        |      ;
    dl Tiles_Farm_SpringSummer_1                               ;80B3DB|        |938000;
    dw $4000                                                   ;80B3DE|        |      ;
    dl Tiles_Farm_SpringSummer_2                               ;80B3E0|        |939E8E;
    dw $6000                                                   ;80B3E3|        |      ;
    dl Screen_Ending09                          ;80B3E5|        |A68433;
 
sMap_80B3E8:
    db $00                                                     ;80B3E8|        |      ;
    dw !AFLAGS_NONE                                                   
    db $01,$01,$03,$01                                         ;80B3EB|        |      ;
    dw $0000,$0000,$0000,$0000,$2000                           ;80B3EF|        |      ;
    dl Tiles_Farm_SpringSummer_0                               ;80B3F9|        |92D3AB;
    dw $3000                                                   ;80B3FC|        |      ;
    dl Tiles_Farm_SpringSummer_1                               ;80B3FE|        |938000;
    dw $4000                                                   ;80B401|        |      ;
    dl Tiles_Farm_SpringSummer_2                               ;80B403|        |939E8E;
    dw $6000                                                   ;80B406|        |      ;
    dl Screen_Ending10                          ;80B408|        |A6867E;
 
sMap_80B40B:
    db $00                                                     ;80B40B|        |      ;
    dw !AFLAGS_NONE                                                   
    db $01,$01,$03,$01                                         ;80B40E|        |      ;
    dw $0000,$0000,$0000,$0000,$2000                           ;80B412|        |      ;
    dl Tiles_Mountain_Summer_0                               ;80B41C|        |9CCBA3;
    dw $3000                                                   ;80B41F|        |      ;
    dl Tiles_Mountain_Summer_1                               ;80B421|        |9CE37D;
    dw $4000                                                   ;80B424|        |      ;
    dl Tiles_Mountain_SpringSummer_2                               ;80B426|        |9D8000;
    dw $6000                                                   ;80B429|        |      ;
    dl Screen_Ending11                          ;80B42B|        |A68864;
 
sMap_80B42E:
    db $00                                                     ;80B42E|        |      ;
    dw !AFLAGS_NONE                                                   
    db $01,$01,$03,$01                                         ;80B431|        |      ;
    dw $0000,$0000,$0000,$0000,$2000                           ;80B435|        |      ;
    dl Tiles_Farm_SpringSummer_0                               ;80B43F|        |92D3AB;
    dw $3000                                                   ;80B442|        |      ;
    dl Tiles_Farm_SpringSummer_1                               ;80B444|        |938000;
    dw $4000                                                   ;80B447|        |      ;
    dl Tiles_Farm_SpringSummer_2                               ;80B449|        |939E8E;
    dw $6000                                                   ;80B44C|        |      ;
    dl Screen_Ending12                          ;80B44E|        |A5F059;
 
sMap_80B451:
    db $00                                                     ;80B451|        |      ;
    dw !AFLAGS_NONE                                                   
    db $01,$01,$03,$01                                         ;80B454|        |      ;
    dw $0000,$0000,$0000,$0000,$2000                           ;80B458|        |      ;
    dl Tiles_Farm_SpringSummer_0                               ;80B462|        |92D3AB;
    dw $3000                                                   ;80B465|        |      ;
    dl Tiles_Farm_SpringSummer_1                               ;80B467|        |938000;
    dw $4000                                                   ;80B46A|        |      ;
    dl Tiles_Farm_SpringSummer_2                               ;80B46C|        |939E8E;
    dw $6000                                                   ;80B46F|        |      ;
    dl Screen_Ending13                          ;80B471|        |A5F45A;
 
sMap_80B474:
    db $05                                                     ;80B474|        |      ;
    dw !AFLAGS_NONE                                                   
    db $02,$02,$04,$01                                         ;80B477|        |      ;
    dw $0000,$0100,$0000,$0100,$2000                           ;80B47B|        |      ;
    dl Tiles_Credits_0                               ;80B485|        |9EEB3D;
    dw $3000                                                   ;80B488|        |      ;
    dl Tiles_Credits_1                               ;80B48A|        |A08000;
    dw $4000                                                   ;80B48D|        |      ;
    dl Tiles_Credits_2                               ;80B48F|        |A088E9;
    dw $5000                                                   ;80B492|        |      ;
    dl Tiles_Credits_3                               ;80B494|        |A09232;
    dw $6000                                                   ;80B497|        |      ;
    dl Screen_Credits_0to3                          ;80B499|        |A690A6;
 
sMap_80B49C:
    db $05                                                     ;80B49C|        |      ;
    dw !AFLAGS_NONE                                                   
    db $02,$02,$04,$01                                         ;80B49F|        |      ;
    dw $0000,$0100,$0000,$0100,$2000                           ;80B4A3|        |      ;
    dl Tiles_Credits_0                               ;80B4AD|        |9EEB3D;
    dw $3000                                                   ;80B4B0|        |      ;
    dl Tiles_Credits_1                               ;80B4B2|        |A08000;
    dw $4000                                                   ;80B4B5|        |      ;
    dl Tiles_Credits_2                               ;80B4B7|        |A088E9;
    dw $5000                                                   ;80B4BA|        |      ;
    dl Tiles_Credits_3                               ;80B4BC|        |A09232;
    dw $6000                                                   ;80B4BF|        |      ;
    dl Screen_Credits_0to3                          ;80B4C1|        |A690A6;
 
sMap_80B4C4:
    db $05                                                     ;80B4C4|        |      ;
    dw !AFLAGS_NONE                                                   
    db $02,$02,$04,$01                                         ;80B4C7|        |      ;
    dw $0000,$0100,$0000,$0100,$2000                           ;80B4CB|        |      ;
    dl Tiles_Credits_0                               ;80B4D5|        |9EEB3D;
    dw $3000                                                   ;80B4D8|        |      ;
    dl Tiles_Credits_1                               ;80B4DA|        |A08000;
    dw $4000                                                   ;80B4DD|        |      ;
    dl Tiles_Credits_2                               ;80B4DF|        |A088E9;
    dw $5000                                                   ;80B4E2|        |      ;
    dl Tiles_Credits_3                               ;80B4E4|        |A09232;
    dw $6000                                                   ;80B4E7|        |      ;
    dl Screen_Credits_0to3                          ;80B4E9|        |A690A6;
 
sMap_80B4EC:
    db $05                                                     ;80B4EC|        |      ;
    dw !AFLAGS_NONE                                                   
    db $02,$02,$04,$01                                         ;80B4EF|        |      ;
    dw $0000,$0100,$0000,$0100,$2000                           ;80B4F3|        |      ;
    dl Tiles_Credits_0                               ;80B4FD|        |9EEB3D;
    dw $3000                                                   ;80B500|        |      ;
    dl Tiles_Credits_1                               ;80B502|        |A08000;
    dw $4000                                                   ;80B505|        |      ;
    dl Tiles_Credits_2                               ;80B507|        |A088E9;
    dw $5000                                                   ;80B50A|        |      ;
    dl Tiles_Credits_3                               ;80B50C|        |A09232;
    dw $6000                                                   ;80B50F|        |      ;
    dl Screen_Credits_0to3                          ;80B511|        |A690A6;
 
sMap_80B514:
    db $05                                                     ;80B514|        |      ;
    dw !AFLAGS_NONE                                                   
    db $02,$02,$03,$01                                         ;80B517|        |      ;
    dw $0000,$0100,$0000,$0100,$2000                           ;80B51B|        |      ;
    dl Tiles_Credits_0                               ;80B525|        |9EEB3D;
    dw $3000                                                   ;80B528|        |      ;
    dl Tiles_Credits_1                               ;80B52A|        |A08000;
    dw $4000                                                   ;80B52D|        |      ;
    dl Tiles_Credits_2                               ;80B52F|        |A088E9;
    dw $6000                                                   ;80B532|        |      ;
    dl Screen_Credits4_DriveToTown                          ;80B534|        |A694EE;
 
sMap_80B537:
    db $05                                                     ;80B537|        |      ;
    dw !AFLAGS_NONE                                                   
    db $02,$02,$04,$01                                         ;80B53A|        |      ;
    dw $0000,$0100,$0000,$0100,$2000                           ;80B53E|        |      ;
    dl Tiles_Credits_0                               ;80B548|        |9EEB3D;
    dw $3000                                                   ;80B54B|        |      ;
    dl Tiles_Credits_1                               ;80B54D|        |A08000;
    dw $4000                                                   ;80B550|        |      ;
    dl Tiles_Credits_2                               ;80B552|        |A088E9;
    dw $5000                                                   ;80B555|        |      ;
    dl Tiles_DriveToTown_3                               ;80B557|        |A0E682;
    dw $6000                                                   ;80B55A|        |      ;
    dl Screen_Credits4_DriveToTown                          ;80B55C|        |A694EE;
 
sMap_80B55F:
    db $05                                                     ;80B55F|        |      ;
    dw !AFLAGS_NONE                                                   
    db $02,$02,$04,$01                                         ;80B562|        |      ;
    dw $0000,$0100,$0000,$0100,$2000                           ;80B566|        |      ;
    dl Tiles_Credits_0                               ;80B570|        |9EEB3D;
    dw $3000                                                   ;80B573|        |      ;
    dl Tiles_Credits_1                               ;80B575|        |A08000;
    dw $4000                                                   ;80B578|        |      ;
    dl Tiles_Credits_2                               ;80B57A|        |A088E9;
    dw $5000                                                   ;80B57D|        |      ;
    dl Tiles_Unk51_3                               ;80B57F|        |A0AB1E;
    dw $6000                                                   ;80B582|        |      ;
    dl Screen_Credits4_DriveToTown                          ;80B584|        |A694EE;
 
sMap_80B587:
    db $05                                                     ;80B587|        |      ;
    dw !AFLAGS_NONE                                                   
    db $02,$02,$04,$01                                         ;80B58A|        |      ;
    dw $0000,$0100,$0000,$0100,$2000                           ;80B58E|        |      ;
    dl Tiles_Credits_0                               ;80B598|        |9EEB3D;
    dw $3000                                                   ;80B59B|        |      ;
    dl Tiles_Credits_1                               ;80B59D|        |A08000;
    dw $4000                                                   ;80B5A0|        |      ;
    dl Tiles_Credits_2                               ;80B5A2|        |A088E9;
    dw $5000                                                   ;80B5A5|        |      ;
    dl Tiles_Credits_3                               ;80B5A7|        |A09232;
    dw $6000                                                   ;80B5AA|        |      ;
    dl Screen_Credits4_DriveToTown                          ;80B5AC|        |A694EE;
 
sMap_80B5AF:
    db $05                                                     ;80B5AF|        |      ;
    dw !AFLAGS_NONE                                                   
    db $02,$02,$03,$01                                         ;80B5B2|        |      ;
    dw $0000,$0100,$0000,$0100,$2000                           ;80B5B6|        |      ;
    dl Tiles_Credits_0                               ;80B5C0|        |9EEB3D;
    dw $3000                                                   ;80B5C3|        |      ;
    dl Tiles_Credits_1                               ;80B5C5|        |A08000;
    dw $4000                                                   ;80B5C8|        |      ;
    dl Tiles_Credits_2                               ;80B5CA|        |A088E9;
    dw $6000                                                   ;80B5CD|        |      ;
    dl Screen_Unk53to56                          ;80B5CF|        |A69996;
 
sMap_80B5D2:
    db $05                                                     ;80B5D2|        |      ;
    dw !AFLAGS_NONE                                                   
    db $02,$02,$03,$01                                         ;80B5D5|        |      ;
    dw $0000,$0100,$0000,$0100,$2000                           ;80B5D9|        |      ;
    dl Tiles_Credits_0                               ;80B5E3|        |9EEB3D;
    dw $3000                                                   ;80B5E6|        |      ;
    dl Tiles_Credits_1                               ;80B5E8|        |A08000;
    dw $4000                                                   ;80B5EB|        |      ;
    dl Tiles_Credits_2                               ;80B5ED|        |A088E9;
    dw $6000                                                   ;80B5F0|        |      ;
    dl Screen_Unk53to56                          ;80B5F2|        |A69996;
 
sMap_80B5F5:
    db $05                                                     ;80B5F5|        |      ;
    dw !AFLAGS_NONE                                                   
    db $02,$02,$03,$01                                         ;80B5F8|        |      ;
    dw $0000,$0100,$0000,$0100,$2000                           ;80B5FC|        |      ;
    dl Tiles_Credits_0                               ;80B606|        |9EEB3D;
    dw $3000                                                   ;80B609|        |      ;
    dl Tiles_Credits_1                               ;80B60B|        |A08000;
    dw $4000                                                   ;80B60E|        |      ;
    dl Tiles_Credits_2                               ;80B610|        |A088E9;
    dw $6000                                                   ;80B613|        |      ;
    dl Screen_Unk53to56                          ;80B615|        |A69996;
 
sMap_80B618:
    db $05                                                     ;80B618|        |      ;
    dw !AFLAGS_NONE                                                   
    db $02,$02,$04,$01                                         ;80B61B|        |      ;
    dw $0000,$0100,$0000,$0100,$2000                           ;80B61F|        |      ;
    dl Tiles_Credits_0                               ;80B629|        |9EEB3D;
    dw $3000                                                   ;80B62C|        |      ;
    dl Tiles_Credits_1                               ;80B62E|        |A08000;
    dw $4000                                                   ;80B631|        |      ;
    dl Tiles_Credits_2                               ;80B633|        |A088E9;
    dw $5000                                                   ;80B636|        |      ;
    dl Tiles_Unk56_3                               ;80B638|        |A0CAAF;
    dw $6000                                                   ;80B63B|        |      ;
    dl Screen_Unk53to56                          ;80B63D|        |A69996;
 
sRainOverlay:
    db $01,$02,$01,$01                                         ;80B640|        |      ;
    dw $5000                                                   ;80B644|        |      ;
    dl Tiles_Overlay_Rain                               ;80B646|        |928000;
    dw $7000                                                   ;80B649|        |      ;
    dl Screen_Overlay_Rain                          ;80B64B|        |A48000;
 
sCloudsOverlay:
    db $01,$02,$01,$01                                         ;80B64E|        |      ;
    dw $5000                                                   ;80B652|        |      ;
    dl Tiles_Overlay_Clouds                               ;80B654|        |97B11A;
    dw $7000                                                   ;80B657|        |      ;
    dl Screen_Overlay_Clouds                          ;80B659|        |A4C3E2;
 
sSnowOverlay:
    db $01,$02,$01,$01                                         ;80B65C|        |      ;
    dw $5000                                                   ;80B660|        |      ;
    dl Tiles_Overlay_Snow                               ;80B662|        |9E9C6D;
    dw $7000                                                   ;80B665|        |      ;
    dl Screen_Overlay_Snow                          ;80B667|        |A5C955;
 
sHeavySnowOverlay:
    db $01,$02,$01,$01                                         ;80B66A|        |      ;
    dw $5000                                                   ;80B66E|        |      ;
    dl Tiles_Overlay_HeavySnow                               ;80B670|        |9B8441;
    dw $7000                                                   ;80B673|        |      ;
    dl Screen_Overlay_HeavySnow                          ;80B675|        |A5A3D5;
 
sIntroFarmScrool:
    db $02,$02,$04,$02                                         ;80B678|        |      ;
    dw $2000                                                   ;80B67C|        |      ;
    dl Tiles_IntroFarmScroll_0                               ;80B67E|        |9F8000;
    dw $3000                                                   ;80B681|        |      ;
    dl Tiles_IntroFarmScroll_1                               ;80B683|        |9F946C;
    dw $4000                                                   ;80B686|        |      ;
    dl Tiles_IntroFarmScroll_2                               ;80B688|        |9FAA75;
    dw $5000                                                   ;80B68B|        |      ;
    dl Tiles_IntroFarmScroll_3                               ;80B68D|        |9FC04C;
    dw $6000                                                   ;80B690|        |      ;
    dl Screen_IntroFarmScroll_BG1                          ;80B692|        |A5CD88;
    dw $7000                                                   ;80B695|        |      ;
    dl Screen_IntroFarmScroll_BG2                          ;80B697|        |A5D44C;
 
sHarvestMoonLogo:
    db $02,$02,$00,$01                                         ;80B69A|        |      ;
    dw $6000                                                   ;80B69E|        |      ;
    dl Screen_Title_HarvestMoonLogo                          ;80B6A0|        |A5D94A;
 
sNatsumeLogo:
    db $02,$02,$01,$01                                         ;80B6A3|        |      ;
    dw $2000                                                   ;80B6A7|        |      ;
    dl Tiles_NatsumeLogo                               ;80B6A9|        |9FEF97;
    dw $6000                                                   ;80B6AC|        |      ;
    dl Screen_Title_NatsumeLogo                          ;80B6AE|        |A5DE84;
 
sMenuScreenBackgrounds:
    db $02,$02,$04,$02                                         ;80B6B1|        |      ;
    dw $2000                                                   ;80B6B5|        |      ;
    dl Tiles_Menu_0                               ;80B6B7|        |9ABF97;
    dw $3000                                                   ;80B6BA|        |      ;
    dl Tiles_Menu_1                               ;80B6BC|        |9AC489;
    dw $4000                                                   ;80B6BF|        |      ;
    dl Tiles_Menu_2                               ;80B6C1|        |9ACB41;
    dw $5000                                                   ;80B6C4|        |      ;
    dl Tiles_Menu_3                               ;80B6C6|        |9AD357;
    dw $1000                                                   ;80B6C9|        |      ;
    dl Screen_Menu_Backgrounds                          ;80B6CB|        |A58000;
    dw $6000                                                   ;80B6CE|        |      ;
    dl Screen_Menu_BackgroundPattern                          ;80B6D0|        |A5970F;
 
sMenuCharacters:
    db $02,$02,$04,$02                                         ;80B6D3|        |      ;
    dw $2000                                                   ;80B6D7|        |      ;
    dl Tiles_Menu_0                               ;80B6D9|        |9ABF97;
    dw $3000                                                   ;80B6DC|        |      ;
    dl Tiles_Menu_1                               ;80B6DE|        |9AC489;
    dw $4000                                                   ;80B6E1|        |      ;
    dl Tiles_Menu_2                               ;80B6E3|        |9ACB41;
    dw $5000                                                   ;80B6E6|        |      ;
    dl Tiles_Menu_3                               ;80B6E8|        |9AD357;
    dw $1000                                                   ;80B6EB|        |      ;
    dl Screen_Menu_Characters                          ;80B6ED|        |A58D8E;
    dw $6000                                                   ;80B6F0|        |      ;
    dl Screen_Menu_BackgroundPattern                          ;80B6F2|        |A5970F;
 
aScreenTransitionTable:
    db $0C,$00,$00,$01                                         ;80B6F5|        |      ; 0x3B * [n8 nTransitionDestination, n8 nUnknown, n8 nIndex0xCF, n8 nFlags, n16 nDestX, n16 nDestY]
    dw $00E8,$0080                                             ;80B6F9|        |      ;
    db $15,$01,$0D,$00                                         ;80B6FD|        |      ;
    dw $0080,$00C8                                             ;80B701|        |      ;
    db $16,$01,$0D,$00                                         ;80B705|        |      ;
    dw $0080,$00C8                                             ;80B709|        |      ;
    db $17,$01,$0D,$00                                         ;80B70D|        |      ;
    dw $0080,$00C8                                             ;80B711|        |      ;
    db $27,$01,$0E,$00                                         ;80B715|        |      ;
    dw $0080,$0168                                             ;80B719|        |      ;
    db $28,$01,$0F,$00                                         ;80B71D|        |      ;
    dw $0080,$00C8                                             ;80B721|        |      ;
    db $26,$01,$10,$00                                         ;80B725|        |      ;
    dw $0080,$00C8                                             ;80B729|        |      ;
    db $2A,$00,$00,$00                                         ;80B72D|        |      ;
    dw $0090,$0290                                             ;80B731|        |      ;
    db $2A,$00,$00,$00                                         ;80B735|        |      ;
    dw $00B0,$0160                                             ;80B739|        |      ;
    db $00,$00,$00,$81                                         ;80B73D|        |      ;
    dw $0088,$0158                                             ;80B741|        |      ;
    db $00,$00,$00,$01                                         ;80B745|        |      ;
    dw $01A8,$01E8                                             ;80B749|        |      ;
    db $2A,$00,$23,$00                                         ;80B74D|        |      ;
    dw $0060,$0098                                             ;80B751|        |      ;
    db $00,$00,$00,$01                                         ;80B755|        |      ;
    dw $0148,$0168                                             ;80B759|        |      ;
    db $00,$00,$00,$01                                         ;80B75D|        |      ;
    dw $01C8,$0168                                             ;80B761|        |      ;
    db $00,$02,$00,$01                                         ;80B765|        |      ;
    dw $0018,$01C0                                             ;80B769|        |      ;
    db $04,$03,$00,$01                                         ;80B76D|        |      ;
    dw $02E8,$01A8                                             ;80B771|        |      ;
    db $10,$01,$00,$01                                         ;80B775|        |      ;
    dw $0148,$02D8                                             ;80B779|        |      ;
    db $0C,$02,$00,$01                                         ;80B77D|        |      ;
    dw $0018,$0080                                             ;80B781|        |      ;
    db $18,$01,$14,$22                                         ;80B785|        |      ;
    dw $0080,$00A8                                             ;80B789|        |      ;
    db $1B,$01,$15,$02                                         ;80B78D|        |      ;
    dw $0080,$01C8                                             ;80B791|        |      ;
    db $1C,$01,$16,$32                                         ;80B795|        |      ;
    dw $0090,$01C8                                             ;80B799|        |      ;
    db $1E,$01,$17,$24                                         ;80B79D|        |      ;
    dw $0090,$01C8                                             ;80B7A1|        |      ;
    db $20,$01,$18,$32                                         ;80B7A5|        |      ;
    dw $0090,$01C8                                             ;80B7A9|        |      ;
    db $22,$01,$19,$32                                         ;80B7AD|        |      ;
    dw $0090,$01C8                                             ;80B7B1|        |      ;
    db $24,$01,$1A,$32                                         ;80B7B5|        |      ;
    dw $0080,$00C8                                             ;80B7B9|        |      ;
    db $24,$00,$00,$32                                         ;80B7BD|        |      ;
    dw $0058,$0048                                             ;80B7C1|        |      ;
    db $25,$01,$1B,$32                                         ;80B7C5|        |      ;
    dw $0080,$00C8                                             ;80B7C9|        |      ;
    db $0C,$00,$00,$01                                         ;80B7CD|        |      ;
    dw $0080,$0018                                             ;80B7D1|        |      ;
    db $2B,$01,$13,$32                                         ;80B7D5|        |      ;
    dw $0080,$00C8                                             ;80B7D9|        |      ;
    db $29,$01,$00,$00                                         ;80B7DD|        |      ;
    dw $0178,$0080                                             ;80B7E1|        |      ;
    db $29,$05,$00,$00                                         ;80B7E5|        |      ;
    dw $00C8,$0188                                             ;80B7E9|        |      ;
    db $31,$01,$00,$41                                         ;80B7ED|        |      ;
    dw $0080,$01C8                                             ;80B7F1|        |      ;
    db $10,$00,$00,$01                                         ;80B7F5|        |      ;
    dw $00A8,$01A8                                             ;80B7F9|        |      ;
    db $10,$00,$00,$01                                         ;80B7FD|        |      ;
    dw $0188,$0018                                             ;80B801|        |      ;
    db $10,$00,$00,$01                                         ;80B805|        |      ;
    dw $0208,$0228                                             ;80B809|        |      ;
    db $04,$00,$00,$01                                         ;80B80D|        |      ;
    dw $0098,$0098                                             ;80B811|        |      ;
    db $19,$01,$1C,$00                                         ;80B815|        |      ;
    dw $01B0,$0198                                             ;80B819|        |      ;
    db $18,$00,$00,$00                                         ;80B81D|        |      ;
    dw $0098,$0048                                             ;80B821|        |      ;
    db $1A,$00,$00,$00                                         ;80B825|        |      ;
    dw $0098,$0158                                             ;80B829|        |      ;
    db $19,$01,$1D,$00                                         ;80B82D|        |      ;
    dw $0150,$0198                                             ;80B831|        |      ;
    db $04,$00,$00,$01                                         ;80B835|        |      ;
    dw $0170,$0098                                             ;80B839|        |      ;
    db $04,$00,$00,$01                                         ;80B83D|        |      ;
    dw $0258,$00E8                                             ;80B841|        |      ;
    db $1D,$01,$1E,$00                                         ;80B845|        |      ;
    dw $0068,$00B8                                             ;80B849|        |      ;
    db $1C,$00,$00,$00                                         ;80B84D|        |      ;
    dw $0068,$0148                                             ;80B851|        |      ;
    db $04,$00,$00,$01                                         ;80B855|        |      ;
    dw $0258,$0378                                             ;80B859|        |      ;
    db $04,$01,$1F,$01                                         ;80B85D|        |      ;
    dw $0248,$0328                                             ;80B861|        |      ;
    db $04,$00,$00,$01                                         ;80B865|        |      ;
    dw $0118,$0368                                             ;80B869|        |      ;
    db $21,$01,$20,$00                                         ;80B86D|        |      ;
    dw $0068,$00C8                                             ;80B871|        |      ;
    db $20,$00,$00,$00                                         ;80B875|        |      ;
    dw $0068,$0148                                             ;80B879|        |      ;
    db $04,$00,$00,$01                                         ;80B87D|        |      ;
    dw $0198,$0368                                             ;80B881|        |      ;
    db $23,$01,$21,$00                                         ;80B885|        |      ;
    dw $0068,$00B8                                             ;80B889|        |      ;
    db $22,$00,$00,$00                                         ;80B88D|        |      ;
    dw $0068,$0148                                             ;80B891|        |      ;
    db $04,$00,$00,$01                                         ;80B895|        |      ;
    dw $0098,$0368                                             ;80B899|        |      ;
    db $1F,$01,$22,$00                                         ;80B89D|        |      ;
    dw $0088,$00C8                                             ;80B8A1|        |      ;
    db $1E,$00,$00,$00                                         ;80B8A5|        |      ;
    dw $0088,$0148                                             ;80B8A9|        |      ;
    db $04,$00,$00,$01                                         ;80B8AD|        |      ;
    dw $0248,$0268                                             ;80B8B1|        |      ;
    db $26,$00,$00,$00                                         ;80B8B5|        |      ;
    dw $0078,$0048                                             ;80B8B9|        |      ;
    db $00,$00,$00,$01                                         ;80B8BD|        |      ;
    dw $0328,$0358                                             ;80B8C1|        |      ;
    db $04,$03,$00,$01                                         ;80B8C5|        |      ;
    dw $0268,$0168                                             ;80B8C9|        |      ;
