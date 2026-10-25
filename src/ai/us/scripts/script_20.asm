

    incsrc "../../../../build/gen/ai/slots_20.asm"
 
pAIScripting0x20_Data01:
    %AICMD0x50()                                               ;B49E51
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $09)       ;B49E52
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily3, $02)       ;B49E57
    %AICMD0x00_SetMusic($0C, $B4)                              ;B49E5C
    %AICMD0x01_UnfreezeTime()                                  ;B49E5F
    %AICMD0x03_SetHour($0E)                                    ;B49E60
    %AICMD0x05_SetTransferPosition(440, 160)                   ;B49E62
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B49E67
    %AICMD0x08_EnableAIControl()                               ;B49E69
    %AICMD0x09_StartScript($01, pAIScripting0x20_L006)                                   ;B49E6A
    %AICMD0x09_StartScript($02, pAIScripting0x20_L009)                                   ;B49E6E
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 0, pAIScripting0x20_L001)     ;B49E72
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 1, pAIScripting0x20_L002)     ;B49E79
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 2, pAIScripting0x20_L003)     ;B49E80
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, pAIScripting0x20_L004)     ;B49E87
pAIScripting0x20_L001:
    %AICMD0x06_SetDestinationArea(!AREA_TOWNSPRING)            ;B49E8E
    %AICMD0x12_Jump(pAIScripting0x20_L005)                                   ;B49E90
pAIScripting0x20_L002:
    %AICMD0x06_SetDestinationArea(!AREA_TOWNSUMMER)            ;B49E93
    %AICMD0x12_Jump(pAIScripting0x20_L005)                                   ;B49E95
pAIScripting0x20_L003:
    %AICMD0x06_SetDestinationArea(!AREA_TOWNFALL)              ;B49E98
    %AICMD0x12_Jump(pAIScripting0x20_L005)                                   ;B49E9A
pAIScripting0x20_L004:
    %AICMD0x06_SetDestinationArea(!AREA_TOWNWINTER)            ;B49E9D
    %AICMD0x12_Jump(pAIScripting0x20_L005)                                   ;B49E9F
pAIScripting0x20_L005:
    %AICMD0x38_WaitForFadeIn()                                               ;B49EA2
    %AICMD0x0B_SetScriptFlag($00)                                            ;B49EA3
    %AICMD0x0C_WaitForScriptFlag($02)                                            ;B49EA5
    %AICMD0x19($0025, $00)                                     ;B49EA7
    %AICMD0x13_Wait(180)                                       ;B49EAB
    %AICMD0x01_UnfreezeTime()                                  ;B49EAE
    %AICMD0x24_NextHourPalette($74)                            ;B49EAF
    %AICMD0x13_Wait(180)                                       ;B49EB1
    %AICMD0x1C_ShowDialog($038A, $00)                          ;B49EB4
    %AICMD0x41_AddValue16(nPlayerHappiness, -100)              ;B49EB8
    %AICMD0x03_SetHour($0F)                                    ;B49EBE
    %AICMD0x47_SetValue8(wram80(nTimeState), 3)                           ;B49EC0
    %AICMD0x10_End()                                           ;B49EC5
pAIScripting0x20_L006:
    %AICMD0x1A($0198, $0098, aAIScriptingData_L051, $02)                     ;B49EC6
pAIScripting0x20_L007:
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B49ECE
    %AICMD0x13_Wait(120)                                       ;B49ED0
    %AICMD0x1C_ShowDialog($0315, $00)                          ;B49ED3
    %AICMD0x0B_SetScriptFlag($01)                                            ;B49ED7
pAIScripting0x20_L008:
    %AICMD0x1F(pAIScripting0x20_L007)                                        ;B49ED9
    %AICMD0x12_Jump(pAIScripting0x20_L008)                                   ;B49EDC
pAIScripting0x20_L009:
    %AICMD0x1A($01F8, $0090, aAIScriptingData_L053, $03)                     ;B49EDF
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B49EE7
    %AICMD0x1B($02B0, $00)                                     ;B49EE9
    %AICMD0x0D($FF, $00, $30, $01)                             ;B49EED
    %AICMD0x1B($02AB, $00)                                     ;B49EF2
    %AICMD0x13_Wait(120)                                       ;B49EF6
    %AICMD0x1C_ShowDialog($0316, $00)                          ;B49EF9
    %AICMD0x1B($02B0, $01)                                     ;B49EFD
    %AICMD0x0D($01, $00, $30, $01)                             ;B49F01
    %AICMD0x1B($02AC, $00)                                     ;B49F06
    %AICMD0x0D($00, $01, $90, $01)                             ;B49F0A
    %AICMD0x0B_SetScriptFlag($02)                                            ;B49F0F
    %AICMD0x37()                                               ;B49F11
    %AICMD0x10_End()                                           ;B49F12
