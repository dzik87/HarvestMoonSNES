

    incsrc "../../../../build/gen/ai/slots_04.asm"
 
pAIScripting0x04_Data01:
 
    %AICMD0x11_EnableUserControl()                             ;B3C527
    %AICMD0x09_StartScript($01, pAIScripting0x04_L004)                                   ;B3C528
    %AICMD0x09_StartScript($02, pAIScripting0x04_L012)                                   ;B3C52C
    %AICMD0x12_Jump(pAIScripting0x04_L002)                                   ;B3C530
pAIScripting0x04_L001:
    %AICMD0x13_Wait(1)                                         ;B3C533
    %AICMD0x12_Jump(pAIScripting0x04_L001)                                   ;B3C536
pAIScripting0x04_L002:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $00, pAIScripting0x04_L003)   ;B3C539
    %AICMD0x14_JumpIfFlagSet(strcFlags.event4, $0C, pAIScripting0x04_L003)   ;B3C540
    %AICMD0x09_StartScript($03, pAIScripting0x04_L021)                                   ;B3C547
pAIScripting0x04_L003:
    %AICMD0x12_Jump(pAIScripting0x04_L001)                                   ;B3C54B
pAIScripting0x04_L004:
    %AICMD0x1A($00C8, $0078, aAIScriptingData_L044, $00)                     ;B3C54E
pAIScripting0x04_L005:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x04_L006)                                        ;B3C556
    %AICMD0x2D_JumpOnInteract(pAIScripting0x04_L009, pAIScripting0x04_L007)                               ;B3C559
    %AICMD0x12_Jump(pAIScripting0x04_L005)                                   ;B3C55E
pAIScripting0x04_L006:
    %AICMD0x1C_ShowDialog($01C9, $00)                          ;B3C561
    %AICMD0x12_Jump(pAIScripting0x04_L005)                                   ;B3C565
pAIScripting0x04_L007:
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 9, 12, pAIScripting0x04_L008)         ;B3C568
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3C570
    %AICMD0x12_Jump(pAIScripting0x04_L005)                                   ;B3C574
pAIScripting0x04_L008:
    %AICMD0x1C_ShowDialog($03B8, $00)                          ;B3C577
    %AICMD0x12_Jump(pAIScripting0x04_L005)                                   ;B3C57B
pAIScripting0x04_L009:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event4, $0C, pAIScripting0x04_L011)   ;B3C57E
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 2, pAIScripting0x04_L010)     ;B3C585
    %AICMD0x1C_ShowDialog($0039, $00)                          ;B3C58C
    %AICMD0x12_Jump(pAIScripting0x04_L005)                                   ;B3C590
pAIScripting0x04_L010:
    %AICMD0x1C_ShowDialog($03BE, $00)                          ;B3C593
    %AICMD0x12_Jump(pAIScripting0x04_L005)                                   ;B3C597
pAIScripting0x04_L011:
    %AICMD0x1C_ShowDialog($01CD, $00)                          ;B3C59A
    %AICMD0x12_Jump(pAIScripting0x04_L005)                                   ;B3C59E
pAIScripting0x04_L012:
    %AICMD0x1A($0188, $00A0, aAIScriptingData_L063, $00)                     ;B3C5A1
pAIScripting0x04_L013:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x04_L014)                                        ;B3C5A9
    %AICMD0x2D_JumpOnInteract(pAIScripting0x04_L017, pAIScripting0x04_L015)                               ;B3C5AC
    %AICMD0x12_Jump(pAIScripting0x04_L013)                                   ;B3C5B1
pAIScripting0x04_L014:
    %AICMD0x1C_ShowDialog($01C6, $00)                          ;B3C5B4
    %AICMD0x12_Jump(pAIScripting0x04_L013)                                   ;B3C5B8
pAIScripting0x04_L015:
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 9, 12, pAIScripting0x04_L016)         ;B3C5BB
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3C5C3
    %AICMD0x12_Jump(pAIScripting0x04_L013)                                   ;B3C5C7
pAIScripting0x04_L016:
    %AICMD0x1C_ShowDialog($03B9, $00)                          ;B3C5CA
    %AICMD0x12_Jump(pAIScripting0x04_L013)                                   ;B3C5CE
pAIScripting0x04_L017:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event4, $0C, pAIScripting0x04_L020)   ;B3C5D1
    %AICMD0x16_JumpIfBetween8(nCurrentSeasonID, 0, 1, pAIScripting0x04_L018) ;B3C5D8
    %AICMD0x16_JumpIfBetween8(nCurrentSeasonID, 2, 3, pAIScripting0x04_L019) ;B3C5E0
    %AICMD0x12_Jump(pAIScripting0x04_L013)                                   ;B3C5E8
pAIScripting0x04_L018:
    %AICMD0x1C_ShowDialog($003E, $00)                          ;B3C5EB
    %AICMD0x12_Jump(pAIScripting0x04_L013)                                   ;B3C5EF
pAIScripting0x04_L019:
    %AICMD0x1C_ShowDialog($003F, $00)                          ;B3C5F2
    %AICMD0x12_Jump(pAIScripting0x04_L013)                                   ;B3C5F6
pAIScripting0x04_L020:
    %AICMD0x1C_ShowDialog($01CE, $00)                          ;B3C5F9
    %AICMD0x12_Jump(pAIScripting0x04_L013)                                   ;B3C5FD
