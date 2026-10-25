; Bank $81 module "player_update" - starts at $81D510
 
    incsrc "../../../build/gen/blocks/weather_dialog_ids.asm"
 
fPlayerInteraction_Handler:
    SEP #$20                                                   ;81D570|E220    |      ;
    REP #$10                                                   ;81D572|C210    |      ;
    LDA.B #$00                                                 ;81D574|A900    |      ;
    XBA                                                        ;81D576|EB      |      ;
    LDA.W nPlayerInteractionIndex                              ;81D577|AD6E09  |00096E;
    ASL A                                                      ;81D57A|0A      |      ;
    REP #$20                                                   ;81D57B|C220    |      ;
    TAX                                                        ;81D57D|AA      |      ;
    JSR.W (.aJumpTable,X)                                      ;81D57E|FC93D5  |81D593;
    SEP #$20                                                   ;81D581|E220    |      ;
    STZ.W strcPlayerData.lastExcercise                         ;81D583|9C2509  |000925;
    LDA.W nTimeState                                           ;81D586|AD7309  |000973;
    AND.B #$02                                                 ;81D589|2902    |      ;
    BEQ .skipToNextDay                                         ;81D58B|F003    |81D590;
    JMP.W fPlayerAction0x19                                    ;81D58D|4C0EC0  |81C00E;
 
 
.skipToNextDay:
    JMP.W fPlayerAction_Handler                                ;81D590|4CD3BF  |81BFD3;
 
    incsrc "../../../build/gen/blocks/player_update_jump_table.asm"
 
fPlayerInteraction0x00:
    RTS                                                        ;81D643|60      |      ;
 
 
fPlayerInteraction0x01_WoodStorage:
    REP #$20                                                   ;81D644|C220    |      ;
    LDA.W #$FFFE                                               ;81D646|A9FEFF  |      ;
    JSL.L fGameEngine_AddWood                                  ;81D649|2224B283|83B224;
    REP #$20                                                   ;81D64D|C220    |      ;
    CMP.W #$0001                                               ;81D64F|C90100  |      ;
    BEQ +                                                      ;81D652|F00E    |81D662;
    %SetCurrentCarriedItemDirect(!EITEM_WOODFENCE)
    %SetPlayerAction(!PACTION_ITEMONHAND)
 
  + %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    RTS                                                        ;81D66E|60      |      ;
 
 
fPlayerInteraction0x02:
    RTS                                                        ;81D66F|60      |      ;
 
 
fPlayerInteraction0x03:
    SEP #$20                                                   ;81D670|E220    |      ;
    REP #$10                                                   ;81D672|C210    |      ;
    LDA.W nPlayerInteractionArg1                               ;81D674|AD6F09  |00096F;
    CMP.B #$01                                                 ;81D677|C901    |      ;
    BEQ +                                                      ;81D679|F044    |81D6BF;
    SEP #$20                                                   ;81D67B|E220    |      ;
    LDA.B #$19                                                 ;81D67D|A919    |      ;
    STA.W strcAudio.reg114                                     ;81D67F|8D1401  |000114;
    LDA.B #$06                                                 ;81D682|A906    |      ;
    STA.W strcAudio.reg115                                     ;81D684|8D1501  |000115;
    LDA.B #$00                                                 ;81D687|A900    |      ;
    XBA                                                        ;81D689|EB      |      ;
    LDA.W strcAudio.unk118                                     ;81D68A|AD1801  |000118;
    REP #$20                                                   ;81D68D|C220    |      ;
    TAX                                                        ;81D68F|AA      |      ;
    SEP #$20                                                   ;81D690|E220    |      ;
    LDA.L nToolSoundData_80B8CD,X                              ;81D692|BFCDB880|80B8CD;
    INC A                                                      ;81D696|1A      |      ;
    STA.W strcAudio.index                                      ;81D697|8D0301  |000103;
    JSL.L fAudio_PrepareSoundEffectSample                                 ;81D69A|223E8383|83833E;
    JSL.L fAudioSetRegister2to0A                               ;81D69E|22328383|838332;
    REP #$20                                                   ;81D6A2|C220    |      ;
    %SetFlag(daily1, $0010)
    REP #$20                                                   ;81D6AF|C220    |      ;
    LDA.W #$0044                                               ;81D6B1|A94400  |      ;
    JSL.L fTileScript_Start                                ;81D6B4|22E1A581|81A5E1;
    SEP #$20                                                   ;81D6B8|E220    |      ;
    INC.W nPlayerInteractionArg1                               ;81D6BA|EE6F09  |00096F;
    BRA .return                                                ;81D6BD|8021    |81D6E0;
 
 
  + SEP #$20                                                   ;81D6BF|E220    |      ;
    INC.W nPlayerInteractionArg2                               ;81D6C1|EE7009  |000970;
    LDA.W nPlayerInteractionArg2                               ;81D6C4|AD7009  |000970;
    CMP.B #$20                                                 ;81D6C7|C920    |      ;
    BNE .return                                                ;81D6C9|D015    |81D6E0;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    SEP #$20                                                   ;81D6D7|E220    |      ;
    STZ.W strcAudio.toolId                                     ;81D6D9|9C1901  |000119;
    JSL.L fToolUsedSound_PlayOnToolChange                         ;81D6DC|22F38F82|828FF3;
 
.return:
    RTS                                                        ;81D6E0|60      |      ;
 
 
fPlayerInteraction0x04:
    RTS                                                        ;81D6E1|60      |      ;
 
 
fPlayerInteraction0x05:
    REP #$20                                                   ;81D6E2|C220    |      ;
    LDA.W #$0011                                               ;81D6E4|A91100  |      ;
    JSL.L fTileScript_Start                                ;81D6E7|22E1A581|81A5E1;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    RTS                                                        ;81D6F7|60      |      ;
 
 
fPlayerInteraction0x06:
    REP #$20                                                   ;81D6F8|C220    |      ;
    LDA.W #$0012                                               ;81D6FA|A91200  |      ;
    JSL.L fTileScript_Start                                ;81D6FD|22E1A581|81A5E1;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    RTS                                                        ;81D70D|60      |      ;
 
 
fPlayerInteraction0x07:
    RTS                                                        ;81D70E|60      |      ;
 
 
fPlayerInteraction0x08:
    RTS                                                        ;81D70F|60      |      ;
 
 
fPlayerInteraction0x09:
    RTS                                                        ;81D710|60      |      ;
 
 
fPlayerInteraction0x0A:
    RTS                                                        ;81D711|60      |      ;
 
 
fPlayerInteraction0x0B:
    RTS                                                        ;81D712|60      |      ;
 
 
fPlayerInteraction0x0C:
    RTS                                                        ;81D713|60      |      ;
 
 
fPlayerInteraction0x0D:
    RTS                                                        ;81D714|60      |      ;
 
 
fPlayerInteraction0x0E:
    RTS                                                        ;81D715|60      |      ;
 
 
fPlayerInteraction0x0F:
    SEP #$20                                                   ;81D716|E220    |      ;
    REP #$10                                                   ;81D718|C210    |      ;
    LDA.W nPlayerInteractionArg1                               ;81D71A|AD6F09  |00096F;
    CMP.B #$01                                                 ;81D71D|C901    |      ;
    BEQ .case1                                                 ;81D71F|F026    |81D747;
    CMP.B #$02                                                 ;81D721|C902    |      ;
    BEQ .case2                                                 ;81D723|F075    |81D79A;
    %SetPlayerFlag(!PFLAGS_SITTING)
    REP #$20                                                   ;81D72E|C220    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;81D730|AD9601  |000196;
    AND.W #$0010                                               ;81D733|291000  |      ;
    BNE +                                                      ;81D736|D007    |81D73F;
    LDA.W #$0000                                               ;81D738|A90000  |      ;
    JSL.L fTileScript_Start                                ;81D73B|22E1A581|81A5E1;
 
  + SEP #$20                                                   ;81D73F|E220    |      ;
    INC.W nPlayerInteractionArg1                               ;81D741|EE6F09  |00096F;
    JMP.W .return                                              ;81D744|4CC4D7  |81D7C4;
 
 
.case1:
    REP #$20                                                   ;81D747|C220    |      ;
    LDA.W ptrUnknown0xCF                                       ;81D749|ADCF00  |0000CF;
    BNE .return                                                ;81D74C|D076    |81D7C4;
    JSL.L fWeather_SetForecastDialogIndex                               ;81D74E|22C08182|8281C0;
    SEP #$20                                                   ;81D752|E220    |      ;
    LDA.B #$00                                                 ;81D754|A900    |      ;
    XBA                                                        ;81D756|EB      |      ;
    LDA.W nWeatherDialogIdIndex                                ;81D757|AD9009  |000990;
    ASL A                                                      ;81D75A|0A      |      ;
    ASL A                                                      ;81D75B|0A      |      ;
    ASL A                                                      ;81D75C|0A      |      ;
    STA.B strcVariables.n8Temp1                                ;81D75D|8592    |000092;
    LDA.L nCurrentSeasonID                                     ;81D75F|AF191F7F|7F1F19;
    ASL A                                                      ;81D763|0A      |      ;
    CLC                                                        ;81D764|18      |      ;
    ADC.B strcVariables.n8Temp1                                ;81D765|6592    |000092;
    REP #$20                                                   ;81D767|C220    |      ;
    TAX                                                        ;81D769|AA      |      ;
    LDA.L aWeatherDialogId,X                                   ;81D76A|BF10D581|81D510;
    CMP.W #$FFFF                                               ;81D76E|C9FFFF  |      ;
    BEQ +                                                      ;81D771|F011    |81D784;
    TAX                                                        ;81D773|AA      |      ;
    SEP #$20                                                   ;81D774|E220    |      ;
    LDA.B #$02                                                 ;81D776|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81D778|8D9A01  |00019A;
    LDA.B #$00                                                 ;81D77B|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81D77D|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81D780|225F9383|83935F;
 
  + SEP #$20                                                   ;81D784|E220    |      ;
    LDA.B #$00                                                 ;81D786|A900    |      ;
    XBA                                                        ;81D788|EB      |      ;
    LDA.W nWeatherDialogIdIndex                                ;81D789|AD9009  |000990;
    INC A                                                      ;81D78C|1A      |      ;
    REP #$20                                                   ;81D78D|C220    |      ;
    JSL.L fTileScript_Start                                ;81D78F|22E1A581|81A5E1;
    SEP #$20                                                   ;81D793|E220    |      ;
    INC.W nPlayerInteractionArg1                               ;81D795|EE6F09  |00096F;
    BRA .return                                                ;81D798|802A    |81D7C4;
 
 
.case2:
    SEP #$20                                                   ;81D79A|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81D79C|AD9A01  |00019A;
    CMP.B #$02                                                 ;81D79F|C902    |      ;
    BEQ .return                                                ;81D7A1|F021    |81D7C4;
    REP #$20                                                   ;81D7A3|C220    |      ;
    LDA.W #$0046                                               ;81D7A5|A94600  |      ;
    JSL.L fTileScript_Start                                ;81D7A8|22E1A581|81A5E1;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    %UnsetPlayerFlag(!PFLAGS_SITTING)
 
.return:
    RTS                                                        ;81D7C4|60      |      ;
 
 
fPlayerInteraction0x10_PlayerDiary:
    REP #$30                                                   ;81D7C5|C230    |      ;
    %CheckFlag(event6, $0010)
    BEQ +                                                      ;81D7CE|F003    |81D7D3;
    JMP.W .return                                              ;81D7D0|4C6CD9  |81D96C;
 
 
  + SEP #$20                                                   ;81D7D3|E220    |      ;
    REP #$10                                                   ;81D7D5|C210    |      ;
    LDA.W nPlayerInteractionArg1                               ;81D7D7|AD6F09  |00096F;
    CMP.B #$01                                                 ;81D7DA|C901    |      ;
    BEQ .case1                                                 ;81D7DC|F03C    |81D81A;
    CMP.B #$02                                                 ;81D7DE|C902    |      ;
    BEQ .case2                                                 ;81D7E0|F077    |81D859;
    CMP.B #$03                                                 ;81D7E2|C903    |      ;
    BNE .caseCheck                                             ;81D7E4|D003    |81D7E9;
    JMP.W .case3                                               ;81D7E6|4C7FD8  |81D87F;
 
 
.caseCheck:
    CMP.B #$04                                                 ;81D7E9|C904    |      ;
    BNE .case0                                                 ;81D7EB|D003    |81D7F0;
    JMP.W .case4                                               ;81D7ED|4C54D9  |81D954;
 
 
.case0:
    REP #$20                                                   ;81D7F0|C220    |      ;
    LDA.W $0878                                                ;81D7F2|AD7808  |000878;
    CMP.W $087A                                                ;81D7F5|CD7A08  |00087A;
    BEQ +                                                      ;81D7F8|F003    |81D7FD;
    JMP.W .return                                              ;81D7FA|4C6CD9  |81D96C;
 
 
  + SEP #$20                                                   ;81D7FD|E220    |      ;
    LDA.B #$02                                                 ;81D7FF|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81D801|8D9A01  |00019A;
    LDX.W #$000A                                               ;81D804|A20A00  |      ;
    SEP #$20                                                   ;81D807|E220    |      ;
    LDA.B #$00                                                 ;81D809|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81D80B|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81D80E|225F9383|83935F;
    SEP #$20                                                   ;81D812|E220    |      ;
    INC.W nPlayerInteractionArg1                               ;81D814|EE6F09  |00096F;
    JMP.W .justReturn                                          ;81D817|4C6BD9  |81D96B;
 
 
.case1:
    LDA.W strcDialogDisplay.mapUnk19A                          ;81D81A|AD9A01  |00019A;
    CMP.B #$02                                                 ;81D81D|C902    |      ;
    BNE +                                                      ;81D81F|D003    |81D824;
    JMP.W .justReturn                                          ;81D821|4C6BD9  |81D96B;
 
 
  + SEP #$20                                                   ;81D824|E220    |      ;
    LDA.W strcDialogDisplay.dialogOptionsAnswer                ;81D826|AD8F01  |00018F;
    BNE .no                                                    ;81D829|D013    |81D83E;
    INC.W nPlayerInteractionArg1                               ;81D82B|EE6F09  |00096F;
    INC.W nPlayerInteractionArg1                               ;81D82E|EE6F09  |00096F;
    SEP #$20                                                   ;81D831|E220    |      ;
    LDA.W nTimeState                                           ;81D833|AD7309  |000973;
    ORA.B #$04                                                 ;81D836|0904    |      ;
    STA.W nTimeState                                           ;81D838|8D7309  |000973;
    JMP.W .justReturn                                          ;81D83B|4C6BD9  |81D96B;
 
 
.no:
    LDA.B #$02                                                 ;81D83E|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81D840|8D9A01  |00019A;
    LDX.W #$000C                                               ;81D843|A20C00  |      ;
    SEP #$20                                                   ;81D846|E220    |      ;
    LDA.B #$00                                                 ;81D848|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81D84A|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81D84D|225F9383|83935F;
    SEP #$20                                                   ;81D851|E220    |      ;
    INC.W nPlayerInteractionArg1                               ;81D853|EE6F09  |00096F;
    JMP.W .justReturn                                          ;81D856|4C6BD9  |81D96B;
 
 
.case2:
    LDA.W strcDialogDisplay.mapUnk19A                          ;81D859|AD9A01  |00019A;
    CMP.B #$02                                                 ;81D85C|C902    |      ;
    BNE +                                                      ;81D85E|D003    |81D863;
    JMP.W .justReturn                                          ;81D860|4C6BD9  |81D96B;
 
 
  + SEP #$20                                                   ;81D863|E220    |      ;
    LDA.W strcDialogDisplay.dialogOptionsAnswer                ;81D865|AD8F01  |00018F;
    BNE .stillSomethingToDo                                    ;81D868|D006    |81D870;
    INC.W nPlayerInteractionArg1                               ;81D86A|EE6F09  |00096F;
    JMP.W .justReturn                                          ;81D86D|4C6BD9  |81D96B;
 
 
.stillSomethingToDo:
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    JMP.W .justReturn                                          ;81D87C|4C6BD9  |81D96B;
 
 
.case3:
    REP #$30                                                   ;81D87F|C230    |      ;
    %CheckFlag(event2, !EFLAGS2_MARRIEDMARIA)
    BNE .marriedCheck                                          ;81D888|D073    |81D8FD;
    %CheckFlag(event2, !EFLAGS2_MARRIEDANN)
    BNE .marriedCheck                                          ;81D891|D06A    |81D8FD;
    %CheckFlag(event2, !EFLAGS2_MARRIEDNINA)
    BNE .marriedCheck                                          ;81D89A|D061    |81D8FD;
    %CheckFlag(event2, !EFLAGS2_MARRIEDELLEN)
    BNE .marriedCheck                                          ;81D8A3|D058    |81D8FD;
    %CheckFlag(event2, !EFLAGS2_MARRIEDEVE)
    BNE .marriedCheck                                          ;81D8AC|D04F    |81D8FD;
    %SetPlayerFlag(!PFLAGS_INTRANSITION)
    %SetPlayerAction(!PACTION_WALK)
    %SetPlayerDirection(!PDIR_RIGHT)
    %SetObjectDirection(!PDIR_RIGHT)
    SEP #$20                                                   ;81D8CD|E220    |      ;
    INC.W nPlayerInteractionArg2                               ;81D8CF|EE7009  |000970;
    LDA.W nPlayerInteractionArg2                               ;81D8D2|AD7009  |000970;
    CMP.B #$16                                                 ;81D8D5|C916    |      ;
    BEQ +                                                      ;81D8D7|F003    |81D8DC;
    JMP.W .justReturn                                          ;81D8D9|4C6BD9  |81D96B;
 
 
  + REP #$20                                                   ;81D8DC|C220    |      ;
    %SetPlayerAction(!PACTION_AUTOPILOT)
    REP #$30                                                   ;81D8E5|C230    |      ;
    LDA.W #$004E                                               ;81D8E7|A94E00  |      ;
    STA.W strcObjectData.spriteIdx                             ;81D8EA|8D0109  |000901;
    JSR.W fPlayer_UpdateSpriteObject                                      ;81D8ED|20E6CF  |81CFE6;
    SEP #$20                                                   ;81D8F0|E220    |      ;
    LDA.W nTimeState                                           ;81D8F2|AD7309  |000973;
    ORA.B #$02                                                 ;81D8F5|0902    |      ;
    STA.W nTimeState                                           ;81D8F7|8D7309  |000973;
    JMP.W .justReturn                                          ;81D8FA|4C6BD9  |81D96B;
 
 
.marriedCheck:
    REP #$30                                                   ;81D8FD|C230    |      ;
    %SetFlag(daily3, $0800)
    %SetPlayerFlag(!PFLAGS_INTRANSITION)
    %SetPlayerAction(!PACTION_WALK)
    %SetPlayerDirection(!PDIR_RIGHT)
    %SetObjectDirection(!PDIR_RIGHT)
    SEP #$20                                                   ;81D929|E220    |      ;
    INC.W nPlayerInteractionArg2                               ;81D92B|EE7009  |000970;
    LDA.W nPlayerInteractionArg2                               ;81D92E|AD7009  |000970;
    CMP.B #$1E                                                 ;81D931|C91E    |      ;
    BEQ +                                                      ;81D933|F003    |81D938;
    JMP.W .justReturn                                          ;81D935|4C6BD9  |81D96B;
 
 
  + SEP #$20                                                   ;81D938|E220    |      ;
    INC.W nPlayerInteractionArg1                               ;81D93A|EE6F09  |00096F;
    REP #$20                                                   ;81D93D|C220    |      ;
    %SetPlayerAction(!PACTION_AUTOPILOT)
    REP #$30                                                   ;81D946|C230    |      ;
    LDA.W #$004E                                               ;81D948|A94E00  |      ;
    STA.W strcObjectData.spriteIdx                             ;81D94B|8D0109  |000901;
    JSR.W fPlayer_UpdateSpriteObject                                      ;81D94E|20E6CF  |81CFE6;
    JMP.W .justReturn                                          ;81D951|4C6BD9  |81D96B;
 
 
.case4:
    REP #$30                                                   ;81D954|C230    |      ;
    %CheckFlag(daily3, $1000)
    BEQ .justReturn                                            ;81D95D|F00C    |81D96B;
    SEP #$20                                                   ;81D95F|E220    |      ;
    LDA.W nTimeState                                           ;81D961|AD7309  |000973;
    ORA.B #$02                                                 ;81D964|0902    |      ;
    STA.W nTimeState                                           ;81D966|8D7309  |000973;
    BRA .justReturn                                            ;81D969|8000    |81D96B;
 
 
.justReturn:
    RTS                                                        ;81D96B|60      |      ;
 
 
.return:
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    RTS                                                        ;81D978|60      |      ;
 
 
fPlayerInteraction0x11:
    SEP #$20                                                   ;81D979|E220    |      ;
    REP #$10                                                   ;81D97B|C210    |      ;
    LDA.W nPlayerInteractionArg1                               ;81D97D|AD6F09  |00096F;
    CMP.B #$01                                                 ;81D980|C901    |      ;
    BEQ +                                                      ;81D982|F030    |81D9B4;
    %SetPlayerFlag(!PFLAGS_INTRANSITION)
    %SetPlayerAction(!PACTION_0E)
    %SetPlayerDirection(!PDIR_UP)
    %SetObjectDirection(!PDIR_UP)
    SEP #$20                                                   ;81D9A3|E220    |      ;
    INC.W nPlayerInteractionArg2                               ;81D9A5|EE7009  |000970;
    LDA.W nPlayerInteractionArg2                               ;81D9A8|AD7009  |000970;
    CMP.B #$20                                                 ;81D9AB|C920    |      ;
    BNE .return                                                ;81D9AD|D01C    |81D9CB;
    INC.W nPlayerInteractionArg1                               ;81D9AF|EE6F09  |00096F;
    BRA .return                                                ;81D9B2|8017    |81D9CB;
 
 
  + REP #$20                                                   ;81D9B4|C220    |      ;
    LDA.W #$00C2                                               ;81D9B6|A9C200  |      ;
    STA.W $0878                                                ;81D9B9|8D7808  |000878;
    STA.W $087A                                                ;81D9BC|8D7A08  |00087A;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
 
.return:
    RTS                                                        ;81D9CB|60      |      ;
 
 
fPlayerInteraction0x12:
    SEP #$20                                                   ;81D9CC|E220    |      ;
    REP #$10                                                   ;81D9CE|C210    |      ;
    LDA.W nPlayerInteractionArg1                               ;81D9D0|AD6F09  |00096F;
    CMP.B #$01                                                 ;81D9D3|C901    |      ;
    BEQ .case1                                                 ;81D9D5|F026    |81D9FD;
    CMP.B #$02                                                 ;81D9D7|C902    |      ;
    BEQ .case2                                                 ;81D9D9|F07C    |81DA57;
    %SetPlayerFlag(!PFLAGS_SITTING)
    REP #$20                                                   ;81D9E4|C220    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;81D9E6|AD9601  |000196;
    AND.W #$0010                                               ;81D9E9|291000  |      ;
    BNE +                                                      ;81D9EC|D007    |81D9F5;
    LDA.W #$0027                                               ;81D9EE|A92700  |      ;
    JSL.L fTileScript_Start                                ;81D9F1|22E1A581|81A5E1;
 
  + SEP #$20                                                   ;81D9F5|E220    |      ;
    INC.W nPlayerInteractionArg1                               ;81D9F7|EE6F09  |00096F;
    JMP.W .return                                              ;81D9FA|4C81DA  |81DA81;
 
 
.case1:
    REP #$20                                                   ;81D9FD|C220    |      ;
    LDA.W ptrUnknown0xCF                                       ;81D9FF|ADCF00  |0000CF;
    BEQ +                                                      ;81DA02|F003    |81DA07;
    JMP.W .return                                              ;81DA04|4C81DA  |81DA81;
 
 
  + JSL.L fWeather_SetForecastDialogIndex                               ;81DA07|22C08182|8281C0;
    SEP #$20                                                   ;81DA0B|E220    |      ;
    LDA.B #$00                                                 ;81DA0D|A900    |      ;
    XBA                                                        ;81DA0F|EB      |      ;
    LDA.W nWeatherDialogIdIndex                                ;81DA10|AD9009  |000990;
    ASL A                                                      ;81DA13|0A      |      ;
    ASL A                                                      ;81DA14|0A      |      ;
    ASL A                                                      ;81DA15|0A      |      ;
    STA.B strcVariables.n8Temp1                                ;81DA16|8592    |000092;
    LDA.L nCurrentSeasonID                                     ;81DA18|AF191F7F|7F1F19;
    ASL A                                                      ;81DA1C|0A      |      ;
    CLC                                                        ;81DA1D|18      |      ;
    ADC.B strcVariables.n8Temp1                                ;81DA1E|6592    |000092;
    REP #$20                                                   ;81DA20|C220    |      ;
    TAX                                                        ;81DA22|AA      |      ;
    LDA.L aWeatherDialogId,X                                   ;81DA23|BF10D581|81D510;
    CMP.W #$FFFF                                               ;81DA27|C9FFFF  |      ;
    BEQ +                                                      ;81DA2A|F011    |81DA3D;
    TAX                                                        ;81DA2C|AA      |      ;
    SEP #$20                                                   ;81DA2D|E220    |      ;
    LDA.B #$02                                                 ;81DA2F|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81DA31|8D9A01  |00019A;
    LDA.B #$00                                                 ;81DA34|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81DA36|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81DA39|225F9383|83935F;
 
  + SEP #$20                                                   ;81DA3D|E220    |      ;
    LDA.B #$00                                                 ;81DA3F|A900    |      ;
    XBA                                                        ;81DA41|EB      |      ;
    LDA.W nWeatherDialogIdIndex                                ;81DA42|AD9009  |000990;
    INC A                                                      ;81DA45|1A      |      ;
    REP #$20                                                   ;81DA46|C220    |      ;
    CLC                                                        ;81DA48|18      |      ;
    ADC.W #$0027                                               ;81DA49|692700  |      ;
    JSL.L fTileScript_Start                                ;81DA4C|22E1A581|81A5E1;
    SEP #$20                                                   ;81DA50|E220    |      ;
    INC.W nPlayerInteractionArg1                               ;81DA52|EE6F09  |00096F;
    BRA .return                                                ;81DA55|802A    |81DA81;
 
 
