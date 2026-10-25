 
pAIScripting0x0F_StarNightFestival:
    dw pAIScripting0x0F_StarNightFestival_Data01                                            ;B48000|        |B48020;
    dw pAIScripting0x0F_StarNightFestival_Data02                                            ;B48002|        |B48075;
    dw pAIScripting0x0F_StarNightFestival_Data03                                            ;B48004|        |B4820E;
    dw pAIScripting0x0F_StarNightFestival_Data04                                            ;B48006|        |B48400;
    dw pAIScripting0x0F_StarNightFestival_Data05                                            ;B48008|        |B485C6;
    dw pAIScripting0x0F_StarNightFestival_Data06                                            ;B4800A|        |B486E8;
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
 
pAIScripting0x0F_StarNightFestival_Data01:
 
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


pAIScripting0x0F_StarNightFestival_Data02:
 
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


pAIScripting0x0F_StarNightFestival_Data03:
 
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
    if !REGION_EU|!REGION_DE
        %AICMD0x0C_WaitForScriptFlag($07)                      ; EU/DE: this path also waits for flag 7
    endif
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


pAIScripting0x0F_StarNightFestival_Data04:
 
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


pAIScripting0x0F_StarNightFestival_Data05:
 
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


pAIScripting0x0F_StarNightFestival_Data06:
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
