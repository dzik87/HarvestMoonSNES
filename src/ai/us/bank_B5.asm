 
    ORG $B58000
 
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
    %AICMD0x2D(pAIScripting0x43_L016, pAIScripting0x43_L007)                               ;B5808E
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
    %AICMD0x55(strcFlags.event1, $07, pAIScripting0x43_L017)                 ;B581F1
    %AICMD0x55(strcFlags.event2, $0A, pAIScripting0x43_L023)                 ;B581F8
    %AICMD0x55(strcFlags.event2, $0B, pAIScripting0x43_L023)                 ;B581FF
    %AICMD0x55(strcFlags.event2, $0C, pAIScripting0x43_L023)                 ;B58206
    %AICMD0x55(strcFlags.event2, $09, pAIScripting0x43_L024)                 ;B5820D
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
    %AICMD0x17($02)                                            ;B582C6
    %AICMD0x18($00, pAIScripting0x43_L017)                                   ;B582C8
    %AICMD0x18($01, pAIScripting0x43_L027)                                   ;B582CC
    %AICMD0x12_Jump(pAIScripting0x43_L005)                                   ;B582D0
pAIScripting0x43_L027:
    %AICMD0x1C_ShowDialog($01A3, $00)                          ;B582D3
    %AICMD0x12_Jump(pAIScripting0x43_L005)                                   ;B582D7
pAIScripting0x43_L028:
    %AICMD0x17($02)                                            ;B582DA
    %AICMD0x18($00, pAIScripting0x43_L017)                                   ;B582DC
    %AICMD0x18($01, pAIScripting0x43_L029)                                   ;B582E0
    %AICMD0x12_Jump(pAIScripting0x43_L005)                                   ;B582E4
pAIScripting0x43_L029:
    %AICMD0x1C_ShowDialog($01A4, $00)                          ;B582E7
    %AICMD0x12_Jump(pAIScripting0x43_L005)                                   ;B582EB
pAIScripting0x43_L030:
    %AICMD0x17($02)                                            ;B582EE
    %AICMD0x18($00, pAIScripting0x43_L017)                                   ;B582F0
    %AICMD0x18($01, pAIScripting0x43_L031)                                   ;B582F4
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
    %AICMD0x17($02)                                            ;B58314
    %AICMD0x18($00, pAIScripting0x43_L036)                                   ;B58316
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
    %AICMD0x17($02)                                            ;B58367
    %AICMD0x18($00, pAIScripting0x43_L018)                                   ;B58369
    %AICMD0x1C_ShowDialog($0182, $00)                          ;B5836D
    %AICMD0x12_Jump(pAIScripting0x43_L005)                                   ;B58371
pAIScripting0x43_L042:
    %AICMD0x1C_ShowDialog($0206, $00)                          ;B58374
    %AICMD0x12_Jump(pAIScripting0x43_L005)                                   ;B58378
pAIScripting0x43_L043:
    %AICMD0x14_JumpIfFlagSet($800196, $01, pAIScripting0x43_L055)            ;B5837B
    %AICMD0x17($04)                                            ;B58382
    %AICMD0x18($00, pAIScripting0x43_L044)                                   ;B58384
    %AICMD0x18($01, pAIScripting0x43_L045)                                   ;B58388
    %AICMD0x18($02, pAIScripting0x43_L018)                                   ;B5838C
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
    %AICMD0x17($02)                                            ;B583C1
    %AICMD0x18($00, pAIScripting0x43_L018)                                   ;B583C3
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
    %AICMD0x17($02)                                            ;B583F9
    %AICMD0x18($00, pAIScripting0x43_L018)                                   ;B583FB
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
    %AICMD0x2D(pAIScripting0x43_L078, pAIScripting0x43_L069)                               ;B58548
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
    %AICMD0x55(strcFlags.event1, $07, pAIScripting0x43_L079)                 ;B586A4
    %AICMD0x55(strcFlags.event2, $0A, pAIScripting0x43_L085)                 ;B586AB
    %AICMD0x55(strcFlags.event2, $0B, pAIScripting0x43_L085)                 ;B586B2
    %AICMD0x55(strcFlags.event2, $0C, pAIScripting0x43_L085)                 ;B586B9
    %AICMD0x55(strcFlags.event2, $09, pAIScripting0x43_L086)                 ;B586C0
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
    %AICMD0x17($02)                                            ;B58779
    %AICMD0x18($00, pAIScripting0x43_L079)                                   ;B5877B
    %AICMD0x18($01, pAIScripting0x43_L089)                                   ;B5877F
    %AICMD0x12_Jump(pAIScripting0x43_L067)                                   ;B58783
pAIScripting0x43_L089:
    %AICMD0x1C_ShowDialog($01A4, $00)                          ;B58786
    %AICMD0x12_Jump(pAIScripting0x43_L067)                                   ;B5878A
pAIScripting0x43_L090:
    %AICMD0x17($02)                                            ;B5878D
    %AICMD0x18($00, pAIScripting0x43_L079)                                   ;B5878F
    %AICMD0x18($01, pAIScripting0x43_L091)                                   ;B58793
    %AICMD0x12_Jump(pAIScripting0x43_L067)                                   ;B58797
pAIScripting0x43_L091:
    %AICMD0x1C_ShowDialog($01A6, $00)                          ;B5879A
    %AICMD0x12_Jump(pAIScripting0x43_L067)                                   ;B5879E
pAIScripting0x43_L092:
    %AICMD0x17($02)                                            ;B587A1
    %AICMD0x18($00, pAIScripting0x43_L079)                                   ;B587A3
    %AICMD0x18($01, pAIScripting0x43_L093)                                   ;B587A7
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
    %AICMD0x17($02)                                            ;B587CA
    %AICMD0x18($00, pAIScripting0x43_L098)                                   ;B587CC
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
    %AICMD0x17($02)                                            ;B5881D
    %AICMD0x18($00, pAIScripting0x43_L080)                                   ;B5881F
    %AICMD0x1C_ShowDialog($0182, $00)                          ;B58823
    %AICMD0x12_Jump(pAIScripting0x43_L067)                                   ;B58827
pAIScripting0x43_L104:
    %AICMD0x1C_ShowDialog($0207, $00)                          ;B5882A
    %AICMD0x12_Jump(pAIScripting0x43_L067)                                   ;B5882E
pAIScripting0x43_L105:
    %AICMD0x14_JumpIfFlagSet($800196, $01, pAIScripting0x43_L117)            ;B58831
    %AICMD0x17($04)                                            ;B58838
    %AICMD0x18($00, pAIScripting0x43_L106)                                   ;B5883A
    %AICMD0x18($01, pAIScripting0x43_L107)                                   ;B5883E
    %AICMD0x18($02, pAIScripting0x43_L080)                                   ;B58842
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
    %AICMD0x17($02)                                            ;B58877
    %AICMD0x18($00, pAIScripting0x43_L080)                                   ;B58879
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
    %AICMD0x17($02)                                            ;B588AF
    %AICMD0x18($00, pAIScripting0x43_L080)                                   ;B588B1
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
    %AICMD0x2D(pAIScripting0x43_L140, pAIScripting0x43_L131)                               ;B589FE
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
    %AICMD0x55(strcFlags.event1, $07, pAIScripting0x43_L141)                 ;B58B5A
    %AICMD0x55(strcFlags.event2, $0A, pAIScripting0x43_L147)                 ;B58B61
    %AICMD0x55(strcFlags.event2, $0B, pAIScripting0x43_L147)                 ;B58B68
    %AICMD0x55(strcFlags.event2, $0C, pAIScripting0x43_L147)                 ;B58B6F
    %AICMD0x55(strcFlags.event2, $09, pAIScripting0x43_L148)                 ;B58B76
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
    %AICMD0x17($02)                                            ;B58C37
    %AICMD0x18($00, pAIScripting0x43_L141)                                   ;B58C39
    %AICMD0x18($01, pAIScripting0x43_L151)                                   ;B58C3D
    %AICMD0x12_Jump(pAIScripting0x43_L129)                                   ;B58C41
pAIScripting0x43_L151:
    %AICMD0x1C_ShowDialog($01A4, $00)                          ;B58C44
    %AICMD0x12_Jump(pAIScripting0x43_L129)                                   ;B58C48
pAIScripting0x43_L152:
    %AICMD0x17($02)                                            ;B58C4B
    %AICMD0x18($00, pAIScripting0x43_L141)                                   ;B58C4D
    %AICMD0x18($01, pAIScripting0x43_L153)                                   ;B58C51
    %AICMD0x12_Jump(pAIScripting0x43_L129)                                   ;B58C55
pAIScripting0x43_L153:
    %AICMD0x1C_ShowDialog($01A6, $00)                          ;B58C58
    %AICMD0x12_Jump(pAIScripting0x43_L129)                                   ;B58C5C
pAIScripting0x43_L154:
    %AICMD0x17($02)                                            ;B58C5F
    %AICMD0x18($00, pAIScripting0x43_L141)                                   ;B58C61
    %AICMD0x18($01, pAIScripting0x43_L155)                                   ;B58C65
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
    %AICMD0x17($02)                                            ;B58C88
    %AICMD0x18($00, pAIScripting0x43_L160)                                   ;B58C8A
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
    %AICMD0x17($02)                                            ;B58CDB
    %AICMD0x18($00, pAIScripting0x43_L142)                                   ;B58CDD
    %AICMD0x1C_ShowDialog($0424, $00)                          ;B58CE1
    %AICMD0x12_Jump(pAIScripting0x43_L129)                                   ;B58CE5
pAIScripting0x43_L166:
    %AICMD0x1C_ShowDialog($0208, $00)                          ;B58CE8
    %AICMD0x12_Jump(pAIScripting0x43_L129)                                   ;B58CEC
pAIScripting0x43_L167:
    %AICMD0x14_JumpIfFlagSet($800196, $01, pAIScripting0x43_L180)            ;B58CEF
    %AICMD0x17($04)                                            ;B58CF6
    %AICMD0x18($00, pAIScripting0x43_L168)                                   ;B58CF8
    %AICMD0x18($01, pAIScripting0x43_L169)                                   ;B58CFC
    %AICMD0x18($02, pAIScripting0x43_L142)                                   ;B58D00
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
    %AICMD0x17($02)                                            ;B58D35
    %AICMD0x18($00, pAIScripting0x43_L142)                                   ;B58D37
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
    %AICMD0x17($02)                                            ;B58D6D
    %AICMD0x18($00, pAIScripting0x43_L142)                                   ;B58D6F
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
    %AICMD0x2D(pAIScripting0x43_L203, pAIScripting0x43_L193)                               ;B58EBC
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
    %AICMD0x55(strcFlags.event1, $07, pAIScripting0x43_L204)                 ;B59027
    %AICMD0x55(strcFlags.event2, $0A, pAIScripting0x43_L210)                 ;B5902E
    %AICMD0x55(strcFlags.event2, $0B, pAIScripting0x43_L210)                 ;B59035
    %AICMD0x55(strcFlags.event2, $0C, pAIScripting0x43_L210)                 ;B5903C
    %AICMD0x55(strcFlags.event2, $09, pAIScripting0x43_L211)                 ;B59043
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
    %AICMD0x17($02)                                            ;B590FC
    %AICMD0x18($00, pAIScripting0x43_L204)                                   ;B590FE
    %AICMD0x18($01, pAIScripting0x43_L214)                                   ;B59102
    %AICMD0x12_Jump(pAIScripting0x43_L191)                                   ;B59106
pAIScripting0x43_L214:
    %AICMD0x1C_ShowDialog($01A3, $00)                          ;B59109
    %AICMD0x12_Jump(pAIScripting0x43_L191)                                   ;B5910D
pAIScripting0x43_L215:
    %AICMD0x17($02)                                            ;B59110
    %AICMD0x18($00, pAIScripting0x43_L204)                                   ;B59112
    %AICMD0x18($01, pAIScripting0x43_L216)                                   ;B59116
    %AICMD0x12_Jump(pAIScripting0x43_L191)                                   ;B5911A
pAIScripting0x43_L216:
    %AICMD0x1C_ShowDialog($01A4, $00)                          ;B5911D
    %AICMD0x12_Jump(pAIScripting0x43_L191)                                   ;B59121
pAIScripting0x43_L217:
    %AICMD0x17($02)                                            ;B59124
    %AICMD0x18($00, pAIScripting0x43_L204)                                   ;B59126
    %AICMD0x18($01, pAIScripting0x43_L218)                                   ;B5912A
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
    %AICMD0x17($02)                                            ;B5914D
    %AICMD0x18($00, pAIScripting0x43_L223)                                   ;B5914F
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
    %AICMD0x17($02)                                            ;B591A0
    %AICMD0x18($00, pAIScripting0x43_L205)                                   ;B591A2
    %AICMD0x1C_ShowDialog($018C, $00)                          ;B591A6
    %AICMD0x12_Jump(pAIScripting0x43_L191)                                   ;B591AA
pAIScripting0x43_L229:
    %AICMD0x1C_ShowDialog($0209, $00)                          ;B591AD
    %AICMD0x12_Jump(pAIScripting0x43_L191)                                   ;B591B1
pAIScripting0x43_L230:
    %AICMD0x14_JumpIfFlagSet($800196, $01, pAIScripting0x43_L242)            ;B591B4
    %AICMD0x17($04)                                            ;B591BB
    %AICMD0x18($00, pAIScripting0x43_L231)                                   ;B591BD
    %AICMD0x18($01, pAIScripting0x43_L232)                                   ;B591C1
    %AICMD0x18($02, pAIScripting0x43_L205)                                   ;B591C5
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
    %AICMD0x17($02)                                            ;B591FA
    %AICMD0x18($00, pAIScripting0x43_L205)                                   ;B591FC
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
    %AICMD0x17($02)                                            ;B59232
    %AICMD0x18($00, pAIScripting0x43_L205)                                   ;B59234
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
    %AICMD0x2D(pAIScripting0x43_L265, pAIScripting0x43_L256)                               ;B59381
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
    %AICMD0x55(strcFlags.event1, $07, pAIScripting0x43_L266)                 ;B594E4
    %AICMD0x55(strcFlags.event2, $0A, pAIScripting0x43_L272)                 ;B594EB
    %AICMD0x55(strcFlags.event2, $0B, pAIScripting0x43_L272)                 ;B594F2
    %AICMD0x55(strcFlags.event2, $0C, pAIScripting0x43_L272)                 ;B594F9
    %AICMD0x55(strcFlags.event2, $09, pAIScripting0x43_L273)                 ;B59500
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
    %AICMD0x17($02)                                            ;B595B9
    %AICMD0x18($00, pAIScripting0x43_L266)                                   ;B595BB
    %AICMD0x18($01, pAIScripting0x43_L276)                                   ;B595BF
    %AICMD0x12_Jump(pAIScripting0x43_L254)                                   ;B595C3
pAIScripting0x43_L276:
    %AICMD0x1C_ShowDialog($01A4, $00)                          ;B595C6
    %AICMD0x12_Jump(pAIScripting0x43_L254)                                   ;B595CA
pAIScripting0x43_L277:
    %AICMD0x17($02)                                            ;B595CD
    %AICMD0x18($00, pAIScripting0x43_L266)                                   ;B595CF
    %AICMD0x18($01, pAIScripting0x43_L278)                                   ;B595D3
    %AICMD0x12_Jump(pAIScripting0x43_L254)                                   ;B595D7
pAIScripting0x43_L278:
    %AICMD0x1C_ShowDialog($01A5, $00)                          ;B595DA
    %AICMD0x12_Jump(pAIScripting0x43_L254)                                   ;B595DE
pAIScripting0x43_L279:
    %AICMD0x17($02)                                            ;B595E1
    %AICMD0x18($00, pAIScripting0x43_L266)                                   ;B595E3
    %AICMD0x18($01, pAIScripting0x43_L280)                                   ;B595E7
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
    %AICMD0x17($02)                                            ;B59607
    %AICMD0x18($00, pAIScripting0x43_L285)                                   ;B59609
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
    %AICMD0x17($02)                                            ;B5965A
    %AICMD0x18($00, pAIScripting0x43_L267)                                   ;B5965C
    %AICMD0x1C_ShowDialog($018F, $00)                          ;B59660
    %AICMD0x12_Jump(pAIScripting0x43_L254)                                   ;B59664
pAIScripting0x43_L291:
    %AICMD0x1C_ShowDialog($020A, $00)                          ;B59667
    %AICMD0x12_Jump(pAIScripting0x43_L254)                                   ;B5966B
pAIScripting0x43_L292:
    %AICMD0x14_JumpIfFlagSet($800196, $01, pAIScripting0x43_L304)            ;B5966E
    %AICMD0x17($04)                                            ;B59675
    %AICMD0x18($00, pAIScripting0x43_L293)                                   ;B59677
    %AICMD0x18($01, pAIScripting0x43_L294)                                   ;B5967B
    %AICMD0x18($02, pAIScripting0x43_L267)                                   ;B5967F
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
    %AICMD0x17($02)                                            ;B596B4
    %AICMD0x18($00, pAIScripting0x43_L267)                                   ;B596B6
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
    %AICMD0x17($02)                                            ;B596EC
    %AICMD0x18($00, pAIScripting0x43_L267)                                   ;B596EE
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
    %AICMD0x32($8000D4, $0015)                                 ;B59769
    %AICMD0x13_Wait(120)                                       ;B5976F
    %AICMD0x11_EnableUserControl()                             ;B59772
    %AICMD0x57_UpdateStamina(30)                               ;B59773
    %AICMD0x12_Jump(pAIScripting0x43_L254)                                   ;B59775
pAIScripting0x43_L308:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 10, pAIScripting0x43_L299)         ;B59778
    %AICMD0x1C_ShowDialog($042F, $00)                          ;B5977F
    %AICMD0x1B($022F, $00)                                     ;B59783
    %AICMD0x08_EnableAIControl()                               ;B59787
    %AICMD0x32($8000D4, $0015)                                 ;B59788
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


pAIScripting0x44:
    dw DATA8_B597F1                                            ;B597D1|        |B597F1;
    dw DATA8_B599EB                                            ;B597D3|        |B599EB;
    dw DATA8_B59BE3                                            ;B597D5|        |B59BE3;
    dw DATA8_B59DD3                                            ;B597D7|        |B59DD3;
    dw DATA8_B59FCA                                            ;B597D9|        |B59FCA;
    dw pAIScripting0x45                                        ;B597DB|        |B5A1E5;
    dw pAIScripting0x45                                        ;B597DD|        |B5A1E5;
    dw pAIScripting0x45                                        ;B597DF|        |B5A1E5;
    dw pAIScripting0x45                                        ;B597E1|        |B5A1E5;
    dw pAIScripting0x45                                        ;B597E3|        |B5A1E5;
    dw pAIScripting0x45                                        ;B597E5|        |B5A1E5;
    dw pAIScripting0x45                                        ;B597E7|        |B5A1E5;
    dw pAIScripting0x45                                        ;B597E9|        |B5A1E5;
    dw pAIScripting0x45                                        ;B597EB|        |B5A1E5;
    dw pAIScripting0x45                                        ;B597ED|        |B5A1E5;
    dw pAIScripting0x45                                        ;B597EF|        |B5A1E5;
 
DATA8_B597F1:
 
    %AICMD0x14_JumpIfFlagSet($800196, $01, pAIScripting0x44_L028)            ;B597F1
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 6, 10, pAIScripting0x44_L028)  ;B597F8
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 15, 18, pAIScripting0x44_L028) ;B59800
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, pAIScripting0x44_L028)     ;B59808
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 60, 89, pAIScripting0x44_L001);B5980F
    %AICMD0x45_JumpIfBetween16(nSecondChildAge, 60, 89, pAIScripting0x44_L001);B59819
    %AICMD0x1A($0168, $0168, aAIScriptingData_L198, $00)                     ;B59823
    %AICMD0x12_Jump(pAIScripting0x44_L002)                                   ;B5982B
pAIScripting0x44_L001:
    %AICMD0x1A($0168, $0168, aAIScriptingData_L074, $00)                     ;B5982E
pAIScripting0x44_L002:
    %AICMD0x2D(pAIScripting0x44_L012, pAIScripting0x44_L003)                               ;B59836
    %AICMD0x12_Jump(pAIScripting0x44_L002)                                   ;B5983B
pAIScripting0x44_L003:
    %AICMD0x15_JumpIfEquals8($80091E, 2, pAIScripting0x44_L004)              ;B5983E
    %AICMD0x16_JumpIfBetween8($80091E, 1, 5, pAIScripting0x44_L005)          ;B59845
    %AICMD0x15_JumpIfEquals8($80091E, 7, pAIScripting0x44_L005)              ;B5984D
    %AICMD0x16_JumpIfBetween8($80091E, 16, 23, pAIScripting0x44_L005)        ;B59854
    %AICMD0x15_JumpIfEquals8($80091E, 25, pAIScripting0x44_L006)             ;B5985C
    %AICMD0x15_JumpIfEquals8($80091E, 73, pAIScripting0x44_L006)             ;B59863
    %AICMD0x15_JumpIfEquals8($80091E, 6, pAIScripting0x44_L008)              ;B5986A
    %AICMD0x16_JumpIfBetween8($80091E, 9, 12, pAIScripting0x44_L007)         ;B59871
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B59879
    %AICMD0x12_Jump(pAIScripting0x44_L002)                                   ;B5987D
pAIScripting0x44_L004:
    %AICMD0x1C_ShowDialog($03B0, $00)                          ;B59880
    %AICMD0x41_AddValue16(nLove_Maria, -6)                     ;B59884
    %AICMD0x12_Jump(pAIScripting0x44_L002)                                   ;B5988A
pAIScripting0x44_L005:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $07, pAIScripting0x44_L009)   ;B5988D
    %AICMD0x41_AddValue16(nLove_Maria, 4)                      ;B59894
    %AICMD0x1C_ShowDialog($03B2, $00)                          ;B5989A
    %AICMD0x12_Jump(pAIScripting0x44_L002)                                   ;B5989E
pAIScripting0x44_L006:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $07, pAIScripting0x44_L009)   ;B598A1
    %AICMD0x1C_ShowDialog($03B5, $00)                          ;B598A8
    %AICMD0x41_AddValue16(nLove_Maria, 8)                      ;B598AC
    %AICMD0x12_Jump(pAIScripting0x44_L002)                                   ;B598B2
pAIScripting0x44_L007:
    %AICMD0x1C_ShowDialog($01D9, $00)                          ;B598B5
    %AICMD0x41_AddValue16(nLove_Maria, -4)                     ;B598B9
    %AICMD0x12_Jump(pAIScripting0x44_L002)                                   ;B598BF
pAIScripting0x44_L008:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $07, pAIScripting0x44_L009)   ;B598C2
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $08, pAIScripting0x44_L010)   ;B598C9
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $09, pAIScripting0x44_L011)   ;B598D0
    %AICMD0x41_AddValue16(nLove_Maria, 8)                      ;B598D7
    %AICMD0x1C_ShowDialog($0212, $00)                          ;B598DD
    %AICMD0x12_Jump(pAIScripting0x44_L002)                                   ;B598E1
pAIScripting0x44_L009:
    %AICMD0x1C_ShowDialog($01BD, $00)                          ;B598E4
    %AICMD0x41_AddValue16(nPlayerHappiness, 30)                ;B598E8
    %AICMD0x12_Jump(pAIScripting0x44_L002)                                   ;B598EE
pAIScripting0x44_L010:
    %AICMD0x1C_ShowDialog($041D, $00)                          ;B598F1
    %AICMD0x41_AddValue16(nPlayerHappiness, 30)                ;B598F5
    %AICMD0x12_Jump(pAIScripting0x44_L002)                                   ;B598FB
pAIScripting0x44_L011:
    %AICMD0x1C_ShowDialog($041E, $00)                          ;B598FE
    %AICMD0x41_AddValue16(nPlayerHappiness, 30)                ;B59902
    %AICMD0x12_Jump(pAIScripting0x44_L002)                                   ;B59908
pAIScripting0x44_L012:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $04, pAIScripting0x44_L013)   ;B5990B
    %AICMD0x15_JumpIfEquals8($80098C, 3, pAIScripting0x44_L014)              ;B59912
    %AICMD0x14_JumpIfFlagSet($800196, $04, pAIScripting0x44_L015)            ;B59919
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $05, pAIScripting0x44_L013)   ;B59920
    %AICMD0x45_JumpIfBetween16(nLove_Maria, 200, 220, pAIScripting0x44_L016) ;B59927
    %AICMD0x45_JumpIfBetween16(nLove_Maria, 221, 250, pAIScripting0x44_L017) ;B59931
    %AICMD0x15_JumpIfEquals8(nCurrentWeekdayID, 0, pAIScripting0x44_L019)    ;B5993B
    %AICMD0x15_JumpIfEquals8(nCurrentWeekdayID, 6, pAIScripting0x44_L018)    ;B59942
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 0, pAIScripting0x44_L020)     ;B59949
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 1, pAIScripting0x44_L023)     ;B59950
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 2, pAIScripting0x44_L025)     ;B59957
    %AICMD0x12_Jump(pAIScripting0x44_L002)                                   ;B5995E
pAIScripting0x44_L013:
    %AICMD0x1C_ShowDialog($0166, $00)                          ;B59961
    %AICMD0x12_Jump(pAIScripting0x44_L002)                                   ;B59965
pAIScripting0x44_L014:
    %AICMD0x1C_ShowDialog($015F, $00)                          ;B59968
    %AICMD0x12_Jump(pAIScripting0x44_L002)                                   ;B5996C
pAIScripting0x44_L015:
    %AICMD0x1C_ShowDialog($0160, $00)                          ;B5996F
    %AICMD0x12_Jump(pAIScripting0x44_L002)                                   ;B59973
pAIScripting0x44_L016:
    %AICMD0x1C_ShowDialog($01F3, $00)                          ;B59976
    %AICMD0x12_Jump(pAIScripting0x44_L002)                                   ;B5997A
pAIScripting0x44_L017:
    %AICMD0x1C_ShowDialog($0049, $00)                          ;B5997D
    %AICMD0x12_Jump(pAIScripting0x44_L002)                                   ;B59981
pAIScripting0x44_L018:
    %AICMD0x1C_ShowDialog($047D, $00)                          ;B59984
    %AICMD0x12_Jump(pAIScripting0x44_L002)                                   ;B59988
pAIScripting0x44_L019:
    %AICMD0x1C_ShowDialog($0195, $00)                          ;B5998B
    %AICMD0x12_Jump(pAIScripting0x44_L002)                                   ;B5998F
pAIScripting0x44_L020:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 22, pAIScripting0x44_L022)         ;B59992
    %AICMD0x17($02)                                            ;B59999
    %AICMD0x18($00, pAIScripting0x44_L021)                                   ;B5999B
    %AICMD0x1C_ShowDialog($041F, $00)                          ;B5999F
    %AICMD0x12_Jump(pAIScripting0x44_L002)                                   ;B599A3
pAIScripting0x44_L021:
    %AICMD0x1C_ShowDialog($0188, $00)                          ;B599A6
    %AICMD0x12_Jump(pAIScripting0x44_L002)                                   ;B599AA
pAIScripting0x44_L022:
    %AICMD0x1C_ShowDialog($0206, $00)                          ;B599AD
    %AICMD0x12_Jump(pAIScripting0x44_L002)                                   ;B599B1
pAIScripting0x44_L023:
    %AICMD0x17($02)                                            ;B599B4
    %AICMD0x18($00, pAIScripting0x44_L024)                                   ;B599B6
    %AICMD0x1C_ShowDialog($0420, $00)                          ;B599BA
    %AICMD0x12_Jump(pAIScripting0x44_L002)                                   ;B599BE
pAIScripting0x44_L024:
    %AICMD0x1C_ShowDialog($0193, $00)                          ;B599C1
    %AICMD0x12_Jump(pAIScripting0x44_L002)                                   ;B599C5
pAIScripting0x44_L025:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 11, pAIScripting0x44_L027)         ;B599C8
    %AICMD0x17($02)                                            ;B599CF
    %AICMD0x18($00, pAIScripting0x44_L026)                                   ;B599D1
    %AICMD0x1C_ShowDialog($0421, $00)                          ;B599D5
    %AICMD0x12_Jump(pAIScripting0x44_L002)                                   ;B599D9
pAIScripting0x44_L026:
    %AICMD0x1C_ShowDialog($0184, $00)                          ;B599DC
    %AICMD0x12_Jump(pAIScripting0x44_L002)                                   ;B599E0
pAIScripting0x44_L027:
    %AICMD0x1C_ShowDialog($0238, $00)                          ;B599E3
    %AICMD0x12_Jump(pAIScripting0x44_L002)                                   ;B599E7
pAIScripting0x44_L028:
    %AICMD0x10_End()                                           ;B599EA


DATA8_B599EB:
 
    %AICMD0x14_JumpIfFlagSet($800196, $01, pAIScripting0x44_L055)            ;B599EB
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 6, 10, pAIScripting0x44_L055)  ;B599F2
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 15, 18, pAIScripting0x44_L055) ;B599FA
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, pAIScripting0x44_L055)     ;B59A02
    %AICMD0x09($01, pAIScripting0x44_L056)                                   ;B59A09
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 60, 89, pAIScripting0x44_L029);B59A0D
    %AICMD0x45_JumpIfBetween16(nSecondChildAge, 60, 89, pAIScripting0x44_L029);B59A17
    %AICMD0x1A($0048, $0048, aAIScriptingData_L199, $00)                     ;B59A21
    %AICMD0x12_Jump(pAIScripting0x44_L030)                                   ;B59A29
pAIScripting0x44_L029:
    %AICMD0x1A($0048, $0048, aAIScriptingData_L074, $00)                     ;B59A2C
pAIScripting0x44_L030:
    %AICMD0x2D(pAIScripting0x44_L039, pAIScripting0x44_L031)                               ;B59A34
    %AICMD0x12_Jump(pAIScripting0x44_L030)                                   ;B59A39
pAIScripting0x44_L031:
    %AICMD0x15_JumpIfEquals8($80091E, 2, pAIScripting0x44_L032)              ;B59A3C
    %AICMD0x16_JumpIfBetween8($80091E, 3, 7, pAIScripting0x44_L034)          ;B59A43
    %AICMD0x16_JumpIfBetween8($80091E, 16, 23, pAIScripting0x44_L034)        ;B59A4B
    %AICMD0x15_JumpIfEquals8($80091E, 6, pAIScripting0x44_L035)              ;B59A53
    %AICMD0x15_JumpIfEquals8($80091E, 25, pAIScripting0x44_L033)             ;B59A5A
    %AICMD0x15_JumpIfEquals8($80091E, 73, pAIScripting0x44_L033)             ;B59A61
    %AICMD0x16_JumpIfBetween8($80091E, 9, 12, pAIScripting0x44_L032)         ;B59A68
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B59A70
    %AICMD0x12_Jump(pAIScripting0x44_L030)                                   ;B59A74
pAIScripting0x44_L032:
    %AICMD0x1C_ShowDialog($03B4, $00)                          ;B59A77
    %AICMD0x41_AddValue16(nLove_Ann, -6)                       ;B59A7B
    %AICMD0x12_Jump(pAIScripting0x44_L030)                                   ;B59A81
pAIScripting0x44_L033:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $07, pAIScripting0x44_L036)   ;B59A84
    %AICMD0x41_AddValue16(nLove_Ann, 8)                        ;B59A8B
    %AICMD0x1C_ShowDialog($0212, $00)                          ;B59A91
    %AICMD0x12_Jump(pAIScripting0x44_L030)                                   ;B59A95
pAIScripting0x44_L034:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $07, pAIScripting0x44_L036)   ;B59A98
    %AICMD0x1C_ShowDialog($03B2, $00)                          ;B59A9F
    %AICMD0x41_AddValue16(nLove_Ann, 5)                        ;B59AA3
    %AICMD0x12_Jump(pAIScripting0x44_L030)                                   ;B59AA9
pAIScripting0x44_L035:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $07, pAIScripting0x44_L036)   ;B59AAC
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $08, pAIScripting0x44_L037)   ;B59AB3
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $09, pAIScripting0x44_L038)   ;B59ABA
    %AICMD0x41_AddValue16(nLove_Ann, 8)                        ;B59AC1
    %AICMD0x1C_ShowDialog($0212, $00)                          ;B59AC7
    %AICMD0x12_Jump(pAIScripting0x44_L030)                                   ;B59ACB
pAIScripting0x44_L036:
    %AICMD0x1C_ShowDialog($01BD, $00)                          ;B59ACE
    %AICMD0x41_AddValue16(nPlayerHappiness, 30)                ;B59AD2
    %AICMD0x12_Jump(pAIScripting0x44_L030)                                   ;B59AD8
pAIScripting0x44_L037:
    %AICMD0x1C_ShowDialog($041D, $00)                          ;B59ADB
    %AICMD0x41_AddValue16(nPlayerHappiness, 30)                ;B59ADF
    %AICMD0x12_Jump(pAIScripting0x44_L030)                                   ;B59AE5
pAIScripting0x44_L038:
    %AICMD0x1C_ShowDialog($041E, $00)                          ;B59AE8
    %AICMD0x41_AddValue16(nPlayerHappiness, 30)                ;B59AEC
    %AICMD0x12_Jump(pAIScripting0x44_L030)                                   ;B59AF2
pAIScripting0x44_L039:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $04, pAIScripting0x44_L040)   ;B59AF5
    %AICMD0x15_JumpIfEquals8($80098C, 3, pAIScripting0x44_L041)              ;B59AFC
    %AICMD0x14_JumpIfFlagSet($800196, $04, pAIScripting0x44_L042)            ;B59B03
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $05, pAIScripting0x44_L040)   ;B59B0A
    %AICMD0x45_JumpIfBetween16(nLove_Ann, 200, 220, pAIScripting0x44_L043)   ;B59B11
    %AICMD0x45_JumpIfBetween16(nLove_Ann, 221, 250, pAIScripting0x44_L044)   ;B59B1B
    %AICMD0x15_JumpIfEquals8(nCurrentWeekdayID, 0, pAIScripting0x44_L046)    ;B59B25
    %AICMD0x15_JumpIfEquals8(nCurrentWeekdayID, 6, pAIScripting0x44_L045)    ;B59B2C
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 0, pAIScripting0x44_L047)     ;B59B33
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 1, pAIScripting0x44_L050)     ;B59B3A
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 2, pAIScripting0x44_L052)     ;B59B41
    %AICMD0x12_Jump(pAIScripting0x44_L030)                                   ;B59B48