.case2:
    SEP #$20                                                   ;81DA57|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81DA59|AD9A01  |00019A;
    CMP.B #$02                                                 ;81DA5C|C902    |      ;
    BEQ .return                                                ;81DA5E|F021    |81DA81;
    REP #$20                                                   ;81DA60|C220    |      ;
    LDA.W #$0047                                               ;81DA62|A94700  |      ;
    JSL.L fTileScript_Start                                ;81DA65|22E1A581|81A5E1;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    %UnsetPlayerFlag(!PFLAGS_SITTING)
 
.return:
    RTS                                                        ;81DA81|60      |      ;
 
 
fPlayerInteraction0x13:
    SEP #$20                                                   ;81DA82|E220    |      ;
    REP #$10                                                   ;81DA84|C210    |      ;
    LDA.W nPlayerInteractionArg1                               ;81DA86|AD6F09  |00096F;
    CMP.B #$01                                                 ;81DA89|C901    |      ;
    BEQ .case1                                                 ;81DA8B|F026    |81DAB3;
    CMP.B #$02                                                 ;81DA8D|C902    |      ;
    BEQ .case2                                                 ;81DA8F|F07C    |81DB0D;
    %SetPlayerFlag(!PFLAGS_SITTING)
    REP #$20                                                   ;81DA9A|C220    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;81DA9C|AD9601  |000196;
    AND.W #$0010                                               ;81DA9F|291000  |      ;
    BNE +                                                      ;81DAA2|D007    |81DAAB;
    LDA.W #$0034                                               ;81DAA4|A93400  |      ;
    JSL.L fTileScript_Start                                ;81DAA7|22E1A581|81A5E1;
 
  + SEP #$20                                                   ;81DAAB|E220    |      ;
    INC.W nPlayerInteractionArg1                               ;81DAAD|EE6F09  |00096F;
    JMP.W .return                                              ;81DAB0|4C37DB  |81DB37;
 
 
.case1:
    REP #$20                                                   ;81DAB3|C220    |      ;
    LDA.W ptrUnknown0xCF                                       ;81DAB5|ADCF00  |0000CF;
    BEQ +                                                      ;81DAB8|F003    |81DABD;
    JMP.W .return                                              ;81DABA|4C37DB  |81DB37;
 
 
  + JSL.L fWeather_SetForecastDialogIndex                               ;81DABD|22C08182|8281C0;
    SEP #$20                                                   ;81DAC1|E220    |      ;
    LDA.B #$00                                                 ;81DAC3|A900    |      ;
    XBA                                                        ;81DAC5|EB      |      ;
    LDA.W nWeatherDialogIdIndex                                ;81DAC6|AD9009  |000990;
    ASL A                                                      ;81DAC9|0A      |      ;
    ASL A                                                      ;81DACA|0A      |      ;
    ASL A                                                      ;81DACB|0A      |      ;
    STA.B strcVariables.n8Temp1                                ;81DACC|8592    |000092;
    LDA.L nCurrentSeasonID                                     ;81DACE|AF191F7F|7F1F19;
    ASL A                                                      ;81DAD2|0A      |      ;
    CLC                                                        ;81DAD3|18      |      ;
    ADC.B strcVariables.n8Temp1                                ;81DAD4|6592    |000092;
    REP #$20                                                   ;81DAD6|C220    |      ;
    TAX                                                        ;81DAD8|AA      |      ;
    LDA.L aWeatherDialogId,X                                   ;81DAD9|BF10D581|81D510;
    CMP.W #$FFFF                                               ;81DADD|C9FFFF  |      ;
    BEQ +                                                      ;81DAE0|F011    |81DAF3;
    TAX                                                        ;81DAE2|AA      |      ;
    SEP #$20                                                   ;81DAE3|E220    |      ;
    LDA.B #$02                                                 ;81DAE5|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81DAE7|8D9A01  |00019A;
    LDA.B #$00                                                 ;81DAEA|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81DAEC|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81DAEF|225F9383|83935F;
 
  + SEP #$20                                                   ;81DAF3|E220    |      ;
    LDA.B #$00                                                 ;81DAF5|A900    |      ;
    XBA                                                        ;81DAF7|EB      |      ;
    LDA.W nWeatherDialogIdIndex                                ;81DAF8|AD9009  |000990;
    INC A                                                      ;81DAFB|1A      |      ;
    REP #$20                                                   ;81DAFC|C220    |      ;
    CLC                                                        ;81DAFE|18      |      ;
    ADC.W #$0034                                               ;81DAFF|693400  |      ;
    JSL.L fTileScript_Start                                ;81DB02|22E1A581|81A5E1;
    SEP #$20                                                   ;81DB06|E220    |      ;
    INC.W nPlayerInteractionArg1                               ;81DB08|EE6F09  |00096F;
    BRA .return                                                ;81DB0B|802A    |81DB37;
 
 
.case2:
    SEP #$20                                                   ;81DB0D|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81DB0F|AD9A01  |00019A;
    CMP.B #$02                                                 ;81DB12|C902    |      ;
    BEQ .return                                                ;81DB14|F021    |81DB37;
    REP #$20                                                   ;81DB16|C220    |      ;
    LDA.W #$0048                                               ;81DB18|A94800  |      ;
    JSL.L fTileScript_Start                                ;81DB1B|22E1A581|81A5E1;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    %UnsetPlayerFlag(!PFLAGS_SITTING)
 
.return:
    RTS                                                        ;81DB37|60      |      ;
 
 
fPlayerInteraction0x14:
    SEP #$20                                                   ;81DB38|E220    |      ;
    REP #$10                                                   ;81DB3A|C210    |      ;
    LDA.W nPlayerInteractionArg1                               ;81DB3C|AD6F09  |00096F;
    CMP.B #$01                                                 ;81DB3F|C901    |      ;
    BEQ .case1                                                 ;81DB41|F010    |81DB53;
    CMP.B #$02                                                 ;81DB43|C902    |      ;
    BEQ .case2                                                 ;81DB45|F028    |81DB6F;
    CMP.B #$03                                                 ;81DB47|C903    |      ;
    BEQ .case3                                                 ;81DB49|F047    |81DB92;
    SEP #$20                                                   ;81DB4B|E220    |      ;
    STZ.W strcDialogDisplay.dialoUnk18A                        ;81DB4D|9C8A01  |00018A;
    INC.W nPlayerInteractionArg1                               ;81DB50|EE6F09  |00096F;
 
.case1:
    REP #$20                                                   ;81DB53|C220    |      ;
    STZ.W strcBGScrool.BG2VerOffs                              ;81DB55|9C4201  |000142;
    SEP #$20                                                   ;81DB58|E220    |      ;
    LDA.B #$03                                                 ;81DB5A|A903    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81DB5C|8D9A01  |00019A;
    LDA.W strcDialogDisplay.dialogFlags                        ;81DB5F|AD9B01  |00019B;
    ORA.B #!DFLAGS_UNK20                                                 
    STA.W strcDialogDisplay.dialogFlags                        ;81DB64|8D9B01  |00019B;
    INC.W nPlayerInteractionArg1                               ;81DB67|EE6F09  |00096F;
    STZ.W strcDialogDisplay.dialogBlinkTimer                   ;81DB6A|9C8B01  |00018B;
    BRA .return                                                ;81DB6D|8031    |81DBA0;
 
 
.case2:
    SEP #$20                                                   ;81DB6F|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81DB71|AD9A01  |00019A;
    CMP.B #$03                                                 ;81DB74|C903    |      ;
    BEQ .return                                                ;81DB76|F028    |81DBA0;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81DB78|AD9A01  |00019A;
    CMP.B #$02                                                 ;81DB7B|C902    |      ;
    BNE +                                                      ;81DB7D|D005    |81DB84;
    INC.W nPlayerInteractionArg1                               ;81DB7F|EE6F09  |00096F;
    BRA .return                                                ;81DB82|801C    |81DBA0;
 
 
  + %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    BRA .return                                                ;81DB90|800E    |81DBA0;
 
 
.case3:
    SEP #$20                                                   ;81DB92|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81DB94|AD9A01  |00019A;
    CMP.B #$02                                                 ;81DB97|C902    |      ;
    BEQ .return                                                ;81DB99|F005    |81DBA0;
    LDA.B #$01                                                 ;81DB9B|A901    |      ;
    STA.W nPlayerInteractionArg1                               ;81DB9D|8D6F09  |00096F;
 
.return:
    RTS                                                        ;81DBA0|60      |      ;
 
 
fPlayerInteraction0x15_FeedStorage:
    REP #$20                                                   ;81DBA1|C220    |      ;
    LDA.W #$FFFF                                               ;81DBA3|A9FFFF  |      ;
    JSL.L fGameEngine_AddFeed                                  ;81DBA6|2253B283|83B253;
    REP #$20                                                   ;81DBAA|C220    |      ;
    CMP.W #$0001                                               ;81DBAC|C90100  |      ;
    BEQ +                                                      ;81DBAF|F00E    |81DBBF;
    %SetCurrentCarriedItemDirect(!EITEM_COWFEED)
    %SetPlayerAction(!PACTION_ITEMONHAND)
 
  + %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    RTS                                                        ;81DBCB|60      |      ;
 
 
fPlayerInteraction0x16:
    RTS                                                        ;81DBCC|60      |      ;
 
 
fPlayerInteraction0x17:
    RTS                                                        ;81DBCD|60      |      ;
 
 
fPlayerInteraction0x18:
    RTS                                                        ;81DBCE|60      |      ;
 
 
fPlayerInteraction0x19:
    RTS                                                        ;81DBCF|60      |      ;
 
 
fPlayerInteraction0x1A:
    RTS                                                        ;81DBD0|60      |      ;
 
 
fPlayerInteraction0x1B:
    RTS                                                        ;81DBD1|60      |      ;
 
 
fPlayerInteraction0x1C:
    RTS                                                        ;81DBD2|60      |      ;
 
 
fPlayerInteraction0x1D:
    REP #$30                                                   ;81DBD3|C230    |      ;
    LDA.W #$00FB                                               ;81DBD5|A9FB00  |      ;
    LDX.W #$02E0                                               ;81DBD8|A2E002  |      ;
    STX.W $09AD+!RAM_SHIFT                                 ;81DBDB|8EAD09  |0009AD;
    LDY.W #$01A0                                               ;81DBDE|A0A001  |      ;
    STY.W $09AF+!RAM_SHIFT                                 ;81DBE1|8CAF09  |0009AF;
    JSL.L fSetTileAtCoords                                     ;81DBE4|2288A681|81A688;
    REP #$30                                                   ;81DBE8|C230    |      ;
    LDA.W #$0000                                               ;81DBEA|A90000  |      ;
    JMP.W fPlayerInteraction_Return                            ;81DBED|4C56F5  |81F556;
 
 
fPlayerInteraction0x1E:
    SEP #$20                                                   ;81DBF0|E220    |      ;
    REP #$10                                                   ;81DBF2|C210    |      ;
    LDA.W nPlayerInteractionArg1                               ;81DBF4|AD6F09  |00096F;
    CMP.B #$01                                                 ;81DBF7|C901    |      ;
    BEQ .case1                                                 ;81DBF9|F01B    |81DC16;
    SEP #$20                                                   ;81DBFB|E220    |      ;
    LDA.B #$02                                                 ;81DBFD|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81DBFF|8D9A01  |00019A;
    LDX.W #$0371                                               ;81DC02|A27103  |      ;
    LDA.B #$00                                                 ;81DC05|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81DC07|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81DC0A|225F9383|83935F;
    SEP #$20                                                   ;81DC0E|E220    |      ;
    INC.W nPlayerInteractionArg1                               ;81DC10|EE6F09  |00096F;
    JMP.W .return                                              ;81DC13|4C56DC  |81DC56;
 
 
.case1:
    SEP #$20                                                   ;81DC16|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81DC18|AD9A01  |00019A;
    CMP.B #$02                                                 ;81DC1B|C902    |      ;
    BNE +                                                      ;81DC1D|D003    |81DC22;
    JMP.W .return                                              ;81DC1F|4C56DC  |81DC56;
 
 
  + LDA.W strcDialogDisplay.dialogOptionsAnswer                ;81DC22|AD8F01  |00018F;
    BEQ +                                                      ;81DC25|F003    |81DC2A;
    JMP.W .exit                                                ;81DC27|4C4ADC  |81DC4A;
 
 
  + SEP #$20                                                   ;81DC2A|E220    |      ;
    LDA.B #$00                                                 ;81DC2C|A900    |      ;
    XBA                                                        ;81DC2E|EB      |      ;
    LDA.L nCurrentSeasonID                                     ;81DC2F|AF191F7F|7F1F19;
    REP #$20                                                   ;81DC33|C220    |      ;
    CLC                                                        ;81DC35|18      |      ;
    ADC.W #$0372                                               ;81DC36|697203  |      ;
    TAX                                                        ;81DC39|AA      |      ;
    SEP #$20                                                   ;81DC3A|E220    |      ;
    LDA.B #$02                                                 ;81DC3C|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81DC3E|8D9A01  |00019A;
    LDA.B #$00                                                 ;81DC41|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81DC43|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81DC46|225F9383|83935F;
 
.exit:
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
 
.return:
    RTS                                                        ;81DC56|60      |      ;
 
 
fPlayerInteraction0x1F:
    RTS                                                        ;81DC57|60      |      ;
 
 
fPlayerInteraction0x20:
    RTS                                                        ;81DC58|60      |      ;
 
 
fPlayerInteraction0x21:
    RTS                                                        ;81DC59|60      |      ;
 
 
fPlayerInteraction0x22:
    RTS                                                        ;81DC5A|60      |      ;
 
 
fPlayerInteraction0x23:
    RTS                                                        ;81DC5B|60      |      ;
 
 
fPlayerInteraction0x24:
    RTS                                                        ;81DC5C|60      |      ;
 
 
fPlayerInteraction0x25:
    RTS                                                        ;81DC5D|60      |      ;
 
 
fPlayerInteraction0x26_MariaDiary:
    SEP #$20                                                   ;81DC5E|E220    |      ;
    REP #$10                                                   ;81DC60|C210    |      ;
    LDA.W nPlayerInteractionArg1                               ;81DC62|AD6F09  |00096F;
    CMP.B #$01                                                 ;81DC65|C901    |      ;
    BEQ .case1                                                 ;81DC67|F01B    |81DC84;
    SEP #$20                                                   ;81DC69|E220    |      ;
    LDA.B #$02                                                 ;81DC6B|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81DC6D|8D9A01  |00019A;
    LDX.W #$0023                                               ;81DC70|A22300  |      ;
    LDA.B #$00                                                 ;81DC73|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81DC75|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81DC78|225F9383|83935F;
    SEP #$20                                                   ;81DC7C|E220    |      ;
    INC.W nPlayerInteractionArg1                               ;81DC7E|EE6F09  |00096F;
    JMP.W .return                                              ;81DC81|4CCDDC  |81DCCD;
 
 
.case1:
    SEP #$20                                                   ;81DC84|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81DC86|AD9A01  |00019A;
    CMP.B #$02                                                 ;81DC89|C902    |      ;
    BNE +                                                      ;81DC8B|D003    |81DC90;
    JMP.W .return                                              ;81DC8D|4CCDDC  |81DCCD;
 
 
  + LDA.W strcDialogDisplay.dialogOptionsAnswer                ;81DC90|AD8F01  |00018F;
    BEQ +                                                      ;81DC93|F003    |81DC98;
    JMP.W .exit                                                ;81DC95|4CC1DC  |81DCC1;
 
 
  + REP #$20                                                   ;81DC98|C220    |      ;
    LDA.L nLove_Maria                                          ;81DC9A|AF1F1F7F|7F1F1F;
    JSR.W fLove_ScaleToHearts                                  ;81DC9E|20C5D1  |81D1C5;
    REP #$30                                                   ;81DCA1|C230    |      ;
    CLC                                                        ;81DCA3|18      |      ;
    ADC.W #$03A6                                               ;81DCA4|69A603  |      ; 0x03A6 + nLoveScale = nDiaryLoveDialog
    TAX                                                        ;81DCA7|AA      |      ;
    SEP #$20                                                   ;81DCA8|E220    |      ;
    LDA.B #$02                                                 ;81DCAA|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81DCAC|8D9A01  |00019A;
    LDA.B #$00                                                 ;81DCAF|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81DCB1|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81DCB4|225F9383|83935F;
    REP #$20                                                   ;81DCB8|C220    |      ;
    LDA.W #$FFFF                                               ;81DCBA|A9FFFF  |      ; -1
    JSL.L fGameEngine_AddHappiness                             ;81DCBD|2282B283|83B282; Reading girls diary decrease happiness
 
.exit:
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
 
.return:
    RTS                                                        ;81DCCD|60      |      ;
 
 
fPlayerInteraction0x27:
    %SetCurrentCarriedItemIndex($0070)
    %SetPlayerAction(!PACTION_ITEMONHAND)
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    RTS                                                        ;81DCF2|60      |      ;
 
 
fPlayerInteraction0x28:
    %SetCurrentCarriedItemIndex($0071)
    %SetPlayerAction(!PACTION_ITEMONHAND)
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    RTS                                                        ;81DD17|60      |      ;
 
 
fPlayerInteraction0x29:
    %SetCurrentCarriedItemIndex($0072)
    %SetPlayerAction(!PACTION_ITEMONHAND)
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    RTS                                                        ;81DD3C|60      |      ;
 
 
fPlayerInteraction0x2A:
    %SetCurrentCarriedItemIndex($0073)
    %SetPlayerAction(!PACTION_ITEMONHAND)
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    RTS                                                        ;81DD61|60      |      ;
 
 
fPlayerInteraction0x2B:
    %SetCurrentCarriedItemIndex($0074)
    %SetPlayerAction(!PACTION_ITEMONHAND)
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    RTS                                                        ;81DD86|60      |      ;
 
 
fPlayerInteraction0x2C:
    %SetCurrentCarriedItemIndex($0075)
    %SetPlayerAction(!PACTION_ITEMONHAND)
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    RTS                                                        ;81DDAB|60      |      ;
 
 
fPlayerInteraction0x2D_NinaDiary:
    SEP #$20                                                   ;81DDAC|E220    |      ;
    REP #$10                                                   ;81DDAE|C210    |      ;
    LDA.W nPlayerInteractionArg1                               ;81DDB0|AD6F09  |00096F;
    CMP.B #$01                                                 ;81DDB3|C901    |      ;
    BEQ .case1                                                 ;81DDB5|F01B    |81DDD2;
    SEP #$20                                                   ;81DDB7|E220    |      ;
    LDA.B #$02                                                 ;81DDB9|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81DDBB|8D9A01  |00019A;
    LDX.W #$0023                                               ;81DDBE|A22300  |      ;
    LDA.B #$00                                                 ;81DDC1|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81DDC3|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81DDC6|225F9383|83935F;
    SEP #$20                                                   ;81DDCA|E220    |      ;
    INC.W nPlayerInteractionArg1                               ;81DDCC|EE6F09  |00096F;
    JMP.W .return                                              ;81DDCF|4C1BDE  |81DE1B;
 
 
.case1:
    SEP #$20                                                   ;81DDD2|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81DDD4|AD9A01  |00019A;
    CMP.B #$02                                                 ;81DDD7|C902    |      ;
    BNE +                                                      ;81DDD9|D003    |81DDDE;
    JMP.W .return                                              ;81DDDB|4C1BDE  |81DE1B;
 
 
  + LDA.W strcDialogDisplay.dialogOptionsAnswer                ;81DDDE|AD8F01  |00018F;
    BEQ +                                                      ;81DDE1|F003    |81DDE6;
    JMP.W .exit                                                ;81DDE3|4C0FDE  |81DE0F;
 
 
  + REP #$20                                                   ;81DDE6|C220    |      ;
    LDA.L nLove_Nina                                           ;81DDE8|AF231F7F|7F1F23;
    JSR.W fLove_ScaleToHearts                                  ;81DDEC|20C5D1  |81D1C5;
    REP #$30                                                   ;81DDEF|C230    |      ;
    CLC                                                        ;81DDF1|18      |      ;
    ADC.W #$03A6                                               ;81DDF2|69A603  |      ;
    TAX                                                        ;81DDF5|AA      |      ;
    SEP #$20                                                   ;81DDF6|E220    |      ;
    LDA.B #$02                                                 ;81DDF8|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81DDFA|8D9A01  |00019A;
    LDA.B #$00                                                 ;81DDFD|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81DDFF|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81DE02|225F9383|83935F;
    REP #$20                                                   ;81DE06|C220    |      ;
    LDA.W #$FFFF                                               ;81DE08|A9FFFF  |      ;
    JSL.L fGameEngine_AddHappiness                             ;81DE0B|2282B283|83B282;
 
.exit:
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
 
.return:
    RTS                                                        ;81DE1B|60      |      ;
 
 
fPlayerInteraction0x2E_AnimalNPC:
    SEP #$20                                                   ;81DE1C|E220    |      ;
    REP #$10                                                   ;81DE1E|C210    |      ;
    LDA.W nPlayerInteractionArg1                               ;81DE20|AD6F09  |00096F;
    CMP.B #$01                                                 ;81DE23|C901    |      ;
    BEQ .case1                                                 ;81DE25|F063    |81DE8A;
    CMP.B #$02                                                 ;81DE27|C902    |      ;
    BNE .checks                                                ;81DE29|D003    |81DE2E;
    JMP.W .case2                                               ;81DE2B|4CC8DF  |81DFC8;
 
 
.checks:
    CMP.B #$03                                                 ;81DE2E|C903    |      ;
    BNE +                                                      ;81DE30|D003    |81DE35;
    JMP.W .case3                                               ;81DE32|4CEFE0  |81E0EF;
 
 
  + REP #$30                                                   ;81DE35|C230    |      ;
    %CheckFlag(event3, $0001)
    BNE +                                                      ;81DE3E|D003    |81DE43;
    JMP.W .break                                               ;81DE40|4C13E2  |81E213;
 
 
  + REP #$20                                                   ;81DE43|C220    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;81DE45|AD9601  |000196;
    AND.W #$000A                                               ;81DE48|290A00  |      ;
    BNE .cantSellAnimal                                        ;81DE4B|D01B    |81DE68;
    SEP #$20                                                   ;81DE4D|E220    |      ;
    LDA.B #$02                                                 ;81DE4F|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81DE51|8D9A01  |00019A;
    LDX.W #$0305                                               ;81DE54|A20503  |      ;
    LDA.B #$00                                                 ;81DE57|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81DE59|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81DE5C|225F9383|83935F;
    SEP #$20                                                   ;81DE60|E220    |      ;
    INC.W nPlayerInteractionArg1                               ;81DE62|EE6F09  |00096F;
    JMP.W .return                                              ;81DE65|4C21E2  |81E221;
 
 
.cantSellAnimal:
    SEP #$20                                                   ;81DE68|E220    |      ;
    LDA.B #$02                                                 ;81DE6A|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81DE6C|8D9A01  |00019A;
    LDX.W #$03D0                                               ;81DE6F|A2D003  |      ;
    LDA.B #$00                                                 ;81DE72|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81DE74|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81DE77|225F9383|83935F;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    JMP.W .return                                              ;81DE87|4C21E2  |81E221;
 
 
.case1:
    REP #$30                                                   ;81DE8A|C230    |      ;
    LDA.W strcJoypad1.current                                  ;81DE8C|AD2401  |000124;
    BIT.W #!JOYPAD_B                                               
    BEQ +                                                      ;81DE92|F003    |81DE97;
    JMP.W .return2                                             ;81DE94|4C22E2  |81E222;
 
 
  + SEP #$20                                                   ;81DE97|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81DE99|AD9A01  |00019A;
    CMP.B #$02                                                 ;81DE9C|C902    |      ;
    BNE +                                                      ;81DE9E|D003    |81DEA3;
    JMP.W .return                                              ;81DEA0|4C21E2  |81E221;
 
 
  + LDA.W strcDialogDisplay.dialogOptionsAnswer                ;81DEA3|AD8F01  |00018F;
    CMP.B #$00                                                 ;81DEA6|C900    |      ;
    BEQ .cowCheck                                              ;81DEA8|F012    |81DEBC;
    CMP.B #$01                                                 ;81DEAA|C901    |      ;
    BEQ .chickenCheck                                          ;81DEAC|F065    |81DF13;
    CMP.B #$02                                                 ;81DEAE|C902    |      ;
    BNE +                                                      ;81DEB0|D003    |81DEB5;
    JMP.W .label02                                             ;81DEB2|4C6ADF  |81DF6A;
 
 
  + CMP.B #$03                                                 ;81DEB5|C903    |      ;
    BNE .cowCheck                                              ;81DEB7|D003    |81DEBC;
    JMP.W .label04                                             ;81DEB9|4C99DF  |81DF99;
 
 
.cowCheck:
    REP #$20                                                   ;81DEBC|C220    |      ;
    %CheckFlag(daily1, $0020)
    BNE ++                                                     ;81DEC5|D02A    |81DEF1;
    SEP #$20                                                   ;81DEC7|E220    |      ;
    LDA.L nOwnedCows                                           ;81DEC9|AF0A1F7F|7F1F0A;
    CMP.B #$0C                                                 ;81DECD|C90C    |      ;
    BNE .askBuyCow                                             ;81DECF|D003    |81DED4;
    JMP.W .haveMaxCows                                         ;81DED1|4C2EE0  |81E02E;
 
 
.askBuyCow:
    SEP #$20                                                   ;81DED4|E220    |      ;
    LDA.B #$02                                                 ;81DED6|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81DED8|8D9A01  |00019A;
    LDX.W #$0307                                               ;81DEDB|A20703  |      ;
    LDA.B #$00                                                 ;81DEDE|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81DEE0|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81DEE3|225F9383|83935F;
    SEP #$20                                                   ;81DEE7|E220    |      ;
    LDA.B #$02                                                 ;81DEE9|A902    |      ;
    STA.W nPlayerInteractionArg1                               ;81DEEB|8D6F09  |00096F;
    JMP.W .return                                              ;81DEEE|4C21E2  |81E221;
 
 
 ++ SEP #$20                                                   ;81DEF1|E220    |      ;
    LDA.B #$02                                                 ;81DEF3|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81DEF5|8D9A01  |00019A;
    LDX.W #$03B6                                               ;81DEF8|A2B603  |      ;
    LDA.B #$00                                                 ;81DEFB|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81DEFD|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81DF00|225F9383|83935F;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    JMP.W .return                                              ;81DF10|4C21E2  |81E221;
 
 
