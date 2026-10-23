

pAIScripting0x01:
    dw DATA8_B39379                                            ;B39359|        |B39379;
    dw DATA8_B39D05                                            ;B3935B|        |B39D05;
    dw DATA8_B39F3E                                            ;B3935D|        |B39F3E;
    dw DATA8_B3A086                                            ;B3935F|        |B3A086;
    dw DATA8_B3A162                                            ;B39361|        |B3A162;
    dw DATA8_B3A438                                            ;B39363|        |B3A438;
    dw DATA8_B3A5B1                                            ;B39365|        |B3A5B1;
    dw DATA8_B3A727                                            ;B39367|        |B3A727;
    dw DATA8_B3A81B                                            ;B39369|        |B3A81B;
    dw DATA8_B3AD24                                            ;B3936B|        |B3AD24;
    dw DATA8_B3ADB1                                            ;B3936D|        |B3ADB1;
    dw pAIScripting0x02                                        ;B3936F|        |B3AE03;
    dw pAIScripting0x02                                        ;B39371|        |B3AE03;
    dw pAIScripting0x02                                        ;B39373|        |B3AE03;
    dw pAIScripting0x02                                        ;B39375|        |B3AE03;
    dw pAIScripting0x02                                        ;B39377|        |B3AE03;
 
DATA8_B39379:
 
    %AICMD0x11_EnableUserControl()                             ;B39379
    %AICMD0x09_StartScript($01, pAIScripting0x01_L007)                                   ;B3937A
    %AICMD0x09_StartScript($02, pAIScripting0x01_L024)                                   ;B3937E
    %AICMD0x09_StartScript($07, pAIScripting0x01_L172)                                   ;B39382
    %AICMD0x12_Jump(pAIScripting0x01_L002)                                   ;B39386
pAIScripting0x01_L001:
    %AICMD0x10_End()                                           ;B39389
pAIScripting0x01_L002:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $00, pAIScripting0x01_L003)   ;B3938A
    %AICMD0x14_JumpIfFlagSet(strcFlags.event4, $0C, pAIScripting0x01_L003)   ;B39391
    %AICMD0x09_StartScript($03, pAIScripting0x01_L040)                                   ;B39398
pAIScripting0x01_L003:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, pAIScripting0x01_L004)   ;B3939C
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $00, pAIScripting0x01_L004)   ;B393A3
    %AICMD0x09_StartScript($04, pAIScripting0x01_L075)                                   ;B393AA
pAIScripting0x01_L004:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $03, pAIScripting0x01_L005)   ;B393AE
    %AICMD0x09_StartScript($05, pAIScripting0x01_L113)                                   ;B393B5
pAIScripting0x01_L005:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $04, pAIScripting0x01_L006)   ;B393B9
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $04, pAIScripting0x01_L006)   ;B393C0
    %AICMD0x09_StartScript($06, pAIScripting0x01_L152)                                   ;B393C7
pAIScripting0x01_L006:
    %AICMD0x12_Jump(pAIScripting0x01_L001)                                   ;B393CB
pAIScripting0x01_L007:
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 17, 18, pAIScripting0x01_L023) ;B393CE
    %AICMD0x1A($0158, $00B8, aAIScriptingData_L067, $00)                     ;B393D6
    %AICMD0x22($18, $18, $01, aAIScriptingData_L068, $0C)                    ;B393DE
pAIScripting0x01_L008:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x01_L010)                                        ;B393E5
    %AICMD0x2D_JumpOnInteract(pAIScripting0x01_L013, pAIScripting0x01_L011)                               ;B393E8
    %AICMD0x12_Jump(pAIScripting0x01_L008)                                   ;B393ED
pAIScripting0x01_L009:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x01_L010)                                        ;B393F0
    %AICMD0x1F(pAIScripting0x01_L019)                                        ;B393F3
    %AICMD0x12_Jump(pAIScripting0x01_L009)                                   ;B393F6
pAIScripting0x01_L010:
    %AICMD0x1C_ShowDialog($01CB, $00)                          ;B393F9
    %AICMD0x12_Jump(pAIScripting0x01_L008)                                   ;B393FD
pAIScripting0x01_L011:
    %AICMD0x16_JumpIfBetween8($80091E, 9, 12, pAIScripting0x01_L012)         ;B39400
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B39408
    %AICMD0x12_Jump(pAIScripting0x01_L008)                                   ;B3940C
pAIScripting0x01_L012:
    %AICMD0x1C_ShowDialog($03B8, $00)                          ;B3940F
    %AICMD0x12_Jump(pAIScripting0x01_L008)                                   ;B39413
pAIScripting0x01_L013:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event4, $0C, pAIScripting0x01_L021)   ;B39416
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 17, 18, pAIScripting0x01_L018) ;B3941D
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $00, pAIScripting0x01_L019)   ;B39425
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 0, pAIScripting0x01_L014)     ;B3942C
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 1, pAIScripting0x01_L015)     ;B39433
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 2, pAIScripting0x01_L016)     ;B3943A
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, pAIScripting0x01_L020)     ;B39441
    %AICMD0x12_Jump(pAIScripting0x01_L008)                                   ;B39448
pAIScripting0x01_L014:
    %AICMD0x1C_ShowDialog($006A, $00)                          ;B3944B
    %AICMD0x12_Jump(pAIScripting0x01_L008)                                   ;B3944F
pAIScripting0x01_L015:
    %AICMD0x1C_ShowDialog($006B, $00)                          ;B39452
    %AICMD0x12_Jump(pAIScripting0x01_L008)                                   ;B39456
pAIScripting0x01_L016:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 19, pAIScripting0x01_L022)         ;B39459
    %AICMD0x17_RollRandom($02)                                            ;B39460
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x01_L017)                                   ;B39462
    %AICMD0x1C_ShowDialog($03DF, $00)                          ;B39466
    %AICMD0x12_Jump(pAIScripting0x01_L008)                                   ;B3946A
pAIScripting0x01_L017:
    %AICMD0x1C_ShowDialog($00FB, $00)                          ;B3946D
    %AICMD0x12_Jump(pAIScripting0x01_L008)                                   ;B39471
pAIScripting0x01_L018:
    %AICMD0x1C_ShowDialog($0392, $00)                          ;B39474
    %AICMD0x12_Jump(pAIScripting0x01_L008)                                   ;B39478
pAIScripting0x01_L019:
    %AICMD0x1C_ShowDialog($03E0, $00)                          ;B3947B
    %AICMD0x12_Jump(pAIScripting0x01_L009)                                   ;B3947F
pAIScripting0x01_L020:
    %AICMD0x1C_ShowDialog($006B, $00)                          ;B39482
    %AICMD0x12_Jump(pAIScripting0x01_L008)                                   ;B39486
pAIScripting0x01_L021:
    %AICMD0x1C_ShowDialog($01D0, $00)                          ;B39489
    %AICMD0x12_Jump(pAIScripting0x01_L008)                                   ;B3948D
pAIScripting0x01_L022:
    %AICMD0x1C_ShowDialog($03F3, $00)                          ;B39490
    %AICMD0x12_Jump(pAIScripting0x01_L008)                                   ;B39494
pAIScripting0x01_L023:
    %AICMD0x10_End()                                           ;B39497
pAIScripting0x01_L024:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event4, $0A, pAIScripting0x01_L039)   ;B39498
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 17, 18, pAIScripting0x01_L039) ;B3949F
    %AICMD0x1A($0228, $0268, aAIScriptingData_L055, $00)                     ;B394A7
pAIScripting0x01_L025:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x01_L026)                                        ;B394AF
    %AICMD0x2D_JumpOnInteract(pAIScripting0x01_L029, pAIScripting0x01_L027)                               ;B394B2
    %AICMD0x12_Jump(pAIScripting0x01_L025)                                   ;B394B7
pAIScripting0x01_L026:
    %AICMD0x1C_ShowDialog($01CB, $00)                          ;B394BA
    %AICMD0x12_Jump(pAIScripting0x01_L025)                                   ;B394BE
pAIScripting0x01_L027:
    %AICMD0x16_JumpIfBetween8($80091E, 9, 12, pAIScripting0x01_L028)         ;B394C1
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B394C9
    %AICMD0x12_Jump(pAIScripting0x01_L025)                                   ;B394CD
pAIScripting0x01_L028:
    %AICMD0x1C_ShowDialog($03BA, $00)                          ;B394D0
    %AICMD0x12_Jump(pAIScripting0x01_L025)                                   ;B394D4
pAIScripting0x01_L029:
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 17, 18, pAIScripting0x01_L034) ;B394D7
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 0, pAIScripting0x01_L031)     ;B394DF
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 1, pAIScripting0x01_L032)     ;B394E6
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 2, pAIScripting0x01_L033)     ;B394ED
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, pAIScripting0x01_L036)     ;B394F4
pAIScripting0x01_L030:
    %AICMD0x45_JumpIfBetween16(nLove_Maria, 200, 249, pAIScripting0x01_L035) ;B394FB
    %AICMD0x45_JumpIfBetween16(nLove_Ann, 200, 249, pAIScripting0x01_L035)   ;B39505
    %AICMD0x45_JumpIfBetween16(nLove_Nina, 200, 249, pAIScripting0x01_L035)  ;B3950F
    %AICMD0x45_JumpIfBetween16(nLove_Ellen, 200, 249, pAIScripting0x01_L035) ;B39519
    %AICMD0x45_JumpIfBetween16(nLove_Eve, 200, 249, pAIScripting0x01_L035)   ;B39523
    %AICMD0x1C_ShowDialog($03CE, $00)                          ;B3952D
    %AICMD0x12_Jump(pAIScripting0x01_L025)                                   ;B39531
pAIScripting0x01_L031:
    %AICMD0x17_RollRandom($02)                                            ;B39534
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x01_L030)                                   ;B39536
    %AICMD0x1C_ShowDialog($0064, $00)                          ;B3953A
    %AICMD0x12_Jump(pAIScripting0x01_L025)                                   ;B3953E
pAIScripting0x01_L032:
    %AICMD0x17_RollRandom($02)                                            ;B39541
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x01_L030)                                   ;B39543
    %AICMD0x1C_ShowDialog($0065, $00)                          ;B39547
    %AICMD0x12_Jump(pAIScripting0x01_L025)                                   ;B3954B
pAIScripting0x01_L033:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 19, pAIScripting0x01_L037)         ;B3954E
    %AICMD0x17_RollRandom($02)                                            ;B39555
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x01_L030)                                   ;B39557
    %AICMD0x1C_ShowDialog($0066, $00)                          ;B3955B
    %AICMD0x12_Jump(pAIScripting0x01_L025)                                   ;B3955F
pAIScripting0x01_L034:
    %AICMD0x1C_ShowDialog($0391, $00)                          ;B39562
    %AICMD0x12_Jump(pAIScripting0x01_L025)                                   ;B39566
pAIScripting0x01_L035:
    %AICMD0x1C_ShowDialog($03CD, $00)                          ;B39569
    %AICMD0x12_Jump(pAIScripting0x01_L025)                                   ;B3956D
pAIScripting0x01_L036:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 30, pAIScripting0x01_L038)         ;B39570
    %AICMD0x17_RollRandom($02)                                            ;B39577
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x01_L030)                                   ;B39579
    %AICMD0x1C_ShowDialog($0068, $00)                          ;B3957D
    %AICMD0x12_Jump(pAIScripting0x01_L025)                                   ;B39581
pAIScripting0x01_L037:
    %AICMD0x1C_ShowDialog($03F2, $00)                          ;B39584
    %AICMD0x12_Jump(pAIScripting0x01_L025)                                   ;B39588
pAIScripting0x01_L038:
    %AICMD0x1C_ShowDialog($0324, $00)                          ;B3958B
    %AICMD0x41_AddValue16(nPlayerHappiness, 5)                 ;B3958F
    %AICMD0x12_Jump(pAIScripting0x01_L025)                                   ;B39595
pAIScripting0x01_L039:
    %AICMD0x10_End()                                           ;B39598
pAIScripting0x01_L040:
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 17, 18, pAIScripting0x01_L074) ;B39599
    %AICMD0x1A($0138, $0118, aAIScriptingData_L014, $01)                     ;B395A1
pAIScripting0x01_L041:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x01_L043)                                        ;B395A9
    %AICMD0x2D_JumpOnInteract(pAIScripting0x01_L051, pAIScripting0x01_L045)                               ;B395AC
    %AICMD0x12_Jump(pAIScripting0x01_L041)                                   ;B395B1
pAIScripting0x01_L042:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x01_L043)                                        ;B395B4
    %AICMD0x1F(pAIScripting0x01_L072)                                        ;B395B7
    %AICMD0x12_Jump(pAIScripting0x01_L042)                                   ;B395BA
pAIScripting0x01_L043:
    %AICMD0x45_JumpIfBetween16(nLove_Maria, 0, 249, pAIScripting0x01_L044)   ;B395BD
    %AICMD0x1C_ShowDialog($043D, $00)                          ;B395C7
    %AICMD0x12_Jump(pAIScripting0x01_L041)                                   ;B395CB
pAIScripting0x01_L044:
    %AICMD0x1C_ShowDialog($0174, $00)                          ;B395CE
    %AICMD0x12_Jump(pAIScripting0x01_L041)                                   ;B395D2
pAIScripting0x01_L045:
    %AICMD0x15_JumpIfEquals8($80091E, 2, pAIScripting0x01_L046)              ;B395D5
    %AICMD0x16_JumpIfBetween8($80091E, 1, 5, pAIScripting0x01_L049)          ;B395DC
    %AICMD0x16_JumpIfBetween8($80091E, 16, 23, pAIScripting0x01_L049)        ;B395E4
    %AICMD0x15_JumpIfEquals8($80091E, 6, pAIScripting0x01_L048)              ;B395EC
    %AICMD0x15_JumpIfEquals8($80091E, 25, pAIScripting0x01_L047)             ;B395F3
    %AICMD0x15_JumpIfEquals8($80091E, 73, pAIScripting0x01_L047)             ;B395FA
    %AICMD0x16_JumpIfBetween8($80091E, 9, 12, pAIScripting0x01_L050)         ;B39601
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B39609
    %AICMD0x12_Jump(pAIScripting0x01_L041)                                   ;B3960D
pAIScripting0x01_L046:
    %AICMD0x1C_ShowDialog($03B0, $00)                          ;B39610
    %AICMD0x41_AddValue16(nLove_Maria, -8)                     ;B39614
    %AICMD0x12_Jump(pAIScripting0x01_L041)                                   ;B3961A
pAIScripting0x01_L047:
    %AICMD0x1C_ShowDialog($0212, $00)                          ;B3961D
    %AICMD0x41_AddValue16(nLove_Maria, 4)                      ;B39621
    %AICMD0x12_Jump(pAIScripting0x01_L041)                                   ;B39627
pAIScripting0x01_L048:
    %AICMD0x1C_ShowDialog($03B5, $00)                          ;B3962A
    %AICMD0x41_AddValue16(nLove_Maria, 3)                      ;B3962E
    %AICMD0x12_Jump(pAIScripting0x01_L041)                                   ;B39634
pAIScripting0x01_L049:
    %AICMD0x1C_ShowDialog($03B2, $00)                          ;B39637
    %AICMD0x41_AddValue16(nLove_Maria, 5)                      ;B3963B
    %AICMD0x12_Jump(pAIScripting0x01_L041)                                   ;B39641
pAIScripting0x01_L050:
    %AICMD0x1C_ShowDialog($01D9, $00)                          ;B39644
    %AICMD0x41_AddValue16(nLove_Maria, -2)                     ;B39648
    %AICMD0x12_Jump(pAIScripting0x01_L041)                                   ;B3964E
pAIScripting0x01_L051:
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 17, 18, pAIScripting0x01_L073) ;B39651
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 0, pAIScripting0x01_L052)     ;B39659
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 1, pAIScripting0x01_L058)     ;B39660
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 2, pAIScripting0x01_L061)     ;B39667
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, pAIScripting0x01_L067)     ;B3966E
    %AICMD0x12_Jump(pAIScripting0x01_L041)                                   ;B39675
pAIScripting0x01_L052:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 22, pAIScripting0x01_L057)         ;B39678
    %AICMD0x17_RollRandom($02)                                            ;B3967F
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x01_L053)                                   ;B39681
    %AICMD0x18_JumpIfRandomEquals($01, pAIScripting0x01_L054)                                   ;B39685
    %AICMD0x12_Jump(pAIScripting0x01_L041)                                   ;B39689
pAIScripting0x01_L053:
    %AICMD0x1C_ShowDialog($0082, $00)                          ;B3968C
    %AICMD0x12_Jump(pAIScripting0x01_L041)                                   ;B39690
pAIScripting0x01_L054:
    %AICMD0x1D_ShowDialog($0086, $00)                          ;B39693
    %AICMD0x20_JumpIfChoice(0, pAIScripting0x01_L055)                        ;B39697
    %AICMD0x20_JumpIfChoice(1, pAIScripting0x01_L056)                        ;B3969B
    %AICMD0x12_Jump(pAIScripting0x01_L041)                                   ;B3969F
pAIScripting0x01_L055:
    %AICMD0x1C_ShowDialog($0087, $00)                          ;B396A2
    %AICMD0x41_AddValue16(nLove_Maria, 8)                      ;B396A6
    %AICMD0x12_Jump(pAIScripting0x01_L042)                                   ;B396AC
pAIScripting0x01_L056:
    %AICMD0x1C_ShowDialog($0088, $00)                          ;B396AF
    %AICMD0x41_AddValue16(nLove_Maria, 2)                      ;B396B3
    %AICMD0x12_Jump(pAIScripting0x01_L042)                                   ;B396B9
pAIScripting0x01_L057:
    %AICMD0x1C_ShowDialog($00BF, $00)                          ;B396BC
    %AICMD0x12_Jump(pAIScripting0x01_L041)                                   ;B396C0
pAIScripting0x01_L058:
    %AICMD0x17_RollRandom($02)                                            ;B396C3
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x01_L059)                                   ;B396C5
    %AICMD0x18_JumpIfRandomEquals($01, pAIScripting0x01_L060)                                   ;B396C9
    %AICMD0x12_Jump(pAIScripting0x01_L041)                                   ;B396CD
pAIScripting0x01_L059:
    %AICMD0x1C_ShowDialog($0083, $00)                          ;B396D0
    %AICMD0x12_Jump(pAIScripting0x01_L041)                                   ;B396D4
