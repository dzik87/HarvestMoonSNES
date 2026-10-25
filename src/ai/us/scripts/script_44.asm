

    incsrc "../../../../build/gen/ai/slots_44.asm"
 
pAIScripting0x44_Data01:
 
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
    %AICMD0x2D_JumpOnInteract(pAIScripting0x44_L012, pAIScripting0x44_L003)                               ;B59836
    %AICMD0x12_Jump(pAIScripting0x44_L002)                                   ;B5983B
pAIScripting0x44_L003:
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 2, pAIScripting0x44_L004)              ;B5983E
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 1, 5, pAIScripting0x44_L005)          ;B59845
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 7, pAIScripting0x44_L005)              ;B5984D
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 16, 23, pAIScripting0x44_L005)        ;B59854
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 25, pAIScripting0x44_L006)             ;B5985C
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 73, pAIScripting0x44_L006)             ;B59863
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 6, pAIScripting0x44_L008)              ;B5986A
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 9, 12, pAIScripting0x44_L007)         ;B59871
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
    %AICMD0x15_JumpIfEquals8(wram80(nWeatherForecast), 3, pAIScripting0x44_L014)              ;B59912
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
    %AICMD0x17_RollRandom($02)                                            ;B59999
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x44_L021)                                   ;B5999B
    %AICMD0x1C_ShowDialog($041F, $00)                          ;B5999F
    %AICMD0x12_Jump(pAIScripting0x44_L002)                                   ;B599A3
pAIScripting0x44_L021:
    %AICMD0x1C_ShowDialog($0188, $00)                          ;B599A6
    %AICMD0x12_Jump(pAIScripting0x44_L002)                                   ;B599AA
pAIScripting0x44_L022:
    %AICMD0x1C_ShowDialog($0206, $00)                          ;B599AD
    %AICMD0x12_Jump(pAIScripting0x44_L002)                                   ;B599B1
pAIScripting0x44_L023:
    %AICMD0x17_RollRandom($02)                                            ;B599B4
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x44_L024)                                   ;B599B6
    %AICMD0x1C_ShowDialog($0420, $00)                          ;B599BA
    %AICMD0x12_Jump(pAIScripting0x44_L002)                                   ;B599BE
pAIScripting0x44_L024:
    %AICMD0x1C_ShowDialog($0193, $00)                          ;B599C1
    %AICMD0x12_Jump(pAIScripting0x44_L002)                                   ;B599C5
pAIScripting0x44_L025:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 11, pAIScripting0x44_L027)         ;B599C8
    %AICMD0x17_RollRandom($02)                                            ;B599CF
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x44_L026)                                   ;B599D1
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


pAIScripting0x44_Data02:
 
    %AICMD0x14_JumpIfFlagSet($800196, $01, pAIScripting0x44_L055)            ;B599EB
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 6, 10, pAIScripting0x44_L055)  ;B599F2
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 15, 18, pAIScripting0x44_L055) ;B599FA
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, pAIScripting0x44_L055)     ;B59A02
    %AICMD0x09_StartScript($01, pAIScripting0x44_L056)                                   ;B59A09
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 60, 89, pAIScripting0x44_L029);B59A0D
    %AICMD0x45_JumpIfBetween16(nSecondChildAge, 60, 89, pAIScripting0x44_L029);B59A17
    %AICMD0x1A($0048, $0048, aAIScriptingData_L199, $00)                     ;B59A21
    %AICMD0x12_Jump(pAIScripting0x44_L030)                                   ;B59A29
pAIScripting0x44_L029:
    %AICMD0x1A($0048, $0048, aAIScriptingData_L074, $00)                     ;B59A2C
pAIScripting0x44_L030:
    %AICMD0x2D_JumpOnInteract(pAIScripting0x44_L039, pAIScripting0x44_L031)                               ;B59A34
    %AICMD0x12_Jump(pAIScripting0x44_L030)                                   ;B59A39
pAIScripting0x44_L031:
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 2, pAIScripting0x44_L032)              ;B59A3C
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 3, 7, pAIScripting0x44_L034)          ;B59A43
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 16, 23, pAIScripting0x44_L034)        ;B59A4B
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 6, pAIScripting0x44_L035)              ;B59A53
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 25, pAIScripting0x44_L033)             ;B59A5A
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 73, pAIScripting0x44_L033)             ;B59A61
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 9, 12, pAIScripting0x44_L032)         ;B59A68
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
    %AICMD0x15_JumpIfEquals8(wram80(nWeatherForecast), 3, pAIScripting0x44_L041)              ;B59AFC
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
    %AICMD0x17_RollRandom($02)                                            ;B59B83
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x44_L048)                                   ;B59B85
    %AICMD0x1C_ShowDialog($0185, $00)                          ;B59B89
    %AICMD0x12_Jump(pAIScripting0x44_L030)                                   ;B59B8D
