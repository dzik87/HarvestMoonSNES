

pAIScripting0x09:
    dw DATA8_B3E623                                            ;B3E603|        |B3E623;
    dw pAIScripting0x0A                                        ;B3E605|        |B3E83B;
    dw pAIScripting0x0A                                        ;B3E607|        |B3E83B;
    dw pAIScripting0x0A                                        ;B3E609|        |B3E83B;
    dw pAIScripting0x0A                                        ;B3E60B|        |B3E83B;
    dw pAIScripting0x0A                                        ;B3E60D|        |B3E83B;
    dw pAIScripting0x0A                                        ;B3E60F|        |B3E83B;
    dw pAIScripting0x0A                                        ;B3E611|        |B3E83B;
    dw pAIScripting0x0A                                        ;B3E613|        |B3E83B;
    dw pAIScripting0x0A                                        ;B3E615|        |B3E83B;
    dw pAIScripting0x0A                                        ;B3E617|        |B3E83B;
    dw pAIScripting0x0A                                        ;B3E619|        |B3E83B;
    dw pAIScripting0x0A                                        ;B3E61B|        |B3E83B;
    dw pAIScripting0x0A                                        ;B3E61D|        |B3E83B;
    dw pAIScripting0x0A                                        ;B3E61F|        |B3E83B;
    dw pAIScripting0x0A                                        ;B3E621|        |B3E83B;
 
DATA8_B3E623:
    %AICMD0x40_DisableTileInteractions()                       ;B3E623
    %AICMD0x02_FreezeTime()                                    ;B3E624
    %AICMD0x05_SetTransferPosition(96, 120)                    ;B3E625
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B3E62A
    %AICMD0x08_EnableAIControl()                               ;B3E62C
    %AICMD0x09_StartScript($01, pAIScripting0x09_L002)                                   ;B3E62D
    %AICMD0x09_StartScript($02, pAIScripting0x09_L001)                                   ;B3E631
    %AICMD0x06_SetDestinationArea(!AREA_INTRO)                 ;B3E635
    %AICMD0x38_WaitForFadeIn()                                               ;B3E637
    %AICMD0x0B_SetScriptFlag($00)                                            ;B3E638
    %AICMD0x0C_WaitForScriptFlag($02)                                            ;B3E63A
    %AICMD0x13_Wait(30)                                        ;B3E63C
    %AICMD0x19($0007, $00)                                     ;B3E63F
    %AICMD0x13_Wait(60)                                        ;B3E643
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 48)                 ;B3E646
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 64)                  ;B3E64A
    %AICMD0x0F_ScreenFadeout($01)                              ;B3E64E
    %AICMD0x13_Wait(180)                                       ;B3E650
    %AICMD0x05_SetTransferPosition(8, 104)                     ;B3E653
    %AICMD0x25_RemoveActor($01)                                            ;B3E658
    %AICMD0x25_RemoveActor($02)                                            ;B3E65A
    %AICMD0x19($0002, $00)                                     ;B3E65C
    %AICMD0x13_Wait(1)                                         ;B3E660
    %AICMD0x09_StartScript($01, pAIScripting0x09_L003)                                   ;B3E663
    %AICMD0x09_StartScript($02, pAIScripting0x09_L005)                                   ;B3E667
    %AICMD0x09_StartScript($03, pAIScripting0x09_L007)                                   ;B3E66B
    %AICMD0x09_StartScript($04, pAIScripting0x09_L004)                                   ;B3E66F
    %AICMD0x09_StartScript($05, pAIScripting0x09_L009)                                   ;B3E673
    %AICMD0x09_StartScript($06, pAIScripting0x09_L011)                                   ;B3E677
    %AICMD0x13_Wait(1)                                         ;B3E67B
    %AICMD0x0A_ScreenFadein($01)                                            ;B3E67E
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 112)                ;B3E680
    %AICMD0x0B_SetScriptFlag($03)                                            ;B3E684
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B3E686
    %AICMD0x13_Wait(80)                                        ;B3E688
    %AICMD0x19($0041, $00)                                     ;B3E68B
    %AICMD0x13_Wait(120)                                       ;B3E68F
    %AICMD0x19($0030, $00)                                     ;B3E692
    %AICMD0x13_Wait(120)                                       ;B3E696
    %AICMD0x19($0002, $00)                                     ;B3E699
    %AICMD0x0C_WaitForScriptFlag($04)                                            ;B3E69D
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B3E69F
    %AICMD0x13_Wait(120)                                       ;B3E6A1
    %AICMD0x19($0004, $00)                                     ;B3E6A4
    %AICMD0x13_Wait(120)                                       ;B3E6A8
    %AICMD0x19($0000, $00)                                     ;B3E6AB
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B3E6AF
    %AICMD0x13_Wait(60)                                        ;B3E6B1
    %AICMD0x19($001E, $00)                                     ;B3E6B4
    %AICMD0x13_Wait(60)                                        ;B3E6B8
    %AICMD0x19($0024, $00)                                     ;B3E6BB
    %AICMD0x13_Wait(30)                                        ;B3E6BF
    %AICMD0x19($0004, $00)                                     ;B3E6C2
    %AICMD0x13_Wait(90)                                        ;B3E6C6
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 32)                 ;B3E6C9
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 48)                  ;B3E6CD
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily2, $02)       ;B3E6D1
    %AICMD0x10_End()                                           ;B3E6D6
