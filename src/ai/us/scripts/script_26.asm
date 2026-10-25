

pAIScripting0x26:
    dw pAIScripting0x26_Data01                                            ;B4A60D|        |B4A62D;
    dw pAIScripting0x26_Data02                                            ;B4A60F|        |B4B48E;
    dw pAIScripting0x27                                        ;B4A611|        |B4B65E;
    dw pAIScripting0x27                                        ;B4A613|        |B4B65E;
    dw pAIScripting0x27                                        ;B4A615|        |B4B65E;
    dw pAIScripting0x27                                        ;B4A617|        |B4B65E;
    dw pAIScripting0x27                                        ;B4A619|        |B4B65E;
    dw pAIScripting0x27                                        ;B4A61B|        |B4B65E;
    dw pAIScripting0x27                                        ;B4A61D|        |B4B65E;
    dw pAIScripting0x27                                        ;B4A61F|        |B4B65E;
    dw pAIScripting0x27                                        ;B4A621|        |B4B65E;
    dw pAIScripting0x27                                        ;B4A623|        |B4B65E;
    dw pAIScripting0x27                                        ;B4A625|        |B4B65E;
    dw pAIScripting0x27                                        ;B4A627|        |B4B65E;
    dw pAIScripting0x27                                        ;B4A629|        |B4B65E;
    dw pAIScripting0x27                                        ;B4A62B|        |B4B65E;
 
pAIScripting0x26_Data01:
 
    %AICMD0x4F_DisableToolUse()                                               ;B4A62D
    %AICMD0x51()                                               ;B4A62E
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $09)       ;B4A62F
    %AICMD0x00_SetMusic($03, $B4)                              ;B4A634
    %AICMD0x02_FreezeTime()                                    ;B4A637
    %AICMD0x03_SetHour($07)                                    ;B4A638
    %AICMD0x08_EnableAIControl()                               ;B4A63A
    %AICMD0x05_SetTransferPosition(264, 312)                   ;B4A63B
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B4A640
    %AICMD0x32_SetValue16(strcFlags.unknown1, $FFDF)                      ;B4A642
    %AICMD0x09_StartScript($01, pAIScripting0x26_L035)                                   ;B4A648
    %AICMD0x09_StartScript($03, pAIScripting0x26_L047)                                   ;B4A64C
    %AICMD0x09_StartScript($06, pAIScripting0x26_L059)                                   ;B4A650
    %AICMD0x09_StartScript($07, pAIScripting0x26_L064)                                   ;B4A654
    %AICMD0x09_StartScript($0B, pAIScripting0x26_L080)                                   ;B4A658
    %AICMD0x09_StartScript($0D, pAIScripting0x26_L086)                                   ;B4A65C
    %AICMD0x09_StartScript($0E, pAIScripting0x26_L098)                                   ;B4A660
    %AICMD0x09_StartScript($0F, pAIScripting0x26_L114)                                   ;B4A664
    %AICMD0x09_StartScript($10, pAIScripting0x26_L129)                                   ;B4A668
    %AICMD0x09_StartScript($11, pAIScripting0x26_L145)                                   ;B4A66C
    %AICMD0x09_StartScript($12, pAIScripting0x26_L014)                                   ;B4A670
    %AICMD0x09_StartScript($13, pAIScripting0x26_L040)                                   ;B4A674
    %AICMD0x06_SetDestinationArea(!AREA_DANCINGS2)             ;B4A678
    %AICMD0x38_WaitForFadeIn()                                               ;B4A67A
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 64)                    ;B4A67B
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemId), 0, pAIScripting0x26_L001)              ;B4A67F
    %AICMD0x1C_ShowDialog($0241, $00)                          ;B4A686
    %AICMD0x40_DisableTileInteractions()                       ;B4A68A
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 16)                    ;B4A68B
    %AICMD0x3F_ThrowCarriedItem()                              ;B4A68F
    %AICMD0x13_Wait(60)                                        ;B4A690
    %AICMD0x1C_ShowDialog($0243, $00)                          ;B4A693
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 16)                  ;B4A697
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B4A69B
    %AICMD0x4E_EnableTileInteractions()                                               ;B4A69D
    %AICMD0x12_Jump(pAIScripting0x26_L002)                                   ;B4A69E
pAIScripting0x26_L001:
    %AICMD0x1C_ShowDialog($0242, $00)                          ;B4A6A1
    %AICMD0x1C_ShowDialog($0243, $00)                          ;B4A6A5
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown2, $00)     ;B4A6A9
pAIScripting0x26_L002:
    %AICMD0x13_Wait(120)                                       ;B4A6AE
    %AICMD0x0B_SetScriptFlag($00)                                            ;B4A6B1
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B4A6B3
    %AICMD0x09_StartScript($14, pAIScripting0x26_L018)                                   ;B4A6B5
    %AICMD0x19($0012, $00)                                     ;B4A6B9
    %AICMD0x13_Wait(20)                                        ;B4A6BD
    %AICMD0x13_Wait(120)                                       ;B4A6C0
    %AICMD0x11_EnableUserControl()                             ;B4A6C3
    %AICMD0x0C_WaitForScriptFlag($02)                                            ;B4A6C4
    %AICMD0x3D_TeleportToArea(!AREA_DANCINGS2)                 ;B4A6C6
    %AICMD0x10_End()                                           ;B4A6C8
pAIScripting0x26_L003:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $00, pAIScripting0x26_L008)   ;B4A6C9
    %AICMD0x09_StartScript($07, pAIScripting0x26_L173)                                   ;B4A6D0
    %AICMD0x41_AddValue16(nLove_Maria, 30)                     ;B4A6D4
    %AICMD0x12_Jump(pAIScripting0x26_L185)                                   ;B4A6DA
pAIScripting0x26_L004:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $01, pAIScripting0x26_L009)   ;B4A6DD
    %AICMD0x09_StartScript($07, pAIScripting0x26_L175)                                   ;B4A6E4
    %AICMD0x41_AddValue16(nLove_Ann, 30)                       ;B4A6E8
    %AICMD0x12_Jump(pAIScripting0x26_L185)                                   ;B4A6EE
pAIScripting0x26_L005:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, pAIScripting0x26_L010)   ;B4A6F1
    %AICMD0x09_StartScript($07, pAIScripting0x26_L177)                                   ;B4A6F8
    %AICMD0x41_AddValue16(nLove_Nina, 30)                      ;B4A6FC
    %AICMD0x12_Jump(pAIScripting0x26_L185)                                   ;B4A702
pAIScripting0x26_L006:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $03, pAIScripting0x26_L011)   ;B4A705
    %AICMD0x09_StartScript($07, pAIScripting0x26_L179)                                   ;B4A70C
    %AICMD0x41_AddValue16(nLove_Ellen, 30)                     ;B4A710
    %AICMD0x12_Jump(pAIScripting0x26_L185)                                   ;B4A716
pAIScripting0x26_L007:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $04, pAIScripting0x26_L012)   ;B4A719
    %AICMD0x09_StartScript($07, pAIScripting0x26_L181)                                   ;B4A720
    %AICMD0x41_AddValue16(nLove_Eve, 30)                       ;B4A724
    %AICMD0x12_Jump(pAIScripting0x26_L185)                                   ;B4A72A
pAIScripting0x26_L008:
    %AICMD0x41_AddValue16(nLove_Maria, 30)                     ;B4A72D
    %AICMD0x12_Jump(pAIScripting0x26_L013)                                   ;B4A733
pAIScripting0x26_L009:
    %AICMD0x41_AddValue16(nLove_Ann, 30)                       ;B4A736
    %AICMD0x12_Jump(pAIScripting0x26_L013)                                   ;B4A73C
pAIScripting0x26_L010:
    %AICMD0x41_AddValue16(nLove_Nina, 30)                      ;B4A73F
    %AICMD0x12_Jump(pAIScripting0x26_L013)                                   ;B4A745
pAIScripting0x26_L011:
    %AICMD0x41_AddValue16(nLove_Ellen, 30)                     ;B4A748
    %AICMD0x12_Jump(pAIScripting0x26_L013)                                   ;B4A74E
pAIScripting0x26_L012:
    %AICMD0x41_AddValue16(nLove_Eve, 30)                       ;B4A751
pAIScripting0x26_L013:
    %AICMD0x09_StartScript($07, pAIScripting0x26_L183)                                   ;B4A757
    %AICMD0x12_Jump(pAIScripting0x26_L185)                                   ;B4A75B
pAIScripting0x26_L014:
    %AICMD0x1A($0108, $00B8, aAIScriptingData_L193, $00)                     ;B4A75E
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B4A766
    %AICMD0x1B($02A2, $01)                                     ;B4A768
    %AICMD0x0D($01, $00, $30, $01)                             ;B4A76C
    %AICMD0x1B($029E, $01)                                     ;B4A771
    %AICMD0x0D($00, $01, $40, $01)                             ;B4A775
    %AICMD0x1B($02A2, $00)                                     ;B4A77A
    %AICMD0x0D($FF, $00, $10, $01)                             ;B4A77E
    %AICMD0x1B($02A1, $00)                                     ;B4A783
    %AICMD0x2A($0045)                                          ;B4A787
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4A78A
    %AICMD0x1C_ShowDialog($0244, $00)                          ;B4A78C
    %AICMD0x0B_SetScriptFlag($01)                                            ;B4A790
    %AICMD0x2F(aAIScriptingData_L048)                                        ;B4A792
pAIScripting0x26_L015:
    %AICMD0x1F(pAIScripting0x26_L016)                                        ;B4A795
    %AICMD0x12_Jump(pAIScripting0x26_L015)                                   ;B4A798
pAIScripting0x26_L016:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $05, pAIScripting0x26_L017) ;B4A79B
    %AICMD0x1C_ShowDialog($0286, $00)                          ;B4A7A2
    %AICMD0x12_Jump(pAIScripting0x26_L015)                                   ;B4A7A6
pAIScripting0x26_L017:
    %AICMD0x1C_ShowDialog($028C, $00)                          ;B4A7A9
    %AICMD0x12_Jump(pAIScripting0x26_L015)                                   ;B4A7AD
pAIScripting0x26_L018:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown2, $00, pAIScripting0x26_L021) ;B4A7B0
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 21, pAIScripting0x26_L020)             ;B4A7B7
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 22, pAIScripting0x26_L020)             ;B4A7BE
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 23, pAIScripting0x26_L020)             ;B4A7C5
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 1, pAIScripting0x26_L020)              ;B4A7CC
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 2, pAIScripting0x26_L019)              ;B4A7D3
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 20, pAIScripting0x26_L020)             ;B4A7DA
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 7, pAIScripting0x26_L022)              ;B4A7E1
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 5, pAIScripting0x26_L022)              ;B4A7E8
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 24, pAIScripting0x26_L020)             ;B4A7EF
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 9, 12, pAIScripting0x26_L019)         ;B4A7F6
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 26, pAIScripting0x26_L019)             ;B4A7FE
    %AICMD0x12_Jump(pAIScripting0x26_L019)                                   ;B4A805
pAIScripting0x26_L019:
    %AICMD0x17_RollRandom($02)                                            ;B4A808
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x26_L027)                                   ;B4A80A
    %AICMD0x18_JumpIfRandomEquals($01, pAIScripting0x26_L028)                                   ;B4A80E
    %AICMD0x10_End()                                           ;B4A812
