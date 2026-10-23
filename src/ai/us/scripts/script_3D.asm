

pAIScripting0x3D:
    dw DATA8_B4DFB4                                            ;B4DF94|        |B4DFB4;
    dw DATA8_B4E0F8                                            ;B4DF96|        |B4E0F8;
    dw pAIScripting0x3E                                        ;B4DF98|        |B4E200;
    dw pAIScripting0x3E                                        ;B4DF9A|        |B4E200;
    dw pAIScripting0x3E                                        ;B4DF9C|        |B4E200;
    dw pAIScripting0x3E                                        ;B4DF9E|        |B4E200;
    dw pAIScripting0x3E                                        ;B4DFA0|        |B4E200;
    dw pAIScripting0x3E                                        ;B4DFA2|        |B4E200;
    dw pAIScripting0x3E                                        ;B4DFA4|        |B4E200;
    dw pAIScripting0x3E                                        ;B4DFA6|        |B4E200;
    dw pAIScripting0x3E                                        ;B4DFA8|        |B4E200;
    dw pAIScripting0x3E                                        ;B4DFAA|        |B4E200;
    dw pAIScripting0x3E                                        ;B4DFAC|        |B4E200;
    dw pAIScripting0x3E                                        ;B4DFAE|        |B4E200;
    dw pAIScripting0x3E                                        ;B4DFB0|        |B4E200;
    dw pAIScripting0x3E                                        ;B4DFB2|        |B4E200;
 
DATA8_B4DFB4:
 
    %AICMD0x00_SetMusic($10, $B4)                              ;B4DFB4
    %AICMD0x02_FreezeTime()                                    ;B4DFB7
    %AICMD0x03_SetHour($06)                                    ;B4DFB8
    %AICMD0x05_SetTransferPosition(24, 152)                    ;B4DFBA
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4DFBF
    %AICMD0x40_DisableTileInteractions()                       ;B4DFC1
    %AICMD0x08_EnableAIControl()                               ;B4DFC2
    %AICMD0x09_StartScript($01, pAIScripting0x3D_L001)                                   ;B4DFC3
    %AICMD0x09_StartScript($02, pAIScripting0x3D_L005)                                   ;B4DFC7
    %AICMD0x06_SetDestinationArea(!AREA_ENDING06)              ;B4DFCB
    %AICMD0x38_WaitForFadeIn()                                               ;B4DFCD
    %AICMD0x13_Wait(120)                                       ;B4DFCE
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 56)                  ;B4DFD1
    %AICMD0x0B_SetScriptFlag($00)                                            ;B4DFD5
    %AICMD0x19($0052, $00)                                     ;B4DFD7
    %AICMD0x13_Wait(80)                                        ;B4DFDB
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 16)                 ;B4DFDE
    %AICMD0x19($0052, $00)                                     ;B4DFE2
    %AICMD0x13_Wait(80)                                        ;B4DFE6
    %AICMD0x19($0041, $00)                                     ;B4DFE9
    %AICMD0x13_Wait(60)                                        ;B4DFED
    %AICMD0x0B_SetScriptFlag($01)                                            ;B4DFF0
    %AICMD0x13_Wait(60)                                        ;B4DFF2
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B4DFF5
    %AICMD0x13_Wait(180)                                       ;B4DFF7
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 80)                  ;B4DFFA
    %AICMD0x13_Wait(180)                                       ;B4DFFE
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B4E001
    %AICMD0x13_Wait(180)                                       ;B4E003
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 48)                 ;B4E006
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B4E00A
    %AICMD0x0C_WaitForScriptFlag($02)                                            ;B4E00C
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 32)                    ;B4E00E
    %AICMD0x3D_TeleportToArea(!AREA_ENDING00)                  ;B4E012
    %AICMD0x10_End()                                           ;B4E014
