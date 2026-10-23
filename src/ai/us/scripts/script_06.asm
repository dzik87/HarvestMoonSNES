

pAIScripting0x06:
    dw DATA8_B3D467                                            ;B3D447|        |B3D467;
    dw DATA8_B3D59D                                            ;B3D449|        |B3D59D;
    dw DATA8_B3D5E3                                            ;B3D44B|        |B3D5E3;
    dw DATA8_B3D6CF                                            ;B3D44D|        |B3D6CF;
    dw DATA8_B3D7C9                                            ;B3D44F|        |B3D7C9;
    dw DATA8_B3D90E                                            ;B3D451|        |B3D90E;
    dw DATA8_B3D99B                                            ;B3D453|        |B3D99B;
    dw pAIScripting0x07                                        ;B3D455|        |B3D9F7;
    dw pAIScripting0x07                                        ;B3D457|        |B3D9F7;
    dw pAIScripting0x07                                        ;B3D459|        |B3D9F7;
    dw pAIScripting0x07                                        ;B3D45B|        |B3D9F7;
    dw pAIScripting0x07                                        ;B3D45D|        |B3D9F7;
    dw pAIScripting0x07                                        ;B3D45F|        |B3D9F7;
    dw pAIScripting0x07                                        ;B3D461|        |B3D9F7;
    dw pAIScripting0x07                                        ;B3D463|        |B3D9F7;
    dw pAIScripting0x07                                        ;B3D465|        |B3D9F7;
 
DATA8_B3D467:
 
    %AICMD0x11_EnableUserControl()                             ;B3D467
    %AICMD0x09_StartScript($01, pAIScripting0x06_L004)                                   ;B3D468
    %AICMD0x09_StartScript($02, pAIScripting0x06_L010)                                   ;B3D46C
    %AICMD0x12_Jump(pAIScripting0x06_L002)                                   ;B3D470
pAIScripting0x06_L001:
    %AICMD0x13_Wait(1)                                         ;B3D473
    %AICMD0x12_Jump(pAIScripting0x06_L001)                                   ;B3D476
pAIScripting0x06_L002:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $00, pAIScripting0x06_L003)   ;B3D479
    %AICMD0x14_JumpIfFlagSet(strcFlags.event4, $0C, pAIScripting0x06_L003)   ;B3D480
    %AICMD0x09_StartScript($03, pAIScripting0x06_L016)                                   ;B3D487
pAIScripting0x06_L003:
    %AICMD0x12_Jump(pAIScripting0x06_L001)                                   ;B3D48B
pAIScripting0x06_L004:
    %AICMD0x1A($00A8, $0078, aAIScriptingData_L045, $00)                     ;B3D48E
    %AICMD0x22($20, $18, $01, aAIScriptingData_L045, $10)                    ;B3D496
pAIScripting0x06_L005:
    %AICMD0x2D_JumpOnInteract(pAIScripting0x06_L008, pAIScripting0x06_L006)                               ;B3D49D
    %AICMD0x12_Jump(pAIScripting0x06_L005)                                   ;B3D4A2
pAIScripting0x06_L006:
    %AICMD0x16_JumpIfBetween8($80091E, 9, 12, pAIScripting0x06_L007)         ;B3D4A5
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3D4AD
    %AICMD0x12_Jump(pAIScripting0x06_L005)                                   ;B3D4B1
pAIScripting0x06_L007:
    %AICMD0x1C_ShowDialog($03B8, $00)                          ;B3D4B4
    %AICMD0x12_Jump(pAIScripting0x06_L005)                                   ;B3D4B8
pAIScripting0x06_L008:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $05, pAIScripting0x06_L009)   ;B3D4BB
    %AICMD0x1C_ShowDialog($0153, $00)                          ;B3D4C2
    %AICMD0x12_Jump(pAIScripting0x06_L005)                                   ;B3D4C6
pAIScripting0x06_L009:
    %AICMD0x1C_ShowDialog($0400, $00)                          ;B3D4C9
    %AICMD0x12_Jump(pAIScripting0x06_L005)                                   ;B3D4CD
pAIScripting0x06_L010:
    %AICMD0x1A($0188, $00A0, aAIScriptingData_L061, $00)                     ;B3D4D0
pAIScripting0x06_L011:
    %AICMD0x2D_JumpOnInteract(pAIScripting0x06_L014, pAIScripting0x06_L012)                               ;B3D4D8
    %AICMD0x12_Jump(pAIScripting0x06_L011)                                   ;B3D4DD