pAIScripting0x44_L040:
    %AICMD0x1C_ShowDialog($0166, $00)                          ;B59B4B
    %AICMD0x12_Jump(pAIScripting0x44_L030)                                   ;B59B4F
pAIScripting0x44_L041:
    %AICMD0x1C_ShowDialog($015F, $00)                          ;B59B52
    %AICMD0x12_Jump(pAIScripting0x44_L030)                                   ;B59B56
pAIScripting0x44_L042:
    %AICMD0x1C_ShowDialog($0160, $00)                          ;B59B59
    %AICMD0x12_Jump(pAIScripting0x44_L030)                                   ;B59B5D
pAIScripting0x44_L043:
    %AICMD0x1C_ShowDialog($01F4, $00)                          ;B59B60
    %AICMD0x12_Jump(pAIScripting0x44_L030)                                   ;B59B64
pAIScripting0x44_L044:
    %AICMD0x1C_ShowDialog($0049, $00)                          ;B59B67
    %AICMD0x12_Jump(pAIScripting0x44_L030)                                   ;B59B6B
pAIScripting0x44_L045:
    %AICMD0x1C_ShowDialog($047D, $00)                          ;B59B6E
    %AICMD0x12_Jump(pAIScripting0x44_L030)                                   ;B59B72
pAIScripting0x44_L046:
    %AICMD0x1C_ShowDialog($0194, $00)                          ;B59B75
    %AICMD0x12_Jump(pAIScripting0x44_L030)                                   ;B59B79
pAIScripting0x44_L047:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 22, pAIScripting0x44_L049)         ;B59B7C
    %AICMD0x17($02)                                            ;B59B83
    %AICMD0x18($00, pAIScripting0x44_L048)                                   ;B59B85
    %AICMD0x1C_ShowDialog($0185, $00)                          ;B59B89
    %AICMD0x12_Jump(pAIScripting0x44_L030)                                   ;B59B8D
pAIScripting0x44_L048:
    %AICMD0x1C_ShowDialog($018F, $00)                          ;B59B90
    %AICMD0x12_Jump(pAIScripting0x44_L030)                                   ;B59B94
pAIScripting0x44_L049:
    %AICMD0x1C_ShowDialog($0207, $00)                          ;B59B97
    %AICMD0x12_Jump(pAIScripting0x44_L030)                                   ;B59B9B
pAIScripting0x44_L050:
    %AICMD0x17($02)                                            ;B59B9E
    %AICMD0x18($00, pAIScripting0x44_L051)                                   ;B59BA0
    %AICMD0x1C_ShowDialog($0186, $00)                          ;B59BA4
    %AICMD0x12_Jump(pAIScripting0x44_L030)                                   ;B59BA8
pAIScripting0x44_L051:
    %AICMD0x1C_ShowDialog($0193, $00)                          ;B59BAB
    %AICMD0x12_Jump(pAIScripting0x44_L030)                                   ;B59BAF
pAIScripting0x44_L052:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 11, pAIScripting0x44_L054)         ;B59BB2
    %AICMD0x17($02)                                            ;B59BB9
    %AICMD0x18($00, pAIScripting0x44_L053)                                   ;B59BBB
    %AICMD0x1C_ShowDialog($0187, $00)                          ;B59BBF
    %AICMD0x12_Jump(pAIScripting0x44_L030)                                   ;B59BC3
pAIScripting0x44_L053:
    %AICMD0x1C_ShowDialog($009A, $00)                          ;B59BC6
    %AICMD0x12_Jump(pAIScripting0x44_L030)                                   ;B59BCA
pAIScripting0x44_L054:
    %AICMD0x1C_ShowDialog($0239, $00)                          ;B59BCD
    %AICMD0x12_Jump(pAIScripting0x44_L030)                                   ;B59BD1
pAIScripting0x44_L055:
    %AICMD0x10_End()                                           ;B59BD4
pAIScripting0x44_L056:
    %AICMD0x1A($0058, $0048, aAIScriptingData_L201, $00)                     ;B59BD5
pAIScripting0x44_L057:
    %AICMD0x13_Wait(1)                                         ;B59BDD
    %AICMD0x12_Jump(pAIScripting0x44_L057)                                   ;B59BE0


DATA8_B59BE3:
 
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, pAIScripting0x44_L085)     ;B59BE3
    %AICMD0x14_JumpIfFlagSet($800196, $01, pAIScripting0x44_L085)            ;B59BEA
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 6, 10, pAIScripting0x44_L085)  ;B59BF1
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 15, 18, pAIScripting0x44_L085) ;B59BF9
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 60, 89, pAIScripting0x44_L058);B59C01
    %AICMD0x45_JumpIfBetween16(nSecondChildAge, 60, 89, pAIScripting0x44_L058);B59C0B
    %AICMD0x1A($0168, $0168, aAIScriptingData_L200, $00)                     ;B59C15
    %AICMD0x12_Jump(pAIScripting0x44_L059)                                   ;B59C1D
pAIScripting0x44_L058:
    %AICMD0x1A($0168, $0168, aAIScriptingData_L075, $00)                     ;B59C20
pAIScripting0x44_L059:
    %AICMD0x2D(pAIScripting0x44_L069, pAIScripting0x44_L060)                               ;B59C28
    %AICMD0x12_Jump(pAIScripting0x44_L059)                                   ;B59C2D
pAIScripting0x44_L060:
    %AICMD0x16_JumpIfBetween8($80091E, 1, 4, pAIScripting0x44_L063)          ;B59C30
    %AICMD0x16_JumpIfBetween8($80091E, 16, 23, pAIScripting0x44_L063)        ;B59C38
    %AICMD0x16_JumpIfBetween8($80091E, 9, 12, pAIScripting0x44_L064)         ;B59C40
    %AICMD0x15_JumpIfEquals8($80091E, 6, pAIScripting0x44_L065)              ;B59C48
    %AICMD0x15_JumpIfEquals8($80091E, 5, pAIScripting0x44_L065)              ;B59C4F
    %AICMD0x15_JumpIfEquals8($80091E, 25, pAIScripting0x44_L061)             ;B59C56
    %AICMD0x15_JumpIfEquals8($80091E, 73, pAIScripting0x44_L062)             ;B59C5D
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B59C64
    %AICMD0x12_Jump(pAIScripting0x44_L059)                                   ;B59C68
pAIScripting0x44_L061:
    %AICMD0x1C_ShowDialog($03B1, $00)                          ;B59C6B
    %AICMD0x41_AddValue16(nLove_Nina, -8)                      ;B59C6F
    %AICMD0x12_Jump(pAIScripting0x44_L059)                                   ;B59C75
pAIScripting0x44_L062:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $07, pAIScripting0x44_L066)   ;B59C78
    %AICMD0x1C_ShowDialog($0212, $00)                          ;B59C7F
    %AICMD0x41_AddValue16(nLove_Nina, 8)                       ;B59C83
    %AICMD0x12_Jump(pAIScripting0x44_L059)                                   ;B59C89
pAIScripting0x44_L063:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $07, pAIScripting0x44_L066)   ;B59C8C
    %AICMD0x1C_ShowDialog($03B2, $00)                          ;B59C93
    %AICMD0x41_AddValue16(nLove_Nina, 5)                       ;B59C97
    %AICMD0x12_Jump(pAIScripting0x44_L059)                                   ;B59C9D
pAIScripting0x44_L064:
    %AICMD0x1C_ShowDialog($03BA, $00)                          ;B59CA0
    %AICMD0x41_AddValue16(nLove_Nina, -4)                      ;B59CA4
    %AICMD0x12_Jump(pAIScripting0x44_L059)                                   ;B59CAA
pAIScripting0x44_L065:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $07, pAIScripting0x44_L066)   ;B59CAD
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $08, pAIScripting0x44_L067)   ;B59CB4
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $09, pAIScripting0x44_L068)   ;B59CBB
    %AICMD0x1C_ShowDialog($0212, $00)                          ;B59CC2
    %AICMD0x41_AddValue16(nLove_Nina, 8)                       ;B59CC6
    %AICMD0x12_Jump(pAIScripting0x44_L059)                                   ;B59CCC
pAIScripting0x44_L066:
    %AICMD0x1C_ShowDialog($01BD, $00)                          ;B59CCF
    %AICMD0x41_AddValue16(nPlayerHappiness, 30)                ;B59CD3
    %AICMD0x12_Jump(pAIScripting0x44_L059)                                   ;B59CD9
pAIScripting0x44_L067:
    %AICMD0x1C_ShowDialog($041D, $00)                          ;B59CDC
    %AICMD0x41_AddValue16(nPlayerHappiness, 30)                ;B59CE0
    %AICMD0x12_Jump(pAIScripting0x44_L059)                                   ;B59CE6
pAIScripting0x44_L068:
    %AICMD0x1C_ShowDialog($041E, $00)                          ;B59CE9
    %AICMD0x41_AddValue16(nPlayerHappiness, 30)                ;B59CED
    %AICMD0x12_Jump(pAIScripting0x44_L059)                                   ;B59CF3
pAIScripting0x44_L069:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $04, pAIScripting0x44_L070)   ;B59CF6
    %AICMD0x15_JumpIfEquals8($80098C, 3, pAIScripting0x44_L071)              ;B59CFD
    %AICMD0x14_JumpIfFlagSet($800196, $04, pAIScripting0x44_L072)            ;B59D04
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $05, pAIScripting0x44_L070)   ;B59D0B
    %AICMD0x45_JumpIfBetween16(nLove_Nina, 200, 220, pAIScripting0x44_L073)  ;B59D12
    %AICMD0x45_JumpIfBetween16(nLove_Nina, 221, 250, pAIScripting0x44_L074)  ;B59D1C
    %AICMD0x15_JumpIfEquals8(nCurrentWeekdayID, 0, pAIScripting0x44_L075)    ;B59D26
    %AICMD0x15_JumpIfEquals8(nCurrentWeekdayID, 6, pAIScripting0x44_L076)    ;B59D2D
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 0, pAIScripting0x44_L077)     ;B59D34
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 1, pAIScripting0x44_L080)     ;B59D3B
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 2, pAIScripting0x44_L082)     ;B59D42
pAIScripting0x44_L070:
    %AICMD0x1C_ShowDialog($0166, $00)                          ;B59D49
    %AICMD0x12_Jump(pAIScripting0x44_L059)                                   ;B59D4D
pAIScripting0x44_L071:
    %AICMD0x1C_ShowDialog($015F, $00)                          ;B59D50
    %AICMD0x12_Jump(pAIScripting0x44_L059)                                   ;B59D54
pAIScripting0x44_L072:
    %AICMD0x1C_ShowDialog($0160, $00)                          ;B59D57
    %AICMD0x12_Jump(pAIScripting0x44_L059)                                   ;B59D5B
pAIScripting0x44_L073:
    %AICMD0x1C_ShowDialog($01F4, $00)                          ;B59D5E
    %AICMD0x12_Jump(pAIScripting0x44_L059)                                   ;B59D62
pAIScripting0x44_L074:
    %AICMD0x1C_ShowDialog($0049, $00)                          ;B59D65
    %AICMD0x12_Jump(pAIScripting0x44_L059)                                   ;B59D69
pAIScripting0x44_L075:
    %AICMD0x1C_ShowDialog($0194, $00)                          ;B59D6C
    %AICMD0x12_Jump(pAIScripting0x44_L059)                                   ;B59D70
pAIScripting0x44_L076:
    %AICMD0x1C_ShowDialog($047D, $00)                          ;B59D73
    %AICMD0x12_Jump(pAIScripting0x44_L059)                                   ;B59D77
pAIScripting0x44_L077:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 22, pAIScripting0x44_L079)         ;B59D7A
    %AICMD0x17($02)                                            ;B59D81
    %AICMD0x18($00, pAIScripting0x44_L078)                                   ;B59D83
    %AICMD0x1C_ShowDialog($0189, $00)                          ;B59D87
    %AICMD0x12_Jump(pAIScripting0x44_L059)                                   ;B59D8B
pAIScripting0x44_L078:
    %AICMD0x1C_ShowDialog($018F, $00)                          ;B59D8E
    %AICMD0x12_Jump(pAIScripting0x44_L059)                                   ;B59D92
pAIScripting0x44_L079:
    %AICMD0x1C_ShowDialog($0208, $00)                          ;B59D95
    %AICMD0x12_Jump(pAIScripting0x44_L059)                                   ;B59D99
pAIScripting0x44_L080:
    %AICMD0x17($02)                                            ;B59D9C
    %AICMD0x18($00, pAIScripting0x44_L081)                                   ;B59D9E
    %AICMD0x1C_ShowDialog($018A, $00)                          ;B59DA2
    %AICMD0x12_Jump(pAIScripting0x44_L059)                                   ;B59DA6
pAIScripting0x44_L081:
    %AICMD0x1C_ShowDialog($018B, $00)                          ;B59DA9
    %AICMD0x12_Jump(pAIScripting0x44_L059)                                   ;B59DAD
pAIScripting0x44_L082:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 11, pAIScripting0x44_L084)         ;B59DB0
    %AICMD0x17($02)                                            ;B59DB7
    %AICMD0x18($00, pAIScripting0x44_L083)                                   ;B59DB9
    %AICMD0x1C_ShowDialog($0432, $00)                          ;B59DBD
    %AICMD0x12_Jump(pAIScripting0x44_L059)                                   ;B59DC1
pAIScripting0x44_L083:
    %AICMD0x1C_ShowDialog($0191, $00)                          ;B59DC4
    %AICMD0x12_Jump(pAIScripting0x44_L059)                                   ;B59DC8
pAIScripting0x44_L084:
    %AICMD0x1C_ShowDialog($023A, $00)                          ;B59DCB
    %AICMD0x12_Jump(pAIScripting0x44_L059)                                   ;B59DCF
pAIScripting0x44_L085:
    %AICMD0x10_End()                                           ;B59DD2


DATA8_B59DD3:
 
    %AICMD0x14_JumpIfFlagSet($800196, $01, pAIScripting0x44_L114)            ;B59DD3
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, pAIScripting0x44_L114)     ;B59DDA
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 17, 18, pAIScripting0x44_L114) ;B59DE1
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 60, 89, pAIScripting0x44_L086);B59DE9
    %AICMD0x45_JumpIfBetween16(nSecondChildAge, 60, 89, pAIScripting0x44_L086);B59DF3
    %AICMD0x1A($0168, $0168, aAIScriptingData_L200, $00)                     ;B59DFD
    %AICMD0x12_Jump(pAIScripting0x44_L087)                                   ;B59E05
pAIScripting0x44_L086:
    %AICMD0x1A($0168, $0168, aAIScriptingData_L075, $00)                     ;B59E08
pAIScripting0x44_L087:
    %AICMD0x2D(pAIScripting0x44_L098, pAIScripting0x44_L088)                               ;B59E10
    %AICMD0x12_Jump(pAIScripting0x44_L087)                                   ;B59E15
pAIScripting0x44_L088:
    %AICMD0x15_JumpIfEquals8($80091E, 2, pAIScripting0x44_L089)              ;B59E18
    %AICMD0x16_JumpIfBetween8($80091E, 1, 7, pAIScripting0x44_L090)          ;B59E1F
    %AICMD0x16_JumpIfBetween8($80091E, 16, 19, pAIScripting0x44_L090)        ;B59E27
    %AICMD0x15_JumpIfEquals8($80091E, 25, pAIScripting0x44_L091)             ;B59E2F
    %AICMD0x15_JumpIfEquals8($80091E, 73, pAIScripting0x44_L091)             ;B59E36
    %AICMD0x15_JumpIfEquals8($80091E, 6, pAIScripting0x44_L094)              ;B59E3D
    %AICMD0x16_JumpIfBetween8($80091E, 20, 23, pAIScripting0x44_L092)        ;B59E44
    %AICMD0x16_JumpIfBetween8($80091E, 9, 12, pAIScripting0x44_L093)         ;B59E4C
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B59E54
    %AICMD0x12_Jump(pAIScripting0x44_L087)                                   ;B59E58
pAIScripting0x44_L089:
    %AICMD0x1C_ShowDialog($01D9, $00)                          ;B59E5B
    %AICMD0x41_AddValue16(nLove_Ellen, -8)                     ;B59E5F
    %AICMD0x12_Jump(pAIScripting0x44_L087)                                   ;B59E65
pAIScripting0x44_L090:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $07, pAIScripting0x44_L095)   ;B59E68
    %AICMD0x1C_ShowDialog($03B2, $00)                          ;B59E6F
    %AICMD0x41_AddValue16(nLove_Ellen, 6)                      ;B59E73
    %AICMD0x12_Jump(pAIScripting0x44_L087)                                   ;B59E79
pAIScripting0x44_L091:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $07, pAIScripting0x44_L095)   ;B59E7C
    %AICMD0x1C_ShowDialog($0212, $00)                          ;B59E83
    %AICMD0x41_AddValue16(nLove_Ellen, 6)                      ;B59E87
    %AICMD0x12_Jump(pAIScripting0x44_L087)                                   ;B59E8D
pAIScripting0x44_L092:
    %AICMD0x1C_ShowDialog($03B3, $00)                          ;B59E90
    %AICMD0x41_AddValue16(nLove_Ellen, 4)                      ;B59E94
    %AICMD0x12_Jump(pAIScripting0x44_L087)                                   ;B59E9A
pAIScripting0x44_L093:
    %AICMD0x1C_ShowDialog($03BA, $00)                          ;B59E9D
    %AICMD0x41_AddValue16(nLove_Ellen, -4)                     ;B59EA1
    %AICMD0x12_Jump(pAIScripting0x44_L087)                                   ;B59EA7
pAIScripting0x44_L094:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $07, pAIScripting0x44_L095)   ;B59EAA
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $08, pAIScripting0x44_L096)   ;B59EB1
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $09, pAIScripting0x44_L097)   ;B59EB8
    %AICMD0x1C_ShowDialog($0212, $00)                          ;B59EBF
    %AICMD0x12_Jump(pAIScripting0x44_L087)                                   ;B59EC3
pAIScripting0x44_L095:
    %AICMD0x1C_ShowDialog($01BD, $00)                          ;B59EC6
    %AICMD0x41_AddValue16(nPlayerHappiness, 30)                ;B59ECA
    %AICMD0x12_Jump(pAIScripting0x44_L087)                                   ;B59ED0
pAIScripting0x44_L096:
    %AICMD0x1C_ShowDialog($041D, $00)                          ;B59ED3
    %AICMD0x41_AddValue16(nPlayerHappiness, 30)                ;B59ED7
    %AICMD0x12_Jump(pAIScripting0x44_L087)                                   ;B59EDD
pAIScripting0x44_L097:
    %AICMD0x1C_ShowDialog($041E, $00)                          ;B59EE0
    %AICMD0x41_AddValue16(nPlayerHappiness, 30)                ;B59EE4
    %AICMD0x12_Jump(pAIScripting0x44_L087)                                   ;B59EEA
pAIScripting0x44_L098:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $04, pAIScripting0x44_L099)   ;B59EED
    %AICMD0x15_JumpIfEquals8($80098C, 3, pAIScripting0x44_L100)              ;B59EF4
    %AICMD0x14_JumpIfFlagSet($800196, $04, pAIScripting0x44_L101)            ;B59EFB
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $05, pAIScripting0x44_L099)   ;B59F02
    %AICMD0x45_JumpIfBetween16(nLove_Ellen, 200, 220, pAIScripting0x44_L102) ;B59F09
    %AICMD0x45_JumpIfBetween16(nLove_Ellen, 221, 250, pAIScripting0x44_L103) ;B59F13
    %AICMD0x15_JumpIfEquals8(nCurrentWeekdayID, 0, pAIScripting0x44_L104)    ;B59F1D
    %AICMD0x15_JumpIfEquals8(nCurrentWeekdayID, 6, pAIScripting0x44_L105)    ;B59F24
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 0, pAIScripting0x44_L106)     ;B59F2B
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 1, pAIScripting0x44_L109)     ;B59F32
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 2, pAIScripting0x44_L111)     ;B59F39
pAIScripting0x44_L099:
    %AICMD0x1C_ShowDialog($0166, $00)                          ;B59F40
    %AICMD0x12_Jump(pAIScripting0x44_L087)                                   ;B59F44
pAIScripting0x44_L100:
    %AICMD0x1C_ShowDialog($015F, $00)                          ;B59F47
    %AICMD0x12_Jump(pAIScripting0x44_L087)                                   ;B59F4B
pAIScripting0x44_L101:
    %AICMD0x1C_ShowDialog($0160, $00)                          ;B59F4E
    %AICMD0x12_Jump(pAIScripting0x44_L087)                                   ;B59F52
pAIScripting0x44_L102:
    %AICMD0x1C_ShowDialog($01F3, $00)                          ;B59F55
    %AICMD0x12_Jump(pAIScripting0x44_L087)                                   ;B59F59
pAIScripting0x44_L103:
    %AICMD0x1C_ShowDialog($0049, $00)                          ;B59F5C
    %AICMD0x12_Jump(pAIScripting0x44_L087)                                   ;B59F60
pAIScripting0x44_L104:
    %AICMD0x1C_ShowDialog($0195, $00)                          ;B59F63
    %AICMD0x12_Jump(pAIScripting0x44_L087)                                   ;B59F67
pAIScripting0x44_L105:
    %AICMD0x1C_ShowDialog($047D, $00)                          ;B59F6A
    %AICMD0x12_Jump(pAIScripting0x44_L087)                                   ;B59F6E
pAIScripting0x44_L106:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 22, pAIScripting0x44_L108)         ;B59F71
    %AICMD0x17($02)                                            ;B59F78
    %AICMD0x18($00, pAIScripting0x44_L107)                                   ;B59F7A
    %AICMD0x1C_ShowDialog($0427, $00)                          ;B59F7E
    %AICMD0x12_Jump(pAIScripting0x44_L087)                                   ;B59F82
pAIScripting0x44_L107:
    %AICMD0x1C_ShowDialog($041F, $00)                          ;B59F85
    %AICMD0x12_Jump(pAIScripting0x44_L087)                                   ;B59F89
pAIScripting0x44_L108:
    %AICMD0x1C_ShowDialog($0209, $00)                          ;B59F8C
    %AICMD0x12_Jump(pAIScripting0x44_L087)                                   ;B59F90
pAIScripting0x44_L109:
    %AICMD0x17($02)                                            ;B59F93
    %AICMD0x18($00, pAIScripting0x44_L110)                                   ;B59F95
    %AICMD0x1C_ShowDialog($0429, $00)                          ;B59F99
    %AICMD0x12_Jump(pAIScripting0x44_L087)                                   ;B59F9D
pAIScripting0x44_L110:
    %AICMD0x1C_ShowDialog($018E, $00)                          ;B59FA0
    %AICMD0x12_Jump(pAIScripting0x44_L087)                                   ;B59FA4
pAIScripting0x44_L111:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 11, pAIScripting0x44_L113)         ;B59FA7
    %AICMD0x17($02)                                            ;B59FAE
    %AICMD0x18($00, pAIScripting0x44_L112)                                   ;B59FB0
    %AICMD0x1C_ShowDialog($0428, $00)                          ;B59FB4
    %AICMD0x12_Jump(pAIScripting0x44_L087)                                   ;B59FB8
pAIScripting0x44_L112:
    %AICMD0x1C_ShowDialog($0421, $00)                          ;B59FBB
    %AICMD0x12_Jump(pAIScripting0x44_L087)                                   ;B59FBF
pAIScripting0x44_L113:
    %AICMD0x1C_ShowDialog($023B, $00)                          ;B59FC2
    %AICMD0x12_Jump(pAIScripting0x44_L087)                                   ;B59FC6
pAIScripting0x44_L114:
    %AICMD0x10_End()                                           ;B59FC9


DATA8_B59FCA:
    %AICMD0x14_JumpIfFlagSet($800196, $01, pAIScripting0x44_L142)            ;B59FCA
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, pAIScripting0x44_L142)     ;B59FD1
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 6, 10, pAIScripting0x44_L142)  ;B59FD8
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 16, 18, pAIScripting0x44_L142) ;B59FE0
    %AICMD0x09($01, pAIScripting0x44_L143)                                   ;B59FE8
    %AICMD0x09($02, pAIScripting0x44_L145)                                   ;B59FEC
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 60, 89, pAIScripting0x44_L115);B59FF0
    %AICMD0x45_JumpIfBetween16(nSecondChildAge, 60, 89, pAIScripting0x44_L115);B59FFA
    %AICMD0x1A($0048, $0048, aAIScriptingData_L199, $03)                     ;B5A004
    %AICMD0x12_Jump(pAIScripting0x44_L116)                                   ;B5A00C
pAIScripting0x44_L115:
    %AICMD0x1A($0048, $0048, aAIScriptingData_L074, $00)                     ;B5A00F
pAIScripting0x44_L116:
    %AICMD0x2D(pAIScripting0x44_L126, pAIScripting0x44_L117)                               ;B5A017
    %AICMD0x12_Jump(pAIScripting0x44_L116)                                   ;B5A01C
pAIScripting0x44_L117:
    %AICMD0x15_JumpIfEquals8($80091E, 2, pAIScripting0x44_L118)              ;B5A01F
    %AICMD0x15_JumpIfEquals8($80091E, 7, pAIScripting0x44_L118)              ;B5A026
    %AICMD0x16_JumpIfBetween8($80091E, 1, 5, pAIScripting0x44_L119)          ;B5A02D
    %AICMD0x16_JumpIfBetween8($80091E, 16, 23, pAIScripting0x44_L119)        ;B5A035
    %AICMD0x15_JumpIfEquals8($80091E, 6, pAIScripting0x44_L120)              ;B5A03D
    %AICMD0x15_JumpIfEquals8($80091E, 25, pAIScripting0x44_L121)             ;B5A044
    %AICMD0x15_JumpIfEquals8($80091E, 73, pAIScripting0x44_L121)             ;B5A04B
    %AICMD0x16_JumpIfBetween8($80091E, 9, 12, pAIScripting0x44_L122)         ;B5A052
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B5A05A
    %AICMD0x12_Jump(pAIScripting0x44_L116)                                   ;B5A05E
pAIScripting0x44_L118:
    %AICMD0x1C_ShowDialog($03B4, $00)                          ;B5A061
    %AICMD0x41_AddValue16(nLove_Eve, -8)                       ;B5A065
    %AICMD0x12_Jump(pAIScripting0x44_L116)                                   ;B5A06B
pAIScripting0x44_L119:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $07, pAIScripting0x44_L123)   ;B5A06E
    %AICMD0x1C_ShowDialog($03B2, $00)                          ;B5A075
    %AICMD0x41_AddValue16(nLove_Eve, 4)                        ;B5A079
    %AICMD0x12_Jump(pAIScripting0x44_L116)                                   ;B5A07F
pAIScripting0x44_L120:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $07, pAIScripting0x44_L123)   ;B5A082
    %AICMD0x1C_ShowDialog($0212, $00)                          ;B5A089
    %AICMD0x41_AddValue16(nLove_Eve, 8)                        ;B5A08D
    %AICMD0x12_Jump(pAIScripting0x44_L116)                                   ;B5A093
pAIScripting0x44_L121:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $07, pAIScripting0x44_L123)   ;B5A096
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $08, pAIScripting0x44_L124)   ;B5A09D
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $09, pAIScripting0x44_L125)   ;B5A0A4
    %AICMD0x41_AddValue16(nLove_Eve, 8)                        ;B5A0AB
    %AICMD0x1C_ShowDialog($0212, $00)                          ;B5A0B1
    %AICMD0x12_Jump(pAIScripting0x44_L116)                                   ;B5A0B5
pAIScripting0x44_L122:
    %AICMD0x1C_ShowDialog($03BA, $00)                          ;B5A0B8
    %AICMD0x41_AddValue16(nLove_Eve, -4)                       ;B5A0BC
    %AICMD0x12_Jump(pAIScripting0x44_L116)                                   ;B5A0C2
pAIScripting0x44_L123:
    %AICMD0x1C_ShowDialog($01BD, $00)                          ;B5A0C5
    %AICMD0x41_AddValue16(nPlayerHappiness, 30)                ;B5A0C9
    %AICMD0x12_Jump(pAIScripting0x44_L116)                                   ;B5A0CF
pAIScripting0x44_L124:
    %AICMD0x1C_ShowDialog($041D, $00)                          ;B5A0D2
    %AICMD0x41_AddValue16(nPlayerHappiness, 30)                ;B5A0D6
    %AICMD0x12_Jump(pAIScripting0x44_L116)                                   ;B5A0DC
pAIScripting0x44_L125:
    %AICMD0x1C_ShowDialog($041E, $00)                          ;B5A0DF
    %AICMD0x41_AddValue16(nPlayerHappiness, 30)                ;B5A0E3
    %AICMD0x12_Jump(pAIScripting0x44_L116)                                   ;B5A0E9
pAIScripting0x44_L126:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $04, pAIScripting0x44_L127)   ;B5A0EC
    %AICMD0x15_JumpIfEquals8($80098C, 3, pAIScripting0x44_L128)              ;B5A0F3
    %AICMD0x14_JumpIfFlagSet($800196, $04, pAIScripting0x44_L129)            ;B5A0FA
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $05, pAIScripting0x44_L127)   ;B5A101
    %AICMD0x45_JumpIfBetween16(nLove_Eve, 200, 220, pAIScripting0x44_L130)   ;B5A108
    %AICMD0x45_JumpIfBetween16(nLove_Eve, 221, 250, pAIScripting0x44_L131)   ;B5A112
    %AICMD0x15_JumpIfEquals8(nCurrentWeekdayID, 0, pAIScripting0x44_L132)    ;B5A11C
    %AICMD0x15_JumpIfEquals8(nCurrentWeekdayID, 6, pAIScripting0x44_L133)    ;B5A123
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 0, pAIScripting0x44_L134)     ;B5A12A
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 1, pAIScripting0x44_L137)     ;B5A131
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 2, pAIScripting0x44_L139)     ;B5A138
pAIScripting0x44_L127:
    %AICMD0x1C_ShowDialog($0166, $00)                          ;B5A13F
    %AICMD0x12_Jump(pAIScripting0x44_L116)                                   ;B5A143
pAIScripting0x44_L128:
    %AICMD0x1C_ShowDialog($015F, $00)                          ;B5A146
    %AICMD0x12_Jump(pAIScripting0x44_L116)                                   ;B5A14A
pAIScripting0x44_L129:
    %AICMD0x1C_ShowDialog($0160, $00)                          ;B5A14D
    %AICMD0x12_Jump(pAIScripting0x44_L116)                                   ;B5A151
pAIScripting0x44_L130:
    %AICMD0x1C_ShowDialog($01F4, $00)                          ;B5A154
    %AICMD0x12_Jump(pAIScripting0x44_L116)                                   ;B5A158
pAIScripting0x44_L131:
    %AICMD0x1C_ShowDialog($0049, $00)                          ;B5A15B
    %AICMD0x12_Jump(pAIScripting0x44_L116)                                   ;B5A15F
pAIScripting0x44_L132:
    %AICMD0x1C_ShowDialog($0194, $00)                          ;B5A162
    %AICMD0x12_Jump(pAIScripting0x44_L116)                                   ;B5A166
pAIScripting0x44_L133:
    %AICMD0x1C_ShowDialog($047D, $00)                          ;B5A169
    %AICMD0x12_Jump(pAIScripting0x44_L116)                                   ;B5A16D
pAIScripting0x44_L134:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 22, pAIScripting0x44_L136)         ;B5A170
    %AICMD0x17($02)                                            ;B5A177
    %AICMD0x18($00, pAIScripting0x44_L135)                                   ;B5A179
    %AICMD0x1C_ShowDialog($042A, $00)                          ;B5A17D
    %AICMD0x12_Jump(pAIScripting0x44_L116)                                   ;B5A181
pAIScripting0x44_L135:
    %AICMD0x1C_ShowDialog($0188, $00)                          ;B5A184
    %AICMD0x12_Jump(pAIScripting0x44_L116)                                   ;B5A188
pAIScripting0x44_L136:
    %AICMD0x1C_ShowDialog($020A, $00)                          ;B5A18B
    %AICMD0x12_Jump(pAIScripting0x44_L116)                                   ;B5A18F
pAIScripting0x44_L137:
    %AICMD0x17($02)                                            ;B5A192
    %AICMD0x18($00, pAIScripting0x44_L138)                                   ;B5A194
    %AICMD0x1C_ShowDialog($042B, $00)                          ;B5A198
    %AICMD0x12_Jump(pAIScripting0x44_L116)                                   ;B5A19C
pAIScripting0x44_L138:
    %AICMD0x1C_ShowDialog($0193, $00)                          ;B5A19F
    %AICMD0x12_Jump(pAIScripting0x44_L116)                                   ;B5A1A3
pAIScripting0x44_L139:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 11, pAIScripting0x44_L141)         ;B5A1A6
    %AICMD0x17($02)                                            ;B5A1AD
    %AICMD0x18($00, pAIScripting0x44_L140)                                   ;B5A1AF
    %AICMD0x1C_ShowDialog($042C, $00)                          ;B5A1B3
    %AICMD0x12_Jump(pAIScripting0x44_L116)                                   ;B5A1B7
pAIScripting0x44_L140:
    %AICMD0x1C_ShowDialog($0192, $00)                          ;B5A1BA
    %AICMD0x12_Jump(pAIScripting0x44_L116)                                   ;B5A1BE
pAIScripting0x44_L141:
    %AICMD0x1C_ShowDialog($020A, $00)                          ;B5A1C1
    %AICMD0x12_Jump(pAIScripting0x44_L116)                                   ;B5A1C5
pAIScripting0x44_L142:
    %AICMD0x10_End()                                           ;B5A1C8
pAIScripting0x44_L143:
    %AICMD0x1A($0058, $0048, aAIScriptingData_L212, $00)                     ;B5A1C9
pAIScripting0x44_L144:
    %AICMD0x13_Wait(1)                                         ;B5A1D1
    %AICMD0x12_Jump(pAIScripting0x44_L144)                                   ;B5A1D4
