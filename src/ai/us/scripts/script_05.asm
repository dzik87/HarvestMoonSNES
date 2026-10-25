

pAIScripting0x05:
    dw pAIScripting0x05_Data01                                            ;B3CC71|        |B3CC91;
    dw pAIScripting0x06                                        ;B3CC73|        |B3D447;
    dw pAIScripting0x06                                        ;B3CC75|        |B3D447;
    dw pAIScripting0x06                                        ;B3CC77|        |B3D447;
    dw pAIScripting0x06                                        ;B3CC79|        |B3D447;
    dw pAIScripting0x06                                        ;B3CC7B|        |B3D447;
    dw pAIScripting0x06                                        ;B3CC7D|        |B3D447;
    dw pAIScripting0x06                                        ;B3CC7F|        |B3D447;
    dw pAIScripting0x06                                        ;B3CC81|        |B3D447;
    dw pAIScripting0x06                                        ;B3CC83|        |B3D447;
    dw pAIScripting0x06                                        ;B3CC85|        |B3D447;
    dw pAIScripting0x06                                        ;B3CC87|        |B3D447;
    dw pAIScripting0x06                                        ;B3CC89|        |B3D447;
    dw pAIScripting0x06                                        ;B3CC8B|        |B3D447;
    dw pAIScripting0x06                                        ;B3CC8D|        |B3D447;
    dw pAIScripting0x06                                        ;B3CC8F|        |B3D447;
 
pAIScripting0x05_Data01:
    %AICMD0x11_EnableUserControl()                             ;B3CC91
    %AICMD0x09_StartScript($01, pAIScripting0x05_L005)                                   ;B3CC92
    %AICMD0x09_StartScript($02, pAIScripting0x05_L017)                                   ;B3CC96
    %AICMD0x09_StartScript($03, pAIScripting0x05_L023)                                   ;B3CC9A
    %AICMD0x09_StartScript($04, pAIScripting0x05_L030)                                   ;B3CC9E
    %AICMD0x09_StartScript($05, pAIScripting0x05_L037)                                   ;B3CCA2
    %AICMD0x09_StartScript($06, pAIScripting0x05_L047)                                   ;B3CCA6
    %AICMD0x09_StartScript($07, pAIScripting0x05_L058)                                   ;B3CCAA
    %AICMD0x09_StartScript($08, pAIScripting0x05_L069)                                   ;B3CCAE
    %AICMD0x12_Jump(pAIScripting0x05_L002)                                   ;B3CCB2
pAIScripting0x05_L001:
    %AICMD0x13_Wait(1)                                         ;B3CCB5
    %AICMD0x12_Jump(pAIScripting0x05_L001)                                   ;B3CCB8
pAIScripting0x05_L002:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $03, pAIScripting0x05_L003)   ;B3CCBB
    %AICMD0x09_StartScript($09, pAIScripting0x05_L081)                                   ;B3CCC2
pAIScripting0x05_L003:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $04, pAIScripting0x05_L004)   ;B3CCC6
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $04, pAIScripting0x05_L004)   ;B3CCCD
    %AICMD0x09_StartScript($0A, pAIScripting0x05_L090)                                   ;B3CCD4
pAIScripting0x05_L004:
    %AICMD0x12_Jump(pAIScripting0x05_L001)                                   ;B3CCD8
pAIScripting0x05_L005:
    %AICMD0x1A($0028, $0198, aAIScriptingData_L041, $00)                     ;B3CCDB
pAIScripting0x05_L006:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x05_L007)                                        ;B3CCE3
    %AICMD0x2D_JumpOnInteract(pAIScripting0x05_L010, pAIScripting0x05_L008)                               ;B3CCE6
    %AICMD0x12_Jump(pAIScripting0x05_L006)                                   ;B3CCEB
pAIScripting0x05_L007:
    %AICMD0x1C_ShowDialog($01C9, $00)                          ;B3CCEE
    %AICMD0x12_Jump(pAIScripting0x05_L006)                                   ;B3CCF2
pAIScripting0x05_L008:
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 9, 12, pAIScripting0x05_L009)         ;B3CCF5
    %AICMD0x1C_ShowDialog($03BC, $00)                          ;B3CCFD
    %AICMD0x12_Jump(pAIScripting0x05_L006)                                   ;B3CD01
pAIScripting0x05_L009:
    %AICMD0x1C_ShowDialog($03BB, $00)                          ;B3CD04
    %AICMD0x12_Jump(pAIScripting0x05_L006)                                   ;B3CD08
pAIScripting0x05_L010:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $04, pAIScripting0x05_L016)   ;B3CD0B
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, pAIScripting0x05_L014)     ;B3CD12
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $04, pAIScripting0x05_L013)   ;B3CD19
    %AICMD0x17_RollRandom($02)                                            ;B3CD20
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x05_L011)                                   ;B3CD22
    %AICMD0x18_JumpIfRandomEquals($01, pAIScripting0x05_L012)                                   ;B3CD26
    %AICMD0x12_Jump(pAIScripting0x05_L006)                                   ;B3CD2A
