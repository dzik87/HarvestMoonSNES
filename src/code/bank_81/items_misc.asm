; Bank $81 module "items_misc" - starts at $8196AF
 
    incsrc "../../../build/gen/blocks/carried_items.asm"
 
fObjectSlots_UpdateAll:
    REP #$30                                                   ;81A383|C230    |      ;
    LDA.W #$B4E6                                               ;81A385|A9E6B4  |      ;
    STA.B ptrUnknown0x07                                       ;81A388|8507    |000007;
    SEP #$20                                                   ;81A38A|E220    |      ;
    LDA.B #$7E                                                 ;81A38C|A97E    |      ;
    STA.B ptrUnknown0x07+2                                     ;81A38E|8509    |000009; $72 = 0x7EB4E6
    LDX.W #$0000                                               ;81A390|A20000  |      ;
 
.loop:
    PHX                                                        ;81A393|DA      |      ;
    SEP #$20                                                   ;81A394|E220    |      ;
    LDA.B [ptrUnknown0x07]                                     ;81A396|A707    |000007;
    AND.B #$01                                                 ;81A398|2901    |      ;
    BNE +                                                      ;81A39A|D003    |81A39F;
    JMP.W .caseFFFD                                            ;81A39C|4CB2A4  |81A4B2;
 
 
  + SEP #$20                                                   ;81A39F|E220    |      ;
    LDY.W #$0000                                               ;81A3A1|A00000  |      ;
    LDA.B [ptrUnknown0x07],Y                                   ;81A3A4|B707    |000007;
    STA.W $0974+!RAM_SHIFT                                 ;81A3A6|8D7409  |000974;
    LDY.W #$0001                                               ;81A3A9|A00100  |      ;
    LDA.B [ptrUnknown0x07],Y                                   ;81A3AC|B707    |000007;
    STA.W $0975+!RAM_SHIFT                                 ;81A3AE|8D7509  |000975;
    LDY.W #$0002                                               ;81A3B1|A00200  |      ;
    LDA.B [ptrUnknown0x07],Y                                   ;81A3B4|B707    |000007;
    STA.W $0976+!RAM_SHIFT                                 ;81A3B6|8D7609  |000976;
    LDY.W #$0003                                               ;81A3B9|A00300  |      ;
    LDA.B [ptrUnknown0x07],Y                                   ;81A3BC|B707    |000007;
    STA.W nCarriedItemId                                       ;81A3BE|8D8409  |000984;
    REP #$20                                                   ;81A3C1|C220    |      ;
    LDY.W #$0004                                               ;81A3C3|A00400  |      ;
    LDA.B [ptrUnknown0x07],Y                                   ;81A3C6|B707    |000007;
    STA.W nGameObjectIdx                                       ;81A3C8|8D7809  |000978;
    STA.B strcObject.gameObjectIdx                             ;81A3CB|85A5    |0000A5;
    LDY.W #$0006                                               ;81A3CD|A00600  |      ;
    LDA.B [ptrUnknown0x07],Y                                   ;81A3D0|B707    |000007;
    STA.W $097A+!RAM_SHIFT                                 ;81A3D2|8D7A09  |00097A;
    LDY.W #$0008                                               ;81A3D5|A00800  |      ;
    LDA.B [ptrUnknown0x07],Y                                   ;81A3D8|B707    |000007;
    STA.W $097C+!RAM_SHIFT                                 ;81A3DA|8D7C09  |00097C;
    LDY.W #$000A                                               ;81A3DD|A00A00  |      ;
    LDA.B [ptrUnknown0x07],Y                                   ;81A3E0|B707    |000007;
    STA.W $097E+!RAM_SHIFT                                 ;81A3E2|8D7E09  |00097E;
    LDY.W #$000C                                               ;81A3E5|A00C00  |      ;
    LDA.B [ptrUnknown0x07],Y                                   ;81A3E8|B707    |000007;
    STA.W nUnknownX                                            ;81A3EA|8D8009  |000980;
    LDY.W #$000E                                               ;81A3ED|A00E00  |      ;
    LDA.B [ptrUnknown0x07],Y                                   ;81A3F0|B707    |000007;
    STA.W nUnknownY                                            ;81A3F2|8D8209  |000982;
    JSL.L fObject_GetSingleObjectData                          ;81A3F5|22CB8185|8581CB;
    REP #$20                                                   ;81A3F9|C220    |      ;
    LDA.B strcObject.exists                                    ;81A3FB|A5A7    |0000A7;
    CMP.W #$FFFD                                               ;81A3FD|C9FDFF  |      ;
    BNE +                                                      ;81A400|D003    |81A405;
    JMP.W .allOther                                            ;81A402|4C19A4  |81A419;
 
 
  + CMP.W #$FFFF                                               ;81A405|C9FFFF  |      ;
    BEQ .caseFFFF                                              ;81A408|F027    |81A431;
    SEP #$20                                                   ;81A40A|E220    |      ;
    LDA.W $0974+!RAM_SHIFT                                 ;81A40C|AD7409  |000974;
    AND.B #$04                                                 ;81A40F|2904    |      ;
    BNE +                                                      ;81A411|D004    |81A417;
    JML.L .caseFFFD                                            ;81A413|5CB2A481|81A4B2;
 
 
  + BRA .caseFFFF                                              ;81A417|8018    |81A431;
 
 
.allOther:
    REP #$20                                                   ;81A419|C220    |      ;
    LDA.W nGameObjectIdx                                       ;81A41B|AD7809  |000978;
    STA.B strcObject.gameObjectIdx                             ;81A41E|85A5    |0000A5;
    JSL.L fObject_Destroy                                ;81A420|22A28185|8581A2;
    SEP #$20                                                   ;81A424|E220    |      ;
    LDA.W $0974+!RAM_SHIFT                                 ;81A426|AD7409  |000974;
    AND.B #$02                                                 ;81A429|2902    |      ;
    BEQ .caseFFFF                                              ;81A42B|F004    |81A431;
    JSL.L fObjectSlots_FreeCurrent                                      ;81A42D|22F1A481|81A4F1;
 
.caseFFFF:
    SEP #$20                                                   ;81A431|E220    |      ;
    LDA.B #$00                                                 ;81A433|A900    |      ;
    XBA                                                        ;81A435|EB      |      ;
    LDY.W #$0001                                               ;81A436|A00100  |      ;
    LDA.B [ptrUnknown0x07],Y                                   ;81A439|B707    |000007;
    REP #$20                                                   ;81A43B|C220    |      ;
    ASL A                                                      ;81A43D|0A      |      ;
    TAX                                                        ;81A43E|AA      |      ;
    CPX.W #$0000                                               ;81A43F|E00000  |      ;
    BEQ .caseFFFD                                              ;81A442|F06E    |81A4B2;
    JSR.W (pItemCarriedSlotHandlerTable,X)                           ;81A444|FC8BA5  |81A58B;
    SEP #$20                                                   ;81A447|E220    |      ;
    LDY.W #$0000                                               ;81A449|A00000  |      ;
    LDA.W $0974+!RAM_SHIFT                                 ;81A44C|AD7409  |000974;
    STA.B [ptrUnknown0x07],Y                                   ;81A44F|9707    |000007;
    LDY.W #$0002                                               ;81A451|A00200  |      ;
    LDA.W $0976+!RAM_SHIFT                                 ;81A454|AD7609  |000976;
    STA.B [ptrUnknown0x07],Y                                   ;81A457|9707    |000007;
    LDY.W #$0003                                               ;81A459|A00300  |      ;
    LDA.W nCarriedItemId                                       ;81A45C|AD8409  |000984;
    STA.B [ptrUnknown0x07],Y                                   ;81A45F|9707    |000007;
    REP #$20                                                   ;81A461|C220    |      ;
    LDY.W #$0004                                               ;81A463|A00400  |      ;
    LDA.W nGameObjectIdx                                       ;81A466|AD7809  |000978;
    STA.B [ptrUnknown0x07],Y                                   ;81A469|9707    |000007;
    STA.B strcObject.gameObjectIdx                             ;81A46B|85A5    |0000A5;
    LDY.W #$0006                                               ;81A46D|A00600  |      ;
    LDA.W $097A+!RAM_SHIFT                                 ;81A470|AD7A09  |00097A;
    STA.B [ptrUnknown0x07],Y                                   ;81A473|9707    |000007;
    LDY.W #$0008                                               ;81A475|A00800  |      ;
    LDA.W $097C+!RAM_SHIFT                                 ;81A478|AD7C09  |00097C;
    STA.B [ptrUnknown0x07],Y                                   ;81A47B|9707    |000007;
    LDY.W #$000A                                               ;81A47D|A00A00  |      ;
    LDA.W $097E+!RAM_SHIFT                                 ;81A480|AD7E09  |00097E;
    STA.B [ptrUnknown0x07],Y                                   ;81A483|9707    |000007;
    STA.B strcObject.flip                                      ;81A485|859F    |00009F;
    LDY.W #$000C                                               ;81A487|A00C00  |      ;
    LDA.W nUnknownX                                            ;81A48A|AD8009  |000980;
    STA.B [ptrUnknown0x07],Y                                   ;81A48D|9707    |000007;
    STA.B strcObject.posX                                      ;81A48F|859B    |00009B;
    LDY.W #$000E                                               ;81A491|A00E00  |      ;
    LDA.W nUnknownY                                            ;81A494|AD8209  |000982;
    STA.B [ptrUnknown0x07],Y                                   ;81A497|9707    |000007;
    STA.B strcObject.posY                                      ;81A499|859D    |00009D;
    JSL.L fObject_UpdatePositionAndFlip                                ;81A49B|22B98085|8580B9;
    LDA.W $097A+!RAM_SHIFT                                 ;81A49F|AD7A09  |00097A;
    CMP.W $097C+!RAM_SHIFT                                 ;81A4A2|CD7C09  |00097C;
    BEQ .caseFFFD                                              ;81A4A5|F00B    |81A4B2;
    STA.B strcObject.spriteTableIdx                            ;81A4A7|85A1    |0000A1;
    LDY.W #$0008                                               ;81A4A9|A00800  |      ;
    STA.B [ptrUnknown0x07],Y                                   ;81A4AC|9707    |000007;
    JSL.L fObject_Replace                                ;81A4AE|22008185|858100;
 
.caseFFFD:
    REP #$30                                                   ;81A4B2|C230    |      ;
    PLX                                                        ;81A4B4|FA      |      ;
    LDA.B ptrUnknown0x07                                       ;81A4B5|A507    |000007;
    CLC                                                        ;81A4B7|18      |      ;
    ADC.W #$0010                                               ;81A4B8|691000  |      ;
    STA.B ptrUnknown0x07                                       ;81A4BB|8507    |000007;
    INX                                                        ;81A4BD|E8      |      ;
    CPX.W #$000A                                               ;81A4BE|E00A00  |      ;
    BEQ +                                                      ;81A4C1|F003    |81A4C6;
    JMP.W .loop                                                ;81A4C3|4C93A3  |81A393;
 
 
  + RTL                                                        ;81A4C6|6B      |      ;
 
 
fObjectSlots_ClearAll:
    REP #$30                                                   ;81A4C7|C230    |      ;
    LDA.W #$B4E6                                               ;81A4C9|A9E6B4  |      ;
    STA.B ptrUnknown0x07                                       ;81A4CC|8507    |000007;
    SEP #$20                                                   ;81A4CE|E220    |      ;
    LDA.B #$7E                                                 ;81A4D0|A97E    |      ;
    STA.B ptrUnknown0x07+2                                     ;81A4D2|8509    |000009;
    LDX.W #$0000                                               ;81A4D4|A20000  |      ;
 
  - SEP #$20                                                   ;81A4D7|E220    |      ;
    LDY.W #$0000                                               ;81A4D9|A00000  |      ;
    LDA.B #$00                                                 ;81A4DC|A900    |      ;
    STA.B [ptrUnknown0x07],Y                                   ;81A4DE|9707    |000007;
    REP #$20                                                   ;81A4E0|C220    |      ;
    LDA.B ptrUnknown0x07                                       ;81A4E2|A507    |000007;
    CLC                                                        ;81A4E4|18      |      ;
    ADC.W #$0010                                               ;81A4E5|691000  |      ;
    STA.B ptrUnknown0x07                                       ;81A4E8|8507    |000007;
    INX                                                        ;81A4EA|E8      |      ;
    CPX.W #$000A                                               ;81A4EB|E00A00  |      ;
    BNE -                                                      ;81A4EE|D0E7    |81A4D7;
    RTL                                                        ;81A4F0|6B      |      ;
 
 
fObjectSlots_FreeCurrent:
    SEP #$20                                                   ;81A4F1|E220    |      ;
    REP #$10                                                   ;81A4F3|C210    |      ;
    LDY.W #$0000                                               ;81A4F5|A00000  |      ;
    LDA.B #$00                                                 ;81A4F8|A900    |      ;
    STA.B [ptrUnknown0x07],Y                                   ;81A4FA|9707    |000007;
    STZ.W $0974+!RAM_SHIFT                                 ;81A4FC|9C7409  |000974;
    RTL                                                        ;81A4FF|6B      |      ;
 
 
fObjectSlots_Allocate:
    REP #$30                                                   ;81A500|C230    |      ;
    LDA.W #$B4E6                                               ;81A502|A9E6B4  |      ;
    STA.B ptrUnknown0x07                                       ;81A505|8507    |000007;
    SEP #$20                                                   ;81A507|E220    |      ;
    LDA.B #$7E                                                 ;81A509|A97E    |      ;
    STA.B ptrUnknown0x07+2                                     ;81A50B|8509    |000009;
    LDX.W #$0000                                               ;81A50D|A20000  |      ;
 
  - SEP #$20                                                   ;81A510|E220    |      ;
    LDA.B [ptrUnknown0x07]                                     ;81A512|A707    |000007;
    AND.B #$01                                                 ;81A514|2901    |      ;
    BEQ +                                                      ;81A516|F012    |81A52A;
    REP #$20                                                   ;81A518|C220    |      ;
    LDA.B ptrUnknown0x07                                       ;81A51A|A507    |000007;
    CLC                                                        ;81A51C|18      |      ;
    ADC.W #$0010                                               ;81A51D|691000  |      ;
    STA.B ptrUnknown0x07                                       ;81A520|8507    |000007;
    INX                                                        ;81A522|E8      |      ;
    CPX.W #$000A                                               ;81A523|E00A00  |      ;
    BNE -                                                      ;81A526|D0E8    |81A510;
 
.deadEnd:
    BRA .deadEnd                                               ;81A528|80FE    |81A528; infinite loop ? why ?
 
 
  + SEP #$20                                                   ;81A52A|E220    |      ;
    LDY.W #$0000                                               ;81A52C|A00000  |      ;
    LDA.W $0974+!RAM_SHIFT                                 ;81A52F|AD7409  |000974;
    STA.B [ptrUnknown0x07],Y                                   ;81A532|9707    |000007;
    LDY.W #$0001                                               ;81A534|A00100  |      ;
    LDA.W $0975+!RAM_SHIFT                                 ;81A537|AD7509  |000975;
    STA.B [ptrUnknown0x07],Y                                   ;81A53A|9707    |000007;
    LDY.W #$0002                                               ;81A53C|A00200  |      ;
    LDA.W $0976+!RAM_SHIFT                                 ;81A53F|AD7609  |000976;
    STA.B [ptrUnknown0x07],Y                                   ;81A542|9707    |000007;
    LDY.W #$0003                                               ;81A544|A00300  |      ;
    LDA.W nCarriedItemId                                       ;81A547|AD8409  |000984;
    STA.B [ptrUnknown0x07],Y                                   ;81A54A|9707    |000007;
    REP #$20                                                   ;81A54C|C220    |      ;
    LDY.W #$0006                                               ;81A54E|A00600  |      ;
    LDA.W $097A+!RAM_SHIFT                                 ;81A551|AD7A09  |00097A;
    STA.B [ptrUnknown0x07],Y                                   ;81A554|9707    |000007;
    LDY.W #$0008                                               ;81A556|A00800  |      ;
    STA.B [ptrUnknown0x07],Y                                   ;81A559|9707    |000007;
    STA.B strcObject.spriteTableIdx                            ;81A55B|85A1    |0000A1;
    LDY.W #$000A                                               ;81A55D|A00A00  |      ;
    LDA.W $097E+!RAM_SHIFT                                 ;81A560|AD7E09  |00097E;
    STA.B [ptrUnknown0x07],Y                                   ;81A563|9707    |000007;
    STA.B strcObject.flip                                      ;81A565|859F    |00009F;
    LDY.W #$000C                                               ;81A567|A00C00  |      ;
    LDA.W nUnknownX                                            ;81A56A|AD8009  |000980;
    STA.B [ptrUnknown0x07],Y                                   ;81A56D|9707    |000007;
    STA.B strcObject.posX                                      ;81A56F|859B    |00009B;
    LDY.W #$000E                                               ;81A571|A00E00  |      ;
    LDA.W nUnknownY                                            ;81A574|AD8209  |000982;
    STA.B [ptrUnknown0x07],Y                                   ;81A577|9707    |000007;
    STA.B strcObject.posY                                      ;81A579|859D    |00009D;
    STZ.B strcObject.unkA3                                     ;81A57B|64A3    |0000A3;
    JSL.L fObject_Create                                      ;81A57D|22008085|858000;
    REP #$30                                                   ;81A581|C230    |      ;
    LDY.W #$0004                                               ;81A583|A00400  |      ;
    LDA.B strcObject.gameObjectIdx                             ;81A586|A5A5    |0000A5;
    STA.B [ptrUnknown0x07],Y                                   ;81A588|9707    |000007;
    RTL                                                        ;81A58A|6B      |      ;
 
 
