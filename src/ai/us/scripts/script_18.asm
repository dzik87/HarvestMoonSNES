

    incsrc "../../../../build/gen/ai/slots_18.asm"
 
pAIScripting0x18_Data01:
    %AICMD0x09_StartScript($01, pAIScripting0x18_L003)                                   ;B48EE5
    %AICMD0x38_WaitForFadeIn()                                               ;B48EE9
    %AICMD0x10_End()                                           ;B48EEA
pAIScripting0x18_L001:
    %AICMD0x15_JumpIfEquals8(nCurrentTimeID, 18, pAIScripting0x18_L002)      ;B48EEB
    %AICMD0x13_Wait(1)                                         ;B48EF2
    %AICMD0x12_Jump(pAIScripting0x18_L001)                                   ;B48EF5
pAIScripting0x18_L002:
    %AICMD0x10_End()                                           ;B48EF8
pAIScripting0x18_L003:
    %AICMD0x15_JumpIfEquals8(nCurrentTimeID, 18, pAIScripting0x18_L012)      ;B48EF9
    %AICMD0x1A($0098, $01A8, aAIScriptingData_L082, $01)                     ;B48F00
pAIScripting0x18_L004:
    %AICMD0x2D_JumpOnInteract(pAIScripting0x18_L006, pAIScripting0x18_L007)                               ;B48F08
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 18, 24, pAIScripting0x18_L011) ;B48F0D
    %AICMD0x12_Jump(pAIScripting0x18_L004)                                   ;B48F15
pAIScripting0x18_L005:
    %AICMD0x2D_JumpOnInteract(pAIScripting0x18_L010, pAIScripting0x18_L007)                               ;B48F18
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 18, 24, pAIScripting0x18_L011) ;B48F1D
    %AICMD0x12_Jump(pAIScripting0x18_L005)                                   ;B48F25
pAIScripting0x18_L006:
    %AICMD0x1C_ShowDialog($032B, $00)                          ;B48F28
    %AICMD0x12_Jump(pAIScripting0x18_L005)                                   ;B48F2C
pAIScripting0x18_L007:
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 1, pAIScripting0x18_L008)              ;B48F2F
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 2, pAIScripting0x18_L009)              ;B48F36
    %AICMD0x1C_ShowDialog($032F, $00)                          ;B48F3D
    %AICMD0x12_Jump(pAIScripting0x18_L004)                                   ;B48F41
pAIScripting0x18_L008:
    %AICMD0x1B($0309, $01)                                     ;B48F44
    %AICMD0x1C_ShowDialog($032D, $00)                          ;B48F48
    %AICMD0x23_OrWithIndexedValue(strcFlags.event4, $08)       ;B48F4C
    %AICMD0x41_AddValue16(nPlayerHappiness, 20)                ;B48F51
    %AICMD0x12_Jump(pAIScripting0x18_L011)                                   ;B48F57
pAIScripting0x18_L009:
    %AICMD0x1C_ShowDialog($032E, $00)                          ;B48F5A
    %AICMD0x41_AddValue16(nPlayerHappiness, -20)               ;B48F5E
    %AICMD0x12_Jump(pAIScripting0x18_L005)                                   ;B48F64
pAIScripting0x18_L010:
    %AICMD0x1C_ShowDialog($032C, $00)                          ;B48F67
    %AICMD0x12_Jump(pAIScripting0x18_L005)                                   ;B48F6B
pAIScripting0x18_L011:
    %AICMD0x1B($030E, $01)                                     ;B48F6E
    %AICMD0x0D($02, $FE, $04, $01)                             ;B48F72
    %AICMD0x0D($02, $02, $04, $01)                             ;B48F77
    %AICMD0x1B($030E, $01)                                     ;B48F7C
    %AICMD0x0D($01, $00, $48, $01)                             ;B48F80
    %AICMD0x1B($030E, $01)                                     ;B48F85
    %AICMD0x0D($02, $FE, $06, $01)                             ;B48F89
    %AICMD0x0D($02, $02, $04, $01)                             ;B48F8E
    %AICMD0x37()                                               ;B48F93
pAIScripting0x18_L012:
    %AICMD0x10_End()                                           ;B48F94