pAIScripting0x05_L011:
    %AICMD0x1C_ShowDialog($0069, $00)                          ;B3CD2D
    %AICMD0x1B($0285, $00)                                     ;B3CD31
    %AICMD0x12_Jump(pAIScripting0x05_L006)                                   ;B3CD35
pAIScripting0x05_L012:
    %AICMD0x1C_ShowDialog($03DD, $00)                          ;B3CD38
    %AICMD0x1B($0285, $00)                                     ;B3CD3C
    %AICMD0x12_Jump(pAIScripting0x05_L006)                                   ;B3CD40
pAIScripting0x05_L013:
    %AICMD0x1C_ShowDialog($03DE, $00)                          ;B3CD43
    %AICMD0x1B($0285, $00)                                     ;B3CD47
    %AICMD0x12_Jump(pAIScripting0x05_L006)                                   ;B3CD4B
pAIScripting0x05_L014:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 30, pAIScripting0x05_L015)         ;B3CD4E
    %AICMD0x1C_ShowDialog($0069, $00)                          ;B3CD55
    %AICMD0x1B($0285, $00)                                     ;B3CD59
    %AICMD0x12_Jump(pAIScripting0x05_L006)                                   ;B3CD5D
pAIScripting0x05_L015:
    %AICMD0x1C_ShowDialog($03F6, $00)                          ;B3CD60
    %AICMD0x1B($0285, $00)                                     ;B3CD64
    %AICMD0x41_AddValue16(nPlayerHappiness, 5)                 ;B3CD68
    %AICMD0x12_Jump(pAIScripting0x05_L006)                                   ;B3CD6E
pAIScripting0x05_L016:
    %AICMD0x1C_ShowDialog($01FB, $00)                          ;B3CD71
    %AICMD0x1B($0285, $00)                                     ;B3CD75
    %AICMD0x12_Jump(pAIScripting0x05_L006)                                   ;B3CD79
pAIScripting0x05_L017:
    %AICMD0x1A($0060, $0170, aAIScriptingData_L050, $00)                     ;B3CD7C
pAIScripting0x05_L018:
    %AICMD0x2D_JumpOnInteract(pAIScripting0x05_L020, pAIScripting0x05_L019)                               ;B3CD84
    %AICMD0x12_Jump(pAIScripting0x05_L018)                                   ;B3CD89
pAIScripting0x05_L019:
    %AICMD0x1C_ShowDialog($03BC, $00)                          ;B3CD8C
    %AICMD0x12_Jump(pAIScripting0x05_L018)                                   ;B3CD90
pAIScripting0x05_L020:
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, pAIScripting0x05_L021)     ;B3CD93
    %AICMD0x1C_ShowDialog($0056, $00)                          ;B3CD9A
    %AICMD0x12_Jump(pAIScripting0x05_L018)                                   ;B3CD9E
pAIScripting0x05_L021:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 30, pAIScripting0x05_L022)         ;B3CDA1
    %AICMD0x1C_ShowDialog($0056, $00)                          ;B3CDA8
    %AICMD0x12_Jump(pAIScripting0x05_L018)                                   ;B3CDAC
pAIScripting0x05_L022:
    %AICMD0x1C_ShowDialog($03FD, $00)                          ;B3CDAF
    %AICMD0x12_Jump(pAIScripting0x05_L018)                                   ;B3CDB3
pAIScripting0x05_L023:
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 2, pAIScripting0x05_L029)     ;B3CDB6
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, pAIScripting0x05_L029)     ;B3CDBD
    %AICMD0x1A($00B4, $01A0, aAIScriptingData_L033, $01)                     ;B3CDC4
pAIScripting0x05_L024:
    %AICMD0x2D_JumpOnInteract(pAIScripting0x05_L027, pAIScripting0x05_L025)                               ;B3CDCC
    %AICMD0x12_Jump(pAIScripting0x05_L024)                                   ;B3CDD1
pAIScripting0x05_L025:
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 9, 12, pAIScripting0x05_L026)         ;B3CDD4
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3CDDC
    %AICMD0x1B($026B, $00)                                     ;B3CDE0
    %AICMD0x12_Jump(pAIScripting0x05_L024)                                   ;B3CDE4
pAIScripting0x05_L026:
    %AICMD0x1C_ShowDialog($03B8, $00)                          ;B3CDE7
    %AICMD0x1B($026B, $00)                                     ;B3CDEB
    %AICMD0x12_Jump(pAIScripting0x05_L024)                                   ;B3CDEF
pAIScripting0x05_L027:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $00, pAIScripting0x05_L028)   ;B3CDF2
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $01, pAIScripting0x05_L028)   ;B3CDF9
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, pAIScripting0x05_L028)   ;B3CE00
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $03, pAIScripting0x05_L028)   ;B3CE07
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $04, pAIScripting0x05_L028)   ;B3CE0E
    %AICMD0x1C_ShowDialog($0077, $00)                          ;B3CE15
    %AICMD0x1B($026B, $00)                                     ;B3CE19
    %AICMD0x12_Jump(pAIScripting0x05_L024)                                   ;B3CE1D
pAIScripting0x05_L028:
    %AICMD0x1C_ShowDialog($03E2, $00)                          ;B3CE20
    %AICMD0x1B($026B, $00)                                     ;B3CE24
    %AICMD0x12_Jump(pAIScripting0x05_L024)                                   ;B3CE28
