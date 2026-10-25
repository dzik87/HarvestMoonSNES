

    incsrc "../../../../build/gen/ai/slots_08.asm"
 
pAIScripting0x08_Data01:
 
    %AICMD0x11_EnableUserControl()                             ;B3E0DF
    %AICMD0x09_StartScript($01, pAIScripting0x08_L004)                                   ;B3E0E0
    %AICMD0x12_Jump(pAIScripting0x08_L002)                                   ;B3E0E4
pAIScripting0x08_L001:
    %AICMD0x13_Wait(1)                                         ;B3E0E7
    %AICMD0x12_Jump(pAIScripting0x08_L001)                                   ;B3E0EA
pAIScripting0x08_L002:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $00, pAIScripting0x08_L003)   ;B3E0ED
    %AICMD0x14_JumpIfFlagSet(strcFlags.event4, $0C, pAIScripting0x08_L003)   ;B3E0F4
    %AICMD0x09_StartScript($02, pAIScripting0x08_L009)                                   ;B3E0FB
pAIScripting0x08_L003:
    %AICMD0x12_Jump(pAIScripting0x08_L001)                                   ;B3E0FF
pAIScripting0x08_L004:
    %AICMD0x1A($0188, $00A0, aAIScriptingData_L063, $00)                     ;B3E102
pAIScripting0x08_L005:
    %AICMD0x2D_JumpOnInteract(pAIScripting0x08_L008, pAIScripting0x08_L006)                               ;B3E10A
    %AICMD0x12_Jump(pAIScripting0x08_L005)                                   ;B3E10F
pAIScripting0x08_L006:
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 9, 12, pAIScripting0x08_L007)         ;B3E112
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3E11A
    %AICMD0x12_Jump(pAIScripting0x08_L005)                                   ;B3E11E
pAIScripting0x08_L007:
    %AICMD0x1C_ShowDialog($03B9, $00)                          ;B3E121
    %AICMD0x12_Jump(pAIScripting0x08_L005)                                   ;B3E125
pAIScripting0x08_L008:
    %AICMD0x1C_ShowDialog($0401, $00)                          ;B3E128
    %AICMD0x12_Jump(pAIScripting0x08_L005)                                   ;B3E12C
pAIScripting0x08_L009:
    %AICMD0x1A($0048, $0198, aAIScriptingData_L011, $00)                     ;B3E12F
pAIScripting0x08_L010:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x08_L011)                                        ;B3E137
    %AICMD0x2D_JumpOnInteract(pAIScripting0x08_L013, pAIScripting0x08_L014)                               ;B3E13A
    %AICMD0x12_Jump(pAIScripting0x08_L010)                                   ;B3E13F
pAIScripting0x08_L011:
    %AICMD0x45_JumpIfBetween16(nLove_Maria, 0, 249, pAIScripting0x08_L012)   ;B3E142
    %AICMD0x1C_ShowDialog($043D, $00)                          ;B3E14C
    %AICMD0x12_Jump(pAIScripting0x08_L010)                                   ;B3E150
pAIScripting0x08_L012:
    %AICMD0x1C_ShowDialog($0174, $00)                          ;B3E153
    %AICMD0x12_Jump(pAIScripting0x08_L010)                                   ;B3E157
pAIScripting0x08_L013:
    %AICMD0x1C_ShowDialog($016B, $00)                          ;B3E15A
    %AICMD0x12_Jump(pAIScripting0x08_L010)                                   ;B3E15E
pAIScripting0x08_L014:
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 1, 5, pAIScripting0x08_L017)          ;B3E161
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 16, 23, pAIScripting0x08_L017)        ;B3E169
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 6, pAIScripting0x08_L016)              ;B3E171
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 25, pAIScripting0x08_L015)             ;B3E178
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 73, pAIScripting0x08_L015)             ;B3E17F
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 9, 12, pAIScripting0x08_L018)         ;B3E186
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3E18E
    %AICMD0x12_Jump(pAIScripting0x08_L010)                                   ;B3E192