pAIScripting0x06_L012:
    %AICMD0x16_JumpIfBetween8($80091E, 9, 12, pAIScripting0x06_L013)         ;B3D4E0
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3D4E8
    %AICMD0x12_Jump(pAIScripting0x06_L011)                                   ;B3D4EC
pAIScripting0x06_L013:
    %AICMD0x1C_ShowDialog($03B9, $00)                          ;B3D4EF
    %AICMD0x12_Jump(pAIScripting0x06_L011)                                   ;B3D4F3
pAIScripting0x06_L014:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $05, pAIScripting0x06_L015)   ;B3D4F6
    %AICMD0x1C_ShowDialog($0154, $00)                          ;B3D4FD
    %AICMD0x12_Jump(pAIScripting0x06_L011)                                   ;B3D501
pAIScripting0x06_L015:
    %AICMD0x1C_ShowDialog($0401, $00)                          ;B3D504
    %AICMD0x12_Jump(pAIScripting0x06_L011)                                   ;B3D508
pAIScripting0x06_L016:
    %AICMD0x1A($0048, $0198, aAIScriptingData_L012, $00)                     ;B3D50B
pAIScripting0x06_L017:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x06_L018)                                        ;B3D513
    %AICMD0x2D_JumpOnInteract(pAIScripting0x06_L020, pAIScripting0x06_L022)                               ;B3D516
    %AICMD0x12_Jump(pAIScripting0x06_L017)                                   ;B3D51B
pAIScripting0x06_L018:
    %AICMD0x45_JumpIfBetween16(nLove_Maria, 0, 249, pAIScripting0x06_L019)   ;B3D51E
    %AICMD0x1C_ShowDialog($043D, $00)                          ;B3D528
    %AICMD0x12_Jump(pAIScripting0x06_L017)                                   ;B3D52C
pAIScripting0x06_L019:
    %AICMD0x1C_ShowDialog($0174, $00)                          ;B3D52F
    %AICMD0x12_Jump(pAIScripting0x06_L017)                                   ;B3D533
pAIScripting0x06_L020:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $05, pAIScripting0x06_L021)   ;B3D536
    %AICMD0x1C_ShowDialog($0155, $00)                          ;B3D53D
    %AICMD0x12_Jump(pAIScripting0x06_L017)                                   ;B3D541
pAIScripting0x06_L021:
    %AICMD0x1C_ShowDialog($0161, $00)                          ;B3D544
    %AICMD0x12_Jump(pAIScripting0x06_L017)                                   ;B3D548
pAIScripting0x06_L022:
    %AICMD0x15_JumpIfEquals8($80091E, 2, pAIScripting0x06_L023)              ;B3D54B
    %AICMD0x16_JumpIfBetween8($80091E, 3, 5, pAIScripting0x06_L025)          ;B3D552
    %AICMD0x15_JumpIfEquals8($80091E, 86, pAIScripting0x06_L025)             ;B3D55A
    %AICMD0x15_JumpIfEquals8($80091E, 25, pAIScripting0x06_L024)             ;B3D561
    %AICMD0x15_JumpIfEquals8($80091E, 73, pAIScripting0x06_L024)             ;B3D568
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3D56F
    %AICMD0x12_Jump(pAIScripting0x06_L017)                                   ;B3D573
pAIScripting0x06_L023:
    %AICMD0x1C_ShowDialog($03B0, $00)                          ;B3D576
    %AICMD0x41_AddValue16(nLove_Maria, -8)                     ;B3D57A
    %AICMD0x12_Jump(pAIScripting0x06_L017)                                   ;B3D580
pAIScripting0x06_L024:
    %AICMD0x1C_ShowDialog($0212, $00)                          ;B3D583
    %AICMD0x41_AddValue16(nLove_Maria, 4)                      ;B3D587
    %AICMD0x12_Jump(pAIScripting0x06_L017)                                   ;B3D58D
pAIScripting0x06_L025:
    %AICMD0x1C_ShowDialog($03B5, $00)                          ;B3D590
    %AICMD0x41_AddValue16(nLove_Maria, 3)                      ;B3D594
    %AICMD0x12_Jump(pAIScripting0x06_L017)                                   ;B3D59A


DATA8_B3D59D:
 
    %AICMD0x11_EnableUserControl()                             ;B3D59D
    %AICMD0x09_StartScript($01, pAIScripting0x06_L027)                                   ;B3D59E
