

pAIScripting0x0B:
    dw DATA8_B3E9FA                                            ;B3E9DA|        |B3E9FA;
    dw DATA8_B3EB5C                                            ;B3E9DC|        |B3EB5C;
    dw DATA8_B3EB83                                            ;B3E9DE|        |B3EB83;
    dw DATA8_B3EBB2                                            ;B3E9E0|        |B3EBB2;
    dw DATA8_B3EC2D                                            ;B3E9E2|        |B3EC2D;
    dw DATA8_B3EC8D                                            ;B3E9E4|        |B3EC8D;
    dw DATA8_B3ECE2                                            ;B3E9E6|        |B3ECE2;
    dw DATA8_B3ED39                                            ;B3E9E8|        |B3ED39;
    dw DATA8_B3EE1A                                            ;B3E9EA|        |B3EE1A;
    dw DATA8_B3EE1A                                            ;B3E9EC|        |B3EE1A;
    dw AI_HouseExtensionCampain                                ;B3E9EE|        |B3EEEA;
    dw DATA8_B3EF0A                                            ;B3E9F0|        |B3EF0A;
    dw DATA8_B3EF2E                                            ;B3E9F2|        |B3EF2E;
    dw pAIScripting0x0C_DogEvent                               ;B3E9F4|        |B3EF5A;
    dw pAIScripting0x0C_DogEvent                               ;B3E9F6|        |B3EF5A;
    dw pAIScripting0x0C_DogEvent                               ;B3E9F8|        |B3EF5A;
 
DATA8_B3E9FA:
 
    %AICMD0x02_FreezeTime()                                    ;B3E9FA
    %AICMD0x03_SetHour($07)                                    ;B3E9FB
    %AICMD0x09_StartScript($01, pAIScripting0x0B_L001)                                   ;B3E9FD
    %AICMD0x09_StartScript($02, pAIScripting0x0B_L004)                                   ;B3EA01
    %AICMD0x09_StartScript($03, pAIScripting0x0B_L009)                                   ;B3EA05
    %AICMD0x09_StartScript($04, pAIScripting0x0B_L012)                                   ;B3EA09
    %AICMD0x09_StartScript($05, pAIScripting0x0B_L017)                                   ;B3EA0D
    %AICMD0x09_StartScript($06, pAIScripting0x0B_L022)                                   ;B3EA11
    %AICMD0x09_StartScript($07, pAIScripting0x0B_L025)                                   ;B3EA15
    %AICMD0x09_StartScript($08, pAIScripting0x0B_L028)                                   ;B3EA19
    %AICMD0x38_WaitForFadeIn()                                               ;B3EA1D
    %AICMD0x10_End()                                           ;B3EA1E
pAIScripting0x0B_L001:
    %AICMD0x1A($0128, $0228, aAIScriptingData_L033, $00)                     ;B3EA1F
    %AICMD0x22($18, $18, $01, aAIScriptingData_L034, $0C)                    ;B3EA27
pAIScripting0x0B_L002:
    %AICMD0x1F(pAIScripting0x0B_L003)                                        ;B3EA2E
    %AICMD0x12_Jump(pAIScripting0x0B_L002)                                   ;B3EA31
pAIScripting0x0B_L003:
    %AICMD0x1C_ShowDialog($00F4, $00)                          ;B3EA34
    %AICMD0x12_Jump(pAIScripting0x0B_L002)                                   ;B3EA38
pAIScripting0x0B_L004:
    %AICMD0x1A($0048, $0118, aAIScriptingData_L044, $00)                     ;B3EA3B
pAIScripting0x0B_L005:
    %AICMD0x1F(pAIScripting0x0B_L007)                                        ;B3EA43
    %AICMD0x12_Jump(pAIScripting0x0B_L005)                                   ;B3EA46
pAIScripting0x0B_L006:
    %AICMD0x1F(pAIScripting0x0B_L008)                                        ;B3EA49
    %AICMD0x12_Jump(pAIScripting0x0B_L006)                                   ;B3EA4C
pAIScripting0x0B_L007:
    %AICMD0x1C_ShowDialog($00F5, $00)                          ;B3EA4F
    %AICMD0x12_Jump(pAIScripting0x0B_L006)                                   ;B3EA53
pAIScripting0x0B_L008:
    %AICMD0x1C_ShowDialog($00F6, $00)                          ;B3EA56
    %AICMD0x12_Jump(pAIScripting0x0B_L006)                                   ;B3EA5A
pAIScripting0x0B_L009:
    %AICMD0x1A($0148, $00B8, aAIScriptingData_L067, $00)                     ;B3EA5D
    %AICMD0x22($18, $18, $01, aAIScriptingData_L068, $0C)                    ;B3EA65
pAIScripting0x0B_L010:
    %AICMD0x1F(pAIScripting0x0B_L011)                                        ;B3EA6C
    %AICMD0x12_Jump(pAIScripting0x0B_L010)                                   ;B3EA6F