pAIScripting0x08_L015:
    %AICMD0x1C_ShowDialog($0212, $00)                          ;B3E195
    %AICMD0x41_AddValue16(nLove_Maria, 4)                      ;B3E199
    %AICMD0x12_Jump(pAIScripting0x08_L010)                                   ;B3E19F
pAIScripting0x08_L016:
    %AICMD0x1C_ShowDialog($03B5, $00)                          ;B3E1A2
    %AICMD0x41_AddValue16(nLove_Maria, 3)                      ;B3E1A6
    %AICMD0x12_Jump(pAIScripting0x08_L010)                                   ;B3E1AC
pAIScripting0x08_L017:
    %AICMD0x1C_ShowDialog($03B2, $00)                          ;B3E1AF
    %AICMD0x41_AddValue16(nLove_Maria, 5)                      ;B3E1B3
    %AICMD0x12_Jump(pAIScripting0x08_L010)                                   ;B3E1B9
pAIScripting0x08_L018:
    %AICMD0x1C_ShowDialog($01DA, $00)                          ;B3E1BC
    %AICMD0x41_AddValue16(nLove_Maria, -2)                     ;B3E1C0
    %AICMD0x12_Jump(pAIScripting0x08_L010)                                   ;B3E1C6


pAIScripting0x08_Data02:
 
    %AICMD0x11_EnableUserControl()                             ;B3E1C9
    %AICMD0x09_StartScript($01, pAIScripting0x08_L020)                                   ;B3E1CA
    %AICMD0x09_StartScript($02, pAIScripting0x08_L025)                                   ;B3E1CE
pAIScripting0x08_L019:
    %AICMD0x13_Wait(1)                                         ;B3E1D2
    %AICMD0x12_Jump(pAIScripting0x08_L019)                                   ;B3E1D5
pAIScripting0x08_L020:
    %AICMD0x1A($0068, $00E8, aAIScriptingData_L051, $02)                     ;B3E1D8
pAIScripting0x08_L021:
    %AICMD0x2D_JumpOnInteract(pAIScripting0x08_L024, pAIScripting0x08_L022)                               ;B3E1E0
    %AICMD0x12_Jump(pAIScripting0x08_L021)                                   ;B3E1E5
pAIScripting0x08_L022:
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 9, 12, pAIScripting0x08_L023)         ;B3E1E8
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3E1F0
    %AICMD0x12_Jump(pAIScripting0x08_L021)                                   ;B3E1F4
pAIScripting0x08_L023:
    %AICMD0x1C_ShowDialog($03B0, $00)                          ;B3E1F7
    %AICMD0x12_Jump(pAIScripting0x08_L021)                                   ;B3E1FB
pAIScripting0x08_L024:
    %AICMD0x1C_ShowDialog($0411, $00)                          ;B3E1FE
    %AICMD0x12_Jump(pAIScripting0x08_L021)                                   ;B3E202
pAIScripting0x08_L025:
    %AICMD0x1A($0078, $00E8, aAIScriptingData_L044, $03)                     ;B3E205
pAIScripting0x08_L026:
    %AICMD0x2D_JumpOnInteract(pAIScripting0x08_L029, pAIScripting0x08_L027)                               ;B3E20D
    %AICMD0x12_Jump(pAIScripting0x08_L026)                                   ;B3E212
pAIScripting0x08_L027:
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 9, 12, pAIScripting0x08_L028)         ;B3E215
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3E21D
    %AICMD0x12_Jump(pAIScripting0x08_L026)                                   ;B3E221
pAIScripting0x08_L028:
    %AICMD0x1C_ShowDialog($03B8, $00)                          ;B3E224
    %AICMD0x12_Jump(pAIScripting0x08_L026)                                   ;B3E228
