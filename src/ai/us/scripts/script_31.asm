

pAIScripting0x31:
    dw pAIScripting0x31_Data01                                            ;B4C9F9|        |B4CA19;
    dw pAIScripting0x32                                        ;B4C9FB|        |B4CB3F;
    dw pAIScripting0x32                                        ;B4C9FD|        |B4CB3F;
    dw pAIScripting0x32                                        ;B4C9FF|        |B4CB3F;
    dw pAIScripting0x32                                        ;B4CA01|        |B4CB3F;
    dw pAIScripting0x32                                        ;B4CA03|        |B4CB3F;
    dw pAIScripting0x32                                        ;B4CA05|        |B4CB3F;
    dw pAIScripting0x32                                        ;B4CA07|        |B4CB3F;
    dw pAIScripting0x32                                        ;B4CA09|        |B4CB3F;
    dw pAIScripting0x32                                        ;B4CA0B|        |B4CB3F;
    dw pAIScripting0x32                                        ;B4CA0D|        |B4CB3F;
    dw pAIScripting0x32                                        ;B4CA0F|        |B4CB3F;
    dw pAIScripting0x32                                        ;B4CA11|        |B4CB3F;
    dw pAIScripting0x32                                        ;B4CA13|        |B4CB3F;
    dw pAIScripting0x32                                        ;B4CA15|        |B4CB3F;
    dw pAIScripting0x32                                        ;B4CA17|        |B4CB3F;
 
pAIScripting0x31_Data01:
    %AICMD0x00_SetMusic($10, $B4)                              ;B4CA19
    %AICMD0x05_SetTransferPosition(65520, 104)                 ;B4CA1C
    %AICMD0x02_FreezeTime()                                    ;B4CA21
    %AICMD0x03_SetHour($06)                                    ;B4CA22
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4CA24
    %AICMD0x40_DisableTileInteractions()                       ;B4CA26
    %AICMD0x08_EnableAIControl()                               ;B4CA27
    %AICMD0x09_StartScript($01, pAIScripting0x31_L001)                                   ;B4CA28
    %AICMD0x09_StartScript($02, pAIScripting0x31_L003)                                   ;B4CA2C
    %AICMD0x09_StartScript($03, pAIScripting0x31_L005)                                   ;B4CA30
    %AICMD0x09_StartScript($04, pAIScripting0x31_L007)                                   ;B4CA34
    %AICMD0x06_SetDestinationArea(!AREA_ENDING06)              ;B4CA38
    %AICMD0x38_WaitForFadeIn()                                               ;B4CA3A
    %AICMD0x13_Wait(120)                                       ;B4CA3B
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 120)                ;B4CA3E
    %AICMD0x13_Wait(30)                                        ;B4CA42
    %AICMD0x19($007A, $01)                                     ;B4CA45
    %AICMD0x13_Wait(90)                                        ;B4CA49
    %AICMD0x3E_SetCarryItem($16)                               ;B4CA4C
    %AICMD0x0B_SetScriptFlag($00)                                            ;B4CA4E
    %AICMD0x13_Wait(90)                                        ;B4CA50
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4CA53
    %AICMD0x13_Wait(30)                                        ;B4CA55
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 16)                  ;B4CA58
    %AICMD0x13_Wait(60)                                        ;B4CA5C
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 128)                 ;B4CA5F
    %AICMD0x3F_ThrowCarriedItem()                              ;B4CA63
    %AICMD0x13_Wait(180)                                       ;B4CA64
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 144)                ;B4CA67
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B4CA6B
    %AICMD0x13_Wait(30)                                        ;B4CA6D
    %AICMD0x19($0065, $00)                                     ;B4CA70
    %AICMD0x13_Wait(90)                                        ;B4CA74
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 16)                  ;B4CA77
    %AICMD0x13_Wait(10)                                        ;B4CA7B
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 16)                    ;B4CA7E
    %AICMD0x13_Wait(10)                                        ;B4CA82
    %AICMD0x19($0066, $01)                                     ;B4CA85
    %AICMD0x13_Wait(90)                                        ;B4CA89
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4CA8C
    %AICMD0x0B_SetScriptFlag($01)                                            ;B4CA8E
    %AICMD0x13_Wait(90)                                        ;B4CA90
    %AICMD0x0C_WaitForScriptFlag($02)                                            ;B4CA93
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 16)                  ;B4CA95
    %AICMD0x13_Wait(30)                                        ;B4CA99
    %AICMD0x19($003D, $00)                                     ;B4CA9C
    %AICMD0x13_Wait(300)                                       ;B4CAA0
    %AICMD0x3D_TeleportToArea(!AREA_ENDING00)                  ;B4CAA3
    %AICMD0x10_End()                                           ;B4CAA5
