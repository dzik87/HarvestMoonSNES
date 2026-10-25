; Bank $82 module "system" - starts at $82E666
 
 
    incsrc "../../../build/gen/blocks/system_transfer_data.asm"
 
fMainMenu_DrawSaveSlotFrames:
    REP #$30                                                   ;82E742|C230    |      ;
    LDX.W #$0000                                               ;82E744|A20000  |      ;
 
 -- REP #$20                                                   ;82E747|C220    |      ;
    LDA.L aMainMenu_SlotFrameTileStart,X                                    ;82E749|BF68F282|82F268;
    STA.B strcVariables.n16Temp1                               ;82E74D|857E    |00007E;
    INC A                                                      ;82E74F|1A      |      ;
    STA.B strcVariables.n16Temp2                               ;82E750|8580    |000080;
    CLC                                                        ;82E752|18      |      ;
    ADC.W #$000F                                               ;82E753|690F00  |      ;
    STA.B strcVariables.n16Temp3                               ;82E756|8582    |000082;
    INC A                                                      ;82E758|1A      |      ;
    STA.B strcVariables.n16Temp4                               ;82E759|8584    |000084;
    LDA.L aMainMenu_SlotFrameVramAddr,X                                    ;82E75B|BF58F282|82F258;
    STA.B strcVariables.n16Unk86                               ;82E75F|8586    |000086;
    LDY.W #$0000                                               ;82E761|A00000  |      ;
 
  - PHY                                                        ;82E764|5A      |      ;
    PHX                                                        ;82E765|DA      |      ;
    SEP #$20                                                   ;82E766|E220    |      ;
    LDA.B #$00                                                 ;82E768|A900    |      ;
    STA.B strcSystem.arrayIndex                                ;82E76A|8527    |000027;
    LDA.B #$18                                                 ;82E76C|A918    |      ;
    STA.B strcSystem.destinationRegister                       ;82E76E|8529    |000029;
    REP #$30                                                   ;82E770|C230    |      ;
    LDY.W #$0004                                               ;82E772|A00400  |      ;
    LDX.B strcVariables.n16Unk86                               ;82E775|A686    |000086;
    LDA.W #$007E                                               ;82E777|A97E00  |      ;
    STA.B ptrTemp0x72                                          ;82E77A|8572    |000072;
    SEP #$20                                                   ;82E77C|E220    |      ;
    LDA.B #$80                                                 ;82E77E|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;82E780|8574    |000074; 80007E -> $72
    REP #$20                                                   ;82E782|C220    |      ;
    LDA.W #$0080                                               ;82E784|A98000  |      ;
    JSL.L fCore_PrepareTransfer                                ;82E787|22338A80|808A33;
    SEP #$20                                                   ;82E78B|E220    |      ;
    LDA.B #$01                                                 ;82E78D|A901    |      ;
    STA.B strcSystem.arrayIndex                                ;82E78F|8527    |000027;
    LDA.B #$18                                                 ;82E791|A918    |      ;
    STA.B strcSystem.destinationRegister                       ;82E793|8529    |000029;
    REP #$30                                                   ;82E795|C230    |      ;
    LDY.W #$0004                                               ;82E797|A00400  |      ;
    LDX.B strcVariables.n16Unk86                               ;82E79A|A686    |000086;
    TXA                                                        ;82E79C|8A      |      ;
    CLC                                                        ;82E79D|18      |      ;
    ADC.W #$0020                                               ;82E79E|692000  |      ;
    TAX                                                        ;82E7A1|AA      |      ;
    LDA.W #$0082                                               ;82E7A2|A98200  |      ;
    STA.B ptrTemp0x72                                          ;82E7A5|8572    |000072;
    SEP #$20                                                   ;82E7A7|E220    |      ;
    LDA.B #$80                                                 ;82E7A9|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;82E7AB|8574    |000074;
    REP #$20                                                   ;82E7AD|C220    |      ;
    LDA.W #$0080                                               ;82E7AF|A98000  |      ;
    JSL.L fCore_PrepareTransfer                                ;82E7B2|22338A80|808A33;
    JSL.L fCore_StartTransfer                                  ;82E7B6|22F08A80|808AF0;
    REP #$30                                                   ;82E7BA|C230    |      ;
    INC.B strcVariables.n16Temp1                               ;82E7BC|E67E    |00007E;
    INC.B strcVariables.n16Temp1                               ;82E7BE|E67E    |00007E;
    INC.B strcVariables.n16Temp2                               ;82E7C0|E680    |000080;
    INC.B strcVariables.n16Temp2                               ;82E7C2|E680    |000080;
    INC.B strcVariables.n16Temp3                               ;82E7C4|E682    |000082;
    INC.B strcVariables.n16Temp3                               ;82E7C6|E682    |000082;
    INC.B strcVariables.n16Temp4                               ;82E7C8|E684    |000084;
    INC.B strcVariables.n16Temp4                               ;82E7CA|E684    |000084;
    INC.B strcVariables.n16Unk86                               ;82E7CC|E686    |000086;
    INC.B strcVariables.n16Unk86                               ;82E7CE|E686    |000086;
    PLX                                                        ;82E7D0|FA      |      ;
    PLY                                                        ;82E7D1|7A      |      ;
    INY                                                        ;82E7D2|C8      |      ;
    if !REGION_JP
    LDA.L aMainMenu_SlotFrameRunLength,X
    else
    LDA.L aMainMenu_SlotFrameRunLength,X                                    ;82E7D3|BF88F282|82F288;
    endif
    STA.B strcVariables.n16Unk88                               ;82E7D7|8588    |000088;
    CPY.B strcVariables.n16Unk88                               ;82E7D9|C488    |000088;
    BNE -                                                      ;82E7DB|D087    |82E764;
    INX                                                        ;82E7DD|E8      |      ;
    INX                                                        ;82E7DE|E8      |      ;
    CPX.W #$0010                                               ;82E7DF|E01000  |      ;
    BEQ .justReturn                                            ;82E7E2|F004    |82E7E8;
    if !REGION_EUDE
    JML.L L_82E747
    elseif !REGION_JP
    JML.L L_82E747
    else
    JML.L $82E747                                              ;82E7E4|5C47E782|82E747;
    endif
 
 
.justReturn:
    RTS                                                        ;82E7E8|60      |      ;
 
 
fLoadAndStartGame:
    SEP #$20                                                   ;82E7E9|E220    |      ;
    LDA.B #$00                                                 ;82E7EB|A900    |      ;
    XBA                                                        ;82E7ED|EB      |      ;
    LDA.W $098E+!RAM_SHIFT                                 ;82E7EE|AD8E09  |00098E;
    JSL.L fGameEngine_LoadGame                                 ;82E7F1|22B1B283|83B2B1;
    JML.L fCore_GameStart                                      ;82E7F5|5C008080|808000;
 
 
fStartNewGame:
    JSL.L fGameEngine_SetDefaults                              ;82E7F9|22BEA983|83A9BE;
    JML.L fCore_GameStart                                      ;82E7FD|5C008080|808000;
 
 
fUnreached_82E801:
    SEP #$20                                                   ;82E801|E220    |      ;
    LDA.B #$00                                                 ;82E803|A900    |      ;
    STA.W strcMenuData.nameDestinationIdx                      ;82E805|8D9F09  |00099F;
    JML.L fScreen_NameInput                                    ;82E808|5C0CE882|82E80C;
