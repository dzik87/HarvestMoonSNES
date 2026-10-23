 
    ORG $B48000
 
pAIScripting0x0F_StarNightFestival:
    dw DATA8_B48020                                            ;B48000|        |B48020;
    dw DATA8_B48075                                            ;B48002|        |B48075;
    dw DATA8_B4820E                                            ;B48004|        |B4820E;
    dw DATA8_B48400                                            ;B48006|        |B48400;
    dw DATA8_B485C6                                            ;B48008|        |B485C6;
    dw DATA8_B486E8                                            ;B4800A|        |B486E8;
    dw pAIScripting0x10_WoodsPondEvent                         ;B4800C|        |B487B8;
    dw pAIScripting0x10_WoodsPondEvent                         ;B4800E|        |B487B8;
    dw pAIScripting0x10_WoodsPondEvent                         ;B48010|        |B487B8;
    dw pAIScripting0x10_WoodsPondEvent                         ;B48012|        |B487B8;
    dw pAIScripting0x10_WoodsPondEvent                         ;B48014|        |B487B8;
    dw pAIScripting0x10_WoodsPondEvent                         ;B48016|        |B487B8;
    dw pAIScripting0x10_WoodsPondEvent                         ;B48018|        |B487B8;
    dw pAIScripting0x10_WoodsPondEvent                         ;B4801A|        |B487B8;
    dw pAIScripting0x10_WoodsPondEvent                         ;B4801C|        |B487B8;
    dw pAIScripting0x10_WoodsPondEvent                         ;B4801E|        |B487B8;
 
DATA8_B48020:
 
    %AICMD0x4F_DisableToolUse()                                               ;B48020
    %AICMD0x50()                                               ;B48021
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $09)       ;B48022
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $00)       ;B48027
    %AICMD0x08_EnableAIControl()                               ;B4802C
    %AICMD0x38_WaitForFadeIn()                                               ;B4802D
    %AICMD0x01_UnfreezeTime()                                  ;B4802E
    %AICMD0x24_NextHourPalette($74)                            ;B4802F
    %AICMD0x13_Wait(180)                                       ;B48031
    %AICMD0x1D_ShowDialog($02B6, $00)                          ;B48034
    %AICMD0x20_JumpIfChoice(0, pAIScripting0x0F_StarNightFestival_L001)                        ;B48038
    %AICMD0x20_JumpIfChoice(1, pAIScripting0x0F_StarNightFestival_L002)                        ;B4803C
    %AICMD0x20_JumpIfChoice(2, pAIScripting0x0F_StarNightFestival_L003)                        ;B48040
    %AICMD0x20_JumpIfChoice(3, pAIScripting0x0F_StarNightFestival_L004)                        ;B48044
    %AICMD0x20_JumpIfChoice(4, pAIScripting0x0F_StarNightFestival_L005)                        ;B48048
    %AICMD0x10_End()                                           ;B4804C
pAIScripting0x0F_StarNightFestival_L001:
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown1, $00)     ;B4804D
    %AICMD0x3D_TeleportToArea(!AREA_NY_PUBLICSQUARE)           ;B48052
    %AICMD0x10_End()                                           ;B48054
pAIScripting0x0F_StarNightFestival_L002:
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown1, $01)     ;B48055
    %AICMD0x3D_TeleportToArea(!AREA_CHURCH)                    ;B4805A
    %AICMD0x10_End()                                           ;B4805C
pAIScripting0x0F_StarNightFestival_L003:
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown1, $02)     ;B4805D
    %AICMD0x3D_TeleportToArea(!AREA_BAR)                       ;B48062
    %AICMD0x10_End()                                           ;B48064
pAIScripting0x0F_StarNightFestival_L004:
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown1, $03)     ;B48065
    %AICMD0x3D_TeleportToArea(!AREA_NY_MOUNTAINTOP)            ;B4806A
    %AICMD0x10_End()                                           ;B4806C
pAIScripting0x0F_StarNightFestival_L005:
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown1, $04)     ;B4806D
    %AICMD0x3D_TeleportToArea(!AREA_NY_SPA)                    ;B48072
    %AICMD0x10_End()                                           ;B48074


DATA8_B48075:
 
    %AICMD0x4F_DisableToolUse()                                               ;B48075
    %AICMD0x50()                                               ;B48076
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $09)       ;B48077
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily3, $0F)       ;B4807C
    %AICMD0x00_SetMusic($0E, $B4)                              ;B48081
    %AICMD0x03_SetHour($11)                                    ;B48084
    %AICMD0x05_SetTransferPosition(264, 312)                   ;B48086
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B4808B
    %AICMD0x09_StartScript($01, pAIScripting0x0F_StarNightFestival_L006)                                   ;B4808D
    %AICMD0x09_StartScript($02, pAIScripting0x0F_StarNightFestival_L009)                                   ;B48091
    %AICMD0x09_StartScript($03, pAIScripting0x0F_StarNightFestival_L012)                                   ;B48095
    %AICMD0x09_StartScript($05, pAIScripting0x0F_StarNightFestival_L019)                                   ;B48099
    %AICMD0x09_StartScript($06, pAIScripting0x0F_StarNightFestival_L027)                                   ;B4809D
    %AICMD0x38_WaitForFadeIn()                                               ;B480A1
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B480A2
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B480A4
    %AICMD0x0C_WaitForScriptFlag($02)                                            ;B480A6
    %AICMD0x0C_WaitForScriptFlag($03)                                            ;B480A8
    %AICMD0x0C_WaitForScriptFlag($04)                                            ;B480AA
    %AICMD0x13_Wait(60)                                        ;B480AC
    %AICMD0x28_ClearBit(strcFlags.daily3, $0F)                          ;B480AF
    %AICMD0x41_AddValue16(nLove_Ellen, 30)                     ;B480B4
    %AICMD0x3C()                                               ;B480BA
    %AICMD0x10_End()                                           ;B480BB
pAIScripting0x0F_StarNightFestival_L006:
    %AICMD0x1A($0108, $0098, aAIScriptingData_L044, $00)                     ;B480BC
pAIScripting0x0F_StarNightFestival_L007:
    %AICMD0x1F(pAIScripting0x0F_StarNightFestival_L008)                                        ;B480C4
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L007)                                   ;B480C7
pAIScripting0x0F_StarNightFestival_L008:
    %AICMD0x1C_ShowDialog($02B7, $00)                          ;B480CA
    %AICMD0x0B_SetScriptFlag($00)                                            ;B480CE
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L007)                                   ;B480D0
pAIScripting0x0F_StarNightFestival_L009:
    %AICMD0x1A($00B8, $00A8, aAIScriptingData_L061, $01)                     ;B480D3
pAIScripting0x0F_StarNightFestival_L010:
    %AICMD0x1F(pAIScripting0x0F_StarNightFestival_L011)                                        ;B480DB
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L010)                                   ;B480DE
pAIScripting0x0F_StarNightFestival_L011:
    %AICMD0x1C_ShowDialog($02B8, $00)                          ;B480E1
    %AICMD0x0B_SetScriptFlag($01)                                            ;B480E5
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L010)                                   ;B480E7
pAIScripting0x0F_StarNightFestival_L012:
    %AICMD0x1A($0168, $00D8, aAIScriptingData_L043, $03)                     ;B480EA
pAIScripting0x0F_StarNightFestival_L013:
    %AICMD0x1F(pAIScripting0x0F_StarNightFestival_L015)                                        ;B480F2
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L013)                                   ;B480F5
pAIScripting0x0F_StarNightFestival_L014:
    %AICMD0x1F(pAIScripting0x0F_StarNightFestival_L018)                                        ;B480F8
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L014)                                   ;B480FB
pAIScripting0x0F_StarNightFestival_L015:
    %AICMD0x1D_ShowDialog($02BA, $00)                          ;B480FE
    %AICMD0x20_JumpIfChoice(0, pAIScripting0x0F_StarNightFestival_L016)                        ;B48102
    %AICMD0x20_JumpIfChoice(1, pAIScripting0x0F_StarNightFestival_L017)                        ;B48106
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L013)                                   ;B4810A
pAIScripting0x0F_StarNightFestival_L016:
    %AICMD0x1C_ShowDialog($02BB, $00)                          ;B4810D
    %AICMD0x0B_SetScriptFlag($02)                                            ;B48111
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L014)                                   ;B48113
pAIScripting0x0F_StarNightFestival_L017:
    %AICMD0x1C_ShowDialog($02BC, $00)                          ;B48116
    %AICMD0x0B_SetScriptFlag($02)                                            ;B4811A
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L014)                                   ;B4811C
pAIScripting0x0F_StarNightFestival_L018:
    %AICMD0x1C_ShowDialog($02DC, $00)                          ;B4811F
    %AICMD0x0B_SetScriptFlag($02)                                            ;B48123
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L014)                                   ;B48125
pAIScripting0x0F_StarNightFestival_L019:
    %AICMD0x1A($0148, $0128, aAIScriptingData_L048, $03)                     ;B48128
    %AICMD0x22($20, $18, $01, aAIScriptingData_L049, $0C)                    ;B48130
pAIScripting0x0F_StarNightFestival_L020:
    %AICMD0x1F(pAIScripting0x0F_StarNightFestival_L021)                                        ;B48137
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L020)                                   ;B4813A
pAIScripting0x0F_StarNightFestival_L021:
    %AICMD0x1C_ShowDialog($02B9, $00)                          ;B4813D
    %AICMD0x0B_SetScriptFlag($03)                                            ;B48141
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L020)                                   ;B48143
pAIScripting0x0F_StarNightFestival_L022:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $00, pAIScripting0x0F_StarNightFestival_L023)   ;B48146
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $01, pAIScripting0x0F_StarNightFestival_L024)   ;B4814D
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, pAIScripting0x0F_StarNightFestival_L025)   ;B48154
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $04, pAIScripting0x0F_StarNightFestival_L026)   ;B4815B
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L028)                                   ;B48162
pAIScripting0x0F_StarNightFestival_L023:
    %AICMD0x41_AddValue16(nLove_Maria, -30)                    ;B48165
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L028)                                   ;B4816B
pAIScripting0x0F_StarNightFestival_L024:
    %AICMD0x41_AddValue16(nLove_Ann, -30)                      ;B4816E
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L028)                                   ;B48174
pAIScripting0x0F_StarNightFestival_L025:
    %AICMD0x41_AddValue16(nLove_Nina, -30)                     ;B48177
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L028)                                   ;B4817D
pAIScripting0x0F_StarNightFestival_L026:
    %AICMD0x41_AddValue16(nLove_Eve, -30)                      ;B48180
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L028)                                   ;B48186
pAIScripting0x0F_StarNightFestival_L027:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $03, pAIScripting0x0F_StarNightFestival_L029)   ;B48189
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L022)                                   ;B48190
pAIScripting0x0F_StarNightFestival_L028:
    %AICMD0x1A($00F8, $0108, aAIScriptingData_L021, $00)                     ;B48193
    %AICMD0x13_Wait(1)                                         ;B4819B
    %AICMD0x1B($0242, $00)                                     ;B4819E
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L030)                                   ;B481A2
pAIScripting0x0F_StarNightFestival_L029:
    %AICMD0x1A($0128, $0098, aAIScriptingData_L071, $00)                     ;B481A5
    %AICMD0x13_Wait(1)                                         ;B481AD
    %AICMD0x1B($02E9, $00)                                     ;B481B0
pAIScripting0x0F_StarNightFestival_L030:
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B481B4
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B481B6
    %AICMD0x0C_WaitForScriptFlag($02)                                            ;B481B8
    %AICMD0x0C_WaitForScriptFlag($03)                                            ;B481BA
pAIScripting0x0F_StarNightFestival_L031:
    %AICMD0x1F(pAIScripting0x0F_StarNightFestival_L032)                                        ;B481BC
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L031)                                   ;B481BF
pAIScripting0x0F_StarNightFestival_L032:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $03, pAIScripting0x0F_StarNightFestival_L036)   ;B481C2
    %AICMD0x45_JumpIfBetween16(nLove_Ellen, 0, 200, pAIScripting0x0F_StarNightFestival_L033)   ;B481C9
    %AICMD0x45_JumpIfBetween16(nLove_Ellen, 201, 300, pAIScripting0x0F_StarNightFestival_L034) ;B481D3
    %AICMD0x45_JumpIfBetween16(nLove_Ellen, 301, 999, pAIScripting0x0F_StarNightFestival_L035) ;B481DD
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L031)                                   ;B481E7
pAIScripting0x0F_StarNightFestival_L033:
    %AICMD0x1C_ShowDialog($02BD, $00)                          ;B481EA
    %AICMD0x0B_SetScriptFlag($04)                                            ;B481EE
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L031)                                   ;B481F0
pAIScripting0x0F_StarNightFestival_L034:
    %AICMD0x1C_ShowDialog($02BE, $00)                          ;B481F3
    %AICMD0x0B_SetScriptFlag($04)                                            ;B481F7
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L031)                                   ;B481F9
pAIScripting0x0F_StarNightFestival_L035:
    %AICMD0x1C_ShowDialog($0433, $00)                          ;B481FC
    %AICMD0x0B_SetScriptFlag($04)                                            ;B48200
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L031)                                   ;B48202
pAIScripting0x0F_StarNightFestival_L036:
    %AICMD0x1C_ShowDialog($0434, $00)                          ;B48205
    %AICMD0x0B_SetScriptFlag($04)                                            ;B48209
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L031)                                   ;B4820B


DATA8_B4820E:
 
    %AICMD0x4F_DisableToolUse()                                               ;B4820E
    %AICMD0x50()                                               ;B4820F
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $09)       ;B48210
    %AICMD0x00_SetMusic($09, $B4)                              ;B48215
    %AICMD0x03_SetHour($07)                                    ;B48218
    %AICMD0x05_SetTransferPosition(128, 440)                   ;B4821A
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B4821F
    %AICMD0x09_StartScript($01, pAIScripting0x0F_StarNightFestival_L037)                                   ;B48221
    %AICMD0x09_StartScript($02, pAIScripting0x0F_StarNightFestival_L040)                                   ;B48225
    %AICMD0x09_StartScript($03, pAIScripting0x0F_StarNightFestival_L043)                                   ;B48229
    %AICMD0x09_StartScript($04, pAIScripting0x0F_StarNightFestival_L046)                                   ;B4822D
    %AICMD0x09_StartScript($05, pAIScripting0x0F_StarNightFestival_L049)                                   ;B48231
    %AICMD0x09_StartScript($06, pAIScripting0x0F_StarNightFestival_L052)                                   ;B48235
    %AICMD0x09_StartScript($07, pAIScripting0x0F_StarNightFestival_L060)                                   ;B48239
    %AICMD0x38_WaitForFadeIn()                                               ;B4823D
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B4823E
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B48240
    %AICMD0x0C_WaitForScriptFlag($02)                                            ;B48242
    %AICMD0x0C_WaitForScriptFlag($03)                                            ;B48244
    %AICMD0x0C_WaitForScriptFlag($04)                                            ;B48246
    %AICMD0x0C_WaitForScriptFlag($05)                                            ;B48248
    %AICMD0x0B_SetScriptFlag($07)                                            ;B4824A
    %AICMD0x0C_WaitForScriptFlag($06)                                            ;B4824C
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 16)                 ;B4824E
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B48252
    %AICMD0x0B_SetScriptFlag($08)                                            ;B48254
    %AICMD0x13_Wait(180)                                       ;B48256
    %AICMD0x41_AddValue16(nLove_Maria, 30)                     ;B48259
    %AICMD0x3C()                                               ;B4825F
    %AICMD0x10_End()                                           ;B48260
pAIScripting0x0F_StarNightFestival_L037:
    %AICMD0x1A($0080, $0090, aAIScriptingData_L051, $00)                     ;B48261
pAIScripting0x0F_StarNightFestival_L038:
    %AICMD0x1F(pAIScripting0x0F_StarNightFestival_L039)                                        ;B48269
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L038)                                   ;B4826C
pAIScripting0x0F_StarNightFestival_L039:
    %AICMD0x1C_ShowDialog($02BF, $00)                          ;B4826F
    %AICMD0x0B_SetScriptFlag($00)                                            ;B48273
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L038)                                   ;B48275
pAIScripting0x0F_StarNightFestival_L040:
    %AICMD0x1A($0038, $0118, aAIScriptingData_L067, $01)                     ;B48278
pAIScripting0x0F_StarNightFestival_L041:
    %AICMD0x1F(pAIScripting0x0F_StarNightFestival_L042)                                        ;B48280
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L041)                                   ;B48283
pAIScripting0x0F_StarNightFestival_L042:
    %AICMD0x1C_ShowDialog($02C1, $00)                          ;B48286
    %AICMD0x1B($02D4, $00)                                     ;B4828A
    %AICMD0x0B_SetScriptFlag($01)                                            ;B4828E
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L041)                                   ;B48290
pAIScripting0x0F_StarNightFestival_L043:
    %AICMD0x1A($0050, $0118, aAIScriptingData_L055, $01)                     ;B48293
pAIScripting0x0F_StarNightFestival_L044:
    %AICMD0x1F(pAIScripting0x0F_StarNightFestival_L045)                                        ;B4829B
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L044)                                   ;B4829E
pAIScripting0x0F_StarNightFestival_L045:
    %AICMD0x1B($02B3, $00)                                     ;B482A1
    %AICMD0x1C_ShowDialog($02C2, $00)                          ;B482A5
    %AICMD0x0B_SetScriptFlag($02)                                            ;B482A9
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L044)                                   ;B482AB
pAIScripting0x0F_StarNightFestival_L046:
    %AICMD0x1A($0080, $01C8, aAIScriptingData_L035, $01)                     ;B482AE
pAIScripting0x0F_StarNightFestival_L047:
    %AICMD0x1F(pAIScripting0x0F_StarNightFestival_L048)                                        ;B482B6
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L047)                                   ;B482B9
pAIScripting0x0F_StarNightFestival_L048:
    %AICMD0x1C_ShowDialog($037A, $00)                          ;B482BC
    %AICMD0x0B_SetScriptFlag($03)                                            ;B482C0
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L047)                                   ;B482C2
pAIScripting0x0F_StarNightFestival_L049:
    %AICMD0x1A($00B8, $0158, aAIScriptingData_L037, $01)                     ;B482C5
pAIScripting0x0F_StarNightFestival_L050:
    %AICMD0x1F(pAIScripting0x0F_StarNightFestival_L051)                                        ;B482CD
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L050)                                   ;B482D0
pAIScripting0x0F_StarNightFestival_L051:
    %AICMD0x1B($0278, $00)                                     ;B482D3
    %AICMD0x1C_ShowDialog($035F, $00)                          ;B482D7
    %AICMD0x0B_SetScriptFlag($04)                                            ;B482DB
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L050)                                   ;B482DD
pAIScripting0x0F_StarNightFestival_L052:
    %AICMD0x1A($00C8, $0118, aAIScriptingData_L033, $01)                     ;B482E0
pAIScripting0x0F_StarNightFestival_L053:
    %AICMD0x1F(pAIScripting0x0F_StarNightFestival_L054)                                        ;B482E8
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L053)                                   ;B482EB
pAIScripting0x0F_StarNightFestival_L054:
    %AICMD0x1C_ShowDialog($02C0, $00)                          ;B482EE
    %AICMD0x1B($026B, $00)                                     ;B482F2
    %AICMD0x0B_SetScriptFlag($05)                                            ;B482F6
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L053)                                   ;B482F8
pAIScripting0x0F_StarNightFestival_L055:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $01, pAIScripting0x0F_StarNightFestival_L056)   ;B482FB
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, pAIScripting0x0F_StarNightFestival_L057)   ;B48302
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $03, pAIScripting0x0F_StarNightFestival_L058)   ;B48309
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $04, pAIScripting0x0F_StarNightFestival_L059)   ;B48310
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L061)                                   ;B48317
pAIScripting0x0F_StarNightFestival_L056:
    %AICMD0x41_AddValue16(nLove_Ann, -30)                      ;B4831A
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L061)                                   ;B48320
pAIScripting0x0F_StarNightFestival_L057:
    %AICMD0x41_AddValue16(nLove_Nina, -30)                     ;B48323
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L061)                                   ;B48329
pAIScripting0x0F_StarNightFestival_L058:
    %AICMD0x41_AddValue16(nLove_Ellen, -30)                    ;B4832C
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L061)                                   ;B48332
pAIScripting0x0F_StarNightFestival_L059:
    %AICMD0x41_AddValue16(nLove_Eve, -30)                      ;B48335
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L061)                                   ;B4833B
pAIScripting0x0F_StarNightFestival_L060:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $00, pAIScripting0x0F_StarNightFestival_L062)   ;B4833E
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L055)                                   ;B48345
pAIScripting0x0F_StarNightFestival_L061:
    %AICMD0x1A($00C1, $0088, aAIScriptingData_L013, $01)                     ;B48348
    %AICMD0x0C_WaitForScriptFlag($07)                                            ;B48350
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L063)                                   ;B48352
pAIScripting0x0F_StarNightFestival_L062:
    %AICMD0x1A($00C1, $0088, aAIScriptingData_L013, $01)                     ;B48355
pAIScripting0x0F_StarNightFestival_L063:
    %AICMD0x1F(pAIScripting0x0F_StarNightFestival_L064)                                        ;B4835D
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L063)                                   ;B48360
pAIScripting0x0F_StarNightFestival_L064:
    %AICMD0x08_EnableAIControl()                               ;B48363
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $00, pAIScripting0x0F_StarNightFestival_L068)   ;B48364
    %AICMD0x45_JumpIfBetween16(nLove_Maria, 0, 200, pAIScripting0x0F_StarNightFestival_L065)   ;B4836B
    %AICMD0x45_JumpIfBetween16(nLove_Maria, 201, 300, pAIScripting0x0F_StarNightFestival_L066) ;B48375
    %AICMD0x45_JumpIfBetween16(nLove_Maria, 301, 999, pAIScripting0x0F_StarNightFestival_L067) ;B4837F
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L063)                                   ;B48389
pAIScripting0x0F_StarNightFestival_L065:
    %AICMD0x0B_SetScriptFlag($06)                                            ;B4838C
    %AICMD0x0C_WaitForScriptFlag($08)                                            ;B4838E
    %AICMD0x13_Wait(30)                                        ;B48390
    %AICMD0x1B($0223, $01)                                     ;B48393
    %AICMD0x0D($01, $00, $10, $01)                             ;B48397
    %AICMD0x13_Wait(60)                                        ;B4839C
    %AICMD0x1C_ShowDialog($02C3, $00)                          ;B4839F
    %AICMD0x13_Wait(180)                                       ;B483A3
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L063)                                   ;B483A6
pAIScripting0x0F_StarNightFestival_L066:
    %AICMD0x0B_SetScriptFlag($06)                                            ;B483A9
    %AICMD0x0C_WaitForScriptFlag($08)                                            ;B483AB
    %AICMD0x13_Wait(30)                                        ;B483AD
    %AICMD0x1B($0223, $01)                                     ;B483B0
    %AICMD0x0D($01, $00, $10, $01)                             ;B483B4
    %AICMD0x13_Wait(60)                                        ;B483B9
    %AICMD0x1C_ShowDialog($02C4, $00)                          ;B483BC
    %AICMD0x13_Wait(180)                                       ;B483C0
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L063)                                   ;B483C3
pAIScripting0x0F_StarNightFestival_L067:
    %AICMD0x0B_SetScriptFlag($06)                                            ;B483C6
    %AICMD0x0C_WaitForScriptFlag($08)                                            ;B483C8
    %AICMD0x13_Wait(30)                                        ;B483CA
    %AICMD0x1B($0223, $01)                                     ;B483CD
    %AICMD0x0D($01, $00, $10, $01)                             ;B483D1
    %AICMD0x13_Wait(60)                                        ;B483D6
    %AICMD0x1C_ShowDialog($0435, $00)                          ;B483D9
    %AICMD0x13_Wait(180)                                       ;B483DD
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L063)                                   ;B483E0
pAIScripting0x0F_StarNightFestival_L068:
    %AICMD0x0B_SetScriptFlag($06)                                            ;B483E3
    %AICMD0x0C_WaitForScriptFlag($08)                                            ;B483E5
    %AICMD0x13_Wait(30)                                        ;B483E7
    %AICMD0x1B($02E7, $01)                                     ;B483EA
    %AICMD0x0D($01, $00, $10, $01)                             ;B483EE
    %AICMD0x13_Wait(60)                                        ;B483F3
    %AICMD0x1C_ShowDialog($0436, $00)                          ;B483F6
    %AICMD0x13_Wait(180)                                       ;B483FA
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L063)                                   ;B483FD


DATA8_B48400:
 
    %AICMD0x4F_DisableToolUse()                                               ;B48400
    %AICMD0x50()                                               ;B48401
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $09)       ;B48402
    %AICMD0x00_SetMusic($07, $B4)                              ;B48407
    %AICMD0x03_SetHour($12)                                    ;B4840A
    %AICMD0x05_SetTransferPosition(144, 440)                   ;B4840C
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B48411
    %AICMD0x09_StartScript($01, pAIScripting0x0F_StarNightFestival_L069)                                   ;B48413
    %AICMD0x09_StartScript($02, pAIScripting0x0F_StarNightFestival_L072)                                   ;B48417
    %AICMD0x09_StartScript($03, pAIScripting0x0F_StarNightFestival_L075)                                   ;B4841B
    %AICMD0x09_StartScript($04, pAIScripting0x0F_StarNightFestival_L078)                                   ;B4841F
    %AICMD0x09_StartScript($05, pAIScripting0x0F_StarNightFestival_L092)                                   ;B48423
    %AICMD0x09_StartScript($06, pAIScripting0x0F_StarNightFestival_L081)                                   ;B48427
    %AICMD0x09_StartScript($07, pAIScripting0x0F_StarNightFestival_L084)                                   ;B4842B
    %AICMD0x38_WaitForFadeIn()                                               ;B4842F
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B48430
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B48432
    %AICMD0x0C_WaitForScriptFlag($02)                                            ;B48434
    %AICMD0x0C_WaitForScriptFlag($03)                                            ;B48436
    %AICMD0x0C_WaitForScriptFlag($05)                                            ;B48438
    %AICMD0x0C_WaitForScriptFlag($06)                                            ;B4843A
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown1, $05)     ;B4843C
    %AICMD0x0C_WaitForScriptFlag($04)                                            ;B48441
    %AICMD0x13_Wait(180)                                       ;B48443
    %AICMD0x41_AddValue16(nLove_Eve, 30)                       ;B48446
    %AICMD0x3C()                                               ;B4844C
    %AICMD0x10_End()                                           ;B4844D
pAIScripting0x0F_StarNightFestival_L069:
    %AICMD0x1A($0028, $0198, aAIScriptingData_L041, $00)                     ;B4844E
pAIScripting0x0F_StarNightFestival_L070:
    %AICMD0x1F(pAIScripting0x0F_StarNightFestival_L071)                                        ;B48456
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L070)                                   ;B48459
pAIScripting0x0F_StarNightFestival_L071:
    %AICMD0x1C_ShowDialog($02C5, $00)                          ;B4845C
    %AICMD0x0B_SetScriptFlag($00)                                            ;B48460
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L070)                                   ;B48462
pAIScripting0x0F_StarNightFestival_L072:
    %AICMD0x1A($0064, $0170, aAIScriptingData_L050, $00)                     ;B48465
pAIScripting0x0F_StarNightFestival_L073:
    %AICMD0x1F(pAIScripting0x0F_StarNightFestival_L074)                                        ;B4846D
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L073)                                   ;B48470
pAIScripting0x0F_StarNightFestival_L074:
    %AICMD0x1C_ShowDialog($02C6, $00)                          ;B48473
    %AICMD0x0B_SetScriptFlag($01)                                            ;B48477
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L073)                                   ;B48479
pAIScripting0x0F_StarNightFestival_L075:
    %AICMD0x1A($00B4, $01A0, aAIScriptingData_L046, $01)                     ;B4847C
pAIScripting0x0F_StarNightFestival_L076:
    %AICMD0x1F(pAIScripting0x0F_StarNightFestival_L077)                                        ;B48484
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L076)                                   ;B48487
pAIScripting0x0F_StarNightFestival_L077:
    %AICMD0x1C_ShowDialog($02C7, $00)                          ;B4848A
    %AICMD0x1B($0298, $00)                                     ;B4848E
    %AICMD0x0B_SetScriptFlag($02)                                            ;B48492
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L076)                                   ;B48494
pAIScripting0x0F_StarNightFestival_L078:
    %AICMD0x1A($00B4, $0170, aAIScriptingData_L064, $00)                     ;B48497
pAIScripting0x0F_StarNightFestival_L079:
    %AICMD0x1F(pAIScripting0x0F_StarNightFestival_L080)                                        ;B4849F
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L079)                                   ;B484A2
pAIScripting0x0F_StarNightFestival_L080:
    %AICMD0x1C_ShowDialog($02C8, $00)                          ;B484A5
    %AICMD0x1B($02CC, $00)                                     ;B484A9
    %AICMD0x0B_SetScriptFlag($03)                                            ;B484AD
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L079)                                   ;B484AF
pAIScripting0x0F_StarNightFestival_L081:
    %AICMD0x1A($0088, $0148, aAIScriptingData_L027, $00)                     ;B484B2
pAIScripting0x0F_StarNightFestival_L082:
    %AICMD0x1F(pAIScripting0x0F_StarNightFestival_L083)                                        ;B484BA
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L082)                                   ;B484BD
pAIScripting0x0F_StarNightFestival_L083:
    %AICMD0x1C_ShowDialog($0407, $00)                          ;B484C0
    %AICMD0x0B_SetScriptFlag($05)                                            ;B484C4
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L082)                                   ;B484C6
pAIScripting0x0F_StarNightFestival_L084:
    %AICMD0x1A($0090, $01C8, aAIScriptingData_L027, $01)                     ;B484C9
pAIScripting0x0F_StarNightFestival_L085:
    %AICMD0x1F(pAIScripting0x0F_StarNightFestival_L086)                                        ;B484D1
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L085)                                   ;B484D4
pAIScripting0x0F_StarNightFestival_L086:
    %AICMD0x1C_ShowDialog($03D9, $00)                          ;B484D7
    %AICMD0x0B_SetScriptFlag($06)                                            ;B484DB
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L085)                                   ;B484DD
pAIScripting0x0F_StarNightFestival_L087:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $00, pAIScripting0x0F_StarNightFestival_L088)   ;B484E0
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $01, pAIScripting0x0F_StarNightFestival_L089)   ;B484E7
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, pAIScripting0x0F_StarNightFestival_L090)   ;B484EE
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $03, pAIScripting0x0F_StarNightFestival_L091)   ;B484F5
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L093)                                   ;B484FC
pAIScripting0x0F_StarNightFestival_L088:
    %AICMD0x41_AddValue16(nLove_Maria, -30)                    ;B484FF
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L093)                                   ;B48505
pAIScripting0x0F_StarNightFestival_L089:
    %AICMD0x41_AddValue16(nLove_Ann, -30)                      ;B48508
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L093)                                   ;B4850E
pAIScripting0x0F_StarNightFestival_L090:
    %AICMD0x41_AddValue16(nLove_Nina, -30)                     ;B48511
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L093)                                   ;B48517
pAIScripting0x0F_StarNightFestival_L091:
    %AICMD0x41_AddValue16(nLove_Ellen, -30)                    ;B4851A
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L093)                                   ;B48520
pAIScripting0x0F_StarNightFestival_L092:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $04, pAIScripting0x0F_StarNightFestival_L094)   ;B48523
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L087)                                   ;B4852A
pAIScripting0x0F_StarNightFestival_L093:
    %AICMD0x1A($0038, $01C0, aAIScriptingData_L024, $00)                     ;B4852D
    %AICMD0x22($18, $08, $01, aAIScriptingData_L025, $08)                    ;B48535
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L095)                                   ;B4853C
pAIScripting0x0F_StarNightFestival_L094:
    %AICMD0x1A($0038, $01C0, aAIScriptingData_L071, $01)                     ;B4853F
    %AICMD0x22($18, $08, $01, aAIScriptingData_L073, $08)                    ;B48547
pAIScripting0x0F_StarNightFestival_L095:
    %AICMD0x1F(pAIScripting0x0F_StarNightFestival_L096)                                        ;B4854E
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L095)                                   ;B48551
pAIScripting0x0F_StarNightFestival_L096:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $05, pAIScripting0x0F_StarNightFestival_L097) ;B48554
    %AICMD0x1C_ShowDialog($0151, $00)                          ;B4855B
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L095)                                   ;B4855F
pAIScripting0x0F_StarNightFestival_L097:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $04, pAIScripting0x0F_StarNightFestival_L101)   ;B48562
    %AICMD0x45_JumpIfBetween16(nLove_Eve, 0, 200, pAIScripting0x0F_StarNightFestival_L098)     ;B48569
    %AICMD0x45_JumpIfBetween16(nLove_Eve, 201, 300, pAIScripting0x0F_StarNightFestival_L099)   ;B48573
    %AICMD0x45_JumpIfBetween16(nLove_Eve, 301, 999, pAIScripting0x0F_StarNightFestival_L100)   ;B4857D
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L095)                                   ;B48587
pAIScripting0x0F_StarNightFestival_L098:
    %AICMD0x1C_ShowDialog($02C9, $00)                          ;B4858A
    %AICMD0x32_SetValue16($8000D4, $0015)                                 ;B4858E
    %AICMD0x0B_SetScriptFlag($04)                                            ;B48594
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L095)                                   ;B48596
pAIScripting0x0F_StarNightFestival_L099:
    %AICMD0x1C_ShowDialog($02CA, $00)                          ;B48599
    %AICMD0x32_SetValue16($8000D4, $0015)                                 ;B4859D
    %AICMD0x0B_SetScriptFlag($04)                                            ;B485A3
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L095)                                   ;B485A5
pAIScripting0x0F_StarNightFestival_L100:
    %AICMD0x1C_ShowDialog($0437, $00)                          ;B485A8
    %AICMD0x32_SetValue16($8000D4, $0015)                                 ;B485AC
    %AICMD0x0B_SetScriptFlag($04)                                            ;B485B2
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L095)                                   ;B485B4
pAIScripting0x0F_StarNightFestival_L101:
    %AICMD0x1C_ShowDialog($0438, $00)                          ;B485B7
    %AICMD0x32_SetValue16($8000D4, $0015)                                 ;B485BB
    %AICMD0x0B_SetScriptFlag($04)                                            ;B485C1
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L095)                                   ;B485C3


DATA8_B485C6:
 
    %AICMD0x4F_DisableToolUse()                                               ;B485C6
    %AICMD0x50()                                               ;B485C7
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $09)       ;B485C8
    %AICMD0x00_SetMusic($0E, $B4)                              ;B485CD
    %AICMD0x03_SetHour($12)                                    ;B485D0
    %AICMD0x05_SetTransferPosition(120, 456)                   ;B485D2
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B485D7
    %AICMD0x08_EnableAIControl()                               ;B485D9
    %AICMD0x09_StartScript($01, pAIScripting0x0F_StarNightFestival_L108)                                   ;B485DA
    %AICMD0x38_WaitForFadeIn()                                               ;B485DE
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 176)                   ;B485DF
    %AICMD0x13_Wait(60)                                        ;B485E3
    %AICMD0x29_SetMapScrooling(0, -1, 240)                     ;B485E6
    %AICMD0x13_Wait(240)                                       ;B485EC
    %AICMD0x29_SetMapScrooling(0, -1, 64)                      ;B485EF
    %AICMD0x13_Wait(64)                                        ;B485F5
    %AICMD0x09_StartScript($02, pAIScripting0x0F_StarNightFestival_L102)                                   ;B485F8
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B485FC
    %AICMD0x29_SetMapScrooling(0, 1, 240)                      ;B485FE
    %AICMD0x13_Wait(240)                                       ;B48604
    %AICMD0x29_SetMapScrooling(0, 1, 64)                       ;B48607
    %AICMD0x13_Wait(64)                                        ;B4860D
    %AICMD0x0B_SetScriptFlag($01)                                            ;B48610
    %AICMD0x0C_WaitForScriptFlag($02)                                            ;B48612
    %AICMD0x19($0006, $00)                                     ;B48614
    %AICMD0x13_Wait(180)                                       ;B48618
    %AICMD0x41_AddValue16(nLove_Nina, 30)                      ;B4861B
    %AICMD0x3C()                                               ;B48621
    %AICMD0x10_End()                                           ;B48622
pAIScripting0x0F_StarNightFestival_L102:
    %AICMD0x1A($0100, $FF80, aAIScriptingData_L094, $00)                     ;B48623
    %AICMD0x0D($FE, $01, $A0, $01)                             ;B4862B
    %AICMD0x0B_SetScriptFlag($00)                                            ;B48630
    %AICMD0x37()                                               ;B48632
    %AICMD0x10_End()                                           ;B48633
pAIScripting0x0F_StarNightFestival_L103:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $00, pAIScripting0x0F_StarNightFestival_L104)   ;B48634
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $01, pAIScripting0x0F_StarNightFestival_L105)   ;B4863B
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $03, pAIScripting0x0F_StarNightFestival_L106)   ;B48642
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $04, pAIScripting0x0F_StarNightFestival_L107)   ;B48649
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L109)                                   ;B48650
pAIScripting0x0F_StarNightFestival_L104:
    %AICMD0x41_AddValue16(nLove_Maria, -30)                    ;B48653
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L109)                                   ;B48659
pAIScripting0x0F_StarNightFestival_L105:
    %AICMD0x41_AddValue16(nLove_Ann, -30)                      ;B4865C
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L109)                                   ;B48662
pAIScripting0x0F_StarNightFestival_L106:
    %AICMD0x41_AddValue16(nLove_Ellen, -30)                    ;B48665
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L109)                                   ;B4866B
pAIScripting0x0F_StarNightFestival_L107:
    %AICMD0x41_AddValue16(nLove_Eve, -30)                      ;B4866E
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L109)                                   ;B48674
pAIScripting0x0F_StarNightFestival_L108:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, pAIScripting0x0F_StarNightFestival_L110)   ;B48677
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L103)                                   ;B4867E
pAIScripting0x0F_StarNightFestival_L109:
    %AICMD0x1A($0088, $0118, aAIScriptingData_L019, $01)                     ;B48681
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B48689
    %AICMD0x1B($0250, $00)                                     ;B4868B
    %AICMD0x45_JumpIfBetween16(nLove_Nina, 0, 200, pAIScripting0x0F_StarNightFestival_L112)    ;B4868F
    %AICMD0x45_JumpIfBetween16(nLove_Nina, 201, 300, pAIScripting0x0F_StarNightFestival_L113)  ;B48699
    %AICMD0x45_JumpIfBetween16(nLove_Nina, 301, 999, pAIScripting0x0F_StarNightFestival_L114)  ;B486A3
pAIScripting0x0F_StarNightFestival_L110:
    %AICMD0x1A($0088, $0118, aAIScriptingData_L071, $01)                     ;B486AD
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B486B5
    %AICMD0x1B($02E6, $00)                                     ;B486B7
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L115)                                   ;B486BB
pAIScripting0x0F_StarNightFestival_L111:
    %AICMD0x13_Wait(1)                                         ;B486BE
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L111)                                   ;B486C1
pAIScripting0x0F_StarNightFestival_L112:
    %AICMD0x1C_ShowDialog($02CB, $00)                          ;B486C4
    %AICMD0x0B_SetScriptFlag($02)                                            ;B486C8
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L111)                                   ;B486CA
pAIScripting0x0F_StarNightFestival_L113:
    %AICMD0x1C_ShowDialog($02CC, $00)                          ;B486CD
    %AICMD0x0B_SetScriptFlag($02)                                            ;B486D1
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L111)                                   ;B486D3
pAIScripting0x0F_StarNightFestival_L114:
    %AICMD0x1C_ShowDialog($0439, $00)                          ;B486D6
    %AICMD0x0B_SetScriptFlag($02)                                            ;B486DA
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L111)                                   ;B486DC
pAIScripting0x0F_StarNightFestival_L115:
    %AICMD0x1C_ShowDialog($043A, $00)                          ;B486DF
    %AICMD0x0B_SetScriptFlag($02)                                            ;B486E3
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L111)                                   ;B486E5


DATA8_B486E8:
    %AICMD0x4F_DisableToolUse()                                               ;B486E8
    %AICMD0x50()                                               ;B486E9
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $09)       ;B486EA
    %AICMD0x00_SetMusic($0E, $B4)                              ;B486EF
    %AICMD0x03_SetHour($12)                                    ;B486F2
    %AICMD0x05_SetTransferPosition(24, 88)                     ;B486F4
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B486F9
    %AICMD0x08_EnableAIControl()                               ;B486FB
    %AICMD0x09_StartScript($01, pAIScripting0x0F_StarNightFestival_L121)                                   ;B486FC
    %AICMD0x38_WaitForFadeIn()                                               ;B48700
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 32)                 ;B48701
    %AICMD0x13_Wait(120)                                       ;B48705
    %AICMD0x11_EnableUserControl()                             ;B48708
    %AICMD0x0B_SetScriptFlag($00)                                            ;B48709
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B4870B
    %AICMD0x13_Wait(180)                                       ;B4870D
    %AICMD0x41_AddValue16(nLove_Ann, 30)                       ;B48710
    %AICMD0x3C()                                               ;B48716
    %AICMD0x10_End()                                           ;B48717
pAIScripting0x0F_StarNightFestival_L116:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $00, pAIScripting0x0F_StarNightFestival_L117)   ;B48718
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, pAIScripting0x0F_StarNightFestival_L118)   ;B4871F
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $03, pAIScripting0x0F_StarNightFestival_L119)   ;B48726
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $04, pAIScripting0x0F_StarNightFestival_L120)   ;B4872D
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L122)                                   ;B48734
pAIScripting0x0F_StarNightFestival_L117:
    %AICMD0x41_AddValue16(nLove_Maria, -30)                    ;B48737
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L122)                                   ;B4873D
pAIScripting0x0F_StarNightFestival_L118:
    %AICMD0x41_AddValue16(nLove_Nina, -30)                     ;B48740
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L122)                                   ;B48746
pAIScripting0x0F_StarNightFestival_L119:
    %AICMD0x41_AddValue16(nLove_Ellen, -30)                    ;B48749
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L122)                                   ;B4874F
pAIScripting0x0F_StarNightFestival_L120:
    %AICMD0x41_AddValue16(nLove_Eve, -30)                      ;B48752
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L122)                                   ;B48758
pAIScripting0x0F_StarNightFestival_L121:
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L116)                                   ;B4875B
pAIScripting0x0F_StarNightFestival_L122:
    %AICMD0x1A($00A8, $0098, aAIScriptingData_L018, $01)                     ;B4875E
pAIScripting0x0F_StarNightFestival_L123:
    %AICMD0x1F(pAIScripting0x0F_StarNightFestival_L124)                                        ;B48766
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L123)                                   ;B48769
pAIScripting0x0F_StarNightFestival_L124:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $01, pAIScripting0x0F_StarNightFestival_L128)   ;B4876C
    %AICMD0x45_JumpIfBetween16(nLove_Ann, 0, 200, pAIScripting0x0F_StarNightFestival_L125)     ;B48773
    %AICMD0x45_JumpIfBetween16(nLove_Ann, 201, 300, pAIScripting0x0F_StarNightFestival_L126)   ;B4877D
    %AICMD0x45_JumpIfBetween16(nLove_Ann, 301, 999, pAIScripting0x0F_StarNightFestival_L127)   ;B48787
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L123)                                   ;B48791
pAIScripting0x0F_StarNightFestival_L125:
    %AICMD0x1C_ShowDialog($02CD, $00)                          ;B48794
    %AICMD0x0B_SetScriptFlag($01)                                            ;B48798
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L123)                                   ;B4879A
pAIScripting0x0F_StarNightFestival_L126:
    %AICMD0x1C_ShowDialog($02A9, $00)                          ;B4879D
    %AICMD0x0B_SetScriptFlag($01)                                            ;B487A1
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L123)                                   ;B487A3
pAIScripting0x0F_StarNightFestival_L127:
    %AICMD0x1C_ShowDialog($043B, $00)                          ;B487A6
    %AICMD0x0B_SetScriptFlag($01)                                            ;B487AA
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L123)                                   ;B487AC
pAIScripting0x0F_StarNightFestival_L128:
    %AICMD0x1C_ShowDialog($043C, $00)                          ;B487AF
    %AICMD0x0B_SetScriptFlag($01)                                            ;B487B3
    %AICMD0x12_Jump(pAIScripting0x0F_StarNightFestival_L123)                                   ;B487B5


pAIScripting0x10_WoodsPondEvent:
    dw AI_WaterImp                                             ;B487B8|        |B487D8;
    dw pAIScripting0x11                                        ;B487BA|        |B48818;
    dw pAIScripting0x11                                        ;B487BC|        |B48818;
    dw pAIScripting0x11                                        ;B487BE|        |B48818;
    dw pAIScripting0x11                                        ;B487C0|        |B48818;
    dw pAIScripting0x11                                        ;B487C2|        |B48818;
    dw pAIScripting0x11                                        ;B487C4|        |B48818;
    dw pAIScripting0x11                                        ;B487C6|        |B48818;
    dw pAIScripting0x11                                        ;B487C8|        |B48818;
    dw pAIScripting0x11                                        ;B487CA|        |B48818;
    dw pAIScripting0x11                                        ;B487CC|        |B48818;
    dw pAIScripting0x11                                        ;B487CE|        |B48818;
    dw pAIScripting0x11                                        ;B487D0|        |B48818;
    dw pAIScripting0x11                                        ;B487D2|        |B48818;
    dw pAIScripting0x11                                        ;B487D4|        |B48818;
    dw pAIScripting0x11                                        ;B487D6|        |B48818;
 
AI_WaterImp:
    %AICMD0x08_EnableAIControl()                               ;B487D8
    %AICMD0x13_Wait(60)                                        ;B487D9
    %AICMD0x09_StartScript($07, AI_WaterImp_L001)                                   ;B487DC
    %AICMD0x09_StartScript($15, AI_WaterImp_L002)                                   ;B487E0
    %AICMD0x10_End()                                           ;B487E4
AI_WaterImp_L001:
    %AICMD0x1A($02B0, $0170, aAIScriptingData_L092, $00)                     ;B487E5
    %AICMD0x1C_ShowDialog($0335, $00)                          ;B487ED
    %AICMD0x0B_SetScriptFlag($00)                                            ;B487F1
    %AICMD0x13_Wait(180)                                       ;B487F3
    %AICMD0x37()                                               ;B487F6
    %AICMD0x10_End()                                           ;B487F7
AI_WaterImp_L002:
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B487F8
    %AICMD0x1A($02A8, $0178, aAIScriptingData_L123, $00)                     ;B487FA
    %AICMD0x0D($00, $01, $0C, $01)                             ;B48802
    %AICMD0x0D($00, $02, $12, $01)                             ;B48807
    %AICMD0x13_Wait(180)                                       ;B4880C
    %AICMD0x1B($040D, $00)                                     ;B4880F
    %AICMD0x11_EnableUserControl()                             ;B48813
AI_WaterImp_L003:
    %AICMD0x4A()                                               ;B48814
    %AICMD0x12_Jump(AI_WaterImp_L003)                                   ;B48815


pAIScripting0x11:
    dw DATA8_B48838                                            ;B48818|        |B48838;
    dw pAIScripting0x12                                        ;B4881A|        |B488A0;
    dw pAIScripting0x12                                        ;B4881C|        |B488A0;
    dw pAIScripting0x12                                        ;B4881E|        |B488A0;
    dw pAIScripting0x12                                        ;B48820|        |B488A0;
    dw pAIScripting0x12                                        ;B48822|        |B488A0;
    dw pAIScripting0x12                                        ;B48824|        |B488A0;
    dw pAIScripting0x12                                        ;B48826|        |B488A0;
    dw pAIScripting0x12                                        ;B48828|        |B488A0;
    dw pAIScripting0x12                                        ;B4882A|        |B488A0;
    dw pAIScripting0x12                                        ;B4882C|        |B488A0;
    dw pAIScripting0x12                                        ;B4882E|        |B488A0;
    dw pAIScripting0x12                                        ;B48830|        |B488A0;
    dw pAIScripting0x12                                        ;B48832|        |B488A0;
    dw pAIScripting0x12                                        ;B48834|        |B488A0;
    dw pAIScripting0x12                                        ;B48836|        |B488A0;
 
DATA8_B48838:
    %AICMD0x50()                                               ;B48838
    %AICMD0x09_StartScript($01, pAIScripting0x11_L003)                                   ;B48839
    %AICMD0x38_WaitForFadeIn()                                               ;B4883D
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 80)                  ;B4883E
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B48842
    %AICMD0x1D_ShowDialog($0148, $00)                          ;B48844
    %AICMD0x20_JumpIfChoice(0, pAIScripting0x11_L001)                        ;B48848
    %AICMD0x20_JumpIfChoice(1, pAIScripting0x11_L002)                        ;B4884C
pAIScripting0x11_L001:
    %AICMD0x0F_ScreenFadeout($01)                              ;B48850
    %AICMD0x09_StartScript($02, pAIScripting0x11_L004)                                   ;B48852
    %AICMD0x0A_ScreenFadein($01)                                            ;B48856
    %AICMD0x1C_ShowDialog($014A, $00)                          ;B48858
    %AICMD0x0B_SetScriptFlag($00)                                            ;B4885C
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B4885E
    %AICMD0x11_EnableUserControl()                             ;B48860
    %AICMD0x10_End()                                           ;B48861
pAIScripting0x11_L002:
    %AICMD0x1C_ShowDialog($014C, $00)                          ;B48862
    %AICMD0x0B_SetScriptFlag($00)                                            ;B48866
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B48868
    %AICMD0x11_EnableUserControl()                             ;B4886A
    %AICMD0x10_End()                                           ;B4886B
pAIScripting0x11_L003:
    %AICMD0x1A($0068, $01A8, aAIScriptingData_L058, $02)                     ;B4886C
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B48874
    %AICMD0x1B($02BB, $00)                                     ;B48876
    %AICMD0x0D($00, $01, $10, $01)                             ;B4887A
    %AICMD0x1B($02BF, $00)                                     ;B4887F
    %AICMD0x0D($FF, $00, $A0, $01)                             ;B48883
    %AICMD0x0B_SetScriptFlag($01)                                            ;B48888
    %AICMD0x37()                                               ;B4888A
    %AICMD0x10_End()                                           ;B4888B
pAIScripting0x11_L004:
    %AICMD0x1A($0078, $01A8, aAIScriptingData_L008, $00)                     ;B4888C
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B48894
    %AICMD0x13_Wait(30)                                        ;B48896
    %AICMD0x0D($FF, $00, $A0, $01)                             ;B48899
    %AICMD0x37()                                               ;B4889E
    %AICMD0x10_End()                                           ;B4889F


pAIScripting0x12:
    dw DATA8_B488C0                                            ;B488A0|        |B488C0;
    dw pAIScripting0x13                                        ;B488A2|        |B4892A;
    dw pAIScripting0x13                                        ;B488A4|        |B4892A;
    dw pAIScripting0x13                                        ;B488A6|        |B4892A;
    dw pAIScripting0x13                                        ;B488A8|        |B4892A;
    dw pAIScripting0x13                                        ;B488AA|        |B4892A;
    dw pAIScripting0x13                                        ;B488AC|        |B4892A;
    dw pAIScripting0x13                                        ;B488AE|        |B4892A;
    dw pAIScripting0x13                                        ;B488B0|        |B4892A;
    dw pAIScripting0x13                                        ;B488B2|        |B4892A;
    dw pAIScripting0x13                                        ;B488B4|        |B4892A;
    dw pAIScripting0x13                                        ;B488B6|        |B4892A;
    dw pAIScripting0x13                                        ;B488B8|        |B4892A;
    dw pAIScripting0x13                                        ;B488BA|        |B4892A;
    dw pAIScripting0x13                                        ;B488BC|        |B4892A;
    dw pAIScripting0x13                                        ;B488BE|        |B4892A;
 
DATA8_B488C0:
    %AICMD0x50()                                               ;B488C0
    %AICMD0x00_SetMusic($0A, $B4)                              ;B488C1
    %AICMD0x08_EnableAIControl()                               ;B488C4
    %AICMD0x2A($0041)                                          ;B488C5
    %AICMD0x13_Wait(180)                                       ;B488C8
    %AICMD0x09_StartScript($01, pAIScripting0x12_L001)                                   ;B488CB
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B488CF
    %AICMD0x09_StartScript($10, pAIScripting0x12_L002)                                   ;B488D1
    %AICMD0x10_End()                                           ;B488D5
pAIScripting0x12_L001:
    %AICMD0x1A($0088, $00F8, aAIScriptingData_L087, $00)                     ;B488D6
    %AICMD0x13_Wait(180)                                       ;B488DE
    %AICMD0x0D($00, $FF, $10, $01)                             ;B488E1
    %AICMD0x0D($01, $01, $10, $01)                             ;B488E6
    %AICMD0x0D($00, $01, $10, $01)                             ;B488EB
    %AICMD0x0D($FF, $00, $10, $01)                             ;B488F0
    %AICMD0x1C_ShowDialog($0339, $01)                          ;B488F5
    %AICMD0x0B_SetScriptFlag($00)                                            ;B488F9
    %AICMD0x13_Wait(120)                                       ;B488FB
    %AICMD0x1C_ShowDialog($033A, $01)                          ;B488FE
    %AICMD0x13_Wait(30)                                        ;B48902
    %AICMD0x0D($00, $FF, $10, $02)                             ;B48905
    %AICMD0x0D($00, $FF, $18, $03)                             ;B4890A
    %AICMD0x1B($0318, $00)                                     ;B4890F
    %AICMD0x13_Wait(180)                                       ;B48913
    %AICMD0x37()                                               ;B48916
    %AICMD0x11_EnableUserControl()                             ;B48917
    %AICMD0x10_End()                                           ;B48918
pAIScripting0x12_L002:
    %AICMD0x1A($0088, $0120, aAIScriptingData_L123, $00)                     ;B48919
    %AICMD0x0D($00, $01, $50, $02)                             ;B48921
pAIScripting0x12_L003:
    %AICMD0x4A()                                               ;B48926
    %AICMD0x12_Jump(pAIScripting0x12_L003)                                   ;B48927


pAIScripting0x13:
    dw DATA8_B4894A                                            ;B4892A|        |B4894A;
    dw pAIScripting0x14                                        ;B4892C|        |B489D2;
    dw pAIScripting0x14                                        ;B4892E|        |B489D2;
    dw pAIScripting0x14                                        ;B48930|        |B489D2;
    dw pAIScripting0x14                                        ;B48932|        |B489D2;
    dw pAIScripting0x14                                        ;B48934|        |B489D2;
    dw pAIScripting0x14                                        ;B48936|        |B489D2;
    dw pAIScripting0x14                                        ;B48938|        |B489D2;
    dw pAIScripting0x14                                        ;B4893A|        |B489D2;
    dw pAIScripting0x14                                        ;B4893C|        |B489D2;
    dw pAIScripting0x14                                        ;B4893E|        |B489D2;
    dw pAIScripting0x14                                        ;B48940|        |B489D2;
    dw pAIScripting0x14                                        ;B48942|        |B489D2;
    dw pAIScripting0x14                                        ;B48944|        |B489D2;
    dw pAIScripting0x14                                        ;B48946|        |B489D2;
    dw pAIScripting0x14                                        ;B48948|        |B489D2;
 
DATA8_B4894A:
    %AICMD0x50()                                               ;B4894A
    %AICMD0x08_EnableAIControl()                               ;B4894B
    %AICMD0x09_StartScript($01, pAIScripting0x13_L001)                                   ;B4894C
    %AICMD0x38_WaitForFadeIn()                                               ;B48950
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 80)                  ;B48951
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B48955
    %AICMD0x0B_SetScriptFlag($00)                                            ;B48957
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B48959
    %AICMD0x11_EnableUserControl()                             ;B4895B
    %AICMD0x10_End()                                           ;B4895C
pAIScripting0x13_L001:
    %AICMD0x1A($0078, $01A8, aAIScriptingData_L060, $02)                     ;B4895D
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B48965
    %AICMD0x1D_ShowDialog($014D, $00)                          ;B48967
    %AICMD0x20_JumpIfChoice(0, pAIScripting0x13_L002)                        ;B4896B
    %AICMD0x20_JumpIfChoice(1, pAIScripting0x13_L003)                        ;B4896F
pAIScripting0x13_L002:
    %AICMD0x1B($02BD, $00)                                     ;B48973
    %AICMD0x0D($00, $FF, $30, $01)                             ;B48977
    %AICMD0x1B($02C3, $01)                                     ;B4897C
    %AICMD0x0D($01, $00, $A0, $01)                             ;B48980
    %AICMD0x1B($02C0, $00)                                     ;B48985
    %AICMD0x13_Wait(180)                                       ;B48989
    %AICMD0x1B($02C3, $00)                                     ;B4898C
    %AICMD0x0D($FF, $00, $A0, $01)                             ;B48990
    %AICMD0x1B($02C1, $00)                                     ;B48995
    %AICMD0x0D($00, $01, $30, $01)                             ;B48999
    %AICMD0x1B($02C2, $01)                                     ;B4899E
    %AICMD0x1C_ShowDialog($014E, $00)                          ;B489A2
    %AICMD0x42_AddValue24(nMoney, -2000)                       ;B489A6
    %AICMD0x23_OrWithIndexedValue(strcFlags.event3, $0B)       ;B489AD
    %AICMD0x12_Jump(pAIScripting0x13_L004)                                   ;B489B2
pAIScripting0x13_L003:
    %AICMD0x1C_ShowDialog($014F, $00)                          ;B489B5
    %AICMD0x12_Jump(pAIScripting0x13_L004)                                   ;B489B9
pAIScripting0x13_L004:
    %AICMD0x1B($02C1, $00)                                     ;B489BC
    %AICMD0x0D($00, $01, $10, $01)                             ;B489C0
    %AICMD0x1B($02C3, $00)                                     ;B489C5
    %AICMD0x0D($FF, $00, $90, $01)                             ;B489C9
    %AICMD0x0B_SetScriptFlag($01)                                            ;B489CE
    %AICMD0x37()                                               ;B489D0
    %AICMD0x10_End()                                           ;B489D1


pAIScripting0x14:
    dw DATA8_B489F2                                            ;B489D2|        |B489F2;
    dw DATA8_B48AAB                                            ;B489D4|        |B48AAB;
    dw DATA8_B48B00                                            ;B489D6|        |B48B00;
    dw DATA8_B48B9B                                            ;B489D8|        |B48B9B;
    dw pAIScripting0x14_L020                                            ;B489DA|        |B48BDE;
    dw pAIScripting0x15                                        ;B489DC|        |B48C25;
    dw pAIScripting0x15                                        ;B489DE|        |B48C25;
    dw pAIScripting0x15                                        ;B489E0|        |B48C25;
    dw pAIScripting0x15                                        ;B489E2|        |B48C25;
    dw pAIScripting0x15                                        ;B489E4|        |B48C25;
    dw pAIScripting0x15                                        ;B489E6|        |B48C25;
    dw pAIScripting0x15                                        ;B489E8|        |B48C25;
    dw pAIScripting0x15                                        ;B489EA|        |B48C25;
    dw pAIScripting0x15                                        ;B489EC|        |B48C25;
    dw pAIScripting0x15                                        ;B489EE|        |B48C25;
    dw pAIScripting0x15                                        ;B489F0|        |B48C25;
 
DATA8_B489F2:
 
    %AICMD0x50()                                               ;B489F2
    %AICMD0x01_UnfreezeTime()                                  ;B489F3
    %AICMD0x03_SetHour($07)                                    ;B489F4
    %AICMD0x05_SetTransferPosition(136, 344)                   ;B489F6
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B489FB
    %AICMD0x08_EnableAIControl()                               ;B489FD
    %AICMD0x09_StartScript($01, pAIScripting0x14_L001)                                   ;B489FE
    %AICMD0x38_WaitForFadeIn()                                               ;B48A02
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 80)                  ;B48A03
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B48A07
    %AICMD0x0B_SetScriptFlag($00)                                            ;B48A09
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B48A0B
    %AICMD0x0F_ScreenFadeout($01)                              ;B48A0D
    %AICMD0x09_StartScript($02, pAIScripting0x14_L006)                                   ;B48A0F
    %AICMD0x0A_ScreenFadein($01)                                            ;B48A13
    %AICMD0x0B_SetScriptFlag($02)                                            ;B48A15
    %AICMD0x0C_WaitForScriptFlag($04)                                            ;B48A17
    %AICMD0x11_EnableUserControl()                             ;B48A19
    %AICMD0x10_End()                                           ;B48A1A
pAIScripting0x14_L001:
    %AICMD0x1A($FFF0, $01A8, aAIScriptingData_L059, $02)                     ;B48A1B
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B48A23
    %AICMD0x0D($01, $00, $60, $01)                             ;B48A25
    %AICMD0x1D_ShowDialog($0149, $00)                          ;B48A2A
    %AICMD0x20_JumpIfChoice(0, pAIScripting0x14_L002)                        ;B48A2E
    %AICMD0x20_JumpIfChoice(1, pAIScripting0x14_L003)                        ;B48A32
pAIScripting0x14_L002:
    %AICMD0x0B_SetScriptFlag($01)                                            ;B48A36
    %AICMD0x0C_WaitForScriptFlag($02)                                            ;B48A38
    %AICMD0x1B($02BB, $00)                                     ;B48A3A
    %AICMD0x0D($00, $01, $20, $01)                             ;B48A3E
    %AICMD0x1B($02BF, $00)                                     ;B48A43
    %AICMD0x0D($FF, $00, $20, $01)                             ;B48A47
    %AICMD0x1B($02BB, $00)                                     ;B48A4C
    %AICMD0x1C_ShowDialog($014A, $00)                          ;B48A50
    %AICMD0x23_OrWithIndexedValue(strcFlags.event1, $06)       ;B48A54
    %AICMD0x23_OrWithIndexedValue(strcFlags.event1, $07)       ;B48A59
    %AICMD0x12_Jump(pAIScripting0x14_L004)                                   ;B48A5E
pAIScripting0x14_L003:
    %AICMD0x1C_ShowDialog($014C, $00)                          ;B48A61
    %AICMD0x12_Jump(pAIScripting0x14_L005)                                   ;B48A65
pAIScripting0x14_L004:
    %AICMD0x1B($02BF, $00)                                     ;B48A68
    %AICMD0x0D($FF, $00, $40, $01)                             ;B48A6C
    %AICMD0x0B_SetScriptFlag($03)                                            ;B48A71
    %AICMD0x37()                                               ;B48A73
    %AICMD0x10_End()                                           ;B48A74
pAIScripting0x14_L005:
    %AICMD0x1B($02BB, $00)                                     ;B48A75
    %AICMD0x0D($00, $01, $20, $01)                             ;B48A79
    %AICMD0x1B($02BF, $00)                                     ;B48A7E
    %AICMD0x0D($FF, $00, $A0, $01)                             ;B48A82
    %AICMD0x0B_SetScriptFlag($04)                                            ;B48A87
    %AICMD0x37()                                               ;B48A89
    %AICMD0x10_End()                                           ;B48A8A
pAIScripting0x14_L006:
    %AICMD0x1A($0048, $01E8, aAIScriptingData_L002, $03)                     ;B48A8B
    %AICMD0x0C_WaitForScriptFlag($03)                                            ;B48A93
    %AICMD0x1B($01A7, $00)                                     ;B48A95
    %AICMD0x0D($00, $FF, $10, $01)                             ;B48A99
    %AICMD0x1B($018B, $00)                                     ;B48A9E
    %AICMD0x0D($FF, $00, $40, $01)                             ;B48AA2
    %AICMD0x0B_SetScriptFlag($04)                                            ;B48AA7
    %AICMD0x37()                                               ;B48AA9
    %AICMD0x10_End()                                           ;B48AAA


DATA8_B48AAB:
 
    %AICMD0x4F_DisableToolUse()                                               ;B48AAB
    %AICMD0x50()                                               ;B48AAC
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $09)       ;B48AAD
    %AICMD0x00_SetMusic($0A, $B4)                              ;B48AB2
    %AICMD0x05_SetTransferPosition(128, 456)                   ;B48AB5
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B48ABA
    %AICMD0x08_EnableAIControl()                               ;B48ABC
    %AICMD0x02_FreezeTime()                                    ;B48ABD
    %AICMD0x03_SetHour($07)                                    ;B48ABE
    %AICMD0x09_StartScript($01, pAIScripting0x14_L007)                                   ;B48AC0
    %AICMD0x19($00E8, $00)                                     ;B48AC4
    %AICMD0x06_SetDestinationArea(!AREA_MOUNTAINTOPBEAN)       ;B48AC8
    %AICMD0x38_WaitForFadeIn()                                               ;B48ACA
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B48ACB
    %AICMD0x3D_TeleportToArea(!AREA_GOLDCHICKEN)               ;B48ACD
    %AICMD0x10_End()                                           ;B48ACF
pAIScripting0x14_L007:
    %AICMD0x1A($0080, $01C8, aAIScriptingData_L001, $01)                     ;B48AD0
    %AICMD0x0D($00, $FF, $40, $01)                             ;B48AD8
    %AICMD0x29_SetMapScrooling(0, -1, 64)                      ;B48ADD
    %AICMD0x0D($00, $FF, $50, $01)                             ;B48AE3
    %AICMD0x1B($0006, $00)                                     ;B48AE8
    %AICMD0x13_Wait(60)                                        ;B48AEC
    %AICMD0x1B($0063, $00)                                     ;B48AEF
    %AICMD0x0D($00, $FF, $90, $02)                             ;B48AF3
    %AICMD0x0B_SetScriptFlag($00)                                            ;B48AF8
pAIScripting0x14_L008:
    %AICMD0x13_Wait(1)                                         ;B48AFA
    %AICMD0x12_Jump(pAIScripting0x14_L008)                                   ;B48AFD


DATA8_B48B00:
 
    %AICMD0x4F_DisableToolUse()                                               ;B48B00
    %AICMD0x50()                                               ;B48B01
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $09)       ;B48B02
    %AICMD0x03_SetHour($07)                                    ;B48B07
    %AICMD0x05_SetTransferPosition(136, 632)                   ;B48B09
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B48B0E
    %AICMD0x09_StartScript($01, pAIScripting0x14_L009)                                   ;B48B10
    %AICMD0x28_ClearBit(strcFlags.event3, $09)                          ;B48B14
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $0A)       ;B48B19
    %AICMD0x06_SetDestinationArea(!AREA_GOLDCHICKEN)           ;B48B1E
    %AICMD0x38_WaitForFadeIn()                                               ;B48B20
    %AICMD0x11_EnableUserControl()                             ;B48B21
    %AICMD0x10_End()                                           ;B48B22
pAIScripting0x14_L009:
    %AICMD0x1A($0088, $00CC, aAIScriptingData_L103, $00)                     ;B48B23
pAIScripting0x14_L010:
    %AICMD0x1F(pAIScripting0x14_L012)                                        ;B48B2B
    %AICMD0x12_Jump(pAIScripting0x14_L010)                                   ;B48B2E
pAIScripting0x14_L011:
    %AICMD0x1F(pAIScripting0x14_L014)                                        ;B48B31
    %AICMD0x12_Jump(pAIScripting0x14_L011)                                   ;B48B34
pAIScripting0x14_L012:
    %AICMD0x1D_ShowDialog($0336, $00)                          ;B48B37
    %AICMD0x20_JumpIfChoice(1, pAIScripting0x14_L013)                        ;B48B3B
    %AICMD0x08_EnableAIControl()                               ;B48B3F
    %AICMD0x1B($021B, $00)                                     ;B48B40
    %AICMD0x09_StartScript($02, pAIScripting0x14_L015)                                   ;B48B44
    %AICMD0x0D($FF, $FF, $24, $02)                             ;B48B48
    %AICMD0x13_Wait(30)                                        ;B48B4D
    %AICMD0x1B($021C, $00)                                     ;B48B50
    %AICMD0x13_Wait(120)                                       ;B48B54
    %AICMD0x1C_ShowDialog($0337, $00)                          ;B48B57
    %AICMD0x0B_SetScriptFlag($00)                                            ;B48B5B
    %AICMD0x2A($0043)                                          ;B48B5D
    %AICMD0x4B($C3, $0040, $0080)                              ;B48B60
    %AICMD0x3E_SetCarryItem($23)                               ;B48B66
    %AICMD0x13_Wait(60)                                        ;B48B68
    %AICMD0x32_SetValue16($8000D4, $0000)                                 ;B48B6B
    %AICMD0x28_ClearBit($8000D2, $01)                                   ;B48B71
    %AICMD0x11_EnableUserControl()                             ;B48B76
    %AICMD0x12_Jump(pAIScripting0x14_L011)                                   ;B48B77
pAIScripting0x14_L013:
    %AICMD0x2A($0043)                                          ;B48B7A
    %AICMD0x4B($C3, $0040, $0080)                              ;B48B7D
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily2, $0C)       ;B48B83
pAIScripting0x14_L014:
    %AICMD0x1C_ShowDialog($0338, $00)                          ;B48B88
    %AICMD0x12_Jump(pAIScripting0x14_L011)                                   ;B48B8C
pAIScripting0x14_L015:
    %AICMD0x1A($0088, $00C8, aAIScriptingData_L102, $00)                     ;B48B8F
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B48B97
    %AICMD0x37()                                               ;B48B99
    %AICMD0x10_End()                                           ;B48B9A


DATA8_B48B9B:
 
    %AICMD0x4F_DisableToolUse()                                               ;B48B9B
    %AICMD0x50()                                               ;B48B9C
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $09)       ;B48B9D
    %AICMD0x14_JumpIfFlagSet(strcFlags.daily2, $0C, pAIScripting0x14_L020)   ;B48BA2
    %AICMD0x08_EnableAIControl()                               ;B48BA9
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B48BAA
    %AICMD0x09_StartScript($01, pAIScripting0x14_L016)                                   ;B48BAC
    %AICMD0x09_StartScript($02, pAIScripting0x14_L018)                                   ;B48BB0
    %AICMD0x38_WaitForFadeIn()                                               ;B48BB4
    %AICMD0x1C_ShowDialog($0360, $00)                          ;B48BB5
    %AICMD0x42_AddValue24(nMoney, 1000)                        ;B48BB9
    %AICMD0x3C()                                               ;B48BC0
    %AICMD0x10_End()                                           ;B48BC1
pAIScripting0x14_L016:
    %AICMD0x1A($0248, $0168, aAIScriptingData_L057, $00)                     ;B48BC2
pAIScripting0x14_L017:
    %AICMD0x13_Wait(1)                                         ;B48BCA
    %AICMD0x12_Jump(pAIScripting0x14_L017)                                   ;B48BCD
pAIScripting0x14_L018:
    %AICMD0x1A($0258, $0168, aAIScriptingData_L102, $00)                     ;B48BD0
pAIScripting0x14_L019:
    %AICMD0x13_Wait(1)                                         ;B48BD8
    %AICMD0x12_Jump(pAIScripting0x14_L019)                                   ;B48BDB


pAIScripting0x14_L020:
    %AICMD0x4F_DisableToolUse()                                               ;B48BDE
    %AICMD0x50()                                               ;B48BDF
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $09)       ;B48BE0
    %AICMD0x05_SetTransferPosition(136, 456)                   ;B48BE5
    %AICMD0x08_EnableAIControl()                               ;B48BEA
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 0, pAIScripting0x14_L021)     ;B48BEB
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 1, pAIScripting0x14_L022)     ;B48BF2
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 2, pAIScripting0x14_L023)     ;B48BF9
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, pAIScripting0x14_L024)     ;B48C00
pAIScripting0x14_L021:
    %AICMD0x06_SetDestinationArea(!AREA_FARMSPRING)            ;B48C07
    %AICMD0x12_Jump(pAIScripting0x14_L025)                                   ;B48C09
pAIScripting0x14_L022:
    %AICMD0x06_SetDestinationArea(!AREA_FARMSUMMER)            ;B48C0C
    %AICMD0x12_Jump(pAIScripting0x14_L025)                                   ;B48C0E
pAIScripting0x14_L023:
    %AICMD0x06_SetDestinationArea(!AREA_FARMFALL)              ;B48C11
    %AICMD0x12_Jump(pAIScripting0x14_L025)                                   ;B48C13
pAIScripting0x14_L024:
    %AICMD0x06_SetDestinationArea(!AREA_FARMWINTER)            ;B48C16
    %AICMD0x12_Jump(pAIScripting0x14_L025)                                   ;B48C18
pAIScripting0x14_L025:
    %AICMD0x38_WaitForFadeIn()                                               ;B48C1B
    %AICMD0x19($004D, $00)                                     ;B48C1C
    %AICMD0x13_Wait(120)                                       ;B48C20
    %AICMD0x3C()                                               ;B48C23
    %AICMD0x10_End()                                           ;B48C24


pAIScripting0x15:
    dw DATA8_B48C45                                            ;B48C25|        |B48C45;
    dw pAIScripting0x16                                        ;B48C27|        |B48D38;
    dw pAIScripting0x16                                        ;B48C29|        |B48D38;
    dw pAIScripting0x16                                        ;B48C2B|        |B48D38;
    dw pAIScripting0x16                                        ;B48C2D|        |B48D38;
    dw pAIScripting0x16                                        ;B48C2F|        |B48D38;
    dw pAIScripting0x16                                        ;B48C31|        |B48D38;
    dw pAIScripting0x16                                        ;B48C33|        |B48D38;
    dw pAIScripting0x16                                        ;B48C35|        |B48D38;
    dw pAIScripting0x16                                        ;B48C37|        |B48D38;
    dw pAIScripting0x16                                        ;B48C39|        |B48D38;
    dw pAIScripting0x16                                        ;B48C3B|        |B48D38;
    dw pAIScripting0x16                                        ;B48C3D|        |B48D38;
    dw pAIScripting0x16                                        ;B48C3F|        |B48D38;
    dw pAIScripting0x16                                        ;B48C41|        |B48D38;
    dw pAIScripting0x16                                        ;B48C43|        |B48D38;
 
DATA8_B48C45:
    %AICMD0x05_SetTransferPosition(184, 360)                   ;B48C45
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B48C4A
    %AICMD0x08_EnableAIControl()                               ;B48C4C
    %AICMD0x09_StartScript($01, pAIScripting0x15_L002)                                   ;B48C4D
    %AICMD0x09_StartScript($02, pAIScripting0x15_L013)                                   ;B48C51
    %AICMD0x09_StartScript($03, pAIScripting0x15_L018)                                   ;B48C55
    %AICMD0x38_WaitForFadeIn()                                               ;B48C59
    %AICMD0x11_EnableUserControl()                             ;B48C5A
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B48C5B
    %AICMD0x08_EnableAIControl()                               ;B48C5D
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B48C5E
    %AICMD0x11_EnableUserControl()                             ;B48C60
pAIScripting0x15_L001:
    %AICMD0x13_Wait(1)                                         ;B48C61
    %AICMD0x12_Jump(pAIScripting0x15_L001)                                   ;B48C64
pAIScripting0x15_L002:
    %AICMD0x1A($0058, $0178, aAIScriptingData_L081, $02)                     ;B48C67
pAIScripting0x15_L003:
    %AICMD0x1F(pAIScripting0x15_L005)                                        ;B48C6F
    %AICMD0x12_Jump(pAIScripting0x15_L003)                                   ;B48C72
pAIScripting0x15_L004:
    %AICMD0x1F(pAIScripting0x15_L011)                                        ;B48C75
    %AICMD0x12_Jump(pAIScripting0x15_L004)                                   ;B48C78
pAIScripting0x15_L005:
    %AICMD0x23_OrWithIndexedValue(strcFlags.event3, $0D)       ;B48C7B
    %AICMD0x1D_ShowDialog($0327, $00)                          ;B48C80
    %AICMD0x20_JumpIfChoice(0, pAIScripting0x15_L006)                        ;B48C84
    %AICMD0x20_JumpIfChoice(1, pAIScripting0x15_L010)                        ;B48C88
    %AICMD0x12_Jump(pAIScripting0x15_L012)                                   ;B48C8C
pAIScripting0x15_L006:
    %AICMD0x1C_ShowDialog($0328, $00)                          ;B48C8F
    %AICMD0x15_JumpIfEquals8($800921, 1, pAIScripting0x15_L007)              ;B48C93
    %AICMD0x15_JumpIfEquals8($800923, 1, pAIScripting0x15_L008)              ;B48C9A
    %AICMD0x12_Jump(pAIScripting0x15_L009)                                   ;B48CA1
pAIScripting0x15_L007:
    %AICMD0x47_SetValue8($800921, 0)                           ;B48CA4
    %AICMD0x12_Jump(pAIScripting0x15_L009)                                   ;B48CA9
pAIScripting0x15_L008:
    %AICMD0x47_SetValue8($800923, 0)                           ;B48CAC
    %AICMD0x12_Jump(pAIScripting0x15_L009)                                   ;B48CB1
pAIScripting0x15_L009:
    %AICMD0x28_ClearBit(strcShedItems.row1, $00)                        ;B48CB4
    %AICMD0x23_OrWithIndexedValue(strcFlags.event6, $0F)       ;B48CB9
    %AICMD0x41_AddValue16(nPlayerHappiness, 20)                ;B48CBE
    %AICMD0x0B_SetScriptFlag($00)                                            ;B48CC4
    %AICMD0x12_Jump(pAIScripting0x15_L012)                                   ;B48CC6
pAIScripting0x15_L010:
    %AICMD0x1C_ShowDialog($0329, $00)                          ;B48CC9
    %AICMD0x23_OrWithIndexedValue(strcFlags.event4, $00)       ;B48CCD
    %AICMD0x41_AddValue16(nPlayerHappiness, -10)               ;B48CD2
    %AICMD0x0B_SetScriptFlag($00)                                            ;B48CD8
    %AICMD0x12_Jump(pAIScripting0x15_L012)                                   ;B48CDA
pAIScripting0x15_L011:
    %AICMD0x1C_ShowDialog($032A, $00)                          ;B48CDD
    %AICMD0x12_Jump(pAIScripting0x15_L004)                                   ;B48CE1
pAIScripting0x15_L012:
    %AICMD0x1B($030E, $00)                                     ;B48CE4
    %AICMD0x0D($FF, $00, $30, $01)                             ;B48CE8
    %AICMD0x1B($030E, $01)                                     ;B48CED
    %AICMD0x0B_SetScriptFlag($01)                                            ;B48CF1
    %AICMD0x12_Jump(pAIScripting0x15_L004)                                   ;B48CF3
pAIScripting0x15_L013:
    %AICMD0x1A($0058, $0188, aAIScriptingData_L081, $00)                     ;B48CF6
    %AICMD0x22($04, $04, $01, aAIScriptingData_L081, $02)                    ;B48CFE
pAIScripting0x15_L014:
    %AICMD0x1F(pAIScripting0x15_L016)                                        ;B48D05
    %AICMD0x12_Jump(pAIScripting0x15_L014)                                   ;B48D08
pAIScripting0x15_L015:
    %AICMD0x1F(pAIScripting0x15_L017)                                        ;B48D0B
    %AICMD0x12_Jump(pAIScripting0x15_L015)                                   ;B48D0E
pAIScripting0x15_L016:
    %AICMD0x1C_ShowDialog($0325, $00)                          ;B48D11
    %AICMD0x12_Jump(pAIScripting0x15_L015)                                   ;B48D15
pAIScripting0x15_L017:
    %AICMD0x1C_ShowDialog($032A, $00)                          ;B48D18
    %AICMD0x12_Jump(pAIScripting0x15_L015)                                   ;B48D1C
pAIScripting0x15_L018:
    %AICMD0x1A($0088, $0058, aAIScriptingData_L080, $00)                     ;B48D1F
pAIScripting0x15_L019:
    %AICMD0x1F(pAIScripting0x15_L020)                                        ;B48D27
    %AICMD0x12_Jump(pAIScripting0x15_L019)                                   ;B48D2A
pAIScripting0x15_L020:
    %AICMD0x1C_ShowDialog($0326, $00)                          ;B48D2D
    %AICMD0x1B($0311, $01)                                     ;B48D31
    %AICMD0x12_Jump(pAIScripting0x15_L019)                                   ;B48D35


pAIScripting0x16:
    dw DATA8_B48D58                                            ;B48D38|        |B48D58;
    dw pAIScripting0x17                                        ;B48D3A|        |B48E05;
    dw pAIScripting0x17                                        ;B48D3C|        |B48E05;
    dw pAIScripting0x17                                        ;B48D3E|        |B48E05;
    dw pAIScripting0x17                                        ;B48D40|        |B48E05;
    dw pAIScripting0x17                                        ;B48D42|        |B48E05;
    dw pAIScripting0x17                                        ;B48D44|        |B48E05;
    dw pAIScripting0x17                                        ;B48D46|        |B48E05;
    dw pAIScripting0x17                                        ;B48D48|        |B48E05;
    dw pAIScripting0x17                                        ;B48D4A|        |B48E05;
    dw pAIScripting0x17                                        ;B48D4C|        |B48E05;
    dw pAIScripting0x17                                        ;B48D4E|        |B48E05;
    dw pAIScripting0x17                                        ;B48D50|        |B48E05;
    dw pAIScripting0x17                                        ;B48D52|        |B48E05;
    dw pAIScripting0x17                                        ;B48D54|        |B48E05;
    dw pAIScripting0x17                                        ;B48D56|        |B48E05;
 
DATA8_B48D58:
    %AICMD0x50()                                               ;B48D58
    %AICMD0x08_EnableAIControl()                               ;B48D59
    %AICMD0x09_StartScript($01, pAIScripting0x16_L001)                                   ;B48D5A
    %AICMD0x38_WaitForFadeIn()                                               ;B48D5E
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 80)                  ;B48D5F
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B48D63
    %AICMD0x0B_SetScriptFlag($00)                                            ;B48D65
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B48D67
    %AICMD0x11_EnableUserControl()                             ;B48D69
    %AICMD0x10_End()                                           ;B48D6A
pAIScripting0x16_L001:
    %AICMD0x1A($0078, $01A8, aAIScriptingData_L027, $02)                     ;B48D6B
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B48D73
    %AICMD0x1D_ShowDialog($0321, $00)                          ;B48D75
    %AICMD0x20_JumpIfChoice(0, pAIScripting0x16_L003)                        ;B48D79
    %AICMD0x20_JumpIfChoice(1, pAIScripting0x16_L007)                        ;B48D7D
    %AICMD0x12_Jump(pAIScripting0x16_L002)                                   ;B48D81
pAIScripting0x16_L002:
    %AICMD0x1B($025F, $00)                                     ;B48D84
    %AICMD0x0D($FF, $00, $90, $01)                             ;B48D88
    %AICMD0x0B_SetScriptFlag($01)                                            ;B48D8D
    %AICMD0x10_End()                                           ;B48D8F
pAIScripting0x16_L003:
    %AICMD0x1B($025D, $00)                                     ;B48D90
    %AICMD0x0D($00, $FF, $30, $01)                             ;B48D94
    %AICMD0x1B($025F, $01)                                     ;B48D99
    %AICMD0x0D($01, $00, $A8, $01)                             ;B48D9D
    %AICMD0x13_Wait(60)                                        ;B48DA2
    %AICMD0x1B($025F, $00)                                     ;B48DA5
    %AICMD0x0D($FF, $00, $A8, $01)                             ;B48DA9
    %AICMD0x1B($025B, $00)                                     ;B48DAE
    %AICMD0x0D($00, $01, $30, $01)                             ;B48DB2
    %AICMD0x1B($025E, $01)                                     ;B48DB7
    %AICMD0x1C_ShowDialog($0322, $00)                          ;B48DBB
    %AICMD0x15_JumpIfEquals8($800921, 3, pAIScripting0x16_L004)              ;B48DBF
    %AICMD0x15_JumpIfEquals8($800923, 3, pAIScripting0x16_L005)              ;B48DC6
    %AICMD0x12_Jump(pAIScripting0x16_L006)                                   ;B48DCD
pAIScripting0x16_L004:
    %AICMD0x47_SetValue8($800921, 0)                           ;B48DD0
    %AICMD0x12_Jump(pAIScripting0x16_L006)                                   ;B48DD5
pAIScripting0x16_L005:
    %AICMD0x47_SetValue8($800923, 0)                           ;B48DD8
    %AICMD0x12_Jump(pAIScripting0x16_L006)                                   ;B48DDD
pAIScripting0x16_L006:
    %AICMD0x28_ClearBit(strcShedItems.row1, $02)                        ;B48DE0
    %AICMD0x23_OrWithIndexedValue(strcFlags.event3, $0F)       ;B48DE5
    %AICMD0x41_AddValue16(nPlayerHappiness, 20)                ;B48DEA
    %AICMD0x12_Jump(pAIScripting0x16_L002)                                   ;B48DF0
pAIScripting0x16_L007:
    %AICMD0x1C_ShowDialog($0323, $00)                          ;B48DF3
    %AICMD0x23_OrWithIndexedValue(strcFlags.event4, $02)       ;B48DF7
    %AICMD0x41_AddValue16(nPlayerHappiness, -20)               ;B48DFC
    %AICMD0x12_Jump(pAIScripting0x16_L002)                                   ;B48E02


pAIScripting0x17:
    dw DATA8_B48E25                                            ;B48E05|        |B48E25;
    dw pAIScripting0x18                                        ;B48E07|        |B48EC5;
    dw pAIScripting0x18                                        ;B48E09|        |B48EC5;
    dw pAIScripting0x18                                        ;B48E0B|        |B48EC5;
    dw pAIScripting0x18                                        ;B48E0D|        |B48EC5;
    dw pAIScripting0x18                                        ;B48E0F|        |B48EC5;
    dw pAIScripting0x18                                        ;B48E11|        |B48EC5;
    dw pAIScripting0x18                                        ;B48E13|        |B48EC5;
    dw pAIScripting0x18                                        ;B48E15|        |B48EC5;
    dw pAIScripting0x18                                        ;B48E17|        |B48EC5;
    dw pAIScripting0x18                                        ;B48E19|        |B48EC5;
    dw pAIScripting0x18                                        ;B48E1B|        |B48EC5;
    dw pAIScripting0x18                                        ;B48E1D|        |B48EC5;
    dw pAIScripting0x18                                        ;B48E1F|        |B48EC5;
    dw pAIScripting0x18                                        ;B48E21|        |B48EC5;
    dw pAIScripting0x18                                        ;B48E23|        |B48EC5;
 
DATA8_B48E25:
    %AICMD0x00_SetMusic($0A, $B4)                              ;B48E25
    %AICMD0x08_EnableAIControl()                               ;B48E28
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B48E29
    %AICMD0x09_StartScript($01, pAIScripting0x17_L001)                                   ;B48E2B
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B48E2F
    %AICMD0x11_EnableUserControl()                             ;B48E31
    %AICMD0x10_End()                                           ;B48E32
pAIScripting0x17_L001:
    %AICMD0x1A($0068, $0218, aAIScriptingData_L088, $00)                     ;B48E33
    %AICMD0x1B($0315, $00)                                     ;B48E3B
    %AICMD0x0D($00, $03, $10, $01)                             ;B48E3F
    %AICMD0x09_StartScript($02, pAIScripting0x17_L005)                                   ;B48E44
    %AICMD0x13_Wait(30)                                        ;B48E48
    %AICMD0x1D_ShowDialog($031E, $00)                          ;B48E4B
    %AICMD0x20_JumpIfChoice(0, pAIScripting0x17_L002)                        ;B48E4F
    %AICMD0x20_JumpIfChoice(1, pAIScripting0x17_L003)                        ;B48E53
    %AICMD0x12_Jump(pAIScripting0x17_L004)                                   ;B48E57
pAIScripting0x17_L002:
    %AICMD0x25_RemoveActor($02)                                            ;B48E5A
    %AICMD0x09_StartScript($02, pAIScripting0x17_L006)                                   ;B48E5C
    %AICMD0x1C_ShowDialog($031F, $00)                          ;B48E60
    %AICMD0x23_OrWithIndexedValue(strcFlags.event4, $03)       ;B48E64
    %AICMD0x41_AddValue16(nPlayerHappiness, -30)               ;B48E69
    %AICMD0x12_Jump(pAIScripting0x17_L004)                                   ;B48E6F
pAIScripting0x17_L003:
    %AICMD0x1C_ShowDialog($0320, $00)                          ;B48E72
    %AICMD0x28_ClearBit(strcShedItems.row1, $03)                        ;B48E76
    %AICMD0x47_SetValue8($800921, 20)                          ;B48E7B
    %AICMD0x41_AddValue16(nPlayerHappiness, 20)                ;B48E80
    %AICMD0x12_Jump(pAIScripting0x17_L004)                                   ;B48E86
pAIScripting0x17_L004:
    %AICMD0x13_Wait(120)                                       ;B48E89
    %AICMD0x1B($0316, $00)                                     ;B48E8C
    %AICMD0x0B_SetScriptFlag($00)                                            ;B48E90
    %AICMD0x37()                                               ;B48E92
    %AICMD0x10_End()                                           ;B48E93
pAIScripting0x17_L005:
    %AICMD0x13_Wait(30)                                        ;B48E94
    %AICMD0x1A($0068, $0238, aAIScriptingData_L138, $00)                     ;B48E97
    %AICMD0x0D($00, $FF, $20, $04)                             ;B48E9F
    %AICMD0x0D($00, $01, $30, $01)                             ;B48EA4
    %AICMD0x13_Wait(60)                                        ;B48EA9
    %AICMD0x37()                                               ;B48EAC
    %AICMD0x10_End()                                           ;B48EAD
pAIScripting0x17_L006:
    %AICMD0x1A($0068, $0238, aAIScriptingData_L137, $00)                     ;B48EAE
    %AICMD0x0D($00, $FF, $20, $04)                             ;B48EB6
    %AICMD0x0D($00, $01, $30, $01)                             ;B48EBB
    %AICMD0x13_Wait(60)                                        ;B48EC0
    %AICMD0x37()                                               ;B48EC3
    %AICMD0x10_End()                                           ;B48EC4


pAIScripting0x18:
    dw DATA8_B48EE5                                            ;B48EC5|        |B48EE5;
    dw pAIScripting0x19                                        ;B48EC7|        |B48F95;
    dw pAIScripting0x19                                        ;B48EC9|        |B48F95;
    dw pAIScripting0x19                                        ;B48ECB|        |B48F95;
    dw pAIScripting0x19                                        ;B48ECD|        |B48F95;
    dw pAIScripting0x19                                        ;B48ECF|        |B48F95;
    dw pAIScripting0x19                                        ;B48ED1|        |B48F95;
    dw pAIScripting0x19                                        ;B48ED3|        |B48F95;
    dw pAIScripting0x19                                        ;B48ED5|        |B48F95;
    dw pAIScripting0x19                                        ;B48ED7|        |B48F95;
    dw pAIScripting0x19                                        ;B48ED9|        |B48F95;
    dw pAIScripting0x19                                        ;B48EDB|        |B48F95;
    dw pAIScripting0x19                                        ;B48EDD|        |B48F95;
    dw pAIScripting0x19                                        ;B48EDF|        |B48F95;
    dw pAIScripting0x19                                        ;B48EE1|        |B48F95;
    dw pAIScripting0x19                                        ;B48EE3|        |B48F95;
 
DATA8_B48EE5:
    %AICMD0x09_StartScript($01, pAIScripting0x18_L003)                                   ;B48EE5
    %AICMD0x38_WaitForFadeIn()                                               ;B48EE9
    %AICMD0x10_End()                                           ;B48EEA
pAIScripting0x18_L001:
    %AICMD0x15_JumpIfEquals8(nCurrentTimeID, 18, pAIScripting0x18_L002)      ;B48EEB
    %AICMD0x13_Wait(1)                                         ;B48EF2
    %AICMD0x12_Jump(pAIScripting0x18_L001)                                   ;B48EF5
pAIScripting0x18_L002:
    %AICMD0x10_End()                                           ;B48EF8
pAIScripting0x18_L003:
    %AICMD0x15_JumpIfEquals8(nCurrentTimeID, 18, pAIScripting0x18_L012)      ;B48EF9
    %AICMD0x1A($0098, $01A8, aAIScriptingData_L082, $01)                     ;B48F00
pAIScripting0x18_L004:
    %AICMD0x2D_JumpOnInteract(pAIScripting0x18_L006, pAIScripting0x18_L007)                               ;B48F08
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 18, 24, pAIScripting0x18_L011) ;B48F0D
    %AICMD0x12_Jump(pAIScripting0x18_L004)                                   ;B48F15
pAIScripting0x18_L005:
    %AICMD0x2D_JumpOnInteract(pAIScripting0x18_L010, pAIScripting0x18_L007)                               ;B48F18
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 18, 24, pAIScripting0x18_L011) ;B48F1D
    %AICMD0x12_Jump(pAIScripting0x18_L005)                                   ;B48F25
pAIScripting0x18_L006:
    %AICMD0x1C_ShowDialog($032B, $00)                          ;B48F28
    %AICMD0x12_Jump(pAIScripting0x18_L005)                                   ;B48F2C
pAIScripting0x18_L007:
    %AICMD0x15_JumpIfEquals8($80091E, 1, pAIScripting0x18_L008)              ;B48F2F
    %AICMD0x15_JumpIfEquals8($80091E, 2, pAIScripting0x18_L009)              ;B48F36
    %AICMD0x1C_ShowDialog($032F, $00)                          ;B48F3D
    %AICMD0x12_Jump(pAIScripting0x18_L004)                                   ;B48F41
pAIScripting0x18_L008:
    %AICMD0x1B($0309, $01)                                     ;B48F44
    %AICMD0x1C_ShowDialog($032D, $00)                          ;B48F48
    %AICMD0x23_OrWithIndexedValue(strcFlags.event4, $08)       ;B48F4C
    %AICMD0x41_AddValue16(nPlayerHappiness, 20)                ;B48F51
    %AICMD0x12_Jump(pAIScripting0x18_L011)                                   ;B48F57
pAIScripting0x18_L009:
    %AICMD0x1C_ShowDialog($032E, $00)                          ;B48F5A
    %AICMD0x41_AddValue16(nPlayerHappiness, -20)               ;B48F5E
    %AICMD0x12_Jump(pAIScripting0x18_L005)                                   ;B48F64
pAIScripting0x18_L010:
    %AICMD0x1C_ShowDialog($032C, $00)                          ;B48F67
    %AICMD0x12_Jump(pAIScripting0x18_L005)                                   ;B48F6B
pAIScripting0x18_L011:
    %AICMD0x1B($030E, $01)                                     ;B48F6E
    %AICMD0x0D($02, $FE, $04, $01)                             ;B48F72
    %AICMD0x0D($02, $02, $04, $01)                             ;B48F77
    %AICMD0x1B($030E, $01)                                     ;B48F7C
    %AICMD0x0D($01, $00, $48, $01)                             ;B48F80
    %AICMD0x1B($030E, $01)                                     ;B48F85
    %AICMD0x0D($02, $FE, $06, $01)                             ;B48F89
    %AICMD0x0D($02, $02, $04, $01)                             ;B48F8E
    %AICMD0x37()                                               ;B48F93
pAIScripting0x18_L012:
    %AICMD0x10_End()                                           ;B48F94


pAIScripting0x19:
    dw DATA8_B48FB5                                            ;B48F95|        |B48FB5;
    dw DATA8_B48FDE                                            ;B48F97|        |B48FDE;
    dw pAIScripting0x1A                                        ;B48F99|        |B490D3;
    dw pAIScripting0x1A                                        ;B48F9B|        |B490D3;
    dw pAIScripting0x1A                                        ;B48F9D|        |B490D3;
    dw pAIScripting0x1A                                        ;B48F9F|        |B490D3;
    dw pAIScripting0x1A                                        ;B48FA1|        |B490D3;
    dw pAIScripting0x1A                                        ;B48FA3|        |B490D3;
    dw pAIScripting0x1A                                        ;B48FA5|        |B490D3;
    dw pAIScripting0x1A                                        ;B48FA7|        |B490D3;
    dw pAIScripting0x1A                                        ;B48FA9|        |B490D3;
    dw pAIScripting0x1A                                        ;B48FAB|        |B490D3;
    dw pAIScripting0x1A                                        ;B48FAD|        |B490D3;
    dw pAIScripting0x1A                                        ;B48FAF|        |B490D3;
    dw pAIScripting0x1A                                        ;B48FB1|        |B490D3;
    dw pAIScripting0x1A                                        ;B48FB3|        |B490D3;
 
DATA8_B48FB5:
 
    %AICMD0x50()                                               ;B48FB5
    %AICMD0x08_EnableAIControl()                               ;B48FB6
    %AICMD0x09_StartScript($01, pAIScripting0x19_L001)                                   ;B48FB7
    %AICMD0x38_WaitForFadeIn()                                               ;B48FBB
    %AICMD0x0B_SetScriptFlag($00)                                            ;B48FBC
    %AICMD0x10_End()                                           ;B48FBE
pAIScripting0x19_L001:
    %AICMD0x1A($0088, $01B8, aAIScriptingData_L045, $01)                     ;B48FBF
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B48FC7
    %AICMD0x0D($00, $FF, $50, $01)                             ;B48FC9
    %AICMD0x1C_ShowDialog($01CC, $00)                          ;B48FCE
    %AICMD0x1B($0290, $00)                                     ;B48FD2
    %AICMD0x0D($00, $01, $60, $01)                             ;B48FD6
    %AICMD0x37()                                               ;B48FDB
    %AICMD0x11_EnableUserControl()                             ;B48FDC
    %AICMD0x10_End()                                           ;B48FDD


DATA8_B48FDE:
    %AICMD0x50()                                               ;B48FDE
    %AICMD0x00_SetMusic($0E, $B4)                              ;B48FDF
    %AICMD0x08_EnableAIControl()                               ;B48FE2
    %AICMD0x09_StartScript($01, pAIScripting0x19_L008)                                   ;B48FE3
    %AICMD0x09_StartScript($02, pAIScripting0x19_L002)                                   ;B48FE7
    %AICMD0x09_StartScript($03, pAIScripting0x19_L004)                                   ;B48FEB
    %AICMD0x09_StartScript($04, pAIScripting0x19_L006)                                   ;B48FEF
    %AICMD0x38_WaitForFadeIn()                                               ;B48FF3
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 24)                  ;B48FF4
    %AICMD0x0B_SetScriptFlag($00)                                            ;B48FF8
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 48)                    ;B48FFA
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B48FFE
    %AICMD0x0B_SetScriptFlag($01)                                            ;B49000
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 20)                  ;B49002
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 51)                    ;B49006
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4900A
    %AICMD0x0B_SetScriptFlag($02)                                            ;B4900C
    %AICMD0x0C_WaitForScriptFlag($03)                                            ;B4900E
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B49010
    %AICMD0x0C_WaitForScriptFlag($04)                                            ;B49012
    %AICMD0x19($0007, $00)                                     ;B49014
    %AICMD0x13_Wait(60)                                        ;B49018
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4901B
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 64)                  ;B4901D
    %AICMD0x0B_SetScriptFlag($05)                                            ;B49021
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 48)                 ;B49023
    %AICMD0x40_DisableTileInteractions()                       ;B49027
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 64)                  ;B49028
    %AICMD0x0C_WaitForScriptFlag($06)                                            ;B4902C
    %AICMD0x13_Wait(60)                                        ;B4902E
    %AICMD0x23_OrWithIndexedValue(strcFlags.event4, $0D)       ;B49031
    %AICMD0x28_ClearBit(strcFlags.event4, $0C)                          ;B49036
    %AICMD0x3C()                                               ;B4903B
    %AICMD0x10_End()                                           ;B4903C
pAIScripting0x19_L002:
    %AICMD0x1A($0058, $00C8, aAIScriptingData_L027, $02)                     ;B4903D
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B49045
    %AICMD0x1C_ShowDialog($01D3, $00)                          ;B49047
pAIScripting0x19_L003:
    %AICMD0x13_Wait(1)                                         ;B4904B
    %AICMD0x12_Jump(pAIScripting0x19_L003)                                   ;B4904E
pAIScripting0x19_L004:
    %AICMD0x1A($00A8, $0098, aAIScriptingData_L027, $03)                     ;B49051
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B49059
    %AICMD0x1C_ShowDialog($01D4, $00)                          ;B4905B
pAIScripting0x19_L005:
    %AICMD0x13_Wait(1)                                         ;B4905F
    %AICMD0x12_Jump(pAIScripting0x19_L005)                                   ;B49062
pAIScripting0x19_L006:
    %AICMD0x1A($0068, $0068, aAIScriptingData_L027, $00)                     ;B49065
    %AICMD0x0C_WaitForScriptFlag($02)                                            ;B4906D
    %AICMD0x1B($025F, $00)                                     ;B4906F
    %AICMD0x1C_ShowDialog($01D5, $00)                          ;B49073
    %AICMD0x0B_SetScriptFlag($03)                                            ;B49077
    %AICMD0x1B($025A, $00)                                     ;B49079
pAIScripting0x19_L007:
    %AICMD0x13_Wait(1)                                         ;B4907D
    %AICMD0x12_Jump(pAIScripting0x19_L007)                                   ;B49080
pAIScripting0x19_L008:
    %AICMD0x1A($0028, $0068, aAIScriptingData_L011, $02)                     ;B49083
    %AICMD0x0C_WaitForScriptFlag($03)                                            ;B4908B
    %AICMD0x1B($0223, $01)                                     ;B4908D
    %AICMD0x0D($01, $00, $22, $01)                             ;B49091
    %AICMD0x1C_ShowDialog($01D6, $00)                          ;B49096
    %AICMD0x1B($0225, $01)                                     ;B4909A
    %AICMD0x13_Wait(60)                                        ;B4909E
    %AICMD0x1B($0223, $01)                                     ;B490A1
    %AICMD0x0D($FF, $00, $04, $01)                             ;B490A5
    %AICMD0x41_AddValue16(nLove_Maria, 50)                     ;B490AA
    %AICMD0x0B_SetScriptFlag($04)                                            ;B490B0
    %AICMD0x0C_WaitForScriptFlag($05)                                            ;B490B2
    %AICMD0x1B($021F, $00)                                     ;B490B4
    %AICMD0x0D($00, $01, $40, $01)                             ;B490B8
    %AICMD0x1B($0223, $01)                                     ;B490BD
    %AICMD0x0D($01, $00, $30, $01)                             ;B490C1
    %AICMD0x1B($021F, $00)                                     ;B490C6
    %AICMD0x0D($00, $01, $40, $01)                             ;B490CA
    %AICMD0x0B_SetScriptFlag($06)                                            ;B490CF
    %AICMD0x37()                                               ;B490D1
    %AICMD0x10_End()                                           ;B490D2


pAIScripting0x1A:
    dw DATA8_B490F3                                            ;B490D3|        |B490F3;
    dw DATA8_B4911C                                            ;B490D5|        |B4911C;
    dw pAIScripting0x1B                                        ;B490D7|        |B491B3;
    dw pAIScripting0x1B                                        ;B490D9|        |B491B3;
    dw pAIScripting0x1B                                        ;B490DB|        |B491B3;
    dw pAIScripting0x1B                                        ;B490DD|        |B491B3;
    dw pAIScripting0x1B                                        ;B490DF|        |B491B3;
    dw pAIScripting0x1B                                        ;B490E1|        |B491B3;
    dw pAIScripting0x1B                                        ;B490E3|        |B491B3;
    dw pAIScripting0x1B                                        ;B490E5|        |B491B3;
    dw pAIScripting0x1B                                        ;B490E7|        |B491B3;
    dw pAIScripting0x1B                                        ;B490E9|        |B491B3;
    dw pAIScripting0x1B                                        ;B490EB|        |B491B3;
    dw pAIScripting0x1B                                        ;B490ED|        |B491B3;
    dw pAIScripting0x1B                                        ;B490EF|        |B491B3;
    dw pAIScripting0x1B                                        ;B490F1|        |B491B3;
 
DATA8_B490F3:
 
    %AICMD0x50()                                               ;B490F3
    %AICMD0x08_EnableAIControl()                               ;B490F4
    %AICMD0x09_StartScript($01, pAIScripting0x1A_L001)                                   ;B490F5
    %AICMD0x38_WaitForFadeIn()                                               ;B490F9
    %AICMD0x0B_SetScriptFlag($00)                                            ;B490FA
    %AICMD0x10_End()                                           ;B490FC
pAIScripting0x1A_L001:
    %AICMD0x1A($0088, $01B8, aAIScriptingData_L016, $01)                     ;B490FD
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B49105
    %AICMD0x0D($00, $FF, $50, $01)                             ;B49107
    %AICMD0x1C_ShowDialog($01DB, $00)                          ;B4910C
    %AICMD0x1B($0227, $00)                                     ;B49110
    %AICMD0x0D($00, $01, $60, $01)                             ;B49114
    %AICMD0x37()                                               ;B49119
    %AICMD0x11_EnableUserControl()                             ;B4911A
    %AICMD0x10_End()                                           ;B4911B


DATA8_B4911C:
    %AICMD0x50()                                               ;B4911C
    %AICMD0x00_SetMusic($0E, $B4)                              ;B4911D
    %AICMD0x02_FreezeTime()                                    ;B49120
    %AICMD0x03_SetHour($07)                                    ;B49121
    %AICMD0x05_SetTransferPosition(136, 456)                   ;B49123
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B49128
    %AICMD0x08_EnableAIControl()                               ;B4912A
    %AICMD0x09_StartScript($01, pAIScripting0x1A_L002)                                   ;B4912B
    %AICMD0x09_StartScript($02, pAIScripting0x1A_L003)                                   ;B4912F
    %AICMD0x3B($24)                                            ;B49133
    %AICMD0x38_WaitForFadeIn()                                               ;B49135
    %AICMD0x0B_SetScriptFlag($03)                                            ;B49136
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 64)                    ;B49138
    %AICMD0x3F_ThrowCarriedItem()                              ;B4913C
    %AICMD0x0B_SetScriptFlag($00)                                            ;B4913D
    %AICMD0x0C_WaitForScriptFlag($02)                                            ;B4913F
    %AICMD0x40_DisableTileInteractions()                       ;B49141
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 96)                  ;B49142
    %AICMD0x13_Wait(60)                                        ;B49146
    %AICMD0x23_OrWithIndexedValue(strcFlags.event4, $0F)       ;B49149
    %AICMD0x28_ClearBit(strcFlags.event4, $0E)                          ;B4914E
    %AICMD0x3C()                                               ;B49153
    %AICMD0x10_End()                                           ;B49154
pAIScripting0x1A_L002:
    %AICMD0x1A($0088, $0178, aAIScriptingData_L015, $00)                     ;B49155
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B4915D
    %AICMD0x1B($0226, $00)                                     ;B4915F
    %AICMD0x13_Wait(60)                                        ;B49163
    %AICMD0x1C_ShowDialog($01E1, $00)                          ;B49166
    %AICMD0x1B($022B, $01)                                     ;B4916A
    %AICMD0x0D($01, $00, $10, $01)                             ;B4916E
    %AICMD0x1B($0227, $00)                                     ;B49173
    %AICMD0x0D($00, $01, $10, $01)                             ;B49177
    %AICMD0x1B($0226, $00)                                     ;B4917C
    %AICMD0x13_Wait(20)                                        ;B49180
    %AICMD0x1B($022D, $00)                                     ;B49183
    %AICMD0x13_Wait(60)                                        ;B49187
    %AICMD0x41_AddValue16(nLove_Ann, 50)                       ;B4918A
    %AICMD0x1B($0227, $00)                                     ;B49190
    %AICMD0x0D($00, $01, $50, $01)                             ;B49194
    %AICMD0x0B_SetScriptFlag($01)                                            ;B49199
    %AICMD0x37()                                               ;B4919B
    %AICMD0x10_End()                                           ;B4919C
pAIScripting0x1A_L003:
    %AICMD0x1A($0028, $0168, aAIScriptingData_L046, $02)                     ;B4919D
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B491A5
    %AICMD0x1C_ShowDialog($01E2, $00)                          ;B491A7
    %AICMD0x0B_SetScriptFlag($02)                                            ;B491AB
pAIScripting0x1A_L004:
    %AICMD0x13_Wait(1)                                         ;B491AD
    %AICMD0x12_Jump(pAIScripting0x1A_L004)                                   ;B491B0


pAIScripting0x1B:
    dw DATA8_B491D3                                            ;B491B3|        |B491D3;
    dw DATA8_B49210                                            ;B491B5|        |B49210;
    dw pAIScripting0x1C                                        ;B491B7|        |B492D2;
    dw pAIScripting0x1C                                        ;B491B9|        |B492D2;
    dw pAIScripting0x1C                                        ;B491BB|        |B492D2;
    dw pAIScripting0x1C                                        ;B491BD|        |B492D2;
    dw pAIScripting0x1C                                        ;B491BF|        |B492D2;
    dw pAIScripting0x1C                                        ;B491C1|        |B492D2;
    dw pAIScripting0x1C                                        ;B491C3|        |B492D2;
    dw pAIScripting0x1C                                        ;B491C5|        |B492D2;
    dw pAIScripting0x1C                                        ;B491C7|        |B492D2;
    dw pAIScripting0x1C                                        ;B491C9|        |B492D2;
    dw pAIScripting0x1C                                        ;B491CB|        |B492D2;
    dw pAIScripting0x1C                                        ;B491CD|        |B492D2;
    dw pAIScripting0x1C                                        ;B491CF|        |B492D2;
    dw pAIScripting0x1C                                        ;B491D1|        |B492D2;
 
DATA8_B491D3:
 
    %AICMD0x50()                                               ;B491D3
    %AICMD0x08_EnableAIControl()                               ;B491D4
    %AICMD0x09_StartScript($01, pAIScripting0x1B_L001)                                   ;B491D5
    %AICMD0x38_WaitForFadeIn()                                               ;B491D9
    %AICMD0x0B_SetScriptFlag($00)                                            ;B491DA
    %AICMD0x10_End()                                           ;B491DC
pAIScripting0x1B_L001:
    %AICMD0x1A($0088, $01B8, aAIScriptingData_L047, $01)                     ;B491DD
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B491E5
    %AICMD0x0D($00, $FF, $50, $01)                             ;B491E7
    %AICMD0x1B($029B, $01)                                     ;B491EC
    %AICMD0x13_Wait(10)                                        ;B491F0
    %AICMD0x1B($029B, $00)                                     ;B491F3
    %AICMD0x13_Wait(10)                                        ;B491F7
    %AICMD0x1B($0299, $00)                                     ;B491FA
    %AICMD0x1C_ShowDialog($01E3, $00)                          ;B491FE
    %AICMD0x1B($0297, $00)                                     ;B49202
    %AICMD0x0D($00, $01, $60, $01)                             ;B49206
    %AICMD0x0B_SetScriptFlag($01)                                            ;B4920B
    %AICMD0x37()                                               ;B4920D
    %AICMD0x11_EnableUserControl()                             ;B4920E
    %AICMD0x10_End()                                           ;B4920F


DATA8_B49210:
    %AICMD0x00_SetMusic($0E, $B4)                              ;B49210
    %AICMD0x09_StartScript($01, pAIScripting0x1B_L003)                                   ;B49213
    %AICMD0x38_WaitForFadeIn()                                               ;B49217
    %AICMD0x11_EnableUserControl()                             ;B49218
    %AICMD0x10_End()                                           ;B49219
pAIScripting0x1B_L002:
    %AICMD0x13_Wait(1)                                         ;B4921A
    %AICMD0x12_Jump(pAIScripting0x1B_L002)                                   ;B4921D
    %AICMD0x10_End()                                           ;B49220
pAIScripting0x1B_L003:
    %AICMD0x1A($0038, $00F8, aAIScriptingData_L139, $00)                     ;B49221
    %AICMD0x12_Jump(pAIScripting0x1B_L004)                                   ;B49229
pAIScripting0x1B_L004:
    %AICMD0x2D_JumpOnInteract(pAIScripting0x1B_L006, pAIScripting0x1B_L008)                               ;B4922C
    %AICMD0x12_Jump(pAIScripting0x1B_L004)                                   ;B49231
pAIScripting0x1B_L005:
    %AICMD0x2D_JumpOnInteract(pAIScripting0x1B_L007, pAIScripting0x1B_L008)                               ;B49234
    %AICMD0x12_Jump(pAIScripting0x1B_L005)                                   ;B49239
pAIScripting0x1B_L006:
    %AICMD0x1C_ShowDialog($01E5, $00)                          ;B4923C
    %AICMD0x12_Jump(pAIScripting0x1B_L005)                                   ;B49240
pAIScripting0x1B_L007:
    %AICMD0x1C_ShowDialog($01E8, $00)                          ;B49243
    %AICMD0x12_Jump(pAIScripting0x1B_L005)                                   ;B49247
pAIScripting0x1B_L008:
    %AICMD0x43_JumpIfEqual16($80091E, 24, pAIScripting0x1B_L009)             ;B4924A
    %AICMD0x1C_ShowDialog($01E8, $00)                          ;B49252
    %AICMD0x12_Jump(pAIScripting0x1B_L005)                                   ;B49256
pAIScripting0x1B_L009:
    %AICMD0x08_EnableAIControl()                               ;B49259
    %AICMD0x1B($024F, $01)                                     ;B4925A
    %AICMD0x1C_ShowDialog($01E7, $00)                          ;B4925E
    %AICMD0x1B($0252, $01)                                     ;B49262
    %AICMD0x13_Wait(90)                                        ;B49266
    %AICMD0x1B($024F, $01)                                     ;B49269
    %AICMD0x41_AddValue16(nLove_Nina, 50)                      ;B4926D
    %AICMD0x0B_SetScriptFlag($00)                                            ;B49273
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B49275
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 48)                 ;B49277
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4927B
    %AICMD0x1B($0250, $01)                                     ;B4927D
    %AICMD0x0D($01, $00, $30, $01)                             ;B49281
    %AICMD0x1B($024C, $00)                                     ;B49286
    %AICMD0x0D($00, $01, $20, $02)                             ;B4928A
    %AICMD0x13_Wait(10)                                        ;B4928F
    %AICMD0x0D($00, $01, $30, $01)                             ;B49292
    %AICMD0x13_Wait(10)                                        ;B49297
    %AICMD0x0D($01, $01, $18, $02)                             ;B4929A
    %AICMD0x13_Wait(10)                                        ;B4929F
    %AICMD0x0D($00, $01, $46, $01)                             ;B492A2
    %AICMD0x1B($0347, $00)                                     ;B492A7
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 68)                   ;B492AB
    %AICMD0x19($0024, $00)                                     ;B492AF
    %AICMD0x13_Wait(60)                                        ;B492B3
    %AICMD0x1C_ShowDialog($0147, $00)                          ;B492B6
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B492BA
    %AICMD0x13_Wait(30)                                        ;B492BC
    %AICMD0x1B($024E, $00)                                     ;B492BF
    %AICMD0x13_Wait(60)                                        ;B492C3
    %AICMD0x23_OrWithIndexedValue(strcFlags.event5, $01)       ;B492C6
    %AICMD0x28_ClearBit(strcFlags.event5, $00)                          ;B492CB
    %AICMD0x3C()                                               ;B492D0
    %AICMD0x10_End()                                           ;B492D1


pAIScripting0x1C:
    dw DATA8_B492F2                                            ;B492D2|        |B492F2;
    dw DATA8_B4931D                                            ;B492D4|        |B4931D;
    dw DATA8_B49401                                            ;B492D6|        |B49401;
    dw pAIScripting0x1D                                        ;B492D8|        |B4943C;
    dw pAIScripting0x1D                                        ;B492DA|        |B4943C;
    dw pAIScripting0x1D                                        ;B492DC|        |B4943C;
    dw pAIScripting0x1D                                        ;B492DE|        |B4943C;
    dw pAIScripting0x1D                                        ;B492E0|        |B4943C;
    dw pAIScripting0x1D                                        ;B492E2|        |B4943C;
    dw pAIScripting0x1D                                        ;B492E4|        |B4943C;
    dw pAIScripting0x1D                                        ;B492E6|        |B4943C;
    dw pAIScripting0x1D                                        ;B492E8|        |B4943C;
    dw pAIScripting0x1D                                        ;B492EA|        |B4943C;
    dw pAIScripting0x1D                                        ;B492EC|        |B4943C;
    dw pAIScripting0x1D                                        ;B492EE|        |B4943C;
    dw pAIScripting0x1D                                        ;B492F0|        |B4943C;
 
DATA8_B492F2:
 
    %AICMD0x50()                                               ;B492F2
    %AICMD0x08_EnableAIControl()                               ;B492F3
    %AICMD0x09_StartScript($01, pAIScripting0x1C_L001)                                   ;B492F4
    %AICMD0x38_WaitForFadeIn()                                               ;B492F8
    %AICMD0x0B_SetScriptFlag($00)                                            ;B492F9
    %AICMD0x10_End()                                           ;B492FB
pAIScripting0x1C_L001:
    %AICMD0x1A($0088, $01B8, aAIScriptingData_L022, $01)                     ;B492FC
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B49304
    %AICMD0x0D($00, $FF, $50, $01)                             ;B49306
    %AICMD0x1C_ShowDialog($01EB, $00)                          ;B4930B
    %AICMD0x1B($023D, $00)                                     ;B4930F
    %AICMD0x0D($00, $01, $60, $01)                             ;B49313
    %AICMD0x0B_SetScriptFlag($01)                                            ;B49318
    %AICMD0x37()                                               ;B4931A
    %AICMD0x11_EnableUserControl()                             ;B4931B
    %AICMD0x10_End()                                           ;B4931C


DATA8_B4931D:
 
    %AICMD0x00_SetMusic($0E, $B4)                              ;B4931D
    %AICMD0x09_StartScript($0A, pAIScripting0x1C_L002)                                   ;B49320
    %AICMD0x38_WaitForFadeIn()                                               ;B49324
    %AICMD0x10_End()                                           ;B49325
pAIScripting0x1C_L002:
    %AICMD0x1A($029C, $018E, aAIScriptingData_L091, $03)                     ;B49326
pAIScripting0x1C_L003:
    %AICMD0x1F(pAIScripting0x1C_L004)                                        ;B4932E
    %AICMD0x12_Jump(pAIScripting0x1C_L003)                                   ;B49331
pAIScripting0x1C_L004:
    %AICMD0x08_EnableAIControl()                               ;B49334
    %AICMD0x1B($0320, $01)                                     ;B49335
    %AICMD0x0D($01, $FF, $18, $02)                             ;B49339
    %AICMD0x0D($01, $00, $10, $04)                             ;B4933E
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily3, $03)       ;B49343
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 0, pAIScripting0x1C_L005)     ;B49348
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 1, pAIScripting0x1C_L006)     ;B4934F
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 2, pAIScripting0x1C_L007)     ;B49356
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, pAIScripting0x1C_L008)     ;B4935D
pAIScripting0x1C_L005:
    %AICMD0x3D_TeleportToArea(!AREA_WOODSSPRING)               ;B49364
    %AICMD0x12_Jump(pAIScripting0x1C_L009)                                   ;B49366
pAIScripting0x1C_L006:
    %AICMD0x3D_TeleportToArea(!AREA_WOODSSUMMER)               ;B49369
    %AICMD0x12_Jump(pAIScripting0x1C_L009)                                   ;B4936B
pAIScripting0x1C_L007:
    %AICMD0x3D_TeleportToArea(!AREA_WOODSFALL)                 ;B4936E
    %AICMD0x12_Jump(pAIScripting0x1C_L009)                                   ;B49370
pAIScripting0x1C_L008:
    %AICMD0x3D_TeleportToArea(!AREA_WOODSWINTER)               ;B49373
    %AICMD0x12_Jump(pAIScripting0x1C_L009)                                   ;B49375
pAIScripting0x1C_L009:
    %AICMD0x10_End()                                           ;B49378
pAIScripting0x1C_L010:
    %AICMD0x1A($0288, $01F5, aAIScriptingData_L091, $03)                     ;B49379
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B49381
    %AICMD0x1B($0320, $01)                                     ;B49383
    %AICMD0x0D($02, $FF, $20, $02)                             ;B49387
    %AICMD0x0D($01, $FF, $20, $02)                             ;B4938C
    %AICMD0x0D($01, $FF, $50, $01)                             ;B49391
    %AICMD0x0B_SetScriptFlag($02)                                            ;B49396
    %AICMD0x37()                                               ;B49398
    %AICMD0x10_End()                                           ;B49399
pAIScripting0x1C_L011:
    %AICMD0x1A($0208, $0208, aAIScriptingData_L022, $02)                     ;B4939A
    %AICMD0x0D($01, $00, $60, $01)                             ;B493A2
    %AICMD0x1B($0240, $01)                                     ;B493A7
    %AICMD0x13_Wait(90)                                        ;B493AB
    %AICMD0x1C_ShowDialog($01F1, $00)                          ;B493AE
    %AICMD0x0B_SetScriptFlag($01)                                            ;B493B2
    %AICMD0x1B($0242, $00)                                     ;B493B4
    %AICMD0x13_Wait(90)                                        ;B493B8
    %AICMD0x0C_WaitForScriptFlag($02)                                            ;B493BB
    %AICMD0x1B($0240, $01)                                     ;B493BD
    %AICMD0x1C_ShowDialog($01F2, $00)                          ;B493C1
    %AICMD0x1B($0241, $01)                                     ;B493C5
    %AICMD0x0D($01, $00, $14, $01)                             ;B493C9
    %AICMD0x1B($0243, $01)                                     ;B493CE
    %AICMD0x13_Wait(90)                                        ;B493D2
    %AICMD0x41_AddValue16(nLove_Ellen, 50)                     ;B493D5
    %AICMD0x1B($0240, $01)                                     ;B493DB
    %AICMD0x13_Wait(40)                                        ;B493DF
    %AICMD0x1B($0241, $00)                                     ;B493E2
    %AICMD0x0D($FF, $00, $44, $01)                             ;B493E6
    %AICMD0x1B($023D, $00)                                     ;B493EB
    %AICMD0x0D($00, $01, $50, $01)                             ;B493EF
    %AICMD0x1B($0241, $00)                                     ;B493F4
    %AICMD0x0D($FF, $00, $70, $01)                             ;B493F8
    %AICMD0x0B_SetScriptFlag($03)                                            ;B493FD
    %AICMD0x37()                                               ;B493FF
    %AICMD0x10_End()                                           ;B49400


DATA8_B49401:
    %AICMD0x50()                                               ;B49401
    %AICMD0x02_FreezeTime()                                    ;B49402
    %AICMD0x08_EnableAIControl()                               ;B49403
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B49404
    %AICMD0x05_SetTransferPosition(648, 520)                   ;B49406
    %AICMD0x09_StartScript($0A, pAIScripting0x1C_L011)                                   ;B4940B
    %AICMD0x09_StartScript($0B, pAIScripting0x1C_L010)                                   ;B4940F
    %AICMD0x38_WaitForFadeIn()                                               ;B49413
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B49414
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B49416
    %AICMD0x13_Wait(60)                                        ;B49418
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4941B
    %AICMD0x13_Wait(80)                                        ;B4941D
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B49420
    %AICMD0x13_Wait(120)                                       ;B49422
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B49425
    %AICMD0x13_Wait(220)                                       ;B49427
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 48)                  ;B4942A
    %AICMD0x0C_WaitForScriptFlag($03)                                            ;B4942E
    %AICMD0x23_OrWithIndexedValue(strcFlags.event5, $03)       ;B49430
    %AICMD0x28_ClearBit(strcFlags.event5, $02)                          ;B49435
    %AICMD0x3C()                                               ;B4943A
    %AICMD0x10_End()                                           ;B4943B


pAIScripting0x1D:
    dw DATA8_B4945C                                            ;B4943C|        |B4945C;
    dw DATA8_B49499                                            ;B4943E|        |B49499;
    dw DATA8_B49513                                            ;B49440|        |B49513;
    dw DATA8_B4958B                                            ;B49442|        |B4958B;
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
 
DATA8_B4945C:
 
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


DATA8_B49499:
 
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


DATA8_B49513:
 
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


DATA8_B4958B:
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


pAIScripting0x1E:
    dw DATA8_B4969A                                            ;B4967A|        |B4969A;
    dw pAIScripting0x1F                                        ;B4967C|        |B49A3F;
    dw pAIScripting0x1F                                        ;B4967E|        |B49A3F;
    dw pAIScripting0x1F                                        ;B49680|        |B49A3F;
    dw pAIScripting0x1F                                        ;B49682|        |B49A3F;
    dw pAIScripting0x1F                                        ;B49684|        |B49A3F;
    dw pAIScripting0x1F                                        ;B49686|        |B49A3F;
    dw pAIScripting0x1F                                        ;B49688|        |B49A3F;
    dw pAIScripting0x1F                                        ;B4968A|        |B49A3F;
    dw pAIScripting0x1F                                        ;B4968C|        |B49A3F;
    dw pAIScripting0x1F                                        ;B4968E|        |B49A3F;
    dw pAIScripting0x1F                                        ;B49690|        |B49A3F;
    dw pAIScripting0x1F                                        ;B49692|        |B49A3F;
    dw pAIScripting0x1F                                        ;B49694|        |B49A3F;
    dw pAIScripting0x1F                                        ;B49696|        |B49A3F;
    dw pAIScripting0x1F                                        ;B49698|        |B49A3F;
 
DATA8_B4969A:
    %AICMD0x50()                                               ;B4969A
    %AICMD0x00_SetMusic($18, $B4)                              ;B4969B
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $09)       ;B4969E
    %AICMD0x02_FreezeTime()                                    ;B496A3
    %AICMD0x03_SetHour($07)                                    ;B496A4
    %AICMD0x05_SetTransferPosition(360, 152)                   ;B496A6
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B496AB
    %AICMD0x08_EnableAIControl()                               ;B496AD
    %AICMD0x19($00E8, $00)                                     ;B496AE
    %AICMD0x09_StartScript($01, pAIScripting0x1E_L008)                                   ;B496B2
    %AICMD0x09_StartScript($02, pAIScripting0x1E_L024)                                   ;B496B6
    %AICMD0x09_StartScript($03, pAIScripting0x1E_L026)                                   ;B496BA
    %AICMD0x09_StartScript($04, pAIScripting0x1E_L028)                                   ;B496BE
    %AICMD0x09_StartScript($05, pAIScripting0x1E_L030)                                   ;B496C2
    %AICMD0x09_StartScript($06, pAIScripting0x1E_L034)                                   ;B496C6
    %AICMD0x09_StartScript($07, pAIScripting0x1E_L032)                                   ;B496CA
    %AICMD0x09_StartScript($08, pAIScripting0x1E_L036)                                   ;B496CE
    %AICMD0x09_StartScript($09, pAIScripting0x1E_L038)                                   ;B496D2
    %AICMD0x09_StartScript($0A, pAIScripting0x1E_L006)                                   ;B496D6
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 0, pAIScripting0x1E_L001)     ;B496DA
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 1, pAIScripting0x1E_L002)     ;B496E1
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 2, pAIScripting0x1E_L003)     ;B496E8
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, pAIScripting0x1E_L004)     ;B496EF
pAIScripting0x1E_L001:
    %AICMD0x06_SetDestinationArea(!AREA_TOWNSPRING)            ;B496F6
    %AICMD0x12_Jump(pAIScripting0x1E_L005)                                   ;B496F8
pAIScripting0x1E_L002:
    %AICMD0x06_SetDestinationArea(!AREA_TOWNSUMMER)            ;B496FB
    %AICMD0x12_Jump(pAIScripting0x1E_L005)                                   ;B496FD
pAIScripting0x1E_L003:
    %AICMD0x06_SetDestinationArea(!AREA_TOWNFALL)              ;B49700
    %AICMD0x12_Jump(pAIScripting0x1E_L005)                                   ;B49702
pAIScripting0x1E_L004:
    %AICMD0x06_SetDestinationArea(!AREA_TOWNWINTER)            ;B49705
    %AICMD0x12_Jump(pAIScripting0x1E_L005)                                   ;B49707
pAIScripting0x1E_L005:
    %AICMD0x38_WaitForFadeIn()                                               ;B4970A
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B4970B
    %AICMD0x09_StartScript($0B, pAIScripting0x1E_L019)                                   ;B4970D
    %AICMD0x09_StartScript($0C, pAIScripting0x1E_L020)                                   ;B49711
    %AICMD0x09_StartScript($0D, pAIScripting0x1E_L021)                                   ;B49715
    %AICMD0x09_StartScript($0E, pAIScripting0x1E_L022)                                   ;B49719
    %AICMD0x09_StartScript($0F, pAIScripting0x1E_L023)                                   ;B4971D
    %AICMD0x0C_WaitForScriptFlag($03)                                            ;B49721
    %AICMD0x13_Wait(60)                                        ;B49723
    %AICMD0x41_AddValue16(nPlayerHappiness, 50)                ;B49726
    %AICMD0x01_UnfreezeTime()                                  ;B4972C
    %AICMD0x24_NextHourPalette($74)                            ;B4972D
    %AICMD0x13_Wait(180)                                       ;B4972F
    %AICMD0x1C_ShowDialog($01BF, $00)                          ;B49732
    %AICMD0x47_SetValue8($800973, 3)                           ;B49736
    %AICMD0x10_End()                                           ;B4973B
pAIScripting0x1E_L006:
    %AICMD0x1A($0168, $0098, aAIScriptingData_L204, $00)                     ;B4973C
    %AICMD0x13_Wait(180)                                       ;B49744
    %AICMD0x1B($032D, $00)                                     ;B49747
    %AICMD0x29_SetMapScrooling(0, 1, 16)                       ;B4974B
    %AICMD0x0D($00, $01, $10, $01)                             ;B49751
    %AICMD0x1B($032C, $00)                                     ;B49756
    %AICMD0x13_Wait(60)                                        ;B4975A
    %AICMD0x1B($032E, $00)                                     ;B4975D
    %AICMD0x13_Wait(60)                                        ;B49761
    %AICMD0x1B($032F, $00)                                     ;B49764
    %AICMD0x09_StartScript($10, pAIScripting0x1E_L007)                                   ;B49768
    %AICMD0x13_Wait(120)                                       ;B4976C
    %AICMD0x1B($032C, $00)                                     ;B4976F
    %AICMD0x13_Wait(60)                                        ;B49773
    %AICMD0x1B($032D, $00)                                     ;B49776
    %AICMD0x29_SetMapScrooling(0, 1, 48)                       ;B4977A
    %AICMD0x0D($00, $01, $30, $01)                             ;B49780
    %AICMD0x13_Wait(60)                                        ;B49785
    %AICMD0x1B($032C, $00)                                     ;B49788
    %AICMD0x0B_SetScriptFlag($01)                                            ;B4978C
    %AICMD0x10_End()                                           ;B4978E
pAIScripting0x1E_L007:
    %AICMD0x1A($0170, $0090, aAIScriptingData_L205, $00)                     ;B4978F
    %AICMD0x13_Wait(60)                                        ;B49797
    %AICMD0x37()                                               ;B4979A
    %AICMD0x10_End()                                           ;B4979B
pAIScripting0x1E_L008:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $00, pAIScripting0x1E_L009)   ;B4979C
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $01, pAIScripting0x1E_L011)   ;B497A3
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, pAIScripting0x1E_L013)   ;B497AA
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $03, pAIScripting0x1E_L015)   ;B497B1
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $04, pAIScripting0x1E_L017)   ;B497B8
pAIScripting0x1E_L009:
    %AICMD0x1A($0178, $0098, aAIScriptingData_L108, $00)                     ;B497BF
    %AICMD0x13_Wait(180)                                       ;B497C7
    %AICMD0x1B($0331, $00)                                     ;B497CA
    %AICMD0x0D($00, $01, $10, $01)                             ;B497CE
    %AICMD0x1B($0330, $00)                                     ;B497D3
    %AICMD0x13_Wait(64)                                        ;B497D7
    %AICMD0x1B($0332, $00)                                     ;B497DA
    %AICMD0x13_Wait(60)                                        ;B497DE
    %AICMD0x1B($0333, $00)                                     ;B497E1
    %AICMD0x13_Wait(120)                                       ;B497E5
    %AICMD0x1B($0330, $00)                                     ;B497E8
    %AICMD0x13_Wait(60)                                        ;B497EC
    %AICMD0x1B($0331, $00)                                     ;B497EF
    %AICMD0x0D($00, $01, $30, $01)                             ;B497F3
    %AICMD0x0B_SetScriptFlag($02)                                            ;B497F8
pAIScripting0x1E_L010:
    %AICMD0x13_Wait(1)                                         ;B497FA
    %AICMD0x12_Jump(pAIScripting0x1E_L010)                                   ;B497FD
pAIScripting0x1E_L011:
    %AICMD0x1A($0178, $0098, aAIScriptingData_L109, $00)                     ;B49800
    %AICMD0x1B($0335, $00)                                     ;B49808
    %AICMD0x13_Wait(180)                                       ;B4980C
    %AICMD0x0D($00, $01, $10, $01)                             ;B4980F
    %AICMD0x1B($0334, $00)                                     ;B49814
    %AICMD0x13_Wait(60)                                        ;B49818
    %AICMD0x1B($0336, $00)                                     ;B4981B
    %AICMD0x13_Wait(60)                                        ;B4981F
    %AICMD0x1B($0337, $00)                                     ;B49822
    %AICMD0x13_Wait(120)                                       ;B49826
    %AICMD0x1B($0336, $00)                                     ;B49829
    %AICMD0x13_Wait(60)                                        ;B4982D
    %AICMD0x1B($0335, $00)                                     ;B49830
    %AICMD0x0D($00, $01, $30, $01)                             ;B49834
    %AICMD0x0B_SetScriptFlag($02)                                            ;B49839
pAIScripting0x1E_L012:
    %AICMD0x13_Wait(1)                                         ;B4983B
    %AICMD0x12_Jump(pAIScripting0x1E_L012)                                   ;B4983E
pAIScripting0x1E_L013:
    %AICMD0x1A($0178, $0098, aAIScriptingData_L110, $00)                     ;B49841
    %AICMD0x1B($0341, $00)                                     ;B49849
    %AICMD0x13_Wait(180)                                       ;B4984D
    %AICMD0x0D($00, $01, $10, $01)                             ;B49850
    %AICMD0x1B($0340, $00)                                     ;B49855
    %AICMD0x13_Wait(60)                                        ;B49859
    %AICMD0x1B($0342, $00)                                     ;B4985C
    %AICMD0x13_Wait(60)                                        ;B49860
    %AICMD0x1B($0343, $00)                                     ;B49863
    %AICMD0x13_Wait(120)                                       ;B49867
    %AICMD0x1B($0342, $00)                                     ;B4986A
    %AICMD0x13_Wait(60)                                        ;B4986E
    %AICMD0x1B($0341, $00)                                     ;B49871
    %AICMD0x0D($00, $01, $30, $01)                             ;B49875
    %AICMD0x0B_SetScriptFlag($02)                                            ;B4987A
pAIScripting0x1E_L014:
    %AICMD0x13_Wait(1)                                         ;B4987C
    %AICMD0x12_Jump(pAIScripting0x1E_L014)                                   ;B4987F
pAIScripting0x1E_L015:
    %AICMD0x1A($0178, $0098, aAIScriptingData_L111, $00)                     ;B49882
    %AICMD0x1B($0339, $00)                                     ;B4988A
    %AICMD0x13_Wait(180)                                       ;B4988E
    %AICMD0x0D($00, $01, $10, $01)                             ;B49891
    %AICMD0x1B($0338, $00)                                     ;B49896
    %AICMD0x13_Wait(60)                                        ;B4989A
    %AICMD0x1B($033A, $00)                                     ;B4989D
    %AICMD0x13_Wait(60)                                        ;B498A1
    %AICMD0x1B($033B, $00)                                     ;B498A4
    %AICMD0x13_Wait(120)                                       ;B498A8
    %AICMD0x1B($0338, $00)                                     ;B498AB
    %AICMD0x13_Wait(60)                                        ;B498AF
    %AICMD0x1B($0339, $00)                                     ;B498B2
    %AICMD0x0D($00, $01, $30, $01)                             ;B498B6
    %AICMD0x0B_SetScriptFlag($02)                                            ;B498BB
pAIScripting0x1E_L016:
    %AICMD0x13_Wait(1)                                         ;B498BD
    %AICMD0x12_Jump(pAIScripting0x1E_L016)                                   ;B498C0
pAIScripting0x1E_L017:
    %AICMD0x1A($0178, $0098, aAIScriptingData_L112, $00)                     ;B498C3
    %AICMD0x1B($033D, $00)                                     ;B498CB
    %AICMD0x13_Wait(180)                                       ;B498CF
    %AICMD0x0D($00, $01, $10, $01)                             ;B498D2
    %AICMD0x1B($033C, $00)                                     ;B498D7
    %AICMD0x13_Wait(60)                                        ;B498DB
    %AICMD0x1B($033E, $00)                                     ;B498DE
    %AICMD0x13_Wait(60)                                        ;B498E2
    %AICMD0x1B($033F, $00)                                     ;B498E5
    %AICMD0x13_Wait(120)                                       ;B498E9
    %AICMD0x1B($033E, $00)                                     ;B498EC
    %AICMD0x13_Wait(60)                                        ;B498F0
    %AICMD0x1B($033D, $00)                                     ;B498F3
    %AICMD0x0D($00, $01, $30, $01)                             ;B498F7
    %AICMD0x0B_SetScriptFlag($02)                                            ;B498FC
pAIScripting0x1E_L018:
    %AICMD0x13_Wait(1)                                         ;B498FE
    %AICMD0x12_Jump(pAIScripting0x1E_L018)                                   ;B49901
    %AICMD0x1A($0178, $00D0, aAIScriptingData_L104, $00)                     ;B49904
    %AICMD0x0D($01, $FF, $40, $02)                             ;B4990C
    %AICMD0x0D($01, $00, $20, $02)                             ;B49911
    %AICMD0x0D($01, $01, $40, $02)                             ;B49916
    %AICMD0x37()                                               ;B4991B
    %AICMD0x10_End()                                           ;B4991C
pAIScripting0x1E_L019:
    %AICMD0x1A($0208, $00CC, aAIScriptingData_L090, $03)                     ;B4991D
    %AICMD0x0C_WaitForScriptFlag($02)                                            ;B49925
    %AICMD0x0D($FD, $00, $30, $03)                             ;B49927
    %AICMD0x0D($FD, $FF, $30, $03)                             ;B4992C
    %AICMD0x0D($FC, $FE, $30, $03)                             ;B49931
    %AICMD0x0D($FC, $FD, $18, $02)                             ;B49936
    %AICMD0x0D($FC, $FC, $18, $02)                             ;B4993B
    %AICMD0x0D($FC, $FB, $14, $02)                             ;B49940
    %AICMD0x0B_SetScriptFlag($03)                                            ;B49945
    %AICMD0x37()                                               ;B49947
    %AICMD0x10_End()                                           ;B49948
pAIScripting0x1E_L020:
    %AICMD0x1A($01F8, $0068, aAIScriptingData_L090, $03)                     ;B49949
    %AICMD0x0C_WaitForScriptFlag($02)                                            ;B49951
    %AICMD0x13_Wait(40)                                        ;B49953
    %AICMD0x0D($FD, $04, $3C, $03)                             ;B49956
    %AICMD0x0D($FD, $03, $30, $02)                             ;B4995B
    %AICMD0x0D($FD, $02, $40, $02)                             ;B49960
    %AICMD0x0D($FD, $01, $40, $02)                             ;B49965
    %AICMD0x0D($FD, $00, $30, $02)                             ;B4996A
    %AICMD0x0B_SetScriptFlag($03)                                            ;B4996F
    %AICMD0x37()                                               ;B49971
    %AICMD0x10_End()                                           ;B49972
pAIScripting0x1E_L021:
    %AICMD0x1A($0100, $00C8, aAIScriptingData_L090, $02)                     ;B49973
    %AICMD0x0C_WaitForScriptFlag($02)                                            ;B4997B
    %AICMD0x0D($03, $FF, $30, $02)                             ;B4997D
    %AICMD0x0D($03, $FE, $20, $03)                             ;B49982
    %AICMD0x0D($01, $FF, $40, $01)                             ;B49987
    %AICMD0x0B_SetScriptFlag($03)                                            ;B4998C
    %AICMD0x37()                                               ;B4998E
    %AICMD0x10_End()                                           ;B4998F
pAIScripting0x1E_L022:
    %AICMD0x1A($0196, $0048, aAIScriptingData_L090, $00)                     ;B49990
    %AICMD0x0C_WaitForScriptFlag($02)                                            ;B49998
    %AICMD0x0D($00, $02, $20, $02)                             ;B4999A
    %AICMD0x0D($FE, $03, $40, $03)                             ;B4999F
    %AICMD0x0D($FE, $03, $90, $02)                             ;B499A4
    %AICMD0x0B_SetScriptFlag($03)                                            ;B499A9
    %AICMD0x37()                                               ;B499AB
    %AICMD0x10_End()                                           ;B499AC
pAIScripting0x1E_L023:
    %AICMD0x1A($00E8, $0028, aAIScriptingData_L090, $00)                     ;B499AD
    %AICMD0x0C_WaitForScriptFlag($02)                                            ;B499B5
    %AICMD0x0D($00, $02, $40, $02)                             ;B499B7
    %AICMD0x0D($01, $03, $40, $03)                             ;B499BC
    %AICMD0x0D($02, $03, $40, $03)                             ;B499C1
    %AICMD0x0D($03, $03, $58, $03)                             ;B499C6
    %AICMD0x0B_SetScriptFlag($03)                                            ;B499CB
    %AICMD0x37()                                               ;B499CD
    %AICMD0x10_End()                                           ;B499CE
pAIScripting0x1E_L024:
    %AICMD0x1A($0140, $0098, aAIScriptingData_L052, $02)                     ;B499CF
pAIScripting0x1E_L025:
    %AICMD0x13_Wait(1)                                         ;B499D7
    %AICMD0x12_Jump(pAIScripting0x1E_L025)                                   ;B499DA
pAIScripting0x1E_L026:
    %AICMD0x1A($0198, $0098, aAIScriptingData_L045, $03)                     ;B499DD
pAIScripting0x1E_L027:
    %AICMD0x13_Wait(1)                                         ;B499E5
    %AICMD0x12_Jump(pAIScripting0x1E_L027)                                   ;B499E8
pAIScripting0x1E_L028:
    %AICMD0x1A($0148, $00C8, aAIScriptingData_L065, $02)                     ;B499EB
pAIScripting0x1E_L029:
    %AICMD0x13_Wait(1)                                         ;B499F3
    %AICMD0x12_Jump(pAIScripting0x1E_L029)                                   ;B499F6
pAIScripting0x1E_L030:
    %AICMD0x1A($0138, $00D8, aAIScriptingData_L047, $02)                     ;B499F9
pAIScripting0x1E_L031:
    %AICMD0x13_Wait(1)                                         ;B49A01
    %AICMD0x12_Jump(pAIScripting0x1E_L031)                                   ;B49A04
pAIScripting0x1E_L032:
    %AICMD0x1A($0190, $00C8, aAIScriptingData_L054, $03)                     ;B49A07
pAIScripting0x1E_L033:
    %AICMD0x13_Wait(1)                                         ;B49A0F
    %AICMD0x12_Jump(pAIScripting0x1E_L033)                                   ;B49A12
pAIScripting0x1E_L034:
    %AICMD0x1A($01A8, $00B0, aAIScriptingData_L049, $03)                     ;B49A15
pAIScripting0x1E_L035:
    %AICMD0x13_Wait(1)                                         ;B49A1D
    %AICMD0x12_Jump(pAIScripting0x1E_L035)                                   ;B49A20
pAIScripting0x1E_L036:
    %AICMD0x1A($0148, $00F8, aAIScriptingData_L202, $00)                     ;B49A23
pAIScripting0x1E_L037:
    %AICMD0x13_Wait(180)                                       ;B49A2B
    %AICMD0x12_Jump(pAIScripting0x1E_L037)                                   ;B49A2E
pAIScripting0x1E_L038:
    %AICMD0x1A($0198, $00F8, aAIScriptingData_L203, $00)                     ;B49A31
pAIScripting0x1E_L039:
    %AICMD0x13_Wait(180)                                       ;B49A39
    %AICMD0x12_Jump(pAIScripting0x1E_L039)                                   ;B49A3C


pAIScripting0x1F:
    dw DATA8_B49A5F                                            ;B49A3F|        |B49A5F;
    dw DATA8_B49C2A                                            ;B49A41|        |B49C2A;
    dw DATA8_B49DD5                                            ;B49A43|        |B49DD5;
    dw pAIScripting0x20                                        ;B49A45|        |B49E31;
    dw pAIScripting0x20                                        ;B49A47|        |B49E31;
    dw pAIScripting0x20                                        ;B49A49|        |B49E31;
    dw pAIScripting0x20                                        ;B49A4B|        |B49E31;
    dw pAIScripting0x20                                        ;B49A4D|        |B49E31;
    dw pAIScripting0x20                                        ;B49A4F|        |B49E31;
    dw pAIScripting0x20                                        ;B49A51|        |B49E31;
    dw pAIScripting0x20                                        ;B49A53|        |B49E31;
    dw pAIScripting0x20                                        ;B49A55|        |B49E31;
    dw pAIScripting0x20                                        ;B49A57|        |B49E31;
    dw pAIScripting0x20                                        ;B49A59|        |B49E31;
    dw pAIScripting0x20                                        ;B49A5B|        |B49E31;
    dw pAIScripting0x20                                        ;B49A5D|        |B49E31;
 
DATA8_B49A5F:
 
    %AICMD0x50()                                               ;B49A5F
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily3, $0D)       ;B49A60
    %AICMD0x09_StartScript($01, pAIScripting0x1F_L009)                                   ;B49A65
    %AICMD0x09_StartScript($02, pAIScripting0x1F_L026)                                   ;B49A69
    %AICMD0x09_StartScript($03, pAIScripting0x1F_L022)                                   ;B49A6D
    %AICMD0x12_Jump(pAIScripting0x1F_L003)                                   ;B49A71
pAIScripting0x1F_L001:
    %AICMD0x55_JumpIfFlagNotSet(strcFlags.event6, $02, pAIScripting0x1F_L002)                 ;B49A74
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 0, 60, pAIScripting0x1F_L002) ;B49A7B
    %AICMD0x09_StartScript($05, pAIScripting0x1F_L069)                                   ;B49A85
pAIScripting0x1F_L002:
    %AICMD0x38_WaitForFadeIn()                                               ;B49A89
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B49A8A
    %AICMD0x13_Wait(3600)                                      ;B49A8C
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily3, $0D)       ;B49A8F
    %AICMD0x3D_TeleportToArea(!AREA_HOUSE3)                    ;B49A94
    %AICMD0x10_End()                                           ;B49A96
pAIScripting0x1F_L003:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $00, pAIScripting0x1F_L004)   ;B49A97
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $01, pAIScripting0x1F_L005)   ;B49A9E
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, pAIScripting0x1F_L006)   ;B49AA5
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $03, pAIScripting0x1F_L007)   ;B49AAC
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $04, pAIScripting0x1F_L008)   ;B49AB3
    %AICMD0x12_Jump(pAIScripting0x1F_L001)                                   ;B49ABA
pAIScripting0x1F_L004:
    %AICMD0x09_StartScript($04, pAIScripting0x1F_L029)                                   ;B49ABD
    %AICMD0x12_Jump(pAIScripting0x1F_L001)                                   ;B49AC1
pAIScripting0x1F_L005:
    %AICMD0x09_StartScript($04, pAIScripting0x1F_L032)                                   ;B49AC4
    %AICMD0x12_Jump(pAIScripting0x1F_L001)                                   ;B49AC8
pAIScripting0x1F_L006:
    %AICMD0x09_StartScript($04, pAIScripting0x1F_L035)                                   ;B49ACB
    %AICMD0x12_Jump(pAIScripting0x1F_L001)                                   ;B49ACF
pAIScripting0x1F_L007:
    %AICMD0x09_StartScript($04, pAIScripting0x1F_L038)                                   ;B49AD2
    %AICMD0x12_Jump(pAIScripting0x1F_L001)                                   ;B49AD6
pAIScripting0x1F_L008:
    %AICMD0x09_StartScript($04, pAIScripting0x1F_L041)                                   ;B49AD9
    %AICMD0x12_Jump(pAIScripting0x1F_L001)                                   ;B49ADD
pAIScripting0x1F_L009:
    %AICMD0x1A($0119, $0063, aAIScriptingData_L206, $00)                     ;B49AE0
pAIScripting0x1F_L010:
    %AICMD0x1F(pAIScripting0x1F_L012)                                        ;B49AE8
    %AICMD0x12_Jump(pAIScripting0x1F_L010)                                   ;B49AEB
pAIScripting0x1F_L011:
    %AICMD0x1F(pAIScripting0x1F_L016)                                        ;B49AEE
    %AICMD0x12_Jump(pAIScripting0x1F_L011)                                   ;B49AF1
pAIScripting0x1F_L012:
    %AICMD0x0B_SetScriptFlag($00)                                            ;B49AF4
    %AICMD0x1D_ShowDialog($01AA, $00)                          ;B49AF6
    %AICMD0x20_JumpIfChoice(0, pAIScripting0x1F_L013)                        ;B49AFA
    %AICMD0x20_JumpIfChoice(1, pAIScripting0x1F_L014)                        ;B49AFE
    %AICMD0x12_Jump(pAIScripting0x1F_L010)                                   ;B49B02
pAIScripting0x1F_L013:
    %AICMD0x1C_ShowDialog($01AB, $00)                          ;B49B05
    %AICMD0x25_RemoveActor($03)                                            ;B49B09
    %AICMD0x09_StartScript($03, pAIScripting0x1F_L025)                                   ;B49B0B
    %AICMD0x12_Jump(pAIScripting0x1F_L011)                                   ;B49B0F
pAIScripting0x1F_L014:
    %AICMD0x1C_ShowDialog($01AC, $00)                          ;B49B12
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $00, pAIScripting0x1F_L017)   ;B49B16
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $01, pAIScripting0x1F_L018)   ;B49B1D
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, pAIScripting0x1F_L019)   ;B49B24
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $03, pAIScripting0x1F_L020)   ;B49B2B
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $04, pAIScripting0x1F_L021)   ;B49B32
pAIScripting0x1F_L015:
    %AICMD0x1B($02E9, $00)                                     ;B49B39
    %AICMD0x12_Jump(pAIScripting0x1F_L011)                                   ;B49B3D
pAIScripting0x1F_L016:
    %AICMD0x1C_ShowDialog($01AD, $00)                          ;B49B40
    %AICMD0x12_Jump(pAIScripting0x1F_L011)                                   ;B49B44
pAIScripting0x1F_L017:
    %AICMD0x41_AddValue16(nLove_Maria, 50)                     ;B49B47
    %AICMD0x12_Jump(pAIScripting0x1F_L015)                                   ;B49B4D
pAIScripting0x1F_L018:
    %AICMD0x41_AddValue16(nLove_Ann, 50)                       ;B49B50
    %AICMD0x12_Jump(pAIScripting0x1F_L015)                                   ;B49B56
pAIScripting0x1F_L019:
    %AICMD0x41_AddValue16(nLove_Nina, 50)                      ;B49B59
    %AICMD0x12_Jump(pAIScripting0x1F_L015)                                   ;B49B5F
pAIScripting0x1F_L020:
    %AICMD0x41_AddValue16(nLove_Ellen, 50)                     ;B49B62
    %AICMD0x12_Jump(pAIScripting0x1F_L015)                                   ;B49B68
pAIScripting0x1F_L021:
    %AICMD0x41_AddValue16(nLove_Eve, 50)                       ;B49B6B
    %AICMD0x12_Jump(pAIScripting0x1F_L015)                                   ;B49B71
pAIScripting0x1F_L022:
    %AICMD0x1A($0080, $00C8, aAIScriptingData_L051, $01)                     ;B49B74
pAIScripting0x1F_L023:
    %AICMD0x1F(pAIScripting0x1F_L024)                                        ;B49B7C
    %AICMD0x12_Jump(pAIScripting0x1F_L023)                                   ;B49B7F
pAIScripting0x1F_L024:
    %AICMD0x1C_ShowDialog($0280, $00)                          ;B49B82
    %AICMD0x12_Jump(pAIScripting0x1F_L023)                                   ;B49B86
pAIScripting0x1F_L025:
    %AICMD0x1A($0060, $00B0, aAIScriptingData_L051, $00)                     ;B49B89
    %AICMD0x13_Wait(1)                                         ;B49B91
    %AICMD0x12_Jump(pAIScripting0x1F_L023)                                   ;B49B94
pAIScripting0x1F_L026:
    %AICMD0x1A($0128, $0078, aAIScriptingData_L043, $03)                     ;B49B97
pAIScripting0x1F_L027:
    %AICMD0x1F(pAIScripting0x1F_L028)                                        ;B49B9F
    %AICMD0x12_Jump(pAIScripting0x1F_L027)                                   ;B49BA2
pAIScripting0x1F_L028:
    %AICMD0x1D_ShowDialog($01A9, $00)                          ;B49BA5
    %AICMD0x12_Jump(pAIScripting0x1F_L027)                                   ;B49BA9
pAIScripting0x1F_L029:
    %AICMD0x1A($0148, $0068, aAIScriptingData_L044, $00)                     ;B49BAC
    %AICMD0x22($10, $10, $01, aAIScriptingData_L045, $00)                    ;B49BB4
pAIScripting0x1F_L030:
    %AICMD0x1F(pAIScripting0x1F_L031)                                        ;B49BBB
    %AICMD0x12_Jump(pAIScripting0x1F_L030)                                   ;B49BBE
pAIScripting0x1F_L031:
    %AICMD0x1C_ShowDialog($01AE, $00)                          ;B49BC1
    %AICMD0x12_Jump(pAIScripting0x1F_L030)                                   ;B49BC5
pAIScripting0x1F_L032:
    %AICMD0x1A($0148, $0088, aAIScriptingData_L046, $00)                     ;B49BC8
    %AICMD0x22($10, $10, $01, aAIScriptingData_L047, $08)                    ;B49BD0
pAIScripting0x1F_L033:
    %AICMD0x1F(pAIScripting0x1F_L034)                                        ;B49BD7
    %AICMD0x12_Jump(pAIScripting0x1F_L033)                                   ;B49BDA
pAIScripting0x1F_L034:
    %AICMD0x1C_ShowDialog($01AF, $00)                          ;B49BDD
    %AICMD0x12_Jump(pAIScripting0x1F_L033)                                   ;B49BE1
pAIScripting0x1F_L035:
    %AICMD0x1A($0148, $0068, aAIScriptingData_L064, $00)                     ;B49BE4
pAIScripting0x1F_L036:
    %AICMD0x1F(pAIScripting0x1F_L037)                                        ;B49BEC
    %AICMD0x12_Jump(pAIScripting0x1F_L036)                                   ;B49BEF
pAIScripting0x1F_L037:
    %AICMD0x1C_ShowDialog($01B0, $00)                          ;B49BF2
    %AICMD0x12_Jump(pAIScripting0x1F_L036)                                   ;B49BF6
pAIScripting0x1F_L038:
    %AICMD0x1A($0148, $0078, aAIScriptingData_L049, $00)                     ;B49BF9
    %AICMD0x22($10, $10, $01, aAIScriptingData_L049, $08)                    ;B49C01
pAIScripting0x1F_L039:
    %AICMD0x1F(pAIScripting0x1F_L040)                                        ;B49C08
    %AICMD0x12_Jump(pAIScripting0x1F_L039)                                   ;B49C0B
pAIScripting0x1F_L040:
    %AICMD0x1C_ShowDialog($01B1, $00)                          ;B49C0E
    %AICMD0x12_Jump(pAIScripting0x1F_L039)                                   ;B49C12
pAIScripting0x1F_L041:
    %AICMD0x1A($0148, $0068, aAIScriptingData_L040, $00)                     ;B49C15
pAIScripting0x1F_L042:
    %AICMD0x1F(pAIScripting0x1F_L043)                                        ;B49C1D
    %AICMD0x12_Jump(pAIScripting0x1F_L042)                                   ;B49C20
pAIScripting0x1F_L043:
    %AICMD0x1C_ShowDialog($01B2, $00)                          ;B49C23
    %AICMD0x12_Jump(pAIScripting0x1F_L042)                                   ;B49C27


DATA8_B49C2A:
 
    %AICMD0x50()                                               ;B49C2A
    %AICMD0x00_SetMusic($0B, $B4)                              ;B49C2B
    %AICMD0x05_SetTransferPosition(136, 184)                   ;B49C2E
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B49C33
    %AICMD0x08_EnableAIControl()                               ;B49C35
    %AICMD0x09_StartScript($01, pAIScripting0x1F_L052)                                   ;B49C36
    %AICMD0x09_StartScript($02, pAIScripting0x1F_L055)                                   ;B49C3A
    %AICMD0x09_StartScript($03, pAIScripting0x1F_L064)                                   ;B49C3E
    %AICMD0x09_StartScript($04, pAIScripting0x1F_L067)                                   ;B49C42
    %AICMD0x12_Jump(pAIScripting0x1F_L046)                                   ;B49C46
pAIScripting0x1F_L044:
    %AICMD0x55_JumpIfFlagNotSet(strcFlags.event6, $02, pAIScripting0x1F_L045)                 ;B49C49
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 0, 60, pAIScripting0x1F_L045) ;B49C50
    %AICMD0x09_StartScript($05, pAIScripting0x1F_L069)                                   ;B49C5A
pAIScripting0x1F_L045:
    %AICMD0x38_WaitForFadeIn()                                               ;B49C5E
    %AICMD0x13_Wait(1)                                         ;B49C5F
    %AICMD0x1C_ShowDialog($01B3, $01)                          ;B49C62
    %AICMD0x11_EnableUserControl()                             ;B49C66
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B49C67
    %AICMD0x23_OrWithIndexedValue($800196, $0D)                ;B49C69
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily3, $0E)       ;B49C6E
    %AICMD0x10_End()                                           ;B49C73
pAIScripting0x1F_L046:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $00, pAIScripting0x1F_L047)   ;B49C74
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $01, pAIScripting0x1F_L048)   ;B49C7B
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, pAIScripting0x1F_L049)   ;B49C82
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $03, pAIScripting0x1F_L050)   ;B49C89
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $04, pAIScripting0x1F_L051)   ;B49C90
    %AICMD0x12_Jump(pAIScripting0x1F_L044)                                   ;B49C97
pAIScripting0x1F_L047:
    %AICMD0x09_StartScript($06, pAIScripting0x1F_L072)                                   ;B49C9A
    %AICMD0x12_Jump(pAIScripting0x1F_L044)                                   ;B49C9E
pAIScripting0x1F_L048:
    %AICMD0x09_StartScript($06, pAIScripting0x1F_L075)                                   ;B49CA1
    %AICMD0x12_Jump(pAIScripting0x1F_L044)                                   ;B49CA5
pAIScripting0x1F_L049:
    %AICMD0x09_StartScript($06, pAIScripting0x1F_L078)                                   ;B49CA8
    %AICMD0x12_Jump(pAIScripting0x1F_L044)                                   ;B49CAC
pAIScripting0x1F_L050:
    %AICMD0x09_StartScript($06, pAIScripting0x1F_L081)                                   ;B49CAF
    %AICMD0x12_Jump(pAIScripting0x1F_L044)                                   ;B49CB3
pAIScripting0x1F_L051:
    %AICMD0x09_StartScript($06, pAIScripting0x1F_L084)                                   ;B49CB6
    %AICMD0x12_Jump(pAIScripting0x1F_L044)                                   ;B49CBA
pAIScripting0x1F_L052:
    %AICMD0x1A($0119, $0063, aAIScriptingData_L071, $00)                     ;B49CBD
pAIScripting0x1F_L053:
    %AICMD0x1F(pAIScripting0x1F_L054)                                        ;B49CC5
    %AICMD0x12_Jump(pAIScripting0x1F_L053)                                   ;B49CC8
pAIScripting0x1F_L054:
    %AICMD0x1C_ShowDialog($01BA, $00)                          ;B49CCB
    %AICMD0x0B_SetScriptFlag($00)                                            ;B49CCF
    %AICMD0x12_Jump(pAIScripting0x1F_L053)                                   ;B49CD1
pAIScripting0x1F_L055:
    %AICMD0x1A($0138, $0068, aAIScriptingData_L042, $03)                     ;B49CD4
pAIScripting0x1F_L056:
    %AICMD0x1F(pAIScripting0x1F_L060)                                        ;B49CDC
    %AICMD0x12_Jump(pAIScripting0x1F_L056)                                   ;B49CDF
pAIScripting0x1F_L057:
    %AICMD0x1F(pAIScripting0x1F_L058)                                        ;B49CE2
    %AICMD0x12_Jump(pAIScripting0x1F_L057)                                   ;B49CE5
pAIScripting0x1F_L058:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $00, pAIScripting0x1F_L059) ;B49CE8
    %AICMD0x1C_ShowDialog($0281, $00)                          ;B49CEF
    %AICMD0x12_Jump(pAIScripting0x1F_L057)                                   ;B49CF3
pAIScripting0x1F_L059:
    %AICMD0x1C_ShowDialog($01B4, $00)                          ;B49CF6
    %AICMD0x12_Jump(pAIScripting0x1F_L057)                                   ;B49CFA
pAIScripting0x1F_L060:
    %AICMD0x17_RollRandom($02)                                            ;B49CFD
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x1F_L061)                                   ;B49CFF
    %AICMD0x18_JumpIfRandomEquals($01, pAIScripting0x1F_L062)                                   ;B49D03
    %AICMD0x12_Jump(pAIScripting0x1F_L056)                                   ;B49D07
pAIScripting0x1F_L061:
    %AICMD0x1C_ShowDialog($01B4, $00)                          ;B49D0A
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown1, $00)     ;B49D0E
    %AICMD0x12_Jump(pAIScripting0x1F_L063)                                   ;B49D13
pAIScripting0x1F_L062:
    %AICMD0x1C_ShowDialog($0281, $00)                          ;B49D16
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown1, $01)     ;B49D1A
    %AICMD0x12_Jump(pAIScripting0x1F_L063)                                   ;B49D1F
pAIScripting0x1F_L063:
    %AICMD0x08_EnableAIControl()                               ;B49D22
    %AICMD0x1B($028D, $01)                                     ;B49D23
    %AICMD0x0D($01, $00, $30, $01)                             ;B49D27
    %AICMD0x1B($028C, $01)                                     ;B49D2C
    %AICMD0x11_EnableUserControl()                             ;B49D30
    %AICMD0x12_Jump(pAIScripting0x1F_L057)                                   ;B49D31
pAIScripting0x1F_L064:
    %AICMD0x1A($0080, $00C8, aAIScriptingData_L051, $02)                     ;B49D34
pAIScripting0x1F_L065:
    %AICMD0x1F(pAIScripting0x1F_L066)                                        ;B49D3C
    %AICMD0x12_Jump(pAIScripting0x1F_L065)                                   ;B49D3F
pAIScripting0x1F_L066:
    %AICMD0x1C_ShowDialog($027F, $00)                          ;B49D42
    %AICMD0x12_Jump(pAIScripting0x1F_L065)                                   ;B49D46
pAIScripting0x1F_L067:
    %AICMD0x1A($0108, $0060, aAIScriptingData_L106, $00)                     ;B49D49
pAIScripting0x1F_L068:
    %AICMD0x13_Wait(1)                                         ;B49D51
    %AICMD0x12_Jump(pAIScripting0x1F_L068)                                   ;B49D54
pAIScripting0x1F_L069:
    %AICMD0x1A($0178, $0058, aAIScriptingData_L078, $00)                     ;B49D57
pAIScripting0x1F_L070:
    %AICMD0x1F(pAIScripting0x1F_L071)                                        ;B49D5F
    %AICMD0x12_Jump(pAIScripting0x1F_L070)                                   ;B49D62
pAIScripting0x1F_L071:
    %AICMD0x1C_ShowDialog($01C1, $00)                          ;B49D65
    %AICMD0x12_Jump(pAIScripting0x1F_L070)                                   ;B49D69
pAIScripting0x1F_L072:
    %AICMD0x1A($0128, $0078, aAIScriptingData_L045, $00)                     ;B49D6C
pAIScripting0x1F_L073:
    %AICMD0x1F(pAIScripting0x1F_L074)                                        ;B49D74
    %AICMD0x12_Jump(pAIScripting0x1F_L073)                                   ;B49D77
pAIScripting0x1F_L074:
    %AICMD0x1C_ShowDialog($01B5, $00)                          ;B49D7A
    %AICMD0x12_Jump(pAIScripting0x1F_L073)                                   ;B49D7E
pAIScripting0x1F_L075:
    %AICMD0x1A($0128, $0078, aAIScriptingData_L047, $00)                     ;B49D81
pAIScripting0x1F_L076:
    %AICMD0x1F(pAIScripting0x1F_L077)                                        ;B49D89
    %AICMD0x12_Jump(pAIScripting0x1F_L076)                                   ;B49D8C
pAIScripting0x1F_L077:
    %AICMD0x1C_ShowDialog($01B6, $00)                          ;B49D8F
    %AICMD0x12_Jump(pAIScripting0x1F_L076)                                   ;B49D93
pAIScripting0x1F_L078:
    %AICMD0x1A($0128, $0078, aAIScriptingData_L065, $00)                     ;B49D96
pAIScripting0x1F_L079:
    %AICMD0x1F(pAIScripting0x1F_L080)                                        ;B49D9E
    %AICMD0x12_Jump(pAIScripting0x1F_L079)                                   ;B49DA1
pAIScripting0x1F_L080:
    %AICMD0x1C_ShowDialog($01B7, $00)                          ;B49DA4
    %AICMD0x12_Jump(pAIScripting0x1F_L079)                                   ;B49DA8
pAIScripting0x1F_L081:
    %AICMD0x1A($0128, $0078, aAIScriptingData_L049, $00)                     ;B49DAB
pAIScripting0x1F_L082:
    %AICMD0x1F(pAIScripting0x1F_L083)                                        ;B49DB3
    %AICMD0x12_Jump(pAIScripting0x1F_L082)                                   ;B49DB6
pAIScripting0x1F_L083:
    %AICMD0x1C_ShowDialog($01B8, $00)                          ;B49DB9
    %AICMD0x12_Jump(pAIScripting0x1F_L082)                                   ;B49DBD
pAIScripting0x1F_L084:
    %AICMD0x1A($0128, $0078, aAIScriptingData_L040, $00)                     ;B49DC0
pAIScripting0x1F_L085:
    %AICMD0x1F(pAIScripting0x1F_L086)                                        ;B49DC8
    %AICMD0x12_Jump(pAIScripting0x1F_L085)                                   ;B49DCB
pAIScripting0x1F_L086:
    %AICMD0x1C_ShowDialog($01B9, $00)                          ;B49DCE
    %AICMD0x12_Jump(pAIScripting0x1F_L085)                                   ;B49DD2


DATA8_B49DD5:
    %AICMD0x50()                                               ;B49DD5
    %AICMD0x08_EnableAIControl()                               ;B49DD6
    %AICMD0x05_SetTransferPosition(296, 104)                   ;B49DD7
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B49DDC
    %AICMD0x09_StartScript($01, pAIScripting0x1F_L088)                                   ;B49DDE
    %AICMD0x09_StartScript($02, pAIScripting0x1F_L090)                                   ;B49DE2
    %AICMD0x55_JumpIfFlagNotSet(strcFlags.event6, $02, pAIScripting0x1F_L087)                 ;B49DE6
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 0, 60, pAIScripting0x1F_L087) ;B49DED
    %AICMD0x09_StartScript($05, pAIScripting0x1F_L069)                                   ;B49DF7
pAIScripting0x1F_L087:
    %AICMD0x38_WaitForFadeIn()                                               ;B49DFB
    %AICMD0x1C_ShowDialog($01BB, $00)                          ;B49DFC
    %AICMD0x01_UnfreezeTime()                                  ;B49E00
    %AICMD0x24_NextHourPalette($74)                            ;B49E01
    %AICMD0x13_Wait(180)                                       ;B49E03
    %AICMD0x1C_ShowDialog($01BC, $00)                          ;B49E06
    %AICMD0x28_ClearBit(strcFlags.event6, $04)                          ;B49E0A
    %AICMD0x47_SetValue8($800973, 3)                           ;B49E0F
    %AICMD0x10_End()                                           ;B49E14
pAIScripting0x1F_L088:
    %AICMD0x1A($0119, $0063, aAIScriptingData_L071, $02)                     ;B49E15
pAIScripting0x1F_L089:
    %AICMD0x13_Wait(1)                                         ;B49E1D
    %AICMD0x12_Jump(pAIScripting0x1F_L089)                                   ;B49E20
pAIScripting0x1F_L090:
    %AICMD0x1A($0108, $0060, aAIScriptingData_L106, $00)                     ;B49E23
pAIScripting0x1F_L091:
    %AICMD0x13_Wait(1)                                         ;B49E2B
    %AICMD0x12_Jump(pAIScripting0x1F_L091)                                   ;B49E2E


pAIScripting0x20:
    dw DATA8_B49E51                                            ;B49E31|        |B49E51;
    dw pAIScripting0x21                                        ;B49E33|        |B49F13;
    dw pAIScripting0x21                                        ;B49E35|        |B49F13;
    dw pAIScripting0x21                                        ;B49E37|        |B49F13;
    dw pAIScripting0x21                                        ;B49E39|        |B49F13;
    dw pAIScripting0x21                                        ;B49E3B|        |B49F13;
    dw pAIScripting0x21                                        ;B49E3D|        |B49F13;
    dw pAIScripting0x21                                        ;B49E3F|        |B49F13;
    dw pAIScripting0x21                                        ;B49E41|        |B49F13;
    dw pAIScripting0x21                                        ;B49E43|        |B49F13;
    dw pAIScripting0x21                                        ;B49E45|        |B49F13;
    dw pAIScripting0x21                                        ;B49E47|        |B49F13;
    dw pAIScripting0x21                                        ;B49E49|        |B49F13;
    dw pAIScripting0x21                                        ;B49E4B|        |B49F13;
    dw pAIScripting0x21                                        ;B49E4D|        |B49F13;
    dw pAIScripting0x21                                        ;B49E4F|        |B49F13;
 
DATA8_B49E51:
    %AICMD0x50()                                               ;B49E51
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $09)       ;B49E52
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily3, $02)       ;B49E57
    %AICMD0x00_SetMusic($0C, $B4)                              ;B49E5C
    %AICMD0x01_UnfreezeTime()                                  ;B49E5F
    %AICMD0x03_SetHour($0E)                                    ;B49E60
    %AICMD0x05_SetTransferPosition(440, 160)                   ;B49E62
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B49E67
    %AICMD0x08_EnableAIControl()                               ;B49E69
    %AICMD0x09_StartScript($01, pAIScripting0x20_L006)                                   ;B49E6A
    %AICMD0x09_StartScript($02, pAIScripting0x20_L009)                                   ;B49E6E
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 0, pAIScripting0x20_L001)     ;B49E72
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 1, pAIScripting0x20_L002)     ;B49E79
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 2, pAIScripting0x20_L003)     ;B49E80
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, pAIScripting0x20_L004)     ;B49E87
pAIScripting0x20_L001:
    %AICMD0x06_SetDestinationArea(!AREA_TOWNSPRING)            ;B49E8E
    %AICMD0x12_Jump(pAIScripting0x20_L005)                                   ;B49E90
pAIScripting0x20_L002:
    %AICMD0x06_SetDestinationArea(!AREA_TOWNSUMMER)            ;B49E93
    %AICMD0x12_Jump(pAIScripting0x20_L005)                                   ;B49E95
pAIScripting0x20_L003:
    %AICMD0x06_SetDestinationArea(!AREA_TOWNFALL)              ;B49E98
    %AICMD0x12_Jump(pAIScripting0x20_L005)                                   ;B49E9A
pAIScripting0x20_L004:
    %AICMD0x06_SetDestinationArea(!AREA_TOWNWINTER)            ;B49E9D
    %AICMD0x12_Jump(pAIScripting0x20_L005)                                   ;B49E9F
pAIScripting0x20_L005:
    %AICMD0x38_WaitForFadeIn()                                               ;B49EA2
    %AICMD0x0B_SetScriptFlag($00)                                            ;B49EA3
    %AICMD0x0C_WaitForScriptFlag($02)                                            ;B49EA5
    %AICMD0x19($0025, $00)                                     ;B49EA7
    %AICMD0x13_Wait(180)                                       ;B49EAB
    %AICMD0x01_UnfreezeTime()                                  ;B49EAE
    %AICMD0x24_NextHourPalette($74)                            ;B49EAF
    %AICMD0x13_Wait(180)                                       ;B49EB1
    %AICMD0x1C_ShowDialog($038A, $00)                          ;B49EB4
    %AICMD0x41_AddValue16(nPlayerHappiness, -100)              ;B49EB8
    %AICMD0x03_SetHour($0F)                                    ;B49EBE
    %AICMD0x47_SetValue8($800973, 3)                           ;B49EC0
    %AICMD0x10_End()                                           ;B49EC5
pAIScripting0x20_L006:
    %AICMD0x1A($0198, $0098, aAIScriptingData_L051, $02)                     ;B49EC6
pAIScripting0x20_L007:
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B49ECE
    %AICMD0x13_Wait(120)                                       ;B49ED0
    %AICMD0x1C_ShowDialog($0315, $00)                          ;B49ED3
    %AICMD0x0B_SetScriptFlag($01)                                            ;B49ED7
pAIScripting0x20_L008:
    %AICMD0x1F(pAIScripting0x20_L007)                                        ;B49ED9
    %AICMD0x12_Jump(pAIScripting0x20_L008)                                   ;B49EDC
pAIScripting0x20_L009:
    %AICMD0x1A($01F8, $0090, aAIScriptingData_L053, $03)                     ;B49EDF
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B49EE7
    %AICMD0x1B($02B0, $00)                                     ;B49EE9
    %AICMD0x0D($FF, $00, $30, $01)                             ;B49EED
    %AICMD0x1B($02AB, $00)                                     ;B49EF2
    %AICMD0x13_Wait(120)                                       ;B49EF6
    %AICMD0x1C_ShowDialog($0316, $00)                          ;B49EF9
    %AICMD0x1B($02B0, $01)                                     ;B49EFD
    %AICMD0x0D($01, $00, $30, $01)                             ;B49F01
    %AICMD0x1B($02AC, $00)                                     ;B49F06
    %AICMD0x0D($00, $01, $90, $01)                             ;B49F0A
    %AICMD0x0B_SetScriptFlag($02)                                            ;B49F0F
    %AICMD0x37()                                               ;B49F11
    %AICMD0x10_End()                                           ;B49F12


pAIScripting0x21:
    dw DATA8_B49F33                                            ;B49F13|        |B49F33;
    dw pAIScripting0x22                                        ;B49F15|        |B49FD8;
    dw pAIScripting0x22                                        ;B49F17|        |B49FD8;
    dw pAIScripting0x22                                        ;B49F19|        |B49FD8;
    dw pAIScripting0x22                                        ;B49F1B|        |B49FD8;
    dw pAIScripting0x22                                        ;B49F1D|        |B49FD8;
    dw pAIScripting0x22                                        ;B49F1F|        |B49FD8;
    dw pAIScripting0x22                                        ;B49F21|        |B49FD8;
    dw pAIScripting0x22                                        ;B49F23|        |B49FD8;
    dw pAIScripting0x22                                        ;B49F25|        |B49FD8;
    dw pAIScripting0x22                                        ;B49F27|        |B49FD8;
    dw pAIScripting0x22                                        ;B49F29|        |B49FD8;
    dw pAIScripting0x22                                        ;B49F2B|        |B49FD8;
    dw pAIScripting0x22                                        ;B49F2D|        |B49FD8;
    dw pAIScripting0x22                                        ;B49F2F|        |B49FD8;
    dw pAIScripting0x22                                        ;B49F31|        |B49FD8;
 
DATA8_B49F33:
    %AICMD0x09_StartScript($13, pAIScripting0x21_L009)                                   ;B49F33
    %AICMD0x10_End()                                           ;B49F37
pAIScripting0x21_L001:
    %AICMD0x1A($0108, $01A8, aAIScriptingData_L039, $03)                     ;B49F38
    %AICMD0x1B($0281, $00)                                     ;B49F40
    %AICMD0x0D($FF, $00, $70, $01)                             ;B49F44
    %AICMD0x1B($0280, $00)                                     ;B49F49
    %AICMD0x1D_ShowDialog($0330, $00)                          ;B49F4D
    %AICMD0x20_JumpIfChoice(0, pAIScripting0x21_L003)                        ;B49F51
    %AICMD0x20_JumpIfChoice(1, pAIScripting0x21_L004)                        ;B49F55
    %AICMD0x12_Jump(pAIScripting0x21_L002)                                   ;B49F59
pAIScripting0x21_L002:
    %AICMD0x12_Jump(pAIScripting0x21_L002)                                   ;B49F5C
pAIScripting0x21_L003:
    %AICMD0x1D_ShowDialog($0331, $00)                          ;B49F5F
    %AICMD0x20_JumpIfChoice(0, pAIScripting0x21_L005)                        ;B49F63
    %AICMD0x20_JumpIfChoice(1, pAIScripting0x21_L006)                        ;B49F67
    %AICMD0x12_Jump(pAIScripting0x21_L002)                                   ;B49F6B
pAIScripting0x21_L004:
    %AICMD0x1C_ShowDialog($0332, $00)                          ;B49F6E
    %AICMD0x41_AddValue16(nPlayerHappiness, -10)               ;B49F72
    %AICMD0x12_Jump(pAIScripting0x21_L008)                                   ;B49F78
pAIScripting0x21_L005:
    %AICMD0x1C_ShowDialog($0333, $00)                          ;B49F7B
    %AICMD0x41_AddValue16(nPlayerHappiness, 50)                ;B49F7F
    %AICMD0x12_Jump(pAIScripting0x21_L007)                                   ;B49F85
pAIScripting0x21_L006:
    %AICMD0x1C_ShowDialog($0334, $00)                          ;B49F88
    %AICMD0x12_Jump(pAIScripting0x21_L008)                                   ;B49F8C
pAIScripting0x21_L007:
    %AICMD0x0B_SetScriptFlag($03)                                            ;B49F8F
    %AICMD0x1B($0281, $01)                                     ;B49F91
    %AICMD0x0D($01, $00, $70, $01)                             ;B49F95
    %AICMD0x37()                                               ;B49F9A
    %AICMD0x11_EnableUserControl()                             ;B49F9B
    %AICMD0x10_End()                                           ;B49F9C
pAIScripting0x21_L008:
    %AICMD0x0D($FF, $00, $30, $01)                             ;B49F9D
    %AICMD0x25_RemoveActor($13)                                            ;B49FA2
    %AICMD0x13_Wait(10)                                        ;B49FA4
    %AICMD0x1B($0284, $00)                                     ;B49FA7
    %AICMD0x0D($01, $00, $A0, $01)                             ;B49FAB
    %AICMD0x37()                                               ;B49FB0
    %AICMD0x11_EnableUserControl()                             ;B49FB1
    %AICMD0x10_End()                                           ;B49FB2
pAIScripting0x21_L009:
    %AICMD0x1A($0068, $01A8, aAIScriptingData_L132, $00)                     ;B49FB3
pAIScripting0x21_L010:
    %AICMD0x1F(pAIScripting0x21_L011)                                        ;B49FBB
    %AICMD0x12_Jump(pAIScripting0x21_L010)                                   ;B49FBE
pAIScripting0x21_L011:
    %AICMD0x08_EnableAIControl()                               ;B49FC1
    %AICMD0x23_OrWithIndexedValue(strcFlags.event4, $09)       ;B49FC2
    %AICMD0x09_StartScript($09, pAIScripting0x21_L001)                                   ;B49FC7
    %AICMD0x0C_WaitForScriptFlag($03)                                            ;B49FCB
    %AICMD0x1B($0303, $00)                                     ;B49FCD
    %AICMD0x0D($FF, $00, $3A, $01)                             ;B49FD1
    %AICMD0x37()                                               ;B49FD6
    %AICMD0x10_End()                                           ;B49FD7


pAIScripting0x22:
    dw DATA8_B49FF8                                            ;B49FD8|        |B49FF8;
    dw DATA8_B4A045                                            ;B49FDA|        |B4A045;
    dw DATA8_B4A091                                            ;B49FDC|        |B4A091;
    dw pAIScripting0x22_L003                                            ;B49FDE|        |B4A0B6;
    dw pAIScripting0x22_L007                                            ;B49FE0|        |B4A0D2;
    dw pAIScripting0x22_L010                                            ;B49FE2|        |B4A11E;
    dw pAIScripting0x22_L014                                            ;B49FE4|        |B4A141;
    dw pAIScripting0x22_L017                                            ;B49FE6|        |B4A1BC;
    dw DATA8_B4A1D8                                            ;B49FE8|        |B4A1D8;
    dw DATA8_B4A278                                            ;B49FEA|        |B4A278;
    dw DATA8_B4A297                                            ;B49FEC|        |B4A297;
    dw DATA8_B4A301                                            ;B49FEE|        |B4A301;
    dw DATA8_B4A321                                            ;B49FF0|        |B4A321;
    dw pAIScripting0x23                                        ;B49FF2|        |B4A37F;
    dw pAIScripting0x23                                        ;B49FF4|        |B4A37F;
    dw pAIScripting0x23                                        ;B49FF6|        |B4A37F;
 
DATA8_B49FF8:
 
    %AICMD0x50()                                               ;B49FF8
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B49FF9
    %AICMD0x08_EnableAIControl()                               ;B49FFB
    %AICMD0x09_StartScript($01, pAIScripting0x22_L001)                                   ;B49FFC
    %AICMD0x38_WaitForFadeIn()                                               ;B4A000
    %AICMD0x0B_SetScriptFlag($00)                                            ;B4A001
    %AICMD0x13_Wait(150)                                       ;B4A003
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4A006
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B4A008
    %AICMD0x11_EnableUserControl()                             ;B4A00A
    %AICMD0x41_AddValue16(nPlayerHappiness, -50)               ;B4A00B
    %AICMD0x10_End()                                           ;B4A011
pAIScripting0x22_L001:
    %AICMD0x1A($00A8, $0078, aAIScriptingData_L071, $03)                     ;B4A012
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B4A01A
    %AICMD0x13_Wait(90)                                        ;B4A01C
    %AICMD0x1C_ShowDialog($019A, $00)                          ;B4A01F
    %AICMD0x1B($02E3, $00)                                     ;B4A023
    %AICMD0x0D($00, $01, $50, $01)                             ;B4A027
    %AICMD0x1B($02E7, $00)                                     ;B4A02C
    %AICMD0x0D($FF, $00, $28, $01)                             ;B4A030
    %AICMD0x1B($02E3, $00)                                     ;B4A035
    %AICMD0x0D($00, $01, $30, $01)                             ;B4A039
    %AICMD0x13_Wait(60)                                        ;B4A03E
    %AICMD0x0B_SetScriptFlag($01)                                            ;B4A041
    %AICMD0x37()                                               ;B4A043
    %AICMD0x10_End()                                           ;B4A044


DATA8_B4A045:
 
    %AICMD0x50()                                               ;B4A045
    %AICMD0x05_SetTransferPosition(136, 120)                   ;B4A046
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4A04B
    %AICMD0x08_EnableAIControl()                               ;B4A04D
    %AICMD0x09_StartScript($01, pAIScripting0x22_L002)                                   ;B4A04E
    %AICMD0x38_WaitForFadeIn()                                               ;B4A052
    %AICMD0x0B_SetScriptFlag($00)                                            ;B4A053
    %AICMD0x13_Wait(150)                                       ;B4A055
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4A058
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B4A05A
    %AICMD0x11_EnableUserControl()                             ;B4A05C
    %AICMD0x10_End()                                           ;B4A05D
pAIScripting0x22_L002:
    %AICMD0x1A($00A8, $0078, aAIScriptingData_L071, $03)                     ;B4A05E
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B4A066
    %AICMD0x13_Wait(90)                                        ;B4A068
    %AICMD0x1C_ShowDialog($019A, $00)                          ;B4A06B
    %AICMD0x1B($02E3, $00)                                     ;B4A06F
    %AICMD0x0D($00, $01, $50, $01)                             ;B4A073
    %AICMD0x1B($02E7, $00)                                     ;B4A078
    %AICMD0x0D($FF, $00, $28, $01)                             ;B4A07C
    %AICMD0x1B($02E3, $00)                                     ;B4A081
    %AICMD0x0D($00, $01, $30, $01)                             ;B4A085
    %AICMD0x13_Wait(60)                                        ;B4A08A
    %AICMD0x0B_SetScriptFlag($01)                                            ;B4A08D
    %AICMD0x37()                                               ;B4A08F
    %AICMD0x10_End()                                           ;B4A090


DATA8_B4A091:
 
    %AICMD0x50()                                               ;B4A091
    %AICMD0x14_JumpIfFlagSet(strcFlags.event4, $00, pAIScripting0x22_L003)   ;B4A092
    %AICMD0x14_JumpIfFlagSet(strcFlags.event4, $01, pAIScripting0x22_L007)   ;B4A099
    %AICMD0x14_JumpIfFlagSet(strcFlags.event4, $02, pAIScripting0x22_L010)   ;B4A0A0
    %AICMD0x14_JumpIfFlagSet(strcFlags.event4, $03, pAIScripting0x22_L014)   ;B4A0A7
    %AICMD0x14_JumpIfFlagSet(strcFlags.event4, $04, pAIScripting0x22_L017)   ;B4A0AE
    %AICMD0x10_End()                                           ;B4A0B5


pAIScripting0x22_L003:
 
    %AICMD0x50()                                               ;B4A0B6
    %AICMD0x09_StartScript($01, pAIScripting0x22_L004)                                   ;B4A0B7
    %AICMD0x38_WaitForFadeIn()                                               ;B4A0BB
    %AICMD0x10_End()                                           ;B4A0BC
pAIScripting0x22_L004:
    %AICMD0x1A($0158, $0058, aAIScriptingData_L061, $00)                     ;B4A0BD
pAIScripting0x22_L005:
    %AICMD0x1F(pAIScripting0x22_L006)                                        ;B4A0C5
    %AICMD0x12_Jump(pAIScripting0x22_L005)                                   ;B4A0C8
pAIScripting0x22_L006:
    %AICMD0x1C_ShowDialog($01D8, $00)                          ;B4A0CB
    %AICMD0x12_Jump(pAIScripting0x22_L005)                                   ;B4A0CF


pAIScripting0x22_L007:
 
    %AICMD0x50()                                               ;B4A0D2
    %AICMD0x08_EnableAIControl()                               ;B4A0D3
    %AICMD0x09_StartScript($01, pAIScripting0x22_L008)                                   ;B4A0D4
    %AICMD0x38_WaitForFadeIn()                                               ;B4A0D8
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 16)                  ;B4A0D9
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 20)                  ;B4A0DD
    %AICMD0x0B_SetScriptFlag($00)                                            ;B4A0E1
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B4A0E3
    %AICMD0x28_ClearBit(strcFlags.event6, $01)                          ;B4A0E5
    %AICMD0x3C()                                               ;B4A0EA
    %AICMD0x10_End()                                           ;B4A0EB
pAIScripting0x22_L008:
    %AICMD0x1A($0058, $0168, aAIScriptingData_L071, $03)                     ;B4A0EC
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B4A0F4
    %AICMD0x13_Wait(60)                                        ;B4A0F6
    %AICMD0x1B($02E7, $01)                                     ;B4A0F9
    %AICMD0x0D($01, $00, $20, $01)                             ;B4A0FD
    %AICMD0x1C_ShowDialog($019B, $00)                          ;B4A102
    %AICMD0x41_AddValue16(nLove_Maria, 100)                    ;B4A106
    %AICMD0x1B($02F0, $01)                                     ;B4A10C
    %AICMD0x13_Wait(60)                                        ;B4A110
    %AICMD0x0B_SetScriptFlag($01)                                            ;B4A113
    %AICMD0x12_Jump(pAIScripting0x22_L009)                                   ;B4A115
pAIScripting0x22_L009:
    %AICMD0x13_Wait(1)                                         ;B4A118
    %AICMD0x12_Jump(pAIScripting0x22_L009)                                   ;B4A11B


pAIScripting0x22_L010:
 
    %AICMD0x50()                                               ;B4A11E
    %AICMD0x09_StartScript($01, pAIScripting0x22_L011)                                   ;B4A11F
    %AICMD0x38_WaitForFadeIn()                                               ;B4A123
    %AICMD0x10_End()                                           ;B4A124
pAIScripting0x22_L011:
    %AICMD0x1A($0028, $0164, aAIScriptingData_L047, $00)                     ;B4A125
    %AICMD0x22($01, $01, $01, aAIScriptingData_L047, $01)                    ;B4A12D
pAIScripting0x22_L012:
    %AICMD0x1F(pAIScripting0x22_L013)                                        ;B4A134
    %AICMD0x12_Jump(pAIScripting0x22_L012)                                   ;B4A137
pAIScripting0x22_L013:
    %AICMD0x1C_ShowDialog($01DF, $00)                          ;B4A13A
    %AICMD0x12_Jump(pAIScripting0x22_L012)                                   ;B4A13E


pAIScripting0x22_L014:
 
    %AICMD0x50()                                               ;B4A141
    %AICMD0x08_EnableAIControl()                               ;B4A142
    %AICMD0x09_StartScript($01, pAIScripting0x22_L015)                                   ;B4A143
    %AICMD0x38_WaitForFadeIn()                                               ;B4A147
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 32)                 ;B4A148
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 48)                    ;B4A14C
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4A150
    %AICMD0x0B_SetScriptFlag($00)                                            ;B4A152
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B4A154
    %AICMD0x13_Wait(90)                                        ;B4A156
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 16)                  ;B4A159
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 32)                 ;B4A15D
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 16)                    ;B4A161
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 32)                  ;B4A165
    %AICMD0x0B_SetScriptFlag($02)                                            ;B4A169
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 64)                  ;B4A16B
    %AICMD0x0C_WaitForScriptFlag($03)                                            ;B4A16F
    %AICMD0x28_ClearBit(strcFlags.event6, $01)                          ;B4A171
    %AICMD0x3C()                                               ;B4A176
    %AICMD0x10_End()                                           ;B4A177
pAIScripting0x22_L015:
    %AICMD0x1A($0098, $0088, aAIScriptingData_L071, $01)                     ;B4A178
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B4A180
    %AICMD0x13_Wait(30)                                        ;B4A182
    %AICMD0x1B($02E7, $01)                                     ;B4A185
    %AICMD0x0B_SetScriptFlag($01)                                            ;B4A189
    %AICMD0x0C_WaitForScriptFlag($02)                                            ;B4A18B
    %AICMD0x13_Wait(30)                                        ;B4A18D
    %AICMD0x1B($02E7, $00)                                     ;B4A190
    %AICMD0x13_Wait(30)                                        ;B4A194
    %AICMD0x1C_ShowDialog($019C, $00)                          ;B4A197
    %AICMD0x41_AddValue16(nLove_Ann, 100)                      ;B4A19B
    %AICMD0x1B($02E7, $01)                                     ;B4A1A1
    %AICMD0x0D($01, $00, $04, $01)                             ;B4A1A5
    %AICMD0x1B($02F0, $01)                                     ;B4A1AA
    %AICMD0x13_Wait(60)                                        ;B4A1AE
    %AICMD0x0B_SetScriptFlag($03)                                            ;B4A1B1
    %AICMD0x12_Jump(pAIScripting0x22_L016)                                   ;B4A1B3
pAIScripting0x22_L016:
    %AICMD0x13_Wait(1)                                         ;B4A1B6
    %AICMD0x12_Jump(pAIScripting0x22_L016)                                   ;B4A1B9


pAIScripting0x22_L017:
 
    %AICMD0x50()                                               ;B4A1BC
    %AICMD0x09_StartScript($01, pAIScripting0x22_L018)                                   ;B4A1BD
    %AICMD0x38_WaitForFadeIn()                                               ;B4A1C1
    %AICMD0x10_End()                                           ;B4A1C2
pAIScripting0x22_L018:
    %AICMD0x1A($0028, $0168, aAIScriptingData_L064, $00)                     ;B4A1C3
pAIScripting0x22_L019:
    %AICMD0x1F(pAIScripting0x22_L020)                                        ;B4A1CB
    %AICMD0x12_Jump(pAIScripting0x22_L019)                                   ;B4A1CE
pAIScripting0x22_L020:
    %AICMD0x1C_ShowDialog($01E9, $00)                          ;B4A1D1
    %AICMD0x12_Jump(pAIScripting0x22_L019)                                   ;B4A1D5


DATA8_B4A1D8:
 
    %AICMD0x50()                                               ;B4A1D8
    %AICMD0x08_EnableAIControl()                               ;B4A1D9
    %AICMD0x09_StartScript($01, pAIScripting0x22_L021)                                   ;B4A1DA
    %AICMD0x38_WaitForFadeIn()                                               ;B4A1DE
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 32)                    ;B4A1DF
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4A1E3
    %AICMD0x0B_SetScriptFlag($00)                                            ;B4A1E5
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B4A1E7
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 16)                 ;B4A1E9
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 32)                    ;B4A1ED
    %AICMD0x0B_SetScriptFlag($02)                                            ;B4A1F1
    %AICMD0x0C_WaitForScriptFlag($03)                                            ;B4A1F3
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 16)                    ;B4A1F5
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 16)                 ;B4A1F9
    %AICMD0x0B_SetScriptFlag($04)                                            ;B4A1FD
    %AICMD0x0C_WaitForScriptFlag($05)                                            ;B4A1FF
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4A201
    %AICMD0x0C_WaitForScriptFlag($06)                                            ;B4A203
    %AICMD0x19($0024, $00)                                     ;B4A205
    %AICMD0x13_Wait(60)                                        ;B4A209
    %AICMD0x1C_ShowDialog($019D, $00)                          ;B4A20C
    %AICMD0x28_ClearBit(strcFlags.event6, $01)                          ;B4A210
    %AICMD0x3C()                                               ;B4A215
    %AICMD0x10_End()                                           ;B4A216
pAIScripting0x22_L021:
    %AICMD0x1A($0078, $0088, aAIScriptingData_L071, $01)                     ;B4A217
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B4A21F
    %AICMD0x13_Wait(30)                                        ;B4A221
    %AICMD0x1B($02E5, $00)                                     ;B4A224
    %AICMD0x0D($00, $FF, $20, $01)                             ;B4A228
    %AICMD0x0B_SetScriptFlag($01)                                            ;B4A22D
    %AICMD0x0C_WaitForScriptFlag($02)                                            ;B4A22F
    %AICMD0x13_Wait(30)                                        ;B4A231
    %AICMD0x1B($02E7, $01)                                     ;B4A234
    %AICMD0x0D($01, $00, $20, $01)                             ;B4A238
    %AICMD0x0B_SetScriptFlag($03)                                            ;B4A23D
    %AICMD0x0C_WaitForScriptFlag($04)                                            ;B4A23F
    %AICMD0x13_Wait(30)                                        ;B4A241
    %AICMD0x1B($02E3, $00)                                     ;B4A244
    %AICMD0x0D($00, $01, $40, $01)                             ;B4A248
    %AICMD0x0B_SetScriptFlag($05)                                            ;B4A24D
    %AICMD0x13_Wait(60)                                        ;B4A24F
    %AICMD0x1B($02E7, $00)                                     ;B4A252
    %AICMD0x0D($FF, $00, $10, $01)                             ;B4A256
    %AICMD0x1B($02E5, $00)                                     ;B4A25B
    %AICMD0x13_Wait(60)                                        ;B4A25F
    %AICMD0x0D($00, $FE, $1A, $01)                             ;B4A262
    %AICMD0x0B_SetScriptFlag($06)                                            ;B4A267
    %AICMD0x41_AddValue16(nLove_Nina, 100)                     ;B4A269
    %AICMD0x12_Jump(pAIScripting0x22_L022)                                   ;B4A26F
pAIScripting0x22_L022:
    %AICMD0x13_Wait(1)                                         ;B4A272
    %AICMD0x12_Jump(pAIScripting0x22_L022)                                   ;B4A275


DATA8_B4A278:
 
    %AICMD0x50()                                               ;B4A278
    %AICMD0x09_StartScript($01, pAIScripting0x22_L023)                                   ;B4A279
    %AICMD0x38_WaitForFadeIn()                                               ;B4A27D
    %AICMD0x10_End()                                           ;B4A27E
pAIScripting0x22_L023:
    %AICMD0x1A($0028, $0198, aAIScriptingData_L048, $00)                     ;B4A27F
    %AICMD0x12_Jump(pAIScripting0x22_L024)                                   ;B4A287
pAIScripting0x22_L024:
    %AICMD0x1F(pAIScripting0x22_L025)                                        ;B4A28A
    %AICMD0x12_Jump(pAIScripting0x22_L024)                                   ;B4A28D
pAIScripting0x22_L025:
    %AICMD0x1C_ShowDialog($01B1, $00)                          ;B4A290
    %AICMD0x12_Jump(pAIScripting0x22_L024)                                   ;B4A294


DATA8_B4A297:
 
    %AICMD0x50()                                               ;B4A297
    %AICMD0x08_EnableAIControl()                               ;B4A298
    %AICMD0x09_StartScript($01, pAIScripting0x22_L026)                                   ;B4A299
    %AICMD0x38_WaitForFadeIn()                                               ;B4A29D
    %AICMD0x13_Wait(90)                                        ;B4A29E
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 16)                    ;B4A2A1
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 16)                  ;B4A2A5
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B4A2A9
    %AICMD0x0B_SetScriptFlag($00)                                            ;B4A2AB
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B4A2AD
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 96)                    ;B4A2AF
    %AICMD0x0B_SetScriptFlag($02)                                            ;B4A2B3
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 32)                    ;B4A2B5
    %AICMD0x0C_WaitForScriptFlag($03)                                            ;B4A2B9
    %AICMD0x13_Wait(60)                                        ;B4A2BB
    %AICMD0x28_ClearBit(strcFlags.event6, $01)                          ;B4A2BE
    %AICMD0x3C()                                               ;B4A2C3
    %AICMD0x10_End()                                           ;B4A2C4
pAIScripting0x22_L026:
    %AICMD0x1A($0058, $0088, aAIScriptingData_L071, $00)                     ;B4A2C5
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B4A2CD
    %AICMD0x1B($02E5, $00)                                     ;B4A2CF
    %AICMD0x0D($00, $FF, $30, $01)                             ;B4A2D3
    %AICMD0x1B($02E4, $00)                                     ;B4A2D8
    %AICMD0x0B_SetScriptFlag($01)                                            ;B4A2DC
    %AICMD0x0C_WaitForScriptFlag($02)                                            ;B4A2DE
    %AICMD0x13_Wait(10)                                        ;B4A2E0
    %AICMD0x1C_ShowDialog($019E, $00)                          ;B4A2E3
    %AICMD0x41_AddValue16(nLove_Ellen, 100)                    ;B4A2E7
    %AICMD0x1B($02E3, $00)                                     ;B4A2ED
    %AICMD0x0D($00, $01, $08, $02)                             ;B4A2F1
    %AICMD0x0B_SetScriptFlag($03)                                            ;B4A2F6
    %AICMD0x12_Jump(pAIScripting0x22_L027)                                   ;B4A2F8
pAIScripting0x22_L027:
    %AICMD0x13_Wait(1)                                         ;B4A2FB
    %AICMD0x12_Jump(pAIScripting0x22_L027)                                   ;B4A2FE


DATA8_B4A301:
 
    %AICMD0x50()                                               ;B4A301
    %AICMD0x09_StartScript($01, pAIScripting0x22_L028)                                   ;B4A302
    %AICMD0x38_WaitForFadeIn()                                               ;B4A306
    %AICMD0x10_End()                                           ;B4A307
pAIScripting0x22_L028:
    %AICMD0x1A($0028, $0198, aAIScriptingData_L041, $00)                     ;B4A308
pAIScripting0x22_L029:
    %AICMD0x1F(pAIScripting0x22_L030)                                        ;B4A310
    %AICMD0x12_Jump(pAIScripting0x22_L029)                                   ;B4A313
pAIScripting0x22_L030:
    %AICMD0x1C_ShowDialog($01EA, $00)                          ;B4A316
    %AICMD0x1B($0285, $00)                                     ;B4A31A
    %AICMD0x12_Jump(pAIScripting0x22_L029)                                   ;B4A31E


DATA8_B4A321:
    %AICMD0x50()                                               ;B4A321
    %AICMD0x08_EnableAIControl()                               ;B4A322
    %AICMD0x09_StartScript($01, pAIScripting0x22_L031)                                   ;B4A323
    %AICMD0x38_WaitForFadeIn()                                               ;B4A327
    %AICMD0x13_Wait(90)                                        ;B4A328
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 24)                    ;B4A32B
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 68)                  ;B4A32F
    %AICMD0x40_DisableTileInteractions()                       ;B4A333
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 94)                    ;B4A334
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4A338
    %AICMD0x0B_SetScriptFlag($00)                                            ;B4A33A
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B4A33C
    %AICMD0x13_Wait(90)                                        ;B4A33E
    %AICMD0x28_ClearBit(strcFlags.event6, $01)                          ;B4A341
    %AICMD0x3C()                                               ;B4A346
    %AICMD0x10_End()                                           ;B4A347
pAIScripting0x22_L031:
    %AICMD0x1A($0020, $004E, aAIScriptingData_L071, $03)                     ;B4A348
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B4A350
    %AICMD0x13_Wait(30)                                        ;B4A352
    %AICMD0x1B($02E7, $01)                                     ;B4A355
    %AICMD0x0D($01, $00, $18, $01)                             ;B4A359
    %AICMD0x1C_ShowDialog($019F, $00)                          ;B4A35E
    %AICMD0x41_AddValue16(nLove_Eve, 100)                      ;B4A362
    %AICMD0x13_Wait(10)                                        ;B4A368
    %AICMD0x0D($02, $00, $01, $01)                             ;B4A36B
    %AICMD0x1B($02F0, $01)                                     ;B4A370
    %AICMD0x0B_SetScriptFlag($01)                                            ;B4A374
    %AICMD0x12_Jump(pAIScripting0x22_L032)                                   ;B4A376
pAIScripting0x22_L032:
    %AICMD0x13_Wait(1)                                         ;B4A379
    %AICMD0x12_Jump(pAIScripting0x22_L032)                                   ;B4A37C


pAIScripting0x23:
    dw DATA8_B4A39F                                            ;B4A37F|        |B4A39F;
    dw pAIScripting0x24                                        ;B4A381|        |B4A455;
    dw pAIScripting0x24                                        ;B4A383|        |B4A455;
    dw pAIScripting0x24                                        ;B4A385|        |B4A455;
    dw pAIScripting0x24                                        ;B4A387|        |B4A455;
    dw pAIScripting0x24                                        ;B4A389|        |B4A455;
    dw pAIScripting0x24                                        ;B4A38B|        |B4A455;
    dw pAIScripting0x24                                        ;B4A38D|        |B4A455;
    dw pAIScripting0x24                                        ;B4A38F|        |B4A455;
    dw pAIScripting0x24                                        ;B4A391|        |B4A455;
    dw pAIScripting0x24                                        ;B4A393|        |B4A455;
    dw pAIScripting0x24                                        ;B4A395|        |B4A455;
    dw pAIScripting0x24                                        ;B4A397|        |B4A455;
    dw pAIScripting0x24                                        ;B4A399|        |B4A455;
    dw pAIScripting0x24                                        ;B4A39B|        |B4A455;
    dw pAIScripting0x24                                        ;B4A39D|        |B4A455;
 
DATA8_B4A39F:
    %AICMD0x09_StartScript($0C, pAIScripting0x23_L001)                                   ;B4A39F
    %AICMD0x09_StartScript($0D, pAIScripting0x23_L002)                                   ;B4A3A3
    %AICMD0x09_StartScript($0E, pAIScripting0x23_L003)                                   ;B4A3A7
    %AICMD0x08_EnableAIControl()                               ;B4A3AB
    %AICMD0x38_WaitForFadeIn()                                               ;B4A3AC
    %AICMD0x2C($23, $0007, $003C)                              ;B4A3AD
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B4A3B3
    %AICMD0x11_EnableUserControl()                             ;B4A3B5
    %AICMD0x10_End()                                           ;B4A3B6
pAIScripting0x23_L001:
    %AICMD0x1A($0098, $0178, aAIScriptingData_L093, $03)                     ;B4A3B7
    %AICMD0x13_Wait(40)                                        ;B4A3BF
    %AICMD0x1B($0328, $01)                                     ;B4A3C2
    %AICMD0x0D($FF, $FF, $01, $01)                             ;B4A3C6
    %AICMD0x13_Wait(60)                                        ;B4A3CB
    %AICMD0x1B($0328, $01)                                     ;B4A3CE
    %AICMD0x0D($01, $00, $01, $01)                             ;B4A3D2
    %AICMD0x13_Wait(30)                                        ;B4A3D7
    %AICMD0x1B($0329, $01)                                     ;B4A3DA
    %AICMD0x0D($03, $FF, $40, $03)                             ;B4A3DE
    %AICMD0x0D($02, $FF, $40, $02)                             ;B4A3E3
    %AICMD0x0B_SetScriptFlag($00)                                            ;B4A3E8
    %AICMD0x0D($01, $FF, $20, $01)                             ;B4A3EA
    %AICMD0x37()                                               ;B4A3EF
    %AICMD0x10_End()                                           ;B4A3F0
pAIScripting0x23_L002:
    %AICMD0x1A($0068, $0178, aAIScriptingData_L093, $00)                     ;B4A3F1
    %AICMD0x13_Wait(48)                                        ;B4A3F9
    %AICMD0x1B($0328, $01)                                     ;B4A3FC
    %AICMD0x0D($FF, $FF, $01, $01)                             ;B4A400
    %AICMD0x0D($FF, $01, $01, $01)                             ;B4A405
    %AICMD0x13_Wait(60)                                        ;B4A40A
    %AICMD0x1B($0329, $00)                                     ;B4A40D
    %AICMD0x0D($FF, $00, $10, $01)                             ;B4A411
    %AICMD0x0D($FF, $FF, $20, $01)                             ;B4A416
    %AICMD0x0B_SetScriptFlag($00)                                            ;B4A41B
    %AICMD0x0D($00, $00, $04, $01)                             ;B4A41D
    %AICMD0x0D($FE, $FF, $40, $01)                             ;B4A422
    %AICMD0x37()                                               ;B4A427
    %AICMD0x10_End()                                           ;B4A428
pAIScripting0x23_L003:
    %AICMD0x1A($0078, $0180, aAIScriptingData_L093, $02)                     ;B4A429
    %AICMD0x13_Wait(70)                                        ;B4A431
    %AICMD0x1B($0327, $00)                                     ;B4A434
    %AICMD0x13_Wait(38)                                        ;B4A438
    %AICMD0x1B($032A, $00)                                     ;B4A43B
    %AICMD0x0D($00, $01, $10, $01)                             ;B4A43F
    %AICMD0x0D($FF, $03, $40, $03)                             ;B4A444
    %AICMD0x0D($FF, $02, $40, $02)                             ;B4A449
    %AICMD0x0D($FF, $01, $58, $01)                             ;B4A44E
    %AICMD0x37()                                               ;B4A453
    %AICMD0x10_End()                                           ;B4A454


pAIScripting0x24:
    dw DATA8_B4A475                                            ;B4A455|        |B4A475;
    dw DATA8_B4A531                                            ;B4A457|        |B4A531;
    dw DATA8_B4A55D                                            ;B4A459|        |B4A55D;
    dw DATA8_B4A589                                            ;B4A45B|        |B4A589;
    dw pAIScripting0x25                                        ;B4A45D|        |B4A5B5;
    dw pAIScripting0x25                                        ;B4A45F|        |B4A5B5;
    dw pAIScripting0x25                                        ;B4A461|        |B4A5B5;
    dw pAIScripting0x25                                        ;B4A463|        |B4A5B5;
    dw pAIScripting0x25                                        ;B4A465|        |B4A5B5;
    dw pAIScripting0x25                                        ;B4A467|        |B4A5B5;
    dw pAIScripting0x25                                        ;B4A469|        |B4A5B5;
    dw pAIScripting0x25                                        ;B4A46B|        |B4A5B5;
    dw pAIScripting0x25                                        ;B4A46D|        |B4A5B5;
    dw pAIScripting0x25                                        ;B4A46F|        |B4A5B5;
    dw pAIScripting0x25                                        ;B4A471|        |B4A5B5;
    dw pAIScripting0x25                                        ;B4A473|        |B4A5B5;
 
DATA8_B4A475:
 
    %AICMD0x08_EnableAIControl()                               ;B4A475
    %AICMD0x1A($FFF8, $01A8, aAIScriptingData_L037, $02)                     ;B4A476
    %AICMD0x38_WaitForFadeIn()                                               ;B4A47E
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 40)                   ;B4A47F
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4A483
    %AICMD0x1B($027B, $01)                                     ;B4A485
    %AICMD0x0D($01, $00, $80, $01)                             ;B4A489
    %AICMD0x13_Wait(30)                                        ;B4A48E
    %AICMD0x15_JumpIfEquals8($80098C, 6, pAIScripting0x24_L001)              ;B4A491
    %AICMD0x15_JumpIfEquals8($80098C, 7, pAIScripting0x24_L002)              ;B4A498
    %AICMD0x15_JumpIfEquals8($80098C, 8, pAIScripting0x24_L003)              ;B4A49F
    %AICMD0x15_JumpIfEquals8($80098C, 9, pAIScripting0x24_L004)              ;B4A4A6
    %AICMD0x15_JumpIfEquals8($80098C, 10, pAIScripting0x24_L005)             ;B4A4AD
    %AICMD0x15_JumpIfEquals8($80098C, 11, pAIScripting0x24_L006)             ;B4A4B4
    %AICMD0x12_Jump(pAIScripting0x24_L007)                                   ;B4A4BB
pAIScripting0x24_L001:
    %AICMD0x1C_ShowDialog($0272, $00)                          ;B4A4BE
    %AICMD0x12_Jump(pAIScripting0x24_L007)                                   ;B4A4C2
pAIScripting0x24_L002:
    %AICMD0x1C_ShowDialog($0240, $00)                          ;B4A4C5
    %AICMD0x12_Jump(pAIScripting0x24_L007)                                   ;B4A4C9
pAIScripting0x24_L003:
    %AICMD0x1C_ShowDialog($028E, $00)                          ;B4A4CC
    %AICMD0x12_Jump(pAIScripting0x24_L008)                                   ;B4A4D0
pAIScripting0x24_L004:
    %AICMD0x1C_ShowDialog($026E, $00)                          ;B4A4D3
    %AICMD0x12_Jump(pAIScripting0x24_L007)                                   ;B4A4D7
pAIScripting0x24_L005:
    %AICMD0x1C_ShowDialog($0289, $00)                          ;B4A4DA
    %AICMD0x12_Jump(pAIScripting0x24_L007)                                   ;B4A4DE
pAIScripting0x24_L006:
    %AICMD0x1C_ShowDialog($0274, $00)                          ;B4A4E1
    %AICMD0x12_Jump(pAIScripting0x24_L007)                                   ;B4A4E5
pAIScripting0x24_L007:
    %AICMD0x13_Wait(30)                                        ;B4A4E8
    %AICMD0x1B($027B, $00)                                     ;B4A4EB
    %AICMD0x0D($FF, $00, $80, $01)                             ;B4A4EF
    %AICMD0x37()                                               ;B4A4F4
    %AICMD0x11_EnableUserControl()                             ;B4A4F5
    %AICMD0x10_End()                                           ;B4A4F6
pAIScripting0x24_L008:
    %AICMD0x09_StartScript($02, pAIScripting0x24_L009)                                   ;B4A4F7
    %AICMD0x13_Wait(30)                                        ;B4A4FB
    %AICMD0x0C_WaitForScriptFlag($02)                                            ;B4A4FE
    %AICMD0x1B($027B, $00)                                     ;B4A500
    %AICMD0x0D($FF, $00, $80, $01)                             ;B4A504
    %AICMD0x37()                                               ;B4A509
    %AICMD0x11_EnableUserControl()                             ;B4A50A
    %AICMD0x10_End()                                           ;B4A50B
pAIScripting0x24_L009:
    %AICMD0x1A($FFF8, $01A8, aAIScriptingData_L033, $02)                     ;B4A50C
    %AICMD0x1B($026E, $01)                                     ;B4A514
    %AICMD0x0D($01, $00, $70, $01)                             ;B4A518
    %AICMD0x13_Wait(30)                                        ;B4A51D
    %AICMD0x1C_ShowDialog($028F, $00)                          ;B4A520
    %AICMD0x0B_SetScriptFlag($02)                                            ;B4A524
    %AICMD0x1B($026E, $00)                                     ;B4A526
    %AICMD0x0D($FF, $00, $80, $01)                             ;B4A52A
    %AICMD0x37()                                               ;B4A52F
    %AICMD0x10_End()                                           ;B4A530


DATA8_B4A531:
 
    %AICMD0x08_EnableAIControl()                               ;B4A531
    %AICMD0x1A($FFF8, $01A8, aAIScriptingData_L046, $02)                     ;B4A532
    %AICMD0x38_WaitForFadeIn()                                               ;B4A53A
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 40)                   ;B4A53B
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4A53F
    %AICMD0x1B($029B, $01)                                     ;B4A541
    %AICMD0x0D($01, $00, $80, $01)                             ;B4A545
    %AICMD0x13_Wait(30)                                        ;B4A54A
    %AICMD0x1C_ShowDialog($047F, $00)                          ;B4A54D
    %AICMD0x1B($029B, $00)                                     ;B4A551
    %AICMD0x0D($FF, $00, $80, $01)                             ;B4A555
    %AICMD0x37()                                               ;B4A55A
    %AICMD0x11_EnableUserControl()                             ;B4A55B
    %AICMD0x10_End()                                           ;B4A55C


DATA8_B4A55D:
 
    %AICMD0x08_EnableAIControl()                               ;B4A55D
    %AICMD0x1A($FFF8, $01A8, aAIScriptingData_L028, $02)                     ;B4A55E
    %AICMD0x38_WaitForFadeIn()                                               ;B4A566
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 40)                   ;B4A567
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4A56B
    %AICMD0x1B($025F, $01)                                     ;B4A56D
    %AICMD0x0D($01, $00, $80, $01)                             ;B4A571
    %AICMD0x13_Wait(30)                                        ;B4A576
    %AICMD0x1C_ShowDialog($0486, $00)                          ;B4A579
    %AICMD0x1B($025F, $00)                                     ;B4A57D
    %AICMD0x0D($FF, $00, $80, $01)                             ;B4A581
    %AICMD0x37()                                               ;B4A586
    %AICMD0x11_EnableUserControl()                             ;B4A587
    %AICMD0x10_End()                                           ;B4A588


DATA8_B4A589:
    %AICMD0x08_EnableAIControl()                               ;B4A589
    %AICMD0x1A($FFF8, $01A8, aAIScriptingData_L028, $02)                     ;B4A58A
    %AICMD0x38_WaitForFadeIn()                                               ;B4A592
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 40)                   ;B4A593
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4A597
    %AICMD0x1B($025F, $01)                                     ;B4A599
    %AICMD0x0D($01, $00, $80, $01)                             ;B4A59D
    %AICMD0x13_Wait(30)                                        ;B4A5A2
    %AICMD0x1C_ShowDialog($0142, $00)                          ;B4A5A5
    %AICMD0x1B($025F, $00)                                     ;B4A5A9
    %AICMD0x0D($FF, $00, $80, $01)                             ;B4A5AD
    %AICMD0x37()                                               ;B4A5B2
    %AICMD0x11_EnableUserControl()                             ;B4A5B3
    %AICMD0x10_End()                                           ;B4A5B4


pAIScripting0x25:
    dw DATA8_B4A5D5                                            ;B4A5B5|        |B4A5D5;
    dw pAIScripting0x26                                        ;B4A5B7|        |B4A60D;
    dw pAIScripting0x26                                        ;B4A5B9|        |B4A60D;
    dw pAIScripting0x26                                        ;B4A5BB|        |B4A60D;
    dw pAIScripting0x26                                        ;B4A5BD|        |B4A60D;
    dw pAIScripting0x26                                        ;B4A5BF|        |B4A60D;
    dw pAIScripting0x26                                        ;B4A5C1|        |B4A60D;
    dw pAIScripting0x26                                        ;B4A5C3|        |B4A60D;
    dw pAIScripting0x26                                        ;B4A5C5|        |B4A60D;
    dw pAIScripting0x26                                        ;B4A5C7|        |B4A60D;
    dw pAIScripting0x26                                        ;B4A5C9|        |B4A60D;
    dw pAIScripting0x26                                        ;B4A5CB|        |B4A60D;
    dw pAIScripting0x26                                        ;B4A5CD|        |B4A60D;
    dw pAIScripting0x26                                        ;B4A5CF|        |B4A60D;
    dw pAIScripting0x26                                        ;B4A5D1|        |B4A60D;
    dw pAIScripting0x26                                        ;B4A5D3|        |B4A60D;
 
DATA8_B4A5D5:
    %AICMD0x02_FreezeTime()                                    ;B4A5D5
    %AICMD0x05_SetTransferPosition(136, 344)                   ;B4A5D6
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4A5DB
    %AICMD0x08_EnableAIControl()                               ;B4A5DD
    %AICMD0x09_StartScript($01, pAIScripting0x25_L001)                                   ;B4A5DE
    %AICMD0x38_WaitForFadeIn()                                               ;B4A5E2
    %AICMD0x0B_SetScriptFlag($00)                                            ;B4A5E3
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B4A5E5
    %AICMD0x11_EnableUserControl()                             ;B4A5E7
    %AICMD0x10_End()                                           ;B4A5E8
pAIScripting0x25_L001:
    %AICMD0x1A($0068, $01A8, aAIScriptingData_L046, $02)                     ;B4A5E9
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B4A5F1
    %AICMD0x1C_ShowDialog($0300, $00)                          ;B4A5F3
    %AICMD0x1B($0297, $00)                                     ;B4A5F7
    %AICMD0x0D($00, $01, $60, $01)                             ;B4A5FB
    %AICMD0x1B($029B, $01)                                     ;B4A600
    %AICMD0x0D($FF, $00, $70, $01)                             ;B4A604
    %AICMD0x0B_SetScriptFlag($01)                                            ;B4A609
    %AICMD0x37()                                               ;B4A60B
    %AICMD0x10_End()                                           ;B4A60C


pAIScripting0x26:
    dw DATA8_B4A62D                                            ;B4A60D|        |B4A62D;
    dw DATA8_B4B48E                                            ;B4A60F|        |B4B48E;
    dw pAIScripting0x27                                        ;B4A611|        |B4B65E;
    dw pAIScripting0x27                                        ;B4A613|        |B4B65E;
    dw pAIScripting0x27                                        ;B4A615|        |B4B65E;
    dw pAIScripting0x27                                        ;B4A617|        |B4B65E;
    dw pAIScripting0x27                                        ;B4A619|        |B4B65E;
    dw pAIScripting0x27                                        ;B4A61B|        |B4B65E;
    dw pAIScripting0x27                                        ;B4A61D|        |B4B65E;
    dw pAIScripting0x27                                        ;B4A61F|        |B4B65E;
    dw pAIScripting0x27                                        ;B4A621|        |B4B65E;
    dw pAIScripting0x27                                        ;B4A623|        |B4B65E;
    dw pAIScripting0x27                                        ;B4A625|        |B4B65E;
    dw pAIScripting0x27                                        ;B4A627|        |B4B65E;
    dw pAIScripting0x27                                        ;B4A629|        |B4B65E;
    dw pAIScripting0x27                                        ;B4A62B|        |B4B65E;
 
DATA8_B4A62D:
 
    %AICMD0x4F_DisableToolUse()                                               ;B4A62D
    %AICMD0x51()                                               ;B4A62E
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $09)       ;B4A62F
    %AICMD0x00_SetMusic($03, $B4)                              ;B4A634
    %AICMD0x02_FreezeTime()                                    ;B4A637
    %AICMD0x03_SetHour($07)                                    ;B4A638
    %AICMD0x08_EnableAIControl()                               ;B4A63A
    %AICMD0x05_SetTransferPosition(264, 312)                   ;B4A63B
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B4A640
    %AICMD0x32_SetValue16(strcFlags.unknown1, $FFDF)                      ;B4A642
    %AICMD0x09_StartScript($01, pAIScripting0x26_L035)                                   ;B4A648
    %AICMD0x09_StartScript($03, pAIScripting0x26_L047)                                   ;B4A64C
    %AICMD0x09_StartScript($06, pAIScripting0x26_L059)                                   ;B4A650
    %AICMD0x09_StartScript($07, pAIScripting0x26_L064)                                   ;B4A654
    %AICMD0x09_StartScript($0B, pAIScripting0x26_L080)                                   ;B4A658
    %AICMD0x09_StartScript($0D, pAIScripting0x26_L086)                                   ;B4A65C
    %AICMD0x09_StartScript($0E, pAIScripting0x26_L098)                                   ;B4A660
    %AICMD0x09_StartScript($0F, pAIScripting0x26_L114)                                   ;B4A664
    %AICMD0x09_StartScript($10, pAIScripting0x26_L129)                                   ;B4A668
    %AICMD0x09_StartScript($11, pAIScripting0x26_L145)                                   ;B4A66C
    %AICMD0x09_StartScript($12, pAIScripting0x26_L014)                                   ;B4A670
    %AICMD0x09_StartScript($13, pAIScripting0x26_L040)                                   ;B4A674
    %AICMD0x06_SetDestinationArea(!AREA_DANCINGS2)             ;B4A678
    %AICMD0x38_WaitForFadeIn()                                               ;B4A67A
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 64)                    ;B4A67B
    %AICMD0x15_JumpIfEquals8($80091D, 0, pAIScripting0x26_L001)              ;B4A67F
    %AICMD0x1C_ShowDialog($0241, $00)                          ;B4A686
    %AICMD0x40_DisableTileInteractions()                       ;B4A68A
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 16)                    ;B4A68B
    %AICMD0x3F_ThrowCarriedItem()                              ;B4A68F
    %AICMD0x13_Wait(60)                                        ;B4A690
    %AICMD0x1C_ShowDialog($0243, $00)                          ;B4A693
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 16)                  ;B4A697
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B4A69B
    %AICMD0x4E_EnableTileInteractions()                                               ;B4A69D
    %AICMD0x12_Jump(pAIScripting0x26_L002)                                   ;B4A69E
pAIScripting0x26_L001:
    %AICMD0x1C_ShowDialog($0242, $00)                          ;B4A6A1
    %AICMD0x1C_ShowDialog($0243, $00)                          ;B4A6A5
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown2, $00)     ;B4A6A9
pAIScripting0x26_L002:
    %AICMD0x13_Wait(120)                                       ;B4A6AE
    %AICMD0x0B_SetScriptFlag($00)                                            ;B4A6B1
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B4A6B3
    %AICMD0x09_StartScript($14, pAIScripting0x26_L018)                                   ;B4A6B5
    %AICMD0x19($0012, $00)                                     ;B4A6B9
    %AICMD0x13_Wait(20)                                        ;B4A6BD
    %AICMD0x13_Wait(120)                                       ;B4A6C0
    %AICMD0x11_EnableUserControl()                             ;B4A6C3
    %AICMD0x0C_WaitForScriptFlag($02)                                            ;B4A6C4
    %AICMD0x3D_TeleportToArea(!AREA_DANCINGS2)                 ;B4A6C6
    %AICMD0x10_End()                                           ;B4A6C8
pAIScripting0x26_L003:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $00, pAIScripting0x26_L008)   ;B4A6C9
    %AICMD0x09_StartScript($07, pAIScripting0x26_L173)                                   ;B4A6D0
    %AICMD0x41_AddValue16(nLove_Maria, 30)                     ;B4A6D4
    %AICMD0x12_Jump(pAIScripting0x26_L185)                                   ;B4A6DA
pAIScripting0x26_L004:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $01, pAIScripting0x26_L009)   ;B4A6DD
    %AICMD0x09_StartScript($07, pAIScripting0x26_L175)                                   ;B4A6E4
    %AICMD0x41_AddValue16(nLove_Ann, 30)                       ;B4A6E8
    %AICMD0x12_Jump(pAIScripting0x26_L185)                                   ;B4A6EE
pAIScripting0x26_L005:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, pAIScripting0x26_L010)   ;B4A6F1
    %AICMD0x09_StartScript($07, pAIScripting0x26_L177)                                   ;B4A6F8
    %AICMD0x41_AddValue16(nLove_Nina, 30)                      ;B4A6FC
    %AICMD0x12_Jump(pAIScripting0x26_L185)                                   ;B4A702
pAIScripting0x26_L006:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $03, pAIScripting0x26_L011)   ;B4A705
    %AICMD0x09_StartScript($07, pAIScripting0x26_L179)                                   ;B4A70C
    %AICMD0x41_AddValue16(nLove_Ellen, 30)                     ;B4A710
    %AICMD0x12_Jump(pAIScripting0x26_L185)                                   ;B4A716
pAIScripting0x26_L007:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $04, pAIScripting0x26_L012)   ;B4A719
    %AICMD0x09_StartScript($07, pAIScripting0x26_L181)                                   ;B4A720
    %AICMD0x41_AddValue16(nLove_Eve, 30)                       ;B4A724
    %AICMD0x12_Jump(pAIScripting0x26_L185)                                   ;B4A72A
pAIScripting0x26_L008:
    %AICMD0x41_AddValue16(nLove_Maria, 30)                     ;B4A72D
    %AICMD0x12_Jump(pAIScripting0x26_L013)                                   ;B4A733
pAIScripting0x26_L009:
    %AICMD0x41_AddValue16(nLove_Ann, 30)                       ;B4A736
    %AICMD0x12_Jump(pAIScripting0x26_L013)                                   ;B4A73C
pAIScripting0x26_L010:
    %AICMD0x41_AddValue16(nLove_Nina, 30)                      ;B4A73F
    %AICMD0x12_Jump(pAIScripting0x26_L013)                                   ;B4A745
pAIScripting0x26_L011:
    %AICMD0x41_AddValue16(nLove_Ellen, 30)                     ;B4A748
    %AICMD0x12_Jump(pAIScripting0x26_L013)                                   ;B4A74E
pAIScripting0x26_L012:
    %AICMD0x41_AddValue16(nLove_Eve, 30)                       ;B4A751
pAIScripting0x26_L013:
    %AICMD0x09_StartScript($07, pAIScripting0x26_L183)                                   ;B4A757
    %AICMD0x12_Jump(pAIScripting0x26_L185)                                   ;B4A75B
pAIScripting0x26_L014:
    %AICMD0x1A($0108, $00B8, aAIScriptingData_L193, $00)                     ;B4A75E
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B4A766
    %AICMD0x1B($02A2, $01)                                     ;B4A768
    %AICMD0x0D($01, $00, $30, $01)                             ;B4A76C
    %AICMD0x1B($029E, $01)                                     ;B4A771
    %AICMD0x0D($00, $01, $40, $01)                             ;B4A775
    %AICMD0x1B($02A2, $00)                                     ;B4A77A
    %AICMD0x0D($FF, $00, $10, $01)                             ;B4A77E
    %AICMD0x1B($02A1, $00)                                     ;B4A783
    %AICMD0x2A($0045)                                          ;B4A787
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4A78A
    %AICMD0x1C_ShowDialog($0244, $00)                          ;B4A78C
    %AICMD0x0B_SetScriptFlag($01)                                            ;B4A790
    %AICMD0x2F(aAIScriptingData_L048)                                        ;B4A792
pAIScripting0x26_L015:
    %AICMD0x1F(pAIScripting0x26_L016)                                        ;B4A795
    %AICMD0x12_Jump(pAIScripting0x26_L015)                                   ;B4A798
pAIScripting0x26_L016:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $05, pAIScripting0x26_L017) ;B4A79B
    %AICMD0x1C_ShowDialog($0286, $00)                          ;B4A7A2
    %AICMD0x12_Jump(pAIScripting0x26_L015)                                   ;B4A7A6
pAIScripting0x26_L017:
    %AICMD0x1C_ShowDialog($028C, $00)                          ;B4A7A9
    %AICMD0x12_Jump(pAIScripting0x26_L015)                                   ;B4A7AD
pAIScripting0x26_L018:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown2, $00, pAIScripting0x26_L021) ;B4A7B0
    %AICMD0x15_JumpIfEquals8($80091E, 21, pAIScripting0x26_L020)             ;B4A7B7
    %AICMD0x15_JumpIfEquals8($80091E, 22, pAIScripting0x26_L020)             ;B4A7BE
    %AICMD0x15_JumpIfEquals8($80091E, 23, pAIScripting0x26_L020)             ;B4A7C5
    %AICMD0x15_JumpIfEquals8($80091E, 1, pAIScripting0x26_L020)              ;B4A7CC
    %AICMD0x15_JumpIfEquals8($80091E, 2, pAIScripting0x26_L019)              ;B4A7D3
    %AICMD0x15_JumpIfEquals8($80091E, 20, pAIScripting0x26_L020)             ;B4A7DA
    %AICMD0x15_JumpIfEquals8($80091E, 7, pAIScripting0x26_L022)              ;B4A7E1
    %AICMD0x15_JumpIfEquals8($80091E, 5, pAIScripting0x26_L022)              ;B4A7E8
    %AICMD0x15_JumpIfEquals8($80091E, 24, pAIScripting0x26_L020)             ;B4A7EF
    %AICMD0x16_JumpIfBetween8($80091E, 9, 12, pAIScripting0x26_L019)         ;B4A7F6
    %AICMD0x15_JumpIfEquals8($80091E, 26, pAIScripting0x26_L019)             ;B4A7FE
    %AICMD0x12_Jump(pAIScripting0x26_L019)                                   ;B4A805
pAIScripting0x26_L019:
    %AICMD0x17_RollRandom($02)                                            ;B4A808
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x26_L027)                                   ;B4A80A
    %AICMD0x18_JumpIfRandomEquals($01, pAIScripting0x26_L028)                                   ;B4A80E
    %AICMD0x10_End()                                           ;B4A812
pAIScripting0x26_L020:
    %AICMD0x17_RollRandom($04)                                            ;B4A813
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x26_L023)                                   ;B4A815
    %AICMD0x18_JumpIfRandomEquals($01, pAIScripting0x26_L024)                                   ;B4A819
    %AICMD0x18_JumpIfRandomEquals($02, pAIScripting0x26_L025)                                   ;B4A81D
    %AICMD0x18_JumpIfRandomEquals($03, pAIScripting0x26_L026)                                   ;B4A821
    %AICMD0x10_End()                                           ;B4A825
pAIScripting0x26_L021:
    %AICMD0x1A($0118, $00F8, aAIScriptingData_L194, $00)                     ;B4A826
    %AICMD0x13_Wait(16)                                        ;B4A82E
    %AICMD0x0D($F8, $F8, $01, $01)                             ;B4A831
    %AICMD0x13_Wait(4)                                         ;B4A836
    %AICMD0x19($0034, $00)                                     ;B4A839
    %AICMD0x12_Jump(pAIScripting0x26_L030)                                   ;B4A83D
pAIScripting0x26_L022:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $0F, pAIScripting0x26_L029)   ;B4A840
    %AICMD0x1A($0118, $00F8, aAIScriptingData_L123, $00)                     ;B4A847
    %AICMD0x13_Wait(16)                                        ;B4A84F
    %AICMD0x0D($F8, $F8, $01, $01)                             ;B4A852
    %AICMD0x13_Wait(4)                                         ;B4A857
    %AICMD0x19($003B, $00)                                     ;B4A85A
    %AICMD0x21_AddValue8(nPowerBerryEaten, 1)                  ;B4A85E
    %AICMD0x21_AddValue8($800917, 10)                          ;B4A863
    %AICMD0x41_AddValue16(nPlayerHappiness, 10)                ;B4A868
    %AICMD0x23_OrWithIndexedValue(strcFlags.event5, $0F)       ;B4A86E
    %AICMD0x12_Jump(pAIScripting0x26_L030)                                   ;B4A873
pAIScripting0x26_L023:
    %AICMD0x1A($0118, $00F8, aAIScriptingData_L195, $00)                     ;B4A876
    %AICMD0x13_Wait(16)                                        ;B4A87E
    %AICMD0x0D($F8, $F8, $01, $01)                             ;B4A881
    %AICMD0x13_Wait(4)                                         ;B4A886
    %AICMD0x19($00F7, $00)                                     ;B4A889
    %AICMD0x12_Jump(pAIScripting0x26_L030)                                   ;B4A88D
pAIScripting0x26_L024:
    %AICMD0x1A($0118, $00F8, aAIScriptingData_L196, $00)                     ;B4A890
    %AICMD0x13_Wait(16)                                        ;B4A898
    %AICMD0x0D($F8, $F8, $01, $01)                             ;B4A89B
    %AICMD0x13_Wait(4)                                         ;B4A8A0
    %AICMD0x19($00F6, $00)                                     ;B4A8A3
    %AICMD0x12_Jump(pAIScripting0x26_L030)                                   ;B4A8A7
pAIScripting0x26_L025:
    %AICMD0x1A($0118, $00F8, aAIScriptingData_L197, $00)                     ;B4A8AA
    %AICMD0x13_Wait(16)                                        ;B4A8B2
    %AICMD0x0D($F8, $F8, $01, $01)                             ;B4A8B5
    %AICMD0x13_Wait(4)                                         ;B4A8BA
    %AICMD0x19($00F9, $00)                                     ;B4A8BD
    %AICMD0x12_Jump(pAIScripting0x26_L030)                                   ;B4A8C1
pAIScripting0x26_L026:
    %AICMD0x1A($0118, $00F8, aAIScriptingData_L191, $00)                     ;B4A8C4
    %AICMD0x13_Wait(16)                                        ;B4A8CC
    %AICMD0x0D($F8, $F8, $01, $01)                             ;B4A8CF
    %AICMD0x13_Wait(4)                                         ;B4A8D4
    %AICMD0x19($00F8, $00)                                     ;B4A8D7
    %AICMD0x12_Jump(pAIScripting0x26_L030)                                   ;B4A8DB
pAIScripting0x26_L027:
    %AICMD0x1A($0118, $00F8, aAIScriptingData_L085, $00)                     ;B4A8DE
    %AICMD0x13_Wait(16)                                        ;B4A8E6
    %AICMD0x0D($F8, $F8, $01, $01)                             ;B4A8E9
    %AICMD0x13_Wait(4)                                         ;B4A8EE
    %AICMD0x19($00FD, $00)                                     ;B4A8F1
    %AICMD0x12_Jump(pAIScripting0x26_L030)                                   ;B4A8F5
pAIScripting0x26_L028:
    %AICMD0x1A($0118, $00F8, aAIScriptingData_L084, $00)                     ;B4A8F8
    %AICMD0x13_Wait(16)                                        ;B4A900
    %AICMD0x0D($F8, $F8, $01, $01)                             ;B4A903
    %AICMD0x13_Wait(4)                                         ;B4A908
    %AICMD0x19($00FC, $00)                                     ;B4A90B
    %AICMD0x12_Jump(pAIScripting0x26_L030)                                   ;B4A90F
pAIScripting0x26_L029:
    %AICMD0x1A($0118, $00F8, aAIScriptingData_L127, $00)                     ;B4A912
    %AICMD0x13_Wait(16)                                        ;B4A91A
    %AICMD0x0D($F8, $F8, $01, $01)                             ;B4A91D
    %AICMD0x13_Wait(4)                                         ;B4A922
    %AICMD0x19($003A, $00)                                     ;B4A925
    %AICMD0x12_Jump(pAIScripting0x26_L030)                                   ;B4A929
pAIScripting0x26_L030:
    %AICMD0x37()                                               ;B4A92C
    %AICMD0x10_End()                                           ;B4A92D
pAIScripting0x26_L031:
    %AICMD0x1A($0148, $00A0, aAIScriptingData_L084, $00)                     ;B4A92E
    %AICMD0x13_Wait(1)                                         ;B4A936
    %AICMD0x37()                                               ;B4A939
    %AICMD0x10_End()                                           ;B4A93A
pAIScripting0x26_L032:
    %AICMD0x1A($0148, $00A8, aAIScriptingData_L086, $00)                     ;B4A93B
    %AICMD0x13_Wait(1)                                         ;B4A943
    %AICMD0x37()                                               ;B4A946
    %AICMD0x10_End()                                           ;B4A947
pAIScripting0x26_L033:
    %AICMD0x1A($0148, $00A8, aAIScriptingData_L188, $00)                     ;B4A948
    %AICMD0x13_Wait(1)                                         ;B4A950
    %AICMD0x37()                                               ;B4A953
    %AICMD0x10_End()                                           ;B4A954
pAIScripting0x26_L034:
    %AICMD0x1A($0108, $0098, aAIScriptingData_L185, $00)                     ;B4A955
    %AICMD0x13_Wait(1)                                         ;B4A95D
    %AICMD0x37()                                               ;B4A960
    %AICMD0x10_End()                                           ;B4A961
pAIScripting0x26_L035:
    %AICMD0x1A($0198, $00C8, aAIScriptingData_L064, $00)                     ;B4A962
pAIScripting0x26_L036:
    %AICMD0x1F(pAIScripting0x26_L037)                                        ;B4A96A
    %AICMD0x12_Jump(pAIScripting0x26_L036)                                   ;B4A96D
pAIScripting0x26_L037:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, pAIScripting0x26_L038)   ;B4A970
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $05, pAIScripting0x26_L039) ;B4A977
    %AICMD0x1C_ShowDialog($0247, $00)                          ;B4A97E
    %AICMD0x12_Jump(pAIScripting0x26_L036)                                   ;B4A982
pAIScripting0x26_L038:
    %AICMD0x1C_ShowDialog($0492, $00)                          ;B4A985
    %AICMD0x12_Jump(pAIScripting0x26_L036)                                   ;B4A989
pAIScripting0x26_L039:
    %AICMD0x1C_ShowDialog($0284, $00)                          ;B4A98C
    %AICMD0x12_Jump(pAIScripting0x26_L036)                                   ;B4A990
pAIScripting0x26_L040:
    %AICMD0x1A($00B8, $0108, aAIScriptingData_L050, $00)                     ;B4A993
pAIScripting0x26_L041:
    %AICMD0x1F(pAIScripting0x26_L042)                                        ;B4A99B
    %AICMD0x12_Jump(pAIScripting0x26_L041)                                   ;B4A99E
pAIScripting0x26_L042:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $05, pAIScripting0x26_L043) ;B4A9A1
    %AICMD0x1C_ShowDialog($0248, $00)                          ;B4A9A8
    %AICMD0x12_Jump(pAIScripting0x26_L041)                                   ;B4A9AC
pAIScripting0x26_L043:
    %AICMD0x1C_ShowDialog($0285, $00)                          ;B4A9AF
    %AICMD0x12_Jump(pAIScripting0x26_L041)                                   ;B4A9B3
    %AICMD0x1A($00B8, $0108, aAIScriptingData_L053, $03)                     ;B4A9B6
pAIScripting0x26_L044:
    %AICMD0x1F(pAIScripting0x26_L045)                                        ;B4A9BE
    %AICMD0x12_Jump(pAIScripting0x26_L044)                                   ;B4A9C1
pAIScripting0x26_L045:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $05, pAIScripting0x26_L046) ;B4A9C4
    %AICMD0x1C_ShowDialog($0248, $00)                          ;B4A9CB
    %AICMD0x12_Jump(pAIScripting0x26_L044)                                   ;B4A9CF
pAIScripting0x26_L046:
    %AICMD0x1C_ShowDialog($0288, $00)                          ;B4A9D2
    %AICMD0x12_Jump(pAIScripting0x26_L044)                                   ;B4A9D6
pAIScripting0x26_L047:
    %AICMD0x1A($0078, $00F8, aAIScriptingData_L061, $02)                     ;B4A9D9
pAIScripting0x26_L048:
    %AICMD0x1F(pAIScripting0x26_L050)                                        ;B4A9E1
    %AICMD0x12_Jump(pAIScripting0x26_L048)                                   ;B4A9E4
pAIScripting0x26_L049:
    %AICMD0x1F(pAIScripting0x26_L051)                                        ;B4A9E7
    %AICMD0x12_Jump(pAIScripting0x26_L049)                                   ;B4A9EA
pAIScripting0x26_L050:
    %AICMD0x1C_ShowDialog($0245, $00)                          ;B4A9ED
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $00, pAIScripting0x26_L048) ;B4A9F1
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $01, pAIScripting0x26_L048) ;B4A9F8
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $02, pAIScripting0x26_L048) ;B4A9FF
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $03, pAIScripting0x26_L048) ;B4AA06
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $04, pAIScripting0x26_L048) ;B4AA0D
    %AICMD0x08_EnableAIControl()                               ;B4AA14
    %AICMD0x1B($02C7, $00)                                     ;B4AA15
    %AICMD0x0D($00, $FF, $30, $01)                             ;B4AA19
    %AICMD0x1B($02C4, $00)                                     ;B4AA1E
    %AICMD0x11_EnableUserControl()                             ;B4AA22
    %AICMD0x12_Jump(pAIScripting0x26_L049)                                   ;B4AA23
pAIScripting0x26_L051:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $05, pAIScripting0x26_L052) ;B4AA26
    %AICMD0x1C_ShowDialog($0245, $00)                          ;B4AA2D
    %AICMD0x12_Jump(pAIScripting0x26_L049)                                   ;B4AA31
pAIScripting0x26_L052:
    %AICMD0x1C_ShowDialog($0282, $00)                          ;B4AA34
    %AICMD0x12_Jump(pAIScripting0x26_L049)                                   ;B4AA38
    %AICMD0x1A($0158, $00C8, aAIScriptingData_L046, $00)                     ;B4AA3B
pAIScripting0x26_L053:
    %AICMD0x1F(pAIScripting0x26_L054)                                        ;B4AA43
    %AICMD0x12_Jump(pAIScripting0x26_L053)                                   ;B4AA46
pAIScripting0x26_L054:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $05, pAIScripting0x26_L055) ;B4AA49
    %AICMD0x1C_ShowDialog($0246, $00)                          ;B4AA50
    %AICMD0x12_Jump(pAIScripting0x26_L053)                                   ;B4AA54
pAIScripting0x26_L055:
    %AICMD0x1C_ShowDialog($0283, $00)                          ;B4AA57
    %AICMD0x12_Jump(pAIScripting0x26_L053)                                   ;B4AA5B
    %AICMD0x1A($0098, $00A8, aAIScriptingData_L051, $00)                     ;B4AA5E
pAIScripting0x26_L056:
    %AICMD0x1F(pAIScripting0x26_L057)                                        ;B4AA66
    %AICMD0x12_Jump(pAIScripting0x26_L056)                                   ;B4AA69
pAIScripting0x26_L057:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $05, pAIScripting0x26_L058) ;B4AA6C
    %AICMD0x1C_ShowDialog($024C, $00)                          ;B4AA73
    %AICMD0x12_Jump(pAIScripting0x26_L056)                                   ;B4AA77
pAIScripting0x26_L058:
    %AICMD0x1C_ShowDialog($028A, $00)                          ;B4AA7A
    %AICMD0x12_Jump(pAIScripting0x26_L056)                                   ;B4AA7E
pAIScripting0x26_L059:
    %AICMD0x1A($0168, $0108, aAIScriptingData_L067, $01)                     ;B4AA81
pAIScripting0x26_L060:
    %AICMD0x1F(pAIScripting0x26_L061)                                        ;B4AA89
    %AICMD0x12_Jump(pAIScripting0x26_L060)                                   ;B4AA8C
pAIScripting0x26_L061:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $05, pAIScripting0x26_L062) ;B4AA8F
    %AICMD0x1C_ShowDialog($0249, $00)                          ;B4AA96
    %AICMD0x12_Jump(pAIScripting0x26_L060)                                   ;B4AA9A
pAIScripting0x26_L062:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $00, pAIScripting0x26_L063)   ;B4AA9D
    %AICMD0x1C_ShowDialog($0288, $00)                          ;B4AAA4
    %AICMD0x12_Jump(pAIScripting0x26_L060)                                   ;B4AAA8
pAIScripting0x26_L063:
    %AICMD0x1C_ShowDialog($0250, $00)                          ;B4AAAB
    %AICMD0x12_Jump(pAIScripting0x26_L060)                                   ;B4AAAF
pAIScripting0x26_L064:
    %AICMD0x1A($0148, $0158, aAIScriptingData_L055, $01)                     ;B4AAB2
pAIScripting0x26_L065:
    %AICMD0x1F(pAIScripting0x26_L066)                                        ;B4AABA
    %AICMD0x12_Jump(pAIScripting0x26_L065)                                   ;B4AABD
pAIScripting0x26_L066:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $05, pAIScripting0x26_L067) ;B4AAC0
    %AICMD0x1C_ShowDialog($024F, $00)                          ;B4AAC7
    %AICMD0x12_Jump(pAIScripting0x26_L065)                                   ;B4AACB
pAIScripting0x26_L067:
    %AICMD0x1C_ShowDialog($0287, $00)                          ;B4AACE
    %AICMD0x12_Jump(pAIScripting0x26_L065)                                   ;B4AAD2
    %AICMD0x1A($00A8, $0148, aAIScriptingData_L042, $03)                     ;B4AAD5
pAIScripting0x26_L068:
    %AICMD0x1F(pAIScripting0x26_L069)                                        ;B4AADD
    %AICMD0x12_Jump(pAIScripting0x26_L068)                                   ;B4AAE0
pAIScripting0x26_L069:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $05, pAIScripting0x26_L070) ;B4AAE3
    %AICMD0x1C_ShowDialog($024E, $00)                          ;B4AAEA
    %AICMD0x12_Jump(pAIScripting0x26_L068)                                   ;B4AAEE
pAIScripting0x26_L070:
    %AICMD0x1C_ShowDialog($028C, $00)                          ;B4AAF1
    %AICMD0x12_Jump(pAIScripting0x26_L068)                                   ;B4AAF5
    %AICMD0x1A($0128, $0148, aAIScriptingData_L035, $01)                     ;B4AAF8
pAIScripting0x26_L071:
    %AICMD0x1F(pAIScripting0x26_L072)                                        ;B4AB00
    %AICMD0x12_Jump(pAIScripting0x26_L071)                                   ;B4AB03
pAIScripting0x26_L072:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $05, pAIScripting0x26_L073) ;B4AB06
    %AICMD0x1C_ShowDialog($024A, $00)                          ;B4AB0D
    %AICMD0x12_Jump(pAIScripting0x26_L071)                                   ;B4AB11
pAIScripting0x26_L073:
    %AICMD0x1C_ShowDialog($0288, $00)                          ;B4AB14
    %AICMD0x12_Jump(pAIScripting0x26_L071)                                   ;B4AB18
    %AICMD0x1A($0108, $0158, aAIScriptingData_L037, $01)                     ;B4AB1B
pAIScripting0x26_L074:
    %AICMD0x1F(pAIScripting0x26_L075)                                        ;B4AB23
    %AICMD0x12_Jump(pAIScripting0x26_L074)                                   ;B4AB26
pAIScripting0x26_L075:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $05, pAIScripting0x26_L076) ;B4AB29
    %AICMD0x1C_ShowDialog($024B, $00)                          ;B4AB30
    %AICMD0x12_Jump(pAIScripting0x26_L074)                                   ;B4AB34
pAIScripting0x26_L076:
    %AICMD0x1C_ShowDialog($0289, $00)                          ;B4AB37
    %AICMD0x12_Jump(pAIScripting0x26_L074)                                   ;B4AB3B
    %AICMD0x1A($0088, $0158, aAIScriptingData_L033, $02)                     ;B4AB3E
pAIScripting0x26_L077:
    %AICMD0x1F(pAIScripting0x26_L078)                                        ;B4AB46
    %AICMD0x12_Jump(pAIScripting0x26_L077)                                   ;B4AB49
pAIScripting0x26_L078:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $05, pAIScripting0x26_L079) ;B4AB4C
    %AICMD0x1C_ShowDialog($024D, $00)                          ;B4AB53
    %AICMD0x12_Jump(pAIScripting0x26_L077)                                   ;B4AB57
pAIScripting0x26_L079:
    %AICMD0x1C_ShowDialog($028B, $00)                          ;B4AB5A
    %AICMD0x12_Jump(pAIScripting0x26_L077)                                   ;B4AB5E
pAIScripting0x26_L080:
    %AICMD0x1A($0058, $00E8, aAIScriptingData_L044, $02)                     ;B4AB61
pAIScripting0x26_L081:
    %AICMD0x1F(pAIScripting0x26_L083)                                        ;B4AB69
    %AICMD0x12_Jump(pAIScripting0x26_L081)                                   ;B4AB6C
pAIScripting0x26_L082:
    %AICMD0x1F(pAIScripting0x26_L084)                                        ;B4AB6F
    %AICMD0x12_Jump(pAIScripting0x26_L082)                                   ;B4AB72
pAIScripting0x26_L083:
    %AICMD0x1D_ShowDialog($0234, $00)                          ;B4AB75
    %AICMD0x20_JumpIfChoice(0, pAIScripting0x26_L084)                        ;B4AB79
    %AICMD0x20_JumpIfChoice(1, pAIScripting0x26_L085)                        ;B4AB7D
    %AICMD0x12_Jump(pAIScripting0x26_L081)                                   ;B4AB81
pAIScripting0x26_L084:
    %AICMD0x1C_ShowDialog($0235, $00)                          ;B4AB84
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown1, $05)     ;B4AB88
    %AICMD0x12_Jump(pAIScripting0x26_L082)                                   ;B4AB8D
pAIScripting0x26_L085:
    %AICMD0x1C_ShowDialog($0236, $00)                          ;B4AB90
    %AICMD0x12_Jump(pAIScripting0x26_L081)                                   ;B4AB94
pAIScripting0x26_L086:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $00, pAIScripting0x26_L087)   ;B4AB97
    %AICMD0x1A($00C8, $0158, aAIScriptingData_L011, $02)                     ;B4AB9E
    %AICMD0x12_Jump(pAIScripting0x26_L088)                                   ;B4ABA6
pAIScripting0x26_L087:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event6, $04, pAIScripting0x26_L097)   ;B4ABA9
    %AICMD0x1A($00C8, $0158, aAIScriptingData_L071, $02)                     ;B4ABB0
pAIScripting0x26_L088:
    %AICMD0x1F(pAIScripting0x26_L090)                                        ;B4ABB8
    %AICMD0x12_Jump(pAIScripting0x26_L088)                                   ;B4ABBB
pAIScripting0x26_L089:
    %AICMD0x1F(pAIScripting0x26_L096)                                        ;B4ABBE
    %AICMD0x12_Jump(pAIScripting0x26_L089)                                   ;B4ABC1
pAIScripting0x26_L090:
    %AICMD0x28_ClearBit(strcFlags.unknown1, $00)                        ;B4ABC4
    %AICMD0x15_JumpIfEquals8(nCurrentYearID, 0, pAIScripting0x26_L092)       ;B4ABC9
    %AICMD0x15_JumpIfEquals8(nCurrentYearID, 1, pAIScripting0x26_L095)       ;B4ABD0
    %AICMD0x12_Jump(pAIScripting0x26_L088)                                   ;B4ABD7
pAIScripting0x26_L091:
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown1, $00)     ;B4ABDA
    %AICMD0x0B_SetScriptFlag($02)                                            ;B4ABDF
    %AICMD0x12_Jump(pAIScripting0x26_L088)                                   ;B4ABE1
pAIScripting0x26_L092:
    %AICMD0x1D_ShowDialog($0252, $00)                          ;B4ABE4
    %AICMD0x20_JumpIfChoice(0, pAIScripting0x26_L093)                        ;B4ABE8
    %AICMD0x20_JumpIfChoice(1, pAIScripting0x26_L094)                        ;B4ABEC
    %AICMD0x12_Jump(pAIScripting0x26_L089)                                   ;B4ABF0
pAIScripting0x26_L093:
    %AICMD0x1C_ShowDialog($0253, $00)                          ;B4ABF3
    %AICMD0x41_AddValue16(nLove_Maria, 8)                      ;B4ABF7
    %AICMD0x12_Jump(pAIScripting0x26_L089)                                   ;B4ABFD
pAIScripting0x26_L094:
    %AICMD0x1C_ShowDialog($0254, $00)                          ;B4AC00
    %AICMD0x41_AddValue16(nLove_Maria, 2)                      ;B4AC04
    %AICMD0x12_Jump(pAIScripting0x26_L089)                                   ;B4AC0A
pAIScripting0x26_L095:
    %AICMD0x1C_ShowDialog($025D, $00)                          ;B4AC0D
    %AICMD0x12_Jump(pAIScripting0x26_L089)                                   ;B4AC11
    %AICMD0x1C_ShowDialog($026A, $00)                          ;B4AC14
    %AICMD0x12_Jump(pAIScripting0x26_L089)                                   ;B4AC18
    %AICMD0x1C_ShowDialog($0272, $00)                          ;B4AC1B
    %AICMD0x12_Jump(pAIScripting0x26_L089)                                   ;B4AC1F
    %AICMD0x1C_ShowDialog($027A, $00)                          ;B4AC22
    %AICMD0x12_Jump(pAIScripting0x26_L089)                                   ;B4AC26
pAIScripting0x26_L096:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $05, pAIScripting0x26_L091) ;B4AC29
    %AICMD0x1C_ShowDialog($027A, $00)                          ;B4AC30
    %AICMD0x12_Jump(pAIScripting0x26_L089)                                   ;B4AC34
pAIScripting0x26_L097:
    %AICMD0x28_ClearBit(strcFlags.unknown1, $00)                        ;B4AC37
    %AICMD0x10_End()                                           ;B4AC3C
pAIScripting0x26_L098:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $01, pAIScripting0x26_L099)   ;B4AC3D
    %AICMD0x1A($0098, $0058, aAIScriptingData_L015, $00)                     ;B4AC44
    %AICMD0x12_Jump(pAIScripting0x26_L100)                                   ;B4AC4C
pAIScripting0x26_L099:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event6, $04, pAIScripting0x26_L113)   ;B4AC4F
    %AICMD0x1A($0098, $0058, aAIScriptingData_L071, $00)                     ;B4AC56
pAIScripting0x26_L100:
    %AICMD0x1F(pAIScripting0x26_L102)                                        ;B4AC5E
    %AICMD0x12_Jump(pAIScripting0x26_L100)                                   ;B4AC61
pAIScripting0x26_L101:
    %AICMD0x1F(pAIScripting0x26_L112)                                        ;B4AC64
    %AICMD0x12_Jump(pAIScripting0x26_L101)                                   ;B4AC67
pAIScripting0x26_L102:
    %AICMD0x28_ClearBit(strcFlags.unknown1, $01)                        ;B4AC6A
    %AICMD0x15_JumpIfEquals8(nCurrentYearID, 0, pAIScripting0x26_L104)       ;B4AC6F
    %AICMD0x15_JumpIfEquals8(nCurrentYearID, 1, pAIScripting0x26_L109)       ;B4AC76
    %AICMD0x12_Jump(pAIScripting0x26_L100)                                   ;B4AC7D
pAIScripting0x26_L103:
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown1, $01)     ;B4AC80
    %AICMD0x0B_SetScriptFlag($02)                                            ;B4AC85
    %AICMD0x12_Jump(pAIScripting0x26_L100)                                   ;B4AC87
pAIScripting0x26_L104:
    %AICMD0x1D_ShowDialog($025E, $00)                          ;B4AC8A
    %AICMD0x20_JumpIfChoice(0, pAIScripting0x26_L105)                        ;B4AC8E
    %AICMD0x20_JumpIfChoice(1, pAIScripting0x26_L106)                        ;B4AC92
    %AICMD0x12_Jump(pAIScripting0x26_L101)                                   ;B4AC96
pAIScripting0x26_L105:
    %AICMD0x08_EnableAIControl()                               ;B4AC99
    %AICMD0x19($00E9, $00)                                     ;B4AC9A
    %AICMD0x13_Wait(120)                                       ;B4AC9E
    %AICMD0x11_EnableUserControl()                             ;B4ACA1
    %AICMD0x1C_ShowDialog($025F, $00)                          ;B4ACA2
    %AICMD0x41_AddValue16(nLove_Ann, 8)                        ;B4ACA6
    %AICMD0x12_Jump(pAIScripting0x26_L101)                                   ;B4ACAC
pAIScripting0x26_L106:
    %AICMD0x1C_ShowDialog($0260, $00)                          ;B4ACAF
    %AICMD0x1B($0345, $00)                                     ;B4ACB3
    %AICMD0x1B($0346, $00)                                     ;B4ACB7
    %AICMD0x13_Wait(40)                                        ;B4ACBB
    %AICMD0x1C_ShowDialog($0261, $00)                          ;B4ACBE
    %AICMD0x1B($0226, $00)                                     ;B4ACC2
    %AICMD0x41_AddValue16(nLove_Ann, 2)                        ;B4ACC6
    %AICMD0x12_Jump(pAIScripting0x26_L101)                                   ;B4ACCC
    %AICMD0x1D_ShowDialog($026B, $00)                          ;B4ACCF
    %AICMD0x20_JumpIfChoice(0, pAIScripting0x26_L107)                        ;B4ACD3
    %AICMD0x20_JumpIfChoice(1, pAIScripting0x26_L108)                        ;B4ACD7
    %AICMD0x12_Jump(pAIScripting0x26_L101)                                   ;B4ACDB
pAIScripting0x26_L107:
    %AICMD0x08_EnableAIControl()                               ;B4ACDE
    %AICMD0x19($00E9, $00)                                     ;B4ACDF
    %AICMD0x13_Wait(120)                                       ;B4ACE3
    %AICMD0x11_EnableUserControl()                             ;B4ACE6
    %AICMD0x1C_ShowDialog($025F, $00)                          ;B4ACE7
    %AICMD0x41_AddValue16(nLove_Ann, 8)                        ;B4ACEB
    %AICMD0x12_Jump(pAIScripting0x26_L101)                                   ;B4ACF1
pAIScripting0x26_L108:
    %AICMD0x1C_ShowDialog($0260, $00)                          ;B4ACF4
    %AICMD0x1B($0345, $00)                                     ;B4ACF8
    %AICMD0x1B($0346, $00)                                     ;B4ACFC
    %AICMD0x13_Wait(40)                                        ;B4AD00
    %AICMD0x1C_ShowDialog($026C, $00)                          ;B4AD03
    %AICMD0x1B($0226, $00)                                     ;B4AD07
    %AICMD0x41_AddValue16(nLove_Ann, 2)                        ;B4AD0B
    %AICMD0x12_Jump(pAIScripting0x26_L101)                                   ;B4AD11
pAIScripting0x26_L109:
    %AICMD0x1C_ShowDialog($027B, $00)                          ;B4AD14
    %AICMD0x20_JumpIfChoice(0, pAIScripting0x26_L110)                        ;B4AD18
    %AICMD0x20_JumpIfChoice(1, pAIScripting0x26_L111)                        ;B4AD1C
    %AICMD0x12_Jump(pAIScripting0x26_L101)                                   ;B4AD20
pAIScripting0x26_L110:
    %AICMD0x08_EnableAIControl()                               ;B4AD23
    %AICMD0x19($00E9, $00)                                     ;B4AD24
    %AICMD0x13_Wait(120)                                       ;B4AD28
    %AICMD0x11_EnableUserControl()                             ;B4AD2B
    %AICMD0x1C_ShowDialog($025F, $00)                          ;B4AD2C
    %AICMD0x41_AddValue16(nLove_Ann, 8)                        ;B4AD30
    %AICMD0x12_Jump(pAIScripting0x26_L101)                                   ;B4AD36
pAIScripting0x26_L111:
    %AICMD0x1B($0345, $00)                                     ;B4AD39
    %AICMD0x1B($0346, $00)                                     ;B4AD3D
    %AICMD0x13_Wait(60)                                        ;B4AD41
    %AICMD0x1C_ShowDialog($026C, $00)                          ;B4AD44
    %AICMD0x1B($0226, $00)                                     ;B4AD48
    %AICMD0x12_Jump(pAIScripting0x26_L101)                                   ;B4AD4C
pAIScripting0x26_L112:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $05, pAIScripting0x26_L103) ;B4AD4F
    %AICMD0x1C_ShowDialog($0255, $00)                          ;B4AD56
    %AICMD0x12_Jump(pAIScripting0x26_L101)                                   ;B4AD5A
pAIScripting0x26_L113:
    %AICMD0x28_ClearBit(strcFlags.unknown1, $01)                        ;B4AD5D
    %AICMD0x10_End()                                           ;B4AD62
pAIScripting0x26_L114:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, pAIScripting0x26_L115)   ;B4AD63
    %AICMD0x1A($0148, $00A8, aAIScriptingData_L019, $00)                     ;B4AD6A
    %AICMD0x12_Jump(pAIScripting0x26_L116)                                   ;B4AD72
pAIScripting0x26_L115:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event6, $04, pAIScripting0x26_L128)   ;B4AD75
    %AICMD0x1A($0148, $00A8, aAIScriptingData_L071, $00)                     ;B4AD7C
pAIScripting0x26_L116:
    %AICMD0x1F(pAIScripting0x26_L118)                                        ;B4AD84
    %AICMD0x12_Jump(pAIScripting0x26_L116)                                   ;B4AD87
pAIScripting0x26_L117:
    %AICMD0x1F(pAIScripting0x26_L127)                                        ;B4AD8A
    %AICMD0x12_Jump(pAIScripting0x26_L117)                                   ;B4AD8D
pAIScripting0x26_L118:
    %AICMD0x28_ClearBit(strcFlags.unknown1, $02)                        ;B4AD90
    %AICMD0x15_JumpIfEquals8(nCurrentYearID, 0, pAIScripting0x26_L120)       ;B4AD95
    %AICMD0x15_JumpIfEquals8(nCurrentYearID, 1, pAIScripting0x26_L123)       ;B4AD9C
    %AICMD0x12_Jump(pAIScripting0x26_L116)                                   ;B4ADA3
pAIScripting0x26_L119:
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown1, $02)     ;B4ADA6
    %AICMD0x0B_SetScriptFlag($02)                                            ;B4ADAB
    %AICMD0x12_Jump(pAIScripting0x26_L116)                                   ;B4ADAD
pAIScripting0x26_L120:
    %AICMD0x09_StartScript($14, pAIScripting0x26_L031)                                   ;B4ADB0
    %AICMD0x1D_ShowDialog($0256, $00)                          ;B4ADB4
    %AICMD0x20_JumpIfChoice(0, pAIScripting0x26_L121)                        ;B4ADB8
    %AICMD0x20_JumpIfChoice(1, pAIScripting0x26_L122)                        ;B4ADBC
    %AICMD0x12_Jump(pAIScripting0x26_L116)                                   ;B4ADC0
pAIScripting0x26_L121:
    %AICMD0x08_EnableAIControl()                               ;B4ADC3
    %AICMD0x19($00FC, $00)                                     ;B4ADC4
    %AICMD0x13_Wait(120)                                       ;B4ADC8
    %AICMD0x11_EnableUserControl()                             ;B4ADCB
    %AICMD0x1C_ShowDialog($0257, $00)                          ;B4ADCC
    %AICMD0x41_AddValue16(nLove_Nina, 8)                       ;B4ADD0
    %AICMD0x12_Jump(pAIScripting0x26_L117)                                   ;B4ADD6
pAIScripting0x26_L122:
    %AICMD0x1C_ShowDialog($0258, $00)                          ;B4ADD9
    %AICMD0x41_AddValue16(nLove_Nina, 2)                       ;B4ADDD
    %AICMD0x12_Jump(pAIScripting0x26_L117)                                   ;B4ADE3
pAIScripting0x26_L123:
    %AICMD0x09_StartScript($14, pAIScripting0x26_L033)                                   ;B4ADE6
    %AICMD0x1D_ShowDialog($0291, $00)                          ;B4ADEA
    %AICMD0x20_JumpIfChoice(0, pAIScripting0x26_L124)                        ;B4ADEE
    %AICMD0x20_JumpIfChoice(1, pAIScripting0x26_L125)                        ;B4ADF2
    %AICMD0x12_Jump(pAIScripting0x26_L117)                                   ;B4ADF6
pAIScripting0x26_L124:
    %AICMD0x08_EnableAIControl()                               ;B4ADF9
    %AICMD0x19($0038, $00)                                     ;B4ADFA
    %AICMD0x13_Wait(120)                                       ;B4ADFE
    %AICMD0x11_EnableUserControl()                             ;B4AE01
    %AICMD0x1C_ShowDialog($0262, $00)                          ;B4AE02
    %AICMD0x41_AddValue16(nLove_Nina, 8)                       ;B4AE06
    %AICMD0x12_Jump(pAIScripting0x26_L117)                                   ;B4AE0C
pAIScripting0x26_L125:
    %AICMD0x1C_ShowDialog($0263, $00)                          ;B4AE0F
    %AICMD0x41_AddValue16(nLove_Nina, 2)                       ;B4AE13
    %AICMD0x12_Jump(pAIScripting0x26_L117)                                   ;B4AE19
    %AICMD0x09_StartScript($14, pAIScripting0x26_L032)                                   ;B4AE1C
    %AICMD0x1D_ShowDialog($0256, $00)                          ;B4AE20
    %AICMD0x20_JumpIfChoice(0, pAIScripting0x26_L126)                        ;B4AE24
    %AICMD0x20_JumpIfChoice(1, pAIScripting0x26_L122)                        ;B4AE28
    %AICMD0x12_Jump(pAIScripting0x26_L117)                                   ;B4AE2C
pAIScripting0x26_L126:
    %AICMD0x08_EnableAIControl()                               ;B4AE2F
    %AICMD0x19($00FD, $00)                                     ;B4AE30
    %AICMD0x13_Wait(120)                                       ;B4AE34
    %AICMD0x11_EnableUserControl()                             ;B4AE37
    %AICMD0x1C_ShowDialog($027C, $00)                          ;B4AE38
    %AICMD0x41_AddValue16(nLove_Nina, 8)                       ;B4AE3C
    %AICMD0x12_Jump(pAIScripting0x26_L117)                                   ;B4AE42
    %AICMD0x1C_ShowDialog($0258, $00)                          ;B4AE45
    %AICMD0x41_AddValue16(nLove_Nina, 2)                       ;B4AE49
    %AICMD0x12_Jump(pAIScripting0x26_L117)                                   ;B4AE4F
pAIScripting0x26_L127:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $05, pAIScripting0x26_L119) ;B4AE52
    %AICMD0x1C_ShowDialog($026D, $00)                          ;B4AE59
    %AICMD0x12_Jump(pAIScripting0x26_L117)                                   ;B4AE5D
pAIScripting0x26_L128:
    %AICMD0x28_ClearBit(strcFlags.unknown1, $02)                        ;B4AE60
    %AICMD0x10_End()                                           ;B4AE65
pAIScripting0x26_L129:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $03, pAIScripting0x26_L130)   ;B4AE66
    %AICMD0x1A($0108, $0098, aAIScriptingData_L021, $00)                     ;B4AE6D
    %AICMD0x12_Jump(pAIScripting0x26_L131)                                   ;B4AE75
pAIScripting0x26_L130:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event6, $04, pAIScripting0x26_L144)   ;B4AE78
    %AICMD0x1A($0108, $0098, aAIScriptingData_L071, $00)                     ;B4AE7F
pAIScripting0x26_L131:
    %AICMD0x1F(pAIScripting0x26_L133)                                        ;B4AE87
    %AICMD0x12_Jump(pAIScripting0x26_L131)                                   ;B4AE8A
pAIScripting0x26_L132:
    %AICMD0x1F(pAIScripting0x26_L143)                                        ;B4AE8D
    %AICMD0x12_Jump(pAIScripting0x26_L132)                                   ;B4AE90
pAIScripting0x26_L133:
    %AICMD0x28_ClearBit(strcFlags.unknown1, $03)                        ;B4AE93
    %AICMD0x15_JumpIfEquals8(nCurrentYearID, 0, pAIScripting0x26_L135)       ;B4AE98
    %AICMD0x15_JumpIfEquals8(nCurrentYearID, 1, pAIScripting0x26_L138)       ;B4AE9F
    %AICMD0x12_Jump(pAIScripting0x26_L131)                                   ;B4AEA6
pAIScripting0x26_L134:
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown1, $03)     ;B4AEA9
    %AICMD0x0B_SetScriptFlag($02)                                            ;B4AEAE
    %AICMD0x12_Jump(pAIScripting0x26_L132)                                   ;B4AEB0
pAIScripting0x26_L135:
    %AICMD0x09_StartScript($14, pAIScripting0x26_L034)                                   ;B4AEB3
    %AICMD0x1D_ShowDialog($0259, $00)                          ;B4AEB7
    %AICMD0x20_JumpIfChoice(0, pAIScripting0x26_L136)                        ;B4AEBB
    %AICMD0x20_JumpIfChoice(1, pAIScripting0x26_L137)                        ;B4AEBF
    %AICMD0x12_Jump(pAIScripting0x26_L131)                                   ;B4AEC3
pAIScripting0x26_L136:
    %AICMD0x08_EnableAIControl()                               ;B4AEC6
    %AICMD0x19($0039, $00)                                     ;B4AEC7
    %AICMD0x13_Wait(120)                                       ;B4AECB
    %AICMD0x11_EnableUserControl()                             ;B4AECE
    %AICMD0x1C_ShowDialog($025A, $00)                          ;B4AECF
    %AICMD0x41_AddValue16(nLove_Ellen, 8)                      ;B4AED3
    %AICMD0x12_Jump(pAIScripting0x26_L132)                                   ;B4AED9
pAIScripting0x26_L137:
    %AICMD0x1C_ShowDialog($025B, $00)                          ;B4AEDC
    %AICMD0x41_AddValue16(nLove_Ellen, 2)                      ;B4AEE0
    %AICMD0x12_Jump(pAIScripting0x26_L132)                                   ;B4AEE6
pAIScripting0x26_L138:
    %AICMD0x09_StartScript($14, pAIScripting0x26_L034)                                   ;B4AEE9
    %AICMD0x1D_ShowDialog($0264, $00)                          ;B4AEED
    %AICMD0x20_JumpIfChoice(0, pAIScripting0x26_L139)                        ;B4AEF1
    %AICMD0x20_JumpIfChoice(1, pAIScripting0x26_L140)                        ;B4AEF5
    %AICMD0x12_Jump(pAIScripting0x26_L132)                                   ;B4AEF9
pAIScripting0x26_L139:
    %AICMD0x08_EnableAIControl()                               ;B4AEFC
    %AICMD0x19($0039, $00)                                     ;B4AEFD
    %AICMD0x13_Wait(120)                                       ;B4AF01
    %AICMD0x11_EnableUserControl()                             ;B4AF04
    %AICMD0x1C_ShowDialog($0265, $00)                          ;B4AF05
    %AICMD0x41_AddValue16(nLove_Ellen, 8)                      ;B4AF09
    %AICMD0x12_Jump(pAIScripting0x26_L132)                                   ;B4AF0F
pAIScripting0x26_L140:
    %AICMD0x1C_ShowDialog($0266, $00)                          ;B4AF12
    %AICMD0x41_AddValue16(nLove_Ellen, 2)                      ;B4AF16
    %AICMD0x12_Jump(pAIScripting0x26_L132)                                   ;B4AF1C
    %AICMD0x09_StartScript($14, pAIScripting0x26_L034)                                   ;B4AF1F
    %AICMD0x1D_ShowDialog($0275, $00)                          ;B4AF23
    %AICMD0x20_JumpIfChoice(0, pAIScripting0x26_L141)                        ;B4AF27
    %AICMD0x20_JumpIfChoice(1, pAIScripting0x26_L142)                        ;B4AF2B
    %AICMD0x12_Jump(pAIScripting0x26_L132)                                   ;B4AF2F
pAIScripting0x26_L141:
    %AICMD0x08_EnableAIControl()                               ;B4AF32
    %AICMD0x19($0039, $00)                                     ;B4AF33
    %AICMD0x13_Wait(120)                                       ;B4AF37
    %AICMD0x11_EnableUserControl()                             ;B4AF3A
    %AICMD0x1C_ShowDialog($0265, $00)                          ;B4AF3B
    %AICMD0x41_AddValue16(nLove_Ellen, 8)                      ;B4AF3F
    %AICMD0x12_Jump(pAIScripting0x26_L132)                                   ;B4AF45
pAIScripting0x26_L142:
    %AICMD0x1C_ShowDialog($0266, $00)                          ;B4AF48
    %AICMD0x41_AddValue16(nLove_Ellen, 2)                      ;B4AF4C
    %AICMD0x12_Jump(pAIScripting0x26_L132)                                   ;B4AF52
    %AICMD0x1C_ShowDialog($027D, $00)                          ;B4AF55
    %AICMD0x08_EnableAIControl()                               ;B4AF59
    %AICMD0x19($0039, $00)                                     ;B4AF5A
    %AICMD0x13_Wait(120)                                       ;B4AF5E
    %AICMD0x11_EnableUserControl()                             ;B4AF61
    %AICMD0x41_AddValue16(nLove_Ellen, 2)                      ;B4AF62
    %AICMD0x12_Jump(pAIScripting0x26_L132)                                   ;B4AF68
pAIScripting0x26_L143:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $05, pAIScripting0x26_L134) ;B4AF6B
    %AICMD0x1C_ShowDialog($027D, $00)                          ;B4AF72
    %AICMD0x12_Jump(pAIScripting0x26_L132)                                   ;B4AF76
pAIScripting0x26_L144:
    %AICMD0x28_ClearBit(strcFlags.unknown1, $03)                        ;B4AF79
    %AICMD0x10_End()                                           ;B4AF7E
pAIScripting0x26_L145:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $04, pAIScripting0x26_L146)   ;B4AF7F
    %AICMD0x1A($00B8, $0098, aAIScriptingData_L024, $00)                     ;B4AF86
    %AICMD0x12_Jump(pAIScripting0x26_L147)                                   ;B4AF8E
pAIScripting0x26_L146:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event6, $04, pAIScripting0x26_L160)   ;B4AF91
    %AICMD0x1A($00B8, $0098, aAIScriptingData_L071, $00)                     ;B4AF98
pAIScripting0x26_L147:
    %AICMD0x1F(pAIScripting0x26_L149)                                        ;B4AFA0
    %AICMD0x12_Jump(pAIScripting0x26_L147)                                   ;B4AFA3
pAIScripting0x26_L148:
    %AICMD0x1F(pAIScripting0x26_L159)                                        ;B4AFA6
    %AICMD0x12_Jump(pAIScripting0x26_L148)                                   ;B4AFA9
pAIScripting0x26_L149:
    %AICMD0x28_ClearBit(strcFlags.unknown1, $04)                        ;B4AFAC
    %AICMD0x15_JumpIfEquals8(nCurrentYearID, 0, pAIScripting0x26_L151)       ;B4AFB1
    %AICMD0x15_JumpIfEquals8(nCurrentYearID, 1, pAIScripting0x26_L156)       ;B4AFB8
    %AICMD0x12_Jump(pAIScripting0x26_L147)                                   ;B4AFBF
pAIScripting0x26_L150:
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown1, $04)     ;B4AFC2
    %AICMD0x0B_SetScriptFlag($02)                                            ;B4AFC7
    %AICMD0x12_Jump(pAIScripting0x26_L147)                                   ;B4AFC9
pAIScripting0x26_L151:
    %AICMD0x1D_ShowDialog($0267, $00)                          ;B4AFCC
    %AICMD0x20_JumpIfChoice(0, pAIScripting0x26_L152)                        ;B4AFD0
    %AICMD0x20_JumpIfChoice(1, pAIScripting0x26_L153)                        ;B4AFD4
    %AICMD0x12_Jump(pAIScripting0x26_L148)                                   ;B4AFD8
pAIScripting0x26_L152:
    %AICMD0x1C_ShowDialog($0268, $00)                          ;B4AFDB
    %AICMD0x32_SetValue16($8000D4, $0015)                                 ;B4AFDF
    %AICMD0x41_AddValue16(nLove_Eve, 8)                        ;B4AFE5
    %AICMD0x12_Jump(pAIScripting0x26_L148)                                   ;B4AFEB
pAIScripting0x26_L153:
    %AICMD0x1C_ShowDialog($0269, $00)                          ;B4AFEE
    %AICMD0x41_AddValue16(nLove_Eve, 2)                        ;B4AFF2
    %AICMD0x12_Jump(pAIScripting0x26_L148)                                   ;B4AFF8
    %AICMD0x1D_ShowDialog($026F, $00)                          ;B4AFFB
    %AICMD0x20_JumpIfChoice(0, pAIScripting0x26_L154)                        ;B4AFFF
    %AICMD0x20_JumpIfChoice(1, pAIScripting0x26_L155)                        ;B4B003
    %AICMD0x12_Jump(pAIScripting0x26_L147)                                   ;B4B007
pAIScripting0x26_L154:
    %AICMD0x1C_ShowDialog($0270, $00)                          ;B4B00A
    %AICMD0x32_SetValue16($8000D4, $0015)                                 ;B4B00E
    %AICMD0x41_AddValue16(nLove_Eve, 8)                        ;B4B014
    %AICMD0x12_Jump(pAIScripting0x26_L148)                                   ;B4B01A
pAIScripting0x26_L155:
    %AICMD0x1C_ShowDialog($0271, $00)                          ;B4B01D
    %AICMD0x41_AddValue16(nLove_Eve, 2)                        ;B4B021
    %AICMD0x12_Jump(pAIScripting0x26_L148)                                   ;B4B027
pAIScripting0x26_L156:
    %AICMD0x1D_ShowDialog($0277, $00)                          ;B4B02A
    %AICMD0x20_JumpIfChoice(0, pAIScripting0x26_L157)                        ;B4B02E
    %AICMD0x20_JumpIfChoice(1, pAIScripting0x26_L158)                        ;B4B032
    %AICMD0x12_Jump(pAIScripting0x26_L148)                                   ;B4B036
pAIScripting0x26_L157:
    %AICMD0x1C_ShowDialog($0278, $00)                          ;B4B039
    %AICMD0x32_SetValue16($8000D4, $0015)                                 ;B4B03D
    %AICMD0x41_AddValue16(nLove_Eve, 8)                        ;B4B043
    %AICMD0x12_Jump(pAIScripting0x26_L148)                                   ;B4B049
pAIScripting0x26_L158:
    %AICMD0x1C_ShowDialog($0279, $00)                          ;B4B04C
    %AICMD0x41_AddValue16(nLove_Eve, 2)                        ;B4B050
    %AICMD0x12_Jump(pAIScripting0x26_L148)                                   ;B4B056
    %AICMD0x1C_ShowDialog($027F, $00)                          ;B4B059
    %AICMD0x32_SetValue16($8000D4, $0015)                                 ;B4B05D
    %AICMD0x12_Jump(pAIScripting0x26_L148)                                   ;B4B063
pAIScripting0x26_L159:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $05, pAIScripting0x26_L150) ;B4B066
    %AICMD0x1C_ShowDialog($0365, $00)                          ;B4B06D
    %AICMD0x12_Jump(pAIScripting0x26_L148)                                   ;B4B071
pAIScripting0x26_L160:
    %AICMD0x28_ClearBit(strcFlags.unknown1, $04)                        ;B4B074
    %AICMD0x10_End()                                           ;B4B079
pAIScripting0x26_L161:
    %AICMD0x1A($00B8, $00B8, aAIScriptingData_L044, $02)                     ;B4B07A
    %AICMD0x0C_WaitForScriptFlag($09)                                            ;B4B082
    %AICMD0x13_Wait(180)                                       ;B4B084
pAIScripting0x26_L162:
    %AICMD0x1B($0294, $01)                                     ;B4B087
    %AICMD0x13_Wait(50)                                        ;B4B08B
    %AICMD0x1B($0292, $00)                                     ;B4B08E
    %AICMD0x13_Wait(10)                                        ;B4B092
    %AICMD0x1B($0294, $00)                                     ;B4B095
    %AICMD0x13_Wait(10)                                        ;B4B099
    %AICMD0x1B($0290, $00)                                     ;B4B09C
    %AICMD0x13_Wait(10)                                        ;B4B0A0
    %AICMD0x1B($0294, $01)                                     ;B4B0A3
    %AICMD0x13_Wait(10)                                        ;B4B0A7
    %AICMD0x1B($0294, $01)                                     ;B4B0AA
    %AICMD0x0D($FF, $00, $20, $02)                             ;B4B0AE
    %AICMD0x1B($0294, $01)                                     ;B4B0B3
    %AICMD0x0D($01, $00, $20, $02)                             ;B4B0B7
    %AICMD0x1B($0294, $01)                                     ;B4B0BC
    %AICMD0x0D($FF, $00, $10, $02)                             ;B4B0C0
    %AICMD0x1B($0294, $01)                                     ;B4B0C5
    %AICMD0x0D($01, $00, $10, $02)                             ;B4B0C9
    %AICMD0x12_Jump(pAIScripting0x26_L162)                                   ;B4B0CE
pAIScripting0x26_L163:
    %AICMD0x1A($00C8, $00B8, aAIScriptingData_L061, $03)                     ;B4B0D1
    %AICMD0x0C_WaitForScriptFlag($09)                                            ;B4B0D9
    %AICMD0x13_Wait(180)                                       ;B4B0DB
pAIScripting0x26_L164:
    %AICMD0x1B($02C5, $00)                                     ;B4B0DE
    %AICMD0x13_Wait(10)                                        ;B4B0E2
    %AICMD0x1B($02C9, $01)                                     ;B4B0E5
    %AICMD0x13_Wait(10)                                        ;B4B0E9
    %AICMD0x1B($02C7, $00)                                     ;B4B0EC
    %AICMD0x13_Wait(10)                                        ;B4B0F0
    %AICMD0x1B($02C9, $00)                                     ;B4B0F3
    %AICMD0x13_Wait(10)                                        ;B4B0F7
    %AICMD0x1B($02C5, $00)                                     ;B4B0FA
    %AICMD0x13_Wait(50)                                        ;B4B0FE
    %AICMD0x1B($02C9, $00)                                     ;B4B101
    %AICMD0x0D($01, $00, $20, $02)                             ;B4B105
    %AICMD0x1B($02C9, $00)                                     ;B4B10A
    %AICMD0x0D($FF, $00, $20, $02)                             ;B4B10E
    %AICMD0x1B($02C9, $00)                                     ;B4B113
    %AICMD0x0D($01, $00, $10, $02)                             ;B4B117
    %AICMD0x1B($02C9, $00)                                     ;B4B11C
    %AICMD0x0D($FF, $00, $10, $02)                             ;B4B120
    %AICMD0x12_Jump(pAIScripting0x26_L164)                                   ;B4B125
pAIScripting0x26_L165:
    %AICMD0x1A($0158, $00D8, aAIScriptingData_L046, $02)                     ;B4B128
    %AICMD0x0C_WaitForScriptFlag($09)                                            ;B4B130
    %AICMD0x13_Wait(180)                                       ;B4B132
pAIScripting0x26_L166:
    %AICMD0x1B($029B, $01)                                     ;B4B135
    %AICMD0x13_Wait(50)                                        ;B4B139
    %AICMD0x1B($0299, $00)                                     ;B4B13C
    %AICMD0x13_Wait(10)                                        ;B4B140
    %AICMD0x1B($029B, $00)                                     ;B4B143
    %AICMD0x13_Wait(10)                                        ;B4B147
    %AICMD0x1B($0297, $00)                                     ;B4B14A
    %AICMD0x13_Wait(10)                                        ;B4B14E
    %AICMD0x1B($029B, $01)                                     ;B4B151
    %AICMD0x13_Wait(10)                                        ;B4B155
    %AICMD0x1B($029B, $01)                                     ;B4B158
    %AICMD0x0D($FF, $00, $20, $02)                             ;B4B15C
    %AICMD0x1B($029B, $01)                                     ;B4B161
    %AICMD0x0D($01, $00, $20, $02)                             ;B4B165
    %AICMD0x1B($029B, $01)                                     ;B4B16A
    %AICMD0x0D($FF, $00, $10, $02)                             ;B4B16E
    %AICMD0x1B($029B, $01)                                     ;B4B173
    %AICMD0x0D($01, $00, $10, $02)                             ;B4B177
    %AICMD0x12_Jump(pAIScripting0x26_L166)                                   ;B4B17C
pAIScripting0x26_L167:
    %AICMD0x1A($0168, $00D8, aAIScriptingData_L064, $03)                     ;B4B17F
    %AICMD0x0C_WaitForScriptFlag($09)                                            ;B4B187
    %AICMD0x13_Wait(180)                                       ;B4B189
pAIScripting0x26_L168:
    %AICMD0x1B($02D0, $00)                                     ;B4B18C
    %AICMD0x13_Wait(10)                                        ;B4B190
    %AICMD0x1B($02CF, $00)                                     ;B4B193
    %AICMD0x13_Wait(10)                                        ;B4B197
    %AICMD0x1B($02D0, $01)                                     ;B4B19A
    %AICMD0x13_Wait(10)                                        ;B4B19E
    %AICMD0x1B($02CD, $00)                                     ;B4B1A1
    %AICMD0x13_Wait(10)                                        ;B4B1A5
    %AICMD0x1B($02D0, $00)                                     ;B4B1A8
    %AICMD0x13_Wait(50)                                        ;B4B1AC
    %AICMD0x1B($02D0, $00)                                     ;B4B1AF
    %AICMD0x0D($01, $00, $20, $02)                             ;B4B1B3
    %AICMD0x1B($02D0, $00)                                     ;B4B1B8
    %AICMD0x0D($FF, $00, $20, $02)                             ;B4B1BC
    %AICMD0x1B($02D0, $00)                                     ;B4B1C1
    %AICMD0x0D($01, $00, $10, $02)                             ;B4B1C5
    %AICMD0x1B($02D0, $00)                                     ;B4B1CA
    %AICMD0x0D($FF, $00, $10, $02)                             ;B4B1CE
    %AICMD0x12_Jump(pAIScripting0x26_L168)                                   ;B4B1D3
pAIScripting0x26_L169:
    %AICMD0x1A($00B8, $0128, aAIScriptingData_L067, $02)                     ;B4B1D6
    %AICMD0x0C_WaitForScriptFlag($09)                                            ;B4B1DE
    %AICMD0x13_Wait(180)                                       ;B4B1E0
pAIScripting0x26_L170:
    %AICMD0x1B($02D7, $01)                                     ;B4B1E3
    %AICMD0x13_Wait(50)                                        ;B4B1E7
    %AICMD0x1B($02D5, $00)                                     ;B4B1EA
    %AICMD0x13_Wait(10)                                        ;B4B1EE
    %AICMD0x1B($02D7, $00)                                     ;B4B1F1
    %AICMD0x13_Wait(10)                                        ;B4B1F5
    %AICMD0x1B($02D3, $00)                                     ;B4B1F8
    %AICMD0x13_Wait(10)                                        ;B4B1FC
    %AICMD0x1B($02D7, $01)                                     ;B4B1FF
    %AICMD0x13_Wait(10)                                        ;B4B203
    %AICMD0x1B($02D7, $00)                                     ;B4B206
    %AICMD0x0D($01, $00, $0C, $01)                             ;B4B20A
    %AICMD0x1B($02D7, $00)                                     ;B4B20F
    %AICMD0x0D($FF, $00, $0C, $01)                             ;B4B213
    %AICMD0x1B($02D7, $00)                                     ;B4B218
    %AICMD0x0D($01, $00, $08, $01)                             ;B4B21C
    %AICMD0x1B($02D7, $00)                                     ;B4B221
    %AICMD0x0D($FF, $00, $08, $01)                             ;B4B225
    %AICMD0x12_Jump(pAIScripting0x26_L170)                                   ;B4B22A
pAIScripting0x26_L171:
    %AICMD0x1A($00C8, $0128, aAIScriptingData_L055, $03)                     ;B4B22D
    %AICMD0x0C_WaitForScriptFlag($09)                                            ;B4B235
    %AICMD0x13_Wait(180)                                       ;B4B237
pAIScripting0x26_L172:
    %AICMD0x1B($02B6, $01)                                     ;B4B23A
    %AICMD0x13_Wait(10)                                        ;B4B23E
    %AICMD0x1B($02B4, $00)                                     ;B4B241
    %AICMD0x13_Wait(10)                                        ;B4B245
    %AICMD0x1B($02B6, $00)                                     ;B4B248
    %AICMD0x13_Wait(10)                                        ;B4B24C
    %AICMD0x1B($02B2, $00)                                     ;B4B24F
    %AICMD0x13_Wait(10)                                        ;B4B253
    %AICMD0x1B($02B6, $01)                                     ;B4B256
    %AICMD0x13_Wait(50)                                        ;B4B25A
    %AICMD0x1B($02B6, $01)                                     ;B4B25D
    %AICMD0x0D($FF, $00, $0C, $01)                             ;B4B261
    %AICMD0x1B($02B6, $01)                                     ;B4B266
    %AICMD0x0D($01, $00, $0C, $01)                             ;B4B26A
    %AICMD0x1B($02B6, $01)                                     ;B4B26F
    %AICMD0x0D($FF, $00, $08, $01)                             ;B4B273
    %AICMD0x1B($02B6, $01)                                     ;B4B278
    %AICMD0x0D($01, $00, $08, $01)                             ;B4B27C
    %AICMD0x12_Jump(pAIScripting0x26_L172)                                   ;B4B281
pAIScripting0x26_L173:
    %AICMD0x1A($0110, $0108, aAIScriptingData_L011, $03)                     ;B4B284
    %AICMD0x0C_WaitForScriptFlag($09)                                            ;B4B28C
    %AICMD0x13_Wait(200)                                       ;B4B28E
pAIScripting0x26_L174:
    %AICMD0x1B($0223, $00)                                     ;B4B291
    %AICMD0x13_Wait(10)                                        ;B4B295
    %AICMD0x1B($0221, $00)                                     ;B4B298
    %AICMD0x13_Wait(10)                                        ;B4B29C
    %AICMD0x1B($0223, $01)                                     ;B4B29F
    %AICMD0x13_Wait(10)                                        ;B4B2A3
    %AICMD0x1B($021F, $00)                                     ;B4B2A6
    %AICMD0x13_Wait(10)                                        ;B4B2AA
    %AICMD0x1B($0223, $00)                                     ;B4B2AD
    %AICMD0x13_Wait(50)                                        ;B4B2B1
    %AICMD0x1B($0223, $00)                                     ;B4B2B4
    %AICMD0x0D($01, $00, $20, $02)                             ;B4B2B8
    %AICMD0x1B($0223, $00)                                     ;B4B2BD
    %AICMD0x0D($FF, $00, $20, $02)                             ;B4B2C1
    %AICMD0x1B($0223, $00)                                     ;B4B2C6
    %AICMD0x0D($01, $00, $10, $02)                             ;B4B2CA
    %AICMD0x1B($0223, $00)                                     ;B4B2CF
    %AICMD0x0D($FF, $00, $10, $02)                             ;B4B2D3
    %AICMD0x12_Jump(pAIScripting0x26_L174)                                   ;B4B2D8
pAIScripting0x26_L175:
    %AICMD0x1A($0110, $0108, aAIScriptingData_L015, $03)                     ;B4B2DB
    %AICMD0x0C_WaitForScriptFlag($09)                                            ;B4B2E3
    %AICMD0x13_Wait(200)                                       ;B4B2E5
pAIScripting0x26_L176:
    %AICMD0x1B($022B, $00)                                     ;B4B2E8
    %AICMD0x13_Wait(10)                                        ;B4B2EC
    %AICMD0x1B($0229, $00)                                     ;B4B2EF
    %AICMD0x13_Wait(10)                                        ;B4B2F3
    %AICMD0x1B($022B, $01)                                     ;B4B2F6
    %AICMD0x13_Wait(10)                                        ;B4B2FA
    %AICMD0x1B($0227, $00)                                     ;B4B2FD
    %AICMD0x13_Wait(10)                                        ;B4B301
    %AICMD0x1B($022B, $00)                                     ;B4B304
    %AICMD0x13_Wait(50)                                        ;B4B308
    %AICMD0x1B($022B, $00)                                     ;B4B30B
    %AICMD0x0D($01, $00, $20, $02)                             ;B4B30F
    %AICMD0x1B($022B, $00)                                     ;B4B314
    %AICMD0x0D($FF, $00, $20, $02)                             ;B4B318
    %AICMD0x1B($022B, $00)                                     ;B4B31D
    %AICMD0x0D($01, $00, $10, $02)                             ;B4B321
    %AICMD0x1B($022B, $00)                                     ;B4B326
    %AICMD0x0D($FF, $00, $10, $02)                             ;B4B32A
    %AICMD0x12_Jump(pAIScripting0x26_L176)                                   ;B4B32F
pAIScripting0x26_L177:
    %AICMD0x1A($0110, $0108, aAIScriptingData_L019, $03)                     ;B4B332
    %AICMD0x0C_WaitForScriptFlag($09)                                            ;B4B33A
    %AICMD0x13_Wait(200)                                       ;B4B33C
pAIScripting0x26_L178:
    %AICMD0x1B($0250, $00)                                     ;B4B33F
    %AICMD0x13_Wait(10)                                        ;B4B343
    %AICMD0x1B($024E, $00)                                     ;B4B346
    %AICMD0x13_Wait(10)                                        ;B4B34A
    %AICMD0x1B($0250, $01)                                     ;B4B34D
    %AICMD0x13_Wait(10)                                        ;B4B351
    %AICMD0x1B($024C, $00)                                     ;B4B354
    %AICMD0x13_Wait(10)                                        ;B4B358
    %AICMD0x1B($0250, $00)                                     ;B4B35B
    %AICMD0x13_Wait(50)                                        ;B4B35F
    %AICMD0x1B($0250, $00)                                     ;B4B362
    %AICMD0x0D($01, $00, $20, $02)                             ;B4B366
    %AICMD0x1B($0250, $00)                                     ;B4B36B
    %AICMD0x0D($FF, $00, $20, $02)                             ;B4B36F
    %AICMD0x1B($0250, $00)                                     ;B4B374
    %AICMD0x0D($01, $00, $10, $02)                             ;B4B378
    %AICMD0x1B($0250, $00)                                     ;B4B37D
    %AICMD0x0D($FF, $00, $10, $02)                             ;B4B381
    %AICMD0x12_Jump(pAIScripting0x26_L178)                                   ;B4B386
pAIScripting0x26_L179:
    %AICMD0x1A($0110, $0108, aAIScriptingData_L021, $03)                     ;B4B389
    %AICMD0x0C_WaitForScriptFlag($09)                                            ;B4B391
    %AICMD0x13_Wait(200)                                       ;B4B393
pAIScripting0x26_L180:
    %AICMD0x1B($0241, $00)                                     ;B4B396
    %AICMD0x13_Wait(10)                                        ;B4B39A
    %AICMD0x1B($023F, $00)                                     ;B4B39D
    %AICMD0x13_Wait(10)                                        ;B4B3A1
    %AICMD0x1B($0241, $01)                                     ;B4B3A4
    %AICMD0x13_Wait(10)                                        ;B4B3A8
    %AICMD0x1B($023D, $00)                                     ;B4B3AB
    %AICMD0x13_Wait(10)                                        ;B4B3AF
    %AICMD0x1B($0241, $00)                                     ;B4B3B2
    %AICMD0x13_Wait(50)                                        ;B4B3B6
    %AICMD0x1B($0241, $00)                                     ;B4B3B9
    %AICMD0x0D($01, $00, $20, $02)                             ;B4B3BD
    %AICMD0x1B($0241, $00)                                     ;B4B3C2
    %AICMD0x0D($FF, $00, $20, $02)                             ;B4B3C6
    %AICMD0x1B($0241, $00)                                     ;B4B3CB
    %AICMD0x0D($01, $00, $10, $02)                             ;B4B3CF
    %AICMD0x1B($0241, $00)                                     ;B4B3D4
    %AICMD0x0D($FF, $00, $10, $02)                             ;B4B3D8
    %AICMD0x12_Jump(pAIScripting0x26_L180)                                   ;B4B3DD
pAIScripting0x26_L181:
    %AICMD0x1A($0110, $0108, aAIScriptingData_L024, $03)                     ;B4B3E0
    %AICMD0x0C_WaitForScriptFlag($09)                                            ;B4B3E8
    %AICMD0x13_Wait(200)                                       ;B4B3EA
pAIScripting0x26_L182:
    %AICMD0x1B($0249, $00)                                     ;B4B3ED
    %AICMD0x13_Wait(10)                                        ;B4B3F1
    %AICMD0x1B($0247, $00)                                     ;B4B3F4
    %AICMD0x13_Wait(10)                                        ;B4B3F8
    %AICMD0x1B($0249, $01)                                     ;B4B3FB
    %AICMD0x13_Wait(10)                                        ;B4B3FF
    %AICMD0x1B($0245, $00)                                     ;B4B402
    %AICMD0x13_Wait(10)                                        ;B4B406
    %AICMD0x1B($0249, $00)                                     ;B4B409
    %AICMD0x13_Wait(50)                                        ;B4B40D
    %AICMD0x1B($0249, $00)                                     ;B4B410
    %AICMD0x0D($01, $00, $20, $02)                             ;B4B414
    %AICMD0x1B($0249, $00)                                     ;B4B419
    %AICMD0x0D($FF, $00, $20, $02)                             ;B4B41D
    %AICMD0x1B($0249, $00)                                     ;B4B422
    %AICMD0x0D($01, $00, $10, $02)                             ;B4B426
    %AICMD0x1B($0249, $00)                                     ;B4B42B
    %AICMD0x0D($FF, $00, $10, $02)                             ;B4B42F
    %AICMD0x12_Jump(pAIScripting0x26_L182)                                   ;B4B434
pAIScripting0x26_L183:
    %AICMD0x1A($0110, $0108, aAIScriptingData_L071, $03)                     ;B4B437
    %AICMD0x0C_WaitForScriptFlag($09)                                            ;B4B43F
    %AICMD0x13_Wait(200)                                       ;B4B441
pAIScripting0x26_L184:
    %AICMD0x1B($02E7, $00)                                     ;B4B444
    %AICMD0x13_Wait(10)                                        ;B4B448
    %AICMD0x1B($02E5, $00)                                     ;B4B44B
    %AICMD0x13_Wait(10)                                        ;B4B44F
    %AICMD0x1B($02E7, $01)                                     ;B4B452
    %AICMD0x13_Wait(10)                                        ;B4B456
    %AICMD0x1B($02E3, $00)                                     ;B4B459
    %AICMD0x13_Wait(10)                                        ;B4B45D
    %AICMD0x1B($02E7, $00)                                     ;B4B460
    %AICMD0x13_Wait(50)                                        ;B4B464
    %AICMD0x1B($02E7, $00)                                     ;B4B467
    %AICMD0x0D($01, $00, $20, $02)                             ;B4B46B
    %AICMD0x1B($02E7, $00)                                     ;B4B470
    %AICMD0x0D($FF, $00, $20, $02)                             ;B4B474
    %AICMD0x1B($02E7, $00)                                     ;B4B479
    %AICMD0x0D($01, $00, $10, $02)                             ;B4B47D
    %AICMD0x1B($02E7, $00)                                     ;B4B482
    %AICMD0x0D($FF, $00, $10, $02)                             ;B4B486
    %AICMD0x12_Jump(pAIScripting0x26_L184)                                   ;B4B48B


DATA8_B4B48E:
    %AICMD0x4F_DisableToolUse()                                               ;B4B48E
    %AICMD0x50()                                               ;B4B48F
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $09)       ;B4B490
    %AICMD0x00_SetMusic($08, $B4)                              ;B4B495
    %AICMD0x02_FreezeTime()                                    ;B4B498
    %AICMD0x03_SetHour($07)                                    ;B4B499
    %AICMD0x05_SetTransferPosition(264, 264)                   ;B4B49B
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4B4A0
    %AICMD0x08_EnableAIControl()                               ;B4B4A2
    %AICMD0x19($00E8, $00)                                     ;B4B4A3
    %AICMD0x09_StartScript($01, pAIScripting0x26_L161)                                   ;B4B4A7
    %AICMD0x09_StartScript($02, pAIScripting0x26_L163)                                   ;B4B4AB
    %AICMD0x09_StartScript($03, pAIScripting0x26_L165)                                   ;B4B4AF
    %AICMD0x09_StartScript($04, pAIScripting0x26_L167)                                   ;B4B4B3
    %AICMD0x09_StartScript($05, pAIScripting0x26_L169)                                   ;B4B4B7
    %AICMD0x09_StartScript($06, pAIScripting0x26_L171)                                   ;B4B4BB
    %AICMD0x09_StartScript($08, pAIScripting0x26_L186)                                   ;B4B4BF
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $00, pAIScripting0x26_L003) ;B4B4C3
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $01, pAIScripting0x26_L004) ;B4B4CA
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $02, pAIScripting0x26_L005) ;B4B4D1
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $03, pAIScripting0x26_L006) ;B4B4D8
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $04, pAIScripting0x26_L007) ;B4B4DF
pAIScripting0x26_L185:
    %AICMD0x06_SetDestinationArea(!AREA_DANCINGS2)             ;B4B4E6
    %AICMD0x38_WaitForFadeIn()                                               ;B4B4E8
    %AICMD0x0B_SetScriptFlag($09)                                            ;B4B4E9
    %AICMD0x10_End()                                           ;B4B4EB
pAIScripting0x26_L186:
    %AICMD0x1A($0100, $0108, aAIScriptingData, $02)                     ;B4B4EC
    %AICMD0x0C_WaitForScriptFlag($09)                                            ;B4B4F4
    %AICMD0x13_Wait(200)                                       ;B4B4F6
    %AICMD0x1B($0002, $01)                                     ;B4B4F9
    %AICMD0x13_Wait(50)                                        ;B4B4FD
    %AICMD0x1B($0000, $00)                                     ;B4B500
    %AICMD0x13_Wait(10)                                        ;B4B504
    %AICMD0x1B($0002, $00)                                     ;B4B507
    %AICMD0x13_Wait(10)                                        ;B4B50B
    %AICMD0x1B($0001, $00)                                     ;B4B50E
    %AICMD0x13_Wait(10)                                        ;B4B512
    %AICMD0x1B($0002, $01)                                     ;B4B515
    %AICMD0x13_Wait(10)                                        ;B4B519
    %AICMD0x1B($0002, $01)                                     ;B4B51C
    %AICMD0x0D($FF, $00, $20, $02)                             ;B4B520
    %AICMD0x1B($0002, $01)                                     ;B4B525
    %AICMD0x0D($01, $00, $20, $02)                             ;B4B529
    %AICMD0x1B($0002, $01)                                     ;B4B52E
    %AICMD0x0D($FF, $00, $10, $02)                             ;B4B532
    %AICMD0x1B($0002, $01)                                     ;B4B537
    %AICMD0x0D($01, $00, $10, $02)                             ;B4B53B
    %AICMD0x1B($0002, $01)                                     ;B4B540
    %AICMD0x13_Wait(50)                                        ;B4B544
    %AICMD0x1B($0000, $00)                                     ;B4B547
    %AICMD0x13_Wait(10)                                        ;B4B54B
    %AICMD0x1B($0002, $00)                                     ;B4B54E
    %AICMD0x13_Wait(10)                                        ;B4B552
    %AICMD0x1B($0001, $00)                                     ;B4B555
    %AICMD0x13_Wait(10)                                        ;B4B559
    %AICMD0x1B($0002, $01)                                     ;B4B55C
    %AICMD0x13_Wait(10)                                        ;B4B560
    %AICMD0x1B($0002, $01)                                     ;B4B563
    %AICMD0x0D($FF, $00, $20, $02)                             ;B4B567
    %AICMD0x1B($0002, $01)                                     ;B4B56C
    %AICMD0x0D($01, $00, $20, $02)                             ;B4B570
    %AICMD0x1B($0002, $01)                                     ;B4B575
    %AICMD0x0D($FF, $00, $10, $02)                             ;B4B579
    %AICMD0x1B($0002, $01)                                     ;B4B57E
    %AICMD0x0D($01, $00, $10, $02)                             ;B4B582
    %AICMD0x1B($0002, $01)                                     ;B4B587
    %AICMD0x13_Wait(50)                                        ;B4B58B
    %AICMD0x1B($0000, $00)                                     ;B4B58E
    %AICMD0x13_Wait(10)                                        ;B4B592
    %AICMD0x1B($0002, $00)                                     ;B4B595
    %AICMD0x13_Wait(10)                                        ;B4B599
    %AICMD0x1B($0001, $00)                                     ;B4B59C
    %AICMD0x13_Wait(10)                                        ;B4B5A0
    %AICMD0x1B($0002, $01)                                     ;B4B5A3
    %AICMD0x13_Wait(10)                                        ;B4B5A7
    %AICMD0x1B($0002, $01)                                     ;B4B5AA
    %AICMD0x0D($FF, $00, $20, $02)                             ;B4B5AE
    %AICMD0x1B($0002, $01)                                     ;B4B5B3
    %AICMD0x0D($01, $00, $20, $02)                             ;B4B5B7
    %AICMD0x1B($0002, $01)                                     ;B4B5BC
    %AICMD0x0D($FF, $00, $10, $02)                             ;B4B5C0
    %AICMD0x1B($0002, $01)                                     ;B4B5C5
    %AICMD0x0D($01, $00, $10, $02)                             ;B4B5C9
    %AICMD0x1B($0002, $01)                                     ;B4B5CE
    %AICMD0x13_Wait(50)                                        ;B4B5D2
    %AICMD0x1B($0000, $00)                                     ;B4B5D5
    %AICMD0x13_Wait(10)                                        ;B4B5D9
    %AICMD0x1B($0002, $00)                                     ;B4B5DC
    %AICMD0x13_Wait(10)                                        ;B4B5E0
    %AICMD0x1B($0001, $00)                                     ;B4B5E3
    %AICMD0x13_Wait(10)                                        ;B4B5E7
    %AICMD0x1B($0002, $01)                                     ;B4B5EA
    %AICMD0x13_Wait(10)                                        ;B4B5EE
    %AICMD0x1B($0002, $01)                                     ;B4B5F1
    %AICMD0x0D($FF, $00, $20, $02)                             ;B4B5F5
    %AICMD0x1B($0002, $01)                                     ;B4B5FA
    %AICMD0x0D($01, $00, $20, $02)                             ;B4B5FE
    %AICMD0x1B($0002, $01)                                     ;B4B603
    %AICMD0x0D($FF, $00, $10, $02)                             ;B4B607
    %AICMD0x1B($0002, $01)                                     ;B4B60C
    %AICMD0x0D($01, $00, $10, $02)                             ;B4B610
    %AICMD0x1B($0002, $01)                                     ;B4B615
    %AICMD0x13_Wait(50)                                        ;B4B619
    %AICMD0x1B($0000, $00)                                     ;B4B61C
    %AICMD0x13_Wait(10)                                        ;B4B620
    %AICMD0x1B($0002, $00)                                     ;B4B623
    %AICMD0x13_Wait(10)                                        ;B4B627
    %AICMD0x1B($0001, $00)                                     ;B4B62A
    %AICMD0x13_Wait(10)                                        ;B4B62E
    %AICMD0x1B($0002, $01)                                     ;B4B631
    %AICMD0x13_Wait(10)                                        ;B4B635
    %AICMD0x1B($0002, $01)                                     ;B4B638
    %AICMD0x0D($FF, $00, $20, $02)                             ;B4B63C
    %AICMD0x1B($0002, $01)                                     ;B4B641
    %AICMD0x0D($01, $00, $20, $02)                             ;B4B645
    %AICMD0x1B($0002, $01)                                     ;B4B64A
    %AICMD0x0D($FF, $00, $10, $02)                             ;B4B64E
    %AICMD0x1B($0002, $01)                                     ;B4B653
    %AICMD0x0D($01, $00, $10, $02)                             ;B4B657
    %AICMD0x3C()                                               ;B4B65C
    %AICMD0x10_End()                                           ;B4B65D


pAIScripting0x27:
    dw DATA8_B4B67E                                            ;B4B65E|        |B4B67E;
    dw DATA8_B4B947                                            ;B4B660|        |B4B947;
    dw DATA8_B4B9C2                                            ;B4B662|        |B4B9C2;
    dw DATA8_B4BA8E                                            ;B4B664|        |B4BA8E;
    dw pAIScripting0x28                                        ;B4B666|        |B4BACB;
    dw pAIScripting0x28                                        ;B4B668|        |B4BACB;
    dw pAIScripting0x28                                        ;B4B66A|        |B4BACB;
    dw pAIScripting0x28                                        ;B4B66C|        |B4BACB;
    dw pAIScripting0x28                                        ;B4B66E|        |B4BACB;
    dw pAIScripting0x28                                        ;B4B670|        |B4BACB;
    dw pAIScripting0x28                                        ;B4B672|        |B4BACB;
    dw pAIScripting0x28                                        ;B4B674|        |B4BACB;
    dw pAIScripting0x28                                        ;B4B676|        |B4BACB;
    dw pAIScripting0x28                                        ;B4B678|        |B4BACB;
    dw pAIScripting0x28                                        ;B4B67A|        |B4BACB;
    dw pAIScripting0x28                                        ;B4B67C|        |B4BACB;
 
DATA8_B4B67E:
 
    %AICMD0x4F_DisableToolUse()                                               ;B4B67E
    %AICMD0x50()                                               ;B4B67F
    %AICMD0x09_StartScript($01, pAIScripting0x27_L010)                                   ;B4B680
    %AICMD0x09_StartScript($02, pAIScripting0x27_L014)                                   ;B4B684
    %AICMD0x09_StartScript($03, pAIScripting0x27_L018)                                   ;B4B688
    %AICMD0x09_StartScript($04, pAIScripting0x27_L022)                                   ;B4B68C
    %AICMD0x09_StartScript($05, pAIScripting0x27_L026)                                   ;B4B690
    %AICMD0x09_StartScript($0A, pAIScripting0x27_L008)                                   ;B4B694
    %AICMD0x12_Jump(pAIScripting0x27_L003)                                   ;B4B698
pAIScripting0x27_L001:
    %AICMD0x38_WaitForFadeIn()                                               ;B4B69B
pAIScripting0x27_L002:
    %AICMD0x10_End()                                           ;B4B69C
pAIScripting0x27_L003:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $01, pAIScripting0x27_L004)   ;B4B69D
    %AICMD0x09_StartScript($06, pAIScripting0x27_L029)                                   ;B4B6A4
pAIScripting0x27_L004:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, pAIScripting0x27_L005)   ;B4B6A8
    %AICMD0x09_StartScript($07, pAIScripting0x27_L036)                                   ;B4B6AF
pAIScripting0x27_L005:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $03, pAIScripting0x27_L006)   ;B4B6B3
    %AICMD0x09_StartScript($08, pAIScripting0x27_L043)                                   ;B4B6BA
pAIScripting0x27_L006:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $04, pAIScripting0x27_L007)   ;B4B6BE
    %AICMD0x09_StartScript($09, pAIScripting0x27_L050)                                   ;B4B6C5
pAIScripting0x27_L007:
    %AICMD0x12_Jump(pAIScripting0x27_L001)                                   ;B4B6C9
pAIScripting0x27_L008:
    %AICMD0x1A($01A8, $0328, aAIScriptingData_L136, $00)                     ;B4B6CC
    %AICMD0x1B($03DA, $00)                                     ;B4B6D4
    %AICMD0x13_Wait(180)                                       ;B4B6D8
    %AICMD0x1B($03D9, $00)                                     ;B4B6DB
    %AICMD0x13_Wait(360)                                       ;B4B6DF
    %AICMD0x12_Jump(pAIScripting0x27_L009)                                   ;B4B6E2
pAIScripting0x27_L009:
    %AICMD0x13_Wait(1)                                         ;B4B6E5
    %AICMD0x12_Jump(pAIScripting0x27_L009)                                   ;B4B6E8
pAIScripting0x27_L010:
    %AICMD0x1A($0228, $0378, aAIScriptingData_L053, $00)                     ;B4B6EB
pAIScripting0x27_L011:
    %AICMD0x1F(pAIScripting0x27_L012)                                        ;B4B6F3
    %AICMD0x12_Jump(pAIScripting0x27_L011)                                   ;B4B6F6
pAIScripting0x27_L012:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $00, pAIScripting0x27_L013)   ;B4B6F9
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $01, pAIScripting0x27_L013)   ;B4B700
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, pAIScripting0x27_L013)   ;B4B707
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $03, pAIScripting0x27_L013)   ;B4B70E
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $04, pAIScripting0x27_L013)   ;B4B715
    %AICMD0x1C_ShowDialog($0296, $00)                          ;B4B71C
    %AICMD0x12_Jump(pAIScripting0x27_L011)                                   ;B4B720
pAIScripting0x27_L013:
    %AICMD0x1C_ShowDialog($0495, $00)                          ;B4B723
    %AICMD0x12_Jump(pAIScripting0x27_L011)                                   ;B4B727
pAIScripting0x27_L014:
    %AICMD0x1A($0178, $0308, aAIScriptingData_L065, $00)                     ;B4B72A
    %AICMD0x22($10, $10, $01, aAIScriptingData_L065, $01)                    ;B4B732
pAIScripting0x27_L015:
    %AICMD0x1F(pAIScripting0x27_L016)                                        ;B4B739
    %AICMD0x12_Jump(pAIScripting0x27_L015)                                   ;B4B73C
pAIScripting0x27_L016:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $01, pAIScripting0x27_L017)   ;B4B73F
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, pAIScripting0x27_L017)   ;B4B746
    %AICMD0x1C_ShowDialog($0299, $00)                          ;B4B74D
    %AICMD0x12_Jump(pAIScripting0x27_L015)                                   ;B4B751
pAIScripting0x27_L017:
    %AICMD0x1C_ShowDialog($0497, $00)                          ;B4B754
    %AICMD0x12_Jump(pAIScripting0x27_L015)                                   ;B4B758
pAIScripting0x27_L018:
    %AICMD0x1A($0178, $0368, aAIScriptingData_L046, $00)                     ;B4B75B
pAIScripting0x27_L019:
    %AICMD0x1F(pAIScripting0x27_L020)                                        ;B4B763
    %AICMD0x12_Jump(pAIScripting0x27_L019)                                   ;B4B766
pAIScripting0x27_L020:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $01, pAIScripting0x27_L021)   ;B4B769
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, pAIScripting0x27_L021)   ;B4B770
    %AICMD0x1C_ShowDialog($029A, $00)                          ;B4B777
    %AICMD0x12_Jump(pAIScripting0x27_L019)                                   ;B4B77B
pAIScripting0x27_L021:
    %AICMD0x1C_ShowDialog($0496, $00)                          ;B4B77E
    %AICMD0x12_Jump(pAIScripting0x27_L019)                                   ;B4B782
pAIScripting0x27_L022:
    %AICMD0x1A($0178, $01D8, aAIScriptingData_L038, $03)                     ;B4B785
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 17, 18, pAIScripting0x27_L025) ;B4B78D
pAIScripting0x27_L023:
    %AICMD0x1F(pAIScripting0x27_L024)                                        ;B4B795
    %AICMD0x12_Jump(pAIScripting0x27_L023)                                   ;B4B798
pAIScripting0x27_L024:
    %AICMD0x1C_ShowDialog($0295, $00)                          ;B4B79B
    %AICMD0x12_Jump(pAIScripting0x27_L023)                                   ;B4B79F
pAIScripting0x27_L025:
    %AICMD0x1B($027B, $01)                                     ;B4B7A2
    %AICMD0x0D($01, $00, $40, $01)                             ;B4B7A6
    %AICMD0x37()                                               ;B4B7AB
    %AICMD0x10_End()                                           ;B4B7AC
pAIScripting0x27_L026:
    %AICMD0x1A($00E8, $01A8, aAIScriptingData_L033, $00)                     ;B4B7AD
    %AICMD0x22($20, $10, $01, aAIScriptingData_L034, $18)                    ;B4B7B5
pAIScripting0x27_L027:
    %AICMD0x1F(pAIScripting0x27_L028)                                        ;B4B7BC
    %AICMD0x12_Jump(pAIScripting0x27_L027)                                   ;B4B7BF
pAIScripting0x27_L028:
    %AICMD0x1C_ShowDialog($0294, $00)                          ;B4B7C2
    %AICMD0x12_Jump(pAIScripting0x27_L027)                                   ;B4B7C6
pAIScripting0x27_L029:
    %AICMD0x1A($01B0, $0368, aAIScriptingData_L015, $00)                     ;B4B7C9
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $01, pAIScripting0x27_L031) ;B4B7D1
pAIScripting0x27_L030:
    %AICMD0x1F(pAIScripting0x27_L032)                                        ;B4B7D8
    %AICMD0x12_Jump(pAIScripting0x27_L030)                                   ;B4B7DB
pAIScripting0x27_L031:
    %AICMD0x1F(pAIScripting0x27_L035)                                        ;B4B7DE
    %AICMD0x12_Jump(pAIScripting0x27_L031)                                   ;B4B7E1
pAIScripting0x27_L032:
    %AICMD0x45_JumpIfBetween16(nLove_Ann, 0, 119, pAIScripting0x27_L034)     ;B4B7E4
    %AICMD0x45_JumpIfBetween16(nLove_Ann, 120, 999, pAIScripting0x27_L033)   ;B4B7EE
    %AICMD0x12_Jump(pAIScripting0x27_L030)                                   ;B4B7F8
pAIScripting0x27_L033:
    %AICMD0x1C_ShowDialog($02A1, $00)                          ;B4B7FB
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown1, $01)     ;B4B7FF
    %AICMD0x08_EnableAIControl()                               ;B4B804
    %AICMD0x19($0039, $00)                                     ;B4B805
    %AICMD0x13_Wait(120)                                       ;B4B809
    %AICMD0x11_EnableUserControl()                             ;B4B80C
    %AICMD0x41_AddValue16(nPlayerHappiness, 10)                ;B4B80D
    %AICMD0x57_UpdateStamina(20)                               ;B4B813
    %AICMD0x12_Jump(pAIScripting0x27_L031)                                   ;B4B815
pAIScripting0x27_L034:
    %AICMD0x1C_ShowDialog($02A3, $00)                          ;B4B818
    %AICMD0x12_Jump(pAIScripting0x27_L030)                                   ;B4B81C
pAIScripting0x27_L035:
    %AICMD0x1C_ShowDialog($02A2, $00)                          ;B4B81F
    %AICMD0x12_Jump(pAIScripting0x27_L031)                                   ;B4B823
pAIScripting0x27_L036:
    %AICMD0x1A($0268, $0108, aAIScriptingData_L020, $00)                     ;B4B826
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $02, pAIScripting0x27_L038) ;B4B82E
pAIScripting0x27_L037:
    %AICMD0x1F(pAIScripting0x27_L039)                                        ;B4B835
    %AICMD0x12_Jump(pAIScripting0x27_L037)                                   ;B4B838
pAIScripting0x27_L038:
    %AICMD0x1F(pAIScripting0x27_L042)                                        ;B4B83B
    %AICMD0x12_Jump(pAIScripting0x27_L038)                                   ;B4B83E
pAIScripting0x27_L039:
    %AICMD0x45_JumpIfBetween16(nLove_Nina, 0, 119, pAIScripting0x27_L041)    ;B4B841
    %AICMD0x45_JumpIfBetween16(nLove_Nina, 120, 999, pAIScripting0x27_L040)  ;B4B84B
    %AICMD0x12_Jump(pAIScripting0x27_L037)                                   ;B4B855
pAIScripting0x27_L040:
    %AICMD0x1C_ShowDialog($02A4, $00)                          ;B4B858
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown1, $02)     ;B4B85C
    %AICMD0x08_EnableAIControl()                               ;B4B861
    %AICMD0x19($0039, $00)                                     ;B4B862
    %AICMD0x13_Wait(120)                                       ;B4B866
    %AICMD0x11_EnableUserControl()                             ;B4B869
    %AICMD0x41_AddValue16(nPlayerHappiness, 10)                ;B4B86A
    %AICMD0x57_UpdateStamina(20)                               ;B4B870
    %AICMD0x12_Jump(pAIScripting0x27_L038)                                   ;B4B872
pAIScripting0x27_L041:
    %AICMD0x1C_ShowDialog($02A6, $00)                          ;B4B875
    %AICMD0x12_Jump(pAIScripting0x27_L037)                                   ;B4B879
pAIScripting0x27_L042:
    %AICMD0x1C_ShowDialog($02A5, $00)                          ;B4B87C
    %AICMD0x12_Jump(pAIScripting0x27_L038)                                   ;B4B880
pAIScripting0x27_L043:
    %AICMD0x1A($01B8, $0168, aAIScriptingData_L021, $00)                     ;B4B883
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $03, pAIScripting0x27_L045) ;B4B88B
pAIScripting0x27_L044:
    %AICMD0x1F(pAIScripting0x27_L046)                                        ;B4B892
    %AICMD0x12_Jump(pAIScripting0x27_L044)                                   ;B4B895
pAIScripting0x27_L045:
    %AICMD0x1F(pAIScripting0x27_L049)                                        ;B4B898
    %AICMD0x12_Jump(pAIScripting0x27_L045)                                   ;B4B89B
pAIScripting0x27_L046:
    %AICMD0x45_JumpIfBetween16(nLove_Ellen, 0, 119, pAIScripting0x27_L048)   ;B4B89E
    %AICMD0x45_JumpIfBetween16(nLove_Ellen, 120, 999, pAIScripting0x27_L047) ;B4B8A8
    %AICMD0x12_Jump(pAIScripting0x27_L044)                                   ;B4B8B2
pAIScripting0x27_L047:
    %AICMD0x1C_ShowDialog($02A7, $00)                          ;B4B8B5
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown1, $03)     ;B4B8B9
    %AICMD0x08_EnableAIControl()                               ;B4B8BE
    %AICMD0x19($0039, $00)                                     ;B4B8BF
    %AICMD0x13_Wait(120)                                       ;B4B8C3
    %AICMD0x11_EnableUserControl()                             ;B4B8C6
    %AICMD0x41_AddValue16(nPlayerHappiness, 10)                ;B4B8C7
    %AICMD0x57_UpdateStamina(20)                               ;B4B8CD
    %AICMD0x12_Jump(pAIScripting0x27_L045)                                   ;B4B8CF
pAIScripting0x27_L048:
    %AICMD0x1C_ShowDialog($02A0, $00)                          ;B4B8D2
    %AICMD0x12_Jump(pAIScripting0x27_L044)                                   ;B4B8D6
pAIScripting0x27_L049:
    %AICMD0x1C_ShowDialog($02A8, $00)                          ;B4B8D9
    %AICMD0x12_Jump(pAIScripting0x27_L045)                                   ;B4B8DD
pAIScripting0x27_L050:
    %AICMD0x1A($0048, $0298, aAIScriptingData_L024, $00)                     ;B4B8E0
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $04, pAIScripting0x27_L052) ;B4B8E8
pAIScripting0x27_L051:
    %AICMD0x1F(pAIScripting0x27_L053)                                        ;B4B8EF
    %AICMD0x12_Jump(pAIScripting0x27_L051)                                   ;B4B8F2
pAIScripting0x27_L052:
    %AICMD0x1F(pAIScripting0x27_L056)                                        ;B4B8F5
    %AICMD0x12_Jump(pAIScripting0x27_L052)                                   ;B4B8F8
pAIScripting0x27_L053:
    %AICMD0x45_JumpIfBetween16(nLove_Eve, 0, 119, pAIScripting0x27_L055)     ;B4B8FB
    %AICMD0x45_JumpIfBetween16(nLove_Eve, 120, 999, pAIScripting0x27_L054)   ;B4B905
    %AICMD0x12_Jump(pAIScripting0x27_L051)                                   ;B4B90F
pAIScripting0x27_L054:
    %AICMD0x1C_ShowDialog($02AA, $00)                          ;B4B912
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown1, $04)     ;B4B916
    %AICMD0x08_EnableAIControl()                               ;B4B91B
    %AICMD0x19($0039, $00)                                     ;B4B91C
    %AICMD0x13_Wait(120)                                       ;B4B920
    %AICMD0x11_EnableUserControl()                             ;B4B923
    %AICMD0x41_AddValue16(nPlayerHappiness, 10)                ;B4B924
    %AICMD0x57_UpdateStamina(20)                               ;B4B92A
    %AICMD0x12_Jump(pAIScripting0x27_L052)                                   ;B4B92C
pAIScripting0x27_L055:
    %AICMD0x1C_ShowDialog($02A0, $00)                          ;B4B92F
    %AICMD0x12_Jump(pAIScripting0x27_L051)                                   ;B4B933
pAIScripting0x27_L056:
    %AICMD0x1C_ShowDialog($02AB, $00)                          ;B4B936
    %AICMD0x12_Jump(pAIScripting0x27_L052)                                   ;B4B93A
    %AICMD0x08_EnableAIControl()                               ;B4B93D
    %AICMD0x3E_SetCarryItem($06)                               ;B4B93E
    %AICMD0x13_Wait(60)                                        ;B4B940
    %AICMD0x11_EnableUserControl()                             ;B4B943
    %AICMD0x12_Jump(pAIScripting0x27_L002)                                   ;B4B944


DATA8_B4B947:
 
    %AICMD0x4F_DisableToolUse()                                               ;B4B947
    %AICMD0x50()                                               ;B4B948
    %AICMD0x23_OrWithIndexedValue(strcFlags.event2, $01)       ;B4B949
    %AICMD0x02_FreezeTime()                                    ;B4B94E
    %AICMD0x03_SetHour($06)                                    ;B4B94F
    %AICMD0x05_SetTransferPosition(136, 120)                   ;B4B951
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4B956
    %AICMD0x11_EnableUserControl()                             ;B4B958
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $00, pAIScripting0x27_L057)   ;B4B959
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $01, pAIScripting0x27_L057)   ;B4B960
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, pAIScripting0x27_L057)   ;B4B967
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $03, pAIScripting0x27_L057)   ;B4B96E
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $04, pAIScripting0x27_L057)   ;B4B975
    %AICMD0x12_Jump(pAIScripting0x27_L058)                                   ;B4B97C
pAIScripting0x27_L057:
    %AICMD0x09_StartScript($01, pAIScripting0x27_L060)                                   ;B4B97F
pAIScripting0x27_L058:
    %AICMD0x38_WaitForFadeIn()                                               ;B4B983
pAIScripting0x27_L059:
    %AICMD0x13_Wait(1)                                         ;B4B984
    %AICMD0x12_Jump(pAIScripting0x27_L059)                                   ;B4B987
pAIScripting0x27_L060:
    %AICMD0x1A($0028, $0080, aAIScriptingData_L071, $00)                     ;B4B98A
pAIScripting0x27_L061:
    %AICMD0x1F(pAIScripting0x27_L063)                                        ;B4B992
    %AICMD0x12_Jump(pAIScripting0x27_L061)                                   ;B4B995
pAIScripting0x27_L062:
    %AICMD0x1F(pAIScripting0x27_L064)                                        ;B4B998
    %AICMD0x12_Jump(pAIScripting0x27_L062)                                   ;B4B99B
pAIScripting0x27_L063:
    %AICMD0x1C_ShowDialog($0292, $00)                          ;B4B99E
    %AICMD0x09_StartScript($02, pAIScripting0x27_L065)                                   ;B4B9A2
    %AICMD0x41_AddValue16(nPlayerHappiness, 10)                ;B4B9A6
    %AICMD0x57_UpdateStamina(20)                               ;B4B9AC
    %AICMD0x12_Jump(pAIScripting0x27_L062)                                   ;B4B9AE
pAIScripting0x27_L064:
    %AICMD0x1C_ShowDialog($0293, $00)                          ;B4B9B1
    %AICMD0x12_Jump(pAIScripting0x27_L062)                                   ;B4B9B5
pAIScripting0x27_L065:
    %AICMD0x08_EnableAIControl()                               ;B4B9B8
    %AICMD0x3E_SetCarryItem($06)                               ;B4B9B9
    %AICMD0x13_Wait(60)                                        ;B4B9BB
    %AICMD0x11_EnableUserControl()                             ;B4B9BE
    %AICMD0x12_Jump(pAIScripting0x27_L059)                                   ;B4B9BF


DATA8_B4B9C2:
 
    %AICMD0x4F_DisableToolUse()                                               ;B4B9C2
    %AICMD0x50()                                               ;B4B9C3
    %AICMD0x09_StartScript($01, pAIScripting0x27_L067)                                   ;B4B9C4
    %AICMD0x09_StartScript($02, pAIScripting0x27_L071)                                   ;B4B9C8
    %AICMD0x09_StartScript($03, pAIScripting0x27_L074)                                   ;B4B9CC
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $00, pAIScripting0x27_L066)   ;B4B9D0
    %AICMD0x09_StartScript($04, pAIScripting0x27_L077)                                   ;B4B9D7
pAIScripting0x27_L066:
    %AICMD0x38_WaitForFadeIn()                                               ;B4B9DB
    %AICMD0x10_End()                                           ;B4B9DC
pAIScripting0x27_L067:
    %AICMD0x1A($0070, $00F8, aAIScriptingData_L051, $00)                     ;B4B9DD
pAIScripting0x27_L068:
    %AICMD0x1F(pAIScripting0x27_L069)                                        ;B4B9E5
    %AICMD0x12_Jump(pAIScripting0x27_L068)                                   ;B4B9E8
pAIScripting0x27_L069:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $00, pAIScripting0x27_L070)   ;B4B9EB
    %AICMD0x1C_ShowDialog($029B, $00)                          ;B4B9F2
    %AICMD0x12_Jump(pAIScripting0x27_L068)                                   ;B4B9F6
pAIScripting0x27_L070:
    %AICMD0x1C_ShowDialog($0494, $00)                          ;B4B9F9
    %AICMD0x12_Jump(pAIScripting0x27_L068)                                   ;B4B9FD
pAIScripting0x27_L071:
    %AICMD0x1A($0080, $0138, aAIScriptingData_L068, $00)                     ;B4BA00
    %AICMD0x22($18, $20, $01, aAIScriptingData_L068, $10)                    ;B4BA08
pAIScripting0x27_L072:
    %AICMD0x1F(pAIScripting0x27_L073)                                        ;B4BA0F
    %AICMD0x12_Jump(pAIScripting0x27_L072)                                   ;B4BA12
pAIScripting0x27_L073:
    %AICMD0x1C_ShowDialog($029C, $00)                          ;B4BA15
    %AICMD0x12_Jump(pAIScripting0x27_L072)                                   ;B4BA19
pAIScripting0x27_L074:
    %AICMD0x1A($00A8, $01B8, aAIScriptingData_L056, $01)                     ;B4BA1C
pAIScripting0x27_L075:
    %AICMD0x1F(pAIScripting0x27_L076)                                        ;B4BA24
    %AICMD0x12_Jump(pAIScripting0x27_L075)                                   ;B4BA27
pAIScripting0x27_L076:
    %AICMD0x1C_ShowDialog($029D, $00)                          ;B4BA2A
    %AICMD0x12_Jump(pAIScripting0x27_L075)                                   ;B4BA2E
pAIScripting0x27_L077:
    %AICMD0x1A($0048, $0098, aAIScriptingData_L012, $00)                     ;B4BA31
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $00, pAIScripting0x27_L079) ;B4BA39
pAIScripting0x27_L078:
    %AICMD0x1F(pAIScripting0x27_L080)                                        ;B4BA40
    %AICMD0x12_Jump(pAIScripting0x27_L078)                                   ;B4BA43
pAIScripting0x27_L079:
    %AICMD0x1F(pAIScripting0x27_L083)                                        ;B4BA46
    %AICMD0x12_Jump(pAIScripting0x27_L079)                                   ;B4BA49
pAIScripting0x27_L080:
    %AICMD0x45_JumpIfBetween16(nLove_Maria, 0, 119, pAIScripting0x27_L082)   ;B4BA4C
    %AICMD0x45_JumpIfBetween16(nLove_Maria, 120, 999, pAIScripting0x27_L081) ;B4BA56
    %AICMD0x12_Jump(pAIScripting0x27_L078)                                   ;B4BA60
pAIScripting0x27_L081:
    %AICMD0x1C_ShowDialog($029E, $00)                          ;B4BA63
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown1, $00)     ;B4BA67
    %AICMD0x08_EnableAIControl()                               ;B4BA6C
    %AICMD0x19($0039, $00)                                     ;B4BA6D
    %AICMD0x13_Wait(120)                                       ;B4BA71
    %AICMD0x11_EnableUserControl()                             ;B4BA74
    %AICMD0x41_AddValue16(nPlayerHappiness, 10)                ;B4BA75
    %AICMD0x57_UpdateStamina(20)                               ;B4BA7B
    %AICMD0x12_Jump(pAIScripting0x27_L079)                                   ;B4BA7D
pAIScripting0x27_L082:
    %AICMD0x1C_ShowDialog($02A0, $00)                          ;B4BA80
    %AICMD0x12_Jump(pAIScripting0x27_L078)                                   ;B4BA84
pAIScripting0x27_L083:
    %AICMD0x1C_ShowDialog($029F, $00)                          ;B4BA87
    %AICMD0x12_Jump(pAIScripting0x27_L079)                                   ;B4BA8B


DATA8_B4BA8E:
    %AICMD0x4F_DisableToolUse()                                               ;B4BA8E
    %AICMD0x50()                                               ;B4BA8F
    %AICMD0x09_StartScript($01, pAIScripting0x27_L084)                                   ;B4BA90
    %AICMD0x09_StartScript($02, pAIScripting0x27_L087)                                   ;B4BA94
    %AICMD0x38_WaitForFadeIn()                                               ;B4BA98
    %AICMD0x10_End()                                           ;B4BA99
pAIScripting0x27_L084:
    %AICMD0x1A($00A8, $0078, aAIScriptingData_L044, $00)                     ;B4BA9A
    %AICMD0x22($20, $10, $01, aAIScriptingData_L045, $14)                    ;B4BAA2
pAIScripting0x27_L085:
    %AICMD0x1F(pAIScripting0x27_L086)                                        ;B4BAA9
    %AICMD0x12_Jump(pAIScripting0x27_L085)                                   ;B4BAAC
pAIScripting0x27_L086:
    %AICMD0x1C_ShowDialog($0297, $00)                          ;B4BAAF
    %AICMD0x12_Jump(pAIScripting0x27_L085)                                   ;B4BAB3
pAIScripting0x27_L087:
    %AICMD0x1A($0188, $00A0, aAIScriptingData_L061, $00)                     ;B4BAB6
pAIScripting0x27_L088:
    %AICMD0x1F(pAIScripting0x27_L089)                                        ;B4BABE
    %AICMD0x12_Jump(pAIScripting0x27_L088)                                   ;B4BAC1
pAIScripting0x27_L089:
    %AICMD0x1C_ShowDialog($0298, $00)                          ;B4BAC4
    %AICMD0x12_Jump(pAIScripting0x27_L088)                                   ;B4BAC8


pAIScripting0x28:
    dw DATA8_B4BAEB                                            ;B4BACB|        |B4BAEB;
    dw DATA8_B4BB06                                            ;B4BACD|        |B4BB06;
    dw DATA8_B4BD19                                            ;B4BACF|        |B4BD19;
    dw DATA8_B4C3AC                                            ;B4BAD1|        |B4C3AC;
    dw pAIScripting0x29                                        ;B4BAD3|        |B4C427;
    dw pAIScripting0x29                                        ;B4BAD5|        |B4C427;
    dw pAIScripting0x29                                        ;B4BAD7|        |B4C427;
    dw pAIScripting0x29                                        ;B4BAD9|        |B4C427;
    dw pAIScripting0x29                                        ;B4BADB|        |B4C427;
    dw pAIScripting0x29                                        ;B4BADD|        |B4C427;
    dw pAIScripting0x29                                        ;B4BADF|        |B4C427;
    dw pAIScripting0x29                                        ;B4BAE1|        |B4C427;
    dw pAIScripting0x29                                        ;B4BAE3|        |B4C427;
    dw pAIScripting0x29                                        ;B4BAE5|        |B4C427;
    dw pAIScripting0x29                                        ;B4BAE7|        |B4C427;
    dw pAIScripting0x29                                        ;B4BAE9|        |B4C427;
 
DATA8_B4BAEB:
 
    %AICMD0x4F_DisableToolUse()                                               ;B4BAEB
    %AICMD0x50()                                               ;B4BAEC
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $09)       ;B4BAED
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $00)       ;B4BAF2
    %AICMD0x08_EnableAIControl()                               ;B4BAF7
    %AICMD0x38_WaitForFadeIn()                                               ;B4BAF8
    %AICMD0x01_UnfreezeTime()                                  ;B4BAF9
    %AICMD0x24_NextHourPalette($74)                            ;B4BAFA
    %AICMD0x13_Wait(180)                                       ;B4BAFC
    %AICMD0x1C_ShowDialog($02F5, $00)                          ;B4BAFF
    %AICMD0x3D_TeleportToArea(!AREA_MOUNTAINTOPSUNRISE)        ;B4BB03
    %AICMD0x10_End()                                           ;B4BB05


DATA8_B4BB06:
 
    %AICMD0x4F_DisableToolUse()                                               ;B4BB06
    %AICMD0x50()                                               ;B4BB07
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $09)       ;B4BB08
    %AICMD0x00_SetMusic($0E, $B4)                              ;B4BB0D
    %AICMD0x02_FreezeTime()                                    ;B4BB10
    %AICMD0x03_SetHour($06)                                    ;B4BB11
    %AICMD0x05_SetTransferPosition(128, 440)                   ;B4BB13
    %AICMD0x08_EnableAIControl()                               ;B4BB18
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B4BB19
    %AICMD0x09_StartScript($01, pAIScripting0x28_L001)                                   ;B4BB1B
    %AICMD0x09_StartScript($02, pAIScripting0x28_L006)                                   ;B4BB1F
    %AICMD0x09_StartScript($03, pAIScripting0x28_L021)                                   ;B4BB23
    %AICMD0x09_StartScript($04, pAIScripting0x28_L024)                                   ;B4BB27
    %AICMD0x09_StartScript($05, pAIScripting0x28_L011)                                   ;B4BB2B
    %AICMD0x09_StartScript($06, pAIScripting0x28_L029)                                   ;B4BB2F
    %AICMD0x09_StartScript($07, pAIScripting0x28_L032)                                   ;B4BB33
    %AICMD0x09_StartScript($08, pAIScripting0x28_L035)                                   ;B4BB37
    %AICMD0x09_StartScript($09, pAIScripting0x28_L041)                                   ;B4BB3B
    %AICMD0x06_SetDestinationArea(!AREA_MOUNTAINTOPSUNRISE)    ;B4BB3F
    %AICMD0x38_WaitForFadeIn()                                               ;B4BB41
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 96)                    ;B4BB42
    %AICMD0x11_EnableUserControl()                             ;B4BB46
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B4BB47
    %AICMD0x0C_WaitForScriptFlag($02)                                            ;B4BB49
    %AICMD0x0C_WaitForScriptFlag($03)                                            ;B4BB4B
    %AICMD0x0C_WaitForScriptFlag($04)                                            ;B4BB4D
    %AICMD0x0C_WaitForScriptFlag($05)                                            ;B4BB4F
    %AICMD0x0C_WaitForScriptFlag($06)                                            ;B4BB51
    %AICMD0x0C_WaitForScriptFlag($07)                                            ;B4BB53
    %AICMD0x0C_WaitForScriptFlag($08)                                            ;B4BB55
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown1, $02)     ;B4BB57
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B4BB5C
    %AICMD0x13_Wait(60)                                        ;B4BB5E
    %AICMD0x3C()                                               ;B4BB61
    %AICMD0x10_End()                                           ;B4BB62
pAIScripting0x28_L001:
    %AICMD0x1A($0088, $0128, aAIScriptingData_L051, $00)                     ;B4BB63
pAIScripting0x28_L002:
    %AICMD0x1F(pAIScripting0x28_L004)                                        ;B4BB6B
    %AICMD0x12_Jump(pAIScripting0x28_L002)                                   ;B4BB6E
pAIScripting0x28_L003:
    %AICMD0x1F(pAIScripting0x28_L005)                                        ;B4BB71
    %AICMD0x12_Jump(pAIScripting0x28_L003)                                   ;B4BB74
pAIScripting0x28_L004:
    %AICMD0x08_EnableAIControl()                               ;B4BB77
    %AICMD0x1C_ShowDialog($02CE, $00)                          ;B4BB78
    %AICMD0x0B_SetScriptFlag($00)                                            ;B4BB7C
    %AICMD0x01_UnfreezeTime()                                  ;B4BB7E
    %AICMD0x03_SetHour($07)                                    ;B4BB7F
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B4BB81
    %AICMD0x13_Wait(240)                                       ;B4BB83
    %AICMD0x11_EnableUserControl()                             ;B4BB86
    %AICMD0x12_Jump(pAIScripting0x28_L003)                                   ;B4BB87
pAIScripting0x28_L005:
    %AICMD0x1C_ShowDialog($02CE, $00)                          ;B4BB8A
    %AICMD0x12_Jump(pAIScripting0x28_L003)                                   ;B4BB8E
pAIScripting0x28_L006:
    %AICMD0x1A($0080, $01E8, aAIScriptingData_L062, $01)                     ;B4BB91
    %AICMD0x0D($00, $FF, $30, $01)                             ;B4BB99
pAIScripting0x28_L007:
    %AICMD0x1F(pAIScripting0x28_L009)                                        ;B4BB9E
    %AICMD0x12_Jump(pAIScripting0x28_L007)                                   ;B4BBA1
pAIScripting0x28_L008:
    %AICMD0x1F(pAIScripting0x28_L010)                                        ;B4BBA4
    %AICMD0x12_Jump(pAIScripting0x28_L008)                                   ;B4BBA7
pAIScripting0x28_L009:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $02, pAIScripting0x28_L010) ;B4BBAA
    %AICMD0x1C_ShowDialog($02CF, $00)                          ;B4BBB1
    %AICMD0x12_Jump(pAIScripting0x28_L007)                                   ;B4BBB5
pAIScripting0x28_L010:
    %AICMD0x1C_ShowDialog($001A, $00)                          ;B4BBB8
    %AICMD0x0B_SetScriptFlag($01)                                            ;B4BBBC
    %AICMD0x12_Jump(pAIScripting0x28_L008)                                   ;B4BBBE
pAIScripting0x28_L011:
    %AICMD0x1A($0048, $0168, aAIScriptingData_L042, $01)                     ;B4BBC1
pAIScripting0x28_L012:
    %AICMD0x1F(pAIScripting0x28_L014)                                        ;B4BBC9
    %AICMD0x12_Jump(pAIScripting0x28_L012)                                   ;B4BBCC
pAIScripting0x28_L013:
    %AICMD0x1F(pAIScripting0x28_L020)                                        ;B4BBCF
    %AICMD0x12_Jump(pAIScripting0x28_L013)                                   ;B4BBD2
pAIScripting0x28_L014:
    %AICMD0x1D_ShowDialog($02D3, $00)                          ;B4BBD5
    %AICMD0x20_JumpIfChoice(0, pAIScripting0x28_L015)                        ;B4BBD9
    %AICMD0x20_JumpIfChoice(1, pAIScripting0x28_L016)                        ;B4BBDD
    %AICMD0x12_Jump(pAIScripting0x28_L012)                                   ;B4BBE1
pAIScripting0x28_L015:
    %AICMD0x1D_ShowDialog($02D4, $00)                          ;B4BBE4
    %AICMD0x17_RollRandom($03)                                            ;B4BBE8
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x28_L017)                                   ;B4BBEA
    %AICMD0x18_JumpIfRandomEquals($01, pAIScripting0x28_L018)                                   ;B4BBEE
    %AICMD0x18_JumpIfRandomEquals($02, pAIScripting0x28_L019)                                   ;B4BBF2
    %AICMD0x12_Jump(pAIScripting0x28_L013)                                   ;B4BBF6
pAIScripting0x28_L016:
    %AICMD0x1C_ShowDialog($02D8, $00)                          ;B4BBF9
    %AICMD0x0B_SetScriptFlag($02)                                            ;B4BBFD
    %AICMD0x12_Jump(pAIScripting0x28_L013)                                   ;B4BBFF
pAIScripting0x28_L017:
    %AICMD0x1C_ShowDialog($02D5, $00)                          ;B4BC02
    %AICMD0x41_AddValue16(nPlayerHappiness, 30)                ;B4BC06
    %AICMD0x0B_SetScriptFlag($02)                                            ;B4BC0C
    %AICMD0x12_Jump(pAIScripting0x28_L013)                                   ;B4BC0E
pAIScripting0x28_L018:
    %AICMD0x1C_ShowDialog($02D6, $00)                          ;B4BC11
    %AICMD0x41_AddValue16(nPlayerHappiness, 10)                ;B4BC15
    %AICMD0x0B_SetScriptFlag($02)                                            ;B4BC1B
    %AICMD0x12_Jump(pAIScripting0x28_L013)                                   ;B4BC1D
pAIScripting0x28_L019:
    %AICMD0x1C_ShowDialog($02D7, $00)                          ;B4BC20
    %AICMD0x41_AddValue16(nPlayerHappiness, -20)               ;B4BC24
    %AICMD0x0B_SetScriptFlag($02)                                            ;B4BC2A
    %AICMD0x12_Jump(pAIScripting0x28_L013)                                   ;B4BC2C
pAIScripting0x28_L020:
    %AICMD0x1C_ShowDialog($02DC, $00)                          ;B4BC2F
    %AICMD0x12_Jump(pAIScripting0x28_L013)                                   ;B4BC33
pAIScripting0x28_L021:
    %AICMD0x1A($0078, $0158, aAIScriptingData_L066, $01)                     ;B4BC36
pAIScripting0x28_L022:
    %AICMD0x1F(pAIScripting0x28_L023)                                        ;B4BC3E
    %AICMD0x12_Jump(pAIScripting0x28_L022)                                   ;B4BC41
pAIScripting0x28_L023:
    %AICMD0x1C_ShowDialog($02D0, $00)                          ;B4BC44
    %AICMD0x0B_SetScriptFlag($03)                                            ;B4BC48
    %AICMD0x12_Jump(pAIScripting0x28_L022)                                   ;B4BC4A
pAIScripting0x28_L024:
    %AICMD0x1A($00B8, $0168, aAIScriptingData_L046, $01)                     ;B4BC4D
pAIScripting0x28_L025:
    %AICMD0x1F(pAIScripting0x28_L027)                                        ;B4BC55
    %AICMD0x12_Jump(pAIScripting0x28_L025)                                   ;B4BC58
pAIScripting0x28_L026:
    %AICMD0x1F(pAIScripting0x28_L028)                                        ;B4BC5B
    %AICMD0x12_Jump(pAIScripting0x28_L026)                                   ;B4BC5E
pAIScripting0x28_L027:
    %AICMD0x1C_ShowDialog($02D1, $00)                          ;B4BC61
    %AICMD0x0B_SetScriptFlag($04)                                            ;B4BC65
    %AICMD0x12_Jump(pAIScripting0x28_L026)                                   ;B4BC67
pAIScripting0x28_L028:
    %AICMD0x1C_ShowDialog($038E, $00)                          ;B4BC6A
    %AICMD0x0B_SetScriptFlag($04)                                            ;B4BC6E
    %AICMD0x12_Jump(pAIScripting0x28_L026)                                   ;B4BC70
pAIScripting0x28_L029:
    %AICMD0x1A($00B8, $0198, aAIScriptingData_L039, $01)                     ;B4BC73
pAIScripting0x28_L030:
    %AICMD0x1F(pAIScripting0x28_L031)                                        ;B4BC7B
    %AICMD0x12_Jump(pAIScripting0x28_L030)                                   ;B4BC7E
pAIScripting0x28_L031:
    %AICMD0x1C_ShowDialog($02D9, $00)                          ;B4BC81
    %AICMD0x0B_SetScriptFlag($05)                                            ;B4BC85
    %AICMD0x12_Jump(pAIScripting0x28_L030)                                   ;B4BC87
pAIScripting0x28_L032:
    %AICMD0x1A($0058, $0188, aAIScriptingData_L048, $01)                     ;B4BC8A
pAIScripting0x28_L033:
    %AICMD0x1F(pAIScripting0x28_L034)                                        ;B4BC92
    %AICMD0x12_Jump(pAIScripting0x28_L033)                                   ;B4BC95
pAIScripting0x28_L034:
    %AICMD0x1C_ShowDialog($02D2, $00)                          ;B4BC98
    %AICMD0x0B_SetScriptFlag($06)                                            ;B4BC9C
    %AICMD0x12_Jump(pAIScripting0x28_L033)                                   ;B4BC9E
pAIScripting0x28_L035:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $00, pAIScripting0x28_L036)   ;B4BCA1
    %AICMD0x1A($0098, $0178, aAIScriptingData_L011, $01)                     ;B4BCA8
    %AICMD0x12_Jump(pAIScripting0x28_L037)                                   ;B4BCB0
pAIScripting0x28_L036:
    %AICMD0x1A($0088, $0178, aAIScriptingData_L071, $01)                     ;B4BCB3
pAIScripting0x28_L037:
    %AICMD0x1F(pAIScripting0x28_L039)                                        ;B4BCBB
    %AICMD0x12_Jump(pAIScripting0x28_L037)                                   ;B4BCBE
pAIScripting0x28_L038:
    %AICMD0x1F(pAIScripting0x28_L040)                                        ;B4BCC1
    %AICMD0x12_Jump(pAIScripting0x28_L038)                                   ;B4BCC4
pAIScripting0x28_L039:
    %AICMD0x1C_ShowDialog($02DA, $00)                          ;B4BCC7
    %AICMD0x41_AddValue16(nLove_Maria, 10)                     ;B4BCCB
    %AICMD0x0B_SetScriptFlag($07)                                            ;B4BCD1
    %AICMD0x12_Jump(pAIScripting0x28_L038)                                   ;B4BCD3
pAIScripting0x28_L040:
    %AICMD0x1C_ShowDialog($0293, $00)                          ;B4BCD6
    %AICMD0x12_Jump(pAIScripting0x28_L038)                                   ;B4BCDA
pAIScripting0x28_L041:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $04, pAIScripting0x28_L042)   ;B4BCDD
    %AICMD0x1A($00A8, $0198, aAIScriptingData_L024, $01)                     ;B4BCE4
    %AICMD0x12_Jump(pAIScripting0x28_L043)                                   ;B4BCEC
pAIScripting0x28_L042:
    %AICMD0x1A($00A8, $0198, aAIScriptingData_L071, $01)                     ;B4BCEF
pAIScripting0x28_L043:
    %AICMD0x1F(pAIScripting0x28_L045)                                        ;B4BCF7
    %AICMD0x12_Jump(pAIScripting0x28_L043)                                   ;B4BCFA
pAIScripting0x28_L044:
    %AICMD0x1F(pAIScripting0x28_L046)                                        ;B4BCFD
    %AICMD0x12_Jump(pAIScripting0x28_L044)                                   ;B4BD00
pAIScripting0x28_L045:
    %AICMD0x1C_ShowDialog($02DB, $00)                          ;B4BD03
    %AICMD0x41_AddValue16(nLove_Eve, 10)                       ;B4BD07
    %AICMD0x0B_SetScriptFlag($08)                                            ;B4BD0D
    %AICMD0x12_Jump(pAIScripting0x28_L044)                                   ;B4BD0F
pAIScripting0x28_L046:
    %AICMD0x1C_ShowDialog($0293, $00)                          ;B4BD12
    %AICMD0x12_Jump(pAIScripting0x28_L044)                                   ;B4BD16


DATA8_B4BD19:
 
    %AICMD0x4F_DisableToolUse()                                               ;B4BD19
    %AICMD0x50()                                               ;B4BD1A
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $09)       ;B4BD1B
    %AICMD0x00_SetMusic($0D, $B4)                              ;B4BD20
    %AICMD0x02_FreezeTime()                                    ;B4BD23
    %AICMD0x03_SetHour($07)                                    ;B4BD24
    %AICMD0x05_SetTransferPosition(296, 536)                   ;B4BD26
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B4BD2B
    %AICMD0x09_StartScript($01, pAIScripting0x28_L050)                                   ;B4BD2D
    %AICMD0x09_StartScript($02, pAIScripting0x28_L092)                                   ;B4BD31
    %AICMD0x09_StartScript($03, pAIScripting0x28_L102)                                   ;B4BD35
    %AICMD0x09_StartScript($04, pAIScripting0x28_L110)                                   ;B4BD39
    %AICMD0x09_StartScript($05, pAIScripting0x28_L119)                                   ;B4BD3D
    %AICMD0x09_StartScript($06, pAIScripting0x28_L127)                                   ;B4BD41
    %AICMD0x09_StartScript($07, pAIScripting0x28_L141)                                   ;B4BD45
    %AICMD0x09_StartScript($08, pAIScripting0x28_L155)                                   ;B4BD49
    %AICMD0x06_SetDestinationArea(!AREA_EGGFESTIVAL)           ;B4BD4D
    %AICMD0x11_EnableUserControl()                             ;B4BD4F
    %AICMD0x38_WaitForFadeIn()                                               ;B4BD50
pAIScripting0x28_L047:
    %AICMD0x13_Wait(1)                                         ;B4BD51
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $04, pAIScripting0x28_L048) ;B4BD54
    %AICMD0x12_Jump(pAIScripting0x28_L047)                                   ;B4BD5B
pAIScripting0x28_L048:
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown1, $07)     ;B4BD5E
    %AICMD0x3D_TeleportToArea(!AREA_EGGFESTIVAL)               ;B4BD63
    %AICMD0x10_End()                                           ;B4BD65
pAIScripting0x28_L049:
    %AICMD0x13_Wait(1800)                                      ;B4BD66
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown1, $05)     ;B4BD69
    %AICMD0x10_End()                                           ;B4BD6E
pAIScripting0x28_L050:
    %AICMD0x1A($0128, $01A8, aAIScriptingData_L044, $00)                     ;B4BD6F
pAIScripting0x28_L051:
    %AICMD0x1F(pAIScripting0x28_L053)                                        ;B4BD77
    %AICMD0x12_Jump(pAIScripting0x28_L051)                                   ;B4BD7A
pAIScripting0x28_L052:
    %AICMD0x2D_JumpOnInteract(pAIScripting0x28_L056, pAIScripting0x28_L057)                               ;B4BD7D
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $05, pAIScripting0x28_L071) ;B4BD82
    %AICMD0x12_Jump(pAIScripting0x28_L052)                                   ;B4BD89
pAIScripting0x28_L053:
    %AICMD0x1D_ShowDialog($02DD, $00)                          ;B4BD8C
    %AICMD0x20_JumpIfChoice(0, pAIScripting0x28_L054)                        ;B4BD90
    %AICMD0x20_JumpIfChoice(1, pAIScripting0x28_L055)                        ;B4BD94
    %AICMD0x12_Jump(pAIScripting0x28_L051)                                   ;B4BD98
pAIScripting0x28_L054:
    %AICMD0x08_EnableAIControl()                               ;B4BD9B
    %AICMD0x1C_ShowDialog($02DE, $00)                          ;B4BD9C
    %AICMD0x28_ClearBit(strcFlags.unknown1, $05)                        ;B4BDA0
    %AICMD0x1B($0295, $00)                                     ;B4BDA5
    %AICMD0x09_StartScript($09, pAIScripting0x28_L081)                                   ;B4BDA9
    %AICMD0x09_StartScript($0A, pAIScripting0x28_L049)                                   ;B4BDAD
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B4BDB1
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown1, $03)     ;B4BDB3
    %AICMD0x11_EnableUserControl()                             ;B4BDB8
    %AICMD0x12_Jump(pAIScripting0x28_L052)                                   ;B4BDB9
pAIScripting0x28_L055:
    %AICMD0x1C_ShowDialog($0236, $00)                          ;B4BDBC
    %AICMD0x12_Jump(pAIScripting0x28_L051)                                   ;B4BDC0
pAIScripting0x28_L056:
    %AICMD0x1C_ShowDialog($02DF, $00)                          ;B4BDC3
    %AICMD0x1B($0295, $00)                                     ;B4BDC7
    %AICMD0x12_Jump(pAIScripting0x28_L052)                                   ;B4BDCB
pAIScripting0x28_L057:
    %AICMD0x21_AddValue8($8009A2, 1)                           ;B4BDCE
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown2, $00, pAIScripting0x28_L058) ;B4BDD3
    %AICMD0x12_Jump(pAIScripting0x28_L062)                                   ;B4BDDA
pAIScripting0x28_L058:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown2, $01, pAIScripting0x28_L059) ;B4BDDD
    %AICMD0x12_Jump(pAIScripting0x28_L062)                                   ;B4BDE4
pAIScripting0x28_L059:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown2, $02, pAIScripting0x28_L060) ;B4BDE7
    %AICMD0x12_Jump(pAIScripting0x28_L062)                                   ;B4BDEE
pAIScripting0x28_L060:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown2, $03, pAIScripting0x28_L061) ;B4BDF1
    %AICMD0x12_Jump(pAIScripting0x28_L062)                                   ;B4BDF8
pAIScripting0x28_L061:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown2, $04, pAIScripting0x28_L070) ;B4BDFB
pAIScripting0x28_L062:
    %AICMD0x08_EnableAIControl()                               ;B4BE02
    %AICMD0x13_Wait(1)                                         ;B4BE03
    %AICMD0x2C($19, $0006, $005A)                              ;B4BE06
    %AICMD0x11_EnableUserControl()                             ;B4BE0C
    %AICMD0x1C_ShowDialog($02E7, $00)                          ;B4BE0D
pAIScripting0x28_L063:
    %AICMD0x15_JumpIfEquals8($8009AC, 1, pAIScripting0x28_L064)              ;B4BE11
    %AICMD0x15_JumpIfEquals8($8009AC, 2, pAIScripting0x28_L065)              ;B4BE18
    %AICMD0x15_JumpIfEquals8($8009AC, 3, pAIScripting0x28_L066)              ;B4BE1F
    %AICMD0x15_JumpIfEquals8($8009AC, 4, pAIScripting0x28_L067)              ;B4BE26
    %AICMD0x15_JumpIfEquals8($8009AC, 5, pAIScripting0x28_L068)              ;B4BE2D
pAIScripting0x28_L064:
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown3, $00)     ;B4BE34
    %AICMD0x12_Jump(pAIScripting0x28_L069)                                   ;B4BE39
pAIScripting0x28_L065:
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown3, $01)     ;B4BE3C
    %AICMD0x12_Jump(pAIScripting0x28_L069)                                   ;B4BE41
pAIScripting0x28_L066:
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown3, $02)     ;B4BE44
    %AICMD0x12_Jump(pAIScripting0x28_L069)                                   ;B4BE49
pAIScripting0x28_L067:
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown3, $03)     ;B4BE4C
    %AICMD0x12_Jump(pAIScripting0x28_L069)                                   ;B4BE51
pAIScripting0x28_L068:
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown3, $04)     ;B4BE54
    %AICMD0x12_Jump(pAIScripting0x28_L069)                                   ;B4BE59
pAIScripting0x28_L069:
    %AICMD0x25_RemoveActor($09)                                            ;B4BE5C
    %AICMD0x28_ClearBit(strcFlags.unknown1, $05)                        ;B4BE5E
    %AICMD0x1B($0295, $00)                                     ;B4BE63
    %AICMD0x09_StartScript($09, pAIScripting0x28_L081)                                   ;B4BE67
    %AICMD0x09_StartScript($0A, pAIScripting0x28_L049)                                   ;B4BE6B
    %AICMD0x12_Jump(pAIScripting0x28_L052)                                   ;B4BE6F
pAIScripting0x28_L070:
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown1, $04)     ;B4BE72
    %AICMD0x1C_ShowDialog($02E8, $00)                          ;B4BE77
    %AICMD0x10_End()                                           ;B4BE7B
pAIScripting0x28_L071:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown2, $00, pAIScripting0x28_L072) ;B4BE7C
    %AICMD0x12_Jump(pAIScripting0x28_L076)                                   ;B4BE83
pAIScripting0x28_L072:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown2, $01, pAIScripting0x28_L073) ;B4BE86
    %AICMD0x12_Jump(pAIScripting0x28_L076)                                   ;B4BE8D
pAIScripting0x28_L073:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown2, $02, pAIScripting0x28_L074) ;B4BE90
    %AICMD0x12_Jump(pAIScripting0x28_L076)                                   ;B4BE97
pAIScripting0x28_L074:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown2, $03, pAIScripting0x28_L075) ;B4BE9A
    %AICMD0x12_Jump(pAIScripting0x28_L076)                                   ;B4BEA1
pAIScripting0x28_L075:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown2, $04, pAIScripting0x28_L070) ;B4BEA4
pAIScripting0x28_L076:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $06, pAIScripting0x28_L077) ;B4BEAB
    %AICMD0x08_EnableAIControl()                               ;B4BEB2
    %AICMD0x13_Wait(1)                                         ;B4BEB3
    %AICMD0x2C($19, $0006, $005A)                              ;B4BEB6
    %AICMD0x11_EnableUserControl()                             ;B4BEBC
    %AICMD0x1C_ShowDialog($02E9, $00)                          ;B4BEBD
    %AICMD0x12_Jump(pAIScripting0x28_L063)                                   ;B4BEC1
pAIScripting0x28_L077:
    %AICMD0x28_ClearBit(strcFlags.unknown1, $06)                        ;B4BEC4
    %AICMD0x08_EnableAIControl()                               ;B4BEC9
    %AICMD0x13_Wait(1)                                         ;B4BECA
    %AICMD0x2C($04, $0006, $005A)                              ;B4BECD
    %AICMD0x11_EnableUserControl()                             ;B4BED3
    %AICMD0x1C_ShowDialog($0390, $00)                          ;B4BED4
    %AICMD0x12_Jump(pAIScripting0x28_L063)                                   ;B4BED8
pAIScripting0x28_L078:
    %AICMD0x1A($0128, $01A8, aAIScriptingData_L044, $00)                     ;B4BEDB
pAIScripting0x28_L079:
    %AICMD0x1F(pAIScripting0x28_L080)                                        ;B4BEE3
    %AICMD0x12_Jump(pAIScripting0x28_L079)                                   ;B4BEE6
pAIScripting0x28_L080:
    %AICMD0x1C_ShowDialog($02ED, $00)                          ;B4BEE9
    %AICMD0x12_Jump(pAIScripting0x28_L079)                                   ;B4BEED
pAIScripting0x28_L081:
    %AICMD0x17_RollRandom($05)                                            ;B4BEF0
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x28_L083)                                   ;B4BEF2
    %AICMD0x18_JumpIfRandomEquals($01, pAIScripting0x28_L084)                                   ;B4BEF6
    %AICMD0x18_JumpIfRandomEquals($02, pAIScripting0x28_L085)                                   ;B4BEFA
    %AICMD0x18_JumpIfRandomEquals($03, pAIScripting0x28_L086)                                   ;B4BEFE
    %AICMD0x18_JumpIfRandomEquals($04, pAIScripting0x28_L087)                                   ;B4BF02
pAIScripting0x28_L082:
    %AICMD0x13_Wait(120)                                       ;B4BF06
    %AICMD0x0B_SetScriptFlag($01)                                            ;B4BF09
    %AICMD0x10_End()                                           ;B4BF0B
pAIScripting0x28_L083:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown2, $00, pAIScripting0x28_L084) ;B4BF0C
    %AICMD0x1A($0128, $01B0, aAIScriptingData_L097, $00)                     ;B4BF13
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown2, $00)     ;B4BF1B
    %AICMD0x47_SetValue8($8009AC, 1)                           ;B4BF20
    %AICMD0x12_Jump(pAIScripting0x28_L082)                                   ;B4BF25
pAIScripting0x28_L084:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown2, $01, pAIScripting0x28_L085) ;B4BF28
    %AICMD0x1A($0128, $01B0, aAIScriptingData_L098, $00)                     ;B4BF2F
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown2, $01)     ;B4BF37
    %AICMD0x47_SetValue8($8009AC, 2)                           ;B4BF3C
    %AICMD0x12_Jump(pAIScripting0x28_L082)                                   ;B4BF41
pAIScripting0x28_L085:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown2, $02, pAIScripting0x28_L086) ;B4BF44
    %AICMD0x1A($0128, $01B0, aAIScriptingData_L099, $00)                     ;B4BF4B
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown2, $02)     ;B4BF53
    %AICMD0x47_SetValue8($8009AC, 3)                           ;B4BF58
    %AICMD0x12_Jump(pAIScripting0x28_L082)                                   ;B4BF5D
pAIScripting0x28_L086:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown2, $03, pAIScripting0x28_L087) ;B4BF60
    %AICMD0x1A($0128, $01B0, aAIScriptingData_L100, $00)                     ;B4BF67
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown2, $03)     ;B4BF6F
    %AICMD0x47_SetValue8($8009AC, 4)                           ;B4BF74
    %AICMD0x12_Jump(pAIScripting0x28_L082)                                   ;B4BF79
pAIScripting0x28_L087:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown2, $04, pAIScripting0x28_L083) ;B4BF7C
    %AICMD0x1A($0128, $01B0, aAIScriptingData_L101, $00)                     ;B4BF83
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown2, $04)     ;B4BF8B
    %AICMD0x47_SetValue8($8009AC, 5)                           ;B4BF90
    %AICMD0x12_Jump(pAIScripting0x28_L082)                                   ;B4BF95
pAIScripting0x28_L088:
    %AICMD0x17_RollRandom($02)                                            ;B4BF98
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x28_L090)                                   ;B4BF9A
    %AICMD0x18_JumpIfRandomEquals($01, pAIScripting0x28_L091)                                   ;B4BF9E
pAIScripting0x28_L089:
    %AICMD0x10_End()                                           ;B4BFA2
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $0A, pAIScripting0x28_L090)   ;B4BFA3
    %AICMD0x23_OrWithIndexedValue(strcFlags.event5, $0A)       ;B4BFAA
    %AICMD0x41_AddValue16(nStoredFeed, 30)                     ;B4BFAF
    %AICMD0x1C_ShowDialog($02EB, $00)                          ;B4BFB5
    %AICMD0x0B_SetScriptFlag($00)                                            ;B4BFB9
    %AICMD0x12_Jump(pAIScripting0x28_L089)                                   ;B4BFBB
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $0B, pAIScripting0x28_L090)   ;B4BFBE
    %AICMD0x23_OrWithIndexedValue(strcFlags.event5, $0B)       ;B4BFC5
    %AICMD0x41_AddValue16(nStoredFeed, 30)                     ;B4BFCA
    %AICMD0x1C_ShowDialog($02EB, $00)                          ;B4BFD0
    %AICMD0x0B_SetScriptFlag($00)                                            ;B4BFD4
    %AICMD0x12_Jump(pAIScripting0x28_L089)                                   ;B4BFD6
pAIScripting0x28_L090:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $0C, pAIScripting0x28_L091)   ;B4BFD9
    %AICMD0x23_OrWithIndexedValue(strcFlags.event5, $0C)       ;B4BFE0
    %AICMD0x41_AddValue16(nPlayerHappiness, 50)                ;B4BFE5
    %AICMD0x0B_SetScriptFlag($00)                                            ;B4BFEB
    %AICMD0x12_Jump(pAIScripting0x28_L089)                                   ;B4BFED
pAIScripting0x28_L091:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $0D, pAIScripting0x28_L090)   ;B4BFF0
    %AICMD0x23_OrWithIndexedValue(strcFlags.event5, $0D)       ;B4BFF7
    %AICMD0x0B_SetScriptFlag($00)                                            ;B4BFFC
    %AICMD0x12_Jump(pAIScripting0x28_L089)                                   ;B4BFFE
pAIScripting0x28_L092:
    %AICMD0x1A($00E0, $0168, aAIScriptingData_L053, $00)                     ;B4C001
pAIScripting0x28_L093:
    %AICMD0x1F(pAIScripting0x28_L094)                                        ;B4C009
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $03, pAIScripting0x28_L095) ;B4C00C
    %AICMD0x12_Jump(pAIScripting0x28_L093)                                   ;B4C013
pAIScripting0x28_L094:
    %AICMD0x1C_ShowDialog($02E0, $00)                          ;B4C016
    %AICMD0x12_Jump(pAIScripting0x28_L093)                                   ;B4C01A
pAIScripting0x28_L095:
    %AICMD0x1B($02AE, $00)                                     ;B4C01D
    %AICMD0x0D($00, $FF, $40, $01)                             ;B4C021
    %AICMD0x1B($02B0, $01)                                     ;B4C026
    %AICMD0x0D($01, $00, $40, $01)                             ;B4C02A
    %AICMD0x13_Wait(30)                                        ;B4C02F
    %AICMD0x1B($02B0, $00)                                     ;B4C032
    %AICMD0x0D($FF, $00, $40, $01)                             ;B4C036
    %AICMD0x1B($02AC, $00)                                     ;B4C03B
    %AICMD0x0D($00, $01, $40, $01)                             ;B4C03F
    %AICMD0x13_Wait(60)                                        ;B4C044
    %AICMD0x12_Jump(pAIScripting0x28_L095)                                   ;B4C047
pAIScripting0x28_L096:
    %AICMD0x1F(pAIScripting0x28_L097)                                        ;B4C04A
    %AICMD0x12_Jump(pAIScripting0x28_L096)                                   ;B4C04D
pAIScripting0x28_L097:
    %AICMD0x1C_ShowDialog($02E0, $00)                          ;B4C050
    %AICMD0x12_Jump(pAIScripting0x28_L096)                                   ;B4C054
pAIScripting0x28_L098:
    %AICMD0x1A($0158, $01B8, aAIScriptingData_L053, $03)                     ;B4C057
    %AICMD0x12_Jump(pAIScripting0x28_L099)                                   ;B4C05F
pAIScripting0x28_L099:
    %AICMD0x1F(pAIScripting0x28_L100)                                        ;B4C062
    %AICMD0x12_Jump(pAIScripting0x28_L099)                                   ;B4C065
pAIScripting0x28_L100:
    %AICMD0x15_JumpIfEquals8($8009A2, 0, pAIScripting0x28_L101)              ;B4C068
    %AICMD0x15_JumpIfEquals8($8009A2, 1, pAIScripting0x28_L101)              ;B4C06F
    %AICMD0x15_JumpIfEquals8($8009A2, 2, pAIScripting0x28_L101)              ;B4C076
    %AICMD0x1C_ShowDialog($02EF, $00)                          ;B4C07D
    %AICMD0x0B_SetScriptFlag($03)                                            ;B4C081
    %AICMD0x12_Jump(pAIScripting0x28_L099)                                   ;B4C083
pAIScripting0x28_L101:
    %AICMD0x1C_ShowDialog($02EE, $00)                          ;B4C086
    %AICMD0x0B_SetScriptFlag($03)                                            ;B4C08A
    %AICMD0x12_Jump(pAIScripting0x28_L099)                                   ;B4C08C
pAIScripting0x28_L102:
    %AICMD0x1A($0170, $0168, aAIScriptingData_L050, $00)                     ;B4C08F
pAIScripting0x28_L103:
    %AICMD0x1F(pAIScripting0x28_L105)                                        ;B4C097
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $03, pAIScripting0x28_L106) ;B4C09A
    %AICMD0x12_Jump(pAIScripting0x28_L103)                                   ;B4C0A1
pAIScripting0x28_L104:
    %AICMD0x13_Wait(1)                                         ;B4C0A4
    %AICMD0x12_Jump(pAIScripting0x28_L104)                                   ;B4C0A7
pAIScripting0x28_L105:
    %AICMD0x1C_ShowDialog($02E1, $00)                          ;B4C0AA
    %AICMD0x12_Jump(pAIScripting0x28_L103)                                   ;B4C0AE
pAIScripting0x28_L106:
    %AICMD0x0D($00, $01, $20, $01)                             ;B4C0B1
    %AICMD0x22($10, $08, $01, aAIScriptingData_L050, $08)                    ;B4C0B6
    %AICMD0x12_Jump(pAIScripting0x28_L104)                                   ;B4C0BD
pAIScripting0x28_L107:
    %AICMD0x1A($0168, $0178, aAIScriptingData_L050, $00)                     ;B4C0C0
    %AICMD0x12_Jump(pAIScripting0x28_L108)                                   ;B4C0C8
pAIScripting0x28_L108:
    %AICMD0x1F(pAIScripting0x28_L109)                                        ;B4C0CB
    %AICMD0x12_Jump(pAIScripting0x28_L108)                                   ;B4C0CE
pAIScripting0x28_L109:
    %AICMD0x1C_ShowDialog($02F0, $00)                          ;B4C0D1
    %AICMD0x0B_SetScriptFlag($04)                                            ;B4C0D5
    %AICMD0x12_Jump(pAIScripting0x28_L108)                                   ;B4C0D7
pAIScripting0x28_L110:
    %AICMD0x1A($0118, $0270, aAIScriptingData_L068, $02)                     ;B4C0DA
pAIScripting0x28_L111:
    %AICMD0x1F(pAIScripting0x28_L113)                                        ;B4C0E2
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $03, pAIScripting0x28_L115) ;B4C0E5
    %AICMD0x12_Jump(pAIScripting0x28_L111)                                   ;B4C0EC
pAIScripting0x28_L112:
    %AICMD0x1F(pAIScripting0x28_L114)                                        ;B4C0EF
    %AICMD0x12_Jump(pAIScripting0x28_L112)                                   ;B4C0F2
pAIScripting0x28_L113:
    %AICMD0x1C_ShowDialog($02E2, $00)                          ;B4C0F5
    %AICMD0x12_Jump(pAIScripting0x28_L111)                                   ;B4C0F9
pAIScripting0x28_L114:
    %AICMD0x1C_ShowDialog($02E2, $00)                          ;B4C0FC
    %AICMD0x12_Jump(pAIScripting0x28_L112)                                   ;B4C100
pAIScripting0x28_L115:
    %AICMD0x0D($01, $00, $20, $01)                             ;B4C103
    %AICMD0x1B($02D3, $00)                                     ;B4C108
    %AICMD0x0D($00, $01, $60, $01)                             ;B4C10C
    %AICMD0x1B($02D7, $00)                                     ;B4C111
    %AICMD0x0D($FF, $00, $A0, $01)                             ;B4C115
    %AICMD0x22($20, $20, $01, aAIScriptingData_L068, $10)                    ;B4C11A
    %AICMD0x12_Jump(pAIScripting0x28_L112)                                   ;B4C121
pAIScripting0x28_L116:
    %AICMD0x1A($0108, $01B8, aAIScriptingData_L067, $01)                     ;B4C124
    %AICMD0x12_Jump(pAIScripting0x28_L117)                                   ;B4C12C
pAIScripting0x28_L117:
    %AICMD0x1F(pAIScripting0x28_L118)                                        ;B4C12F
    %AICMD0x12_Jump(pAIScripting0x28_L117)                                   ;B4C132
pAIScripting0x28_L118:
    %AICMD0x1C_ShowDialog($02F1, $00)                          ;B4C135
    %AICMD0x0B_SetScriptFlag($05)                                            ;B4C139
    %AICMD0x12_Jump(pAIScripting0x28_L117)                                   ;B4C13B
pAIScripting0x28_L119:
    %AICMD0x1A($0138, $0298, aAIScriptingData_L056, $00)                     ;B4C13E
pAIScripting0x28_L120:
    %AICMD0x1F(pAIScripting0x28_L122)                                        ;B4C146
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $03, pAIScripting0x28_L123) ;B4C149
    %AICMD0x12_Jump(pAIScripting0x28_L120)                                   ;B4C150
pAIScripting0x28_L121:
    %AICMD0x13_Wait(1)                                         ;B4C153
    %AICMD0x12_Jump(pAIScripting0x28_L121)                                   ;B4C156
pAIScripting0x28_L122:
    %AICMD0x1C_ShowDialog($02E3, $00)                          ;B4C159
    %AICMD0x12_Jump(pAIScripting0x28_L120)                                   ;B4C15D
pAIScripting0x28_L123:
    %AICMD0x0D($00, $01, $50, $01)                             ;B4C160
    %AICMD0x1B($02B6, $01)                                     ;B4C165
    %AICMD0x0D($01, $00, $60, $01)                             ;B4C169
    %AICMD0x22($18, $20, $01, aAIScriptingData_L056, $10)                    ;B4C16E
    %AICMD0x12_Jump(pAIScripting0x28_L112)                                   ;B4C175
pAIScripting0x28_L124:
    %AICMD0x1A($0138, $0218, aAIScriptingData_L055, $01)                     ;B4C178
pAIScripting0x28_L125:
    %AICMD0x1F(pAIScripting0x28_L126)                                        ;B4C180
    %AICMD0x12_Jump(pAIScripting0x28_L125)                                   ;B4C183
pAIScripting0x28_L126:
    %AICMD0x1C_ShowDialog($02F1, $00)                          ;B4C186
    %AICMD0x0B_SetScriptFlag($06)                                            ;B4C18A
    %AICMD0x12_Jump(pAIScripting0x28_L125)                                   ;B4C18C
pAIScripting0x28_L127:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $01, pAIScripting0x28_L128)   ;B4C18F
    %AICMD0x1A($00D8, $0228, aAIScriptingData_L016, $01)                     ;B4C196
    %AICMD0x12_Jump(pAIScripting0x28_L129)                                   ;B4C19E
pAIScripting0x28_L128:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event6, $04, pAIScripting0x28_L140)   ;B4C1A1
    %AICMD0x1A($00D8, $0228, aAIScriptingData_L071, $01)                     ;B4C1A8
pAIScripting0x28_L129:
    %AICMD0x1F(pAIScripting0x28_L131)                                        ;B4C1B0
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $03, pAIScripting0x28_L132) ;B4C1B3
    %AICMD0x12_Jump(pAIScripting0x28_L129)                                   ;B4C1BA
pAIScripting0x28_L130:
    %AICMD0x13_Wait(1)                                         ;B4C1BD
    %AICMD0x12_Jump(pAIScripting0x28_L130)                                   ;B4C1C0
pAIScripting0x28_L131:
    %AICMD0x1C_ShowDialog($02E4, $00)                          ;B4C1C3
    %AICMD0x12_Jump(pAIScripting0x28_L129)                                   ;B4C1C7
pAIScripting0x28_L132:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $01, pAIScripting0x28_L133)   ;B4C1CA
    %AICMD0x1B($022B, $01)                                     ;B4C1D1
    %AICMD0x0D($01, $00, $84, $01)                             ;B4C1D5
    %AICMD0x22($20, $20, $01, aAIScriptingData_L016, $10)                    ;B4C1DA
    %AICMD0x12_Jump(pAIScripting0x28_L130)                                   ;B4C1E1
pAIScripting0x28_L133:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event6, $04, pAIScripting0x28_L140)   ;B4C1E4
    %AICMD0x22($20, $20, $01, aAIScriptingData_L073, $10)                    ;B4C1EB
    %AICMD0x12_Jump(pAIScripting0x28_L130)                                   ;B4C1F2
pAIScripting0x28_L134:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $01, pAIScripting0x28_L135)   ;B4C1F5
    %AICMD0x1A($0178, $01D8, aAIScriptingData_L015, $00)                     ;B4C1FC
    %AICMD0x12_Jump(pAIScripting0x28_L136)                                   ;B4C204
pAIScripting0x28_L135:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event6, $04, pAIScripting0x28_L140)   ;B4C207
    %AICMD0x1A($0178, $01D8, aAIScriptingData_L071, $00)                     ;B4C20E
pAIScripting0x28_L136:
    %AICMD0x1F(pAIScripting0x28_L138)                                        ;B4C216
    %AICMD0x12_Jump(pAIScripting0x28_L136)                                   ;B4C219
pAIScripting0x28_L137:
    %AICMD0x1F(pAIScripting0x28_L139)                                        ;B4C21C
    %AICMD0x12_Jump(pAIScripting0x28_L137)                                   ;B4C21F
pAIScripting0x28_L138:
    %AICMD0x1C_ShowDialog($02F2, $00)                          ;B4C222
    %AICMD0x41_AddValue16(nLove_Ann, 10)                       ;B4C226
    %AICMD0x0B_SetScriptFlag($07)                                            ;B4C22C
    %AICMD0x12_Jump(pAIScripting0x28_L137)                                   ;B4C22E
pAIScripting0x28_L139:
    %AICMD0x1C_ShowDialog($02F1, $00)                          ;B4C231
    %AICMD0x12_Jump(pAIScripting0x28_L137)                                   ;B4C235
pAIScripting0x28_L140:
    %AICMD0x10_End()                                           ;B4C238
pAIScripting0x28_L141:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, pAIScripting0x28_L142)   ;B4C239
    %AICMD0x1A($00C8, $0218, aAIScriptingData_L020, $02)                     ;B4C240
    %AICMD0x12_Jump(pAIScripting0x28_L143)                                   ;B4C248
pAIScripting0x28_L142:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event6, $04, pAIScripting0x28_L154)   ;B4C24B
    %AICMD0x1A($00C8, $0218, aAIScriptingData_L071, $00)                     ;B4C252
pAIScripting0x28_L143:
    %AICMD0x1F(pAIScripting0x28_L145)                                        ;B4C25A
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $03, pAIScripting0x28_L146) ;B4C25D
    %AICMD0x12_Jump(pAIScripting0x28_L143)                                   ;B4C264
pAIScripting0x28_L144:
    %AICMD0x13_Wait(1)                                         ;B4C267
    %AICMD0x12_Jump(pAIScripting0x28_L144)                                   ;B4C26A
pAIScripting0x28_L145:
    %AICMD0x1C_ShowDialog($02E5, $00)                          ;B4C26D
    %AICMD0x12_Jump(pAIScripting0x28_L143)                                   ;B4C271
pAIScripting0x28_L146:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, pAIScripting0x28_L147)   ;B4C274
    %AICMD0x13_Wait(80)                                        ;B4C27B
    %AICMD0x1B($0250, $01)                                     ;B4C27E
    %AICMD0x0D($01, $00, $40, $01)                             ;B4C282
    %AICMD0x22($20, $18, $01, aAIScriptingData_L020, $10)                    ;B4C287
    %AICMD0x12_Jump(pAIScripting0x28_L144)                                   ;B4C28E
pAIScripting0x28_L147:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event6, $04, pAIScripting0x28_L154)   ;B4C291
    %AICMD0x22($20, $20, $01, aAIScriptingData_L073, $00)                    ;B4C298
    %AICMD0x12_Jump(pAIScripting0x28_L144)                                   ;B4C29F
pAIScripting0x28_L148:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, pAIScripting0x28_L149)   ;B4C2A2
    %AICMD0x1A($0168, $01D8, aAIScriptingData_L019, $00)                     ;B4C2A9
    %AICMD0x12_Jump(pAIScripting0x28_L150)                                   ;B4C2B1
pAIScripting0x28_L149:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event6, $04, pAIScripting0x28_L154)   ;B4C2B4
    %AICMD0x1A($0168, $01D8, aAIScriptingData_L071, $00)                     ;B4C2BB
pAIScripting0x28_L150:
    %AICMD0x1F(pAIScripting0x28_L152)                                        ;B4C2C3
    %AICMD0x12_Jump(pAIScripting0x28_L150)                                   ;B4C2C6
pAIScripting0x28_L151:
    %AICMD0x1F(pAIScripting0x28_L153)                                        ;B4C2C9
    %AICMD0x12_Jump(pAIScripting0x28_L151)                                   ;B4C2CC
pAIScripting0x28_L152:
    %AICMD0x1C_ShowDialog($02F3, $00)                          ;B4C2CF
    %AICMD0x41_AddValue16(nLove_Nina, 10)                      ;B4C2D3
    %AICMD0x0B_SetScriptFlag($08)                                            ;B4C2D9
    %AICMD0x12_Jump(pAIScripting0x28_L151)                                   ;B4C2DB
pAIScripting0x28_L153:
    %AICMD0x1C_ShowDialog($02F1, $00)                          ;B4C2DE
    %AICMD0x12_Jump(pAIScripting0x28_L137)                                   ;B4C2E2
pAIScripting0x28_L154:
    %AICMD0x10_End()                                           ;B4C2E5
pAIScripting0x28_L155:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $03, pAIScripting0x28_L156)   ;B4C2E6
    %AICMD0x1A($00D8, $0208, aAIScriptingData_L022, $00)                     ;B4C2ED
    %AICMD0x12_Jump(pAIScripting0x28_L157)                                   ;B4C2F5
pAIScripting0x28_L156:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event6, $04, pAIScripting0x28_L168)   ;B4C2F8
    %AICMD0x1A($00D8, $0208, aAIScriptingData_L071, $00)                     ;B4C2FF
pAIScripting0x28_L157:
    %AICMD0x1F(pAIScripting0x28_L159)                                        ;B4C307
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $03, pAIScripting0x28_L160) ;B4C30A
    %AICMD0x12_Jump(pAIScripting0x28_L157)                                   ;B4C311
pAIScripting0x28_L158:
    %AICMD0x13_Wait(1)                                         ;B4C314
    %AICMD0x12_Jump(pAIScripting0x28_L158)                                   ;B4C317
pAIScripting0x28_L159:
    %AICMD0x1C_ShowDialog($02E6, $00)                          ;B4C31A
    %AICMD0x12_Jump(pAIScripting0x28_L157)                                   ;B4C31E
pAIScripting0x28_L160:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $03, pAIScripting0x28_L161)   ;B4C321
    %AICMD0x1B($023F, $00)                                     ;B4C328
    %AICMD0x0D($00, $FF, $40, $01)                             ;B4C32C
    %AICMD0x13_Wait(30)                                        ;B4C331
    %AICMD0x0D($00, $FF, $40, $01)                             ;B4C334
    %AICMD0x13_Wait(30)                                        ;B4C339
    %AICMD0x0D($00, $FF, $40, $01)                             ;B4C33C
    %AICMD0x13_Wait(30)                                        ;B4C341
    %AICMD0x1B($0241, $00)                                     ;B4C344
    %AICMD0x0D($FF, $00, $A8, $01)                             ;B4C348
    %AICMD0x22($18, $20, $01, aAIScriptingData_L022, $10)                    ;B4C34D
    %AICMD0x12_Jump(pAIScripting0x28_L158)                                   ;B4C354
pAIScripting0x28_L161:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event6, $04, pAIScripting0x28_L168)   ;B4C357
    %AICMD0x22($20, $20, $01, aAIScriptingData_L073, $10)                    ;B4C35E
    %AICMD0x12_Jump(pAIScripting0x28_L158)                                   ;B4C365
pAIScripting0x28_L162:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $03, pAIScripting0x28_L163)   ;B4C368
    %AICMD0x1A($00F8, $01E8, aAIScriptingData_L021, $00)                     ;B4C36F
    %AICMD0x12_Jump(pAIScripting0x28_L164)                                   ;B4C377
pAIScripting0x28_L163:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event6, $04, pAIScripting0x28_L168)   ;B4C37A
    %AICMD0x1A($00F8, $01E8, aAIScriptingData_L071, $00)                     ;B4C381
pAIScripting0x28_L164:
    %AICMD0x1F(pAIScripting0x28_L166)                                        ;B4C389
    %AICMD0x12_Jump(pAIScripting0x28_L164)                                   ;B4C38C
pAIScripting0x28_L165:
    %AICMD0x1F(pAIScripting0x28_L167)                                        ;B4C38F
    %AICMD0x12_Jump(pAIScripting0x28_L165)                                   ;B4C392
pAIScripting0x28_L166:
    %AICMD0x1C_ShowDialog($02F4, $00)                          ;B4C395
    %AICMD0x41_AddValue16(nLove_Ellen, 10)                     ;B4C399
    %AICMD0x0B_SetScriptFlag($09)                                            ;B4C39F
    %AICMD0x12_Jump(pAIScripting0x28_L165)                                   ;B4C3A1
pAIScripting0x28_L167:
    %AICMD0x1C_ShowDialog($02F1, $00)                          ;B4C3A4
    %AICMD0x12_Jump(pAIScripting0x28_L165)                                   ;B4C3A8
pAIScripting0x28_L168:
    %AICMD0x10_End()                                           ;B4C3AB


DATA8_B4C3AC:
    %AICMD0x4F_DisableToolUse()                                               ;B4C3AC
    %AICMD0x50()                                               ;B4C3AD
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $09)       ;B4C3AE
    %AICMD0x02_FreezeTime()                                    ;B4C3B3
    %AICMD0x03_SetHour($07)                                    ;B4C3B4
    %AICMD0x05_SetTransferPosition(296, 536)                   ;B4C3B6
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B4C3BB
    %AICMD0x09_StartScript($01, pAIScripting0x28_L078)                                   ;B4C3BD
    %AICMD0x09_StartScript($02, pAIScripting0x28_L098)                                   ;B4C3C1
    %AICMD0x09_StartScript($03, pAIScripting0x28_L107)                                   ;B4C3C5
    %AICMD0x09_StartScript($04, pAIScripting0x28_L116)                                   ;B4C3C9
    %AICMD0x09_StartScript($05, pAIScripting0x28_L124)                                   ;B4C3CD
    %AICMD0x09_StartScript($06, pAIScripting0x28_L134)                                   ;B4C3D1
    %AICMD0x09_StartScript($07, pAIScripting0x28_L148)                                   ;B4C3D5
    %AICMD0x09_StartScript($08, pAIScripting0x28_L162)                                   ;B4C3D9
    %AICMD0x08_EnableAIControl()                               ;B4C3DD
    %AICMD0x13_Wait(1)                                         ;B4C3DE
    %AICMD0x06_SetDestinationArea(!AREA_EGGFESTIVAL)           ;B4C3E1
    %AICMD0x38_WaitForFadeIn()                                               ;B4C3E3
    %AICMD0x13_Wait(1)                                         ;B4C3E4
    %AICMD0x15_JumpIfEquals8($8009A2, 3, pAIScripting0x28_L169)              ;B4C3E7
    %AICMD0x15_JumpIfEquals8($8009A2, 4, pAIScripting0x28_L169)              ;B4C3EE
    %AICMD0x15_JumpIfEquals8($8009A2, 5, pAIScripting0x28_L169)              ;B4C3F5
    %AICMD0x1C_ShowDialog($038F, $00)                          ;B4C3FC
    %AICMD0x12_Jump(pAIScripting0x28_L170)                                   ;B4C400
pAIScripting0x28_L169:
    %AICMD0x1C_ShowDialog($02EA, $00)                          ;B4C403
    %AICMD0x41_AddValue16(nPlayerHappiness, 30)                ;B4C407
    %AICMD0x09_StartScript($09, pAIScripting0x28_L088)                                   ;B4C40D
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B4C411
pAIScripting0x28_L170:
    %AICMD0x13_Wait(1)                                         ;B4C413
    %AICMD0x1C_ShowDialog($02EC, $00)                          ;B4C416
    %AICMD0x13_Wait(1)                                         ;B4C41A
    %AICMD0x1C_ShowDialog($02ED, $00)                          ;B4C41D
    %AICMD0x11_EnableUserControl()                             ;B4C421
    %AICMD0x13_Wait(650)                                       ;B4C422
    %AICMD0x3C()                                               ;B4C425
    %AICMD0x10_End()                                           ;B4C426


pAIScripting0x29:
    dw DATA8_B4C447                                            ;B4C427|        |B4C447;
    dw pAIScripting0x2A                                        ;B4C429|        |B4C4B8;
    dw pAIScripting0x2A                                        ;B4C42B|        |B4C4B8;
    dw pAIScripting0x2A                                        ;B4C42D|        |B4C4B8;
    dw pAIScripting0x2A                                        ;B4C42F|        |B4C4B8;
    dw pAIScripting0x2A                                        ;B4C431|        |B4C4B8;
    dw pAIScripting0x2A                                        ;B4C433|        |B4C4B8;
    dw pAIScripting0x2A                                        ;B4C435|        |B4C4B8;
    dw pAIScripting0x2A                                        ;B4C437|        |B4C4B8;
    dw pAIScripting0x2A                                        ;B4C439|        |B4C4B8;
    dw pAIScripting0x2A                                        ;B4C43B|        |B4C4B8;
    dw pAIScripting0x2A                                        ;B4C43D|        |B4C4B8;
    dw pAIScripting0x2A                                        ;B4C43F|        |B4C4B8;
    dw pAIScripting0x2A                                        ;B4C441|        |B4C4B8;
    dw pAIScripting0x2A                                        ;B4C443|        |B4C4B8;
    dw pAIScripting0x2A                                        ;B4C445|        |B4C4B8;
 
DATA8_B4C447:
    %AICMD0x09_StartScript($01, pAIScripting0x29_L001)                                   ;B4C447
    %AICMD0x38_WaitForFadeIn()                                               ;B4C44B
    %AICMD0x10_End()                                           ;B4C44C
pAIScripting0x29_L001:
    %AICMD0x15_JumpIfEquals8(nCurrentTimeID, 18, pAIScripting0x29_L008)      ;B4C44D
    %AICMD0x1A($0068, $01A8, aAIScriptingData_L055, $02)                     ;B4C454
pAIScripting0x29_L002:
    %AICMD0x2D_JumpOnInteract(pAIScripting0x29_L004, pAIScripting0x29_L003)                               ;B4C45C
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 18, 24, pAIScripting0x29_L005) ;B4C461
    %AICMD0x12_Jump(pAIScripting0x29_L002)                                   ;B4C469
pAIScripting0x29_L003:
    %AICMD0x15_JumpIfEquals8($80091E, 20, pAIScripting0x29_L006)             ;B4C46C
    %AICMD0x1C_ShowDialog($041B, $00)                          ;B4C473
    %AICMD0x12_Jump(pAIScripting0x29_L002)                                   ;B4C477
pAIScripting0x29_L004:
    %AICMD0x1C_ShowDialog($0418, $00)                          ;B4C47A
    %AICMD0x12_Jump(pAIScripting0x29_L002)                                   ;B4C47E
pAIScripting0x29_L005:
    %AICMD0x1C_ShowDialog($0419, $00)                          ;B4C481
    %AICMD0x41_AddValue16(nPlayerHappiness, -5)                ;B4C485
    %AICMD0x12_Jump(pAIScripting0x29_L007)                                   ;B4C48B
pAIScripting0x29_L006:
    %AICMD0x1C_ShowDialog($041A, $00)                          ;B4C48E
    %AICMD0x42_AddValue24(nMoney, 2)                           ;B4C492
    %AICMD0x41_AddValue16(nPlayerHappiness, 30)                ;B4C499
    %AICMD0x12_Jump(pAIScripting0x29_L007)                                   ;B4C49F
pAIScripting0x29_L007:
    %AICMD0x23_OrWithIndexedValue(strcFlags.event4, $0B)       ;B4C4A2
    %AICMD0x28_ClearBit(strcFlags.event4, $0A)                          ;B4C4A7
    %AICMD0x1B($02B6, $00)                                     ;B4C4AC
    %AICMD0x0D($FF, $00, $60, $01)                             ;B4C4B0
    %AICMD0x37()                                               ;B4C4B5
    %AICMD0x10_End()                                           ;B4C4B6
pAIScripting0x29_L008:
    %AICMD0x10_End()                                           ;B4C4B7


pAIScripting0x2A:
    dw DATA8_B4C4D8                                            ;B4C4B8|        |B4C4D8;
    dw pAIScripting0x2B                                        ;B4C4BA|        |B4C504;
    dw pAIScripting0x2B                                        ;B4C4BC|        |B4C504;
    dw pAIScripting0x2B                                        ;B4C4BE|        |B4C504;
    dw pAIScripting0x2B                                        ;B4C4C0|        |B4C504;
    dw pAIScripting0x2B                                        ;B4C4C2|        |B4C504;
    dw pAIScripting0x2B                                        ;B4C4C4|        |B4C504;
    dw pAIScripting0x2B                                        ;B4C4C6|        |B4C504;
    dw pAIScripting0x2B                                        ;B4C4C8|        |B4C504;
    dw pAIScripting0x2B                                        ;B4C4CA|        |B4C504;
    dw pAIScripting0x2B                                        ;B4C4CC|        |B4C504;
    dw pAIScripting0x2B                                        ;B4C4CE|        |B4C504;
    dw pAIScripting0x2B                                        ;B4C4D0|        |B4C504;
    dw pAIScripting0x2B                                        ;B4C4D2|        |B4C504;
    dw pAIScripting0x2B                                        ;B4C4D4|        |B4C504;
    dw pAIScripting0x2B                                        ;B4C4D6|        |B4C504;
 
DATA8_B4C4D8:
    %AICMD0x1A($0218, $0078, aAIScriptingData_L133, $00)                     ;B4C4D8
    %AICMD0x13_Wait(1)                                         ;B4C4E0
    %AICMD0x1B($0305, $01)                                     ;B4C4E3
    %AICMD0x0D($01, $00, $50, $01)                             ;B4C4E7
    %AICMD0x1B($0304, $01)                                     ;B4C4EC
    %AICMD0x13_Wait(60)                                        ;B4C4F0
    %AICMD0x1B($0305, $01)                                     ;B4C4F3
    %AICMD0x0D($02, $00, $80, $01)                             ;B4C4F7
    %AICMD0x37()                                               ;B4C4FC
    %AICMD0x41_AddValue16(nPlayerHappiness, 10)                ;B4C4FD
    %AICMD0x10_End()                                           ;B4C503


pAIScripting0x2B:
    dw DATA8_B4C524                                            ;B4C504|        |B4C524;
    dw pAIScripting0x2C                                        ;B4C506|        |B4C548;
    dw pAIScripting0x2C                                        ;B4C508|        |B4C548;
    dw pAIScripting0x2C                                        ;B4C50A|        |B4C548;
    dw pAIScripting0x2C                                        ;B4C50C|        |B4C548;
    dw pAIScripting0x2C                                        ;B4C50E|        |B4C548;
    dw pAIScripting0x2C                                        ;B4C510|        |B4C548;
    dw pAIScripting0x2C                                        ;B4C512|        |B4C548;
    dw pAIScripting0x2C                                        ;B4C514|        |B4C548;
    dw pAIScripting0x2C                                        ;B4C516|        |B4C548;
    dw pAIScripting0x2C                                        ;B4C518|        |B4C548;
    dw pAIScripting0x2C                                        ;B4C51A|        |B4C548;
    dw pAIScripting0x2C                                        ;B4C51C|        |B4C548;
    dw pAIScripting0x2C                                        ;B4C51E|        |B4C548;
    dw pAIScripting0x2C                                        ;B4C520|        |B4C548;
    dw pAIScripting0x2C                                        ;B4C522|        |B4C548;
 
DATA8_B4C524:
    %AICMD0x1A($0088, $0098, aAIScriptingData_L132, $00)                     ;B4C524
    %AICMD0x13_Wait(1)                                         ;B4C52C
    %AICMD0x1B($0303, $00)                                     ;B4C52F
    %AICMD0x0D($FF, $00, $30, $01)                             ;B4C533
    %AICMD0x13_Wait(60)                                        ;B4C538
    %AICMD0x0D($FF, $00, $50, $01)                             ;B4C53B
    %AICMD0x37()                                               ;B4C540
    %AICMD0x41_AddValue16(nPlayerHappiness, 10)                ;B4C541
    %AICMD0x10_End()                                           ;B4C547


pAIScripting0x2C:
    dw DATA8_B4C568                                            ;B4C548|        |B4C568;
    dw pAIScripting0x2D                                        ;B4C54A|        |B4C584;
    dw pAIScripting0x2D                                        ;B4C54C|        |B4C584;
    dw pAIScripting0x2D                                        ;B4C54E|        |B4C584;
    dw pAIScripting0x2D                                        ;B4C550|        |B4C584;
    dw pAIScripting0x2D                                        ;B4C552|        |B4C584;
    dw pAIScripting0x2D                                        ;B4C554|        |B4C584;
    dw pAIScripting0x2D                                        ;B4C556|        |B4C584;
    dw pAIScripting0x2D                                        ;B4C558|        |B4C584;
    dw pAIScripting0x2D                                        ;B4C55A|        |B4C584;
    dw pAIScripting0x2D                                        ;B4C55C|        |B4C584;
    dw pAIScripting0x2D                                        ;B4C55E|        |B4C584;
    dw pAIScripting0x2D                                        ;B4C560|        |B4C584;
    dw pAIScripting0x2D                                        ;B4C562|        |B4C584;
    dw pAIScripting0x2D                                        ;B4C564|        |B4C584;
    dw pAIScripting0x2D                                        ;B4C566|        |B4C584;
 
DATA8_B4C568:
    %AICMD0x1A($0228, $0258, aAIScriptingData_L134, $00)                     ;B4C568
    %AICMD0x13_Wait(60)                                        ;B4C570
    %AICMD0x1B($0307, $01)                                     ;B4C573
    %AICMD0x0D($01, $00, $FF, $01)                             ;B4C577
    %AICMD0x37()                                               ;B4C57C
    %AICMD0x41_AddValue16(nPlayerHappiness, 10)                ;B4C57D
    %AICMD0x10_End()                                           ;B4C583


pAIScripting0x2D:
    dw DATA8_B4C5A4                                            ;B4C584|        |B4C5A4;
    dw pAIScripting0x2E                                        ;B4C586|        |B4C5F4;
    dw pAIScripting0x2E                                        ;B4C588|        |B4C5F4;
    dw pAIScripting0x2E                                        ;B4C58A|        |B4C5F4;
    dw pAIScripting0x2E                                        ;B4C58C|        |B4C5F4;
    dw pAIScripting0x2E                                        ;B4C58E|        |B4C5F4;
    dw pAIScripting0x2E                                        ;B4C590|        |B4C5F4;
    dw pAIScripting0x2E                                        ;B4C592|        |B4C5F4;
    dw pAIScripting0x2E                                        ;B4C594|        |B4C5F4;
    dw pAIScripting0x2E                                        ;B4C596|        |B4C5F4;
    dw pAIScripting0x2E                                        ;B4C598|        |B4C5F4;
    dw pAIScripting0x2E                                        ;B4C59A|        |B4C5F4;
    dw pAIScripting0x2E                                        ;B4C59C|        |B4C5F4;
    dw pAIScripting0x2E                                        ;B4C59E|        |B4C5F4;
    dw pAIScripting0x2E                                        ;B4C5A0|        |B4C5F4;
    dw pAIScripting0x2E                                        ;B4C5A2|        |B4C5F4;
 
DATA8_B4C5A4:
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B4C5A4
    %AICMD0x09_StartScript($01, pAIScripting0x2D_L002)                                   ;B4C5A6
    %AICMD0x11_EnableUserControl()                             ;B4C5AA
    %AICMD0x38_WaitForFadeIn()                                               ;B4C5AB
pAIScripting0x2D_L001:
    %AICMD0x13_Wait(1)                                         ;B4C5AC
    %AICMD0x12_Jump(pAIScripting0x2D_L001)                                   ;B4C5AF
pAIScripting0x2D_L002:
    %AICMD0x1A($0108, $001A, aAIScriptingData_L083, $00)                     ;B4C5B2
pAIScripting0x2D_L003:
    %AICMD0x0D($01, $00, $08, $01)                             ;B4C5BA
    %AICMD0x0D($00, $FF, $06, $01)                             ;B4C5BF
    %AICMD0x0D($FF, $00, $08, $02)                             ;B4C5C4
    %AICMD0x0D($FF, $01, $04, $01)                             ;B4C5C9
    %AICMD0x0D($01, $00, $0C, $02)                             ;B4C5CE
    %AICMD0x0D($FF, $00, $06, $01)                             ;B4C5D3
    %AICMD0x0D($00, $FF, $10, $02)                             ;B4C5D8
    %AICMD0x0D($FF, $01, $04, $01)                             ;B4C5DD
    %AICMD0x0D($01, $01, $0C, $02)                             ;B4C5E2
    %AICMD0x0D($01, $00, $08, $02)                             ;B4C5E7
    %AICMD0x0D($00, $FF, $06, $01)                             ;B4C5EC
    %AICMD0x12_Jump(pAIScripting0x2D_L003)                                   ;B4C5F1


pAIScripting0x2E:
    dw DATA8_B4C614                                            ;B4C5F4|        |B4C614;
    dw pAIScripting0x2F                                        ;B4C5F6|        |B4C6F1;
    dw pAIScripting0x2F                                        ;B4C5F8|        |B4C6F1;
    dw pAIScripting0x2F                                        ;B4C5FA|        |B4C6F1;
    dw pAIScripting0x2F                                        ;B4C5FC|        |B4C6F1;
    dw pAIScripting0x2F                                        ;B4C5FE|        |B4C6F1;
    dw pAIScripting0x2F                                        ;B4C600|        |B4C6F1;
    dw pAIScripting0x2F                                        ;B4C602|        |B4C6F1;
    dw pAIScripting0x2F                                        ;B4C604|        |B4C6F1;
    dw pAIScripting0x2F                                        ;B4C606|        |B4C6F1;
    dw pAIScripting0x2F                                        ;B4C608|        |B4C6F1;
    dw pAIScripting0x2F                                        ;B4C60A|        |B4C6F1;
    dw pAIScripting0x2F                                        ;B4C60C|        |B4C6F1;
    dw pAIScripting0x2F                                        ;B4C60E|        |B4C6F1;
    dw pAIScripting0x2F                                        ;B4C610|        |B4C6F1;
    dw pAIScripting0x2F                                        ;B4C612|        |B4C6F1;
 
DATA8_B4C614:
    %AICMD0x00_SetMusic($01, $B4)                              ;B4C614
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily3, $02)       ;B4C617
    %AICMD0x05_SetTransferPosition(136, 120)                   ;B4C61C
    %AICMD0x02_FreezeTime()                                    ;B4C621
    %AICMD0x03_SetHour($07)                                    ;B4C622
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4C624
    %AICMD0x08_EnableAIControl()                               ;B4C626
    %AICMD0x09_StartScript($01, pAIScripting0x2E_L007)                                   ;B4C627
    %AICMD0x09_StartScript($02, pAIScripting0x2E_L006)                                   ;B4C62B
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $00, pAIScripting0x2E_L001)   ;B4C62F
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $01, pAIScripting0x2E_L001)   ;B4C636
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, pAIScripting0x2E_L001)   ;B4C63D
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $03, pAIScripting0x2E_L001)   ;B4C644
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $04, pAIScripting0x2E_L001)   ;B4C64B
    %AICMD0x12_Jump(pAIScripting0x2E_L002)                                   ;B4C652
pAIScripting0x2E_L001:
    %AICMD0x09_StartScript($03, pAIScripting0x2E_L008)                                   ;B4C655
pAIScripting0x2E_L002:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $07, pAIScripting0x2E_L004)   ;B4C659
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $06, pAIScripting0x2E_L003)   ;B4C660
    %AICMD0x06_SetDestinationArea(!AREA_HOUSE1)                ;B4C667
    %AICMD0x12_Jump(pAIScripting0x2E_L005)                                   ;B4C669
pAIScripting0x2E_L003:
    %AICMD0x06_SetDestinationArea(!AREA_HOUSE2)                ;B4C66C
    %AICMD0x12_Jump(pAIScripting0x2E_L005)                                   ;B4C66E
pAIScripting0x2E_L004:
    %AICMD0x06_SetDestinationArea(!AREA_HOUSE3)                ;B4C671
    %AICMD0x12_Jump(pAIScripting0x2E_L005)                                   ;B4C673
pAIScripting0x2E_L005:
    %AICMD0x38_WaitForFadeIn()                                               ;B4C676
    %AICMD0x13_Wait(90)                                        ;B4C677
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 32)                  ;B4C67A
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 64)                  ;B4C67E
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4C682
    %AICMD0x0B_SetScriptFlag($00)                                            ;B4C684
    %AICMD0x13_Wait(90)                                        ;B4C686
    %AICMD0x0C_WaitForScriptFlag($02)                                            ;B4C689
    %AICMD0x13_Wait(60)                                        ;B4C68B
    %AICMD0x3D_TeleportToArea(!AREA_ENDING00)                  ;B4C68E
    %AICMD0x10_End()                                           ;B4C690
pAIScripting0x2E_L006:
    %AICMD0x1A($0088, $00B8, aAIScriptingData_L069, $03)                     ;B4C691
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B4C699
    %AICMD0x13_Wait(30)                                        ;B4C69B
    %AICMD0x1B($02DC, $00)                                     ;B4C69E
    %AICMD0x0D($FF, $00, $10, $01)                             ;B4C6A2
    %AICMD0x1B($02DE, $00)                                     ;B4C6A7
    %AICMD0x13_Wait(120)                                       ;B4C6AB
    %AICMD0x0B_SetScriptFlag($02)                                            ;B4C6AE
    %AICMD0x10_End()                                           ;B4C6B0
pAIScripting0x2E_L007:
    %AICMD0x1A($0078, $00B8, aAIScriptingData_L070, $02)                     ;B4C6B1
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B4C6B9
    %AICMD0x1B($02E0, $00)                                     ;B4C6BB
    %AICMD0x13_Wait(120)                                       ;B4C6BF
    %AICMD0x1B($02DF, $00)                                     ;B4C6C2
    %AICMD0x0D($00, $01, $10, $01)                             ;B4C6C6
    %AICMD0x13_Wait(20)                                        ;B4C6CB
    %AICMD0x0B_SetScriptFlag($01)                                            ;B4C6CE
    %AICMD0x1B($02E0, $00)                                     ;B4C6D0
    %AICMD0x13_Wait(120)                                       ;B4C6D4
    %AICMD0x10_End()                                           ;B4C6D7
pAIScripting0x2E_L008:
    %AICMD0x1A($00A8, $0078, aAIScriptingData_L073, $00)                     ;B4C6D8
pAIScripting0x2E_L009:
    %AICMD0x1B($02E7, $00)                                     ;B4C6E0
    %AICMD0x13_Wait(120)                                       ;B4C6E4
    %AICMD0x1B($02E3, $00)                                     ;B4C6E7
    %AICMD0x13_Wait(240)                                       ;B4C6EB
    %AICMD0x12_Jump(pAIScripting0x2E_L009)                                   ;B4C6EE


pAIScripting0x2F:
    dw DATA8_B4C711                                            ;B4C6F1|        |B4C711;
    dw pAIScripting0x30                                        ;B4C6F3|        |B4C7C3;
    dw pAIScripting0x30                                        ;B4C6F5|        |B4C7C3;
    dw pAIScripting0x30                                        ;B4C6F7|        |B4C7C3;
    dw pAIScripting0x30                                        ;B4C6F9|        |B4C7C3;
    dw pAIScripting0x30                                        ;B4C6FB|        |B4C7C3;
    dw pAIScripting0x30                                        ;B4C6FD|        |B4C7C3;
    dw pAIScripting0x30                                        ;B4C6FF|        |B4C7C3;
    dw pAIScripting0x30                                        ;B4C701|        |B4C7C3;
    dw pAIScripting0x30                                        ;B4C703|        |B4C7C3;
    dw pAIScripting0x30                                        ;B4C705|        |B4C7C3;
    dw pAIScripting0x30                                        ;B4C707|        |B4C7C3;
    dw pAIScripting0x30                                        ;B4C709|        |B4C7C3;
    dw pAIScripting0x30                                        ;B4C70B|        |B4C7C3;
    dw pAIScripting0x30                                        ;B4C70D|        |B4C7C3;
    dw pAIScripting0x30                                        ;B4C70F|        |B4C7C3;
 
DATA8_B4C711:
    %AICMD0x00_SetMusic($11, $B4)                              ;B4C711
    %AICMD0x02_FreezeTime()                                    ;B4C714
    %AICMD0x03_SetHour($06)                                    ;B4C715
    %AICMD0x05_SetTransferPosition(136, 344)                   ;B4C717
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4C71C
    %AICMD0x08_EnableAIControl()                               ;B4C71E
    %AICMD0x09_StartScript($01, pAIScripting0x2F_L001)                                   ;B4C71F
    %AICMD0x06_SetDestinationArea(!AREA_FARMSUMMER)            ;B4C723
    %AICMD0x38_WaitForFadeIn()                                               ;B4C725
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 32)                  ;B4C726
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B4C72A
    %AICMD0x13_Wait(90)                                        ;B4C72C
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4C72F
    %AICMD0x13_Wait(120)                                       ;B4C731
    %AICMD0x0B_SetScriptFlag($00)                                            ;B4C734
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B4C736
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 48)                  ;B4C738
    %AICMD0x40_DisableTileInteractions()                       ;B4C73C
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 68)                  ;B4C73D
    %AICMD0x13_Wait(70)                                        ;B4C741
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 44)                   ;B4C744
    %AICMD0x0B_SetScriptFlag($02)                                            ;B4C748
    %AICMD0x0C_WaitForScriptFlag($03)                                            ;B4C74A
    %AICMD0x3D_TeleportToArea(!AREA_ENDING00)                  ;B4C74C
    %AICMD0x10_End()                                           ;B4C74E
pAIScripting0x2F_L001:
    %AICMD0x1A($0110, $0178, aAIScriptingData_L004, $00)                     ;B4C74F
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B4C757
    %AICMD0x1B($01EC, $00)                                     ;B4C759
    %AICMD0x0D($FF, $00, $78, $01)                             ;B4C75D
    %AICMD0x13_Wait(60)                                        ;B4C762
    %AICMD0x1B($01F2, $00)                                     ;B4C765
    %AICMD0x0B_SetScriptFlag($01)                                            ;B4C769
    %AICMD0x0C_WaitForScriptFlag($02)                                            ;B4C76B
    %AICMD0x1B($01E9, $00)                                     ;B4C76D
    %AICMD0x0D($FF, $00, $40, $02)                             ;B4C771
    %AICMD0x1B($01DD, $00)                                     ;B4C776
    %AICMD0x13_Wait(60)                                        ;B4C77A
    %AICMD0x1B($01DA, $00)                                     ;B4C77D
    %AICMD0x0D($00, $01, $60, $02)                             ;B4C781
    %AICMD0x1B($01F2, $00)                                     ;B4C786
    %AICMD0x13_Wait(60)                                        ;B4C78A
    %AICMD0x1B($01E9, $00)                                     ;B4C78D
    %AICMD0x0D($FF, $00, $40, $02)                             ;B4C791
    %AICMD0x1B($01F2, $01)                                     ;B4C796
    %AICMD0x13_Wait(120)                                       ;B4C79A
    %AICMD0x1B($01E9, $01)                                     ;B4C79D
    %AICMD0x0D($01, $00, $20, $02)                             ;B4C7A1
    %AICMD0x1B($01E4, $00)                                     ;B4C7A6
    %AICMD0x13_Wait(60)                                        ;B4C7AA
    %AICMD0x1B($01EA, $01)                                     ;B4C7AD
    %AICMD0x13_Wait(80)                                        ;B4C7B1
    %AICMD0x1B($01EB, $01)                                     ;B4C7B4
    %AICMD0x13_Wait(180)                                       ;B4C7B8
    %AICMD0x0B_SetScriptFlag($03)                                            ;B4C7BB
pAIScripting0x2F_L002:
    %AICMD0x13_Wait(1)                                         ;B4C7BD
    %AICMD0x12_Jump(pAIScripting0x2F_L002)                                   ;B4C7C0


pAIScripting0x30:
    dw DATA8_B4C7E3                                            ;B4C7C3|        |B4C7E3;
    dw pAIScripting0x31                                        ;B4C7C5|        |B4C9F9;
    dw pAIScripting0x31                                        ;B4C7C7|        |B4C9F9;
    dw pAIScripting0x31                                        ;B4C7C9|        |B4C9F9;
    dw pAIScripting0x31                                        ;B4C7CB|        |B4C9F9;
    dw pAIScripting0x31                                        ;B4C7CD|        |B4C9F9;
    dw pAIScripting0x31                                        ;B4C7CF|        |B4C9F9;
    dw pAIScripting0x31                                        ;B4C7D1|        |B4C9F9;
    dw pAIScripting0x31                                        ;B4C7D3|        |B4C9F9;
    dw pAIScripting0x31                                        ;B4C7D5|        |B4C9F9;
    dw pAIScripting0x31                                        ;B4C7D7|        |B4C9F9;
    dw pAIScripting0x31                                        ;B4C7D9|        |B4C9F9;
    dw pAIScripting0x31                                        ;B4C7DB|        |B4C9F9;
    dw pAIScripting0x31                                        ;B4C7DD|        |B4C9F9;
    dw pAIScripting0x31                                        ;B4C7DF|        |B4C9F9;
    dw pAIScripting0x31                                        ;B4C7E1|        |B4C9F9;
 
DATA8_B4C7E3:
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


pAIScripting0x31:
    dw DATA8_B4CA19                                            ;B4C9F9|        |B4CA19;
    dw pAIScripting0x32                                        ;B4C9FB|        |B4CB3F;
    dw pAIScripting0x32                                        ;B4C9FD|        |B4CB3F;
    dw pAIScripting0x32                                        ;B4C9FF|        |B4CB3F;
    dw pAIScripting0x32                                        ;B4CA01|        |B4CB3F;
    dw pAIScripting0x32                                        ;B4CA03|        |B4CB3F;
    dw pAIScripting0x32                                        ;B4CA05|        |B4CB3F;
    dw pAIScripting0x32                                        ;B4CA07|        |B4CB3F;
    dw pAIScripting0x32                                        ;B4CA09|        |B4CB3F;
    dw pAIScripting0x32                                        ;B4CA0B|        |B4CB3F;
    dw pAIScripting0x32                                        ;B4CA0D|        |B4CB3F;
    dw pAIScripting0x32                                        ;B4CA0F|        |B4CB3F;
    dw pAIScripting0x32                                        ;B4CA11|        |B4CB3F;
    dw pAIScripting0x32                                        ;B4CA13|        |B4CB3F;
    dw pAIScripting0x32                                        ;B4CA15|        |B4CB3F;
    dw pAIScripting0x32                                        ;B4CA17|        |B4CB3F;
 
DATA8_B4CA19:
    %AICMD0x00_SetMusic($10, $B4)                              ;B4CA19
    %AICMD0x05_SetTransferPosition(65520, 104)                 ;B4CA1C
    %AICMD0x02_FreezeTime()                                    ;B4CA21
    %AICMD0x03_SetHour($06)                                    ;B4CA22
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4CA24
    %AICMD0x40_DisableTileInteractions()                       ;B4CA26
    %AICMD0x08_EnableAIControl()                               ;B4CA27
    %AICMD0x09_StartScript($01, pAIScripting0x31_L001)                                   ;B4CA28
    %AICMD0x09_StartScript($02, pAIScripting0x31_L003)                                   ;B4CA2C
    %AICMD0x09_StartScript($03, pAIScripting0x31_L005)                                   ;B4CA30
    %AICMD0x09_StartScript($04, pAIScripting0x31_L007)                                   ;B4CA34
    %AICMD0x06_SetDestinationArea(!AREA_ENDING06)              ;B4CA38
    %AICMD0x38_WaitForFadeIn()                                               ;B4CA3A
    %AICMD0x13_Wait(120)                                       ;B4CA3B
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 120)                ;B4CA3E
    %AICMD0x13_Wait(30)                                        ;B4CA42
    %AICMD0x19($007A, $01)                                     ;B4CA45
    %AICMD0x13_Wait(90)                                        ;B4CA49
    %AICMD0x3E_SetCarryItem($16)                               ;B4CA4C
    %AICMD0x0B_SetScriptFlag($00)                                            ;B4CA4E
    %AICMD0x13_Wait(90)                                        ;B4CA50
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4CA53
    %AICMD0x13_Wait(30)                                        ;B4CA55
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 16)                  ;B4CA58
    %AICMD0x13_Wait(60)                                        ;B4CA5C
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 128)                 ;B4CA5F
    %AICMD0x3F_ThrowCarriedItem()                              ;B4CA63
    %AICMD0x13_Wait(180)                                       ;B4CA64
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 144)                ;B4CA67
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B4CA6B
    %AICMD0x13_Wait(30)                                        ;B4CA6D
    %AICMD0x19($0065, $00)                                     ;B4CA70
    %AICMD0x13_Wait(90)                                        ;B4CA74
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 16)                  ;B4CA77
    %AICMD0x13_Wait(10)                                        ;B4CA7B
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 16)                    ;B4CA7E
    %AICMD0x13_Wait(10)                                        ;B4CA82
    %AICMD0x19($0066, $01)                                     ;B4CA85
    %AICMD0x13_Wait(90)                                        ;B4CA89
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4CA8C
    %AICMD0x0B_SetScriptFlag($01)                                            ;B4CA8E
    %AICMD0x13_Wait(90)                                        ;B4CA90
    %AICMD0x0C_WaitForScriptFlag($02)                                            ;B4CA93
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 16)                  ;B4CA95
    %AICMD0x13_Wait(30)                                        ;B4CA99
    %AICMD0x19($003D, $00)                                     ;B4CA9C
    %AICMD0x13_Wait(300)                                       ;B4CAA0
    %AICMD0x3D_TeleportToArea(!AREA_ENDING00)                  ;B4CAA3
    %AICMD0x10_End()                                           ;B4CAA5
pAIScripting0x31_L001:
    %AICMD0x1A($FFF0, $0088, aAIScriptingData_L004, $02)                     ;B4CAA6
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B4CAAE
    %AICMD0x1B($01EC, $01)                                     ;B4CAB0
    %AICMD0x0D($01, $00, $58, $01)                             ;B4CAB4
    %AICMD0x13_Wait(90)                                        ;B4CAB9
    %AICMD0x1B($01F8, $01)                                     ;B4CABC
    %AICMD0x13_Wait(120)                                       ;B4CAC0
    %AICMD0x1B($01E9, $01)                                     ;B4CAC3
    %AICMD0x0D($01, $00, $10, $01)                             ;B4CAC7
    %AICMD0x13_Wait(60)                                        ;B4CACC
pAIScripting0x31_L002:
    %AICMD0x1B($01EA, $01)                                     ;B4CACF
    %AICMD0x13_Wait(180)                                       ;B4CAD3
    %AICMD0x1B($01EB, $01)                                     ;B4CAD6
    %AICMD0x13_Wait(90)                                        ;B4CADA
    %AICMD0x12_Jump(pAIScripting0x31_L002)                                   ;B4CADD
pAIScripting0x31_L003:
    %AICMD0x1A($0078, $006C, aAIScriptingData_L150, $02)                     ;B4CAE0
    %AICMD0x13_Wait(540)                                       ;B4CAE8
    %AICMD0x1B($0190, $01)                                     ;B4CAEB
    %AICMD0x13_Wait(180)                                       ;B4CAEF
    %AICMD0x1B($0194, $01)                                     ;B4CAF2
    %AICMD0x13_Wait(180)                                       ;B4CAF6
    %AICMD0x1B($0193, $01)                                     ;B4CAF9
    %AICMD0x13_Wait(180)                                       ;B4CAFD
    %AICMD0x1B($018C, $01)                                     ;B4CB00
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B4CB04
    %AICMD0x1B($0191, $01)                                     ;B4CB06
    %AICMD0x13_Wait(180)                                       ;B4CB0A
    %AICMD0x0B_SetScriptFlag($02)                                            ;B4CB0D
pAIScripting0x31_L004:
    %AICMD0x13_Wait(1)                                         ;B4CB0F
    %AICMD0x12_Jump(pAIScripting0x31_L004)                                   ;B4CB12
pAIScripting0x31_L005:
    %AICMD0x1A($00A0, $0088, aAIScriptingData_L008, $00)                     ;B4CB15
    %AICMD0x22($18, $18, $01, aAIScriptingData_L008, $0C)                    ;B4CB1D
pAIScripting0x31_L006:
    %AICMD0x13_Wait(1)                                         ;B4CB24
    %AICMD0x12_Jump(pAIScripting0x31_L006)                                   ;B4CB27
pAIScripting0x31_L007:
    %AICMD0x1A($0098, $00A8, aAIScriptingData_L009, $00)                     ;B4CB2A
    %AICMD0x22($18, $18, $01, aAIScriptingData_L009, $0C)                    ;B4CB32
pAIScripting0x31_L008:
    %AICMD0x13_Wait(1)                                         ;B4CB39
    %AICMD0x12_Jump(pAIScripting0x31_L008)                                   ;B4CB3C


pAIScripting0x32:
    dw DATA8_B4CB5F                                            ;B4CB3F|        |B4CB5F;
    dw pAIScripting0x33                                        ;B4CB41|        |B4CD56;
    dw pAIScripting0x33                                        ;B4CB43|        |B4CD56;
    dw pAIScripting0x33                                        ;B4CB45|        |B4CD56;
    dw pAIScripting0x33                                        ;B4CB47|        |B4CD56;
    dw pAIScripting0x33                                        ;B4CB49|        |B4CD56;
    dw pAIScripting0x33                                        ;B4CB4B|        |B4CD56;
    dw pAIScripting0x33                                        ;B4CB4D|        |B4CD56;
    dw pAIScripting0x33                                        ;B4CB4F|        |B4CD56;
    dw pAIScripting0x33                                        ;B4CB51|        |B4CD56;
    dw pAIScripting0x33                                        ;B4CB53|        |B4CD56;
    dw pAIScripting0x33                                        ;B4CB55|        |B4CD56;
    dw pAIScripting0x33                                        ;B4CB57|        |B4CD56;
    dw pAIScripting0x33                                        ;B4CB59|        |B4CD56;
    dw pAIScripting0x33                                        ;B4CB5B|        |B4CD56;
    dw pAIScripting0x33                                        ;B4CB5D|        |B4CD56;
 
DATA8_B4CB5F:
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


pAIScripting0x33:
    dw DATA8_B4CD76                                            ;B4CD56|        |B4CD76;
    dw pAIScripting0x34                                        ;B4CD58|        |B4CECA;
    dw pAIScripting0x34                                        ;B4CD5A|        |B4CECA;
    dw pAIScripting0x34                                        ;B4CD5C|        |B4CECA;
    dw pAIScripting0x34                                        ;B4CD5E|        |B4CECA;
    dw pAIScripting0x34                                        ;B4CD60|        |B4CECA;
    dw pAIScripting0x34                                        ;B4CD62|        |B4CECA;
    dw pAIScripting0x34                                        ;B4CD64|        |B4CECA;
    dw pAIScripting0x34                                        ;B4CD66|        |B4CECA;
    dw pAIScripting0x34                                        ;B4CD68|        |B4CECA;
    dw pAIScripting0x34                                        ;B4CD6A|        |B4CECA;
    dw pAIScripting0x34                                        ;B4CD6C|        |B4CECA;
    dw pAIScripting0x34                                        ;B4CD6E|        |B4CECA;
    dw pAIScripting0x34                                        ;B4CD70|        |B4CECA;
    dw pAIScripting0x34                                        ;B4CD72|        |B4CECA;
    dw pAIScripting0x34                                        ;B4CD74|        |B4CECA;
 
DATA8_B4CD76:
    %AICMD0x00_SetMusic($10, $B4)                              ;B4CD76
    %AICMD0x02_FreezeTime()                                    ;B4CD79
    %AICMD0x03_SetHour($06)                                    ;B4CD7A
    %AICMD0x05_SetTransferPosition(65512, 120)                 ;B4CD7C
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4CD81
    %AICMD0x40_DisableTileInteractions()                       ;B4CD83
    %AICMD0x08_EnableAIControl()                               ;B4CD84
    %AICMD0x09_StartScript($01, pAIScripting0x33_L003)                                   ;B4CD85
    %AICMD0x09_StartScript($02, pAIScripting0x33_L005)                                   ;B4CD89
    %AICMD0x09_StartScript($03, pAIScripting0x33_L007)                                   ;B4CD8D
    %AICMD0x09_StartScript($04, pAIScripting0x33_L009)                                   ;B4CD91
    %AICMD0x06_SetDestinationArea(!AREA_ENDING06)              ;B4CD95
    %AICMD0x38_WaitForFadeIn()                                               ;B4CD97
    %AICMD0x13_Wait(120)                                       ;B4CD98
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 144)                ;B4CD9B
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B4CD9F
    %AICMD0x13_Wait(60)                                        ;B4CDA1
    %AICMD0x19($0079, $00)                                     ;B4CDA4
    %AICMD0x13_Wait(100)                                       ;B4CDA8
    %AICMD0x3E_SetCarryItem($17)                               ;B4CDAB
    %AICMD0x13_Wait(60)                                        ;B4CDAD
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 128)                 ;B4CDB0
    %AICMD0x3F_ThrowCarriedItem()                              ;B4CDB4
    %AICMD0x0B_SetScriptFlag($00)                                            ;B4CDB5
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B4CDB7
    %AICMD0x13_Wait(180)                                       ;B4CDB9
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 128)                ;B4CDBC
    %AICMD0x13_Wait(60)                                        ;B4CDC0
    %AICMD0x19($0040, $00)                                     ;B4CDC3
    %AICMD0x13_Wait(120)                                       ;B4CDC7
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4CDCA
    %AICMD0x19($004C, $00)                                     ;B4CDCC
    %AICMD0x13_Wait(10)                                        ;B4CDD0
    %AICMD0x19($00E8, $00)                                     ;B4CDD3
    %AICMD0x09_StartScript($05, pAIScripting0x33_L001)                                   ;B4CDD7
    %AICMD0x13_Wait(300)                                       ;B4CDDB
    %AICMD0x3D_TeleportToArea(!AREA_ENDING00)                  ;B4CDDE
    %AICMD0x10_End()                                           ;B4CDE0
pAIScripting0x33_L001:
    %AICMD0x1A($0078, $007D, aAIScriptingData_L189, $00)                     ;B4CDE1
pAIScripting0x33_L002:
    %AICMD0x13_Wait(1)                                         ;B4CDE9
    %AICMD0x12_Jump(pAIScripting0x33_L002)                                   ;B4CDEC
pAIScripting0x33_L003:
    %AICMD0x1A($00A8, $0088, aAIScriptingData_L004, $02)                     ;B4CDEF
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B4CDF7
    %AICMD0x1B($01EC, $00)                                     ;B4CDF9
    %AICMD0x0D($FF, $00, $48, $01)                             ;B4CDFD
    %AICMD0x13_Wait(60)                                        ;B4CE02
    %AICMD0x1B($01F2, $00)                                     ;B4CE05
    %AICMD0x13_Wait(120)                                       ;B4CE09
    %AICMD0x1B($01F1, $00)                                     ;B4CE0C
    %AICMD0x13_Wait(100)                                       ;B4CE10
    %AICMD0x1B($01E8, $00)                                     ;B4CE13
    %AICMD0x13_Wait(60)                                        ;B4CE17
    %AICMD0x1B($01F6, $00)                                     ;B4CE1A
    %AICMD0x13_Wait(90)                                        ;B4CE1E
    %AICMD0x1B($01F3, $00)                                     ;B4CE21
    %AICMD0x13_Wait(180)                                       ;B4CE25
    %AICMD0x1B($01F4, $00)                                     ;B4CE28
    %AICMD0x13_Wait(360)                                       ;B4CE2C
pAIScripting0x33_L004:
    %AICMD0x13_Wait(1)                                         ;B4CE2F
    %AICMD0x12_Jump(pAIScripting0x33_L004)                                   ;B4CE32
pAIScripting0x33_L005:
    %AICMD0x1A($0078, $006A, aAIScriptingData_L002, $02)                     ;B4CE35
    %AICMD0x13_Wait(120)                                       ;B4CE3D
    %AICMD0x1B($0194, $01)                                     ;B4CE40
    %AICMD0x13_Wait(120)                                       ;B4CE44
    %AICMD0x1B($0193, $01)                                     ;B4CE47
    %AICMD0x13_Wait(160)                                       ;B4CE4B
    %AICMD0x1B($018C, $01)                                     ;B4CE4E
    %AICMD0x13_Wait(120)                                       ;B4CE52
    %AICMD0x1B($018D, $01)                                     ;B4CE55
    %AICMD0x0B_SetScriptFlag($01)                                            ;B4CE59
pAIScripting0x33_L006:
    %AICMD0x1B($0192, $01)                                     ;B4CE5B
    %AICMD0x13_Wait(120)                                       ;B4CE5F
    %AICMD0x1B($0195, $01)                                     ;B4CE62
    %AICMD0x13_Wait(1)                                         ;B4CE66
    %AICMD0x12_Jump(pAIScripting0x33_L006)                                   ;B4CE69
pAIScripting0x33_L007:
    %AICMD0x1A($0098, $0098, aAIScriptingData_L115, $03)                     ;B4CE6C
    %AICMD0x13_Wait(120)                                       ;B4CE74
pAIScripting0x33_L008:
    %AICMD0x1B($01BD, $00)                                     ;B4CE77
    %AICMD0x13_Wait(120)                                       ;B4CE7B
    %AICMD0x1B($01BE, $00)                                     ;B4CE7E
    %AICMD0x13_Wait(120)                                       ;B4CE82
    %AICMD0x12_Jump(pAIScripting0x33_L008)                                   ;B4CE85
pAIScripting0x33_L009:
    %AICMD0x1A($003A, $0068, aAIScriptingData_L083, $00)                     ;B4CE88
pAIScripting0x33_L010:
    %AICMD0x0D($01, $00, $08, $01)                             ;B4CE90
    %AICMD0x0D($00, $FF, $06, $01)                             ;B4CE95
    %AICMD0x0D($FF, $00, $08, $02)                             ;B4CE9A
    %AICMD0x0D($FF, $01, $04, $01)                             ;B4CE9F
    %AICMD0x0D($01, $00, $0C, $02)                             ;B4CEA4
    %AICMD0x0D($FF, $00, $06, $01)                             ;B4CEA9
    %AICMD0x0D($00, $FF, $10, $02)                             ;B4CEAE
    %AICMD0x0D($FF, $01, $04, $01)                             ;B4CEB3
    %AICMD0x0D($01, $01, $0C, $02)                             ;B4CEB8
    %AICMD0x0D($01, $00, $08, $02)                             ;B4CEBD
    %AICMD0x0D($00, $FF, $06, $01)                             ;B4CEC2
    %AICMD0x12_Jump(pAIScripting0x33_L010)                                   ;B4CEC7


pAIScripting0x34:
    dw DATA8_B4CEEA                                            ;B4CECA|        |B4CEEA;
    dw pAIScripting0x35                                        ;B4CECC|        |B4D011;
    dw pAIScripting0x35                                        ;B4CECE|        |B4D011;
    dw pAIScripting0x35                                        ;B4CED0|        |B4D011;
    dw pAIScripting0x35                                        ;B4CED2|        |B4D011;
    dw pAIScripting0x35                                        ;B4CED4|        |B4D011;
    dw pAIScripting0x35                                        ;B4CED6|        |B4D011;
    dw pAIScripting0x35                                        ;B4CED8|        |B4D011;
    dw pAIScripting0x35                                        ;B4CEDA|        |B4D011;
    dw pAIScripting0x35                                        ;B4CEDC|        |B4D011;
    dw pAIScripting0x35                                        ;B4CEDE|        |B4D011;
    dw pAIScripting0x35                                        ;B4CEE0|        |B4D011;
    dw pAIScripting0x35                                        ;B4CEE2|        |B4D011;
    dw pAIScripting0x35                                        ;B4CEE4|        |B4D011;
    dw pAIScripting0x35                                        ;B4CEE6|        |B4D011;
    dw pAIScripting0x35                                        ;B4CEE8|        |B4D011;
 
DATA8_B4CEEA:
    %AICMD0x47_SetValue8($800921, 16)                          ;B4CEEA
    %AICMD0x47_SetValue8($800926, 5)                           ;B4CEEF
    %AICMD0x00_SetMusic($10, $B4)                              ;B4CEF4
    %AICMD0x02_FreezeTime()                                    ;B4CEF7
    %AICMD0x03_SetHour($06)                                    ;B4CEF8
    %AICMD0x05_SetTransferPosition(232, 65528)                 ;B4CEFA
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4CEFF
    %AICMD0x08_EnableAIControl()                               ;B4CF01
    %AICMD0x09_StartScript($01, pAIScripting0x34_L001)                                   ;B4CF02
    %AICMD0x06_SetDestinationArea(!AREA_ENDING07)              ;B4CF06
    %AICMD0x38_WaitForFadeIn()                                               ;B4CF08
    %AICMD0x13_Wait(60)                                        ;B4CF09
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 112)                 ;B4CF0C
    %AICMD0x13_Wait(30)                                        ;B4CF10
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 64)                   ;B4CF13
    %AICMD0x13_Wait(30)                                        ;B4CF17
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 24)                   ;B4CF1A
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4CF1E
    %AICMD0x3E_SetCarryItem($10)                               ;B4CF20
    %AICMD0x13_Wait(30)                                        ;B4CF22
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 24)                     ;B4CF25
    %AICMD0x13_Wait(40)                                        ;B4CF29
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 88)                  ;B4CF2C
    %AICMD0x3F_ThrowCarriedItem()                              ;B4CF30
    %AICMD0x13_Wait(90)                                        ;B4CF31
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4CF34
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 88)                   ;B4CF36
    %AICMD0x13_Wait(30)                                        ;B4CF3A
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 16)                   ;B4CF3D
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4CF41
    %AICMD0x3E_SetCarryItem($10)                               ;B4CF43
    %AICMD0x13_Wait(30)                                        ;B4CF45
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 16)                     ;B4CF48
    %AICMD0x13_Wait(30)                                        ;B4CF4C
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 88)                  ;B4CF4F
    %AICMD0x3F_ThrowCarriedItem()                              ;B4CF53
    %AICMD0x13_Wait(90)                                        ;B4CF54
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4CF57
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 88)                   ;B4CF59
    %AICMD0x13_Wait(30)                                        ;B4CF5D
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 15)                  ;B4CF60
    %AICMD0x13_Wait(30)                                        ;B4CF64
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4CF67
    %AICMD0x56_UseEquippedItem()                               ;B4CF69
    %AICMD0x13_Wait(80)                                        ;B4CF6A
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 15)                  ;B4CF6D
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4CF71
    %AICMD0x56_UseEquippedItem()                               ;B4CF73
    %AICMD0x13_Wait(80)                                        ;B4CF74
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 15)                  ;B4CF77
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4CF7B
    %AICMD0x56_UseEquippedItem()                               ;B4CF7D
    %AICMD0x13_Wait(80)                                        ;B4CF7E
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 15)                  ;B4CF81
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4CF85
    %AICMD0x56_UseEquippedItem()                               ;B4CF87
    %AICMD0x13_Wait(80)                                        ;B4CF88
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 15)                  ;B4CF8B
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4CF8F
    %AICMD0x56_UseEquippedItem()                               ;B4CF91
    %AICMD0x13_Wait(80)                                        ;B4CF92
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 15)                  ;B4CF95
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4CF99
    %AICMD0x56_UseEquippedItem()                               ;B4CF9B
    %AICMD0x13_Wait(80)                                        ;B4CF9C
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 48)                     ;B4CF9F
    %AICMD0x13_Wait(30)                                        ;B4CFA3
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 64)                   ;B4CFA6
    %AICMD0x0B_SetScriptFlag($00)                                            ;B4CFAA
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B4CFAC
    %AICMD0x3D_TeleportToArea(!AREA_ENDING00)                  ;B4CFAE
    %AICMD0x10_End()                                           ;B4CFB0
pAIScripting0x34_L001:
    %AICMD0x1A($0098, $0098, aAIScriptingData_L173, $03)                     ;B4CFB1
    %AICMD0x1B($01EA, $00)                                     ;B4CFB9
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B4CFBD
    %AICMD0x13_Wait(180)                                       ;B4CFBF
    %AICMD0x1B($01E1, $00)                                     ;B4CFC2
    %AICMD0x0D($00, $FF, $20, $01)                             ;B4CFC6
    %AICMD0x1B($01EE, $01)                                     ;B4CFCB
    %AICMD0x13_Wait(120)                                       ;B4CFCF
    %AICMD0x1B($01DA, $00)                                     ;B4CFD2
    %AICMD0x0D($00, $01, $20, $01)                             ;B4CFD6
    %AICMD0x1B($01EE, $01)                                     ;B4CFDB
    %AICMD0x13_Wait(90)                                        ;B4CFDF
    %AICMD0x1B($01F7, $00)                                     ;B4CFE2
    %AICMD0x13_Wait(90)                                        ;B4CFE6
    %AICMD0x1B($01E1, $00)                                     ;B4CFE9
    %AICMD0x0D($00, $FF, $10, $01)                             ;B4CFED
    %AICMD0x1B($01F7, $00)                                     ;B4CFF2
    %AICMD0x13_Wait(90)                                        ;B4CFF6
    %AICMD0x1B($01E1, $00)                                     ;B4CFF9
    %AICMD0x0D($00, $FF, $10, $01)                             ;B4CFFD
    %AICMD0x1B($01F7, $00)                                     ;B4D002
    %AICMD0x13_Wait(90)                                        ;B4D006
    %AICMD0x0B_SetScriptFlag($01)                                            ;B4D009
pAIScripting0x34_L002:
    %AICMD0x13_Wait(1)                                         ;B4D00B
    %AICMD0x12_Jump(pAIScripting0x34_L002)                                   ;B4D00E


pAIScripting0x35:
    dw DATA8_B4D031                                            ;B4D011|        |B4D031;
    dw pAIScripting0x36                                        ;B4D013|        |B4D160;
    dw pAIScripting0x36                                        ;B4D015|        |B4D160;
    dw pAIScripting0x36                                        ;B4D017|        |B4D160;
    dw pAIScripting0x36                                        ;B4D019|        |B4D160;
    dw pAIScripting0x36                                        ;B4D01B|        |B4D160;
    dw pAIScripting0x36                                        ;B4D01D|        |B4D160;
    dw pAIScripting0x36                                        ;B4D01F|        |B4D160;
    dw pAIScripting0x36                                        ;B4D021|        |B4D160;
    dw pAIScripting0x36                                        ;B4D023|        |B4D160;
    dw pAIScripting0x36                                        ;B4D025|        |B4D160;
    dw pAIScripting0x36                                        ;B4D027|        |B4D160;
    dw pAIScripting0x36                                        ;B4D029|        |B4D160;
    dw pAIScripting0x36                                        ;B4D02B|        |B4D160;
    dw pAIScripting0x36                                        ;B4D02D|        |B4D160;
    dw pAIScripting0x36                                        ;B4D02F|        |B4D160;
 
DATA8_B4D031:
    %AICMD0x47_SetValue8($800921, 21)                          ;B4D031
    %AICMD0x00_SetMusic($10, $B4)                              ;B4D036
    %AICMD0x02_FreezeTime()                                    ;B4D039
    %AICMD0x03_SetHour($06)                                    ;B4D03A
    %AICMD0x05_SetTransferPosition(264, 120)                   ;B4D03C
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4D041
    %AICMD0x08_EnableAIControl()                               ;B4D043
    %AICMD0x09_StartScript($01, pAIScripting0x35_L001)                                   ;B4D044
    %AICMD0x09_StartScript($02, pAIScripting0x35_L003)                                   ;B4D048
    %AICMD0x06_SetDestinationArea(!AREA_ENDING08)              ;B4D04C
    %AICMD0x38_WaitForFadeIn()                                               ;B4D04E
    %AICMD0x13_Wait(180)                                       ;B4D04F
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 64)                   ;B4D052
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4D056
    %AICMD0x13_Wait(30)                                        ;B4D058
    %AICMD0x3E_SetCarryItem($11)                               ;B4D05B
    %AICMD0x13_Wait(60)                                        ;B4D05D
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B4D060
    %AICMD0x13_Wait(30)                                        ;B4D062
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 32)                    ;B4D065
    %AICMD0x3F_ThrowCarriedItem()                              ;B4D069
    %AICMD0x0B_SetScriptFlag($00)                                            ;B4D06A
    %AICMD0x13_Wait(60)                                        ;B4D06C
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 32)                  ;B4D06F
    %AICMD0x13_Wait(30)                                        ;B4D073
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 16)                  ;B4D076
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4D07A
    %AICMD0x13_Wait(30)                                        ;B4D07C
    %AICMD0x3E_SetCarryItem($11)                               ;B4D07F
    %AICMD0x13_Wait(60)                                        ;B4D081
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B4D084
    %AICMD0x13_Wait(30)                                        ;B4D086
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 32)                    ;B4D089
    %AICMD0x13_Wait(30)                                        ;B4D08D
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B4D090
    %AICMD0x3F_ThrowCarriedItem()                              ;B4D092
    %AICMD0x0B_SetScriptFlag($01)                                            ;B4D093
    %AICMD0x13_Wait(60)                                        ;B4D095
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 24)                   ;B4D098
    %AICMD0x19($00A5, $00)                                     ;B4D09C
    %AICMD0x13_Wait(60)                                        ;B4D0A0
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 56)                  ;B4D0A3
    %AICMD0x56_UseEquippedItem()                               ;B4D0A7
    %AICMD0x13_Wait(120)                                       ;B4D0A8
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 16)                   ;B4D0AB
    %AICMD0x56_UseEquippedItem()                               ;B4D0AF
    %AICMD0x13_Wait(120)                                       ;B4D0B0
    %AICMD0x19($004A, $00)                                     ;B4D0B3
    %AICMD0x13_Wait(120)                                       ;B4D0B7
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 96)                  ;B4D0BA
    %AICMD0x13_Wait(30)                                        ;B4D0BE
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4D0C1
    %AICMD0x13_Wait(60)                                        ;B4D0C3
    %AICMD0x19($0030, $00)                                     ;B4D0C6
    %AICMD0x13_Wait(60)                                        ;B4D0CA
    %AICMD0x0B_SetScriptFlag($02)                                            ;B4D0CD
    %AICMD0x0C_WaitForScriptFlag($03)                                            ;B4D0CF
    %AICMD0x3D_TeleportToArea(!AREA_ENDING00)                  ;B4D0D1
    %AICMD0x10_End()                                           ;B4D0D3
pAIScripting0x35_L001:
    %AICMD0x1A($00A8, $0048, aAIScriptingData_L004, $00)                     ;B4D0D4
    %AICMD0x1B($01DB, $00)                                     ;B4D0DC
    %AICMD0x13_Wait(120)                                       ;B4D0E0
    %AICMD0x1B($01DA, $00)                                     ;B4D0E3
    %AICMD0x0D($00, $01, $20, $01)                             ;B4D0E7
    %AICMD0x1B($01DC, $00)                                     ;B4D0EC
    %AICMD0x13_Wait(120)                                       ;B4D0F0
    %AICMD0x1B($01DB, $00)                                     ;B4D0F3
    %AICMD0x13_Wait(120)                                       ;B4D0F7
    %AICMD0x1B($01DC, $01)                                     ;B4D0FA
    %AICMD0x13_Wait(60)                                        ;B4D0FE
    %AICMD0x0C_WaitForScriptFlag($02)                                            ;B4D101
    %AICMD0x1B($01DA, $00)                                     ;B4D103
    %AICMD0x0D($00, $01, $10, $01)                             ;B4D107
    %AICMD0x1B($01E9, $00)                                     ;B4D10C
    %AICMD0x13_Wait(30)                                        ;B4D110
    %AICMD0x0D($FF, $00, $20, $01)                             ;B4D113
    %AICMD0x1B($01F2, $00)                                     ;B4D118
    %AICMD0x13_Wait(120)                                       ;B4D11C
    %AICMD0x0B_SetScriptFlag($03)                                            ;B4D11F
pAIScripting0x35_L002:
    %AICMD0x13_Wait(1)                                         ;B4D121
    %AICMD0x12_Jump(pAIScripting0x35_L002)                                   ;B4D124
pAIScripting0x35_L003:
    %AICMD0x1A($0080, $0048, aAIScriptingData_L006, $03)                     ;B4D127
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B4D12F
    %AICMD0x1B($0208, $00)                                     ;B4D131
    %AICMD0x13_Wait(60)                                        ;B4D135
    %AICMD0x1B($0200, $00)                                     ;B4D138
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B4D13C
    %AICMD0x1B($0208, $00)                                     ;B4D13E
    %AICMD0x13_Wait(60)                                        ;B4D142
    %AICMD0x1B($0200, $00)                                     ;B4D145
    %AICMD0x13_Wait(120)                                       ;B4D149
    %AICMD0x1B($0203, $00)                                     ;B4D14C
    %AICMD0x13_Wait(120)                                       ;B4D150
    %AICMD0x1B($0205, $00)                                     ;B4D153
    %AICMD0x13_Wait(180)                                       ;B4D157
pAIScripting0x35_L004:
    %AICMD0x13_Wait(1)                                         ;B4D15A
    %AICMD0x12_Jump(pAIScripting0x35_L004)                                   ;B4D15D


pAIScripting0x36:
    dw DATA8_B4D180                                            ;B4D160|        |B4D180;
    dw pAIScripting0x37                                        ;B4D162|        |B4D2CC;
    dw pAIScripting0x37                                        ;B4D164|        |B4D2CC;
    dw pAIScripting0x37                                        ;B4D166|        |B4D2CC;
    dw pAIScripting0x37                                        ;B4D168|        |B4D2CC;
    dw pAIScripting0x37                                        ;B4D16A|        |B4D2CC;
    dw pAIScripting0x37                                        ;B4D16C|        |B4D2CC;
    dw pAIScripting0x37                                        ;B4D16E|        |B4D2CC;
    dw pAIScripting0x37                                        ;B4D170|        |B4D2CC;
    dw pAIScripting0x37                                        ;B4D172|        |B4D2CC;
    dw pAIScripting0x37                                        ;B4D174|        |B4D2CC;
    dw pAIScripting0x37                                        ;B4D176|        |B4D2CC;
    dw pAIScripting0x37                                        ;B4D178|        |B4D2CC;
    dw pAIScripting0x37                                        ;B4D17A|        |B4D2CC;
    dw pAIScripting0x37                                        ;B4D17C|        |B4D2CC;
    dw pAIScripting0x37                                        ;B4D17E|        |B4D2CC;
 
DATA8_B4D180:
    %AICMD0x00_SetMusic($10, $B4)                              ;B4D180
    %AICMD0x02_FreezeTime()                                    ;B4D183
    %AICMD0x03_SetHour($06)                                    ;B4D184
    %AICMD0x05_SetTransferPosition(184, 104)                   ;B4D186
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4D18B
    %AICMD0x08_EnableAIControl()                               ;B4D18D
    %AICMD0x09_StartScript($01, pAIScripting0x36_L004)                                   ;B4D18E
    %AICMD0x09_StartScript($02, pAIScripting0x36_L006)                                   ;B4D192
    %AICMD0x09_StartScript($04, pAIScripting0x36_L001)                                   ;B4D196
    %AICMD0x09_StartScript($05, pAIScripting0x36_L002)                                   ;B4D19A
    %AICMD0x09_StartScript($06, pAIScripting0x36_L003)                                   ;B4D19E
    %AICMD0x3B($12)                                            ;B4D1A2
    %AICMD0x06_SetDestinationArea(!AREA_ENDING09)              ;B4D1A4
    %AICMD0x38_WaitForFadeIn()                                               ;B4D1A6
    %AICMD0x13_Wait(60)                                        ;B4D1A7
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 192)                 ;B4D1AA
    %AICMD0x13_Wait(120)                                       ;B4D1AE
    %AICMD0x3F_ThrowCarriedItem()                              ;B4D1B1
    %AICMD0x13_Wait(30)                                        ;B4D1B2
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4D1B5
    %AICMD0x13_Wait(30)                                        ;B4D1B7
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 106)                 ;B4D1BA
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4D1BE
    %AICMD0x3E_SetCarryItem($12)                               ;B4D1C0
    %AICMD0x13_Wait(30)                                        ;B4D1C2
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 108)                  ;B4D1C5
    %AICMD0x0B_SetScriptFlag($00)                                            ;B4D1C9
    %AICMD0x3F_ThrowCarriedItem()                              ;B4D1CB
    %AICMD0x13_Wait(300)                                       ;B4D1CC
    %AICMD0x0C_WaitForScriptFlag($05)                                            ;B4D1CF
    %AICMD0x3D_TeleportToArea(!AREA_ENDING00)                  ;B4D1D1
    %AICMD0x10_End()                                           ;B4D1D3
pAIScripting0x36_L001:
    %AICMD0x1A($00B8, $0078, aAIScriptingData_L190, $00)                     ;B4D1D4
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B4D1DC
    %AICMD0x1B($00B7, $00)                                     ;B4D1DE
    %AICMD0x13_Wait(60)                                        ;B4D1E2
    %AICMD0x37()                                               ;B4D1E5
    %AICMD0x0B_SetScriptFlag($01)                                            ;B4D1E6
    %AICMD0x10_End()                                           ;B4D1E8
pAIScripting0x36_L002:
    %AICMD0x1A($0098, $0078, aAIScriptingData_L190, $00)                     ;B4D1E9
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B4D1F1
    %AICMD0x1B($00B7, $00)                                     ;B4D1F3
    %AICMD0x13_Wait(60)                                        ;B4D1F7
    %AICMD0x37()                                               ;B4D1FA
    %AICMD0x0B_SetScriptFlag($02)                                            ;B4D1FB
    %AICMD0x10_End()                                           ;B4D1FD
pAIScripting0x36_L003:
    %AICMD0x1A($0088, $0078, aAIScriptingData_L190, $00)                     ;B4D1FE
    %AICMD0x0C_WaitForScriptFlag($02)                                            ;B4D206
    %AICMD0x13_Wait(60)                                        ;B4D208
    %AICMD0x1B($00B7, $00)                                     ;B4D20B
    %AICMD0x13_Wait(60)                                        ;B4D20F
    %AICMD0x37()                                               ;B4D212
    %AICMD0x0B_SetScriptFlag($03)                                            ;B4D213
    %AICMD0x10_End()                                           ;B4D215
pAIScripting0x36_L004:
    %AICMD0x1A($0078, $0078, aAIScriptingData_L167, $02)                     ;B4D216
    %AICMD0x13_Wait(200)                                       ;B4D21E
    %AICMD0x1B($01F6, $01)                                     ;B4D221
    %AICMD0x13_Wait(120)                                       ;B4D225
    %AICMD0x1B($01EB, $01)                                     ;B4D228
    %AICMD0x13_Wait(180)                                       ;B4D22C
    %AICMD0x1B($01EA, $01)                                     ;B4D22F
    %AICMD0x13_Wait(180)                                       ;B4D233
    %AICMD0x0C_WaitForScriptFlag($03)                                            ;B4D236
    %AICMD0x1B($01E8, $01)                                     ;B4D238
    %AICMD0x13_Wait(60)                                        ;B4D23C
    %AICMD0x0C_WaitForScriptFlag($03)                                            ;B4D23F
    %AICMD0x1B($01F2, $01)                                     ;B4D241
    %AICMD0x13_Wait(120)                                       ;B4D245
    %AICMD0x0B_SetScriptFlag($04)                                            ;B4D248
    %AICMD0x13_Wait(120)                                       ;B4D24A
    %AICMD0x1B($01EC, $01)                                     ;B4D24D
    %AICMD0x0D($01, $00, $30, $01)                             ;B4D251
    %AICMD0x13_Wait(40)                                        ;B4D256
    %AICMD0x1B($01E2, $00)                                     ;B4D259
    %AICMD0x0D($00, $FF, $10, $01)                             ;B4D25D
    %AICMD0x13_Wait(40)                                        ;B4D262
    %AICMD0x1B($01EC, $01)                                     ;B4D265
    %AICMD0x0D($01, $00, $48, $01)                             ;B4D269
    %AICMD0x13_Wait(40)                                        ;B4D26E
    %AICMD0x1B($01EC, $00)                                     ;B4D271
    %AICMD0x0D($FF, $00, $58, $01)                             ;B4D275
    %AICMD0x13_Wait(90)                                        ;B4D27A
pAIScripting0x36_L005:
    %AICMD0x13_Wait(1)                                         ;B4D27D
    %AICMD0x12_Jump(pAIScripting0x36_L005)                                   ;B4D280
pAIScripting0x36_L006:
    %AICMD0x0C_WaitForScriptFlag($04)                                            ;B4D283
    %AICMD0x1A($0088, $0078, aAIScriptingData_L085, $00)                     ;B4D285
    %AICMD0x1B($0321, $00)                                     ;B4D28D
    %AICMD0x13_Wait(60)                                        ;B4D291
    %AICMD0x1B($0324, $01)                                     ;B4D294
    %AICMD0x0D($01, $00, $20, $01)                             ;B4D298
    %AICMD0x13_Wait(30)                                        ;B4D29D
    %AICMD0x1B($0323, $00)                                     ;B4D2A0
    %AICMD0x0D($00, $FF, $20, $01)                             ;B4D2A4
    %AICMD0x13_Wait(30)                                        ;B4D2A9
    %AICMD0x1B($0324, $01)                                     ;B4D2AC
    %AICMD0x0D($01, $00, $50, $01)                             ;B4D2B0
    %AICMD0x13_Wait(30)                                        ;B4D2B5
    %AICMD0x1B($0324, $00)                                     ;B4D2B8
    %AICMD0x0D($FF, $00, $80, $01)                             ;B4D2BC
    %AICMD0x1B($0325, $00)                                     ;B4D2C1
    %AICMD0x13_Wait(60)                                        ;B4D2C5
    %AICMD0x0B_SetScriptFlag($05)                                            ;B4D2C8
    %AICMD0x37()                                               ;B4D2CA
    %AICMD0x10_End()                                           ;B4D2CB


pAIScripting0x37:
    dw DATA8_B4D2EC                                            ;B4D2CC|        |B4D2EC;
    dw pAIScripting0x38                                        ;B4D2CE|        |B4D447;
    dw pAIScripting0x38                                        ;B4D2D0|        |B4D447;
    dw pAIScripting0x38                                        ;B4D2D2|        |B4D447;
    dw pAIScripting0x38                                        ;B4D2D4|        |B4D447;
    dw pAIScripting0x38                                        ;B4D2D6|        |B4D447;
    dw pAIScripting0x38                                        ;B4D2D8|        |B4D447;
    dw pAIScripting0x38                                        ;B4D2DA|        |B4D447;
    dw pAIScripting0x38                                        ;B4D2DC|        |B4D447;
    dw pAIScripting0x38                                        ;B4D2DE|        |B4D447;
    dw pAIScripting0x38                                        ;B4D2E0|        |B4D447;
    dw pAIScripting0x38                                        ;B4D2E2|        |B4D447;
    dw pAIScripting0x38                                        ;B4D2E4|        |B4D447;
    dw pAIScripting0x38                                        ;B4D2E6|        |B4D447;
    dw pAIScripting0x38                                        ;B4D2E8|        |B4D447;
    dw pAIScripting0x38                                        ;B4D2EA|        |B4D447;
 
DATA8_B4D2EC:
    %AICMD0x47_SetValue8($800921, 16)                          ;B4D2EC
    %AICMD0x47_SetValue8($800926, 5)                           ;B4D2F1
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


pAIScripting0x38:
    dw DATA8_B4D467                                            ;B4D447|        |B4D467;
    dw pAIScripting0x39                                        ;B4D449|        |B4D531;
    dw pAIScripting0x39                                        ;B4D44B|        |B4D531;
    dw pAIScripting0x39                                        ;B4D44D|        |B4D531;
    dw pAIScripting0x39                                        ;B4D44F|        |B4D531;
    dw pAIScripting0x39                                        ;B4D451|        |B4D531;
    dw pAIScripting0x39                                        ;B4D453|        |B4D531;
    dw pAIScripting0x39                                        ;B4D455|        |B4D531;
    dw pAIScripting0x39                                        ;B4D457|        |B4D531;
    dw pAIScripting0x39                                        ;B4D459|        |B4D531;
    dw pAIScripting0x39                                        ;B4D45B|        |B4D531;
    dw pAIScripting0x39                                        ;B4D45D|        |B4D531;
    dw pAIScripting0x39                                        ;B4D45F|        |B4D531;
    dw pAIScripting0x39                                        ;B4D461|        |B4D531;
    dw pAIScripting0x39                                        ;B4D463|        |B4D531;
    dw pAIScripting0x39                                        ;B4D465|        |B4D531;
 
DATA8_B4D467:
    %AICMD0x00_SetMusic($10, $B4)                              ;B4D467
    %AICMD0x02_FreezeTime()                                    ;B4D46A
    %AICMD0x03_SetHour($06)                                    ;B4D46B
    %AICMD0x05_SetTransferPosition(65512, 120)                 ;B4D46D
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4D472
    %AICMD0x40_DisableTileInteractions()                       ;B4D474
    %AICMD0x08_EnableAIControl()                               ;B4D475
    %AICMD0x09_StartScript($01, pAIScripting0x38_L001)                                   ;B4D476
    %AICMD0x09_StartScript($02, pAIScripting0x38_L003)                                   ;B4D47A
    %AICMD0x06_SetDestinationArea(!AREA_ENDING06)              ;B4D47E
    %AICMD0x38_WaitForFadeIn()                                               ;B4D480
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B4D481
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 40)                  ;B4D483
    %AICMD0x13_Wait(30)                                        ;B4D487
    %AICMD0x19($00BE, $00)                                     ;B4D48A
    %AICMD0x0B_SetScriptFlag($01)                                            ;B4D48E
    %AICMD0x13_Wait(90)                                        ;B4D490
    %AICMD0x0C_WaitForScriptFlag($02)                                            ;B4D493
    %AICMD0x13_Wait(30)                                        ;B4D495
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 12)                 ;B4D498
    %AICMD0x19($0041, $00)                                     ;B4D49C
    %AICMD0x13_Wait(10)                                        ;B4D4A0
    %AICMD0x3D_TeleportToArea(!AREA_ENDING00)                  ;B4D4A3
    %AICMD0x10_End()                                           ;B4D4A5
pAIScripting0x38_L001:
    %AICMD0x1A($0078, $0078, aAIScriptingData_L004, $03)                     ;B4D4A6
    %AICMD0x1B($01E7, $00)                                     ;B4D4AE
    %AICMD0x13_Wait(120)                                       ;B4D4B2
    %AICMD0x1B($01F3, $00)                                     ;B4D4B5
    %AICMD0x13_Wait(120)                                       ;B4D4B9
    %AICMD0x1B($01F6, $00)                                     ;B4D4BC
    %AICMD0x13_Wait(120)                                       ;B4D4C0
    %AICMD0x1B($01EC, $01)                                     ;B4D4C3
    %AICMD0x0D($01, $00, $30, $01)                             ;B4D4C7
    %AICMD0x1B($01EE, $01)                                     ;B4D4CC
    %AICMD0x13_Wait(120)                                       ;B4D4D0
    %AICMD0x1B($01EC, $00)                                     ;B4D4D3
    %AICMD0x0D($FF, $00, $30, $01)                             ;B4D4D7
    %AICMD0x1B($01EA, $00)                                     ;B4D4DC
    %AICMD0x13_Wait(30)                                        ;B4D4E0
    %AICMD0x0B_SetScriptFlag($00)                                            ;B4D4E3
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B4D4E5
    %AICMD0x1B($01F8, $00)                                     ;B4D4E7
    %AICMD0x13_Wait(60)                                        ;B4D4EB
    %AICMD0x0B_SetScriptFlag($02)                                            ;B4D4EE
    %AICMD0x1B($01EC, $00)                                     ;B4D4F0
    %AICMD0x0D($FF, $00, $2A, $01)                             ;B4D4F4
    %AICMD0x1B($01ED, $00)                                     ;B4D4F9
pAIScripting0x38_L002:
    %AICMD0x13_Wait(1)                                         ;B4D4FD
    %AICMD0x12_Jump(pAIScripting0x38_L002)                                   ;B4D500
pAIScripting0x38_L003:
    %AICMD0x1A($0068, $0068, aAIScriptingData_L006, $02)                     ;B4D503
pAIScripting0x38_L004:
    %AICMD0x1B($0203, $01)                                     ;B4D50B
    %AICMD0x13_Wait(80)                                        ;B4D50F
    %AICMD0x1B($0200, $01)                                     ;B4D512
    %AICMD0x13_Wait(180)                                       ;B4D516
    %AICMD0x1B($0204, $01)                                     ;B4D519
    %AICMD0x13_Wait(60)                                        ;B4D51D
    %AICMD0x1B($0205, $01)                                     ;B4D520
    %AICMD0x13_Wait(90)                                        ;B4D524
    %AICMD0x1B($0200, $01)                                     ;B4D527
    %AICMD0x13_Wait(120)                                       ;B4D52B
    %AICMD0x12_Jump(pAIScripting0x38_L004)                                   ;B4D52E


pAIScripting0x39:
    dw DATA8_B4D551                                            ;B4D531|        |B4D551;
    dw pAIScripting0x3A                                        ;B4D533|        |B4D772;
    dw pAIScripting0x3A                                        ;B4D535|        |B4D772;
    dw pAIScripting0x3A                                        ;B4D537|        |B4D772;
    dw pAIScripting0x3A                                        ;B4D539|        |B4D772;
    dw pAIScripting0x3A                                        ;B4D53B|        |B4D772;
    dw pAIScripting0x3A                                        ;B4D53D|        |B4D772;
    dw pAIScripting0x3A                                        ;B4D53F|        |B4D772;
    dw pAIScripting0x3A                                        ;B4D541|        |B4D772;
    dw pAIScripting0x3A                                        ;B4D543|        |B4D772;
    dw pAIScripting0x3A                                        ;B4D545|        |B4D772;
    dw pAIScripting0x3A                                        ;B4D547|        |B4D772;
    dw pAIScripting0x3A                                        ;B4D549|        |B4D772;
    dw pAIScripting0x3A                                        ;B4D54B|        |B4D772;
    dw pAIScripting0x3A                                        ;B4D54D|        |B4D772;
    dw pAIScripting0x3A                                        ;B4D54F|        |B4D772;
 
DATA8_B4D551:
    %AICMD0x00_SetMusic($10, $B4)                              ;B4D551
    %AICMD0x02_FreezeTime()                                    ;B4D554
    %AICMD0x03_SetHour($07)                                    ;B4D555
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4D557
    %AICMD0x05_SetTransferPosition(664, 112)                   ;B4D559
    %AICMD0x08_EnableAIControl()                               ;B4D55E
    %AICMD0x09_StartScript($01, pAIScripting0x39_L001)                                   ;B4D55F
    %AICMD0x09_StartScript($02, pAIScripting0x39_L003)                                   ;B4D563
    %AICMD0x09_StartScript($03, pAIScripting0x39_L005)                                   ;B4D567
    %AICMD0x09_StartScript($04, pAIScripting0x39_L007)                                   ;B4D56B
    %AICMD0x06_SetDestinationArea(!AREA_WOODSSUMMER)           ;B4D56F
    %AICMD0x38_WaitForFadeIn()                                               ;B4D571
    %AICMD0x13_Wait(60)                                        ;B4D572
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 80)                  ;B4D575
    %AICMD0x13_Wait(20)                                        ;B4D579
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 16)                    ;B4D57C
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4D580
    %AICMD0x13_Wait(30)                                        ;B4D582
    %AICMD0x19($005F, $00)                                     ;B4D585
    %AICMD0x13_Wait(60)                                        ;B4D589
    %AICMD0x19($0003, $00)                                     ;B4D58C
    %AICMD0x13_Wait(1)                                         ;B4D590
    %AICMD0x19($005F, $00)                                     ;B4D593
    %AICMD0x13_Wait(60)                                        ;B4D597
    %AICMD0x19($0003, $00)                                     ;B4D59A
    %AICMD0x13_Wait(1)                                         ;B4D59E
    %AICMD0x19($005F, $00)                                     ;B4D5A1
    %AICMD0x13_Wait(60)                                        ;B4D5A5
    %AICMD0x19($0003, $00)                                     ;B4D5A8
    %AICMD0x13_Wait(1)                                         ;B4D5AC
    %AICMD0x19($005F, $00)                                     ;B4D5AF
    %AICMD0x13_Wait(60)                                        ;B4D5B3
    %AICMD0x19($004A, $00)                                     ;B4D5B6
    %AICMD0x13_Wait(120)                                       ;B4D5BA
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4D5BD
    %AICMD0x0B_SetScriptFlag($00)                                            ;B4D5BF
    %AICMD0x13_Wait(60)                                        ;B4D5C1
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4D5C4
    %AICMD0x13_Wait(120)                                       ;B4D5C6
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 12)                  ;B4D5C9
    %AICMD0x0B_SetScriptFlag($03)                                            ;B4D5CD
    %AICMD0x19($0010, $00)                                     ;B4D5CF
    %AICMD0x13_Wait(14)                                        ;B4D5D3
    %AICMD0x19($0014, $00)                                     ;B4D5D6
    %AICMD0x13_Wait(60)                                        ;B4D5DA
    %AICMD0x19($003B, $00)                                     ;B4D5DD
    %AICMD0x13_Wait(60)                                        ;B4D5E1
    %AICMD0x0B_SetScriptFlag($01)                                            ;B4D5E4
    %AICMD0x13_Wait(120)                                       ;B4D5E6
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B4D5E9
    %AICMD0x13_Wait(300)                                       ;B4D5EB
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4D5EE
    %AICMD0x13_Wait(120)                                       ;B4D5F0
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4D5F3
    %AICMD0x13_Wait(90)                                        ;B4D5F5
    %AICMD0x19($003C, $00)                                     ;B4D5F8
    %AICMD0x13_Wait(120)                                       ;B4D5FC
    %AICMD0x19($0000, $00)                                     ;B4D5FF
    %AICMD0x13_Wait(1)                                         ;B4D603
    %AICMD0x19($003C, $00)                                     ;B4D606
    %AICMD0x13_Wait(120)                                       ;B4D60A
    %AICMD0x3D_TeleportToArea(!AREA_ENDING00)                  ;B4D60D
    %AICMD0x10_End()                                           ;B4D60F
pAIScripting0x39_L001:
    %AICMD0x1A($02B8, $00CB, aAIScriptingData_L089, $00)                     ;B4D610
pAIScripting0x39_L002:
    %AICMD0x13_Wait(1)                                         ;B4D618
    %AICMD0x12_Jump(pAIScripting0x39_L002)                                   ;B4D61B
pAIScripting0x39_L003:
    %AICMD0x1A($0210, $0088, aAIScriptingData_L132, $00)                     ;B4D61E
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B4D626
    %AICMD0x1B($0303, $01)                                     ;B4D628
    %AICMD0x0D($01, $00, $38, $01)                             ;B4D62C
    %AICMD0x1B($0302, $01)                                     ;B4D631
    %AICMD0x13_Wait(60)                                        ;B4D635
    %AICMD0x09_StartScript($05, pAIScripting0x39_L004)                                   ;B4D638
    %AICMD0x1B($0303, $00)                                     ;B4D63C
    %AICMD0x0D($FF, $00, $10, $01)                             ;B4D640
    %AICMD0x1B($0302, $01)                                     ;B4D645
    %AICMD0x13_Wait(120)                                       ;B4D649
    %AICMD0x1B($0303, $00)                                     ;B4D64C
    %AICMD0x0D($FF, $00, $40, $01)                             ;B4D650
    %AICMD0x37()                                               ;B4D655
    %AICMD0x10_End()                                           ;B4D656
pAIScripting0x39_L004:
    %AICMD0x1A($0258, $0088, aAIScriptingData_L123, $00)                     ;B4D657
    %AICMD0x13_Wait(30)                                        ;B4D65F
    %AICMD0x0C_WaitForScriptFlag($03)                                            ;B4D662
    %AICMD0x13_Wait(10)                                        ;B4D664
    %AICMD0x0D($00, $F0, $02, $01)                             ;B4D667
    %AICMD0x13_Wait(60)                                        ;B4D66C
    %AICMD0x37()                                               ;B4D66F
    %AICMD0x10_End()                                           ;B4D670
pAIScripting0x39_L005:
    %AICMD0x1A($0208, $0054, aAIScriptingData_L134, $00)                     ;B4D671
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B4D679
    %AICMD0x13_Wait(90)                                        ;B4D67B
    %AICMD0x1B($0307, $01)                                     ;B4D67E
    %AICMD0x13_Wait(60)                                        ;B4D682
    %AICMD0x0D($01, $00, $40, $01)                             ;B4D685
    %AICMD0x1B($0306, $00)                                     ;B4D68A
    %AICMD0x13_Wait(60)                                        ;B4D68E
    %AICMD0x1B($0307, $01)                                     ;B4D691
    %AICMD0x0D($02, $00, $20, $03)                             ;B4D695
    %AICMD0x1B($0306, $00)                                     ;B4D69A
    %AICMD0x13_Wait(60)                                        ;B4D69E
    %AICMD0x1B($0307, $01)                                     ;B4D6A1
    %AICMD0x0D($02, $00, $28, $03)                             ;B4D6A5
    %AICMD0x1B($0306, $00)                                     ;B4D6AA
    %AICMD0x13_Wait(60)                                        ;B4D6AE
    %AICMD0x0B_SetScriptFlag($02)                                            ;B4D6B1
    %AICMD0x09_StartScript($06, pAIScripting0x39_L009)                                   ;B4D6B3
    %AICMD0x09_StartScript($07, pAIScripting0x39_L011)                                   ;B4D6B7
pAIScripting0x39_L006:
    %AICMD0x13_Wait(1)                                         ;B4D6BB
    %AICMD0x12_Jump(pAIScripting0x39_L006)                                   ;B4D6BE
pAIScripting0x39_L007:
    %AICMD0x1A($0320, $0078, aAIScriptingData_L133, $00)                     ;B4D6C1
    %AICMD0x0C_WaitForScriptFlag($02)                                            ;B4D6C9
    %AICMD0x1B($0305, $00)                                     ;B4D6CB
    %AICMD0x0D($FF, $00, $70, $01)                             ;B4D6CF
    %AICMD0x1B($0304, $00)                                     ;B4D6D4
    %AICMD0x09_StartScript($08, pAIScripting0x39_L013)                                   ;B4D6D8
    %AICMD0x1B($0305, $00)                                     ;B4D6DC
    %AICMD0x0D($FF, $00, $20, $01)                             ;B4D6E0
    %AICMD0x1B($0304, $00)                                     ;B4D6E5
pAIScripting0x39_L008:
    %AICMD0x13_Wait(1)                                         ;B4D6E9
    %AICMD0x12_Jump(pAIScripting0x39_L008)                                   ;B4D6EC
pAIScripting0x39_L009:
    %AICMD0x1A($01C8, $0024, aAIScriptingData_L093, $02)                     ;B4D6EF
    %AICMD0x1B($0329, $01)                                     ;B4D6F7
    %AICMD0x13_Wait(60)                                        ;B4D6FB
    %AICMD0x0D($01, $01, $28, $01)                             ;B4D6FE
    %AICMD0x13_Wait(10)                                        ;B4D703
    %AICMD0x0D($02, $01, $40, $02)                             ;B4D706
    %AICMD0x13_Wait(10)                                        ;B4D70B
    %AICMD0x0D($01, $00, $10, $01)                             ;B4D70E
    %AICMD0x1B($0328, $01)                                     ;B4D713
pAIScripting0x39_L010:
    %AICMD0x13_Wait(1)                                         ;B4D717
    %AICMD0x12_Jump(pAIScripting0x39_L010)                                   ;B4D71A
pAIScripting0x39_L011:
    %AICMD0x1A($02C8, $0058, aAIScriptingData_L093, $03)                     ;B4D71D
    %AICMD0x1B($0329, $00)                                     ;B4D725
    %AICMD0x0D($FF, $01, $20, $01)                             ;B4D729
    %AICMD0x13_Wait(30)                                        ;B4D72E
    %AICMD0x0D($FE, $01, $20, $01)                             ;B4D731
    %AICMD0x13_Wait(10)                                        ;B4D736
    %AICMD0x0D($FF, $00, $20, $01)                             ;B4D739
    %AICMD0x13_Wait(30)                                        ;B4D73E
    %AICMD0x1B($0329, $00)                                     ;B4D741
    %AICMD0x13_Wait(10)                                        ;B4D745
    %AICMD0x1B($0327, $00)                                     ;B4D748
pAIScripting0x39_L012:
    %AICMD0x13_Wait(1)                                         ;B4D74C
    %AICMD0x12_Jump(pAIScripting0x39_L012)                                   ;B4D74F
pAIScripting0x39_L013:
    %AICMD0x1A($0218, $00F8, aAIScriptingData_L093, $01)                     ;B4D752
    %AICMD0x1B($0329, $01)                                     ;B4D75A
    %AICMD0x0D($01, $FF, $40, $01)                             ;B4D75E
    %AICMD0x0D($00, $FF, $10, $01)                             ;B4D763
    %AICMD0x1B($0328, $01)                                     ;B4D768
pAIScripting0x39_L014:
    %AICMD0x13_Wait(1)                                         ;B4D76C
    %AICMD0x12_Jump(pAIScripting0x39_L014)                                   ;B4D76F


pAIScripting0x3A:
    dw DATA8_B4D792                                            ;B4D772|        |B4D792;
    dw DATA8_B4D863                                            ;B4D774|        |B4D863;
    dw pAIScripting0x3B                                        ;B4D776|        |B4DA22;
    dw pAIScripting0x3B                                        ;B4D778|        |B4DA22;
    dw pAIScripting0x3B                                        ;B4D77A|        |B4DA22;
    dw pAIScripting0x3B                                        ;B4D77C|        |B4DA22;
    dw pAIScripting0x3B                                        ;B4D77E|        |B4DA22;
    dw pAIScripting0x3B                                        ;B4D780|        |B4DA22;
    dw pAIScripting0x3B                                        ;B4D782|        |B4DA22;
    dw pAIScripting0x3B                                        ;B4D784|        |B4DA22;
    dw pAIScripting0x3B                                        ;B4D786|        |B4DA22;
    dw pAIScripting0x3B                                        ;B4D788|        |B4DA22;
    dw pAIScripting0x3B                                        ;B4D78A|        |B4DA22;
    dw pAIScripting0x3B                                        ;B4D78C|        |B4DA22;
    dw pAIScripting0x3B                                        ;B4D78E|        |B4DA22;
    dw pAIScripting0x3B                                        ;B4D790|        |B4DA22;
 
DATA8_B4D792:
 
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


DATA8_B4D863:
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


pAIScripting0x3B:
    dw DATA8_B4DA42                                            ;B4DA22|        |B4DA42;
    dw DATA8_B4DB0A                                            ;B4DA24|        |B4DB0A;
    dw pAIScripting0x3C                                        ;B4DA26|        |B4DCCD;
    dw pAIScripting0x3C                                        ;B4DA28|        |B4DCCD;
    dw pAIScripting0x3C                                        ;B4DA2A|        |B4DCCD;
    dw pAIScripting0x3C                                        ;B4DA2C|        |B4DCCD;
    dw pAIScripting0x3C                                        ;B4DA2E|        |B4DCCD;
    dw pAIScripting0x3C                                        ;B4DA30|        |B4DCCD;
    dw pAIScripting0x3C                                        ;B4DA32|        |B4DCCD;
    dw pAIScripting0x3C                                        ;B4DA34|        |B4DCCD;
    dw pAIScripting0x3C                                        ;B4DA36|        |B4DCCD;
    dw pAIScripting0x3C                                        ;B4DA38|        |B4DCCD;
    dw pAIScripting0x3C                                        ;B4DA3A|        |B4DCCD;
    dw pAIScripting0x3C                                        ;B4DA3C|        |B4DCCD;
    dw pAIScripting0x3C                                        ;B4DA3E|        |B4DCCD;
    dw pAIScripting0x3C                                        ;B4DA40|        |B4DCCD;
 
DATA8_B4DA42:
 
    %AICMD0x00_SetMusic($10, $B4)                              ;B4DA42
    %AICMD0x02_FreezeTime()                                    ;B4DA45
    %AICMD0x03_SetHour($07)                                    ;B4DA46
    %AICMD0x05_SetTransferPosition(136, 456)                   ;B4DA48
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B4DA4D
    %AICMD0x08_EnableAIControl()                               ;B4DA4F
    %AICMD0x09_StartScript($01, pAIScripting0x3B_L001)                                   ;B4DA50
    %AICMD0x06_SetDestinationArea(!AREA_TOOLSSHOP)             ;B4DA54
    %AICMD0x38_WaitForFadeIn()                                               ;B4DA56
    %AICMD0x13_Wait(60)                                        ;B4DA57
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 64)                    ;B4DA5A
    %AICMD0x13_Wait(60)                                        ;B4DA5E
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4DA61
    %AICMD0x0B_SetScriptFlag($00)                                            ;B4DA63
    %AICMD0x13_Wait(96)                                        ;B4DA65
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4DA68
    %AICMD0x13_Wait(30)                                        ;B4DA6A
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4DA6D
    %AICMD0x13_Wait(30)                                        ;B4DA6F
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 32)                    ;B4DA72
    %AICMD0x13_Wait(60)                                        ;B4DA76
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 64)                  ;B4DA79
    %AICMD0x13_Wait(60)                                        ;B4DA7D
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 16)                  ;B4DA80
    %AICMD0x13_Wait(30)                                        ;B4DA84
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 96)                 ;B4DA87
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B4DA8B
    %AICMD0x3D_TeleportToArea(!AREA_ENDING00)                  ;B4DA8D
    %AICMD0x10_End()                                           ;B4DA8F
pAIScripting0x3B_L001:
    %AICMD0x1A($0098, $01E8, aAIScriptingData_L071, $00)                     ;B4DA90
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B4DA98
    %AICMD0x1B($02E5, $00)                                     ;B4DA9A
    %AICMD0x0D($00, $FF, $60, $01)                             ;B4DA9E
    %AICMD0x1B($02E7, $00)                                     ;B4DAA3
    %AICMD0x13_Wait(30)                                        ;B4DAA7
    %AICMD0x1B($02E7, $01)                                     ;B4DAAA
    %AICMD0x13_Wait(30)                                        ;B4DAAE
    %AICMD0x1B($02E5, $00)                                     ;B4DAB1
    %AICMD0x0D($00, $FF, $20, $01)                             ;B4DAB5
    %AICMD0x1B($02E7, $00)                                     ;B4DABA
    %AICMD0x13_Wait(80)                                        ;B4DABE
    %AICMD0x1B($02E7, $01)                                     ;B4DAC1
    %AICMD0x0D($01, $00, $30, $01)                             ;B4DAC5
    %AICMD0x13_Wait(30)                                        ;B4DACA
    %AICMD0x09_StartScript($02, pAIScripting0x3B_L003)                                   ;B4DACD
    %AICMD0x13_Wait(30)                                        ;B4DAD1
    %AICMD0x1B($0233, $01)                                     ;B4DAD4
    %AICMD0x13_Wait(60)                                        ;B4DAD8
    %AICMD0x1B($02E3, $00)                                     ;B4DADB
    %AICMD0x0D($00, $01, $10, $01)                             ;B4DADF
    %AICMD0x1B($02E7, $00)                                     ;B4DAE4
    %AICMD0x0D($FF, $00, $10, $01)                             ;B4DAE8
    %AICMD0x1B($0233, $00)                                     ;B4DAED
    %AICMD0x13_Wait(120)                                       ;B4DAF1
    %AICMD0x0B_SetScriptFlag($01)                                            ;B4DAF4
pAIScripting0x3B_L002:
    %AICMD0x13_Wait(1)                                         ;B4DAF6
    %AICMD0x12_Jump(pAIScripting0x3B_L002)                                   ;B4DAF9
pAIScripting0x3B_L003:
    %AICMD0x1A($00D8, $0168, aAIScriptingData_L201, $00)                     ;B4DAFC
pAIScripting0x3B_L004:
    %AICMD0x13_Wait(1)                                         ;B4DB04
    %AICMD0x12_Jump(pAIScripting0x3B_L004)                                   ;B4DB07


DATA8_B4DB0A:
    %AICMD0x00_SetMusic($10, $B4)                              ;B4DB0A
    %AICMD0x02_FreezeTime()                                    ;B4DB0D
    %AICMD0x03_SetHour($07)                                    ;B4DB0E
    %AICMD0x05_SetTransferPosition(296, 872)                   ;B4DB10
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4DB15
    %AICMD0x08_EnableAIControl()                               ;B4DB17
    %AICMD0x09_StartScript($01, pAIScripting0x3B_L005)                                   ;B4DB18
    %AICMD0x09_StartScript($02, pAIScripting0x3B_L011)                                   ;B4DB1C
    %AICMD0x09_StartScript($03, pAIScripting0x3B_L007)                                   ;B4DB20
    %AICMD0x09_StartScript($04, pAIScripting0x3B_L009)                                   ;B4DB24
    %AICMD0x09_StartScript($05, pAIScripting0x3B_L013)                                   ;B4DB28
    %AICMD0x06_SetDestinationArea(!AREA_TOWNSUMMER)            ;B4DB2C
    %AICMD0x38_WaitForFadeIn()                                               ;B4DB2E
    %AICMD0x13_Wait(90)                                        ;B4DB2F
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 32)                 ;B4DB32
    %AICMD0x13_Wait(20)                                        ;B4DB36
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 144)                   ;B4DB39
    %AICMD0x13_Wait(20)                                        ;B4DB3D
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 32)                  ;B4DB40
    %AICMD0x13_Wait(20)                                        ;B4DB44
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 160)                   ;B4DB47
    %AICMD0x0B_SetScriptFlag($00)                                            ;B4DB4B
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B4DB4D
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4DB4F
    %AICMD0x13_Wait(60)                                        ;B4DB51
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 16)                    ;B4DB54
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 80)                 ;B4DB58
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 240)                   ;B4DB5C
    %AICMD0x13_Wait(60)                                        ;B4DB60
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 112)                   ;B4DB63
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4DB67
    %AICMD0x13_Wait(120)                                       ;B4DB69
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B4DB6C
    %AICMD0x19($0021, $00)                                     ;B4DB6E
    %AICMD0x13_Wait(80)                                        ;B4DB72
    %AICMD0x19($0001, $00)                                     ;B4DB75
    %AICMD0x13_Wait(10)                                        ;B4DB79
    %AICMD0x19($0021, $00)                                     ;B4DB7C
    %AICMD0x13_Wait(180)                                       ;B4DB80
    %AICMD0x3D_TeleportToArea(!AREA_ENDING00)                  ;B4DB83
    %AICMD0x10_End()                                           ;B4DB85
pAIScripting0x3B_L005:
    %AICMD0x1A($0118, $0368, aAIScriptingData_L071, $00)                     ;B4DB86
    %AICMD0x13_Wait(120)                                       ;B4DB8E
    %AICMD0x1B($02E7, $01)                                     ;B4DB91
    %AICMD0x0D($01, $00, $20, $01)                             ;B4DB95
    %AICMD0x13_Wait(20)                                        ;B4DB9A
    %AICMD0x1B($02E7, $01)                                     ;B4DB9D
    %AICMD0x0D($01, $00, $10, $01)                             ;B4DBA1
    %AICMD0x13_Wait(20)                                        ;B4DBA6
    %AICMD0x1B($02E5, $00)                                     ;B4DBA9
    %AICMD0x0D($00, $FF, $90, $01)                             ;B4DBAD
    %AICMD0x13_Wait(20)                                        ;B4DBB2
    %AICMD0x1B($02E7, $00)                                     ;B4DBB5
    %AICMD0x0D($FF, $00, $10, $01)                             ;B4DBB9
    %AICMD0x13_Wait(20)                                        ;B4DBBE
    %AICMD0x1B($02E5, $00)                                     ;B4DBC1
    %AICMD0x0D($00, $FF, $A0, $01)                             ;B4DBC5
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B4DBCA
    %AICMD0x1B($02E6, $00)                                     ;B4DBCC
    %AICMD0x13_Wait(60)                                        ;B4DBD0
    %AICMD0x1B($02E5, $00)                                     ;B4DBD3
    %AICMD0x13_Wait(60)                                        ;B4DBD7
    %AICMD0x1B($02E7, $01)                                     ;B4DBDA
    %AICMD0x0D($01, $00, $30, $01)                             ;B4DBDE
    %AICMD0x1B($02E5, $00)                                     ;B4DBE3
    %AICMD0x0D($00, $FF, $FF, $01)                             ;B4DBE7
    %AICMD0x13_Wait(60)                                        ;B4DBEC
    %AICMD0x1B($02E5, $00)                                     ;B4DBEF
    %AICMD0x0D($00, $FF, $78, $01)                             ;B4DBF3
    %AICMD0x1B($02E6, $01)                                     ;B4DBF8
    %AICMD0x13_Wait(120)                                       ;B4DBFC
    %AICMD0x1B($02E7, $00)                                     ;B4DBFF
    %AICMD0x0D($FF, $00, $10, $01)                             ;B4DC03
    %AICMD0x1B($02E5, $00)                                     ;B4DC08
    %AICMD0x0D($00, $FF, $18, $01)                             ;B4DC0C
    %AICMD0x1B($0233, $01)                                     ;B4DC11
    %AICMD0x13_Wait(180)                                       ;B4DC15
pAIScripting0x3B_L006:
    %AICMD0x13_Wait(1)                                         ;B4DC18
    %AICMD0x12_Jump(pAIScripting0x3B_L006)                                   ;B4DC1B
pAIScripting0x3B_L007:
    %AICMD0x1A($0168, $00A8, aAIScriptingData_L046, $00)                     ;B4DC1E
pAIScripting0x3B_L008:
    %AICMD0x1B($029A, $01)                                     ;B4DC26
    %AICMD0x13_Wait(60)                                        ;B4DC2A
    %AICMD0x1B($029C, $00)                                     ;B4DC2D
    %AICMD0x13_Wait(180)                                       ;B4DC31
    %AICMD0x12_Jump(pAIScripting0x3B_L008)                                   ;B4DC34
pAIScripting0x3B_L009:
    %AICMD0x1A($0178, $00A8, aAIScriptingData_L064, $00)                     ;B4DC37
pAIScripting0x3B_L010:
    %AICMD0x1B($02D0, $00)                                     ;B4DC3F
    %AICMD0x13_Wait(60)                                        ;B4DC43
    %AICMD0x1B($02CC, $00)                                     ;B4DC46
    %AICMD0x13_Wait(180)                                       ;B4DC4A
    %AICMD0x12_Jump(pAIScripting0x3B_L010)                                   ;B4DC4D
pAIScripting0x3B_L011:
    %AICMD0x1A($0148, $00B8, aAIScriptingData_L051, $02)                     ;B4DC50
pAIScripting0x3B_L012:
    %AICMD0x1B($02A5, $00)                                     ;B4DC58
    %AICMD0x13_Wait(120)                                       ;B4DC5C
    %AICMD0x1B($02A6, $00)                                     ;B4DC5F
    %AICMD0x13_Wait(120)                                       ;B4DC63
    %AICMD0x12_Jump(pAIScripting0x3B_L012)                                   ;B4DC66
pAIScripting0x3B_L013:
    %AICMD0x1A($01B8, $0218, aAIScriptingData_L020, $03)                     ;B4DC69
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B4DC71
    %AICMD0x0D($FF, $00, $80, $01)                             ;B4DC73
    %AICMD0x1B($024C, $00)                                     ;B4DC78
    %AICMD0x0D($00, $01, $08, $01)                             ;B4DC7C
    %AICMD0x1B($0351, $00)                                     ;B4DC81
    %AICMD0x13_Wait(120)                                       ;B4DC85
    %AICMD0x1B($024E, $00)                                     ;B4DC88
    %AICMD0x0D($00, $FF, $18, $01)                             ;B4DC8C
    %AICMD0x1B($0250, $01)                                     ;B4DC91
    %AICMD0x0D($01, $00, $30, $01)                             ;B4DC95
    %AICMD0x1B($024E, $00)                                     ;B4DC9A
    %AICMD0x0D($00, $FF, $50, $01)                             ;B4DC9E
    %AICMD0x0B_SetScriptFlag($01)                                            ;B4DCA3
    %AICMD0x1B($024E, $00)                                     ;B4DCA5
    %AICMD0x0D($00, $FF, $B4, $01)                             ;B4DCA9
    %AICMD0x1B($0250, $01)                                     ;B4DCAE
    %AICMD0x0D($01, $00, $20, $01)                             ;B4DCB2
    %AICMD0x1B($024E, $00)                                     ;B4DCB7
    %AICMD0x0D($00, $FF, $50, $01)                             ;B4DCBB
    %AICMD0x1B($0250, $00)                                     ;B4DCC0
    %AICMD0x13_Wait(180)                                       ;B4DCC4
pAIScripting0x3B_L014:
    %AICMD0x13_Wait(1)                                         ;B4DCC7
    %AICMD0x12_Jump(pAIScripting0x3B_L014)                                   ;B4DCCA


pAIScripting0x3C:
    dw DATA8_B4DCED                                            ;B4DCCD|        |B4DCED;
    dw DATA8_B4DE3E                                            ;B4DCCF|        |B4DE3E;
    dw pAIScripting0x3D                                        ;B4DCD1|        |B4DF94;
    dw pAIScripting0x3D                                        ;B4DCD3|        |B4DF94;
    dw pAIScripting0x3D                                        ;B4DCD5|        |B4DF94;
    dw pAIScripting0x3D                                        ;B4DCD7|        |B4DF94;
    dw pAIScripting0x3D                                        ;B4DCD9|        |B4DF94;
    dw pAIScripting0x3D                                        ;B4DCDB|        |B4DF94;
    dw pAIScripting0x3D                                        ;B4DCDD|        |B4DF94;
    dw pAIScripting0x3D                                        ;B4DCDF|        |B4DF94;
    dw pAIScripting0x3D                                        ;B4DCE1|        |B4DF94;
    dw pAIScripting0x3D                                        ;B4DCE3|        |B4DF94;
    dw pAIScripting0x3D                                        ;B4DCE5|        |B4DF94;
    dw pAIScripting0x3D                                        ;B4DCE7|        |B4DF94;
    dw pAIScripting0x3D                                        ;B4DCE9|        |B4DF94;
    dw pAIScripting0x3D                                        ;B4DCEB|        |B4DF94;
 
DATA8_B4DCED:
 
    %AICMD0x00_SetMusic($10, $B4)                              ;B4DCED
    %AICMD0x02_FreezeTime()                                    ;B4DCF0
    %AICMD0x03_SetHour($06)                                    ;B4DCF1
    %AICMD0x05_SetTransferPosition(65528, 104)                 ;B4DCF3
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4DCF8
    %AICMD0x40_DisableTileInteractions()                       ;B4DCFA
    %AICMD0x08_EnableAIControl()                               ;B4DCFB
    %AICMD0x09_StartScript($01, pAIScripting0x3C_L001)                                   ;B4DCFC
    %AICMD0x09_StartScript($02, pAIScripting0x3C_L003)                                   ;B4DD00
    %AICMD0x09_StartScript($03, pAIScripting0x3C_L007)                                   ;B4DD04
    %AICMD0x06_SetDestinationArea(!AREA_ENDING04)              ;B4DD08
    %AICMD0x38_WaitForFadeIn()                                               ;B4DD0A
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B4DD0B
    %AICMD0x13_Wait(20)                                        ;B4DD0D
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 96)                 ;B4DD10
    %AICMD0x13_Wait(20)                                        ;B4DD14
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 32)                    ;B4DD17
    %AICMD0x13_Wait(30)                                        ;B4DD1B
    %AICMD0x19($0071, $00)                                     ;B4DD1E
    %AICMD0x13_Wait(60)                                        ;B4DD22
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 32)                  ;B4DD25
    %AICMD0x13_Wait(20)                                        ;B4DD29
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 16)                 ;B4DD2C
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4DD30
    %AICMD0x13_Wait(30)                                        ;B4DD32
    %AICMD0x19($006A, $00)                                     ;B4DD35
    %AICMD0x13_Wait(80)                                        ;B4DD39
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4DD3C
    %AICMD0x13_Wait(20)                                        ;B4DD3E
    %AICMD0x19($006A, $00)                                     ;B4DD41
    %AICMD0x13_Wait(180)                                       ;B4DD45
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B4DD48
    %AICMD0x3D_TeleportToArea(!AREA_ENDING00)                  ;B4DD4A
    %AICMD0x10_End()                                           ;B4DD4C
pAIScripting0x3C_L001:
    %AICMD0x1A($0068, $0098, aAIScriptingData_L004, $02)                     ;B4DD4D
pAIScripting0x3C_L002:
    %AICMD0x1B($01F8, $01)                                     ;B4DD55
    %AICMD0x13_Wait(180)                                       ;B4DD59
    %AICMD0x1B($01EE, $01)                                     ;B4DD5C
    %AICMD0x13_Wait(120)                                       ;B4DD60
    %AICMD0x1B($01EB, $01)                                     ;B4DD63
    %AICMD0x13_Wait(120)                                       ;B4DD67
    %AICMD0x1B($01EF, $01)                                     ;B4DD6A
    %AICMD0x13_Wait(120)                                       ;B4DD6E
    %AICMD0x12_Jump(pAIScripting0x3C_L002)                                   ;B4DD71
pAIScripting0x3C_L003:
    %AICMD0x1A($0098, $0068, aAIScriptingData_L073, $00)                     ;B4DD74
    %AICMD0x13_Wait(120)                                       ;B4DD7C
    %AICMD0x0D($00, $01, $20, $01)                             ;B4DD7F
    %AICMD0x13_Wait(60)                                        ;B4DD84
    %AICMD0x1B($02E6, $00)                                     ;B4DD87
    %AICMD0x13_Wait(60)                                        ;B4DD8B
    %AICMD0x1B($02ED, $00)                                     ;B4DD8E
    %AICMD0x13_Wait(180)                                       ;B4DD92
    %AICMD0x1B($02E5, $00)                                     ;B4DD95
    %AICMD0x0D($00, $FF, $20, $01)                             ;B4DD99
    %AICMD0x13_Wait(120)                                       ;B4DD9E
    %AICMD0x1B($02E6, $00)                                     ;B4DDA1
    %AICMD0x13_Wait(60)                                        ;B4DDA5
    %AICMD0x1B($0233, $00)                                     ;B4DDA8
    %AICMD0x0B_SetScriptFlag($00)                                            ;B4DDAC
    %AICMD0x13_Wait(240)                                       ;B4DDAE
    %AICMD0x1B($02E7, $00)                                     ;B4DDB1
    %AICMD0x0D($FF, $00, $10, $01)                             ;B4DDB5
    %AICMD0x13_Wait(60)                                        ;B4DDBA
    %AICMD0x1B($02ED, $00)                                     ;B4DDBD
    %AICMD0x13_Wait(60)                                        ;B4DDC1
    %AICMD0x09_StartScript($04, pAIScripting0x3C_L005)                                   ;B4DDC4
    %AICMD0x1B($02E7, $00)                                     ;B4DDC8
    %AICMD0x13_Wait(120)                                       ;B4DDCC
    %AICMD0x1B($02E7, $01)                                     ;B4DDCF
    %AICMD0x0D($01, $00, $20, $01)                             ;B4DDD3
    %AICMD0x1B($0258, $01)                                     ;B4DDD8
    %AICMD0x13_Wait(180)                                       ;B4DDDC
    %AICMD0x1B($02E7, $00)                                     ;B4DDDF
    %AICMD0x0D($FF, $00, $20, $01)                             ;B4DDE3
    %AICMD0x1B($0258, $00)                                     ;B4DDE8
    %AICMD0x13_Wait(180)                                       ;B4DDEC
    %AICMD0x0B_SetScriptFlag($01)                                            ;B4DDEF
pAIScripting0x3C_L004:
    %AICMD0x13_Wait(1)                                         ;B4DDF1
    %AICMD0x12_Jump(pAIScripting0x3C_L004)                                   ;B4DDF4
pAIScripting0x3C_L005:
    %AICMD0x1A($0078, $006A, aAIScriptingData_L084, $02)                     ;B4DDF7
    %AICMD0x1B($0313, $01)                                     ;B4DDFF
    %AICMD0x0D($08, $F8, $02, $01)                             ;B4DE03
    %AICMD0x13_Wait(118)                                       ;B4DE08
    %AICMD0x1B($0313, $01)                                     ;B4DE0B
    %AICMD0x0D($01, $00, $20, $01)                             ;B4DE0F
    %AICMD0x13_Wait(180)                                       ;B4DE14
    %AICMD0x1B($0313, $00)                                     ;B4DE17
    %AICMD0x0D($FF, $00, $20, $01)                             ;B4DE1B
    %AICMD0x13_Wait(180)                                       ;B4DE20
pAIScripting0x3C_L006:
    %AICMD0x13_Wait(1)                                         ;B4DE23
    %AICMD0x12_Jump(pAIScripting0x3C_L006)                                   ;B4DE26
pAIScripting0x3C_L007:
    %AICMD0x1A($0078, $0098, aAIScriptingData_L064, $03)                     ;B4DE29
    %AICMD0x13_Wait(360)                                       ;B4DE31
    %AICMD0x1B($02D1, $00)                                     ;B4DE34
pAIScripting0x3C_L008:
    %AICMD0x13_Wait(1)                                         ;B4DE38
    %AICMD0x12_Jump(pAIScripting0x3C_L008)                                   ;B4DE3B


DATA8_B4DE3E:
    %AICMD0x00_SetMusic($10, $B4)                              ;B4DE3E
    %AICMD0x02_FreezeTime()                                    ;B4DE41
    %AICMD0x03_SetHour($07)                                    ;B4DE42
    %AICMD0x40_DisableTileInteractions()                       ;B4DE44
    %AICMD0x05_SetTransferPosition(136, 648)                   ;B4DE45
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4DE4A
    %AICMD0x08_EnableAIControl()                               ;B4DE4C
    %AICMD0x09_StartScript($01, pAIScripting0x3C_L009)                                   ;B4DE4D
    %AICMD0x09_StartScript($02, pAIScripting0x3C_L017)                                   ;B4DE51
    %AICMD0x09_StartScript($03, pAIScripting0x3C_L015)                                   ;B4DE55
    %AICMD0x09_StartScript($04, pAIScripting0x3C_L019)                                   ;B4DE59
    %AICMD0x06_SetDestinationArea(!AREA_WOODSSPRING)           ;B4DE5D
    %AICMD0x38_WaitForFadeIn()                                               ;B4DE5F
    %AICMD0x13_Wait(80)                                        ;B4DE60
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4DE63
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B4DE65
    %AICMD0x13_Wait(180)                                       ;B4DE67
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 64)                 ;B4DE6A
    %AICMD0x13_Wait(10)                                        ;B4DE6E
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B4DE71
    %AICMD0x13_Wait(30)                                        ;B4DE73
    %AICMD0x09_StartScript($05, pAIScripting0x3C_L020)                                   ;B4DE76
    %AICMD0x0C_WaitForScriptFlag($02)                                            ;B4DE7A
    %AICMD0x13_Wait(20)                                        ;B4DE7C
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4DE7F
    %AICMD0x13_Wait(50)                                        ;B4DE81
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 24)                   ;B4DE84
    %AICMD0x4E_EnableTileInteractions()                                               ;B4DE88
    %AICMD0x19($0023, $00)                                     ;B4DE89
    %AICMD0x13_Wait(60)                                        ;B4DE8D
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4DE90
    %AICMD0x13_Wait(60)                                        ;B4DE92
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4DE95
    %AICMD0x13_Wait(30)                                        ;B4DE97
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4DE9A
    %AICMD0x13_Wait(30)                                        ;B4DE9C
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4DE9F
    %AICMD0x13_Wait(30)                                        ;B4DEA1
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4DEA4
    %AICMD0x13_Wait(30)                                        ;B4DEA6
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4DEA9
    %AICMD0x13_Wait(180)                                       ;B4DEAB
    %AICMD0x3D_TeleportToArea(!AREA_ENDING00)                  ;B4DEAE
    %AICMD0x10_End()                                           ;B4DEB0
pAIScripting0x3C_L009:
    %AICMD0x1A($00A8, $0298, aAIScriptingData_L073, $03)                     ;B4DEB1
    %AICMD0x13_Wait(60)                                        ;B4DEB9
    %AICMD0x0B_SetScriptFlag($00)                                            ;B4DEBC
    %AICMD0x09_StartScript($06, pAIScripting0x3C_L013)                                   ;B4DEBE
    %AICMD0x1B($02E7, $01)                                     ;B4DEC2
    %AICMD0x0D($01, $00, $20, $01)                             ;B4DEC6
    %AICMD0x1B($02E6, $00)                                     ;B4DECB
    %AICMD0x13_Wait(30)                                        ;B4DECF
    %AICMD0x1B($02E5, $00)                                     ;B4DED2
    %AICMD0x0D($00, $FF, $20, $01)                             ;B4DED6
    %AICMD0x1B($02E7, $01)                                     ;B4DEDB
    %AICMD0x0D($01, $00, $90, $01)                             ;B4DEDF
    %AICMD0x0C_WaitForScriptFlag($02)                                            ;B4DEE4
    %AICMD0x13_Wait(60)                                        ;B4DEE6
    %AICMD0x09_StartScript($07, pAIScripting0x3C_L011)                                   ;B4DEE9
    %AICMD0x1B($02E7, $00)                                     ;B4DEED
    %AICMD0x0D($FF, $00, $90, $01)                             ;B4DEF1
    %AICMD0x1B($02E3, $00)                                     ;B4DEF6
    %AICMD0x0D($00, $01, $0E, $01)                             ;B4DEFA
    %AICMD0x1B($02E7, $00)                                     ;B4DEFF
    %AICMD0x13_Wait(60)                                        ;B4DF03
    %AICMD0x1B($0258, $00)                                     ;B4DF06
    %AICMD0x13_Wait(120)                                       ;B4DF0A
pAIScripting0x3C_L010:
    %AICMD0x13_Wait(1)                                         ;B4DF0D
    %AICMD0x12_Jump(pAIScripting0x3C_L010)                                   ;B4DF10
pAIScripting0x3C_L011:
    %AICMD0x1A($0158, $0264, aAIScriptingData_L213, $00)                     ;B4DF13
    %AICMD0x0D($FF, $00, $90, $01)                             ;B4DF1B
    %AICMD0x0D($00, $01, $0E, $01)                             ;B4DF20
    %AICMD0x13_Wait(180)                                       ;B4DF25
pAIScripting0x3C_L012:
    %AICMD0x13_Wait(1)                                         ;B4DF28
    %AICMD0x12_Jump(pAIScripting0x3C_L012)                                   ;B4DF2B
pAIScripting0x3C_L013:
    %AICMD0x1A($00C8, $0248, aAIScriptingData_L083, $00)                     ;B4DF2E
    %AICMD0x13_Wait(30)                                        ;B4DF36
pAIScripting0x3C_L014:
    %AICMD0x0D($01, $00, $08, $02)                             ;B4DF39
    %AICMD0x0D($00, $FF, $06, $02)                             ;B4DF3E
    %AICMD0x0D($FF, $00, $08, $02)                             ;B4DF43
    %AICMD0x0D($01, $00, $08, $02)                             ;B4DF48
    %AICMD0x12_Jump(pAIScripting0x3C_L014)                                   ;B4DF4D
pAIScripting0x3C_L015:
    %AICMD0x1A($0094, $0298, aAIScriptingData_L186, $00)                     ;B4DF50
pAIScripting0x3C_L016:
    %AICMD0x13_Wait(1)                                         ;B4DF58
    %AICMD0x12_Jump(pAIScripting0x3C_L016)                                   ;B4DF5B
pAIScripting0x3C_L017:
    %AICMD0x1A($0092, $02A0, aAIScriptingData_L010, $00)                     ;B4DF5E
pAIScripting0x3C_L018:
    %AICMD0x13_Wait(1)                                         ;B4DF66
    %AICMD0x12_Jump(pAIScripting0x3C_L018)                                   ;B4DF69
pAIScripting0x3C_L019:
    %AICMD0x1A($0088, $0298, aAIScriptingData_L184, $00)                     ;B4DF6C
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B4DF74
    %AICMD0x0D($F0, $F0, $01, $01)                             ;B4DF76
    %AICMD0x13_Wait(60)                                        ;B4DF7B
    %AICMD0x37()                                               ;B4DF7E
    %AICMD0x10_End()                                           ;B4DF7F
pAIScripting0x3C_L020:
    %AICMD0x1A($0078, $0298, aAIScriptingData_L088, $00)                     ;B4DF80
    %AICMD0x13_Wait(60)                                        ;B4DF88
    %AICMD0x0B_SetScriptFlag($01)                                            ;B4DF8B
    %AICMD0x13_Wait(60)                                        ;B4DF8D
    %AICMD0x0B_SetScriptFlag($02)                                            ;B4DF90
    %AICMD0x37()                                               ;B4DF92
    %AICMD0x10_End()                                           ;B4DF93


pAIScripting0x3D:
    dw DATA8_B4DFB4                                            ;B4DF94|        |B4DFB4;
    dw DATA8_B4E0F8                                            ;B4DF96|        |B4E0F8;
    dw pAIScripting0x3E                                        ;B4DF98|        |B4E200;
    dw pAIScripting0x3E                                        ;B4DF9A|        |B4E200;
    dw pAIScripting0x3E                                        ;B4DF9C|        |B4E200;
    dw pAIScripting0x3E                                        ;B4DF9E|        |B4E200;
    dw pAIScripting0x3E                                        ;B4DFA0|        |B4E200;
    dw pAIScripting0x3E                                        ;B4DFA2|        |B4E200;
    dw pAIScripting0x3E                                        ;B4DFA4|        |B4E200;
    dw pAIScripting0x3E                                        ;B4DFA6|        |B4E200;
    dw pAIScripting0x3E                                        ;B4DFA8|        |B4E200;
    dw pAIScripting0x3E                                        ;B4DFAA|        |B4E200;
    dw pAIScripting0x3E                                        ;B4DFAC|        |B4E200;
    dw pAIScripting0x3E                                        ;B4DFAE|        |B4E200;
    dw pAIScripting0x3E                                        ;B4DFB0|        |B4E200;
    dw pAIScripting0x3E                                        ;B4DFB2|        |B4E200;
 
DATA8_B4DFB4:
 
    %AICMD0x00_SetMusic($10, $B4)                              ;B4DFB4
    %AICMD0x02_FreezeTime()                                    ;B4DFB7
    %AICMD0x03_SetHour($06)                                    ;B4DFB8
    %AICMD0x05_SetTransferPosition(24, 152)                    ;B4DFBA
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4DFBF
    %AICMD0x40_DisableTileInteractions()                       ;B4DFC1
    %AICMD0x08_EnableAIControl()                               ;B4DFC2
    %AICMD0x09_StartScript($01, pAIScripting0x3D_L001)                                   ;B4DFC3
    %AICMD0x09_StartScript($02, pAIScripting0x3D_L005)                                   ;B4DFC7
    %AICMD0x06_SetDestinationArea(!AREA_ENDING06)              ;B4DFCB
    %AICMD0x38_WaitForFadeIn()                                               ;B4DFCD
    %AICMD0x13_Wait(120)                                       ;B4DFCE
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 56)                  ;B4DFD1
    %AICMD0x0B_SetScriptFlag($00)                                            ;B4DFD5
    %AICMD0x19($0052, $00)                                     ;B4DFD7
    %AICMD0x13_Wait(80)                                        ;B4DFDB
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 16)                 ;B4DFDE
    %AICMD0x19($0052, $00)                                     ;B4DFE2
    %AICMD0x13_Wait(80)                                        ;B4DFE6
    %AICMD0x19($0041, $00)                                     ;B4DFE9
    %AICMD0x13_Wait(60)                                        ;B4DFED
    %AICMD0x0B_SetScriptFlag($01)                                            ;B4DFF0
    %AICMD0x13_Wait(60)                                        ;B4DFF2
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B4DFF5
    %AICMD0x13_Wait(180)                                       ;B4DFF7
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 80)                  ;B4DFFA
    %AICMD0x13_Wait(180)                                       ;B4DFFE
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B4E001
    %AICMD0x13_Wait(180)                                       ;B4E003
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 48)                 ;B4E006
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B4E00A
    %AICMD0x0C_WaitForScriptFlag($02)                                            ;B4E00C
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 32)                    ;B4E00E
    %AICMD0x3D_TeleportToArea(!AREA_ENDING00)                  ;B4E012
    %AICMD0x10_End()                                           ;B4E014
pAIScripting0x3D_L001:
    %AICMD0x1A($FFCE, $0038, aAIScriptingData_L073, $02)                     ;B4E015
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B4E01D
    %AICMD0x1B($044A, $01)                                     ;B4E01F
    %AICMD0x0D($01, $00, $A0, $01)                             ;B4E023
    %AICMD0x13_Wait(80)                                        ;B4E028
    %AICMD0x1B($044A, $00)                                     ;B4E02B
    %AICMD0x0D($FF, $00, $A0, $01)                             ;B4E02F
    %AICMD0x0D($00, $01, $30, $01)                             ;B4E034
    %AICMD0x13_Wait(30)                                        ;B4E039
    %AICMD0x1B($044A, $01)                                     ;B4E03C
    %AICMD0x0D($01, $00, $80, $01)                             ;B4E040
    %AICMD0x13_Wait(60)                                        ;B4E045
    %AICMD0x1B($044A, $01)                                     ;B4E048
    %AICMD0x0D($01, $00, $40, $01)                             ;B4E04C
    %AICMD0x1B($0448, $01)                                     ;B4E051
    %AICMD0x13_Wait(60)                                        ;B4E055
    %AICMD0x09_StartScript($03, pAIScripting0x3D_L003)                                   ;B4E058
    %AICMD0x1B($0258, $00)                                     ;B4E05C
    %AICMD0x0D($F8, $F8, $01, $01)                             ;B4E060
    %AICMD0x1B($0258, $00)                                     ;B4E065
    %AICMD0x0D($FA, $06, $02, $01)                             ;B4E069
    %AICMD0x13_Wait(60)                                        ;B4E06E
    %AICMD0x0B_SetScriptFlag($02)                                            ;B4E071
    %AICMD0x1B($02E8, $00)                                     ;B4E073
    %AICMD0x13_Wait(60)                                        ;B4E077
    %AICMD0x1B($02E3, $00)                                     ;B4E07A
    %AICMD0x0D($00, $01, $10, $01)                             ;B4E07E
pAIScripting0x3D_L002:
    %AICMD0x13_Wait(1)                                         ;B4E083
    %AICMD0x12_Jump(pAIScripting0x3D_L002)                                   ;B4E086
pAIScripting0x3D_L003:
    %AICMD0x1A($0090, $0068, aAIScriptingData_L006, $02)                     ;B4E089
pAIScripting0x3D_L004:
    %AICMD0x1B($0203, $01)                                     ;B4E091
    %AICMD0x13_Wait(120)                                       ;B4E095
    %AICMD0x1B($0201, $01)                                     ;B4E098
    %AICMD0x13_Wait(240)                                       ;B4E09C
    %AICMD0x1B($0205, $01)                                     ;B4E09F
    %AICMD0x13_Wait(180)                                       ;B4E0A3
    %AICMD0x12_Jump(pAIScripting0x3D_L004)                                   ;B4E0A6
pAIScripting0x3D_L005:
    %AICMD0x1A($0048, $0088, aAIScriptingData_L004, $02)                     ;B4E0A9
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B4E0B1
    %AICMD0x1B($01EC, $01)                                     ;B4E0B3
    %AICMD0x0D($01, $00, $48, $01)                             ;B4E0B7
    %AICMD0x13_Wait(60)                                        ;B4E0BC
    %AICMD0x1B($01F2, $00)                                     ;B4E0BF
    %AICMD0x13_Wait(120)                                       ;B4E0C3
    %AICMD0x1B($01E8, $00)                                     ;B4E0C6
    %AICMD0x13_Wait(60)                                        ;B4E0CA
    %AICMD0x1B($01F6, $00)                                     ;B4E0CD
    %AICMD0x13_Wait(90)                                        ;B4E0D1
    %AICMD0x1B($01F3, $00)                                     ;B4E0D4
    %AICMD0x13_Wait(180)                                       ;B4E0D8
    %AICMD0x1B($01EC, $00)                                     ;B4E0DB
    %AICMD0x0D($FF, $00, $4A, $01)                             ;B4E0DF
    %AICMD0x13_Wait(60)                                        ;B4E0E4
pAIScripting0x3D_L006:
    %AICMD0x1B($01F8, $00)                                     ;B4E0E7
    %AICMD0x13_Wait(240)                                       ;B4E0EB
    %AICMD0x1B($01EA, $01)                                     ;B4E0EE
    %AICMD0x13_Wait(180)                                       ;B4E0F2
    %AICMD0x12_Jump(pAIScripting0x3D_L006)                                   ;B4E0F5


DATA8_B4E0F8:
    %AICMD0x00_SetMusic($10, $B4)                              ;B4E0F8
    %AICMD0x02_FreezeTime()                                    ;B4E0FB
    %AICMD0x03_SetHour($07)                                    ;B4E0FC
    %AICMD0x05_SetTransferPosition(632, 504)                   ;B4E0FE
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4E103
    %AICMD0x08_EnableAIControl()                               ;B4E105
    %AICMD0x09_StartScript($01, pAIScripting0x3D_L007)                                   ;B4E106
    %AICMD0x09_StartScript($02, pAIScripting0x3D_L011)                                   ;B4E10A
    %AICMD0x09_StartScript($03, pAIScripting0x3D_L009)                                   ;B4E10E
    %AICMD0x09_StartScript($04, pAIScripting0x3D_L013)                                   ;B4E112
    %AICMD0x06_SetDestinationArea(!AREA_WOODSSUMMER)           ;B4E116
    %AICMD0x38_WaitForFadeIn()                                               ;B4E118
    %AICMD0x13_Wait(30)                                        ;B4E119
    %AICMD0x0B_SetScriptFlag($00)                                            ;B4E11C
    %AICMD0x19($004A, $00)                                     ;B4E11E
    %AICMD0x13_Wait(120)                                       ;B4E122
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B4E125
    %AICMD0x19($0041, $00)                                     ;B4E127
    %AICMD0x13_Wait(80)                                        ;B4E12B
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 24)                  ;B4E12E
    %AICMD0x13_Wait(20)                                        ;B4E132
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 16)                  ;B4E135
    %AICMD0x13_Wait(20)                                        ;B4E139
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4E13C
    %AICMD0x0B_SetScriptFlag($02)                                            ;B4E13E
    %AICMD0x0C_WaitForScriptFlag($03)                                            ;B4E140
    %AICMD0x19($0023, $00)                                     ;B4E142
    %AICMD0x13_Wait(120)                                       ;B4E146
    %AICMD0x3D_TeleportToArea(!AREA_ENDING00)                  ;B4E149
    %AICMD0x10_End()                                           ;B4E14B
pAIScripting0x3D_L007:
    %AICMD0x1A($01CC, $01A8, aAIScriptingData_L091, $02)                     ;B4E14C
    %AICMD0x0C_WaitForScriptFlag($02)                                            ;B4E154
    %AICMD0x1B($0320, $01)                                     ;B4E156
    %AICMD0x0D($02, $01, $40, $02)                             ;B4E15A
    %AICMD0x0D($01, $00, $10, $01)                             ;B4E15F
    %AICMD0x0D($00, $0A, $01, $01)                             ;B4E164
    %AICMD0x0D($01, $01, $1E, $02)                             ;B4E169
    %AICMD0x13_Wait(30)                                        ;B4E16E
    %AICMD0x0B_SetScriptFlag($03)                                            ;B4E171
    %AICMD0x13_Wait(30)                                        ;B4E173
    %AICMD0x1B($031E, $01)                                     ;B4E176
pAIScripting0x3D_L008:
    %AICMD0x13_Wait(1)                                         ;B4E17A
    %AICMD0x12_Jump(pAIScripting0x3D_L008)                                   ;B4E17D
pAIScripting0x3D_L009:
    %AICMD0x1A($02B0, $0218, aAIScriptingData_L054, $01)                     ;B4E180
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B4E188
    %AICMD0x13_Wait(60)                                        ;B4E18A
    %AICMD0x0D($00, $FF, $20, $01)                             ;B4E18D
    %AICMD0x13_Wait(60)                                        ;B4E192
    %AICMD0x1B($02B0, $00)                                     ;B4E195
    %AICMD0x0D($FF, $00, $28, $01)                             ;B4E199
    %AICMD0x13_Wait(60)                                        ;B4E19E
    %AICMD0x1B($02B0, $00)                                     ;B4E1A1
    %AICMD0x0B_SetScriptFlag($01)                                            ;B4E1A5
    %AICMD0x13_Wait(180)                                       ;B4E1A7
    %AICMD0x1B($02AB, $00)                                     ;B4E1AA
    %AICMD0x13_Wait(120)                                       ;B4E1AE
pAIScripting0x3D_L010:
    %AICMD0x13_Wait(1)                                         ;B4E1B1
    %AICMD0x12_Jump(pAIScripting0x3D_L010)                                   ;B4E1B4
pAIScripting0x3D_L011:
    %AICMD0x1A($0258, $0208, aAIScriptingData_L073, $01)                     ;B4E1B7
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B4E1BF
    %AICMD0x1B($02E6, $01)                                     ;B4E1C1
    %AICMD0x13_Wait(120)                                       ;B4E1C5
    %AICMD0x1B($02E2, $00)                                     ;B4E1C8
    %AICMD0x13_Wait(60)                                        ;B4E1CC
    %AICMD0x1B($02E6, $00)                                     ;B4E1CF
    %AICMD0x13_Wait(60)                                        ;B4E1D3
    %AICMD0x1B($0258, $00)                                     ;B4E1D6
pAIScripting0x3D_L012:
    %AICMD0x13_Wait(1)                                         ;B4E1DA
    %AICMD0x12_Jump(pAIScripting0x3D_L012)                                   ;B4E1DD
pAIScripting0x3D_L013:
    %AICMD0x1A($0238, $0238, aAIScriptingData_L004, $02)                     ;B4E1E0
pAIScripting0x3D_L014:
    %AICMD0x1B($01F8, $00)                                     ;B4E1E8
    %AICMD0x13_Wait(240)                                       ;B4E1EC
    %AICMD0x1B($01EA, $01)                                     ;B4E1EF
    %AICMD0x13_Wait(180)                                       ;B4E1F3
    %AICMD0x1B($01EB, $01)                                     ;B4E1F6
    %AICMD0x13_Wait(180)                                       ;B4E1FA
    %AICMD0x12_Jump(pAIScripting0x3D_L014)                                   ;B4E1FD


pAIScripting0x3E:
    dw DATA8_B4E220                                            ;B4E200|        |B4E220;
    dw pAIScripting0x3F                                        ;B4E202|        |B4E3FF;
    dw pAIScripting0x3F                                        ;B4E204|        |B4E3FF;
    dw pAIScripting0x3F                                        ;B4E206|        |B4E3FF;
    dw pAIScripting0x3F                                        ;B4E208|        |B4E3FF;
    dw pAIScripting0x3F                                        ;B4E20A|        |B4E3FF;
    dw pAIScripting0x3F                                        ;B4E20C|        |B4E3FF;
    dw pAIScripting0x3F                                        ;B4E20E|        |B4E3FF;
    dw pAIScripting0x3F                                        ;B4E210|        |B4E3FF;
    dw pAIScripting0x3F                                        ;B4E212|        |B4E3FF;
    dw pAIScripting0x3F                                        ;B4E214|        |B4E3FF;
    dw pAIScripting0x3F                                        ;B4E216|        |B4E3FF;
    dw pAIScripting0x3F                                        ;B4E218|        |B4E3FF;
    dw pAIScripting0x3F                                        ;B4E21A|        |B4E3FF;
    dw pAIScripting0x3F                                        ;B4E21C|        |B4E3FF;
    dw pAIScripting0x3F                                        ;B4E21E|        |B4E3FF;
 
DATA8_B4E220:
    %AICMD0x00_SetMusic($10, $B4)                              ;B4E220
    %AICMD0x02_FreezeTime()                                    ;B4E223
    %AICMD0x03_SetHour($07)                                    ;B4E224
    %AICMD0x05_SetTransferPosition(584, 432)                   ;B4E226
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4E22B
    %AICMD0x08_EnableAIControl()                               ;B4E22D
    %AICMD0x09_StartScript($01, pAIScripting0x3E_L005)                                   ;B4E22E
    %AICMD0x09_StartScript($02, pAIScripting0x3E_L003)                                   ;B4E232
    %AICMD0x09_StartScript($03, pAIScripting0x3E_L001)                                   ;B4E236
    %AICMD0x09_StartScript($04, pAIScripting0x3E_L009)                                   ;B4E23A
    %AICMD0x09_StartScript($05, pAIScripting0x3E_L011)                                   ;B4E23E
    %AICMD0x09_StartScript($06, pAIScripting0x3E_L013)                                   ;B4E242
    %AICMD0x09_StartScript($07, pAIScripting0x3E_L007)                                   ;B4E246
    %AICMD0x06_SetDestinationArea(!AREA_WOODSSUMMER)           ;B4E24A
    %AICMD0x38_WaitForFadeIn()                                               ;B4E24C
    %AICMD0x13_Wait(30)                                        ;B4E24D
    %AICMD0x19($005F, $00)                                     ;B4E250
    %AICMD0x13_Wait(80)                                        ;B4E254
    %AICMD0x19($0003, $00)                                     ;B4E257
    %AICMD0x13_Wait(1)                                         ;B4E25B
    %AICMD0x19($005F, $00)                                     ;B4E25E
    %AICMD0x13_Wait(80)                                        ;B4E262
    %AICMD0x19($0003, $00)                                     ;B4E265
    %AICMD0x13_Wait(1)                                         ;B4E269
    %AICMD0x19($005F, $00)                                     ;B4E26C
    %AICMD0x13_Wait(80)                                        ;B4E270
    %AICMD0x19($0003, $00)                                     ;B4E273
    %AICMD0x13_Wait(1)                                         ;B4E277
    %AICMD0x19($005F, $00)                                     ;B4E27A
    %AICMD0x13_Wait(80)                                        ;B4E27E
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4E281
    %AICMD0x13_Wait(30)                                        ;B4E283
    %AICMD0x19($004A, $00)                                     ;B4E286
    %AICMD0x13_Wait(180)                                       ;B4E28A
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 32)                  ;B4E28D
    %AICMD0x0B_SetScriptFlag($00)                                            ;B4E291
    %AICMD0x13_Wait(120)                                       ;B4E293
    %AICMD0x19($0043, $00)                                     ;B4E296
    %AICMD0x13_Wait(120)                                       ;B4E29A
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 16)                  ;B4E29D
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 16)                  ;B4E2A1
    %AICMD0x0C_WaitForScriptFlag($03)                                            ;B4E2A5
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4E2A7
    %AICMD0x13_Wait(30)                                        ;B4E2A9
    %AICMD0x0C_WaitForScriptFlag($04)                                            ;B4E2AC
    %AICMD0x13_Wait(90)                                        ;B4E2AE
    %AICMD0x3D_TeleportToArea(!AREA_ENDING00)                  ;B4E2B1
    %AICMD0x10_End()                                           ;B4E2B3
pAIScripting0x3E_L001:
    %AICMD0x1A($0208, $01D8, aAIScriptingData_L073, $00)                     ;B4E2B4
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B4E2BC
    %AICMD0x13_Wait(30)                                        ;B4E2BE
    %AICMD0x1B($02E7, $01)                                     ;B4E2C1
    %AICMD0x0D($01, $00, $30, $01)                             ;B4E2C5
    %AICMD0x13_Wait(80)                                        ;B4E2CA
    %AICMD0x1B($02E3, $00)                                     ;B4E2CD
    %AICMD0x0D($00, $01, $60, $01)                             ;B4E2D1
    %AICMD0x13_Wait(60)                                        ;B4E2D6
    %AICMD0x1B($02E5, $00)                                     ;B4E2D9
    %AICMD0x0D($00, $FF, $28, $01)                             ;B4E2DD
    %AICMD0x13_Wait(10)                                        ;B4E2E2
    %AICMD0x1B($02E8, $00)                                     ;B4E2E5
    %AICMD0x13_Wait(120)                                       ;B4E2E9
    %AICMD0x1B($02E5, $00)                                     ;B4E2EC
    %AICMD0x0D($00, $FF, $20, $01)                             ;B4E2F0
    %AICMD0x0B_SetScriptFlag($01)                                            ;B4E2F5
    %AICMD0x13_Wait(60)                                        ;B4E2F7
    %AICMD0x1B($02E3, $00)                                     ;B4E2FA
    %AICMD0x0D($00, $01, $08, $01)                             ;B4E2FE
    %AICMD0x13_Wait(60)                                        ;B4E303
    %AICMD0x1B($02E7, $01)                                     ;B4E306
    %AICMD0x13_Wait(120)                                       ;B4E30A
    %AICMD0x1B($02E3, $00)                                     ;B4E30D
    %AICMD0x13_Wait(120)                                       ;B4E311
    %AICMD0x1B($02E7, $01)                                     ;B4E314
    %AICMD0x13_Wait(120)                                       ;B4E318
pAIScripting0x3E_L002:
    %AICMD0x13_Wait(1)                                         ;B4E31B
    %AICMD0x12_Jump(pAIScripting0x3E_L002)                                   ;B4E31E
pAIScripting0x3E_L003:
    %AICMD0x1A($0238, $0268, aAIScriptingData_L040, $01)                     ;B4E321
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B4E329
    %AICMD0x13_Wait(20)                                        ;B4E32B
    %AICMD0x0D($00, $FF, $60, $01)                             ;B4E32E
    %AICMD0x13_Wait(20)                                        ;B4E333
    %AICMD0x1B($0281, $01)                                     ;B4E336
    %AICMD0x0D($01, $00, $10, $01)                             ;B4E33A
    %AICMD0x1B($0281, $01)                                     ;B4E33F
    %AICMD0x13_Wait(120)                                       ;B4E343
    %AICMD0x0B_SetScriptFlag($02)                                            ;B4E346
    %AICMD0x1B($027F, $00)                                     ;B4E348
    %AICMD0x13_Wait(180)                                       ;B4E34C
    %AICMD0x1B($0281, $01)                                     ;B4E34F
    %AICMD0x13_Wait(180)                                       ;B4E353
pAIScripting0x3E_L004:
    %AICMD0x13_Wait(1)                                         ;B4E356
    %AICMD0x12_Jump(pAIScripting0x3E_L004)                                   ;B4E359
pAIScripting0x3E_L005:
    %AICMD0x1A($0278, $0208, aAIScriptingData_L004, $03)                     ;B4E35C
    %AICMD0x0C_WaitForScriptFlag($02)                                            ;B4E364
    %AICMD0x1B($01EC, $00)                                     ;B4E366
    %AICMD0x0D($FF, $00, $20, $01)                             ;B4E36A
    %AICMD0x13_Wait(60)                                        ;B4E36F
    %AICMD0x1B($01EB, $00)                                     ;B4E372
    %AICMD0x13_Wait(180)                                       ;B4E376
    %AICMD0x1B($01EF, $00)                                     ;B4E379
    %AICMD0x13_Wait(60)                                        ;B4E37D
    %AICMD0x0B_SetScriptFlag($03)                                            ;B4E380
    %AICMD0x1B($01F0, $00)                                     ;B4E382
    %AICMD0x13_Wait(120)                                       ;B4E386
    %AICMD0x1B($01E3, $00)                                     ;B4E389
pAIScripting0x3E_L006:
    %AICMD0x13_Wait(1)                                         ;B4E38D
    %AICMD0x12_Jump(pAIScripting0x3E_L006)                                   ;B4E390
pAIScripting0x3E_L007:
    %AICMD0x1A($0270, $0230, aAIScriptingData_L027, $01)                     ;B4E393
    %AICMD0x0C_WaitForScriptFlag($03)                                            ;B4E39B
    %AICMD0x1B($025D, $00)                                     ;B4E39D
    %AICMD0x0D($00, $FF, $40, $01)                             ;B4E3A1
    %AICMD0x1B($025F, $00)                                     ;B4E3A6
    %AICMD0x13_Wait(60)                                        ;B4E3AA
    %AICMD0x1B($025D, $00)                                     ;B4E3AD
    %AICMD0x13_Wait(30)                                        ;B4E3B1
    %AICMD0x09_StartScript($08, pAIScripting0x3E_L015)                                   ;B4E3B4
    %AICMD0x1B($025F, $00)                                     ;B4E3B8
    %AICMD0x13_Wait(60)                                        ;B4E3BC
    %AICMD0x0B_SetScriptFlag($04)                                            ;B4E3BF
pAIScripting0x3E_L008:
    %AICMD0x13_Wait(1)                                         ;B4E3C1
    %AICMD0x12_Jump(pAIScripting0x3E_L008)                                   ;B4E3C4
pAIScripting0x3E_L009:
    %AICMD0x1A($0254, $01E2, aAIScriptingData_L186, $00)                     ;B4E3C7
pAIScripting0x3E_L010:
    %AICMD0x13_Wait(1)                                         ;B4E3CF
    %AICMD0x12_Jump(pAIScripting0x3E_L010)                                   ;B4E3D2
pAIScripting0x3E_L011:
    %AICMD0x1A($024A, $01E8, aAIScriptingData_L010, $00)                     ;B4E3D5
pAIScripting0x3E_L012:
    %AICMD0x13_Wait(1)                                         ;B4E3DD
    %AICMD0x12_Jump(pAIScripting0x3E_L012)                                   ;B4E3E0
pAIScripting0x3E_L013:
    %AICMD0x1A($0254, $01EE, aAIScriptingData_L184, $00)                     ;B4E3E3
pAIScripting0x3E_L014:
    %AICMD0x13_Wait(1)                                         ;B4E3EB
    %AICMD0x12_Jump(pAIScripting0x3E_L014)                                   ;B4E3EE
pAIScripting0x3E_L015:
    %AICMD0x1A($0270, $01D6, aAIScriptingData_L127, $00)                     ;B4E3F1
pAIScripting0x3E_L016:
    %AICMD0x13_Wait(1)                                         ;B4E3F9
    %AICMD0x12_Jump(pAIScripting0x3E_L016)                                   ;B4E3FC


pAIScripting0x3F:
    dw DATA8_B4E41F                                            ;B4E3FF|        |B4E41F;
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
 
DATA8_B4E41F:
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


pAIScripting0x41:
    dw DATA8_B4E7CF                                            ;B4E7AF|        |B4E7CF;
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
 
DATA8_B4E7CF:
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


pAIScripting0x42:
    dw DATA8_B4E9A9                                            ;B4E989|        |B4E9A9;
    dw DATA8_B4EBA1                                            ;B4E98B|        |B4EBA1;
    dw DATA8_B4ECB4                                            ;B4E98D|        |B4ECB4;
    dw DATA8_B4ECB4                                            ;B4E98F|        |B4ECB4;
    dw DATA8_B4ECB4                                            ;B4E991|        |B4ECB4;
    dw DATA8_B4ECB4                                            ;B4E993|        |B4ECB4;
    dw DATA8_B4ECB4                                            ;B4E995|        |B4ECB4;
    dw DATA8_B4ECB4                                            ;B4E997|        |B4ECB4;
    dw DATA8_B4ECB4                                            ;B4E999|        |B4ECB4;
    dw DATA8_B4ECB4                                            ;B4E99B|        |B4ECB4;
    dw DATA8_B4ECB4                                            ;B4E99D|        |B4ECB4;
    dw DATA8_B4ECB4                                            ;B4E99F|        |B4ECB4;
    dw DATA8_B4ECB4                                            ;B4E9A1|        |B4ECB4;
    dw DATA8_B4ECB4                                            ;B4E9A3|        |B4ECB4;
    dw DATA8_B4ECB4                                            ;B4E9A5|        |B4ECB4;
    dw DATA8_B4ECB4                                            ;B4E9A7|        |B4ECB4;
 
DATA8_B4E9A9:
 
    %AICMD0x00_SetMusic($10, $B4)                              ;B4E9A9
    %AICMD0x02_FreezeTime()                                    ;B4E9AC
    %AICMD0x03_SetHour($06)                                    ;B4E9AD
    %AICMD0x05_SetTransferPosition(96, 200)                    ;B4E9AF
    %AICMD0x40_DisableTileInteractions()                       ;B4E9B4
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B4E9B5
    %AICMD0x08_EnableAIControl()                               ;B4E9B7
    %AICMD0x09_StartScript($01, pAIScripting0x42_L001)                                   ;B4E9B8
    %AICMD0x09_StartScript($02, pAIScripting0x42_L003)                                   ;B4E9BC
    %AICMD0x09_StartScript($03, pAIScripting0x42_L005)                                   ;B4E9C0
    %AICMD0x09_StartScript($04, pAIScripting0x42_L007)                                   ;B4E9C4
    %AICMD0x09_StartScript($05, pAIScripting0x42_L015)                                   ;B4E9C8
    %AICMD0x09_StartScript($06, pAIScripting0x42_L013)                                   ;B4E9CC
    %AICMD0x09_StartScript($07, pAIScripting0x42_L017)                                   ;B4E9D0
    %AICMD0x09_StartScript($08, pAIScripting0x42_L019)                                   ;B4E9D4
    %AICMD0x09_StartScript($09, pAIScripting0x42_L021)                                   ;B4E9D8
    %AICMD0x09_StartScript($0A, pAIScripting0x42_L009)                                   ;B4E9DC
    %AICMD0x09_StartScript($0B, pAIScripting0x42_L011)                                   ;B4E9E0
    %AICMD0x06_SetDestinationArea(!AREA_ENDING12)              ;B4E9E4
    %AICMD0x38_WaitForFadeIn()                                               ;B4E9E6
    %AICMD0x0C_WaitForScriptFlag($02)                                            ;B4E9E7
    %AICMD0x13_Wait(180)                                       ;B4E9E9
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 80)                    ;B4E9EC
    %AICMD0x13_Wait(60)                                        ;B4E9F0
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 24)                 ;B4E9F3
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4E9F7
    %AICMD0x13_Wait(60)                                        ;B4E9F9
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4E9FC
    %AICMD0x13_Wait(120)                                       ;B4E9FE
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4EA01
    %AICMD0x13_Wait(60)                                        ;B4EA03
    %AICMD0x0C_WaitForScriptFlag($03)                                            ;B4EA06
    %AICMD0x3D_TeleportToArea(!AREA_ENDING00)                  ;B4EA08
    %AICMD0x10_End()                                           ;B4EA0A
pAIScripting0x42_L001:
    %AICMD0x1A($0110, $0078, aAIScriptingData_L004, $00)                     ;B4EA0B
    %AICMD0x13_Wait(120)                                       ;B4EA13
    %AICMD0x1B($01EC, $00)                                     ;B4EA16
    %AICMD0x0D($FF, $00, $48, $01)                             ;B4EA1A
    %AICMD0x13_Wait(120)                                       ;B4EA1F
    %AICMD0x1B($01E9, $00)                                     ;B4EA22
    %AICMD0x0D($FF, $00, $20, $02)                             ;B4EA26
    %AICMD0x13_Wait(60)                                        ;B4EA2B
    %AICMD0x1B($01EA, $00)                                     ;B4EA2E
    %AICMD0x13_Wait(180)                                       ;B4EA32
    %AICMD0x1B($01EB, $00)                                     ;B4EA35
    %AICMD0x13_Wait(80)                                        ;B4EA39
    %AICMD0x1B($01E9, $00)                                     ;B4EA3C
    %AICMD0x0D($FF, $00, $20, $02)                             ;B4EA40
    %AICMD0x13_Wait(80)                                        ;B4EA45
    %AICMD0x1B($01DB, $00)                                     ;B4EA48
    %AICMD0x13_Wait(120)                                       ;B4EA4C
    %AICMD0x1B($01DC, $00)                                     ;B4EA4F
    %AICMD0x13_Wait(60)                                        ;B4EA53
    %AICMD0x1B($01EC, $01)                                     ;B4EA56
    %AICMD0x0D($01, $00, $68, $01)                             ;B4EA5A
    %AICMD0x0B_SetScriptFlag($03)                                            ;B4EA5F
    %AICMD0x10_End()                                           ;B4EA61
pAIScripting0x42_L002:
    %AICMD0x13_Wait(1)                                         ;B4EA62
    %AICMD0x12_Jump(pAIScripting0x42_L002)                                   ;B4EA65
pAIScripting0x42_L003:
    %AICMD0x1A($0068, $0058, aAIScriptingData_L071, $00)                     ;B4EA68
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B4EA70
    %AICMD0x1B($02E3, $00)                                     ;B4EA72
    %AICMD0x0D($00, $01, $24, $01)                             ;B4EA76
    %AICMD0x13_Wait(120)                                       ;B4EA7B
    %AICMD0x0B_SetScriptFlag($01)                                            ;B4EA7E
    %AICMD0x1B($02E3, $00)                                     ;B4EA80
    %AICMD0x0D($00, $FF, $20, $01)                             ;B4EA84
    %AICMD0x13_Wait(120)                                       ;B4EA89
pAIScripting0x42_L004:
    %AICMD0x13_Wait(1)                                         ;B4EA8C
    %AICMD0x12_Jump(pAIScripting0x42_L004)                                   ;B4EA8F
pAIScripting0x42_L005:
    %AICMD0x1A($0068, $0068, aAIScriptingData_L079, $00)                     ;B4EA92
    %AICMD0x13_Wait(120)                                       ;B4EA9A
    %AICMD0x0D($00, $01, $20, $01)                             ;B4EA9D
    %AICMD0x1B($02FB, $00)                                     ;B4EAA2
    %AICMD0x13_Wait(60)                                        ;B4EAA6
    %AICMD0x0B_SetScriptFlag($00)                                            ;B4EAA9
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B4EAAB
    %AICMD0x1B($02FB, $00)                                     ;B4EAAD
    %AICMD0x0D($00, $FF, $20, $01)                             ;B4EAB1
    %AICMD0x13_Wait(120)                                       ;B4EAB6
pAIScripting0x42_L006:
    %AICMD0x13_Wait(1)                                         ;B4EAB9
    %AICMD0x12_Jump(pAIScripting0x42_L006)                                   ;B4EABC
pAIScripting0x42_L007:
    %AICMD0x1A($0088, $0058, aAIScriptingData_L077, $02)                     ;B4EABF
    %AICMD0x13_Wait(180)                                       ;B4EAC7
    %AICMD0x0D($01, $00, $10, $02)                             ;B4EACA
    %AICMD0x13_Wait(120)                                       ;B4EACF
    %AICMD0x0C_WaitForScriptFlag($02)                                            ;B4EAD2
    %AICMD0x1B($02F7, $01)                                     ;B4EAD4
    %AICMD0x0D($FF, $00, $1E, $02)                             ;B4EAD8
    %AICMD0x13_Wait(60)                                        ;B4EADD
    %AICMD0x1B($02F3, $00)                                     ;B4EAE0
    %AICMD0x13_Wait(60)                                        ;B4EAE4
pAIScripting0x42_L008:
    %AICMD0x13_Wait(1)                                         ;B4EAE7
    %AICMD0x12_Jump(pAIScripting0x42_L008)                                   ;B4EAEA
pAIScripting0x42_L009:
    %AICMD0x1A($0058, $0058, aAIScriptingData_L069, $00)                     ;B4EAED
pAIScripting0x42_L010:
    %AICMD0x13_Wait(1)                                         ;B4EAF5
    %AICMD0x12_Jump(pAIScripting0x42_L010)                                   ;B4EAF8
pAIScripting0x42_L011:
    %AICMD0x1A($0078, $0058, aAIScriptingData_L070, $00)                     ;B4EAFB
    %AICMD0x13_Wait(180)                                       ;B4EB03
    %AICMD0x1B($02E1, $01)                                     ;B4EB06
    %AICMD0x0D($01, $00, $10, $01)                             ;B4EB0A
    %AICMD0x13_Wait(90)                                        ;B4EB0F
    %AICMD0x0B_SetScriptFlag($02)                                            ;B4EB12
    %AICMD0x1B($02E1, $01)                                     ;B4EB14
    %AICMD0x0D($FF, $00, $20, $02)                             ;B4EB18
    %AICMD0x13_Wait(60)                                        ;B4EB1D
    %AICMD0x1B($02DF, $00)                                     ;B4EB20
    %AICMD0x13_Wait(60)                                        ;B4EB24
pAIScripting0x42_L012:
    %AICMD0x13_Wait(1)                                         ;B4EB27
    %AICMD0x12_Jump(pAIScripting0x42_L012)                                   ;B4EB2A
pAIScripting0x42_L013:
    %AICMD0x1A($0028, $0068, aAIScriptingData_L006, $02)                     ;B4EB2D
pAIScripting0x42_L014:
    %AICMD0x1B($0201, $01)                                     ;B4EB35
    %AICMD0x13_Wait(180)                                       ;B4EB39
    %AICMD0x1B($0201, $01)                                     ;B4EB3C
    %AICMD0x13_Wait(180)                                       ;B4EB40
    %AICMD0x1B($0203, $01)                                     ;B4EB43
    %AICMD0x13_Wait(240)                                       ;B4EB47
    %AICMD0x1B($0205, $01)                                     ;B4EB4A
    %AICMD0x13_Wait(180)                                       ;B4EB4E
    %AICMD0x12_Jump(pAIScripting0x42_L014)                                   ;B4EB51
pAIScripting0x42_L015:
    %AICMD0x1A($00A8, $0098, aAIScriptingData_L152, $03)                     ;B4EB54
pAIScripting0x42_L016:
    %AICMD0x13_Wait(120)                                       ;B4EB5C
    %AICMD0x1B($0192, $01)                                     ;B4EB5F
    %AICMD0x13_Wait(120)                                       ;B4EB63
    %AICMD0x1B($0195, $01)                                     ;B4EB66
    %AICMD0x13_Wait(1)                                         ;B4EB6A
    %AICMD0x12_Jump(pAIScripting0x42_L016)                                   ;B4EB6D
pAIScripting0x42_L017:
    %AICMD0x1A($00D8, $0058, aAIScriptingData_L008, $03)                     ;B4EB70
pAIScripting0x42_L018:
    %AICMD0x13_Wait(1)                                         ;B4EB78
    %AICMD0x12_Jump(pAIScripting0x42_L018)                                   ;B4EB7B
pAIScripting0x42_L019:
    %AICMD0x1A($00C8, $0068, aAIScriptingData_L009, $03)                     ;B4EB7E
    %AICMD0x22($08, $08, $01, aAIScriptingData_L009, $04)                    ;B4EB86
pAIScripting0x42_L020:
    %AICMD0x13_Wait(1)                                         ;B4EB8D
    %AICMD0x12_Jump(pAIScripting0x42_L020)                                   ;B4EB90
pAIScripting0x42_L021:
    %AICMD0x1A($0098, $0024, aAIScriptingData_L093, $03)                     ;B4EB93
pAIScripting0x42_L022:
    %AICMD0x13_Wait(1)                                         ;B4EB9B
    %AICMD0x12_Jump(pAIScripting0x42_L022)                                   ;B4EB9E


DATA8_B4EBA1:
 
    %AICMD0x00_SetMusic($10, $B4)                              ;B4EBA1
    %AICMD0x02_FreezeTime()                                    ;B4EBA4
    %AICMD0x03_SetHour($06)                                    ;B4EBA5
    %AICMD0x05_SetTransferPosition(120, 136)                   ;B4EBA7
    %AICMD0x40_DisableTileInteractions()                       ;B4EBAC
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4EBAD
    %AICMD0x08_EnableAIControl()                               ;B4EBAF
    %AICMD0x09_StartScript($01, pAIScripting0x42_L023)                                   ;B4EBB0
    %AICMD0x09_StartScript($02, pAIScripting0x42_L025)                                   ;B4EBB4
    %AICMD0x09_StartScript($03, pAIScripting0x42_L027)                                   ;B4EBB8
    %AICMD0x09_StartScript($04, pAIScripting0x42_L029)                                   ;B4EBBC
    %AICMD0x09_StartScript($05, pAIScripting0x42_L037)                                   ;B4EBC0
    %AICMD0x09_StartScript($06, pAIScripting0x42_L035)                                   ;B4EBC4
    %AICMD0x09_StartScript($07, pAIScripting0x42_L039)                                   ;B4EBC8
    %AICMD0x09_StartScript($08, pAIScripting0x42_L041)                                   ;B4EBCC
    %AICMD0x09_StartScript($09, pAIScripting0x42_L043)                                   ;B4EBD0
    %AICMD0x09_StartScript($0A, pAIScripting0x42_L031)                                   ;B4EBD4
    %AICMD0x09_StartScript($0B, pAIScripting0x42_L033)                                   ;B4EBD8
    %AICMD0x09_StartScript($0C, pAIScripting0x42_L045)                                   ;B4EBDC
    %AICMD0x06_SetDestinationArea(!AREA_ENDING13)              ;B4EBE0
    %AICMD0x38_WaitForFadeIn()                                               ;B4EBE2
    %AICMD0x01_UnfreezeTime()                                  ;B4EBE3
    %AICMD0x24_NextHourPalette($74)                            ;B4EBE4
    %AICMD0x13_Wait(180)                                       ;B4EBE6
    %AICMD0x02_FreezeTime()                                    ;B4EBE9
    %AICMD0x13_Wait(240)                                       ;B4EBEA
    %AICMD0x3D_TeleportToArea(!AREA_ENDING00)                  ;B4EBED
    %AICMD0x10_End()                                           ;B4EBEF
pAIScripting0x42_L023:
    %AICMD0x1A($00A8, $0088, aAIScriptingData_L004, $00)                     ;B4EBF0
    %AICMD0x13_Wait(1)                                         ;B4EBF8
    %AICMD0x1B($034B, $00)                                     ;B4EBFB
pAIScripting0x42_L024:
    %AICMD0x13_Wait(1)                                         ;B4EBFF
    %AICMD0x12_Jump(pAIScripting0x42_L024)                                   ;B4EC02
pAIScripting0x42_L025:
    %AICMD0x1A($0068, $0068, aAIScriptingData_L071, $00)                     ;B4EC05
pAIScripting0x42_L026:
    %AICMD0x13_Wait(1)                                         ;B4EC0D
    %AICMD0x12_Jump(pAIScripting0x42_L026)                                   ;B4EC10
pAIScripting0x42_L027:
    %AICMD0x1A($0068, $0078, aAIScriptingData_L078, $00)                     ;B4EC13
pAIScripting0x42_L028:
    %AICMD0x13_Wait(1)                                         ;B4EC1B
    %AICMD0x12_Jump(pAIScripting0x42_L028)                                   ;B4EC1E
pAIScripting0x42_L029:
    %AICMD0x1A($0088, $0068, aAIScriptingData_L076, $00)                     ;B4EC21
pAIScripting0x42_L030:
    %AICMD0x13_Wait(1)                                         ;B4EC29
    %AICMD0x12_Jump(pAIScripting0x42_L030)                                   ;B4EC2C
pAIScripting0x42_L031:
    %AICMD0x1A($0058, $0068, aAIScriptingData_L069, $00)                     ;B4EC2F
pAIScripting0x42_L032:
    %AICMD0x13_Wait(1)                                         ;B4EC37
    %AICMD0x12_Jump(pAIScripting0x42_L032)                                   ;B4EC3A
pAIScripting0x42_L033:
    %AICMD0x1A($0078, $0068, aAIScriptingData_L070, $00)                     ;B4EC3D
    %AICMD0x13_Wait(1)                                         ;B4EC45
    %AICMD0x1B($0349, $00)                                     ;B4EC48
pAIScripting0x42_L034:
    %AICMD0x13_Wait(1)                                         ;B4EC4C
    %AICMD0x12_Jump(pAIScripting0x42_L034)                                   ;B4EC4F
pAIScripting0x42_L035:
    %AICMD0x1A($0048, $0088, aAIScriptingData_L006, $02)                     ;B4EC52
pAIScripting0x42_L036:
    %AICMD0x13_Wait(1)                                         ;B4EC5A
    %AICMD0x12_Jump(pAIScripting0x42_L036)                                   ;B4EC5D
pAIScripting0x42_L037:
    %AICMD0x1A($0088, $0098, aAIScriptingData_L002, $03)                     ;B4EC60
pAIScripting0x42_L038:
    %AICMD0x13_Wait(1)                                         ;B4EC68
    %AICMD0x12_Jump(pAIScripting0x42_L038)                                   ;B4EC6B
pAIScripting0x42_L039:
    %AICMD0x1A($00C0, $0070, aAIScriptingData_L008, $03)                     ;B4EC6E
    %AICMD0x13_Wait(1)                                         ;B4EC76
    %AICMD0x1B($0414, $00)                                     ;B4EC79
pAIScripting0x42_L040:
    %AICMD0x13_Wait(1)                                         ;B4EC7D
    %AICMD0x12_Jump(pAIScripting0x42_L040)                                   ;B4EC80
pAIScripting0x42_L041:
    %AICMD0x1A($00C8, $0078, aAIScriptingData_L009, $03)                     ;B4EC83
    %AICMD0x13_Wait(1)                                         ;B4EC8B
    %AICMD0x1B($041C, $00)                                     ;B4EC8E
pAIScripting0x42_L042:
    %AICMD0x13_Wait(1)                                         ;B4EC92
    %AICMD0x12_Jump(pAIScripting0x42_L042)                                   ;B4EC95
pAIScripting0x42_L043:
    %AICMD0x1A($00A8, $00A0, aAIScriptingData_L080, $03)                     ;B4EC98
pAIScripting0x42_L044:
    %AICMD0x13_Wait(1)                                         ;B4ECA0
    %AICMD0x12_Jump(pAIScripting0x42_L044)                                   ;B4ECA3
pAIScripting0x42_L045:
    %AICMD0x1A($0098, $00A0, aAIScriptingData_L080, $00)                     ;B4ECA6
pAIScripting0x42_L046:
    %AICMD0x13_Wait(1)                                         ;B4ECAE
    %AICMD0x12_Jump(pAIScripting0x42_L046)                                   ;B4ECB1


DATA8_B4ECB4:
 
    %AICMD0x00_SetMusic($00, $00)                              ;B4ECB4


    pad $B4FFFF
