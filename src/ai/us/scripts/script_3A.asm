

    incsrc "../../../../build/gen/ai/slots_3A.asm"
 
pAIScripting0x3A_Data01:
 
    %AICMD0x00_SetMusic($10, $B4)                              ;B4D792
    %AICMD0x02_FreezeTime()                                    ;B4D795
    %AICMD0x03_SetHour($06)                                    ;B4D796
    %AICMD0x05_SetTransferPosition(280, 376)                   ;B4D798
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4D79D
    %AICMD0x40_DisableTileInteractions()                       ;B4D79F
    %AICMD0x08_EnableAIControl()                               ;B4D7A0
    %AICMD0x09_StartScript($01, pAIScripting0x3A_L003)                                   ;B4D7A1
    %AICMD0x09_StartScript($02, pAIScripting0x3A_L001)                                   ;B4D7A5
    %AICMD0x06_SetDestinationArea(!AREA_FARMSUMMER)            ;B4D7A9
    %AICMD0x38_WaitForFadeIn()                                               ;B4D7AB
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 112)                 ;B4D7AC
    %AICMD0x13_Wait(60)                                        ;B4D7B0
    %AICMD0x0B_SetScriptFlag($00)                                            ;B4D7B3
    %AICMD0x13_Wait(60)                                        ;B4D7B5
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 16)                  ;B4D7B8
    %AICMD0x13_Wait(120)                                       ;B4D7BC
    %AICMD0x19($0023, $00)                                     ;B4D7BF
    %AICMD0x13_Wait(60)                                        ;B4D7C3
    %AICMD0x19($0003, $00)                                     ;B4D7C6
    %AICMD0x13_Wait(10)                                        ;B4D7CA
    %AICMD0x19($0023, $00)                                     ;B4D7CD
    %AICMD0x13_Wait(60)                                        ;B4D7D1
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B4D7D4
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 16)                  ;B4D7D6
    %AICMD0x13_Wait(10)                                        ;B4D7DA
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 24)                  ;B4D7DD
    %AICMD0x13_Wait(10)                                        ;B4D7E1
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 32)                  ;B4D7E4
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B4D7E8
    %AICMD0x13_Wait(40)                                        ;B4D7EA
    %AICMD0x0B_SetScriptFlag($02)                                            ;B4D7ED
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 16)                  ;B4D7EF
    %AICMD0x13_Wait(20)                                        ;B4D7F3
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 48)                  ;B4D7F6
    %AICMD0x3D_TeleportToArea(!AREA_ENDING00)                  ;B4D7FA
    %AICMD0x10_End()                                           ;B4D7FC
pAIScripting0x3A_L001:
    %AICMD0x1A($0088, $0158, aAIScriptingData_L071, $00)                     ;B4D7FD
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B4D805
    %AICMD0x1B($02E3, $00)                                     ;B4D807
    %AICMD0x0D($00, $01, $20, $01)                             ;B4D80B
    %AICMD0x1B($02E6, $01)                                     ;B4D810
    %AICMD0x13_Wait(90)                                        ;B4D814
    %AICMD0x1B($0233, $01)                                     ;B4D817
    %AICMD0x13_Wait(120)                                       ;B4D81B
    %AICMD0x1B($02E9, $00)                                     ;B4D81E
    %AICMD0x13_Wait(120)                                       ;B4D822
    %AICMD0x0B_SetScriptFlag($01)                                            ;B4D825
    %AICMD0x0C_WaitForScriptFlag($02)                                            ;B4D827
    %AICMD0x1B($02E3, $00)                                     ;B4D829
    %AICMD0x0D($00, $01, $30, $01)                             ;B4D82D
    %AICMD0x13_Wait(10)                                        ;B4D832
    %AICMD0x1B($02E7, $00)                                     ;B4D835
    %AICMD0x0D($FF, $00, $30, $01)                             ;B4D839
pAIScripting0x3A_L002:
    %AICMD0x13_Wait(1)                                         ;B4D83E
    %AICMD0x12_Jump(pAIScripting0x3A_L002)                                   ;B4D841
pAIScripting0x3A_L003:
    %AICMD0x1A($0088, $0068, aAIScriptingData_L004, $02)                     ;B4D844
    %AICMD0x13_Wait(120)                                       ;B4D84C
    %AICMD0x1B($01EA, $01)                                     ;B4D84F
    %AICMD0x13_Wait(160)                                       ;B4D853
    %AICMD0x1B($01F6, $01)                                     ;B4D856
    %AICMD0x12_Jump(pAIScripting0x3A_L004)                                   ;B4D85A
pAIScripting0x3A_L004:
    %AICMD0x13_Wait(1)                                         ;B4D85D
    %AICMD0x12_Jump(pAIScripting0x3A_L004)                                   ;B4D860