.chickenCheck:
    REP #$20                                                   ;81DF13|C220    |      ;
    %CheckFlag(daily1, $0020)
    BNE ++                                                     ;81DF1C|D02A    |81DF48;
    SEP #$20                                                   ;81DF1E|E220    |      ;
    LDA.L nOwnedChickens                                       ;81DF20|AF0B1F7F|7F1F0B;
    CMP.B #$0C                                                 ;81DF24|C90C    |      ;
    BNE +                                                      ;81DF26|D003    |81DF2B;
    JMP.W .haveMaxChickens                                     ;81DF28|4C5AE1  |81E15A;
 
 
  + SEP #$20                                                   ;81DF2B|E220    |      ;
    LDA.B #$02                                                 ;81DF2D|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81DF2F|8D9A01  |00019A;
    LDX.W #$030A                                               ;81DF32|A20A03  |      ;
    LDA.B #$00                                                 ;81DF35|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81DF37|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81DF3A|225F9383|83935F;
    SEP #$20                                                   ;81DF3E|E220    |      ;
    LDA.B #$03                                                 ;81DF40|A903    |      ;
    STA.W nPlayerInteractionArg1                               ;81DF42|8D6F09  |00096F;
    JMP.W .return                                              ;81DF45|4C21E2  |81E221;
 
 
 ++ SEP #$20                                                   ;81DF48|E220    |      ;
    LDA.B #$02                                                 ;81DF4A|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81DF4C|8D9A01  |00019A;
    LDX.W #$03B6                                               ;81DF4F|A2B603  |      ;
    LDA.B #$00                                                 ;81DF52|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81DF54|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81DF57|225F9383|83935F;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    JMP.W .return                                              ;81DF67|4C21E2  |81E221;
 
 
.label02:
    SEP #$20                                                   ;81DF6A|E220    |      ;
    LDA.B #$02                                                 ;81DF6C|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81DF6E|8D9A01  |00019A;
    LDX.W #$030B                                               ;81DF71|A20B03  |      ;
    LDA.B #$00                                                 ;81DF74|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81DF76|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81DF79|225F9383|83935F;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    REP #$20                                                   ;81DF89|C220    |      ;
    %SetFlag(daily1, $0008)
    JMP.W .return                                              ;81DF96|4C21E2  |81E221;
 
 
.label04:
    SEP #$20                                                   ;81DF99|E220    |      ;
    LDA.B #$02                                                 ;81DF9B|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81DF9D|8D9A01  |00019A;
    LDX.W #$030B                                               ;81DFA0|A20B03  |      ;
    LDA.B #$00                                                 ;81DFA3|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81DFA5|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81DFA8|225F9383|83935F;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    REP #$20                                                   ;81DFB8|C220    |      ;
    %SetFlag(daily1, $0004)
    JMP.W .return                                              ;81DFC5|4C21E2  |81E221;
 
 
.case2:
    SEP #$20                                                   ;81DFC8|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81DFCA|AD9A01  |00019A;
    CMP.B #$02                                                 ;81DFCD|C902    |      ;
    BNE +                                                      ;81DFCF|D003    |81DFD4;
    JMP.W .return                                              ;81DFD1|4C21E2  |81E221;
 
 
  + LDA.W strcDialogDisplay.dialogOptionsAnswer                ;81DFD4|AD8F01  |00018F;
    BEQ +                                                      ;81DFD7|F003    |81DFDC;
    JMP.W .label23                                             ;81DFD9|4CCDE0  |81E0CD;
 
 
  + SEP #$20                                                   ;81DFDC|E220    |      ;
    LDA.B #$00                                                 ;81DFDE|A900    |      ;
    XBA                                                        ;81DFE0|EB      |      ;
    LDA.L nOwnedChickens                                       ;81DFE1|AF0B1F7F|7F1F0B;
    REP #$20                                                   ;81DFE5|C220    |      ;
    ASL A                                                      ;81DFE7|0A      |      ;
    ASL A                                                      ;81DFE8|0A      |      ;
    ASL A                                                      ;81DFE9|0A      |      ;
    ASL A                                                      ;81DFEA|0A      |      ;
    STA.B strcVariables.n16Temp1                               ;81DFEB|857E    |00007E;
    SEP #$20                                                   ;81DFED|E220    |      ;
    LDA.B #$00                                                 ;81DFEF|A900    |      ;
    XBA                                                        ;81DFF1|EB      |      ;
    LDA.L nOwnedCows                                           ;81DFF2|AF0A1F7F|7F1F0A;
    REP #$20                                                   ;81DFF6|C220    |      ;
    INC A                                                      ;81DFF8|1A      |      ;
    ASL A                                                      ;81DFF9|0A      |      ;
    ASL A                                                      ;81DFFA|0A      |      ;
    ASL A                                                      ;81DFFB|0A      |      ;
    ASL A                                                      ;81DFFC|0A      |      ;
    STA.B strcVariables.n16Temp2                               ;81DFFD|8580    |000080;
    CLC                                                        ;81DFFF|18      |      ;
    ADC.B strcVariables.n16Temp1                               ;81E000|657E    |00007E;
    STA.B strcVariables.n16Temp1                               ;81E002|857E    |00007E;
    LDA.L nPlantedGrassCount                                   ;81E004|AF291F7F|7F1F29;
    CMP.B strcVariables.n16Temp1                               ;81E008|C57E    |00007E; Checks do we have enough grass to purchase animal
    BCS .label21                                               ;81E00A|B044    |81E050;
    SEP #$20                                                   ;81E00C|E220    |      ;
    LDA.B #$02                                                 ;81E00E|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81E010|8D9A01  |00019A;
    LDX.W #$0306                                               ;81E013|A20603  |      ;
    LDA.B #$00                                                 ;81E016|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81E018|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81E01B|225F9383|83935F;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    JMP.W .return                                              ;81E02B|4C21E2  |81E221;
 
 
.haveMaxCows:
    SEP #$20                                                   ;81E02E|E220    |      ;
    LDA.B #$02                                                 ;81E030|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81E032|8D9A01  |00019A;
    LDX.W #$03B7                                               ;81E035|A2B703  |      ;
    LDA.B #$00                                                 ;81E038|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81E03A|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81E03D|225F9383|83935F;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    JMP.W .return                                              ;81E04D|4C21E2  |81E221;
 
 
.label21:
    REP #$20                                                   ;81E050|C220    |      ;
    LDA.W #$FE0C                                               ;81E052|A90CFE  |      ;
    STA.B ptrTemp0x72                                          ;81E055|8572    |000072;
    SEP #$20                                                   ;81E057|E220    |      ;
    LDA.B #$FF                                                 ;81E059|A9FF    |      ;
    STA.B ptrTemp0x72+2                                        ;81E05B|8574    |000074;
    JSL.L fGameEngine_AddProfit                                ;81E05D|22C9B183|83B1C9;
    REP #$20                                                   ;81E061|C220    |      ;
    CMP.W #$0000                                               ;81E063|C90000  |      ;
    BEQ +                                                      ;81E066|F022    |81E08A;
    SEP #$20                                                   ;81E068|E220    |      ;
    LDA.B #$02                                                 ;81E06A|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81E06C|8D9A01  |00019A;
    LDX.W #$0304                                               ;81E06F|A20403  |      ;
    LDA.B #$00                                                 ;81E072|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81E074|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81E077|225F9383|83935F;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    JMP.W .return                                              ;81E087|4C21E2  |81E221;
 
 
  + SEP #$20                                                   ;81E08A|E220    |      ;
    LDA.B #$02                                                 ;81E08C|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81E08E|8D9A01  |00019A;
    LDX.W #$0308                                               ;81E091|A20803  |      ;
    LDA.B #$00                                                 ;81E094|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81E096|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81E099|225F9383|83935F;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    REP #$20                                                   ;81E0A9|C220    |      ;
    %SetFlag(daily1, $0022)
    SEP #$20                                                   ;81E0B6|E220    |      ;
    LDA.L nOwnedCows                                           ;81E0B8|AF0A1F7F|7F1F0A;
    INC A                                                      ;81E0BC|1A      |      ;
    STA.L nOwnedCows                                           ;81E0BD|8F0A1F7F|7F1F0A;
    REP #$20                                                   ;81E0C1|C220    |      ;
    LDA.W #$0014                                               ;81E0C3|A91400  |      ;
    JSL.L fGameEngine_AddHappiness                             ;81E0C6|2282B283|83B282;
    JMP.W .return                                              ;81E0CA|4C21E2  |81E221;
 
 
.label23:
    SEP #$20                                                   ;81E0CD|E220    |      ;
    LDA.B #$02                                                 ;81E0CF|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81E0D1|8D9A01  |00019A;
    LDX.W #$0303                                               ;81E0D4|A20303  |      ;
    LDA.B #$00                                                 ;81E0D7|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81E0D9|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81E0DC|225F9383|83935F;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    JMP.W .return                                              ;81E0EC|4C21E2  |81E221;
 
 
.case3:
    SEP #$20                                                   ;81E0EF|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81E0F1|AD9A01  |00019A;
    CMP.B #$02                                                 ;81E0F4|C902    |      ;
    BNE +                                                      ;81E0F6|D003    |81E0FB;
    JMP.W .return                                              ;81E0F8|4C21E2  |81E221;
 
 
  + LDA.W strcDialogDisplay.dialogOptionsAnswer                ;81E0FB|AD8F01  |00018F;
    BEQ +                                                      ;81E0FE|F003    |81E103;
    JMP.W .label31                                             ;81E100|4C00E2  |81E200;
 
 
  + SEP #$20                                                   ;81E103|E220    |      ;
    LDA.B #$00                                                 ;81E105|A900    |      ;
    XBA                                                        ;81E107|EB      |      ;
    LDA.L nOwnedChickens                                       ;81E108|AF0B1F7F|7F1F0B;
    REP #$20                                                   ;81E10C|C220    |      ;
    INC A                                                      ;81E10E|1A      |      ;
    ASL A                                                      ;81E10F|0A      |      ;
    ASL A                                                      ;81E110|0A      |      ;
    ASL A                                                      ;81E111|0A      |      ;
    ASL A                                                      ;81E112|0A      |      ;
    STA.B strcVariables.n16Temp1                               ;81E113|857E    |00007E;
    SEP #$20                                                   ;81E115|E220    |      ;
    LDA.B #$00                                                 ;81E117|A900    |      ;
    XBA                                                        ;81E119|EB      |      ;
    LDA.L nOwnedCows                                           ;81E11A|AF0A1F7F|7F1F0A;
    REP #$20                                                   ;81E11E|C220    |      ;
    ASL A                                                      ;81E120|0A      |      ;
    ASL A                                                      ;81E121|0A      |      ;
    ASL A                                                      ;81E122|0A      |      ;
    ASL A                                                      ;81E123|0A      |      ;
    STA.B strcVariables.n16Temp2                               ;81E124|8580    |000080;
    CLC                                                        ;81E126|18      |      ;
    ADC.B strcVariables.n16Temp1                               ;81E127|657E    |00007E;
    STA.B strcVariables.n16Temp1                               ;81E129|857E    |00007E;
    LDA.L nPlantedGrassCount                                   ;81E12B|AF291F7F|7F1F29;
    CMP.B strcVariables.n16Temp1                               ;81E12F|C57E    |00007E;
    BCC +                                                      ;81E131|9003    |81E136;
    JMP.W .label29                                             ;81E133|4C7CE1  |81E17C;
 
 
  + SEP #$20                                                   ;81E136|E220    |      ;
    LDA.B #$02                                                 ;81E138|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81E13A|8D9A01  |00019A;
    LDX.W #$0306                                               ;81E13D|A20603  |      ;
    LDA.B #$00                                                 ;81E140|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81E142|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81E145|225F9383|83935F;
    REP #$20                                                   ;81E149|C220    |      ;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    JMP.W .return                                              ;81E157|4C21E2  |81E221;
 
 
.haveMaxChickens:
    SEP #$20                                                   ;81E15A|E220    |      ;
    LDA.B #$02                                                 ;81E15C|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81E15E|8D9A01  |00019A;
    LDX.W #$03B7                                               ;81E161|A2B703  |      ;
    LDA.B #$00                                                 ;81E164|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81E166|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81E169|225F9383|83935F;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    JMP.W .return                                              ;81E179|4C21E2  |81E221;
 
 
.label29:
    REP #$20                                                   ;81E17C|C220    |      ;
    LDA.W #$FF9C                                               ;81E17E|A99CFF  |      ;
    STA.B ptrTemp0x72                                          ;81E181|8572    |000072;
    SEP #$20                                                   ;81E183|E220    |      ;
    LDA.B #$FF                                                 ;81E185|A9FF    |      ;
    STA.B ptrTemp0x72+2                                        ;81E187|8574    |000074;
    JSL.L fGameEngine_AddProfit                                ;81E189|22C9B183|83B1C9;
    REP #$20                                                   ;81E18D|C220    |      ;
    CMP.W #$0000                                               ;81E18F|C90000  |      ;
    BEQ +                                                      ;81E192|F021    |81E1B5;
    SEP #$20                                                   ;81E194|E220    |      ;
    LDA.B #$02                                                 ;81E196|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81E198|8D9A01  |00019A;
    LDX.W #$0304                                               ;81E19B|A20403  |      ;
    LDA.B #$00                                                 ;81E19E|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81E1A0|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81E1A3|225F9383|83935F;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    BRA .return                                                ;81E1B3|806C    |81E221;
 
 
  + SEP #$20                                                   ;81E1B5|E220    |      ;
    LDA.B #$02                                                 ;81E1B7|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81E1B9|8D9A01  |00019A;
    LDX.W #$0311                                               ;81E1BC|A21103  |      ;
    LDA.B #$00                                                 ;81E1BF|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81E1C1|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81E1C4|225F9383|83935F;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    REP #$20                                                   ;81E1D4|C220    |      ;
    LDA.W #$0002                                               ;81E1D6|A90200  |      ;
    JSL.L fGameEngine_AddChicken                               ;81E1D9|2207C883|83C807;
    REP #$20                                                   ;81E1DD|C220    |      ;
    %SetFlag(daily1, $0020)
    SEP #$20                                                   ;81E1EA|E220    |      ;
    LDA.L nOwnedChickens                                       ;81E1EC|AF0B1F7F|7F1F0B;
    INC A                                                      ;81E1F0|1A      |      ;
    STA.L nOwnedChickens                                       ;81E1F1|8F0B1F7F|7F1F0B;
    REP #$20                                                   ;81E1F5|C220    |      ;
    LDA.W #$000A                                               ;81E1F7|A90A00  |      ;
    JSL.L fGameEngine_AddHappiness                             ;81E1FA|2282B283|83B282;
    BRA .return                                                ;81E1FE|8021    |81E221;
 
 
.label31:
    SEP #$20                                                   ;81E200|E220    |      ;
    LDA.B #$02                                                 ;81E202|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81E204|8D9A01  |00019A;
    LDX.W #$0303                                               ;81E207|A20303  |      ;
    LDA.B #$00                                                 ;81E20A|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81E20C|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81E20F|225F9383|83935F;
 
.break:
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    BRA .return                                                ;81E21F|8000    |81E221;
 
 
.return:
    RTS                                                        ;81E221|60      |      ;
 
 
.return2:
    JSL.L fDialog_EndDialogRestoreScroll                               ;81E222|22F99383|8393F9;
    SEP #$20                                                   ;81E226|E220    |      ;
    LDA.B #$01                                                 ;81E228|A901    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81E22A|8D9A01  |00019A;
    REP #$20                                                   ;81E22D|C220    |      ;
    LDA.W strcJoypad1.newInput                                 ;81E22F|AD2801  |000128;
    AND.W #$FF7F                                               ;81E232|297FFF  |      ;
    STA.W strcJoypad1.newInput                                 ;81E235|8D2801  |000128;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    RTS                                                        ;81E244|60      |      ;
 
 
fPlayerInteraction0x2F:
    %SetCurrentCarriedItemIndex($007E)
    %SetPlayerAction(!PACTION_ITEMONHAND)
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    RTS                                                        ;81E269|60      |      ;
 
 
fPlayerInteraction0x30:
    %SetCurrentCarriedItemIndex($007F)
    %SetPlayerAction(!PACTION_ITEMONHAND)
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    RTS                                                        ;81E28E|60      |      ;
 
 
fPlayerInteraction0x31:
    %SetCurrentCarriedItemIndex($0080)
    %SetPlayerAction(!PACTION_ITEMONHAND)
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    RTS                                                        ;81E2B3|60      |      ;
 
 
fPlayerInteraction0x32:
    %SetCurrentCarriedItemIndex($0081)
    %SetPlayerAction(!PACTION_ITEMONHAND)
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    RTS                                                        ;81E2D8|60      |      ;
 
 
fPlayerInteraction0x33_EllenDiary:
    SEP #$20                                                   ;81E2D9|E220    |      ;
    REP #$10                                                   ;81E2DB|C210    |      ;
    LDA.W nPlayerInteractionArg1                               ;81E2DD|AD6F09  |00096F;
    CMP.B #$01                                                 ;81E2E0|C901    |      ;
    BEQ +                                                      ;81E2E2|F01B    |81E2FF;
    SEP #$20                                                   ;81E2E4|E220    |      ;
    LDA.B #$02                                                 ;81E2E6|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81E2E8|8D9A01  |00019A;
    LDX.W #$0023                                               ;81E2EB|A22300  |      ;
    LDA.B #$00                                                 ;81E2EE|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81E2F0|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81E2F3|225F9383|83935F;
    SEP #$20                                                   ;81E2F7|E220    |      ;
    INC.W nPlayerInteractionArg1                               ;81E2F9|EE6F09  |00096F;
    JMP.W .justReturn                                          ;81E2FC|4C48E3  |81E348;
 
 
  + SEP #$20                                                   ;81E2FF|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81E301|AD9A01  |00019A;
    CMP.B #$02                                                 ;81E304|C902    |      ;
    BNE +                                                      ;81E306|D003    |81E30B;
    JMP.W .justReturn                                          ;81E308|4C48E3  |81E348;
 
 
  + LDA.W strcDialogDisplay.dialogOptionsAnswer                ;81E30B|AD8F01  |00018F;
    BEQ +                                                      ;81E30E|F003    |81E313;
    JMP.W .return                                              ;81E310|4C3CE3  |81E33C;
 
 
  + REP #$20                                                   ;81E313|C220    |      ;
    LDA.L nLove_Ellen                                          ;81E315|AF251F7F|7F1F25;
    JSR.W fLove_ScaleToHearts                                  ;81E319|20C5D1  |81D1C5;
    REP #$30                                                   ;81E31C|C230    |      ;
    CLC                                                        ;81E31E|18      |      ;
    ADC.W #$03A6                                               ;81E31F|69A603  |      ;
    TAX                                                        ;81E322|AA      |      ;
    SEP #$20                                                   ;81E323|E220    |      ;
    LDA.B #$02                                                 ;81E325|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81E327|8D9A01  |00019A;
    LDA.B #$00                                                 ;81E32A|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81E32C|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81E32F|225F9383|83935F;
    REP #$20                                                   ;81E333|C220    |      ;
    LDA.W #$FFFF                                               ;81E335|A9FFFF  |      ;
    JSL.L fGameEngine_AddHappiness                             ;81E338|2282B283|83B282;
 
.return:
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
 
.justReturn:
    RTS                                                        ;81E348|60      |      ;
 
 
fPlayerInteraction0x34:
    %SetCurrentCarriedItemIndex($0082)
    %SetPlayerAction(!PACTION_ITEMONHAND)
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    RTS                                                        ;81E36D|60      |      ;
 
 
fPlayerInteraction0x35:
    SEP #$20                                                   ;81E36E|E220    |      ;
    REP #$10                                                   ;81E370|C210    |      ;
    LDA.B #$24                                                 ;81E372|A924    |      ;
    LDX.W #$0007                                               ;81E374|A20700  |      ;
    LDY.W #$0078                                               ;81E377|A07800  |      ;
    JSL.L fAudio_PlaySoundEffectAndWait                                 ;81E37A|22FE8283|8382FE;
    SEP #$20                                                   ;81E37E|E220    |      ;
    STZ.W strcAudio.toolId                                     ;81E380|9C1901  |000119;
    JSL.L fToolUsedSound_PlayOnToolChange                         ;81E383|22F38F82|828FF3;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    RTS                                                        ;81E393|60      |      ;
 
 
fPlayerInteraction0x36_AnnDiary:
    SEP #$20                                                   ;81E394|E220    |      ;
    REP #$10                                                   ;81E396|C210    |      ;
    LDA.W nPlayerInteractionArg1                               ;81E398|AD6F09  |00096F;
    CMP.B #$01                                                 ;81E39B|C901    |      ;
    BEQ +                                                      ;81E39D|F01B    |81E3BA;
    SEP #$20                                                   ;81E39F|E220    |      ;
    LDA.B #$02                                                 ;81E3A1|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81E3A3|8D9A01  |00019A;
    LDX.W #$0023                                               ;81E3A6|A22300  |      ;
    LDA.B #$00                                                 ;81E3A9|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81E3AB|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81E3AE|225F9383|83935F;
    SEP #$20                                                   ;81E3B2|E220    |      ;
    INC.W nPlayerInteractionArg1                               ;81E3B4|EE6F09  |00096F;
    JMP.W .return                                              ;81E3B7|4C03E4  |81E403;
 
 
  + SEP #$20                                                   ;81E3BA|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81E3BC|AD9A01  |00019A;
    CMP.B #$02                                                 ;81E3BF|C902    |      ;
    BNE +                                                      ;81E3C1|D003    |81E3C6;
    JMP.W .return                                              ;81E3C3|4C03E4  |81E403;
 
 
  + LDA.W strcDialogDisplay.dialogOptionsAnswer                ;81E3C6|AD8F01  |00018F;
    BEQ +                                                      ;81E3C9|F003    |81E3CE;
    JMP.W .exit                                                ;81E3CB|4CF7E3  |81E3F7;
 
 
  + REP #$20                                                   ;81E3CE|C220    |      ;
    LDA.L nLove_Ann                                            ;81E3D0|AF211F7F|7F1F21;
    JSR.W fLove_ScaleToHearts                                  ;81E3D4|20C5D1  |81D1C5;
    REP #$30                                                   ;81E3D7|C230    |      ;
    CLC                                                        ;81E3D9|18      |      ;
    ADC.W #$03A6                                               ;81E3DA|69A603  |      ;
    TAX                                                        ;81E3DD|AA      |      ;
    SEP #$20                                                   ;81E3DE|E220    |      ;
    LDA.B #$02                                                 ;81E3E0|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81E3E2|8D9A01  |00019A;
    LDA.B #$00                                                 ;81E3E5|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81E3E7|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81E3EA|225F9383|83935F;
    REP #$20                                                   ;81E3EE|C220    |      ;
    LDA.W #$FFFF                                               ;81E3F0|A9FFFF  |      ;
    JSL.L fGameEngine_AddHappiness                             ;81E3F3|2282B283|83B282;
 
.exit:
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
 
.return:
    RTS                                                        ;81E403|60      |      ;
 
 
fPlayerInteraction0x37:
    %SetCurrentCarriedItemIndex($0077)
    %SetPlayerAction(!PACTION_ITEMONHAND)
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    RTS                                                        ;81E428|60      |      ;
 
 
fPlayerInteraction0x38:
    %SetCurrentCarriedItemIndex($0076)
    %SetPlayerAction(!PACTION_ITEMONHAND)
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    RTS                                                        ;81E44D|60      |      ;
 
 
fPlayerInteraction0x39:
    %SetCurrentCarriedItemIndex($0078)
    %SetPlayerAction(!PACTION_ITEMONHAND)
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    RTS                                                        ;81E472|60      |      ;
 
 
fPlayerInteraction0x3A:
    %SetCurrentCarriedItemIndex($007D)
    %SetPlayerAction(!PACTION_ITEMONHAND)
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    RTS                                                        ;81E497|60      |      ;
 
 
fPlayerInteraction0x3B:
    %SetCurrentCarriedItemIndex($0079)
    %SetPlayerAction(!PACTION_ITEMONHAND)
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    RTS                                                        ;81E4BC|60      |      ;
 
 
fPlayerInteraction0x3C:
    %SetCurrentCarriedItemIndex($007A)
    %SetPlayerAction(!PACTION_ITEMONHAND)
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    RTS                                                        ;81E4E1|60      |      ;
 
 
fPlayerInteraction0x3D:
    %SetCurrentCarriedItemIndex($007B)
    %SetPlayerAction(!PACTION_ITEMONHAND)
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    RTS                                                        ;81E506|60      |      ;
 
 
fPlayerInteraction0x3E:
    %SetCurrentCarriedItemIndex($007C)
    %SetPlayerAction(!PACTION_ITEMONHAND)
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    RTS                                                        ;81E52B|60      |      ;
 
 
fPlayerInteraction0x3F_EveDiary:
    SEP #$20                                                   ;81E52C|E220    |      ;
    REP #$10                                                   ;81E52E|C210    |      ;
    LDA.W nPlayerInteractionArg1                               ;81E530|AD6F09  |00096F;
    CMP.B #$01                                                 ;81E533|C901    |      ;
    BEQ +                                                      ;81E535|F01B    |81E552;
    SEP #$20                                                   ;81E537|E220    |      ;
    LDA.B #$02                                                 ;81E539|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81E53B|8D9A01  |00019A;
    LDX.W #$0023                                               ;81E53E|A22300  |      ;
    LDA.B #$00                                                 ;81E541|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81E543|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81E546|225F9383|83935F;
    SEP #$20                                                   ;81E54A|E220    |      ;
    INC.W nPlayerInteractionArg1                               ;81E54C|EE6F09  |00096F;
    JMP.W .return                                              ;81E54F|4C9BE5  |81E59B;
 
 
  + SEP #$20                                                   ;81E552|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81E554|AD9A01  |00019A;
    CMP.B #$02                                                 ;81E557|C902    |      ;
    BNE +                                                      ;81E559|D003    |81E55E;
    JMP.W .return                                              ;81E55B|4C9BE5  |81E59B;
 
 
  + LDA.W strcDialogDisplay.dialogOptionsAnswer                ;81E55E|AD8F01  |00018F;
    BEQ +                                                      ;81E561|F003    |81E566;
    JMP.W .exit                                                ;81E563|4C8FE5  |81E58F;
 
 
  + REP #$20                                                   ;81E566|C220    |      ;
    LDA.L nLove_Eve                                            ;81E568|AF271F7F|7F1F27;
    JSR.W fLove_ScaleToHearts                                  ;81E56C|20C5D1  |81D1C5;
    REP #$30                                                   ;81E56F|C230    |      ;
    CLC                                                        ;81E571|18      |      ;
    ADC.W #$03A6                                               ;81E572|69A603  |      ;
    TAX                                                        ;81E575|AA      |      ;
    SEP #$20                                                   ;81E576|E220    |      ;
    LDA.B #$02                                                 ;81E578|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81E57A|8D9A01  |00019A;
    LDA.B #$00                                                 ;81E57D|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81E57F|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81E582|225F9383|83935F;
    REP #$20                                                   ;81E586|C220    |      ;
    LDA.W #$FFFF                                               ;81E588|A9FFFF  |      ;
    JSL.L fGameEngine_AddHappiness                             ;81E58B|2282B283|83B282;
 
