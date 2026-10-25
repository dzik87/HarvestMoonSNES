; Bank $81 module "player_actions" - starts at $81BFB7
 
fPlayer_UpdateHandler:
    SEP #$20                                                   ;81BFB7|E220    |      ;
    REP #$10                                                   ;81BFB9|C210    |      ;
    %CheckPlayerFlags(!PFLAGS_ACTIVE)
    BNE +                                                      ;81BFC2|D003    |81BFC7;
    JMP.W fPlayerAction_CheckIdle                                      ;81BFC4|4C02C0  |81C002;
 
 
  + %CheckPlayerFlags(!PFLAGS_INTERACTING)
    BEQ fPlayerAction_Handler                                  ;81BFCE|F003    |81BFD3;
    JMP.W fPlayerInteraction_Handler                           ;81BFD0|4C70D5  |81D570;
 
 
fPlayerAction_Handler:
    REP #$30                                                   ;81BFD3|C230    |      ;
    LDA.B strcPlayer.action                                    ;81BFD5|A5D4    |0000D4;
    ASL A                                                      ;81BFD7|0A      |      ;
    TAX                                                        ;81BFD8|AA      |      ;
    JMP.W (aPlayerAction_JumpTable,X)                          ;81BFD9|7C27C0  |81C027;
 
 
fPlayerAction0x00:
    %CheckPlayerFlags(!PFLAGS_EATINGMEAL)
    BEQ +                                                      ;81BFE3|F003    |81BFE8;
    JMP.W fPlayerAction_EatMeal                                ;81BFE5|4C14CB  |81CB14;
 
 
  + LDA.B strcPlayer.action                                    ;81BFE8|A5D4    |0000D4;
    CMP.W #!PACTION_RUN                                               
    BNE +                                                      ;81BFED|D003    |81BFF2;
    JMP.W fPlayerAction_Run                                    ;81BFEF|4C36C7  |81C736;
 
 
  + CMP.W #!PACTION_WALK                                               
    BNE +                                                      ;81BFF5|D003    |81BFFA;
    JMP.W fPlayerAction_Walk                                   ;81BFF7|4C6EC6  |81C66E;
 
 
  + CMP.W #$000E                                               ;81BFFA|C90E00  |      ;
    BNE fPlayerAction_CheckIdle                                        ;81BFFD|D003    |81C002;
    JMP.W fPlayerAction0x0E                                      ;81BFFF|4C3BC8  |81C83B;
 
 
fPlayerAction_CheckIdle:
    %CheckPlayerAction(!PACTION_NONE)
    BNE fPlayerAction0x19                                      ;81C009|D003    |81C00E;
    JMP.W fPlayerAction_IdleHandler                                      ;81C00B|4C56C5  |81C556;
 
 
fPlayerAction0x19:
    SEP #$20                                                   ;81C00E|E220    |      ;
    STZ.W strcPlayerData.lastExcercise                         ;81C010|9C2509  |000925;
 
fPlayerAction_Finish:
    JSL.L fCamera_UpdateBG2Scroll                                      ;81C013|22619F80|809F61;
    REP #$20                                                   ;81C017|C220    |      ;
    LDA.W #$0000                                               ;81C019|A90000  |      ;
    STA.B strcMap.unk1E                                        ;81C01C|851E    |00001E;
    LDA.W strcObjectData.direction                             ;81C01E|AD1109  |000911;
    STA.B strcPlayer.direction                                 ;81C021|85DA    |0000DA;
    STA.W strcObjectData.directionNew                          ;81C023|8D1309  |000913;
    RTL                                                        ;81C026|6B      |      ;
 
aPlayerAction_JumpTable:
    dw fPlayerAction0x00                                       ;81C027|        |81BFDC; 0x1D * [ptr16]
    dw fPlayerAction0x00                                       ;81C029|        |81BFDC;
    dw fPlayerAction0x00                                       ;81C02B|        |81BFDC;
    dw fPlayerAction0x03                                       ;81C02D|        |81C86B;
    dw fPlayerAction0x04                                       ;81C02F|        |81C991;
    dw fPlayerAction0x05                                       ;81C031|        |81C9DF;
    dw fPlayerAction0x00                                       ;81C033|        |81BFDC;
    dw fPlayerAction0x00                                       ;81C035|        |81BFDC;
    dw fPlayerAction0x08                                       ;81C037|        |81CA36;
    dw fPlayerAction0x09                                       ;81C039|        |81CB5E;
    dw fPlayerAction0x0A                                       ;81C03B|        |81C51A;
    dw fPlayerAction0x0B                                       ;81C03D|        |81C4EC;
    dw fPlayerAction0x0C_SelectDialog                          ;81C03F|        |81C395;
    dw fPlayerAction0x0D                                       ;81C041|        |81C364;
    dw fPlayerAction0x00                                       ;81C043|        |81BFDC;
    dw fPlayerAction0x0F                                       ;81C045|        |81C232;
    dw fPlayerAction0x10                                       ;81C047|        |81C242;
    dw fPlayerAction0x11_Fishing                               ;81C049|        |81C263;
    dw fPlayerAction0x12_FishingBite                           ;81C04B|        |81C28E;
    dw fPlayerAction0x13                                       ;81C04D|        |81C2AF;
    dw fPlayerAction0x14                                       ;81C04F|        |81C211;
    dw fPlayerAction0x15                                       ;81C051|        |81C1F0;
    dw fPlayerAction0x16                                       ;81C053|        |81C1A1;
    dw fPlayerAction0x17                                       ;81C055|        |81C111;
    dw fPlayerAction0x18                                       ;81C057|        |81C153;
    dw fPlayerAction0x19                                       ;81C059|        |81C00E;
    dw fPlayerAction0x1A                                       ;81C05B|        |81C0B5;
    dw fPlayerAction0x1B                                       ;81C05D|        |81C333;
    dw fPlayerAction0x1C                                       ;81C05F|        |81C061;
 
fPlayerAction0x1C:
    REP #$30                                                   ;81C061|C230    |      ;
    %CheckPlayerFlags(!PFLAGS_ANIMATING)
    BEQ +                                                      ;81C06A|F003    |81C06F;
    JMP.W .label2                                              ;81C06C|4C8AC0  |81C08A;
 
 
  + %SetPlayerFlag(!PFLAGS_ANIMATING)
    SEP #$20                                                   ;81C078|E220    |      ;
    REP #$10                                                   ;81C07A|C210    |      ;
    LDA.B #$00                                                 ;81C07C|A900    |      ;
    XBA                                                        ;81C07E|EB      |      ;
    LDA.W strcPlayerData.toolSecond                            ;81C07F|AD2309  |000923;
    CLC                                                        ;81C082|18      |      ;
    ADC.B #$90                                                 ;81C083|6990    |      ;
    REP #$20                                                   ;81C085|C220    |      ;
    STA.W strcObjectData.spriteIdx                             ;81C087|8D0109  |000901;
 
.label2:
    JSR.W fPlayer_UpdateSpriteObject                                      ;81C08A|20E6CF  |81CFE6;
    REP #$30                                                   ;81C08D|C230    |      ;
    LDA.W strcObjectData.exist                                 ;81C08F|AD1509  |000915;
    CMP.W #$FFFF                                               ;81C092|C9FFFF  |      ;
    BNE .exit                                                  ;81C095|D01B    |81C0B2;
    %SetPlayerAction(!PACTION_NONE)
    SEP #$20                                                   ;81C09E|E220    |      ;
    LDA.W strcPlayerData.toolEquipped                          ;81C0A0|AD2109  |000921;
    PHA                                                        ;81C0A3|48      |      ;
    LDA.W strcPlayerData.toolSecond                            ;81C0A4|AD2309  |000923;
    STA.W strcPlayerData.toolEquipped                          ;81C0A7|8D2109  |000921;
    PLA                                                        ;81C0AA|68      |      ;
    STA.W strcPlayerData.toolSecond                            ;81C0AB|8D2309  |000923;
    JSL.L fToolUsedSound_PlayOnToolChange                         ;81C0AE|22F38F82|828FF3;
 
.exit:
    JMP.W fPlayerAction_CheckIdle                                      ;81C0B2|4C02C0  |81C002;
 
 
fPlayerAction0x1A:
    REP #$30                                                   ;81C0B5|C230    |      ;
    REP #$30                                                   ;81C0B7|C230    |      ;
    LDA.W #$00F2                                               ;81C0B9|A9F200  |      ;
    CLC                                                        ;81C0BC|18      |      ;
    ADC.B strcPlayer.direction                                 ;81C0BD|65DA    |0000DA;
    STA.W strcObjectData.spriteIdx                             ;81C0BF|8D0109  |000901;
    JSR.W fPlayer_UpdateSpriteObject                                      ;81C0C2|20E6CF  |81CFE6;
    REP #$20                                                   ;81C0C5|C220    |      ;
    LDA.W strcObjectData.exist                                 ;81C0C7|AD1509  |000915;
    CMP.W #$FFFF                                               ;81C0CA|C9FFFF  |      ;
    BNE .exit                                                  ;81C0CD|D03F    |81C10E;
    %SetPlayerAction(!PACTION_NONE)
    REP #$30                                                   ;81C0D6|C230    |      ;
    %CheckFlag(daily4, $0004)
    BNE .label1                                                ;81C0DF|D011    |81C0F2;
    REP #$30                                                   ;81C0E1|C230    |      ;
    %AIExecute($0014, $0045, $0000)
    BRA .label2                                                ;81C0F0|800F    |81C101;
 
 
.label1:
    REP #$30                                                   ;81C0F2|C230    |      ;
    %AIExecute($0015, $0045, $0003)
 
.label2:
    REP #$30                                                   ;81C101|C230    |      ;
    %UnsetFlag(daily4, $0006)
 
.exit:
    JMP.W fPlayerAction_CheckIdle                                      ;81C10E|4C02C0  |81C002;
 
 
fPlayerAction0x17:
    REP #$30                                                   ;81C111|C230    |      ;
    LDA.W strcObjectData.directionNew                          ;81C113|AD1309  |000913;
    STA.B strcPlayer.direction                                 ;81C116|85DA    |0000DA;
    STA.W strcObjectData.direction                             ;81C118|8D1109  |000911;
    REP #$30                                                   ;81C11B|C230    |      ;
    LDA.W #$00DC                                               ;81C11D|A9DC00  |      ;
    CLC                                                        ;81C120|18      |      ;
    ADC.B strcPlayer.direction                                 ;81C121|65DA    |0000DA;
    STA.W strcObjectData.spriteIdx                             ;81C123|8D0109  |000901;
    SEP #$20                                                   ;81C126|E220    |      ;
    LDA.B #$01                                                 ;81C128|A901    |      ;
    STA.B strcMap.unk1E                                        ;81C12A|851E    |00001E;
    JSR.W fPlayer_MoveInDirection                                      ;81C12C|2077CB  |81CB77;
    JSR.W fPlayer_UpdateSpriteObject                                      ;81C12F|20E6CF  |81CFE6;
    REP #$20                                                   ;81C132|C220    |      ;
    LDA.W strcObjectData.exist                                 ;81C134|AD1509  |000915;
    CMP.W #$FFFF                                               ;81C137|C9FFFF  |      ;
    BNE .exit                                                  ;81C13A|D014    |81C150;
    %SetPlayerAction(!PACTION_NONE)
    REP #$20                                                   ;81C143|C220    |      ;
    %SetFlag(daily2, $0020)
 
.exit:
    JMP.W fPlayerAction_CheckIdle                                      ;81C150|4C02C0  |81C002;
 
 
fPlayerAction0x18:
    REP #$30                                                   ;81C153|C230    |      ;
    REP #$30                                                   ;81C155|C230    |      ;
    LDA.W #$00E0                                               ;81C157|A9E000  |      ;
    CLC                                                        ;81C15A|18      |      ;
    ADC.W strcObjectData.direction                             ;81C15B|6D1109  |000911;
    STA.W strcObjectData.spriteIdx                             ;81C15E|8D0109  |000901;
    REP #$20                                                   ;81C161|C220    |      ;
    LDA.W strcObjectData.direction                             ;81C163|AD1109  |000911;
    STA.B strcPlayer.direction                                 ;81C166|85DA    |0000DA;
    SEP #$20                                                   ;81C168|E220    |      ;
    LDA.B #$01                                                 ;81C16A|A901    |      ;
    STA.B strcMap.unk1E                                        ;81C16C|851E    |00001E;
    JSR.W fPlayer_MoveInDirection                                      ;81C16E|2077CB  |81CB77;
    JSR.W fPlayer_UpdateSpriteObject                                      ;81C171|20E6CF  |81CFE6;
    REP #$20                                                   ;81C174|C220    |      ;
    LDA.W strcObjectData.exist                                 ;81C176|AD1509  |000915;
    CMP.W #$FFFF                                               ;81C179|C9FFFF  |      ;
    BNE .exit                                                  ;81C17C|D020    |81C19E;
    %SetPlayerAction(!PACTION_NONE)
    %UnsetPlayerFlag(!PFLAGS_RIDINGHORSE)
    REP #$20                                                   ;81C191|C220    |      ;
    %SetFlag(daily2, $0800)
 
.exit:
    JMP.W fPlayerAction_CheckIdle                                      ;81C19E|4C02C0  |81C002;
 
 
fPlayerAction0x16:
    REP #$30                                                   ;81C1A1|C230    |      ;
    REP #$30                                                   ;81C1A3|C230    |      ;
    LDA.W #$00D8                                               ;81C1A5|A9D800  |      ;
    CLC                                                        ;81C1A8|18      |      ;
    ADC.B strcPlayer.direction                                 ;81C1A9|65DA    |0000DA;
    STA.W strcObjectData.spriteIdx                             ;81C1AB|8D0109  |000901;
    JSR.W fPlayer_UpdateSpriteObject                                      ;81C1AE|20E6CF  |81CFE6;
    REP #$20                                                   ;81C1B1|C220    |      ;
    LDA.W strcObjectData.exist                                 ;81C1B3|AD1509  |000915;
    CMP.W #$FFFF                                               ;81C1B6|C9FFFF  |      ;
    BNE .exit                                                  ;81C1B9|D032    |81C1ED;
    %SetPlayerAction(!PACTION_NONE)
    REP #$30                                                   ;81C1C2|C230    |      ;
    LDA.L nDogX                                                ;81C1C4|AF2C1F7F|7F1F2C;
    STA.W nTileInFrontOfPlayerX                                ;81C1C8|8D8509  |000985;
    LDA.L nDogY                                                ;81C1CB|AF2E1F7F|7F1F2E;
    STA.W nTileInFrontOfPlayerY                                ;81C1CF|8D8709  |000987;
    LDA.W #$0016                                               ;81C1D2|A91600  |      ;
    LDX.W #$0000                                               ;81C1D5|A20000  |      ;
    LDY.W #$0012                                               ;81C1D8|A01200  |      ;
    JSL.L fAI_StartSlotScriptAtFrontTile                                    ;81C1DB|22F88084|8480F8;
    REP #$20                                                   ;81C1DF|C220    |      ;
    LDA.W #$0001                                               ;81C1E1|A90100  |      ;
    STA.L $7F1F58                                              ;81C1E4|8F581F7F|7F1F58;
    SEP #$20                                                   ;81C1E8|E220    |      ;
    STZ.W strcStockData.unkDog                                 ;81C1EA|9C3809  |000938;
 
.exit:
    JMP.W fPlayerAction_CheckIdle                                      ;81C1ED|4C02C0  |81C002;
 
 
fPlayerAction0x15:
    REP #$30                                                   ;81C1F0|C230    |      ;
    REP #$30                                                   ;81C1F2|C230    |      ;
    LDA.W #$00CC                                               ;81C1F4|A9CC00  |      ;
    STA.W strcObjectData.spriteIdx                             ;81C1F7|8D0109  |000901;
    JSR.W fPlayer_UpdateSpriteObject                                      ;81C1FA|20E6CF  |81CFE6;
    REP #$20                                                   ;81C1FD|C220    |      ;
    LDA.W strcObjectData.exist                                 ;81C1FF|AD1509  |000915;
    CMP.W #$FFFF                                               ;81C202|C9FFFF  |      ;
    BNE .exit                                                  ;81C205|D007    |81C20E;
    %SetPlayerAction(!PACTION_DRUNK)
 
.exit:
    JMP.W fPlayerAction_CheckIdle                                      ;81C20E|4C02C0  |81C002;
 
 
fPlayerAction0x14:
    REP #$30                                                   ;81C211|C230    |      ;
    REP #$30                                                   ;81C213|C230    |      ;
    LDA.W #$008F                                               ;81C215|A98F00  |      ;
    STA.W strcObjectData.spriteIdx                             ;81C218|8D0109  |000901;
    JSR.W fPlayer_UpdateSpriteObject                                      ;81C21B|20E6CF  |81CFE6;
    REP #$20                                                   ;81C21E|C220    |      ;
    LDA.W strcObjectData.exist                                 ;81C220|AD1509  |000915;
    CMP.W #$FFFF                                               ;81C223|C9FFFF  |      ;
    BNE .exit                                                  ;81C226|D007    |81C22F;
    %SetPlayerAction(!PACTION_NONE)
 
.exit:
    JMP.W fPlayerAction_CheckIdle                                      ;81C22F|4C02C0  |81C002;
 
 
fPlayerAction0x0F:
    REP #$30                                                   ;81C232|C230    |      ;
    REP #$30                                                   ;81C234|C230    |      ;
    LDA.W #$0088                                               ;81C236|A98800  |      ;
    STA.W strcObjectData.spriteIdx                             ;81C239|8D0109  |000901;
    JSR.W fPlayer_UpdateSpriteObject                                      ;81C23C|20E6CF  |81CFE6;
    JMP.W fPlayerAction_CheckIdle                                      ;81C23F|4C02C0  |81C002;
 
 
fPlayerAction0x10:
    REP #$30                                                   ;81C242|C230    |      ;
    REP #$30                                                   ;81C244|C230    |      ;
    LDA.W #$0089                                               ;81C246|A98900  |      ;
    STA.W strcObjectData.spriteIdx                             ;81C249|8D0109  |000901;
    JSR.W fPlayer_UpdateSpriteObject                                      ;81C24C|20E6CF  |81CFE6;
    REP #$20                                                   ;81C24F|C220    |      ;
    LDA.W strcObjectData.exist                                 ;81C251|AD1509  |000915;
    CMP.W #$FFFF                                               ;81C254|C9FFFF  |      ;
    BNE .exit                                                  ;81C257|D007    |81C260;
    %SetPlayerAction(!PACTION_FISHING)
 
.exit:
    JMP.W fPlayerAction_CheckIdle                                      ;81C260|4C02C0  |81C002;
 
 
fPlayerAction0x11_Fishing:
    REP #$30                                                   ;81C263|C230    |      ;
    SEP #$20                                                   ;81C265|E220    |      ;
    LDA.B #$FF                                                 ;81C267|A9FF    |      ;
    JSL.L fCore_GetRandomNumber                                ;81C269|22F98980|8089F9;
    BNE +                                                      ;81C26D|D011    |81C280;
    SEP #$20                                                   ;81C26F|E220    |      ;
    LDA.B #$04                                                 ;81C271|A904    |      ;
    JSL.L fCore_GetRandomNumber                                ;81C273|22F98980|8089F9;
    BNE +                                                      ;81C277|D007    |81C280;
    %SetPlayerAction(!PACTION_FISHINGBITE)
 
  + REP #$30                                                   ;81C280|C230    |      ;
    LDA.W #$008E                                               ;81C282|A98E00  |      ;
    STA.W strcObjectData.spriteIdx                             ;81C285|8D0109  |000901;
    JSR.W fPlayer_UpdateSpriteObject                                      ;81C288|20E6CF  |81CFE6;
    JMP.W fPlayerAction_CheckIdle                                      ;81C28B|4C02C0  |81C002;
 
 
