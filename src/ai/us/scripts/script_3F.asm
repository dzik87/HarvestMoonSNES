

pAIScripting0x3F:
    dw pAIScripting0x3F_Data01                                            ;B4E3FF|        |B4E41F;
    dw pAIScripting0x40                                        ;B4E401|        |B4E5F4;
    dw pAIScripting0x40                                        ;B4E403|        |B4E5F4;
    dw pAIScripting0x40                                        ;B4E405|        |B4E5F4;
    dw pAIScripting0x40                                        ;B4E407|        |B4E5F4;
    dw pAIScripting0x40                                        ;B4E409|        |B4E5F4;
    dw pAIScripting0x40                                        ;B4E40B|        |B4E5F4;
    dw pAIScripting0x40                                        ;B4E40D|        |B4E5F4;
    dw pAIScripting0x40                                        ;B4E40F|        |B4E5F4;
    dw pAIScripting0x40                                        ;B4E411|        |B4E5F4;
    dw pAIScripting0x40                                        ;B4E413|        |B4E5F4;
    dw pAIScripting0x40                                        ;B4E415|        |B4E5F4;
    dw pAIScripting0x40                                        ;B4E417|        |B4E5F4;
    dw pAIScripting0x40                                        ;B4E419|        |B4E5F4;
    dw pAIScripting0x40                                        ;B4E41B|        |B4E5F4;
    dw pAIScripting0x40                                        ;B4E41D|        |B4E5F4;
 
pAIScripting0x3F_Data01:
    %AICMD0x00_SetMusic($10, $B4)                              ;B4E41F
    %AICMD0x02_FreezeTime()                                    ;B4E422
    %AICMD0x03_SetHour($07)                                    ;B4E423
    %AICMD0x05_SetTransferPosition(680, 392)                   ;B4E425
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B4E42A
    %AICMD0x08_EnableAIControl()                               ;B4E42C
    %AICMD0x09_StartScript($01, pAIScripting0x3F_L004)                                   ;B4E42D
    %AICMD0x09_StartScript($02, pAIScripting0x3F_L011)                                   ;B4E431
    %AICMD0x09_StartScript($03, pAIScripting0x3F_L001)                                   ;B4E435
    %AICMD0x09_StartScript($04, pAIScripting0x3F_L008)                                   ;B4E439
    %AICMD0x09_StartScript($05, pAIScripting0x3F_L006)                                   ;B4E43D
    %AICMD0x09_StartScript($06, pAIScripting0x3F_L013)                                   ;B4E441
    %AICMD0x06_SetDestinationArea(!AREA_TOWNSUMMER)            ;B4E445
    %AICMD0x38_WaitForFadeIn()                                               ;B4E447
    %AICMD0x13_Wait(60)                                        ;B4E448
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 48)                     ;B4E44B
    %AICMD0x13_Wait(20)                                        ;B4E44F
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 80)                   ;B4E452
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B4E456
    %AICMD0x0B_SetScriptFlag($00)                                            ;B4E458
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B4E45A
    %AICMD0x19($0038, $00)                                     ;B4E45C
    %AICMD0x13_Wait(90)                                        ;B4E460
    %AICMD0x19($0029, $00)                                     ;B4E463
    %AICMD0x13_Wait(90)                                        ;B4E467
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 76)                   ;B4E46A
    %AICMD0x0B_SetScriptFlag($02)                                            ;B4E46E
    %AICMD0x19($0003, $00)                                     ;B4E470
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4E474
    %AICMD0x13_Wait(300)                                       ;B4E476
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 80)                   ;B4E479
    %AICMD0x13_Wait(10)                                        ;B4E47D
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4E480
    %AICMD0x0B_SetScriptFlag($03)                                            ;B4E482
    %AICMD0x0C_WaitForScriptFlag($07)                                            ;B4E484
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 8)                  ;B4E486
    %AICMD0x13_Wait(90)                                        ;B4E48A
    %AICMD0x19($00CC, $00)                                     ;B4E48D
    %AICMD0x13_Wait(120)                                       ;B4E491
    %AICMD0x19($008F, $00)                                     ;B4E494
    %AICMD0x13_Wait(120)                                       ;B4E498
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 80)                  ;B4E49B
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4E49F
    %AICMD0x0B_SetScriptFlag($04)                                            ;B4E4A1
    %AICMD0x0C_WaitForScriptFlag($05)                                            ;B4E4A3
    %AICMD0x13_Wait(60)                                        ;B4E4A5
    %AICMD0x19($0039, $00)                                     ;B4E4A8
    %AICMD0x13_Wait(90)                                        ;B4E4AC
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 24)                   ;B4E4AF
    %AICMD0x13_Wait(10)                                        ;B4E4B3
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 40)                   ;B4E4B6
    %AICMD0x13_Wait(40)                                        ;B4E4BA
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 68)                   ;B4E4BD
    %AICMD0x13_Wait(30)                                        ;B4E4C1
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 52)                  ;B4E4C4
    %AICMD0x0B_SetScriptFlag($06)                                            ;B4E4C8
    %AICMD0x13_Wait(120)                                       ;B4E4CA
    %AICMD0x19($0023, $00)                                     ;B4E4CD
    %AICMD0x13_Wait(50)                                        ;B4E4D1
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 16)                  ;B4E4D4
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4E4D8
    %AICMD0x13_Wait(60)                                        ;B4E4DA
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 48)                  ;B4E4DD
    %AICMD0x3D_TeleportToArea(!AREA_ENDING00)                  ;B4E4E1
    %AICMD0x10_End()                                           ;B4E4E3
