

    incsrc "../../../../build/gen/ai/slots_2F.asm"
 
pAIScripting0x2F_Data01:
    %AICMD0x00_SetMusic($11, $B4)                              ;B4C711
    %AICMD0x02_FreezeTime()                                    ;B4C714
    %AICMD0x03_SetHour($06)                                    ;B4C715
    %AICMD0x05_SetTransferPosition(136, 344)                   ;B4C717
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4C71C
    %AICMD0x08_EnableAIControl()                               ;B4C71E
    %AICMD0x09_StartScript($01, pAIScripting0x2F_L001)                                   ;B4C71F
    %AICMD0x06_SetDestinationArea(!AREA_FARMSUMMER)            ;B4C723
    %AICMD0x38_WaitForFadeIn()                                               ;B4C725
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 32)                  ;B4C726
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B4C72A
    %AICMD0x13_Wait(90)                                        ;B4C72C
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4C72F
    %AICMD0x13_Wait(120)                                       ;B4C731
    %AICMD0x0B_SetScriptFlag($00)                                            ;B4C734
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B4C736
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 48)                  ;B4C738
    %AICMD0x40_DisableTileInteractions()                       ;B4C73C
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 68)                  ;B4C73D
    %AICMD0x13_Wait(70)                                        ;B4C741
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 44)                   ;B4C744
    %AICMD0x0B_SetScriptFlag($02)                                            ;B4C748
    %AICMD0x0C_WaitForScriptFlag($03)                                            ;B4C74A
    %AICMD0x3D_TeleportToArea(!AREA_ENDING00)                  ;B4C74C
    %AICMD0x10_End()                                           ;B4C74E
pAIScripting0x2F_L001:
    %AICMD0x1A($0110, $0178, aAIScriptingData_L004, $00)                     ;B4C74F
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B4C757
    %AICMD0x1B($01EC, $00)                                     ;B4C759
    %AICMD0x0D($FF, $00, $78, $01)                             ;B4C75D
    %AICMD0x13_Wait(60)                                        ;B4C762
    %AICMD0x1B($01F2, $00)                                     ;B4C765
    %AICMD0x0B_SetScriptFlag($01)                                            ;B4C769
    %AICMD0x0C_WaitForScriptFlag($02)                                            ;B4C76B
    %AICMD0x1B($01E9, $00)                                     ;B4C76D
    %AICMD0x0D($FF, $00, $40, $02)                             ;B4C771
    %AICMD0x1B($01DD, $00)                                     ;B4C776
    %AICMD0x13_Wait(60)                                        ;B4C77A
    %AICMD0x1B($01DA, $00)                                     ;B4C77D
    %AICMD0x0D($00, $01, $60, $02)                             ;B4C781
    %AICMD0x1B($01F2, $00)                                     ;B4C786
    %AICMD0x13_Wait(60)                                        ;B4C78A
    %AICMD0x1B($01E9, $00)                                     ;B4C78D
    %AICMD0x0D($FF, $00, $40, $02)                             ;B4C791
    %AICMD0x1B($01F2, $01)                                     ;B4C796
    %AICMD0x13_Wait(120)                                       ;B4C79A
    %AICMD0x1B($01E9, $01)                                     ;B4C79D
    %AICMD0x0D($01, $00, $20, $02)                             ;B4C7A1
    %AICMD0x1B($01E4, $00)                                     ;B4C7A6
    %AICMD0x13_Wait(60)                                        ;B4C7AA
    %AICMD0x1B($01EA, $01)                                     ;B4C7AD
    %AICMD0x13_Wait(80)                                        ;B4C7B1
    %AICMD0x1B($01EB, $01)                                     ;B4C7B4
    %AICMD0x13_Wait(180)                                       ;B4C7B8
    %AICMD0x0B_SetScriptFlag($03)                                            ;B4C7BB
pAIScripting0x2F_L002:
    %AICMD0x13_Wait(1)                                         ;B4C7BD
    %AICMD0x12_Jump(pAIScripting0x2F_L002)                                   ;B4C7C0
