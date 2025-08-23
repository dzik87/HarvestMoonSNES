 
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
 
    %AICMD0x14_JumpIfFlagSet($800196, $01, $B58036)            ;B58020
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, $B58036)     ;B58027
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 11, 14, $B584D4) ;B5802E
B58036:
    %AICMD0x15_JumpIfEquals8(nCurrentTimeID, 18, $B5805A)      ;B58036
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $07, $B5804F)   ;B5803D
    %AICMD0x1A($0058, $0068, $B3845C, $00)                     ;B58044
    %AICMD0x12_Jump($B58087)                                   ;B5804C
B5804F:
    %AICMD0x1A($0148, $0078, $B3845C, $00)                     ;B5804F
    %AICMD0x12_Jump($B58087)                                   ;B58057
B5805A:
    %AICMD0x41_AddValue16(nLove_Maria, -2)                     ;B5805A
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $07, $B58077)   ;B58060
    %AICMD0x1A($0029, $0053, $B38468, $00)                     ;B58067
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily3, $0C)       ;B5806F
    %AICMD0x12_Jump($B58096)                                   ;B58074
B58077:
    %AICMD0x1A($0119, $0063, $B38468, $00)                     ;B58077
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily3, $0C)       ;B5807F
    %AICMD0x12_Jump($B58096)                                   ;B58084
B58087:
    %AICMD0x14_JumpIfFlagSet(strcFlags.daily3, $0B, $B584A0)   ;B58087
    %AICMD0x2D($B58169, $B5809C)                               ;B5808E
    %AICMD0x12_Jump($B58087)                                   ;B58093
B58096:
    %AICMD0x1F($B584CD)                                        ;B58096
    %AICMD0x12_Jump($B58096)                                   ;B58099
    %AICMD0x15_JumpIfEquals8($80091E, 2, $B580DE)              ;B5809C
    %AICMD0x16_JumpIfBetween8($80091E, 1, 5, $B580EB)          ;B580A3
    %AICMD0x15_JumpIfEquals8($80091E, 7, $B580EB)              ;B580AB
    %AICMD0x16_JumpIfBetween8($80091E, 16, 23, $B580EB)        ;B580B2
    %AICMD0x15_JumpIfEquals8($80091E, 25, $B580FF)             ;B580BA
    %AICMD0x15_JumpIfEquals8($80091E, 73, $B580FF)             ;B580C1
    %AICMD0x15_JumpIfEquals8($80091E, 6, $B58120)              ;B580C8
    %AICMD0x16_JumpIfBetween8($80091E, 9, 12, $B58113)         ;B580CF
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B580D7
    %AICMD0x12_Jump($B58087)                                   ;B580DB
B580DE:
    %AICMD0x1C_ShowDialog($03B0, $00)                          ;B580DE
    %AICMD0x41_AddValue16(nLove_Maria, -6)                     ;B580E2
    %AICMD0x12_Jump($B58087)                                   ;B580E8
B580EB:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $07, $B58142)   ;B580EB
    %AICMD0x41_AddValue16(nLove_Maria, 4)                      ;B580F2
    %AICMD0x1C_ShowDialog($03B2, $00)                          ;B580F8
    %AICMD0x12_Jump($B58087)                                   ;B580FC
B580FF:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $07, $B58142)   ;B580FF
    %AICMD0x1C_ShowDialog($03B5, $00)                          ;B58106
    %AICMD0x41_AddValue16(nLove_Maria, 8)                      ;B5810A
    %AICMD0x12_Jump($B58087)                                   ;B58110
B58113:
    %AICMD0x1C_ShowDialog($01D9, $00)                          ;B58113
    %AICMD0x41_AddValue16(nLove_Maria, -4)                     ;B58117
    %AICMD0x12_Jump($B58087)                                   ;B5811D
B58120:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $07, $B58142)   ;B58120
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $08, $B5814F)   ;B58127
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $09, $B5815C)   ;B5812E
    %AICMD0x41_AddValue16(nLove_Maria, 8)                      ;B58135
    %AICMD0x1C_ShowDialog($0212, $00)                          ;B5813B
    %AICMD0x12_Jump($B58087)                                   ;B5813F
B58142:
    %AICMD0x1C_ShowDialog($01BD, $00)                          ;B58142
    %AICMD0x41_AddValue16(nPlayerHappiness, 30)                ;B58146
    %AICMD0x12_Jump($B58087)                                   ;B5814C
B5814F:
    %AICMD0x1C_ShowDialog($041D, $00)                          ;B5814F
    %AICMD0x41_AddValue16(nPlayerHappiness, 30)                ;B58153
    %AICMD0x12_Jump($B58087)                                   ;B58159
B5815C:
    %AICMD0x1C_ShowDialog($041E, $00)                          ;B5815C
    %AICMD0x41_AddValue16(nPlayerHappiness, 30)                ;B58160
    %AICMD0x12_Jump($B58087)                                   ;B58166
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 15, 18, $B58466) ;B58169
    %AICMD0x43_JumpIfEqual16(nMarriedDaysCounter, 1, $B58295)  ;B58171
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $04, $B5829C)   ;B58179
    %AICMD0x15_JumpIfEquals8($80098C, 3, $B582A3)              ;B58180
    %AICMD0x14_JumpIfFlagSet($800196, $04, $B582AA)            ;B58187
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $05, $B5829C)   ;B5818E
    %AICMD0x43_JumpIfEqual16(nFirstChildAge, 1, $B582BF)       ;B58195
    %AICMD0x43_JumpIfEqual16(nSecondChildAge, 1, $B582BF)      ;B5819D
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 2, 19, $B582C6) ;B581A5
    %AICMD0x45_JumpIfBetween16(nSecondChildAge, 2, 19, $B582C6);B581AF
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 20, 39, $B582DA);B581B9
    %AICMD0x45_JumpIfBetween16(nSecondChildAge, 20, 39, $B582DA);B581C3
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 40, 59, $B582EE);B581CD
    %AICMD0x45_JumpIfBetween16(nSecondChildAge, 40, 59, $B582EE);B581D7
    %AICMD0x43_JumpIfEqual16(nFirstChildAge, 90, $B582FF)      ;B581E1
    %AICMD0x43_JumpIfEqual16(nSecondChildAge, 90, $B582FF)     ;B581E9
    %AICMD0x55(strcFlags.event1, $07, $B58214)                 ;B581F1
    %AICMD0x55(strcFlags.event2, $0A, $B582B1)                 ;B581F8
    %AICMD0x55(strcFlags.event2, $0B, $B582B1)                 ;B581FF
    %AICMD0x55(strcFlags.event2, $0C, $B582B1)                 ;B58206
    %AICMD0x55(strcFlags.event2, $09, $B582B8)                 ;B5820D
    %AICMD0x15_JumpIfEquals8(nCurrentWeekdayID, 0, $B5833D)    ;B58214
    %AICMD0x15_JumpIfEquals8(nCurrentWeekdayID, 6, $B58336)    ;B5821B
    %AICMD0x45_JumpIfBetween16(nLove_Maria, 200, 220, $B58328) ;B58222
    %AICMD0x45_JumpIfBetween16(nLove_Maria, 221, 250, $B5832F) ;B5822C
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 0, $B58352)     ;B58236
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 1, $B5837B)     ;B5823D
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 2, $B583A5)     ;B58244
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, $B583D5)     ;B5824B
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 60, 89, $B58306);B58252
    %AICMD0x45_JumpIfBetween16(nSecondChildAge, 60, 89, $B58306);B5825C
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 91, 119, $B5830D);B58266
    %AICMD0x45_JumpIfBetween16(nSecondChildAge, 91, 119, $B5830D);B58270
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 120, 999, $B58314);B5827A
    %AICMD0x45_JumpIfBetween16(nSecondChildAge, 120, 999, $B58314);B58284
    %AICMD0x1C_ShowDialog($0485, $00)                          ;B5828E
    %AICMD0x12_Jump($B58087)                                   ;B58292
B58295:
    %AICMD0x1C_ShowDialog($017D, $00)                          ;B58295
    %AICMD0x12_Jump($B58087)                                   ;B58299
B5829C:
    %AICMD0x1C_ShowDialog($0166, $00)                          ;B5829C
    %AICMD0x12_Jump($B58087)                                   ;B582A0
B582A3:
    %AICMD0x1C_ShowDialog($015F, $00)                          ;B582A3
    %AICMD0x12_Jump($B58087)                                   ;B582A7
B582AA:
    %AICMD0x1C_ShowDialog($0160, $00)                          ;B582AA
    %AICMD0x12_Jump($B58087)                                   ;B582AE
    %AICMD0x1C_ShowDialog($01A0, $00)                          ;B582B1
    %AICMD0x12_Jump($B58087)                                   ;B582B5
    %AICMD0x1C_ShowDialog($0493, $00)                          ;B582B8
    %AICMD0x12_Jump($B58087)                                   ;B582BC
B582BF:
    %AICMD0x1C_ShowDialog($01A2, $00)                          ;B582BF
    %AICMD0x12_Jump($B58087)                                   ;B582C3
B582C6:
    %AICMD0x17($02)                                            ;B582C6
    %AICMD0x18($00, $B58214)                                   ;B582C8
    %AICMD0x18($01, $B582D3)                                   ;B582CC
    %AICMD0x12_Jump($B58087)                                   ;B582D0
    %AICMD0x1C_ShowDialog($01A3, $00)                          ;B582D3
    %AICMD0x12_Jump($B58087)                                   ;B582D7
B582DA:
    %AICMD0x17($02)                                            ;B582DA
    %AICMD0x18($00, $B58214)                                   ;B582DC
    %AICMD0x18($01, $B582E7)                                   ;B582E0
    %AICMD0x12_Jump($B58087)                                   ;B582E4
    %AICMD0x1C_ShowDialog($01A4, $00)                          ;B582E7
    %AICMD0x12_Jump($B58087)                                   ;B582EB
B582EE:
    %AICMD0x17($02)                                            ;B582EE
    %AICMD0x18($00, $B58214)                                   ;B582F0
    %AICMD0x18($01, $B582F8)                                   ;B582F4
    %AICMD0x1C_ShowDialog($01A5, $00)                          ;B582F8
    %AICMD0x12_Jump($B58087)                                   ;B582FC
B582FF:
    %AICMD0x1C_ShowDialog($0481, $00)                          ;B582FF
    %AICMD0x12_Jump($B58087)                                   ;B58303
B58306:
    %AICMD0x1C_ShowDialog($0480, $00)                          ;B58306
    %AICMD0x12_Jump($B58087)                                   ;B5830A
B5830D:
    %AICMD0x1C_ShowDialog($0484, $00)                          ;B5830D
    %AICMD0x12_Jump($B58087)                                   ;B58311
B58314:
    %AICMD0x17($02)                                            ;B58314
    %AICMD0x18($00, $B58321)                                   ;B58316
    %AICMD0x1C_ShowDialog($0482, $00)                          ;B5831A
    %AICMD0x12_Jump($B58087)                                   ;B5831E
    %AICMD0x1C_ShowDialog($0443, $00)                          ;B58321
    %AICMD0x12_Jump($B58087)                                   ;B58325
B58328:
    %AICMD0x1C_ShowDialog($01F3, $00)                          ;B58328
    %AICMD0x12_Jump($B58087)                                   ;B5832C
B5832F:
    %AICMD0x1C_ShowDialog($0049, $00)                          ;B5832F
    %AICMD0x12_Jump($B58087)                                   ;B58333
B58336:
    %AICMD0x1C_ShowDialog($047D, $00)                          ;B58336
    %AICMD0x12_Jump($B58087)                                   ;B5833A
B5833D:
    %AICMD0x14_JumpIfFlagSet($800196, $01, $B5845F)            ;B5833D
    %AICMD0x14_JumpIfFlagSet($800196, $03, $B5845F)            ;B58344
    %AICMD0x1C_ShowDialog($0194, $00)                          ;B5834B
    %AICMD0x12_Jump($B58087)                                   ;B5834F
B58352:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 22, $B58374)         ;B58352
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 23, $B5844A)         ;B58359
    %AICMD0x14_JumpIfFlagSet($800196, $01, $B58451)            ;B58360
    %AICMD0x17($02)                                            ;B58367
    %AICMD0x18($00, $B58252)                                   ;B58369
    %AICMD0x1C_ShowDialog($0182, $00)                          ;B5836D
    %AICMD0x12_Jump($B58087)                                   ;B58371
B58374:
    %AICMD0x1C_ShowDialog($0206, $00)                          ;B58374
    %AICMD0x12_Jump($B58087)                                   ;B58378
B5837B:
    %AICMD0x14_JumpIfFlagSet($800196, $01, $B58451)            ;B5837B
    %AICMD0x17($04)                                            ;B58382
    %AICMD0x18($00, $B58397)                                   ;B58384
    %AICMD0x18($01, $B5839E)                                   ;B58388
    %AICMD0x18($02, $B58252)                                   ;B5838C
    %AICMD0x1C_ShowDialog($0427, $00)                          ;B58390
    %AICMD0x12_Jump($B58087)                                   ;B58394
    %AICMD0x1C_ShowDialog($017F, $00)                          ;B58397
    %AICMD0x12_Jump($B58087)                                   ;B5839B
    %AICMD0x1C_ShowDialog($0183, $00)                          ;B5839E
    %AICMD0x12_Jump($B58087)                                   ;B583A2
B583A5:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 11, $B583CE)         ;B583A5
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 12, $B5844A)         ;B583AC
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 20, $B5844A)         ;B583B3
    %AICMD0x14_JumpIfFlagSet($800196, $01, $B58451)            ;B583BA
    %AICMD0x17($02)                                            ;B583C1
    %AICMD0x18($00, $B58252)                                   ;B583C3
    %AICMD0x1C_ShowDialog($018D, $00)                          ;B583C7
    %AICMD0x12_Jump($B58087)                                   ;B583CB
B583CE:
    %AICMD0x1C_ShowDialog($0238, $00)                          ;B583CE
    %AICMD0x12_Jump($B58087)                                   ;B583D2
B583D5:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 10, $B58413)         ;B583D5
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 23, $B5843C)         ;B583DC
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 30, $B58443)         ;B583E3
    %AICMD0x14_JumpIfFlagSet($800196, $03, $B58458)            ;B583EA
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 15, 17, $B58466) ;B583F1
    %AICMD0x17($02)                                            ;B583F9
    %AICMD0x18($00, $B58252)                                   ;B583FB
    %AICMD0x1C_ShowDialog($042F, $00)                          ;B583FF
    %AICMD0x12_Jump($B58087)                                   ;B58403
    %AICMD0x14_JumpIfFlagSet(strcFlags.daily3, $0B, $B584A0)   ;B58406
    %AICMD0x1F($B58413)                                        ;B5840D
    %AICMD0x12_Jump($B58406)                                   ;B58410
B58413:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $05, $B58435) ;B58413
    %AICMD0x1C_ShowDialog($0292, $00)                          ;B5841A
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown1, $05)     ;B5841E
    %AICMD0x08_EnableAIControl()                               ;B58423
    %AICMD0x19($0039, $00)                                     ;B58424
    %AICMD0x13_Wait(120)                                       ;B58428
    %AICMD0x11_EnableUserControl()                             ;B5842B
    %AICMD0x41_AddValue16(nPlayerHappiness, 30)                ;B5842C
    %AICMD0x12_Jump($B58406)                                   ;B58432
B58435:
    %AICMD0x1C_ShowDialog($0293, $00)                          ;B58435
    %AICMD0x12_Jump($B58406)                                   ;B58439
B5843C:
    %AICMD0x1C_ShowDialog($02AF, $00)                          ;B5843C
    %AICMD0x12_Jump($B58087)                                   ;B58440
B58443:
    %AICMD0x1C_ShowDialog($03F8, $00)                          ;B58443
    %AICMD0x12_Jump($B58087)                                   ;B58447
B5844A:
    %AICMD0x1C_ShowDialog($0363, $00)                          ;B5844A
    %AICMD0x12_Jump($B58087)                                   ;B5844E
B58451:
    %AICMD0x1C_ShowDialog($0197, $00)                          ;B58451
    %AICMD0x12_Jump($B58087)                                   ;B58455
B58458:
    %AICMD0x1C_ShowDialog($0199, $00)                          ;B58458
    %AICMD0x12_Jump($B58087)                                   ;B5845C
B5845F:
    %AICMD0x1C_ShowDialog($047C, $00)                          ;B5845F
    %AICMD0x12_Jump($B58087)                                   ;B58463
B58466:
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, $B58483)     ;B58466
    %AICMD0x1C_ShowDialog($0180, $00)                          ;B5846D
    %AICMD0x1B($022F, $00)                                     ;B58471
    %AICMD0x08_EnableAIControl()                               ;B58475
    %AICMD0x19($0030, $00)                                     ;B58476
    %AICMD0x13_Wait(120)                                       ;B5847A
    %AICMD0x11_EnableUserControl()                             ;B5847D
    %AICMD0x57_UpdateStamina(30)                               ;B5847E
    %AICMD0x12_Jump($B58087)                                   ;B58480
B58483:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 10, $B58413)         ;B58483
    %AICMD0x1C_ShowDialog($0431, $00)                          ;B5848A
    %AICMD0x1B($022F, $00)                                     ;B5848E
    %AICMD0x08_EnableAIControl()                               ;B58492
    %AICMD0x19($0032, $00)                                     ;B58493
    %AICMD0x13_Wait(120)                                       ;B58497
    %AICMD0x11_EnableUserControl()                             ;B5849A
    %AICMD0x57_UpdateStamina(30)                               ;B5849B
    %AICMD0x12_Jump($B58087)                                   ;B5849D
B584A0:
    %AICMD0x1B($02E7, $00)                                     ;B584A0
    %AICMD0x0D($FF, $00, $20, $01)                             ;B584A4
    %AICMD0x1B($02E5, $00)                                     ;B584A9
    %AICMD0x0D($00, $FF, $14, $01)                             ;B584AD
    %AICMD0x1B($02E7, $00)                                     ;B584B2
    %AICMD0x0D($FF, $00, $10, $01)                             ;B584B6
    %AICMD0x1B($02F1, $00)                                     ;B584BB
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily3, $0C)       ;B584BF
    %AICMD0x41_AddValue16(nLove_Maria, 2)                      ;B584C4
    %AICMD0x12_Jump($B58096)                                   ;B584CA
B584CD:
    %AICMD0x1C_ShowDialog($02C2, $00)                          ;B584CD
    %AICMD0x12_Jump($B58096)                                   ;B584D1
B584D4:
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily3, $0C)       ;B584D4
    %AICMD0x10_End()                                           ;B584D9


DATA8_B584DA:
 
    %AICMD0x14_JumpIfFlagSet($800196, $01, $B584F0)            ;B584DA
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, $B584F0)     ;B584E1
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 11, 14, $B5898A) ;B584E8
B584F0:
    %AICMD0x15_JumpIfEquals8(nCurrentTimeID, 18, $B58514)      ;B584F0
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $07, $B58509)   ;B584F7
    %AICMD0x1A($0058, $0068, $B3845C, $00)                     ;B584FE
    %AICMD0x12_Jump($B58541)                                   ;B58506
B58509:
    %AICMD0x1A($0148, $0078, $B3845C, $00)                     ;B58509
    %AICMD0x12_Jump($B58541)                                   ;B58511
B58514:
    %AICMD0x41_AddValue16(nLove_Ann, -2)                       ;B58514
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $07, $B58531)   ;B5851A
    %AICMD0x1A($0029, $0053, $B38468, $00)                     ;B58521
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily3, $0C)       ;B58529
    %AICMD0x12_Jump($B58550)                                   ;B5852E
B58531:
    %AICMD0x1A($0119, $0063, $B38468, $00)                     ;B58531
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily3, $0C)       ;B58539
    %AICMD0x12_Jump($B58550)                                   ;B5853E
B58541:
    %AICMD0x14_JumpIfFlagSet(strcFlags.daily3, $0B, $B58956)   ;B58541
    %AICMD0x2D($B5861C, $B58556)                               ;B58548
    %AICMD0x12_Jump($B58541)                                   ;B5854D
B58550:
    %AICMD0x1F($B58983)                                        ;B58550
    %AICMD0x12_Jump($B58550)                                   ;B58553
    %AICMD0x15_JumpIfEquals8($80091E, 2, $B58591)              ;B58556
    %AICMD0x16_JumpIfBetween8($80091E, 3, 5, $B585B2)          ;B5855D
    %AICMD0x16_JumpIfBetween8($80091E, 16, 23, $B585B2)        ;B58565
    %AICMD0x15_JumpIfEquals8($80091E, 6, $B585D3)              ;B5856D
    %AICMD0x15_JumpIfEquals8($80091E, 25, $B5859E)             ;B58574
    %AICMD0x15_JumpIfEquals8($80091E, 73, $B5859E)             ;B5857B
    %AICMD0x16_JumpIfBetween8($80091E, 9, 12, $B585C6)         ;B58582
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B5858A
    %AICMD0x12_Jump($B58541)                                   ;B5858E
B58591:
    %AICMD0x1C_ShowDialog($03B4, $00)                          ;B58591
    %AICMD0x41_AddValue16(nLove_Ann, -8)                       ;B58595
    %AICMD0x12_Jump($B58541)                                   ;B5859B
B5859E:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $07, $B585F5)   ;B5859E
    %AICMD0x1C_ShowDialog($0212, $00)                          ;B585A5
    %AICMD0x41_AddValue16(nLove_Ann, 8)                        ;B585A9
    %AICMD0x12_Jump($B58541)                                   ;B585AF
B585B2:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $07, $B585F5)   ;B585B2
    %AICMD0x1C_ShowDialog($03B2, $00)                          ;B585B9
    %AICMD0x41_AddValue16(nLove_Ann, 5)                        ;B585BD
    %AICMD0x12_Jump($B58541)                                   ;B585C3
B585C6:
    %AICMD0x1C_ShowDialog($03B4, $00)                          ;B585C6
    %AICMD0x41_AddValue16(nLove_Ann, -4)                       ;B585CA
    %AICMD0x12_Jump($B58541)                                   ;B585D0
B585D3:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $07, $B585F5)   ;B585D3
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $08, $B58602)   ;B585DA
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $09, $B5860F)   ;B585E1
    %AICMD0x1C_ShowDialog($0212, $00)                          ;B585E8
    %AICMD0x41_AddValue16(nLove_Ann, 8)                        ;B585EC
    %AICMD0x12_Jump($B58541)                                   ;B585F2
