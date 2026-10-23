 
pAIScripting0x43:
    dw DATA8_B58020                                            ;B58000|        |B58020;
    dw DATA8_B584DA                                            ;B58002|        |B584DA;
    dw DATA8_B58990                                            ;B58004|        |B58990;
    dw DATA8_B58E4E                                            ;B58006|        |B58E4E;
    dw DATA8_B59313                                            ;B58008|        |B59313;
    dw pAIScripting0x44                                        ;B5800A|        |B597D1;
    dw pAIScripting0x44                                        ;B5800C|        |B597D1;
    dw pAIScripting0x44                                        ;B5800E|        |B597D1;
    dw pAIScripting0x44                                        ;B58010|        |B597D1;
    dw pAIScripting0x44                                        ;B58012|        |B597D1;
    dw pAIScripting0x44                                        ;B58014|        |B597D1;
    dw pAIScripting0x44                                        ;B58016|        |B597D1;
    dw pAIScripting0x44                                        ;B58018|        |B597D1;
    dw pAIScripting0x44                                        ;B5801A|        |B597D1;
    dw pAIScripting0x44                                        ;B5801C|        |B597D1;
    dw pAIScripting0x44                                        ;B5801E|        |B597D1;
 
DATA8_B58020:
 
    %AICMD0x14_JumpIfFlagSet($800196, $01, pAIScripting0x43_L001)            ;B58020
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, pAIScripting0x43_L001)     ;B58027
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 11, 14, pAIScripting0x43_L062) ;B5802E
pAIScripting0x43_L001:
    %AICMD0x15_JumpIfEquals8(nCurrentTimeID, 18, pAIScripting0x43_L003)      ;B58036
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $07, pAIScripting0x43_L002)   ;B5803D
    %AICMD0x1A($0058, $0068, aAIScriptingData_L071, $00)                     ;B58044
    %AICMD0x12_Jump(pAIScripting0x43_L005)                                   ;B5804C
pAIScripting0x43_L002:
    %AICMD0x1A($0148, $0078, aAIScriptingData_L071, $00)                     ;B5804F
    %AICMD0x12_Jump(pAIScripting0x43_L005)                                   ;B58057
pAIScripting0x43_L003:
    %AICMD0x41_AddValue16(nLove_Maria, -2)                     ;B5805A
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $07, pAIScripting0x43_L004)   ;B58060
    %AICMD0x1A($0029, $0053, aAIScriptingData_L072, $00)                     ;B58067
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily3, $0C)       ;B5806F
    %AICMD0x12_Jump(pAIScripting0x43_L006)                                   ;B58074
pAIScripting0x43_L004:
    %AICMD0x1A($0119, $0063, aAIScriptingData_L072, $00)                     ;B58077
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily3, $0C)       ;B5807F
    %AICMD0x12_Jump(pAIScripting0x43_L006)                                   ;B58084
pAIScripting0x43_L005:
    %AICMD0x14_JumpIfFlagSet(strcFlags.daily3, $0B, pAIScripting0x43_L060)   ;B58087
    %AICMD0x2D_JumpOnInteract(pAIScripting0x43_L016, pAIScripting0x43_L007)                               ;B5808E
    %AICMD0x12_Jump(pAIScripting0x43_L005)                                   ;B58093
pAIScripting0x43_L006:
    %AICMD0x1F(pAIScripting0x43_L061)                                        ;B58096
    %AICMD0x12_Jump(pAIScripting0x43_L006)                                   ;B58099
pAIScripting0x43_L007:
    %AICMD0x15_JumpIfEquals8($80091E, 2, pAIScripting0x43_L008)              ;B5809C
    %AICMD0x16_JumpIfBetween8($80091E, 1, 5, pAIScripting0x43_L009)          ;B580A3
    %AICMD0x15_JumpIfEquals8($80091E, 7, pAIScripting0x43_L009)              ;B580AB
    %AICMD0x16_JumpIfBetween8($80091E, 16, 23, pAIScripting0x43_L009)        ;B580B2
    %AICMD0x15_JumpIfEquals8($80091E, 25, pAIScripting0x43_L010)             ;B580BA
    %AICMD0x15_JumpIfEquals8($80091E, 73, pAIScripting0x43_L010)             ;B580C1
    %AICMD0x15_JumpIfEquals8($80091E, 6, pAIScripting0x43_L012)              ;B580C8
    %AICMD0x16_JumpIfBetween8($80091E, 9, 12, pAIScripting0x43_L011)         ;B580CF
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B580D7
    %AICMD0x12_Jump(pAIScripting0x43_L005)                                   ;B580DB
pAIScripting0x43_L008:
    %AICMD0x1C_ShowDialog($03B0, $00)                          ;B580DE
    %AICMD0x41_AddValue16(nLove_Maria, -6)                     ;B580E2
    %AICMD0x12_Jump(pAIScripting0x43_L005)                                   ;B580E8
pAIScripting0x43_L009:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $07, pAIScripting0x43_L013)   ;B580EB
    %AICMD0x41_AddValue16(nLove_Maria, 4)                      ;B580F2
    %AICMD0x1C_ShowDialog($03B2, $00)                          ;B580F8
    %AICMD0x12_Jump(pAIScripting0x43_L005)                                   ;B580FC
pAIScripting0x43_L010:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $07, pAIScripting0x43_L013)   ;B580FF
    %AICMD0x1C_ShowDialog($03B5, $00)                          ;B58106
    %AICMD0x41_AddValue16(nLove_Maria, 8)                      ;B5810A
    %AICMD0x12_Jump(pAIScripting0x43_L005)                                   ;B58110
pAIScripting0x43_L011:
    %AICMD0x1C_ShowDialog($01D9, $00)                          ;B58113
    %AICMD0x41_AddValue16(nLove_Maria, -4)                     ;B58117
    %AICMD0x12_Jump(pAIScripting0x43_L005)                                   ;B5811D
pAIScripting0x43_L012:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $07, pAIScripting0x43_L013)   ;B58120
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $08, pAIScripting0x43_L014)   ;B58127
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $09, pAIScripting0x43_L015)   ;B5812E
    %AICMD0x41_AddValue16(nLove_Maria, 8)                      ;B58135
    %AICMD0x1C_ShowDialog($0212, $00)                          ;B5813B
    %AICMD0x12_Jump(pAIScripting0x43_L005)                                   ;B5813F
pAIScripting0x43_L013:
    %AICMD0x1C_ShowDialog($01BD, $00)                          ;B58142
    %AICMD0x41_AddValue16(nPlayerHappiness, 30)                ;B58146
    %AICMD0x12_Jump(pAIScripting0x43_L005)                                   ;B5814C
pAIScripting0x43_L014:
    %AICMD0x1C_ShowDialog($041D, $00)                          ;B5814F
    %AICMD0x41_AddValue16(nPlayerHappiness, 30)                ;B58153
    %AICMD0x12_Jump(pAIScripting0x43_L005)                                   ;B58159
pAIScripting0x43_L015:
    %AICMD0x1C_ShowDialog($041E, $00)                          ;B5815C
    %AICMD0x41_AddValue16(nPlayerHappiness, 30)                ;B58160
    %AICMD0x12_Jump(pAIScripting0x43_L005)                                   ;B58166
pAIScripting0x43_L016:
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 15, 18, pAIScripting0x43_L058) ;B58169
    %AICMD0x43_JumpIfEqual16(nMarriedDaysCounter, 1, pAIScripting0x43_L019)  ;B58171
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $04, pAIScripting0x43_L020)   ;B58179
    %AICMD0x15_JumpIfEquals8($80098C, 3, pAIScripting0x43_L021)              ;B58180
    %AICMD0x14_JumpIfFlagSet($800196, $04, pAIScripting0x43_L022)            ;B58187
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $05, pAIScripting0x43_L020)   ;B5818E
    %AICMD0x43_JumpIfEqual16(nFirstChildAge, 1, pAIScripting0x43_L025)       ;B58195
    %AICMD0x43_JumpIfEqual16(nSecondChildAge, 1, pAIScripting0x43_L025)      ;B5819D
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 2, 19, pAIScripting0x43_L026) ;B581A5
    %AICMD0x45_JumpIfBetween16(nSecondChildAge, 2, 19, pAIScripting0x43_L026);B581AF
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 20, 39, pAIScripting0x43_L028);B581B9
    %AICMD0x45_JumpIfBetween16(nSecondChildAge, 20, 39, pAIScripting0x43_L028);B581C3
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 40, 59, pAIScripting0x43_L030);B581CD
    %AICMD0x45_JumpIfBetween16(nSecondChildAge, 40, 59, pAIScripting0x43_L030);B581D7
    %AICMD0x43_JumpIfEqual16(nFirstChildAge, 90, pAIScripting0x43_L032)      ;B581E1
    %AICMD0x43_JumpIfEqual16(nSecondChildAge, 90, pAIScripting0x43_L032)     ;B581E9
    %AICMD0x55_JumpIfFlagNotSet(strcFlags.event1, $07, pAIScripting0x43_L017)                 ;B581F1
    %AICMD0x55_JumpIfFlagNotSet(strcFlags.event2, $0A, pAIScripting0x43_L023)                 ;B581F8
    %AICMD0x55_JumpIfFlagNotSet(strcFlags.event2, $0B, pAIScripting0x43_L023)                 ;B581FF
    %AICMD0x55_JumpIfFlagNotSet(strcFlags.event2, $0C, pAIScripting0x43_L023)                 ;B58206
    %AICMD0x55_JumpIfFlagNotSet(strcFlags.event2, $09, pAIScripting0x43_L024)                 ;B5820D
pAIScripting0x43_L017:
    %AICMD0x15_JumpIfEquals8(nCurrentWeekdayID, 0, pAIScripting0x43_L040)    ;B58214
    %AICMD0x15_JumpIfEquals8(nCurrentWeekdayID, 6, pAIScripting0x43_L039)    ;B5821B
    %AICMD0x45_JumpIfBetween16(nLove_Maria, 200, 220, pAIScripting0x43_L037) ;B58222
    %AICMD0x45_JumpIfBetween16(nLove_Maria, 221, 250, pAIScripting0x43_L038) ;B5822C
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 0, pAIScripting0x43_L041)     ;B58236
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 1, pAIScripting0x43_L043)     ;B5823D
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 2, pAIScripting0x43_L046)     ;B58244
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, pAIScripting0x43_L048)     ;B5824B
pAIScripting0x43_L018:
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 60, 89, pAIScripting0x43_L033);B58252
    %AICMD0x45_JumpIfBetween16(nSecondChildAge, 60, 89, pAIScripting0x43_L033);B5825C
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 91, 119, pAIScripting0x43_L034);B58266
    %AICMD0x45_JumpIfBetween16(nSecondChildAge, 91, 119, pAIScripting0x43_L034);B58270
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 120, 999, pAIScripting0x43_L035);B5827A
    %AICMD0x45_JumpIfBetween16(nSecondChildAge, 120, 999, pAIScripting0x43_L035);B58284
    %AICMD0x1C_ShowDialog($0485, $00)                          ;B5828E
    %AICMD0x12_Jump(pAIScripting0x43_L005)                                   ;B58292
pAIScripting0x43_L019:
    %AICMD0x1C_ShowDialog($017D, $00)                          ;B58295
    %AICMD0x12_Jump(pAIScripting0x43_L005)                                   ;B58299
pAIScripting0x43_L020:
    %AICMD0x1C_ShowDialog($0166, $00)                          ;B5829C
    %AICMD0x12_Jump(pAIScripting0x43_L005)                                   ;B582A0
pAIScripting0x43_L021:
    %AICMD0x1C_ShowDialog($015F, $00)                          ;B582A3
    %AICMD0x12_Jump(pAIScripting0x43_L005)                                   ;B582A7
pAIScripting0x43_L022:
    %AICMD0x1C_ShowDialog($0160, $00)                          ;B582AA
    %AICMD0x12_Jump(pAIScripting0x43_L005)                                   ;B582AE
pAIScripting0x43_L023:
    %AICMD0x1C_ShowDialog($01A0, $00)                          ;B582B1
    %AICMD0x12_Jump(pAIScripting0x43_L005)                                   ;B582B5
pAIScripting0x43_L024:
    %AICMD0x1C_ShowDialog($0493, $00)                          ;B582B8
    %AICMD0x12_Jump(pAIScripting0x43_L005)                                   ;B582BC
pAIScripting0x43_L025:
    %AICMD0x1C_ShowDialog($01A2, $00)                          ;B582BF
    %AICMD0x12_Jump(pAIScripting0x43_L005)                                   ;B582C3
pAIScripting0x43_L026:
    %AICMD0x17_RollRandom($02)                                            ;B582C6
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x43_L017)                                   ;B582C8
    %AICMD0x18_JumpIfRandomEquals($01, pAIScripting0x43_L027)                                   ;B582CC
    %AICMD0x12_Jump(pAIScripting0x43_L005)                                   ;B582D0
pAIScripting0x43_L027:
    %AICMD0x1C_ShowDialog($01A3, $00)                          ;B582D3
    %AICMD0x12_Jump(pAIScripting0x43_L005)                                   ;B582D7
pAIScripting0x43_L028:
    %AICMD0x17_RollRandom($02)                                            ;B582DA
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x43_L017)                                   ;B582DC
    %AICMD0x18_JumpIfRandomEquals($01, pAIScripting0x43_L029)                                   ;B582E0
    %AICMD0x12_Jump(pAIScripting0x43_L005)                                   ;B582E4
pAIScripting0x43_L029:
    %AICMD0x1C_ShowDialog($01A4, $00)                          ;B582E7
    %AICMD0x12_Jump(pAIScripting0x43_L005)                                   ;B582EB
pAIScripting0x43_L030:
    %AICMD0x17_RollRandom($02)                                            ;B582EE
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x43_L017)                                   ;B582F0
    %AICMD0x18_JumpIfRandomEquals($01, pAIScripting0x43_L031)                                   ;B582F4
pAIScripting0x43_L031:
    %AICMD0x1C_ShowDialog($01A5, $00)                          ;B582F8
    %AICMD0x12_Jump(pAIScripting0x43_L005)                                   ;B582FC
pAIScripting0x43_L032:
    %AICMD0x1C_ShowDialog($0481, $00)                          ;B582FF
    %AICMD0x12_Jump(pAIScripting0x43_L005)                                   ;B58303
pAIScripting0x43_L033:
    %AICMD0x1C_ShowDialog($0480, $00)                          ;B58306
    %AICMD0x12_Jump(pAIScripting0x43_L005)                                   ;B5830A
pAIScripting0x43_L034:
    %AICMD0x1C_ShowDialog($0484, $00)                          ;B5830D
    %AICMD0x12_Jump(pAIScripting0x43_L005)                                   ;B58311