.exit:
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
 
.return:
    RTS                                                        ;81E59B|60      |      ;
 
 
fPlayerInteraction0x40_LessonsOfLove:
    SEP #$20                                                   ;81E59C|E220    |      ;
    REP #$10                                                   ;81E59E|C210    |      ;
    LDA.W nPlayerInteractionArg1                               ;81E5A0|AD6F09  |00096F;
    CMP.B #$01                                                 ;81E5A3|C901    |      ;
    BEQ .check                                                 ;81E5A5|F01B    |81E5C2;
    SEP #$20                                                   ;81E5A7|E220    |      ;
    LDA.B #$02                                                 ;81E5A9|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81E5AB|8D9A01  |00019A;
    LDX.W #$045F                                               ;81E5AE|A25F04  |      ;
    LDA.B #$00                                                 ;81E5B1|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81E5B3|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81E5B6|225F9383|83935F;
    SEP #$20                                                   ;81E5BA|E220    |      ;
    INC.W nPlayerInteractionArg1                               ;81E5BC|EE6F09  |00096F;
    JMP.W .justReturn                                          ;81E5BF|4C9FE6  |81E69F;
 
 
.check:
    REP #$30                                                   ;81E5C2|C230    |      ;
    LDA.W strcJoypad1.current                                  ;81E5C4|AD2401  |000124;
    BIT.W #!JOYPAD_B                                               
    BEQ +                                                      ;81E5CA|F003    |81E5CF;
    JMP.W .return                                              ;81E5CC|4CA0E6  |81E6A0;
 
 
  + SEP #$20                                                   ;81E5CF|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81E5D1|AD9A01  |00019A;
    CMP.B #$02                                                 ;81E5D4|C902    |      ;
    BNE +                                                      ;81E5D6|D003    |81E5DB;
    JMP.W .justReturn                                          ;81E5D8|4C9FE6  |81E69F;
 
 
  + LDA.W strcDialogDisplay.dialogOptionsAnswer                ;81E5DB|AD8F01  |00018F;
    CMP.B #$00                                                 ;81E5DE|C900    |      ;
    BEQ .present                                               ;81E5E0|F013    |81E5F5;
    CMP.B #$01                                                 ;81E5E2|C901    |      ;
    BEQ .festival                                              ;81E5E4|F031    |81E617;
    CMP.B #$02                                                 ;81E5E6|C902    |      ;
    BEQ .marriage                                              ;81E5E8|F04F    |81E639;
    CMP.B #$03                                                 ;81E5EA|C903    |      ;
    BEQ .conversation                                          ;81E5EC|F06D    |81E65B;
    CMP.B #$04                                                 ;81E5EE|C904    |      ;
    BNE .present                                               ;81E5F0|D003    |81E5F5;
    JMP.W .diary                                               ;81E5F2|4C7DE6  |81E67D;
 
 
.present:
    SEP #$20                                                   ;81E5F5|E220    |      ;
    LDA.B #$02                                                 ;81E5F7|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81E5F9|8D9A01  |00019A;
    LDX.W #$0460                                               ;81E5FC|A26004  |      ;
    LDA.B #$00                                                 ;81E5FF|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81E601|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81E604|225F9383|83935F;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    JMP.W .justReturn                                          ;81E614|4C9FE6  |81E69F;
 
 
.festival:
    SEP #$20                                                   ;81E617|E220    |      ;
    LDA.B #$02                                                 ;81E619|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81E61B|8D9A01  |00019A;
    LDX.W #$0462                                               ;81E61E|A26204  |      ;
    LDA.B #$00                                                 ;81E621|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81E623|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81E626|225F9383|83935F;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    JMP.W .justReturn                                          ;81E636|4C9FE6  |81E69F;
 
 
.marriage:
    SEP #$20                                                   ;81E639|E220    |      ;
    LDA.B #$02                                                 ;81E63B|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81E63D|8D9A01  |00019A;
    LDX.W #$0464                                               ;81E640|A26404  |      ;
    LDA.B #$00                                                 ;81E643|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81E645|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81E648|225F9383|83935F;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    JMP.W .justReturn                                          ;81E658|4C9FE6  |81E69F;
 
 
.conversation:
    SEP #$20                                                   ;81E65B|E220    |      ;
    LDA.B #$02                                                 ;81E65D|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81E65F|8D9A01  |00019A;
    LDX.W #$0461                                               ;81E662|A26104  |      ;
    LDA.B #$00                                                 ;81E665|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81E667|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81E66A|225F9383|83935F;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    JMP.W .justReturn                                          ;81E67A|4C9FE6  |81E69F;
 
 
.diary:
    SEP #$20                                                   ;81E67D|E220    |      ;
    LDA.B #$02                                                 ;81E67F|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81E681|8D9A01  |00019A;
    LDX.W #$0463                                               ;81E684|A26304  |      ;
    LDA.B #$00                                                 ;81E687|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81E689|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81E68C|225F9383|83935F;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    JMP.W .justReturn                                          ;81E69C|4C9FE6  |81E69F;
 
 
.justReturn:
    RTS                                                        ;81E69F|60      |      ;
 
 
.return:
    JSL.L fDialog_EndDialogRestoreScroll                               ;81E6A0|22F99383|8393F9;
    SEP #$20                                                   ;81E6A4|E220    |      ;
    LDA.B #$01                                                 ;81E6A6|A901    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81E6A8|8D9A01  |00019A;
    REP #$20                                                   ;81E6AB|C220    |      ;
    LDA.W strcJoypad1.newInput                                 ;81E6AD|AD2801  |000128;
    AND.W #~!JOYPAD_A                                               
    STA.W strcJoypad1.newInput                                 ;81E6B3|8D2801  |000128;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    RTS                                                        ;81E6C2|60      |      ;
 
 
fPlayerInteraction0x41_HotSprings:
    REP #$30                                                   ;81E6C3|C230    |      ;
    %SetPlayerFlag(!PFLAGS_INSPRINGS)
    %SetPlayerAction(!PACTION_JUMP)
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    %UpdateStamina(12)
    RTS                                                        ;81E6E9|60      |      ;
 
 
fPlayerInteraction0x42:
    SEP #$20                                                   ;81E6EA|E220    |      ;
    REP #$10                                                   ;81E6EC|C210    |      ;
    LDA.W nPlayerInteractionArg1                               ;81E6EE|AD6F09  |00096F;
    CMP.B #$01                                                 ;81E6F1|C901    |      ;
    BEQ .case1                                                 ;81E6F3|F03D    |81E732;
    CMP.B #$02                                                 ;81E6F5|C902    |      ;
    BEQ .case2                                                 ;81E6F7|F069    |81E762;
    CMP.B #$03                                                 ;81E6F9|C903    |      ;
    BNE .default                                               ;81E6FB|D003    |81E700;
    JMP.W .case3                                               ;81E6FD|4C91E7  |81E791;
 
 
.default:
    %SetPlayerFlag(!PFLAGS_INTRANSITION)
    %SetPlayerAction(!PACTION_WALK)
    %SetPlayerDirection(!PDIR_LEFT)
    %SetObjectDirection(!PDIR_LEFT)
    SEP #$20                                                   ;81E71F|E220    |      ;
    INC.W nPlayerInteractionArg2                               ;81E721|EE7009  |000970;
    LDA.W nPlayerInteractionArg2                               ;81E724|AD7009  |000970;
    CMP.B #$20                                                 ;81E727|C920    |      ;
    if !REGION_EUDE
    BEQ .r_81E729_1
    JMP.W .return
.r_81E729_1:
    LDA.B #$01
    STA.W nPlayerInteractionArg1
    JMP.W .return
    else
    BNE .return                                                ;81E729|D072    |81E79D;
    LDA.B #$01                                                 ;81E72B|A901    |      ;
    STA.W nPlayerInteractionArg1                               ;81E72D|8D6F09  |00096F;
    BRA .return                                                ;81E730|806B    |81E79D;
    endif
 
 
.case1:
    SEP #$20                                                   ;81E732|E220    |      ;
    LDX.W #$030C                                               ;81E734|A20C03  |      ;
    LDA.L strcShedItems.row2                                   ;81E737|AF011F7F|7F1F01;
    AND.B #$04                                                 ;81E73B|2904    |      ;
    if !REGION_EUDE
    BNE L_81E749
    LDA.W strcPlayerData.toolEquipped
    CMP.B #$0B
    BEQ L_81E749
    LDA.W strcPlayerData.toolSecond
    else
    BNE +                                                      ;81E73D|D00A    |81E749;
    LDA.W strcPlayerData.toolEquipped                          ;81E73F|AD2109  |000921;
    endif
    CMP.B #!EITEM_BELL                                                 
    BEQ +                                                      ;81E744|F003    |81E749;
    LDX.W #$010E                                               ;81E746|A20E01  |      ;
 
  + SEP #$20                                                   ;81E749|E220    |      ;
    LDA.B #$02                                                 ;81E74B|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81E74D|8D9A01  |00019A;
    LDA.B #$00                                                 ;81E750|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81E752|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81E755|225F9383|83935F;
    SEP #$20                                                   ;81E759|E220    |      ;
    LDA.B #$02                                                 ;81E75B|A902    |      ;
    STA.W nPlayerInteractionArg1                               ;81E75D|8D6F09  |00096F;
    BRA .return                                                ;81E760|803B    |81E79D;
 
 
.case2:
    SEP #$20                                                   ;81E762|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81E764|AD9A01  |00019A;
    CMP.B #$02                                                 ;81E767|C902    |      ;
    BNE +                                                      ;81E769|D003    |81E76E;
    JMP.W .return                                              ;81E76B|4C9DE7  |81E79D;
 
 
  + SEP #$20                                                   ;81E76E|E220    |      ;
    LDA.B #$03                                                 ;81E770|A903    |      ;
    STA.W nPlayerInteractionArg1                               ;81E772|8D6F09  |00096F;
    LDA.B #$01                                                 ;81E775|A901    |      ;
    if !REGION_EUDE
    STA.W strcMenuData.nameDestinationIdx
    SEP #$20
    LDA.L $7F1F01
    AND.B #$04
    BNE L_81E784
    LDA.W strcPlayerData.toolEquipped
    CMP.B #$0B
    BEQ L_81E784
    LDA.W strcPlayerData.toolSecond
    CMP.B #$0B
    BEQ L_81E784
    LDA.L $7F1F01
    else
    STA.W strcMenuData.nameDestinationIdx                      ;81E777|8D9F09  |00099F;
    LDA.L strcShedItems.row2                                   ;81E77A|AF011F7F|7F1F01;
    endif
    ORA.B #$04                                                 ;81E77E|0904    |      ;
    STA.L strcShedItems.row2                                   ;81E780|8F011F7F|7F1F01;
    REP #$20                                                   ;81E784|C220    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;81E786|AD9601  |000196;
    ORA.W #$2000                                               ;81E789|090020  |      ;
    STA.W strcDialogDisplay.mapFlags                           ;81E78C|8D9601  |000196;
    BRA .return                                                ;81E78F|800C    |81E79D;
 
 
.case3:
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
 
.return:
    RTS                                                        ;81E79D|60      |      ;
 
 
fPlayerInteraction0x43:
    SEP #$20                                                   ;81E79E|E220    |      ;
    REP #$10                                                   ;81E7A0|C210    |      ;
    LDA.W nPlayerInteractionArg1                               ;81E7A2|AD6F09  |00096F;
    CMP.B #$01                                                 ;81E7A5|C901    |      ;
    BNE +                                                      ;81E7A7|D003    |81E7AC;
    JMP.W .case1                                               ;81E7A9|4C66E8  |81E866;
 
 
  + CMP.B #$02                                                 ;81E7AC|C902    |      ;
    BNE +                                                      ;81E7AE|D003    |81E7B3;
    JMP.W .case2                                               ;81E7B0|4C10E9  |81E910;
 
 
  + CMP.B #$03                                                 ;81E7B3|C903    |      ;
    BNE +                                                      ;81E7B5|D003    |81E7BA;
    JMP.W .case3                                               ;81E7B7|4C5DE9  |81E95D;
 
 
  + CMP.B #$04                                                 ;81E7BA|C904    |      ;
    BNE +                                                      ;81E7BC|D003    |81E7C1;
    JMP.W .case4                                               ;81E7BE|4CE2E9  |81E9E2;
 
 
  + CMP.B #$05                                                 ;81E7C1|C905    |      ;
    BNE +                                                      ;81E7C3|D003    |81E7C8;
    JMP.W .case5                                               ;81E7C5|4C11EA  |81EA11;
 
 
  + CMP.B #$06                                                 ;81E7C8|C906    |      ;
    BNE +                                                      ;81E7CA|D003    |81E7CF;
    JMP.W .case6                                               ;81E7CC|4C42EA  |81EA42;
 
 
  + CMP.B #$07                                                 ;81E7CF|C907    |      ;
    BNE +                                                      ;81E7D1|D003    |81E7D6;
    JMP.W .case7                                               ;81E7D3|4C8EEA  |81EA8E;
 
 
  + CMP.B #$08                                                 ;81E7D6|C908    |      ;
    BNE +                                                      ;81E7D8|D003    |81E7DD;
    JMP.W .case8                                               ;81E7DA|4CBAEA  |81EABA;
 
 
  + CMP.B #$09                                                 ;81E7DD|C909    |      ;
    BNE +                                                      ;81E7DF|D003    |81E7E4;
    JMP.W .case9                                               ;81E7E1|4C07EB  |81EB07;
 
 
  + CMP.B #$0A                                                 ;81E7E4|C90A    |      ;
    BNE +                                                      ;81E7E6|D003    |81E7EB;
    JMP.W .caseA                                               ;81E7E8|4C8FEB  |81EB8F;
 
 
  + CMP.B #$0B                                                 ;81E7EB|C90B    |      ;
    BNE .checks                                                ;81E7ED|D003    |81E7F2;
    JMP.W .caseB                                               ;81E7EF|4CBFEB  |81EBBF;
 
 
.checks:
    SEP #$20                                                   ;81E7F2|E220    |      ;
    LDA.B #$00                                                 ;81E7F4|A900    |      ;
    XBA                                                        ;81E7F6|EB      |      ;
    LDA.W $09A0+!RAM_SHIFT                                 ;81E7F7|ADA009  |0009A0;
    SEC                                                        ;81E7FA|38      |      ;
    SBC.B #$18                                                 ;81E7FB|E918    |      ;
    REP #$20                                                   ;81E7FD|C220    |      ;
    JSL.L fGameEngine_GetCowData                               ;81E7FF|22A7C983|83C9A7;
    SEP #$20                                                   ;81E803|E220    |      ;
    LDY.W #$0000                                               ;81E805|A00000  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;81E808|B772    |000072; strcCowData.statusFlags
    AND.B #$06                                                 ;81E80A|2906    |      ; 00000110 = adult, child
    BNE .failCheck                                             ;81E80C|D03F    |81E84D;
    LDA.B [ptrTemp0x72],Y                                      ;81E80E|B772    |000072; strcCowData.statusFlags
    AND.B #$70                                                 ;81E810|2970    |      ; 01110000 = pregnacy, sick, cranky
    BNE .failCheck                                             ;81E812|D039    |81E84D;
    SEP #$20                                                   ;81E814|E220    |      ;
    LDA.L nCurrentYearID                                       ;81E816|AF181F7F|7F1F18;
    BEQ .failCheck                                             ;81E81A|F031    |81E84D;
    if !REGION_EUDE
    REP #$20
    else
    REP #$30                                                   ;81E81C|C230    |      ;
    endif
    %CheckFlag(event2, $8000)
    BNE .failCheck                                             ;81E825|D026    |81E84D;
    REP #$20                                                   ;81E827|C220    |      ;
    %SetFlag(event2, $8000)
    REP #$20                                                   ;81E834|C220    |      ;
    %AIExecute($0008, $0000, $007C)
    SEP #$20                                                   ;81E843|E220    |      ;
    LDA.B #$07                                                 ;81E845|A907    |      ;
    STA.W nPlayerInteractionArg1                               ;81E847|8D6F09  |00096F;
    JMP.W .return                                              ;81E84A|4CD4EB  |81EBD4;
 
 
.failCheck:
    REP #$20                                                   ;81E84D|C220    |      ;
    %AIExecute($0007, $0000, $0021)
    SEP #$20                                                   ;81E85C|E220    |      ;
    LDA.B #$01                                                 ;81E85E|A901    |      ;
    STA.W nPlayerInteractionArg1                               ;81E860|8D6F09  |00096F;
    JMP.W .return                                              ;81E863|4CD4EB  |81EBD4;
 
 
.case1:
    SEP #$20                                                   ;81E866|E220    |      ;
    INC.W nPlayerInteractionArg2                               ;81E868|EE7009  |000970;
    LDA.W nPlayerInteractionArg2                               ;81E86B|AD7009  |000970;
    CMP.B #$40                                                 ;81E86E|C940    |      ;
    BEQ +                                                      ;81E870|F003    |81E875;
    JMP.W .return                                              ;81E872|4CD4EB  |81EBD4;
 
 
  + REP #$20                                                   ;81E875|C220    |      ;
    %CheckFlag(daily4, $2000)
    BNE .label17                                               ;81E87E|D071    |81E8F1;
    SEP #$20                                                   ;81E880|E220    |      ;
    LDA.B #$02                                                 ;81E882|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81E884|8D9A01  |00019A;
    SEP #$20                                                   ;81E887|E220    |      ;
    LDA.B #$00                                                 ;81E889|A900    |      ;
    XBA                                                        ;81E88B|EB      |      ;
    LDA.W $09A0+!RAM_SHIFT                                 ;81E88C|ADA009  |0009A0;
    SEC                                                        ;81E88F|38      |      ;
    SBC.B #$18                                                 ;81E890|E918    |      ;
    REP #$20                                                   ;81E892|C220    |      ;
    JSL.L fGameEngine_GetCowData                               ;81E894|22A7C983|83C9A7;
    SEP #$20                                                   ;81E898|E220    |      ;
    LDY.W #$0000                                               ;81E89A|A00000  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;81E89D|B772    |000072; strcCowData.statusFlags
    AND.B #$06                                                 ;81E89F|2906    |      ; 00000110 = adult, child
    BNE .label15                                               ;81E8A1|D01E    |81E8C1;
    LDA.B [ptrTemp0x72],Y                                      ;81E8A3|B772    |000072; strcCowData.statusFlags
    AND.B #$70                                                 ;81E8A5|2970    |      ; 01110000 = pregnacy, sick, cranky
    BNE .label16                                               ;81E8A7|D030    |81E8D9;
    LDX.W #$030E                                               ;81E8A9|A20E03  |      ;
    SEP #$20                                                   ;81E8AC|E220    |      ;
    LDA.B #$00                                                 ;81E8AE|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81E8B0|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81E8B3|225F9383|83935F;
    SEP #$20                                                   ;81E8B7|E220    |      ;
    LDA.B #$02                                                 ;81E8B9|A902    |      ;
    STA.W nPlayerInteractionArg1                               ;81E8BB|8D6F09  |00096F;
    JMP.W .return                                              ;81E8BE|4CD4EB  |81EBD4;
 
 
.label15:
    LDX.W #$0310                                               ;81E8C1|A21003  |      ; TEXT_B9C65A
    SEP #$20                                                   ;81E8C4|E220    |      ;
    LDA.B #$00                                                 ;81E8C6|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81E8C8|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81E8CB|225F9383|83935F;
    SEP #$20                                                   ;81E8CF|E220    |      ;
    LDA.B #$05                                                 ;81E8D1|A905    |      ;
    STA.W nPlayerInteractionArg1                               ;81E8D3|8D6F09  |00096F;
    JMP.W .return                                              ;81E8D6|4CD4EB  |81EBD4;
 
 
.label16:
    LDX.W #$030D                                               ;81E8D9|A20D03  |      ; TEXT_B9C3EA
    SEP #$20                                                   ;81E8DC|E220    |      ;
    LDA.B #$00                                                 ;81E8DE|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81E8E0|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81E8E3|225F9383|83935F;
    SEP #$20                                                   ;81E8E7|E220    |      ;
    LDA.B #$05                                                 ;81E8E9|A905    |      ;
    STA.W nPlayerInteractionArg1                               ;81E8EB|8D6F09  |00096F;
    JMP.W .return                                              ;81E8EE|4CD4EB  |81EBD4;
 
 
.label17:
    REP #$30                                                   ;81E8F1|C230    |      ; TEXT_BBB4B6
    LDX.W #$0487                                               ;81E8F3|A28704  |      ;
    SEP #$20                                                   ;81E8F6|E220    |      ;
    LDA.B #$02                                                 ;81E8F8|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81E8FA|8D9A01  |00019A;
    LDA.B #$00                                                 ;81E8FD|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81E8FF|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81E902|225F9383|83935F;
    SEP #$20                                                   ;81E906|E220    |      ;
    LDA.B #$05                                                 ;81E908|A905    |      ;
    STA.W nPlayerInteractionArg1                               ;81E90A|8D6F09  |00096F;
    JMP.W .return                                              ;81E90D|4CD4EB  |81EBD4;
 
 
.case2:
    SEP #$20                                                   ;81E910|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81E912|AD9A01  |00019A;
    CMP.B #$02                                                 ;81E915|C902    |      ;
    BNE +                                                      ;81E917|D003    |81E91C;
    JMP.W .return                                              ;81E919|4CD4EB  |81EBD4;
 
 
  + SEP #$20                                                   ;81E91C|E220    |      ;
    LDA.W strcDialogDisplay.dialogOptionsAnswer                ;81E91E|AD8F01  |00018F;
    BNE +                                                      ;81E921|D01D    |81E940;
    SEP #$20                                                   ;81E923|E220    |      ;
    LDA.B #$02                                                 ;81E925|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81E927|8D9A01  |00019A;
    LDX.W #$030F                                               ;81E92A|A20F03  |      ;
    LDA.B #$00                                                 ;81E92D|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81E92F|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81E932|225F9383|83935F;
    SEP #$20                                                   ;81E936|E220    |      ;
    LDA.B #$03                                                 ;81E938|A903    |      ;
    STA.W nPlayerInteractionArg1                               ;81E93A|8D6F09  |00096F;
    JMP.W .return                                              ;81E93D|4CD4EB  |81EBD4;
 
 
  + SEP #$20                                                   ;81E940|E220    |      ;
    LDA.B #$02                                                 ;81E942|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81E944|8D9A01  |00019A;
    LDX.W #$0309                                               ;81E947|A20903  |      ;
    LDA.B #$00                                                 ;81E94A|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81E94C|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81E94F|225F9383|83935F;
    SEP #$20                                                   ;81E953|E220    |      ;
    LDA.B #$05                                                 ;81E955|A905    |      ;
    STA.W nPlayerInteractionArg1                               ;81E957|8D6F09  |00096F;
    JMP.W .return                                              ;81E95A|4CD4EB  |81EBD4;
 
 
.case3:
    SEP #$20                                                   ;81E95D|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81E95F|AD9A01  |00019A;
    CMP.B #$02                                                 ;81E962|C902    |      ;
    BNE +                                                      ;81E964|D003    |81E969;
    JMP.W .return                                              ;81E966|4CD4EB  |81EBD4;
 
 
  + REP #$20                                                   ;81E969|C220    |      ;
    LDA.L nGameUnk7F1F15                                       ;81E96B|AF151F7F|7F1F15;
    STA.B ptrTemp0x72                                          ;81E96F|8572    |000072;
    SEP #$20                                                   ;81E971|E220    |      ;
    LDA.L nGameUnk7F1F15+2                                     ;81E973|AF171F7F|7F1F17;
    STA.B ptrTemp0x72+2                                        ;81E977|8574    |000074;
    JSL.L fGameEngine_AddProfit                                ;81E979|22C9B183|83B1C9;
    REP #$20                                                   ;81E97D|C220    |      ;
    LDA.W #$0007                                               ;81E97F|A90700  |      ;
    JSL.L fAI_DeactivateSlotAndObject                                    ;81E982|22208084|848020;
    REP #$20                                                   ;81E986|C220    |      ;
    %AIExecute($0007, $0000, $0023)
    SEP #$20                                                   ;81E995|E220    |      ;
    LDA.B #$00                                                 ;81E997|A900    |      ;
    XBA                                                        ;81E999|EB      |      ;
    LDA.W $09A0+!RAM_SHIFT                                 ;81E99A|ADA009  |0009A0;
    LDX.W #$0000                                               ;81E99D|A20000  |      ;
    LDY.W #$0022                                               ;81E9A0|A02200  |      ;
    JSL.L fAI_SetSlotScript                                    ;81E9A3|223F8084|84803F;
    SEP #$20                                                   ;81E9A7|E220    |      ;
    LDA.B #$00                                                 ;81E9A9|A900    |      ;
    XBA                                                        ;81E9AB|EB      |      ;
    LDA.W $09A0+!RAM_SHIFT                                 ;81E9AC|ADA009  |0009A0;
    SEC                                                        ;81E9AF|38      |      ;
    SBC.B #$18                                                 ;81E9B0|E918    |      ;
    REP #$20                                                   ;81E9B2|C220    |      ;
    JSL.L fGameEngine_GetCowData                               ;81E9B4|22A7C983|83C9A7;
    SEP #$20                                                   ;81E9B8|E220    |      ;
    LDY.W #$0000                                               ;81E9BA|A00000  |      ;
    LDA.B #$00                                                 ;81E9BD|A900    |      ;
    STA.B [ptrTemp0x72],Y                                      ;81E9BF|9772    |000072;
    SEP #$20                                                   ;81E9C1|E220    |      ;
    LDA.L nOwnedCows                                           ;81E9C3|AF0A1F7F|7F1F0A;
    DEC A                                                      ;81E9C7|3A      |      ;
    STA.L nOwnedCows                                           ;81E9C8|8F0A1F7F|7F1F0A;
    SEP #$20                                                   ;81E9CC|E220    |      ;
    LDA.B #$04                                                 ;81E9CE|A904    |      ;
    STA.W nPlayerInteractionArg1                               ;81E9D0|8D6F09  |00096F;
    STZ.W nPlayerInteractionArg2                               ;81E9D3|9C7009  |000970;
    REP #$20                                                   ;81E9D6|C220    |      ;
    LDA.W #$FFCE                                               ;81E9D8|A9CEFF  |      ;
    JSL.L fGameEngine_AddHappiness                             ;81E9DB|2282B283|83B282;
    JMP.W .return                                              ;81E9DF|4CD4EB  |81EBD4;
 
 