pAIScripting0x08_L029:
    %AICMD0x1C_ShowDialog($016D, $00)                          ;B3E22B
    %AICMD0x12_Jump(pAIScripting0x08_L026)                                   ;B3E22F


pAIScripting0x08_Data03:
 
    %AICMD0x11_EnableUserControl()                             ;B3E232
    %AICMD0x09_StartScript($01, pAIScripting0x08_L033)                                   ;B3E233
    %AICMD0x12_Jump(pAIScripting0x08_L031)                                   ;B3E237
pAIScripting0x08_L030:
    %AICMD0x13_Wait(1)                                         ;B3E23A
    %AICMD0x12_Jump(pAIScripting0x08_L030)                                   ;B3E23D
pAIScripting0x08_L031:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, pAIScripting0x08_L032)   ;B3E240
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $00, pAIScripting0x08_L032)   ;B3E247
    %AICMD0x09_StartScript($02, pAIScripting0x08_L038)                                   ;B3E24E
pAIScripting0x08_L032:
    %AICMD0x12_Jump(pAIScripting0x08_L030)                                   ;B3E252
pAIScripting0x08_L033:
    %AICMD0x1A($0028, $0168, aAIScriptingData_L064, $02)                     ;B3E255
pAIScripting0x08_L034:
    %AICMD0x2D_JumpOnInteract(pAIScripting0x08_L037, pAIScripting0x08_L035)                               ;B3E25D
    %AICMD0x12_Jump(pAIScripting0x08_L034)                                   ;B3E262
pAIScripting0x08_L035:
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 9, 12, pAIScripting0x08_L036)         ;B3E265
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3E26D
    %AICMD0x12_Jump(pAIScripting0x08_L034)                                   ;B3E271
pAIScripting0x08_L036:
    %AICMD0x1C_ShowDialog($03B9, $00)                          ;B3E274
    %AICMD0x12_Jump(pAIScripting0x08_L034)                                   ;B3E278
pAIScripting0x08_L037:
    %AICMD0x1C_ShowDialog($016B, $00)                          ;B3E27B
    %AICMD0x12_Jump(pAIScripting0x08_L034)                                   ;B3E27F
pAIScripting0x08_L038:
    %AICMD0x1A($0058, $00B0, aAIScriptingData_L019, $00)                     ;B3E282
    %AICMD0x12_Jump(pAIScripting0x08_L039)                                   ;B3E28A
pAIScripting0x08_L039:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x08_L040)                                        ;B3E28D
    %AICMD0x2D_JumpOnInteract(pAIScripting0x08_L047, pAIScripting0x08_L042)                               ;B3E290
    %AICMD0x12_Jump(pAIScripting0x08_L039)                                   ;B3E295
pAIScripting0x08_L040:
    %AICMD0x45_JumpIfBetween16(nLove_Nina, 0, 249, pAIScripting0x08_L041)    ;B3E298
    %AICMD0x1C_ShowDialog($043F, $00)                          ;B3E2A2
    %AICMD0x12_Jump(pAIScripting0x08_L039)                                   ;B3E2A6
pAIScripting0x08_L041:
    %AICMD0x1C_ShowDialog($0178, $00)                          ;B3E2A9
    %AICMD0x12_Jump(pAIScripting0x08_L039)                                   ;B3E2AD
pAIScripting0x08_L042:
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 5, pAIScripting0x08_L044)              ;B3E2B0
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 6, pAIScripting0x08_L044)              ;B3E2B7
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 1, 7, pAIScripting0x08_L043)          ;B3E2BE
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 16, 23, pAIScripting0x08_L043)        ;B3E2C6
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 25, pAIScripting0x08_L045)             ;B3E2CE
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 9, 12, pAIScripting0x08_L046)         ;B3E2D5
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3E2DD
    %AICMD0x12_Jump(pAIScripting0x08_L039)                                   ;B3E2E1