pAIScripting0x43_L035:
    %AICMD0x17_RollRandom($02)                                            ;B58314
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x43_L036)                                   ;B58316
    %AICMD0x1C_ShowDialog($0482, $00)                          ;B5831A
    %AICMD0x12_Jump(pAIScripting0x43_L005)                                   ;B5831E
pAIScripting0x43_L036:
    %AICMD0x1C_ShowDialog($0443, $00)                          ;B58321
    %AICMD0x12_Jump(pAIScripting0x43_L005)                                   ;B58325
pAIScripting0x43_L037:
    %AICMD0x1C_ShowDialog($01F3, $00)                          ;B58328
    %AICMD0x12_Jump(pAIScripting0x43_L005)                                   ;B5832C
pAIScripting0x43_L038:
    %AICMD0x1C_ShowDialog($0049, $00)                          ;B5832F
    %AICMD0x12_Jump(pAIScripting0x43_L005)                                   ;B58333
pAIScripting0x43_L039:
    %AICMD0x1C_ShowDialog($047D, $00)                          ;B58336
    %AICMD0x12_Jump(pAIScripting0x43_L005)                                   ;B5833A
pAIScripting0x43_L040:
    %AICMD0x14_JumpIfFlagSet($800196, $01, pAIScripting0x43_L057)            ;B5833D
    %AICMD0x14_JumpIfFlagSet($800196, $03, pAIScripting0x43_L057)            ;B58344
    %AICMD0x1C_ShowDialog($0194, $00)                          ;B5834B
    %AICMD0x12_Jump(pAIScripting0x43_L005)                                   ;B5834F
pAIScripting0x43_L041:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 22, pAIScripting0x43_L042)         ;B58352
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 23, pAIScripting0x43_L054)         ;B58359
    %AICMD0x14_JumpIfFlagSet($800196, $01, pAIScripting0x43_L055)            ;B58360
    %AICMD0x17_RollRandom($02)                                            ;B58367
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x43_L018)                                   ;B58369
    %AICMD0x1C_ShowDialog($0182, $00)                          ;B5836D
    %AICMD0x12_Jump(pAIScripting0x43_L005)                                   ;B58371
pAIScripting0x43_L042:
    %AICMD0x1C_ShowDialog($0206, $00)                          ;B58374
    %AICMD0x12_Jump(pAIScripting0x43_L005)                                   ;B58378
pAIScripting0x43_L043:
    %AICMD0x14_JumpIfFlagSet($800196, $01, pAIScripting0x43_L055)            ;B5837B
    %AICMD0x17_RollRandom($04)                                            ;B58382
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x43_L044)                                   ;B58384
    %AICMD0x18_JumpIfRandomEquals($01, pAIScripting0x43_L045)                                   ;B58388
    %AICMD0x18_JumpIfRandomEquals($02, pAIScripting0x43_L018)                                   ;B5838C
    %AICMD0x1C_ShowDialog($0427, $00)                          ;B58390
    %AICMD0x12_Jump(pAIScripting0x43_L005)                                   ;B58394
pAIScripting0x43_L044:
    %AICMD0x1C_ShowDialog($017F, $00)                          ;B58397
    %AICMD0x12_Jump(pAIScripting0x43_L005)                                   ;B5839B
pAIScripting0x43_L045:
    %AICMD0x1C_ShowDialog($0183, $00)                          ;B5839E
    %AICMD0x12_Jump(pAIScripting0x43_L005)                                   ;B583A2
pAIScripting0x43_L046:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 11, pAIScripting0x43_L047)         ;B583A5
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 12, pAIScripting0x43_L054)         ;B583AC
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 20, pAIScripting0x43_L054)         ;B583B3
    %AICMD0x14_JumpIfFlagSet($800196, $01, pAIScripting0x43_L055)            ;B583BA
    %AICMD0x17_RollRandom($02)                                            ;B583C1
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x43_L018)                                   ;B583C3
    %AICMD0x1C_ShowDialog($018D, $00)                          ;B583C7
    %AICMD0x12_Jump(pAIScripting0x43_L005)                                   ;B583CB
pAIScripting0x43_L047:
    %AICMD0x1C_ShowDialog($0238, $00)                          ;B583CE
    %AICMD0x12_Jump(pAIScripting0x43_L005)                                   ;B583D2
pAIScripting0x43_L048:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 10, pAIScripting0x43_L050)         ;B583D5
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 23, pAIScripting0x43_L052)         ;B583DC
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 30, pAIScripting0x43_L053)         ;B583E3
    %AICMD0x14_JumpIfFlagSet($800196, $03, pAIScripting0x43_L056)            ;B583EA
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 15, 17, pAIScripting0x43_L058) ;B583F1
    %AICMD0x17_RollRandom($02)                                            ;B583F9
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x43_L018)                                   ;B583FB
    %AICMD0x1C_ShowDialog($042F, $00)                          ;B583FF
    %AICMD0x12_Jump(pAIScripting0x43_L005)                                   ;B58403
pAIScripting0x43_L049:
    %AICMD0x14_JumpIfFlagSet(strcFlags.daily3, $0B, pAIScripting0x43_L060)   ;B58406
    %AICMD0x1F(pAIScripting0x43_L050)                                        ;B5840D
    %AICMD0x12_Jump(pAIScripting0x43_L049)                                   ;B58410
pAIScripting0x43_L050:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $05, pAIScripting0x43_L051) ;B58413
    %AICMD0x1C_ShowDialog($0292, $00)                          ;B5841A
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown1, $05)     ;B5841E
    %AICMD0x08_EnableAIControl()                               ;B58423
    %AICMD0x19($0039, $00)                                     ;B58424
    %AICMD0x13_Wait(120)                                       ;B58428
    %AICMD0x11_EnableUserControl()                             ;B5842B
    %AICMD0x41_AddValue16(nPlayerHappiness, 30)                ;B5842C
    %AICMD0x12_Jump(pAIScripting0x43_L049)                                   ;B58432
pAIScripting0x43_L051:
    %AICMD0x1C_ShowDialog($0293, $00)                          ;B58435
    %AICMD0x12_Jump(pAIScripting0x43_L049)                                   ;B58439
pAIScripting0x43_L052:
    %AICMD0x1C_ShowDialog($02AF, $00)                          ;B5843C
    %AICMD0x12_Jump(pAIScripting0x43_L005)                                   ;B58440
pAIScripting0x43_L053:
    %AICMD0x1C_ShowDialog($03F8, $00)                          ;B58443
    %AICMD0x12_Jump(pAIScripting0x43_L005)                                   ;B58447
pAIScripting0x43_L054:
    %AICMD0x1C_ShowDialog($0363, $00)                          ;B5844A
    %AICMD0x12_Jump(pAIScripting0x43_L005)                                   ;B5844E
pAIScripting0x43_L055:
    %AICMD0x1C_ShowDialog($0197, $00)                          ;B58451
    %AICMD0x12_Jump(pAIScripting0x43_L005)                                   ;B58455
pAIScripting0x43_L056:
    %AICMD0x1C_ShowDialog($0199, $00)                          ;B58458
    %AICMD0x12_Jump(pAIScripting0x43_L005)                                   ;B5845C
pAIScripting0x43_L057:
    %AICMD0x1C_ShowDialog($047C, $00)                          ;B5845F
    %AICMD0x12_Jump(pAIScripting0x43_L005)                                   ;B58463
pAIScripting0x43_L058:
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, pAIScripting0x43_L059)     ;B58466
    %AICMD0x1C_ShowDialog($0180, $00)                          ;B5846D
    %AICMD0x1B($022F, $00)                                     ;B58471
    %AICMD0x08_EnableAIControl()                               ;B58475
    %AICMD0x19($0030, $00)                                     ;B58476
    %AICMD0x13_Wait(120)                                       ;B5847A
    %AICMD0x11_EnableUserControl()                             ;B5847D
    %AICMD0x57_UpdateStamina(30)                               ;B5847E
    %AICMD0x12_Jump(pAIScripting0x43_L005)                                   ;B58480
pAIScripting0x43_L059:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 10, pAIScripting0x43_L050)         ;B58483
    %AICMD0x1C_ShowDialog($0431, $00)                          ;B5848A
    %AICMD0x1B($022F, $00)                                     ;B5848E
    %AICMD0x08_EnableAIControl()                               ;B58492
    %AICMD0x19($0032, $00)                                     ;B58493
    %AICMD0x13_Wait(120)                                       ;B58497
    %AICMD0x11_EnableUserControl()                             ;B5849A
    %AICMD0x57_UpdateStamina(30)                               ;B5849B
    %AICMD0x12_Jump(pAIScripting0x43_L005)                                   ;B5849D
pAIScripting0x43_L060:
    %AICMD0x1B($02E7, $00)                                     ;B584A0
    %AICMD0x0D($FF, $00, $20, $01)                             ;B584A4
    %AICMD0x1B($02E5, $00)                                     ;B584A9
    %AICMD0x0D($00, $FF, $14, $01)                             ;B584AD
    %AICMD0x1B($02E7, $00)                                     ;B584B2
    %AICMD0x0D($FF, $00, $10, $01)                             ;B584B6
    %AICMD0x1B($02F1, $00)                                     ;B584BB
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily3, $0C)       ;B584BF
    %AICMD0x41_AddValue16(nLove_Maria, 2)                      ;B584C4
    %AICMD0x12_Jump(pAIScripting0x43_L006)                                   ;B584CA
pAIScripting0x43_L061:
    %AICMD0x1C_ShowDialog($02C2, $00)                          ;B584CD
    %AICMD0x12_Jump(pAIScripting0x43_L006)                                   ;B584D1
pAIScripting0x43_L062:
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily3, $0C)       ;B584D4
    %AICMD0x10_End()                                           ;B584D9


DATA8_B584DA:
 
    %AICMD0x14_JumpIfFlagSet($800196, $01, pAIScripting0x43_L063)            ;B584DA
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, pAIScripting0x43_L063)     ;B584E1
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 11, 14, pAIScripting0x43_L124) ;B584E8
pAIScripting0x43_L063:
    %AICMD0x15_JumpIfEquals8(nCurrentTimeID, 18, pAIScripting0x43_L065)      ;B584F0
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $07, pAIScripting0x43_L064)   ;B584F7
    %AICMD0x1A($0058, $0068, aAIScriptingData_L071, $00)                     ;B584FE
    %AICMD0x12_Jump(pAIScripting0x43_L067)                                   ;B58506
pAIScripting0x43_L064:
    %AICMD0x1A($0148, $0078, aAIScriptingData_L071, $00)                     ;B58509
    %AICMD0x12_Jump(pAIScripting0x43_L067)                                   ;B58511
pAIScripting0x43_L065:
    %AICMD0x41_AddValue16(nLove_Ann, -2)                       ;B58514
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $07, pAIScripting0x43_L066)   ;B5851A
    %AICMD0x1A($0029, $0053, aAIScriptingData_L072, $00)                     ;B58521
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily3, $0C)       ;B58529
    %AICMD0x12_Jump(pAIScripting0x43_L068)                                   ;B5852E
pAIScripting0x43_L066:
    %AICMD0x1A($0119, $0063, aAIScriptingData_L072, $00)                     ;B58531
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily3, $0C)       ;B58539
    %AICMD0x12_Jump(pAIScripting0x43_L068)                                   ;B5853E
pAIScripting0x43_L067:
    %AICMD0x14_JumpIfFlagSet(strcFlags.daily3, $0B, pAIScripting0x43_L122)   ;B58541
    %AICMD0x2D_JumpOnInteract(pAIScripting0x43_L078, pAIScripting0x43_L069)                               ;B58548
    %AICMD0x12_Jump(pAIScripting0x43_L067)                                   ;B5854D
pAIScripting0x43_L068:
    %AICMD0x1F(pAIScripting0x43_L123)                                        ;B58550
    %AICMD0x12_Jump(pAIScripting0x43_L068)                                   ;B58553
pAIScripting0x43_L069:
    %AICMD0x15_JumpIfEquals8($80091E, 2, pAIScripting0x43_L070)              ;B58556
    %AICMD0x16_JumpIfBetween8($80091E, 3, 5, pAIScripting0x43_L072)          ;B5855D
    %AICMD0x16_JumpIfBetween8($80091E, 16, 23, pAIScripting0x43_L072)        ;B58565
    %AICMD0x15_JumpIfEquals8($80091E, 6, pAIScripting0x43_L074)              ;B5856D
    %AICMD0x15_JumpIfEquals8($80091E, 25, pAIScripting0x43_L071)             ;B58574
    %AICMD0x15_JumpIfEquals8($80091E, 73, pAIScripting0x43_L071)             ;B5857B
    %AICMD0x16_JumpIfBetween8($80091E, 9, 12, pAIScripting0x43_L073)         ;B58582
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B5858A
    %AICMD0x12_Jump(pAIScripting0x43_L067)                                   ;B5858E
pAIScripting0x43_L070:
    %AICMD0x1C_ShowDialog($03B4, $00)                          ;B58591
    %AICMD0x41_AddValue16(nLove_Ann, -8)                       ;B58595
    %AICMD0x12_Jump(pAIScripting0x43_L067)                                   ;B5859B
pAIScripting0x43_L071:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $07, pAIScripting0x43_L075)   ;B5859E
    %AICMD0x1C_ShowDialog($0212, $00)                          ;B585A5
    %AICMD0x41_AddValue16(nLove_Ann, 8)                        ;B585A9
    %AICMD0x12_Jump(pAIScripting0x43_L067)                                   ;B585AF
pAIScripting0x43_L072:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $07, pAIScripting0x43_L075)   ;B585B2
    %AICMD0x1C_ShowDialog($03B2, $00)                          ;B585B9
    %AICMD0x41_AddValue16(nLove_Ann, 5)                        ;B585BD
    %AICMD0x12_Jump(pAIScripting0x43_L067)                                   ;B585C3
pAIScripting0x43_L073:
    %AICMD0x1C_ShowDialog($03B4, $00)                          ;B585C6
    %AICMD0x41_AddValue16(nLove_Ann, -4)                       ;B585CA
    %AICMD0x12_Jump(pAIScripting0x43_L067)                                   ;B585D0
pAIScripting0x43_L074:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $07, pAIScripting0x43_L075)   ;B585D3
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $08, pAIScripting0x43_L076)   ;B585DA
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $09, pAIScripting0x43_L077)   ;B585E1
    %AICMD0x1C_ShowDialog($0212, $00)                          ;B585E8
    %AICMD0x41_AddValue16(nLove_Ann, 8)                        ;B585EC
    %AICMD0x12_Jump(pAIScripting0x43_L067)                                   ;B585F2
pAIScripting0x43_L075:
    %AICMD0x1C_ShowDialog($01BD, $00)                          ;B585F5
    %AICMD0x41_AddValue16(nPlayerHappiness, 30)                ;B585F9
    %AICMD0x12_Jump(pAIScripting0x43_L067)                                   ;B585FF