pAIScripting0x3F_L001:
    %AICMD0x1A($0208, $00F8, aAIScriptingData_L020, $00)                     ;B4E4E4
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B4E4EC
    %AICMD0x0D($00, $01, $1C, $01)                             ;B4E4EE
    %AICMD0x13_Wait(20)                                        ;B4E4F3
    %AICMD0x09_StartScript($06, pAIScripting0x3F_L003)                                   ;B4E4F6
    %AICMD0x13_Wait(120)                                       ;B4E4FA
    %AICMD0x0B_SetScriptFlag($01)                                            ;B4E4FD
    %AICMD0x1B($0351, $00)                                     ;B4E4FF
pAIScripting0x3F_L002:
    %AICMD0x13_Wait(1)                                         ;B4E503
    %AICMD0x12_Jump(pAIScripting0x3F_L002)                                   ;B4E506
pAIScripting0x3F_L003:
    %AICMD0x1A($0208, $0114, aAIScriptingData_L187, $00)                     ;B4E509
    %AICMD0x13_Wait(120)                                       ;B4E511
    %AICMD0x37()                                               ;B4E514
    %AICMD0x10_End()                                           ;B4E515
pAIScripting0x3F_L004:
    %AICMD0x1A($0148, $0118, aAIScriptingData_L014, $00)                     ;B4E516
    %AICMD0x0C_WaitForScriptFlag($02)                                            ;B4E51E
    %AICMD0x1B($021F, $00)                                     ;B4E520
    %AICMD0x0D($00, $01, $10, $01)                             ;B4E524
    %AICMD0x13_Wait(10)                                        ;B4E529
    %AICMD0x1B($0223, $01)                                     ;B4E52C
    %AICMD0x0D($01, $00, $14, $01)                             ;B4E530
    %AICMD0x13_Wait(120)                                       ;B4E535
    %AICMD0x1B($034C, $00)                                     ;B4E538
    %AICMD0x13_Wait(40)                                        ;B4E53C
    %AICMD0x1B($034D, $00)                                     ;B4E53F
    %AICMD0x13_Wait(60)                                        ;B4E543
pAIScripting0x3F_L005:
    %AICMD0x13_Wait(1)                                         ;B4E546
    %AICMD0x12_Jump(pAIScripting0x3F_L005)                                   ;B4E549