.case4:
    SEP #$20                                                   ;81E9E2|E220    |      ;
    INC.W nPlayerInteractionArg2                               ;81E9E4|EE7009  |000970;
    LDA.W nPlayerInteractionArg2                               ;81E9E7|AD7009  |000970;
    CMP.B #$42                                                 ;81E9EA|C942    |      ;
    BEQ +                                                      ;81E9EC|F003    |81E9F1;
    JMP.W .return                                              ;81E9EE|4CD4EB  |81EBD4;
 
 
  + STZ.W nPlayerInteractionArg2                               ;81E9F1|9C7009  |000970;
    REP #$20                                                   ;81E9F4|C220    |      ;
    %CheckFlag(daily4, $2000)
    BEQ +                                                      ;81E9FD|F003    |81EA02;
    JMP.W .failCheck                                           ;81E9FF|4C4DE8  |81E84D;
 
 
  + %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    JMP.W .return                                              ;81EA0E|4CD4EB  |81EBD4;
 
 
.case5:
    SEP #$20                                                   ;81EA11|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81EA13|AD9A01  |00019A;
    CMP.B #$02                                                 ;81EA16|C902    |      ;
    BNE +                                                      ;81EA18|D003    |81EA1D;
    JMP.W .return                                              ;81EA1A|4CD4EB  |81EBD4;
 
 
  + REP #$20                                                   ;81EA1D|C220    |      ;
    LDA.W #$0007                                               ;81EA1F|A90700  |      ;
    JSL.L fAI_DeactivateSlotAndObject                                    ;81EA22|22208084|848020;
    REP #$20                                                   ;81EA26|C220    |      ;
    %AIExecute($0007, $0000, $0023)
    SEP #$20                                                   ;81EA35|E220    |      ;
    LDA.B #$06                                                 ;81EA37|A906    |      ;
    STA.W nPlayerInteractionArg1                               ;81EA39|8D6F09  |00096F;
    STZ.W nPlayerInteractionArg2                               ;81EA3C|9C7009  |000970;
    JMP.W .return                                              ;81EA3F|4CD4EB  |81EBD4;
 
 
.case6:
    SEP #$20                                                   ;81EA42|E220    |      ;
    INC.W nPlayerInteractionArg2                               ;81EA44|EE7009  |000970;
    LDA.W nPlayerInteractionArg2                               ;81EA47|AD7009  |000970;
    CMP.B #$40                                                 ;81EA4A|C940    |      ;
    BEQ +                                                      ;81EA4C|F003    |81EA51;
    JMP.W .return                                              ;81EA4E|4CD4EB  |81EBD4;
 
 
  + %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    REP #$20                                                   ;81EA5D|C220    |      ;
    %CheckFlag(daily4, $2000)
    BEQ +                                                      ;81EA66|F003    |81EA6B;
    JMP.W .return                                              ;81EA68|4CD4EB  |81EBD4;
 
 
  + SEP #$20                                                   ;81EA6B|E220    |      ;
    LDA.B #$00                                                 ;81EA6D|A900    |      ;
    XBA                                                        ;81EA6F|EB      |      ;
    LDA.W $09A0+!RAM_SHIFT                                 ;81EA70|ADA009  |0009A0;
    JSL.L fAI_SetCCPointer                                     ;81EA73|227C8884|84887C;
    SEP #$20                                                   ;81EA77|E220    |      ;
    REP #$10                                                   ;81EA79|C210    |      ;
    LDY.W #$0001                                               ;81EA7B|A00100  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;81EA7E|B7CC    |0000CC;
    ORA.B #$A8                                                 ;81EA80|09A8    |      ;
    SEP #$20                                                   ;81EA82|E220    |      ;
    REP #$10                                                   ;81EA84|C210    |      ;
    LDY.W #$0001                                               ;81EA86|A00100  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;81EA89|97CC    |0000CC;
    JMP.W .return                                              ;81EA8B|4CD4EB  |81EBD4;
 
 
.case7:
    SEP #$20                                                   ;81EA8E|E220    |      ;
    INC.W nPlayerInteractionArg2                               ;81EA90|EE7009  |000970;
    LDA.W nPlayerInteractionArg2                               ;81EA93|AD7009  |000970;
    CMP.B #$42                                                 ;81EA96|C942    |      ;
    BEQ +                                                      ;81EA98|F003    |81EA9D;
    JMP.W .return                                              ;81EA9A|4CD4EB  |81EBD4;
 
 
  + LDX.W #$0149                                               ;81EA9D|A24901  |      ;
    SEP #$20                                                   ;81EAA0|E220    |      ;
    LDA.B #$02                                                 ;81EAA2|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81EAA4|8D9A01  |00019A;
    LDA.B #$00                                                 ;81EAA7|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81EAA9|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81EAAC|225F9383|83935F;
    SEP #$20                                                   ;81EAB0|E220    |      ;
    LDA.B #$08                                                 ;81EAB2|A908    |      ;
    STA.W nPlayerInteractionArg1                               ;81EAB4|8D6F09  |00096F;
    JMP.W .return                                              ;81EAB7|4CD4EB  |81EBD4;
 
 
.case8:
    SEP #$20                                                   ;81EABA|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81EABC|AD9A01  |00019A;
    CMP.B #$02                                                 ;81EABF|C902    |      ;
    BNE +                                                      ;81EAC1|D003    |81EAC6;
    JMP.W .return                                              ;81EAC3|4CD4EB  |81EBD4;
 
 
  + SEP #$20                                                   ;81EAC6|E220    |      ;
    LDA.W strcDialogDisplay.dialogOptionsAnswer                ;81EAC8|AD8F01  |00018F;
    BNE +                                                      ;81EACB|D01D    |81EAEA;
    SEP #$20                                                   ;81EACD|E220    |      ;
    LDA.B #$02                                                 ;81EACF|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81EAD1|8D9A01  |00019A;
    LDX.W #$014B                                               ;81EAD4|A24B01  |      ;
    LDA.B #$00                                                 ;81EAD7|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81EAD9|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81EADC|225F9383|83935F;
    SEP #$20                                                   ;81EAE0|E220    |      ;
    LDA.B #$09                                                 ;81EAE2|A909    |      ;
    STA.W nPlayerInteractionArg1                               ;81EAE4|8D6F09  |00096F;
    JMP.W .return                                              ;81EAE7|4CD4EB  |81EBD4;
 
 
  + SEP #$20                                                   ;81EAEA|E220    |      ;
    LDA.B #$02                                                 ;81EAEC|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81EAEE|8D9A01  |00019A;
    LDX.W #$014C                                               ;81EAF1|A24C01  |      ;
    LDA.B #$00                                                 ;81EAF4|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81EAF6|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81EAF9|225F9383|83935F;
    SEP #$20                                                   ;81EAFD|E220    |      ;
    LDA.B #$0A                                                 ;81EAFF|A90A    |      ;
    STA.W nPlayerInteractionArg1                               ;81EB01|8D6F09  |00096F;
    JMP.W .return                                              ;81EB04|4CD4EB  |81EBD4;
 
 
.case9:
    SEP #$20                                                   ;81EB07|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81EB09|AD9A01  |00019A;
    CMP.B #$02                                                 ;81EB0C|C902    |      ;
    BNE +                                                      ;81EB0E|D003    |81EB13;
    JMP.W .return                                              ;81EB10|4CD4EB  |81EBD4;
 
 
  + REP #$20                                                   ;81EB13|C220    |      ;
    LDA.W #$0008                                               ;81EB15|A90800  |      ;
    JSL.L fAI_DeactivateSlotAndObject                                    ;81EB18|22208084|848020;
    REP #$20                                                   ;81EB1C|C220    |      ;
    %AIExecute($0008, $0000, $007D)
    SEP #$20                                                   ;81EB2B|E220    |      ;
    LDA.B #$00                                                 ;81EB2D|A900    |      ;
    XBA                                                        ;81EB2F|EB      |      ;
    LDA.W $09A0+!RAM_SHIFT                                 ;81EB30|ADA009  |0009A0;
    LDX.W #$0000                                               ;81EB33|A20000  |      ;
    LDY.W #$0022                                               ;81EB36|A02200  |      ;
    JSL.L fAI_SetSlotScript                                    ;81EB39|223F8084|84803F;
    SEP #$20                                                   ;81EB3D|E220    |      ;
    LDA.B #$00                                                 ;81EB3F|A900    |      ;
    XBA                                                        ;81EB41|EB      |      ;
    LDA.W $09A0+!RAM_SHIFT                                 ;81EB42|ADA009  |0009A0;
    SEC                                                        ;81EB45|38      |      ;
    SBC.B #$18                                                 ;81EB46|E918    |      ;
    REP #$20                                                   ;81EB48|C220    |      ;
    JSL.L fGameEngine_GetCowData                               ;81EB4A|22A7C983|83C9A7;
    SEP #$20                                                   ;81EB4E|E220    |      ;
    LDY.W #$0000                                               ;81EB50|A00000  |      ;
    LDA.B #$00                                                 ;81EB53|A900    |      ;
    STA.B [ptrTemp0x72],Y                                      ;81EB55|9772    |000072;
    SEP #$20                                                   ;81EB57|E220    |      ;
    LDA.L nOwnedCows                                           ;81EB59|AF0A1F7F|7F1F0A;
    DEC A                                                      ;81EB5D|3A      |      ;
    STA.L nOwnedCows                                           ;81EB5E|8F0A1F7F|7F1F0A;
    SEP #$20                                                   ;81EB62|E220    |      ;
    LDA.B #$04                                                 ;81EB64|A904    |      ;
    STA.W nPlayerInteractionArg1                               ;81EB66|8D6F09  |00096F;
    STZ.W nPlayerInteractionArg2                               ;81EB69|9C7009  |000970;
    LDA.L strcShedItems.row3                                   ;81EB6C|AF021F7F|7F1F02;
    ORA.B #$20                                                 ;81EB70|0920    |      ;
    STA.L strcShedItems.row3                                   ;81EB72|8F021F7F|7F1F02;
    REP #$20                                                   ;81EB76|C220    |      ;
    LDA.W #$FFCE                                               ;81EB78|A9CEFF  |      ;
    JSL.L fGameEngine_AddHappiness                             ;81EB7B|2282B283|83B282;
    REP #$20                                                   ;81EB7F|C220    |      ;
    %SetFlag(daily4, $2000)
    JMP.W .return                                              ;81EB8C|4CD4EB  |81EBD4;
 
 
.caseA:
    SEP #$20                                                   ;81EB8F|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81EB91|AD9A01  |00019A;
    CMP.B #$02                                                 ;81EB94|C902    |      ;
    BNE +                                                      ;81EB96|D003    |81EB9B;
    JMP.W .return                                              ;81EB98|4CD4EB  |81EBD4;
 
 
  + REP #$20                                                   ;81EB9B|C220    |      ;
    LDA.W #$0008                                               ;81EB9D|A90800  |      ;
    JSL.L fAI_DeactivateSlotAndObject                                    ;81EBA0|22208084|848020;
    REP #$20                                                   ;81EBA4|C220    |      ;
    %AIExecute($0008, $0000, $007D)
    SEP #$20                                                   ;81EBB3|E220    |      ;
    LDA.B #$0B                                                 ;81EBB5|A90B    |      ;
    STA.W nPlayerInteractionArg1                               ;81EBB7|8D6F09  |00096F;
    STZ.W nPlayerInteractionArg2                               ;81EBBA|9C7009  |000970;
    BRA .return                                                ;81EBBD|8015    |81EBD4;
 
 
.caseB:
    SEP #$20                                                   ;81EBBF|E220    |      ;
    INC.W nPlayerInteractionArg2                               ;81EBC1|EE7009  |000970;
    LDA.W nPlayerInteractionArg2                               ;81EBC4|AD7009  |000970;
    CMP.B #$42                                                 ;81EBC7|C942    |      ;
    BEQ +                                                      ;81EBC9|F003    |81EBCE;
    JMP.W .return                                              ;81EBCB|4CD4EB  |81EBD4;
 
 
  + STZ.W nPlayerInteractionArg2                               ;81EBCE|9C7009  |000970;
    JMP.W .failCheck                                           ;81EBD1|4C4DE8  |81E84D;
 
 
.return:
    RTS                                                        ;81EBD4|60      |      ;
 
 
fPlayerInteraction0x44:
    SEP #$20                                                   ;81EBD5|E220    |      ;
    REP #$10                                                   ;81EBD7|C210    |      ;
    LDA.W nPlayerInteractionArg1                               ;81EBD9|AD6F09  |00096F;
    CMP.B #$01                                                 ;81EBDC|C901    |      ;
    BNE +                                                      ;81EBDE|D003    |81EBE3;
    JMP.W .case1                                               ;81EBE0|4C7DEC  |81EC7D;
 
 
  + CMP.B #$02                                                 ;81EBE3|C902    |      ;
    BNE +                                                      ;81EBE5|D003    |81EBEA;
    JMP.W .case2                                               ;81EBE7|4CD3EC  |81ECD3;
 
 
  + CMP.B #$03                                                 ;81EBEA|C903    |      ;
    BNE +                                                      ;81EBEC|D003    |81EBF1;
    JMP.W .case3                                               ;81EBEE|4C20ED  |81ED20;
 
 
  + CMP.B #$04                                                 ;81EBF1|C904    |      ;
    BNE +                                                      ;81EBF3|D003    |81EBF8;
    JMP.W .case4                                               ;81EBF5|4CA5ED  |81EDA5;
 
 
  + CMP.B #$05                                                 ;81EBF8|C905    |      ;
    BNE +                                                      ;81EBFA|D003    |81EBFF;
    JMP.W .case5                                               ;81EBFC|4CD4ED  |81EDD4;
 
 
  + CMP.B #$06                                                 ;81EBFF|C906    |      ;
    BNE +                                                      ;81EC01|D003    |81EC06;
    JMP.W .case6                                               ;81EC03|4C05EE  |81EE05;
 
 
  + CMP.B #$07                                                 ;81EC06|C907    |      ;
    BNE +                                                      ;81EC08|D003    |81EC0D;
    JMP.W .case7                                               ;81EC0A|4C51EE  |81EE51;
 
 
  + CMP.B #$08                                                 ;81EC0D|C908    |      ;
    BNE +                                                      ;81EC0F|D003    |81EC14;
    JMP.W .case8                                               ;81EC11|4C7DEE  |81EE7D;
 
 
  + CMP.B #$09                                                 ;81EC14|C909    |      ;
    BNE +                                                      ;81EC16|D003    |81EC1B;
    JMP.W .case9                                               ;81EC18|4CCAEE  |81EECA;
 
 
  + CMP.B #$0A                                                 ;81EC1B|C90A    |      ;
    BNE +                                                      ;81EC1D|D003    |81EC22;
    JMP.W .caseA                                               ;81EC1F|4C67EF  |81EF67;
 
 
  + CMP.B #$0B                                                 ;81EC22|C90B    |      ;
    BNE .checks                                                ;81EC24|D003    |81EC29;
    JMP.W .caseB                                               ;81EC26|4C97EF  |81EF97;
 
 
.checks:
    SEP #$20                                                   ;81EC29|E220    |      ;
    LDA.L nCurrentSeasonID                                     ;81EC2B|AF191F7F|7F1F19;
    CMP.B #!SEASON_FALL                                                 
    BNE .loop                                                  ;81EC31|D031    |81EC64;
    if !REGION_EUDE
    REP #$20
    else
    REP #$30                                                   ;81EC33|C230    |      ;
    endif
    %CheckFlag(event2, $4000)
    BNE .loop                                                  ;81EC3C|D026    |81EC64;
    REP #$20                                                   ;81EC3E|C220    |      ;
    %SetFlag(event2, $4000)
    REP #$20                                                   ;81EC4B|C220    |      ;
    %AIExecute($0008, $0000, $007C)
    SEP #$20                                                   ;81EC5A|E220    |      ;
    LDA.B #$07                                                 ;81EC5C|A907    |      ;
    STA.W nPlayerInteractionArg1                               ;81EC5E|8D6F09  |00096F;
    JMP.W .return                                              ;81EC61|4CACEF  |81EFAC;
 
 
.loop:
    REP #$20                                                   ;81EC64|C220    |      ;
    %AIExecute($0007, $0000, $0021)
    SEP #$20                                                   ;81EC73|E220    |      ;
    LDA.B #$01                                                 ;81EC75|A901    |      ;
    STA.W nPlayerInteractionArg1                               ;81EC77|8D6F09  |00096F;
    JMP.W .return                                              ;81EC7A|4CACEF  |81EFAC;
 
 
.case1:
    SEP #$20                                                   ;81EC7D|E220    |      ;
    INC.W nPlayerInteractionArg2                               ;81EC7F|EE7009  |000970;
    LDA.W nPlayerInteractionArg2                               ;81EC82|AD7009  |000970;
    CMP.B #$42                                                 ;81EC85|C942    |      ;
    BEQ +                                                      ;81EC87|F003    |81EC8C;
    JMP.W .return                                              ;81EC89|4CACEF  |81EFAC;
 
 
  + REP #$20                                                   ;81EC8C|C220    |      ;
    %CheckFlag(daily4, $1000)
    BNE +                                                      ;81EC95|D01D    |81ECB4;
    LDX.W #$030E                                               ;81EC97|A20E03  |      ;
    SEP #$20                                                   ;81EC9A|E220    |      ;
    LDA.B #$02                                                 ;81EC9C|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81EC9E|8D9A01  |00019A;
    LDA.B #$00                                                 ;81ECA1|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81ECA3|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81ECA6|225F9383|83935F;
    SEP #$20                                                   ;81ECAA|E220    |      ;
    LDA.B #$02                                                 ;81ECAC|A902    |      ;
    STA.W nPlayerInteractionArg1                               ;81ECAE|8D6F09  |00096F;
    JMP.W .return                                              ;81ECB1|4CACEF  |81EFAC;
 
 
  + REP #$30                                                   ;81ECB4|C230    |      ;
    LDX.W #$0487                                               ;81ECB6|A28704  |      ;
    SEP #$20                                                   ;81ECB9|E220    |      ;
    LDA.B #$02                                                 ;81ECBB|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81ECBD|8D9A01  |00019A;
    LDA.B #$00                                                 ;81ECC0|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81ECC2|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81ECC5|225F9383|83935F;
    SEP #$20                                                   ;81ECC9|E220    |      ;
    LDA.B #$05                                                 ;81ECCB|A905    |      ;
    STA.W nPlayerInteractionArg1                               ;81ECCD|8D6F09  |00096F;
    JMP.W .return                                              ;81ECD0|4CACEF  |81EFAC;
 
 
.case2:
    SEP #$20                                                   ;81ECD3|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81ECD5|AD9A01  |00019A;
    CMP.B #$02                                                 ;81ECD8|C902    |      ;
    BNE +                                                      ;81ECDA|D003    |81ECDF;
    JMP.W .return                                              ;81ECDC|4CACEF  |81EFAC;
 
 
  + SEP #$20                                                   ;81ECDF|E220    |      ;
    LDA.W strcDialogDisplay.dialogOptionsAnswer                ;81ECE1|AD8F01  |00018F;
    BNE +                                                      ;81ECE4|D01D    |81ED03;
    SEP #$20                                                   ;81ECE6|E220    |      ;
    LDA.B #$02                                                 ;81ECE8|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81ECEA|8D9A01  |00019A;
    LDX.W #$030F                                               ;81ECED|A20F03  |      ;
    LDA.B #$00                                                 ;81ECF0|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81ECF2|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81ECF5|225F9383|83935F;
    SEP #$20                                                   ;81ECF9|E220    |      ;
    LDA.B #$03                                                 ;81ECFB|A903    |      ;
    STA.W nPlayerInteractionArg1                               ;81ECFD|8D6F09  |00096F;
    JMP.W .return                                              ;81ED00|4CACEF  |81EFAC;
 
 
  + SEP #$20                                                   ;81ED03|E220    |      ;
    LDA.B #$02                                                 ;81ED05|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81ED07|8D9A01  |00019A;
    LDX.W #$0309                                               ;81ED0A|A20903  |      ;
    LDA.B #$00                                                 ;81ED0D|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81ED0F|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81ED12|225F9383|83935F;
    SEP #$20                                                   ;81ED16|E220    |      ;
    LDA.B #$05                                                 ;81ED18|A905    |      ;
    STA.W nPlayerInteractionArg1                               ;81ED1A|8D6F09  |00096F;
    JMP.W .return                                              ;81ED1D|4CACEF  |81EFAC;
 
 
.case3:
    SEP #$20                                                   ;81ED20|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81ED22|AD9A01  |00019A;
    CMP.B #$02                                                 ;81ED25|C902    |      ;
    BNE +                                                      ;81ED27|D003    |81ED2C;
    JMP.W .return                                              ;81ED29|4CACEF  |81EFAC;
 
 
  + REP #$20                                                   ;81ED2C|C220    |      ;
    LDA.L nGameUnk7F1F15                                       ;81ED2E|AF151F7F|7F1F15;
    STA.B ptrTemp0x72                                          ;81ED32|8572    |000072;
    SEP #$20                                                   ;81ED34|E220    |      ;
    LDA.L nGameUnk7F1F15+2                                     ;81ED36|AF171F7F|7F1F17;
    STA.B ptrTemp0x72+2                                        ;81ED3A|8574    |000074;
    JSL.L fGameEngine_AddProfit                                ;81ED3C|22C9B183|83B1C9;
    REP #$20                                                   ;81ED40|C220    |      ;
    LDA.W #$0007                                               ;81ED42|A90700  |      ;
    JSL.L fAI_DeactivateSlotAndObject                                    ;81ED45|22208084|848020;
    REP #$20                                                   ;81ED49|C220    |      ;
    %AIExecute($0007, $0000, $0023)
    SEP #$20                                                   ;81ED58|E220    |      ;
    LDA.B #$00                                                 ;81ED5A|A900    |      ;
    XBA                                                        ;81ED5C|EB      |      ;
    LDA.W $09A1+!RAM_SHIFT                                 ;81ED5D|ADA109  |0009A1;
    LDX.W #$0000                                               ;81ED60|A20000  |      ;
    LDY.W #$0024                                               ;81ED63|A02400  |      ;
    JSL.L fAI_SetSlotScript                                    ;81ED66|223F8084|84803F;
    SEP #$20                                                   ;81ED6A|E220    |      ;
    LDA.B #$00                                                 ;81ED6C|A900    |      ;
    XBA                                                        ;81ED6E|EB      |      ;
    LDA.W $09A1+!RAM_SHIFT                                 ;81ED6F|ADA109  |0009A1;
    SEC                                                        ;81ED72|38      |      ;
    SBC.B #$24                                                 ;81ED73|E924    |      ;
    REP #$20                                                   ;81ED75|C220    |      ;
    JSL.L fGameEngine_GetChickenData                           ;81ED77|2295C983|83C995;
    SEP #$20                                                   ;81ED7B|E220    |      ;
    LDY.W #$0000                                               ;81ED7D|A00000  |      ;
    LDA.B #$00                                                 ;81ED80|A900    |      ;
    STA.B [ptrTemp0x72],Y                                      ;81ED82|9772    |000072;
    SEP #$20                                                   ;81ED84|E220    |      ;
    LDA.L nOwnedChickens                                       ;81ED86|AF0B1F7F|7F1F0B;
    DEC A                                                      ;81ED8A|3A      |      ;
    STA.L nOwnedChickens                                       ;81ED8B|8F0B1F7F|7F1F0B;
    SEP #$20                                                   ;81ED8F|E220    |      ;
    LDA.B #$04                                                 ;81ED91|A904    |      ;
    STA.W nPlayerInteractionArg1                               ;81ED93|8D6F09  |00096F;
    STZ.W nPlayerInteractionArg2                               ;81ED96|9C7009  |000970;
    REP #$20                                                   ;81ED99|C220    |      ;
    LDA.W #$FFEC                                               ;81ED9B|A9ECFF  |      ;
    JSL.L fGameEngine_AddHappiness                             ;81ED9E|2282B283|83B282;
    JMP.W .return                                              ;81EDA2|4CACEF  |81EFAC;
 
 
.case4:
    SEP #$20                                                   ;81EDA5|E220    |      ;
    INC.W nPlayerInteractionArg2                               ;81EDA7|EE7009  |000970;
    LDA.W nPlayerInteractionArg2                               ;81EDAA|AD7009  |000970;
    CMP.B #$42                                                 ;81EDAD|C942    |      ;
    BEQ +                                                      ;81EDAF|F003    |81EDB4;
    JMP.W .return                                              ;81EDB1|4CACEF  |81EFAC;
 
 
  + STZ.W nPlayerInteractionArg2                               ;81EDB4|9C7009  |000970;
    REP #$20                                                   ;81EDB7|C220    |      ;
    %CheckFlag(daily4, $1000)
    BEQ +                                                      ;81EDC0|F003    |81EDC5;
    JMP.W .loop                                                ;81EDC2|4C64EC  |81EC64;
 
 
  + %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    JMP.W .return                                              ;81EDD1|4CACEF  |81EFAC;
 
 