pItemCarriedSlotHandlerTable:
    dw $FFFF                                                   ;81A58B|        |      ;
    dw fItemCarried_RunHandler                                   ;81A58D|        |81809A;
 
fPlayer_LeaveSnowFootprint:
    SEP #$20                                                   ;81A58F|E220    |      ;
    REP #$10                                                   ;81A591|C210    |      ;
    LDA.L nCurrentSeasonID                                     ;81A593|AF191F7F|7F1F19;
    CMP.B #$03                                                 ;81A597|C903    |      ;
    BNE .return                                                ;81A599|D045    |81A5E0;
    LDA.B strcMap.loadAreaId                                   ;81A59B|A522    |000022;
    CMP.B #$04                                                 ;81A59D|C904    |      ;
    BCC +                                                      ;81A59F|9008    |81A5A9;
    CMP.B #$10                                                 ;81A5A1|C910    |      ;
    BCC .return                                                ;81A5A3|903B    |81A5E0;
    CMP.B #$15                                                 ;81A5A5|C915    |      ;
    BCS .return                                                ;81A5A7|B037    |81A5E0;
 
  + REP #$30                                                   ;81A5A9|C230    |      ;
    LDA.W #$0000                                               ;81A5AB|A90000  |      ;
    LDX.W strcObjectData.playerX                               ;81A5AE|AE0709  |000907;
    LDY.W strcObjectData.playerY                               ;81A5B1|AC0909  |000909;
    JSL.L fObjectEngine_GetObjectPropertyByDirSeason                                      ;81A5B4|2261AC82|82AC61;
    REP #$30                                                   ;81A5B8|C230    |      ;
    TXA                                                        ;81A5BA|8A      |      ;
    CMP.W #$0001                                               ;81A5BB|C90100  |      ;
    BEQ +                                                      ;81A5BE|F011    |81A5D1;
    CMP.W #$0002                                               ;81A5C0|C90200  |      ;
    BEQ +                                                      ;81A5C3|F00C    |81A5D1;
    CMP.W #$00A8                                               ;81A5C5|C9A800  |      ;
    BEQ +                                                      ;81A5C8|F007    |81A5D1;
    CMP.W #$00F6                                               ;81A5CA|C9F600  |      ;
    BEQ +                                                      ;81A5CD|F002    |81A5D1;
    BRA .return                                                ;81A5CF|800F    |81A5E0;
 
 
  + REP #$30                                                   ;81A5D1|C230    |      ;
    LDA.W #$0011                                               ;81A5D3|A91100  |      ;
    LDX.W strcObjectData.playerX                               ;81A5D6|AE0709  |000907;
    LDY.W strcObjectData.playerY                               ;81A5D9|AC0909  |000909;
    JSL.L fMap_QueueTilePatternVRAMUpload                                      ;81A5DC|22C1A681|81A6C1;
 
.return:
    RTL                                                        ;81A5E0|6B      |      ;
 
 
fTileScript_Start:
    REP #$30                                                   ;81A5E1|C230    |      ; A: nIndex
    STA.B strcVariables.n16Temp1                               ;81A5E3|857E    |00007E;
    ASL A                                                      ;81A5E5|0A      |      ;
    CLC                                                        ;81A5E6|18      |      ;
    ADC.B strcVariables.n16Temp1                               ;81A5E7|657E    |00007E;
    TAX                                                        ;81A5E9|AA      |      ;
    LDA.L pTileScriptTable,X                                      ;81A5EA|BF63B981|81B963;
    STA.B ptrUnknown0xCF                                       ;81A5EE|85CF    |0000CF;
    INX                                                        ;81A5F0|E8      |      ;
    INX                                                        ;81A5F1|E8      |      ;
    SEP #$20                                                   ;81A5F2|E220    |      ;
    LDA.L pTileScriptTable,X                                      ;81A5F4|BF63B981|81B963;
    STA.B ptrUnknown0xCF+2                                     ;81A5F8|85D1    |0000D1;
    SEP #$20                                                   ;81A5FA|E220    |      ;
    STZ.W $0989+!RAM_SHIFT                                 ;81A5FC|9C8909  |000989;
    RTL                                                        ;81A5FF|6B      |      ;
 
 
fTileScript_Update:
    REP #$30                                                   ;81A600|C230    |      ;
    LDA.B ptrUnknown0xCF                                       ;81A602|A5CF    |0000CF;
    BNE +                                                      ;81A604|D008    |81A60E;
    SEP #$20                                                   ;81A606|E220    |      ;
    LDA.B ptrUnknown0xCF+2                                     ;81A608|A5D1    |0000D1;
    BNE +                                                      ;81A60A|D002    |81A60E;
    BRA .return                                                ;81A60C|804E    |81A65C;
 
 
  + SEP #$20                                                   ;81A60E|E220    |      ;
    LDA.W $0989+!RAM_SHIFT                                 ;81A610|AD8909  |000989;
    BNE .dec                                                   ;81A613|D044    |81A659;
    REP #$20                                                   ;81A615|C220    |      ;
    LDA.B [ptrUnknown0xCF]                                     ;81A617|A7CF    |0000CF;
    CMP.W #$FFFF                                               ;81A619|C9FFFF  |      ;
    BNE +                                                      ;81A61C|D003    |81A621;
    JMP.W .dataEnd                                             ;81A61E|4C5DA6  |81A65D;
 
 
  + CMP.W #$FFFE                                               ;81A621|C9FEFF  |      ;
    BNE .loop                                                  ;81A624|D003    |81A629;
    JMP.W .readFFFEPointer                                     ;81A626|4C67A6  |81A667;
 
 
.loop:
    REP #$20                                                   ;81A629|C220    |      ;
    LDY.W #$0000                                               ;81A62B|A00000  |      ;
    LDA.B [ptrUnknown0xCF],Y                                   ;81A62E|B7CF    |0000CF;
    PHA                                                        ;81A630|48      |      ;
    INY                                                        ;81A631|C8      |      ;
    INY                                                        ;81A632|C8      |      ;
    LDA.B [ptrUnknown0xCF],Y                                   ;81A633|B7CF    |0000CF;
    PHA                                                        ;81A635|48      |      ;
    INY                                                        ;81A636|C8      |      ;
    INY                                                        ;81A637|C8      |      ;
    LDA.B [ptrUnknown0xCF],Y                                   ;81A638|B7CF    |0000CF;
    PHA                                                        ;81A63A|48      |      ;
    SEP #$20                                                   ;81A63B|E220    |      ;
    INY                                                        ;81A63D|C8      |      ;
    INY                                                        ;81A63E|C8      |      ;
    LDA.B [ptrUnknown0xCF],Y                                   ;81A63F|B7CF    |0000CF;
    STA.W $0989+!RAM_SHIFT                                 ;81A641|8D8909  |000989;
    REP #$20                                                   ;81A644|C220    |      ;
    PLY                                                        ;81A646|7A      |      ;
    PLX                                                        ;81A647|FA      |      ;
    PLA                                                        ;81A648|68      |      ;
    JSL.L fSetTileAtCoords                                     ;81A649|2288A681|81A688;
    REP #$30                                                   ;81A64D|C230    |      ;
    LDA.B ptrUnknown0xCF                                       ;81A64F|A5CF    |0000CF;
    CLC                                                        ;81A651|18      |      ;
    ADC.W #$0007                                               ;81A652|690700  |      ;
    STA.B ptrUnknown0xCF                                       ;81A655|85CF    |0000CF;
    BRA .return                                                ;81A657|8003    |81A65C;
 
 
.dec:
    DEC.W $0989+!RAM_SHIFT                                 ;81A659|CE8909  |000989;
 
.return:
    RTL                                                        ;81A65C|6B      |      ;
 
 
.dataEnd:
    REP #$30                                                   ;81A65D|C230    |      ;
    STZ.B ptrUnknown0xCF                                       ;81A65F|64CF    |0000CF;
    SEP #$20                                                   ;81A661|E220    |      ;
    STZ.B ptrUnknown0xCF+2                                     ;81A663|64D1    |0000D1;
    BRA .return                                                ;81A665|80F5    |81A65C;
 
 
.readFFFEPointer:
    REP #$30                                                   ;81A667|C230    |      ;
    LDY.W #$0000                                               ;81A669|A00000  |      ;
    INY                                                        ;81A66C|C8      |      ;
    INY                                                        ;81A66D|C8      |      ;
    LDA.B [ptrUnknown0xCF],Y                                   ;81A66E|B7CF    |0000CF;
    STA.B ptrTemp0x72                                          ;81A670|8572    |000072;
    INY                                                        ;81A672|C8      |      ;
    INY                                                        ;81A673|C8      |      ;
    SEP #$20                                                   ;81A674|E220    |      ;
    LDA.B [ptrUnknown0xCF],Y                                   ;81A676|B7CF    |0000CF;
    STA.B ptrTemp0x72+2                                        ;81A678|8574    |000074;
    REP #$20                                                   ;81A67A|C220    |      ;
    LDA.B ptrTemp0x72                                          ;81A67C|A572    |000072;
    STA.B ptrUnknown0xCF                                       ;81A67E|85CF    |0000CF;
    SEP #$20                                                   ;81A680|E220    |      ;
    LDA.B ptrTemp0x72+2                                        ;81A682|A574    |000074;
    STA.B ptrUnknown0xCF+2                                     ;81A684|85D1    |0000D1;
    BRA .loop                                                  ;81A686|80A1    |81A629;
 
 
fSetTileAtCoords:
    REP #$30                                                   ;81A688|C230    |      ; A: nArg1, X: nTileX, Y: nTileY
    CMP.W #$0000                                               ;81A68A|C90000  |      ;
    BNE +                                                      ;81A68D|D003    |81A692;
    JMP.W .return                                              ;81A68F|4CC0A6  |81A6C0;
 
 
  + PHY                                                        ;81A692|5A      |      ;
    PHX                                                        ;81A693|DA      |      ;
    PHA                                                        ;81A694|48      |      ;
    JSL.L fMap_QueueTilePatternVRAMUpload                                      ;81A695|22C1A681|81A6C1;
    REP #$30                                                   ;81A699|C230    |      ;
    PLA                                                        ;81A69B|68      |      ;
    PLX                                                        ;81A69C|FA      |      ;
    PLY                                                        ;81A69D|7A      |      ;
    PHY                                                        ;81A69E|5A      |      ;
    PHX                                                        ;81A69F|DA      |      ;
    PHA                                                        ;81A6A0|48      |      ;
    JSL.L fMap_CalcTilemapBufferOffset                                      ;81A6A1|223AA881|81A83A;
    REP #$30                                                   ;81A6A5|C230    |      ;
    PLA                                                        ;81A6A7|68      |      ;
    JSL.L fMap_GetTilePatternInfo                                      ;81A6A8|2201A881|81A801;
    REP #$30                                                   ;81A6AC|C230    |      ;
    PLX                                                        ;81A6AE|FA      |      ;
    PLY                                                        ;81A6AF|7A      |      ;
    LDA.B strcVariables.n16Temp2                               ;81A6B0|A580    |000080;
    STA.B strcVariables.n16Unk86                               ;81A6B2|8586    |000086;
    LDA.B strcVariables.n16Temp3                               ;81A6B4|A582    |000082;
    STA.B strcVariables.n16Unk88                               ;81A6B6|8588    |000088;
    LDA.B strcVariables.n16Temp4                               ;81A6B8|A584    |000084;
    BEQ .return                                                ;81A6BA|F004    |81A6C0;
    JSL.L fMap_FillCurrentTilemapRect                                      ;81A6BC|2260B082|82B060;
 
.return:
    RTL                                                        ;81A6C0|6B      |      ;
 
 
fMap_QueueTilePatternVRAMUpload:
    REP #$30                                                   ;81A6C1|C230    |      ; A: nArg, X: nPosX, Y: nPosY
    PHA                                                        ;81A6C3|48      |      ;
    TXA                                                        ;81A6C4|8A      |      ;
    LSR A                                                      ;81A6C5|4A      |      ;
    LSR A                                                      ;81A6C6|4A      |      ;
    LSR A                                                      ;81A6C7|4A      |      ;
    LSR A                                                      ;81A6C8|4A      |      ;
    STA.B strcVariables.n16Temp1                               ;81A6C9|857E    |00007E;
    TYA                                                        ;81A6CB|98      |      ;
    LSR A                                                      ;81A6CC|4A      |      ;
    LSR A                                                      ;81A6CD|4A      |      ;
    LSR A                                                      ;81A6CE|4A      |      ;
    LSR A                                                      ;81A6CF|4A      |      ;
    STA.B strcVariables.n16Temp2                               ;81A6D0|8580    |000080;
    LDA.W #$6000                                               ;81A6D2|A90060  |      ;
    STA.B strcVariables.n16Unk86                               ;81A6D5|8586    |000086;
    LDA.B strcVariables.n16Temp1                               ;81A6D7|A57E    |00007E;
    CMP.W #$0020                                               ;81A6D9|C92000  |      ;
    BCC +                                                      ;81A6DC|9004    |81A6E2;
    SEC                                                        ;81A6DE|38      |      ;
    SBC.W #$0020                                               ;81A6DF|E92000  |      ;
 
  + ASL A                                                      ;81A6E2|0A      |      ;
    CLC                                                        ;81A6E3|18      |      ;
    ADC.B strcVariables.n16Unk86                               ;81A6E4|6586    |000086;
    STA.B strcVariables.n16Unk86                               ;81A6E6|8586    |000086;
    LDA.B strcVariables.n16Temp1                               ;81A6E8|A57E    |00007E;
    CMP.W #$0010                                               ;81A6EA|C91000  |      ;
    BCC .wrapRow                                                ;81A6ED|9012    |81A701;
    CMP.W #$0020                                               ;81A6EF|C92000  |      ;
    BCC .addColumnQuadrant                                                ;81A6F2|9005    |81A6F9;
    CMP.W #$0030                                               ;81A6F4|C93000  |      ;
    BCC .wrapRow                                                ;81A6F7|9008    |81A701;
 
.addColumnQuadrant:
    LDA.B strcVariables.n16Unk86                               ;81A6F9|A586    |000086;
    CLC                                                        ;81A6FB|18      |      ;
    ADC.W #$03E0                                               ;81A6FC|69E003  |      ;
    STA.B strcVariables.n16Unk86                               ;81A6FF|8586    |000086;
 
.wrapRow:
    LDA.B strcVariables.n16Temp2                               ;81A701|A580    |000080;
    CMP.W #$0020                                               ;81A703|C92000  |      ;
    BCC .addRowOffset                                                ;81A706|9004    |81A70C;
    SEC                                                        ;81A708|38      |      ;
    SBC.W #$0020                                               ;81A709|E92000  |      ;
 
.addRowOffset:
    ASL A                                                      ;81A70C|0A      |      ;
    ASL A                                                      ;81A70D|0A      |      ;
    ASL A                                                      ;81A70E|0A      |      ;
    ASL A                                                      ;81A70F|0A      |      ;
    ASL A                                                      ;81A710|0A      |      ;
    ASL A                                                      ;81A711|0A      |      ;
    CLC                                                        ;81A712|18      |      ;
    ADC.B strcVariables.n16Unk86                               ;81A713|6586    |000086;
    STA.B strcVariables.n16Unk86                               ;81A715|8586    |000086;
    LDA.B strcVariables.n16Temp2                               ;81A717|A580    |000080;
    CMP.W #$0010                                               ;81A719|C91000  |      ;
    BCC .loadPatternSource                                                ;81A71C|9012    |81A730;
    CMP.W #$0020                                               ;81A71E|C92000  |      ;
    BCC .addRowQuadrant                                                ;81A721|9005    |81A728;
    CMP.W #$0030                                               ;81A723|C93000  |      ;
    BCC .loadPatternSource                                                ;81A726|9008    |81A730;
 