pAIScripting0x09_L001:
    %AICMD0x1A($FFD8, $0078, aAIScriptingData_L070, $02)                     ;B3E6D7
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B3E6DF
    %AICMD0x13_Wait(40)                                        ;B3E6E1
    %AICMD0x1B($02E0, $01)                                     ;B3E6E4
    %AICMD0x0D($01, $00, $40, $01)                             ;B3E6E8
    %AICMD0x13_Wait(120)                                       ;B3E6ED
    %AICMD0x1B($02E1, $01)                                     ;B3E6F0
    %AICMD0x0D($01, $00, $20, $01)                             ;B3E6F4
    %AICMD0x0B_SetScriptFlag($01)                                            ;B3E6F9
    %AICMD0x10_End()                                           ;B3E6FB
pAIScripting0x09_L002:
    %AICMD0x1A($FFE8, $0068, aAIScriptingData_L069, $00)                     ;B3E6FC
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B3E704
    %AICMD0x1B($02DC, $01)                                     ;B3E706
    %AICMD0x0D($01, $00, $40, $01)                             ;B3E70A
    %AICMD0x1B($02DB, $01)                                     ;B3E70F
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B3E713
    %AICMD0x1B($02DC, $01)                                     ;B3E715
    %AICMD0x0D($01, $00, $20, $01)                             ;B3E719
    %AICMD0x1B($02DA, $00)                                     ;B3E71E
    %AICMD0x0D($00, $01, $10, $01)                             ;B3E722
    %AICMD0x1B($02DD, $00)                                     ;B3E727
    %AICMD0x0B_SetScriptFlag($02)                                            ;B3E72B
    %AICMD0x10_End()                                           ;B3E72D
pAIScripting0x09_L003:
    %AICMD0x1A($0120, $0078, aAIScriptingData_L003, $03)                     ;B3E72E
    %AICMD0x0C_WaitForScriptFlag($03)                                            ;B3E736
    %AICMD0x0D($FF, $00, $B4, $03)                             ;B3E738
    %AICMD0x0B_SetScriptFlag($04)                                            ;B3E73D
    %AICMD0x0D($FF, $00, $FF, $03)                             ;B3E73F
    %AICMD0x1B($0197, $00)                                     ;B3E744
    %AICMD0x13_Wait(60)                                        ;B3E748
    %AICMD0x1B($0194, $00)                                     ;B3E74B
    %AICMD0x13_Wait(180)                                       ;B3E74F
    %AICMD0x1B($018B, $00)                                     ;B3E752
    %AICMD0x0D($FF, $00, $FF, $03)                             ;B3E756
    %AICMD0x0D($FF, $00, $80, $03)                             ;B3E75B
    %AICMD0x10_End()                                           ;B3E760
