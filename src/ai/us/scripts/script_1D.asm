

pAIScripting0x1D:
    dw pAIScripting0x1D_Data01                                            ;B4943C|        |B4945C;
    dw pAIScripting0x1D_Data02                                            ;B4943E|        |B49499;
    dw pAIScripting0x1D_Data03                                            ;B49440|        |B49513;
    dw pAIScripting0x1D_Data04                                            ;B49442|        |B4958B;
    dw pAIScripting0x1E                                        ;B49444|        |B4967A;
    dw pAIScripting0x1E                                        ;B49446|        |B4967A;
    dw pAIScripting0x1E                                        ;B49448|        |B4967A;
    dw pAIScripting0x1E                                        ;B4944A|        |B4967A;
    dw pAIScripting0x1E                                        ;B4944C|        |B4967A;
    dw pAIScripting0x1E                                        ;B4944E|        |B4967A;
    dw pAIScripting0x1E                                        ;B49450|        |B4967A;
    dw pAIScripting0x1E                                        ;B49452|        |B4967A;
    dw pAIScripting0x1E                                        ;B49454|        |B4967A;
    dw pAIScripting0x1E                                        ;B49456|        |B4967A;
    dw pAIScripting0x1E                                        ;B49458|        |B4967A;
    dw pAIScripting0x1E                                        ;B4945A|        |B4967A;
 
pAIScripting0x1D_Data01:
 
    %AICMD0x50()                                               ;B4945C
    %AICMD0x08_EnableAIControl()                               ;B4945D
    %AICMD0x09_StartScript($01, pAIScripting0x1D_L001)                                   ;B4945E
    %AICMD0x38_WaitForFadeIn()                                               ;B49462
    %AICMD0x0B_SetScriptFlag($00)                                            ;B49463
    %AICMD0x10_End()                                           ;B49465
pAIScripting0x1D_L001:
    %AICMD0x1A($0088, $01B8, aAIScriptingData_L028, $01)                     ;B49466
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B4946E
    %AICMD0x0D($00, $FE, $28, $01)                             ;B49470
    %AICMD0x1B($025F, $01)                                     ;B49475
    %AICMD0x13_Wait(10)                                        ;B49479
    %AICMD0x1B($025F, $00)                                     ;B4947C
    %AICMD0x13_Wait(10)                                        ;B49480
    %AICMD0x1B($025D, $00)                                     ;B49483
    %AICMD0x1C_ShowDialog($01F5, $00)                          ;B49487
    %AICMD0x1B($025B, $00)                                     ;B4948B
    %AICMD0x0D($00, $02, $30, $01)                             ;B4948F
    %AICMD0x0B_SetScriptFlag($01)                                            ;B49494
    %AICMD0x37()                                               ;B49496
    %AICMD0x11_EnableUserControl()                             ;B49497
    %AICMD0x10_End()                                           ;B49498


pAIScripting0x1D_Data02:
 
    %AICMD0x09_StartScript($01, pAIScripting0x1D_L003)                                   ;B49499
    %AICMD0x09_StartScript($02, pAIScripting0x1D_L006)                                   ;B4949D
    %AICMD0x09_StartScript($03, pAIScripting0x1D_L009)                                   ;B494A1
    %AICMD0x09_StartScript($04, pAIScripting0x1D_L012)                                   ;B494A5
    %AICMD0x38_WaitForFadeIn()                                               ;B494A9
    %AICMD0x10_End()                                           ;B494AA
pAIScripting0x1D_L002:
    %AICMD0x13_Wait(1)                                         ;B494AB
    %AICMD0x12_Jump(pAIScripting0x1D_L002)                                   ;B494AE
pAIScripting0x1D_L003:
    %AICMD0x1A($0208, $0238, aAIScriptingData_L028, $03)                     ;B494B1
pAIScripting0x1D_L004:
    %AICMD0x1F(pAIScripting0x1D_L005)                                        ;B494B9
    %AICMD0x12_Jump(pAIScripting0x1D_L004)                                   ;B494BC
pAIScripting0x1D_L005:
    %AICMD0x1C_ShowDialog($01F7, $00)                          ;B494BF
    %AICMD0x12_Jump(pAIScripting0x1D_L004)                                   ;B494C3
pAIScripting0x1D_L006:
    %AICMD0x1A($0168, $0218, aAIScriptingData_L028, $03)                     ;B494C6
    %AICMD0x22($10, $10, $01, aAIScriptingData_L028, $10)                    ;B494CE
pAIScripting0x1D_L007:
    %AICMD0x1F(pAIScripting0x1D_L008)                                        ;B494D5
    %AICMD0x12_Jump(pAIScripting0x1D_L007)                                   ;B494D8
pAIScripting0x1D_L008:
    %AICMD0x1C_ShowDialog($01F8, $00)                          ;B494DB
    %AICMD0x12_Jump(pAIScripting0x1D_L007)                                   ;B494DF