pAIScripting0x01_L060:
    %AICMD0x1C_ShowDialog($0089, $00)                          ;B396D7
    %AICMD0x12_Jump(pAIScripting0x01_L041)                                   ;B396DB
pAIScripting0x01_L061:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 11, pAIScripting0x01_L066)         ;B396DE
    %AICMD0x17_RollRandom($02)                                            ;B396E5
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x01_L062)                                   ;B396E7
    %AICMD0x18_JumpIfRandomEquals($01, pAIScripting0x01_L063)                                   ;B396EB
    %AICMD0x12_Jump(pAIScripting0x01_L041)                                   ;B396EF
pAIScripting0x01_L062:
    %AICMD0x1C_ShowDialog($0084, $00)                          ;B396F2
    %AICMD0x12_Jump(pAIScripting0x01_L041)                                   ;B396F6
pAIScripting0x01_L063:
    %AICMD0x1C_ShowDialog($008A, $00)                          ;B396F9
    %AICMD0x20_JumpIfChoice(0, pAIScripting0x01_L064)                        ;B396FD
    %AICMD0x20_JumpIfChoice(1, pAIScripting0x01_L065)                        ;B39701
    %AICMD0x12_Jump(pAIScripting0x01_L041)                                   ;B39705
pAIScripting0x01_L064:
    %AICMD0x1C_ShowDialog($008B, $00)                          ;B39708
    %AICMD0x41_AddValue16(nLove_Maria, 8)                      ;B3970C
    %AICMD0x12_Jump(pAIScripting0x01_L042)                                   ;B39712
pAIScripting0x01_L065:
    %AICMD0x1C_ShowDialog($008C, $00)                          ;B39715
    %AICMD0x41_AddValue16(nLove_Maria, 2)                      ;B39719
    %AICMD0x12_Jump(pAIScripting0x01_L042)                                   ;B3971F
pAIScripting0x01_L066:
    %AICMD0x1C_ShowDialog($0238, $00)                          ;B39722
    %AICMD0x12_Jump(pAIScripting0x01_L041)                                   ;B39726
pAIScripting0x01_L067:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 23, pAIScripting0x01_L070)         ;B39729
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 30, pAIScripting0x01_L071)         ;B39730
    %AICMD0x17_RollRandom($02)                                            ;B39737
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x01_L068)                                   ;B39739
    %AICMD0x18_JumpIfRandomEquals($01, pAIScripting0x01_L069)                                   ;B3973D
    %AICMD0x12_Jump(pAIScripting0x01_L041)                                   ;B39741
pAIScripting0x01_L068:
    %AICMD0x1C_ShowDialog($0085, $00)                          ;B39744
    %AICMD0x12_Jump(pAIScripting0x01_L041)                                   ;B39748
pAIScripting0x01_L069:
    %AICMD0x1C_ShowDialog($008D, $00)                          ;B3974B
    %AICMD0x12_Jump(pAIScripting0x01_L041)                                   ;B3974F
pAIScripting0x01_L070:
    %AICMD0x1C_ShowDialog($02AF, $00)                          ;B39752
    %AICMD0x12_Jump(pAIScripting0x01_L041)                                   ;B39756
pAIScripting0x01_L071:
    %AICMD0x1C_ShowDialog($03F8, $00)                          ;B39759
    %AICMD0x41_AddValue16(nLove_Maria, 5)                      ;B3975D
    %AICMD0x12_Jump(pAIScripting0x01_L041)                                   ;B39763
pAIScripting0x01_L072:
    %AICMD0x1C_ShowDialog($0410, $00)                          ;B39766
    %AICMD0x12_Jump(pAIScripting0x01_L042)                                   ;B3976A
pAIScripting0x01_L073:
    %AICMD0x1C_ShowDialog($0391, $00)                          ;B3976D
    %AICMD0x12_Jump(pAIScripting0x01_L041)                                   ;B39771
pAIScripting0x01_L074:
    %AICMD0x10_End()                                           ;B39774
pAIScripting0x01_L075:
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 17, 18, pAIScripting0x01_L112) ;B39775
    %AICMD0x1A($0208, $0108, aAIScriptingData_L019, $00)                     ;B3977D
    %AICMD0x22($08, $20, $01, aAIScriptingData_L020, $10)                    ;B39785
pAIScripting0x01_L076:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x01_L079)                                        ;B3978C
    %AICMD0x2D_JumpOnInteract(pAIScripting0x01_L087, pAIScripting0x01_L081)                               ;B3978F
    %AICMD0x12_Jump(pAIScripting0x01_L076)                                   ;B39794
pAIScripting0x01_L077:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x01_L079)                                        ;B39797
    %AICMD0x1F(pAIScripting0x01_L109)                                        ;B3979A
    %AICMD0x12_Jump(pAIScripting0x01_L077)                                   ;B3979D
pAIScripting0x01_L078:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x01_L079)                                        ;B397A0
    %AICMD0x1F(pAIScripting0x01_L110)                                        ;B397A3
    %AICMD0x12_Jump(pAIScripting0x01_L078)                                   ;B397A6
pAIScripting0x01_L079:
    %AICMD0x45_JumpIfBetween16(nLove_Nina, 0, 249, pAIScripting0x01_L080)    ;B397A9
    %AICMD0x1C_ShowDialog($043F, $00)                          ;B397B3
    %AICMD0x12_Jump(pAIScripting0x01_L076)                                   ;B397B7
pAIScripting0x01_L080:
    %AICMD0x1C_ShowDialog($0178, $00)                          ;B397BA
    %AICMD0x12_Jump(pAIScripting0x01_L076)                                   ;B397BE
pAIScripting0x01_L081:
    %AICMD0x15_JumpIfEquals8($80091E, 2, pAIScripting0x01_L085)              ;B397C1
    %AICMD0x15_JumpIfEquals8($80091E, 5, pAIScripting0x01_L083)              ;B397C8
    %AICMD0x15_JumpIfEquals8($80091E, 6, pAIScripting0x01_L083)              ;B397CF
    %AICMD0x16_JumpIfBetween8($80091E, 1, 7, pAIScripting0x01_L082)          ;B397D6
    %AICMD0x16_JumpIfBetween8($80091E, 16, 23, pAIScripting0x01_L082)        ;B397DE
    %AICMD0x15_JumpIfEquals8($80091E, 24, pAIScripting0x01_L084)             ;B397E6
    %AICMD0x15_JumpIfEquals8($80091E, 25, pAIScripting0x01_L086)             ;B397ED
    %AICMD0x16_JumpIfBetween8($80091E, 9, 12, pAIScripting0x01_L085)         ;B397F4
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B397FC
    %AICMD0x12_Jump(pAIScripting0x01_L076)                                   ;B39800
pAIScripting0x01_L082:
    %AICMD0x1C_ShowDialog($03B2, $00)                          ;B39803
    %AICMD0x41_AddValue16(nLove_Nina, 4)                       ;B39807
    %AICMD0x12_Jump(pAIScripting0x01_L076)                                   ;B3980D
pAIScripting0x01_L083:
    %AICMD0x1C_ShowDialog($0212, $00)                          ;B39810
    %AICMD0x41_AddValue16(nLove_Nina, 8)                       ;B39814
    %AICMD0x12_Jump(pAIScripting0x01_L076)                                   ;B3981A
pAIScripting0x01_L084:
    %AICMD0x1C_ShowDialog($03B1, $00)                          ;B3981D
    %AICMD0x41_AddValue16(nLove_Nina, -6)                      ;B39821
    %AICMD0x12_Jump(pAIScripting0x01_L076)                                   ;B39827
pAIScripting0x01_L085:
    %AICMD0x1C_ShowDialog($01D9, $00)                          ;B3982A
    %AICMD0x41_AddValue16(nLove_Nina, -4)                      ;B3982E
    %AICMD0x12_Jump(pAIScripting0x01_L076)                                   ;B39834
pAIScripting0x01_L086:
    %AICMD0x1C_ShowDialog($0143, $00)                          ;B39837
    %AICMD0x41_AddValue16(nLove_Nina, 6)                       ;B3983B
    %AICMD0x12_Jump(pAIScripting0x01_L076)                                   ;B39841
pAIScripting0x01_L087:
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 17, 18, pAIScripting0x01_L111) ;B39844
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 0, pAIScripting0x01_L088)     ;B3984C
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 1, pAIScripting0x01_L092)     ;B39853
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 2, pAIScripting0x01_L097)     ;B3985A
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, pAIScripting0x01_L102)     ;B39861
    %AICMD0x12_Jump(pAIScripting0x01_L076)                                   ;B39868
pAIScripting0x01_L088:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 22, pAIScripting0x01_L091)         ;B3986B
    %AICMD0x17_RollRandom($02)                                            ;B39872
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x01_L089)                                   ;B39874
    %AICMD0x18_JumpIfRandomEquals($01, pAIScripting0x01_L090)                                   ;B39878
    %AICMD0x12_Jump(pAIScripting0x01_L076)                                   ;B3987C
pAIScripting0x01_L089:
    %AICMD0x1C_ShowDialog($00AE, $00)                          ;B3987F
    %AICMD0x12_Jump(pAIScripting0x01_L076)                                   ;B39883
pAIScripting0x01_L090:
    %AICMD0x1C_ShowDialog($00B5, $00)                          ;B39886
    %AICMD0x12_Jump(pAIScripting0x01_L076)                                   ;B3988A
pAIScripting0x01_L091:
    %AICMD0x1C_ShowDialog($0208, $00)                          ;B3988D
    %AICMD0x12_Jump(pAIScripting0x01_L076)                                   ;B39891
pAIScripting0x01_L092:
    %AICMD0x17_RollRandom($02)                                            ;B39894
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x01_L093)                                   ;B39896
    %AICMD0x18_JumpIfRandomEquals($01, pAIScripting0x01_L096)                                   ;B3989A
    %AICMD0x12_Jump(pAIScripting0x01_L076)                                   ;B3989E
pAIScripting0x01_L093:
    %AICMD0x1D_ShowDialog($00AF, $00)                          ;B398A1
    %AICMD0x20_JumpIfChoice(0, pAIScripting0x01_L094)                        ;B398A5
    %AICMD0x20_JumpIfChoice(1, pAIScripting0x01_L095)                        ;B398A9
    %AICMD0x12_Jump(pAIScripting0x01_L076)                                   ;B398AD
pAIScripting0x01_L094:
    %AICMD0x1C_ShowDialog($00B0, $00)                          ;B398B0
    %AICMD0x41_AddValue16(nLove_Nina, 8)                       ;B398B4
    %AICMD0x12_Jump(pAIScripting0x01_L077)                                   ;B398BA
pAIScripting0x01_L095:
    %AICMD0x1C_ShowDialog($00B1, $00)                          ;B398BD
    %AICMD0x41_AddValue16(nLove_Nina, 2)                       ;B398C1
    %AICMD0x12_Jump(pAIScripting0x01_L077)                                   ;B398C7
pAIScripting0x01_L096:
    %AICMD0x1C_ShowDialog($00B6, $00)                          ;B398CA
    %AICMD0x12_Jump(pAIScripting0x01_L076)                                   ;B398CE
pAIScripting0x01_L097:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 11, pAIScripting0x01_L100)         ;B398D1
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 19, pAIScripting0x01_L101)         ;B398D8
    %AICMD0x17_RollRandom($02)                                            ;B398DF
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x01_L098)                                   ;B398E1
    %AICMD0x18_JumpIfRandomEquals($01, pAIScripting0x01_L099)                                   ;B398E5
    %AICMD0x12_Jump(pAIScripting0x01_L076)                                   ;B398E9
pAIScripting0x01_L098:
    %AICMD0x1C_ShowDialog($00B2, $00)                          ;B398EC
    %AICMD0x12_Jump(pAIScripting0x01_L076)                                   ;B398F0
pAIScripting0x01_L099:
    %AICMD0x1C_ShowDialog($00B7, $00)                          ;B398F3
    %AICMD0x12_Jump(pAIScripting0x01_L076)                                   ;B398F7
pAIScripting0x01_L100:
    %AICMD0x1C_ShowDialog($023A, $00)                          ;B398FA
    %AICMD0x12_Jump(pAIScripting0x01_L076)                                   ;B398FE
pAIScripting0x01_L101:
    %AICMD0x1C_ShowDialog($03F2, $00)                          ;B39901
    %AICMD0x12_Jump(pAIScripting0x01_L076)                                   ;B39905
pAIScripting0x01_L102:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 23, pAIScripting0x01_L107)         ;B39908
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 30, pAIScripting0x01_L108)         ;B3990F
    %AICMD0x17_RollRandom($02)                                            ;B39916
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x01_L103)                                   ;B39918
    %AICMD0x18_JumpIfRandomEquals($01, pAIScripting0x01_L106)                                   ;B3991C
    %AICMD0x12_Jump(pAIScripting0x01_L076)                                   ;B39920
pAIScripting0x01_L103:
    %AICMD0x1D_ShowDialog($00B3, $00)                          ;B39923
    %AICMD0x20_JumpIfChoice(0, pAIScripting0x01_L104)                        ;B39927
    %AICMD0x20_JumpIfChoice(1, pAIScripting0x01_L105)                        ;B3992B
    %AICMD0x12_Jump(pAIScripting0x01_L076)                                   ;B3992F
pAIScripting0x01_L104:
    %AICMD0x1C_ShowDialog($00B4, $00)                          ;B39932
    %AICMD0x41_AddValue16(nLove_Nina, 8)                       ;B39936
    %AICMD0x12_Jump(pAIScripting0x01_L077)                                   ;B3993C
pAIScripting0x01_L105:
    %AICMD0x1C_ShowDialog($00B1, $00)                          ;B3993F
    %AICMD0x41_AddValue16(nLove_Nina, 2)                       ;B39943
    %AICMD0x12_Jump(pAIScripting0x01_L077)                                   ;B39949
pAIScripting0x01_L106:
    %AICMD0x1C_ShowDialog($00B8, $00)                          ;B3994C
    %AICMD0x12_Jump(pAIScripting0x01_L076)                                   ;B39950
pAIScripting0x01_L107:
    %AICMD0x1C_ShowDialog($02B1, $00)                          ;B39953
    %AICMD0x12_Jump(pAIScripting0x01_L076)                                   ;B39957
pAIScripting0x01_L108:
    %AICMD0x1C_ShowDialog($03FA, $00)                          ;B3995A
    %AICMD0x41_AddValue16(nLove_Nina, 5)                       ;B3995E
    %AICMD0x12_Jump(pAIScripting0x01_L076)                                   ;B39964
pAIScripting0x01_L109:
    %AICMD0x1C_ShowDialog($040D, $00)                          ;B39967
    %AICMD0x12_Jump(pAIScripting0x01_L077)                                   ;B3996B
pAIScripting0x01_L110:
    %AICMD0x1C_ShowDialog($00B1, $00)                          ;B3996E
    %AICMD0x12_Jump(pAIScripting0x01_L078)                                   ;B39972
pAIScripting0x01_L111:
    %AICMD0x1C_ShowDialog($0391, $00)                          ;B39975
    %AICMD0x12_Jump(pAIScripting0x01_L076)                                   ;B39979
pAIScripting0x01_L112:
    %AICMD0x10_End()                                           ;B3997C
pAIScripting0x01_L113:
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 17, 18, pAIScripting0x01_L125) ;B3997D
    %AICMD0x1A($0288, $0388, aAIScriptingData_L021, $00)                     ;B39985
    %AICMD0x22($20, $10, $01, aAIScriptingData_L022, $10)                    ;B3998D
pAIScripting0x01_L114:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x01_L117)                                        ;B39994
    %AICMD0x2D_JumpOnInteract(pAIScripting0x01_L126, pAIScripting0x01_L119)                               ;B39997
    %AICMD0x12_Jump(pAIScripting0x01_L114)                                   ;B3999C
pAIScripting0x01_L115:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x01_L117)                                        ;B3999F
    %AICMD0x1F(pAIScripting0x01_L148)                                        ;B399A2
    %AICMD0x12_Jump(pAIScripting0x01_L115)                                   ;B399A5
pAIScripting0x01_L116:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x01_L117)                                        ;B399A8
    %AICMD0x1F(pAIScripting0x01_L149)                                        ;B399AB
    %AICMD0x12_Jump(pAIScripting0x01_L116)                                   ;B399AE
pAIScripting0x01_L117:
    %AICMD0x45_JumpIfBetween16(nLove_Ellen, 0, 249, pAIScripting0x01_L118)   ;B399B1
    %AICMD0x1C_ShowDialog($0440, $00)                          ;B399BB
    %AICMD0x12_Jump(pAIScripting0x01_L114)                                   ;B399BF
pAIScripting0x01_L118:
    %AICMD0x1C_ShowDialog($017A, $00)                          ;B399C2
    %AICMD0x12_Jump(pAIScripting0x01_L114)                                   ;B399C6
pAIScripting0x01_L119:
    %AICMD0x15_JumpIfEquals8($80091E, 2, pAIScripting0x01_L120)              ;B399C9
    %AICMD0x16_JumpIfBetween8($80091E, 1, 5, pAIScripting0x01_L121)          ;B399D0
    %AICMD0x15_JumpIfEquals8($80091E, 7, pAIScripting0x01_L121)              ;B399D8
    %AICMD0x15_JumpIfEquals8($80091E, 73, pAIScripting0x01_L123)             ;B399DF
    %AICMD0x15_JumpIfEquals8($80091E, 25, pAIScripting0x01_L123)             ;B399E6
    %AICMD0x16_JumpIfBetween8($80091E, 16, 19, pAIScripting0x01_L121)        ;B399ED
    %AICMD0x16_JumpIfBetween8($80091E, 20, 23, pAIScripting0x01_L122)        ;B399F5
    %AICMD0x16_JumpIfBetween8($80091E, 9, 12, pAIScripting0x01_L124)         ;B399FD
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B39A05
    %AICMD0x12_Jump(pAIScripting0x01_L114)                                   ;B39A09
pAIScripting0x01_L120:
    %AICMD0x1C_ShowDialog($03B0, $00)                          ;B39A0C
    %AICMD0x41_AddValue16(nLove_Ellen, -8)                     ;B39A10
    %AICMD0x12_Jump(pAIScripting0x01_L114)                                   ;B39A16
pAIScripting0x01_L121:
    %AICMD0x1C_ShowDialog($03B2, $00)                          ;B39A19
    %AICMD0x41_AddValue16(nLove_Ellen, 6)                      ;B39A1D
    %AICMD0x12_Jump(pAIScripting0x01_L114)                                   ;B39A23