pAIScripting0x0B_L011:
    %AICMD0x1C_ShowDialog($00FC, $00)                          ;B3EA72
    %AICMD0x12_Jump(pAIScripting0x0B_L010)                                   ;B3EA76
pAIScripting0x0B_L012:
    %AICMD0x1A($01A8, $00D8, aAIScriptingData_L051, $00)                     ;B3EA79
pAIScripting0x0B_L013:
    %AICMD0x1F(pAIScripting0x0B_L015)                                        ;B3EA81
    %AICMD0x12_Jump(pAIScripting0x0B_L013)                                   ;B3EA84
pAIScripting0x0B_L014:
    %AICMD0x1F(pAIScripting0x0B_L016)                                        ;B3EA87
    %AICMD0x12_Jump(pAIScripting0x0B_L014)                                   ;B3EA8A
pAIScripting0x0B_L015:
    %AICMD0x1C_ShowDialog($00FD, $00)                          ;B3EA8D
    %AICMD0x12_Jump(pAIScripting0x0B_L014)                                   ;B3EA91
pAIScripting0x0B_L016:
    %AICMD0x1C_ShowDialog($00FE, $00)                          ;B3EA94
    %AICMD0x12_Jump(pAIScripting0x0B_L014)                                   ;B3EA98
pAIScripting0x0B_L017:
    %AICMD0x1A($0178, $0388, aAIScriptingData_L015, $00)                     ;B3EA9B
    %AICMD0x22($20, $18, $01, aAIScriptingData_L016, $10)                    ;B3EAA3
pAIScripting0x0B_L018:
    %AICMD0x1F(pAIScripting0x0B_L020)                                        ;B3EAAA
    %AICMD0x12_Jump(pAIScripting0x0B_L018)                                   ;B3EAAD
pAIScripting0x0B_L019:
    %AICMD0x1F(pAIScripting0x0B_L021)                                        ;B3EAB0
    %AICMD0x12_Jump(pAIScripting0x0B_L019)                                   ;B3EAB3
pAIScripting0x0B_L020:
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown1, $00)     ;B3EAB6
    %AICMD0x1C_ShowDialog($0103, $00)                          ;B3EABB
    %AICMD0x12_Jump(pAIScripting0x0B_L019)                                   ;B3EABF
pAIScripting0x0B_L021:
    %AICMD0x1C_ShowDialog($0104, $00)                          ;B3EAC2
    %AICMD0x12_Jump(pAIScripting0x0B_L019)                                   ;B3EAC6
pAIScripting0x0B_L022:
    %AICMD0x1A($0248, $0168, aAIScriptingData_L057, $00)                     ;B3EAC9
pAIScripting0x0B_L023:
    %AICMD0x1F(pAIScripting0x0B_L024)                                        ;B3EAD1
    %AICMD0x12_Jump(pAIScripting0x0B_L023)                                   ;B3EAD4
pAIScripting0x0B_L024:
    %AICMD0x1C_ShowDialog($010F, $00)                          ;B3EAD7
    %AICMD0x12_Jump(pAIScripting0x0B_L023)                                   ;B3EADB
pAIScripting0x0B_L025:
    %AICMD0x1A($0098, $0368, aAIScriptingData_L024, $00)                     ;B3EADE
pAIScripting0x0B_L026:
    %AICMD0x1F(pAIScripting0x0B_L027)                                        ;B3EAE6
    %AICMD0x12_Jump(pAIScripting0x0B_L026)                                   ;B3EAE9
pAIScripting0x0B_L027:
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown1, $01)     ;B3EAEC
    %AICMD0x1C_ShowDialog($0116, $00)                          ;B3EAF1
    %AICMD0x12_Jump(pAIScripting0x0B_L026)                                   ;B3EAF5
pAIScripting0x0B_L028:
    %AICMD0x1A($02D8, $01A8, aAIScriptingData_L037, $03)                     ;B3EAF8
pAIScripting0x0B_L029:
    %AICMD0x1F(pAIScripting0x0B_L030)                                        ;B3EB00
    %AICMD0x12_Jump(pAIScripting0x0B_L029)                                   ;B3EB03
pAIScripting0x0B_L030:
    %AICMD0x55_JumpIfFlagNotSet(strcFlags.unknown1, $00, pAIScripting0x0B_L033)               ;B3EB06
    %AICMD0x55_JumpIfFlagNotSet(strcFlags.unknown1, $01, pAIScripting0x0B_L033)               ;B3EB0D
    %AICMD0x55_JumpIfFlagNotSet(strcFlags.unknown1, $02, pAIScripting0x0B_L033)               ;B3EB14
    %AICMD0x55_JumpIfFlagNotSet(strcFlags.unknown1, $03, pAIScripting0x0B_L033)               ;B3EB1B
    %AICMD0x55_JumpIfFlagNotSet(strcFlags.unknown1, $04, pAIScripting0x0B_L033)               ;B3EB22
    %AICMD0x55_JumpIfFlagNotSet(strcFlags.unknown1, $05, pAIScripting0x0B_L033)               ;B3EB29
    %AICMD0x1D_ShowDialog($0117, $00)                          ;B3EB30
    %AICMD0x20_JumpIfChoice(0, pAIScripting0x0B_L031)                        ;B3EB34
    %AICMD0x20_JumpIfChoice(1, pAIScripting0x0B_L032)                        ;B3EB38
    %AICMD0x12_Jump(pAIScripting0x0B_L029)                                   ;B3EB3C