pAIScripting0x04_L021:
    %AICMD0x1A($0048, $0198, aAIScriptingData_L011, $00)                     ;B3C600
pAIScripting0x04_L022:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x04_L023)                                        ;B3C608
    %AICMD0x2D_JumpOnInteract(pAIScripting0x04_L031, pAIScripting0x04_L025)                               ;B3C60B
    %AICMD0x12_Jump(pAIScripting0x04_L022)                                   ;B3C610
pAIScripting0x04_L023:
    %AICMD0x45_JumpIfBetween16(nLove_Maria, 0, 249, pAIScripting0x04_L024)   ;B3C613
    %AICMD0x1C_ShowDialog($043D, $00)                          ;B3C61D
    %AICMD0x12_Jump(pAIScripting0x04_L022)                                   ;B3C621
pAIScripting0x04_L024:
    %AICMD0x1C_ShowDialog($0174, $00)                          ;B3C624
    %AICMD0x12_Jump(pAIScripting0x04_L022)                                   ;B3C628
pAIScripting0x04_L025:
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 2, pAIScripting0x04_L026)              ;B3C62B
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 6, pAIScripting0x04_L028)              ;B3C632
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 1, 7, pAIScripting0x04_L028)          ;B3C639
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 25, pAIScripting0x04_L027)             ;B3C641
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 73, pAIScripting0x04_L027)             ;B3C648
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 16, 23, pAIScripting0x04_L029)        ;B3C64F
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 9, 12, pAIScripting0x04_L030)         ;B3C657
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3C65F
    %AICMD0x12_Jump(pAIScripting0x04_L022)                                   ;B3C663
pAIScripting0x04_L026:
    %AICMD0x1C_ShowDialog($03B0, $00)                          ;B3C666
    %AICMD0x41_AddValue16(nLove_Maria, -8)                     ;B3C66A
    %AICMD0x12_Jump(pAIScripting0x04_L022)                                   ;B3C670
pAIScripting0x04_L027:
    %AICMD0x1C_ShowDialog($0212, $00)                          ;B3C673
    %AICMD0x41_AddValue16(nLove_Maria, 4)                      ;B3C677
    %AICMD0x12_Jump(pAIScripting0x04_L022)                                   ;B3C67D
pAIScripting0x04_L028:
    %AICMD0x1C_ShowDialog($03B5, $00)                          ;B3C680
    %AICMD0x41_AddValue16(nLove_Maria, 3)                      ;B3C684
    %AICMD0x12_Jump(pAIScripting0x04_L022)                                   ;B3C68A
pAIScripting0x04_L029:
    %AICMD0x1C_ShowDialog($03B2, $00)                          ;B3C68D
    %AICMD0x41_AddValue16(nLove_Maria, 5)                      ;B3C691
    %AICMD0x12_Jump(pAIScripting0x04_L022)                                   ;B3C697
pAIScripting0x04_L030:
    %AICMD0x1C_ShowDialog($01D9, $00)                          ;B3C69A
    %AICMD0x41_AddValue16(nLove_Maria, -2)                     ;B3C69E
    %AICMD0x12_Jump(pAIScripting0x04_L022)                                   ;B3C6A4
pAIScripting0x04_L031:
    %AICMD0x1C_ShowDialog($0091, $00)                          ;B3C6A7
    %AICMD0x12_Jump(pAIScripting0x04_L022)                                   ;B3C6AB


pAIScripting0x04_Data02:
 
    %AICMD0x11_EnableUserControl()                             ;B3C6AE
    %AICMD0x09_StartScript($01, pAIScripting0x04_L033)                                   ;B3C6AF
pAIScripting0x04_L032:
    %AICMD0x13_Wait(1)                                         ;B3C6B3
    %AICMD0x12_Jump(pAIScripting0x04_L032)                                   ;B3C6B6
pAIScripting0x04_L033:
    %AICMD0x1A($0068, $00E8, aAIScriptingData_L051, $00)                     ;B3C6B9
pAIScripting0x04_L034:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x04_L035)                                        ;B3C6C1
    %AICMD0x2D_JumpOnInteract(pAIScripting0x04_L038, pAIScripting0x04_L036)                               ;B3C6C4
    %AICMD0x12_Jump(pAIScripting0x04_L034)                                   ;B3C6C9
pAIScripting0x04_L035:
    %AICMD0x1C_ShowDialog($01E0, $00)                          ;B3C6CC
    %AICMD0x12_Jump(pAIScripting0x04_L034)                                   ;B3C6D0
pAIScripting0x04_L036:
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 9, 12, pAIScripting0x04_L037)         ;B3C6D3
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3C6DB
    %AICMD0x12_Jump(pAIScripting0x04_L034)                                   ;B3C6DF
pAIScripting0x04_L037:
    %AICMD0x1C_ShowDialog($03B0, $00)                          ;B3C6E2
    %AICMD0x12_Jump(pAIScripting0x04_L034)                                   ;B3C6E6
pAIScripting0x04_L038:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event4, $0C, pAIScripting0x04_L039)   ;B3C6E9
    %AICMD0x1C_ShowDialog($005B, $00)                          ;B3C6F0
    %AICMD0x12_Jump(pAIScripting0x04_L034)                                   ;B3C6F4
