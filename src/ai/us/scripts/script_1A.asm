

pAIScripting0x1A:
    dw pAIScripting0x1A_Data01                                            ;B490D3|        |B490F3;
    dw pAIScripting0x1A_Data02                                            ;B490D5|        |B4911C;
    dw pAIScripting0x1B                                        ;B490D7|        |B491B3;
    dw pAIScripting0x1B                                        ;B490D9|        |B491B3;
    dw pAIScripting0x1B                                        ;B490DB|        |B491B3;
    dw pAIScripting0x1B                                        ;B490DD|        |B491B3;
    dw pAIScripting0x1B                                        ;B490DF|        |B491B3;
    dw pAIScripting0x1B                                        ;B490E1|        |B491B3;
    dw pAIScripting0x1B                                        ;B490E3|        |B491B3;
    dw pAIScripting0x1B                                        ;B490E5|        |B491B3;
    dw pAIScripting0x1B                                        ;B490E7|        |B491B3;
    dw pAIScripting0x1B                                        ;B490E9|        |B491B3;
    dw pAIScripting0x1B                                        ;B490EB|        |B491B3;
    dw pAIScripting0x1B                                        ;B490ED|        |B491B3;
    dw pAIScripting0x1B                                        ;B490EF|        |B491B3;
    dw pAIScripting0x1B                                        ;B490F1|        |B491B3;
 
pAIScripting0x1A_Data01:
 
    %AICMD0x50()                                               ;B490F3
    %AICMD0x08_EnableAIControl()                               ;B490F4
    %AICMD0x09_StartScript($01, pAIScripting0x1A_L001)                                   ;B490F5
    %AICMD0x38_WaitForFadeIn()                                               ;B490F9
    %AICMD0x0B_SetScriptFlag($00)                                            ;B490FA
    %AICMD0x10_End()                                           ;B490FC
pAIScripting0x1A_L001:
    %AICMD0x1A($0088, $01B8, aAIScriptingData_L016, $01)                     ;B490FD
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B49105
    %AICMD0x0D($00, $FF, $50, $01)                             ;B49107
    %AICMD0x1C_ShowDialog($01DB, $00)                          ;B4910C
    %AICMD0x1B($0227, $00)                                     ;B49110
    %AICMD0x0D($00, $01, $60, $01)                             ;B49114
    %AICMD0x37()                                               ;B49119
    %AICMD0x11_EnableUserControl()                             ;B4911A
    %AICMD0x10_End()                                           ;B4911B


pAIScripting0x1A_Data02:
    %AICMD0x50()                                               ;B4911C
    %AICMD0x00_SetMusic($0E, $B4)                              ;B4911D
    %AICMD0x02_FreezeTime()                                    ;B49120
    %AICMD0x03_SetHour($07)                                    ;B49121
    %AICMD0x05_SetTransferPosition(136, 456)                   ;B49123
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B49128
    %AICMD0x08_EnableAIControl()                               ;B4912A
    %AICMD0x09_StartScript($01, pAIScripting0x1A_L002)                                   ;B4912B
    %AICMD0x09_StartScript($02, pAIScripting0x1A_L003)                                   ;B4912F
    %AICMD0x3B($24)                                            ;B49133
    %AICMD0x38_WaitForFadeIn()                                               ;B49135
    %AICMD0x0B_SetScriptFlag($03)                                            ;B49136
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 64)                    ;B49138
    %AICMD0x3F_ThrowCarriedItem()                              ;B4913C
    %AICMD0x0B_SetScriptFlag($00)                                            ;B4913D
    %AICMD0x0C_WaitForScriptFlag($02)                                            ;B4913F
    %AICMD0x40_DisableTileInteractions()                       ;B49141
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 96)                  ;B49142
    %AICMD0x13_Wait(60)                                        ;B49146
    %AICMD0x23_OrWithIndexedValue(strcFlags.event4, $0F)       ;B49149
    %AICMD0x28_ClearBit(strcFlags.event4, $0E)                          ;B4914E
    %AICMD0x3C()                                               ;B49153
    %AICMD0x10_End()                                           ;B49154
pAIScripting0x1A_L002:
    %AICMD0x1A($0088, $0178, aAIScriptingData_L015, $00)                     ;B49155
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B4915D
    %AICMD0x1B($0226, $00)                                     ;B4915F
    %AICMD0x13_Wait(60)                                        ;B49163
    %AICMD0x1C_ShowDialog($01E1, $00)                          ;B49166
    %AICMD0x1B($022B, $01)                                     ;B4916A
    %AICMD0x0D($01, $00, $10, $01)                             ;B4916E
    %AICMD0x1B($0227, $00)                                     ;B49173
    %AICMD0x0D($00, $01, $10, $01)                             ;B49177
    %AICMD0x1B($0226, $00)                                     ;B4917C
    %AICMD0x13_Wait(20)                                        ;B49180
    %AICMD0x1B($022D, $00)                                     ;B49183
    %AICMD0x13_Wait(60)                                        ;B49187
    %AICMD0x41_AddValue16(nLove_Ann, 50)                       ;B4918A
    %AICMD0x1B($0227, $00)                                     ;B49190
    %AICMD0x0D($00, $01, $50, $01)                             ;B49194
    %AICMD0x0B_SetScriptFlag($01)                                            ;B49199
    %AICMD0x37()                                               ;B4919B
    %AICMD0x10_End()                                           ;B4919C
pAIScripting0x1A_L003:
    %AICMD0x1A($0028, $0168, aAIScriptingData_L046, $02)                     ;B4919D
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B491A5
    %AICMD0x1C_ShowDialog($01E2, $00)                          ;B491A7
    %AICMD0x0B_SetScriptFlag($02)                                            ;B491AB
pAIScripting0x1A_L004:
    %AICMD0x13_Wait(1)                                         ;B491AD
    %AICMD0x12_Jump(pAIScripting0x1A_L004)                                   ;B491B0
