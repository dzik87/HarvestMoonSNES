

pAIScripting0x33:
    dw pAIScripting0x33_Data01                                            ;B4CD56|        |B4CD76;
    dw pAIScripting0x34                                        ;B4CD58|        |B4CECA;
    dw pAIScripting0x34                                        ;B4CD5A|        |B4CECA;
    dw pAIScripting0x34                                        ;B4CD5C|        |B4CECA;
    dw pAIScripting0x34                                        ;B4CD5E|        |B4CECA;
    dw pAIScripting0x34                                        ;B4CD60|        |B4CECA;
    dw pAIScripting0x34                                        ;B4CD62|        |B4CECA;
    dw pAIScripting0x34                                        ;B4CD64|        |B4CECA;
    dw pAIScripting0x34                                        ;B4CD66|        |B4CECA;
    dw pAIScripting0x34                                        ;B4CD68|        |B4CECA;
    dw pAIScripting0x34                                        ;B4CD6A|        |B4CECA;
    dw pAIScripting0x34                                        ;B4CD6C|        |B4CECA;
    dw pAIScripting0x34                                        ;B4CD6E|        |B4CECA;
    dw pAIScripting0x34                                        ;B4CD70|        |B4CECA;
    dw pAIScripting0x34                                        ;B4CD72|        |B4CECA;
    dw pAIScripting0x34                                        ;B4CD74|        |B4CECA;
 
pAIScripting0x33_Data01:
    %AICMD0x00_SetMusic($10, $B4)                              ;B4CD76
    %AICMD0x02_FreezeTime()                                    ;B4CD79
    %AICMD0x03_SetHour($06)                                    ;B4CD7A
    %AICMD0x05_SetTransferPosition(65512, 120)                 ;B4CD7C
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4CD81
    %AICMD0x40_DisableTileInteractions()                       ;B4CD83
    %AICMD0x08_EnableAIControl()                               ;B4CD84
    %AICMD0x09_StartScript($01, pAIScripting0x33_L003)                                   ;B4CD85
    %AICMD0x09_StartScript($02, pAIScripting0x33_L005)                                   ;B4CD89
    %AICMD0x09_StartScript($03, pAIScripting0x33_L007)                                   ;B4CD8D
    %AICMD0x09_StartScript($04, pAIScripting0x33_L009)                                   ;B4CD91
    %AICMD0x06_SetDestinationArea(!AREA_ENDING06)              ;B4CD95
    %AICMD0x38_WaitForFadeIn()                                               ;B4CD97
    %AICMD0x13_Wait(120)                                       ;B4CD98
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 144)                ;B4CD9B
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B4CD9F
    %AICMD0x13_Wait(60)                                        ;B4CDA1
    %AICMD0x19($0079, $00)                                     ;B4CDA4
    %AICMD0x13_Wait(100)                                       ;B4CDA8
    %AICMD0x3E_SetCarryItem($17)                               ;B4CDAB
    %AICMD0x13_Wait(60)                                        ;B4CDAD
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 128)                 ;B4CDB0
    %AICMD0x3F_ThrowCarriedItem()                              ;B4CDB4
    %AICMD0x0B_SetScriptFlag($00)                                            ;B4CDB5
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B4CDB7
    %AICMD0x13_Wait(180)                                       ;B4CDB9
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 128)                ;B4CDBC
    %AICMD0x13_Wait(60)                                        ;B4CDC0
    %AICMD0x19($0040, $00)                                     ;B4CDC3
    %AICMD0x13_Wait(120)                                       ;B4CDC7
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4CDCA
    %AICMD0x19($004C, $00)                                     ;B4CDCC
    %AICMD0x13_Wait(10)                                        ;B4CDD0
    %AICMD0x19($00E8, $00)                                     ;B4CDD3
    %AICMD0x09_StartScript($05, pAIScripting0x33_L001)                                   ;B4CDD7
    %AICMD0x13_Wait(300)                                       ;B4CDDB
    %AICMD0x3D_TeleportToArea(!AREA_ENDING00)                  ;B4CDDE
    %AICMD0x10_End()                                           ;B4CDE0
pAIScripting0x33_L001:
    %AICMD0x1A($0078, $007D, aAIScriptingData_L189, $00)                     ;B4CDE1
pAIScripting0x33_L002:
    %AICMD0x13_Wait(1)                                         ;B4CDE9
    %AICMD0x12_Jump(pAIScripting0x33_L002)                                   ;B4CDEC
