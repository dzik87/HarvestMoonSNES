

    incsrc "../../../../build/gen/ai/slots_38.asm"
 
pAIScripting0x38_Data01:
    %AICMD0x00_SetMusic($10, $B4)                              ;B4D467
    %AICMD0x02_FreezeTime()                                    ;B4D46A
    %AICMD0x03_SetHour($06)                                    ;B4D46B
    %AICMD0x05_SetTransferPosition(65512, 120)                 ;B4D46D
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4D472
    %AICMD0x40_DisableTileInteractions()                       ;B4D474
    %AICMD0x08_EnableAIControl()                               ;B4D475
    %AICMD0x09_StartScript($01, pAIScripting0x38_L001)                                   ;B4D476
    %AICMD0x09_StartScript($02, pAIScripting0x38_L003)                                   ;B4D47A
    %AICMD0x06_SetDestinationArea(!AREA_ENDING06)              ;B4D47E
    %AICMD0x38_WaitForFadeIn()                                               ;B4D480
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B4D481
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 40)                  ;B4D483
    %AICMD0x13_Wait(30)                                        ;B4D487
    %AICMD0x19($00BE, $00)                                     ;B4D48A
    %AICMD0x0B_SetScriptFlag($01)                                            ;B4D48E
    %AICMD0x13_Wait(90)                                        ;B4D490
    %AICMD0x0C_WaitForScriptFlag($02)                                            ;B4D493
    %AICMD0x13_Wait(30)                                        ;B4D495
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 12)                 ;B4D498
    %AICMD0x19($0041, $00)                                     ;B4D49C
    %AICMD0x13_Wait(10)                                        ;B4D4A0
    %AICMD0x3D_TeleportToArea(!AREA_ENDING00)                  ;B4D4A3
    %AICMD0x10_End()                                           ;B4D4A5
pAIScripting0x38_L001:
    %AICMD0x1A($0078, $0078, aAIScriptingData_L004, $03)                     ;B4D4A6
    %AICMD0x1B($01E7, $00)                                     ;B4D4AE
    %AICMD0x13_Wait(120)                                       ;B4D4B2
    %AICMD0x1B($01F3, $00)                                     ;B4D4B5
    %AICMD0x13_Wait(120)                                       ;B4D4B9
    %AICMD0x1B($01F6, $00)                                     ;B4D4BC
    %AICMD0x13_Wait(120)                                       ;B4D4C0
    %AICMD0x1B($01EC, $01)                                     ;B4D4C3
    %AICMD0x0D($01, $00, $30, $01)                             ;B4D4C7
    %AICMD0x1B($01EE, $01)                                     ;B4D4CC
    %AICMD0x13_Wait(120)                                       ;B4D4D0
    %AICMD0x1B($01EC, $00)                                     ;B4D4D3
    %AICMD0x0D($FF, $00, $30, $01)                             ;B4D4D7
    %AICMD0x1B($01EA, $00)                                     ;B4D4DC
    %AICMD0x13_Wait(30)                                        ;B4D4E0
    %AICMD0x0B_SetScriptFlag($00)                                            ;B4D4E3
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B4D4E5
    %AICMD0x1B($01F8, $00)                                     ;B4D4E7
    %AICMD0x13_Wait(60)                                        ;B4D4EB
    %AICMD0x0B_SetScriptFlag($02)                                            ;B4D4EE
    %AICMD0x1B($01EC, $00)                                     ;B4D4F0
    %AICMD0x0D($FF, $00, $2A, $01)                             ;B4D4F4
    %AICMD0x1B($01ED, $00)                                     ;B4D4F9
pAIScripting0x38_L002:
    %AICMD0x13_Wait(1)                                         ;B4D4FD
    %AICMD0x12_Jump(pAIScripting0x38_L002)                                   ;B4D500
pAIScripting0x38_L003:
    %AICMD0x1A($0068, $0068, aAIScriptingData_L006, $02)                     ;B4D503
pAIScripting0x38_L004:
    %AICMD0x1B($0203, $01)                                     ;B4D50B
    %AICMD0x13_Wait(80)                                        ;B4D50F
    %AICMD0x1B($0200, $01)                                     ;B4D512
    %AICMD0x13_Wait(180)                                       ;B4D516
    %AICMD0x1B($0204, $01)                                     ;B4D519
    %AICMD0x13_Wait(60)                                        ;B4D51D
    %AICMD0x1B($0205, $01)                                     ;B4D520
    %AICMD0x13_Wait(90)                                        ;B4D524
    %AICMD0x1B($0200, $01)                                     ;B4D527
    %AICMD0x13_Wait(120)                                       ;B4D52B
    %AICMD0x12_Jump(pAIScripting0x38_L004)                                   ;B4D52E