pAIScripting0x01_L122:
    %AICMD0x1C_ShowDialog($03B3, $00)                          ;B39A26
    %AICMD0x41_AddValue16(nLove_Ellen, 8)                      ;B39A2A
    %AICMD0x12_Jump(pAIScripting0x01_L114)                                   ;B39A30
pAIScripting0x01_L123:
    %AICMD0x1C_ShowDialog($0212, $00)                          ;B39A33
    %AICMD0x41_AddValue16(nLove_Ellen, 5)                      ;B39A37
    %AICMD0x12_Jump(pAIScripting0x01_L114)                                   ;B39A3D
pAIScripting0x01_L124:
    %AICMD0x1C_ShowDialog($01D9, $00)                          ;B39A40
    %AICMD0x41_AddValue16(nLove_Ellen, -4)                     ;B39A44
    %AICMD0x12_Jump(pAIScripting0x01_L114)                                   ;B39A4A
pAIScripting0x01_L125:
    %AICMD0x10_End()                                           ;B39A4D
pAIScripting0x01_L126:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $02, pAIScripting0x01_L151)   ;B39A4E
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 17, 18, pAIScripting0x01_L150) ;B39A55
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 0, pAIScripting0x01_L127)     ;B39A5D
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 1, pAIScripting0x01_L133)     ;B39A64
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 2, pAIScripting0x01_L137)     ;B39A6B
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, pAIScripting0x01_L143)     ;B39A72
    %AICMD0x12_Jump(pAIScripting0x01_L114)                                   ;B39A79
pAIScripting0x01_L127:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 22, pAIScripting0x01_L132)         ;B39A7C
    %AICMD0x17_RollRandom($02)                                            ;B39A83
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x01_L128)                                   ;B39A85
    %AICMD0x18_JumpIfRandomEquals($01, pAIScripting0x01_L131)                                   ;B39A89
    %AICMD0x12_Jump(pAIScripting0x01_L114)                                   ;B39A8D
pAIScripting0x01_L128:
    %AICMD0x1D_ShowDialog($00CB, $00)                          ;B39A90
    %AICMD0x20_JumpIfChoice(0, pAIScripting0x01_L129)                        ;B39A94
    %AICMD0x20_JumpIfChoice(1, pAIScripting0x01_L130)                        ;B39A98
    %AICMD0x12_Jump(pAIScripting0x01_L114)                                   ;B39A9C
pAIScripting0x01_L129:
    %AICMD0x1C_ShowDialog($00CC, $00)                          ;B39A9F
    %AICMD0x41_AddValue16(nLove_Ellen, 8)                      ;B39AA3
    %AICMD0x12_Jump(pAIScripting0x01_L115)                                   ;B39AA9
pAIScripting0x01_L130:
    %AICMD0x1C_ShowDialog($00CD, $00)                          ;B39AAC
    %AICMD0x41_AddValue16(nLove_Ellen, 2)                      ;B39AB0
    %AICMD0x12_Jump(pAIScripting0x01_L115)                                   ;B39AB6
pAIScripting0x01_L131:
    %AICMD0x1D_ShowDialog($00C5, $00)                          ;B39AB9
    %AICMD0x12_Jump(pAIScripting0x01_L114)                                   ;B39ABD
pAIScripting0x01_L132:
    %AICMD0x1C_ShowDialog($0209, $00)                          ;B39AC0
    %AICMD0x12_Jump(pAIScripting0x01_L114)                                   ;B39AC4
pAIScripting0x01_L133:
    %AICMD0x17_RollRandom($02)                                            ;B39AC7
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x01_L134)                                   ;B39AC9
    %AICMD0x18_JumpIfRandomEquals($01, pAIScripting0x01_L135)                                   ;B39ACD
    %AICMD0x12_Jump(pAIScripting0x01_L114)                                   ;B39AD1
pAIScripting0x01_L134:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $03, pAIScripting0x01_L136)   ;B39AD4
    %AICMD0x1D_ShowDialog($00C6, $00)                          ;B39ADB
    %AICMD0x12_Jump(pAIScripting0x01_L114)                                   ;B39ADF
pAIScripting0x01_L135:
    %AICMD0x1C_ShowDialog($00CE, $00)                          ;B39AE2
    %AICMD0x12_Jump(pAIScripting0x01_L114)                                   ;B39AE6
pAIScripting0x01_L136:
    %AICMD0x1C_ShowDialog($048D, $00)                          ;B39AE9
    %AICMD0x12_Jump(pAIScripting0x01_L114)                                   ;B39AED
pAIScripting0x01_L137:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 11, pAIScripting0x01_L142)         ;B39AF0
    %AICMD0x17_RollRandom($02)                                            ;B39AF7
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x01_L138)                                   ;B39AF9
    %AICMD0x18_JumpIfRandomEquals($01, pAIScripting0x01_L141)                                   ;B39AFD
    %AICMD0x12_Jump(pAIScripting0x01_L114)                                   ;B39B01
pAIScripting0x01_L138:
    %AICMD0x1C_ShowDialog($00C7, $00)                          ;B39B04
    %AICMD0x20_JumpIfChoice(0, pAIScripting0x01_L139)                        ;B39B08
    %AICMD0x20_JumpIfChoice(1, pAIScripting0x01_L140)                        ;B39B0C
    %AICMD0x12_Jump(pAIScripting0x01_L114)                                   ;B39B10
pAIScripting0x01_L139:
    %AICMD0x1C_ShowDialog($00C8, $00)                          ;B39B13
    %AICMD0x41_AddValue16(nLove_Ellen, 8)                      ;B39B17
    %AICMD0x12_Jump(pAIScripting0x01_L115)                                   ;B39B1D
pAIScripting0x01_L140:
    %AICMD0x1C_ShowDialog($00C9, $00)                          ;B39B20
    %AICMD0x41_AddValue16(nLove_Ellen, 2)                      ;B39B24
    %AICMD0x12_Jump(pAIScripting0x01_L115)                                   ;B39B2A
pAIScripting0x01_L141:
    %AICMD0x1C_ShowDialog($00CF, $00)                          ;B39B2D
    %AICMD0x12_Jump(pAIScripting0x01_L114)                                   ;B39B31
pAIScripting0x01_L142:
    %AICMD0x1C_ShowDialog($023B, $00)                          ;B39B34
    %AICMD0x12_Jump(pAIScripting0x01_L114)                                   ;B39B38
pAIScripting0x01_L143:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 23, pAIScripting0x01_L146)         ;B39B3B
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 30, pAIScripting0x01_L147)         ;B39B42
    %AICMD0x17_RollRandom($02)                                            ;B39B49
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x01_L144)                                   ;B39B4B
    %AICMD0x18_JumpIfRandomEquals($01, pAIScripting0x01_L145)                                   ;B39B4F
    %AICMD0x12_Jump(pAIScripting0x01_L114)                                   ;B39B53
pAIScripting0x01_L144:
    %AICMD0x1C_ShowDialog($00CA, $00)                          ;B39B56
    %AICMD0x12_Jump(pAIScripting0x01_L114)                                   ;B39B5A
pAIScripting0x01_L145:
    %AICMD0x1C_ShowDialog($00D0, $00)                          ;B39B5D
    %AICMD0x12_Jump(pAIScripting0x01_L114)                                   ;B39B61
pAIScripting0x01_L146:
    %AICMD0x1C_ShowDialog($02B2, $00)                          ;B39B64
    %AICMD0x12_Jump(pAIScripting0x01_L114)                                   ;B39B68
pAIScripting0x01_L147:
    %AICMD0x1C_ShowDialog($03FB, $00)                          ;B39B6B
    %AICMD0x41_AddValue16(nLove_Ellen, 5)                      ;B39B6F
    %AICMD0x12_Jump(pAIScripting0x01_L114)                                   ;B39B75
pAIScripting0x01_L148:
    %AICMD0x1C_ShowDialog($00DB, $00)                          ;B39B78
    %AICMD0x12_Jump(pAIScripting0x01_L115)                                   ;B39B7C
pAIScripting0x01_L149:
    %AICMD0x1C_ShowDialog($00C9, $00)                          ;B39B7F
    %AICMD0x12_Jump(pAIScripting0x01_L115)                                   ;B39B83
pAIScripting0x01_L150:
    %AICMD0x1C_ShowDialog($0391, $00)                          ;B39B86
    %AICMD0x12_Jump(pAIScripting0x01_L114)                                   ;B39B8A
pAIScripting0x01_L151:
    %AICMD0x1C_ShowDialog($01EE, $00)                          ;B39B8D
    %AICMD0x12_Jump(pAIScripting0x01_L114)                                   ;B39B91
pAIScripting0x01_L152:
    %AICMD0x17_RollRandom($02)                                            ;B39B94
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x01_L167)                                   ;B39B96
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 17, 18, pAIScripting0x01_L167) ;B39B9A
    %AICMD0x1A($0188, $01F8, aAIScriptingData_L024, $03)                     ;B39BA2
    %AICMD0x22($20, $20, $01, aAIScriptingData_L025, $10)                    ;B39BAA
pAIScripting0x01_L153:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x01_L155)                                        ;B39BB1
    %AICMD0x2D_JumpOnInteract(pAIScripting0x01_L157, pAIScripting0x01_L161)                               ;B39BB4
    %AICMD0x12_Jump(pAIScripting0x01_L153)                                   ;B39BB9
pAIScripting0x01_L154:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x01_L155)                                        ;B39BBC
    %AICMD0x1F(pAIScripting0x01_L160)                                        ;B39BBF
    %AICMD0x12_Jump(pAIScripting0x01_L154)                                   ;B39BC2
pAIScripting0x01_L155:
    %AICMD0x45_JumpIfBetween16(nLove_Eve, 0, 249, pAIScripting0x01_L156)     ;B39BC5
    %AICMD0x1C_ShowDialog($0441, $00)                          ;B39BCF
    %AICMD0x12_Jump(pAIScripting0x01_L153)                                   ;B39BD3
pAIScripting0x01_L156:
    %AICMD0x1C_ShowDialog($017B, $00)                          ;B39BD6
    %AICMD0x12_Jump(pAIScripting0x01_L153)                                   ;B39BDA
pAIScripting0x01_L157:
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 17, 18, pAIScripting0x01_L166) ;B39BDD
    %AICMD0x17_RollRandom($02)                                            ;B39BE5
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x01_L158)                                   ;B39BE7
    %AICMD0x18_JumpIfRandomEquals($01, pAIScripting0x01_L159)                                   ;B39BEB
    %AICMD0x12_Jump(pAIScripting0x01_L153)                                   ;B39BEF
pAIScripting0x01_L158:
    %AICMD0x1C_ShowDialog($00E1, $00)                          ;B39BF2
    %AICMD0x12_Jump(pAIScripting0x01_L153)                                   ;B39BF6
pAIScripting0x01_L159:
    %AICMD0x1C_ShowDialog($00DF, $00)                          ;B39BF9
    %AICMD0x12_Jump(pAIScripting0x01_L154)                                   ;B39BFD
pAIScripting0x01_L160:
    %AICMD0x1C_ShowDialog($0404, $00)                          ;B39C00
    %AICMD0x12_Jump(pAIScripting0x01_L154)                                   ;B39C04
pAIScripting0x01_L161:
    %AICMD0x15_JumpIfEquals8($80091E, 2, pAIScripting0x01_L162)              ;B39C07
    %AICMD0x15_JumpIfEquals8($80091E, 7, pAIScripting0x01_L162)              ;B39C0E
    %AICMD0x16_JumpIfBetween8($80091E, 1, 5, pAIScripting0x01_L163)          ;B39C15
    %AICMD0x16_JumpIfBetween8($80091E, 16, 23, pAIScripting0x01_L163)        ;B39C1D
    %AICMD0x15_JumpIfEquals8($80091E, 73, pAIScripting0x01_L164)             ;B39C25
    %AICMD0x15_JumpIfEquals8($80091E, 25, pAIScripting0x01_L164)             ;B39C2C
    %AICMD0x15_JumpIfEquals8($80091E, 6, pAIScripting0x01_L164)              ;B39C33
    %AICMD0x16_JumpIfBetween8($80091E, 9, 12, pAIScripting0x01_L165)         ;B39C3A
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B39C42
    %AICMD0x12_Jump(pAIScripting0x01_L153)                                   ;B39C46
pAIScripting0x01_L162:
    %AICMD0x1C_ShowDialog($03B4, $00)                          ;B39C49
    %AICMD0x41_AddValue16(nLove_Eve, -8)                       ;B39C4D
    %AICMD0x12_Jump(pAIScripting0x01_L153)                                   ;B39C53
pAIScripting0x01_L163:
    %AICMD0x1C_ShowDialog($03B2, $00)                          ;B39C56
    %AICMD0x41_AddValue16(nLove_Eve, 5)                        ;B39C5A
    %AICMD0x12_Jump(pAIScripting0x01_L153)                                   ;B39C60
pAIScripting0x01_L164:
    %AICMD0x1C_ShowDialog($0212, $00)                          ;B39C63
    %AICMD0x41_AddValue16(nLove_Eve, 8)                        ;B39C67
    %AICMD0x12_Jump(pAIScripting0x01_L153)                                   ;B39C6D
pAIScripting0x01_L165:
    %AICMD0x1C_ShowDialog($03BA, $00)                          ;B39C70
    %AICMD0x41_AddValue16(nLove_Eve, -4)                       ;B39C74
    %AICMD0x12_Jump(pAIScripting0x01_L153)                                   ;B39C7A
pAIScripting0x01_L166:
    %AICMD0x1C_ShowDialog($0391, $00)                          ;B39C7D
    %AICMD0x12_Jump(pAIScripting0x01_L153)                                   ;B39C81
pAIScripting0x01_L167:
    %AICMD0x10_End()                                           ;B39C84
    %AICMD0x1A($01A8, $0328, aAIScriptingData_L136, $00)                     ;B39C85
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 0, pAIScripting0x01_L168)     ;B39C8D
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 1, pAIScripting0x01_L169)     ;B39C94
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 2, pAIScripting0x01_L170)     ;B39C9B
    %AICMD0x12_Jump(pAIScripting0x01_L171)                                   ;B39CA2
pAIScripting0x01_L168:
    %AICMD0x1B($03DA, $00)                                     ;B39CA5
    %AICMD0x13_Wait(180)                                       ;B39CA9
    %AICMD0x1B($03D9, $00)                                     ;B39CAC
    %AICMD0x13_Wait(240)                                       ;B39CB0
    %AICMD0x12_Jump(pAIScripting0x01_L168)                                   ;B39CB3
pAIScripting0x01_L169:
    %AICMD0x1B($03DA, $00)                                     ;B39CB6
    %AICMD0x13_Wait(180)                                       ;B39CBA
    %AICMD0x1B($03DB, $00)                                     ;B39CBD
    %AICMD0x13_Wait(370)                                       ;B39CC1
    %AICMD0x1B($03D9, $00)                                     ;B39CC4
    %AICMD0x13_Wait(180)                                       ;B39CC8
    %AICMD0x1B($03DA, $00)                                     ;B39CCB
    %AICMD0x13_Wait(360)                                       ;B39CCF
    %AICMD0x12_Jump(pAIScripting0x01_L169)                                   ;B39CD2
pAIScripting0x01_L170:
    %AICMD0x13_Wait(240)                                       ;B39CD5
    %AICMD0x1B($03DA, $01)                                     ;B39CD8
    %AICMD0x13_Wait(90)                                        ;B39CDC
    %AICMD0x12_Jump(pAIScripting0x01_L170)                                   ;B39CDF
pAIScripting0x01_L171:
    %AICMD0x13_Wait(1)                                         ;B39CE2
    %AICMD0x12_Jump(pAIScripting0x01_L171)                                   ;B39CE5
pAIScripting0x01_L172:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $00, pAIScripting0x01_L173)   ;B39CE8
    %AICMD0x10_End()                                           ;B39CEF
pAIScripting0x01_L173:
    %AICMD0x1A($0198, $0368, aAIScriptingData_L015, $00)                     ;B39CF0
pAIScripting0x01_L174:
    %AICMD0x1F(pAIScripting0x01_L175)                                        ;B39CF8
    %AICMD0x12_Jump(pAIScripting0x01_L174)                                   ;B39CFB
pAIScripting0x01_L175:
    %AICMD0x1C_ShowDialog($013F, $00)                          ;B39CFE
    %AICMD0x12_Jump(pAIScripting0x01_L174)                                   ;B39D02


DATA8_B39D05:
 
    %AICMD0x11_EnableUserControl()                             ;B39D05
    %AICMD0x09_StartScript($01, pAIScripting0x01_L177)                                   ;B39D06
    %AICMD0x09_StartScript($02, pAIScripting0x01_L199)                                   ;B39D0A
pAIScripting0x01_L176:
    %AICMD0x13_Wait(1)                                         ;B39D0E
    %AICMD0x12_Jump(pAIScripting0x01_L176)                                   ;B39D11
pAIScripting0x01_L177:
    %AICMD0x1A($00A8, $0078, aAIScriptingData_L044, $00)                     ;B39D14
    %AICMD0x22($20, $10, $01, aAIScriptingData_L045, $14)                    ;B39D1C
pAIScripting0x01_L178:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x01_L181)                                        ;B39D23
    %AICMD0x2D_JumpOnInteract(pAIScripting0x01_L184, pAIScripting0x01_L182)                               ;B39D26
    %AICMD0x12_Jump(pAIScripting0x01_L178)                                   ;B39D2B
pAIScripting0x01_L179:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x01_L181)                                        ;B39D2E
    %AICMD0x2D_JumpOnInteract(pAIScripting0x01_L188, pAIScripting0x01_L182)                               ;B39D31
    %AICMD0x12_Jump(pAIScripting0x01_L179)                                   ;B39D36
pAIScripting0x01_L180:
    %AICMD0x2D_JumpOnInteract(pAIScripting0x01_L196, pAIScripting0x01_L182)                               ;B39D39
    %AICMD0x12_Jump(pAIScripting0x01_L180)                                   ;B39D3E
pAIScripting0x01_L181:
    %AICMD0x1C_ShowDialog($01C9, $00)                          ;B39D41
    %AICMD0x12_Jump(pAIScripting0x01_L178)                                   ;B39D45