pAIScripting0x06_L026:
    %AICMD0x13_Wait(1)                                         ;B3D5A2
    %AICMD0x12_Jump(pAIScripting0x06_L026)                                   ;B3D5A5
pAIScripting0x06_L027:
    %AICMD0x1A($0068, $00E8, aAIScriptingData_L051, $00)                     ;B3D5A8
pAIScripting0x06_L028:
    %AICMD0x2D_JumpOnInteract(pAIScripting0x06_L031, pAIScripting0x06_L029)                               ;B3D5B0
    %AICMD0x12_Jump(pAIScripting0x06_L028)                                   ;B3D5B5
pAIScripting0x06_L029:
    %AICMD0x16_JumpIfBetween8($80091E, 9, 12, pAIScripting0x06_L030)         ;B3D5B8
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3D5C0
    %AICMD0x12_Jump(pAIScripting0x06_L028)                                   ;B3D5C4
pAIScripting0x06_L030:
    %AICMD0x1C_ShowDialog($03B0, $00)                          ;B3D5C7
    %AICMD0x12_Jump(pAIScripting0x06_L028)                                   ;B3D5CB
pAIScripting0x06_L031:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $05, pAIScripting0x06_L032)   ;B3D5CE
    %AICMD0x1C_ShowDialog($015A, $00)                          ;B3D5D5
    %AICMD0x12_Jump(pAIScripting0x06_L028)                                   ;B3D5D9
pAIScripting0x06_L032:
    %AICMD0x1C_ShowDialog($016F, $00)                          ;B3D5DC
    %AICMD0x12_Jump(pAIScripting0x06_L028)                                   ;B3D5E0


DATA8_B3D5E3:
 
    %AICMD0x11_EnableUserControl()                             ;B3D5E3
    %AICMD0x09_StartScript($01, pAIScripting0x06_L036)                                   ;B3D5E4
    %AICMD0x12_Jump(pAIScripting0x06_L034)                                   ;B3D5E8
pAIScripting0x06_L033:
    %AICMD0x13_Wait(1)                                         ;B3D5EB
    %AICMD0x12_Jump(pAIScripting0x06_L033)                                   ;B3D5EE
pAIScripting0x06_L034:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, pAIScripting0x06_L035)   ;B3D5F1
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $00, pAIScripting0x06_L035)   ;B3D5F8
    %AICMD0x09_StartScript($02, pAIScripting0x06_L042)                                   ;B3D5FF
pAIScripting0x06_L035:
    %AICMD0x12_Jump(pAIScripting0x06_L033)                                   ;B3D603
pAIScripting0x06_L036:
    %AICMD0x1A($0028, $0168, aAIScriptingData_L064, $02)                     ;B3D606
pAIScripting0x06_L037:
    %AICMD0x2D_JumpOnInteract(pAIScripting0x06_L040, pAIScripting0x06_L038)                               ;B3D60E
    %AICMD0x12_Jump(pAIScripting0x06_L037)                                   ;B3D613
pAIScripting0x06_L038:
    %AICMD0x16_JumpIfBetween8($80091E, 9, 12, pAIScripting0x06_L039)         ;B3D616
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3D61E
    %AICMD0x12_Jump(pAIScripting0x06_L037)                                   ;B3D622
pAIScripting0x06_L039:
    %AICMD0x1C_ShowDialog($03B9, $00)                          ;B3D625
    %AICMD0x12_Jump(pAIScripting0x06_L037)                                   ;B3D629
pAIScripting0x06_L040:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $05, pAIScripting0x06_L041)   ;B3D62C
    %AICMD0x1C_ShowDialog($0158, $00)                          ;B3D633
    %AICMD0x12_Jump(pAIScripting0x06_L037)                                   ;B3D637
pAIScripting0x06_L041:
    %AICMD0x1C_ShowDialog($016B, $00)                          ;B3D63A
    %AICMD0x12_Jump(pAIScripting0x06_L037)                                   ;B3D63E
pAIScripting0x06_L042:
    %AICMD0x1A($0078, $0088, aAIScriptingData_L020, $00)                     ;B3D641
    %AICMD0x12_Jump(pAIScripting0x06_L043)                                   ;B3D649
pAIScripting0x06_L043:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x06_L044)                                        ;B3D64C
    %AICMD0x2D_JumpOnInteract(pAIScripting0x06_L050, pAIScripting0x06_L046)                               ;B3D64F
    %AICMD0x12_Jump(pAIScripting0x06_L043)                                   ;B3D654