pAIScripting0x05_L029:
    %AICMD0x10_End()                                           ;B3CE2B
pAIScripting0x05_L030:
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 0, pAIScripting0x05_L036)     ;B3CE2C
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 2, pAIScripting0x05_L036)     ;B3CE33
    %AICMD0x1A($0064, $01A0, aAIScriptingData_L042, $01)                     ;B3CE3A
pAIScripting0x05_L031:
    %AICMD0x2D_JumpOnInteract(pAIScripting0x05_L034, pAIScripting0x05_L032)                               ;B3CE42
    %AICMD0x12_Jump(pAIScripting0x05_L031)                                   ;B3CE47
pAIScripting0x05_L032:
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 9, 12, pAIScripting0x05_L033)         ;B3CE4A
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3CE52
    %AICMD0x1B($028A, $00)                                     ;B3CE56
    %AICMD0x12_Jump(pAIScripting0x05_L031)                                   ;B3CE5A
pAIScripting0x05_L033:
    %AICMD0x1C_ShowDialog($03BB, $00)                          ;B3CE5D
    %AICMD0x1B($028A, $00)                                     ;B3CE61
    %AICMD0x12_Jump(pAIScripting0x05_L031)                                   ;B3CE65
pAIScripting0x05_L034:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 30, pAIScripting0x05_L035)         ;B3CE68
    %AICMD0x1C_ShowDialog($0063, $00)                          ;B3CE6F
    %AICMD0x1B($028A, $00)                                     ;B3CE73
    %AICMD0x12_Jump(pAIScripting0x05_L031)                                   ;B3CE77
pAIScripting0x05_L035:
    %AICMD0x1C_ShowDialog($0406, $00)                          ;B3CE7A
    %AICMD0x1B($028A, $00)                                     ;B3CE7E
    %AICMD0x41_AddValue16(nPlayerHappiness, 5)                 ;B3CE82
    %AICMD0x12_Jump(pAIScripting0x05_L031)                                   ;B3CE88
pAIScripting0x05_L036:
    %AICMD0x10_End()                                           ;B3CE8B
pAIScripting0x05_L037:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event4, $0E, pAIScripting0x05_L046)   ;B3CE8C
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $00, pAIScripting0x05_L046)   ;B3CE93
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 0, pAIScripting0x05_L046)     ;B3CE9A
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 1, pAIScripting0x05_L046)     ;B3CEA1
    %AICMD0x1A($00B0, $0170, aAIScriptingData_L046, $00)                     ;B3CEA8
pAIScripting0x05_L038:
    %AICMD0x2D_JumpOnInteract(pAIScripting0x05_L041, pAIScripting0x05_L039)                               ;B3CEB0
    %AICMD0x12_Jump(pAIScripting0x05_L038)                                   ;B3CEB5
pAIScripting0x05_L039:
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 9, 12, pAIScripting0x05_L040)         ;B3CEB8
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3CEC0
    %AICMD0x1B($0296, $00)                                     ;B3CEC4
    %AICMD0x12_Jump(pAIScripting0x05_L038)                                   ;B3CEC8
pAIScripting0x05_L040:
    %AICMD0x1C_ShowDialog($0049, $00)                          ;B3CECB
    %AICMD0x1B($0296, $00)                                     ;B3CECF
    %AICMD0x12_Jump(pAIScripting0x05_L038)                                   ;B3CED3
pAIScripting0x05_L041:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $04, pAIScripting0x05_L045)   ;B3CED6
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, pAIScripting0x05_L042)     ;B3CEDD
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $00, pAIScripting0x05_L044)   ;B3CEE4
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $01, pAIScripting0x05_L044)   ;B3CEEB
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, pAIScripting0x05_L044)   ;B3CEF2
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $03, pAIScripting0x05_L044)   ;B3CEF9
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $04, pAIScripting0x05_L044)   ;B3CF00
    %AICMD0x1C_ShowDialog($0045, $00)                          ;B3CF07
    %AICMD0x1B($0296, $00)                                     ;B3CF0B
    %AICMD0x12_Jump(pAIScripting0x05_L038)                                   ;B3CF0F
pAIScripting0x05_L042:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 30, pAIScripting0x05_L043)         ;B3CF12
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $00, pAIScripting0x05_L044)   ;B3CF19
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $01, pAIScripting0x05_L044)   ;B3CF20
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, pAIScripting0x05_L044)   ;B3CF27
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $03, pAIScripting0x05_L044)   ;B3CF2E
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $04, pAIScripting0x05_L044)   ;B3CF35
    %AICMD0x1C_ShowDialog($0045, $00)                          ;B3CF3C
    %AICMD0x1B($0296, $00)                                     ;B3CF40
    %AICMD0x12_Jump(pAIScripting0x05_L038)                                   ;B3CF44
pAIScripting0x05_L043:
    %AICMD0x1C_ShowDialog($03FE, $00)                          ;B3CF47
    %AICMD0x1B($0296, $00)                                     ;B3CF4B
    %AICMD0x12_Jump(pAIScripting0x05_L038)                                   ;B3CF4F