pAIScripting0x44_L145:
    %AICMD0x1A($0038, $0058, aAIScriptingData_L212, $00)                     ;B5A1D7
pAIScripting0x44_L146:
    %AICMD0x13_Wait(1)                                         ;B5A1DF
    %AICMD0x12_Jump(pAIScripting0x44_L146)                                   ;B5A1E2


pAIScripting0x45:
    dw DATA8_B5A205                                            ;B5A1E5|        |B5A205;
    dw DATA8_B5A2FD                                            ;B5A1E7|        |B5A2FD;
    dw DATA8_B5A407                                            ;B5A1E9|        |B5A407;
    dw DATA8_B5A484                                            ;B5A1EB|        |B5A484;
    dw DATA8_B5A57C                                            ;B5A1ED|        |B5A57C;
    dw DATA8_B5A686                                            ;B5A1EF|        |B5A686;
    dw pAIScripting0x46                                        ;B5A1F1|        |B5A703;
    dw pAIScripting0x46                                        ;B5A1F3|        |B5A703;
    dw pAIScripting0x46                                        ;B5A1F5|        |B5A703;
    dw pAIScripting0x46                                        ;B5A1F7|        |B5A703;
    dw pAIScripting0x46                                        ;B5A1F9|        |B5A703;
    dw pAIScripting0x46                                        ;B5A1FB|        |B5A703;
    dw pAIScripting0x46                                        ;B5A1FD|        |B5A703;
    dw pAIScripting0x46                                        ;B5A1FF|        |B5A703;
    dw pAIScripting0x46                                        ;B5A201|        |B5A703;
    dw pAIScripting0x46                                        ;B5A203|        |B5A703;
 
DATA8_B5A205:
 
    %AICMD0x14_JumpIfFlagSet($800196, $01, pAIScripting0x45_L001)            ;B5A205
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, pAIScripting0x45_L001)     ;B5A20C
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 11, 14, pAIScripting0x45_L034) ;B5A213
pAIScripting0x45_L001:
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 0, 89, pAIScripting0x45_L017) ;B5A21B
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 15, 18, pAIScripting0x45_L011) ;B5A225
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 120, 999, pAIScripting0x45_L012);B5A22D
    %AICMD0x1A($0158, $0098, aAIScriptingData_L077, $00)                     ;B5A237
    %AICMD0x22($10, $10, $01, aAIScriptingData_L077, $04)                    ;B5A23F
pAIScripting0x45_L002:
    %AICMD0x2D(pAIScripting0x45_L008, pAIScripting0x45_L004)                               ;B5A246
    %AICMD0x12_Jump(pAIScripting0x45_L002)                                   ;B5A24B
pAIScripting0x45_L003:
    %AICMD0x13_Wait(1)                                         ;B5A24E
    %AICMD0x12_Jump(pAIScripting0x45_L003)                                   ;B5A251
pAIScripting0x45_L004:
    %AICMD0x15_JumpIfEquals8($80091E, 6, pAIScripting0x45_L005)              ;B5A254
    %AICMD0x16_JumpIfBetween8($80091E, 9, 12, pAIScripting0x45_L007)         ;B5A25B
    %AICMD0x1C_ShowDialog($01C2, $00)                          ;B5A263
    %AICMD0x12_Jump(pAIScripting0x45_L002)                                   ;B5A267
pAIScripting0x45_L005:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $08, pAIScripting0x45_L006)   ;B5A26A
    %AICMD0x1C_ShowDialog($01C2, $00)                          ;B5A271
    %AICMD0x12_Jump(pAIScripting0x45_L002)                                   ;B5A275
pAIScripting0x45_L006:
    %AICMD0x1C_ShowDialog($041D, $00)                          ;B5A278
    %AICMD0x41_AddValue16(nPlayerHappiness, 10)                ;B5A27C
    %AICMD0x12_Jump(pAIScripting0x45_L002)                                   ;B5A282
    %AICMD0x1C_ShowDialog($041E, $00)                          ;B5A285
    %AICMD0x41_AddValue16(nPlayerHappiness, 10)                ;B5A289
    %AICMD0x12_Jump(pAIScripting0x45_L002)                                   ;B5A28F
pAIScripting0x45_L007:
    %AICMD0x1C_ShowDialog($01D9, $00)                          ;B5A292
    %AICMD0x12_Jump(pAIScripting0x45_L002)                                   ;B5A296
pAIScripting0x45_L008:
    %AICMD0x17($02)                                            ;B5A299
    %AICMD0x18($00, pAIScripting0x45_L009)                                   ;B5A29B
    %AICMD0x18($01, pAIScripting0x45_L010)                                   ;B5A29F
    %AICMD0x12_Jump(pAIScripting0x45_L002)                                   ;B5A2A3
pAIScripting0x45_L009:
    %AICMD0x1C_ShowDialog($01C0, $00)                          ;B5A2A6
    %AICMD0x12_Jump(pAIScripting0x45_L002)                                   ;B5A2AA
pAIScripting0x45_L010:
    %AICMD0x1C_ShowDialog($01C2, $00)                          ;B5A2AD
    %AICMD0x12_Jump(pAIScripting0x45_L002)                                   ;B5A2B1
pAIScripting0x45_L011:
    %AICMD0x1A($0178, $0058, aAIScriptingData_L105, $00)                     ;B5A2B4
    %AICMD0x12_Jump(pAIScripting0x45_L003)                                   ;B5A2BC
pAIScripting0x45_L012:
    %AICMD0x1A($0158, $0098, aAIScriptingData_L079, $00)                     ;B5A2BF
    %AICMD0x22($10, $10, $01, aAIScriptingData_L079, $04)                    ;B5A2C7
pAIScripting0x45_L013:
    %AICMD0x2D(pAIScripting0x45_L014, pAIScripting0x45_L004)                               ;B5A2CE
    %AICMD0x12_Jump(pAIScripting0x45_L013)                                   ;B5A2D3
pAIScripting0x45_L014:
    %AICMD0x17($02)                                            ;B5A2D6
    %AICMD0x18($00, pAIScripting0x45_L015)                                   ;B5A2D8
    %AICMD0x18($01, pAIScripting0x45_L016)                                   ;B5A2DC
    %AICMD0x12_Jump(pAIScripting0x45_L013)                                   ;B5A2E0
pAIScripting0x45_L015:
    %AICMD0x1C_ShowDialog($01C1, $00)                          ;B5A2E3
    %AICMD0x12_Jump(pAIScripting0x45_L013)                                   ;B5A2E7
pAIScripting0x45_L016:
    %AICMD0x1C_ShowDialog($01C2, $00)                          ;B5A2EA
    %AICMD0x12_Jump(pAIScripting0x45_L013)                                   ;B5A2EE
pAIScripting0x45_L017:
    %AICMD0x1A($0186, $0098, aAIScriptingData_L106, $00)                     ;B5A2F1
pAIScripting0x45_L018:
    %AICMD0x52()                                               ;B5A2F9
    %AICMD0x12_Jump(pAIScripting0x45_L018)                                   ;B5A2FA


DATA8_B5A2FD:
 
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 0, 89, pAIScripting0x45_L034) ;B5A2FD
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $00, pAIScripting0x45_L019)   ;B5A307
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $01, pAIScripting0x45_L020)   ;B5A30E
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, pAIScripting0x45_L021)   ;B5A315
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $03, pAIScripting0x45_L022)   ;B5A31C
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $04, pAIScripting0x45_L023)   ;B5A323
    %AICMD0x12_Jump(pAIScripting0x45_L024)                                   ;B5A32A
pAIScripting0x45_L019:
    %AICMD0x12_Jump(pAIScripting0x45_L025)                                   ;B5A32D
pAIScripting0x45_L020:
    %AICMD0x12_Jump(pAIScripting0x45_L024)                                   ;B5A330
pAIScripting0x45_L021:
    %AICMD0x12_Jump(pAIScripting0x45_L028)                                   ;B5A333
pAIScripting0x45_L022:
    %AICMD0x12_Jump(pAIScripting0x45_L031)                                   ;B5A336
pAIScripting0x45_L023:
    %AICMD0x12_Jump(pAIScripting0x45_L024)                                   ;B5A339
pAIScripting0x45_L024:
    %AICMD0x10_End()                                           ;B5A33C
pAIScripting0x45_L025:
    %AICMD0x14_JumpIfFlagSet($800196, $01, pAIScripting0x45_L034)            ;B5A33D
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 6, 10, pAIScripting0x45_L034)  ;B5A344
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 15, 18, pAIScripting0x45_L034) ;B5A34C
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, pAIScripting0x45_L034)     ;B5A354
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 120, 999, pAIScripting0x45_L026);B5A35B
    %AICMD0x1A($0160, $0178, aAIScriptingData_L077, $00)                     ;B5A365
    %AICMD0x12_Jump(pAIScripting0x45_L027)                                   ;B5A36D
pAIScripting0x45_L026:
    %AICMD0x1A($0160, $0178, aAIScriptingData_L079, $00)                     ;B5A370
pAIScripting0x45_L027:
    %AICMD0x2D(pAIScripting0x45_L008, pAIScripting0x45_L004)                               ;B5A378
    %AICMD0x12_Jump(pAIScripting0x45_L027)                                   ;B5A37D
pAIScripting0x45_L028:
    %AICMD0x14_JumpIfFlagSet($800196, $01, pAIScripting0x45_L034)            ;B5A380
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 6, 10, pAIScripting0x45_L034)  ;B5A387
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 15, 18, pAIScripting0x45_L034) ;B5A38F
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, pAIScripting0x45_L034)     ;B5A397
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 120, 999, pAIScripting0x45_L029);B5A39E
    %AICMD0x1A($0160, $0178, aAIScriptingData_L077, $00)                     ;B5A3A8
    %AICMD0x12_Jump(pAIScripting0x45_L030)                                   ;B5A3B0
pAIScripting0x45_L029:
    %AICMD0x1A($0160, $0178, aAIScriptingData_L079, $00)                     ;B5A3B3
pAIScripting0x45_L030:
    %AICMD0x2D(pAIScripting0x45_L008, pAIScripting0x45_L004)                               ;B5A3BB
    %AICMD0x12_Jump(pAIScripting0x45_L030)                                   ;B5A3C0
pAIScripting0x45_L031:
    %AICMD0x14_JumpIfFlagSet($800196, $01, pAIScripting0x45_L034)            ;B5A3C3
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 6, 10, pAIScripting0x45_L034)  ;B5A3CA
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 15, 18, pAIScripting0x45_L034) ;B5A3D2
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, pAIScripting0x45_L034)     ;B5A3DA
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 120, 999, pAIScripting0x45_L032);B5A3E1
    %AICMD0x1A($0160, $0178, aAIScriptingData_L077, $00)                     ;B5A3EB
    %AICMD0x12_Jump(pAIScripting0x45_L033)                                   ;B5A3F3
pAIScripting0x45_L032:
    %AICMD0x1A($0160, $0178, aAIScriptingData_L079, $00)                     ;B5A3F6
pAIScripting0x45_L033:
    %AICMD0x2D(pAIScripting0x45_L008, pAIScripting0x45_L004)                               ;B5A3FE
    %AICMD0x12_Jump(pAIScripting0x45_L033)                                   ;B5A403
pAIScripting0x45_L034:
    %AICMD0x10_End()                                           ;B5A406


DATA8_B5A407:
 
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 0, 89, pAIScripting0x45_L040) ;B5A407
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $00, pAIScripting0x45_L035)   ;B5A411
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $01, pAIScripting0x45_L036)   ;B5A418
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, pAIScripting0x45_L037)   ;B5A41F
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $03, pAIScripting0x45_L038)   ;B5A426
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $04, pAIScripting0x45_L039)   ;B5A42D
    %AICMD0x12_Jump(pAIScripting0x45_L040)                                   ;B5A434
pAIScripting0x45_L035:
    %AICMD0x10_End()                                           ;B5A437
pAIScripting0x45_L036:
    %AICMD0x12_Jump(pAIScripting0x45_L041)                                   ;B5A438
pAIScripting0x45_L037:
    %AICMD0x10_End()                                           ;B5A43B
pAIScripting0x45_L038:
    %AICMD0x10_End()                                           ;B5A43C
pAIScripting0x45_L039:
    %AICMD0x12_Jump(pAIScripting0x45_L041)                                   ;B5A43D
pAIScripting0x45_L040:
    %AICMD0x10_End()                                           ;B5A440
pAIScripting0x45_L041:
    %AICMD0x14_JumpIfFlagSet($800196, $01, pAIScripting0x45_L034)            ;B5A441
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 6, 10, pAIScripting0x45_L034)  ;B5A448
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 15, 18, pAIScripting0x45_L034) ;B5A450
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, pAIScripting0x45_L034)     ;B5A458
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 120, 999, pAIScripting0x45_L042);B5A45F
    %AICMD0x1A($0088, $0048, aAIScriptingData_L077, $00)                     ;B5A469
    %AICMD0x12_Jump(pAIScripting0x45_L043)                                   ;B5A471
pAIScripting0x45_L042:
    %AICMD0x1A($0088, $0048, aAIScriptingData_L079, $00)                     ;B5A474
pAIScripting0x45_L043:
    %AICMD0x2D(pAIScripting0x45_L008, pAIScripting0x45_L004)                               ;B5A47C
    %AICMD0x12_Jump(pAIScripting0x45_L043)                                   ;B5A481


DATA8_B5A484:
 
    %AICMD0x14_JumpIfFlagSet($800196, $01, pAIScripting0x45_L044)            ;B5A484
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, pAIScripting0x45_L044)     ;B5A48B
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 11, 14, pAIScripting0x45_L077) ;B5A492
pAIScripting0x45_L044:
    %AICMD0x45_JumpIfBetween16(nSecondChildAge, 0, 89, pAIScripting0x45_L060);B5A49A
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 15, 18, pAIScripting0x45_L054) ;B5A4A4
    %AICMD0x45_JumpIfBetween16(nSecondChildAge, 120, 999, pAIScripting0x45_L055);B5A4AC
    %AICMD0x1A($0168, $0088, aAIScriptingData_L076, $02)                     ;B5A4B6
    %AICMD0x22($10, $10, $01, aAIScriptingData_L077, $04)                    ;B5A4BE
pAIScripting0x45_L045:
    %AICMD0x2D(pAIScripting0x45_L051, pAIScripting0x45_L047)                               ;B5A4C5
    %AICMD0x12_Jump(pAIScripting0x45_L045)                                   ;B5A4CA
pAIScripting0x45_L046:
    %AICMD0x13_Wait(1)                                         ;B5A4CD
    %AICMD0x12_Jump(pAIScripting0x45_L046)                                   ;B5A4D0
pAIScripting0x45_L047:
    %AICMD0x15_JumpIfEquals8($80091E, 6, pAIScripting0x45_L048)              ;B5A4D3
    %AICMD0x16_JumpIfBetween8($80091E, 9, 12, pAIScripting0x45_L050)         ;B5A4DA
    %AICMD0x1C_ShowDialog($01C2, $00)                          ;B5A4E2
    %AICMD0x12_Jump(pAIScripting0x45_L045)                                   ;B5A4E6
pAIScripting0x45_L048:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $08, pAIScripting0x45_L049)   ;B5A4E9
    %AICMD0x1C_ShowDialog($01C2, $00)                          ;B5A4F0
    %AICMD0x12_Jump(pAIScripting0x45_L045)                                   ;B5A4F4
pAIScripting0x45_L049:
    %AICMD0x1C_ShowDialog($041D, $00)                          ;B5A4F7
    %AICMD0x41_AddValue16(nPlayerHappiness, 10)                ;B5A4FB
    %AICMD0x12_Jump(pAIScripting0x45_L045)                                   ;B5A501
    %AICMD0x1C_ShowDialog($041E, $00)                          ;B5A504
    %AICMD0x41_AddValue16(nPlayerHappiness, 10)                ;B5A508
    %AICMD0x12_Jump(pAIScripting0x45_L045)                                   ;B5A50E
pAIScripting0x45_L050:
    %AICMD0x1C_ShowDialog($01D9, $00)                          ;B5A511
    %AICMD0x12_Jump(pAIScripting0x45_L045)                                   ;B5A515
pAIScripting0x45_L051:
    %AICMD0x17($02)                                            ;B5A518
    %AICMD0x18($00, pAIScripting0x45_L052)                                   ;B5A51A
    %AICMD0x18($01, pAIScripting0x45_L053)                                   ;B5A51E
    %AICMD0x12_Jump(pAIScripting0x45_L045)                                   ;B5A522
pAIScripting0x45_L052:
    %AICMD0x1C_ShowDialog($01C0, $00)                          ;B5A525
    %AICMD0x12_Jump(pAIScripting0x45_L045)                                   ;B5A529
pAIScripting0x45_L053:
    %AICMD0x1C_ShowDialog($01C2, $00)                          ;B5A52C
    %AICMD0x12_Jump(pAIScripting0x45_L045)                                   ;B5A530
pAIScripting0x45_L054:
    %AICMD0x1A($0188, $0058, aAIScriptingData_L105, $00)                     ;B5A533
    %AICMD0x12_Jump(pAIScripting0x45_L046)                                   ;B5A53B
pAIScripting0x45_L055:
    %AICMD0x1A($0168, $0088, aAIScriptingData_L078, $00)                     ;B5A53E
    %AICMD0x22($10, $0C, $01, aAIScriptingData_L079, $04)                    ;B5A546
pAIScripting0x45_L056:
    %AICMD0x2D(pAIScripting0x45_L057, pAIScripting0x45_L047)                               ;B5A54D
    %AICMD0x12_Jump(pAIScripting0x45_L056)                                   ;B5A552
pAIScripting0x45_L057:
    %AICMD0x17($02)                                            ;B5A555
    %AICMD0x18($00, pAIScripting0x45_L058)                                   ;B5A557
    %AICMD0x18($01, pAIScripting0x45_L059)                                   ;B5A55B
    %AICMD0x12_Jump(pAIScripting0x45_L056)                                   ;B5A55F
pAIScripting0x45_L058:
    %AICMD0x1C_ShowDialog($01C1, $00)                          ;B5A562
    %AICMD0x12_Jump(pAIScripting0x45_L056)                                   ;B5A566
pAIScripting0x45_L059:
    %AICMD0x1C_ShowDialog($01C2, $00)                          ;B5A569
    %AICMD0x12_Jump(pAIScripting0x45_L056)                                   ;B5A56D
pAIScripting0x45_L060:
    %AICMD0x1A($0186, $0098, aAIScriptingData_L106, $00)                     ;B5A570
pAIScripting0x45_L061:
    %AICMD0x53()                                               ;B5A578
    %AICMD0x12_Jump(pAIScripting0x45_L061)                                   ;B5A579


DATA8_B5A57C:
 
    %AICMD0x45_JumpIfBetween16(nSecondChildAge, 0, 89, pAIScripting0x45_L077);B5A57C
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $00, pAIScripting0x45_L062)   ;B5A586
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $01, pAIScripting0x45_L063)   ;B5A58D
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, pAIScripting0x45_L064)   ;B5A594
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $03, pAIScripting0x45_L065)   ;B5A59B
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $04, pAIScripting0x45_L066)   ;B5A5A2
    %AICMD0x12_Jump(pAIScripting0x45_L067)                                   ;B5A5A9
pAIScripting0x45_L062:
    %AICMD0x12_Jump(pAIScripting0x45_L068)                                   ;B5A5AC
pAIScripting0x45_L063:
    %AICMD0x12_Jump(pAIScripting0x45_L067)                                   ;B5A5AF
pAIScripting0x45_L064:
    %AICMD0x12_Jump(pAIScripting0x45_L071)                                   ;B5A5B2
pAIScripting0x45_L065:
    %AICMD0x12_Jump(pAIScripting0x45_L074)                                   ;B5A5B5
pAIScripting0x45_L066:
    %AICMD0x12_Jump(pAIScripting0x45_L067)                                   ;B5A5B8
pAIScripting0x45_L067:
    %AICMD0x10_End()                                           ;B5A5BB
pAIScripting0x45_L068:
    %AICMD0x14_JumpIfFlagSet($800196, $01, pAIScripting0x45_L077)            ;B5A5BC
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 6, 10, pAIScripting0x45_L077)  ;B5A5C3
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 15, 18, pAIScripting0x45_L077) ;B5A5CB
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, pAIScripting0x45_L077)     ;B5A5D3
    %AICMD0x45_JumpIfBetween16(nSecondChildAge, 120, 999, pAIScripting0x45_L069);B5A5DA
    %AICMD0x1A($0170, $0178, aAIScriptingData_L077, $00)                     ;B5A5E4
    %AICMD0x12_Jump(pAIScripting0x45_L070)                                   ;B5A5EC
pAIScripting0x45_L069:
    %AICMD0x1A($0170, $0178, aAIScriptingData_L079, $00)                     ;B5A5EF
pAIScripting0x45_L070:
    %AICMD0x2D(pAIScripting0x45_L051, pAIScripting0x45_L047)                               ;B5A5F7
    %AICMD0x12_Jump(pAIScripting0x45_L070)                                   ;B5A5FC
pAIScripting0x45_L071:
    %AICMD0x14_JumpIfFlagSet($800196, $01, pAIScripting0x45_L077)            ;B5A5FF
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 6, 10, pAIScripting0x45_L077)  ;B5A606
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 15, 18, pAIScripting0x45_L077) ;B5A60E
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, pAIScripting0x45_L077)     ;B5A616
    %AICMD0x45_JumpIfBetween16(nSecondChildAge, 120, 999, pAIScripting0x45_L072);B5A61D
    %AICMD0x1A($0170, $0178, aAIScriptingData_L077, $00)                     ;B5A627
    %AICMD0x12_Jump(pAIScripting0x45_L073)                                   ;B5A62F
pAIScripting0x45_L072:
    %AICMD0x1A($0170, $0178, aAIScriptingData_L079, $00)                     ;B5A632
pAIScripting0x45_L073:
    %AICMD0x2D(pAIScripting0x45_L051, pAIScripting0x45_L047)                               ;B5A63A
    %AICMD0x12_Jump(pAIScripting0x45_L073)                                   ;B5A63F
pAIScripting0x45_L074:
    %AICMD0x14_JumpIfFlagSet($800196, $01, pAIScripting0x45_L077)            ;B5A642
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 6, 10, pAIScripting0x45_L077)  ;B5A649
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 15, 18, pAIScripting0x45_L077) ;B5A651
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, pAIScripting0x45_L077)     ;B5A659
    %AICMD0x45_JumpIfBetween16(nSecondChildAge, 120, 999, pAIScripting0x45_L075);B5A660
    %AICMD0x1A($0170, $0178, aAIScriptingData_L077, $00)                     ;B5A66A
    %AICMD0x12_Jump(pAIScripting0x45_L076)                                   ;B5A672
pAIScripting0x45_L075:
    %AICMD0x1A($0170, $0178, aAIScriptingData_L079, $00)                     ;B5A675
pAIScripting0x45_L076:
    %AICMD0x2D(pAIScripting0x45_L051, pAIScripting0x45_L047)                               ;B5A67D
    %AICMD0x12_Jump(pAIScripting0x45_L076)                                   ;B5A682
pAIScripting0x45_L077:
    %AICMD0x10_End()                                           ;B5A685


DATA8_B5A686:
    %AICMD0x45_JumpIfBetween16(nSecondChildAge, 0, 89, pAIScripting0x45_L083);B5A686
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $00, pAIScripting0x45_L078)   ;B5A690
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $01, pAIScripting0x45_L079)   ;B5A697
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, pAIScripting0x45_L080)   ;B5A69E
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $03, pAIScripting0x45_L081)   ;B5A6A5
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $04, pAIScripting0x45_L082)   ;B5A6AC
    %AICMD0x12_Jump(pAIScripting0x45_L083)                                   ;B5A6B3
pAIScripting0x45_L078:
    %AICMD0x10_End()                                           ;B5A6B6
pAIScripting0x45_L079:
    %AICMD0x12_Jump(pAIScripting0x45_L084)                                   ;B5A6B7
pAIScripting0x45_L080:
    %AICMD0x10_End()                                           ;B5A6BA
pAIScripting0x45_L081:
    %AICMD0x10_End()                                           ;B5A6BB
pAIScripting0x45_L082:
    %AICMD0x12_Jump(pAIScripting0x45_L084)                                   ;B5A6BC
pAIScripting0x45_L083:
    %AICMD0x10_End()                                           ;B5A6BF
pAIScripting0x45_L084:
    %AICMD0x14_JumpIfFlagSet($800196, $01, pAIScripting0x45_L077)            ;B5A6C0
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 6, 10, pAIScripting0x45_L077)  ;B5A6C7
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 15, 18, pAIScripting0x45_L077) ;B5A6CF
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, pAIScripting0x45_L077)     ;B5A6D7
    %AICMD0x45_JumpIfBetween16(nSecondChildAge, 120, 999, pAIScripting0x45_L085);B5A6DE
    %AICMD0x1A($0068, $0048, aAIScriptingData_L077, $00)                     ;B5A6E8
    %AICMD0x12_Jump(pAIScripting0x45_L086)                                   ;B5A6F0
pAIScripting0x45_L085:
    %AICMD0x1A($0068, $0048, aAIScriptingData_L079, $00)                     ;B5A6F3
pAIScripting0x45_L086:
    %AICMD0x2D(pAIScripting0x45_L051, pAIScripting0x45_L047)                               ;B5A6FB
    %AICMD0x12_Jump(pAIScripting0x45_L086)                                   ;B5A700


pAIScripting0x46:
    dw DATA8_B5A723                                            ;B5A703|        |B5A723;
    dw DATA8_B5A73D                                            ;B5A705|        |B5A73D;
    dw DATA8_B5A757                                            ;B5A707|        |B5A757;
    dw DATA8_B5A771                                            ;B5A709|        |B5A771;
    dw DATA8_B5A78B                                            ;B5A70B|        |B5A78B;
    dw DATA8_B5A7A5                                            ;B5A70D|        |B5A7A5;
    dw DATA8_B5A7BF                                            ;B5A70F|        |B5A7BF;
    dw DATA8_B5A7D9                                            ;B5A711|        |B5A7D9;
    dw DATA8_B5A7F3                                            ;B5A713|        |B5A7F3;
    dw DATA8_B5A80D                                            ;B5A715|        |B5A80D;
    dw DATA8_B5A827                                            ;B5A717|        |B5A827;
    dw DATA8_B5A841                                            ;B5A719|        |B5A841;
    dw DATA8_B5A85D                                            ;B5A71B|        |B5A85D;
    dw pAIScripting0x47_HowToPlay                              ;B5A71D|        |B5AC6E;
    dw pAIScripting0x47_HowToPlay                              ;B5A71F|        |B5AC6E;
    dw pAIScripting0x47_HowToPlay                              ;B5A721|        |B5AC6E;
 
DATA8_B5A723:
 
    %AICMD0x00_SetMusic($0B, $B4)                              ;B5A723
    %AICMD0x02_FreezeTime()                                    ;B5A726
    %AICMD0x03_SetHour($06)                                    ;B5A727
    %AICMD0x40_DisableTileInteractions()                       ;B5A729
    %AICMD0x05_SetTransferPosition(128, 128)                   ;B5A72A
    %AICMD0x19($00E8, $00)                                     ;B5A72F
    %AICMD0x08_EnableAIControl()                               ;B5A733
    %AICMD0x06_SetDestinationArea(!AREA_CREDITS0)              ;B5A734
    %AICMD0x38()                                               ;B5A736
    %AICMD0x13_Wait(180)                                       ;B5A737
    %AICMD0x3D_TeleportToArea(!AREA_ENDING00)                  ;B5A73A
    %AICMD0x10_End()                                           ;B5A73C


DATA8_B5A73D:
 
    %AICMD0x00_SetMusic($0B, $B4)                              ;B5A73D
    %AICMD0x02_FreezeTime()                                    ;B5A740
    %AICMD0x03_SetHour($06)                                    ;B5A741
    %AICMD0x40_DisableTileInteractions()                       ;B5A743
    %AICMD0x05_SetTransferPosition(384, 128)                   ;B5A744
    %AICMD0x19($00E8, $00)                                     ;B5A749
    %AICMD0x08_EnableAIControl()                               ;B5A74D
    %AICMD0x06_SetDestinationArea(!AREA_CREDITS1)              ;B5A74E
    %AICMD0x38()                                               ;B5A750
    %AICMD0x13_Wait(180)                                       ;B5A751
    %AICMD0x3D_TeleportToArea(!AREA_ENDING00)                  ;B5A754
    %AICMD0x10_End()                                           ;B5A756


DATA8_B5A757:
 
    %AICMD0x00_SetMusic($0B, $B4)                              ;B5A757
    %AICMD0x02_FreezeTime()                                    ;B5A75A
    %AICMD0x03_SetHour($06)                                    ;B5A75B
    %AICMD0x40_DisableTileInteractions()                       ;B5A75D
    %AICMD0x05_SetTransferPosition(128, 384)                   ;B5A75E
    %AICMD0x19($00E8, $00)                                     ;B5A763
    %AICMD0x08_EnableAIControl()                               ;B5A767
    %AICMD0x06_SetDestinationArea(!AREA_CREDITS2)              ;B5A768
    %AICMD0x38()                                               ;B5A76A
    %AICMD0x13_Wait(180)                                       ;B5A76B
    %AICMD0x3D_TeleportToArea(!AREA_ENDING00)                  ;B5A76E
    %AICMD0x10_End()                                           ;B5A770


DATA8_B5A771:
 
    %AICMD0x00_SetMusic($0B, $B4)                              ;B5A771
    %AICMD0x02_FreezeTime()                                    ;B5A774
    %AICMD0x03_SetHour($06)                                    ;B5A775
    %AICMD0x40_DisableTileInteractions()                       ;B5A777
    %AICMD0x05_SetTransferPosition(384, 384)                   ;B5A778
    %AICMD0x19($00E8, $00)                                     ;B5A77D
    %AICMD0x08_EnableAIControl()                               ;B5A781
    %AICMD0x06_SetDestinationArea(!AREA_CREDITS3)              ;B5A782
    %AICMD0x38()                                               ;B5A784
    %AICMD0x13_Wait(180)                                       ;B5A785
    %AICMD0x3D_TeleportToArea(!AREA_ENDING00)                  ;B5A788
    %AICMD0x10_End()                                           ;B5A78A


DATA8_B5A78B:
 
    %AICMD0x00_SetMusic($0B, $B4)                              ;B5A78B
    %AICMD0x02_FreezeTime()                                    ;B5A78E
    %AICMD0x03_SetHour($06)                                    ;B5A78F
    %AICMD0x40_DisableTileInteractions()                       ;B5A791
    %AICMD0x05_SetTransferPosition(128, 128)                   ;B5A792
    %AICMD0x19($00E8, $00)                                     ;B5A797
    %AICMD0x08_EnableAIControl()                               ;B5A79B
    %AICMD0x06_SetDestinationArea(!AREA_CREDITS4)              ;B5A79C
    %AICMD0x38()                                               ;B5A79E
    %AICMD0x13_Wait(180)                                       ;B5A79F
    %AICMD0x3D_TeleportToArea(!AREA_ENDING00)                  ;B5A7A2
    %AICMD0x10_End()                                           ;B5A7A4


DATA8_B5A7A5:
 
    %AICMD0x00_SetMusic($0B, $B4)                              ;B5A7A5
    %AICMD0x02_FreezeTime()                                    ;B5A7A8
    %AICMD0x03_SetHour($06)                                    ;B5A7A9
    %AICMD0x40_DisableTileInteractions()                       ;B5A7AB
    %AICMD0x05_SetTransferPosition(384, 128)                   ;B5A7AC
    %AICMD0x19($00E8, $00)                                     ;B5A7B1
    %AICMD0x08_EnableAIControl()                               ;B5A7B5
    %AICMD0x06_SetDestinationArea(!AREA_DRIVETOTOWN)           ;B5A7B6
    %AICMD0x38()                                               ;B5A7B8
    %AICMD0x13_Wait(180)                                       ;B5A7B9
    %AICMD0x3D_TeleportToArea(!AREA_ENDING00)                  ;B5A7BC
    %AICMD0x10_End()                                           ;B5A7BE


DATA8_B5A7BF:
 
    %AICMD0x00_SetMusic($0B, $B4)                              ;B5A7BF
    %AICMD0x02_FreezeTime()                                    ;B5A7C2
    %AICMD0x03_SetHour($06)                                    ;B5A7C3
    %AICMD0x40_DisableTileInteractions()                       ;B5A7C5
    %AICMD0x05_SetTransferPosition(128, 384)                   ;B5A7C6
    %AICMD0x19($00E8, $00)                                     ;B5A7CB
    %AICMD0x08_EnableAIControl()                               ;B5A7CF
    %AICMD0x06_SetDestinationArea(!AREA_UNKNOWN51)             ;B5A7D0
    %AICMD0x38()                                               ;B5A7D2
    %AICMD0x13_Wait(180)                                       ;B5A7D3
    %AICMD0x3D_TeleportToArea(!AREA_ENDING00)                  ;B5A7D6
    %AICMD0x10_End()                                           ;B5A7D8


DATA8_B5A7D9:
 
    %AICMD0x00_SetMusic($0B, $B4)                              ;B5A7D9
    %AICMD0x02_FreezeTime()                                    ;B5A7DC
    %AICMD0x03_SetHour($06)                                    ;B5A7DD
    %AICMD0x40_DisableTileInteractions()                       ;B5A7DF
    %AICMD0x05_SetTransferPosition(384, 384)                   ;B5A7E0
    %AICMD0x19($00E8, $00)                                     ;B5A7E5
    %AICMD0x08_EnableAIControl()                               ;B5A7E9
    %AICMD0x06_SetDestinationArea(!AREA_UNKNOWN52)             ;B5A7EA
    %AICMD0x38()                                               ;B5A7EC
    %AICMD0x13_Wait(180)                                       ;B5A7ED
    %AICMD0x3D_TeleportToArea(!AREA_ENDING00)                  ;B5A7F0
    %AICMD0x10_End()                                           ;B5A7F2