fPlayerAction0x12_FishingBite:
    REP #$30                                                   ;81C28E|C230    |      ;
    REP #$30                                                   ;81C290|C230    |      ;
    LDA.W #$008A                                               ;81C292|A98A00  |      ;
    STA.W strcObjectData.spriteIdx                             ;81C295|8D0109  |000901;
    JSR.W fPlayer_UpdateSpriteObject                                      ;81C298|20E6CF  |81CFE6;
    REP #$20                                                   ;81C29B|C220    |      ;
    LDA.W strcObjectData.exist                                 ;81C29D|AD1509  |000915;
    CMP.W #$FFFF                                               ;81C2A0|C9FFFF  |      ;
    BNE .exit                                                  ;81C2A3|D007    |81C2AC;
    %SetPlayerAction(!PACTION_FISHING)
 
.exit:
    JMP.W fPlayerAction_CheckIdle                                      ;81C2AC|4C02C0  |81C002;
 
 
fPlayerAction0x13:
    REP #$30                                                   ;81C2AF|C230    |      ;
    JSR.W fPlayer_UpdateSpriteObject                                      ;81C2B1|20E6CF  |81CFE6;
    REP #$20                                                   ;81C2B4|C220    |      ;
    LDA.W strcObjectData.exist                                 ;81C2B6|AD1509  |000915;
    CMP.W #$FFFF                                               ;81C2B9|C9FFFF  |      ;
    BNE .exit                                                  ;81C2BC|D072    |81C330;
    %SetPlayerAction(!PACTION_0F)
    REP #$20                                                   ;81C2C5|C220    |      ;
    LDA.W #$0014                                               ;81C2C7|A91400  |      ;
    JSL.L fAI_SetCCPointer                                     ;81C2CA|227C8884|84887C;
    SEP #$20                                                   ;81C2CE|E220    |      ;
    REP #$10                                                   ;81C2D0|C210    |      ;
    LDY.W #$0000                                               ;81C2D2|A00000  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;81C2D5|B7CC    |0000CC;
    BEQ .label1                                                ;81C2D7|F009    |81C2E2;
    REP #$30                                                   ;81C2D9|C230    |      ;
    LDA.W #$0014                                               ;81C2DB|A91400  |      ;
    JSL.L fAI_DeactivateSlotAndObject                                    ;81C2DE|22208084|848020;
 
.label1:
    REP #$30                                                   ;81C2E2|C230    |      ;
    LDA.W strcObjectData.spriteIdx                             ;81C2E4|AD0109  |000901;
    CMP.W #$008B                                               ;81C2E7|C98B00  |      ;
    BEQ .label2                                                ;81C2EA|F017    |81C303;
    CMP.W #$008C                                               ;81C2EC|C98C00  |      ;
    BEQ .label3                                                ;81C2EF|F02D    |81C31E;
    REP #$30                                                   ;81C2F1|C230    |      ;
    %AIExecute($0014, $0000, $0033)
    JMP.W .exit                                                ;81C300|4C30C3  |81C330;
 
 
.label2:
    REP #$30                                                   ;81C303|C230    |      ;
    %AIExecute($0014, $0000, $0035)
    REP #$20                                                   ;81C312|C220    |      ;
    LDA.W #$0002                                               ;81C314|A90200  |      ;
    JSL.L fGameEngine_AddHappiness                             ;81C317|2282B283|83B282;
    JMP.W .exit                                                ;81C31B|4C30C3  |81C330;
 
 
.label3:
    REP #$30                                                   ;81C31E|C230    |      ;
    %AIExecute($0014, $0000, $0034)
    JMP.W .exit                                                ;81C32D|4C30C3  |81C330;
 
 
.exit:
    JMP.W fPlayerAction_CheckIdle                                      ;81C330|4C02C0  |81C002;
 
 
fPlayerAction0x1B:
    REP #$30                                                   ;81C333|C230    |      ;
    %SetFlag(daily4, $0010)
    REP #$30                                                   ;81C340|C230    |      ;
    REP #$30                                                   ;81C342|C230    |      ;
    LDA.W #$00BC                                               ;81C344|A9BC00  |      ;
    CLC                                                        ;81C347|18      |      ;
    ADC.B strcPlayer.direction                                 ;81C348|65DA    |0000DA;
    STA.W strcObjectData.spriteIdx                             ;81C34A|8D0109  |000901;
    JSR.W fPlayer_UpdateSpriteObject                                      ;81C34D|20E6CF  |81CFE6;
    REP #$20                                                   ;81C350|C220    |      ;
    LDA.W strcObjectData.exist                                 ;81C352|AD1509  |000915;
    CMP.W #$FFFF                                               ;81C355|C9FFFF  |      ;
    BNE .exit                                                  ;81C358|D007    |81C361;
    %SetPlayerAction(!PACTION_NONE)
 
.exit:
    JMP.W fPlayerAction_CheckIdle                                      ;81C361|4C02C0  |81C002;
 
 
fPlayerAction0x0D:
    REP #$30                                                   ;81C364|C230    |      ;
    %SetFlag(daily2, $0400)
    REP #$30                                                   ;81C371|C230    |      ;
    REP #$30                                                   ;81C373|C230    |      ;
    LDA.W #$00BC                                               ;81C375|A9BC00  |      ;
    CLC                                                        ;81C378|18      |      ;
    ADC.B strcPlayer.direction                                 ;81C379|65DA    |0000DA;
    STA.W strcObjectData.spriteIdx                             ;81C37B|8D0109  |000901;
    JSR.W fPlayer_UpdateSpriteObject                                      ;81C37E|20E6CF  |81CFE6;
    REP #$20                                                   ;81C381|C220    |      ;
    LDA.W strcObjectData.exist                                 ;81C383|AD1509  |000915;
    CMP.W #$FFFF                                               ;81C386|C9FFFF  |      ;
    BNE .exit                                                  ;81C389|D007    |81C392;
    %SetPlayerAction(!PACTION_NONE)
 
.exit:
    JMP.W fPlayerAction_CheckIdle                                      ;81C392|4C02C0  |81C002;
 
 
fPlayerAction0x0C_SelectDialog:
    REP #$30                                                   ;81C395|C230    |      ;
    %CheckPlayerFlags(!PFLAGS_ANIMATING)
    BEQ +                                                      ;81C39E|F003    |81C3A3;
    JMP.W .continue                                            ;81C3A0|4CCAC4  |81C4CA;
 
 
  + %SetPlayerFlag(!PFLAGS_ANIMATING)
    SEP #$20                                                   ;81C3AC|E220    |      ;
    REP #$10                                                   ;81C3AE|C210    |      ;
    LDA.B #$00                                                 ;81C3B0|A900    |      ;
    XBA                                                        ;81C3B2|EB      |      ;
    LDA.W strcPlayerData.toolEquipped                          ;81C3B3|AD2109  |000921;
    CLC                                                        ;81C3B6|18      |      ;
    ADC.B #$90                                                 ;81C3B7|6990    |      ;
    REP #$20                                                   ;81C3B9|C220    |      ;
    STA.W strcObjectData.spriteIdx                             ;81C3BB|8D0109  |000901;
    REP #$30                                                   ;81C3BE|C230    |      ;
    %CheckFlag(event6, $4000)
    BNE +                                                      ;81C3C7|D003    |81C3CC;
    JMP.W .skip                                                ;81C3C9|4CB2C4  |81C4B2;
 
 
  + %CheckFlag(daily4, $0200)
    BEQ +                                                      ;81C3D3|F003    |81C3D8;
    JMP.W .skip                                                ;81C3D5|4CB2C4  |81C4B2;
 
 
  + SEP #$20                                                   ;81C3D8|E220    |      ;
    LDA.L nCurrentTimeID                                       ;81C3DA|AF1C1F7F|7F1F1C;
    CMP.B #$06                                                 ;81C3DE|C906    |      ;
    BEQ .06am                                                  ;81C3E0|F033    |81C415;
    CMP.B #$07                                                 ;81C3E2|C907    |      ;
    BEQ .07am                                                  ;81C3E4|F037    |81C41D;
    CMP.B #$08                                                 ;81C3E6|C908    |      ;
    BEQ .08am                                                  ;81C3E8|F03B    |81C425;
    CMP.B #$09                                                 ;81C3EA|C909    |      ;
    BEQ .09am                                                  ;81C3EC|F03F    |81C42D;
    CMP.B #$0A                                                 ;81C3EE|C90A    |      ;
    BEQ .10am                                                  ;81C3F0|F043    |81C435;
    CMP.B #$0B                                                 ;81C3F2|C90B    |      ;
    BEQ .11am                                                  ;81C3F4|F047    |81C43D;
    CMP.B #$0C                                                 ;81C3F6|C90C    |      ;
    BEQ .12am                                                  ;81C3F8|F04B    |81C445;
    CMP.B #$0D                                                 ;81C3FA|C90D    |      ;
    BEQ .01pm                                                  ;81C3FC|F04F    |81C44D;
    CMP.B #$0E                                                 ;81C3FE|C90E    |      ;
    BEQ .02pm                                                  ;81C400|F053    |81C455;
    CMP.B #$0F                                                 ;81C402|C90F    |      ;
    BEQ .03pm                                                  ;81C404|F057    |81C45D;
    CMP.B #$10                                                 ;81C406|C910    |      ;
    BEQ .04pm                                                  ;81C408|F05B    |81C465;
    CMP.B #$11                                                 ;81C40A|C911    |      ;
    BEQ .05pm                                                  ;81C40C|F05F    |81C46D;
    CMP.B #$12                                                 ;81C40E|C912    |      ;
    BNE .06am                                                  ;81C410|D003    |81C415;
    JMP.W .12pm                                                ;81C412|4CAAC4  |81C4AA;
 
 
.06am:
    REP #$30                                                   ;81C415|C230    |      ;
    LDX.W #$046B                                               ;81C417|A26B04  |      ;
    JMP.W .timeHandler                                         ;81C41A|4CBAC4  |81C4BA;
 
 
.07am:
    REP #$30                                                   ;81C41D|C230    |      ;
    LDX.W #$046C                                               ;81C41F|A26C04  |      ;
    JMP.W .timeHandler                                         ;81C422|4CBAC4  |81C4BA;
 
 
.08am:
    REP #$30                                                   ;81C425|C230    |      ;
    LDX.W #$046D                                               ;81C427|A26D04  |      ;
    JMP.W .timeHandler                                         ;81C42A|4CBAC4  |81C4BA;
 
 
.09am:
    REP #$30                                                   ;81C42D|C230    |      ;
    LDX.W #$046E                                               ;81C42F|A26E04  |      ;
    JMP.W .timeHandler                                         ;81C432|4CBAC4  |81C4BA;
 
 
.10am:
    REP #$30                                                   ;81C435|C230    |      ;
    LDX.W #$046F                                               ;81C437|A26F04  |      ;
    JMP.W .timeHandler                                         ;81C43A|4CBAC4  |81C4BA;
 
 
.11am:
    REP #$30                                                   ;81C43D|C230    |      ;
    LDX.W #$0470                                               ;81C43F|A27004  |      ;
    JMP.W .timeHandler                                         ;81C442|4CBAC4  |81C4BA;
 
 
.12am:
    REP #$30                                                   ;81C445|C230    |      ;
    LDX.W #$0471                                               ;81C447|A27104  |      ;
    JMP.W .timeHandler                                         ;81C44A|4CBAC4  |81C4BA;
 
 
.01pm:
    REP #$30                                                   ;81C44D|C230    |      ;
    LDX.W #$0472                                               ;81C44F|A27204  |      ;
    JMP.W .timeHandler                                         ;81C452|4CBAC4  |81C4BA;
 
 
.02pm:
    REP #$30                                                   ;81C455|C230    |      ;
    LDX.W #$0473                                               ;81C457|A27304  |      ;
    JMP.W .timeHandler                                         ;81C45A|4CBAC4  |81C4BA;
 
 
.03pm:
    REP #$30                                                   ;81C45D|C230    |      ;
    LDX.W #$0474                                               ;81C45F|A27404  |      ;
    JMP.W .timeHandler                                         ;81C462|4CBAC4  |81C4BA;
 
 
.04pm:
    REP #$30                                                   ;81C465|C230    |      ;
    LDX.W #$0475                                               ;81C467|A27504  |      ;
    JMP.W .timeHandler                                         ;81C46A|4CBAC4  |81C4BA;
 
 
.05pm:
    REP #$30                                                   ;81C46D|C230    |      ;
    %CheckFlag(event2, !EFLAGS2_MARRIEDMARIA)
    BNE .marriedCheck                                          ;81C476|D02A    |81C4A2;
    %CheckFlag(event2, !EFLAGS2_MARRIEDANN)
    BNE .marriedCheck                                          ;81C47F|D021    |81C4A2;
    %CheckFlag(event2, !EFLAGS2_MARRIEDNINA)
    BNE .marriedCheck                                          ;81C488|D018    |81C4A2;
    %CheckFlag(event2, !EFLAGS2_MARRIEDELLEN)
    BNE .marriedCheck                                          ;81C491|D00F    |81C4A2;
    %CheckFlag(event2, !EFLAGS2_MARRIEDEVE)
    BNE .marriedCheck                                          ;81C49A|D006    |81C4A2;
    LDX.W #$0476                                               ;81C49C|A27604  |      ;
    JMP.W .timeHandler                                         ;81C49F|4CBAC4  |81C4BA;
 
 
.marriedCheck:
    REP #$30                                                   ;81C4A2|C230    |      ;
    LDX.W #$0478                                               ;81C4A4|A27804  |      ;
    JMP.W .timeHandler                                         ;81C4A7|4CBAC4  |81C4BA;
 
 
.12pm:
    REP #$30                                                   ;81C4AA|C230    |      ;
    LDX.W #$0477                                               ;81C4AC|A27704  |      ;
    JMP.W .timeHandler                                         ;81C4AF|4CBAC4  |81C4BA;
 
 
.skip:
    REP #$30                                                   ;81C4B2|C230    |      ;
    LDX.W #$046A                                               ;81C4B4|A26A04  |      ;
    JMP.W .timeHandler                                         ;81C4B7|4CBAC4  |81C4BA;
 
 
.timeHandler:
    SEP #$20                                                   ;81C4BA|E220    |      ;
    LDA.B #$02                                                 ;81C4BC|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81C4BE|8D9A01  |00019A;
    LDA.B #$00                                                 ;81C4C1|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81C4C3|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81C4C6|225F9383|83935F;
 
.continue:
    JSR.W fPlayer_UpdateSpriteObject                                      ;81C4CA|20E6CF  |81CFE6;
    REP #$30                                                   ;81C4CD|C230    |      ;
    LDA.W strcObjectData.exist                                 ;81C4CF|AD1509  |000915;
    CMP.W #$FFFF                                               ;81C4D2|C9FFFF  |      ;
    BNE .exit                                                  ;81C4D5|D012    |81C4E9;
    REP #$20                                                   ;81C4D7|C220    |      ;
    %CheckFlag(daily1, $4000)
    BNE .exit                                                  ;81C4E0|D007    |81C4E9;
    %SetPlayerAction(!PACTION_NONE)
 
.exit:
    JMP.W fPlayerAction_CheckIdle                                      ;81C4E9|4C02C0  |81C002;
 
 
fPlayerAction0x0B:
    REP #$30                                                   ;81C4EC|C230    |      ;
    %CheckPlayerFlags(!PFLAGS_ANIMATING)
    BEQ +                                                      ;81C4F5|F003    |81C4FA;
    JMP.W .label1                                              ;81C4F7|4C03C5  |81C503;
 
 
  + %SetPlayerFlag(!PFLAGS_ANIMATING)
 
.label1:
    JSR.W fPlayer_UpdateSpriteObject                                      ;81C503|20E6CF  |81CFE6;
    REP #$20                                                   ;81C506|C220    |      ;
    LDA.W strcObjectData.exist                                 ;81C508|AD1509  |000915;
    CMP.W #$FFFF                                               ;81C50B|C9FFFF  |      ;
    BNE .exit                                                  ;81C50E|D007    |81C517;
    %SetPlayerAction(!PACTION_NONE)
 
.exit:
    JMP.W fPlayerAction_CheckIdle                                      ;81C517|4C02C0  |81C002;
 
 
fPlayerAction0x0A:
    REP #$30                                                   ;81C51A|C230    |      ;
    %CheckPlayerFlags(!PFLAGS_ANIMATING)
    BEQ +                                                      ;81C523|F003    |81C528;
    JMP.W .label1                                              ;81C525|4C31C5  |81C531;
 
 
  + %SetPlayerFlag(!PFLAGS_ANIMATING)
 
.label1:
    JSR.W fPlayer_UpdateSpriteObject                                      ;81C531|20E6CF  |81CFE6;
    REP #$20                                                   ;81C534|C220    |      ;
    LDA.W strcObjectData.exist                                 ;81C536|AD1509  |000915;
    CMP.W #$FFFF                                               ;81C539|C9FFFF  |      ;
    BNE +                                                      ;81C53C|D004    |81C542;
    JSL.L fToolUsedActionHandler                               ;81C53E|22609282|829260;
 
  + SEP #$20                                                   ;81C542|E220    |      ;
    LDA.W strcPlayerData.unkCounter91B                         ;81C544|AD1B09  |00091B;
    INC A                                                      ;81C547|1A      |      ;
    STA.W strcPlayerData.unkCounter91B                         ;81C548|8D1B09  |00091B;
    CMP.B #$18                                                 ;81C54B|C918    |      ;
    BNE .exit                                                  ;81C54D|D004    |81C553;
    JSL.L fToolUsedSound_PlayToolHit                         ;81C54F|22B18F82|828FB1;
 
.exit:
    JMP.W fPlayerAction_CheckIdle                                      ;81C553|4C02C0  |81C002;
 
 
fPlayerAction_IdleHandler:
    REP #$30                                                   ;81C556|C230    |      ;
    %UnsetPlayerFlag(!PFLAGS_ANIMATING)
    %CheckPlayerFlags(!PFLAGS_KNEEING)
    BEQ +                                                      ;81C56B|F003    |81C570;
    JMP.W .exit3                                               ;81C56D|4C68C6  |81C668;
 
 
  + %CheckPlayerFlags(!PFLAGS_USERCONTROL)
    BNE +                                                      ;81C577|D003    |81C57C;
    JMP.W .label2                                              ;81C579|4CBDC5  |81C5BD;
 
 
  + SEP #$20                                                   ;81C57C|E220    |      ;
    LDA.W strcPlayerData.lastExcercise                         ;81C57E|AD2509  |000925;
    CMP.B #$F0                                                 ;81C581|C9F0    |      ;
    BNE .label1                                                ;81C583|D030    |81C5B5;
    LDA.B #$78                                                 ;81C585|A978    |      ;
    STA.W strcPlayerData.lastExcercise                         ;81C587|8D2509  |000925;
    %SetPlayerAction(!PACTION_EXCERCISE)
    LDA.B strcPlayer.direction                                 ;81C591|A5DA    |0000DA;
    ASL A                                                      ;81C593|0A      |      ;
    CLC                                                        ;81C594|18      |      ;
    ADC.W #$003C                                               ;81C595|693C00  |      ;
    STA.W strcObjectData.spriteIdx                             ;81C598|8D0109  |000901;
    SEP #$20                                                   ;81C59B|E220    |      ;
    LDA.B #$02                                                 ;81C59D|A902    |      ;
    JSL.L fCore_GetRandomNumber                                ;81C59F|22F98980|8089F9;
    SEP #$20                                                   ;81C5A3|E220    |      ;
    XBA                                                        ;81C5A5|EB      |      ;
    LDA.B #$00                                                 ;81C5A6|A900    |      ;
    XBA                                                        ;81C5A8|EB      |      ;
    REP #$20                                                   ;81C5A9|C220    |      ;
    CLC                                                        ;81C5AB|18      |      ;
    ADC.W strcObjectData.spriteIdx                             ;81C5AC|6D0109  |000901;
    STA.W strcObjectData.spriteIdx                             ;81C5AF|8D0109  |000901;
    JMP.W fPlayerAction0x09                                    ;81C5B2|4C5ECB  |81CB5E;
 
 