pAIScripting0x26_L020:
    %AICMD0x17_RollRandom($04)                                            ;B4A813
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x26_L023)                                   ;B4A815
    %AICMD0x18_JumpIfRandomEquals($01, pAIScripting0x26_L024)                                   ;B4A819
    %AICMD0x18_JumpIfRandomEquals($02, pAIScripting0x26_L025)                                   ;B4A81D
    %AICMD0x18_JumpIfRandomEquals($03, pAIScripting0x26_L026)                                   ;B4A821
    %AICMD0x10_End()                                           ;B4A825
pAIScripting0x26_L021:
    %AICMD0x1A($0118, $00F8, aAIScriptingData_L194, $00)                     ;B4A826
    %AICMD0x13_Wait(16)                                        ;B4A82E
    %AICMD0x0D($F8, $F8, $01, $01)                             ;B4A831
    %AICMD0x13_Wait(4)                                         ;B4A836
    %AICMD0x19($0034, $00)                                     ;B4A839
    %AICMD0x12_Jump(pAIScripting0x26_L030)                                   ;B4A83D
pAIScripting0x26_L022:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $0F, pAIScripting0x26_L029)   ;B4A840
    %AICMD0x1A($0118, $00F8, aAIScriptingData_L123, $00)                     ;B4A847
    %AICMD0x13_Wait(16)                                        ;B4A84F
    %AICMD0x0D($F8, $F8, $01, $01)                             ;B4A852
    %AICMD0x13_Wait(4)                                         ;B4A857
    %AICMD0x19($003B, $00)                                     ;B4A85A
    %AICMD0x21_AddValue8(nPowerBerryEaten, 1)                  ;B4A85E
    %AICMD0x21_AddValue8(wram80(strcPlayerData.stamina), 10)                          ;B4A863
    %AICMD0x41_AddValue16(nPlayerHappiness, 10)                ;B4A868
    %AICMD0x23_OrWithIndexedValue(strcFlags.event5, $0F)       ;B4A86E
    %AICMD0x12_Jump(pAIScripting0x26_L030)                                   ;B4A873
pAIScripting0x26_L023:
    %AICMD0x1A($0118, $00F8, aAIScriptingData_L195, $00)                     ;B4A876
    %AICMD0x13_Wait(16)                                        ;B4A87E
    %AICMD0x0D($F8, $F8, $01, $01)                             ;B4A881
    %AICMD0x13_Wait(4)                                         ;B4A886
    %AICMD0x19($00F7, $00)                                     ;B4A889
    %AICMD0x12_Jump(pAIScripting0x26_L030)                                   ;B4A88D
pAIScripting0x26_L024:
    %AICMD0x1A($0118, $00F8, aAIScriptingData_L196, $00)                     ;B4A890
    %AICMD0x13_Wait(16)                                        ;B4A898
    %AICMD0x0D($F8, $F8, $01, $01)                             ;B4A89B
    %AICMD0x13_Wait(4)                                         ;B4A8A0
    %AICMD0x19($00F6, $00)                                     ;B4A8A3
    %AICMD0x12_Jump(pAIScripting0x26_L030)                                   ;B4A8A7
pAIScripting0x26_L025:
    %AICMD0x1A($0118, $00F8, aAIScriptingData_L197, $00)                     ;B4A8AA
    %AICMD0x13_Wait(16)                                        ;B4A8B2
    %AICMD0x0D($F8, $F8, $01, $01)                             ;B4A8B5
    %AICMD0x13_Wait(4)                                         ;B4A8BA
    %AICMD0x19($00F9, $00)                                     ;B4A8BD
    %AICMD0x12_Jump(pAIScripting0x26_L030)                                   ;B4A8C1
pAIScripting0x26_L026:
    %AICMD0x1A($0118, $00F8, aAIScriptingData_L191, $00)                     ;B4A8C4
    %AICMD0x13_Wait(16)                                        ;B4A8CC
    %AICMD0x0D($F8, $F8, $01, $01)                             ;B4A8CF
    %AICMD0x13_Wait(4)                                         ;B4A8D4
    %AICMD0x19($00F8, $00)                                     ;B4A8D7
    %AICMD0x12_Jump(pAIScripting0x26_L030)                                   ;B4A8DB
pAIScripting0x26_L027:
    %AICMD0x1A($0118, $00F8, aAIScriptingData_L085, $00)                     ;B4A8DE
    %AICMD0x13_Wait(16)                                        ;B4A8E6
    %AICMD0x0D($F8, $F8, $01, $01)                             ;B4A8E9
    %AICMD0x13_Wait(4)                                         ;B4A8EE
    %AICMD0x19($00FD, $00)                                     ;B4A8F1
    %AICMD0x12_Jump(pAIScripting0x26_L030)                                   ;B4A8F5
pAIScripting0x26_L028:
    %AICMD0x1A($0118, $00F8, aAIScriptingData_L084, $00)                     ;B4A8F8
    %AICMD0x13_Wait(16)                                        ;B4A900
    %AICMD0x0D($F8, $F8, $01, $01)                             ;B4A903
    %AICMD0x13_Wait(4)                                         ;B4A908
    %AICMD0x19($00FC, $00)                                     ;B4A90B
    %AICMD0x12_Jump(pAIScripting0x26_L030)                                   ;B4A90F
pAIScripting0x26_L029:
    %AICMD0x1A($0118, $00F8, aAIScriptingData_L127, $00)                     ;B4A912
    %AICMD0x13_Wait(16)                                        ;B4A91A
    %AICMD0x0D($F8, $F8, $01, $01)                             ;B4A91D
    %AICMD0x13_Wait(4)                                         ;B4A922
    %AICMD0x19($003A, $00)                                     ;B4A925
    %AICMD0x12_Jump(pAIScripting0x26_L030)                                   ;B4A929
pAIScripting0x26_L030:
    %AICMD0x37()                                               ;B4A92C
    %AICMD0x10_End()                                           ;B4A92D
pAIScripting0x26_L031:
    %AICMD0x1A($0148, $00A0, aAIScriptingData_L084, $00)                     ;B4A92E
    %AICMD0x13_Wait(1)                                         ;B4A936
    %AICMD0x37()                                               ;B4A939
    %AICMD0x10_End()                                           ;B4A93A
pAIScripting0x26_L032:
    %AICMD0x1A($0148, $00A8, aAIScriptingData_L086, $00)                     ;B4A93B
    %AICMD0x13_Wait(1)                                         ;B4A943
    %AICMD0x37()                                               ;B4A946
    %AICMD0x10_End()                                           ;B4A947
pAIScripting0x26_L033:
    %AICMD0x1A($0148, $00A8, aAIScriptingData_L188, $00)                     ;B4A948
    %AICMD0x13_Wait(1)                                         ;B4A950
    %AICMD0x37()                                               ;B4A953
    %AICMD0x10_End()                                           ;B4A954
pAIScripting0x26_L034:
    %AICMD0x1A($0108, $0098, aAIScriptingData_L185, $00)                     ;B4A955
    %AICMD0x13_Wait(1)                                         ;B4A95D
    %AICMD0x37()                                               ;B4A960
    %AICMD0x10_End()                                           ;B4A961
pAIScripting0x26_L035:
    %AICMD0x1A($0198, $00C8, aAIScriptingData_L064, $00)                     ;B4A962
pAIScripting0x26_L036:
    %AICMD0x1F(pAIScripting0x26_L037)                                        ;B4A96A
    %AICMD0x12_Jump(pAIScripting0x26_L036)                                   ;B4A96D
pAIScripting0x26_L037:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, pAIScripting0x26_L038)   ;B4A970
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $05, pAIScripting0x26_L039) ;B4A977
    %AICMD0x1C_ShowDialog($0247, $00)                          ;B4A97E
    %AICMD0x12_Jump(pAIScripting0x26_L036)                                   ;B4A982
pAIScripting0x26_L038:
    %AICMD0x1C_ShowDialog($0492, $00)                          ;B4A985
    %AICMD0x12_Jump(pAIScripting0x26_L036)                                   ;B4A989
pAIScripting0x26_L039:
    %AICMD0x1C_ShowDialog($0284, $00)                          ;B4A98C
    %AICMD0x12_Jump(pAIScripting0x26_L036)                                   ;B4A990
pAIScripting0x26_L040:
    %AICMD0x1A($00B8, $0108, aAIScriptingData_L050, $00)                     ;B4A993
pAIScripting0x26_L041:
    %AICMD0x1F(pAIScripting0x26_L042)                                        ;B4A99B
    %AICMD0x12_Jump(pAIScripting0x26_L041)                                   ;B4A99E
pAIScripting0x26_L042:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $05, pAIScripting0x26_L043) ;B4A9A1
    %AICMD0x1C_ShowDialog($0248, $00)                          ;B4A9A8
    %AICMD0x12_Jump(pAIScripting0x26_L041)                                   ;B4A9AC
pAIScripting0x26_L043:
    %AICMD0x1C_ShowDialog($0285, $00)                          ;B4A9AF
    %AICMD0x12_Jump(pAIScripting0x26_L041)                                   ;B4A9B3
    %AICMD0x1A($00B8, $0108, aAIScriptingData_L053, $03)                     ;B4A9B6
pAIScripting0x26_L044:
    %AICMD0x1F(pAIScripting0x26_L045)                                        ;B4A9BE
    %AICMD0x12_Jump(pAIScripting0x26_L044)                                   ;B4A9C1
pAIScripting0x26_L045:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $05, pAIScripting0x26_L046) ;B4A9C4
    %AICMD0x1C_ShowDialog($0248, $00)                          ;B4A9CB
    %AICMD0x12_Jump(pAIScripting0x26_L044)                                   ;B4A9CF
pAIScripting0x26_L046:
    %AICMD0x1C_ShowDialog($0288, $00)                          ;B4A9D2
    %AICMD0x12_Jump(pAIScripting0x26_L044)                                   ;B4A9D6
pAIScripting0x26_L047:
    %AICMD0x1A($0078, $00F8, aAIScriptingData_L061, $02)                     ;B4A9D9
pAIScripting0x26_L048:
    %AICMD0x1F(pAIScripting0x26_L050)                                        ;B4A9E1
    %AICMD0x12_Jump(pAIScripting0x26_L048)                                   ;B4A9E4
pAIScripting0x26_L049:
    %AICMD0x1F(pAIScripting0x26_L051)                                        ;B4A9E7
    %AICMD0x12_Jump(pAIScripting0x26_L049)                                   ;B4A9EA
pAIScripting0x26_L050:
    %AICMD0x1C_ShowDialog($0245, $00)                          ;B4A9ED
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $00, pAIScripting0x26_L048) ;B4A9F1
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $01, pAIScripting0x26_L048) ;B4A9F8
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $02, pAIScripting0x26_L048) ;B4A9FF
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $03, pAIScripting0x26_L048) ;B4AA06
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $04, pAIScripting0x26_L048) ;B4AA0D
    %AICMD0x08_EnableAIControl()                               ;B4AA14
    %AICMD0x1B($02C7, $00)                                     ;B4AA15
    %AICMD0x0D($00, $FF, $30, $01)                             ;B4AA19
    %AICMD0x1B($02C4, $00)                                     ;B4AA1E
    %AICMD0x11_EnableUserControl()                             ;B4AA22
    %AICMD0x12_Jump(pAIScripting0x26_L049)                                   ;B4AA23