DATA8_B5A7F3:
 
    %AICMD0x00_SetMusic($0B, $B4)                              ;B5A7F3
    %AICMD0x02_FreezeTime()                                    ;B5A7F6
    %AICMD0x03_SetHour($06)                                    ;B5A7F7
    %AICMD0x40_DisableTileInteractions()                       ;B5A7F9
    %AICMD0x05_SetTransferPosition(384, 384)                   ;B5A7FA
    %AICMD0x19($00E8, $00)                                     ;B5A7FF
    %AICMD0x08_EnableAIControl()                               ;B5A803
    %AICMD0x06_SetDestinationArea(!AREA_UNKNOWN56)             ;B5A804
    %AICMD0x38()                                               ;B5A806
    %AICMD0x13_Wait(180)                                       ;B5A807
    %AICMD0x3D_TeleportToArea(!AREA_ENDING00)                  ;B5A80A
    %AICMD0x10_End()                                           ;B5A80C


DATA8_B5A80D:
 
    %AICMD0x00_SetMusic($0B, $B4)                              ;B5A80D
    %AICMD0x02_FreezeTime()                                    ;B5A810
    %AICMD0x03_SetHour($06)                                    ;B5A811
    %AICMD0x40_DisableTileInteractions()                       ;B5A813
    %AICMD0x05_SetTransferPosition(128, 128)                   ;B5A814
    %AICMD0x19($00E8, $00)                                     ;B5A819
    %AICMD0x08_EnableAIControl()                               ;B5A81D
    %AICMD0x06_SetDestinationArea(!AREA_UNKNOWN53)             ;B5A81E
    %AICMD0x38()                                               ;B5A820
    %AICMD0x13_Wait(180)                                       ;B5A821
    %AICMD0x3D_TeleportToArea(!AREA_ENDING00)                  ;B5A824
    %AICMD0x10_End()                                           ;B5A826


DATA8_B5A827:
 
    %AICMD0x00_SetMusic($0B, $B4)                              ;B5A827
    %AICMD0x02_FreezeTime()                                    ;B5A82A
    %AICMD0x03_SetHour($06)                                    ;B5A82B
    %AICMD0x40_DisableTileInteractions()                       ;B5A82D
    %AICMD0x05_SetTransferPosition(384, 128)                   ;B5A82E
    %AICMD0x19($00E8, $00)                                     ;B5A833
    %AICMD0x08_EnableAIControl()                               ;B5A837
    %AICMD0x06_SetDestinationArea(!AREA_UNKNOWN54)             ;B5A838
    %AICMD0x38()                                               ;B5A83A
    %AICMD0x13_Wait(180)                                       ;B5A83B
    %AICMD0x3D_TeleportToArea(!AREA_ENDING00)                  ;B5A83E
    %AICMD0x10_End()                                           ;B5A840


DATA8_B5A841:
 
    %AICMD0x00_SetMusic($0B, $B4)                              ;B5A841
    %AICMD0x4F()                                               ;B5A844
    %AICMD0x50()                                               ;B5A845
    %AICMD0x02_FreezeTime()                                    ;B5A846
    %AICMD0x03_SetHour($06)                                    ;B5A847
    %AICMD0x40_DisableTileInteractions()                       ;B5A849
    %AICMD0x05_SetTransferPosition(128, 384)                   ;B5A84A
    %AICMD0x19($00E8, $00)                                     ;B5A84F
    %AICMD0x08_EnableAIControl()                               ;B5A853
    %AICMD0x06_SetDestinationArea(!AREA_UNKNOWN55)             ;B5A854
    %AICMD0x38()                                               ;B5A856
    %AICMD0x13_Wait(180)                                       ;B5A857
    %AICMD0x3D_TeleportToArea(!AREA_ENDING00)                  ;B5A85A
    %AICMD0x10_End()                                           ;B5A85C


DATA8_B5A85D:
    %AICMD0x00_SetMusic($0E, $B4)                              ;B5A85D
    %AICMD0x01_UnfreezeTime()                                  ;B5A860
    %AICMD0x03_SetHour($10)                                    ;B5A861
    %AICMD0x40_DisableTileInteractions()                       ;B5A863
    %AICMD0x08_EnableAIControl()                               ;B5A864
    %AICMD0x05_SetTransferPosition(120, 456)                   ;B5A865
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B5A86A
    %AICMD0x06_SetDestinationArea(!AREA_MNTTOPENDINGSUMMER)    ;B5A86C
    %AICMD0x38()                                               ;B5A86E
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 176)                   ;B5A86F
    %AICMD0x13_Wait(60)                                        ;B5A873
    %AICMD0x29_SetMapScrooling(0, -1, 208)                     ;B5A876
    %AICMD0x13_Wait(240)                                       ;B5A87C
    %AICMD0x13_Wait(64)                                        ;B5A87F
    %AICMD0x54_ShowDialog($0444, $01)                          ;B5A882
    %AICMD0x13_Wait(120)                                       ;B5A886
    %AICMD0x54_ShowDialog($0445, $01)                          ;B5A889
    %AICMD0x13_Wait(120)                                       ;B5A88D
    %AICMD0x54_ShowDialog($0446, $01)                          ;B5A890
    %AICMD0x13_Wait(120)                                       ;B5A894
    %AICMD0x54_ShowDialog($044D, $01)                          ;B5A897
    %AICMD0x13_Wait(120)                                       ;B5A89B
    %AICMD0x54_ShowDialog($044E, $01)                          ;B5A89E
    %AICMD0x13_Wait(120)                                       ;B5A8A2
    %AICMD0x54_ShowDialog($044F, $01)                          ;B5A8A5
    %AICMD0x13_Wait(120)                                       ;B5A8A9
    %AICMD0x54_ShowDialog($0450, $01)                          ;B5A8AC
    %AICMD0x13_Wait(120)                                       ;B5A8B0
    %AICMD0x54_ShowDialog($0447, $01)                          ;B5A8B3
    %AICMD0x13_Wait(120)                                       ;B5A8B7
    %AICMD0x54_ShowDialog($0448, $01)                          ;B5A8BA
    %AICMD0x13_Wait(120)                                       ;B5A8BE
    %AICMD0x54_ShowDialog($0449, $01)                          ;B5A8C1
    %AICMD0x13_Wait(120)                                       ;B5A8C5
    %AICMD0x54_ShowDialog($044A, $01)                          ;B5A8C8
    %AICMD0x13_Wait(120)                                       ;B5A8CC
    %AICMD0x54_ShowDialog($044B, $01)                          ;B5A8CF
    %AICMD0x13_Wait(120)                                       ;B5A8D3
    %AICMD0x54_ShowDialog($044C, $01)                          ;B5A8D6
    %AICMD0x13_Wait(120)                                       ;B5A8DA
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $07, pAIScripting0x46_L002)   ;B5A8DD
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $06, pAIScripting0x46_L001)   ;B5A8E4
    %AICMD0x54_ShowDialog($0451, $01)                          ;B5A8EB
    %AICMD0x12_Jump(pAIScripting0x46_L003)                                   ;B5A8EF
pAIScripting0x46_L001:
    %AICMD0x54_ShowDialog($0452, $01)                          ;B5A8F2
    %AICMD0x12_Jump(pAIScripting0x46_L003)                                   ;B5A8F6
pAIScripting0x46_L002:
    %AICMD0x54_ShowDialog($0453, $01)                          ;B5A8F9
pAIScripting0x46_L003:
    %AICMD0x13_Wait(120)                                       ;B5A8FD
    %AICMD0x54_ShowDialog($048C, $01)                          ;B5A900
    %AICMD0x13_Wait(120)                                       ;B5A904
    %AICMD0x54_ShowDialog($0454, $01)                          ;B5A907
    %AICMD0x13_Wait(120)                                       ;B5A90B
    %AICMD0x45_JumpIfBetween16(nRanchMasteringRate, 0, 199, pAIScripting0x46_L004);B5A90E
    %AICMD0x45_JumpIfBetween16(nRanchMasteringRate, 200, 399, pAIScripting0x46_L005);B5A918
    %AICMD0x45_JumpIfBetween16(nRanchMasteringRate, 400, 599, pAIScripting0x46_L006);B5A922
    %AICMD0x45_JumpIfBetween16(nRanchMasteringRate, 600, 799, pAIScripting0x46_L007);B5A92C
    %AICMD0x45_JumpIfBetween16(nRanchMasteringRate, 800, 999, pAIScripting0x46_L008);B5A936
pAIScripting0x46_L004:
    %AICMD0x54_ShowDialog($0483, $01)                          ;B5A940
    %AICMD0x12_Jump(pAIScripting0x46_L009)                                   ;B5A944
pAIScripting0x46_L005:
    %AICMD0x54_ShowDialog($0488, $01)                          ;B5A947
    %AICMD0x12_Jump(pAIScripting0x46_L009)                                   ;B5A94B
pAIScripting0x46_L006:
    %AICMD0x54_ShowDialog($0489, $01)                          ;B5A94E
    %AICMD0x12_Jump(pAIScripting0x46_L009)                                   ;B5A952
pAIScripting0x46_L007:
    %AICMD0x54_ShowDialog($048A, $01)                          ;B5A955
    %AICMD0x12_Jump(pAIScripting0x46_L009)                                   ;B5A959
pAIScripting0x46_L008:
    %AICMD0x54_ShowDialog($048B, $01)                          ;B5A95C
    %AICMD0x12_Jump(pAIScripting0x46_L009)                                   ;B5A960
pAIScripting0x46_L009:
    %AICMD0x19($00E8, $00)                                     ;B5A963
    %AICMD0x09($01, pAIScripting0x46_L019)                                   ;B5A967
    %AICMD0x12_Jump(pAIScripting0x46_L010)                                   ;B5A96B
pAIScripting0x46_L010:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $00, pAIScripting0x46_L011)   ;B5A96E
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $01, pAIScripting0x46_L012)   ;B5A975
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, pAIScripting0x46_L013)   ;B5A97C
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $03, pAIScripting0x46_L014)   ;B5A983
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $04, pAIScripting0x46_L015)   ;B5A98A
    %AICMD0x45_JumpIfBetween16(nPlayerHappiness, 0, 299, pAIScripting0x46_L016);B5A991
    %AICMD0x12_Jump(pAIScripting0x46_L017)                                   ;B5A99B
pAIScripting0x46_L011:
    %AICMD0x09($02, pAIScripting0x46_L020)                                   ;B5A99E
    %AICMD0x12_Jump(pAIScripting0x46_L018)                                   ;B5A9A2
pAIScripting0x46_L012:
    %AICMD0x09($02, pAIScripting0x46_L021)                                   ;B5A9A5
    %AICMD0x12_Jump(pAIScripting0x46_L018)                                   ;B5A9A9
pAIScripting0x46_L013:
    %AICMD0x09($02, pAIScripting0x46_L022)                                   ;B5A9AC
    %AICMD0x12_Jump(pAIScripting0x46_L018)                                   ;B5A9B0
pAIScripting0x46_L014:
    %AICMD0x09($02, pAIScripting0x46_L023)                                   ;B5A9B3
    %AICMD0x12_Jump(pAIScripting0x46_L018)                                   ;B5A9B7
pAIScripting0x46_L015:
    %AICMD0x09($02, pAIScripting0x46_L024)                                   ;B5A9BA
    %AICMD0x12_Jump(pAIScripting0x46_L018)                                   ;B5A9BE
pAIScripting0x46_L016:
    %AICMD0x09($03, pAIScripting0x46_L029)                                   ;B5A9C1
    %AICMD0x12_Jump(pAIScripting0x46_L018)                                   ;B5A9C5
pAIScripting0x46_L017:
    %AICMD0x09($04, pAIScripting0x46_L028)                                   ;B5A9C8
    %AICMD0x12_Jump(pAIScripting0x46_L018)                                   ;B5A9CC
pAIScripting0x46_L018:
    %AICMD0x29_SetMapScrooling(0, 1, 208)                      ;B5A9CF
    %AICMD0x13_Wait(240)                                       ;B5A9D5
    %AICMD0x0B($03)                                            ;B5A9D8
    %AICMD0x0C($02)                                            ;B5A9DA
    %AICMD0x13_Wait(60)                                        ;B5A9DC
    %AICMD0x29_SetMapScrooling(0, -1, 128)                     ;B5A9DF
    %AICMD0x13_Wait(240)                                       ;B5A9E5
    %AICMD0x10_End()                                           ;B5A9E8
pAIScripting0x46_L019:
    %AICMD0x1A($0078, $0118, aAIScriptingData, $01)                     ;B5A9E9
    %AICMD0x0C($00)                                            ;B5A9F1
    %AICMD0x1B($0007, $01)                                     ;B5A9F3
    %AICMD0x13_Wait(120)                                       ;B5A9F7
    %AICMD0x1B($0006, $00)                                     ;B5A9FA
    %AICMD0x13_Wait(180)                                       ;B5A9FE
    %AICMD0x1B($0005, $00)                                     ;B5AA01
    %AICMD0x0C($01)                                            ;B5AA05
    %AICMD0x1B($0000, $00)                                     ;B5AA07
    %AICMD0x0D($00, $01, $80, $01)                             ;B5AA0B
    %AICMD0x0B($02)                                            ;B5AA10
    %AICMD0x37()                                               ;B5AA12
    %AICMD0x10_End()                                           ;B5AA13
pAIScripting0x46_L020:
    %AICMD0x1A($0088, $0188, aAIScriptingData_L071, $01)                     ;B5AA14
    %AICMD0x0C($03)                                            ;B5AA1C
    %AICMD0x1B($02E5, $00)                                     ;B5AA1E
    %AICMD0x0D($00, $FF, $70, $01)                             ;B5AA22
    %AICMD0x1B($02E6, $00)                                     ;B5AA27
    %AICMD0x0B($00)                                            ;B5AA2B
    %AICMD0x14_JumpIfFlagSet(strcFlags.event6, $02, pAIScripting0x46_L025)   ;B5AA2D
    %AICMD0x14_JumpIfFlagSet(strcFlags.event6, $03, pAIScripting0x46_L025)   ;B5AA34
    %AICMD0x45_JumpIfBetween16(nLove_Maria, 0, 250, pAIScripting0x46_L026)   ;B5AA3B
    %AICMD0x54_ShowDialog($0468, $01)                          ;B5AA45
    %AICMD0x12_Jump(pAIScripting0x46_L027)                                   ;B5AA49
pAIScripting0x46_L021:
    %AICMD0x1A($0088, $0188, aAIScriptingData_L071, $01)                     ;B5AA4C
    %AICMD0x0C($03)                                            ;B5AA54
    %AICMD0x1B($02E5, $00)                                     ;B5AA56
    %AICMD0x0D($00, $FF, $70, $01)                             ;B5AA5A
    %AICMD0x1B($02E6, $00)                                     ;B5AA5F
    %AICMD0x0B($00)                                            ;B5AA63
    %AICMD0x14_JumpIfFlagSet(strcFlags.event6, $02, pAIScripting0x46_L025)   ;B5AA65
    %AICMD0x14_JumpIfFlagSet(strcFlags.event6, $03, pAIScripting0x46_L025)   ;B5AA6C
    %AICMD0x45_JumpIfBetween16(nLove_Ann, 0, 250, pAIScripting0x46_L026)     ;B5AA73
    %AICMD0x54_ShowDialog($0468, $01)                          ;B5AA7D
    %AICMD0x12_Jump(pAIScripting0x46_L027)                                   ;B5AA81
pAIScripting0x46_L022:
    %AICMD0x1A($0088, $0188, aAIScriptingData_L071, $01)                     ;B5AA84
    %AICMD0x0C($03)                                            ;B5AA8C
    %AICMD0x1B($02E5, $00)                                     ;B5AA8E
    %AICMD0x0D($00, $FF, $70, $01)                             ;B5AA92
    %AICMD0x1B($02E6, $00)                                     ;B5AA97
    %AICMD0x0B($00)                                            ;B5AA9B
    %AICMD0x14_JumpIfFlagSet(strcFlags.event6, $02, pAIScripting0x46_L025)   ;B5AA9D
    %AICMD0x14_JumpIfFlagSet(strcFlags.event6, $03, pAIScripting0x46_L025)   ;B5AAA4
    %AICMD0x45_JumpIfBetween16(nLove_Nina, 0, 250, pAIScripting0x46_L026)    ;B5AAAB
    %AICMD0x54_ShowDialog($0468, $01)                          ;B5AAB5
    %AICMD0x12_Jump(pAIScripting0x46_L027)                                   ;B5AAB9
pAIScripting0x46_L023:
    %AICMD0x1A($0088, $0188, aAIScriptingData_L071, $01)                     ;B5AABC
    %AICMD0x0C($03)                                            ;B5AAC4
    %AICMD0x1B($02E5, $00)                                     ;B5AAC6
    %AICMD0x0D($00, $FF, $70, $01)                             ;B5AACA
    %AICMD0x1B($02E6, $00)                                     ;B5AACF
    %AICMD0x0B($00)                                            ;B5AAD3
    %AICMD0x14_JumpIfFlagSet(strcFlags.event6, $02, pAIScripting0x46_L025)   ;B5AAD5
    %AICMD0x14_JumpIfFlagSet(strcFlags.event6, $03, pAIScripting0x46_L025)   ;B5AADC
    %AICMD0x45_JumpIfBetween16(nLove_Ellen, 0, 250, pAIScripting0x46_L026)   ;B5AAE3
    %AICMD0x54_ShowDialog($0468, $01)                          ;B5AAED
    %AICMD0x12_Jump(pAIScripting0x46_L027)                                   ;B5AAF1
pAIScripting0x46_L024:
    %AICMD0x1A($0088, $0188, aAIScriptingData_L071, $01)                     ;B5AAF4
    %AICMD0x0C($03)                                            ;B5AAFC
    %AICMD0x1B($02E5, $00)                                     ;B5AAFE
    %AICMD0x0D($00, $FF, $70, $01)                             ;B5AB02
    %AICMD0x1B($02E6, $00)                                     ;B5AB07
    %AICMD0x0B($00)                                            ;B5AB0B
    %AICMD0x14_JumpIfFlagSet(strcFlags.event6, $02, pAIScripting0x46_L025)   ;B5AB0D
    %AICMD0x14_JumpIfFlagSet(strcFlags.event6, $03, pAIScripting0x46_L025)   ;B5AB14
    %AICMD0x45_JumpIfBetween16(nLove_Eve, 0, 250, pAIScripting0x46_L026)     ;B5AB1B
    %AICMD0x54_ShowDialog($0468, $01)                          ;B5AB25
    %AICMD0x12_Jump(pAIScripting0x46_L027)                                   ;B5AB29
pAIScripting0x46_L025:
    %AICMD0x54_ShowDialog($0467, $01)                          ;B5AB2C
    %AICMD0x12_Jump(pAIScripting0x46_L027)                                   ;B5AB30
pAIScripting0x46_L026:
    %AICMD0x54_ShowDialog($0469, $01)                          ;B5AB33
    %AICMD0x12_Jump(pAIScripting0x46_L027)                                   ;B5AB37
pAIScripting0x46_L027:
    %AICMD0x1B($02E6, $00)                                     ;B5AB3A
    %AICMD0x13_Wait(120)                                       ;B5AB3E
    %AICMD0x1B($02E4, $00)                                     ;B5AB41
    %AICMD0x13_Wait(180)                                       ;B5AB45
    %AICMD0x1B($02E6, $00)                                     ;B5AB48
    %AICMD0x13_Wait(60)                                        ;B5AB4C
    %AICMD0x0B($01)                                            ;B5AB4F
    %AICMD0x1B($02E3, $00)                                     ;B5AB51
    %AICMD0x0D($00, $01, $80, $01)                             ;B5AB55
    %AICMD0x37()                                               ;B5AB5A
    %AICMD0x10_End()                                           ;B5AB5B
pAIScripting0x46_L028:
    %AICMD0x1A($0088, $0188, aAIScriptingData_L167, $03)                     ;B5AB5C
    %AICMD0x0C($03)                                            ;B5AB64
    %AICMD0x13_Wait(60)                                        ;B5AB66
    %AICMD0x1B($01E1, $00)                                     ;B5AB69
    %AICMD0x0D($00, $FF, $70, $01)                             ;B5AB6D
    %AICMD0x13_Wait(60)                                        ;B5AB72
    %AICMD0x1B($01EA, $00)                                     ;B5AB75
    %AICMD0x13_Wait(120)                                       ;B5AB79
    %AICMD0x0B($00)                                            ;B5AB7C
    %AICMD0x1B($01F8, $00)                                     ;B5AB7E
    %AICMD0x13_Wait(120)                                       ;B5AB82
    %AICMD0x1B($01E6, $01)                                     ;B5AB85
    %AICMD0x13_Wait(150)                                       ;B5AB89
    %AICMD0x1B($01E8, $00)                                     ;B5AB8C
    %AICMD0x13_Wait(90)                                        ;B5AB90
    %AICMD0x1B($01DA, $00)                                     ;B5AB93
    %AICMD0x0D($00, $01, $30, $01)                             ;B5AB97
    %AICMD0x0B($01)                                            ;B5AB9C
    %AICMD0x1B($01DA, $00)                                     ;B5AB9E
    %AICMD0x0D($00, $01, $40, $01)                             ;B5ABA2
    %AICMD0x37()                                               ;B5ABA7
    %AICMD0x10_End()                                           ;B5ABA8
pAIScripting0x46_L029:
    %AICMD0x1A($0088, $0118, aAIScriptingData_L069, $03)                     ;B5ABA9
    %AICMD0x0C($03)                                            ;B5ABB1
    %AICMD0x1B($02DD, $00)                                     ;B5ABB3
    %AICMD0x13_Wait(60)                                        ;B5ABB7
    %AICMD0x0B($00)                                            ;B5ABBA
    %AICMD0x46_JumpIfBetween24(nMoney, 1000, 9999, pAIScripting0x46_L030)    ;B5ABBC
    %AICMD0x54_ShowDialog($047B, $01)                          ;B5ABC8
    %AICMD0x12_Jump(pAIScripting0x46_L031)                                   ;B5ABCC
pAIScripting0x46_L030:
    %AICMD0x54_ShowDialog($048E, $01)                          ;B5ABCF
    %AICMD0x12_Jump(pAIScripting0x46_L031)                                   ;B5ABD3
pAIScripting0x46_L031:
    %AICMD0x13_Wait(60)                                        ;B5ABD6
    %AICMD0x1B($02DA, $00)                                     ;B5ABD9
    %AICMD0x0D($00, $01, $80, $01)                             ;B5ABDD
    %AICMD0x0B($01)                                            ;B5ABE2
    %AICMD0x37()                                               ;B5ABE4
    %AICMD0x10_End()                                           ;B5ABE5
    %AICMD0x1A($0058, $0088, aAIScriptingData_L207, $00)                     ;B5ABE6
    %AICMD0x13_Wait(30)                                        ;B5ABEE
    %AICMD0x09($05, pAIScripting0x46_L033)                                   ;B5ABF1
pAIScripting0x46_L032:
    %AICMD0x13_Wait(1)                                         ;B5ABF5
    %AICMD0x12_Jump(pAIScripting0x46_L032)                                   ;B5ABF8
pAIScripting0x46_L033:
    %AICMD0x1A($0068, $0088, aAIScriptingData_L208, $00)                     ;B5ABFB
    %AICMD0x13_Wait(30)                                        ;B5AC03
    %AICMD0x09($06, pAIScripting0x46_L035)                                   ;B5AC06
pAIScripting0x46_L034:
    %AICMD0x13_Wait(1)                                         ;B5AC0A
    %AICMD0x12_Jump(pAIScripting0x46_L034)                                   ;B5AC0D
pAIScripting0x46_L035:
    %AICMD0x1A($0078, $0088, aAIScriptingData_L209, $00)                     ;B5AC10
    %AICMD0x13_Wait(30)                                        ;B5AC18
    %AICMD0x09($07, pAIScripting0x46_L037)                                   ;B5AC1B
pAIScripting0x46_L036:
    %AICMD0x13_Wait(1)                                         ;B5AC1F
    %AICMD0x12_Jump(pAIScripting0x46_L036)                                   ;B5AC22
pAIScripting0x46_L037:
    %AICMD0x1A($008A, $0088, aAIScriptingData_L210, $00)                     ;B5AC25
    %AICMD0x13_Wait(60)                                        ;B5AC2D
    %AICMD0x09($08, pAIScripting0x46_L039)                                   ;B5AC30
pAIScripting0x46_L038:
    %AICMD0x13_Wait(1)                                         ;B5AC34
    %AICMD0x12_Jump(pAIScripting0x46_L038)                                   ;B5AC37
pAIScripting0x46_L039:
    %AICMD0x1A($00E6, $0060, aAIScriptingData_L211, $00)                     ;B5AC3A
    %AICMD0x13_Wait(8)                                         ;B5AC42
    %AICMD0x0D($FE, $01, $10, $02)                             ;B5AC45
    %AICMD0x0D($FF, $01, $10, $01)                             ;B5AC4A
    %AICMD0x0D($FF, $02, $10, $02)                             ;B5AC4F
    %AICMD0x0D($FF, $FF, $08, $01)                             ;B5AC54
    %AICMD0x0D($FE, $FF, $08, $02)                             ;B5AC59
    %AICMD0x0D($FE, $01, $08, $02)                             ;B5AC5E
    %AICMD0x0D($FF, $01, $08, $01)                             ;B5AC63
pAIScripting0x46_L040:
    %AICMD0x13_Wait(1)                                         ;B5AC68
    %AICMD0x12_Jump(pAIScripting0x46_L040)                                   ;B5AC6B


pAIScripting0x47_HowToPlay:
    dw DATA8_B5ACAE                                            ;B5AC6E|        |B5ACAE;
    dw DATA8_B5ACDE                                            ;B5AC70|        |B5ACDE;
    dw DATA8_B5AD25                                            ;B5AC72|        |B5AD25;
    dw DATA8_B5AFF9                                            ;B5AC74|        |B5AFF9;
    dw DATA8_B5B050                                            ;B5AC76|        |B5B050;
    dw DATA8_B5B261                                            ;B5AC78|        |B5B261;
    dw DATA8_B5B2B8                                            ;B5AC7A|        |B5B2B8;
    dw DATA8_B5B501                                            ;B5AC7C|        |B5B501;
    dw DATA8_B5B834                                            ;B5AC7E|        |B5B834;
    dw DATA8_B5B87B                                            ;B5AC80|        |B5B87B;
    dw DATA8_B5BBFA                                            ;B5AC82|        |B5BBFA;
    dw DATA8_B5BC45                                            ;B5AC84|        |B5BC45;
    dw DATA8_B5BEDE                                            ;B5AC86|        |B5BEDE;
    dw DATA8_B5BF1A                                            ;B5AC88|        |B5BF1A;
    dw DATA8_B5C1BD                                            ;B5AC8A|        |B5C1BD;
    dw DATA8_B5C442                                            ;B5AC8C|        |B5C442;
    dw DATA8_B5C489                                            ;B5AC8E|        |B5C489;
    dw DATA8_B5C4BA                                            ;B5AC90|        |B5C4BA;
    dw DATA8_B5C5D3                                            ;B5AC92|        |B5C5D3;
    dw DATA8_B5C608                                            ;B5AC94|        |B5C608;
    dw DATA8_B5C648                                            ;B5AC96|        |B5C648;
    dw DATA8_B5C679                                            ;B5AC98|        |B5C679;
    dw DATA8_B5C793                                            ;B5AC9A|        |B5C793;
    dw DATA8_B5C7DE                                            ;B5AC9C|        |B5C7DE;
    dw DATA8_B5C8AF                                            ;B5AC9E|        |B5C8AF;
    dw DATA8_B5C8EE                                            ;B5ACA0|        |B5C8EE;
    dw DATA8_B5CA00                                            ;B5ACA2|        |B5CA00;
    dw DATA8_B5CA3D                                            ;B5ACA4|        |B5CA3D;
    dw DATA8_B5CAA2                                            ;B5ACA6|        |B5CAA2;
    dw DATA8_B5CB13                                            ;B5ACA8|        |B5CB13;
    dw DATA8_B5CB69                                            ;B5ACAA|        |B5CB69;
    dw DATA8_B5CB69                                            ;B5ACAC|        |B5CB69;
 
DATA8_B5ACAE:
 
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $06)       ;B5ACAE
    %AICMD0x00_SetMusic($01, $B4)                              ;B5ACB3
    %AICMD0x02_FreezeTime()                                    ;B5ACB6
    %AICMD0x03_SetHour($07)                                    ;B5ACB7
    %AICMD0x05_SetTransferPosition(136, 344)                   ;B5ACB9
    %AICMD0x08_EnableAIControl()                               ;B5ACBE
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B5ACBF
    %AICMD0x06_SetDestinationArea(!AREA_FARMSPRING)            ;B5ACC1
    %AICMD0x38()                                               ;B5ACC3
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 32)                  ;B5ACC4
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 102)                 ;B5ACC8
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 56)                   ;B5ACCC
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 40)                  ;B5ACD0
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 16)                    ;B5ACD4
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $07)       ;B5ACD8
    %AICMD0x10_End()                                           ;B5ACDD


DATA8_B5ACDE:
 
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $06)       ;B5ACDE
    %AICMD0x00_SetMusic($01, $B4)                              ;B5ACE3
    %AICMD0x02_FreezeTime()                                    ;B5ACE6
    %AICMD0x03_SetHour($07)                                    ;B5ACE7
    %AICMD0x05_SetTransferPosition(128, 200)                   ;B5ACE9
    %AICMD0x08_EnableAIControl()                               ;B5ACEE
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B5ACEF
    %AICMD0x47_SetValue8(nCurrentSeasonID, 0)                  ;B5ACF1
    %AICMD0x06_SetDestinationArea(!AREA_SHED)                  ;B5ACF6
    %AICMD0x38()                                               ;B5ACF8
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 16)                    ;B5ACF9
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 72)                 ;B5ACFD
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 8)                     ;B5AD01
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B5AD05
    %AICMD0x3E_SetCarryItem($2D)                               ;B5AD07
    %AICMD0x13_Wait(60)                                        ;B5AD09
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 16)                  ;B5AD0C
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B5AD10
    %AICMD0x3E_SetCarryItem($2C)                               ;B5AD12
    %AICMD0x13_Wait(60)                                        ;B5AD14
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 56)                  ;B5AD17
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 32)                  ;B5AD1B
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $07)       ;B5AD1F
    %AICMD0x10_End()                                           ;B5AD24