.label1:
    SEP #$20                                                   ;81C5B5|E220    |      ;
    REP #$10                                                   ;81C5B7|C210    |      ;
    INC A                                                      ;81C5B9|1A      |      ;
    STA.W strcPlayerData.lastExcercise                         ;81C5BA|8D2509  |000925;
 
.label2:
    %CheckPlayerFlags(!PFLAGS_HOLDINGITEM)
    BEQ +                                                      ;81C5C4|F003    |81C5C9;
    JMP.W .label3                                              ;81C5C6|4C11C6  |81C611;
 
 
  + %CheckPlayerFlags(!PFLAGS_RIDINGHORSE)
    BEQ +                                                      ;81C5D0|F003    |81C5D5;
    JMP.W .label4                                              ;81C5D2|4C1EC6  |81C61E;
 
 
  + %CheckPlayerFlags(!PFLAGS_INSPRINGS)
    BEQ +                                                      ;81C5DC|F003    |81C5E1;
    JMP.W .label5                                              ;81C5DE|4C2BC6  |81C62B;
 
 
  + %CheckPlayerFlags(!PFLAGS_SITTING)
    BEQ +                                                      ;81C5E8|F003    |81C5ED;
    JMP.W .label6                                              ;81C5EA|4C38C6  |81C638;
 
 
  + %CheckPlayerFlags(!PFLAGS_DOGHUGGING)
    BEQ +                                                      ;81C5F4|F003    |81C5F9;
    JMP.W .label7                                              ;81C5F6|4C42C6  |81C642;
 
 
  + REP #$20                                                   ;81C5F9|C220    |      ;
    %CheckFlag(daily4, $0006)
    BNE .label8                                                ;81C602|D04B    |81C64F;
    REP #$30                                                   ;81C604|C230    |      ;
    LDA.W #$0000                                               ;81C606|A90000  |      ;
    CLC                                                        ;81C609|18      |      ;
    ADC.B strcPlayer.direction                                 ;81C60A|65DA    |0000DA;
    STA.W strcObjectData.spriteIdx                             ;81C60C|8D0109  |000901;
    BRA .exit1                                                 ;81C60F|804B    |81C65C;
 
 
.label3:
    REP #$30                                                   ;81C611|C230    |      ;
    LDA.W #$0014                                               ;81C613|A91400  |      ;
    CLC                                                        ;81C616|18      |      ;
    ADC.B strcPlayer.direction                                 ;81C617|65DA    |0000DA;
    STA.W strcObjectData.spriteIdx                             ;81C619|8D0109  |000901;
    BRA .exit2                                                 ;81C61C|8044    |81C662;
 
 
.label4:
    REP #$30                                                   ;81C61E|C230    |      ;
    LDA.W #$00B0                                               ;81C620|A9B000  |      ;
    CLC                                                        ;81C623|18      |      ;
    ADC.B strcPlayer.direction                                 ;81C624|65DA    |0000DA;
    STA.W strcObjectData.spriteIdx                             ;81C626|8D0109  |000901;
    BRA .exit2                                                 ;81C629|8037    |81C662;
 
 
.label5:
    REP #$30                                                   ;81C62B|C230    |      ;
    LDA.W #$00C0                                               ;81C62D|A9C000  |      ;
    CLC                                                        ;81C630|18      |      ;
    ADC.B strcPlayer.direction                                 ;81C631|65DA    |0000DA;
    STA.W strcObjectData.spriteIdx                             ;81C633|8D0109  |000901;
    BRA .exit2                                                 ;81C636|802A    |81C662;
 
 
.label6:
    REP #$30                                                   ;81C638|C230    |      ;
    LDA.W #$004F                                               ;81C63A|A94F00  |      ;
    STA.W strcObjectData.spriteIdx                             ;81C63D|8D0109  |000901;
    BRA .exit2                                                 ;81C640|8020    |81C662;
 
 
.label7:
    REP #$30                                                   ;81C642|C230    |      ;
    LDA.W #$00D0                                               ;81C644|A9D000  |      ;
    CLC                                                        ;81C647|18      |      ;
    ADC.B strcPlayer.direction                                 ;81C648|65DA    |0000DA;
    STA.W strcObjectData.spriteIdx                             ;81C64A|8D0109  |000901;
    BRA .exit2                                                 ;81C64D|8013    |81C662;
 
 
.label8:
    REP #$30                                                   ;81C64F|C230    |      ;
    LDA.W #$00EA                                               ;81C651|A9EA00  |      ;
    CLC                                                        ;81C654|18      |      ;
    ADC.B strcPlayer.direction                                 ;81C655|65DA    |0000DA;
    STA.W strcObjectData.spriteIdx                             ;81C657|8D0109  |000901;
    BRA .exit2                                                 ;81C65A|8006    |81C662;
 
 
.exit1:
    JSR.W fPlayer_UpdateSpriteObject                                      ;81C65C|20E6CF  |81CFE6;
    JMP.W fPlayerAction_Finish                                      ;81C65F|4C13C0  |81C013;
 
 
.exit2:
    JSR.W fPlayer_UpdateSpriteObject                                      ;81C662|20E6CF  |81CFE6;
    JMP.W fPlayerAction0x19                                    ;81C665|4C0EC0  |81C00E;
 
 
.exit3:
    JSR.W fPlayer_UpdateSpriteObject                                      ;81C668|20E6CF  |81CFE6;
    JMP.W fPlayerAction0x19                                    ;81C66B|4C0EC0  |81C00E;
 
 
fPlayerAction_Walk:
    REP #$30                                                   ;81C66E|C230    |      ;
    %UnsetPlayerFlag(!PFLAGS_ANIMATING)
    REP #$20                                                   ;81C67C|C220    |      ;
    %CheckPlayerFlagsNoReg(!PFLAGS_HOLDINGITEM)
    BEQ +                                                      ;81C683|F003    |81C688;
    JMP.W .label1                                              ;81C685|4CC2C6  |81C6C2;
 
 
  + %CheckPlayerFlagsNoReg(!PFLAGS_RIDINGHORSE)
    BEQ +                                                      ;81C68D|F003    |81C692;
    JMP.W .label2                                              ;81C68F|4CD5C6  |81C6D5;
 
 
  + %CheckPlayerFlagsNoReg(!PFLAGS_INSPRINGS)
    BEQ +                                                      ;81C697|F003    |81C69C;
    JMP.W .label3                                              ;81C699|4CE9C6  |81C6E9;
 
 
  + %CheckPlayerFlagsNoReg(!PFLAGS_DOGHUGGING)
    BEQ +                                                      ;81C6A1|F003    |81C6A6;
    JMP.W .label4                                              ;81C6A3|4CFCC6  |81C6FC;
 
 
  + %CheckFlag(daily4, $0006)
    BNE .label5                                                ;81C6AD|D060    |81C70F;
    REP #$30                                                   ;81C6AF|C230    |      ;
    LDA.W #$0004                                               ;81C6B1|A90400  |      ;
    CLC                                                        ;81C6B4|18      |      ;
    ADC.B strcPlayer.direction                                 ;81C6B5|65DA    |0000DA;
    STA.W strcObjectData.spriteIdx                             ;81C6B7|8D0109  |000901;
    SEP #$20                                                   ;81C6BA|E220    |      ;
    LDA.B #$01                                                 ;81C6BC|A901    |      ;
    STA.B strcMap.unk1E                                        ;81C6BE|851E    |00001E;
    BRA .exit                                                  ;81C6C0|8060    |81C722;
 
 
.label1:
    REP #$30                                                   ;81C6C2|C230    |      ;
    LDA.W #$0028                                               ;81C6C4|A92800  |      ;
    CLC                                                        ;81C6C7|18      |      ;
    ADC.B strcPlayer.direction                                 ;81C6C8|65DA    |0000DA;
    STA.W strcObjectData.spriteIdx                             ;81C6CA|8D0109  |000901;
    SEP #$20                                                   ;81C6CD|E220    |      ;
    LDA.B #$01                                                 ;81C6CF|A901    |      ;
    STA.B strcMap.unk1E                                        ;81C6D1|851E    |00001E;
    BRA .exit                                                  ;81C6D3|804D    |81C722;
 
 
.label2:
    REP #$30                                                   ;81C6D5|C230    |      ;
    LDA.W #$00B4                                               ;81C6D7|A9B400  |      ;
    CLC                                                        ;81C6DA|18      |      ;
    ADC.B strcPlayer.direction                                 ;81C6DB|65DA    |0000DA;
    STA.W strcObjectData.spriteIdx                             ;81C6DD|8D0109  |000901;
    SEP #$20                                                   ;81C6E0|E220    |      ;
    LDA.B #$03                                                 ;81C6E2|A903    |      ;
    STA.B strcMap.unk1E                                        ;81C6E4|851E    |00001E;
    JMP.W fPlayerAction_Run_StepSound                                      ;81C6E6|4C06C8  |81C806;
 
 
.label3:
    REP #$30                                                   ;81C6E9|C230    |      ;
    LDA.W #$00C4                                               ;81C6EB|A9C400  |      ;
    CLC                                                        ;81C6EE|18      |      ;
    ADC.B strcPlayer.direction                                 ;81C6EF|65DA    |0000DA;
    STA.W strcObjectData.spriteIdx                             ;81C6F1|8D0109  |000901;
    SEP #$20                                                   ;81C6F4|E220    |      ;
    LDA.B #$01                                                 ;81C6F6|A901    |      ;
    STA.B strcMap.unk1E                                        ;81C6F8|851E    |00001E;
    BRA .exit                                                  ;81C6FA|8026    |81C722;
 
 
.label4:
    REP #$30                                                   ;81C6FC|C230    |      ;
    LDA.W #$00D4                                               ;81C6FE|A9D400  |      ;
    CLC                                                        ;81C701|18      |      ;
    ADC.B strcPlayer.direction                                 ;81C702|65DA    |0000DA;
    STA.W strcObjectData.spriteIdx                             ;81C704|8D0109  |000901;
    SEP #$20                                                   ;81C707|E220    |      ;
    LDA.B #$01                                                 ;81C709|A901    |      ;
    STA.B strcMap.unk1E                                        ;81C70B|851E    |00001E;
    BRA .exit                                                  ;81C70D|8013    |81C722;
 
 
.label5:
    REP #$30                                                   ;81C70F|C230    |      ;
    LDA.W #$00EE                                               ;81C711|A9EE00  |      ;
    CLC                                                        ;81C714|18      |      ;
    ADC.B strcPlayer.direction                                 ;81C715|65DA    |0000DA;
    STA.W strcObjectData.spriteIdx                             ;81C717|8D0109  |000901;
    SEP #$20                                                   ;81C71A|E220    |      ;
    LDA.B #$01                                                 ;81C71C|A901    |      ;
    STA.B strcMap.unk1E                                        ;81C71E|851E    |00001E;
    BRA .exit                                                  ;81C720|8000    |81C722;
 
 
.exit:
    JSR.W fPlayer_MoveInDirection                                      ;81C722|2077CB  |81CB77;
    %SetPlayerAction(!PACTION_NONE)
    SEP #$20                                                   ;81C72C|E220    |      ;
    REP #$10                                                   ;81C72E|C210    |      ;
    STZ.W nBreakHitCounter                                     ;81C730|9C6D09  |00096D;
    JMP.W fPlayerAction0x19                                    ;81C733|4C0EC0  |81C00E;
 
 
fPlayerAction_Run:
    REP #$30                                                   ;81C736|C230    |      ;
    %UnsetPlayerFlag(!PFLAGS_ANIMATING)
    REP #$20                                                   ;81C744|C220    |      ;
    %CheckPlayerFlagsNoReg(!PFLAGS_AISTEERING)
    BNE .skip                                                  ;81C74B|D014    |81C761;
    %CheckPlayerFlagsNoReg(!PFLAGS_KNEEING)
    BEQ +                                                      ;81C752|F003    |81C757;
    JMP.W fHelper_81C82A                                       ;81C754|4C2AC8  |81C82A;
 
 
  + %CheckPlayerFlagsNoReg(!PFLAGS_USERCONTROL)
    BNE .skip                                                  ;81C75C|D003    |81C761;
    JMP.W fHelper_81C82A                                       ;81C75E|4C2AC8  |81C82A;
 
 
.skip:
    REP #$20                                                   ;81C761|C220    |      ;
    %CheckPlayerFlagsNoReg(!PFLAGS_HOLDINGITEM)
    BEQ +                                                      ;81C768|F003    |81C76D;
    JMP.W .label1                                              ;81C76A|4CA7C7  |81C7A7;
 
 
  + %CheckPlayerFlagsNoReg(!PFLAGS_RIDINGHORSE)
    BEQ +                                                      ;81C772|F003    |81C777;
    JMP.W .label2                                              ;81C774|4CBAC7  |81C7BA;
 
 
  + %CheckPlayerFlagsNoReg(!PFLAGS_INSPRINGS)
    BEQ +                                                      ;81C77C|F003    |81C781;
    JMP.W .label3                                              ;81C77E|4CCDC7  |81C7CD;
 
 
  + %CheckPlayerFlagsNoReg(!PFLAGS_DOGHUGGING)
    BEQ +                                                      ;81C786|F003    |81C78B;
    JMP.W .label4                                              ;81C788|4CE0C7  |81C7E0;
 
 
  + %CheckFlag(daily4, $0006)
    BNE .label5                                                ;81C792|D05F    |81C7F3;
    REP #$30                                                   ;81C794|C230    |      ;
    LDA.W #$0008                                               ;81C796|A90800  |      ;
    CLC                                                        ;81C799|18      |      ;
    ADC.B strcPlayer.direction                                 ;81C79A|65DA    |0000DA;
    STA.W strcObjectData.spriteIdx                             ;81C79C|8D0109  |000901;
    SEP #$20                                                   ;81C79F|E220    |      ;
    LDA.B #$02                                                 ;81C7A1|A902    |      ;
    STA.B strcMap.unk1E                                        ;81C7A3|851E    |00001E;
    BRA fPlayerAction_Run_StepSound                                        ;81C7A5|805F    |81C806;
 
 
.label1:
    REP #$30                                                   ;81C7A7|C230    |      ;
    LDA.W #$002C                                               ;81C7A9|A92C00  |      ;
    CLC                                                        ;81C7AC|18      |      ;
    ADC.B strcPlayer.direction                                 ;81C7AD|65DA    |0000DA;
    STA.W strcObjectData.spriteIdx                             ;81C7AF|8D0109  |000901;
    SEP #$20                                                   ;81C7B2|E220    |      ;
    LDA.B #$02                                                 ;81C7B4|A902    |      ;
    STA.B strcMap.unk1E                                        ;81C7B6|851E    |00001E;
    BRA fPlayerAction_Run_StepSound                                        ;81C7B8|804C    |81C806;
 
 
.label2:
    REP #$30                                                   ;81C7BA|C230    |      ;
    LDA.W #$00B4                                               ;81C7BC|A9B400  |      ;
    CLC                                                        ;81C7BF|18      |      ;
    ADC.B strcPlayer.direction                                 ;81C7C0|65DA    |0000DA;
    STA.W strcObjectData.spriteIdx                             ;81C7C2|8D0109  |000901;
    SEP #$20                                                   ;81C7C5|E220    |      ;
    LDA.B #$03                                                 ;81C7C7|A903    |      ;
    STA.B strcMap.unk1E                                        ;81C7C9|851E    |00001E;
    BRA fPlayerAction_Run_StepSound                                        ;81C7CB|8039    |81C806;
 
 
.label3:
    REP #$30                                                   ;81C7CD|C230    |      ;
    LDA.W #$00C4                                               ;81C7CF|A9C400  |      ;
    CLC                                                        ;81C7D2|18      |      ;
    ADC.B strcPlayer.direction                                 ;81C7D3|65DA    |0000DA;
    STA.W strcObjectData.spriteIdx                             ;81C7D5|8D0109  |000901;
    SEP #$20                                                   ;81C7D8|E220    |      ;
    LDA.B #$01                                                 ;81C7DA|A901    |      ;
    STA.B strcMap.unk1E                                        ;81C7DC|851E    |00001E;
    BRA fHelper_81C827                                         ;81C7DE|8047    |81C827;
 
 
.label4:
    REP #$30                                                   ;81C7E0|C230    |      ;
    LDA.W #$00D4                                               ;81C7E2|A9D400  |      ;
    CLC                                                        ;81C7E5|18      |      ;
    ADC.B strcPlayer.direction                                 ;81C7E6|65DA    |0000DA;
    STA.W strcObjectData.spriteIdx                             ;81C7E8|8D0109  |000901;
    SEP #$20                                                   ;81C7EB|E220    |      ;
    LDA.B #$01                                                 ;81C7ED|A901    |      ;
    STA.B strcMap.unk1E                                        ;81C7EF|851E    |00001E;
    BRA fHelper_81C827                                         ;81C7F1|8034    |81C827;
 
 
.label5:
    REP #$30                                                   ;81C7F3|C230    |      ;
    LDA.W #$00EE                                               ;81C7F5|A9EE00  |      ;
    CLC                                                        ;81C7F8|18      |      ;
    ADC.B strcPlayer.direction                                 ;81C7F9|65DA    |0000DA;
    STA.W strcObjectData.spriteIdx                             ;81C7FB|8D0109  |000901;
    SEP #$20                                                   ;81C7FE|E220    |      ;
    LDA.B #$01                                                 ;81C800|A901    |      ;
    STA.B strcMap.unk1E                                        ;81C802|851E    |00001E;
    BRA fHelper_81C827                                         ;81C804|8021    |81C827;
 
 
fPlayerAction_Run_StepSound:
    SEP #$20                                                   ;81C806|E220    |      ;
    REP #$10                                                   ;81C808|C210    |      ;
    LDA.W strcPlayerData.unkCounter91A                         ;81C80A|AD1A09  |00091A;
    INC A                                                      ;81C80D|1A      |      ;
    AND.B #$0F                                                 ;81C80E|290F    |      ;
    STA.W strcPlayerData.unkCounter91A                         ;81C810|8D1A09  |00091A;
    BNE fHelper_81C827                                         ;81C813|D012    |81C827;
    SEP #$20                                                   ;81C815|E220    |      ;
    REP #$10                                                   ;81C817|C210    |      ;
    LDA.B #$05                                                 ;81C819|A905    |      ;
    STA.W strcAudio.reg114                                     ;81C81B|8D1401  |000114;
    LDA.B #$06                                                 ;81C81E|A906    |      ;
    STA.W strcAudio.reg115                                     ;81C820|8D1501  |000115;
    JSL.L fAudioSetRegister2to0A                               ;81C823|22328383|838332;
 
fHelper_81C827:
    JSR.W fPlayer_MoveInDirection                                      ;81C827|2077CB  |81CB77;
 
fHelper_81C82A:
    %SetPlayerAction(!PACTION_NONE)
    SEP #$20                                                   ;81C831|E220    |      ;
    REP #$10                                                   ;81C833|C210    |      ;
    STZ.W nBreakHitCounter                                     ;81C835|9C6D09  |00096D;
    JMP.W fPlayerAction0x19                                    ;81C838|4C0EC0  |81C00E;
 
 
fPlayerAction0x0E:
    REP #$30                                                   ;81C83B|C230    |      ;
    %UnsetPlayerFlag(!PFLAGS_ANIMATING)
    REP #$30                                                   ;81C849|C230    |      ;
    LDA.W #$0045                                               ;81C84B|A94500  |      ;
    STA.W strcObjectData.spriteIdx                             ;81C84E|8D0109  |000901;
    SEP #$20                                                   ;81C851|E220    |      ;
    LDA.B #$01                                                 ;81C853|A901    |      ;
    STA.B strcMap.unk1E                                        ;81C855|851E    |00001E;
    JSR.W fPlayer_MoveInDirection                                      ;81C857|2077CB  |81CB77;
    %SetPlayerAction(!PACTION_NONE)
    SEP #$20                                                   ;81C861|E220    |      ;
    REP #$10                                                   ;81C863|C210    |      ;
    STZ.W nBreakHitCounter                                     ;81C865|9C6D09  |00096D;
    JMP.W fPlayerAction0x19                                    ;81C868|4C0EC0  |81C00E;
 
 
