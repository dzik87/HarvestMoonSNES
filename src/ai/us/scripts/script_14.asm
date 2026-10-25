

    incsrc "../../../../build/gen/ai/slots_14.asm"
 
pAIScripting0x14_Data01:
 
    %AICMD0x50()                                               ;B489F2
    %AICMD0x01_UnfreezeTime()                                  ;B489F3
    %AICMD0x03_SetHour($07)                                    ;B489F4
    %AICMD0x05_SetTransferPosition(136, 344)                   ;B489F6
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B489FB
    %AICMD0x08_EnableAIControl()                               ;B489FD
    %AICMD0x09_StartScript($01, pAIScripting0x14_L001)                                   ;B489FE
    %AICMD0x38_WaitForFadeIn()                                               ;B48A02
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 80)                  ;B48A03
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B48A07
    %AICMD0x0B_SetScriptFlag($00)                                            ;B48A09
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B48A0B
    %AICMD0x0F_ScreenFadeout($01)                              ;B48A0D
    %AICMD0x09_StartScript($02, pAIScripting0x14_L006)                                   ;B48A0F
    %AICMD0x0A_ScreenFadein($01)                                            ;B48A13
    %AICMD0x0B_SetScriptFlag($02)                                            ;B48A15
    %AICMD0x0C_WaitForScriptFlag($04)                                            ;B48A17
    %AICMD0x11_EnableUserControl()                             ;B48A19
    %AICMD0x10_End()                                           ;B48A1A
pAIScripting0x14_L001:
    %AICMD0x1A($FFF0, $01A8, aAIScriptingData_L059, $02)                     ;B48A1B
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B48A23
    %AICMD0x0D($01, $00, $60, $01)                             ;B48A25
    %AICMD0x1D_ShowDialog($0149, $00)                          ;B48A2A
    %AICMD0x20_JumpIfChoice(0, pAIScripting0x14_L002)                        ;B48A2E
    %AICMD0x20_JumpIfChoice(1, pAIScripting0x14_L003)                        ;B48A32
pAIScripting0x14_L002:
    %AICMD0x0B_SetScriptFlag($01)                                            ;B48A36
    %AICMD0x0C_WaitForScriptFlag($02)                                            ;B48A38
    %AICMD0x1B($02BB, $00)                                     ;B48A3A
    %AICMD0x0D($00, $01, $20, $01)                             ;B48A3E
    %AICMD0x1B($02BF, $00)                                     ;B48A43
    %AICMD0x0D($FF, $00, $20, $01)                             ;B48A47
    %AICMD0x1B($02BB, $00)                                     ;B48A4C
    %AICMD0x1C_ShowDialog($014A, $00)                          ;B48A50
    %AICMD0x23_OrWithIndexedValue(strcFlags.event1, $06)       ;B48A54
    %AICMD0x23_OrWithIndexedValue(strcFlags.event1, $07)       ;B48A59
    %AICMD0x12_Jump(pAIScripting0x14_L004)                                   ;B48A5E
pAIScripting0x14_L003:
    %AICMD0x1C_ShowDialog($014C, $00)                          ;B48A61
    %AICMD0x12_Jump(pAIScripting0x14_L005)                                   ;B48A65
pAIScripting0x14_L004:
    %AICMD0x1B($02BF, $00)                                     ;B48A68
    %AICMD0x0D($FF, $00, $40, $01)                             ;B48A6C
    %AICMD0x0B_SetScriptFlag($03)                                            ;B48A71
    %AICMD0x37()                                               ;B48A73
    %AICMD0x10_End()                                           ;B48A74
pAIScripting0x14_L005:
    %AICMD0x1B($02BB, $00)                                     ;B48A75
    %AICMD0x0D($00, $01, $20, $01)                             ;B48A79
    %AICMD0x1B($02BF, $00)                                     ;B48A7E
    %AICMD0x0D($FF, $00, $A0, $01)                             ;B48A82
    %AICMD0x0B_SetScriptFlag($04)                                            ;B48A87
    %AICMD0x37()                                               ;B48A89
    %AICMD0x10_End()                                           ;B48A8A
pAIScripting0x14_L006:
    %AICMD0x1A($0048, $01E8, aAIScriptingData_L002, $03)                     ;B48A8B
    %AICMD0x0C_WaitForScriptFlag($03)                                            ;B48A93
    %AICMD0x1B($01A7, $00)                                     ;B48A95
    %AICMD0x0D($00, $FF, $10, $01)                             ;B48A99
    %AICMD0x1B($018B, $00)                                     ;B48A9E
    %AICMD0x0D($FF, $00, $40, $01)                             ;B48AA2
    %AICMD0x0B_SetScriptFlag($04)                                            ;B48AA7
    %AICMD0x37()                                               ;B48AA9
    %AICMD0x10_End()                                           ;B48AAA