pAIScripting0x43_L076:
    %AICMD0x1C_ShowDialog($041D, $00)                          ;B58602
    %AICMD0x41_AddValue16(nPlayerHappiness, 30)                ;B58606
    %AICMD0x12_Jump(pAIScripting0x43_L067)                                   ;B5860C
pAIScripting0x43_L077:
    %AICMD0x1C_ShowDialog($041E, $00)                          ;B5860F
    %AICMD0x41_AddValue16(nPlayerHappiness, 30)                ;B58613
    %AICMD0x12_Jump(pAIScripting0x43_L067)                                   ;B58619
pAIScripting0x43_L078:
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 15, 18, pAIScripting0x43_L120) ;B5861C
    %AICMD0x43_JumpIfEqual16(nMarriedDaysCounter, 1, pAIScripting0x43_L081)  ;B58624
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $04, pAIScripting0x43_L082)   ;B5862C
    %AICMD0x15_JumpIfEquals8($80098C, 3, pAIScripting0x43_L083)              ;B58633
    %AICMD0x14_JumpIfFlagSet($800196, $04, pAIScripting0x43_L084)            ;B5863A
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $05, pAIScripting0x43_L082)   ;B58641
    %AICMD0x43_JumpIfEqual16(nFirstChildAge, 1, pAIScripting0x43_L087)       ;B58648
    %AICMD0x43_JumpIfEqual16(nSecondChildAge, 1, pAIScripting0x43_L087)      ;B58650
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 2, 19, pAIScripting0x43_L088) ;B58658
    %AICMD0x45_JumpIfBetween16(nSecondChildAge, 2, 19, pAIScripting0x43_L088);B58662
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 20, 39, pAIScripting0x43_L090);B5866C
    %AICMD0x45_JumpIfBetween16(nSecondChildAge, 20, 39, pAIScripting0x43_L090);B58676
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 40, 59, pAIScripting0x43_L092);B58680
    %AICMD0x45_JumpIfBetween16(nSecondChildAge, 40, 59, pAIScripting0x43_L092);B5868A
    %AICMD0x43_JumpIfEqual16(nFirstChildAge, 90, pAIScripting0x43_L094)      ;B58694
    %AICMD0x43_JumpIfEqual16(nSecondChildAge, 90, pAIScripting0x43_L094)     ;B5869C
    %AICMD0x55_JumpIfFlagNotSet(strcFlags.event1, $07, pAIScripting0x43_L079)                 ;B586A4
    %AICMD0x55_JumpIfFlagNotSet(strcFlags.event2, $0A, pAIScripting0x43_L085)                 ;B586AB
    %AICMD0x55_JumpIfFlagNotSet(strcFlags.event2, $0B, pAIScripting0x43_L085)                 ;B586B2
    %AICMD0x55_JumpIfFlagNotSet(strcFlags.event2, $0C, pAIScripting0x43_L085)                 ;B586B9
    %AICMD0x55_JumpIfFlagNotSet(strcFlags.event2, $09, pAIScripting0x43_L086)                 ;B586C0
pAIScripting0x43_L079:
    %AICMD0x15_JumpIfEquals8(nCurrentWeekdayID, 0, pAIScripting0x43_L102)    ;B586C7
    %AICMD0x15_JumpIfEquals8(nCurrentWeekdayID, 6, pAIScripting0x43_L101)    ;B586CE
    %AICMD0x45_JumpIfBetween16(nLove_Ann, 200, 220, pAIScripting0x43_L099)   ;B586D5
    %AICMD0x45_JumpIfBetween16(nLove_Ann, 221, 250, pAIScripting0x43_L100)   ;B586DF
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 0, pAIScripting0x43_L103)     ;B586E9
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 1, pAIScripting0x43_L105)     ;B586F0
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 2, pAIScripting0x43_L108)     ;B586F7
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, pAIScripting0x43_L110)     ;B586FE
pAIScripting0x43_L080:
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 60, 89, pAIScripting0x43_L095);B58705
    %AICMD0x45_JumpIfBetween16(nSecondChildAge, 60, 89, pAIScripting0x43_L095);B5870F
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 91, 119, pAIScripting0x43_L096);B58719
    %AICMD0x45_JumpIfBetween16(nSecondChildAge, 91, 119, pAIScripting0x43_L096);B58723
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 120, 999, pAIScripting0x43_L097);B5872D
    %AICMD0x45_JumpIfBetween16(nSecondChildAge, 120, 999, pAIScripting0x43_L097);B58737
    %AICMD0x1C_ShowDialog($0485, $00)                          ;B58741
    %AICMD0x12_Jump(pAIScripting0x43_L067)                                   ;B58745
pAIScripting0x43_L081:
    %AICMD0x1C_ShowDialog($017D, $00)                          ;B58748
    %AICMD0x12_Jump(pAIScripting0x43_L067)                                   ;B5874C
pAIScripting0x43_L082:
    %AICMD0x1C_ShowDialog($0166, $00)                          ;B5874F
    %AICMD0x12_Jump(pAIScripting0x43_L067)                                   ;B58753
pAIScripting0x43_L083:
    %AICMD0x1C_ShowDialog($015F, $00)                          ;B58756
    %AICMD0x12_Jump(pAIScripting0x43_L067)                                   ;B5875A
pAIScripting0x43_L084:
    %AICMD0x1C_ShowDialog($0160, $00)                          ;B5875D
    %AICMD0x12_Jump(pAIScripting0x43_L067)                                   ;B58761
pAIScripting0x43_L085:
    %AICMD0x1C_ShowDialog($01A0, $00)                          ;B58764
    %AICMD0x12_Jump(pAIScripting0x43_L067)                                   ;B58768
pAIScripting0x43_L086:
    %AICMD0x1C_ShowDialog($0493, $00)                          ;B5876B
    %AICMD0x12_Jump(pAIScripting0x43_L067)                                   ;B5876F
pAIScripting0x43_L087:
    %AICMD0x1C_ShowDialog($01A2, $00)                          ;B58772
    %AICMD0x12_Jump(pAIScripting0x43_L067)                                   ;B58776
pAIScripting0x43_L088:
    %AICMD0x17_RollRandom($02)                                            ;B58779
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x43_L079)                                   ;B5877B
    %AICMD0x18_JumpIfRandomEquals($01, pAIScripting0x43_L089)                                   ;B5877F
    %AICMD0x12_Jump(pAIScripting0x43_L067)                                   ;B58783
pAIScripting0x43_L089:
    %AICMD0x1C_ShowDialog($01A4, $00)                          ;B58786
    %AICMD0x12_Jump(pAIScripting0x43_L067)                                   ;B5878A
pAIScripting0x43_L090:
    %AICMD0x17_RollRandom($02)                                            ;B5878D
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x43_L079)                                   ;B5878F
    %AICMD0x18_JumpIfRandomEquals($01, pAIScripting0x43_L091)                                   ;B58793
    %AICMD0x12_Jump(pAIScripting0x43_L067)                                   ;B58797
pAIScripting0x43_L091:
    %AICMD0x1C_ShowDialog($01A6, $00)                          ;B5879A
    %AICMD0x12_Jump(pAIScripting0x43_L067)                                   ;B5879E
pAIScripting0x43_L092:
    %AICMD0x17_RollRandom($02)                                            ;B587A1
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x43_L079)                                   ;B587A3
    %AICMD0x18_JumpIfRandomEquals($01, pAIScripting0x43_L093)                                   ;B587A7
    %AICMD0x12_Jump(pAIScripting0x43_L067)                                   ;B587AB
pAIScripting0x43_L093:
    %AICMD0x1C_ShowDialog($01A7, $00)                          ;B587AE
    %AICMD0x12_Jump(pAIScripting0x43_L067)                                   ;B587B2
pAIScripting0x43_L094:
    %AICMD0x1C_ShowDialog($0481, $00)                          ;B587B5
    %AICMD0x12_Jump(pAIScripting0x43_L067)                                   ;B587B9
pAIScripting0x43_L095:
    %AICMD0x1C_ShowDialog($0480, $00)                          ;B587BC
    %AICMD0x12_Jump(pAIScripting0x43_L067)                                   ;B587C0
pAIScripting0x43_L096:
    %AICMD0x1C_ShowDialog($0484, $00)                          ;B587C3
    %AICMD0x12_Jump(pAIScripting0x43_L067)                                   ;B587C7
pAIScripting0x43_L097:
    %AICMD0x17_RollRandom($02)                                            ;B587CA
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x43_L098)                                   ;B587CC
    %AICMD0x1C_ShowDialog($0482, $00)                          ;B587D0
    %AICMD0x12_Jump(pAIScripting0x43_L067)                                   ;B587D4
pAIScripting0x43_L098:
    %AICMD0x1C_ShowDialog($0443, $00)                          ;B587D7
    %AICMD0x12_Jump(pAIScripting0x43_L067)                                   ;B587DB
pAIScripting0x43_L099:
    %AICMD0x1C_ShowDialog($01F4, $00)                          ;B587DE
    %AICMD0x12_Jump(pAIScripting0x43_L067)                                   ;B587E2
pAIScripting0x43_L100:
    %AICMD0x1C_ShowDialog($0049, $00)                          ;B587E5
    %AICMD0x12_Jump(pAIScripting0x43_L067)                                   ;B587E9
pAIScripting0x43_L101:
    %AICMD0x1C_ShowDialog($047D, $00)                          ;B587EC
    %AICMD0x12_Jump(pAIScripting0x43_L067)                                   ;B587F0
pAIScripting0x43_L102:
    %AICMD0x14_JumpIfFlagSet($800196, $01, pAIScripting0x43_L119)            ;B587F3
    %AICMD0x14_JumpIfFlagSet($800196, $03, pAIScripting0x43_L119)            ;B587FA
    %AICMD0x1C_ShowDialog($0195, $00)                          ;B58801
    %AICMD0x12_Jump(pAIScripting0x43_L067)                                   ;B58805
pAIScripting0x43_L103:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 22, pAIScripting0x43_L104)         ;B58808
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 23, pAIScripting0x43_L116)         ;B5880F
    %AICMD0x14_JumpIfFlagSet($800196, $01, pAIScripting0x43_L117)            ;B58816
    %AICMD0x17_RollRandom($02)                                            ;B5881D
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x43_L080)                                   ;B5881F
    %AICMD0x1C_ShowDialog($0182, $00)                          ;B58823
    %AICMD0x12_Jump(pAIScripting0x43_L067)                                   ;B58827
pAIScripting0x43_L104:
    %AICMD0x1C_ShowDialog($0207, $00)                          ;B5882A
    %AICMD0x12_Jump(pAIScripting0x43_L067)                                   ;B5882E
pAIScripting0x43_L105:
    %AICMD0x14_JumpIfFlagSet($800196, $01, pAIScripting0x43_L117)            ;B58831
    %AICMD0x17_RollRandom($04)                                            ;B58838
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x43_L106)                                   ;B5883A
    %AICMD0x18_JumpIfRandomEquals($01, pAIScripting0x43_L107)                                   ;B5883E
    %AICMD0x18_JumpIfRandomEquals($02, pAIScripting0x43_L080)                                   ;B58842
    %AICMD0x1C_ShowDialog($0422, $00)                          ;B58846
    %AICMD0x12_Jump(pAIScripting0x43_L067)                                   ;B5884A
pAIScripting0x43_L106:
    %AICMD0x1C_ShowDialog($0420, $00)                          ;B5884D
    %AICMD0x12_Jump(pAIScripting0x43_L067)                                   ;B58851
pAIScripting0x43_L107:
    %AICMD0x1C_ShowDialog($0426, $00)                          ;B58854
    %AICMD0x12_Jump(pAIScripting0x43_L067)                                   ;B58858
pAIScripting0x43_L108:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 11, pAIScripting0x43_L109)         ;B5885B
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 12, pAIScripting0x43_L116)         ;B58862
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 20, pAIScripting0x43_L116)         ;B58869
    %AICMD0x14_JumpIfFlagSet($800196, $01, pAIScripting0x43_L117)            ;B58870
    %AICMD0x17_RollRandom($02)                                            ;B58877
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x43_L080)                                   ;B58879
    %AICMD0x1C_ShowDialog($0423, $00)                          ;B5887D
    %AICMD0x12_Jump(pAIScripting0x43_L067)                                   ;B58881
pAIScripting0x43_L109:
    %AICMD0x1C_ShowDialog($0239, $00)                          ;B58884
    %AICMD0x12_Jump(pAIScripting0x43_L067)                                   ;B58888
pAIScripting0x43_L110:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 10, pAIScripting0x43_L112)         ;B5888B
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 23, pAIScripting0x43_L114)         ;B58892
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 30, pAIScripting0x43_L115)         ;B58899
    %AICMD0x14_JumpIfFlagSet($800196, $03, pAIScripting0x43_L118)            ;B588A0
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 15, 17, pAIScripting0x43_L121) ;B588A7
    %AICMD0x17_RollRandom($02)                                            ;B588AF
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x43_L080)                                   ;B588B1
    %AICMD0x1C_ShowDialog($042D, $00)                          ;B588B5
    %AICMD0x12_Jump(pAIScripting0x43_L067)                                   ;B588B9
pAIScripting0x43_L111:
    %AICMD0x14_JumpIfFlagSet(strcFlags.daily3, $0B, pAIScripting0x43_L122)   ;B588BC
    %AICMD0x1F(pAIScripting0x43_L112)                                        ;B588C3
    %AICMD0x12_Jump(pAIScripting0x43_L111)                                   ;B588C6
pAIScripting0x43_L112:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $05, pAIScripting0x43_L113) ;B588C9
    %AICMD0x1C_ShowDialog($0292, $00)                          ;B588D0
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown1, $05)     ;B588D4
    %AICMD0x08_EnableAIControl()                               ;B588D9
    %AICMD0x19($0039, $00)                                     ;B588DA
    %AICMD0x13_Wait(120)                                       ;B588DE
    %AICMD0x11_EnableUserControl()                             ;B588E1
    %AICMD0x41_AddValue16(nPlayerHappiness, 30)                ;B588E2
    %AICMD0x12_Jump(pAIScripting0x43_L111)                                   ;B588E8
pAIScripting0x43_L113:
    %AICMD0x1C_ShowDialog($0293, $00)                          ;B588EB
    %AICMD0x12_Jump(pAIScripting0x43_L111)                                   ;B588EF
pAIScripting0x43_L114:
    %AICMD0x1C_ShowDialog($02B4, $00)                          ;B588F2
    %AICMD0x12_Jump(pAIScripting0x43_L067)                                   ;B588F6
pAIScripting0x43_L115:
    %AICMD0x1C_ShowDialog($03F9, $00)                          ;B588F9
    %AICMD0x12_Jump(pAIScripting0x43_L067)                                   ;B588FD