pAIScripting0x04_L039:
    %AICMD0x1C_ShowDialog($01CF, $00)                          ;B3C6F7
    %AICMD0x12_Jump(pAIScripting0x04_L034)                                   ;B3C6FB


pAIScripting0x04_Data03:
 
    %AICMD0x11_EnableUserControl()                             ;B3C6FE
    %AICMD0x09_StartScript($01, pAIScripting0x04_L043)                                   ;B3C6FF
    %AICMD0x12_Jump(pAIScripting0x04_L041)                                   ;B3C703
pAIScripting0x04_L040:
    %AICMD0x13_Wait(1)                                         ;B3C706
    %AICMD0x12_Jump(pAIScripting0x04_L040)                                   ;B3C709
pAIScripting0x04_L041:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, pAIScripting0x04_L042)   ;B3C70C
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $00, pAIScripting0x04_L042)   ;B3C713
    %AICMD0x09_StartScript($02, pAIScripting0x04_L049)                                   ;B3C71A
pAIScripting0x04_L042:
    %AICMD0x12_Jump(pAIScripting0x04_L040)                                   ;B3C71E
pAIScripting0x04_L043:
    %AICMD0x1A($0028, $0168, aAIScriptingData_L064, $02)                     ;B3C721
pAIScripting0x04_L044:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x04_L045)                                        ;B3C729
    %AICMD0x2D_JumpOnInteract(pAIScripting0x04_L048, pAIScripting0x04_L046)                               ;B3C72C
    %AICMD0x12_Jump(pAIScripting0x04_L044)                                   ;B3C731
pAIScripting0x04_L045:
    %AICMD0x1C_ShowDialog($01C6, $00)                          ;B3C734
    %AICMD0x12_Jump(pAIScripting0x04_L044)                                   ;B3C738
pAIScripting0x04_L046:
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 9, 12, pAIScripting0x04_L047)         ;B3C73B
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3C743
    %AICMD0x12_Jump(pAIScripting0x04_L044)                                   ;B3C747
pAIScripting0x04_L047:
    %AICMD0x1C_ShowDialog($03B9, $00)                          ;B3C74A
    %AICMD0x12_Jump(pAIScripting0x04_L044)                                   ;B3C74E
pAIScripting0x04_L048:
    %AICMD0x1C_ShowDialog($004B, $00)                          ;B3C751
    %AICMD0x12_Jump(pAIScripting0x04_L044)                                   ;B3C755
pAIScripting0x04_L049:
    %AICMD0x1A($0058, $00B0, aAIScriptingData_L019, $00)                     ;B3C758
    %AICMD0x12_Jump(pAIScripting0x04_L050)                                   ;B3C760
pAIScripting0x04_L050:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x04_L051)                                        ;B3C763
    %AICMD0x2D_JumpOnInteract(pAIScripting0x04_L059, pAIScripting0x04_L053)                               ;B3C766
    %AICMD0x12_Jump(pAIScripting0x04_L050)                                   ;B3C76B
pAIScripting0x04_L051:
    %AICMD0x45_JumpIfBetween16(nLove_Nina, 0, 249, pAIScripting0x04_L052)    ;B3C76E
    %AICMD0x1C_ShowDialog($043F, $00)                          ;B3C778
    %AICMD0x12_Jump(pAIScripting0x04_L050)                                   ;B3C77C
pAIScripting0x04_L052:
    %AICMD0x1C_ShowDialog($0178, $00)                          ;B3C77F
    %AICMD0x12_Jump(pAIScripting0x04_L050)                                   ;B3C783
pAIScripting0x04_L053:
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 2, pAIScripting0x04_L057)              ;B3C786
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 5, pAIScripting0x04_L055)              ;B3C78D
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 6, pAIScripting0x04_L055)              ;B3C794
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 1, 7, pAIScripting0x04_L054)          ;B3C79B
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 16, 23, pAIScripting0x04_L054)        ;B3C7A3
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 24, pAIScripting0x04_L056)             ;B3C7AB
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 25, pAIScripting0x04_L058)             ;B3C7B2
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 9, 12, pAIScripting0x04_L057)         ;B3C7B9
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3C7C1
    %AICMD0x12_Jump(pAIScripting0x04_L050)                                   ;B3C7C5
pAIScripting0x04_L054:
    %AICMD0x1C_ShowDialog($03B2, $00)                          ;B3C7C8
    %AICMD0x41_AddValue16(nLove_Nina, 2)                       ;B3C7CC
    %AICMD0x12_Jump(pAIScripting0x04_L050)                                   ;B3C7D2
pAIScripting0x04_L055:
    %AICMD0x1C_ShowDialog($0212, $00)                          ;B3C7D5
    %AICMD0x41_AddValue16(nLove_Nina, 8)                       ;B3C7D9
    %AICMD0x12_Jump(pAIScripting0x04_L050)                                   ;B3C7DF
pAIScripting0x04_L056:
    %AICMD0x1C_ShowDialog($03B1, $00)                          ;B3C7E2
    %AICMD0x41_AddValue16(nLove_Nina, -6)                      ;B3C7E6
    %AICMD0x12_Jump(pAIScripting0x04_L050)                                   ;B3C7EC
