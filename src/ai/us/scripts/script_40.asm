

pAIScripting0x40:
    dw DATA8_B4E614                                            ;B4E5F4|        |B4E614;
    dw pAIScripting0x41                                        ;B4E5F6|        |B4E7AF;
    dw pAIScripting0x41                                        ;B4E5F8|        |B4E7AF;
    dw pAIScripting0x41                                        ;B4E5FA|        |B4E7AF;
    dw pAIScripting0x41                                        ;B4E5FC|        |B4E7AF;
    dw pAIScripting0x41                                        ;B4E5FE|        |B4E7AF;
    dw pAIScripting0x41                                        ;B4E600|        |B4E7AF;
    dw pAIScripting0x41                                        ;B4E602|        |B4E7AF;
    dw pAIScripting0x41                                        ;B4E604|        |B4E7AF;
    dw pAIScripting0x41                                        ;B4E606|        |B4E7AF;
    dw pAIScripting0x41                                        ;B4E608|        |B4E7AF;
    dw pAIScripting0x41                                        ;B4E60A|        |B4E7AF;
    dw pAIScripting0x41                                        ;B4E60C|        |B4E7AF;
    dw pAIScripting0x41                                        ;B4E60E|        |B4E7AF;
    dw pAIScripting0x41                                        ;B4E610|        |B4E7AF;
    dw pAIScripting0x41                                        ;B4E612|        |B4E7AF;
 
DATA8_B4E614:
    %AICMD0x00_SetMusic($10, $B4)                              ;B4E614
    %AICMD0x02_FreezeTime()                                    ;B4E617
    %AICMD0x03_SetHour($06)                                    ;B4E618
    %AICMD0x05_SetTransferPosition(136, 120)                   ;B4E61A
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4E61F
    %AICMD0x40_DisableTileInteractions()                       ;B4E621
    %AICMD0x08_EnableAIControl()                               ;B4E622
    %AICMD0x09_StartScript($01, pAIScripting0x40_L001)                                   ;B4E623
    %AICMD0x09_StartScript($02, pAIScripting0x40_L003)                                   ;B4E627
    %AICMD0x09_StartScript($03, pAIScripting0x40_L006)                                   ;B4E62B
    %AICMD0x06_SetDestinationArea(!AREA_HOUSE3)                ;B4E62F
    %AICMD0x38_WaitForFadeIn()                                               ;B4E631
    %AICMD0x13_Wait(60)                                        ;B4E632
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 24)                  ;B4E635
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 32)                   ;B4E639
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 54)                  ;B4E63D
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B4E641
    %AICMD0x0B_SetScriptFlag($00)                                            ;B4E643
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B4E645
    %AICMD0x0B_SetScriptFlag($02)                                            ;B4E647
    %AICMD0x13_Wait(60)                                        ;B4E649
    %AICMD0x0C_WaitForScriptFlag($03)                                            ;B4E64C
    %AICMD0x13_Wait(30)                                        ;B4E64E
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 16)                  ;B4E651
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 32)                    ;B4E655
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4E659
    %AICMD0x13_Wait(200)                                       ;B4E65B
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 72)                 ;B4E65E
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 14)                    ;B4E662
    %AICMD0x13_Wait(20)                                        ;B4E666
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4E669
    %AICMD0x13_Wait(90)                                        ;B4E66B
    %AICMD0x19($0042, $00)                                     ;B4E66E
    %AICMD0x13_Wait(120)                                       ;B4E672
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4E675
    %AICMD0x0C_WaitForScriptFlag($04)                                            ;B4E677
    %AICMD0x3D_TeleportToArea(!AREA_ENDING00)                  ;B4E679
    %AICMD0x10_End()                                           ;B4E67B
pAIScripting0x40_L001:
    %AICMD0x1A($0168, $0098, aAIScriptingData_L077, $01)                     ;B4E67C
    %AICMD0x13_Wait(120)                                       ;B4E684
    %AICMD0x1B($02F5, $00)                                     ;B4E687
    %AICMD0x0D($00, $FF, $80, $04)                             ;B4E68B
    %AICMD0x13_Wait(60)                                        ;B4E690
    %AICMD0x1B($02F7, $00)                                     ;B4E693
    %AICMD0x0D($FF, $00, $80, $04)                             ;B4E697
    %AICMD0x13_Wait(60)                                        ;B4E69C
    %AICMD0x1B($02F3, $00)                                     ;B4E69F
    %AICMD0x0D($00, $01, $50, $04)                             ;B4E6A3
    %AICMD0x13_Wait(60)                                        ;B4E6A8
    %AICMD0x1B($02F7, $01)                                     ;B4E6AB
    %AICMD0x0D($01, $00, $60, $04)                             ;B4E6AF
    %AICMD0x13_Wait(60)                                        ;B4E6B4
    %AICMD0x1B($02F7, $00)                                     ;B4E6B7
    %AICMD0x0D($FF, $00, $50, $04)                             ;B4E6BB
    %AICMD0x13_Wait(60)                                        ;B4E6C0