B585F5:
    %AICMD0x1C_ShowDialog($01BD, $00)                          ;B585F5
    %AICMD0x41_AddValue16(nPlayerHappiness, 30)                ;B585F9
    %AICMD0x12_Jump($B58541)                                   ;B585FF
B58602:
    %AICMD0x1C_ShowDialog($041D, $00)                          ;B58602
    %AICMD0x41_AddValue16(nPlayerHappiness, 30)                ;B58606
    %AICMD0x12_Jump($B58541)                                   ;B5860C
B5860F:
    %AICMD0x1C_ShowDialog($041E, $00)                          ;B5860F
    %AICMD0x41_AddValue16(nPlayerHappiness, 30)                ;B58613
    %AICMD0x12_Jump($B58541)                                   ;B58619
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 15, 18, $B5891C) ;B5861C
    %AICMD0x43_JumpIfEqual16(nMarriedDaysCounter, 1, $B58748)  ;B58624
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $04, $B5874F)   ;B5862C
    %AICMD0x15_JumpIfEquals8($80098C, 3, $B58756)              ;B58633
    %AICMD0x14_JumpIfFlagSet($800196, $04, $B5875D)            ;B5863A
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $05, $B5874F)   ;B58641
    %AICMD0x43_JumpIfEqual16(nFirstChildAge, 1, $B58772)       ;B58648
    %AICMD0x43_JumpIfEqual16(nSecondChildAge, 1, $B58772)      ;B58650
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 2, 19, $B58779) ;B58658
    %AICMD0x45_JumpIfBetween16(nSecondChildAge, 2, 19, $B58779);B58662
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 20, 39, $B5878D);B5866C
    %AICMD0x45_JumpIfBetween16(nSecondChildAge, 20, 39, $B5878D);B58676
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 40, 59, $B587A1);B58680
    %AICMD0x45_JumpIfBetween16(nSecondChildAge, 40, 59, $B587A1);B5868A
    %AICMD0x43_JumpIfEqual16(nFirstChildAge, 90, $B587B5)      ;B58694
    %AICMD0x43_JumpIfEqual16(nSecondChildAge, 90, $B587B5)     ;B5869C
    %AICMD0x55(strcFlags.event1, $07, $B586C7)                 ;B586A4
    %AICMD0x55(strcFlags.event2, $0A, $B58764)                 ;B586AB
    %AICMD0x55(strcFlags.event2, $0B, $B58764)                 ;B586B2
    %AICMD0x55(strcFlags.event2, $0C, $B58764)                 ;B586B9
    %AICMD0x55(strcFlags.event2, $09, $B5876B)                 ;B586C0
    %AICMD0x15_JumpIfEquals8(nCurrentWeekdayID, 0, $B587F3)    ;B586C7
    %AICMD0x15_JumpIfEquals8(nCurrentWeekdayID, 6, $B587EC)    ;B586CE
    %AICMD0x45_JumpIfBetween16(nLove_Ann, 200, 220, $B587DE)   ;B586D5
    %AICMD0x45_JumpIfBetween16(nLove_Ann, 221, 250, $B587E5)   ;B586DF
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 0, $B58808)     ;B586E9
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 1, $B58831)     ;B586F0
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 2, $B5885B)     ;B586F7
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, $B5888B)     ;B586FE
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 60, 89, $B587BC);B58705
    %AICMD0x45_JumpIfBetween16(nSecondChildAge, 60, 89, $B587BC);B5870F
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 91, 119, $B587C3);B58719
    %AICMD0x45_JumpIfBetween16(nSecondChildAge, 91, 119, $B587C3);B58723
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 120, 999, $B587CA);B5872D
    %AICMD0x45_JumpIfBetween16(nSecondChildAge, 120, 999, $B587CA);B58737
    %AICMD0x1C_ShowDialog($0485, $00)                          ;B58741
    %AICMD0x12_Jump($B58541)                                   ;B58745
B58748:
    %AICMD0x1C_ShowDialog($017D, $00)                          ;B58748
    %AICMD0x12_Jump($B58541)                                   ;B5874C
B5874F:
    %AICMD0x1C_ShowDialog($0166, $00)                          ;B5874F
    %AICMD0x12_Jump($B58541)                                   ;B58753
B58756:
    %AICMD0x1C_ShowDialog($015F, $00)                          ;B58756
    %AICMD0x12_Jump($B58541)                                   ;B5875A
B5875D:
    %AICMD0x1C_ShowDialog($0160, $00)                          ;B5875D
    %AICMD0x12_Jump($B58541)                                   ;B58761
    %AICMD0x1C_ShowDialog($01A0, $00)                          ;B58764
    %AICMD0x12_Jump($B58541)                                   ;B58768
    %AICMD0x1C_ShowDialog($0493, $00)                          ;B5876B
    %AICMD0x12_Jump($B58541)                                   ;B5876F
B58772:
    %AICMD0x1C_ShowDialog($01A2, $00)                          ;B58772
    %AICMD0x12_Jump($B58541)                                   ;B58776
B58779:
    %AICMD0x17($02)                                            ;B58779
    %AICMD0x18($00, $B586C7)                                   ;B5877B
    %AICMD0x18($01, $B58786)                                   ;B5877F
    %AICMD0x12_Jump($B58541)                                   ;B58783
    %AICMD0x1C_ShowDialog($01A4, $00)                          ;B58786
    %AICMD0x12_Jump($B58541)                                   ;B5878A
B5878D:
    %AICMD0x17($02)                                            ;B5878D
    %AICMD0x18($00, $B586C7)                                   ;B5878F
    %AICMD0x18($01, $B5879A)                                   ;B58793
    %AICMD0x12_Jump($B58541)                                   ;B58797
    %AICMD0x1C_ShowDialog($01A6, $00)                          ;B5879A
    %AICMD0x12_Jump($B58541)                                   ;B5879E
B587A1:
    %AICMD0x17($02)                                            ;B587A1
    %AICMD0x18($00, $B586C7)                                   ;B587A3
    %AICMD0x18($01, $B587AE)                                   ;B587A7
    %AICMD0x12_Jump($B58541)                                   ;B587AB
    %AICMD0x1C_ShowDialog($01A7, $00)                          ;B587AE
    %AICMD0x12_Jump($B58541)                                   ;B587B2
B587B5:
    %AICMD0x1C_ShowDialog($0481, $00)                          ;B587B5
    %AICMD0x12_Jump($B58541)                                   ;B587B9
B587BC:
    %AICMD0x1C_ShowDialog($0480, $00)                          ;B587BC
    %AICMD0x12_Jump($B58541)                                   ;B587C0
B587C3:
    %AICMD0x1C_ShowDialog($0484, $00)                          ;B587C3
    %AICMD0x12_Jump($B58541)                                   ;B587C7
B587CA:
    %AICMD0x17($02)                                            ;B587CA
    %AICMD0x18($00, $B587D7)                                   ;B587CC
    %AICMD0x1C_ShowDialog($0482, $00)                          ;B587D0
    %AICMD0x12_Jump($B58541)                                   ;B587D4
    %AICMD0x1C_ShowDialog($0443, $00)                          ;B587D7
    %AICMD0x12_Jump($B58541)                                   ;B587DB
B587DE:
    %AICMD0x1C_ShowDialog($01F4, $00)                          ;B587DE
    %AICMD0x12_Jump($B58541)                                   ;B587E2
B587E5:
    %AICMD0x1C_ShowDialog($0049, $00)                          ;B587E5
    %AICMD0x12_Jump($B58541)                                   ;B587E9
B587EC:
    %AICMD0x1C_ShowDialog($047D, $00)                          ;B587EC
    %AICMD0x12_Jump($B58541)                                   ;B587F0
B587F3:
    %AICMD0x14_JumpIfFlagSet($800196, $01, $B58915)            ;B587F3
    %AICMD0x14_JumpIfFlagSet($800196, $03, $B58915)            ;B587FA
    %AICMD0x1C_ShowDialog($0195, $00)                          ;B58801
    %AICMD0x12_Jump($B58541)                                   ;B58805
B58808:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 22, $B5882A)         ;B58808
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 23, $B58900)         ;B5880F
    %AICMD0x14_JumpIfFlagSet($800196, $01, $B58907)            ;B58816
    %AICMD0x17($02)                                            ;B5881D
    %AICMD0x18($00, $B58705)                                   ;B5881F
    %AICMD0x1C_ShowDialog($0182, $00)                          ;B58823
    %AICMD0x12_Jump($B58541)                                   ;B58827
B5882A:
    %AICMD0x1C_ShowDialog($0207, $00)                          ;B5882A
    %AICMD0x12_Jump($B58541)                                   ;B5882E
B58831:
    %AICMD0x14_JumpIfFlagSet($800196, $01, $B58907)            ;B58831
    %AICMD0x17($04)                                            ;B58838
    %AICMD0x18($00, $B5884D)                                   ;B5883A
    %AICMD0x18($01, $B58854)                                   ;B5883E
    %AICMD0x18($02, $B58705)                                   ;B58842
    %AICMD0x1C_ShowDialog($0422, $00)                          ;B58846
    %AICMD0x12_Jump($B58541)                                   ;B5884A
    %AICMD0x1C_ShowDialog($0420, $00)                          ;B5884D
    %AICMD0x12_Jump($B58541)                                   ;B58851
    %AICMD0x1C_ShowDialog($0426, $00)                          ;B58854
    %AICMD0x12_Jump($B58541)                                   ;B58858
B5885B:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 11, $B58884)         ;B5885B
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 12, $B58900)         ;B58862
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 20, $B58900)         ;B58869
    %AICMD0x14_JumpIfFlagSet($800196, $01, $B58907)            ;B58870
    %AICMD0x17($02)                                            ;B58877
    %AICMD0x18($00, $B58705)                                   ;B58879
    %AICMD0x1C_ShowDialog($0423, $00)                          ;B5887D
    %AICMD0x12_Jump($B58541)                                   ;B58881
B58884:
    %AICMD0x1C_ShowDialog($0239, $00)                          ;B58884
    %AICMD0x12_Jump($B58541)                                   ;B58888
B5888B:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 10, $B588C9)         ;B5888B
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 23, $B588F2)         ;B58892
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 30, $B588F9)         ;B58899
    %AICMD0x14_JumpIfFlagSet($800196, $03, $B5890E)            ;B588A0
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 15, 17, $B58939) ;B588A7
    %AICMD0x17($02)                                            ;B588AF
    %AICMD0x18($00, $B58705)                                   ;B588B1
    %AICMD0x1C_ShowDialog($042D, $00)                          ;B588B5
    %AICMD0x12_Jump($B58541)                                   ;B588B9
    %AICMD0x14_JumpIfFlagSet(strcFlags.daily3, $0B, $B58956)   ;B588BC
    %AICMD0x1F($B588C9)                                        ;B588C3
    %AICMD0x12_Jump($B588BC)                                   ;B588C6
B588C9:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $05, $B588EB) ;B588C9
    %AICMD0x1C_ShowDialog($0292, $00)                          ;B588D0
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown1, $05)     ;B588D4
    %AICMD0x08_EnableAIControl()                               ;B588D9
    %AICMD0x19($0039, $00)                                     ;B588DA
    %AICMD0x13_Wait(120)                                       ;B588DE
    %AICMD0x11_EnableUserControl()                             ;B588E1
    %AICMD0x41_AddValue16(nPlayerHappiness, 30)                ;B588E2
    %AICMD0x12_Jump($B588BC)                                   ;B588E8
B588EB:
    %AICMD0x1C_ShowDialog($0293, $00)                          ;B588EB
    %AICMD0x12_Jump($B588BC)                                   ;B588EF
B588F2:
    %AICMD0x1C_ShowDialog($02B4, $00)                          ;B588F2
    %AICMD0x12_Jump($B58541)                                   ;B588F6
B588F9:
    %AICMD0x1C_ShowDialog($03F9, $00)                          ;B588F9
    %AICMD0x12_Jump($B58541)                                   ;B588FD
B58900:
    %AICMD0x1C_ShowDialog($0361, $00)                          ;B58900
    %AICMD0x12_Jump($B58541)                                   ;B58904
B58907:
    %AICMD0x1C_ShowDialog($0196, $00)                          ;B58907
    %AICMD0x12_Jump($B58541)                                   ;B5890B
B5890E:
    %AICMD0x1C_ShowDialog($0198, $00)                          ;B5890E
    %AICMD0x12_Jump($B58541)                                   ;B58912
B58915:
    %AICMD0x1C_ShowDialog($047C, $00)                          ;B58915
    %AICMD0x12_Jump($B58541)                                   ;B58919
B5891C:
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, $B58939)     ;B5891C
    %AICMD0x1C_ShowDialog($0180, $00)                          ;B58923
    %AICMD0x1B($022F, $00)                                     ;B58927
    %AICMD0x08_EnableAIControl()                               ;B5892B
    %AICMD0x19($003A, $00)                                     ;B5892C
    %AICMD0x13_Wait(120)                                       ;B58930
    %AICMD0x11_EnableUserControl()                             ;B58933
    %AICMD0x57_UpdateStamina(30)                               ;B58934
    %AICMD0x12_Jump($B58541)                                   ;B58936
B58939:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 10, $B588C9)         ;B58939
    %AICMD0x1C_ShowDialog($042E, $00)                          ;B58940
    %AICMD0x1B($022F, $00)                                     ;B58944
    %AICMD0x08_EnableAIControl()                               ;B58948
    %AICMD0x19($0030, $00)                                     ;B58949
    %AICMD0x13_Wait(120)                                       ;B5894D
    %AICMD0x11_EnableUserControl()                             ;B58950
    %AICMD0x57_UpdateStamina(30)                               ;B58951
    %AICMD0x12_Jump($B58541)                                   ;B58953
B58956:
    %AICMD0x1B($02E7, $00)                                     ;B58956
    %AICMD0x0D($FF, $00, $20, $01)                             ;B5895A
    %AICMD0x1B($02E5, $00)                                     ;B5895F
    %AICMD0x0D($00, $FF, $14, $01)                             ;B58963
    %AICMD0x1B($02E7, $00)                                     ;B58968
    %AICMD0x0D($FF, $00, $10, $01)                             ;B5896C
    %AICMD0x1B($02F1, $00)                                     ;B58971
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily3, $0C)       ;B58975
    %AICMD0x41_AddValue16(nLove_Ann, 2)                        ;B5897A
    %AICMD0x12_Jump($B58550)                                   ;B58980
B58983:
    %AICMD0x1C_ShowDialog($02C2, $00)                          ;B58983
    %AICMD0x12_Jump($B58550)                                   ;B58987
B5898A:
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily3, $0C)       ;B5898A
    %AICMD0x10_End()                                           ;B5898F


DATA8_B58990:
 
    %AICMD0x14_JumpIfFlagSet($800196, $01, $B589A6)            ;B58990
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, $B589A6)     ;B58997
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 11, 14, $B58E48) ;B5899E
B589A6:
    %AICMD0x15_JumpIfEquals8(nCurrentTimeID, 18, $B589CA)      ;B589A6
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $07, $B589BF)   ;B589AD
    %AICMD0x1A($0058, $0068, $B3845C, $00)                     ;B589B4
    %AICMD0x12_Jump($B589F7)                                   ;B589BC
B589BF:
    %AICMD0x1A($0148, $0078, $B3845C, $00)                     ;B589BF
    %AICMD0x12_Jump($B589F7)                                   ;B589C7
B589CA:
    %AICMD0x41_AddValue16(nLove_Nina, -2)                      ;B589CA
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $07, $B589E7)   ;B589D0
    %AICMD0x1A($0029, $0053, $B38468, $00)                     ;B589D7
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily3, $0C)       ;B589DF
    %AICMD0x12_Jump($B58A06)                                   ;B589E4
B589E7:
    %AICMD0x1A($0119, $0063, $B38468, $00)                     ;B589E7
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily3, $0C)       ;B589EF
    %AICMD0x12_Jump($B58A06)                                   ;B589F4
B589F7:
    %AICMD0x14_JumpIfFlagSet(strcFlags.daily3, $0B, $B58E14)   ;B589F7
    %AICMD0x2D($B58AD2, $B58A0C)                               ;B589FE
    %AICMD0x12_Jump($B589F7)                                   ;B58A03
B58A06:
    %AICMD0x1F($B58E41)                                        ;B58A06
    %AICMD0x12_Jump($B58A06)                                   ;B58A09
    %AICMD0x16_JumpIfBetween8($80091E, 1, 4, $B58A68)          ;B58A0C
    %AICMD0x16_JumpIfBetween8($80091E, 16, 23, $B58A68)        ;B58A14
    %AICMD0x16_JumpIfBetween8($80091E, 9, 12, $B58A9E)         ;B58A1C
    %AICMD0x15_JumpIfEquals8($80091E, 6, $B58A7C)              ;B58A24
    %AICMD0x15_JumpIfEquals8($80091E, 5, $B58A7C)              ;B58A2B
    %AICMD0x15_JumpIfEquals8($80091E, 25, $B58A47)             ;B58A32
    %AICMD0x15_JumpIfEquals8($80091E, 73, $B58A54)             ;B58A39
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B58A40
    %AICMD0x12_Jump($B589F7)                                   ;B58A44
B58A47:
    %AICMD0x1C_ShowDialog($03B1, $00)                          ;B58A47
    %AICMD0x41_AddValue16(nLove_Nina, -8)                      ;B58A4B
    %AICMD0x12_Jump($B589F7)                                   ;B58A51
B58A54:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $07, $B58AAB)   ;B58A54
    %AICMD0x1C_ShowDialog($0212, $00)                          ;B58A5B
    %AICMD0x41_AddValue16(nLove_Nina, 8)                       ;B58A5F
    %AICMD0x12_Jump($B589F7)                                   ;B58A65
B58A68:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $07, $B58AAB)   ;B58A68
    %AICMD0x1C_ShowDialog($03B2, $00)                          ;B58A6F
    %AICMD0x41_AddValue16(nLove_Nina, 5)                       ;B58A73
    %AICMD0x12_Jump($B589F7)                                   ;B58A79
B58A7C:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $07, $B58AAB)   ;B58A7C
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $08, $B58AB8)   ;B58A83
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $09, $B58AC5)   ;B58A8A
    %AICMD0x1C_ShowDialog($0212, $00)                          ;B58A91
    %AICMD0x41_AddValue16(nLove_Nina, 8)                       ;B58A95
    %AICMD0x12_Jump($B589F7)                                   ;B58A9B
B58A9E:
    %AICMD0x1C_ShowDialog($03BA, $00)                          ;B58A9E
    %AICMD0x41_AddValue16(nLove_Nina, -4)                      ;B58AA2
    %AICMD0x12_Jump($B589F7)                                   ;B58AA8
B58AAB:
    %AICMD0x1C_ShowDialog($01BD, $00)                          ;B58AAB
    %AICMD0x41_AddValue16(nPlayerHappiness, 30)                ;B58AAF
    %AICMD0x12_Jump($B589F7)                                   ;B58AB5
B58AB8:
    %AICMD0x1C_ShowDialog($041D, $00)                          ;B58AB8
    %AICMD0x41_AddValue16(nPlayerHappiness, 30)                ;B58ABC
    %AICMD0x12_Jump($B589F7)                                   ;B58AC2
B58AC5:
    %AICMD0x1C_ShowDialog($041E, $00)                          ;B58AC5
    %AICMD0x41_AddValue16(nPlayerHappiness, 30)                ;B58AC9
    %AICMD0x12_Jump($B589F7)                                   ;B58ACF
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 15, 18, $B58DDA) ;B58AD2
    %AICMD0x43_JumpIfEqual16(nMarriedDaysCounter, 1, $B58BFE)  ;B58ADA
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $04, $B58C0D)   ;B58AE2
    %AICMD0x15_JumpIfEquals8($80098C, 3, $B58C14)              ;B58AE9
    %AICMD0x14_JumpIfFlagSet($800196, $04, $B58C1B)            ;B58AF0
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $05, $B58C0D)   ;B58AF7
    %AICMD0x43_JumpIfEqual16(nFirstChildAge, 1, $B58C30)       ;B58AFE
    %AICMD0x43_JumpIfEqual16(nSecondChildAge, 1, $B58C30)      ;B58B06
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 2, 19, $B58C37) ;B58B0E
    %AICMD0x45_JumpIfBetween16(nSecondChildAge, 2, 19, $B58C37);B58B18
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 20, 39, $B58C4B);B58B22
    %AICMD0x45_JumpIfBetween16(nSecondChildAge, 20, 39, $B58C4B);B58B2C
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 40, 59, $B58C5F);B58B36
    %AICMD0x45_JumpIfBetween16(nSecondChildAge, 40, 59, $B58C5F);B58B40
    %AICMD0x43_JumpIfEqual16(nFirstChildAge, 90, $B58C73)      ;B58B4A
    %AICMD0x43_JumpIfEqual16(nSecondChildAge, 90, $B58C73)     ;B58B52
    %AICMD0x55(strcFlags.event1, $07, $B58B7D)                 ;B58B5A
    %AICMD0x55(strcFlags.event2, $0A, $B58C22)                 ;B58B61
    %AICMD0x55(strcFlags.event2, $0B, $B58C22)                 ;B58B68
    %AICMD0x55(strcFlags.event2, $0C, $B58C22)                 ;B58B6F
    %AICMD0x55(strcFlags.event2, $09, $B58C29)                 ;B58B76
    %AICMD0x15_JumpIfEquals8(nCurrentWeekdayID, 0, $B58CB1)    ;B58B7D
    %AICMD0x15_JumpIfEquals8(nCurrentWeekdayID, 6, $B58CAA)    ;B58B84
    %AICMD0x45_JumpIfBetween16(nLove_Nina, 200, 220, $B58C9C)  ;B58B8B
    %AICMD0x45_JumpIfBetween16(nLove_Nina, 221, 250, $B58CA3)  ;B58B95
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 0, $B58CC6)     ;B58B9F
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 1, $B58CEF)     ;B58BA6
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 2, $B58D19)     ;B58BAD
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, $B58D49)     ;B58BB4
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 60, 89, $B58C7A);B58BBB
    %AICMD0x45_JumpIfBetween16(nSecondChildAge, 60, 89, $B58C7A);B58BC5
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 91, 119, $B58C81);B58BCF
    %AICMD0x45_JumpIfBetween16(nSecondChildAge, 91, 119, $B58C81);B58BD9
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 120, 999, $B58C88);B58BE3
    %AICMD0x45_JumpIfBetween16(nSecondChildAge, 120, 999, $B58C88);B58BED
    %AICMD0x1C_ShowDialog($0485, $00)                          ;B58BF7
    %AICMD0x12_Jump($B589F7)                                   ;B58BFB
