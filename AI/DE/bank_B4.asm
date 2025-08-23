 
    ORG $B48000
 
 
pAIScripting0x0F_StarNightFestival:
    dw DATA8_B48020                                            ;B48000|        |B48020;
    dw DATA8_B48075                                            ;B48002|        |B48075;
    dw DATA8_B4820E                                            ;B48004|        |B4820E;
    dw DATA8_B48402                                            ;B48006|        |B48402;
    dw DATA8_B485C8                                            ;B48008|        |B485C8;
    dw DATA8_B486EA                                            ;B4800A|        |B486EA;
    dw pAIScripting0x10_WoodsPondEvent                         ;B4800C|        |B487BA;
    dw pAIScripting0x10_WoodsPondEvent                         ;B4800E|        |B487BA;
    dw pAIScripting0x10_WoodsPondEvent                         ;B48010|        |B487BA;
    dw pAIScripting0x10_WoodsPondEvent                         ;B48012|        |B487BA;
    dw pAIScripting0x10_WoodsPondEvent                         ;B48014|        |B487BA;
    dw pAIScripting0x10_WoodsPondEvent                         ;B48016|        |B487BA;
    dw pAIScripting0x10_WoodsPondEvent                         ;B48018|        |B487BA;
    dw pAIScripting0x10_WoodsPondEvent                         ;B4801A|        |B487BA;
    dw pAIScripting0x10_WoodsPondEvent                         ;B4801C|        |B487BA;
    dw pAIScripting0x10_WoodsPondEvent                         ;B4801E|        |B487BA;
 
DATA8_B48020:
 
    %AICMD0x4F()                                               ;B48020
    %AICMD0x50()                                               ;B48021
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $09)       ;B48022
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $00)       ;B48027
    %AICMD0x08_EnableAIControl()                               ;B4802C
    %AICMD0x38()                                               ;B4802D
    %AICMD0x01_UnfreezeTime()                                  ;B4802E
    %AICMD0x24_NextHourPalette($74)                            ;B4802F
    %AICMD0x13_Wait(180)                                       ;B48031
    %AICMD0x1D_ShowDialog($02B6, $00)                          ;B48034
    %AICMD0x20_JumpIfChoice(0, $B4804D)                        ;B48038
    %AICMD0x20_JumpIfChoice(1, $B48055)                        ;B4803C
    %AICMD0x20_JumpIfChoice(2, $B4805D)                        ;B48040
    %AICMD0x20_JumpIfChoice(3, $B48065)                        ;B48044
    %AICMD0x20_JumpIfChoice(4, $B4806D)                        ;B48048
    %AICMD0x10_End()                                           ;B4804C
B4804D:
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown1, $00)     ;B4804D
    %AICMD0x3D_TeleportToArea(!AREA_NY_PUBLICSQUARE)           ;B48052
    %AICMD0x10_End()                                           ;B48054
B48055:
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown1, $01)     ;B48055
    %AICMD0x3D_TeleportToArea(!AREA_CHURCH)                    ;B4805A
    %AICMD0x10_End()                                           ;B4805C
B4805D:
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown1, $02)     ;B4805D
    %AICMD0x3D_TeleportToArea(!AREA_BAR)                       ;B48062
    %AICMD0x10_End()                                           ;B48064
B48065:
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown1, $03)     ;B48065
    %AICMD0x3D_TeleportToArea(!AREA_NY_MOUNTAINTOP)            ;B4806A
    %AICMD0x10_End()                                           ;B4806C
B4806D:
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown1, $04)     ;B4806D
    %AICMD0x3D_TeleportToArea(!AREA_NY_SPA)                    ;B48072
    %AICMD0x10_End()                                           ;B48074


DATA8_B48075:
 
    %AICMD0x4F()                                               ;B48075
    %AICMD0x50()                                               ;B48076
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $09)       ;B48077
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily3, $0F)       ;B4807C
    %AICMD0x00_SetMusic($0E, $B4)                              ;B48081
    %AICMD0x03_SetHour($11)                                    ;B48084
    %AICMD0x05_SetTransferPosition(264, 312)                   ;B48086
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B4808B
    %AICMD0x09($01, $B480BC)                                   ;B4808D
    %AICMD0x09($02, $B480D3)                                   ;B48091
    %AICMD0x09($03, $B480EA)                                   ;B48095
    %AICMD0x09($05, $B48128)                                   ;B48099
    %AICMD0x09($06, $B48189)                                   ;B4809D
    %AICMD0x38()                                               ;B480A1
    %AICMD0x0C($00)                                            ;B480A2
    %AICMD0x0C($01)                                            ;B480A4
    %AICMD0x0C($02)                                            ;B480A6
    %AICMD0x0C($03)                                            ;B480A8
    %AICMD0x0C($04)                                            ;B480AA
    %AICMD0x13_Wait(60)                                        ;B480AC
    %AICMD0x28(strcFlags.daily3, $0F)                          ;B480AF
    %AICMD0x41_AddValue16(nLove_Ellen, 30)                     ;B480B4
    %AICMD0x3C()                                               ;B480BA
    %AICMD0x10_End()                                           ;B480BB
B480BC:
    %AICMD0x1A($0108, $0098, $B38300, $00)                     ;B480BC
    %AICMD0x1F($B480CA)                                        ;B480C4
    %AICMD0x12_Jump($B480C4)                                   ;B480C7
B480CA:
    %AICMD0x1C_ShowDialog($02B7, $00)                          ;B480CA
    %AICMD0x0B($00)                                            ;B480CE
    %AICMD0x12_Jump($B480C4)                                   ;B480D0
B480D3:
    %AICMD0x1A($00B8, $00A8, $B383D8, $01)                     ;B480D3
    %AICMD0x1F($B480E1)                                        ;B480DB
    %AICMD0x12_Jump($B480DB)                                   ;B480DE
B480E1:
    %AICMD0x1C_ShowDialog($02B8, $00)                          ;B480E1
    %AICMD0x0B($01)                                            ;B480E5
    %AICMD0x12_Jump($B480DB)                                   ;B480E7
B480EA:
    %AICMD0x1A($0168, $00D8, $B382F4, $03)                     ;B480EA
    %AICMD0x1F($B480FE)                                        ;B480F2
    %AICMD0x12_Jump($B480F2)                                   ;B480F5
    %AICMD0x1F($B4811F)                                        ;B480F8
    %AICMD0x12_Jump($B480F8)                                   ;B480FB
B480FE:
    %AICMD0x1D_ShowDialog($02BA, $00)                          ;B480FE
    %AICMD0x20_JumpIfChoice(0, $B4810D)                        ;B48102
    %AICMD0x20_JumpIfChoice(1, $B48116)                        ;B48106
    %AICMD0x12_Jump($B480F2)                                   ;B4810A
B4810D:
    %AICMD0x1C_ShowDialog($02BB, $00)                          ;B4810D
    %AICMD0x0B($02)                                            ;B48111
    %AICMD0x12_Jump($B480F8)                                   ;B48113
B48116:
    %AICMD0x1C_ShowDialog($02BC, $00)                          ;B48116
    %AICMD0x0B($02)                                            ;B4811A
    %AICMD0x12_Jump($B480F8)                                   ;B4811C
B4811F:
    %AICMD0x1C_ShowDialog($02DC, $00)                          ;B4811F
    %AICMD0x0B($02)                                            ;B48123
    %AICMD0x12_Jump($B480F8)                                   ;B48125
B48128:
    %AICMD0x1A($0148, $0128, $B38330, $03)                     ;B48128
    %AICMD0x22($20, $18, $01, $B3833C, $0C)                    ;B48130
    %AICMD0x1F($B4813D)                                        ;B48137
    %AICMD0x12_Jump($B48137)                                   ;B4813A
B4813D:
    %AICMD0x1C_ShowDialog($02B9, $00)                          ;B4813D
    %AICMD0x0B($03)                                            ;B48141
    %AICMD0x12_Jump($B48137)                                   ;B48143
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $00, $B48165)   ;B48146
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $01, $B4816E)   ;B4814D
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, $B48177)   ;B48154
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $04, $B48180)   ;B4815B
    %AICMD0x12_Jump($B48193)                                   ;B48162
B48165:
    %AICMD0x41_AddValue16(nLove_Maria, -30)                    ;B48165
    %AICMD0x12_Jump($B48193)                                   ;B4816B
B4816E:
    %AICMD0x41_AddValue16(nLove_Ann, -30)                      ;B4816E
    %AICMD0x12_Jump($B48193)                                   ;B48174
B48177:
    %AICMD0x41_AddValue16(nLove_Nina, -30)                     ;B48177
    %AICMD0x12_Jump($B48193)                                   ;B4817D
B48180:
    %AICMD0x41_AddValue16(nLove_Eve, -30)                      ;B48180
    %AICMD0x12_Jump($B48193)                                   ;B48186
B48189:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $03, $B481A5)   ;B48189
    %AICMD0x12_Jump($B48146)                                   ;B48190
B48193:
    %AICMD0x1A($00F8, $0108, $B381E0, $00)                     ;B48193
    %AICMD0x13_Wait(1)                                         ;B4819B
    %AICMD0x1B($0242, $00)                                     ;B4819E
    %AICMD0x12_Jump($B481B4)                                   ;B481A2
B481A5:
    %AICMD0x1A($0128, $0098, $B3845C, $00)                     ;B481A5
    %AICMD0x13_Wait(1)                                         ;B481AD
    %AICMD0x1B($02E9, $00)                                     ;B481B0
B481B4:
    %AICMD0x0C($00)                                            ;B481B4
    %AICMD0x0C($01)                                            ;B481B6
    %AICMD0x0C($02)                                            ;B481B8
    %AICMD0x0C($03)                                            ;B481BA
    %AICMD0x1F($B481C2)                                        ;B481BC
    %AICMD0x12_Jump($B481BC)                                   ;B481BF
B481C2:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $03, $B48205)   ;B481C2
    %AICMD0x45_JumpIfBetween16(nLove_Ellen, 0, 200, $B481EA)   ;B481C9
    %AICMD0x45_JumpIfBetween16(nLove_Ellen, 201, 300, $B481F3) ;B481D3
    %AICMD0x45_JumpIfBetween16(nLove_Ellen, 301, 999, $B481FC) ;B481DD
    %AICMD0x12_Jump($B481BC)                                   ;B481E7
B481EA:
    %AICMD0x1C_ShowDialog($02BD, $00)                          ;B481EA
    %AICMD0x0B($04)                                            ;B481EE
    %AICMD0x12_Jump($B481BC)                                   ;B481F0
B481F3:
    %AICMD0x1C_ShowDialog($02BE, $00)                          ;B481F3
    %AICMD0x0B($04)                                            ;B481F7
    %AICMD0x12_Jump($B481BC)                                   ;B481F9
B481FC:
    %AICMD0x1C_ShowDialog($0433, $00)                          ;B481FC
    %AICMD0x0B($04)                                            ;B48200
    %AICMD0x12_Jump($B481BC)                                   ;B48202
B48205:
    %AICMD0x1C_ShowDialog($0434, $00)                          ;B48205
    %AICMD0x0B($04)                                            ;B48209
    %AICMD0x12_Jump($B481BC)                                   ;B4820B


DATA8_B4820E:
 
    %AICMD0x4F()                                               ;B4820E
    %AICMD0x50()                                               ;B4820F
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $09)       ;B48210
    %AICMD0x00_SetMusic($09, $B4)                              ;B48215
    %AICMD0x03_SetHour($07)                                    ;B48218
    %AICMD0x05_SetTransferPosition(128, 440)                   ;B4821A
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B4821F
    %AICMD0x09($01, $B48261)                                   ;B48221
    %AICMD0x09($02, $B48278)                                   ;B48225
    %AICMD0x09($03, $B48293)                                   ;B48229
    %AICMD0x09($04, $B482AE)                                   ;B4822D
    %AICMD0x09($05, $B482C5)                                   ;B48231
    %AICMD0x09($06, $B482E0)                                   ;B48235
    %AICMD0x09($07, $B4833E)                                   ;B48239
    %AICMD0x38()                                               ;B4823D
    %AICMD0x0C($00)                                            ;B4823E
    %AICMD0x0C($01)                                            ;B48240
    %AICMD0x0C($02)                                            ;B48242
    %AICMD0x0C($03)                                            ;B48244
    %AICMD0x0C($04)                                            ;B48246
    %AICMD0x0C($05)                                            ;B48248
    %AICMD0x0B($07)                                            ;B4824A
    %AICMD0x0C($06)                                            ;B4824C
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 16)                 ;B4824E
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B48252
    %AICMD0x0B($08)                                            ;B48254
    %AICMD0x13_Wait(180)                                       ;B48256
    %AICMD0x41_AddValue16(nLove_Maria, 30)                     ;B48259
    %AICMD0x3C()                                               ;B4825F
    %AICMD0x10_End()                                           ;B48260
B48261:
    %AICMD0x1A($0080, $0090, $B38354, $00)                     ;B48261
    %AICMD0x1F($B4826F)                                        ;B48269
    %AICMD0x12_Jump($B48269)                                   ;B4826C
B4826F:
    %AICMD0x1C_ShowDialog($02BF, $00)                          ;B4826F
    %AICMD0x0B($00)                                            ;B48273
    %AICMD0x12_Jump($B48269)                                   ;B48275
B48278:
    %AICMD0x1A($0038, $0118, $B38420, $01)                     ;B48278
    %AICMD0x1F($B48286)                                        ;B48280
    %AICMD0x12_Jump($B48280)                                   ;B48283
B48286:
    %AICMD0x1C_ShowDialog($02C1, $00)                          ;B48286
    %AICMD0x1B($02D4, $00)                                     ;B4828A
    %AICMD0x0B($01)                                            ;B4828E
    %AICMD0x12_Jump($B48280)                                   ;B48290
B48293:
    %AICMD0x1A($0050, $0118, $B38384, $01)                     ;B48293
    %AICMD0x1F($B482A1)                                        ;B4829B
    %AICMD0x12_Jump($B4829B)                                   ;B4829E
B482A1:
    %AICMD0x1B($02B3, $00)                                     ;B482A1
    %AICMD0x1C_ShowDialog($02C2, $00)                          ;B482A5
    %AICMD0x0B($02)                                            ;B482A9
    %AICMD0x12_Jump($B4829B)                                   ;B482AB
B482AE:
    %AICMD0x1A($0080, $01C8, $B38294, $01)                     ;B482AE
    %AICMD0x1F($B482BC)                                        ;B482B6
    %AICMD0x12_Jump($B482B6)                                   ;B482B9
B482BC:
    %AICMD0x1C_ShowDialog($037A, $00)                          ;B482BC
    %AICMD0x0B($03)                                            ;B482C0
    %AICMD0x12_Jump($B482B6)                                   ;B482C2
B482C5:
    %AICMD0x1A($00B8, $0158, $B382AC, $01)                     ;B482C5
    %AICMD0x1F($B482D3)                                        ;B482CD
    %AICMD0x12_Jump($B482CD)                                   ;B482D0
B482D3:
    %AICMD0x1B($0278, $00)                                     ;B482D3
    %AICMD0x1C_ShowDialog($035F, $00)                          ;B482D7
    %AICMD0x0B($04)                                            ;B482DB
    %AICMD0x12_Jump($B482CD)                                   ;B482DD
B482E0:
    %AICMD0x1A($00C8, $0118, $B3827C, $01)                     ;B482E0
    %AICMD0x1F($B482EE)                                        ;B482E8
    %AICMD0x12_Jump($B482E8)                                   ;B482EB
B482EE:
    %AICMD0x1C_ShowDialog($02C0, $00)                          ;B482EE
    %AICMD0x1B($026B, $00)                                     ;B482F2
    %AICMD0x0B($05)                                            ;B482F6
    %AICMD0x12_Jump($B482E8)                                   ;B482F8
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $01, $B4831A)   ;B482FB
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, $B48323)   ;B48302
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $03, $B4832C)   ;B48309
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $04, $B48335)   ;B48310
    %AICMD0x12_Jump($B48348)                                   ;B48317
B4831A:
    %AICMD0x41_AddValue16(nLove_Ann, -30)                      ;B4831A
    %AICMD0x12_Jump($B48348)                                   ;B48320
B48323:
    %AICMD0x41_AddValue16(nLove_Nina, -30)                     ;B48323
    %AICMD0x12_Jump($B48348)                                   ;B48329
B4832C:
    %AICMD0x41_AddValue16(nLove_Ellen, -30)                    ;B4832C
    %AICMD0x12_Jump($B48348)                                   ;B48332
B48335:
    %AICMD0x41_AddValue16(nLove_Eve, -30)                      ;B48335
    %AICMD0x12_Jump($B48348)                                   ;B4833B
B4833E:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $00, $B48355)   ;B4833E
    %AICMD0x12_Jump($B482FB)                                   ;B48345
B48348:
    %AICMD0x1A($00C1, $0088, $B38180, $01)                     ;B48348
    %AICMD0x0C($07)                                            ;B48350
    %AICMD0x12_Jump($B4835F)                                   ;B48352
B48355:
    %AICMD0x1A($00C1, $0088, $B38180, $01)                     ;B48355
    %AICMD0x0C($07)                                            ;B4835D
B4835F:
    %AICMD0x1F($B48365)                                        ;B4835F
    %AICMD0x12_Jump($B4835F)                                   ;B48362
B48365:
    %AICMD0x08_EnableAIControl()                               ;B48365
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $00, $B483E5)   ;B48366
    %AICMD0x45_JumpIfBetween16(nLove_Maria, 0, 200, $B4838E)   ;B4836D
    %AICMD0x45_JumpIfBetween16(nLove_Maria, 201, 300, $B483AB) ;B48377
    %AICMD0x45_JumpIfBetween16(nLove_Maria, 301, 999, $B483C8) ;B48381
    %AICMD0x12_Jump($B4835F)                                   ;B4838B
B4838E:
    %AICMD0x0B($06)                                            ;B4838E
    %AICMD0x0C($08)                                            ;B48390
    %AICMD0x13_Wait(30)                                        ;B48392
    %AICMD0x1B($0223, $01)                                     ;B48395
    %AICMD0x0D($01, $00, $10, $01)                             ;B48399
    %AICMD0x13_Wait(60)                                        ;B4839E
    %AICMD0x1C_ShowDialog($02C3, $00)                          ;B483A1
    %AICMD0x13_Wait(180)                                       ;B483A5
    %AICMD0x12_Jump($B4835F)                                   ;B483A8
B483AB:
    %AICMD0x0B($06)                                            ;B483AB
    %AICMD0x0C($08)                                            ;B483AD
    %AICMD0x13_Wait(30)                                        ;B483AF
    %AICMD0x1B($0223, $01)                                     ;B483B2
    %AICMD0x0D($01, $00, $10, $01)                             ;B483B6
    %AICMD0x13_Wait(60)                                        ;B483BB
    %AICMD0x1C_ShowDialog($02C4, $00)                          ;B483BE
    %AICMD0x13_Wait(180)                                       ;B483C2
    %AICMD0x12_Jump($B4835F)                                   ;B483C5
B483C8:
    %AICMD0x0B($06)                                            ;B483C8
    %AICMD0x0C($08)                                            ;B483CA
    %AICMD0x13_Wait(30)                                        ;B483CC
    %AICMD0x1B($0223, $01)                                     ;B483CF
    %AICMD0x0D($01, $00, $10, $01)                             ;B483D3
    %AICMD0x13_Wait(60)                                        ;B483D8
    %AICMD0x1C_ShowDialog($0435, $00)                          ;B483DB
    %AICMD0x13_Wait(180)                                       ;B483DF
    %AICMD0x12_Jump($B4835F)                                   ;B483E2
B483E5:
    %AICMD0x0B($06)                                            ;B483E5
    %AICMD0x0C($08)                                            ;B483E7
    %AICMD0x13_Wait(30)                                        ;B483E9
    %AICMD0x1B($02E7, $01)                                     ;B483EC
    %AICMD0x0D($01, $00, $10, $01)                             ;B483F0
    %AICMD0x13_Wait(60)                                        ;B483F5
    %AICMD0x1C_ShowDialog($0436, $00)                          ;B483F8
    %AICMD0x13_Wait(180)                                       ;B483FC
    %AICMD0x12_Jump($B4835F)                                   ;B483FF


DATA8_B48402:
 
    %AICMD0x4F()                                               ;B48402
    %AICMD0x50()                                               ;B48403
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $09)       ;B48404
    %AICMD0x00_SetMusic($07, $B4)                              ;B48409
    %AICMD0x03_SetHour($12)                                    ;B4840C
    %AICMD0x05_SetTransferPosition(144, 440)                   ;B4840E
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B48413
    %AICMD0x09($01, $B48450)                                   ;B48415
    %AICMD0x09($02, $B48467)                                   ;B48419
    %AICMD0x09($03, $B4847E)                                   ;B4841D
    %AICMD0x09($04, $B48499)                                   ;B48421
    %AICMD0x09($05, $B48525)                                   ;B48425
    %AICMD0x09($06, $B484B4)                                   ;B48429
    %AICMD0x09($07, $B484CB)                                   ;B4842D
    %AICMD0x38()                                               ;B48431
    %AICMD0x0C($00)                                            ;B48432
    %AICMD0x0C($01)                                            ;B48434
    %AICMD0x0C($02)                                            ;B48436
    %AICMD0x0C($03)                                            ;B48438
    %AICMD0x0C($05)                                            ;B4843A
    %AICMD0x0C($06)                                            ;B4843C
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown1, $05)     ;B4843E
    %AICMD0x0C($04)                                            ;B48443
    %AICMD0x13_Wait(180)                                       ;B48445
    %AICMD0x41_AddValue16(nLove_Eve, 30)                       ;B48448
    %AICMD0x3C()                                               ;B4844E
    %AICMD0x10_End()                                           ;B4844F
B48450:
    %AICMD0x1A($0028, $0198, $B382DC, $00)                     ;B48450
    %AICMD0x1F($B4845E)                                        ;B48458
    %AICMD0x12_Jump($B48458)                                   ;B4845B
B4845E:
    %AICMD0x1C_ShowDialog($02C5, $00)                          ;B4845E
    %AICMD0x0B($00)                                            ;B48462
    %AICMD0x12_Jump($B48458)                                   ;B48464
B48467:
    %AICMD0x1A($0064, $0170, $B38348, $00)                     ;B48467
    %AICMD0x1F($B48475)                                        ;B4846F
    %AICMD0x12_Jump($B4846F)                                   ;B48472
B48475:
    %AICMD0x1C_ShowDialog($02C6, $00)                          ;B48475
    %AICMD0x0B($01)                                            ;B48479
    %AICMD0x12_Jump($B4846F)                                   ;B4847B
B4847E:
    %AICMD0x1A($00B4, $01A0, $B38318, $01)                     ;B4847E
    %AICMD0x1F($B4848C)                                        ;B48486
    %AICMD0x12_Jump($B48486)                                   ;B48489
B4848C:
    %AICMD0x1C_ShowDialog($02C7, $00)                          ;B4848C
    %AICMD0x1B($0298, $00)                                     ;B48490
    %AICMD0x0B($02)                                            ;B48494
    %AICMD0x12_Jump($B48486)                                   ;B48496
B48499:
    %AICMD0x1A($00B4, $0170, $B383FC, $00)                     ;B48499
    %AICMD0x1F($B484A7)                                        ;B484A1
    %AICMD0x12_Jump($B484A1)                                   ;B484A4
B484A7:
    %AICMD0x1C_ShowDialog($02C8, $00)                          ;B484A7
    %AICMD0x1B($02CC, $00)                                     ;B484AB
    %AICMD0x0B($03)                                            ;B484AF
    %AICMD0x12_Jump($B484A1)                                   ;B484B1
B484B4:
    %AICMD0x1A($0088, $0148, $B38234, $00)                     ;B484B4
    %AICMD0x1F($B484C2)                                        ;B484BC
    %AICMD0x12_Jump($B484BC)                                   ;B484BF
B484C2:
    %AICMD0x1C_ShowDialog($0407, $00)                          ;B484C2
    %AICMD0x0B($05)                                            ;B484C6
    %AICMD0x12_Jump($B484BC)                                   ;B484C8
B484CB:
    %AICMD0x1A($0090, $01C8, $B38234, $01)                     ;B484CB
    %AICMD0x1F($B484D9)                                        ;B484D3
    %AICMD0x12_Jump($B484D3)                                   ;B484D6
B484D9:
    %AICMD0x1C_ShowDialog($03D9, $00)                          ;B484D9
    %AICMD0x0B($06)                                            ;B484DD
    %AICMD0x12_Jump($B484D3)                                   ;B484DF
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $00, $B48501)   ;B484E2
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $01, $B4850A)   ;B484E9
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, $B48513)   ;B484F0
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $03, $B4851C)   ;B484F7
    %AICMD0x12_Jump($B4852F)                                   ;B484FE
B48501:
    %AICMD0x41_AddValue16(nLove_Maria, -30)                    ;B48501
    %AICMD0x12_Jump($B4852F)                                   ;B48507
B4850A:
    %AICMD0x41_AddValue16(nLove_Ann, -30)                      ;B4850A
    %AICMD0x12_Jump($B4852F)                                   ;B48510
B48513:
    %AICMD0x41_AddValue16(nLove_Nina, -30)                     ;B48513
    %AICMD0x12_Jump($B4852F)                                   ;B48519
B4851C:
    %AICMD0x41_AddValue16(nLove_Ellen, -30)                    ;B4851C
    %AICMD0x12_Jump($B4852F)                                   ;B48522
B48525:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $04, $B48541)   ;B48525
    %AICMD0x12_Jump($B484E2)                                   ;B4852C
B4852F:
    %AICMD0x1A($0038, $01C0, $B38204, $00)                     ;B4852F
    %AICMD0x22($18, $08, $01, $B38210, $08)                    ;B48537
    %AICMD0x12_Jump($B48550)                                   ;B4853E
B48541:
    %AICMD0x1A($0038, $01C0, $B3845C, $01)                     ;B48541
    %AICMD0x22($18, $08, $01, $B38474, $08)                    ;B48549
B48550:
    %AICMD0x1F($B48556)                                        ;B48550
    %AICMD0x12_Jump($B48550)                                   ;B48553
B48556:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $05, $B48564) ;B48556
    %AICMD0x1C_ShowDialog($0151, $00)                          ;B4855D
    %AICMD0x12_Jump($B48550)                                   ;B48561
B48564:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $04, $B485B9)   ;B48564
    %AICMD0x45_JumpIfBetween16(nLove_Eve, 0, 200, $B4858C)     ;B4856B
    %AICMD0x45_JumpIfBetween16(nLove_Eve, 201, 300, $B4859B)   ;B48575
    %AICMD0x45_JumpIfBetween16(nLove_Eve, 301, 999, $B485AA)   ;B4857F
    %AICMD0x12_Jump($B48550)                                   ;B48589
B4858C:
    %AICMD0x1C_ShowDialog($02C9, $00)                          ;B4858C
    %AICMD0x32($8000D4, $0015)                                 ;B48590
    %AICMD0x0B($04)                                            ;B48596
    %AICMD0x12_Jump($B48550)                                   ;B48598
B4859B:
    %AICMD0x1C_ShowDialog($02CA, $00)                          ;B4859B
    %AICMD0x32($8000D4, $0015)                                 ;B4859F
    %AICMD0x0B($04)                                            ;B485A5
    %AICMD0x12_Jump($B48550)                                   ;B485A7
B485AA:
    %AICMD0x1C_ShowDialog($0437, $00)                          ;B485AA
    %AICMD0x32($8000D4, $0015)                                 ;B485AE
    %AICMD0x0B($04)                                            ;B485B4
    %AICMD0x12_Jump($B48550)                                   ;B485B6
B485B9:
    %AICMD0x1C_ShowDialog($0438, $00)                          ;B485B9
    %AICMD0x32($8000D4, $0015)                                 ;B485BD
    %AICMD0x0B($04)                                            ;B485C3
    %AICMD0x12_Jump($B48550)                                   ;B485C5


DATA8_B485C8:
 
    %AICMD0x4F()                                               ;B485C8
    %AICMD0x50()                                               ;B485C9
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $09)       ;B485CA
    %AICMD0x00_SetMusic($0E, $B4)                              ;B485CF
    %AICMD0x03_SetHour($12)                                    ;B485D2
    %AICMD0x05_SetTransferPosition(120, 456)                   ;B485D4
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B485D9
    %AICMD0x08_EnableAIControl()                               ;B485DB
    %AICMD0x09($01, $B48679)                                   ;B485DC
    %AICMD0x38()                                               ;B485E0
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 176)                   ;B485E1
    %AICMD0x13_Wait(60)                                        ;B485E5
    %AICMD0x29_SetMapScrooling(0, -1, 240)                     ;B485E8
    %AICMD0x13_Wait(240)                                       ;B485EE
    %AICMD0x29_SetMapScrooling(0, -1, 64)                      ;B485F1
    %AICMD0x13_Wait(64)                                        ;B485F7
    %AICMD0x09($02, $B48625)                                   ;B485FA
    %AICMD0x0C($00)                                            ;B485FE
    %AICMD0x29_SetMapScrooling(0, 1, 240)                      ;B48600
    %AICMD0x13_Wait(240)                                       ;B48606
    %AICMD0x29_SetMapScrooling(0, 1, 64)                       ;B48609
    %AICMD0x13_Wait(64)                                        ;B4860F
    %AICMD0x0B($01)                                            ;B48612
    %AICMD0x0C($02)                                            ;B48614
    %AICMD0x19($0006, $00)                                     ;B48616
    %AICMD0x13_Wait(180)                                       ;B4861A
    %AICMD0x41_AddValue16(nLove_Nina, 30)                      ;B4861D
    %AICMD0x3C()                                               ;B48623
    %AICMD0x10_End()                                           ;B48624
B48625:
    %AICMD0x1A($0100, $FF80, $B3857C, $00)                     ;B48625
    %AICMD0x0D($FE, $01, $A0, $01)                             ;B4862D
    %AICMD0x0B($00)                                            ;B48632
    %AICMD0x37()                                               ;B48634
    %AICMD0x10_End()                                           ;B48635
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $00, $B48655)   ;B48636
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $01, $B4865E)   ;B4863D
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $03, $B48667)   ;B48644
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $04, $B48670)   ;B4864B
    %AICMD0x12_Jump($B48683)                                   ;B48652
B48655:
    %AICMD0x41_AddValue16(nLove_Maria, -30)                    ;B48655
    %AICMD0x12_Jump($B48683)                                   ;B4865B
B4865E:
    %AICMD0x41_AddValue16(nLove_Ann, -30)                      ;B4865E
    %AICMD0x12_Jump($B48683)                                   ;B48664
B48667:
    %AICMD0x41_AddValue16(nLove_Ellen, -30)                    ;B48667
    %AICMD0x12_Jump($B48683)                                   ;B4866D
B48670:
    %AICMD0x41_AddValue16(nLove_Eve, -30)                      ;B48670
    %AICMD0x12_Jump($B48683)                                   ;B48676
B48679:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, $B486AF)   ;B48679
    %AICMD0x12_Jump($B48636)                                   ;B48680
B48683:
    %AICMD0x1A($0088, $0118, $B381C8, $01)                     ;B48683
    %AICMD0x0C($01)                                            ;B4868B
    %AICMD0x1B($0250, $00)                                     ;B4868D
    %AICMD0x45_JumpIfBetween16(nLove_Nina, 0, 200, $B486C6)    ;B48691
    %AICMD0x45_JumpIfBetween16(nLove_Nina, 201, 300, $B486CF)  ;B4869B
    %AICMD0x45_JumpIfBetween16(nLove_Nina, 301, 999, $B486D8)  ;B486A5
B486AF:
    %AICMD0x1A($0088, $0118, $B3845C, $01)                     ;B486AF
    %AICMD0x0C($01)                                            ;B486B7
    %AICMD0x1B($02E6, $00)                                     ;B486B9
    %AICMD0x12_Jump($B486E1)                                   ;B486BD
    %AICMD0x13_Wait(1)                                         ;B486C0
    %AICMD0x12_Jump($B486C0)                                   ;B486C3
B486C6:
    %AICMD0x1C_ShowDialog($02CB, $00)                          ;B486C6
    %AICMD0x0B($02)                                            ;B486CA
    %AICMD0x12_Jump($B486C0)                                   ;B486CC
B486CF:
    %AICMD0x1C_ShowDialog($02CC, $00)                          ;B486CF
    %AICMD0x0B($02)                                            ;B486D3
    %AICMD0x12_Jump($B486C0)                                   ;B486D5
B486D8:
    %AICMD0x1C_ShowDialog($0439, $00)                          ;B486D8
    %AICMD0x0B($02)                                            ;B486DC
    %AICMD0x12_Jump($B486C0)                                   ;B486DE
B486E1:
    %AICMD0x1C_ShowDialog($043A, $00)                          ;B486E1
    %AICMD0x0B($02)                                            ;B486E5
    %AICMD0x12_Jump($B486C0)                                   ;B486E7


DATA8_B486EA:
 
    %AICMD0x4F()                                               ;B486EA
    %AICMD0x50()                                               ;B486EB
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $09)       ;B486EC
    %AICMD0x00_SetMusic($0E, $B4)                              ;B486F1
    %AICMD0x03_SetHour($12)                                    ;B486F4
    %AICMD0x05_SetTransferPosition(24, 88)                     ;B486F6
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B486FB
    %AICMD0x08_EnableAIControl()                               ;B486FD
    %AICMD0x09($01, $B4875D)                                   ;B486FE
    %AICMD0x38()                                               ;B48702
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 32)                 ;B48703
    %AICMD0x13_Wait(120)                                       ;B48707
    %AICMD0x11_EnableUserControl()                             ;B4870A
    %AICMD0x0B($00)                                            ;B4870B
    %AICMD0x0C($01)                                            ;B4870D
    %AICMD0x13_Wait(180)                                       ;B4870F
    %AICMD0x41_AddValue16(nLove_Ann, 30)                       ;B48712
    %AICMD0x3C()                                               ;B48718
    %AICMD0x10_End()                                           ;B48719
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $00, $B48739)   ;B4871A
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, $B48742)   ;B48721
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $03, $B4874B)   ;B48728
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $04, $B48754)   ;B4872F
    %AICMD0x12_Jump($B48760)                                   ;B48736
B48739:
    %AICMD0x41_AddValue16(nLove_Maria, -30)                    ;B48739
    %AICMD0x12_Jump($B48760)                                   ;B4873F
B48742:
    %AICMD0x41_AddValue16(nLove_Nina, -30)                     ;B48742
    %AICMD0x12_Jump($B48760)                                   ;B48748
B4874B:
    %AICMD0x41_AddValue16(nLove_Ellen, -30)                    ;B4874B
    %AICMD0x12_Jump($B48760)                                   ;B48751
B48754:
    %AICMD0x41_AddValue16(nLove_Eve, -30)                      ;B48754
    %AICMD0x12_Jump($B48760)                                   ;B4875A
B4875D:
    %AICMD0x12_Jump($B4871A)                                   ;B4875D
B48760:
    %AICMD0x1A($00A8, $0098, $B381BC, $01)                     ;B48760
    %AICMD0x1F($B4876E)                                        ;B48768
    %AICMD0x12_Jump($B48768)                                   ;B4876B
B4876E:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $01, $B487B1)   ;B4876E
    %AICMD0x45_JumpIfBetween16(nLove_Ann, 0, 200, $B48796)     ;B48775
    %AICMD0x45_JumpIfBetween16(nLove_Ann, 201, 300, $B4879F)   ;B4877F
    %AICMD0x45_JumpIfBetween16(nLove_Ann, 301, 999, $B487A8)   ;B48789
    %AICMD0x12_Jump($B48768)                                   ;B48793
B48796:
    %AICMD0x1C_ShowDialog($02CD, $00)                          ;B48796
    %AICMD0x0B($01)                                            ;B4879A
    %AICMD0x12_Jump($B48768)                                   ;B4879C
B4879F:
    %AICMD0x1C_ShowDialog($02A9, $00)                          ;B4879F
    %AICMD0x0B($01)                                            ;B487A3
    %AICMD0x12_Jump($B48768)                                   ;B487A5
B487A8:
    %AICMD0x1C_ShowDialog($043B, $00)                          ;B487A8
    %AICMD0x0B($01)                                            ;B487AC
    %AICMD0x12_Jump($B48768)                                   ;B487AE
B487B1:
    %AICMD0x1C_ShowDialog($043C, $00)                          ;B487B1
    %AICMD0x0B($01)                                            ;B487B5
    %AICMD0x12_Jump($B48768)                                   ;B487B7


pAIScripting0x10_WoodsPondEvent:
    dw AI_WaterImp                                             ;B487BA|        |B487DA;
    dw pAIScripting0x11                                        ;B487BC|        |B4881A;
    dw pAIScripting0x11                                        ;B487BE|        |B4881A;
    dw pAIScripting0x11                                        ;B487C0|        |B4881A;
    dw pAIScripting0x11                                        ;B487C2|        |B4881A;
    dw pAIScripting0x11                                        ;B487C4|        |B4881A;
    dw pAIScripting0x11                                        ;B487C6|        |B4881A;
    dw pAIScripting0x11                                        ;B487C8|        |B4881A;
    dw pAIScripting0x11                                        ;B487CA|        |B4881A;
    dw pAIScripting0x11                                        ;B487CC|        |B4881A;
    dw pAIScripting0x11                                        ;B487CE|        |B4881A;
    dw pAIScripting0x11                                        ;B487D0|        |B4881A;
    dw pAIScripting0x11                                        ;B487D2|        |B4881A;
    dw pAIScripting0x11                                        ;B487D4|        |B4881A;
    dw pAIScripting0x11                                        ;B487D6|        |B4881A;
    dw pAIScripting0x11                                        ;B487D8|        |B4881A;
 
AI_WaterImp:
 
    %AICMD0x08_EnableAIControl()                               ;B487DA
    %AICMD0x13_Wait(60)                                        ;B487DB
    %AICMD0x09($07, $B487E7)                                   ;B487DE
    %AICMD0x09($15, $B487FA)                                   ;B487E2
    %AICMD0x10_End()                                           ;B487E6
B487E7:
    %AICMD0x1A($02B0, $0170, $B38564, $00)                     ;B487E7
    %AICMD0x1C_ShowDialog($0335, $00)                          ;B487EF
    %AICMD0x0B($00)                                            ;B487F3
    %AICMD0x13_Wait(180)                                       ;B487F5
    %AICMD0x37()                                               ;B487F8
    %AICMD0x10_End()                                           ;B487F9
B487FA:
    %AICMD0x0C($00)                                            ;B487FA
    %AICMD0x1A($02A8, $0178, $B38720, $00)                     ;B487FC
    %AICMD0x0D($00, $01, $0C, $01)                             ;B48804
    %AICMD0x0D($00, $02, $12, $01)                             ;B48809
    %AICMD0x13_Wait(180)                                       ;B4880E
    %AICMD0x1B($040D, $00)                                     ;B48811
    %AICMD0x11_EnableUserControl()                             ;B48815
    %AICMD0x4A()                                               ;B48816
    %AICMD0x12_Jump($B48816)                                   ;B48817


pAIScripting0x11:
    dw DATA8_B4883A                                            ;B4881A|        |B4883A;
    dw pAIScripting0x12                                        ;B4881C|        |B488A2;
    dw pAIScripting0x12                                        ;B4881E|        |B488A2;
    dw pAIScripting0x12                                        ;B48820|        |B488A2;
    dw pAIScripting0x12                                        ;B48822|        |B488A2;
    dw pAIScripting0x12                                        ;B48824|        |B488A2;
    dw pAIScripting0x12                                        ;B48826|        |B488A2;
    dw pAIScripting0x12                                        ;B48828|        |B488A2;
    dw pAIScripting0x12                                        ;B4882A|        |B488A2;
    dw pAIScripting0x12                                        ;B4882C|        |B488A2;
    dw pAIScripting0x12                                        ;B4882E|        |B488A2;
    dw pAIScripting0x12                                        ;B48830|        |B488A2;
    dw pAIScripting0x12                                        ;B48832|        |B488A2;
    dw pAIScripting0x12                                        ;B48834|        |B488A2;
    dw pAIScripting0x12                                        ;B48836|        |B488A2;
    dw pAIScripting0x12                                        ;B48838|        |B488A2;
 
DATA8_B4883A:
 
    %AICMD0x50()                                               ;B4883A
    %AICMD0x09($01, $B4886E)                                   ;B4883B
    %AICMD0x38()                                               ;B4883F
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 80)                  ;B48840
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B48844
    %AICMD0x1D_ShowDialog($0148, $00)                          ;B48846
    %AICMD0x20_JumpIfChoice(0, $B48852)                        ;B4884A
    %AICMD0x20_JumpIfChoice(1, $B48864)                        ;B4884E
B48852:
    %AICMD0x0F_ScreenFadeout($01)                              ;B48852
    %AICMD0x09($02, $B4888E)                                   ;B48854
    %AICMD0x0A($01)                                            ;B48858
    %AICMD0x1C_ShowDialog($014A, $00)                          ;B4885A
    %AICMD0x0B($00)                                            ;B4885E
    %AICMD0x0C($01)                                            ;B48860
    %AICMD0x11_EnableUserControl()                             ;B48862
    %AICMD0x10_End()                                           ;B48863
B48864:
    %AICMD0x1C_ShowDialog($014C, $00)                          ;B48864
    %AICMD0x0B($00)                                            ;B48868
    %AICMD0x0C($01)                                            ;B4886A
    %AICMD0x11_EnableUserControl()                             ;B4886C
    %AICMD0x10_End()                                           ;B4886D
B4886E:
    %AICMD0x1A($0068, $01A8, $B383A8, $02)                     ;B4886E
    %AICMD0x0C($00)                                            ;B48876
    %AICMD0x1B($02BB, $00)                                     ;B48878
    %AICMD0x0D($00, $01, $10, $01)                             ;B4887C
    %AICMD0x1B($02BF, $00)                                     ;B48881
    %AICMD0x0D($FF, $00, $A0, $01)                             ;B48885
    %AICMD0x0B($01)                                            ;B4888A
    %AICMD0x37()                                               ;B4888C
    %AICMD0x10_End()                                           ;B4888D
B4888E:
    %AICMD0x1A($0078, $01A8, $B38144, $00)                     ;B4888E
    %AICMD0x0C($00)                                            ;B48896
    %AICMD0x13_Wait(30)                                        ;B48898
    %AICMD0x0D($FF, $00, $A0, $01)                             ;B4889B
    %AICMD0x37()                                               ;B488A0
    %AICMD0x10_End()                                           ;B488A1


pAIScripting0x12:
    dw DATA8_B488C2                                            ;B488A2|        |B488C2;
    dw pAIScripting0x13                                        ;B488A4|        |B4892C;
    dw pAIScripting0x13                                        ;B488A6|        |B4892C;
    dw pAIScripting0x13                                        ;B488A8|        |B4892C;
    dw pAIScripting0x13                                        ;B488AA|        |B4892C;
    dw pAIScripting0x13                                        ;B488AC|        |B4892C;
    dw pAIScripting0x13                                        ;B488AE|        |B4892C;
    dw pAIScripting0x13                                        ;B488B0|        |B4892C;
    dw pAIScripting0x13                                        ;B488B2|        |B4892C;
    dw pAIScripting0x13                                        ;B488B4|        |B4892C;
    dw pAIScripting0x13                                        ;B488B6|        |B4892C;
    dw pAIScripting0x13                                        ;B488B8|        |B4892C;
    dw pAIScripting0x13                                        ;B488BA|        |B4892C;
    dw pAIScripting0x13                                        ;B488BC|        |B4892C;
    dw pAIScripting0x13                                        ;B488BE|        |B4892C;
    dw pAIScripting0x13                                        ;B488C0|        |B4892C;
 
DATA8_B488C2:
 
    %AICMD0x50()                                               ;B488C2
    %AICMD0x00_SetMusic($0A, $B4)                              ;B488C3
    %AICMD0x08_EnableAIControl()                               ;B488C6
    %AICMD0x2A($0041)                                          ;B488C7
    %AICMD0x13_Wait(180)                                       ;B488CA
    %AICMD0x09($01, $B488D8)                                   ;B488CD
    %AICMD0x0C($00)                                            ;B488D1
    %AICMD0x09($10, $B4891B)                                   ;B488D3
    %AICMD0x10_End()                                           ;B488D7
B488D8:
    %AICMD0x1A($0088, $00F8, $B3851C, $00)                     ;B488D8
    %AICMD0x13_Wait(180)                                       ;B488E0
    %AICMD0x0D($00, $FF, $10, $01)                             ;B488E3
    %AICMD0x0D($01, $01, $10, $01)                             ;B488E8
    %AICMD0x0D($00, $01, $10, $01)                             ;B488ED
    %AICMD0x0D($FF, $00, $10, $01)                             ;B488F2
    %AICMD0x1C_ShowDialog($0339, $01)                          ;B488F7
    %AICMD0x0B($00)                                            ;B488FB
    %AICMD0x13_Wait(120)                                       ;B488FD
    %AICMD0x1C_ShowDialog($033A, $01)                          ;B48900
    %AICMD0x13_Wait(30)                                        ;B48904
    %AICMD0x0D($00, $FF, $10, $02)                             ;B48907
    %AICMD0x0D($00, $FF, $18, $03)                             ;B4890C
    %AICMD0x1B($0318, $00)                                     ;B48911
    %AICMD0x13_Wait(180)                                       ;B48915
    %AICMD0x37()                                               ;B48918
    %AICMD0x11_EnableUserControl()                             ;B48919
    %AICMD0x10_End()                                           ;B4891A
B4891B:
    %AICMD0x1A($0088, $0120, $B38720, $00)                     ;B4891B
    %AICMD0x0D($00, $01, $50, $02)                             ;B48923
    %AICMD0x4A()                                               ;B48928
    %AICMD0x12_Jump($B48928)                                   ;B48929


pAIScripting0x13:
    dw DATA8_B4894C                                            ;B4892C|        |B4894C;
    dw pAIScripting0x14                                        ;B4892E|        |B489D4;
    dw pAIScripting0x14                                        ;B48930|        |B489D4;
    dw pAIScripting0x14                                        ;B48932|        |B489D4;
    dw pAIScripting0x14                                        ;B48934|        |B489D4;
    dw pAIScripting0x14                                        ;B48936|        |B489D4;
    dw pAIScripting0x14                                        ;B48938|        |B489D4;
    dw pAIScripting0x14                                        ;B4893A|        |B489D4;
    dw pAIScripting0x14                                        ;B4893C|        |B489D4;
    dw pAIScripting0x14                                        ;B4893E|        |B489D4;
    dw pAIScripting0x14                                        ;B48940|        |B489D4;
    dw pAIScripting0x14                                        ;B48942|        |B489D4;
    dw pAIScripting0x14                                        ;B48944|        |B489D4;
    dw pAIScripting0x14                                        ;B48946|        |B489D4;
    dw pAIScripting0x14                                        ;B48948|        |B489D4;
    dw pAIScripting0x14                                        ;B4894A|        |B489D4;
 
DATA8_B4894C:
 
    %AICMD0x50()                                               ;B4894C
    %AICMD0x08_EnableAIControl()                               ;B4894D
    %AICMD0x09($01, $B4895F)                                   ;B4894E
    %AICMD0x38()                                               ;B48952
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 80)                  ;B48953
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B48957
    %AICMD0x0B($00)                                            ;B48959
    %AICMD0x0C($01)                                            ;B4895B
    %AICMD0x11_EnableUserControl()                             ;B4895D
    %AICMD0x10_End()                                           ;B4895E
B4895F:
    %AICMD0x1A($0078, $01A8, $B383C0, $02)                     ;B4895F
    %AICMD0x0C($00)                                            ;B48967
    %AICMD0x1D_ShowDialog($014D, $00)                          ;B48969
    %AICMD0x20_JumpIfChoice(0, $B48975)                        ;B4896D
    %AICMD0x20_JumpIfChoice(1, $B489B7)                        ;B48971
B48975:
    %AICMD0x1B($02BD, $00)                                     ;B48975
    %AICMD0x0D($00, $FF, $30, $01)                             ;B48979
    %AICMD0x1B($02C3, $01)                                     ;B4897E
    %AICMD0x0D($01, $00, $A0, $01)                             ;B48982
    %AICMD0x1B($02C0, $00)                                     ;B48987
    %AICMD0x13_Wait(180)                                       ;B4898B
    %AICMD0x1B($02C3, $00)                                     ;B4898E
    %AICMD0x0D($FF, $00, $A0, $01)                             ;B48992
    %AICMD0x1B($02C1, $00)                                     ;B48997
    %AICMD0x0D($00, $01, $30, $01)                             ;B4899B
    %AICMD0x1B($02C2, $01)                                     ;B489A0
    %AICMD0x1C_ShowDialog($014E, $00)                          ;B489A4
    %AICMD0x42_AddValue24(nMoney, -2000)                       ;B489A8
    %AICMD0x23_OrWithIndexedValue(strcFlags.event3, $0B)       ;B489AF
    %AICMD0x12_Jump($B489BE)                                   ;B489B4
B489B7:
    %AICMD0x1C_ShowDialog($014F, $00)                          ;B489B7
    %AICMD0x12_Jump($B489BE)                                   ;B489BB
B489BE:
    %AICMD0x1B($02C1, $00)                                     ;B489BE
    %AICMD0x0D($00, $01, $10, $01)                             ;B489C2
    %AICMD0x1B($02C3, $00)                                     ;B489C7
    %AICMD0x0D($FF, $00, $90, $01)                             ;B489CB
    %AICMD0x0B($01)                                            ;B489D0
    %AICMD0x37()                                               ;B489D2
    %AICMD0x10_End()                                           ;B489D3


pAIScripting0x14:
    dw DATA8_B489F4                                            ;B489D4|        |B489F4;
    dw DATA8_B48AAD                                            ;B489D6|        |B48AAD;
    dw DATA8_B48B02                                            ;B489D8|        |B48B02;
    dw DATA8_B48B9D                                            ;B489DA|        |B48B9D;
    dw DATA8_B48BE0                                            ;B489DC|        |B48BE0;
    dw pAIScripting0x15                                        ;B489DE|        |B48C27;
    dw pAIScripting0x15                                        ;B489E0|        |B48C27;
    dw pAIScripting0x15                                        ;B489E2|        |B48C27;
    dw pAIScripting0x15                                        ;B489E4|        |B48C27;
    dw pAIScripting0x15                                        ;B489E6|        |B48C27;
    dw pAIScripting0x15                                        ;B489E8|        |B48C27;
    dw pAIScripting0x15                                        ;B489EA|        |B48C27;
    dw pAIScripting0x15                                        ;B489EC|        |B48C27;
    dw pAIScripting0x15                                        ;B489EE|        |B48C27;
    dw pAIScripting0x15                                        ;B489F0|        |B48C27;
    dw pAIScripting0x15                                        ;B489F2|        |B48C27;
 
DATA8_B489F4:
 
    %AICMD0x50()                                               ;B489F4
    %AICMD0x01_UnfreezeTime()                                  ;B489F5
    %AICMD0x03_SetHour($07)                                    ;B489F6
    %AICMD0x05_SetTransferPosition(136, 344)                   ;B489F8
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B489FD
    %AICMD0x08_EnableAIControl()                               ;B489FF
    %AICMD0x09($01, $B48A1D)                                   ;B48A00
    %AICMD0x38()                                               ;B48A04
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 80)                  ;B48A05
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B48A09
    %AICMD0x0B($00)                                            ;B48A0B
    %AICMD0x0C($01)                                            ;B48A0D
    %AICMD0x0F_ScreenFadeout($01)                              ;B48A0F
    %AICMD0x09($02, $B48A8D)                                   ;B48A11
    %AICMD0x0A($01)                                            ;B48A15
    %AICMD0x0B($02)                                            ;B48A17
    %AICMD0x0C($04)                                            ;B48A19
    %AICMD0x11_EnableUserControl()                             ;B48A1B
    %AICMD0x10_End()                                           ;B48A1C
B48A1D:
    %AICMD0x1A($FFF0, $01A8, $B383B4, $02)                     ;B48A1D
    %AICMD0x0C($00)                                            ;B48A25
    %AICMD0x0D($01, $00, $60, $01)                             ;B48A27
    %AICMD0x1D_ShowDialog($0149, $00)                          ;B48A2C
    %AICMD0x20_JumpIfChoice(0, $B48A38)                        ;B48A30
    %AICMD0x20_JumpIfChoice(1, $B48A63)                        ;B48A34
B48A38:
    %AICMD0x0B($01)                                            ;B48A38
    %AICMD0x0C($02)                                            ;B48A3A
    %AICMD0x1B($02BB, $00)                                     ;B48A3C
    %AICMD0x0D($00, $01, $20, $01)                             ;B48A40
    %AICMD0x1B($02BF, $00)                                     ;B48A45
    %AICMD0x0D($FF, $00, $20, $01)                             ;B48A49
    %AICMD0x1B($02BB, $00)                                     ;B48A4E
    %AICMD0x1C_ShowDialog($014A, $00)                          ;B48A52
    %AICMD0x23_OrWithIndexedValue(strcFlags.event1, $06)       ;B48A56
    %AICMD0x23_OrWithIndexedValue(strcFlags.event1, $07)       ;B48A5B
    %AICMD0x12_Jump($B48A6A)                                   ;B48A60
B48A63:
    %AICMD0x1C_ShowDialog($014C, $00)                          ;B48A63
    %AICMD0x12_Jump($B48A77)                                   ;B48A67
B48A6A:
    %AICMD0x1B($02BF, $00)                                     ;B48A6A
    %AICMD0x0D($FF, $00, $40, $01)                             ;B48A6E
    %AICMD0x0B($03)                                            ;B48A73
    %AICMD0x37()                                               ;B48A75
    %AICMD0x10_End()                                           ;B48A76
B48A77:
    %AICMD0x1B($02BB, $00)                                     ;B48A77
    %AICMD0x0D($00, $01, $20, $01)                             ;B48A7B
    %AICMD0x1B($02BF, $00)                                     ;B48A80
    %AICMD0x0D($FF, $00, $A0, $01)                             ;B48A84
    %AICMD0x0B($04)                                            ;B48A89
    %AICMD0x37()                                               ;B48A8B
    %AICMD0x10_End()                                           ;B48A8C
B48A8D:
    %AICMD0x1A($0048, $01E8, $B380FC, $03)                     ;B48A8D
    %AICMD0x0C($03)                                            ;B48A95
    %AICMD0x1B($01A7, $00)                                     ;B48A97
    %AICMD0x0D($00, $FF, $10, $01)                             ;B48A9B
    %AICMD0x1B($018B, $00)                                     ;B48AA0
    %AICMD0x0D($FF, $00, $40, $01)                             ;B48AA4
    %AICMD0x0B($04)                                            ;B48AA9
    %AICMD0x37()                                               ;B48AAB
    %AICMD0x10_End()                                           ;B48AAC


DATA8_B48AAD:
 
    %AICMD0x4F()                                               ;B48AAD
    %AICMD0x50()                                               ;B48AAE
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $09)       ;B48AAF
    %AICMD0x00_SetMusic($0A, $B4)                              ;B48AB4
    %AICMD0x05_SetTransferPosition(128, 456)                   ;B48AB7
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B48ABC
    %AICMD0x08_EnableAIControl()                               ;B48ABE
    %AICMD0x02_FreezeTime()                                    ;B48ABF
    %AICMD0x03_SetHour($07)                                    ;B48AC0
    %AICMD0x09($01, $B48AD2)                                   ;B48AC2
    %AICMD0x19($00E8, $00)                                     ;B48AC6
    %AICMD0x06_SetDestinationArea(!AREA_MOUNTAINTOPBEAN)       ;B48ACA
    %AICMD0x38()                                               ;B48ACC
    %AICMD0x0C($00)                                            ;B48ACD
    %AICMD0x3D_TeleportToArea(!AREA_GOLDCHICKEN)               ;B48ACF
    %AICMD0x10_End()                                           ;B48AD1
B48AD2:
    %AICMD0x1A($0080, $01C8, $B380E4, $01)                     ;B48AD2
    %AICMD0x0D($00, $FF, $40, $01)                             ;B48ADA
    %AICMD0x29_SetMapScrooling(0, -1, 64)                      ;B48ADF
    %AICMD0x0D($00, $FF, $50, $01)                             ;B48AE5
    %AICMD0x1B($0006, $00)                                     ;B48AEA
    %AICMD0x13_Wait(60)                                        ;B48AEE
    %AICMD0x1B($0063, $00)                                     ;B48AF1
    %AICMD0x0D($00, $FF, $90, $02)                             ;B48AF5
    %AICMD0x0B($00)                                            ;B48AFA
    %AICMD0x13_Wait(1)                                         ;B48AFC
    %AICMD0x12_Jump($B48AFC)                                   ;B48AFF


DATA8_B48B02:
 
    %AICMD0x4F()                                               ;B48B02
    %AICMD0x50()                                               ;B48B03
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $09)       ;B48B04
    %AICMD0x03_SetHour($07)                                    ;B48B09
    %AICMD0x05_SetTransferPosition(136, 632)                   ;B48B0B
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B48B10
    %AICMD0x09($01, $B48B25)                                   ;B48B12
    %AICMD0x28(strcFlags.event3, $09)                          ;B48B16
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $0A)       ;B48B1B
    %AICMD0x06_SetDestinationArea(!AREA_GOLDCHICKEN)           ;B48B20
    %AICMD0x38()                                               ;B48B22
    %AICMD0x11_EnableUserControl()                             ;B48B23
    %AICMD0x10_End()                                           ;B48B24
B48B25:
    %AICMD0x1A($0088, $00CC, $B38624, $00)                     ;B48B25
    %AICMD0x1F($B48B39)                                        ;B48B2D
    %AICMD0x12_Jump($B48B2D)                                   ;B48B30
    %AICMD0x1F($B48B8A)                                        ;B48B33
    %AICMD0x12_Jump($B48B33)                                   ;B48B36
B48B39:
    %AICMD0x1D_ShowDialog($0336, $00)                          ;B48B39
    %AICMD0x20_JumpIfChoice(1, $B48B7C)                        ;B48B3D
    %AICMD0x08_EnableAIControl()                               ;B48B41
    %AICMD0x1B($021B, $00)                                     ;B48B42
    %AICMD0x09($02, $B48B91)                                   ;B48B46
    %AICMD0x0D($FF, $FF, $24, $02)                             ;B48B4A
    %AICMD0x13_Wait(30)                                        ;B48B4F
    %AICMD0x1B($021C, $00)                                     ;B48B52
    %AICMD0x13_Wait(120)                                       ;B48B56
    %AICMD0x1C_ShowDialog($0337, $00)                          ;B48B59
    %AICMD0x0B($00)                                            ;B48B5D
    %AICMD0x2A($0043)                                          ;B48B5F
    %AICMD0x4B($C3, $0040, $0080)                              ;B48B62
    %AICMD0x3E_SetCarryItem($23)                               ;B48B68
    %AICMD0x13_Wait(60)                                        ;B48B6A
    %AICMD0x32($8000D4, $0000)                                 ;B48B6D
    %AICMD0x28($8000D2, $01)                                   ;B48B73
    %AICMD0x11_EnableUserControl()                             ;B48B78
    %AICMD0x12_Jump($B48B33)                                   ;B48B79
B48B7C:
    %AICMD0x2A($0043)                                          ;B48B7C
    %AICMD0x4B($C3, $0040, $0080)                              ;B48B7F
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily2, $0C)       ;B48B85
B48B8A:
    %AICMD0x1C_ShowDialog($0338, $00)                          ;B48B8A
    %AICMD0x12_Jump($B48B33)                                   ;B48B8E
B48B91:
    %AICMD0x1A($0088, $00C8, $B38618, $00)                     ;B48B91
    %AICMD0x0C($00)                                            ;B48B99
    %AICMD0x37()                                               ;B48B9B
    %AICMD0x10_End()                                           ;B48B9C


DATA8_B48B9D:
 
    %AICMD0x4F()                                               ;B48B9D
    %AICMD0x50()                                               ;B48B9E
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $09)       ;B48B9F
    %AICMD0x14_JumpIfFlagSet(strcFlags.daily2, $0C, $B48BE0)   ;B48BA4
    %AICMD0x08_EnableAIControl()                               ;B48BAB
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B48BAC
    %AICMD0x09($01, $B48BC4)                                   ;B48BAE
    %AICMD0x09($02, $B48BD2)                                   ;B48BB2
    %AICMD0x38()                                               ;B48BB6
    %AICMD0x1C_ShowDialog($0360, $00)                          ;B48BB7
    %AICMD0x42_AddValue24(nMoney, 1000)                        ;B48BBB
    %AICMD0x3C()                                               ;B48BC2
    %AICMD0x10_End()                                           ;B48BC3
B48BC4:
    %AICMD0x1A($0248, $0168, $B3839C, $00)                     ;B48BC4
    %AICMD0x13_Wait(1)                                         ;B48BCC
    %AICMD0x12_Jump($B48BCC)                                   ;B48BCF
B48BD2:
    %AICMD0x1A($0258, $0168, $B38618, $00)                     ;B48BD2
    %AICMD0x13_Wait(1)                                         ;B48BDA
    %AICMD0x12_Jump($B48BDA)                                   ;B48BDD


DATA8_B48BE0:
 
B48BE0:
    %AICMD0x4F()                                               ;B48BE0
    %AICMD0x50()                                               ;B48BE1
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $09)       ;B48BE2
    %AICMD0x05_SetTransferPosition(136, 456)                   ;B48BE7
    %AICMD0x08_EnableAIControl()                               ;B48BEC
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 0, $B48C09)     ;B48BED
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 1, $B48C0E)     ;B48BF4
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 2, $B48C13)     ;B48BFB
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, $B48C18)     ;B48C02
B48C09:
    %AICMD0x06_SetDestinationArea(!AREA_FARMSPRING)            ;B48C09
    %AICMD0x12_Jump($B48C1D)                                   ;B48C0B
B48C0E:
    %AICMD0x06_SetDestinationArea(!AREA_FARMSUMMER)            ;B48C0E
    %AICMD0x12_Jump($B48C1D)                                   ;B48C10
B48C13:
    %AICMD0x06_SetDestinationArea(!AREA_FARMFALL)              ;B48C13
    %AICMD0x12_Jump($B48C1D)                                   ;B48C15
B48C18:
    %AICMD0x06_SetDestinationArea(!AREA_FARMWINTER)            ;B48C18
    %AICMD0x12_Jump($B48C1D)                                   ;B48C1A
B48C1D:
    %AICMD0x38()                                               ;B48C1D
    %AICMD0x19($004D, $00)                                     ;B48C1E
    %AICMD0x13_Wait(120)                                       ;B48C22
    %AICMD0x3C()                                               ;B48C25
    %AICMD0x10_End()                                           ;B48C26


pAIScripting0x15:
    dw DATA8_B48C47                                            ;B48C27|        |B48C47;
    dw pAIScripting0x16                                        ;B48C29|        |B48D3A;
    dw pAIScripting0x16                                        ;B48C2B|        |B48D3A;
    dw pAIScripting0x16                                        ;B48C2D|        |B48D3A;
    dw pAIScripting0x16                                        ;B48C2F|        |B48D3A;
    dw pAIScripting0x16                                        ;B48C31|        |B48D3A;
    dw pAIScripting0x16                                        ;B48C33|        |B48D3A;
    dw pAIScripting0x16                                        ;B48C35|        |B48D3A;
    dw pAIScripting0x16                                        ;B48C37|        |B48D3A;
    dw pAIScripting0x16                                        ;B48C39|        |B48D3A;
    dw pAIScripting0x16                                        ;B48C3B|        |B48D3A;
    dw pAIScripting0x16                                        ;B48C3D|        |B48D3A;
    dw pAIScripting0x16                                        ;B48C3F|        |B48D3A;
    dw pAIScripting0x16                                        ;B48C41|        |B48D3A;
    dw pAIScripting0x16                                        ;B48C43|        |B48D3A;
    dw pAIScripting0x16                                        ;B48C45|        |B48D3A;
 
DATA8_B48C47:
 
    %AICMD0x05_SetTransferPosition(184, 360)                   ;B48C47
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B48C4C
    %AICMD0x08_EnableAIControl()                               ;B48C4E
    %AICMD0x09($01, $B48C69)                                   ;B48C4F
    %AICMD0x09($02, $B48CF8)                                   ;B48C53
    %AICMD0x09($03, $B48D21)                                   ;B48C57
    %AICMD0x38()                                               ;B48C5B
    %AICMD0x11_EnableUserControl()                             ;B48C5C
    %AICMD0x0C($00)                                            ;B48C5D
    %AICMD0x08_EnableAIControl()                               ;B48C5F
    %AICMD0x0C($01)                                            ;B48C60
    %AICMD0x11_EnableUserControl()                             ;B48C62
    %AICMD0x13_Wait(1)                                         ;B48C63
    %AICMD0x12_Jump($B48C63)                                   ;B48C66
B48C69:
    %AICMD0x1A($0058, $0178, $B384D4, $02)                     ;B48C69
    %AICMD0x1F($B48C7D)                                        ;B48C71
    %AICMD0x12_Jump($B48C71)                                   ;B48C74
    %AICMD0x1F($B48CDF)                                        ;B48C77
    %AICMD0x12_Jump($B48C77)                                   ;B48C7A
B48C7D:
    %AICMD0x23_OrWithIndexedValue(strcFlags.event3, $0D)       ;B48C7D
    %AICMD0x1D_ShowDialog($0327, $00)                          ;B48C82
    %AICMD0x20_JumpIfChoice(0, $B48C91)                        ;B48C86
    %AICMD0x20_JumpIfChoice(1, $B48CCB)                        ;B48C8A
    %AICMD0x12_Jump($B48CE6)                                   ;B48C8E
B48C91:
    %AICMD0x1C_ShowDialog($0328, $00)                          ;B48C91
    %AICMD0x15_JumpIfEquals8($800927, 1, $B48CA6)              ;B48C95
    %AICMD0x15_JumpIfEquals8($800929, 1, $B48CAE)              ;B48C9C
    %AICMD0x12_Jump($B48CB6)                                   ;B48CA3
B48CA6:
    %AICMD0x47_SetValue8($800927, 0)                           ;B48CA6
    %AICMD0x12_Jump($B48CB6)                                   ;B48CAB
B48CAE:
    %AICMD0x47_SetValue8($800929, 0)                           ;B48CAE
    %AICMD0x12_Jump($B48CB6)                                   ;B48CB3
B48CB6:
    %AICMD0x28(strcShedItems.row1, $00)                        ;B48CB6
    %AICMD0x23_OrWithIndexedValue(strcFlags.event6, $0F)       ;B48CBB
    %AICMD0x41_AddValue16(nPlayerHappiness, 20)                ;B48CC0
    %AICMD0x0B($00)                                            ;B48CC6
    %AICMD0x12_Jump($B48CE6)                                   ;B48CC8
B48CCB:
    %AICMD0x1C_ShowDialog($0329, $00)                          ;B48CCB
    %AICMD0x23_OrWithIndexedValue(strcFlags.event4, $00)       ;B48CCF
    %AICMD0x41_AddValue16(nPlayerHappiness, -10)               ;B48CD4
    %AICMD0x0B($00)                                            ;B48CDA
    %AICMD0x12_Jump($B48CE6)                                   ;B48CDC
B48CDF:
    %AICMD0x1C_ShowDialog($032A, $00)                          ;B48CDF
    %AICMD0x12_Jump($B48C77)                                   ;B48CE3
B48CE6:
    %AICMD0x1B($030E, $00)                                     ;B48CE6
    %AICMD0x0D($FF, $00, $30, $01)                             ;B48CEA
    %AICMD0x1B($030E, $01)                                     ;B48CEF
    %AICMD0x0B($01)                                            ;B48CF3
    %AICMD0x12_Jump($B48C77)                                   ;B48CF5
B48CF8:
    %AICMD0x1A($0058, $0188, $B384D4, $00)                     ;B48CF8
    %AICMD0x22($04, $04, $01, $B384D4, $02)                    ;B48D00
    %AICMD0x1F($B48D13)                                        ;B48D07
    %AICMD0x12_Jump($B48D07)                                   ;B48D0A
    %AICMD0x1F($B48D1A)                                        ;B48D0D
    %AICMD0x12_Jump($B48D0D)                                   ;B48D10
B48D13:
    %AICMD0x1C_ShowDialog($0325, $00)                          ;B48D13
    %AICMD0x12_Jump($B48D0D)                                   ;B48D17
B48D1A:
    %AICMD0x1C_ShowDialog($032A, $00)                          ;B48D1A
    %AICMD0x12_Jump($B48D0D)                                   ;B48D1E
B48D21:
    %AICMD0x1A($0088, $0058, $B384C8, $00)                     ;B48D21
    %AICMD0x1F($B48D2F)                                        ;B48D29
    %AICMD0x12_Jump($B48D29)                                   ;B48D2C
B48D2F:
    %AICMD0x1C_ShowDialog($0326, $00)                          ;B48D2F
    %AICMD0x1B($0311, $01)                                     ;B48D33
    %AICMD0x12_Jump($B48D29)                                   ;B48D37


pAIScripting0x16:
    dw DATA8_B48D5A                                            ;B48D3A|        |B48D5A;
    dw pAIScripting0x17                                        ;B48D3C|        |B48E07;
    dw pAIScripting0x17                                        ;B48D3E|        |B48E07;
    dw pAIScripting0x17                                        ;B48D40|        |B48E07;
    dw pAIScripting0x17                                        ;B48D42|        |B48E07;
    dw pAIScripting0x17                                        ;B48D44|        |B48E07;
    dw pAIScripting0x17                                        ;B48D46|        |B48E07;
    dw pAIScripting0x17                                        ;B48D48|        |B48E07;
    dw pAIScripting0x17                                        ;B48D4A|        |B48E07;
    dw pAIScripting0x17                                        ;B48D4C|        |B48E07;
    dw pAIScripting0x17                                        ;B48D4E|        |B48E07;
    dw pAIScripting0x17                                        ;B48D50|        |B48E07;
    dw pAIScripting0x17                                        ;B48D52|        |B48E07;
    dw pAIScripting0x17                                        ;B48D54|        |B48E07;
    dw pAIScripting0x17                                        ;B48D56|        |B48E07;
    dw pAIScripting0x17                                        ;B48D58|        |B48E07;
 
DATA8_B48D5A:
 
    %AICMD0x50()                                               ;B48D5A
    %AICMD0x08_EnableAIControl()                               ;B48D5B
    %AICMD0x09($01, $B48D6D)                                   ;B48D5C
    %AICMD0x38()                                               ;B48D60
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 80)                  ;B48D61
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B48D65
    %AICMD0x0B($00)                                            ;B48D67
    %AICMD0x0C($01)                                            ;B48D69
    %AICMD0x11_EnableUserControl()                             ;B48D6B
    %AICMD0x10_End()                                           ;B48D6C
B48D6D:
    %AICMD0x1A($0078, $01A8, $B38234, $02)                     ;B48D6D
    %AICMD0x0C($00)                                            ;B48D75
    %AICMD0x1D_ShowDialog($0321, $00)                          ;B48D77
    %AICMD0x20_JumpIfChoice(0, $B48D92)                        ;B48D7B
    %AICMD0x20_JumpIfChoice(1, $B48DF5)                        ;B48D7F
    %AICMD0x12_Jump($B48D86)                                   ;B48D83
B48D86:
    %AICMD0x1B($025F, $00)                                     ;B48D86
    %AICMD0x0D($FF, $00, $90, $01)                             ;B48D8A
    %AICMD0x0B($01)                                            ;B48D8F
    %AICMD0x10_End()                                           ;B48D91
B48D92:
    %AICMD0x1B($025D, $00)                                     ;B48D92
    %AICMD0x0D($00, $FF, $30, $01)                             ;B48D96
    %AICMD0x1B($025F, $01)                                     ;B48D9B
    %AICMD0x0D($01, $00, $A8, $01)                             ;B48D9F
    %AICMD0x13_Wait(60)                                        ;B48DA4
    %AICMD0x1B($025F, $00)                                     ;B48DA7
    %AICMD0x0D($FF, $00, $A8, $01)                             ;B48DAB
    %AICMD0x1B($025B, $00)                                     ;B48DB0
    %AICMD0x0D($00, $01, $30, $01)                             ;B48DB4
    %AICMD0x1B($025E, $01)                                     ;B48DB9
    %AICMD0x1C_ShowDialog($0322, $00)                          ;B48DBD
    %AICMD0x15_JumpIfEquals8($800927, 3, $B48DD2)              ;B48DC1
    %AICMD0x15_JumpIfEquals8($800929, 3, $B48DDA)              ;B48DC8
    %AICMD0x12_Jump($B48DE2)                                   ;B48DCF
B48DD2:
    %AICMD0x47_SetValue8($800927, 0)                           ;B48DD2
    %AICMD0x12_Jump($B48DE2)                                   ;B48DD7
B48DDA:
    %AICMD0x47_SetValue8($800929, 0)                           ;B48DDA
    %AICMD0x12_Jump($B48DE2)                                   ;B48DDF
B48DE2:
    %AICMD0x28(strcShedItems.row1, $02)                        ;B48DE2
    %AICMD0x23_OrWithIndexedValue(strcFlags.event3, $0F)       ;B48DE7
    %AICMD0x41_AddValue16(nPlayerHappiness, 20)                ;B48DEC
    %AICMD0x12_Jump($B48D86)                                   ;B48DF2
B48DF5:
    %AICMD0x1C_ShowDialog($0323, $00)                          ;B48DF5
    %AICMD0x23_OrWithIndexedValue(strcFlags.event4, $02)       ;B48DF9
    %AICMD0x41_AddValue16(nPlayerHappiness, -20)               ;B48DFE
    %AICMD0x12_Jump($B48D86)                                   ;B48E04


pAIScripting0x17:
    dw DATA8_B48E27                                            ;B48E07|        |B48E27;
    dw pAIScripting0x18                                        ;B48E09|        |B48EC7;
    dw pAIScripting0x18                                        ;B48E0B|        |B48EC7;
    dw pAIScripting0x18                                        ;B48E0D|        |B48EC7;
    dw pAIScripting0x18                                        ;B48E0F|        |B48EC7;
    dw pAIScripting0x18                                        ;B48E11|        |B48EC7;
    dw pAIScripting0x18                                        ;B48E13|        |B48EC7;
    dw pAIScripting0x18                                        ;B48E15|        |B48EC7;
    dw pAIScripting0x18                                        ;B48E17|        |B48EC7;
    dw pAIScripting0x18                                        ;B48E19|        |B48EC7;
    dw pAIScripting0x18                                        ;B48E1B|        |B48EC7;
    dw pAIScripting0x18                                        ;B48E1D|        |B48EC7;
    dw pAIScripting0x18                                        ;B48E1F|        |B48EC7;
    dw pAIScripting0x18                                        ;B48E21|        |B48EC7;
    dw pAIScripting0x18                                        ;B48E23|        |B48EC7;
    dw pAIScripting0x18                                        ;B48E25|        |B48EC7;
 
DATA8_B48E27:
 
    %AICMD0x00_SetMusic($0A, $B4)                              ;B48E27
    %AICMD0x08_EnableAIControl()                               ;B48E2A
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B48E2B
    %AICMD0x09($01, $B48E35)                                   ;B48E2D
    %AICMD0x0C($00)                                            ;B48E31
    %AICMD0x11_EnableUserControl()                             ;B48E33
    %AICMD0x10_End()                                           ;B48E34
B48E35:
    %AICMD0x1A($0068, $0218, $B38528, $00)                     ;B48E35
    %AICMD0x1B($0315, $00)                                     ;B48E3D
    %AICMD0x0D($00, $03, $10, $01)                             ;B48E41
    %AICMD0x09($02, $B48E96)                                   ;B48E46
    %AICMD0x13_Wait(30)                                        ;B48E4A
    %AICMD0x1D_ShowDialog($031E, $00)                          ;B48E4D
    %AICMD0x20_JumpIfChoice(0, $B48E5C)                        ;B48E51
    %AICMD0x20_JumpIfChoice(1, $B48E74)                        ;B48E55
    %AICMD0x12_Jump($B48E8B)                                   ;B48E59
B48E5C:
    %AICMD0x25($02)                                            ;B48E5C
    %AICMD0x09($02, $B48EB0)                                   ;B48E5E
    %AICMD0x1C_ShowDialog($031F, $00)                          ;B48E62
    %AICMD0x23_OrWithIndexedValue(strcFlags.event4, $03)       ;B48E66
    %AICMD0x41_AddValue16(nPlayerHappiness, -30)               ;B48E6B
    %AICMD0x12_Jump($B48E8B)                                   ;B48E71
B48E74:
    %AICMD0x1C_ShowDialog($0320, $00)                          ;B48E74
    %AICMD0x28(strcShedItems.row1, $03)                        ;B48E78
    %AICMD0x47_SetValue8($800927, 20)                          ;B48E7D
    %AICMD0x41_AddValue16(nPlayerHappiness, 20)                ;B48E82
    %AICMD0x12_Jump($B48E8B)                                   ;B48E88
B48E8B:
    %AICMD0x13_Wait(120)                                       ;B48E8B
    %AICMD0x1B($0316, $00)                                     ;B48E8E
    %AICMD0x0B($00)                                            ;B48E92
    %AICMD0x37()                                               ;B48E94
    %AICMD0x10_End()                                           ;B48E95
B48E96:
    %AICMD0x13_Wait(30)                                        ;B48E96
    %AICMD0x1A($0068, $0238, $B387E0, $00)                     ;B48E99
    %AICMD0x0D($00, $FF, $20, $04)                             ;B48EA1
    %AICMD0x0D($00, $01, $30, $01)                             ;B48EA6
    %AICMD0x13_Wait(60)                                        ;B48EAB
    %AICMD0x37()                                               ;B48EAE
    %AICMD0x10_End()                                           ;B48EAF
B48EB0:
    %AICMD0x1A($0068, $0238, $B387D4, $00)                     ;B48EB0
    %AICMD0x0D($00, $FF, $20, $04)                             ;B48EB8
    %AICMD0x0D($00, $01, $30, $01)                             ;B48EBD
    %AICMD0x13_Wait(60)                                        ;B48EC2
    %AICMD0x37()                                               ;B48EC5
    %AICMD0x10_End()                                           ;B48EC6


pAIScripting0x18:
    dw DATA8_B48EE7                                            ;B48EC7|        |B48EE7;
    dw pAIScripting0x19                                        ;B48EC9|        |B48F97;
    dw pAIScripting0x19                                        ;B48ECB|        |B48F97;
    dw pAIScripting0x19                                        ;B48ECD|        |B48F97;
    dw pAIScripting0x19                                        ;B48ECF|        |B48F97;
    dw pAIScripting0x19                                        ;B48ED1|        |B48F97;
    dw pAIScripting0x19                                        ;B48ED3|        |B48F97;
    dw pAIScripting0x19                                        ;B48ED5|        |B48F97;
    dw pAIScripting0x19                                        ;B48ED7|        |B48F97;
    dw pAIScripting0x19                                        ;B48ED9|        |B48F97;
    dw pAIScripting0x19                                        ;B48EDB|        |B48F97;
    dw pAIScripting0x19                                        ;B48EDD|        |B48F97;
    dw pAIScripting0x19                                        ;B48EDF|        |B48F97;
    dw pAIScripting0x19                                        ;B48EE1|        |B48F97;
    dw pAIScripting0x19                                        ;B48EE3|        |B48F97;
    dw pAIScripting0x19                                        ;B48EE5|        |B48F97;
 
DATA8_B48EE7:
 
    %AICMD0x09($01, $B48EFB)                                   ;B48EE7
    %AICMD0x38()                                               ;B48EEB
    %AICMD0x10_End()                                           ;B48EEC
    %AICMD0x15_JumpIfEquals8(nCurrentTimeID, 18, $B48EFA)      ;B48EED
    %AICMD0x13_Wait(1)                                         ;B48EF4
    %AICMD0x12_Jump($B48EED)                                   ;B48EF7
B48EFA:
    %AICMD0x10_End()                                           ;B48EFA
B48EFB:
    %AICMD0x15_JumpIfEquals8(nCurrentTimeID, 18, $B48F96)      ;B48EFB
    %AICMD0x1A($0098, $01A8, $B384E0, $01)                     ;B48F02
    %AICMD0x2D($B48F2A, $B48F31)                               ;B48F0A
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 18, 24, $B48F70) ;B48F0F
    %AICMD0x12_Jump($B48F0A)                                   ;B48F17
    %AICMD0x2D($B48F69, $B48F31)                               ;B48F1A
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 18, 24, $B48F70) ;B48F1F
    %AICMD0x12_Jump($B48F1A)                                   ;B48F27
    %AICMD0x1C_ShowDialog($032B, $00)                          ;B48F2A
    %AICMD0x12_Jump($B48F1A)                                   ;B48F2E
    %AICMD0x15_JumpIfEquals8($800924, 1, $B48F46)              ;B48F31
    %AICMD0x15_JumpIfEquals8($800924, 2, $B48F5C)              ;B48F38
    %AICMD0x1C_ShowDialog($032F, $00)                          ;B48F3F
    %AICMD0x12_Jump($B48F0A)                                   ;B48F43
B48F46:
    %AICMD0x1B($0309, $01)                                     ;B48F46
    %AICMD0x1C_ShowDialog($032D, $00)                          ;B48F4A
    %AICMD0x23_OrWithIndexedValue(strcFlags.event4, $08)       ;B48F4E
    %AICMD0x41_AddValue16(nPlayerHappiness, 20)                ;B48F53
    %AICMD0x12_Jump($B48F70)                                   ;B48F59
B48F5C:
    %AICMD0x1C_ShowDialog($032E, $00)                          ;B48F5C
    %AICMD0x41_AddValue16(nPlayerHappiness, -20)               ;B48F60
    %AICMD0x12_Jump($B48F1A)                                   ;B48F66
    %AICMD0x1C_ShowDialog($032C, $00)                          ;B48F69
    %AICMD0x12_Jump($B48F1A)                                   ;B48F6D
B48F70:
    %AICMD0x1B($030E, $01)                                     ;B48F70
    %AICMD0x0D($02, $FE, $04, $01)                             ;B48F74
    %AICMD0x0D($02, $02, $04, $01)                             ;B48F79
    %AICMD0x1B($030E, $01)                                     ;B48F7E
    %AICMD0x0D($01, $00, $48, $01)                             ;B48F82
    %AICMD0x1B($030E, $01)                                     ;B48F87
    %AICMD0x0D($02, $FE, $06, $01)                             ;B48F8B
    %AICMD0x0D($02, $02, $04, $01)                             ;B48F90
    %AICMD0x37()                                               ;B48F95
B48F96:
    %AICMD0x10_End()                                           ;B48F96


pAIScripting0x19:
    dw DATA8_B48FB7                                            ;B48F97|        |B48FB7;
    dw DATA8_B48FE0                                            ;B48F99|        |B48FE0;
    dw pAIScripting0x1A                                        ;B48F9B|        |B490D5;
    dw pAIScripting0x1A                                        ;B48F9D|        |B490D5;
    dw pAIScripting0x1A                                        ;B48F9F|        |B490D5;
    dw pAIScripting0x1A                                        ;B48FA1|        |B490D5;
    dw pAIScripting0x1A                                        ;B48FA3|        |B490D5;
    dw pAIScripting0x1A                                        ;B48FA5|        |B490D5;
    dw pAIScripting0x1A                                        ;B48FA7|        |B490D5;
    dw pAIScripting0x1A                                        ;B48FA9|        |B490D5;
    dw pAIScripting0x1A                                        ;B48FAB|        |B490D5;
    dw pAIScripting0x1A                                        ;B48FAD|        |B490D5;
    dw pAIScripting0x1A                                        ;B48FAF|        |B490D5;
    dw pAIScripting0x1A                                        ;B48FB1|        |B490D5;
    dw pAIScripting0x1A                                        ;B48FB3|        |B490D5;
    dw pAIScripting0x1A                                        ;B48FB5|        |B490D5;
 
DATA8_B48FB7:
 
    %AICMD0x50()                                               ;B48FB7
    %AICMD0x08_EnableAIControl()                               ;B48FB8
    %AICMD0x09($01, $B48FC1)                                   ;B48FB9
    %AICMD0x38()                                               ;B48FBD
    %AICMD0x0B($00)                                            ;B48FBE
    %AICMD0x10_End()                                           ;B48FC0
B48FC1:
    %AICMD0x1A($0088, $01B8, $B3830C, $01)                     ;B48FC1
    %AICMD0x0C($00)                                            ;B48FC9
    %AICMD0x0D($00, $FF, $50, $01)                             ;B48FCB
    %AICMD0x1C_ShowDialog($01CC, $00)                          ;B48FD0
    %AICMD0x1B($0290, $00)                                     ;B48FD4
    %AICMD0x0D($00, $01, $60, $01)                             ;B48FD8
    %AICMD0x37()                                               ;B48FDD
    %AICMD0x11_EnableUserControl()                             ;B48FDE
    %AICMD0x10_End()                                           ;B48FDF


DATA8_B48FE0:
 
    %AICMD0x50()                                               ;B48FE0
    %AICMD0x00_SetMusic($0E, $B4)                              ;B48FE1
    %AICMD0x08_EnableAIControl()                               ;B48FE4
    %AICMD0x09($01, $B49085)                                   ;B48FE5
    %AICMD0x09($02, $B4903F)                                   ;B48FE9
    %AICMD0x09($03, $B49053)                                   ;B48FED
    %AICMD0x09($04, $B49067)                                   ;B48FF1
    %AICMD0x38()                                               ;B48FF5
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 24)                  ;B48FF6
    %AICMD0x0B($00)                                            ;B48FFA
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 48)                    ;B48FFC
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B49000
    %AICMD0x0B($01)                                            ;B49002
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 20)                  ;B49004
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 51)                    ;B49008
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4900C
    %AICMD0x0B($02)                                            ;B4900E
    %AICMD0x0C($03)                                            ;B49010
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B49012
    %AICMD0x0C($04)                                            ;B49014
    %AICMD0x19($0007, $00)                                     ;B49016
    %AICMD0x13_Wait(60)                                        ;B4901A
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4901D
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 64)                  ;B4901F
    %AICMD0x0B($05)                                            ;B49023
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 48)                 ;B49025
    %AICMD0x40_DisableTileInteractions()                       ;B49029
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 64)                  ;B4902A
    %AICMD0x0C($06)                                            ;B4902E
    %AICMD0x13_Wait(60)                                        ;B49030
    %AICMD0x23_OrWithIndexedValue(strcFlags.event4, $0D)       ;B49033
    %AICMD0x28(strcFlags.event4, $0C)                          ;B49038
    %AICMD0x3C()                                               ;B4903D
    %AICMD0x10_End()                                           ;B4903E
B4903F:
    %AICMD0x1A($0058, $00C8, $B38234, $02)                     ;B4903F
    %AICMD0x0C($00)                                            ;B49047
    %AICMD0x1C_ShowDialog($01D3, $00)                          ;B49049
    %AICMD0x13_Wait(1)                                         ;B4904D
    %AICMD0x12_Jump($B4904D)                                   ;B49050
B49053:
    %AICMD0x1A($00A8, $0098, $B38234, $03)                     ;B49053
    %AICMD0x0C($01)                                            ;B4905B
    %AICMD0x1C_ShowDialog($01D4, $00)                          ;B4905D
    %AICMD0x13_Wait(1)                                         ;B49061
    %AICMD0x12_Jump($B49061)                                   ;B49064
B49067:
    %AICMD0x1A($0068, $0068, $B38234, $00)                     ;B49067
    %AICMD0x0C($02)                                            ;B4906F
    %AICMD0x1B($025F, $00)                                     ;B49071
    %AICMD0x1C_ShowDialog($01D5, $00)                          ;B49075
    %AICMD0x0B($03)                                            ;B49079
    %AICMD0x1B($025A, $00)                                     ;B4907B
    %AICMD0x13_Wait(1)                                         ;B4907F
    %AICMD0x12_Jump($B4907F)                                   ;B49082
B49085:
    %AICMD0x1A($0028, $0068, $B38168, $02)                     ;B49085
    %AICMD0x0C($03)                                            ;B4908D
    %AICMD0x1B($0223, $01)                                     ;B4908F
    %AICMD0x0D($01, $00, $22, $01)                             ;B49093
    %AICMD0x1C_ShowDialog($01D6, $00)                          ;B49098
    %AICMD0x1B($0225, $01)                                     ;B4909C
    %AICMD0x13_Wait(60)                                        ;B490A0
    %AICMD0x1B($0223, $01)                                     ;B490A3
    %AICMD0x0D($FF, $00, $04, $01)                             ;B490A7
    %AICMD0x41_AddValue16(nLove_Maria, 50)                     ;B490AC
    %AICMD0x0B($04)                                            ;B490B2
    %AICMD0x0C($05)                                            ;B490B4
    %AICMD0x1B($021F, $00)                                     ;B490B6
    %AICMD0x0D($00, $01, $40, $01)                             ;B490BA
    %AICMD0x1B($0223, $01)                                     ;B490BF
    %AICMD0x0D($01, $00, $30, $01)                             ;B490C3
    %AICMD0x1B($021F, $00)                                     ;B490C8
    %AICMD0x0D($00, $01, $40, $01)                             ;B490CC
    %AICMD0x0B($06)                                            ;B490D1
    %AICMD0x37()                                               ;B490D3
    %AICMD0x10_End()                                           ;B490D4


pAIScripting0x1A:
    dw DATA8_B490F5                                            ;B490D5|        |B490F5;
    dw DATA8_B4911E                                            ;B490D7|        |B4911E;
    dw pAIScripting0x1B                                        ;B490D9|        |B491B5;
    dw pAIScripting0x1B                                        ;B490DB|        |B491B5;
    dw pAIScripting0x1B                                        ;B490DD|        |B491B5;
    dw pAIScripting0x1B                                        ;B490DF|        |B491B5;
    dw pAIScripting0x1B                                        ;B490E1|        |B491B5;
    dw pAIScripting0x1B                                        ;B490E3|        |B491B5;
    dw pAIScripting0x1B                                        ;B490E5|        |B491B5;
    dw pAIScripting0x1B                                        ;B490E7|        |B491B5;
    dw pAIScripting0x1B                                        ;B490E9|        |B491B5;
    dw pAIScripting0x1B                                        ;B490EB|        |B491B5;
    dw pAIScripting0x1B                                        ;B490ED|        |B491B5;
    dw pAIScripting0x1B                                        ;B490EF|        |B491B5;
    dw pAIScripting0x1B                                        ;B490F1|        |B491B5;
    dw pAIScripting0x1B                                        ;B490F3|        |B491B5;
 
DATA8_B490F5:
 
    %AICMD0x50()                                               ;B490F5
    %AICMD0x08_EnableAIControl()                               ;B490F6
    %AICMD0x09($01, $B490FF)                                   ;B490F7
    %AICMD0x38()                                               ;B490FB
    %AICMD0x0B($00)                                            ;B490FC
    %AICMD0x10_End()                                           ;B490FE
B490FF:
    %AICMD0x1A($0088, $01B8, $B381A4, $01)                     ;B490FF
    %AICMD0x0C($00)                                            ;B49107
    %AICMD0x0D($00, $FF, $50, $01)                             ;B49109
    %AICMD0x1C_ShowDialog($01DB, $00)                          ;B4910E
    %AICMD0x1B($0227, $00)                                     ;B49112
    %AICMD0x0D($00, $01, $60, $01)                             ;B49116
    %AICMD0x37()                                               ;B4911B
    %AICMD0x11_EnableUserControl()                             ;B4911C
    %AICMD0x10_End()                                           ;B4911D


DATA8_B4911E:
 
    %AICMD0x50()                                               ;B4911E
    %AICMD0x00_SetMusic($0E, $B4)                              ;B4911F
    %AICMD0x02_FreezeTime()                                    ;B49122
    %AICMD0x03_SetHour($07)                                    ;B49123
    %AICMD0x05_SetTransferPosition(136, 456)                   ;B49125
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B4912A
    %AICMD0x08_EnableAIControl()                               ;B4912C
    %AICMD0x09($01, $B49157)                                   ;B4912D
    %AICMD0x09($02, $B4919F)                                   ;B49131
    %AICMD0x3B($24)                                            ;B49135
    %AICMD0x38()                                               ;B49137
    %AICMD0x0B($03)                                            ;B49138
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 64)                    ;B4913A
    %AICMD0x3F_ThrowCarriedItem()                              ;B4913E
    %AICMD0x0B($00)                                            ;B4913F
    %AICMD0x0C($02)                                            ;B49141
    %AICMD0x40_DisableTileInteractions()                       ;B49143
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 96)                  ;B49144
    %AICMD0x13_Wait(60)                                        ;B49148
    %AICMD0x23_OrWithIndexedValue(strcFlags.event4, $0F)       ;B4914B
    %AICMD0x28(strcFlags.event4, $0E)                          ;B49150
    %AICMD0x3C()                                               ;B49155
    %AICMD0x10_End()                                           ;B49156
B49157:
    %AICMD0x1A($0088, $0178, $B38198, $00)                     ;B49157
    %AICMD0x0C($00)                                            ;B4915F
    %AICMD0x1B($0226, $00)                                     ;B49161
    %AICMD0x13_Wait(60)                                        ;B49165
    %AICMD0x1C_ShowDialog($01E1, $00)                          ;B49168
    %AICMD0x1B($022B, $01)                                     ;B4916C
    %AICMD0x0D($01, $00, $10, $01)                             ;B49170
    %AICMD0x1B($0227, $00)                                     ;B49175
    %AICMD0x0D($00, $01, $10, $01)                             ;B49179
    %AICMD0x1B($0226, $00)                                     ;B4917E
    %AICMD0x13_Wait(20)                                        ;B49182
    %AICMD0x1B($022D, $00)                                     ;B49185
    %AICMD0x13_Wait(60)                                        ;B49189
    %AICMD0x41_AddValue16(nLove_Ann, 50)                       ;B4918C
    %AICMD0x1B($0227, $00)                                     ;B49192
    %AICMD0x0D($00, $01, $50, $01)                             ;B49196
    %AICMD0x0B($01)                                            ;B4919B
    %AICMD0x37()                                               ;B4919D
    %AICMD0x10_End()                                           ;B4919E
B4919F:
    %AICMD0x1A($0028, $0168, $B38318, $02)                     ;B4919F
    %AICMD0x0C($01)                                            ;B491A7
    %AICMD0x1C_ShowDialog($01E2, $00)                          ;B491A9
    %AICMD0x0B($02)                                            ;B491AD
    %AICMD0x13_Wait(1)                                         ;B491AF
    %AICMD0x12_Jump($B491AF)                                   ;B491B2


pAIScripting0x1B:
    dw DATA8_B491D5                                            ;B491B5|        |B491D5;
    dw DATA8_B49212                                            ;B491B7|        |B49212;
    dw pAIScripting0x1C                                        ;B491B9|        |B492D4;
    dw pAIScripting0x1C                                        ;B491BB|        |B492D4;
    dw pAIScripting0x1C                                        ;B491BD|        |B492D4;
    dw pAIScripting0x1C                                        ;B491BF|        |B492D4;
    dw pAIScripting0x1C                                        ;B491C1|        |B492D4;
    dw pAIScripting0x1C                                        ;B491C3|        |B492D4;
    dw pAIScripting0x1C                                        ;B491C5|        |B492D4;
    dw pAIScripting0x1C                                        ;B491C7|        |B492D4;
    dw pAIScripting0x1C                                        ;B491C9|        |B492D4;
    dw pAIScripting0x1C                                        ;B491CB|        |B492D4;
    dw pAIScripting0x1C                                        ;B491CD|        |B492D4;
    dw pAIScripting0x1C                                        ;B491CF|        |B492D4;
    dw pAIScripting0x1C                                        ;B491D1|        |B492D4;
    dw pAIScripting0x1C                                        ;B491D3|        |B492D4;
 
DATA8_B491D5:
 
    %AICMD0x50()                                               ;B491D5
    %AICMD0x08_EnableAIControl()                               ;B491D6
    %AICMD0x09($01, $B491DF)                                   ;B491D7
    %AICMD0x38()                                               ;B491DB
    %AICMD0x0B($00)                                            ;B491DC
    %AICMD0x10_End()                                           ;B491DE
B491DF:
    %AICMD0x1A($0088, $01B8, $B38324, $01)                     ;B491DF
    %AICMD0x0C($00)                                            ;B491E7
    %AICMD0x0D($00, $FF, $50, $01)                             ;B491E9
    %AICMD0x1B($029B, $01)                                     ;B491EE
    %AICMD0x13_Wait(10)                                        ;B491F2
    %AICMD0x1B($029B, $00)                                     ;B491F5
    %AICMD0x13_Wait(10)                                        ;B491F9
    %AICMD0x1B($0299, $00)                                     ;B491FC
    %AICMD0x1C_ShowDialog($01E3, $00)                          ;B49200
    %AICMD0x1B($0297, $00)                                     ;B49204
    %AICMD0x0D($00, $01, $60, $01)                             ;B49208
    %AICMD0x0B($01)                                            ;B4920D
    %AICMD0x37()                                               ;B4920F
    %AICMD0x11_EnableUserControl()                             ;B49210
    %AICMD0x10_End()                                           ;B49211


DATA8_B49212:
 
    %AICMD0x00_SetMusic($0E, $B4)                              ;B49212
    %AICMD0x09($01, $B49223)                                   ;B49215
    %AICMD0x38()                                               ;B49219
    %AICMD0x11_EnableUserControl()                             ;B4921A
    %AICMD0x10_End()                                           ;B4921B
    %AICMD0x13_Wait(1)                                         ;B4921C
    %AICMD0x12_Jump($B4921C)                                   ;B4921F
    %AICMD0x10_End()                                           ;B49222
B49223:
    %AICMD0x1A($0038, $00F8, $B387EC, $00)                     ;B49223
    %AICMD0x12_Jump($B4922E)                                   ;B4922B
B4922E:
    %AICMD0x2D($B4923E, $B4924C)                               ;B4922E
    %AICMD0x12_Jump($B4922E)                                   ;B49233
    %AICMD0x2D($B49245, $B4924C)                               ;B49236
    %AICMD0x12_Jump($B49236)                                   ;B4923B
    %AICMD0x1C_ShowDialog($01E5, $00)                          ;B4923E
    %AICMD0x12_Jump($B49236)                                   ;B49242
    %AICMD0x1C_ShowDialog($01E8, $00)                          ;B49245
    %AICMD0x12_Jump($B49236)                                   ;B49249
    %AICMD0x43_JumpIfEqual16($800924, 24, $B4925B)             ;B4924C
    %AICMD0x1C_ShowDialog($01E8, $00)                          ;B49254
    %AICMD0x12_Jump($B49236)                                   ;B49258
B4925B:
    %AICMD0x08_EnableAIControl()                               ;B4925B
    %AICMD0x1B($024F, $01)                                     ;B4925C
    %AICMD0x1C_ShowDialog($01E7, $00)                          ;B49260
    %AICMD0x1B($0252, $01)                                     ;B49264
    %AICMD0x13_Wait(90)                                        ;B49268
    %AICMD0x1B($024F, $01)                                     ;B4926B
    %AICMD0x41_AddValue16(nLove_Nina, 50)                      ;B4926F
    %AICMD0x0B($00)                                            ;B49275
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B49277
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 48)                 ;B49279
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4927D
    %AICMD0x1B($0250, $01)                                     ;B4927F
    %AICMD0x0D($01, $00, $30, $01)                             ;B49283
    %AICMD0x1B($024C, $00)                                     ;B49288
    %AICMD0x0D($00, $01, $20, $02)                             ;B4928C
    %AICMD0x13_Wait(10)                                        ;B49291
    %AICMD0x0D($00, $01, $30, $01)                             ;B49294
    %AICMD0x13_Wait(10)                                        ;B49299
    %AICMD0x0D($01, $01, $18, $02)                             ;B4929C
    %AICMD0x13_Wait(10)                                        ;B492A1
    %AICMD0x0D($00, $01, $46, $01)                             ;B492A4
    %AICMD0x1B($0347, $00)                                     ;B492A9
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 68)                   ;B492AD
    %AICMD0x19($0024, $00)                                     ;B492B1
    %AICMD0x13_Wait(60)                                        ;B492B5
    %AICMD0x1C_ShowDialog($0147, $00)                          ;B492B8
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B492BC
    %AICMD0x13_Wait(30)                                        ;B492BE
    %AICMD0x1B($024E, $00)                                     ;B492C1
    %AICMD0x13_Wait(60)                                        ;B492C5
    %AICMD0x23_OrWithIndexedValue(strcFlags.event5, $01)       ;B492C8
    %AICMD0x28(strcFlags.event5, $00)                          ;B492CD
    %AICMD0x3C()                                               ;B492D2
    %AICMD0x10_End()                                           ;B492D3


pAIScripting0x1C:
    dw DATA8_B492F4                                            ;B492D4|        |B492F4;
    dw DATA8_B4931F                                            ;B492D6|        |B4931F;
    dw DATA8_B49403                                            ;B492D8|        |B49403;
    dw pAIScripting0x1D                                        ;B492DA|        |B4943E;
    dw pAIScripting0x1D                                        ;B492DC|        |B4943E;
    dw pAIScripting0x1D                                        ;B492DE|        |B4943E;
    dw pAIScripting0x1D                                        ;B492E0|        |B4943E;
    dw pAIScripting0x1D                                        ;B492E2|        |B4943E;
    dw pAIScripting0x1D                                        ;B492E4|        |B4943E;
    dw pAIScripting0x1D                                        ;B492E6|        |B4943E;
    dw pAIScripting0x1D                                        ;B492E8|        |B4943E;
    dw pAIScripting0x1D                                        ;B492EA|        |B4943E;
    dw pAIScripting0x1D                                        ;B492EC|        |B4943E;
    dw pAIScripting0x1D                                        ;B492EE|        |B4943E;
    dw pAIScripting0x1D                                        ;B492F0|        |B4943E;
    dw pAIScripting0x1D                                        ;B492F2|        |B4943E;
 
DATA8_B492F4:
 
    %AICMD0x50()                                               ;B492F4
    %AICMD0x08_EnableAIControl()                               ;B492F5
    %AICMD0x09($01, $B492FE)                                   ;B492F6
    %AICMD0x38()                                               ;B492FA
    %AICMD0x0B($00)                                            ;B492FB
    %AICMD0x10_End()                                           ;B492FD
B492FE:
    %AICMD0x1A($0088, $01B8, $B381EC, $01)                     ;B492FE
    %AICMD0x0C($00)                                            ;B49306
    %AICMD0x0D($00, $FF, $50, $01)                             ;B49308
    %AICMD0x1C_ShowDialog($01EB, $00)                          ;B4930D
    %AICMD0x1B($023D, $00)                                     ;B49311
    %AICMD0x0D($00, $01, $60, $01)                             ;B49315
    %AICMD0x0B($01)                                            ;B4931A
    %AICMD0x37()                                               ;B4931C
    %AICMD0x11_EnableUserControl()                             ;B4931D
    %AICMD0x10_End()                                           ;B4931E


DATA8_B4931F:
 
    %AICMD0x00_SetMusic($0E, $B4)                              ;B4931F
    %AICMD0x09($0A, $B49328)                                   ;B49322
    %AICMD0x38()                                               ;B49326
    %AICMD0x10_End()                                           ;B49327
B49328:
    %AICMD0x1A($029C, $018E, $B38558, $03)                     ;B49328
    %AICMD0x1F($B49336)                                        ;B49330
    %AICMD0x12_Jump($B49330)                                   ;B49333
B49336:
    %AICMD0x08_EnableAIControl()                               ;B49336
    %AICMD0x1B($0320, $01)                                     ;B49337
    %AICMD0x0D($01, $FF, $18, $02)                             ;B4933B
    %AICMD0x0D($01, $00, $10, $04)                             ;B49340
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily3, $03)       ;B49345
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 0, $B49366)     ;B4934A
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 1, $B4936B)     ;B49351
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 2, $B49370)     ;B49358
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, $B49375)     ;B4935F
B49366:
    %AICMD0x3D_TeleportToArea(!AREA_WOODSSPRING)               ;B49366
    %AICMD0x12_Jump($B4937A)                                   ;B49368
B4936B:
    %AICMD0x3D_TeleportToArea(!AREA_WOODSSUMMER)               ;B4936B
    %AICMD0x12_Jump($B4937A)                                   ;B4936D
B49370:
    %AICMD0x3D_TeleportToArea(!AREA_WOODSFALL)                 ;B49370
    %AICMD0x12_Jump($B4937A)                                   ;B49372
B49375:
    %AICMD0x3D_TeleportToArea(!AREA_WOODSWINTER)               ;B49375
    %AICMD0x12_Jump($B4937A)                                   ;B49377
B4937A:
    %AICMD0x10_End()                                           ;B4937A
    %AICMD0x1A($0288, $01F5, $B38558, $03)                     ;B4937B
    %AICMD0x0C($01)                                            ;B49383
    %AICMD0x1B($0320, $01)                                     ;B49385
    %AICMD0x0D($02, $FF, $20, $02)                             ;B49389
    %AICMD0x0D($01, $FF, $20, $02)                             ;B4938E
    %AICMD0x0D($01, $FF, $50, $01)                             ;B49393
    %AICMD0x0B($02)                                            ;B49398
    %AICMD0x37()                                               ;B4939A
    %AICMD0x10_End()                                           ;B4939B
    %AICMD0x1A($0208, $0208, $B381EC, $02)                     ;B4939C
    %AICMD0x0D($01, $00, $60, $01)                             ;B493A4
    %AICMD0x1B($0240, $01)                                     ;B493A9
    %AICMD0x13_Wait(90)                                        ;B493AD
    %AICMD0x1C_ShowDialog($01F1, $00)                          ;B493B0
    %AICMD0x0B($01)                                            ;B493B4
    %AICMD0x1B($0242, $00)                                     ;B493B6
    %AICMD0x13_Wait(90)                                        ;B493BA
    %AICMD0x0C($02)                                            ;B493BD
    %AICMD0x1B($0240, $01)                                     ;B493BF
    %AICMD0x1C_ShowDialog($01F2, $00)                          ;B493C3
    %AICMD0x1B($0241, $01)                                     ;B493C7
    %AICMD0x0D($01, $00, $14, $01)                             ;B493CB
    %AICMD0x1B($0243, $01)                                     ;B493D0
    %AICMD0x13_Wait(90)                                        ;B493D4
    %AICMD0x41_AddValue16(nLove_Ellen, 50)                     ;B493D7
    %AICMD0x1B($0240, $01)                                     ;B493DD
    %AICMD0x13_Wait(40)                                        ;B493E1
    %AICMD0x1B($0241, $00)                                     ;B493E4
    %AICMD0x0D($FF, $00, $44, $01)                             ;B493E8
    %AICMD0x1B($023D, $00)                                     ;B493ED
    %AICMD0x0D($00, $01, $50, $01)                             ;B493F1
    %AICMD0x1B($0241, $00)                                     ;B493F6
    %AICMD0x0D($FF, $00, $70, $01)                             ;B493FA
    %AICMD0x0B($03)                                            ;B493FF
    %AICMD0x37()                                               ;B49401
    %AICMD0x10_End()                                           ;B49402


DATA8_B49403:
 
    %AICMD0x50()                                               ;B49403
    %AICMD0x02_FreezeTime()                                    ;B49404
    %AICMD0x08_EnableAIControl()                               ;B49405
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B49406
    %AICMD0x05_SetTransferPosition(648, 520)                   ;B49408
    %AICMD0x09($0A, $B4939C)                                   ;B4940D
    %AICMD0x09($0B, $B4937B)                                   ;B49411
    %AICMD0x38()                                               ;B49415
    %AICMD0x0C($01)                                            ;B49416
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B49418
    %AICMD0x13_Wait(60)                                        ;B4941A
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4941D
    %AICMD0x13_Wait(80)                                        ;B4941F
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B49422
    %AICMD0x13_Wait(120)                                       ;B49424
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B49427
    %AICMD0x13_Wait(220)                                       ;B49429
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 48)                  ;B4942C
    %AICMD0x0C($03)                                            ;B49430
    %AICMD0x23_OrWithIndexedValue(strcFlags.event5, $03)       ;B49432
    %AICMD0x28(strcFlags.event5, $02)                          ;B49437
    %AICMD0x3C()                                               ;B4943C
    %AICMD0x10_End()                                           ;B4943D


pAIScripting0x1D:
    dw DATA8_B4945E                                            ;B4943E|        |B4945E;
    dw DATA8_B4949B                                            ;B49440|        |B4949B;
    dw DATA8_B49515                                            ;B49442|        |B49515;
    dw DATA8_B4958D                                            ;B49444|        |B4958D;
    dw pAIScripting0x1E                                        ;B49446|        |B4967C;
    dw pAIScripting0x1E                                        ;B49448|        |B4967C;
    dw pAIScripting0x1E                                        ;B4944A|        |B4967C;
    dw pAIScripting0x1E                                        ;B4944C|        |B4967C;
    dw pAIScripting0x1E                                        ;B4944E|        |B4967C;
    dw pAIScripting0x1E                                        ;B49450|        |B4967C;
    dw pAIScripting0x1E                                        ;B49452|        |B4967C;
    dw pAIScripting0x1E                                        ;B49454|        |B4967C;
    dw pAIScripting0x1E                                        ;B49456|        |B4967C;
    dw pAIScripting0x1E                                        ;B49458|        |B4967C;
    dw pAIScripting0x1E                                        ;B4945A|        |B4967C;
    dw pAIScripting0x1E                                        ;B4945C|        |B4967C;
 
DATA8_B4945E:
 
    %AICMD0x50()                                               ;B4945E
    %AICMD0x08_EnableAIControl()                               ;B4945F
    %AICMD0x09($01, $B49468)                                   ;B49460
    %AICMD0x38()                                               ;B49464
    %AICMD0x0B($00)                                            ;B49465
    %AICMD0x10_End()                                           ;B49467
B49468:
    %AICMD0x1A($0088, $01B8, $B38240, $01)                     ;B49468
    %AICMD0x0C($00)                                            ;B49470
    %AICMD0x0D($00, $FE, $28, $01)                             ;B49472
    %AICMD0x1B($025F, $01)                                     ;B49477
    %AICMD0x13_Wait(10)                                        ;B4947B
    %AICMD0x1B($025F, $00)                                     ;B4947E
    %AICMD0x13_Wait(10)                                        ;B49482
    %AICMD0x1B($025D, $00)                                     ;B49485
    %AICMD0x1C_ShowDialog($01F5, $00)                          ;B49489
    %AICMD0x1B($025B, $00)                                     ;B4948D
    %AICMD0x0D($00, $02, $30, $01)                             ;B49491
    %AICMD0x0B($01)                                            ;B49496
    %AICMD0x37()                                               ;B49498
    %AICMD0x11_EnableUserControl()                             ;B49499
    %AICMD0x10_End()                                           ;B4949A


DATA8_B4949B:
 
    %AICMD0x09($01, $B494B3)                                   ;B4949B
    %AICMD0x09($02, $B494C8)                                   ;B4949F
    %AICMD0x09($03, $B494E4)                                   ;B494A3
    %AICMD0x09($04, $B494F9)                                   ;B494A7
    %AICMD0x38()                                               ;B494AB
    %AICMD0x10_End()                                           ;B494AC
    %AICMD0x13_Wait(1)                                         ;B494AD
    %AICMD0x12_Jump($B494AD)                                   ;B494B0
B494B3:
    %AICMD0x1A($0208, $0238, $B38240, $03)                     ;B494B3
    %AICMD0x1F($B494C1)                                        ;B494BB
    %AICMD0x12_Jump($B494BB)                                   ;B494BE
B494C1:
    %AICMD0x1C_ShowDialog($01F7, $00)                          ;B494C1
    %AICMD0x12_Jump($B494BB)                                   ;B494C5
B494C8:
    %AICMD0x1A($0168, $0218, $B38240, $03)                     ;B494C8
    %AICMD0x22($10, $10, $01, $B38240, $10)                    ;B494D0
    %AICMD0x1F($B494DD)                                        ;B494D7
    %AICMD0x12_Jump($B494D7)                                   ;B494DA
B494DD:
    %AICMD0x1C_ShowDialog($01F8, $00)                          ;B494DD
    %AICMD0x12_Jump($B494D7)                                   ;B494E1
B494E4:
    %AICMD0x1A($0188, $0048, $B38240, $00)                     ;B494E4
    %AICMD0x1F($B494F2)                                        ;B494EC
    %AICMD0x12_Jump($B494EC)                                   ;B494EF
B494F2:
    %AICMD0x1C_ShowDialog($01F7, $00)                          ;B494F2
    %AICMD0x12_Jump($B494EC)                                   ;B494F6
B494F9:
    %AICMD0x1A($00D8, $01D8, $B38234, $00)                     ;B494F9
    %AICMD0x22($20, $00, $01, $B38240, $10)                    ;B49501
    %AICMD0x1F($B4950E)                                        ;B49508
    %AICMD0x12_Jump($B49508)                                   ;B4950B
B4950E:
    %AICMD0x1C_ShowDialog($01FA, $00)                          ;B4950E
    %AICMD0x12_Jump($B49508)                                   ;B49512


DATA8_B49515:
 
    %AICMD0x50()                                               ;B49515
    %AICMD0x00_SetMusic($0E, $B4)                              ;B49516
    %AICMD0x09($01, $B49576)                                   ;B49519
    %AICMD0x09($02, $B49561)                                   ;B4951D
    %AICMD0x38()                                               ;B49521
    %AICMD0x0C($00)                                            ;B49522
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily3, $05)       ;B49524
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 0, $B49545)     ;B49529
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 1, $B4954A)     ;B49530
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 2, $B4954F)     ;B49537
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, $B49554)     ;B4953E
B49545:
    %AICMD0x3D_TeleportToArea(!AREA_WOODSSPRING)               ;B49545
    %AICMD0x12_Jump($B49559)                                   ;B49547
B4954A:
    %AICMD0x3D_TeleportToArea(!AREA_WOODSSUMMER)               ;B4954A
    %AICMD0x12_Jump($B49559)                                   ;B4954C
B4954F:
    %AICMD0x3D_TeleportToArea(!AREA_WOODSFALL)                 ;B4954F
    %AICMD0x12_Jump($B49559)                                   ;B49551
B49554:
    %AICMD0x3D_TeleportToArea(!AREA_WOODSWINTER)               ;B49554
    %AICMD0x12_Jump($B49559)                                   ;B49556
B49559:
    %AICMD0x05_SetTransferPosition(168, 424)                   ;B49559
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4955E
    %AICMD0x10_End()                                           ;B49560
B49561:
    %AICMD0x1A($0198, $0078, $B38204, $02)                     ;B49561
    %AICMD0x1F($B4956F)                                        ;B49569
    %AICMD0x12_Jump($B49569)                                   ;B4956C
B4956F:
    %AICMD0x1C_ShowDialog($01F6, $00)                          ;B4956F
    %AICMD0x12_Jump($B49569)                                   ;B49573
B49576:
    %AICMD0x1A($0038, $0058, $B38660, $03)                     ;B49576
    %AICMD0x1F($B49584)                                        ;B4957E
    %AICMD0x12_Jump($B4957E)                                   ;B49581
B49584:
    %AICMD0x1C_ShowDialog($01FC, $00)                          ;B49584
    %AICMD0x0B($00)                                            ;B49588
    %AICMD0x12_Jump($B4957E)                                   ;B4958A


DATA8_B4958D:
 
    %AICMD0x50()                                               ;B4958D
    %AICMD0x08_EnableAIControl()                               ;B4958E
    %AICMD0x09($01, $B495C6)                                   ;B4958F
    %AICMD0x09($02, $B49661)                                   ;B49593
    %AICMD0x09($03, $B4962C)                                   ;B49597
    %AICMD0x38()                                               ;B4959B
    %AICMD0x0B($00)                                            ;B4959C
    %AICMD0x0C($02)                                            ;B4959E
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B495A0
    %AICMD0x0C($04)                                            ;B495A2
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B495A4
    %AICMD0x0C($06)                                            ;B495A6
    %AICMD0x13_Wait(120)                                       ;B495A8
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 48)                  ;B495AB
    %AICMD0x0C($07)                                            ;B495AF
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B495B1
    %AICMD0x13_Wait(60)                                        ;B495B3
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 32)                 ;B495B6
    %AICMD0x23_OrWithIndexedValue(strcFlags.event5, $05)       ;B495BA
    %AICMD0x28(strcFlags.event5, $04)                          ;B495BF
    %AICMD0x3C()                                               ;B495C4
    %AICMD0x10_End()                                           ;B495C5
B495C6:
    %AICMD0x1A($0068, $01A8, $B38204, $02)                     ;B495C6
    %AICMD0x0C($00)                                            ;B495CE
    %AICMD0x1B($0249, $01)                                     ;B495D0
    %AICMD0x0D($01, $00, $20, $01)                             ;B495D4
    %AICMD0x1C_ShowDialog($01FD, $01)                          ;B495D9
    %AICMD0x0B($01)                                            ;B495DD
    %AICMD0x0C($02)                                            ;B495DF
    %AICMD0x1C_ShowDialog($01FF, $01)                          ;B495E1
    %AICMD0x0B($03)                                            ;B495E5
    %AICMD0x0C($05)                                            ;B495E7
    %AICMD0x1B($0249, $01)                                     ;B495E9
    %AICMD0x0D($01, $00, $10, $01)                             ;B495ED
    %AICMD0x1C_ShowDialog($0200, $01)                          ;B495F2
    %AICMD0x0D($01, $00, $08, $01)                             ;B495F6
    %AICMD0x1B($024A, $01)                                     ;B495FB
    %AICMD0x13_Wait(90)                                        ;B495FF
    %AICMD0x41_AddValue16(nLove_Eve, 50)                       ;B49602
    %AICMD0x0B($06)                                            ;B49608
    %AICMD0x1B($0245, $00)                                     ;B4960A
    %AICMD0x0D($00, $01, $30, $01)                             ;B4960E
    %AICMD0x13_Wait(10)                                        ;B49613
    %AICMD0x1B($0249, $01)                                     ;B49616
    %AICMD0x0D($01, $00, $30, $01)                             ;B4961A
    %AICMD0x0B($07)                                            ;B4961F
    %AICMD0x1B($0249, $01)                                     ;B49621
    %AICMD0x0D($01, $00, $76, $01)                             ;B49625
    %AICMD0x37()                                               ;B4962A
    %AICMD0x10_End()                                           ;B4962B
B4962C:
    %AICMD0x1A($0098, $01A8, $B382D0, $00)                     ;B4962C
    %AICMD0x0C($01)                                            ;B49634
    %AICMD0x1B($0281, $00)                                     ;B49636
    %AICMD0x1C_ShowDialog($01FE, $00)                          ;B4963A
    %AICMD0x0B($02)                                            ;B4963E
    %AICMD0x0C($03)                                            ;B49640
    %AICMD0x1B($027D, $00)                                     ;B49642
    %AICMD0x0D($00, $01, $30, $01)                             ;B49646
    %AICMD0x1B($0281, $01)                                     ;B4964B
    %AICMD0x0D($01, $00, $20, $01)                             ;B4964F
    %AICMD0x0B($04)                                            ;B49654
    %AICMD0x1B($0281, $01)                                     ;B49656
    %AICMD0x0D($01, $00, $70, $01)                             ;B4965A
    %AICMD0x37()                                               ;B4965F
    %AICMD0x10_End()                                           ;B49660
B49661:
    %AICMD0x1A($00D8, $01D8, $B38234, $03)                     ;B49661
    %AICMD0x0C($04)                                            ;B49669
    %AICMD0x1C_ShowDialog($01F9, $01)                          ;B4966B
    %AICMD0x1B($025F, $01)                                     ;B4966F
    %AICMD0x0D($01, $00, $70, $01)                             ;B49673
    %AICMD0x0B($05)                                            ;B49678
    %AICMD0x37()                                               ;B4967A
    %AICMD0x10_End()                                           ;B4967B


pAIScripting0x1E:
    dw DATA8_B4969C                                            ;B4967C|        |B4969C;
    dw pAIScripting0x1F                                        ;B4967E|        |B49A41;
    dw pAIScripting0x1F                                        ;B49680|        |B49A41;
    dw pAIScripting0x1F                                        ;B49682|        |B49A41;
    dw pAIScripting0x1F                                        ;B49684|        |B49A41;
    dw pAIScripting0x1F                                        ;B49686|        |B49A41;
    dw pAIScripting0x1F                                        ;B49688|        |B49A41;
    dw pAIScripting0x1F                                        ;B4968A|        |B49A41;
    dw pAIScripting0x1F                                        ;B4968C|        |B49A41;
    dw pAIScripting0x1F                                        ;B4968E|        |B49A41;
    dw pAIScripting0x1F                                        ;B49690|        |B49A41;
    dw pAIScripting0x1F                                        ;B49692|        |B49A41;
    dw pAIScripting0x1F                                        ;B49694|        |B49A41;
    dw pAIScripting0x1F                                        ;B49696|        |B49A41;
    dw pAIScripting0x1F                                        ;B49698|        |B49A41;
    dw pAIScripting0x1F                                        ;B4969A|        |B49A41;
 
DATA8_B4969C:
 
    %AICMD0x50()                                               ;B4969C
    %AICMD0x00_SetMusic($18, $B4)                              ;B4969D
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $09)       ;B496A0
    %AICMD0x02_FreezeTime()                                    ;B496A5
    %AICMD0x03_SetHour($07)                                    ;B496A6
    %AICMD0x05_SetTransferPosition(360, 152)                   ;B496A8
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B496AD
    %AICMD0x08_EnableAIControl()                               ;B496AF
    %AICMD0x19($00E8, $00)                                     ;B496B0
    %AICMD0x09($01, $B4979E)                                   ;B496B4
    %AICMD0x09($02, $B499D1)                                   ;B496B8
    %AICMD0x09($03, $B499DF)                                   ;B496BC
    %AICMD0x09($04, $B499ED)                                   ;B496C0
    %AICMD0x09($05, $B499FB)                                   ;B496C4
    %AICMD0x09($06, $B49A17)                                   ;B496C8
    %AICMD0x09($07, $B49A09)                                   ;B496CC
    %AICMD0x09($08, $B49A25)                                   ;B496D0
    %AICMD0x09($09, $B49A33)                                   ;B496D4
    %AICMD0x09($0A, $B4973E)                                   ;B496D8
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 0, $B496F8)     ;B496DC
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 1, $B496FD)     ;B496E3
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 2, $B49702)     ;B496EA
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, $B49707)     ;B496F1
B496F8:
    %AICMD0x06_SetDestinationArea(!AREA_TOWNSPRING)            ;B496F8
    %AICMD0x12_Jump($B4970C)                                   ;B496FA
B496FD:
    %AICMD0x06_SetDestinationArea(!AREA_TOWNSUMMER)            ;B496FD
    %AICMD0x12_Jump($B4970C)                                   ;B496FF
B49702:
    %AICMD0x06_SetDestinationArea(!AREA_TOWNFALL)              ;B49702
    %AICMD0x12_Jump($B4970C)                                   ;B49704
B49707:
    %AICMD0x06_SetDestinationArea(!AREA_TOWNWINTER)            ;B49707
    %AICMD0x12_Jump($B4970C)                                   ;B49709
B4970C:
    %AICMD0x38()                                               ;B4970C
    %AICMD0x0C($01)                                            ;B4970D
    %AICMD0x09($0B, $B4991F)                                   ;B4970F
    %AICMD0x09($0C, $B4994B)                                   ;B49713
    %AICMD0x09($0D, $B49975)                                   ;B49717
    %AICMD0x09($0E, $B49992)                                   ;B4971B
    %AICMD0x09($0F, $B499AF)                                   ;B4971F
    %AICMD0x0C($03)                                            ;B49723
    %AICMD0x13_Wait(60)                                        ;B49725
    %AICMD0x41_AddValue16(nPlayerHappiness, 50)                ;B49728
    %AICMD0x01_UnfreezeTime()                                  ;B4972E
    %AICMD0x24_NextHourPalette($74)                            ;B4972F
    %AICMD0x13_Wait(180)                                       ;B49731
    %AICMD0x1C_ShowDialog($01BF, $00)                          ;B49734
    %AICMD0x47_SetValue8($800979, 3)                           ;B49738
    %AICMD0x10_End()                                           ;B4973D
B4973E:
    %AICMD0x1A($0168, $0098, $B38B40, $00)                     ;B4973E
    %AICMD0x13_Wait(180)                                       ;B49746
    %AICMD0x1B($032D, $00)                                     ;B49749
    %AICMD0x29_SetMapScrooling(0, 1, 16)                       ;B4974D
    %AICMD0x0D($00, $01, $10, $01)                             ;B49753
    %AICMD0x1B($032C, $00)                                     ;B49758
    %AICMD0x13_Wait(60)                                        ;B4975C
    %AICMD0x1B($032E, $00)                                     ;B4975F
    %AICMD0x13_Wait(60)                                        ;B49763
    %AICMD0x1B($032F, $00)                                     ;B49766
    %AICMD0x09($10, $B49791)                                   ;B4976A
    %AICMD0x13_Wait(120)                                       ;B4976E
    %AICMD0x1B($032C, $00)                                     ;B49771
    %AICMD0x13_Wait(60)                                        ;B49775
    %AICMD0x1B($032D, $00)                                     ;B49778
    %AICMD0x29_SetMapScrooling(0, 1, 48)                       ;B4977C
    %AICMD0x0D($00, $01, $30, $01)                             ;B49782
    %AICMD0x13_Wait(60)                                        ;B49787
    %AICMD0x1B($032C, $00)                                     ;B4978A
    %AICMD0x0B($01)                                            ;B4978E
    %AICMD0x10_End()                                           ;B49790
B49791:
    %AICMD0x1A($0170, $0090, $B38B4C, $00)                     ;B49791
    %AICMD0x13_Wait(60)                                        ;B49799
    %AICMD0x37()                                               ;B4979C
    %AICMD0x10_End()                                           ;B4979D
B4979E:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $00, $B497C1)   ;B4979E
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $01, $B49802)   ;B497A5
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, $B49843)   ;B497AC
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $03, $B49884)   ;B497B3
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $04, $B498C5)   ;B497BA
B497C1:
    %AICMD0x1A($0178, $0098, $B3866C, $00)                     ;B497C1
    %AICMD0x13_Wait(180)                                       ;B497C9
    %AICMD0x1B($0331, $00)                                     ;B497CC
    %AICMD0x0D($00, $01, $10, $01)                             ;B497D0
    %AICMD0x1B($0330, $00)                                     ;B497D5
    %AICMD0x13_Wait(64)                                        ;B497D9
    %AICMD0x1B($0332, $00)                                     ;B497DC
    %AICMD0x13_Wait(60)                                        ;B497E0
    %AICMD0x1B($0333, $00)                                     ;B497E3
    %AICMD0x13_Wait(120)                                       ;B497E7
    %AICMD0x1B($0330, $00)                                     ;B497EA
    %AICMD0x13_Wait(60)                                        ;B497EE
    %AICMD0x1B($0331, $00)                                     ;B497F1
    %AICMD0x0D($00, $01, $30, $01)                             ;B497F5
    %AICMD0x0B($02)                                            ;B497FA
    %AICMD0x13_Wait(1)                                         ;B497FC
    %AICMD0x12_Jump($B497FC)                                   ;B497FF
B49802:
    %AICMD0x1A($0178, $0098, $B38678, $00)                     ;B49802
    %AICMD0x1B($0335, $00)                                     ;B4980A
    %AICMD0x13_Wait(180)                                       ;B4980E
    %AICMD0x0D($00, $01, $10, $01)                             ;B49811
    %AICMD0x1B($0334, $00)                                     ;B49816
    %AICMD0x13_Wait(60)                                        ;B4981A
    %AICMD0x1B($0336, $00)                                     ;B4981D
    %AICMD0x13_Wait(60)                                        ;B49821
    %AICMD0x1B($0337, $00)                                     ;B49824
    %AICMD0x13_Wait(120)                                       ;B49828
    %AICMD0x1B($0336, $00)                                     ;B4982B
    %AICMD0x13_Wait(60)                                        ;B4982F
    %AICMD0x1B($0335, $00)                                     ;B49832
    %AICMD0x0D($00, $01, $30, $01)                             ;B49836
    %AICMD0x0B($02)                                            ;B4983B
    %AICMD0x13_Wait(1)                                         ;B4983D
    %AICMD0x12_Jump($B4983D)                                   ;B49840
B49843:
    %AICMD0x1A($0178, $0098, $B38684, $00)                     ;B49843
    %AICMD0x1B($0341, $00)                                     ;B4984B
    %AICMD0x13_Wait(180)                                       ;B4984F
    %AICMD0x0D($00, $01, $10, $01)                             ;B49852
    %AICMD0x1B($0340, $00)                                     ;B49857
    %AICMD0x13_Wait(60)                                        ;B4985B
    %AICMD0x1B($0342, $00)                                     ;B4985E
    %AICMD0x13_Wait(60)                                        ;B49862
    %AICMD0x1B($0343, $00)                                     ;B49865
    %AICMD0x13_Wait(120)                                       ;B49869
    %AICMD0x1B($0342, $00)                                     ;B4986C
    %AICMD0x13_Wait(60)                                        ;B49870
    %AICMD0x1B($0341, $00)                                     ;B49873
    %AICMD0x0D($00, $01, $30, $01)                             ;B49877
    %AICMD0x0B($02)                                            ;B4987C
    %AICMD0x13_Wait(1)                                         ;B4987E
    %AICMD0x12_Jump($B4987E)                                   ;B49881
B49884:
    %AICMD0x1A($0178, $0098, $B38690, $00)                     ;B49884
    %AICMD0x1B($0339, $00)                                     ;B4988C
    %AICMD0x13_Wait(180)                                       ;B49890
    %AICMD0x0D($00, $01, $10, $01)                             ;B49893
    %AICMD0x1B($0338, $00)                                     ;B49898
    %AICMD0x13_Wait(60)                                        ;B4989C
    %AICMD0x1B($033A, $00)                                     ;B4989F
    %AICMD0x13_Wait(60)                                        ;B498A3
    %AICMD0x1B($033B, $00)                                     ;B498A6
    %AICMD0x13_Wait(120)                                       ;B498AA
    %AICMD0x1B($0338, $00)                                     ;B498AD
    %AICMD0x13_Wait(60)                                        ;B498B1
    %AICMD0x1B($0339, $00)                                     ;B498B4
    %AICMD0x0D($00, $01, $30, $01)                             ;B498B8
    %AICMD0x0B($02)                                            ;B498BD
    %AICMD0x13_Wait(1)                                         ;B498BF
    %AICMD0x12_Jump($B498BF)                                   ;B498C2
B498C5:
    %AICMD0x1A($0178, $0098, $B3869C, $00)                     ;B498C5
    %AICMD0x1B($033D, $00)                                     ;B498CD
    %AICMD0x13_Wait(180)                                       ;B498D1
    %AICMD0x0D($00, $01, $10, $01)                             ;B498D4
    %AICMD0x1B($033C, $00)                                     ;B498D9
    %AICMD0x13_Wait(60)                                        ;B498DD
    %AICMD0x1B($033E, $00)                                     ;B498E0
    %AICMD0x13_Wait(60)                                        ;B498E4
    %AICMD0x1B($033F, $00)                                     ;B498E7
    %AICMD0x13_Wait(120)                                       ;B498EB
    %AICMD0x1B($033E, $00)                                     ;B498EE
    %AICMD0x13_Wait(60)                                        ;B498F2
    %AICMD0x1B($033D, $00)                                     ;B498F5
    %AICMD0x0D($00, $01, $30, $01)                             ;B498F9
    %AICMD0x0B($02)                                            ;B498FE
    %AICMD0x13_Wait(1)                                         ;B49900
    %AICMD0x12_Jump($B49900)                                   ;B49903
    %AICMD0x1A($0178, $00D0, $B3863C, $00)                     ;B49906
    %AICMD0x0D($01, $FF, $40, $02)                             ;B4990E
    %AICMD0x0D($01, $00, $20, $02)                             ;B49913
    %AICMD0x0D($01, $01, $40, $02)                             ;B49918
    %AICMD0x37()                                               ;B4991D
    %AICMD0x10_End()                                           ;B4991E
B4991F:
    %AICMD0x1A($0208, $00CC, $B3854C, $03)                     ;B4991F
    %AICMD0x0C($02)                                            ;B49927
    %AICMD0x0D($FD, $00, $30, $03)                             ;B49929
    %AICMD0x0D($FD, $FF, $30, $03)                             ;B4992E
    %AICMD0x0D($FC, $FE, $30, $03)                             ;B49933
    %AICMD0x0D($FC, $FD, $18, $02)                             ;B49938
    %AICMD0x0D($FC, $FC, $18, $02)                             ;B4993D
    %AICMD0x0D($FC, $FB, $14, $02)                             ;B49942
    %AICMD0x0B($03)                                            ;B49947
    %AICMD0x37()                                               ;B49949
    %AICMD0x10_End()                                           ;B4994A
B4994B:
    %AICMD0x1A($01F8, $0068, $B3854C, $03)                     ;B4994B
    %AICMD0x0C($02)                                            ;B49953
    %AICMD0x13_Wait(40)                                        ;B49955
    %AICMD0x0D($FD, $04, $3C, $03)                             ;B49958
    %AICMD0x0D($FD, $03, $30, $02)                             ;B4995D
    %AICMD0x0D($FD, $02, $40, $02)                             ;B49962
    %AICMD0x0D($FD, $01, $40, $02)                             ;B49967
    %AICMD0x0D($FD, $00, $30, $02)                             ;B4996C
    %AICMD0x0B($03)                                            ;B49971
    %AICMD0x37()                                               ;B49973
    %AICMD0x10_End()                                           ;B49974
B49975:
    %AICMD0x1A($0100, $00C8, $B3854C, $02)                     ;B49975
    %AICMD0x0C($02)                                            ;B4997D
    %AICMD0x0D($03, $FF, $30, $02)                             ;B4997F
    %AICMD0x0D($03, $FE, $20, $03)                             ;B49984
    %AICMD0x0D($01, $FF, $40, $01)                             ;B49989
    %AICMD0x0B($03)                                            ;B4998E
    %AICMD0x37()                                               ;B49990
    %AICMD0x10_End()                                           ;B49991
B49992:
    %AICMD0x1A($0196, $0048, $B3854C, $00)                     ;B49992
    %AICMD0x0C($02)                                            ;B4999A
    %AICMD0x0D($00, $02, $20, $02)                             ;B4999C
    %AICMD0x0D($FE, $03, $40, $03)                             ;B499A1
    %AICMD0x0D($FE, $03, $90, $02)                             ;B499A6
    %AICMD0x0B($03)                                            ;B499AB
    %AICMD0x37()                                               ;B499AD
    %AICMD0x10_End()                                           ;B499AE
B499AF:
    %AICMD0x1A($00E8, $0028, $B3854C, $00)                     ;B499AF
    %AICMD0x0C($02)                                            ;B499B7
    %AICMD0x0D($00, $02, $40, $02)                             ;B499B9
    %AICMD0x0D($01, $03, $40, $03)                             ;B499BE
    %AICMD0x0D($02, $03, $40, $03)                             ;B499C3
    %AICMD0x0D($03, $03, $58, $03)                             ;B499C8
    %AICMD0x0B($03)                                            ;B499CD
    %AICMD0x37()                                               ;B499CF
    %AICMD0x10_End()                                           ;B499D0
B499D1:
    %AICMD0x1A($0140, $0098, $B38360, $02)                     ;B499D1
    %AICMD0x13_Wait(1)                                         ;B499D9
    %AICMD0x12_Jump($B499D9)                                   ;B499DC
B499DF:
    %AICMD0x1A($0198, $0098, $B3830C, $03)                     ;B499DF
    %AICMD0x13_Wait(1)                                         ;B499E7
    %AICMD0x12_Jump($B499E7)                                   ;B499EA
B499ED:
    %AICMD0x1A($0148, $00C8, $B38408, $02)                     ;B499ED
    %AICMD0x13_Wait(1)                                         ;B499F5
    %AICMD0x12_Jump($B499F5)                                   ;B499F8
B499FB:
    %AICMD0x1A($0138, $00D8, $B38324, $02)                     ;B499FB
    %AICMD0x13_Wait(1)                                         ;B49A03
    %AICMD0x12_Jump($B49A03)                                   ;B49A06
B49A09:
    %AICMD0x1A($0190, $00C8, $B38378, $03)                     ;B49A09
    %AICMD0x13_Wait(1)                                         ;B49A11
    %AICMD0x12_Jump($B49A11)                                   ;B49A14
B49A17:
    %AICMD0x1A($01A8, $00B0, $B3833C, $03)                     ;B49A17
    %AICMD0x13_Wait(1)                                         ;B49A1F
    %AICMD0x12_Jump($B49A1F)                                   ;B49A22
B49A25:
    %AICMD0x1A($0148, $00F8, $B38B28, $00)                     ;B49A25
    %AICMD0x13_Wait(180)                                       ;B49A2D
    %AICMD0x12_Jump($B49A2D)                                   ;B49A30
B49A33:
    %AICMD0x1A($0198, $00F8, $B38B34, $00)                     ;B49A33
    %AICMD0x13_Wait(180)                                       ;B49A3B
    %AICMD0x12_Jump($B49A3B)                                   ;B49A3E


pAIScripting0x1F:
    dw DATA8_B49A61                                            ;B49A41|        |B49A61;
    dw DATA8_B49C2C                                            ;B49A43|        |B49C2C;
    dw DATA8_B49DD7                                            ;B49A45|        |B49DD7;
    dw pAIScripting0x20                                        ;B49A47|        |B49E33;
    dw pAIScripting0x20                                        ;B49A49|        |B49E33;
    dw pAIScripting0x20                                        ;B49A4B|        |B49E33;
    dw pAIScripting0x20                                        ;B49A4D|        |B49E33;
    dw pAIScripting0x20                                        ;B49A4F|        |B49E33;
    dw pAIScripting0x20                                        ;B49A51|        |B49E33;
    dw pAIScripting0x20                                        ;B49A53|        |B49E33;
    dw pAIScripting0x20                                        ;B49A55|        |B49E33;
    dw pAIScripting0x20                                        ;B49A57|        |B49E33;
    dw pAIScripting0x20                                        ;B49A59|        |B49E33;
    dw pAIScripting0x20                                        ;B49A5B|        |B49E33;
    dw pAIScripting0x20                                        ;B49A5D|        |B49E33;
    dw pAIScripting0x20                                        ;B49A5F|        |B49E33;
 
DATA8_B49A61:
 
    %AICMD0x50()                                               ;B49A61
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily3, $0D)       ;B49A62
    %AICMD0x09($01, $B49AE2)                                   ;B49A67
    %AICMD0x09($02, $B49B99)                                   ;B49A6B
    %AICMD0x09($03, $B49B76)                                   ;B49A6F
    %AICMD0x12_Jump($B49A99)                                   ;B49A73
    %AICMD0x55(strcFlags.event6, $02, $B49A8B)                 ;B49A76
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 0, 60, $B49A8B) ;B49A7D
    %AICMD0x09($05, $B49D59)                                   ;B49A87
B49A8B:
    %AICMD0x38()                                               ;B49A8B
    %AICMD0x0C($00)                                            ;B49A8C
    %AICMD0x13_Wait(3600)                                      ;B49A8E
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily3, $0D)       ;B49A91
    %AICMD0x3D_TeleportToArea(!AREA_HOUSE3)                    ;B49A96
    %AICMD0x10_End()                                           ;B49A98
B49A99:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $00, $B49ABF)   ;B49A99
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $01, $B49AC6)   ;B49AA0
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, $B49ACD)   ;B49AA7
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $03, $B49AD4)   ;B49AAE
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $04, $B49ADB)   ;B49AB5
    %AICMD0x12_Jump($B49A76)                                   ;B49ABC
B49ABF:
    %AICMD0x09($04, $B49BAE)                                   ;B49ABF
    %AICMD0x12_Jump($B49A76)                                   ;B49AC3
B49AC6:
    %AICMD0x09($04, $B49BCA)                                   ;B49AC6
    %AICMD0x12_Jump($B49A76)                                   ;B49ACA
B49ACD:
    %AICMD0x09($04, $B49BE6)                                   ;B49ACD
    %AICMD0x12_Jump($B49A76)                                   ;B49AD1
B49AD4:
    %AICMD0x09($04, $B49BFB)                                   ;B49AD4
    %AICMD0x12_Jump($B49A76)                                   ;B49AD8
B49ADB:
    %AICMD0x09($04, $B49C17)                                   ;B49ADB
    %AICMD0x12_Jump($B49A76)                                   ;B49ADF
B49AE2:
    %AICMD0x1A($0119, $0063, $B38B58, $00)                     ;B49AE2
    %AICMD0x1F($B49AF6)                                        ;B49AEA
    %AICMD0x12_Jump($B49AEA)                                   ;B49AED
    %AICMD0x1F($B49B42)                                        ;B49AF0
    %AICMD0x12_Jump($B49AF0)                                   ;B49AF3
B49AF6:
    %AICMD0x0B($00)                                            ;B49AF6
    %AICMD0x1D_ShowDialog($01AA, $00)                          ;B49AF8
    %AICMD0x20_JumpIfChoice(0, $B49B07)                        ;B49AFC
    %AICMD0x20_JumpIfChoice(1, $B49B14)                        ;B49B00
    %AICMD0x12_Jump($B49AEA)                                   ;B49B04
B49B07:
    %AICMD0x1C_ShowDialog($01AB, $00)                          ;B49B07
    %AICMD0x25($03)                                            ;B49B0B
    %AICMD0x09($03, $B49B8B)                                   ;B49B0D
    %AICMD0x12_Jump($B49AF0)                                   ;B49B11
B49B14:
    %AICMD0x1C_ShowDialog($01AC, $00)                          ;B49B14
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $00, $B49B49)   ;B49B18
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $01, $B49B52)   ;B49B1F
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, $B49B5B)   ;B49B26
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $03, $B49B64)   ;B49B2D
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $04, $B49B6D)   ;B49B34
    %AICMD0x1B($02E9, $00)                                     ;B49B3B
    %AICMD0x12_Jump($B49AF0)                                   ;B49B3F
B49B42:
    %AICMD0x1C_ShowDialog($01AD, $00)                          ;B49B42
    %AICMD0x12_Jump($B49AF0)                                   ;B49B46
B49B49:
    %AICMD0x41_AddValue16(nLove_Maria, 50)                     ;B49B49
    %AICMD0x12_Jump($B49B3B)                                   ;B49B4F
B49B52:
    %AICMD0x41_AddValue16(nLove_Ann, 50)                       ;B49B52
    %AICMD0x12_Jump($B49B3B)                                   ;B49B58
B49B5B:
    %AICMD0x41_AddValue16(nLove_Nina, 50)                      ;B49B5B
    %AICMD0x12_Jump($B49B3B)                                   ;B49B61
B49B64:
    %AICMD0x41_AddValue16(nLove_Ellen, 50)                     ;B49B64
    %AICMD0x12_Jump($B49B3B)                                   ;B49B6A
B49B6D:
    %AICMD0x41_AddValue16(nLove_Eve, 50)                       ;B49B6D
    %AICMD0x12_Jump($B49B3B)                                   ;B49B73
B49B76:
    %AICMD0x1A($0080, $00C8, $B38354, $01)                     ;B49B76
    %AICMD0x1F($B49B84)                                        ;B49B7E
    %AICMD0x12_Jump($B49B7E)                                   ;B49B81
B49B84:
    %AICMD0x1C_ShowDialog($0280, $00)                          ;B49B84
    %AICMD0x12_Jump($B49B7E)                                   ;B49B88
B49B8B:
    %AICMD0x1A($0060, $00B0, $B38354, $00)                     ;B49B8B
    %AICMD0x13_Wait(1)                                         ;B49B93
    %AICMD0x12_Jump($B49B7E)                                   ;B49B96
B49B99:
    %AICMD0x1A($0128, $0078, $B382F4, $03)                     ;B49B99
    %AICMD0x1F($B49BA7)                                        ;B49BA1
    %AICMD0x12_Jump($B49BA1)                                   ;B49BA4
B49BA7:
    %AICMD0x1D_ShowDialog($01A9, $00)                          ;B49BA7
    %AICMD0x12_Jump($B49BA1)                                   ;B49BAB
B49BAE:
    %AICMD0x1A($0148, $0068, $B38300, $00)                     ;B49BAE
    %AICMD0x22($10, $10, $01, $B3830C, $00)                    ;B49BB6
    %AICMD0x1F($B49BC3)                                        ;B49BBD
    %AICMD0x12_Jump($B49BBD)                                   ;B49BC0
B49BC3:
    %AICMD0x1C_ShowDialog($01AE, $00)                          ;B49BC3
    %AICMD0x12_Jump($B49BBD)                                   ;B49BC7
B49BCA:
    %AICMD0x1A($0148, $0088, $B38318, $00)                     ;B49BCA
    %AICMD0x22($10, $10, $01, $B38324, $08)                    ;B49BD2
    %AICMD0x1F($B49BDF)                                        ;B49BD9
    %AICMD0x12_Jump($B49BD9)                                   ;B49BDC
B49BDF:
    %AICMD0x1C_ShowDialog($01AF, $00)                          ;B49BDF
    %AICMD0x12_Jump($B49BD9)                                   ;B49BE3
B49BE6:
    %AICMD0x1A($0148, $0068, $B383FC, $00)                     ;B49BE6
    %AICMD0x1F($B49BF4)                                        ;B49BEE
    %AICMD0x12_Jump($B49BEE)                                   ;B49BF1
B49BF4:
    %AICMD0x1C_ShowDialog($01B0, $00)                          ;B49BF4
    %AICMD0x12_Jump($B49BEE)                                   ;B49BF8
B49BFB:
    %AICMD0x1A($0148, $0078, $B3833C, $00)                     ;B49BFB
    %AICMD0x22($10, $10, $01, $B3833C, $08)                    ;B49C03
    %AICMD0x1F($B49C10)                                        ;B49C0A
    %AICMD0x12_Jump($B49C0A)                                   ;B49C0D
B49C10:
    %AICMD0x1C_ShowDialog($01B1, $00)                          ;B49C10
    %AICMD0x12_Jump($B49C0A)                                   ;B49C14
B49C17:
    %AICMD0x1A($0148, $0068, $B382D0, $00)                     ;B49C17
    %AICMD0x1F($B49C25)                                        ;B49C1F
    %AICMD0x12_Jump($B49C1F)                                   ;B49C22
B49C25:
    %AICMD0x1C_ShowDialog($01B2, $00)                          ;B49C25
    %AICMD0x12_Jump($B49C1F)                                   ;B49C29


DATA8_B49C2C:
 
    %AICMD0x50()                                               ;B49C2C
    %AICMD0x00_SetMusic($0B, $B4)                              ;B49C2D
    %AICMD0x05_SetTransferPosition(136, 184)                   ;B49C30
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B49C35
    %AICMD0x08_EnableAIControl()                               ;B49C37
    %AICMD0x09($01, $B49CBF)                                   ;B49C38
    %AICMD0x09($02, $B49CD6)                                   ;B49C3C
    %AICMD0x09($03, $B49D36)                                   ;B49C40
    %AICMD0x09($04, $B49D4B)                                   ;B49C44
    %AICMD0x12_Jump($B49C76)                                   ;B49C48
    %AICMD0x55(strcFlags.event6, $02, $B49C60)                 ;B49C4B
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 0, 60, $B49C60) ;B49C52
    %AICMD0x09($05, $B49D59)                                   ;B49C5C
B49C60:
    %AICMD0x38()                                               ;B49C60
    %AICMD0x13_Wait(1)                                         ;B49C61
    %AICMD0x1C_ShowDialog($01B3, $01)                          ;B49C64
    %AICMD0x11_EnableUserControl()                             ;B49C68
    %AICMD0x0C($00)                                            ;B49C69
    %AICMD0x23_OrWithIndexedValue($800196, $0D)                ;B49C6B
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily3, $0E)       ;B49C70
    %AICMD0x10_End()                                           ;B49C75
B49C76:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $00, $B49C9C)   ;B49C76
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $01, $B49CA3)   ;B49C7D
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, $B49CAA)   ;B49C84
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $03, $B49CB1)   ;B49C8B
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $04, $B49CB8)   ;B49C92
    %AICMD0x12_Jump($B49C4B)                                   ;B49C99
B49C9C:
    %AICMD0x09($06, $B49D6E)                                   ;B49C9C
    %AICMD0x12_Jump($B49C4B)                                   ;B49CA0
B49CA3:
    %AICMD0x09($06, $B49D83)                                   ;B49CA3
    %AICMD0x12_Jump($B49C4B)                                   ;B49CA7
B49CAA:
    %AICMD0x09($06, $B49D98)                                   ;B49CAA
    %AICMD0x12_Jump($B49C4B)                                   ;B49CAE
B49CB1:
    %AICMD0x09($06, $B49DAD)                                   ;B49CB1
    %AICMD0x12_Jump($B49C4B)                                   ;B49CB5
B49CB8:
    %AICMD0x09($06, $B49DC2)                                   ;B49CB8
    %AICMD0x12_Jump($B49C4B)                                   ;B49CBC
B49CBF:
    %AICMD0x1A($0119, $0063, $B3845C, $00)                     ;B49CBF
    %AICMD0x1F($B49CCD)                                        ;B49CC7
    %AICMD0x12_Jump($B49CC7)                                   ;B49CCA
B49CCD:
    %AICMD0x1C_ShowDialog($01BA, $00)                          ;B49CCD
    %AICMD0x0B($00)                                            ;B49CD1
    %AICMD0x12_Jump($B49CC7)                                   ;B49CD3
B49CD6:
    %AICMD0x1A($0138, $0068, $B382E8, $03)                     ;B49CD6
    %AICMD0x1F($B49CFF)                                        ;B49CDE
    %AICMD0x12_Jump($B49CDE)                                   ;B49CE1
    %AICMD0x1F($B49CEA)                                        ;B49CE4
    %AICMD0x12_Jump($B49CE4)                                   ;B49CE7
B49CEA:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $00, $B49CF8) ;B49CEA
    %AICMD0x1C_ShowDialog($0281, $00)                          ;B49CF1
    %AICMD0x12_Jump($B49CE4)                                   ;B49CF5
B49CF8:
    %AICMD0x1C_ShowDialog($01B4, $00)                          ;B49CF8
    %AICMD0x12_Jump($B49CE4)                                   ;B49CFC
B49CFF:
    %AICMD0x17($02)                                            ;B49CFF
    %AICMD0x18($00, $B49D0C)                                   ;B49D01
    %AICMD0x18($01, $B49D18)                                   ;B49D05
    %AICMD0x12_Jump($B49CDE)                                   ;B49D09
    %AICMD0x1C_ShowDialog($01B4, $00)                          ;B49D0C
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown1, $00)     ;B49D10
    %AICMD0x12_Jump($B49D24)                                   ;B49D15
    %AICMD0x1C_ShowDialog($0281, $00)                          ;B49D18
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown1, $01)     ;B49D1C
    %AICMD0x12_Jump($B49D24)                                   ;B49D21
B49D24:
    %AICMD0x08_EnableAIControl()                               ;B49D24
    %AICMD0x1B($028D, $01)                                     ;B49D25
    %AICMD0x0D($01, $00, $30, $01)                             ;B49D29
    %AICMD0x1B($028C, $01)                                     ;B49D2E
    %AICMD0x11_EnableUserControl()                             ;B49D32
    %AICMD0x12_Jump($B49CE4)                                   ;B49D33
B49D36:
    %AICMD0x1A($0080, $00C8, $B38354, $02)                     ;B49D36
    %AICMD0x1F($B49D44)                                        ;B49D3E
    %AICMD0x12_Jump($B49D3E)                                   ;B49D41
B49D44:
    %AICMD0x1C_ShowDialog($027F, $00)                          ;B49D44
    %AICMD0x12_Jump($B49D3E)                                   ;B49D48
B49D4B:
    %AICMD0x1A($0108, $0060, $B38654, $00)                     ;B49D4B
    %AICMD0x13_Wait(1)                                         ;B49D53
    %AICMD0x12_Jump($B49D53)                                   ;B49D56
B49D59:
    %AICMD0x1A($0178, $0058, $B384B0, $00)                     ;B49D59
    %AICMD0x1F($B49D67)                                        ;B49D61
    %AICMD0x12_Jump($B49D61)                                   ;B49D64
B49D67:
    %AICMD0x1C_ShowDialog($01C1, $00)                          ;B49D67
    %AICMD0x12_Jump($B49D61)                                   ;B49D6B
B49D6E:
    %AICMD0x1A($0128, $0078, $B3830C, $00)                     ;B49D6E
    %AICMD0x1F($B49D7C)                                        ;B49D76
    %AICMD0x12_Jump($B49D76)                                   ;B49D79
B49D7C:
    %AICMD0x1C_ShowDialog($01B5, $00)                          ;B49D7C
    %AICMD0x12_Jump($B49D76)                                   ;B49D80
B49D83:
    %AICMD0x1A($0128, $0078, $B38324, $00)                     ;B49D83
    %AICMD0x1F($B49D91)                                        ;B49D8B
    %AICMD0x12_Jump($B49D8B)                                   ;B49D8E
B49D91:
    %AICMD0x1C_ShowDialog($01B6, $00)                          ;B49D91
    %AICMD0x12_Jump($B49D8B)                                   ;B49D95
B49D98:
    %AICMD0x1A($0128, $0078, $B38408, $00)                     ;B49D98
    %AICMD0x1F($B49DA6)                                        ;B49DA0
    %AICMD0x12_Jump($B49DA0)                                   ;B49DA3
B49DA6:
    %AICMD0x1C_ShowDialog($01B7, $00)                          ;B49DA6
    %AICMD0x12_Jump($B49DA0)                                   ;B49DAA
B49DAD:
    %AICMD0x1A($0128, $0078, $B3833C, $00)                     ;B49DAD
    %AICMD0x1F($B49DBB)                                        ;B49DB5
    %AICMD0x12_Jump($B49DB5)                                   ;B49DB8
B49DBB:
    %AICMD0x1C_ShowDialog($01B8, $00)                          ;B49DBB
    %AICMD0x12_Jump($B49DB5)                                   ;B49DBF
B49DC2:
    %AICMD0x1A($0128, $0078, $B382D0, $00)                     ;B49DC2
    %AICMD0x1F($B49DD0)                                        ;B49DCA
    %AICMD0x12_Jump($B49DCA)                                   ;B49DCD
B49DD0:
    %AICMD0x1C_ShowDialog($01B9, $00)                          ;B49DD0
    %AICMD0x12_Jump($B49DCA)                                   ;B49DD4


DATA8_B49DD7:
 
    %AICMD0x50()                                               ;B49DD7
    %AICMD0x08_EnableAIControl()                               ;B49DD8
    %AICMD0x05_SetTransferPosition(296, 104)                   ;B49DD9
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B49DDE
    %AICMD0x09($01, $B49E17)                                   ;B49DE0
    %AICMD0x09($02, $B49E25)                                   ;B49DE4
    %AICMD0x55(strcFlags.event6, $02, $B49DFD)                 ;B49DE8
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 0, 60, $B49DFD) ;B49DEF
    %AICMD0x09($05, $B49D59)                                   ;B49DF9
B49DFD:
    %AICMD0x38()                                               ;B49DFD
    %AICMD0x1C_ShowDialog($01BB, $00)                          ;B49DFE
    %AICMD0x01_UnfreezeTime()                                  ;B49E02
    %AICMD0x24_NextHourPalette($74)                            ;B49E03
    %AICMD0x13_Wait(180)                                       ;B49E05
    %AICMD0x1C_ShowDialog($01BC, $00)                          ;B49E08
    %AICMD0x28(strcFlags.event6, $04)                          ;B49E0C
    %AICMD0x47_SetValue8($800979, 3)                           ;B49E11
    %AICMD0x10_End()                                           ;B49E16
B49E17:
    %AICMD0x1A($0119, $0063, $B3845C, $02)                     ;B49E17
    %AICMD0x13_Wait(1)                                         ;B49E1F
    %AICMD0x12_Jump($B49E1F)                                   ;B49E22
B49E25:
    %AICMD0x1A($0108, $0060, $B38654, $00)                     ;B49E25
    %AICMD0x13_Wait(1)                                         ;B49E2D
    %AICMD0x12_Jump($B49E2D)                                   ;B49E30


pAIScripting0x20:
    dw DATA8_B49E53                                            ;B49E33|        |B49E53;
    dw pAIScripting0x21                                        ;B49E35|        |B49F15;
    dw pAIScripting0x21                                        ;B49E37|        |B49F15;
    dw pAIScripting0x21                                        ;B49E39|        |B49F15;
    dw pAIScripting0x21                                        ;B49E3B|        |B49F15;
    dw pAIScripting0x21                                        ;B49E3D|        |B49F15;
    dw pAIScripting0x21                                        ;B49E3F|        |B49F15;
    dw pAIScripting0x21                                        ;B49E41|        |B49F15;
    dw pAIScripting0x21                                        ;B49E43|        |B49F15;
    dw pAIScripting0x21                                        ;B49E45|        |B49F15;
    dw pAIScripting0x21                                        ;B49E47|        |B49F15;
    dw pAIScripting0x21                                        ;B49E49|        |B49F15;
    dw pAIScripting0x21                                        ;B49E4B|        |B49F15;
    dw pAIScripting0x21                                        ;B49E4D|        |B49F15;
    dw pAIScripting0x21                                        ;B49E4F|        |B49F15;
    dw pAIScripting0x21                                        ;B49E51|        |B49F15;
 
DATA8_B49E53:
 
    %AICMD0x50()                                               ;B49E53
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $09)       ;B49E54
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily3, $02)       ;B49E59
    %AICMD0x00_SetMusic($0C, $B4)                              ;B49E5E
    %AICMD0x01_UnfreezeTime()                                  ;B49E61
    %AICMD0x03_SetHour($0E)                                    ;B49E62
    %AICMD0x05_SetTransferPosition(440, 160)                   ;B49E64
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B49E69
    %AICMD0x08_EnableAIControl()                               ;B49E6B
    %AICMD0x09($01, $B49EC8)                                   ;B49E6C
    %AICMD0x09($02, $B49EE1)                                   ;B49E70
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 0, $B49E90)     ;B49E74
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 1, $B49E95)     ;B49E7B
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 2, $B49E9A)     ;B49E82
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, $B49E9F)     ;B49E89
B49E90:
    %AICMD0x06_SetDestinationArea(!AREA_TOWNSPRING)            ;B49E90
    %AICMD0x12_Jump($B49EA4)                                   ;B49E92
B49E95:
    %AICMD0x06_SetDestinationArea(!AREA_TOWNSUMMER)            ;B49E95
    %AICMD0x12_Jump($B49EA4)                                   ;B49E97
B49E9A:
    %AICMD0x06_SetDestinationArea(!AREA_TOWNFALL)              ;B49E9A
    %AICMD0x12_Jump($B49EA4)                                   ;B49E9C
B49E9F:
    %AICMD0x06_SetDestinationArea(!AREA_TOWNWINTER)            ;B49E9F
    %AICMD0x12_Jump($B49EA4)                                   ;B49EA1
B49EA4:
    %AICMD0x38()                                               ;B49EA4
    %AICMD0x0B($00)                                            ;B49EA5
    %AICMD0x0C($02)                                            ;B49EA7
    %AICMD0x19($0025, $00)                                     ;B49EA9
    %AICMD0x13_Wait(180)                                       ;B49EAD
    %AICMD0x01_UnfreezeTime()                                  ;B49EB0
    %AICMD0x24_NextHourPalette($74)                            ;B49EB1
    %AICMD0x13_Wait(180)                                       ;B49EB3
    %AICMD0x1C_ShowDialog($038A, $00)                          ;B49EB6
    %AICMD0x41_AddValue16(nPlayerHappiness, -100)              ;B49EBA
    %AICMD0x03_SetHour($0F)                                    ;B49EC0
    %AICMD0x47_SetValue8($800979, 3)                           ;B49EC2
    %AICMD0x10_End()                                           ;B49EC7
B49EC8:
    %AICMD0x1A($0198, $0098, $B38354, $02)                     ;B49EC8
    %AICMD0x0C($00)                                            ;B49ED0
    %AICMD0x13_Wait(120)                                       ;B49ED2
    %AICMD0x1C_ShowDialog($0315, $00)                          ;B49ED5
    %AICMD0x0B($01)                                            ;B49ED9
    %AICMD0x1F($B49ED0)                                        ;B49EDB
    %AICMD0x12_Jump($B49EDB)                                   ;B49EDE
B49EE1:
    %AICMD0x1A($01F8, $0090, $B3836C, $03)                     ;B49EE1
    %AICMD0x0C($01)                                            ;B49EE9
    %AICMD0x1B($02B0, $00)                                     ;B49EEB
    %AICMD0x0D($FF, $00, $30, $01)                             ;B49EEF
    %AICMD0x1B($02AB, $00)                                     ;B49EF4
    %AICMD0x13_Wait(120)                                       ;B49EF8
    %AICMD0x1C_ShowDialog($0316, $00)                          ;B49EFB
    %AICMD0x1B($02B0, $01)                                     ;B49EFF
    %AICMD0x0D($01, $00, $30, $01)                             ;B49F03
    %AICMD0x1B($02AC, $00)                                     ;B49F08
    %AICMD0x0D($00, $01, $90, $01)                             ;B49F0C
    %AICMD0x0B($02)                                            ;B49F11
    %AICMD0x37()                                               ;B49F13
    %AICMD0x10_End()                                           ;B49F14


pAIScripting0x21:
    dw DATA8_B49F35                                            ;B49F15|        |B49F35;
    dw pAIScripting0x22                                        ;B49F17|        |B49FDA;
    dw pAIScripting0x22                                        ;B49F19|        |B49FDA;
    dw pAIScripting0x22                                        ;B49F1B|        |B49FDA;
    dw pAIScripting0x22                                        ;B49F1D|        |B49FDA;
    dw pAIScripting0x22                                        ;B49F1F|        |B49FDA;
    dw pAIScripting0x22                                        ;B49F21|        |B49FDA;
    dw pAIScripting0x22                                        ;B49F23|        |B49FDA;
    dw pAIScripting0x22                                        ;B49F25|        |B49FDA;
    dw pAIScripting0x22                                        ;B49F27|        |B49FDA;
    dw pAIScripting0x22                                        ;B49F29|        |B49FDA;
    dw pAIScripting0x22                                        ;B49F2B|        |B49FDA;
    dw pAIScripting0x22                                        ;B49F2D|        |B49FDA;
    dw pAIScripting0x22                                        ;B49F2F|        |B49FDA;
    dw pAIScripting0x22                                        ;B49F31|        |B49FDA;
    dw pAIScripting0x22                                        ;B49F33|        |B49FDA;
 
DATA8_B49F35:
 
    %AICMD0x09($13, $B49FB5)                                   ;B49F35
    %AICMD0x10_End()                                           ;B49F39
    %AICMD0x1A($0108, $01A8, $B382C4, $03)                     ;B49F3A
    %AICMD0x1B($0281, $00)                                     ;B49F42
    %AICMD0x0D($FF, $00, $70, $01)                             ;B49F46
    %AICMD0x1B($0280, $00)                                     ;B49F4B
    %AICMD0x1D_ShowDialog($0330, $00)                          ;B49F4F
    %AICMD0x20_JumpIfChoice(0, $B49F61)                        ;B49F53
    %AICMD0x20_JumpIfChoice(1, $B49F70)                        ;B49F57
    %AICMD0x12_Jump($B49F5E)                                   ;B49F5B
B49F5E:
    %AICMD0x12_Jump($B49F5E)                                   ;B49F5E
B49F61:
    %AICMD0x1D_ShowDialog($0331, $00)                          ;B49F61
    %AICMD0x20_JumpIfChoice(0, $B49F7D)                        ;B49F65
    %AICMD0x20_JumpIfChoice(1, $B49F8A)                        ;B49F69
    %AICMD0x12_Jump($B49F5E)                                   ;B49F6D
B49F70:
    %AICMD0x1C_ShowDialog($0332, $00)                          ;B49F70
    %AICMD0x41_AddValue16(nPlayerHappiness, -10)               ;B49F74
    %AICMD0x12_Jump($B49F9F)                                   ;B49F7A
B49F7D:
    %AICMD0x1C_ShowDialog($0333, $00)                          ;B49F7D
    %AICMD0x41_AddValue16(nPlayerHappiness, 50)                ;B49F81
    %AICMD0x12_Jump($B49F91)                                   ;B49F87
B49F8A:
    %AICMD0x1C_ShowDialog($0334, $00)                          ;B49F8A
    %AICMD0x12_Jump($B49F9F)                                   ;B49F8E
B49F91:
    %AICMD0x0B($03)                                            ;B49F91
    %AICMD0x1B($0281, $01)                                     ;B49F93
    %AICMD0x0D($01, $00, $70, $01)                             ;B49F97
    %AICMD0x37()                                               ;B49F9C
    %AICMD0x11_EnableUserControl()                             ;B49F9D
    %AICMD0x10_End()                                           ;B49F9E
B49F9F:
    %AICMD0x0D($FF, $00, $30, $01)                             ;B49F9F
    %AICMD0x25($13)                                            ;B49FA4
    %AICMD0x13_Wait(10)                                        ;B49FA6
    %AICMD0x1B($0284, $00)                                     ;B49FA9
    %AICMD0x0D($01, $00, $A0, $01)                             ;B49FAD
    %AICMD0x37()                                               ;B49FB2
    %AICMD0x11_EnableUserControl()                             ;B49FB3
    %AICMD0x10_End()                                           ;B49FB4
B49FB5:
    %AICMD0x1A($0068, $01A8, $B38798, $00)                     ;B49FB5
    %AICMD0x1F($B49FC3)                                        ;B49FBD
    %AICMD0x12_Jump($B49FBD)                                   ;B49FC0
B49FC3:
    %AICMD0x08_EnableAIControl()                               ;B49FC3
    %AICMD0x23_OrWithIndexedValue(strcFlags.event4, $09)       ;B49FC4
    %AICMD0x09($09, $B49F3A)                                   ;B49FC9
    %AICMD0x0C($03)                                            ;B49FCD
    %AICMD0x1B($0303, $00)                                     ;B49FCF
    %AICMD0x0D($FF, $00, $3A, $01)                             ;B49FD3
    %AICMD0x37()                                               ;B49FD8
    %AICMD0x10_End()                                           ;B49FD9


pAIScripting0x22:
    dw DATA8_B49FFA                                            ;B49FDA|        |B49FFA;
    dw DATA8_B4A047                                            ;B49FDC|        |B4A047;
    dw DATA8_B4A093                                            ;B49FDE|        |B4A093;
    dw DATA8_B4A0B8                                            ;B49FE0|        |B4A0B8;
    dw DATA8_B4A0D4                                            ;B49FE2|        |B4A0D4;
    dw DATA8_B4A120                                            ;B49FE4|        |B4A120;
    dw DATA8_B4A143                                            ;B49FE6|        |B4A143;
    dw DATA8_B4A1BE                                            ;B49FE8|        |B4A1BE;
    dw DATA8_B4A1DA                                            ;B49FEA|        |B4A1DA;
    dw DATA8_B4A27A                                            ;B49FEC|        |B4A27A;
    dw DATA8_B4A299                                            ;B49FEE|        |B4A299;
    dw DATA8_B4A303                                            ;B49FF0|        |B4A303;
    dw DATA8_B4A323                                            ;B49FF2|        |B4A323;
    dw pAIScripting0x23                                        ;B49FF4|        |B4A381;
    dw pAIScripting0x23                                        ;B49FF6|        |B4A381;
    dw pAIScripting0x23                                        ;B49FF8|        |B4A381;
 
DATA8_B49FFA:
 
    %AICMD0x50()                                               ;B49FFA
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B49FFB
    %AICMD0x08_EnableAIControl()                               ;B49FFD
    %AICMD0x09($01, $B4A014)                                   ;B49FFE
    %AICMD0x38()                                               ;B4A002
    %AICMD0x0B($00)                                            ;B4A003
    %AICMD0x13_Wait(150)                                       ;B4A005
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4A008
    %AICMD0x0C($01)                                            ;B4A00A
    %AICMD0x11_EnableUserControl()                             ;B4A00C
    %AICMD0x41_AddValue16(nPlayerHappiness, -50)               ;B4A00D
    %AICMD0x10_End()                                           ;B4A013
B4A014:
    %AICMD0x1A($00A8, $0078, $B3845C, $03)                     ;B4A014
    %AICMD0x0C($00)                                            ;B4A01C
    %AICMD0x13_Wait(90)                                        ;B4A01E
    %AICMD0x1C_ShowDialog($019A, $00)                          ;B4A021
    %AICMD0x1B($02E3, $00)                                     ;B4A025
    %AICMD0x0D($00, $01, $50, $01)                             ;B4A029
    %AICMD0x1B($02E7, $00)                                     ;B4A02E
    %AICMD0x0D($FF, $00, $28, $01)                             ;B4A032
    %AICMD0x1B($02E3, $00)                                     ;B4A037
    %AICMD0x0D($00, $01, $30, $01)                             ;B4A03B
    %AICMD0x13_Wait(60)                                        ;B4A040
    %AICMD0x0B($01)                                            ;B4A043
    %AICMD0x37()                                               ;B4A045
    %AICMD0x10_End()                                           ;B4A046


DATA8_B4A047:
 
    %AICMD0x50()                                               ;B4A047
    %AICMD0x05_SetTransferPosition(136, 120)                   ;B4A048
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4A04D
    %AICMD0x08_EnableAIControl()                               ;B4A04F
    %AICMD0x09($01, $B4A060)                                   ;B4A050
    %AICMD0x38()                                               ;B4A054
    %AICMD0x0B($00)                                            ;B4A055
    %AICMD0x13_Wait(150)                                       ;B4A057
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4A05A
    %AICMD0x0C($01)                                            ;B4A05C
    %AICMD0x11_EnableUserControl()                             ;B4A05E
    %AICMD0x10_End()                                           ;B4A05F
B4A060:
    %AICMD0x1A($00A8, $0078, $B3845C, $03)                     ;B4A060
    %AICMD0x0C($00)                                            ;B4A068
    %AICMD0x13_Wait(90)                                        ;B4A06A
    %AICMD0x1C_ShowDialog($019A, $00)                          ;B4A06D
    %AICMD0x1B($02E3, $00)                                     ;B4A071
    %AICMD0x0D($00, $01, $50, $01)                             ;B4A075
    %AICMD0x1B($02E7, $00)                                     ;B4A07A
    %AICMD0x0D($FF, $00, $28, $01)                             ;B4A07E
    %AICMD0x1B($02E3, $00)                                     ;B4A083
    %AICMD0x0D($00, $01, $30, $01)                             ;B4A087
    %AICMD0x13_Wait(60)                                        ;B4A08C
    %AICMD0x0B($01)                                            ;B4A08F
    %AICMD0x37()                                               ;B4A091
    %AICMD0x10_End()                                           ;B4A092


DATA8_B4A093:
 
    %AICMD0x50()                                               ;B4A093
    %AICMD0x14_JumpIfFlagSet(strcFlags.event4, $00, $B4A0B8)   ;B4A094
    %AICMD0x14_JumpIfFlagSet(strcFlags.event4, $01, $B4A0D4)   ;B4A09B
    %AICMD0x14_JumpIfFlagSet(strcFlags.event4, $02, $B4A120)   ;B4A0A2
    %AICMD0x14_JumpIfFlagSet(strcFlags.event4, $03, $B4A143)   ;B4A0A9
    %AICMD0x14_JumpIfFlagSet(strcFlags.event4, $04, $B4A1BE)   ;B4A0B0
    %AICMD0x10_End()                                           ;B4A0B7


DATA8_B4A0B8:
 
B4A0B8:
    %AICMD0x50()                                               ;B4A0B8
    %AICMD0x09($01, $B4A0BF)                                   ;B4A0B9
    %AICMD0x38()                                               ;B4A0BD
    %AICMD0x10_End()                                           ;B4A0BE
B4A0BF:
    %AICMD0x1A($0158, $0058, $B383D8, $00)                     ;B4A0BF
    %AICMD0x1F($B4A0CD)                                        ;B4A0C7
    %AICMD0x12_Jump($B4A0C7)                                   ;B4A0CA
B4A0CD:
    %AICMD0x1C_ShowDialog($01D8, $00)                          ;B4A0CD
    %AICMD0x12_Jump($B4A0C7)                                   ;B4A0D1


DATA8_B4A0D4:
 
B4A0D4:
    %AICMD0x50()                                               ;B4A0D4
    %AICMD0x08_EnableAIControl()                               ;B4A0D5
    %AICMD0x09($01, $B4A0EE)                                   ;B4A0D6
    %AICMD0x38()                                               ;B4A0DA
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 16)                  ;B4A0DB
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 20)                  ;B4A0DF
    %AICMD0x0B($00)                                            ;B4A0E3
    %AICMD0x0C($01)                                            ;B4A0E5
    %AICMD0x28(strcFlags.event6, $01)                          ;B4A0E7
    %AICMD0x3C()                                               ;B4A0EC
    %AICMD0x10_End()                                           ;B4A0ED
B4A0EE:
    %AICMD0x1A($0058, $0168, $B3845C, $03)                     ;B4A0EE
    %AICMD0x0C($00)                                            ;B4A0F6
    %AICMD0x13_Wait(60)                                        ;B4A0F8
    %AICMD0x1B($02E7, $01)                                     ;B4A0FB
    %AICMD0x0D($01, $00, $20, $01)                             ;B4A0FF
    %AICMD0x1C_ShowDialog($019B, $00)                          ;B4A104
    %AICMD0x41_AddValue16(nLove_Maria, 100)                    ;B4A108
    %AICMD0x1B($02F0, $01)                                     ;B4A10E
    %AICMD0x13_Wait(60)                                        ;B4A112
    %AICMD0x0B($01)                                            ;B4A115
    %AICMD0x12_Jump($B4A11A)                                   ;B4A117
B4A11A:
    %AICMD0x13_Wait(1)                                         ;B4A11A
    %AICMD0x12_Jump($B4A11A)                                   ;B4A11D


DATA8_B4A120:
 
B4A120:
    %AICMD0x50()                                               ;B4A120
    %AICMD0x09($01, $B4A127)                                   ;B4A121
    %AICMD0x38()                                               ;B4A125
    %AICMD0x10_End()                                           ;B4A126
B4A127:
    %AICMD0x1A($0028, $0164, $B38324, $00)                     ;B4A127
    %AICMD0x22($01, $01, $01, $B38324, $01)                    ;B4A12F
    %AICMD0x1F($B4A13C)                                        ;B4A136
    %AICMD0x12_Jump($B4A136)                                   ;B4A139
B4A13C:
    %AICMD0x1C_ShowDialog($01DF, $00)                          ;B4A13C
    %AICMD0x12_Jump($B4A136)                                   ;B4A140


DATA8_B4A143:
 
B4A143:
    %AICMD0x50()                                               ;B4A143
    %AICMD0x08_EnableAIControl()                               ;B4A144
    %AICMD0x09($01, $B4A17A)                                   ;B4A145
    %AICMD0x38()                                               ;B4A149
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 32)                 ;B4A14A
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 48)                    ;B4A14E
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4A152
    %AICMD0x0B($00)                                            ;B4A154
    %AICMD0x0C($01)                                            ;B4A156
    %AICMD0x13_Wait(90)                                        ;B4A158
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 16)                  ;B4A15B
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 32)                 ;B4A15F
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 16)                    ;B4A163
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 32)                  ;B4A167
    %AICMD0x0B($02)                                            ;B4A16B
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 64)                  ;B4A16D
    %AICMD0x0C($03)                                            ;B4A171
    %AICMD0x28(strcFlags.event6, $01)                          ;B4A173
    %AICMD0x3C()                                               ;B4A178
    %AICMD0x10_End()                                           ;B4A179
B4A17A:
    %AICMD0x1A($0098, $0088, $B3845C, $01)                     ;B4A17A
    %AICMD0x0C($00)                                            ;B4A182
    %AICMD0x13_Wait(30)                                        ;B4A184
    %AICMD0x1B($02E7, $01)                                     ;B4A187
    %AICMD0x0B($01)                                            ;B4A18B
    %AICMD0x0C($02)                                            ;B4A18D
    %AICMD0x13_Wait(30)                                        ;B4A18F
    %AICMD0x1B($02E7, $00)                                     ;B4A192
    %AICMD0x13_Wait(30)                                        ;B4A196
    %AICMD0x1C_ShowDialog($019C, $00)                          ;B4A199
    %AICMD0x41_AddValue16(nLove_Ann, 100)                      ;B4A19D
    %AICMD0x1B($02E7, $01)                                     ;B4A1A3
    %AICMD0x0D($01, $00, $04, $01)                             ;B4A1A7
    %AICMD0x1B($02F0, $01)                                     ;B4A1AC
    %AICMD0x13_Wait(60)                                        ;B4A1B0
    %AICMD0x0B($03)                                            ;B4A1B3
    %AICMD0x12_Jump($B4A1B8)                                   ;B4A1B5
B4A1B8:
    %AICMD0x13_Wait(1)                                         ;B4A1B8
    %AICMD0x12_Jump($B4A1B8)                                   ;B4A1BB


DATA8_B4A1BE:
 
B4A1BE:
    %AICMD0x50()                                               ;B4A1BE
    %AICMD0x09($01, $B4A1C5)                                   ;B4A1BF
    %AICMD0x38()                                               ;B4A1C3
    %AICMD0x10_End()                                           ;B4A1C4
B4A1C5:
    %AICMD0x1A($0028, $0168, $B383FC, $00)                     ;B4A1C5
    %AICMD0x1F($B4A1D3)                                        ;B4A1CD
    %AICMD0x12_Jump($B4A1CD)                                   ;B4A1D0
B4A1D3:
    %AICMD0x1C_ShowDialog($01E9, $00)                          ;B4A1D3
    %AICMD0x12_Jump($B4A1CD)                                   ;B4A1D7


DATA8_B4A1DA:
 
    %AICMD0x50()                                               ;B4A1DA
    %AICMD0x08_EnableAIControl()                               ;B4A1DB
    %AICMD0x09($01, $B4A219)                                   ;B4A1DC
    %AICMD0x38()                                               ;B4A1E0
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 32)                    ;B4A1E1
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4A1E5
    %AICMD0x0B($00)                                            ;B4A1E7
    %AICMD0x0C($01)                                            ;B4A1E9
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 16)                 ;B4A1EB
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 32)                    ;B4A1EF
    %AICMD0x0B($02)                                            ;B4A1F3
    %AICMD0x0C($03)                                            ;B4A1F5
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 16)                    ;B4A1F7
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 16)                 ;B4A1FB
    %AICMD0x0B($04)                                            ;B4A1FF
    %AICMD0x0C($05)                                            ;B4A201
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4A203
    %AICMD0x0C($06)                                            ;B4A205
    %AICMD0x19($0024, $00)                                     ;B4A207
    %AICMD0x13_Wait(60)                                        ;B4A20B
    %AICMD0x1C_ShowDialog($019D, $00)                          ;B4A20E
    %AICMD0x28(strcFlags.event6, $01)                          ;B4A212
    %AICMD0x3C()                                               ;B4A217
    %AICMD0x10_End()                                           ;B4A218
B4A219:
    %AICMD0x1A($0078, $0088, $B3845C, $01)                     ;B4A219
    %AICMD0x0C($00)                                            ;B4A221
    %AICMD0x13_Wait(30)                                        ;B4A223
    %AICMD0x1B($02E5, $00)                                     ;B4A226
    %AICMD0x0D($00, $FF, $20, $01)                             ;B4A22A
    %AICMD0x0B($01)                                            ;B4A22F
    %AICMD0x0C($02)                                            ;B4A231
    %AICMD0x13_Wait(30)                                        ;B4A233
    %AICMD0x1B($02E7, $01)                                     ;B4A236
    %AICMD0x0D($01, $00, $20, $01)                             ;B4A23A
    %AICMD0x0B($03)                                            ;B4A23F
    %AICMD0x0C($04)                                            ;B4A241
    %AICMD0x13_Wait(30)                                        ;B4A243
    %AICMD0x1B($02E3, $00)                                     ;B4A246
    %AICMD0x0D($00, $01, $40, $01)                             ;B4A24A
    %AICMD0x0B($05)                                            ;B4A24F
    %AICMD0x13_Wait(60)                                        ;B4A251
    %AICMD0x1B($02E7, $00)                                     ;B4A254
    %AICMD0x0D($FF, $00, $10, $01)                             ;B4A258
    %AICMD0x1B($02E5, $00)                                     ;B4A25D
    %AICMD0x13_Wait(60)                                        ;B4A261
    %AICMD0x0D($00, $FE, $1A, $01)                             ;B4A264
    %AICMD0x0B($06)                                            ;B4A269
    %AICMD0x41_AddValue16(nLove_Nina, 100)                     ;B4A26B
    %AICMD0x12_Jump($B4A274)                                   ;B4A271
B4A274:
    %AICMD0x13_Wait(1)                                         ;B4A274
    %AICMD0x12_Jump($B4A274)                                   ;B4A277


DATA8_B4A27A:
 
    %AICMD0x50()                                               ;B4A27A
    %AICMD0x09($01, $B4A281)                                   ;B4A27B
    %AICMD0x38()                                               ;B4A27F
    %AICMD0x10_End()                                           ;B4A280
B4A281:
    %AICMD0x1A($0028, $0198, $B38330, $00)                     ;B4A281
    %AICMD0x12_Jump($B4A28C)                                   ;B4A289
B4A28C:
    %AICMD0x1F($B4A292)                                        ;B4A28C
    %AICMD0x12_Jump($B4A28C)                                   ;B4A28F
B4A292:
    %AICMD0x1C_ShowDialog($01B1, $00)                          ;B4A292
    %AICMD0x12_Jump($B4A28C)                                   ;B4A296


DATA8_B4A299:
 
    %AICMD0x50()                                               ;B4A299
    %AICMD0x08_EnableAIControl()                               ;B4A29A
    %AICMD0x09($01, $B4A2C7)                                   ;B4A29B
    %AICMD0x38()                                               ;B4A29F
    %AICMD0x13_Wait(90)                                        ;B4A2A0
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 16)                    ;B4A2A3
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 16)                  ;B4A2A7
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B4A2AB
    %AICMD0x0B($00)                                            ;B4A2AD
    %AICMD0x0C($01)                                            ;B4A2AF
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 96)                    ;B4A2B1
    %AICMD0x0B($02)                                            ;B4A2B5
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 32)                    ;B4A2B7
    %AICMD0x0C($03)                                            ;B4A2BB
    %AICMD0x13_Wait(60)                                        ;B4A2BD
    %AICMD0x28(strcFlags.event6, $01)                          ;B4A2C0
    %AICMD0x3C()                                               ;B4A2C5
    %AICMD0x10_End()                                           ;B4A2C6
B4A2C7:
    %AICMD0x1A($0058, $0088, $B3845C, $00)                     ;B4A2C7
    %AICMD0x0C($00)                                            ;B4A2CF
    %AICMD0x1B($02E5, $00)                                     ;B4A2D1
    %AICMD0x0D($00, $FF, $30, $01)                             ;B4A2D5
    %AICMD0x1B($02E4, $00)                                     ;B4A2DA
    %AICMD0x0B($01)                                            ;B4A2DE
    %AICMD0x0C($02)                                            ;B4A2E0
    %AICMD0x13_Wait(10)                                        ;B4A2E2
    %AICMD0x1C_ShowDialog($019E, $00)                          ;B4A2E5
    %AICMD0x41_AddValue16(nLove_Ellen, 100)                    ;B4A2E9
    %AICMD0x1B($02E3, $00)                                     ;B4A2EF
    %AICMD0x0D($00, $01, $08, $02)                             ;B4A2F3
    %AICMD0x0B($03)                                            ;B4A2F8
    %AICMD0x12_Jump($B4A2FD)                                   ;B4A2FA
B4A2FD:
    %AICMD0x13_Wait(1)                                         ;B4A2FD
    %AICMD0x12_Jump($B4A2FD)                                   ;B4A300


DATA8_B4A303:
 
    %AICMD0x50()                                               ;B4A303
    %AICMD0x09($01, $B4A30A)                                   ;B4A304
    %AICMD0x38()                                               ;B4A308
    %AICMD0x10_End()                                           ;B4A309
B4A30A:
    %AICMD0x1A($0028, $0198, $B382DC, $00)                     ;B4A30A
    %AICMD0x1F($B4A318)                                        ;B4A312
    %AICMD0x12_Jump($B4A312)                                   ;B4A315
B4A318:
    %AICMD0x1C_ShowDialog($01EA, $00)                          ;B4A318
    %AICMD0x1B($0285, $00)                                     ;B4A31C
    %AICMD0x12_Jump($B4A312)                                   ;B4A320


DATA8_B4A323:
 
    %AICMD0x50()                                               ;B4A323
    %AICMD0x08_EnableAIControl()                               ;B4A324
    %AICMD0x09($01, $B4A34A)                                   ;B4A325
    %AICMD0x38()                                               ;B4A329
    %AICMD0x13_Wait(90)                                        ;B4A32A
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 24)                    ;B4A32D
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 68)                  ;B4A331
    %AICMD0x40_DisableTileInteractions()                       ;B4A335
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 94)                    ;B4A336
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4A33A
    %AICMD0x0B($00)                                            ;B4A33C
    %AICMD0x0C($01)                                            ;B4A33E
    %AICMD0x13_Wait(90)                                        ;B4A340
    %AICMD0x28(strcFlags.event6, $01)                          ;B4A343
    %AICMD0x3C()                                               ;B4A348
    %AICMD0x10_End()                                           ;B4A349
B4A34A:
    %AICMD0x1A($0020, $004E, $B3845C, $03)                     ;B4A34A
    %AICMD0x0C($00)                                            ;B4A352
    %AICMD0x13_Wait(30)                                        ;B4A354
    %AICMD0x1B($02E7, $01)                                     ;B4A357
    %AICMD0x0D($01, $00, $18, $01)                             ;B4A35B
    %AICMD0x1C_ShowDialog($019F, $00)                          ;B4A360
    %AICMD0x41_AddValue16(nLove_Eve, 100)                      ;B4A364
    %AICMD0x13_Wait(10)                                        ;B4A36A
    %AICMD0x0D($02, $00, $01, $01)                             ;B4A36D
    %AICMD0x1B($02F0, $01)                                     ;B4A372
    %AICMD0x0B($01)                                            ;B4A376
    %AICMD0x12_Jump($B4A37B)                                   ;B4A378
B4A37B:
    %AICMD0x13_Wait(1)                                         ;B4A37B
    %AICMD0x12_Jump($B4A37B)                                   ;B4A37E


pAIScripting0x23:
    dw DATA8_B4A3A1                                            ;B4A381|        |B4A3A1;
    dw pAIScripting0x24                                        ;B4A383|        |B4A457;
    dw pAIScripting0x24                                        ;B4A385|        |B4A457;
    dw pAIScripting0x24                                        ;B4A387|        |B4A457;
    dw pAIScripting0x24                                        ;B4A389|        |B4A457;
    dw pAIScripting0x24                                        ;B4A38B|        |B4A457;
    dw pAIScripting0x24                                        ;B4A38D|        |B4A457;
    dw pAIScripting0x24                                        ;B4A38F|        |B4A457;
    dw pAIScripting0x24                                        ;B4A391|        |B4A457;
    dw pAIScripting0x24                                        ;B4A393|        |B4A457;
    dw pAIScripting0x24                                        ;B4A395|        |B4A457;
    dw pAIScripting0x24                                        ;B4A397|        |B4A457;
    dw pAIScripting0x24                                        ;B4A399|        |B4A457;
    dw pAIScripting0x24                                        ;B4A39B|        |B4A457;
    dw pAIScripting0x24                                        ;B4A39D|        |B4A457;
    dw pAIScripting0x24                                        ;B4A39F|        |B4A457;
 
DATA8_B4A3A1:
 
    %AICMD0x09($0C, $B4A3B9)                                   ;B4A3A1
    %AICMD0x09($0D, $B4A3F3)                                   ;B4A3A5
    %AICMD0x09($0E, $B4A42B)                                   ;B4A3A9
    %AICMD0x08_EnableAIControl()                               ;B4A3AD
    %AICMD0x38()                                               ;B4A3AE
    %AICMD0x2C($23, $0007, $003C)                              ;B4A3AF
    %AICMD0x0C($00)                                            ;B4A3B5
    %AICMD0x11_EnableUserControl()                             ;B4A3B7
    %AICMD0x10_End()                                           ;B4A3B8
B4A3B9:
    %AICMD0x1A($0098, $0178, $B38570, $03)                     ;B4A3B9
    %AICMD0x13_Wait(40)                                        ;B4A3C1
    %AICMD0x1B($0328, $01)                                     ;B4A3C4
    %AICMD0x0D($FF, $FF, $01, $01)                             ;B4A3C8
    %AICMD0x13_Wait(60)                                        ;B4A3CD
    %AICMD0x1B($0328, $01)                                     ;B4A3D0
    %AICMD0x0D($01, $00, $01, $01)                             ;B4A3D4
    %AICMD0x13_Wait(30)                                        ;B4A3D9
    %AICMD0x1B($0329, $01)                                     ;B4A3DC
    %AICMD0x0D($03, $FF, $40, $03)                             ;B4A3E0
    %AICMD0x0D($02, $FF, $40, $02)                             ;B4A3E5
    %AICMD0x0B($00)                                            ;B4A3EA
    %AICMD0x0D($01, $FF, $20, $01)                             ;B4A3EC
    %AICMD0x37()                                               ;B4A3F1
    %AICMD0x10_End()                                           ;B4A3F2
B4A3F3:
    %AICMD0x1A($0068, $0178, $B38570, $00)                     ;B4A3F3
    %AICMD0x13_Wait(48)                                        ;B4A3FB
    %AICMD0x1B($0328, $01)                                     ;B4A3FE
    %AICMD0x0D($FF, $FF, $01, $01)                             ;B4A402
    %AICMD0x0D($FF, $01, $01, $01)                             ;B4A407
    %AICMD0x13_Wait(60)                                        ;B4A40C
    %AICMD0x1B($0329, $00)                                     ;B4A40F
    %AICMD0x0D($FF, $00, $10, $01)                             ;B4A413
    %AICMD0x0D($FF, $FF, $20, $01)                             ;B4A418
    %AICMD0x0B($00)                                            ;B4A41D
    %AICMD0x0D($00, $00, $04, $01)                             ;B4A41F
    %AICMD0x0D($FE, $FF, $40, $01)                             ;B4A424
    %AICMD0x37()                                               ;B4A429
    %AICMD0x10_End()                                           ;B4A42A
B4A42B:
    %AICMD0x1A($0078, $0180, $B38570, $02)                     ;B4A42B
    %AICMD0x13_Wait(70)                                        ;B4A433
    %AICMD0x1B($0327, $00)                                     ;B4A436
    %AICMD0x13_Wait(38)                                        ;B4A43A
    %AICMD0x1B($032A, $00)                                     ;B4A43D
    %AICMD0x0D($00, $01, $10, $01)                             ;B4A441
    %AICMD0x0D($FF, $03, $40, $03)                             ;B4A446
    %AICMD0x0D($FF, $02, $40, $02)                             ;B4A44B
    %AICMD0x0D($FF, $01, $58, $01)                             ;B4A450
    %AICMD0x37()                                               ;B4A455
    %AICMD0x10_End()                                           ;B4A456


pAIScripting0x24:
    dw DATA8_B4A477                                            ;B4A457|        |B4A477;
    dw DATA8_B4A533                                            ;B4A459|        |B4A533;
    dw DATA8_B4A55F                                            ;B4A45B|        |B4A55F;
    dw DATA8_B4A58B                                            ;B4A45D|        |B4A58B;
    dw pAIScripting0x25                                        ;B4A45F|        |B4A5B7;
    dw pAIScripting0x25                                        ;B4A461|        |B4A5B7;
    dw pAIScripting0x25                                        ;B4A463|        |B4A5B7;
    dw pAIScripting0x25                                        ;B4A465|        |B4A5B7;
    dw pAIScripting0x25                                        ;B4A467|        |B4A5B7;
    dw pAIScripting0x25                                        ;B4A469|        |B4A5B7;
    dw pAIScripting0x25                                        ;B4A46B|        |B4A5B7;
    dw pAIScripting0x25                                        ;B4A46D|        |B4A5B7;
    dw pAIScripting0x25                                        ;B4A46F|        |B4A5B7;
    dw pAIScripting0x25                                        ;B4A471|        |B4A5B7;
    dw pAIScripting0x25                                        ;B4A473|        |B4A5B7;
    dw pAIScripting0x25                                        ;B4A475|        |B4A5B7;
 
DATA8_B4A477:
 
    %AICMD0x08_EnableAIControl()                               ;B4A477
    %AICMD0x1A($FFF8, $01A8, $B382AC, $02)                     ;B4A478
    %AICMD0x38()                                               ;B4A480
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 40)                   ;B4A481
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4A485
    %AICMD0x1B($027B, $01)                                     ;B4A487
    %AICMD0x0D($01, $00, $80, $01)                             ;B4A48B
    %AICMD0x13_Wait(30)                                        ;B4A490
    %AICMD0x15_JumpIfEquals8($800992, 6, $B4A4C0)              ;B4A493
    %AICMD0x15_JumpIfEquals8($800992, 7, $B4A4C7)              ;B4A49A
    %AICMD0x15_JumpIfEquals8($800992, 8, $B4A4CE)              ;B4A4A1
    %AICMD0x15_JumpIfEquals8($800992, 9, $B4A4D5)              ;B4A4A8
    %AICMD0x15_JumpIfEquals8($800992, 10, $B4A4DC)             ;B4A4AF
    %AICMD0x15_JumpIfEquals8($800992, 11, $B4A4E3)             ;B4A4B6
    %AICMD0x12_Jump($B4A4EA)                                   ;B4A4BD
B4A4C0:
    %AICMD0x1C_ShowDialog($0272, $00)                          ;B4A4C0
    %AICMD0x12_Jump($B4A4EA)                                   ;B4A4C4
B4A4C7:
    %AICMD0x1C_ShowDialog($0240, $00)                          ;B4A4C7
    %AICMD0x12_Jump($B4A4EA)                                   ;B4A4CB
B4A4CE:
    %AICMD0x1C_ShowDialog($028E, $00)                          ;B4A4CE
    %AICMD0x12_Jump($B4A4F9)                                   ;B4A4D2
B4A4D5:
    %AICMD0x1C_ShowDialog($026E, $00)                          ;B4A4D5
    %AICMD0x12_Jump($B4A4EA)                                   ;B4A4D9
B4A4DC:
    %AICMD0x1C_ShowDialog($0289, $00)                          ;B4A4DC
    %AICMD0x12_Jump($B4A4EA)                                   ;B4A4E0
B4A4E3:
    %AICMD0x1C_ShowDialog($0274, $00)                          ;B4A4E3
    %AICMD0x12_Jump($B4A4EA)                                   ;B4A4E7
B4A4EA:
    %AICMD0x13_Wait(30)                                        ;B4A4EA
    %AICMD0x1B($027B, $00)                                     ;B4A4ED
    %AICMD0x0D($FF, $00, $80, $01)                             ;B4A4F1
    %AICMD0x37()                                               ;B4A4F6
    %AICMD0x11_EnableUserControl()                             ;B4A4F7
    %AICMD0x10_End()                                           ;B4A4F8
B4A4F9:
    %AICMD0x09($02, $B4A50E)                                   ;B4A4F9
    %AICMD0x13_Wait(30)                                        ;B4A4FD
    %AICMD0x0C($02)                                            ;B4A500
    %AICMD0x1B($027B, $00)                                     ;B4A502
    %AICMD0x0D($FF, $00, $80, $01)                             ;B4A506
    %AICMD0x37()                                               ;B4A50B
    %AICMD0x11_EnableUserControl()                             ;B4A50C
    %AICMD0x10_End()                                           ;B4A50D
B4A50E:
    %AICMD0x1A($FFF8, $01A8, $B3827C, $02)                     ;B4A50E
    %AICMD0x1B($026E, $01)                                     ;B4A516
    %AICMD0x0D($01, $00, $70, $01)                             ;B4A51A
    %AICMD0x13_Wait(30)                                        ;B4A51F
    %AICMD0x1C_ShowDialog($028F, $00)                          ;B4A522
    %AICMD0x0B($02)                                            ;B4A526
    %AICMD0x1B($026E, $00)                                     ;B4A528
    %AICMD0x0D($FF, $00, $80, $01)                             ;B4A52C
    %AICMD0x37()                                               ;B4A531
    %AICMD0x10_End()                                           ;B4A532


DATA8_B4A533:
 
    %AICMD0x08_EnableAIControl()                               ;B4A533
    %AICMD0x1A($FFF8, $01A8, $B38318, $02)                     ;B4A534
    %AICMD0x38()                                               ;B4A53C
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 40)                   ;B4A53D
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4A541
    %AICMD0x1B($029B, $01)                                     ;B4A543
    %AICMD0x0D($01, $00, $80, $01)                             ;B4A547
    %AICMD0x13_Wait(30)                                        ;B4A54C
    %AICMD0x1C_ShowDialog($047F, $00)                          ;B4A54F
    %AICMD0x1B($029B, $00)                                     ;B4A553
    %AICMD0x0D($FF, $00, $80, $01)                             ;B4A557
    %AICMD0x37()                                               ;B4A55C
    %AICMD0x11_EnableUserControl()                             ;B4A55D
    %AICMD0x10_End()                                           ;B4A55E


DATA8_B4A55F:
 
    %AICMD0x08_EnableAIControl()                               ;B4A55F
    %AICMD0x1A($FFF8, $01A8, $B38240, $02)                     ;B4A560
    %AICMD0x38()                                               ;B4A568
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 40)                   ;B4A569
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4A56D
    %AICMD0x1B($025F, $01)                                     ;B4A56F
    %AICMD0x0D($01, $00, $80, $01)                             ;B4A573
    %AICMD0x13_Wait(30)                                        ;B4A578
    %AICMD0x1C_ShowDialog($0486, $00)                          ;B4A57B
    %AICMD0x1B($025F, $00)                                     ;B4A57F
    %AICMD0x0D($FF, $00, $80, $01)                             ;B4A583
    %AICMD0x37()                                               ;B4A588
    %AICMD0x11_EnableUserControl()                             ;B4A589
    %AICMD0x10_End()                                           ;B4A58A


DATA8_B4A58B:
 
    %AICMD0x08_EnableAIControl()                               ;B4A58B
    %AICMD0x1A($FFF8, $01A8, $B38240, $02)                     ;B4A58C
    %AICMD0x38()                                               ;B4A594
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 40)                   ;B4A595
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4A599
    %AICMD0x1B($025F, $01)                                     ;B4A59B
    %AICMD0x0D($01, $00, $80, $01)                             ;B4A59F
    %AICMD0x13_Wait(30)                                        ;B4A5A4
    %AICMD0x1C_ShowDialog($0142, $00)                          ;B4A5A7
    %AICMD0x1B($025F, $00)                                     ;B4A5AB
    %AICMD0x0D($FF, $00, $80, $01)                             ;B4A5AF
    %AICMD0x37()                                               ;B4A5B4
    %AICMD0x11_EnableUserControl()                             ;B4A5B5
    %AICMD0x10_End()                                           ;B4A5B6


pAIScripting0x25:
    dw DATA8_B4A5D7                                            ;B4A5B7|        |B4A5D7;
    dw pAIScripting0x26                                        ;B4A5B9|        |B4A60F;
    dw pAIScripting0x26                                        ;B4A5BB|        |B4A60F;
    dw pAIScripting0x26                                        ;B4A5BD|        |B4A60F;
    dw pAIScripting0x26                                        ;B4A5BF|        |B4A60F;
    dw pAIScripting0x26                                        ;B4A5C1|        |B4A60F;
    dw pAIScripting0x26                                        ;B4A5C3|        |B4A60F;
    dw pAIScripting0x26                                        ;B4A5C5|        |B4A60F;
    dw pAIScripting0x26                                        ;B4A5C7|        |B4A60F;
    dw pAIScripting0x26                                        ;B4A5C9|        |B4A60F;
    dw pAIScripting0x26                                        ;B4A5CB|        |B4A60F;
    dw pAIScripting0x26                                        ;B4A5CD|        |B4A60F;
    dw pAIScripting0x26                                        ;B4A5CF|        |B4A60F;
    dw pAIScripting0x26                                        ;B4A5D1|        |B4A60F;
    dw pAIScripting0x26                                        ;B4A5D3|        |B4A60F;
    dw pAIScripting0x26                                        ;B4A5D5|        |B4A60F;
 
DATA8_B4A5D7:
 
    %AICMD0x02_FreezeTime()                                    ;B4A5D7
    %AICMD0x05_SetTransferPosition(136, 344)                   ;B4A5D8
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4A5DD
    %AICMD0x08_EnableAIControl()                               ;B4A5DF
    %AICMD0x09($01, $B4A5EB)                                   ;B4A5E0
    %AICMD0x38()                                               ;B4A5E4
    %AICMD0x0B($00)                                            ;B4A5E5
    %AICMD0x0C($01)                                            ;B4A5E7
    %AICMD0x11_EnableUserControl()                             ;B4A5E9
    %AICMD0x10_End()                                           ;B4A5EA
B4A5EB:
    %AICMD0x1A($0068, $01A8, $B38318, $02)                     ;B4A5EB
    %AICMD0x0C($00)                                            ;B4A5F3
    %AICMD0x1C_ShowDialog($0300, $00)                          ;B4A5F5
    %AICMD0x1B($0297, $00)                                     ;B4A5F9
    %AICMD0x0D($00, $01, $60, $01)                             ;B4A5FD
    %AICMD0x1B($029B, $01)                                     ;B4A602
    %AICMD0x0D($FF, $00, $70, $01)                             ;B4A606
    %AICMD0x0B($01)                                            ;B4A60B
    %AICMD0x37()                                               ;B4A60D
    %AICMD0x10_End()                                           ;B4A60E


pAIScripting0x26:
    dw DATA8_B4A62F                                            ;B4A60F|        |B4A62F;
    dw DATA8_B4B490                                            ;B4A611|        |B4B490;
    dw pAIScripting0x27                                        ;B4A613|        |B4B660;
    dw pAIScripting0x27                                        ;B4A615|        |B4B660;
    dw pAIScripting0x27                                        ;B4A617|        |B4B660;
    dw pAIScripting0x27                                        ;B4A619|        |B4B660;
    dw pAIScripting0x27                                        ;B4A61B|        |B4B660;
    dw pAIScripting0x27                                        ;B4A61D|        |B4B660;
    dw pAIScripting0x27                                        ;B4A61F|        |B4B660;
    dw pAIScripting0x27                                        ;B4A621|        |B4B660;
    dw pAIScripting0x27                                        ;B4A623|        |B4B660;
    dw pAIScripting0x27                                        ;B4A625|        |B4B660;
    dw pAIScripting0x27                                        ;B4A627|        |B4B660;
    dw pAIScripting0x27                                        ;B4A629|        |B4B660;
    dw pAIScripting0x27                                        ;B4A62B|        |B4B660;
    dw pAIScripting0x27                                        ;B4A62D|        |B4B660;
 
DATA8_B4A62F:
 
    %AICMD0x4F()                                               ;B4A62F
    %AICMD0x51()                                               ;B4A630
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $09)       ;B4A631
    %AICMD0x00_SetMusic($03, $B4)                              ;B4A636
    %AICMD0x02_FreezeTime()                                    ;B4A639
    %AICMD0x03_SetHour($07)                                    ;B4A63A
    %AICMD0x08_EnableAIControl()                               ;B4A63C
    %AICMD0x05_SetTransferPosition(264, 312)                   ;B4A63D
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B4A642
    %AICMD0x32(strcFlags.unknown1, $FFDF)                      ;B4A644
    %AICMD0x09($01, $B4A964)                                   ;B4A64A
    %AICMD0x09($03, $B4A9DB)                                   ;B4A64E
    %AICMD0x09($06, $B4AA83)                                   ;B4A652
    %AICMD0x09($07, $B4AAB4)                                   ;B4A656
    %AICMD0x09($0B, $B4AB63)                                   ;B4A65A
    %AICMD0x09($0D, $B4AB99)                                   ;B4A65E
    %AICMD0x09($0E, $B4AC3F)                                   ;B4A662
    %AICMD0x09($0F, $B4AD65)                                   ;B4A666
    %AICMD0x09($10, $B4AE68)                                   ;B4A66A
    %AICMD0x09($11, $B4AF81)                                   ;B4A66E
    %AICMD0x09($12, $B4A760)                                   ;B4A672
    %AICMD0x09($13, $B4A995)                                   ;B4A676
    %AICMD0x06_SetDestinationArea(!AREA_DANCINGS2)             ;B4A67A
    %AICMD0x38()                                               ;B4A67C
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 64)                    ;B4A67D
    %AICMD0x15_JumpIfEquals8($800923, 0, $B4A6A3)              ;B4A681
    %AICMD0x1C_ShowDialog($0241, $00)                          ;B4A688
    %AICMD0x40_DisableTileInteractions()                       ;B4A68C
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 16)                    ;B4A68D
    %AICMD0x3F_ThrowCarriedItem()                              ;B4A691
    %AICMD0x13_Wait(60)                                        ;B4A692
    %AICMD0x1C_ShowDialog($0243, $00)                          ;B4A695
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 16)                  ;B4A699
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B4A69D
    %AICMD0x4E()                                               ;B4A69F
    %AICMD0x12_Jump($B4A6B0)                                   ;B4A6A0
B4A6A3:
    %AICMD0x1C_ShowDialog($0242, $00)                          ;B4A6A3
    %AICMD0x1C_ShowDialog($0243, $00)                          ;B4A6A7
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown2, $00)     ;B4A6AB
B4A6B0:
    %AICMD0x13_Wait(120)                                       ;B4A6B0
    %AICMD0x0B($00)                                            ;B4A6B3
    %AICMD0x0C($01)                                            ;B4A6B5
    %AICMD0x09($14, $B4A7B2)                                   ;B4A6B7
    %AICMD0x19($0012, $00)                                     ;B4A6BB
    %AICMD0x13_Wait(20)                                        ;B4A6BF
    %AICMD0x13_Wait(120)                                       ;B4A6C2
    %AICMD0x11_EnableUserControl()                             ;B4A6C5
    %AICMD0x0C($02)                                            ;B4A6C6
    %AICMD0x3D_TeleportToArea(!AREA_DANCINGS2)                 ;B4A6C8
    %AICMD0x10_End()                                           ;B4A6CA
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $00, $B4A72F)   ;B4A6CB
    %AICMD0x09($07, $B4B286)                                   ;B4A6D2
    %AICMD0x41_AddValue16(nLove_Maria, 30)                     ;B4A6D6
    %AICMD0x12_Jump($B4B4E8)                                   ;B4A6DC
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $01, $B4A738)   ;B4A6DF
    %AICMD0x09($07, $B4B2DD)                                   ;B4A6E6
    %AICMD0x41_AddValue16(nLove_Ann, 30)                       ;B4A6EA
    %AICMD0x12_Jump($B4B4E8)                                   ;B4A6F0
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, $B4A741)   ;B4A6F3
    %AICMD0x09($07, $B4B334)                                   ;B4A6FA
    %AICMD0x41_AddValue16(nLove_Nina, 30)                      ;B4A6FE
    %AICMD0x12_Jump($B4B4E8)                                   ;B4A704
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $03, $B4A74A)   ;B4A707
    %AICMD0x09($07, $B4B38B)                                   ;B4A70E
    %AICMD0x41_AddValue16(nLove_Ellen, 30)                     ;B4A712
    %AICMD0x12_Jump($B4B4E8)                                   ;B4A718
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $04, $B4A753)   ;B4A71B
    %AICMD0x09($07, $B4B3E2)                                   ;B4A722
    %AICMD0x41_AddValue16(nLove_Eve, 30)                       ;B4A726
    %AICMD0x12_Jump($B4B4E8)                                   ;B4A72C
B4A72F:
    %AICMD0x41_AddValue16(nLove_Maria, 30)                     ;B4A72F
    %AICMD0x12_Jump($B4A759)                                   ;B4A735
B4A738:
    %AICMD0x41_AddValue16(nLove_Ann, 30)                       ;B4A738
    %AICMD0x12_Jump($B4A759)                                   ;B4A73E
B4A741:
    %AICMD0x41_AddValue16(nLove_Nina, 30)                      ;B4A741
    %AICMD0x12_Jump($B4A759)                                   ;B4A747
B4A74A:
    %AICMD0x41_AddValue16(nLove_Ellen, 30)                     ;B4A74A
    %AICMD0x12_Jump($B4A759)                                   ;B4A750
B4A753:
    %AICMD0x41_AddValue16(nLove_Eve, 30)                       ;B4A753
B4A759:
    %AICMD0x09($07, $B4B439)                                   ;B4A759
    %AICMD0x12_Jump($B4B4E8)                                   ;B4A75D
B4A760:
    %AICMD0x1A($0108, $00B8, $B38AB0, $00)                     ;B4A760
    %AICMD0x0C($00)                                            ;B4A768
    %AICMD0x1B($02A2, $01)                                     ;B4A76A
    %AICMD0x0D($01, $00, $30, $01)                             ;B4A76E
    %AICMD0x1B($029E, $01)                                     ;B4A773
    %AICMD0x0D($00, $01, $40, $01)                             ;B4A777
    %AICMD0x1B($02A2, $00)                                     ;B4A77C
    %AICMD0x0D($FF, $00, $10, $01)                             ;B4A780
    %AICMD0x1B($02A1, $00)                                     ;B4A785
    %AICMD0x2A($0045)                                          ;B4A789
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4A78C
    %AICMD0x1C_ShowDialog($0244, $00)                          ;B4A78E
    %AICMD0x0B($01)                                            ;B4A792
    %AICMD0x2F($B38330)                                        ;B4A794
    %AICMD0x1F($B4A79D)                                        ;B4A797
    %AICMD0x12_Jump($B4A797)                                   ;B4A79A
B4A79D:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $05, $B4A7AB) ;B4A79D
    %AICMD0x1C_ShowDialog($0286, $00)                          ;B4A7A4
    %AICMD0x12_Jump($B4A797)                                   ;B4A7A8
B4A7AB:
    %AICMD0x1C_ShowDialog($028C, $00)                          ;B4A7AB
    %AICMD0x12_Jump($B4A797)                                   ;B4A7AF
B4A7B2:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown2, $00, $B4A828) ;B4A7B2
    %AICMD0x15_JumpIfEquals8($800924, 21, $B4A815)             ;B4A7B9
    %AICMD0x15_JumpIfEquals8($800924, 22, $B4A815)             ;B4A7C0
    %AICMD0x15_JumpIfEquals8($800924, 23, $B4A815)             ;B4A7C7
    %AICMD0x15_JumpIfEquals8($800924, 1, $B4A815)              ;B4A7CE
    %AICMD0x15_JumpIfEquals8($800924, 2, $B4A80A)              ;B4A7D5
    %AICMD0x15_JumpIfEquals8($800924, 20, $B4A815)             ;B4A7DC
    %AICMD0x15_JumpIfEquals8($800924, 7, $B4A842)              ;B4A7E3
    %AICMD0x15_JumpIfEquals8($800924, 5, $B4A842)              ;B4A7EA
    %AICMD0x15_JumpIfEquals8($800924, 24, $B4A815)             ;B4A7F1
    %AICMD0x16_JumpIfBetween8($800924, 9, 12, $B4A80A)         ;B4A7F8
    %AICMD0x15_JumpIfEquals8($800924, 26, $B4A80A)             ;B4A800
    %AICMD0x12_Jump($B4A80A)                                   ;B4A807
B4A80A:
    %AICMD0x17($02)                                            ;B4A80A
    %AICMD0x18($00, $B4A8E0)                                   ;B4A80C
    %AICMD0x18($01, $B4A8FA)                                   ;B4A810
    %AICMD0x10_End()                                           ;B4A814
B4A815:
    %AICMD0x17($04)                                            ;B4A815
    %AICMD0x18($00, $B4A878)                                   ;B4A817
    %AICMD0x18($01, $B4A892)                                   ;B4A81B
    %AICMD0x18($02, $B4A8AC)                                   ;B4A81F
    %AICMD0x18($03, $B4A8C6)                                   ;B4A823
    %AICMD0x10_End()                                           ;B4A827
B4A828:
    %AICMD0x1A($0118, $00F8, $B38ABC, $00)                     ;B4A828
    %AICMD0x13_Wait(16)                                        ;B4A830
    %AICMD0x0D($F8, $F8, $01, $01)                             ;B4A833
    %AICMD0x13_Wait(4)                                         ;B4A838
    %AICMD0x19($0034, $00)                                     ;B4A83B
    %AICMD0x12_Jump($B4A92E)                                   ;B4A83F
B4A842:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $0F, $B4A914)   ;B4A842
    %AICMD0x1A($0118, $00F8, $B38720, $00)                     ;B4A849
    %AICMD0x13_Wait(16)                                        ;B4A851
    %AICMD0x0D($F8, $F8, $01, $01)                             ;B4A854
    %AICMD0x13_Wait(4)                                         ;B4A859
    %AICMD0x19($003B, $00)                                     ;B4A85C
    %AICMD0x21_AddValue8(nPowerBerryEaten, 1)                  ;B4A860
    %AICMD0x21_AddValue8($80091D, 10)                          ;B4A865
    %AICMD0x41_AddValue16(nPlayerHappiness, 10)                ;B4A86A
    %AICMD0x23_OrWithIndexedValue(strcFlags.event5, $0F)       ;B4A870
    %AICMD0x12_Jump($B4A92E)                                   ;B4A875
    %AICMD0x1A($0118, $00F8, $B38AC8, $00)                     ;B4A878
    %AICMD0x13_Wait(16)                                        ;B4A880
    %AICMD0x0D($F8, $F8, $01, $01)                             ;B4A883
    %AICMD0x13_Wait(4)                                         ;B4A888
    %AICMD0x19($00F7, $00)                                     ;B4A88B
    %AICMD0x12_Jump($B4A92E)                                   ;B4A88F
    %AICMD0x1A($0118, $00F8, $B38AD4, $00)                     ;B4A892
    %AICMD0x13_Wait(16)                                        ;B4A89A
    %AICMD0x0D($F8, $F8, $01, $01)                             ;B4A89D
    %AICMD0x13_Wait(4)                                         ;B4A8A2
    %AICMD0x19($00F6, $00)                                     ;B4A8A5
    %AICMD0x12_Jump($B4A92E)                                   ;B4A8A9
    %AICMD0x1A($0118, $00F8, $B38AE0, $00)                     ;B4A8AC
    %AICMD0x13_Wait(16)                                        ;B4A8B4
    %AICMD0x0D($F8, $F8, $01, $01)                             ;B4A8B7
    %AICMD0x13_Wait(4)                                         ;B4A8BC
    %AICMD0x19($00F9, $00)                                     ;B4A8BF
    %AICMD0x12_Jump($B4A92E)                                   ;B4A8C3
    %AICMD0x1A($0118, $00F8, $B38A98, $00)                     ;B4A8C6
    %AICMD0x13_Wait(16)                                        ;B4A8CE
    %AICMD0x0D($F8, $F8, $01, $01)                             ;B4A8D1
    %AICMD0x13_Wait(4)                                         ;B4A8D6
    %AICMD0x19($00F8, $00)                                     ;B4A8D9
    %AICMD0x12_Jump($B4A92E)                                   ;B4A8DD
    %AICMD0x1A($0118, $00F8, $B38504, $00)                     ;B4A8E0
    %AICMD0x13_Wait(16)                                        ;B4A8E8
    %AICMD0x0D($F8, $F8, $01, $01)                             ;B4A8EB
    %AICMD0x13_Wait(4)                                         ;B4A8F0
    %AICMD0x19($00FD, $00)                                     ;B4A8F3
    %AICMD0x12_Jump($B4A92E)                                   ;B4A8F7
    %AICMD0x1A($0118, $00F8, $B384F8, $00)                     ;B4A8FA
    %AICMD0x13_Wait(16)                                        ;B4A902
    %AICMD0x0D($F8, $F8, $01, $01)                             ;B4A905
    %AICMD0x13_Wait(4)                                         ;B4A90A
    %AICMD0x19($00FC, $00)                                     ;B4A90D
    %AICMD0x12_Jump($B4A92E)                                   ;B4A911
B4A914:
    %AICMD0x1A($0118, $00F8, $B38750, $00)                     ;B4A914
    %AICMD0x13_Wait(16)                                        ;B4A91C
    %AICMD0x0D($F8, $F8, $01, $01)                             ;B4A91F
    %AICMD0x13_Wait(4)                                         ;B4A924
    %AICMD0x19($003A, $00)                                     ;B4A927
    %AICMD0x12_Jump($B4A92E)                                   ;B4A92B
B4A92E:
    %AICMD0x37()                                               ;B4A92E
    %AICMD0x10_End()                                           ;B4A92F
    %AICMD0x1A($0148, $00A0, $B384F8, $00)                     ;B4A930
    %AICMD0x13_Wait(1)                                         ;B4A938
    %AICMD0x37()                                               ;B4A93B
    %AICMD0x10_End()                                           ;B4A93C
    %AICMD0x1A($0148, $00A8, $B38510, $00)                     ;B4A93D
    %AICMD0x13_Wait(1)                                         ;B4A945
    %AICMD0x37()                                               ;B4A948
    %AICMD0x10_End()                                           ;B4A949
    %AICMD0x1A($0148, $00A8, $B38A74, $00)                     ;B4A94A
    %AICMD0x13_Wait(1)                                         ;B4A952
    %AICMD0x37()                                               ;B4A955
    %AICMD0x10_End()                                           ;B4A956
    %AICMD0x1A($0108, $0098, $B38A44, $00)                     ;B4A957
    %AICMD0x13_Wait(1)                                         ;B4A95F
    %AICMD0x37()                                               ;B4A962
    %AICMD0x10_End()                                           ;B4A963
B4A964:
    %AICMD0x1A($0198, $00C8, $B383FC, $00)                     ;B4A964
    %AICMD0x1F($B4A972)                                        ;B4A96C
    %AICMD0x12_Jump($B4A96C)                                   ;B4A96F
B4A972:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, $B4A987)   ;B4A972
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $05, $B4A98E) ;B4A979
    %AICMD0x1C_ShowDialog($0247, $00)                          ;B4A980
    %AICMD0x12_Jump($B4A96C)                                   ;B4A984
B4A987:
    %AICMD0x1C_ShowDialog($0492, $00)                          ;B4A987
    %AICMD0x12_Jump($B4A96C)                                   ;B4A98B
B4A98E:
    %AICMD0x1C_ShowDialog($0284, $00)                          ;B4A98E
    %AICMD0x12_Jump($B4A96C)                                   ;B4A992
B4A995:
    %AICMD0x1A($00B8, $0108, $B38348, $00)                     ;B4A995
    %AICMD0x1F($B4A9A3)                                        ;B4A99D
    %AICMD0x12_Jump($B4A99D)                                   ;B4A9A0
B4A9A3:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $05, $B4A9B1) ;B4A9A3
    %AICMD0x1C_ShowDialog($0248, $00)                          ;B4A9AA
    %AICMD0x12_Jump($B4A99D)                                   ;B4A9AE
B4A9B1:
    %AICMD0x1C_ShowDialog($0285, $00)                          ;B4A9B1
    %AICMD0x12_Jump($B4A99D)                                   ;B4A9B5
    %AICMD0x1A($00B8, $0108, $B3836C, $03)                     ;B4A9B8
    %AICMD0x1F($B4A9C6)                                        ;B4A9C0
    %AICMD0x12_Jump($B4A9C0)                                   ;B4A9C3
B4A9C6:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $05, $B4A9D4) ;B4A9C6
    %AICMD0x1C_ShowDialog($0248, $00)                          ;B4A9CD
    %AICMD0x12_Jump($B4A9C0)                                   ;B4A9D1
B4A9D4:
    %AICMD0x1C_ShowDialog($0288, $00)                          ;B4A9D4
    %AICMD0x12_Jump($B4A9C0)                                   ;B4A9D8
B4A9DB:
    %AICMD0x1A($0078, $00F8, $B383D8, $02)                     ;B4A9DB
    %AICMD0x1F($B4A9EF)                                        ;B4A9E3
    %AICMD0x12_Jump($B4A9E3)                                   ;B4A9E6
    %AICMD0x1F($B4AA28)                                        ;B4A9E9
    %AICMD0x12_Jump($B4A9E9)                                   ;B4A9EC
B4A9EF:
    %AICMD0x1C_ShowDialog($0245, $00)                          ;B4A9EF
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $00, $B4A9E3) ;B4A9F3
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $01, $B4A9E3) ;B4A9FA
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $02, $B4A9E3) ;B4AA01
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $03, $B4A9E3) ;B4AA08
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $04, $B4A9E3) ;B4AA0F
    %AICMD0x08_EnableAIControl()                               ;B4AA16
    %AICMD0x1B($02C7, $00)                                     ;B4AA17
    %AICMD0x0D($00, $FF, $30, $01)                             ;B4AA1B
    %AICMD0x1B($02C4, $00)                                     ;B4AA20
    %AICMD0x11_EnableUserControl()                             ;B4AA24
    %AICMD0x12_Jump($B4A9E9)                                   ;B4AA25
B4AA28:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $05, $B4AA36) ;B4AA28
    %AICMD0x1C_ShowDialog($0245, $00)                          ;B4AA2F
    %AICMD0x12_Jump($B4A9E9)                                   ;B4AA33
B4AA36:
    %AICMD0x1C_ShowDialog($0282, $00)                          ;B4AA36
    %AICMD0x12_Jump($B4A9E9)                                   ;B4AA3A
    %AICMD0x1A($0158, $00C8, $B38318, $00)                     ;B4AA3D
    %AICMD0x1F($B4AA4B)                                        ;B4AA45
    %AICMD0x12_Jump($B4AA45)                                   ;B4AA48
B4AA4B:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $05, $B4AA59) ;B4AA4B
    %AICMD0x1C_ShowDialog($0246, $00)                          ;B4AA52
    %AICMD0x12_Jump($B4AA45)                                   ;B4AA56
B4AA59:
    %AICMD0x1C_ShowDialog($0283, $00)                          ;B4AA59
    %AICMD0x12_Jump($B4AA45)                                   ;B4AA5D
    %AICMD0x1A($0098, $00A8, $B38354, $00)                     ;B4AA60
    %AICMD0x1F($B4AA6E)                                        ;B4AA68
    %AICMD0x12_Jump($B4AA68)                                   ;B4AA6B
B4AA6E:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $05, $B4AA7C) ;B4AA6E
    %AICMD0x1C_ShowDialog($024C, $00)                          ;B4AA75
    %AICMD0x12_Jump($B4AA68)                                   ;B4AA79
B4AA7C:
    %AICMD0x1C_ShowDialog($028A, $00)                          ;B4AA7C
    %AICMD0x12_Jump($B4AA68)                                   ;B4AA80
B4AA83:
    %AICMD0x1A($0168, $0108, $B38420, $01)                     ;B4AA83
    %AICMD0x1F($B4AA91)                                        ;B4AA8B
    %AICMD0x12_Jump($B4AA8B)                                   ;B4AA8E
B4AA91:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $05, $B4AA9F) ;B4AA91
    %AICMD0x1C_ShowDialog($0249, $00)                          ;B4AA98
    %AICMD0x12_Jump($B4AA8B)                                   ;B4AA9C
B4AA9F:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $00, $B4AAAD)   ;B4AA9F
    %AICMD0x1C_ShowDialog($0288, $00)                          ;B4AAA6
    %AICMD0x12_Jump($B4AA8B)                                   ;B4AAAA
B4AAAD:
    %AICMD0x1C_ShowDialog($0250, $00)                          ;B4AAAD
    %AICMD0x12_Jump($B4AA8B)                                   ;B4AAB1
B4AAB4:
    %AICMD0x1A($0148, $0158, $B38384, $01)                     ;B4AAB4
    %AICMD0x1F($B4AAC2)                                        ;B4AABC
    %AICMD0x12_Jump($B4AABC)                                   ;B4AABF
B4AAC2:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $05, $B4AAD0) ;B4AAC2
    %AICMD0x1C_ShowDialog($024F, $00)                          ;B4AAC9
    %AICMD0x12_Jump($B4AABC)                                   ;B4AACD
B4AAD0:
    %AICMD0x1C_ShowDialog($0287, $00)                          ;B4AAD0
    %AICMD0x12_Jump($B4AABC)                                   ;B4AAD4
    %AICMD0x1A($00A8, $0148, $B382E8, $03)                     ;B4AAD7
    %AICMD0x1F($B4AAE5)                                        ;B4AADF
    %AICMD0x12_Jump($B4AADF)                                   ;B4AAE2
B4AAE5:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $05, $B4AAF3) ;B4AAE5
    %AICMD0x1C_ShowDialog($024E, $00)                          ;B4AAEC
    %AICMD0x12_Jump($B4AADF)                                   ;B4AAF0
B4AAF3:
    %AICMD0x1C_ShowDialog($028C, $00)                          ;B4AAF3
    %AICMD0x12_Jump($B4AADF)                                   ;B4AAF7
    %AICMD0x1A($0128, $0148, $B38294, $01)                     ;B4AAFA
    %AICMD0x1F($B4AB08)                                        ;B4AB02
    %AICMD0x12_Jump($B4AB02)                                   ;B4AB05
B4AB08:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $05, $B4AB16) ;B4AB08
    %AICMD0x1C_ShowDialog($024A, $00)                          ;B4AB0F
    %AICMD0x12_Jump($B4AB02)                                   ;B4AB13
B4AB16:
    %AICMD0x1C_ShowDialog($0288, $00)                          ;B4AB16
    %AICMD0x12_Jump($B4AB02)                                   ;B4AB1A
    %AICMD0x1A($0108, $0158, $B382AC, $01)                     ;B4AB1D
    %AICMD0x1F($B4AB2B)                                        ;B4AB25
    %AICMD0x12_Jump($B4AB25)                                   ;B4AB28
B4AB2B:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $05, $B4AB39) ;B4AB2B
    %AICMD0x1C_ShowDialog($024B, $00)                          ;B4AB32
    %AICMD0x12_Jump($B4AB25)                                   ;B4AB36
B4AB39:
    %AICMD0x1C_ShowDialog($0289, $00)                          ;B4AB39
    %AICMD0x12_Jump($B4AB25)                                   ;B4AB3D
    %AICMD0x1A($0088, $0158, $B3827C, $02)                     ;B4AB40
    %AICMD0x1F($B4AB4E)                                        ;B4AB48
    %AICMD0x12_Jump($B4AB48)                                   ;B4AB4B
B4AB4E:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $05, $B4AB5C) ;B4AB4E
    %AICMD0x1C_ShowDialog($024D, $00)                          ;B4AB55
    %AICMD0x12_Jump($B4AB48)                                   ;B4AB59
B4AB5C:
    %AICMD0x1C_ShowDialog($028B, $00)                          ;B4AB5C
    %AICMD0x12_Jump($B4AB48)                                   ;B4AB60
B4AB63:
    %AICMD0x1A($0058, $00E8, $B38300, $02)                     ;B4AB63
    %AICMD0x1F($B4AB77)                                        ;B4AB6B
    %AICMD0x12_Jump($B4AB6B)                                   ;B4AB6E
    %AICMD0x1F($B4AB86)                                        ;B4AB71
    %AICMD0x12_Jump($B4AB71)                                   ;B4AB74
B4AB77:
    %AICMD0x1D_ShowDialog($0234, $00)                          ;B4AB77
    %AICMD0x20_JumpIfChoice(0, $B4AB86)                        ;B4AB7B
    %AICMD0x20_JumpIfChoice(1, $B4AB92)                        ;B4AB7F
    %AICMD0x12_Jump($B4AB6B)                                   ;B4AB83
B4AB86:
    %AICMD0x1C_ShowDialog($0235, $00)                          ;B4AB86
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown1, $05)     ;B4AB8A
    %AICMD0x12_Jump($B4AB71)                                   ;B4AB8F
B4AB92:
    %AICMD0x1C_ShowDialog($0236, $00)                          ;B4AB92
    %AICMD0x12_Jump($B4AB6B)                                   ;B4AB96
B4AB99:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $00, $B4ABAB)   ;B4AB99
    %AICMD0x1A($00C8, $0158, $B38168, $02)                     ;B4ABA0
    %AICMD0x12_Jump($B4ABBA)                                   ;B4ABA8
B4ABAB:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event6, $04, $B4AC39)   ;B4ABAB
    %AICMD0x1A($00C8, $0158, $B3845C, $02)                     ;B4ABB2
B4ABBA:
    %AICMD0x1F($B4ABC6)                                        ;B4ABBA
    %AICMD0x12_Jump($B4ABBA)                                   ;B4ABBD
    %AICMD0x1F($B4AC2B)                                        ;B4ABC0
    %AICMD0x12_Jump($B4ABC0)                                   ;B4ABC3
B4ABC6:
    %AICMD0x28(strcFlags.unknown1, $00)                        ;B4ABC6
    %AICMD0x15_JumpIfEquals8(nCurrentYearID, 0, $B4ABE6)       ;B4ABCB
    %AICMD0x15_JumpIfEquals8(nCurrentYearID, 1, $B4AC0F)       ;B4ABD2
    %AICMD0x12_Jump($B4ABBA)                                   ;B4ABD9
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown1, $00)     ;B4ABDC
    %AICMD0x0B($02)                                            ;B4ABE1
    %AICMD0x12_Jump($B4ABBA)                                   ;B4ABE3
B4ABE6:
    %AICMD0x1D_ShowDialog($0252, $00)                          ;B4ABE6
    %AICMD0x20_JumpIfChoice(0, $B4ABF5)                        ;B4ABEA
    %AICMD0x20_JumpIfChoice(1, $B4AC02)                        ;B4ABEE
    %AICMD0x12_Jump($B4ABC0)                                   ;B4ABF2
B4ABF5:
    %AICMD0x1C_ShowDialog($0253, $00)                          ;B4ABF5
    %AICMD0x41_AddValue16(nLove_Maria, 8)                      ;B4ABF9
    %AICMD0x12_Jump($B4ABC0)                                   ;B4ABFF
B4AC02:
    %AICMD0x1C_ShowDialog($0254, $00)                          ;B4AC02
    %AICMD0x41_AddValue16(nLove_Maria, 2)                      ;B4AC06
    %AICMD0x12_Jump($B4ABC0)                                   ;B4AC0C
B4AC0F:
    %AICMD0x1C_ShowDialog($025D, $00)                          ;B4AC0F
    %AICMD0x12_Jump($B4ABC0)                                   ;B4AC13
    %AICMD0x1C_ShowDialog($026A, $00)                          ;B4AC16
    %AICMD0x12_Jump($B4ABC0)                                   ;B4AC1A
    %AICMD0x1C_ShowDialog($0272, $00)                          ;B4AC1D
    %AICMD0x12_Jump($B4ABC0)                                   ;B4AC21
    %AICMD0x1C_ShowDialog($027A, $00)                          ;B4AC24
    %AICMD0x12_Jump($B4ABC0)                                   ;B4AC28
B4AC2B:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $05, $B4ABDC) ;B4AC2B
    %AICMD0x1C_ShowDialog($027A, $00)                          ;B4AC32
    %AICMD0x12_Jump($B4ABC0)                                   ;B4AC36
B4AC39:
    %AICMD0x28(strcFlags.unknown1, $00)                        ;B4AC39
    %AICMD0x10_End()                                           ;B4AC3E
B4AC3F:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $01, $B4AC51)   ;B4AC3F
    %AICMD0x1A($0098, $0058, $B38198, $00)                     ;B4AC46
    %AICMD0x12_Jump($B4AC60)                                   ;B4AC4E
B4AC51:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event6, $04, $B4AD5F)   ;B4AC51
    %AICMD0x1A($0098, $0058, $B3845C, $00)                     ;B4AC58
B4AC60:
    %AICMD0x1F($B4AC6C)                                        ;B4AC60
    %AICMD0x12_Jump($B4AC60)                                   ;B4AC63
    %AICMD0x1F($B4AD51)                                        ;B4AC66
    %AICMD0x12_Jump($B4AC66)                                   ;B4AC69
B4AC6C:
    %AICMD0x28(strcFlags.unknown1, $01)                        ;B4AC6C
    %AICMD0x15_JumpIfEquals8(nCurrentYearID, 0, $B4AC8C)       ;B4AC71
    %AICMD0x15_JumpIfEquals8(nCurrentYearID, 1, $B4AD16)       ;B4AC78
    %AICMD0x12_Jump($B4AC60)                                   ;B4AC7F
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown1, $01)     ;B4AC82
    %AICMD0x0B($02)                                            ;B4AC87
    %AICMD0x12_Jump($B4AC60)                                   ;B4AC89
B4AC8C:
    %AICMD0x1D_ShowDialog($025E, $00)                          ;B4AC8C
    %AICMD0x20_JumpIfChoice(0, $B4AC9B)                        ;B4AC90
    %AICMD0x20_JumpIfChoice(1, $B4ACB1)                        ;B4AC94
    %AICMD0x12_Jump($B4AC66)                                   ;B4AC98
B4AC9B:
    %AICMD0x08_EnableAIControl()                               ;B4AC9B
    %AICMD0x19($00E9, $00)                                     ;B4AC9C
    %AICMD0x13_Wait(120)                                       ;B4ACA0
    %AICMD0x11_EnableUserControl()                             ;B4ACA3
    %AICMD0x1C_ShowDialog($025F, $00)                          ;B4ACA4
    %AICMD0x41_AddValue16(nLove_Ann, 8)                        ;B4ACA8
    %AICMD0x12_Jump($B4AC66)                                   ;B4ACAE
B4ACB1:
    %AICMD0x1C_ShowDialog($0260, $00)                          ;B4ACB1
    %AICMD0x1B($0345, $00)                                     ;B4ACB5
    %AICMD0x1B($0346, $00)                                     ;B4ACB9
    %AICMD0x13_Wait(40)                                        ;B4ACBD
    %AICMD0x1C_ShowDialog($0261, $00)                          ;B4ACC0
    %AICMD0x1B($0226, $00)                                     ;B4ACC4
    %AICMD0x41_AddValue16(nLove_Ann, 2)                        ;B4ACC8
    %AICMD0x12_Jump($B4AC66)                                   ;B4ACCE
    %AICMD0x1D_ShowDialog($026B, $00)                          ;B4ACD1
    %AICMD0x20_JumpIfChoice(0, $B4ACE0)                        ;B4ACD5
    %AICMD0x20_JumpIfChoice(1, $B4ACF6)                        ;B4ACD9
    %AICMD0x12_Jump($B4AC66)                                   ;B4ACDD
B4ACE0:
    %AICMD0x08_EnableAIControl()                               ;B4ACE0
    %AICMD0x19($00E9, $00)                                     ;B4ACE1
    %AICMD0x13_Wait(120)                                       ;B4ACE5
    %AICMD0x11_EnableUserControl()                             ;B4ACE8
    %AICMD0x1C_ShowDialog($025F, $00)                          ;B4ACE9
    %AICMD0x41_AddValue16(nLove_Ann, 8)                        ;B4ACED
    %AICMD0x12_Jump($B4AC66)                                   ;B4ACF3
B4ACF6:
    %AICMD0x1C_ShowDialog($0260, $00)                          ;B4ACF6
    %AICMD0x1B($0345, $00)                                     ;B4ACFA
    %AICMD0x1B($0346, $00)                                     ;B4ACFE
    %AICMD0x13_Wait(40)                                        ;B4AD02
    %AICMD0x1C_ShowDialog($026C, $00)                          ;B4AD05
    %AICMD0x1B($0226, $00)                                     ;B4AD09
    %AICMD0x41_AddValue16(nLove_Ann, 2)                        ;B4AD0D
    %AICMD0x12_Jump($B4AC66)                                   ;B4AD13
B4AD16:
    %AICMD0x1C_ShowDialog($027B, $00)                          ;B4AD16
    %AICMD0x20_JumpIfChoice(0, $B4AD25)                        ;B4AD1A
    %AICMD0x20_JumpIfChoice(1, $B4AD3B)                        ;B4AD1E
    %AICMD0x12_Jump($B4AC66)                                   ;B4AD22
B4AD25:
    %AICMD0x08_EnableAIControl()                               ;B4AD25
    %AICMD0x19($00E9, $00)                                     ;B4AD26
    %AICMD0x13_Wait(120)                                       ;B4AD2A
    %AICMD0x11_EnableUserControl()                             ;B4AD2D
    %AICMD0x1C_ShowDialog($025F, $00)                          ;B4AD2E
    %AICMD0x41_AddValue16(nLove_Ann, 8)                        ;B4AD32
    %AICMD0x12_Jump($B4AC66)                                   ;B4AD38
B4AD3B:
    %AICMD0x1B($0345, $00)                                     ;B4AD3B
    %AICMD0x1B($0346, $00)                                     ;B4AD3F
    %AICMD0x13_Wait(60)                                        ;B4AD43
    %AICMD0x1C_ShowDialog($026C, $00)                          ;B4AD46
    %AICMD0x1B($0226, $00)                                     ;B4AD4A
    %AICMD0x12_Jump($B4AC66)                                   ;B4AD4E
B4AD51:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $05, $B4AC82) ;B4AD51
    %AICMD0x1C_ShowDialog($0255, $00)                          ;B4AD58
    %AICMD0x12_Jump($B4AC66)                                   ;B4AD5C
B4AD5F:
    %AICMD0x28(strcFlags.unknown1, $01)                        ;B4AD5F
    %AICMD0x10_End()                                           ;B4AD64
B4AD65:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, $B4AD77)   ;B4AD65
    %AICMD0x1A($0148, $00A8, $B381C8, $00)                     ;B4AD6C
    %AICMD0x12_Jump($B4AD86)                                   ;B4AD74
B4AD77:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event6, $04, $B4AE62)   ;B4AD77
    %AICMD0x1A($0148, $00A8, $B3845C, $00)                     ;B4AD7E
B4AD86:
    %AICMD0x1F($B4AD92)                                        ;B4AD86
    %AICMD0x12_Jump($B4AD86)                                   ;B4AD89
    %AICMD0x1F($B4AE54)                                        ;B4AD8C
    %AICMD0x12_Jump($B4AD8C)                                   ;B4AD8F
B4AD92:
    %AICMD0x28(strcFlags.unknown1, $02)                        ;B4AD92
    %AICMD0x15_JumpIfEquals8(nCurrentYearID, 0, $B4ADB2)       ;B4AD97
    %AICMD0x15_JumpIfEquals8(nCurrentYearID, 1, $B4ADE8)       ;B4AD9E
    %AICMD0x12_Jump($B4AD86)                                   ;B4ADA5
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown1, $02)     ;B4ADA8
    %AICMD0x0B($02)                                            ;B4ADAD
    %AICMD0x12_Jump($B4AD86)                                   ;B4ADAF
B4ADB2:
    %AICMD0x09($14, $B4A930)                                   ;B4ADB2
    %AICMD0x1D_ShowDialog($0256, $00)                          ;B4ADB6
    %AICMD0x20_JumpIfChoice(0, $B4ADC5)                        ;B4ADBA
    %AICMD0x20_JumpIfChoice(1, $B4ADDB)                        ;B4ADBE
    %AICMD0x12_Jump($B4AD86)                                   ;B4ADC2
B4ADC5:
    %AICMD0x08_EnableAIControl()                               ;B4ADC5
    %AICMD0x19($00FC, $00)                                     ;B4ADC6
    %AICMD0x13_Wait(120)                                       ;B4ADCA
    %AICMD0x11_EnableUserControl()                             ;B4ADCD
    %AICMD0x1C_ShowDialog($0257, $00)                          ;B4ADCE
    %AICMD0x41_AddValue16(nLove_Nina, 8)                       ;B4ADD2
    %AICMD0x12_Jump($B4AD8C)                                   ;B4ADD8
B4ADDB:
    %AICMD0x1C_ShowDialog($0258, $00)                          ;B4ADDB
    %AICMD0x41_AddValue16(nLove_Nina, 2)                       ;B4ADDF
    %AICMD0x12_Jump($B4AD8C)                                   ;B4ADE5
B4ADE8:
    %AICMD0x09($14, $B4A94A)                                   ;B4ADE8
    %AICMD0x1D_ShowDialog($0291, $00)                          ;B4ADEC
    %AICMD0x20_JumpIfChoice(0, $B4ADFB)                        ;B4ADF0
    %AICMD0x20_JumpIfChoice(1, $B4AE11)                        ;B4ADF4
    %AICMD0x12_Jump($B4AD8C)                                   ;B4ADF8
B4ADFB:
    %AICMD0x08_EnableAIControl()                               ;B4ADFB
    %AICMD0x19($0038, $00)                                     ;B4ADFC
    %AICMD0x13_Wait(120)                                       ;B4AE00
    %AICMD0x11_EnableUserControl()                             ;B4AE03
    %AICMD0x1C_ShowDialog($0262, $00)                          ;B4AE04
    %AICMD0x41_AddValue16(nLove_Nina, 8)                       ;B4AE08
    %AICMD0x12_Jump($B4AD8C)                                   ;B4AE0E
B4AE11:
    %AICMD0x1C_ShowDialog($0263, $00)                          ;B4AE11
    %AICMD0x41_AddValue16(nLove_Nina, 2)                       ;B4AE15
    %AICMD0x12_Jump($B4AD8C)                                   ;B4AE1B
    %AICMD0x09($14, $B4A93D)                                   ;B4AE1E
    %AICMD0x1D_ShowDialog($0256, $00)                          ;B4AE22
    %AICMD0x20_JumpIfChoice(0, $B4AE31)                        ;B4AE26
    %AICMD0x20_JumpIfChoice(1, $B4ADDB)                        ;B4AE2A
    %AICMD0x12_Jump($B4AD8C)                                   ;B4AE2E
B4AE31:
    %AICMD0x08_EnableAIControl()                               ;B4AE31
    %AICMD0x19($00FD, $00)                                     ;B4AE32
    %AICMD0x13_Wait(120)                                       ;B4AE36
    %AICMD0x11_EnableUserControl()                             ;B4AE39
    %AICMD0x1C_ShowDialog($027C, $00)                          ;B4AE3A
    %AICMD0x41_AddValue16(nLove_Nina, 8)                       ;B4AE3E
    %AICMD0x12_Jump($B4AD8C)                                   ;B4AE44
    %AICMD0x1C_ShowDialog($0258, $00)                          ;B4AE47
    %AICMD0x41_AddValue16(nLove_Nina, 2)                       ;B4AE4B
    %AICMD0x12_Jump($B4AD8C)                                   ;B4AE51
B4AE54:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $05, $B4ADA8) ;B4AE54
    %AICMD0x1C_ShowDialog($026D, $00)                          ;B4AE5B
    %AICMD0x12_Jump($B4AD8C)                                   ;B4AE5F
B4AE62:
    %AICMD0x28(strcFlags.unknown1, $02)                        ;B4AE62
    %AICMD0x10_End()                                           ;B4AE67
B4AE68:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $03, $B4AE7A)   ;B4AE68
    %AICMD0x1A($0108, $0098, $B381E0, $00)                     ;B4AE6F
    %AICMD0x12_Jump($B4AE89)                                   ;B4AE77
B4AE7A:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event6, $04, $B4AF7B)   ;B4AE7A
    %AICMD0x1A($0108, $0098, $B3845C, $00)                     ;B4AE81
B4AE89:
    %AICMD0x1F($B4AE95)                                        ;B4AE89
    %AICMD0x12_Jump($B4AE89)                                   ;B4AE8C
    %AICMD0x1F($B4AF6D)                                        ;B4AE8F
    %AICMD0x12_Jump($B4AE8F)                                   ;B4AE92
B4AE95:
    %AICMD0x28(strcFlags.unknown1, $03)                        ;B4AE95
    %AICMD0x15_JumpIfEquals8(nCurrentYearID, 0, $B4AEB5)       ;B4AE9A
    %AICMD0x15_JumpIfEquals8(nCurrentYearID, 1, $B4AEEB)       ;B4AEA1
    %AICMD0x12_Jump($B4AE89)                                   ;B4AEA8
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown1, $03)     ;B4AEAB
    %AICMD0x0B($02)                                            ;B4AEB0
    %AICMD0x12_Jump($B4AE8F)                                   ;B4AEB2
B4AEB5:
    %AICMD0x09($14, $B4A957)                                   ;B4AEB5
    %AICMD0x1D_ShowDialog($0259, $00)                          ;B4AEB9
    %AICMD0x20_JumpIfChoice(0, $B4AEC8)                        ;B4AEBD
    %AICMD0x20_JumpIfChoice(1, $B4AEDE)                        ;B4AEC1
    %AICMD0x12_Jump($B4AE89)                                   ;B4AEC5
B4AEC8:
    %AICMD0x08_EnableAIControl()                               ;B4AEC8
    %AICMD0x19($0039, $00)                                     ;B4AEC9
    %AICMD0x13_Wait(120)                                       ;B4AECD
    %AICMD0x11_EnableUserControl()                             ;B4AED0
    %AICMD0x1C_ShowDialog($025A, $00)                          ;B4AED1
    %AICMD0x41_AddValue16(nLove_Ellen, 8)                      ;B4AED5
    %AICMD0x12_Jump($B4AE8F)                                   ;B4AEDB
B4AEDE:
    %AICMD0x1C_ShowDialog($025B, $00)                          ;B4AEDE
    %AICMD0x41_AddValue16(nLove_Ellen, 2)                      ;B4AEE2
    %AICMD0x12_Jump($B4AE8F)                                   ;B4AEE8
B4AEEB:
    %AICMD0x09($14, $B4A957)                                   ;B4AEEB
    %AICMD0x1D_ShowDialog($0264, $00)                          ;B4AEEF
    %AICMD0x20_JumpIfChoice(0, $B4AEFE)                        ;B4AEF3
    %AICMD0x20_JumpIfChoice(1, $B4AF14)                        ;B4AEF7
    %AICMD0x12_Jump($B4AE8F)                                   ;B4AEFB
B4AEFE:
    %AICMD0x08_EnableAIControl()                               ;B4AEFE
    %AICMD0x19($0039, $00)                                     ;B4AEFF
    %AICMD0x13_Wait(120)                                       ;B4AF03
    %AICMD0x11_EnableUserControl()                             ;B4AF06
    %AICMD0x1C_ShowDialog($0265, $00)                          ;B4AF07
    %AICMD0x41_AddValue16(nLove_Ellen, 8)                      ;B4AF0B
    %AICMD0x12_Jump($B4AE8F)                                   ;B4AF11
B4AF14:
    %AICMD0x1C_ShowDialog($0266, $00)                          ;B4AF14
    %AICMD0x41_AddValue16(nLove_Ellen, 2)                      ;B4AF18
    %AICMD0x12_Jump($B4AE8F)                                   ;B4AF1E
    %AICMD0x09($14, $B4A957)                                   ;B4AF21
    %AICMD0x1D_ShowDialog($0275, $00)                          ;B4AF25
    %AICMD0x20_JumpIfChoice(0, $B4AF34)                        ;B4AF29
    %AICMD0x20_JumpIfChoice(1, $B4AF4A)                        ;B4AF2D
    %AICMD0x12_Jump($B4AE8F)                                   ;B4AF31
B4AF34:
    %AICMD0x08_EnableAIControl()                               ;B4AF34
    %AICMD0x19($0039, $00)                                     ;B4AF35
    %AICMD0x13_Wait(120)                                       ;B4AF39
    %AICMD0x11_EnableUserControl()                             ;B4AF3C
    %AICMD0x1C_ShowDialog($0265, $00)                          ;B4AF3D
    %AICMD0x41_AddValue16(nLove_Ellen, 8)                      ;B4AF41
    %AICMD0x12_Jump($B4AE8F)                                   ;B4AF47
B4AF4A:
    %AICMD0x1C_ShowDialog($0266, $00)                          ;B4AF4A
    %AICMD0x41_AddValue16(nLove_Ellen, 2)                      ;B4AF4E
    %AICMD0x12_Jump($B4AE8F)                                   ;B4AF54
    %AICMD0x1C_ShowDialog($027D, $00)                          ;B4AF57
    %AICMD0x08_EnableAIControl()                               ;B4AF5B
    %AICMD0x19($0039, $00)                                     ;B4AF5C
    %AICMD0x13_Wait(120)                                       ;B4AF60
    %AICMD0x11_EnableUserControl()                             ;B4AF63
    %AICMD0x41_AddValue16(nLove_Ellen, 2)                      ;B4AF64
    %AICMD0x12_Jump($B4AE8F)                                   ;B4AF6A
B4AF6D:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $05, $B4AEAB) ;B4AF6D
    %AICMD0x1C_ShowDialog($027D, $00)                          ;B4AF74
    %AICMD0x12_Jump($B4AE8F)                                   ;B4AF78
B4AF7B:
    %AICMD0x28(strcFlags.unknown1, $03)                        ;B4AF7B
    %AICMD0x10_End()                                           ;B4AF80
B4AF81:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $04, $B4AF93)   ;B4AF81
    %AICMD0x1A($00B8, $0098, $B38204, $00)                     ;B4AF88
    %AICMD0x12_Jump($B4AFA2)                                   ;B4AF90
B4AF93:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event6, $04, $B4B076)   ;B4AF93
    %AICMD0x1A($00B8, $0098, $B3845C, $00)                     ;B4AF9A
B4AFA2:
    %AICMD0x1F($B4AFAE)                                        ;B4AFA2
    %AICMD0x12_Jump($B4AFA2)                                   ;B4AFA5
    %AICMD0x1F($B4B068)                                        ;B4AFA8
    %AICMD0x12_Jump($B4AFA8)                                   ;B4AFAB
B4AFAE:
    %AICMD0x28(strcFlags.unknown1, $04)                        ;B4AFAE
    %AICMD0x15_JumpIfEquals8(nCurrentYearID, 0, $B4AFCE)       ;B4AFB3
    %AICMD0x15_JumpIfEquals8(nCurrentYearID, 1, $B4B02C)       ;B4AFBA
    %AICMD0x12_Jump($B4AFA2)                                   ;B4AFC1
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown1, $04)     ;B4AFC4
    %AICMD0x0B($02)                                            ;B4AFC9
    %AICMD0x12_Jump($B4AFA2)                                   ;B4AFCB
B4AFCE:
    %AICMD0x1D_ShowDialog($0267, $00)                          ;B4AFCE
    %AICMD0x20_JumpIfChoice(0, $B4AFDD)                        ;B4AFD2
    %AICMD0x20_JumpIfChoice(1, $B4AFF0)                        ;B4AFD6
    %AICMD0x12_Jump($B4AFA8)                                   ;B4AFDA
B4AFDD:
    %AICMD0x1C_ShowDialog($0268, $00)                          ;B4AFDD
    %AICMD0x32($8000D4, $0015)                                 ;B4AFE1
    %AICMD0x41_AddValue16(nLove_Eve, 8)                        ;B4AFE7
    %AICMD0x12_Jump($B4AFA8)                                   ;B4AFED
B4AFF0:
    %AICMD0x1C_ShowDialog($0269, $00)                          ;B4AFF0
    %AICMD0x41_AddValue16(nLove_Eve, 2)                        ;B4AFF4
    %AICMD0x12_Jump($B4AFA8)                                   ;B4AFFA
    %AICMD0x1D_ShowDialog($026F, $00)                          ;B4AFFD
    %AICMD0x20_JumpIfChoice(0, $B4B00C)                        ;B4B001
    %AICMD0x20_JumpIfChoice(1, $B4B01F)                        ;B4B005
    %AICMD0x12_Jump($B4AFA2)                                   ;B4B009
B4B00C:
    %AICMD0x1C_ShowDialog($0270, $00)                          ;B4B00C
    %AICMD0x32($8000D4, $0015)                                 ;B4B010
    %AICMD0x41_AddValue16(nLove_Eve, 8)                        ;B4B016
    %AICMD0x12_Jump($B4AFA8)                                   ;B4B01C
B4B01F:
    %AICMD0x1C_ShowDialog($0271, $00)                          ;B4B01F
    %AICMD0x41_AddValue16(nLove_Eve, 2)                        ;B4B023
    %AICMD0x12_Jump($B4AFA8)                                   ;B4B029
B4B02C:
    %AICMD0x1D_ShowDialog($0277, $00)                          ;B4B02C
    %AICMD0x20_JumpIfChoice(0, $B4B03B)                        ;B4B030
    %AICMD0x20_JumpIfChoice(1, $B4B04E)                        ;B4B034
    %AICMD0x12_Jump($B4AFA8)                                   ;B4B038
B4B03B:
    %AICMD0x1C_ShowDialog($0278, $00)                          ;B4B03B
    %AICMD0x32($8000D4, $0015)                                 ;B4B03F
    %AICMD0x41_AddValue16(nLove_Eve, 8)                        ;B4B045
    %AICMD0x12_Jump($B4AFA8)                                   ;B4B04B
B4B04E:
    %AICMD0x1C_ShowDialog($0279, $00)                          ;B4B04E
    %AICMD0x41_AddValue16(nLove_Eve, 2)                        ;B4B052
    %AICMD0x12_Jump($B4AFA8)                                   ;B4B058
    %AICMD0x1C_ShowDialog($027F, $00)                          ;B4B05B
    %AICMD0x32($8000D4, $0015)                                 ;B4B05F
    %AICMD0x12_Jump($B4AFA8)                                   ;B4B065
B4B068:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $05, $B4AFC4) ;B4B068
    %AICMD0x1C_ShowDialog($0365, $00)                          ;B4B06F
    %AICMD0x12_Jump($B4AFA8)                                   ;B4B073
B4B076:
    %AICMD0x28(strcFlags.unknown1, $04)                        ;B4B076
    %AICMD0x10_End()                                           ;B4B07B
    %AICMD0x1A($00B8, $00B8, $B38300, $02)                     ;B4B07C
    %AICMD0x0C($09)                                            ;B4B084
    %AICMD0x13_Wait(180)                                       ;B4B086
    %AICMD0x1B($0294, $01)                                     ;B4B089
    %AICMD0x13_Wait(50)                                        ;B4B08D
    %AICMD0x1B($0292, $00)                                     ;B4B090
    %AICMD0x13_Wait(10)                                        ;B4B094
    %AICMD0x1B($0294, $00)                                     ;B4B097
    %AICMD0x13_Wait(10)                                        ;B4B09B
    %AICMD0x1B($0290, $00)                                     ;B4B09E
    %AICMD0x13_Wait(10)                                        ;B4B0A2
    %AICMD0x1B($0294, $01)                                     ;B4B0A5
    %AICMD0x13_Wait(10)                                        ;B4B0A9
    %AICMD0x1B($0294, $01)                                     ;B4B0AC
    %AICMD0x0D($FF, $00, $20, $02)                             ;B4B0B0
    %AICMD0x1B($0294, $01)                                     ;B4B0B5
    %AICMD0x0D($01, $00, $20, $02)                             ;B4B0B9
    %AICMD0x1B($0294, $01)                                     ;B4B0BE
    %AICMD0x0D($FF, $00, $10, $02)                             ;B4B0C2
    %AICMD0x1B($0294, $01)                                     ;B4B0C7
    %AICMD0x0D($01, $00, $10, $02)                             ;B4B0CB
    %AICMD0x12_Jump($B4B089)                                   ;B4B0D0
    %AICMD0x1A($00C8, $00B8, $B383D8, $03)                     ;B4B0D3
    %AICMD0x0C($09)                                            ;B4B0DB
    %AICMD0x13_Wait(180)                                       ;B4B0DD
    %AICMD0x1B($02C5, $00)                                     ;B4B0E0
    %AICMD0x13_Wait(10)                                        ;B4B0E4
    %AICMD0x1B($02C9, $01)                                     ;B4B0E7
    %AICMD0x13_Wait(10)                                        ;B4B0EB
    %AICMD0x1B($02C7, $00)                                     ;B4B0EE
    %AICMD0x13_Wait(10)                                        ;B4B0F2
    %AICMD0x1B($02C9, $00)                                     ;B4B0F5
    %AICMD0x13_Wait(10)                                        ;B4B0F9
    %AICMD0x1B($02C5, $00)                                     ;B4B0FC
    %AICMD0x13_Wait(50)                                        ;B4B100
    %AICMD0x1B($02C9, $00)                                     ;B4B103
    %AICMD0x0D($01, $00, $20, $02)                             ;B4B107
    %AICMD0x1B($02C9, $00)                                     ;B4B10C
    %AICMD0x0D($FF, $00, $20, $02)                             ;B4B110
    %AICMD0x1B($02C9, $00)                                     ;B4B115
    %AICMD0x0D($01, $00, $10, $02)                             ;B4B119
    %AICMD0x1B($02C9, $00)                                     ;B4B11E
    %AICMD0x0D($FF, $00, $10, $02)                             ;B4B122
    %AICMD0x12_Jump($B4B0E0)                                   ;B4B127
    %AICMD0x1A($0158, $00D8, $B38318, $02)                     ;B4B12A
    %AICMD0x0C($09)                                            ;B4B132
    %AICMD0x13_Wait(180)                                       ;B4B134
    %AICMD0x1B($029B, $01)                                     ;B4B137
    %AICMD0x13_Wait(50)                                        ;B4B13B
    %AICMD0x1B($0299, $00)                                     ;B4B13E
    %AICMD0x13_Wait(10)                                        ;B4B142
    %AICMD0x1B($029B, $00)                                     ;B4B145
    %AICMD0x13_Wait(10)                                        ;B4B149
    %AICMD0x1B($0297, $00)                                     ;B4B14C
    %AICMD0x13_Wait(10)                                        ;B4B150
    %AICMD0x1B($029B, $01)                                     ;B4B153
    %AICMD0x13_Wait(10)                                        ;B4B157
    %AICMD0x1B($029B, $01)                                     ;B4B15A
    %AICMD0x0D($FF, $00, $20, $02)                             ;B4B15E
    %AICMD0x1B($029B, $01)                                     ;B4B163
    %AICMD0x0D($01, $00, $20, $02)                             ;B4B167
    %AICMD0x1B($029B, $01)                                     ;B4B16C
    %AICMD0x0D($FF, $00, $10, $02)                             ;B4B170
    %AICMD0x1B($029B, $01)                                     ;B4B175
    %AICMD0x0D($01, $00, $10, $02)                             ;B4B179
    %AICMD0x12_Jump($B4B137)                                   ;B4B17E
    %AICMD0x1A($0168, $00D8, $B383FC, $03)                     ;B4B181
    %AICMD0x0C($09)                                            ;B4B189
    %AICMD0x13_Wait(180)                                       ;B4B18B
    %AICMD0x1B($02D0, $00)                                     ;B4B18E
    %AICMD0x13_Wait(10)                                        ;B4B192
    %AICMD0x1B($02CF, $00)                                     ;B4B195
    %AICMD0x13_Wait(10)                                        ;B4B199
    %AICMD0x1B($02D0, $01)                                     ;B4B19C
    %AICMD0x13_Wait(10)                                        ;B4B1A0
    %AICMD0x1B($02CD, $00)                                     ;B4B1A3
    %AICMD0x13_Wait(10)                                        ;B4B1A7
    %AICMD0x1B($02D0, $00)                                     ;B4B1AA
    %AICMD0x13_Wait(50)                                        ;B4B1AE
    %AICMD0x1B($02D0, $00)                                     ;B4B1B1
    %AICMD0x0D($01, $00, $20, $02)                             ;B4B1B5
    %AICMD0x1B($02D0, $00)                                     ;B4B1BA
    %AICMD0x0D($FF, $00, $20, $02)                             ;B4B1BE
    %AICMD0x1B($02D0, $00)                                     ;B4B1C3
    %AICMD0x0D($01, $00, $10, $02)                             ;B4B1C7
    %AICMD0x1B($02D0, $00)                                     ;B4B1CC
    %AICMD0x0D($FF, $00, $10, $02)                             ;B4B1D0
    %AICMD0x12_Jump($B4B18E)                                   ;B4B1D5
    %AICMD0x1A($00B8, $0128, $B38420, $02)                     ;B4B1D8
    %AICMD0x0C($09)                                            ;B4B1E0
    %AICMD0x13_Wait(180)                                       ;B4B1E2
    %AICMD0x1B($02D7, $01)                                     ;B4B1E5
    %AICMD0x13_Wait(50)                                        ;B4B1E9
    %AICMD0x1B($02D5, $00)                                     ;B4B1EC
    %AICMD0x13_Wait(10)                                        ;B4B1F0
    %AICMD0x1B($02D7, $00)                                     ;B4B1F3
    %AICMD0x13_Wait(10)                                        ;B4B1F7
    %AICMD0x1B($02D3, $00)                                     ;B4B1FA
    %AICMD0x13_Wait(10)                                        ;B4B1FE
    %AICMD0x1B($02D7, $01)                                     ;B4B201
    %AICMD0x13_Wait(10)                                        ;B4B205
    %AICMD0x1B($02D7, $00)                                     ;B4B208
    %AICMD0x0D($01, $00, $0C, $01)                             ;B4B20C
    %AICMD0x1B($02D7, $00)                                     ;B4B211
    %AICMD0x0D($FF, $00, $0C, $01)                             ;B4B215
    %AICMD0x1B($02D7, $00)                                     ;B4B21A
    %AICMD0x0D($01, $00, $08, $01)                             ;B4B21E
    %AICMD0x1B($02D7, $00)                                     ;B4B223
    %AICMD0x0D($FF, $00, $08, $01)                             ;B4B227
    %AICMD0x12_Jump($B4B1E5)                                   ;B4B22C
    %AICMD0x1A($00C8, $0128, $B38384, $03)                     ;B4B22F
    %AICMD0x0C($09)                                            ;B4B237
    %AICMD0x13_Wait(180)                                       ;B4B239
    %AICMD0x1B($02B6, $01)                                     ;B4B23C
    %AICMD0x13_Wait(10)                                        ;B4B240
    %AICMD0x1B($02B4, $00)                                     ;B4B243
    %AICMD0x13_Wait(10)                                        ;B4B247
    %AICMD0x1B($02B6, $00)                                     ;B4B24A
    %AICMD0x13_Wait(10)                                        ;B4B24E
    %AICMD0x1B($02B2, $00)                                     ;B4B251
    %AICMD0x13_Wait(10)                                        ;B4B255
    %AICMD0x1B($02B6, $01)                                     ;B4B258
    %AICMD0x13_Wait(50)                                        ;B4B25C
    %AICMD0x1B($02B6, $01)                                     ;B4B25F
    %AICMD0x0D($FF, $00, $0C, $01)                             ;B4B263
    %AICMD0x1B($02B6, $01)                                     ;B4B268
    %AICMD0x0D($01, $00, $0C, $01)                             ;B4B26C
    %AICMD0x1B($02B6, $01)                                     ;B4B271
    %AICMD0x0D($FF, $00, $08, $01)                             ;B4B275
    %AICMD0x1B($02B6, $01)                                     ;B4B27A
    %AICMD0x0D($01, $00, $08, $01)                             ;B4B27E
    %AICMD0x12_Jump($B4B23C)                                   ;B4B283
B4B286:
    %AICMD0x1A($0110, $0108, $B38168, $03)                     ;B4B286
    %AICMD0x0C($09)                                            ;B4B28E
    %AICMD0x13_Wait(200)                                       ;B4B290
    %AICMD0x1B($0223, $00)                                     ;B4B293
    %AICMD0x13_Wait(10)                                        ;B4B297
    %AICMD0x1B($0221, $00)                                     ;B4B29A
    %AICMD0x13_Wait(10)                                        ;B4B29E
    %AICMD0x1B($0223, $01)                                     ;B4B2A1
    %AICMD0x13_Wait(10)                                        ;B4B2A5
    %AICMD0x1B($021F, $00)                                     ;B4B2A8
    %AICMD0x13_Wait(10)                                        ;B4B2AC
    %AICMD0x1B($0223, $00)                                     ;B4B2AF
    %AICMD0x13_Wait(50)                                        ;B4B2B3
    %AICMD0x1B($0223, $00)                                     ;B4B2B6
    %AICMD0x0D($01, $00, $20, $02)                             ;B4B2BA
    %AICMD0x1B($0223, $00)                                     ;B4B2BF
    %AICMD0x0D($FF, $00, $20, $02)                             ;B4B2C3
    %AICMD0x1B($0223, $00)                                     ;B4B2C8
    %AICMD0x0D($01, $00, $10, $02)                             ;B4B2CC
    %AICMD0x1B($0223, $00)                                     ;B4B2D1
    %AICMD0x0D($FF, $00, $10, $02)                             ;B4B2D5
    %AICMD0x12_Jump($B4B293)                                   ;B4B2DA
B4B2DD:
    %AICMD0x1A($0110, $0108, $B38198, $03)                     ;B4B2DD
    %AICMD0x0C($09)                                            ;B4B2E5
    %AICMD0x13_Wait(200)                                       ;B4B2E7
    %AICMD0x1B($022B, $00)                                     ;B4B2EA
    %AICMD0x13_Wait(10)                                        ;B4B2EE
    %AICMD0x1B($0229, $00)                                     ;B4B2F1
    %AICMD0x13_Wait(10)                                        ;B4B2F5
    %AICMD0x1B($022B, $01)                                     ;B4B2F8
    %AICMD0x13_Wait(10)                                        ;B4B2FC
    %AICMD0x1B($0227, $00)                                     ;B4B2FF
    %AICMD0x13_Wait(10)                                        ;B4B303
    %AICMD0x1B($022B, $00)                                     ;B4B306
    %AICMD0x13_Wait(50)                                        ;B4B30A
    %AICMD0x1B($022B, $00)                                     ;B4B30D
    %AICMD0x0D($01, $00, $20, $02)                             ;B4B311
    %AICMD0x1B($022B, $00)                                     ;B4B316
    %AICMD0x0D($FF, $00, $20, $02)                             ;B4B31A
    %AICMD0x1B($022B, $00)                                     ;B4B31F
    %AICMD0x0D($01, $00, $10, $02)                             ;B4B323
    %AICMD0x1B($022B, $00)                                     ;B4B328
    %AICMD0x0D($FF, $00, $10, $02)                             ;B4B32C
    %AICMD0x12_Jump($B4B2EA)                                   ;B4B331
B4B334:
    %AICMD0x1A($0110, $0108, $B381C8, $03)                     ;B4B334
    %AICMD0x0C($09)                                            ;B4B33C
    %AICMD0x13_Wait(200)                                       ;B4B33E
    %AICMD0x1B($0250, $00)                                     ;B4B341
    %AICMD0x13_Wait(10)                                        ;B4B345
    %AICMD0x1B($024E, $00)                                     ;B4B348
    %AICMD0x13_Wait(10)                                        ;B4B34C
    %AICMD0x1B($0250, $01)                                     ;B4B34F
    %AICMD0x13_Wait(10)                                        ;B4B353
    %AICMD0x1B($024C, $00)                                     ;B4B356
    %AICMD0x13_Wait(10)                                        ;B4B35A
    %AICMD0x1B($0250, $00)                                     ;B4B35D
    %AICMD0x13_Wait(50)                                        ;B4B361
    %AICMD0x1B($0250, $00)                                     ;B4B364
    %AICMD0x0D($01, $00, $20, $02)                             ;B4B368
    %AICMD0x1B($0250, $00)                                     ;B4B36D
    %AICMD0x0D($FF, $00, $20, $02)                             ;B4B371
    %AICMD0x1B($0250, $00)                                     ;B4B376
    %AICMD0x0D($01, $00, $10, $02)                             ;B4B37A
    %AICMD0x1B($0250, $00)                                     ;B4B37F
    %AICMD0x0D($FF, $00, $10, $02)                             ;B4B383
    %AICMD0x12_Jump($B4B341)                                   ;B4B388
B4B38B:
    %AICMD0x1A($0110, $0108, $B381E0, $03)                     ;B4B38B
    %AICMD0x0C($09)                                            ;B4B393
    %AICMD0x13_Wait(200)                                       ;B4B395
    %AICMD0x1B($0241, $00)                                     ;B4B398
    %AICMD0x13_Wait(10)                                        ;B4B39C
    %AICMD0x1B($023F, $00)                                     ;B4B39F
    %AICMD0x13_Wait(10)                                        ;B4B3A3
    %AICMD0x1B($0241, $01)                                     ;B4B3A6
    %AICMD0x13_Wait(10)                                        ;B4B3AA
    %AICMD0x1B($023D, $00)                                     ;B4B3AD
    %AICMD0x13_Wait(10)                                        ;B4B3B1
    %AICMD0x1B($0241, $00)                                     ;B4B3B4
    %AICMD0x13_Wait(50)                                        ;B4B3B8
    %AICMD0x1B($0241, $00)                                     ;B4B3BB
    %AICMD0x0D($01, $00, $20, $02)                             ;B4B3BF
    %AICMD0x1B($0241, $00)                                     ;B4B3C4
    %AICMD0x0D($FF, $00, $20, $02)                             ;B4B3C8
    %AICMD0x1B($0241, $00)                                     ;B4B3CD
    %AICMD0x0D($01, $00, $10, $02)                             ;B4B3D1
    %AICMD0x1B($0241, $00)                                     ;B4B3D6
    %AICMD0x0D($FF, $00, $10, $02)                             ;B4B3DA
    %AICMD0x12_Jump($B4B398)                                   ;B4B3DF
B4B3E2:
    %AICMD0x1A($0110, $0108, $B38204, $03)                     ;B4B3E2
    %AICMD0x0C($09)                                            ;B4B3EA
    %AICMD0x13_Wait(200)                                       ;B4B3EC
    %AICMD0x1B($0249, $00)                                     ;B4B3EF
    %AICMD0x13_Wait(10)                                        ;B4B3F3
    %AICMD0x1B($0247, $00)                                     ;B4B3F6
    %AICMD0x13_Wait(10)                                        ;B4B3FA
    %AICMD0x1B($0249, $01)                                     ;B4B3FD
    %AICMD0x13_Wait(10)                                        ;B4B401
    %AICMD0x1B($0245, $00)                                     ;B4B404
    %AICMD0x13_Wait(10)                                        ;B4B408
    %AICMD0x1B($0249, $00)                                     ;B4B40B
    %AICMD0x13_Wait(50)                                        ;B4B40F
    %AICMD0x1B($0249, $00)                                     ;B4B412
    %AICMD0x0D($01, $00, $20, $02)                             ;B4B416
    %AICMD0x1B($0249, $00)                                     ;B4B41B
    %AICMD0x0D($FF, $00, $20, $02)                             ;B4B41F
    %AICMD0x1B($0249, $00)                                     ;B4B424
    %AICMD0x0D($01, $00, $10, $02)                             ;B4B428
    %AICMD0x1B($0249, $00)                                     ;B4B42D
    %AICMD0x0D($FF, $00, $10, $02)                             ;B4B431
    %AICMD0x12_Jump($B4B3EF)                                   ;B4B436
B4B439:
    %AICMD0x1A($0110, $0108, $B3845C, $03)                     ;B4B439
    %AICMD0x0C($09)                                            ;B4B441
    %AICMD0x13_Wait(200)                                       ;B4B443
    %AICMD0x1B($02E7, $00)                                     ;B4B446
    %AICMD0x13_Wait(10)                                        ;B4B44A
    %AICMD0x1B($02E5, $00)                                     ;B4B44D
    %AICMD0x13_Wait(10)                                        ;B4B451
    %AICMD0x1B($02E7, $01)                                     ;B4B454
    %AICMD0x13_Wait(10)                                        ;B4B458
    %AICMD0x1B($02E3, $00)                                     ;B4B45B
    %AICMD0x13_Wait(10)                                        ;B4B45F
    %AICMD0x1B($02E7, $00)                                     ;B4B462
    %AICMD0x13_Wait(50)                                        ;B4B466
    %AICMD0x1B($02E7, $00)                                     ;B4B469
    %AICMD0x0D($01, $00, $20, $02)                             ;B4B46D
    %AICMD0x1B($02E7, $00)                                     ;B4B472
    %AICMD0x0D($FF, $00, $20, $02)                             ;B4B476
    %AICMD0x1B($02E7, $00)                                     ;B4B47B
    %AICMD0x0D($01, $00, $10, $02)                             ;B4B47F
    %AICMD0x1B($02E7, $00)                                     ;B4B484
    %AICMD0x0D($FF, $00, $10, $02)                             ;B4B488
    %AICMD0x12_Jump($B4B446)                                   ;B4B48D


DATA8_B4B490:
 
    %AICMD0x4F()                                               ;B4B490
    %AICMD0x50()                                               ;B4B491
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $09)       ;B4B492
    %AICMD0x00_SetMusic($08, $B4)                              ;B4B497
    %AICMD0x02_FreezeTime()                                    ;B4B49A
    %AICMD0x03_SetHour($07)                                    ;B4B49B
    %AICMD0x05_SetTransferPosition(264, 264)                   ;B4B49D
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4B4A2
    %AICMD0x08_EnableAIControl()                               ;B4B4A4
    %AICMD0x19($00E8, $00)                                     ;B4B4A5
    %AICMD0x09($01, $B4B07C)                                   ;B4B4A9
    %AICMD0x09($02, $B4B0D3)                                   ;B4B4AD
    %AICMD0x09($03, $B4B12A)                                   ;B4B4B1
    %AICMD0x09($04, $B4B181)                                   ;B4B4B5
    %AICMD0x09($05, $B4B1D8)                                   ;B4B4B9
    %AICMD0x09($06, $B4B22F)                                   ;B4B4BD
    %AICMD0x09($08, $B4B4EE)                                   ;B4B4C1
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $00, $B4A6CB) ;B4B4C5
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $01, $B4A6DF) ;B4B4CC
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $02, $B4A6F3) ;B4B4D3
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $03, $B4A707) ;B4B4DA
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $04, $B4A71B) ;B4B4E1
B4B4E8:
    %AICMD0x06_SetDestinationArea(!AREA_DANCINGS2)             ;B4B4E8
    %AICMD0x38()                                               ;B4B4EA
    %AICMD0x0B($09)                                            ;B4B4EB
    %AICMD0x10_End()                                           ;B4B4ED
B4B4EE:
    %AICMD0x1A($0100, $0108, $B380D8, $02)                     ;B4B4EE
    %AICMD0x0C($09)                                            ;B4B4F6
    %AICMD0x13_Wait(200)                                       ;B4B4F8
    %AICMD0x1B($0002, $01)                                     ;B4B4FB
    %AICMD0x13_Wait(50)                                        ;B4B4FF
    %AICMD0x1B($0000, $00)                                     ;B4B502
    %AICMD0x13_Wait(10)                                        ;B4B506
    %AICMD0x1B($0002, $00)                                     ;B4B509
    %AICMD0x13_Wait(10)                                        ;B4B50D
    %AICMD0x1B($0001, $00)                                     ;B4B510
    %AICMD0x13_Wait(10)                                        ;B4B514
    %AICMD0x1B($0002, $01)                                     ;B4B517
    %AICMD0x13_Wait(10)                                        ;B4B51B
    %AICMD0x1B($0002, $01)                                     ;B4B51E
    %AICMD0x0D($FF, $00, $20, $02)                             ;B4B522
    %AICMD0x1B($0002, $01)                                     ;B4B527
    %AICMD0x0D($01, $00, $20, $02)                             ;B4B52B
    %AICMD0x1B($0002, $01)                                     ;B4B530
    %AICMD0x0D($FF, $00, $10, $02)                             ;B4B534
    %AICMD0x1B($0002, $01)                                     ;B4B539
    %AICMD0x0D($01, $00, $10, $02)                             ;B4B53D
    %AICMD0x1B($0002, $01)                                     ;B4B542
    %AICMD0x13_Wait(50)                                        ;B4B546
    %AICMD0x1B($0000, $00)                                     ;B4B549
    %AICMD0x13_Wait(10)                                        ;B4B54D
    %AICMD0x1B($0002, $00)                                     ;B4B550
    %AICMD0x13_Wait(10)                                        ;B4B554
    %AICMD0x1B($0001, $00)                                     ;B4B557
    %AICMD0x13_Wait(10)                                        ;B4B55B
    %AICMD0x1B($0002, $01)                                     ;B4B55E
    %AICMD0x13_Wait(10)                                        ;B4B562
    %AICMD0x1B($0002, $01)                                     ;B4B565
    %AICMD0x0D($FF, $00, $20, $02)                             ;B4B569
    %AICMD0x1B($0002, $01)                                     ;B4B56E
    %AICMD0x0D($01, $00, $20, $02)                             ;B4B572
    %AICMD0x1B($0002, $01)                                     ;B4B577
    %AICMD0x0D($FF, $00, $10, $02)                             ;B4B57B
    %AICMD0x1B($0002, $01)                                     ;B4B580
    %AICMD0x0D($01, $00, $10, $02)                             ;B4B584
    %AICMD0x1B($0002, $01)                                     ;B4B589
    %AICMD0x13_Wait(50)                                        ;B4B58D
    %AICMD0x1B($0000, $00)                                     ;B4B590
    %AICMD0x13_Wait(10)                                        ;B4B594
    %AICMD0x1B($0002, $00)                                     ;B4B597
    %AICMD0x13_Wait(10)                                        ;B4B59B
    %AICMD0x1B($0001, $00)                                     ;B4B59E
    %AICMD0x13_Wait(10)                                        ;B4B5A2
    %AICMD0x1B($0002, $01)                                     ;B4B5A5
    %AICMD0x13_Wait(10)                                        ;B4B5A9
    %AICMD0x1B($0002, $01)                                     ;B4B5AC
    %AICMD0x0D($FF, $00, $20, $02)                             ;B4B5B0
    %AICMD0x1B($0002, $01)                                     ;B4B5B5
    %AICMD0x0D($01, $00, $20, $02)                             ;B4B5B9
    %AICMD0x1B($0002, $01)                                     ;B4B5BE
    %AICMD0x0D($FF, $00, $10, $02)                             ;B4B5C2
    %AICMD0x1B($0002, $01)                                     ;B4B5C7
    %AICMD0x0D($01, $00, $10, $02)                             ;B4B5CB
    %AICMD0x1B($0002, $01)                                     ;B4B5D0
    %AICMD0x13_Wait(50)                                        ;B4B5D4
    %AICMD0x1B($0000, $00)                                     ;B4B5D7
    %AICMD0x13_Wait(10)                                        ;B4B5DB
    %AICMD0x1B($0002, $00)                                     ;B4B5DE
    %AICMD0x13_Wait(10)                                        ;B4B5E2
    %AICMD0x1B($0001, $00)                                     ;B4B5E5
    %AICMD0x13_Wait(10)                                        ;B4B5E9
    %AICMD0x1B($0002, $01)                                     ;B4B5EC
    %AICMD0x13_Wait(10)                                        ;B4B5F0
    %AICMD0x1B($0002, $01)                                     ;B4B5F3
    %AICMD0x0D($FF, $00, $20, $02)                             ;B4B5F7
    %AICMD0x1B($0002, $01)                                     ;B4B5FC
    %AICMD0x0D($01, $00, $20, $02)                             ;B4B600
    %AICMD0x1B($0002, $01)                                     ;B4B605
    %AICMD0x0D($FF, $00, $10, $02)                             ;B4B609
    %AICMD0x1B($0002, $01)                                     ;B4B60E
    %AICMD0x0D($01, $00, $10, $02)                             ;B4B612
    %AICMD0x1B($0002, $01)                                     ;B4B617
    %AICMD0x13_Wait(50)                                        ;B4B61B
    %AICMD0x1B($0000, $00)                                     ;B4B61E
    %AICMD0x13_Wait(10)                                        ;B4B622
    %AICMD0x1B($0002, $00)                                     ;B4B625
    %AICMD0x13_Wait(10)                                        ;B4B629
    %AICMD0x1B($0001, $00)                                     ;B4B62C
    %AICMD0x13_Wait(10)                                        ;B4B630
    %AICMD0x1B($0002, $01)                                     ;B4B633
    %AICMD0x13_Wait(10)                                        ;B4B637
    %AICMD0x1B($0002, $01)                                     ;B4B63A
    %AICMD0x0D($FF, $00, $20, $02)                             ;B4B63E
    %AICMD0x1B($0002, $01)                                     ;B4B643
    %AICMD0x0D($01, $00, $20, $02)                             ;B4B647
    %AICMD0x1B($0002, $01)                                     ;B4B64C
    %AICMD0x0D($FF, $00, $10, $02)                             ;B4B650
    %AICMD0x1B($0002, $01)                                     ;B4B655
    %AICMD0x0D($01, $00, $10, $02)                             ;B4B659
    %AICMD0x3C()                                               ;B4B65E
    %AICMD0x10_End()                                           ;B4B65F


pAIScripting0x27:
    dw DATA8_B4B680                                            ;B4B660|        |B4B680;
    dw DATA8_B4B949                                            ;B4B662|        |B4B949;
    dw DATA8_B4B9C4                                            ;B4B664|        |B4B9C4;
    dw DATA8_B4BA90                                            ;B4B666|        |B4BA90;
    dw pAIScripting0x28                                        ;B4B668|        |B4BACD;
    dw pAIScripting0x28                                        ;B4B66A|        |B4BACD;
    dw pAIScripting0x28                                        ;B4B66C|        |B4BACD;
    dw pAIScripting0x28                                        ;B4B66E|        |B4BACD;
    dw pAIScripting0x28                                        ;B4B670|        |B4BACD;
    dw pAIScripting0x28                                        ;B4B672|        |B4BACD;
    dw pAIScripting0x28                                        ;B4B674|        |B4BACD;
    dw pAIScripting0x28                                        ;B4B676|        |B4BACD;
    dw pAIScripting0x28                                        ;B4B678|        |B4BACD;
    dw pAIScripting0x28                                        ;B4B67A|        |B4BACD;
    dw pAIScripting0x28                                        ;B4B67C|        |B4BACD;
    dw pAIScripting0x28                                        ;B4B67E|        |B4BACD;
 
DATA8_B4B680:
 
    %AICMD0x4F()                                               ;B4B680
    %AICMD0x50()                                               ;B4B681
    %AICMD0x09($01, $B4B6ED)                                   ;B4B682
    %AICMD0x09($02, $B4B72C)                                   ;B4B686
    %AICMD0x09($03, $B4B75D)                                   ;B4B68A
    %AICMD0x09($04, $B4B787)                                   ;B4B68E
    %AICMD0x09($05, $B4B7AF)                                   ;B4B692
    %AICMD0x09($0A, $B4B6CE)                                   ;B4B696
    %AICMD0x12_Jump($B4B69F)                                   ;B4B69A
    %AICMD0x38()                                               ;B4B69D
    %AICMD0x10_End()                                           ;B4B69E
B4B69F:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $01, $B4B6AA)   ;B4B69F
    %AICMD0x09($06, $B4B7CB)                                   ;B4B6A6
B4B6AA:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, $B4B6B5)   ;B4B6AA
    %AICMD0x09($07, $B4B828)                                   ;B4B6B1
B4B6B5:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $03, $B4B6C0)   ;B4B6B5
    %AICMD0x09($08, $B4B885)                                   ;B4B6BC
B4B6C0:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $04, $B4B6CB)   ;B4B6C0
    %AICMD0x09($09, $B4B8E2)                                   ;B4B6C7
B4B6CB:
    %AICMD0x12_Jump($B4B69D)                                   ;B4B6CB
B4B6CE:
    %AICMD0x1A($01A8, $0328, $B387C8, $00)                     ;B4B6CE
    %AICMD0x1B($03DA, $00)                                     ;B4B6D6
    %AICMD0x13_Wait(180)                                       ;B4B6DA
    %AICMD0x1B($03D9, $00)                                     ;B4B6DD
    %AICMD0x13_Wait(360)                                       ;B4B6E1
    %AICMD0x12_Jump($B4B6E7)                                   ;B4B6E4
B4B6E7:
    %AICMD0x13_Wait(1)                                         ;B4B6E7
    %AICMD0x12_Jump($B4B6E7)                                   ;B4B6EA
B4B6ED:
    %AICMD0x1A($0228, $0378, $B3836C, $00)                     ;B4B6ED
    %AICMD0x1F($B4B6FB)                                        ;B4B6F5
    %AICMD0x12_Jump($B4B6F5)                                   ;B4B6F8
B4B6FB:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $00, $B4B725)   ;B4B6FB
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $01, $B4B725)   ;B4B702
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, $B4B725)   ;B4B709
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $03, $B4B725)   ;B4B710
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $04, $B4B725)   ;B4B717
    %AICMD0x1C_ShowDialog($0296, $00)                          ;B4B71E
    %AICMD0x12_Jump($B4B6F5)                                   ;B4B722
B4B725:
    %AICMD0x1C_ShowDialog($0495, $00)                          ;B4B725
    %AICMD0x12_Jump($B4B6F5)                                   ;B4B729
B4B72C:
    %AICMD0x1A($0178, $0308, $B38408, $00)                     ;B4B72C
    %AICMD0x22($10, $10, $01, $B38408, $01)                    ;B4B734
    %AICMD0x1F($B4B741)                                        ;B4B73B
    %AICMD0x12_Jump($B4B73B)                                   ;B4B73E
B4B741:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $01, $B4B756)   ;B4B741
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, $B4B756)   ;B4B748
    %AICMD0x1C_ShowDialog($0299, $00)                          ;B4B74F
    %AICMD0x12_Jump($B4B73B)                                   ;B4B753
B4B756:
    %AICMD0x1C_ShowDialog($0497, $00)                          ;B4B756
    %AICMD0x12_Jump($B4B73B)                                   ;B4B75A
B4B75D:
    %AICMD0x1A($0178, $0368, $B38318, $00)                     ;B4B75D
    %AICMD0x1F($B4B76B)                                        ;B4B765
    %AICMD0x12_Jump($B4B765)                                   ;B4B768
B4B76B:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $01, $B4B780)   ;B4B76B
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, $B4B780)   ;B4B772
    %AICMD0x1C_ShowDialog($029A, $00)                          ;B4B779
    %AICMD0x12_Jump($B4B765)                                   ;B4B77D
B4B780:
    %AICMD0x1C_ShowDialog($0496, $00)                          ;B4B780
    %AICMD0x12_Jump($B4B765)                                   ;B4B784
B4B787:
    %AICMD0x1A($0178, $01D8, $B382B8, $03)                     ;B4B787
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 17, 18, $B4B7A4) ;B4B78F
    %AICMD0x1F($B4B79D)                                        ;B4B797
    %AICMD0x12_Jump($B4B797)                                   ;B4B79A
B4B79D:
    %AICMD0x1C_ShowDialog($0295, $00)                          ;B4B79D
    %AICMD0x12_Jump($B4B797)                                   ;B4B7A1
B4B7A4:
    %AICMD0x1B($027B, $01)                                     ;B4B7A4
    %AICMD0x0D($01, $00, $40, $01)                             ;B4B7A8
    %AICMD0x37()                                               ;B4B7AD
    %AICMD0x10_End()                                           ;B4B7AE
B4B7AF:
    %AICMD0x1A($00E8, $01A8, $B3827C, $00)                     ;B4B7AF
    %AICMD0x22($20, $10, $01, $B38288, $18)                    ;B4B7B7
    %AICMD0x1F($B4B7C4)                                        ;B4B7BE
    %AICMD0x12_Jump($B4B7BE)                                   ;B4B7C1
B4B7C4:
    %AICMD0x1C_ShowDialog($0294, $00)                          ;B4B7C4
    %AICMD0x12_Jump($B4B7BE)                                   ;B4B7C8
B4B7CB:
    %AICMD0x1A($01B0, $0368, $B38198, $00)                     ;B4B7CB
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $01, $B4B7E0) ;B4B7D3
    %AICMD0x1F($B4B7E6)                                        ;B4B7DA
    %AICMD0x12_Jump($B4B7DA)                                   ;B4B7DD
B4B7E0:
    %AICMD0x1F($B4B821)                                        ;B4B7E0
    %AICMD0x12_Jump($B4B7E0)                                   ;B4B7E3
B4B7E6:
    %AICMD0x45_JumpIfBetween16(nLove_Ann, 0, 119, $B4B81A)     ;B4B7E6
    %AICMD0x45_JumpIfBetween16(nLove_Ann, 120, 999, $B4B7FD)   ;B4B7F0
    %AICMD0x12_Jump($B4B7DA)                                   ;B4B7FA
B4B7FD:
    %AICMD0x1C_ShowDialog($02A1, $00)                          ;B4B7FD
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown1, $01)     ;B4B801
    %AICMD0x08_EnableAIControl()                               ;B4B806
    %AICMD0x19($0039, $00)                                     ;B4B807
    %AICMD0x13_Wait(120)                                       ;B4B80B
    %AICMD0x11_EnableUserControl()                             ;B4B80E
    %AICMD0x41_AddValue16(nPlayerHappiness, 10)                ;B4B80F
    %AICMD0x57_UpdateStamina(20)                               ;B4B815
    %AICMD0x12_Jump($B4B7E0)                                   ;B4B817
B4B81A:
    %AICMD0x1C_ShowDialog($02A3, $00)                          ;B4B81A
    %AICMD0x12_Jump($B4B7DA)                                   ;B4B81E
B4B821:
    %AICMD0x1C_ShowDialog($02A2, $00)                          ;B4B821
    %AICMD0x12_Jump($B4B7E0)                                   ;B4B825
B4B828:
    %AICMD0x1A($0268, $0108, $B381D4, $00)                     ;B4B828
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $02, $B4B83D) ;B4B830
    %AICMD0x1F($B4B843)                                        ;B4B837
    %AICMD0x12_Jump($B4B837)                                   ;B4B83A
B4B83D:
    %AICMD0x1F($B4B87E)                                        ;B4B83D
    %AICMD0x12_Jump($B4B83D)                                   ;B4B840
B4B843:
    %AICMD0x45_JumpIfBetween16(nLove_Nina, 0, 119, $B4B877)    ;B4B843
    %AICMD0x45_JumpIfBetween16(nLove_Nina, 120, 999, $B4B85A)  ;B4B84D
    %AICMD0x12_Jump($B4B837)                                   ;B4B857
B4B85A:
    %AICMD0x1C_ShowDialog($02A4, $00)                          ;B4B85A
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown1, $02)     ;B4B85E
    %AICMD0x08_EnableAIControl()                               ;B4B863
    %AICMD0x19($0039, $00)                                     ;B4B864
    %AICMD0x13_Wait(120)                                       ;B4B868
    %AICMD0x11_EnableUserControl()                             ;B4B86B
    %AICMD0x41_AddValue16(nPlayerHappiness, 10)                ;B4B86C
    %AICMD0x57_UpdateStamina(20)                               ;B4B872
    %AICMD0x12_Jump($B4B83D)                                   ;B4B874
B4B877:
    %AICMD0x1C_ShowDialog($02A6, $00)                          ;B4B877
    %AICMD0x12_Jump($B4B837)                                   ;B4B87B
B4B87E:
    %AICMD0x1C_ShowDialog($02A5, $00)                          ;B4B87E
    %AICMD0x12_Jump($B4B83D)                                   ;B4B882
B4B885:
    %AICMD0x1A($01B8, $0168, $B381E0, $00)                     ;B4B885
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $03, $B4B89A) ;B4B88D
    %AICMD0x1F($B4B8A0)                                        ;B4B894
    %AICMD0x12_Jump($B4B894)                                   ;B4B897
B4B89A:
    %AICMD0x1F($B4B8DB)                                        ;B4B89A
    %AICMD0x12_Jump($B4B89A)                                   ;B4B89D
B4B8A0:
    %AICMD0x45_JumpIfBetween16(nLove_Ellen, 0, 119, $B4B8D4)   ;B4B8A0
    %AICMD0x45_JumpIfBetween16(nLove_Ellen, 120, 999, $B4B8B7) ;B4B8AA
    %AICMD0x12_Jump($B4B894)                                   ;B4B8B4
B4B8B7:
    %AICMD0x1C_ShowDialog($02A7, $00)                          ;B4B8B7
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown1, $03)     ;B4B8BB
    %AICMD0x08_EnableAIControl()                               ;B4B8C0
    %AICMD0x19($0039, $00)                                     ;B4B8C1
    %AICMD0x13_Wait(120)                                       ;B4B8C5
    %AICMD0x11_EnableUserControl()                             ;B4B8C8
    %AICMD0x41_AddValue16(nPlayerHappiness, 10)                ;B4B8C9
    %AICMD0x57_UpdateStamina(20)                               ;B4B8CF
    %AICMD0x12_Jump($B4B89A)                                   ;B4B8D1
B4B8D4:
    %AICMD0x1C_ShowDialog($02A0, $00)                          ;B4B8D4
    %AICMD0x12_Jump($B4B894)                                   ;B4B8D8
B4B8DB:
    %AICMD0x1C_ShowDialog($02A8, $00)                          ;B4B8DB
    %AICMD0x12_Jump($B4B89A)                                   ;B4B8DF
B4B8E2:
    %AICMD0x1A($0048, $0298, $B38204, $00)                     ;B4B8E2
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $04, $B4B8F7) ;B4B8EA
    %AICMD0x1F($B4B8FD)                                        ;B4B8F1
    %AICMD0x12_Jump($B4B8F1)                                   ;B4B8F4
B4B8F7:
    %AICMD0x1F($B4B938)                                        ;B4B8F7
    %AICMD0x12_Jump($B4B8F7)                                   ;B4B8FA
B4B8FD:
    %AICMD0x45_JumpIfBetween16(nLove_Eve, 0, 119, $B4B931)     ;B4B8FD
    %AICMD0x45_JumpIfBetween16(nLove_Eve, 120, 999, $B4B914)   ;B4B907
    %AICMD0x12_Jump($B4B8F1)                                   ;B4B911
B4B914:
    %AICMD0x1C_ShowDialog($02AA, $00)                          ;B4B914
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown1, $04)     ;B4B918
    %AICMD0x08_EnableAIControl()                               ;B4B91D
    %AICMD0x19($0039, $00)                                     ;B4B91E
    %AICMD0x13_Wait(120)                                       ;B4B922
    %AICMD0x11_EnableUserControl()                             ;B4B925
    %AICMD0x41_AddValue16(nPlayerHappiness, 10)                ;B4B926
    %AICMD0x57_UpdateStamina(20)                               ;B4B92C
    %AICMD0x12_Jump($B4B8F7)                                   ;B4B92E
B4B931:
    %AICMD0x1C_ShowDialog($02A0, $00)                          ;B4B931
    %AICMD0x12_Jump($B4B8F1)                                   ;B4B935
B4B938:
    %AICMD0x1C_ShowDialog($02AB, $00)                          ;B4B938
    %AICMD0x12_Jump($B4B8F7)                                   ;B4B93C
    %AICMD0x08_EnableAIControl()                               ;B4B93F
    %AICMD0x3E_SetCarryItem($06)                               ;B4B940
    %AICMD0x13_Wait(60)                                        ;B4B942
    %AICMD0x11_EnableUserControl()                             ;B4B945
    %AICMD0x12_Jump($B4B69E)                                   ;B4B946


DATA8_B4B949:
 
    %AICMD0x4F()                                               ;B4B949
    %AICMD0x50()                                               ;B4B94A
    %AICMD0x23_OrWithIndexedValue(strcFlags.event2, $01)       ;B4B94B
    %AICMD0x02_FreezeTime()                                    ;B4B950
    %AICMD0x03_SetHour($06)                                    ;B4B951
    %AICMD0x05_SetTransferPosition(136, 120)                   ;B4B953
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4B958
    %AICMD0x11_EnableUserControl()                             ;B4B95A
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $00, $B4B981)   ;B4B95B
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $01, $B4B981)   ;B4B962
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, $B4B981)   ;B4B969
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $03, $B4B981)   ;B4B970
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $04, $B4B981)   ;B4B977
    %AICMD0x12_Jump($B4B985)                                   ;B4B97E
B4B981:
    %AICMD0x09($01, $B4B98C)                                   ;B4B981
B4B985:
    %AICMD0x38()                                               ;B4B985
    %AICMD0x13_Wait(1)                                         ;B4B986
    %AICMD0x12_Jump($B4B986)                                   ;B4B989
B4B98C:
    %AICMD0x1A($0028, $0080, $B3845C, $00)                     ;B4B98C
    %AICMD0x1F($B4B9A0)                                        ;B4B994
    %AICMD0x12_Jump($B4B994)                                   ;B4B997
    %AICMD0x1F($B4B9B3)                                        ;B4B99A
    %AICMD0x12_Jump($B4B99A)                                   ;B4B99D
B4B9A0:
    %AICMD0x1C_ShowDialog($0292, $00)                          ;B4B9A0
    %AICMD0x09($02, $B4B9BA)                                   ;B4B9A4
    %AICMD0x41_AddValue16(nPlayerHappiness, 10)                ;B4B9A8
    %AICMD0x57_UpdateStamina(20)                               ;B4B9AE
    %AICMD0x12_Jump($B4B99A)                                   ;B4B9B0
B4B9B3:
    %AICMD0x1C_ShowDialog($0293, $00)                          ;B4B9B3
    %AICMD0x12_Jump($B4B99A)                                   ;B4B9B7
B4B9BA:
    %AICMD0x08_EnableAIControl()                               ;B4B9BA
    %AICMD0x3E_SetCarryItem($06)                               ;B4B9BB
    %AICMD0x13_Wait(60)                                        ;B4B9BD
    %AICMD0x11_EnableUserControl()                             ;B4B9C0
    %AICMD0x12_Jump($B4B986)                                   ;B4B9C1


DATA8_B4B9C4:
 
    %AICMD0x4F()                                               ;B4B9C4
    %AICMD0x50()                                               ;B4B9C5
    %AICMD0x09($01, $B4B9DF)                                   ;B4B9C6
    %AICMD0x09($02, $B4BA02)                                   ;B4B9CA
    %AICMD0x09($03, $B4BA1E)                                   ;B4B9CE
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $00, $B4B9DD)   ;B4B9D2
    %AICMD0x09($04, $B4BA33)                                   ;B4B9D9
B4B9DD:
    %AICMD0x38()                                               ;B4B9DD
    %AICMD0x10_End()                                           ;B4B9DE
B4B9DF:
    %AICMD0x1A($0070, $00F8, $B38354, $00)                     ;B4B9DF
    %AICMD0x1F($B4B9ED)                                        ;B4B9E7
    %AICMD0x12_Jump($B4B9E7)                                   ;B4B9EA
B4B9ED:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $00, $B4B9FB)   ;B4B9ED
    %AICMD0x1C_ShowDialog($029B, $00)                          ;B4B9F4
    %AICMD0x12_Jump($B4B9E7)                                   ;B4B9F8
B4B9FB:
    %AICMD0x1C_ShowDialog($0494, $00)                          ;B4B9FB
    %AICMD0x12_Jump($B4B9E7)                                   ;B4B9FF
B4BA02:
    %AICMD0x1A($0080, $0138, $B3842C, $00)                     ;B4BA02
    %AICMD0x22($18, $20, $01, $B3842C, $10)                    ;B4BA0A
    %AICMD0x1F($B4BA17)                                        ;B4BA11
    %AICMD0x12_Jump($B4BA11)                                   ;B4BA14
B4BA17:
    %AICMD0x1C_ShowDialog($029C, $00)                          ;B4BA17
    %AICMD0x12_Jump($B4BA11)                                   ;B4BA1B
B4BA1E:
    %AICMD0x1A($00A8, $01B8, $B38390, $01)                     ;B4BA1E
    %AICMD0x1F($B4BA2C)                                        ;B4BA26
    %AICMD0x12_Jump($B4BA26)                                   ;B4BA29
B4BA2C:
    %AICMD0x1C_ShowDialog($029D, $00)                          ;B4BA2C
    %AICMD0x12_Jump($B4BA26)                                   ;B4BA30
B4BA33:
    %AICMD0x1A($0048, $0098, $B38174, $00)                     ;B4BA33
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $00, $B4BA48) ;B4BA3B
    %AICMD0x1F($B4BA4E)                                        ;B4BA42
    %AICMD0x12_Jump($B4BA42)                                   ;B4BA45
B4BA48:
    %AICMD0x1F($B4BA89)                                        ;B4BA48
    %AICMD0x12_Jump($B4BA48)                                   ;B4BA4B
B4BA4E:
    %AICMD0x45_JumpIfBetween16(nLove_Maria, 0, 119, $B4BA82)   ;B4BA4E
    %AICMD0x45_JumpIfBetween16(nLove_Maria, 120, 999, $B4BA65) ;B4BA58
    %AICMD0x12_Jump($B4BA42)                                   ;B4BA62
B4BA65:
    %AICMD0x1C_ShowDialog($029E, $00)                          ;B4BA65
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown1, $00)     ;B4BA69
    %AICMD0x08_EnableAIControl()                               ;B4BA6E
    %AICMD0x19($0039, $00)                                     ;B4BA6F
    %AICMD0x13_Wait(120)                                       ;B4BA73
    %AICMD0x11_EnableUserControl()                             ;B4BA76
    %AICMD0x41_AddValue16(nPlayerHappiness, 10)                ;B4BA77
    %AICMD0x57_UpdateStamina(20)                               ;B4BA7D
    %AICMD0x12_Jump($B4BA48)                                   ;B4BA7F
B4BA82:
    %AICMD0x1C_ShowDialog($02A0, $00)                          ;B4BA82
    %AICMD0x12_Jump($B4BA42)                                   ;B4BA86
B4BA89:
    %AICMD0x1C_ShowDialog($029F, $00)                          ;B4BA89
    %AICMD0x12_Jump($B4BA48)                                   ;B4BA8D


DATA8_B4BA90:
 
    %AICMD0x4F()                                               ;B4BA90
    %AICMD0x50()                                               ;B4BA91
    %AICMD0x09($01, $B4BA9C)                                   ;B4BA92
    %AICMD0x09($02, $B4BAB8)                                   ;B4BA96
    %AICMD0x38()                                               ;B4BA9A
    %AICMD0x10_End()                                           ;B4BA9B
B4BA9C:
    %AICMD0x1A($00A8, $0078, $B38300, $00)                     ;B4BA9C
    %AICMD0x22($20, $10, $01, $B3830C, $14)                    ;B4BAA4
    %AICMD0x1F($B4BAB1)                                        ;B4BAAB
    %AICMD0x12_Jump($B4BAAB)                                   ;B4BAAE
B4BAB1:
    %AICMD0x1C_ShowDialog($0297, $00)                          ;B4BAB1
    %AICMD0x12_Jump($B4BAAB)                                   ;B4BAB5
B4BAB8:
    %AICMD0x1A($0188, $00A0, $B383D8, $00)                     ;B4BAB8
    %AICMD0x1F($B4BAC6)                                        ;B4BAC0
    %AICMD0x12_Jump($B4BAC0)                                   ;B4BAC3
B4BAC6:
    %AICMD0x1C_ShowDialog($0298, $00)                          ;B4BAC6
    %AICMD0x12_Jump($B4BAC0)                                   ;B4BACA


pAIScripting0x28:
    dw DATA8_B4BAED                                            ;B4BACD|        |B4BAED;
    dw DATA8_B4BB08                                            ;B4BACF|        |B4BB08;
    dw DATA8_B4BD1B                                            ;B4BAD1|        |B4BD1B;
    dw DATA8_B4C3AE                                            ;B4BAD3|        |B4C3AE;
    dw pAIScripting0x29                                        ;B4BAD5|        |B4C429;
    dw pAIScripting0x29                                        ;B4BAD7|        |B4C429;
    dw pAIScripting0x29                                        ;B4BAD9|        |B4C429;
    dw pAIScripting0x29                                        ;B4BADB|        |B4C429;
    dw pAIScripting0x29                                        ;B4BADD|        |B4C429;
    dw pAIScripting0x29                                        ;B4BADF|        |B4C429;
    dw pAIScripting0x29                                        ;B4BAE1|        |B4C429;
    dw pAIScripting0x29                                        ;B4BAE3|        |B4C429;
    dw pAIScripting0x29                                        ;B4BAE5|        |B4C429;
    dw pAIScripting0x29                                        ;B4BAE7|        |B4C429;
    dw pAIScripting0x29                                        ;B4BAE9|        |B4C429;
    dw pAIScripting0x29                                        ;B4BAEB|        |B4C429;
 
DATA8_B4BAED:
 
    %AICMD0x4F()                                               ;B4BAED
    %AICMD0x50()                                               ;B4BAEE
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $09)       ;B4BAEF
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $00)       ;B4BAF4
    %AICMD0x08_EnableAIControl()                               ;B4BAF9
    %AICMD0x38()                                               ;B4BAFA
    %AICMD0x01_UnfreezeTime()                                  ;B4BAFB
    %AICMD0x24_NextHourPalette($74)                            ;B4BAFC
    %AICMD0x13_Wait(180)                                       ;B4BAFE
    %AICMD0x1C_ShowDialog($02F5, $00)                          ;B4BB01
    %AICMD0x3D_TeleportToArea(!AREA_MOUNTAINTOPSUNRISE)        ;B4BB05
    %AICMD0x10_End()                                           ;B4BB07


DATA8_B4BB08:
 
    %AICMD0x4F()                                               ;B4BB08
    %AICMD0x50()                                               ;B4BB09
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $09)       ;B4BB0A
    %AICMD0x00_SetMusic($0E, $B4)                              ;B4BB0F
    %AICMD0x02_FreezeTime()                                    ;B4BB12
    %AICMD0x03_SetHour($06)                                    ;B4BB13
    %AICMD0x05_SetTransferPosition(128, 440)                   ;B4BB15
    %AICMD0x08_EnableAIControl()                               ;B4BB1A
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B4BB1B
    %AICMD0x09($01, $B4BB65)                                   ;B4BB1D
    %AICMD0x09($02, $B4BB93)                                   ;B4BB21
    %AICMD0x09($03, $B4BC38)                                   ;B4BB25
    %AICMD0x09($04, $B4BC4F)                                   ;B4BB29
    %AICMD0x09($05, $B4BBC3)                                   ;B4BB2D
    %AICMD0x09($06, $B4BC75)                                   ;B4BB31
    %AICMD0x09($07, $B4BC8C)                                   ;B4BB35
    %AICMD0x09($08, $B4BCA3)                                   ;B4BB39
    %AICMD0x09($09, $B4BCDF)                                   ;B4BB3D
    %AICMD0x06_SetDestinationArea(!AREA_MOUNTAINTOPSUNRISE)    ;B4BB41
    %AICMD0x38()                                               ;B4BB43
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 96)                    ;B4BB44
    %AICMD0x11_EnableUserControl()                             ;B4BB48
    %AICMD0x0C($00)                                            ;B4BB49
    %AICMD0x0C($02)                                            ;B4BB4B
    %AICMD0x0C($03)                                            ;B4BB4D
    %AICMD0x0C($04)                                            ;B4BB4F
    %AICMD0x0C($05)                                            ;B4BB51
    %AICMD0x0C($06)                                            ;B4BB53
    %AICMD0x0C($07)                                            ;B4BB55
    %AICMD0x0C($08)                                            ;B4BB57
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown1, $02)     ;B4BB59
    %AICMD0x0C($01)                                            ;B4BB5E
    %AICMD0x13_Wait(60)                                        ;B4BB60
    %AICMD0x3C()                                               ;B4BB63
    %AICMD0x10_End()                                           ;B4BB64
B4BB65:
    %AICMD0x1A($0088, $0128, $B38354, $00)                     ;B4BB65
    %AICMD0x1F($B4BB79)                                        ;B4BB6D
    %AICMD0x12_Jump($B4BB6D)                                   ;B4BB70
    %AICMD0x1F($B4BB8C)                                        ;B4BB73
    %AICMD0x12_Jump($B4BB73)                                   ;B4BB76
B4BB79:
    %AICMD0x08_EnableAIControl()                               ;B4BB79
    %AICMD0x1C_ShowDialog($02CE, $00)                          ;B4BB7A
    %AICMD0x0B($00)                                            ;B4BB7E
    %AICMD0x01_UnfreezeTime()                                  ;B4BB80
    %AICMD0x03_SetHour($07)                                    ;B4BB81
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B4BB83
    %AICMD0x13_Wait(240)                                       ;B4BB85
    %AICMD0x11_EnableUserControl()                             ;B4BB88
    %AICMD0x12_Jump($B4BB73)                                   ;B4BB89
B4BB8C:
    %AICMD0x1C_ShowDialog($02CE, $00)                          ;B4BB8C
    %AICMD0x12_Jump($B4BB73)                                   ;B4BB90
B4BB93:
    %AICMD0x1A($0080, $01E8, $B383E4, $01)                     ;B4BB93
    %AICMD0x0D($00, $FF, $30, $01)                             ;B4BB9B
    %AICMD0x1F($B4BBAC)                                        ;B4BBA0
    %AICMD0x12_Jump($B4BBA0)                                   ;B4BBA3
    %AICMD0x1F($B4BBBA)                                        ;B4BBA6
    %AICMD0x12_Jump($B4BBA6)                                   ;B4BBA9
B4BBAC:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $02, $B4BBBA) ;B4BBAC
    %AICMD0x1C_ShowDialog($02CF, $00)                          ;B4BBB3
    %AICMD0x12_Jump($B4BBA0)                                   ;B4BBB7
B4BBBA:
    %AICMD0x1C_ShowDialog($001A, $00)                          ;B4BBBA
    %AICMD0x0B($01)                                            ;B4BBBE
    %AICMD0x12_Jump($B4BBA6)                                   ;B4BBC0
B4BBC3:
    %AICMD0x1A($0048, $0168, $B382E8, $01)                     ;B4BBC3
    %AICMD0x1F($B4BBD7)                                        ;B4BBCB
    %AICMD0x12_Jump($B4BBCB)                                   ;B4BBCE
    %AICMD0x1F($B4BC31)                                        ;B4BBD1
    %AICMD0x12_Jump($B4BBD1)                                   ;B4BBD4
B4BBD7:
    %AICMD0x1D_ShowDialog($02D3, $00)                          ;B4BBD7
    %AICMD0x20_JumpIfChoice(0, $B4BBE6)                        ;B4BBDB
    %AICMD0x20_JumpIfChoice(1, $B4BBFB)                        ;B4BBDF
    %AICMD0x12_Jump($B4BBCB)                                   ;B4BBE3
B4BBE6:
    %AICMD0x1D_ShowDialog($02D4, $00)                          ;B4BBE6
    %AICMD0x17($03)                                            ;B4BBEA
    %AICMD0x18($00, $B4BC04)                                   ;B4BBEC
    %AICMD0x18($01, $B4BC13)                                   ;B4BBF0
    %AICMD0x18($02, $B4BC22)                                   ;B4BBF4
    %AICMD0x12_Jump($B4BBD1)                                   ;B4BBF8
B4BBFB:
    %AICMD0x1C_ShowDialog($02D8, $00)                          ;B4BBFB
    %AICMD0x0B($02)                                            ;B4BBFF
    %AICMD0x12_Jump($B4BBD1)                                   ;B4BC01
    %AICMD0x1C_ShowDialog($02D5, $00)                          ;B4BC04
    %AICMD0x41_AddValue16(nPlayerHappiness, 30)                ;B4BC08
    %AICMD0x0B($02)                                            ;B4BC0E
    %AICMD0x12_Jump($B4BBD1)                                   ;B4BC10
    %AICMD0x1C_ShowDialog($02D6, $00)                          ;B4BC13
    %AICMD0x41_AddValue16(nPlayerHappiness, 10)                ;B4BC17
    %AICMD0x0B($02)                                            ;B4BC1D
    %AICMD0x12_Jump($B4BBD1)                                   ;B4BC1F
    %AICMD0x1C_ShowDialog($02D7, $00)                          ;B4BC22
    %AICMD0x41_AddValue16(nPlayerHappiness, -20)               ;B4BC26
    %AICMD0x0B($02)                                            ;B4BC2C
    %AICMD0x12_Jump($B4BBD1)                                   ;B4BC2E
B4BC31:
    %AICMD0x1C_ShowDialog($02DC, $00)                          ;B4BC31
    %AICMD0x12_Jump($B4BBD1)                                   ;B4BC35
B4BC38:
    %AICMD0x1A($0078, $0158, $B38414, $01)                     ;B4BC38
    %AICMD0x1F($B4BC46)                                        ;B4BC40
    %AICMD0x12_Jump($B4BC40)                                   ;B4BC43
B4BC46:
    %AICMD0x1C_ShowDialog($02D0, $00)                          ;B4BC46
    %AICMD0x0B($03)                                            ;B4BC4A
    %AICMD0x12_Jump($B4BC40)                                   ;B4BC4C
B4BC4F:
    %AICMD0x1A($00B8, $0168, $B38318, $01)                     ;B4BC4F
    %AICMD0x1F($B4BC63)                                        ;B4BC57
    %AICMD0x12_Jump($B4BC57)                                   ;B4BC5A
    %AICMD0x1F($B4BC6C)                                        ;B4BC5D
    %AICMD0x12_Jump($B4BC5D)                                   ;B4BC60
B4BC63:
    %AICMD0x1C_ShowDialog($02D1, $00)                          ;B4BC63
    %AICMD0x0B($04)                                            ;B4BC67
    %AICMD0x12_Jump($B4BC5D)                                   ;B4BC69
B4BC6C:
    %AICMD0x1C_ShowDialog($038E, $00)                          ;B4BC6C
    %AICMD0x0B($04)                                            ;B4BC70
    %AICMD0x12_Jump($B4BC5D)                                   ;B4BC72
B4BC75:
    %AICMD0x1A($00B8, $0198, $B382C4, $01)                     ;B4BC75
    %AICMD0x1F($B4BC83)                                        ;B4BC7D
    %AICMD0x12_Jump($B4BC7D)                                   ;B4BC80
B4BC83:
    %AICMD0x1C_ShowDialog($02D9, $00)                          ;B4BC83
    %AICMD0x0B($05)                                            ;B4BC87
    %AICMD0x12_Jump($B4BC7D)                                   ;B4BC89
B4BC8C:
    %AICMD0x1A($0058, $0188, $B38330, $01)                     ;B4BC8C
    %AICMD0x1F($B4BC9A)                                        ;B4BC94
    %AICMD0x12_Jump($B4BC94)                                   ;B4BC97
B4BC9A:
    %AICMD0x1C_ShowDialog($02D2, $00)                          ;B4BC9A
    %AICMD0x0B($06)                                            ;B4BC9E
    %AICMD0x12_Jump($B4BC94)                                   ;B4BCA0
B4BCA3:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $00, $B4BCB5)   ;B4BCA3
    %AICMD0x1A($0098, $0178, $B38168, $01)                     ;B4BCAA
    %AICMD0x12_Jump($B4BCBD)                                   ;B4BCB2
B4BCB5:
    %AICMD0x1A($0088, $0178, $B3845C, $01)                     ;B4BCB5
B4BCBD:
    %AICMD0x1F($B4BCC9)                                        ;B4BCBD
    %AICMD0x12_Jump($B4BCBD)                                   ;B4BCC0
    %AICMD0x1F($B4BCD8)                                        ;B4BCC3
    %AICMD0x12_Jump($B4BCC3)                                   ;B4BCC6
B4BCC9:
    %AICMD0x1C_ShowDialog($02DA, $00)                          ;B4BCC9
    %AICMD0x41_AddValue16(nLove_Maria, 10)                     ;B4BCCD
    %AICMD0x0B($07)                                            ;B4BCD3
    %AICMD0x12_Jump($B4BCC3)                                   ;B4BCD5
B4BCD8:
    %AICMD0x1C_ShowDialog($0293, $00)                          ;B4BCD8
    %AICMD0x12_Jump($B4BCC3)                                   ;B4BCDC
B4BCDF:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $04, $B4BCF1)   ;B4BCDF
    %AICMD0x1A($00A8, $0198, $B38204, $01)                     ;B4BCE6
    %AICMD0x12_Jump($B4BCF9)                                   ;B4BCEE
B4BCF1:
    %AICMD0x1A($00A8, $0198, $B3845C, $01)                     ;B4BCF1
B4BCF9:
    %AICMD0x1F($B4BD05)                                        ;B4BCF9
    %AICMD0x12_Jump($B4BCF9)                                   ;B4BCFC
    %AICMD0x1F($B4BD14)                                        ;B4BCFF
    %AICMD0x12_Jump($B4BCFF)                                   ;B4BD02
B4BD05:
    %AICMD0x1C_ShowDialog($02DB, $00)                          ;B4BD05
    %AICMD0x41_AddValue16(nLove_Eve, 10)                       ;B4BD09
    %AICMD0x0B($08)                                            ;B4BD0F
    %AICMD0x12_Jump($B4BCFF)                                   ;B4BD11
B4BD14:
    %AICMD0x1C_ShowDialog($0293, $00)                          ;B4BD14
    %AICMD0x12_Jump($B4BCFF)                                   ;B4BD18


DATA8_B4BD1B:
 
    %AICMD0x4F()                                               ;B4BD1B
    %AICMD0x50()                                               ;B4BD1C
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $09)       ;B4BD1D
    %AICMD0x00_SetMusic($0D, $B4)                              ;B4BD22
    %AICMD0x02_FreezeTime()                                    ;B4BD25
    %AICMD0x03_SetHour($07)                                    ;B4BD26
    %AICMD0x05_SetTransferPosition(296, 536)                   ;B4BD28
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B4BD2D
    %AICMD0x09($01, $B4BD71)                                   ;B4BD2F
    %AICMD0x09($02, $B4C003)                                   ;B4BD33
    %AICMD0x09($03, $B4C091)                                   ;B4BD37
    %AICMD0x09($04, $B4C0DC)                                   ;B4BD3B
    %AICMD0x09($05, $B4C140)                                   ;B4BD3F
    %AICMD0x09($06, $B4C191)                                   ;B4BD43
    %AICMD0x09($07, $B4C23B)                                   ;B4BD47
    %AICMD0x09($08, $B4C2E8)                                   ;B4BD4B
    %AICMD0x06_SetDestinationArea(!AREA_EGGFESTIVAL)           ;B4BD4F
    %AICMD0x11_EnableUserControl()                             ;B4BD51
    %AICMD0x38()                                               ;B4BD52
    %AICMD0x13_Wait(1)                                         ;B4BD53
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $04, $B4BD60) ;B4BD56
    %AICMD0x12_Jump($B4BD53)                                   ;B4BD5D
B4BD60:
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown1, $07)     ;B4BD60
    %AICMD0x3D_TeleportToArea(!AREA_EGGFESTIVAL)               ;B4BD65
    %AICMD0x10_End()                                           ;B4BD67
    %AICMD0x13_Wait(1800)                                      ;B4BD68
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown1, $05)     ;B4BD6B
    %AICMD0x10_End()                                           ;B4BD70
B4BD71:
    %AICMD0x1A($0128, $01A8, $B38300, $00)                     ;B4BD71
    %AICMD0x1F($B4BD8E)                                        ;B4BD79
    %AICMD0x12_Jump($B4BD79)                                   ;B4BD7C
    %AICMD0x2D($B4BDC5, $B4BDD0)                               ;B4BD7F
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $05, $B4BE7E) ;B4BD84
    %AICMD0x12_Jump($B4BD7F)                                   ;B4BD8B
B4BD8E:
    %AICMD0x1D_ShowDialog($02DD, $00)                          ;B4BD8E
    %AICMD0x20_JumpIfChoice(0, $B4BD9D)                        ;B4BD92
    %AICMD0x20_JumpIfChoice(1, $B4BDBE)                        ;B4BD96
    %AICMD0x12_Jump($B4BD79)                                   ;B4BD9A
B4BD9D:
    %AICMD0x08_EnableAIControl()                               ;B4BD9D
    %AICMD0x1C_ShowDialog($02DE, $00)                          ;B4BD9E
    %AICMD0x28(strcFlags.unknown1, $05)                        ;B4BDA2
    %AICMD0x1B($0295, $00)                                     ;B4BDA7
    %AICMD0x09($09, $B4BEF2)                                   ;B4BDAB
    %AICMD0x09($0A, $B4BD68)                                   ;B4BDAF
    %AICMD0x0C($01)                                            ;B4BDB3
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown1, $03)     ;B4BDB5
    %AICMD0x11_EnableUserControl()                             ;B4BDBA
    %AICMD0x12_Jump($B4BD7F)                                   ;B4BDBB
B4BDBE:
    %AICMD0x1C_ShowDialog($0236, $00)                          ;B4BDBE
    %AICMD0x12_Jump($B4BD79)                                   ;B4BDC2
    %AICMD0x1C_ShowDialog($02DF, $00)                          ;B4BDC5
    %AICMD0x1B($0295, $00)                                     ;B4BDC9
    %AICMD0x12_Jump($B4BD7F)                                   ;B4BDCD
    %AICMD0x21_AddValue8($8009A8, 1)                           ;B4BDD0
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown2, $00, $B4BDDF) ;B4BDD5
    %AICMD0x12_Jump($B4BE04)                                   ;B4BDDC
B4BDDF:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown2, $01, $B4BDE9) ;B4BDDF
    %AICMD0x12_Jump($B4BE04)                                   ;B4BDE6
B4BDE9:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown2, $02, $B4BDF3) ;B4BDE9
    %AICMD0x12_Jump($B4BE04)                                   ;B4BDF0
B4BDF3:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown2, $03, $B4BDFD) ;B4BDF3
    %AICMD0x12_Jump($B4BE04)                                   ;B4BDFA
B4BDFD:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown2, $04, $B4BE74) ;B4BDFD
B4BE04:
    %AICMD0x08_EnableAIControl()                               ;B4BE04
    %AICMD0x13_Wait(1)                                         ;B4BE05
    %AICMD0x2C($19, $0006, $005A)                              ;B4BE08
    %AICMD0x11_EnableUserControl()                             ;B4BE0E
    %AICMD0x1C_ShowDialog($02E7, $00)                          ;B4BE0F
    %AICMD0x15_JumpIfEquals8($8009B2, 1, $B4BE36)              ;B4BE13
    %AICMD0x15_JumpIfEquals8($8009B2, 2, $B4BE3E)              ;B4BE1A
    %AICMD0x15_JumpIfEquals8($8009B2, 3, $B4BE46)              ;B4BE21
    %AICMD0x15_JumpIfEquals8($8009B2, 4, $B4BE4E)              ;B4BE28
    %AICMD0x15_JumpIfEquals8($8009B2, 5, $B4BE56)              ;B4BE2F
B4BE36:
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown3, $00)     ;B4BE36
    %AICMD0x12_Jump($B4BE5E)                                   ;B4BE3B
B4BE3E:
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown3, $01)     ;B4BE3E
    %AICMD0x12_Jump($B4BE5E)                                   ;B4BE43
B4BE46:
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown3, $02)     ;B4BE46
    %AICMD0x12_Jump($B4BE5E)                                   ;B4BE4B
B4BE4E:
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown3, $03)     ;B4BE4E
    %AICMD0x12_Jump($B4BE5E)                                   ;B4BE53
B4BE56:
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown3, $04)     ;B4BE56
    %AICMD0x12_Jump($B4BE5E)                                   ;B4BE5B
B4BE5E:
    %AICMD0x25($09)                                            ;B4BE5E
    %AICMD0x28(strcFlags.unknown1, $05)                        ;B4BE60
    %AICMD0x1B($0295, $00)                                     ;B4BE65
    %AICMD0x09($09, $B4BEF2)                                   ;B4BE69
    %AICMD0x09($0A, $B4BD68)                                   ;B4BE6D
    %AICMD0x12_Jump($B4BD7F)                                   ;B4BE71
B4BE74:
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown1, $04)     ;B4BE74
    %AICMD0x1C_ShowDialog($02E8, $00)                          ;B4BE79
    %AICMD0x10_End()                                           ;B4BE7D
B4BE7E:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown2, $00, $B4BE88) ;B4BE7E
    %AICMD0x12_Jump($B4BEAD)                                   ;B4BE85
B4BE88:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown2, $01, $B4BE92) ;B4BE88
    %AICMD0x12_Jump($B4BEAD)                                   ;B4BE8F
B4BE92:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown2, $02, $B4BE9C) ;B4BE92
    %AICMD0x12_Jump($B4BEAD)                                   ;B4BE99
B4BE9C:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown2, $03, $B4BEA6) ;B4BE9C
    %AICMD0x12_Jump($B4BEAD)                                   ;B4BEA3
B4BEA6:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown2, $04, $B4BE74) ;B4BEA6
B4BEAD:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $06, $B4BEC6) ;B4BEAD
    %AICMD0x08_EnableAIControl()                               ;B4BEB4
    %AICMD0x13_Wait(1)                                         ;B4BEB5
    %AICMD0x2C($19, $0006, $005A)                              ;B4BEB8
    %AICMD0x11_EnableUserControl()                             ;B4BEBE
    %AICMD0x1C_ShowDialog($02E9, $00)                          ;B4BEBF
    %AICMD0x12_Jump($B4BE13)                                   ;B4BEC3
B4BEC6:
    %AICMD0x28(strcFlags.unknown1, $06)                        ;B4BEC6
    %AICMD0x08_EnableAIControl()                               ;B4BECB
    %AICMD0x13_Wait(1)                                         ;B4BECC
    %AICMD0x2C($04, $0006, $005A)                              ;B4BECF
    %AICMD0x11_EnableUserControl()                             ;B4BED5
    %AICMD0x1C_ShowDialog($0390, $00)                          ;B4BED6
    %AICMD0x12_Jump($B4BE13)                                   ;B4BEDA
    %AICMD0x1A($0128, $01A8, $B38300, $00)                     ;B4BEDD
    %AICMD0x1F($B4BEEB)                                        ;B4BEE5
    %AICMD0x12_Jump($B4BEE5)                                   ;B4BEE8
B4BEEB:
    %AICMD0x1C_ShowDialog($02ED, $00)                          ;B4BEEB
    %AICMD0x12_Jump($B4BEE5)                                   ;B4BEEF
B4BEF2:
    %AICMD0x17($05)                                            ;B4BEF2
    %AICMD0x18($00, $B4BF0E)                                   ;B4BEF4
    %AICMD0x18($01, $B4BF2A)                                   ;B4BEF8
    %AICMD0x18($02, $B4BF46)                                   ;B4BEFC
    %AICMD0x18($03, $B4BF62)                                   ;B4BF00
    %AICMD0x18($04, $B4BF7E)                                   ;B4BF04
    %AICMD0x13_Wait(120)                                       ;B4BF08
    %AICMD0x0B($01)                                            ;B4BF0B
    %AICMD0x10_End()                                           ;B4BF0D
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown2, $00, $B4BF2A) ;B4BF0E
    %AICMD0x1A($0128, $01B0, $B385DC, $00)                     ;B4BF15
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown2, $00)     ;B4BF1D
    %AICMD0x47_SetValue8($8009B2, 1)                           ;B4BF22
    %AICMD0x12_Jump($B4BF08)                                   ;B4BF27
B4BF2A:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown2, $01, $B4BF46) ;B4BF2A
    %AICMD0x1A($0128, $01B0, $B385E8, $00)                     ;B4BF31
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown2, $01)     ;B4BF39
    %AICMD0x47_SetValue8($8009B2, 2)                           ;B4BF3E
    %AICMD0x12_Jump($B4BF08)                                   ;B4BF43
B4BF46:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown2, $02, $B4BF62) ;B4BF46
    %AICMD0x1A($0128, $01B0, $B385F4, $00)                     ;B4BF4D
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown2, $02)     ;B4BF55
    %AICMD0x47_SetValue8($8009B2, 3)                           ;B4BF5A
    %AICMD0x12_Jump($B4BF08)                                   ;B4BF5F
B4BF62:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown2, $03, $B4BF7E) ;B4BF62
    %AICMD0x1A($0128, $01B0, $B38600, $00)                     ;B4BF69
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown2, $03)     ;B4BF71
    %AICMD0x47_SetValue8($8009B2, 4)                           ;B4BF76
    %AICMD0x12_Jump($B4BF08)                                   ;B4BF7B
B4BF7E:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown2, $04, $B4BF0E) ;B4BF7E
    %AICMD0x1A($0128, $01B0, $B3860C, $00)                     ;B4BF85
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown2, $04)     ;B4BF8D
    %AICMD0x47_SetValue8($8009B2, 5)                           ;B4BF92
    %AICMD0x12_Jump($B4BF08)                                   ;B4BF97
    %AICMD0x17($02)                                            ;B4BF9A
    %AICMD0x18($00, $B4BFDB)                                   ;B4BF9C
    %AICMD0x18($01, $B4BFF2)                                   ;B4BFA0
    %AICMD0x10_End()                                           ;B4BFA4
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $0A, $B4BFDB)   ;B4BFA5
    %AICMD0x23_OrWithIndexedValue(strcFlags.event5, $0A)       ;B4BFAC
    %AICMD0x41_AddValue16(nStoredFeed, 30)                     ;B4BFB1
    %AICMD0x1C_ShowDialog($02EB, $00)                          ;B4BFB7
    %AICMD0x0B($00)                                            ;B4BFBB
    %AICMD0x12_Jump($B4BFA4)                                   ;B4BFBD
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $0B, $B4BFDB)   ;B4BFC0
    %AICMD0x23_OrWithIndexedValue(strcFlags.event5, $0B)       ;B4BFC7
    %AICMD0x41_AddValue16(nStoredFeed, 30)                     ;B4BFCC
    %AICMD0x1C_ShowDialog($02EB, $00)                          ;B4BFD2
    %AICMD0x0B($00)                                            ;B4BFD6
    %AICMD0x12_Jump($B4BFA4)                                   ;B4BFD8
B4BFDB:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $0C, $B4BFF2)   ;B4BFDB
    %AICMD0x23_OrWithIndexedValue(strcFlags.event5, $0C)       ;B4BFE2
    %AICMD0x41_AddValue16(nPlayerHappiness, 50)                ;B4BFE7
    %AICMD0x0B($00)                                            ;B4BFED
    %AICMD0x12_Jump($B4BFA4)                                   ;B4BFEF
B4BFF2:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $0D, $B4BFDB)   ;B4BFF2
    %AICMD0x23_OrWithIndexedValue(strcFlags.event5, $0D)       ;B4BFF9
    %AICMD0x0B($00)                                            ;B4BFFE
    %AICMD0x12_Jump($B4BFA4)                                   ;B4C000
B4C003:
    %AICMD0x1A($00E0, $0168, $B3836C, $00)                     ;B4C003
    %AICMD0x1F($B4C018)                                        ;B4C00B
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $03, $B4C01F) ;B4C00E
    %AICMD0x12_Jump($B4C00B)                                   ;B4C015
B4C018:
    %AICMD0x1C_ShowDialog($02E0, $00)                          ;B4C018
    %AICMD0x12_Jump($B4C00B)                                   ;B4C01C
B4C01F:
    %AICMD0x1B($02AE, $00)                                     ;B4C01F
    %AICMD0x0D($00, $FF, $40, $01)                             ;B4C023
    %AICMD0x1B($02B0, $01)                                     ;B4C028
    %AICMD0x0D($01, $00, $40, $01)                             ;B4C02C
    %AICMD0x13_Wait(30)                                        ;B4C031
    %AICMD0x1B($02B0, $00)                                     ;B4C034
    %AICMD0x0D($FF, $00, $40, $01)                             ;B4C038
    %AICMD0x1B($02AC, $00)                                     ;B4C03D
    %AICMD0x0D($00, $01, $40, $01)                             ;B4C041
    %AICMD0x13_Wait(60)                                        ;B4C046
    %AICMD0x12_Jump($B4C01F)                                   ;B4C049
    %AICMD0x1F($B4C052)                                        ;B4C04C
    %AICMD0x12_Jump($B4C04C)                                   ;B4C04F
B4C052:
    %AICMD0x1C_ShowDialog($02E0, $00)                          ;B4C052
    %AICMD0x12_Jump($B4C04C)                                   ;B4C056
    %AICMD0x1A($0158, $01B8, $B3836C, $03)                     ;B4C059
    %AICMD0x12_Jump($B4C064)                                   ;B4C061
B4C064:
    %AICMD0x1F($B4C06A)                                        ;B4C064
    %AICMD0x12_Jump($B4C064)                                   ;B4C067
B4C06A:
    %AICMD0x15_JumpIfEquals8($8009A8, 0, $B4C088)              ;B4C06A
    %AICMD0x15_JumpIfEquals8($8009A8, 1, $B4C088)              ;B4C071
    %AICMD0x15_JumpIfEquals8($8009A8, 2, $B4C088)              ;B4C078
    %AICMD0x1C_ShowDialog($02EF, $00)                          ;B4C07F
    %AICMD0x0B($03)                                            ;B4C083
    %AICMD0x12_Jump($B4C064)                                   ;B4C085
B4C088:
    %AICMD0x1C_ShowDialog($02EE, $00)                          ;B4C088
    %AICMD0x0B($03)                                            ;B4C08C
    %AICMD0x12_Jump($B4C064)                                   ;B4C08E
B4C091:
    %AICMD0x1A($0170, $0168, $B38348, $00)                     ;B4C091
    %AICMD0x1F($B4C0AC)                                        ;B4C099
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $03, $B4C0B3) ;B4C09C
    %AICMD0x12_Jump($B4C099)                                   ;B4C0A3
    %AICMD0x13_Wait(1)                                         ;B4C0A6
    %AICMD0x12_Jump($B4C0A6)                                   ;B4C0A9
B4C0AC:
    %AICMD0x1C_ShowDialog($02E1, $00)                          ;B4C0AC
    %AICMD0x12_Jump($B4C099)                                   ;B4C0B0
B4C0B3:
    %AICMD0x0D($00, $01, $20, $01)                             ;B4C0B3
    %AICMD0x22($10, $08, $01, $B38348, $08)                    ;B4C0B8
    %AICMD0x12_Jump($B4C0A6)                                   ;B4C0BF
    %AICMD0x1A($0168, $0178, $B38348, $00)                     ;B4C0C2
    %AICMD0x12_Jump($B4C0CD)                                   ;B4C0CA
B4C0CD:
    %AICMD0x1F($B4C0D3)                                        ;B4C0CD
    %AICMD0x12_Jump($B4C0CD)                                   ;B4C0D0
B4C0D3:
    %AICMD0x1C_ShowDialog($02F0, $00)                          ;B4C0D3
    %AICMD0x0B($04)                                            ;B4C0D7
    %AICMD0x12_Jump($B4C0CD)                                   ;B4C0D9
B4C0DC:
    %AICMD0x1A($0118, $0270, $B3842C, $02)                     ;B4C0DC
    %AICMD0x1F($B4C0F7)                                        ;B4C0E4
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $03, $B4C105) ;B4C0E7
    %AICMD0x12_Jump($B4C0E4)                                   ;B4C0EE
    %AICMD0x1F($B4C0FE)                                        ;B4C0F1
    %AICMD0x12_Jump($B4C0F1)                                   ;B4C0F4
B4C0F7:
    %AICMD0x1C_ShowDialog($02E2, $00)                          ;B4C0F7
    %AICMD0x12_Jump($B4C0E4)                                   ;B4C0FB
B4C0FE:
    %AICMD0x1C_ShowDialog($02E2, $00)                          ;B4C0FE
    %AICMD0x12_Jump($B4C0F1)                                   ;B4C102
B4C105:
    %AICMD0x0D($01, $00, $20, $01)                             ;B4C105
    %AICMD0x1B($02D3, $00)                                     ;B4C10A
    %AICMD0x0D($00, $01, $60, $01)                             ;B4C10E
    %AICMD0x1B($02D7, $00)                                     ;B4C113
    %AICMD0x0D($FF, $00, $A0, $01)                             ;B4C117
    %AICMD0x22($20, $20, $01, $B3842C, $10)                    ;B4C11C
    %AICMD0x12_Jump($B4C0F1)                                   ;B4C123
    %AICMD0x1A($0108, $01B8, $B38420, $01)                     ;B4C126
    %AICMD0x12_Jump($B4C131)                                   ;B4C12E
B4C131:
    %AICMD0x1F($B4C137)                                        ;B4C131
    %AICMD0x12_Jump($B4C131)                                   ;B4C134
B4C137:
    %AICMD0x1C_ShowDialog($02F1, $00)                          ;B4C137
    %AICMD0x0B($05)                                            ;B4C13B
    %AICMD0x12_Jump($B4C131)                                   ;B4C13D
B4C140:
    %AICMD0x1A($0138, $0298, $B38390, $00)                     ;B4C140
    %AICMD0x1F($B4C15B)                                        ;B4C148
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $03, $B4C162) ;B4C14B
    %AICMD0x12_Jump($B4C148)                                   ;B4C152
    %AICMD0x13_Wait(1)                                         ;B4C155
    %AICMD0x12_Jump($B4C155)                                   ;B4C158
B4C15B:
    %AICMD0x1C_ShowDialog($02E3, $00)                          ;B4C15B
    %AICMD0x12_Jump($B4C148)                                   ;B4C15F
B4C162:
    %AICMD0x0D($00, $01, $50, $01)                             ;B4C162
    %AICMD0x1B($02B6, $01)                                     ;B4C167
    %AICMD0x0D($01, $00, $60, $01)                             ;B4C16B
    %AICMD0x22($18, $20, $01, $B38390, $10)                    ;B4C170
    %AICMD0x12_Jump($B4C0F1)                                   ;B4C177
    %AICMD0x1A($0138, $0218, $B38384, $01)                     ;B4C17A
    %AICMD0x1F($B4C188)                                        ;B4C182
    %AICMD0x12_Jump($B4C182)                                   ;B4C185
B4C188:
    %AICMD0x1C_ShowDialog($02F1, $00)                          ;B4C188
    %AICMD0x0B($06)                                            ;B4C18C
    %AICMD0x12_Jump($B4C182)                                   ;B4C18E
B4C191:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $01, $B4C1A3)   ;B4C191
    %AICMD0x1A($00D8, $0228, $B381A4, $01)                     ;B4C198
    %AICMD0x12_Jump($B4C1B2)                                   ;B4C1A0
B4C1A3:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event6, $04, $B4C23A)   ;B4C1A3
    %AICMD0x1A($00D8, $0228, $B3845C, $01)                     ;B4C1AA
B4C1B2:
    %AICMD0x1F($B4C1C5)                                        ;B4C1B2
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $03, $B4C1CC) ;B4C1B5
    %AICMD0x12_Jump($B4C1B2)                                   ;B4C1BC
    %AICMD0x13_Wait(1)                                         ;B4C1BF
    %AICMD0x12_Jump($B4C1BF)                                   ;B4C1C2
B4C1C5:
    %AICMD0x1C_ShowDialog($02E4, $00)                          ;B4C1C5
    %AICMD0x12_Jump($B4C1B2)                                   ;B4C1C9
B4C1CC:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $01, $B4C1E6)   ;B4C1CC
    %AICMD0x1B($022B, $01)                                     ;B4C1D3
    %AICMD0x0D($01, $00, $84, $01)                             ;B4C1D7
    %AICMD0x22($20, $20, $01, $B381A4, $10)                    ;B4C1DC
    %AICMD0x12_Jump($B4C1BF)                                   ;B4C1E3
B4C1E6:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event6, $04, $B4C23A)   ;B4C1E6
    %AICMD0x22($20, $20, $01, $B38474, $10)                    ;B4C1ED
    %AICMD0x12_Jump($B4C1BF)                                   ;B4C1F4
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $01, $B4C209)   ;B4C1F7
    %AICMD0x1A($0178, $01D8, $B38198, $00)                     ;B4C1FE
    %AICMD0x12_Jump($B4C218)                                   ;B4C206
B4C209:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event6, $04, $B4C23A)   ;B4C209
    %AICMD0x1A($0178, $01D8, $B3845C, $00)                     ;B4C210
B4C218:
    %AICMD0x1F($B4C224)                                        ;B4C218
    %AICMD0x12_Jump($B4C218)                                   ;B4C21B
    %AICMD0x1F($B4C233)                                        ;B4C21E
    %AICMD0x12_Jump($B4C21E)                                   ;B4C221
B4C224:
    %AICMD0x1C_ShowDialog($02F2, $00)                          ;B4C224
    %AICMD0x41_AddValue16(nLove_Ann, 10)                       ;B4C228
    %AICMD0x0B($07)                                            ;B4C22E
    %AICMD0x12_Jump($B4C21E)                                   ;B4C230
B4C233:
    %AICMD0x1C_ShowDialog($02F1, $00)                          ;B4C233
    %AICMD0x12_Jump($B4C21E)                                   ;B4C237
B4C23A:
    %AICMD0x10_End()                                           ;B4C23A
B4C23B:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, $B4C24D)   ;B4C23B
    %AICMD0x1A($00C8, $0218, $B381D4, $02)                     ;B4C242
    %AICMD0x12_Jump($B4C25C)                                   ;B4C24A
B4C24D:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event6, $04, $B4C2E7)   ;B4C24D
    %AICMD0x1A($00C8, $0218, $B3845C, $00)                     ;B4C254
B4C25C:
    %AICMD0x1F($B4C26F)                                        ;B4C25C
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $03, $B4C276) ;B4C25F
    %AICMD0x12_Jump($B4C25C)                                   ;B4C266
    %AICMD0x13_Wait(1)                                         ;B4C269
    %AICMD0x12_Jump($B4C269)                                   ;B4C26C
B4C26F:
    %AICMD0x1C_ShowDialog($02E5, $00)                          ;B4C26F
    %AICMD0x12_Jump($B4C25C)                                   ;B4C273
B4C276:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, $B4C293)   ;B4C276
    %AICMD0x13_Wait(80)                                        ;B4C27D
    %AICMD0x1B($0250, $01)                                     ;B4C280
    %AICMD0x0D($01, $00, $40, $01)                             ;B4C284
    %AICMD0x22($20, $18, $01, $B381D4, $10)                    ;B4C289
    %AICMD0x12_Jump($B4C269)                                   ;B4C290
B4C293:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event6, $04, $B4C2E7)   ;B4C293
    %AICMD0x22($20, $20, $01, $B38474, $00)                    ;B4C29A
    %AICMD0x12_Jump($B4C269)                                   ;B4C2A1
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, $B4C2B6)   ;B4C2A4
    %AICMD0x1A($0168, $01D8, $B381C8, $00)                     ;B4C2AB
    %AICMD0x12_Jump($B4C2C5)                                   ;B4C2B3
B4C2B6:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event6, $04, $B4C2E7)   ;B4C2B6
    %AICMD0x1A($0168, $01D8, $B3845C, $00)                     ;B4C2BD
B4C2C5:
    %AICMD0x1F($B4C2D1)                                        ;B4C2C5
    %AICMD0x12_Jump($B4C2C5)                                   ;B4C2C8
    %AICMD0x1F($B4C2E0)                                        ;B4C2CB
    %AICMD0x12_Jump($B4C2CB)                                   ;B4C2CE
B4C2D1:
    %AICMD0x1C_ShowDialog($02F3, $00)                          ;B4C2D1
    %AICMD0x41_AddValue16(nLove_Nina, 10)                      ;B4C2D5
    %AICMD0x0B($08)                                            ;B4C2DB
    %AICMD0x12_Jump($B4C2CB)                                   ;B4C2DD
B4C2E0:
    %AICMD0x1C_ShowDialog($02F1, $00)                          ;B4C2E0
    %AICMD0x12_Jump($B4C21E)                                   ;B4C2E4
B4C2E7:
    %AICMD0x10_End()                                           ;B4C2E7
B4C2E8:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $03, $B4C2FA)   ;B4C2E8
    %AICMD0x1A($00D8, $0208, $B381EC, $00)                     ;B4C2EF
    %AICMD0x12_Jump($B4C309)                                   ;B4C2F7
B4C2FA:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event6, $04, $B4C3AD)   ;B4C2FA
    %AICMD0x1A($00D8, $0208, $B3845C, $00)                     ;B4C301
B4C309:
    %AICMD0x1F($B4C31C)                                        ;B4C309
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $03, $B4C323) ;B4C30C
    %AICMD0x12_Jump($B4C309)                                   ;B4C313
    %AICMD0x13_Wait(1)                                         ;B4C316
    %AICMD0x12_Jump($B4C316)                                   ;B4C319
B4C31C:
    %AICMD0x1C_ShowDialog($02E6, $00)                          ;B4C31C
    %AICMD0x12_Jump($B4C309)                                   ;B4C320
B4C323:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $03, $B4C359)   ;B4C323
    %AICMD0x1B($023F, $00)                                     ;B4C32A
    %AICMD0x0D($00, $FF, $40, $01)                             ;B4C32E
    %AICMD0x13_Wait(30)                                        ;B4C333
    %AICMD0x0D($00, $FF, $40, $01)                             ;B4C336
    %AICMD0x13_Wait(30)                                        ;B4C33B
    %AICMD0x0D($00, $FF, $40, $01)                             ;B4C33E
    %AICMD0x13_Wait(30)                                        ;B4C343
    %AICMD0x1B($0241, $00)                                     ;B4C346
    %AICMD0x0D($FF, $00, $A8, $01)                             ;B4C34A
    %AICMD0x22($18, $20, $01, $B381EC, $10)                    ;B4C34F
    %AICMD0x12_Jump($B4C316)                                   ;B4C356
B4C359:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event6, $04, $B4C3AD)   ;B4C359
    %AICMD0x22($20, $20, $01, $B38474, $10)                    ;B4C360
    %AICMD0x12_Jump($B4C316)                                   ;B4C367
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $03, $B4C37C)   ;B4C36A
    %AICMD0x1A($00F8, $01E8, $B381E0, $00)                     ;B4C371
    %AICMD0x12_Jump($B4C38B)                                   ;B4C379
B4C37C:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event6, $04, $B4C3AD)   ;B4C37C
    %AICMD0x1A($00F8, $01E8, $B3845C, $00)                     ;B4C383
B4C38B:
    %AICMD0x1F($B4C397)                                        ;B4C38B
    %AICMD0x12_Jump($B4C38B)                                   ;B4C38E
    %AICMD0x1F($B4C3A6)                                        ;B4C391
    %AICMD0x12_Jump($B4C391)                                   ;B4C394
B4C397:
    %AICMD0x1C_ShowDialog($02F4, $00)                          ;B4C397
    %AICMD0x41_AddValue16(nLove_Ellen, 10)                     ;B4C39B
    %AICMD0x0B($09)                                            ;B4C3A1
    %AICMD0x12_Jump($B4C391)                                   ;B4C3A3
B4C3A6:
    %AICMD0x1C_ShowDialog($02F1, $00)                          ;B4C3A6
    %AICMD0x12_Jump($B4C391)                                   ;B4C3AA
B4C3AD:
    %AICMD0x10_End()                                           ;B4C3AD


DATA8_B4C3AE:
 
    %AICMD0x4F()                                               ;B4C3AE
    %AICMD0x50()                                               ;B4C3AF
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $09)       ;B4C3B0
    %AICMD0x02_FreezeTime()                                    ;B4C3B5
    %AICMD0x03_SetHour($07)                                    ;B4C3B6
    %AICMD0x05_SetTransferPosition(296, 536)                   ;B4C3B8
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B4C3BD
    %AICMD0x09($01, $B4BEDD)                                   ;B4C3BF
    %AICMD0x09($02, $B4C059)                                   ;B4C3C3
    %AICMD0x09($03, $B4C0C2)                                   ;B4C3C7
    %AICMD0x09($04, $B4C126)                                   ;B4C3CB
    %AICMD0x09($05, $B4C17A)                                   ;B4C3CF
    %AICMD0x09($06, $B4C1F7)                                   ;B4C3D3
    %AICMD0x09($07, $B4C2A4)                                   ;B4C3D7
    %AICMD0x09($08, $B4C36A)                                   ;B4C3DB
    %AICMD0x08_EnableAIControl()                               ;B4C3DF
    %AICMD0x13_Wait(1)                                         ;B4C3E0
    %AICMD0x06_SetDestinationArea(!AREA_EGGFESTIVAL)           ;B4C3E3
    %AICMD0x38()                                               ;B4C3E5
    %AICMD0x13_Wait(1)                                         ;B4C3E6
    %AICMD0x15_JumpIfEquals8($8009A8, 3, $B4C405)              ;B4C3E9
    %AICMD0x15_JumpIfEquals8($8009A8, 4, $B4C405)              ;B4C3F0
    %AICMD0x15_JumpIfEquals8($8009A8, 5, $B4C405)              ;B4C3F7
    %AICMD0x1C_ShowDialog($038F, $00)                          ;B4C3FE
    %AICMD0x12_Jump($B4C415)                                   ;B4C402
B4C405:
    %AICMD0x1C_ShowDialog($02EA, $00)                          ;B4C405
    %AICMD0x41_AddValue16(nPlayerHappiness, 30)                ;B4C409
    %AICMD0x09($09, $B4BF9A)                                   ;B4C40F
    %AICMD0x0C($00)                                            ;B4C413
B4C415:
    %AICMD0x13_Wait(1)                                         ;B4C415
    %AICMD0x1C_ShowDialog($02EC, $00)                          ;B4C418
    %AICMD0x13_Wait(1)                                         ;B4C41C
    %AICMD0x1C_ShowDialog($02ED, $00)                          ;B4C41F
    %AICMD0x11_EnableUserControl()                             ;B4C423
    %AICMD0x13_Wait(650)                                       ;B4C424
    %AICMD0x3C()                                               ;B4C427
    %AICMD0x10_End()                                           ;B4C428


pAIScripting0x29:
    dw DATA8_B4C449                                            ;B4C429|        |B4C449;
    dw pAIScripting0x2A                                        ;B4C42B|        |B4C4BA;
    dw pAIScripting0x2A                                        ;B4C42D|        |B4C4BA;
    dw pAIScripting0x2A                                        ;B4C42F|        |B4C4BA;
    dw pAIScripting0x2A                                        ;B4C431|        |B4C4BA;
    dw pAIScripting0x2A                                        ;B4C433|        |B4C4BA;
    dw pAIScripting0x2A                                        ;B4C435|        |B4C4BA;
    dw pAIScripting0x2A                                        ;B4C437|        |B4C4BA;
    dw pAIScripting0x2A                                        ;B4C439|        |B4C4BA;
    dw pAIScripting0x2A                                        ;B4C43B|        |B4C4BA;
    dw pAIScripting0x2A                                        ;B4C43D|        |B4C4BA;
    dw pAIScripting0x2A                                        ;B4C43F|        |B4C4BA;
    dw pAIScripting0x2A                                        ;B4C441|        |B4C4BA;
    dw pAIScripting0x2A                                        ;B4C443|        |B4C4BA;
    dw pAIScripting0x2A                                        ;B4C445|        |B4C4BA;
    dw pAIScripting0x2A                                        ;B4C447|        |B4C4BA;
 
DATA8_B4C449:
 
    %AICMD0x09($01, $B4C44F)                                   ;B4C449
    %AICMD0x38()                                               ;B4C44D
    %AICMD0x10_End()                                           ;B4C44E
B4C44F:
    %AICMD0x15_JumpIfEquals8(nCurrentTimeID, 18, $B4C4B9)      ;B4C44F
    %AICMD0x1A($0068, $01A8, $B38384, $02)                     ;B4C456
    %AICMD0x2D($B4C47C, $B4C46E)                               ;B4C45E
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 18, 24, $B4C483) ;B4C463
    %AICMD0x12_Jump($B4C45E)                                   ;B4C46B
    %AICMD0x15_JumpIfEquals8($800924, 20, $B4C490)             ;B4C46E
    %AICMD0x1C_ShowDialog($041B, $00)                          ;B4C475
    %AICMD0x12_Jump($B4C45E)                                   ;B4C479
    %AICMD0x1C_ShowDialog($0418, $00)                          ;B4C47C
    %AICMD0x12_Jump($B4C45E)                                   ;B4C480
B4C483:
    %AICMD0x1C_ShowDialog($0419, $00)                          ;B4C483
    %AICMD0x41_AddValue16(nPlayerHappiness, -5)                ;B4C487
    %AICMD0x12_Jump($B4C4A4)                                   ;B4C48D
B4C490:
    %AICMD0x1C_ShowDialog($041A, $00)                          ;B4C490
    %AICMD0x42_AddValue24(nMoney, 2)                           ;B4C494
    %AICMD0x41_AddValue16(nPlayerHappiness, 30)                ;B4C49B
    %AICMD0x12_Jump($B4C4A4)                                   ;B4C4A1
B4C4A4:
    %AICMD0x23_OrWithIndexedValue(strcFlags.event4, $0B)       ;B4C4A4
    %AICMD0x28(strcFlags.event4, $0A)                          ;B4C4A9
    %AICMD0x1B($02B6, $00)                                     ;B4C4AE
    %AICMD0x0D($FF, $00, $60, $01)                             ;B4C4B2
    %AICMD0x37()                                               ;B4C4B7
    %AICMD0x10_End()                                           ;B4C4B8
B4C4B9:
    %AICMD0x10_End()                                           ;B4C4B9


pAIScripting0x2A:
    dw DATA8_B4C4DA                                            ;B4C4BA|        |B4C4DA;
    dw pAIScripting0x2B                                        ;B4C4BC|        |B4C506;
    dw pAIScripting0x2B                                        ;B4C4BE|        |B4C506;
    dw pAIScripting0x2B                                        ;B4C4C0|        |B4C506;
    dw pAIScripting0x2B                                        ;B4C4C2|        |B4C506;
    dw pAIScripting0x2B                                        ;B4C4C4|        |B4C506;
    dw pAIScripting0x2B                                        ;B4C4C6|        |B4C506;
    dw pAIScripting0x2B                                        ;B4C4C8|        |B4C506;
    dw pAIScripting0x2B                                        ;B4C4CA|        |B4C506;
    dw pAIScripting0x2B                                        ;B4C4CC|        |B4C506;
    dw pAIScripting0x2B                                        ;B4C4CE|        |B4C506;
    dw pAIScripting0x2B                                        ;B4C4D0|        |B4C506;
    dw pAIScripting0x2B                                        ;B4C4D2|        |B4C506;
    dw pAIScripting0x2B                                        ;B4C4D4|        |B4C506;
    dw pAIScripting0x2B                                        ;B4C4D6|        |B4C506;
    dw pAIScripting0x2B                                        ;B4C4D8|        |B4C506;
 
DATA8_B4C4DA:
 
    %AICMD0x1A($0218, $0078, $B387A4, $00)                     ;B4C4DA
    %AICMD0x13_Wait(1)                                         ;B4C4E2
    %AICMD0x1B($0305, $01)                                     ;B4C4E5
    %AICMD0x0D($01, $00, $50, $01)                             ;B4C4E9
    %AICMD0x1B($0304, $01)                                     ;B4C4EE
    %AICMD0x13_Wait(60)                                        ;B4C4F2
    %AICMD0x1B($0305, $01)                                     ;B4C4F5
    %AICMD0x0D($02, $00, $80, $01)                             ;B4C4F9
    %AICMD0x37()                                               ;B4C4FE
    %AICMD0x41_AddValue16(nPlayerHappiness, 10)                ;B4C4FF
    %AICMD0x10_End()                                           ;B4C505


pAIScripting0x2B:
    dw DATA8_B4C526                                            ;B4C506|        |B4C526;
    dw pAIScripting0x2C                                        ;B4C508|        |B4C54A;
    dw pAIScripting0x2C                                        ;B4C50A|        |B4C54A;
    dw pAIScripting0x2C                                        ;B4C50C|        |B4C54A;
    dw pAIScripting0x2C                                        ;B4C50E|        |B4C54A;
    dw pAIScripting0x2C                                        ;B4C510|        |B4C54A;
    dw pAIScripting0x2C                                        ;B4C512|        |B4C54A;
    dw pAIScripting0x2C                                        ;B4C514|        |B4C54A;
    dw pAIScripting0x2C                                        ;B4C516|        |B4C54A;
    dw pAIScripting0x2C                                        ;B4C518|        |B4C54A;
    dw pAIScripting0x2C                                        ;B4C51A|        |B4C54A;
    dw pAIScripting0x2C                                        ;B4C51C|        |B4C54A;
    dw pAIScripting0x2C                                        ;B4C51E|        |B4C54A;
    dw pAIScripting0x2C                                        ;B4C520|        |B4C54A;
    dw pAIScripting0x2C                                        ;B4C522|        |B4C54A;
    dw pAIScripting0x2C                                        ;B4C524|        |B4C54A;
 
DATA8_B4C526:
 
    %AICMD0x1A($0088, $0098, $B38798, $00)                     ;B4C526
    %AICMD0x13_Wait(1)                                         ;B4C52E
    %AICMD0x1B($0303, $00)                                     ;B4C531
    %AICMD0x0D($FF, $00, $30, $01)                             ;B4C535
    %AICMD0x13_Wait(60)                                        ;B4C53A
    %AICMD0x0D($FF, $00, $50, $01)                             ;B4C53D
    %AICMD0x37()                                               ;B4C542
    %AICMD0x41_AddValue16(nPlayerHappiness, 10)                ;B4C543
    %AICMD0x10_End()                                           ;B4C549


pAIScripting0x2C:
    dw DATA8_B4C56A                                            ;B4C54A|        |B4C56A;
    dw pAIScripting0x2D                                        ;B4C54C|        |B4C586;
    dw pAIScripting0x2D                                        ;B4C54E|        |B4C586;
    dw pAIScripting0x2D                                        ;B4C550|        |B4C586;
    dw pAIScripting0x2D                                        ;B4C552|        |B4C586;
    dw pAIScripting0x2D                                        ;B4C554|        |B4C586;
    dw pAIScripting0x2D                                        ;B4C556|        |B4C586;
    dw pAIScripting0x2D                                        ;B4C558|        |B4C586;
    dw pAIScripting0x2D                                        ;B4C55A|        |B4C586;
    dw pAIScripting0x2D                                        ;B4C55C|        |B4C586;
    dw pAIScripting0x2D                                        ;B4C55E|        |B4C586;
    dw pAIScripting0x2D                                        ;B4C560|        |B4C586;
    dw pAIScripting0x2D                                        ;B4C562|        |B4C586;
    dw pAIScripting0x2D                                        ;B4C564|        |B4C586;
    dw pAIScripting0x2D                                        ;B4C566|        |B4C586;
    dw pAIScripting0x2D                                        ;B4C568|        |B4C586;
 
DATA8_B4C56A:
 
    %AICMD0x1A($0228, $0258, $B387B0, $00)                     ;B4C56A
    %AICMD0x13_Wait(60)                                        ;B4C572
    %AICMD0x1B($0307, $01)                                     ;B4C575
    %AICMD0x0D($01, $00, $FF, $01)                             ;B4C579
    %AICMD0x37()                                               ;B4C57E
    %AICMD0x41_AddValue16(nPlayerHappiness, 10)                ;B4C57F
    %AICMD0x10_End()                                           ;B4C585


pAIScripting0x2D:
    dw DATA8_B4C5A6                                            ;B4C586|        |B4C5A6;
    dw pAIScripting0x2E                                        ;B4C588|        |B4C5F6;
    dw pAIScripting0x2E                                        ;B4C58A|        |B4C5F6;
    dw pAIScripting0x2E                                        ;B4C58C|        |B4C5F6;
    dw pAIScripting0x2E                                        ;B4C58E|        |B4C5F6;
    dw pAIScripting0x2E                                        ;B4C590|        |B4C5F6;
    dw pAIScripting0x2E                                        ;B4C592|        |B4C5F6;
    dw pAIScripting0x2E                                        ;B4C594|        |B4C5F6;
    dw pAIScripting0x2E                                        ;B4C596|        |B4C5F6;
    dw pAIScripting0x2E                                        ;B4C598|        |B4C5F6;
    dw pAIScripting0x2E                                        ;B4C59A|        |B4C5F6;
    dw pAIScripting0x2E                                        ;B4C59C|        |B4C5F6;
    dw pAIScripting0x2E                                        ;B4C59E|        |B4C5F6;
    dw pAIScripting0x2E                                        ;B4C5A0|        |B4C5F6;
    dw pAIScripting0x2E                                        ;B4C5A2|        |B4C5F6;
    dw pAIScripting0x2E                                        ;B4C5A4|        |B4C5F6;
 
DATA8_B4C5A6:
 
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B4C5A6
    %AICMD0x09($01, $B4C5B4)                                   ;B4C5A8
    %AICMD0x11_EnableUserControl()                             ;B4C5AC
    %AICMD0x38()                                               ;B4C5AD
    %AICMD0x13_Wait(1)                                         ;B4C5AE
    %AICMD0x12_Jump($B4C5AE)                                   ;B4C5B1
B4C5B4:
    %AICMD0x1A($0108, $001A, $B384EC, $00)                     ;B4C5B4
    %AICMD0x0D($01, $00, $08, $01)                             ;B4C5BC
    %AICMD0x0D($00, $FF, $06, $01)                             ;B4C5C1
    %AICMD0x0D($FF, $00, $08, $02)                             ;B4C5C6
    %AICMD0x0D($FF, $01, $04, $01)                             ;B4C5CB
    %AICMD0x0D($01, $00, $0C, $02)                             ;B4C5D0
    %AICMD0x0D($FF, $00, $06, $01)                             ;B4C5D5
    %AICMD0x0D($00, $FF, $10, $02)                             ;B4C5DA
    %AICMD0x0D($FF, $01, $04, $01)                             ;B4C5DF
    %AICMD0x0D($01, $01, $0C, $02)                             ;B4C5E4
    %AICMD0x0D($01, $00, $08, $02)                             ;B4C5E9
    %AICMD0x0D($00, $FF, $06, $01)                             ;B4C5EE
    %AICMD0x12_Jump($B4C5BC)                                   ;B4C5F3


pAIScripting0x2E:
    dw DATA8_B4C616                                            ;B4C5F6|        |B4C616;
    dw pAIScripting0x2F                                        ;B4C5F8|        |B4C6F3;
    dw pAIScripting0x2F                                        ;B4C5FA|        |B4C6F3;
    dw pAIScripting0x2F                                        ;B4C5FC|        |B4C6F3;
    dw pAIScripting0x2F                                        ;B4C5FE|        |B4C6F3;
    dw pAIScripting0x2F                                        ;B4C600|        |B4C6F3;
    dw pAIScripting0x2F                                        ;B4C602|        |B4C6F3;
    dw pAIScripting0x2F                                        ;B4C604|        |B4C6F3;
    dw pAIScripting0x2F                                        ;B4C606|        |B4C6F3;
    dw pAIScripting0x2F                                        ;B4C608|        |B4C6F3;
    dw pAIScripting0x2F                                        ;B4C60A|        |B4C6F3;
    dw pAIScripting0x2F                                        ;B4C60C|        |B4C6F3;
    dw pAIScripting0x2F                                        ;B4C60E|        |B4C6F3;
    dw pAIScripting0x2F                                        ;B4C610|        |B4C6F3;
    dw pAIScripting0x2F                                        ;B4C612|        |B4C6F3;
    dw pAIScripting0x2F                                        ;B4C614|        |B4C6F3;
 
DATA8_B4C616:
 
    %AICMD0x00_SetMusic($01, $B4)                              ;B4C616
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily3, $02)       ;B4C619
    %AICMD0x05_SetTransferPosition(136, 120)                   ;B4C61E
    %AICMD0x02_FreezeTime()                                    ;B4C623
    %AICMD0x03_SetHour($07)                                    ;B4C624
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4C626
    %AICMD0x08_EnableAIControl()                               ;B4C628
    %AICMD0x09($01, $B4C6B3)                                   ;B4C629
    %AICMD0x09($02, $B4C693)                                   ;B4C62D
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $00, $B4C657)   ;B4C631
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $01, $B4C657)   ;B4C638
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, $B4C657)   ;B4C63F
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $03, $B4C657)   ;B4C646
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $04, $B4C657)   ;B4C64D
    %AICMD0x12_Jump($B4C65B)                                   ;B4C654
B4C657:
    %AICMD0x09($03, $B4C6DA)                                   ;B4C657
B4C65B:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $07, $B4C673)   ;B4C65B
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $06, $B4C66E)   ;B4C662
    %AICMD0x06_SetDestinationArea(!AREA_HOUSE1)                ;B4C669
    %AICMD0x12_Jump($B4C678)                                   ;B4C66B
B4C66E:
    %AICMD0x06_SetDestinationArea(!AREA_HOUSE2)                ;B4C66E
    %AICMD0x12_Jump($B4C678)                                   ;B4C670
B4C673:
    %AICMD0x06_SetDestinationArea(!AREA_HOUSE3)                ;B4C673
    %AICMD0x12_Jump($B4C678)                                   ;B4C675
B4C678:
    %AICMD0x38()                                               ;B4C678
    %AICMD0x13_Wait(90)                                        ;B4C679
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 32)                  ;B4C67C
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 64)                  ;B4C680
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4C684
    %AICMD0x0B($00)                                            ;B4C686
    %AICMD0x13_Wait(90)                                        ;B4C688
    %AICMD0x0C($02)                                            ;B4C68B
    %AICMD0x13_Wait(60)                                        ;B4C68D
    %AICMD0x3D_TeleportToArea(!AREA_ENDING00)                  ;B4C690
    %AICMD0x10_End()                                           ;B4C692
B4C693:
    %AICMD0x1A($0088, $00B8, $B38438, $03)                     ;B4C693
    %AICMD0x0C($01)                                            ;B4C69B
    %AICMD0x13_Wait(30)                                        ;B4C69D
    %AICMD0x1B($02DC, $00)                                     ;B4C6A0
    %AICMD0x0D($FF, $00, $10, $01)                             ;B4C6A4
    %AICMD0x1B($02DE, $00)                                     ;B4C6A9
    %AICMD0x13_Wait(120)                                       ;B4C6AD
    %AICMD0x0B($02)                                            ;B4C6B0
    %AICMD0x10_End()                                           ;B4C6B2
B4C6B3:
    %AICMD0x1A($0078, $00B8, $B38450, $02)                     ;B4C6B3
    %AICMD0x0C($00)                                            ;B4C6BB
    %AICMD0x1B($02E0, $00)                                     ;B4C6BD
    %AICMD0x13_Wait(120)                                       ;B4C6C1
    %AICMD0x1B($02DF, $00)                                     ;B4C6C4
    %AICMD0x0D($00, $01, $10, $01)                             ;B4C6C8
    %AICMD0x13_Wait(20)                                        ;B4C6CD
    %AICMD0x0B($01)                                            ;B4C6D0
    %AICMD0x1B($02E0, $00)                                     ;B4C6D2
    %AICMD0x13_Wait(120)                                       ;B4C6D6
    %AICMD0x10_End()                                           ;B4C6D9
B4C6DA:
    %AICMD0x1A($00A8, $0078, $B38474, $00)                     ;B4C6DA
    %AICMD0x1B($02E7, $00)                                     ;B4C6E2
    %AICMD0x13_Wait(120)                                       ;B4C6E6
    %AICMD0x1B($02E3, $00)                                     ;B4C6E9
    %AICMD0x13_Wait(240)                                       ;B4C6ED
    %AICMD0x12_Jump($B4C6E2)                                   ;B4C6F0


pAIScripting0x2F:
    dw DATA8_B4C713                                            ;B4C6F3|        |B4C713;
    dw pAIScripting0x30                                        ;B4C6F5|        |B4C7C5;
    dw pAIScripting0x30                                        ;B4C6F7|        |B4C7C5;
    dw pAIScripting0x30                                        ;B4C6F9|        |B4C7C5;
    dw pAIScripting0x30                                        ;B4C6FB|        |B4C7C5;
    dw pAIScripting0x30                                        ;B4C6FD|        |B4C7C5;
    dw pAIScripting0x30                                        ;B4C6FF|        |B4C7C5;
    dw pAIScripting0x30                                        ;B4C701|        |B4C7C5;
    dw pAIScripting0x30                                        ;B4C703|        |B4C7C5;
    dw pAIScripting0x30                                        ;B4C705|        |B4C7C5;
    dw pAIScripting0x30                                        ;B4C707|        |B4C7C5;
    dw pAIScripting0x30                                        ;B4C709|        |B4C7C5;
    dw pAIScripting0x30                                        ;B4C70B|        |B4C7C5;
    dw pAIScripting0x30                                        ;B4C70D|        |B4C7C5;
    dw pAIScripting0x30                                        ;B4C70F|        |B4C7C5;
    dw pAIScripting0x30                                        ;B4C711|        |B4C7C5;
 
DATA8_B4C713:
 
    %AICMD0x00_SetMusic($11, $B4)                              ;B4C713
    %AICMD0x02_FreezeTime()                                    ;B4C716
    %AICMD0x03_SetHour($06)                                    ;B4C717
    %AICMD0x05_SetTransferPosition(136, 344)                   ;B4C719
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4C71E
    %AICMD0x08_EnableAIControl()                               ;B4C720
    %AICMD0x09($01, $B4C751)                                   ;B4C721
    %AICMD0x06_SetDestinationArea(!AREA_FARMSUMMER)            ;B4C725
    %AICMD0x38()                                               ;B4C727
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 32)                  ;B4C728
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B4C72C
    %AICMD0x13_Wait(90)                                        ;B4C72E
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4C731
    %AICMD0x13_Wait(120)                                       ;B4C733
    %AICMD0x0B($00)                                            ;B4C736
    %AICMD0x0C($01)                                            ;B4C738
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 48)                  ;B4C73A
    %AICMD0x40_DisableTileInteractions()                       ;B4C73E
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 68)                  ;B4C73F
    %AICMD0x13_Wait(70)                                        ;B4C743
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 44)                   ;B4C746
    %AICMD0x0B($02)                                            ;B4C74A
    %AICMD0x0C($03)                                            ;B4C74C
    %AICMD0x3D_TeleportToArea(!AREA_ENDING00)                  ;B4C74E
    %AICMD0x10_End()                                           ;B4C750
B4C751:
    %AICMD0x1A($0110, $0178, $B38114, $00)                     ;B4C751
    %AICMD0x0C($00)                                            ;B4C759
    %AICMD0x1B($01EC, $00)                                     ;B4C75B
    %AICMD0x0D($FF, $00, $78, $01)                             ;B4C75F
    %AICMD0x13_Wait(60)                                        ;B4C764
    %AICMD0x1B($01F2, $00)                                     ;B4C767
    %AICMD0x0B($01)                                            ;B4C76B
    %AICMD0x0C($02)                                            ;B4C76D
    %AICMD0x1B($01E9, $00)                                     ;B4C76F
    %AICMD0x0D($FF, $00, $40, $02)                             ;B4C773
    %AICMD0x1B($01DD, $00)                                     ;B4C778
    %AICMD0x13_Wait(60)                                        ;B4C77C
    %AICMD0x1B($01DA, $00)                                     ;B4C77F
    %AICMD0x0D($00, $01, $60, $02)                             ;B4C783
    %AICMD0x1B($01F2, $00)                                     ;B4C788
    %AICMD0x13_Wait(60)                                        ;B4C78C
    %AICMD0x1B($01E9, $00)                                     ;B4C78F
    %AICMD0x0D($FF, $00, $40, $02)                             ;B4C793
    %AICMD0x1B($01F2, $01)                                     ;B4C798
    %AICMD0x13_Wait(120)                                       ;B4C79C
    %AICMD0x1B($01E9, $01)                                     ;B4C79F
    %AICMD0x0D($01, $00, $20, $02)                             ;B4C7A3
    %AICMD0x1B($01E4, $00)                                     ;B4C7A8
    %AICMD0x13_Wait(60)                                        ;B4C7AC
    %AICMD0x1B($01EA, $01)                                     ;B4C7AF
    %AICMD0x13_Wait(80)                                        ;B4C7B3
    %AICMD0x1B($01EB, $01)                                     ;B4C7B6
    %AICMD0x13_Wait(180)                                       ;B4C7BA
    %AICMD0x0B($03)                                            ;B4C7BD
    %AICMD0x13_Wait(1)                                         ;B4C7BF
    %AICMD0x12_Jump($B4C7BF)                                   ;B4C7C2


pAIScripting0x30:
    dw DATA8_B4C7E5                                            ;B4C7C5|        |B4C7E5;
    dw pAIScripting0x31                                        ;B4C7C7|        |B4C9FB;
    dw pAIScripting0x31                                        ;B4C7C9|        |B4C9FB;
    dw pAIScripting0x31                                        ;B4C7CB|        |B4C9FB;
    dw pAIScripting0x31                                        ;B4C7CD|        |B4C9FB;
    dw pAIScripting0x31                                        ;B4C7CF|        |B4C9FB;
    dw pAIScripting0x31                                        ;B4C7D1|        |B4C9FB;
    dw pAIScripting0x31                                        ;B4C7D3|        |B4C9FB;
    dw pAIScripting0x31                                        ;B4C7D5|        |B4C9FB;
    dw pAIScripting0x31                                        ;B4C7D7|        |B4C9FB;
    dw pAIScripting0x31                                        ;B4C7D9|        |B4C9FB;
    dw pAIScripting0x31                                        ;B4C7DB|        |B4C9FB;
    dw pAIScripting0x31                                        ;B4C7DD|        |B4C9FB;
    dw pAIScripting0x31                                        ;B4C7DF|        |B4C9FB;
    dw pAIScripting0x31                                        ;B4C7E1|        |B4C9FB;
    dw pAIScripting0x31                                        ;B4C7E3|        |B4C9FB;
 
DATA8_B4C7E5:
 
    %AICMD0x00_SetMusic($10, $B4)                              ;B4C7E5
    %AICMD0x02_FreezeTime()                                    ;B4C7E8
    %AICMD0x03_SetHour($06)                                    ;B4C7E9
    %AICMD0x05_SetTransferPosition(65512, 120)                 ;B4C7EB
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4C7F0
    %AICMD0x40_DisableTileInteractions()                       ;B4C7F2
    %AICMD0x08_EnableAIControl()                               ;B4C7F3
    %AICMD0x09($01, $B4C9BC)                                   ;B4C7F4
    %AICMD0x09($02, $B4C864)                                   ;B4C7F8
    %AICMD0x09($03, $B4C89A)                                   ;B4C7FC
    %AICMD0x09($04, $B4C8D3)                                   ;B4C800
    %AICMD0x09($05, $B4C915)                                   ;B4C804
    %AICMD0x09($06, $B4C94B)                                   ;B4C808
    %AICMD0x09($07, $B4C973)                                   ;B4C80C
    %AICMD0x06_SetDestinationArea(!AREA_ENDING06)              ;B4C810
    %AICMD0x38()                                               ;B4C812
    %AICMD0x13_Wait(120)                                       ;B4C813
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 136)                ;B4C816
    %AICMD0x13_Wait(60)                                        ;B4C81A
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4C81D
    %AICMD0x19($0062, $00)                                     ;B4C81F
    %AICMD0x13_Wait(90)                                        ;B4C823
    %AICMD0x0B($00)                                            ;B4C826
    %AICMD0x19($0063, $00)                                     ;B4C828
    %AICMD0x13_Wait(90)                                        ;B4C82C
    %AICMD0x0B($01)                                            ;B4C82F
    %AICMD0x19($0060, $00)                                     ;B4C831
    %AICMD0x13_Wait(90)                                        ;B4C835
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4C838
    %AICMD0x13_Wait(30)                                        ;B4C83A
    %AICMD0x19($0026, $00)                                     ;B4C83D
    %AICMD0x13_Wait(120)                                       ;B4C841
    %AICMD0x19($0027, $00)                                     ;B4C844
    %AICMD0x13_Wait(90)                                        ;B4C848
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 32)                   ;B4C84B
    %AICMD0x19($0024, $00)                                     ;B4C84F
    %AICMD0x13_Wait(90)                                        ;B4C853
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 32)                  ;B4C856
    %AICMD0x19($0026, $00)                                     ;B4C85A
    %AICMD0x13_Wait(60)                                        ;B4C85E
    %AICMD0x3D_TeleportToArea(!AREA_ENDING00)                  ;B4C861
    %AICMD0x10_End()                                           ;B4C863
B4C864:
    %AICMD0x1A($00B8, $0058, $B38888, $03)                     ;B4C864
    %AICMD0x0C($00)                                            ;B4C86C
    %AICMD0x1B($018C, $00)                                     ;B4C86E
    %AICMD0x1B($019F, $00)                                     ;B4C872
    %AICMD0x0D($00, $01, $20, $01)                             ;B4C876
    %AICMD0x13_Wait(40)                                        ;B4C87B
    %AICMD0x1B($018B, $00)                                     ;B4C87E
    %AICMD0x0D($FF, $00, $36, $01)                             ;B4C882
    %AICMD0x13_Wait(60)                                        ;B4C887
    %AICMD0x2F($B380FC)                                        ;B4C88A
    %AICMD0x22($08, $04, $01, $B38108, $08)                    ;B4C88D
    %AICMD0x13_Wait(1)                                         ;B4C894
    %AICMD0x12_Jump($B4C894)                                   ;B4C897
B4C89A:
    %AICMD0x1A($0038, $0068, $B38870, $02)                     ;B4C89A
    %AICMD0x0C($00)                                            ;B4C8A2
    %AICMD0x1B($0190, $01)                                     ;B4C8A4
    %AICMD0x0C($01)                                            ;B4C8A8
    %AICMD0x1B($018C, $01)                                     ;B4C8AA
    %AICMD0x1B($019F, $00)                                     ;B4C8AE
    %AICMD0x0D($00, $01, $1C, $02)                             ;B4C8B2
    %AICMD0x13_Wait(20)                                        ;B4C8B7
    %AICMD0x1B($018B, $01)                                     ;B4C8BA
    %AICMD0x0D($01, $00, $4E, $02)                             ;B4C8BE
    %AICMD0x13_Wait(120)                                       ;B4C8C3
    %AICMD0x22($08, $08, $01, $B38108, $08)                    ;B4C8C6
    %AICMD0x13_Wait(1)                                         ;B4C8CD
    %AICMD0x12_Jump($B4C8CD)                                   ;B4C8D0
B4C8D3:
    %AICMD0x1A($0028, $00C8, $B38108, $01)                     ;B4C8D3
    %AICMD0x0C($01)                                            ;B4C8DB
    %AICMD0x13_Wait(10)                                        ;B4C8DD
    %AICMD0x1B($018B, $01)                                     ;B4C8E0
    %AICMD0x0D($01, $00, $20, $01)                             ;B4C8E4
    %AICMD0x13_Wait(30)                                        ;B4C8E9
    %AICMD0x1B($018B, $01)                                     ;B4C8EC
    %AICMD0x0D($01, $00, $36, $02)                             ;B4C8F0
    %AICMD0x13_Wait(30)                                        ;B4C8F5
    %AICMD0x1B($01A7, $00)                                     ;B4C8F8
    %AICMD0x0D($00, $FF, $42, $01)                             ;B4C8FC
    %AICMD0x1B($018B, $01)                                     ;B4C901
    %AICMD0x13_Wait(120)                                       ;B4C905
    %AICMD0x22($08, $04, $01, $B38108, $01)                    ;B4C908
    %AICMD0x13_Wait(1)                                         ;B4C90F
    %AICMD0x12_Jump($B4C90F)                                   ;B4C912
B4C915:
    %AICMD0x1A($0098, $0038, $B38888, $00)                     ;B4C915
    %AICMD0x0C($00)                                            ;B4C91D
    %AICMD0x13_Wait(20)                                        ;B4C91F
    %AICMD0x1B($019F, $00)                                     ;B4C922
    %AICMD0x0D($00, $01, $30, $01)                             ;B4C926
    %AICMD0x13_Wait(30)                                        ;B4C92B
    %AICMD0x1B($018B, $00)                                     ;B4C92E
    %AICMD0x0D($FF, $00, $3C, $02)                             ;B4C932
    %AICMD0x1B($0190, $00)                                     ;B4C937
    %AICMD0x13_Wait(120)                                       ;B4C93B
    %AICMD0x1B($0190, $00)                                     ;B4C93E
    %AICMD0x13_Wait(120)                                       ;B4C942
    %AICMD0x13_Wait(1)                                         ;B4C945
    %AICMD0x12_Jump($B4C945)                                   ;B4C948
B4C94B:
    %AICMD0x1A($00A8, $00A8, $B386FC, $03)                     ;B4C94B
    %AICMD0x0C($01)                                            ;B4C953
    %AICMD0x1B($01B0, $00)                                     ;B4C955
    %AICMD0x0D($FE, $00, $48, $03)                             ;B4C959
    %AICMD0x13_Wait(20)                                        ;B4C95E
    %AICMD0x1B($01B7, $00)                                     ;B4C961
    %AICMD0x0D($00, $FF, $4E, $03)                             ;B4C965
    %AICMD0x13_Wait(60)                                        ;B4C96A
    %AICMD0x13_Wait(1)                                         ;B4C96D
    %AICMD0x12_Jump($B4C96D)                                   ;B4C970
B4C973:
    %AICMD0x1A($0088, $00B8, $B386B4, $02)                     ;B4C973
    %AICMD0x0C($00)                                            ;B4C97B
    %AICMD0x13_Wait(60)                                        ;B4C97D
    %AICMD0x1B($01CA, $00)                                     ;B4C980
    %AICMD0x0D($FF, $00, $20, $01)                             ;B4C984
    %AICMD0x13_Wait(60)                                        ;B4C989
    %AICMD0x1B($01CA, $01)                                     ;B4C98C
    %AICMD0x0D($01, $00, $20, $01)                             ;B4C990
    %AICMD0x13_Wait(60)                                        ;B4C995
    %AICMD0x1B($01D8, $00)                                     ;B4C998
    %AICMD0x0D($00, $FF, $38, $02)                             ;B4C99C
    %AICMD0x13_Wait(60)                                        ;B4C9A1
    %AICMD0x1B($01CA, $01)                                     ;B4C9A4
    %AICMD0x0D($01, $00, $40, $02)                             ;B4C9A8
    %AICMD0x0B($02)                                            ;B4C9AD
    %AICMD0x1B($01D0, $01)                                     ;B4C9AF
    %AICMD0x13_Wait(120)                                       ;B4C9B3
    %AICMD0x13_Wait(1)                                         ;B4C9B6
    %AICMD0x12_Jump($B4C9B6)                                   ;B4C9B9
B4C9BC:
    %AICMD0x1A($0038, $00A0, $B389A8, $02)                     ;B4C9BC
    %AICMD0x0C($00)                                            ;B4C9C4
    %AICMD0x1B($01F5, $01)                                     ;B4C9C6
    %AICMD0x13_Wait(120)                                       ;B4C9CA
    %AICMD0x1B($01F4, $01)                                     ;B4C9CD
    %AICMD0x1B($01F3, $01)                                     ;B4C9D1
    %AICMD0x13_Wait(120)                                       ;B4C9D5
    %AICMD0x1B($01E8, $01)                                     ;B4C9D8
    %AICMD0x0C($02)                                            ;B4C9DC
    %AICMD0x1B($01EC, $01)                                     ;B4C9DE
    %AICMD0x0D($01, $00, $60, $01)                             ;B4C9E2
    %AICMD0x1B($01F2, $01)                                     ;B4C9E7
    %AICMD0x13_Wait(90)                                        ;B4C9EB
    %AICMD0x1B($01EE, $01)                                     ;B4C9EE
    %AICMD0x13_Wait(120)                                       ;B4C9F2
    %AICMD0x13_Wait(1)                                         ;B4C9F5
    %AICMD0x12_Jump($B4C9F5)                                   ;B4C9F8


pAIScripting0x31:
    dw DATA8_B4CA1B                                            ;B4C9FB|        |B4CA1B;
    dw pAIScripting0x32                                        ;B4C9FD|        |B4CB41;
    dw pAIScripting0x32                                        ;B4C9FF|        |B4CB41;
    dw pAIScripting0x32                                        ;B4CA01|        |B4CB41;
    dw pAIScripting0x32                                        ;B4CA03|        |B4CB41;
    dw pAIScripting0x32                                        ;B4CA05|        |B4CB41;
    dw pAIScripting0x32                                        ;B4CA07|        |B4CB41;
    dw pAIScripting0x32                                        ;B4CA09|        |B4CB41;
    dw pAIScripting0x32                                        ;B4CA0B|        |B4CB41;
    dw pAIScripting0x32                                        ;B4CA0D|        |B4CB41;
    dw pAIScripting0x32                                        ;B4CA0F|        |B4CB41;
    dw pAIScripting0x32                                        ;B4CA11|        |B4CB41;
    dw pAIScripting0x32                                        ;B4CA13|        |B4CB41;
    dw pAIScripting0x32                                        ;B4CA15|        |B4CB41;
    dw pAIScripting0x32                                        ;B4CA17|        |B4CB41;
    dw pAIScripting0x32                                        ;B4CA19|        |B4CB41;
 
DATA8_B4CA1B:
 
    %AICMD0x00_SetMusic($10, $B4)                              ;B4CA1B
    %AICMD0x05_SetTransferPosition(65520, 104)                 ;B4CA1E
    %AICMD0x02_FreezeTime()                                    ;B4CA23
    %AICMD0x03_SetHour($06)                                    ;B4CA24
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4CA26
    %AICMD0x40_DisableTileInteractions()                       ;B4CA28
    %AICMD0x08_EnableAIControl()                               ;B4CA29
    %AICMD0x09($01, $B4CAA8)                                   ;B4CA2A
    %AICMD0x09($02, $B4CAE2)                                   ;B4CA2E
    %AICMD0x09($03, $B4CB17)                                   ;B4CA32
    %AICMD0x09($04, $B4CB2C)                                   ;B4CA36
    %AICMD0x06_SetDestinationArea(!AREA_ENDING06)              ;B4CA3A
    %AICMD0x38()                                               ;B4CA3C
    %AICMD0x13_Wait(120)                                       ;B4CA3D
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 120)                ;B4CA40
    %AICMD0x13_Wait(30)                                        ;B4CA44
    %AICMD0x19($007A, $01)                                     ;B4CA47
    %AICMD0x13_Wait(90)                                        ;B4CA4B
    %AICMD0x3E_SetCarryItem($16)                               ;B4CA4E
    %AICMD0x0B($00)                                            ;B4CA50
    %AICMD0x13_Wait(90)                                        ;B4CA52
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4CA55
    %AICMD0x13_Wait(30)                                        ;B4CA57
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 16)                  ;B4CA5A
    %AICMD0x13_Wait(60)                                        ;B4CA5E
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 128)                 ;B4CA61
    %AICMD0x3F_ThrowCarriedItem()                              ;B4CA65
    %AICMD0x13_Wait(180)                                       ;B4CA66
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 144)                ;B4CA69
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B4CA6D
    %AICMD0x13_Wait(30)                                        ;B4CA6F
    %AICMD0x19($0065, $00)                                     ;B4CA72
    %AICMD0x13_Wait(90)                                        ;B4CA76
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 16)                  ;B4CA79
    %AICMD0x13_Wait(10)                                        ;B4CA7D
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 16)                    ;B4CA80
    %AICMD0x13_Wait(10)                                        ;B4CA84
    %AICMD0x19($0066, $01)                                     ;B4CA87
    %AICMD0x13_Wait(90)                                        ;B4CA8B
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4CA8E
    %AICMD0x0B($01)                                            ;B4CA90
    %AICMD0x13_Wait(90)                                        ;B4CA92
    %AICMD0x0C($02)                                            ;B4CA95
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 16)                  ;B4CA97
    %AICMD0x13_Wait(30)                                        ;B4CA9B
    %AICMD0x19($003D, $00)                                     ;B4CA9E
    %AICMD0x13_Wait(300)                                       ;B4CAA2
    %AICMD0x3D_TeleportToArea(!AREA_ENDING00)                  ;B4CAA5
    %AICMD0x10_End()                                           ;B4CAA7
B4CAA8:
    %AICMD0x1A($FFF0, $0088, $B38114, $02)                     ;B4CAA8
    %AICMD0x0C($00)                                            ;B4CAB0
    %AICMD0x1B($01EC, $01)                                     ;B4CAB2
    %AICMD0x0D($01, $00, $58, $01)                             ;B4CAB6
    %AICMD0x13_Wait(90)                                        ;B4CABB
    %AICMD0x1B($01F8, $01)                                     ;B4CABE
    %AICMD0x13_Wait(120)                                       ;B4CAC2
    %AICMD0x1B($01E9, $01)                                     ;B4CAC5
    %AICMD0x0D($01, $00, $10, $01)                             ;B4CAC9
    %AICMD0x13_Wait(60)                                        ;B4CACE
    %AICMD0x1B($01EA, $01)                                     ;B4CAD1
    %AICMD0x13_Wait(180)                                       ;B4CAD5
    %AICMD0x1B($01EB, $01)                                     ;B4CAD8
    %AICMD0x13_Wait(90)                                        ;B4CADC
    %AICMD0x12_Jump($B4CAD1)                                   ;B4CADF
B4CAE2:
    %AICMD0x1A($0078, $006C, $B38870, $02)                     ;B4CAE2
    %AICMD0x13_Wait(540)                                       ;B4CAEA
    %AICMD0x1B($0190, $01)                                     ;B4CAED
    %AICMD0x13_Wait(180)                                       ;B4CAF1
    %AICMD0x1B($0194, $01)                                     ;B4CAF4
    %AICMD0x13_Wait(180)                                       ;B4CAF8
    %AICMD0x1B($0193, $01)                                     ;B4CAFB
    %AICMD0x13_Wait(180)                                       ;B4CAFF
    %AICMD0x1B($018C, $01)                                     ;B4CB02
    %AICMD0x0C($01)                                            ;B4CB06
    %AICMD0x1B($0191, $01)                                     ;B4CB08
    %AICMD0x13_Wait(180)                                       ;B4CB0C
    %AICMD0x0B($02)                                            ;B4CB0F
    %AICMD0x13_Wait(1)                                         ;B4CB11
    %AICMD0x12_Jump($B4CB11)                                   ;B4CB14
B4CB17:
    %AICMD0x1A($00A0, $0088, $B38144, $00)                     ;B4CB17
    %AICMD0x22($18, $18, $01, $B38144, $0C)                    ;B4CB1F
    %AICMD0x13_Wait(1)                                         ;B4CB26
    %AICMD0x12_Jump($B4CB26)                                   ;B4CB29
B4CB2C:
    %AICMD0x1A($0098, $00A8, $B38150, $00)                     ;B4CB2C
    %AICMD0x22($18, $18, $01, $B38150, $0C)                    ;B4CB34
    %AICMD0x13_Wait(1)                                         ;B4CB3B
    %AICMD0x12_Jump($B4CB3B)                                   ;B4CB3E


pAIScripting0x32:
    dw DATA8_B4CB61                                            ;B4CB41|        |B4CB61;
    dw pAIScripting0x33                                        ;B4CB43|        |B4CD58;
    dw pAIScripting0x33                                        ;B4CB45|        |B4CD58;
    dw pAIScripting0x33                                        ;B4CB47|        |B4CD58;
    dw pAIScripting0x33                                        ;B4CB49|        |B4CD58;
    dw pAIScripting0x33                                        ;B4CB4B|        |B4CD58;
    dw pAIScripting0x33                                        ;B4CB4D|        |B4CD58;
    dw pAIScripting0x33                                        ;B4CB4F|        |B4CD58;
    dw pAIScripting0x33                                        ;B4CB51|        |B4CD58;
    dw pAIScripting0x33                                        ;B4CB53|        |B4CD58;
    dw pAIScripting0x33                                        ;B4CB55|        |B4CD58;
    dw pAIScripting0x33                                        ;B4CB57|        |B4CD58;
    dw pAIScripting0x33                                        ;B4CB59|        |B4CD58;
    dw pAIScripting0x33                                        ;B4CB5B|        |B4CD58;
    dw pAIScripting0x33                                        ;B4CB5D|        |B4CD58;
    dw pAIScripting0x33                                        ;B4CB5F|        |B4CD58;
 
DATA8_B4CB61:
 
    %AICMD0x00_SetMusic($10, $B4)                              ;B4CB61
    %AICMD0x02_FreezeTime()                                    ;B4CB64
    %AICMD0x03_SetHour($06)                                    ;B4CB65
    %AICMD0x05_SetTransferPosition(128, 200)                   ;B4CB67
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B4CB6C
    %AICMD0x08_EnableAIControl()                               ;B4CB6E
    %AICMD0x09($01, $B4CC3B)                                   ;B4CB6F
    %AICMD0x09($02, $B4CC75)                                   ;B4CB73
    %AICMD0x09($03, $B4CCA9)                                   ;B4CB77
    %AICMD0x09($04, $B4CCDF)                                   ;B4CB7B
    %AICMD0x09($05, $B4CD14)                                   ;B4CB7F
    %AICMD0x09($06, $B4CD43)                                   ;B4CB83
    %AICMD0x09($07, $B4CC21)                                   ;B4CB87
    %AICMD0x09($08, $B4CC2D)                                   ;B4CB8B
    %AICMD0x3B($14)                                            ;B4CB8F
    %AICMD0x06_SetDestinationArea(!AREA_COOP)                  ;B4CB91
    %AICMD0x38()                                               ;B4CB93
    %AICMD0x13_Wait(30)                                        ;B4CB94
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 16)                     ;B4CB97
    %AICMD0x13_Wait(10)                                        ;B4CB9B
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 51)                   ;B4CB9E
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4CBA2
    %AICMD0x13_Wait(30)                                        ;B4CBA4
    %AICMD0x3F_ThrowCarriedItem()                              ;B4CBA7
    %AICMD0x13_Wait(60)                                        ;B4CBA8
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 16)                    ;B4CBAB
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 47)                  ;B4CBAF
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 24)                    ;B4CBB3
    %AICMD0x13_Wait(30)                                        ;B4CBB7
    %AICMD0x3E_SetCarryItem($14)                               ;B4CBBA
    %AICMD0x0B($02)                                            ;B4CBBC
    %AICMD0x13_Wait(30)                                        ;B4CBBE
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 16)                    ;B4CBC1
    %AICMD0x13_Wait(20)                                        ;B4CBC5
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4CBC8
    %AICMD0x13_Wait(20)                                        ;B4CBCA
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 21)                   ;B4CBCD
    %AICMD0x3F_ThrowCarriedItem()                              ;B4CBD1
    %AICMD0x13_Wait(30)                                        ;B4CBD2
    %AICMD0x0B($00)                                            ;B4CBD5
    %AICMD0x0C($01)                                            ;B4CBD7
    %AICMD0x19($0042, $00)                                     ;B4CBD9
    %AICMD0x13_Wait(40)                                        ;B4CBDD
    %AICMD0x19($0026, $00)                                     ;B4CBE0
    %AICMD0x13_Wait(60)                                        ;B4CBE4
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 64)                   ;B4CBE7
    %AICMD0x0B($03)                                            ;B4CBEB
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4CBED
    %AICMD0x13_Wait(60)                                        ;B4CBEF
    %AICMD0x19($0026, $00)                                     ;B4CBF2
    %AICMD0x13_Wait(60)                                        ;B4CBF6
    %AICMD0x3E_SetCarryItem($25)                               ;B4CBF9
    %AICMD0x13_Wait(30)                                        ;B4CBFB
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 64)                  ;B4CBFE
    %AICMD0x13_Wait(60)                                        ;B4CC02
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 64)                   ;B4CC05
    %AICMD0x13_Wait(60)                                        ;B4CC09
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 64)                     ;B4CC0C
    %AICMD0x13_Wait(60)                                        ;B4CC10
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 40)                  ;B4CC13
    %AICMD0x13_Wait(20)                                        ;B4CC17
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 24)                   ;B4CC1A
    %AICMD0x3D_TeleportToArea(!AREA_ENDING00)                  ;B4CC1E
    %AICMD0x10_End()                                           ;B4CC20
B4CC21:
    %AICMD0x1A($0078, $0088, $B3815C, $00)                     ;B4CC21
    %AICMD0x0C($02)                                            ;B4CC29
    %AICMD0x37()                                               ;B4CC2B
    %AICMD0x10_End()                                           ;B4CC2C
B4CC2D:
    %AICMD0x1A($0048, $0060, $B3815C, $00)                     ;B4CC2D
    %AICMD0x13_Wait(1)                                         ;B4CC35
    %AICMD0x12_Jump($B4CC35)                                   ;B4CC38
B4CC3B:
    %AICMD0x1A($00C0, $0048, $B3893C, $00)                     ;B4CC3B
    %AICMD0x0C($00)                                            ;B4CC43
    %AICMD0x1B($0214, $00)                                     ;B4CC45
    %AICMD0x0D($FF, $00, $20, $01)                             ;B4CC49
    %AICMD0x0D($00, $01, $3A, $01)                             ;B4CC4E
    %AICMD0x0D($FF, $00, $42, $01)                             ;B4CC53
    %AICMD0x1B($0212, $00)                                     ;B4CC58
    %AICMD0x0B($01)                                            ;B4CC5C
    %AICMD0x0C($03)                                            ;B4CC5E
    %AICMD0x0D($FF, $00, $28, $01)                             ;B4CC60
    %AICMD0x2F($B38144)                                        ;B4CC65
    %AICMD0x22($10, $10, $01, $B38144, $04)                    ;B4CC68
    %AICMD0x13_Wait(1)                                         ;B4CC6F
    %AICMD0x12_Jump($B4CC6F)                                   ;B4CC72
B4CC75:
    %AICMD0x1A($00C8, $0078, $B38144, $03)                     ;B4CC75
    %AICMD0x0C($00)                                            ;B4CC7D
    %AICMD0x1B($0214, $00)                                     ;B4CC7F
    %AICMD0x0D($FF, $00, $20, $01)                             ;B4CC83
    %AICMD0x0D($FF, $01, $14, $01)                             ;B4CC88
    %AICMD0x0D($FF, $00, $38, $01)                             ;B4CC8D
    %AICMD0x0C($03)                                            ;B4CC92
    %AICMD0x13_Wait(60)                                        ;B4CC94
    %AICMD0x0D($FF, $00, $28, $01)                             ;B4CC97
    %AICMD0x22($10, $08, $01, $B38144, $04)                    ;B4CC9C
    %AICMD0x13_Wait(1)                                         ;B4CCA3
    %AICMD0x12_Jump($B4CCA3)                                   ;B4CCA6
B4CCA9:
    %AICMD0x1A($0038, $0050, $B38144, $02)                     ;B4CCA9
    %AICMD0x0C($00)                                            ;B4CCB1
    %AICMD0x1B($0212, $01)                                     ;B4CCB3
    %AICMD0x0D($00, $01, $18, $01)                             ;B4CCB7
    %AICMD0x13_Wait(10)                                        ;B4CCBC
    %AICMD0x0D($01, $01, $08, $01)                             ;B4CCBF
    %AICMD0x13_Wait(180)                                       ;B4CCC4
    %AICMD0x0C($03)                                            ;B4CCC7
    %AICMD0x1B($0214, $00)                                     ;B4CCC9
    %AICMD0x0D($FF, $00, $18, $01)                             ;B4CCCD
    %AICMD0x22($08, $08, $01, $B38144, $04)                    ;B4CCD2
    %AICMD0x13_Wait(1)                                         ;B4CCD9
    %AICMD0x12_Jump($B4CCD9)                                   ;B4CCDC
B4CCDF:
    %AICMD0x1A($0098, $00A8, $B38144, $00)                     ;B4CCDF
    %AICMD0x0C($00)                                            ;B4CCE7
    %AICMD0x1B($0212, $00)                                     ;B4CCE9
    %AICMD0x0D($FF, $00, $3C, $01)                             ;B4CCED
    %AICMD0x1B($0213, $00)                                     ;B4CCF2
    %AICMD0x0D($FF, $FF, $10, $01)                             ;B4CCF6
    %AICMD0x0C($03)                                            ;B4CCFB
    %AICMD0x0D($00, $FF, $08, $01)                             ;B4CCFD
    %AICMD0x0D($FF, $00, $20, $01)                             ;B4CD02
    %AICMD0x22($08, $08, $01, $B38144, $04)                    ;B4CD07
    %AICMD0x13_Wait(1)                                         ;B4CD0E
    %AICMD0x12_Jump($B4CD0E)                                   ;B4CD11
B4CD14:
    %AICMD0x1A($0088, $0078, $B38144, $01)                     ;B4CD14
    %AICMD0x0C($00)                                            ;B4CD1C
    %AICMD0x1B($0212, $00)                                     ;B4CD1E
    %AICMD0x0D($FF, $00, $30, $01)                             ;B4CD22
    %AICMD0x13_Wait(30)                                        ;B4CD27
    %AICMD0x0D($00, $01, $08, $01)                             ;B4CD2A
    %AICMD0x0C($03)                                            ;B4CD2F
    %AICMD0x0D($FF, $00, $20, $01)                             ;B4CD31
    %AICMD0x22($10, $08, $01, $B38144, $04)                    ;B4CD36
    %AICMD0x13_Wait(1)                                         ;B4CD3D
    %AICMD0x12_Jump($B4CD3D)                                   ;B4CD40
B4CD43:
    %AICMD0x1A($00B8, $0068, $B38150, $00)                     ;B4CD43
    %AICMD0x22($18, $18, $01, $B38150, $0C)                    ;B4CD4B
    %AICMD0x13_Wait(1)                                         ;B4CD52
    %AICMD0x12_Jump($B4CD52)                                   ;B4CD55


pAIScripting0x33:
    dw DATA8_B4CD78                                            ;B4CD58|        |B4CD78;
    dw pAIScripting0x34                                        ;B4CD5A|        |B4CECC;
    dw pAIScripting0x34                                        ;B4CD5C|        |B4CECC;
    dw pAIScripting0x34                                        ;B4CD5E|        |B4CECC;
    dw pAIScripting0x34                                        ;B4CD60|        |B4CECC;
    dw pAIScripting0x34                                        ;B4CD62|        |B4CECC;
    dw pAIScripting0x34                                        ;B4CD64|        |B4CECC;
    dw pAIScripting0x34                                        ;B4CD66|        |B4CECC;
    dw pAIScripting0x34                                        ;B4CD68|        |B4CECC;
    dw pAIScripting0x34                                        ;B4CD6A|        |B4CECC;
    dw pAIScripting0x34                                        ;B4CD6C|        |B4CECC;
    dw pAIScripting0x34                                        ;B4CD6E|        |B4CECC;
    dw pAIScripting0x34                                        ;B4CD70|        |B4CECC;
    dw pAIScripting0x34                                        ;B4CD72|        |B4CECC;
    dw pAIScripting0x34                                        ;B4CD74|        |B4CECC;
    dw pAIScripting0x34                                        ;B4CD76|        |B4CECC;
 
DATA8_B4CD78:
 
    %AICMD0x00_SetMusic($10, $B4)                              ;B4CD78
    %AICMD0x02_FreezeTime()                                    ;B4CD7B
    %AICMD0x03_SetHour($06)                                    ;B4CD7C
    %AICMD0x05_SetTransferPosition(65512, 120)                 ;B4CD7E
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4CD83
    %AICMD0x40_DisableTileInteractions()                       ;B4CD85
    %AICMD0x08_EnableAIControl()                               ;B4CD86
    %AICMD0x09($01, $B4CDF1)                                   ;B4CD87
    %AICMD0x09($02, $B4CE37)                                   ;B4CD8B
    %AICMD0x09($03, $B4CE6E)                                   ;B4CD8F
    %AICMD0x09($04, $B4CE8A)                                   ;B4CD93
    %AICMD0x06_SetDestinationArea(!AREA_ENDING06)              ;B4CD97
    %AICMD0x38()                                               ;B4CD99
    %AICMD0x13_Wait(120)                                       ;B4CD9A
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 144)                ;B4CD9D
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B4CDA1
    %AICMD0x13_Wait(60)                                        ;B4CDA3
    %AICMD0x19($0079, $00)                                     ;B4CDA6
    %AICMD0x13_Wait(100)                                       ;B4CDAA
    %AICMD0x3E_SetCarryItem($17)                               ;B4CDAD
    %AICMD0x13_Wait(60)                                        ;B4CDAF
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 128)                 ;B4CDB2
    %AICMD0x3F_ThrowCarriedItem()                              ;B4CDB6
    %AICMD0x0B($00)                                            ;B4CDB7
    %AICMD0x0C($01)                                            ;B4CDB9
    %AICMD0x13_Wait(180)                                       ;B4CDBB
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 128)                ;B4CDBE
    %AICMD0x13_Wait(60)                                        ;B4CDC2
    %AICMD0x19($0040, $00)                                     ;B4CDC5
    %AICMD0x13_Wait(120)                                       ;B4CDC9
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4CDCC
    %AICMD0x19($004C, $00)                                     ;B4CDCE
    %AICMD0x13_Wait(10)                                        ;B4CDD2
    %AICMD0x19($00E8, $00)                                     ;B4CDD5
    %AICMD0x09($05, $B4CDE3)                                   ;B4CDD9
    %AICMD0x13_Wait(300)                                       ;B4CDDD
    %AICMD0x3D_TeleportToArea(!AREA_ENDING00)                  ;B4CDE0
    %AICMD0x10_End()                                           ;B4CDE2
B4CDE3:
    %AICMD0x1A($0078, $007D, $B38A80, $00)                     ;B4CDE3
    %AICMD0x13_Wait(1)                                         ;B4CDEB
    %AICMD0x12_Jump($B4CDEB)                                   ;B4CDEE
B4CDF1:
    %AICMD0x1A($00A8, $0088, $B38114, $02)                     ;B4CDF1
    %AICMD0x0C($00)                                            ;B4CDF9
    %AICMD0x1B($01EC, $00)                                     ;B4CDFB
    %AICMD0x0D($FF, $00, $48, $01)                             ;B4CDFF
    %AICMD0x13_Wait(60)                                        ;B4CE04
    %AICMD0x1B($01F2, $00)                                     ;B4CE07
    %AICMD0x13_Wait(120)                                       ;B4CE0B
    %AICMD0x1B($01F1, $00)                                     ;B4CE0E
    %AICMD0x13_Wait(100)                                       ;B4CE12
    %AICMD0x1B($01E8, $00)                                     ;B4CE15
    %AICMD0x13_Wait(60)                                        ;B4CE19
    %AICMD0x1B($01F6, $00)                                     ;B4CE1C
    %AICMD0x13_Wait(90)                                        ;B4CE20
    %AICMD0x1B($01F3, $00)                                     ;B4CE23
    %AICMD0x13_Wait(180)                                       ;B4CE27
    %AICMD0x1B($01F4, $00)                                     ;B4CE2A
    %AICMD0x13_Wait(360)                                       ;B4CE2E
    %AICMD0x13_Wait(1)                                         ;B4CE31
    %AICMD0x12_Jump($B4CE31)                                   ;B4CE34
B4CE37:
    %AICMD0x1A($0078, $006A, $B380FC, $02)                     ;B4CE37
    %AICMD0x13_Wait(120)                                       ;B4CE3F
    %AICMD0x1B($0194, $01)                                     ;B4CE42
    %AICMD0x13_Wait(120)                                       ;B4CE46
    %AICMD0x1B($0193, $01)                                     ;B4CE49
    %AICMD0x13_Wait(160)                                       ;B4CE4D
    %AICMD0x1B($018C, $01)                                     ;B4CE50
    %AICMD0x13_Wait(120)                                       ;B4CE54
    %AICMD0x1B($018D, $01)                                     ;B4CE57
    %AICMD0x0B($01)                                            ;B4CE5B
    %AICMD0x1B($0192, $01)                                     ;B4CE5D
    %AICMD0x13_Wait(120)                                       ;B4CE61
    %AICMD0x1B($0195, $01)                                     ;B4CE64
    %AICMD0x13_Wait(1)                                         ;B4CE68
    %AICMD0x12_Jump($B4CE5D)                                   ;B4CE6B
B4CE6E:
    %AICMD0x1A($0098, $0098, $B386C0, $03)                     ;B4CE6E
    %AICMD0x13_Wait(120)                                       ;B4CE76
    %AICMD0x1B($01BD, $00)                                     ;B4CE79
    %AICMD0x13_Wait(120)                                       ;B4CE7D
    %AICMD0x1B($01BE, $00)                                     ;B4CE80
    %AICMD0x13_Wait(120)                                       ;B4CE84
    %AICMD0x12_Jump($B4CE79)                                   ;B4CE87
B4CE8A:
    %AICMD0x1A($003A, $0068, $B384EC, $00)                     ;B4CE8A
    %AICMD0x0D($01, $00, $08, $01)                             ;B4CE92
    %AICMD0x0D($00, $FF, $06, $01)                             ;B4CE97
    %AICMD0x0D($FF, $00, $08, $02)                             ;B4CE9C
    %AICMD0x0D($FF, $01, $04, $01)                             ;B4CEA1
    %AICMD0x0D($01, $00, $0C, $02)                             ;B4CEA6
    %AICMD0x0D($FF, $00, $06, $01)                             ;B4CEAB
    %AICMD0x0D($00, $FF, $10, $02)                             ;B4CEB0
    %AICMD0x0D($FF, $01, $04, $01)                             ;B4CEB5
    %AICMD0x0D($01, $01, $0C, $02)                             ;B4CEBA
    %AICMD0x0D($01, $00, $08, $02)                             ;B4CEBF
    %AICMD0x0D($00, $FF, $06, $01)                             ;B4CEC4
    %AICMD0x12_Jump($B4CE92)                                   ;B4CEC9


pAIScripting0x34:
    dw DATA8_B4CEEC                                            ;B4CECC|        |B4CEEC;
    dw pAIScripting0x35                                        ;B4CECE|        |B4D013;
    dw pAIScripting0x35                                        ;B4CED0|        |B4D013;
    dw pAIScripting0x35                                        ;B4CED2|        |B4D013;
    dw pAIScripting0x35                                        ;B4CED4|        |B4D013;
    dw pAIScripting0x35                                        ;B4CED6|        |B4D013;
    dw pAIScripting0x35                                        ;B4CED8|        |B4D013;
    dw pAIScripting0x35                                        ;B4CEDA|        |B4D013;
    dw pAIScripting0x35                                        ;B4CEDC|        |B4D013;
    dw pAIScripting0x35                                        ;B4CEDE|        |B4D013;
    dw pAIScripting0x35                                        ;B4CEE0|        |B4D013;
    dw pAIScripting0x35                                        ;B4CEE2|        |B4D013;
    dw pAIScripting0x35                                        ;B4CEE4|        |B4D013;
    dw pAIScripting0x35                                        ;B4CEE6|        |B4D013;
    dw pAIScripting0x35                                        ;B4CEE8|        |B4D013;
    dw pAIScripting0x35                                        ;B4CEEA|        |B4D013;
 
DATA8_B4CEEC:
 
    %AICMD0x47_SetValue8($800927, 16)                          ;B4CEEC
    %AICMD0x47_SetValue8($80092C, 5)                           ;B4CEF1
    %AICMD0x00_SetMusic($10, $B4)                              ;B4CEF6
    %AICMD0x02_FreezeTime()                                    ;B4CEF9
    %AICMD0x03_SetHour($06)                                    ;B4CEFA
    %AICMD0x05_SetTransferPosition(232, 65528)                 ;B4CEFC
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4CF01
    %AICMD0x08_EnableAIControl()                               ;B4CF03
    %AICMD0x09($01, $B4CFB3)                                   ;B4CF04
    %AICMD0x06_SetDestinationArea(!AREA_ENDING07)              ;B4CF08
    %AICMD0x38()                                               ;B4CF0A
    %AICMD0x13_Wait(60)                                        ;B4CF0B
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 112)                 ;B4CF0E
    %AICMD0x13_Wait(30)                                        ;B4CF12
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 64)                   ;B4CF15
    %AICMD0x13_Wait(30)                                        ;B4CF19
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 24)                   ;B4CF1C
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4CF20
    %AICMD0x3E_SetCarryItem($10)                               ;B4CF22
    %AICMD0x13_Wait(30)                                        ;B4CF24
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 24)                     ;B4CF27
    %AICMD0x13_Wait(40)                                        ;B4CF2B
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 88)                  ;B4CF2E
    %AICMD0x3F_ThrowCarriedItem()                              ;B4CF32
    %AICMD0x13_Wait(90)                                        ;B4CF33
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4CF36
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 88)                   ;B4CF38
    %AICMD0x13_Wait(30)                                        ;B4CF3C
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 16)                   ;B4CF3F
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4CF43
    %AICMD0x3E_SetCarryItem($10)                               ;B4CF45
    %AICMD0x13_Wait(30)                                        ;B4CF47
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 16)                     ;B4CF4A
    %AICMD0x13_Wait(30)                                        ;B4CF4E
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 88)                  ;B4CF51
    %AICMD0x3F_ThrowCarriedItem()                              ;B4CF55
    %AICMD0x13_Wait(90)                                        ;B4CF56
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4CF59
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 88)                   ;B4CF5B
    %AICMD0x13_Wait(30)                                        ;B4CF5F
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 15)                  ;B4CF62
    %AICMD0x13_Wait(30)                                        ;B4CF66
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4CF69
    %AICMD0x56_UseEquippedItem()                               ;B4CF6B
    %AICMD0x13_Wait(80)                                        ;B4CF6C
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 15)                  ;B4CF6F
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4CF73
    %AICMD0x56_UseEquippedItem()                               ;B4CF75
    %AICMD0x13_Wait(80)                                        ;B4CF76
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 15)                  ;B4CF79
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4CF7D
    %AICMD0x56_UseEquippedItem()                               ;B4CF7F
    %AICMD0x13_Wait(80)                                        ;B4CF80
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 15)                  ;B4CF83
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4CF87
    %AICMD0x56_UseEquippedItem()                               ;B4CF89
    %AICMD0x13_Wait(80)                                        ;B4CF8A
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 15)                  ;B4CF8D
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4CF91
    %AICMD0x56_UseEquippedItem()                               ;B4CF93
    %AICMD0x13_Wait(80)                                        ;B4CF94
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 15)                  ;B4CF97
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4CF9B
    %AICMD0x56_UseEquippedItem()                               ;B4CF9D
    %AICMD0x13_Wait(80)                                        ;B4CF9E
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 48)                     ;B4CFA1
    %AICMD0x13_Wait(30)                                        ;B4CFA5
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 64)                   ;B4CFA8
    %AICMD0x0B($00)                                            ;B4CFAC
    %AICMD0x0C($01)                                            ;B4CFAE
    %AICMD0x3D_TeleportToArea(!AREA_ENDING00)                  ;B4CFB0
    %AICMD0x10_End()                                           ;B4CFB2
B4CFB3:
    %AICMD0x1A($0098, $0098, $B389A8, $03)                     ;B4CFB3
    %AICMD0x1B($01EA, $00)                                     ;B4CFBB
    %AICMD0x0C($00)                                            ;B4CFBF
    %AICMD0x13_Wait(180)                                       ;B4CFC1
    %AICMD0x1B($01E1, $00)                                     ;B4CFC4
    %AICMD0x0D($00, $FF, $20, $01)                             ;B4CFC8
    %AICMD0x1B($01EE, $01)                                     ;B4CFCD
    %AICMD0x13_Wait(120)                                       ;B4CFD1
    %AICMD0x1B($01DA, $00)                                     ;B4CFD4
    %AICMD0x0D($00, $01, $20, $01)                             ;B4CFD8
    %AICMD0x1B($01EE, $01)                                     ;B4CFDD
    %AICMD0x13_Wait(90)                                        ;B4CFE1
    %AICMD0x1B($01F7, $00)                                     ;B4CFE4
    %AICMD0x13_Wait(90)                                        ;B4CFE8
    %AICMD0x1B($01E1, $00)                                     ;B4CFEB
    %AICMD0x0D($00, $FF, $10, $01)                             ;B4CFEF
    %AICMD0x1B($01F7, $00)                                     ;B4CFF4
    %AICMD0x13_Wait(90)                                        ;B4CFF8
    %AICMD0x1B($01E1, $00)                                     ;B4CFFB
    %AICMD0x0D($00, $FF, $10, $01)                             ;B4CFFF
    %AICMD0x1B($01F7, $00)                                     ;B4D004
    %AICMD0x13_Wait(90)                                        ;B4D008
    %AICMD0x0B($01)                                            ;B4D00B
    %AICMD0x13_Wait(1)                                         ;B4D00D
    %AICMD0x12_Jump($B4D00D)                                   ;B4D010


pAIScripting0x35:
    dw DATA8_B4D033                                            ;B4D013|        |B4D033;
    dw pAIScripting0x36                                        ;B4D015|        |B4D162;
    dw pAIScripting0x36                                        ;B4D017|        |B4D162;
    dw pAIScripting0x36                                        ;B4D019|        |B4D162;
    dw pAIScripting0x36                                        ;B4D01B|        |B4D162;
    dw pAIScripting0x36                                        ;B4D01D|        |B4D162;
    dw pAIScripting0x36                                        ;B4D01F|        |B4D162;
    dw pAIScripting0x36                                        ;B4D021|        |B4D162;
    dw pAIScripting0x36                                        ;B4D023|        |B4D162;
    dw pAIScripting0x36                                        ;B4D025|        |B4D162;
    dw pAIScripting0x36                                        ;B4D027|        |B4D162;
    dw pAIScripting0x36                                        ;B4D029|        |B4D162;
    dw pAIScripting0x36                                        ;B4D02B|        |B4D162;
    dw pAIScripting0x36                                        ;B4D02D|        |B4D162;
    dw pAIScripting0x36                                        ;B4D02F|        |B4D162;
    dw pAIScripting0x36                                        ;B4D031|        |B4D162;
 
DATA8_B4D033:
 
    %AICMD0x47_SetValue8($800927, 21)                          ;B4D033
    %AICMD0x00_SetMusic($10, $B4)                              ;B4D038
    %AICMD0x02_FreezeTime()                                    ;B4D03B
    %AICMD0x03_SetHour($06)                                    ;B4D03C
    %AICMD0x05_SetTransferPosition(264, 120)                   ;B4D03E
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4D043
    %AICMD0x08_EnableAIControl()                               ;B4D045
    %AICMD0x09($01, $B4D0D6)                                   ;B4D046
    %AICMD0x09($02, $B4D129)                                   ;B4D04A
    %AICMD0x06_SetDestinationArea(!AREA_ENDING08)              ;B4D04E
    %AICMD0x38()                                               ;B4D050
    %AICMD0x13_Wait(180)                                       ;B4D051
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 64)                   ;B4D054
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4D058
    %AICMD0x13_Wait(30)                                        ;B4D05A
    %AICMD0x3E_SetCarryItem($11)                               ;B4D05D
    %AICMD0x13_Wait(60)                                        ;B4D05F
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B4D062
    %AICMD0x13_Wait(30)                                        ;B4D064
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 32)                    ;B4D067
    %AICMD0x3F_ThrowCarriedItem()                              ;B4D06B
    %AICMD0x0B($00)                                            ;B4D06C
    %AICMD0x13_Wait(60)                                        ;B4D06E
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 32)                  ;B4D071
    %AICMD0x13_Wait(30)                                        ;B4D075
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 16)                  ;B4D078
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4D07C
    %AICMD0x13_Wait(30)                                        ;B4D07E
    %AICMD0x3E_SetCarryItem($11)                               ;B4D081
    %AICMD0x13_Wait(60)                                        ;B4D083
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B4D086
    %AICMD0x13_Wait(30)                                        ;B4D088
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 32)                    ;B4D08B
    %AICMD0x13_Wait(30)                                        ;B4D08F
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B4D092
    %AICMD0x3F_ThrowCarriedItem()                              ;B4D094
    %AICMD0x0B($01)                                            ;B4D095
    %AICMD0x13_Wait(60)                                        ;B4D097
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 24)                   ;B4D09A
    %AICMD0x19($00A5, $00)                                     ;B4D09E
    %AICMD0x13_Wait(60)                                        ;B4D0A2
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 56)                  ;B4D0A5
    %AICMD0x56_UseEquippedItem()                               ;B4D0A9
    %AICMD0x13_Wait(120)                                       ;B4D0AA
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 16)                   ;B4D0AD
    %AICMD0x56_UseEquippedItem()                               ;B4D0B1
    %AICMD0x13_Wait(120)                                       ;B4D0B2
    %AICMD0x19($004A, $00)                                     ;B4D0B5
    %AICMD0x13_Wait(120)                                       ;B4D0B9
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 96)                  ;B4D0BC
    %AICMD0x13_Wait(30)                                        ;B4D0C0
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4D0C3
    %AICMD0x13_Wait(60)                                        ;B4D0C5
    %AICMD0x19($0030, $00)                                     ;B4D0C8
    %AICMD0x13_Wait(60)                                        ;B4D0CC
    %AICMD0x0B($02)                                            ;B4D0CF
    %AICMD0x0C($03)                                            ;B4D0D1
    %AICMD0x3D_TeleportToArea(!AREA_ENDING00)                  ;B4D0D3
    %AICMD0x10_End()                                           ;B4D0D5
B4D0D6:
    %AICMD0x1A($00A8, $0048, $B38114, $00)                     ;B4D0D6
    %AICMD0x1B($01DB, $00)                                     ;B4D0DE
    %AICMD0x13_Wait(120)                                       ;B4D0E2
    %AICMD0x1B($01DA, $00)                                     ;B4D0E5
    %AICMD0x0D($00, $01, $20, $01)                             ;B4D0E9
    %AICMD0x1B($01DC, $00)                                     ;B4D0EE
    %AICMD0x13_Wait(120)                                       ;B4D0F2
    %AICMD0x1B($01DB, $00)                                     ;B4D0F5
    %AICMD0x13_Wait(120)                                       ;B4D0F9
    %AICMD0x1B($01DC, $01)                                     ;B4D0FC
    %AICMD0x13_Wait(60)                                        ;B4D100
    %AICMD0x0C($02)                                            ;B4D103
    %AICMD0x1B($01DA, $00)                                     ;B4D105
    %AICMD0x0D($00, $01, $10, $01)                             ;B4D109
    %AICMD0x1B($01E9, $00)                                     ;B4D10E
    %AICMD0x13_Wait(30)                                        ;B4D112
    %AICMD0x0D($FF, $00, $20, $01)                             ;B4D115
    %AICMD0x1B($01F2, $00)                                     ;B4D11A
    %AICMD0x13_Wait(120)                                       ;B4D11E
    %AICMD0x0B($03)                                            ;B4D121
    %AICMD0x13_Wait(1)                                         ;B4D123
    %AICMD0x12_Jump($B4D123)                                   ;B4D126
B4D129:
    %AICMD0x1A($0080, $0048, $B3812C, $03)                     ;B4D129
    %AICMD0x0C($00)                                            ;B4D131
    %AICMD0x1B($0208, $00)                                     ;B4D133
    %AICMD0x13_Wait(60)                                        ;B4D137
    %AICMD0x1B($0200, $00)                                     ;B4D13A
    %AICMD0x0C($01)                                            ;B4D13E
    %AICMD0x1B($0208, $00)                                     ;B4D140
    %AICMD0x13_Wait(60)                                        ;B4D144
    %AICMD0x1B($0200, $00)                                     ;B4D147
    %AICMD0x13_Wait(120)                                       ;B4D14B
    %AICMD0x1B($0203, $00)                                     ;B4D14E
    %AICMD0x13_Wait(120)                                       ;B4D152
    %AICMD0x1B($0205, $00)                                     ;B4D155
    %AICMD0x13_Wait(180)                                       ;B4D159
    %AICMD0x13_Wait(1)                                         ;B4D15C
    %AICMD0x12_Jump($B4D15C)                                   ;B4D15F


pAIScripting0x36:
    dw DATA8_B4D182                                            ;B4D162|        |B4D182;
    dw pAIScripting0x37                                        ;B4D164|        |B4D2CE;
    dw pAIScripting0x37                                        ;B4D166|        |B4D2CE;
    dw pAIScripting0x37                                        ;B4D168|        |B4D2CE;
    dw pAIScripting0x37                                        ;B4D16A|        |B4D2CE;
    dw pAIScripting0x37                                        ;B4D16C|        |B4D2CE;
    dw pAIScripting0x37                                        ;B4D16E|        |B4D2CE;
    dw pAIScripting0x37                                        ;B4D170|        |B4D2CE;
    dw pAIScripting0x37                                        ;B4D172|        |B4D2CE;
    dw pAIScripting0x37                                        ;B4D174|        |B4D2CE;
    dw pAIScripting0x37                                        ;B4D176|        |B4D2CE;
    dw pAIScripting0x37                                        ;B4D178|        |B4D2CE;
    dw pAIScripting0x37                                        ;B4D17A|        |B4D2CE;
    dw pAIScripting0x37                                        ;B4D17C|        |B4D2CE;
    dw pAIScripting0x37                                        ;B4D17E|        |B4D2CE;
    dw pAIScripting0x37                                        ;B4D180|        |B4D2CE;
 
DATA8_B4D182:
 
    %AICMD0x00_SetMusic($10, $B4)                              ;B4D182
    %AICMD0x02_FreezeTime()                                    ;B4D185
    %AICMD0x03_SetHour($06)                                    ;B4D186
    %AICMD0x05_SetTransferPosition(184, 104)                   ;B4D188
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4D18D
    %AICMD0x08_EnableAIControl()                               ;B4D18F
    %AICMD0x09($01, $B4D218)                                   ;B4D190
    %AICMD0x09($02, $B4D285)                                   ;B4D194
    %AICMD0x09($04, $B4D1D6)                                   ;B4D198
    %AICMD0x09($05, $B4D1EB)                                   ;B4D19C
    %AICMD0x09($06, $B4D200)                                   ;B4D1A0
    %AICMD0x3B($12)                                            ;B4D1A4
    %AICMD0x06_SetDestinationArea(!AREA_ENDING09)              ;B4D1A6
    %AICMD0x38()                                               ;B4D1A8
    %AICMD0x13_Wait(60)                                        ;B4D1A9
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 192)                 ;B4D1AC
    %AICMD0x13_Wait(120)                                       ;B4D1B0
    %AICMD0x3F_ThrowCarriedItem()                              ;B4D1B3
    %AICMD0x13_Wait(30)                                        ;B4D1B4
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4D1B7
    %AICMD0x13_Wait(30)                                        ;B4D1B9
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 106)                 ;B4D1BC
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4D1C0
    %AICMD0x3E_SetCarryItem($12)                               ;B4D1C2
    %AICMD0x13_Wait(30)                                        ;B4D1C4
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 108)                  ;B4D1C7
    %AICMD0x0B($00)                                            ;B4D1CB
    %AICMD0x3F_ThrowCarriedItem()                              ;B4D1CD
    %AICMD0x13_Wait(300)                                       ;B4D1CE
    %AICMD0x0C($05)                                            ;B4D1D1
    %AICMD0x3D_TeleportToArea(!AREA_ENDING00)                  ;B4D1D3
    %AICMD0x10_End()                                           ;B4D1D5
B4D1D6:
    %AICMD0x1A($00B8, $0078, $B38A8C, $00)                     ;B4D1D6
    %AICMD0x0C($00)                                            ;B4D1DE
    %AICMD0x1B($00B7, $00)                                     ;B4D1E0
    %AICMD0x13_Wait(60)                                        ;B4D1E4
    %AICMD0x37()                                               ;B4D1E7
    %AICMD0x0B($01)                                            ;B4D1E8
    %AICMD0x10_End()                                           ;B4D1EA
B4D1EB:
    %AICMD0x1A($0098, $0078, $B38A8C, $00)                     ;B4D1EB
    %AICMD0x0C($01)                                            ;B4D1F3
    %AICMD0x1B($00B7, $00)                                     ;B4D1F5
    %AICMD0x13_Wait(60)                                        ;B4D1F9
    %AICMD0x37()                                               ;B4D1FC
    %AICMD0x0B($02)                                            ;B4D1FD
    %AICMD0x10_End()                                           ;B4D1FF
B4D200:
    %AICMD0x1A($0088, $0078, $B38A8C, $00)                     ;B4D200
    %AICMD0x0C($02)                                            ;B4D208
    %AICMD0x13_Wait(60)                                        ;B4D20A
    %AICMD0x1B($00B7, $00)                                     ;B4D20D
    %AICMD0x13_Wait(60)                                        ;B4D211
    %AICMD0x37()                                               ;B4D214
    %AICMD0x0B($03)                                            ;B4D215
    %AICMD0x10_End()                                           ;B4D217
B4D218:
    %AICMD0x1A($0078, $0078, $B38960, $02)                     ;B4D218
    %AICMD0x13_Wait(200)                                       ;B4D220
    %AICMD0x1B($01F6, $01)                                     ;B4D223
    %AICMD0x13_Wait(120)                                       ;B4D227
    %AICMD0x1B($01EB, $01)                                     ;B4D22A
    %AICMD0x13_Wait(180)                                       ;B4D22E
    %AICMD0x1B($01EA, $01)                                     ;B4D231
    %AICMD0x13_Wait(180)                                       ;B4D235
    %AICMD0x0C($03)                                            ;B4D238
    %AICMD0x1B($01E8, $01)                                     ;B4D23A
    %AICMD0x13_Wait(60)                                        ;B4D23E
    %AICMD0x0C($03)                                            ;B4D241
    %AICMD0x1B($01F2, $01)                                     ;B4D243
    %AICMD0x13_Wait(120)                                       ;B4D247
    %AICMD0x0B($04)                                            ;B4D24A
    %AICMD0x13_Wait(120)                                       ;B4D24C
    %AICMD0x1B($01EC, $01)                                     ;B4D24F
    %AICMD0x0D($01, $00, $30, $01)                             ;B4D253
    %AICMD0x13_Wait(40)                                        ;B4D258
    %AICMD0x1B($01E2, $00)                                     ;B4D25B
    %AICMD0x0D($00, $FF, $10, $01)                             ;B4D25F
    %AICMD0x13_Wait(40)                                        ;B4D264
    %AICMD0x1B($01EC, $01)                                     ;B4D267
    %AICMD0x0D($01, $00, $48, $01)                             ;B4D26B
    %AICMD0x13_Wait(40)                                        ;B4D270
    %AICMD0x1B($01EC, $00)                                     ;B4D273
    %AICMD0x0D($FF, $00, $58, $01)                             ;B4D277
    %AICMD0x13_Wait(90)                                        ;B4D27C
    %AICMD0x13_Wait(1)                                         ;B4D27F
    %AICMD0x12_Jump($B4D27F)                                   ;B4D282
B4D285:
    %AICMD0x0C($04)                                            ;B4D285
    %AICMD0x1A($0088, $0078, $B38504, $00)                     ;B4D287
    %AICMD0x1B($0321, $00)                                     ;B4D28F
    %AICMD0x13_Wait(60)                                        ;B4D293
    %AICMD0x1B($0324, $01)                                     ;B4D296
    %AICMD0x0D($01, $00, $20, $01)                             ;B4D29A
    %AICMD0x13_Wait(30)                                        ;B4D29F
    %AICMD0x1B($0323, $00)                                     ;B4D2A2
    %AICMD0x0D($00, $FF, $20, $01)                             ;B4D2A6
    %AICMD0x13_Wait(30)                                        ;B4D2AB
    %AICMD0x1B($0324, $01)                                     ;B4D2AE
    %AICMD0x0D($01, $00, $50, $01)                             ;B4D2B2
    %AICMD0x13_Wait(30)                                        ;B4D2B7
    %AICMD0x1B($0324, $00)                                     ;B4D2BA
    %AICMD0x0D($FF, $00, $80, $01)                             ;B4D2BE
    %AICMD0x1B($0325, $00)                                     ;B4D2C3
    %AICMD0x13_Wait(60)                                        ;B4D2C7
    %AICMD0x0B($05)                                            ;B4D2CA
    %AICMD0x37()                                               ;B4D2CC
    %AICMD0x10_End()                                           ;B4D2CD


pAIScripting0x37:
    dw DATA8_B4D2EE                                            ;B4D2CE|        |B4D2EE;
    dw pAIScripting0x38                                        ;B4D2D0|        |B4D449;
    dw pAIScripting0x38                                        ;B4D2D2|        |B4D449;
    dw pAIScripting0x38                                        ;B4D2D4|        |B4D449;
    dw pAIScripting0x38                                        ;B4D2D6|        |B4D449;
    dw pAIScripting0x38                                        ;B4D2D8|        |B4D449;
    dw pAIScripting0x38                                        ;B4D2DA|        |B4D449;
    dw pAIScripting0x38                                        ;B4D2DC|        |B4D449;
    dw pAIScripting0x38                                        ;B4D2DE|        |B4D449;
    dw pAIScripting0x38                                        ;B4D2E0|        |B4D449;
    dw pAIScripting0x38                                        ;B4D2E2|        |B4D449;
    dw pAIScripting0x38                                        ;B4D2E4|        |B4D449;
    dw pAIScripting0x38                                        ;B4D2E6|        |B4D449;
    dw pAIScripting0x38                                        ;B4D2E8|        |B4D449;
    dw pAIScripting0x38                                        ;B4D2EA|        |B4D449;
    dw pAIScripting0x38                                        ;B4D2EC|        |B4D449;
 
DATA8_B4D2EE:
 
    %AICMD0x47_SetValue8($800927, 16)                          ;B4D2EE
    %AICMD0x47_SetValue8($80092C, 5)                           ;B4D2F3
    %AICMD0x00_SetMusic($10, $B4)                              ;B4D2F8
    %AICMD0x02_FreezeTime()                                    ;B4D2FB
    %AICMD0x03_SetHour($06)                                    ;B4D2FC
    %AICMD0x05_SetTransferPosition(88, 104)                    ;B4D2FE
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4D303
    %AICMD0x08_EnableAIControl()                               ;B4D305
    %AICMD0x09($01, $B4D386)                                   ;B4D306
    %AICMD0x09($02, $B4D3A3)                                   ;B4D30A
    %AICMD0x09($03, $B4D3E8)                                   ;B4D30E
    %AICMD0x06_SetDestinationArea(!AREA_ENDING10)              ;B4D312
    %AICMD0x38()                                               ;B4D314
    %AICMD0x13_Wait(30)                                        ;B4D315
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 40)                  ;B4D318
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4D31C
    %AICMD0x56_UseEquippedItem()                               ;B4D31E
    %AICMD0x13_Wait(80)                                        ;B4D31F
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 16)                  ;B4D322
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4D326
    %AICMD0x13_Wait(30)                                        ;B4D328
    %AICMD0x56_UseEquippedItem()                               ;B4D32B
    %AICMD0x13_Wait(80)                                        ;B4D32C
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 16)                  ;B4D32F
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4D333
    %AICMD0x13_Wait(30)                                        ;B4D335
    %AICMD0x56_UseEquippedItem()                               ;B4D338
    %AICMD0x13_Wait(80)                                        ;B4D339
    %AICMD0x0B($00)                                            ;B4D33C
    %AICMD0x13_Wait(60)                                        ;B4D33E
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4D341
    %AICMD0x0C($02)                                            ;B4D343
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 64)                  ;B4D345
    %AICMD0x13_Wait(60)                                        ;B4D349
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 40)                  ;B4D34C
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4D350
    %AICMD0x13_Wait(30)                                        ;B4D352
    %AICMD0x3E_SetCarryItem($13)                               ;B4D355
    %AICMD0x13_Wait(30)                                        ;B4D357
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 48)                   ;B4D35A
    %AICMD0x13_Wait(20)                                        ;B4D35E
    %AICMD0x3F_ThrowCarriedItem()                              ;B4D361
    %AICMD0x13_Wait(10)                                        ;B4D362
    %AICMD0x09($04, $B4D42F)                                   ;B4D365
    %AICMD0x0B($04)                                            ;B4D369
    %AICMD0x13_Wait(60)                                        ;B4D36B
    %AICMD0x19($000F, $00)                                     ;B4D36E
    %AICMD0x13_Wait(40)                                        ;B4D372
    %AICMD0x19($0023, $00)                                     ;B4D375
    %AICMD0x13_Wait(40)                                        ;B4D379
    %AICMD0x19($000F, $00)                                     ;B4D37C
    %AICMD0x13_Wait(40)                                        ;B4D380
    %AICMD0x3D_TeleportToArea(!AREA_ENDING00)                  ;B4D383
    %AICMD0x10_End()                                           ;B4D385
B4D386:
    %AICMD0x1A($0078, $0058, $B38114, $02)                     ;B4D386
    %AICMD0x0C($00)                                            ;B4D38E
    %AICMD0x1B($01F2, $00)                                     ;B4D390
    %AICMD0x13_Wait(120)                                       ;B4D394
    %AICMD0x0B($01)                                            ;B4D397
    %AICMD0x1B($01EA, $00)                                     ;B4D399
    %AICMD0x13_Wait(1)                                         ;B4D39D
    %AICMD0x12_Jump($B4D39D)                                   ;B4D3A0
B4D3A3:
    %AICMD0x1A($FFE8, $0068, $B384C8, $00)                     ;B4D3A3
    %AICMD0x0C($01)                                            ;B4D3AB
    %AICMD0x1B($030E, $01)                                     ;B4D3AD
    %AICMD0x0D($01, $00, $BC, $02)                             ;B4D3B1
    %AICMD0x1B($030D, $01)                                     ;B4D3B6
    %AICMD0x0C($04)                                            ;B4D3BA
    %AICMD0x13_Wait(30)                                        ;B4D3BC
    %AICMD0x1B($030E, $00)                                     ;B4D3BF
    %AICMD0x0D($FF, $00, $60, $02)                             ;B4D3C3
    %AICMD0x1B($030D, $01)                                     ;B4D3C8
    %AICMD0x13_Wait(30)                                        ;B4D3CC
    %AICMD0x1B($0309, $00)                                     ;B4D3CF
    %AICMD0x13_Wait(90)                                        ;B4D3D3
    %AICMD0x1B($0311, $00)                                     ;B4D3D6
    %AICMD0x13_Wait(120)                                       ;B4D3DA
    %AICMD0x1B($030E, $00)                                     ;B4D3DD
    %AICMD0x0D($FF, $00, $60, $02)                             ;B4D3E1
    %AICMD0x37()                                               ;B4D3E6
    %AICMD0x10_End()                                           ;B4D3E7
B4D3E8:
    %AICMD0x1A($FFF8, $0068, $B384C8, $00)                     ;B4D3E8
    %AICMD0x0C($01)                                            ;B4D3F0
    %AICMD0x1B($030E, $01)                                     ;B4D3F2
    %AICMD0x0D($01, $00, $C0, $02)                             ;B4D3F6
    %AICMD0x1B($030F, $01)                                     ;B4D3FB
    %AICMD0x0B($02)                                            ;B4D3FF
    %AICMD0x0C($04)                                            ;B4D401
    %AICMD0x13_Wait(30)                                        ;B4D403
    %AICMD0x1B($030E, $00)                                     ;B4D406
    %AICMD0x0D($FF, $00, $60, $02)                             ;B4D40A
    %AICMD0x1B($030D, $00)                                     ;B4D40F
    %AICMD0x13_Wait(30)                                        ;B4D413
    %AICMD0x1B($030D, $01)                                     ;B4D416
    %AICMD0x13_Wait(90)                                        ;B4D41A
    %AICMD0x1B($0311, $00)                                     ;B4D41D
    %AICMD0x13_Wait(120)                                       ;B4D421
    %AICMD0x1B($030E, $00)                                     ;B4D424
    %AICMD0x0D($FF, $00, $60, $02)                             ;B4D428
    %AICMD0x37()                                               ;B4D42D
    %AICMD0x10_End()                                           ;B4D42E
B4D42F:
    %AICMD0x1A($004E, $0064, $B38A98, $00)                     ;B4D42F
    %AICMD0x13_Wait(30)                                        ;B4D437
    %AICMD0x0D($FF, $00, $60, $02)                             ;B4D43A
    %AICMD0x13_Wait(240)                                       ;B4D43F
    %AICMD0x0D($FF, $00, $60, $02)                             ;B4D442
    %AICMD0x37()                                               ;B4D447
    %AICMD0x10_End()                                           ;B4D448


pAIScripting0x38:
    dw DATA8_B4D469                                            ;B4D449|        |B4D469;
    dw pAIScripting0x39                                        ;B4D44B|        |B4D533;
    dw pAIScripting0x39                                        ;B4D44D|        |B4D533;
    dw pAIScripting0x39                                        ;B4D44F|        |B4D533;
    dw pAIScripting0x39                                        ;B4D451|        |B4D533;
    dw pAIScripting0x39                                        ;B4D453|        |B4D533;
    dw pAIScripting0x39                                        ;B4D455|        |B4D533;
    dw pAIScripting0x39                                        ;B4D457|        |B4D533;
    dw pAIScripting0x39                                        ;B4D459|        |B4D533;
    dw pAIScripting0x39                                        ;B4D45B|        |B4D533;
    dw pAIScripting0x39                                        ;B4D45D|        |B4D533;
    dw pAIScripting0x39                                        ;B4D45F|        |B4D533;
    dw pAIScripting0x39                                        ;B4D461|        |B4D533;
    dw pAIScripting0x39                                        ;B4D463|        |B4D533;
    dw pAIScripting0x39                                        ;B4D465|        |B4D533;
    dw pAIScripting0x39                                        ;B4D467|        |B4D533;
 
DATA8_B4D469:
 
    %AICMD0x00_SetMusic($10, $B4)                              ;B4D469
    %AICMD0x02_FreezeTime()                                    ;B4D46C
    %AICMD0x03_SetHour($06)                                    ;B4D46D
    %AICMD0x05_SetTransferPosition(65512, 120)                 ;B4D46F
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4D474
    %AICMD0x40_DisableTileInteractions()                       ;B4D476
    %AICMD0x08_EnableAIControl()                               ;B4D477
    %AICMD0x09($01, $B4D4A8)                                   ;B4D478
    %AICMD0x09($02, $B4D505)                                   ;B4D47C
    %AICMD0x06_SetDestinationArea(!AREA_ENDING06)              ;B4D480
    %AICMD0x38()                                               ;B4D482
    %AICMD0x0C($00)                                            ;B4D483
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 40)                  ;B4D485
    %AICMD0x13_Wait(30)                                        ;B4D489
    %AICMD0x19($00BE, $00)                                     ;B4D48C
    %AICMD0x0B($01)                                            ;B4D490
    %AICMD0x13_Wait(90)                                        ;B4D492
    %AICMD0x0C($02)                                            ;B4D495
    %AICMD0x13_Wait(30)                                        ;B4D497
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 12)                 ;B4D49A
    %AICMD0x19($0041, $00)                                     ;B4D49E
    %AICMD0x13_Wait(10)                                        ;B4D4A2
    %AICMD0x3D_TeleportToArea(!AREA_ENDING00)                  ;B4D4A5
    %AICMD0x10_End()                                           ;B4D4A7
B4D4A8:
    %AICMD0x1A($0078, $0078, $B38114, $03)                     ;B4D4A8
    %AICMD0x1B($01E7, $00)                                     ;B4D4B0
    %AICMD0x13_Wait(120)                                       ;B4D4B4
    %AICMD0x1B($01F3, $00)                                     ;B4D4B7
    %AICMD0x13_Wait(120)                                       ;B4D4BB
    %AICMD0x1B($01F6, $00)                                     ;B4D4BE
    %AICMD0x13_Wait(120)                                       ;B4D4C2
    %AICMD0x1B($01EC, $01)                                     ;B4D4C5
    %AICMD0x0D($01, $00, $30, $01)                             ;B4D4C9
    %AICMD0x1B($01EE, $01)                                     ;B4D4CE
    %AICMD0x13_Wait(120)                                       ;B4D4D2
    %AICMD0x1B($01EC, $00)                                     ;B4D4D5
    %AICMD0x0D($FF, $00, $30, $01)                             ;B4D4D9
    %AICMD0x1B($01EA, $00)                                     ;B4D4DE
    %AICMD0x13_Wait(30)                                        ;B4D4E2
    %AICMD0x0B($00)                                            ;B4D4E5
    %AICMD0x0C($01)                                            ;B4D4E7
    %AICMD0x1B($01F8, $00)                                     ;B4D4E9
    %AICMD0x13_Wait(60)                                        ;B4D4ED
    %AICMD0x0B($02)                                            ;B4D4F0
    %AICMD0x1B($01EC, $00)                                     ;B4D4F2
    %AICMD0x0D($FF, $00, $2A, $01)                             ;B4D4F6
    %AICMD0x1B($01ED, $00)                                     ;B4D4FB
    %AICMD0x13_Wait(1)                                         ;B4D4FF
    %AICMD0x12_Jump($B4D4FF)                                   ;B4D502
B4D505:
    %AICMD0x1A($0068, $0068, $B3812C, $02)                     ;B4D505
    %AICMD0x1B($0203, $01)                                     ;B4D50D
    %AICMD0x13_Wait(80)                                        ;B4D511
    %AICMD0x1B($0200, $01)                                     ;B4D514
    %AICMD0x13_Wait(180)                                       ;B4D518
    %AICMD0x1B($0204, $01)                                     ;B4D51B
    %AICMD0x13_Wait(60)                                        ;B4D51F
    %AICMD0x1B($0205, $01)                                     ;B4D522
    %AICMD0x13_Wait(90)                                        ;B4D526
    %AICMD0x1B($0200, $01)                                     ;B4D529
    %AICMD0x13_Wait(120)                                       ;B4D52D
    %AICMD0x12_Jump($B4D50D)                                   ;B4D530


pAIScripting0x39:
    dw DATA8_B4D553                                            ;B4D533|        |B4D553;
    dw pAIScripting0x3A                                        ;B4D535|        |B4D774;
    dw pAIScripting0x3A                                        ;B4D537|        |B4D774;
    dw pAIScripting0x3A                                        ;B4D539|        |B4D774;
    dw pAIScripting0x3A                                        ;B4D53B|        |B4D774;
    dw pAIScripting0x3A                                        ;B4D53D|        |B4D774;
    dw pAIScripting0x3A                                        ;B4D53F|        |B4D774;
    dw pAIScripting0x3A                                        ;B4D541|        |B4D774;
    dw pAIScripting0x3A                                        ;B4D543|        |B4D774;
    dw pAIScripting0x3A                                        ;B4D545|        |B4D774;
    dw pAIScripting0x3A                                        ;B4D547|        |B4D774;
    dw pAIScripting0x3A                                        ;B4D549|        |B4D774;
    dw pAIScripting0x3A                                        ;B4D54B|        |B4D774;
    dw pAIScripting0x3A                                        ;B4D54D|        |B4D774;
    dw pAIScripting0x3A                                        ;B4D54F|        |B4D774;
    dw pAIScripting0x3A                                        ;B4D551|        |B4D774;
 
DATA8_B4D553:
 
    %AICMD0x00_SetMusic($10, $B4)                              ;B4D553
    %AICMD0x02_FreezeTime()                                    ;B4D556
    %AICMD0x03_SetHour($07)                                    ;B4D557
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4D559
    %AICMD0x05_SetTransferPosition(664, 112)                   ;B4D55B
    %AICMD0x08_EnableAIControl()                               ;B4D560
    %AICMD0x09($01, $B4D612)                                   ;B4D561
    %AICMD0x09($02, $B4D620)                                   ;B4D565
    %AICMD0x09($03, $B4D673)                                   ;B4D569
    %AICMD0x09($04, $B4D6C3)                                   ;B4D56D
    %AICMD0x06_SetDestinationArea(!AREA_WOODSSUMMER)           ;B4D571
    %AICMD0x38()                                               ;B4D573
    %AICMD0x13_Wait(60)                                        ;B4D574
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 80)                  ;B4D577
    %AICMD0x13_Wait(20)                                        ;B4D57B
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 16)                    ;B4D57E
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4D582
    %AICMD0x13_Wait(30)                                        ;B4D584
    %AICMD0x19($005F, $00)                                     ;B4D587
    %AICMD0x13_Wait(60)                                        ;B4D58B
    %AICMD0x19($0003, $00)                                     ;B4D58E
    %AICMD0x13_Wait(1)                                         ;B4D592
    %AICMD0x19($005F, $00)                                     ;B4D595
    %AICMD0x13_Wait(60)                                        ;B4D599
    %AICMD0x19($0003, $00)                                     ;B4D59C
    %AICMD0x13_Wait(1)                                         ;B4D5A0
    %AICMD0x19($005F, $00)                                     ;B4D5A3
    %AICMD0x13_Wait(60)                                        ;B4D5A7
    %AICMD0x19($0003, $00)                                     ;B4D5AA
    %AICMD0x13_Wait(1)                                         ;B4D5AE
    %AICMD0x19($005F, $00)                                     ;B4D5B1
    %AICMD0x13_Wait(60)                                        ;B4D5B5
    %AICMD0x19($004A, $00)                                     ;B4D5B8
    %AICMD0x13_Wait(120)                                       ;B4D5BC
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4D5BF
    %AICMD0x0B($00)                                            ;B4D5C1
    %AICMD0x13_Wait(60)                                        ;B4D5C3
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4D5C6
    %AICMD0x13_Wait(120)                                       ;B4D5C8
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 12)                  ;B4D5CB
    %AICMD0x0B($03)                                            ;B4D5CF
    %AICMD0x19($0010, $00)                                     ;B4D5D1
    %AICMD0x13_Wait(14)                                        ;B4D5D5
    %AICMD0x19($0014, $00)                                     ;B4D5D8
    %AICMD0x13_Wait(60)                                        ;B4D5DC
    %AICMD0x19($003B, $00)                                     ;B4D5DF
    %AICMD0x13_Wait(60)                                        ;B4D5E3
    %AICMD0x0B($01)                                            ;B4D5E6
    %AICMD0x13_Wait(120)                                       ;B4D5E8
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B4D5EB
    %AICMD0x13_Wait(300)                                       ;B4D5ED
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4D5F0
    %AICMD0x13_Wait(120)                                       ;B4D5F2
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4D5F5
    %AICMD0x13_Wait(90)                                        ;B4D5F7
    %AICMD0x19($003C, $00)                                     ;B4D5FA
    %AICMD0x13_Wait(120)                                       ;B4D5FE
    %AICMD0x19($0000, $00)                                     ;B4D601
    %AICMD0x13_Wait(1)                                         ;B4D605
    %AICMD0x19($003C, $00)                                     ;B4D608
    %AICMD0x13_Wait(120)                                       ;B4D60C
    %AICMD0x3D_TeleportToArea(!AREA_ENDING00)                  ;B4D60F
    %AICMD0x10_End()                                           ;B4D611
B4D612:
    %AICMD0x1A($02B8, $00CB, $B38540, $00)                     ;B4D612
    %AICMD0x13_Wait(1)                                         ;B4D61A
    %AICMD0x12_Jump($B4D61A)                                   ;B4D61D
B4D620:
    %AICMD0x1A($0210, $0088, $B38798, $00)                     ;B4D620
    %AICMD0x0C($00)                                            ;B4D628
    %AICMD0x1B($0303, $01)                                     ;B4D62A
    %AICMD0x0D($01, $00, $38, $01)                             ;B4D62E
    %AICMD0x1B($0302, $01)                                     ;B4D633
    %AICMD0x13_Wait(60)                                        ;B4D637
    %AICMD0x09($05, $B4D659)                                   ;B4D63A
    %AICMD0x1B($0303, $00)                                     ;B4D63E
    %AICMD0x0D($FF, $00, $10, $01)                             ;B4D642
    %AICMD0x1B($0302, $01)                                     ;B4D647
    %AICMD0x13_Wait(120)                                       ;B4D64B
    %AICMD0x1B($0303, $00)                                     ;B4D64E
    %AICMD0x0D($FF, $00, $40, $01)                             ;B4D652
    %AICMD0x37()                                               ;B4D657
    %AICMD0x10_End()                                           ;B4D658
B4D659:
    %AICMD0x1A($0258, $0088, $B38720, $00)                     ;B4D659
    %AICMD0x13_Wait(30)                                        ;B4D661
    %AICMD0x0C($03)                                            ;B4D664
    %AICMD0x13_Wait(10)                                        ;B4D666
    %AICMD0x0D($00, $F0, $02, $01)                             ;B4D669
    %AICMD0x13_Wait(60)                                        ;B4D66E
    %AICMD0x37()                                               ;B4D671
    %AICMD0x10_End()                                           ;B4D672
B4D673:
    %AICMD0x1A($0208, $0054, $B387B0, $00)                     ;B4D673
    %AICMD0x0C($01)                                            ;B4D67B
    %AICMD0x13_Wait(90)                                        ;B4D67D
    %AICMD0x1B($0307, $01)                                     ;B4D680
    %AICMD0x13_Wait(60)                                        ;B4D684
    %AICMD0x0D($01, $00, $40, $01)                             ;B4D687
    %AICMD0x1B($0306, $00)                                     ;B4D68C
    %AICMD0x13_Wait(60)                                        ;B4D690
    %AICMD0x1B($0307, $01)                                     ;B4D693
    %AICMD0x0D($02, $00, $20, $03)                             ;B4D697
    %AICMD0x1B($0306, $00)                                     ;B4D69C
    %AICMD0x13_Wait(60)                                        ;B4D6A0
    %AICMD0x1B($0307, $01)                                     ;B4D6A3
    %AICMD0x0D($02, $00, $28, $03)                             ;B4D6A7
    %AICMD0x1B($0306, $00)                                     ;B4D6AC
    %AICMD0x13_Wait(60)                                        ;B4D6B0
    %AICMD0x0B($02)                                            ;B4D6B3
    %AICMD0x09($06, $B4D6F1)                                   ;B4D6B5
    %AICMD0x09($07, $B4D71F)                                   ;B4D6B9
    %AICMD0x13_Wait(1)                                         ;B4D6BD
    %AICMD0x12_Jump($B4D6BD)                                   ;B4D6C0
B4D6C3:
    %AICMD0x1A($0320, $0078, $B387A4, $00)                     ;B4D6C3
    %AICMD0x0C($02)                                            ;B4D6CB
    %AICMD0x1B($0305, $00)                                     ;B4D6CD
    %AICMD0x0D($FF, $00, $70, $01)                             ;B4D6D1
    %AICMD0x1B($0304, $00)                                     ;B4D6D6
    %AICMD0x09($08, $B4D754)                                   ;B4D6DA
    %AICMD0x1B($0305, $00)                                     ;B4D6DE
    %AICMD0x0D($FF, $00, $20, $01)                             ;B4D6E2
    %AICMD0x1B($0304, $00)                                     ;B4D6E7
    %AICMD0x13_Wait(1)                                         ;B4D6EB
    %AICMD0x12_Jump($B4D6EB)                                   ;B4D6EE
B4D6F1:
    %AICMD0x1A($01C8, $0024, $B38570, $02)                     ;B4D6F1
    %AICMD0x1B($0329, $01)                                     ;B4D6F9
    %AICMD0x13_Wait(60)                                        ;B4D6FD
    %AICMD0x0D($01, $01, $28, $01)                             ;B4D700
    %AICMD0x13_Wait(10)                                        ;B4D705
    %AICMD0x0D($02, $01, $40, $02)                             ;B4D708
    %AICMD0x13_Wait(10)                                        ;B4D70D
    %AICMD0x0D($01, $00, $10, $01)                             ;B4D710
    %AICMD0x1B($0328, $01)                                     ;B4D715
    %AICMD0x13_Wait(1)                                         ;B4D719
    %AICMD0x12_Jump($B4D719)                                   ;B4D71C
B4D71F:
    %AICMD0x1A($02C8, $0058, $B38570, $03)                     ;B4D71F
    %AICMD0x1B($0329, $00)                                     ;B4D727
    %AICMD0x0D($FF, $01, $20, $01)                             ;B4D72B
    %AICMD0x13_Wait(30)                                        ;B4D730
    %AICMD0x0D($FE, $01, $20, $01)                             ;B4D733
    %AICMD0x13_Wait(10)                                        ;B4D738
    %AICMD0x0D($FF, $00, $20, $01)                             ;B4D73B
    %AICMD0x13_Wait(30)                                        ;B4D740
    %AICMD0x1B($0329, $00)                                     ;B4D743
    %AICMD0x13_Wait(10)                                        ;B4D747
    %AICMD0x1B($0327, $00)                                     ;B4D74A
    %AICMD0x13_Wait(1)                                         ;B4D74E
    %AICMD0x12_Jump($B4D74E)                                   ;B4D751
B4D754:
    %AICMD0x1A($0218, $00F8, $B38570, $01)                     ;B4D754
    %AICMD0x1B($0329, $01)                                     ;B4D75C
    %AICMD0x0D($01, $FF, $40, $01)                             ;B4D760
    %AICMD0x0D($00, $FF, $10, $01)                             ;B4D765
    %AICMD0x1B($0328, $01)                                     ;B4D76A
    %AICMD0x13_Wait(1)                                         ;B4D76E
    %AICMD0x12_Jump($B4D76E)                                   ;B4D771


pAIScripting0x3A:
    dw DATA8_B4D794                                            ;B4D774|        |B4D794;
    dw DATA8_B4D865                                            ;B4D776|        |B4D865;
    dw pAIScripting0x3B                                        ;B4D778|        |B4DA24;
    dw pAIScripting0x3B                                        ;B4D77A|        |B4DA24;
    dw pAIScripting0x3B                                        ;B4D77C|        |B4DA24;
    dw pAIScripting0x3B                                        ;B4D77E|        |B4DA24;
    dw pAIScripting0x3B                                        ;B4D780|        |B4DA24;
    dw pAIScripting0x3B                                        ;B4D782|        |B4DA24;
    dw pAIScripting0x3B                                        ;B4D784|        |B4DA24;
    dw pAIScripting0x3B                                        ;B4D786|        |B4DA24;
    dw pAIScripting0x3B                                        ;B4D788|        |B4DA24;
    dw pAIScripting0x3B                                        ;B4D78A|        |B4DA24;
    dw pAIScripting0x3B                                        ;B4D78C|        |B4DA24;
    dw pAIScripting0x3B                                        ;B4D78E|        |B4DA24;
    dw pAIScripting0x3B                                        ;B4D790|        |B4DA24;
    dw pAIScripting0x3B                                        ;B4D792|        |B4DA24;
 
DATA8_B4D794:
 
    %AICMD0x00_SetMusic($10, $B4)                              ;B4D794
    %AICMD0x02_FreezeTime()                                    ;B4D797
    %AICMD0x03_SetHour($06)                                    ;B4D798
    %AICMD0x05_SetTransferPosition(280, 376)                   ;B4D79A
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4D79F
    %AICMD0x40_DisableTileInteractions()                       ;B4D7A1
    %AICMD0x08_EnableAIControl()                               ;B4D7A2
    %AICMD0x09($01, $B4D846)                                   ;B4D7A3
    %AICMD0x09($02, $B4D7FF)                                   ;B4D7A7
    %AICMD0x06_SetDestinationArea(!AREA_FARMSUMMER)            ;B4D7AB
    %AICMD0x38()                                               ;B4D7AD
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 112)                 ;B4D7AE
    %AICMD0x13_Wait(60)                                        ;B4D7B2
    %AICMD0x0B($00)                                            ;B4D7B5
    %AICMD0x13_Wait(60)                                        ;B4D7B7
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 16)                  ;B4D7BA
    %AICMD0x13_Wait(120)                                       ;B4D7BE
    %AICMD0x19($0023, $00)                                     ;B4D7C1
    %AICMD0x13_Wait(60)                                        ;B4D7C5
    %AICMD0x19($0003, $00)                                     ;B4D7C8
    %AICMD0x13_Wait(10)                                        ;B4D7CC
    %AICMD0x19($0023, $00)                                     ;B4D7CF
    %AICMD0x13_Wait(60)                                        ;B4D7D3
    %AICMD0x0C($01)                                            ;B4D7D6
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 16)                  ;B4D7D8
    %AICMD0x13_Wait(10)                                        ;B4D7DC
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 24)                  ;B4D7DF
    %AICMD0x13_Wait(10)                                        ;B4D7E3
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 32)                  ;B4D7E6
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B4D7EA
    %AICMD0x13_Wait(40)                                        ;B4D7EC
    %AICMD0x0B($02)                                            ;B4D7EF
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 16)                  ;B4D7F1
    %AICMD0x13_Wait(20)                                        ;B4D7F5
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 48)                  ;B4D7F8
    %AICMD0x3D_TeleportToArea(!AREA_ENDING00)                  ;B4D7FC
    %AICMD0x10_End()                                           ;B4D7FE
B4D7FF:
    %AICMD0x1A($0088, $0158, $B3845C, $00)                     ;B4D7FF
    %AICMD0x0C($00)                                            ;B4D807
    %AICMD0x1B($02E3, $00)                                     ;B4D809
    %AICMD0x0D($00, $01, $20, $01)                             ;B4D80D
    %AICMD0x1B($02E6, $01)                                     ;B4D812
    %AICMD0x13_Wait(90)                                        ;B4D816
    %AICMD0x1B($0233, $01)                                     ;B4D819
    %AICMD0x13_Wait(120)                                       ;B4D81D
    %AICMD0x1B($02E9, $00)                                     ;B4D820
    %AICMD0x13_Wait(120)                                       ;B4D824
    %AICMD0x0B($01)                                            ;B4D827
    %AICMD0x0C($02)                                            ;B4D829
    %AICMD0x1B($02E3, $00)                                     ;B4D82B
    %AICMD0x0D($00, $01, $30, $01)                             ;B4D82F
    %AICMD0x13_Wait(10)                                        ;B4D834
    %AICMD0x1B($02E7, $00)                                     ;B4D837
    %AICMD0x0D($FF, $00, $30, $01)                             ;B4D83B
    %AICMD0x13_Wait(1)                                         ;B4D840
    %AICMD0x12_Jump($B4D840)                                   ;B4D843
B4D846:
    %AICMD0x1A($0088, $0068, $B38114, $02)                     ;B4D846
    %AICMD0x13_Wait(120)                                       ;B4D84E
    %AICMD0x1B($01EA, $01)                                     ;B4D851
    %AICMD0x13_Wait(160)                                       ;B4D855
    %AICMD0x1B($01F6, $01)                                     ;B4D858
    %AICMD0x12_Jump($B4D85F)                                   ;B4D85C
B4D85F:
    %AICMD0x13_Wait(1)                                         ;B4D85F
    %AICMD0x12_Jump($B4D85F)                                   ;B4D862


DATA8_B4D865:
 
    %AICMD0x00_SetMusic($10, $B4)                              ;B4D865
    %AICMD0x02_FreezeTime()                                    ;B4D868
    %AICMD0x03_SetHour($07)                                    ;B4D869
    %AICMD0x05_SetTransferPosition(744, 424)                   ;B4D86B
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4D870
    %AICMD0x08_EnableAIControl()                               ;B4D872
    %AICMD0x09($01, $B4D95E)                                   ;B4D873
    %AICMD0x09($02, $B4D8E2)                                   ;B4D877
    %AICMD0x09($03, $B4D99A)                                   ;B4D87B
    %AICMD0x09($04, $B4D9BF)                                   ;B4D87F
    %AICMD0x09($05, $B4D975)                                   ;B4D883
    %AICMD0x09($06, $B4D983)                                   ;B4D887
    %AICMD0x09($07, $B4D9DB)                                   ;B4D88B
    %AICMD0x09($08, $B4D9FB)                                   ;B4D88F
    %AICMD0x06_SetDestinationArea(!AREA_TOWNSUMMER)            ;B4D893
    %AICMD0x38()                                               ;B4D895
    %AICMD0x13_Wait(90)                                        ;B4D896
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 56)                  ;B4D899
    %AICMD0x13_Wait(20)                                        ;B4D89D
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 136)                   ;B4D8A0
    %AICMD0x13_Wait(20)                                        ;B4D8A4
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 168)                 ;B4D8A7
    %AICMD0x13_Wait(20)                                        ;B4D8AB
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 160)                 ;B4D8AE
    %AICMD0x13_Wait(20)                                        ;B4D8B2
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 96)                    ;B4D8B5
    %AICMD0x13_Wait(120)                                       ;B4D8B9
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 96)                  ;B4D8BC
    %AICMD0x13_Wait(60)                                        ;B4D8C0
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 210)                 ;B4D8C3
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4D8C7
    %AICMD0x13_Wait(60)                                        ;B4D8C9
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 96)                    ;B4D8CC
    %AICMD0x0B($00)                                            ;B4D8D0
    %AICMD0x13_Wait(120)                                       ;B4D8D2
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4D8D5
    %AICMD0x13_Wait(60)                                        ;B4D8D7
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4D8DA
    %AICMD0x13_Wait(120)                                       ;B4D8DC
    %AICMD0x3D_TeleportToArea(!AREA_ENDING00)                  ;B4D8DF
    %AICMD0x10_End()                                           ;B4D8E1
B4D8E2:
    %AICMD0x1A($02F8, $01A8, $B3845C, $03)                     ;B4D8E2
    %AICMD0x13_Wait(90)                                        ;B4D8EA
    %AICMD0x1B($02E7, $00)                                     ;B4D8ED
    %AICMD0x0D($FF, $00, $38, $01)                             ;B4D8F1
    %AICMD0x13_Wait(30)                                        ;B4D8F6
    %AICMD0x1B($02E5, $00)                                     ;B4D8F9
    %AICMD0x0D($00, $FF, $88, $01)                             ;B4D8FD
    %AICMD0x13_Wait(20)                                        ;B4D902
    %AICMD0x1B($02E7, $00)                                     ;B4D905
    %AICMD0x0D($FF, $00, $A8, $01)                             ;B4D909
    %AICMD0x13_Wait(20)                                        ;B4D90E
    %AICMD0x1B($02E7, $00)                                     ;B4D911
    %AICMD0x0D($FF, $00, $A0, $01)                             ;B4D915
    %AICMD0x13_Wait(20)                                        ;B4D91A
    %AICMD0x1B($02E5, $00)                                     ;B4D91D
    %AICMD0x0D($00, $FF, $70, $01)                             ;B4D921
    %AICMD0x0B($02)                                            ;B4D926
    %AICMD0x13_Wait(120)                                       ;B4D928
    %AICMD0x1B($02E3, $00)                                     ;B4D92B
    %AICMD0x0D($00, $01, $70, $01)                             ;B4D92F
    %AICMD0x13_Wait(20)                                        ;B4D934
    %AICMD0x1B($02E7, $00)                                     ;B4D937
    %AICMD0x0D($FF, $00, $D4, $01)                             ;B4D93B
    %AICMD0x13_Wait(60)                                        ;B4D940
    %AICMD0x1B($02E5, $00)                                     ;B4D943
    %AICMD0x0D($00, $FF, $60, $01)                             ;B4D947
    %AICMD0x0B($01)                                            ;B4D94C
    %AICMD0x13_Wait(120)                                       ;B4D94E
    %AICMD0x1B($02E6, $01)                                     ;B4D951
    %AICMD0x13_Wait(60)                                        ;B4D955
    %AICMD0x13_Wait(1)                                         ;B4D958
    %AICMD0x12_Jump($B4D958)                                   ;B4D95B
B4D95E:
    %AICMD0x1A($0178, $00A8, $B38354, $00)                     ;B4D95E
    %AICMD0x0C($02)                                            ;B4D966
    %AICMD0x1B($02A6, $00)                                     ;B4D968
    %AICMD0x13_Wait(120)                                       ;B4D96C
    %AICMD0x13_Wait(1)                                         ;B4D96F
    %AICMD0x12_Jump($B4D96F)                                   ;B4D972
B4D975:
    %AICMD0x1A($0158, $00C8, $B3842C, $00)                     ;B4D975
    %AICMD0x13_Wait(1)                                         ;B4D97D
    %AICMD0x12_Jump($B4D97D)                                   ;B4D980
B4D983:
    %AICMD0x1A($0168, $00B8, $B38384, $00)                     ;B4D983
    %AICMD0x0C($02)                                            ;B4D98B
    %AICMD0x1B($02B6, $01)                                     ;B4D98D
    %AICMD0x13_Wait(120)                                       ;B4D991
    %AICMD0x13_Wait(1)                                         ;B4D994
    %AICMD0x12_Jump($B4D994)                                   ;B4D997
B4D99A:
    %AICMD0x1A($0088, $00B8, $B3830C, $03)                     ;B4D99A
    %AICMD0x0C($00)                                            ;B4D9A2
    %AICMD0x1B($0293, $01)                                     ;B4D9A4
    %AICMD0x13_Wait(60)                                        ;B4D9A8
    %AICMD0x1B($028F, $00)                                     ;B4D9AB
    %AICMD0x13_Wait(60)                                        ;B4D9AF
    %AICMD0x1B($0295, $00)                                     ;B4D9B2
    %AICMD0x13_Wait(120)                                       ;B4D9B6
    %AICMD0x13_Wait(1)                                         ;B4D9B9
    %AICMD0x12_Jump($B4D9B9)                                   ;B4D9BC
B4D9BF:
    %AICMD0x1A($0098, $00A8, $B383E4, $02)                     ;B4D9BF
    %AICMD0x13_Wait(120)                                       ;B4D9C7
    %AICMD0x1B($02C4, $00)                                     ;B4D9CA
    %AICMD0x13_Wait(60)                                        ;B4D9CE
    %AICMD0x1B($02C5, $00)                                     ;B4D9D1
    %AICMD0x13_Wait(1)                                         ;B4D9D5
    %AICMD0x12_Jump($B4D9D5)                                   ;B4D9D8
B4D9DB:
    %AICMD0x1A($0078, $00B8, $B38438, $02)                     ;B4D9DB
    %AICMD0x0C($00)                                            ;B4D9E3
    %AICMD0x1B($02DA, $00)                                     ;B4D9E5
    %AICMD0x0D($00, $01, $10, $01)                             ;B4D9E9
    %AICMD0x1B($02DD, $01)                                     ;B4D9EE
    %AICMD0x13_Wait(120)                                       ;B4D9F2
    %AICMD0x13_Wait(1)                                         ;B4D9F5
    %AICMD0x12_Jump($B4D9F5)                                   ;B4D9F8
B4D9FB:
    %AICMD0x1A($00A8, $00A8, $B38450, $03)                     ;B4D9FB
    %AICMD0x0C($00)                                            ;B4DA03
    %AICMD0x1B($02E1, $01)                                     ;B4DA05
    %AICMD0x0D($01, $00, $10, $01)                             ;B4DA09
    %AICMD0x1B($02DF, $00)                                     ;B4DA0E
    %AICMD0x0D($00, $01, $10, $01)                             ;B4DA12
    %AICMD0x1B($02E1, $00)                                     ;B4DA17
    %AICMD0x13_Wait(120)                                       ;B4DA1B
    %AICMD0x13_Wait(1)                                         ;B4DA1E
    %AICMD0x12_Jump($B4DA1E)                                   ;B4DA21


pAIScripting0x3B:
    dw DATA8_B4DA44                                            ;B4DA24|        |B4DA44;
    dw DATA8_B4DB0C                                            ;B4DA26|        |B4DB0C;
    dw pAIScripting0x3C                                        ;B4DA28|        |B4DCCF;
    dw pAIScripting0x3C                                        ;B4DA2A|        |B4DCCF;
    dw pAIScripting0x3C                                        ;B4DA2C|        |B4DCCF;
    dw pAIScripting0x3C                                        ;B4DA2E|        |B4DCCF;
    dw pAIScripting0x3C                                        ;B4DA30|        |B4DCCF;
    dw pAIScripting0x3C                                        ;B4DA32|        |B4DCCF;
    dw pAIScripting0x3C                                        ;B4DA34|        |B4DCCF;
    dw pAIScripting0x3C                                        ;B4DA36|        |B4DCCF;
    dw pAIScripting0x3C                                        ;B4DA38|        |B4DCCF;
    dw pAIScripting0x3C                                        ;B4DA3A|        |B4DCCF;
    dw pAIScripting0x3C                                        ;B4DA3C|        |B4DCCF;
    dw pAIScripting0x3C                                        ;B4DA3E|        |B4DCCF;
    dw pAIScripting0x3C                                        ;B4DA40|        |B4DCCF;
    dw pAIScripting0x3C                                        ;B4DA42|        |B4DCCF;
 
DATA8_B4DA44:
 
    %AICMD0x00_SetMusic($10, $B4)                              ;B4DA44
    %AICMD0x02_FreezeTime()                                    ;B4DA47
    %AICMD0x03_SetHour($07)                                    ;B4DA48
    %AICMD0x05_SetTransferPosition(136, 456)                   ;B4DA4A
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B4DA4F
    %AICMD0x08_EnableAIControl()                               ;B4DA51
    %AICMD0x09($01, $B4DA92)                                   ;B4DA52
    %AICMD0x06_SetDestinationArea(!AREA_TOOLSSHOP)             ;B4DA56
    %AICMD0x38()                                               ;B4DA58
    %AICMD0x13_Wait(60)                                        ;B4DA59
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 64)                    ;B4DA5C
    %AICMD0x13_Wait(60)                                        ;B4DA60
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4DA63
    %AICMD0x0B($00)                                            ;B4DA65
    %AICMD0x13_Wait(96)                                        ;B4DA67
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4DA6A
    %AICMD0x13_Wait(30)                                        ;B4DA6C
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4DA6F
    %AICMD0x13_Wait(30)                                        ;B4DA71
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 32)                    ;B4DA74
    %AICMD0x13_Wait(60)                                        ;B4DA78
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 64)                  ;B4DA7B
    %AICMD0x13_Wait(60)                                        ;B4DA7F
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 16)                  ;B4DA82
    %AICMD0x13_Wait(30)                                        ;B4DA86
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 96)                 ;B4DA89
    %AICMD0x0C($01)                                            ;B4DA8D
    %AICMD0x3D_TeleportToArea(!AREA_ENDING00)                  ;B4DA8F
    %AICMD0x10_End()                                           ;B4DA91
B4DA92:
    %AICMD0x1A($0098, $01E8, $B3845C, $00)                     ;B4DA92
    %AICMD0x0C($00)                                            ;B4DA9A
    %AICMD0x1B($02E5, $00)                                     ;B4DA9C
    %AICMD0x0D($00, $FF, $60, $01)                             ;B4DAA0
    %AICMD0x1B($02E7, $00)                                     ;B4DAA5
    %AICMD0x13_Wait(30)                                        ;B4DAA9
    %AICMD0x1B($02E7, $01)                                     ;B4DAAC
    %AICMD0x13_Wait(30)                                        ;B4DAB0
    %AICMD0x1B($02E5, $00)                                     ;B4DAB3
    %AICMD0x0D($00, $FF, $20, $01)                             ;B4DAB7
    %AICMD0x1B($02E7, $00)                                     ;B4DABC
    %AICMD0x13_Wait(80)                                        ;B4DAC0
    %AICMD0x1B($02E7, $01)                                     ;B4DAC3
    %AICMD0x0D($01, $00, $30, $01)                             ;B4DAC7
    %AICMD0x13_Wait(30)                                        ;B4DACC
    %AICMD0x09($02, $B4DAFE)                                   ;B4DACF
    %AICMD0x13_Wait(30)                                        ;B4DAD3
    %AICMD0x1B($0233, $01)                                     ;B4DAD6
    %AICMD0x13_Wait(60)                                        ;B4DADA
    %AICMD0x1B($02E3, $00)                                     ;B4DADD
    %AICMD0x0D($00, $01, $10, $01)                             ;B4DAE1
    %AICMD0x1B($02E7, $00)                                     ;B4DAE6
    %AICMD0x0D($FF, $00, $10, $01)                             ;B4DAEA
    %AICMD0x1B($0233, $00)                                     ;B4DAEF
    %AICMD0x13_Wait(120)                                       ;B4DAF3
    %AICMD0x0B($01)                                            ;B4DAF6
    %AICMD0x13_Wait(1)                                         ;B4DAF8
    %AICMD0x12_Jump($B4DAF8)                                   ;B4DAFB
B4DAFE:
    %AICMD0x1A($00D8, $0168, $B38B1C, $00)                     ;B4DAFE
    %AICMD0x13_Wait(1)                                         ;B4DB06
    %AICMD0x12_Jump($B4DB06)                                   ;B4DB09


DATA8_B4DB0C:
 
    %AICMD0x00_SetMusic($10, $B4)                              ;B4DB0C
    %AICMD0x02_FreezeTime()                                    ;B4DB0F
    %AICMD0x03_SetHour($07)                                    ;B4DB10
    %AICMD0x05_SetTransferPosition(296, 872)                   ;B4DB12
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4DB17
    %AICMD0x08_EnableAIControl()                               ;B4DB19
    %AICMD0x09($01, $B4DB88)                                   ;B4DB1A
    %AICMD0x09($02, $B4DC52)                                   ;B4DB1E
    %AICMD0x09($03, $B4DC20)                                   ;B4DB22
    %AICMD0x09($04, $B4DC39)                                   ;B4DB26
    %AICMD0x09($05, $B4DC6B)                                   ;B4DB2A
    %AICMD0x06_SetDestinationArea(!AREA_TOWNSUMMER)            ;B4DB2E
    %AICMD0x38()                                               ;B4DB30
    %AICMD0x13_Wait(90)                                        ;B4DB31
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 32)                 ;B4DB34
    %AICMD0x13_Wait(20)                                        ;B4DB38
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 144)                   ;B4DB3B
    %AICMD0x13_Wait(20)                                        ;B4DB3F
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 32)                  ;B4DB42
    %AICMD0x13_Wait(20)                                        ;B4DB46
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 160)                   ;B4DB49
    %AICMD0x0B($00)                                            ;B4DB4D
    %AICMD0x0C($01)                                            ;B4DB4F
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4DB51
    %AICMD0x13_Wait(60)                                        ;B4DB53
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 16)                    ;B4DB56
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 80)                 ;B4DB5A
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 240)                   ;B4DB5E
    %AICMD0x13_Wait(60)                                        ;B4DB62
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 112)                   ;B4DB65
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4DB69
    %AICMD0x13_Wait(120)                                       ;B4DB6B
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B4DB6E
    %AICMD0x19($0021, $00)                                     ;B4DB70
    %AICMD0x13_Wait(80)                                        ;B4DB74
    %AICMD0x19($0001, $00)                                     ;B4DB77
    %AICMD0x13_Wait(10)                                        ;B4DB7B
    %AICMD0x19($0021, $00)                                     ;B4DB7E
    %AICMD0x13_Wait(180)                                       ;B4DB82
    %AICMD0x3D_TeleportToArea(!AREA_ENDING00)                  ;B4DB85
    %AICMD0x10_End()                                           ;B4DB87
B4DB88:
    %AICMD0x1A($0118, $0368, $B3845C, $00)                     ;B4DB88
    %AICMD0x13_Wait(120)                                       ;B4DB90
    %AICMD0x1B($02E7, $01)                                     ;B4DB93
    %AICMD0x0D($01, $00, $20, $01)                             ;B4DB97
    %AICMD0x13_Wait(20)                                        ;B4DB9C
    %AICMD0x1B($02E7, $01)                                     ;B4DB9F
    %AICMD0x0D($01, $00, $10, $01)                             ;B4DBA3
    %AICMD0x13_Wait(20)                                        ;B4DBA8
    %AICMD0x1B($02E5, $00)                                     ;B4DBAB
    %AICMD0x0D($00, $FF, $90, $01)                             ;B4DBAF
    %AICMD0x13_Wait(20)                                        ;B4DBB4
    %AICMD0x1B($02E7, $00)                                     ;B4DBB7
    %AICMD0x0D($FF, $00, $10, $01)                             ;B4DBBB
    %AICMD0x13_Wait(20)                                        ;B4DBC0
    %AICMD0x1B($02E5, $00)                                     ;B4DBC3
    %AICMD0x0D($00, $FF, $A0, $01)                             ;B4DBC7
    %AICMD0x0C($01)                                            ;B4DBCC
    %AICMD0x1B($02E6, $00)                                     ;B4DBCE
    %AICMD0x13_Wait(60)                                        ;B4DBD2
    %AICMD0x1B($02E5, $00)                                     ;B4DBD5
    %AICMD0x13_Wait(60)                                        ;B4DBD9
    %AICMD0x1B($02E7, $01)                                     ;B4DBDC
    %AICMD0x0D($01, $00, $30, $01)                             ;B4DBE0
    %AICMD0x1B($02E5, $00)                                     ;B4DBE5
    %AICMD0x0D($00, $FF, $FF, $01)                             ;B4DBE9
    %AICMD0x13_Wait(60)                                        ;B4DBEE
    %AICMD0x1B($02E5, $00)                                     ;B4DBF1
    %AICMD0x0D($00, $FF, $78, $01)                             ;B4DBF5
    %AICMD0x1B($02E6, $01)                                     ;B4DBFA
    %AICMD0x13_Wait(120)                                       ;B4DBFE
    %AICMD0x1B($02E7, $00)                                     ;B4DC01
    %AICMD0x0D($FF, $00, $10, $01)                             ;B4DC05
    %AICMD0x1B($02E5, $00)                                     ;B4DC0A
    %AICMD0x0D($00, $FF, $18, $01)                             ;B4DC0E
    %AICMD0x1B($0233, $01)                                     ;B4DC13
    %AICMD0x13_Wait(180)                                       ;B4DC17
    %AICMD0x13_Wait(1)                                         ;B4DC1A
    %AICMD0x12_Jump($B4DC1A)                                   ;B4DC1D
B4DC20:
    %AICMD0x1A($0168, $00A8, $B38318, $00)                     ;B4DC20
    %AICMD0x1B($029A, $01)                                     ;B4DC28
    %AICMD0x13_Wait(60)                                        ;B4DC2C
    %AICMD0x1B($029C, $00)                                     ;B4DC2F
    %AICMD0x13_Wait(180)                                       ;B4DC33
    %AICMD0x12_Jump($B4DC28)                                   ;B4DC36
B4DC39:
    %AICMD0x1A($0178, $00A8, $B383FC, $00)                     ;B4DC39
    %AICMD0x1B($02D0, $00)                                     ;B4DC41
    %AICMD0x13_Wait(60)                                        ;B4DC45
    %AICMD0x1B($02CC, $00)                                     ;B4DC48
    %AICMD0x13_Wait(180)                                       ;B4DC4C
    %AICMD0x12_Jump($B4DC41)                                   ;B4DC4F
B4DC52:
    %AICMD0x1A($0148, $00B8, $B38354, $02)                     ;B4DC52
    %AICMD0x1B($02A5, $00)                                     ;B4DC5A
    %AICMD0x13_Wait(120)                                       ;B4DC5E
    %AICMD0x1B($02A6, $00)                                     ;B4DC61
    %AICMD0x13_Wait(120)                                       ;B4DC65
    %AICMD0x12_Jump($B4DC5A)                                   ;B4DC68
B4DC6B:
    %AICMD0x1A($01B8, $0218, $B381D4, $03)                     ;B4DC6B
    %AICMD0x0C($00)                                            ;B4DC73
    %AICMD0x0D($FF, $00, $80, $01)                             ;B4DC75
    %AICMD0x1B($024C, $00)                                     ;B4DC7A
    %AICMD0x0D($00, $01, $08, $01)                             ;B4DC7E
    %AICMD0x1B($0351, $00)                                     ;B4DC83
    %AICMD0x13_Wait(120)                                       ;B4DC87
    %AICMD0x1B($024E, $00)                                     ;B4DC8A
    %AICMD0x0D($00, $FF, $18, $01)                             ;B4DC8E
    %AICMD0x1B($0250, $01)                                     ;B4DC93
    %AICMD0x0D($01, $00, $30, $01)                             ;B4DC97
    %AICMD0x1B($024E, $00)                                     ;B4DC9C
    %AICMD0x0D($00, $FF, $50, $01)                             ;B4DCA0
    %AICMD0x0B($01)                                            ;B4DCA5
    %AICMD0x1B($024E, $00)                                     ;B4DCA7
    %AICMD0x0D($00, $FF, $B4, $01)                             ;B4DCAB
    %AICMD0x1B($0250, $01)                                     ;B4DCB0
    %AICMD0x0D($01, $00, $20, $01)                             ;B4DCB4
    %AICMD0x1B($024E, $00)                                     ;B4DCB9
    %AICMD0x0D($00, $FF, $50, $01)                             ;B4DCBD
    %AICMD0x1B($0250, $00)                                     ;B4DCC2
    %AICMD0x13_Wait(180)                                       ;B4DCC6
    %AICMD0x13_Wait(1)                                         ;B4DCC9
    %AICMD0x12_Jump($B4DCC9)                                   ;B4DCCC


pAIScripting0x3C:
    dw DATA8_B4DCEF                                            ;B4DCCF|        |B4DCEF;
    dw DATA8_B4DE40                                            ;B4DCD1|        |B4DE40;
    dw pAIScripting0x3D                                        ;B4DCD3|        |B4DF96;
    dw pAIScripting0x3D                                        ;B4DCD5|        |B4DF96;
    dw pAIScripting0x3D                                        ;B4DCD7|        |B4DF96;
    dw pAIScripting0x3D                                        ;B4DCD9|        |B4DF96;
    dw pAIScripting0x3D                                        ;B4DCDB|        |B4DF96;
    dw pAIScripting0x3D                                        ;B4DCDD|        |B4DF96;
    dw pAIScripting0x3D                                        ;B4DCDF|        |B4DF96;
    dw pAIScripting0x3D                                        ;B4DCE1|        |B4DF96;
    dw pAIScripting0x3D                                        ;B4DCE3|        |B4DF96;
    dw pAIScripting0x3D                                        ;B4DCE5|        |B4DF96;
    dw pAIScripting0x3D                                        ;B4DCE7|        |B4DF96;
    dw pAIScripting0x3D                                        ;B4DCE9|        |B4DF96;
    dw pAIScripting0x3D                                        ;B4DCEB|        |B4DF96;
    dw pAIScripting0x3D                                        ;B4DCED|        |B4DF96;
 
DATA8_B4DCEF:
 
    %AICMD0x00_SetMusic($10, $B4)                              ;B4DCEF
    %AICMD0x02_FreezeTime()                                    ;B4DCF2
    %AICMD0x03_SetHour($06)                                    ;B4DCF3
    %AICMD0x05_SetTransferPosition(65528, 104)                 ;B4DCF5
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4DCFA
    %AICMD0x40_DisableTileInteractions()                       ;B4DCFC
    %AICMD0x08_EnableAIControl()                               ;B4DCFD
    %AICMD0x09($01, $B4DD4F)                                   ;B4DCFE
    %AICMD0x09($02, $B4DD76)                                   ;B4DD02
    %AICMD0x09($03, $B4DE2B)                                   ;B4DD06
    %AICMD0x06_SetDestinationArea(!AREA_ENDING04)              ;B4DD0A
    %AICMD0x38()                                               ;B4DD0C
    %AICMD0x0C($00)                                            ;B4DD0D
    %AICMD0x13_Wait(20)                                        ;B4DD0F
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 96)                 ;B4DD12
    %AICMD0x13_Wait(20)                                        ;B4DD16
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 32)                    ;B4DD19
    %AICMD0x13_Wait(30)                                        ;B4DD1D
    %AICMD0x19($0071, $00)                                     ;B4DD20
    %AICMD0x13_Wait(60)                                        ;B4DD24
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 32)                  ;B4DD27
    %AICMD0x13_Wait(20)                                        ;B4DD2B
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 16)                 ;B4DD2E
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4DD32
    %AICMD0x13_Wait(30)                                        ;B4DD34
    %AICMD0x19($006A, $00)                                     ;B4DD37
    %AICMD0x13_Wait(80)                                        ;B4DD3B
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4DD3E
    %AICMD0x13_Wait(20)                                        ;B4DD40
    %AICMD0x19($006A, $00)                                     ;B4DD43
    %AICMD0x13_Wait(180)                                       ;B4DD47
    %AICMD0x0C($01)                                            ;B4DD4A
    %AICMD0x3D_TeleportToArea(!AREA_ENDING00)                  ;B4DD4C
    %AICMD0x10_End()                                           ;B4DD4E
B4DD4F:
    %AICMD0x1A($0068, $0098, $B38114, $02)                     ;B4DD4F
    %AICMD0x1B($01F8, $01)                                     ;B4DD57
    %AICMD0x13_Wait(180)                                       ;B4DD5B
    %AICMD0x1B($01EE, $01)                                     ;B4DD5E
    %AICMD0x13_Wait(120)                                       ;B4DD62
    %AICMD0x1B($01EB, $01)                                     ;B4DD65
    %AICMD0x13_Wait(120)                                       ;B4DD69
    %AICMD0x1B($01EF, $01)                                     ;B4DD6C
    %AICMD0x13_Wait(120)                                       ;B4DD70
    %AICMD0x12_Jump($B4DD57)                                   ;B4DD73
B4DD76:
    %AICMD0x1A($0098, $0068, $B38474, $00)                     ;B4DD76
    %AICMD0x13_Wait(120)                                       ;B4DD7E
    %AICMD0x0D($00, $01, $20, $01)                             ;B4DD81
    %AICMD0x13_Wait(60)                                        ;B4DD86
    %AICMD0x1B($02E6, $00)                                     ;B4DD89
    %AICMD0x13_Wait(60)                                        ;B4DD8D
    %AICMD0x1B($02ED, $00)                                     ;B4DD90
    %AICMD0x13_Wait(180)                                       ;B4DD94
    %AICMD0x1B($02E5, $00)                                     ;B4DD97
    %AICMD0x0D($00, $FF, $20, $01)                             ;B4DD9B
    %AICMD0x13_Wait(120)                                       ;B4DDA0
    %AICMD0x1B($02E6, $00)                                     ;B4DDA3
    %AICMD0x13_Wait(60)                                        ;B4DDA7
    %AICMD0x1B($0233, $00)                                     ;B4DDAA
    %AICMD0x0B($00)                                            ;B4DDAE
    %AICMD0x13_Wait(240)                                       ;B4DDB0
    %AICMD0x1B($02E7, $00)                                     ;B4DDB3
    %AICMD0x0D($FF, $00, $10, $01)                             ;B4DDB7
    %AICMD0x13_Wait(60)                                        ;B4DDBC
    %AICMD0x1B($02ED, $00)                                     ;B4DDBF
    %AICMD0x13_Wait(60)                                        ;B4DDC3
    %AICMD0x09($04, $B4DDF9)                                   ;B4DDC6
    %AICMD0x1B($02E7, $00)                                     ;B4DDCA
    %AICMD0x13_Wait(120)                                       ;B4DDCE
    %AICMD0x1B($02E7, $01)                                     ;B4DDD1
    %AICMD0x0D($01, $00, $20, $01)                             ;B4DDD5
    %AICMD0x1B($0258, $01)                                     ;B4DDDA
    %AICMD0x13_Wait(180)                                       ;B4DDDE
    %AICMD0x1B($02E7, $00)                                     ;B4DDE1
    %AICMD0x0D($FF, $00, $20, $01)                             ;B4DDE5
    %AICMD0x1B($0258, $00)                                     ;B4DDEA
    %AICMD0x13_Wait(180)                                       ;B4DDEE
    %AICMD0x0B($01)                                            ;B4DDF1
    %AICMD0x13_Wait(1)                                         ;B4DDF3
    %AICMD0x12_Jump($B4DDF3)                                   ;B4DDF6
B4DDF9:
    %AICMD0x1A($0078, $006A, $B384F8, $02)                     ;B4DDF9
    %AICMD0x1B($0313, $01)                                     ;B4DE01
    %AICMD0x0D($08, $F8, $02, $01)                             ;B4DE05
    %AICMD0x13_Wait(118)                                       ;B4DE0A
    %AICMD0x1B($0313, $01)                                     ;B4DE0D
    %AICMD0x0D($01, $00, $20, $01)                             ;B4DE11
    %AICMD0x13_Wait(180)                                       ;B4DE16
    %AICMD0x1B($0313, $00)                                     ;B4DE19
    %AICMD0x0D($FF, $00, $20, $01)                             ;B4DE1D
    %AICMD0x13_Wait(180)                                       ;B4DE22
    %AICMD0x13_Wait(1)                                         ;B4DE25
    %AICMD0x12_Jump($B4DE25)                                   ;B4DE28
B4DE2B:
    %AICMD0x1A($0078, $0098, $B383FC, $03)                     ;B4DE2B
    %AICMD0x13_Wait(360)                                       ;B4DE33
    %AICMD0x1B($02D1, $00)                                     ;B4DE36
    %AICMD0x13_Wait(1)                                         ;B4DE3A
    %AICMD0x12_Jump($B4DE3A)                                   ;B4DE3D


DATA8_B4DE40:
 
    %AICMD0x00_SetMusic($10, $B4)                              ;B4DE40
    %AICMD0x02_FreezeTime()                                    ;B4DE43
    %AICMD0x03_SetHour($07)                                    ;B4DE44
    %AICMD0x40_DisableTileInteractions()                       ;B4DE46
    %AICMD0x05_SetTransferPosition(136, 648)                   ;B4DE47
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4DE4C
    %AICMD0x08_EnableAIControl()                               ;B4DE4E
    %AICMD0x09($01, $B4DEB3)                                   ;B4DE4F
    %AICMD0x09($02, $B4DF60)                                   ;B4DE53
    %AICMD0x09($03, $B4DF52)                                   ;B4DE57
    %AICMD0x09($04, $B4DF6E)                                   ;B4DE5B
    %AICMD0x06_SetDestinationArea(!AREA_WOODSSPRING)           ;B4DE5F
    %AICMD0x38()                                               ;B4DE61
    %AICMD0x13_Wait(80)                                        ;B4DE62
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4DE65
    %AICMD0x0C($00)                                            ;B4DE67
    %AICMD0x13_Wait(180)                                       ;B4DE69
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 64)                 ;B4DE6C
    %AICMD0x13_Wait(10)                                        ;B4DE70
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B4DE73
    %AICMD0x13_Wait(30)                                        ;B4DE75
    %AICMD0x09($05, $B4DF82)                                   ;B4DE78
    %AICMD0x0C($02)                                            ;B4DE7C
    %AICMD0x13_Wait(20)                                        ;B4DE7E
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4DE81
    %AICMD0x13_Wait(50)                                        ;B4DE83
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 24)                   ;B4DE86
    %AICMD0x4E()                                               ;B4DE8A
    %AICMD0x19($0023, $00)                                     ;B4DE8B
    %AICMD0x13_Wait(60)                                        ;B4DE8F
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4DE92
    %AICMD0x13_Wait(60)                                        ;B4DE94
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4DE97
    %AICMD0x13_Wait(30)                                        ;B4DE99
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4DE9C
    %AICMD0x13_Wait(30)                                        ;B4DE9E
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4DEA1
    %AICMD0x13_Wait(30)                                        ;B4DEA3
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4DEA6
    %AICMD0x13_Wait(30)                                        ;B4DEA8
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4DEAB
    %AICMD0x13_Wait(180)                                       ;B4DEAD
    %AICMD0x3D_TeleportToArea(!AREA_ENDING00)                  ;B4DEB0
    %AICMD0x10_End()                                           ;B4DEB2
B4DEB3:
    %AICMD0x1A($00A8, $0298, $B38474, $03)                     ;B4DEB3
    %AICMD0x13_Wait(60)                                        ;B4DEBB
    %AICMD0x0B($00)                                            ;B4DEBE
    %AICMD0x09($06, $B4DF30)                                   ;B4DEC0
    %AICMD0x1B($02E7, $01)                                     ;B4DEC4
    %AICMD0x0D($01, $00, $20, $01)                             ;B4DEC8
    %AICMD0x1B($02E6, $00)                                     ;B4DECD
    %AICMD0x13_Wait(30)                                        ;B4DED1
    %AICMD0x1B($02E5, $00)                                     ;B4DED4
    %AICMD0x0D($00, $FF, $20, $01)                             ;B4DED8
    %AICMD0x1B($02E7, $01)                                     ;B4DEDD
    %AICMD0x0D($01, $00, $90, $01)                             ;B4DEE1
    %AICMD0x0C($02)                                            ;B4DEE6
    %AICMD0x13_Wait(60)                                        ;B4DEE8
    %AICMD0x09($07, $B4DF15)                                   ;B4DEEB
    %AICMD0x1B($02E7, $00)                                     ;B4DEEF
    %AICMD0x0D($FF, $00, $90, $01)                             ;B4DEF3
    %AICMD0x1B($02E3, $00)                                     ;B4DEF8
    %AICMD0x0D($00, $01, $0E, $01)                             ;B4DEFC
    %AICMD0x1B($02E7, $00)                                     ;B4DF01
    %AICMD0x13_Wait(60)                                        ;B4DF05
    %AICMD0x1B($0258, $00)                                     ;B4DF08
    %AICMD0x13_Wait(120)                                       ;B4DF0C
    %AICMD0x13_Wait(1)                                         ;B4DF0F
    %AICMD0x12_Jump($B4DF0F)                                   ;B4DF12
B4DF15:
    %AICMD0x1A($0158, $0264, $B38BAC, $00)                     ;B4DF15
    %AICMD0x0D($FF, $00, $90, $01)                             ;B4DF1D
    %AICMD0x0D($00, $01, $0E, $01)                             ;B4DF22
    %AICMD0x13_Wait(180)                                       ;B4DF27
    %AICMD0x13_Wait(1)                                         ;B4DF2A
    %AICMD0x12_Jump($B4DF2A)                                   ;B4DF2D
B4DF30:
    %AICMD0x1A($00C8, $0248, $B384EC, $00)                     ;B4DF30
    %AICMD0x13_Wait(30)                                        ;B4DF38
    %AICMD0x0D($01, $00, $08, $02)                             ;B4DF3B
    %AICMD0x0D($00, $FF, $06, $02)                             ;B4DF40
    %AICMD0x0D($FF, $00, $08, $02)                             ;B4DF45
    %AICMD0x0D($01, $00, $08, $02)                             ;B4DF4A
    %AICMD0x12_Jump($B4DF3B)                                   ;B4DF4F
B4DF52:
    %AICMD0x1A($0094, $0298, $B38A5C, $00)                     ;B4DF52
    %AICMD0x13_Wait(1)                                         ;B4DF5A
    %AICMD0x12_Jump($B4DF5A)                                   ;B4DF5D
B4DF60:
    %AICMD0x1A($0092, $02A0, $B3815C, $00)                     ;B4DF60
    %AICMD0x13_Wait(1)                                         ;B4DF68
    %AICMD0x12_Jump($B4DF68)                                   ;B4DF6B
B4DF6E:
    %AICMD0x1A($0088, $0298, $B38A38, $00)                     ;B4DF6E
    %AICMD0x0C($01)                                            ;B4DF76
    %AICMD0x0D($F0, $F0, $01, $01)                             ;B4DF78
    %AICMD0x13_Wait(60)                                        ;B4DF7D
    %AICMD0x37()                                               ;B4DF80
    %AICMD0x10_End()                                           ;B4DF81
B4DF82:
    %AICMD0x1A($0078, $0298, $B38528, $00)                     ;B4DF82
    %AICMD0x13_Wait(60)                                        ;B4DF8A
    %AICMD0x0B($01)                                            ;B4DF8D
    %AICMD0x13_Wait(60)                                        ;B4DF8F
    %AICMD0x0B($02)                                            ;B4DF92
    %AICMD0x37()                                               ;B4DF94
    %AICMD0x10_End()                                           ;B4DF95


pAIScripting0x3D:
    dw DATA8_B4DFB6                                            ;B4DF96|        |B4DFB6;
    dw DATA8_B4E0FA                                            ;B4DF98|        |B4E0FA;
    dw pAIScripting0x3E                                        ;B4DF9A|        |B4E202;
    dw pAIScripting0x3E                                        ;B4DF9C|        |B4E202;
    dw pAIScripting0x3E                                        ;B4DF9E|        |B4E202;
    dw pAIScripting0x3E                                        ;B4DFA0|        |B4E202;
    dw pAIScripting0x3E                                        ;B4DFA2|        |B4E202;
    dw pAIScripting0x3E                                        ;B4DFA4|        |B4E202;
    dw pAIScripting0x3E                                        ;B4DFA6|        |B4E202;
    dw pAIScripting0x3E                                        ;B4DFA8|        |B4E202;
    dw pAIScripting0x3E                                        ;B4DFAA|        |B4E202;
    dw pAIScripting0x3E                                        ;B4DFAC|        |B4E202;
    dw pAIScripting0x3E                                        ;B4DFAE|        |B4E202;
    dw pAIScripting0x3E                                        ;B4DFB0|        |B4E202;
    dw pAIScripting0x3E                                        ;B4DFB2|        |B4E202;
    dw pAIScripting0x3E                                        ;B4DFB4|        |B4E202;
 
DATA8_B4DFB6:
 
    %AICMD0x00_SetMusic($10, $B4)                              ;B4DFB6
    %AICMD0x02_FreezeTime()                                    ;B4DFB9
    %AICMD0x03_SetHour($06)                                    ;B4DFBA
    %AICMD0x05_SetTransferPosition(24, 152)                    ;B4DFBC
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4DFC1
    %AICMD0x40_DisableTileInteractions()                       ;B4DFC3
    %AICMD0x08_EnableAIControl()                               ;B4DFC4
    %AICMD0x09($01, $B4E017)                                   ;B4DFC5
    %AICMD0x09($02, $B4E0AB)                                   ;B4DFC9
    %AICMD0x06_SetDestinationArea(!AREA_ENDING06)              ;B4DFCD
    %AICMD0x38()                                               ;B4DFCF
    %AICMD0x13_Wait(120)                                       ;B4DFD0
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 56)                  ;B4DFD3
    %AICMD0x0B($00)                                            ;B4DFD7
    %AICMD0x19($0052, $00)                                     ;B4DFD9
    %AICMD0x13_Wait(80)                                        ;B4DFDD
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 16)                 ;B4DFE0
    %AICMD0x19($0052, $00)                                     ;B4DFE4
    %AICMD0x13_Wait(80)                                        ;B4DFE8
    %AICMD0x19($0041, $00)                                     ;B4DFEB
    %AICMD0x13_Wait(60)                                        ;B4DFEF
    %AICMD0x0B($01)                                            ;B4DFF2
    %AICMD0x13_Wait(60)                                        ;B4DFF4
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B4DFF7
    %AICMD0x13_Wait(180)                                       ;B4DFF9
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 80)                  ;B4DFFC
    %AICMD0x13_Wait(180)                                       ;B4E000
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B4E003
    %AICMD0x13_Wait(180)                                       ;B4E005
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 48)                 ;B4E008
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B4E00C
    %AICMD0x0C($02)                                            ;B4E00E
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 32)                    ;B4E010
    %AICMD0x3D_TeleportToArea(!AREA_ENDING00)                  ;B4E014
    %AICMD0x10_End()                                           ;B4E016
B4E017:
    %AICMD0x1A($FFCE, $0038, $B38474, $02)                     ;B4E017
    %AICMD0x0C($01)                                            ;B4E01F
    %AICMD0x1B($044A, $01)                                     ;B4E021
    %AICMD0x0D($01, $00, $A0, $01)                             ;B4E025
    %AICMD0x13_Wait(80)                                        ;B4E02A
    %AICMD0x1B($044A, $00)                                     ;B4E02D
    %AICMD0x0D($FF, $00, $A0, $01)                             ;B4E031
    %AICMD0x0D($00, $01, $30, $01)                             ;B4E036
    %AICMD0x13_Wait(30)                                        ;B4E03B
    %AICMD0x1B($044A, $01)                                     ;B4E03E
    %AICMD0x0D($01, $00, $80, $01)                             ;B4E042
    %AICMD0x13_Wait(60)                                        ;B4E047
    %AICMD0x1B($044A, $01)                                     ;B4E04A
    %AICMD0x0D($01, $00, $40, $01)                             ;B4E04E
    %AICMD0x1B($0448, $01)                                     ;B4E053
    %AICMD0x13_Wait(60)                                        ;B4E057
    %AICMD0x09($03, $B4E08B)                                   ;B4E05A
    %AICMD0x1B($0258, $00)                                     ;B4E05E
    %AICMD0x0D($F8, $F8, $01, $01)                             ;B4E062
    %AICMD0x1B($0258, $00)                                     ;B4E067
    %AICMD0x0D($FA, $06, $02, $01)                             ;B4E06B
    %AICMD0x13_Wait(60)                                        ;B4E070
    %AICMD0x0B($02)                                            ;B4E073
    %AICMD0x1B($02E8, $00)                                     ;B4E075
    %AICMD0x13_Wait(60)                                        ;B4E079
    %AICMD0x1B($02E3, $00)                                     ;B4E07C
    %AICMD0x0D($00, $01, $10, $01)                             ;B4E080
    %AICMD0x13_Wait(1)                                         ;B4E085
    %AICMD0x12_Jump($B4E085)                                   ;B4E088
B4E08B:
    %AICMD0x1A($0090, $0068, $B3812C, $02)                     ;B4E08B
    %AICMD0x1B($0203, $01)                                     ;B4E093
    %AICMD0x13_Wait(120)                                       ;B4E097
    %AICMD0x1B($0201, $01)                                     ;B4E09A
    %AICMD0x13_Wait(240)                                       ;B4E09E
    %AICMD0x1B($0205, $01)                                     ;B4E0A1
    %AICMD0x13_Wait(180)                                       ;B4E0A5
    %AICMD0x12_Jump($B4E093)                                   ;B4E0A8
B4E0AB:
    %AICMD0x1A($0048, $0088, $B38114, $02)                     ;B4E0AB
    %AICMD0x0C($00)                                            ;B4E0B3
    %AICMD0x1B($01EC, $01)                                     ;B4E0B5
    %AICMD0x0D($01, $00, $48, $01)                             ;B4E0B9
    %AICMD0x13_Wait(60)                                        ;B4E0BE
    %AICMD0x1B($01F2, $00)                                     ;B4E0C1
    %AICMD0x13_Wait(120)                                       ;B4E0C5
    %AICMD0x1B($01E8, $00)                                     ;B4E0C8
    %AICMD0x13_Wait(60)                                        ;B4E0CC
    %AICMD0x1B($01F6, $00)                                     ;B4E0CF
    %AICMD0x13_Wait(90)                                        ;B4E0D3
    %AICMD0x1B($01F3, $00)                                     ;B4E0D6
    %AICMD0x13_Wait(180)                                       ;B4E0DA
    %AICMD0x1B($01EC, $00)                                     ;B4E0DD
    %AICMD0x0D($FF, $00, $4A, $01)                             ;B4E0E1
    %AICMD0x13_Wait(60)                                        ;B4E0E6
    %AICMD0x1B($01F8, $00)                                     ;B4E0E9
    %AICMD0x13_Wait(240)                                       ;B4E0ED
    %AICMD0x1B($01EA, $01)                                     ;B4E0F0
    %AICMD0x13_Wait(180)                                       ;B4E0F4
    %AICMD0x12_Jump($B4E0E9)                                   ;B4E0F7


DATA8_B4E0FA:
 
    %AICMD0x00_SetMusic($10, $B4)                              ;B4E0FA
    %AICMD0x02_FreezeTime()                                    ;B4E0FD
    %AICMD0x03_SetHour($07)                                    ;B4E0FE
    %AICMD0x05_SetTransferPosition(632, 504)                   ;B4E100
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4E105
    %AICMD0x08_EnableAIControl()                               ;B4E107
    %AICMD0x09($01, $B4E14E)                                   ;B4E108
    %AICMD0x09($02, $B4E1B9)                                   ;B4E10C
    %AICMD0x09($03, $B4E182)                                   ;B4E110
    %AICMD0x09($04, $B4E1E2)                                   ;B4E114
    %AICMD0x06_SetDestinationArea(!AREA_WOODSSUMMER)           ;B4E118
    %AICMD0x38()                                               ;B4E11A
    %AICMD0x13_Wait(30)                                        ;B4E11B
    %AICMD0x0B($00)                                            ;B4E11E
    %AICMD0x19($004A, $00)                                     ;B4E120
    %AICMD0x13_Wait(120)                                       ;B4E124
    %AICMD0x0C($01)                                            ;B4E127
    %AICMD0x19($0041, $00)                                     ;B4E129
    %AICMD0x13_Wait(80)                                        ;B4E12D
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 24)                  ;B4E130
    %AICMD0x13_Wait(20)                                        ;B4E134
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 16)                  ;B4E137
    %AICMD0x13_Wait(20)                                        ;B4E13B
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4E13E
    %AICMD0x0B($02)                                            ;B4E140
    %AICMD0x0C($03)                                            ;B4E142
    %AICMD0x19($0023, $00)                                     ;B4E144
    %AICMD0x13_Wait(120)                                       ;B4E148
    %AICMD0x3D_TeleportToArea(!AREA_ENDING00)                  ;B4E14B
    %AICMD0x10_End()                                           ;B4E14D
B4E14E:
    %AICMD0x1A($01CC, $01A8, $B38558, $02)                     ;B4E14E
    %AICMD0x0C($02)                                            ;B4E156
    %AICMD0x1B($0320, $01)                                     ;B4E158
    %AICMD0x0D($02, $01, $40, $02)                             ;B4E15C
    %AICMD0x0D($01, $00, $10, $01)                             ;B4E161
    %AICMD0x0D($00, $0A, $01, $01)                             ;B4E166
    %AICMD0x0D($01, $01, $1E, $02)                             ;B4E16B
    %AICMD0x13_Wait(30)                                        ;B4E170
    %AICMD0x0B($03)                                            ;B4E173
    %AICMD0x13_Wait(30)                                        ;B4E175
    %AICMD0x1B($031E, $01)                                     ;B4E178
    %AICMD0x13_Wait(1)                                         ;B4E17C
    %AICMD0x12_Jump($B4E17C)                                   ;B4E17F
B4E182:
    %AICMD0x1A($02B0, $0218, $B38378, $01)                     ;B4E182
    %AICMD0x0C($00)                                            ;B4E18A
    %AICMD0x13_Wait(60)                                        ;B4E18C
    %AICMD0x0D($00, $FF, $20, $01)                             ;B4E18F
    %AICMD0x13_Wait(60)                                        ;B4E194
    %AICMD0x1B($02B0, $00)                                     ;B4E197
    %AICMD0x0D($FF, $00, $28, $01)                             ;B4E19B
    %AICMD0x13_Wait(60)                                        ;B4E1A0
    %AICMD0x1B($02B0, $00)                                     ;B4E1A3
    %AICMD0x0B($01)                                            ;B4E1A7
    %AICMD0x13_Wait(180)                                       ;B4E1A9
    %AICMD0x1B($02AB, $00)                                     ;B4E1AC
    %AICMD0x13_Wait(120)                                       ;B4E1B0
    %AICMD0x13_Wait(1)                                         ;B4E1B3
    %AICMD0x12_Jump($B4E1B3)                                   ;B4E1B6
B4E1B9:
    %AICMD0x1A($0258, $0208, $B38474, $01)                     ;B4E1B9
    %AICMD0x0C($01)                                            ;B4E1C1
    %AICMD0x1B($02E6, $01)                                     ;B4E1C3
    %AICMD0x13_Wait(120)                                       ;B4E1C7
    %AICMD0x1B($02E2, $00)                                     ;B4E1CA
    %AICMD0x13_Wait(60)                                        ;B4E1CE
    %AICMD0x1B($02E6, $00)                                     ;B4E1D1
    %AICMD0x13_Wait(60)                                        ;B4E1D5
    %AICMD0x1B($0258, $00)                                     ;B4E1D8
    %AICMD0x13_Wait(1)                                         ;B4E1DC
    %AICMD0x12_Jump($B4E1DC)                                   ;B4E1DF
B4E1E2:
    %AICMD0x1A($0238, $0238, $B38114, $02)                     ;B4E1E2
    %AICMD0x1B($01F8, $00)                                     ;B4E1EA
    %AICMD0x13_Wait(240)                                       ;B4E1EE
    %AICMD0x1B($01EA, $01)                                     ;B4E1F1
    %AICMD0x13_Wait(180)                                       ;B4E1F5
    %AICMD0x1B($01EB, $01)                                     ;B4E1F8
    %AICMD0x13_Wait(180)                                       ;B4E1FC
    %AICMD0x12_Jump($B4E1EA)                                   ;B4E1FF


pAIScripting0x3E:
    dw DATA8_B4E222                                            ;B4E202|        |B4E222;
    dw pAIScripting0x3F                                        ;B4E204|        |B4E401;
    dw pAIScripting0x3F                                        ;B4E206|        |B4E401;
    dw pAIScripting0x3F                                        ;B4E208|        |B4E401;
    dw pAIScripting0x3F                                        ;B4E20A|        |B4E401;
    dw pAIScripting0x3F                                        ;B4E20C|        |B4E401;
    dw pAIScripting0x3F                                        ;B4E20E|        |B4E401;
    dw pAIScripting0x3F                                        ;B4E210|        |B4E401;
    dw pAIScripting0x3F                                        ;B4E212|        |B4E401;
    dw pAIScripting0x3F                                        ;B4E214|        |B4E401;
    dw pAIScripting0x3F                                        ;B4E216|        |B4E401;
    dw pAIScripting0x3F                                        ;B4E218|        |B4E401;
    dw pAIScripting0x3F                                        ;B4E21A|        |B4E401;
    dw pAIScripting0x3F                                        ;B4E21C|        |B4E401;
    dw pAIScripting0x3F                                        ;B4E21E|        |B4E401;
    dw pAIScripting0x3F                                        ;B4E220|        |B4E401;
 
DATA8_B4E222:
 
    %AICMD0x00_SetMusic($10, $B4)                              ;B4E222
    %AICMD0x02_FreezeTime()                                    ;B4E225
    %AICMD0x03_SetHour($07)                                    ;B4E226
    %AICMD0x05_SetTransferPosition(584, 432)                   ;B4E228
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4E22D
    %AICMD0x08_EnableAIControl()                               ;B4E22F
    %AICMD0x09($01, $B4E35E)                                   ;B4E230
    %AICMD0x09($02, $B4E323)                                   ;B4E234
    %AICMD0x09($03, $B4E2B6)                                   ;B4E238
    %AICMD0x09($04, $B4E3C9)                                   ;B4E23C
    %AICMD0x09($05, $B4E3D7)                                   ;B4E240
    %AICMD0x09($06, $B4E3E5)                                   ;B4E244
    %AICMD0x09($07, $B4E395)                                   ;B4E248
    %AICMD0x06_SetDestinationArea(!AREA_WOODSSUMMER)           ;B4E24C
    %AICMD0x38()                                               ;B4E24E
    %AICMD0x13_Wait(30)                                        ;B4E24F
    %AICMD0x19($005F, $00)                                     ;B4E252
    %AICMD0x13_Wait(80)                                        ;B4E256
    %AICMD0x19($0003, $00)                                     ;B4E259
    %AICMD0x13_Wait(1)                                         ;B4E25D
    %AICMD0x19($005F, $00)                                     ;B4E260
    %AICMD0x13_Wait(80)                                        ;B4E264
    %AICMD0x19($0003, $00)                                     ;B4E267
    %AICMD0x13_Wait(1)                                         ;B4E26B
    %AICMD0x19($005F, $00)                                     ;B4E26E
    %AICMD0x13_Wait(80)                                        ;B4E272
    %AICMD0x19($0003, $00)                                     ;B4E275
    %AICMD0x13_Wait(1)                                         ;B4E279
    %AICMD0x19($005F, $00)                                     ;B4E27C
    %AICMD0x13_Wait(80)                                        ;B4E280
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4E283
    %AICMD0x13_Wait(30)                                        ;B4E285
    %AICMD0x19($004A, $00)                                     ;B4E288
    %AICMD0x13_Wait(180)                                       ;B4E28C
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 32)                  ;B4E28F
    %AICMD0x0B($00)                                            ;B4E293
    %AICMD0x13_Wait(120)                                       ;B4E295
    %AICMD0x19($0043, $00)                                     ;B4E298
    %AICMD0x13_Wait(120)                                       ;B4E29C
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 16)                  ;B4E29F
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 16)                  ;B4E2A3
    %AICMD0x0C($03)                                            ;B4E2A7
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4E2A9
    %AICMD0x13_Wait(30)                                        ;B4E2AB
    %AICMD0x0C($04)                                            ;B4E2AE
    %AICMD0x13_Wait(90)                                        ;B4E2B0
    %AICMD0x3D_TeleportToArea(!AREA_ENDING00)                  ;B4E2B3
    %AICMD0x10_End()                                           ;B4E2B5
B4E2B6:
    %AICMD0x1A($0208, $01D8, $B38474, $00)                     ;B4E2B6
    %AICMD0x0C($00)                                            ;B4E2BE
    %AICMD0x13_Wait(30)                                        ;B4E2C0
    %AICMD0x1B($02E7, $01)                                     ;B4E2C3
    %AICMD0x0D($01, $00, $30, $01)                             ;B4E2C7
    %AICMD0x13_Wait(80)                                        ;B4E2CC
    %AICMD0x1B($02E3, $00)                                     ;B4E2CF
    %AICMD0x0D($00, $01, $60, $01)                             ;B4E2D3
    %AICMD0x13_Wait(60)                                        ;B4E2D8
    %AICMD0x1B($02E5, $00)                                     ;B4E2DB
    %AICMD0x0D($00, $FF, $28, $01)                             ;B4E2DF
    %AICMD0x13_Wait(10)                                        ;B4E2E4
    %AICMD0x1B($02E8, $00)                                     ;B4E2E7
    %AICMD0x13_Wait(120)                                       ;B4E2EB
    %AICMD0x1B($02E5, $00)                                     ;B4E2EE
    %AICMD0x0D($00, $FF, $20, $01)                             ;B4E2F2
    %AICMD0x0B($01)                                            ;B4E2F7
    %AICMD0x13_Wait(60)                                        ;B4E2F9
    %AICMD0x1B($02E3, $00)                                     ;B4E2FC
    %AICMD0x0D($00, $01, $08, $01)                             ;B4E300
    %AICMD0x13_Wait(60)                                        ;B4E305
    %AICMD0x1B($02E7, $01)                                     ;B4E308
    %AICMD0x13_Wait(120)                                       ;B4E30C
    %AICMD0x1B($02E3, $00)                                     ;B4E30F
    %AICMD0x13_Wait(120)                                       ;B4E313
    %AICMD0x1B($02E7, $01)                                     ;B4E316
    %AICMD0x13_Wait(120)                                       ;B4E31A
    %AICMD0x13_Wait(1)                                         ;B4E31D
    %AICMD0x12_Jump($B4E31D)                                   ;B4E320
B4E323:
    %AICMD0x1A($0238, $0268, $B382D0, $01)                     ;B4E323
    %AICMD0x0C($01)                                            ;B4E32B
    %AICMD0x13_Wait(20)                                        ;B4E32D
    %AICMD0x0D($00, $FF, $60, $01)                             ;B4E330
    %AICMD0x13_Wait(20)                                        ;B4E335
    %AICMD0x1B($0281, $01)                                     ;B4E338
    %AICMD0x0D($01, $00, $10, $01)                             ;B4E33C
    %AICMD0x1B($0281, $01)                                     ;B4E341
    %AICMD0x13_Wait(120)                                       ;B4E345
    %AICMD0x0B($02)                                            ;B4E348
    %AICMD0x1B($027F, $00)                                     ;B4E34A
    %AICMD0x13_Wait(180)                                       ;B4E34E
    %AICMD0x1B($0281, $01)                                     ;B4E351
    %AICMD0x13_Wait(180)                                       ;B4E355
    %AICMD0x13_Wait(1)                                         ;B4E358
    %AICMD0x12_Jump($B4E358)                                   ;B4E35B
B4E35E:
    %AICMD0x1A($0278, $0208, $B38114, $03)                     ;B4E35E
    %AICMD0x0C($02)                                            ;B4E366
    %AICMD0x1B($01EC, $00)                                     ;B4E368
    %AICMD0x0D($FF, $00, $20, $01)                             ;B4E36C
    %AICMD0x13_Wait(60)                                        ;B4E371
    %AICMD0x1B($01EB, $00)                                     ;B4E374
    %AICMD0x13_Wait(180)                                       ;B4E378
    %AICMD0x1B($01EF, $00)                                     ;B4E37B
    %AICMD0x13_Wait(60)                                        ;B4E37F
    %AICMD0x0B($03)                                            ;B4E382
    %AICMD0x1B($01F0, $00)                                     ;B4E384
    %AICMD0x13_Wait(120)                                       ;B4E388
    %AICMD0x1B($01E3, $00)                                     ;B4E38B
    %AICMD0x13_Wait(1)                                         ;B4E38F
    %AICMD0x12_Jump($B4E38F)                                   ;B4E392
B4E395:
    %AICMD0x1A($0270, $0230, $B38234, $01)                     ;B4E395
    %AICMD0x0C($03)                                            ;B4E39D
    %AICMD0x1B($025D, $00)                                     ;B4E39F
    %AICMD0x0D($00, $FF, $40, $01)                             ;B4E3A3
    %AICMD0x1B($025F, $00)                                     ;B4E3A8
    %AICMD0x13_Wait(60)                                        ;B4E3AC
    %AICMD0x1B($025D, $00)                                     ;B4E3AF
    %AICMD0x13_Wait(30)                                        ;B4E3B3
    %AICMD0x09($08, $B4E3F3)                                   ;B4E3B6
    %AICMD0x1B($025F, $00)                                     ;B4E3BA
    %AICMD0x13_Wait(60)                                        ;B4E3BE
    %AICMD0x0B($04)                                            ;B4E3C1
    %AICMD0x13_Wait(1)                                         ;B4E3C3
    %AICMD0x12_Jump($B4E3C3)                                   ;B4E3C6
B4E3C9:
    %AICMD0x1A($0254, $01E2, $B38A5C, $00)                     ;B4E3C9
    %AICMD0x13_Wait(1)                                         ;B4E3D1
    %AICMD0x12_Jump($B4E3D1)                                   ;B4E3D4
B4E3D7:
    %AICMD0x1A($024A, $01E8, $B3815C, $00)                     ;B4E3D7
    %AICMD0x13_Wait(1)                                         ;B4E3DF
    %AICMD0x12_Jump($B4E3DF)                                   ;B4E3E2
B4E3E5:
    %AICMD0x1A($0254, $01EE, $B38A38, $00)                     ;B4E3E5
    %AICMD0x13_Wait(1)                                         ;B4E3ED
    %AICMD0x12_Jump($B4E3ED)                                   ;B4E3F0
B4E3F3:
    %AICMD0x1A($0270, $01D6, $B38750, $00)                     ;B4E3F3
    %AICMD0x13_Wait(1)                                         ;B4E3FB
    %AICMD0x12_Jump($B4E3FB)                                   ;B4E3FE


pAIScripting0x3F:
    dw DATA8_B4E421                                            ;B4E401|        |B4E421;
    dw pAIScripting0x40                                        ;B4E403|        |B4E5F6;
    dw pAIScripting0x40                                        ;B4E405|        |B4E5F6;
    dw pAIScripting0x40                                        ;B4E407|        |B4E5F6;
    dw pAIScripting0x40                                        ;B4E409|        |B4E5F6;
    dw pAIScripting0x40                                        ;B4E40B|        |B4E5F6;
    dw pAIScripting0x40                                        ;B4E40D|        |B4E5F6;
    dw pAIScripting0x40                                        ;B4E40F|        |B4E5F6;
    dw pAIScripting0x40                                        ;B4E411|        |B4E5F6;
    dw pAIScripting0x40                                        ;B4E413|        |B4E5F6;
    dw pAIScripting0x40                                        ;B4E415|        |B4E5F6;
    dw pAIScripting0x40                                        ;B4E417|        |B4E5F6;
    dw pAIScripting0x40                                        ;B4E419|        |B4E5F6;
    dw pAIScripting0x40                                        ;B4E41B|        |B4E5F6;
    dw pAIScripting0x40                                        ;B4E41D|        |B4E5F6;
    dw pAIScripting0x40                                        ;B4E41F|        |B4E5F6;
 
DATA8_B4E421:
 
    %AICMD0x00_SetMusic($10, $B4)                              ;B4E421
    %AICMD0x02_FreezeTime()                                    ;B4E424
    %AICMD0x03_SetHour($07)                                    ;B4E425
    %AICMD0x05_SetTransferPosition(680, 392)                   ;B4E427
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B4E42C
    %AICMD0x08_EnableAIControl()                               ;B4E42E
    %AICMD0x09($01, $B4E518)                                   ;B4E42F
    %AICMD0x09($02, $B4E5C1)                                   ;B4E433
    %AICMD0x09($03, $B4E4E6)                                   ;B4E437
    %AICMD0x09($04, $B4E58F)                                   ;B4E43B
    %AICMD0x09($05, $B4E54E)                                   ;B4E43F
    %AICMD0x09($06, $B4E5E8)                                   ;B4E443
    %AICMD0x06_SetDestinationArea(!AREA_TOWNSUMMER)            ;B4E447
    %AICMD0x38()                                               ;B4E449
    %AICMD0x13_Wait(60)                                        ;B4E44A
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 48)                     ;B4E44D
    %AICMD0x13_Wait(20)                                        ;B4E451
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 80)                   ;B4E454
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B4E458
    %AICMD0x0B($00)                                            ;B4E45A
    %AICMD0x0C($01)                                            ;B4E45C
    %AICMD0x19($0038, $00)                                     ;B4E45E
    %AICMD0x13_Wait(90)                                        ;B4E462
    %AICMD0x19($0029, $00)                                     ;B4E465
    %AICMD0x13_Wait(90)                                        ;B4E469
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 76)                   ;B4E46C
    %AICMD0x0B($02)                                            ;B4E470
    %AICMD0x19($0003, $00)                                     ;B4E472
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4E476
    %AICMD0x13_Wait(300)                                       ;B4E478
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 80)                   ;B4E47B
    %AICMD0x13_Wait(10)                                        ;B4E47F
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4E482
    %AICMD0x0B($03)                                            ;B4E484
    %AICMD0x0C($07)                                            ;B4E486
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 8)                  ;B4E488
    %AICMD0x13_Wait(90)                                        ;B4E48C
    %AICMD0x19($00CC, $00)                                     ;B4E48F
    %AICMD0x13_Wait(120)                                       ;B4E493
    %AICMD0x19($008F, $00)                                     ;B4E496
    %AICMD0x13_Wait(120)                                       ;B4E49A
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 80)                  ;B4E49D
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4E4A1
    %AICMD0x0B($04)                                            ;B4E4A3
    %AICMD0x0C($05)                                            ;B4E4A5
    %AICMD0x13_Wait(60)                                        ;B4E4A7
    %AICMD0x19($0039, $00)                                     ;B4E4AA
    %AICMD0x13_Wait(90)                                        ;B4E4AE
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 24)                   ;B4E4B1
    %AICMD0x13_Wait(10)                                        ;B4E4B5
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 40)                   ;B4E4B8
    %AICMD0x13_Wait(40)                                        ;B4E4BC
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 68)                   ;B4E4BF
    %AICMD0x13_Wait(30)                                        ;B4E4C3
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 52)                  ;B4E4C6
    %AICMD0x0B($06)                                            ;B4E4CA
    %AICMD0x13_Wait(120)                                       ;B4E4CC
    %AICMD0x19($0023, $00)                                     ;B4E4CF
    %AICMD0x13_Wait(50)                                        ;B4E4D3
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 16)                  ;B4E4D6
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4E4DA
    %AICMD0x13_Wait(60)                                        ;B4E4DC
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 48)                  ;B4E4DF
    %AICMD0x3D_TeleportToArea(!AREA_ENDING00)                  ;B4E4E3
    %AICMD0x10_End()                                           ;B4E4E5
B4E4E6:
    %AICMD0x1A($0208, $00F8, $B381D4, $00)                     ;B4E4E6
    %AICMD0x0C($00)                                            ;B4E4EE
    %AICMD0x0D($00, $01, $1C, $01)                             ;B4E4F0
    %AICMD0x13_Wait(20)                                        ;B4E4F5
    %AICMD0x09($06, $B4E50B)                                   ;B4E4F8
    %AICMD0x13_Wait(120)                                       ;B4E4FC
    %AICMD0x0B($01)                                            ;B4E4FF
    %AICMD0x1B($0351, $00)                                     ;B4E501
    %AICMD0x13_Wait(1)                                         ;B4E505
    %AICMD0x12_Jump($B4E505)                                   ;B4E508
B4E50B:
    %AICMD0x1A($0208, $0114, $B38A68, $00)                     ;B4E50B
    %AICMD0x13_Wait(120)                                       ;B4E513
    %AICMD0x37()                                               ;B4E516
    %AICMD0x10_End()                                           ;B4E517
B4E518:
    %AICMD0x1A($0148, $0118, $B3818C, $00)                     ;B4E518
    %AICMD0x0C($02)                                            ;B4E520
    %AICMD0x1B($021F, $00)                                     ;B4E522
    %AICMD0x0D($00, $01, $10, $01)                             ;B4E526
    %AICMD0x13_Wait(10)                                        ;B4E52B
    %AICMD0x1B($0223, $01)                                     ;B4E52E
    %AICMD0x0D($01, $00, $14, $01)                             ;B4E532
    %AICMD0x13_Wait(120)                                       ;B4E537
    %AICMD0x1B($034C, $00)                                     ;B4E53A
    %AICMD0x13_Wait(40)                                        ;B4E53E
    %AICMD0x1B($034D, $00)                                     ;B4E541
    %AICMD0x13_Wait(60)                                        ;B4E545
    %AICMD0x13_Wait(1)                                         ;B4E548
    %AICMD0x12_Jump($B4E548)                                   ;B4E54B
B4E54E:
    %AICMD0x1A($0198, $0198, $B38204, $03)                     ;B4E54E
    %AICMD0x0C($03)                                            ;B4E556
    %AICMD0x1B($0249, $00)                                     ;B4E558
    %AICMD0x0D($FF, $00, $10, $01)                             ;B4E55C
    %AICMD0x13_Wait(10)                                        ;B4E561
    %AICMD0x1B($0245, $00)                                     ;B4E564
    %AICMD0x0D($00, $01, $30, $01)                             ;B4E568
    %AICMD0x1B($0248, $00)                                     ;B4E56D
    %AICMD0x13_Wait(50)                                        ;B4E571
    %AICMD0x0B($07)                                            ;B4E574
    %AICMD0x1B($0249, $00)                                     ;B4E576
    %AICMD0x0D($FF, $00, $08, $01)                             ;B4E57A
    %AICMD0x13_Wait(320)                                       ;B4E57F
    %AICMD0x1B($0350, $00)                                     ;B4E582
    %AICMD0x13_Wait(180)                                       ;B4E586
    %AICMD0x13_Wait(1)                                         ;B4E589
    %AICMD0x12_Jump($B4E589)                                   ;B4E58C
B4E58F:
    %AICMD0x1A($00D8, $0218, $B381EC, $02)                     ;B4E58F
    %AICMD0x0C($04)                                            ;B4E597
    %AICMD0x0D($01, $00, $88, $01)                             ;B4E599
    %AICMD0x13_Wait(60)                                        ;B4E59E
    %AICMD0x09($07, $B4E5B4)                                   ;B4E5A1
    %AICMD0x0B($05)                                            ;B4E5A5
    %AICMD0x13_Wait(200)                                       ;B4E5A7
    %AICMD0x1B($034F, $00)                                     ;B4E5AA
    %AICMD0x13_Wait(1)                                         ;B4E5AE
    %AICMD0x12_Jump($B4E5AE)                                   ;B4E5B1
B4E5B4:
    %AICMD0x1A($0168, $0208, $B38A38, $00)                     ;B4E5B4
    %AICMD0x13_Wait(60)                                        ;B4E5BC
    %AICMD0x37()                                               ;B4E5BF
    %AICMD0x10_End()                                           ;B4E5C0
B4E5C1:
    %AICMD0x1A($00D8, $02D8, $B38198, $00)                     ;B4E5C1
    %AICMD0x0C($06)                                            ;B4E5C9
    %AICMD0x1B($0345, $00)                                     ;B4E5CB
    %AICMD0x13_Wait(90)                                        ;B4E5CF
    %AICMD0x1B($0346, $00)                                     ;B4E5D2
    %AICMD0x13_Wait(160)                                       ;B4E5D6
    %AICMD0x1B($022B, $01)                                     ;B4E5D9
    %AICMD0x0D($02, $00, $30, $01)                             ;B4E5DD
    %AICMD0x13_Wait(1)                                         ;B4E5E2
    %AICMD0x12_Jump($B4E5E2)                                   ;B4E5E5
B4E5E8:
    %AICMD0x1A($00CC, $02D8, $B38B1C, $00)                     ;B4E5E8
    %AICMD0x13_Wait(1)                                         ;B4E5F0
    %AICMD0x12_Jump($B4E5F0)                                   ;B4E5F3


pAIScripting0x40:
    dw DATA8_B4E616                                            ;B4E5F6|        |B4E616;
    dw pAIScripting0x41                                        ;B4E5F8|        |B4E7B1;
    dw pAIScripting0x41                                        ;B4E5FA|        |B4E7B1;
    dw pAIScripting0x41                                        ;B4E5FC|        |B4E7B1;
    dw pAIScripting0x41                                        ;B4E5FE|        |B4E7B1;
    dw pAIScripting0x41                                        ;B4E600|        |B4E7B1;
    dw pAIScripting0x41                                        ;B4E602|        |B4E7B1;
    dw pAIScripting0x41                                        ;B4E604|        |B4E7B1;
    dw pAIScripting0x41                                        ;B4E606|        |B4E7B1;
    dw pAIScripting0x41                                        ;B4E608|        |B4E7B1;
    dw pAIScripting0x41                                        ;B4E60A|        |B4E7B1;
    dw pAIScripting0x41                                        ;B4E60C|        |B4E7B1;
    dw pAIScripting0x41                                        ;B4E60E|        |B4E7B1;
    dw pAIScripting0x41                                        ;B4E610|        |B4E7B1;
    dw pAIScripting0x41                                        ;B4E612|        |B4E7B1;
    dw pAIScripting0x41                                        ;B4E614|        |B4E7B1;
 
DATA8_B4E616:
 
    %AICMD0x00_SetMusic($10, $B4)                              ;B4E616
    %AICMD0x02_FreezeTime()                                    ;B4E619
    %AICMD0x03_SetHour($06)                                    ;B4E61A
    %AICMD0x05_SetTransferPosition(136, 120)                   ;B4E61C
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4E621
    %AICMD0x40_DisableTileInteractions()                       ;B4E623
    %AICMD0x08_EnableAIControl()                               ;B4E624
    %AICMD0x09($01, $B4E67E)                                   ;B4E625
    %AICMD0x09($02, $B4E6CB)                                   ;B4E629
    %AICMD0x09($03, $B4E74D)                                   ;B4E62D
    %AICMD0x06_SetDestinationArea(!AREA_HOUSE3)                ;B4E631
    %AICMD0x38()                                               ;B4E633
    %AICMD0x13_Wait(60)                                        ;B4E634
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 24)                  ;B4E637
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 32)                   ;B4E63B
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 54)                  ;B4E63F
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B4E643
    %AICMD0x0B($00)                                            ;B4E645
    %AICMD0x0C($01)                                            ;B4E647
    %AICMD0x0B($02)                                            ;B4E649
    %AICMD0x13_Wait(60)                                        ;B4E64B
    %AICMD0x0C($03)                                            ;B4E64E
    %AICMD0x13_Wait(30)                                        ;B4E650
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 16)                  ;B4E653
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 32)                    ;B4E657
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4E65B
    %AICMD0x13_Wait(200)                                       ;B4E65D
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 72)                 ;B4E660
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 14)                    ;B4E664
    %AICMD0x13_Wait(20)                                        ;B4E668
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4E66B
    %AICMD0x13_Wait(90)                                        ;B4E66D
    %AICMD0x19($0042, $00)                                     ;B4E670
    %AICMD0x13_Wait(120)                                       ;B4E674
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4E677
    %AICMD0x0C($04)                                            ;B4E679
    %AICMD0x3D_TeleportToArea(!AREA_ENDING00)                  ;B4E67B
    %AICMD0x10_End()                                           ;B4E67D
B4E67E:
    %AICMD0x1A($0168, $0098, $B384A4, $01)                     ;B4E67E
    %AICMD0x13_Wait(120)                                       ;B4E686
    %AICMD0x1B($02F5, $00)                                     ;B4E689
    %AICMD0x0D($00, $FF, $80, $04)                             ;B4E68D
    %AICMD0x13_Wait(60)                                        ;B4E692
    %AICMD0x1B($02F7, $00)                                     ;B4E695
    %AICMD0x0D($FF, $00, $80, $04)                             ;B4E699
    %AICMD0x13_Wait(60)                                        ;B4E69E
    %AICMD0x1B($02F3, $00)                                     ;B4E6A1
    %AICMD0x0D($00, $01, $50, $04)                             ;B4E6A5
    %AICMD0x13_Wait(60)                                        ;B4E6AA
    %AICMD0x1B($02F7, $01)                                     ;B4E6AD
    %AICMD0x0D($01, $00, $60, $04)                             ;B4E6B1
    %AICMD0x13_Wait(60)                                        ;B4E6B6
    %AICMD0x1B($02F7, $00)                                     ;B4E6B9
    %AICMD0x0D($FF, $00, $50, $04)                             ;B4E6BD
    %AICMD0x13_Wait(60)                                        ;B4E6C2
    %AICMD0x13_Wait(1)                                         ;B4E6C5
    %AICMD0x12_Jump($B4E6C5)                                   ;B4E6C8
B4E6CB:
    %AICMD0x1A($0138, $0078, $B3845C, $00)                     ;B4E6CB
    %AICMD0x0C($00)                                            ;B4E6D3
    %AICMD0x13_Wait(30)                                        ;B4E6D5
    %AICMD0x1B($02E3, $00)                                     ;B4E6D8
    %AICMD0x0D($00, $01, $42, $01)                             ;B4E6DC
    %AICMD0x1B($02E6, $00)                                     ;B4E6E1
    %AICMD0x0B($01)                                            ;B4E6E5
    %AICMD0x0C($02)                                            ;B4E6E7
    %AICMD0x13_Wait(20)                                        ;B4E6E9
    %AICMD0x1B($02E7, $00)                                     ;B4E6EC
    %AICMD0x0D($FF, $00, $08, $02)                             ;B4E6F0
    %AICMD0x1B($0233, $00)                                     ;B4E6F5
    %AICMD0x13_Wait(60)                                        ;B4E6F9
    %AICMD0x1B($02F0, $00)                                     ;B4E6FC
    %AICMD0x09($04, $B4E740)                                   ;B4E700
    %AICMD0x13_Wait(90)                                        ;B4E704
    %AICMD0x1B($02E5, $00)                                     ;B4E707
    %AICMD0x0D($00, $FF, $30, $01)                             ;B4E70B
    %AICMD0x0B($03)                                            ;B4E710
    %AICMD0x13_Wait(40)                                        ;B4E712
    %AICMD0x1B($02E6, $01)                                     ;B4E715
    %AICMD0x13_Wait(160)                                       ;B4E719
    %AICMD0x1B($02E7, $01)                                     ;B4E71C
    %AICMD0x0D($01, $00, $08, $01)                             ;B4E720
    %AICMD0x13_Wait(60)                                        ;B4E725
    %AICMD0x1B($02E7, $01)                                     ;B4E728
    %AICMD0x13_Wait(90)                                        ;B4E72C
    %AICMD0x1B($0233, $01)                                     ;B4E72F
    %AICMD0x13_Wait(60)                                        ;B4E733
    %AICMD0x1B($02ED, $01)                                     ;B4E736
    %AICMD0x13_Wait(1)                                         ;B4E73A
    %AICMD0x12_Jump($B4E73A)                                   ;B4E73D
B4E740:
    %AICMD0x1A($0130, $00A0, $B38B4C, $00)                     ;B4E740
    %AICMD0x13_Wait(60)                                        ;B4E748
    %AICMD0x37()                                               ;B4E74B
    %AICMD0x10_End()                                           ;B4E74C
B4E74D:
    %AICMD0x1A($0128, $0098, $B38114, $02)                     ;B4E74D
    %AICMD0x1B($01EC, $00)                                     ;B4E755
    %AICMD0x13_Wait(120)                                       ;B4E759
    %AICMD0x1B($01F8, $00)                                     ;B4E75C
    %AICMD0x13_Wait(180)                                       ;B4E760
    %AICMD0x1B($01EB, $00)                                     ;B4E763
    %AICMD0x13_Wait(180)                                       ;B4E767
    %AICMD0x0C($03)                                            ;B4E76A
    %AICMD0x13_Wait(120)                                       ;B4E76C
    %AICMD0x1B($01DF, $00)                                     ;B4E76F
    %AICMD0x0D($00, $01, $20, $01)                             ;B4E773
    %AICMD0x13_Wait(30)                                        ;B4E778
    %AICMD0x1B($01EC, $00)                                     ;B4E77B
    %AICMD0x0D($FF, $00, $70, $01)                             ;B4E77F
    %AICMD0x13_Wait(120)                                       ;B4E784
    %AICMD0x1B($01EC, $01)                                     ;B4E787
    %AICMD0x0D($01, $00, $98, $01)                             ;B4E78B
    %AICMD0x1B($01F2, $01)                                     ;B4E790
    %AICMD0x13_Wait(60)                                        ;B4E794
    %AICMD0x1B($01E9, $01)                                     ;B4E797
    %AICMD0x0D($01, $00, $20, $02)                             ;B4E79B
    %AICMD0x1B($01E1, $00)                                     ;B4E7A0
    %AICMD0x0D($00, $FF, $20, $02)                             ;B4E7A4
    %AICMD0x0B($04)                                            ;B4E7A9
    %AICMD0x13_Wait(1)                                         ;B4E7AB
    %AICMD0x12_Jump($B4E7AB)                                   ;B4E7AE


pAIScripting0x41:
    dw DATA8_B4E7D1                                            ;B4E7B1|        |B4E7D1;
    dw pAIScripting0x42                                        ;B4E7B3|        |B4E98B;
    dw pAIScripting0x42                                        ;B4E7B5|        |B4E98B;
    dw pAIScripting0x42                                        ;B4E7B7|        |B4E98B;
    dw pAIScripting0x42                                        ;B4E7B9|        |B4E98B;
    dw pAIScripting0x42                                        ;B4E7BB|        |B4E98B;
    dw pAIScripting0x42                                        ;B4E7BD|        |B4E98B;
    dw pAIScripting0x42                                        ;B4E7BF|        |B4E98B;
    dw pAIScripting0x42                                        ;B4E7C1|        |B4E98B;
    dw pAIScripting0x42                                        ;B4E7C3|        |B4E98B;
    dw pAIScripting0x42                                        ;B4E7C5|        |B4E98B;
    dw pAIScripting0x42                                        ;B4E7C7|        |B4E98B;
    dw pAIScripting0x42                                        ;B4E7C9|        |B4E98B;
    dw pAIScripting0x42                                        ;B4E7CB|        |B4E98B;
    dw pAIScripting0x42                                        ;B4E7CD|        |B4E98B;
    dw pAIScripting0x42                                        ;B4E7CF|        |B4E98B;
 
DATA8_B4E7D1:
 
    %AICMD0x47_SetValue8($800927, 2)                           ;B4E7D1
    %AICMD0x00_SetMusic($10, $B4)                              ;B4E7D6
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $03)       ;B4E7D9
    %AICMD0x02_FreezeTime()                                    ;B4E7DE
    %AICMD0x03_SetHour($06)                                    ;B4E7DF
    %AICMD0x05_SetTransferPosition(88, 104)                    ;B4E7E1
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4E7E6
    %AICMD0x08_EnableAIControl()                               ;B4E7E8
    %AICMD0x09($01, $B4E864)                                   ;B4E7E9
    %AICMD0x09($02, $B4E8B6)                                   ;B4E7ED
    %AICMD0x09($03, $B4E908)                                   ;B4E7F1
    %AICMD0x09($04, $B4E93D)                                   ;B4E7F5
    %AICMD0x09($05, $B4E976)                                   ;B4E7F9
    %AICMD0x09($06, $B4E8E2)                                   ;B4E7FD
    %AICMD0x06_SetDestinationArea(!AREA_ENDING03)              ;B4E801
    %AICMD0x38()                                               ;B4E803
    %AICMD0x56_UseEquippedItem()                               ;B4E804
    %AICMD0x13_Wait(60)                                        ;B4E805
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 16)                 ;B4E808
    %AICMD0x13_Wait(18)                                        ;B4E80C
    %AICMD0x56_UseEquippedItem()                               ;B4E80F
    %AICMD0x13_Wait(60)                                        ;B4E810
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 16)                 ;B4E813
    %AICMD0x13_Wait(18)                                        ;B4E817
    %AICMD0x56_UseEquippedItem()                               ;B4E81A
    %AICMD0x13_Wait(60)                                        ;B4E81B
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 8)                  ;B4E81E
    %AICMD0x13_Wait(18)                                        ;B4E822
    %AICMD0x19($0041, $00)                                     ;B4E825
    %AICMD0x13_Wait(90)                                        ;B4E829
    %AICMD0x0B($00)                                            ;B4E82C
    %AICMD0x19($003D, $00)                                     ;B4E82E
    %AICMD0x13_Wait(120)                                       ;B4E832
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4E835
    %AICMD0x13_Wait(60)                                        ;B4E837
    %AICMD0x0C($01)                                            ;B4E83A
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 16)                   ;B4E83C
    %AICMD0x13_Wait(60)                                        ;B4E840
    %AICMD0x19($0042, $00)                                     ;B4E843
    %AICMD0x13_Wait(60)                                        ;B4E847
    %AICMD0x19($0023, $00)                                     ;B4E84A
    %AICMD0x13_Wait(120)                                       ;B4E84E
    %AICMD0x0B($02)                                            ;B4E851
    %AICMD0x0C($03)                                            ;B4E853
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 16)                  ;B4E855
    %AICMD0x13_Wait(30)                                        ;B4E859
    %AICMD0x28(strcFlags.daily4, $03)                          ;B4E85C
    %AICMD0x3D_TeleportToArea(!AREA_ENDING00)                  ;B4E861
    %AICMD0x10_End()                                           ;B4E863
B4E864:
    %AICMD0x1A($0030, $0068, $B384A4, $02)                     ;B4E864
    %AICMD0x0C($00)                                            ;B4E86C
    %AICMD0x0D($01, $00, $40, $04)                             ;B4E86E
    %AICMD0x13_Wait(30)                                        ;B4E873
    %AICMD0x0D($01, $00, $18, $04)                             ;B4E876
    %AICMD0x13_Wait(30)                                        ;B4E87B
    %AICMD0x1B($02F6, $01)                                     ;B4E87E
    %AICMD0x13_Wait(30)                                        ;B4E882
    %AICMD0x0D($01, $00, $20, $04)                             ;B4E885
    %AICMD0x1B($02F6, $01)                                     ;B4E88A
    %AICMD0x13_Wait(30)                                        ;B4E88E
    %AICMD0x1B($02F7, $01)                                     ;B4E891
    %AICMD0x0D($01, $00, $20, $04)                             ;B4E895
    %AICMD0x13_Wait(30)                                        ;B4E89A
    %AICMD0x0B($01)                                            ;B4E89D
    %AICMD0x0C($02)                                            ;B4E89F
    %AICMD0x13_Wait(60)                                        ;B4E8A1
    %AICMD0x1B($02F7, $00)                                     ;B4E8A4
    %AICMD0x0D($FF, $00, $20, $02)                             ;B4E8A8
    %AICMD0x13_Wait(90)                                        ;B4E8AD
    %AICMD0x13_Wait(1)                                         ;B4E8B0
    %AICMD0x12_Jump($B4E8B0)                                   ;B4E8B3
B4E8B6:
    %AICMD0x1A($FFF6, $0068, $B38474, $02)                     ;B4E8B6
    %AICMD0x0C($02)                                            ;B4E8BE
    %AICMD0x0D($01, $00, $40, $01)                             ;B4E8C0
    %AICMD0x1B($02E6, $01)                                     ;B4E8C5
    %AICMD0x13_Wait(60)                                        ;B4E8C9
    %AICMD0x1B($02ED, $01)                                     ;B4E8CC
    %AICMD0x13_Wait(120)                                       ;B4E8D0
    %AICMD0x1B($0233, $01)                                     ;B4E8D3
    %AICMD0x13_Wait(60)                                        ;B4E8D7
    %AICMD0x0B($03)                                            ;B4E8DA
    %AICMD0x13_Wait(1)                                         ;B4E8DC
    %AICMD0x12_Jump($B4E8DC)                                   ;B4E8DF
B4E8E2:
    %AICMD0x1A($0024, $0078, $B384BC, $00)                     ;B4E8E2
    %AICMD0x0D($00, $01, $40, $02)                             ;B4E8EA
    %AICMD0x13_Wait(60)                                        ;B4E8EF
    %AICMD0x1B($02FF, $01)                                     ;B4E8F2
    %AICMD0x0D($01, $00, $20, $02)                             ;B4E8F6
    %AICMD0x13_Wait(120)                                       ;B4E8FB
    %AICMD0x1B($02F8, $01)                                     ;B4E8FE
    %AICMD0x13_Wait(1)                                         ;B4E902
    %AICMD0x12_Jump($B4E902)                                   ;B4E905
B4E908:
    %AICMD0x1A($0048, $0098, $B38114, $03)                     ;B4E908
    %AICMD0x1B($01F4, $00)                                     ;B4E910
    %AICMD0x13_Wait(180)                                       ;B4E914
    %AICMD0x1B($01F5, $00)                                     ;B4E917
    %AICMD0x13_Wait(120)                                       ;B4E91B
    %AICMD0x1B($01F0, $00)                                     ;B4E91E
    %AICMD0x13_Wait(120)                                       ;B4E922
    %AICMD0x1B($01EA, $00)                                     ;B4E925
    %AICMD0x13_Wait(180)                                       ;B4E929
    %AICMD0x1B($01EB, $00)                                     ;B4E92C
    %AICMD0x13_Wait(60)                                        ;B4E930
    %AICMD0x1B($01EA, $00)                                     ;B4E933
    %AICMD0x13_Wait(1)                                         ;B4E937
    %AICMD0x12_Jump($B4E937)                                   ;B4E93A
B4E93D:
    %AICMD0x1A($00B8, $0098, $B3812C, $03)                     ;B4E93D
    %AICMD0x1B($0201, $00)                                     ;B4E945
    %AICMD0x13_Wait(180)                                       ;B4E949
    %AICMD0x1B($0201, $00)                                     ;B4E94C
    %AICMD0x0D($FF, $00, $20, $01)                             ;B4E950
    %AICMD0x1B($0203, $00)                                     ;B4E955
    %AICMD0x13_Wait(240)                                       ;B4E959
    %AICMD0x1B($0205, $00)                                     ;B4E95C
    %AICMD0x13_Wait(180)                                       ;B4E960
    %AICMD0x1B($0201, $01)                                     ;B4E963
    %AICMD0x0D($01, $00, $20, $01)                             ;B4E967
    %AICMD0x1B($0205, $01)                                     ;B4E96C
    %AICMD0x13_Wait(180)                                       ;B4E970
    %AICMD0x12_Jump($B4E945)                                   ;B4E973
B4E976:
    %AICMD0x1A($00A8, $0028, $B38144, $03)                     ;B4E976
    %AICMD0x22($18, $10, $01, $B38144, $08)                    ;B4E97E
    %AICMD0x13_Wait(1)                                         ;B4E985
    %AICMD0x12_Jump($B4E985)                                   ;B4E988


pAIScripting0x42:
    dw DATA8_B4E9AB                                            ;B4E98B|        |B4E9AB;
    dw DATA8_B4EBA3                                            ;B4E98D|        |B4EBA3;
    dw DATA8_B4ECB6                                            ;B4E98F|        |B4ECB6;
    dw DATA8_B4ECB6                                            ;B4E991|        |B4ECB6;
    dw DATA8_B4ECB6                                            ;B4E993|        |B4ECB6;
    dw DATA8_B4ECB6                                            ;B4E995|        |B4ECB6;
    dw DATA8_B4ECB6                                            ;B4E997|        |B4ECB6;
    dw DATA8_B4ECB6                                            ;B4E999|        |B4ECB6;
    dw DATA8_B4ECB6                                            ;B4E99B|        |B4ECB6;
    dw DATA8_B4ECB6                                            ;B4E99D|        |B4ECB6;
    dw DATA8_B4ECB6                                            ;B4E99F|        |B4ECB6;
    dw DATA8_B4ECB6                                            ;B4E9A1|        |B4ECB6;
    dw DATA8_B4ECB6                                            ;B4E9A3|        |B4ECB6;
    dw DATA8_B4ECB6                                            ;B4E9A5|        |B4ECB6;
    dw DATA8_B4ECB6                                            ;B4E9A7|        |B4ECB6;
    dw DATA8_B4ECB6                                            ;B4E9A9|        |B4ECB6;
 
DATA8_B4E9AB:
 
    %AICMD0x00_SetMusic($10, $B4)                              ;B4E9AB
    %AICMD0x02_FreezeTime()                                    ;B4E9AE
    %AICMD0x03_SetHour($06)                                    ;B4E9AF
    %AICMD0x05_SetTransferPosition(96, 200)                    ;B4E9B1
    %AICMD0x40_DisableTileInteractions()                       ;B4E9B6
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B4E9B7
    %AICMD0x08_EnableAIControl()                               ;B4E9B9
    %AICMD0x09($01, $B4EA0D)                                   ;B4E9BA
    %AICMD0x09($02, $B4EA6A)                                   ;B4E9BE
    %AICMD0x09($03, $B4EA94)                                   ;B4E9C2
    %AICMD0x09($04, $B4EAC1)                                   ;B4E9C6
    %AICMD0x09($05, $B4EB56)                                   ;B4E9CA
    %AICMD0x09($06, $B4EB2F)                                   ;B4E9CE
    %AICMD0x09($07, $B4EB72)                                   ;B4E9D2
    %AICMD0x09($08, $B4EB80)                                   ;B4E9D6
    %AICMD0x09($09, $B4EB95)                                   ;B4E9DA
    %AICMD0x09($0A, $B4EAEF)                                   ;B4E9DE
    %AICMD0x09($0B, $B4EAFD)                                   ;B4E9E2
    %AICMD0x06_SetDestinationArea(!AREA_ENDING12)              ;B4E9E6
    %AICMD0x38()                                               ;B4E9E8
    %AICMD0x0C($02)                                            ;B4E9E9
    %AICMD0x13_Wait(180)                                       ;B4E9EB
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 80)                    ;B4E9EE
    %AICMD0x13_Wait(60)                                        ;B4E9F2
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 24)                 ;B4E9F5
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4E9F9
    %AICMD0x13_Wait(60)                                        ;B4E9FB
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4E9FE
    %AICMD0x13_Wait(120)                                       ;B4EA00
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4EA03
    %AICMD0x13_Wait(60)                                        ;B4EA05
    %AICMD0x0C($03)                                            ;B4EA08
    %AICMD0x3D_TeleportToArea(!AREA_ENDING00)                  ;B4EA0A
    %AICMD0x10_End()                                           ;B4EA0C
B4EA0D:
    %AICMD0x1A($0110, $0078, $B38114, $00)                     ;B4EA0D
    %AICMD0x13_Wait(120)                                       ;B4EA15
    %AICMD0x1B($01EC, $00)                                     ;B4EA18
    %AICMD0x0D($FF, $00, $48, $01)                             ;B4EA1C
    %AICMD0x13_Wait(120)                                       ;B4EA21
    %AICMD0x1B($01E9, $00)                                     ;B4EA24
    %AICMD0x0D($FF, $00, $20, $02)                             ;B4EA28
    %AICMD0x13_Wait(60)                                        ;B4EA2D
    %AICMD0x1B($01EA, $00)                                     ;B4EA30
    %AICMD0x13_Wait(180)                                       ;B4EA34
    %AICMD0x1B($01EB, $00)                                     ;B4EA37
    %AICMD0x13_Wait(80)                                        ;B4EA3B
    %AICMD0x1B($01E9, $00)                                     ;B4EA3E
    %AICMD0x0D($FF, $00, $20, $02)                             ;B4EA42
    %AICMD0x13_Wait(80)                                        ;B4EA47
    %AICMD0x1B($01DB, $00)                                     ;B4EA4A
    %AICMD0x13_Wait(120)                                       ;B4EA4E
    %AICMD0x1B($01DC, $00)                                     ;B4EA51
    %AICMD0x13_Wait(60)                                        ;B4EA55
    %AICMD0x1B($01EC, $01)                                     ;B4EA58
    %AICMD0x0D($01, $00, $68, $01)                             ;B4EA5C
    %AICMD0x0B($03)                                            ;B4EA61
    %AICMD0x10_End()                                           ;B4EA63
    %AICMD0x13_Wait(1)                                         ;B4EA64
    %AICMD0x12_Jump($B4EA64)                                   ;B4EA67
B4EA6A:
    %AICMD0x1A($0068, $0058, $B3845C, $00)                     ;B4EA6A
    %AICMD0x0C($00)                                            ;B4EA72
    %AICMD0x1B($02E3, $00)                                     ;B4EA74
    %AICMD0x0D($00, $01, $24, $01)                             ;B4EA78
    %AICMD0x13_Wait(120)                                       ;B4EA7D
    %AICMD0x0B($01)                                            ;B4EA80
    %AICMD0x1B($02E3, $00)                                     ;B4EA82
    %AICMD0x0D($00, $FF, $20, $01)                             ;B4EA86
    %AICMD0x13_Wait(120)                                       ;B4EA8B
    %AICMD0x13_Wait(1)                                         ;B4EA8E
    %AICMD0x12_Jump($B4EA8E)                                   ;B4EA91
B4EA94:
    %AICMD0x1A($0068, $0068, $B384BC, $00)                     ;B4EA94
    %AICMD0x13_Wait(120)                                       ;B4EA9C
    %AICMD0x0D($00, $01, $20, $01)                             ;B4EA9F
    %AICMD0x1B($02FB, $00)                                     ;B4EAA4
    %AICMD0x13_Wait(60)                                        ;B4EAA8
    %AICMD0x0B($00)                                            ;B4EAAB
    %AICMD0x0C($01)                                            ;B4EAAD
    %AICMD0x1B($02FB, $00)                                     ;B4EAAF
    %AICMD0x0D($00, $FF, $20, $01)                             ;B4EAB3
    %AICMD0x13_Wait(120)                                       ;B4EAB8
    %AICMD0x13_Wait(1)                                         ;B4EABB
    %AICMD0x12_Jump($B4EABB)                                   ;B4EABE
B4EAC1:
    %AICMD0x1A($0088, $0058, $B384A4, $02)                     ;B4EAC1
    %AICMD0x13_Wait(180)                                       ;B4EAC9
    %AICMD0x0D($01, $00, $10, $02)                             ;B4EACC
    %AICMD0x13_Wait(120)                                       ;B4EAD1
    %AICMD0x0C($02)                                            ;B4EAD4
    %AICMD0x1B($02F7, $01)                                     ;B4EAD6
    %AICMD0x0D($FF, $00, $1E, $02)                             ;B4EADA
    %AICMD0x13_Wait(60)                                        ;B4EADF
    %AICMD0x1B($02F3, $00)                                     ;B4EAE2
    %AICMD0x13_Wait(60)                                        ;B4EAE6
    %AICMD0x13_Wait(1)                                         ;B4EAE9
    %AICMD0x12_Jump($B4EAE9)                                   ;B4EAEC
B4EAEF:
    %AICMD0x1A($0058, $0058, $B38438, $00)                     ;B4EAEF
    %AICMD0x13_Wait(1)                                         ;B4EAF7
    %AICMD0x12_Jump($B4EAF7)                                   ;B4EAFA
B4EAFD:
    %AICMD0x1A($0078, $0058, $B38450, $00)                     ;B4EAFD
    %AICMD0x13_Wait(180)                                       ;B4EB05
    %AICMD0x1B($02E1, $01)                                     ;B4EB08
    %AICMD0x0D($01, $00, $10, $01)                             ;B4EB0C
    %AICMD0x13_Wait(90)                                        ;B4EB11
    %AICMD0x0B($02)                                            ;B4EB14
    %AICMD0x1B($02E1, $01)                                     ;B4EB16
    %AICMD0x0D($FF, $00, $20, $02)                             ;B4EB1A
    %AICMD0x13_Wait(60)                                        ;B4EB1F
    %AICMD0x1B($02DF, $00)                                     ;B4EB22
    %AICMD0x13_Wait(60)                                        ;B4EB26
    %AICMD0x13_Wait(1)                                         ;B4EB29
    %AICMD0x12_Jump($B4EB29)                                   ;B4EB2C
B4EB2F:
    %AICMD0x1A($0028, $0068, $B3812C, $02)                     ;B4EB2F
    %AICMD0x1B($0201, $01)                                     ;B4EB37
    %AICMD0x13_Wait(180)                                       ;B4EB3B
    %AICMD0x1B($0201, $01)                                     ;B4EB3E
    %AICMD0x13_Wait(180)                                       ;B4EB42
    %AICMD0x1B($0203, $01)                                     ;B4EB45
    %AICMD0x13_Wait(240)                                       ;B4EB49
    %AICMD0x1B($0205, $01)                                     ;B4EB4C
    %AICMD0x13_Wait(180)                                       ;B4EB50
    %AICMD0x12_Jump($B4EB37)                                   ;B4EB53
B4EB56:
    %AICMD0x1A($00A8, $0098, $B38888, $03)                     ;B4EB56
    %AICMD0x13_Wait(120)                                       ;B4EB5E
    %AICMD0x1B($0192, $01)                                     ;B4EB61
    %AICMD0x13_Wait(120)                                       ;B4EB65
    %AICMD0x1B($0195, $01)                                     ;B4EB68
    %AICMD0x13_Wait(1)                                         ;B4EB6C
    %AICMD0x12_Jump($B4EB5E)                                   ;B4EB6F
B4EB72:
    %AICMD0x1A($00D8, $0058, $B38144, $03)                     ;B4EB72
    %AICMD0x13_Wait(1)                                         ;B4EB7A
    %AICMD0x12_Jump($B4EB7A)                                   ;B4EB7D
B4EB80:
    %AICMD0x1A($00C8, $0068, $B38150, $03)                     ;B4EB80
    %AICMD0x22($08, $08, $01, $B38150, $04)                    ;B4EB88
    %AICMD0x13_Wait(1)                                         ;B4EB8F
    %AICMD0x12_Jump($B4EB8F)                                   ;B4EB92
B4EB95:
    %AICMD0x1A($0098, $0024, $B38570, $03)                     ;B4EB95
    %AICMD0x13_Wait(1)                                         ;B4EB9D
    %AICMD0x12_Jump($B4EB9D)                                   ;B4EBA0


DATA8_B4EBA3:
 
    %AICMD0x00_SetMusic($10, $B4)                              ;B4EBA3
    %AICMD0x02_FreezeTime()                                    ;B4EBA6
    %AICMD0x03_SetHour($06)                                    ;B4EBA7
    %AICMD0x05_SetTransferPosition(120, 136)                   ;B4EBA9
    %AICMD0x40_DisableTileInteractions()                       ;B4EBAE
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4EBAF
    %AICMD0x08_EnableAIControl()                               ;B4EBB1
    %AICMD0x09($01, $B4EBF2)                                   ;B4EBB2
    %AICMD0x09($02, $B4EC07)                                   ;B4EBB6
    %AICMD0x09($03, $B4EC15)                                   ;B4EBBA
    %AICMD0x09($04, $B4EC23)                                   ;B4EBBE
    %AICMD0x09($05, $B4EC62)                                   ;B4EBC2
    %AICMD0x09($06, $B4EC54)                                   ;B4EBC6
    %AICMD0x09($07, $B4EC70)                                   ;B4EBCA
    %AICMD0x09($08, $B4EC85)                                   ;B4EBCE
    %AICMD0x09($09, $B4EC9A)                                   ;B4EBD2
    %AICMD0x09($0A, $B4EC31)                                   ;B4EBD6
    %AICMD0x09($0B, $B4EC3F)                                   ;B4EBDA
    %AICMD0x09($0C, $B4ECA8)                                   ;B4EBDE
    %AICMD0x06_SetDestinationArea(!AREA_ENDING13)              ;B4EBE2
    %AICMD0x38()                                               ;B4EBE4
    %AICMD0x01_UnfreezeTime()                                  ;B4EBE5
    %AICMD0x24_NextHourPalette($74)                            ;B4EBE6
    %AICMD0x13_Wait(180)                                       ;B4EBE8
    %AICMD0x02_FreezeTime()                                    ;B4EBEB
    %AICMD0x13_Wait(240)                                       ;B4EBEC
    %AICMD0x3D_TeleportToArea(!AREA_ENDING00)                  ;B4EBEF
    %AICMD0x10_End()                                           ;B4EBF1
B4EBF2:
    %AICMD0x1A($00A8, $0088, $B38114, $00)                     ;B4EBF2
    %AICMD0x13_Wait(1)                                         ;B4EBFA
    %AICMD0x1B($034B, $00)                                     ;B4EBFD
    %AICMD0x13_Wait(1)                                         ;B4EC01
    %AICMD0x12_Jump($B4EC01)                                   ;B4EC04
B4EC07:
    %AICMD0x1A($0068, $0068, $B3845C, $00)                     ;B4EC07
    %AICMD0x13_Wait(1)                                         ;B4EC0F
    %AICMD0x12_Jump($B4EC0F)                                   ;B4EC12
B4EC15:
    %AICMD0x1A($0068, $0078, $B384B0, $00)                     ;B4EC15
    %AICMD0x13_Wait(1)                                         ;B4EC1D
    %AICMD0x12_Jump($B4EC1D)                                   ;B4EC20
B4EC23:
    %AICMD0x1A($0088, $0068, $B38498, $00)                     ;B4EC23
    %AICMD0x13_Wait(1)                                         ;B4EC2B
    %AICMD0x12_Jump($B4EC2B)                                   ;B4EC2E
B4EC31:
    %AICMD0x1A($0058, $0068, $B38438, $00)                     ;B4EC31
    %AICMD0x13_Wait(1)                                         ;B4EC39
    %AICMD0x12_Jump($B4EC39)                                   ;B4EC3C
B4EC3F:
    %AICMD0x1A($0078, $0068, $B38450, $00)                     ;B4EC3F
    %AICMD0x13_Wait(1)                                         ;B4EC47
    %AICMD0x1B($0349, $00)                                     ;B4EC4A
    %AICMD0x13_Wait(1)                                         ;B4EC4E
    %AICMD0x12_Jump($B4EC4E)                                   ;B4EC51
B4EC54:
    %AICMD0x1A($0048, $0088, $B3812C, $02)                     ;B4EC54
    %AICMD0x13_Wait(1)                                         ;B4EC5C
    %AICMD0x12_Jump($B4EC5C)                                   ;B4EC5F
B4EC62:
    %AICMD0x1A($0088, $0098, $B380FC, $03)                     ;B4EC62
    %AICMD0x13_Wait(1)                                         ;B4EC6A
    %AICMD0x12_Jump($B4EC6A)                                   ;B4EC6D
B4EC70:
    %AICMD0x1A($00C0, $0070, $B38144, $03)                     ;B4EC70
    %AICMD0x13_Wait(1)                                         ;B4EC78
    %AICMD0x1B($0414, $00)                                     ;B4EC7B
    %AICMD0x13_Wait(1)                                         ;B4EC7F
    %AICMD0x12_Jump($B4EC7F)                                   ;B4EC82
B4EC85:
    %AICMD0x1A($00C8, $0078, $B38150, $03)                     ;B4EC85
    %AICMD0x13_Wait(1)                                         ;B4EC8D
    %AICMD0x1B($041C, $00)                                     ;B4EC90
    %AICMD0x13_Wait(1)                                         ;B4EC94
    %AICMD0x12_Jump($B4EC94)                                   ;B4EC97
B4EC9A:
    %AICMD0x1A($00A8, $00A0, $B384C8, $03)                     ;B4EC9A
    %AICMD0x13_Wait(1)                                         ;B4ECA2
    %AICMD0x12_Jump($B4ECA2)                                   ;B4ECA5
B4ECA8:
    %AICMD0x1A($0098, $00A0, $B384C8, $00)                     ;B4ECA8
    %AICMD0x13_Wait(1)                                         ;B4ECB0
    %AICMD0x12_Jump($B4ECB0)                                   ;B4ECB3


DATA8_B4ECB6:
 
    %AICMD0x00_SetMusic($00, $00)                              ;B4ECB6


    pad $B4FFFF