pAIScripting0x04_L057:
    %AICMD0x1C_ShowDialog($01D9, $00)                          ;B3C7EF
    %AICMD0x41_AddValue16(nLove_Nina, -4)                      ;B3C7F3
    %AICMD0x12_Jump(pAIScripting0x04_L050)                                   ;B3C7F9
pAIScripting0x04_L058:
    %AICMD0x1C_ShowDialog($0143, $00)                          ;B3C7FC
    %AICMD0x41_AddValue16(nLove_Nina, 4)                       ;B3C800
    %AICMD0x12_Jump(pAIScripting0x04_L050)                                   ;B3C806
pAIScripting0x04_L059:
    %AICMD0x1C_ShowDialog($00C0, $00)                          ;B3C809
    %AICMD0x12_Jump(pAIScripting0x04_L050)                                   ;B3C80D


pAIScripting0x04_Data04:
 
    %AICMD0x11_EnableUserControl()                             ;B3C810
    %AICMD0x09_StartScript($01, pAIScripting0x04_L063)                                   ;B3C811
    %AICMD0x12_Jump(pAIScripting0x04_L061)                                   ;B3C815
pAIScripting0x04_L060:
    %AICMD0x13_Wait(1)                                         ;B3C818
    %AICMD0x12_Jump(pAIScripting0x04_L060)                                   ;B3C81B
pAIScripting0x04_L061:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $01, pAIScripting0x04_L062)   ;B3C81E
    %AICMD0x09_StartScript($02, pAIScripting0x04_L070)                                   ;B3C825
pAIScripting0x04_L062:
    %AICMD0x12_Jump(pAIScripting0x04_L060)                                   ;B3C829
pAIScripting0x04_L063:
    %AICMD0x1A($0028, $0168, aAIScriptingData_L046, $02)                     ;B3C82C
pAIScripting0x04_L064:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x04_L065)                                        ;B3C834
    %AICMD0x2D_JumpOnInteract(pAIScripting0x04_L068, pAIScripting0x04_L066)                               ;B3C837
    %AICMD0x12_Jump(pAIScripting0x04_L064)                                   ;B3C83C
pAIScripting0x04_L065:
    %AICMD0x1C_ShowDialog($01CA, $00)                          ;B3C83F
    %AICMD0x12_Jump(pAIScripting0x04_L064)                                   ;B3C843
pAIScripting0x04_L066:
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 9, 12, pAIScripting0x04_L067)         ;B3C846
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3C84E
    %AICMD0x12_Jump(pAIScripting0x04_L064)                                   ;B3C852
pAIScripting0x04_L067:
    %AICMD0x1C_ShowDialog($0049, $00)                          ;B3C855
    %AICMD0x12_Jump(pAIScripting0x04_L064)                                   ;B3C859
pAIScripting0x04_L068:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event4, $0E, pAIScripting0x04_L069)   ;B3C85C
    %AICMD0x1C_ShowDialog($0079, $00)                          ;B3C863
    %AICMD0x12_Jump(pAIScripting0x04_L064)                                   ;B3C867
pAIScripting0x04_L069:
    %AICMD0x1C_ShowDialog($01DC, $00)                          ;B3C86A
    %AICMD0x12_Jump(pAIScripting0x04_L064)                                   ;B3C86E
pAIScripting0x04_L070:
    %AICMD0x1A($00B8, $0098, aAIScriptingData_L015, $00)                     ;B3C871
    %AICMD0x22($20, $18, $01, aAIScriptingData_L016, $10)                    ;B3C879
    %AICMD0x12_Jump(pAIScripting0x04_L071)                                   ;B3C880
pAIScripting0x04_L071:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x04_L072)                                        ;B3C883
    %AICMD0x2D_JumpOnInteract(pAIScripting0x04_L079, pAIScripting0x04_L074)                               ;B3C886
    %AICMD0x12_Jump(pAIScripting0x04_L071)                                   ;B3C88B
pAIScripting0x04_L072:
    %AICMD0x45_JumpIfBetween16(nLove_Ann, 0, 249, pAIScripting0x04_L073)     ;B3C88E
    %AICMD0x1C_ShowDialog($043E, $00)                          ;B3C898
    %AICMD0x12_Jump(pAIScripting0x04_L071)                                   ;B3C89C
pAIScripting0x04_L073:
    %AICMD0x1C_ShowDialog($0176, $00)                          ;B3C89F
    %AICMD0x12_Jump(pAIScripting0x04_L071)                                   ;B3C8A3
pAIScripting0x04_L074:
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 2, pAIScripting0x04_L075)              ;B3C8A6
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 1, 7, pAIScripting0x04_L076)          ;B3C8AD
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 16, 23, pAIScripting0x04_L076)        ;B3C8B5
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 6, pAIScripting0x04_L076)              ;B3C8BD
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 25, pAIScripting0x04_L077)             ;B3C8C4
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 73, pAIScripting0x04_L077)             ;B3C8CB
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 9, 12, pAIScripting0x04_L078)         ;B3C8D2
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3C8DA
    %AICMD0x12_Jump(pAIScripting0x04_L071)                                   ;B3C8DE
pAIScripting0x04_L075:
    %AICMD0x1C_ShowDialog($03B4, $00)                          ;B3C8E1
    %AICMD0x41_AddValue16(nLove_Ann, -8)                       ;B3C8E5
    %AICMD0x12_Jump(pAIScripting0x04_L071)                                   ;B3C8EB