pAIScripting0x3D_L001:
    %AICMD0x1A($FFCE, $0038, aAIScriptingData_L073, $02)                     ;B4E015
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B4E01D
    %AICMD0x1B($044A, $01)                                     ;B4E01F
    %AICMD0x0D($01, $00, $A0, $01)                             ;B4E023
    %AICMD0x13_Wait(80)                                        ;B4E028
    %AICMD0x1B($044A, $00)                                     ;B4E02B
    %AICMD0x0D($FF, $00, $A0, $01)                             ;B4E02F
    %AICMD0x0D($00, $01, $30, $01)                             ;B4E034
    %AICMD0x13_Wait(30)                                        ;B4E039
    %AICMD0x1B($044A, $01)                                     ;B4E03C
    %AICMD0x0D($01, $00, $80, $01)                             ;B4E040
    %AICMD0x13_Wait(60)                                        ;B4E045
    %AICMD0x1B($044A, $01)                                     ;B4E048
    %AICMD0x0D($01, $00, $40, $01)                             ;B4E04C
    %AICMD0x1B($0448, $01)                                     ;B4E051
    %AICMD0x13_Wait(60)                                        ;B4E055
    %AICMD0x09_StartScript($03, pAIScripting0x3D_L003)                                   ;B4E058
    %AICMD0x1B($0258, $00)                                     ;B4E05C
    %AICMD0x0D($F8, $F8, $01, $01)                             ;B4E060
    %AICMD0x1B($0258, $00)                                     ;B4E065
    %AICMD0x0D($FA, $06, $02, $01)                             ;B4E069
    %AICMD0x13_Wait(60)                                        ;B4E06E
    %AICMD0x0B_SetScriptFlag($02)                                            ;B4E071
    %AICMD0x1B($02E8, $00)                                     ;B4E073
    %AICMD0x13_Wait(60)                                        ;B4E077
    %AICMD0x1B($02E3, $00)                                     ;B4E07A
    %AICMD0x0D($00, $01, $10, $01)                             ;B4E07E
pAIScripting0x3D_L002:
    %AICMD0x13_Wait(1)                                         ;B4E083
    %AICMD0x12_Jump(pAIScripting0x3D_L002)                                   ;B4E086
pAIScripting0x3D_L003:
    %AICMD0x1A($0090, $0068, aAIScriptingData_L006, $02)                     ;B4E089
pAIScripting0x3D_L004:
    %AICMD0x1B($0203, $01)                                     ;B4E091
    %AICMD0x13_Wait(120)                                       ;B4E095
    %AICMD0x1B($0201, $01)                                     ;B4E098
    %AICMD0x13_Wait(240)                                       ;B4E09C
    %AICMD0x1B($0205, $01)                                     ;B4E09F
    %AICMD0x13_Wait(180)                                       ;B4E0A3
    %AICMD0x12_Jump(pAIScripting0x3D_L004)                                   ;B4E0A6
pAIScripting0x3D_L005:
    %AICMD0x1A($0048, $0088, aAIScriptingData_L004, $02)                     ;B4E0A9
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B4E0B1
    %AICMD0x1B($01EC, $01)                                     ;B4E0B3
    %AICMD0x0D($01, $00, $48, $01)                             ;B4E0B7
    %AICMD0x13_Wait(60)                                        ;B4E0BC
    %AICMD0x1B($01F2, $00)                                     ;B4E0BF
    %AICMD0x13_Wait(120)                                       ;B4E0C3
    %AICMD0x1B($01E8, $00)                                     ;B4E0C6
    %AICMD0x13_Wait(60)                                        ;B4E0CA
    %AICMD0x1B($01F6, $00)                                     ;B4E0CD
    %AICMD0x13_Wait(90)                                        ;B4E0D1
    %AICMD0x1B($01F3, $00)                                     ;B4E0D4
    %AICMD0x13_Wait(180)                                       ;B4E0D8
    %AICMD0x1B($01EC, $00)                                     ;B4E0DB
    %AICMD0x0D($FF, $00, $4A, $01)                             ;B4E0DF
    %AICMD0x13_Wait(60)                                        ;B4E0E4
pAIScripting0x3D_L006:
    %AICMD0x1B($01F8, $00)                                     ;B4E0E7
    %AICMD0x13_Wait(240)                                       ;B4E0EB
    %AICMD0x1B($01EA, $01)                                     ;B4E0EE
    %AICMD0x13_Wait(180)                                       ;B4E0F2
    %AICMD0x12_Jump(pAIScripting0x3D_L006)                                   ;B4E0F5


DATA8_B4E0F8:
    %AICMD0x00_SetMusic($10, $B4)                              ;B4E0F8
    %AICMD0x02_FreezeTime()                                    ;B4E0FB
    %AICMD0x03_SetHour($07)                                    ;B4E0FC
    %AICMD0x05_SetTransferPosition(632, 504)                   ;B4E0FE
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4E103
    %AICMD0x08_EnableAIControl()                               ;B4E105
    %AICMD0x09_StartScript($01, pAIScripting0x3D_L007)                                   ;B4E106
    %AICMD0x09_StartScript($02, pAIScripting0x3D_L011)                                   ;B4E10A
    %AICMD0x09_StartScript($03, pAIScripting0x3D_L009)                                   ;B4E10E
    %AICMD0x09_StartScript($04, pAIScripting0x3D_L013)                                   ;B4E112
    %AICMD0x06_SetDestinationArea(!AREA_WOODSSUMMER)           ;B4E116
    %AICMD0x38_WaitForFadeIn()                                               ;B4E118
    %AICMD0x13_Wait(30)                                        ;B4E119
    %AICMD0x0B_SetScriptFlag($00)                                            ;B4E11C
    %AICMD0x19($004A, $00)                                     ;B4E11E
    %AICMD0x13_Wait(120)                                       ;B4E122
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B4E125
    %AICMD0x19($0041, $00)                                     ;B4E127
    %AICMD0x13_Wait(80)                                        ;B4E12B
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 24)                  ;B4E12E
    %AICMD0x13_Wait(20)                                        ;B4E132
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 16)                  ;B4E135
    %AICMD0x13_Wait(20)                                        ;B4E139
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4E13C
    %AICMD0x0B_SetScriptFlag($02)                                            ;B4E13E
    %AICMD0x0C_WaitForScriptFlag($03)                                            ;B4E140
    %AICMD0x19($0023, $00)                                     ;B4E142
    %AICMD0x13_Wait(120)                                       ;B4E146
    %AICMD0x3D_TeleportToArea(!AREA_ENDING00)                  ;B4E149
    %AICMD0x10_End()                                           ;B4E14B
