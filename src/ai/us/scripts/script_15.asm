

pAIScripting0x15:
    dw pAIScripting0x15_Data01                                            ;B48C25|        |B48C45;
    dw pAIScripting0x16                                        ;B48C27|        |B48D38;
    dw pAIScripting0x16                                        ;B48C29|        |B48D38;
    dw pAIScripting0x16                                        ;B48C2B|        |B48D38;
    dw pAIScripting0x16                                        ;B48C2D|        |B48D38;
    dw pAIScripting0x16                                        ;B48C2F|        |B48D38;
    dw pAIScripting0x16                                        ;B48C31|        |B48D38;
    dw pAIScripting0x16                                        ;B48C33|        |B48D38;
    dw pAIScripting0x16                                        ;B48C35|        |B48D38;
    dw pAIScripting0x16                                        ;B48C37|        |B48D38;
    dw pAIScripting0x16                                        ;B48C39|        |B48D38;
    dw pAIScripting0x16                                        ;B48C3B|        |B48D38;
    dw pAIScripting0x16                                        ;B48C3D|        |B48D38;
    dw pAIScripting0x16                                        ;B48C3F|        |B48D38;
    dw pAIScripting0x16                                        ;B48C41|        |B48D38;
    dw pAIScripting0x16                                        ;B48C43|        |B48D38;
 
pAIScripting0x15_Data01:
    %AICMD0x05_SetTransferPosition(184, 360)                   ;B48C45
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B48C4A
    %AICMD0x08_EnableAIControl()                               ;B48C4C
    %AICMD0x09_StartScript($01, pAIScripting0x15_L002)                                   ;B48C4D
    %AICMD0x09_StartScript($02, pAIScripting0x15_L013)                                   ;B48C51
    %AICMD0x09_StartScript($03, pAIScripting0x15_L018)                                   ;B48C55
    %AICMD0x38_WaitForFadeIn()                                               ;B48C59
    %AICMD0x11_EnableUserControl()                             ;B48C5A
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B48C5B
    %AICMD0x08_EnableAIControl()                               ;B48C5D
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B48C5E
    %AICMD0x11_EnableUserControl()                             ;B48C60
pAIScripting0x15_L001:
    %AICMD0x13_Wait(1)                                         ;B48C61
    %AICMD0x12_Jump(pAIScripting0x15_L001)                                   ;B48C64
pAIScripting0x15_L002:
    %AICMD0x1A($0058, $0178, aAIScriptingData_L081, $02)                     ;B48C67
pAIScripting0x15_L003:
    %AICMD0x1F(pAIScripting0x15_L005)                                        ;B48C6F
    %AICMD0x12_Jump(pAIScripting0x15_L003)                                   ;B48C72
pAIScripting0x15_L004:
    %AICMD0x1F(pAIScripting0x15_L011)                                        ;B48C75
    %AICMD0x12_Jump(pAIScripting0x15_L004)                                   ;B48C78
pAIScripting0x15_L005:
    %AICMD0x23_OrWithIndexedValue(strcFlags.event3, $0D)       ;B48C7B
    %AICMD0x1D_ShowDialog($0327, $00)                          ;B48C80
    %AICMD0x20_JumpIfChoice(0, pAIScripting0x15_L006)                        ;B48C84
    %AICMD0x20_JumpIfChoice(1, pAIScripting0x15_L010)                        ;B48C88
    %AICMD0x12_Jump(pAIScripting0x15_L012)                                   ;B48C8C
pAIScripting0x15_L006:
    %AICMD0x1C_ShowDialog($0328, $00)                          ;B48C8F
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.toolEquipped), 1, pAIScripting0x15_L007)              ;B48C93
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.toolSecond), 1, pAIScripting0x15_L008)              ;B48C9A
    %AICMD0x12_Jump(pAIScripting0x15_L009)                                   ;B48CA1