.addRowQuadrant:
    LDA.B strcVariables.n16Unk86                               ;81A728|A586    |000086;
    CLC                                                        ;81A72A|18      |      ;
    ADC.W #$0400                                               ;81A72B|690004  |      ;
    STA.B strcVariables.n16Unk86                               ;81A72E|8586    |000086;
 
.loadPatternSource:
    REP #$20                                                   ;81A730|C220    |      ;
    if !REGION_DE
    LDA.W #$A115
    elseif !REGION_JP
    LDA.W #$A77D
    else
    LDA.W #$A096                                               ;81A732|A996A0  |      ;
    endif
    STA.B ptrTemp0x72                                          ;81A735|8572    |000072;
    STA.B ptrUnknown0x75                                       ;81A737|8575    |000075;
    SEP #$20                                                   ;81A739|E220    |      ;
    LDA.B #$A6                                                 ;81A73B|A9A6    |      ;
    STA.B ptrTemp0x72+2                                        ;81A73D|8574    |000074;
    STA.B ptrUnknown0x75+2                                     ;81A73F|8577    |000077;
    REP #$20                                                   ;81A741|C220    |      ;
    PLA                                                        ;81A743|68      |      ;
    JSL.L fMap_GetTilePatternInfo                                      ;81A744|2201A881|81A801;
    REP #$20                                                   ;81A748|C220    |      ;
    LDA.B strcVariables.n16Temp2                               ;81A74A|A580    |000080;
    ASL A                                                      ;81A74C|0A      |      ;
    ASL A                                                      ;81A74D|0A      |      ;
    STA.B strcVariables.n16Temp2                               ;81A74E|8580    |000080;
    LDA.B strcVariables.n16Temp3                               ;81A750|A582    |000082;
    ASL A                                                      ;81A752|0A      |      ;
    STA.B strcVariables.n16Temp3                               ;81A753|8582    |000082;
    LDA.B ptrTemp0x72                                          ;81A755|A572    |000072;
    CLC                                                        ;81A757|18      |      ;
    ADC.B strcVariables.n16Temp1                               ;81A758|657E    |00007E;
    STA.B ptrTemp0x72                                          ;81A75A|8572    |000072;
    STA.B ptrUnknown0x75                                       ;81A75C|8575    |000075;
    SEP #$20                                                   ;81A75E|E220    |      ;
    LDA.B #$02                                                 ;81A760|A902    |      ;
    STA.B strcVariables.n8Temp1                                ;81A762|8592    |000092;
    LDX.W #$0000                                               ;81A764|A20000  |      ;
 
.loop:
    PHX                                                        ;81A767|DA      |      ;
    SEP #$20                                                   ;81A768|E220    |      ;
    LDA.B strcVariables.n8Temp1                                ;81A76A|A592    |000092;
    STA.B strcSystem.arrayIndex                                ;81A76C|8527    |000027;
    LDA.B #$18                                                 ;81A76E|A918    |      ;
    STA.B strcSystem.destinationRegister                       ;81A770|8529    |000029;
    REP #$20                                                   ;81A772|C220    |      ;
    LDY.B strcVariables.n16Temp2                               ;81A774|A480    |000080;
    TXA                                                        ;81A776|8A      |      ;
    ASL A                                                      ;81A777|0A      |      ;
    ASL A                                                      ;81A778|0A      |      ;
    ASL A                                                      ;81A779|0A      |      ;
    ASL A                                                      ;81A77A|0A      |      ;
    ASL A                                                      ;81A77B|0A      |      ;
    CLC                                                        ;81A77C|18      |      ;
    ADC.B strcVariables.n16Unk86                               ;81A77D|6586    |000086;
    TAX                                                        ;81A77F|AA      |      ;
    REP #$20                                                   ;81A780|C220    |      ;
    LDA.W #$0080                                               ;81A782|A98000  |      ;
    JSL.L fCore_PrepareTransfer                                ;81A785|22338A80|808A33;
    REP #$20                                                   ;81A789|C220    |      ;
    LDA.B ptrTemp0x72                                          ;81A78B|A572    |000072;
    CLC                                                        ;81A78D|18      |      ;
    ADC.W #$0040                                               ;81A78E|694000  |      ;
    STA.B ptrTemp0x72                                          ;81A791|8572    |000072;
    PLX                                                        ;81A793|FA      |      ;
    INX                                                        ;81A794|E8      |      ;
    PHX                                                        ;81A795|DA      |      ;
    SEP #$20                                                   ;81A796|E220    |      ;
    LDA.B strcVariables.n8Temp1                                ;81A798|A592    |000092;
    INC A                                                      ;81A79A|1A      |      ;
    STA.B strcSystem.arrayIndex                                ;81A79B|8527    |000027;
    LDA.B #$18                                                 ;81A79D|A918    |      ;
    STA.B strcSystem.destinationRegister                       ;81A79F|8529    |000029;
    REP #$20                                                   ;81A7A1|C220    |      ;
    LDY.B strcVariables.n16Temp2                               ;81A7A3|A480    |000080;
    TXA                                                        ;81A7A5|8A      |      ;
    ASL A                                                      ;81A7A6|0A      |      ;
    ASL A                                                      ;81A7A7|0A      |      ;
    ASL A                                                      ;81A7A8|0A      |      ;
    ASL A                                                      ;81A7A9|0A      |      ;
    ASL A                                                      ;81A7AA|0A      |      ;
    CLC                                                        ;81A7AB|18      |      ;
    ADC.B strcVariables.n16Unk86                               ;81A7AC|6586    |000086;
    TAX                                                        ;81A7AE|AA      |      ;
    REP #$20                                                   ;81A7AF|C220    |      ;
    LDA.W #$0080                                               ;81A7B1|A98000  |      ;
    JSL.L fCore_PrepareTransfer                                ;81A7B4|22338A80|808A33;
    REP #$20                                                   ;81A7B8|C220    |      ;
    LDA.B ptrUnknown0x75                                       ;81A7BA|A575    |000075;
    CLC                                                        ;81A7BC|18      |      ;
    ADC.B strcVariables.n16Temp2                               ;81A7BD|6580    |000080;
    STA.B ptrUnknown0x75                                       ;81A7BF|8575    |000075;
    STA.B ptrTemp0x72                                          ;81A7C1|8572    |000072;
    SEP #$20                                                   ;81A7C3|E220    |      ;
    STZ.B strcVariables.n8Temp1                                ;81A7C5|6492    |000092;
    PLX                                                        ;81A7C7|FA      |      ;
    INX                                                        ;81A7C8|E8      |      ;
    CPX.B strcVariables.n16Temp3                               ;81A7C9|E482    |000082;
    BNE .loop                                                  ;81A7CB|D09A    |81A767;
    RTL                                                        ;81A7CD|6B      |      ;
 
 
fMap_DrawTilePatternAt:
    REP #$30                                                   ;81A7CE|C230    |      ; A: nArg1, X: nArg2, Y: nArg3
    PHY                                                        ;81A7D0|5A      |      ;
    PHX                                                        ;81A7D1|DA      |      ;
    PHA                                                        ;81A7D2|48      |      ;
    JSL.L fMap_GetTilePatternInfo                                      ;81A7D3|2201A881|81A801;
    REP #$30                                                   ;81A7D7|C230    |      ;
    PLA                                                        ;81A7D9|68      |      ;
    PLX                                                        ;81A7DA|FA      |      ;
    PLY                                                        ;81A7DB|7A      |      ;
    PHY                                                        ;81A7DC|5A      |      ;
    PHX                                                        ;81A7DD|DA      |      ;
    PHA                                                        ;81A7DE|48      |      ;
    JSL.L fMap_CalcTilemapBufferOffset                                      ;81A7DF|223AA881|81A83A;
    REP #$30                                                   ;81A7E3|C230    |      ;
    PLA                                                        ;81A7E5|68      |      ;
    JSL.L fMap_GetTilePatternInfo                                      ;81A7E6|2201A881|81A801;
    REP #$30                                                   ;81A7EA|C230    |      ;
    PLX                                                        ;81A7EC|FA      |      ;
    PLY                                                        ;81A7ED|7A      |      ;
    LDA.B strcVariables.n16Temp2                               ;81A7EE|A580    |000080;
    STA.B strcVariables.n16Unk86                               ;81A7F0|8586    |000086;
    LDA.B strcVariables.n16Temp3                               ;81A7F2|A582    |000082;
    STA.B strcVariables.n16Unk88                               ;81A7F4|8588    |000088;
    LDA.B strcVariables.n16Temp4                               ;81A7F6|A584    |000084;
    BEQ +                                                      ;81A7F8|F006    |81A800;
    SEP #$20                                                   ;81A7FA|E220    |      ;
    JSL.L fMap_FillCurrentTilemapRect                                      ;81A7FC|2260B082|82B060;
 
  + RTL                                                        ;81A800|6B      |      ;
 
 
fMap_GetTilePatternInfo:
    REP #$30                                                   ;81A801|C230    |      ; A: nIndex, return $7E, $82, $80, $84
    STA.B strcVariables.n16Temp1                               ;81A803|857E    |00007E;
    ASL A                                                      ;81A805|0A      |      ;
    ASL A                                                      ;81A806|0A      |      ;
    CLC                                                        ;81A807|18      |      ;
    ADC.B strcVariables.n16Temp1                               ;81A808|657E    |00007E;
    ADC.B strcVariables.n16Temp1                               ;81A80A|657E    |00007E;
    TAX                                                        ;81A80C|AA      |      ;
    LDA.L aTilePatternTable,X                                       ;81A80D|BF63B381|81B363; index = A * 6 + 0
    STA.B strcVariables.n16Temp1                               ;81A811|857E    |00007E;
    INX                                                        ;81A813|E8      |      ;
    INX                                                        ;81A814|E8      |      ;
    SEP #$20                                                   ;81A815|E220    |      ;
    LDA.L aTilePatternTable,X                                       ;81A817|BF63B381|81B363; index = A * 6 + 2
    XBA                                                        ;81A81B|EB      |      ;
    LDA.B #$00                                                 ;81A81C|A900    |      ;
    XBA                                                        ;81A81E|EB      |      ;
    REP #$20                                                   ;81A81F|C220    |      ;
    STA.B strcVariables.n16Temp3                               ;81A821|8582    |000082;
    INX                                                        ;81A823|E8      |      ;
    SEP #$20                                                   ;81A824|E220    |      ;
    LDA.L aTilePatternTable,X                                       ;81A826|BF63B381|81B363; index = A * 6 + 3
    XBA                                                        ;81A82A|EB      |      ;
    LDA.B #$00                                                 ;81A82B|A900    |      ;
    XBA                                                        ;81A82D|EB      |      ;
    REP #$20                                                   ;81A82E|C220    |      ;
    STA.B strcVariables.n16Temp2                               ;81A830|8580    |000080;
    INX                                                        ;81A832|E8      |      ;
    LDA.L aTilePatternTable,X                                       ;81A833|BF63B381|81B363; index = A * 6 + 4
    STA.B strcVariables.n16Temp4                               ;81A837|8584    |000084;
    RTL                                                        ;81A839|6B      |      ;
 
 
fMap_CalcTilemapBufferOffset:
    REP #$30                                                   ;81A83A|C230    |      ; A: nIndex
    PHA                                                        ;81A83C|48      |      ;
    TXA                                                        ;81A83D|8A      |      ;
    LSR A                                                      ;81A83E|4A      |      ;
    LSR A                                                      ;81A83F|4A      |      ;
    LSR A                                                      ;81A840|4A      |      ;
    LSR A                                                      ;81A841|4A      |      ;
    ASL A                                                      ;81A842|0A      |      ;
    ASL A                                                      ;81A843|0A      |      ;
    STA.B strcVariables.n16Temp1                               ;81A844|857E    |00007E;
    TYA                                                        ;81A846|98      |      ;
    LSR A                                                      ;81A847|4A      |      ;
    LSR A                                                      ;81A848|4A      |      ;
    LSR A                                                      ;81A849|4A      |      ;
    LSR A                                                      ;81A84A|4A      |      ;
    ASL A                                                      ;81A84B|0A      |      ;
    ASL A                                                      ;81A84C|0A      |      ;
    ASL A                                                      ;81A84D|0A      |      ;
    ASL A                                                      ;81A84E|0A      |      ;
    ASL A                                                      ;81A84F|0A      |      ;
    ASL A                                                      ;81A850|0A      |      ;
    ASL A                                                      ;81A851|0A      |      ;
    STA.B strcVariables.n16Temp2                               ;81A852|8580    |000080;
    LDA.W #$0040                                               ;81A854|A94000  |      ;
    STA.B strcVariables.n16Unk88                               ;81A857|8588    |000088;
    SEP #$20                                                   ;81A859|E220    |      ;
    LDA.W strcDialogDisplay.mapMultiWidth                      ;81A85B|AD8101  |000181;
    CMP.B #$01                                                 ;81A85E|C901    |      ;
    BEQ +                                                      ;81A860|F01B    |81A87D;
    REP #$20                                                   ;81A862|C220    |      ;
    LDA.B strcVariables.n16Temp2                               ;81A864|A580    |000080;
    ASL A                                                      ;81A866|0A      |      ;
    STA.B strcVariables.n16Temp2                               ;81A867|8580    |000080;
    ASL.B strcVariables.n16Unk88                               ;81A869|0688    |000088;
    SEP #$20                                                   ;81A86B|E220    |      ;
    LDA.W strcDialogDisplay.mapMultiWidth                      ;81A86D|AD8101  |000181;
    CMP.B #$02                                                 ;81A870|C902    |      ;
    BEQ +                                                      ;81A872|F009    |81A87D;
    REP #$20                                                   ;81A874|C220    |      ;
    LDA.B strcVariables.n16Temp2                               ;81A876|A580    |000080;
    ASL A                                                      ;81A878|0A      |      ;
    STA.B strcVariables.n16Temp2                               ;81A879|8580    |000080;
    ASL.B strcVariables.n16Unk88                               ;81A87B|0688    |000088;
 
  + REP #$30                                                   ;81A87D|C230    |      ;
    LDA.B strcVariables.n16Temp1                               ;81A87F|A57E    |00007E;
    CLC                                                        ;81A881|18      |      ;
    ADC.B strcVariables.n16Temp2                               ;81A882|6580    |000080;
    STA.B strcVariables.n16Unk86                               ;81A884|8586    |000086;
    PLA                                                        ;81A886|68      |      ;
    JSL.L fMap_GetTilePatternInfo                                      ;81A887|2201A881|81A801;
    REP #$20                                                   ;81A88B|C220    |      ;
    LDA.B strcVariables.n16Temp2                               ;81A88D|A580    |000080;
    ASL A                                                      ;81A88F|0A      |      ;
    ASL A                                                      ;81A890|0A      |      ;
    STA.B strcVariables.n16Temp2                               ;81A891|8580    |000080;
    REP #$20                                                   ;81A893|C220    |      ;
    if !REGION_DE
    LDA.W #$A115
    elseif !REGION_JP
    LDA.W #$A77D
    else
    LDA.W #$A096                                               ;81A895|A996A0  |      ;
    endif
    CLC                                                        ;81A898|18      |      ;
    ADC.B strcVariables.n16Temp1                               ;81A899|657E    |00007E;
    STA.B ptrTemp0x72                                          ;81A89B|8572    |000072;
    STA.B ptrObjectData                                        ;81A89D|8578    |000078;
    SEP #$20                                                   ;81A89F|E220    |      ;
    LDA.B #$A6                                                 ;81A8A1|A9A6    |      ;
    STA.B ptrTemp0x72+2                                        ;81A8A3|8574    |000074;
    STA.B ptrObjectData+2                                      ;81A8A5|857A    |00007A;
    REP #$20                                                   ;81A8A7|C220    |      ;
    LDA.W #$2000                                               ;81A8A9|A90020  |      ;
    CLC                                                        ;81A8AC|18      |      ;
    ADC.B strcVariables.n16Unk86                               ;81A8AD|6586    |000086;
    STA.B ptrUnknown0x75                                       ;81A8AF|8575    |000075;
    SEP #$20                                                   ;81A8B1|E220    |      ;
    LDA.B #$7E                                                 ;81A8B3|A97E    |      ;
    STA.B ptrUnknown0x75+2                                     ;81A8B5|8577    |000077;
    REP #$30                                                   ;81A8B7|C230    |      ;
    STZ.B strcVariables.n16Unk8E                               ;81A8B9|648E    |00008E;
    STZ.B strcVariables.n16Unk90                               ;81A8BB|6490    |000090;
    LDY.W #$0000                                               ;81A8BD|A00000  |      ;
 