pAIScripting0x26_L051:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $05, pAIScripting0x26_L052) ;B4AA26
    %AICMD0x1C_ShowDialog($0245, $00)                          ;B4AA2D
    %AICMD0x12_Jump(pAIScripting0x26_L049)                                   ;B4AA31
pAIScripting0x26_L052:
    %AICMD0x1C_ShowDialog($0282, $00)                          ;B4AA34
    %AICMD0x12_Jump(pAIScripting0x26_L049)                                   ;B4AA38
    %AICMD0x1A($0158, $00C8, aAIScriptingData_L046, $00)                     ;B4AA3B
pAIScripting0x26_L053:
    %AICMD0x1F(pAIScripting0x26_L054)                                        ;B4AA43
    %AICMD0x12_Jump(pAIScripting0x26_L053)                                   ;B4AA46
pAIScripting0x26_L054:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $05, pAIScripting0x26_L055) ;B4AA49
    %AICMD0x1C_ShowDialog($0246, $00)                          ;B4AA50
    %AICMD0x12_Jump(pAIScripting0x26_L053)                                   ;B4AA54
pAIScripting0x26_L055:
    %AICMD0x1C_ShowDialog($0283, $00)                          ;B4AA57
    %AICMD0x12_Jump(pAIScripting0x26_L053)                                   ;B4AA5B
    %AICMD0x1A($0098, $00A8, aAIScriptingData_L051, $00)                     ;B4AA5E
pAIScripting0x26_L056:
    %AICMD0x1F(pAIScripting0x26_L057)                                        ;B4AA66
    %AICMD0x12_Jump(pAIScripting0x26_L056)                                   ;B4AA69
pAIScripting0x26_L057:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $05, pAIScripting0x26_L058) ;B4AA6C
    %AICMD0x1C_ShowDialog($024C, $00)                          ;B4AA73
    %AICMD0x12_Jump(pAIScripting0x26_L056)                                   ;B4AA77
pAIScripting0x26_L058:
    %AICMD0x1C_ShowDialog($028A, $00)                          ;B4AA7A
    %AICMD0x12_Jump(pAIScripting0x26_L056)                                   ;B4AA7E
pAIScripting0x26_L059:
    %AICMD0x1A($0168, $0108, aAIScriptingData_L067, $01)                     ;B4AA81
pAIScripting0x26_L060:
    %AICMD0x1F(pAIScripting0x26_L061)                                        ;B4AA89
    %AICMD0x12_Jump(pAIScripting0x26_L060)                                   ;B4AA8C
pAIScripting0x26_L061:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $05, pAIScripting0x26_L062) ;B4AA8F
    %AICMD0x1C_ShowDialog($0249, $00)                          ;B4AA96
    %AICMD0x12_Jump(pAIScripting0x26_L060)                                   ;B4AA9A
pAIScripting0x26_L062:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $00, pAIScripting0x26_L063)   ;B4AA9D
    %AICMD0x1C_ShowDialog($0288, $00)                          ;B4AAA4
    %AICMD0x12_Jump(pAIScripting0x26_L060)                                   ;B4AAA8
pAIScripting0x26_L063:
    %AICMD0x1C_ShowDialog($0250, $00)                          ;B4AAAB
    %AICMD0x12_Jump(pAIScripting0x26_L060)                                   ;B4AAAF
pAIScripting0x26_L064:
    %AICMD0x1A($0148, $0158, aAIScriptingData_L055, $01)                     ;B4AAB2
pAIScripting0x26_L065:
    %AICMD0x1F(pAIScripting0x26_L066)                                        ;B4AABA
    %AICMD0x12_Jump(pAIScripting0x26_L065)                                   ;B4AABD
pAIScripting0x26_L066:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $05, pAIScripting0x26_L067) ;B4AAC0
    %AICMD0x1C_ShowDialog($024F, $00)                          ;B4AAC7
    %AICMD0x12_Jump(pAIScripting0x26_L065)                                   ;B4AACB
pAIScripting0x26_L067:
    %AICMD0x1C_ShowDialog($0287, $00)                          ;B4AACE
    %AICMD0x12_Jump(pAIScripting0x26_L065)                                   ;B4AAD2
    %AICMD0x1A($00A8, $0148, aAIScriptingData_L042, $03)                     ;B4AAD5
pAIScripting0x26_L068:
    %AICMD0x1F(pAIScripting0x26_L069)                                        ;B4AADD
    %AICMD0x12_Jump(pAIScripting0x26_L068)                                   ;B4AAE0
pAIScripting0x26_L069:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $05, pAIScripting0x26_L070) ;B4AAE3
    %AICMD0x1C_ShowDialog($024E, $00)                          ;B4AAEA
    %AICMD0x12_Jump(pAIScripting0x26_L068)                                   ;B4AAEE
pAIScripting0x26_L070:
    %AICMD0x1C_ShowDialog($028C, $00)                          ;B4AAF1
    %AICMD0x12_Jump(pAIScripting0x26_L068)                                   ;B4AAF5
    %AICMD0x1A($0128, $0148, aAIScriptingData_L035, $01)                     ;B4AAF8
pAIScripting0x26_L071:
    %AICMD0x1F(pAIScripting0x26_L072)                                        ;B4AB00
    %AICMD0x12_Jump(pAIScripting0x26_L071)                                   ;B4AB03
pAIScripting0x26_L072:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $05, pAIScripting0x26_L073) ;B4AB06
    %AICMD0x1C_ShowDialog($024A, $00)                          ;B4AB0D
    %AICMD0x12_Jump(pAIScripting0x26_L071)                                   ;B4AB11
pAIScripting0x26_L073:
    %AICMD0x1C_ShowDialog($0288, $00)                          ;B4AB14
    %AICMD0x12_Jump(pAIScripting0x26_L071)                                   ;B4AB18
    %AICMD0x1A($0108, $0158, aAIScriptingData_L037, $01)                     ;B4AB1B
pAIScripting0x26_L074:
    %AICMD0x1F(pAIScripting0x26_L075)                                        ;B4AB23
    %AICMD0x12_Jump(pAIScripting0x26_L074)                                   ;B4AB26
pAIScripting0x26_L075:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $05, pAIScripting0x26_L076) ;B4AB29
    %AICMD0x1C_ShowDialog($024B, $00)                          ;B4AB30
    %AICMD0x12_Jump(pAIScripting0x26_L074)                                   ;B4AB34
pAIScripting0x26_L076:
    %AICMD0x1C_ShowDialog($0289, $00)                          ;B4AB37
    %AICMD0x12_Jump(pAIScripting0x26_L074)                                   ;B4AB3B
    %AICMD0x1A($0088, $0158, aAIScriptingData_L033, $02)                     ;B4AB3E
pAIScripting0x26_L077:
    %AICMD0x1F(pAIScripting0x26_L078)                                        ;B4AB46
    %AICMD0x12_Jump(pAIScripting0x26_L077)                                   ;B4AB49
pAIScripting0x26_L078:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $05, pAIScripting0x26_L079) ;B4AB4C
    %AICMD0x1C_ShowDialog($024D, $00)                          ;B4AB53
    %AICMD0x12_Jump(pAIScripting0x26_L077)                                   ;B4AB57
pAIScripting0x26_L079:
    %AICMD0x1C_ShowDialog($028B, $00)                          ;B4AB5A
    %AICMD0x12_Jump(pAIScripting0x26_L077)                                   ;B4AB5E
pAIScripting0x26_L080:
    %AICMD0x1A($0058, $00E8, aAIScriptingData_L044, $02)                     ;B4AB61
pAIScripting0x26_L081:
    %AICMD0x1F(pAIScripting0x26_L083)                                        ;B4AB69
    %AICMD0x12_Jump(pAIScripting0x26_L081)                                   ;B4AB6C
pAIScripting0x26_L082:
    %AICMD0x1F(pAIScripting0x26_L084)                                        ;B4AB6F
    %AICMD0x12_Jump(pAIScripting0x26_L082)                                   ;B4AB72
pAIScripting0x26_L083:
    %AICMD0x1D_ShowDialog($0234, $00)                          ;B4AB75
    %AICMD0x20_JumpIfChoice(0, pAIScripting0x26_L084)                        ;B4AB79
    %AICMD0x20_JumpIfChoice(1, pAIScripting0x26_L085)                        ;B4AB7D
    %AICMD0x12_Jump(pAIScripting0x26_L081)                                   ;B4AB81
pAIScripting0x26_L084:
    %AICMD0x1C_ShowDialog($0235, $00)                          ;B4AB84
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown1, $05)     ;B4AB88
    %AICMD0x12_Jump(pAIScripting0x26_L082)                                   ;B4AB8D
pAIScripting0x26_L085:
    %AICMD0x1C_ShowDialog($0236, $00)                          ;B4AB90
    %AICMD0x12_Jump(pAIScripting0x26_L081)                                   ;B4AB94
pAIScripting0x26_L086:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $00, pAIScripting0x26_L087)   ;B4AB97
    %AICMD0x1A($00C8, $0158, aAIScriptingData_L011, $02)                     ;B4AB9E
    %AICMD0x12_Jump(pAIScripting0x26_L088)                                   ;B4ABA6
pAIScripting0x26_L087:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event6, $04, pAIScripting0x26_L097)   ;B4ABA9
    %AICMD0x1A($00C8, $0158, aAIScriptingData_L071, $02)                     ;B4ABB0
pAIScripting0x26_L088:
    %AICMD0x1F(pAIScripting0x26_L090)                                        ;B4ABB8
    %AICMD0x12_Jump(pAIScripting0x26_L088)                                   ;B4ABBB
pAIScripting0x26_L089:
    %AICMD0x1F(pAIScripting0x26_L096)                                        ;B4ABBE
    %AICMD0x12_Jump(pAIScripting0x26_L089)                                   ;B4ABC1
pAIScripting0x26_L090:
    %AICMD0x28_ClearBit(strcFlags.unknown1, $00)                        ;B4ABC4
    %AICMD0x15_JumpIfEquals8(nCurrentYearID, 0, pAIScripting0x26_L092)       ;B4ABC9
    %AICMD0x15_JumpIfEquals8(nCurrentYearID, 1, pAIScripting0x26_L095)       ;B4ABD0
    %AICMD0x12_Jump(pAIScripting0x26_L088)                                   ;B4ABD7
pAIScripting0x26_L091:
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown1, $00)     ;B4ABDA
    %AICMD0x0B_SetScriptFlag($02)                                            ;B4ABDF
    %AICMD0x12_Jump(pAIScripting0x26_L088)                                   ;B4ABE1
pAIScripting0x26_L092:
    %AICMD0x1D_ShowDialog($0252, $00)                          ;B4ABE4
    %AICMD0x20_JumpIfChoice(0, pAIScripting0x26_L093)                        ;B4ABE8
    %AICMD0x20_JumpIfChoice(1, pAIScripting0x26_L094)                        ;B4ABEC
    %AICMD0x12_Jump(pAIScripting0x26_L089)                                   ;B4ABF0
pAIScripting0x26_L093:
    %AICMD0x1C_ShowDialog($0253, $00)                          ;B4ABF3
    %AICMD0x41_AddValue16(nLove_Maria, 8)                      ;B4ABF7
    %AICMD0x12_Jump(pAIScripting0x26_L089)                                   ;B4ABFD