pAIScripting0x43_L116:
    %AICMD0x1C_ShowDialog($0361, $00)                          ;B58900
    %AICMD0x12_Jump(pAIScripting0x43_L067)                                   ;B58904
pAIScripting0x43_L117:
    %AICMD0x1C_ShowDialog($0196, $00)                          ;B58907
    %AICMD0x12_Jump(pAIScripting0x43_L067)                                   ;B5890B
pAIScripting0x43_L118:
    %AICMD0x1C_ShowDialog($0198, $00)                          ;B5890E
    %AICMD0x12_Jump(pAIScripting0x43_L067)                                   ;B58912
pAIScripting0x43_L119:
    %AICMD0x1C_ShowDialog($047C, $00)                          ;B58915
    %AICMD0x12_Jump(pAIScripting0x43_L067)                                   ;B58919
pAIScripting0x43_L120:
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, pAIScripting0x43_L121)     ;B5891C
    %AICMD0x1C_ShowDialog($0180, $00)                          ;B58923
    %AICMD0x1B($022F, $00)                                     ;B58927
    %AICMD0x08_EnableAIControl()                               ;B5892B
    %AICMD0x19($003A, $00)                                     ;B5892C
    %AICMD0x13_Wait(120)                                       ;B58930
    %AICMD0x11_EnableUserControl()                             ;B58933
    %AICMD0x57_UpdateStamina(30)                               ;B58934
    %AICMD0x12_Jump(pAIScripting0x43_L067)                                   ;B58936
pAIScripting0x43_L121:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 10, pAIScripting0x43_L112)         ;B58939
    %AICMD0x1C_ShowDialog($042E, $00)                          ;B58940
    %AICMD0x1B($022F, $00)                                     ;B58944
    %AICMD0x08_EnableAIControl()                               ;B58948
    %AICMD0x19($0030, $00)                                     ;B58949
    %AICMD0x13_Wait(120)                                       ;B5894D
    %AICMD0x11_EnableUserControl()                             ;B58950
    %AICMD0x57_UpdateStamina(30)                               ;B58951
    %AICMD0x12_Jump(pAIScripting0x43_L067)                                   ;B58953
pAIScripting0x43_L122:
    %AICMD0x1B($02E7, $00)                                     ;B58956
    %AICMD0x0D($FF, $00, $20, $01)                             ;B5895A
    %AICMD0x1B($02E5, $00)                                     ;B5895F
    %AICMD0x0D($00, $FF, $14, $01)                             ;B58963
    %AICMD0x1B($02E7, $00)                                     ;B58968
    %AICMD0x0D($FF, $00, $10, $01)                             ;B5896C
    %AICMD0x1B($02F1, $00)                                     ;B58971
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily3, $0C)       ;B58975
    %AICMD0x41_AddValue16(nLove_Ann, 2)                        ;B5897A
    %AICMD0x12_Jump(pAIScripting0x43_L068)                                   ;B58980
pAIScripting0x43_L123:
    %AICMD0x1C_ShowDialog($02C2, $00)                          ;B58983
    %AICMD0x12_Jump(pAIScripting0x43_L068)                                   ;B58987
pAIScripting0x43_L124:
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily3, $0C)       ;B5898A
    %AICMD0x10_End()                                           ;B5898F


DATA8_B58990:
 
    %AICMD0x14_JumpIfFlagSet($800196, $01, pAIScripting0x43_L125)            ;B58990
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, pAIScripting0x43_L125)     ;B58997
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 11, 14, pAIScripting0x43_L186) ;B5899E
pAIScripting0x43_L125:
    %AICMD0x15_JumpIfEquals8(nCurrentTimeID, 18, pAIScripting0x43_L127)      ;B589A6
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $07, pAIScripting0x43_L126)   ;B589AD
    %AICMD0x1A($0058, $0068, aAIScriptingData_L071, $00)                     ;B589B4
    %AICMD0x12_Jump(pAIScripting0x43_L129)                                   ;B589BC
pAIScripting0x43_L126:
    %AICMD0x1A($0148, $0078, aAIScriptingData_L071, $00)                     ;B589BF
    %AICMD0x12_Jump(pAIScripting0x43_L129)                                   ;B589C7
pAIScripting0x43_L127:
    %AICMD0x41_AddValue16(nLove_Nina, -2)                      ;B589CA
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $07, pAIScripting0x43_L128)   ;B589D0
    %AICMD0x1A($0029, $0053, aAIScriptingData_L072, $00)                     ;B589D7
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily3, $0C)       ;B589DF
    %AICMD0x12_Jump(pAIScripting0x43_L130)                                   ;B589E4
pAIScripting0x43_L128:
    %AICMD0x1A($0119, $0063, aAIScriptingData_L072, $00)                     ;B589E7
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily3, $0C)       ;B589EF
    %AICMD0x12_Jump(pAIScripting0x43_L130)                                   ;B589F4
pAIScripting0x43_L129:
    %AICMD0x14_JumpIfFlagSet(strcFlags.daily3, $0B, pAIScripting0x43_L184)   ;B589F7
    %AICMD0x2D_JumpOnInteract(pAIScripting0x43_L140, pAIScripting0x43_L131)                               ;B589FE
    %AICMD0x12_Jump(pAIScripting0x43_L129)                                   ;B58A03
pAIScripting0x43_L130:
    %AICMD0x1F(pAIScripting0x43_L185)                                        ;B58A06
    %AICMD0x12_Jump(pAIScripting0x43_L130)                                   ;B58A09
pAIScripting0x43_L131:
    %AICMD0x16_JumpIfBetween8($80091E, 1, 4, pAIScripting0x43_L134)          ;B58A0C
    %AICMD0x16_JumpIfBetween8($80091E, 16, 23, pAIScripting0x43_L134)        ;B58A14
    %AICMD0x16_JumpIfBetween8($80091E, 9, 12, pAIScripting0x43_L136)         ;B58A1C
    %AICMD0x15_JumpIfEquals8($80091E, 6, pAIScripting0x43_L135)              ;B58A24
    %AICMD0x15_JumpIfEquals8($80091E, 5, pAIScripting0x43_L135)              ;B58A2B
    %AICMD0x15_JumpIfEquals8($80091E, 25, pAIScripting0x43_L132)             ;B58A32
    %AICMD0x15_JumpIfEquals8($80091E, 73, pAIScripting0x43_L133)             ;B58A39
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B58A40
    %AICMD0x12_Jump(pAIScripting0x43_L129)                                   ;B58A44
pAIScripting0x43_L132:
    %AICMD0x1C_ShowDialog($03B1, $00)                          ;B58A47
    %AICMD0x41_AddValue16(nLove_Nina, -8)                      ;B58A4B
    %AICMD0x12_Jump(pAIScripting0x43_L129)                                   ;B58A51
pAIScripting0x43_L133:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $07, pAIScripting0x43_L137)   ;B58A54
    %AICMD0x1C_ShowDialog($0212, $00)                          ;B58A5B
    %AICMD0x41_AddValue16(nLove_Nina, 8)                       ;B58A5F
    %AICMD0x12_Jump(pAIScripting0x43_L129)                                   ;B58A65
pAIScripting0x43_L134:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $07, pAIScripting0x43_L137)   ;B58A68
    %AICMD0x1C_ShowDialog($03B2, $00)                          ;B58A6F
    %AICMD0x41_AddValue16(nLove_Nina, 5)                       ;B58A73
    %AICMD0x12_Jump(pAIScripting0x43_L129)                                   ;B58A79
pAIScripting0x43_L135:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $07, pAIScripting0x43_L137)   ;B58A7C
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $08, pAIScripting0x43_L138)   ;B58A83
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $09, pAIScripting0x43_L139)   ;B58A8A
    %AICMD0x1C_ShowDialog($0212, $00)                          ;B58A91
    %AICMD0x41_AddValue16(nLove_Nina, 8)                       ;B58A95
    %AICMD0x12_Jump(pAIScripting0x43_L129)                                   ;B58A9B
pAIScripting0x43_L136:
    %AICMD0x1C_ShowDialog($03BA, $00)                          ;B58A9E
    %AICMD0x41_AddValue16(nLove_Nina, -4)                      ;B58AA2
    %AICMD0x12_Jump(pAIScripting0x43_L129)                                   ;B58AA8
pAIScripting0x43_L137:
    %AICMD0x1C_ShowDialog($01BD, $00)                          ;B58AAB
    %AICMD0x41_AddValue16(nPlayerHappiness, 30)                ;B58AAF
    %AICMD0x12_Jump(pAIScripting0x43_L129)                                   ;B58AB5
pAIScripting0x43_L138:
    %AICMD0x1C_ShowDialog($041D, $00)                          ;B58AB8
    %AICMD0x41_AddValue16(nPlayerHappiness, 30)                ;B58ABC
    %AICMD0x12_Jump(pAIScripting0x43_L129)                                   ;B58AC2
pAIScripting0x43_L139:
    %AICMD0x1C_ShowDialog($041E, $00)                          ;B58AC5
    %AICMD0x41_AddValue16(nPlayerHappiness, 30)                ;B58AC9
    %AICMD0x12_Jump(pAIScripting0x43_L129)                                   ;B58ACF
pAIScripting0x43_L140:
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 15, 18, pAIScripting0x43_L182) ;B58AD2
    %AICMD0x43_JumpIfEqual16(nMarriedDaysCounter, 1, pAIScripting0x43_L143)  ;B58ADA
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $04, pAIScripting0x43_L144)   ;B58AE2
    %AICMD0x15_JumpIfEquals8($80098C, 3, pAIScripting0x43_L145)              ;B58AE9
    %AICMD0x14_JumpIfFlagSet($800196, $04, pAIScripting0x43_L146)            ;B58AF0
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $05, pAIScripting0x43_L144)   ;B58AF7
    %AICMD0x43_JumpIfEqual16(nFirstChildAge, 1, pAIScripting0x43_L149)       ;B58AFE
    %AICMD0x43_JumpIfEqual16(nSecondChildAge, 1, pAIScripting0x43_L149)      ;B58B06
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 2, 19, pAIScripting0x43_L150) ;B58B0E
    %AICMD0x45_JumpIfBetween16(nSecondChildAge, 2, 19, pAIScripting0x43_L150);B58B18
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 20, 39, pAIScripting0x43_L152);B58B22
    %AICMD0x45_JumpIfBetween16(nSecondChildAge, 20, 39, pAIScripting0x43_L152);B58B2C
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 40, 59, pAIScripting0x43_L154);B58B36
    %AICMD0x45_JumpIfBetween16(nSecondChildAge, 40, 59, pAIScripting0x43_L154);B58B40
    %AICMD0x43_JumpIfEqual16(nFirstChildAge, 90, pAIScripting0x43_L156)      ;B58B4A
    %AICMD0x43_JumpIfEqual16(nSecondChildAge, 90, pAIScripting0x43_L156)     ;B58B52
    %AICMD0x55_JumpIfFlagNotSet(strcFlags.event1, $07, pAIScripting0x43_L141)                 ;B58B5A
    %AICMD0x55_JumpIfFlagNotSet(strcFlags.event2, $0A, pAIScripting0x43_L147)                 ;B58B61
    %AICMD0x55_JumpIfFlagNotSet(strcFlags.event2, $0B, pAIScripting0x43_L147)                 ;B58B68
    %AICMD0x55_JumpIfFlagNotSet(strcFlags.event2, $0C, pAIScripting0x43_L147)                 ;B58B6F
    %AICMD0x55_JumpIfFlagNotSet(strcFlags.event2, $09, pAIScripting0x43_L148)                 ;B58B76
pAIScripting0x43_L141:
    %AICMD0x15_JumpIfEquals8(nCurrentWeekdayID, 0, pAIScripting0x43_L164)    ;B58B7D
    %AICMD0x15_JumpIfEquals8(nCurrentWeekdayID, 6, pAIScripting0x43_L163)    ;B58B84
    %AICMD0x45_JumpIfBetween16(nLove_Nina, 200, 220, pAIScripting0x43_L161)  ;B58B8B
    %AICMD0x45_JumpIfBetween16(nLove_Nina, 221, 250, pAIScripting0x43_L162)  ;B58B95
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 0, pAIScripting0x43_L165)     ;B58B9F
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 1, pAIScripting0x43_L167)     ;B58BA6
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 2, pAIScripting0x43_L170)     ;B58BAD
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, pAIScripting0x43_L172)     ;B58BB4
pAIScripting0x43_L142:
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 60, 89, pAIScripting0x43_L157);B58BBB
    %AICMD0x45_JumpIfBetween16(nSecondChildAge, 60, 89, pAIScripting0x43_L157);B58BC5
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 91, 119, pAIScripting0x43_L158);B58BCF
    %AICMD0x45_JumpIfBetween16(nSecondChildAge, 91, 119, pAIScripting0x43_L158);B58BD9
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 120, 999, pAIScripting0x43_L159);B58BE3
    %AICMD0x45_JumpIfBetween16(nSecondChildAge, 120, 999, pAIScripting0x43_L159);B58BED
    %AICMD0x1C_ShowDialog($0485, $00)                          ;B58BF7
    %AICMD0x12_Jump(pAIScripting0x43_L129)                                   ;B58BFB
pAIScripting0x43_L143:
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 15, 18, pAIScripting0x43_L182) ;B58BFE
    %AICMD0x1C_ShowDialog($017D, $00)                          ;B58C06
    %AICMD0x12_Jump(pAIScripting0x43_L129)                                   ;B58C0A
pAIScripting0x43_L144:
    %AICMD0x1C_ShowDialog($0166, $00)                          ;B58C0D
    %AICMD0x12_Jump(pAIScripting0x43_L129)                                   ;B58C11
pAIScripting0x43_L145:
    %AICMD0x1C_ShowDialog($015F, $00)                          ;B58C14
    %AICMD0x12_Jump(pAIScripting0x43_L129)                                   ;B58C18
pAIScripting0x43_L146:
    %AICMD0x1C_ShowDialog($0160, $00)                          ;B58C1B
    %AICMD0x12_Jump(pAIScripting0x43_L129)                                   ;B58C1F
pAIScripting0x43_L147:
    %AICMD0x1C_ShowDialog($01A0, $00)                          ;B58C22
    %AICMD0x12_Jump(pAIScripting0x43_L129)                                   ;B58C26
pAIScripting0x43_L148:
    %AICMD0x1C_ShowDialog($0493, $00)                          ;B58C29
    %AICMD0x12_Jump(pAIScripting0x43_L129)                                   ;B58C2D
pAIScripting0x43_L149:
    %AICMD0x1C_ShowDialog($01A2, $00)                          ;B58C30
    %AICMD0x12_Jump(pAIScripting0x43_L129)                                   ;B58C34