--- PHY                                                        ;81A8C0|5A      |      ; outer loop
    LDA.W #$0000                                               ;81A8C1|A90000  |      ;
 
 -- PHA                                                        ;81A8C4|48      |      ; inner loop
    LDY.W #$0000                                               ;81A8C5|A00000  |      ;
    LDX.W #$0000                                               ;81A8C8|A20000  |      ;
    STZ.B strcVariables.n16Unk90                               ;81A8CB|6490    |000090;
 
  - LDA.B [ptrTemp0x72],Y                                      ;81A8CD|B772    |000072;
    PHY                                                        ;81A8CF|5A      |      ;
    TXY                                                        ;81A8D0|9B      |      ;
    STA.B [ptrUnknown0x75],Y                                   ;81A8D1|9775    |000075;
    PLY                                                        ;81A8D3|7A      |      ;
    INY                                                        ;81A8D4|C8      |      ;
    INY                                                        ;81A8D5|C8      |      ;
    INX                                                        ;81A8D6|E8      |      ;
    INX                                                        ;81A8D7|E8      |      ;
    PLA                                                        ;81A8D8|68      |      ;
    PHA                                                        ;81A8D9|48      |      ;
    CMP.W #$0000                                               ;81A8DA|C90000  |      ;
    BNE .advanceColumn                                                ;81A8DD|D010    |81A8EF;
    INC.B strcVariables.n16Unk90                               ;81A8DF|E690    |000090;
    INC.B strcVariables.n16Unk90                               ;81A8E1|E690    |000090;
    LDA.B strcVariables.n16Temp1                               ;81A8E3|A57E    |00007E;
    CLC                                                        ;81A8E5|18      |      ;
    ADC.B strcVariables.n16Unk90                               ;81A8E6|6590    |000090;
    AND.W #$0040                                               ;81A8E8|294000  |      ;
    BEQ .checkRowEnd                                                ;81A8EB|F023    |81A910;
    BRA .crossBlockBoundary                                                ;81A8ED|800E    |81A8FD;
 
 
.advanceColumn:
    INC.B strcVariables.n16Unk90                               ;81A8EF|E690    |000090;
    INC.B strcVariables.n16Unk90                               ;81A8F1|E690    |000090;
    LDA.B strcVariables.n16Temp1                               ;81A8F3|A57E    |00007E;
    CLC                                                        ;81A8F5|18      |      ;
    ADC.B strcVariables.n16Unk90                               ;81A8F6|6590    |000090;
    AND.W #$0040                                               ;81A8F8|294000  |      ;
    BEQ .checkRowEnd                                                ;81A8FB|F013    |81A910;
 
.crossBlockBoundary:
    LDA.W #$0040                                               ;81A8FD|A94000  |      ;
    STA.B strcVariables.n16Unk8E                               ;81A900|858E    |00008E;
    LDA.B strcVariables.n16Unk90                               ;81A902|A590    |000090;
    CLC                                                        ;81A904|18      |      ;
    ADC.W #$0040                                               ;81A905|694000  |      ;
    STA.B strcVariables.n16Unk90                               ;81A908|8590    |000090;
    TYA                                                        ;81A90A|98      |      ;
    CLC                                                        ;81A90B|18      |      ;
    ADC.W #$0040                                               ;81A90C|694000  |      ;
    TAY                                                        ;81A90F|A8      |      ;
 
.checkRowEnd:
    CPX.B strcVariables.n16Temp2                               ;81A910|E480    |000080;
    BNE -                                                      ;81A912|D0B9    |81A8CD;
    LDA.B ptrTemp0x72                                          ;81A914|A572    |000072;
    CLC                                                        ;81A916|18      |      ;
    ADC.W #$0040                                               ;81A917|694000  |      ;
    STA.B ptrTemp0x72                                          ;81A91A|8572    |000072;
    LDA.B ptrUnknown0x75                                       ;81A91C|A575    |000075;
    CLC                                                        ;81A91E|18      |      ;
    ADC.B strcVariables.n16Unk88                               ;81A91F|6588    |000088;
    STA.B ptrUnknown0x75                                       ;81A921|8575    |000075;
    PLA                                                        ;81A923|68      |      ;
    INC A                                                      ;81A924|1A      |      ;
    CMP.W #$0002                                               ;81A925|C90200  |      ;
    BNE --                                                     ;81A928|D09A    |81A8C4;
    REP #$20                                                   ;81A92A|C220    |      ;
    LDA.B ptrObjectData                                        ;81A92C|A578    |000078;
    CLC                                                        ;81A92E|18      |      ;
    ADC.B strcVariables.n16Temp2                               ;81A92F|6580    |000080;
    ADC.B strcVariables.n16Unk8E                               ;81A931|658E    |00008E;
    STA.B ptrObjectData                                        ;81A933|8578    |000078;
    STA.B ptrTemp0x72                                          ;81A935|8572    |000072;
    STZ.B strcVariables.n16Unk8E                               ;81A937|648E    |00008E;
    LDA.B strcVariables.n16Temp1                               ;81A939|A57E    |00007E;
    CLC                                                        ;81A93B|18      |      ;
    ADC.B strcVariables.n16Unk90                               ;81A93C|6590    |000090;
    STA.B strcVariables.n16Temp1                               ;81A93E|857E    |00007E;
    PLY                                                        ;81A940|7A      |      ;
    INY                                                        ;81A941|C8      |      ;
    CPY.B strcVariables.n16Temp3                               ;81A942|C482    |000082;
    BEQ +                                                      ;81A944|F003    |81A949;
    if !REGION_EUDE
    JMP.W fMap_CalcTilemapBufferOffset_OuterLoop
    else
    JMP.W $A8C0                                                ;81A946|4CC0A8  |81A8C0;
    endif
 
 
  + RTL                                                        ;81A949|6B      |      ;
 
 
fShed_PlaceEquippedTool:
    SEP #$20                                                   ;81A94A|E220    |      ;
    REP #$10                                                   ;81A94C|C210    |      ;
    LDA.W strcPlayerData.toolSecond                            ;81A94E|AD2309  |000923;
    BNE +                                                      ;81A951|D003    |81A956;
    JMP.W .return                                              ;81A953|4CE4A9  |81A9E4;
 
 
  + LDA.W strcPlayerData.toolEquipped                          ;81A956|AD2109  |000921;
    BEQ .markShedSlot                                                ;81A959|F053    |81A9AE;
    CMP.B #$19                                                 ;81A95B|C919    |      ;
    BCC .checkAreaForLowTools                                                ;81A95D|901A    |81A979;
    CMP.B #$19                                                 ;81A95F|C919    |      ;
    BEQ .checkAreaForTool19                                                ;81A961|F00B    |81A96E;
    SEP #$20                                                   ;81A963|E220    |      ;
    LDA.W strcMap.loadAreaId                                   ;81A965|AD2200  |000022;
    CMP.B #$27                                                 ;81A968|C927    |      ;
    BNE .markShedSlot                                                ;81A96A|D042    |81A9AE;
    BRA .drawToolInShed                                                ;81A96C|8014    |81A982;
 
 
.checkAreaForTool19:
    SEP #$20                                                   ;81A96E|E220    |      ;
    LDA.W strcMap.loadAreaId                                   ;81A970|AD2200  |000022;
    CMP.B #$28                                                 ;81A973|C928    |      ;
    BNE .markShedSlot                                                ;81A975|D037    |81A9AE;
    BRA .drawToolInShed                                                ;81A977|8009    |81A982;
 
 
.checkAreaForLowTools:
    SEP #$20                                                   ;81A979|E220    |      ;
    LDA.W strcMap.loadAreaId                                   ;81A97B|AD2200  |000022;
    CMP.B #$26                                                 ;81A97E|C926    |      ;
    BNE .markShedSlot                                                ;81A980|D02C    |81A9AE;
 
.drawToolInShed:
    SEP #$20                                                   ;81A982|E220    |      ;
    REP #$10                                                   ;81A984|C210    |      ;
    LDA.B #$00                                                 ;81A986|A900    |      ;
    XBA                                                        ;81A988|EB      |      ;
    LDA.W strcPlayerData.toolEquipped                          ;81A989|AD2109  |000921;
    REP #$20                                                   ;81A98C|C220    |      ;
    ASL A                                                      ;81A98E|0A      |      ;
    ASL A                                                      ;81A98F|0A      |      ;
    ASL A                                                      ;81A990|0A      |      ;
    TAX                                                        ;81A991|AA      |      ;
    LDA.L nShedToolPlacementTable,X                           ;81A992|BF0FBE81|81BE0F;
    PHA                                                        ;81A996|48      |      ;
    INX                                                        ;81A997|E8      |      ;
    INX                                                        ;81A998|E8      |      ;
    LDA.L nShedToolPlacementTable,X                           ;81A999|BF0FBE81|81BE0F;
    PHA                                                        ;81A99D|48      |      ;
    INX                                                        ;81A99E|E8      |      ;
    INX                                                        ;81A99F|E8      |      ;
    LDA.L nShedToolPlacementTable,X                           ;81A9A0|BF0FBE81|81BE0F;
    PLY                                                        ;81A9A4|7A      |      ;
    PLX                                                        ;81A9A5|FA      |      ;
    JSL.L fSetTileAtCoords                                     ;81A9A6|2288A681|81A688;
    JSL.L fCore_StartTransfer                                  ;81A9AA|22F08A80|808AF0;
 
.markShedSlot:
    SEP #$20                                                   ;81A9AE|E220    |      ;
    REP #$10                                                   ;81A9B0|C210    |      ;
    LDA.B #$00                                                 ;81A9B2|A900    |      ;
    XBA                                                        ;81A9B4|EB      |      ;
    LDA.W strcPlayerData.toolEquipped                          ;81A9B5|AD2109  |000921;
    REP #$20                                                   ;81A9B8|C220    |      ;
    ASL A                                                      ;81A9BA|0A      |      ;
    ASL A                                                      ;81A9BB|0A      |      ;
    ASL A                                                      ;81A9BC|0A      |      ;
    TAX                                                        ;81A9BD|AA      |      ;
    INX                                                        ;81A9BE|E8      |      ;
    INX                                                        ;81A9BF|E8      |      ;
    INX                                                        ;81A9C0|E8      |      ;
    INX                                                        ;81A9C1|E8      |      ;
    INX                                                        ;81A9C2|E8      |      ;
    INX                                                        ;81A9C3|E8      |      ;
    SEP #$20                                                   ;81A9C4|E220    |      ;
    LDA.B #$00                                                 ;81A9C6|A900    |      ;
    XBA                                                        ;81A9C8|EB      |      ;
    LDA.L nShedToolPlacementTable,X                           ;81A9C9|BF0FBE81|81BE0F;
    REP #$20                                                   ;81A9CD|C220    |      ;
    TAY                                                        ;81A9CF|A8      |      ; A -> Y
    INX                                                        ;81A9D0|E8      |      ;
    SEP #$20                                                   ;81A9D1|E220    |      ;
    LDA.L nShedToolPlacementTable,X                           ;81A9D3|BF0FBE81|81BE0F;
    STA.B strcVariables.n8Temp1                                ;81A9D7|8592    |000092; A -> $92
    TYX                                                        ;81A9D9|BB      |      ;
    LDA.L strcShedItems.row1,X                                 ;81A9DA|BF001F7F|7F1F00;
    ORA.B strcVariables.n8Temp1                                ;81A9DE|0592    |000092;
    STA.L strcShedItems.row1,X                                 ;81A9E0|9F001F7F|7F1F00;
 
.return:
    RTL                                                        ;81A9E4|6B      |      ;
 
 
fAreaItemSubrutine_Run:
    SEP #$20                                                   ;81A9E5|E220    |      ; $22: nItemId
    REP #$10                                                   ;81A9E7|C210    |      ;
    LDA.B #$00                                                 ;81A9E9|A900    |      ;
    XBA                                                        ;81A9EB|EB      |      ;
    LDA.B strcMap.loadAreaId                                   ;81A9EC|A522    |000022;
    REP #$20                                                   ;81A9EE|C220    |      ;
    ASL A                                                      ;81A9F0|0A      |      ;
    TAX                                                        ;81A9F1|AA      |      ;
    JSR.W (pAreaItemSubrutineTable,X)                           ;81A9F2|FCF6A9  |81A9F6;
    RTL                                                        ;81A9F5|6B      |      ;
 
    incsrc "../../../build/gen/blocks/item_subroutines.asm"
 
fItemSub81A9F6_0x00to0x03:
    REP #$30                                                   ;81AAB6|C230    |      ;
    %CheckFlag(event1, $0002)
    BEQ .checkEvent1Flag0001                                                ;81AABF|F019    |81AADA;
    LDA.W #$0060                                               ;81AAC1|A96000  |      ;
    LDX.W #$0310                                               ;81AAC4|A21003  |      ;
    LDY.W #$0360                                               ;81AAC7|A06003  |      ;
    PHA                                                        ;81AACA|48      |      ;
    PHX                                                        ;81AACB|DA      |      ;
    PHY                                                        ;81AACC|5A      |      ;
    JSL.L fMap_DrawTilePatternAt                                      ;81AACD|22CEA781|81A7CE;
    REP #$30                                                   ;81AAD1|C230    |      ;
    PLY                                                        ;81AAD3|7A      |      ;
    PLX                                                        ;81AAD4|FA      |      ;
    PLA                                                        ;81AAD5|68      |      ;
    JSL.L fMap_StampTemplateToCurrentTilemap                                      ;81AAD6|22A7B082|82B0A7;
 
.checkEvent1Flag0001:
    REP #$30                                                   ;81AADA|C230    |      ;
    %CheckFlag(event1, $0001)
    BEQ .checkEvent1Flag0080                                                ;81AAE3|F019    |81AAFE;
    LDA.W #$005F                                               ;81AAE5|A95F00  |      ;
    LDX.W #$0240                                               ;81AAE8|A24002  |      ;
    LDY.W #$02F0                                               ;81AAEB|A0F002  |      ;
    PHA                                                        ;81AAEE|48      |      ;
    PHX                                                        ;81AAEF|DA      |      ;
    PHY                                                        ;81AAF0|5A      |      ;
    JSL.L fMap_DrawTilePatternAt                                      ;81AAF1|22CEA781|81A7CE;
    REP #$30                                                   ;81AAF5|C230    |      ;
    PLY                                                        ;81AAF7|7A      |      ;
    PLX                                                        ;81AAF8|FA      |      ;
    PLA                                                        ;81AAF9|68      |      ;
    JSL.L fMap_StampTemplateToCurrentTilemap                                      ;81AAFA|22A7B082|82B0A7;
 
.checkEvent1Flag0080:
    REP #$30                                                   ;81AAFE|C230    |      ;
    %CheckFlag(event1, $0080)
    BEQ .checkEvent1Flag0040                                                ;81AB07|F01D    |81AB26;
    REP #$30                                                   ;81AB09|C230    |      ;
    LDA.W #$0054                                               ;81AB0B|A95400  |      ;
    LDX.W #$0060                                               ;81AB0E|A26000  |      ;
    LDY.W #$0100                                               ;81AB11|A00001  |      ;
    PHA                                                        ;81AB14|48      |      ;
    PHX                                                        ;81AB15|DA      |      ;
    PHY                                                        ;81AB16|5A      |      ;
    JSL.L fMap_DrawTilePatternAt                                      ;81AB17|22CEA781|81A7CE;
    REP #$30                                                   ;81AB1B|C230    |      ;
    PLY                                                        ;81AB1D|7A      |      ;
    PLX                                                        ;81AB1E|FA      |      ;
    PLA                                                        ;81AB1F|68      |      ;
    JSL.L fMap_StampTemplateToCurrentTilemap                                      ;81AB20|22A7B082|82B0A7;
    BRA .checkPowerBerries                                                ;81AB24|8026    |81AB4C;
 
 
.checkEvent1Flag0040:
    REP #$30                                                   ;81AB26|C230    |      ;
    %CheckFlag(event1, $0040)
    BEQ .checkPowerBerries                                                ;81AB2F|F01B    |81AB4C;
    REP #$30                                                   ;81AB31|C230    |      ;
    LDA.W #$0053                                               ;81AB33|A95300  |      ;
    LDX.W #$0060                                               ;81AB36|A26000  |      ;
    LDY.W #$0100                                               ;81AB39|A00001  |      ;
    PHA                                                        ;81AB3C|48      |      ;
    PHX                                                        ;81AB3D|DA      |      ;
    PHY                                                        ;81AB3E|5A      |      ;
    JSL.L fMap_DrawTilePatternAt                                      ;81AB3F|22CEA781|81A7CE;
    REP #$30                                                   ;81AB43|C230    |      ;
    PLY                                                        ;81AB45|7A      |      ;
    PLX                                                        ;81AB46|FA      |      ;
    PLA                                                        ;81AB47|68      |      ;
    JSL.L fMap_StampTemplateToCurrentTilemap                                      ;81AB48|22A7B082|82B0A7;
 