B58BFE:
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 15, 18, $B58DDA) ;B58BFE
    %AICMD0x1C_ShowDialog($017D, $00)                          ;B58C06
    %AICMD0x12_Jump($B589F7)                                   ;B58C0A
B58C0D:
    %AICMD0x1C_ShowDialog($0166, $00)                          ;B58C0D
    %AICMD0x12_Jump($B589F7)                                   ;B58C11
B58C14:
    %AICMD0x1C_ShowDialog($015F, $00)                          ;B58C14
    %AICMD0x12_Jump($B589F7)                                   ;B58C18
B58C1B:
    %AICMD0x1C_ShowDialog($0160, $00)                          ;B58C1B
    %AICMD0x12_Jump($B589F7)                                   ;B58C1F
    %AICMD0x1C_ShowDialog($01A0, $00)                          ;B58C22
    %AICMD0x12_Jump($B589F7)                                   ;B58C26
    %AICMD0x1C_ShowDialog($0493, $00)                          ;B58C29
    %AICMD0x12_Jump($B589F7)                                   ;B58C2D
B58C30:
    %AICMD0x1C_ShowDialog($01A2, $00)                          ;B58C30
    %AICMD0x12_Jump($B589F7)                                   ;B58C34
B58C37:
    %AICMD0x17($02)                                            ;B58C37
    %AICMD0x18($00, $B58B7D)                                   ;B58C39
    %AICMD0x18($01, $B58C44)                                   ;B58C3D
    %AICMD0x12_Jump($B589F7)                                   ;B58C41
    %AICMD0x1C_ShowDialog($01A4, $00)                          ;B58C44
    %AICMD0x12_Jump($B589F7)                                   ;B58C48
B58C4B:
    %AICMD0x17($02)                                            ;B58C4B
    %AICMD0x18($00, $B58B7D)                                   ;B58C4D
    %AICMD0x18($01, $B58C58)                                   ;B58C51
    %AICMD0x12_Jump($B589F7)                                   ;B58C55
    %AICMD0x1C_ShowDialog($01A6, $00)                          ;B58C58
    %AICMD0x12_Jump($B589F7)                                   ;B58C5C
B58C5F:
    %AICMD0x17($02)                                            ;B58C5F
    %AICMD0x18($00, $B58B7D)                                   ;B58C61
    %AICMD0x18($01, $B58C6C)                                   ;B58C65
    %AICMD0x12_Jump($B589F7)                                   ;B58C69
    %AICMD0x1C_ShowDialog($01A8, $00)                          ;B58C6C
    %AICMD0x12_Jump($B589F7)                                   ;B58C70
B58C73:
    %AICMD0x1C_ShowDialog($0481, $00)                          ;B58C73
    %AICMD0x12_Jump($B589F7)                                   ;B58C77
B58C7A:
    %AICMD0x1C_ShowDialog($0480, $00)                          ;B58C7A
    %AICMD0x12_Jump($B589F7)                                   ;B58C7E
B58C81:
    %AICMD0x1C_ShowDialog($0484, $00)                          ;B58C81
    %AICMD0x12_Jump($B589F7)                                   ;B58C85
B58C88:
    %AICMD0x17($02)                                            ;B58C88
    %AICMD0x18($00, $B58C95)                                   ;B58C8A
    %AICMD0x1C_ShowDialog($0482, $00)                          ;B58C8E
    %AICMD0x12_Jump($B589F7)                                   ;B58C92
    %AICMD0x1C_ShowDialog($0443, $00)                          ;B58C95
    %AICMD0x12_Jump($B589F7)                                   ;B58C99
B58C9C:
    %AICMD0x1C_ShowDialog($01F4, $00)                          ;B58C9C
    %AICMD0x12_Jump($B589F7)                                   ;B58CA0
B58CA3:
    %AICMD0x1C_ShowDialog($0049, $00)                          ;B58CA3
    %AICMD0x12_Jump($B589F7)                                   ;B58CA7
B58CAA:
    %AICMD0x1C_ShowDialog($047D, $00)                          ;B58CAA
    %AICMD0x12_Jump($B589F7)                                   ;B58CAE
B58CB1:
    %AICMD0x14_JumpIfFlagSet($800196, $01, $B58DC5)            ;B58CB1
    %AICMD0x14_JumpIfFlagSet($800196, $03, $B58DC5)            ;B58CB8
    %AICMD0x1C_ShowDialog($0195, $00)                          ;B58CBF
    %AICMD0x12_Jump($B589F7)                                   ;B58CC3
B58CC6:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 22, $B58CE8)         ;B58CC6
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 23, $B58DBE)         ;B58CCD
    %AICMD0x14_JumpIfFlagSet($800196, $01, $B58DCC)            ;B58CD4
    %AICMD0x17($02)                                            ;B58CDB
    %AICMD0x18($00, $B58BBB)                                   ;B58CDD
    %AICMD0x1C_ShowDialog($0424, $00)                          ;B58CE1
    %AICMD0x12_Jump($B589F7)                                   ;B58CE5
B58CE8:
    %AICMD0x1C_ShowDialog($0208, $00)                          ;B58CE8
    %AICMD0x12_Jump($B589F7)                                   ;B58CEC
B58CEF:
    %AICMD0x14_JumpIfFlagSet($800196, $01, $B58DCC)            ;B58CEF
    %AICMD0x17($04)                                            ;B58CF6
    %AICMD0x18($00, $B58D0B)                                   ;B58CF8
    %AICMD0x18($01, $B58D12)                                   ;B58CFC
    %AICMD0x18($02, $B58BBB)                                   ;B58D00
    %AICMD0x1C_ShowDialog($0425, $00)                          ;B58D04
    %AICMD0x12_Jump($B589F7)                                   ;B58D08
    %AICMD0x1C_ShowDialog($0423, $00)                          ;B58D0B
    %AICMD0x12_Jump($B589F7)                                   ;B58D0F
    %AICMD0x1C_ShowDialog($0141, $00)                          ;B58D12
    %AICMD0x12_Jump($B589F7)                                   ;B58D16
B58D19:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 11, $B58D42)         ;B58D19
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 12, $B58DBE)         ;B58D20
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 20, $B58DBE)         ;B58D27
    %AICMD0x14_JumpIfFlagSet($800196, $01, $B58DCC)            ;B58D2E
    %AICMD0x17($02)                                            ;B58D35
    %AICMD0x18($00, $B58BBB)                                   ;B58D37
    %AICMD0x1C_ShowDialog($0423, $00)                          ;B58D3B
    %AICMD0x12_Jump($B589F7)                                   ;B58D3F
B58D42:
    %AICMD0x1C_ShowDialog($023A, $00)                          ;B58D42
    %AICMD0x12_Jump($B589F7)                                   ;B58D46
B58D49:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 10, $B58D87)         ;B58D49
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 23, $B58DB0)         ;B58D50
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 30, $B58DB7)         ;B58D57
    %AICMD0x14_JumpIfFlagSet($800196, $03, $B58DD3)            ;B58D5E
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 15, 17, $B58DDA) ;B58D65
    %AICMD0x17($02)                                            ;B58D6D
    %AICMD0x18($00, $B58BBB)                                   ;B58D6F
    %AICMD0x1C_ShowDialog($042F, $00)                          ;B58D73
    %AICMD0x12_Jump($B589F7)                                   ;B58D77
    %AICMD0x14_JumpIfFlagSet(strcFlags.daily3, $0B, $B58E14)   ;B58D7A
    %AICMD0x1F($B58D87)                                        ;B58D81
    %AICMD0x12_Jump($B58D7A)                                   ;B58D84
B58D87:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $05, $B58DA9) ;B58D87
    %AICMD0x1C_ShowDialog($0292, $00)                          ;B58D8E
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown1, $05)     ;B58D92
    %AICMD0x08_EnableAIControl()                               ;B58D97
    %AICMD0x19($0039, $00)                                     ;B58D98
    %AICMD0x13_Wait(120)                                       ;B58D9C
    %AICMD0x11_EnableUserControl()                             ;B58D9F
    %AICMD0x41_AddValue16(nPlayerHappiness, 30)                ;B58DA0
    %AICMD0x12_Jump($B58D7A)                                   ;B58DA6
B58DA9:
    %AICMD0x1C_ShowDialog($0293, $00)                          ;B58DA9
    %AICMD0x12_Jump($B58D7A)                                   ;B58DAD
B58DB0:
    %AICMD0x1C_ShowDialog($02B1, $00)                          ;B58DB0
    %AICMD0x12_Jump($B589F7)                                   ;B58DB4
B58DB7:
    %AICMD0x1C_ShowDialog($03FA, $00)                          ;B58DB7
    %AICMD0x12_Jump($B589F7)                                   ;B58DBB
B58DBE:
    %AICMD0x1C_ShowDialog($0361, $00)                          ;B58DBE
    %AICMD0x12_Jump($B589F7)                                   ;B58DC2
B58DC5:
    %AICMD0x1C_ShowDialog($037C, $00)                          ;B58DC5
    %AICMD0x12_Jump($B589F7)                                   ;B58DC9
B58DCC:
    %AICMD0x1C_ShowDialog($0196, $00)                          ;B58DCC
    %AICMD0x12_Jump($B589F7)                                   ;B58DD0
B58DD3:
    %AICMD0x1C_ShowDialog($0199, $00)                          ;B58DD3
    %AICMD0x12_Jump($B589F7)                                   ;B58DD7
B58DDA:
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, $B58DF7)     ;B58DDA
    %AICMD0x1C_ShowDialog($0180, $00)                          ;B58DE1
    %AICMD0x1B($022F, $00)                                     ;B58DE5
    %AICMD0x08_EnableAIControl()                               ;B58DE9
    %AICMD0x19($0031, $00)                                     ;B58DEA
    %AICMD0x13_Wait(120)                                       ;B58DEE
    %AICMD0x11_EnableUserControl()                             ;B58DF1
    %AICMD0x57_UpdateStamina(30)                               ;B58DF2
    %AICMD0x12_Jump($B589F7)                                   ;B58DF4
B58DF7:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 10, $B58D87)         ;B58DF7
    %AICMD0x1C_ShowDialog($0432, $00)                          ;B58DFE
    %AICMD0x1B($022F, $00)                                     ;B58E02
    %AICMD0x08_EnableAIControl()                               ;B58E06
    %AICMD0x19($0032, $00)                                     ;B58E07
    %AICMD0x13_Wait(120)                                       ;B58E0B
    %AICMD0x11_EnableUserControl()                             ;B58E0E
    %AICMD0x57_UpdateStamina(30)                               ;B58E0F
    %AICMD0x12_Jump($B589F7)                                   ;B58E11
B58E14:
    %AICMD0x1B($02E7, $00)                                     ;B58E14
    %AICMD0x0D($FF, $00, $20, $01)                             ;B58E18
    %AICMD0x1B($02E5, $00)                                     ;B58E1D
    %AICMD0x0D($00, $FF, $14, $01)                             ;B58E21
    %AICMD0x1B($02E7, $00)                                     ;B58E26
    %AICMD0x0D($FF, $00, $10, $01)                             ;B58E2A
    %AICMD0x1B($02F1, $00)                                     ;B58E2F
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily3, $0C)       ;B58E33
    %AICMD0x41_AddValue16(nLove_Nina, 2)                       ;B58E38
    %AICMD0x12_Jump($B58A06)                                   ;B58E3E
B58E41:
    %AICMD0x1C_ShowDialog($02C2, $00)                          ;B58E41
    %AICMD0x12_Jump($B58A06)                                   ;B58E45
B58E48:
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily3, $0C)       ;B58E48
    %AICMD0x10_End()                                           ;B58E4D


DATA8_B58E4E:
 
    %AICMD0x14_JumpIfFlagSet($800196, $01, $B58E64)            ;B58E4E
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, $B58E64)     ;B58E55
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 11, 14, $B5930D) ;B58E5C
B58E64:
    %AICMD0x15_JumpIfEquals8(nCurrentTimeID, 18, $B58E88)      ;B58E64
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $07, $B58E7D)   ;B58E6B
    %AICMD0x1A($0058, $0068, $B3845C, $00)                     ;B58E72
    %AICMD0x12_Jump($B58EB5)                                   ;B58E7A
B58E7D:
    %AICMD0x1A($0148, $0078, $B3845C, $00)                     ;B58E7D
    %AICMD0x12_Jump($B58EB5)                                   ;B58E85
B58E88:
    %AICMD0x41_AddValue16(nLove_Ellen, -2)                     ;B58E88
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $07, $B58EA5)   ;B58E8E
    %AICMD0x1A($0029, $0053, $B38468, $00)                     ;B58E95
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily3, $0C)       ;B58E9D
    %AICMD0x12_Jump($B58EC4)                                   ;B58EA2
B58EA5:
    %AICMD0x1A($0119, $0063, $B38468, $00)                     ;B58EA5
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily3, $0C)       ;B58EAD
    %AICMD0x12_Jump($B58EC4)                                   ;B58EB2
B58EB5:
    %AICMD0x14_JumpIfFlagSet(strcFlags.daily3, $0B, $B592D9)   ;B58EB5
    %AICMD0x2D($B58F9F, $B58ECA)                               ;B58EBC
    %AICMD0x12_Jump($B58EB5)                                   ;B58EC1
B58EC4:
    %AICMD0x1F($B59306)                                        ;B58EC4
    %AICMD0x12_Jump($B58EC4)                                   ;B58EC7
    %AICMD0x15_JumpIfEquals8($80091E, 2, $B58F0D)              ;B58ECA
    %AICMD0x16_JumpIfBetween8($80091E, 1, 7, $B58F1A)          ;B58ED1
    %AICMD0x15_JumpIfEquals8($80091E, 25, $B58F2E)             ;B58ED9
    %AICMD0x15_JumpIfEquals8($80091E, 73, $B58F2E)             ;B58EE0
    %AICMD0x15_JumpIfEquals8($80091E, 6, $B58F5C)              ;B58EE7
    %AICMD0x16_JumpIfBetween8($80091E, 16, 19, $B58F1A)        ;B58EEE
    %AICMD0x16_JumpIfBetween8($80091E, 20, 23, $B58F42)        ;B58EF6
    %AICMD0x16_JumpIfBetween8($80091E, 9, 12, $B58F4F)         ;B58EFE
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B58F06
    %AICMD0x12_Jump($B58EB5)                                   ;B58F0A
B58F0D:
    %AICMD0x1C_ShowDialog($01D9, $00)                          ;B58F0D
    %AICMD0x41_AddValue16(nLove_Ellen, -8)                     ;B58F11
    %AICMD0x12_Jump($B58EB5)                                   ;B58F17
B58F1A:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $07, $B58F78)   ;B58F1A
    %AICMD0x1C_ShowDialog($03B2, $00)                          ;B58F21
    %AICMD0x41_AddValue16(nLove_Ellen, 6)                      ;B58F25
    %AICMD0x12_Jump($B58EB5)                                   ;B58F2B
B58F2E:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $07, $B58F78)   ;B58F2E
    %AICMD0x1C_ShowDialog($0212, $00)                          ;B58F35
    %AICMD0x41_AddValue16(nLove_Ellen, 6)                      ;B58F39
    %AICMD0x12_Jump($B58EB5)                                   ;B58F3F
B58F42:
    %AICMD0x1C_ShowDialog($03B3, $00)                          ;B58F42
    %AICMD0x41_AddValue16(nLove_Ellen, 4)                      ;B58F46
    %AICMD0x12_Jump($B58EB5)                                   ;B58F4C
B58F4F:
    %AICMD0x1C_ShowDialog($03BA, $00)                          ;B58F4F
    %AICMD0x41_AddValue16(nLove_Ellen, -4)                     ;B58F53
    %AICMD0x12_Jump($B58EB5)                                   ;B58F59
B58F5C:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $07, $B58F78)   ;B58F5C
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $08, $B58F85)   ;B58F63
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $09, $B58F92)   ;B58F6A
    %AICMD0x1C_ShowDialog($0212, $00)                          ;B58F71
    %AICMD0x12_Jump($B58EB5)                                   ;B58F75
B58F78:
    %AICMD0x1C_ShowDialog($01BD, $00)                          ;B58F78
    %AICMD0x41_AddValue16(nPlayerHappiness, 30)                ;B58F7C
    %AICMD0x12_Jump($B58EB5)                                   ;B58F82
B58F85:
    %AICMD0x1C_ShowDialog($041D, $00)                          ;B58F85
    %AICMD0x41_AddValue16(nPlayerHappiness, 30)                ;B58F89
    %AICMD0x12_Jump($B58EB5)                                   ;B58F8F
B58F92:
    %AICMD0x1C_ShowDialog($041E, $00)                          ;B58F92
    %AICMD0x41_AddValue16(nPlayerHappiness, 30)                ;B58F96
    %AICMD0x12_Jump($B58EB5)                                   ;B58F9C
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 15, 18, $B5929F) ;B58F9F
    %AICMD0x43_JumpIfEqual16(nMarriedDaysCounter, 1, $B590CB)  ;B58FA7
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $04, $B590D2)   ;B58FAF
    %AICMD0x15_JumpIfEquals8($80098C, 3, $B590D9)              ;B58FB6
    %AICMD0x14_JumpIfFlagSet($800196, $04, $B590E0)            ;B58FBD
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $05, $B590D2)   ;B58FC4
    %AICMD0x43_JumpIfEqual16(nFirstChildAge, 1, $B590F5)       ;B58FCB
    %AICMD0x43_JumpIfEqual16(nSecondChildAge, 1, $B590F5)      ;B58FD3
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 2, 19, $B590FC) ;B58FDB
    %AICMD0x45_JumpIfBetween16(nSecondChildAge, 2, 19, $B590FC);B58FE5
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 20, 39, $B59110);B58FEF
    %AICMD0x45_JumpIfBetween16(nSecondChildAge, 20, 39, $B59110);B58FF9
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 40, 59, $B59124);B59003
    %AICMD0x45_JumpIfBetween16(nSecondChildAge, 40, 59, $B59124);B5900D
    %AICMD0x43_JumpIfEqual16(nFirstChildAge, 90, $B59138)      ;B59017
    %AICMD0x43_JumpIfEqual16(nSecondChildAge, 90, $B59138)     ;B5901F
    %AICMD0x55(strcFlags.event1, $07, $B5904A)                 ;B59027
    %AICMD0x55(strcFlags.event2, $0A, $B590E7)                 ;B5902E
    %AICMD0x55(strcFlags.event2, $0B, $B590E7)                 ;B59035
    %AICMD0x55(strcFlags.event2, $0C, $B590E7)                 ;B5903C
    %AICMD0x55(strcFlags.event2, $09, $B590EE)                 ;B59043
    %AICMD0x15_JumpIfEquals8(nCurrentWeekdayID, 0, $B5916F)    ;B5904A
    %AICMD0x15_JumpIfEquals8(nCurrentWeekdayID, 6, $B59184)    ;B59051
    %AICMD0x45_JumpIfBetween16(nLove_Ellen, 200, 220, $B59161) ;B59058
    %AICMD0x45_JumpIfBetween16(nLove_Ellen, 221, 250, $B59168) ;B59062
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 0, $B5918B)     ;B5906C
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 1, $B591B4)     ;B59073
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 2, $B591DE)     ;B5907A
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, $B5920E)     ;B59081
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 60, 89, $B5913F);B59088
    %AICMD0x45_JumpIfBetween16(nSecondChildAge, 60, 89, $B5913F);B59092
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 91, 119, $B59146);B5909C
    %AICMD0x45_JumpIfBetween16(nSecondChildAge, 91, 119, $B59146);B590A6
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 120, 999, $B5914D);B590B0
    %AICMD0x45_JumpIfBetween16(nSecondChildAge, 120, 999, $B5914D);B590BA
    %AICMD0x1C_ShowDialog($0485, $00)                          ;B590C4
    %AICMD0x12_Jump($B58EB5)                                   ;B590C8
B590CB:
    %AICMD0x1C_ShowDialog($017D, $00)                          ;B590CB
    %AICMD0x12_Jump($B58EB5)                                   ;B590CF
B590D2:
    %AICMD0x1C_ShowDialog($0166, $00)                          ;B590D2
    %AICMD0x12_Jump($B58EB5)                                   ;B590D6
B590D9:
    %AICMD0x1C_ShowDialog($015F, $00)                          ;B590D9
    %AICMD0x12_Jump($B58EB5)                                   ;B590DD
B590E0:
    %AICMD0x1C_ShowDialog($0160, $00)                          ;B590E0
    %AICMD0x12_Jump($B58EB5)                                   ;B590E4
    %AICMD0x1C_ShowDialog($01A0, $00)                          ;B590E7
    %AICMD0x12_Jump($B58EB5)                                   ;B590EB
    %AICMD0x1C_ShowDialog($0493, $00)                          ;B590EE
    %AICMD0x12_Jump($B58EB5)                                   ;B590F2
B590F5:
    %AICMD0x1C_ShowDialog($01A2, $00)                          ;B590F5
    %AICMD0x12_Jump($B58EB5)                                   ;B590F9
B590FC:
    %AICMD0x17($02)                                            ;B590FC
    %AICMD0x18($00, $B5904A)                                   ;B590FE
    %AICMD0x18($01, $B59109)                                   ;B59102
    %AICMD0x12_Jump($B58EB5)                                   ;B59106
    %AICMD0x1C_ShowDialog($01A3, $00)                          ;B59109
    %AICMD0x12_Jump($B58EB5)                                   ;B5910D
B59110:
    %AICMD0x17($02)                                            ;B59110
    %AICMD0x18($00, $B5904A)                                   ;B59112
    %AICMD0x18($01, $B5911D)                                   ;B59116
    %AICMD0x12_Jump($B58EB5)                                   ;B5911A
    %AICMD0x1C_ShowDialog($01A4, $00)                          ;B5911D
    %AICMD0x12_Jump($B58EB5)                                   ;B59121
B59124:
    %AICMD0x17($02)                                            ;B59124
    %AICMD0x18($00, $B5904A)                                   ;B59126
    %AICMD0x18($01, $B59131)                                   ;B5912A
    %AICMD0x12_Jump($B58EB5)                                   ;B5912E
    %AICMD0x1C_ShowDialog($01A5, $00)                          ;B59131
    %AICMD0x12_Jump($B58EB5)                                   ;B59135
B59138:
    %AICMD0x1C_ShowDialog($0481, $00)                          ;B59138
    %AICMD0x12_Jump($B58EB5)                                   ;B5913C
