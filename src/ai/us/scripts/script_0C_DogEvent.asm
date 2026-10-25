

    incsrc "../../../../build/gen/ai/slots_0C.asm"
 
AI_ObtainDog:
 
    %AICMD0x50()                                               ;B3EF7A
    %AICMD0x08_EnableAIControl()                               ;B3EF7B
    %AICMD0x09_StartScript($16, AI_ObtainDog_L001)                                   ;B3EF7C
    %AICMD0x09_StartScript($02, AI_ObtainDog_L002)                                   ;B3EF80
    %AICMD0x38_WaitForFadeIn()                                               ;B3EF84
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 80)                  ;B3EF85
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 2)                   ;B3EF89
    %AICMD0x0B_SetScriptFlag($00)                                            ;B3EF8D
    %AICMD0x0C_WaitForScriptFlag($03)                                            ;B3EF8F
    %AICMD0x1C_ShowDialog($0124, $00)                          ;B3EF91
    %AICMD0x0B_SetScriptFlag($01)                                            ;B3EF95
    %AICMD0x0C_WaitForScriptFlag($02)                                            ;B3EF97
    %AICMD0x19($0042, $00)                                     ;B3EF99
    %AICMD0x13_Wait(60)                                        ;B3EF9D
    %AICMD0x1C_ShowDialog($0319, $00)                          ;B3EFA0
    %AICMD0x23_OrWithIndexedValue($800196, $0D)                ;B3EFA4
    %AICMD0x41_AddValue16(nPlayerHappiness, 10)                ;B3EFA9
    %AICMD0x10_End()                                           ;B3EFAF
AI_ObtainDog_L001:
    %AICMD0x1A($FFF8, $01A8, aAIScriptingData_L004, $02)                     ;B3EFB0
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B3EFB8
    %AICMD0x1B($01EC, $01)                                     ;B3EFBA
    %AICMD0x0D($01, $00, $80, $01)                             ;B3EFBE
    %AICMD0x1B($01EE, $01)                                     ;B3EFC3
    %AICMD0x13_Wait(60)                                        ;B3EFC7
    %AICMD0x1B($01EA, $01)                                     ;B3EFCA
    %AICMD0x0B_SetScriptFlag($03)                                            ;B3EFCE
    %AICMD0x10_End()                                           ;B3EFD0
AI_ObtainDog_L002:
    %AICMD0x1A($FFEA, $01A8, aAIScriptingData_L021, $02)                     ;B3EFD1
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B3EFD9
    %AICMD0x1B($0241, $01)                                     ;B3EFDB
    %AICMD0x0D($01, $00, $80, $01)                             ;B3EFDF
    %AICMD0x13_Wait(60)                                        ;B3EFE4
    %AICMD0x1C_ShowDialog($0125, $00)                          ;B3EFE7
    %AICMD0x0B_SetScriptFlag($02)                                            ;B3EFEB
AI_ObtainDog_L003:
    %AICMD0x13_Wait(1)                                         ;B3EFED
    %AICMD0x12_Jump(AI_ObtainDog_L003)                                   ;B3EFF0


AI_EllenSayGoodbye:
    %AICMD0x50()                                               ;B3EFF3
    %AICMD0x02_FreezeTime()                                    ;B3EFF4
    %AICMD0x08_EnableAIControl()                               ;B3EFF5
    %AICMD0x09_StartScript($16, AI_EllenSayGoodbye_L001)                                   ;B3EFF6
    %AICMD0x09_StartScript($01, AI_EllenSayGoodbye_L003)                                   ;B3EFFA
    %AICMD0x05_SetTransferPosition(136, 424)                   ;B3EFFE
    %AICMD0x38_WaitForFadeIn()                                               ;B3F003
    %AICMD0x0B_SetScriptFlag($00)                                            ;B3F004
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B3F006
    %AICMD0x0C_WaitForScriptFlag($02)                                            ;B3F008
    %AICMD0x11_EnableUserControl()                             ;B3F00A
    %AICMD0x10_End()                                           ;B3F00B
AI_EllenSayGoodbye_L001:
    %AICMD0x1A($0078, $01A8, aAIScriptingData_L004, $02)                     ;B3F00C
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B3F014
    %AICMD0x1B($01F2, $01)                                     ;B3F016
    %AICMD0x13_Wait(60)                                        ;B3F01A
    %AICMD0x1B($01F8, $01)                                     ;B3F01D
    %AICMD0x13_Wait(60)                                        ;B3F021
    %AICMD0x0B_SetScriptFlag($01)                                            ;B3F024
    %AICMD0x23_OrWithIndexedValue(strcFlags.event3, $07)       ;B3F026
    %AICMD0x2E($01, aAIScriptingData_L005, $10)                              ;B3F02B
AI_EllenSayGoodbye_L002:
    %AICMD0x36_UpdateDog()                                     ;B3F030
    %AICMD0x12_Jump(AI_EllenSayGoodbye_L002)                                   ;B3F031
AI_EllenSayGoodbye_L003:
    %AICMD0x1A($0068, $01A8, aAIScriptingData_L021, $02)                     ;B3F034
    %AICMD0x1B($023A, $01)                                     ;B3F03C
    %AICMD0x13_Wait(80)                                        ;B3F040
    %AICMD0x1C_ShowDialog($0126, $00)                          ;B3F043
    %AICMD0x1B($0241, $00)                                     ;B3F047
    %AICMD0x0D($FF, $00, $40, $01)                             ;B3F04B
    %AICMD0x1B($0240, $01)                                     ;B3F050
    %AICMD0x13_Wait(60)                                        ;B3F054
    %AICMD0x1C_ShowDialog($0114, $00)                          ;B3F057
    %AICMD0x1B($0241, $00)                                     ;B3F05B
    %AICMD0x0D($FF, $00, $50, $01)                             ;B3F05F
    %AICMD0x0B_SetScriptFlag($02)                                            ;B3F064
    %AICMD0x37()                                               ;B3F066
    %AICMD0x10_End()                                           ;B3F067