pAIScripting0x08_L043:
    %AICMD0x1C_ShowDialog($03B2, $00)                          ;B3E2E4
    %AICMD0x41_AddValue16(nLove_Nina, 2)                       ;B3E2E8
    %AICMD0x12_Jump(pAIScripting0x08_L039)                                   ;B3E2EE
pAIScripting0x08_L044:
    %AICMD0x1C_ShowDialog($0212, $00)                          ;B3E2F1
    %AICMD0x41_AddValue16(nLove_Nina, 8)                       ;B3E2F5
    %AICMD0x12_Jump(pAIScripting0x08_L039)                                   ;B3E2FB
pAIScripting0x08_L045:
    %AICMD0x1C_ShowDialog($03B1, $00)                          ;B3E2FE
    %AICMD0x41_AddValue16(nLove_Nina, -8)                      ;B3E302
    %AICMD0x12_Jump(pAIScripting0x08_L039)                                   ;B3E308
pAIScripting0x08_L046:
    %AICMD0x1C_ShowDialog($03BA, $00)                          ;B3E30B
    %AICMD0x41_AddValue16(nLove_Nina, -2)                      ;B3E30F
    %AICMD0x12_Jump(pAIScripting0x08_L039)                                   ;B3E315
pAIScripting0x08_L047:
    %AICMD0x1C_ShowDialog($0163, $00)                          ;B3E318
    %AICMD0x12_Jump(pAIScripting0x08_L039)                                   ;B3E31C


pAIScripting0x08_Data04:
 
    %AICMD0x11_EnableUserControl()                             ;B3E31F
    %AICMD0x09_StartScript($01, pAIScripting0x08_L051)                                   ;B3E320
    %AICMD0x12_Jump(pAIScripting0x08_L049)                                   ;B3E324
pAIScripting0x08_L048:
    %AICMD0x13_Wait(1)                                         ;B3E327
    %AICMD0x12_Jump(pAIScripting0x08_L048)                                   ;B3E32A
pAIScripting0x08_L049:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $01, pAIScripting0x08_L050)   ;B3E32D
    %AICMD0x09_StartScript($02, pAIScripting0x08_L056)                                   ;B3E334
pAIScripting0x08_L050:
    %AICMD0x12_Jump(pAIScripting0x08_L048)                                   ;B3E338
pAIScripting0x08_L051:
    %AICMD0x1A($0028, $0168, aAIScriptingData_L046, $02)                     ;B3E33B
pAIScripting0x08_L052:
    %AICMD0x2D_JumpOnInteract(pAIScripting0x08_L055, pAIScripting0x08_L053)                               ;B3E343
    %AICMD0x12_Jump(pAIScripting0x08_L052)                                   ;B3E348
pAIScripting0x08_L053:
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 9, 12, pAIScripting0x08_L054)         ;B3E34B
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3E353
    %AICMD0x12_Jump(pAIScripting0x08_L052)                                   ;B3E357
pAIScripting0x08_L054:
    %AICMD0x1C_ShowDialog($0049, $00)                          ;B3E35A
    %AICMD0x12_Jump(pAIScripting0x08_L052)                                   ;B3E35E
pAIScripting0x08_L055:
    %AICMD0x1C_ShowDialog($016F, $00)                          ;B3E361
    %AICMD0x12_Jump(pAIScripting0x08_L052)                                   ;B3E365
pAIScripting0x08_L056:
    %AICMD0x1A($00D8, $00A8, aAIScriptingData_L015, $00)                     ;B3E368
    %AICMD0x22($20, $18, $01, aAIScriptingData_L016, $10)                    ;B3E370
    %AICMD0x12_Jump(pAIScripting0x08_L057)                                   ;B3E377
pAIScripting0x08_L057:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x08_L058)                                        ;B3E37A
    %AICMD0x2D_JumpOnInteract(pAIScripting0x08_L065, pAIScripting0x08_L060)                               ;B3E37D
    %AICMD0x12_Jump(pAIScripting0x08_L057)                                   ;B3E382