.checkPowerBerries:
    SEP #$20                                                   ;81AB4C|E220    |      ;
    REP #$10                                                   ;81AB4E|C210    |      ;
    LDA.L nPowerBerryEaten                                     ;81AB50|AF361F7F|7F1F36;
    BEQ .checkEvent2Flag0200                                                ;81AB54|F03E    |81AB94;
    LDA.B #$00                                                 ;81AB56|A900    |      ;
 
.powerberry:
    SEP #$20                                                   ;81AB58|E220    |      ;
    REP #$10                                                   ;81AB5A|C210    |      ;
    PHA                                                        ;81AB5C|48      |      ;
    XBA                                                        ;81AB5D|EB      |      ;
    LDA.B #$00                                                 ;81AB5E|A900    |      ;
    XBA                                                        ;81AB60|EB      |      ;
    REP #$20                                                   ;81AB61|C220    |      ;
    ASL A                                                      ;81AB63|0A      |      ;
    ASL A                                                      ;81AB64|0A      |      ;
    TAX                                                        ;81AB65|AA      |      ;
    LDA.L nPowerBerryTable,X                                   ;81AB66|BF49AC81|81AC49;
    PHA                                                        ;81AB6A|48      |      ;
    INX                                                        ;81AB6B|E8      |      ;
    INX                                                        ;81AB6C|E8      |      ;
    LDA.L nPowerBerryTable,X                                   ;81AB6D|BF49AC81|81AC49;
    TAY                                                        ;81AB71|A8      |      ;
    PLX                                                        ;81AB72|FA      |      ;
    LDA.W #$0016                                               ;81AB73|A91600  |      ;
    PHA                                                        ;81AB76|48      |      ;
    PHX                                                        ;81AB77|DA      |      ;
    PHY                                                        ;81AB78|5A      |      ;
    JSL.L fMap_DrawTilePatternAt                                      ;81AB79|22CEA781|81A7CE;
    REP #$30                                                   ;81AB7D|C230    |      ;
    PLY                                                        ;81AB7F|7A      |      ;
    PLX                                                        ;81AB80|FA      |      ;
    PLA                                                        ;81AB81|68      |      ;
    JSL.L fMap_StampTemplateToCurrentTilemap                                      ;81AB82|22A7B082|82B0A7;
    SEP #$20                                                   ;81AB86|E220    |      ;
    REP #$10                                                   ;81AB88|C210    |      ;
    PLA                                                        ;81AB8A|68      |      ;
    CLC                                                        ;81AB8B|18      |      ;
    ADC.B #$01                                                 ;81AB8C|6901    |      ;
    CMP.L nPowerBerryEaten                                     ;81AB8E|CF361F7F|7F1F36;
    BNE .powerberry                                            ;81AB92|D0C4    |81AB58;
 
.checkEvent2Flag0200:
    REP #$30                                                   ;81AB94|C230    |      ;
    %CheckFlag(event2, $0200)
    BEQ .checkEvent2Flag0400                                                ;81AB9D|F019    |81ABB8;
    LDA.W #$0059                                               ;81AB9F|A95900  |      ;
    LDX.W #$0080                                               ;81ABA2|A28000  |      ;
    LDY.W #$0130                                               ;81ABA5|A03001  |      ;
    PHA                                                        ;81ABA8|48      |      ;
    PHX                                                        ;81ABA9|DA      |      ;
    PHY                                                        ;81ABAA|5A      |      ;
    JSL.L fMap_DrawTilePatternAt                                      ;81ABAB|22CEA781|81A7CE;
    REP #$30                                                   ;81ABAF|C230    |      ;
    PLY                                                        ;81ABB1|7A      |      ;
    PLX                                                        ;81ABB2|FA      |      ;
    PLA                                                        ;81ABB3|68      |      ;
    JSL.L fMap_StampTemplateToCurrentTilemap                                      ;81ABB4|22A7B082|82B0A7;
 
.checkEvent2Flag0400:
    REP #$30                                                   ;81ABB8|C230    |      ;
    %CheckFlag(event2, $0400)
    BEQ .checkEvent2Flag0800                                                ;81ABC1|F019    |81ABDC;
    LDA.W #$0058                                               ;81ABC3|A95800  |      ;
    LDX.W #$0060                                               ;81ABC6|A26000  |      ;
    LDY.W #$0130                                               ;81ABC9|A03001  |      ;
    PHA                                                        ;81ABCC|48      |      ;
    PHX                                                        ;81ABCD|DA      |      ;
    PHY                                                        ;81ABCE|5A      |      ;
    JSL.L fMap_DrawTilePatternAt                                      ;81ABCF|22CEA781|81A7CE;
    REP #$30                                                   ;81ABD3|C230    |      ;
    PLY                                                        ;81ABD5|7A      |      ;
    PLX                                                        ;81ABD6|FA      |      ;
    PLA                                                        ;81ABD7|68      |      ;
    JSL.L fMap_StampTemplateToCurrentTilemap                                      ;81ABD8|22A7B082|82B0A7;
 
.checkEvent2Flag0800:
    REP #$30                                                   ;81ABDC|C230    |      ;
    %CheckFlag(event2, $0800)
    BEQ .checkEvent2Flag1000                                                ;81ABE5|F019    |81AC00;
    LDA.W #$005A                                               ;81ABE7|A95A00  |      ;
    LDX.W #$0090                                               ;81ABEA|A29000  |      ;
    LDY.W #$0130                                               ;81ABED|A03001  |      ;
    PHA                                                        ;81ABF0|48      |      ;
    PHX                                                        ;81ABF1|DA      |      ;
    PHY                                                        ;81ABF2|5A      |      ;
    JSL.L fMap_DrawTilePatternAt                                      ;81ABF3|22CEA781|81A7CE;
    REP #$30                                                   ;81ABF7|C230    |      ;
    PLY                                                        ;81ABF9|7A      |      ;
    PLX                                                        ;81ABFA|FA      |      ;
    PLA                                                        ;81ABFB|68      |      ;
    JSL.L fMap_StampTemplateToCurrentTilemap                                      ;81ABFC|22A7B082|82B0A7;
 
.checkEvent2Flag1000:
    REP #$30                                                   ;81AC00|C230    |      ;
    %CheckFlag(event2, $1000)
    BEQ .checkEvent3Flag1000                                               ;81AC09|F019    |81AC24;
    LDA.W #$005C                                               ;81AC0B|A95C00  |      ;
    LDX.W #$00B0                                               ;81AC0E|A2B000  |      ;
    LDY.W #$0130                                               ;81AC11|A03001  |      ;
    PHA                                                        ;81AC14|48      |      ;
    PHX                                                        ;81AC15|DA      |      ;
    PHY                                                        ;81AC16|5A      |      ;
    JSL.L fMap_DrawTilePatternAt                                      ;81AC17|22CEA781|81A7CE;
    REP #$30                                                   ;81AC1B|C230    |      ;
    PLY                                                        ;81AC1D|7A      |      ;
    PLX                                                        ;81AC1E|FA      |      ;
    PLA                                                        ;81AC1F|68      |      ;
    JSL.L fMap_StampTemplateToCurrentTilemap                                      ;81AC20|22A7B082|82B0A7;
 
.checkEvent3Flag1000:
    REP #$30                                                   ;81AC24|C230    |      ;
    %CheckFlag(event3, $1000)
    BEQ .return                                                ;81AC2D|F019    |81AC48;
    LDA.W #$00F5                                               ;81AC2F|A9F500  |      ;
    LDX.W #$0120                                               ;81AC32|A22001  |      ;
    LDY.W #$0140                                               ;81AC35|A04001  |      ;
    PHA                                                        ;81AC38|48      |      ;
    PHX                                                        ;81AC39|DA      |      ;
    PHY                                                        ;81AC3A|5A      |      ;
    JSL.L fMap_DrawTilePatternAt                                      ;81AC3B|22CEA781|81A7CE;
    REP #$30                                                   ;81AC3F|C230    |      ;
    PLY                                                        ;81AC41|7A      |      ;
    PLX                                                        ;81AC42|FA      |      ;
    PLA                                                        ;81AC43|68      |      ;
    JSL.L fMap_StampTemplateToCurrentTilemap                                      ;81AC44|22A7B082|82B0A7;
 
.return:
    RTS                                                        ;81AC48|60      |      ;
 
 
nPowerBerryTable:
    dw $0180,$0050,$0190,$0050,$01A0,$0050                     ;81AC49|        |      ; 16b, 16b / 32b (not sure about this size) * 0A
    dw $01B0,$0050,$01C0,$0050,$0180,$0060                     ;81AC55|        |      ;
    dw $0190,$0060,$01A0,$0060,$01B0,$0060                     ;81AC61|        |      ;
    dw $01C0,$0060                                             ;81AC6D|        |      ;
 
fItemSub81A9F6_0x04to0x07:
    RTS                                                        ;81AC71|60      |      ;
 
    RTS                                                        ;81AC72|60      |      ;
 
    RTS                                                        ;81AC73|60      |      ;
 
    RTS                                                        ;81AC74|60      |      ;
 
    RTS                                                        ;81AC75|60      |      ;
 
    RTS                                                        ;81AC76|60      |      ;
 
    RTS                                                        ;81AC77|60      |      ;
 
 
fItemSub81A9F6_0x08:
    RTS                                                        ;81AC78|60      |      ;
 
 
fItemSub81A9F6_0x09:
    RTS                                                        ;81AC79|60      |      ;
 
 
fItemSub81A9F6_0x0A:
    RTS                                                        ;81AC7A|60      |      ;
 
 
fItemSub81A9F6_0x0B:
    RTS                                                        ;81AC7B|60      |      ;
 
 
fItemSub81A9F6_0x0C:
    RTS                                                        ;81AC7C|60      |      ;
 
 
fItemSub81A9F6_0x0D:
    RTS                                                        ;81AC7D|60      |      ;
 
 
fItemSub81A9F6_0x0E:
    RTS                                                        ;81AC7E|60      |      ;
 
 
fItemSub81A9F6_0x0F:
    RTS                                                        ;81AC7F|60      |      ;
 
 
fItemSub81A9F6_0x10to0x13:
    REP #$30                                                   ;81AC80|C230    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;81AC82|AD9601  |000196;
    AND.W #$0002                                               ;81AC85|290200  |      ;
    BNE +                                                      ;81AC88|D02D    |81ACB7;
    LDA.W strcDialogDisplay.mapFlags                           ;81AC8A|AD9601  |000196;
    AND.W #$0008                                               ;81AC8D|290800  |      ;
    BNE +                                                      ;81AC90|D025    |81ACB7;
 
.loop:
    REP #$30                                                   ;81AC92|C230    |      ;
    %CheckFlag(event1, $0002)
    BEQ .return                                                ;81AC9B|F019    |81ACB6;
    LDA.W #$00E1                                               ;81AC9D|A9E100  |      ;
    LDX.W #$0170                                               ;81ACA0|A27001  |      ;
    LDY.W #$0270                                               ;81ACA3|A07002  |      ;
    PHA                                                        ;81ACA6|48      |      ;
    PHX                                                        ;81ACA7|DA      |      ;
    PHY                                                        ;81ACA8|5A      |      ;
    JSL.L fMap_DrawTilePatternAt                                      ;81ACA9|22CEA781|81A7CE;
    REP #$30                                                   ;81ACAD|C230    |      ;
    PLY                                                        ;81ACAF|7A      |      ;
    PLX                                                        ;81ACB0|FA      |      ;
    PLA                                                        ;81ACB1|68      |      ;
    JSL.L fMap_StampTemplateToCurrentTilemap                                      ;81ACB2|22A7B082|82B0A7;
 
.return:
    RTS                                                        ;81ACB6|60      |      ;
 
 
  + REP #$30                                                   ;81ACB7|C230    |      ;
    LDA.W #$00E2                                               ;81ACB9|A9E200  |      ;
    LDX.W #$0180                                               ;81ACBC|A28001  |      ;
    LDY.W #$0020                                               ;81ACBF|A02000  |      ;
    JSL.L fMap_DrawTilePatternAt                                      ;81ACC2|22CEA781|81A7CE;
    BRA .loop                                                  ;81ACC6|80CA    |81AC92;
 
    RTS                                                        ;81ACC8|60      |      ;
 
    RTS                                                        ;81ACC9|60      |      ;
 
    RTS                                                        ;81ACCA|60      |      ;
 
 
fItemSub81A9F6_0x14:
    RTS                                                        ;81ACCB|60      |      ;
 
 
fItemSub81A9F6_0x15:
    REP #$30                                                   ;81ACCC|C230    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;81ACCE|AD9601  |000196;
    AND.W #$0010                                               ;81ACD1|291000  |      ;
    BEQ +                                                      ;81ACD4|F00D    |81ACE3;
    LDA.W #$00EE                                               ;81ACD6|A9EE00  |      ;
    LDX.W #$0070                                               ;81ACD9|A27000  |      ;
    LDY.W #$00C0                                               ;81ACDC|A0C000  |      ;
    JSL.L fMap_DrawTilePatternAt                                      ;81ACDF|22CEA781|81A7CE;
 
  + REP #$30                                                   ;81ACE3|C230    |      ;
    %CheckFlag(event5, $1000)
    BEQ +                                                      ;81ACEC|F01C    |81AD0A;
    LDA.W #$00FD                                               ;81ACEE|A9FD00  |      ;
    LDX.W #$0090                                               ;81ACF1|A29000  |      ;
    LDY.W #$0040                                               ;81ACF4|A04000  |      ;
    JSL.L fMap_DrawTilePatternAt                                      ;81ACF7|22CEA781|81A7CE;
    REP #$30                                                   ;81ACFB|C230    |      ;
    LDA.W #$00D7                                               ;81ACFD|A9D700  |      ;
    LDX.W #$0090                                               ;81AD00|A29000  |      ;
    LDY.W #$0050                                               ;81AD03|A05000  |      ;
    JSL.L fMap_UpdateCurrentTilemap                            ;81AD06|223AB082|82B03A;
 
  + REP #$30                                                   ;81AD0A|C230    |      ;
    %CheckFlag(event6, $4000)
    BEQ +                                                      ;81AD13|F00D    |81AD22;
    LDA.W #$00FE                                               ;81AD15|A9FE00  |      ;
    LDX.W #$00A0                                               ;81AD18|A2A000  |      ;
    LDY.W #$0030                                               ;81AD1B|A03000  |      ;
    JSL.L fMap_DrawTilePatternAt                                      ;81AD1E|22CEA781|81A7CE;
 
  + RTS                                                        ;81AD22|60      |      ;
 
 
fItemSub81A9F6_0x16:
    REP #$30                                                   ;81AD23|C230    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;81AD25|AD9601  |000196;
    AND.W #$0010                                               ;81AD28|291000  |      ;
    BEQ +                                                      ;81AD2B|F00D    |81AD3A;
    LDA.W #$00EE                                               ;81AD2D|A9EE00  |      ;
    LDX.W #$0070                                               ;81AD30|A27000  |      ;
    LDY.W #$00C0                                               ;81AD33|A0C000  |      ;
    JSL.L fMap_DrawTilePatternAt                                      ;81AD36|22CEA781|81A7CE;
 
  + REP #$30                                                   ;81AD3A|C230    |      ;
    %CheckFlag(event5, $1000)
    BEQ +                                                      ;81AD43|F01C    |81AD61;
    LDA.W #$00FD                                               ;81AD45|A9FD00  |      ;
    LDX.W #$0090                                               ;81AD48|A29000  |      ;
    LDY.W #$0040                                               ;81AD4B|A04000  |      ;
    JSL.L fMap_DrawTilePatternAt                                      ;81AD4E|22CEA781|81A7CE;
    REP #$30                                                   ;81AD52|C230    |      ;
    LDA.W #$00D7                                               ;81AD54|A9D700  |      ;
    LDX.W #$0090                                               ;81AD57|A29000  |      ;
    LDY.W #$0050                                               ;81AD5A|A05000  |      ;
    JSL.L fMap_UpdateCurrentTilemap                            ;81AD5D|223AB082|82B03A;
 
  + REP #$30                                                   ;81AD61|C230    |      ;
    %CheckFlag(event6, $4000)
    BEQ +                                                      ;81AD6A|F00D    |81AD79;
    LDA.W #$00FE                                               ;81AD6C|A9FE00  |      ;
    LDX.W #$00A0                                               ;81AD6F|A2A000  |      ;
    LDY.W #$0030                                               ;81AD72|A03000  |      ;
    JSL.L fMap_DrawTilePatternAt                                      ;81AD75|22CEA781|81A7CE;
 
  + RTS                                                        ;81AD79|60      |      ;
 
 