fPlayerAction0x03:
    REP #$30                                                   ;81C86B|C230    |      ;
    %CheckPlayerFlags(!PFLAGS_ANIMATING)
    BEQ +                                                      ;81C874|F003    |81C879;
    JMP.W .label4                                              ;81C876|4C23C9  |81C923;
 
 
  + %SetPlayerFlag(!PFLAGS_ANIMATING)
    REP #$20                                                   ;81C882|C220    |      ;
    %CheckPlayerFlagsNoReg(!PFLAGS_HOLDINGITEM)
    BEQ +                                                      ;81C889|F003    |81C88E;
    JMP.W .label1                                              ;81C88B|4CC6C8  |81C8C6;
 
 
  + %CheckPlayerFlagsNoReg(!PFLAGS_RIDINGHORSE)
    BEQ +                                                      ;81C893|F003    |81C898;
    JMP.W .label2                                              ;81C895|4CE5C8  |81C8E5;
 
 
  + %CheckPlayerFlagsNoReg(!PFLAGS_INSPRINGS)
    BEQ +                                                      ;81C89D|F003    |81C8A2;
    JMP.W .label3                                              ;81C89F|4C04C9  |81C904;
 
 
  + REP #$30                                                   ;81C8A2|C230    |      ;
    LDA.W #$000C                                               ;81C8A4|A90C00  |      ;
    CLC                                                        ;81C8A7|18      |      ;
    ADC.B strcPlayer.direction                                 ;81C8A8|65DA    |0000DA;
    STA.W strcObjectData.spriteIdx                             ;81C8AA|8D0109  |000901;
    SEP #$20                                                   ;81C8AD|E220    |      ;
    REP #$10                                                   ;81C8AF|C210    |      ;
    LDA.B #$06                                                 ;81C8B1|A906    |      ;
    STA.W strcAudio.reg114                                     ;81C8B3|8D1401  |000114;
    LDA.B #$06                                                 ;81C8B6|A906    |      ;
    STA.W strcAudio.reg115                                     ;81C8B8|8D1501  |000115;
    JSL.L fAudioSetRegister2to0A                               ;81C8BB|22328383|838332;
    SEP #$20                                                   ;81C8BF|E220    |      ;
    STZ.W $0971                                                ;81C8C1|9C7109  |000971;
    BRA .label4                                                ;81C8C4|805D    |81C923;
 
 
.label1:
    REP #$30                                                   ;81C8C6|C230    |      ;
    LDA.W #$0020                                               ;81C8C8|A92000  |      ;
    CLC                                                        ;81C8CB|18      |      ;
    ADC.B strcPlayer.direction                                 ;81C8CC|65DA    |0000DA;
    STA.W strcObjectData.spriteIdx                             ;81C8CE|8D0109  |000901;
    SEP #$20                                                   ;81C8D1|E220    |      ;
    REP #$10                                                   ;81C8D3|C210    |      ;
    LDA.B #$06                                                 ;81C8D5|A906    |      ;
    STA.W strcAudio.reg114                                     ;81C8D7|8D1401  |000114;
    LDA.B #$06                                                 ;81C8DA|A906    |      ;
    STA.W strcAudio.reg115                                     ;81C8DC|8D1501  |000115;
    JSL.L fAudioSetRegister2to0A                               ;81C8DF|22328383|838332;
    BRA .label4                                                ;81C8E3|803E    |81C923;
 
 
.label2:
    REP #$30                                                   ;81C8E5|C230    |      ;
    LDA.W #$00B8                                               ;81C8E7|A9B800  |      ;
    CLC                                                        ;81C8EA|18      |      ;
    ADC.B strcPlayer.direction                                 ;81C8EB|65DA    |0000DA;
    STA.W strcObjectData.spriteIdx                             ;81C8ED|8D0109  |000901;
    SEP #$20                                                   ;81C8F0|E220    |      ;
    REP #$10                                                   ;81C8F2|C210    |      ;
    LDA.B #$06                                                 ;81C8F4|A906    |      ;
    STA.W strcAudio.reg114                                     ;81C8F6|8D1401  |000114;
    LDA.B #$06                                                 ;81C8F9|A906    |      ;
    STA.W strcAudio.reg115                                     ;81C8FB|8D1501  |000115;
    JSL.L fAudioSetRegister2to0A                               ;81C8FE|22328383|838332;
    BRA .label4                                                ;81C902|801F    |81C923;
 
 
.label3:
    REP #$30                                                   ;81C904|C230    |      ;
    LDA.W #$00C8                                               ;81C906|A9C800  |      ;
    CLC                                                        ;81C909|18      |      ;
    ADC.B strcPlayer.direction                                 ;81C90A|65DA    |0000DA;
    STA.W strcObjectData.spriteIdx                             ;81C90C|8D0109  |000901;
    SEP #$20                                                   ;81C90F|E220    |      ;
    REP #$10                                                   ;81C911|C210    |      ;
    LDA.B #$06                                                 ;81C913|A906    |      ;
    STA.W strcAudio.reg114                                     ;81C915|8D1401  |000114;
    LDA.B #$06                                                 ;81C918|A906    |      ;
    STA.W strcAudio.reg115                                     ;81C91A|8D1501  |000115;
    JSL.L fAudioSetRegister2to0A                               ;81C91D|22328383|838332;
    BRA .label6                                                ;81C921|8026    |81C949;
 
 
.label4:
    SEP #$20                                                   ;81C923|E220    |      ;
    REP #$10                                                   ;81C925|C210    |      ;
    LDA.B #$01                                                 ;81C927|A901    |      ;
    STA.B strcMap.unk1E                                        ;81C929|851E    |00001E;
    %CheckPlayerFlags($0200)
    BNE .label5                                                ;81C932|D003    |81C937;
    JMP.W .label7                                              ;81C934|4C51C9  |81C951;
 
 
.label5:
    SEP #$20                                                   ;81C937|E220    |      ;
    LDA.W $0971                                                ;81C939|AD7109  |000971;
    EOR.B #$01                                                 ;81C93C|4901    |      ;
    STA.W $0971                                                ;81C93E|8D7109  |000971;
    BEQ .label7                                                ;81C941|F00E    |81C951;
    LDA.B #$02                                                 ;81C943|A902    |      ;
    STA.B strcMap.unk1E                                        ;81C945|851E    |00001E;
    BRA .label7                                                ;81C947|8008    |81C951;
 
 
.label6:
    SEP #$20                                                   ;81C949|E220    |      ;
    REP #$10                                                   ;81C94B|C210    |      ;
    LDA.B #$02                                                 ;81C94D|A902    |      ;
    STA.B strcMap.unk1E                                        ;81C94F|851E    |00001E;
 
.label7:
    JSR.W fPlayer_MoveInDirection                                      ;81C951|2077CB  |81CB77;
    JSR.W fPlayer_UpdateSpriteObject                                      ;81C954|20E6CF  |81CFE6;
    REP #$30                                                   ;81C957|C230    |      ;
    LDA.W strcObjectData.exist                                 ;81C959|AD1509  |000915;
    CMP.W #$FFFF                                               ;81C95C|C9FFFF  |      ;
    BNE .exit2                                                 ;81C95F|D02D    |81C98E;
    %SetPlayerAction(!PACTION_NONE)
    %UnsetPlayerFlag(!PFLAGS_FALLING)
    REP #$30                                                   ;81C974|C230    |      ;
    LDA.B strcPlayer.direction                                 ;81C976|A5DA    |0000DA;
    CMP.W #!PDIR_RIGHT                                               
    BNE +                                                      ;81C97B|D003    |81C980;
    JMP.W .exit1                                               ;81C97D|4C82C9  |81C982;
 
 
  + BRA .exit2                                                 ;81C980|800C    |81C98E;
 
 
.exit1:
    %UnsetPlayerFlag(!PFLAGS_INSPRINGS)
 
.exit2:
    JMP.W fPlayerAction_CheckIdle                                      ;81C98E|4C02C0  |81C002;
 
 
fPlayerAction0x04:
    REP #$30                                                   ;81C991|C230    |      ;
    %CheckPlayerFlags(!PFLAGS_ANIMATING)
    BEQ +                                                      ;81C99A|F003    |81C99F;
    JMP.W .label1                                              ;81C99C|4CB7C9  |81C9B7;
 
 
  + %SetPlayerFlag(!PFLAGS_ANIMATING)
    REP #$30                                                   ;81C9A8|C230    |      ;
    LDA.W #$0010                                               ;81C9AA|A91000  |      ;
    CLC                                                        ;81C9AD|18      |      ;
    ADC.B strcPlayer.direction                                 ;81C9AE|65DA    |0000DA;
    STA.W strcObjectData.spriteIdx                             ;81C9B0|8D0109  |000901;
    JSL.L fItemCarried_Begin                                      ;81C9B3|22008081|818000;
 
.label1:
    JSR.W fPlayer_UpdateSpriteObject                                      ;81C9B7|20E6CF  |81CFE6;
    REP #$20                                                   ;81C9BA|C220    |      ;
    LDA.W strcObjectData.exist                                 ;81C9BC|AD1509  |000915;
    CMP.W #$FFFF                                               ;81C9BF|C9FFFF  |      ;
    BNE .exit                                                  ;81C9C2|D018    |81C9DC;
    %SetPlayerAction(!PACTION_NONE)
    %SetPlayerFlag(!PFLAGS_HOLDINGITEM)
    SEP #$20                                                   ;81C9D4|E220    |      ;
    LDA.W strcPlayerData.carryItemId                           ;81C9D6|AD1D09  |00091D;
    STA.W strcPlayerData.carryItemIdPrev                       ;81C9D9|8D1E09  |00091E;
 
.exit:
    JMP.W fPlayerAction_CheckIdle                                      ;81C9DC|4C02C0  |81C002;
 
 
fPlayerAction0x05:
    REP #$30                                                   ;81C9DF|C230    |      ;
    %CheckPlayerFlags(!PFLAGS_ANIMATING)
    BEQ +                                                      ;81C9E8|F003    |81C9ED;
    JMP.W .label1                                              ;81C9EA|4C13CA  |81CA13;
 
 
  + %SetPlayerFlag(!PFLAGS_ANIMATING)
    REP #$30                                                   ;81C9F6|C230    |      ;
    LDA.W #$001C                                               ;81C9F8|A91C00  |      ;
    CLC                                                        ;81C9FB|18      |      ;
    ADC.B strcPlayer.direction                                 ;81C9FC|65DA    |0000DA;
    STA.W strcObjectData.spriteIdx                             ;81C9FE|8D0109  |000901;
    SEP #$20                                                   ;81CA01|E220    |      ;
    REP #$10                                                   ;81CA03|C210    |      ;
    LDA.B #$07                                                 ;81CA05|A907    |      ;
    STA.W strcAudio.reg114                                     ;81CA07|8D1401  |000114;
    LDA.B #$06                                                 ;81CA0A|A906    |      ;
    STA.W strcAudio.reg115                                     ;81CA0C|8D1501  |000115;
    JSL.L fAudioSetRegister2to0A                               ;81CA0F|22328383|838332;
 
.label1:
    JSR.W fPlayer_UpdateSpriteObject                                      ;81CA13|20E6CF  |81CFE6;
    REP #$20                                                   ;81CA16|C220    |      ;
    LDA.W strcObjectData.exist                                 ;81CA18|AD1509  |000915;
    CMP.W #$FFFF                                               ;81CA1B|C9FFFF  |      ;
    BNE .exit                                                  ;81CA1E|D013    |81CA33;
    %SetPlayerAction(!PACTION_NONE)
    %UnsetPlayerFlag(!PFLAGS_HOLDINGITEM)
 
.exit:
    JMP.W fPlayerAction_CheckIdle                                      ;81CA33|4C02C0  |81C002;
 
 
fPlayerAction0x08:
    SEP #$20                                                   ;81CA36|E220    |      ;
    REP #$10                                                   ;81CA38|C210    |      ;
    %CheckPlayerFlags(!PFLAGS_ANIMATING)
    BEQ +                                                      ;81CA41|F003    |81CA46;
    JMP.W .skip                                                ;81CA43|4C60CA  |81CA60;
 
 
  + %SetPlayerFlag(!PFLAGS_ANIMATING)
    SEP #$20                                                   ;81CA4F|E220    |      ;
    LDA.B #$00                                                 ;81CA51|A900    |      ;
    XBA                                                        ;81CA53|EB      |      ;
    LDA.W nCarriedItemId                                       ;81CA54|AD8409  |000984;
    REP #$20                                                   ;81CA57|C220    |      ;
    CLC                                                        ;81CA59|18      |      ;
    ADC.W #$0033                                               ;81CA5A|693300  |      ;
    STA.W strcObjectData.spriteIdx                             ;81CA5D|8D0109  |000901;
 
.skip:
    JSR.W fPlayer_UpdateSpriteObject                                      ;81CA60|20E6CF  |81CFE6;
    REP #$20                                                   ;81CA63|C220    |      ;
    LDA.W strcObjectData.exist                                 ;81CA65|AD1509  |000915;
    CMP.W #$FFFF                                               ;81CA68|C9FFFF  |      ;
    BEQ +                                                      ;81CA6B|F003    |81CA70;
    JMP.W .exit                                                ;81CA6D|4C11CB  |81CB11;
 
 
  + SEP #$20                                                   ;81CA70|E220    |      ;
    LDA.W nCarriedItemId                                       ;81CA72|AD8409  |000984;
    CMP.B #$02                                                 ;81CA75|C902    |      ;
    BEQ .poisonMushroom                                        ;81CA77|F01D    |81CA96;
    LDA.W nCarriedItemId                                       ;81CA79|AD8409  |000984;
    CMP.B #$08                                                 ;81CA7C|C908    |      ;
    BEQ .powerBerry                                            ;81CA7E|F02B    |81CAAB;
    %SetPlayerAction(!PACTION_NONE)
    %UnsetPlayerFlag(!PFLAGS_HOLDINGITEM)
    JMP.W .exit                                                ;81CA93|4C11CB  |81CB11;
 
 
.poisonMushroom:
    %SetPlayerAction(!PACTION_DRUNK)
    %UnsetPlayerFlag(!PFLAGS_HOLDINGITEM)
    BRA .exit                                                  ;81CAA9|8066    |81CB11;
 
 
.powerBerry:
    SEP #$20                                                   ;81CAAB|E220    |      ;
    LDA.L nPowerBerryEaten                                     ;81CAAD|AF361F7F|7F1F36;
    INC A                                                      ;81CAB1|1A      |      ;
    STA.L nPowerBerryEaten                                     ;81CAB2|8F361F7F|7F1F36;
    REP #$20                                                   ;81CAB6|C220    |      ;
    LDA.W #$000A                                               ;81CAB8|A90A00  |      ;
    JSL.L fGameEngine_AddHappiness                             ;81CABB|2282B283|83B282;
    SEP #$20                                                   ;81CABF|E220    |      ;
    LDA.W strcPlayerData.stamina                               ;81CAC1|AD1709  |000917;
    CLC                                                        ;81CAC4|18      |      ;
    ADC.B #$0A                                                 ;81CAC5|690A    |      ;
    STA.W strcPlayerData.stamina                               ;81CAC7|8D1709  |000917;
    %SetPlayerAction(!PACTION_NONE)
    %UnsetPlayerFlag(!PFLAGS_HOLDINGITEM)
    SEP #$20                                                   ;81CADD|E220    |      ;
    LDA.B strcMap.loadAreaId                                   ;81CADF|A522    |000022;
    CMP.B #!AREA_HOUSE1                                                 
    BEQ .goHome                                                ;81CAE3|F01D    |81CB02;
    CMP.B #!AREA_HOUSE2                                                 
    BEQ .goHome                                                ;81CAE7|F019    |81CB02;
    CMP.B #!AREA_HOUSE3                                                 
    BEQ .goHome                                                ;81CAEB|F015    |81CB02;
    LDA.B strcMap.loadAreaId                                   ;81CAED|A522    |000022;
    CMP.B #!AREA_WOODSCAVE                                                 
    BNE .exit                                                  ;81CAF1|D01E    |81CB11;
    REP #$30                                                   ;81CAF3|C230    |      ;
    %SetFlag(event4, $0040)
    BRA .exit                                                  ;81CB00|800F    |81CB11;
 
 
.goHome:
    REP #$30                                                   ;81CB02|C230    |      ;
    %SetFlag(event5, $4000)
    BRA .exit                                                  ;81CB0F|8000    |81CB11;
 
 
.exit:
    JMP.W fPlayerAction_CheckIdle                                      ;81CB11|4C02C0  |81C002;
 
 
fPlayerAction_EatMeal:
    SEP #$20                                                   ;81CB14|E220    |      ;
    REP #$10                                                   ;81CB16|C210    |      ;
    %CheckPlayerFlags(!PFLAGS_ANIMATING)
    BEQ +                                                      ;81CB1F|F003    |81CB24;
    JMP.W .skip                                                ;81CB21|4C38CB  |81CB38;
 
 
  + %SetPlayerFlag($8000)
    SEP #$20                                                   ;81CB2D|E220    |      ;
    LDA.W strcPlayerData.eatFood                               ;81CB2F|AD2409  |000924;
    CLC                                                        ;81CB32|18      |      ;
    ADC.B #$30                                                 ;81CB33|6930    |      ;
    STA.W strcObjectData.spriteIdx                             ;81CB35|8D0109  |000901;
 
.skip:
    JSR.W fPlayer_UpdateSpriteObject                                      ;81CB38|20E6CF  |81CFE6;
    REP #$20                                                   ;81CB3B|C220    |      ;
    LDA.W strcObjectData.exist                                 ;81CB3D|AD1509  |000915;
    CMP.W #$FFFF                                               ;81CB40|C9FFFF  |      ;
    BNE .exit                                                  ;81CB43|D016    |81CB5B;
    %SetPlayerAction(!PACTION_NONE)
    %UnsetPlayerFlag(!PFLAGS_EATINGMEAL)
    JMP.W fPlayerAction_CheckIdle                                      ;81CB58|4C02C0  |81C002;
 
 
.exit:
    JMP.W fPlayerAction0x19                                    ;81CB5B|4C0EC0  |81C00E;
 
 
fPlayerAction0x09:
    REP #$30                                                   ;81CB5E|C230    |      ;
    JSR.W fPlayer_UpdateSpriteObject                                      ;81CB60|20E6CF  |81CFE6;
    REP #$20                                                   ;81CB63|C220    |      ;
    LDA.W strcObjectData.exist                                 ;81CB65|AD1509  |000915;
    CMP.W #$FFFF                                               ;81CB68|C9FFFF  |      ;
    BNE .exit                                                  ;81CB6B|D007    |81CB74;
    %SetPlayerAction(!PACTION_NONE)
 
.exit:
    JMP.W fPlayerAction_Finish                                      ;81CB74|4C13C0  |81C013;
 
 
fPlayer_MoveInDirection:
    JSR.W fPlayer_UpdateSpriteObject                                      ;81CB77|20E6CF  |81CFE6;
    REP #$20                                                   ;81CB7A|C220    |      ;
    LDA.B strcPlayer.direction                                 ;81CB7C|A5DA    |0000DA;
    CMP.W #!PDIR_DOWN                                               
    BNE +                                                      ;81CB81|D003    |81CB86;
    JMP.W .down                                                ;81CB83|4C9ECB  |81CB9E;
 
 
  + CMP.W #!PDIR_UP                                               
    BNE +                                                      ;81CB89|D003    |81CB8E;
    JMP.W .up                                                  ;81CB8B|4C42CC  |81CC42;
 
 
  + CMP.W #!PDIR_LEFT                                               
    BNE +                                                      ;81CB91|D003    |81CB96;
    JMP.W .left                                                ;81CB93|4CE6CC  |81CCE6;
 
 
  + CMP.W #!PDIR_RIGHT                                               
    BNE .down                                                  ;81CB99|D003    |81CB9E;
    JMP.W .right                                               ;81CB9B|4C8ACD  |81CD8A;
 
 