pAIScripting0x04_L076:
    %AICMD0x1C_ShowDialog($03B2, $00)                          ;B3C8EE
    %AICMD0x41_AddValue16(nLove_Ann, 6)                        ;B3C8F2
    %AICMD0x12_Jump(pAIScripting0x04_L071)                                   ;B3C8F8
pAIScripting0x04_L077:
    %AICMD0x1C_ShowDialog($0212, $00)                          ;B3C8FB
    %AICMD0x41_AddValue16(nLove_Ann, 2)                        ;B3C8FF
    %AICMD0x12_Jump(pAIScripting0x04_L071)                                   ;B3C905
pAIScripting0x04_L078:
    %AICMD0x1C_ShowDialog($03B4, $00)                          ;B3C908
    %AICMD0x41_AddValue16(nLove_Ann, -2)                       ;B3C90C
    %AICMD0x12_Jump(pAIScripting0x04_L071)                                   ;B3C912
pAIScripting0x04_L079:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event4, $0E, pAIScripting0x04_L080)   ;B3C915
    %AICMD0x1C_ShowDialog($00A9, $00)                          ;B3C91C
    %AICMD0x12_Jump(pAIScripting0x04_L071)                                   ;B3C920
pAIScripting0x04_L080:
    %AICMD0x1C_ShowDialog($01DE, $00)                          ;B3C923
    %AICMD0x12_Jump(pAIScripting0x04_L071)                                   ;B3C927


pAIScripting0x04_Data05:
 
    %AICMD0x11_EnableUserControl()                             ;B3C92A
    %AICMD0x09_StartScript($01, pAIScripting0x04_L086)                                   ;B3C92B
    %AICMD0x09_StartScript($02, pAIScripting0x04_L093)                                   ;B3C92F
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $02, pAIScripting0x04_L082)   ;B3C933
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $03, pAIScripting0x04_L082)   ;B3C93A
    %AICMD0x09_StartScript($04, pAIScripting0x04_L084)                                   ;B3C941
    %AICMD0x12_Jump(pAIScripting0x04_L082)                                   ;B3C945
pAIScripting0x04_L081:
    %AICMD0x13_Wait(1)                                         ;B3C948
    %AICMD0x12_Jump(pAIScripting0x04_L081)                                   ;B3C94B
pAIScripting0x04_L082:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $03, pAIScripting0x04_L083)   ;B3C94E
    %AICMD0x09_StartScript($03, pAIScripting0x04_L097)                                   ;B3C955
pAIScripting0x04_L083:
    %AICMD0x12_Jump(pAIScripting0x04_L081)                                   ;B3C959
pAIScripting0x04_L084:
    %AICMD0x1A($0087, $0097, aAIScriptingData_L091, $00)                     ;B3C95C
pAIScripting0x04_L085:
    %AICMD0x13_Wait(1)                                         ;B3C964
    %AICMD0x12_Jump(pAIScripting0x04_L085)                                   ;B3C967
pAIScripting0x04_L086:
    %AICMD0x1A($0028, $0198, aAIScriptingData_L048, $02)                     ;B3C96A
    %AICMD0x12_Jump(pAIScripting0x04_L087)                                   ;B3C972
pAIScripting0x04_L087:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x04_L088)                                        ;B3C975
    %AICMD0x2D_JumpOnInteract(pAIScripting0x04_L091, pAIScripting0x04_L089)                               ;B3C978
    %AICMD0x12_Jump(pAIScripting0x04_L087)                                   ;B3C97D
pAIScripting0x04_L088:
    %AICMD0x1C_ShowDialog($01C7, $00)                          ;B3C980
    %AICMD0x12_Jump(pAIScripting0x04_L087)                                   ;B3C984
pAIScripting0x04_L089:
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 9, 12, pAIScripting0x04_L090)         ;B3C987
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3C98F
    %AICMD0x12_Jump(pAIScripting0x04_L087)                                   ;B3C993
pAIScripting0x04_L090:
    %AICMD0x1C_ShowDialog($03BB, $00)                          ;B3C996
    %AICMD0x12_Jump(pAIScripting0x04_L087)                                   ;B3C99A
pAIScripting0x04_L091:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $02, pAIScripting0x04_L092)   ;B3C99D
    %AICMD0x1C_ShowDialog($0050, $00)                          ;B3C9A4
    %AICMD0x12_Jump(pAIScripting0x04_L087)                                   ;B3C9A8
pAIScripting0x04_L092:
    %AICMD0x1C_ShowDialog($01ED, $00)                          ;B3C9AB
    %AICMD0x12_Jump(pAIScripting0x04_L087)                                   ;B3C9AF
pAIScripting0x04_L093:
    %AICMD0x1A($0088, $0158, aAIScriptingData_L050, $00)                     ;B3C9B2
pAIScripting0x04_L094:
    %AICMD0x2D_JumpOnInteract(pAIScripting0x04_L096, pAIScripting0x04_L095)                               ;B3C9BA
    %AICMD0x12_Jump(pAIScripting0x04_L094)                                   ;B3C9BF
pAIScripting0x04_L095:
    %AICMD0x1C_ShowDialog($03BC, $00)                          ;B3C9C2
    %AICMD0x12_Jump(pAIScripting0x04_L094)                                   ;B3C9C6