pAIScripting0x43_L150:
    %AICMD0x17_RollRandom($02)                                            ;B58C37
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x43_L141)                                   ;B58C39
    %AICMD0x18_JumpIfRandomEquals($01, pAIScripting0x43_L151)                                   ;B58C3D
    %AICMD0x12_Jump(pAIScripting0x43_L129)                                   ;B58C41
pAIScripting0x43_L151:
    %AICMD0x1C_ShowDialog($01A4, $00)                          ;B58C44
    %AICMD0x12_Jump(pAIScripting0x43_L129)                                   ;B58C48
pAIScripting0x43_L152:
    %AICMD0x17_RollRandom($02)                                            ;B58C4B
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x43_L141)                                   ;B58C4D
    %AICMD0x18_JumpIfRandomEquals($01, pAIScripting0x43_L153)                                   ;B58C51
    %AICMD0x12_Jump(pAIScripting0x43_L129)                                   ;B58C55
pAIScripting0x43_L153:
    %AICMD0x1C_ShowDialog($01A6, $00)                          ;B58C58
    %AICMD0x12_Jump(pAIScripting0x43_L129)                                   ;B58C5C
pAIScripting0x43_L154:
    %AICMD0x17_RollRandom($02)                                            ;B58C5F
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x43_L141)                                   ;B58C61
    %AICMD0x18_JumpIfRandomEquals($01, pAIScripting0x43_L155)                                   ;B58C65
    %AICMD0x12_Jump(pAIScripting0x43_L129)                                   ;B58C69
pAIScripting0x43_L155:
    %AICMD0x1C_ShowDialog($01A8, $00)                          ;B58C6C
    %AICMD0x12_Jump(pAIScripting0x43_L129)                                   ;B58C70
pAIScripting0x43_L156:
    %AICMD0x1C_ShowDialog($0481, $00)                          ;B58C73
    %AICMD0x12_Jump(pAIScripting0x43_L129)                                   ;B58C77
pAIScripting0x43_L157:
    %AICMD0x1C_ShowDialog($0480, $00)                          ;B58C7A
    %AICMD0x12_Jump(pAIScripting0x43_L129)                                   ;B58C7E
pAIScripting0x43_L158:
    %AICMD0x1C_ShowDialog($0484, $00)                          ;B58C81
    %AICMD0x12_Jump(pAIScripting0x43_L129)                                   ;B58C85
pAIScripting0x43_L159:
    %AICMD0x17_RollRandom($02)                                            ;B58C88
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x43_L160)                                   ;B58C8A
    %AICMD0x1C_ShowDialog($0482, $00)                          ;B58C8E
    %AICMD0x12_Jump(pAIScripting0x43_L129)                                   ;B58C92
pAIScripting0x43_L160:
    %AICMD0x1C_ShowDialog($0443, $00)                          ;B58C95
    %AICMD0x12_Jump(pAIScripting0x43_L129)                                   ;B58C99
pAIScripting0x43_L161:
    %AICMD0x1C_ShowDialog($01F4, $00)                          ;B58C9C
    %AICMD0x12_Jump(pAIScripting0x43_L129)                                   ;B58CA0
pAIScripting0x43_L162:
    %AICMD0x1C_ShowDialog($0049, $00)                          ;B58CA3
    %AICMD0x12_Jump(pAIScripting0x43_L129)                                   ;B58CA7
pAIScripting0x43_L163:
    %AICMD0x1C_ShowDialog($047D, $00)                          ;B58CAA
    %AICMD0x12_Jump(pAIScripting0x43_L129)                                   ;B58CAE
pAIScripting0x43_L164:
    %AICMD0x14_JumpIfFlagSet($800196, $01, pAIScripting0x43_L179)            ;B58CB1
    %AICMD0x14_JumpIfFlagSet($800196, $03, pAIScripting0x43_L179)            ;B58CB8
    %AICMD0x1C_ShowDialog($0195, $00)                          ;B58CBF
    %AICMD0x12_Jump(pAIScripting0x43_L129)                                   ;B58CC3
pAIScripting0x43_L165:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 22, pAIScripting0x43_L166)         ;B58CC6
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 23, pAIScripting0x43_L178)         ;B58CCD
    %AICMD0x14_JumpIfFlagSet($800196, $01, pAIScripting0x43_L180)            ;B58CD4
    %AICMD0x17_RollRandom($02)                                            ;B58CDB
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x43_L142)                                   ;B58CDD
    %AICMD0x1C_ShowDialog($0424, $00)                          ;B58CE1
    %AICMD0x12_Jump(pAIScripting0x43_L129)                                   ;B58CE5
pAIScripting0x43_L166:
    %AICMD0x1C_ShowDialog($0208, $00)                          ;B58CE8
    %AICMD0x12_Jump(pAIScripting0x43_L129)                                   ;B58CEC
pAIScripting0x43_L167:
    %AICMD0x14_JumpIfFlagSet($800196, $01, pAIScripting0x43_L180)            ;B58CEF
    %AICMD0x17_RollRandom($04)                                            ;B58CF6
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x43_L168)                                   ;B58CF8
    %AICMD0x18_JumpIfRandomEquals($01, pAIScripting0x43_L169)                                   ;B58CFC
    %AICMD0x18_JumpIfRandomEquals($02, pAIScripting0x43_L142)                                   ;B58D00
    %AICMD0x1C_ShowDialog($0425, $00)                          ;B58D04
    %AICMD0x12_Jump(pAIScripting0x43_L129)                                   ;B58D08
pAIScripting0x43_L168:
    %AICMD0x1C_ShowDialog($0423, $00)                          ;B58D0B
    %AICMD0x12_Jump(pAIScripting0x43_L129)                                   ;B58D0F
pAIScripting0x43_L169:
    %AICMD0x1C_ShowDialog($0141, $00)                          ;B58D12
    %AICMD0x12_Jump(pAIScripting0x43_L129)                                   ;B58D16
pAIScripting0x43_L170:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 11, pAIScripting0x43_L171)         ;B58D19
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 12, pAIScripting0x43_L178)         ;B58D20
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 20, pAIScripting0x43_L178)         ;B58D27
    %AICMD0x14_JumpIfFlagSet($800196, $01, pAIScripting0x43_L180)            ;B58D2E
    %AICMD0x17_RollRandom($02)                                            ;B58D35
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x43_L142)                                   ;B58D37
    %AICMD0x1C_ShowDialog($0423, $00)                          ;B58D3B
    %AICMD0x12_Jump(pAIScripting0x43_L129)                                   ;B58D3F
pAIScripting0x43_L171:
    %AICMD0x1C_ShowDialog($023A, $00)                          ;B58D42
    %AICMD0x12_Jump(pAIScripting0x43_L129)                                   ;B58D46
pAIScripting0x43_L172:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 10, pAIScripting0x43_L174)         ;B58D49
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 23, pAIScripting0x43_L176)         ;B58D50
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 30, pAIScripting0x43_L177)         ;B58D57
    %AICMD0x14_JumpIfFlagSet($800196, $03, pAIScripting0x43_L181)            ;B58D5E
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 15, 17, pAIScripting0x43_L182) ;B58D65
    %AICMD0x17_RollRandom($02)                                            ;B58D6D
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x43_L142)                                   ;B58D6F
    %AICMD0x1C_ShowDialog($042F, $00)                          ;B58D73
    %AICMD0x12_Jump(pAIScripting0x43_L129)                                   ;B58D77
pAIScripting0x43_L173:
    %AICMD0x14_JumpIfFlagSet(strcFlags.daily3, $0B, pAIScripting0x43_L184)   ;B58D7A
    %AICMD0x1F(pAIScripting0x43_L174)                                        ;B58D81
    %AICMD0x12_Jump(pAIScripting0x43_L173)                                   ;B58D84
pAIScripting0x43_L174:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $05, pAIScripting0x43_L175) ;B58D87
    %AICMD0x1C_ShowDialog($0292, $00)                          ;B58D8E
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown1, $05)     ;B58D92
    %AICMD0x08_EnableAIControl()                               ;B58D97
    %AICMD0x19($0039, $00)                                     ;B58D98
    %AICMD0x13_Wait(120)                                       ;B58D9C
    %AICMD0x11_EnableUserControl()                             ;B58D9F
    %AICMD0x41_AddValue16(nPlayerHappiness, 30)                ;B58DA0
    %AICMD0x12_Jump(pAIScripting0x43_L173)                                   ;B58DA6
pAIScripting0x43_L175:
    %AICMD0x1C_ShowDialog($0293, $00)                          ;B58DA9
    %AICMD0x12_Jump(pAIScripting0x43_L173)                                   ;B58DAD
pAIScripting0x43_L176:
    %AICMD0x1C_ShowDialog($02B1, $00)                          ;B58DB0
    %AICMD0x12_Jump(pAIScripting0x43_L129)                                   ;B58DB4
pAIScripting0x43_L177:
    %AICMD0x1C_ShowDialog($03FA, $00)                          ;B58DB7
    %AICMD0x12_Jump(pAIScripting0x43_L129)                                   ;B58DBB
pAIScripting0x43_L178:
    %AICMD0x1C_ShowDialog($0361, $00)                          ;B58DBE
    %AICMD0x12_Jump(pAIScripting0x43_L129)                                   ;B58DC2
pAIScripting0x43_L179:
    %AICMD0x1C_ShowDialog($037C, $00)                          ;B58DC5
    %AICMD0x12_Jump(pAIScripting0x43_L129)                                   ;B58DC9
pAIScripting0x43_L180:
    %AICMD0x1C_ShowDialog($0196, $00)                          ;B58DCC
    %AICMD0x12_Jump(pAIScripting0x43_L129)                                   ;B58DD0
pAIScripting0x43_L181:
    %AICMD0x1C_ShowDialog($0199, $00)                          ;B58DD3
    %AICMD0x12_Jump(pAIScripting0x43_L129)                                   ;B58DD7
pAIScripting0x43_L182:
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, pAIScripting0x43_L183)     ;B58DDA
    %AICMD0x1C_ShowDialog($0180, $00)                          ;B58DE1
    %AICMD0x1B($022F, $00)                                     ;B58DE5
    %AICMD0x08_EnableAIControl()                               ;B58DE9
    %AICMD0x19($0031, $00)                                     ;B58DEA
    %AICMD0x13_Wait(120)                                       ;B58DEE
    %AICMD0x11_EnableUserControl()                             ;B58DF1
    %AICMD0x57_UpdateStamina(30)                               ;B58DF2
    %AICMD0x12_Jump(pAIScripting0x43_L129)                                   ;B58DF4
pAIScripting0x43_L183:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 10, pAIScripting0x43_L174)         ;B58DF7
    %AICMD0x1C_ShowDialog($0432, $00)                          ;B58DFE
    %AICMD0x1B($022F, $00)                                     ;B58E02
    %AICMD0x08_EnableAIControl()                               ;B58E06
    %AICMD0x19($0032, $00)                                     ;B58E07
    %AICMD0x13_Wait(120)                                       ;B58E0B
    %AICMD0x11_EnableUserControl()                             ;B58E0E
    %AICMD0x57_UpdateStamina(30)                               ;B58E0F
    %AICMD0x12_Jump(pAIScripting0x43_L129)                                   ;B58E11
pAIScripting0x43_L184:
    %AICMD0x1B($02E7, $00)                                     ;B58E14
    %AICMD0x0D($FF, $00, $20, $01)                             ;B58E18
    %AICMD0x1B($02E5, $00)                                     ;B58E1D
    %AICMD0x0D($00, $FF, $14, $01)                             ;B58E21
    %AICMD0x1B($02E7, $00)                                     ;B58E26
    %AICMD0x0D($FF, $00, $10, $01)                             ;B58E2A
    %AICMD0x1B($02F1, $00)                                     ;B58E2F
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily3, $0C)       ;B58E33
    %AICMD0x41_AddValue16(nLove_Nina, 2)                       ;B58E38
    %AICMD0x12_Jump(pAIScripting0x43_L130)                                   ;B58E3E
pAIScripting0x43_L185:
    %AICMD0x1C_ShowDialog($02C2, $00)                          ;B58E41
    %AICMD0x12_Jump(pAIScripting0x43_L130)                                   ;B58E45
pAIScripting0x43_L186:
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily3, $0C)       ;B58E48
    %AICMD0x10_End()                                           ;B58E4D


DATA8_B58E4E:
 
    %AICMD0x14_JumpIfFlagSet($800196, $01, pAIScripting0x43_L187)            ;B58E4E
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, pAIScripting0x43_L187)     ;B58E55
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 11, 14, pAIScripting0x43_L249) ;B58E5C
pAIScripting0x43_L187:
    %AICMD0x15_JumpIfEquals8(nCurrentTimeID, 18, pAIScripting0x43_L189)      ;B58E64
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $07, pAIScripting0x43_L188)   ;B58E6B
    %AICMD0x1A($0058, $0068, aAIScriptingData_L071, $00)                     ;B58E72
    %AICMD0x12_Jump(pAIScripting0x43_L191)                                   ;B58E7A
pAIScripting0x43_L188:
    %AICMD0x1A($0148, $0078, aAIScriptingData_L071, $00)                     ;B58E7D
    %AICMD0x12_Jump(pAIScripting0x43_L191)                                   ;B58E85
pAIScripting0x43_L189:
    %AICMD0x41_AddValue16(nLove_Ellen, -2)                     ;B58E88
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $07, pAIScripting0x43_L190)   ;B58E8E
    %AICMD0x1A($0029, $0053, aAIScriptingData_L072, $00)                     ;B58E95
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily3, $0C)       ;B58E9D
    %AICMD0x12_Jump(pAIScripting0x43_L192)                                   ;B58EA2
pAIScripting0x43_L190:
    %AICMD0x1A($0119, $0063, aAIScriptingData_L072, $00)                     ;B58EA5
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily3, $0C)       ;B58EAD
    %AICMD0x12_Jump(pAIScripting0x43_L192)                                   ;B58EB2
pAIScripting0x43_L191:
    %AICMD0x14_JumpIfFlagSet(strcFlags.daily3, $0B, pAIScripting0x43_L247)   ;B58EB5
    %AICMD0x2D_JumpOnInteract(pAIScripting0x43_L203, pAIScripting0x43_L193)                               ;B58EBC
    %AICMD0x12_Jump(pAIScripting0x43_L191)                                   ;B58EC1
pAIScripting0x43_L192:
    %AICMD0x1F(pAIScripting0x43_L248)                                        ;B58EC4
    %AICMD0x12_Jump(pAIScripting0x43_L192)                                   ;B58EC7