pAIScripting0x08_L058:
    %AICMD0x45_JumpIfBetween16(nLove_Ellen, 0, 249, pAIScripting0x08_L059)   ;B3E385
    %AICMD0x1C_ShowDialog($043E, $00)                          ;B3E38F
    %AICMD0x12_Jump(pAIScripting0x08_L057)                                   ;B3E393
pAIScripting0x08_L059:
    %AICMD0x1C_ShowDialog($0176, $00)                          ;B3E396
    %AICMD0x12_Jump(pAIScripting0x08_L057)                                   ;B3E39A
pAIScripting0x08_L060:
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 2, pAIScripting0x08_L061)              ;B3E39D
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 1, 7, pAIScripting0x08_L062)          ;B3E3A4
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 16, 23, pAIScripting0x08_L062)        ;B3E3AC
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 6, pAIScripting0x08_L062)              ;B3E3B4
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 25, pAIScripting0x08_L063)             ;B3E3BB
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 73, pAIScripting0x08_L063)             ;B3E3C2
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 9, 12, pAIScripting0x08_L064)         ;B3E3C9
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3E3D1
    %AICMD0x12_Jump(pAIScripting0x08_L057)                                   ;B3E3D5
pAIScripting0x08_L061:
    %AICMD0x1C_ShowDialog($03B4, $00)                          ;B3E3D8
    %AICMD0x41_AddValue16(nLove_Ann, -8)                       ;B3E3DC
    %AICMD0x12_Jump(pAIScripting0x08_L057)                                   ;B3E3E2
pAIScripting0x08_L062:
    %AICMD0x1C_ShowDialog($03B2, $00)                          ;B3E3E5
    %AICMD0x41_AddValue16(nLove_Ann, 6)                        ;B3E3E9
    %AICMD0x12_Jump(pAIScripting0x08_L057)                                   ;B3E3EF
pAIScripting0x08_L063:
    %AICMD0x1C_ShowDialog($0212, $00)                          ;B3E3F2
    %AICMD0x41_AddValue16(nLove_Ann, 2)                        ;B3E3F6
    %AICMD0x12_Jump(pAIScripting0x08_L057)                                   ;B3E3FC
pAIScripting0x08_L064:
    %AICMD0x1C_ShowDialog($03B4, $00)                          ;B3E3FF
    %AICMD0x41_AddValue16(nLove_Ann, -2)                       ;B3E403
    %AICMD0x12_Jump(pAIScripting0x08_L057)                                   ;B3E409
pAIScripting0x08_L065:
    %AICMD0x1C_ShowDialog($0169, $00)                          ;B3E40C
    %AICMD0x12_Jump(pAIScripting0x08_L057)                                   ;B3E410


pAIScripting0x08_Data05:
 
    %AICMD0x11_EnableUserControl()                             ;B3E413
    %AICMD0x09_StartScript($01, pAIScripting0x08_L071)                                   ;B3E414
    %AICMD0x09_StartScript($02, pAIScripting0x08_L076)                                   ;B3E418
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $02, pAIScripting0x08_L067)   ;B3E41C
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $03, pAIScripting0x08_L067)   ;B3E423
    %AICMD0x09_StartScript($04, pAIScripting0x08_L069)                                   ;B3E42A
    %AICMD0x12_Jump(pAIScripting0x08_L067)                                   ;B3E42E
pAIScripting0x08_L066:
    %AICMD0x13_Wait(1)                                         ;B3E431
    %AICMD0x12_Jump(pAIScripting0x08_L066)                                   ;B3E434
pAIScripting0x08_L067:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $03, pAIScripting0x08_L068)   ;B3E437
    %AICMD0x09_StartScript($03, pAIScripting0x08_L080)                                   ;B3E43E
pAIScripting0x08_L068:
    %AICMD0x12_Jump(pAIScripting0x08_L066)                                   ;B3E442
