

    incsrc "../../../../build/gen/ai/slots_37.asm"
 
pAIScripting0x37_Data01:
    %AICMD0x47_SetValue8(wram80(strcPlayerData.toolEquipped), 16)                          ;B4D2EC
    %AICMD0x47_SetValue8(wram80(strcPlayerData.leftWater), 5)                           ;B4D2F1
    %AICMD0x00_SetMusic($10, $B4)                              ;B4D2F6
    %AICMD0x02_FreezeTime()                                    ;B4D2F9
    %AICMD0x03_SetHour($06)                                    ;B4D2FA
    %AICMD0x05_SetTransferPosition(88, 104)                    ;B4D2FC
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4D301
    %AICMD0x08_EnableAIControl()                               ;B4D303
    %AICMD0x09_StartScript($01, pAIScripting0x37_L001)                                   ;B4D304
    %AICMD0x09_StartScript($02, pAIScripting0x37_L003)                                   ;B4D308
    %AICMD0x09_StartScript($03, pAIScripting0x37_L004)                                   ;B4D30C
    %AICMD0x06_SetDestinationArea(!AREA_ENDING10)              ;B4D310
    %AICMD0x38_WaitForFadeIn()                                               ;B4D312
    %AICMD0x13_Wait(30)                                        ;B4D313
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 40)                  ;B4D316
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4D31A
    %AICMD0x56_UseEquippedItem()                               ;B4D31C
    %AICMD0x13_Wait(80)                                        ;B4D31D
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 16)                  ;B4D320
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4D324
    %AICMD0x13_Wait(30)                                        ;B4D326
    %AICMD0x56_UseEquippedItem()                               ;B4D329
    %AICMD0x13_Wait(80)                                        ;B4D32A
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 16)                  ;B4D32D
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4D331
    %AICMD0x13_Wait(30)                                        ;B4D333
    %AICMD0x56_UseEquippedItem()                               ;B4D336
    %AICMD0x13_Wait(80)                                        ;B4D337
    %AICMD0x0B_SetScriptFlag($00)                                            ;B4D33A
    %AICMD0x13_Wait(60)                                        ;B4D33C
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4D33F
    %AICMD0x0C_WaitForScriptFlag($02)                                            ;B4D341
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 64)                  ;B4D343
    %AICMD0x13_Wait(60)                                        ;B4D347
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 40)                  ;B4D34A
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4D34E
    %AICMD0x13_Wait(30)                                        ;B4D350
    %AICMD0x3E_SetCarryItem($13)                               ;B4D353
    %AICMD0x13_Wait(30)                                        ;B4D355
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 48)                   ;B4D358
    %AICMD0x13_Wait(20)                                        ;B4D35C
    %AICMD0x3F_ThrowCarriedItem()                              ;B4D35F
    %AICMD0x13_Wait(10)                                        ;B4D360
    %AICMD0x09_StartScript($04, pAIScripting0x37_L005)                                   ;B4D363
    %AICMD0x0B_SetScriptFlag($04)                                            ;B4D367
    %AICMD0x13_Wait(60)                                        ;B4D369
    %AICMD0x19($000F, $00)                                     ;B4D36C
    %AICMD0x13_Wait(40)                                        ;B4D370
    %AICMD0x19($0023, $00)                                     ;B4D373
    %AICMD0x13_Wait(40)                                        ;B4D377
    %AICMD0x19($000F, $00)                                     ;B4D37A
    %AICMD0x13_Wait(40)                                        ;B4D37E
    %AICMD0x3D_TeleportToArea(!AREA_ENDING00)                  ;B4D381
    %AICMD0x10_End()                                           ;B4D383
pAIScripting0x37_L001:
    %AICMD0x1A($0078, $0058, aAIScriptingData_L004, $02)                     ;B4D384
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B4D38C
    %AICMD0x1B($01F2, $00)                                     ;B4D38E
    %AICMD0x13_Wait(120)                                       ;B4D392
    %AICMD0x0B_SetScriptFlag($01)                                            ;B4D395
    %AICMD0x1B($01EA, $00)                                     ;B4D397
pAIScripting0x37_L002:
    %AICMD0x13_Wait(1)                                         ;B4D39B
    %AICMD0x12_Jump(pAIScripting0x37_L002)                                   ;B4D39E
pAIScripting0x37_L003:
    %AICMD0x1A($FFE8, $0068, aAIScriptingData_L080, $00)                     ;B4D3A1
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B4D3A9
    %AICMD0x1B($030E, $01)                                     ;B4D3AB
    %AICMD0x0D($01, $00, $BC, $02)                             ;B4D3AF
    %AICMD0x1B($030D, $01)                                     ;B4D3B4
    %AICMD0x0C_WaitForScriptFlag($04)                                            ;B4D3B8
    %AICMD0x13_Wait(30)                                        ;B4D3BA
    %AICMD0x1B($030E, $00)                                     ;B4D3BD
    %AICMD0x0D($FF, $00, $60, $02)                             ;B4D3C1
    %AICMD0x1B($030D, $01)                                     ;B4D3C6
    %AICMD0x13_Wait(30)                                        ;B4D3CA
    %AICMD0x1B($0309, $00)                                     ;B4D3CD
    %AICMD0x13_Wait(90)                                        ;B4D3D1
    %AICMD0x1B($0311, $00)                                     ;B4D3D4
    %AICMD0x13_Wait(120)                                       ;B4D3D8
    %AICMD0x1B($030E, $00)                                     ;B4D3DB
    %AICMD0x0D($FF, $00, $60, $02)                             ;B4D3DF
    %AICMD0x37()                                               ;B4D3E4
    %AICMD0x10_End()                                           ;B4D3E5
pAIScripting0x37_L004:
    %AICMD0x1A($FFF8, $0068, aAIScriptingData_L080, $00)                     ;B4D3E6
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B4D3EE
    %AICMD0x1B($030E, $01)                                     ;B4D3F0
    %AICMD0x0D($01, $00, $C0, $02)                             ;B4D3F4
    %AICMD0x1B($030F, $01)                                     ;B4D3F9
    %AICMD0x0B_SetScriptFlag($02)                                            ;B4D3FD
    %AICMD0x0C_WaitForScriptFlag($04)                                            ;B4D3FF
    %AICMD0x13_Wait(30)                                        ;B4D401
    %AICMD0x1B($030E, $00)                                     ;B4D404
    %AICMD0x0D($FF, $00, $60, $02)                             ;B4D408
    %AICMD0x1B($030D, $00)                                     ;B4D40D
    %AICMD0x13_Wait(30)                                        ;B4D411
    %AICMD0x1B($030D, $01)                                     ;B4D414
    %AICMD0x13_Wait(90)                                        ;B4D418
    %AICMD0x1B($0311, $00)                                     ;B4D41B
    %AICMD0x13_Wait(120)                                       ;B4D41F
    %AICMD0x1B($030E, $00)                                     ;B4D422
    %AICMD0x0D($FF, $00, $60, $02)                             ;B4D426
    %AICMD0x37()                                               ;B4D42B
    %AICMD0x10_End()                                           ;B4D42C
pAIScripting0x37_L005:
    %AICMD0x1A($004E, $0064, aAIScriptingData_L191, $00)                     ;B4D42D
    %AICMD0x13_Wait(30)                                        ;B4D435
    %AICMD0x0D($FF, $00, $60, $02)                             ;B4D438
    %AICMD0x13_Wait(240)                                       ;B4D43D
    %AICMD0x0D($FF, $00, $60, $02)                             ;B4D440
    %AICMD0x37()                                               ;B4D445
    %AICMD0x10_End()                                           ;B4D446
