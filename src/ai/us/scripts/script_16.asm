

pAIScripting0x16:
    dw pAIScripting0x16_Data01                                            ;B48D38|        |B48D58;
    dw pAIScripting0x17                                        ;B48D3A|        |B48E05;
    dw pAIScripting0x17                                        ;B48D3C|        |B48E05;
    dw pAIScripting0x17                                        ;B48D3E|        |B48E05;
    dw pAIScripting0x17                                        ;B48D40|        |B48E05;
    dw pAIScripting0x17                                        ;B48D42|        |B48E05;
    dw pAIScripting0x17                                        ;B48D44|        |B48E05;
    dw pAIScripting0x17                                        ;B48D46|        |B48E05;
    dw pAIScripting0x17                                        ;B48D48|        |B48E05;
    dw pAIScripting0x17                                        ;B48D4A|        |B48E05;
    dw pAIScripting0x17                                        ;B48D4C|        |B48E05;
    dw pAIScripting0x17                                        ;B48D4E|        |B48E05;
    dw pAIScripting0x17                                        ;B48D50|        |B48E05;
    dw pAIScripting0x17                                        ;B48D52|        |B48E05;
    dw pAIScripting0x17                                        ;B48D54|        |B48E05;
    dw pAIScripting0x17                                        ;B48D56|        |B48E05;
 
pAIScripting0x16_Data01:
    %AICMD0x50()                                               ;B48D58
    %AICMD0x08_EnableAIControl()                               ;B48D59
    %AICMD0x09_StartScript($01, pAIScripting0x16_L001)                                   ;B48D5A
    %AICMD0x38_WaitForFadeIn()                                               ;B48D5E
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 80)                  ;B48D5F
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B48D63
    %AICMD0x0B_SetScriptFlag($00)                                            ;B48D65
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B48D67
    %AICMD0x11_EnableUserControl()                             ;B48D69
    %AICMD0x10_End()                                           ;B48D6A
pAIScripting0x16_L001:
    %AICMD0x1A($0078, $01A8, aAIScriptingData_L027, $02)                     ;B48D6B
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B48D73
    %AICMD0x1D_ShowDialog($0321, $00)                          ;B48D75
    %AICMD0x20_JumpIfChoice(0, pAIScripting0x16_L003)                        ;B48D79
    %AICMD0x20_JumpIfChoice(1, pAIScripting0x16_L007)                        ;B48D7D
    %AICMD0x12_Jump(pAIScripting0x16_L002)                                   ;B48D81
pAIScripting0x16_L002:
    %AICMD0x1B($025F, $00)                                     ;B48D84
    %AICMD0x0D($FF, $00, $90, $01)                             ;B48D88
    %AICMD0x0B_SetScriptFlag($01)                                            ;B48D8D
    %AICMD0x10_End()                                           ;B48D8F
pAIScripting0x16_L003:
    %AICMD0x1B($025D, $00)                                     ;B48D90
    %AICMD0x0D($00, $FF, $30, $01)                             ;B48D94
    %AICMD0x1B($025F, $01)                                     ;B48D99
    %AICMD0x0D($01, $00, $A8, $01)                             ;B48D9D
    %AICMD0x13_Wait(60)                                        ;B48DA2
    %AICMD0x1B($025F, $00)                                     ;B48DA5
    %AICMD0x0D($FF, $00, $A8, $01)                             ;B48DA9
    %AICMD0x1B($025B, $00)                                     ;B48DAE
    %AICMD0x0D($00, $01, $30, $01)                             ;B48DB2
    %AICMD0x1B($025E, $01)                                     ;B48DB7
    %AICMD0x1C_ShowDialog($0322, $00)                          ;B48DBB
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.toolEquipped), 3, pAIScripting0x16_L004)              ;B48DBF
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.toolSecond), 3, pAIScripting0x16_L005)              ;B48DC6
    %AICMD0x12_Jump(pAIScripting0x16_L006)                                   ;B48DCD
pAIScripting0x16_L004:
    %AICMD0x47_SetValue8(wram80(strcPlayerData.toolEquipped), 0)                           ;B48DD0
    %AICMD0x12_Jump(pAIScripting0x16_L006)                                   ;B48DD5
pAIScripting0x16_L005:
    %AICMD0x47_SetValue8(wram80(strcPlayerData.toolSecond), 0)                           ;B48DD8
    %AICMD0x12_Jump(pAIScripting0x16_L006)                                   ;B48DDD
pAIScripting0x16_L006:
    %AICMD0x28_ClearBit(strcShedItems.row1, $02)                        ;B48DE0
    %AICMD0x23_OrWithIndexedValue(strcFlags.event3, $0F)       ;B48DE5
    %AICMD0x41_AddValue16(nPlayerHappiness, 20)                ;B48DEA
    %AICMD0x12_Jump(pAIScripting0x16_L002)                                   ;B48DF0
pAIScripting0x16_L007:
    %AICMD0x1C_ShowDialog($0323, $00)                          ;B48DF3
    %AICMD0x23_OrWithIndexedValue(strcFlags.event4, $02)       ;B48DF7
    %AICMD0x41_AddValue16(nPlayerHappiness, -20)               ;B48DFC
    %AICMD0x12_Jump(pAIScripting0x16_L002)                                   ;B48E02
