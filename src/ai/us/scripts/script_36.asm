

    incsrc "../../../../build/gen/ai/slots_36.asm"
 
pAIScripting0x36_Data01:
    %AICMD0x00_SetMusic($10, $B4)                              ;B4D180
    %AICMD0x02_FreezeTime()                                    ;B4D183
    %AICMD0x03_SetHour($06)                                    ;B4D184
    %AICMD0x05_SetTransferPosition(184, 104)                   ;B4D186
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4D18B
    %AICMD0x08_EnableAIControl()                               ;B4D18D
    %AICMD0x09_StartScript($01, pAIScripting0x36_L004)                                   ;B4D18E
    %AICMD0x09_StartScript($02, pAIScripting0x36_L006)                                   ;B4D192
    %AICMD0x09_StartScript($04, pAIScripting0x36_L001)                                   ;B4D196
    %AICMD0x09_StartScript($05, pAIScripting0x36_L002)                                   ;B4D19A
    %AICMD0x09_StartScript($06, pAIScripting0x36_L003)                                   ;B4D19E
    %AICMD0x3B($12)                                            ;B4D1A2
    %AICMD0x06_SetDestinationArea(!AREA_ENDING09)              ;B4D1A4
    %AICMD0x38_WaitForFadeIn()                                               ;B4D1A6
    %AICMD0x13_Wait(60)                                        ;B4D1A7
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 192)                 ;B4D1AA
    %AICMD0x13_Wait(120)                                       ;B4D1AE
    %AICMD0x3F_ThrowCarriedItem()                              ;B4D1B1
    %AICMD0x13_Wait(30)                                        ;B4D1B2
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4D1B5
    %AICMD0x13_Wait(30)                                        ;B4D1B7
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 106)                 ;B4D1BA
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4D1BE
    %AICMD0x3E_SetCarryItem($12)                               ;B4D1C0
    %AICMD0x13_Wait(30)                                        ;B4D1C2
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 108)                  ;B4D1C5
    %AICMD0x0B_SetScriptFlag($00)                                            ;B4D1C9
    %AICMD0x3F_ThrowCarriedItem()                              ;B4D1CB
    %AICMD0x13_Wait(300)                                       ;B4D1CC
    %AICMD0x0C_WaitForScriptFlag($05)                                            ;B4D1CF
    %AICMD0x3D_TeleportToArea(!AREA_ENDING00)                  ;B4D1D1
    %AICMD0x10_End()                                           ;B4D1D3
pAIScripting0x36_L001:
    %AICMD0x1A($00B8, $0078, aAIScriptingData_L190, $00)                     ;B4D1D4
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B4D1DC
    %AICMD0x1B($00B7, $00)                                     ;B4D1DE
    %AICMD0x13_Wait(60)                                        ;B4D1E2
    %AICMD0x37()                                               ;B4D1E5
    %AICMD0x0B_SetScriptFlag($01)                                            ;B4D1E6
    %AICMD0x10_End()                                           ;B4D1E8
pAIScripting0x36_L002:
    %AICMD0x1A($0098, $0078, aAIScriptingData_L190, $00)                     ;B4D1E9
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B4D1F1
    %AICMD0x1B($00B7, $00)                                     ;B4D1F3
    %AICMD0x13_Wait(60)                                        ;B4D1F7
    %AICMD0x37()                                               ;B4D1FA
    %AICMD0x0B_SetScriptFlag($02)                                            ;B4D1FB
    %AICMD0x10_End()                                           ;B4D1FD
pAIScripting0x36_L003:
    %AICMD0x1A($0088, $0078, aAIScriptingData_L190, $00)                     ;B4D1FE
    %AICMD0x0C_WaitForScriptFlag($02)                                            ;B4D206
    %AICMD0x13_Wait(60)                                        ;B4D208
    %AICMD0x1B($00B7, $00)                                     ;B4D20B
    %AICMD0x13_Wait(60)                                        ;B4D20F
    %AICMD0x37()                                               ;B4D212
    %AICMD0x0B_SetScriptFlag($03)                                            ;B4D213
    %AICMD0x10_End()                                           ;B4D215
