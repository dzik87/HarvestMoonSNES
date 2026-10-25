

pAIScripting0x19:
    dw pAIScripting0x19_Data01                                            ;B48F95|        |B48FB5;
    dw pAIScripting0x19_Data02                                            ;B48F97|        |B48FDE;
    dw pAIScripting0x1A                                        ;B48F99|        |B490D3;
    dw pAIScripting0x1A                                        ;B48F9B|        |B490D3;
    dw pAIScripting0x1A                                        ;B48F9D|        |B490D3;
    dw pAIScripting0x1A                                        ;B48F9F|        |B490D3;
    dw pAIScripting0x1A                                        ;B48FA1|        |B490D3;
    dw pAIScripting0x1A                                        ;B48FA3|        |B490D3;
    dw pAIScripting0x1A                                        ;B48FA5|        |B490D3;
    dw pAIScripting0x1A                                        ;B48FA7|        |B490D3;
    dw pAIScripting0x1A                                        ;B48FA9|        |B490D3;
    dw pAIScripting0x1A                                        ;B48FAB|        |B490D3;
    dw pAIScripting0x1A                                        ;B48FAD|        |B490D3;
    dw pAIScripting0x1A                                        ;B48FAF|        |B490D3;
    dw pAIScripting0x1A                                        ;B48FB1|        |B490D3;
    dw pAIScripting0x1A                                        ;B48FB3|        |B490D3;
 
pAIScripting0x19_Data01:
 
    %AICMD0x50()                                               ;B48FB5
    %AICMD0x08_EnableAIControl()                               ;B48FB6
    %AICMD0x09_StartScript($01, pAIScripting0x19_L001)                                   ;B48FB7
    %AICMD0x38_WaitForFadeIn()                                               ;B48FBB
    %AICMD0x0B_SetScriptFlag($00)                                            ;B48FBC
    %AICMD0x10_End()                                           ;B48FBE
pAIScripting0x19_L001:
    %AICMD0x1A($0088, $01B8, aAIScriptingData_L045, $01)                     ;B48FBF
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B48FC7
    %AICMD0x0D($00, $FF, $50, $01)                             ;B48FC9
    %AICMD0x1C_ShowDialog($01CC, $00)                          ;B48FCE
    %AICMD0x1B($0290, $00)                                     ;B48FD2
    %AICMD0x0D($00, $01, $60, $01)                             ;B48FD6
    %AICMD0x37()                                               ;B48FDB
    %AICMD0x11_EnableUserControl()                             ;B48FDC
    %AICMD0x10_End()                                           ;B48FDD


pAIScripting0x19_Data02:
    %AICMD0x50()                                               ;B48FDE
    %AICMD0x00_SetMusic($0E, $B4)                              ;B48FDF
    %AICMD0x08_EnableAIControl()                               ;B48FE2
    %AICMD0x09_StartScript($01, pAIScripting0x19_L008)                                   ;B48FE3
    %AICMD0x09_StartScript($02, pAIScripting0x19_L002)                                   ;B48FE7
    %AICMD0x09_StartScript($03, pAIScripting0x19_L004)                                   ;B48FEB
    %AICMD0x09_StartScript($04, pAIScripting0x19_L006)                                   ;B48FEF
    %AICMD0x38_WaitForFadeIn()                                               ;B48FF3
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 24)                  ;B48FF4
    %AICMD0x0B_SetScriptFlag($00)                                            ;B48FF8
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 48)                    ;B48FFA
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B48FFE
    %AICMD0x0B_SetScriptFlag($01)                                            ;B49000
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 20)                  ;B49002
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 51)                    ;B49006
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4900A
    %AICMD0x0B_SetScriptFlag($02)                                            ;B4900C
    %AICMD0x0C_WaitForScriptFlag($03)                                            ;B4900E
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B49010
    %AICMD0x0C_WaitForScriptFlag($04)                                            ;B49012
    %AICMD0x19($0007, $00)                                     ;B49014
    %AICMD0x13_Wait(60)                                        ;B49018
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4901B
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 64)                  ;B4901D
    %AICMD0x0B_SetScriptFlag($05)                                            ;B49021
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 48)                 ;B49023
    %AICMD0x40_DisableTileInteractions()                       ;B49027
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 64)                  ;B49028
    %AICMD0x0C_WaitForScriptFlag($06)                                            ;B4902C
    %AICMD0x13_Wait(60)                                        ;B4902E
    %AICMD0x23_OrWithIndexedValue(strcFlags.event4, $0D)       ;B49031
    %AICMD0x28_ClearBit(strcFlags.event4, $0C)                          ;B49036
    %AICMD0x3C()                                               ;B4903B
    %AICMD0x10_End()                                           ;B4903C
