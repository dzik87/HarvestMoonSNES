

    incsrc "../../../../build/gen/ai/slots_42.asm"
 
pAIScripting0x42_Data01:
 
    %AICMD0x00_SetMusic($10, $B4)                              ;B4E9A9
    %AICMD0x02_FreezeTime()                                    ;B4E9AC
    %AICMD0x03_SetHour($06)                                    ;B4E9AD
    %AICMD0x05_SetTransferPosition(96, 200)                    ;B4E9AF
    %AICMD0x40_DisableTileInteractions()                       ;B4E9B4
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B4E9B5
    %AICMD0x08_EnableAIControl()                               ;B4E9B7
    %AICMD0x09_StartScript($01, pAIScripting0x42_L001)                                   ;B4E9B8
    %AICMD0x09_StartScript($02, pAIScripting0x42_L003)                                   ;B4E9BC
    %AICMD0x09_StartScript($03, pAIScripting0x42_L005)                                   ;B4E9C0
    %AICMD0x09_StartScript($04, pAIScripting0x42_L007)                                   ;B4E9C4
    %AICMD0x09_StartScript($05, pAIScripting0x42_L015)                                   ;B4E9C8
    %AICMD0x09_StartScript($06, pAIScripting0x42_L013)                                   ;B4E9CC
    %AICMD0x09_StartScript($07, pAIScripting0x42_L017)                                   ;B4E9D0
    %AICMD0x09_StartScript($08, pAIScripting0x42_L019)                                   ;B4E9D4
    %AICMD0x09_StartScript($09, pAIScripting0x42_L021)                                   ;B4E9D8
    %AICMD0x09_StartScript($0A, pAIScripting0x42_L009)                                   ;B4E9DC
    %AICMD0x09_StartScript($0B, pAIScripting0x42_L011)                                   ;B4E9E0
    %AICMD0x06_SetDestinationArea(!AREA_ENDING12)              ;B4E9E4
    %AICMD0x38_WaitForFadeIn()                                               ;B4E9E6
    %AICMD0x0C_WaitForScriptFlag($02)                                            ;B4E9E7
    %AICMD0x13_Wait(180)                                       ;B4E9E9
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 80)                    ;B4E9EC
    %AICMD0x13_Wait(60)                                        ;B4E9F0
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 24)                 ;B4E9F3
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4E9F7
    %AICMD0x13_Wait(60)                                        ;B4E9F9
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4E9FC
    %AICMD0x13_Wait(120)                                       ;B4E9FE
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4EA01
    %AICMD0x13_Wait(60)                                        ;B4EA03
    %AICMD0x0C_WaitForScriptFlag($03)                                            ;B4EA06
    %AICMD0x3D_TeleportToArea(!AREA_ENDING00)                  ;B4EA08
    %AICMD0x10_End()                                           ;B4EA0A
pAIScripting0x42_L001:
    %AICMD0x1A($0110, $0078, aAIScriptingData_L004, $00)                     ;B4EA0B
    %AICMD0x13_Wait(120)                                       ;B4EA13
    %AICMD0x1B($01EC, $00)                                     ;B4EA16
    %AICMD0x0D($FF, $00, $48, $01)                             ;B4EA1A
    %AICMD0x13_Wait(120)                                       ;B4EA1F
    %AICMD0x1B($01E9, $00)                                     ;B4EA22
    %AICMD0x0D($FF, $00, $20, $02)                             ;B4EA26
    %AICMD0x13_Wait(60)                                        ;B4EA2B
    %AICMD0x1B($01EA, $00)                                     ;B4EA2E
    %AICMD0x13_Wait(180)                                       ;B4EA32
    %AICMD0x1B($01EB, $00)                                     ;B4EA35
    %AICMD0x13_Wait(80)                                        ;B4EA39
    %AICMD0x1B($01E9, $00)                                     ;B4EA3C
    %AICMD0x0D($FF, $00, $20, $02)                             ;B4EA40
    %AICMD0x13_Wait(80)                                        ;B4EA45
    %AICMD0x1B($01DB, $00)                                     ;B4EA48
    %AICMD0x13_Wait(120)                                       ;B4EA4C
    %AICMD0x1B($01DC, $00)                                     ;B4EA4F
    %AICMD0x13_Wait(60)                                        ;B4EA53
    %AICMD0x1B($01EC, $01)                                     ;B4EA56
    %AICMD0x0D($01, $00, $68, $01)                             ;B4EA5A
    %AICMD0x0B_SetScriptFlag($03)                                            ;B4EA5F
    %AICMD0x10_End()                                           ;B4EA61
pAIScripting0x42_L002:
    %AICMD0x13_Wait(1)                                         ;B4EA62
    %AICMD0x12_Jump(pAIScripting0x42_L002)                                   ;B4EA65