B5913F:
    %AICMD0x1C_ShowDialog($0480, $00)                          ;B5913F
    %AICMD0x12_Jump($B58EB5)                                   ;B59143
B59146:
    %AICMD0x1C_ShowDialog($0484, $00)                          ;B59146
    %AICMD0x12_Jump($B58EB5)                                   ;B5914A
B5914D:
    %AICMD0x17($02)                                            ;B5914D
    %AICMD0x18($00, $B5915A)                                   ;B5914F
    %AICMD0x1C_ShowDialog($0482, $00)                          ;B59153
    %AICMD0x12_Jump($B58EB5)                                   ;B59157
    %AICMD0x1C_ShowDialog($0443, $00)                          ;B5915A
    %AICMD0x12_Jump($B58EB5)                                   ;B5915E
B59161:
    %AICMD0x1C_ShowDialog($01F3, $00)                          ;B59161
    %AICMD0x12_Jump($B58EB5)                                   ;B59165
B59168:
    %AICMD0x1C_ShowDialog($0049, $00)                          ;B59168
    %AICMD0x12_Jump($B58EB5)                                   ;B5916C
B5916F:
    %AICMD0x14_JumpIfFlagSet($800196, $01, $B59291)            ;B5916F
    %AICMD0x14_JumpIfFlagSet($800196, $03, $B59291)            ;B59176
    %AICMD0x1C_ShowDialog($0194, $00)                          ;B5917D
    %AICMD0x12_Jump($B58EB5)                                   ;B59181
B59184:
    %AICMD0x1C_ShowDialog($047D, $00)                          ;B59184
    %AICMD0x12_Jump($B58EB5)                                   ;B59188
B5918B:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 22, $B591AD)         ;B5918B
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 23, $B59283)         ;B59192
    %AICMD0x14_JumpIfFlagSet($800196, $01, $B5928A)            ;B59199
    %AICMD0x17($02)                                            ;B591A0
    %AICMD0x18($00, $B59088)                                   ;B591A2
    %AICMD0x1C_ShowDialog($018C, $00)                          ;B591A6
    %AICMD0x12_Jump($B58EB5)                                   ;B591AA
B591AD:
    %AICMD0x1C_ShowDialog($0209, $00)                          ;B591AD
    %AICMD0x12_Jump($B58EB5)                                   ;B591B1
B591B4:
    %AICMD0x14_JumpIfFlagSet($800196, $01, $B5928A)            ;B591B4
    %AICMD0x17($04)                                            ;B591BB
    %AICMD0x18($00, $B591D0)                                   ;B591BD
    %AICMD0x18($01, $B591D7)                                   ;B591C1
    %AICMD0x18($02, $B59088)                                   ;B591C5
    %AICMD0x1C_ShowDialog($018D, $00)                          ;B591C9
    %AICMD0x12_Jump($B58EB5)                                   ;B591CD
    %AICMD0x1C_ShowDialog($0426, $00)                          ;B591D0
    %AICMD0x12_Jump($B58EB5)                                   ;B591D4
    %AICMD0x1C_ShowDialog($0420, $00)                          ;B591D7
    %AICMD0x12_Jump($B58EB5)                                   ;B591DB
B591DE:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 11, $B59207)         ;B591DE
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 12, $B59283)         ;B591E5
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 20, $B59283)         ;B591EC
    %AICMD0x14_JumpIfFlagSet($800196, $01, $B5928A)            ;B591F3
    %AICMD0x17($02)                                            ;B591FA
    %AICMD0x18($00, $B59088)                                   ;B591FC
    %AICMD0x1C_ShowDialog($0192, $00)                          ;B59200
    %AICMD0x12_Jump($B58EB5)                                   ;B59204
B59207:
    %AICMD0x1C_ShowDialog($023B, $00)                          ;B59207
    %AICMD0x12_Jump($B58EB5)                                   ;B5920B
B5920E:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 10, $B5924C)         ;B5920E
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 23, $B59275)         ;B59215
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 30, $B5927C)         ;B5921C
    %AICMD0x14_JumpIfFlagSet($800196, $03, $B59298)            ;B59223
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 15, 17, $B5929F) ;B5922A
    %AICMD0x17($02)                                            ;B59232
    %AICMD0x18($00, $B59088)                                   ;B59234
    %AICMD0x1C_ShowDialog($042F, $00)                          ;B59238
    %AICMD0x12_Jump($B58EB5)                                   ;B5923C
    %AICMD0x14_JumpIfFlagSet(strcFlags.daily3, $0B, $B592D9)   ;B5923F
    %AICMD0x1F($B5924C)                                        ;B59246
    %AICMD0x12_Jump($B5923F)                                   ;B59249
B5924C:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $05, $B5926E) ;B5924C
    %AICMD0x1C_ShowDialog($0292, $00)                          ;B59253
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown1, $05)     ;B59257
    %AICMD0x08_EnableAIControl()                               ;B5925C
    %AICMD0x19($0039, $00)                                     ;B5925D
    %AICMD0x13_Wait(120)                                       ;B59261
    %AICMD0x11_EnableUserControl()                             ;B59264
    %AICMD0x41_AddValue16(nPlayerHappiness, 30)                ;B59265
    %AICMD0x12_Jump($B5923F)                                   ;B5926B
B5926E:
    %AICMD0x1C_ShowDialog($0293, $00)                          ;B5926E
    %AICMD0x12_Jump($B5923F)                                   ;B59272
B59275:
    %AICMD0x1C_ShowDialog($02B4, $00)                          ;B59275
    %AICMD0x12_Jump($B58EB5)                                   ;B59279
B5927C:
    %AICMD0x1C_ShowDialog($03FB, $00)                          ;B5927C
    %AICMD0x12_Jump($B58EB5)                                   ;B59280
B59283:
    %AICMD0x1C_ShowDialog($0363, $00)                          ;B59283
    %AICMD0x12_Jump($B58EB5)                                   ;B59287
B5928A:
    %AICMD0x1C_ShowDialog($0197, $00)                          ;B5928A
    %AICMD0x12_Jump($B58EB5)                                   ;B5928E
B59291:
    %AICMD0x1C_ShowDialog($047C, $00)                          ;B59291
    %AICMD0x12_Jump($B58EB5)                                   ;B59295
B59298:
    %AICMD0x1C_ShowDialog($0199, $00)                          ;B59298
    %AICMD0x12_Jump($B58EB5)                                   ;B5929C
B5929F:
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, $B592BC)     ;B5929F
    %AICMD0x1B($022F, $00)                                     ;B592A6
    %AICMD0x08_EnableAIControl()                               ;B592AA
    %AICMD0x19($0039, $00)                                     ;B592AB
    %AICMD0x13_Wait(120)                                       ;B592AF
    %AICMD0x11_EnableUserControl()                             ;B592B2
    %AICMD0x57_UpdateStamina(30)                               ;B592B3
    %AICMD0x1C_ShowDialog($0180, $00)                          ;B592B5
    %AICMD0x12_Jump($B58EB5)                                   ;B592B9
B592BC:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 10, $B5924C)         ;B592BC
    %AICMD0x1C_ShowDialog($042E, $00)                          ;B592C3
    %AICMD0x1B($022F, $00)                                     ;B592C7
    %AICMD0x08_EnableAIControl()                               ;B592CB
    %AICMD0x19($0030, $00)                                     ;B592CC
    %AICMD0x13_Wait(120)                                       ;B592D0
    %AICMD0x11_EnableUserControl()                             ;B592D3
    %AICMD0x57_UpdateStamina(30)                               ;B592D4
    %AICMD0x12_Jump($B58EB5)                                   ;B592D6
B592D9:
    %AICMD0x1B($02E7, $00)                                     ;B592D9
    %AICMD0x0D($FF, $00, $20, $01)                             ;B592DD
    %AICMD0x1B($02E5, $00)                                     ;B592E2
    %AICMD0x0D($00, $FF, $14, $01)                             ;B592E6
    %AICMD0x1B($02E7, $00)                                     ;B592EB
    %AICMD0x0D($FF, $00, $10, $01)                             ;B592EF
    %AICMD0x1B($02F1, $00)                                     ;B592F4
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily3, $0C)       ;B592F8
    %AICMD0x41_AddValue16(nLove_Ellen, 2)                      ;B592FD
    %AICMD0x12_Jump($B58EC4)                                   ;B59303
B59306:
    %AICMD0x1C_ShowDialog($02C2, $00)                          ;B59306
    %AICMD0x12_Jump($B58EC4)                                   ;B5930A
B5930D:
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily3, $0C)       ;B5930D
    %AICMD0x10_End()                                           ;B59312


DATA8_B59313:
    %AICMD0x14_JumpIfFlagSet($800196, $01, $B59329)            ;B59313
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, $B59329)     ;B5931A
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 11, 14, $B597CB) ;B59321
B59329:
    %AICMD0x15_JumpIfEquals8(nCurrentTimeID, 18, $B5934D)      ;B59329
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $07, $B59342)   ;B59330
    %AICMD0x1A($0058, $0068, $B3845C, $00)                     ;B59337
    %AICMD0x12_Jump($B5937A)                                   ;B5933F
B59342:
    %AICMD0x1A($0148, $0078, $B3845C, $00)                     ;B59342
    %AICMD0x12_Jump($B5937A)                                   ;B5934A
B5934D:
    %AICMD0x41_AddValue16(nLove_Eve, -2)                       ;B5934D
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $07, $B5936A)   ;B59353
    %AICMD0x1A($0029, $0053, $B38468, $00)                     ;B5935A
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily3, $0C)       ;B59362
    %AICMD0x12_Jump($B59389)                                   ;B59367
B5936A:
    %AICMD0x1A($0119, $0063, $B38468, $00)                     ;B5936A
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily3, $0C)       ;B59372
    %AICMD0x12_Jump($B59389)                                   ;B59377
B5937A:
    %AICMD0x14_JumpIfFlagSet(strcFlags.daily3, $0B, $B59797)   ;B5937A
    %AICMD0x2D($B5945C, $B5938F)                               ;B59381
    %AICMD0x12_Jump($B5937A)                                   ;B59386
B59389:
    %AICMD0x1F($B597C4)                                        ;B59389
    %AICMD0x12_Jump($B59389)                                   ;B5938C
    %AICMD0x15_JumpIfEquals8($80091E, 2, $B593D1)              ;B5938F
    %AICMD0x15_JumpIfEquals8($80091E, 7, $B593D1)              ;B59396
    %AICMD0x16_JumpIfBetween8($80091E, 1, 5, $B593DE)          ;B5939D
    %AICMD0x16_JumpIfBetween8($80091E, 16, 23, $B593DE)        ;B593A5
    %AICMD0x15_JumpIfEquals8($80091E, 6, $B593F2)              ;B593AD
    %AICMD0x15_JumpIfEquals8($80091E, 25, $B59406)             ;B593B4
    %AICMD0x15_JumpIfEquals8($80091E, 73, $B59406)             ;B593BB
    %AICMD0x16_JumpIfBetween8($80091E, 9, 12, $B59428)         ;B593C2
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B593CA
    %AICMD0x12_Jump($B5937A)                                   ;B593CE
B593D1:
    %AICMD0x1C_ShowDialog($03B4, $00)                          ;B593D1
    %AICMD0x41_AddValue16(nLove_Eve, -8)                       ;B593D5
    %AICMD0x12_Jump($B5937A)                                   ;B593DB
B593DE:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $07, $B59435)   ;B593DE
    %AICMD0x1C_ShowDialog($03B2, $00)                          ;B593E5
    %AICMD0x41_AddValue16(nLove_Eve, 4)                        ;B593E9
    %AICMD0x12_Jump($B5937A)                                   ;B593EF
B593F2:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $07, $B59435)   ;B593F2
    %AICMD0x1C_ShowDialog($0212, $00)                          ;B593F9
    %AICMD0x41_AddValue16(nLove_Eve, 8)                        ;B593FD
    %AICMD0x12_Jump($B5937A)                                   ;B59403
B59406:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $07, $B59435)   ;B59406
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $08, $B59442)   ;B5940D
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $09, $B5944F)   ;B59414
    %AICMD0x41_AddValue16(nLove_Eve, 8)                        ;B5941B
    %AICMD0x1C_ShowDialog($0212, $00)                          ;B59421
    %AICMD0x12_Jump($B5937A)                                   ;B59425
B59428:
    %AICMD0x1C_ShowDialog($03BA, $00)                          ;B59428
    %AICMD0x41_AddValue16(nLove_Eve, -5)                       ;B5942C
    %AICMD0x12_Jump($B5937A)                                   ;B59432
B59435:
    %AICMD0x1C_ShowDialog($01BD, $00)                          ;B59435
    %AICMD0x41_AddValue16(nPlayerHappiness, 30)                ;B59439
    %AICMD0x12_Jump($B5937A)                                   ;B5943F
B59442:
    %AICMD0x1C_ShowDialog($041D, $00)                          ;B59442
    %AICMD0x41_AddValue16(nPlayerHappiness, 30)                ;B59446
    %AICMD0x12_Jump($B5937A)                                   ;B5944C
B5944F:
    %AICMD0x1C_ShowDialog($041E, $00)                          ;B5944F
    %AICMD0x41_AddValue16(nPlayerHappiness, 30)                ;B59453
    %AICMD0x12_Jump($B5937A)                                   ;B59459
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 15, 18, $B59759) ;B5945C
    %AICMD0x43_JumpIfEqual16(nMarriedDaysCounter, 1, $B59588)  ;B59464
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $04, $B5958F)   ;B5946C
    %AICMD0x15_JumpIfEquals8($80098C, 3, $B59596)              ;B59473
    %AICMD0x14_JumpIfFlagSet($800196, $04, $B5959D)            ;B5947A
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $05, $B5958F)   ;B59481
    %AICMD0x43_JumpIfEqual16(nFirstChildAge, 1, $B595B2)       ;B59488
    %AICMD0x43_JumpIfEqual16(nSecondChildAge, 1, $B595B2)      ;B59490
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 2, 19, $B595B9) ;B59498
    %AICMD0x45_JumpIfBetween16(nSecondChildAge, 2, 19, $B595B9);B594A2
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 20, 39, $B595CD);B594AC
    %AICMD0x45_JumpIfBetween16(nSecondChildAge, 20, 39, $B595CD);B594B6
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 40, 59, $B595E1);B594C0
    %AICMD0x45_JumpIfBetween16(nSecondChildAge, 40, 59, $B595E1);B594CA
    %AICMD0x43_JumpIfEqual16(nFirstChildAge, 90, $B595F2)      ;B594D4
    %AICMD0x43_JumpIfEqual16(nSecondChildAge, 90, $B595F2)     ;B594DC
    %AICMD0x55(strcFlags.event1, $07, $B59507)                 ;B594E4
    %AICMD0x55(strcFlags.event2, $0A, $B595A4)                 ;B594EB
    %AICMD0x55(strcFlags.event2, $0B, $B595A4)                 ;B594F2
    %AICMD0x55(strcFlags.event2, $0C, $B595A4)                 ;B594F9
    %AICMD0x55(strcFlags.event2, $09, $B595AB)                 ;B59500
    %AICMD0x15_JumpIfEquals8(nCurrentWeekdayID, 0, $B59629)    ;B59507
    %AICMD0x15_JumpIfEquals8(nCurrentWeekdayID, 6, $B5963E)    ;B5950E
    %AICMD0x45_JumpIfBetween16(nLove_Eve, 200, 220, $B5961B)   ;B59515
    %AICMD0x45_JumpIfBetween16(nLove_Eve, 221, 250, $B59622)   ;B5951F
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 0, $B59645)     ;B59529
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 1, $B5966E)     ;B59530
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 2, $B59698)     ;B59537
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, $B596C8)     ;B5953E
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 60, 89, $B595F9);B59545
    %AICMD0x45_JumpIfBetween16(nSecondChildAge, 60, 89, $B595F9);B5954F
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 91, 119, $B59600);B59559
    %AICMD0x45_JumpIfBetween16(nSecondChildAge, 91, 119, $B59600);B59563
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 120, 999, $B59607);B5956D
    %AICMD0x45_JumpIfBetween16(nSecondChildAge, 120, 999, $B59607);B59577
    %AICMD0x1C_ShowDialog($0485, $00)                          ;B59581
    %AICMD0x12_Jump($B5937A)                                   ;B59585
B59588:
    %AICMD0x1C_ShowDialog($017D, $00)                          ;B59588
    %AICMD0x12_Jump($B5937A)                                   ;B5958C
B5958F:
    %AICMD0x1C_ShowDialog($0166, $00)                          ;B5958F
    %AICMD0x12_Jump($B5937A)                                   ;B59593
B59596:
    %AICMD0x1C_ShowDialog($015F, $00)                          ;B59596
    %AICMD0x12_Jump($B5937A)                                   ;B5959A
B5959D:
    %AICMD0x1C_ShowDialog($0160, $00)                          ;B5959D
    %AICMD0x12_Jump($B5937A)                                   ;B595A1
    %AICMD0x1C_ShowDialog($01A0, $00)                          ;B595A4
    %AICMD0x12_Jump($B5937A)                                   ;B595A8
    %AICMD0x1C_ShowDialog($0493, $00)                          ;B595AB
    %AICMD0x12_Jump($B5937A)                                   ;B595AF
B595B2:
    %AICMD0x1C_ShowDialog($01A2, $00)                          ;B595B2
    %AICMD0x12_Jump($B5937A)                                   ;B595B6
B595B9:
    %AICMD0x17($02)                                            ;B595B9
    %AICMD0x18($00, $B59507)                                   ;B595BB
    %AICMD0x18($01, $B595C6)                                   ;B595BF
    %AICMD0x12_Jump($B5937A)                                   ;B595C3
    %AICMD0x1C_ShowDialog($01A4, $00)                          ;B595C6
    %AICMD0x12_Jump($B5937A)                                   ;B595CA
B595CD:
    %AICMD0x17($02)                                            ;B595CD
    %AICMD0x18($00, $B59507)                                   ;B595CF
    %AICMD0x18($01, $B595DA)                                   ;B595D3
    %AICMD0x12_Jump($B5937A)                                   ;B595D7
    %AICMD0x1C_ShowDialog($01A5, $00)                          ;B595DA
    %AICMD0x12_Jump($B5937A)                                   ;B595DE
B595E1:
    %AICMD0x17($02)                                            ;B595E1
    %AICMD0x18($00, $B59507)                                   ;B595E3
    %AICMD0x18($01, $B595EB)                                   ;B595E7
    %AICMD0x1C_ShowDialog($01A7, $00)                          ;B595EB
    %AICMD0x12_Jump($B5937A)                                   ;B595EF
B595F2:
    %AICMD0x1C_ShowDialog($0481, $00)                          ;B595F2
    %AICMD0x12_Jump($B5937A)                                   ;B595F6
B595F9:
    %AICMD0x1C_ShowDialog($0480, $00)                          ;B595F9
    %AICMD0x12_Jump($B5937A)                                   ;B595FD
B59600:
    %AICMD0x1C_ShowDialog($0484, $00)                          ;B59600
    %AICMD0x12_Jump($B5937A)                                   ;B59604
B59607:
    %AICMD0x17($02)                                            ;B59607
    %AICMD0x18($00, $B59614)                                   ;B59609
    %AICMD0x1C_ShowDialog($0482, $00)                          ;B5960D
    %AICMD0x12_Jump($B5937A)                                   ;B59611
    %AICMD0x1C_ShowDialog($0443, $00)                          ;B59614
    %AICMD0x12_Jump($B5937A)                                   ;B59618
B5961B:
    %AICMD0x1C_ShowDialog($01F4, $00)                          ;B5961B
    %AICMD0x12_Jump($B5937A)                                   ;B5961F
B59622:
    %AICMD0x1C_ShowDialog($0049, $00)                          ;B59622
    %AICMD0x12_Jump($B5937A)                                   ;B59626
B59629:
    %AICMD0x14_JumpIfFlagSet($800196, $01, $B5974B)            ;B59629
    %AICMD0x14_JumpIfFlagSet($800196, $03, $B5974B)            ;B59630
    %AICMD0x1C_ShowDialog($0195, $00)                          ;B59637
    %AICMD0x12_Jump($B5937A)                                   ;B5963B
B5963E:
    %AICMD0x1C_ShowDialog($047D, $00)                          ;B5963E
    %AICMD0x12_Jump($B5937A)                                   ;B59642
B59645:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 22, $B59667)         ;B59645
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 23, $B5973D)         ;B5964C
    %AICMD0x14_JumpIfFlagSet($800196, $01, $B59744)            ;B59653
    %AICMD0x17($02)                                            ;B5965A
    %AICMD0x18($00, $B59545)                                   ;B5965C
    %AICMD0x1C_ShowDialog($018F, $00)                          ;B59660
    %AICMD0x12_Jump($B5937A)                                   ;B59664
B59667:
    %AICMD0x1C_ShowDialog($020A, $00)                          ;B59667
    %AICMD0x12_Jump($B5937A)                                   ;B5966B
B5966E:
    %AICMD0x14_JumpIfFlagSet($800196, $01, $B59744)            ;B5966E
    %AICMD0x17($04)                                            ;B59675
    %AICMD0x18($00, $B5968A)                                   ;B59677
    %AICMD0x18($01, $B59691)                                   ;B5967B
    %AICMD0x18($02, $B59545)                                   ;B5967F
    %AICMD0x1C_ShowDialog($0190, $00)                          ;B59683
    %AICMD0x12_Jump($B5937A)                                   ;B59687
    %AICMD0x1C_ShowDialog($0426, $00)                          ;B5968A
    %AICMD0x12_Jump($B5937A)                                   ;B5968E
    %AICMD0x1C_ShowDialog($0420, $00)                          ;B59691
    %AICMD0x12_Jump($B5937A)                                   ;B59695
B59698:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 11, $B596C1)         ;B59698
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 12, $B5973D)         ;B5969F
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 20, $B5973D)         ;B596A6
    %AICMD0x14_JumpIfFlagSet($800196, $01, $B59744)            ;B596AD
    %AICMD0x17($02)                                            ;B596B4
    %AICMD0x18($00, $B59545)                                   ;B596B6
    %AICMD0x1C_ShowDialog($0191, $00)                          ;B596BA
    %AICMD0x12_Jump($B5937A)                                   ;B596BE
B596C1:
    %AICMD0x1C_ShowDialog($020A, $00)                          ;B596C1
    %AICMD0x12_Jump($B5937A)                                   ;B596C5