pAIScripting0x0B_L031:
    %AICMD0x1C_ShowDialog($0118, $00)                          ;B3EB3F
    %AICMD0x1B($027B, $01)                                     ;B3EB43
    %AICMD0x0D($01, $00, $30, $01)                             ;B3EB47
    %AICMD0x37()                                               ;B3EB4C
    %AICMD0x10_End()                                           ;B3EB4D
pAIScripting0x0B_L032:
    %AICMD0x1C_ShowDialog($0119, $00)                          ;B3EB4E
    %AICMD0x12_Jump(pAIScripting0x0B_L029)                                   ;B3EB52
pAIScripting0x0B_L033:
    %AICMD0x1C_ShowDialog($011A, $00)                          ;B3EB55
    %AICMD0x12_Jump(pAIScripting0x0B_L029)                                   ;B3EB59


DATA8_B3EB5C:
 
    %AICMD0x09_StartScript($01, pAIScripting0x0B_L034)                                   ;B3EB5C
    %AICMD0x10_End()                                           ;B3EB60
pAIScripting0x0B_L034:
    %AICMD0x1A($0188, $00A8, aAIScriptingData_L061, $00)                     ;B3EB61
pAIScripting0x0B_L035:
    %AICMD0x1F(pAIScripting0x0B_L037)                                        ;B3EB69
    %AICMD0x12_Jump(pAIScripting0x0B_L035)                                   ;B3EB6C
pAIScripting0x0B_L036:
    %AICMD0x1F(pAIScripting0x0B_L038)                                        ;B3EB6F
    %AICMD0x12_Jump(pAIScripting0x0B_L036)                                   ;B3EB72
pAIScripting0x0B_L037:
    %AICMD0x1C_ShowDialog($00F7, $00)                          ;B3EB75
    %AICMD0x12_Jump(pAIScripting0x0B_L036)                                   ;B3EB79
pAIScripting0x0B_L038:
    %AICMD0x1C_ShowDialog($00F8, $00)                          ;B3EB7C
    %AICMD0x12_Jump(pAIScripting0x0B_L036)                                   ;B3EB80


DATA8_B3EB83:
 
    %AICMD0x09_StartScript($01, pAIScripting0x0B_L039)                                   ;B3EB83
    %AICMD0x10_End()                                           ;B3EB87
pAIScripting0x0B_L039:
    %AICMD0x1A($0028, $0168, aAIScriptingData_L046, $02)                     ;B3EB88
pAIScripting0x0B_L040:
    %AICMD0x1F(pAIScripting0x0B_L042)                                        ;B3EB90
    %AICMD0x12_Jump(pAIScripting0x0B_L040)                                   ;B3EB93
pAIScripting0x0B_L041:
    %AICMD0x1F(pAIScripting0x0B_L043)                                        ;B3EB96
    %AICMD0x12_Jump(pAIScripting0x0B_L041)                                   ;B3EB99
pAIScripting0x0B_L042:
    %AICMD0x1C_ShowDialog($0101, $00)                          ;B3EB9C
    %AICMD0x1B($029A, $01)                                     ;B3EBA0
    %AICMD0x12_Jump(pAIScripting0x0B_L041)                                   ;B3EBA4
pAIScripting0x0B_L043:
    %AICMD0x1C_ShowDialog($0102, $00)                          ;B3EBA7
    %AICMD0x1B($029A, $01)                                     ;B3EBAB
    %AICMD0x12_Jump(pAIScripting0x0B_L041)                                   ;B3EBAF


DATA8_B3EBB2:
 
    %AICMD0x09_StartScript($01, pAIScripting0x0B_L044)                                   ;B3EBB2
    %AICMD0x09_StartScript($02, pAIScripting0x0B_L049)                                   ;B3EBB6
    %AICMD0x10_End()                                           ;B3EBBA
pAIScripting0x0B_L044:
    %AICMD0x1A($0058, $0068, aAIScriptingData_L019, $00)                     ;B3EBBB
pAIScripting0x0B_L045:
    %AICMD0x1F(pAIScripting0x0B_L047)                                        ;B3EBC3
    %AICMD0x12_Jump(pAIScripting0x0B_L045)                                   ;B3EBC6
pAIScripting0x0B_L046:
    %AICMD0x1F(pAIScripting0x0B_L048)                                        ;B3EBC9
    %AICMD0x12_Jump(pAIScripting0x0B_L046)                                   ;B3EBCC
pAIScripting0x0B_L047:
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown1, $02)     ;B3EBCF
    %AICMD0x1C_ShowDialog($0107, $00)                          ;B3EBD4
    %AICMD0x12_Jump(pAIScripting0x0B_L046)                                   ;B3EBD8