pAIScripting0x1D_L009:
    %AICMD0x1A($0188, $0048, aAIScriptingData_L028, $00)                     ;B494E2
pAIScripting0x1D_L010:
    %AICMD0x1F(pAIScripting0x1D_L011)                                        ;B494EA
    %AICMD0x12_Jump(pAIScripting0x1D_L010)                                   ;B494ED
pAIScripting0x1D_L011:
    %AICMD0x1C_ShowDialog($01F7, $00)                          ;B494F0
    %AICMD0x12_Jump(pAIScripting0x1D_L010)                                   ;B494F4
pAIScripting0x1D_L012:
    %AICMD0x1A($00D8, $01D8, aAIScriptingData_L027, $00)                     ;B494F7
    %AICMD0x22($20, $00, $01, aAIScriptingData_L028, $10)                    ;B494FF
pAIScripting0x1D_L013:
    %AICMD0x1F(pAIScripting0x1D_L014)                                        ;B49506
    %AICMD0x12_Jump(pAIScripting0x1D_L013)                                   ;B49509
pAIScripting0x1D_L014:
    %AICMD0x1C_ShowDialog($01FA, $00)                          ;B4950C
    %AICMD0x12_Jump(pAIScripting0x1D_L013)                                   ;B49510


pAIScripting0x1D_Data03:
 
    %AICMD0x50()                                               ;B49513
    %AICMD0x00_SetMusic($0E, $B4)                              ;B49514
    %AICMD0x09_StartScript($01, pAIScripting0x1D_L023)                                   ;B49517
    %AICMD0x09_StartScript($02, pAIScripting0x1D_L020)                                   ;B4951B
    %AICMD0x38_WaitForFadeIn()                                               ;B4951F
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B49520
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily3, $05)       ;B49522
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 0, pAIScripting0x1D_L015)     ;B49527
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 1, pAIScripting0x1D_L016)     ;B4952E
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 2, pAIScripting0x1D_L017)     ;B49535
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, pAIScripting0x1D_L018)     ;B4953C
pAIScripting0x1D_L015:
    %AICMD0x3D_TeleportToArea(!AREA_WOODSSPRING)               ;B49543
    %AICMD0x12_Jump(pAIScripting0x1D_L019)                                   ;B49545
pAIScripting0x1D_L016:
    %AICMD0x3D_TeleportToArea(!AREA_WOODSSUMMER)               ;B49548
    %AICMD0x12_Jump(pAIScripting0x1D_L019)                                   ;B4954A
pAIScripting0x1D_L017:
    %AICMD0x3D_TeleportToArea(!AREA_WOODSFALL)                 ;B4954D
    %AICMD0x12_Jump(pAIScripting0x1D_L019)                                   ;B4954F
pAIScripting0x1D_L018:
    %AICMD0x3D_TeleportToArea(!AREA_WOODSWINTER)               ;B49552
    %AICMD0x12_Jump(pAIScripting0x1D_L019)                                   ;B49554
pAIScripting0x1D_L019:
    %AICMD0x05_SetTransferPosition(168, 424)                   ;B49557
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4955C
    %AICMD0x10_End()                                           ;B4955E
pAIScripting0x1D_L020:
    %AICMD0x1A($0198, $0078, aAIScriptingData_L024, $02)                     ;B4955F
pAIScripting0x1D_L021:
    %AICMD0x1F(pAIScripting0x1D_L022)                                        ;B49567
    %AICMD0x12_Jump(pAIScripting0x1D_L021)                                   ;B4956A
pAIScripting0x1D_L022:
    %AICMD0x1C_ShowDialog($01F6, $00)                          ;B4956D
    %AICMD0x12_Jump(pAIScripting0x1D_L021)                                   ;B49571
pAIScripting0x1D_L023:
    %AICMD0x1A($0038, $0058, aAIScriptingData_L107, $03)                     ;B49574
pAIScripting0x1D_L024:
    %AICMD0x1F(pAIScripting0x1D_L025)                                        ;B4957C
    %AICMD0x12_Jump(pAIScripting0x1D_L024)                                   ;B4957F
pAIScripting0x1D_L025:
    %AICMD0x1C_ShowDialog($01FC, $00)                          ;B49582
    %AICMD0x0B_SetScriptFlag($00)                                            ;B49586
    %AICMD0x12_Jump(pAIScripting0x1D_L024)                                   ;B49588