DATA8_B5AD25:
 
    %AICMD0x47_SetValue8($800921, 3)                           ;B5AD25
    %AICMD0x47_SetValue8($800923, 4)                           ;B5AD2A
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $06)       ;B5AD2F
    %AICMD0x00_SetMusic($01, $B4)                              ;B5AD34
    %AICMD0x02_FreezeTime()                                    ;B5AD37
    %AICMD0x03_SetHour($07)                                    ;B5AD38
    %AICMD0x05_SetTransferPosition(424, 488)                   ;B5AD3A
    %AICMD0x08_EnableAIControl()                               ;B5AD3F
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B5AD40
    %AICMD0x47_SetValue8(nCurrentSeasonID, 0)                  ;B5AD42
    %AICMD0x06_SetDestinationArea(!AREA_FARMSPRING)            ;B5AD47
    %AICMD0x38()                                               ;B5AD49
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 1)                    ;B5AD4A
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 14)                  ;B5AD4E
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 16)                 ;B5AD52
    %AICMD0x3E_SetCarryItem($09)                               ;B5AD56
    %AICMD0x13_Wait(40)                                        ;B5AD58
    %AICMD0x3F_ThrowCarriedItem()                              ;B5AD5B
    %AICMD0x13_Wait(20)                                        ;B5AD5C
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 16)                 ;B5AD5F
    %AICMD0x3E_SetCarryItem($09)                               ;B5AD63
    %AICMD0x13_Wait(40)                                        ;B5AD65
    %AICMD0x3F_ThrowCarriedItem()                              ;B5AD68
    %AICMD0x13_Wait(20)                                        ;B5AD69
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 16)                 ;B5AD6C
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B5AD70
    %AICMD0x3E_SetCarryItem($09)                               ;B5AD72
    %AICMD0x13_Wait(40)                                        ;B5AD74
    %AICMD0x3F_ThrowCarriedItem()                              ;B5AD77
    %AICMD0x13_Wait(20)                                        ;B5AD78
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B5AD7B
    %AICMD0x3E_SetCarryItem($09)                               ;B5AD7D
    %AICMD0x13_Wait(40)                                        ;B5AD7F
    %AICMD0x3F_ThrowCarriedItem()                              ;B5AD82
    %AICMD0x13_Wait(20)                                        ;B5AD83
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 28)                  ;B5AD86
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B5AD8A
    %AICMD0x56_UseEquippedItem()                               ;B5AD8C
    %AICMD0x13_Wait(60)                                        ;B5AD8D
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 40)                   ;B5AD90
    %AICMD0x56_UseEquippedItem()                               ;B5AD94
    %AICMD0x13_Wait(60)                                        ;B5AD95
    %AICMD0x56_UseEquippedItem()                               ;B5AD98
    %AICMD0x13_Wait(60)                                        ;B5AD99
    %AICMD0x56_UseEquippedItem()                               ;B5AD9C
    %AICMD0x13_Wait(60)                                        ;B5AD9D
    %AICMD0x56_UseEquippedItem()                               ;B5ADA0
    %AICMD0x13_Wait(60)                                        ;B5ADA1
    %AICMD0x56_UseEquippedItem()                               ;B5ADA4
    %AICMD0x13_Wait(60)                                        ;B5ADA5
    %AICMD0x56_UseEquippedItem()                               ;B5ADA8
    %AICMD0x13_Wait(60)                                        ;B5ADA9
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 4)                   ;B5ADAC
    %AICMD0x3E_SetCarryItem($09)                               ;B5ADB0
    %AICMD0x13_Wait(40)                                        ;B5ADB2
    %AICMD0x3F_ThrowCarriedItem()                              ;B5ADB5
    %AICMD0x13_Wait(20)                                        ;B5ADB6
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 14)                  ;B5ADB9
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B5ADBD
    %AICMD0x3E_SetCarryItem($09)                               ;B5ADBF
    %AICMD0x13_Wait(40)                                        ;B5ADC1
    %AICMD0x3F_ThrowCarriedItem()                              ;B5ADC4
    %AICMD0x13_Wait(20)                                        ;B5ADC5
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 16)                  ;B5ADC8
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B5ADCC
    %AICMD0x3E_SetCarryItem($0D)                               ;B5ADCE
    %AICMD0x13_Wait(40)                                        ;B5ADD0
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 16)                  ;B5ADD3
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 16)                    ;B5ADD7
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 60)                  ;B5ADDB
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 16)                    ;B5ADDF
    %AICMD0x3F_ThrowCarriedItem()                              ;B5ADE3
    %AICMD0x13_Wait(20)                                        ;B5ADE4
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 16)                  ;B5ADE7
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 52)                   ;B5ADEB
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B5ADEF
    %AICMD0x59_SwapEquippedItems()                             ;B5ADF1
    %AICMD0x13_Wait(60)                                        ;B5ADF2
    %AICMD0x56_UseEquippedItem()                               ;B5ADF5
    %AICMD0x13_Wait(60)                                        ;B5ADF6
    %AICMD0x56_UseEquippedItem()                               ;B5ADF9
    %AICMD0x13_Wait(60)                                        ;B5ADFA
    %AICMD0x56_UseEquippedItem()                               ;B5ADFD
    %AICMD0x13_Wait(60)                                        ;B5ADFE
    %AICMD0x56_UseEquippedItem()                               ;B5AE01
    %AICMD0x13_Wait(60)                                        ;B5AE02
    %AICMD0x56_UseEquippedItem()                               ;B5AE05
    %AICMD0x13_Wait(60)                                        ;B5AE06
    %AICMD0x56_UseEquippedItem()                               ;B5AE09
    %AICMD0x13_Wait(60)                                        ;B5AE0A
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 32)                  ;B5AE0D
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 30)                 ;B5AE11
    %AICMD0x3E_SetCarryItem($09)                               ;B5AE15
    %AICMD0x13_Wait(40)                                        ;B5AE17
    %AICMD0x3F_ThrowCarriedItem()                              ;B5AE1A
    %AICMD0x13_Wait(20)                                        ;B5AE1B
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 16)                 ;B5AE1E
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 40)                     ;B5AE22
    %AICMD0x3E_SetCarryItem($0F)                               ;B5AE26
    %AICMD0x13_Wait(40)                                        ;B5AE28
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 16)                   ;B5AE2B
    %AICMD0x3F_ThrowCarriedItem()                              ;B5AE2F
    %AICMD0x13_Wait(20)                                        ;B5AE30
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 32)                     ;B5AE33
    %AICMD0x3E_SetCarryItem($09)                               ;B5AE37
    %AICMD0x13_Wait(40)                                        ;B5AE39
    %AICMD0x3F_ThrowCarriedItem()                              ;B5AE3C
    %AICMD0x13_Wait(40)                                        ;B5AE3D
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B5AE40
    %AICMD0x3E_SetCarryItem($0F)                               ;B5AE42
    %AICMD0x13_Wait(40)                                        ;B5AE44
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 24)                   ;B5AE47
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 15)                  ;B5AE4B
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B5AE4F
    %AICMD0x3F_ThrowCarriedItem()                              ;B5AE51
    %AICMD0x13_Wait(20)                                        ;B5AE52
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 15)                  ;B5AE55
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 16)                     ;B5AE59
    %AICMD0x3E_SetCarryItem($0F)                               ;B5AE5D
    %AICMD0x13_Wait(40)                                        ;B5AE5F
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 16)                   ;B5AE62
    %AICMD0x3F_ThrowCarriedItem()                              ;B5AE66
    %AICMD0x13_Wait(20)                                        ;B5AE67
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 15)                  ;B5AE6A
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 16)                     ;B5AE6E
    %AICMD0x3E_SetCarryItem($0F)                               ;B5AE72
    %AICMD0x13_Wait(40)                                        ;B5AE74
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 16)                   ;B5AE77
    %AICMD0x3F_ThrowCarriedItem()                              ;B5AE7B
    %AICMD0x13_Wait(20)                                        ;B5AE7C
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 15)                  ;B5AE7F
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 16)                     ;B5AE83
    %AICMD0x3E_SetCarryItem($0F)                               ;B5AE87
    %AICMD0x13_Wait(40)                                        ;B5AE89
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 16)                   ;B5AE8C
    %AICMD0x3F_ThrowCarriedItem()                              ;B5AE90
    %AICMD0x13_Wait(20)                                        ;B5AE91
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 15)                  ;B5AE94
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 16)                     ;B5AE98
    %AICMD0x3E_SetCarryItem($0F)                               ;B5AE9C
    %AICMD0x13_Wait(40)                                        ;B5AE9E
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 16)                   ;B5AEA1
    %AICMD0x3F_ThrowCarriedItem()                              ;B5AEA5
    %AICMD0x13_Wait(20)                                        ;B5AEA6
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 15)                  ;B5AEA9
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 16)                    ;B5AEAD
    %AICMD0x3E_SetCarryItem($09)                               ;B5AEB1
    %AICMD0x13_Wait(40)                                        ;B5AEB3
    %AICMD0x3F_ThrowCarriedItem()                              ;B5AEB6
    %AICMD0x13_Wait(20)                                        ;B5AEB7
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 16)                    ;B5AEBA
    %AICMD0x3E_SetCarryItem($0F)                               ;B5AEBE
    %AICMD0x13_Wait(40)                                        ;B5AEC0
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 16)                   ;B5AEC3
    %AICMD0x3F_ThrowCarriedItem()                              ;B5AEC7
    %AICMD0x13_Wait(20)                                        ;B5AEC8
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 15)                  ;B5AECB
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 16)                    ;B5AECF
    %AICMD0x3E_SetCarryItem($09)                               ;B5AED3
    %AICMD0x13_Wait(40)                                        ;B5AED5
    %AICMD0x3F_ThrowCarriedItem()                              ;B5AED8
    %AICMD0x13_Wait(20)                                        ;B5AED9
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 16)                    ;B5AEDC
    %AICMD0x3E_SetCarryItem($0F)                               ;B5AEE0
    %AICMD0x13_Wait(40)                                        ;B5AEE2
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 16)                   ;B5AEE5
    %AICMD0x3F_ThrowCarriedItem()                              ;B5AEE9
    %AICMD0x13_Wait(20)                                        ;B5AEEA
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 15)                  ;B5AEED
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 16)                    ;B5AEF1
    %AICMD0x3E_SetCarryItem($09)                               ;B5AEF5
    %AICMD0x13_Wait(40)                                        ;B5AEF7
    %AICMD0x3F_ThrowCarriedItem()                              ;B5AEFA
    %AICMD0x13_Wait(20)                                        ;B5AEFB
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 16)                    ;B5AEFE
    %AICMD0x3E_SetCarryItem($0F)                               ;B5AF02
    %AICMD0x13_Wait(40)                                        ;B5AF04
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 16)                   ;B5AF07
    %AICMD0x3F_ThrowCarriedItem()                              ;B5AF0B
    %AICMD0x13_Wait(20)                                        ;B5AF0C
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 15)                  ;B5AF0F
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B5AF13
    %AICMD0x3E_SetCarryItem($09)                               ;B5AF15
    %AICMD0x13_Wait(40)                                        ;B5AF17
    %AICMD0x3F_ThrowCarriedItem()                              ;B5AF1A
    %AICMD0x13_Wait(20)                                        ;B5AF1B
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 16)                     ;B5AF1E
    %AICMD0x3E_SetCarryItem($0F)                               ;B5AF22
    %AICMD0x13_Wait(40)                                        ;B5AF24
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 16)                   ;B5AF27
    %AICMD0x3F_ThrowCarriedItem()                              ;B5AF2B
    %AICMD0x13_Wait(20)                                        ;B5AF2C
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 48)                     ;B5AF2F
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B5AF33
    %AICMD0x56_UseEquippedItem()                               ;B5AF35
    %AICMD0x13_Wait(60)                                        ;B5AF36
    %AICMD0x56_UseEquippedItem()                               ;B5AF39
    %AICMD0x13_Wait(60)                                        ;B5AF3A
    %AICMD0x56_UseEquippedItem()                               ;B5AF3D
    %AICMD0x13_Wait(60)                                        ;B5AF3E
    %AICMD0x56_UseEquippedItem()                               ;B5AF41
    %AICMD0x13_Wait(60)                                        ;B5AF42
    %AICMD0x56_UseEquippedItem()                               ;B5AF45
    %AICMD0x13_Wait(60)                                        ;B5AF46
    %AICMD0x56_UseEquippedItem()                               ;B5AF49
    %AICMD0x13_Wait(60)                                        ;B5AF4A
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 16)                    ;B5AF4D
    %AICMD0x3E_SetCarryItem($09)                               ;B5AF51
    %AICMD0x13_Wait(40)                                        ;B5AF53
    %AICMD0x3F_ThrowCarriedItem()                              ;B5AF56
    %AICMD0x13_Wait(20)                                        ;B5AF57
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 16)                    ;B5AF5A
    %AICMD0x3E_SetCarryItem($09)                               ;B5AF5E
    %AICMD0x13_Wait(40)                                        ;B5AF60
    %AICMD0x3F_ThrowCarriedItem()                              ;B5AF63
    %AICMD0x13_Wait(20)                                        ;B5AF64
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 32)                     ;B5AF67
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 52)                   ;B5AF6B
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 48)                     ;B5AF6F
    %AICMD0x3E_SetCarryItem($57)                               ;B5AF73
    %AICMD0x13_Wait(40)                                        ;B5AF75
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 48)                   ;B5AF78
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 52)                  ;B5AF7C
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 78)                   ;B5AF80
    %AICMD0x3F_ThrowCarriedItem()                              ;B5AF84
    %AICMD0x13_Wait(20)                                        ;B5AF85
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 78)                     ;B5AF88
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 52)                   ;B5AF8C
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 48)                     ;B5AF90
    %AICMD0x3E_SetCarryItem($57)                               ;B5AF94
    %AICMD0x13_Wait(40)                                        ;B5AF96
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 48)                   ;B5AF99
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 52)                  ;B5AF9D
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 70)                   ;B5AFA1
    %AICMD0x3F_ThrowCarriedItem()                              ;B5AFA5
    %AICMD0x13_Wait(20)                                        ;B5AFA6
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 70)                     ;B5AFA9
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 52)                   ;B5AFAD
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 48)                     ;B5AFB1
    %AICMD0x3E_SetCarryItem($57)                               ;B5AFB5
    %AICMD0x13_Wait(40)                                        ;B5AFB7
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 48)                   ;B5AFBA
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 52)                  ;B5AFBE
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 62)                   ;B5AFC2
    %AICMD0x3F_ThrowCarriedItem()                              ;B5AFC6
    %AICMD0x13_Wait(20)                                        ;B5AFC7
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 62)                     ;B5AFCA
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 52)                   ;B5AFCE
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 48)                     ;B5AFD2
    %AICMD0x3E_SetCarryItem($57)                               ;B5AFD6
    %AICMD0x13_Wait(40)                                        ;B5AFD8
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 48)                   ;B5AFDB
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 52)                  ;B5AFDF
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 54)                   ;B5AFE3
    %AICMD0x3F_ThrowCarriedItem()                              ;B5AFE7
    %AICMD0x13_Wait(20)                                        ;B5AFE8
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 48)                  ;B5AFEB
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 8)                     ;B5AFEF
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $07)       ;B5AFF3
    %AICMD0x10_End()                                           ;B5AFF8


DATA8_B5AFF9:
 
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $06)       ;B5AFF9
    %AICMD0x00_SetMusic($01, $B4)                              ;B5AFFE
    %AICMD0x02_FreezeTime()                                    ;B5B001
    %AICMD0x03_SetHour($07)                                    ;B5B002
    %AICMD0x05_SetTransferPosition(128, 200)                   ;B5B004
    %AICMD0x08_EnableAIControl()                               ;B5B009
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B5B00A
    %AICMD0x47_SetValue8(nCurrentSeasonID, 0)                  ;B5B00C
    %AICMD0x06_SetDestinationArea(!AREA_SHED)                  ;B5B011
    %AICMD0x38()                                               ;B5B013
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 64)                    ;B5B014
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 24)                  ;B5B018
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 8)                     ;B5B01C
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B5B020
    %AICMD0x3E_SetCarryItem($35)                               ;B5B022
    %AICMD0x13_Wait(60)                                        ;B5B024
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 24)                 ;B5B027
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 53)                  ;B5B02B
    %AICMD0x59_SwapEquippedItems()                             ;B5B02F
    %AICMD0x13_Wait(60)                                        ;B5B030
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 40)                 ;B5B033
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 8)                     ;B5B037
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B5B03B
    %AICMD0x3E_SetCarryItem($2B)                               ;B5B03D
    %AICMD0x13_Wait(60)                                        ;B5B03F
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 40)                  ;B5B042
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 32)                  ;B5B046
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $07)       ;B5B04A
    %AICMD0x10_End()                                           ;B5B04F


DATA8_B5B050:
 
    %AICMD0x58_ReplaceFarmTile($02, 448, 528)                  ;B5B050
    %AICMD0x58_ReplaceFarmTile($02, 464, 528)                  ;B5B056
    %AICMD0x58_ReplaceFarmTile($02, 464, 512)                  ;B5B05C
    %AICMD0x58_ReplaceFarmTile($02, 464, 544)                  ;B5B062
    %AICMD0x58_ReplaceFarmTile($02, 480, 560)                  ;B5B068
    %AICMD0x58_ReplaceFarmTile($02, 368, 576)                  ;B5B06E
    %AICMD0x58_ReplaceFarmTile($02, 384, 576)                  ;B5B074
    %AICMD0x58_ReplaceFarmTile($02, 368, 592)                  ;B5B07A
    %AICMD0x58_ReplaceFarmTile($02, 352, 544)                  ;B5B080
    %AICMD0x58_ReplaceFarmTile($02, 368, 544)                  ;B5B086
    %AICMD0x58_ReplaceFarmTile($02, 352, 560)                  ;B5B08C
    %AICMD0x58_ReplaceFarmTile($02, 368, 560)                  ;B5B092
    %AICMD0x58_ReplaceFarmTile($02, 416, 576)                  ;B5B098
    %AICMD0x58_ReplaceFarmTile($02, 432, 576)                  ;B5B09E
    %AICMD0x58_ReplaceFarmTile($02, 416, 592)                  ;B5B0A4
    %AICMD0x58_ReplaceFarmTile($02, 432, 592)                  ;B5B0AA
    %AICMD0x58_ReplaceFarmTile($02, 464, 496)                  ;B5B0B0
    %AICMD0x58_ReplaceFarmTile($02, 448, 496)                  ;B5B0B6
    %AICMD0x58_ReplaceFarmTile($02, 432, 496)                  ;B5B0BC
    %AICMD0x58_ReplaceFarmTile($02, 416, 496)                  ;B5B0C2
    %AICMD0x58_ReplaceFarmTile($02, 400, 496)                  ;B5B0C8
    %AICMD0x58_ReplaceFarmTile($02, 384, 496)                  ;B5B0CE
    %AICMD0x58_ReplaceFarmTile($02, 368, 496)                  ;B5B0D4
    %AICMD0x58_ReplaceFarmTile($02, 352, 496)                  ;B5B0DA
    %AICMD0x58_ReplaceFarmTile($02, 336, 496)                  ;B5B0E0
    %AICMD0x58_ReplaceFarmTile($02, 320, 496)                  ;B5B0E6
    %AICMD0x58_ReplaceFarmTile($05, 464, 560)                  ;B5B0EC
    %AICMD0x58_ReplaceFarmTile($05, 448, 560)                  ;B5B0F2
    %AICMD0x58_ReplaceFarmTile($05, 432, 560)                  ;B5B0F8
    %AICMD0x58_ReplaceFarmTile($05, 416, 560)                  ;B5B0FE
    %AICMD0x58_ReplaceFarmTile($05, 400, 560)                  ;B5B104
    %AICMD0x58_ReplaceFarmTile($05, 384, 560)                  ;B5B10A
    %AICMD0x58_ReplaceFarmTile($05, 368, 560)                  ;B5B110
    %AICMD0x58_ReplaceFarmTile($05, 352, 560)                  ;B5B116
    %AICMD0x58_ReplaceFarmTile($05, 336, 560)                  ;B5B11C
    %AICMD0x58_ReplaceFarmTile($05, 320, 560)                  ;B5B122
    %AICMD0x58_ReplaceFarmTile($05, 320, 544)                  ;B5B128
    %AICMD0x58_ReplaceFarmTile($05, 320, 528)                  ;B5B12E
    %AICMD0x58_ReplaceFarmTile($05, 320, 512)                  ;B5B134
    %AICMD0x58_ReplaceFarmTile($05, 320, 496)                  ;B5B13A
    %AICMD0x58_ReplaceFarmTile($02, 336, 512)                  ;B5B140
    %AICMD0x58_ReplaceFarmTile($02, 352, 512)                  ;B5B146
    %AICMD0x58_ReplaceFarmTile($02, 368, 512)                  ;B5B14C
    %AICMD0x58_ReplaceFarmTile($02, 320, 416)                  ;B5B152
    %AICMD0x58_ReplaceFarmTile($02, 320, 432)                  ;B5B158
    %AICMD0x58_ReplaceFarmTile($02, 288, 448)                  ;B5B15E
    %AICMD0x58_ReplaceFarmTile($02, 304, 448)                  ;B5B164
    %AICMD0x58_ReplaceFarmTile($02, 288, 464)                  ;B5B16A
    %AICMD0x58_ReplaceFarmTile($02, 304, 464)                  ;B5B170
    %AICMD0x47_SetValue8($800921, 2)                           ;B5B176
    %AICMD0x47_SetValue8($800923, 12)                          ;B5B17B
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $06)       ;B5B180
    %AICMD0x00_SetMusic($01, $B4)                              ;B5B185
    %AICMD0x02_FreezeTime()                                    ;B5B188
    %AICMD0x03_SetHour($07)                                    ;B5B189
    %AICMD0x05_SetTransferPosition(424, 488)                   ;B5B18B
    %AICMD0x08_EnableAIControl()                               ;B5B190
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B5B191
    %AICMD0x47_SetValue8(nCurrentSeasonID, 0)                  ;B5B193
    %AICMD0x06_SetDestinationArea(!AREA_FARMSPRING)            ;B5B198
    %AICMD0x38()                                               ;B5B19A
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 15)                  ;B5B19B
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 15)                  ;B5B19F
    %AICMD0x56_UseEquippedItem()                               ;B5B1A3
    %AICMD0x13_Wait(60)                                        ;B5B1A4
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 15)                  ;B5B1A7
    %AICMD0x56_UseEquippedItem()                               ;B5B1AB
    %AICMD0x13_Wait(60)                                        ;B5B1AC
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 15)                  ;B5B1AF
    %AICMD0x56_UseEquippedItem()                               ;B5B1B3
    %AICMD0x13_Wait(60)                                        ;B5B1B4
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 15)                  ;B5B1B7
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B5B1BB
    %AICMD0x56_UseEquippedItem()                               ;B5B1BD
    %AICMD0x13_Wait(60)                                        ;B5B1BE
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 15)                  ;B5B1C1
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B5B1C5
    %AICMD0x56_UseEquippedItem()                               ;B5B1C7
    %AICMD0x13_Wait(60)                                        ;B5B1C8
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 15)                 ;B5B1CB
    %AICMD0x56_UseEquippedItem()                               ;B5B1CF
    %AICMD0x13_Wait(60)                                        ;B5B1D0
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 15)                 ;B5B1D3
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B5B1D7
    %AICMD0x56_UseEquippedItem()                               ;B5B1D9
    %AICMD0x13_Wait(60)                                        ;B5B1DA
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 15)                  ;B5B1DD
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B5B1E1
    %AICMD0x56_UseEquippedItem()                               ;B5B1E3
    %AICMD0x13_Wait(60)                                        ;B5B1E4
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 15)                  ;B5B1E7
    %AICMD0x56_UseEquippedItem()                               ;B5B1EB
    %AICMD0x13_Wait(60)                                        ;B5B1EC
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 15)                  ;B5B1EF
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 15)                     ;B5B1F3
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B5B1F7
    %AICMD0x56_UseEquippedItem()                               ;B5B1F9
    %AICMD0x13_Wait(60)                                        ;B5B1FA
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 15)                 ;B5B1FD
    %AICMD0x56_UseEquippedItem()                               ;B5B201
    %AICMD0x13_Wait(60)                                        ;B5B202
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 15)                 ;B5B205
    %AICMD0x56_UseEquippedItem()                               ;B5B209
    %AICMD0x13_Wait(60)                                        ;B5B20A
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 15)                 ;B5B20D
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B5B211
    %AICMD0x56_UseEquippedItem()                               ;B5B213
    %AICMD0x13_Wait(60)                                        ;B5B214
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 15)                  ;B5B217
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B5B21B
    %AICMD0x56_UseEquippedItem()                               ;B5B21D
    %AICMD0x13_Wait(60)                                        ;B5B21E
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 15)                  ;B5B221
    %AICMD0x56_UseEquippedItem()                               ;B5B225
    %AICMD0x13_Wait(60)                                        ;B5B226
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 15)                  ;B5B229
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B5B22D
    %AICMD0x56_UseEquippedItem()                               ;B5B22F
    %AICMD0x13_Wait(60)                                        ;B5B230
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 15)                  ;B5B233
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B5B237
    %AICMD0x56_UseEquippedItem()                               ;B5B239
    %AICMD0x13_Wait(60)                                        ;B5B23A
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 15)                 ;B5B23D
    %AICMD0x56_UseEquippedItem()                               ;B5B241
    %AICMD0x13_Wait(60)                                        ;B5B242
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 15)                    ;B5B245
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B5B249
    %AICMD0x59_SwapEquippedItems()                             ;B5B24B
    %AICMD0x13_Wait(60)                                        ;B5B24C
    %AICMD0x56_UseEquippedItem()                               ;B5B24F
    %AICMD0x13_Wait(120)                                       ;B5B250
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 15)                  ;B5B253
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 40)                    ;B5B257
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $07)       ;B5B25B
    %AICMD0x10_End()                                           ;B5B260


DATA8_B5B261:
 
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $06)       ;B5B261
    %AICMD0x00_SetMusic($01, $B4)                              ;B5B266
    %AICMD0x02_FreezeTime()                                    ;B5B269
    %AICMD0x03_SetHour($07)                                    ;B5B26A
    %AICMD0x05_SetTransferPosition(128, 200)                   ;B5B26C
    %AICMD0x08_EnableAIControl()                               ;B5B271
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B5B272
    %AICMD0x47_SetValue8(nCurrentSeasonID, 0)                  ;B5B274
    %AICMD0x06_SetDestinationArea(!AREA_SHED)                  ;B5B279
    %AICMD0x38()                                               ;B5B27B
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 64)                    ;B5B27C
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 72)                 ;B5B280
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 8)                     ;B5B284
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B5B288
    %AICMD0x3E_SetCarryItem($31)                               ;B5B28A
    %AICMD0x13_Wait(60)                                        ;B5B28C
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 72)                  ;B5B28F
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 53)                  ;B5B293
    %AICMD0x59_SwapEquippedItems()                             ;B5B297
    %AICMD0x13_Wait(60)                                        ;B5B298
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 24)                  ;B5B29B
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 8)                     ;B5B29F
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B5B2A3
    %AICMD0x3E_SetCarryItem($39)                               ;B5B2A5
    %AICMD0x13_Wait(60)                                        ;B5B2A7
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 24)                 ;B5B2AA
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 32)                  ;B5B2AE
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $07)       ;B5B2B2
    %AICMD0x10_End()                                           ;B5B2B7


DATA8_B5B2B8:
 
    %AICMD0x58_ReplaceFarmTile($02, 448, 528)                  ;B5B2B8
    %AICMD0x58_ReplaceFarmTile($02, 464, 528)                  ;B5B2BE
    %AICMD0x58_ReplaceFarmTile($02, 464, 512)                  ;B5B2C4
    %AICMD0x58_ReplaceFarmTile($02, 464, 544)                  ;B5B2CA
    %AICMD0x58_ReplaceFarmTile($02, 480, 560)                  ;B5B2D0
    %AICMD0x58_ReplaceFarmTile($02, 368, 576)                  ;B5B2D6
    %AICMD0x58_ReplaceFarmTile($02, 384, 576)                  ;B5B2DC
    %AICMD0x58_ReplaceFarmTile($02, 368, 592)                  ;B5B2E2
    %AICMD0x58_ReplaceFarmTile($02, 352, 544)                  ;B5B2E8
    %AICMD0x58_ReplaceFarmTile($02, 368, 544)                  ;B5B2EE
    %AICMD0x58_ReplaceFarmTile($02, 352, 560)                  ;B5B2F4
    %AICMD0x58_ReplaceFarmTile($02, 368, 560)                  ;B5B2FA
    %AICMD0x58_ReplaceFarmTile($02, 416, 576)                  ;B5B300
    %AICMD0x58_ReplaceFarmTile($02, 432, 576)                  ;B5B306
    %AICMD0x58_ReplaceFarmTile($02, 416, 592)                  ;B5B30C
    %AICMD0x58_ReplaceFarmTile($02, 432, 592)                  ;B5B312
    %AICMD0x58_ReplaceFarmTile($02, 464, 496)                  ;B5B318
    %AICMD0x58_ReplaceFarmTile($02, 448, 496)                  ;B5B31E
    %AICMD0x58_ReplaceFarmTile($02, 432, 496)                  ;B5B324
    %AICMD0x58_ReplaceFarmTile($02, 416, 496)                  ;B5B32A
    %AICMD0x58_ReplaceFarmTile($02, 400, 496)                  ;B5B330
    %AICMD0x58_ReplaceFarmTile($02, 384, 496)                  ;B5B336
    %AICMD0x58_ReplaceFarmTile($02, 368, 496)                  ;B5B33C
    %AICMD0x58_ReplaceFarmTile($02, 352, 496)                  ;B5B342
    %AICMD0x58_ReplaceFarmTile($02, 336, 496)                  ;B5B348
    %AICMD0x58_ReplaceFarmTile($02, 320, 496)                  ;B5B34E
    %AICMD0x58_ReplaceFarmTile($05, 464, 560)                  ;B5B354
    %AICMD0x58_ReplaceFarmTile($05, 448, 560)                  ;B5B35A
    %AICMD0x58_ReplaceFarmTile($05, 432, 560)                  ;B5B360
    %AICMD0x58_ReplaceFarmTile($05, 416, 560)                  ;B5B366
    %AICMD0x58_ReplaceFarmTile($05, 400, 560)                  ;B5B36C
    %AICMD0x58_ReplaceFarmTile($05, 384, 560)                  ;B5B372
    %AICMD0x58_ReplaceFarmTile($05, 368, 560)                  ;B5B378
    %AICMD0x58_ReplaceFarmTile($05, 352, 560)                  ;B5B37E
    %AICMD0x58_ReplaceFarmTile($05, 336, 560)                  ;B5B384
    %AICMD0x58_ReplaceFarmTile($05, 320, 560)                  ;B5B38A
    %AICMD0x58_ReplaceFarmTile($05, 320, 544)                  ;B5B390
    %AICMD0x58_ReplaceFarmTile($05, 320, 528)                  ;B5B396
    %AICMD0x58_ReplaceFarmTile($05, 320, 512)                  ;B5B39C
    %AICMD0x58_ReplaceFarmTile($05, 320, 496)                  ;B5B3A2
    %AICMD0x58_ReplaceFarmTile($02, 336, 512)                  ;B5B3A8
    %AICMD0x58_ReplaceFarmTile($02, 352, 512)                  ;B5B3AE
    %AICMD0x58_ReplaceFarmTile($02, 368, 512)                  ;B5B3B4
    %AICMD0x58_ReplaceFarmTile($02, 320, 416)                  ;B5B3BA
    %AICMD0x58_ReplaceFarmTile($02, 320, 432)                  ;B5B3C0
    %AICMD0x58_ReplaceFarmTile($02, 288, 448)                  ;B5B3C6
    %AICMD0x58_ReplaceFarmTile($02, 304, 448)                  ;B5B3CC
    %AICMD0x58_ReplaceFarmTile($02, 288, 464)                  ;B5B3D2
    %AICMD0x58_ReplaceFarmTile($02, 304, 464)                  ;B5B3D8
    %AICMD0x58_ReplaceFarmTile($07, 352, 496)                  ;B5B3DE
    %AICMD0x58_ReplaceFarmTile($07, 368, 496)                  ;B5B3E4
    %AICMD0x58_ReplaceFarmTile($07, 384, 496)                  ;B5B3EA
    %AICMD0x58_ReplaceFarmTile($07, 352, 512)                  ;B5B3F0
    %AICMD0x58_ReplaceFarmTile($07, 368, 512)                  ;B5B3F6
    %AICMD0x58_ReplaceFarmTile($07, 384, 512)                  ;B5B3FC
    %AICMD0x58_ReplaceFarmTile($07, 352, 528)                  ;B5B402
    %AICMD0x58_ReplaceFarmTile($07, 368, 528)                  ;B5B408
    %AICMD0x58_ReplaceFarmTile($07, 384, 528)                  ;B5B40E
    %AICMD0x58_ReplaceFarmTile($70, 416, 496)                  ;B5B414
    %AICMD0x58_ReplaceFarmTile($70, 432, 496)                  ;B5B41A
    %AICMD0x58_ReplaceFarmTile($70, 448, 496)                  ;B5B420
    %AICMD0x58_ReplaceFarmTile($70, 416, 512)                  ;B5B426
    %AICMD0x58_ReplaceFarmTile($70, 432, 512)                  ;B5B42C
    %AICMD0x58_ReplaceFarmTile($70, 448, 512)                  ;B5B432
    %AICMD0x58_ReplaceFarmTile($70, 416, 528)                  ;B5B438
    %AICMD0x58_ReplaceFarmTile($70, 432, 528)                  ;B5B43E
    %AICMD0x58_ReplaceFarmTile($70, 448, 528)                  ;B5B444
    %AICMD0x47_SetValue8($800921, 8)                           ;B5B44A
    %AICMD0x47_SetValue8($800923, 16)                          ;B5B44F
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $06)       ;B5B454
    %AICMD0x00_SetMusic($01, $B4)                              ;B5B459
    %AICMD0x02_FreezeTime()                                    ;B5B45C
    %AICMD0x03_SetHour($07)                                    ;B5B45D
    %AICMD0x05_SetTransferPosition(424, 488)                   ;B5B45F
    %AICMD0x08_EnableAIControl()                               ;B5B464
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B5B465
    %AICMD0x47_SetValue8(nCurrentSeasonID, 0)                  ;B5B467
    %AICMD0x06_SetDestinationArea(!AREA_FARMSPRING)            ;B5B46C
    %AICMD0x38()                                               ;B5B46E
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 31)                  ;B5B46F
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 47)                  ;B5B473
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B5B477
    %AICMD0x56_UseEquippedItem()                               ;B5B479
    %AICMD0x13_Wait(120)                                       ;B5B47A
    %AICMD0x59_SwapEquippedItems()                             ;B5B47D
    %AICMD0x13_Wait(60)                                        ;B5B47E
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 17)                   ;B5B481
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 76)                  ;B5B485
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 31)                    ;B5B489
    %AICMD0x56_UseEquippedItem()                               ;B5B48D
    %AICMD0x13_Wait(80)                                        ;B5B48E
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 31)                  ;B5B491
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 60)                   ;B5B495
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 2)                      ;B5B499
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 15)                    ;B5B49D
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B5B4A1
    %AICMD0x56_UseEquippedItem()                               ;B5B4A3
    %AICMD0x13_Wait(80)                                        ;B5B4A4
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 15)                  ;B5B4A7
    %AICMD0x56_UseEquippedItem()                               ;B5B4AB
    %AICMD0x13_Wait(80)                                        ;B5B4AC
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 15)                  ;B5B4AF
    %AICMD0x56_UseEquippedItem()                               ;B5B4B3
    %AICMD0x13_Wait(80)                                        ;B5B4B4
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 15)                  ;B5B4B7
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B5B4BB
    %AICMD0x56_UseEquippedItem()                               ;B5B4BD
    %AICMD0x13_Wait(80)                                        ;B5B4BE
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 15)                    ;B5B4C1
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B5B4C5
    %AICMD0x56_UseEquippedItem()                               ;B5B4C7
    %AICMD0x13_Wait(80)                                        ;B5B4C8
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 15)                 ;B5B4CB
    %AICMD0x56_UseEquippedItem()                               ;B5B4CF
    %AICMD0x13_Wait(80)                                        ;B5B4D0
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 15)                 ;B5B4D3
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B5B4D7
    %AICMD0x56_UseEquippedItem()                               ;B5B4D9
    %AICMD0x13_Wait(80)                                        ;B5B4DA
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 15)                    ;B5B4DD
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B5B4E1
    %AICMD0x56_UseEquippedItem()                               ;B5B4E3
    %AICMD0x13_Wait(80)                                        ;B5B4E4
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 15)                  ;B5B4E7
    %AICMD0x56_UseEquippedItem()                               ;B5B4EB
    %AICMD0x13_Wait(80)                                        ;B5B4EC
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 63)                     ;B5B4EF
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 120)                  ;B5B4F3
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 40)                    ;B5B4F7
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $07)       ;B5B4FB
    %AICMD0x10_End()                                           ;B5B500