fItemSub81A9F6_0x17:
    REP #$30                                                   ;81AD7A|C230    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;81AD7C|AD9601  |000196;
    AND.W #$0010                                               ;81AD7F|291000  |      ;
    BEQ +                                                      ;81AD82|F00D    |81AD91;
    LDA.W #$00EE                                               ;81AD84|A9EE00  |      ;
    LDX.W #$0070                                               ;81AD87|A27000  |      ;
    LDY.W #$00C0                                               ;81AD8A|A0C000  |      ;
    JSL.L fMap_DrawTilePatternAt                                      ;81AD8D|22CEA781|81A7CE;
 
  + REP #$30                                                   ;81AD91|C230    |      ;
    %CheckFlag(event5, $1000)
    BEQ +                                                      ;81AD9A|F01C    |81ADB8;
    LDA.W #$00FD                                               ;81AD9C|A9FD00  |      ;
    LDX.W #$0140                                               ;81AD9F|A24001  |      ;
    LDY.W #$0050                                               ;81ADA2|A05000  |      ;
    JSL.L fMap_DrawTilePatternAt                                      ;81ADA5|22CEA781|81A7CE;
    REP #$30                                                   ;81ADA9|C230    |      ;
    LDA.W #$00D7                                               ;81ADAB|A9D700  |      ;
    LDX.W #$0140                                               ;81ADAE|A24001  |      ;
    LDY.W #$0060                                               ;81ADB1|A06000  |      ;
    JSL.L fMap_UpdateCurrentTilemap                            ;81ADB4|223AB082|82B03A;
 
  + REP #$30                                                   ;81ADB8|C230    |      ;
    %CheckFlag(event6, $4000)
    BEQ +                                                      ;81ADC1|F00D    |81ADD0;
    LDA.W #$00FE                                               ;81ADC3|A9FE00  |      ;
    LDX.W #$0150                                               ;81ADC6|A25001  |      ;
    LDY.W #$0040                                               ;81ADC9|A04000  |      ;
    JSL.L fMap_DrawTilePatternAt                                      ;81ADCC|22CEA781|81A7CE;
 
  + RTS                                                        ;81ADD0|60      |      ;
 
 
fItemSub81A9F6_0x18:
    RTS                                                        ;81ADD1|60      |      ;
 
 
fItemSub81A9F6_0x19:
    RTS                                                        ;81ADD2|60      |      ;
 
 
fItemSub81A9F6_0x1A:
    RTS                                                        ;81ADD3|60      |      ;
 
 
fItemSub81A9F6_0x1B:
    RTS                                                        ;81ADD4|60      |      ;
 
 
fItemSub81A9F6_0x1C:
    REP #$30                                                   ;81ADD5|C230    |      ;
    %CheckFlag(event3, $0001)
    BNE +                                                      ;81ADDE|D003    |81ADE3;
    JMP.W .return                                              ;81ADE0|4C69AE  |81AE69;
 
 
  + SEP #$20                                                   ;81ADE3|E220    |      ;
    LDA.L nCurrentSeasonID                                     ;81ADE5|AF191F7F|7F1F19;
    CMP.B #$01                                                 ;81ADE9|C901    |      ;
    BNE .checkSeasonSpring                                                ;81ADEB|D01F    |81AE0C;
    LDY.W #$0000                                               ;81ADED|A00000  |      ;
 
.summerLoop:
    PHY                                                        ;81ADF0|5A      |      ;
    REP #$20                                                   ;81ADF1|C220    |      ;
    TYA                                                        ;81ADF3|98      |      ;
    CLC                                                        ;81ADF4|18      |      ;
    ADC.W #$0005                                               ;81ADF5|690500  |      ;
    TYA                                                        ;81ADF8|98      |      ;
    INC A                                                      ;81ADF9|1A      |      ;
    LDX.W #$0001                                               ;81ADFA|A20100  |      ;
    LDY.W #$0002                                               ;81ADFD|A00200  |      ;
    JSR.W fShed_DrawItemPatternByFlag                                      ;81AE00|20BBB2  |81B2BB;
    REP #$30                                                   ;81AE03|C230    |      ;
    PLY                                                        ;81AE05|7A      |      ;
    INY                                                        ;81AE06|C8      |      ;
    CPY.W #$0002                                               ;81AE07|C00200  |      ;
    BNE .summerLoop                                                ;81AE0A|D0E4    |81ADF0;
 
.checkSeasonSpring:
    SEP #$20                                                   ;81AE0C|E220    |      ;
    REP #$10                                                   ;81AE0E|C210    |      ;
    LDA.L nCurrentSeasonID                                     ;81AE10|AF191F7F|7F1F19;
    BNE +                                                      ;81AE14|D01F    |81AE35;
    LDY.W #$0002                                               ;81AE16|A00200  |      ;
 
.loop:
    PHY                                                        ;81AE19|5A      |      ;
    REP #$20                                                   ;81AE1A|C220    |      ;
    TYA                                                        ;81AE1C|98      |      ;
    CLC                                                        ;81AE1D|18      |      ;
    ADC.W #$0005                                               ;81AE1E|690500  |      ;
    TYA                                                        ;81AE21|98      |      ;
    INC A                                                      ;81AE22|1A      |      ;
    LDX.W #$0001                                               ;81AE23|A20100  |      ;
    LDY.W #$0002                                               ;81AE26|A00200  |      ;
    JSR.W fShed_DrawItemPatternByFlag                                      ;81AE29|20BBB2  |81B2BB;
    REP #$30                                                   ;81AE2C|C230    |      ;
    PLY                                                        ;81AE2E|7A      |      ;
    INY                                                        ;81AE2F|C8      |      ;
    CPY.W #$0004                                               ;81AE30|C00400  |      ;
    BNE .loop                                                  ;81AE33|D0E4    |81AE19;
 
  + SEP #$20                                                   ;81AE35|E220    |      ;
    REP #$10                                                   ;81AE37|C210    |      ;
    LDA.L nCurrentSeasonID                                     ;81AE39|AF191F7F|7F1F19;
    CMP.B #$02                                                 ;81AE3D|C902    |      ;
    BCS .exit                                                  ;81AE3F|B00E    |81AE4F;
    REP #$20                                                   ;81AE41|C220    |      ;
    LDA.W #$0005                                               ;81AE43|A90500  |      ;
    LDX.W #$0001                                               ;81AE46|A20100  |      ;
    LDY.W #$0002                                               ;81AE49|A00200  |      ;
    JSR.W fShed_DrawItemPatternByFlag                                      ;81AE4C|20BBB2  |81B2BB;
 
.exit:
    SEP #$20                                                   ;81AE4F|E220    |      ;
    LDA.L nCurrentSeasonID                                     ;81AE51|AF191F7F|7F1F19;
    CMP.B #$02                                                 ;81AE55|C902    |      ;
    BCC +                                                      ;81AE57|9002    |81AE5B;
    BRA .return                                                ;81AE59|800E    |81AE69;
 
 
  + REP #$30                                                   ;81AE5B|C230    |      ;
    LDA.W #$0006                                               ;81AE5D|A90600  |      ;
    LDX.W #$0001                                               ;81AE60|A20100  |      ;
    LDY.W #$0000                                               ;81AE63|A00000  |      ;
    JSR.W fShed_DrawItemPatternByFlag                                      ;81AE66|20BBB2  |81B2BB;
 
.return:
    RTS                                                        ;81AE69|60      |      ;
 
 
fItemSub81A9F6_0x1D:
    RTS                                                        ;81AE6A|60      |      ;
 
 
fItemSub81A9F6_0x1E:
    RTS                                                        ;81AE6B|60      |      ;
 
 
fItemSub81A9F6_0x1F:
    RTS                                                        ;81AE6C|60      |      ;
 
 
fItemSub81A9F6_0x20:
    RTS                                                        ;81AE6D|60      |      ;
 
 
fItemSub81A9F6_0x21:
    RTS                                                        ;81AE6E|60      |      ;
 
 
fItemSub81A9F6_0x22:
    REP #$30                                                   ;81AE6F|C230    |      ;
    %CheckFlag(event3, $0001)
    BNE .paint                                                 ;81AE78|D003    |81AE7D;
    JMP.W .return                                              ;81AE7A|4CBEAF  |81AFBE;
 
 
.paint:
    SEP #$20                                                   ;81AE7D|E220    |      ;
    LDA.W strcPlayerData.toolEquipped                          ;81AE7F|AD2109  |000921;
    CMP.B #$0D                                                 ;81AE82|C90D    |      ;
    BEQ .milker                                                ;81AE84|F020    |81AEA6;
    LDA.W strcPlayerData.toolSecond                            ;81AE86|AD2309  |000923;
    CMP.B #$0D                                                 ;81AE89|C90D    |      ;
    BEQ .milker                                                ;81AE8B|F019    |81AEA6;
    REP #$30                                                   ;81AE8D|C230    |      ;
    %CheckFlag(event1, $0080)
    BEQ .milker                                                ;81AE96|F00E    |81AEA6;
    REP #$20                                                   ;81AE98|C220    |      ;
    LDA.W #$0001                                               ;81AE9A|A90100  |      ;
    LDX.W #$0002                                               ;81AE9D|A20200  |      ;
    LDY.W #$0000                                               ;81AEA0|A00000  |      ;
    JSR.W fShed_DrawItemPatternByFlag                                      ;81AEA3|20BBB2  |81B2BB;
 
.milker:
    SEP #$20                                                   ;81AEA6|E220    |      ;
    LDA.W strcPlayerData.toolEquipped                          ;81AEA8|AD2109  |000921;
    CMP.B #$0E                                                 ;81AEAB|C90E    |      ;
    BEQ .brush                                                 ;81AEAD|F015    |81AEC4;
    LDA.W strcPlayerData.toolSecond                            ;81AEAF|AD2309  |000923;
    CMP.B #$0E                                                 ;81AEB2|C90E    |      ;
    BEQ .brush                                                 ;81AEB4|F00E    |81AEC4;
    REP #$20                                                   ;81AEB6|C220    |      ;
    LDA.W #$0002                                               ;81AEB8|A90200  |      ;
    LDX.W #$0002                                               ;81AEBB|A20200  |      ;
    LDY.W #$0000                                               ;81AEBE|A00000  |      ;
    JSR.W fShed_DrawItemPatternByFlag                                      ;81AEC1|20BBB2  |81B2BB;
 
.brush:
    SEP #$20                                                   ;81AEC4|E220    |      ;
    LDA.W strcPlayerData.toolEquipped                          ;81AEC6|AD2109  |000921;
    CMP.B #$0F                                                 ;81AEC9|C90F    |      ;
    BEQ .goldSickle                                            ;81AECB|F015    |81AEE2;
    LDA.W strcPlayerData.toolSecond                            ;81AECD|AD2309  |000923;
    CMP.B #$0F                                                 ;81AED0|C90F    |      ;
    BEQ .goldSickle                                            ;81AED2|F00E    |81AEE2;
    REP #$20                                                   ;81AED4|C220    |      ;
    LDA.W #$0003                                               ;81AED6|A90300  |      ;
    LDX.W #$0002                                               ;81AED9|A20200  |      ;
    LDY.W #$0000                                               ;81AEDC|A00000  |      ;
    JSR.W fShed_DrawItemPatternByFlag                                      ;81AEDF|20BBB2  |81B2BB;
 
.goldSickle:
    SEP #$20                                                   ;81AEE2|E220    |      ;
    LDA.W strcPlayerData.toolEquipped                          ;81AEE4|AD2109  |000921;
    CMP.B #$11                                                 ;81AEE7|C911    |      ;
    BEQ .goldPlow                                              ;81AEE9|F020    |81AF0B;
    LDA.W strcPlayerData.toolSecond                            ;81AEEB|AD2309  |000923;
    CMP.B #$11                                                 ;81AEEE|C911    |      ;
    BEQ .goldPlow                                              ;81AEF0|F019    |81AF0B;
    REP #$30                                                   ;81AEF2|C230    |      ;
    %CheckFlag(event4, $0001)
    BEQ .goldPlow                                              ;81AEFB|F00E    |81AF0B;
    REP #$20                                                   ;81AEFD|C220    |      ;
    LDA.W #$0004                                               ;81AEFF|A90400  |      ;
    LDX.W #$0002                                               ;81AF02|A20200  |      ;
    LDY.W #$0000                                               ;81AF05|A00000  |      ;
    JSR.W fShed_DrawItemPatternByFlag                                      ;81AF08|20BBB2  |81B2BB;
 
.goldPlow:
    SEP #$20                                                   ;81AF0B|E220    |      ;
    LDA.W strcPlayerData.toolEquipped                          ;81AF0D|AD2109  |000921;
    CMP.B #$12                                                 ;81AF10|C912    |      ;
    BEQ .goldHammer                                            ;81AF12|F020    |81AF34;
    LDA.W strcPlayerData.toolSecond                            ;81AF14|AD2309  |000923;
    CMP.B #$12                                                 ;81AF17|C912    |      ;
    BEQ .goldHammer                                            ;81AF19|F019    |81AF34;
    REP #$30                                                   ;81AF1B|C230    |      ;
    %CheckFlag(event4, $0002)
    BEQ .goldHammer                                            ;81AF24|F00E    |81AF34;
    REP #$20                                                   ;81AF26|C220    |      ;
    LDA.W #$0005                                               ;81AF28|A90500  |      ;
    LDX.W #$0002                                               ;81AF2B|A20200  |      ;
    LDY.W #$0000                                               ;81AF2E|A00000  |      ;
    JSR.W fShed_DrawItemPatternByFlag                                      ;81AF31|20BBB2  |81B2BB;
 
.goldHammer:
    SEP #$20                                                   ;81AF34|E220    |      ;
    LDA.W strcPlayerData.toolEquipped                          ;81AF36|AD2109  |000921;
    CMP.B #$13                                                 ;81AF39|C913    |      ;
    BEQ .goldAxe                                               ;81AF3B|F020    |81AF5D;
    LDA.W strcPlayerData.toolSecond                            ;81AF3D|AD2309  |000923;
    CMP.B #$13                                                 ;81AF40|C913    |      ;
    BEQ .goldAxe                                               ;81AF42|F019    |81AF5D;
    REP #$30                                                   ;81AF44|C230    |      ;
    %CheckFlag(event4, $0004)
    BEQ .goldAxe                                               ;81AF4D|F00E    |81AF5D;
    REP #$20                                                   ;81AF4F|C220    |      ;
    LDA.W #$0006                                               ;81AF51|A90600  |      ;
    LDX.W #$0002                                               ;81AF54|A20200  |      ;
    LDY.W #$0000                                               ;81AF57|A00000  |      ;
    JSR.W fShed_DrawItemPatternByFlag                                      ;81AF5A|20BBB2  |81B2BB;
 
.goldAxe:
    SEP #$20                                                   ;81AF5D|E220    |      ;
    LDA.W strcPlayerData.toolEquipped                          ;81AF5F|AD2109  |000921;
    CMP.B #$14                                                 ;81AF62|C914    |      ;
    BEQ .sprinkler                                             ;81AF64|F020    |81AF86;
    LDA.W strcPlayerData.toolSecond                            ;81AF66|AD2309  |000923;
    CMP.B #$14                                                 ;81AF69|C914    |      ;
    BEQ .sprinkler                                             ;81AF6B|F019    |81AF86;
    REP #$30                                                   ;81AF6D|C230    |      ;
    %CheckFlag(event4, $0008)
    BEQ .sprinkler                                             ;81AF76|F00E    |81AF86;
    REP #$20                                                   ;81AF78|C220    |      ;
    LDA.W #$0007                                               ;81AF7A|A90700  |      ;
    LDX.W #$0002                                               ;81AF7D|A20200  |      ;
    LDY.W #$0000                                               ;81AF80|A00000  |      ;
    JSR.W fShed_DrawItemPatternByFlag                                      ;81AF83|20BBB2  |81B2BB;
 
.sprinkler:
    SEP #$20                                                   ;81AF86|E220    |      ;
    LDA.W strcPlayerData.toolEquipped                          ;81AF88|AD2109  |000921;
    CMP.B #$15                                                 ;81AF8B|C915    |      ;
    BEQ .return                                                ;81AF8D|F02F    |81AFBE;
    LDA.W strcPlayerData.toolSecond                            ;81AF8F|AD2309  |000923;
    CMP.B #$15                                                 ;81AF92|C915    |      ;
    BEQ .return                                                ;81AF94|F028    |81AFBE;
    LDA.L nCurrentYearID                                       ;81AF96|AF181F7F|7F1F18;
    CMP.B #$01                                                 ;81AF9A|C901    |      ;
    BCS .continue                                              ;81AF9C|B012    |81AFB0;
    LDA.L nCurrentSeasonID                                     ;81AF9E|AF191F7F|7F1F19;
    BEQ .return                                                ;81AFA2|F01A    |81AFBE;
    CMP.B #$02                                                 ;81AFA4|C902    |      ;
    BCS .continue                                              ;81AFA6|B008    |81AFB0;
    LDA.L nCurrentDay                                          ;81AFA8|AF1B1F7F|7F1F1B;
    CMP.B #$14                                                 ;81AFAC|C914    |      ;
    BCC .return                                                ;81AFAE|900E    |81AFBE;
 