pAIScripting0x0B_L048:
    %AICMD0x1C_ShowDialog($0108, $00)                          ;B3EBDB
    %AICMD0x12_Jump(pAIScripting0x0B_L046)                                   ;B3EBDF
pAIScripting0x0B_L049:
    %AICMD0x1A($0028, $0168, aAIScriptingData_L064, $02)                     ;B3EBE2
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $03, pAIScripting0x0B_L051) ;B3EBEA
pAIScripting0x0B_L050:
    %AICMD0x1F(pAIScripting0x0B_L052)                                        ;B3EBF1
    %AICMD0x12_Jump(pAIScripting0x0B_L050)                                   ;B3EBF4
pAIScripting0x0B_L051:
    %AICMD0x1F(pAIScripting0x0B_L053)                                        ;B3EBF7
    %AICMD0x12_Jump(pAIScripting0x0B_L051)                                   ;B3EBFA
pAIScripting0x0B_L052:
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown1, $03)     ;B3EBFD
    %AICMD0x1C_ShowDialog($0105, $00)                          ;B3EC02
    %AICMD0x1B($02D0, $01)                                     ;B3EC06
    %AICMD0x09_StartScript($03, pAIScripting0x0B_L054)                                   ;B3EC0A
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B3EC0E
    %AICMD0x12_Jump(pAIScripting0x0B_L051)                                   ;B3EC10
pAIScripting0x0B_L053:
    %AICMD0x1C_ShowDialog($0106, $00)                          ;B3EC13
    %AICMD0x1B($02D0, $01)                                     ;B3EC17
    %AICMD0x12_Jump(pAIScripting0x0B_L051)                                   ;B3EC1B
pAIScripting0x0B_L054:
    %AICMD0x1A($0038, $0168, aAIScriptingData_L095, $00)                     ;B3EC1E
    %AICMD0x13_Wait(180)                                       ;B3EC26
    %AICMD0x0B_SetScriptFlag($00)                                            ;B3EC29
    %AICMD0x37()                                               ;B3EC2B
    %AICMD0x10_End()                                           ;B3EC2C


DATA8_B3EC2D:
 
    %AICMD0x09_StartScript($01, pAIScripting0x0B_L055)                                   ;B3EC2D
    %AICMD0x09_StartScript($02, pAIScripting0x0B_L060)                                   ;B3EC31
    %AICMD0x09_StartScript($03, pAIScripting0x0B_L063)                                   ;B3EC35
    %AICMD0x10_End()                                           ;B3EC39
pAIScripting0x0B_L055:
    %AICMD0x1A($0028, $0198, aAIScriptingData_L048, $02)                     ;B3EC3A
    %AICMD0x12_Jump(pAIScripting0x0B_L056)                                   ;B3EC42
pAIScripting0x0B_L056:
    %AICMD0x1F(pAIScripting0x0B_L058)                                        ;B3EC45
    %AICMD0x12_Jump(pAIScripting0x0B_L056)                                   ;B3EC48
pAIScripting0x0B_L057:
    %AICMD0x1F(pAIScripting0x0B_L059)                                        ;B3EC4B
    %AICMD0x12_Jump(pAIScripting0x0B_L057)                                   ;B3EC4E
pAIScripting0x0B_L058:
    %AICMD0x1C_ShowDialog($0109, $00)                          ;B3EC51
    %AICMD0x1B($02A1, $01)                                     ;B3EC55
    %AICMD0x12_Jump(pAIScripting0x0B_L057)                                   ;B3EC59
pAIScripting0x0B_L059:
    %AICMD0x1C_ShowDialog($010A, $00)                          ;B3EC5C
    %AICMD0x1B($02A1, $01)                                     ;B3EC60
    %AICMD0x12_Jump(pAIScripting0x0B_L057)                                   ;B3EC64
pAIScripting0x0B_L060:
    %AICMD0x1A($00C8, $01B8, aAIScriptingData_L050, $00)                     ;B3EC67
    %AICMD0x12_Jump(pAIScripting0x0B_L061)                                   ;B3EC6F
pAIScripting0x0B_L061:
    %AICMD0x1F(pAIScripting0x0B_L062)                                        ;B3EC72
    %AICMD0x12_Jump(pAIScripting0x0B_L061)                                   ;B3EC75
pAIScripting0x0B_L062:
    %AICMD0x1C_ShowDialog($010B, $00)                          ;B3EC78
    %AICMD0x12_Jump(pAIScripting0x0B_L061)                                   ;B3EC7C
pAIScripting0x0B_L063:
    %AICMD0x1A($0087, $0097, aAIScriptingData_L091, $00)                     ;B3EC7F
pAIScripting0x0B_L064:
    %AICMD0x13_Wait(1)                                         ;B3EC87
    %AICMD0x12_Jump(pAIScripting0x0B_L064)                                   ;B3EC8A


DATA8_B3EC8D:
 
    %AICMD0x09_StartScript($01, pAIScripting0x0B_L065)                                   ;B3EC8D
    %AICMD0x09_StartScript($02, pAIScripting0x0B_L070)                                   ;B3EC91
    %AICMD0x10_End()                                           ;B3EC95