pAIScripting0x36_L004:
    %AICMD0x1A($0078, $0078, aAIScriptingData_L167, $02)                     ;B4D216
    %AICMD0x13_Wait(200)                                       ;B4D21E
    %AICMD0x1B($01F6, $01)                                     ;B4D221
    %AICMD0x13_Wait(120)                                       ;B4D225
    %AICMD0x1B($01EB, $01)                                     ;B4D228
    %AICMD0x13_Wait(180)                                       ;B4D22C
    %AICMD0x1B($01EA, $01)                                     ;B4D22F
    %AICMD0x13_Wait(180)                                       ;B4D233
    %AICMD0x0C_WaitForScriptFlag($03)                                            ;B4D236
    %AICMD0x1B($01E8, $01)                                     ;B4D238
    %AICMD0x13_Wait(60)                                        ;B4D23C
    %AICMD0x0C_WaitForScriptFlag($03)                                            ;B4D23F
    %AICMD0x1B($01F2, $01)                                     ;B4D241
    %AICMD0x13_Wait(120)                                       ;B4D245
    %AICMD0x0B_SetScriptFlag($04)                                            ;B4D248
    %AICMD0x13_Wait(120)                                       ;B4D24A
    %AICMD0x1B($01EC, $01)                                     ;B4D24D
    %AICMD0x0D($01, $00, $30, $01)                             ;B4D251
    %AICMD0x13_Wait(40)                                        ;B4D256
    %AICMD0x1B($01E2, $00)                                     ;B4D259
    %AICMD0x0D($00, $FF, $10, $01)                             ;B4D25D
    %AICMD0x13_Wait(40)                                        ;B4D262
    %AICMD0x1B($01EC, $01)                                     ;B4D265
    %AICMD0x0D($01, $00, $48, $01)                             ;B4D269
    %AICMD0x13_Wait(40)                                        ;B4D26E
    %AICMD0x1B($01EC, $00)                                     ;B4D271
    %AICMD0x0D($FF, $00, $58, $01)                             ;B4D275
    %AICMD0x13_Wait(90)                                        ;B4D27A
pAIScripting0x36_L005:
    %AICMD0x13_Wait(1)                                         ;B4D27D
    %AICMD0x12_Jump(pAIScripting0x36_L005)                                   ;B4D280
pAIScripting0x36_L006:
    %AICMD0x0C_WaitForScriptFlag($04)                                            ;B4D283
    %AICMD0x1A($0088, $0078, aAIScriptingData_L085, $00)                     ;B4D285
    %AICMD0x1B($0321, $00)                                     ;B4D28D
    %AICMD0x13_Wait(60)                                        ;B4D291
    %AICMD0x1B($0324, $01)                                     ;B4D294
    %AICMD0x0D($01, $00, $20, $01)                             ;B4D298
    %AICMD0x13_Wait(30)                                        ;B4D29D
    %AICMD0x1B($0323, $00)                                     ;B4D2A0
    %AICMD0x0D($00, $FF, $20, $01)                             ;B4D2A4
    %AICMD0x13_Wait(30)                                        ;B4D2A9
    %AICMD0x1B($0324, $01)                                     ;B4D2AC
    %AICMD0x0D($01, $00, $50, $01)                             ;B4D2B0
    %AICMD0x13_Wait(30)                                        ;B4D2B5
    %AICMD0x1B($0324, $00)                                     ;B4D2B8
    %AICMD0x0D($FF, $00, $80, $01)                             ;B4D2BC
    %AICMD0x1B($0325, $00)                                     ;B4D2C1
    %AICMD0x13_Wait(60)                                        ;B4D2C5
    %AICMD0x0B_SetScriptFlag($05)                                            ;B4D2C8
    %AICMD0x37()                                               ;B4D2CA
    %AICMD0x10_End()                                           ;B4D2CB
