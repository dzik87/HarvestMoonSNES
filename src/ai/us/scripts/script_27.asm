

pAIScripting0x27:
    dw pAIScripting0x27_Data01                                            ;B4B65E|        |B4B67E;
    dw pAIScripting0x27_Data02                                            ;B4B660|        |B4B947;
    dw pAIScripting0x27_Data03                                            ;B4B662|        |B4B9C2;
    dw pAIScripting0x27_Data04                                            ;B4B664|        |B4BA8E;
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
 
pAIScripting0x27_Data01:
 
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


pAIScripting0x27_Data02:
 
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


pAIScripting0x27_Data03:
 
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


pAIScripting0x27_Data04:
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