pAIScripting0x43_L193:
    %AICMD0x15_JumpIfEquals8($80091E, 2, pAIScripting0x43_L194)              ;B58ECA
    %AICMD0x16_JumpIfBetween8($80091E, 1, 7, pAIScripting0x43_L195)          ;B58ED1
    %AICMD0x15_JumpIfEquals8($80091E, 25, pAIScripting0x43_L196)             ;B58ED9
    %AICMD0x15_JumpIfEquals8($80091E, 73, pAIScripting0x43_L196)             ;B58EE0
    %AICMD0x15_JumpIfEquals8($80091E, 6, pAIScripting0x43_L199)              ;B58EE7
    %AICMD0x16_JumpIfBetween8($80091E, 16, 19, pAIScripting0x43_L195)        ;B58EEE
    %AICMD0x16_JumpIfBetween8($80091E, 20, 23, pAIScripting0x43_L197)        ;B58EF6
    %AICMD0x16_JumpIfBetween8($80091E, 9, 12, pAIScripting0x43_L198)         ;B58EFE
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B58F06
    %AICMD0x12_Jump(pAIScripting0x43_L191)                                   ;B58F0A
pAIScripting0x43_L194:
    %AICMD0x1C_ShowDialog($01D9, $00)                          ;B58F0D
    %AICMD0x41_AddValue16(nLove_Ellen, -8)                     ;B58F11
    %AICMD0x12_Jump(pAIScripting0x43_L191)                                   ;B58F17
pAIScripting0x43_L195:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $07, pAIScripting0x43_L200)   ;B58F1A
    %AICMD0x1C_ShowDialog($03B2, $00)                          ;B58F21
    %AICMD0x41_AddValue16(nLove_Ellen, 6)                      ;B58F25
    %AICMD0x12_Jump(pAIScripting0x43_L191)                                   ;B58F2B
pAIScripting0x43_L196:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $07, pAIScripting0x43_L200)   ;B58F2E
    %AICMD0x1C_ShowDialog($0212, $00)                          ;B58F35
    %AICMD0x41_AddValue16(nLove_Ellen, 6)                      ;B58F39
    %AICMD0x12_Jump(pAIScripting0x43_L191)                                   ;B58F3F
pAIScripting0x43_L197:
    %AICMD0x1C_ShowDialog($03B3, $00)                          ;B58F42
    %AICMD0x41_AddValue16(nLove_Ellen, 4)                      ;B58F46
    %AICMD0x12_Jump(pAIScripting0x43_L191)                                   ;B58F4C
pAIScripting0x43_L198:
    %AICMD0x1C_ShowDialog($03BA, $00)                          ;B58F4F
    %AICMD0x41_AddValue16(nLove_Ellen, -4)                     ;B58F53
    %AICMD0x12_Jump(pAIScripting0x43_L191)                                   ;B58F59
pAIScripting0x43_L199:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $07, pAIScripting0x43_L200)   ;B58F5C
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $08, pAIScripting0x43_L201)   ;B58F63
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $09, pAIScripting0x43_L202)   ;B58F6A
    %AICMD0x1C_ShowDialog($0212, $00)                          ;B58F71
    %AICMD0x12_Jump(pAIScripting0x43_L191)                                   ;B58F75
pAIScripting0x43_L200:
    %AICMD0x1C_ShowDialog($01BD, $00)                          ;B58F78
    %AICMD0x41_AddValue16(nPlayerHappiness, 30)                ;B58F7C
    %AICMD0x12_Jump(pAIScripting0x43_L191)                                   ;B58F82
pAIScripting0x43_L201:
    %AICMD0x1C_ShowDialog($041D, $00)                          ;B58F85
    %AICMD0x41_AddValue16(nPlayerHappiness, 30)                ;B58F89
    %AICMD0x12_Jump(pAIScripting0x43_L191)                                   ;B58F8F
pAIScripting0x43_L202:
    %AICMD0x1C_ShowDialog($041E, $00)                          ;B58F92
    %AICMD0x41_AddValue16(nPlayerHappiness, 30)                ;B58F96
    %AICMD0x12_Jump(pAIScripting0x43_L191)                                   ;B58F9C
pAIScripting0x43_L203:
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 15, 18, pAIScripting0x43_L245) ;B58F9F
    %AICMD0x43_JumpIfEqual16(nMarriedDaysCounter, 1, pAIScripting0x43_L206)  ;B58FA7
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $04, pAIScripting0x43_L207)   ;B58FAF
    %AICMD0x15_JumpIfEquals8($80098C, 3, pAIScripting0x43_L208)              ;B58FB6
    %AICMD0x14_JumpIfFlagSet($800196, $04, pAIScripting0x43_L209)            ;B58FBD
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $05, pAIScripting0x43_L207)   ;B58FC4
    %AICMD0x43_JumpIfEqual16(nFirstChildAge, 1, pAIScripting0x43_L212)       ;B58FCB
    %AICMD0x43_JumpIfEqual16(nSecondChildAge, 1, pAIScripting0x43_L212)      ;B58FD3
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 2, 19, pAIScripting0x43_L213) ;B58FDB
    %AICMD0x45_JumpIfBetween16(nSecondChildAge, 2, 19, pAIScripting0x43_L213);B58FE5
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 20, 39, pAIScripting0x43_L215);B58FEF
    %AICMD0x45_JumpIfBetween16(nSecondChildAge, 20, 39, pAIScripting0x43_L215);B58FF9
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 40, 59, pAIScripting0x43_L217);B59003
    %AICMD0x45_JumpIfBetween16(nSecondChildAge, 40, 59, pAIScripting0x43_L217);B5900D
    %AICMD0x43_JumpIfEqual16(nFirstChildAge, 90, pAIScripting0x43_L219)      ;B59017
    %AICMD0x43_JumpIfEqual16(nSecondChildAge, 90, pAIScripting0x43_L219)     ;B5901F
    %AICMD0x55_JumpIfFlagNotSet(strcFlags.event1, $07, pAIScripting0x43_L204)                 ;B59027
    %AICMD0x55_JumpIfFlagNotSet(strcFlags.event2, $0A, pAIScripting0x43_L210)                 ;B5902E
    %AICMD0x55_JumpIfFlagNotSet(strcFlags.event2, $0B, pAIScripting0x43_L210)                 ;B59035
    %AICMD0x55_JumpIfFlagNotSet(strcFlags.event2, $0C, pAIScripting0x43_L210)                 ;B5903C
    %AICMD0x55_JumpIfFlagNotSet(strcFlags.event2, $09, pAIScripting0x43_L211)                 ;B59043
pAIScripting0x43_L204:
    %AICMD0x15_JumpIfEquals8(nCurrentWeekdayID, 0, pAIScripting0x43_L226)    ;B5904A
    %AICMD0x15_JumpIfEquals8(nCurrentWeekdayID, 6, pAIScripting0x43_L227)    ;B59051
    %AICMD0x45_JumpIfBetween16(nLove_Ellen, 200, 220, pAIScripting0x43_L224) ;B59058
    %AICMD0x45_JumpIfBetween16(nLove_Ellen, 221, 250, pAIScripting0x43_L225) ;B59062
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 0, pAIScripting0x43_L228)     ;B5906C
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 1, pAIScripting0x43_L230)     ;B59073
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 2, pAIScripting0x43_L233)     ;B5907A
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, pAIScripting0x43_L235)     ;B59081
pAIScripting0x43_L205:
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 60, 89, pAIScripting0x43_L220);B59088
    %AICMD0x45_JumpIfBetween16(nSecondChildAge, 60, 89, pAIScripting0x43_L220);B59092
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 91, 119, pAIScripting0x43_L221);B5909C
    %AICMD0x45_JumpIfBetween16(nSecondChildAge, 91, 119, pAIScripting0x43_L221);B590A6
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 120, 999, pAIScripting0x43_L222);B590B0
    %AICMD0x45_JumpIfBetween16(nSecondChildAge, 120, 999, pAIScripting0x43_L222);B590BA
    %AICMD0x1C_ShowDialog($0485, $00)                          ;B590C4
    %AICMD0x12_Jump(pAIScripting0x43_L191)                                   ;B590C8
pAIScripting0x43_L206:
    %AICMD0x1C_ShowDialog($017D, $00)                          ;B590CB
    %AICMD0x12_Jump(pAIScripting0x43_L191)                                   ;B590CF
pAIScripting0x43_L207:
    %AICMD0x1C_ShowDialog($0166, $00)                          ;B590D2
    %AICMD0x12_Jump(pAIScripting0x43_L191)                                   ;B590D6
pAIScripting0x43_L208:
    %AICMD0x1C_ShowDialog($015F, $00)                          ;B590D9
    %AICMD0x12_Jump(pAIScripting0x43_L191)                                   ;B590DD
pAIScripting0x43_L209:
    %AICMD0x1C_ShowDialog($0160, $00)                          ;B590E0
    %AICMD0x12_Jump(pAIScripting0x43_L191)                                   ;B590E4
pAIScripting0x43_L210:
    %AICMD0x1C_ShowDialog($01A0, $00)                          ;B590E7
    %AICMD0x12_Jump(pAIScripting0x43_L191)                                   ;B590EB
pAIScripting0x43_L211:
    %AICMD0x1C_ShowDialog($0493, $00)                          ;B590EE
    %AICMD0x12_Jump(pAIScripting0x43_L191)                                   ;B590F2
pAIScripting0x43_L212:
    %AICMD0x1C_ShowDialog($01A2, $00)                          ;B590F5
    %AICMD0x12_Jump(pAIScripting0x43_L191)                                   ;B590F9
pAIScripting0x43_L213:
    %AICMD0x17_RollRandom($02)                                            ;B590FC
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x43_L204)                                   ;B590FE
    %AICMD0x18_JumpIfRandomEquals($01, pAIScripting0x43_L214)                                   ;B59102
    %AICMD0x12_Jump(pAIScripting0x43_L191)                                   ;B59106
pAIScripting0x43_L214:
    %AICMD0x1C_ShowDialog($01A3, $00)                          ;B59109
    %AICMD0x12_Jump(pAIScripting0x43_L191)                                   ;B5910D
pAIScripting0x43_L215:
    %AICMD0x17_RollRandom($02)                                            ;B59110
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x43_L204)                                   ;B59112
    %AICMD0x18_JumpIfRandomEquals($01, pAIScripting0x43_L216)                                   ;B59116
    %AICMD0x12_Jump(pAIScripting0x43_L191)                                   ;B5911A
pAIScripting0x43_L216:
    %AICMD0x1C_ShowDialog($01A4, $00)                          ;B5911D
    %AICMD0x12_Jump(pAIScripting0x43_L191)                                   ;B59121
pAIScripting0x43_L217:
    %AICMD0x17_RollRandom($02)                                            ;B59124
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x43_L204)                                   ;B59126
    %AICMD0x18_JumpIfRandomEquals($01, pAIScripting0x43_L218)                                   ;B5912A
    %AICMD0x12_Jump(pAIScripting0x43_L191)                                   ;B5912E
pAIScripting0x43_L218:
    %AICMD0x1C_ShowDialog($01A5, $00)                          ;B59131
    %AICMD0x12_Jump(pAIScripting0x43_L191)                                   ;B59135
pAIScripting0x43_L219:
    %AICMD0x1C_ShowDialog($0481, $00)                          ;B59138
    %AICMD0x12_Jump(pAIScripting0x43_L191)                                   ;B5913C
pAIScripting0x43_L220:
    %AICMD0x1C_ShowDialog($0480, $00)                          ;B5913F
    %AICMD0x12_Jump(pAIScripting0x43_L191)                                   ;B59143
pAIScripting0x43_L221:
    %AICMD0x1C_ShowDialog($0484, $00)                          ;B59146
    %AICMD0x12_Jump(pAIScripting0x43_L191)                                   ;B5914A
pAIScripting0x43_L222:
    %AICMD0x17_RollRandom($02)                                            ;B5914D
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x43_L223)                                   ;B5914F
    %AICMD0x1C_ShowDialog($0482, $00)                          ;B59153
    %AICMD0x12_Jump(pAIScripting0x43_L191)                                   ;B59157
pAIScripting0x43_L223:
    %AICMD0x1C_ShowDialog($0443, $00)                          ;B5915A
    %AICMD0x12_Jump(pAIScripting0x43_L191)                                   ;B5915E
pAIScripting0x43_L224:
    %AICMD0x1C_ShowDialog($01F3, $00)                          ;B59161
    %AICMD0x12_Jump(pAIScripting0x43_L191)                                   ;B59165
pAIScripting0x43_L225:
    %AICMD0x1C_ShowDialog($0049, $00)                          ;B59168
    %AICMD0x12_Jump(pAIScripting0x43_L191)                                   ;B5916C
pAIScripting0x43_L226:
    %AICMD0x14_JumpIfFlagSet($800196, $01, pAIScripting0x43_L243)            ;B5916F
    %AICMD0x14_JumpIfFlagSet($800196, $03, pAIScripting0x43_L243)            ;B59176
    %AICMD0x1C_ShowDialog($0194, $00)                          ;B5917D
    %AICMD0x12_Jump(pAIScripting0x43_L191)                                   ;B59181
pAIScripting0x43_L227:
    %AICMD0x1C_ShowDialog($047D, $00)                          ;B59184
    %AICMD0x12_Jump(pAIScripting0x43_L191)                                   ;B59188
pAIScripting0x43_L228:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 22, pAIScripting0x43_L229)         ;B5918B
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 23, pAIScripting0x43_L241)         ;B59192
    %AICMD0x14_JumpIfFlagSet($800196, $01, pAIScripting0x43_L242)            ;B59199
    %AICMD0x17_RollRandom($02)                                            ;B591A0
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x43_L205)                                   ;B591A2
    %AICMD0x1C_ShowDialog($018C, $00)                          ;B591A6
    %AICMD0x12_Jump(pAIScripting0x43_L191)                                   ;B591AA
pAIScripting0x43_L229:
    %AICMD0x1C_ShowDialog($0209, $00)                          ;B591AD
    %AICMD0x12_Jump(pAIScripting0x43_L191)                                   ;B591B1
pAIScripting0x43_L230:
    %AICMD0x14_JumpIfFlagSet($800196, $01, pAIScripting0x43_L242)            ;B591B4
    %AICMD0x17_RollRandom($04)                                            ;B591BB
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x43_L231)                                   ;B591BD
    %AICMD0x18_JumpIfRandomEquals($01, pAIScripting0x43_L232)                                   ;B591C1
    %AICMD0x18_JumpIfRandomEquals($02, pAIScripting0x43_L205)                                   ;B591C5
    %AICMD0x1C_ShowDialog($018D, $00)                          ;B591C9
    %AICMD0x12_Jump(pAIScripting0x43_L191)                                   ;B591CD
pAIScripting0x43_L231:
    %AICMD0x1C_ShowDialog($0426, $00)                          ;B591D0
    %AICMD0x12_Jump(pAIScripting0x43_L191)                                   ;B591D4
pAIScripting0x43_L232:
    %AICMD0x1C_ShowDialog($0420, $00)                          ;B591D7
    %AICMD0x12_Jump(pAIScripting0x43_L191)                                   ;B591DB