pAIScripting0x44_L048:
    %AICMD0x1C_ShowDialog($018F, $00)                          ;B59B90
    %AICMD0x12_Jump(pAIScripting0x44_L030)                                   ;B59B94
pAIScripting0x44_L049:
    %AICMD0x1C_ShowDialog($0207, $00)                          ;B59B97
    %AICMD0x12_Jump(pAIScripting0x44_L030)                                   ;B59B9B
pAIScripting0x44_L050:
    %AICMD0x17_RollRandom($02)                                            ;B59B9E
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x44_L051)                                   ;B59BA0
    %AICMD0x1C_ShowDialog($0186, $00)                          ;B59BA4
    %AICMD0x12_Jump(pAIScripting0x44_L030)                                   ;B59BA8
pAIScripting0x44_L051:
    %AICMD0x1C_ShowDialog($0193, $00)                          ;B59BAB
    %AICMD0x12_Jump(pAIScripting0x44_L030)                                   ;B59BAF
pAIScripting0x44_L052:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 11, pAIScripting0x44_L054)         ;B59BB2
    %AICMD0x17_RollRandom($02)                                            ;B59BB9
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x44_L053)                                   ;B59BBB
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


pAIScripting0x44_Data03:
 
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
    %AICMD0x2D_JumpOnInteract(pAIScripting0x44_L069, pAIScripting0x44_L060)                               ;B59C28
    %AICMD0x12_Jump(pAIScripting0x44_L059)                                   ;B59C2D
pAIScripting0x44_L060:
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 1, 4, pAIScripting0x44_L063)          ;B59C30
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 16, 23, pAIScripting0x44_L063)        ;B59C38
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 9, 12, pAIScripting0x44_L064)         ;B59C40
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 6, pAIScripting0x44_L065)              ;B59C48
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 5, pAIScripting0x44_L065)              ;B59C4F
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 25, pAIScripting0x44_L061)             ;B59C56
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 73, pAIScripting0x44_L062)             ;B59C5D
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
    %AICMD0x15_JumpIfEquals8(wram80(nWeatherForecast), 3, pAIScripting0x44_L071)              ;B59CFD
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
    %AICMD0x17_RollRandom($02)                                            ;B59D81
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x44_L078)                                   ;B59D83
    %AICMD0x1C_ShowDialog($0189, $00)                          ;B59D87
    %AICMD0x12_Jump(pAIScripting0x44_L059)                                   ;B59D8B
pAIScripting0x44_L078:
    %AICMD0x1C_ShowDialog($018F, $00)                          ;B59D8E
    %AICMD0x12_Jump(pAIScripting0x44_L059)                                   ;B59D92
pAIScripting0x44_L079:
    %AICMD0x1C_ShowDialog($0208, $00)                          ;B59D95
    %AICMD0x12_Jump(pAIScripting0x44_L059)                                   ;B59D99
pAIScripting0x44_L080:
    %AICMD0x17_RollRandom($02)                                            ;B59D9C
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x44_L081)                                   ;B59D9E
    %AICMD0x1C_ShowDialog($018A, $00)                          ;B59DA2
    %AICMD0x12_Jump(pAIScripting0x44_L059)                                   ;B59DA6
pAIScripting0x44_L081:
    %AICMD0x1C_ShowDialog($018B, $00)                          ;B59DA9
    %AICMD0x12_Jump(pAIScripting0x44_L059)                                   ;B59DAD
pAIScripting0x44_L082:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 11, pAIScripting0x44_L084)         ;B59DB0
    %AICMD0x17_RollRandom($02)                                            ;B59DB7
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x44_L083)                                   ;B59DB9
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


pAIScripting0x44_Data04:
 
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
    %AICMD0x2D_JumpOnInteract(pAIScripting0x44_L098, pAIScripting0x44_L088)                               ;B59E10
    %AICMD0x12_Jump(pAIScripting0x44_L087)                                   ;B59E15
pAIScripting0x44_L088:
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 2, pAIScripting0x44_L089)              ;B59E18
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 1, 7, pAIScripting0x44_L090)          ;B59E1F
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 16, 19, pAIScripting0x44_L090)        ;B59E27
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 25, pAIScripting0x44_L091)             ;B59E2F
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 73, pAIScripting0x44_L091)             ;B59E36
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 6, pAIScripting0x44_L094)              ;B59E3D
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 20, 23, pAIScripting0x44_L092)        ;B59E44
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 9, 12, pAIScripting0x44_L093)         ;B59E4C
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
    %AICMD0x15_JumpIfEquals8(wram80(nWeatherForecast), 3, pAIScripting0x44_L100)              ;B59EF4
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
    %AICMD0x17_RollRandom($02)                                            ;B59F78
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x44_L107)                                   ;B59F7A
    %AICMD0x1C_ShowDialog($0427, $00)                          ;B59F7E
    %AICMD0x12_Jump(pAIScripting0x44_L087)                                   ;B59F82
