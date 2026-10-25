

pAIScripting0x35:
    dw pAIScripting0x35_Data01                                            ;B4D011|        |B4D031;
    dw pAIScripting0x36                                        ;B4D013|        |B4D160;
    dw pAIScripting0x36                                        ;B4D015|        |B4D160;
    dw pAIScripting0x36                                        ;B4D017|        |B4D160;
    dw pAIScripting0x36                                        ;B4D019|        |B4D160;
    dw pAIScripting0x36                                        ;B4D01B|        |B4D160;
    dw pAIScripting0x36                                        ;B4D01D|        |B4D160;
    dw pAIScripting0x36                                        ;B4D01F|        |B4D160;
    dw pAIScripting0x36                                        ;B4D021|        |B4D160;
    dw pAIScripting0x36                                        ;B4D023|        |B4D160;
    dw pAIScripting0x36                                        ;B4D025|        |B4D160;
    dw pAIScripting0x36                                        ;B4D027|        |B4D160;
    dw pAIScripting0x36                                        ;B4D029|        |B4D160;
    dw pAIScripting0x36                                        ;B4D02B|        |B4D160;
    dw pAIScripting0x36                                        ;B4D02D|        |B4D160;
    dw pAIScripting0x36                                        ;B4D02F|        |B4D160;
 
pAIScripting0x35_Data01:
    %AICMD0x47_SetValue8(wram80(strcPlayerData.toolEquipped), 21)                          ;B4D031
    %AICMD0x00_SetMusic($10, $B4)                              ;B4D036
    %AICMD0x02_FreezeTime()                                    ;B4D039
    %AICMD0x03_SetHour($06)                                    ;B4D03A
    %AICMD0x05_SetTransferPosition(264, 120)                   ;B4D03C
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4D041
    %AICMD0x08_EnableAIControl()                               ;B4D043
    %AICMD0x09_StartScript($01, pAIScripting0x35_L001)                                   ;B4D044
    %AICMD0x09_StartScript($02, pAIScripting0x35_L003)                                   ;B4D048
    %AICMD0x06_SetDestinationArea(!AREA_ENDING08)              ;B4D04C
    %AICMD0x38_WaitForFadeIn()                                               ;B4D04E
    %AICMD0x13_Wait(180)                                       ;B4D04F
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 64)                   ;B4D052
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4D056
    %AICMD0x13_Wait(30)                                        ;B4D058
    %AICMD0x3E_SetCarryItem($11)                               ;B4D05B
    %AICMD0x13_Wait(60)                                        ;B4D05D
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B4D060
    %AICMD0x13_Wait(30)                                        ;B4D062
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 32)                    ;B4D065
    %AICMD0x3F_ThrowCarriedItem()                              ;B4D069
    %AICMD0x0B_SetScriptFlag($00)                                            ;B4D06A
    %AICMD0x13_Wait(60)                                        ;B4D06C
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 32)                  ;B4D06F
    %AICMD0x13_Wait(30)                                        ;B4D073
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 16)                  ;B4D076
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4D07A
    %AICMD0x13_Wait(30)                                        ;B4D07C
    %AICMD0x3E_SetCarryItem($11)                               ;B4D07F
    %AICMD0x13_Wait(60)                                        ;B4D081
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B4D084
    %AICMD0x13_Wait(30)                                        ;B4D086
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 32)                    ;B4D089
    %AICMD0x13_Wait(30)                                        ;B4D08D
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B4D090
    %AICMD0x3F_ThrowCarriedItem()                              ;B4D092
    %AICMD0x0B_SetScriptFlag($01)                                            ;B4D093
    %AICMD0x13_Wait(60)                                        ;B4D095
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 24)                   ;B4D098
    %AICMD0x19($00A5, $00)                                     ;B4D09C
    %AICMD0x13_Wait(60)                                        ;B4D0A0
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 56)                  ;B4D0A3
    %AICMD0x56_UseEquippedItem()                               ;B4D0A7
    %AICMD0x13_Wait(120)                                       ;B4D0A8
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 16)                   ;B4D0AB
    %AICMD0x56_UseEquippedItem()                               ;B4D0AF
    %AICMD0x13_Wait(120)                                       ;B4D0B0
    %AICMD0x19($004A, $00)                                     ;B4D0B3
    %AICMD0x13_Wait(120)                                       ;B4D0B7
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 96)                  ;B4D0BA
    %AICMD0x13_Wait(30)                                        ;B4D0BE
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4D0C1
    %AICMD0x13_Wait(60)                                        ;B4D0C3
    %AICMD0x19($0030, $00)                                     ;B4D0C6
    %AICMD0x13_Wait(60)                                        ;B4D0CA
    %AICMD0x0B_SetScriptFlag($02)                                            ;B4D0CD
    %AICMD0x0C_WaitForScriptFlag($03)                                            ;B4D0CF
    %AICMD0x3D_TeleportToArea(!AREA_ENDING00)                  ;B4D0D1
    %AICMD0x10_End()                                           ;B4D0D3