pAIScripting0x26_L094:
    %AICMD0x1C_ShowDialog($0254, $00)                          ;B4AC00
    %AICMD0x41_AddValue16(nLove_Maria, 2)                      ;B4AC04
    %AICMD0x12_Jump(pAIScripting0x26_L089)                                   ;B4AC0A
pAIScripting0x26_L095:
    %AICMD0x1C_ShowDialog($025D, $00)                          ;B4AC0D
    %AICMD0x12_Jump(pAIScripting0x26_L089)                                   ;B4AC11
    %AICMD0x1C_ShowDialog($026A, $00)                          ;B4AC14
    %AICMD0x12_Jump(pAIScripting0x26_L089)                                   ;B4AC18
    %AICMD0x1C_ShowDialog($0272, $00)                          ;B4AC1B
    %AICMD0x12_Jump(pAIScripting0x26_L089)                                   ;B4AC1F
    %AICMD0x1C_ShowDialog($027A, $00)                          ;B4AC22
    %AICMD0x12_Jump(pAIScripting0x26_L089)                                   ;B4AC26
pAIScripting0x26_L096:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $05, pAIScripting0x26_L091) ;B4AC29
    %AICMD0x1C_ShowDialog($027A, $00)                          ;B4AC30
    %AICMD0x12_Jump(pAIScripting0x26_L089)                                   ;B4AC34
pAIScripting0x26_L097:
    %AICMD0x28_ClearBit(strcFlags.unknown1, $00)                        ;B4AC37
    %AICMD0x10_End()                                           ;B4AC3C
pAIScripting0x26_L098:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $01, pAIScripting0x26_L099)   ;B4AC3D
    %AICMD0x1A($0098, $0058, aAIScriptingData_L015, $00)                     ;B4AC44
    %AICMD0x12_Jump(pAIScripting0x26_L100)                                   ;B4AC4C
pAIScripting0x26_L099:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event6, $04, pAIScripting0x26_L113)   ;B4AC4F
    %AICMD0x1A($0098, $0058, aAIScriptingData_L071, $00)                     ;B4AC56
pAIScripting0x26_L100:
    %AICMD0x1F(pAIScripting0x26_L102)                                        ;B4AC5E
    %AICMD0x12_Jump(pAIScripting0x26_L100)                                   ;B4AC61
pAIScripting0x26_L101:
    %AICMD0x1F(pAIScripting0x26_L112)                                        ;B4AC64
    %AICMD0x12_Jump(pAIScripting0x26_L101)                                   ;B4AC67
pAIScripting0x26_L102:
    %AICMD0x28_ClearBit(strcFlags.unknown1, $01)                        ;B4AC6A
    %AICMD0x15_JumpIfEquals8(nCurrentYearID, 0, pAIScripting0x26_L104)       ;B4AC6F
    %AICMD0x15_JumpIfEquals8(nCurrentYearID, 1, pAIScripting0x26_L109)       ;B4AC76
    %AICMD0x12_Jump(pAIScripting0x26_L100)                                   ;B4AC7D
pAIScripting0x26_L103:
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown1, $01)     ;B4AC80
    %AICMD0x0B_SetScriptFlag($02)                                            ;B4AC85
    %AICMD0x12_Jump(pAIScripting0x26_L100)                                   ;B4AC87
pAIScripting0x26_L104:
    %AICMD0x1D_ShowDialog($025E, $00)                          ;B4AC8A
    %AICMD0x20_JumpIfChoice(0, pAIScripting0x26_L105)                        ;B4AC8E
    %AICMD0x20_JumpIfChoice(1, pAIScripting0x26_L106)                        ;B4AC92
    %AICMD0x12_Jump(pAIScripting0x26_L101)                                   ;B4AC96
pAIScripting0x26_L105:
    %AICMD0x08_EnableAIControl()                               ;B4AC99
    %AICMD0x19($00E9, $00)                                     ;B4AC9A
    %AICMD0x13_Wait(120)                                       ;B4AC9E
    %AICMD0x11_EnableUserControl()                             ;B4ACA1
    %AICMD0x1C_ShowDialog($025F, $00)                          ;B4ACA2
    %AICMD0x41_AddValue16(nLove_Ann, 8)                        ;B4ACA6
    %AICMD0x12_Jump(pAIScripting0x26_L101)                                   ;B4ACAC
pAIScripting0x26_L106:
    %AICMD0x1C_ShowDialog($0260, $00)                          ;B4ACAF
    %AICMD0x1B($0345, $00)                                     ;B4ACB3
    %AICMD0x1B($0346, $00)                                     ;B4ACB7
    %AICMD0x13_Wait(40)                                        ;B4ACBB
    %AICMD0x1C_ShowDialog($0261, $00)                          ;B4ACBE
    %AICMD0x1B($0226, $00)                                     ;B4ACC2
    %AICMD0x41_AddValue16(nLove_Ann, 2)                        ;B4ACC6
    %AICMD0x12_Jump(pAIScripting0x26_L101)                                   ;B4ACCC
    %AICMD0x1D_ShowDialog($026B, $00)                          ;B4ACCF
    %AICMD0x20_JumpIfChoice(0, pAIScripting0x26_L107)                        ;B4ACD3
    %AICMD0x20_JumpIfChoice(1, pAIScripting0x26_L108)                        ;B4ACD7
    %AICMD0x12_Jump(pAIScripting0x26_L101)                                   ;B4ACDB
pAIScripting0x26_L107:
    %AICMD0x08_EnableAIControl()                               ;B4ACDE
    %AICMD0x19($00E9, $00)                                     ;B4ACDF
    %AICMD0x13_Wait(120)                                       ;B4ACE3
    %AICMD0x11_EnableUserControl()                             ;B4ACE6
    %AICMD0x1C_ShowDialog($025F, $00)                          ;B4ACE7
    %AICMD0x41_AddValue16(nLove_Ann, 8)                        ;B4ACEB
    %AICMD0x12_Jump(pAIScripting0x26_L101)                                   ;B4ACF1
pAIScripting0x26_L108:
    %AICMD0x1C_ShowDialog($0260, $00)                          ;B4ACF4
    %AICMD0x1B($0345, $00)                                     ;B4ACF8
    %AICMD0x1B($0346, $00)                                     ;B4ACFC
    %AICMD0x13_Wait(40)                                        ;B4AD00
    %AICMD0x1C_ShowDialog($026C, $00)                          ;B4AD03
    %AICMD0x1B($0226, $00)                                     ;B4AD07
    %AICMD0x41_AddValue16(nLove_Ann, 2)                        ;B4AD0B
    %AICMD0x12_Jump(pAIScripting0x26_L101)                                   ;B4AD11
pAIScripting0x26_L109:
    %AICMD0x1C_ShowDialog($027B, $00)                          ;B4AD14
    %AICMD0x20_JumpIfChoice(0, pAIScripting0x26_L110)                        ;B4AD18
    %AICMD0x20_JumpIfChoice(1, pAIScripting0x26_L111)                        ;B4AD1C
    %AICMD0x12_Jump(pAIScripting0x26_L101)                                   ;B4AD20
pAIScripting0x26_L110:
    %AICMD0x08_EnableAIControl()                               ;B4AD23
    %AICMD0x19($00E9, $00)                                     ;B4AD24
    %AICMD0x13_Wait(120)                                       ;B4AD28
    %AICMD0x11_EnableUserControl()                             ;B4AD2B
    %AICMD0x1C_ShowDialog($025F, $00)                          ;B4AD2C
    %AICMD0x41_AddValue16(nLove_Ann, 8)                        ;B4AD30
    %AICMD0x12_Jump(pAIScripting0x26_L101)                                   ;B4AD36
pAIScripting0x26_L111:
    %AICMD0x1B($0345, $00)                                     ;B4AD39
    %AICMD0x1B($0346, $00)                                     ;B4AD3D
    %AICMD0x13_Wait(60)                                        ;B4AD41
    %AICMD0x1C_ShowDialog($026C, $00)                          ;B4AD44
    %AICMD0x1B($0226, $00)                                     ;B4AD48
    %AICMD0x12_Jump(pAIScripting0x26_L101)                                   ;B4AD4C
pAIScripting0x26_L112:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $05, pAIScripting0x26_L103) ;B4AD4F
    %AICMD0x1C_ShowDialog($0255, $00)                          ;B4AD56
    %AICMD0x12_Jump(pAIScripting0x26_L101)                                   ;B4AD5A
pAIScripting0x26_L113:
    %AICMD0x28_ClearBit(strcFlags.unknown1, $01)                        ;B4AD5D
    %AICMD0x10_End()                                           ;B4AD62
pAIScripting0x26_L114:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, pAIScripting0x26_L115)   ;B4AD63
    %AICMD0x1A($0148, $00A8, aAIScriptingData_L019, $00)                     ;B4AD6A
    %AICMD0x12_Jump(pAIScripting0x26_L116)                                   ;B4AD72
pAIScripting0x26_L115:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event6, $04, pAIScripting0x26_L128)   ;B4AD75
    %AICMD0x1A($0148, $00A8, aAIScriptingData_L071, $00)                     ;B4AD7C
pAIScripting0x26_L116:
    %AICMD0x1F(pAIScripting0x26_L118)                                        ;B4AD84
    %AICMD0x12_Jump(pAIScripting0x26_L116)                                   ;B4AD87
pAIScripting0x26_L117:
    %AICMD0x1F(pAIScripting0x26_L127)                                        ;B4AD8A
    %AICMD0x12_Jump(pAIScripting0x26_L117)                                   ;B4AD8D
pAIScripting0x26_L118:
    %AICMD0x28_ClearBit(strcFlags.unknown1, $02)                        ;B4AD90
    %AICMD0x15_JumpIfEquals8(nCurrentYearID, 0, pAIScripting0x26_L120)       ;B4AD95
    %AICMD0x15_JumpIfEquals8(nCurrentYearID, 1, pAIScripting0x26_L123)       ;B4AD9C
    %AICMD0x12_Jump(pAIScripting0x26_L116)                                   ;B4ADA3
pAIScripting0x26_L119:
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown1, $02)     ;B4ADA6
    %AICMD0x0B_SetScriptFlag($02)                                            ;B4ADAB
    %AICMD0x12_Jump(pAIScripting0x26_L116)                                   ;B4ADAD
pAIScripting0x26_L120:
    %AICMD0x09_StartScript($14, pAIScripting0x26_L031)                                   ;B4ADB0
    %AICMD0x1D_ShowDialog($0256, $00)                          ;B4ADB4
    %AICMD0x20_JumpIfChoice(0, pAIScripting0x26_L121)                        ;B4ADB8
    %AICMD0x20_JumpIfChoice(1, pAIScripting0x26_L122)                        ;B4ADBC
    %AICMD0x12_Jump(pAIScripting0x26_L116)                                   ;B4ADC0
pAIScripting0x26_L121:
    %AICMD0x08_EnableAIControl()                               ;B4ADC3
    %AICMD0x19($00FC, $00)                                     ;B4ADC4
    %AICMD0x13_Wait(120)                                       ;B4ADC8
    %AICMD0x11_EnableUserControl()                             ;B4ADCB
    %AICMD0x1C_ShowDialog($0257, $00)                          ;B4ADCC
    %AICMD0x41_AddValue16(nLove_Nina, 8)                       ;B4ADD0
    %AICMD0x12_Jump(pAIScripting0x26_L117)                                   ;B4ADD6