B596C8:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 10, $B59706)         ;B596C8
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 23, $B5972F)         ;B596CF
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 30, $B59736)         ;B596D6
    %AICMD0x14_JumpIfFlagSet($800196, $03, $B59752)            ;B596DD
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 15, 17, $B59759) ;B596E4
    %AICMD0x17($02)                                            ;B596EC
    %AICMD0x18($00, $B59545)                                   ;B596EE
    %AICMD0x1C_ShowDialog($0430, $00)                          ;B596F2
    %AICMD0x12_Jump($B5937A)                                   ;B596F6
    %AICMD0x14_JumpIfFlagSet(strcFlags.daily3, $0B, $B59797)   ;B596F9
    %AICMD0x1F($B59706)                                        ;B59700
    %AICMD0x12_Jump($B596F9)                                   ;B59703
B59706:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $05, $B59728) ;B59706
    %AICMD0x1C_ShowDialog($0292, $00)                          ;B5970D
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown1, $05)     ;B59711
    %AICMD0x08_EnableAIControl()                               ;B59716
    %AICMD0x19($0039, $00)                                     ;B59717
    %AICMD0x13_Wait(120)                                       ;B5971B
    %AICMD0x11_EnableUserControl()                             ;B5971E
    %AICMD0x41_AddValue16(nPlayerHappiness, 30)                ;B5971F
    %AICMD0x12_Jump($B596F9)                                   ;B59725
B59728:
    %AICMD0x1C_ShowDialog($0293, $00)                          ;B59728
    %AICMD0x12_Jump($B596F9)                                   ;B5972C
B5972F:
    %AICMD0x1C_ShowDialog($02B4, $00)                          ;B5972F
    %AICMD0x12_Jump($B5937A)                                   ;B59733
B59736:
    %AICMD0x1C_ShowDialog($0144, $00)                          ;B59736
    %AICMD0x12_Jump($B5937A)                                   ;B5973A
B5973D:
    %AICMD0x1C_ShowDialog($0361, $00)                          ;B5973D
    %AICMD0x12_Jump($B5937A)                                   ;B59741
B59744:
    %AICMD0x1C_ShowDialog($0196, $00)                          ;B59744
    %AICMD0x12_Jump($B5937A)                                   ;B59748
B5974B:
    %AICMD0x1C_ShowDialog($047C, $00)                          ;B5974B
    %AICMD0x12_Jump($B5937A)                                   ;B5974F
B59752:
    %AICMD0x1C_ShowDialog($0198, $00)                          ;B59752
    %AICMD0x12_Jump($B5937A)                                   ;B59756
B59759:
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, $B59778)     ;B59759
    %AICMD0x1C_ShowDialog($0180, $00)                          ;B59760
    %AICMD0x1B($022F, $00)                                     ;B59764
    %AICMD0x08_EnableAIControl()                               ;B59768
    %AICMD0x32($8000D4, $0015)                                 ;B59769
    %AICMD0x13_Wait(120)                                       ;B5976F
    %AICMD0x11_EnableUserControl()                             ;B59772
    %AICMD0x57_UpdateStamina(30)                               ;B59773
    %AICMD0x12_Jump($B5937A)                                   ;B59775
B59778:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 10, $B59706)         ;B59778
    %AICMD0x1C_ShowDialog($042F, $00)                          ;B5977F
    %AICMD0x1B($022F, $00)                                     ;B59783
    %AICMD0x08_EnableAIControl()                               ;B59787
    %AICMD0x32($8000D4, $0015)                                 ;B59788
    %AICMD0x13_Wait(120)                                       ;B5978E
    %AICMD0x11_EnableUserControl()                             ;B59791
    %AICMD0x57_UpdateStamina(30)                               ;B59792
    %AICMD0x12_Jump($B5937A)                                   ;B59794
B59797:
    %AICMD0x1B($02E7, $00)                                     ;B59797
    %AICMD0x0D($FF, $00, $20, $01)                             ;B5979B
    %AICMD0x1B($02E5, $00)                                     ;B597A0
    %AICMD0x0D($00, $FF, $14, $01)                             ;B597A4
    %AICMD0x1B($02E7, $00)                                     ;B597A9
    %AICMD0x0D($FF, $00, $10, $01)                             ;B597AD
    %AICMD0x1B($02F1, $00)                                     ;B597B2
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily3, $0C)       ;B597B6
    %AICMD0x41_AddValue16(nLove_Eve, -2)                       ;B597BB
    %AICMD0x12_Jump($B59389)                                   ;B597C1
B597C4:
    %AICMD0x1C_ShowDialog($02C2, $00)                          ;B597C4
    %AICMD0x12_Jump($B59389)                                   ;B597C8
B597CB:
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
 
    %AICMD0x14_JumpIfFlagSet($800196, $01, $B599EA)            ;B597F1
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 6, 10, $B599EA)  ;B597F8
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 15, 18, $B599EA) ;B59800
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, $B599EA)     ;B59808
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 60, 89, $B5982E);B5980F
    %AICMD0x45_JumpIfBetween16(nSecondChildAge, 60, 89, $B5982E);B59819
    %AICMD0x1A($0168, $0168, $B38AEC, $00)                     ;B59823
    %AICMD0x12_Jump($B59836)                                   ;B5982B
B5982E:
    %AICMD0x1A($0168, $0168, $B38480, $00)                     ;B5982E
B59836:
    %AICMD0x2D($B5990B, $B5983E)                               ;B59836
    %AICMD0x12_Jump($B59836)                                   ;B5983B
    %AICMD0x15_JumpIfEquals8($80091E, 2, $B59880)              ;B5983E
    %AICMD0x16_JumpIfBetween8($80091E, 1, 5, $B5988D)          ;B59845
    %AICMD0x15_JumpIfEquals8($80091E, 7, $B5988D)              ;B5984D
    %AICMD0x16_JumpIfBetween8($80091E, 16, 23, $B5988D)        ;B59854
    %AICMD0x15_JumpIfEquals8($80091E, 25, $B598A1)             ;B5985C
    %AICMD0x15_JumpIfEquals8($80091E, 73, $B598A1)             ;B59863
    %AICMD0x15_JumpIfEquals8($80091E, 6, $B598C2)              ;B5986A
    %AICMD0x16_JumpIfBetween8($80091E, 9, 12, $B598B5)         ;B59871
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B59879
    %AICMD0x12_Jump($B59836)                                   ;B5987D
B59880:
    %AICMD0x1C_ShowDialog($03B0, $00)                          ;B59880
    %AICMD0x41_AddValue16(nLove_Maria, -6)                     ;B59884
    %AICMD0x12_Jump($B59836)                                   ;B5988A
B5988D:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $07, $B598E4)   ;B5988D
    %AICMD0x41_AddValue16(nLove_Maria, 4)                      ;B59894
    %AICMD0x1C_ShowDialog($03B2, $00)                          ;B5989A
    %AICMD0x12_Jump($B59836)                                   ;B5989E
B598A1:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $07, $B598E4)   ;B598A1
    %AICMD0x1C_ShowDialog($03B5, $00)                          ;B598A8
    %AICMD0x41_AddValue16(nLove_Maria, 8)                      ;B598AC
    %AICMD0x12_Jump($B59836)                                   ;B598B2
B598B5:
    %AICMD0x1C_ShowDialog($01D9, $00)                          ;B598B5
    %AICMD0x41_AddValue16(nLove_Maria, -4)                     ;B598B9
    %AICMD0x12_Jump($B59836)                                   ;B598BF
B598C2:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $07, $B598E4)   ;B598C2
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $08, $B598F1)   ;B598C9
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $09, $B598FE)   ;B598D0
    %AICMD0x41_AddValue16(nLove_Maria, 8)                      ;B598D7
    %AICMD0x1C_ShowDialog($0212, $00)                          ;B598DD
    %AICMD0x12_Jump($B59836)                                   ;B598E1
B598E4:
    %AICMD0x1C_ShowDialog($01BD, $00)                          ;B598E4
    %AICMD0x41_AddValue16(nPlayerHappiness, 30)                ;B598E8
    %AICMD0x12_Jump($B59836)                                   ;B598EE
B598F1:
    %AICMD0x1C_ShowDialog($041D, $00)                          ;B598F1
    %AICMD0x41_AddValue16(nPlayerHappiness, 30)                ;B598F5
    %AICMD0x12_Jump($B59836)                                   ;B598FB
B598FE:
    %AICMD0x1C_ShowDialog($041E, $00)                          ;B598FE
    %AICMD0x41_AddValue16(nPlayerHappiness, 30)                ;B59902
    %AICMD0x12_Jump($B59836)                                   ;B59908
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $04, $B59961)   ;B5990B
    %AICMD0x15_JumpIfEquals8($80098C, 3, $B59968)              ;B59912
    %AICMD0x14_JumpIfFlagSet($800196, $04, $B5996F)            ;B59919
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $05, $B59961)   ;B59920
    %AICMD0x45_JumpIfBetween16(nLove_Maria, 200, 220, $B59976) ;B59927
    %AICMD0x45_JumpIfBetween16(nLove_Maria, 221, 250, $B5997D) ;B59931
    %AICMD0x15_JumpIfEquals8(nCurrentWeekdayID, 0, $B5998B)    ;B5993B
    %AICMD0x15_JumpIfEquals8(nCurrentWeekdayID, 6, $B59984)    ;B59942
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 0, $B59992)     ;B59949
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 1, $B599B4)     ;B59950
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 2, $B599C8)     ;B59957
    %AICMD0x12_Jump($B59836)                                   ;B5995E
B59961:
    %AICMD0x1C_ShowDialog($0166, $00)                          ;B59961
    %AICMD0x12_Jump($B59836)                                   ;B59965
B59968:
    %AICMD0x1C_ShowDialog($015F, $00)                          ;B59968
    %AICMD0x12_Jump($B59836)                                   ;B5996C
B5996F:
    %AICMD0x1C_ShowDialog($0160, $00)                          ;B5996F
    %AICMD0x12_Jump($B59836)                                   ;B59973
B59976:
    %AICMD0x1C_ShowDialog($01F3, $00)                          ;B59976
    %AICMD0x12_Jump($B59836)                                   ;B5997A
B5997D:
    %AICMD0x1C_ShowDialog($0049, $00)                          ;B5997D
    %AICMD0x12_Jump($B59836)                                   ;B59981
B59984:
    %AICMD0x1C_ShowDialog($047D, $00)                          ;B59984
    %AICMD0x12_Jump($B59836)                                   ;B59988
B5998B:
    %AICMD0x1C_ShowDialog($0195, $00)                          ;B5998B
    %AICMD0x12_Jump($B59836)                                   ;B5998F
B59992:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 22, $B599AD)         ;B59992
    %AICMD0x17($02)                                            ;B59999
    %AICMD0x18($00, $B599A6)                                   ;B5999B
    %AICMD0x1C_ShowDialog($041F, $00)                          ;B5999F
    %AICMD0x12_Jump($B59836)                                   ;B599A3
    %AICMD0x1C_ShowDialog($0188, $00)                          ;B599A6
    %AICMD0x12_Jump($B59836)                                   ;B599AA
B599AD:
    %AICMD0x1C_ShowDialog($0206, $00)                          ;B599AD
    %AICMD0x12_Jump($B59836)                                   ;B599B1
B599B4:
    %AICMD0x17($02)                                            ;B599B4
    %AICMD0x18($00, $B599C1)                                   ;B599B6
    %AICMD0x1C_ShowDialog($0420, $00)                          ;B599BA
    %AICMD0x12_Jump($B59836)                                   ;B599BE
    %AICMD0x1C_ShowDialog($0193, $00)                          ;B599C1
    %AICMD0x12_Jump($B59836)                                   ;B599C5
B599C8:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 11, $B599E3)         ;B599C8
    %AICMD0x17($02)                                            ;B599CF
    %AICMD0x18($00, $B599DC)                                   ;B599D1
    %AICMD0x1C_ShowDialog($0421, $00)                          ;B599D5
    %AICMD0x12_Jump($B59836)                                   ;B599D9
    %AICMD0x1C_ShowDialog($0184, $00)                          ;B599DC
    %AICMD0x12_Jump($B59836)                                   ;B599E0
B599E3:
    %AICMD0x1C_ShowDialog($0238, $00)                          ;B599E3
    %AICMD0x12_Jump($B59836)                                   ;B599E7
B599EA:
    %AICMD0x10_End()                                           ;B599EA


DATA8_B599EB:
 
    %AICMD0x14_JumpIfFlagSet($800196, $01, $B59BD4)            ;B599EB
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 6, 10, $B59BD4)  ;B599F2
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 15, 18, $B59BD4) ;B599FA
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, $B59BD4)     ;B59A02
    %AICMD0x09($01, $B59BD5)                                   ;B59A09
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 60, 89, $B59A2C);B59A0D
    %AICMD0x45_JumpIfBetween16(nSecondChildAge, 60, 89, $B59A2C);B59A17
    %AICMD0x1A($0048, $0048, $B38AF8, $00)                     ;B59A21
    %AICMD0x12_Jump($B59A34)                                   ;B59A29
B59A2C:
    %AICMD0x1A($0048, $0048, $B38480, $00)                     ;B59A2C
B59A34:
    %AICMD0x2D($B59AF5, $B59A3C)                               ;B59A34
    %AICMD0x12_Jump($B59A34)                                   ;B59A39
    %AICMD0x15_JumpIfEquals8($80091E, 2, $B59A77)              ;B59A3C
    %AICMD0x16_JumpIfBetween8($80091E, 3, 7, $B59A98)          ;B59A43
    %AICMD0x16_JumpIfBetween8($80091E, 16, 23, $B59A98)        ;B59A4B
    %AICMD0x15_JumpIfEquals8($80091E, 6, $B59AAC)              ;B59A53
    %AICMD0x15_JumpIfEquals8($80091E, 25, $B59A84)             ;B59A5A
    %AICMD0x15_JumpIfEquals8($80091E, 73, $B59A84)             ;B59A61
    %AICMD0x16_JumpIfBetween8($80091E, 9, 12, $B59A77)         ;B59A68
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B59A70
    %AICMD0x12_Jump($B59A34)                                   ;B59A74
B59A77:
    %AICMD0x1C_ShowDialog($03B4, $00)                          ;B59A77
    %AICMD0x41_AddValue16(nLove_Ann, -6)                       ;B59A7B
    %AICMD0x12_Jump($B59A34)                                   ;B59A81
B59A84:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $07, $B59ACE)   ;B59A84
    %AICMD0x41_AddValue16(nLove_Ann, 8)                        ;B59A8B
    %AICMD0x1C_ShowDialog($0212, $00)                          ;B59A91
    %AICMD0x12_Jump($B59A34)                                   ;B59A95
B59A98:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $07, $B59ACE)   ;B59A98
    %AICMD0x1C_ShowDialog($03B2, $00)                          ;B59A9F
    %AICMD0x41_AddValue16(nLove_Ann, 5)                        ;B59AA3
    %AICMD0x12_Jump($B59A34)                                   ;B59AA9
B59AAC:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $07, $B59ACE)   ;B59AAC
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $08, $B59ADB)   ;B59AB3
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $09, $B59AE8)   ;B59ABA
    %AICMD0x41_AddValue16(nLove_Ann, 8)                        ;B59AC1
    %AICMD0x1C_ShowDialog($0212, $00)                          ;B59AC7
    %AICMD0x12_Jump($B59A34)                                   ;B59ACB
B59ACE:
    %AICMD0x1C_ShowDialog($01BD, $00)                          ;B59ACE
    %AICMD0x41_AddValue16(nPlayerHappiness, 30)                ;B59AD2
    %AICMD0x12_Jump($B59A34)                                   ;B59AD8
B59ADB:
    %AICMD0x1C_ShowDialog($041D, $00)                          ;B59ADB
    %AICMD0x41_AddValue16(nPlayerHappiness, 30)                ;B59ADF
    %AICMD0x12_Jump($B59A34)                                   ;B59AE5
B59AE8:
    %AICMD0x1C_ShowDialog($041E, $00)                          ;B59AE8
    %AICMD0x41_AddValue16(nPlayerHappiness, 30)                ;B59AEC
    %AICMD0x12_Jump($B59A34)                                   ;B59AF2
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $04, $B59B4B)   ;B59AF5
    %AICMD0x15_JumpIfEquals8($80098C, 3, $B59B52)              ;B59AFC
    %AICMD0x14_JumpIfFlagSet($800196, $04, $B59B59)            ;B59B03
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $05, $B59B4B)   ;B59B0A
    %AICMD0x45_JumpIfBetween16(nLove_Ann, 200, 220, $B59B60)   ;B59B11
    %AICMD0x45_JumpIfBetween16(nLove_Ann, 221, 250, $B59B67)   ;B59B1B
    %AICMD0x15_JumpIfEquals8(nCurrentWeekdayID, 0, $B59B75)    ;B59B25
    %AICMD0x15_JumpIfEquals8(nCurrentWeekdayID, 6, $B59B6E)    ;B59B2C
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 0, $B59B7C)     ;B59B33
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 1, $B59B9E)     ;B59B3A
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 2, $B59BB2)     ;B59B41
    %AICMD0x12_Jump($B59A34)                                   ;B59B48
B59B4B:
    %AICMD0x1C_ShowDialog($0166, $00)                          ;B59B4B
    %AICMD0x12_Jump($B59A34)                                   ;B59B4F
B59B52:
    %AICMD0x1C_ShowDialog($015F, $00)                          ;B59B52
    %AICMD0x12_Jump($B59A34)                                   ;B59B56
B59B59:
    %AICMD0x1C_ShowDialog($0160, $00)                          ;B59B59
    %AICMD0x12_Jump($B59A34)                                   ;B59B5D
B59B60:
    %AICMD0x1C_ShowDialog($01F4, $00)                          ;B59B60
    %AICMD0x12_Jump($B59A34)                                   ;B59B64
B59B67:
    %AICMD0x1C_ShowDialog($0049, $00)                          ;B59B67
    %AICMD0x12_Jump($B59A34)                                   ;B59B6B
B59B6E:
    %AICMD0x1C_ShowDialog($047D, $00)                          ;B59B6E
    %AICMD0x12_Jump($B59A34)                                   ;B59B72
B59B75:
    %AICMD0x1C_ShowDialog($0194, $00)                          ;B59B75
    %AICMD0x12_Jump($B59A34)                                   ;B59B79
B59B7C:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 22, $B59B97)         ;B59B7C
    %AICMD0x17($02)                                            ;B59B83
    %AICMD0x18($00, $B59B90)                                   ;B59B85
    %AICMD0x1C_ShowDialog($0185, $00)                          ;B59B89
    %AICMD0x12_Jump($B59A34)                                   ;B59B8D
    %AICMD0x1C_ShowDialog($018F, $00)                          ;B59B90
    %AICMD0x12_Jump($B59A34)                                   ;B59B94
B59B97:
    %AICMD0x1C_ShowDialog($0207, $00)                          ;B59B97
    %AICMD0x12_Jump($B59A34)                                   ;B59B9B
B59B9E:
    %AICMD0x17($02)                                            ;B59B9E
    %AICMD0x18($00, $B59BAB)                                   ;B59BA0
    %AICMD0x1C_ShowDialog($0186, $00)                          ;B59BA4
    %AICMD0x12_Jump($B59A34)                                   ;B59BA8
    %AICMD0x1C_ShowDialog($0193, $00)                          ;B59BAB
    %AICMD0x12_Jump($B59A34)                                   ;B59BAF
B59BB2:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 11, $B59BCD)         ;B59BB2
    %AICMD0x17($02)                                            ;B59BB9
    %AICMD0x18($00, $B59BC6)                                   ;B59BBB
    %AICMD0x1C_ShowDialog($0187, $00)                          ;B59BBF
    %AICMD0x12_Jump($B59A34)                                   ;B59BC3
    %AICMD0x1C_ShowDialog($009A, $00)                          ;B59BC6
    %AICMD0x12_Jump($B59A34)                                   ;B59BCA
B59BCD:
    %AICMD0x1C_ShowDialog($0239, $00)                          ;B59BCD
    %AICMD0x12_Jump($B59A34)                                   ;B59BD1
B59BD4:
    %AICMD0x10_End()                                           ;B59BD4
B59BD5:
    %AICMD0x1A($0058, $0048, $B38B1C, $00)                     ;B59BD5
    %AICMD0x13_Wait(1)                                         ;B59BDD
    %AICMD0x12_Jump($B59BDD)                                   ;B59BE0


DATA8_B59BE3:
 
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, $B59DD2)     ;B59BE3
    %AICMD0x14_JumpIfFlagSet($800196, $01, $B59DD2)            ;B59BEA
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 6, 10, $B59DD2)  ;B59BF1
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 15, 18, $B59DD2) ;B59BF9
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 60, 89, $B59C20);B59C01
    %AICMD0x45_JumpIfBetween16(nSecondChildAge, 60, 89, $B59C20);B59C0B
    %AICMD0x1A($0168, $0168, $B38B04, $00)                     ;B59C15
    %AICMD0x12_Jump($B59C28)                                   ;B59C1D
B59C20:
    %AICMD0x1A($0168, $0168, $B3848C, $00)                     ;B59C20
B59C28:
    %AICMD0x2D($B59CF6, $B59C30)                               ;B59C28
    %AICMD0x12_Jump($B59C28)                                   ;B59C2D
    %AICMD0x16_JumpIfBetween8($80091E, 1, 4, $B59C8C)          ;B59C30
    %AICMD0x16_JumpIfBetween8($80091E, 16, 23, $B59C8C)        ;B59C38
    %AICMD0x16_JumpIfBetween8($80091E, 9, 12, $B59CA0)         ;B59C40
    %AICMD0x15_JumpIfEquals8($80091E, 6, $B59CAD)              ;B59C48
    %AICMD0x15_JumpIfEquals8($80091E, 5, $B59CAD)              ;B59C4F
    %AICMD0x15_JumpIfEquals8($80091E, 25, $B59C6B)             ;B59C56
    %AICMD0x15_JumpIfEquals8($80091E, 73, $B59C78)             ;B59C5D
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B59C64
    %AICMD0x12_Jump($B59C28)                                   ;B59C68
B59C6B:
    %AICMD0x1C_ShowDialog($03B1, $00)                          ;B59C6B
    %AICMD0x41_AddValue16(nLove_Nina, -8)                      ;B59C6F
    %AICMD0x12_Jump($B59C28)                                   ;B59C75
B59C78:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $07, $B59CCF)   ;B59C78
    %AICMD0x1C_ShowDialog($0212, $00)                          ;B59C7F
    %AICMD0x41_AddValue16(nLove_Nina, 8)                       ;B59C83
    %AICMD0x12_Jump($B59C28)                                   ;B59C89
