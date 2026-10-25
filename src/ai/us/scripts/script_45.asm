

pAIScripting0x45:
    dw pAIScripting0x45_Data01                                            ;B5A1E5|        |B5A205;
    dw pAIScripting0x45_Data02                                            ;B5A1E7|        |B5A2FD;
    dw pAIScripting0x45_Data03                                            ;B5A1E9|        |B5A407;
    dw pAIScripting0x45_Data04                                            ;B5A1EB|        |B5A484;
    dw pAIScripting0x45_Data05                                            ;B5A1ED|        |B5A57C;
    dw pAIScripting0x45_Data06                                            ;B5A1EF|        |B5A686;
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
 
pAIScripting0x45_Data01:
 
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
    %AICMD0x2D_JumpOnInteract(pAIScripting0x45_L008, pAIScripting0x45_L004)                               ;B5A246
    %AICMD0x12_Jump(pAIScripting0x45_L002)                                   ;B5A24B
pAIScripting0x45_L003:
    %AICMD0x13_Wait(1)                                         ;B5A24E
    %AICMD0x12_Jump(pAIScripting0x45_L003)                                   ;B5A251
pAIScripting0x45_L004:
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 6, pAIScripting0x45_L005)              ;B5A254
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 9, 12, pAIScripting0x45_L007)         ;B5A25B
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
    %AICMD0x17_RollRandom($02)                                            ;B5A299
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x45_L009)                                   ;B5A29B
    %AICMD0x18_JumpIfRandomEquals($01, pAIScripting0x45_L010)                                   ;B5A29F
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
    %AICMD0x2D_JumpOnInteract(pAIScripting0x45_L014, pAIScripting0x45_L004)                               ;B5A2CE
    %AICMD0x12_Jump(pAIScripting0x45_L013)                                   ;B5A2D3
pAIScripting0x45_L014:
    %AICMD0x17_RollRandom($02)                                            ;B5A2D6
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x45_L015)                                   ;B5A2D8
    %AICMD0x18_JumpIfRandomEquals($01, pAIScripting0x45_L016)                                   ;B5A2DC
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


pAIScripting0x45_Data02:
 
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
    %AICMD0x2D_JumpOnInteract(pAIScripting0x45_L008, pAIScripting0x45_L004)                               ;B5A378
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
    %AICMD0x2D_JumpOnInteract(pAIScripting0x45_L008, pAIScripting0x45_L004)                               ;B5A3BB
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
    %AICMD0x2D_JumpOnInteract(pAIScripting0x45_L008, pAIScripting0x45_L004)                               ;B5A3FE
    %AICMD0x12_Jump(pAIScripting0x45_L033)                                   ;B5A403
pAIScripting0x45_L034:
    %AICMD0x10_End()                                           ;B5A406


pAIScripting0x45_Data03:
 
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
    %AICMD0x2D_JumpOnInteract(pAIScripting0x45_L008, pAIScripting0x45_L004)                               ;B5A47C
    %AICMD0x12_Jump(pAIScripting0x45_L043)                                   ;B5A481


pAIScripting0x45_Data04:
 
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
    %AICMD0x2D_JumpOnInteract(pAIScripting0x45_L051, pAIScripting0x45_L047)                               ;B5A4C5
    %AICMD0x12_Jump(pAIScripting0x45_L045)                                   ;B5A4CA
pAIScripting0x45_L046:
    %AICMD0x13_Wait(1)                                         ;B5A4CD
    %AICMD0x12_Jump(pAIScripting0x45_L046)                                   ;B5A4D0
pAIScripting0x45_L047:
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 6, pAIScripting0x45_L048)              ;B5A4D3
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 9, 12, pAIScripting0x45_L050)         ;B5A4DA
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
    %AICMD0x17_RollRandom($02)                                            ;B5A518
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x45_L052)                                   ;B5A51A
    %AICMD0x18_JumpIfRandomEquals($01, pAIScripting0x45_L053)                                   ;B5A51E
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
    %AICMD0x2D_JumpOnInteract(pAIScripting0x45_L057, pAIScripting0x45_L047)                               ;B5A54D
    %AICMD0x12_Jump(pAIScripting0x45_L056)                                   ;B5A552
pAIScripting0x45_L057:
    %AICMD0x17_RollRandom($02)                                            ;B5A555
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x45_L058)                                   ;B5A557
    %AICMD0x18_JumpIfRandomEquals($01, pAIScripting0x45_L059)                                   ;B5A55B
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


pAIScripting0x45_Data05:
 
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
    %AICMD0x2D_JumpOnInteract(pAIScripting0x45_L051, pAIScripting0x45_L047)                               ;B5A5F7
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
    %AICMD0x2D_JumpOnInteract(pAIScripting0x45_L051, pAIScripting0x45_L047)                               ;B5A63A
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
    %AICMD0x2D_JumpOnInteract(pAIScripting0x45_L051, pAIScripting0x45_L047)                               ;B5A67D
    %AICMD0x12_Jump(pAIScripting0x45_L076)                                   ;B5A682
pAIScripting0x45_L077:
    %AICMD0x10_End()                                           ;B5A685


pAIScripting0x45_Data06:
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
    %AICMD0x2D_JumpOnInteract(pAIScripting0x45_L051, pAIScripting0x45_L047)                               ;B5A6FB
    %AICMD0x12_Jump(pAIScripting0x45_L086)                                   ;B5A700