pAIScripting0x42_L003:
    %AICMD0x1A($0068, $0058, aAIScriptingData_L071, $00)                     ;B4EA68
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B4EA70
    %AICMD0x1B($02E3, $00)                                     ;B4EA72
    %AICMD0x0D($00, $01, $24, $01)                             ;B4EA76
    %AICMD0x13_Wait(120)                                       ;B4EA7B
    %AICMD0x0B_SetScriptFlag($01)                                            ;B4EA7E
    %AICMD0x1B($02E3, $00)                                     ;B4EA80
    %AICMD0x0D($00, $FF, $20, $01)                             ;B4EA84
    %AICMD0x13_Wait(120)                                       ;B4EA89
pAIScripting0x42_L004:
    %AICMD0x13_Wait(1)                                         ;B4EA8C
    %AICMD0x12_Jump(pAIScripting0x42_L004)                                   ;B4EA8F
pAIScripting0x42_L005:
    %AICMD0x1A($0068, $0068, aAIScriptingData_L079, $00)                     ;B4EA92
    %AICMD0x13_Wait(120)                                       ;B4EA9A
    %AICMD0x0D($00, $01, $20, $01)                             ;B4EA9D
    %AICMD0x1B($02FB, $00)                                     ;B4EAA2
    %AICMD0x13_Wait(60)                                        ;B4EAA6
    %AICMD0x0B_SetScriptFlag($00)                                            ;B4EAA9
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B4EAAB
    %AICMD0x1B($02FB, $00)                                     ;B4EAAD
    %AICMD0x0D($00, $FF, $20, $01)                             ;B4EAB1
    %AICMD0x13_Wait(120)                                       ;B4EAB6
pAIScripting0x42_L006:
    %AICMD0x13_Wait(1)                                         ;B4EAB9
    %AICMD0x12_Jump(pAIScripting0x42_L006)                                   ;B4EABC
pAIScripting0x42_L007:
    %AICMD0x1A($0088, $0058, aAIScriptingData_L077, $02)                     ;B4EABF
    %AICMD0x13_Wait(180)                                       ;B4EAC7
    %AICMD0x0D($01, $00, $10, $02)                             ;B4EACA
    %AICMD0x13_Wait(120)                                       ;B4EACF
    %AICMD0x0C_WaitForScriptFlag($02)                                            ;B4EAD2
    %AICMD0x1B($02F7, $01)                                     ;B4EAD4
    %AICMD0x0D($FF, $00, $1E, $02)                             ;B4EAD8
    %AICMD0x13_Wait(60)                                        ;B4EADD
    %AICMD0x1B($02F3, $00)                                     ;B4EAE0
    %AICMD0x13_Wait(60)                                        ;B4EAE4
pAIScripting0x42_L008:
    %AICMD0x13_Wait(1)                                         ;B4EAE7
    %AICMD0x12_Jump(pAIScripting0x42_L008)                                   ;B4EAEA
pAIScripting0x42_L009:
    %AICMD0x1A($0058, $0058, aAIScriptingData_L069, $00)                     ;B4EAED
pAIScripting0x42_L010:
    %AICMD0x13_Wait(1)                                         ;B4EAF5
    %AICMD0x12_Jump(pAIScripting0x42_L010)                                   ;B4EAF8
pAIScripting0x42_L011:
    %AICMD0x1A($0078, $0058, aAIScriptingData_L070, $00)                     ;B4EAFB
    %AICMD0x13_Wait(180)                                       ;B4EB03
    %AICMD0x1B($02E1, $01)                                     ;B4EB06
    %AICMD0x0D($01, $00, $10, $01)                             ;B4EB0A
    %AICMD0x13_Wait(90)                                        ;B4EB0F
    %AICMD0x0B_SetScriptFlag($02)                                            ;B4EB12
    %AICMD0x1B($02E1, $01)                                     ;B4EB14
    %AICMD0x0D($FF, $00, $20, $02)                             ;B4EB18
    %AICMD0x13_Wait(60)                                        ;B4EB1D
    %AICMD0x1B($02DF, $00)                                     ;B4EB20
    %AICMD0x13_Wait(60)                                        ;B4EB24
pAIScripting0x42_L012:
    %AICMD0x13_Wait(1)                                         ;B4EB27
    %AICMD0x12_Jump(pAIScripting0x42_L012)                                   ;B4EB2A
pAIScripting0x42_L013:
    %AICMD0x1A($0028, $0068, aAIScriptingData_L006, $02)                     ;B4EB2D