pAIScripting0x04_L096:
    %AICMD0x1C_ShowDialog($0054, $02)                          ;B3C9C9
    %AICMD0x1C_ShowDialog($0055, $01)                          ;B3C9CD
    %AICMD0x12_Jump(pAIScripting0x04_L094)                                   ;B3C9D1
pAIScripting0x04_L097:
    %AICMD0x1A($0058, $01B8, aAIScriptingData_L021, $00)                     ;B3C9D4
pAIScripting0x04_L098:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x04_L099)                                        ;B3C9DC
    %AICMD0x2D_JumpOnInteract(pAIScripting0x04_L107, pAIScripting0x04_L101)                               ;B3C9DF
    %AICMD0x12_Jump(pAIScripting0x04_L098)                                   ;B3C9E4
pAIScripting0x04_L099:
    %AICMD0x45_JumpIfBetween16(nLove_Ellen, 0, 249, pAIScripting0x04_L100)   ;B3C9E7
    %AICMD0x1C_ShowDialog($0440, $00)                          ;B3C9F1
    %AICMD0x12_Jump(pAIScripting0x04_L098)                                   ;B3C9F5
pAIScripting0x04_L100:
    %AICMD0x1C_ShowDialog($017A, $00)                          ;B3C9F8
    %AICMD0x12_Jump(pAIScripting0x04_L098)                                   ;B3C9FC
pAIScripting0x04_L101:
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 2, pAIScripting0x04_L102)              ;B3C9FF
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 1, 5, pAIScripting0x04_L103)          ;B3CA06
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 7, pAIScripting0x04_L103)              ;B3CA0E
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 25, pAIScripting0x04_L105)             ;B3CA15
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 73, pAIScripting0x04_L105)             ;B3CA1C
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 16, 19, pAIScripting0x04_L103)        ;B3CA23
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 20, 23, pAIScripting0x04_L104)        ;B3CA2B
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 9, 12, pAIScripting0x04_L106)         ;B3CA33
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3CA3B
    %AICMD0x12_Jump(pAIScripting0x04_L098)                                   ;B3CA3F
pAIScripting0x04_L102:
    %AICMD0x1C_ShowDialog($03B0, $00)                          ;B3CA42
    %AICMD0x41_AddValue16(nLove_Ellen, -8)                     ;B3CA46
    %AICMD0x12_Jump(pAIScripting0x04_L098)                                   ;B3CA4C
pAIScripting0x04_L103:
    %AICMD0x1C_ShowDialog($03B2, $00)                          ;B3CA4F
    %AICMD0x41_AddValue16(nLove_Ellen, 6)                      ;B3CA53
    %AICMD0x12_Jump(pAIScripting0x04_L098)                                   ;B3CA59
pAIScripting0x04_L104:
    %AICMD0x1C_ShowDialog($03B3, $00)                          ;B3CA5C
    %AICMD0x41_AddValue16(nLove_Ellen, 8)                      ;B3CA60
    %AICMD0x12_Jump(pAIScripting0x04_L098)                                   ;B3CA66
pAIScripting0x04_L105:
    %AICMD0x1C_ShowDialog($0212, $00)                          ;B3CA69
    %AICMD0x41_AddValue16(nLove_Ellen, 5)                      ;B3CA6D
    %AICMD0x12_Jump(pAIScripting0x04_L098)                                   ;B3CA73
pAIScripting0x04_L106:
    %AICMD0x1C_ShowDialog($01DA, $00)                          ;B3CA76
    %AICMD0x41_AddValue16(nLove_Ellen, -2)                     ;B3CA7A
    %AICMD0x12_Jump(pAIScripting0x04_L098)                                   ;B3CA80
pAIScripting0x04_L107:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $02, pAIScripting0x04_L108)   ;B3CA83
    %AICMD0x1C_ShowDialog($00D5, $00)                          ;B3CA8A
    %AICMD0x12_Jump(pAIScripting0x04_L098)                                   ;B3CA8E
pAIScripting0x04_L108:
    %AICMD0x1C_ShowDialog($01EE, $00)                          ;B3CA91
    %AICMD0x12_Jump(pAIScripting0x04_L098)                                   ;B3CA95


pAIScripting0x04_Data06:
 
    %AICMD0x09_StartScript($01, pAIScripting0x04_L110)                                   ;B3CA98
    %AICMD0x09_StartScript($02, pAIScripting0x04_L120)                                   ;B3CA9C
pAIScripting0x04_L109:
    %AICMD0x13_Wait(1)                                         ;B3CAA0
    %AICMD0x12_Jump(pAIScripting0x04_L109)                                   ;B3CAA3
pAIScripting0x04_L110:
    %AICMD0x1A($0088, $0050, aAIScriptingData_L042, $00)                     ;B3CAA6
pAIScripting0x04_L111:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x04_L112)                                        ;B3CAAE
    %AICMD0x2D_JumpOnInteract(pAIScripting0x04_L115, pAIScripting0x04_L113)                               ;B3CAB1
    %AICMD0x12_Jump(pAIScripting0x04_L111)                                   ;B3CAB6
pAIScripting0x04_L112:
    %AICMD0x1C_ShowDialog($01CA, $00)                          ;B3CAB9
    %AICMD0x1B($0288, $00)                                     ;B3CABD
    %AICMD0x12_Jump(pAIScripting0x04_L111)                                   ;B3CAC1