pAIScripting0x01_L182:
    %AICMD0x16_JumpIfBetween8($80091E, 9, 12, pAIScripting0x01_L183)         ;B39D48
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B39D50
    %AICMD0x12_Jump(pAIScripting0x01_L178)                                   ;B39D54
pAIScripting0x01_L183:
    %AICMD0x1C_ShowDialog($03B8, $00)                          ;B39D57
    %AICMD0x12_Jump(pAIScripting0x01_L178)                                   ;B39D5B
pAIScripting0x01_L184:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event4, $0C, pAIScripting0x01_L196)   ;B39D5E
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $00, pAIScripting0x01_L197)   ;B39D65
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $01, pAIScripting0x01_L185)   ;B39D6C
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, pAIScripting0x01_L185)   ;B39D73
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $03, pAIScripting0x01_L185)   ;B39D7A
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $04, pAIScripting0x01_L185)   ;B39D81
    %AICMD0x45_JumpIfBetween16(nLove_Maria, 200, 300, pAIScripting0x01_L198) ;B39D88
pAIScripting0x01_L185:
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 0, pAIScripting0x01_L189)     ;B39D92
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 2, pAIScripting0x01_L190)     ;B39D99
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, pAIScripting0x01_L191)     ;B39DA0
pAIScripting0x01_L186:
    %AICMD0x17_RollRandom($02)                                            ;B39DA7
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x01_L187)                                   ;B39DA9
    %AICMD0x18_JumpIfRandomEquals($01, pAIScripting0x01_L188)                                   ;B39DAD
    %AICMD0x12_Jump(pAIScripting0x01_L178)                                   ;B39DB1
pAIScripting0x01_L187:
    %AICMD0x1C_ShowDialog($0035, $00)                          ;B39DB4
    %AICMD0x12_Jump(pAIScripting0x01_L178)                                   ;B39DB8
pAIScripting0x01_L188:
    %AICMD0x1C_ShowDialog($0036, $00)                          ;B39DBB
    %AICMD0x12_Jump(pAIScripting0x01_L179)                                   ;B39DBF
pAIScripting0x01_L189:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 22, pAIScripting0x01_L192)         ;B39DC2
    %AICMD0x12_Jump(pAIScripting0x01_L186)                                   ;B39DC9
pAIScripting0x01_L190:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 11, pAIScripting0x01_L193)         ;B39DCC
    %AICMD0x12_Jump(pAIScripting0x01_L186)                                   ;B39DD3
pAIScripting0x01_L191:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 23, pAIScripting0x01_L194)         ;B39DD6
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 30, pAIScripting0x01_L195)         ;B39DDD
    %AICMD0x12_Jump(pAIScripting0x01_L186)                                   ;B39DE4
pAIScripting0x01_L192:
    %AICMD0x1C_ShowDialog($020B, $00)                          ;B39DE7
    %AICMD0x12_Jump(pAIScripting0x01_L178)                                   ;B39DEB
pAIScripting0x01_L193:
    %AICMD0x1C_ShowDialog($023D, $00)                          ;B39DEE
    %AICMD0x12_Jump(pAIScripting0x01_L178)                                   ;B39DF2
pAIScripting0x01_L194:
    %AICMD0x1C_ShowDialog($02AD, $00)                          ;B39DF5
    %AICMD0x12_Jump(pAIScripting0x01_L178)                                   ;B39DF9
pAIScripting0x01_L195:
    %AICMD0x1C_ShowDialog($03EC, $00)                          ;B39DFC
    %AICMD0x41_AddValue16(nPlayerHappiness, 5)                 ;B39E00
    %AICMD0x12_Jump(pAIScripting0x01_L178)                                   ;B39E06
pAIScripting0x01_L196:
    %AICMD0x1C_ShowDialog($01CD, $00)                          ;B39E09
    %AICMD0x12_Jump(pAIScripting0x01_L178)                                   ;B39E0D
pAIScripting0x01_L197:
    %AICMD0x17_RollRandom($02)                                            ;B39E10
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x01_L185)                                   ;B39E12
    %AICMD0x1C_ShowDialog($03C0, $00)                          ;B39E16
    %AICMD0x12_Jump(pAIScripting0x01_L178)                                   ;B39E1A
pAIScripting0x01_L198:
    %AICMD0x17_RollRandom($02)                                            ;B39E1D
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x01_L185)                                   ;B39E1F
    %AICMD0x1C_ShowDialog($03BF, $00)                          ;B39E23
    %AICMD0x12_Jump(pAIScripting0x01_L178)                                   ;B39E27
pAIScripting0x01_L199:
    %AICMD0x1A($0188, $00A0, aAIScriptingData_L061, $00)                     ;B39E2A
pAIScripting0x01_L200:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x01_L203)                                        ;B39E32
    %AICMD0x2D_JumpOnInteract(pAIScripting0x01_L206, pAIScripting0x01_L204)                               ;B39E35
    %AICMD0x12_Jump(pAIScripting0x01_L200)                                   ;B39E3A
pAIScripting0x01_L201:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x01_L203)                                        ;B39E3D
    %AICMD0x1F(pAIScripting0x01_L210)                                        ;B39E40
    %AICMD0x12_Jump(pAIScripting0x01_L201)                                   ;B39E43
pAIScripting0x01_L202:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x01_L203)                                        ;B39E46
    %AICMD0x2D_JumpOnInteract(pAIScripting0x01_L218, pAIScripting0x01_L204)                               ;B39E49
    %AICMD0x12_Jump(pAIScripting0x01_L202)                                   ;B39E4E
pAIScripting0x01_L203:
    %AICMD0x1C_ShowDialog($01C6, $00)                          ;B39E51
    %AICMD0x12_Jump(pAIScripting0x01_L200)                                   ;B39E55
pAIScripting0x01_L204:
    %AICMD0x16_JumpIfBetween8($80091E, 9, 12, pAIScripting0x01_L205)         ;B39E58
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B39E60
    %AICMD0x12_Jump(pAIScripting0x01_L200)                                   ;B39E64
pAIScripting0x01_L205:
    %AICMD0x1C_ShowDialog($03B9, $00)                          ;B39E67
    %AICMD0x12_Jump(pAIScripting0x01_L200)                                   ;B39E6B
pAIScripting0x01_L206:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event4, $0C, pAIScripting0x01_L218)   ;B39E6E
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $00, pAIScripting0x01_L219)   ;B39E75
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $01, pAIScripting0x01_L207)   ;B39E7C
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, pAIScripting0x01_L207)   ;B39E83
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $03, pAIScripting0x01_L207)   ;B39E8A
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $04, pAIScripting0x01_L207)   ;B39E91
    %AICMD0x45_JumpIfBetween16(nLove_Maria, 200, 300, pAIScripting0x01_L220) ;B39E98
pAIScripting0x01_L207:
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 0, pAIScripting0x01_L211)     ;B39EA2
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 2, pAIScripting0x01_L212)     ;B39EA9
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, pAIScripting0x01_L213)     ;B39EB0
pAIScripting0x01_L208:
    %AICMD0x17_RollRandom($02)                                            ;B39EB7
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x01_L209)                                   ;B39EB9
    %AICMD0x18_JumpIfRandomEquals($01, pAIScripting0x01_L210)                                   ;B39EBD
    %AICMD0x12_Jump(pAIScripting0x01_L200)                                   ;B39EC1
pAIScripting0x01_L209:
    %AICMD0x1C_ShowDialog($003A, $00)                          ;B39EC4
    %AICMD0x12_Jump(pAIScripting0x01_L200)                                   ;B39EC8
pAIScripting0x01_L210:
    %AICMD0x1C_ShowDialog($003B, $00)                          ;B39ECB
    %AICMD0x12_Jump(pAIScripting0x01_L201)                                   ;B39ECF
pAIScripting0x01_L211:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 22, pAIScripting0x01_L214)         ;B39ED2
    %AICMD0x12_Jump(pAIScripting0x01_L208)                                   ;B39ED9
pAIScripting0x01_L212:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 11, pAIScripting0x01_L215)         ;B39EDC
    %AICMD0x12_Jump(pAIScripting0x01_L208)                                   ;B39EE3
pAIScripting0x01_L213:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 23, pAIScripting0x01_L216)         ;B39EE6
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 30, pAIScripting0x01_L217)         ;B39EED
    %AICMD0x1C_ShowDialog($003F, $00)                          ;B39EF4
    %AICMD0x12_Jump(pAIScripting0x01_L200)                                   ;B39EF8
pAIScripting0x01_L214:
    %AICMD0x1C_ShowDialog($0202, $00)                          ;B39EFB
    %AICMD0x12_Jump(pAIScripting0x01_L200)                                   ;B39EFF
pAIScripting0x01_L215:
    %AICMD0x1C_ShowDialog($023E, $00)                          ;B39F02
    %AICMD0x12_Jump(pAIScripting0x01_L200)                                   ;B39F06
pAIScripting0x01_L216:
    %AICMD0x1C_ShowDialog($02AE, $00)                          ;B39F09
    %AICMD0x12_Jump(pAIScripting0x01_L200)                                   ;B39F0D
pAIScripting0x01_L217:
    %AICMD0x1C_ShowDialog($03ED, $00)                          ;B39F10
    %AICMD0x41_AddValue16(nPlayerHappiness, 5)                 ;B39F14
    %AICMD0x12_Jump(pAIScripting0x01_L200)                                   ;B39F1A
pAIScripting0x01_L218:
    %AICMD0x1C_ShowDialog($01CE, $00)                          ;B39F1D
    %AICMD0x12_Jump(pAIScripting0x01_L202)                                   ;B39F21
pAIScripting0x01_L219:
    %AICMD0x17_RollRandom($02)                                            ;B39F24
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x01_L207)                                   ;B39F26
    %AICMD0x1C_ShowDialog($03C2, $00)                          ;B39F2A
    %AICMD0x12_Jump(pAIScripting0x01_L200)                                   ;B39F2E
pAIScripting0x01_L220:
    %AICMD0x17_RollRandom($02)                                            ;B39F31
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x01_L207)                                   ;B39F33
    %AICMD0x1C_ShowDialog($03C1, $00)                          ;B39F37
    %AICMD0x12_Jump(pAIScripting0x01_L200)                                   ;B39F3B


DATA8_B39F3E:
 
    %AICMD0x11_EnableUserControl()                             ;B39F3E
    %AICMD0x09_StartScript($01, pAIScripting0x01_L222)                                   ;B39F3F
pAIScripting0x01_L221:
    %AICMD0x13_Wait(1)                                         ;B39F43
    %AICMD0x12_Jump(pAIScripting0x01_L221)                                   ;B39F46
pAIScripting0x01_L222:
    %AICMD0x1A($0068, $00E8, aAIScriptingData_L051, $00)                     ;B39F49
pAIScripting0x01_L223:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x01_L227)                                        ;B39F51
    %AICMD0x2D_JumpOnInteract(pAIScripting0x01_L230, pAIScripting0x01_L228)                               ;B39F54
    %AICMD0x12_Jump(pAIScripting0x01_L223)                                   ;B39F59
pAIScripting0x01_L224:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x01_L227)                                        ;B39F5C
    %AICMD0x2D_JumpOnInteract(pAIScripting0x01_L230, pAIScripting0x01_L228)                               ;B39F5F
    %AICMD0x12_Jump(pAIScripting0x01_L224)                                   ;B39F64
pAIScripting0x01_L225:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x01_L227)                                        ;B39F67
    %AICMD0x2D_JumpOnInteract(pAIScripting0x01_L230, pAIScripting0x01_L228)                               ;B39F6A
    %AICMD0x12_Jump(pAIScripting0x01_L225)                                   ;B39F6F
pAIScripting0x01_L226:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x01_L227)                                        ;B39F72
    %AICMD0x2D_JumpOnInteract(pAIScripting0x01_L244, pAIScripting0x01_L228)                               ;B39F75
    %AICMD0x12_Jump(pAIScripting0x01_L226)                                   ;B39F7A
pAIScripting0x01_L227:
    %AICMD0x1C_ShowDialog($01E0, $00)                          ;B39F7D
    %AICMD0x12_Jump(pAIScripting0x01_L223)                                   ;B39F81
pAIScripting0x01_L228:
    %AICMD0x16_JumpIfBetween8($80091E, 9, 12, pAIScripting0x01_L229)         ;B39F84
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B39F8C
    %AICMD0x12_Jump(pAIScripting0x01_L223)                                   ;B39F90
pAIScripting0x01_L229:
    %AICMD0x1C_ShowDialog($03B0, $00)                          ;B39F93
    %AICMD0x12_Jump(pAIScripting0x01_L223)                                   ;B39F97
pAIScripting0x01_L230:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event4, $0C, pAIScripting0x01_L244)   ;B39F9A
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 0, pAIScripting0x01_L236)     ;B39FA1
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 2, pAIScripting0x01_L237)     ;B39FA8
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, pAIScripting0x01_L241)     ;B39FAF
pAIScripting0x01_L231:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $00, pAIScripting0x01_L245)   ;B39FB6
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $01, pAIScripting0x01_L245)   ;B39FBD
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, pAIScripting0x01_L245)   ;B39FC4
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $03, pAIScripting0x01_L245)   ;B39FCB
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $04, pAIScripting0x01_L245)   ;B39FD2
pAIScripting0x01_L232:
    %AICMD0x17_RollRandom($04)                                            ;B39FD9
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x01_L235)                                   ;B39FDB
    %AICMD0x17_RollRandom($02)                                            ;B39FDF
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x01_L233)                                   ;B39FE1
    %AICMD0x18_JumpIfRandomEquals($01, pAIScripting0x01_L234)                                   ;B39FE5
    %AICMD0x12_Jump(pAIScripting0x01_L223)                                   ;B39FE9
pAIScripting0x01_L233:
    %AICMD0x1C_ShowDialog($0057, $00)                          ;B39FEC
    %AICMD0x12_Jump(pAIScripting0x01_L223)                                   ;B39FF0
pAIScripting0x01_L234:
    %AICMD0x1C_ShowDialog($0058, $00)                          ;B39FF3
    %AICMD0x12_Jump(pAIScripting0x01_L224)                                   ;B39FF7
pAIScripting0x01_L235:
    %AICMD0x1C_ShowDialog($03CB, $00)                          ;B39FFA
    %AICMD0x12_Jump(pAIScripting0x01_L225)                                   ;B39FFE
pAIScripting0x01_L236:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 22, pAIScripting0x01_L238)         ;B3A001
    %AICMD0x17_RollRandom($02)                                            ;B3A008
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x01_L231)                                   ;B3A00A
    %AICMD0x18_JumpIfRandomEquals($01, pAIScripting0x01_L232)                                   ;B3A00E
    %AICMD0x12_Jump(pAIScripting0x01_L232)                                   ;B3A012
pAIScripting0x01_L237:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 11, pAIScripting0x01_L239)         ;B3A015
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 19, pAIScripting0x01_L240)         ;B3A01C
    %AICMD0x17_RollRandom($02)                                            ;B3A023
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x01_L231)                                   ;B3A025
    %AICMD0x18_JumpIfRandomEquals($01, pAIScripting0x01_L232)                                   ;B3A029
    %AICMD0x12_Jump(pAIScripting0x01_L232)                                   ;B3A02D
pAIScripting0x01_L238:
    %AICMD0x1C_ShowDialog($0205, $00)                          ;B3A030
    %AICMD0x12_Jump(pAIScripting0x01_L223)                                   ;B3A034
pAIScripting0x01_L239:
    %AICMD0x1C_ShowDialog($03DC, $00)                          ;B3A037
    %AICMD0x12_Jump(pAIScripting0x01_L223)                                   ;B3A03B
pAIScripting0x01_L240:
    %AICMD0x1C_ShowDialog($03DC, $00)                          ;B3A03E
    %AICMD0x12_Jump(pAIScripting0x01_L223)                                   ;B3A042
pAIScripting0x01_L241:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 23, pAIScripting0x01_L242)         ;B3A045
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 30, pAIScripting0x01_L243)         ;B3A04C
    %AICMD0x17_RollRandom($02)                                            ;B3A053
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x01_L231)                                   ;B3A055
    %AICMD0x18_JumpIfRandomEquals($01, pAIScripting0x01_L232)                                   ;B3A059
    %AICMD0x12_Jump(pAIScripting0x01_L232)                                   ;B3A05D
pAIScripting0x01_L242:
    %AICMD0x1C_ShowDialog($0405, $00)                          ;B3A060
    %AICMD0x12_Jump(pAIScripting0x01_L223)                                   ;B3A064
pAIScripting0x01_L243:
    %AICMD0x1C_ShowDialog($03F0, $00)                          ;B3A067
    %AICMD0x41_AddValue16(nPlayerHappiness, 5)                 ;B3A06B
    %AICMD0x12_Jump(pAIScripting0x01_L223)                                   ;B3A071
pAIScripting0x01_L244:
    %AICMD0x1C_ShowDialog($01CF, $00)                          ;B3A074
    %AICMD0x12_Jump(pAIScripting0x01_L225)                                   ;B3A078
pAIScripting0x01_L245:
    %AICMD0x17_RollRandom($02)                                            ;B3A07B
    %AICMD0x17_RollRandom($00)                                            ;B3A07D
    %AICMD0x1C_ShowDialog($03CC, $00)                          ;B3A07F
    %AICMD0x12_Jump(pAIScripting0x01_L223)                                   ;B3A083


DATA8_B3A086:
 
    %AICMD0x11_EnableUserControl()                             ;B3A086
    %AICMD0x09_StartScript($01, pAIScripting0x01_L247)                                   ;B3A087
pAIScripting0x01_L246:
    %AICMD0x13_Wait(1)                                         ;B3A08B
    %AICMD0x12_Jump(pAIScripting0x01_L246)                                   ;B3A08E
pAIScripting0x01_L247:
    %AICMD0x1A($0028, $0168, aAIScriptingData_L064, $02)                     ;B3A091
pAIScripting0x01_L248:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x01_L249)                                        ;B3A099
    %AICMD0x2D_JumpOnInteract(pAIScripting0x01_L252, pAIScripting0x01_L250)                               ;B3A09C
    %AICMD0x12_Jump(pAIScripting0x01_L248)                                   ;B3A0A1
pAIScripting0x01_L249:
    %AICMD0x1C_ShowDialog($01C6, $00)                          ;B3A0A4
    %AICMD0x12_Jump(pAIScripting0x01_L248)                                   ;B3A0A8