pAIScripting0x3D_L007:
    %AICMD0x1A($01CC, $01A8, aAIScriptingData_L091, $02)                     ;B4E14C
    %AICMD0x0C_WaitForScriptFlag($02)                                            ;B4E154
    %AICMD0x1B($0320, $01)                                     ;B4E156
    %AICMD0x0D($02, $01, $40, $02)                             ;B4E15A
    %AICMD0x0D($01, $00, $10, $01)                             ;B4E15F
    %AICMD0x0D($00, $0A, $01, $01)                             ;B4E164
    %AICMD0x0D($01, $01, $1E, $02)                             ;B4E169
    %AICMD0x13_Wait(30)                                        ;B4E16E
    %AICMD0x0B_SetScriptFlag($03)                                            ;B4E171
    %AICMD0x13_Wait(30)                                        ;B4E173
    %AICMD0x1B($031E, $01)                                     ;B4E176
pAIScripting0x3D_L008:
    %AICMD0x13_Wait(1)                                         ;B4E17A
    %AICMD0x12_Jump(pAIScripting0x3D_L008)                                   ;B4E17D
pAIScripting0x3D_L009:
    %AICMD0x1A($02B0, $0218, aAIScriptingData_L054, $01)                     ;B4E180
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B4E188
    %AICMD0x13_Wait(60)                                        ;B4E18A
    %AICMD0x0D($00, $FF, $20, $01)                             ;B4E18D
    %AICMD0x13_Wait(60)                                        ;B4E192
    %AICMD0x1B($02B0, $00)                                     ;B4E195
    %AICMD0x0D($FF, $00, $28, $01)                             ;B4E199
    %AICMD0x13_Wait(60)                                        ;B4E19E
    %AICMD0x1B($02B0, $00)                                     ;B4E1A1
    %AICMD0x0B_SetScriptFlag($01)                                            ;B4E1A5
    %AICMD0x13_Wait(180)                                       ;B4E1A7
    %AICMD0x1B($02AB, $00)                                     ;B4E1AA
    %AICMD0x13_Wait(120)                                       ;B4E1AE
pAIScripting0x3D_L010:
    %AICMD0x13_Wait(1)                                         ;B4E1B1
    %AICMD0x12_Jump(pAIScripting0x3D_L010)                                   ;B4E1B4
pAIScripting0x3D_L011:
    %AICMD0x1A($0258, $0208, aAIScriptingData_L073, $01)                     ;B4E1B7
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B4E1BF
    %AICMD0x1B($02E6, $01)                                     ;B4E1C1
    %AICMD0x13_Wait(120)                                       ;B4E1C5
    %AICMD0x1B($02E2, $00)                                     ;B4E1C8
    %AICMD0x13_Wait(60)                                        ;B4E1CC
    %AICMD0x1B($02E6, $00)                                     ;B4E1CF
    %AICMD0x13_Wait(60)                                        ;B4E1D3
    %AICMD0x1B($0258, $00)                                     ;B4E1D6
pAIScripting0x3D_L012:
    %AICMD0x13_Wait(1)                                         ;B4E1DA
    %AICMD0x12_Jump(pAIScripting0x3D_L012)                                   ;B4E1DD
pAIScripting0x3D_L013:
    %AICMD0x1A($0238, $0238, aAIScriptingData_L004, $02)                     ;B4E1E0
pAIScripting0x3D_L014:
    %AICMD0x1B($01F8, $00)                                     ;B4E1E8
    %AICMD0x13_Wait(240)                                       ;B4E1EC
    %AICMD0x1B($01EA, $01)                                     ;B4E1EF
    %AICMD0x13_Wait(180)                                       ;B4E1F3
    %AICMD0x1B($01EB, $01)                                     ;B4E1F6
    %AICMD0x13_Wait(180)                                       ;B4E1FA
    %AICMD0x12_Jump(pAIScripting0x3D_L014)                                   ;B4E1FD