pAIScripting0x08_L069:
    %AICMD0x1A($0087, $0097, aAIScriptingData_L091, $00)                     ;B3E445
pAIScripting0x08_L070:
    %AICMD0x13_Wait(1)                                         ;B3E44D
    %AICMD0x12_Jump(pAIScripting0x08_L070)                                   ;B3E450
pAIScripting0x08_L071:
    %AICMD0x1A($0028, $0198, aAIScriptingData_L048, $02)                     ;B3E453
    %AICMD0x12_Jump(pAIScripting0x08_L072)                                   ;B3E45B
pAIScripting0x08_L072:
    %AICMD0x2D_JumpOnInteract(pAIScripting0x08_L075, pAIScripting0x08_L073)                               ;B3E45E
    %AICMD0x12_Jump(pAIScripting0x08_L072)                                   ;B3E463
pAIScripting0x08_L073:
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 9, 12, pAIScripting0x08_L074)         ;B3E466
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3E46E
    %AICMD0x12_Jump(pAIScripting0x08_L072)                                   ;B3E472
pAIScripting0x08_L074:
    %AICMD0x1C_ShowDialog($03BB, $00)                          ;B3E475
    %AICMD0x12_Jump(pAIScripting0x08_L072)                                   ;B3E479
pAIScripting0x08_L075:
    %AICMD0x1C_ShowDialog($0402, $00)                          ;B3E47C
    %AICMD0x12_Jump(pAIScripting0x08_L072)                                   ;B3E480
pAIScripting0x08_L076:
    %AICMD0x1A($0088, $0158, aAIScriptingData_L050, $00)                     ;B3E483
pAIScripting0x08_L077:
    %AICMD0x2D_JumpOnInteract(pAIScripting0x08_L079, pAIScripting0x08_L078)                               ;B3E48B
    %AICMD0x12_Jump(pAIScripting0x08_L077)                                   ;B3E490
pAIScripting0x08_L078:
    %AICMD0x1C_ShowDialog($03BC, $00)                          ;B3E493
    %AICMD0x12_Jump(pAIScripting0x08_L077)                                   ;B3E497
pAIScripting0x08_L079:
    %AICMD0x1C_ShowDialog($03C9, $02)                          ;B3E49A
    %AICMD0x1C_ShowDialog($0412, $01)                          ;B3E49E
    %AICMD0x12_Jump(pAIScripting0x08_L077)                                   ;B3E4A2
pAIScripting0x08_L080:
    %AICMD0x1A($0058, $01B8, aAIScriptingData_L021, $00)                     ;B3E4A5
pAIScripting0x08_L081:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x08_L082)                                        ;B3E4AD
    %AICMD0x2D_JumpOnInteract(pAIScripting0x08_L086, pAIScripting0x08_L084)                               ;B3E4B0
    %AICMD0x12_Jump(pAIScripting0x08_L081)                                   ;B3E4B5
pAIScripting0x08_L082:
    %AICMD0x45_JumpIfBetween16(nLove_Ellen, 0, 249, pAIScripting0x08_L083)   ;B3E4B8
    %AICMD0x1C_ShowDialog($0440, $00)                          ;B3E4C2
    %AICMD0x12_Jump(pAIScripting0x08_L081)                                   ;B3E4C6
pAIScripting0x08_L083:
    %AICMD0x1C_ShowDialog($017A, $00)                          ;B3E4C9
    %AICMD0x12_Jump(pAIScripting0x08_L081)                                   ;B3E4CD
pAIScripting0x08_L084:
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 9, 12, pAIScripting0x08_L085)         ;B3E4D0
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3E4D8
    %AICMD0x12_Jump(pAIScripting0x08_L081)                                   ;B3E4DC
pAIScripting0x08_L085:
    %AICMD0x1C_ShowDialog($03B0, $00)                          ;B3E4DF
    %AICMD0x12_Jump(pAIScripting0x08_L081)                                   ;B3E4E3