B59C8C:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $07, $B59CCF)   ;B59C8C
    %AICMD0x1C_ShowDialog($03B2, $00)                          ;B59C93
    %AICMD0x41_AddValue16(nLove_Nina, 5)                       ;B59C97
    %AICMD0x12_Jump($B59C28)                                   ;B59C9D
B59CA0:
    %AICMD0x1C_ShowDialog($03BA, $00)                          ;B59CA0
    %AICMD0x41_AddValue16(nLove_Nina, -4)                      ;B59CA4
    %AICMD0x12_Jump($B59C28)                                   ;B59CAA
B59CAD:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $07, $B59CCF)   ;B59CAD
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $08, $B59CDC)   ;B59CB4
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $09, $B59CE9)   ;B59CBB
    %AICMD0x1C_ShowDialog($0212, $00)                          ;B59CC2
    %AICMD0x41_AddValue16(nLove_Nina, 8)                       ;B59CC6
    %AICMD0x12_Jump($B59C28)                                   ;B59CCC
B59CCF:
    %AICMD0x1C_ShowDialog($01BD, $00)                          ;B59CCF
    %AICMD0x41_AddValue16(nPlayerHappiness, 30)                ;B59CD3
    %AICMD0x12_Jump($B59C28)                                   ;B59CD9
B59CDC:
    %AICMD0x1C_ShowDialog($041D, $00)                          ;B59CDC
    %AICMD0x41_AddValue16(nPlayerHappiness, 30)                ;B59CE0
    %AICMD0x12_Jump($B59C28)                                   ;B59CE6
B59CE9:
    %AICMD0x1C_ShowDialog($041E, $00)                          ;B59CE9
    %AICMD0x41_AddValue16(nPlayerHappiness, 30)                ;B59CED
    %AICMD0x12_Jump($B59C28)                                   ;B59CF3
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $04, $B59D49)   ;B59CF6
    %AICMD0x15_JumpIfEquals8($80098C, 3, $B59D50)              ;B59CFD
    %AICMD0x14_JumpIfFlagSet($800196, $04, $B59D57)            ;B59D04
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $05, $B59D49)   ;B59D0B
    %AICMD0x45_JumpIfBetween16(nLove_Nina, 200, 220, $B59D5E)  ;B59D12
    %AICMD0x45_JumpIfBetween16(nLove_Nina, 221, 250, $B59D65)  ;B59D1C
    %AICMD0x15_JumpIfEquals8(nCurrentWeekdayID, 0, $B59D6C)    ;B59D26
    %AICMD0x15_JumpIfEquals8(nCurrentWeekdayID, 6, $B59D73)    ;B59D2D
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 0, $B59D7A)     ;B59D34
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 1, $B59D9C)     ;B59D3B
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 2, $B59DB0)     ;B59D42
B59D49:
    %AICMD0x1C_ShowDialog($0166, $00)                          ;B59D49
    %AICMD0x12_Jump($B59C28)                                   ;B59D4D
B59D50:
    %AICMD0x1C_ShowDialog($015F, $00)                          ;B59D50
    %AICMD0x12_Jump($B59C28)                                   ;B59D54
B59D57:
    %AICMD0x1C_ShowDialog($0160, $00)                          ;B59D57
    %AICMD0x12_Jump($B59C28)                                   ;B59D5B
B59D5E:
    %AICMD0x1C_ShowDialog($01F4, $00)                          ;B59D5E
    %AICMD0x12_Jump($B59C28)                                   ;B59D62
B59D65:
    %AICMD0x1C_ShowDialog($0049, $00)                          ;B59D65
    %AICMD0x12_Jump($B59C28)                                   ;B59D69
B59D6C:
    %AICMD0x1C_ShowDialog($0194, $00)                          ;B59D6C
    %AICMD0x12_Jump($B59C28)                                   ;B59D70
B59D73:
    %AICMD0x1C_ShowDialog($047D, $00)                          ;B59D73
    %AICMD0x12_Jump($B59C28)                                   ;B59D77
B59D7A:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 22, $B59D95)         ;B59D7A
    %AICMD0x17($02)                                            ;B59D81
    %AICMD0x18($00, $B59D8E)                                   ;B59D83
    %AICMD0x1C_ShowDialog($0189, $00)                          ;B59D87
    %AICMD0x12_Jump($B59C28)                                   ;B59D8B
    %AICMD0x1C_ShowDialog($018F, $00)                          ;B59D8E
    %AICMD0x12_Jump($B59C28)                                   ;B59D92
B59D95:
    %AICMD0x1C_ShowDialog($0208, $00)                          ;B59D95
    %AICMD0x12_Jump($B59C28)                                   ;B59D99
B59D9C:
    %AICMD0x17($02)                                            ;B59D9C
    %AICMD0x18($00, $B59DA9)                                   ;B59D9E
    %AICMD0x1C_ShowDialog($018A, $00)                          ;B59DA2
    %AICMD0x12_Jump($B59C28)                                   ;B59DA6
    %AICMD0x1C_ShowDialog($018B, $00)                          ;B59DA9
    %AICMD0x12_Jump($B59C28)                                   ;B59DAD
B59DB0:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 11, $B59DCB)         ;B59DB0
    %AICMD0x17($02)                                            ;B59DB7
    %AICMD0x18($00, $B59DC4)                                   ;B59DB9
    %AICMD0x1C_ShowDialog($0432, $00)                          ;B59DBD
    %AICMD0x12_Jump($B59C28)                                   ;B59DC1
    %AICMD0x1C_ShowDialog($0191, $00)                          ;B59DC4
    %AICMD0x12_Jump($B59C28)                                   ;B59DC8
B59DCB:
    %AICMD0x1C_ShowDialog($023A, $00)                          ;B59DCB
    %AICMD0x12_Jump($B59C28)                                   ;B59DCF
B59DD2:
    %AICMD0x10_End()                                           ;B59DD2


DATA8_B59DD3:
 
    %AICMD0x14_JumpIfFlagSet($800196, $01, $B59FC9)            ;B59DD3
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, $B59FC9)     ;B59DDA
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 17, 18, $B59FC9) ;B59DE1
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 60, 89, $B59E08);B59DE9
    %AICMD0x45_JumpIfBetween16(nSecondChildAge, 60, 89, $B59E08);B59DF3
    %AICMD0x1A($0168, $0168, $B38B04, $00)                     ;B59DFD
    %AICMD0x12_Jump($B59E10)                                   ;B59E05
B59E08:
    %AICMD0x1A($0168, $0168, $B3848C, $00)                     ;B59E08
B59E10:
    %AICMD0x2D($B59EED, $B59E18)                               ;B59E10
    %AICMD0x12_Jump($B59E10)                                   ;B59E15
    %AICMD0x15_JumpIfEquals8($80091E, 2, $B59E5B)              ;B59E18
    %AICMD0x16_JumpIfBetween8($80091E, 1, 7, $B59E68)          ;B59E1F
    %AICMD0x16_JumpIfBetween8($80091E, 16, 19, $B59E68)        ;B59E27
    %AICMD0x15_JumpIfEquals8($80091E, 25, $B59E7C)             ;B59E2F
    %AICMD0x15_JumpIfEquals8($80091E, 73, $B59E7C)             ;B59E36
    %AICMD0x15_JumpIfEquals8($80091E, 6, $B59EAA)              ;B59E3D
    %AICMD0x16_JumpIfBetween8($80091E, 20, 23, $B59E90)        ;B59E44
    %AICMD0x16_JumpIfBetween8($80091E, 9, 12, $B59E9D)         ;B59E4C
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B59E54
    %AICMD0x12_Jump($B59E10)                                   ;B59E58
B59E5B:
    %AICMD0x1C_ShowDialog($01D9, $00)                          ;B59E5B
    %AICMD0x41_AddValue16(nLove_Ellen, -8)                     ;B59E5F
    %AICMD0x12_Jump($B59E10)                                   ;B59E65
B59E68:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $07, $B59EC6)   ;B59E68
    %AICMD0x1C_ShowDialog($03B2, $00)                          ;B59E6F
    %AICMD0x41_AddValue16(nLove_Ellen, 6)                      ;B59E73
    %AICMD0x12_Jump($B59E10)                                   ;B59E79
B59E7C:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $07, $B59EC6)   ;B59E7C
    %AICMD0x1C_ShowDialog($0212, $00)                          ;B59E83
    %AICMD0x41_AddValue16(nLove_Ellen, 6)                      ;B59E87
    %AICMD0x12_Jump($B59E10)                                   ;B59E8D
B59E90:
    %AICMD0x1C_ShowDialog($03B3, $00)                          ;B59E90
    %AICMD0x41_AddValue16(nLove_Ellen, 4)                      ;B59E94
    %AICMD0x12_Jump($B59E10)                                   ;B59E9A
B59E9D:
    %AICMD0x1C_ShowDialog($03BA, $00)                          ;B59E9D
    %AICMD0x41_AddValue16(nLove_Ellen, -4)                     ;B59EA1
    %AICMD0x12_Jump($B59E10)                                   ;B59EA7
B59EAA:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $07, $B59EC6)   ;B59EAA
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $08, $B59ED3)   ;B59EB1
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $09, $B59EE0)   ;B59EB8
    %AICMD0x1C_ShowDialog($0212, $00)                          ;B59EBF
    %AICMD0x12_Jump($B59E10)                                   ;B59EC3
B59EC6:
    %AICMD0x1C_ShowDialog($01BD, $00)                          ;B59EC6
    %AICMD0x41_AddValue16(nPlayerHappiness, 30)                ;B59ECA
    %AICMD0x12_Jump($B59E10)                                   ;B59ED0
B59ED3:
    %AICMD0x1C_ShowDialog($041D, $00)                          ;B59ED3
    %AICMD0x41_AddValue16(nPlayerHappiness, 30)                ;B59ED7
    %AICMD0x12_Jump($B59E10)                                   ;B59EDD
B59EE0:
    %AICMD0x1C_ShowDialog($041E, $00)                          ;B59EE0
    %AICMD0x41_AddValue16(nPlayerHappiness, 30)                ;B59EE4
    %AICMD0x12_Jump($B59E10)                                   ;B59EEA
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $04, $B59F40)   ;B59EED
    %AICMD0x15_JumpIfEquals8($80098C, 3, $B59F47)              ;B59EF4
    %AICMD0x14_JumpIfFlagSet($800196, $04, $B59F4E)            ;B59EFB
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $05, $B59F40)   ;B59F02
    %AICMD0x45_JumpIfBetween16(nLove_Ellen, 200, 220, $B59F55) ;B59F09
    %AICMD0x45_JumpIfBetween16(nLove_Ellen, 221, 250, $B59F5C) ;B59F13
    %AICMD0x15_JumpIfEquals8(nCurrentWeekdayID, 0, $B59F63)    ;B59F1D
    %AICMD0x15_JumpIfEquals8(nCurrentWeekdayID, 6, $B59F6A)    ;B59F24
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 0, $B59F71)     ;B59F2B
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 1, $B59F93)     ;B59F32
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 2, $B59FA7)     ;B59F39
B59F40:
    %AICMD0x1C_ShowDialog($0166, $00)                          ;B59F40
    %AICMD0x12_Jump($B59E10)                                   ;B59F44
B59F47:
    %AICMD0x1C_ShowDialog($015F, $00)                          ;B59F47
    %AICMD0x12_Jump($B59E10)                                   ;B59F4B
B59F4E:
    %AICMD0x1C_ShowDialog($0160, $00)                          ;B59F4E
    %AICMD0x12_Jump($B59E10)                                   ;B59F52
B59F55:
    %AICMD0x1C_ShowDialog($01F3, $00)                          ;B59F55
    %AICMD0x12_Jump($B59E10)                                   ;B59F59
B59F5C:
    %AICMD0x1C_ShowDialog($0049, $00)                          ;B59F5C
    %AICMD0x12_Jump($B59E10)                                   ;B59F60
B59F63:
    %AICMD0x1C_ShowDialog($0195, $00)                          ;B59F63
    %AICMD0x12_Jump($B59E10)                                   ;B59F67
B59F6A:
    %AICMD0x1C_ShowDialog($047D, $00)                          ;B59F6A
    %AICMD0x12_Jump($B59E10)                                   ;B59F6E
B59F71:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 22, $B59F8C)         ;B59F71
    %AICMD0x17($02)                                            ;B59F78
    %AICMD0x18($00, $B59F85)                                   ;B59F7A
    %AICMD0x1C_ShowDialog($0427, $00)                          ;B59F7E
    %AICMD0x12_Jump($B59E10)                                   ;B59F82
    %AICMD0x1C_ShowDialog($041F, $00)                          ;B59F85
    %AICMD0x12_Jump($B59E10)                                   ;B59F89
B59F8C:
    %AICMD0x1C_ShowDialog($0209, $00)                          ;B59F8C
    %AICMD0x12_Jump($B59E10)                                   ;B59F90
B59F93:
    %AICMD0x17($02)                                            ;B59F93
    %AICMD0x18($00, $B59FA0)                                   ;B59F95
    %AICMD0x1C_ShowDialog($0429, $00)                          ;B59F99
    %AICMD0x12_Jump($B59E10)                                   ;B59F9D
    %AICMD0x1C_ShowDialog($018E, $00)                          ;B59FA0
    %AICMD0x12_Jump($B59E10)                                   ;B59FA4
B59FA7:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 11, $B59FC2)         ;B59FA7
    %AICMD0x17($02)                                            ;B59FAE
    %AICMD0x18($00, $B59FBB)                                   ;B59FB0
    %AICMD0x1C_ShowDialog($0428, $00)                          ;B59FB4
    %AICMD0x12_Jump($B59E10)                                   ;B59FB8
    %AICMD0x1C_ShowDialog($0421, $00)                          ;B59FBB
    %AICMD0x12_Jump($B59E10)                                   ;B59FBF
B59FC2:
    %AICMD0x1C_ShowDialog($023B, $00)                          ;B59FC2
    %AICMD0x12_Jump($B59E10)                                   ;B59FC6
B59FC9:
    %AICMD0x10_End()                                           ;B59FC9


DATA8_B59FCA:
    %AICMD0x14_JumpIfFlagSet($800196, $01, $B5A1C8)            ;B59FCA
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, $B5A1C8)     ;B59FD1
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 6, 10, $B5A1C8)  ;B59FD8
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 16, 18, $B5A1C8) ;B59FE0
    %AICMD0x09($01, $B5A1C9)                                   ;B59FE8
    %AICMD0x09($02, $B5A1D7)                                   ;B59FEC
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 60, 89, $B5A00F);B59FF0
    %AICMD0x45_JumpIfBetween16(nSecondChildAge, 60, 89, $B5A00F);B59FFA
    %AICMD0x1A($0048, $0048, $B38AF8, $03)                     ;B5A004
    %AICMD0x12_Jump($B5A017)                                   ;B5A00C
B5A00F:
    %AICMD0x1A($0048, $0048, $B38480, $00)                     ;B5A00F
B5A017:
    %AICMD0x2D($B5A0EC, $B5A01F)                               ;B5A017
    %AICMD0x12_Jump($B5A017)                                   ;B5A01C
    %AICMD0x15_JumpIfEquals8($80091E, 2, $B5A061)              ;B5A01F
    %AICMD0x15_JumpIfEquals8($80091E, 7, $B5A061)              ;B5A026
    %AICMD0x16_JumpIfBetween8($80091E, 1, 5, $B5A06E)          ;B5A02D
    %AICMD0x16_JumpIfBetween8($80091E, 16, 23, $B5A06E)        ;B5A035
    %AICMD0x15_JumpIfEquals8($80091E, 6, $B5A082)              ;B5A03D
    %AICMD0x15_JumpIfEquals8($80091E, 25, $B5A096)             ;B5A044
    %AICMD0x15_JumpIfEquals8($80091E, 73, $B5A096)             ;B5A04B
    %AICMD0x16_JumpIfBetween8($80091E, 9, 12, $B5A0B8)         ;B5A052
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B5A05A
    %AICMD0x12_Jump($B5A017)                                   ;B5A05E
B5A061:
    %AICMD0x1C_ShowDialog($03B4, $00)                          ;B5A061
    %AICMD0x41_AddValue16(nLove_Eve, -8)                       ;B5A065
    %AICMD0x12_Jump($B5A017)                                   ;B5A06B
B5A06E:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $07, $B5A0C5)   ;B5A06E
    %AICMD0x1C_ShowDialog($03B2, $00)                          ;B5A075
    %AICMD0x41_AddValue16(nLove_Eve, 4)                        ;B5A079
    %AICMD0x12_Jump($B5A017)                                   ;B5A07F
B5A082:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $07, $B5A0C5)   ;B5A082
    %AICMD0x1C_ShowDialog($0212, $00)                          ;B5A089
    %AICMD0x41_AddValue16(nLove_Eve, 8)                        ;B5A08D
    %AICMD0x12_Jump($B5A017)                                   ;B5A093
B5A096:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $07, $B5A0C5)   ;B5A096
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $08, $B5A0D2)   ;B5A09D
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $09, $B5A0DF)   ;B5A0A4
    %AICMD0x41_AddValue16(nLove_Eve, 8)                        ;B5A0AB
    %AICMD0x1C_ShowDialog($0212, $00)                          ;B5A0B1
    %AICMD0x12_Jump($B5A017)                                   ;B5A0B5
B5A0B8:
    %AICMD0x1C_ShowDialog($03BA, $00)                          ;B5A0B8
    %AICMD0x41_AddValue16(nLove_Eve, -4)                       ;B5A0BC
    %AICMD0x12_Jump($B5A017)                                   ;B5A0C2
B5A0C5:
    %AICMD0x1C_ShowDialog($01BD, $00)                          ;B5A0C5
    %AICMD0x41_AddValue16(nPlayerHappiness, 30)                ;B5A0C9
    %AICMD0x12_Jump($B5A017)                                   ;B5A0CF
B5A0D2:
    %AICMD0x1C_ShowDialog($041D, $00)                          ;B5A0D2
    %AICMD0x41_AddValue16(nPlayerHappiness, 30)                ;B5A0D6
    %AICMD0x12_Jump($B5A017)                                   ;B5A0DC
B5A0DF:
    %AICMD0x1C_ShowDialog($041E, $00)                          ;B5A0DF
    %AICMD0x41_AddValue16(nPlayerHappiness, 30)                ;B5A0E3
    %AICMD0x12_Jump($B5A017)                                   ;B5A0E9
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $04, $B5A13F)   ;B5A0EC
    %AICMD0x15_JumpIfEquals8($80098C, 3, $B5A146)              ;B5A0F3
    %AICMD0x14_JumpIfFlagSet($800196, $04, $B5A14D)            ;B5A0FA
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $05, $B5A13F)   ;B5A101
    %AICMD0x45_JumpIfBetween16(nLove_Eve, 200, 220, $B5A154)   ;B5A108
    %AICMD0x45_JumpIfBetween16(nLove_Eve, 221, 250, $B5A15B)   ;B5A112
    %AICMD0x15_JumpIfEquals8(nCurrentWeekdayID, 0, $B5A162)    ;B5A11C
    %AICMD0x15_JumpIfEquals8(nCurrentWeekdayID, 6, $B5A169)    ;B5A123
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 0, $B5A170)     ;B5A12A
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 1, $B5A192)     ;B5A131
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 2, $B5A1A6)     ;B5A138
B5A13F:
    %AICMD0x1C_ShowDialog($0166, $00)                          ;B5A13F
    %AICMD0x12_Jump($B5A017)                                   ;B5A143
B5A146:
    %AICMD0x1C_ShowDialog($015F, $00)                          ;B5A146
    %AICMD0x12_Jump($B5A017)                                   ;B5A14A
B5A14D:
    %AICMD0x1C_ShowDialog($0160, $00)                          ;B5A14D
    %AICMD0x12_Jump($B5A017)                                   ;B5A151
B5A154:
    %AICMD0x1C_ShowDialog($01F4, $00)                          ;B5A154
    %AICMD0x12_Jump($B5A017)                                   ;B5A158
B5A15B:
    %AICMD0x1C_ShowDialog($0049, $00)                          ;B5A15B
    %AICMD0x12_Jump($B5A017)                                   ;B5A15F
B5A162:
    %AICMD0x1C_ShowDialog($0194, $00)                          ;B5A162
    %AICMD0x12_Jump($B5A017)                                   ;B5A166
B5A169:
    %AICMD0x1C_ShowDialog($047D, $00)                          ;B5A169
    %AICMD0x12_Jump($B5A017)                                   ;B5A16D
B5A170:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 22, $B5A18B)         ;B5A170
    %AICMD0x17($02)                                            ;B5A177
    %AICMD0x18($00, $B5A184)                                   ;B5A179
    %AICMD0x1C_ShowDialog($042A, $00)                          ;B5A17D
    %AICMD0x12_Jump($B5A017)                                   ;B5A181
    %AICMD0x1C_ShowDialog($0188, $00)                          ;B5A184
    %AICMD0x12_Jump($B5A017)                                   ;B5A188
B5A18B:
    %AICMD0x1C_ShowDialog($020A, $00)                          ;B5A18B
    %AICMD0x12_Jump($B5A017)                                   ;B5A18F
B5A192:
    %AICMD0x17($02)                                            ;B5A192
    %AICMD0x18($00, $B5A19F)                                   ;B5A194
    %AICMD0x1C_ShowDialog($042B, $00)                          ;B5A198
    %AICMD0x12_Jump($B5A017)                                   ;B5A19C
    %AICMD0x1C_ShowDialog($0193, $00)                          ;B5A19F
    %AICMD0x12_Jump($B5A017)                                   ;B5A1A3
B5A1A6:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 11, $B5A1C1)         ;B5A1A6
    %AICMD0x17($02)                                            ;B5A1AD
    %AICMD0x18($00, $B5A1BA)                                   ;B5A1AF
    %AICMD0x1C_ShowDialog($042C, $00)                          ;B5A1B3
    %AICMD0x12_Jump($B5A017)                                   ;B5A1B7
    %AICMD0x1C_ShowDialog($0192, $00)                          ;B5A1BA
    %AICMD0x12_Jump($B5A017)                                   ;B5A1BE
B5A1C1:
    %AICMD0x1C_ShowDialog($020A, $00)                          ;B5A1C1
    %AICMD0x12_Jump($B5A017)                                   ;B5A1C5
B5A1C8:
    %AICMD0x10_End()                                           ;B5A1C8