pAIScripting0x43_L233:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 11, pAIScripting0x43_L234)         ;B591DE
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 12, pAIScripting0x43_L241)         ;B591E5
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 20, pAIScripting0x43_L241)         ;B591EC
    %AICMD0x14_JumpIfFlagSet($800196, $01, pAIScripting0x43_L242)            ;B591F3
    %AICMD0x17_RollRandom($02)                                            ;B591FA
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x43_L205)                                   ;B591FC
    %AICMD0x1C_ShowDialog($0192, $00)                          ;B59200
    %AICMD0x12_Jump(pAIScripting0x43_L191)                                   ;B59204
pAIScripting0x43_L234:
    %AICMD0x1C_ShowDialog($023B, $00)                          ;B59207
    %AICMD0x12_Jump(pAIScripting0x43_L191)                                   ;B5920B
pAIScripting0x43_L235:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 10, pAIScripting0x43_L237)         ;B5920E
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 23, pAIScripting0x43_L239)         ;B59215
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 30, pAIScripting0x43_L240)         ;B5921C
    %AICMD0x14_JumpIfFlagSet($800196, $03, pAIScripting0x43_L244)            ;B59223
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 15, 17, pAIScripting0x43_L245) ;B5922A
    %AICMD0x17_RollRandom($02)                                            ;B59232
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x43_L205)                                   ;B59234
    %AICMD0x1C_ShowDialog($042F, $00)                          ;B59238
    %AICMD0x12_Jump(pAIScripting0x43_L191)                                   ;B5923C
pAIScripting0x43_L236:
    %AICMD0x14_JumpIfFlagSet(strcFlags.daily3, $0B, pAIScripting0x43_L247)   ;B5923F
    %AICMD0x1F(pAIScripting0x43_L237)                                        ;B59246
    %AICMD0x12_Jump(pAIScripting0x43_L236)                                   ;B59249
pAIScripting0x43_L237:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $05, pAIScripting0x43_L238) ;B5924C
    %AICMD0x1C_ShowDialog($0292, $00)                          ;B59253
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown1, $05)     ;B59257
    %AICMD0x08_EnableAIControl()                               ;B5925C
    %AICMD0x19($0039, $00)                                     ;B5925D
    %AICMD0x13_Wait(120)                                       ;B59261
    %AICMD0x11_EnableUserControl()                             ;B59264
    %AICMD0x41_AddValue16(nPlayerHappiness, 30)                ;B59265
    %AICMD0x12_Jump(pAIScripting0x43_L236)                                   ;B5926B
pAIScripting0x43_L238:
    %AICMD0x1C_ShowDialog($0293, $00)                          ;B5926E
    %AICMD0x12_Jump(pAIScripting0x43_L236)                                   ;B59272
pAIScripting0x43_L239:
    %AICMD0x1C_ShowDialog($02B4, $00)                          ;B59275
    %AICMD0x12_Jump(pAIScripting0x43_L191)                                   ;B59279
pAIScripting0x43_L240:
    %AICMD0x1C_ShowDialog($03FB, $00)                          ;B5927C
    %AICMD0x12_Jump(pAIScripting0x43_L191)                                   ;B59280
pAIScripting0x43_L241:
    %AICMD0x1C_ShowDialog($0363, $00)                          ;B59283
    %AICMD0x12_Jump(pAIScripting0x43_L191)                                   ;B59287
pAIScripting0x43_L242:
    %AICMD0x1C_ShowDialog($0197, $00)                          ;B5928A
    %AICMD0x12_Jump(pAIScripting0x43_L191)                                   ;B5928E
pAIScripting0x43_L243:
    %AICMD0x1C_ShowDialog($047C, $00)                          ;B59291
    %AICMD0x12_Jump(pAIScripting0x43_L191)                                   ;B59295
pAIScripting0x43_L244:
    %AICMD0x1C_ShowDialog($0199, $00)                          ;B59298
    %AICMD0x12_Jump(pAIScripting0x43_L191)                                   ;B5929C
pAIScripting0x43_L245:
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, pAIScripting0x43_L246)     ;B5929F
    %AICMD0x1B($022F, $00)                                     ;B592A6
    %AICMD0x08_EnableAIControl()                               ;B592AA
    %AICMD0x19($0039, $00)                                     ;B592AB
    %AICMD0x13_Wait(120)                                       ;B592AF
    %AICMD0x11_EnableUserControl()                             ;B592B2
    %AICMD0x57_UpdateStamina(30)                               ;B592B3
    %AICMD0x1C_ShowDialog($0180, $00)                          ;B592B5
    %AICMD0x12_Jump(pAIScripting0x43_L191)                                   ;B592B9
pAIScripting0x43_L246:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 10, pAIScripting0x43_L237)         ;B592BC
    %AICMD0x1C_ShowDialog($042E, $00)                          ;B592C3
    %AICMD0x1B($022F, $00)                                     ;B592C7
    %AICMD0x08_EnableAIControl()                               ;B592CB
    %AICMD0x19($0030, $00)                                     ;B592CC
    %AICMD0x13_Wait(120)                                       ;B592D0
    %AICMD0x11_EnableUserControl()                             ;B592D3
    %AICMD0x57_UpdateStamina(30)                               ;B592D4
    %AICMD0x12_Jump(pAIScripting0x43_L191)                                   ;B592D6
pAIScripting0x43_L247:
    %AICMD0x1B($02E7, $00)                                     ;B592D9
    %AICMD0x0D($FF, $00, $20, $01)                             ;B592DD
    %AICMD0x1B($02E5, $00)                                     ;B592E2
    %AICMD0x0D($00, $FF, $14, $01)                             ;B592E6
    %AICMD0x1B($02E7, $00)                                     ;B592EB
    %AICMD0x0D($FF, $00, $10, $01)                             ;B592EF
    %AICMD0x1B($02F1, $00)                                     ;B592F4
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily3, $0C)       ;B592F8
    %AICMD0x41_AddValue16(nLove_Ellen, 2)                      ;B592FD
    %AICMD0x12_Jump(pAIScripting0x43_L192)                                   ;B59303
pAIScripting0x43_L248:
    %AICMD0x1C_ShowDialog($02C2, $00)                          ;B59306
    %AICMD0x12_Jump(pAIScripting0x43_L192)                                   ;B5930A
pAIScripting0x43_L249:
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily3, $0C)       ;B5930D
    %AICMD0x10_End()                                           ;B59312


DATA8_B59313:
    %AICMD0x14_JumpIfFlagSet($800196, $01, pAIScripting0x43_L250)            ;B59313
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, pAIScripting0x43_L250)     ;B5931A
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 11, 14, pAIScripting0x43_L311) ;B59321
pAIScripting0x43_L250:
    %AICMD0x15_JumpIfEquals8(nCurrentTimeID, 18, pAIScripting0x43_L252)      ;B59329
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $07, pAIScripting0x43_L251)   ;B59330
    %AICMD0x1A($0058, $0068, aAIScriptingData_L071, $00)                     ;B59337
    %AICMD0x12_Jump(pAIScripting0x43_L254)                                   ;B5933F
pAIScripting0x43_L251:
    %AICMD0x1A($0148, $0078, aAIScriptingData_L071, $00)                     ;B59342
    %AICMD0x12_Jump(pAIScripting0x43_L254)                                   ;B5934A
pAIScripting0x43_L252:
    %AICMD0x41_AddValue16(nLove_Eve, -2)                       ;B5934D
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $07, pAIScripting0x43_L253)   ;B59353
    %AICMD0x1A($0029, $0053, aAIScriptingData_L072, $00)                     ;B5935A
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily3, $0C)       ;B59362
    %AICMD0x12_Jump(pAIScripting0x43_L255)                                   ;B59367
pAIScripting0x43_L253:
    %AICMD0x1A($0119, $0063, aAIScriptingData_L072, $00)                     ;B5936A
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily3, $0C)       ;B59372
    %AICMD0x12_Jump(pAIScripting0x43_L255)                                   ;B59377
pAIScripting0x43_L254:
    %AICMD0x14_JumpIfFlagSet(strcFlags.daily3, $0B, pAIScripting0x43_L309)   ;B5937A
    %AICMD0x2D_JumpOnInteract(pAIScripting0x43_L265, pAIScripting0x43_L256)                               ;B59381
    %AICMD0x12_Jump(pAIScripting0x43_L254)                                   ;B59386
pAIScripting0x43_L255:
    %AICMD0x1F(pAIScripting0x43_L310)                                        ;B59389
    %AICMD0x12_Jump(pAIScripting0x43_L255)                                   ;B5938C
pAIScripting0x43_L256:
    %AICMD0x15_JumpIfEquals8($80091E, 2, pAIScripting0x43_L257)              ;B5938F
    %AICMD0x15_JumpIfEquals8($80091E, 7, pAIScripting0x43_L257)              ;B59396
    %AICMD0x16_JumpIfBetween8($80091E, 1, 5, pAIScripting0x43_L258)          ;B5939D
    %AICMD0x16_JumpIfBetween8($80091E, 16, 23, pAIScripting0x43_L258)        ;B593A5
    %AICMD0x15_JumpIfEquals8($80091E, 6, pAIScripting0x43_L259)              ;B593AD
    %AICMD0x15_JumpIfEquals8($80091E, 25, pAIScripting0x43_L260)             ;B593B4
    %AICMD0x15_JumpIfEquals8($80091E, 73, pAIScripting0x43_L260)             ;B593BB
    %AICMD0x16_JumpIfBetween8($80091E, 9, 12, pAIScripting0x43_L261)         ;B593C2
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B593CA
    %AICMD0x12_Jump(pAIScripting0x43_L254)                                   ;B593CE
pAIScripting0x43_L257:
    %AICMD0x1C_ShowDialog($03B4, $00)                          ;B593D1
    %AICMD0x41_AddValue16(nLove_Eve, -8)                       ;B593D5
    %AICMD0x12_Jump(pAIScripting0x43_L254)                                   ;B593DB
pAIScripting0x43_L258:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $07, pAIScripting0x43_L262)   ;B593DE
    %AICMD0x1C_ShowDialog($03B2, $00)                          ;B593E5
    %AICMD0x41_AddValue16(nLove_Eve, 4)                        ;B593E9
    %AICMD0x12_Jump(pAIScripting0x43_L254)                                   ;B593EF
pAIScripting0x43_L259:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $07, pAIScripting0x43_L262)   ;B593F2
    %AICMD0x1C_ShowDialog($0212, $00)                          ;B593F9
    %AICMD0x41_AddValue16(nLove_Eve, 8)                        ;B593FD
    %AICMD0x12_Jump(pAIScripting0x43_L254)                                   ;B59403
pAIScripting0x43_L260:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $07, pAIScripting0x43_L262)   ;B59406
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $08, pAIScripting0x43_L263)   ;B5940D
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $09, pAIScripting0x43_L264)   ;B59414
    %AICMD0x41_AddValue16(nLove_Eve, 8)                        ;B5941B
    %AICMD0x1C_ShowDialog($0212, $00)                          ;B59421
    %AICMD0x12_Jump(pAIScripting0x43_L254)                                   ;B59425
pAIScripting0x43_L261:
    %AICMD0x1C_ShowDialog($03BA, $00)                          ;B59428
    %AICMD0x41_AddValue16(nLove_Eve, -5)                       ;B5942C
    %AICMD0x12_Jump(pAIScripting0x43_L254)                                   ;B59432
pAIScripting0x43_L262:
    %AICMD0x1C_ShowDialog($01BD, $00)                          ;B59435
    %AICMD0x41_AddValue16(nPlayerHappiness, 30)                ;B59439
    %AICMD0x12_Jump(pAIScripting0x43_L254)                                   ;B5943F
pAIScripting0x43_L263:
    %AICMD0x1C_ShowDialog($041D, $00)                          ;B59442
    %AICMD0x41_AddValue16(nPlayerHappiness, 30)                ;B59446
    %AICMD0x12_Jump(pAIScripting0x43_L254)                                   ;B5944C
pAIScripting0x43_L264:
    %AICMD0x1C_ShowDialog($041E, $00)                          ;B5944F
    %AICMD0x41_AddValue16(nPlayerHappiness, 30)                ;B59453
    %AICMD0x12_Jump(pAIScripting0x43_L254)                                   ;B59459
pAIScripting0x43_L265:
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 15, 18, pAIScripting0x43_L307) ;B5945C
    %AICMD0x43_JumpIfEqual16(nMarriedDaysCounter, 1, pAIScripting0x43_L268)  ;B59464
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $04, pAIScripting0x43_L269)   ;B5946C
    %AICMD0x15_JumpIfEquals8($80098C, 3, pAIScripting0x43_L270)              ;B59473
    %AICMD0x14_JumpIfFlagSet($800196, $04, pAIScripting0x43_L271)            ;B5947A
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $05, pAIScripting0x43_L269)   ;B59481
    %AICMD0x43_JumpIfEqual16(nFirstChildAge, 1, pAIScripting0x43_L274)       ;B59488
    %AICMD0x43_JumpIfEqual16(nSecondChildAge, 1, pAIScripting0x43_L274)      ;B59490
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 2, 19, pAIScripting0x43_L275) ;B59498
    %AICMD0x45_JumpIfBetween16(nSecondChildAge, 2, 19, pAIScripting0x43_L275);B594A2
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 20, 39, pAIScripting0x43_L277);B594AC
    %AICMD0x45_JumpIfBetween16(nSecondChildAge, 20, 39, pAIScripting0x43_L277);B594B6
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 40, 59, pAIScripting0x43_L279);B594C0
    %AICMD0x45_JumpIfBetween16(nSecondChildAge, 40, 59, pAIScripting0x43_L279);B594CA
    %AICMD0x43_JumpIfEqual16(nFirstChildAge, 90, pAIScripting0x43_L281)      ;B594D4
    %AICMD0x43_JumpIfEqual16(nSecondChildAge, 90, pAIScripting0x43_L281)     ;B594DC
    %AICMD0x55_JumpIfFlagNotSet(strcFlags.event1, $07, pAIScripting0x43_L266)                 ;B594E4
    %AICMD0x55_JumpIfFlagNotSet(strcFlags.event2, $0A, pAIScripting0x43_L272)                 ;B594EB
    %AICMD0x55_JumpIfFlagNotSet(strcFlags.event2, $0B, pAIScripting0x43_L272)                 ;B594F2
    %AICMD0x55_JumpIfFlagNotSet(strcFlags.event2, $0C, pAIScripting0x43_L272)                 ;B594F9
    %AICMD0x55_JumpIfFlagNotSet(strcFlags.event2, $09, pAIScripting0x43_L273)                 ;B59500