pAIScripting0x33_L003:
    %AICMD0x1A($00A8, $0088, aAIScriptingData_L004, $02)                     ;B4CDEF
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B4CDF7
    %AICMD0x1B($01EC, $00)                                     ;B4CDF9
    %AICMD0x0D($FF, $00, $48, $01)                             ;B4CDFD
    %AICMD0x13_Wait(60)                                        ;B4CE02
    %AICMD0x1B($01F2, $00)                                     ;B4CE05
    %AICMD0x13_Wait(120)                                       ;B4CE09
    %AICMD0x1B($01F1, $00)                                     ;B4CE0C
    %AICMD0x13_Wait(100)                                       ;B4CE10
    %AICMD0x1B($01E8, $00)                                     ;B4CE13
    %AICMD0x13_Wait(60)                                        ;B4CE17
    %AICMD0x1B($01F6, $00)                                     ;B4CE1A
    %AICMD0x13_Wait(90)                                        ;B4CE1E
    %AICMD0x1B($01F3, $00)                                     ;B4CE21
    %AICMD0x13_Wait(180)                                       ;B4CE25
    %AICMD0x1B($01F4, $00)                                     ;B4CE28
    %AICMD0x13_Wait(360)                                       ;B4CE2C
pAIScripting0x33_L004:
    %AICMD0x13_Wait(1)                                         ;B4CE2F
    %AICMD0x12_Jump(pAIScripting0x33_L004)                                   ;B4CE32
pAIScripting0x33_L005:
    %AICMD0x1A($0078, $006A, aAIScriptingData_L002, $02)                     ;B4CE35
    %AICMD0x13_Wait(120)                                       ;B4CE3D
    %AICMD0x1B($0194, $01)                                     ;B4CE40
    %AICMD0x13_Wait(120)                                       ;B4CE44
    %AICMD0x1B($0193, $01)                                     ;B4CE47
    %AICMD0x13_Wait(160)                                       ;B4CE4B
    %AICMD0x1B($018C, $01)                                     ;B4CE4E
    %AICMD0x13_Wait(120)                                       ;B4CE52
    %AICMD0x1B($018D, $01)                                     ;B4CE55
    %AICMD0x0B_SetScriptFlag($01)                                            ;B4CE59
pAIScripting0x33_L006:
    %AICMD0x1B($0192, $01)                                     ;B4CE5B
    %AICMD0x13_Wait(120)                                       ;B4CE5F
    %AICMD0x1B($0195, $01)                                     ;B4CE62
    %AICMD0x13_Wait(1)                                         ;B4CE66
    %AICMD0x12_Jump(pAIScripting0x33_L006)                                   ;B4CE69
pAIScripting0x33_L007:
    %AICMD0x1A($0098, $0098, aAIScriptingData_L115, $03)                     ;B4CE6C
    %AICMD0x13_Wait(120)                                       ;B4CE74
pAIScripting0x33_L008:
    %AICMD0x1B($01BD, $00)                                     ;B4CE77
    %AICMD0x13_Wait(120)                                       ;B4CE7B
    %AICMD0x1B($01BE, $00)                                     ;B4CE7E
    %AICMD0x13_Wait(120)                                       ;B4CE82
    %AICMD0x12_Jump(pAIScripting0x33_L008)                                   ;B4CE85
pAIScripting0x33_L009:
    %AICMD0x1A($003A, $0068, aAIScriptingData_L083, $00)                     ;B4CE88
pAIScripting0x33_L010:
    %AICMD0x0D($01, $00, $08, $01)                             ;B4CE90
    %AICMD0x0D($00, $FF, $06, $01)                             ;B4CE95
    %AICMD0x0D($FF, $00, $08, $02)                             ;B4CE9A
    %AICMD0x0D($FF, $01, $04, $01)                             ;B4CE9F
    %AICMD0x0D($01, $00, $0C, $02)                             ;B4CEA4
    %AICMD0x0D($FF, $00, $06, $01)                             ;B4CEA9
    %AICMD0x0D($00, $FF, $10, $02)                             ;B4CEAE
    %AICMD0x0D($FF, $01, $04, $01)                             ;B4CEB3
    %AICMD0x0D($01, $01, $0C, $02)                             ;B4CEB8
    %AICMD0x0D($01, $00, $08, $02)                             ;B4CEBD
    %AICMD0x0D($00, $FF, $06, $01)                             ;B4CEC2
    %AICMD0x12_Jump(pAIScripting0x33_L010)                                   ;B4CEC7