pAIScripting0x05_L044:
    %AICMD0x1C_ShowDialog($03E1, $00)                          ;B3CF52
    %AICMD0x1B($0296, $00)                                     ;B3CF56
    %AICMD0x12_Jump(pAIScripting0x05_L038)                                   ;B3CF5A
pAIScripting0x05_L045:
    %AICMD0x1C_ShowDialog($013E, $00)                          ;B3CF5D
    %AICMD0x1B($0296, $00)                                     ;B3CF61
    %AICMD0x12_Jump(pAIScripting0x05_L038)                                   ;B3CF65
pAIScripting0x05_L046:
    %AICMD0x10_End()                                           ;B3CF68
pAIScripting0x05_L047:
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 1, pAIScripting0x05_L057)     ;B3CF69
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 2, pAIScripting0x05_L057)     ;B3CF70
    %AICMD0x1A($00D8, $0170, aAIScriptingData_L053, $00)                     ;B3CF77
pAIScripting0x05_L048:
    %AICMD0x2D_JumpOnInteract(pAIScripting0x05_L051, pAIScripting0x05_L049)                               ;B3CF7F
    %AICMD0x12_Jump(pAIScripting0x05_L048)                                   ;B3CF84
pAIScripting0x05_L049:
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 9, 12, pAIScripting0x05_L050)         ;B3CF87
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3CF8F
    %AICMD0x1B($02AB, $00)                                     ;B3CF93
    %AICMD0x12_Jump(pAIScripting0x05_L048)                                   ;B3CF97
pAIScripting0x05_L050:
    %AICMD0x1C_ShowDialog($03BB, $00)                          ;B3CF9A
    %AICMD0x1B($02AB, $00)                                     ;B3CF9E
    %AICMD0x12_Jump(pAIScripting0x05_L048)                                   ;B3CFA2
pAIScripting0x05_L051:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $02, pAIScripting0x05_L054)   ;B3CFA5
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $04, pAIScripting0x05_L055)   ;B3CFAC
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, pAIScripting0x05_L052)     ;B3CFB3
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $00, pAIScripting0x05_L053)   ;B3CFBA
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $01, pAIScripting0x05_L053)   ;B3CFC1
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, pAIScripting0x05_L053)   ;B3CFC8
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $03, pAIScripting0x05_L053)   ;B3CFCF
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $04, pAIScripting0x05_L053)   ;B3CFD6
    %AICMD0x1C_ShowDialog($005F, $00)                          ;B3CFDD
    %AICMD0x1B($02AB, $00)                                     ;B3CFE1
    %AICMD0x12_Jump(pAIScripting0x05_L048)                                   ;B3CFE5
pAIScripting0x05_L052:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 30, pAIScripting0x05_L056)         ;B3CFE8
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $00, pAIScripting0x05_L053)   ;B3CFEF
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $01, pAIScripting0x05_L053)   ;B3CFF6
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, pAIScripting0x05_L053)   ;B3CFFD
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $03, pAIScripting0x05_L053)   ;B3D004
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $04, pAIScripting0x05_L053)   ;B3D00B
    %AICMD0x1C_ShowDialog($0407, $00)                          ;B3D012
    %AICMD0x1B($02AB, $00)                                     ;B3D016
    %AICMD0x12_Jump(pAIScripting0x05_L048)                                   ;B3D01A
pAIScripting0x05_L053:
    %AICMD0x1C_ShowDialog($03D8, $00)                          ;B3D01D
    %AICMD0x1B($02AB, $00)                                     ;B3D021
    %AICMD0x12_Jump(pAIScripting0x05_L048)                                   ;B3D025
pAIScripting0x05_L054:
    %AICMD0x1C_ShowDialog($01F0, $00)                          ;B3D028
    %AICMD0x1B($02AB, $00)                                     ;B3D02C
    %AICMD0x12_Jump(pAIScripting0x05_L048)                                   ;B3D030
pAIScripting0x05_L055:
    %AICMD0x1C_ShowDialog($013E, $00)                          ;B3D033
    %AICMD0x1B($02AB, $00)                                     ;B3D037
    %AICMD0x12_Jump(pAIScripting0x05_L048)                                   ;B3D03B
pAIScripting0x05_L056:
    %AICMD0x1C_ShowDialog($0146, $00)                          ;B3D03E
    %AICMD0x1B($02AB, $00)                                     ;B3D042
    %AICMD0x12_Jump(pAIScripting0x05_L048)                                   ;B3D046
pAIScripting0x05_L057:
    %AICMD0x10_End()                                           ;B3D049
pAIScripting0x05_L058:
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 1, pAIScripting0x05_L068)     ;B3D04A
    %AICMD0x1A($0088, $0170, aAIScriptingData_L035, $00)                     ;B3D051
pAIScripting0x05_L059:
    %AICMD0x2D_JumpOnInteract(pAIScripting0x05_L062, pAIScripting0x05_L060)                               ;B3D059
    %AICMD0x12_Jump(pAIScripting0x05_L059)                                   ;B3D05E
pAIScripting0x05_L060:
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 9, 12, pAIScripting0x05_L061)         ;B3D061
    %AICMD0x1C_ShowDialog($03BC, $00)                          ;B3D069
    %AICMD0x12_Jump(pAIScripting0x05_L059)                                   ;B3D06D