pAIScripting0x26_L122:
    %AICMD0x1C_ShowDialog($0258, $00)                          ;B4ADD9
    %AICMD0x41_AddValue16(nLove_Nina, 2)                       ;B4ADDD
    %AICMD0x12_Jump(pAIScripting0x26_L117)                                   ;B4ADE3
pAIScripting0x26_L123:
    %AICMD0x09_StartScript($14, pAIScripting0x26_L033)                                   ;B4ADE6
    %AICMD0x1D_ShowDialog($0291, $00)                          ;B4ADEA
    %AICMD0x20_JumpIfChoice(0, pAIScripting0x26_L124)                        ;B4ADEE
    %AICMD0x20_JumpIfChoice(1, pAIScripting0x26_L125)                        ;B4ADF2
    %AICMD0x12_Jump(pAIScripting0x26_L117)                                   ;B4ADF6
pAIScripting0x26_L124:
    %AICMD0x08_EnableAIControl()                               ;B4ADF9
    %AICMD0x19($0038, $00)                                     ;B4ADFA
    %AICMD0x13_Wait(120)                                       ;B4ADFE
    %AICMD0x11_EnableUserControl()                             ;B4AE01
    %AICMD0x1C_ShowDialog($0262, $00)                          ;B4AE02
    %AICMD0x41_AddValue16(nLove_Nina, 8)                       ;B4AE06
    %AICMD0x12_Jump(pAIScripting0x26_L117)                                   ;B4AE0C
pAIScripting0x26_L125:
    %AICMD0x1C_ShowDialog($0263, $00)                          ;B4AE0F
    %AICMD0x41_AddValue16(nLove_Nina, 2)                       ;B4AE13
    %AICMD0x12_Jump(pAIScripting0x26_L117)                                   ;B4AE19
    %AICMD0x09_StartScript($14, pAIScripting0x26_L032)                                   ;B4AE1C
    %AICMD0x1D_ShowDialog($0256, $00)                          ;B4AE20
    %AICMD0x20_JumpIfChoice(0, pAIScripting0x26_L126)                        ;B4AE24
    %AICMD0x20_JumpIfChoice(1, pAIScripting0x26_L122)                        ;B4AE28
    %AICMD0x12_Jump(pAIScripting0x26_L117)                                   ;B4AE2C
pAIScripting0x26_L126:
    %AICMD0x08_EnableAIControl()                               ;B4AE2F
    %AICMD0x19($00FD, $00)                                     ;B4AE30
    %AICMD0x13_Wait(120)                                       ;B4AE34
    %AICMD0x11_EnableUserControl()                             ;B4AE37
    %AICMD0x1C_ShowDialog($027C, $00)                          ;B4AE38
    %AICMD0x41_AddValue16(nLove_Nina, 8)                       ;B4AE3C
    %AICMD0x12_Jump(pAIScripting0x26_L117)                                   ;B4AE42
    %AICMD0x1C_ShowDialog($0258, $00)                          ;B4AE45
    %AICMD0x41_AddValue16(nLove_Nina, 2)                       ;B4AE49
    %AICMD0x12_Jump(pAIScripting0x26_L117)                                   ;B4AE4F
pAIScripting0x26_L127:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $05, pAIScripting0x26_L119) ;B4AE52
    %AICMD0x1C_ShowDialog($026D, $00)                          ;B4AE59
    %AICMD0x12_Jump(pAIScripting0x26_L117)                                   ;B4AE5D
pAIScripting0x26_L128:
    %AICMD0x28_ClearBit(strcFlags.unknown1, $02)                        ;B4AE60
    %AICMD0x10_End()                                           ;B4AE65
pAIScripting0x26_L129:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $03, pAIScripting0x26_L130)   ;B4AE66
    %AICMD0x1A($0108, $0098, aAIScriptingData_L021, $00)                     ;B4AE6D
    %AICMD0x12_Jump(pAIScripting0x26_L131)                                   ;B4AE75
pAIScripting0x26_L130:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event6, $04, pAIScripting0x26_L144)   ;B4AE78
    %AICMD0x1A($0108, $0098, aAIScriptingData_L071, $00)                     ;B4AE7F
pAIScripting0x26_L131:
    %AICMD0x1F(pAIScripting0x26_L133)                                        ;B4AE87
    %AICMD0x12_Jump(pAIScripting0x26_L131)                                   ;B4AE8A
pAIScripting0x26_L132:
    %AICMD0x1F(pAIScripting0x26_L143)                                        ;B4AE8D
    %AICMD0x12_Jump(pAIScripting0x26_L132)                                   ;B4AE90
pAIScripting0x26_L133:
    %AICMD0x28_ClearBit(strcFlags.unknown1, $03)                        ;B4AE93
    %AICMD0x15_JumpIfEquals8(nCurrentYearID, 0, pAIScripting0x26_L135)       ;B4AE98
    %AICMD0x15_JumpIfEquals8(nCurrentYearID, 1, pAIScripting0x26_L138)       ;B4AE9F
    %AICMD0x12_Jump(pAIScripting0x26_L131)                                   ;B4AEA6
pAIScripting0x26_L134:
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown1, $03)     ;B4AEA9
    %AICMD0x0B_SetScriptFlag($02)                                            ;B4AEAE
    %AICMD0x12_Jump(pAIScripting0x26_L132)                                   ;B4AEB0
pAIScripting0x26_L135:
    %AICMD0x09_StartScript($14, pAIScripting0x26_L034)                                   ;B4AEB3
    %AICMD0x1D_ShowDialog($0259, $00)                          ;B4AEB7
    %AICMD0x20_JumpIfChoice(0, pAIScripting0x26_L136)                        ;B4AEBB
    %AICMD0x20_JumpIfChoice(1, pAIScripting0x26_L137)                        ;B4AEBF
    %AICMD0x12_Jump(pAIScripting0x26_L131)                                   ;B4AEC3
pAIScripting0x26_L136:
    %AICMD0x08_EnableAIControl()                               ;B4AEC6
    %AICMD0x19($0039, $00)                                     ;B4AEC7
    %AICMD0x13_Wait(120)                                       ;B4AECB
    %AICMD0x11_EnableUserControl()                             ;B4AECE
    %AICMD0x1C_ShowDialog($025A, $00)                          ;B4AECF
    %AICMD0x41_AddValue16(nLove_Ellen, 8)                      ;B4AED3
    %AICMD0x12_Jump(pAIScripting0x26_L132)                                   ;B4AED9
pAIScripting0x26_L137:
    %AICMD0x1C_ShowDialog($025B, $00)                          ;B4AEDC
    %AICMD0x41_AddValue16(nLove_Ellen, 2)                      ;B4AEE0
    %AICMD0x12_Jump(pAIScripting0x26_L132)                                   ;B4AEE6
pAIScripting0x26_L138:
    %AICMD0x09_StartScript($14, pAIScripting0x26_L034)                                   ;B4AEE9
    %AICMD0x1D_ShowDialog($0264, $00)                          ;B4AEED
    %AICMD0x20_JumpIfChoice(0, pAIScripting0x26_L139)                        ;B4AEF1
    %AICMD0x20_JumpIfChoice(1, pAIScripting0x26_L140)                        ;B4AEF5
    %AICMD0x12_Jump(pAIScripting0x26_L132)                                   ;B4AEF9
pAIScripting0x26_L139:
    %AICMD0x08_EnableAIControl()                               ;B4AEFC
    %AICMD0x19($0039, $00)                                     ;B4AEFD
    %AICMD0x13_Wait(120)                                       ;B4AF01
    %AICMD0x11_EnableUserControl()                             ;B4AF04
    %AICMD0x1C_ShowDialog($0265, $00)                          ;B4AF05
    %AICMD0x41_AddValue16(nLove_Ellen, 8)                      ;B4AF09
    %AICMD0x12_Jump(pAIScripting0x26_L132)                                   ;B4AF0F
pAIScripting0x26_L140:
    %AICMD0x1C_ShowDialog($0266, $00)                          ;B4AF12
    %AICMD0x41_AddValue16(nLove_Ellen, 2)                      ;B4AF16
    %AICMD0x12_Jump(pAIScripting0x26_L132)                                   ;B4AF1C
    %AICMD0x09_StartScript($14, pAIScripting0x26_L034)                                   ;B4AF1F
    %AICMD0x1D_ShowDialog($0275, $00)                          ;B4AF23
    %AICMD0x20_JumpIfChoice(0, pAIScripting0x26_L141)                        ;B4AF27
    %AICMD0x20_JumpIfChoice(1, pAIScripting0x26_L142)                        ;B4AF2B
    %AICMD0x12_Jump(pAIScripting0x26_L132)                                   ;B4AF2F
pAIScripting0x26_L141:
    %AICMD0x08_EnableAIControl()                               ;B4AF32
    %AICMD0x19($0039, $00)                                     ;B4AF33
    %AICMD0x13_Wait(120)                                       ;B4AF37
    %AICMD0x11_EnableUserControl()                             ;B4AF3A
    %AICMD0x1C_ShowDialog($0265, $00)                          ;B4AF3B
    %AICMD0x41_AddValue16(nLove_Ellen, 8)                      ;B4AF3F
    %AICMD0x12_Jump(pAIScripting0x26_L132)                                   ;B4AF45
pAIScripting0x26_L142:
    %AICMD0x1C_ShowDialog($0266, $00)                          ;B4AF48
    %AICMD0x41_AddValue16(nLove_Ellen, 2)                      ;B4AF4C
    %AICMD0x12_Jump(pAIScripting0x26_L132)                                   ;B4AF52
    %AICMD0x1C_ShowDialog($027D, $00)                          ;B4AF55
    %AICMD0x08_EnableAIControl()                               ;B4AF59
    %AICMD0x19($0039, $00)                                     ;B4AF5A
    %AICMD0x13_Wait(120)                                       ;B4AF5E
    %AICMD0x11_EnableUserControl()                             ;B4AF61
    %AICMD0x41_AddValue16(nLove_Ellen, 2)                      ;B4AF62
    %AICMD0x12_Jump(pAIScripting0x26_L132)                                   ;B4AF68
pAIScripting0x26_L143:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $05, pAIScripting0x26_L134) ;B4AF6B
    %AICMD0x1C_ShowDialog($027D, $00)                          ;B4AF72
    %AICMD0x12_Jump(pAIScripting0x26_L132)                                   ;B4AF76
pAIScripting0x26_L144:
    %AICMD0x28_ClearBit(strcFlags.unknown1, $03)                        ;B4AF79
    %AICMD0x10_End()                                           ;B4AF7E
pAIScripting0x26_L145:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $04, pAIScripting0x26_L146)   ;B4AF7F
    %AICMD0x1A($00B8, $0098, aAIScriptingData_L024, $00)                     ;B4AF86
    %AICMD0x12_Jump(pAIScripting0x26_L147)                                   ;B4AF8E
pAIScripting0x26_L146:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event6, $04, pAIScripting0x26_L160)   ;B4AF91
    %AICMD0x1A($00B8, $0098, aAIScriptingData_L071, $00)                     ;B4AF98
pAIScripting0x26_L147:
    %AICMD0x1F(pAIScripting0x26_L149)                                        ;B4AFA0
    %AICMD0x12_Jump(pAIScripting0x26_L147)                                   ;B4AFA3
pAIScripting0x26_L148:
    %AICMD0x1F(pAIScripting0x26_L159)                                        ;B4AFA6
    %AICMD0x12_Jump(pAIScripting0x26_L148)                                   ;B4AFA9