pAIScripting0x06_L044:
    %AICMD0x45_JumpIfBetween16(nLove_Nina, 0, 249, pAIScripting0x06_L045)    ;B3D657
    %AICMD0x1C_ShowDialog($043F, $00)                          ;B3D661
    %AICMD0x12_Jump(pAIScripting0x06_L043)                                   ;B3D665
pAIScripting0x06_L045:
    %AICMD0x1C_ShowDialog($0178, $00)                          ;B3D668
    %AICMD0x12_Jump(pAIScripting0x06_L043)                                   ;B3D66C
pAIScripting0x06_L046:
    %AICMD0x16_JumpIfBetween8($80091E, 1, 4, pAIScripting0x06_L047)          ;B3D66F
    %AICMD0x15_JumpIfEquals8($80091E, 5, pAIScripting0x06_L048)              ;B3D677
    %AICMD0x15_JumpIfEquals8($80091E, 6, pAIScripting0x06_L048)              ;B3D67E
    %AICMD0x15_JumpIfEquals8($80091E, 25, pAIScripting0x06_L049)             ;B3D685
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3D68C
    %AICMD0x12_Jump(pAIScripting0x06_L043)                                   ;B3D690
pAIScripting0x06_L047:
    %AICMD0x1C_ShowDialog($03B2, $00)                          ;B3D693
    %AICMD0x41_AddValue16(nLove_Nina, -5)                      ;B3D697
    %AICMD0x12_Jump(pAIScripting0x06_L043)                                   ;B3D69D
pAIScripting0x06_L048:
    %AICMD0x1C_ShowDialog($0212, $00)                          ;B3D6A0
    %AICMD0x41_AddValue16(nLove_Nina, 8)                       ;B3D6A4
    %AICMD0x12_Jump(pAIScripting0x06_L043)                                   ;B3D6AA
pAIScripting0x06_L049:
    %AICMD0x1C_ShowDialog($03B1, $00)                          ;B3D6AD
    %AICMD0x41_AddValue16(nLove_Nina, -8)                      ;B3D6B1
    %AICMD0x12_Jump(pAIScripting0x06_L043)                                   ;B3D6B7
pAIScripting0x06_L050:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $05, pAIScripting0x06_L051)   ;B3D6BA
    %AICMD0x1C_ShowDialog($0159, $00)                          ;B3D6C1
    %AICMD0x12_Jump(pAIScripting0x06_L043)                                   ;B3D6C5
pAIScripting0x06_L051:
    %AICMD0x1C_ShowDialog($0163, $00)                          ;B3D6C8
    %AICMD0x12_Jump(pAIScripting0x06_L043)                                   ;B3D6CC


DATA8_B3D6CF:
 
    %AICMD0x11_EnableUserControl()                             ;B3D6CF
    %AICMD0x09_StartScript($01, pAIScripting0x06_L055)                                   ;B3D6D0
    %AICMD0x12_Jump(pAIScripting0x06_L053)                                   ;B3D6D4
pAIScripting0x06_L052:
    %AICMD0x13_Wait(1)                                         ;B3D6D7
    %AICMD0x12_Jump(pAIScripting0x06_L052)                                   ;B3D6DA
pAIScripting0x06_L053:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $01, pAIScripting0x06_L054)   ;B3D6DD
    %AICMD0x09_StartScript($02, pAIScripting0x06_L061)                                   ;B3D6E4
pAIScripting0x06_L054:
    %AICMD0x12_Jump(pAIScripting0x06_L052)                                   ;B3D6E8
pAIScripting0x06_L055:
    %AICMD0x1A($0028, $0168, aAIScriptingData_L046, $00)                     ;B3D6EB
pAIScripting0x06_L056:
    %AICMD0x2D_JumpOnInteract(pAIScripting0x06_L059, pAIScripting0x06_L057)                               ;B3D6F3
    %AICMD0x12_Jump(pAIScripting0x06_L056)                                   ;B3D6F8
pAIScripting0x06_L057:
    %AICMD0x16_JumpIfBetween8($80091E, 9, 12, pAIScripting0x06_L058)         ;B3D6FB
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3D703
    %AICMD0x12_Jump(pAIScripting0x06_L056)                                   ;B3D707