pAIScripting0x44_L107:
    %AICMD0x1C_ShowDialog($041F, $00)                          ;B59F85
    %AICMD0x12_Jump(pAIScripting0x44_L087)                                   ;B59F89
pAIScripting0x44_L108:
    %AICMD0x1C_ShowDialog($0209, $00)                          ;B59F8C
    %AICMD0x12_Jump(pAIScripting0x44_L087)                                   ;B59F90
pAIScripting0x44_L109:
    %AICMD0x17_RollRandom($02)                                            ;B59F93
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x44_L110)                                   ;B59F95
    %AICMD0x1C_ShowDialog($0429, $00)                          ;B59F99
    %AICMD0x12_Jump(pAIScripting0x44_L087)                                   ;B59F9D
pAIScripting0x44_L110:
    %AICMD0x1C_ShowDialog($018E, $00)                          ;B59FA0
    %AICMD0x12_Jump(pAIScripting0x44_L087)                                   ;B59FA4
pAIScripting0x44_L111:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 11, pAIScripting0x44_L113)         ;B59FA7
    %AICMD0x17_RollRandom($02)                                            ;B59FAE
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x44_L112)                                   ;B59FB0
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


pAIScripting0x44_Data05:
    %AICMD0x14_JumpIfFlagSet($800196, $01, pAIScripting0x44_L142)            ;B59FCA
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, pAIScripting0x44_L142)     ;B59FD1
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 6, 10, pAIScripting0x44_L142)  ;B59FD8
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 16, 18, pAIScripting0x44_L142) ;B59FE0
    %AICMD0x09_StartScript($01, pAIScripting0x44_L143)                                   ;B59FE8
    %AICMD0x09_StartScript($02, pAIScripting0x44_L145)                                   ;B59FEC
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 60, 89, pAIScripting0x44_L115);B59FF0
    %AICMD0x45_JumpIfBetween16(nSecondChildAge, 60, 89, pAIScripting0x44_L115);B59FFA
    %AICMD0x1A($0048, $0048, aAIScriptingData_L199, $03)                     ;B5A004
    %AICMD0x12_Jump(pAIScripting0x44_L116)                                   ;B5A00C
pAIScripting0x44_L115:
    %AICMD0x1A($0048, $0048, aAIScriptingData_L074, $00)                     ;B5A00F
pAIScripting0x44_L116:
    %AICMD0x2D_JumpOnInteract(pAIScripting0x44_L126, pAIScripting0x44_L117)                               ;B5A017
    %AICMD0x12_Jump(pAIScripting0x44_L116)                                   ;B5A01C
pAIScripting0x44_L117:
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 2, pAIScripting0x44_L118)              ;B5A01F
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 7, pAIScripting0x44_L118)              ;B5A026
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 1, 5, pAIScripting0x44_L119)          ;B5A02D
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 16, 23, pAIScripting0x44_L119)        ;B5A035
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 6, pAIScripting0x44_L120)              ;B5A03D
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 25, pAIScripting0x44_L121)             ;B5A044
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 73, pAIScripting0x44_L121)             ;B5A04B
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 9, 12, pAIScripting0x44_L122)         ;B5A052
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
    %AICMD0x15_JumpIfEquals8(wram80(nWeatherForecast), 3, pAIScripting0x44_L128)              ;B5A0F3
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
    %AICMD0x17_RollRandom($02)                                            ;B5A177
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x44_L135)                                   ;B5A179
    %AICMD0x1C_ShowDialog($042A, $00)                          ;B5A17D
    %AICMD0x12_Jump(pAIScripting0x44_L116)                                   ;B5A181
pAIScripting0x44_L135:
    %AICMD0x1C_ShowDialog($0188, $00)                          ;B5A184
    %AICMD0x12_Jump(pAIScripting0x44_L116)                                   ;B5A188
pAIScripting0x44_L136:
    %AICMD0x1C_ShowDialog($020A, $00)                          ;B5A18B
    %AICMD0x12_Jump(pAIScripting0x44_L116)                                   ;B5A18F
pAIScripting0x44_L137:
    %AICMD0x17_RollRandom($02)                                            ;B5A192
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x44_L138)                                   ;B5A194
    %AICMD0x1C_ShowDialog($042B, $00)                          ;B5A198
    %AICMD0x12_Jump(pAIScripting0x44_L116)                                   ;B5A19C
pAIScripting0x44_L138:
    %AICMD0x1C_ShowDialog($0193, $00)                          ;B5A19F
    %AICMD0x12_Jump(pAIScripting0x44_L116)                                   ;B5A1A3
pAIScripting0x44_L139:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 11, pAIScripting0x44_L141)         ;B5A1A6
    %AICMD0x17_RollRandom($02)                                            ;B5A1AD
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x44_L140)                                   ;B5A1AF
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