pAIScripting0x0B_L065:
    %AICMD0x1A($0088, $0050, aAIScriptingData_L042, $00)                     ;B3EC96
pAIScripting0x0B_L066:
    %AICMD0x1F(pAIScripting0x0B_L068)                                        ;B3EC9E
    %AICMD0x12_Jump(pAIScripting0x0B_L066)                                   ;B3ECA1
pAIScripting0x0B_L067:
    %AICMD0x1F(pAIScripting0x0B_L069)                                        ;B3ECA4
    %AICMD0x12_Jump(pAIScripting0x0B_L067)                                   ;B3ECA7
pAIScripting0x0B_L068:
    %AICMD0x1C_ShowDialog($0111, $00)                          ;B3ECAA
    %AICMD0x1B($0288, $00)                                     ;B3ECAE
    %AICMD0x12_Jump(pAIScripting0x0B_L067)                                   ;B3ECB2
pAIScripting0x0B_L069:
    %AICMD0x1C_ShowDialog($0112, $00)                          ;B3ECB5
    %AICMD0x1B($0288, $00)                                     ;B3ECB9
    %AICMD0x12_Jump(pAIScripting0x0B_L067)                                   ;B3ECBD
pAIScripting0x0B_L070:
    %AICMD0x1A($0038, $0078, aAIScriptingData_L056, $00)                     ;B3ECC0
pAIScripting0x0B_L071:
    %AICMD0x1F(pAIScripting0x0B_L073)                                        ;B3ECC8
    %AICMD0x12_Jump(pAIScripting0x0B_L071)                                   ;B3ECCB
pAIScripting0x0B_L072:
    %AICMD0x1F(pAIScripting0x0B_L074)                                        ;B3ECCE
    %AICMD0x12_Jump(pAIScripting0x0B_L071)                                   ;B3ECD1
pAIScripting0x0B_L073:
    %AICMD0x1C_ShowDialog($0113, $00)                          ;B3ECD4
    %AICMD0x12_Jump(pAIScripting0x0B_L072)                                   ;B3ECD8
pAIScripting0x0B_L074:
    %AICMD0x1C_ShowDialog($0114, $00)                          ;B3ECDB
    %AICMD0x12_Jump(pAIScripting0x0B_L072)                                   ;B3ECDF


DATA8_B3ECE2:
 
    %AICMD0x09_StartScript($01, pAIScripting0x0B_L075)                                   ;B3ECE2
    %AICMD0x10_End()                                           ;B3ECE6
pAIScripting0x0B_L075:
    %AICMD0x1A($00E8, $0098, aAIScriptingData_L053, $03)                     ;B3ECE7
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $04, pAIScripting0x0B_L077) ;B3ECEF
pAIScripting0x0B_L076:
    %AICMD0x1F(pAIScripting0x0B_L078)                                        ;B3ECF6
    %AICMD0x12_Jump(pAIScripting0x0B_L076)                                   ;B3ECF9
pAIScripting0x0B_L077:
    %AICMD0x1F(pAIScripting0x0B_L079)                                        ;B3ECFC
    %AICMD0x12_Jump(pAIScripting0x0B_L077)                                   ;B3ECFF
pAIScripting0x0B_L078:
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown1, $04)     ;B3ED02
    %AICMD0x1C_ShowDialog($010C, $00)                          ;B3ED07
    %AICMD0x1B($02AF, $00)                                     ;B3ED0B
    %AICMD0x13_Wait(30)                                        ;B3ED0F
    %AICMD0x09_StartScript($03, pAIScripting0x0B_L080)                                   ;B3ED12
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B3ED16
    %AICMD0x1B($02AF, $00)                                     ;B3ED18
    %AICMD0x12_Jump(pAIScripting0x0B_L077)                                   ;B3ED1C
pAIScripting0x0B_L079:
    %AICMD0x1C_ShowDialog($010D, $00)                          ;B3ED1F
    %AICMD0x1B($02AF, $00)                                     ;B3ED23
    %AICMD0x12_Jump(pAIScripting0x0B_L077)                                   ;B3ED27
pAIScripting0x0B_L080:
    %AICMD0x1A($00D8, $0098, aAIScriptingData_L096, $00)                     ;B3ED2A
    %AICMD0x0B_SetScriptFlag($00)                                            ;B3ED32
    %AICMD0x13_Wait(120)                                       ;B3ED34
    %AICMD0x37()                                               ;B3ED37
    %AICMD0x10_End()                                           ;B3ED38


DATA8_B3ED39:
 
    %AICMD0x09_StartScript($01, pAIScripting0x0B_L081)                                   ;B3ED39
    %AICMD0x09_StartScript($02, pAIScripting0x0B_L086)                                   ;B3ED3D
    %AICMD0x09_StartScript($03, pAIScripting0x0B_L101)                                   ;B3ED41
    %AICMD0x09_StartScript($04, pAIScripting0x0B_L091)                                   ;B3ED45
    %AICMD0x09_StartScript($05, pAIScripting0x0B_L096)                                   ;B3ED49
    %AICMD0x09_StartScript($06, pAIScripting0x0B_L104)                                   ;B3ED4D
    %AICMD0x10_End()                                           ;B3ED51