pAIScripting0x06_L058:
    %AICMD0x1C_ShowDialog($0049, $00)                          ;B3D70A
    %AICMD0x12_Jump(pAIScripting0x06_L056)                                   ;B3D70E
pAIScripting0x06_L059:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $05, pAIScripting0x06_L060)   ;B3D711
    %AICMD0x1C_ShowDialog($0156, $00)                          ;B3D718
    %AICMD0x12_Jump(pAIScripting0x06_L056)                                   ;B3D71C
pAIScripting0x06_L060:
    %AICMD0x1C_ShowDialog($016F, $00)                          ;B3D71F
    %AICMD0x12_Jump(pAIScripting0x06_L056)                                   ;B3D723
pAIScripting0x06_L061:
    %AICMD0x1A($00C8, $0098, aAIScriptingData_L015, $00)                     ;B3D726
    %AICMD0x22($20, $18, $01, aAIScriptingData_L016, $10)                    ;B3D72E
    %AICMD0x12_Jump(pAIScripting0x06_L062)                                   ;B3D735
pAIScripting0x06_L062:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x06_L063)                                        ;B3D738
    %AICMD0x2D_JumpOnInteract(pAIScripting0x06_L069, pAIScripting0x06_L065)                               ;B3D73B
    %AICMD0x12_Jump(pAIScripting0x06_L062)                                   ;B3D740
pAIScripting0x06_L063:
    %AICMD0x45_JumpIfBetween16(nLove_Ellen, 0, 249, pAIScripting0x06_L064)   ;B3D743
    %AICMD0x1C_ShowDialog($043E, $00)                          ;B3D74D
    %AICMD0x12_Jump(pAIScripting0x06_L062)                                   ;B3D751
pAIScripting0x06_L064:
    %AICMD0x1C_ShowDialog($0176, $00)                          ;B3D754
    %AICMD0x12_Jump(pAIScripting0x06_L062)                                   ;B3D758
pAIScripting0x06_L065:
    %AICMD0x15_JumpIfEquals8($80091E, 1, pAIScripting0x06_L067)              ;B3D75B
    %AICMD0x15_JumpIfEquals8($80091E, 2, pAIScripting0x06_L066)              ;B3D762
    %AICMD0x16_JumpIfBetween8($80091E, 3, 7, pAIScripting0x06_L067)          ;B3D769
    %AICMD0x15_JumpIfEquals8($80091E, 6, pAIScripting0x06_L067)              ;B3D771
    %AICMD0x15_JumpIfEquals8($80091E, 25, pAIScripting0x06_L068)             ;B3D778
    %AICMD0x15_JumpIfEquals8($80091E, 73, pAIScripting0x06_L068)             ;B3D77F
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3D786
    %AICMD0x12_Jump(pAIScripting0x06_L062)                                   ;B3D78A
pAIScripting0x06_L066:
    %AICMD0x1C_ShowDialog($03B4, $00)                          ;B3D78D
    %AICMD0x41_AddValue16(nLove_Ann, -8)                       ;B3D791
    %AICMD0x12_Jump(pAIScripting0x06_L062)                                   ;B3D797
pAIScripting0x06_L067:
    %AICMD0x1C_ShowDialog($03B2, $00)                          ;B3D79A
    %AICMD0x41_AddValue16(nLove_Ann, 5)                        ;B3D79E
    %AICMD0x12_Jump(pAIScripting0x06_L062)                                   ;B3D7A4
pAIScripting0x06_L068:
    %AICMD0x1C_ShowDialog($0212, $00)                          ;B3D7A7
    %AICMD0x41_AddValue16(nLove_Ann, 2)                        ;B3D7AB
    %AICMD0x12_Jump(pAIScripting0x06_L062)                                   ;B3D7B1
pAIScripting0x06_L069:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $05, pAIScripting0x06_L070)   ;B3D7B4
    %AICMD0x1C_ShowDialog($0157, $00)                          ;B3D7BB
    %AICMD0x12_Jump(pAIScripting0x06_L062)                                   ;B3D7BF
pAIScripting0x06_L070:
    %AICMD0x1C_ShowDialog($0162, $00)                          ;B3D7C2
    %AICMD0x12_Jump(pAIScripting0x06_L062)                                   ;B3D7C6