pAIScripting0x05_L061:
    %AICMD0x1C_ShowDialog($03BB, $00)                          ;B3D070
    %AICMD0x12_Jump(pAIScripting0x05_L059)                                   ;B3D074
pAIScripting0x05_L062:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $04, pAIScripting0x05_L067)   ;B3D077
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $00, pAIScripting0x05_L066)   ;B3D07E
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $01, pAIScripting0x05_L066)   ;B3D085
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, pAIScripting0x05_L066)   ;B3D08C
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $03, pAIScripting0x05_L066)   ;B3D093
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $04, pAIScripting0x05_L066)   ;B3D09A
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 2, pAIScripting0x05_L063)     ;B3D0A1
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, pAIScripting0x05_L064)     ;B3D0A8
    %AICMD0x1C_ShowDialog($006F, $00)                          ;B3D0AF
    %AICMD0x1B($0270, $00)                                     ;B3D0B3
    %AICMD0x12_Jump(pAIScripting0x05_L059)                                   ;B3D0B7
pAIScripting0x05_L063:
    %AICMD0x1C_ShowDialog($006E, $00)                          ;B3D0BA
    %AICMD0x1B($0270, $00)                                     ;B3D0BE
    %AICMD0x12_Jump(pAIScripting0x05_L059)                                   ;B3D0C2
pAIScripting0x05_L064:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 30, pAIScripting0x05_L065)         ;B3D0C5
    %AICMD0x1C_ShowDialog($0070, $00)                          ;B3D0CC
    %AICMD0x1B($0270, $00)                                     ;B3D0D0
    %AICMD0x12_Jump(pAIScripting0x05_L059)                                   ;B3D0D4
pAIScripting0x05_L065:
    %AICMD0x1C_ShowDialog($03EC, $00)                          ;B3D0D7
    %AICMD0x1B($0270, $00)                                     ;B3D0DB
    %AICMD0x41_AddValue16(nPlayerHappiness, 5)                 ;B3D0DF
    %AICMD0x12_Jump(pAIScripting0x05_L059)                                   ;B3D0E5
pAIScripting0x05_L066:
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, pAIScripting0x05_L064)     ;B3D0E8
    %AICMD0x17_RollRandom($02)                                            ;B3D0EF
    %AICMD0x17_RollRandom($00)                                            ;B3D0F1
    %AICMD0x1C_ShowDialog($03E3, $00)                          ;B3D0F3
    %AICMD0x1B($0270, $00)                                     ;B3D0F7
    %AICMD0x12_Jump(pAIScripting0x05_L059)                                   ;B3D0FB
pAIScripting0x05_L067:
    %AICMD0x1C_ShowDialog($013E, $00)                          ;B3D0FE
    %AICMD0x1B($0270, $00)                                     ;B3D102
    %AICMD0x12_Jump(pAIScripting0x05_L059)                                   ;B3D106
pAIScripting0x05_L068:
    %AICMD0x10_End()                                           ;B3D109
pAIScripting0x05_L069:
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 1, pAIScripting0x05_L080)     ;B3D10A
    %AICMD0x1A($00D8, $01B8, aAIScriptingData_L037, $00)                     ;B3D111
pAIScripting0x05_L070:
    %AICMD0x2D_JumpOnInteract(pAIScripting0x05_L073, pAIScripting0x05_L071)                               ;B3D119
    %AICMD0x12_Jump(pAIScripting0x05_L070)                                   ;B3D11E
pAIScripting0x05_L071:
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 9, 12, pAIScripting0x05_L072)         ;B3D121
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3D129
    %AICMD0x12_Jump(pAIScripting0x05_L070)                                   ;B3D12D
pAIScripting0x05_L072:
    %AICMD0x1C_ShowDialog($0049, $00)                          ;B3D130
    %AICMD0x12_Jump(pAIScripting0x05_L070)                                   ;B3D134
pAIScripting0x05_L073:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $00, pAIScripting0x05_L079)   ;B3D137
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $01, pAIScripting0x05_L079)   ;B3D13E
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, pAIScripting0x05_L079)   ;B3D145
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $03, pAIScripting0x05_L079)   ;B3D14C
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $04, pAIScripting0x05_L079)   ;B3D153
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, pAIScripting0x05_L077)     ;B3D15A
pAIScripting0x05_L074:
    %AICMD0x17_RollRandom($02)                                            ;B3D161
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x05_L075)                                   ;B3D163
    %AICMD0x18_JumpIfRandomEquals($01, pAIScripting0x05_L076)                                   ;B3D167
    %AICMD0x18_JumpIfRandomEquals($02, pAIScripting0x05_L077)                                   ;B3D16B
    %AICMD0x12_Jump(pAIScripting0x05_L070)                                   ;B3D16F
pAIScripting0x05_L075:
    %AICMD0x1C_ShowDialog($0071, $00)                          ;B3D172
    %AICMD0x12_Jump(pAIScripting0x05_L070)                                   ;B3D176
pAIScripting0x05_L076:
    %AICMD0x1C_ShowDialog($0072, $00)                          ;B3D179
    %AICMD0x12_Jump(pAIScripting0x05_L070)                                   ;B3D17D
