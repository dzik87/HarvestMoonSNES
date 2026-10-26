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
    BCS .readMapSize                                                ;80A7E2|B02E    |80A812;
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
    BEQ .skipPresetBytes                                                ;80A801|F00B    |80A80E;
    REP #$30                                                   ;80A803|C230    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;80A805|AD9601  |000196;
    AND.W #$FFDF                                               ;80A808|29DFFF  |      ;
    STA.W strcDialogDisplay.mapFlags                           ;80A80B|8D9601  |000196;
 
.skipPresetBytes:
    REP #$30                                                   ;80A80E|C230    |      ;
    INY                                                        ;80A810|C8      |      ;
    INY                                                        ;80A811|C8      |      ;
 
.readMapSize:
    SEP #$20                                                   ;80A812|E220    |      ;
    LDA.B (strcMap.pCurrent),Y                                 ;80A814|B118    |000018; Y = 3
    STA.W strcDialogDisplay.mapMultiWidth                      ;80A816|8D8101  |000181;
    INY                                                        ;80A819|C8      |      ;
    LDA.B (strcMap.pCurrent),Y                                 ;80A81A|B118    |000018; Y = 4
    STA.W strcDialogDisplay.mapMultiHeight                     ;80A81C|8D8201  |000182;
    CMP.B #$03                                                 ;80A81F|C903    |      ;
    BCC .readLayerCounts                                                ;80A821|900B    |80A82E;
    REP #$20                                                   ;80A823|C220    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;80A825|AD9601  |000196;
    ORA.W #$0001                                               ;80A828|090100  |      ;
    STA.W strcDialogDisplay.mapFlags                           ;80A82B|8D9601  |000196;
 
.readLayerCounts:
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
    BCS .checkTilemapCount                                                ;80A83F|B01A    |80A85B;
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
 
.checkTilemapCount:
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
    BNE .copyRawCharmap                                                ;80A8E9|D006    |80A8F1;
    JSL.L fGraphicsDecompressTilemap                           ;80A8EB|22F88183|8381F8;
    BRA .afterCharmap                                                ;80A8EF|8010    |80A901;
 
 
.copyRawCharmap:
    REP #$30                                                   ;80A8F1|C230    |      ;
    LDY.W #$0000                                               ;80A8F3|A00000  |      ;
 
.loop:
    LDA.B [ptrTemp0x72],Y                                      ;80A8F6|B772    |000072;
    STA.B [ptrUnknown0x75],Y                                   ;80A8F8|9775    |000075;
    INY                                                        ;80A8FA|C8      |      ;
    INY                                                        ;80A8FB|C8      |      ;
    CPY.W #$8000                                               ;80A8FC|C00080  |      ;
    BNE .loop                                                  ;80A8FF|D0F5    |80A8F6;
 
.afterCharmap:
    SEP #$20                                                   ;80A901|E220    |      ;
    LDA.B strcMap.loadAreaId                                   ;80A903|A522    |000022;
    CMP.B #!AREA_TOWNSPRING                                                 
    BCS .loadFarm                                              ;80A907|B004    |80A90D;
    JSL.L fObjectMap_ConnectAdjacentObjectTiles                                      ;80A909|2200AF82|82AF00;
 
.loadFarm:
    SEP #$20                                                   ;80A90D|E220    |      ;
    LDA.B strcVariables.n8Temp2                                ;80A90F|A593    |000093;
    CMP.B #$01                                                 ;80A911|C901    |      ;
    BNE .resetCamera                                               ;80A913|D00F    |80A924;
    REP #$30                                                   ;80A915|C230    |      ;
    %CheckFlag(daily3, $0002)
    BNE .resetCamera                                               ;80A91E|D004    |80A924;
    JSL.L fItemSubrutineHandler_81A9E5                         ;80A920|22E5A981|81A9E5;
 
.resetCamera:
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
 
.uploadRowLoop:
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
    BCS .uploadAltRow                                               ;80A993|B007    |80A99C;
    LDY.B strcVariables.n16Unk8A                               ;80A995|A48A    |00008A;
    CPY.W #$7000                                               ;80A997|C00070  |      ;
    BEQ .advanceRow                                               ;80A99A|F006    |80A9A2;
 
.uploadAltRow:
    LDY.W #$0040                                               ;80A99C|A04000  |      ;
    JSR.W fTileMap_UploadRowToVRAM                               ;80A99F|2038AA  |80AA38;
 
.advanceRow:
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
    BNE .uploadRowLoop                                               ;80A9B9|D0BC    |80A977;
    SEP #$20                                                   ;80A9BB|E220    |      ;
    LDA.B strcMap.loadAreaId                                   ;80A9BD|A522    |000022;
    CMP.B #$5B                                                 ;80A9BF|C95B    |      ;
    BCS .advanceVramRow                                               ;80A9C1|B007    |80A9CA;
    LDY.B strcVariables.n16Unk8A                               ;80A9C3|A48A    |00008A;
    CPY.W #$7000                                               ;80A9C5|C00070  |      ;
    BEQ .nextCopyPass                                               ;80A9C8|F008    |80A9D2;
 
.advanceVramRow:
    REP #$20                                                   ;80A9CA|C220    |      ;
    TXA                                                        ;80A9CC|8A      |      ;
    CLC                                                        ;80A9CD|18      |      ;
    ADC.W #$0400                                               ;80A9CE|690004  |      ;
    TAX                                                        ;80A9D1|AA      |      ;
 
.nextCopyPass:
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

; Area graphics data (generated from assets/areas/ and assets/tables/, see docs/formats/area-data.md)
    incsrc "../../../build/gen/tables/map_room.asm"
    incsrc "../../../build/gen/maps/area_gfx.asm"
    incsrc "../../../build/gen/maps/screen_transitions.asm"