pAIScripting0x26_L149:
    %AICMD0x28_ClearBit(strcFlags.unknown1, $04)                        ;B4AFAC
    %AICMD0x15_JumpIfEquals8(nCurrentYearID, 0, pAIScripting0x26_L151)       ;B4AFB1
    %AICMD0x15_JumpIfEquals8(nCurrentYearID, 1, pAIScripting0x26_L156)       ;B4AFB8
    %AICMD0x12_Jump(pAIScripting0x26_L147)                                   ;B4AFBF
pAIScripting0x26_L150:
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown1, $04)     ;B4AFC2
    %AICMD0x0B_SetScriptFlag($02)                                            ;B4AFC7
    %AICMD0x12_Jump(pAIScripting0x26_L147)                                   ;B4AFC9
pAIScripting0x26_L151:
    %AICMD0x1D_ShowDialog($0267, $00)                          ;B4AFCC
    %AICMD0x20_JumpIfChoice(0, pAIScripting0x26_L152)                        ;B4AFD0
    %AICMD0x20_JumpIfChoice(1, pAIScripting0x26_L153)                        ;B4AFD4
    %AICMD0x12_Jump(pAIScripting0x26_L148)                                   ;B4AFD8
pAIScripting0x26_L152:
    %AICMD0x1C_ShowDialog($0268, $00)                          ;B4AFDB
    %AICMD0x32_SetValue16($8000D4, $0015)                                 ;B4AFDF
    %AICMD0x41_AddValue16(nLove_Eve, 8)                        ;B4AFE5
    %AICMD0x12_Jump(pAIScripting0x26_L148)                                   ;B4AFEB
pAIScripting0x26_L153:
    %AICMD0x1C_ShowDialog($0269, $00)                          ;B4AFEE
    %AICMD0x41_AddValue16(nLove_Eve, 2)                        ;B4AFF2
    %AICMD0x12_Jump(pAIScripting0x26_L148)                                   ;B4AFF8
    %AICMD0x1D_ShowDialog($026F, $00)                          ;B4AFFB
    %AICMD0x20_JumpIfChoice(0, pAIScripting0x26_L154)                        ;B4AFFF
    %AICMD0x20_JumpIfChoice(1, pAIScripting0x26_L155)                        ;B4B003
    %AICMD0x12_Jump(pAIScripting0x26_L147)                                   ;B4B007
pAIScripting0x26_L154:
    %AICMD0x1C_ShowDialog($0270, $00)                          ;B4B00A
    %AICMD0x32_SetValue16($8000D4, $0015)                                 ;B4B00E
    %AICMD0x41_AddValue16(nLove_Eve, 8)                        ;B4B014
    %AICMD0x12_Jump(pAIScripting0x26_L148)                                   ;B4B01A
pAIScripting0x26_L155:
    %AICMD0x1C_ShowDialog($0271, $00)                          ;B4B01D
    %AICMD0x41_AddValue16(nLove_Eve, 2)                        ;B4B021
    %AICMD0x12_Jump(pAIScripting0x26_L148)                                   ;B4B027
pAIScripting0x26_L156:
    %AICMD0x1D_ShowDialog($0277, $00)                          ;B4B02A
    %AICMD0x20_JumpIfChoice(0, pAIScripting0x26_L157)                        ;B4B02E
    %AICMD0x20_JumpIfChoice(1, pAIScripting0x26_L158)                        ;B4B032
    %AICMD0x12_Jump(pAIScripting0x26_L148)                                   ;B4B036
pAIScripting0x26_L157:
    %AICMD0x1C_ShowDialog($0278, $00)                          ;B4B039
    %AICMD0x32_SetValue16($8000D4, $0015)                                 ;B4B03D
    %AICMD0x41_AddValue16(nLove_Eve, 8)                        ;B4B043
    %AICMD0x12_Jump(pAIScripting0x26_L148)                                   ;B4B049
pAIScripting0x26_L158:
    %AICMD0x1C_ShowDialog($0279, $00)                          ;B4B04C
    %AICMD0x41_AddValue16(nLove_Eve, 2)                        ;B4B050
    %AICMD0x12_Jump(pAIScripting0x26_L148)                                   ;B4B056
    %AICMD0x1C_ShowDialog($027F, $00)                          ;B4B059
    %AICMD0x32_SetValue16($8000D4, $0015)                                 ;B4B05D
    %AICMD0x12_Jump(pAIScripting0x26_L148)                                   ;B4B063
pAIScripting0x26_L159:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $05, pAIScripting0x26_L150) ;B4B066
    %AICMD0x1C_ShowDialog($0365, $00)                          ;B4B06D
    %AICMD0x12_Jump(pAIScripting0x26_L148)                                   ;B4B071
pAIScripting0x26_L160:
    %AICMD0x28_ClearBit(strcFlags.unknown1, $04)                        ;B4B074
    %AICMD0x10_End()                                           ;B4B079
pAIScripting0x26_L161:
    %AICMD0x1A($00B8, $00B8, aAIScriptingData_L044, $02)                     ;B4B07A
    %AICMD0x0C_WaitForScriptFlag($09)                                            ;B4B082
    %AICMD0x13_Wait(180)                                       ;B4B084
pAIScripting0x26_L162:
    %AICMD0x1B($0294, $01)                                     ;B4B087
    %AICMD0x13_Wait(50)                                        ;B4B08B
    %AICMD0x1B($0292, $00)                                     ;B4B08E
    %AICMD0x13_Wait(10)                                        ;B4B092
    %AICMD0x1B($0294, $00)                                     ;B4B095
    %AICMD0x13_Wait(10)                                        ;B4B099
    %AICMD0x1B($0290, $00)                                     ;B4B09C
    %AICMD0x13_Wait(10)                                        ;B4B0A0
    %AICMD0x1B($0294, $01)                                     ;B4B0A3
    %AICMD0x13_Wait(10)                                        ;B4B0A7
    %AICMD0x1B($0294, $01)                                     ;B4B0AA
    %AICMD0x0D($FF, $00, $20, $02)                             ;B4B0AE
    %AICMD0x1B($0294, $01)                                     ;B4B0B3
    %AICMD0x0D($01, $00, $20, $02)                             ;B4B0B7
    %AICMD0x1B($0294, $01)                                     ;B4B0BC
    %AICMD0x0D($FF, $00, $10, $02)                             ;B4B0C0
    %AICMD0x1B($0294, $01)                                     ;B4B0C5
    %AICMD0x0D($01, $00, $10, $02)                             ;B4B0C9
    %AICMD0x12_Jump(pAIScripting0x26_L162)                                   ;B4B0CE
pAIScripting0x26_L163:
    %AICMD0x1A($00C8, $00B8, aAIScriptingData_L061, $03)                     ;B4B0D1
    %AICMD0x0C_WaitForScriptFlag($09)                                            ;B4B0D9
    %AICMD0x13_Wait(180)                                       ;B4B0DB
pAIScripting0x26_L164:
    %AICMD0x1B($02C5, $00)                                     ;B4B0DE
    %AICMD0x13_Wait(10)                                        ;B4B0E2
    %AICMD0x1B($02C9, $01)                                     ;B4B0E5
    %AICMD0x13_Wait(10)                                        ;B4B0E9
    %AICMD0x1B($02C7, $00)                                     ;B4B0EC
    %AICMD0x13_Wait(10)                                        ;B4B0F0
    %AICMD0x1B($02C9, $00)                                     ;B4B0F3
    %AICMD0x13_Wait(10)                                        ;B4B0F7
    %AICMD0x1B($02C5, $00)                                     ;B4B0FA
    %AICMD0x13_Wait(50)                                        ;B4B0FE
    %AICMD0x1B($02C9, $00)                                     ;B4B101
    %AICMD0x0D($01, $00, $20, $02)                             ;B4B105
    %AICMD0x1B($02C9, $00)                                     ;B4B10A
    %AICMD0x0D($FF, $00, $20, $02)                             ;B4B10E
    %AICMD0x1B($02C9, $00)                                     ;B4B113
    %AICMD0x0D($01, $00, $10, $02)                             ;B4B117
    %AICMD0x1B($02C9, $00)                                     ;B4B11C
    %AICMD0x0D($FF, $00, $10, $02)                             ;B4B120
    %AICMD0x12_Jump(pAIScripting0x26_L164)                                   ;B4B125
pAIScripting0x26_L165:
    %AICMD0x1A($0158, $00D8, aAIScriptingData_L046, $02)                     ;B4B128
    %AICMD0x0C_WaitForScriptFlag($09)                                            ;B4B130
    %AICMD0x13_Wait(180)                                       ;B4B132
pAIScripting0x26_L166:
    %AICMD0x1B($029B, $01)                                     ;B4B135
    %AICMD0x13_Wait(50)                                        ;B4B139
    %AICMD0x1B($0299, $00)                                     ;B4B13C
    %AICMD0x13_Wait(10)                                        ;B4B140
    %AICMD0x1B($029B, $00)                                     ;B4B143
    %AICMD0x13_Wait(10)                                        ;B4B147
    %AICMD0x1B($0297, $00)                                     ;B4B14A
    %AICMD0x13_Wait(10)                                        ;B4B14E
    %AICMD0x1B($029B, $01)                                     ;B4B151
    %AICMD0x13_Wait(10)                                        ;B4B155
    %AICMD0x1B($029B, $01)                                     ;B4B158
    %AICMD0x0D($FF, $00, $20, $02)                             ;B4B15C
    %AICMD0x1B($029B, $01)                                     ;B4B161
    %AICMD0x0D($01, $00, $20, $02)                             ;B4B165
    %AICMD0x1B($029B, $01)                                     ;B4B16A
    %AICMD0x0D($FF, $00, $10, $02)                             ;B4B16E
    %AICMD0x1B($029B, $01)                                     ;B4B173
    %AICMD0x0D($01, $00, $10, $02)                             ;B4B177
    %AICMD0x12_Jump(pAIScripting0x26_L166)                                   ;B4B17C
pAIScripting0x26_L167:
    %AICMD0x1A($0168, $00D8, aAIScriptingData_L064, $03)                     ;B4B17F
    %AICMD0x0C_WaitForScriptFlag($09)                                            ;B4B187
    %AICMD0x13_Wait(180)                                       ;B4B189
pAIScripting0x26_L168:
    %AICMD0x1B($02D0, $00)                                     ;B4B18C
    %AICMD0x13_Wait(10)                                        ;B4B190
    %AICMD0x1B($02CF, $00)                                     ;B4B193
    %AICMD0x13_Wait(10)                                        ;B4B197
    %AICMD0x1B($02D0, $01)                                     ;B4B19A
    %AICMD0x13_Wait(10)                                        ;B4B19E
    %AICMD0x1B($02CD, $00)                                     ;B4B1A1
    %AICMD0x13_Wait(10)                                        ;B4B1A5
    %AICMD0x1B($02D0, $00)                                     ;B4B1A8
    %AICMD0x13_Wait(50)                                        ;B4B1AC
    %AICMD0x1B($02D0, $00)                                     ;B4B1AF
    %AICMD0x0D($01, $00, $20, $02)                             ;B4B1B3
    %AICMD0x1B($02D0, $00)                                     ;B4B1B8
    %AICMD0x0D($FF, $00, $20, $02)                             ;B4B1BC
    %AICMD0x1B($02D0, $00)                                     ;B4B1C1
    %AICMD0x0D($01, $00, $10, $02)                             ;B4B1C5
    %AICMD0x1B($02D0, $00)                                     ;B4B1CA
    %AICMD0x0D($FF, $00, $10, $02)                             ;B4B1CE
    %AICMD0x12_Jump(pAIScripting0x26_L168)                                   ;B4B1D3
