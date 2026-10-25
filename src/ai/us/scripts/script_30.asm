

    incsrc "../../../../build/gen/ai/slots_30.asm"
 
pAIScripting0x30_Data01:
    %AICMD0x00_SetMusic($10, $B4)                              ;B4C7E3
    %AICMD0x02_FreezeTime()                                    ;B4C7E6
    %AICMD0x03_SetHour($06)                                    ;B4C7E7
    %AICMD0x05_SetTransferPosition(65512, 120)                 ;B4C7E9
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4C7EE
    %AICMD0x40_DisableTileInteractions()                       ;B4C7F0
    %AICMD0x08_EnableAIControl()                               ;B4C7F1
    %AICMD0x09_StartScript($01, pAIScripting0x30_L013)                                   ;B4C7F2
    %AICMD0x09_StartScript($02, pAIScripting0x30_L001)                                   ;B4C7F6
    %AICMD0x09_StartScript($03, pAIScripting0x30_L003)                                   ;B4C7FA
    %AICMD0x09_StartScript($04, pAIScripting0x30_L005)                                   ;B4C7FE
    %AICMD0x09_StartScript($05, pAIScripting0x30_L007)                                   ;B4C802
    %AICMD0x09_StartScript($06, pAIScripting0x30_L009)                                   ;B4C806
    %AICMD0x09_StartScript($07, pAIScripting0x30_L011)                                   ;B4C80A
    %AICMD0x06_SetDestinationArea(!AREA_ENDING06)              ;B4C80E
    %AICMD0x38_WaitForFadeIn()                                               ;B4C810
    %AICMD0x13_Wait(120)                                       ;B4C811
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 136)                ;B4C814
    %AICMD0x13_Wait(60)                                        ;B4C818
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4C81B
    %AICMD0x19($0062, $00)                                     ;B4C81D
    %AICMD0x13_Wait(90)                                        ;B4C821
    %AICMD0x0B_SetScriptFlag($00)                                            ;B4C824
    %AICMD0x19($0063, $00)                                     ;B4C826
    %AICMD0x13_Wait(90)                                        ;B4C82A
    %AICMD0x0B_SetScriptFlag($01)                                            ;B4C82D
    %AICMD0x19($0060, $00)                                     ;B4C82F
    %AICMD0x13_Wait(90)                                        ;B4C833
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4C836
    %AICMD0x13_Wait(30)                                        ;B4C838
    %AICMD0x19($0026, $00)                                     ;B4C83B
    %AICMD0x13_Wait(120)                                       ;B4C83F
    %AICMD0x19($0027, $00)                                     ;B4C842
    %AICMD0x13_Wait(90)                                        ;B4C846
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 32)                   ;B4C849
    %AICMD0x19($0024, $00)                                     ;B4C84D
    %AICMD0x13_Wait(90)                                        ;B4C851
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 32)                  ;B4C854
    %AICMD0x19($0026, $00)                                     ;B4C858
    %AICMD0x13_Wait(60)                                        ;B4C85C
    %AICMD0x3D_TeleportToArea(!AREA_ENDING00)                  ;B4C85F
    %AICMD0x10_End()                                           ;B4C861
pAIScripting0x30_L001:
    %AICMD0x1A($00B8, $0058, aAIScriptingData_L152, $03)                     ;B4C862
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B4C86A
    %AICMD0x1B($018C, $00)                                     ;B4C86C
    %AICMD0x1B($019F, $00)                                     ;B4C870
    %AICMD0x0D($00, $01, $20, $01)                             ;B4C874
    %AICMD0x13_Wait(40)                                        ;B4C879
    %AICMD0x1B($018B, $00)                                     ;B4C87C
    %AICMD0x0D($FF, $00, $36, $01)                             ;B4C880
    %AICMD0x13_Wait(60)                                        ;B4C885
    %AICMD0x2F(aAIScriptingData_L002)                                        ;B4C888
    %AICMD0x22($08, $04, $01, aAIScriptingData_L003, $08)                    ;B4C88B
pAIScripting0x30_L002:
    %AICMD0x13_Wait(1)                                         ;B4C892
    %AICMD0x12_Jump(pAIScripting0x30_L002)                                   ;B4C895
pAIScripting0x30_L003:
    %AICMD0x1A($0038, $0068, aAIScriptingData_L150, $02)                     ;B4C898
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B4C8A0
    %AICMD0x1B($0190, $01)                                     ;B4C8A2
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B4C8A6
    %AICMD0x1B($018C, $01)                                     ;B4C8A8
    %AICMD0x1B($019F, $00)                                     ;B4C8AC
    %AICMD0x0D($00, $01, $1C, $02)                             ;B4C8B0
    %AICMD0x13_Wait(20)                                        ;B4C8B5
    %AICMD0x1B($018B, $01)                                     ;B4C8B8
    %AICMD0x0D($01, $00, $4E, $02)                             ;B4C8BC
    %AICMD0x13_Wait(120)                                       ;B4C8C1
    %AICMD0x22($08, $08, $01, aAIScriptingData_L003, $08)                    ;B4C8C4
pAIScripting0x30_L004:
    %AICMD0x13_Wait(1)                                         ;B4C8CB
    %AICMD0x12_Jump(pAIScripting0x30_L004)                                   ;B4C8CE