DATA8_B5B501:
 
    %AICMD0x58_ReplaceFarmTile($02, 448, 528)                  ;B5B501
    %AICMD0x58_ReplaceFarmTile($02, 464, 528)                  ;B5B507
    %AICMD0x58_ReplaceFarmTile($02, 464, 512)                  ;B5B50D
    %AICMD0x58_ReplaceFarmTile($02, 464, 544)                  ;B5B513
    %AICMD0x58_ReplaceFarmTile($02, 480, 560)                  ;B5B519
    %AICMD0x58_ReplaceFarmTile($02, 368, 576)                  ;B5B51F
    %AICMD0x58_ReplaceFarmTile($02, 384, 576)                  ;B5B525
    %AICMD0x58_ReplaceFarmTile($02, 368, 592)                  ;B5B52B
    %AICMD0x58_ReplaceFarmTile($02, 352, 544)                  ;B5B531
    %AICMD0x58_ReplaceFarmTile($02, 368, 544)                  ;B5B537
    %AICMD0x58_ReplaceFarmTile($02, 352, 560)                  ;B5B53D
    %AICMD0x58_ReplaceFarmTile($02, 368, 560)                  ;B5B543
    %AICMD0x58_ReplaceFarmTile($02, 416, 576)                  ;B5B549
    %AICMD0x58_ReplaceFarmTile($02, 432, 576)                  ;B5B54F
    %AICMD0x58_ReplaceFarmTile($02, 416, 592)                  ;B5B555
    %AICMD0x58_ReplaceFarmTile($02, 432, 592)                  ;B5B55B
    %AICMD0x58_ReplaceFarmTile($02, 464, 496)                  ;B5B561
    %AICMD0x58_ReplaceFarmTile($02, 448, 496)                  ;B5B567
    %AICMD0x58_ReplaceFarmTile($02, 432, 496)                  ;B5B56D
    %AICMD0x58_ReplaceFarmTile($02, 416, 496)                  ;B5B573
    %AICMD0x58_ReplaceFarmTile($02, 400, 496)                  ;B5B579
    %AICMD0x58_ReplaceFarmTile($02, 384, 496)                  ;B5B57F
    %AICMD0x58_ReplaceFarmTile($02, 368, 496)                  ;B5B585
    %AICMD0x58_ReplaceFarmTile($02, 352, 496)                  ;B5B58B
    %AICMD0x58_ReplaceFarmTile($02, 336, 496)                  ;B5B591
    %AICMD0x58_ReplaceFarmTile($02, 320, 496)                  ;B5B597
    %AICMD0x58_ReplaceFarmTile($05, 464, 560)                  ;B5B59D
    %AICMD0x58_ReplaceFarmTile($05, 448, 560)                  ;B5B5A3
    %AICMD0x58_ReplaceFarmTile($05, 432, 560)                  ;B5B5A9
    %AICMD0x58_ReplaceFarmTile($05, 416, 560)                  ;B5B5AF
    %AICMD0x58_ReplaceFarmTile($05, 400, 560)                  ;B5B5B5
    %AICMD0x58_ReplaceFarmTile($05, 384, 560)                  ;B5B5BB
    %AICMD0x58_ReplaceFarmTile($05, 368, 560)                  ;B5B5C1
    %AICMD0x58_ReplaceFarmTile($05, 352, 560)                  ;B5B5C7
    %AICMD0x58_ReplaceFarmTile($05, 336, 560)                  ;B5B5CD
    %AICMD0x58_ReplaceFarmTile($05, 320, 560)                  ;B5B5D3
    %AICMD0x58_ReplaceFarmTile($05, 320, 544)                  ;B5B5D9
    %AICMD0x58_ReplaceFarmTile($05, 320, 528)                  ;B5B5DF
    %AICMD0x58_ReplaceFarmTile($05, 320, 512)                  ;B5B5E5
    %AICMD0x58_ReplaceFarmTile($05, 320, 496)                  ;B5B5EB
    %AICMD0x58_ReplaceFarmTile($02, 336, 512)                  ;B5B5F1
    %AICMD0x58_ReplaceFarmTile($02, 352, 512)                  ;B5B5F7
    %AICMD0x58_ReplaceFarmTile($02, 368, 512)                  ;B5B5FD
    %AICMD0x58_ReplaceFarmTile($02, 320, 416)                  ;B5B603
    %AICMD0x58_ReplaceFarmTile($02, 320, 432)                  ;B5B609
    %AICMD0x58_ReplaceFarmTile($02, 288, 448)                  ;B5B60F
    %AICMD0x58_ReplaceFarmTile($02, 304, 448)                  ;B5B615
    %AICMD0x58_ReplaceFarmTile($02, 288, 464)                  ;B5B61B
    %AICMD0x58_ReplaceFarmTile($02, 304, 464)                  ;B5B621
    %AICMD0x58_ReplaceFarmTile($6E, 352, 496)                  ;B5B627
    %AICMD0x58_ReplaceFarmTile($6E, 368, 496)                  ;B5B62D
    %AICMD0x58_ReplaceFarmTile($6E, 384, 496)                  ;B5B633
    %AICMD0x58_ReplaceFarmTile($6E, 352, 512)                  ;B5B639
    %AICMD0x58_ReplaceFarmTile($6A, 368, 512)                  ;B5B63F
    %AICMD0x58_ReplaceFarmTile($6E, 384, 512)                  ;B5B645
    %AICMD0x58_ReplaceFarmTile($6E, 352, 528)                  ;B5B64B
    %AICMD0x58_ReplaceFarmTile($6E, 368, 528)                  ;B5B651
    %AICMD0x58_ReplaceFarmTile($6E, 384, 528)                  ;B5B657
    %AICMD0x58_ReplaceFarmTile($79, 416, 496)                  ;B5B65D
    %AICMD0x58_ReplaceFarmTile($79, 432, 496)                  ;B5B663
    %AICMD0x58_ReplaceFarmTile($79, 448, 496)                  ;B5B669
    %AICMD0x58_ReplaceFarmTile($79, 416, 512)                  ;B5B66F
    %AICMD0x58_ReplaceFarmTile($79, 432, 512)                  ;B5B675
    %AICMD0x58_ReplaceFarmTile($79, 448, 512)                  ;B5B67B
    %AICMD0x58_ReplaceFarmTile($79, 416, 528)                  ;B5B681
    %AICMD0x58_ReplaceFarmTile($79, 432, 528)                  ;B5B687
    %AICMD0x58_ReplaceFarmTile($79, 448, 528)                  ;B5B68D
    %AICMD0x47_SetValue8($800921, 0)                           ;B5B693
    %AICMD0x47_SetValue8($800923, 0)                           ;B5B698
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $06)       ;B5B69D
    %AICMD0x00_SetMusic($02, $B4)                              ;B5B6A2
    %AICMD0x02_FreezeTime()                                    ;B5B6A5
    %AICMD0x03_SetHour($07)                                    ;B5B6A6
    %AICMD0x05_SetTransferPosition(136, 344)                   ;B5B6A8
    %AICMD0x08_EnableAIControl()                               ;B5B6AD
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B5B6AE
    %AICMD0x09($01, pAIScripting0x47_HowToPlay_L001)                                   ;B5B6B0
    %AICMD0x47_SetValue8(nCurrentSeasonID, 1)                  ;B5B6B4
    %AICMD0x06_SetDestinationArea(!AREA_FARMSUMMER)            ;B5B6B9
    %AICMD0x38()                                               ;B5B6BB
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 32)                  ;B5B6BC
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 23)                  ;B5B6C0
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 39)                   ;B5B6C4
    %AICMD0x3E_SetCarryItem($0D)                               ;B5B6C8
    %AICMD0x13_Wait(40)                                        ;B5B6CA
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 15)                    ;B5B6CD
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 15)                 ;B5B6D1
    %AICMD0x3F_ThrowCarriedItem()                              ;B5B6D5
    %AICMD0x13_Wait(20)                                        ;B5B6D6
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 15)                   ;B5B6D9
    %AICMD0x3E_SetCarryItem($0D)                               ;B5B6DD
    %AICMD0x13_Wait(40)                                        ;B5B6DF
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 15)                    ;B5B6E2
    %AICMD0x3F_ThrowCarriedItem()                              ;B5B6E6
    %AICMD0x13_Wait(20)                                        ;B5B6E7
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 15)                   ;B5B6EA
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 79)                  ;B5B6EE
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B5B6F2
    %AICMD0x3E_SetCarryItem($13)                               ;B5B6F4
    %AICMD0x13_Wait(40)                                        ;B5B6F6
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 87)                   ;B5B6F9
    %AICMD0x3F_ThrowCarriedItem()                              ;B5B6FD
    %AICMD0x13_Wait(60)                                        ;B5B6FE
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 95)                  ;B5B701
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B5B705
    %AICMD0x3E_SetCarryItem($13)                               ;B5B707
    %AICMD0x13_Wait(40)                                        ;B5B709
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 95)                   ;B5B70C
    %AICMD0x3F_ThrowCarriedItem()                              ;B5B710
    %AICMD0x13_Wait(60)                                        ;B5B711
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 103)                 ;B5B714
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B5B718
    %AICMD0x3E_SetCarryItem($13)                               ;B5B71A
    %AICMD0x13_Wait(40)                                        ;B5B71C
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 103)                  ;B5B71F
    %AICMD0x3F_ThrowCarriedItem()                              ;B5B723
    %AICMD0x13_Wait(60)                                        ;B5B724
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 87)                  ;B5B727
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 15)                  ;B5B72B
    %AICMD0x3E_SetCarryItem($13)                               ;B5B72F
    %AICMD0x13_Wait(40)                                        ;B5B731
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 15)                    ;B5B734
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 87)                   ;B5B738
    %AICMD0x3F_ThrowCarriedItem()                              ;B5B73C
    %AICMD0x13_Wait(60)                                        ;B5B73D
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 103)                 ;B5B740
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 15)                  ;B5B744
    %AICMD0x3E_SetCarryItem($13)                               ;B5B748
    %AICMD0x13_Wait(40)                                        ;B5B74A
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 15)                     ;B5B74D
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 7)                    ;B5B751
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 14)                     ;B5B755
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B5B759
    %AICMD0x3F_ThrowCarriedItem()                              ;B5B75B
    %AICMD0x13_Wait(20)                                        ;B5B75C
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 23)                   ;B5B75F
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 7)                   ;B5B763
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 7)                    ;B5B767
    %AICMD0x3E_SetCarryItem($13)                               ;B5B76B
    %AICMD0x13_Wait(40)                                        ;B5B76D
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 7)                      ;B5B770
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 7)                    ;B5B774
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 23)                     ;B5B778
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B5B77C
    %AICMD0x3F_ThrowCarriedItem()                              ;B5B77E
    %AICMD0x13_Wait(20)                                        ;B5B77F
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 23)                   ;B5B782
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 7)                    ;B5B786
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 7)                    ;B5B78A
    %AICMD0x3E_SetCarryItem($13)                               ;B5B78E
    %AICMD0x13_Wait(40)                                        ;B5B790
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 7)                      ;B5B793
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 7)                   ;B5B797
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 23)                     ;B5B79B
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B5B79F
    %AICMD0x3F_ThrowCarriedItem()                              ;B5B7A1
    %AICMD0x13_Wait(20)                                        ;B5B7A2
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 23)                   ;B5B7A5
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 7)                    ;B5B7A9
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 15)                   ;B5B7AD
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B5B7B1
    %AICMD0x3E_SetCarryItem($13)                               ;B5B7B3
    %AICMD0x13_Wait(40)                                        ;B5B7B5
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 15)                     ;B5B7B8
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 7)                   ;B5B7BC
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 23)                     ;B5B7C0
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B5B7C4
    %AICMD0x3F_ThrowCarriedItem()                              ;B5B7C6
    %AICMD0x13_Wait(20)                                        ;B5B7C7
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 15)                   ;B5B7CA
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 23)                  ;B5B7CE
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 16)                    ;B5B7D2
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $07)       ;B5B7D6
    %AICMD0x10_End()                                           ;B5B7DB
pAIScripting0x47_HowToPlay_L001:
    %AICMD0x1A($0168, $01C8, aAIScriptingData_L006, $03)                     ;B5B7DC
    %AICMD0x13_Wait(240)                                       ;B5B7E4
    %AICMD0x13_Wait(240)                                       ;B5B7E7
    %AICMD0x13_Wait(240)                                       ;B5B7EA
    %AICMD0x13_Wait(240)                                       ;B5B7ED
    %AICMD0x13_Wait(240)                                       ;B5B7F0
    %AICMD0x13_Wait(240)                                       ;B5B7F3
    %AICMD0x13_Wait(240)                                       ;B5B7F6
    %AICMD0x1B($0208, $00)                                     ;B5B7F9
    %AICMD0x13_Wait(60)                                        ;B5B7FD
    %AICMD0x1B($0200, $00)                                     ;B5B800
    %AICMD0x13_Wait(80)                                        ;B5B804
    %AICMD0x1B($0208, $00)                                     ;B5B807
    %AICMD0x13_Wait(60)                                        ;B5B80B
    %AICMD0x1B($0200, $00)                                     ;B5B80E
    %AICMD0x13_Wait(80)                                        ;B5B812
    %AICMD0x1B($0208, $00)                                     ;B5B815
    %AICMD0x13_Wait(60)                                        ;B5B819
    %AICMD0x1B($0200, $00)                                     ;B5B81C
    %AICMD0x13_Wait(95)                                        ;B5B820
    %AICMD0x1B($0208, $00)                                     ;B5B823
    %AICMD0x13_Wait(60)                                        ;B5B827
    %AICMD0x1B($0200, $00)                                     ;B5B82A
pAIScripting0x47_HowToPlay_L002:
    %AICMD0x13_Wait(1)                                         ;B5B82E
    %AICMD0x12_Jump(pAIScripting0x47_HowToPlay_L002)                                   ;B5B831


DATA8_B5B834:
 
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $06)       ;B5B834
    %AICMD0x00_SetMusic($02, $B4)                              ;B5B839
    %AICMD0x02_FreezeTime()                                    ;B5B83C
    %AICMD0x03_SetHour($07)                                    ;B5B83D
    %AICMD0x05_SetTransferPosition(128, 200)                   ;B5B83F
    %AICMD0x08_EnableAIControl()                               ;B5B844
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B5B845
    %AICMD0x47_SetValue8(nCurrentSeasonID, 1)                  ;B5B847
    %AICMD0x06_SetDestinationArea(!AREA_SHED)                  ;B5B84C
    %AICMD0x38()                                               ;B5B84E
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 16)                    ;B5B84F
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 40)                 ;B5B853
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 8)                     ;B5B857
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B5B85B
    %AICMD0x3E_SetCarryItem($3B)                               ;B5B85D
    %AICMD0x13_Wait(60)                                        ;B5B85F
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 16)                  ;B5B862
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B5B866
    %AICMD0x3E_SetCarryItem($2A)                               ;B5B868
    %AICMD0x13_Wait(60)                                        ;B5B86A
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 24)                  ;B5B86D
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 32)                  ;B5B871
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $07)       ;B5B875
    %AICMD0x10_End()                                           ;B5B87A


DATA8_B5B87B:
 
    %AICMD0x58_ReplaceFarmTile($02, 448, 528)                  ;B5B87B
    %AICMD0x58_ReplaceFarmTile($02, 464, 528)                  ;B5B881
    %AICMD0x58_ReplaceFarmTile($02, 464, 512)                  ;B5B887
    %AICMD0x58_ReplaceFarmTile($02, 464, 544)                  ;B5B88D
    %AICMD0x58_ReplaceFarmTile($02, 480, 560)                  ;B5B893
    %AICMD0x58_ReplaceFarmTile($02, 368, 576)                  ;B5B899
    %AICMD0x58_ReplaceFarmTile($02, 384, 576)                  ;B5B89F
    %AICMD0x58_ReplaceFarmTile($02, 368, 592)                  ;B5B8A5
    %AICMD0x58_ReplaceFarmTile($02, 352, 544)                  ;B5B8AB
    %AICMD0x58_ReplaceFarmTile($02, 368, 544)                  ;B5B8B1
    %AICMD0x58_ReplaceFarmTile($02, 352, 560)                  ;B5B8B7
    %AICMD0x58_ReplaceFarmTile($02, 368, 560)                  ;B5B8BD
    %AICMD0x58_ReplaceFarmTile($02, 416, 576)                  ;B5B8C3
    %AICMD0x58_ReplaceFarmTile($02, 432, 576)                  ;B5B8C9
    %AICMD0x58_ReplaceFarmTile($02, 416, 592)                  ;B5B8CF
    %AICMD0x58_ReplaceFarmTile($02, 432, 592)                  ;B5B8D5
    %AICMD0x58_ReplaceFarmTile($02, 464, 496)                  ;B5B8DB
    %AICMD0x58_ReplaceFarmTile($02, 448, 496)                  ;B5B8E1
    %AICMD0x58_ReplaceFarmTile($02, 432, 496)                  ;B5B8E7
    %AICMD0x58_ReplaceFarmTile($02, 416, 496)                  ;B5B8ED
    %AICMD0x58_ReplaceFarmTile($02, 400, 496)                  ;B5B8F3
    %AICMD0x58_ReplaceFarmTile($02, 384, 496)                  ;B5B8F9
    %AICMD0x58_ReplaceFarmTile($02, 368, 496)                  ;B5B8FF
    %AICMD0x58_ReplaceFarmTile($02, 352, 496)                  ;B5B905
    %AICMD0x58_ReplaceFarmTile($02, 336, 496)                  ;B5B90B
    %AICMD0x58_ReplaceFarmTile($02, 320, 496)                  ;B5B911
    %AICMD0x58_ReplaceFarmTile($05, 464, 560)                  ;B5B917
    %AICMD0x58_ReplaceFarmTile($05, 448, 560)                  ;B5B91D
    %AICMD0x58_ReplaceFarmTile($05, 432, 560)                  ;B5B923
    %AICMD0x58_ReplaceFarmTile($05, 416, 560)                  ;B5B929
    %AICMD0x58_ReplaceFarmTile($05, 400, 560)                  ;B5B92F
    %AICMD0x58_ReplaceFarmTile($05, 384, 560)                  ;B5B935
    %AICMD0x58_ReplaceFarmTile($05, 368, 560)                  ;B5B93B
    %AICMD0x58_ReplaceFarmTile($05, 352, 560)                  ;B5B941
    %AICMD0x58_ReplaceFarmTile($05, 336, 560)                  ;B5B947
    %AICMD0x58_ReplaceFarmTile($05, 320, 560)                  ;B5B94D
    %AICMD0x58_ReplaceFarmTile($05, 320, 544)                  ;B5B953
    %AICMD0x58_ReplaceFarmTile($05, 320, 528)                  ;B5B959
    %AICMD0x58_ReplaceFarmTile($05, 320, 512)                  ;B5B95F
    %AICMD0x58_ReplaceFarmTile($05, 320, 496)                  ;B5B965
    %AICMD0x58_ReplaceFarmTile($02, 336, 512)                  ;B5B96B
    %AICMD0x58_ReplaceFarmTile($02, 352, 512)                  ;B5B971
    %AICMD0x58_ReplaceFarmTile($02, 368, 512)                  ;B5B977
    %AICMD0x58_ReplaceFarmTile($02, 320, 416)                  ;B5B97D
    %AICMD0x58_ReplaceFarmTile($02, 320, 432)                  ;B5B983
    %AICMD0x58_ReplaceFarmTile($02, 288, 448)                  ;B5B989
    %AICMD0x58_ReplaceFarmTile($02, 304, 448)                  ;B5B98F
    %AICMD0x58_ReplaceFarmTile($02, 288, 464)                  ;B5B995
    %AICMD0x58_ReplaceFarmTile($02, 304, 464)                  ;B5B99B
    %AICMD0x58_ReplaceFarmTile($07, 352, 496)                  ;B5B9A1
    %AICMD0x58_ReplaceFarmTile($07, 368, 496)                  ;B5B9A7
    %AICMD0x58_ReplaceFarmTile($07, 384, 496)                  ;B5B9AD
    %AICMD0x58_ReplaceFarmTile($07, 352, 512)                  ;B5B9B3
    %AICMD0x58_ReplaceFarmTile($6A, 368, 512)                  ;B5B9B9
    %AICMD0x58_ReplaceFarmTile($07, 384, 512)                  ;B5B9BF
    %AICMD0x58_ReplaceFarmTile($07, 352, 528)                  ;B5B9C5
    %AICMD0x58_ReplaceFarmTile($07, 368, 528)                  ;B5B9CB
    %AICMD0x58_ReplaceFarmTile($07, 384, 528)                  ;B5B9D1
    %AICMD0x58_ReplaceFarmTile($79, 416, 496)                  ;B5B9D7
    %AICMD0x58_ReplaceFarmTile($79, 432, 496)                  ;B5B9DD
    %AICMD0x58_ReplaceFarmTile($79, 448, 496)                  ;B5B9E3
    %AICMD0x58_ReplaceFarmTile($79, 416, 512)                  ;B5B9E9
    %AICMD0x58_ReplaceFarmTile($79, 432, 512)                  ;B5B9EF
    %AICMD0x58_ReplaceFarmTile($79, 448, 512)                  ;B5B9F5
    %AICMD0x58_ReplaceFarmTile($79, 416, 528)                  ;B5B9FB
    %AICMD0x58_ReplaceFarmTile($79, 432, 528)                  ;B5BA01
    %AICMD0x58_ReplaceFarmTile($79, 448, 528)                  ;B5BA07
    %AICMD0x58_ReplaceFarmTile($02, 176, 464)                  ;B5BA0D
    %AICMD0x58_ReplaceFarmTile($02, 192, 480)                  ;B5BA13
    %AICMD0x58_ReplaceFarmTile($04, 192, 432)                  ;B5BA19
    %AICMD0x58_ReplaceFarmTile($04, 208, 432)                  ;B5BA1F
    %AICMD0x47_SetValue8($800921, 1)                           ;B5BA25
    %AICMD0x47_SetValue8($800923, 18)                          ;B5BA2A
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $06)       ;B5BA2F
    %AICMD0x00_SetMusic($02, $B4)                              ;B5BA34
    %AICMD0x02_FreezeTime()                                    ;B5BA37
    %AICMD0x03_SetHour($07)                                    ;B5BA38
    %AICMD0x05_SetTransferPosition(424, 488)                   ;B5BA3A
    %AICMD0x08_EnableAIControl()                               ;B5BA3F
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B5BA40
    %AICMD0x47_SetValue8(nCurrentSeasonID, 1)                  ;B5BA42
    %AICMD0x06_SetDestinationArea(!AREA_FARMSUMMER)            ;B5BA47
    %AICMD0x38()                                               ;B5BA49
    %AICMD0x56_UseEquippedItem()                               ;B5BA4A
    %AICMD0x13_Wait(60)                                        ;B5BA4B
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 15)                  ;B5BA4E
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B5BA52
    %AICMD0x56_UseEquippedItem()                               ;B5BA54
    %AICMD0x13_Wait(60)                                        ;B5BA55
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 15)                 ;B5BA58
    %AICMD0x56_UseEquippedItem()                               ;B5BA5C
    %AICMD0x13_Wait(60)                                        ;B5BA5D
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 15)                 ;B5BA60
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B5BA64
    %AICMD0x56_UseEquippedItem()                               ;B5BA66
    %AICMD0x13_Wait(60)                                        ;B5BA67
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 15)                  ;B5BA6A
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B5BA6E
    %AICMD0x56_UseEquippedItem()                               ;B5BA70
    %AICMD0x13_Wait(60)                                        ;B5BA71
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 15)                  ;B5BA74
    %AICMD0x56_UseEquippedItem()                               ;B5BA78
    %AICMD0x13_Wait(60)                                        ;B5BA79
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 15)                  ;B5BA7C
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B5BA80
    %AICMD0x56_UseEquippedItem()                               ;B5BA82
    %AICMD0x13_Wait(60)                                        ;B5BA83
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 15)                  ;B5BA86
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B5BA8A
    %AICMD0x56_UseEquippedItem()                               ;B5BA8C
    %AICMD0x13_Wait(60)                                        ;B5BA8D
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 15)                 ;B5BA90
    %AICMD0x56_UseEquippedItem()                               ;B5BA94
    %AICMD0x13_Wait(60)                                        ;B5BA95
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 48)                   ;B5BA98
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 16)                   ;B5BA9C
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 16)                  ;B5BAA0
    %AICMD0x3E_SetCarryItem($09)                               ;B5BAA4
    %AICMD0x13_Wait(40)                                        ;B5BAA6
    %AICMD0x3F_ThrowCarriedItem()                              ;B5BAA9
    %AICMD0x13_Wait(20)                                        ;B5BAAA
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 32)                  ;B5BAAD
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B5BAB1
    %AICMD0x3E_SetCarryItem($09)                               ;B5BAB3
    %AICMD0x13_Wait(40)                                        ;B5BAB5
    %AICMD0x3F_ThrowCarriedItem()                              ;B5BAB8
    %AICMD0x13_Wait(20)                                        ;B5BAB9
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 15)                  ;B5BABC
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B5BAC0
    %AICMD0x3E_SetCarryItem($09)                               ;B5BAC2
    %AICMD0x13_Wait(40)                                        ;B5BAC4
    %AICMD0x3F_ThrowCarriedItem()                              ;B5BAC7
    %AICMD0x13_Wait(20)                                        ;B5BAC8
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 15)                  ;B5BACB
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 15)                    ;B5BACF
    %AICMD0x3E_SetCarryItem($09)                               ;B5BAD3
    %AICMD0x13_Wait(40)                                        ;B5BAD5
    %AICMD0x3F_ThrowCarriedItem()                              ;B5BAD8
    %AICMD0x13_Wait(20)                                        ;B5BAD9
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 8)                   ;B5BADC
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 7)                      ;B5BAE0
    %AICMD0x3E_SetCarryItem($0F)                               ;B5BAE4
    %AICMD0x13_Wait(40)                                        ;B5BAE6
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B5BAE9
    %AICMD0x3F_ThrowCarriedItem()                              ;B5BAEB
    %AICMD0x13_Wait(20)                                        ;B5BAEC
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 7)                   ;B5BAEF
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B5BAF3
    %AICMD0x3E_SetCarryItem($0F)                               ;B5BAF5
    %AICMD0x13_Wait(40)                                        ;B5BAF7
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 7)                    ;B5BAFA
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 7)                    ;B5BAFE
    %AICMD0x3F_ThrowCarriedItem()                              ;B5BB02
    %AICMD0x13_Wait(20)                                        ;B5BB03
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 15)                  ;B5BB06
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 7)                      ;B5BB0A
    %AICMD0x3E_SetCarryItem($0F)                               ;B5BB0E
    %AICMD0x13_Wait(40)                                        ;B5BB10
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 15)                   ;B5BB13
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 15)                   ;B5BB17
    %AICMD0x3F_ThrowCarriedItem()                              ;B5BB1B
    %AICMD0x13_Wait(20)                                        ;B5BB1C
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 23)                  ;B5BB1F
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 15)                     ;B5BB23
    %AICMD0x3E_SetCarryItem($0F)                               ;B5BB27
    %AICMD0x13_Wait(40)                                        ;B5BB29
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 23)                   ;B5BB2C
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 23)                   ;B5BB30
    %AICMD0x3F_ThrowCarriedItem()                              ;B5BB34
    %AICMD0x13_Wait(20)                                        ;B5BB35
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 31)                  ;B5BB38
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 23)                     ;B5BB3C
    %AICMD0x3E_SetCarryItem($0F)                               ;B5BB40
    %AICMD0x13_Wait(40)                                        ;B5BB42
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 23)                   ;B5BB45
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 23)                   ;B5BB49
    %AICMD0x3F_ThrowCarriedItem()                              ;B5BB4D
    %AICMD0x13_Wait(20)                                        ;B5BB4E
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 31)                  ;B5BB51
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 23)                     ;B5BB55
    %AICMD0x3E_SetCarryItem($0F)                               ;B5BB59
    %AICMD0x13_Wait(40)                                        ;B5BB5B
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 23)                   ;B5BB5E
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 23)                   ;B5BB62
    %AICMD0x3F_ThrowCarriedItem()                              ;B5BB66
    %AICMD0x13_Wait(20)                                        ;B5BB67
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 23)                  ;B5BB6A
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 31)                     ;B5BB6E
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B5BB72
    %AICMD0x3E_SetCarryItem($0F)                               ;B5BB74
    %AICMD0x13_Wait(40)                                        ;B5BB76
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 31)                   ;B5BB79
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 15)                   ;B5BB7D
    %AICMD0x3F_ThrowCarriedItem()                              ;B5BB81
    %AICMD0x13_Wait(20)                                        ;B5BB82
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 15)                  ;B5BB85
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 23)                     ;B5BB89
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B5BB8D
    %AICMD0x3E_SetCarryItem($0F)                               ;B5BB8F
    %AICMD0x13_Wait(40)                                        ;B5BB91
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 23)                   ;B5BB94
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 7)                    ;B5BB98
    %AICMD0x3F_ThrowCarriedItem()                              ;B5BB9C
    %AICMD0x13_Wait(20)                                        ;B5BB9D
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 7)                   ;B5BBA0
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 15)                     ;B5BBA4
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B5BBA8
    %AICMD0x3E_SetCarryItem($0F)                               ;B5BBAA
    %AICMD0x13_Wait(40)                                        ;B5BBAC
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 7)                    ;B5BBAF
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 7)                    ;B5BBB3
    %AICMD0x3F_ThrowCarriedItem()                              ;B5BBB7
    %AICMD0x13_Wait(20)                                        ;B5BBB8
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 7)                   ;B5BBBB
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B5BBBF
    %AICMD0x3E_SetCarryItem($0F)                               ;B5BBC1
    %AICMD0x13_Wait(40)                                        ;B5BBC3
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B5BBC6
    %AICMD0x3F_ThrowCarriedItem()                              ;B5BBC8
    %AICMD0x13_Wait(20)                                        ;B5BBC9
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 15)                  ;B5BBCC
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 9)                      ;B5BBD0
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B5BBD4
    %AICMD0x59_SwapEquippedItems()                             ;B5BBD6
    %AICMD0x13_Wait(60)                                        ;B5BBD7
    %AICMD0x56_UseEquippedItem()                               ;B5BBDA
    %AICMD0x13_Wait(120)                                       ;B5BBDB
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 31)                    ;B5BBDE
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B5BBE2
    %AICMD0x56_UseEquippedItem()                               ;B5BBE4
    %AICMD0x13_Wait(120)                                       ;B5BBE5
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 11)                    ;B5BBE8
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 39)                  ;B5BBEC
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 15)                    ;B5BBF0
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $07)       ;B5BBF4
    %AICMD0x10_End()                                           ;B5BBF9


DATA8_B5BBFA:
 
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $06)       ;B5BBFA
    %AICMD0x00_SetMusic($02, $B4)                              ;B5BBFF
    %AICMD0x02_FreezeTime()                                    ;B5BC02
    %AICMD0x03_SetHour($07)                                    ;B5BC03
    %AICMD0x05_SetTransferPosition(128, 200)                   ;B5BC05
    %AICMD0x08_EnableAIControl()                               ;B5BC0A
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B5BC0B
    %AICMD0x47_SetValue8(nCurrentSeasonID, 1)                  ;B5BC0D
    %AICMD0x06_SetDestinationArea(!AREA_SHED)                  ;B5BC12
    %AICMD0x38()                                               ;B5BC14
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 64)                    ;B5BC15
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 40)                 ;B5BC19
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 8)                     ;B5BC1D
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B5BC21
    %AICMD0x3E_SetCarryItem($2F)                               ;B5BC23
    %AICMD0x13_Wait(60)                                        ;B5BC25
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 16)                  ;B5BC28
    %AICMD0x59_SwapEquippedItems()                             ;B5BC2C
    %AICMD0x13_Wait(60)                                        ;B5BC2D
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B5BC30
    %AICMD0x3E_SetCarryItem($2E)                               ;B5BC32
    %AICMD0x13_Wait(60)                                        ;B5BC34
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 24)                  ;B5BC37
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 80)                  ;B5BC3B
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $07)       ;B5BC3F
    %AICMD0x10_End()                                           ;B5BC44


