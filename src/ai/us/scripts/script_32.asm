

    incsrc "../../../../build/gen/ai/slots_32.asm"
 
pAIScripting0x32_Data01:
    %AICMD0x00_SetMusic($10, $B4)                              ;B4CB5F
    %AICMD0x02_FreezeTime()                                    ;B4CB62
    %AICMD0x03_SetHour($06)                                    ;B4CB63
    %AICMD0x05_SetTransferPosition(128, 200)                   ;B4CB65
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B4CB6A
    %AICMD0x08_EnableAIControl()                               ;B4CB6C
    %AICMD0x09_StartScript($01, pAIScripting0x32_L004)                                   ;B4CB6D
    %AICMD0x09_StartScript($02, pAIScripting0x32_L006)                                   ;B4CB71
    %AICMD0x09_StartScript($03, pAIScripting0x32_L008)                                   ;B4CB75
    %AICMD0x09_StartScript($04, pAIScripting0x32_L010)                                   ;B4CB79
    %AICMD0x09_StartScript($05, pAIScripting0x32_L012)                                   ;B4CB7D
    %AICMD0x09_StartScript($06, pAIScripting0x32_L014)                                   ;B4CB81
    %AICMD0x09_StartScript($07, pAIScripting0x32_L001)                                   ;B4CB85
    %AICMD0x09_StartScript($08, pAIScripting0x32_L002)                                   ;B4CB89
    %AICMD0x3B($14)                                            ;B4CB8D
    %AICMD0x06_SetDestinationArea(!AREA_COOP)                  ;B4CB8F
    %AICMD0x38_WaitForFadeIn()                                               ;B4CB91
    %AICMD0x13_Wait(30)                                        ;B4CB92
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 16)                     ;B4CB95
    %AICMD0x13_Wait(10)                                        ;B4CB99
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 51)                   ;B4CB9C
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4CBA0
    %AICMD0x13_Wait(30)                                        ;B4CBA2
    %AICMD0x3F_ThrowCarriedItem()                              ;B4CBA5
    %AICMD0x13_Wait(60)                                        ;B4CBA6
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 16)                    ;B4CBA9
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 47)                  ;B4CBAD
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 24)                    ;B4CBB1
    %AICMD0x13_Wait(30)                                        ;B4CBB5
    %AICMD0x3E_SetCarryItem($14)                               ;B4CBB8
    %AICMD0x0B_SetScriptFlag($02)                                            ;B4CBBA
    %AICMD0x13_Wait(30)                                        ;B4CBBC
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 16)                    ;B4CBBF
    %AICMD0x13_Wait(20)                                        ;B4CBC3
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4CBC6
    %AICMD0x13_Wait(20)                                        ;B4CBC8
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 21)                   ;B4CBCB
    %AICMD0x3F_ThrowCarriedItem()                              ;B4CBCF
    %AICMD0x13_Wait(30)                                        ;B4CBD0
    %AICMD0x0B_SetScriptFlag($00)                                            ;B4CBD3
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B4CBD5
    %AICMD0x19($0042, $00)                                     ;B4CBD7
    %AICMD0x13_Wait(40)                                        ;B4CBDB
    %AICMD0x19($0026, $00)                                     ;B4CBDE
    %AICMD0x13_Wait(60)                                        ;B4CBE2
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 64)                   ;B4CBE5
    %AICMD0x0B_SetScriptFlag($03)                                            ;B4CBE9
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4CBEB
    %AICMD0x13_Wait(60)                                        ;B4CBED
    %AICMD0x19($0026, $00)                                     ;B4CBF0
    %AICMD0x13_Wait(60)                                        ;B4CBF4
    %AICMD0x3E_SetCarryItem($25)                               ;B4CBF7
    %AICMD0x13_Wait(30)                                        ;B4CBF9
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 64)                  ;B4CBFC
    %AICMD0x13_Wait(60)                                        ;B4CC00
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 64)                   ;B4CC03
    %AICMD0x13_Wait(60)                                        ;B4CC07
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 64)                     ;B4CC0A
    %AICMD0x13_Wait(60)                                        ;B4CC0E
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 40)                  ;B4CC11
    %AICMD0x13_Wait(20)                                        ;B4CC15
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 24)                   ;B4CC18
    %AICMD0x3D_TeleportToArea(!AREA_ENDING00)                  ;B4CC1C
    %AICMD0x10_End()                                           ;B4CC1E
pAIScripting0x32_L001:
    %AICMD0x1A($0078, $0088, aAIScriptingData_L010, $00)                     ;B4CC1F
    %AICMD0x0C_WaitForScriptFlag($02)                                            ;B4CC27
    %AICMD0x37()                                               ;B4CC29
    %AICMD0x10_End()                                           ;B4CC2A
pAIScripting0x32_L002:
    %AICMD0x1A($0048, $0060, aAIScriptingData_L010, $00)                     ;B4CC2B
pAIScripting0x32_L003:
    %AICMD0x13_Wait(1)                                         ;B4CC33
    %AICMD0x12_Jump(pAIScripting0x32_L003)                                   ;B4CC36