pAIScripting0x42_L014:
    %AICMD0x1B($0201, $01)                                     ;B4EB35
    %AICMD0x13_Wait(180)                                       ;B4EB39
    %AICMD0x1B($0201, $01)                                     ;B4EB3C
    %AICMD0x13_Wait(180)                                       ;B4EB40
    %AICMD0x1B($0203, $01)                                     ;B4EB43
    %AICMD0x13_Wait(240)                                       ;B4EB47
    %AICMD0x1B($0205, $01)                                     ;B4EB4A
    %AICMD0x13_Wait(180)                                       ;B4EB4E
    %AICMD0x12_Jump(pAIScripting0x42_L014)                                   ;B4EB51
pAIScripting0x42_L015:
    %AICMD0x1A($00A8, $0098, aAIScriptingData_L152, $03)                     ;B4EB54
pAIScripting0x42_L016:
    %AICMD0x13_Wait(120)                                       ;B4EB5C
    %AICMD0x1B($0192, $01)                                     ;B4EB5F
    %AICMD0x13_Wait(120)                                       ;B4EB63
    %AICMD0x1B($0195, $01)                                     ;B4EB66
    %AICMD0x13_Wait(1)                                         ;B4EB6A
    %AICMD0x12_Jump(pAIScripting0x42_L016)                                   ;B4EB6D
pAIScripting0x42_L017:
    %AICMD0x1A($00D8, $0058, aAIScriptingData_L008, $03)                     ;B4EB70
pAIScripting0x42_L018:
    %AICMD0x13_Wait(1)                                         ;B4EB78
    %AICMD0x12_Jump(pAIScripting0x42_L018)                                   ;B4EB7B
pAIScripting0x42_L019:
    %AICMD0x1A($00C8, $0068, aAIScriptingData_L009, $03)                     ;B4EB7E
    %AICMD0x22($08, $08, $01, aAIScriptingData_L009, $04)                    ;B4EB86
pAIScripting0x42_L020:
    %AICMD0x13_Wait(1)                                         ;B4EB8D
    %AICMD0x12_Jump(pAIScripting0x42_L020)                                   ;B4EB90
pAIScripting0x42_L021:
    %AICMD0x1A($0098, $0024, aAIScriptingData_L093, $03)                     ;B4EB93
pAIScripting0x42_L022:
    %AICMD0x13_Wait(1)                                         ;B4EB9B
    %AICMD0x12_Jump(pAIScripting0x42_L022)                                   ;B4EB9E


pAIScripting0x42_Data02:
 
    %AICMD0x00_SetMusic($10, $B4)                              ;B4EBA1
    %AICMD0x02_FreezeTime()                                    ;B4EBA4
    %AICMD0x03_SetHour($06)                                    ;B4EBA5
    %AICMD0x05_SetTransferPosition(120, 136)                   ;B4EBA7
    %AICMD0x40_DisableTileInteractions()                       ;B4EBAC
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4EBAD
    %AICMD0x08_EnableAIControl()                               ;B4EBAF
    %AICMD0x09_StartScript($01, pAIScripting0x42_L023)                                   ;B4EBB0
    %AICMD0x09_StartScript($02, pAIScripting0x42_L025)                                   ;B4EBB4
    %AICMD0x09_StartScript($03, pAIScripting0x42_L027)                                   ;B4EBB8
    %AICMD0x09_StartScript($04, pAIScripting0x42_L029)                                   ;B4EBBC
    %AICMD0x09_StartScript($05, pAIScripting0x42_L037)                                   ;B4EBC0
    %AICMD0x09_StartScript($06, pAIScripting0x42_L035)                                   ;B4EBC4
    %AICMD0x09_StartScript($07, pAIScripting0x42_L039)                                   ;B4EBC8
    %AICMD0x09_StartScript($08, pAIScripting0x42_L041)                                   ;B4EBCC
    %AICMD0x09_StartScript($09, pAIScripting0x42_L043)                                   ;B4EBD0
    %AICMD0x09_StartScript($0A, pAIScripting0x42_L031)                                   ;B4EBD4
    %AICMD0x09_StartScript($0B, pAIScripting0x42_L033)                                   ;B4EBD8
    %AICMD0x09_StartScript($0C, pAIScripting0x42_L045)                                   ;B4EBDC
    %AICMD0x06_SetDestinationArea(!AREA_ENDING13)              ;B4EBE0
    %AICMD0x38_WaitForFadeIn()                                               ;B4EBE2
    %AICMD0x01_UnfreezeTime()                                  ;B4EBE3
    %AICMD0x24_NextHourPalette($74)                            ;B4EBE4
    %AICMD0x13_Wait(180)                                       ;B4EBE6
    %AICMD0x02_FreezeTime()                                    ;B4EBE9
    %AICMD0x13_Wait(240)                                       ;B4EBEA
    %AICMD0x3D_TeleportToArea(!AREA_ENDING00)                  ;B4EBED
    %AICMD0x10_End()                                           ;B4EBEF