pAIScripting0x01_L250:
    %AICMD0x16_JumpIfBetween8($80091E, 9, 12, pAIScripting0x01_L251)         ;B3A0AB
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3A0B3
    %AICMD0x1B($02D0, $01)                                     ;B3A0B7
    %AICMD0x12_Jump(pAIScripting0x01_L248)                                   ;B3A0BB
pAIScripting0x01_L251:
    %AICMD0x1C_ShowDialog($03B9, $00)                          ;B3A0BE
    %AICMD0x1B($02D0, $01)                                     ;B3A0C2
    %AICMD0x12_Jump(pAIScripting0x01_L248)                                   ;B3A0C6
pAIScripting0x01_L252:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, pAIScripting0x01_L260)   ;B3A0C9
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 0, pAIScripting0x01_L253)     ;B3A0D0
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 1, pAIScripting0x01_L254)     ;B3A0D7
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 2, pAIScripting0x01_L255)     ;B3A0DE
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, pAIScripting0x01_L257)     ;B3A0E5
    %AICMD0x12_Jump(pAIScripting0x01_L248)                                   ;B3A0EC
pAIScripting0x01_L253:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 22, pAIScripting0x01_L256)         ;B3A0EF
    %AICMD0x1C_ShowDialog($0046, $00)                          ;B3A0F6
    %AICMD0x1B($02D0, $01)                                     ;B3A0FA
    %AICMD0x12_Jump(pAIScripting0x01_L248)                                   ;B3A0FE
pAIScripting0x01_L254:
    %AICMD0x1C_ShowDialog($0047, $00)                          ;B3A101
    %AICMD0x1B($02D0, $01)                                     ;B3A105
    %AICMD0x12_Jump(pAIScripting0x01_L248)                                   ;B3A109
pAIScripting0x01_L255:
    %AICMD0x1C_ShowDialog($03C5, $00)                          ;B3A10C
    %AICMD0x1B($02D0, $01)                                     ;B3A110
    %AICMD0x12_Jump(pAIScripting0x01_L248)                                   ;B3A114
pAIScripting0x01_L256:
    %AICMD0x1C_ShowDialog($0203, $00)                          ;B3A117
    %AICMD0x1B($02D0, $01)                                     ;B3A11B
    %AICMD0x12_Jump(pAIScripting0x01_L248)                                   ;B3A11F
pAIScripting0x01_L257:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 23, pAIScripting0x01_L258)         ;B3A122
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 30, pAIScripting0x01_L259)         ;B3A129
    %AICMD0x1C_ShowDialog($0047, $00)                          ;B3A130
    %AICMD0x1B($02D0, $01)                                     ;B3A134
    %AICMD0x12_Jump(pAIScripting0x01_L248)                                   ;B3A138
pAIScripting0x01_L258:
    %AICMD0x1C_ShowDialog($02AE, $00)                          ;B3A13B
    %AICMD0x1B($02D0, $01)                                     ;B3A13F
    %AICMD0x12_Jump(pAIScripting0x01_L248)                                   ;B3A143
pAIScripting0x01_L259:
    %AICMD0x1C_ShowDialog($03EF, $00)                          ;B3A146
    %AICMD0x1B($02D0, $01)                                     ;B3A14A
    %AICMD0x41_AddValue16(nPlayerHappiness, 5)                 ;B3A14E
    %AICMD0x12_Jump(pAIScripting0x01_L248)                                   ;B3A154
pAIScripting0x01_L260:
    %AICMD0x1C_ShowDialog($03C6, $00)                          ;B3A157
    %AICMD0x1B($02D0, $01)                                     ;B3A15B
    %AICMD0x12_Jump(pAIScripting0x01_L248)                                   ;B3A15F


DATA8_B3A162:
 
    %AICMD0x11_EnableUserControl()                             ;B3A162
    %AICMD0x09_StartScript($01, pAIScripting0x01_L264)                                   ;B3A163
    %AICMD0x12_Jump(pAIScripting0x01_L262)                                   ;B3A167
pAIScripting0x01_L261:
    %AICMD0x13_Wait(1)                                         ;B3A16A
    %AICMD0x12_Jump(pAIScripting0x01_L261)                                   ;B3A16D
pAIScripting0x01_L262:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $01, pAIScripting0x01_L263)   ;B3A170
    %AICMD0x09_StartScript($02, pAIScripting0x01_L281)                                   ;B3A177
pAIScripting0x01_L263:
    %AICMD0x12_Jump(pAIScripting0x01_L261)                                   ;B3A17B
pAIScripting0x01_L264:
    %AICMD0x1A($0028, $0168, aAIScriptingData_L046, $02)                     ;B3A17E
pAIScripting0x01_L265:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x01_L267)                                        ;B3A186
    %AICMD0x2D_JumpOnInteract(pAIScripting0x01_L270, pAIScripting0x01_L268)                               ;B3A189
    %AICMD0x12_Jump(pAIScripting0x01_L265)                                   ;B3A18E
pAIScripting0x01_L266:
    %AICMD0x1F(pAIScripting0x01_L280)                                        ;B3A191
    %AICMD0x12_Jump(pAIScripting0x01_L266)                                   ;B3A194
pAIScripting0x01_L267:
    %AICMD0x1C_ShowDialog($01CA, $00)                          ;B3A197
    %AICMD0x12_Jump(pAIScripting0x01_L265)                                   ;B3A19B
pAIScripting0x01_L268:
    %AICMD0x16_JumpIfBetween8($80091E, 9, 12, pAIScripting0x01_L269)         ;B3A19E
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3A1A6
    %AICMD0x1B($029A, $01)                                     ;B3A1AA
    %AICMD0x12_Jump(pAIScripting0x01_L265)                                   ;B3A1AE
pAIScripting0x01_L269:
    %AICMD0x1C_ShowDialog($0049, $00)                          ;B3A1B1
    %AICMD0x1B($029A, $01)                                     ;B3A1B5
    %AICMD0x12_Jump(pAIScripting0x01_L265)                                   ;B3A1B9
pAIScripting0x01_L270:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event4, $0E, pAIScripting0x01_L280)   ;B3A1BC
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $01, pAIScripting0x01_L279)   ;B3A1C3
    %AICMD0x45_JumpIfBetween16(nLove_Ann, 200, 300, pAIScripting0x01_L278)   ;B3A1CA
pAIScripting0x01_L271:
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 0, pAIScripting0x01_L272)     ;B3A1D4
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 1, pAIScripting0x01_L273)     ;B3A1DB
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 2, pAIScripting0x01_L274)     ;B3A1E2
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, pAIScripting0x01_L276)     ;B3A1E9
pAIScripting0x01_L272:
    %AICMD0x1C_ShowDialog($0041, $00)                          ;B3A1F0
    %AICMD0x1B($029A, $01)                                     ;B3A1F4
    %AICMD0x12_Jump(pAIScripting0x01_L265)                                   ;B3A1F8
pAIScripting0x01_L273:
    %AICMD0x1C_ShowDialog($0040, $00)                          ;B3A1FB
    %AICMD0x1B($029A, $01)                                     ;B3A1FF
    %AICMD0x12_Jump(pAIScripting0x01_L265)                                   ;B3A203
pAIScripting0x01_L274:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 11, pAIScripting0x01_L275)         ;B3A206
    %AICMD0x1C_ShowDialog($0040, $00)                          ;B3A20D
    %AICMD0x1B($029A, $01)                                     ;B3A211
    %AICMD0x12_Jump(pAIScripting0x01_L265)                                   ;B3A215
pAIScripting0x01_L275:
    %AICMD0x1C_ShowDialog($03DC, $00)                          ;B3A218
    %AICMD0x1B($029A, $01)                                     ;B3A21C
    %AICMD0x12_Jump(pAIScripting0x01_L265)                                   ;B3A220
pAIScripting0x01_L276:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 30, pAIScripting0x01_L277)         ;B3A223
    %AICMD0x1C_ShowDialog($0416, $00)                          ;B3A22A
    %AICMD0x1B($029A, $01)                                     ;B3A22E
    %AICMD0x12_Jump(pAIScripting0x01_L265)                                   ;B3A232
pAIScripting0x01_L277:
    %AICMD0x1C_ShowDialog($03EE, $00)                          ;B3A235
    %AICMD0x1B($029A, $01)                                     ;B3A239
    %AICMD0x41_AddValue16(nPlayerHappiness, 5)                 ;B3A23D
    %AICMD0x12_Jump(pAIScripting0x01_L265)                                   ;B3A243
pAIScripting0x01_L278:
    %AICMD0x17_RollRandom($02)                                            ;B3A246
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x01_L271)                                   ;B3A248
    %AICMD0x1C_ShowDialog($03C3, $00)                          ;B3A24C
    %AICMD0x1B($029A, $01)                                     ;B3A250
    %AICMD0x12_Jump(pAIScripting0x01_L265)                                   ;B3A254
pAIScripting0x01_L279:
    %AICMD0x1C_ShowDialog($03C4, $00)                          ;B3A257
    %AICMD0x1B($029A, $01)                                     ;B3A25B
    %AICMD0x12_Jump(pAIScripting0x01_L265)                                   ;B3A25F
pAIScripting0x01_L280:
    %AICMD0x1C_ShowDialog($01DC, $00)                          ;B3A262
    %AICMD0x1B($029A, $01)                                     ;B3A266
    %AICMD0x12_Jump(pAIScripting0x01_L266)                                   ;B3A26A
pAIScripting0x01_L281:
    %AICMD0x1A($0098, $0198, aAIScriptingData_L017, $00)                     ;B3A26D
pAIScripting0x01_L282:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x01_L285)                                        ;B3A275
    %AICMD0x2D_JumpOnInteract(pAIScripting0x01_L292, pAIScripting0x01_L287)                               ;B3A278
    %AICMD0x12_Jump(pAIScripting0x01_L282)                                   ;B3A27D
pAIScripting0x01_L283:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x01_L285)                                        ;B3A280
    %AICMD0x1F(pAIScripting0x01_L313)                                        ;B3A283
    %AICMD0x12_Jump(pAIScripting0x01_L283)                                   ;B3A286
pAIScripting0x01_L284:
    %AICMD0x1F(pAIScripting0x01_L314)                                        ;B3A289
    %AICMD0x12_Jump(pAIScripting0x01_L284)                                   ;B3A28C
pAIScripting0x01_L285:
    %AICMD0x45_JumpIfBetween16(nLove_Ann, 0, 249, pAIScripting0x01_L286)     ;B3A28F
    %AICMD0x1C_ShowDialog($043E, $00)                          ;B3A299
    %AICMD0x12_Jump(pAIScripting0x01_L282)                                   ;B3A29D
pAIScripting0x01_L286:
    %AICMD0x1C_ShowDialog($0176, $00)                          ;B3A2A0
    %AICMD0x12_Jump(pAIScripting0x01_L282)                                   ;B3A2A4
pAIScripting0x01_L287:
    %AICMD0x15_JumpIfEquals8($80091E, 2, pAIScripting0x01_L288)              ;B3A2A7
    %AICMD0x16_JumpIfBetween8($80091E, 1, 7, pAIScripting0x01_L289)          ;B3A2AE
    %AICMD0x16_JumpIfBetween8($80091E, 16, 23, pAIScripting0x01_L289)        ;B3A2B6
    %AICMD0x15_JumpIfEquals8($80091E, 6, pAIScripting0x01_L289)              ;B3A2BE
    %AICMD0x15_JumpIfEquals8($80091E, 25, pAIScripting0x01_L290)             ;B3A2C5
    %AICMD0x15_JumpIfEquals8($80091E, 73, pAIScripting0x01_L290)             ;B3A2CC
    %AICMD0x16_JumpIfBetween8($80091E, 9, 12, pAIScripting0x01_L291)         ;B3A2D3
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3A2DB
    %AICMD0x12_Jump(pAIScripting0x01_L282)                                   ;B3A2DF
pAIScripting0x01_L288:
    %AICMD0x1C_ShowDialog($03B4, $00)                          ;B3A2E2
    %AICMD0x41_AddValue16(nLove_Ann, -8)                       ;B3A2E6
    %AICMD0x12_Jump(pAIScripting0x01_L282)                                   ;B3A2EC
pAIScripting0x01_L289:
    %AICMD0x1C_ShowDialog($03B2, $00)                          ;B3A2EF
    %AICMD0x41_AddValue16(nLove_Ann, 6)                        ;B3A2F3
    %AICMD0x12_Jump(pAIScripting0x01_L282)                                   ;B3A2F9
pAIScripting0x01_L290:
    %AICMD0x1C_ShowDialog($0212, $00)                          ;B3A2FC
    %AICMD0x41_AddValue16(nLove_Ann, 2)                        ;B3A300
    %AICMD0x12_Jump(pAIScripting0x01_L282)                                   ;B3A306
pAIScripting0x01_L291:
    %AICMD0x1C_ShowDialog($03B4, $00)                          ;B3A309
    %AICMD0x41_AddValue16(nLove_Ann, -2)                       ;B3A30D
    %AICMD0x12_Jump(pAIScripting0x01_L282)                                   ;B3A313
pAIScripting0x01_L292:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event4, $0E, pAIScripting0x01_L314)   ;B3A316
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 0, pAIScripting0x01_L293)     ;B3A31D
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 1, pAIScripting0x01_L297)     ;B3A324
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 2, pAIScripting0x01_L302)     ;B3A32B
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, pAIScripting0x01_L306)     ;B3A332
    %AICMD0x12_Jump(pAIScripting0x01_L282)                                   ;B3A339
pAIScripting0x01_L293:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 22, pAIScripting0x01_L296)         ;B3A33C
    %AICMD0x17_RollRandom($02)                                            ;B3A343
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x01_L294)                                   ;B3A345
    %AICMD0x18_JumpIfRandomEquals($01, pAIScripting0x01_L295)                                   ;B3A349
    %AICMD0x12_Jump(pAIScripting0x01_L282)                                   ;B3A34D
pAIScripting0x01_L294:
    %AICMD0x1C_ShowDialog($0096, $00)                          ;B3A350
    %AICMD0x12_Jump(pAIScripting0x01_L282)                                   ;B3A354
pAIScripting0x01_L295:
    %AICMD0x1C_ShowDialog($009E, $00)                          ;B3A357
    %AICMD0x12_Jump(pAIScripting0x01_L282)                                   ;B3A35B
pAIScripting0x01_L296:
    %AICMD0x1C_ShowDialog($0207, $00)                          ;B3A35E
    %AICMD0x12_Jump(pAIScripting0x01_L282)                                   ;B3A362
pAIScripting0x01_L297:
    %AICMD0x17_RollRandom($02)                                            ;B3A365
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x01_L298)                                   ;B3A367
    %AICMD0x18_JumpIfRandomEquals($01, pAIScripting0x01_L301)                                   ;B3A36B
    %AICMD0x12_Jump(pAIScripting0x01_L282)                                   ;B3A36F
pAIScripting0x01_L298:
    %AICMD0x1D_ShowDialog($0097, $00)                          ;B3A372
    %AICMD0x20_JumpIfChoice(0, pAIScripting0x01_L299)                        ;B3A376
    %AICMD0x20_JumpIfChoice(1, pAIScripting0x01_L300)                        ;B3A37A
    %AICMD0x12_Jump(pAIScripting0x01_L282)                                   ;B3A37E
pAIScripting0x01_L299:
    %AICMD0x1C_ShowDialog($0098, $00)                          ;B3A381
    %AICMD0x41_AddValue16(nLove_Ann, 8)                        ;B3A385
    %AICMD0x12_Jump(pAIScripting0x01_L283)                                   ;B3A38B
pAIScripting0x01_L300:
    %AICMD0x1C_ShowDialog($0099, $00)                          ;B3A38E
    %AICMD0x41_AddValue16(nLove_Ann, 2)                        ;B3A392
    %AICMD0x12_Jump(pAIScripting0x01_L283)                                   ;B3A398
pAIScripting0x01_L301:
    %AICMD0x1C_ShowDialog($009F, $00)                          ;B3A39B
    %AICMD0x12_Jump(pAIScripting0x01_L282)                                   ;B3A39F
pAIScripting0x01_L302:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 11, pAIScripting0x01_L305)         ;B3A3A2
    %AICMD0x17_RollRandom($02)                                            ;B3A3A9
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x01_L303)                                   ;B3A3AB
    %AICMD0x18_JumpIfRandomEquals($01, pAIScripting0x01_L304)                                   ;B3A3AF
    %AICMD0x12_Jump(pAIScripting0x01_L282)                                   ;B3A3B3
pAIScripting0x01_L303:
    %AICMD0x1C_ShowDialog($009A, $00)                          ;B3A3B6
    %AICMD0x12_Jump(pAIScripting0x01_L282)                                   ;B3A3BA
pAIScripting0x01_L304:
    %AICMD0x1C_ShowDialog($00A0, $00)                          ;B3A3BD
    %AICMD0x12_Jump(pAIScripting0x01_L282)                                   ;B3A3C1
pAIScripting0x01_L305:
    %AICMD0x1C_ShowDialog($0239, $00)                          ;B3A3C4
    %AICMD0x12_Jump(pAIScripting0x01_L282)                                   ;B3A3C8
pAIScripting0x01_L306:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 23, pAIScripting0x01_L311)         ;B3A3CB
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 30, pAIScripting0x01_L312)         ;B3A3D2
    %AICMD0x17_RollRandom($02)                                            ;B3A3D9
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x01_L307)                                   ;B3A3DB
    %AICMD0x18_JumpIfRandomEquals($01, pAIScripting0x01_L310)                                   ;B3A3DF
    %AICMD0x12_Jump(pAIScripting0x01_L282)                                   ;B3A3E3
pAIScripting0x01_L307:
    %AICMD0x1D_ShowDialog($009B, $00)                          ;B3A3E6
    %AICMD0x20_JumpIfChoice(0, pAIScripting0x01_L308)                        ;B3A3EA
    %AICMD0x20_JumpIfChoice(1, pAIScripting0x01_L309)                        ;B3A3EE
    %AICMD0x12_Jump(pAIScripting0x01_L282)                                   ;B3A3F2
pAIScripting0x01_L308:
    %AICMD0x1C_ShowDialog($009C, $00)                          ;B3A3F5
    %AICMD0x41_AddValue16(nLove_Ann, 8)                        ;B3A3F9
    %AICMD0x12_Jump(pAIScripting0x01_L283)                                   ;B3A3FF