DATA8_B3D7C9:
 
    %AICMD0x11_EnableUserControl()                             ;B3D7C9
    %AICMD0x09_StartScript($01, pAIScripting0x06_L076)                                   ;B3D7CA
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $02, pAIScripting0x06_L072)   ;B3D7CE
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $03, pAIScripting0x06_L072)   ;B3D7D5
    %AICMD0x09_StartScript($03, pAIScripting0x06_L074)                                   ;B3D7DC
    %AICMD0x12_Jump(pAIScripting0x06_L072)                                   ;B3D7E0
pAIScripting0x06_L071:
    %AICMD0x13_Wait(1)                                         ;B3D7E3
    %AICMD0x12_Jump(pAIScripting0x06_L071)                                   ;B3D7E6
pAIScripting0x06_L072:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $03, pAIScripting0x06_L073)   ;B3D7E9
    %AICMD0x09_StartScript($02, pAIScripting0x06_L085)                                   ;B3D7F0
pAIScripting0x06_L073:
    %AICMD0x12_Jump(pAIScripting0x06_L071)                                   ;B3D7F4
pAIScripting0x06_L074:
    %AICMD0x1A($0087, $0097, aAIScriptingData_L091, $00)                     ;B3D7F7
pAIScripting0x06_L075:
    %AICMD0x13_Wait(1)                                         ;B3D7FF
    %AICMD0x12_Jump(pAIScripting0x06_L075)                                   ;B3D802
pAIScripting0x06_L076:
    %AICMD0x1A($0028, $0198, aAIScriptingData_L048, $02)                     ;B3D805
pAIScripting0x06_L077:
    %AICMD0x2D_JumpOnInteract(pAIScripting0x06_L080, pAIScripting0x06_L078)                               ;B3D80D
    %AICMD0x12_Jump(pAIScripting0x06_L077)                                   ;B3D812
pAIScripting0x06_L078:
    %AICMD0x16_JumpIfBetween8($80091E, 9, 12, pAIScripting0x06_L079)         ;B3D815
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3D81D
    %AICMD0x12_Jump(pAIScripting0x06_L077)                                   ;B3D821
pAIScripting0x06_L079:
    %AICMD0x1C_ShowDialog($03BB, $00)                          ;B3D824
    %AICMD0x12_Jump(pAIScripting0x06_L077)                                   ;B3D828
pAIScripting0x06_L080:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $05, pAIScripting0x06_L081)   ;B3D82B
    %AICMD0x1C_ShowDialog($015E, $00)                          ;B3D832
    %AICMD0x12_Jump(pAIScripting0x06_L077)                                   ;B3D836
pAIScripting0x06_L081:
    %AICMD0x1C_ShowDialog($0402, $00)                          ;B3D839
    %AICMD0x12_Jump(pAIScripting0x06_L077)                                   ;B3D83D
    %AICMD0x1A($0098, $0158, aAIScriptingData_L050, $00)                     ;B3D840
pAIScripting0x06_L082:
    %AICMD0x2D_JumpOnInteract(pAIScripting0x06_L084, pAIScripting0x06_L083)                               ;B3D848
    %AICMD0x12_Jump(pAIScripting0x06_L082)                                   ;B3D84D
pAIScripting0x06_L083:
    %AICMD0x1C_ShowDialog($03BC, $00)                          ;B3D850
    %AICMD0x12_Jump(pAIScripting0x06_L082)                                   ;B3D854
pAIScripting0x06_L084:
    %AICMD0x1C_ShowDialog($0051, $00)                          ;B3D857
    %AICMD0x12_Jump(pAIScripting0x06_L082)                                   ;B3D85B
pAIScripting0x06_L085:
    %AICMD0x1A($0058, $01B8, aAIScriptingData_L022, $00)                     ;B3D85E
pAIScripting0x06_L086:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x06_L087)                                        ;B3D866
    %AICMD0x2D_JumpOnInteract(pAIScripting0x06_L094, pAIScripting0x06_L089)                               ;B3D869
    %AICMD0x12_Jump(pAIScripting0x06_L086)                                   ;B3D86E
pAIScripting0x06_L087:
    %AICMD0x45_JumpIfBetween16(nLove_Ellen, 0, 249, pAIScripting0x06_L088)   ;B3D871
    %AICMD0x1C_ShowDialog($0440, $00)                          ;B3D87B
    %AICMD0x12_Jump(pAIScripting0x06_L086)                                   ;B3D87F
pAIScripting0x06_L088:
    %AICMD0x1C_ShowDialog($017A, $00)                          ;B3D882
    %AICMD0x12_Jump(pAIScripting0x06_L086)                                   ;B3D886