pAIScripting0x40_L002:
    %AICMD0x13_Wait(1)                                         ;B4E6C3
    %AICMD0x12_Jump(pAIScripting0x40_L002)                                   ;B4E6C6
pAIScripting0x40_L003:
    %AICMD0x1A($0138, $0078, aAIScriptingData_L071, $00)                     ;B4E6C9
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B4E6D1
    %AICMD0x13_Wait(30)                                        ;B4E6D3
    %AICMD0x1B($02E3, $00)                                     ;B4E6D6
    %AICMD0x0D($00, $01, $42, $01)                             ;B4E6DA
    %AICMD0x1B($02E6, $00)                                     ;B4E6DF
    %AICMD0x0B_SetScriptFlag($01)                                            ;B4E6E3
    %AICMD0x0C_WaitForScriptFlag($02)                                            ;B4E6E5
    %AICMD0x13_Wait(20)                                        ;B4E6E7
    %AICMD0x1B($02E7, $00)                                     ;B4E6EA
    %AICMD0x0D($FF, $00, $08, $02)                             ;B4E6EE
    %AICMD0x1B($0233, $00)                                     ;B4E6F3
    %AICMD0x13_Wait(60)                                        ;B4E6F7
    %AICMD0x1B($02F0, $00)                                     ;B4E6FA
    %AICMD0x09_StartScript($04, pAIScripting0x40_L005)                                   ;B4E6FE
    %AICMD0x13_Wait(90)                                        ;B4E702
    %AICMD0x1B($02E5, $00)                                     ;B4E705
    %AICMD0x0D($00, $FF, $30, $01)                             ;B4E709
    %AICMD0x0B_SetScriptFlag($03)                                            ;B4E70E
    %AICMD0x13_Wait(40)                                        ;B4E710
    %AICMD0x1B($02E6, $01)                                     ;B4E713
    %AICMD0x13_Wait(160)                                       ;B4E717
    %AICMD0x1B($02E7, $01)                                     ;B4E71A
    %AICMD0x0D($01, $00, $08, $01)                             ;B4E71E
    %AICMD0x13_Wait(60)                                        ;B4E723
    %AICMD0x1B($02E7, $01)                                     ;B4E726
    %AICMD0x13_Wait(90)                                        ;B4E72A
    %AICMD0x1B($0233, $01)                                     ;B4E72D
    %AICMD0x13_Wait(60)                                        ;B4E731
    %AICMD0x1B($02ED, $01)                                     ;B4E734
pAIScripting0x40_L004:
    %AICMD0x13_Wait(1)                                         ;B4E738
    %AICMD0x12_Jump(pAIScripting0x40_L004)                                   ;B4E73B
pAIScripting0x40_L005:
    %AICMD0x1A($0130, $00A0, aAIScriptingData_L205, $00)                     ;B4E73E
    %AICMD0x13_Wait(60)                                        ;B4E746
    %AICMD0x37()                                               ;B4E749
    %AICMD0x10_End()                                           ;B4E74A
pAIScripting0x40_L006:
    %AICMD0x1A($0128, $0098, aAIScriptingData_L004, $02)                     ;B4E74B
    %AICMD0x1B($01EC, $00)                                     ;B4E753
    %AICMD0x13_Wait(120)                                       ;B4E757
    %AICMD0x1B($01F8, $00)                                     ;B4E75A
    %AICMD0x13_Wait(180)                                       ;B4E75E
    %AICMD0x1B($01EB, $00)                                     ;B4E761
    %AICMD0x13_Wait(180)                                       ;B4E765
    %AICMD0x0C_WaitForScriptFlag($03)                                            ;B4E768
    %AICMD0x13_Wait(120)                                       ;B4E76A
    %AICMD0x1B($01DF, $00)                                     ;B4E76D
    %AICMD0x0D($00, $01, $20, $01)                             ;B4E771
    %AICMD0x13_Wait(30)                                        ;B4E776
    %AICMD0x1B($01EC, $00)                                     ;B4E779
    %AICMD0x0D($FF, $00, $70, $01)                             ;B4E77D
    %AICMD0x13_Wait(120)                                       ;B4E782
    %AICMD0x1B($01EC, $01)                                     ;B4E785
    %AICMD0x0D($01, $00, $98, $01)                             ;B4E789
    %AICMD0x1B($01F2, $01)                                     ;B4E78E
    %AICMD0x13_Wait(60)                                        ;B4E792
    %AICMD0x1B($01E9, $01)                                     ;B4E795
    %AICMD0x0D($01, $00, $20, $02)                             ;B4E799
    %AICMD0x1B($01E1, $00)                                     ;B4E79E
    %AICMD0x0D($00, $FF, $20, $02)                             ;B4E7A2
    %AICMD0x0B_SetScriptFlag($04)                                            ;B4E7A7
pAIScripting0x40_L007:
    %AICMD0x13_Wait(1)                                         ;B4E7A9
    %AICMD0x12_Jump(pAIScripting0x40_L007)                                   ;B4E7AC