.down:
    REP #$30                                                   ;81CB9E|C230    |      ;
    %CheckPlayerAction(!PACTION_JUMP)
    BNE +                                                      ;81CBA7|D003    |81CBAC;
    JMP.W .addY                                                ;81CBA9|4C30CC  |81CC30;
 
 
  + %CheckPlayerAction(!PACTION_17)
    BNE +                                                      ;81CBB3|D003    |81CBB8;
    JMP.W .addY                                                ;81CBB5|4C30CC  |81CC30;
 
 
  + %CheckPlayerAction(!PACTION_18)
    BNE +                                                      ;81CBBF|D003    |81CBC4;
    JMP.W .addY                                                ;81CBC1|4C30CC  |81CC30;
 
 
  + %CheckPlayerFlags(!PFLAGS_INTRANSITION)
    BEQ +                                                      ;81CBCB|F003    |81CBD0;
    JMP.W .addY                                                ;81CBCD|4C30CC  |81CC30;
 
 
  + LDA.B strcPlayer.posX                                      ;81CBD0|A5D6    |0000D6;
    STA.B strcPlayer.lastX                                     ;81CBD2|85DF    |0000DF;
    LDA.B strcPlayer.posY                                      ;81CBD4|A5D8    |0000D8;
    STA.B strcPlayer.lastY                                     ;81CBD6|85E1    |0000E1;
    LDA.W #$0000                                               ;81CBD8|A90000  |      ;
    STA.B strcPlayer.newX                                      ;81CBDB|85E5    |0000E5;
    LDA.B strcMap.unk1E                                        ;81CBDD|A51E    |00001E;
    STA.B strcPlayer.newY                                      ;81CBDF|85E7    |0000E7;
    STZ.B strcPlayer.unkE3                                     ;81CBE1|64E3    |0000E3;
    REP #$20                                                   ;81CBE3|C220    |      ;
    LDA.B strcPlayer.direction                                 ;81CBE5|A5DA    |0000DA;
    JSL.L fGameEngine_DirectionHandler83AD91                   ;81CBE7|2291AD83|83AD91;
    CMP.W #$0000                                               ;81CBEB|C90000  |      ;
    BEQ +                                                      ;81CBEE|F003    |81CBF3;
    JMP.W .return1                                             ;81CBF0|4C53CE  |81CE53;
 
 
  + REP #$20                                                   ;81CBF3|C220    |      ;
    LDA.B strcPlayer.direction                                 ;81CBF5|A5DA    |0000DA;
    JSL.L fGameEngine_DirectionHandler83AF37                   ;81CBF7|2237AF83|83AF37;
    REP #$30                                                   ;81CBFB|C230    |      ;
    STY.B strcVariables.n16Temp1                               ;81CBFD|847E    |00007E;
    CMP.W #$0001                                               ;81CBFF|C90100  |      ;
    BNE +                                                      ;81CC02|D003    |81CC07;
    JMP.W .sub1                                                ;81CC04|4C58CE  |81CE58;
 
 
  + CMP.W #$0002                                               ;81CC07|C90200  |      ;
    BNE .jump0                                                 ;81CC0A|D003    |81CC0F;
    JMP.W .sub2                                                ;81CC0C|4C81CE  |81CE81;
 
 
.jump0:
    REP #$20                                                   ;81CC0F|C220    |      ;
    LDA.B strcPlayer.unkPosY                                   ;81CC11|A5EB    |0000EB;
    STA.W $087A                                                ;81CC13|8D7A08  |00087A;
    LDA.B strcPlayer.unkPosX                                   ;81CC16|A5E9    |0000E9;
    STA.W $0878                                                ;81CC18|8D7808  |000878;
    SEC                                                        ;81CC1B|38      |      ;
    SBC.W #$00C0                                               ;81CC1C|E9C000  |      ;
    CMP.W #$0010                                               ;81CC1F|C91000  |      ;
    BCS +                                                      ;81CC22|B003    |81CC27;
    JMP.W .return1                                             ;81CC24|4C53CE  |81CE53;
 
 
  + STY.B strcVariables.n16Temp1                               ;81CC27|847E    |00007E;
    LDA.B strcMap.unk1E                                        ;81CC29|A51E    |00001E;
    SEC                                                        ;81CC2B|38      |      ;
    SBC.B strcVariables.n16Temp1                               ;81CC2C|E57E    |00007E;
    STA.B strcMap.unk1E                                        ;81CC2E|851E    |00001E;
 
.addY:
    LDA.B strcPlayer.posY                                      ;81CC30|A5D8    |0000D8;
    CLC                                                        ;81CC32|18      |      ;
    ADC.B strcMap.unk1E                                        ;81CC33|651E    |00001E;
    STA.B strcPlayer.posY                                      ;81CC35|85D8    |0000D8;
    JSL.L fCamera_UpdateFromPlayerPos                                      ;81CC37|22BC9E80|809EBC;
    JSL.L fCamera_ScrollDownStep                                      ;81CC3B|22ABA080|80A0AB;
    JMP.W .exit                                                ;81CC3F|4C2BCE  |81CE2B;
 
 
.up:
    REP #$30                                                   ;81CC42|C230    |      ;
    %CheckPlayerAction(!PACTION_JUMP)
    BNE +                                                      ;81CC4B|D003    |81CC50;
    JMP.W .subY                                                ;81CC4D|4CD4CC  |81CCD4;
 
 
  + %CheckPlayerAction(!PACTION_17)
    BNE +                                                      ;81CC57|D003    |81CC5C;
    JMP.W .subY                                                ;81CC59|4CD4CC  |81CCD4;
 
 
  + %CheckPlayerAction(!PACTION_18)
    BNE +                                                      ;81CC63|D003    |81CC68;
    JMP.W .subY                                                ;81CC65|4CD4CC  |81CCD4;
 
 
  + %CheckPlayerFlags(!PFLAGS_INTRANSITION)
    BEQ +                                                      ;81CC6F|F003    |81CC74;
    JMP.W .subY                                                ;81CC71|4CD4CC  |81CCD4;
 
 
  + LDA.B strcPlayer.posX                                      ;81CC74|A5D6    |0000D6;
    STA.B strcPlayer.lastX                                     ;81CC76|85DF    |0000DF;
    LDA.B strcPlayer.posY                                      ;81CC78|A5D8    |0000D8;
    STA.B strcPlayer.lastY                                     ;81CC7A|85E1    |0000E1;
    LDA.W #$0000                                               ;81CC7C|A90000  |      ;
    STA.B strcPlayer.newX                                      ;81CC7F|85E5    |0000E5;
    LDA.B strcMap.unk1E                                        ;81CC81|A51E    |00001E;
    STA.B strcPlayer.newY                                      ;81CC83|85E7    |0000E7;
    STZ.B strcPlayer.unkE3                                     ;81CC85|64E3    |0000E3;
    REP #$20                                                   ;81CC87|C220    |      ;
    LDA.B strcPlayer.direction                                 ;81CC89|A5DA    |0000DA;
    JSL.L fGameEngine_DirectionHandler83AD91                   ;81CC8B|2291AD83|83AD91;
    CMP.W #$0000                                               ;81CC8F|C90000  |      ;
    BEQ +                                                      ;81CC92|F003    |81CC97;
    JMP.W .return1                                             ;81CC94|4C53CE  |81CE53;
 
 
  + REP #$20                                                   ;81CC97|C220    |      ;
    LDA.B strcPlayer.direction                                 ;81CC99|A5DA    |0000DA;
    JSL.L fGameEngine_DirectionHandler83AF37                   ;81CC9B|2237AF83|83AF37;
    REP #$30                                                   ;81CC9F|C230    |      ;
    STY.B strcVariables.n16Temp1                               ;81CCA1|847E    |00007E;
    CMP.W #$0001                                               ;81CCA3|C90100  |      ;
    BNE +                                                      ;81CCA6|D003    |81CCAB;
    JMP.W .sub3                                                ;81CCA8|4CAACE  |81CEAA;
 
 
  + CMP.W #$0002                                               ;81CCAB|C90200  |      ;
    BNE .jump1                                                 ;81CCAE|D003    |81CCB3;
    JMP.W .sub4                                                ;81CCB0|4CD3CE  |81CED3;
 
 
.jump1:
    REP #$20                                                   ;81CCB3|C220    |      ;
    LDA.B strcPlayer.unkPosY                                   ;81CCB5|A5EB    |0000EB;
    STA.W $087A                                                ;81CCB7|8D7A08  |00087A;
    LDA.B strcPlayer.unkPosX                                   ;81CCBA|A5E9    |0000E9;
    STA.W $0878                                                ;81CCBC|8D7808  |000878;
    SEC                                                        ;81CCBF|38      |      ;
    SBC.W #$00C0                                               ;81CCC0|E9C000  |      ;
    CMP.W #$0010                                               ;81CCC3|C91000  |      ;
    BCS +                                                      ;81CCC6|B003    |81CCCB;
    JMP.W .return1                                             ;81CCC8|4C53CE  |81CE53;
 
 
  + STY.B strcVariables.n16Temp1                               ;81CCCB|847E    |00007E;
    LDA.B strcMap.unk1E                                        ;81CCCD|A51E    |00001E;
    SEC                                                        ;81CCCF|38      |      ;
    SBC.B strcVariables.n16Temp1                               ;81CCD0|E57E    |00007E;
    STA.B strcMap.unk1E                                        ;81CCD2|851E    |00001E;
 
.subY:
    LDA.B strcPlayer.posY                                      ;81CCD4|A5D8    |0000D8;
    SEC                                                        ;81CCD6|38      |      ;
    SBC.B strcMap.unk1E                                        ;81CCD7|E51E    |00001E;
    STA.B strcPlayer.posY                                      ;81CCD9|85D8    |0000D8;
    JSL.L fCamera_UpdateFromPlayerPos                                      ;81CCDB|22BC9E80|809EBC;
    JSL.L fCamera_ScrollUpStep                                      ;81CCDF|22E1A080|80A0E1;
    JMP.W .exit                                                ;81CCE3|4C2BCE  |81CE2B;
 
 
.left:
    REP #$30                                                   ;81CCE6|C230    |      ;
    %CheckPlayerAction(!PACTION_JUMP)
    BNE +                                                      ;81CCEF|D003    |81CCF4;
    JMP.W .addX                                                ;81CCF1|4C78CD  |81CD78;
 
 
  + %CheckPlayerAction(!PACTION_17)
    BNE +                                                      ;81CCFB|D003    |81CD00;
    JMP.W .addX                                                ;81CCFD|4C78CD  |81CD78;
 
 
  + %CheckPlayerAction(!PACTION_18)
    BNE +                                                      ;81CD07|D003    |81CD0C;
    JMP.W .addX                                                ;81CD09|4C78CD  |81CD78;
 
 
  + %CheckPlayerFlags(!PFLAGS_INTRANSITION)
    BEQ +                                                      ;81CD13|F003    |81CD18;
    JMP.W .addX                                                ;81CD15|4C78CD  |81CD78;
 
 
  + LDA.B strcPlayer.posX                                      ;81CD18|A5D6    |0000D6;
    STA.B strcPlayer.lastX                                     ;81CD1A|85DF    |0000DF;
    LDA.B strcPlayer.posY                                      ;81CD1C|A5D8    |0000D8;
    STA.B strcPlayer.lastY                                     ;81CD1E|85E1    |0000E1;
    LDA.B strcMap.unk1E                                        ;81CD20|A51E    |00001E;
    STA.B strcPlayer.newX                                      ;81CD22|85E5    |0000E5;
    LDA.W #$0000                                               ;81CD24|A90000  |      ;
    STA.B strcPlayer.newY                                      ;81CD27|85E7    |0000E7;
    STZ.B strcPlayer.unkE3                                     ;81CD29|64E3    |0000E3;
    REP #$20                                                   ;81CD2B|C220    |      ;
    LDA.B strcPlayer.direction                                 ;81CD2D|A5DA    |0000DA;
    JSL.L fGameEngine_DirectionHandler83AD91                   ;81CD2F|2291AD83|83AD91;
    CMP.W #$0000                                               ;81CD33|C90000  |      ;
    BEQ +                                                      ;81CD36|F003    |81CD3B;
    JMP.W .return1                                             ;81CD38|4C53CE  |81CE53;
 
 
  + REP #$20                                                   ;81CD3B|C220    |      ;
    LDA.B strcPlayer.direction                                 ;81CD3D|A5DA    |0000DA;
    JSL.L fGameEngine_DirectionHandler83AF37                   ;81CD3F|2237AF83|83AF37;
    REP #$30                                                   ;81CD43|C230    |      ;
    STX.B strcVariables.n16Temp1                               ;81CD45|867E    |00007E;
    CMP.W #$0001                                               ;81CD47|C90100  |      ;
    BNE +                                                      ;81CD4A|D003    |81CD4F;
    JMP.W .sub5                                                ;81CD4C|4CFCCE  |81CEFC;
 
 
  + CMP.W #$0002                                               ;81CD4F|C90200  |      ;
    BNE .jump2                                                 ;81CD52|D003    |81CD57;
    JMP.W .sub6                                                ;81CD54|4C25CF  |81CF25;
 
 
.jump2:
    REP #$20                                                   ;81CD57|C220    |      ;
    LDA.B strcPlayer.unkPosY                                   ;81CD59|A5EB    |0000EB;
    STA.W $087A                                                ;81CD5B|8D7A08  |00087A;
    LDA.B strcPlayer.unkPosX                                   ;81CD5E|A5E9    |0000E9;
    STA.W $0878                                                ;81CD60|8D7808  |000878;
    SEC                                                        ;81CD63|38      |      ;
    SBC.W #$00C0                                               ;81CD64|E9C000  |      ;
    CMP.W #$0010                                               ;81CD67|C91000  |      ;
    BCS +                                                      ;81CD6A|B003    |81CD6F;
    JMP.W .return1                                             ;81CD6C|4C53CE  |81CE53;
 
 
  + STX.B strcVariables.n16Temp1                               ;81CD6F|867E    |00007E;
    LDA.B strcMap.unk1E                                        ;81CD71|A51E    |00001E;
    SEC                                                        ;81CD73|38      |      ;
    SBC.B strcVariables.n16Temp1                               ;81CD74|E57E    |00007E;
    STA.B strcMap.unk1E                                        ;81CD76|851E    |00001E;
 
.addX:
    LDA.B strcPlayer.posX                                      ;81CD78|A5D6    |0000D6;
    CLC                                                        ;81CD7A|18      |      ;
    ADC.B strcMap.unk1E                                        ;81CD7B|651E    |00001E;
    STA.B strcPlayer.posX                                      ;81CD7D|85D6    |0000D6;
    JSL.L fCamera_UpdateFromPlayerPos                                      ;81CD7F|22BC9E80|809EBC;
    JSL.L fCamera_ScrollRightStep                                      ;81CD83|221CA180|80A11C;
    JMP.W .exit                                                ;81CD87|4C2BCE  |81CE2B;
 
 
.right:
    REP #$30                                                   ;81CD8A|C230    |      ;
    %CheckPlayerAction(!PACTION_JUMP)
    BNE +                                                      ;81CD93|D003    |81CD98;
    JMP.W .subX                                                ;81CD95|4C1CCE  |81CE1C;
 
 
  + %CheckPlayerAction(!PACTION_17)
    BNE +                                                      ;81CD9F|D003    |81CDA4;
    JMP.W .subX                                                ;81CDA1|4C1CCE  |81CE1C;
 
 
  + %CheckPlayerAction(!PACTION_18)
    BNE +                                                      ;81CDAB|D003    |81CDB0;
    JMP.W .subX                                                ;81CDAD|4C1CCE  |81CE1C;
 
 
  + %CheckPlayerFlags($0080)
    BEQ +                                                      ;81CDB7|F003    |81CDBC;
    JMP.W .subX                                                ;81CDB9|4C1CCE  |81CE1C;
 
 
  + LDA.B strcPlayer.posX                                      ;81CDBC|A5D6    |0000D6;
    STA.B strcPlayer.lastX                                     ;81CDBE|85DF    |0000DF;
    LDA.B strcPlayer.posY                                      ;81CDC0|A5D8    |0000D8;
    STA.B strcPlayer.lastY                                     ;81CDC2|85E1    |0000E1;
    LDA.B strcMap.unk1E                                        ;81CDC4|A51E    |00001E;
    STA.B strcPlayer.newX                                      ;81CDC6|85E5    |0000E5;
    LDA.W #$0000                                               ;81CDC8|A90000  |      ;
    STA.B strcPlayer.newY                                      ;81CDCB|85E7    |0000E7;
    STZ.B strcPlayer.unkE3                                     ;81CDCD|64E3    |0000E3;
    REP #$20                                                   ;81CDCF|C220    |      ;
    LDA.B strcPlayer.direction                                 ;81CDD1|A5DA    |0000DA;
    JSL.L fGameEngine_DirectionHandler83AD91                   ;81CDD3|2291AD83|83AD91;
    CMP.W #$0000                                               ;81CDD7|C90000  |      ;
    BEQ +                                                      ;81CDDA|F003    |81CDDF;
    JMP.W .return1                                             ;81CDDC|4C53CE  |81CE53;
 
 
  + REP #$20                                                   ;81CDDF|C220    |      ;
    LDA.B strcPlayer.direction                                 ;81CDE1|A5DA    |0000DA;
    JSL.L fGameEngine_DirectionHandler83AF37                   ;81CDE3|2237AF83|83AF37;
    REP #$30                                                   ;81CDE7|C230    |      ;
    STX.B strcVariables.n16Temp1                               ;81CDE9|867E    |00007E;
    CMP.W #$0001                                               ;81CDEB|C90100  |      ;
    BNE +                                                      ;81CDEE|D003    |81CDF3;
    JMP.W .sub7                                                ;81CDF0|4C4ECF  |81CF4E;
 
 
  + CMP.W #$0002                                               ;81CDF3|C90200  |      ;
    BNE .jump3                                                 ;81CDF6|D003    |81CDFB;
    JMP.W .sub8                                                ;81CDF8|4C77CF  |81CF77;
 
 
.jump3:
    REP #$20                                                   ;81CDFB|C220    |      ;
    LDA.B strcPlayer.unkPosY                                   ;81CDFD|A5EB    |0000EB;
    STA.W $087A                                                ;81CDFF|8D7A08  |00087A;
    LDA.B strcPlayer.unkPosX                                   ;81CE02|A5E9    |0000E9;
    STA.W $0878                                                ;81CE04|8D7808  |000878;
    SEC                                                        ;81CE07|38      |      ;
    SBC.W #$00C0                                               ;81CE08|E9C000  |      ;
    CMP.W #$0010                                               ;81CE0B|C91000  |      ;
    BCS +                                                      ;81CE0E|B003    |81CE13;
    JMP.W .return1                                             ;81CE10|4C53CE  |81CE53;
 
 
  + STX.B strcVariables.n16Temp1                               ;81CE13|867E    |00007E;
    LDA.B strcMap.unk1E                                        ;81CE15|A51E    |00001E;
    SEC                                                        ;81CE17|38      |      ;
    SBC.B strcVariables.n16Temp1                               ;81CE18|E57E    |00007E;
    STA.B strcMap.unk1E                                        ;81CE1A|851E    |00001E;
 
.subX:
    LDA.B strcPlayer.posX                                      ;81CE1C|A5D6    |0000D6;
    SEC                                                        ;81CE1E|38      |      ;
    SBC.B strcMap.unk1E                                        ;81CE1F|E51E    |00001E;
    STA.B strcPlayer.posX                                      ;81CE21|85D6    |0000D6;
    JSL.L fCamera_UpdateFromPlayerPos                                      ;81CE23|22BC9E80|809EBC;
    JSL.L fCamera_ScrollLeftStep                                      ;81CE27|2252A180|80A152;
 