pAIScripting0x06_L089:
    %AICMD0x16_JumpIfBetween8($80091E, 1, 5, pAIScripting0x06_L090)          ;B3D889
    %AICMD0x15_JumpIfEquals8($80091E, 7, pAIScripting0x06_L090)              ;B3D891
    %AICMD0x15_JumpIfEquals8($80091E, 25, pAIScripting0x06_L092)             ;B3D898
    %AICMD0x15_JumpIfEquals8($80091E, 73, pAIScripting0x06_L092)             ;B3D89F
    %AICMD0x16_JumpIfBetween8($80091E, 16, 19, pAIScripting0x06_L090)        ;B3D8A6
    %AICMD0x16_JumpIfBetween8($80091E, 20, 23, pAIScripting0x06_L091)        ;B3D8AE
    %AICMD0x16_JumpIfBetween8($80091E, 9, 12, pAIScripting0x06_L093)         ;B3D8B6
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3D8BE
    %AICMD0x12_Jump(pAIScripting0x06_L086)                                   ;B3D8C2
pAIScripting0x06_L090:
    %AICMD0x1C_ShowDialog($03B2, $00)                          ;B3D8C5
    %AICMD0x41_AddValue16(nLove_Ellen, 6)                      ;B3D8C9
    %AICMD0x12_Jump(pAIScripting0x06_L086)                                   ;B3D8CF
pAIScripting0x06_L091:
    %AICMD0x1C_ShowDialog($03B3, $00)                          ;B3D8D2
    %AICMD0x41_AddValue16(nLove_Ellen, 8)                      ;B3D8D6
    %AICMD0x12_Jump(pAIScripting0x06_L086)                                   ;B3D8DC
pAIScripting0x06_L092:
    %AICMD0x1C_ShowDialog($0212, $00)                          ;B3D8DF
    %AICMD0x41_AddValue16(nLove_Ellen, 5)                      ;B3D8E3
    %AICMD0x12_Jump(pAIScripting0x06_L086)                                   ;B3D8E9
pAIScripting0x06_L093:
    %AICMD0x1C_ShowDialog($01DA, $00)                          ;B3D8EC
    %AICMD0x41_AddValue16(nLove_Ellen, -2)                     ;B3D8F0
    %AICMD0x12_Jump(pAIScripting0x06_L086)                                   ;B3D8F6
pAIScripting0x06_L094:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $05, pAIScripting0x06_L095)   ;B3D8F9
    %AICMD0x1C_ShowDialog($0158, $00)                          ;B3D900
    %AICMD0x12_Jump(pAIScripting0x06_L086)                                   ;B3D904
pAIScripting0x06_L095:
    %AICMD0x1C_ShowDialog($0164, $00)                          ;B3D907
    %AICMD0x12_Jump(pAIScripting0x06_L086)                                   ;B3D90B


DATA8_B3D90E:
 
    %AICMD0x11_EnableUserControl()                             ;B3D90E
    %AICMD0x09_StartScript($01, pAIScripting0x06_L097)                                   ;B3D90F
    %AICMD0x09_StartScript($02, pAIScripting0x06_L103)                                   ;B3D913
pAIScripting0x06_L096:
    %AICMD0x13_Wait(1)                                         ;B3D917
    %AICMD0x12_Jump(pAIScripting0x06_L096)                                   ;B3D91A
pAIScripting0x06_L097:
    %AICMD0x1A($0088, $0050, aAIScriptingData_L042, $00)                     ;B3D91D
pAIScripting0x06_L098:
    %AICMD0x2D_JumpOnInteract(pAIScripting0x06_L101, pAIScripting0x06_L099)                               ;B3D925
    %AICMD0x12_Jump(pAIScripting0x06_L098)                                   ;B3D92A
pAIScripting0x06_L099:
    %AICMD0x16_JumpIfBetween8($80091E, 9, 12, pAIScripting0x06_L100)         ;B3D92D
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3D935
    %AICMD0x12_Jump(pAIScripting0x06_L098)                                   ;B3D939
pAIScripting0x06_L100:
    %AICMD0x1C_ShowDialog($03BB, $00)                          ;B3D93C
    %AICMD0x12_Jump(pAIScripting0x06_L098)                                   ;B3D940
pAIScripting0x06_L101:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $05, pAIScripting0x06_L102)   ;B3D943
    %AICMD0x1C_ShowDialog($015E, $00)                          ;B3D94A
    %AICMD0x12_Jump(pAIScripting0x06_L098)                                   ;B3D94E