pAIScripting0x09_L004:
    %AICMD0x1A($0108, $0078, aAIScriptingData_L054, $03)                     ;B3E761
    %AICMD0x0C_WaitForScriptFlag($03)                                            ;B3E769
    %AICMD0x0D($FF, $00, $B4, $03)                             ;B3E76B
    %AICMD0x0B_SetScriptFlag($04)                                            ;B3E770
    %AICMD0x0D($FF, $00, $FF, $03)                             ;B3E772
    %AICMD0x1B($02AE, $00)                                     ;B3E777
    %AICMD0x13_Wait(120)                                       ;B3E77B
    %AICMD0x1B($02B0, $01)                                     ;B3E77E
    %AICMD0x13_Wait(120)                                       ;B3E782
    %AICMD0x1B($02B0, $00)                                     ;B3E785
    %AICMD0x0D($FF, $00, $FF, $03)                             ;B3E789
    %AICMD0x0D($FF, $00, $80, $03)                             ;B3E78E
    %AICMD0x10_End()                                           ;B3E793
pAIScripting0x09_L005:
    %AICMD0x1A($0058, $0088, aAIScriptingData_L008, $00)                     ;B3E794
pAIScripting0x09_L006:
    %AICMD0x13_Wait(1)                                         ;B3E79C
    %AICMD0x12_Jump(pAIScripting0x09_L006)                                   ;B3E79F
pAIScripting0x09_L007:
    %AICMD0x1A($0048, $0088, aAIScriptingData_L009, $00)                     ;B3E7A2
    %AICMD0x22($18, $08, $01, aAIScriptingData_L009, $04)                    ;B3E7AA
pAIScripting0x09_L008:
    %AICMD0x13_Wait(1)                                         ;B3E7B1
    %AICMD0x12_Jump(pAIScripting0x09_L008)                                   ;B3E7B4
pAIScripting0x09_L009:
    %AICMD0x1A($0048, $0058, aAIScriptingData_L083, $00)                     ;B3E7B7
pAIScripting0x09_L010:
    %AICMD0x0D($01, $00, $08, $01)                             ;B3E7BF
    %AICMD0x0D($00, $FF, $06, $01)                             ;B3E7C4
    %AICMD0x0D($FF, $00, $08, $02)                             ;B3E7C9
    %AICMD0x0D($FF, $01, $04, $01)                             ;B3E7CE
    %AICMD0x0D($01, $00, $0C, $02)                             ;B3E7D3
    %AICMD0x0D($FF, $00, $06, $01)                             ;B3E7D8
    %AICMD0x0D($00, $FF, $10, $02)                             ;B3E7DD
    %AICMD0x0D($FF, $01, $04, $01)                             ;B3E7E2
    %AICMD0x0D($01, $01, $0C, $02)                             ;B3E7E7
    %AICMD0x0D($01, $00, $08, $02)                             ;B3E7EC
    %AICMD0x0D($00, $FF, $06, $01)                             ;B3E7F1
    %AICMD0x12_Jump(pAIScripting0x09_L010)                                   ;B3E7F6
pAIScripting0x09_L011:
    %AICMD0x1A($0068, $0038, aAIScriptingData_L083, $00)                     ;B3E7F9
pAIScripting0x09_L012:
    %AICMD0x0D($00, $FF, $06, $01)                             ;B3E801
    %AICMD0x0D($FF, $00, $08, $02)                             ;B3E806
    %AICMD0x0D($01, $00, $08, $01)                             ;B3E80B
    %AICMD0x0D($01, $00, $0C, $02)                             ;B3E810
    %AICMD0x0D($FF, $01, $04, $01)                             ;B3E815
    %AICMD0x0D($FF, $00, $06, $01)                             ;B3E81A
    %AICMD0x0D($00, $FF, $10, $02)                             ;B3E81F
    %AICMD0x0D($01, $01, $0C, $02)                             ;B3E824
    %AICMD0x0D($FF, $01, $04, $01)                             ;B3E829
    %AICMD0x0D($01, $00, $08, $02)                             ;B3E82E
    %AICMD0x0D($00, $FF, $06, $01)                             ;B3E833
    %AICMD0x12_Jump(pAIScripting0x09_L012)                                   ;B3E838