pAIScripting0x42_L023:
    %AICMD0x1A($00A8, $0088, aAIScriptingData_L004, $00)                     ;B4EBF0
    %AICMD0x13_Wait(1)                                         ;B4EBF8
    %AICMD0x1B($034B, $00)                                     ;B4EBFB
pAIScripting0x42_L024:
    %AICMD0x13_Wait(1)                                         ;B4EBFF
    %AICMD0x12_Jump(pAIScripting0x42_L024)                                   ;B4EC02
pAIScripting0x42_L025:
    %AICMD0x1A($0068, $0068, aAIScriptingData_L071, $00)                     ;B4EC05
pAIScripting0x42_L026:
    %AICMD0x13_Wait(1)                                         ;B4EC0D
    %AICMD0x12_Jump(pAIScripting0x42_L026)                                   ;B4EC10
pAIScripting0x42_L027:
    %AICMD0x1A($0068, $0078, aAIScriptingData_L078, $00)                     ;B4EC13
pAIScripting0x42_L028:
    %AICMD0x13_Wait(1)                                         ;B4EC1B
    %AICMD0x12_Jump(pAIScripting0x42_L028)                                   ;B4EC1E
pAIScripting0x42_L029:
    %AICMD0x1A($0088, $0068, aAIScriptingData_L076, $00)                     ;B4EC21
pAIScripting0x42_L030:
    %AICMD0x13_Wait(1)                                         ;B4EC29
    %AICMD0x12_Jump(pAIScripting0x42_L030)                                   ;B4EC2C
pAIScripting0x42_L031:
    %AICMD0x1A($0058, $0068, aAIScriptingData_L069, $00)                     ;B4EC2F
pAIScripting0x42_L032:
    %AICMD0x13_Wait(1)                                         ;B4EC37
    %AICMD0x12_Jump(pAIScripting0x42_L032)                                   ;B4EC3A
pAIScripting0x42_L033:
    %AICMD0x1A($0078, $0068, aAIScriptingData_L070, $00)                     ;B4EC3D
    %AICMD0x13_Wait(1)                                         ;B4EC45
    %AICMD0x1B($0349, $00)                                     ;B4EC48
pAIScripting0x42_L034:
    %AICMD0x13_Wait(1)                                         ;B4EC4C
    %AICMD0x12_Jump(pAIScripting0x42_L034)                                   ;B4EC4F
pAIScripting0x42_L035:
    %AICMD0x1A($0048, $0088, aAIScriptingData_L006, $02)                     ;B4EC52
pAIScripting0x42_L036:
    %AICMD0x13_Wait(1)                                         ;B4EC5A
    %AICMD0x12_Jump(pAIScripting0x42_L036)                                   ;B4EC5D
pAIScripting0x42_L037:
    %AICMD0x1A($0088, $0098, aAIScriptingData_L002, $03)                     ;B4EC60
pAIScripting0x42_L038:
    %AICMD0x13_Wait(1)                                         ;B4EC68
    %AICMD0x12_Jump(pAIScripting0x42_L038)                                   ;B4EC6B
pAIScripting0x42_L039:
    %AICMD0x1A($00C0, $0070, aAIScriptingData_L008, $03)                     ;B4EC6E
    %AICMD0x13_Wait(1)                                         ;B4EC76
    %AICMD0x1B($0414, $00)                                     ;B4EC79
pAIScripting0x42_L040:
    %AICMD0x13_Wait(1)                                         ;B4EC7D
    %AICMD0x12_Jump(pAIScripting0x42_L040)                                   ;B4EC80
pAIScripting0x42_L041:
    %AICMD0x1A($00C8, $0078, aAIScriptingData_L009, $03)                     ;B4EC83
    %AICMD0x13_Wait(1)                                         ;B4EC8B
    %AICMD0x1B($041C, $00)                                     ;B4EC8E
pAIScripting0x42_L042:
    %AICMD0x13_Wait(1)                                         ;B4EC92
    %AICMD0x12_Jump(pAIScripting0x42_L042)                                   ;B4EC95
pAIScripting0x42_L043:
    %AICMD0x1A($00A8, $00A0, aAIScriptingData_L080, $03)                     ;B4EC98
pAIScripting0x42_L044:
    %AICMD0x13_Wait(1)                                         ;B4ECA0
    %AICMD0x12_Jump(pAIScripting0x42_L044)                                   ;B4ECA3
pAIScripting0x42_L045:
    %AICMD0x1A($0098, $00A0, aAIScriptingData_L080, $00)                     ;B4ECA6
pAIScripting0x42_L046:
    %AICMD0x13_Wait(1)                                         ;B4ECAE
    %AICMD0x12_Jump(pAIScripting0x42_L046)                                   ;B4ECB1


pAIScripting0x42_Data03:
 
    %AICMD0x00_SetMusic($00, $00)                              ;B4ECB4


    pad $B4FFFF