pAIScripting0x0B_L081:
    %AICMD0x1A($00A8, $01B8, aAIScriptingData_L024, $00)                     ;B3ED52
pAIScripting0x0B_L082:
    %AICMD0x1F(pAIScripting0x0B_L084)                                        ;B3ED5A
    %AICMD0x12_Jump(pAIScripting0x0B_L082)                                   ;B3ED5D
pAIScripting0x0B_L083:
    %AICMD0x1F(pAIScripting0x0B_L085)                                        ;B3ED60
    %AICMD0x12_Jump(pAIScripting0x0B_L083)                                   ;B3ED63
pAIScripting0x0B_L084:
    %AICMD0x1C_ShowDialog($011B, $00)                          ;B3ED66
    %AICMD0x32_SetValue16($8000D4, $0015)                                 ;B3ED6A
    %AICMD0x12_Jump(pAIScripting0x0B_L083)                                   ;B3ED70
pAIScripting0x0B_L085:
    %AICMD0x1C_ShowDialog($011C, $00)                          ;B3ED73
    %AICMD0x12_Jump(pAIScripting0x0B_L083)                                   ;B3ED77
pAIScripting0x0B_L086:
    %AICMD0x1A($0028, $0198, aAIScriptingData_L041, $00)                     ;B3ED7A
pAIScripting0x0B_L087:
    %AICMD0x1F(pAIScripting0x0B_L089)                                        ;B3ED82
    %AICMD0x12_Jump(pAIScripting0x0B_L087)                                   ;B3ED85
pAIScripting0x0B_L088:
    %AICMD0x1F(pAIScripting0x0B_L090)                                        ;B3ED88
    %AICMD0x12_Jump(pAIScripting0x0B_L088)                                   ;B3ED8B
pAIScripting0x0B_L089:
    %AICMD0x1C_ShowDialog($011D, $00)                          ;B3ED8E
    %AICMD0x12_Jump(pAIScripting0x0B_L088)                                   ;B3ED92
pAIScripting0x0B_L090:
    %AICMD0x1C_ShowDialog($011E, $00)                          ;B3ED95
    %AICMD0x12_Jump(pAIScripting0x0B_L088)                                   ;B3ED99
pAIScripting0x0B_L091:
    %AICMD0x1A($0060, $0170, aAIScriptingData_L035, $00)                     ;B3ED9C
pAIScripting0x0B_L092:
    %AICMD0x1F(pAIScripting0x0B_L094)                                        ;B3EDA4
    %AICMD0x12_Jump(pAIScripting0x0B_L092)                                   ;B3EDA7
pAIScripting0x0B_L093:
    %AICMD0x1F(pAIScripting0x0B_L095)                                        ;B3EDAA
    %AICMD0x12_Jump(pAIScripting0x0B_L093)                                   ;B3EDAD
pAIScripting0x0B_L094:
    %AICMD0x1C_ShowDialog($0120, $00)                          ;B3EDB0
    %AICMD0x1B($0270, $00)                                     ;B3EDB4
    %AICMD0x12_Jump(pAIScripting0x0B_L093)                                   ;B3EDB8
pAIScripting0x0B_L095:
    %AICMD0x1C_ShowDialog($0121, $00)                          ;B3EDBB
    %AICMD0x1B($0270, $00)                                     ;B3EDBF
    %AICMD0x12_Jump(pAIScripting0x0B_L093)                                   ;B3EDC3
pAIScripting0x0B_L096:
    %AICMD0x1A($00B0, $0170, aAIScriptingData_L046, $00)                     ;B3EDC6
pAIScripting0x0B_L097:
    %AICMD0x1F(pAIScripting0x0B_L099)                                        ;B3EDCE
    %AICMD0x12_Jump(pAIScripting0x0B_L097)                                   ;B3EDD1
pAIScripting0x0B_L098:
    %AICMD0x1F(pAIScripting0x0B_L100)                                        ;B3EDD4
    %AICMD0x12_Jump(pAIScripting0x0B_L098)                                   ;B3EDD7
pAIScripting0x0B_L099:
    %AICMD0x1C_ShowDialog($0122, $00)                          ;B3EDDA
    %AICMD0x1B($0296, $00)                                     ;B3EDDE
    %AICMD0x12_Jump(pAIScripting0x0B_L098)                                   ;B3EDE2
pAIScripting0x0B_L100:
    %AICMD0x1C_ShowDialog($0123, $00)                          ;B3EDE5
    %AICMD0x1B($0296, $00)                                     ;B3EDE9
    %AICMD0x12_Jump(pAIScripting0x0B_L098)                                   ;B3EDED
pAIScripting0x0B_L101:
    %AICMD0x1A($0088, $0170, aAIScriptingData_L050, $00)                     ;B3EDF0