pAIScripting0x26_L169:
    %AICMD0x1A($00B8, $0128, aAIScriptingData_L067, $02)                     ;B4B1D6
    %AICMD0x0C_WaitForScriptFlag($09)                                            ;B4B1DE
    %AICMD0x13_Wait(180)                                       ;B4B1E0
pAIScripting0x26_L170:
    %AICMD0x1B($02D7, $01)                                     ;B4B1E3
    %AICMD0x13_Wait(50)                                        ;B4B1E7
    %AICMD0x1B($02D5, $00)                                     ;B4B1EA
    %AICMD0x13_Wait(10)                                        ;B4B1EE
    %AICMD0x1B($02D7, $00)                                     ;B4B1F1
    %AICMD0x13_Wait(10)                                        ;B4B1F5
    %AICMD0x1B($02D3, $00)                                     ;B4B1F8
    %AICMD0x13_Wait(10)                                        ;B4B1FC
    %AICMD0x1B($02D7, $01)                                     ;B4B1FF
    %AICMD0x13_Wait(10)                                        ;B4B203
    %AICMD0x1B($02D7, $00)                                     ;B4B206
    %AICMD0x0D($01, $00, $0C, $01)                             ;B4B20A
    %AICMD0x1B($02D7, $00)                                     ;B4B20F
    %AICMD0x0D($FF, $00, $0C, $01)                             ;B4B213
    %AICMD0x1B($02D7, $00)                                     ;B4B218
    %AICMD0x0D($01, $00, $08, $01)                             ;B4B21C
    %AICMD0x1B($02D7, $00)                                     ;B4B221
    %AICMD0x0D($FF, $00, $08, $01)                             ;B4B225
    %AICMD0x12_Jump(pAIScripting0x26_L170)                                   ;B4B22A
pAIScripting0x26_L171:
    %AICMD0x1A($00C8, $0128, aAIScriptingData_L055, $03)                     ;B4B22D
    %AICMD0x0C_WaitForScriptFlag($09)                                            ;B4B235
    %AICMD0x13_Wait(180)                                       ;B4B237
pAIScripting0x26_L172:
    %AICMD0x1B($02B6, $01)                                     ;B4B23A
    %AICMD0x13_Wait(10)                                        ;B4B23E
    %AICMD0x1B($02B4, $00)                                     ;B4B241
    %AICMD0x13_Wait(10)                                        ;B4B245
    %AICMD0x1B($02B6, $00)                                     ;B4B248
    %AICMD0x13_Wait(10)                                        ;B4B24C
    %AICMD0x1B($02B2, $00)                                     ;B4B24F
    %AICMD0x13_Wait(10)                                        ;B4B253
    %AICMD0x1B($02B6, $01)                                     ;B4B256
    %AICMD0x13_Wait(50)                                        ;B4B25A
    %AICMD0x1B($02B6, $01)                                     ;B4B25D
    %AICMD0x0D($FF, $00, $0C, $01)                             ;B4B261
    %AICMD0x1B($02B6, $01)                                     ;B4B266
    %AICMD0x0D($01, $00, $0C, $01)                             ;B4B26A
    %AICMD0x1B($02B6, $01)                                     ;B4B26F
    %AICMD0x0D($FF, $00, $08, $01)                             ;B4B273
    %AICMD0x1B($02B6, $01)                                     ;B4B278
    %AICMD0x0D($01, $00, $08, $01)                             ;B4B27C
    %AICMD0x12_Jump(pAIScripting0x26_L172)                                   ;B4B281
pAIScripting0x26_L173:
    %AICMD0x1A($0110, $0108, aAIScriptingData_L011, $03)                     ;B4B284
    %AICMD0x0C_WaitForScriptFlag($09)                                            ;B4B28C
    %AICMD0x13_Wait(200)                                       ;B4B28E
pAIScripting0x26_L174:
    %AICMD0x1B($0223, $00)                                     ;B4B291
    %AICMD0x13_Wait(10)                                        ;B4B295
    %AICMD0x1B($0221, $00)                                     ;B4B298
    %AICMD0x13_Wait(10)                                        ;B4B29C
    %AICMD0x1B($0223, $01)                                     ;B4B29F
    %AICMD0x13_Wait(10)                                        ;B4B2A3
    %AICMD0x1B($021F, $00)                                     ;B4B2A6
    %AICMD0x13_Wait(10)                                        ;B4B2AA
    %AICMD0x1B($0223, $00)                                     ;B4B2AD
    %AICMD0x13_Wait(50)                                        ;B4B2B1
    %AICMD0x1B($0223, $00)                                     ;B4B2B4
    %AICMD0x0D($01, $00, $20, $02)                             ;B4B2B8
    %AICMD0x1B($0223, $00)                                     ;B4B2BD
    %AICMD0x0D($FF, $00, $20, $02)                             ;B4B2C1
    %AICMD0x1B($0223, $00)                                     ;B4B2C6
    %AICMD0x0D($01, $00, $10, $02)                             ;B4B2CA
    %AICMD0x1B($0223, $00)                                     ;B4B2CF
    %AICMD0x0D($FF, $00, $10, $02)                             ;B4B2D3
    %AICMD0x12_Jump(pAIScripting0x26_L174)                                   ;B4B2D8
pAIScripting0x26_L175:
    %AICMD0x1A($0110, $0108, aAIScriptingData_L015, $03)                     ;B4B2DB
    %AICMD0x0C_WaitForScriptFlag($09)                                            ;B4B2E3
    %AICMD0x13_Wait(200)                                       ;B4B2E5
pAIScripting0x26_L176:
    %AICMD0x1B($022B, $00)                                     ;B4B2E8
    %AICMD0x13_Wait(10)                                        ;B4B2EC
    %AICMD0x1B($0229, $00)                                     ;B4B2EF
    %AICMD0x13_Wait(10)                                        ;B4B2F3
    %AICMD0x1B($022B, $01)                                     ;B4B2F6
    %AICMD0x13_Wait(10)                                        ;B4B2FA
    %AICMD0x1B($0227, $00)                                     ;B4B2FD
    %AICMD0x13_Wait(10)                                        ;B4B301
    %AICMD0x1B($022B, $00)                                     ;B4B304
    %AICMD0x13_Wait(50)                                        ;B4B308
    %AICMD0x1B($022B, $00)                                     ;B4B30B
    %AICMD0x0D($01, $00, $20, $02)                             ;B4B30F
    %AICMD0x1B($022B, $00)                                     ;B4B314
    %AICMD0x0D($FF, $00, $20, $02)                             ;B4B318
    %AICMD0x1B($022B, $00)                                     ;B4B31D
    %AICMD0x0D($01, $00, $10, $02)                             ;B4B321
    %AICMD0x1B($022B, $00)                                     ;B4B326
    %AICMD0x0D($FF, $00, $10, $02)                             ;B4B32A
    %AICMD0x12_Jump(pAIScripting0x26_L176)                                   ;B4B32F
pAIScripting0x26_L177:
    %AICMD0x1A($0110, $0108, aAIScriptingData_L019, $03)                     ;B4B332
    %AICMD0x0C_WaitForScriptFlag($09)                                            ;B4B33A
    %AICMD0x13_Wait(200)                                       ;B4B33C
pAIScripting0x26_L178:
    %AICMD0x1B($0250, $00)                                     ;B4B33F
    %AICMD0x13_Wait(10)                                        ;B4B343
    %AICMD0x1B($024E, $00)                                     ;B4B346
    %AICMD0x13_Wait(10)                                        ;B4B34A
    %AICMD0x1B($0250, $01)                                     ;B4B34D
    %AICMD0x13_Wait(10)                                        ;B4B351
    %AICMD0x1B($024C, $00)                                     ;B4B354
    %AICMD0x13_Wait(10)                                        ;B4B358
    %AICMD0x1B($0250, $00)                                     ;B4B35B
    %AICMD0x13_Wait(50)                                        ;B4B35F
    %AICMD0x1B($0250, $00)                                     ;B4B362
    %AICMD0x0D($01, $00, $20, $02)                             ;B4B366
    %AICMD0x1B($0250, $00)                                     ;B4B36B
    %AICMD0x0D($FF, $00, $20, $02)                             ;B4B36F
    %AICMD0x1B($0250, $00)                                     ;B4B374
    %AICMD0x0D($01, $00, $10, $02)                             ;B4B378
    %AICMD0x1B($0250, $00)                                     ;B4B37D
    %AICMD0x0D($FF, $00, $10, $02)                             ;B4B381
    %AICMD0x12_Jump(pAIScripting0x26_L178)                                   ;B4B386
pAIScripting0x26_L179:
    %AICMD0x1A($0110, $0108, aAIScriptingData_L021, $03)                     ;B4B389
    %AICMD0x0C_WaitForScriptFlag($09)                                            ;B4B391
    %AICMD0x13_Wait(200)                                       ;B4B393
pAIScripting0x26_L180:
    %AICMD0x1B($0241, $00)                                     ;B4B396
    %AICMD0x13_Wait(10)                                        ;B4B39A
    %AICMD0x1B($023F, $00)                                     ;B4B39D
    %AICMD0x13_Wait(10)                                        ;B4B3A1
    %AICMD0x1B($0241, $01)                                     ;B4B3A4
    %AICMD0x13_Wait(10)                                        ;B4B3A8
    %AICMD0x1B($023D, $00)                                     ;B4B3AB
    %AICMD0x13_Wait(10)                                        ;B4B3AF
    %AICMD0x1B($0241, $00)                                     ;B4B3B2
    %AICMD0x13_Wait(50)                                        ;B4B3B6
    %AICMD0x1B($0241, $00)                                     ;B4B3B9
    %AICMD0x0D($01, $00, $20, $02)                             ;B4B3BD
    %AICMD0x1B($0241, $00)                                     ;B4B3C2
    %AICMD0x0D($FF, $00, $20, $02)                             ;B4B3C6
    %AICMD0x1B($0241, $00)                                     ;B4B3CB
    %AICMD0x0D($01, $00, $10, $02)                             ;B4B3CF
    %AICMD0x1B($0241, $00)                                     ;B4B3D4
    %AICMD0x0D($FF, $00, $10, $02)                             ;B4B3D8
    %AICMD0x12_Jump(pAIScripting0x26_L180)                                   ;B4B3DD
pAIScripting0x26_L181:
    %AICMD0x1A($0110, $0108, aAIScriptingData_L024, $03)                     ;B4B3E0
    %AICMD0x0C_WaitForScriptFlag($09)                                            ;B4B3E8
    %AICMD0x13_Wait(200)                                       ;B4B3EA