.case5:
    SEP #$20                                                   ;81EDD4|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81EDD6|AD9A01  |00019A;
    CMP.B #$02                                                 ;81EDD9|C902    |      ;
    BNE +                                                      ;81EDDB|D003    |81EDE0;
    JMP.W .return                                              ;81EDDD|4CACEF  |81EFAC;
 
 
  + REP #$20                                                   ;81EDE0|C220    |      ;
    LDA.W #$0007                                               ;81EDE2|A90700  |      ;
    JSL.L fAI_DeactivateSlotAndObject                                    ;81EDE5|22208084|848020;
    REP #$20                                                   ;81EDE9|C220    |      ;
    %AIExecute($0007, $0000, $0023)
    SEP #$20                                                   ;81EDF8|E220    |      ;
    LDA.B #$06                                                 ;81EDFA|A906    |      ;
    STA.W nPlayerInteractionArg1                               ;81EDFC|8D6F09  |00096F;
    STZ.W nPlayerInteractionArg2                               ;81EDFF|9C7009  |000970;
    JMP.W .return                                              ;81EE02|4CACEF  |81EFAC;
 
 
.case6:
    SEP #$20                                                   ;81EE05|E220    |      ;
    INC.W nPlayerInteractionArg2                               ;81EE07|EE7009  |000970;
    LDA.W nPlayerInteractionArg2                               ;81EE0A|AD7009  |000970;
    CMP.B #$42                                                 ;81EE0D|C942    |      ;
    BEQ +                                                      ;81EE0F|F003    |81EE14;
    JMP.W .return                                              ;81EE11|4CACEF  |81EFAC;
 
 
  + %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    REP #$20                                                   ;81EE20|C220    |      ;
    %CheckFlag(daily4, $1000)
    BEQ +                                                      ;81EE29|F003    |81EE2E;
    JMP.W .return                                              ;81EE2B|4CACEF  |81EFAC;
 
 
  + SEP #$20                                                   ;81EE2E|E220    |      ;
    LDA.B #$00                                                 ;81EE30|A900    |      ;
    XBA                                                        ;81EE32|EB      |      ;
    LDA.W $09A1+!RAM_SHIFT                                 ;81EE33|ADA109  |0009A1;
    JSL.L fAI_SetCCPointer                                     ;81EE36|227C8884|84887C;
    SEP #$20                                                   ;81EE3A|E220    |      ;
    REP #$10                                                   ;81EE3C|C210    |      ;
    LDY.W #$0001                                               ;81EE3E|A00100  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;81EE41|B7CC    |0000CC;
    ORA.B #$A8                                                 ;81EE43|09A8    |      ;
    SEP #$20                                                   ;81EE45|E220    |      ;
    REP #$10                                                   ;81EE47|C210    |      ;
    LDY.W #$0001                                               ;81EE49|A00100  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;81EE4C|97CC    |0000CC;
    JMP.W .return                                              ;81EE4E|4CACEF  |81EFAC;
 
 
.case7:
    SEP #$20                                                   ;81EE51|E220    |      ;
    INC.W nPlayerInteractionArg2                               ;81EE53|EE7009  |000970;
    LDA.W nPlayerInteractionArg2                               ;81EE56|AD7009  |000970;
    CMP.B #$42                                                 ;81EE59|C942    |      ;
    BEQ +                                                      ;81EE5B|F003    |81EE60;
    JMP.W .return                                              ;81EE5D|4CACEF  |81EFAC;
 
 
  + LDX.W #$0148                                               ;81EE60|A24801  |      ;
    SEP #$20                                                   ;81EE63|E220    |      ;
    LDA.B #$02                                                 ;81EE65|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81EE67|8D9A01  |00019A;
    LDA.B #$00                                                 ;81EE6A|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81EE6C|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81EE6F|225F9383|83935F;
    SEP #$20                                                   ;81EE73|E220    |      ;
    LDA.B #$08                                                 ;81EE75|A908    |      ;
    STA.W nPlayerInteractionArg1                               ;81EE77|8D6F09  |00096F;
    JMP.W .return                                              ;81EE7A|4CACEF  |81EFAC;
 
 
.case8:
    SEP #$20                                                   ;81EE7D|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81EE7F|AD9A01  |00019A;
    CMP.B #$02                                                 ;81EE82|C902    |      ;
    BNE +                                                      ;81EE84|D003    |81EE89;
    JMP.W .return                                              ;81EE86|4CACEF  |81EFAC;
 
 
  + SEP #$20                                                   ;81EE89|E220    |      ;
    LDA.W strcDialogDisplay.dialogOptionsAnswer                ;81EE8B|AD8F01  |00018F;
    BNE +                                                      ;81EE8E|D01D    |81EEAD;
    SEP #$20                                                   ;81EE90|E220    |      ;
    LDA.B #$02                                                 ;81EE92|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81EE94|8D9A01  |00019A;
    LDX.W #$014A                                               ;81EE97|A24A01  |      ;
    LDA.B #$00                                                 ;81EE9A|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81EE9C|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81EE9F|225F9383|83935F;
    SEP #$20                                                   ;81EEA3|E220    |      ;
    LDA.B #$09                                                 ;81EEA5|A909    |      ;
    STA.W nPlayerInteractionArg1                               ;81EEA7|8D6F09  |00096F;
    JMP.W .return                                              ;81EEAA|4CACEF  |81EFAC;
 
 
  + SEP #$20                                                   ;81EEAD|E220    |      ;
    LDA.B #$02                                                 ;81EEAF|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81EEB1|8D9A01  |00019A;
    LDX.W #$014C                                               ;81EEB4|A24C01  |      ;
    LDA.B #$00                                                 ;81EEB7|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81EEB9|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81EEBC|225F9383|83935F;
    SEP #$20                                                   ;81EEC0|E220    |      ;
    LDA.B #$0A                                                 ;81EEC2|A90A    |      ;
    STA.W nPlayerInteractionArg1                               ;81EEC4|8D6F09  |00096F;
    JMP.W .return                                              ;81EEC7|4CACEF  |81EFAC;
 
 
.case9:
    SEP #$20                                                   ;81EECA|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81EECC|AD9A01  |00019A;
    CMP.B #$02                                                 ;81EECF|C902    |      ;
    BNE +                                                      ;81EED1|D003    |81EED6;
    JMP.W .return                                              ;81EED3|4CACEF  |81EFAC;
 
 
  + REP #$20                                                   ;81EED6|C220    |      ;
    LDA.W #$0008                                               ;81EED8|A90800  |      ;
    JSL.L fAI_DeactivateSlotAndObject                                    ;81EEDB|22208084|848020;
    REP #$20                                                   ;81EEDF|C220    |      ;
    %AIExecute($0008, $0000, $007D)
    SEP #$20                                                   ;81EEEE|E220    |      ;
    LDA.B #$00                                                 ;81EEF0|A900    |      ;
    XBA                                                        ;81EEF2|EB      |      ;
    LDA.W $09A1+!RAM_SHIFT                                 ;81EEF3|ADA109  |0009A1;
    LDX.W #$0000                                               ;81EEF6|A20000  |      ;
    LDY.W #$0024                                               ;81EEF9|A02400  |      ;
    JSL.L fAI_SetSlotScript                                    ;81EEFC|223F8084|84803F;
    SEP #$20                                                   ;81EF00|E220    |      ;
    LDA.B #$00                                                 ;81EF02|A900    |      ;
    XBA                                                        ;81EF04|EB      |      ;
    LDA.W $09A1+!RAM_SHIFT                                 ;81EF05|ADA109  |0009A1;
    SEC                                                        ;81EF08|38      |      ;
    SBC.B #$24                                                 ;81EF09|E924    |      ;
    REP #$20                                                   ;81EF0B|C220    |      ;
    JSL.L fGameEngine_GetChickenData                           ;81EF0D|2295C983|83C995;
    SEP #$20                                                   ;81EF11|E220    |      ;
    LDY.W #$0000                                               ;81EF13|A00000  |      ;
    LDA.B #$00                                                 ;81EF16|A900    |      ;
    STA.B [ptrTemp0x72],Y                                      ;81EF18|9772    |000072;
    SEP #$20                                                   ;81EF1A|E220    |      ;
    LDA.L nOwnedChickens                                       ;81EF1C|AF0B1F7F|7F1F0B;
    DEC A                                                      ;81EF20|3A      |      ;
    STA.L nOwnedChickens                                       ;81EF21|8F0B1F7F|7F1F0B;
    SEP #$20                                                   ;81EF25|E220    |      ;
    LDA.B #$04                                                 ;81EF27|A904    |      ;
    STA.W nPlayerInteractionArg1                               ;81EF29|8D6F09  |00096F;
    STZ.W nPlayerInteractionArg2                               ;81EF2C|9C7009  |000970;
    REP #$30                                                   ;81EF2F|C230    |      ;
    LDY.W #$0004                                               ;81EF31|A00400  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;81EF34|B772    |000072;
    STA.W nTileInFrontOfPlayerX                                ;81EF36|8D8509  |000985;
    LDY.W #$0006                                               ;81EF39|A00600  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;81EF3C|B772    |000072;
    STA.W nTileInFrontOfPlayerY                                ;81EF3E|8D8709  |000987;
    LDA.W #$0010                                               ;81EF41|A91000  |      ;
    LDX.W #$0000                                               ;81EF44|A20000  |      ;
    LDY.W #$001F                                               ;81EF47|A01F00  |      ;
    JSL.L fAI_StartSlotScriptAtFrontTile                                    ;81EF4A|22F88084|8480F8;
    REP #$30                                                   ;81EF4E|C230    |      ;
    LDA.W #$FFEC                                               ;81EF50|A9ECFF  |      ;
    JSL.L fGameEngine_AddHappiness                             ;81EF53|2282B283|83B282;
    REP #$20                                                   ;81EF57|C220    |      ;
    %SetFlag(daily4, $1000)
    JMP.W .return                                              ;81EF64|4CACEF  |81EFAC;
 
 
.caseA:
    SEP #$20                                                   ;81EF67|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81EF69|AD9A01  |00019A;
    CMP.B #$02                                                 ;81EF6C|C902    |      ;
    BNE +                                                      ;81EF6E|D003    |81EF73;
    JMP.W .return                                              ;81EF70|4CACEF  |81EFAC;
 
 
  + REP #$20                                                   ;81EF73|C220    |      ;
    LDA.W #$0008                                               ;81EF75|A90800  |      ;
    JSL.L fAI_DeactivateSlotAndObject                                    ;81EF78|22208084|848020;
    REP #$20                                                   ;81EF7C|C220    |      ;
    %AIExecute($0008, $0000, $007D)
    SEP #$20                                                   ;81EF8B|E220    |      ;
    LDA.B #$0B                                                 ;81EF8D|A90B    |      ;
    STA.W nPlayerInteractionArg1                               ;81EF8F|8D6F09  |00096F;
    STZ.W nPlayerInteractionArg2                               ;81EF92|9C7009  |000970;
    BRA .return                                                ;81EF95|8015    |81EFAC;
 
 
.caseB:
    SEP #$20                                                   ;81EF97|E220    |      ;
    INC.W nPlayerInteractionArg2                               ;81EF99|EE7009  |000970;
    LDA.W nPlayerInteractionArg2                               ;81EF9C|AD7009  |000970;
    CMP.B #$42                                                 ;81EF9F|C942    |      ;
    BEQ +                                                      ;81EFA1|F003    |81EFA6;
    JMP.W .return                                              ;81EFA3|4CACEF  |81EFAC;
 
 
  + STZ.W nPlayerInteractionArg2                               ;81EFA6|9C7009  |000970;
    JMP.W .loop                                                ;81EFA9|4C64EC  |81EC64;
 
 
.return:
    RTS                                                        ;81EFAC|60      |      ;
 
 
fPlayerInteraction0x45:
    SEP #$20                                                   ;81EFAD|E220    |      ;
    REP #$10                                                   ;81EFAF|C210    |      ;
    LDA.W nPlayerInteractionArg1                               ;81EFB1|AD6F09  |00096F;
    CMP.B #$01                                                 ;81EFB4|C901    |      ;
    BEQ .case1                                                 ;81EFB6|F029    |81EFE1;
    CMP.B #$02                                                 ;81EFB8|C902    |      ;
    BEQ .case2                                                 ;81EFBA|F057    |81F013;
    CMP.B #$03                                                 ;81EFBC|C903    |      ;
    BEQ .case3                                                 ;81EFBE|F06F    |81F02F;
    CMP.B #$04                                                 ;81EFC0|C904    |      ;
    BNE .checks                                                ;81EFC2|D003    |81EFC7;
    JMP.W .case4                                               ;81EFC4|4C54F0  |81F054;
 
 
.checks:
    SEP #$20                                                   ;81EFC7|E220    |      ;
    INC.W nPlayerInteractionArg2                               ;81EFC9|EE7009  |000970;
    LDA.W nPlayerInteractionArg2                               ;81EFCC|AD7009  |000970;
    CMP.B #$08                                                 ;81EFCF|C908    |      ;
    BEQ +                                                      ;81EFD1|F003    |81EFD6;
    JMP.W .return                                              ;81EFD3|4C60F0  |81F060;
 
 
  + LDA.B #$01                                                 ;81EFD6|A901    |      ;
    STA.W nPlayerInteractionArg1                               ;81EFD8|8D6F09  |00096F;
    STZ.W nPlayerInteractionArg2                               ;81EFDB|9C7009  |000970;
    JMP.W .return                                              ;81EFDE|4C60F0  |81F060;
 
 
.case1:
    %SetPlayerFlag(!PFLAGS_INTRANSITION)
    %SetPlayerAction(!PACTION_WALK)
    %SetPlayerDirection(!PDIR_LEFT)
    %SetObjectDirection(!PDIR_LEFT)
    SEP #$20                                                   ;81F000|E220    |      ;
    INC.W nPlayerInteractionArg2                               ;81F002|EE7009  |000970;
    LDA.W nPlayerInteractionArg2                               ;81F005|AD7009  |000970;
    CMP.B #$20                                                 ;81F008|C920    |      ;
    BNE .return                                                ;81F00A|D054    |81F060;
    LDA.B #$02                                                 ;81F00C|A902    |      ;
    STA.W nPlayerInteractionArg1                               ;81F00E|8D6F09  |00096F;
    BRA .return                                                ;81F011|804D    |81F060;
 
 
.case2:
    SEP #$20                                                   ;81F013|E220    |      ;
    LDX.W #$0317                                               ;81F015|A21703  |      ;
    LDA.B #$02                                                 ;81F018|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81F01A|8D9A01  |00019A;
    LDA.B #$00                                                 ;81F01D|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81F01F|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81F022|225F9383|83935F;
    SEP #$20                                                   ;81F026|E220    |      ;
    LDA.B #$03                                                 ;81F028|A903    |      ;
    STA.W nPlayerInteractionArg1                               ;81F02A|8D6F09  |00096F;
    BRA .return                                                ;81F02D|8031    |81F060;
 
 
.case3:
    SEP #$20                                                   ;81F02F|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81F031|AD9A01  |00019A;
    CMP.B #$02                                                 ;81F034|C902    |      ;
    BNE +                                                      ;81F036|D003    |81F03B;
    JMP.W .return                                              ;81F038|4C60F0  |81F060;
 
 
  + SEP #$20                                                   ;81F03B|E220    |      ;
    LDA.B #$04                                                 ;81F03D|A904    |      ;
    STA.W nPlayerInteractionArg1                               ;81F03F|8D6F09  |00096F;
    LDA.B #$02                                                 ;81F042|A902    |      ;
    STA.W strcMenuData.nameDestinationIdx                      ;81F044|8D9F09  |00099F;
    REP #$20                                                   ;81F047|C220    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;81F049|AD9601  |000196;
    ORA.W #$2000                                               ;81F04C|090020  |      ;
    STA.W strcDialogDisplay.mapFlags                           ;81F04F|8D9601  |000196;
    BRA .return                                                ;81F052|800C    |81F060;
 
 
.case4:
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
 
.return:
    RTS                                                        ;81F060|60      |      ;
 
 
fPlayerInteraction0x46:
    SEP #$20                                                   ;81F061|E220    |      ;
    REP #$10                                                   ;81F063|C210    |      ;
    LDA.W nPlayerInteractionArg1                               ;81F065|AD6F09  |00096F;
    CMP.B #$01                                                 ;81F068|C901    |      ;
    BEQ .case1                                                 ;81F06A|F027    |81F093;
    CMP.B #$02                                                 ;81F06C|C902    |      ;
    BNE +                                                      ;81F06E|D003    |81F073;
    JMP.W .case2                                               ;81F070|4CD2F0  |81F0D2;
 
 
  + CMP.B #$03                                                 ;81F073|C903    |      ;
    BNE +                                                      ;81F075|D003    |81F07A;
    JMP.W .case3                                               ;81F077|4C03F1  |81F103;
 
 
  + REP #$20                                                   ;81F07A|C220    |      ;
    %AIExecute($0006, $0000, $0026)
    SEP #$20                                                   ;81F089|E220    |      ;
    LDA.B #$01                                                 ;81F08B|A901    |      ;
    STA.W nPlayerInteractionArg1                               ;81F08D|8D6F09  |00096F;
    JMP.W .return                                              ;81F090|4C20F1  |81F120;
 
 
.case1:
    SEP #$20                                                   ;81F093|E220    |      ;
    INC.W nPlayerInteractionArg2                               ;81F095|EE7009  |000970;
    LDA.W nPlayerInteractionArg2                               ;81F098|AD7009  |000970;
    CMP.B #$42                                                 ;81F09B|C942    |      ;
    BEQ +                                                      ;81F09D|F003    |81F0A2;
    JMP.W .return                                              ;81F09F|4C20F1  |81F120;
 
 
  + SEP #$20                                                   ;81F0A2|E220    |      ;
    LDA.B #$02                                                 ;81F0A4|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81F0A6|8D9A01  |00019A;
    LDX.W #$031A                                               ;81F0A9|A21A03  |      ;
    REP #$20                                                   ;81F0AC|C220    |      ;
    LDA.L nShippingProfit                                      ;81F0AE|AF071F7F|7F1F07;
    BNE +                                                      ;81F0B2|D00B    |81F0BF;
    SEP #$20                                                   ;81F0B4|E220    |      ;
    LDA.L nShippingProfit+2                                    ;81F0B6|AF091F7F|7F1F09;
    BNE +                                                      ;81F0BA|D003    |81F0BF;
    LDX.W #$031B                                               ;81F0BC|A21B03  |      ;
 
  + LDA.B #$00                                                 ;81F0BF|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81F0C1|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81F0C4|225F9383|83935F;
    SEP #$20                                                   ;81F0C8|E220    |      ;
    LDA.B #$02                                                 ;81F0CA|A902    |      ;
    STA.W nPlayerInteractionArg1                               ;81F0CC|8D6F09  |00096F;
    JMP.W .return                                              ;81F0CF|4C20F1  |81F120;
 
 
.case2:
    SEP #$20                                                   ;81F0D2|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81F0D4|AD9A01  |00019A;
    CMP.B #$02                                                 ;81F0D7|C902    |      ;
    BNE +                                                      ;81F0D9|D003    |81F0DE;
    JMP.W .return                                              ;81F0DB|4C20F1  |81F120;
 
 
  + REP #$20                                                   ;81F0DE|C220    |      ;
    LDA.W #$0006                                               ;81F0E0|A90600  |      ;
    JSL.L fAI_DeactivateSlotAndObject                                    ;81F0E3|22208084|848020;
    REP #$20                                                   ;81F0E7|C220    |      ;
    %AIExecute($0006, $0000, $0027)
    SEP #$20                                                   ;81F0F6|E220    |      ;
    LDA.B #$03                                                 ;81F0F8|A903    |      ;
    STA.W nPlayerInteractionArg1                               ;81F0FA|8D6F09  |00096F;
    STZ.W nPlayerInteractionArg2                               ;81F0FD|9C7009  |000970;
    JMP.W .return                                              ;81F100|4C20F1  |81F120;
 
 
.case3:
    SEP #$20                                                   ;81F103|E220    |      ;
    INC.W nPlayerInteractionArg2                               ;81F105|EE7009  |000970;
    LDA.W nPlayerInteractionArg2                               ;81F108|AD7009  |000970;
    CMP.B #$42                                                 ;81F10B|C942    |      ;
    BEQ +                                                      ;81F10D|F003    |81F112;
    JMP.W .return                                              ;81F10F|4C20F1  |81F120;
 
 
  + %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    BRA .return                                                ;81F11E|8000    |81F120;
 
 
.return:
    RTS                                                        ;81F120|60      |      ;
 
 
fPlayerInteraction0x47:
    SEP #$20                                                   ;81F121|E220    |      ;
    REP #$10                                                   ;81F123|C210    |      ;
    LDA.W nPlayerInteractionArg1                               ;81F125|AD6F09  |00096F;
    CMP.B #$01                                                 ;81F128|C901    |      ;
    BNE +                                                      ;81F12A|D003    |81F12F;
    JMP.W .case1                                               ;81F12C|4CCEF1  |81F1CE;
 
 
  + CMP.B #$02                                                 ;81F12F|C902    |      ;
    BNE +                                                      ;81F131|D003    |81F136;
    JMP.W .case2                                               ;81F133|4CF3F1  |81F1F3;
 
 
  + CMP.B #$03                                                 ;81F136|C903    |      ;
    BNE +                                                      ;81F138|D003    |81F13D;
    JMP.W .case3                                               ;81F13A|4C11F2  |81F211;
 
 
  + SEP #$20                                                   ;81F13D|E220    |      ;
    INC.W nPlayerInteractionArg2                               ;81F13F|EE7009  |000970;
    LDA.W nPlayerInteractionArg2                               ;81F142|AD7009  |000970;
    CMP.B #$20                                                 ;81F145|C920    |      ;
    BEQ .checks                                                ;81F147|F003    |81F14C;
    JMP.W .justReturn                                          ;81F149|4CD9F2  |81F2D9;
 
 
.checks:
    SEP #$20                                                   ;81F14C|E220    |      ;
    LDA.L nCurrentYearID                                       ;81F14E|AF181F7F|7F1F18;
    BNE .year1andFall                                          ;81F152|D015    |81F169;
    LDA.L nCurrentSeasonID                                     ;81F154|AF191F7F|7F1F19;
    CMP.B #!SEASON_FALL                                                 
    BCS .year1andFall                                          ;81F15A|B00D    |81F169;
    REP #$20                                                   ;81F15C|C220    |      ;
    %SetFlag(event7, $0004)
 
.year1andFall:
    SEP #$20                                                   ;81F169|E220    |      ; If we expand house in year 1 before Fall we get clock
    STZ.W nPlayerInteractionArg2                               ;81F16B|9C7009  |000970;
    REP #$20                                                   ;81F16E|C220    |      ;
    LDA.L nReqWoodForExpansion                                 ;81F170|AF0E1F7F|7F1F0E;
    CMP.W #$00FA                                               ;81F174|C9FA00  |      ;
    BEQ .firstUpgrade                                          ;81F177|F010    |81F189;
    REP #$20                                                   ;81F179|C220    |      ;
    LDA.L nStoredWood                                          ;81F17B|AF0C1F7F|7F1F0C;
    CMP.W #$01F4                                               ;81F17F|C9F401  |      ;
    BCC .upgrade                                               ;81F182|902D    |81F1B1;
    LDX.W #$013B                                               ;81F184|A23B01  |      ;
    BRA .notEnoughWood                                         ;81F187|800E    |81F197;
 
 
.firstUpgrade:
    REP #$20                                                   ;81F189|C220    |      ;
    LDA.L nStoredWood                                          ;81F18B|AF0C1F7F|7F1F0C;
    CMP.W #$00FA                                               ;81F18F|C9FA00  |      ;
    BCC .upgrade                                               ;81F192|901D    |81F1B1;
    LDX.W #$0134                                               ;81F194|A23401  |      ;
 
.notEnoughWood:
    SEP #$20                                                   ;81F197|E220    |      ;
    LDA.B #$02                                                 ;81F199|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81F19B|8D9A01  |00019A;
    LDA.B #$00                                                 ;81F19E|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81F1A0|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81F1A3|225F9383|83935F;
    SEP #$20                                                   ;81F1A7|E220    |      ;
    LDA.B #$03                                                 ;81F1A9|A903    |      ;
    STA.W nPlayerInteractionArg1                               ;81F1AB|8D6F09  |00096F;
    JMP.W .justReturn                                          ;81F1AE|4CD9F2  |81F2D9;
 
 
.upgrade:
    SEP #$20                                                   ;81F1B1|E220    |      ;
    LDA.B #$02                                                 ;81F1B3|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81F1B5|8D9A01  |00019A;
    LDX.W #$0137                                               ;81F1B8|A23701  |      ;
    LDA.B #$00                                                 ;81F1BB|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81F1BD|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81F1C0|225F9383|83935F;
    SEP #$20                                                   ;81F1C4|E220    |      ;
    LDA.B #$01                                                 ;81F1C6|A901    |      ;
    STA.W nPlayerInteractionArg1                               ;81F1C8|8D6F09  |00096F;
    JMP.W .justReturn                                          ;81F1CB|4CD9F2  |81F2D9;
 
 
.case1:
    SEP #$20                                                   ;81F1CE|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81F1D0|AD9A01  |00019A;
    CMP.B #$02                                                 ;81F1D3|C902    |      ;
    BNE +                                                      ;81F1D5|D003    |81F1DA;
    JMP.W .justReturn                                          ;81F1D7|4CD9F2  |81F2D9;
 
 
  + REP #$20                                                   ;81F1DA|C220    |      ;
    LDA.W #$0009                                               ;81F1DC|A90900  |      ;
    LDX.W #$0000                                               ;81F1DF|A20000  |      ;
    LDY.W #$002D                                               ;81F1E2|A02D00  |      ;
    JSL.L fAI_SetSlotScript                                    ;81F1E5|223F8084|84803F;
    SEP #$20                                                   ;81F1E9|E220    |      ;
    LDA.B #$02                                                 ;81F1EB|A902    |      ;
    STA.W nPlayerInteractionArg1                               ;81F1ED|8D6F09  |00096F;
    JMP.W .justReturn                                          ;81F1F0|4CD9F2  |81F2D9;
 
 
.case2:
    SEP #$20                                                   ;81F1F3|E220    |      ;
    INC.W nPlayerInteractionArg2                               ;81F1F5|EE7009  |000970;
    LDA.W nPlayerInteractionArg2                               ;81F1F8|AD7009  |000970;
    CMP.B #$C6                                                 ;81F1FB|C9C6    |      ;
    BEQ +                                                      ;81F1FD|F003    |81F202;
    JMP.W .justReturn                                          ;81F1FF|4CD9F2  |81F2D9;
 
 
  + %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    JMP.W .justReturn                                          ;81F20E|4CD9F2  |81F2D9;
 
 