B5A1C9:
    %AICMD0x1A($0058, $0048, $B38BA0, $00)                     ;B5A1C9
    %AICMD0x13_Wait(1)                                         ;B5A1D1
    %AICMD0x12_Jump($B5A1D1)                                   ;B5A1D4
B5A1D7:
    %AICMD0x1A($0038, $0058, $B38BA0, $00)                     ;B5A1D7
    %AICMD0x13_Wait(1)                                         ;B5A1DF
    %AICMD0x12_Jump($B5A1DF)                                   ;B5A1E2


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
 
    %AICMD0x14_JumpIfFlagSet($800196, $01, $B5A21B)            ;B5A205
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, $B5A21B)     ;B5A20C
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 11, 14, $B5A406) ;B5A213
B5A21B:
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 0, 89, $B5A2F1) ;B5A21B
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 15, 18, $B5A2B4) ;B5A225
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 120, 999, $B5A2BF);B5A22D
    %AICMD0x1A($0158, $0098, $B384A4, $00)                     ;B5A237
    %AICMD0x22($10, $10, $01, $B384A4, $04)                    ;B5A23F
    %AICMD0x2D($B5A299, $B5A254)                               ;B5A246
    %AICMD0x12_Jump($B5A246)                                   ;B5A24B
    %AICMD0x13_Wait(1)                                         ;B5A24E
    %AICMD0x12_Jump($B5A24E)                                   ;B5A251
    %AICMD0x15_JumpIfEquals8($80091E, 6, $B5A26A)              ;B5A254
    %AICMD0x16_JumpIfBetween8($80091E, 9, 12, $B5A292)         ;B5A25B
    %AICMD0x1C_ShowDialog($01C2, $00)                          ;B5A263
    %AICMD0x12_Jump($B5A246)                                   ;B5A267
B5A26A:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $08, $B5A278)   ;B5A26A
    %AICMD0x1C_ShowDialog($01C2, $00)                          ;B5A271
    %AICMD0x12_Jump($B5A246)                                   ;B5A275
B5A278:
    %AICMD0x1C_ShowDialog($041D, $00)                          ;B5A278
    %AICMD0x41_AddValue16(nPlayerHappiness, 10)                ;B5A27C
    %AICMD0x12_Jump($B5A246)                                   ;B5A282
    %AICMD0x1C_ShowDialog($041E, $00)                          ;B5A285
    %AICMD0x41_AddValue16(nPlayerHappiness, 10)                ;B5A289
    %AICMD0x12_Jump($B5A246)                                   ;B5A28F
B5A292:
    %AICMD0x1C_ShowDialog($01D9, $00)                          ;B5A292
    %AICMD0x12_Jump($B5A246)                                   ;B5A296
    %AICMD0x17($02)                                            ;B5A299
    %AICMD0x18($00, $B5A2A6)                                   ;B5A29B
    %AICMD0x18($01, $B5A2AD)                                   ;B5A29F
    %AICMD0x12_Jump($B5A246)                                   ;B5A2A3
    %AICMD0x1C_ShowDialog($01C0, $00)                          ;B5A2A6
    %AICMD0x12_Jump($B5A246)                                   ;B5A2AA
    %AICMD0x1C_ShowDialog($01C2, $00)                          ;B5A2AD
    %AICMD0x12_Jump($B5A246)                                   ;B5A2B1
B5A2B4:
    %AICMD0x1A($0178, $0058, $B38648, $00)                     ;B5A2B4
    %AICMD0x12_Jump($B5A24E)                                   ;B5A2BC
B5A2BF:
    %AICMD0x1A($0158, $0098, $B384BC, $00)                     ;B5A2BF
    %AICMD0x22($10, $10, $01, $B384BC, $04)                    ;B5A2C7
    %AICMD0x2D($B5A2D6, $B5A254)                               ;B5A2CE
    %AICMD0x12_Jump($B5A2CE)                                   ;B5A2D3
    %AICMD0x17($02)                                            ;B5A2D6
    %AICMD0x18($00, $B5A2E3)                                   ;B5A2D8
    %AICMD0x18($01, $B5A2EA)                                   ;B5A2DC
    %AICMD0x12_Jump($B5A2CE)                                   ;B5A2E0
    %AICMD0x1C_ShowDialog($01C1, $00)                          ;B5A2E3
    %AICMD0x12_Jump($B5A2CE)                                   ;B5A2E7
    %AICMD0x1C_ShowDialog($01C2, $00)                          ;B5A2EA
    %AICMD0x12_Jump($B5A2CE)                                   ;B5A2EE
B5A2F1:
    %AICMD0x1A($0186, $0098, $B38654, $00)                     ;B5A2F1
    %AICMD0x52()                                               ;B5A2F9
    %AICMD0x12_Jump($B5A2F9)                                   ;B5A2FA


DATA8_B5A2FD:
 
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 0, 89, $B5A406) ;B5A2FD
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $00, $B5A32D)   ;B5A307
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $01, $B5A330)   ;B5A30E
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, $B5A333)   ;B5A315
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $03, $B5A336)   ;B5A31C
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $04, $B5A339)   ;B5A323
    %AICMD0x12_Jump($B5A33C)                                   ;B5A32A
B5A32D:
    %AICMD0x12_Jump($B5A33D)                                   ;B5A32D
B5A330:
    %AICMD0x12_Jump($B5A33C)                                   ;B5A330
B5A333:
    %AICMD0x12_Jump($B5A380)                                   ;B5A333
B5A336:
    %AICMD0x12_Jump($B5A3C3)                                   ;B5A336
B5A339:
    %AICMD0x12_Jump($B5A33C)                                   ;B5A339
B5A33C:
    %AICMD0x10_End()                                           ;B5A33C
B5A33D:
    %AICMD0x14_JumpIfFlagSet($800196, $01, $B5A406)            ;B5A33D
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 6, 10, $B5A406)  ;B5A344
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 15, 18, $B5A406) ;B5A34C
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, $B5A406)     ;B5A354
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 120, 999, $B5A370);B5A35B
    %AICMD0x1A($0160, $0178, $B384A4, $00)                     ;B5A365
    %AICMD0x12_Jump($B5A378)                                   ;B5A36D
B5A370:
    %AICMD0x1A($0160, $0178, $B384BC, $00)                     ;B5A370
B5A378:
    %AICMD0x2D($B5A299, $B5A254)                               ;B5A378
    %AICMD0x12_Jump($B5A378)                                   ;B5A37D
B5A380:
    %AICMD0x14_JumpIfFlagSet($800196, $01, $B5A406)            ;B5A380
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 6, 10, $B5A406)  ;B5A387
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 15, 18, $B5A406) ;B5A38F
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, $B5A406)     ;B5A397
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 120, 999, $B5A3B3);B5A39E
    %AICMD0x1A($0160, $0178, $B384A4, $00)                     ;B5A3A8
    %AICMD0x12_Jump($B5A3BB)                                   ;B5A3B0
B5A3B3:
    %AICMD0x1A($0160, $0178, $B384BC, $00)                     ;B5A3B3
B5A3BB:
    %AICMD0x2D($B5A299, $B5A254)                               ;B5A3BB
    %AICMD0x12_Jump($B5A3BB)                                   ;B5A3C0
B5A3C3:
    %AICMD0x14_JumpIfFlagSet($800196, $01, $B5A406)            ;B5A3C3
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 6, 10, $B5A406)  ;B5A3CA
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 15, 18, $B5A406) ;B5A3D2
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, $B5A406)     ;B5A3DA
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 120, 999, $B5A3F6);B5A3E1
    %AICMD0x1A($0160, $0178, $B384A4, $00)                     ;B5A3EB
    %AICMD0x12_Jump($B5A3FE)                                   ;B5A3F3
B5A3F6:
    %AICMD0x1A($0160, $0178, $B384BC, $00)                     ;B5A3F6
B5A3FE:
    %AICMD0x2D($B5A299, $B5A254)                               ;B5A3FE
    %AICMD0x12_Jump($B5A3FE)                                   ;B5A403
B5A406:
    %AICMD0x10_End()                                           ;B5A406


DATA8_B5A407:
 
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 0, 89, $B5A440) ;B5A407
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $00, $B5A437)   ;B5A411
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $01, $B5A438)   ;B5A418
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, $B5A43B)   ;B5A41F
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $03, $B5A43C)   ;B5A426
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $04, $B5A43D)   ;B5A42D
    %AICMD0x12_Jump($B5A440)                                   ;B5A434
B5A437:
    %AICMD0x10_End()                                           ;B5A437
B5A438:
    %AICMD0x12_Jump($B5A441)                                   ;B5A438
B5A43B:
    %AICMD0x10_End()                                           ;B5A43B
B5A43C:
    %AICMD0x10_End()                                           ;B5A43C
B5A43D:
    %AICMD0x12_Jump($B5A441)                                   ;B5A43D
B5A440:
    %AICMD0x10_End()                                           ;B5A440
B5A441:
    %AICMD0x14_JumpIfFlagSet($800196, $01, $B5A406)            ;B5A441
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 6, 10, $B5A406)  ;B5A448
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 15, 18, $B5A406) ;B5A450
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, $B5A406)     ;B5A458
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 120, 999, $B5A474);B5A45F
    %AICMD0x1A($0088, $0048, $B384A4, $00)                     ;B5A469
    %AICMD0x12_Jump($B5A47C)                                   ;B5A471
B5A474:
    %AICMD0x1A($0088, $0048, $B384BC, $00)                     ;B5A474
B5A47C:
    %AICMD0x2D($B5A299, $B5A254)                               ;B5A47C
    %AICMD0x12_Jump($B5A47C)                                   ;B5A481


DATA8_B5A484:
 
    %AICMD0x14_JumpIfFlagSet($800196, $01, $B5A49A)            ;B5A484
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, $B5A49A)     ;B5A48B
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 11, 14, $B5A685) ;B5A492
B5A49A:
    %AICMD0x45_JumpIfBetween16(nSecondChildAge, 0, 89, $B5A570);B5A49A
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 15, 18, $B5A533) ;B5A4A4
    %AICMD0x45_JumpIfBetween16(nSecondChildAge, 120, 999, $B5A53E);B5A4AC
    %AICMD0x1A($0168, $0088, $B38498, $02)                     ;B5A4B6
    %AICMD0x22($10, $10, $01, $B384A4, $04)                    ;B5A4BE
    %AICMD0x2D($B5A518, $B5A4D3)                               ;B5A4C5
    %AICMD0x12_Jump($B5A4C5)                                   ;B5A4CA
    %AICMD0x13_Wait(1)                                         ;B5A4CD
    %AICMD0x12_Jump($B5A4CD)                                   ;B5A4D0
    %AICMD0x15_JumpIfEquals8($80091E, 6, $B5A4E9)              ;B5A4D3
    %AICMD0x16_JumpIfBetween8($80091E, 9, 12, $B5A511)         ;B5A4DA
    %AICMD0x1C_ShowDialog($01C2, $00)                          ;B5A4E2
    %AICMD0x12_Jump($B5A4C5)                                   ;B5A4E6
B5A4E9:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $08, $B5A4F7)   ;B5A4E9
    %AICMD0x1C_ShowDialog($01C2, $00)                          ;B5A4F0
    %AICMD0x12_Jump($B5A4C5)                                   ;B5A4F4
B5A4F7:
    %AICMD0x1C_ShowDialog($041D, $00)                          ;B5A4F7
    %AICMD0x41_AddValue16(nPlayerHappiness, 10)                ;B5A4FB
    %AICMD0x12_Jump($B5A4C5)                                   ;B5A501
    %AICMD0x1C_ShowDialog($041E, $00)                          ;B5A504
    %AICMD0x41_AddValue16(nPlayerHappiness, 10)                ;B5A508
    %AICMD0x12_Jump($B5A4C5)                                   ;B5A50E
B5A511:
    %AICMD0x1C_ShowDialog($01D9, $00)                          ;B5A511
    %AICMD0x12_Jump($B5A4C5)                                   ;B5A515
    %AICMD0x17($02)                                            ;B5A518
    %AICMD0x18($00, $B5A525)                                   ;B5A51A
    %AICMD0x18($01, $B5A52C)                                   ;B5A51E
    %AICMD0x12_Jump($B5A4C5)                                   ;B5A522
    %AICMD0x1C_ShowDialog($01C0, $00)                          ;B5A525
    %AICMD0x12_Jump($B5A4C5)                                   ;B5A529
    %AICMD0x1C_ShowDialog($01C2, $00)                          ;B5A52C
    %AICMD0x12_Jump($B5A4C5)                                   ;B5A530
B5A533:
    %AICMD0x1A($0188, $0058, $B38648, $00)                     ;B5A533
    %AICMD0x12_Jump($B5A4CD)                                   ;B5A53B
B5A53E:
    %AICMD0x1A($0168, $0088, $B384B0, $00)                     ;B5A53E
    %AICMD0x22($10, $0C, $01, $B384BC, $04)                    ;B5A546
    %AICMD0x2D($B5A555, $B5A4D3)                               ;B5A54D
    %AICMD0x12_Jump($B5A54D)                                   ;B5A552
    %AICMD0x17($02)                                            ;B5A555
    %AICMD0x18($00, $B5A562)                                   ;B5A557
    %AICMD0x18($01, $B5A569)                                   ;B5A55B
    %AICMD0x12_Jump($B5A54D)                                   ;B5A55F
    %AICMD0x1C_ShowDialog($01C1, $00)                          ;B5A562
    %AICMD0x12_Jump($B5A54D)                                   ;B5A566
    %AICMD0x1C_ShowDialog($01C2, $00)                          ;B5A569
    %AICMD0x12_Jump($B5A54D)                                   ;B5A56D
B5A570:
    %AICMD0x1A($0186, $0098, $B38654, $00)                     ;B5A570
    %AICMD0x53()                                               ;B5A578
    %AICMD0x12_Jump($B5A578)                                   ;B5A579


DATA8_B5A57C:
 
    %AICMD0x45_JumpIfBetween16(nSecondChildAge, 0, 89, $B5A685);B5A57C
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $00, $B5A5AC)   ;B5A586
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $01, $B5A5AF)   ;B5A58D
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, $B5A5B2)   ;B5A594
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $03, $B5A5B5)   ;B5A59B
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $04, $B5A5B8)   ;B5A5A2
    %AICMD0x12_Jump($B5A5BB)                                   ;B5A5A9
B5A5AC:
    %AICMD0x12_Jump($B5A5BC)                                   ;B5A5AC
B5A5AF:
    %AICMD0x12_Jump($B5A5BB)                                   ;B5A5AF
B5A5B2:
    %AICMD0x12_Jump($B5A5FF)                                   ;B5A5B2
B5A5B5:
    %AICMD0x12_Jump($B5A642)                                   ;B5A5B5
B5A5B8:
    %AICMD0x12_Jump($B5A5BB)                                   ;B5A5B8
B5A5BB:
    %AICMD0x10_End()                                           ;B5A5BB
B5A5BC:
    %AICMD0x14_JumpIfFlagSet($800196, $01, $B5A685)            ;B5A5BC
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 6, 10, $B5A685)  ;B5A5C3
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 15, 18, $B5A685) ;B5A5CB
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, $B5A685)     ;B5A5D3
    %AICMD0x45_JumpIfBetween16(nSecondChildAge, 120, 999, $B5A5EF);B5A5DA
    %AICMD0x1A($0170, $0178, $B384A4, $00)                     ;B5A5E4
    %AICMD0x12_Jump($B5A5F7)                                   ;B5A5EC
B5A5EF:
    %AICMD0x1A($0170, $0178, $B384BC, $00)                     ;B5A5EF
B5A5F7:
    %AICMD0x2D($B5A518, $B5A4D3)                               ;B5A5F7
    %AICMD0x12_Jump($B5A5F7)                                   ;B5A5FC
B5A5FF:
    %AICMD0x14_JumpIfFlagSet($800196, $01, $B5A685)            ;B5A5FF
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 6, 10, $B5A685)  ;B5A606
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 15, 18, $B5A685) ;B5A60E
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, $B5A685)     ;B5A616
    %AICMD0x45_JumpIfBetween16(nSecondChildAge, 120, 999, $B5A632);B5A61D
    %AICMD0x1A($0170, $0178, $B384A4, $00)                     ;B5A627
    %AICMD0x12_Jump($B5A63A)                                   ;B5A62F
B5A632:
    %AICMD0x1A($0170, $0178, $B384BC, $00)                     ;B5A632
B5A63A:
    %AICMD0x2D($B5A518, $B5A4D3)                               ;B5A63A
    %AICMD0x12_Jump($B5A63A)                                   ;B5A63F
B5A642:
    %AICMD0x14_JumpIfFlagSet($800196, $01, $B5A685)            ;B5A642
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 6, 10, $B5A685)  ;B5A649
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 15, 18, $B5A685) ;B5A651
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, $B5A685)     ;B5A659
    %AICMD0x45_JumpIfBetween16(nSecondChildAge, 120, 999, $B5A675);B5A660
    %AICMD0x1A($0170, $0178, $B384A4, $00)                     ;B5A66A
    %AICMD0x12_Jump($B5A67D)                                   ;B5A672
B5A675:
    %AICMD0x1A($0170, $0178, $B384BC, $00)                     ;B5A675
B5A67D:
    %AICMD0x2D($B5A518, $B5A4D3)                               ;B5A67D
    %AICMD0x12_Jump($B5A67D)                                   ;B5A682
B5A685:
    %AICMD0x10_End()                                           ;B5A685


DATA8_B5A686:
    %AICMD0x45_JumpIfBetween16(nSecondChildAge, 0, 89, $B5A6BF);B5A686
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $00, $B5A6B6)   ;B5A690
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $01, $B5A6B7)   ;B5A697
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, $B5A6BA)   ;B5A69E
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $03, $B5A6BB)   ;B5A6A5
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $04, $B5A6BC)   ;B5A6AC
    %AICMD0x12_Jump($B5A6BF)                                   ;B5A6B3
B5A6B6:
    %AICMD0x10_End()                                           ;B5A6B6
B5A6B7:
    %AICMD0x12_Jump($B5A6C0)                                   ;B5A6B7
B5A6BA:
    %AICMD0x10_End()                                           ;B5A6BA
B5A6BB:
    %AICMD0x10_End()                                           ;B5A6BB
B5A6BC:
    %AICMD0x12_Jump($B5A6C0)                                   ;B5A6BC
B5A6BF:
    %AICMD0x10_End()                                           ;B5A6BF
B5A6C0:
    %AICMD0x14_JumpIfFlagSet($800196, $01, $B5A685)            ;B5A6C0
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 6, 10, $B5A685)  ;B5A6C7
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 15, 18, $B5A685) ;B5A6CF
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, $B5A685)     ;B5A6D7
    %AICMD0x45_JumpIfBetween16(nSecondChildAge, 120, 999, $B5A6F3);B5A6DE
    %AICMD0x1A($0068, $0048, $B384A4, $00)                     ;B5A6E8
    %AICMD0x12_Jump($B5A6FB)                                   ;B5A6F0
B5A6F3:
    %AICMD0x1A($0068, $0048, $B384BC, $00)                     ;B5A6F3
B5A6FB:
    %AICMD0x2D($B5A518, $B5A4D3)                               ;B5A6FB
    %AICMD0x12_Jump($B5A6FB)                                   ;B5A700


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
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $07, $B5A8F9)   ;B5A8DD
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $06, $B5A8F2)   ;B5A8E4
    %AICMD0x54_ShowDialog($0451, $01)                          ;B5A8EB
    %AICMD0x12_Jump($B5A8FD)                                   ;B5A8EF
B5A8F2:
    %AICMD0x54_ShowDialog($0452, $01)                          ;B5A8F2
    %AICMD0x12_Jump($B5A8FD)                                   ;B5A8F6
B5A8F9:
    %AICMD0x54_ShowDialog($0453, $01)                          ;B5A8F9
B5A8FD:
    %AICMD0x13_Wait(120)                                       ;B5A8FD
    %AICMD0x54_ShowDialog($048C, $01)                          ;B5A900
    %AICMD0x13_Wait(120)                                       ;B5A904
    %AICMD0x54_ShowDialog($0454, $01)                          ;B5A907
    %AICMD0x13_Wait(120)                                       ;B5A90B
    %AICMD0x45_JumpIfBetween16(nRanchMasteringRate, 0, 199, $B5A940);B5A90E
    %AICMD0x45_JumpIfBetween16(nRanchMasteringRate, 200, 399, $B5A947);B5A918
    %AICMD0x45_JumpIfBetween16(nRanchMasteringRate, 400, 599, $B5A94E);B5A922
    %AICMD0x45_JumpIfBetween16(nRanchMasteringRate, 600, 799, $B5A955);B5A92C
    %AICMD0x45_JumpIfBetween16(nRanchMasteringRate, 800, 999, $B5A95C);B5A936
B5A940:
    %AICMD0x54_ShowDialog($0483, $01)                          ;B5A940
    %AICMD0x12_Jump($B5A963)                                   ;B5A944
B5A947:
    %AICMD0x54_ShowDialog($0488, $01)                          ;B5A947
    %AICMD0x12_Jump($B5A963)                                   ;B5A94B
B5A94E:
    %AICMD0x54_ShowDialog($0489, $01)                          ;B5A94E
    %AICMD0x12_Jump($B5A963)                                   ;B5A952
B5A955:
    %AICMD0x54_ShowDialog($048A, $01)                          ;B5A955
    %AICMD0x12_Jump($B5A963)                                   ;B5A959
B5A95C:
    %AICMD0x54_ShowDialog($048B, $01)                          ;B5A95C
    %AICMD0x12_Jump($B5A963)                                   ;B5A960
B5A963:
    %AICMD0x19($00E8, $00)                                     ;B5A963
    %AICMD0x09($01, $B5A9E9)                                   ;B5A967
    %AICMD0x12_Jump($B5A96E)                                   ;B5A96B
B5A96E:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $00, $B5A99E)   ;B5A96E
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $01, $B5A9A5)   ;B5A975
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, $B5A9AC)   ;B5A97C
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $03, $B5A9B3)   ;B5A983
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $04, $B5A9BA)   ;B5A98A
    %AICMD0x45_JumpIfBetween16(nPlayerHappiness, 0, 299, $B5A9C1);B5A991
    %AICMD0x12_Jump($B5A9C8)                                   ;B5A99B
B5A99E:
    %AICMD0x09($02, $B5AA14)                                   ;B5A99E
    %AICMD0x12_Jump($B5A9CF)                                   ;B5A9A2
B5A9A5:
    %AICMD0x09($02, $B5AA4C)                                   ;B5A9A5
    %AICMD0x12_Jump($B5A9CF)                                   ;B5A9A9