pAIScripting0x0B_L102:
    %AICMD0x1F(pAIScripting0x0B_L103)                                        ;B3EDF8
    %AICMD0x12_Jump(pAIScripting0x0B_L102)                                   ;B3EDFB
pAIScripting0x0B_L103:
    %AICMD0x1C_ShowDialog($011F, $00)                          ;B3EDFE
    %AICMD0x12_Jump(pAIScripting0x0B_L102)                                   ;B3EE02
pAIScripting0x0B_L104:
    %AICMD0x1A($00D8, $01B8, aAIScriptingData_L037, $00)                     ;B3EE05
pAIScripting0x0B_L105:
    %AICMD0x1F(pAIScripting0x0B_L106)                                        ;B3EE0D
    %AICMD0x12_Jump(pAIScripting0x0B_L105)                                   ;B3EE10
pAIScripting0x0B_L106:
    %AICMD0x1C_ShowDialog($0072, $00)                          ;B3EE13
    %AICMD0x12_Jump(pAIScripting0x0B_L105)                                   ;B3EE17


DATA8_B3EE1A:
 
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B3EE1A
    %AICMD0x08_EnableAIControl()                               ;B3EE1C
    %AICMD0x09_StartScript($01, pAIScripting0x0B_L108)                                   ;B3EE1D
    %AICMD0x09_StartScript($02, pAIScripting0x0B_L114)                                   ;B3EE21
    %AICMD0x09_StartScript($03, pAIScripting0x0B_L118)                                   ;B3EE25
    %AICMD0x09_StartScript($04, pAIScripting0x0B_L122)                                   ;B3EE29
    %AICMD0x09_StartScript($05, pAIScripting0x0B_L126)                                   ;B3EE2D
    %AICMD0x38_WaitForFadeIn()                                               ;B3EE31
    %AICMD0x11_EnableUserControl()                             ;B3EE32
pAIScripting0x0B_L107:
    %AICMD0x13_Wait(1)                                         ;B3EE33
    %AICMD0x12_Jump(pAIScripting0x0B_L107)                                   ;B3EE36
pAIScripting0x0B_L108:
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 17, 18, pAIScripting0x0B_L113) ;B3EE39
    %AICMD0x1A($0258, $0178, aAIScriptingData_L032, $00)                     ;B3EE41
pAIScripting0x0B_L109:
    %AICMD0x1F(pAIScripting0x0B_L111)                                        ;B3EE49
    %AICMD0x12_Jump(pAIScripting0x0B_L109)                                   ;B3EE4C
pAIScripting0x0B_L110:
    %AICMD0x1F(pAIScripting0x0B_L112)                                        ;B3EE4F
    %AICMD0x12_Jump(pAIScripting0x0B_L110)                                   ;B3EE52
pAIScripting0x0B_L111:
    %AICMD0x1C_ShowDialog($012B, $00)                          ;B3EE55
    %AICMD0x12_Jump(pAIScripting0x0B_L110)                                   ;B3EE59
pAIScripting0x0B_L112:
    %AICMD0x1C_ShowDialog($012C, $00)                          ;B3EE5C
    %AICMD0x12_Jump(pAIScripting0x0B_L110)                                   ;B3EE60
pAIScripting0x0B_L113:
    %AICMD0x10_End()                                           ;B3EE63
pAIScripting0x0B_L114:
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 17, 18, pAIScripting0x0B_L117) ;B3EE64
    %AICMD0x1A($01F8, $0258, aAIScriptingData_L028, $00)                     ;B3EE6C
pAIScripting0x0B_L115:
    %AICMD0x1F(pAIScripting0x0B_L116)                                        ;B3EE74
    %AICMD0x12_Jump(pAIScripting0x0B_L115)                                   ;B3EE77
pAIScripting0x0B_L116:
    %AICMD0x1C_ShowDialog($0127, $00)                          ;B3EE7A
    %AICMD0x12_Jump(pAIScripting0x0B_L115)                                   ;B3EE7E
pAIScripting0x0B_L117:
    %AICMD0x10_End()                                           ;B3EE81
pAIScripting0x0B_L118:
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 17, 18, pAIScripting0x0B_L121) ;B3EE82
    %AICMD0x1A($0298, $01F8, aAIScriptingData_L027, $00)                     ;B3EE8A
    %AICMD0x22($18, $18, $01, aAIScriptingData_L028, $0C)                    ;B3EE92
pAIScripting0x0B_L119:
    %AICMD0x1F(pAIScripting0x0B_L120)                                        ;B3EE99
    %AICMD0x12_Jump(pAIScripting0x0B_L119)                                   ;B3EE9C
pAIScripting0x0B_L120:
    %AICMD0x1C_ShowDialog($0128, $00)                          ;B3EE9F
    %AICMD0x12_Jump(pAIScripting0x0B_L119)                                   ;B3EEA3
pAIScripting0x0B_L121:
    %AICMD0x10_End()                                           ;B3EEA6
pAIScripting0x0B_L122:
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 17, 18, pAIScripting0x0B_L125) ;B3EEA7
    %AICMD0x1A($0178, $0208, aAIScriptingData_L027, $00)                     ;B3EEAF
    %AICMD0x22($18, $18, $01, aAIScriptingData_L028, $0C)                    ;B3EEB7