pAIScripting0x30_L005:
    %AICMD0x1A($0028, $00C8, aAIScriptingData_L003, $01)                     ;B4C8D1
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B4C8D9
    %AICMD0x13_Wait(10)                                        ;B4C8DB
    %AICMD0x1B($018B, $01)                                     ;B4C8DE
    %AICMD0x0D($01, $00, $20, $01)                             ;B4C8E2
    %AICMD0x13_Wait(30)                                        ;B4C8E7
    %AICMD0x1B($018B, $01)                                     ;B4C8EA
    %AICMD0x0D($01, $00, $36, $02)                             ;B4C8EE
    %AICMD0x13_Wait(30)                                        ;B4C8F3
    %AICMD0x1B($01A7, $00)                                     ;B4C8F6
    %AICMD0x0D($00, $FF, $42, $01)                             ;B4C8FA
    %AICMD0x1B($018B, $01)                                     ;B4C8FF
    %AICMD0x13_Wait(120)                                       ;B4C903
    %AICMD0x22($08, $04, $01, aAIScriptingData_L003, $01)                    ;B4C906
pAIScripting0x30_L006:
    %AICMD0x13_Wait(1)                                         ;B4C90D
    %AICMD0x12_Jump(pAIScripting0x30_L006)                                   ;B4C910
pAIScripting0x30_L007:
    %AICMD0x1A($0098, $0038, aAIScriptingData_L152, $00)                     ;B4C913
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B4C91B
    %AICMD0x13_Wait(20)                                        ;B4C91D
    %AICMD0x1B($019F, $00)                                     ;B4C920
    %AICMD0x0D($00, $01, $30, $01)                             ;B4C924
    %AICMD0x13_Wait(30)                                        ;B4C929
    %AICMD0x1B($018B, $00)                                     ;B4C92C
    %AICMD0x0D($FF, $00, $3C, $02)                             ;B4C930
    %AICMD0x1B($0190, $00)                                     ;B4C935
    %AICMD0x13_Wait(120)                                       ;B4C939
    %AICMD0x1B($0190, $00)                                     ;B4C93C
    %AICMD0x13_Wait(120)                                       ;B4C940
pAIScripting0x30_L008:
    %AICMD0x13_Wait(1)                                         ;B4C943
    %AICMD0x12_Jump(pAIScripting0x30_L008)                                   ;B4C946
pAIScripting0x30_L009:
    %AICMD0x1A($00A8, $00A8, aAIScriptingData_L120, $03)                     ;B4C949
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B4C951
    %AICMD0x1B($01B0, $00)                                     ;B4C953
    %AICMD0x0D($FE, $00, $48, $03)                             ;B4C957
    %AICMD0x13_Wait(20)                                        ;B4C95C
    %AICMD0x1B($01B7, $00)                                     ;B4C95F
    %AICMD0x0D($00, $FF, $4E, $03)                             ;B4C963
    %AICMD0x13_Wait(60)                                        ;B4C968
pAIScripting0x30_L010:
    %AICMD0x13_Wait(1)                                         ;B4C96B
    %AICMD0x12_Jump(pAIScripting0x30_L010)                                   ;B4C96E
pAIScripting0x30_L011:
    %AICMD0x1A($0088, $00B8, aAIScriptingData_L114, $02)                     ;B4C971
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B4C979
    %AICMD0x13_Wait(60)                                        ;B4C97B
    %AICMD0x1B($01CA, $00)                                     ;B4C97E
    %AICMD0x0D($FF, $00, $20, $01)                             ;B4C982
    %AICMD0x13_Wait(60)                                        ;B4C987
    %AICMD0x1B($01CA, $01)                                     ;B4C98A
    %AICMD0x0D($01, $00, $20, $01)                             ;B4C98E
    %AICMD0x13_Wait(60)                                        ;B4C993
    %AICMD0x1B($01D8, $00)                                     ;B4C996
    %AICMD0x0D($00, $FF, $38, $02)                             ;B4C99A
    %AICMD0x13_Wait(60)                                        ;B4C99F
    %AICMD0x1B($01CA, $01)                                     ;B4C9A2
    %AICMD0x0D($01, $00, $40, $02)                             ;B4C9A6
    %AICMD0x0B_SetScriptFlag($02)                                            ;B4C9AB
    %AICMD0x1B($01D0, $01)                                     ;B4C9AD
    %AICMD0x13_Wait(120)                                       ;B4C9B1
pAIScripting0x30_L012:
    %AICMD0x13_Wait(1)                                         ;B4C9B4
    %AICMD0x12_Jump(pAIScripting0x30_L012)                                   ;B4C9B7
pAIScripting0x30_L013:
    %AICMD0x1A($0038, $00A0, aAIScriptingData_L173, $02)                     ;B4C9BA
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B4C9C2
    %AICMD0x1B($01F5, $01)                                     ;B4C9C4
    %AICMD0x13_Wait(120)                                       ;B4C9C8
    %AICMD0x1B($01F4, $01)                                     ;B4C9CB
    %AICMD0x1B($01F3, $01)                                     ;B4C9CF
    %AICMD0x13_Wait(120)                                       ;B4C9D3
    %AICMD0x1B($01E8, $01)                                     ;B4C9D6
    %AICMD0x0C_WaitForScriptFlag($02)                                            ;B4C9DA
    %AICMD0x1B($01EC, $01)                                     ;B4C9DC
    %AICMD0x0D($01, $00, $60, $01)                             ;B4C9E0
    %AICMD0x1B($01F2, $01)                                     ;B4C9E5
    %AICMD0x13_Wait(90)                                        ;B4C9E9
    %AICMD0x1B($01EE, $01)                                     ;B4C9EC
    %AICMD0x13_Wait(120)                                       ;B4C9F0
pAIScripting0x30_L014:
    %AICMD0x13_Wait(1)                                         ;B4C9F3
    %AICMD0x12_Jump(pAIScripting0x30_L014)                                   ;B4C9F6