pAIScripting0x04_L113:
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 9, 12, pAIScripting0x04_L114)         ;B3CAC4
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3CACC
    %AICMD0x12_Jump(pAIScripting0x04_L111)                                   ;B3CAD0
pAIScripting0x04_L114:
    %AICMD0x1C_ShowDialog($03BB, $00)                          ;B3CAD3
    %AICMD0x12_Jump(pAIScripting0x04_L111)                                   ;B3CAD7
pAIScripting0x04_L115:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event4, $0C, pAIScripting0x04_L116)   ;B3CADA
    %AICMD0x14_JumpIfFlagSet(strcFlags.event4, $0E, pAIScripting0x04_L117)   ;B3CAE1
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $00, pAIScripting0x04_L118)   ;B3CAE8
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $02, pAIScripting0x04_L119)   ;B3CAEF
    %AICMD0x1C_ShowDialog($0062, $00)                          ;B3CAF6
    %AICMD0x12_Jump(pAIScripting0x04_L111)                                   ;B3CAFA
pAIScripting0x04_L116:
    %AICMD0x1C_ShowDialog($01D1, $00)                          ;B3CAFD
    %AICMD0x1B($0288, $00)                                     ;B3CB01
    %AICMD0x12_Jump(pAIScripting0x04_L111)                                   ;B3CB05
pAIScripting0x04_L117:
    %AICMD0x1C_ShowDialog($01DD, $00)                          ;B3CB08
    %AICMD0x1B($0288, $00)                                     ;B3CB0C
    %AICMD0x12_Jump(pAIScripting0x04_L111)                                   ;B3CB10
pAIScripting0x04_L118:
    %AICMD0x1C_ShowDialog($01E6, $00)                          ;B3CB13
    %AICMD0x1B($0288, $00)                                     ;B3CB17
    %AICMD0x12_Jump(pAIScripting0x04_L111)                                   ;B3CB1B
pAIScripting0x04_L119:
    %AICMD0x1C_ShowDialog($01EF, $00)                          ;B3CB1E
    %AICMD0x1B($0288, $00)                                     ;B3CB22
    %AICMD0x12_Jump(pAIScripting0x04_L111)                                   ;B3CB26
pAIScripting0x04_L120:
    %AICMD0x1A($0038, $0098, aAIScriptingData_L056, $00)                     ;B3CB29
pAIScripting0x04_L121:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x04_L122)                                        ;B3CB31
    %AICMD0x2D_JumpOnInteract(pAIScripting0x04_L125, pAIScripting0x04_L123)                               ;B3CB34
    %AICMD0x12_Jump(pAIScripting0x04_L121)                                   ;B3CB39
pAIScripting0x04_L122:
    %AICMD0x1C_ShowDialog($01CB, $00)                          ;B3CB3C
    %AICMD0x12_Jump(pAIScripting0x04_L121)                                   ;B3CB40
pAIScripting0x04_L123:
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 9, 12, pAIScripting0x04_L124)         ;B3CB43
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3CB4B
    %AICMD0x12_Jump(pAIScripting0x04_L121)                                   ;B3CB4F
pAIScripting0x04_L124:
    %AICMD0x1C_ShowDialog($03BA, $00)                          ;B3CB52
    %AICMD0x12_Jump(pAIScripting0x04_L121)                                   ;B3CB56
pAIScripting0x04_L125:
    %AICMD0x1C_ShowDialog($0068, $00)                          ;B3CB59
    %AICMD0x12_Jump(pAIScripting0x04_L121)                                   ;B3CB5D


pAIScripting0x04_Data07:
 
    %AICMD0x09_StartScript($01, pAIScripting0x04_L127)                                   ;B3CB60
pAIScripting0x04_L126:
    %AICMD0x13_Wait(1)                                         ;B3CB64
    %AICMD0x12_Jump(pAIScripting0x04_L126)                                   ;B3CB67
pAIScripting0x04_L127:
    %AICMD0x1A($00E8, $009C, aAIScriptingData_L053, $03)                     ;B3CB6A
pAIScripting0x04_L128:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x04_L129)                                        ;B3CB72
    %AICMD0x2D_JumpOnInteract(pAIScripting0x04_L132, pAIScripting0x04_L130)                               ;B3CB75
    %AICMD0x12_Jump(pAIScripting0x04_L128)                                   ;B3CB7A
pAIScripting0x04_L129:
    %AICMD0x1C_ShowDialog($01C9, $00)                          ;B3CB7D
    %AICMD0x1B($02AF, $00)                                     ;B3CB81
    %AICMD0x12_Jump(pAIScripting0x04_L128)                                   ;B3CB85
pAIScripting0x04_L130:
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 9, 12, pAIScripting0x04_L131)         ;B3CB88
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3CB90
    %AICMD0x12_Jump(pAIScripting0x04_L128)                                   ;B3CB94
pAIScripting0x04_L131:
    %AICMD0x1C_ShowDialog($03BB, $00)                          ;B3CB97
    %AICMD0x12_Jump(pAIScripting0x04_L128)                                   ;B3CB9B