.continue:
    REP #$20                                                   ;81AFB0|C220    |      ;
    LDA.W #$0008                                               ;81AFB2|A90800  |      ;
    LDX.W #$0002                                               ;81AFB5|A20200  |      ;
    LDY.W #$0000                                               ;81AFB8|A00000  |      ;
    JSR.W fShed_DrawItemPatternByFlag                                      ;81AFBB|20BBB2  |81B2BB;
 
.return:
    RTS                                                        ;81AFBE|60      |      ;
 
 
fItemSub81A9F6_0x23:
    RTS                                                        ;81AFBF|60      |      ;
 
 
fItemSub81A9F6_0x24:
    REP #$30                                                   ;81AFC0|C230    |      ;
    %CheckFlag(event3, $0001)
    BNE +                                                      ;81AFC9|D003    |81AFCE;
    JMP.W .return                                              ;81AFCB|4C62B0  |81B062;
 
 
  + REP #$20                                                   ;81AFCE|C220    |      ;
    %CheckFlag(event1, $0004)
    BNE .cowMedicine                                           ;81AFD7|D02F    |81B008;
    %CheckFlag(event6, $1000)
    BEQ .cowMedicine                                           ;81AFE0|F026    |81B008;
 
.miraclePotion:
    SEP #$20                                                   ;81AFE2|E220    |      ;
    LDA.L nOwnedCows                                           ;81AFE4|AF0A1F7F|7F1F0A;
    CMP.B #$0C                                                 ;81AFE8|C90C    |      ;
    BEQ .cowMedicine                                           ;81AFEA|F01C    |81B008;
    LDA.W strcPlayerData.toolEquipped                          ;81AFEC|AD2109  |000921;
    CMP.B #$0A                                                 ;81AFEF|C90A    |      ; Miracle Potion
    BEQ .cowMedicine                                           ;81AFF1|F015    |81B008;
    LDA.W strcPlayerData.toolSecond                            ;81AFF3|AD2309  |000923;
    CMP.B #$0A                                                 ;81AFF6|C90A    |      ;
    BEQ .cowMedicine                                           ;81AFF8|F00E    |81B008;
    REP #$30                                                   ;81AFFA|C230    |      ;
    LDA.W #$0001                                               ;81AFFC|A90100  |      ;
    LDX.W #$0003                                               ;81AFFF|A20300  |      ;
    LDY.W #$0000                                               ;81B002|A00000  |      ;
    JSR.W fShed_DrawItemPatternByFlag                                      ;81B005|20BBB2  |81B2BB;
 
.cowMedicine:
    SEP #$20                                                   ;81B008|E220    |      ;
    LDA.W strcPlayerData.toolEquipped                          ;81B00A|AD2109  |000921;
    CMP.B #$09                                                 ;81B00D|C909    |      ;
    BEQ .chickenFeed                                           ;81B00F|F015    |81B026;
    LDA.W strcPlayerData.toolSecond                            ;81B011|AD2309  |000923;
    CMP.B #$09                                                 ;81B014|C909    |      ;
    BEQ .chickenFeed                                           ;81B016|F00E    |81B026;
    REP #$30                                                   ;81B018|C230    |      ;
    LDA.W #$0002                                               ;81B01A|A90200  |      ;
    LDX.W #$0003                                               ;81B01D|A20300  |      ;
    LDY.W #$0000                                               ;81B020|A00000  |      ;
    JSR.W fShed_DrawItemPatternByFlag                                      ;81B023|20BBB2  |81B2BB;
 
.chickenFeed:
    SEP #$20                                                   ;81B026|E220    |      ;
    LDA.W strcPlayerData.toolEquipped                          ;81B028|AD2109  |000921;
    CMP.B #$19                                                 ;81B02B|C919    |      ;
    BEQ .cowFeed                                               ;81B02D|F015    |81B044;
    LDA.W strcPlayerData.toolSecond                            ;81B02F|AD2309  |000923;
    CMP.B #$19                                                 ;81B032|C919    |      ;
    BEQ .cowFeed                                               ;81B034|F00E    |81B044;
    REP #$30                                                   ;81B036|C230    |      ;
    LDA.W #$0003                                               ;81B038|A90300  |      ;
    LDX.W #$0003                                               ;81B03B|A20300  |      ;
    LDY.W #$0000                                               ;81B03E|A00000  |      ;
    JSR.W fShed_DrawItemPatternByFlag                                      ;81B041|20BBB2  |81B2BB;
 
.cowFeed:
    SEP #$20                                                   ;81B044|E220    |      ;
    LDA.W strcPlayerData.toolEquipped                          ;81B046|AD2109  |000921;
    CMP.B #$1A                                                 ;81B049|C91A    |      ;
    BEQ .return                                                ;81B04B|F015    |81B062;
    LDA.W strcPlayerData.toolSecond                            ;81B04D|AD2309  |000923;
    CMP.B #$1A                                                 ;81B050|C91A    |      ;
    BEQ .return                                                ;81B052|F00E    |81B062;
    REP #$30                                                   ;81B054|C230    |      ;
    LDA.W #$0004                                               ;81B056|A90400  |      ;
    LDX.W #$0003                                               ;81B059|A20300  |      ;
    LDY.W #$0000                                               ;81B05C|A00000  |      ;
    JSR.W fShed_DrawItemPatternByFlag                                      ;81B05F|20BBB2  |81B2BB;
 
.return:
    RTS                                                        ;81B062|60      |      ;
 
 
fItemSub81A9F6_0x25:
    RTS                                                        ;81B063|60      |      ;
 
 
fItemSub81A9F6_0x26:
    REP #$30                                                   ;81B064|C230    |      ;
    LDY.W #$0000                                               ;81B066|A00000  |      ;
 
.loop:
    REP #$30                                                   ;81B069|C230    |      ;
    PHY                                                        ;81B06B|5A      |      ;
    TYA                                                        ;81B06C|98      |      ;
    INC A                                                      ;81B06D|1A      |      ;
    LDX.W #$0000                                               ;81B06E|A20000  |      ;
    LDY.W #$0001                                               ;81B071|A00100  |      ;
    JSR.W fShed_DrawItemPatternByFlag                                      ;81B074|20BBB2  |81B2BB;
    REP #$30                                                   ;81B077|C230    |      ;
    PLY                                                        ;81B079|7A      |      ;
    INY                                                        ;81B07A|C8      |      ;
    CPY.W #$0018                                               ;81B07B|C01800  |      ;
    BNE .loop                                                  ;81B07E|D0E9    |81B069;
    REP #$30                                                   ;81B080|C230    |      ;
    %CheckFlag(event3, $2000)
    BNE +                                                      ;81B089|D003    |81B08E;
    JMP.W .return                                              ;81B08B|4CA7B0  |81B0A7;
 
 
  + LDA.W #$00F0                                               ;81B08E|A9F000  |      ;
    LDX.W #$0070                                               ;81B091|A27000  |      ;
    LDY.W #$0020                                               ;81B094|A02000  |      ;
    PHA                                                        ;81B097|48      |      ;
    PHX                                                        ;81B098|DA      |      ;
    PHY                                                        ;81B099|5A      |      ;
    JSL.L fMap_DrawTilePatternAt                                      ;81B09A|22CEA781|81A7CE;
    REP #$30                                                   ;81B09E|C230    |      ;
    PLY                                                        ;81B0A0|7A      |      ;
    PLX                                                        ;81B0A1|FA      |      ;
    PLA                                                        ;81B0A2|68      |      ;
    JSL.L fMap_StampTemplateToCurrentTilemap                                      ;81B0A3|22A7B082|82B0A7;
 
.return:
    RTS                                                        ;81B0A7|60      |      ;
 
 
fItemSub81A9F6_0x27:
    REP #$30                                                   ;81B0A8|C230    |      ;
    LDA.W #$001A                                               ;81B0AA|A91A00  |      ;
    LDX.W #$0000                                               ;81B0AD|A20000  |      ;
    LDY.W #$0001                                               ;81B0B0|A00100  |      ;
    JSR.W fShed_DrawItemPatternByFlag                                      ;81B0B3|20BBB2  |81B2BB;
    REP #$30                                                   ;81B0B6|C230    |      ;
    LDY.W #$0000                                               ;81B0B8|A00000  |      ;
 
.loop:
    REP #$30                                                   ;81B0BB|C230    |      ;
    PHY                                                        ;81B0BD|5A      |      ;
    TYA                                                        ;81B0BE|98      |      ;
    ASL A                                                      ;81B0BF|0A      |      ;
    TAX                                                        ;81B0C0|AA      |      ;
    LDA.L nCowFeedFlagsTable,X                                 ;81B0C1|BF71A582|82A571;
    AND.W strcPlayerData.placedCowFeedFlags                    ;81B0C5|2D3209  |000932;
    BEQ +                                                      ;81B0C8|F019    |81B0E3;
    TYA                                                        ;81B0CA|98      |      ;
    ASL A                                                      ;81B0CB|0A      |      ;
    ASL A                                                      ;81B0CC|0A      |      ;
    TAX                                                        ;81B0CD|AA      |      ;
    LDA.L aCowFeedPositionsXY,X                                      ;81B0CE|BFEDB081|81B0ED;
    PHA                                                        ;81B0D2|48      |      ;
    INX                                                        ;81B0D3|E8      |      ;
    INX                                                        ;81B0D4|E8      |      ;
    LDA.L aCowFeedPositionsXY,X                                      ;81B0D5|BFEDB081|81B0ED;
    PHA                                                        ;81B0D9|48      |      ;
    LDA.W #$0099                                               ;81B0DA|A99900  |      ;
    PLY                                                        ;81B0DD|7A      |      ;
    PLX                                                        ;81B0DE|FA      |      ;
    JSL.L fMap_DrawTilePatternAt                                      ;81B0DF|22CEA781|81A7CE;
 
  + REP #$30                                                   ;81B0E3|C230    |      ;
    PLY                                                        ;81B0E5|7A      |      ;
    INY                                                        ;81B0E6|C8      |      ;
    CPY.W #$000D                                               ;81B0E7|C00D00  |      ;
    BNE .loop                                                  ;81B0EA|D0CF    |81B0BB;
    RTS                                                        ;81B0EC|60      |      ;
 
 
aCowFeedPositionsXY:
    dd $01180088,$00F80088,$00D80088                           ;81B0ED|        |      ;
    dd $00980088,$00780088,$00580088                           ;81B0F9|        |      ;
    dd $01180058,$00F80058,$00D80058                           ;81B105|        |      ;
    dd $00980058,$00780058,$00580058                           ;81B111|        |      ;
    dd $016800C8                                               ;81B11D|        |      ;
 
fItemSub81A9F6_0x28:
    REP #$30                                                   ;81B121|C230    |      ;
    LDA.W #$0019                                               ;81B123|A91900  |      ;
    LDX.W #$0000                                               ;81B126|A20000  |      ;
    LDY.W #$0001                                               ;81B129|A00100  |      ;
    JSR.W fShed_DrawItemPatternByFlag                                      ;81B12C|20BBB2  |81B2BB;
    REP #$30                                                   ;81B12F|C230    |      ;
    REP #$30                                                   ;81B131|C230    |      ;
    LDY.W #$0000                                               ;81B133|A00000  |      ;
 
  - REP #$30                                                   ;81B136|C230    |      ;
    PHY                                                        ;81B138|5A      |      ;
    TYA                                                        ;81B139|98      |      ;
    ASL A                                                      ;81B13A|0A      |      ;
    TAX                                                        ;81B13B|AA      |      ;
    LDA.L nCowFeedFlagsTable,X                                 ;81B13C|BF71A582|82A571;
    AND.W strcPlayerData.placedChickenFeedFlags                ;81B140|2D3409  |000934;
    BEQ +                                                      ;81B143|F019    |81B15E;
    TYA                                                        ;81B145|98      |      ;
    ASL A                                                      ;81B146|0A      |      ;
    ASL A                                                      ;81B147|0A      |      ;
    TAX                                                        ;81B148|AA      |      ;
    LDA.L aChickenFeedPositionsXY,X                                      ;81B149|BF9FB181|81B19F;
    PHA                                                        ;81B14D|48      |      ;
    INX                                                        ;81B14E|E8      |      ;
    INX                                                        ;81B14F|E8      |      ;
    LDA.L aChickenFeedPositionsXY,X                                      ;81B150|BF9FB181|81B19F;
    PHA                                                        ;81B154|48      |      ;
    LDA.W #$0099                                               ;81B155|A99900  |      ;
    PLY                                                        ;81B158|7A      |      ;
    PLX                                                        ;81B159|FA      |      ;
    JSL.L fMap_DrawTilePatternAt                                      ;81B15A|22CEA781|81A7CE;
 
  + REP #$30                                                   ;81B15E|C230    |      ;
    PLY                                                        ;81B160|7A      |      ;
    INY                                                        ;81B161|C8      |      ;
    CPY.W #$000C                                               ;81B162|C00C00  |      ;
    BNE -                                                      ;81B165|D0CF    |81B136;
    REP #$30                                                   ;81B167|C230    |      ;
    LDY.W #$0000                                               ;81B169|A00000  |      ;
 
  - REP #$30                                                   ;81B16C|C230    |      ;
    PHY                                                        ;81B16E|5A      |      ;
    TYA                                                        ;81B16F|98      |      ;
    ASL A                                                      ;81B170|0A      |      ;
    TAX                                                        ;81B171|AA      |      ;
    LDA.L aBitMask16,X                                ;81B172|BF97BF81|81BF97;
    AND.L nEggInCoopFlags                                      ;81B176|2F451F7F|7F1F45;
    BEQ +                                                      ;81B17A|F019    |81B195;
    TYA                                                        ;81B17C|98      |      ;
    ASL A                                                      ;81B17D|0A      |      ;
    ASL A                                                      ;81B17E|0A      |      ;
    TAX                                                        ;81B17F|AA      |      ;
    LDA.L aGameEngine_AddChickenPositionsData,X                ;81B180|BF10CA83|83CA10;
    PHA                                                        ;81B184|48      |      ;
    INX                                                        ;81B185|E8      |      ;
    INX                                                        ;81B186|E8      |      ;
    LDA.L aGameEngine_AddChickenPositionsData,X                ;81B187|BF10CA83|83CA10;
    PHA                                                        ;81B18B|48      |      ;
    LDA.W #$00F1                                               ;81B18C|A9F100  |      ;
    PLY                                                        ;81B18F|7A      |      ;
    PLX                                                        ;81B190|FA      |      ;
    JSL.L fMap_DrawTilePatternAt                                      ;81B191|22CEA781|81A7CE;
 
  + REP #$30                                                   ;81B195|C230    |      ;
    PLY                                                        ;81B197|7A      |      ;
    INY                                                        ;81B198|C8      |      ;
    CPY.W #$000D                                               ;81B199|C00D00  |      ;
    BNE -                                                      ;81B19C|D0CE    |81B16C;
    RTS                                                        ;81B19E|60      |      ;
 
 
aChickenFeedPositionsXY:
    dd $00200020,$00200030,$00200040                           ;81B19F|        |      ;
    dd $00200050,$00200060,$00200070                           ;81B1AB|        |      ;
    dd $00200080,$00200090,$002000A0                           ;81B1B7|        |      ;
    dd $002000B0,$002000C0,$002000D0                           ;81B1C3|        |      ;
 