pAIScripting0x14_Data02:
 
    %AICMD0x4F_DisableToolUse()                                               ;B48AAB
    %AICMD0x50()                                               ;B48AAC
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $09)       ;B48AAD
    %AICMD0x00_SetMusic($0A, $B4)                              ;B48AB2
    %AICMD0x05_SetTransferPosition(128, 456)                   ;B48AB5
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B48ABA
    %AICMD0x08_EnableAIControl()                               ;B48ABC
    %AICMD0x02_FreezeTime()                                    ;B48ABD
    %AICMD0x03_SetHour($07)                                    ;B48ABE
    %AICMD0x09_StartScript($01, pAIScripting0x14_L007)                                   ;B48AC0
    %AICMD0x19($00E8, $00)                                     ;B48AC4
    %AICMD0x06_SetDestinationArea(!AREA_MOUNTAINTOPBEAN)       ;B48AC8
    %AICMD0x38_WaitForFadeIn()                                               ;B48ACA
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B48ACB
    %AICMD0x3D_TeleportToArea(!AREA_GOLDCHICKEN)               ;B48ACD
    %AICMD0x10_End()                                           ;B48ACF
pAIScripting0x14_L007:
    %AICMD0x1A($0080, $01C8, aAIScriptingData_L001, $01)                     ;B48AD0
    %AICMD0x0D($00, $FF, $40, $01)                             ;B48AD8
    %AICMD0x29_SetMapScrooling(0, -1, 64)                      ;B48ADD
    %AICMD0x0D($00, $FF, $50, $01)                             ;B48AE3
    %AICMD0x1B($0006, $00)                                     ;B48AE8
    %AICMD0x13_Wait(60)                                        ;B48AEC
    %AICMD0x1B($0063, $00)                                     ;B48AEF
    %AICMD0x0D($00, $FF, $90, $02)                             ;B48AF3
    %AICMD0x0B_SetScriptFlag($00)                                            ;B48AF8
pAIScripting0x14_L008:
    %AICMD0x13_Wait(1)                                         ;B48AFA
    %AICMD0x12_Jump(pAIScripting0x14_L008)                                   ;B48AFD


pAIScripting0x14_Data03:
 
    %AICMD0x4F_DisableToolUse()                                               ;B48B00
    %AICMD0x50()                                               ;B48B01
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $09)       ;B48B02
    %AICMD0x03_SetHour($07)                                    ;B48B07
    %AICMD0x05_SetTransferPosition(136, 632)                   ;B48B09
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B48B0E
    %AICMD0x09_StartScript($01, pAIScripting0x14_L009)                                   ;B48B10
    %AICMD0x28_ClearBit(strcFlags.event3, $09)                          ;B48B14
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $0A)       ;B48B19
    %AICMD0x06_SetDestinationArea(!AREA_GOLDCHICKEN)           ;B48B1E
    %AICMD0x38_WaitForFadeIn()                                               ;B48B20
    %AICMD0x11_EnableUserControl()                             ;B48B21
    %AICMD0x10_End()                                           ;B48B22
pAIScripting0x14_L009:
    %AICMD0x1A($0088, $00CC, aAIScriptingData_L103, $00)                     ;B48B23
pAIScripting0x14_L010:
    %AICMD0x1F(pAIScripting0x14_L012)                                        ;B48B2B
    %AICMD0x12_Jump(pAIScripting0x14_L010)                                   ;B48B2E
pAIScripting0x14_L011:
    %AICMD0x1F(pAIScripting0x14_L014)                                        ;B48B31
    %AICMD0x12_Jump(pAIScripting0x14_L011)                                   ;B48B34
pAIScripting0x14_L012:
    %AICMD0x1D_ShowDialog($0336, $00)                          ;B48B37
    %AICMD0x20_JumpIfChoice(1, pAIScripting0x14_L013)                        ;B48B3B
    %AICMD0x08_EnableAIControl()                               ;B48B3F
    %AICMD0x1B($021B, $00)                                     ;B48B40
    %AICMD0x09_StartScript($02, pAIScripting0x14_L015)                                   ;B48B44
    %AICMD0x0D($FF, $FF, $24, $02)                             ;B48B48
    %AICMD0x13_Wait(30)                                        ;B48B4D
    %AICMD0x1B($021C, $00)                                     ;B48B50
    %AICMD0x13_Wait(120)                                       ;B48B54
    %AICMD0x1C_ShowDialog($0337, $00)                          ;B48B57
    %AICMD0x0B_SetScriptFlag($00)                                            ;B48B5B
    %AICMD0x2A($0043)                                          ;B48B5D
    %AICMD0x4B($C3, $0040, $0080)                              ;B48B60
    %AICMD0x3E_SetCarryItem($23)                               ;B48B66
    %AICMD0x13_Wait(60)                                        ;B48B68
    %AICMD0x32_SetValue16($8000D4, $0000)                                 ;B48B6B
    %AICMD0x28_ClearBit($8000D2, $01)                                   ;B48B71
    %AICMD0x11_EnableUserControl()                             ;B48B76
    %AICMD0x12_Jump(pAIScripting0x14_L011)                                   ;B48B77