pAIScripting0x19_L002:
    %AICMD0x1A($0058, $00C8, aAIScriptingData_L027, $02)                     ;B4903D
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B49045
    %AICMD0x1C_ShowDialog($01D3, $00)                          ;B49047
pAIScripting0x19_L003:
    %AICMD0x13_Wait(1)                                         ;B4904B
    %AICMD0x12_Jump(pAIScripting0x19_L003)                                   ;B4904E
pAIScripting0x19_L004:
    %AICMD0x1A($00A8, $0098, aAIScriptingData_L027, $03)                     ;B49051
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B49059
    %AICMD0x1C_ShowDialog($01D4, $00)                          ;B4905B
pAIScripting0x19_L005:
    %AICMD0x13_Wait(1)                                         ;B4905F
    %AICMD0x12_Jump(pAIScripting0x19_L005)                                   ;B49062
pAIScripting0x19_L006:
    %AICMD0x1A($0068, $0068, aAIScriptingData_L027, $00)                     ;B49065
    %AICMD0x0C_WaitForScriptFlag($02)                                            ;B4906D
    %AICMD0x1B($025F, $00)                                     ;B4906F
    %AICMD0x1C_ShowDialog($01D5, $00)                          ;B49073
    %AICMD0x0B_SetScriptFlag($03)                                            ;B49077
    %AICMD0x1B($025A, $00)                                     ;B49079
pAIScripting0x19_L007:
    %AICMD0x13_Wait(1)                                         ;B4907D
    %AICMD0x12_Jump(pAIScripting0x19_L007)                                   ;B49080
pAIScripting0x19_L008:
    %AICMD0x1A($0028, $0068, aAIScriptingData_L011, $02)                     ;B49083
    %AICMD0x0C_WaitForScriptFlag($03)                                            ;B4908B
    %AICMD0x1B($0223, $01)                                     ;B4908D
    %AICMD0x0D($01, $00, $22, $01)                             ;B49091
    %AICMD0x1C_ShowDialog($01D6, $00)                          ;B49096
    %AICMD0x1B($0225, $01)                                     ;B4909A
    %AICMD0x13_Wait(60)                                        ;B4909E
    %AICMD0x1B($0223, $01)                                     ;B490A1
    %AICMD0x0D($FF, $00, $04, $01)                             ;B490A5
    %AICMD0x41_AddValue16(nLove_Maria, 50)                     ;B490AA
    %AICMD0x0B_SetScriptFlag($04)                                            ;B490B0
    %AICMD0x0C_WaitForScriptFlag($05)                                            ;B490B2
    %AICMD0x1B($021F, $00)                                     ;B490B4
    %AICMD0x0D($00, $01, $40, $01)                             ;B490B8
    %AICMD0x1B($0223, $01)                                     ;B490BD
    %AICMD0x0D($01, $00, $30, $01)                             ;B490C1
    %AICMD0x1B($021F, $00)                                     ;B490C6
    %AICMD0x0D($00, $01, $40, $01)                             ;B490CA
    %AICMD0x0B_SetScriptFlag($06)                                            ;B490CF
    %AICMD0x37()                                               ;B490D1
    %AICMD0x10_End()                                           ;B490D2