.case3:
    SEP #$20                                                   ;81F211|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81F213|AD9A01  |00019A;
    CMP.B #$02                                                 ;81F216|C902    |      ;
    BNE +                                                      ;81F218|D003    |81F21D;
    JMP.W .justReturn                                          ;81F21A|4CD9F2  |81F2D9;
 
 
  + SEP #$20                                                   ;81F21D|E220    |      ;
    LDA.W strcDialogDisplay.dialogOptionsAnswer                ;81F21F|AD8F01  |00018F;
    BEQ +                                                      ;81F222|F003    |81F227;
    JMP.W .return                                              ;81F224|4CBDF2  |81F2BD;
 
 
  + REP #$30                                                   ;81F227|C230    |      ;
    LDA.L nReqWoodForExpansion                                 ;81F229|AF0E1F7F|7F1F0E;
    CMP.W #$00FA                                               ;81F22D|C9FA00  |      ;
    BEQ .label1                                                ;81F230|F01A    |81F24C;
    REP #$20                                                   ;81F232|C220    |      ;
    LDA.W #$FC18                                               ;81F234|A918FC  |      ;
    STA.B ptrTemp0x72                                          ;81F237|8572    |000072;
    SEP #$20                                                   ;81F239|E220    |      ;
    LDA.B #$FF                                                 ;81F23B|A9FF    |      ;
    STA.B ptrTemp0x72+2                                        ;81F23D|8574    |000074;
    JSL.L fGameEngine_AddProfit                                ;81F23F|22C9B183|83B1C9;
    REP #$20                                                   ;81F243|C220    |      ;
    CMP.W #$0000                                               ;81F245|C90000  |      ;
    BNE .label3                                                ;81F248|D057    |81F2A1;
    BRA .label2                                                ;81F24A|8018    |81F264;
 
 
.label1:
    REP #$20                                                   ;81F24C|C220    |      ;
    LDA.W #$FE0C                                               ;81F24E|A90CFE  |      ;
    STA.B ptrTemp0x72                                          ;81F251|8572    |000072;
    SEP #$20                                                   ;81F253|E220    |      ;
    LDA.B #$FF                                                 ;81F255|A9FF    |      ;
    STA.B ptrTemp0x72+2                                        ;81F257|8574    |000074;
    JSL.L fGameEngine_AddProfit                                ;81F259|22C9B183|83B1C9;
    REP #$20                                                   ;81F25D|C220    |      ;
    CMP.W #$0000                                               ;81F25F|C90000  |      ;
    BNE .label3                                                ;81F262|D03D    |81F2A1;
 
.label2:
    REP #$30                                                   ;81F264|C230    |      ;
    LDA.L nReqWoodForExpansion                                 ;81F266|AF0E1F7F|7F1F0E;
    EOR.W #$FFFF                                               ;81F26A|49FFFF  |      ;
    INC A                                                      ;81F26D|1A      |      ;
    JSL.L fGameEngine_AddWood                                  ;81F26E|2224B283|83B224;
    SEP #$20                                                   ;81F272|E220    |      ;
    LDA.B #$02                                                 ;81F274|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81F276|8D9A01  |00019A;
    LDX.W #$0135                                               ;81F279|A23501  |      ;
    LDA.B #$00                                                 ;81F27C|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81F27E|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81F281|225F9383|83935F;
    SEP #$20                                                   ;81F285|E220    |      ;
    LDA.B #$01                                                 ;81F287|A901    |      ;
    STA.W nPlayerInteractionArg1                               ;81F289|8D6F09  |00096F;
    LDA.B #$00                                                 ;81F28C|A900    |      ;
    STA.L nConstructionDayCounter                              ;81F28E|8F351F7F|7F1F35;
    REP #$20                                                   ;81F292|C220    |      ;
    %SetFlag(event2, $0080)
    BRA .justReturn                                            ;81F29F|8038    |81F2D9;
 
 
.label3:
    SEP #$20                                                   ;81F2A1|E220    |      ;
    LDA.B #$02                                                 ;81F2A3|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81F2A5|8D9A01  |00019A;
    LDX.W #$0304                                               ;81F2A8|A20403  |      ;
    LDA.B #$00                                                 ;81F2AB|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81F2AD|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81F2B0|225F9383|83935F;
    SEP #$20                                                   ;81F2B4|E220    |      ;
    LDA.B #$01                                                 ;81F2B6|A901    |      ;
    STA.W nPlayerInteractionArg1                               ;81F2B8|8D6F09  |00096F;
    BRA .justReturn                                            ;81F2BB|801C    |81F2D9;
 
 
.return:
    SEP #$20                                                   ;81F2BD|E220    |      ;
    LDA.B #$02                                                 ;81F2BF|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81F2C1|8D9A01  |00019A;
    LDX.W #$0136                                               ;81F2C4|A23601  |      ;
    LDA.B #$00                                                 ;81F2C7|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81F2C9|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81F2CC|225F9383|83935F;
    SEP #$20                                                   ;81F2D0|E220    |      ;
    LDA.B #$01                                                 ;81F2D2|A901    |      ;
    STA.W nPlayerInteractionArg1                               ;81F2D4|8D6F09  |00096F;
    BRA .justReturn                                            ;81F2D7|8000    |81F2D9;
 
 
.justReturn:
    RTS                                                        ;81F2D9|60      |      ;
 
 
fPlayerInteraction0x48:
    SEP #$20                                                   ;81F2DA|E220    |      ;
    REP #$10                                                   ;81F2DC|C210    |      ;
    LDA.W nPlayerInteractionArg1                               ;81F2DE|AD6F09  |00096F;
    CMP.B #$01                                                 ;81F2E1|C901    |      ;
    BEQ .case1                                                 ;81F2E3|F063    |81F348;
    CMP.B #$02                                                 ;81F2E5|C902    |      ;
    BNE +                                                      ;81F2E7|D003    |81F2EC;
    JMP.W .case2                                               ;81F2E9|4CBBF3  |81F3BB;
 
 
  + CMP.B #$03                                                 ;81F2EC|C903    |      ;
    BNE +                                                      ;81F2EE|D003    |81F2F3;
    JMP.W .case3                                               ;81F2F0|4CD9F3  |81F3D9;
 
 
  + SEP #$20                                                   ;81F2F3|E220    |      ;
    INC.W nPlayerInteractionArg2                               ;81F2F5|EE7009  |000970;
    LDA.W nPlayerInteractionArg2                               ;81F2F8|AD7009  |000970;
    CMP.B #$20                                                 ;81F2FB|C920    |      ;
    BEQ +                                                      ;81F2FD|F003    |81F302;
    JMP.W .return                                              ;81F2FF|4C0DF4  |81F40D;
 
 
  + STZ.W nPlayerInteractionArg2                               ;81F302|9C7009  |000970;
    REP #$20                                                   ;81F305|C220    |      ;
    %CheckFlag(event1, $0080)
    BNE .label1                                                ;81F30E|D010    |81F320;
    REP #$30                                                   ;81F310|C230    |      ;
    LDA.W #$0032                                               ;81F312|A93200  |      ;
    JSL.L fGameEngine_AddHappiness                             ;81F315|2282B283|83B282;
    REP #$30                                                   ;81F319|C230    |      ;
    LDX.W #$013D                                               ;81F31B|A23D01  |      ;
    BRA .label2                                                ;81F31E|800E    |81F32E;
 
 
.label1:
    REP #$30                                                   ;81F320|C230    |      ;
    LDA.W #$0064                                               ;81F322|A96400  |      ;
    JSL.L fGameEngine_AddHappiness                             ;81F325|2282B283|83B282;
    REP #$30                                                   ;81F329|C230    |      ;
    LDX.W #$0140                                               ;81F32B|A24001  |      ;
 
.label2:
    SEP #$20                                                   ;81F32E|E220    |      ;
    LDA.B #$02                                                 ;81F330|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81F332|8D9A01  |00019A;
    LDA.B #$00                                                 ;81F335|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81F337|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81F33A|225F9383|83935F;
    SEP #$20                                                   ;81F33E|E220    |      ;
    LDA.B #$01                                                 ;81F340|A901    |      ;
    STA.W nPlayerInteractionArg1                               ;81F342|8D6F09  |00096F;
    JMP.W .return                                              ;81F345|4C0DF4  |81F40D;
 
 
.case1:
    SEP #$20                                                   ;81F348|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81F34A|AD9A01  |00019A;
    CMP.B #$02                                                 ;81F34D|C902    |      ;
    BNE .obtainClock                                           ;81F34F|D003    |81F354;
    JMP.W .return                                              ;81F351|4C0DF4  |81F40D;
 
 
.obtainClock:
    REP #$20                                                   ;81F354|C220    |      ;
    %CheckFlag(event1, $0080)
    BNE +                                                      ;81F35D|D034    |81F393;
    SEP #$20                                                   ;81F35F|E220    |      ;
    REP #$20                                                   ;81F361|C220    |      ;
    %CheckFlag(event7, $0004)
    BEQ +                                                      ;81F36A|F027    |81F393;
    %SetFlag(event6, $4000)
    SEP #$20                                                   ;81F377|E220    |      ;
    LDA.B #$02                                                 ;81F379|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81F37B|8D9A01  |00019A;
    LDX.W #$025C                                               ;81F37E|A25C02  |      ;
    LDA.B #$00                                                 ;81F381|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81F383|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81F386|225F9383|83935F;
    SEP #$20                                                   ;81F38A|E220    |      ;
    LDA.B #$03                                                 ;81F38C|A903    |      ;
    STA.W nPlayerInteractionArg1                               ;81F38E|8D6F09  |00096F;
    BRA .return                                                ;81F391|807A    |81F40D;
 
 
  + REP #$20                                                   ;81F393|C220    |      ;
    LDA.W #$0009                                               ;81F395|A90900  |      ;
    LDX.W #$0000                                               ;81F398|A20000  |      ;
    LDY.W #$0038                                               ;81F39B|A03800  |      ;
    JSL.L fAI_SetSlotScript                                    ;81F39E|223F8084|84803F;
    REP #$20                                                   ;81F3A2|C220    |      ;
    LDA.W #$000A                                               ;81F3A4|A90A00  |      ;
    LDX.W #$0000                                               ;81F3A7|A20000  |      ;
    LDY.W #$0039                                               ;81F3AA|A03900  |      ;
    JSL.L fAI_SetSlotScript                                    ;81F3AD|223F8084|84803F;
    SEP #$20                                                   ;81F3B1|E220    |      ;
    LDA.B #$02                                                 ;81F3B3|A902    |      ;
    STA.W nPlayerInteractionArg1                               ;81F3B5|8D6F09  |00096F;
    JMP.W .return                                              ;81F3B8|4C0DF4  |81F40D;
 
 
.case2:
    SEP #$20                                                   ;81F3BB|E220    |      ;
    INC.W nPlayerInteractionArg2                               ;81F3BD|EE7009  |000970;
    LDA.W nPlayerInteractionArg2                               ;81F3C0|AD7009  |000970;
    CMP.B #$C6                                                 ;81F3C3|C9C6    |      ;
    BEQ +                                                      ;81F3C5|F003    |81F3CA;
    JMP.W .return                                              ;81F3C7|4C0DF4  |81F40D;
 
 
  + %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    JMP.W .return                                              ;81F3D6|4C0DF4  |81F40D;
 
 
.case3:
    SEP #$20                                                   ;81F3D9|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81F3DB|AD9A01  |00019A;
    CMP.B #$02                                                 ;81F3DE|C902    |      ;
    BNE +                                                      ;81F3E0|D003    |81F3E5;
    JMP.W .return                                              ;81F3E2|4C0DF4  |81F40D;
 
 
  + REP #$20                                                   ;81F3E5|C220    |      ;
    LDA.W #$0009                                               ;81F3E7|A90900  |      ;
    LDX.W #$0000                                               ;81F3EA|A20000  |      ;
    LDY.W #$0038                                               ;81F3ED|A03800  |      ;
    JSL.L fAI_SetSlotScript                                    ;81F3F0|223F8084|84803F;
    REP #$20                                                   ;81F3F4|C220    |      ;
    LDA.W #$000A                                               ;81F3F6|A90A00  |      ;
    LDX.W #$0000                                               ;81F3F9|A20000  |      ;
    LDY.W #$0039                                               ;81F3FC|A03900  |      ;
    JSL.L fAI_SetSlotScript                                    ;81F3FF|223F8084|84803F;
    SEP #$20                                                   ;81F403|E220    |      ;
    LDA.B #$02                                                 ;81F405|A902    |      ;
    STA.W nPlayerInteractionArg1                               ;81F407|8D6F09  |00096F;
    JMP.W .return                                              ;81F40A|4C0DF4  |81F40D;
 
 
.return:
    RTS                                                        ;81F40D|60      |      ;
 
 
fPlayerInteraction0x49:
    SEP #$20                                                   ;81F40E|E220    |      ;
    REP #$10                                                   ;81F410|C210    |      ;
    LDA.W nPlayerInteractionArg1                               ;81F412|AD6F09  |00096F;
    CMP.B #$01                                                 ;81F415|C901    |      ;
    BEQ .case1                                                 ;81F417|F033    |81F44C;
    CMP.B #$02                                                 ;81F419|C902    |      ;
    BEQ .case2                                                 ;81F41B|F054    |81F471;
    SEP #$20                                                   ;81F41D|E220    |      ;
    INC.W nPlayerInteractionArg2                               ;81F41F|EE7009  |000970;
    LDA.W nPlayerInteractionArg2                               ;81F422|AD7009  |000970;
    CMP.B #$20                                                 ;81F425|C920    |      ;
    BEQ +                                                      ;81F427|F003    |81F42C;
    JMP.W .return                                              ;81F429|4C8FF4  |81F48F;
 
 
  + STZ.W nPlayerInteractionArg2                               ;81F42C|9C7009  |000970;
    SEP #$20                                                   ;81F42F|E220    |      ;
    LDA.B #$02                                                 ;81F431|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81F433|8D9A01  |00019A;
    LDX.W #$0300                                               ;81F436|A20003  |      ;
    LDA.B #$00                                                 ;81F439|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81F43B|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81F43E|225F9383|83935F;
    SEP #$20                                                   ;81F442|E220    |      ;
    LDA.B #$01                                                 ;81F444|A901    |      ;
    STA.W nPlayerInteractionArg1                               ;81F446|8D6F09  |00096F;
    JMP.W .return                                              ;81F449|4C8FF4  |81F48F;
 
 
.case1:
    SEP #$20                                                   ;81F44C|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81F44E|AD9A01  |00019A;
    CMP.B #$02                                                 ;81F451|C902    |      ;
    BNE +                                                      ;81F453|D003    |81F458;
    JMP.W .return                                              ;81F455|4C8FF4  |81F48F;
 
 
  + REP #$20                                                   ;81F458|C220    |      ;
    LDA.W #$000B                                               ;81F45A|A90B00  |      ;
    LDX.W #$0000                                               ;81F45D|A20000  |      ;
    LDY.W #$001E                                               ;81F460|A01E00  |      ;
    JSL.L fAI_SetSlotScript                                    ;81F463|223F8084|84803F;
    SEP #$20                                                   ;81F467|E220    |      ;
    LDA.B #$02                                                 ;81F469|A902    |      ;
    STA.W nPlayerInteractionArg1                               ;81F46B|8D6F09  |00096F;
    JMP.W .return                                              ;81F46E|4C8FF4  |81F48F;
 
 
.case2:
    SEP #$20                                                   ;81F471|E220    |      ;
    INC.W nPlayerInteractionArg2                               ;81F473|EE7009  |000970;
    LDA.W nPlayerInteractionArg2                               ;81F476|AD7009  |000970;
    CMP.B #$C6                                                 ;81F479|C9C6    |      ;
    BEQ +                                                      ;81F47B|F003    |81F480;
    JMP.W .return                                              ;81F47D|4C8FF4  |81F48F;
 
 
  + %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    JMP.W .return                                              ;81F48C|4C8FF4  |81F48F;
 
 
.return:
    RTS                                                        ;81F48F|60      |      ;
 
 
fPlayerInteraction0x4A:
    REP #$30                                                   ;81F490|C230    |      ;
    LDA.W #$00FB                                               ;81F492|A9FB00  |      ;
    LDX.W #$0010                                               ;81F495|A21000  |      ;
    STX.W $09AD+!RAM_SHIFT                                 ;81F498|8EAD09  |0009AD;
    LDY.W #$0030                                               ;81F49B|A03000  |      ;
    STY.W $09AF+!RAM_SHIFT                                 ;81F49E|8CAF09  |0009AF;
    JSL.L fSetTileAtCoords                                     ;81F4A1|2288A681|81A688;
    REP #$30                                                   ;81F4A5|C230    |      ;
    LDA.W #$0001                                               ;81F4A7|A90100  |      ;
    JMP.W fPlayerInteraction_Return                            ;81F4AA|4C56F5  |81F556;
 
 
fPlayerInteraction0x4B:
    REP #$30                                                   ;81F4AD|C230    |      ;
    LDA.W #$00FB                                               ;81F4AF|A9FB00  |      ;
    LDX.W #$00B0                                               ;81F4B2|A2B000  |      ;
    STX.W $09AD+!RAM_SHIFT                                 ;81F4B5|8EAD09  |0009AD;
    LDY.W #$0090                                               ;81F4B8|A09000  |      ;
    STY.W $09AF+!RAM_SHIFT                                 ;81F4BB|8CAF09  |0009AF;
    JSL.L fSetTileAtCoords                                     ;81F4BE|2288A681|81A688;
    REP #$30                                                   ;81F4C2|C230    |      ;
    LDA.W #$0002                                               ;81F4C4|A90200  |      ;
    JMP.W fPlayerInteraction_Return                            ;81F4C7|4C56F5  |81F556;
 
 
fPlayerInteraction0x4C:
    REP #$30                                                   ;81F4CA|C230    |      ;
    LDA.W #$00FB                                               ;81F4CC|A9FB00  |      ;
    LDX.W #$01C0                                               ;81F4CF|A2C001  |      ;
    STX.W $09AD+!RAM_SHIFT                                 ;81F4D2|8EAD09  |0009AD;
    LDY.W #$0050                                               ;81F4D5|A05000  |      ;
    STY.W $09AF+!RAM_SHIFT                                 ;81F4D8|8CAF09  |0009AF;
    JSL.L fSetTileAtCoords                                     ;81F4DB|2288A681|81A688;
    REP #$30                                                   ;81F4DF|C230    |      ;
    LDA.W #$0003                                               ;81F4E1|A90300  |      ;
    BRA fPlayerInteraction_Return                              ;81F4E4|8070    |81F556;
 
 
fPlayerInteraction0x4D:
    REP #$30                                                   ;81F4E6|C230    |      ;
    LDA.W #$00FB                                               ;81F4E8|A9FB00  |      ;
    LDX.W #$02A0                                               ;81F4EB|A2A002  |      ;
    STX.W $09AD+!RAM_SHIFT                                 ;81F4EE|8EAD09  |0009AD;
    LDY.W #$0030                                               ;81F4F1|A03000  |      ;
    STY.W $09AF+!RAM_SHIFT                                 ;81F4F4|8CAF09  |0009AF;
    JSL.L fSetTileAtCoords                                     ;81F4F7|2288A681|81A688;
    REP #$30                                                   ;81F4FB|C230    |      ;
    LDA.W #$0004                                               ;81F4FD|A90400  |      ;
    BRA fPlayerInteraction_Return                              ;81F500|8054    |81F556;
 
 
fPlayerInteraction0x4E:
    REP #$30                                                   ;81F502|C230    |      ;
    LDA.W #$00FB                                               ;81F504|A9FB00  |      ;
    LDX.W #$0050                                               ;81F507|A25000  |      ;
    STX.W $09AD+!RAM_SHIFT                                 ;81F50A|8EAD09  |0009AD;
    LDY.W #$02C0                                               ;81F50D|A0C002  |      ;
    STY.W $09AF+!RAM_SHIFT                                 ;81F510|8CAF09  |0009AF;
    JSL.L fSetTileAtCoords                                     ;81F513|2288A681|81A688;
    REP #$30                                                   ;81F517|C230    |      ;
    LDA.W #$0005                                               ;81F519|A90500  |      ;
    BRA fPlayerInteraction_Return                              ;81F51C|8038    |81F556;
 
 
fPlayerInteraction0x4F:
    REP #$30                                                   ;81F51E|C230    |      ;
    LDA.W #$00FB                                               ;81F520|A9FB00  |      ;
    LDX.W #$0210                                               ;81F523|A21002  |      ;
    STX.W $09AD+!RAM_SHIFT                                 ;81F526|8EAD09  |0009AD;
    LDY.W #$0250                                               ;81F529|A05002  |      ;
    STY.W $09AF+!RAM_SHIFT                                 ;81F52C|8CAF09  |0009AF;
    JSL.L fSetTileAtCoords                                     ;81F52F|2288A681|81A688;
    REP #$30                                                   ;81F533|C230    |      ;
    LDA.W #$0006                                               ;81F535|A90600  |      ;
    BRA fPlayerInteraction_Return                              ;81F538|801C    |81F556;
 
 
fPlayerInteraction0x50:
    REP #$30                                                   ;81F53A|C230    |      ;
    LDA.W #$00FB                                               ;81F53C|A9FB00  |      ;
    LDX.W #$0210                                               ;81F53F|A21002  |      ;
    STX.W $09AD+!RAM_SHIFT                                 ;81F542|8EAD09  |0009AD;
    LDY.W #$0330                                               ;81F545|A03003  |      ;
    STY.W $09AF+!RAM_SHIFT                                 ;81F548|8CAF09  |0009AF;
    JSL.L fSetTileAtCoords                                     ;81F54B|2288A681|81A688;
    REP #$30                                                   ;81F54F|C230    |      ;
    LDA.W #$0007                                               ;81F551|A90700  |      ;
    BRA fPlayerInteraction_Return                              ;81F554|8000    |81F556;
 
 
fPlayerInteraction_Return:
    REP #$30                                                   ;81F556|C230    |      ;
    TAX                                                        ;81F558|AA      |      ;
    SEP #$20                                                   ;81F559|E220    |      ;
    LDA.W $09A4+!RAM_SHIFT,X                               ;81F55B|BDA409  |0009A4;
    BEQ +                                                      ;81F55E|F034    |81F594;
    TXY                                                        ;81F560|9B      |      ;
    XBA                                                        ;81F561|EB      |      ;
    LDA.B #$00                                                 ;81F562|A900    |      ;
    XBA                                                        ;81F564|EB      |      ;
    REP #$20                                                   ;81F565|C220    |      ;
    DEC A                                                      ;81F567|3A      |      ;
    ASL A                                                      ;81F568|0A      |      ;
    TAX                                                        ;81F569|AA      |      ;
    LDA.L aPlayerInteraction_SetFlags,X                        ;81F56A|BFB4FA81|81FAB4;
    AND.L strcFlags.unknown3                                   ;81F56E|2F781F7F|7F1F78;
    BNE +                                                      ;81F572|D020    |81F594;
    TYX                                                        ;81F574|BB      |      ;
    SEP #$20                                                   ;81F575|E220    |      ;
    LDA.W $09A4+!RAM_SHIFT,X                               ;81F577|BDA409  |0009A4;
    CLC                                                        ;81F57A|18      |      ;
    ADC.B #$1D                                                 ;81F57B|691D    |      ;
    STA.W strcPlayerData.carryItemId                           ;81F57D|8D1D09  |00091D;
    %SetPlayerAction(!PACTION_ITEMONHAND)
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    RTS                                                        ;81F593|60      |      ;
 
 
  + REP #$30                                                   ;81F594|C230    |      ;
    LDA.W #$00A1                                               ;81F596|A9A100  |      ;
    LDX.W $09AD+!RAM_SHIFT                                 ;81F599|AEAD09  |0009AD;
    LDY.W $09AF+!RAM_SHIFT                                 ;81F59C|ACAF09  |0009AF;
    JSL.L fMap_UpdateCurrentTilemap                            ;81F59F|223AB082|82B03A;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    RTS                                                        ;81F5AF|60      |      ;
 
 
fPlayerInteraction0x51:
    SEP #$20                                                   ;81F5B0|E220    |      ;
    REP #$10                                                   ;81F5B2|C210    |      ;
    LDA.W nPlayerInteractionArg1                               ;81F5B4|AD6F09  |00096F;
    CMP.B #$01                                                 ;81F5B7|C901    |      ;
    BEQ .case1                                                 ;81F5B9|F030    |81F5EB;
    CMP.B #$02                                                 ;81F5BB|C902    |      ;
    BNE +                                                      ;81F5BD|D003    |81F5C2;
    JMP.W .case2                                               ;81F5BF|4C6CF6  |81F66C;
 
 
  + CMP.B #$03                                                 ;81F5C2|C903    |      ;
    BNE +                                                      ;81F5C4|D003    |81F5C9;
    JMP.W .case3                                               ;81F5C6|4C9EF6  |81F69E;
 
 
  + CMP.B #$04                                                 ;81F5C9|C904    |      ;
    BNE +                                                      ;81F5CB|D003    |81F5D0;
    JMP.W .case4                                               ;81F5CD|4CB5F6  |81F6B5;
 
 
  + SEP #$20                                                   ;81F5D0|E220    |      ;
    LDA.B #$02                                                 ;81F5D2|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81F5D4|8D9A01  |00019A;
    LDX.W #$024B                                               ;81F5D7|A24B02  |      ;
    LDA.B #$00                                                 ;81F5DA|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81F5DC|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81F5DF|225F9383|83935F;
    SEP #$20                                                   ;81F5E3|E220    |      ;
    INC.W nPlayerInteractionArg1                               ;81F5E5|EE6F09  |00096F;
    JMP.W fReturn_81F6D6                                       ;81F5E8|4CD6F6  |81F6D6;
 
 