pAIScripting0x15_L007:
    %AICMD0x47_SetValue8(wram80(strcPlayerData.toolEquipped), 0)                           ;B48CA4
    %AICMD0x12_Jump(pAIScripting0x15_L009)                                   ;B48CA9
pAIScripting0x15_L008:
    %AICMD0x47_SetValue8(wram80(strcPlayerData.toolSecond), 0)                           ;B48CAC
    %AICMD0x12_Jump(pAIScripting0x15_L009)                                   ;B48CB1
pAIScripting0x15_L009:
    %AICMD0x28_ClearBit(strcShedItems.row1, $00)                        ;B48CB4
    %AICMD0x23_OrWithIndexedValue(strcFlags.event6, $0F)       ;B48CB9
    %AICMD0x41_AddValue16(nPlayerHappiness, 20)                ;B48CBE
    %AICMD0x0B_SetScriptFlag($00)                                            ;B48CC4
    %AICMD0x12_Jump(pAIScripting0x15_L012)                                   ;B48CC6
pAIScripting0x15_L010:
    %AICMD0x1C_ShowDialog($0329, $00)                          ;B48CC9
    %AICMD0x23_OrWithIndexedValue(strcFlags.event4, $00)       ;B48CCD
    %AICMD0x41_AddValue16(nPlayerHappiness, -10)               ;B48CD2
    %AICMD0x0B_SetScriptFlag($00)                                            ;B48CD8
    %AICMD0x12_Jump(pAIScripting0x15_L012)                                   ;B48CDA
pAIScripting0x15_L011:
    %AICMD0x1C_ShowDialog($032A, $00)                          ;B48CDD
    %AICMD0x12_Jump(pAIScripting0x15_L004)                                   ;B48CE1
pAIScripting0x15_L012:
    %AICMD0x1B($030E, $00)                                     ;B48CE4
    %AICMD0x0D($FF, $00, $30, $01)                             ;B48CE8
    %AICMD0x1B($030E, $01)                                     ;B48CED
    %AICMD0x0B_SetScriptFlag($01)                                            ;B48CF1
    %AICMD0x12_Jump(pAIScripting0x15_L004)                                   ;B48CF3
pAIScripting0x15_L013:
    %AICMD0x1A($0058, $0188, aAIScriptingData_L081, $00)                     ;B48CF6
    %AICMD0x22($04, $04, $01, aAIScriptingData_L081, $02)                    ;B48CFE
pAIScripting0x15_L014:
    %AICMD0x1F(pAIScripting0x15_L016)                                        ;B48D05
    %AICMD0x12_Jump(pAIScripting0x15_L014)                                   ;B48D08
pAIScripting0x15_L015:
    %AICMD0x1F(pAIScripting0x15_L017)                                        ;B48D0B
    %AICMD0x12_Jump(pAIScripting0x15_L015)                                   ;B48D0E
pAIScripting0x15_L016:
    %AICMD0x1C_ShowDialog($0325, $00)                          ;B48D11
    %AICMD0x12_Jump(pAIScripting0x15_L015)                                   ;B48D15
pAIScripting0x15_L017:
    %AICMD0x1C_ShowDialog($032A, $00)                          ;B48D18
    %AICMD0x12_Jump(pAIScripting0x15_L015)                                   ;B48D1C
pAIScripting0x15_L018:
    %AICMD0x1A($0088, $0058, aAIScriptingData_L080, $00)                     ;B48D1F
pAIScripting0x15_L019:
    %AICMD0x1F(pAIScripting0x15_L020)                                        ;B48D27
    %AICMD0x12_Jump(pAIScripting0x15_L019)                                   ;B48D2A
pAIScripting0x15_L020:
    %AICMD0x1C_ShowDialog($0326, $00)                          ;B48D2D
    %AICMD0x1B($0311, $01)                                     ;B48D31
    %AICMD0x12_Jump(pAIScripting0x15_L019)                                   ;B48D35