pAIScripting0x0B_L123:
    %AICMD0x1F(pAIScripting0x0B_L124)                                        ;B3EEBE
    %AICMD0x12_Jump(pAIScripting0x0B_L123)                                   ;B3EEC1
pAIScripting0x0B_L124:
    %AICMD0x1C_ShowDialog($0129, $00)                          ;B3EEC4
    %AICMD0x12_Jump(pAIScripting0x0B_L123)                                   ;B3EEC8
pAIScripting0x0B_L125:
    %AICMD0x10_End()                                           ;B3EECB
pAIScripting0x0B_L126:
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 17, 18, pAIScripting0x0B_L129) ;B3EECC
    %AICMD0x1A($0120, $0200, aAIScriptingData_L040, $00)                     ;B3EED4
pAIScripting0x0B_L127:
    %AICMD0x1F(pAIScripting0x0B_L128)                                        ;B3EEDC
    %AICMD0x12_Jump(pAIScripting0x0B_L127)                                   ;B3EEDF
pAIScripting0x0B_L128:
    %AICMD0x1C_ShowDialog($0115, $00)                          ;B3EEE2
    %AICMD0x12_Jump(pAIScripting0x0B_L127)                                   ;B3EEE6
pAIScripting0x0B_L129:
    %AICMD0x10_End()                                           ;B3EEE9


AI_HouseExtensionCampain:
 
    %AICMD0x09_StartScript($01, AI_HouseExtensionCampain_L002)                                   ;B3EEEA
    %AICMD0x38_WaitForFadeIn()                                               ;B3EEEE
AI_HouseExtensionCampain_L001:
    %AICMD0x13_Wait(1)                                         ;B3EEEF
    %AICMD0x12_Jump(AI_HouseExtensionCampain_L001)                                   ;B3EEF2
AI_HouseExtensionCampain_L002:
    %AICMD0x1A($0098, $0088, aAIScriptingData_L027, $02)                     ;B3EEF5
AI_HouseExtensionCampain_L003:
    %AICMD0x1F(AI_HouseExtensionCampain_L004)                                        ;B3EEFD
    %AICMD0x12_Jump(AI_HouseExtensionCampain_L003)                                   ;B3EF00
AI_HouseExtensionCampain_L004:
    %AICMD0x1C_ShowDialog($012A, $00)                          ;B3EF03
    %AICMD0x12_Jump(AI_HouseExtensionCampain_L003)                                   ;B3EF07


DATA8_B3EF0A:
 
    %AICMD0x02_FreezeTime()                                    ;B3EF0A
    %AICMD0x05_SetTransferPosition(136, 296)                   ;B3EF0B
    %AICMD0x08_EnableAIControl()                               ;B3EF10
    %AICMD0x09_StartScript($01, AI_HouseExtensionCampain_L005)                                   ;B3EF11
    %AICMD0x38_WaitForFadeIn()                                               ;B3EF15
    %AICMD0x0B_SetScriptFlag($00)                                            ;B3EF16
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B3EF18
    %AICMD0x3C()                                               ;B3EF1A
    %AICMD0x10_End()                                           ;B3EF1B
AI_HouseExtensionCampain_L005:
    %AICMD0x1A($0010, $0088, aAIScriptingData_L128, $02)                     ;B3EF1C
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B3EF24
    %AICMD0x0D($01, $00, $FF, $01)                             ;B3EF26
    %AICMD0x0B_SetScriptFlag($01)                                            ;B3EF2B
    %AICMD0x10_End()                                           ;B3EF2D


DATA8_B3EF2E:
    %AICMD0x09_StartScript($01, AI_HouseExtensionCampain_L006)                                   ;B3EF2E
    %AICMD0x10_End()                                           ;B3EF32
AI_HouseExtensionCampain_L006:
    %AICMD0x1A($0068, $0188, aAIScriptingData_L011, $00)                     ;B3EF33
AI_HouseExtensionCampain_L007:
    %AICMD0x1F(AI_HouseExtensionCampain_L009)                                        ;B3EF3B
    %AICMD0x12_Jump(AI_HouseExtensionCampain_L007)                                   ;B3EF3E
AI_HouseExtensionCampain_L008:
    %AICMD0x1F(AI_HouseExtensionCampain_L010)                                        ;B3EF41
    %AICMD0x12_Jump(AI_HouseExtensionCampain_L008)                                   ;B3EF44
AI_HouseExtensionCampain_L009:
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown1, $05)     ;B3EF47
    %AICMD0x1C_ShowDialog($00F9, $00)                          ;B3EF4C
    %AICMD0x12_Jump(AI_HouseExtensionCampain_L008)                                   ;B3EF50
AI_HouseExtensionCampain_L010:
    %AICMD0x1C_ShowDialog($00FA, $00)                          ;B3EF53
    %AICMD0x12_Jump(AI_HouseExtensionCampain_L008)                                   ;B3EF57