pAIScripting0x26_L182:
    %AICMD0x1B($0249, $00)                                     ;B4B3ED
    %AICMD0x13_Wait(10)                                        ;B4B3F1
    %AICMD0x1B($0247, $00)                                     ;B4B3F4
    %AICMD0x13_Wait(10)                                        ;B4B3F8
    %AICMD0x1B($0249, $01)                                     ;B4B3FB
    %AICMD0x13_Wait(10)                                        ;B4B3FF
    %AICMD0x1B($0245, $00)                                     ;B4B402
    %AICMD0x13_Wait(10)                                        ;B4B406
    %AICMD0x1B($0249, $00)                                     ;B4B409
    %AICMD0x13_Wait(50)                                        ;B4B40D
    %AICMD0x1B($0249, $00)                                     ;B4B410
    %AICMD0x0D($01, $00, $20, $02)                             ;B4B414
    %AICMD0x1B($0249, $00)                                     ;B4B419
    %AICMD0x0D($FF, $00, $20, $02)                             ;B4B41D
    %AICMD0x1B($0249, $00)                                     ;B4B422
    %AICMD0x0D($01, $00, $10, $02)                             ;B4B426
    %AICMD0x1B($0249, $00)                                     ;B4B42B
    %AICMD0x0D($FF, $00, $10, $02)                             ;B4B42F
    %AICMD0x12_Jump(pAIScripting0x26_L182)                                   ;B4B434
pAIScripting0x26_L183:
    %AICMD0x1A($0110, $0108, aAIScriptingData_L071, $03)                     ;B4B437
    %AICMD0x0C_WaitForScriptFlag($09)                                            ;B4B43F
    %AICMD0x13_Wait(200)                                       ;B4B441
pAIScripting0x26_L184:
    %AICMD0x1B($02E7, $00)                                     ;B4B444
    %AICMD0x13_Wait(10)                                        ;B4B448
    %AICMD0x1B($02E5, $00)                                     ;B4B44B
    %AICMD0x13_Wait(10)                                        ;B4B44F
    %AICMD0x1B($02E7, $01)                                     ;B4B452
    %AICMD0x13_Wait(10)                                        ;B4B456
    %AICMD0x1B($02E3, $00)                                     ;B4B459
    %AICMD0x13_Wait(10)                                        ;B4B45D
    %AICMD0x1B($02E7, $00)                                     ;B4B460
    %AICMD0x13_Wait(50)                                        ;B4B464
    %AICMD0x1B($02E7, $00)                                     ;B4B467
    %AICMD0x0D($01, $00, $20, $02)                             ;B4B46B
    %AICMD0x1B($02E7, $00)                                     ;B4B470
    %AICMD0x0D($FF, $00, $20, $02)                             ;B4B474
    %AICMD0x1B($02E7, $00)                                     ;B4B479
    %AICMD0x0D($01, $00, $10, $02)                             ;B4B47D
    %AICMD0x1B($02E7, $00)                                     ;B4B482
    %AICMD0x0D($FF, $00, $10, $02)                             ;B4B486
    %AICMD0x12_Jump(pAIScripting0x26_L184)                                   ;B4B48B


pAIScripting0x26_Data02:
    %AICMD0x4F_DisableToolUse()                                               ;B4B48E
    %AICMD0x50()                                               ;B4B48F
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $09)       ;B4B490
    %AICMD0x00_SetMusic($08, $B4)                              ;B4B495
    %AICMD0x02_FreezeTime()                                    ;B4B498
    %AICMD0x03_SetHour($07)                                    ;B4B499
    %AICMD0x05_SetTransferPosition(264, 264)                   ;B4B49B
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4B4A0
    %AICMD0x08_EnableAIControl()                               ;B4B4A2
    %AICMD0x19($00E8, $00)                                     ;B4B4A3
    %AICMD0x09_StartScript($01, pAIScripting0x26_L161)                                   ;B4B4A7
    %AICMD0x09_StartScript($02, pAIScripting0x26_L163)                                   ;B4B4AB
    %AICMD0x09_StartScript($03, pAIScripting0x26_L165)                                   ;B4B4AF
    %AICMD0x09_StartScript($04, pAIScripting0x26_L167)                                   ;B4B4B3
    %AICMD0x09_StartScript($05, pAIScripting0x26_L169)                                   ;B4B4B7
    %AICMD0x09_StartScript($06, pAIScripting0x26_L171)                                   ;B4B4BB
    %AICMD0x09_StartScript($08, pAIScripting0x26_L186)                                   ;B4B4BF
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $00, pAIScripting0x26_L003) ;B4B4C3
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $01, pAIScripting0x26_L004) ;B4B4CA
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $02, pAIScripting0x26_L005) ;B4B4D1
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $03, pAIScripting0x26_L006) ;B4B4D8
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $04, pAIScripting0x26_L007) ;B4B4DF
pAIScripting0x26_L185:
    %AICMD0x06_SetDestinationArea(!AREA_DANCINGS2)             ;B4B4E6
    %AICMD0x38_WaitForFadeIn()                                               ;B4B4E8
    %AICMD0x0B_SetScriptFlag($09)                                            ;B4B4E9
    %AICMD0x10_End()                                           ;B4B4EB
pAIScripting0x26_L186:
    %AICMD0x1A($0100, $0108, aAIScriptingData, $02)                     ;B4B4EC
    %AICMD0x0C_WaitForScriptFlag($09)                                            ;B4B4F4
    %AICMD0x13_Wait(200)                                       ;B4B4F6
    %AICMD0x1B($0002, $01)                                     ;B4B4F9
    %AICMD0x13_Wait(50)                                        ;B4B4FD
    %AICMD0x1B($0000, $00)                                     ;B4B500
    %AICMD0x13_Wait(10)                                        ;B4B504
    %AICMD0x1B($0002, $00)                                     ;B4B507
    %AICMD0x13_Wait(10)                                        ;B4B50B
    %AICMD0x1B($0001, $00)                                     ;B4B50E
    %AICMD0x13_Wait(10)                                        ;B4B512
    %AICMD0x1B($0002, $01)                                     ;B4B515
    %AICMD0x13_Wait(10)                                        ;B4B519
    %AICMD0x1B($0002, $01)                                     ;B4B51C
    %AICMD0x0D($FF, $00, $20, $02)                             ;B4B520
    %AICMD0x1B($0002, $01)                                     ;B4B525
    %AICMD0x0D($01, $00, $20, $02)                             ;B4B529
    %AICMD0x1B($0002, $01)                                     ;B4B52E
    %AICMD0x0D($FF, $00, $10, $02)                             ;B4B532
    %AICMD0x1B($0002, $01)                                     ;B4B537
    %AICMD0x0D($01, $00, $10, $02)                             ;B4B53B
    %AICMD0x1B($0002, $01)                                     ;B4B540
    %AICMD0x13_Wait(50)                                        ;B4B544
    %AICMD0x1B($0000, $00)                                     ;B4B547
    %AICMD0x13_Wait(10)                                        ;B4B54B
    %AICMD0x1B($0002, $00)                                     ;B4B54E
    %AICMD0x13_Wait(10)                                        ;B4B552
    %AICMD0x1B($0001, $00)                                     ;B4B555
    %AICMD0x13_Wait(10)                                        ;B4B559
    %AICMD0x1B($0002, $01)                                     ;B4B55C
    %AICMD0x13_Wait(10)                                        ;B4B560
    %AICMD0x1B($0002, $01)                                     ;B4B563
    %AICMD0x0D($FF, $00, $20, $02)                             ;B4B567
    %AICMD0x1B($0002, $01)                                     ;B4B56C
    %AICMD0x0D($01, $00, $20, $02)                             ;B4B570
    %AICMD0x1B($0002, $01)                                     ;B4B575
    %AICMD0x0D($FF, $00, $10, $02)                             ;B4B579
    %AICMD0x1B($0002, $01)                                     ;B4B57E
    %AICMD0x0D($01, $00, $10, $02)                             ;B4B582
    %AICMD0x1B($0002, $01)                                     ;B4B587
    %AICMD0x13_Wait(50)                                        ;B4B58B
    %AICMD0x1B($0000, $00)                                     ;B4B58E
    %AICMD0x13_Wait(10)                                        ;B4B592
    %AICMD0x1B($0002, $00)                                     ;B4B595
    %AICMD0x13_Wait(10)                                        ;B4B599
    %AICMD0x1B($0001, $00)                                     ;B4B59C
    %AICMD0x13_Wait(10)                                        ;B4B5A0
    %AICMD0x1B($0002, $01)                                     ;B4B5A3
    %AICMD0x13_Wait(10)                                        ;B4B5A7
    %AICMD0x1B($0002, $01)                                     ;B4B5AA
    %AICMD0x0D($FF, $00, $20, $02)                             ;B4B5AE
    %AICMD0x1B($0002, $01)                                     ;B4B5B3
    %AICMD0x0D($01, $00, $20, $02)                             ;B4B5B7
    %AICMD0x1B($0002, $01)                                     ;B4B5BC
    %AICMD0x0D($FF, $00, $10, $02)                             ;B4B5C0
    %AICMD0x1B($0002, $01)                                     ;B4B5C5
    %AICMD0x0D($01, $00, $10, $02)                             ;B4B5C9
    %AICMD0x1B($0002, $01)                                     ;B4B5CE
    %AICMD0x13_Wait(50)                                        ;B4B5D2
    %AICMD0x1B($0000, $00)                                     ;B4B5D5
    %AICMD0x13_Wait(10)                                        ;B4B5D9
    %AICMD0x1B($0002, $00)                                     ;B4B5DC
    %AICMD0x13_Wait(10)                                        ;B4B5E0
    %AICMD0x1B($0001, $00)                                     ;B4B5E3
    %AICMD0x13_Wait(10)                                        ;B4B5E7
    %AICMD0x1B($0002, $01)                                     ;B4B5EA
    %AICMD0x13_Wait(10)                                        ;B4B5EE
    %AICMD0x1B($0002, $01)                                     ;B4B5F1
    %AICMD0x0D($FF, $00, $20, $02)                             ;B4B5F5
    %AICMD0x1B($0002, $01)                                     ;B4B5FA
    %AICMD0x0D($01, $00, $20, $02)                             ;B4B5FE
    %AICMD0x1B($0002, $01)                                     ;B4B603
    %AICMD0x0D($FF, $00, $10, $02)                             ;B4B607
    %AICMD0x1B($0002, $01)                                     ;B4B60C
    %AICMD0x0D($01, $00, $10, $02)                             ;B4B610
    %AICMD0x1B($0002, $01)                                     ;B4B615
    %AICMD0x13_Wait(50)                                        ;B4B619
    %AICMD0x1B($0000, $00)                                     ;B4B61C
    %AICMD0x13_Wait(10)                                        ;B4B620
    %AICMD0x1B($0002, $00)                                     ;B4B623
    %AICMD0x13_Wait(10)                                        ;B4B627
    %AICMD0x1B($0001, $00)                                     ;B4B62A
    %AICMD0x13_Wait(10)                                        ;B4B62E
    %AICMD0x1B($0002, $01)                                     ;B4B631
    %AICMD0x13_Wait(10)                                        ;B4B635
    %AICMD0x1B($0002, $01)                                     ;B4B638
    %AICMD0x0D($FF, $00, $20, $02)                             ;B4B63C
    %AICMD0x1B($0002, $01)                                     ;B4B641
    %AICMD0x0D($01, $00, $20, $02)                             ;B4B645
    %AICMD0x1B($0002, $01)                                     ;B4B64A
    %AICMD0x0D($FF, $00, $10, $02)                             ;B4B64E
    %AICMD0x1B($0002, $01)                                     ;B4B653
    %AICMD0x0D($01, $00, $10, $02)                             ;B4B657
    %AICMD0x3C()                                               ;B4B65C
    %AICMD0x10_End()                                           ;B4B65D