pAIScripting0x08_L086:
    %AICMD0x1C_ShowDialog($0165, $00)                          ;B3E4E6
    %AICMD0x12_Jump(pAIScripting0x08_L081)                                   ;B3E4EA


pAIScripting0x08_Data06:
 
    %AICMD0x11_EnableUserControl()                             ;B3E4ED
    %AICMD0x09_StartScript($01, pAIScripting0x08_L088)                                   ;B3E4EE
    %AICMD0x09_StartScript($02, pAIScripting0x08_L093)                                   ;B3E4F2
    if !REGION_EU|!REGION_DE
        ; EU/DE: no explicit fade-in (docs/regions-ai.md)
    else
        %AICMD0x0A_ScreenFadein($01)                                            ;B3E4F6
    endif
pAIScripting0x08_L087:
    %AICMD0x13_Wait(1)                                         ;B3E4F8
    %AICMD0x12_Jump(pAIScripting0x08_L087)                                   ;B3E4FB
pAIScripting0x08_L088:
    %AICMD0x1A($0088, $0050, aAIScriptingData_L042, $00)                     ;B3E4FE
pAIScripting0x08_L089:
    %AICMD0x2D_JumpOnInteract(pAIScripting0x08_L092, pAIScripting0x08_L090)                               ;B3E506
    %AICMD0x12_Jump(pAIScripting0x08_L089)                                   ;B3E50B
pAIScripting0x08_L090:
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 9, 12, pAIScripting0x08_L091)         ;B3E50E
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3E516
    %AICMD0x12_Jump(pAIScripting0x08_L089)                                   ;B3E51A
pAIScripting0x08_L091:
    %AICMD0x1C_ShowDialog($03BB, $00)                          ;B3E51D
    %AICMD0x12_Jump(pAIScripting0x08_L089)                                   ;B3E521
pAIScripting0x08_L092:
    %AICMD0x1C_ShowDialog($0168, $00)                          ;B3E524
    %AICMD0x12_Jump(pAIScripting0x08_L089)                                   ;B3E528
pAIScripting0x08_L093:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event4, $0A, pAIScripting0x08_L098)   ;B3E52B
    %AICMD0x1A($0038, $0098, aAIScriptingData_L056, $00)                     ;B3E532
pAIScripting0x08_L094:
    %AICMD0x2D_JumpOnInteract(pAIScripting0x08_L097, pAIScripting0x08_L095)                               ;B3E53A
    %AICMD0x12_Jump(pAIScripting0x08_L094)                                   ;B3E53F
pAIScripting0x08_L095:
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 9, 12, pAIScripting0x08_L096)         ;B3E542
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3E54A
    %AICMD0x12_Jump(pAIScripting0x08_L094)                                   ;B3E54E
pAIScripting0x08_L096:
    %AICMD0x1C_ShowDialog($03BA, $00)                          ;B3E551
    %AICMD0x12_Jump(pAIScripting0x08_L094)                                   ;B3E555
pAIScripting0x08_L097:
    %AICMD0x1C_ShowDialog($0413, $00)                          ;B3E558
    %AICMD0x12_Jump(pAIScripting0x08_L094)                                   ;B3E55C
pAIScripting0x08_L098:
    %AICMD0x10_End()                                           ;B3E55F


pAIScripting0x08_Data07:
 
    %AICMD0x11_EnableUserControl()                             ;B3E560
    %AICMD0x09_StartScript($01, pAIScripting0x08_L100)                                   ;B3E561
    if !REGION_EU|!REGION_DE
        ; EU/DE: no explicit fade-in (docs/regions-ai.md)
    else
        %AICMD0x0A_ScreenFadein($01)                                            ;B3E565
    endif
pAIScripting0x08_L099:
    %AICMD0x13_Wait(1)                                         ;B3E567
    %AICMD0x12_Jump(pAIScripting0x08_L099)                                   ;B3E56A