pAIScripting0x3F_L006:
    %AICMD0x1A($0198, $0198, aAIScriptingData_L024, $03)                     ;B4E54C
    %AICMD0x0C_WaitForScriptFlag($03)                                            ;B4E554
    %AICMD0x1B($0249, $00)                                     ;B4E556
    %AICMD0x0D($FF, $00, $10, $01)                             ;B4E55A
    %AICMD0x13_Wait(10)                                        ;B4E55F
    %AICMD0x1B($0245, $00)                                     ;B4E562
    %AICMD0x0D($00, $01, $30, $01)                             ;B4E566
    %AICMD0x1B($0248, $00)                                     ;B4E56B
    %AICMD0x13_Wait(50)                                        ;B4E56F
    %AICMD0x0B_SetScriptFlag($07)                                            ;B4E572
    %AICMD0x1B($0249, $00)                                     ;B4E574
    %AICMD0x0D($FF, $00, $08, $01)                             ;B4E578
    %AICMD0x13_Wait(320)                                       ;B4E57D
    %AICMD0x1B($0350, $00)                                     ;B4E580
    %AICMD0x13_Wait(180)                                       ;B4E584
pAIScripting0x3F_L007:
    %AICMD0x13_Wait(1)                                         ;B4E587
    %AICMD0x12_Jump(pAIScripting0x3F_L007)                                   ;B4E58A
pAIScripting0x3F_L008:
    %AICMD0x1A($00D8, $0218, aAIScriptingData_L022, $02)                     ;B4E58D
    %AICMD0x0C_WaitForScriptFlag($04)                                            ;B4E595
    %AICMD0x0D($01, $00, $88, $01)                             ;B4E597
    %AICMD0x13_Wait(60)                                        ;B4E59C
    %AICMD0x09_StartScript($07, pAIScripting0x3F_L010)                                   ;B4E59F
    %AICMD0x0B_SetScriptFlag($05)                                            ;B4E5A3
    %AICMD0x13_Wait(200)                                       ;B4E5A5
    %AICMD0x1B($034F, $00)                                     ;B4E5A8
pAIScripting0x3F_L009:
    %AICMD0x13_Wait(1)                                         ;B4E5AC
    %AICMD0x12_Jump(pAIScripting0x3F_L009)                                   ;B4E5AF
pAIScripting0x3F_L010:
    %AICMD0x1A($0168, $0208, aAIScriptingData_L184, $00)                     ;B4E5B2
    %AICMD0x13_Wait(60)                                        ;B4E5BA
    %AICMD0x37()                                               ;B4E5BD
    %AICMD0x10_End()                                           ;B4E5BE
pAIScripting0x3F_L011:
    %AICMD0x1A($00D8, $02D8, aAIScriptingData_L015, $00)                     ;B4E5BF
    %AICMD0x0C_WaitForScriptFlag($06)                                            ;B4E5C7
    %AICMD0x1B($0345, $00)                                     ;B4E5C9
    %AICMD0x13_Wait(90)                                        ;B4E5CD
    %AICMD0x1B($0346, $00)                                     ;B4E5D0
    %AICMD0x13_Wait(160)                                       ;B4E5D4
    %AICMD0x1B($022B, $01)                                     ;B4E5D7
    %AICMD0x0D($02, $00, $30, $01)                             ;B4E5DB
pAIScripting0x3F_L012:
    %AICMD0x13_Wait(1)                                         ;B4E5E0
    %AICMD0x12_Jump(pAIScripting0x3F_L012)                                   ;B4E5E3
pAIScripting0x3F_L013:
    %AICMD0x1A($00CC, $02D8, aAIScriptingData_L201, $00)                     ;B4E5E6
pAIScripting0x3F_L014:
    %AICMD0x13_Wait(1)                                         ;B4E5EE
    %AICMD0x12_Jump(pAIScripting0x3F_L014)                                   ;B4E5F1