.exit:
    SEP #$20                                                   ;81CE2B|E220    |      ;
    REP #$10                                                   ;81CE2D|C210    |      ;
    LDA.W strcPlayerData.unkCounter919                         ;81CE2F|AD1909  |000919;
    INC A                                                      ;81CE32|1A      |      ;
    STA.W strcPlayerData.unkCounter919                         ;81CE33|8D1909  |000919;
    LDA.W strcPlayerData.unkCounter919                         ;81CE36|AD1909  |000919;
    CMP.B #$08                                                 ;81CE39|C908    |      ;
    BNE .return                                                ;81CE3B|D015    |81CE52;
    JSL.L fPlayer_LeaveSnowFootprint                                    ;81CE3D|228FA581|81A58F;
    REP #$20                                                   ;81CE41|C220    |      ;
    LDA.B strcPlayer.posX                                      ;81CE43|A5D6    |0000D6;
    STA.W strcObjectData.playerX                               ;81CE45|8D0709  |000907;
    LDA.B strcPlayer.posY                                      ;81CE48|A5D8    |0000D8;
    STA.W strcObjectData.playerY                               ;81CE4A|8D0909  |000909;
    SEP #$20                                                   ;81CE4D|E220    |      ;
    STZ.W strcPlayerData.unkCounter919                         ;81CE4F|9C1909  |000919;
 
.return:
    RTS                                                        ;81CE52|60      |      ;
 
 
.return1:
    REP #$20                                                   ;81CE53|C220    |      ;
    STZ.B strcMap.unk1E                                        ;81CE55|641E    |00001E;
    RTS                                                        ;81CE57|60      |      ;
 
 
.sub1:
    REP #$30                                                   ;81CE58|C230    |      ;
    LDA.B strcPlayer.unkPosY                                   ;81CE5A|A5EB    |0000EB;
    BEQ ++                                                     ;81CE5C|F014    |81CE72;
    CMP.W #$00A0                                               ;81CE5E|C9A000  |      ;
    BCC +                                                      ;81CE61|9005    |81CE68;
    CMP.W #$00B0                                               ;81CE63|C9B000  |      ;
    BCC ++                                                     ;81CE66|900A    |81CE72;
 
  + LDA.B strcPlayer.posX                                      ;81CE68|A5D6    |0000D6;
    AND.W #$0008                                               ;81CE6A|290800  |      ;
    BNE ++                                                     ;81CE6D|D003    |81CE72;
    JMP.W .jump0                                               ;81CE6F|4C0FCC  |81CC0F;
 
 
 ++ LDA.W #$0001                                               ;81CE72|A90100  |      ;
    STA.B strcMap.unk1E                                        ;81CE75|851E    |00001E;
    %SetPlayerDirection(!PDIR_RIGHT)
    JMP.W .right                                               ;81CE7E|4C8ACD  |81CD8A;
 
 
.sub2:
    REP #$30                                                   ;81CE81|C230    |      ;
    LDA.B strcPlayer.unkPosX                                   ;81CE83|A5E9    |0000E9;
    BEQ ++                                                     ;81CE85|F014    |81CE9B;
    CMP.W #$00A0                                               ;81CE87|C9A000  |      ;
    BCC +                                                      ;81CE8A|9005    |81CE91;
    CMP.W #$00B0                                               ;81CE8C|C9B000  |      ;
    BCC ++                                                     ;81CE8F|900A    |81CE9B;
 
  + LDA.B strcPlayer.posX                                      ;81CE91|A5D6    |0000D6;
    AND.W #$0008                                               ;81CE93|290800  |      ;
    BEQ ++                                                     ;81CE96|F003    |81CE9B;
    JMP.W .jump0                                               ;81CE98|4C0FCC  |81CC0F;
 
 
 ++ LDA.W #$0001                                               ;81CE9B|A90100  |      ;
    STA.B strcMap.unk1E                                        ;81CE9E|851E    |00001E;
    %SetPlayerDirection(!PDIR_LEFT)
    JMP.W .left                                                ;81CEA7|4CE6CC  |81CCE6;
 
 
.sub3:
    REP #$30                                                   ;81CEAA|C230    |      ;
    LDA.B strcPlayer.unkPosY                                   ;81CEAC|A5EB    |0000EB;
    BEQ ++                                                     ;81CEAE|F014    |81CEC4;
    CMP.W #$00A0                                               ;81CEB0|C9A000  |      ;
    BCC +                                                      ;81CEB3|9005    |81CEBA;
    CMP.W #$00B0                                               ;81CEB5|C9B000  |      ;
    BCC ++                                                     ;81CEB8|900A    |81CEC4;
 
  + LDA.B strcPlayer.posX                                      ;81CEBA|A5D6    |0000D6;
    AND.W #$0008                                               ;81CEBC|290800  |      ;
    BNE ++                                                     ;81CEBF|D003    |81CEC4;
    JMP.W .jump1                                               ;81CEC1|4CB3CC  |81CCB3;
 
 
 ++ LDA.W #$0001                                               ;81CEC4|A90100  |      ;
    STA.B strcMap.unk1E                                        ;81CEC7|851E    |00001E;
    %SetPlayerDirection(!PDIR_RIGHT)
    JMP.W .right                                               ;81CED0|4C8ACD  |81CD8A;
 
 
.sub4:
    REP #$30                                                   ;81CED3|C230    |      ;
    LDA.B strcPlayer.unkPosX                                   ;81CED5|A5E9    |0000E9;
    BEQ ++                                                     ;81CED7|F014    |81CEED;
    CMP.W #$00A0                                               ;81CED9|C9A000  |      ;
    BCC +                                                      ;81CEDC|9005    |81CEE3;
    CMP.W #$00B0                                               ;81CEDE|C9B000  |      ;
    BCC ++                                                     ;81CEE1|900A    |81CEED;
 
  + LDA.B strcPlayer.posX                                      ;81CEE3|A5D6    |0000D6;
    AND.W #$0008                                               ;81CEE5|290800  |      ;
    BEQ ++                                                     ;81CEE8|F003    |81CEED;
    JMP.W .jump1                                               ;81CEEA|4CB3CC  |81CCB3;
 
 
 ++ LDA.W #$0001                                               ;81CEED|A90100  |      ;
    STA.B strcMap.unk1E                                        ;81CEF0|851E    |00001E;
    %SetPlayerDirection(!PDIR_LEFT)
    JMP.W .left                                                ;81CEF9|4CE6CC  |81CCE6;
 
 
.sub5:
    REP #$30                                                   ;81CEFC|C230    |      ;
    LDA.B strcPlayer.unkPosY                                   ;81CEFE|A5EB    |0000EB;
    BEQ ++                                                     ;81CF00|F014    |81CF16;
    CMP.W #$00A0                                               ;81CF02|C9A000  |      ;
    BCC +                                                      ;81CF05|9005    |81CF0C;
    CMP.W #$00B0                                               ;81CF07|C9B000  |      ;
    BCC ++                                                     ;81CF0A|900A    |81CF16;
 
  + LDA.B strcPlayer.posY                                      ;81CF0C|A5D8    |0000D8;
    AND.W #$0008                                               ;81CF0E|290800  |      ;
    BNE ++                                                     ;81CF11|D003    |81CF16;
    JMP.W .jump2                                               ;81CF13|4C57CD  |81CD57;
 
 
 ++ LDA.W #$0001                                               ;81CF16|A90100  |      ;
    STA.B strcMap.unk1E                                        ;81CF19|851E    |00001E;
    %SetPlayerDirection(!PDIR_UP)
    JMP.W .up                                                  ;81CF22|4C42CC  |81CC42;
 
 
.sub6:
    REP #$30                                                   ;81CF25|C230    |      ;
    LDA.B strcPlayer.unkPosX                                   ;81CF27|A5E9    |0000E9;
    BEQ ++                                                     ;81CF29|F014    |81CF3F;
    CMP.W #$00A0                                               ;81CF2B|C9A000  |      ;
    BCC +                                                      ;81CF2E|9005    |81CF35;
    CMP.W #$00B0                                               ;81CF30|C9B000  |      ;
    BCC ++                                                     ;81CF33|900A    |81CF3F;
 
  + LDA.B strcPlayer.posY                                      ;81CF35|A5D8    |0000D8;
    AND.W #$0008                                               ;81CF37|290800  |      ;
    BEQ ++                                                     ;81CF3A|F003    |81CF3F;
    JMP.W .jump2                                               ;81CF3C|4C57CD  |81CD57;
 
 
 ++ LDA.W #$0001                                               ;81CF3F|A90100  |      ;
    STA.B strcMap.unk1E                                        ;81CF42|851E    |00001E;
    %SetPlayerDirection(!PDIR_DOWN)
    JMP.W .down                                                ;81CF4B|4C9ECB  |81CB9E;
 
 
.sub7:
    REP #$30                                                   ;81CF4E|C230    |      ;
    LDA.B strcPlayer.unkPosY                                   ;81CF50|A5EB    |0000EB;
    BEQ ++                                                     ;81CF52|F014    |81CF68;
    CMP.W #$00A0                                               ;81CF54|C9A000  |      ;
    BCC +                                                      ;81CF57|9005    |81CF5E;
    CMP.W #$00B0                                               ;81CF59|C9B000  |      ;
    BCC ++                                                     ;81CF5C|900A    |81CF68;
 
  + LDA.B strcPlayer.posY                                      ;81CF5E|A5D8    |0000D8;
    AND.W #$0008                                               ;81CF60|290800  |      ;
    BNE ++                                                     ;81CF63|D003    |81CF68;
    JMP.W .jump3                                               ;81CF65|4CFBCD  |81CDFB;
 
 
 ++ LDA.W #$0001                                               ;81CF68|A90100  |      ;
    STA.B strcMap.unk1E                                        ;81CF6B|851E    |00001E;
    %SetPlayerDirection(!PDIR_UP)
    JMP.W .up                                                  ;81CF74|4C42CC  |81CC42;
 
 
.sub8:
    REP #$30                                                   ;81CF77|C230    |      ;
    LDA.B strcPlayer.unkPosX                                   ;81CF79|A5E9    |0000E9;
    BEQ ++                                                     ;81CF7B|F014    |81CF91;
    CMP.W #$00A0                                               ;81CF7D|C9A000  |      ;
    BCC +                                                      ;81CF80|9005    |81CF87;
    CMP.W #$00B0                                               ;81CF82|C9B000  |      ;
    BCC ++                                                     ;81CF85|900A    |81CF91;
 
  + LDA.B strcPlayer.posY                                      ;81CF87|A5D8    |0000D8;
    AND.W #$0008                                               ;81CF89|290800  |      ;
    BEQ ++                                                     ;81CF8C|F003    |81CF91;
    JMP.W .jump3                                               ;81CF8E|4CFBCD  |81CDFB;
 
 
 ++ LDA.W #$0001                                               ;81CF91|A90100  |      ;
    STA.B strcMap.unk1E                                        ;81CF94|851E    |00001E;
    %SetPlayerDirection(!PDIR_DOWN)
    JMP.W .down                                                ;81CF9D|4C9ECB  |81CB9E;
 
 
fPlayer_InitSpriteObject:
    REP #$30                                                   ;81CFA0|C230    |      ;
    LDA.W strcObjectData.spriteIdx                             ;81CFA2|AD0109  |000901;
    STA.W strcObjectData.spriteIdxOld                          ;81CFA5|8D0309  |000903;
    STA.B strcVariables.n16Temp1                               ;81CFA8|857E    |00007E;
    ASL A                                                      ;81CFAA|0A      |      ;
    CLC                                                        ;81CFAB|18      |      ;
    ADC.B strcVariables.n16Temp1                               ;81CFAC|657E    |00007E;
    TAX                                                        ;81CFAE|AA      |      ;
    LDA.L sSmallSpriteData,X                                   ;81CFAF|BF10D281|81D210;
    STA.B strcObject.spriteTableIdx                            ;81CFB3|85A1    |0000A1;
    INX                                                        ;81CFB5|E8      |      ;
    INX                                                        ;81CFB6|E8      |      ;
    SEP #$20                                                   ;81CFB7|E220    |      ;
    LDA.B #$00                                                 ;81CFB9|A900    |      ;
    XBA                                                        ;81CFBB|EB      |      ;
    LDA.L sSmallSpriteData,X                                   ;81CFBC|BF10D281|81D210;
    REP #$20                                                   ;81CFC0|C220    |      ;
    ASL A                                                      ;81CFC2|0A      |      ;
    ASL A                                                      ;81CFC3|0A      |      ;
    ASL A                                                      ;81CFC4|0A      |      ;
    ASL A                                                      ;81CFC5|0A      |      ;
    ASL A                                                      ;81CFC6|0A      |      ;
    ASL A                                                      ;81CFC7|0A      |      ;
    STA.W strcObjectData.flip                                  ;81CFC8|8D0F09  |00090F;
    STA.B strcObject.flip                                      ;81CFCB|859F    |00009F;
    LDA.W #$0000                                               ;81CFCD|A90000  |      ;
    STA.B strcObject.unkA3                                     ;81CFD0|85A3    |0000A3;
    LDA.B strcPlayer.posX                                      ;81CFD2|A5D6    |0000D6;
    STA.B strcObject.posX                                      ;81CFD4|859B    |00009B;
    LDA.B strcPlayer.posY                                      ;81CFD6|A5D8    |0000D8;
    STA.B strcObject.posY                                      ;81CFD8|859D    |00009D;
    JSL.L fObject_Create                                      ;81CFDA|22008085|858000;
    REP #$20                                                   ;81CFDE|C220    |      ;
    LDA.B strcObject.gameObjectIdx                             ;81CFE0|A5A5    |0000A5;
    STA.W strcObjectData.gameObjectIdx                         ;81CFE2|8D0509  |000905;
    RTL                                                        ;81CFE5|6B      |      ;
 
 
fPlayer_UpdateSpriteObject:
    REP #$30                                                   ;81CFE6|C230    |      ;
    LDA.W strcObjectData.gameObjectIdx                         ;81CFE8|AD0509  |000905;
    STA.B strcObject.gameObjectIdx                             ;81CFEB|85A5    |0000A5;
    LDA.B strcPlayer.posX                                      ;81CFED|A5D6    |0000D6;
    STA.B strcObject.posX                                      ;81CFEF|859B    |00009B;
    LDA.B strcPlayer.posY                                      ;81CFF1|A5D8    |0000D8;
    STA.B strcObject.posY                                      ;81CFF3|859D    |00009D;
    LDA.W strcObjectData.flip                                  ;81CFF5|AD0F09  |00090F;
    STA.B strcObject.flip                                      ;81CFF8|859F    |00009F;
    JSL.L fObject_UpdatePositionAndFlip                                ;81CFFA|22B98085|8580B9;
    REP #$20                                                   ;81CFFE|C220    |      ;
    LDA.W strcObjectData.spriteIdx                             ;81D000|AD0109  |000901;
    CMP.W strcObjectData.spriteIdxOld                          ;81D003|CD0309  |000903;
    BEQ .exit                                                  ;81D006|F031    |81D039;
    STA.W strcObjectData.spriteIdxOld                          ;81D008|8D0309  |000903;
    STA.B strcVariables.n16Temp1                               ;81D00B|857E    |00007E;
    ASL A                                                      ;81D00D|0A      |      ;
    CLC                                                        ;81D00E|18      |      ;
    ADC.B strcVariables.n16Temp1                               ;81D00F|657E    |00007E;
    TAX                                                        ;81D011|AA      |      ;
    LDA.L sSmallSpriteData,X                                   ;81D012|BF10D281|81D210;
    STA.B strcObject.spriteTableIdx                            ;81D016|85A1    |0000A1;
    INX                                                        ;81D018|E8      |      ;
    INX                                                        ;81D019|E8      |      ;
    SEP #$20                                                   ;81D01A|E220    |      ;
    LDA.B #$00                                                 ;81D01C|A900    |      ;
    XBA                                                        ;81D01E|EB      |      ;
    LDA.L sSmallSpriteData,X                                   ;81D01F|BF10D281|81D210;
    REP #$20                                                   ;81D023|C220    |      ;
    ASL A                                                      ;81D025|0A      |      ;
    ASL A                                                      ;81D026|0A      |      ;
    ASL A                                                      ;81D027|0A      |      ;
    ASL A                                                      ;81D028|0A      |      ;
    ASL A                                                      ;81D029|0A      |      ;
    ASL A                                                      ;81D02A|0A      |      ;
    STA.W strcObjectData.flip                                  ;81D02B|8D0F09  |00090F;
    STA.B strcObject.flip                                      ;81D02E|859F    |00009F;
    LDA.W strcObjectData.gameObjectIdx                         ;81D030|AD0509  |000905;
    STA.B strcObject.gameObjectIdx                             ;81D033|85A5    |0000A5;
    JSL.L fObject_Replace                                ;81D035|22008185|858100;
 
.exit:
    JSR.W fPlayer_RefreshObjectExists                                      ;81D039|203DD0  |81D03D;
    RTS                                                        ;81D03C|60      |      ;
 
 
fPlayer_RefreshObjectExists:
    REP #$30                                                   ;81D03D|C230    |      ;
    LDA.W strcObjectData.gameObjectIdx                         ;81D03F|AD0509  |000905;
    STA.B strcObject.gameObjectIdx                             ;81D042|85A5    |0000A5;
    JSL.L fObject_GetSingleObjectData                          ;81D044|22CB8185|8581CB;
    REP #$20                                                   ;81D048|C220    |      ;
    LDA.B strcObject.exists                                    ;81D04A|A5A7    |0000A7;
    STA.W strcObjectData.exist                                 ;81D04C|8D1509  |000915;
    CMP.W #$FFFF                                               ;81D04F|C9FFFF  |      ;
    BNE .return                                                ;81D052|D00C    |81D060;
    %UnsetPlayerFlag(!PFLAGS_KNEEING)
 
.return:
    RTS                                                        ;81D060|60      |      ;
 
 
fPlayerEnergyHandler:
    SEP #$20                                                   ;81D061|E220    |      ; A: nArg
    REP #$10                                                   ;81D063|C210    |      ;
    STA.B strcVariables.n8Temp1                                ;81D065|8592    |000092;
    STA.B strcVariables.n16Temp3                               ;81D067|8582    |000082;
    STZ.B $83                                                  ;81D069|6483    |000083;
    BMI .label1                                                ;81D06B|3002    |81D06F;
    BRA .recoveredStamina                                      ;81D06D|8006    |81D075;
 
 
.label1:
    SEP #$20                                                   ;81D06F|E220    |      ;
    LDA.B #$FF                                                 ;81D071|A9FF    |      ;
    STA.B $83                                                  ;81D073|8583    |000083;
 
.recoveredStamina:
    REP #$20                                                   ;81D075|C220    |      ;
    %CheckFlag(daily4, $0008)
    BEQ +                                                      ;81D07E|F003    |81D083;
    JMP.W .return                                              ;81D080|4C4BD1  |81D14B;
 
 
  + SEP #$20                                                   ;81D083|E220    |      ;
    LDA.B #$00                                                 ;81D085|A900    |      ;
    XBA                                                        ;81D087|EB      |      ;
    LDA.W strcPlayerData.stamina                               ;81D088|AD1709  |000917;
    REP #$20                                                   ;81D08B|C220    |      ;
    STA.B strcVariables.n16Temp1                               ;81D08D|857E    |00007E;
    SEP #$20                                                   ;81D08F|E220    |      ;
    LDA.W strcPlayerData.energy                                ;81D091|AD1809  |000918;
    REP #$20                                                   ;81D094|C220    |      ;
    CLC                                                        ;81D096|18      |      ;
    ADC.B strcVariables.n16Temp3                               ;81D097|6582    |000082;
    STA.B strcVariables.n16Temp2                               ;81D099|8580    |000080;
    LDA.B strcVariables.n16Temp2                               ;81D09B|A580    |000080;
    BEQ .outOfStamina                                          ;81D09D|F014    |81D0B3;
    BMI .outOfStamina                                          ;81D09F|3012    |81D0B3;
    CMP.B strcVariables.n16Temp1                               ;81D0A1|C57E    |00007E;
    BCS .label4                                                ;81D0A3|B02D    |81D0D2;
    %UnsetPlayerFlag(!PFLAGS_OUTOFSTAMINA)
    BRA .label5                                                ;81D0B1|8035    |81D0E8;
 
 