pAIScripting0x04_L132:
    %AICMD0x1C_ShowDialog($005E, $00)                          ;B3CB9E
    %AICMD0x12_Jump(pAIScripting0x04_L128)                                   ;B3CBA2


pAIScripting0x04_Data08:
    %AICMD0x11_EnableUserControl()                             ;B3CBA5
    %AICMD0x09_StartScript($01, pAIScripting0x04_L140)                                   ;B3CBA6
    %AICMD0x09_StartScript($02, pAIScripting0x04_L134)                                   ;B3CBAA
pAIScripting0x04_L133:
    %AICMD0x13_Wait(1)                                         ;B3CBAE
    %AICMD0x12_Jump(pAIScripting0x04_L133)                                   ;B3CBB1
pAIScripting0x04_L134:
    %AICMD0x1A($0058, $00B8, aAIScriptingData_L027, $00)                     ;B3CBB4
pAIScripting0x04_L135:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x04_L136)                                        ;B3CBBC
    %AICMD0x2D_JumpOnInteract(pAIScripting0x04_L139, pAIScripting0x04_L137)                               ;B3CBBF
    %AICMD0x12_Jump(pAIScripting0x04_L135)                                   ;B3CBC4
pAIScripting0x04_L136:
    %AICMD0x1C_ShowDialog($01C8, $00)                          ;B3CBC7
    %AICMD0x12_Jump(pAIScripting0x04_L135)                                   ;B3CBCB
pAIScripting0x04_L137:
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 9, 12, pAIScripting0x04_L138)         ;B3CBCE
    %AICMD0x1C_ShowDialog($03BC, $00)                          ;B3CBD6
    %AICMD0x12_Jump(pAIScripting0x04_L135)                                   ;B3CBDA
pAIScripting0x04_L138:
    %AICMD0x1C_ShowDialog($03BB, $00)                          ;B3CBDD
    %AICMD0x12_Jump(pAIScripting0x04_L135)                                   ;B3CBE1
pAIScripting0x04_L139:
    %AICMD0x1C_ShowDialog($0150, $00)                          ;B3CBE4
    %AICMD0x12_Jump(pAIScripting0x04_L135)                                   ;B3CBE8
    %AICMD0x10_End()                                           ;B3CBEB
pAIScripting0x04_L140:
    %AICMD0x1A($0098, $0088, aAIScriptingData_L027, $00)                     ;B3CBEC
pAIScripting0x04_L141:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x04_L143)                                        ;B3CBF4
    %AICMD0x2D_JumpOnInteract(pAIScripting0x04_L146, pAIScripting0x04_L144)                               ;B3CBF7
    %AICMD0x12_Jump(pAIScripting0x04_L141)                                   ;B3CBFC
pAIScripting0x04_L142:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x04_L143)                                        ;B3CBFF
    %AICMD0x1F(pAIScripting0x04_L149)                                        ;B3CC02
    %AICMD0x12_Jump(pAIScripting0x04_L142)                                   ;B3CC05
pAIScripting0x04_L143:
    %AICMD0x1C_ShowDialog($01C8, $00)                          ;B3CC08
    %AICMD0x12_Jump(pAIScripting0x04_L141)                                   ;B3CC0C
pAIScripting0x04_L144:
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 9, 12, pAIScripting0x04_L145)         ;B3CC0F
    %AICMD0x1C_ShowDialog($03BC, $00)                          ;B3CC17
    %AICMD0x12_Jump(pAIScripting0x04_L141)                                   ;B3CC1B
pAIScripting0x04_L145:
    %AICMD0x1C_ShowDialog($03BB, $00)                          ;B3CC1E
    %AICMD0x12_Jump(pAIScripting0x04_L141)                                   ;B3CC22
pAIScripting0x04_L146:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $07, pAIScripting0x04_L150)   ;B3CC25
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $05, pAIScripting0x04_L149)   ;B3CC2C
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $06, pAIScripting0x04_L149)   ;B3CC33
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $07, pAIScripting0x04_L149)   ;B3CC3A
    %AICMD0x1D_ShowDialog($0130, $00)                          ;B3CC41
    %AICMD0x20_JumpIfChoice(0, pAIScripting0x04_L147)                        ;B3CC45
    %AICMD0x20_JumpIfChoice(1, pAIScripting0x04_L148)                        ;B3CC49
    %AICMD0x12_Jump(pAIScripting0x04_L141)                                   ;B3CC4D
pAIScripting0x04_L147:
    %AICMD0x23_OrWithIndexedValue(strcFlags.event2, $05)       ;B3CC50
    %AICMD0x1C_ShowDialog($0131, $00)                          ;B3CC55
    %AICMD0x12_Jump(pAIScripting0x04_L142)                                   ;B3CC59
pAIScripting0x04_L148:
    %AICMD0x1C_ShowDialog($0132, $00)                          ;B3CC5C
    %AICMD0x12_Jump(pAIScripting0x04_L141)                                   ;B3CC60
pAIScripting0x04_L149:
    %AICMD0x1C_ShowDialog($0139, $00)                          ;B3CC63
    %AICMD0x12_Jump(pAIScripting0x04_L142)                                   ;B3CC67
pAIScripting0x04_L150:
    %AICMD0x1C_ShowDialog($0133, $00)                          ;B3CC6A
    %AICMD0x12_Jump(pAIScripting0x04_L141)                                   ;B3CC6E