DATA8_B5BC45:
 
    %AICMD0x58_ReplaceFarmTile($02, 448, 528)                  ;B5BC45
    %AICMD0x58_ReplaceFarmTile($02, 464, 528)                  ;B5BC4B
    %AICMD0x58_ReplaceFarmTile($02, 464, 512)                  ;B5BC51
    %AICMD0x58_ReplaceFarmTile($02, 464, 544)                  ;B5BC57
    %AICMD0x58_ReplaceFarmTile($02, 480, 560)                  ;B5BC5D
    %AICMD0x58_ReplaceFarmTile($02, 368, 576)                  ;B5BC63
    %AICMD0x58_ReplaceFarmTile($02, 384, 576)                  ;B5BC69
    %AICMD0x58_ReplaceFarmTile($02, 368, 592)                  ;B5BC6F
    %AICMD0x58_ReplaceFarmTile($02, 352, 544)                  ;B5BC75
    %AICMD0x58_ReplaceFarmTile($02, 368, 544)                  ;B5BC7B
    %AICMD0x58_ReplaceFarmTile($02, 352, 560)                  ;B5BC81
    %AICMD0x58_ReplaceFarmTile($02, 368, 560)                  ;B5BC87
    %AICMD0x58_ReplaceFarmTile($02, 416, 576)                  ;B5BC8D
    %AICMD0x58_ReplaceFarmTile($02, 432, 576)                  ;B5BC93
    %AICMD0x58_ReplaceFarmTile($02, 416, 592)                  ;B5BC99
    %AICMD0x58_ReplaceFarmTile($02, 432, 592)                  ;B5BC9F
    %AICMD0x58_ReplaceFarmTile($02, 464, 496)                  ;B5BCA5
    %AICMD0x58_ReplaceFarmTile($02, 448, 496)                  ;B5BCAB
    %AICMD0x58_ReplaceFarmTile($02, 432, 496)                  ;B5BCB1
    %AICMD0x58_ReplaceFarmTile($02, 416, 496)                  ;B5BCB7
    %AICMD0x58_ReplaceFarmTile($02, 400, 496)                  ;B5BCBD
    %AICMD0x58_ReplaceFarmTile($02, 384, 496)                  ;B5BCC3
    %AICMD0x58_ReplaceFarmTile($02, 368, 496)                  ;B5BCC9
    %AICMD0x58_ReplaceFarmTile($02, 352, 496)                  ;B5BCCF
    %AICMD0x58_ReplaceFarmTile($02, 336, 496)                  ;B5BCD5
    %AICMD0x58_ReplaceFarmTile($02, 320, 496)                  ;B5BCDB
    %AICMD0x58_ReplaceFarmTile($05, 464, 560)                  ;B5BCE1
    %AICMD0x58_ReplaceFarmTile($05, 448, 560)                  ;B5BCE7
    %AICMD0x58_ReplaceFarmTile($05, 432, 560)                  ;B5BCED
    %AICMD0x58_ReplaceFarmTile($05, 416, 560)                  ;B5BCF3
    %AICMD0x58_ReplaceFarmTile($05, 400, 560)                  ;B5BCF9
    %AICMD0x58_ReplaceFarmTile($05, 384, 560)                  ;B5BCFF
    %AICMD0x58_ReplaceFarmTile($05, 368, 560)                  ;B5BD05
    %AICMD0x58_ReplaceFarmTile($05, 352, 560)                  ;B5BD0B
    %AICMD0x58_ReplaceFarmTile($05, 336, 560)                  ;B5BD11
    %AICMD0x58_ReplaceFarmTile($05, 320, 560)                  ;B5BD17
    %AICMD0x58_ReplaceFarmTile($05, 320, 544)                  ;B5BD1D
    %AICMD0x58_ReplaceFarmTile($05, 320, 528)                  ;B5BD23
    %AICMD0x58_ReplaceFarmTile($05, 320, 512)                  ;B5BD29
    %AICMD0x58_ReplaceFarmTile($05, 320, 496)                  ;B5BD2F
    %AICMD0x58_ReplaceFarmTile($02, 336, 512)                  ;B5BD35
    %AICMD0x58_ReplaceFarmTile($02, 352, 512)                  ;B5BD3B
    %AICMD0x58_ReplaceFarmTile($02, 368, 512)                  ;B5BD41
    %AICMD0x58_ReplaceFarmTile($02, 320, 416)                  ;B5BD47
    %AICMD0x58_ReplaceFarmTile($02, 320, 432)                  ;B5BD4D
    %AICMD0x58_ReplaceFarmTile($02, 288, 448)                  ;B5BD53
    %AICMD0x58_ReplaceFarmTile($02, 304, 448)                  ;B5BD59
    %AICMD0x58_ReplaceFarmTile($02, 288, 464)                  ;B5BD5F
    %AICMD0x58_ReplaceFarmTile($02, 304, 464)                  ;B5BD65
    %AICMD0x58_ReplaceFarmTile($07, 352, 496)                  ;B5BD6B
    %AICMD0x58_ReplaceFarmTile($07, 368, 496)                  ;B5BD71
    %AICMD0x58_ReplaceFarmTile($07, 384, 496)                  ;B5BD77
    %AICMD0x58_ReplaceFarmTile($07, 352, 512)                  ;B5BD7D
    %AICMD0x58_ReplaceFarmTile($6A, 368, 512)                  ;B5BD83
    %AICMD0x58_ReplaceFarmTile($07, 384, 512)                  ;B5BD89
    %AICMD0x58_ReplaceFarmTile($07, 352, 528)                  ;B5BD8F
    %AICMD0x58_ReplaceFarmTile($07, 368, 528)                  ;B5BD95
    %AICMD0x58_ReplaceFarmTile($07, 384, 528)                  ;B5BD9B
    %AICMD0x58_ReplaceFarmTile($79, 416, 496)                  ;B5BDA1
    %AICMD0x58_ReplaceFarmTile($79, 432, 496)                  ;B5BDA7
    %AICMD0x58_ReplaceFarmTile($79, 448, 496)                  ;B5BDAD
    %AICMD0x58_ReplaceFarmTile($79, 416, 512)                  ;B5BDB3
    %AICMD0x58_ReplaceFarmTile($79, 432, 512)                  ;B5BDB9
    %AICMD0x58_ReplaceFarmTile($79, 448, 512)                  ;B5BDBF
    %AICMD0x58_ReplaceFarmTile($79, 416, 528)                  ;B5BDC5
    %AICMD0x58_ReplaceFarmTile($79, 432, 528)                  ;B5BDCB
    %AICMD0x58_ReplaceFarmTile($79, 448, 528)                  ;B5BDD1
    %AICMD0x58_ReplaceFarmTile($02, 176, 464)                  ;B5BDD7
    %AICMD0x58_ReplaceFarmTile($02, 192, 480)                  ;B5BDDD
    %AICMD0x58_ReplaceFarmTile($04, 192, 432)                  ;B5BDE3
    %AICMD0x58_ReplaceFarmTile($04, 208, 432)                  ;B5BDE9
    %AICMD0x58_ReplaceFarmTile($05, 208, 496)                  ;B5BDEF
    %AICMD0x58_ReplaceFarmTile($05, 208, 512)                  ;B5BDF5
    %AICMD0x58_ReplaceFarmTile($05, 208, 528)                  ;B5BDFB
    %AICMD0x58_ReplaceFarmTile($05, 208, 544)                  ;B5BE01
    %AICMD0x58_ReplaceFarmTile($05, 208, 560)                  ;B5BE07
    %AICMD0x58_ReplaceFarmTile($05, 224, 560)                  ;B5BE0D
    %AICMD0x58_ReplaceFarmTile($05, 240, 560)                  ;B5BE13
    %AICMD0x58_ReplaceFarmTile($05, 256, 560)                  ;B5BE19
    %AICMD0x58_ReplaceFarmTile($05, 272, 560)                  ;B5BE1F
    %AICMD0x58_ReplaceFarmTile($05, 288, 560)                  ;B5BE25
    %AICMD0x58_ReplaceFarmTile($05, 304, 560)                  ;B5BE2B
    %AICMD0x58_ReplaceFarmTile($07, 240, 496)                  ;B5BE31
    %AICMD0x58_ReplaceFarmTile($07, 256, 496)                  ;B5BE37
    %AICMD0x58_ReplaceFarmTile($07, 272, 496)                  ;B5BE3D
    %AICMD0x58_ReplaceFarmTile($07, 288, 496)                  ;B5BE43
    %AICMD0x58_ReplaceFarmTile($07, 304, 496)                  ;B5BE49
    %AICMD0x58_ReplaceFarmTile($07, 320, 496)                  ;B5BE4F
    %AICMD0x58_ReplaceFarmTile($07, 240, 528)                  ;B5BE55
    %AICMD0x58_ReplaceFarmTile($07, 256, 528)                  ;B5BE5B
    %AICMD0x58_ReplaceFarmTile($07, 272, 528)                  ;B5BE61
    %AICMD0x58_ReplaceFarmTile($07, 288, 528)                  ;B5BE67
    %AICMD0x58_ReplaceFarmTile($07, 304, 528)                  ;B5BE6D
    %AICMD0x58_ReplaceFarmTile($07, 320, 528)                  ;B5BE73
    %AICMD0x58_ReplaceFarmTile($02, 224, 496)                  ;B5BE79
    %AICMD0x58_ReplaceFarmTile($02, 320, 512)                  ;B5BE7F
    %AICMD0x58_ReplaceFarmTile($02, 320, 544)                  ;B5BE85
    %AICMD0x47_SetValue8($800921, 5)                           ;B5BE8B
    %AICMD0x47_SetValue8($800923, 6)                           ;B5BE90
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $06)       ;B5BE95
    %AICMD0x00_SetMusic($02, $B4)                              ;B5BE9A
    %AICMD0x02_FreezeTime()                                    ;B5BE9D
    %AICMD0x03_SetHour($07)                                    ;B5BE9E
    %AICMD0x05_SetTransferPosition(424, 488)                   ;B5BEA0
    %AICMD0x08_EnableAIControl()                               ;B5BEA5
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B5BEA6
    %AICMD0x47_SetValue8(nCurrentSeasonID, 1)                  ;B5BEA8
    %AICMD0x06_SetDestinationArea(!AREA_FARMSUMMER)            ;B5BEAD
    %AICMD0x38()                                               ;B5BEAF
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 79)                   ;B5BEB0
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 15)                   ;B5BEB4
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B5BEB8
    %AICMD0x56_UseEquippedItem()                               ;B5BEBA
    %AICMD0x13_Wait(120)                                       ;B5BEBB
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 47)                 ;B5BEBE
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B5BEC2
    %AICMD0x59_SwapEquippedItems()                             ;B5BEC4
    %AICMD0x13_Wait(60)                                        ;B5BEC5
    %AICMD0x56_UseEquippedItem()                               ;B5BEC8
    %AICMD0x13_Wait(120)                                       ;B5BEC9
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 15)                     ;B5BECC
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 55)                  ;B5BED0
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 8)                     ;B5BED4
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $07)       ;B5BED8
    %AICMD0x10_End()                                           ;B5BEDD


DATA8_B5BEDE:
 
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $06)       ;B5BEDE
    %AICMD0x00_SetMusic($02, $B4)                              ;B5BEE3
    %AICMD0x02_FreezeTime()                                    ;B5BEE6
    %AICMD0x03_SetHour($07)                                    ;B5BEE7
    %AICMD0x05_SetTransferPosition(128, 200)                   ;B5BEE9
    %AICMD0x08_EnableAIControl()                               ;B5BEEE
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B5BEEF
    %AICMD0x47_SetValue8(nCurrentSeasonID, 1)                  ;B5BEF1
    %AICMD0x06_SetDestinationArea(!AREA_SHED)                  ;B5BEF6
    %AICMD0x38()                                               ;B5BEF8
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 16)                    ;B5BEF9
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 24)                  ;B5BEFD
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 8)                     ;B5BF01
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B5BF05
    %AICMD0x3E_SetCarryItem($3E)                               ;B5BF07
    %AICMD0x13_Wait(60)                                        ;B5BF09
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 24)                 ;B5BF0C
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 32)                  ;B5BF10
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $07)       ;B5BF14
    %AICMD0x10_End()                                           ;B5BF19


DATA8_B5BF1A:
 
    %AICMD0x58_ReplaceFarmTile($02, 448, 528)                  ;B5BF1A
    %AICMD0x58_ReplaceFarmTile($02, 464, 528)                  ;B5BF20
    %AICMD0x58_ReplaceFarmTile($02, 464, 512)                  ;B5BF26
    %AICMD0x58_ReplaceFarmTile($02, 464, 544)                  ;B5BF2C
    %AICMD0x58_ReplaceFarmTile($02, 480, 560)                  ;B5BF32
    %AICMD0x58_ReplaceFarmTile($02, 368, 576)                  ;B5BF38
    %AICMD0x58_ReplaceFarmTile($02, 384, 576)                  ;B5BF3E
    %AICMD0x58_ReplaceFarmTile($02, 368, 592)                  ;B5BF44
    %AICMD0x58_ReplaceFarmTile($02, 352, 544)                  ;B5BF4A
    %AICMD0x58_ReplaceFarmTile($02, 368, 544)                  ;B5BF50
    %AICMD0x58_ReplaceFarmTile($02, 352, 560)                  ;B5BF56
    %AICMD0x58_ReplaceFarmTile($02, 368, 560)                  ;B5BF5C
    %AICMD0x58_ReplaceFarmTile($02, 416, 576)                  ;B5BF62
    %AICMD0x58_ReplaceFarmTile($02, 432, 576)                  ;B5BF68
    %AICMD0x58_ReplaceFarmTile($02, 416, 592)                  ;B5BF6E
    %AICMD0x58_ReplaceFarmTile($02, 432, 592)                  ;B5BF74
    %AICMD0x58_ReplaceFarmTile($02, 464, 496)                  ;B5BF7A
    %AICMD0x58_ReplaceFarmTile($02, 448, 496)                  ;B5BF80
    %AICMD0x58_ReplaceFarmTile($02, 432, 496)                  ;B5BF86
    %AICMD0x58_ReplaceFarmTile($02, 416, 496)                  ;B5BF8C
    %AICMD0x58_ReplaceFarmTile($02, 400, 496)                  ;B5BF92
    %AICMD0x58_ReplaceFarmTile($02, 384, 496)                  ;B5BF98
    %AICMD0x58_ReplaceFarmTile($02, 368, 496)                  ;B5BF9E
    %AICMD0x58_ReplaceFarmTile($02, 352, 496)                  ;B5BFA4
    %AICMD0x58_ReplaceFarmTile($02, 336, 496)                  ;B5BFAA
    %AICMD0x58_ReplaceFarmTile($02, 320, 496)                  ;B5BFB0
    %AICMD0x58_ReplaceFarmTile($05, 464, 560)                  ;B5BFB6
    %AICMD0x58_ReplaceFarmTile($05, 448, 560)                  ;B5BFBC
    %AICMD0x58_ReplaceFarmTile($05, 432, 560)                  ;B5BFC2
    %AICMD0x58_ReplaceFarmTile($05, 416, 560)                  ;B5BFC8
    %AICMD0x58_ReplaceFarmTile($05, 400, 560)                  ;B5BFCE
    %AICMD0x58_ReplaceFarmTile($05, 384, 560)                  ;B5BFD4
    %AICMD0x58_ReplaceFarmTile($05, 368, 560)                  ;B5BFDA
    %AICMD0x58_ReplaceFarmTile($05, 352, 560)                  ;B5BFE0
    %AICMD0x58_ReplaceFarmTile($05, 336, 560)                  ;B5BFE6
    %AICMD0x58_ReplaceFarmTile($05, 320, 560)                  ;B5BFEC
    %AICMD0x58_ReplaceFarmTile($05, 320, 544)                  ;B5BFF2
    %AICMD0x58_ReplaceFarmTile($05, 320, 528)                  ;B5BFF8
    %AICMD0x58_ReplaceFarmTile($05, 320, 512)                  ;B5BFFE
    %AICMD0x58_ReplaceFarmTile($05, 320, 496)                  ;B5C004
    %AICMD0x58_ReplaceFarmTile($02, 336, 512)                  ;B5C00A
    %AICMD0x58_ReplaceFarmTile($02, 352, 512)                  ;B5C010
    %AICMD0x58_ReplaceFarmTile($02, 368, 512)                  ;B5C016
    %AICMD0x58_ReplaceFarmTile($02, 320, 416)                  ;B5C01C
    %AICMD0x58_ReplaceFarmTile($02, 320, 432)                  ;B5C022
    %AICMD0x58_ReplaceFarmTile($02, 288, 448)                  ;B5C028
    %AICMD0x58_ReplaceFarmTile($02, 304, 448)                  ;B5C02E
    %AICMD0x58_ReplaceFarmTile($02, 288, 464)                  ;B5C034
    %AICMD0x58_ReplaceFarmTile($02, 304, 464)                  ;B5C03A
    %AICMD0x58_ReplaceFarmTile($07, 352, 496)                  ;B5C040
    %AICMD0x58_ReplaceFarmTile($07, 368, 496)                  ;B5C046
    %AICMD0x58_ReplaceFarmTile($07, 384, 496)                  ;B5C04C
    %AICMD0x58_ReplaceFarmTile($07, 352, 512)                  ;B5C052
    %AICMD0x58_ReplaceFarmTile($6A, 368, 512)                  ;B5C058
    %AICMD0x58_ReplaceFarmTile($07, 384, 512)                  ;B5C05E
    %AICMD0x58_ReplaceFarmTile($07, 352, 528)                  ;B5C064
    %AICMD0x58_ReplaceFarmTile($07, 368, 528)                  ;B5C06A
    %AICMD0x58_ReplaceFarmTile($07, 384, 528)                  ;B5C070
    %AICMD0x58_ReplaceFarmTile($79, 416, 496)                  ;B5C076
    %AICMD0x58_ReplaceFarmTile($79, 432, 496)                  ;B5C07C
    %AICMD0x58_ReplaceFarmTile($79, 448, 496)                  ;B5C082
    %AICMD0x58_ReplaceFarmTile($79, 416, 512)                  ;B5C088
    %AICMD0x58_ReplaceFarmTile($79, 432, 512)                  ;B5C08E
    %AICMD0x58_ReplaceFarmTile($79, 448, 512)                  ;B5C094
    %AICMD0x58_ReplaceFarmTile($79, 416, 528)                  ;B5C09A
    %AICMD0x58_ReplaceFarmTile($79, 432, 528)                  ;B5C0A0
    %AICMD0x58_ReplaceFarmTile($79, 448, 528)                  ;B5C0A6
    %AICMD0x58_ReplaceFarmTile($02, 176, 464)                  ;B5C0AC
    %AICMD0x58_ReplaceFarmTile($02, 192, 480)                  ;B5C0B2
    %AICMD0x58_ReplaceFarmTile($04, 192, 432)                  ;B5C0B8
    %AICMD0x58_ReplaceFarmTile($04, 208, 432)                  ;B5C0BE
    %AICMD0x58_ReplaceFarmTile($05, 208, 496)                  ;B5C0C4
    %AICMD0x58_ReplaceFarmTile($05, 208, 512)                  ;B5C0CA
    %AICMD0x58_ReplaceFarmTile($05, 208, 528)                  ;B5C0D0
    %AICMD0x58_ReplaceFarmTile($05, 208, 544)                  ;B5C0D6
    %AICMD0x58_ReplaceFarmTile($05, 208, 560)                  ;B5C0DC
    %AICMD0x58_ReplaceFarmTile($05, 224, 560)                  ;B5C0E2
    %AICMD0x58_ReplaceFarmTile($05, 240, 560)                  ;B5C0E8
    %AICMD0x58_ReplaceFarmTile($05, 256, 560)                  ;B5C0EE
    %AICMD0x58_ReplaceFarmTile($05, 272, 560)                  ;B5C0F4
    %AICMD0x58_ReplaceFarmTile($05, 288, 560)                  ;B5C0FA
    %AICMD0x58_ReplaceFarmTile($05, 304, 560)                  ;B5C100
    %AICMD0x58_ReplaceFarmTile($3A, 240, 496)                  ;B5C106
    %AICMD0x58_ReplaceFarmTile($3A, 256, 496)                  ;B5C10C
    %AICMD0x58_ReplaceFarmTile($3A, 272, 496)                  ;B5C112
    %AICMD0x58_ReplaceFarmTile($26, 288, 496)                  ;B5C118
    %AICMD0x58_ReplaceFarmTile($26, 304, 496)                  ;B5C11E
    %AICMD0x58_ReplaceFarmTile($26, 320, 496)                  ;B5C124
    %AICMD0x58_ReplaceFarmTile($3A, 240, 528)                  ;B5C12A
    %AICMD0x58_ReplaceFarmTile($3A, 256, 528)                  ;B5C130
    %AICMD0x58_ReplaceFarmTile($3A, 272, 528)                  ;B5C136
    %AICMD0x58_ReplaceFarmTile($26, 288, 528)                  ;B5C13C
    %AICMD0x58_ReplaceFarmTile($26, 304, 528)                  ;B5C142
    %AICMD0x58_ReplaceFarmTile($26, 320, 528)                  ;B5C148
    %AICMD0x58_ReplaceFarmTile($02, 224, 496)                  ;B5C14E
    %AICMD0x58_ReplaceFarmTile($02, 320, 512)                  ;B5C154
    %AICMD0x58_ReplaceFarmTile($02, 320, 544)                  ;B5C15A
    %AICMD0x47_SetValue8($800921, 21)                          ;B5C160
    %AICMD0x47_SetValue8($800923, 0)                           ;B5C165
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $06)       ;B5C16A
    %AICMD0x00_SetMusic($02, $B4)                              ;B5C16F
    %AICMD0x02_FreezeTime()                                    ;B5C172
    %AICMD0x03_SetHour($07)                                    ;B5C173
    %AICMD0x05_SetTransferPosition(424, 488)                   ;B5C175
    %AICMD0x08_EnableAIControl()                               ;B5C17A
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B5C17B
    %AICMD0x47_SetValue8(nCurrentSeasonID, 1)                  ;B5C17D
    %AICMD0x06_SetDestinationArea(!AREA_FARMSUMMER)            ;B5C182
    %AICMD0x38()                                               ;B5C184
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 79)                   ;B5C185
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 15)                   ;B5C189
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B5C18D
    %AICMD0x56_UseEquippedItem()                               ;B5C18F
    %AICMD0x13_Wait(120)                                       ;B5C190
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 47)                 ;B5C193
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B5C197
    %AICMD0x56_UseEquippedItem()                               ;B5C199
    %AICMD0x13_Wait(120)                                       ;B5C19A
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 23)                  ;B5C19D
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B5C1A1
    %AICMD0x56_UseEquippedItem()                               ;B5C1A3
    %AICMD0x13_Wait(120)                                       ;B5C1A4
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 7)                    ;B5C1A7
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 72)                     ;B5C1AB
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 104)                  ;B5C1AF
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 48)                    ;B5C1B3
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $07)       ;B5C1B7
    %AICMD0x10_End()                                           ;B5C1BC


DATA8_B5C1BD:
 
    %AICMD0x58_ReplaceFarmTile($02, 448, 528)                  ;B5C1BD
    %AICMD0x58_ReplaceFarmTile($02, 464, 528)                  ;B5C1C3
    %AICMD0x58_ReplaceFarmTile($02, 464, 512)                  ;B5C1C9
    %AICMD0x58_ReplaceFarmTile($02, 464, 544)                  ;B5C1CF
    %AICMD0x58_ReplaceFarmTile($02, 480, 560)                  ;B5C1D5
    %AICMD0x58_ReplaceFarmTile($02, 368, 576)                  ;B5C1DB
    %AICMD0x58_ReplaceFarmTile($02, 384, 576)                  ;B5C1E1
    %AICMD0x58_ReplaceFarmTile($02, 368, 592)                  ;B5C1E7
    %AICMD0x58_ReplaceFarmTile($02, 352, 544)                  ;B5C1ED
    %AICMD0x58_ReplaceFarmTile($02, 368, 544)                  ;B5C1F3
    %AICMD0x58_ReplaceFarmTile($02, 352, 560)                  ;B5C1F9
    %AICMD0x58_ReplaceFarmTile($02, 368, 560)                  ;B5C1FF
    %AICMD0x58_ReplaceFarmTile($02, 416, 576)                  ;B5C205
    %AICMD0x58_ReplaceFarmTile($02, 432, 576)                  ;B5C20B
    %AICMD0x58_ReplaceFarmTile($02, 416, 592)                  ;B5C211
    %AICMD0x58_ReplaceFarmTile($02, 432, 592)                  ;B5C217
    %AICMD0x58_ReplaceFarmTile($02, 464, 496)                  ;B5C21D
    %AICMD0x58_ReplaceFarmTile($02, 448, 496)                  ;B5C223
    %AICMD0x58_ReplaceFarmTile($02, 432, 496)                  ;B5C229
    %AICMD0x58_ReplaceFarmTile($02, 416, 496)                  ;B5C22F
    %AICMD0x58_ReplaceFarmTile($02, 400, 496)                  ;B5C235
    %AICMD0x58_ReplaceFarmTile($02, 384, 496)                  ;B5C23B
    %AICMD0x58_ReplaceFarmTile($02, 368, 496)                  ;B5C241
    %AICMD0x58_ReplaceFarmTile($02, 352, 496)                  ;B5C247
    %AICMD0x58_ReplaceFarmTile($02, 336, 496)                  ;B5C24D
    %AICMD0x58_ReplaceFarmTile($02, 320, 496)                  ;B5C253
    %AICMD0x58_ReplaceFarmTile($05, 464, 560)                  ;B5C259
    %AICMD0x58_ReplaceFarmTile($05, 448, 560)                  ;B5C25F
    %AICMD0x58_ReplaceFarmTile($05, 432, 560)                  ;B5C265
    %AICMD0x58_ReplaceFarmTile($05, 416, 560)                  ;B5C26B
    %AICMD0x58_ReplaceFarmTile($05, 400, 560)                  ;B5C271
    %AICMD0x58_ReplaceFarmTile($05, 384, 560)                  ;B5C277
    %AICMD0x58_ReplaceFarmTile($05, 368, 560)                  ;B5C27D
    %AICMD0x58_ReplaceFarmTile($05, 352, 560)                  ;B5C283
    %AICMD0x58_ReplaceFarmTile($05, 336, 560)                  ;B5C289
    %AICMD0x58_ReplaceFarmTile($05, 320, 560)                  ;B5C28F
    %AICMD0x58_ReplaceFarmTile($05, 320, 544)                  ;B5C295
    %AICMD0x58_ReplaceFarmTile($05, 320, 528)                  ;B5C29B
    %AICMD0x58_ReplaceFarmTile($05, 320, 512)                  ;B5C2A1
    %AICMD0x58_ReplaceFarmTile($05, 320, 496)                  ;B5C2A7
    %AICMD0x58_ReplaceFarmTile($02, 336, 512)                  ;B5C2AD
    %AICMD0x58_ReplaceFarmTile($02, 352, 512)                  ;B5C2B3
    %AICMD0x58_ReplaceFarmTile($02, 368, 512)                  ;B5C2B9
    %AICMD0x58_ReplaceFarmTile($02, 320, 416)                  ;B5C2BF
    %AICMD0x58_ReplaceFarmTile($02, 320, 432)                  ;B5C2C5
    %AICMD0x58_ReplaceFarmTile($02, 288, 448)                  ;B5C2CB
    %AICMD0x58_ReplaceFarmTile($02, 304, 448)                  ;B5C2D1
    %AICMD0x58_ReplaceFarmTile($02, 288, 464)                  ;B5C2D7
    %AICMD0x58_ReplaceFarmTile($02, 304, 464)                  ;B5C2DD
    %AICMD0x58_ReplaceFarmTile($07, 352, 496)                  ;B5C2E3
    %AICMD0x58_ReplaceFarmTile($07, 368, 496)                  ;B5C2E9
    %AICMD0x58_ReplaceFarmTile($07, 384, 496)                  ;B5C2EF
    %AICMD0x58_ReplaceFarmTile($07, 352, 512)                  ;B5C2F5
    %AICMD0x58_ReplaceFarmTile($07, 368, 512)                  ;B5C2FB
    %AICMD0x58_ReplaceFarmTile($07, 384, 512)                  ;B5C301
    %AICMD0x58_ReplaceFarmTile($07, 352, 528)                  ;B5C307
    %AICMD0x58_ReplaceFarmTile($07, 368, 528)                  ;B5C30D
    %AICMD0x58_ReplaceFarmTile($07, 384, 528)                  ;B5C313
    %AICMD0x58_ReplaceFarmTile($79, 416, 496)                  ;B5C319
    %AICMD0x58_ReplaceFarmTile($79, 432, 496)                  ;B5C31F
    %AICMD0x58_ReplaceFarmTile($79, 448, 496)                  ;B5C325
    %AICMD0x58_ReplaceFarmTile($79, 416, 512)                  ;B5C32B
    %AICMD0x58_ReplaceFarmTile($79, 432, 512)                  ;B5C331
    %AICMD0x58_ReplaceFarmTile($79, 448, 512)                  ;B5C337
    %AICMD0x58_ReplaceFarmTile($79, 416, 528)                  ;B5C33D
    %AICMD0x58_ReplaceFarmTile($79, 432, 528)                  ;B5C343
    %AICMD0x58_ReplaceFarmTile($79, 448, 528)                  ;B5C349
    %AICMD0x58_ReplaceFarmTile($02, 176, 464)                  ;B5C34F
    %AICMD0x58_ReplaceFarmTile($02, 192, 480)                  ;B5C355
    %AICMD0x58_ReplaceFarmTile($04, 192, 432)                  ;B5C35B
    %AICMD0x58_ReplaceFarmTile($04, 208, 432)                  ;B5C361
    %AICMD0x58_ReplaceFarmTile($05, 208, 496)                  ;B5C367
    %AICMD0x58_ReplaceFarmTile($05, 208, 512)                  ;B5C36D
    %AICMD0x58_ReplaceFarmTile($05, 208, 528)                  ;B5C373
    %AICMD0x58_ReplaceFarmTile($05, 208, 544)                  ;B5C379
    %AICMD0x58_ReplaceFarmTile($05, 208, 560)                  ;B5C37F
    %AICMD0x58_ReplaceFarmTile($05, 224, 560)                  ;B5C385
    %AICMD0x58_ReplaceFarmTile($05, 240, 560)                  ;B5C38B
    %AICMD0x58_ReplaceFarmTile($05, 256, 560)                  ;B5C391
    %AICMD0x58_ReplaceFarmTile($05, 272, 560)                  ;B5C397
    %AICMD0x58_ReplaceFarmTile($05, 288, 560)                  ;B5C39D
    %AICMD0x58_ReplaceFarmTile($05, 304, 560)                  ;B5C3A3
    %AICMD0x58_ReplaceFarmTile($07, 240, 496)                  ;B5C3A9
    %AICMD0x58_ReplaceFarmTile($07, 256, 496)                  ;B5C3AF
    %AICMD0x58_ReplaceFarmTile($07, 272, 496)                  ;B5C3B5
    %AICMD0x58_ReplaceFarmTile($07, 288, 496)                  ;B5C3BB
    %AICMD0x58_ReplaceFarmTile($07, 304, 496)                  ;B5C3C1
    %AICMD0x58_ReplaceFarmTile($07, 320, 496)                  ;B5C3C7
    %AICMD0x58_ReplaceFarmTile($07, 240, 528)                  ;B5C3CD
    %AICMD0x58_ReplaceFarmTile($07, 256, 528)                  ;B5C3D3
    %AICMD0x58_ReplaceFarmTile($07, 272, 528)                  ;B5C3D9
    %AICMD0x58_ReplaceFarmTile($07, 288, 528)                  ;B5C3DF
    %AICMD0x58_ReplaceFarmTile($07, 304, 528)                  ;B5C3E5
    %AICMD0x58_ReplaceFarmTile($07, 320, 528)                  ;B5C3EB
    %AICMD0x58_ReplaceFarmTile($02, 224, 496)                  ;B5C3F1
    %AICMD0x58_ReplaceFarmTile($02, 320, 512)                  ;B5C3F7
    %AICMD0x58_ReplaceFarmTile($02, 320, 544)                  ;B5C3FD
    %AICMD0x47_SetValue8($800921, 0)                           ;B5C403
    %AICMD0x47_SetValue8($800923, 0)                           ;B5C408
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $06)       ;B5C40D
    %AICMD0x00_SetMusic($07, $B4)                              ;B5C412
    %AICMD0x02_FreezeTime()                                    ;B5C415
    %AICMD0x03_SetHour($07)                                    ;B5C416
    %AICMD0x05_SetTransferPosition(136, 344)                   ;B5C418
    %AICMD0x08_EnableAIControl()                               ;B5C41D
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B5C41E
    %AICMD0x47_SetValue8(nCurrentSeasonID, 2)                  ;B5C420
    %AICMD0x06_SetDestinationArea(!AREA_FARMFALL)              ;B5C425
    %AICMD0x38()                                               ;B5C427
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 32)                  ;B5C428
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 102)                 ;B5C42C
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 56)                   ;B5C430
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 40)                  ;B5C434
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 16)                    ;B5C438
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $07)       ;B5C43C
    %AICMD0x10_End()                                           ;B5C441


DATA8_B5C442:
 
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $06)       ;B5C442
    %AICMD0x00_SetMusic($07, $B4)                              ;B5C447
    %AICMD0x02_FreezeTime()                                    ;B5C44A
    %AICMD0x03_SetHour($07)                                    ;B5C44B
    %AICMD0x05_SetTransferPosition(128, 200)                   ;B5C44D
    %AICMD0x08_EnableAIControl()                               ;B5C452
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B5C453
    %AICMD0x47_SetValue8(nCurrentSeasonID, 2)                  ;B5C455
    %AICMD0x06_SetDestinationArea(!AREA_SHED)                  ;B5C45A
    %AICMD0x38()                                               ;B5C45C
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 16)                    ;B5C45D
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 56)                  ;B5C461
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 8)                     ;B5C465
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B5C469
    %AICMD0x3E_SetCarryItem($37)                               ;B5C46B
    %AICMD0x13_Wait(60)                                        ;B5C46D
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 16)                 ;B5C470
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B5C474
    %AICMD0x3E_SetCarryItem($38)                               ;B5C476
    %AICMD0x13_Wait(60)                                        ;B5C478
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 40)                 ;B5C47B
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 32)                  ;B5C47F
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $07)       ;B5C483
    %AICMD0x10_End()                                           ;B5C488


DATA8_B5C489:
 
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $06)       ;B5C489
    %AICMD0x00_SetMusic($07, $B4)                              ;B5C48E
    %AICMD0x02_FreezeTime()                                    ;B5C491
    %AICMD0x03_SetHour($07)                                    ;B5C492
    %AICMD0x05_SetTransferPosition(424, 488)                   ;B5C494
    %AICMD0x08_EnableAIControl()                               ;B5C499
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B5C49A
    %AICMD0x47_SetValue8(nCurrentSeasonID, 2)                  ;B5C49C
    %AICMD0x06_SetDestinationArea(!AREA_FARMFALL)              ;B5C4A1
    %AICMD0x38()                                               ;B5C4A3
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 39)                   ;B5C4A4
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 55)                     ;B5C4A8
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 7)                    ;B5C4AC
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 32)                    ;B5C4B0
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $07)       ;B5C4B4
    %AICMD0x10_End()                                           ;B5C4B9


DATA8_B5C4BA:
 
    %AICMD0x47_SetValue8($800921, 15)                          ;B5C4BA
    %AICMD0x47_SetValue8($800923, 14)                          ;B5C4BF
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $06)       ;B5C4C4
    %AICMD0x00_SetMusic($07, $B4)                              ;B5C4C9
    %AICMD0x02_FreezeTime()                                    ;B5C4CC
    %AICMD0x03_SetHour($07)                                    ;B5C4CD
    %AICMD0x05_SetTransferPosition(128, 360)                   ;B5C4CF
    %AICMD0x08_EnableAIControl()                               ;B5C4D4
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B5C4D5
    %AICMD0x09($01, pAIScripting0x47_HowToPlay_L003)                                   ;B5C4D7
    %AICMD0x09($02, pAIScripting0x47_HowToPlay_L005)                                   ;B5C4DB
    %AICMD0x47_SetValue8(nCurrentSeasonID, 2)                  ;B5C4DF
    %AICMD0x06_SetDestinationArea(!AREA_COWBARN)               ;B5C4E4
    %AICMD0x38()                                               ;B5C4E6
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 15)                     ;B5C4E7
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 27)                  ;B5C4EB
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 23)                     ;B5C4EF
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 18)                  ;B5C4F3
    %AICMD0x56_UseEquippedItem()                               ;B5C4F7
    %AICMD0x13_Wait(80)                                        ;B5C4F8
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 18)                 ;B5C4FB
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 15)                     ;B5C4FF
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 18)                  ;B5C503
    %AICMD0x56_UseEquippedItem()                               ;B5C507
    %AICMD0x13_Wait(80)                                        ;B5C508
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 18)                 ;B5C50B
    %AICMD0x59_SwapEquippedItems()                             ;B5C50F
    %AICMD0x13_Wait(60)                                        ;B5C510
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 18)                  ;B5C513
    %AICMD0x56_UseEquippedItem()                               ;B5C517
    %AICMD0x13_Wait(68)                                        ;B5C518
    %AICMD0x3E_SetCarryItem($15)                               ;B5C51B
    %AICMD0x13_Wait(40)                                        ;B5C51D
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 16)                 ;B5C520
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 39)                   ;B5C524
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 79)                   ;B5C528
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B5C52C
    %AICMD0x3F_ThrowCarriedItem()                              ;B5C52E
    %AICMD0x13_Wait(60)                                        ;B5C52F
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 79)                  ;B5C532
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 23)                     ;B5C536
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 16)                  ;B5C53A
    %AICMD0x56_UseEquippedItem()                               ;B5C53E
    %AICMD0x13_Wait(68)                                        ;B5C53F
    %AICMD0x3E_SetCarryItem($15)                               ;B5C542
    %AICMD0x13_Wait(40)                                        ;B5C544
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 16)                 ;B5C547
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 23)                   ;B5C54B
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 79)                   ;B5C54F
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B5C553
    %AICMD0x3F_ThrowCarriedItem()                              ;B5C555
    %AICMD0x13_Wait(60)                                        ;B5C556
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 51)                  ;B5C559
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 40)                  ;B5C55D
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $07)       ;B5C561
    %AICMD0x10_End()                                           ;B5C566