.outOfStamina:
    SEP #$20                                                   ;81D0B3|E220    |      ;
    STZ.W strcPlayerData.energy                                ;81D0B5|9C1809  |000918;
    %SetPlayerFlag(!PFLAGS_OUTOFSTAMINA)
    REP #$20                                                   ;81D0C1|C220    |      ;
    LDA.W #$004D                                               ;81D0C3|A94D00  |      ;
    STA.W strcObjectData.spriteIdx                             ;81D0C6|8D0109  |000901;
    %SetPlayerAction(!PACTION_TIRED)
    BRA .label6                                                ;81D0D0|8021    |81D0F3;
 
 
.label4:
    SEP #$20                                                   ;81D0D2|E220    |      ;
    LDA.W strcPlayerData.stamina                               ;81D0D4|AD1709  |000917;
    STA.W strcPlayerData.energy                                ;81D0D7|8D1809  |000918;
    %UnsetPlayerFlag(!PFLAGS_OUTOFSTAMINA)
    BRA .label6                                                ;81D0E6|800B    |81D0F3;
 
 
.label5:
    SEP #$20                                                   ;81D0E8|E220    |      ;
    LDA.W strcPlayerData.energy                                ;81D0EA|AD1809  |000918;
    CLC                                                        ;81D0ED|18      |      ;
    ADC.B strcVariables.n8Temp1                                ;81D0EE|6592    |000092;
    STA.W strcPlayerData.energy                                ;81D0F0|8D1809  |000918;
 
.label6:
    SEP #$30                                                   ;81D0F3|E230    |      ;
    LDA.B strcVariables.n8Temp1                                ;81D0F5|A592    |000092;
    BMI .label8                                                ;81D0F7|3016    |81D10F;
    LDY.B #$00                                                 ;81D0F9|A000    |      ;
    LDA.W strcPlayerData.stamina                               ;81D0FB|AD1709  |000917;
 
.loop1:
    LSR A                                                      ;81D0FE|4A      |      ;
    CMP.W strcPlayerData.energy                                ;81D0FF|CD1809  |000918;
    BEQ .label7                                                ;81D102|F005    |81D109;
    BCC .label7                                                ;81D104|9003    |81D109;
    INY                                                        ;81D106|C8      |      ;
    BRA .loop1                                                 ;81D107|80F5    |81D0FE;
 
 
.label7:
    TYA                                                        ;81D109|98      |      ;
    STA.W $096C                                                ;81D10A|8D6C09  |00096C;
    BRA .return                                                ;81D10D|803C    |81D14B;
 
 
.label8:
    SEP #$30                                                   ;81D10F|E230    |      ;
    LDA.W $096C                                                ;81D111|AD6C09  |00096C;
    CMP.B #$03                                                 ;81D114|C903    |      ;
    BEQ .return                                                ;81D116|F033    |81D14B;
    LDY.B #$00                                                 ;81D118|A000    |      ;
    LDA.W strcPlayerData.stamina                               ;81D11A|AD1709  |000917;
 
.loop2:
    LSR A                                                      ;81D11D|4A      |      ;
    CPY.W $096C                                                ;81D11E|CC6C09  |00096C;
    BEQ .label9                                                ;81D121|F003    |81D126;
    INY                                                        ;81D123|C8      |      ;
    BRA .loop2                                                 ;81D124|80F7    |81D11D;
 
 
.label9:
    CMP.W strcPlayerData.energy                                ;81D126|CD1809  |000918;
    BCS .label10                                               ;81D129|B002    |81D12D;
    BRA .return                                                ;81D12B|801E    |81D14B;
 
 
.label10:
    LDA.B #$00                                                 ;81D12D|A900    |      ;
    XBA                                                        ;81D12F|EB      |      ;
    LDA.W $096C                                                ;81D130|AD6C09  |00096C;
    CLC                                                        ;81D133|18      |      ;
    ADC.B #$4A                                                 ;81D134|694A    |      ;
    REP #$20                                                   ;81D136|C220    |      ;
    STA.W strcObjectData.spriteIdx                             ;81D138|8D0109  |000901;
    SEP #$20                                                   ;81D13B|E220    |      ;
    LDA.W $096C                                                ;81D13D|AD6C09  |00096C;
    INC A                                                      ;81D140|1A      |      ;
    STA.W $096C                                                ;81D141|8D6C09  |00096C;
    %SetPlayerAction(!PACTION_TIRED)
 
.return:
    REP #$30                                                   ;81D14B|C230    |      ;
    RTL                                                        ;81D14D|6B      |      ;
 
 
fStoreTileOnFrontOfPlayerAtDistance:
    REP #$30                                                   ;81D14E|C230    |      ; A: nArg1, X: nArg2, Y: nArg3
    ASL A                                                      ;81D150|0A      |      ;
    ASL A                                                      ;81D151|0A      |      ;
    ASL A                                                      ;81D152|0A      |      ;
    ASL A                                                      ;81D153|0A      |      ;
    STA.B strcVariables.n16Temp1                               ;81D154|857E    |00007E; A * 16
    STX.B strcVariables.n16Temp2                               ;81D156|8680    |000080; X
    STY.B strcVariables.n16Temp3                               ;81D158|8482    |000082; Y
    LDA.B strcPlayer.posX                                      ;81D15A|A5D6    |0000D6;
    STA.W nTileInFrontOfPlayerX                                ;81D15C|8D8509  |000985;
    LDA.B strcPlayer.posY                                      ;81D15F|A5D8    |0000D8;
    STA.W nTileInFrontOfPlayerY                                ;81D161|8D8709  |000987;
    LDA.B strcPlayer.direction                                 ;81D164|A5DA    |0000DA;
    CMP.W #!PDIR_DOWN                                               
    BNE +                                                      ;81D169|D00C    |81D177;
    LDA.B strcPlayer.posY                                      ;81D16B|A5D8    |0000D8;
    CLC                                                        ;81D16D|18      |      ;
    ADC.B strcVariables.n16Temp1                               ;81D16E|657E    |00007E;
    ADC.B strcVariables.n16Temp3                               ;81D170|6582    |000082;
    STA.W nTileInFrontOfPlayerY                                ;81D172|8D8709  |000987;
    BRA .justReturn                                            ;81D175|802C    |81D1A3;
 
 
  + CMP.W #!PDIR_UP                                               
    BNE +                                                      ;81D17A|D00C    |81D188;
    LDA.B strcPlayer.posY                                      ;81D17C|A5D8    |0000D8;
    SEC                                                        ;81D17E|38      |      ;
    SBC.B strcVariables.n16Temp1                               ;81D17F|E57E    |00007E;
    SBC.B strcVariables.n16Temp3                               ;81D181|E582    |000082;
    STA.W nTileInFrontOfPlayerY                                ;81D183|8D8709  |000987;
    BRA .justReturn                                            ;81D186|801B    |81D1A3;
 
 
  + CMP.W #!PDIR_LEFT                                               
    BNE +                                                      ;81D18B|D00C    |81D199;
    LDA.B strcPlayer.posX                                      ;81D18D|A5D6    |0000D6;
    CLC                                                        ;81D18F|18      |      ;
    ADC.B strcVariables.n16Temp1                               ;81D190|657E    |00007E;
    ADC.B strcVariables.n16Temp2                               ;81D192|6580    |000080;
    STA.W nTileInFrontOfPlayerX                                ;81D194|8D8509  |000985;
    BRA .justReturn                                            ;81D197|800A    |81D1A3;
 
 
  + LDA.B strcPlayer.posX                                      ;81D199|A5D6    |0000D6;
    SEC                                                        ;81D19B|38      |      ;
    SBC.B strcVariables.n16Temp1                               ;81D19C|E57E    |00007E;
    SBC.B strcVariables.n16Temp2                               ;81D19E|E580    |000080;
    STA.W nTileInFrontOfPlayerX                                ;81D1A0|8D8509  |000985;
 
.justReturn:
    RTL                                                        ;81D1A3|6B      |      ;
 
 
fFindTileCoordsInFrontOfPLayer:
    REP #$30                                                   ;81D1A4|C230    |      ; X: nArg1, Y: nArg2
    TXA                                                        ;81D1A6|8A      |      ;
    ASL A                                                      ;81D1A7|0A      |      ;
    ASL A                                                      ;81D1A8|0A      |      ;
    ASL A                                                      ;81D1A9|0A      |      ;
    ASL A                                                      ;81D1AA|0A      |      ;
    STA.B strcVariables.n16Temp1                               ;81D1AB|857E    |00007E; X * 16 -> $7E
    TYA                                                        ;81D1AD|98      |      ;
    ASL A                                                      ;81D1AE|0A      |      ;
    ASL A                                                      ;81D1AF|0A      |      ;
    ASL A                                                      ;81D1B0|0A      |      ;
    ASL A                                                      ;81D1B1|0A      |      ; Y * 16 -> $80
    STA.B strcVariables.n16Temp2                               ;81D1B2|8580    |000080;
    LDA.B strcPlayer.posX                                      ;81D1B4|A5D6    |0000D6;
    CLC                                                        ;81D1B6|18      |      ;
    ADC.B strcVariables.n16Temp1                               ;81D1B7|657E    |00007E;
    STA.W nTileInFrontOfPlayerX                                ;81D1B9|8D8509  |000985;
    LDA.B strcPlayer.posY                                      ;81D1BC|A5D8    |0000D8;
    CLC                                                        ;81D1BE|18      |      ;
    ADC.B strcVariables.n16Temp2                               ;81D1BF|6580    |000080;
    STA.W nTileInFrontOfPlayerY                                ;81D1C1|8D8709  |000987;
    RTL                                                        ;81D1C4|6B      |      ;
 
 
fLove_ScaleToHearts:
    REP #$30                                                   ;81D1C5|C230    |      ; A: nArg1
    STA.B strcVariables.n16Temp1                               ;81D1C7|857E    |00007E;
    LDY.W #$0000                                               ;81D1C9|A00000  |      ; i = 0
 
.loop:
    TYA                                                        ;81D1CC|98      |      ; A = i
    ASL A                                                      ;81D1CD|0A      |      ;
    ASL A                                                      ;81D1CE|0A      |      ;
    INC A                                                      ;81D1CF|1A      |      ;
    INC A                                                      ;81D1D0|1A      |      ;
    TAX                                                        ;81D1D1|AA      |      ; X = i * 4 + 2
    LDA.L .loveRange0,X                                        ;81D1D2|BFE8D181|81D1E8;
    CMP.B strcVariables.n16Temp1                               ;81D1D6|C57E    |00007E;
    BCC +                                                      ;81D1D8|9002    |81D1DC;
    BRA .return                                                ;81D1DA|8008    |81D1E4;
 
 
  + REP #$30                                                   ;81D1DC|C230    |      ;
    INY                                                        ;81D1DE|C8      |      ;
    CPY.W #$000A                                               ;81D1DF|C00A00  |      ;
    BNE .loop                                                  ;81D1E2|D0E8    |81D1CC;
 
.return:
    REP #$30                                                   ;81D1E4|C230    |      ;
    TYA                                                        ;81D1E6|98      |      ;
    RTS                                                        ;81D1E7|60      |      ;
 
 
.loveRange0:
    dw $0000,$0031                                             ;81D1E8|        |      ; 0x0A * [n16, n16]
 
.loveRange1:
    dw $0032,$0077                                             ;81D1EC|        |      ;
 
.loveRange2:
    dw $0078,$00C7                                             ;81D1F0|        |      ;
 
.loveRange3:
    dw $00C8,$00F9                                             ;81D1F4|        |      ;
 
.loveRange4:
    dw $00FA,$012B                                             ;81D1F8|        |      ;
 
.loveRange5:
    dw $012C,$018F                                             ;81D1FC|        |      ;
 
.loveRange6:
    dw $0190,$01F3                                             ;81D200|        |      ;
 
.loveRange7:
    dw $01F4,$0257                                             ;81D204|        |      ;
 
.loveRange8:
    dw $0258,$031F                                             ;81D208|        |      ;
 
.loveRange9:
    dw $0320,$03E7                                             ;81D20C|        |      ;
 