pAIScripting0x1D_Data04:
    %AICMD0x50()                                               ;B4958B
    %AICMD0x08_EnableAIControl()                               ;B4958C
    %AICMD0x09_StartScript($01, pAIScripting0x1D_L026)                                   ;B4958D
    %AICMD0x09_StartScript($02, pAIScripting0x1D_L028)                                   ;B49591
    %AICMD0x09_StartScript($03, pAIScripting0x1D_L027)                                   ;B49595
    %AICMD0x38_WaitForFadeIn()                                               ;B49599
    %AICMD0x0B_SetScriptFlag($00)                                            ;B4959A
    %AICMD0x0C_WaitForScriptFlag($02)                                            ;B4959C
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4959E
    %AICMD0x0C_WaitForScriptFlag($04)                                            ;B495A0
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B495A2
    %AICMD0x0C_WaitForScriptFlag($06)                                            ;B495A4
    %AICMD0x13_Wait(120)                                       ;B495A6
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 48)                  ;B495A9
    %AICMD0x0C_WaitForScriptFlag($07)                                            ;B495AD
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B495AF
    %AICMD0x13_Wait(60)                                        ;B495B1
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 32)                 ;B495B4
    %AICMD0x23_OrWithIndexedValue(strcFlags.event5, $05)       ;B495B8
    %AICMD0x28_ClearBit(strcFlags.event5, $04)                          ;B495BD
    %AICMD0x3C()                                               ;B495C2
    %AICMD0x10_End()                                           ;B495C3
pAIScripting0x1D_L026:
    %AICMD0x1A($0068, $01A8, aAIScriptingData_L024, $02)                     ;B495C4
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B495CC
    %AICMD0x1B($0249, $01)                                     ;B495CE
    %AICMD0x0D($01, $00, $20, $01)                             ;B495D2
    %AICMD0x1C_ShowDialog($01FD, $01)                          ;B495D7
    %AICMD0x0B_SetScriptFlag($01)                                            ;B495DB
    %AICMD0x0C_WaitForScriptFlag($02)                                            ;B495DD
    %AICMD0x1C_ShowDialog($01FF, $01)                          ;B495DF
    %AICMD0x0B_SetScriptFlag($03)                                            ;B495E3
    %AICMD0x0C_WaitForScriptFlag($05)                                            ;B495E5
    %AICMD0x1B($0249, $01)                                     ;B495E7
    %AICMD0x0D($01, $00, $10, $01)                             ;B495EB
    %AICMD0x1C_ShowDialog($0200, $01)                          ;B495F0
    %AICMD0x0D($01, $00, $08, $01)                             ;B495F4
    %AICMD0x1B($024A, $01)                                     ;B495F9
    %AICMD0x13_Wait(90)                                        ;B495FD
    %AICMD0x41_AddValue16(nLove_Eve, 50)                       ;B49600
    %AICMD0x0B_SetScriptFlag($06)                                            ;B49606
    %AICMD0x1B($0245, $00)                                     ;B49608
    %AICMD0x0D($00, $01, $30, $01)                             ;B4960C
    %AICMD0x13_Wait(10)                                        ;B49611
    %AICMD0x1B($0249, $01)                                     ;B49614
    %AICMD0x0D($01, $00, $30, $01)                             ;B49618
    %AICMD0x0B_SetScriptFlag($07)                                            ;B4961D
    %AICMD0x1B($0249, $01)                                     ;B4961F
    %AICMD0x0D($01, $00, $76, $01)                             ;B49623
    %AICMD0x37()                                               ;B49628
    %AICMD0x10_End()                                           ;B49629
pAIScripting0x1D_L027:
    %AICMD0x1A($0098, $01A8, aAIScriptingData_L040, $00)                     ;B4962A
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B49632
    %AICMD0x1B($0281, $00)                                     ;B49634
    %AICMD0x1C_ShowDialog($01FE, $00)                          ;B49638
    %AICMD0x0B_SetScriptFlag($02)                                            ;B4963C
    %AICMD0x0C_WaitForScriptFlag($03)                                            ;B4963E
    %AICMD0x1B($027D, $00)                                     ;B49640
    %AICMD0x0D($00, $01, $30, $01)                             ;B49644
    %AICMD0x1B($0281, $01)                                     ;B49649
    %AICMD0x0D($01, $00, $20, $01)                             ;B4964D
    %AICMD0x0B_SetScriptFlag($04)                                            ;B49652
    %AICMD0x1B($0281, $01)                                     ;B49654
    %AICMD0x0D($01, $00, $70, $01)                             ;B49658
    %AICMD0x37()                                               ;B4965D
    %AICMD0x10_End()                                           ;B4965E
pAIScripting0x1D_L028:
    %AICMD0x1A($00D8, $01D8, aAIScriptingData_L027, $03)                     ;B4965F
    %AICMD0x0C_WaitForScriptFlag($04)                                            ;B49667
    %AICMD0x1C_ShowDialog($01F9, $01)                          ;B49669
    %AICMD0x1B($025F, $01)                                     ;B4966D
    %AICMD0x0D($01, $00, $70, $01)                             ;B49671
    %AICMD0x0B_SetScriptFlag($05)                                            ;B49676
    %AICMD0x37()                                               ;B49678
    %AICMD0x10_End()                                           ;B49679