pAIScripting0x05_L077:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 30, pAIScripting0x05_L078)         ;B3D180
    %AICMD0x1C_ShowDialog($0073, $00)                          ;B3D187
    %AICMD0x12_Jump(pAIScripting0x05_L070)                                   ;B3D18B
pAIScripting0x05_L078:
    %AICMD0x1C_ShowDialog($03FF, $00)                          ;B3D18E
    %AICMD0x41_AddValue16(nPlayerHappiness, 5)                 ;B3D192
    %AICMD0x12_Jump(pAIScripting0x05_L070)                                   ;B3D198
pAIScripting0x05_L079:
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, pAIScripting0x05_L077)     ;B3D19B
    %AICMD0x17_RollRandom($02)                                            ;B3D1A2
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x05_L074)                                   ;B3D1A4
    %AICMD0x1C_ShowDialog($03E4, $00)                          ;B3D1A8
    %AICMD0x12_Jump(pAIScripting0x05_L070)                                   ;B3D1AC
pAIScripting0x05_L080:
    %AICMD0x10_End()                                           ;B3D1AF
pAIScripting0x05_L081:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $02, pAIScripting0x05_L089)   ;B3D1B0
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 1, pAIScripting0x05_L089)     ;B3D1B7
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, pAIScripting0x05_L089)     ;B3D1BE
    %AICMD0x1A($0058, $01A0, aAIScriptingData_L023, $00)                     ;B3D1C5
pAIScripting0x05_L082:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x05_L083)                                        ;B3D1CD
    %AICMD0x2D_JumpOnInteract(pAIScripting0x05_L086, pAIScripting0x05_L085)                               ;B3D1D0
    %AICMD0x12_Jump(pAIScripting0x05_L082)                                   ;B3D1D5
pAIScripting0x05_L083:
    %AICMD0x45_JumpIfBetween16(nLove_Ellen, 0, 249, pAIScripting0x05_L084)   ;B3D1D8
    %AICMD0x1C_ShowDialog($0440, $00)                          ;B3D1E2
    %AICMD0x12_Jump(pAIScripting0x05_L082)                                   ;B3D1E6
pAIScripting0x05_L084:
    %AICMD0x1C_ShowDialog($017A, $00)                          ;B3D1E9
    %AICMD0x12_Jump(pAIScripting0x05_L082)                                   ;B3D1ED
pAIScripting0x05_L085:
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3D1F0
    %AICMD0x12_Jump(pAIScripting0x05_L082)                                   ;B3D1F4
pAIScripting0x05_L086:
    %AICMD0x17_RollRandom($02)                                            ;B3D1F7
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x05_L087)                                   ;B3D1F9
    %AICMD0x18_JumpIfRandomEquals($01, pAIScripting0x05_L088)                                   ;B3D1FD
    %AICMD0x12_Jump(pAIScripting0x05_L082)                                   ;B3D201
pAIScripting0x05_L087:
    %AICMD0x1C_ShowDialog($00D6, $00)                          ;B3D204
    %AICMD0x12_Jump(pAIScripting0x05_L082)                                   ;B3D208
pAIScripting0x05_L088:
    %AICMD0x1C_ShowDialog($00D7, $00)                          ;B3D20B
    %AICMD0x12_Jump(pAIScripting0x05_L082)                                   ;B3D20F
pAIScripting0x05_L089:
    %AICMD0x10_End()                                           ;B3D212
pAIScripting0x05_L090:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $04, pAIScripting0x05_L126)   ;B3D213
    %AICMD0x1A($0038, $01C0, aAIScriptingData_L024, $00)                     ;B3D21A
    %AICMD0x22($18, $08, $01, aAIScriptingData_L025, $08)                    ;B3D222
pAIScripting0x05_L091:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x05_L094)                                        ;B3D229
    %AICMD0x2D_JumpOnInteract(pAIScripting0x05_L101, pAIScripting0x05_L096)                               ;B3D22C
    %AICMD0x12_Jump(pAIScripting0x05_L091)                                   ;B3D231
pAIScripting0x05_L092:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x05_L094)                                        ;B3D234
    %AICMD0x1F(pAIScripting0x05_L122)                                        ;B3D237
    %AICMD0x12_Jump(pAIScripting0x05_L092)                                   ;B3D23A
pAIScripting0x05_L093:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x05_L094)                                        ;B3D23D
    %AICMD0x1F(pAIScripting0x05_L123)                                        ;B3D240
    %AICMD0x12_Jump(pAIScripting0x05_L093)                                   ;B3D243
pAIScripting0x05_L094:
    %AICMD0x45_JumpIfBetween16(nLove_Eve, 0, 249, pAIScripting0x05_L095)     ;B3D246
    %AICMD0x1C_ShowDialog($0441, $00)                          ;B3D250
    %AICMD0x12_Jump(pAIScripting0x05_L091)                                   ;B3D254
pAIScripting0x05_L095:
    %AICMD0x1C_ShowDialog($017C, $00)                          ;B3D257
    %AICMD0x12_Jump(pAIScripting0x05_L091)                                   ;B3D25B