pAIScripting0x3A_Data02:
    %AICMD0x00_SetMusic($10, $B4)                              ;B4D863
    %AICMD0x02_FreezeTime()                                    ;B4D866
    %AICMD0x03_SetHour($07)                                    ;B4D867
    %AICMD0x05_SetTransferPosition(744, 424)                   ;B4D869
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4D86E
    %AICMD0x08_EnableAIControl()                               ;B4D870
    %AICMD0x09_StartScript($01, pAIScripting0x3A_L007)                                   ;B4D871
    %AICMD0x09_StartScript($02, pAIScripting0x3A_L005)                                   ;B4D875
    %AICMD0x09_StartScript($03, pAIScripting0x3A_L013)                                   ;B4D879
    %AICMD0x09_StartScript($04, pAIScripting0x3A_L015)                                   ;B4D87D
    %AICMD0x09_StartScript($05, pAIScripting0x3A_L009)                                   ;B4D881
    %AICMD0x09_StartScript($06, pAIScripting0x3A_L011)                                   ;B4D885
    %AICMD0x09_StartScript($07, pAIScripting0x3A_L017)                                   ;B4D889
    %AICMD0x09_StartScript($08, pAIScripting0x3A_L019)                                   ;B4D88D
    %AICMD0x06_SetDestinationArea(!AREA_TOWNSUMMER)            ;B4D891
    %AICMD0x38_WaitForFadeIn()                                               ;B4D893
    %AICMD0x13_Wait(90)                                        ;B4D894
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 56)                  ;B4D897
    %AICMD0x13_Wait(20)                                        ;B4D89B
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 136)                   ;B4D89E
    %AICMD0x13_Wait(20)                                        ;B4D8A2
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 168)                 ;B4D8A5
    %AICMD0x13_Wait(20)                                        ;B4D8A9
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 160)                 ;B4D8AC
    %AICMD0x13_Wait(20)                                        ;B4D8B0
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 96)                    ;B4D8B3
    %AICMD0x13_Wait(120)                                       ;B4D8B7
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 96)                  ;B4D8BA
    %AICMD0x13_Wait(60)                                        ;B4D8BE
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 210)                 ;B4D8C1
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4D8C5
    %AICMD0x13_Wait(60)                                        ;B4D8C7
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 96)                    ;B4D8CA
    %AICMD0x0B_SetScriptFlag($00)                                            ;B4D8CE
    %AICMD0x13_Wait(120)                                       ;B4D8D0
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4D8D3
    %AICMD0x13_Wait(60)                                        ;B4D8D5
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4D8D8
    %AICMD0x13_Wait(120)                                       ;B4D8DA
    %AICMD0x3D_TeleportToArea(!AREA_ENDING00)                  ;B4D8DD
    %AICMD0x10_End()                                           ;B4D8DF
pAIScripting0x3A_L005:
    %AICMD0x1A($02F8, $01A8, aAIScriptingData_L071, $03)                     ;B4D8E0
    %AICMD0x13_Wait(90)                                        ;B4D8E8
    %AICMD0x1B($02E7, $00)                                     ;B4D8EB
    %AICMD0x0D($FF, $00, $38, $01)                             ;B4D8EF
    %AICMD0x13_Wait(30)                                        ;B4D8F4
    %AICMD0x1B($02E5, $00)                                     ;B4D8F7
    %AICMD0x0D($00, $FF, $88, $01)                             ;B4D8FB
    %AICMD0x13_Wait(20)                                        ;B4D900
    %AICMD0x1B($02E7, $00)                                     ;B4D903
    %AICMD0x0D($FF, $00, $A8, $01)                             ;B4D907
    %AICMD0x13_Wait(20)                                        ;B4D90C
    %AICMD0x1B($02E7, $00)                                     ;B4D90F
    %AICMD0x0D($FF, $00, $A0, $01)                             ;B4D913
    %AICMD0x13_Wait(20)                                        ;B4D918
    %AICMD0x1B($02E5, $00)                                     ;B4D91B
    %AICMD0x0D($00, $FF, $70, $01)                             ;B4D91F
    %AICMD0x0B_SetScriptFlag($02)                                            ;B4D924
    %AICMD0x13_Wait(120)                                       ;B4D926
    %AICMD0x1B($02E3, $00)                                     ;B4D929
    %AICMD0x0D($00, $01, $70, $01)                             ;B4D92D
    %AICMD0x13_Wait(20)                                        ;B4D932
    %AICMD0x1B($02E7, $00)                                     ;B4D935
    %AICMD0x0D($FF, $00, $D4, $01)                             ;B4D939
    %AICMD0x13_Wait(60)                                        ;B4D93E
    %AICMD0x1B($02E5, $00)                                     ;B4D941
    %AICMD0x0D($00, $FF, $60, $01)                             ;B4D945
    %AICMD0x0B_SetScriptFlag($01)                                            ;B4D94A
    %AICMD0x13_Wait(120)                                       ;B4D94C
    %AICMD0x1B($02E6, $01)                                     ;B4D94F
    %AICMD0x13_Wait(60)                                        ;B4D953