pAIScripting0x01_L309:
    %AICMD0x1C_ShowDialog($009D, $00)                          ;B3A402
    %AICMD0x41_AddValue16(nLove_Ann, 2)                        ;B3A406
    %AICMD0x12_Jump(pAIScripting0x01_L283)                                   ;B3A40C
pAIScripting0x01_L310:
    %AICMD0x1C_ShowDialog($00A1, $00)                          ;B3A40F
    %AICMD0x12_Jump(pAIScripting0x01_L282)                                   ;B3A413
pAIScripting0x01_L311:
    %AICMD0x1C_ShowDialog($02B0, $00)                          ;B3A416
    %AICMD0x12_Jump(pAIScripting0x01_L282)                                   ;B3A41A
pAIScripting0x01_L312:
    %AICMD0x1C_ShowDialog($03F9, $00)                          ;B3A41D
    %AICMD0x41_AddValue16(nLove_Ann, 5)                        ;B3A421
    %AICMD0x12_Jump(pAIScripting0x01_L282)                                   ;B3A427
pAIScripting0x01_L313:
    %AICMD0x1C_ShowDialog($00A7, $00)                          ;B3A42A
    %AICMD0x12_Jump(pAIScripting0x01_L283)                                   ;B3A42E
pAIScripting0x01_L314:
    %AICMD0x1C_ShowDialog($01DE, $00)                          ;B3A431
    %AICMD0x12_Jump(pAIScripting0x01_L284)                                   ;B3A435


DATA8_B3A438:
 
    %AICMD0x11_EnableUserControl()                             ;B3A438
    %AICMD0x09_StartScript($01, pAIScripting0x01_L316)                                   ;B3A439
    %AICMD0x09_StartScript($02, pAIScripting0x01_L333)                                   ;B3A43D
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $02, pAIScripting0x01_L315)   ;B3A441
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $03, pAIScripting0x01_L315)   ;B3A448
    %AICMD0x09_StartScript($03, pAIScripting0x01_L343)                                   ;B3A44F
pAIScripting0x01_L315:
    %AICMD0x13_Wait(1)                                         ;B3A453
    %AICMD0x12_Jump(pAIScripting0x01_L315)                                   ;B3A456
pAIScripting0x01_L316:
    %AICMD0x1A($0028, $0198, aAIScriptingData_L048, $02)                     ;B3A459
pAIScripting0x01_L317:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x01_L319)                                        ;B3A461
    %AICMD0x2D_JumpOnInteract(pAIScripting0x01_L322, pAIScripting0x01_L320)                               ;B3A464
    %AICMD0x12_Jump(pAIScripting0x01_L317)                                   ;B3A469
pAIScripting0x01_L318:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x01_L319)                                        ;B3A46C
    %AICMD0x1F(pAIScripting0x01_L323)                                        ;B3A46F
    %AICMD0x12_Jump(pAIScripting0x01_L318)                                   ;B3A472
pAIScripting0x01_L319:
    %AICMD0x1C_ShowDialog($01C7, $00)                          ;B3A475
    %AICMD0x12_Jump(pAIScripting0x01_L317)                                   ;B3A479
pAIScripting0x01_L320:
    %AICMD0x16_JumpIfBetween8($80091E, 9, 12, pAIScripting0x01_L321)         ;B3A47C
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3A484
    %AICMD0x1B($02A1, $01)                                     ;B3A488
    %AICMD0x12_Jump(pAIScripting0x01_L317)                                   ;B3A48C
pAIScripting0x01_L321:
    %AICMD0x1C_ShowDialog($03BB, $00)                          ;B3A48F
    %AICMD0x1B($02A1, $01)                                     ;B3A493
    %AICMD0x12_Jump(pAIScripting0x01_L317)                                   ;B3A497
pAIScripting0x01_L322:
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 2, pAIScripting0x01_L326)     ;B3A49A
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, pAIScripting0x01_L328)     ;B3A4A1
pAIScripting0x01_L323:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $02, pAIScripting0x01_L332)   ;B3A4A8
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $03, pAIScripting0x01_L331)   ;B3A4AF
    %AICMD0x45_JumpIfBetween16(nLove_Ellen, 200, 249, pAIScripting0x01_L330) ;B3A4B6
    %AICMD0x17_RollRandom($02)                                            ;B3A4C0
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x01_L324)                                   ;B3A4C2
    %AICMD0x18_JumpIfRandomEquals($01, pAIScripting0x01_L325)                                   ;B3A4C6
    %AICMD0x12_Jump(pAIScripting0x01_L317)                                   ;B3A4CA
pAIScripting0x01_L324:
    %AICMD0x1C_ShowDialog($004C, $00)                          ;B3A4CD
    %AICMD0x1B($02A1, $01)                                     ;B3A4D1
    %AICMD0x12_Jump(pAIScripting0x01_L317)                                   ;B3A4D5
pAIScripting0x01_L325:
    %AICMD0x1C_ShowDialog($004D, $00)                          ;B3A4D8
    %AICMD0x1B($02A1, $01)                                     ;B3A4DC
    %AICMD0x12_Jump(pAIScripting0x01_L318)                                   ;B3A4E0
pAIScripting0x01_L326:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 11, pAIScripting0x01_L327)         ;B3A4E3
    %AICMD0x12_Jump(pAIScripting0x01_L323)                                   ;B3A4EA
pAIScripting0x01_L327:
    %AICMD0x1C_ShowDialog($023F, $00)                          ;B3A4ED
    %AICMD0x1B($02A1, $01)                                     ;B3A4F1
    %AICMD0x12_Jump(pAIScripting0x01_L317)                                   ;B3A4F5
pAIScripting0x01_L328:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 30, pAIScripting0x01_L329)         ;B3A4F8
    %AICMD0x12_Jump(pAIScripting0x01_L323)                                   ;B3A4FF
pAIScripting0x01_L329:
    %AICMD0x1C_ShowDialog($03EC, $00)                          ;B3A502
    %AICMD0x1B($02A1, $01)                                     ;B3A506
    %AICMD0x41_AddValue16(nPlayerHappiness, 5)                 ;B3A50A
    %AICMD0x12_Jump(pAIScripting0x01_L317)                                   ;B3A510
pAIScripting0x01_L330:
    %AICMD0x1C_ShowDialog($03C7, $00)                          ;B3A513
    %AICMD0x1B($02A1, $01)                                     ;B3A517
    %AICMD0x12_Jump(pAIScripting0x01_L317)                                   ;B3A51B
pAIScripting0x01_L331:
    %AICMD0x1C_ShowDialog($03C8, $00)                          ;B3A51E
    %AICMD0x1B($02A1, $01)                                     ;B3A522
    %AICMD0x1C_ShowDialog($03CA, $00)                          ;B3A526
    %AICMD0x12_Jump(pAIScripting0x01_L317)                                   ;B3A52A
pAIScripting0x01_L332:
    %AICMD0x1C_ShowDialog($01ED, $00)                          ;B3A52D
    %AICMD0x1B($02A1, $01)                                     ;B3A531
    %AICMD0x12_Jump(pAIScripting0x01_L318)                                   ;B3A535
pAIScripting0x01_L333:
    %AICMD0x1A($0098, $0158, aAIScriptingData_L050, $00)                     ;B3A538
pAIScripting0x01_L334:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x01_L335)                                        ;B3A540
    %AICMD0x2D_JumpOnInteract(pAIScripting0x01_L337, pAIScripting0x01_L336)                               ;B3A543
    %AICMD0x12_Jump(pAIScripting0x01_L334)                                   ;B3A548
pAIScripting0x01_L335:
    %AICMD0x1C_ShowDialog($01C8, $00)                          ;B3A54B
    %AICMD0x12_Jump(pAIScripting0x01_L334)                                   ;B3A54F
pAIScripting0x01_L336:
    %AICMD0x1C_ShowDialog($03BC, $00)                          ;B3A552
    %AICMD0x12_Jump(pAIScripting0x01_L334)                                   ;B3A556
pAIScripting0x01_L337:
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, pAIScripting0x01_L341)     ;B3A559
    %AICMD0x17_RollRandom($08)                                            ;B3A560
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x01_L340)                                   ;B3A562
    %AICMD0x17_RollRandom($02)                                            ;B3A566
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x01_L338)                                   ;B3A568
    %AICMD0x18_JumpIfRandomEquals($01, pAIScripting0x01_L339)                                   ;B3A56C
    %AICMD0x12_Jump(pAIScripting0x01_L334)                                   ;B3A570
pAIScripting0x01_L338:
    %AICMD0x1C_ShowDialog($0051, $00)                          ;B3A573
    %AICMD0x12_Jump(pAIScripting0x01_L334)                                   ;B3A577
pAIScripting0x01_L339:
    %AICMD0x1C_ShowDialog($0052, $00)                          ;B3A57A
    %AICMD0x12_Jump(pAIScripting0x01_L334)                                   ;B3A57E
pAIScripting0x01_L340:
    %AICMD0x1C_ShowDialog($03C9, $00)                          ;B3A581
    %AICMD0x12_Jump(pAIScripting0x01_L334)                                   ;B3A585
pAIScripting0x01_L341:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 30, pAIScripting0x01_L342)         ;B3A588
    %AICMD0x1C_ShowDialog($03C9, $00)                          ;B3A58F
    %AICMD0x12_Jump(pAIScripting0x01_L334)                                   ;B3A593
pAIScripting0x01_L342:
    %AICMD0x1C_ShowDialog($03FD, $00)                          ;B3A596
    %AICMD0x41_AddValue16(nPlayerHappiness, 5)                 ;B3A59A
    %AICMD0x12_Jump(pAIScripting0x01_L334)                                   ;B3A5A0
pAIScripting0x01_L343:
    %AICMD0x1A($0087, $0097, aAIScriptingData_L091, $00)                     ;B3A5A3
pAIScripting0x01_L344:
    %AICMD0x13_Wait(1)                                         ;B3A5AB
    %AICMD0x12_Jump(pAIScripting0x01_L344)                                   ;B3A5AE


DATA8_B3A5B1:
 
    %AICMD0x11_EnableUserControl()                             ;B3A5B1
    %AICMD0x09_StartScript($01, pAIScripting0x01_L346)                                   ;B3A5B2
pAIScripting0x01_L345:
    %AICMD0x13_Wait(1)                                         ;B3A5B6
    %AICMD0x12_Jump(pAIScripting0x01_L345)                                   ;B3A5B9
pAIScripting0x01_L346:
    %AICMD0x1A($0088, $0050, aAIScriptingData_L042, $00)                     ;B3A5BC
pAIScripting0x01_L347:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x01_L350)                                        ;B3A5C4
    %AICMD0x2D_JumpOnInteract(pAIScripting0x01_L353, pAIScripting0x01_L351)                               ;B3A5C7
    %AICMD0x12_Jump(pAIScripting0x01_L347)                                   ;B3A5CC
pAIScripting0x01_L348:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x01_L350)                                        ;B3A5CF
    %AICMD0x1F(pAIScripting0x01_L354)                                        ;B3A5D2
    %AICMD0x12_Jump(pAIScripting0x01_L348)                                   ;B3A5D5
pAIScripting0x01_L349:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x01_L350)                                        ;B3A5D8
    %AICMD0x1F(pAIScripting0x01_L355)                                        ;B3A5DB
    %AICMD0x12_Jump(pAIScripting0x01_L349)                                   ;B3A5DE
pAIScripting0x01_L350:
    %AICMD0x1C_ShowDialog($01CA, $00)                          ;B3A5E1
    %AICMD0x1B($0288, $00)                                     ;B3A5E5
    %AICMD0x12_Jump(pAIScripting0x01_L347)                                   ;B3A5E9
pAIScripting0x01_L351:
    %AICMD0x16_JumpIfBetween8($80091E, 9, 12, pAIScripting0x01_L352)         ;B3A5EC
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3A5F4
    %AICMD0x1B($0288, $00)                                     ;B3A5F8
    %AICMD0x12_Jump(pAIScripting0x01_L347)                                   ;B3A5FC
pAIScripting0x01_L352:
    %AICMD0x1C_ShowDialog($03BB, $00)                          ;B3A5FF
    %AICMD0x1B($0288, $00)                                     ;B3A603
    %AICMD0x12_Jump(pAIScripting0x01_L347)                                   ;B3A607
pAIScripting0x01_L353:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event4, $0C, pAIScripting0x01_L364)   ;B3A60A
    %AICMD0x14_JumpIfFlagSet(strcFlags.event4, $0E, pAIScripting0x01_L365)   ;B3A611
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $00, pAIScripting0x01_L366)   ;B3A618
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $02, pAIScripting0x01_L367)   ;B3A61F
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $00, pAIScripting0x01_L356)   ;B3A626
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $01, pAIScripting0x01_L356)   ;B3A62D
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, pAIScripting0x01_L356)   ;B3A634
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $03, pAIScripting0x01_L356)   ;B3A63B
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $04, pAIScripting0x01_L356)   ;B3A642
    %AICMD0x17_RollRandom($04)                                            ;B3A649
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x01_L358)                                   ;B3A64B
    %AICMD0x17_RollRandom($02)                                            ;B3A64F
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x01_L354)                                   ;B3A651
    %AICMD0x18_JumpIfRandomEquals($01, pAIScripting0x01_L355)                                   ;B3A655
    %AICMD0x12_Jump(pAIScripting0x01_L347)                                   ;B3A659
pAIScripting0x01_L354:
    %AICMD0x1C_ShowDialog($0062, $00)                          ;B3A65C
    %AICMD0x1B($0288, $00)                                     ;B3A660
    %AICMD0x12_Jump(pAIScripting0x01_L348)                                   ;B3A664
pAIScripting0x01_L355:
    %AICMD0x1C_ShowDialog($0060, $00)                          ;B3A667
    %AICMD0x1B($0288, $00)                                     ;B3A66B
    %AICMD0x12_Jump(pAIScripting0x01_L349)                                   ;B3A66F
pAIScripting0x01_L356:
    %AICMD0x17_RollRandom($03)                                            ;B3A672
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x01_L354)                                   ;B3A674
    %AICMD0x18_JumpIfRandomEquals($01, pAIScripting0x01_L355)                                   ;B3A678
    %AICMD0x18_JumpIfRandomEquals($02, pAIScripting0x01_L357)                                   ;B3A67C
    %AICMD0x12_Jump(pAIScripting0x01_L347)                                   ;B3A680
pAIScripting0x01_L357:
    %AICMD0x1C_ShowDialog($03E9, $00)                          ;B3A683
    %AICMD0x1B($0288, $00)                                     ;B3A687
    %AICMD0x12_Jump(pAIScripting0x01_L347)                                   ;B3A68B
pAIScripting0x01_L358:
    %AICMD0x1D_ShowDialog($03E5, $00)                          ;B3A68E
    %AICMD0x20_JumpIfChoice(0, pAIScripting0x01_L359)                        ;B3A692
    %AICMD0x20_JumpIfChoice(1, pAIScripting0x01_L361)                        ;B3A696
    %AICMD0x20_JumpIfChoice(2, pAIScripting0x01_L363)                        ;B3A69A
    %AICMD0x20_JumpIfChoice(3, pAIScripting0x01_L360)                        ;B3A69E
    %AICMD0x20_JumpIfChoice(4, pAIScripting0x01_L362)                        ;B3A6A2
pAIScripting0x01_L359:
    %AICMD0x1C_ShowDialog($03E6, $00)                          ;B3A6A6
    %AICMD0x41_AddValue16(nLove_Maria, 2)                      ;B3A6AA
    %AICMD0x1B($0288, $00)                                     ;B3A6B0
    %AICMD0x12_Jump(pAIScripting0x01_L348)                                   ;B3A6B4
pAIScripting0x01_L360:
    %AICMD0x1C_ShowDialog($03E7, $00)                          ;B3A6B7
    %AICMD0x41_AddValue16(nLove_Ann, 2)                        ;B3A6BB
    %AICMD0x1B($0288, $00)                                     ;B3A6C1
    %AICMD0x12_Jump(pAIScripting0x01_L348)                                   ;B3A6C5
pAIScripting0x01_L361:
    %AICMD0x1C_ShowDialog($03E8, $00)                          ;B3A6C8
    %AICMD0x41_AddValue16(nLove_Nina, 2)                       ;B3A6CC
    %AICMD0x1B($0288, $00)                                     ;B3A6D2
    %AICMD0x12_Jump(pAIScripting0x01_L348)                                   ;B3A6D6
pAIScripting0x01_L362:
    %AICMD0x1C_ShowDialog($0465, $00)                          ;B3A6D9
    %AICMD0x41_AddValue16(nLove_Ellen, 2)                      ;B3A6DD
    %AICMD0x1B($0288, $00)                                     ;B3A6E3
    %AICMD0x12_Jump(pAIScripting0x01_L348)                                   ;B3A6E7
pAIScripting0x01_L363:
    %AICMD0x1C_ShowDialog($0466, $00)                          ;B3A6EA
    %AICMD0x41_AddValue16(nLove_Eve, 2)                        ;B3A6EE
    %AICMD0x1B($0288, $00)                                     ;B3A6F4
    %AICMD0x12_Jump(pAIScripting0x01_L348)                                   ;B3A6F8
pAIScripting0x01_L364:
    %AICMD0x1C_ShowDialog($01D1, $00)                          ;B3A6FB
    %AICMD0x1B($0288, $00)                                     ;B3A6FF
    %AICMD0x12_Jump(pAIScripting0x01_L347)                                   ;B3A703
pAIScripting0x01_L365:
    %AICMD0x1C_ShowDialog($01DD, $00)                          ;B3A706
    %AICMD0x1B($0288, $00)                                     ;B3A70A
    %AICMD0x12_Jump(pAIScripting0x01_L347)                                   ;B3A70E
pAIScripting0x01_L366:
    %AICMD0x1C_ShowDialog($01E6, $00)                          ;B3A711
    %AICMD0x1B($0288, $00)                                     ;B3A715
    %AICMD0x12_Jump(pAIScripting0x01_L347)                                   ;B3A719
pAIScripting0x01_L367:
    %AICMD0x1C_ShowDialog($01EF, $00)                          ;B3A71C
    %AICMD0x1B($0288, $00)                                     ;B3A720
    %AICMD0x12_Jump(pAIScripting0x01_L347)                                   ;B3A724


DATA8_B3A727:
 
    %AICMD0x11_EnableUserControl()                             ;B3A727
    %AICMD0x09_StartScript($01, pAIScripting0x01_L369)                                   ;B3A728
