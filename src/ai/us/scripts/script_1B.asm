

pAIScripting0x1B:
    dw pAIScripting0x1B_Data01                                            ;B491B3|        |B491D3;
    dw pAIScripting0x1B_Data02                                            ;B491B5|        |B49210;
    dw pAIScripting0x1C                                        ;B491B7|        |B492D2;
    dw pAIScripting0x1C                                        ;B491B9|        |B492D2;
    dw pAIScripting0x1C                                        ;B491BB|        |B492D2;
    dw pAIScripting0x1C                                        ;B491BD|        |B492D2;
    dw pAIScripting0x1C                                        ;B491BF|        |B492D2;
    dw pAIScripting0x1C                                        ;B491C1|        |B492D2;
    dw pAIScripting0x1C                                        ;B491C3|        |B492D2;
    dw pAIScripting0x1C                                        ;B491C5|        |B492D2;
    dw pAIScripting0x1C                                        ;B491C7|        |B492D2;
    dw pAIScripting0x1C                                        ;B491C9|        |B492D2;
    dw pAIScripting0x1C                                        ;B491CB|        |B492D2;
    dw pAIScripting0x1C                                        ;B491CD|        |B492D2;
    dw pAIScripting0x1C                                        ;B491CF|        |B492D2;
    dw pAIScripting0x1C                                        ;B491D1|        |B492D2;
 
pAIScripting0x1B_Data01:
 
    %AICMD0x50()                                               ;B491D3
    %AICMD0x08_EnableAIControl()                               ;B491D4
    %AICMD0x09_StartScript($01, pAIScripting0x1B_L001)                                   ;B491D5
    %AICMD0x38_WaitForFadeIn()                                               ;B491D9
    %AICMD0x0B_SetScriptFlag($00)                                            ;B491DA
    %AICMD0x10_End()                                           ;B491DC
pAIScripting0x1B_L001:
    %AICMD0x1A($0088, $01B8, aAIScriptingData_L047, $01)                     ;B491DD
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B491E5
    %AICMD0x0D($00, $FF, $50, $01)                             ;B491E7
    %AICMD0x1B($029B, $01)                                     ;B491EC
    %AICMD0x13_Wait(10)                                        ;B491F0
    %AICMD0x1B($029B, $00)                                     ;B491F3
    %AICMD0x13_Wait(10)                                        ;B491F7
    %AICMD0x1B($0299, $00)                                     ;B491FA
    %AICMD0x1C_ShowDialog($01E3, $00)                          ;B491FE
    %AICMD0x1B($0297, $00)                                     ;B49202
    %AICMD0x0D($00, $01, $60, $01)                             ;B49206
    %AICMD0x0B_SetScriptFlag($01)                                            ;B4920B
    %AICMD0x37()                                               ;B4920D
    %AICMD0x11_EnableUserControl()                             ;B4920E
    %AICMD0x10_End()                                           ;B4920F


pAIScripting0x1B_Data02:
    %AICMD0x00_SetMusic($0E, $B4)                              ;B49210
    %AICMD0x09_StartScript($01, pAIScripting0x1B_L003)                                   ;B49213
    %AICMD0x38_WaitForFadeIn()                                               ;B49217
    %AICMD0x11_EnableUserControl()                             ;B49218
    %AICMD0x10_End()                                           ;B49219
pAIScripting0x1B_L002:
    %AICMD0x13_Wait(1)                                         ;B4921A
    %AICMD0x12_Jump(pAIScripting0x1B_L002)                                   ;B4921D
    %AICMD0x10_End()                                           ;B49220
pAIScripting0x1B_L003:
    %AICMD0x1A($0038, $00F8, aAIScriptingData_L139, $00)                     ;B49221
    %AICMD0x12_Jump(pAIScripting0x1B_L004)                                   ;B49229
pAIScripting0x1B_L004:
    %AICMD0x2D_JumpOnInteract(pAIScripting0x1B_L006, pAIScripting0x1B_L008)                               ;B4922C
    %AICMD0x12_Jump(pAIScripting0x1B_L004)                                   ;B49231
pAIScripting0x1B_L005:
    %AICMD0x2D_JumpOnInteract(pAIScripting0x1B_L007, pAIScripting0x1B_L008)                               ;B49234
    %AICMD0x12_Jump(pAIScripting0x1B_L005)                                   ;B49239
pAIScripting0x1B_L006:
    %AICMD0x1C_ShowDialog($01E5, $00)                          ;B4923C
    %AICMD0x12_Jump(pAIScripting0x1B_L005)                                   ;B49240
pAIScripting0x1B_L007:
    %AICMD0x1C_ShowDialog($01E8, $00)                          ;B49243
    %AICMD0x12_Jump(pAIScripting0x1B_L005)                                   ;B49247
pAIScripting0x1B_L008:
    %AICMD0x43_JumpIfEqual16(wram80(strcPlayerData.carryItemIdPrev), 24, pAIScripting0x1B_L009)             ;B4924A
    %AICMD0x1C_ShowDialog($01E8, $00)                          ;B49252
    %AICMD0x12_Jump(pAIScripting0x1B_L005)                                   ;B49256
pAIScripting0x1B_L009:
    %AICMD0x08_EnableAIControl()                               ;B49259
    %AICMD0x1B($024F, $01)                                     ;B4925A
    %AICMD0x1C_ShowDialog($01E7, $00)                          ;B4925E
    %AICMD0x1B($0252, $01)                                     ;B49262
    %AICMD0x13_Wait(90)                                        ;B49266
    %AICMD0x1B($024F, $01)                                     ;B49269
    %AICMD0x41_AddValue16(nLove_Nina, 50)                      ;B4926D
    %AICMD0x0B_SetScriptFlag($00)                                            ;B49273
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B49275
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 48)                 ;B49277
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4927B
    %AICMD0x1B($0250, $01)                                     ;B4927D
    %AICMD0x0D($01, $00, $30, $01)                             ;B49281
    %AICMD0x1B($024C, $00)                                     ;B49286
    %AICMD0x0D($00, $01, $20, $02)                             ;B4928A
    %AICMD0x13_Wait(10)                                        ;B4928F
    %AICMD0x0D($00, $01, $30, $01)                             ;B49292
    %AICMD0x13_Wait(10)                                        ;B49297
    %AICMD0x0D($01, $01, $18, $02)                             ;B4929A
    %AICMD0x13_Wait(10)                                        ;B4929F
    %AICMD0x0D($00, $01, $46, $01)                             ;B492A2
    %AICMD0x1B($0347, $00)                                     ;B492A7
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 68)                   ;B492AB
    %AICMD0x19($0024, $00)                                     ;B492AF
    %AICMD0x13_Wait(60)                                        ;B492B3
    %AICMD0x1C_ShowDialog($0147, $00)                          ;B492B6
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B492BA
    %AICMD0x13_Wait(30)                                        ;B492BC
    %AICMD0x1B($024E, $00)                                     ;B492BF
    %AICMD0x13_Wait(60)                                        ;B492C3
    %AICMD0x23_OrWithIndexedValue(strcFlags.event5, $01)       ;B492C6
    %AICMD0x28_ClearBit(strcFlags.event5, $00)                          ;B492CB
    %AICMD0x3C()                                               ;B492D0
    %AICMD0x10_End()                                           ;B492D1