.case1:
    SEP #$20                                                   ;81F5EB|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81F5ED|AD9A01  |00019A;
    CMP.B #$02                                                 ;81F5F0|C902    |      ;
    BNE +                                                      ;81F5F2|D003    |81F5F7;
    JMP.W fReturn_81F6D6                                       ;81F5F4|4CD6F6  |81F6D6;
 
 
  + SEP #$20                                                   ;81F5F7|E220    |      ;
    LDA.W strcDialogDisplay.dialogOptionsAnswer                ;81F5F9|AD8F01  |00018F;
    BNE .label1                                                ;81F5FC|D035    |81F633;
    REP #$20                                                   ;81F5FE|C220    |      ;
    LDA.W #$FFEC                                               ;81F600|A9ECFF  |      ;
    STA.B ptrTemp0x72                                          ;81F603|8572    |000072;
    SEP #$20                                                   ;81F605|E220    |      ;
    LDA.B #$FF                                                 ;81F607|A9FF    |      ;
    STA.B ptrTemp0x72+2                                        ;81F609|8574    |000074;
    JSL.L fGameEngine_AddProfit                                ;81F60B|22C9B183|83B1C9;
    REP #$20                                                   ;81F60F|C220    |      ;
    CMP.W #$0000                                               ;81F611|C90000  |      ;
    BNE .label2                                                ;81F614|D03A    |81F650;
    SEP #$20                                                   ;81F616|E220    |      ;
    LDA.B #$02                                                 ;81F618|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81F61A|8D9A01  |00019A;
    LDX.W #$024C                                               ;81F61D|A24C02  |      ;
    LDA.B #$00                                                 ;81F620|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81F622|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81F625|225F9383|83935F;
    SEP #$20                                                   ;81F629|E220    |      ;
    LDA.B #$02                                                 ;81F62B|A902    |      ;
    STA.W nPlayerInteractionArg1                               ;81F62D|8D6F09  |00096F;
    JMP.W fReturn_81F6D6                                       ;81F630|4CD6F6  |81F6D6;
 
 
.label1:
    SEP #$20                                                   ;81F633|E220    |      ;
    LDA.B #$02                                                 ;81F635|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81F637|8D9A01  |00019A;
    LDX.W #$024D                                               ;81F63A|A24D02  |      ;
    LDA.B #$00                                                 ;81F63D|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81F63F|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81F642|225F9383|83935F;
    SEP #$20                                                   ;81F646|E220    |      ;
    LDA.B #$03                                                 ;81F648|A903    |      ;
    STA.W nPlayerInteractionArg1                               ;81F64A|8D6F09  |00096F;
    JMP.W fReturn_81F6D6                                       ;81F64D|4CD6F6  |81F6D6;
 
 
.label2:
    SEP #$20                                                   ;81F650|E220    |      ;
    LDA.B #$02                                                 ;81F652|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81F654|8D9A01  |00019A;
    LDX.W #$0213                                               ;81F657|A21302  |      ;
    LDA.B #$00                                                 ;81F65A|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81F65C|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81F65F|225F9383|83935F;
    SEP #$20                                                   ;81F663|E220    |      ;
    LDA.B #$03                                                 ;81F665|A903    |      ;
    STA.W nPlayerInteractionArg1                               ;81F667|8D6F09  |00096F;
    BRA fReturn_81F6D6                                         ;81F66A|806A    |81F6D6;
 
 
.case2:
    SEP #$20                                                   ;81F66C|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81F66E|AD9A01  |00019A;
    CMP.B #$02                                                 ;81F671|C902    |      ;
    BEQ fReturn_81F6D6                                         ;81F673|F061    |81F6D6;
    REP #$20                                                   ;81F675|C220    |      ;
    %SetPlayerAction(!PACTION_AUTOPILOT)
    REP #$30                                                   ;81F67E|C230    |      ;
    LDA.W #$0030                                               ;81F680|A93000  |      ;
    STA.W strcObjectData.spriteIdx                             ;81F683|8D0109  |000901;
    JSR.W fPlayer_UpdateSpriteObject                                      ;81F686|20E6CF  |81CFE6;
    REP #$30                                                   ;81F689|C230    |      ;
    LDA.W #$0001                                               ;81F68B|A90100  |      ;
    JSL.L fGameEngine_AddHappiness                             ;81F68E|2282B283|83B282;
    SEP #$20                                                   ;81F692|E220    |      ;
    STZ.W nPlayerInteractionArg2                               ;81F694|9C7009  |000970;
    LDA.B #$04                                                 ;81F697|A904    |      ;
    STA.W nPlayerInteractionArg1                               ;81F699|8D6F09  |00096F;
    BRA fReturn_81F6D6                                         ;81F69C|8038    |81F6D6;
 
 
.case3:
    SEP #$20                                                   ;81F69E|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81F6A0|AD9A01  |00019A;
    CMP.B #$02                                                 ;81F6A3|C902    |      ;
    BEQ fReturn_81F6D6                                         ;81F6A5|F02F    |81F6D6;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    BRA fReturn_81F6D6                                         ;81F6B3|8021    |81F6D6;
 
 
.case4:
    SEP #$20                                                   ;81F6B5|E220    |      ;
    INC.W nPlayerInteractionArg2                               ;81F6B7|EE7009  |000970;
    LDA.W nPlayerInteractionArg2                               ;81F6BA|AD7009  |000970;
    CMP.B #$64                                                 ;81F6BD|C964    |      ;
    BNE fReturn_81F6D6                                         ;81F6BF|D015    |81F6D6;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    %SetPlayerAction(!PACTION_NONE)
    BRA fReturn_81F6D6                                         ;81F6D4|8000    |81F6D6;
 
 
fReturn_81F6D6:
    RTS                                                        ;81F6D6|60      |      ; FIXME: I want to be .return
 
 
fPlayerInteraction0x52:
    SEP #$20                                                   ;81F6D7|E220    |      ;
    REP #$10                                                   ;81F6D9|C210    |      ;
    LDA.W nPlayerInteractionArg1                               ;81F6DB|AD6F09  |00096F;
    CMP.B #$01                                                 ;81F6DE|C901    |      ;
    BEQ .case1                                                 ;81F6E0|F030    |81F712;
    CMP.B #$02                                                 ;81F6E2|C902    |      ;
    BNE +                                                      ;81F6E4|D003    |81F6E9;
    JMP.W .case2                                               ;81F6E6|4C94F7  |81F794;
 
 
  + CMP.B #$03                                                 ;81F6E9|C903    |      ;
    BNE +                                                      ;81F6EB|D003    |81F6F0;
    JMP.W .case3                                               ;81F6ED|4CC6F7  |81F7C6;
 
 
  + CMP.B #$04                                                 ;81F6F0|C904    |      ;
    BNE +                                                      ;81F6F2|D003    |81F6F7;
    JMP.W .case4                                               ;81F6F4|4CDDF7  |81F7DD;
 
 
  + SEP #$20                                                   ;81F6F7|E220    |      ;
    LDA.B #$02                                                 ;81F6F9|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81F6FB|8D9A01  |00019A;
    LDX.W #$024A                                               ;81F6FE|A24A02  |      ;
    LDA.B #$00                                                 ;81F701|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81F703|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81F706|225F9383|83935F;
    SEP #$20                                                   ;81F70A|E220    |      ;
    INC.W nPlayerInteractionArg1                               ;81F70C|EE6F09  |00096F;
    JMP.W .return                                              ;81F70F|4CFEF7  |81F7FE;
 
 
.case1:
    SEP #$20                                                   ;81F712|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81F714|AD9A01  |00019A;
    CMP.B #$02                                                 ;81F717|C902    |      ;
    BNE +                                                      ;81F719|D003    |81F71E;
    JMP.W .return                                              ;81F71B|4CFEF7  |81F7FE;
 
 
  + SEP #$20                                                   ;81F71E|E220    |      ;
    LDA.W strcDialogDisplay.dialogOptionsAnswer                ;81F720|AD8F01  |00018F;
    BNE .label1                                                ;81F723|D035    |81F75A;
    REP #$20                                                   ;81F725|C220    |      ;
    LDA.W #$FFE2                                               ;81F727|A9E2FF  |      ;
    STA.B ptrTemp0x72                                          ;81F72A|8572    |000072;
    SEP #$20                                                   ;81F72C|E220    |      ;
    LDA.B #$FF                                                 ;81F72E|A9FF    |      ;
    STA.B ptrTemp0x72+2                                        ;81F730|8574    |000074;
    JSL.L fGameEngine_AddProfit                                ;81F732|22C9B183|83B1C9;
    REP #$20                                                   ;81F736|C220    |      ;
    CMP.W #$0000                                               ;81F738|C90000  |      ;
    BNE .label2                                                ;81F73B|D03A    |81F777;
    SEP #$20                                                   ;81F73D|E220    |      ;
    LDA.B #$02                                                 ;81F73F|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81F741|8D9A01  |00019A;
    LDX.W #$024C                                               ;81F744|A24C02  |      ;
    LDA.B #$00                                                 ;81F747|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81F749|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81F74C|225F9383|83935F;
    SEP #$20                                                   ;81F750|E220    |      ;
    LDA.B #$02                                                 ;81F752|A902    |      ;
    STA.W nPlayerInteractionArg1                               ;81F754|8D6F09  |00096F;
    JMP.W .return                                              ;81F757|4CFEF7  |81F7FE;
 
 
.label1:
    SEP #$20                                                   ;81F75A|E220    |      ;
    LDA.B #$02                                                 ;81F75C|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81F75E|8D9A01  |00019A;
    LDX.W #$024D                                               ;81F761|A24D02  |      ;
    LDA.B #$00                                                 ;81F764|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81F766|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81F769|225F9383|83935F;
    SEP #$20                                                   ;81F76D|E220    |      ;
    LDA.B #$03                                                 ;81F76F|A903    |      ;
    STA.W nPlayerInteractionArg1                               ;81F771|8D6F09  |00096F;
    JMP.W .return                                              ;81F774|4CFEF7  |81F7FE;
 
 
.label2:
    SEP #$20                                                   ;81F777|E220    |      ;
    LDA.B #$02                                                 ;81F779|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81F77B|8D9A01  |00019A;
    LDX.W #$0213                                               ;81F77E|A21302  |      ;
    LDA.B #$00                                                 ;81F781|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81F783|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81F786|225F9383|83935F;
    SEP #$20                                                   ;81F78A|E220    |      ;
    LDA.B #$03                                                 ;81F78C|A903    |      ;
    STA.W nPlayerInteractionArg1                               ;81F78E|8D6F09  |00096F;
    JMP.W fReturn_81F6D6                                       ;81F791|4CD6F6  |81F6D6; BUG - should be .return in this function rather than previous one since we are out of function scope
 
 
.case2:
    SEP #$20                                                   ;81F794|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81F796|AD9A01  |00019A;
    CMP.B #$02                                                 ;81F799|C902    |      ;
    BEQ .return                                                ;81F79B|F061    |81F7FE;
    REP #$20                                                   ;81F79D|C220    |      ;
    %SetPlayerAction(!PACTION_AUTOPILOT)
    REP #$30                                                   ;81F7A6|C230    |      ;
    LDA.W #$00FB                                               ;81F7A8|A9FB00  |      ;
    STA.W strcObjectData.spriteIdx                             ;81F7AB|8D0109  |000901;
    JSR.W fPlayer_UpdateSpriteObject                                      ;81F7AE|20E6CF  |81CFE6;
    REP #$30                                                   ;81F7B1|C230    |      ;
    LDA.W #$0003                                               ;81F7B3|A90300  |      ;
    JSL.L fGameEngine_AddHappiness                             ;81F7B6|2282B283|83B282;
    SEP #$20                                                   ;81F7BA|E220    |      ;
    STZ.W nPlayerInteractionArg2                               ;81F7BC|9C7009  |000970;
    LDA.B #$04                                                 ;81F7BF|A904    |      ;
    STA.W nPlayerInteractionArg1                               ;81F7C1|8D6F09  |00096F;
    BRA .return                                                ;81F7C4|8038    |81F7FE;
 
 
.case3:
    SEP #$20                                                   ;81F7C6|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81F7C8|AD9A01  |00019A;
    CMP.B #$02                                                 ;81F7CB|C902    |      ;
    BEQ .return                                                ;81F7CD|F02F    |81F7FE;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    BRA .return                                                ;81F7DB|8021    |81F7FE;
 
 
.case4:
    SEP #$20                                                   ;81F7DD|E220    |      ;
    INC.W nPlayerInteractionArg2                               ;81F7DF|EE7009  |000970;
    LDA.W nPlayerInteractionArg2                               ;81F7E2|AD7009  |000970;
    CMP.B #$64                                                 ;81F7E5|C964    |      ;
    BNE .return                                                ;81F7E7|D015    |81F7FE;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    %SetPlayerAction(!PACTION_NONE)
    BRA .return                                                ;81F7FC|8000    |81F7FE;
 
 
.return:
    RTS                                                        ;81F7FE|60      |      ;
 
 
fPlayerInteraction0x53:
    SEP #$20                                                   ;81F7FF|E220    |      ;
    REP #$10                                                   ;81F801|C210    |      ;
    REP #$30                                                   ;81F803|C230    |      ;
    LDA.W #$0001                                               ;81F805|A90100  |      ;
    LDX.W #$0000                                               ;81F808|A20000  |      ;
    LDY.W #$0000                                               ;81F80B|A00000  |      ;
    JSL.L fStoreTileOnFrontOfPlayerAtDistance                  ;81F80E|224ED181|81D14E;
    %SetCurrentCarriedItemDirect(!CITEM_EGG)
    %SetPlayerAction(!PACTION_ITEMONHAND)
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    REP #$30                                                   ;81F82C|C230    |      ;
    LDA.W nTileInFrontOfPlayerX                                ;81F82E|AD8509  |000985;
    LSR A                                                      ;81F831|4A      |      ;
    LSR A                                                      ;81F832|4A      |      ;
    LSR A                                                      ;81F833|4A      |      ;
    LSR A                                                      ;81F834|4A      |      ;
    ASL A                                                      ;81F835|0A      |      ;
    ASL A                                                      ;81F836|0A      |      ;
    ASL A                                                      ;81F837|0A      |      ;
    ASL A                                                      ;81F838|0A      |      ;
    STA.B strcVariables.n16Temp1                               ;81F839|857E    |00007E;
    LDY.W #$0000                                               ;81F83B|A00000  |      ;
 
.loop:
    REP #$30                                                   ;81F83E|C230    |      ;
    TYA                                                        ;81F840|98      |      ;
    ASL A                                                      ;81F841|0A      |      ;
    ASL A                                                      ;81F842|0A      |      ;
    TAX                                                        ;81F843|AA      |      ;
    LDA.L aGameEngine_AddChickenPositionsData,X                ;81F844|BF10CA83|83CA10;
    SEC                                                        ;81F848|38      |      ;
    SBC.W #$0008                                               ;81F849|E90800  |      ;
    CMP.B strcVariables.n16Temp1                               ;81F84C|C57E    |00007E;
    BEQ +                                                      ;81F84E|F008    |81F858;
    INY                                                        ;81F850|C8      |      ;
    CPY.W #$000D                                               ;81F851|C00D00  |      ;
    BNE .loop                                                  ;81F854|D0E8    |81F83E;
 
.deadloop:
    BRA .deadloop                                              ;81F856|80FE    |81F856;
 
 
  + TYA                                                        ;81F858|98      |      ;
    ASL A                                                      ;81F859|0A      |      ;
    TAX                                                        ;81F85A|AA      |      ;
    LDA.L aPlayerInteraction_ResetFlags,X                      ;81F85B|BFD4FA81|81FAD4;
    AND.L nEggInCoopFlags                                      ;81F85F|2F451F7F|7F1F45;
    STA.L nEggInCoopFlags                                      ;81F863|8F451F7F|7F1F45;
    BRA .return                                                ;81F867|8000    |81F869;
 
 
.return:
    RTS                                                        ;81F869|60      |      ;
 
 
fPlayerInteraction0x54_FloristNotebook:
    SEP #$20                                                   ;81F86A|E220    |      ;
    REP #$10                                                   ;81F86C|C210    |      ;
    LDA.W nPlayerInteractionArg1                               ;81F86E|AD6F09  |00096F;
    CMP.B #$01                                                 ;81F871|C901    |      ;
    BEQ .checks                                                ;81F873|F01B    |81F890;
    SEP #$20                                                   ;81F875|E220    |      ;
    LDA.B #$02                                                 ;81F877|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81F879|8D9A01  |00019A;
    LDX.W #$0455                                               ;81F87C|A25504  |      ;
    LDA.B #$00                                                 ;81F87F|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81F881|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81F884|225F9383|83935F;
    SEP #$20                                                   ;81F888|E220    |      ;
    INC.W nPlayerInteractionArg1                               ;81F88A|EE6F09  |00096F;
    JMP.W .justReturn                                          ;81F88D|4C1EF9  |81F91E;
 
 
.checks:
    REP #$30                                                   ;81F890|C230    |      ;
    LDA.W strcJoypad1.current                                  ;81F892|AD2401  |000124;
    BIT.W #!JOYPAD_B                                               
    BEQ +                                                      ;81F898|F003    |81F89D;
    JMP.W .return                                              ;81F89A|4C1FF9  |81F91F;
 
 
  + SEP #$20                                                   ;81F89D|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81F89F|AD9A01  |00019A;
    CMP.B #$02                                                 ;81F8A2|C902    |      ;
    BNE +                                                      ;81F8A4|D003    |81F8A9;
    JMP.W .justReturn                                          ;81F8A6|4C1EF9  |81F91E;
 
 
  + LDA.W strcDialogDisplay.dialogOptionsAnswer                ;81F8A9|AD8F01  |00018F;
    CMP.B #$00                                                 ;81F8AC|C900    |      ;
    BEQ .case0                                                 ;81F8AE|F008    |81F8B8;
    CMP.B #$01                                                 ;81F8B0|C901    |      ;
    BEQ .case1                                                 ;81F8B2|F026    |81F8DA;
    CMP.B #$02                                                 ;81F8B4|C902    |      ;
    BEQ .case2                                                 ;81F8B6|F044    |81F8FC;
 
.case0:
    SEP #$20                                                   ;81F8B8|E220    |      ;
    LDA.B #$02                                                 ;81F8BA|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81F8BC|8D9A01  |00019A;
    LDX.W #$0456                                               ;81F8BF|A25604  |      ;
    LDA.B #$00                                                 ;81F8C2|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81F8C4|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81F8C7|225F9383|83935F;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    JMP.W .justReturn                                          ;81F8D7|4C1EF9  |81F91E;
 
 
.case1:
    SEP #$20                                                   ;81F8DA|E220    |      ;
    LDA.B #$02                                                 ;81F8DC|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81F8DE|8D9A01  |00019A;
    LDX.W #$0457                                               ;81F8E1|A25704  |      ;
    LDA.B #$00                                                 ;81F8E4|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81F8E6|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81F8E9|225F9383|83935F;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    JMP.W .justReturn                                          ;81F8F9|4C1EF9  |81F91E;
 
 
.case2:
    SEP #$20                                                   ;81F8FC|E220    |      ;
    LDA.B #$02                                                 ;81F8FE|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81F900|8D9A01  |00019A;
    LDX.W #$0458                                               ;81F903|A25804  |      ;
    LDA.B #$00                                                 ;81F906|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81F908|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81F90B|225F9383|83935F;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    JMP.W .justReturn                                          ;81F91B|4C1EF9  |81F91E;
 
 
.justReturn:
    RTS                                                        ;81F91E|60      |      ;
 
 
.return:
    JSL.L fDialog_EndDialogRestoreScroll                               ;81F91F|22F99383|8393F9;
    SEP #$20                                                   ;81F923|E220    |      ;
    LDA.B #$01                                                 ;81F925|A901    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81F927|8D9A01  |00019A;
    REP #$20                                                   ;81F92A|C220    |      ;
    LDA.W strcJoypad1.newInput                                 ;81F92C|AD2801  |000128;
    AND.W #~!JOYPAD_A                                               
    STA.W strcJoypad1.newInput                                 ;81F932|8D2801  |000128;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    RTS                                                        ;81F941|60      |      ;
 
 
fPlayerInteraction0x55_AnimalNotebook:
    SEP #$20                                                   ;81F942|E220    |      ;
    REP #$10                                                   ;81F944|C210    |      ;
    LDA.W nPlayerInteractionArg1                               ;81F946|AD6F09  |00096F;
    CMP.B #$01                                                 ;81F949|C901    |      ;
    BEQ .checks                                                ;81F94B|F01B    |81F968;
    SEP #$20                                                   ;81F94D|E220    |      ;
    LDA.B #$02                                                 ;81F94F|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81F951|8D9A01  |00019A;
    LDX.W #$0459                                               ;81F954|A25904  |      ;
    LDA.B #$00                                                 ;81F957|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81F959|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81F95C|225F9383|83935F;
    SEP #$20                                                   ;81F960|E220    |      ;
    INC.W nPlayerInteractionArg1                               ;81F962|EE6F09  |00096F;
    JMP.W .justReturn                                          ;81F965|4C45FA  |81FA45;
 
 
.checks:
    REP #$30                                                   ;81F968|C230    |      ;
    LDA.W strcJoypad1.current                                  ;81F96A|AD2401  |000124;
    BIT.W #!JOYPAD_B                                               
    BEQ +                                                      ;81F970|F003    |81F975;
    JMP.W .return                                              ;81F972|4C46FA  |81FA46;
 
 
  + SEP #$20                                                   ;81F975|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81F977|AD9A01  |00019A;
    CMP.B #$02                                                 ;81F97A|C902    |      ;
    BNE +                                                      ;81F97C|D003    |81F981;
    JMP.W .justReturn                                          ;81F97E|4C45FA  |81FA45;
 
 
  + LDA.W strcDialogDisplay.dialogOptionsAnswer                ;81F981|AD8F01  |00018F;
    CMP.B #$00                                                 ;81F984|C900    |      ;
    BEQ .case0                                                 ;81F986|F013    |81F99B;
    CMP.B #$01                                                 ;81F988|C901    |      ;
    BEQ .case1                                                 ;81F98A|F031    |81F9BD;
    CMP.B #$02                                                 ;81F98C|C902    |      ;
    BEQ .case2                                                 ;81F98E|F04F    |81F9DF;
    CMP.B #$03                                                 ;81F990|C903    |      ;
    BEQ .case3                                                 ;81F992|F06D    |81FA01;
    CMP.B #$04                                                 ;81F994|C904    |      ;
    BNE .case0                                                 ;81F996|D003    |81F99B;
    JMP.W .case4                                               ;81F998|4C23FA  |81FA23;
 
 
.case0:
    SEP #$20                                                   ;81F99B|E220    |      ;
    LDA.B #$02                                                 ;81F99D|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81F99F|8D9A01  |00019A;
    LDX.W #$045A                                               ;81F9A2|A25A04  |      ;
    LDA.B #$00                                                 ;81F9A5|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81F9A7|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81F9AA|225F9383|83935F;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    JMP.W .justReturn                                          ;81F9BA|4C45FA  |81FA45;
 
 
.case1:
    SEP #$20                                                   ;81F9BD|E220    |      ;
    LDA.B #$02                                                 ;81F9BF|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81F9C1|8D9A01  |00019A;
    LDX.W #$045B                                               ;81F9C4|A25B04  |      ;
    LDA.B #$00                                                 ;81F9C7|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81F9C9|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81F9CC|225F9383|83935F;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    JMP.W .justReturn                                          ;81F9DC|4C45FA  |81FA45;
 
 
.case2:
    SEP #$20                                                   ;81F9DF|E220    |      ;
    LDA.B #$02                                                 ;81F9E1|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81F9E3|8D9A01  |00019A;
    LDX.W #$045C                                               ;81F9E6|A25C04  |      ;
    LDA.B #$00                                                 ;81F9E9|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81F9EB|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81F9EE|225F9383|83935F;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    JMP.W .justReturn                                          ;81F9FE|4C45FA  |81FA45;
 
 
.case3:
    SEP #$20                                                   ;81FA01|E220    |      ;
    LDA.B #$02                                                 ;81FA03|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81FA05|8D9A01  |00019A;
    LDX.W #$045D                                               ;81FA08|A25D04  |      ;
    LDA.B #$00                                                 ;81FA0B|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81FA0D|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81FA10|225F9383|83935F;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    JMP.W .justReturn                                          ;81FA20|4C45FA  |81FA45;
 
 
.case4:
    SEP #$20                                                   ;81FA23|E220    |      ;
    LDA.B #$02                                                 ;81FA25|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81FA27|8D9A01  |00019A;
    LDX.W #$045E                                               ;81FA2A|A25E04  |      ;
    LDA.B #$00                                                 ;81FA2D|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81FA2F|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81FA32|225F9383|83935F;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    JMP.W .justReturn                                          ;81FA42|4C45FA  |81FA45;
 
 
.justReturn:
    RTS                                                        ;81FA45|60      |      ;
 
 
.return:
    JSL.L fDialog_EndDialogRestoreScroll                               ;81FA46|22F99383|8393F9;
    SEP #$20                                                   ;81FA4A|E220    |      ;
    LDA.B #$01                                                 ;81FA4C|A901    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81FA4E|8D9A01  |00019A;
    REP #$20                                                   ;81FA51|C220    |      ;
    LDA.W strcJoypad1.newInput                                 ;81FA53|AD2801  |000128;
    AND.W #~!JOYPAD_A                                               
    STA.W strcJoypad1.newInput                                 ;81FA59|8D2801  |000128;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    RTS                                                        ;81FA68|60      |      ;
 
 
fPlayerInteraction0x56:
    SEP #$20                                                   ;81FA69|E220    |      ;
    REP #$10                                                   ;81FA6B|C210    |      ;
    INC.W nPlayerInteractionArg2                               ;81FA6D|EE7009  |000970;
    LDA.W nPlayerInteractionArg2                               ;81FA70|AD7009  |000970;
    CMP.B #$02                                                 ;81FA73|C902    |      ;
    BNE +                                                      ;81FA75|D00C    |81FA83;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
 
  + RTS                                                        ;81FA83|60      |      ;
 
 
fPlayerInteraction0x57:
    REP #$30                                                   ;81FA84|C230    |      ;
    LDX.W #$0491                                               ;81FA86|A29104  |      ;
    %CheckFlag(event2, !EFLAGS2_MARRIEDANN)
    BNE +                                                      ;81FA90|D003    |81FA95;
    LDX.W #$0246                                               ;81FA92|A24602  |      ;
 
  + SEP #$20                                                   ;81FA95|E220    |      ;
    REP #$10                                                   ;81FA97|C210    |      ;
    LDA.B #$02                                                 ;81FA99|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81FA9B|8D9A01  |00019A;
    LDA.B #$00                                                 ;81FA9E|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81FAA0|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81FAA3|225F9383|83935F;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    RTS                                                        ;81FAB3|60      |      ;
 
 
    incsrc "../../../build/gen/blocks/player_interaction_flags.asm"
 
    pad $81FFFF