pAIScripting0x06_L102:
    %AICMD0x1C_ShowDialog($0168, $00)                          ;B3D951
    %AICMD0x12_Jump(pAIScripting0x06_L098)                                   ;B3D955
pAIScripting0x06_L103:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event4, $0A, pAIScripting0x06_L109)   ;B3D958
    %AICMD0x1A($0038, $0098, aAIScriptingData_L056, $00)                     ;B3D95F
pAIScripting0x06_L104:
    %AICMD0x2D_JumpOnInteract(pAIScripting0x06_L107, pAIScripting0x06_L105)                               ;B3D967
    %AICMD0x12_Jump(pAIScripting0x06_L104)                                   ;B3D96C
pAIScripting0x06_L105:
    %AICMD0x16_JumpIfBetween8($80091E, 9, 12, pAIScripting0x06_L106)         ;B3D96F
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3D977
    %AICMD0x12_Jump(pAIScripting0x06_L104)                                   ;B3D97B
pAIScripting0x06_L106:
    %AICMD0x1C_ShowDialog($03BA, $00)                          ;B3D97E
    %AICMD0x12_Jump(pAIScripting0x06_L104)                                   ;B3D982
pAIScripting0x06_L107:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $05, pAIScripting0x06_L108)   ;B3D985
    %AICMD0x1C_ShowDialog($0154, $00)                          ;B3D98C
    %AICMD0x12_Jump(pAIScripting0x06_L104)                                   ;B3D990
pAIScripting0x06_L108:
    %AICMD0x1C_ShowDialog($0403, $00)                          ;B3D993
    %AICMD0x12_Jump(pAIScripting0x06_L104)                                   ;B3D997
pAIScripting0x06_L109:
    %AICMD0x10_End()                                           ;B3D99A


DATA8_B3D99B:
    %AICMD0x11_EnableUserControl()                             ;B3D99B
    %AICMD0x09_StartScript($01, pAIScripting0x06_L111)                                   ;B3D99C
pAIScripting0x06_L110:
    %AICMD0x13_Wait(1)                                         ;B3D9A0
    %AICMD0x12_Jump(pAIScripting0x06_L110)                                   ;B3D9A3
pAIScripting0x06_L111:
    %AICMD0x1A($00E8, $009C, aAIScriptingData_L054, $03)                     ;B3D9A6
pAIScripting0x06_L112:
    %AICMD0x2D_JumpOnInteract(pAIScripting0x06_L115, pAIScripting0x06_L113)                               ;B3D9AE
    %AICMD0x12_Jump(pAIScripting0x06_L112)                                   ;B3D9B3
pAIScripting0x06_L113:
    %AICMD0x16_JumpIfBetween8($80091E, 9, 12, pAIScripting0x06_L114)         ;B3D9B6
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3D9BE
    %AICMD0x12_Jump(pAIScripting0x06_L112)                                   ;B3D9C2
pAIScripting0x06_L114:
    %AICMD0x1C_ShowDialog($03BB, $00)                          ;B3D9C5
    %AICMD0x12_Jump(pAIScripting0x06_L112)                                   ;B3D9C9
pAIScripting0x06_L115:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $05, pAIScripting0x06_L118)   ;B3D9CC
    %AICMD0x1D_ShowDialog($015B, $00)                          ;B3D9D3
    %AICMD0x20_JumpIfChoice(0, pAIScripting0x06_L116)                        ;B3D9D7
    %AICMD0x20_JumpIfChoice(1, pAIScripting0x06_L117)                        ;B3D9DB
    %AICMD0x12_Jump(pAIScripting0x06_L112)                                   ;B3D9DF
pAIScripting0x06_L116:
    %AICMD0x1C_ShowDialog($015C, $00)                          ;B3D9E2
    %AICMD0x12_Jump(pAIScripting0x06_L112)                                   ;B3D9E6
pAIScripting0x06_L117:
    %AICMD0x1C_ShowDialog($015D, $00)                          ;B3D9E9
    %AICMD0x12_Jump(pAIScripting0x06_L112)                                   ;B3D9ED
pAIScripting0x06_L118:
    %AICMD0x1C_ShowDialog($016C, $00)                          ;B3D9F0
    %AICMD0x12_Jump(pAIScripting0x06_L112)                                   ;B3D9F4
