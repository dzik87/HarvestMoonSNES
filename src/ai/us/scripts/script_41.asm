

pAIScripting0x41:
    dw pAIScripting0x41_Data01                                            ;B4E7AF|        |B4E7CF;
    dw pAIScripting0x42                                        ;B4E7B1|        |B4E989;
    dw pAIScripting0x42                                        ;B4E7B3|        |B4E989;
    dw pAIScripting0x42                                        ;B4E7B5|        |B4E989;
    dw pAIScripting0x42                                        ;B4E7B7|        |B4E989;
    dw pAIScripting0x42                                        ;B4E7B9|        |B4E989;
    dw pAIScripting0x42                                        ;B4E7BB|        |B4E989;
    dw pAIScripting0x42                                        ;B4E7BD|        |B4E989;
    dw pAIScripting0x42                                        ;B4E7BF|        |B4E989;
    dw pAIScripting0x42                                        ;B4E7C1|        |B4E989;
    dw pAIScripting0x42                                        ;B4E7C3|        |B4E989;
    dw pAIScripting0x42                                        ;B4E7C5|        |B4E989;
    dw pAIScripting0x42                                        ;B4E7C7|        |B4E989;
    dw pAIScripting0x42                                        ;B4E7C9|        |B4E989;
    dw pAIScripting0x42                                        ;B4E7CB|        |B4E989;
    dw pAIScripting0x42                                        ;B4E7CD|        |B4E989;
 
pAIScripting0x41_Data01:
    %AICMD0x47_SetValue8($800921, 2)                           ;B4E7CF
    %AICMD0x00_SetMusic($10, $B4)                              ;B4E7D4
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $03)       ;B4E7D7
    %AICMD0x02_FreezeTime()                                    ;B4E7DC
    %AICMD0x03_SetHour($06)                                    ;B4E7DD
    %AICMD0x05_SetTransferPosition(88, 104)                    ;B4E7DF
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4E7E4
    %AICMD0x08_EnableAIControl()                               ;B4E7E6
    %AICMD0x09_StartScript($01, pAIScripting0x41_L001)                                   ;B4E7E7
    %AICMD0x09_StartScript($02, pAIScripting0x41_L003)                                   ;B4E7EB
    %AICMD0x09_StartScript($03, pAIScripting0x41_L007)                                   ;B4E7EF
    %AICMD0x09_StartScript($04, pAIScripting0x41_L009)                                   ;B4E7F3
    %AICMD0x09_StartScript($05, pAIScripting0x41_L011)                                   ;B4E7F7
    %AICMD0x09_StartScript($06, pAIScripting0x41_L005)                                   ;B4E7FB
    %AICMD0x06_SetDestinationArea(!AREA_ENDING03)              ;B4E7FF
    %AICMD0x38_WaitForFadeIn()                                               ;B4E801
    %AICMD0x56_UseEquippedItem()                               ;B4E802
    %AICMD0x13_Wait(60)                                        ;B4E803
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 16)                 ;B4E806
    %AICMD0x13_Wait(18)                                        ;B4E80A
    %AICMD0x56_UseEquippedItem()                               ;B4E80D
    %AICMD0x13_Wait(60)                                        ;B4E80E
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 16)                 ;B4E811
    %AICMD0x13_Wait(18)                                        ;B4E815
    %AICMD0x56_UseEquippedItem()                               ;B4E818
    %AICMD0x13_Wait(60)                                        ;B4E819
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 8)                  ;B4E81C
    %AICMD0x13_Wait(18)                                        ;B4E820
    %AICMD0x19($0041, $00)                                     ;B4E823
    %AICMD0x13_Wait(90)                                        ;B4E827
    %AICMD0x0B_SetScriptFlag($00)                                            ;B4E82A
    %AICMD0x19($003D, $00)                                     ;B4E82C
    %AICMD0x13_Wait(120)                                       ;B4E830
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4E833
    %AICMD0x13_Wait(60)                                        ;B4E835
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B4E838
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 16)                   ;B4E83A
    %AICMD0x13_Wait(60)                                        ;B4E83E
    %AICMD0x19($0042, $00)                                     ;B4E841
    %AICMD0x13_Wait(60)                                        ;B4E845
    %AICMD0x19($0023, $00)                                     ;B4E848
    %AICMD0x13_Wait(120)                                       ;B4E84C
    %AICMD0x0B_SetScriptFlag($02)                                            ;B4E84F
    %AICMD0x0C_WaitForScriptFlag($03)                                            ;B4E851
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 16)                  ;B4E853
    %AICMD0x13_Wait(30)                                        ;B4E857
    %AICMD0x28_ClearBit(strcFlags.daily4, $03)                          ;B4E85A
    %AICMD0x3D_TeleportToArea(!AREA_ENDING00)                  ;B4E85F
    %AICMD0x10_End()                                           ;B4E861