pAIScripting0x05_L096:
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 2, pAIScripting0x05_L097)              ;B3D25E
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 7, pAIScripting0x05_L097)              ;B3D265
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 1, 5, pAIScripting0x05_L098)          ;B3D26C
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 16, 23, pAIScripting0x05_L098)        ;B3D274
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 73, pAIScripting0x05_L099)             ;B3D27C
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 25, pAIScripting0x05_L099)             ;B3D283
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 6, pAIScripting0x05_L099)              ;B3D28A
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 9, 12, pAIScripting0x05_L100)         ;B3D291
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3D299
    %AICMD0x12_Jump(pAIScripting0x05_L091)                                   ;B3D29D
pAIScripting0x05_L097:
    %AICMD0x1C_ShowDialog($03B4, $00)                          ;B3D2A0
    %AICMD0x41_AddValue16(nLove_Eve, -8)                       ;B3D2A4
    %AICMD0x12_Jump(pAIScripting0x05_L091)                                   ;B3D2AA
pAIScripting0x05_L098:
    %AICMD0x1C_ShowDialog($03B2, $00)                          ;B3D2AD
    %AICMD0x41_AddValue16(nLove_Eve, 3)                        ;B3D2B1
    %AICMD0x12_Jump(pAIScripting0x05_L091)                                   ;B3D2B7
pAIScripting0x05_L099:
    %AICMD0x1C_ShowDialog($0212, $00)                          ;B3D2BA
    %AICMD0x41_AddValue16(nLove_Eve, 8)                        ;B3D2BE
    %AICMD0x12_Jump(pAIScripting0x05_L091)                                   ;B3D2C4
pAIScripting0x05_L100:
    %AICMD0x1C_ShowDialog($03BA, $00)                          ;B3D2C7
    %AICMD0x41_AddValue16(nLove_Eve, -2)                       ;B3D2CB
    %AICMD0x12_Jump(pAIScripting0x05_L091)                                   ;B3D2D1
pAIScripting0x05_L101:
    %AICMD0x45_JumpIfBetween16(nLove_Eve, 120, 149, pAIScripting0x05_L118)   ;B3D2D4
    %AICMD0x45_JumpIfBetween16(nLove_Eve, 150, 200, pAIScripting0x05_L119)   ;B3D2DE
    %AICMD0x14_JumpIfFlagSet($800196, $03, pAIScripting0x05_L125)            ;B3D2E8
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 0, pAIScripting0x05_L102)     ;B3D2EF
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 1, pAIScripting0x05_L108)     ;B3D2F6
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 2, pAIScripting0x05_L111)     ;B3D2FD
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, pAIScripting0x05_L115)     ;B3D304
    %AICMD0x12_Jump(pAIScripting0x05_L091)                                   ;B3D30B
pAIScripting0x05_L102:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 22, pAIScripting0x05_L107)         ;B3D30E
    %AICMD0x14_JumpIfFlagSet($800196, $01, pAIScripting0x05_L124)            ;B3D315
    %AICMD0x17_RollRandom($02)                                            ;B3D31C
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x05_L103)                                   ;B3D31E
    %AICMD0x18_JumpIfRandomEquals($01, pAIScripting0x05_L104)                                   ;B3D322
    %AICMD0x12_Jump(pAIScripting0x05_L091)                                   ;B3D326
pAIScripting0x05_L103:
    %AICMD0x1C_ShowDialog($00E5, $00)                          ;B3D329
    %AICMD0x12_Jump(pAIScripting0x05_L091)                                   ;B3D32D
pAIScripting0x05_L104:
    %AICMD0x1D_ShowDialog($00E6, $00)                          ;B3D330
    %AICMD0x20_JumpIfChoice(0, pAIScripting0x05_L105)                        ;B3D334
    %AICMD0x20_JumpIfChoice(1, pAIScripting0x05_L106)                        ;B3D338
    %AICMD0x12_Jump(pAIScripting0x05_L091)                                   ;B3D33C
pAIScripting0x05_L105:
    %AICMD0x1C_ShowDialog($00E7, $00)                          ;B3D33F
    %AICMD0x32_SetValue16($8000D4, $0015)                                 ;B3D343
    %AICMD0x41_AddValue16(nLove_Eve, 4)                        ;B3D349
    %AICMD0x12_Jump(pAIScripting0x05_L092)                                   ;B3D34F
pAIScripting0x05_L106:
    %AICMD0x1C_ShowDialog($00E8, $00)                          ;B3D352
    %AICMD0x41_AddValue16(nLove_Eve, 8)                        ;B3D356
    %AICMD0x12_Jump(pAIScripting0x05_L092)                                   ;B3D35C
pAIScripting0x05_L107:
    %AICMD0x1C_ShowDialog($020A, $00)                          ;B3D35F
    %AICMD0x12_Jump(pAIScripting0x05_L091)                                   ;B3D363
pAIScripting0x05_L108:
    %AICMD0x17_RollRandom($02)                                            ;B3D366
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x05_L109)                                   ;B3D368
    %AICMD0x18_JumpIfRandomEquals($01, pAIScripting0x05_L110)                                   ;B3D36C
    %AICMD0x12_Jump(pAIScripting0x05_L091)                                   ;B3D370