pAIScripting0x08_L100:
    %AICMD0x1A($00E8, $009C, aAIScriptingData_L053, $03)                     ;B3E56D
pAIScripting0x08_L101:
    %AICMD0x2D_JumpOnInteract(pAIScripting0x08_L104, pAIScripting0x08_L102)                               ;B3E575
    %AICMD0x12_Jump(pAIScripting0x08_L101)                                   ;B3E57A
pAIScripting0x08_L102:
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 9, 12, pAIScripting0x08_L103)         ;B3E57D
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3E585
    %AICMD0x12_Jump(pAIScripting0x08_L101)                                   ;B3E589
pAIScripting0x08_L103:
    %AICMD0x1C_ShowDialog($03BB, $00)                          ;B3E58C
    %AICMD0x12_Jump(pAIScripting0x08_L101)                                   ;B3E590
pAIScripting0x08_L104:
    %AICMD0x1C_ShowDialog($016C, $00)                          ;B3E593
    %AICMD0x12_Jump(pAIScripting0x08_L101)                                   ;B3E597


pAIScripting0x08_Data08:
    %AICMD0x11_EnableUserControl()                             ;B3E59A
    %AICMD0x09_StartScript($01, pAIScripting0x08_L111)                                   ;B3E59B
    %AICMD0x09_StartScript($02, pAIScripting0x08_L106)                                   ;B3E59F
pAIScripting0x08_L105:
    %AICMD0x13_Wait(1)                                         ;B3E5A3
    %AICMD0x12_Jump(pAIScripting0x08_L105)                                   ;B3E5A6
pAIScripting0x08_L106:
    %AICMD0x1A($0058, $00B8, aAIScriptingData_L027, $00)                     ;B3E5A9
pAIScripting0x08_L107:
    %AICMD0x2D_JumpOnInteract(pAIScripting0x08_L110, pAIScripting0x08_L108)                               ;B3E5B1
    %AICMD0x12_Jump(pAIScripting0x08_L107)                                   ;B3E5B6
pAIScripting0x08_L108:
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 9, 12, pAIScripting0x08_L109)         ;B3E5B9
    %AICMD0x1C_ShowDialog($03BC, $00)                          ;B3E5C1
    %AICMD0x12_Jump(pAIScripting0x08_L107)                                   ;B3E5C5
pAIScripting0x08_L109:
    %AICMD0x1C_ShowDialog($03BB, $00)                          ;B3E5C8
    %AICMD0x12_Jump(pAIScripting0x08_L107)                                   ;B3E5CC
pAIScripting0x08_L110:
    %AICMD0x1C_ShowDialog($0414, $00)                          ;B3E5CF
    %AICMD0x12_Jump(pAIScripting0x08_L107)                                   ;B3E5D3
pAIScripting0x08_L111:
    %AICMD0x1A($0098, $0088, aAIScriptingData_L027, $00)                     ;B3E5D6
pAIScripting0x08_L112:
    %AICMD0x2D_JumpOnInteract(pAIScripting0x08_L115, pAIScripting0x08_L113)                               ;B3E5DE
    %AICMD0x12_Jump(pAIScripting0x08_L112)                                   ;B3E5E3
pAIScripting0x08_L113:
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 9, 12, pAIScripting0x08_L114)         ;B3E5E6
    %AICMD0x1C_ShowDialog($03BC, $00)                          ;B3E5EE
    %AICMD0x12_Jump(pAIScripting0x08_L112)                                   ;B3E5F2
pAIScripting0x08_L114:
    %AICMD0x1C_ShowDialog($03BB, $00)                          ;B3E5F5
    %AICMD0x12_Jump(pAIScripting0x08_L112)                                   ;B3E5F9
pAIScripting0x08_L115:
    %AICMD0x1C_ShowDialog($0415, $00)                          ;B3E5FC
    %AICMD0x12_Jump(pAIScripting0x08_L112)                                   ;B3E600