fItemSub81A9F6_0x29:
    REP #$30                                                   ;81B1CF|C230    |      ;
    %CheckFlag(event5, $0011)
    BEQ .return                                                ;81B1D8|F043    |81B21D;
    LDA.W #$00E4                                               ;81B1DA|A9E400  |      ;
    LDX.W #$0070                                               ;81B1DD|A27000  |      ;
    LDY.W #$0160                                               ;81B1E0|A06001  |      ;
    PHA                                                        ;81B1E3|48      |      ;
    PHX                                                        ;81B1E4|DA      |      ;
    PHY                                                        ;81B1E5|5A      |      ;
    JSL.L fMap_DrawTilePatternAt                                      ;81B1E6|22CEA781|81A7CE;
    REP #$30                                                   ;81B1EA|C230    |      ;
    PLY                                                        ;81B1EC|7A      |      ;
    PLX                                                        ;81B1ED|FA      |      ;
    PLA                                                        ;81B1EE|68      |      ;
    REP #$30                                                   ;81B1EF|C230    |      ;
    LDA.W #$00E4                                               ;81B1F1|A9E400  |      ;
    LDX.W #$0070                                               ;81B1F4|A27000  |      ;
    LDY.W #$0130                                               ;81B1F7|A03001  |      ;
    PHA                                                        ;81B1FA|48      |      ;
    PHX                                                        ;81B1FB|DA      |      ;
    PHY                                                        ;81B1FC|5A      |      ;
    JSL.L fMap_DrawTilePatternAt                                      ;81B1FD|22CEA781|81A7CE;
    REP #$30                                                   ;81B201|C230    |      ;
    PLY                                                        ;81B203|7A      |      ;
    PLX                                                        ;81B204|FA      |      ;
    PLA                                                        ;81B205|68      |      ;
    REP #$30                                                   ;81B206|C230    |      ;
    LDA.W #$00E4                                               ;81B208|A9E400  |      ;
    LDX.W #$0060                                               ;81B20B|A26000  |      ;
    LDY.W #$0170                                               ;81B20E|A07001  |      ;
    PHA                                                        ;81B211|48      |      ;
    PHX                                                        ;81B212|DA      |      ;
    PHY                                                        ;81B213|5A      |      ;
    JSL.L fMap_DrawTilePatternAt                                      ;81B214|22CEA781|81A7CE;
    REP #$30                                                   ;81B218|C230    |      ;
    PLY                                                        ;81B21A|7A      |      ;
    PLX                                                        ;81B21B|FA      |      ;
    PLA                                                        ;81B21C|68      |      ;
 
.return:
    RTS                                                        ;81B21D|60      |      ;
 
 
fItemSub81A9F6_0x2A:
    REP #$30                                                   ;81B21E|C230    |      ;
    %CheckFlag(event1, $0002)
    BNE +                                                      ;81B227|D003    |81B22C;
    JMP.W .return                                              ;81B229|4C60B2  |81B260;
 
 
  + LDA.W #$00EF                                               ;81B22C|A9EF00  |      ;
    LDX.W #$0030                                               ;81B22F|A23000  |      ;
    LDY.W #$0180                                               ;81B232|A08001  |      ;
    PHA                                                        ;81B235|48      |      ;
    PHX                                                        ;81B236|DA      |      ;
    PHY                                                        ;81B237|5A      |      ;
    JSL.L fMap_DrawTilePatternAt                                      ;81B238|22CEA781|81A7CE;
    REP #$30                                                   ;81B23C|C230    |      ;
    PLY                                                        ;81B23E|7A      |      ;
    PLX                                                        ;81B23F|FA      |      ;
    PLA                                                        ;81B240|68      |      ;
    JSL.L fMap_StampTemplateToCurrentTilemap                                      ;81B241|22A7B082|82B0A7;
    REP #$30                                                   ;81B245|C230    |      ;
    LDA.W #$00EF                                               ;81B247|A9EF00  |      ;
    LDX.W #$0020                                               ;81B24A|A22000  |      ;
    LDY.W #$01B0                                               ;81B24D|A0B001  |      ;
    PHA                                                        ;81B250|48      |      ;
    PHX                                                        ;81B251|DA      |      ;
    PHY                                                        ;81B252|5A      |      ;
    JSL.L fMap_DrawTilePatternAt                                      ;81B253|22CEA781|81A7CE;
    REP #$30                                                   ;81B257|C230    |      ;
    PLY                                                        ;81B259|7A      |      ;
    PLX                                                        ;81B25A|FA      |      ;
    PLA                                                        ;81B25B|68      |      ;
    JSL.L fMap_StampTemplateToCurrentTilemap                                      ;81B25C|22A7B082|82B0A7;
 
.return:
    RTS                                                        ;81B260|60      |      ;
 
 
fItemSub81A9F6_0x2B:
    RTS                                                        ;81B261|60      |      ;
 
 
fItemSub81A9F6_0x2C:
    RTS                                                        ;81B262|60      |      ;
 
 
fItemSub81A9F6_0x2D:
    RTS                                                        ;81B263|60      |      ;
 
 
fItemSub81A9F6_0x2E:
    RTS                                                        ;81B264|60      |      ;
 
 
fItemSub81A9F6_0x2F:
    RTS                                                        ;81B265|60      |      ;
 
 
fItemSub81A9F6_0x30:
    RTS                                                        ;81B266|60      |      ;
 
 
fItemSub81A9F6_0x31:
    RTS                                                        ;81B267|60      |      ;
 
 
fItemSub81A9F6_0x32:
    RTS                                                        ;81B268|60      |      ;
 
 
fItemSub81A9F6_0x33:
    RTS                                                        ;81B269|60      |      ;
 
 
fItemSub81A9F6_0x34:
    RTS                                                        ;81B26A|60      |      ;
 
 
fItemSub81A9F6_0x35:
    RTS                                                        ;81B26B|60      |      ;
 
 
fItemSub81A9F6_0x36:
    RTS                                                        ;81B26C|60      |      ;
 
 
fItemSub81A9F6_0x37:
    REP #$30                                                   ;81B26D|C230    |      ;
    %CheckFlag(daily1, $0001)
    BNE .return                                                ;81B276|D01A    |81B292;
    %SetFlag(daily1, $0001)
    REP #$20                                                   ;81B283|C220    |      ;
    LDA.W #$009B                                               ;81B285|A99B00  |      ;
    LDX.W #$0080                                               ;81B288|A28000  |      ;
    LDY.W #$0110                                               ;81B28B|A01001  |      ;
    JSL.L fMap_DrawTilePatternAt                                      ;81B28E|22CEA781|81A7CE;
 
.return:
    RTS                                                        ;81B292|60      |      ;
 
 
fItemSub81A9F6_0x38:
    RTS                                                        ;81B293|60      |      ;
 
 
fItemSub81A9F6_0x39:
    RTS                                                        ;81B294|60      |      ;
 
 
fItemSub81A9F6_0x3A:
    RTS                                                        ;81B295|60      |      ;
 
 
fItemSub81A9F6_0x3B:
    RTS                                                        ;81B296|60      |      ;
 
 
fItemSub81A9F6_0x3C:
    RTS                                                        ;81B297|60      |      ;
 
 
fItemSub81A9F6_0x3D:
    RTS                                                        ;81B298|60      |      ;
 
 
fItemSub81A9F6_0x3E:
    RTS                                                        ;81B299|60      |      ;
 
 
fItemSub81A9F6_0x3F:
    RTS                                                        ;81B29A|60      |      ;
 
 
fItemSub81A9F6_0x40:
    RTS                                                        ;81B29B|60      |      ;
 
 
fItemSub81A9F6_0x41:
    RTS                                                        ;81B29C|60      |      ;
 
 
fItemSub81A9F6_0x42:
    RTS                                                        ;81B29D|60      |      ;
 
 
fItemSub81A9F6_0x43:
    RTS                                                        ;81B29E|60      |      ;
 
 
fItemSub81A9F6_0x44:
    RTS                                                        ;81B29F|60      |      ;
 
 
fItemSub81A9F6_0x45:
    RTS                                                        ;81B2A0|60      |      ;
 
 
fItemSub81A9F6_0x46:
    RTS                                                        ;81B2A1|60      |      ;
 
 
fItemSub81A9F6_0x47:
    RTS                                                        ;81B2A2|60      |      ;
 
 
fItemSub81A9F6_0x48:
    RTS                                                        ;81B2A3|60      |      ;
 
 
fItemSub81A9F6_0x49:
    RTS                                                        ;81B2A4|60      |      ;
 
 
fItemSub81A9F6_0x4A:
    RTS                                                        ;81B2A5|60      |      ;
 
 
fItemSub81A9F6_0x4B:
    RTS                                                        ;81B2A6|60      |      ;
 
 
fItemSub81A9F6_0x4C:
    RTS                                                        ;81B2A7|60      |      ;
 
 
fItemSub81A9F6_0x4D:
    RTS                                                        ;81B2A8|60      |      ;
 
 
fItemSub81A9F6_0x4E:
    RTS                                                        ;81B2A9|60      |      ;
 
 
fItemSub81A9F6_0x4F:
    RTS                                                        ;81B2AA|60      |      ;
 
 
fItemSub81A9F6_0x50:
    RTS                                                        ;81B2AB|60      |      ;
 
 
fItemSub81A9F6_0x51:
    RTS                                                        ;81B2AC|60      |      ;
 
 
fItemSub81A9F6_0x52:
    RTS                                                        ;81B2AD|60      |      ;
 
 
fItemSub81A9F6_0x53:
    RTS                                                        ;81B2AE|60      |      ;
 
 
fItemSub81A9F6_0x54:
    RTS                                                        ;81B2AF|60      |      ;
 
 
fItemSub81A9F6_0x55:
    RTS                                                        ;81B2B0|60      |      ;
 
 
fItemSub81A9F6_0x56:
    RTS                                                        ;81B2B1|60      |      ;
 
 
fItemSub81A9F6_0x57:
    RTS                                                        ;81B2B2|60      |      ;
 
 
fItemSub81A9F6_0x58:
    RTS                                                        ;81B2B3|60      |      ;
 
 
fItemSub81A9F6_0x59:
    RTS                                                        ;81B2B4|60      |      ;
 
 
fItemSub81A9F6_0x5A:
    RTS                                                        ;81B2B5|60      |      ;
 
 
fItemSub81A9F6_0x5B:
    RTS                                                        ;81B2B6|60      |      ;
 
 
fItemSub81A9F6_0x5C:
    RTS                                                        ;81B2B7|60      |      ;
 
 
fItemSub81A9F6_0x5D:
    RTS                                                        ;81B2B8|60      |      ;
 
 
fItemSub81A9F6_0x5E:
    RTS                                                        ;81B2B9|60      |      ;
 
 
fItemSub81A9F6_0x5F:
    RTS                                                        ;81B2BA|60      |      ;
 
 
fShed_DrawItemPatternByFlag:
    REP #$30                                                   ;81B2BB|C230    |      ; A: nArg, X: nArg, Y: nArg
    PHY                                                        ;81B2BD|5A      |      ;
    PHA                                                        ;81B2BE|48      |      ;
    CPX.W #$0000                                               ;81B2BF|E00000  |      ;
    BEQ .case0                                                 ;81B2C2|F00F    |81B2D3;
    CPX.W #$0001                                               ;81B2C4|E00100  |      ;
    BEQ .case1                                                 ;81B2C7|F019    |81B2E2;
    CPX.W #$0002                                               ;81B2C9|E00200  |      ;
    BEQ .case2                                                 ;81B2CC|F023    |81B2F1;
    CPX.W #$0003                                               ;81B2CE|E00300  |      ;
    BEQ .case4                                                 ;81B2D1|F02D    |81B300;
 
.case0:
    REP #$20                                                   ;81B2D3|C220    |      ;
    LDA.W #nShedToolPlacementTable                        ;81B2D5|A90FBE  |      ;
    STA.B ptrTemp0x72                                          ;81B2D8|8572    |000072;
    SEP #$20                                                   ;81B2DA|E220    |      ;
    LDA.B #$81                                                 ;81B2DC|A981    |      ;
    STA.B ptrTemp0x72+2                                        ;81B2DE|8574    |000074;
    BRA .continue                                              ;81B2E0|802D    |81B30F;
 
 
.case1:
    REP #$20                                                   ;81B2E2|C220    |      ;
    if !REGION_EUDE
    LDA.W #$BF03
    else
    LDA.W #$BEEF                                               ;81B2E4|A9EFBE  |      ;
    endif
    STA.B ptrTemp0x72                                          ;81B2E7|8572    |000072;
    SEP #$20                                                   ;81B2E9|E220    |      ;
    LDA.B #$81                                                 ;81B2EB|A981    |      ;
    STA.B ptrTemp0x72+2                                        ;81B2ED|8574    |000074;
    BRA .continue                                              ;81B2EF|801E    |81B30F;
 
 
.case2:
    REP #$20                                                   ;81B2F1|C220    |      ;
    if !REGION_EUDE
    LDA.W #$BF3B
    else
    LDA.W #$BF27                                               ;81B2F3|A927BF  |      ;
    endif
    STA.B ptrTemp0x72                                          ;81B2F6|8572    |000072;
    SEP #$20                                                   ;81B2F8|E220    |      ;
    LDA.B #$81                                                 ;81B2FA|A981    |      ;
    STA.B ptrTemp0x72+2                                        ;81B2FC|8574    |000074;
    BRA .continue                                              ;81B2FE|800F    |81B30F;
 
 
.case4:
    REP #$20                                                   ;81B300|C220    |      ;
    if !REGION_EUDE
    LDA.W #$BF83
    else
    LDA.W #$BF6F                                               ;81B302|A96FBF  |      ;
    endif
    STA.B ptrTemp0x72                                          ;81B305|8572    |000072;
    SEP #$20                                                   ;81B307|E220    |      ;
    LDA.B #$81                                                 ;81B309|A981    |      ;
    STA.B ptrTemp0x72+2                                        ;81B30B|8574    |000074;
    BRA .continue                                              ;81B30D|8000    |81B30F;
 
 
.continue:
    REP #$20                                                   ;81B30F|C220    |      ;
    PLA                                                        ;81B311|68      |      ;
    ASL A                                                      ;81B312|0A      |      ;
    ASL A                                                      ;81B313|0A      |      ;
    ASL A                                                      ;81B314|0A      |      ;
    TAY                                                        ;81B315|A8      |      ;
    PHY                                                        ;81B316|5A      |      ;
    INY                                                        ;81B317|C8      |      ;
    INY                                                        ;81B318|C8      |      ;
    INY                                                        ;81B319|C8      |      ;
    INY                                                        ;81B31A|C8      |      ;
    INY                                                        ;81B31B|C8      |      ;
    INY                                                        ;81B31C|C8      |      ;
    SEP #$20                                                   ;81B31D|E220    |      ;
    LDA.B #$00                                                 ;81B31F|A900    |      ;
    XBA                                                        ;81B321|EB      |      ;
    LDA.B [ptrTemp0x72],Y                                      ;81B322|B772    |000072;
    TAX                                                        ;81B324|AA      |      ;
    INY                                                        ;81B325|C8      |      ;
    LDA.B [ptrTemp0x72],Y                                      ;81B326|B772    |000072;
    STA.B strcVariables.n8Temp1                                ;81B328|8592    |000092;
    PLY                                                        ;81B32A|7A      |      ;
    REP #$20                                                   ;81B32B|C220    |      ;
    PLA                                                        ;81B32D|68      |      ;
    CMP.W #$0002                                               ;81B32E|C90200  |      ;
    BEQ .drawPattern                                                ;81B331|F01B    |81B34E;
    CMP.W #$0001                                               ;81B333|C90100  |      ;
    BEQ .requireFlagSet                                                ;81B336|F00C    |81B344;
    SEP #$20                                                   ;81B338|E220    |      ;
    LDA.L strcShedItems.row1,X                                 ;81B33A|BF001F7F|7F1F00;
    AND.B strcVariables.n8Temp1                                ;81B33E|2592    |000092;
    BNE .return                                                ;81B340|D020    |81B362;
    BRA .drawPattern                                                ;81B342|800A    |81B34E;
 
 
.requireFlagSet:
    SEP #$20                                                   ;81B344|E220    |      ;
    LDA.L strcShedItems.row1,X                                 ;81B346|BF001F7F|7F1F00;
    AND.B strcVariables.n8Temp1                                ;81B34A|2592    |000092;
    BEQ .return                                                ;81B34C|F014    |81B362;
 
.drawPattern:
    REP #$20                                                   ;81B34E|C220    |      ;
    LDA.B [ptrTemp0x72],Y                                      ;81B350|B772    |000072;
    PHA                                                        ;81B352|48      |      ;
    INY                                                        ;81B353|C8      |      ;
    INY                                                        ;81B354|C8      |      ;
    LDA.B [ptrTemp0x72],Y                                      ;81B355|B772    |000072;
    PHA                                                        ;81B357|48      |      ;
    INY                                                        ;81B358|C8      |      ;
    INY                                                        ;81B359|C8      |      ;
    LDA.B [ptrTemp0x72],Y                                      ;81B35A|B772    |000072;
    PLY                                                        ;81B35C|7A      |      ;
    PLX                                                        ;81B35D|FA      |      ;
    JSL.L fMap_DrawTilePatternAt                                      ;81B35E|22CEA781|81A7CE;
 
.return:
    RTS                                                        ;81B362|60      |      ;
 
 
    incsrc "../../../build/gen/blocks/tile_scripts.asm"