pAIScripting0x05_L109:
    %AICMD0x1C_ShowDialog($00E9, $00)                          ;B3D373
    %AICMD0x12_Jump(pAIScripting0x05_L091)                                   ;B3D377
pAIScripting0x05_L110:
    %AICMD0x1C_ShowDialog($00EA, $00)                          ;B3D37A
    %AICMD0x12_Jump(pAIScripting0x05_L091)                                   ;B3D37E
pAIScripting0x05_L111:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 11, pAIScripting0x05_L114)         ;B3D381
    %AICMD0x14_JumpIfFlagSet($800196, $01, pAIScripting0x05_L124)            ;B3D388
    %AICMD0x17_RollRandom($02)                                            ;B3D38F
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x05_L112)                                   ;B3D391
    %AICMD0x18_JumpIfRandomEquals($01, pAIScripting0x05_L113)                                   ;B3D395
    %AICMD0x12_Jump(pAIScripting0x05_L091)                                   ;B3D399
pAIScripting0x05_L112:
    %AICMD0x1C_ShowDialog($00EB, $00)                          ;B3D39C
    %AICMD0x12_Jump(pAIScripting0x05_L091)                                   ;B3D3A0
pAIScripting0x05_L113:
    %AICMD0x1C_ShowDialog($00EC, $00)                          ;B3D3A3
    %AICMD0x12_Jump(pAIScripting0x05_L091)                                   ;B3D3A7
pAIScripting0x05_L114:
    %AICMD0x1C_ShowDialog($023C, $00)                          ;B3D3AA
    %AICMD0x12_Jump(pAIScripting0x05_L091)                                   ;B3D3AE
pAIScripting0x05_L115:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 23, pAIScripting0x05_L116)         ;B3D3B1
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 30, pAIScripting0x05_L117)         ;B3D3B8
    %AICMD0x1C_ShowDialog($00ED, $00)                          ;B3D3BF
    %AICMD0x32_SetValue16($8000D4, $0015)                                 ;B3D3C3
    %AICMD0x41_AddValue16(nLove_Eve, 2)                        ;B3D3C9
    %AICMD0x12_Jump(pAIScripting0x05_L091)                                   ;B3D3CF
pAIScripting0x05_L116:
    %AICMD0x1C_ShowDialog($02B3, $00)                          ;B3D3D2
    %AICMD0x12_Jump(pAIScripting0x05_L091)                                   ;B3D3D6
pAIScripting0x05_L117:
    %AICMD0x1C_ShowDialog($03FC, $00)                          ;B3D3D9
    %AICMD0x32_SetValue16($8000D4, $0015)                                 ;B3D3DD
    %AICMD0x41_AddValue16(nLove_Eve, 2)                        ;B3D3E3
    %AICMD0x12_Jump(pAIScripting0x05_L091)                                   ;B3D3E9
pAIScripting0x05_L118:
    %AICMD0x1C_ShowDialog($00EE, $00)                          ;B3D3EC
    %AICMD0x12_Jump(pAIScripting0x05_L091)                                   ;B3D3F0
pAIScripting0x05_L119:
    %AICMD0x1D_ShowDialog($00EF, $00)                          ;B3D3F3
    %AICMD0x20_JumpIfChoice(0, pAIScripting0x05_L120)                        ;B3D3F7
    %AICMD0x20_JumpIfChoice(1, pAIScripting0x05_L121)                        ;B3D3FB
    %AICMD0x12_Jump(pAIScripting0x05_L091)                                   ;B3D3FF
pAIScripting0x05_L120:
    %AICMD0x1C_ShowDialog($00F0, $00)                          ;B3D402
    %AICMD0x41_AddValue16(nLove_Eve, 8)                        ;B3D406
    %AICMD0x12_Jump(pAIScripting0x05_L093)                                   ;B3D40C
pAIScripting0x05_L121:
    %AICMD0x1C_ShowDialog($00F1, $00)                          ;B3D40F
    %AICMD0x41_AddValue16(nLove_Eve, 2)                        ;B3D413
    %AICMD0x12_Jump(pAIScripting0x05_L093)                                   ;B3D419
pAIScripting0x05_L122:
    %AICMD0x1C_ShowDialog($00E3, $00)                          ;B3D41C
    %AICMD0x12_Jump(pAIScripting0x05_L092)                                   ;B3D420
pAIScripting0x05_L123:
    %AICMD0x1C_ShowDialog($0049, $00)                          ;B3D423
    %AICMD0x12_Jump(pAIScripting0x05_L093)                                   ;B3D427
pAIScripting0x05_L124:
    %AICMD0x1C_ShowDialog($00E0, $00)                          ;B3D42A
    %AICMD0x12_Jump(pAIScripting0x05_L091)                                   ;B3D42E
pAIScripting0x05_L125:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 23, pAIScripting0x05_L116)         ;B3D431
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 30, pAIScripting0x05_L117)         ;B3D438
    %AICMD0x1C_ShowDialog($039E, $00)                          ;B3D43F
    %AICMD0x12_Jump(pAIScripting0x05_L091)                                   ;B3D443
pAIScripting0x05_L126:
    %AICMD0x10_End()                                           ;B3D446