pAIScripting0x35_L001:
    %AICMD0x1A($00A8, $0048, aAIScriptingData_L004, $00)                     ;B4D0D4
    %AICMD0x1B($01DB, $00)                                     ;B4D0DC
    %AICMD0x13_Wait(120)                                       ;B4D0E0
    %AICMD0x1B($01DA, $00)                                     ;B4D0E3
    %AICMD0x0D($00, $01, $20, $01)                             ;B4D0E7
    %AICMD0x1B($01DC, $00)                                     ;B4D0EC
    %AICMD0x13_Wait(120)                                       ;B4D0F0
    %AICMD0x1B($01DB, $00)                                     ;B4D0F3
    %AICMD0x13_Wait(120)                                       ;B4D0F7
    %AICMD0x1B($01DC, $01)                                     ;B4D0FA
    %AICMD0x13_Wait(60)                                        ;B4D0FE
    %AICMD0x0C_WaitForScriptFlag($02)                                            ;B4D101
    %AICMD0x1B($01DA, $00)                                     ;B4D103
    %AICMD0x0D($00, $01, $10, $01)                             ;B4D107
    %AICMD0x1B($01E9, $00)                                     ;B4D10C
    %AICMD0x13_Wait(30)                                        ;B4D110
    %AICMD0x0D($FF, $00, $20, $01)                             ;B4D113
    %AICMD0x1B($01F2, $00)                                     ;B4D118
    %AICMD0x13_Wait(120)                                       ;B4D11C
    %AICMD0x0B_SetScriptFlag($03)                                            ;B4D11F
pAIScripting0x35_L002:
    %AICMD0x13_Wait(1)                                         ;B4D121
    %AICMD0x12_Jump(pAIScripting0x35_L002)                                   ;B4D124
pAIScripting0x35_L003:
    %AICMD0x1A($0080, $0048, aAIScriptingData_L006, $03)                     ;B4D127
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B4D12F
    %AICMD0x1B($0208, $00)                                     ;B4D131
    %AICMD0x13_Wait(60)                                        ;B4D135
    %AICMD0x1B($0200, $00)                                     ;B4D138
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B4D13C
    %AICMD0x1B($0208, $00)                                     ;B4D13E
    %AICMD0x13_Wait(60)                                        ;B4D142
    %AICMD0x1B($0200, $00)                                     ;B4D145
    %AICMD0x13_Wait(120)                                       ;B4D149
    %AICMD0x1B($0203, $00)                                     ;B4D14C
    %AICMD0x13_Wait(120)                                       ;B4D150
    %AICMD0x1B($0205, $00)                                     ;B4D153
    %AICMD0x13_Wait(180)                                       ;B4D157
pAIScripting0x35_L004:
    %AICMD0x13_Wait(1)                                         ;B4D15A
    %AICMD0x12_Jump(pAIScripting0x35_L004)                                   ;B4D15D