pAIScripting0x32_L004:
    %AICMD0x1A($00C0, $0048, aAIScriptingData_L164, $00)                     ;B4CC39
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B4CC41
    %AICMD0x1B($0214, $00)                                     ;B4CC43
    %AICMD0x0D($FF, $00, $20, $01)                             ;B4CC47
    %AICMD0x0D($00, $01, $3A, $01)                             ;B4CC4C
    %AICMD0x0D($FF, $00, $42, $01)                             ;B4CC51
    %AICMD0x1B($0212, $00)                                     ;B4CC56
    %AICMD0x0B_SetScriptFlag($01)                                            ;B4CC5A
    %AICMD0x0C_WaitForScriptFlag($03)                                            ;B4CC5C
    %AICMD0x0D($FF, $00, $28, $01)                             ;B4CC5E
    %AICMD0x2F(aAIScriptingData_L008)                                        ;B4CC63
    %AICMD0x22($10, $10, $01, aAIScriptingData_L008, $04)                    ;B4CC66
pAIScripting0x32_L005:
    %AICMD0x13_Wait(1)                                         ;B4CC6D
    %AICMD0x12_Jump(pAIScripting0x32_L005)                                   ;B4CC70
pAIScripting0x32_L006:
    %AICMD0x1A($00C8, $0078, aAIScriptingData_L008, $03)                     ;B4CC73
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B4CC7B
    %AICMD0x1B($0214, $00)                                     ;B4CC7D
    %AICMD0x0D($FF, $00, $20, $01)                             ;B4CC81
    %AICMD0x0D($FF, $01, $14, $01)                             ;B4CC86
    %AICMD0x0D($FF, $00, $38, $01)                             ;B4CC8B
    %AICMD0x0C_WaitForScriptFlag($03)                                            ;B4CC90
    %AICMD0x13_Wait(60)                                        ;B4CC92
    %AICMD0x0D($FF, $00, $28, $01)                             ;B4CC95
    %AICMD0x22($10, $08, $01, aAIScriptingData_L008, $04)                    ;B4CC9A
pAIScripting0x32_L007:
    %AICMD0x13_Wait(1)                                         ;B4CCA1
    %AICMD0x12_Jump(pAIScripting0x32_L007)                                   ;B4CCA4
pAIScripting0x32_L008:
    %AICMD0x1A($0038, $0050, aAIScriptingData_L008, $02)                     ;B4CCA7
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B4CCAF
    %AICMD0x1B($0212, $01)                                     ;B4CCB1
    %AICMD0x0D($00, $01, $18, $01)                             ;B4CCB5
    %AICMD0x13_Wait(10)                                        ;B4CCBA
    %AICMD0x0D($01, $01, $08, $01)                             ;B4CCBD
    %AICMD0x13_Wait(180)                                       ;B4CCC2
    %AICMD0x0C_WaitForScriptFlag($03)                                            ;B4CCC5
    %AICMD0x1B($0214, $00)                                     ;B4CCC7
    %AICMD0x0D($FF, $00, $18, $01)                             ;B4CCCB
    %AICMD0x22($08, $08, $01, aAIScriptingData_L008, $04)                    ;B4CCD0
pAIScripting0x32_L009:
    %AICMD0x13_Wait(1)                                         ;B4CCD7
    %AICMD0x12_Jump(pAIScripting0x32_L009)                                   ;B4CCDA
pAIScripting0x32_L010:
    %AICMD0x1A($0098, $00A8, aAIScriptingData_L008, $00)                     ;B4CCDD
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B4CCE5
    %AICMD0x1B($0212, $00)                                     ;B4CCE7
    %AICMD0x0D($FF, $00, $3C, $01)                             ;B4CCEB
    %AICMD0x1B($0213, $00)                                     ;B4CCF0
    %AICMD0x0D($FF, $FF, $10, $01)                             ;B4CCF4
    %AICMD0x0C_WaitForScriptFlag($03)                                            ;B4CCF9
    %AICMD0x0D($00, $FF, $08, $01)                             ;B4CCFB
    %AICMD0x0D($FF, $00, $20, $01)                             ;B4CD00
    %AICMD0x22($08, $08, $01, aAIScriptingData_L008, $04)                    ;B4CD05
pAIScripting0x32_L011:
    %AICMD0x13_Wait(1)                                         ;B4CD0C
    %AICMD0x12_Jump(pAIScripting0x32_L011)                                   ;B4CD0F
pAIScripting0x32_L012:
    %AICMD0x1A($0088, $0078, aAIScriptingData_L008, $01)                     ;B4CD12
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B4CD1A
    %AICMD0x1B($0212, $00)                                     ;B4CD1C
    %AICMD0x0D($FF, $00, $30, $01)                             ;B4CD20
    %AICMD0x13_Wait(30)                                        ;B4CD25
    %AICMD0x0D($00, $01, $08, $01)                             ;B4CD28
    %AICMD0x0C_WaitForScriptFlag($03)                                            ;B4CD2D
    %AICMD0x0D($FF, $00, $20, $01)                             ;B4CD2F
    %AICMD0x22($10, $08, $01, aAIScriptingData_L008, $04)                    ;B4CD34
pAIScripting0x32_L013:
    %AICMD0x13_Wait(1)                                         ;B4CD3B
    %AICMD0x12_Jump(pAIScripting0x32_L013)                                   ;B4CD3E
pAIScripting0x32_L014:
    %AICMD0x1A($00B8, $0068, aAIScriptingData_L009, $00)                     ;B4CD41
    %AICMD0x22($18, $18, $01, aAIScriptingData_L009, $0C)                    ;B4CD49
pAIScripting0x32_L015:
    %AICMD0x13_Wait(1)                                         ;B4CD50
    %AICMD0x12_Jump(pAIScripting0x32_L015)                                   ;B4CD53