pAIScripting0x41_L001:
    %AICMD0x1A($0030, $0068, aAIScriptingData_L077, $02)                     ;B4E862
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B4E86A
    %AICMD0x0D($01, $00, $40, $04)                             ;B4E86C
    %AICMD0x13_Wait(30)                                        ;B4E871
    %AICMD0x0D($01, $00, $18, $04)                             ;B4E874
    %AICMD0x13_Wait(30)                                        ;B4E879
    %AICMD0x1B($02F6, $01)                                     ;B4E87C
    %AICMD0x13_Wait(30)                                        ;B4E880
    %AICMD0x0D($01, $00, $20, $04)                             ;B4E883
    %AICMD0x1B($02F6, $01)                                     ;B4E888
    %AICMD0x13_Wait(30)                                        ;B4E88C
    %AICMD0x1B($02F7, $01)                                     ;B4E88F
    %AICMD0x0D($01, $00, $20, $04)                             ;B4E893
    %AICMD0x13_Wait(30)                                        ;B4E898
    %AICMD0x0B_SetScriptFlag($01)                                            ;B4E89B
    %AICMD0x0C_WaitForScriptFlag($02)                                            ;B4E89D
    %AICMD0x13_Wait(60)                                        ;B4E89F
    %AICMD0x1B($02F7, $00)                                     ;B4E8A2
    %AICMD0x0D($FF, $00, $20, $02)                             ;B4E8A6
    %AICMD0x13_Wait(90)                                        ;B4E8AB
pAIScripting0x41_L002:
    %AICMD0x13_Wait(1)                                         ;B4E8AE
    %AICMD0x12_Jump(pAIScripting0x41_L002)                                   ;B4E8B1
pAIScripting0x41_L003:
    %AICMD0x1A($FFF6, $0068, aAIScriptingData_L073, $02)                     ;B4E8B4
    %AICMD0x0C_WaitForScriptFlag($02)                                            ;B4E8BC
    %AICMD0x0D($01, $00, $40, $01)                             ;B4E8BE
    %AICMD0x1B($02E6, $01)                                     ;B4E8C3
    %AICMD0x13_Wait(60)                                        ;B4E8C7
    %AICMD0x1B($02ED, $01)                                     ;B4E8CA
    %AICMD0x13_Wait(120)                                       ;B4E8CE
    %AICMD0x1B($0233, $01)                                     ;B4E8D1
    %AICMD0x13_Wait(60)                                        ;B4E8D5
    %AICMD0x0B_SetScriptFlag($03)                                            ;B4E8D8
pAIScripting0x41_L004:
    %AICMD0x13_Wait(1)                                         ;B4E8DA
    %AICMD0x12_Jump(pAIScripting0x41_L004)                                   ;B4E8DD
pAIScripting0x41_L005:
    %AICMD0x1A($0024, $0078, aAIScriptingData_L079, $00)                     ;B4E8E0
    %AICMD0x0D($00, $01, $40, $02)                             ;B4E8E8
    %AICMD0x13_Wait(60)                                        ;B4E8ED
    %AICMD0x1B($02FF, $01)                                     ;B4E8F0
    %AICMD0x0D($01, $00, $20, $02)                             ;B4E8F4
    %AICMD0x13_Wait(120)                                       ;B4E8F9
    %AICMD0x1B($02F8, $01)                                     ;B4E8FC
pAIScripting0x41_L006:
    %AICMD0x13_Wait(1)                                         ;B4E900
    %AICMD0x12_Jump(pAIScripting0x41_L006)                                   ;B4E903
pAIScripting0x41_L007:
    %AICMD0x1A($0048, $0098, aAIScriptingData_L004, $03)                     ;B4E906
    %AICMD0x1B($01F4, $00)                                     ;B4E90E
    %AICMD0x13_Wait(180)                                       ;B4E912
    %AICMD0x1B($01F5, $00)                                     ;B4E915
    %AICMD0x13_Wait(120)                                       ;B4E919
    %AICMD0x1B($01F0, $00)                                     ;B4E91C
    %AICMD0x13_Wait(120)                                       ;B4E920
    %AICMD0x1B($01EA, $00)                                     ;B4E923
    %AICMD0x13_Wait(180)                                       ;B4E927
    %AICMD0x1B($01EB, $00)                                     ;B4E92A
    %AICMD0x13_Wait(60)                                        ;B4E92E
    %AICMD0x1B($01EA, $00)                                     ;B4E931
pAIScripting0x41_L008:
    %AICMD0x13_Wait(1)                                         ;B4E935
    %AICMD0x12_Jump(pAIScripting0x41_L008)                                   ;B4E938
pAIScripting0x41_L009:
    %AICMD0x1A($00B8, $0098, aAIScriptingData_L006, $03)                     ;B4E93B
pAIScripting0x41_L010:
    %AICMD0x1B($0201, $00)                                     ;B4E943
    %AICMD0x13_Wait(180)                                       ;B4E947
    %AICMD0x1B($0201, $00)                                     ;B4E94A
    %AICMD0x0D($FF, $00, $20, $01)                             ;B4E94E
    %AICMD0x1B($0203, $00)                                     ;B4E953
    %AICMD0x13_Wait(240)                                       ;B4E957
    %AICMD0x1B($0205, $00)                                     ;B4E95A
    %AICMD0x13_Wait(180)                                       ;B4E95E
    %AICMD0x1B($0201, $01)                                     ;B4E961
    %AICMD0x0D($01, $00, $20, $01)                             ;B4E965
    %AICMD0x1B($0205, $01)                                     ;B4E96A
    %AICMD0x13_Wait(180)                                       ;B4E96E
    %AICMD0x12_Jump(pAIScripting0x41_L010)                                   ;B4E971
pAIScripting0x41_L011:
    %AICMD0x1A($00A8, $0028, aAIScriptingData_L008, $03)                     ;B4E974
    %AICMD0x22($18, $10, $01, aAIScriptingData_L008, $08)                    ;B4E97C
pAIScripting0x41_L012:
    %AICMD0x13_Wait(1)                                         ;B4E983
    %AICMD0x12_Jump(pAIScripting0x41_L012)                                   ;B4E986