B5A9AC:
    %AICMD0x09($02, $B5AA84)                                   ;B5A9AC
    %AICMD0x12_Jump($B5A9CF)                                   ;B5A9B0
B5A9B3:
    %AICMD0x09($02, $B5AABC)                                   ;B5A9B3
    %AICMD0x12_Jump($B5A9CF)                                   ;B5A9B7
B5A9BA:
    %AICMD0x09($02, $B5AAF4)                                   ;B5A9BA
    %AICMD0x12_Jump($B5A9CF)                                   ;B5A9BE
B5A9C1:
    %AICMD0x09($03, $B5ABA9)                                   ;B5A9C1
    %AICMD0x12_Jump($B5A9CF)                                   ;B5A9C5
B5A9C8:
    %AICMD0x09($04, $B5AB5C)                                   ;B5A9C8
    %AICMD0x12_Jump($B5A9CF)                                   ;B5A9CC
B5A9CF:
    %AICMD0x29_SetMapScrooling(0, 1, 208)                      ;B5A9CF
    %AICMD0x13_Wait(240)                                       ;B5A9D5
    %AICMD0x0B($03)                                            ;B5A9D8
    %AICMD0x0C($02)                                            ;B5A9DA
    %AICMD0x13_Wait(60)                                        ;B5A9DC
    %AICMD0x29_SetMapScrooling(0, -1, 128)                     ;B5A9DF
    %AICMD0x13_Wait(240)                                       ;B5A9E5
    %AICMD0x10_End()                                           ;B5A9E8
B5A9E9:
    %AICMD0x1A($0078, $0118, $B380D8, $01)                     ;B5A9E9
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
B5AA14:
    %AICMD0x1A($0088, $0188, $B3845C, $01)                     ;B5AA14
    %AICMD0x0C($03)                                            ;B5AA1C
    %AICMD0x1B($02E5, $00)                                     ;B5AA1E
    %AICMD0x0D($00, $FF, $70, $01)                             ;B5AA22
    %AICMD0x1B($02E6, $00)                                     ;B5AA27
    %AICMD0x0B($00)                                            ;B5AA2B
    %AICMD0x14_JumpIfFlagSet(strcFlags.event6, $02, $B5AB2C)   ;B5AA2D
    %AICMD0x14_JumpIfFlagSet(strcFlags.event6, $03, $B5AB2C)   ;B5AA34
    %AICMD0x45_JumpIfBetween16(nLove_Maria, 0, 250, $B5AB33)   ;B5AA3B
    %AICMD0x54_ShowDialog($0468, $01)                          ;B5AA45
    %AICMD0x12_Jump($B5AB3A)                                   ;B5AA49
B5AA4C:
    %AICMD0x1A($0088, $0188, $B3845C, $01)                     ;B5AA4C
    %AICMD0x0C($03)                                            ;B5AA54
    %AICMD0x1B($02E5, $00)                                     ;B5AA56
    %AICMD0x0D($00, $FF, $70, $01)                             ;B5AA5A
    %AICMD0x1B($02E6, $00)                                     ;B5AA5F
    %AICMD0x0B($00)                                            ;B5AA63
    %AICMD0x14_JumpIfFlagSet(strcFlags.event6, $02, $B5AB2C)   ;B5AA65
    %AICMD0x14_JumpIfFlagSet(strcFlags.event6, $03, $B5AB2C)   ;B5AA6C
    %AICMD0x45_JumpIfBetween16(nLove_Ann, 0, 250, $B5AB33)     ;B5AA73
    %AICMD0x54_ShowDialog($0468, $01)                          ;B5AA7D
    %AICMD0x12_Jump($B5AB3A)                                   ;B5AA81
B5AA84:
    %AICMD0x1A($0088, $0188, $B3845C, $01)                     ;B5AA84
    %AICMD0x0C($03)                                            ;B5AA8C
    %AICMD0x1B($02E5, $00)                                     ;B5AA8E
    %AICMD0x0D($00, $FF, $70, $01)                             ;B5AA92
    %AICMD0x1B($02E6, $00)                                     ;B5AA97
    %AICMD0x0B($00)                                            ;B5AA9B
    %AICMD0x14_JumpIfFlagSet(strcFlags.event6, $02, $B5AB2C)   ;B5AA9D
    %AICMD0x14_JumpIfFlagSet(strcFlags.event6, $03, $B5AB2C)   ;B5AAA4
    %AICMD0x45_JumpIfBetween16(nLove_Nina, 0, 250, $B5AB33)    ;B5AAAB
    %AICMD0x54_ShowDialog($0468, $01)                          ;B5AAB5
    %AICMD0x12_Jump($B5AB3A)                                   ;B5AAB9
B5AABC:
    %AICMD0x1A($0088, $0188, $B3845C, $01)                     ;B5AABC
    %AICMD0x0C($03)                                            ;B5AAC4
    %AICMD0x1B($02E5, $00)                                     ;B5AAC6
    %AICMD0x0D($00, $FF, $70, $01)                             ;B5AACA
    %AICMD0x1B($02E6, $00)                                     ;B5AACF
    %AICMD0x0B($00)                                            ;B5AAD3
    %AICMD0x14_JumpIfFlagSet(strcFlags.event6, $02, $B5AB2C)   ;B5AAD5
    %AICMD0x14_JumpIfFlagSet(strcFlags.event6, $03, $B5AB2C)   ;B5AADC
    %AICMD0x45_JumpIfBetween16(nLove_Ellen, 0, 250, $B5AB33)   ;B5AAE3
    %AICMD0x54_ShowDialog($0468, $01)                          ;B5AAED
    %AICMD0x12_Jump($B5AB3A)                                   ;B5AAF1
B5AAF4:
    %AICMD0x1A($0088, $0188, $B3845C, $01)                     ;B5AAF4
    %AICMD0x0C($03)                                            ;B5AAFC
    %AICMD0x1B($02E5, $00)                                     ;B5AAFE
    %AICMD0x0D($00, $FF, $70, $01)                             ;B5AB02
    %AICMD0x1B($02E6, $00)                                     ;B5AB07
    %AICMD0x0B($00)                                            ;B5AB0B
    %AICMD0x14_JumpIfFlagSet(strcFlags.event6, $02, $B5AB2C)   ;B5AB0D
    %AICMD0x14_JumpIfFlagSet(strcFlags.event6, $03, $B5AB2C)   ;B5AB14
    %AICMD0x45_JumpIfBetween16(nLove_Eve, 0, 250, $B5AB33)     ;B5AB1B
    %AICMD0x54_ShowDialog($0468, $01)                          ;B5AB25
    %AICMD0x12_Jump($B5AB3A)                                   ;B5AB29
B5AB2C:
    %AICMD0x54_ShowDialog($0467, $01)                          ;B5AB2C
    %AICMD0x12_Jump($B5AB3A)                                   ;B5AB30
B5AB33:
    %AICMD0x54_ShowDialog($0469, $01)                          ;B5AB33
    %AICMD0x12_Jump($B5AB3A)                                   ;B5AB37
B5AB3A:
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
B5AB5C:
    %AICMD0x1A($0088, $0188, $B38960, $03)                     ;B5AB5C
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
B5ABA9:
    %AICMD0x1A($0088, $0118, $B38438, $03)                     ;B5ABA9
    %AICMD0x0C($03)                                            ;B5ABB1
    %AICMD0x1B($02DD, $00)                                     ;B5ABB3
    %AICMD0x13_Wait(60)                                        ;B5ABB7
    %AICMD0x0B($00)                                            ;B5ABBA
    %AICMD0x46_JumpIfBetween24(nMoney, 1000, 9999, $B5ABCF)    ;B5ABBC
    %AICMD0x54_ShowDialog($047B, $01)                          ;B5ABC8
    %AICMD0x12_Jump($B5ABD6)                                   ;B5ABCC
B5ABCF:
    %AICMD0x54_ShowDialog($048E, $01)                          ;B5ABCF
    %AICMD0x12_Jump($B5ABD6)                                   ;B5ABD3
B5ABD6:
    %AICMD0x13_Wait(60)                                        ;B5ABD6
    %AICMD0x1B($02DA, $00)                                     ;B5ABD9
    %AICMD0x0D($00, $01, $80, $01)                             ;B5ABDD
    %AICMD0x0B($01)                                            ;B5ABE2
    %AICMD0x37()                                               ;B5ABE4
    %AICMD0x10_End()                                           ;B5ABE5
    %AICMD0x1A($0058, $0088, $B38B64, $00)                     ;B5ABE6
    %AICMD0x13_Wait(30)                                        ;B5ABEE
    %AICMD0x09($05, $B5ABFB)                                   ;B5ABF1
    %AICMD0x13_Wait(1)                                         ;B5ABF5
    %AICMD0x12_Jump($B5ABF5)                                   ;B5ABF8
B5ABFB:
    %AICMD0x1A($0068, $0088, $B38B70, $00)                     ;B5ABFB
    %AICMD0x13_Wait(30)                                        ;B5AC03
    %AICMD0x09($06, $B5AC10)                                   ;B5AC06
    %AICMD0x13_Wait(1)                                         ;B5AC0A
    %AICMD0x12_Jump($B5AC0A)                                   ;B5AC0D
B5AC10:
    %AICMD0x1A($0078, $0088, $B38B7C, $00)                     ;B5AC10
    %AICMD0x13_Wait(30)                                        ;B5AC18
    %AICMD0x09($07, $B5AC25)                                   ;B5AC1B
    %AICMD0x13_Wait(1)                                         ;B5AC1F
    %AICMD0x12_Jump($B5AC1F)                                   ;B5AC22
B5AC25:
    %AICMD0x1A($008A, $0088, $B38B88, $00)                     ;B5AC25
    %AICMD0x13_Wait(60)                                        ;B5AC2D
    %AICMD0x09($08, $B5AC3A)                                   ;B5AC30
    %AICMD0x13_Wait(1)                                         ;B5AC34
    %AICMD0x12_Jump($B5AC34)                                   ;B5AC37
B5AC3A:
    %AICMD0x1A($00E6, $0060, $B38B94, $00)                     ;B5AC3A
    %AICMD0x13_Wait(8)                                         ;B5AC42
    %AICMD0x0D($FE, $01, $10, $02)                             ;B5AC45
    %AICMD0x0D($FF, $01, $10, $01)                             ;B5AC4A
    %AICMD0x0D($FF, $02, $10, $02)                             ;B5AC4F
    %AICMD0x0D($FF, $FF, $08, $01)                             ;B5AC54
    %AICMD0x0D($FE, $FF, $08, $02)                             ;B5AC59
    %AICMD0x0D($FE, $01, $08, $02)                             ;B5AC5E
    %AICMD0x0D($FF, $01, $08, $01)                             ;B5AC63
    %AICMD0x13_Wait(1)                                         ;B5AC68
    %AICMD0x12_Jump($B5AC68)                                   ;B5AC6B


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
    %AICMD0x09($01, $B5B7DC)                                   ;B5B6B0
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
B5B7DC:
    %AICMD0x1A($0168, $01C8, $B3812C, $03)                     ;B5B7DC
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
    %AICMD0x13_Wait(1)                                         ;B5B82E
    %AICMD0x12_Jump($B5B82E)                                   ;B5B831


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
    %AICMD0x09($01, $B5C567)                                   ;B5C4D7
    %AICMD0x09($02, $B5C59D)                                   ;B5C4DB
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
B5C567:
    %AICMD0x1A($00A8, $0118, $B380FC, $00)                     ;B5C567
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
    %AICMD0x13_Wait(1)                                         ;B5C597
    %AICMD0x12_Jump($B5C597)                                   ;B5C59A
B5C59D:
    %AICMD0x1A($00A8, $00F8, $B380FC, $00)                     ;B5C59D
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
    %AICMD0x13_Wait(1)                                         ;B5C5CD
    %AICMD0x12_Jump($B5C5CD)                                   ;B5C5D0


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
    %AICMD0x09($01, $B5C713)                                   ;B5C691
    %AICMD0x09($02, $B5C769)                                   ;B5C695
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
B5C713:
    %AICMD0x1A($00A8, $0118, $B380FC, $00)                     ;B5C713
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
B5C769:
    %AICMD0x1A($00A8, $00F8, $B380FC, $00)                     ;B5C769
    %AICMD0x13_Wait(480)                                       ;B5C771
    %AICMD0x1B($019F, $00)                                     ;B5C774
    %AICMD0x13_Wait(240)                                       ;B5C778
    %AICMD0x1B($019E, $00)                                     ;B5C77B
    %AICMD0x13_Wait(120)                                       ;B5C77F
    %AICMD0x1B($019F, $00)                                     ;B5C782
    %AICMD0x13_Wait(240)                                       ;B5C786
    %AICMD0x1B($019E, $00)                                     ;B5C789
    %AICMD0x13_Wait(1)                                         ;B5C78D
    %AICMD0x12_Jump($B5C78D)                                   ;B5C790


DATA8_B5C793:
 
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $06)       ;B5C793
    %AICMD0x00_SetMusic($07, $B4)                              ;B5C798
    %AICMD0x02_FreezeTime()                                    ;B5C79B
    %AICMD0x03_SetHour($07)                                    ;B5C79C
    %AICMD0x05_SetTransferPosition(328, 360)                   ;B5C79E
    %AICMD0x08_EnableAIControl()                               ;B5C7A3
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B5C7A4
    %AICMD0x09($01, $B5C7C4)                                   ;B5C7A6
    %AICMD0x47_SetValue8(nCurrentSeasonID, 2)                  ;B5C7AA
    %AICMD0x06_SetDestinationArea(!AREA_FARMFALL)              ;B5C7AF
    %AICMD0x38()                                               ;B5C7B1
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 15)                  ;B5C7B2
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 63)                  ;B5C7B6
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 32)                    ;B5C7BA
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $07)       ;B5C7BE
    %AICMD0x10_End()                                           ;B5C7C3
B5C7C4:
    %AICMD0x1A($0148, $0178, $B38108, $00)                     ;B5C7C4
    %AICMD0x13_Wait(2)                                         ;B5C7CC
    %AICMD0x0D($00, $01, $20, $01)                             ;B5C7CF
    %AICMD0x1B($019E, $00)                                     ;B5C7D4
    %AICMD0x13_Wait(1)                                         ;B5C7D8
    %AICMD0x12_Jump($B5C7D8)                                   ;B5C7DB


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
    %AICMD0x09($01, $B5C885)                                   ;B5C7FB
    %AICMD0x09($02, $B5C89A)                                   ;B5C7FF
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
B5C885:
    %AICMD0x1A($00A8, $0078, $B38144, $00)                     ;B5C885
    %AICMD0x22($10, $10, $01, $B38144, $08)                    ;B5C88D
    %AICMD0x13_Wait(1)                                         ;B5C894
    %AICMD0x12_Jump($B5C894)                                   ;B5C897
B5C89A:
    %AICMD0x1A($00C8, $0068, $B38144, $00)                     ;B5C89A
    %AICMD0x22($10, $10, $01, $B38144, $08)                    ;B5C8A2
    %AICMD0x13_Wait(1)                                         ;B5C8A9
    %AICMD0x12_Jump($B5C8A9)                                   ;B5C8AC


DATA8_B5C8AF:
 
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $06)       ;B5C8AF
    %AICMD0x00_SetMusic($07, $B4)                              ;B5C8B4
    %AICMD0x02_FreezeTime()                                    ;B5C8B7
    %AICMD0x03_SetHour($07)                                    ;B5C8B8
    %AICMD0x05_SetTransferPosition(456, 360)                   ;B5C8BA
    %AICMD0x08_EnableAIControl()                               ;B5C8BF
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B5C8C0
    %AICMD0x09($01, $B5C8E0)                                   ;B5C8C2
    %AICMD0x47_SetValue8(nCurrentSeasonID, 2)                  ;B5C8C6
    %AICMD0x06_SetDestinationArea(!AREA_FARMFALL)              ;B5C8CB
    %AICMD0x38()                                               ;B5C8CD
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 7)                    ;B5C8CE
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 159)                  ;B5C8D2
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 40)                    ;B5C8D6
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $07)       ;B5C8DA
    %AICMD0x10_End()                                           ;B5C8DF
B5C8E0:
    %AICMD0x1A($0148, $0198, $B380FC, $00)                     ;B5C8E0
    %AICMD0x13_Wait(1)                                         ;B5C8E8
    %AICMD0x12_Jump($B5C8E8)                                   ;B5C8EB


DATA8_B5C8EE:
 
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $06)       ;B5C8EE
    %AICMD0x00_SetMusic($03, $B4)                              ;B5C8F3
    %AICMD0x02_FreezeTime()                                    ;B5C8F6
    %AICMD0x03_SetHour($07)                                    ;B5C8F7
    %AICMD0x05_SetTransferPosition(264, 312)                   ;B5C8F9
    %AICMD0x08_EnableAIControl()                               ;B5C8FE
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B5C8FF
    %AICMD0x09($01, $B5C958)                                   ;B5C901
    %AICMD0x09($03, $B5C966)                                   ;B5C905
    %AICMD0x09($06, $B5C974)                                   ;B5C909
    %AICMD0x09($07, $B5C982)                                   ;B5C90D
    %AICMD0x09($0B, $B5C990)                                   ;B5C911
    %AICMD0x09($0D, $B5C99E)                                   ;B5C915
    %AICMD0x09($0E, $B5C9AC)                                   ;B5C919
    %AICMD0x09($0F, $B5C9BA)                                   ;B5C91D
    %AICMD0x09($10, $B5C9C8)                                   ;B5C921
    %AICMD0x09($11, $B5C9D6)                                   ;B5C925
    %AICMD0x09($12, $B5C9E4)                                   ;B5C929
    %AICMD0x09($13, $B5C9F2)                                   ;B5C92D
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
B5C958:
    %AICMD0x1A($0198, $00C8, $B383FC, $00)                     ;B5C958
    %AICMD0x13_Wait(1)                                         ;B5C960
    %AICMD0x12_Jump($B5C960)                                   ;B5C963
B5C966:
    %AICMD0x1A($0078, $00F8, $B383D8, $02)                     ;B5C966
    %AICMD0x13_Wait(1)                                         ;B5C96E
    %AICMD0x12_Jump($B5C96E)                                   ;B5C971
B5C974:
    %AICMD0x1A($0168, $0108, $B38420, $01)                     ;B5C974
    %AICMD0x13_Wait(1)                                         ;B5C97C
    %AICMD0x12_Jump($B5C97C)                                   ;B5C97F
B5C982:
    %AICMD0x1A($0148, $0158, $B38384, $01)                     ;B5C982
    %AICMD0x13_Wait(1)                                         ;B5C98A
    %AICMD0x12_Jump($B5C98A)                                   ;B5C98D
B5C990:
    %AICMD0x1A($0058, $00E8, $B38300, $02)                     ;B5C990
    %AICMD0x13_Wait(1)                                         ;B5C998
    %AICMD0x12_Jump($B5C998)                                   ;B5C99B
B5C99E:
    %AICMD0x1A($00C8, $0158, $B38168, $02)                     ;B5C99E
    %AICMD0x13_Wait(1)                                         ;B5C9A6
    %AICMD0x12_Jump($B5C9A6)                                   ;B5C9A9
B5C9AC:
    %AICMD0x1A($0098, $0068, $B38198, $00)                     ;B5C9AC
    %AICMD0x13_Wait(1)                                         ;B5C9B4
    %AICMD0x12_Jump($B5C9B4)                                   ;B5C9B7
B5C9BA:
    %AICMD0x1A($0148, $00A8, $B381C8, $00)                     ;B5C9BA
    %AICMD0x13_Wait(1)                                         ;B5C9C2
    %AICMD0x12_Jump($B5C9C2)                                   ;B5C9C5
B5C9C8:
    %AICMD0x1A($0108, $0098, $B381E0, $00)                     ;B5C9C8
    %AICMD0x13_Wait(1)                                         ;B5C9D0
    %AICMD0x12_Jump($B5C9D0)                                   ;B5C9D3
B5C9D6:
    %AICMD0x1A($00B8, $0098, $B38204, $00)                     ;B5C9D6
    %AICMD0x13_Wait(1)                                         ;B5C9DE
    %AICMD0x12_Jump($B5C9DE)                                   ;B5C9E1
B5C9E4:
    %AICMD0x1A($0108, $00B8, $B38AB0, $00)                     ;B5C9E4
    %AICMD0x13_Wait(1)                                         ;B5C9EC
    %AICMD0x12_Jump($B5C9EC)                                   ;B5C9EF
B5C9F2:
    %AICMD0x1A($00B8, $0108, $B38348, $00)                     ;B5C9F2
    %AICMD0x13_Wait(1)                                         ;B5C9FA
    %AICMD0x12_Jump($B5C9FA)                                   ;B5C9FD


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
    %AICMD0x09($01, $B5CA76)                                   ;B5CA52
    %AICMD0x09($02, $B5CA94)                                   ;B5CA56
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
B5CA76:
    %AICMD0x1A($0178, $0378, $B38198, $00)                     ;B5CA76
    %AICMD0x13_Wait(110)                                       ;B5CA7E
    %AICMD0x1B($022A, $00)                                     ;B5CA81
    %AICMD0x54_ShowDialog($03B2, $00)                          ;B5CA85
    %AICMD0x47_SetValue8($80019A, 4)                           ;B5CA89
    %AICMD0x13_Wait(1)                                         ;B5CA8E
    %AICMD0x12_Jump($B5CA8E)                                   ;B5CA91
B5CA94:
    %AICMD0x1A($01A8, $0328, $B387C8, $00)                     ;B5CA94
    %AICMD0x13_Wait(1)                                         ;B5CA9C
    %AICMD0x12_Jump($B5CA9C)                                   ;B5CA9F


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
    %AICMD0x09($01, $B5CB4B)                                   ;B5CB26
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
B5CB4B:
    %AICMD0x1A($00D8, $0178, $B38114, $03)                     ;B5CB4B
    %AICMD0x13_Wait(160)                                       ;B5CB53
    %AICMD0x1B($01EC, $00)                                     ;B5CB56
    %AICMD0x0D($FF, $00, $44, $01)                             ;B5CB5A
    %AICMD0x1B($01E8, $00)                                     ;B5CB5F
    %AICMD0x13_Wait(1)                                         ;B5CB63
    %AICMD0x12_Jump($B5CB63)                                   ;B5CB66


DATA8_B5CB69:
 
    %AICMD0x10_End()                                           ;B5CB69


    pad $B5FFFF