pAIScripting0x14_L013:
    %AICMD0x2A($0043)                                          ;B48B7A
    %AICMD0x4B($C3, $0040, $0080)                              ;B48B7D
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily2, $0C)       ;B48B83
pAIScripting0x14_L014:
    %AICMD0x1C_ShowDialog($0338, $00)                          ;B48B88
    %AICMD0x12_Jump(pAIScripting0x14_L011)                                   ;B48B8C
pAIScripting0x14_L015:
    %AICMD0x1A($0088, $00C8, aAIScriptingData_L102, $00)                     ;B48B8F
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B48B97
    %AICMD0x37()                                               ;B48B99
    %AICMD0x10_End()                                           ;B48B9A


pAIScripting0x14_Data04:
 
    %AICMD0x4F_DisableToolUse()                                               ;B48B9B
    %AICMD0x50()                                               ;B48B9C
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $09)       ;B48B9D
    %AICMD0x14_JumpIfFlagSet(strcFlags.daily2, $0C, pAIScripting0x14_L020)   ;B48BA2
    %AICMD0x08_EnableAIControl()                               ;B48BA9
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B48BAA
    %AICMD0x09_StartScript($01, pAIScripting0x14_L016)                                   ;B48BAC
    %AICMD0x09_StartScript($02, pAIScripting0x14_L018)                                   ;B48BB0
    %AICMD0x38_WaitForFadeIn()                                               ;B48BB4
    %AICMD0x1C_ShowDialog($0360, $00)                          ;B48BB5
    %AICMD0x42_AddValue24(nMoney, 1000)                        ;B48BB9
    %AICMD0x3C()                                               ;B48BC0
    %AICMD0x10_End()                                           ;B48BC1
pAIScripting0x14_L016:
    %AICMD0x1A($0248, $0168, aAIScriptingData_L057, $00)                     ;B48BC2
pAIScripting0x14_L017:
    %AICMD0x13_Wait(1)                                         ;B48BCA
    %AICMD0x12_Jump(pAIScripting0x14_L017)                                   ;B48BCD
pAIScripting0x14_L018:
    %AICMD0x1A($0258, $0168, aAIScriptingData_L102, $00)                     ;B48BD0
pAIScripting0x14_L019:
    %AICMD0x13_Wait(1)                                         ;B48BD8
    %AICMD0x12_Jump(pAIScripting0x14_L019)                                   ;B48BDB


pAIScripting0x14_L020:
    %AICMD0x4F_DisableToolUse()                                               ;B48BDE
    %AICMD0x50()                                               ;B48BDF
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $09)       ;B48BE0
    %AICMD0x05_SetTransferPosition(136, 456)                   ;B48BE5
    %AICMD0x08_EnableAIControl()                               ;B48BEA
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 0, pAIScripting0x14_L021)     ;B48BEB
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 1, pAIScripting0x14_L022)     ;B48BF2
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 2, pAIScripting0x14_L023)     ;B48BF9
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, pAIScripting0x14_L024)     ;B48C00
pAIScripting0x14_L021:
    %AICMD0x06_SetDestinationArea(!AREA_FARMSPRING)            ;B48C07
    %AICMD0x12_Jump(pAIScripting0x14_L025)                                   ;B48C09
pAIScripting0x14_L022:
    %AICMD0x06_SetDestinationArea(!AREA_FARMSUMMER)            ;B48C0C
    %AICMD0x12_Jump(pAIScripting0x14_L025)                                   ;B48C0E
pAIScripting0x14_L023:
    %AICMD0x06_SetDestinationArea(!AREA_FARMFALL)              ;B48C11
    %AICMD0x12_Jump(pAIScripting0x14_L025)                                   ;B48C13
pAIScripting0x14_L024:
    %AICMD0x06_SetDestinationArea(!AREA_FARMWINTER)            ;B48C16
    %AICMD0x12_Jump(pAIScripting0x14_L025)                                   ;B48C18
pAIScripting0x14_L025:
    %AICMD0x38_WaitForFadeIn()                                               ;B48C1B
    %AICMD0x19($004D, $00)                                     ;B48C1C
    %AICMD0x13_Wait(120)                                       ;B48C20
    %AICMD0x3C()                                               ;B48C23
    %AICMD0x10_End()                                           ;B48C24