pAIScripting0x01_L368:
    %AICMD0x13_Wait(1)                                         ;B3A72C
    %AICMD0x12_Jump(pAIScripting0x01_L368)                                   ;B3A72F
pAIScripting0x01_L369:
    %AICMD0x1A($00E8, $0098, aAIScriptingData_L053, $03)                     ;B3A732
pAIScripting0x01_L370:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x01_L372)                                        ;B3A73A
    %AICMD0x2D_JumpOnInteract(pAIScripting0x01_L375, pAIScripting0x01_L373)                               ;B3A73D
    %AICMD0x12_Jump(pAIScripting0x01_L370)                                   ;B3A742
pAIScripting0x01_L371:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x01_L372)                                        ;B3A745
    %AICMD0x1F(pAIScripting0x01_L378)                                        ;B3A748
    %AICMD0x12_Jump(pAIScripting0x01_L371)                                   ;B3A74B
pAIScripting0x01_L372:
    %AICMD0x1C_ShowDialog($01C9, $00)                          ;B3A74E
    %AICMD0x1B($02AF, $00)                                     ;B3A752
    %AICMD0x12_Jump(pAIScripting0x01_L370)                                   ;B3A756
pAIScripting0x01_L373:
    %AICMD0x16_JumpIfBetween8($80091E, 9, 12, pAIScripting0x01_L374)         ;B3A759
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3A761
    %AICMD0x1B($02AF, $00)                                     ;B3A765
    %AICMD0x12_Jump(pAIScripting0x01_L370)                                   ;B3A769
pAIScripting0x01_L374:
    %AICMD0x1C_ShowDialog($03BB, $00)                          ;B3A76C
    %AICMD0x1B($02AF, $00)                                     ;B3A770
    %AICMD0x12_Jump(pAIScripting0x01_L370)                                   ;B3A774
pAIScripting0x01_L375:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $02, pAIScripting0x01_L384)   ;B3A777
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 2, pAIScripting0x01_L379)     ;B3A77E
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, pAIScripting0x01_L380)     ;B3A785
pAIScripting0x01_L376:
    %AICMD0x17_RollRandom($02)                                            ;B3A78C
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x01_L377)                                   ;B3A78E
    %AICMD0x18_JumpIfRandomEquals($01, pAIScripting0x01_L378)                                   ;B3A792
    %AICMD0x12_Jump(pAIScripting0x01_L370)                                   ;B3A796
pAIScripting0x01_L377:
    %AICMD0x1C_ShowDialog($005C, $00)                          ;B3A799
    %AICMD0x1B($02AF, $00)                                     ;B3A79D
    %AICMD0x12_Jump(pAIScripting0x01_L370)                                   ;B3A7A1
pAIScripting0x01_L378:
    %AICMD0x1C_ShowDialog($005D, $00)                          ;B3A7A4
    %AICMD0x1B($02AF, $00)                                     ;B3A7A8
    %AICMD0x12_Jump(pAIScripting0x01_L371)                                   ;B3A7AC
pAIScripting0x01_L379:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 19, pAIScripting0x01_L381)         ;B3A7AF
    %AICMD0x16_JumpIfBetween8(nOwnedCows, 1, 12, pAIScripting0x01_L383)      ;B3A7B6
    %AICMD0x1C_ShowDialog($005D, $00)                          ;B3A7BE
    %AICMD0x1B($02AF, $00)                                     ;B3A7C2
    %AICMD0x12_Jump(pAIScripting0x01_L370)                                   ;B3A7C6
pAIScripting0x01_L380:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 30, pAIScripting0x01_L382)         ;B3A7C9
    %AICMD0x16_JumpIfBetween8(nOwnedCows, 1, 12, pAIScripting0x01_L383)      ;B3A7D0
    %AICMD0x1C_ShowDialog($0407, $00)                          ;B3A7D8
    %AICMD0x1B($02AF, $00)                                     ;B3A7DC
    %AICMD0x12_Jump(pAIScripting0x01_L370)                                   ;B3A7E0
pAIScripting0x01_L381:
    %AICMD0x1C_ShowDialog($03F4, $00)                          ;B3A7E3
    %AICMD0x1B($02AF, $00)                                     ;B3A7E7
    %AICMD0x12_Jump(pAIScripting0x01_L370)                                   ;B3A7EB
pAIScripting0x01_L382:
    %AICMD0x1C_ShowDialog($0146, $00)                          ;B3A7EE
    %AICMD0x1B($02AF, $00)                                     ;B3A7F2
    %AICMD0x41_AddValue16(nPlayerHappiness, 5)                 ;B3A7F6
    %AICMD0x12_Jump(pAIScripting0x01_L370)                                   ;B3A7FC
pAIScripting0x01_L383:
    %AICMD0x17_RollRandom($02)                                            ;B3A7FF
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x01_L376)                                   ;B3A801
    %AICMD0x1C_ShowDialog($03CF, $00)                          ;B3A805
    %AICMD0x1B($02AF, $00)                                     ;B3A809
    %AICMD0x12_Jump(pAIScripting0x01_L370)                                   ;B3A80D
pAIScripting0x01_L384:
    %AICMD0x1C_ShowDialog($01F0, $00)                          ;B3A810
    %AICMD0x1B($02AF, $00)                                     ;B3A814
    %AICMD0x12_Jump(pAIScripting0x01_L370)                                   ;B3A818


DATA8_B3A81B:
 
    %AICMD0x11_EnableUserControl()                             ;B3A81B
    %AICMD0x14_JumpIfFlagSet(strcFlags.event4, $09, pAIScripting0x01_L385)   ;B3A81C
    %AICMD0x15_JumpIfEquals8(nCurrentYearID, 0, pAIScripting0x01_L385)       ;B3A823
    %AICMD0x15_JumpIfEquals8(nCurrentYearID, 1, pAIScripting0x01_L385)       ;B3A82A
    %AICMD0x15_JumpIfEquals8(nCurrentYearID, 3, pAIScripting0x01_L385)       ;B3A831
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 0, pAIScripting0x01_L385)     ;B3A838
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 1, pAIScripting0x01_L385)     ;B3A83F
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, pAIScripting0x01_L385)     ;B3A846
    %AICMD0x12_Jump(pAIScripting0x01_L386)                                   ;B3A84D
pAIScripting0x01_L385:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $04, pAIScripting0x01_L386)   ;B3A850
    %AICMD0x09_StartScript($02, pAIScripting0x01_L411)                                   ;B3A857
pAIScripting0x01_L386:
    %AICMD0x09_StartScript($01, pAIScripting0x01_L398)                                   ;B3A85B
    %AICMD0x09_StartScript($06, pAIScripting0x01_L394)                                   ;B3A85F
    %AICMD0x09_StartScript($07, pAIScripting0x01_L388)                                   ;B3A863
    %AICMD0x09_StartScript($08, pAIScripting0x01_L391)                                   ;B3A867
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $07, pAIScripting0x01_L387)   ;B3A86B
    %AICMD0x14_JumpIfFlagSet(strcFlags.event4, $0C, pAIScripting0x01_L387)   ;B3A872
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $02, pAIScripting0x01_L387)   ;B3A879
    %AICMD0x09_StartScript($03, pAIScripting0x01_L425)                                   ;B3A880
    %AICMD0x09_StartScript($04, pAIScripting0x01_L441)                                   ;B3A884
    %AICMD0x09_StartScript($05, pAIScripting0x01_L455)                                   ;B3A888
pAIScripting0x01_L387:
    %AICMD0x13_Wait(1)                                         ;B3A88C
    %AICMD0x12_Jump(pAIScripting0x01_L387)                                   ;B3A88F
pAIScripting0x01_L388:
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 17, 18, pAIScripting0x01_L390) ;B3A892
    %AICMD0x16_JumpIfBetween8(nCurrentSeasonID, 1, 3, pAIScripting0x01_L390) ;B3A89A
    %AICMD0x1A($0168, $01A8, aAIScriptingData_L083, $00)                     ;B3A8A2
    %AICMD0x4C()                                               ;B3A8AA
pAIScripting0x01_L389:
    %AICMD0x0D($01, $00, $08, $01)                             ;B3A8AB
    %AICMD0x0D($00, $FF, $06, $01)                             ;B3A8B0
    %AICMD0x0D($FF, $00, $08, $02)                             ;B3A8B5
    %AICMD0x0D($FF, $01, $04, $01)                             ;B3A8BA
    %AICMD0x0D($01, $00, $0C, $02)                             ;B3A8BF
    %AICMD0x0D($FF, $00, $06, $01)                             ;B3A8C4
    %AICMD0x0D($00, $FF, $10, $02)                             ;B3A8C9
    %AICMD0x0D($FF, $01, $04, $01)                             ;B3A8CE
    %AICMD0x0D($01, $01, $0C, $02)                             ;B3A8D3
    %AICMD0x0D($01, $00, $08, $02)                             ;B3A8D8
    %AICMD0x0D($00, $FF, $06, $01)                             ;B3A8DD
    %AICMD0x12_Jump(pAIScripting0x01_L389)                                   ;B3A8E2
pAIScripting0x01_L390:
    %AICMD0x10_End()                                           ;B3A8E5
pAIScripting0x01_L391:
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 17, 18, pAIScripting0x01_L393) ;B3A8E6
    %AICMD0x16_JumpIfBetween8(nCurrentSeasonID, 1, 3, pAIScripting0x01_L393) ;B3A8EE
    %AICMD0x1A($0028, $00C8, aAIScriptingData_L083, $00)                     ;B3A8F6
    %AICMD0x4C()                                               ;B3A8FE
pAIScripting0x01_L392:
    %AICMD0x0D($01, $00, $08, $01)                             ;B3A8FF
    %AICMD0x0D($00, $FF, $06, $01)                             ;B3A904
    %AICMD0x0D($FF, $00, $08, $02)                             ;B3A909
    %AICMD0x0D($FF, $01, $04, $01)                             ;B3A90E
    %AICMD0x0D($01, $00, $0C, $02)                             ;B3A913
    %AICMD0x0D($FF, $00, $06, $01)                             ;B3A918
    %AICMD0x0D($00, $FF, $10, $02)                             ;B3A91D
    %AICMD0x0D($FF, $01, $04, $01)                             ;B3A922
    %AICMD0x0D($01, $01, $0C, $02)                             ;B3A927
    %AICMD0x0D($01, $00, $08, $02)                             ;B3A92C
    %AICMD0x0D($00, $FF, $06, $01)                             ;B3A931
    %AICMD0x12_Jump(pAIScripting0x01_L392)                                   ;B3A936
pAIScripting0x01_L393:
    %AICMD0x10_End()                                           ;B3A939
pAIScripting0x01_L394:
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 17, 18, pAIScripting0x01_L397) ;B3A93A
    %AICMD0x16_JumpIfBetween8(nCurrentSeasonID, 1, 2, pAIScripting0x01_L397) ;B3A942
    %AICMD0x17_RollRandom($03)                                            ;B3A94A
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x01_L397)                                   ;B3A94C
    %AICMD0x18_JumpIfRandomEquals($01, pAIScripting0x01_L397)                                   ;B3A950
    %AICMD0x1A($02B8, $00D0, aAIScriptingData_L089, $00)                     ;B3A954
pAIScripting0x01_L395:
    %AICMD0x1F(pAIScripting0x01_L396)                                        ;B3A95C
    %AICMD0x12_Jump(pAIScripting0x01_L395)                                   ;B3A95F
pAIScripting0x01_L396:
    %AICMD0x1C_ShowDialog($01BE, $00)                          ;B3A962
    %AICMD0x12_Jump(pAIScripting0x01_L395)                                   ;B3A966
pAIScripting0x01_L397:
    %AICMD0x10_End()                                           ;B3A969
pAIScripting0x01_L398:
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 17, 18, pAIScripting0x01_L410) ;B3A96A
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, pAIScripting0x01_L410)     ;B3A972
    %AICMD0x1A($0258, $0178, aAIScriptingData_L032, $00)                     ;B3A979
pAIScripting0x01_L399:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x01_L401)                                        ;B3A981
    %AICMD0x2D_JumpOnInteract(pAIScripting0x01_L404, pAIScripting0x01_L402)                               ;B3A984
    %AICMD0x12_Jump(pAIScripting0x01_L399)                                   ;B3A989
pAIScripting0x01_L400:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x01_L401)                                        ;B3A98C
    %AICMD0x1F(pAIScripting0x01_L407)                                        ;B3A98F
    %AICMD0x12_Jump(pAIScripting0x01_L400)                                   ;B3A992
pAIScripting0x01_L401:
    %AICMD0x1C_ShowDialog($01C9, $00)                          ;B3A995
    %AICMD0x12_Jump(pAIScripting0x01_L400)                                   ;B3A999
pAIScripting0x01_L402:
    %AICMD0x16_JumpIfBetween8($80091E, 9, 12, pAIScripting0x01_L403)         ;B3A99C
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3A9A4
    %AICMD0x12_Jump(pAIScripting0x01_L399)                                   ;B3A9A8
pAIScripting0x01_L403:
    %AICMD0x1C_ShowDialog($03B8, $00)                          ;B3A9AB
    %AICMD0x12_Jump(pAIScripting0x01_L399)                                   ;B3A9AF
pAIScripting0x01_L404:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $02, pAIScripting0x01_L409)   ;B3A9B2
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 17, 18, pAIScripting0x01_L408) ;B3A9B9
    %AICMD0x1D_ShowDialog($007E, $00)                          ;B3A9C1
    %AICMD0x20_JumpIfChoice(0, pAIScripting0x01_L405)                        ;B3A9C5
    %AICMD0x20_JumpIfChoice(1, pAIScripting0x01_L406)                        ;B3A9C9
    %AICMD0x12_Jump(pAIScripting0x01_L399)                                   ;B3A9CD
pAIScripting0x01_L405:
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily1, $09)       ;B3A9D0
    %AICMD0x1C_ShowDialog($007F, $00)                          ;B3A9D5
    %AICMD0x12_Jump(pAIScripting0x01_L400)                                   ;B3A9D9
pAIScripting0x01_L406:
    %AICMD0x1C_ShowDialog($0080, $00)                          ;B3A9DC
    %AICMD0x12_Jump(pAIScripting0x01_L399)                                   ;B3A9E0
pAIScripting0x01_L407:
    %AICMD0x28_ClearBit(strcFlags.daily1, $09)                          ;B3A9E3
    %AICMD0x1C_ShowDialog($0081, $00)                          ;B3A9E8
    %AICMD0x12_Jump(pAIScripting0x01_L399)                                   ;B3A9EC
pAIScripting0x01_L408:
    %AICMD0x1C_ShowDialog($0081, $00)                          ;B3A9EF
    %AICMD0x12_Jump(pAIScripting0x01_L399)                                   ;B3A9F3
pAIScripting0x01_L409:
    %AICMD0x1C_ShowDialog($01EC, $00)                          ;B3A9F6
    %AICMD0x12_Jump(pAIScripting0x01_L399)                                   ;B3A9FA
pAIScripting0x01_L410:
    %AICMD0x10_End()                                           ;B3A9FD
pAIScripting0x01_L411:
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 17, 18, pAIScripting0x01_L424) ;B3A9FE
    %AICMD0x1A($0120, $0200, aAIScriptingData_L040, $00)                     ;B3AA06
pAIScripting0x01_L412:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x01_L413)                                        ;B3AA0E
    %AICMD0x2D_JumpOnInteract(pAIScripting0x01_L416, pAIScripting0x01_L414)                               ;B3AA11
    %AICMD0x12_Jump(pAIScripting0x01_L412)                                   ;B3AA16
pAIScripting0x01_L413:
    %AICMD0x1C_ShowDialog($01C9, $00)                          ;B3AA19
    %AICMD0x12_Jump(pAIScripting0x01_L412)                                   ;B3AA1D
pAIScripting0x01_L414:
    %AICMD0x16_JumpIfBetween8($80091E, 9, 12, pAIScripting0x01_L415)         ;B3AA20
    %AICMD0x1C_ShowDialog($03BC, $00)                          ;B3AA28
    %AICMD0x12_Jump(pAIScripting0x01_L412)                                   ;B3AA2C
pAIScripting0x01_L415:
    %AICMD0x1C_ShowDialog($0049, $00)                          ;B3AA2F
    %AICMD0x12_Jump(pAIScripting0x01_L412)                                   ;B3AA33
pAIScripting0x01_L416:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $04, pAIScripting0x01_L422)   ;B3AA36
    %AICMD0x45_JumpIfBetween16(nLove_Eve, 200, 249, pAIScripting0x01_L423)   ;B3AA3D
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 0, pAIScripting0x01_L417)     ;B3AA47
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 1, pAIScripting0x01_L418)     ;B3AA4E
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 2, pAIScripting0x01_L419)     ;B3AA55
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, pAIScripting0x01_L420)     ;B3AA5C
    %AICMD0x12_Jump(pAIScripting0x01_L412)                                   ;B3AA63
pAIScripting0x01_L417:
    %AICMD0x1C_ShowDialog($007A, $00)                          ;B3AA66
    %AICMD0x12_Jump(pAIScripting0x01_L412)                                   ;B3AA6A
pAIScripting0x01_L418:
    %AICMD0x1C_ShowDialog($007C, $00)                          ;B3AA6D
    %AICMD0x12_Jump(pAIScripting0x01_L412)                                   ;B3AA71
pAIScripting0x01_L419:
    %AICMD0x1C_ShowDialog($007D, $00)                          ;B3AA74
    %AICMD0x12_Jump(pAIScripting0x01_L412)                                   ;B3AA78
pAIScripting0x01_L420:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 30, pAIScripting0x01_L421)         ;B3AA7B
    %AICMD0x1C_ShowDialog($0408, $00)                          ;B3AA82
    %AICMD0x12_Jump(pAIScripting0x01_L412)                                   ;B3AA86
pAIScripting0x01_L421:
    %AICMD0x1C_ShowDialog($03F5, $00)                          ;B3AA89
    %AICMD0x41_AddValue16(nPlayerHappiness, 5)                 ;B3AA8D
    %AICMD0x12_Jump(pAIScripting0x01_L412)                                   ;B3AA93
pAIScripting0x01_L422:
    %AICMD0x1C_ShowDialog($03D3, $00)                          ;B3AA96
    %AICMD0x12_Jump(pAIScripting0x01_L412)                                   ;B3AA9A
pAIScripting0x01_L423:
    %AICMD0x1C_ShowDialog($03D2, $00)                          ;B3AA9D
    %AICMD0x12_Jump(pAIScripting0x01_L412)                                   ;B3AAA1