sSmallSpriteData:
    dw $0005                                                   ;81D210|        |      ; 0x0100 * [n16, n8]
    db $00                                                     ;81D212|        |      ;
    dw $0006                                                   ;81D213|        |      ;
    db $00                                                     ;81D215|        |      ;
    dw $0007                                                   ;81D216|        |      ;
    db $01                                                     ;81D218|        |      ;
    dw $0007                                                   ;81D219|        |      ;
    db $00                                                     ;81D21B|        |      ;
    dw $0000                                                   ;81D21C|        |      ;
    db $00                                                     ;81D21E|        |      ;
    dw $0001                                                   ;81D21F|        |      ;
    db $00                                                     ;81D221|        |      ;
    dw $0002                                                   ;81D222|        |      ;
    db $01                                                     ;81D224|        |      ;
    dw $0002                                                   ;81D225|        |      ;
    db $00                                                     ;81D227|        |      ;
    dw $0003                                                   ;81D228|        |      ;
    db $00                                                     ;81D22A|        |      ;
    dw $0004                                                   ;81D22B|        |      ;
    db $00                                                     ;81D22D|        |      ;
    dw $000E                                                   ;81D22E|        |      ;
    db $01                                                     ;81D230|        |      ;
    dw $000E                                                   ;81D231|        |      ;
    db $00                                                     ;81D233|        |      ;
    dw $0015                                                   ;81D234|        |      ;
    db $00                                                     ;81D236|        |      ;
    dw $001B                                                   ;81D237|        |      ;
    db $00                                                     ;81D239|        |      ;
    dw $0021                                                   ;81D23A|        |      ;
    db $01                                                     ;81D23C|        |      ;
    dw $0021                                                   ;81D23D|        |      ;
    db $00                                                     ;81D23F|        |      ;
    dw $0008                                                   ;81D240|        |      ;
    db $00                                                     ;81D242|        |      ;
    dw $000A                                                   ;81D243|        |      ;
    db $00                                                     ;81D245|        |      ;
    dw $000C                                                   ;81D246|        |      ;
    db $01                                                     ;81D248|        |      ;
    dw $000C                                                   ;81D249|        |      ;
    db $00                                                     ;81D24B|        |      ;
    dw $0012                                                   ;81D24C|        |      ;
    db $00                                                     ;81D24E|        |      ;
    dw $0013                                                   ;81D24F|        |      ;
    db $00                                                     ;81D251|        |      ;
    dw $0014                                                   ;81D252|        |      ;
    db $01                                                     ;81D254|        |      ;
    dw $0014                                                   ;81D255|        |      ;
    db $00                                                     ;81D257|        |      ;
    dw $0009                                                   ;81D258|        |      ;
    db $00                                                     ;81D25A|        |      ;
    dw $000B                                                   ;81D25B|        |      ;
    db $00                                                     ;81D25D|        |      ;
    dw $000D                                                   ;81D25E|        |      ;
    db $01                                                     ;81D260|        |      ;
    dw $000D                                                   ;81D261|        |      ;
    db $00                                                     ;81D263|        |      ;
    dw $000F                                                   ;81D264|        |      ;
    db $00                                                     ;81D266|        |      ;
    dw $0010                                                   ;81D267|        |      ;
    db $00                                                     ;81D269|        |      ;
    dw $0011                                                   ;81D26A|        |      ;
    db $01                                                     ;81D26C|        |      ;
    dw $0011                                                   ;81D26D|        |      ;
    db $00                                                     ;81D26F|        |      ;
    dw $0016                                                   ;81D270|        |      ;
    db $00                                                     ;81D272|        |      ;
    dw $001C                                                   ;81D273|        |      ;
    db $00                                                     ;81D275|        |      ;
    dw $0022                                                   ;81D276|        |      ;
    db $01                                                     ;81D278|        |      ;
    dw $0022                                                   ;81D279|        |      ;
    db $00                                                     ;81D27B|        |      ;
    dw $0017                                                   ;81D27C|        |      ;
    db $00                                                     ;81D27E|        |      ;
    dw $001D                                                   ;81D27F|        |      ;
    db $00                                                     ;81D281|        |      ;
    dw $0023                                                   ;81D282|        |      ;
    db $01                                                     ;81D284|        |      ;
    dw $0023                                                   ;81D285|        |      ;
    db $00                                                     ;81D287|        |      ;
    dw $0034                                                   ;81D288|        |      ;
    db $00                                                     ;81D28A|        |      ;
    dw $0035                                                   ;81D28B|        |      ;
    db $00                                                     ;81D28D|        |      ;
    dw $0036                                                   ;81D28E|        |      ;
    db $01                                                     ;81D290|        |      ;
    dw $0036                                                   ;81D291|        |      ;
    db $00                                                     ;81D293|        |      ;
    dw $0037                                                   ;81D294|        |      ;
    db $00                                                     ;81D296|        |      ;
    dw $003F                                                   ;81D297|        |      ;
    db $00                                                     ;81D299|        |      ;
    dw $0038                                                   ;81D29A|        |      ;
    db $01                                                     ;81D29C|        |      ;
    dw $0038                                                   ;81D29D|        |      ;
    db $00                                                     ;81D29F|        |      ;
    dw $0027                                                   ;81D2A0|        |      ;
    db $00                                                     ;81D2A2|        |      ;
    dw $0028                                                   ;81D2A3|        |      ;
    db $00                                                     ;81D2A5|        |      ;
    dw $0032                                                   ;81D2A6|        |      ;
    db $00                                                     ;81D2A8|        |      ;
    dw $0031                                                   ;81D2A9|        |      ;
    db $00                                                     ;81D2AB|        |      ;
    dw $002B                                                   ;81D2AC|        |      ;
    db $00                                                     ;81D2AE|        |      ;
    dw $002C                                                   ;81D2AF|        |      ;
    db $00                                                     ;81D2B1|        |      ;
    dw $0029                                                   ;81D2B2|        |      ;
    db $00                                                     ;81D2B4|        |      ;
    dw $002A                                                   ;81D2B5|        |      ;
    db $00                                                     ;81D2B7|        |      ;
    dw $002D                                                   ;81D2B8|        |      ;
    db $00                                                     ;81D2BA|        |      ;
    dw $002E                                                   ;81D2BB|        |      ;
    db $00                                                     ;81D2BD|        |      ;
    dw $002F                                                   ;81D2BE|        |      ;
    db $00                                                     ;81D2C0|        |      ;
    dw $0030                                                   ;81D2C1|        |      ;
    db $00                                                     ;81D2C3|        |      ;
    dw $0087                                                   ;81D2C4|        |      ;
    db $00                                                     ;81D2C6|        |      ;
    dw $0088                                                   ;81D2C7|        |      ;
    db $00                                                     ;81D2C9|        |      ;
    dw $0089                                                   ;81D2CA|        |      ;
    db $00                                                     ;81D2CC|        |      ;
    dw $008A                                                   ;81D2CD|        |      ;
    db $00                                                     ;81D2CF|        |      ;
    dw $008D                                                   ;81D2D0|        |      ;
    db $00                                                     ;81D2D2|        |      ;
    dw $008E                                                   ;81D2D3|        |      ;
    db $00                                                     ;81D2D5|        |      ;
    dw $008B                                                   ;81D2D6|        |      ;
    db $00                                                     ;81D2D8|        |      ;
    dw $008C                                                   ;81D2D9|        |      ;
    db $00                                                     ;81D2DB|        |      ;
    dw $0056                                                   ;81D2DC|        |      ;
    db $00                                                     ;81D2DE|        |      ;
    dw $0063                                                   ;81D2DF|        |      ;
    db $00                                                     ;81D2E1|        |      ;
    dw $0067                                                   ;81D2E2|        |      ;
    db $00                                                     ;81D2E4|        |      ;
    dw $00B6                                                   ;81D2E5|        |      ;
    db $00                                                     ;81D2E7|        |      ;
    dw $0071                                                   ;81D2E8|        |      ;
    db $00                                                     ;81D2EA|        |      ;
    dw $0000                                                   ;81D2EB|        |      ;
    db $00                                                     ;81D2ED|        |      ;
    dw $0079                                                   ;81D2EE|        |      ;
    db $00                                                     ;81D2F0|        |      ;
    dw $007A                                                   ;81D2F1|        |      ;
    db $00                                                     ;81D2F3|        |      ;
    dw $007B                                                   ;81D2F4|        |      ;
    db $00                                                     ;81D2F6|        |      ;
    dw $007C                                                   ;81D2F7|        |      ;
    db $00                                                     ;81D2F9|        |      ;
    dw $0040                                                   ;81D2FA|        |      ;
    db $00                                                     ;81D2FC|        |      ;
    dw $001A                                                   ;81D2FD|        |      ;
    db $00                                                     ;81D2FF|        |      ;
    dw $0044                                                   ;81D300|        |      ;
    db $00                                                     ;81D302|        |      ;
    dw $0045                                                   ;81D303|        |      ;
    db $00                                                     ;81D305|        |      ;
    dw $0046                                                   ;81D306|        |      ;
    db $01                                                     ;81D308|        |      ;
    dw $0046                                                   ;81D309|        |      ;
    db $00                                                     ;81D30B|        |      ;
    dw $0047                                                   ;81D30C|        |      ;
    db $00                                                     ;81D30E|        |      ;
    dw $0048                                                   ;81D30F|        |      ;
    db $00                                                     ;81D311|        |      ;
    dw $0049                                                   ;81D312|        |      ;
    db $01                                                     ;81D314|        |      ;
    dw $0049                                                   ;81D315|        |      ;
    db $00                                                     ;81D317|        |      ;
    dw $004A                                                   ;81D318|        |      ;
    db $00                                                     ;81D31A|        |      ;
    dw $004B                                                   ;81D31B|        |      ;
    db $00                                                     ;81D31D|        |      ;
    dw $004C                                                   ;81D31E|        |      ;
    db $01                                                     ;81D320|        |      ;
    dw $004C                                                   ;81D321|        |      ;
    db $00                                                     ;81D323|        |      ;
    dw $004D                                                   ;81D324|        |      ;
    db $00                                                     ;81D326|        |      ;
    dw $004E                                                   ;81D327|        |      ;
    db $00                                                     ;81D329|        |      ;
    dw $004F                                                   ;81D32A|        |      ;
    db $01                                                     ;81D32C|        |      ;
    dw $004F                                                   ;81D32D|        |      ;
    db $00                                                     ;81D32F|        |      ;
    dw $0050                                                   ;81D330|        |      ;
    db $00                                                     ;81D332|        |      ;
    dw $0051                                                   ;81D333|        |      ;
    db $00                                                     ;81D335|        |      ;
    dw $0052                                                   ;81D336|        |      ;
    db $01                                                     ;81D338|        |      ;
    dw $0052                                                   ;81D339|        |      ;
    db $00                                                     ;81D33B|        |      ;
    dw $0053                                                   ;81D33C|        |      ;
    db $00                                                     ;81D33E|        |      ;
    dw $0054                                                   ;81D33F|        |      ;
    db $00                                                     ;81D341|        |      ;
    dw $0055                                                   ;81D342|        |      ;
    db $01                                                     ;81D344|        |      ;
    dw $0055                                                   ;81D345|        |      ;
    db $00                                                     ;81D347|        |      ;
    dw $0057                                                   ;81D348|        |      ;
    db $00                                                     ;81D34A|        |      ;
    dw $005A                                                   ;81D34B|        |      ;
    db $00                                                     ;81D34D|        |      ;
    dw $005B                                                   ;81D34E|        |      ;
    db $01                                                     ;81D350|        |      ;
    dw $005B                                                   ;81D351|        |      ;
    db $00                                                     ;81D353|        |      ;
    dw $0058                                                   ;81D354|        |      ;
    db $00                                                     ;81D356|        |      ;
    dw $005C                                                   ;81D357|        |      ;
    db $00                                                     ;81D359|        |      ;
    dw $005D                                                   ;81D35A|        |      ;
    db $01                                                     ;81D35C|        |      ;
    dw $005D                                                   ;81D35D|        |      ;
    db $00                                                     ;81D35F|        |      ;
    dw $0059                                                   ;81D360|        |      ;
    db $00                                                     ;81D362|        |      ;
    dw $005E                                                   ;81D363|        |      ;
    db $00                                                     ;81D365|        |      ;
    dw $005F                                                   ;81D366|        |      ;
    db $01                                                     ;81D368|        |      ;
    dw $005F                                                   ;81D369|        |      ;
    db $00                                                     ;81D36B|        |      ;
    dw $0060                                                   ;81D36C|        |      ;
    db $00                                                     ;81D36E|        |      ;
    dw $0061                                                   ;81D36F|        |      ;
    db $00                                                     ;81D371|        |      ;
    dw $0062                                                   ;81D372|        |      ;
    db $01                                                     ;81D374|        |      ;
    dw $0062                                                   ;81D375|        |      ;
    db $00                                                     ;81D377|        |      ;
    dw $0064                                                   ;81D378|        |      ;
    db $00                                                     ;81D37A|        |      ;
    dw $0065                                                   ;81D37B|        |      ;
    db $00                                                     ;81D37D|        |      ;
    dw $0066                                                   ;81D37E|        |      ;
    db $01                                                     ;81D380|        |      ;
    dw $0066                                                   ;81D381|        |      ;
    db $00                                                     ;81D383|        |      ;
    dw $0068                                                   ;81D384|        |      ;
    db $00                                                     ;81D386|        |      ;
    dw $0069                                                   ;81D387|        |      ;
    db $00                                                     ;81D389|        |      ;
    dw $006A                                                   ;81D38A|        |      ;
    db $01                                                     ;81D38C|        |      ;
    dw $006A                                                   ;81D38D|        |      ;
    db $00                                                     ;81D38F|        |      ;
    dw $006B                                                   ;81D390|        |      ;
    db $00                                                     ;81D392|        |      ;
    dw $006C                                                   ;81D393|        |      ;
    db $00                                                     ;81D395|        |      ;
    dw $006D                                                   ;81D396|        |      ;
    db $01                                                     ;81D398|        |      ;
    dw $006D                                                   ;81D399|        |      ;
    db $00                                                     ;81D39B|        |      ;
    dw $006E                                                   ;81D39C|        |      ;
    db $00                                                     ;81D39E|        |      ;
    dw $006F                                                   ;81D39F|        |      ;
    db $00                                                     ;81D3A1|        |      ;
    dw $0070                                                   ;81D3A2|        |      ;
    db $01                                                     ;81D3A4|        |      ;
    dw $0070                                                   ;81D3A5|        |      ;
    db $00                                                     ;81D3A7|        |      ;
    dw $0072                                                   ;81D3A8|        |      ;
    db $00                                                     ;81D3AA|        |      ;
    dw $0073                                                   ;81D3AB|        |      ;
    db $00                                                     ;81D3AD|        |      ;
    dw $0074                                                   ;81D3AE|        |      ;
    db $00                                                     ;81D3B0|        |      ;
    dw $0075                                                   ;81D3B1|        |      ;
    db $00                                                     ;81D3B3|        |      ;
    dw $0076                                                   ;81D3B4|        |      ;
    db $00                                                     ;81D3B6|        |      ;
    dw $0077                                                   ;81D3B7|        |      ;
    db $00                                                     ;81D3B9|        |      ;
    dw $0078                                                   ;81D3BA|        |      ;
    db $00                                                     ;81D3BC|        |      ;
    dw $007E                                                   ;81D3BD|        |      ;
    db $00                                                     ;81D3BF|        |      ;
    dw $009A                                                   ;81D3C0|        |      ;
    db $00                                                     ;81D3C2|        |      ;
    dw $00A6                                                   ;81D3C3|        |      ;
    db $00                                                     ;81D3C5|        |      ;
    dw $00A5                                                   ;81D3C6|        |      ;
    db $00                                                     ;81D3C8|        |      ;
    dw $00A4                                                   ;81D3C9|        |      ;
    db $00                                                     ;81D3CB|        |      ;
    dw $00A3                                                   ;81D3CC|        |      ;
    db $00                                                     ;81D3CE|        |      ;
    dw $009F                                                   ;81D3CF|        |      ;
    db $00                                                     ;81D3D1|        |      ;
    dw $00A0                                                   ;81D3D2|        |      ;
    db $00                                                     ;81D3D4|        |      ;
    dw $00A1                                                   ;81D3D5|        |      ;
    db $00                                                     ;81D3D7|        |      ;
    dw $00A2                                                   ;81D3D8|        |      ;
    db $00                                                     ;81D3DA|        |      ;
    dw $009B                                                   ;81D3DB|        |      ;
    db $00                                                     ;81D3DD|        |      ;
    dw $009C                                                   ;81D3DE|        |      ;
    db $00                                                     ;81D3E0|        |      ;
    dw $009D                                                   ;81D3E1|        |      ;
    db $00                                                     ;81D3E3|        |      ;
    dw $009E                                                   ;81D3E4|        |      ;
    db $00                                                     ;81D3E6|        |      ;
    dw $00AA                                                   ;81D3E7|        |      ;
    db $00                                                     ;81D3E9|        |      ;
    dw $00A9                                                   ;81D3EA|        |      ;
    db $00                                                     ;81D3EC|        |      ;
    dw $00A8                                                   ;81D3ED|        |      ;
    db $00                                                     ;81D3EF|        |      ;
    dw $00A7                                                   ;81D3F0|        |      ;
    db $00                                                     ;81D3F2|        |      ;
    dw $00AF                                                   ;81D3F3|        |      ;
    db $00                                                     ;81D3F5|        |      ;
    dw $00B0                                                   ;81D3F6|        |      ;
    db $00                                                     ;81D3F8|        |      ;
    dw $00B2                                                   ;81D3F9|        |      ;
    db $00                                                     ;81D3FB|        |      ;
    dw $00B1                                                   ;81D3FC|        |      ;
    db $00                                                     ;81D3FE|        |      ;
    dw $00AE                                                   ;81D3FF|        |      ;
    db $00                                                     ;81D401|        |      ;
    dw $00B3                                                   ;81D402|        |      ;
    db $00                                                     ;81D404|        |      ;
    dw $00B4                                                   ;81D405|        |      ;
    db $00                                                     ;81D407|        |      ;
    dw $00AB                                                   ;81D408|        |      ;
    db $00                                                     ;81D40A|        |      ;
    dw $00AD                                                   ;81D40B|        |      ;
    db $00                                                     ;81D40D|        |      ;
    dw $00AC                                                   ;81D40E|        |      ;
    db $00                                                     ;81D410|        |      ;
    dw $0000                                                   ;81D411|        |      ;
    db $00                                                     ;81D413|        |      ;
    dw $00B5                                                   ;81D414|        |      ;
    db $00                                                     ;81D416|        |      ;
    dw $0020                                                   ;81D417|        |      ;
    db $00                                                     ;81D419|        |      ;
    dw $0026                                                   ;81D41A|        |      ;
    db $01                                                     ;81D41C|        |      ;
    dw $0026                                                   ;81D41D|        |      ;
    db $00                                                     ;81D41F|        |      ;
    dw $0093                                                   ;81D420|        |      ;
    db $00                                                     ;81D422|        |      ;
    dw $0094                                                   ;81D423|        |      ;
    db $00                                                     ;81D425|        |      ;
    dw $0097                                                   ;81D426|        |      ;
    db $01                                                     ;81D428|        |      ;
    dw $0097                                                   ;81D429|        |      ;
    db $00                                                     ;81D42B|        |      ;
    dw $008F                                                   ;81D42C|        |      ;
    db $00                                                     ;81D42E|        |      ;
    dw $0090                                                   ;81D42F|        |      ;
    db $00                                                     ;81D431|        |      ;
    dw $0095                                                   ;81D432|        |      ;
    db $01                                                     ;81D434|        |      ;
    dw $0095                                                   ;81D435|        |      ;
    db $00                                                     ;81D437|        |      ;
    dw $0091                                                   ;81D438|        |      ;
    db $00                                                     ;81D43A|        |      ;
    dw $0092                                                   ;81D43B|        |      ;
    db $00                                                     ;81D43D|        |      ;
    dw $0096                                                   ;81D43E|        |      ;
    db $01                                                     ;81D440|        |      ;
    dw $0096                                                   ;81D441|        |      ;
    db $00                                                     ;81D443|        |      ;
    dw $0099                                                   ;81D444|        |      ;
    db $00                                                     ;81D446|        |      ;
    dw $0099                                                   ;81D447|        |      ;
    db $00                                                     ;81D449|        |      ;
    dw $0098                                                   ;81D44A|        |      ;
    db $01                                                     ;81D44C|        |      ;
    dw $0098                                                   ;81D44D|        |      ;
    db $00                                                     ;81D44F|        |      ;
    dw $0082                                                   ;81D450|        |      ;
    db $00                                                     ;81D452|        |      ;
    dw $0083                                                   ;81D453|        |      ;
    db $00                                                     ;81D455|        |      ;
    dw $0085                                                   ;81D456|        |      ;
    db $01                                                     ;81D458|        |      ;
    dw $0085                                                   ;81D459|        |      ;
    db $00                                                     ;81D45B|        |      ;
    dw $007F                                                   ;81D45C|        |      ;
    db $00                                                     ;81D45E|        |      ;
    dw $0080                                                   ;81D45F|        |      ;
    db $00                                                     ;81D461|        |      ;
    dw $0081                                                   ;81D462|        |      ;
    db $01                                                     ;81D464|        |      ;
    dw $0081                                                   ;81D465|        |      ;
    db $00                                                     ;81D467|        |      ;
    dw $0000                                                   ;81D468|        |      ;
    db $00                                                     ;81D46A|        |      ;
    dw $0000                                                   ;81D46B|        |      ;
    db $00                                                     ;81D46D|        |      ;
    dw $0084                                                   ;81D46E|        |      ;
    db $00                                                     ;81D470|        |      ;
    dw $0086                                                   ;81D471|        |      ;
    db $00                                                     ;81D473|        |      ;
    dw $007D                                                   ;81D474|        |      ;
    db $00                                                     ;81D476|        |      ;
    dw $0000                                                   ;81D477|        |      ;
    db $00                                                     ;81D479|        |      ;
    dw $0000                                                   ;81D47A|        |      ;
    db $00                                                     ;81D47C|        |      ;
    dw $0000                                                   ;81D47D|        |      ;
    db $00                                                     ;81D47F|        |      ;
    dw $0041                                                   ;81D480|        |      ;
    db $00                                                     ;81D482|        |      ;
    dw $0042                                                   ;81D483|        |      ;
    db $00                                                     ;81D485|        |      ;
    dw $0043                                                   ;81D486|        |      ;
    db $01                                                     ;81D488|        |      ;
    dw $0043                                                   ;81D489|        |      ;
    db $00                                                     ;81D48B|        |      ;
    dw $0039                                                   ;81D48C|        |      ;
    db $00                                                     ;81D48E|        |      ;
    dw $003A                                                   ;81D48F|        |      ;
    db $00                                                     ;81D491|        |      ;
    dw $003B                                                   ;81D492|        |      ;
    db $01                                                     ;81D494|        |      ;
    dw $003B                                                   ;81D495|        |      ;
    db $00                                                     ;81D497|        |      ;
    dw $003C                                                   ;81D498|        |      ;
    db $00                                                     ;81D49A|        |      ;
    dw $003D                                                   ;81D49B|        |      ;
    db $00                                                     ;81D49D|        |      ;
    dw $003E                                                   ;81D49E|        |      ;
    db $01                                                     ;81D4A0|        |      ;
    dw $003E                                                   ;81D4A1|        |      ;
    db $00                                                     ;81D4A3|        |      ;
    dw $0018                                                   ;81D4A4|        |      ;
    db $00                                                     ;81D4A6|        |      ;
    dw $001E                                                   ;81D4A7|        |      ;
    db $00                                                     ;81D4A9|        |      ;
    dw $0024                                                   ;81D4AA|        |      ;
    db $01                                                     ;81D4AC|        |      ;
    dw $0024                                                   ;81D4AD|        |      ;
    db $00                                                     ;81D4AF|        |      ;
    dw $0019                                                   ;81D4B0|        |      ;
    db $00                                                     ;81D4B2|        |      ;
    dw $001F                                                   ;81D4B3|        |      ;
    db $00                                                     ;81D4B5|        |      ;
    dw $0025                                                   ;81D4B6|        |      ;
    db $01                                                     ;81D4B8|        |      ;
    dw $0025                                                   ;81D4B9|        |      ;
    db $00                                                     ;81D4BB|        |      ;
    dw $032C                                                   ;81D4BC|        |      ;
    db $00                                                     ;81D4BE|        |      ;
    dw $032D                                                   ;81D4BF|        |      ;
    db $00                                                     ;81D4C1|        |      ;
    dw $032E                                                   ;81D4C2|        |      ;
    db $00                                                     ;81D4C4|        |      ;
    dw $032F                                                   ;81D4C5|        |      ;
    db $00                                                     ;81D4C7|        |      ;
    dw $00BC                                                   ;81D4C8|        |      ;
    db $00                                                     ;81D4CA|        |      ;
    dw $0344                                                   ;81D4CB|        |      ;
    db $00                                                     ;81D4CD|        |      ;
    dw $0439                                                   ;81D4CE|        |      ;
    db $00                                                     ;81D4D0|        |      ;
    dw $043A                                                   ;81D4D1|        |      ;
    db $00                                                     ;81D4D3|        |      ;
    dw $043B                                                   ;81D4D4|        |      ;
    db $01                                                     ;81D4D6|        |      ;
    dw $043B                                                   ;81D4D7|        |      ;
    db $00                                                     ;81D4D9|        |      ;
    dw $0436                                                   ;81D4DA|        |      ;
    db $00                                                     ;81D4DC|        |      ;
    dw $0437                                                   ;81D4DD|        |      ;
    db $00                                                     ;81D4DF|        |      ;
    dw $0438                                                   ;81D4E0|        |      ;
    db $01                                                     ;81D4E2|        |      ;
    dw $0438                                                   ;81D4E3|        |      ;
    db $00                                                     ;81D4E5|        |      ;
    dw $043D                                                   ;81D4E6|        |      ;
    db $00                                                     ;81D4E8|        |      ;
    dw $043E                                                   ;81D4E9|        |      ;
    db $00                                                     ;81D4EB|        |      ;
    dw $043F                                                   ;81D4EC|        |      ;
    db $01                                                     ;81D4EE|        |      ;
    dw $043F                                                   ;81D4EF|        |      ;
    db $00                                                     ;81D4F1|        |      ;
    dw $0440                                                   ;81D4F2|        |      ;
    db $00                                                     ;81D4F4|        |      ;
    dw $0441                                                   ;81D4F5|        |      ;
    db $00                                                     ;81D4F7|        |      ;
    dw $0442                                                   ;81D4F8|        |      ;
    db $00                                                     ;81D4FA|        |      ;
    dw $0443                                                   ;81D4FB|        |      ;
    db $00                                                     ;81D4FD|        |      ;
    dw $0444                                                   ;81D4FE|        |      ;
    db $00                                                     ;81D500|        |      ;
    dw $0445                                                   ;81D501|        |      ;
    db $00                                                     ;81D503|        |      ;
    dw $0446                                                   ;81D504|        |      ;
    db $00                                                     ;81D506|        |      ;
    dw $0447                                                   ;81D507|        |      ;
    db $00                                                     ;81D509|        |      ;
    dw $0000                                                   ;81D50A|        |      ;
    db $00                                                     ;81D50C|        |      ;
    dw $0000                                                   ;81D50D|        |      ;
    db $00                                                     ;81D50F|        |      ;