pAIScripting0x3A_L006:
    %AICMD0x13_Wait(1)                                         ;B4D956
    %AICMD0x12_Jump(pAIScripting0x3A_L006)                                   ;B4D959
pAIScripting0x3A_L007:
    %AICMD0x1A($0178, $00A8, aAIScriptingData_L051, $00)                     ;B4D95C
    %AICMD0x0C_WaitForScriptFlag($02)                                            ;B4D964
    %AICMD0x1B($02A6, $00)                                     ;B4D966
    %AICMD0x13_Wait(120)                                       ;B4D96A
pAIScripting0x3A_L008:
    %AICMD0x13_Wait(1)                                         ;B4D96D
    %AICMD0x12_Jump(pAIScripting0x3A_L008)                                   ;B4D970
pAIScripting0x3A_L009:
    %AICMD0x1A($0158, $00C8, aAIScriptingData_L068, $00)                     ;B4D973
pAIScripting0x3A_L010:
    %AICMD0x13_Wait(1)                                         ;B4D97B
    %AICMD0x12_Jump(pAIScripting0x3A_L010)                                   ;B4D97E
pAIScripting0x3A_L011:
    %AICMD0x1A($0168, $00B8, aAIScriptingData_L055, $00)                     ;B4D981
    %AICMD0x0C_WaitForScriptFlag($02)                                            ;B4D989
    %AICMD0x1B($02B6, $01)                                     ;B4D98B
    %AICMD0x13_Wait(120)                                       ;B4D98F
pAIScripting0x3A_L012:
    %AICMD0x13_Wait(1)                                         ;B4D992
    %AICMD0x12_Jump(pAIScripting0x3A_L012)                                   ;B4D995
pAIScripting0x3A_L013:
    %AICMD0x1A($0088, $00B8, aAIScriptingData_L045, $03)                     ;B4D998
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B4D9A0
    %AICMD0x1B($0293, $01)                                     ;B4D9A2
    %AICMD0x13_Wait(60)                                        ;B4D9A6
    %AICMD0x1B($028F, $00)                                     ;B4D9A9
    %AICMD0x13_Wait(60)                                        ;B4D9AD
    %AICMD0x1B($0295, $00)                                     ;B4D9B0
    %AICMD0x13_Wait(120)                                       ;B4D9B4
pAIScripting0x3A_L014:
    %AICMD0x13_Wait(1)                                         ;B4D9B7
    %AICMD0x12_Jump(pAIScripting0x3A_L014)                                   ;B4D9BA
pAIScripting0x3A_L015:
    %AICMD0x1A($0098, $00A8, aAIScriptingData_L062, $02)                     ;B4D9BD
    %AICMD0x13_Wait(120)                                       ;B4D9C5
    %AICMD0x1B($02C4, $00)                                     ;B4D9C8
    %AICMD0x13_Wait(60)                                        ;B4D9CC
    %AICMD0x1B($02C5, $00)                                     ;B4D9CF
pAIScripting0x3A_L016:
    %AICMD0x13_Wait(1)                                         ;B4D9D3
    %AICMD0x12_Jump(pAIScripting0x3A_L016)                                   ;B4D9D6
pAIScripting0x3A_L017:
    %AICMD0x1A($0078, $00B8, aAIScriptingData_L069, $02)                     ;B4D9D9
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B4D9E1
    %AICMD0x1B($02DA, $00)                                     ;B4D9E3
    %AICMD0x0D($00, $01, $10, $01)                             ;B4D9E7
    %AICMD0x1B($02DD, $01)                                     ;B4D9EC
    %AICMD0x13_Wait(120)                                       ;B4D9F0
pAIScripting0x3A_L018:
    %AICMD0x13_Wait(1)                                         ;B4D9F3
    %AICMD0x12_Jump(pAIScripting0x3A_L018)                                   ;B4D9F6
pAIScripting0x3A_L019:
    %AICMD0x1A($00A8, $00A8, aAIScriptingData_L070, $03)                     ;B4D9F9
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B4DA01
    %AICMD0x1B($02E1, $01)                                     ;B4DA03
    %AICMD0x0D($01, $00, $10, $01)                             ;B4DA07
    %AICMD0x1B($02DF, $00)                                     ;B4DA0C
    %AICMD0x0D($00, $01, $10, $01)                             ;B4DA10
    %AICMD0x1B($02E1, $00)                                     ;B4DA15
    %AICMD0x13_Wait(120)                                       ;B4DA19
pAIScripting0x3A_L020:
    %AICMD0x13_Wait(1)                                         ;B4DA1C
    %AICMD0x12_Jump(pAIScripting0x3A_L020)                                   ;B4DA1F