pAIScripting0x47_HowToPlay_L003:
    %AICMD0x1A($00A8, $0118, aAIScriptingData_L002, $00)                     ;B5C567
    %AICMD0x13_Wait(75)                                        ;B5C56F
    %AICMD0x1B($018B, $00)                                     ;B5C572
    %AICMD0x0D($FF, $00, $10, $01)                             ;B5C576
    %AICMD0x13_Wait(60)                                        ;B5C57B
    %AICMD0x1B($0191, $00)                                     ;B5C57E
    %AICMD0x13_Wait(60)                                        ;B5C582
    %AICMD0x1B($018C, $00)                                     ;B5C585
    %AICMD0x13_Wait(680)                                       ;B5C589
    %AICMD0x1B($0191, $00)                                     ;B5C58C
    %AICMD0x13_Wait(60)                                        ;B5C590
    %AICMD0x1B($018C, $00)                                     ;B5C593
pAIScripting0x47_HowToPlay_L004:
    %AICMD0x13_Wait(1)                                         ;B5C597
    %AICMD0x12_Jump(pAIScripting0x47_HowToPlay_L004)                                   ;B5C59A
pAIScripting0x47_HowToPlay_L005:
    %AICMD0x1A($00A8, $00F8, aAIScriptingData_L002, $00)                     ;B5C59D
    %AICMD0x13_Wait(209)                                       ;B5C5A5
    %AICMD0x1B($018B, $00)                                     ;B5C5A8
    %AICMD0x0D($FF, $00, $10, $01)                             ;B5C5AC
    %AICMD0x13_Wait(60)                                        ;B5C5B1
    %AICMD0x1B($0191, $00)                                     ;B5C5B4
    %AICMD0x13_Wait(60)                                        ;B5C5B8
    %AICMD0x1B($018C, $00)                                     ;B5C5BB
    %AICMD0x13_Wait(120)                                       ;B5C5BF
    %AICMD0x1B($0191, $00)                                     ;B5C5C2
    %AICMD0x13_Wait(60)                                        ;B5C5C6
    %AICMD0x1B($018C, $00)                                     ;B5C5C9
pAIScripting0x47_HowToPlay_L006:
    %AICMD0x13_Wait(1)                                         ;B5C5CD
    %AICMD0x12_Jump(pAIScripting0x47_HowToPlay_L006)                                   ;B5C5D0


DATA8_B5C5D3:
 
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $06)       ;B5C5D3
    %AICMD0x00_SetMusic($07, $B4)                              ;B5C5D8
    %AICMD0x02_FreezeTime()                                    ;B5C5DB
    %AICMD0x03_SetHour($07)                                    ;B5C5DC
    %AICMD0x05_SetTransferPosition(328, 360)                   ;B5C5DE
    %AICMD0x08_EnableAIControl()                               ;B5C5E3
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B5C5E4
    %AICMD0x47_SetValue8(nCurrentSeasonID, 2)                  ;B5C5E6
    %AICMD0x06_SetDestinationArea(!AREA_FARMFALL)              ;B5C5EB
    %AICMD0x38()                                               ;B5C5ED
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 7)                    ;B5C5EE
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 7)                   ;B5C5F2
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 55)                   ;B5C5F6
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 39)                  ;B5C5FA
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 16)                    ;B5C5FE
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $07)       ;B5C602
    %AICMD0x10_End()                                           ;B5C607


DATA8_B5C608:
 
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $06)       ;B5C608
    %AICMD0x00_SetMusic($07, $B4)                              ;B5C60D
    %AICMD0x02_FreezeTime()                                    ;B5C610
    %AICMD0x03_SetHour($07)                                    ;B5C611
    %AICMD0x05_SetTransferPosition(128, 200)                   ;B5C613
    %AICMD0x08_EnableAIControl()                               ;B5C618
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B5C619
    %AICMD0x47_SetValue8(nCurrentSeasonID, 2)                  ;B5C61B
    %AICMD0x06_SetDestinationArea(!AREA_SHED)                  ;B5C620
    %AICMD0x38()                                               ;B5C622
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 64)                    ;B5C623
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 40)                  ;B5C627
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 8)                     ;B5C62B
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B5C62F
    %AICMD0x3E_SetCarryItem($34)                               ;B5C631
    %AICMD0x13_Wait(60)                                        ;B5C633
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 40)                 ;B5C636
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 32)                   ;B5C63A
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 16)                  ;B5C63E
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $07)       ;B5C642
    %AICMD0x10_End()                                           ;B5C647


DATA8_B5C648:
 
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $06)       ;B5C648
    %AICMD0x00_SetMusic($07, $B4)                              ;B5C64D
    %AICMD0x02_FreezeTime()                                    ;B5C650
    %AICMD0x03_SetHour($07)                                    ;B5C651
    %AICMD0x05_SetTransferPosition(424, 488)                   ;B5C653
    %AICMD0x08_EnableAIControl()                               ;B5C658
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B5C659
    %AICMD0x47_SetValue8(nCurrentSeasonID, 2)                  ;B5C65B
    %AICMD0x06_SetDestinationArea(!AREA_FARMFALL)              ;B5C660
    %AICMD0x38()                                               ;B5C662
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 39)                   ;B5C663
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 55)                     ;B5C667
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 7)                    ;B5C66B
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 32)                    ;B5C66F
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $07)       ;B5C673
    %AICMD0x10_End()                                           ;B5C678


DATA8_B5C679:
 
    %AICMD0x47_SetValue8($800921, 11)                          ;B5C679
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $06)       ;B5C67E
    %AICMD0x00_SetMusic($07, $B4)                              ;B5C683
    %AICMD0x02_FreezeTime()                                    ;B5C686
    %AICMD0x03_SetHour($07)                                    ;B5C687
    %AICMD0x05_SetTransferPosition(128, 360)                   ;B5C689
    %AICMD0x08_EnableAIControl()                               ;B5C68E
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B5C68F
    %AICMD0x09($01, pAIScripting0x47_HowToPlay_L007)                                   ;B5C691
    %AICMD0x09($02, pAIScripting0x47_HowToPlay_L008)                                   ;B5C695
    %AICMD0x47_SetValue8(nCurrentSeasonID, 2)                  ;B5C699
    %AICMD0x06_SetDestinationArea(!AREA_COWBARN)               ;B5C69E
    %AICMD0x38()                                               ;B5C6A0
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 15)                     ;B5C6A1
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 27)                  ;B5C6A5
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 71)                     ;B5C6A9
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 15)                  ;B5C6AD
    %AICMD0x3E_SetCarryItem($1A)                               ;B5C6B1
    %AICMD0x13_Wait(40)                                        ;B5C6B3
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 51)                   ;B5C6B6
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 33)                   ;B5C6BA
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B5C6BE
    %AICMD0x3F_ThrowCarriedItem()                              ;B5C6C0
    %AICMD0x13_Wait(60)                                        ;B5C6C1
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 31)                   ;B5C6C4
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 43)                  ;B5C6C8
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 15)                     ;B5C6CC
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B5C6D0
    %AICMD0x56_UseEquippedItem()                               ;B5C6D2
    %AICMD0x13_Wait(120)                                       ;B5C6D3
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 31)                   ;B5C6D6
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B5C6DA
    %AICMD0x56_UseEquippedItem()                               ;B5C6DC
    %AICMD0x13_Wait(120)                                       ;B5C6DD
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 4)                   ;B5C6E0
    %AICMD0x13_Wait(60)                                        ;B5C6E4
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 13)                   ;B5C6E7
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 7)                    ;B5C6EB
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 28)                   ;B5C6EF
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 7)                      ;B5C6F3
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B5C6F7
    %AICMD0x56_UseEquippedItem()                               ;B5C6F9
    %AICMD0x13_Wait(100)                                       ;B5C6FA
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 28)                  ;B5C6FD
    %AICMD0x56_UseEquippedItem()                               ;B5C701
    %AICMD0x13_Wait(120)                                       ;B5C702
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 15)                 ;B5C705
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 16)                  ;B5C709
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $07)       ;B5C70D
    %AICMD0x10_End()                                           ;B5C712
pAIScripting0x47_HowToPlay_L007:
    %AICMD0x1A($00A8, $0118, aAIScriptingData_L002, $00)                     ;B5C713
    %AICMD0x13_Wait(480)                                       ;B5C71B
    %AICMD0x1B($018B, $01)                                     ;B5C71E
    %AICMD0x0D($01, $00, $10, $01)                             ;B5C722
    %AICMD0x1B($018C, $01)                                     ;B5C727
    %AICMD0x13_Wait(120)                                       ;B5C72B
    %AICMD0x1B($019F, $00)                                     ;B5C72E
    %AICMD0x0D($00, $01, $30, $01)                             ;B5C732
    %AICMD0x1B($019E, $00)                                     ;B5C737
    %AICMD0x13_Wait(30)                                        ;B5C73B
    %AICMD0x1B($018B, $00)                                     ;B5C73E
    %AICMD0x0D($FF, $00, $20, $01)                             ;B5C742
    %AICMD0x1B($018C, $00)                                     ;B5C747
    %AICMD0x13_Wait(120)                                       ;B5C74B
    %AICMD0x1B($018B, $00)                                     ;B5C74E
    %AICMD0x0D($FF, $00, $18, $01)                             ;B5C752
    %AICMD0x1B($018C, $00)                                     ;B5C757
    %AICMD0x13_Wait(120)                                       ;B5C75B
    %AICMD0x1B($019F, $00)                                     ;B5C75E
    %AICMD0x0D($00, $01, $24, $01)                             ;B5C762
    %AICMD0x37()                                               ;B5C767
    %AICMD0x10_End()                                           ;B5C768
pAIScripting0x47_HowToPlay_L008:
    %AICMD0x1A($00A8, $00F8, aAIScriptingData_L002, $00)                     ;B5C769
    %AICMD0x13_Wait(480)                                       ;B5C771
    %AICMD0x1B($019F, $00)                                     ;B5C774
    %AICMD0x13_Wait(240)                                       ;B5C778
    %AICMD0x1B($019E, $00)                                     ;B5C77B
    %AICMD0x13_Wait(120)                                       ;B5C77F
    %AICMD0x1B($019F, $00)                                     ;B5C782
    %AICMD0x13_Wait(240)                                       ;B5C786
    %AICMD0x1B($019E, $00)                                     ;B5C789
pAIScripting0x47_HowToPlay_L009:
    %AICMD0x13_Wait(1)                                         ;B5C78D
    %AICMD0x12_Jump(pAIScripting0x47_HowToPlay_L009)                                   ;B5C790


DATA8_B5C793:
 
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $06)       ;B5C793
    %AICMD0x00_SetMusic($07, $B4)                              ;B5C798
    %AICMD0x02_FreezeTime()                                    ;B5C79B
    %AICMD0x03_SetHour($07)                                    ;B5C79C
    %AICMD0x05_SetTransferPosition(328, 360)                   ;B5C79E
    %AICMD0x08_EnableAIControl()                               ;B5C7A3
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B5C7A4
    %AICMD0x09($01, pAIScripting0x47_HowToPlay_L010)                                   ;B5C7A6
    %AICMD0x47_SetValue8(nCurrentSeasonID, 2)                  ;B5C7AA
    %AICMD0x06_SetDestinationArea(!AREA_FARMFALL)              ;B5C7AF
    %AICMD0x38()                                               ;B5C7B1
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 15)                  ;B5C7B2
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 63)                  ;B5C7B6
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 32)                    ;B5C7BA
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $07)       ;B5C7BE
    %AICMD0x10_End()                                           ;B5C7C3
pAIScripting0x47_HowToPlay_L010:
    %AICMD0x1A($0148, $0178, aAIScriptingData_L003, $00)                     ;B5C7C4
    %AICMD0x13_Wait(2)                                         ;B5C7CC
    %AICMD0x0D($00, $01, $20, $01)                             ;B5C7CF
    %AICMD0x1B($019E, $00)                                     ;B5C7D4
pAIScripting0x47_HowToPlay_L011:
    %AICMD0x13_Wait(1)                                         ;B5C7D8
    %AICMD0x12_Jump(pAIScripting0x47_HowToPlay_L011)                                   ;B5C7DB


DATA8_B5C7DE:
 
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $06)       ;B5C7DE
    %AICMD0x00_SetMusic($07, $B4)                              ;B5C7E3
    %AICMD0x02_FreezeTime()                                    ;B5C7E6
    %AICMD0x03_SetHour($07)                                    ;B5C7E7
    %AICMD0x05_SetTransferPosition(128, 200)                   ;B5C7E9
    %AICMD0x08_EnableAIControl()                               ;B5C7EE
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B5C7EF
    %AICMD0x23_OrWithIndexedValue(nEggInCoopFlags, $04)        ;B5C7F1
    %AICMD0x23_OrWithIndexedValue(nEggInCoopFlags, $05)        ;B5C7F6
    %AICMD0x09($01, pAIScripting0x47_HowToPlay_L012)                                   ;B5C7FB
    %AICMD0x09($02, pAIScripting0x47_HowToPlay_L014)                                   ;B5C7FF
    %AICMD0x47_SetValue8(nCurrentSeasonID, 2)                  ;B5C803
    %AICMD0x06_SetDestinationArea(!AREA_COOP)                  ;B5C808
    %AICMD0x38()                                               ;B5C80A
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 11)                   ;B5C80B
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 7)                      ;B5C80F
    %AICMD0x3E_SetCarryItem($14)                               ;B5C813
    %AICMD0x13_Wait(40)                                        ;B5C815
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 7)                    ;B5C818
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 31)                   ;B5C81C
    %AICMD0x3F_ThrowCarriedItem()                              ;B5C820
    %AICMD0x13_Wait(60)                                        ;B5C821
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 39)                  ;B5C824
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 23)                     ;B5C828
    %AICMD0x3E_SetCarryItem($14)                               ;B5C82C
    %AICMD0x13_Wait(40)                                        ;B5C82E
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 15)                   ;B5C831
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 47)                  ;B5C835
    %AICMD0x3F_ThrowCarriedItem()                              ;B5C839
    %AICMD0x13_Wait(60)                                        ;B5C83A
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 63)                   ;B5C83D
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 35)                     ;B5C841
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 23)                   ;B5C845
    %AICMD0x3E_SetCarryItem($1A)                               ;B5C849
    %AICMD0x13_Wait(40)                                        ;B5C84B
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 7)                   ;B5C84E
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 23)                     ;B5C852
    %AICMD0x3F_ThrowCarriedItem()                              ;B5C856
    %AICMD0x13_Wait(60)                                        ;B5C857
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 23)                   ;B5C85A
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 7)                    ;B5C85E
    %AICMD0x3E_SetCarryItem($1A)                               ;B5C862
    %AICMD0x13_Wait(40)                                        ;B5C864
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 15)                  ;B5C867
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 23)                     ;B5C86B
    %AICMD0x3F_ThrowCarriedItem()                              ;B5C86F
    %AICMD0x13_Wait(60)                                        ;B5C870
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 51)                   ;B5C873
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 27)                  ;B5C877
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 48)                  ;B5C87B
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $07)       ;B5C87F
    %AICMD0x10_End()                                           ;B5C884
pAIScripting0x47_HowToPlay_L012:
    %AICMD0x1A($00A8, $0078, aAIScriptingData_L008, $00)                     ;B5C885
    %AICMD0x22($10, $10, $01, aAIScriptingData_L008, $08)                    ;B5C88D
pAIScripting0x47_HowToPlay_L013:
    %AICMD0x13_Wait(1)                                         ;B5C894
    %AICMD0x12_Jump(pAIScripting0x47_HowToPlay_L013)                                   ;B5C897
pAIScripting0x47_HowToPlay_L014:
    %AICMD0x1A($00C8, $0068, aAIScriptingData_L008, $00)                     ;B5C89A
    %AICMD0x22($10, $10, $01, aAIScriptingData_L008, $08)                    ;B5C8A2
pAIScripting0x47_HowToPlay_L015:
    %AICMD0x13_Wait(1)                                         ;B5C8A9
    %AICMD0x12_Jump(pAIScripting0x47_HowToPlay_L015)                                   ;B5C8AC


DATA8_B5C8AF:
 
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $06)       ;B5C8AF
    %AICMD0x00_SetMusic($07, $B4)                              ;B5C8B4
    %AICMD0x02_FreezeTime()                                    ;B5C8B7
    %AICMD0x03_SetHour($07)                                    ;B5C8B8
    %AICMD0x05_SetTransferPosition(456, 360)                   ;B5C8BA
    %AICMD0x08_EnableAIControl()                               ;B5C8BF
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B5C8C0
    %AICMD0x09($01, pAIScripting0x47_HowToPlay_L016)                                   ;B5C8C2
    %AICMD0x47_SetValue8(nCurrentSeasonID, 2)                  ;B5C8C6
    %AICMD0x06_SetDestinationArea(!AREA_FARMFALL)              ;B5C8CB
    %AICMD0x38()                                               ;B5C8CD
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 7)                    ;B5C8CE
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 159)                  ;B5C8D2
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 40)                    ;B5C8D6
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $07)       ;B5C8DA
    %AICMD0x10_End()                                           ;B5C8DF
pAIScripting0x47_HowToPlay_L016:
    %AICMD0x1A($0148, $0198, aAIScriptingData_L002, $00)                     ;B5C8E0
pAIScripting0x47_HowToPlay_L017:
    %AICMD0x13_Wait(1)                                         ;B5C8E8
    %AICMD0x12_Jump(pAIScripting0x47_HowToPlay_L017)                                   ;B5C8EB


DATA8_B5C8EE:
 
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $06)       ;B5C8EE
    %AICMD0x00_SetMusic($03, $B4)                              ;B5C8F3
    %AICMD0x02_FreezeTime()                                    ;B5C8F6
    %AICMD0x03_SetHour($07)                                    ;B5C8F7
    %AICMD0x05_SetTransferPosition(264, 312)                   ;B5C8F9
    %AICMD0x08_EnableAIControl()                               ;B5C8FE
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B5C8FF
    %AICMD0x09($01, pAIScripting0x47_HowToPlay_L018)                                   ;B5C901
    %AICMD0x09($03, pAIScripting0x47_HowToPlay_L020)                                   ;B5C905
    %AICMD0x09($06, pAIScripting0x47_HowToPlay_L022)                                   ;B5C909
    %AICMD0x09($07, pAIScripting0x47_HowToPlay_L024)                                   ;B5C90D
    %AICMD0x09($0B, pAIScripting0x47_HowToPlay_L026)                                   ;B5C911
    %AICMD0x09($0D, pAIScripting0x47_HowToPlay_L028)                                   ;B5C915
    %AICMD0x09($0E, pAIScripting0x47_HowToPlay_L030)                                   ;B5C919
    %AICMD0x09($0F, pAIScripting0x47_HowToPlay_L032)                                   ;B5C91D
    %AICMD0x09($10, pAIScripting0x47_HowToPlay_L034)                                   ;B5C921
    %AICMD0x09($11, pAIScripting0x47_HowToPlay_L036)                                   ;B5C925
    %AICMD0x09($12, pAIScripting0x47_HowToPlay_L038)                                   ;B5C929
    %AICMD0x09($13, pAIScripting0x47_HowToPlay_L040)                                   ;B5C92D
    %AICMD0x47_SetValue8(nCurrentSeasonID, 2)                  ;B5C931
    %AICMD0x3B($01)                                            ;B5C936
    %AICMD0x06_SetDestinationArea(!AREA_DANCINGS2)             ;B5C938
    %AICMD0x38()                                               ;B5C93A
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 64)                    ;B5C93B
    %AICMD0x54_ShowDialog($0241, $00)                          ;B5C93F
    %AICMD0x47_SetValue8($80019A, 4)                           ;B5C943
    %AICMD0x40_DisableTileInteractions()                       ;B5C948
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 16)                    ;B5C949
    %AICMD0x13_Wait(60)                                        ;B5C94D
    %AICMD0x3D_TeleportToArea(!AREA_INTRO)                     ;B5C950
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $07)       ;B5C952
    %AICMD0x10_End()                                           ;B5C957
pAIScripting0x47_HowToPlay_L018:
    %AICMD0x1A($0198, $00C8, aAIScriptingData_L064, $00)                     ;B5C958
pAIScripting0x47_HowToPlay_L019:
    %AICMD0x13_Wait(1)                                         ;B5C960
    %AICMD0x12_Jump(pAIScripting0x47_HowToPlay_L019)                                   ;B5C963
pAIScripting0x47_HowToPlay_L020:
    %AICMD0x1A($0078, $00F8, aAIScriptingData_L061, $02)                     ;B5C966
pAIScripting0x47_HowToPlay_L021:
    %AICMD0x13_Wait(1)                                         ;B5C96E
    %AICMD0x12_Jump(pAIScripting0x47_HowToPlay_L021)                                   ;B5C971
pAIScripting0x47_HowToPlay_L022:
    %AICMD0x1A($0168, $0108, aAIScriptingData_L067, $01)                     ;B5C974
pAIScripting0x47_HowToPlay_L023:
    %AICMD0x13_Wait(1)                                         ;B5C97C
    %AICMD0x12_Jump(pAIScripting0x47_HowToPlay_L023)                                   ;B5C97F
pAIScripting0x47_HowToPlay_L024:
    %AICMD0x1A($0148, $0158, aAIScriptingData_L055, $01)                     ;B5C982
pAIScripting0x47_HowToPlay_L025:
    %AICMD0x13_Wait(1)                                         ;B5C98A
    %AICMD0x12_Jump(pAIScripting0x47_HowToPlay_L025)                                   ;B5C98D
pAIScripting0x47_HowToPlay_L026:
    %AICMD0x1A($0058, $00E8, aAIScriptingData_L044, $02)                     ;B5C990
pAIScripting0x47_HowToPlay_L027:
    %AICMD0x13_Wait(1)                                         ;B5C998
    %AICMD0x12_Jump(pAIScripting0x47_HowToPlay_L027)                                   ;B5C99B
pAIScripting0x47_HowToPlay_L028:
    %AICMD0x1A($00C8, $0158, aAIScriptingData_L011, $02)                     ;B5C99E
pAIScripting0x47_HowToPlay_L029:
    %AICMD0x13_Wait(1)                                         ;B5C9A6
    %AICMD0x12_Jump(pAIScripting0x47_HowToPlay_L029)                                   ;B5C9A9
pAIScripting0x47_HowToPlay_L030:
    %AICMD0x1A($0098, $0068, aAIScriptingData_L015, $00)                     ;B5C9AC
pAIScripting0x47_HowToPlay_L031:
    %AICMD0x13_Wait(1)                                         ;B5C9B4
    %AICMD0x12_Jump(pAIScripting0x47_HowToPlay_L031)                                   ;B5C9B7
pAIScripting0x47_HowToPlay_L032:
    %AICMD0x1A($0148, $00A8, aAIScriptingData_L019, $00)                     ;B5C9BA
pAIScripting0x47_HowToPlay_L033:
    %AICMD0x13_Wait(1)                                         ;B5C9C2
    %AICMD0x12_Jump(pAIScripting0x47_HowToPlay_L033)                                   ;B5C9C5
pAIScripting0x47_HowToPlay_L034:
    %AICMD0x1A($0108, $0098, aAIScriptingData_L021, $00)                     ;B5C9C8
pAIScripting0x47_HowToPlay_L035:
    %AICMD0x13_Wait(1)                                         ;B5C9D0
    %AICMD0x12_Jump(pAIScripting0x47_HowToPlay_L035)                                   ;B5C9D3
pAIScripting0x47_HowToPlay_L036:
    %AICMD0x1A($00B8, $0098, aAIScriptingData_L024, $00)                     ;B5C9D6
pAIScripting0x47_HowToPlay_L037:
    %AICMD0x13_Wait(1)                                         ;B5C9DE
    %AICMD0x12_Jump(pAIScripting0x47_HowToPlay_L037)                                   ;B5C9E1
pAIScripting0x47_HowToPlay_L038:
    %AICMD0x1A($0108, $00B8, aAIScriptingData_L193, $00)                     ;B5C9E4
pAIScripting0x47_HowToPlay_L039:
    %AICMD0x13_Wait(1)                                         ;B5C9EC
    %AICMD0x12_Jump(pAIScripting0x47_HowToPlay_L039)                                   ;B5C9EF
pAIScripting0x47_HowToPlay_L040:
    %AICMD0x1A($00B8, $0108, aAIScriptingData_L050, $00)                     ;B5C9F2
pAIScripting0x47_HowToPlay_L041:
    %AICMD0x13_Wait(1)                                         ;B5C9FA
    %AICMD0x12_Jump(pAIScripting0x47_HowToPlay_L041)                                   ;B5C9FD


DATA8_B5CA00:
 
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $06)       ;B5CA00
    %AICMD0x00_SetMusic($04, $B4)                              ;B5CA05
    %AICMD0x02_FreezeTime()                                    ;B5CA08
    %AICMD0x03_SetHour($07)                                    ;B5CA09
    %AICMD0x05_SetTransferPosition(136, 344)                   ;B5CA0B
    %AICMD0x08_EnableAIControl()                               ;B5CA10
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B5CA11
    %AICMD0x47_SetValue8(nCurrentSeasonID, 3)                  ;B5CA13
    %AICMD0x06_SetDestinationArea(!AREA_FARMWINTER)            ;B5CA18
    %AICMD0x38()                                               ;B5CA1A
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 31)                  ;B5CA1B
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 23)                   ;B5CA1F
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 47)                   ;B5CA23
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 7)                    ;B5CA27
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 47)                  ;B5CA2B
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 7)                    ;B5CA2F
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 64)                   ;B5CA33
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $07)       ;B5CA37
    %AICMD0x10_End()                                           ;B5CA3C


DATA8_B5CA3D:
 
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $06)       ;B5CA3D
    %AICMD0x00_SetMusic($05, $B4)                              ;B5CA42
    %AICMD0x02_FreezeTime()                                    ;B5CA45
    %AICMD0x03_SetHour($07)                                    ;B5CA46
    %AICMD0x05_SetTransferPosition(280, 872)                   ;B5CA48
    %AICMD0x08_EnableAIControl()                               ;B5CA4D
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B5CA4E
    %AICMD0x3B($06)                                            ;B5CA50
    %AICMD0x09($01, pAIScripting0x47_HowToPlay_L042)                                   ;B5CA52
    %AICMD0x09($02, pAIScripting0x47_HowToPlay_L044)                                   ;B5CA56
    %AICMD0x47_SetValue8(nCurrentSeasonID, 3)                  ;B5CA5A
    %AICMD0x06_SetDestinationArea(!AREA_TOWNWINTER)            ;B5CA5F
    %AICMD0x38()                                               ;B5CA61
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 15)                  ;B5CA62
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 87)                 ;B5CA66
    %AICMD0x3F_ThrowCarriedItem()                              ;B5CA6A
    %AICMD0x13_Wait(60)                                        ;B5CA6B
    %AICMD0x3D_TeleportToArea(!AREA_INTRO)                     ;B5CA6E
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $07)       ;B5CA70
    %AICMD0x10_End()                                           ;B5CA75
pAIScripting0x47_HowToPlay_L042:
    %AICMD0x1A($0178, $0378, aAIScriptingData_L015, $00)                     ;B5CA76
    %AICMD0x13_Wait(110)                                       ;B5CA7E
    %AICMD0x1B($022A, $00)                                     ;B5CA81
    %AICMD0x54_ShowDialog($03B2, $00)                          ;B5CA85
    %AICMD0x47_SetValue8($80019A, 4)                           ;B5CA89
pAIScripting0x47_HowToPlay_L043:
    %AICMD0x13_Wait(1)                                         ;B5CA8E
    %AICMD0x12_Jump(pAIScripting0x47_HowToPlay_L043)                                   ;B5CA91
pAIScripting0x47_HowToPlay_L044:
    %AICMD0x1A($01A8, $0328, aAIScriptingData_L136, $00)                     ;B5CA94
pAIScripting0x47_HowToPlay_L045:
    %AICMD0x13_Wait(1)                                         ;B5CA9C
    %AICMD0x12_Jump(pAIScripting0x47_HowToPlay_L045)                                   ;B5CA9F


DATA8_B5CAA2:
 
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $06)       ;B5CAA2
    %AICMD0x47_SetValue8($800921, 4)                           ;B5CAA7
    %AICMD0x00_SetMusic($06, $B4)                              ;B5CAAC
    %AICMD0x02_FreezeTime()                                    ;B5CAAF
    %AICMD0x03_SetHour($07)                                    ;B5CAB0
    %AICMD0x05_SetTransferPosition(488, 216)                   ;B5CAB2
    %AICMD0x08_EnableAIControl()                               ;B5CAB7
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B5CAB8
    %AICMD0x47_SetValue8(nCurrentSeasonID, 3)                  ;B5CABA
    %AICMD0x06_SetDestinationArea(!AREA_WOODSWINTER)           ;B5CABF
    %AICMD0x38()                                               ;B5CAC1
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 41)                  ;B5CAC2
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 7)                      ;B5CAC6
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 7)                   ;B5CACA
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 31)                     ;B5CACE
    %AICMD0x56_UseEquippedItem()                               ;B5CAD2
    %AICMD0x13_Wait(60)                                        ;B5CAD3
    %AICMD0x56_UseEquippedItem()                               ;B5CAD6
    %AICMD0x13_Wait(60)                                        ;B5CAD7
    %AICMD0x56_UseEquippedItem()                               ;B5CADA
    %AICMD0x13_Wait(60)                                        ;B5CADB
    %AICMD0x56_UseEquippedItem()                               ;B5CADE
    %AICMD0x13_Wait(60)                                        ;B5CADF
    %AICMD0x56_UseEquippedItem()                               ;B5CAE2
    %AICMD0x13_Wait(60)                                        ;B5CAE3
    %AICMD0x56_UseEquippedItem()                               ;B5CAE6
    %AICMD0x13_Wait(60)                                        ;B5CAE7
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 23)                     ;B5CAEA
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B5CAEE
    %AICMD0x56_UseEquippedItem()                               ;B5CAF0
    %AICMD0x13_Wait(60)                                        ;B5CAF1
    %AICMD0x56_UseEquippedItem()                               ;B5CAF4
    %AICMD0x13_Wait(60)                                        ;B5CAF5
    %AICMD0x56_UseEquippedItem()                               ;B5CAF8
    %AICMD0x13_Wait(60)                                        ;B5CAF9
    %AICMD0x56_UseEquippedItem()                               ;B5CAFC
    %AICMD0x13_Wait(60)                                        ;B5CAFD
    %AICMD0x56_UseEquippedItem()                               ;B5CB00
    %AICMD0x13_Wait(60)                                        ;B5CB01
    %AICMD0x56_UseEquippedItem()                               ;B5CB04
    %AICMD0x13_Wait(60)                                        ;B5CB05
    %AICMD0x13_Wait(60)                                        ;B5CB08
    %AICMD0x3D_TeleportToArea(!AREA_INTRO)                     ;B5CB0B
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $07)       ;B5CB0D
    %AICMD0x10_End()                                           ;B5CB12


DATA8_B5CB13:
 
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $06)       ;B5CB13
    %AICMD0x00_SetMusic($01, $B4)                              ;B5CB18
    %AICMD0x02_FreezeTime()                                    ;B5CB1B
    %AICMD0x03_SetHour($07)                                    ;B5CB1C
    %AICMD0x05_SetTransferPosition(24, 456)                    ;B5CB1E
    %AICMD0x08_EnableAIControl()                               ;B5CB23
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B5CB24
    %AICMD0x09($01, pAIScripting0x47_HowToPlay_L046)                                   ;B5CB26
    %AICMD0x47_SetValue8(nCurrentSeasonID, 0)                  ;B5CB2A
    %AICMD0x06_SetDestinationArea(!AREA_FARMSPRING)            ;B5CB2F
    %AICMD0x38()                                               ;B5CB31
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 53)                  ;B5CB32
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 39)                     ;B5CB36
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B5CB3A
    %AICMD0x32($8000D4, $001B)                                 ;B5CB3C
    %AICMD0x13_Wait(240)                                       ;B5CB42
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily2, $02)       ;B5CB45
    %AICMD0x10_End()                                           ;B5CB4A
pAIScripting0x47_HowToPlay_L046:
    %AICMD0x1A($00D8, $0178, aAIScriptingData_L004, $03)                     ;B5CB4B
    %AICMD0x13_Wait(160)                                       ;B5CB53
    %AICMD0x1B($01EC, $00)                                     ;B5CB56
    %AICMD0x0D($FF, $00, $44, $01)                             ;B5CB5A
    %AICMD0x1B($01E8, $00)                                     ;B5CB5F
pAIScripting0x47_HowToPlay_L047:
    %AICMD0x13_Wait(1)                                         ;B5CB63
    %AICMD0x12_Jump(pAIScripting0x47_HowToPlay_L047)                                   ;B5CB66


DATA8_B5CB69:
 
    %AICMD0x10_End()                                           ;B5CB69


    pad $B5FFFF