pAIScripting0x43_L266:
    %AICMD0x15_JumpIfEquals8(nCurrentWeekdayID, 0, pAIScripting0x43_L288)    ;B59507
    %AICMD0x15_JumpIfEquals8(nCurrentWeekdayID, 6, pAIScripting0x43_L289)    ;B5950E
    %AICMD0x45_JumpIfBetween16(nLove_Eve, 200, 220, pAIScripting0x43_L286)   ;B59515
    %AICMD0x45_JumpIfBetween16(nLove_Eve, 221, 250, pAIScripting0x43_L287)   ;B5951F
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 0, pAIScripting0x43_L290)     ;B59529
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 1, pAIScripting0x43_L292)     ;B59530
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 2, pAIScripting0x43_L295)     ;B59537
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, pAIScripting0x43_L297)     ;B5953E
pAIScripting0x43_L267:
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 60, 89, pAIScripting0x43_L282);B59545
    %AICMD0x45_JumpIfBetween16(nSecondChildAge, 60, 89, pAIScripting0x43_L282);B5954F
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 91, 119, pAIScripting0x43_L283);B59559
    %AICMD0x45_JumpIfBetween16(nSecondChildAge, 91, 119, pAIScripting0x43_L283);B59563
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 120, 999, pAIScripting0x43_L284);B5956D
    %AICMD0x45_JumpIfBetween16(nSecondChildAge, 120, 999, pAIScripting0x43_L284);B59577
    %AICMD0x1C_ShowDialog($0485, $00)                          ;B59581
    %AICMD0x12_Jump(pAIScripting0x43_L254)                                   ;B59585
pAIScripting0x43_L268:
    %AICMD0x1C_ShowDialog($017D, $00)                          ;B59588
    %AICMD0x12_Jump(pAIScripting0x43_L254)                                   ;B5958C
pAIScripting0x43_L269:
    %AICMD0x1C_ShowDialog($0166, $00)                          ;B5958F
    %AICMD0x12_Jump(pAIScripting0x43_L254)                                   ;B59593
pAIScripting0x43_L270:
    %AICMD0x1C_ShowDialog($015F, $00)                          ;B59596
    %AICMD0x12_Jump(pAIScripting0x43_L254)                                   ;B5959A
pAIScripting0x43_L271:
    %AICMD0x1C_ShowDialog($0160, $00)                          ;B5959D
    %AICMD0x12_Jump(pAIScripting0x43_L254)                                   ;B595A1
pAIScripting0x43_L272:
    %AICMD0x1C_ShowDialog($01A0, $00)                          ;B595A4
    %AICMD0x12_Jump(pAIScripting0x43_L254)                                   ;B595A8
pAIScripting0x43_L273:
    %AICMD0x1C_ShowDialog($0493, $00)                          ;B595AB
    %AICMD0x12_Jump(pAIScripting0x43_L254)                                   ;B595AF
pAIScripting0x43_L274:
    %AICMD0x1C_ShowDialog($01A2, $00)                          ;B595B2
    %AICMD0x12_Jump(pAIScripting0x43_L254)                                   ;B595B6
pAIScripting0x43_L275:
    %AICMD0x17_RollRandom($02)                                            ;B595B9
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x43_L266)                                   ;B595BB
    %AICMD0x18_JumpIfRandomEquals($01, pAIScripting0x43_L276)                                   ;B595BF
    %AICMD0x12_Jump(pAIScripting0x43_L254)                                   ;B595C3
pAIScripting0x43_L276:
    %AICMD0x1C_ShowDialog($01A4, $00)                          ;B595C6
    %AICMD0x12_Jump(pAIScripting0x43_L254)                                   ;B595CA
pAIScripting0x43_L277:
    %AICMD0x17_RollRandom($02)                                            ;B595CD
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x43_L266)                                   ;B595CF
    %AICMD0x18_JumpIfRandomEquals($01, pAIScripting0x43_L278)                                   ;B595D3
    %AICMD0x12_Jump(pAIScripting0x43_L254)                                   ;B595D7
pAIScripting0x43_L278:
    %AICMD0x1C_ShowDialog($01A5, $00)                          ;B595DA
    %AICMD0x12_Jump(pAIScripting0x43_L254)                                   ;B595DE
pAIScripting0x43_L279:
    %AICMD0x17_RollRandom($02)                                            ;B595E1
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x43_L266)                                   ;B595E3
    %AICMD0x18_JumpIfRandomEquals($01, pAIScripting0x43_L280)                                   ;B595E7
pAIScripting0x43_L280:
    %AICMD0x1C_ShowDialog($01A7, $00)                          ;B595EB
    %AICMD0x12_Jump(pAIScripting0x43_L254)                                   ;B595EF
pAIScripting0x43_L281:
    %AICMD0x1C_ShowDialog($0481, $00)                          ;B595F2
    %AICMD0x12_Jump(pAIScripting0x43_L254)                                   ;B595F6
pAIScripting0x43_L282:
    %AICMD0x1C_ShowDialog($0480, $00)                          ;B595F9
    %AICMD0x12_Jump(pAIScripting0x43_L254)                                   ;B595FD
pAIScripting0x43_L283:
    %AICMD0x1C_ShowDialog($0484, $00)                          ;B59600
    %AICMD0x12_Jump(pAIScripting0x43_L254)                                   ;B59604
pAIScripting0x43_L284:
    %AICMD0x17_RollRandom($02)                                            ;B59607
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x43_L285)                                   ;B59609
    %AICMD0x1C_ShowDialog($0482, $00)                          ;B5960D
    %AICMD0x12_Jump(pAIScripting0x43_L254)                                   ;B59611
pAIScripting0x43_L285:
    %AICMD0x1C_ShowDialog($0443, $00)                          ;B59614
    %AICMD0x12_Jump(pAIScripting0x43_L254)                                   ;B59618
pAIScripting0x43_L286:
    %AICMD0x1C_ShowDialog($01F4, $00)                          ;B5961B
    %AICMD0x12_Jump(pAIScripting0x43_L254)                                   ;B5961F
pAIScripting0x43_L287:
    %AICMD0x1C_ShowDialog($0049, $00)                          ;B59622
    %AICMD0x12_Jump(pAIScripting0x43_L254)                                   ;B59626
pAIScripting0x43_L288:
    %AICMD0x14_JumpIfFlagSet($800196, $01, pAIScripting0x43_L305)            ;B59629
    %AICMD0x14_JumpIfFlagSet($800196, $03, pAIScripting0x43_L305)            ;B59630
    %AICMD0x1C_ShowDialog($0195, $00)                          ;B59637
    %AICMD0x12_Jump(pAIScripting0x43_L254)                                   ;B5963B
pAIScripting0x43_L289:
    %AICMD0x1C_ShowDialog($047D, $00)                          ;B5963E
    %AICMD0x12_Jump(pAIScripting0x43_L254)                                   ;B59642
pAIScripting0x43_L290:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 22, pAIScripting0x43_L291)         ;B59645
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 23, pAIScripting0x43_L303)         ;B5964C
    %AICMD0x14_JumpIfFlagSet($800196, $01, pAIScripting0x43_L304)            ;B59653
    %AICMD0x17_RollRandom($02)                                            ;B5965A
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x43_L267)                                   ;B5965C
    %AICMD0x1C_ShowDialog($018F, $00)                          ;B59660
    %AICMD0x12_Jump(pAIScripting0x43_L254)                                   ;B59664
pAIScripting0x43_L291:
    %AICMD0x1C_ShowDialog($020A, $00)                          ;B59667
    %AICMD0x12_Jump(pAIScripting0x43_L254)                                   ;B5966B
pAIScripting0x43_L292:
    %AICMD0x14_JumpIfFlagSet($800196, $01, pAIScripting0x43_L304)            ;B5966E
    %AICMD0x17_RollRandom($04)                                            ;B59675
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x43_L293)                                   ;B59677
    %AICMD0x18_JumpIfRandomEquals($01, pAIScripting0x43_L294)                                   ;B5967B
    %AICMD0x18_JumpIfRandomEquals($02, pAIScripting0x43_L267)                                   ;B5967F
    %AICMD0x1C_ShowDialog($0190, $00)                          ;B59683
    %AICMD0x12_Jump(pAIScripting0x43_L254)                                   ;B59687
pAIScripting0x43_L293:
    %AICMD0x1C_ShowDialog($0426, $00)                          ;B5968A
    %AICMD0x12_Jump(pAIScripting0x43_L254)                                   ;B5968E
pAIScripting0x43_L294:
    %AICMD0x1C_ShowDialog($0420, $00)                          ;B59691
    %AICMD0x12_Jump(pAIScripting0x43_L254)                                   ;B59695
pAIScripting0x43_L295:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 11, pAIScripting0x43_L296)         ;B59698
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 12, pAIScripting0x43_L303)         ;B5969F
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 20, pAIScripting0x43_L303)         ;B596A6
    %AICMD0x14_JumpIfFlagSet($800196, $01, pAIScripting0x43_L304)            ;B596AD
    %AICMD0x17_RollRandom($02)                                            ;B596B4
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x43_L267)                                   ;B596B6
    %AICMD0x1C_ShowDialog($0191, $00)                          ;B596BA
    %AICMD0x12_Jump(pAIScripting0x43_L254)                                   ;B596BE
pAIScripting0x43_L296:
    %AICMD0x1C_ShowDialog($020A, $00)                          ;B596C1
    %AICMD0x12_Jump(pAIScripting0x43_L254)                                   ;B596C5
pAIScripting0x43_L297:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 10, pAIScripting0x43_L299)         ;B596C8
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 23, pAIScripting0x43_L301)         ;B596CF
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 30, pAIScripting0x43_L302)         ;B596D6
    %AICMD0x14_JumpIfFlagSet($800196, $03, pAIScripting0x43_L306)            ;B596DD
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 15, 17, pAIScripting0x43_L307) ;B596E4
    %AICMD0x17_RollRandom($02)                                            ;B596EC
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x43_L267)                                   ;B596EE
    %AICMD0x1C_ShowDialog($0430, $00)                          ;B596F2
    %AICMD0x12_Jump(pAIScripting0x43_L254)                                   ;B596F6
pAIScripting0x43_L298:
    %AICMD0x14_JumpIfFlagSet(strcFlags.daily3, $0B, pAIScripting0x43_L309)   ;B596F9
    %AICMD0x1F(pAIScripting0x43_L299)                                        ;B59700
    %AICMD0x12_Jump(pAIScripting0x43_L298)                                   ;B59703
pAIScripting0x43_L299:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $05, pAIScripting0x43_L300) ;B59706
    %AICMD0x1C_ShowDialog($0292, $00)                          ;B5970D
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown1, $05)     ;B59711
    %AICMD0x08_EnableAIControl()                               ;B59716
    %AICMD0x19($0039, $00)                                     ;B59717
    %AICMD0x13_Wait(120)                                       ;B5971B
    %AICMD0x11_EnableUserControl()                             ;B5971E
    %AICMD0x41_AddValue16(nPlayerHappiness, 30)                ;B5971F
    %AICMD0x12_Jump(pAIScripting0x43_L298)                                   ;B59725
pAIScripting0x43_L300:
    %AICMD0x1C_ShowDialog($0293, $00)                          ;B59728
    %AICMD0x12_Jump(pAIScripting0x43_L298)                                   ;B5972C
pAIScripting0x43_L301:
    %AICMD0x1C_ShowDialog($02B4, $00)                          ;B5972F
    %AICMD0x12_Jump(pAIScripting0x43_L254)                                   ;B59733
pAIScripting0x43_L302:
    %AICMD0x1C_ShowDialog($0144, $00)                          ;B59736
    %AICMD0x12_Jump(pAIScripting0x43_L254)                                   ;B5973A
pAIScripting0x43_L303:
    %AICMD0x1C_ShowDialog($0361, $00)                          ;B5973D
    %AICMD0x12_Jump(pAIScripting0x43_L254)                                   ;B59741
pAIScripting0x43_L304:
    %AICMD0x1C_ShowDialog($0196, $00)                          ;B59744
    %AICMD0x12_Jump(pAIScripting0x43_L254)                                   ;B59748
pAIScripting0x43_L305:
    %AICMD0x1C_ShowDialog($047C, $00)                          ;B5974B
    %AICMD0x12_Jump(pAIScripting0x43_L254)                                   ;B5974F
pAIScripting0x43_L306:
    %AICMD0x1C_ShowDialog($0198, $00)                          ;B59752
    %AICMD0x12_Jump(pAIScripting0x43_L254)                                   ;B59756
pAIScripting0x43_L307:
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, pAIScripting0x43_L308)     ;B59759
    %AICMD0x1C_ShowDialog($0180, $00)                          ;B59760
    %AICMD0x1B($022F, $00)                                     ;B59764
    %AICMD0x08_EnableAIControl()                               ;B59768
    %AICMD0x32_SetValue16($8000D4, $0015)                                 ;B59769
    %AICMD0x13_Wait(120)                                       ;B5976F
    %AICMD0x11_EnableUserControl()                             ;B59772
    %AICMD0x57_UpdateStamina(30)                               ;B59773
    %AICMD0x12_Jump(pAIScripting0x43_L254)                                   ;B59775
pAIScripting0x43_L308:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 10, pAIScripting0x43_L299)         ;B59778
    %AICMD0x1C_ShowDialog($042F, $00)                          ;B5977F
    %AICMD0x1B($022F, $00)                                     ;B59783
    %AICMD0x08_EnableAIControl()                               ;B59787
    %AICMD0x32_SetValue16($8000D4, $0015)                                 ;B59788
    %AICMD0x13_Wait(120)                                       ;B5978E
    %AICMD0x11_EnableUserControl()                             ;B59791
    %AICMD0x57_UpdateStamina(30)                               ;B59792
    %AICMD0x12_Jump(pAIScripting0x43_L254)                                   ;B59794
pAIScripting0x43_L309:
    %AICMD0x1B($02E7, $00)                                     ;B59797
    %AICMD0x0D($FF, $00, $20, $01)                             ;B5979B
    %AICMD0x1B($02E5, $00)                                     ;B597A0
    %AICMD0x0D($00, $FF, $14, $01)                             ;B597A4
    %AICMD0x1B($02E7, $00)                                     ;B597A9
    %AICMD0x0D($FF, $00, $10, $01)                             ;B597AD
    %AICMD0x1B($02F1, $00)                                     ;B597B2
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily3, $0C)       ;B597B6
    %AICMD0x41_AddValue16(nLove_Eve, -2)                       ;B597BB
    %AICMD0x12_Jump(pAIScripting0x43_L255)                                   ;B597C1
pAIScripting0x43_L310:
    %AICMD0x1C_ShowDialog($02C2, $00)                          ;B597C4
    %AICMD0x12_Jump(pAIScripting0x43_L255)                                   ;B597C8
pAIScripting0x43_L311:
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily3, $0C)       ;B597CB
    %AICMD0x10_End()                                           ;B597D0
