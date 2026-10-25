

    incsrc "../../../../build/gen/ai/slots_2E.asm"
 
pAIScripting0x2E_Data01:
    %AICMD0x00_SetMusic($01, $B4)                              ;B4C614
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily3, $02)       ;B4C617
    %AICMD0x05_SetTransferPosition(136, 120)                   ;B4C61C
    %AICMD0x02_FreezeTime()                                    ;B4C621
    %AICMD0x03_SetHour($07)                                    ;B4C622
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4C624
    %AICMD0x08_EnableAIControl()                               ;B4C626
    %AICMD0x09_StartScript($01, pAIScripting0x2E_L007)                                   ;B4C627
    %AICMD0x09_StartScript($02, pAIScripting0x2E_L006)                                   ;B4C62B
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $00, pAIScripting0x2E_L001)   ;B4C62F
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $01, pAIScripting0x2E_L001)   ;B4C636
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, pAIScripting0x2E_L001)   ;B4C63D
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $03, pAIScripting0x2E_L001)   ;B4C644
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $04, pAIScripting0x2E_L001)   ;B4C64B
    %AICMD0x12_Jump(pAIScripting0x2E_L002)                                   ;B4C652
pAIScripting0x2E_L001:
    %AICMD0x09_StartScript($03, pAIScripting0x2E_L008)                                   ;B4C655
pAIScripting0x2E_L002:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $07, pAIScripting0x2E_L004)   ;B4C659
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $06, pAIScripting0x2E_L003)   ;B4C660
    %AICMD0x06_SetDestinationArea(!AREA_HOUSE1)                ;B4C667
    %AICMD0x12_Jump(pAIScripting0x2E_L005)                                   ;B4C669
pAIScripting0x2E_L003:
    %AICMD0x06_SetDestinationArea(!AREA_HOUSE2)                ;B4C66C
    %AICMD0x12_Jump(pAIScripting0x2E_L005)                                   ;B4C66E
pAIScripting0x2E_L004:
    %AICMD0x06_SetDestinationArea(!AREA_HOUSE3)                ;B4C671
    %AICMD0x12_Jump(pAIScripting0x2E_L005)                                   ;B4C673
pAIScripting0x2E_L005:
    %AICMD0x38_WaitForFadeIn()                                               ;B4C676
    %AICMD0x13_Wait(90)                                        ;B4C677
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 32)                  ;B4C67A
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 64)                  ;B4C67E
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4C682
    %AICMD0x0B_SetScriptFlag($00)                                            ;B4C684
    %AICMD0x13_Wait(90)                                        ;B4C686
    %AICMD0x0C_WaitForScriptFlag($02)                                            ;B4C689
    %AICMD0x13_Wait(60)                                        ;B4C68B
    %AICMD0x3D_TeleportToArea(!AREA_ENDING00)                  ;B4C68E
    %AICMD0x10_End()                                           ;B4C690
pAIScripting0x2E_L006:
    %AICMD0x1A($0088, $00B8, aAIScriptingData_L069, $03)                     ;B4C691
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B4C699
    %AICMD0x13_Wait(30)                                        ;B4C69B
    %AICMD0x1B($02DC, $00)                                     ;B4C69E
    %AICMD0x0D($FF, $00, $10, $01)                             ;B4C6A2
    %AICMD0x1B($02DE, $00)                                     ;B4C6A7
    %AICMD0x13_Wait(120)                                       ;B4C6AB
    %AICMD0x0B_SetScriptFlag($02)                                            ;B4C6AE
    %AICMD0x10_End()                                           ;B4C6B0
pAIScripting0x2E_L007:
    %AICMD0x1A($0078, $00B8, aAIScriptingData_L070, $02)                     ;B4C6B1
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B4C6B9
    %AICMD0x1B($02E0, $00)                                     ;B4C6BB
    %AICMD0x13_Wait(120)                                       ;B4C6BF
    %AICMD0x1B($02DF, $00)                                     ;B4C6C2
    %AICMD0x0D($00, $01, $10, $01)                             ;B4C6C6
    %AICMD0x13_Wait(20)                                        ;B4C6CB
    %AICMD0x0B_SetScriptFlag($01)                                            ;B4C6CE
    %AICMD0x1B($02E0, $00)                                     ;B4C6D0
    %AICMD0x13_Wait(120)                                       ;B4C6D4
    %AICMD0x10_End()                                           ;B4C6D7
pAIScripting0x2E_L008:
    %AICMD0x1A($00A8, $0078, aAIScriptingData_L073, $00)                     ;B4C6D8
pAIScripting0x2E_L009:
    %AICMD0x1B($02E7, $00)                                     ;B4C6E0
    %AICMD0x13_Wait(120)                                       ;B4C6E4
    %AICMD0x1B($02E3, $00)                                     ;B4C6E7
    %AICMD0x13_Wait(240)                                       ;B4C6EB
    %AICMD0x12_Jump(pAIScripting0x2E_L009)                                   ;B4C6EE