pAIScripting0x31_L001:
    %AICMD0x1A($FFF0, $0088, aAIScriptingData_L004, $02)                     ;B4CAA6
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B4CAAE
    %AICMD0x1B($01EC, $01)                                     ;B4CAB0
    %AICMD0x0D($01, $00, $58, $01)                             ;B4CAB4
    %AICMD0x13_Wait(90)                                        ;B4CAB9
    %AICMD0x1B($01F8, $01)                                     ;B4CABC
    %AICMD0x13_Wait(120)                                       ;B4CAC0
    %AICMD0x1B($01E9, $01)                                     ;B4CAC3
    %AICMD0x0D($01, $00, $10, $01)                             ;B4CAC7
    %AICMD0x13_Wait(60)                                        ;B4CACC
pAIScripting0x31_L002:
    %AICMD0x1B($01EA, $01)                                     ;B4CACF
    %AICMD0x13_Wait(180)                                       ;B4CAD3
    %AICMD0x1B($01EB, $01)                                     ;B4CAD6
    %AICMD0x13_Wait(90)                                        ;B4CADA
    %AICMD0x12_Jump(pAIScripting0x31_L002)                                   ;B4CADD
pAIScripting0x31_L003:
    %AICMD0x1A($0078, $006C, aAIScriptingData_L150, $02)                     ;B4CAE0
    %AICMD0x13_Wait(540)                                       ;B4CAE8
    %AICMD0x1B($0190, $01)                                     ;B4CAEB
    %AICMD0x13_Wait(180)                                       ;B4CAEF
    %AICMD0x1B($0194, $01)                                     ;B4CAF2
    %AICMD0x13_Wait(180)                                       ;B4CAF6
    %AICMD0x1B($0193, $01)                                     ;B4CAF9
    %AICMD0x13_Wait(180)                                       ;B4CAFD
    %AICMD0x1B($018C, $01)                                     ;B4CB00
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B4CB04
    %AICMD0x1B($0191, $01)                                     ;B4CB06
    %AICMD0x13_Wait(180)                                       ;B4CB0A
    %AICMD0x0B_SetScriptFlag($02)                                            ;B4CB0D
pAIScripting0x31_L004:
    %AICMD0x13_Wait(1)                                         ;B4CB0F
    %AICMD0x12_Jump(pAIScripting0x31_L004)                                   ;B4CB12
pAIScripting0x31_L005:
    %AICMD0x1A($00A0, $0088, aAIScriptingData_L008, $00)                     ;B4CB15
    %AICMD0x22($18, $18, $01, aAIScriptingData_L008, $0C)                    ;B4CB1D
pAIScripting0x31_L006:
    %AICMD0x13_Wait(1)                                         ;B4CB24
    %AICMD0x12_Jump(pAIScripting0x31_L006)                                   ;B4CB27
pAIScripting0x31_L007:
    %AICMD0x1A($0098, $00A8, aAIScriptingData_L009, $00)                     ;B4CB2A
    %AICMD0x22($18, $18, $01, aAIScriptingData_L009, $0C)                    ;B4CB32
pAIScripting0x31_L008:
    %AICMD0x13_Wait(1)                                         ;B4CB39
    %AICMD0x12_Jump(pAIScripting0x31_L008)                                   ;B4CB3C