pAIScripting0x01_L424:
    %AICMD0x10_End()                                           ;B3AAA4
pAIScripting0x01_L425:
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 17, 18, pAIScripting0x01_L440) ;B3AAA5
    %AICMD0x1A($01F8, $0258, aAIScriptingData_L027, $00)                     ;B3AAAD
    %AICMD0x22($10, $18, $01, aAIScriptingData_L028, $0C)                    ;B3AAB5
pAIScripting0x01_L426:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x01_L427)                                        ;B3AABC
    %AICMD0x2D_JumpOnInteract(pAIScripting0x01_L430, pAIScripting0x01_L428)                               ;B3AABF
    %AICMD0x12_Jump(pAIScripting0x01_L426)                                   ;B3AAC4
pAIScripting0x01_L427:
    %AICMD0x1C_ShowDialog($01C8, $00)                          ;B3AAC7
    %AICMD0x12_Jump(pAIScripting0x01_L426)                                   ;B3AACB
pAIScripting0x01_L428:
    %AICMD0x16_JumpIfBetween8($80091E, 9, 12, pAIScripting0x01_L429)         ;B3AACE
    %AICMD0x1C_ShowDialog($03BC, $00)                          ;B3AAD6
    %AICMD0x12_Jump(pAIScripting0x01_L426)                                   ;B3AADA
pAIScripting0x01_L429:
    %AICMD0x1C_ShowDialog($03BB, $00)                          ;B3AADD
    %AICMD0x12_Jump(pAIScripting0x01_L426)                                   ;B3AAE1
pAIScripting0x01_L430:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $00, pAIScripting0x01_L437)   ;B3AAE4
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $01, pAIScripting0x01_L437)   ;B3AAEB
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, pAIScripting0x01_L437)   ;B3AAF2
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $03, pAIScripting0x01_L437)   ;B3AAF9
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $04, pAIScripting0x01_L437)   ;B3AB00
pAIScripting0x01_L431:
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 0, pAIScripting0x01_L432)     ;B3AB07
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 1, pAIScripting0x01_L433)     ;B3AB0E
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 2, pAIScripting0x01_L434)     ;B3AB15
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, pAIScripting0x01_L435)     ;B3AB1C
    %AICMD0x12_Jump(pAIScripting0x01_L426)                                   ;B3AB23
pAIScripting0x01_L432:
    %AICMD0x1C_ShowDialog($012D, $00)                          ;B3AB26
    %AICMD0x12_Jump(pAIScripting0x01_L426)                                   ;B3AB2A
pAIScripting0x01_L433:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $00, pAIScripting0x01_L438)   ;B3AB2D
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $01, pAIScripting0x01_L438)   ;B3AB34
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, pAIScripting0x01_L438)   ;B3AB3B
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $03, pAIScripting0x01_L438)   ;B3AB42
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $04, pAIScripting0x01_L438)   ;B3AB49
    %AICMD0x1C_ShowDialog($03D5, $00)                          ;B3AB50
    %AICMD0x12_Jump(pAIScripting0x01_L426)                                   ;B3AB54
pAIScripting0x01_L434:
    %AICMD0x1C_ShowDialog($03D6, $00)                          ;B3AB57
    %AICMD0x12_Jump(pAIScripting0x01_L426)                                   ;B3AB5B
pAIScripting0x01_L435:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 30, pAIScripting0x01_L436)         ;B3AB5E
    %AICMD0x1C_ShowDialog($0409, $00)                          ;B3AB65
    %AICMD0x12_Jump(pAIScripting0x01_L426)                                   ;B3AB69
pAIScripting0x01_L436:
    %AICMD0x1C_ShowDialog($03F6, $00)                          ;B3AB6C
    %AICMD0x41_AddValue16(nPlayerHappiness, 5)                 ;B3AB70
    %AICMD0x12_Jump(pAIScripting0x01_L426)                                   ;B3AB76
pAIScripting0x01_L437:
    %AICMD0x17_RollRandom($02)                                            ;B3AB79
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x01_L431)                                   ;B3AB7B
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $07, pAIScripting0x01_L439)   ;B3AB7F
    %AICMD0x1C_ShowDialog($03DA, $00)                          ;B3AB86
    %AICMD0x12_Jump(pAIScripting0x01_L426)                                   ;B3AB8A
pAIScripting0x01_L438:
    %AICMD0x1C_ShowDialog($0415, $00)                          ;B3AB8D
    %AICMD0x12_Jump(pAIScripting0x01_L426)                                   ;B3AB91
pAIScripting0x01_L439:
    %AICMD0x1C_ShowDialog($03D7, $00)                          ;B3AB94
    %AICMD0x12_Jump(pAIScripting0x01_L426)                                   ;B3AB98
pAIScripting0x01_L440:
    %AICMD0x10_End()                                           ;B3AB9B
pAIScripting0x01_L441:
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 17, 18, pAIScripting0x01_L454) ;B3AB9C
    %AICMD0x1A($0298, $01F8, aAIScriptingData_L027, $00)                     ;B3ABA4
    %AICMD0x22($18, $18, $01, aAIScriptingData_L028, $0C)                    ;B3ABAC
pAIScripting0x01_L442:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x01_L443)                                        ;B3ABB3
    %AICMD0x2D_JumpOnInteract(pAIScripting0x01_L446, pAIScripting0x01_L444)                               ;B3ABB6
    %AICMD0x12_Jump(pAIScripting0x01_L442)                                   ;B3ABBB
pAIScripting0x01_L443:
    %AICMD0x1C_ShowDialog($01C8, $00)                          ;B3ABBE
    %AICMD0x12_Jump(pAIScripting0x01_L442)                                   ;B3ABC2
pAIScripting0x01_L444:
    %AICMD0x16_JumpIfBetween8($80091E, 9, 12, pAIScripting0x01_L445)         ;B3ABC5
    %AICMD0x1C_ShowDialog($03BC, $00)                          ;B3ABCD
    %AICMD0x12_Jump(pAIScripting0x01_L442)                                   ;B3ABD1
pAIScripting0x01_L445:
    %AICMD0x1C_ShowDialog($03BB, $00)                          ;B3ABD4
    %AICMD0x12_Jump(pAIScripting0x01_L442)                                   ;B3ABD8
pAIScripting0x01_L446:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $00, pAIScripting0x01_L453)   ;B3ABDB
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $01, pAIScripting0x01_L453)   ;B3ABE2
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, pAIScripting0x01_L453)   ;B3ABE9
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $03, pAIScripting0x01_L453)   ;B3ABF0
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $04, pAIScripting0x01_L453)   ;B3ABF7
pAIScripting0x01_L447:
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 0, pAIScripting0x01_L448)     ;B3ABFE
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 1, pAIScripting0x01_L449)     ;B3AC05
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 2, pAIScripting0x01_L450)     ;B3AC0C
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, pAIScripting0x01_L451)     ;B3AC13
    %AICMD0x12_Jump(pAIScripting0x01_L442)                                   ;B3AC1A
pAIScripting0x01_L448:
    %AICMD0x1C_ShowDialog($012E, $00)                          ;B3AC1D
    %AICMD0x12_Jump(pAIScripting0x01_L442)                                   ;B3AC21
pAIScripting0x01_L449:
    %AICMD0x1C_ShowDialog($03D4, $00)                          ;B3AC24
    %AICMD0x12_Jump(pAIScripting0x01_L442)                                   ;B3AC28
pAIScripting0x01_L450:
    %AICMD0x1C_ShowDialog($03D7, $00)                          ;B3AC2B
    %AICMD0x12_Jump(pAIScripting0x01_L442)                                   ;B3AC2F
pAIScripting0x01_L451:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 30, pAIScripting0x01_L452)         ;B3AC32
    %AICMD0x1C_ShowDialog($03D6, $00)                          ;B3AC39
    %AICMD0x12_Jump(pAIScripting0x01_L442)                                   ;B3AC3D
pAIScripting0x01_L452:
    %AICMD0x1C_ShowDialog($03F7, $00)                          ;B3AC40
    %AICMD0x41_AddValue16(nPlayerHappiness, 5)                 ;B3AC44
    %AICMD0x12_Jump(pAIScripting0x01_L442)                                   ;B3AC4A
pAIScripting0x01_L453:
    %AICMD0x17_RollRandom($02)                                            ;B3AC4D
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x01_L447)                                   ;B3AC4F
    %AICMD0x1C_ShowDialog($03D8, $00)                          ;B3AC53
    %AICMD0x12_Jump(pAIScripting0x01_L442)                                   ;B3AC57
pAIScripting0x01_L454:
    %AICMD0x10_End()                                           ;B3AC5A
pAIScripting0x01_L455:
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 17, 18, pAIScripting0x01_L468) ;B3AC5B
    %AICMD0x1A($0178, $0208, aAIScriptingData_L027, $00)                     ;B3AC63
    %AICMD0x22($18, $18, $01, aAIScriptingData_L028, $0C)                    ;B3AC6B
pAIScripting0x01_L456:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x01_L457)                                        ;B3AC72
    %AICMD0x2D_JumpOnInteract(pAIScripting0x01_L460, pAIScripting0x01_L458)                               ;B3AC75
    %AICMD0x12_Jump(pAIScripting0x01_L456)                                   ;B3AC7A
pAIScripting0x01_L457:
    %AICMD0x1C_ShowDialog($01C8, $00)                          ;B3AC7D
    %AICMD0x12_Jump(pAIScripting0x01_L456)                                   ;B3AC81
pAIScripting0x01_L458:
    %AICMD0x16_JumpIfBetween8($80091E, 9, 12, pAIScripting0x01_L459)         ;B3AC84
    %AICMD0x1C_ShowDialog($03BC, $00)                          ;B3AC8C
    %AICMD0x12_Jump(pAIScripting0x01_L456)                                   ;B3AC90
pAIScripting0x01_L459:
    %AICMD0x1C_ShowDialog($03BB, $00)                          ;B3AC93
    %AICMD0x12_Jump(pAIScripting0x01_L456)                                   ;B3AC97
pAIScripting0x01_L460:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $00, pAIScripting0x01_L467)   ;B3AC9A
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $01, pAIScripting0x01_L467)   ;B3ACA1
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, pAIScripting0x01_L467)   ;B3ACA8
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $03, pAIScripting0x01_L467)   ;B3ACAF
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $04, pAIScripting0x01_L467)   ;B3ACB6
pAIScripting0x01_L461:
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 0, pAIScripting0x01_L462)     ;B3ACBD
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 1, pAIScripting0x01_L463)     ;B3ACC4
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 2, pAIScripting0x01_L464)     ;B3ACCB
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, pAIScripting0x01_L465)     ;B3ACD2
    %AICMD0x17_RollRandom($02)                                            ;B3ACD9
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x01_L462)                                   ;B3ACDB
    %AICMD0x18_JumpIfRandomEquals($01, pAIScripting0x01_L463)                                   ;B3ACDF
    %AICMD0x12_Jump(pAIScripting0x01_L456)                                   ;B3ACE3
pAIScripting0x01_L462:
    %AICMD0x1C_ShowDialog($012F, $00)                          ;B3ACE6
    %AICMD0x12_Jump(pAIScripting0x01_L456)                                   ;B3ACEA
pAIScripting0x01_L463:
    %AICMD0x1C_ShowDialog($03D6, $00)                          ;B3ACED
    %AICMD0x12_Jump(pAIScripting0x01_L456)                                   ;B3ACF1
pAIScripting0x01_L464:
    %AICMD0x1C_ShowDialog($03DB, $00)                          ;B3ACF4
    %AICMD0x12_Jump(pAIScripting0x01_L456)                                   ;B3ACF8
pAIScripting0x01_L465:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 30, pAIScripting0x01_L466)         ;B3ACFB
    %AICMD0x1C_ShowDialog($03A0, $00)                          ;B3AD02
    %AICMD0x12_Jump(pAIScripting0x01_L456)                                   ;B3AD06
pAIScripting0x01_L466:
    %AICMD0x1C_ShowDialog($03F6, $00)                          ;B3AD09
    %AICMD0x41_AddValue16(nPlayerHappiness, 5)                 ;B3AD0D
    %AICMD0x12_Jump(pAIScripting0x01_L456)                                   ;B3AD13
pAIScripting0x01_L467:
    %AICMD0x17_RollRandom($02)                                            ;B3AD16
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x01_L461)                                   ;B3AD18
    %AICMD0x1C_ShowDialog($03D9, $00)                          ;B3AD1C
    %AICMD0x12_Jump(pAIScripting0x01_L456)                                   ;B3AD20
pAIScripting0x01_L468:
    %AICMD0x10_End()                                           ;B3AD23


DATA8_B3AD24:
 
    %AICMD0x11_EnableUserControl()                             ;B3AD24
    %AICMD0x09_StartScript($01, pAIScripting0x01_L470)                                   ;B3AD25
pAIScripting0x01_L469:
    %AICMD0x13_Wait(1)                                         ;B3AD29
    %AICMD0x12_Jump(pAIScripting0x01_L469)                                   ;B3AD2C
pAIScripting0x01_L470:
    %AICMD0x1A($0098, $0088, aAIScriptingData_L027, $00)                     ;B3AD2F
pAIScripting0x01_L471:
    %AICMD0x2D_JumpOnInteract(pAIScripting0x01_L476, pAIScripting0x01_L474)                               ;B3AD37
    %AICMD0x12_Jump(pAIScripting0x01_L471)                                   ;B3AD3C
pAIScripting0x01_L472:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x01_L473)                                        ;B3AD3F
    %AICMD0x1F(pAIScripting0x01_L479)                                        ;B3AD42
    %AICMD0x12_Jump(pAIScripting0x01_L472)                                   ;B3AD45
pAIScripting0x01_L473:
    %AICMD0x1C_ShowDialog($01C8, $00)                          ;B3AD48
    %AICMD0x12_Jump(pAIScripting0x01_L471)                                   ;B3AD4C
pAIScripting0x01_L474:
    %AICMD0x16_JumpIfBetween8($80091E, 9, 12, pAIScripting0x01_L475)         ;B3AD4F
    %AICMD0x1C_ShowDialog($03BC, $00)                          ;B3AD57
    %AICMD0x12_Jump(pAIScripting0x01_L471)                                   ;B3AD5B
pAIScripting0x01_L475:
    %AICMD0x1C_ShowDialog($03BB, $00)                          ;B3AD5E
    %AICMD0x12_Jump(pAIScripting0x01_L471)                                   ;B3AD62
pAIScripting0x01_L476:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $07, pAIScripting0x01_L480)   ;B3AD65
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $05, pAIScripting0x01_L479)   ;B3AD6C
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $06, pAIScripting0x01_L479)   ;B3AD73
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $07, pAIScripting0x01_L479)   ;B3AD7A
    %AICMD0x1D_ShowDialog($0130, $00)                          ;B3AD81
    %AICMD0x20_JumpIfChoice(0, pAIScripting0x01_L477)                        ;B3AD85
    %AICMD0x20_JumpIfChoice(1, pAIScripting0x01_L478)                        ;B3AD89
    %AICMD0x12_Jump(pAIScripting0x01_L471)                                   ;B3AD8D
pAIScripting0x01_L477:
    %AICMD0x23_OrWithIndexedValue(strcFlags.event2, $05)       ;B3AD90
    %AICMD0x1C_ShowDialog($0131, $00)                          ;B3AD95
    %AICMD0x12_Jump(pAIScripting0x01_L472)                                   ;B3AD99
pAIScripting0x01_L478:
    %AICMD0x1C_ShowDialog($0132, $00)                          ;B3AD9C
    %AICMD0x12_Jump(pAIScripting0x01_L471)                                   ;B3ADA0
pAIScripting0x01_L479:
    %AICMD0x1C_ShowDialog($0139, $00)                          ;B3ADA3
    %AICMD0x12_Jump(pAIScripting0x01_L472)                                   ;B3ADA7
pAIScripting0x01_L480:
    %AICMD0x1C_ShowDialog($0133, $00)                          ;B3ADAA
    %AICMD0x12_Jump(pAIScripting0x01_L471)                                   ;B3ADAE


DATA8_B3ADB1:
    %AICMD0x11_EnableUserControl()                             ;B3ADB1
    %AICMD0x09_StartScript($01, pAIScripting0x01_L482)                                   ;B3ADB2
    %AICMD0x09_StartScript($02, pAIScripting0x01_L485)                                   ;B3ADB6
    %AICMD0x09_StartScript($03, pAIScripting0x01_L488)                                   ;B3ADBA
pAIScripting0x01_L481:
    %AICMD0x13_Wait(1)                                         ;B3ADBE
    %AICMD0x12_Jump(pAIScripting0x01_L481)                                   ;B3ADC1
pAIScripting0x01_L482:
    %AICMD0x1A($0068, $0178, aAIScriptingData_L080, $00)                     ;B3ADC4
pAIScripting0x01_L483:
    %AICMD0x1F(pAIScripting0x01_L484)                                        ;B3ADCC
    %AICMD0x12_Jump(pAIScripting0x01_L483)                                   ;B3ADCF
pAIScripting0x01_L484:
    %AICMD0x1D_ShowDialog($0170, $00)                          ;B3ADD2
    %AICMD0x12_Jump(pAIScripting0x01_L483)                                   ;B3ADD6
pAIScripting0x01_L485:
    %AICMD0x1A($0038, $0178, aAIScriptingData_L080, $00)                     ;B3ADD9
pAIScripting0x01_L486:
    %AICMD0x1F(pAIScripting0x01_L487)                                        ;B3ADE1
    %AICMD0x12_Jump(pAIScripting0x01_L486)                                   ;B3ADE4
pAIScripting0x01_L487:
    %AICMD0x1C_ShowDialog($0171, $00)                          ;B3ADE7
    %AICMD0x12_Jump(pAIScripting0x01_L486)                                   ;B3ADEB
pAIScripting0x01_L488:
    %AICMD0x1A($0078, $0068, aAIScriptingData_L080, $01)                     ;B3ADEE
pAIScripting0x01_L489:
    %AICMD0x1F(pAIScripting0x01_L490)                                        ;B3ADF6
    %AICMD0x12_Jump(pAIScripting0x01_L489)                                   ;B3ADF9
pAIScripting0x01_L490:
    %AICMD0x1C_ShowDialog($0172, $00)                          ;B3ADFC
    %AICMD0x12_Jump(pAIScripting0x01_L489)                                   ;B3AE00
