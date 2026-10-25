

pAIScripting0x0E:
    dw pAIScripting0x0E_Data01                                            ;B3F0E6|        |B3F106;
    dw pAIScripting0x0E_Data02                                            ;B3F0E8|        |B3FDD4;
    dw pAIScripting0x0E_Data03                                            ;B3F0EA|        |B3FFA4;
    dw pAIScripting0x0E_Data03                                            ;B3F0EC|        |B3FFA4;
    dw pAIScripting0x0E_Data03                                            ;B3F0EE|        |B3FFA4;
    dw pAIScripting0x0E_Data03                                            ;B3F0F0|        |B3FFA4;
    dw pAIScripting0x0E_Data03                                            ;B3F0F2|        |B3FFA4;
    dw pAIScripting0x0E_Data03                                            ;B3F0F4|        |B3FFA4;
    dw pAIScripting0x0E_Data03                                            ;B3F0F6|        |B3FFA4;
    dw pAIScripting0x0E_Data03                                            ;B3F0F8|        |B3FFA4;
    dw pAIScripting0x0E_Data03                                            ;B3F0FA|        |B3FFA4;
    dw pAIScripting0x0E_Data03                                            ;B3F0FC|        |B3FFA4;
    dw pAIScripting0x0E_Data03                                            ;B3F0FE|        |B3FFA4;
    dw pAIScripting0x0E_Data03                                            ;B3F100|        |B3FFA4;
    dw pAIScripting0x0E_Data03                                            ;B3F102|        |B3FFA4;
    dw pAIScripting0x0E_Data03                                            ;B3F104|        |B3FFA4;
 
pAIScripting0x0E_Data01:
 
    %AICMD0x4F_DisableToolUse()                                               ;B3F106
    %AICMD0x50()                                               ;B3F107
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $09)       ;B3F108
    %AICMD0x00_SetMusic($07, $B4)                              ;B3F10D
    %AICMD0x02_FreezeTime()                                    ;B3F110
    %AICMD0x03_SetHour($07)                                    ;B3F111
    %AICMD0x05_SetTransferPosition(264, 312)                   ;B3F113
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B3F118
    %AICMD0x32_SetValue16(strcFlags.unknown1, $F7FF)                      ;B3F11A
    %AICMD0x09_StartScript($01, pAIScripting0x0E_L012)                                   ;B3F120
    %AICMD0x09_StartScript($02, pAIScripting0x0E_L016)                                   ;B3F124
    %AICMD0x09_StartScript($03, pAIScripting0x0E_L026)                                   ;B3F128
    %AICMD0x09_StartScript($04, pAIScripting0x0E_L032)                                   ;B3F12C
    %AICMD0x09_StartScript($05, pAIScripting0x0E_L036)                                   ;B3F130
    %AICMD0x09_StartScript($06, pAIScripting0x0E_L041)                                   ;B3F134
    %AICMD0x09_StartScript($07, pAIScripting0x0E_L047)                                   ;B3F138
    %AICMD0x09_StartScript($0B, pAIScripting0x0E_L143)                                   ;B3F13C
    %AICMD0x09_StartScript($0D, pAIScripting0x0E_L060)                                   ;B3F140
    %AICMD0x09_StartScript($0E, pAIScripting0x0E_L076)                                   ;B3F144
    %AICMD0x09_StartScript($0F, pAIScripting0x0E_L092)                                   ;B3F148
    %AICMD0x09_StartScript($10, pAIScripting0x0E_L109)                                   ;B3F14C
    %AICMD0x09_StartScript($11, pAIScripting0x0E_L126)                                   ;B3F150
    %AICMD0x06_SetDestinationArea(!AREA_DANCINGS1)             ;B3F154
    %AICMD0x38_WaitForFadeIn()                                               ;B3F156
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B3F157
    %AICMD0x3D_TeleportToArea(!AREA_DANCINGS1)                 ;B3F159
    %AICMD0x10_End()                                           ;B3F15B
pAIScripting0x0E_L001:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $00, pAIScripting0x0E_L006)   ;B3F15C
    %AICMD0x09_StartScript($07, pAIScripting0x0E_L161)                                   ;B3F163
    %AICMD0x41_AddValue16(nLove_Maria, 30)                     ;B3F167
    %AICMD0x12_Jump(pAIScripting0x0E_L173)                                   ;B3F16D
pAIScripting0x0E_L002:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $01, pAIScripting0x0E_L007)   ;B3F170
    %AICMD0x09_StartScript($07, pAIScripting0x0E_L163)                                   ;B3F177
    %AICMD0x41_AddValue16(nLove_Ann, 30)                       ;B3F17B
    %AICMD0x12_Jump(pAIScripting0x0E_L173)                                   ;B3F181
pAIScripting0x0E_L003:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, pAIScripting0x0E_L008)   ;B3F184
    %AICMD0x09_StartScript($07, pAIScripting0x0E_L165)                                   ;B3F18B
    %AICMD0x41_AddValue16(nLove_Nina, 30)                      ;B3F18F
    %AICMD0x12_Jump(pAIScripting0x0E_L173)                                   ;B3F195
pAIScripting0x0E_L004:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $03, pAIScripting0x0E_L009)   ;B3F198
    %AICMD0x09_StartScript($07, pAIScripting0x0E_L167)                                   ;B3F19F
    %AICMD0x41_AddValue16(nLove_Ellen, 30)                     ;B3F1A3
    %AICMD0x12_Jump(pAIScripting0x0E_L173)                                   ;B3F1A9
pAIScripting0x0E_L005:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $04, pAIScripting0x0E_L010)   ;B3F1AC
    %AICMD0x09_StartScript($07, pAIScripting0x0E_L169)                                   ;B3F1B3
    %AICMD0x41_AddValue16(nLove_Eve, 30)                       ;B3F1B7
    %AICMD0x12_Jump(pAIScripting0x0E_L173)                                   ;B3F1BD
pAIScripting0x0E_L006:
    %AICMD0x41_AddValue16(nLove_Maria, 30)                     ;B3F1C0
    %AICMD0x12_Jump(pAIScripting0x0E_L011)                                   ;B3F1C6
pAIScripting0x0E_L007:
    %AICMD0x41_AddValue16(nLove_Ann, 30)                       ;B3F1C9
    %AICMD0x12_Jump(pAIScripting0x0E_L011)                                   ;B3F1CF
pAIScripting0x0E_L008:
    %AICMD0x41_AddValue16(nLove_Nina, 30)                      ;B3F1D2
    %AICMD0x12_Jump(pAIScripting0x0E_L011)                                   ;B3F1D8
pAIScripting0x0E_L009:
    %AICMD0x41_AddValue16(nLove_Ellen, 30)                     ;B3F1DB
    %AICMD0x12_Jump(pAIScripting0x0E_L011)                                   ;B3F1E1
pAIScripting0x0E_L010:
    %AICMD0x41_AddValue16(nLove_Eve, 30)                       ;B3F1E4
pAIScripting0x0E_L011:
    %AICMD0x09_StartScript($07, pAIScripting0x0E_L171)                                   ;B3F1EA
    %AICMD0x12_Jump(pAIScripting0x0E_L173)                                   ;B3F1EE
pAIScripting0x0E_L012:
    %AICMD0x1A($00B8, $0088, aAIScriptingData_L064, $03)                     ;B3F1F1
pAIScripting0x0E_L013:
    %AICMD0x1F(pAIScripting0x0E_L014)                                        ;B3F1F9
    %AICMD0x12_Jump(pAIScripting0x0E_L013)                                   ;B3F1FC
pAIScripting0x0E_L014:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $0B, pAIScripting0x0E_L015) ;B3F1FF
    %AICMD0x1C_ShowDialog($020C, $00)                          ;B3F206
    %AICMD0x1B($02D0, $00)                                     ;B3F20A
    %AICMD0x28_ClearBit(strcFlags.unknown1, $00)                        ;B3F20E
    %AICMD0x12_Jump(pAIScripting0x0E_L013)                                   ;B3F213
pAIScripting0x0E_L015:
    %AICMD0x1C_ShowDialog($0284, $00)                          ;B3F216
    %AICMD0x12_Jump(pAIScripting0x0E_L013)                                   ;B3F21A
pAIScripting0x0E_L016:
    %AICMD0x1A($0188, $0098, aAIScriptingData_L057, $00)                     ;B3F21D
pAIScripting0x0E_L017:
    %AICMD0x1F(pAIScripting0x0E_L019)                                        ;B3F225
    %AICMD0x12_Jump(pAIScripting0x0E_L017)                                   ;B3F228
pAIScripting0x0E_L018:
    %AICMD0x1F(pAIScripting0x0E_L025)                                        ;B3F22B
    %AICMD0x12_Jump(pAIScripting0x0E_L018)                                   ;B3F22E
pAIScripting0x0E_L019:
    %AICMD0x28_ClearBit(strcFlags.unknown1, $01)                        ;B3F231
    %AICMD0x14_JumpIfFlagSet(strcFlags.event6, $0B, pAIScripting0x0E_L020)   ;B3F236
    %AICMD0x1D_ShowDialog($0214, $00)                          ;B3F23D
    %AICMD0x20_JumpIfChoice(0, pAIScripting0x0E_L021)                        ;B3F241
    %AICMD0x20_JumpIfChoice(1, pAIScripting0x0E_L024)                        ;B3F245
    %AICMD0x12_Jump(pAIScripting0x0E_L017)                                   ;B3F249
pAIScripting0x0E_L020:
    %AICMD0x1C_ShowDialog($024E, $00)                          ;B3F24C
    %AICMD0x12_Jump(pAIScripting0x0E_L017)                                   ;B3F250
pAIScripting0x0E_L021:
    %AICMD0x46_JumpIfBetween24(nMoney, 0, 199, pAIScripting0x0E_L022)        ;B3F253
    %AICMD0x12_Jump(pAIScripting0x0E_L023)                                   ;B3F25F
pAIScripting0x0E_L022:
    %AICMD0x1C_ShowDialog($0213, $00)                          ;B3F262
    %AICMD0x12_Jump(pAIScripting0x0E_L018)                                   ;B3F266
pAIScripting0x0E_L023:
    %AICMD0x1C_ShowDialog($0215, $00)                          ;B3F269
    %AICMD0x42_AddValue24(nMoney, -200)                        ;B3F26D
    %AICMD0x23_OrWithIndexedValue(strcShedItems.row3, $06)     ;B3F274
    %AICMD0x23_OrWithIndexedValue(strcFlags.event6, $0B)       ;B3F279
    %AICMD0x12_Jump(pAIScripting0x0E_L018)                                   ;B3F27E
pAIScripting0x0E_L024:
    %AICMD0x1C_ShowDialog($0216, $00)                          ;B3F281
    %AICMD0x12_Jump(pAIScripting0x0E_L017)                                   ;B3F285
pAIScripting0x0E_L025:
    %AICMD0x1C_ShowDialog($0081, $00)                          ;B3F288
    %AICMD0x12_Jump(pAIScripting0x0E_L018)                                   ;B3F28C
    %AICMD0x10_End()                                           ;B3F28F
pAIScripting0x0E_L026:
    %AICMD0x1A($0078, $00F8, aAIScriptingData_L061, $02)                     ;B3F290
pAIScripting0x0E_L027:
    %AICMD0x1F(pAIScripting0x0E_L029)                                        ;B3F298
    %AICMD0x12_Jump(pAIScripting0x0E_L027)                                   ;B3F29B
pAIScripting0x0E_L028:
    %AICMD0x1F(pAIScripting0x0E_L030)                                        ;B3F29E
    %AICMD0x12_Jump(pAIScripting0x0E_L028)                                   ;B3F2A1
pAIScripting0x0E_L029:
    %AICMD0x1C_ShowDialog($021F, $00)                          ;B3F2A4
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $00, pAIScripting0x0E_L027) ;B3F2A8
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $01, pAIScripting0x0E_L027) ;B3F2AF
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $02, pAIScripting0x0E_L027) ;B3F2B6
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $03, pAIScripting0x0E_L027) ;B3F2BD
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $04, pAIScripting0x0E_L027) ;B3F2C4
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $05, pAIScripting0x0E_L027) ;B3F2CB
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $06, pAIScripting0x0E_L027) ;B3F2D2
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $07, pAIScripting0x0E_L027) ;B3F2D9
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $08, pAIScripting0x0E_L027) ;B3F2E0
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $09, pAIScripting0x0E_L027) ;B3F2E7
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $0A, pAIScripting0x0E_L027) ;B3F2EE
    %AICMD0x08_EnableAIControl()                               ;B3F2F5
    %AICMD0x1B($02C7, $00)                                     ;B3F2F6
    %AICMD0x0D($00, $FF, $30, $01)                             ;B3F2FA
    %AICMD0x1B($02C4, $00)                                     ;B3F2FF
    %AICMD0x11_EnableUserControl()                             ;B3F303
    %AICMD0x12_Jump(pAIScripting0x0E_L028)                                   ;B3F304
pAIScripting0x0E_L030:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $0B, pAIScripting0x0E_L031) ;B3F307
    %AICMD0x1C_ShowDialog($0217, $00)                          ;B3F30E
    %AICMD0x12_Jump(pAIScripting0x0E_L028)                                   ;B3F312
pAIScripting0x0E_L031:
    %AICMD0x1C_ShowDialog($0282, $00)                          ;B3F315
    %AICMD0x12_Jump(pAIScripting0x0E_L028)                                   ;B3F319
pAIScripting0x0E_L032:
    %AICMD0x1A($00B8, $00D8, aAIScriptingData_L046, $00)                     ;B3F31C
pAIScripting0x0E_L033:
    %AICMD0x1F(pAIScripting0x0E_L034)                                        ;B3F324
    %AICMD0x12_Jump(pAIScripting0x0E_L033)                                   ;B3F327
pAIScripting0x0E_L034:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $0B, pAIScripting0x0E_L035) ;B3F32A
    %AICMD0x28_ClearBit(strcFlags.unknown1, $02)                        ;B3F331
    %AICMD0x1C_ShowDialog($0218, $00)                          ;B3F336
    %AICMD0x12_Jump(pAIScripting0x0E_L033)                                   ;B3F33A
pAIScripting0x0E_L035:
    %AICMD0x1C_ShowDialog($0283, $00)                          ;B3F33D
    %AICMD0x12_Jump(pAIScripting0x0E_L033)                                   ;B3F341
pAIScripting0x0E_L036:
    %AICMD0x1A($01A8, $00F8, aAIScriptingData_L051, $00)                     ;B3F344
pAIScripting0x0E_L037:
    %AICMD0x1F(pAIScripting0x0E_L038)                                        ;B3F34C
    %AICMD0x12_Jump(pAIScripting0x0E_L037)                                   ;B3F34F
pAIScripting0x0E_L038:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $0B, pAIScripting0x0E_L040) ;B3F352
    %AICMD0x28_ClearBit(strcFlags.unknown1, $03)                        ;B3F359
    %AICMD0x16_JumpIfBetween8(nCurrentYearID, 0, 1, pAIScripting0x0E_L039)   ;B3F35E
    %AICMD0x1C_ShowDialog($0219, $00)                          ;B3F366
    %AICMD0x12_Jump(pAIScripting0x0E_L037)                                   ;B3F36A
pAIScripting0x0E_L039:
    %AICMD0x1C_ShowDialog($0205, $00)                          ;B3F36D
    %AICMD0x12_Jump(pAIScripting0x0E_L037)                                   ;B3F371
pAIScripting0x0E_L040:
    %AICMD0x1C_ShowDialog($028A, $00)                          ;B3F374
    %AICMD0x12_Jump(pAIScripting0x0E_L037)                                   ;B3F378
pAIScripting0x0E_L041:
    %AICMD0x1A($00F8, $00F8, aAIScriptingData_L067, $01)                     ;B3F37B
pAIScripting0x0E_L042:
    %AICMD0x1F(pAIScripting0x0E_L043)                                        ;B3F383
    %AICMD0x12_Jump(pAIScripting0x0E_L042)                                   ;B3F386
pAIScripting0x0E_L043:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $0B, pAIScripting0x0E_L045) ;B3F389
    %AICMD0x28_ClearBit(strcFlags.unknown1, $04)                        ;B3F390
    %AICMD0x15_JumpIfEquals8(nCurrentYearID, 0, pAIScripting0x0E_L044)       ;B3F395
    %AICMD0x1C_ShowDialog($021C, $00)                          ;B3F39C
    %AICMD0x12_Jump(pAIScripting0x0E_L042)                                   ;B3F3A0
pAIScripting0x0E_L044:
    %AICMD0x1C_ShowDialog($021A, $00)                          ;B3F3A3
    %AICMD0x12_Jump(pAIScripting0x0E_L042)                                   ;B3F3A7
pAIScripting0x0E_L045:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $00, pAIScripting0x0E_L046)   ;B3F3AA
    %AICMD0x1C_ShowDialog($0288, $00)                          ;B3F3B1
    %AICMD0x12_Jump(pAIScripting0x0E_L042)                                   ;B3F3B5
pAIScripting0x0E_L046:
    %AICMD0x1C_ShowDialog($0250, $00)                          ;B3F3B8
    %AICMD0x12_Jump(pAIScripting0x0E_L042)                                   ;B3F3BC
pAIScripting0x0E_L047:
    %AICMD0x1A($0118, $00F8, aAIScriptingData_L055, $01)                     ;B3F3BF
pAIScripting0x0E_L048:
    %AICMD0x1F(pAIScripting0x0E_L049)                                        ;B3F3C7
    %AICMD0x12_Jump(pAIScripting0x0E_L048)                                   ;B3F3CA
pAIScripting0x0E_L049:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $0B, pAIScripting0x0E_L051) ;B3F3CD
    %AICMD0x28_ClearBit(strcFlags.unknown1, $05)                        ;B3F3D4
    %AICMD0x15_JumpIfEquals8(nCurrentYearID, 0, pAIScripting0x0E_L050)       ;B3F3D9
    %AICMD0x1C_ShowDialog($021E, $00)                          ;B3F3E0
    %AICMD0x12_Jump(pAIScripting0x0E_L048)                                   ;B3F3E4
pAIScripting0x0E_L050:
    %AICMD0x1C_ShowDialog($021D, $00)                          ;B3F3E7
    %AICMD0x12_Jump(pAIScripting0x0E_L048)                                   ;B3F3EB
pAIScripting0x0E_L051:
    %AICMD0x1C_ShowDialog($0287, $00)                          ;B3F3EE
    %AICMD0x12_Jump(pAIScripting0x0E_L048)                                   ;B3F3F2
    %AICMD0x1A($0158, $0138, aAIScriptingData_L042, $00)                     ;B3F3F5
pAIScripting0x0E_L052:
    %AICMD0x1F(pAIScripting0x0E_L053)                                        ;B3F3FD
    %AICMD0x12_Jump(pAIScripting0x0E_L052)                                   ;B3F400
pAIScripting0x0E_L053:
    %AICMD0x1C_ShowDialog($021C, $00)                          ;B3F403
    %AICMD0x12_Jump(pAIScripting0x0E_L052)                                   ;B3F407
    %AICMD0x1C_ShowDialog($028C, $00)                          ;B3F40A
    %AICMD0x12_Jump(pAIScripting0x0E_L052)                                   ;B3F40E
    %AICMD0x1A($0198, $00C8, aAIScriptingData_L035, $00)                     ;B3F411
pAIScripting0x0E_L054:
    %AICMD0x1F(pAIScripting0x0E_L055)                                        ;B3F419
    %AICMD0x12_Jump(pAIScripting0x0E_L054)                                   ;B3F41C
pAIScripting0x0E_L055:
    %AICMD0x1C_ShowDialog($021D, $00)                          ;B3F41F
    %AICMD0x12_Jump(pAIScripting0x0E_L054)                                   ;B3F423
    %AICMD0x1C_ShowDialog($0288, $00)                          ;B3F426
    %AICMD0x12_Jump(pAIScripting0x0E_L054)                                   ;B3F42A
    %AICMD0x1A($0198, $0158, aAIScriptingData_L037, $01)                     ;B3F42D
pAIScripting0x0E_L056:
    %AICMD0x1F(pAIScripting0x0E_L057)                                        ;B3F435
    %AICMD0x12_Jump(pAIScripting0x0E_L056)                                   ;B3F438
pAIScripting0x0E_L057:
    %AICMD0x1C_ShowDialog($021E, $00)                          ;B3F43B
    %AICMD0x12_Jump(pAIScripting0x0E_L056)                                   ;B3F43F
    %AICMD0x1C_ShowDialog($0289, $00)                          ;B3F442
    %AICMD0x12_Jump(pAIScripting0x0E_L056)                                   ;B3F446
    %AICMD0x1A($0198, $0158, aAIScriptingData_L033, $01)                     ;B3F449
pAIScripting0x0E_L058:
    %AICMD0x1F(pAIScripting0x0E_L059)                                        ;B3F451
    %AICMD0x12_Jump(pAIScripting0x0E_L058)                                   ;B3F454
pAIScripting0x0E_L059:
    %AICMD0x1C_ShowDialog($021E, $00)                          ;B3F457
    %AICMD0x12_Jump(pAIScripting0x0E_L058)                                   ;B3F45B
    %AICMD0x1C_ShowDialog($028B, $00)                          ;B3F45E
    %AICMD0x12_Jump(pAIScripting0x0E_L058)                                   ;B3F462
pAIScripting0x0E_L060:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $00, pAIScripting0x0E_L061)   ;B3F465
    %AICMD0x1A($0148, $00B8, aAIScriptingData_L011, $00)                     ;B3F46C
    %AICMD0x12_Jump(pAIScripting0x0E_L062)                                   ;B3F474
pAIScripting0x0E_L061:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event6, $04, pAIScripting0x0E_L075)   ;B3F477
    %AICMD0x1A($0148, $00B8, aAIScriptingData_L071, $00)                     ;B3F47E
pAIScripting0x0E_L062:
    %AICMD0x2D_JumpOnInteract(pAIScripting0x0E_L064, pAIScripting0x0E_L071)                               ;B3F486
    %AICMD0x12_Jump(pAIScripting0x0E_L062)                                   ;B3F48B
pAIScripting0x0E_L063:
    %AICMD0x2D_JumpOnInteract(pAIScripting0x0E_L070, pAIScripting0x0E_L071)                               ;B3F48E
    %AICMD0x12_Jump(pAIScripting0x0E_L063)                                   ;B3F493
pAIScripting0x0E_L064:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $0B, pAIScripting0x0E_L065) ;B3F496
    %AICMD0x28_ClearBit(strcFlags.unknown1, $06)                        ;B3F49D
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $00, pAIScripting0x0E_L069)   ;B3F4A2
    %AICMD0x45_JumpIfBetween16(nLove_Maria, 0, 150, pAIScripting0x0E_L066)   ;B3F4A9
    %AICMD0x45_JumpIfBetween16(nLove_Maria, 151, 300, pAIScripting0x0E_L067) ;B3F4B3
    %AICMD0x45_JumpIfBetween16(nLove_Maria, 301, 999, pAIScripting0x0E_L068) ;B3F4BD
    %AICMD0x12_Jump(pAIScripting0x0E_L062)                                   ;B3F4C7
pAIScripting0x0E_L065:
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown1, $00)     ;B3F4CA
    %AICMD0x0B_SetScriptFlag($00)                                            ;B3F4CF
    %AICMD0x12_Jump(pAIScripting0x0E_L062)                                   ;B3F4D1
pAIScripting0x0E_L066:
    %AICMD0x1C_ShowDialog($0220, $00)                          ;B3F4D4
    %AICMD0x41_AddValue16(nLove_Maria, 8)                      ;B3F4D8
    %AICMD0x12_Jump(pAIScripting0x0E_L063)                                   ;B3F4DE
pAIScripting0x0E_L067:
    %AICMD0x1C_ShowDialog($0221, $00)                          ;B3F4E1
    %AICMD0x41_AddValue16(nLove_Maria, 12)                     ;B3F4E5
    %AICMD0x12_Jump(pAIScripting0x0E_L063)                                   ;B3F4EB
pAIScripting0x0E_L068:
    %AICMD0x1C_ShowDialog($0222, $00)                          ;B3F4EE
    %AICMD0x41_AddValue16(nLove_Maria, 15)                     ;B3F4F2
    %AICMD0x12_Jump(pAIScripting0x0E_L063)                                   ;B3F4F8
pAIScripting0x0E_L069:
    %AICMD0x1C_ShowDialog($0223, $00)                          ;B3F4FB
    %AICMD0x41_AddValue16(nLove_Maria, 4)                      ;B3F4FF
    %AICMD0x12_Jump(pAIScripting0x0E_L062)                                   ;B3F505
pAIScripting0x0E_L070:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $0B, pAIScripting0x0E_L065) ;B3F508
    %AICMD0x28_ClearBit(strcFlags.unknown1, $06)                        ;B3F50F
    %AICMD0x1C_ShowDialog($027A, $00)                          ;B3F514
    %AICMD0x12_Jump(pAIScripting0x0E_L063)                                   ;B3F518
pAIScripting0x0E_L071:
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 89, pAIScripting0x0E_L072)             ;B3F51B
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 88, pAIScripting0x0E_L073)             ;B3F522
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 90, pAIScripting0x0E_L074)             ;B3F529
    %AICMD0x12_Jump(pAIScripting0x0E_L062)                                   ;B3F530
pAIScripting0x0E_L072:
    %AICMD0x1C_ShowDialog($01DA, $00)                          ;B3F533
    %AICMD0x41_AddValue16(nLove_Maria, 5)                      ;B3F537
    %AICMD0x12_Jump(pAIScripting0x0E_L062)                                   ;B3F53D
pAIScripting0x0E_L073:
    %AICMD0x1C_ShowDialog($03B5, $00)                          ;B3F540
    %AICMD0x41_AddValue16(nLove_Maria, 15)                     ;B3F544
    %AICMD0x12_Jump(pAIScripting0x0E_L062)                                   ;B3F54A
pAIScripting0x0E_L074:
    %AICMD0x1C_ShowDialog($0212, $00)                          ;B3F54D
    %AICMD0x41_AddValue16(nLove_Maria, 8)                      ;B3F551
    %AICMD0x12_Jump(pAIScripting0x0E_L062)                                   ;B3F557
pAIScripting0x0E_L075:
    %AICMD0x28_ClearBit(strcFlags.unknown1, $06)                        ;B3F55A
    %AICMD0x10_End()                                           ;B3F55F
pAIScripting0x0E_L076:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $01, pAIScripting0x0E_L077)   ;B3F560
    %AICMD0x1A($00C8, $0128, aAIScriptingData_L015, $02)                     ;B3F567
    %AICMD0x12_Jump(pAIScripting0x0E_L078)                                   ;B3F56F
pAIScripting0x0E_L077:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event6, $04, pAIScripting0x0E_L091)   ;B3F572
    %AICMD0x1A($00C8, $0128, aAIScriptingData_L071, $00)                     ;B3F579
pAIScripting0x0E_L078:
    %AICMD0x2D_JumpOnInteract(pAIScripting0x0E_L080, pAIScripting0x0E_L086)                               ;B3F581
    %AICMD0x12_Jump(pAIScripting0x0E_L078)                                   ;B3F586
pAIScripting0x0E_L079:
    %AICMD0x2D_JumpOnInteract(pAIScripting0x0E_L090, pAIScripting0x0E_L086)                               ;B3F589
    %AICMD0x12_Jump(pAIScripting0x0E_L079)                                   ;B3F58E
pAIScripting0x0E_L080:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $0B, pAIScripting0x0E_L081) ;B3F591
    %AICMD0x28_ClearBit(strcFlags.unknown1, $07)                        ;B3F598
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $01, pAIScripting0x0E_L085)   ;B3F59D
    %AICMD0x45_JumpIfBetween16(nLove_Ann, 0, 150, pAIScripting0x0E_L082)     ;B3F5A4
    %AICMD0x45_JumpIfBetween16(nLove_Ann, 151, 300, pAIScripting0x0E_L083)   ;B3F5AE
    %AICMD0x45_JumpIfBetween16(nLove_Ann, 301, 999, pAIScripting0x0E_L084)   ;B3F5B8
    %AICMD0x12_Jump(pAIScripting0x0E_L078)                                   ;B3F5C2
pAIScripting0x0E_L081:
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown1, $01)     ;B3F5C5
    %AICMD0x0B_SetScriptFlag($00)                                            ;B3F5CA
    %AICMD0x12_Jump(pAIScripting0x0E_L078)                                   ;B3F5CC
pAIScripting0x0E_L082:
    %AICMD0x1C_ShowDialog($0224, $00)                          ;B3F5CF
    %AICMD0x41_AddValue16(nLove_Ann, 8)                        ;B3F5D3
    %AICMD0x12_Jump(pAIScripting0x0E_L079)                                   ;B3F5D9
pAIScripting0x0E_L083:
    %AICMD0x1C_ShowDialog($0225, $00)                          ;B3F5DC
    %AICMD0x41_AddValue16(nLove_Ann, 12)                       ;B3F5E0
    %AICMD0x12_Jump(pAIScripting0x0E_L079)                                   ;B3F5E6
pAIScripting0x0E_L084:
    %AICMD0x1C_ShowDialog($0226, $00)                          ;B3F5E9
    %AICMD0x41_AddValue16(nLove_Ann, 15)                       ;B3F5ED
    %AICMD0x12_Jump(pAIScripting0x0E_L079)                                   ;B3F5F3
pAIScripting0x0E_L085:
    %AICMD0x1C_ShowDialog($0227, $00)                          ;B3F5F6
    %AICMD0x41_AddValue16(nLove_Ann, 4)                        ;B3F5FA
    %AICMD0x12_Jump(pAIScripting0x0E_L079)                                   ;B3F600
pAIScripting0x0E_L086:
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 89, pAIScripting0x0E_L087)             ;B3F603
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 88, pAIScripting0x0E_L088)             ;B3F60A
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 90, pAIScripting0x0E_L089)             ;B3F611
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3F618
    %AICMD0x12_Jump(pAIScripting0x0E_L078)                                   ;B3F61C
pAIScripting0x0E_L087:
    %AICMD0x1C_ShowDialog($01DA, $00)                          ;B3F61F
    %AICMD0x41_AddValue16(nLove_Ann, 3)                        ;B3F623
    %AICMD0x12_Jump(pAIScripting0x0E_L078)                                   ;B3F629
pAIScripting0x0E_L088:
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3F62C
    %AICMD0x41_AddValue16(nLove_Ann, 6)                        ;B3F630
    %AICMD0x12_Jump(pAIScripting0x0E_L078)                                   ;B3F636
pAIScripting0x0E_L089:
    %AICMD0x1C_ShowDialog($0212, $00)                          ;B3F639
    %AICMD0x41_AddValue16(nLove_Ann, 15)                       ;B3F63D
    %AICMD0x12_Jump(pAIScripting0x0E_L078)                                   ;B3F643
pAIScripting0x0E_L090:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $0B, pAIScripting0x0E_L081) ;B3F646
    %AICMD0x28_ClearBit(strcFlags.unknown1, $07)                        ;B3F64D
    %AICMD0x1C_ShowDialog($0362, $00)                          ;B3F652
    %AICMD0x12_Jump(pAIScripting0x0E_L079)                                   ;B3F656
pAIScripting0x0E_L091:
    %AICMD0x28_ClearBit(strcFlags.unknown1, $07)                        ;B3F659
    %AICMD0x10_End()                                           ;B3F65E
pAIScripting0x0E_L092:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, pAIScripting0x0E_L093)   ;B3F65F
    %AICMD0x1A($00E8, $0088, aAIScriptingData_L019, $00)                     ;B3F666
    %AICMD0x12_Jump(pAIScripting0x0E_L094)                                   ;B3F66E
pAIScripting0x0E_L093:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event6, $04, pAIScripting0x0E_L108)   ;B3F671
    %AICMD0x1A($00E8, $0088, aAIScriptingData_L071, $00)                     ;B3F678
pAIScripting0x0E_L094:
    %AICMD0x2D_JumpOnInteract(pAIScripting0x0E_L097, pAIScripting0x0E_L104)                               ;B3F680
    %AICMD0x12_Jump(pAIScripting0x0E_L094)                                   ;B3F685
pAIScripting0x0E_L095:
    %AICMD0x2D_JumpOnInteract(pAIScripting0x0E_L103, pAIScripting0x0E_L104)                               ;B3F688
    %AICMD0x12_Jump(pAIScripting0x0E_L095)                                   ;B3F68D
pAIScripting0x0E_L096:
    %AICMD0x2D_JumpOnInteract(pAIScripting0x0E_L102, pAIScripting0x0E_L104)                               ;B3F690
    %AICMD0x12_Jump(pAIScripting0x0E_L096)                                   ;B3F695
pAIScripting0x0E_L097:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $0B, pAIScripting0x0E_L098) ;B3F698
    %AICMD0x28_ClearBit(strcFlags.unknown1, $08)                        ;B3F69F
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, pAIScripting0x0E_L102)   ;B3F6A4
    %AICMD0x45_JumpIfBetween16(nLove_Nina, 0, 150, pAIScripting0x0E_L099)    ;B3F6AB
    %AICMD0x45_JumpIfBetween16(nLove_Nina, 151, 300, pAIScripting0x0E_L100)  ;B3F6B5
    %AICMD0x45_JumpIfBetween16(nLove_Nina, 301, 999, pAIScripting0x0E_L101)  ;B3F6BF
    %AICMD0x12_Jump(pAIScripting0x0E_L094)                                   ;B3F6C9
pAIScripting0x0E_L098:
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown1, $02)     ;B3F6CC
    %AICMD0x0B_SetScriptFlag($00)                                            ;B3F6D1
    %AICMD0x12_Jump(pAIScripting0x0E_L094)                                   ;B3F6D3
pAIScripting0x0E_L099:
    %AICMD0x1C_ShowDialog($0228, $00)                          ;B3F6D6
    %AICMD0x41_AddValue16(nLove_Nina, 8)                       ;B3F6DA
    %AICMD0x12_Jump(pAIScripting0x0E_L095)                                   ;B3F6E0
pAIScripting0x0E_L100:
    %AICMD0x1C_ShowDialog($0229, $00)                          ;B3F6E3
    %AICMD0x41_AddValue16(nLove_Nina, 12)                      ;B3F6E7
    %AICMD0x12_Jump(pAIScripting0x0E_L095)                                   ;B3F6ED
pAIScripting0x0E_L101:
    %AICMD0x1C_ShowDialog($022A, $00)                          ;B3F6F0
    %AICMD0x41_AddValue16(nLove_Nina, 15)                      ;B3F6F4
    %AICMD0x12_Jump(pAIScripting0x0E_L095)                                   ;B3F6FA
pAIScripting0x0E_L102:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $0B, pAIScripting0x0E_L098) ;B3F6FD
    %AICMD0x28_ClearBit(strcFlags.unknown1, $08)                        ;B3F704
    %AICMD0x1C_ShowDialog($022B, $00)                          ;B3F709
    %AICMD0x41_AddValue16(nLove_Nina, 4)                       ;B3F70D
    %AICMD0x12_Jump(pAIScripting0x0E_L096)                                   ;B3F713
pAIScripting0x0E_L103:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $0B, pAIScripting0x0E_L098) ;B3F716
    %AICMD0x28_ClearBit(strcFlags.unknown1, $08)                        ;B3F71D
    %AICMD0x1C_ShowDialog($026D, $00)                          ;B3F722
    %AICMD0x12_Jump(pAIScripting0x0E_L095)                                   ;B3F726
pAIScripting0x0E_L104:
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 89, pAIScripting0x0E_L105)             ;B3F729
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 88, pAIScripting0x0E_L106)             ;B3F730
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 90, pAIScripting0x0E_L107)             ;B3F737
    %AICMD0x12_Jump(pAIScripting0x0E_L094)                                   ;B3F73E
pAIScripting0x0E_L105:
    %AICMD0x1C_ShowDialog($0212, $00)                          ;B3F741
    %AICMD0x41_AddValue16(nLove_Nina, 8)                       ;B3F745
    %AICMD0x12_Jump(pAIScripting0x0E_L094)                                   ;B3F74B
pAIScripting0x0E_L106:
    %AICMD0x1C_ShowDialog($0212, $00)                          ;B3F74E
    %AICMD0x41_AddValue16(nLove_Nina, 8)                       ;B3F752
    %AICMD0x12_Jump(pAIScripting0x0E_L094)                                   ;B3F758
pAIScripting0x0E_L107:
    %AICMD0x1C_ShowDialog($0212, $00)                          ;B3F75B
    %AICMD0x41_AddValue16(nLove_Nina, 8)                       ;B3F75F
    %AICMD0x12_Jump(pAIScripting0x0E_L094)                                   ;B3F765
pAIScripting0x0E_L108:
    %AICMD0x28_ClearBit(strcFlags.unknown1, $08)                        ;B3F768
    %AICMD0x10_End()                                           ;B3F76D
pAIScripting0x0E_L109:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $03, pAIScripting0x0E_L110)   ;B3F76E
    %AICMD0x1A($0138, $0148, aAIScriptingData_L021, $03)                     ;B3F775
    %AICMD0x12_Jump(pAIScripting0x0E_L111)                                   ;B3F77D
pAIScripting0x0E_L110:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event6, $04, pAIScripting0x0E_L125)   ;B3F780
    %AICMD0x1A($0138, $0148, aAIScriptingData_L071, $03)                     ;B3F787
pAIScripting0x0E_L111:
    %AICMD0x2D_JumpOnInteract(pAIScripting0x0E_L114, pAIScripting0x0E_L120)                               ;B3F78F
    %AICMD0x12_Jump(pAIScripting0x0E_L111)                                   ;B3F794
pAIScripting0x0E_L112:
    %AICMD0x2D_JumpOnInteract(pAIScripting0x0E_L124, pAIScripting0x0E_L120)                               ;B3F797
    %AICMD0x12_Jump(pAIScripting0x0E_L112)                                   ;B3F79C
pAIScripting0x0E_L113:
    %AICMD0x2D_JumpOnInteract(pAIScripting0x0E_L119, pAIScripting0x0E_L120)                               ;B3F79F
    %AICMD0x12_Jump(pAIScripting0x0E_L113)                                   ;B3F7A4
pAIScripting0x0E_L114:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $0B, pAIScripting0x0E_L115) ;B3F7A7
    %AICMD0x28_ClearBit(strcFlags.unknown1, $09)                        ;B3F7AE
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $04, pAIScripting0x0E_L119)   ;B3F7B3
    %AICMD0x45_JumpIfBetween16(nLove_Ellen, 0, 100, pAIScripting0x0E_L116)   ;B3F7BA
    %AICMD0x45_JumpIfBetween16(nLove_Ellen, 101, 300, pAIScripting0x0E_L117) ;B3F7C4
    %AICMD0x45_JumpIfBetween16(nLove_Ellen, 301, 999, pAIScripting0x0E_L118) ;B3F7CE
    %AICMD0x12_Jump(pAIScripting0x0E_L111)                                   ;B3F7D8
pAIScripting0x0E_L115:
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown1, $03)     ;B3F7DB
    %AICMD0x0B_SetScriptFlag($00)                                            ;B3F7E0
    %AICMD0x12_Jump(pAIScripting0x0E_L111)                                   ;B3F7E2
pAIScripting0x0E_L116:
    %AICMD0x1C_ShowDialog($022C, $00)                          ;B3F7E5
    %AICMD0x41_AddValue16(nLove_Ellen, 8)                      ;B3F7E9
    %AICMD0x12_Jump(pAIScripting0x0E_L112)                                   ;B3F7EF
pAIScripting0x0E_L117:
    %AICMD0x1C_ShowDialog($022D, $00)                          ;B3F7F2
    %AICMD0x41_AddValue16(nLove_Ellen, 12)                     ;B3F7F6
    %AICMD0x12_Jump(pAIScripting0x0E_L112)                                   ;B3F7FC
pAIScripting0x0E_L118:
    %AICMD0x1C_ShowDialog($022E, $00)                          ;B3F7FF
    %AICMD0x41_AddValue16(nLove_Ellen, 15)                     ;B3F803
    %AICMD0x12_Jump(pAIScripting0x0E_L112)                                   ;B3F809
pAIScripting0x0E_L119:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $0B, pAIScripting0x0E_L115) ;B3F80C
    %AICMD0x28_ClearBit(strcFlags.unknown1, $09)                        ;B3F813
    %AICMD0x1C_ShowDialog($022F, $00)                          ;B3F818
    %AICMD0x41_AddValue16(nLove_Ellen, 4)                      ;B3F81C
    %AICMD0x12_Jump(pAIScripting0x0E_L113)                                   ;B3F822
pAIScripting0x0E_L120:
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 89, pAIScripting0x0E_L121)             ;B3F825
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 88, pAIScripting0x0E_L122)             ;B3F82C
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 90, pAIScripting0x0E_L123)             ;B3F833
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3F83A
    %AICMD0x12_Jump(pAIScripting0x0E_L111)                                   ;B3F83E
pAIScripting0x0E_L121:
    %AICMD0x1C_ShowDialog($0212, $00)                          ;B3F841
    %AICMD0x41_AddValue16(nLove_Ellen, 15)                     ;B3F845
    %AICMD0x12_Jump(pAIScripting0x0E_L111)                                   ;B3F84B
pAIScripting0x0E_L122:
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3F84E
    %AICMD0x41_AddValue16(nLove_Ellen, 8)                      ;B3F852
    %AICMD0x12_Jump(pAIScripting0x0E_L111)                                   ;B3F858
pAIScripting0x0E_L123:
    %AICMD0x1C_ShowDialog($01DA, $00)                          ;B3F85B
    %AICMD0x41_AddValue16(nLove_Ellen, 6)                      ;B3F85F
    %AICMD0x12_Jump(pAIScripting0x0E_L111)                                   ;B3F865
pAIScripting0x0E_L124:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $0B, pAIScripting0x0E_L115) ;B3F868
    %AICMD0x28_ClearBit(strcFlags.unknown1, $09)                        ;B3F86F
    %AICMD0x1C_ShowDialog($0364, $00)                          ;B3F874
    %AICMD0x12_Jump(pAIScripting0x0E_L112)                                   ;B3F878
pAIScripting0x0E_L125:
    %AICMD0x28_ClearBit(strcFlags.unknown1, $09)                        ;B3F87B
    %AICMD0x10_End()                                           ;B3F880
pAIScripting0x0E_L126:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $04, pAIScripting0x0E_L127)   ;B3F881
    %AICMD0x1A($0118, $0158, aAIScriptingData_L024, $00)                     ;B3F888
    %AICMD0x12_Jump(pAIScripting0x0E_L128)                                   ;B3F890
pAIScripting0x0E_L127:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event6, $04, pAIScripting0x0E_L142)   ;B3F893
    %AICMD0x1A($0118, $0158, aAIScriptingData_L071, $00)                     ;B3F89A
pAIScripting0x0E_L128:
    %AICMD0x2D_JumpOnInteract(pAIScripting0x0E_L131, pAIScripting0x0E_L137)                               ;B3F8A2
    %AICMD0x12_Jump(pAIScripting0x0E_L128)                                   ;B3F8A7
pAIScripting0x0E_L129:
    %AICMD0x2D_JumpOnInteract(pAIScripting0x0E_L141, pAIScripting0x0E_L137)                               ;B3F8AA
    %AICMD0x12_Jump(pAIScripting0x0E_L129)                                   ;B3F8AF
pAIScripting0x0E_L130:
    %AICMD0x2D_JumpOnInteract(pAIScripting0x0E_L136, pAIScripting0x0E_L137)                               ;B3F8B2
    %AICMD0x12_Jump(pAIScripting0x0E_L130)                                   ;B3F8B7
pAIScripting0x0E_L131:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $0B, pAIScripting0x0E_L132) ;B3F8BA
    %AICMD0x28_ClearBit(strcFlags.unknown1, $0A)                        ;B3F8C1
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $04, pAIScripting0x0E_L136)   ;B3F8C6
    %AICMD0x45_JumpIfBetween16(nLove_Eve, 0, 100, pAIScripting0x0E_L133)     ;B3F8CD
    %AICMD0x45_JumpIfBetween16(nLove_Eve, 101, 300, pAIScripting0x0E_L134)   ;B3F8D7
    %AICMD0x45_JumpIfBetween16(nLove_Eve, 301, 999, pAIScripting0x0E_L135)   ;B3F8E1
    %AICMD0x12_Jump(pAIScripting0x0E_L128)                                   ;B3F8EB
pAIScripting0x0E_L132:
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown1, $04)     ;B3F8EE
    %AICMD0x0B_SetScriptFlag($00)                                            ;B3F8F3
    %AICMD0x12_Jump(pAIScripting0x0E_L128)                                   ;B3F8F5
pAIScripting0x0E_L133:
    %AICMD0x1C_ShowDialog($0230, $00)                          ;B3F8F8
    %AICMD0x41_AddValue16(nLove_Eve, 8)                        ;B3F8FC
    %AICMD0x12_Jump(pAIScripting0x0E_L129)                                   ;B3F902
pAIScripting0x0E_L134:
    %AICMD0x1C_ShowDialog($0231, $00)                          ;B3F905
    %AICMD0x41_AddValue16(nLove_Eve, 12)                       ;B3F909
    %AICMD0x12_Jump(pAIScripting0x0E_L129)                                   ;B3F90F
pAIScripting0x0E_L135:
    %AICMD0x1C_ShowDialog($0232, $00)                          ;B3F912
    %AICMD0x41_AddValue16(nLove_Eve, 15)                       ;B3F916
    %AICMD0x12_Jump(pAIScripting0x0E_L129)                                   ;B3F91C
pAIScripting0x0E_L136:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $0B, pAIScripting0x0E_L132) ;B3F91F
    %AICMD0x28_ClearBit(strcFlags.unknown1, $0A)                        ;B3F926
    %AICMD0x1C_ShowDialog($0233, $00)                          ;B3F92B
    %AICMD0x12_Jump(pAIScripting0x0E_L130)                                   ;B3F92F
pAIScripting0x0E_L137:
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 89, pAIScripting0x0E_L138)             ;B3F932
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 88, pAIScripting0x0E_L139)             ;B3F939
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 90, pAIScripting0x0E_L140)             ;B3F940
    %AICMD0x12_Jump(pAIScripting0x0E_L129)                                   ;B3F947
pAIScripting0x0E_L138:
    %AICMD0x1C_ShowDialog($0212, $00)                          ;B3F94A
    %AICMD0x41_AddValue16(nLove_Eve, 12)                       ;B3F94E
    %AICMD0x12_Jump(pAIScripting0x0E_L128)                                   ;B3F954
pAIScripting0x0E_L139:
    %AICMD0x1C_ShowDialog($01DA, $00)                          ;B3F957
    %AICMD0x41_AddValue16(nLove_Eve, 4)                        ;B3F95B
    %AICMD0x12_Jump(pAIScripting0x0E_L128)                                   ;B3F961
pAIScripting0x0E_L140:
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3F964
    %AICMD0x41_AddValue16(nLove_Eve, 8)                        ;B3F968
    %AICMD0x12_Jump(pAIScripting0x0E_L128)                                   ;B3F96E
pAIScripting0x0E_L141:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $0B, pAIScripting0x0E_L132) ;B3F971
    %AICMD0x28_ClearBit(strcFlags.unknown1, $0A)                        ;B3F978
    %AICMD0x1C_ShowDialog($0365, $00)                          ;B3F97D
    %AICMD0x12_Jump(pAIScripting0x0E_L129)                                   ;B3F981
pAIScripting0x0E_L142:
    %AICMD0x28_ClearBit(strcFlags.unknown1, $0A)                        ;B3F984
    %AICMD0x10_End()                                           ;B3F989
pAIScripting0x0E_L143:
    %AICMD0x1A($0058, $00E8, aAIScriptingData_L044, $02)                     ;B3F98A
pAIScripting0x0E_L144:
    %AICMD0x1F(pAIScripting0x0E_L146)                                        ;B3F992
    %AICMD0x12_Jump(pAIScripting0x0E_L144)                                   ;B3F995
pAIScripting0x0E_L145:
    %AICMD0x1F(pAIScripting0x0E_L147)                                        ;B3F998
    %AICMD0x12_Jump(pAIScripting0x0E_L145)                                   ;B3F99B
pAIScripting0x0E_L146:
    %AICMD0x1D_ShowDialog($0234, $00)                          ;B3F99E
    %AICMD0x20_JumpIfChoice(0, pAIScripting0x0E_L147)                        ;B3F9A2
    %AICMD0x20_JumpIfChoice(1, pAIScripting0x0E_L148)                        ;B3F9A6
    %AICMD0x12_Jump(pAIScripting0x0E_L144)                                   ;B3F9AA
pAIScripting0x0E_L147:
    %AICMD0x1C_ShowDialog($0235, $00)                          ;B3F9AD
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown1, $0B)     ;B3F9B1
    %AICMD0x12_Jump(pAIScripting0x0E_L145)                                   ;B3F9B6
pAIScripting0x0E_L148:
    %AICMD0x1C_ShowDialog($0236, $00)                          ;B3F9B9
    %AICMD0x12_Jump(pAIScripting0x0E_L144)                                   ;B3F9BD
pAIScripting0x0E_L149:
    %AICMD0x1A($00B8, $00B8, aAIScriptingData_L044, $02)                     ;B3F9C0
    %AICMD0x0C_WaitForScriptFlag($09)                                            ;B3F9C8
    %AICMD0x13_Wait(180)                                       ;B3F9CA
pAIScripting0x0E_L150:
    %AICMD0x1B($0294, $01)                                     ;B3F9CD
    %AICMD0x13_Wait(50)                                        ;B3F9D1
    %AICMD0x1B($0292, $00)                                     ;B3F9D4
    %AICMD0x13_Wait(10)                                        ;B3F9D8
    %AICMD0x1B($0294, $00)                                     ;B3F9DB
    %AICMD0x13_Wait(10)                                        ;B3F9DF
    %AICMD0x1B($0290, $00)                                     ;B3F9E2
    %AICMD0x13_Wait(10)                                        ;B3F9E6
    %AICMD0x1B($0294, $01)                                     ;B3F9E9
    %AICMD0x13_Wait(10)                                        ;B3F9ED
    %AICMD0x1B($0294, $01)                                     ;B3F9F0
    %AICMD0x0D($FF, $00, $20, $02)                             ;B3F9F4
    %AICMD0x1B($0294, $01)                                     ;B3F9F9
    %AICMD0x0D($01, $00, $20, $02)                             ;B3F9FD
    %AICMD0x1B($0294, $01)                                     ;B3FA02
    %AICMD0x0D($FF, $00, $10, $02)                             ;B3FA06
    %AICMD0x1B($0294, $01)                                     ;B3FA0B
    %AICMD0x0D($01, $00, $10, $02)                             ;B3FA0F
    %AICMD0x12_Jump(pAIScripting0x0E_L150)                                   ;B3FA14
pAIScripting0x0E_L151:
    %AICMD0x1A($00C8, $00B8, aAIScriptingData_L061, $03)                     ;B3FA17
    %AICMD0x0C_WaitForScriptFlag($09)                                            ;B3FA1F
    %AICMD0x13_Wait(180)                                       ;B3FA21
pAIScripting0x0E_L152:
    %AICMD0x1B($02C5, $00)                                     ;B3FA24
    %AICMD0x13_Wait(10)                                        ;B3FA28
    %AICMD0x1B($02C9, $01)                                     ;B3FA2B
    %AICMD0x13_Wait(10)                                        ;B3FA2F
    %AICMD0x1B($02C7, $00)                                     ;B3FA32
    %AICMD0x13_Wait(10)                                        ;B3FA36
    %AICMD0x1B($02C9, $00)                                     ;B3FA39
    %AICMD0x13_Wait(10)                                        ;B3FA3D
    %AICMD0x1B($02C5, $00)                                     ;B3FA40
    %AICMD0x13_Wait(50)                                        ;B3FA44
    %AICMD0x1B($02C9, $00)                                     ;B3FA47
    %AICMD0x0D($01, $00, $20, $02)                             ;B3FA4B
    %AICMD0x1B($02C9, $00)                                     ;B3FA50
    %AICMD0x0D($FF, $00, $20, $02)                             ;B3FA54
    %AICMD0x1B($02C9, $00)                                     ;B3FA59
    %AICMD0x0D($01, $00, $10, $02)                             ;B3FA5D
    %AICMD0x1B($02C9, $00)                                     ;B3FA62
    %AICMD0x0D($FF, $00, $10, $02)                             ;B3FA66
    %AICMD0x12_Jump(pAIScripting0x0E_L152)                                   ;B3FA6B
pAIScripting0x0E_L153:
    %AICMD0x1A($0158, $00D8, aAIScriptingData_L046, $02)                     ;B3FA6E
    %AICMD0x0C_WaitForScriptFlag($09)                                            ;B3FA76
    %AICMD0x13_Wait(180)                                       ;B3FA78
pAIScripting0x0E_L154:
    %AICMD0x1B($029B, $01)                                     ;B3FA7B
    %AICMD0x13_Wait(50)                                        ;B3FA7F
    %AICMD0x1B($0299, $00)                                     ;B3FA82
    %AICMD0x13_Wait(10)                                        ;B3FA86
    %AICMD0x1B($029B, $00)                                     ;B3FA89
    %AICMD0x13_Wait(10)                                        ;B3FA8D
    %AICMD0x1B($0297, $00)                                     ;B3FA90
    %AICMD0x13_Wait(10)                                        ;B3FA94
    %AICMD0x1B($029B, $01)                                     ;B3FA97
    %AICMD0x13_Wait(10)                                        ;B3FA9B
    %AICMD0x1B($029B, $01)                                     ;B3FA9E
    %AICMD0x0D($FF, $00, $20, $02)                             ;B3FAA2
    %AICMD0x1B($029B, $01)                                     ;B3FAA7
    %AICMD0x0D($01, $00, $20, $02)                             ;B3FAAB
    %AICMD0x1B($029B, $01)                                     ;B3FAB0
    %AICMD0x0D($FF, $00, $10, $02)                             ;B3FAB4
    %AICMD0x1B($029B, $01)                                     ;B3FAB9
    %AICMD0x0D($01, $00, $10, $02)                             ;B3FABD
    %AICMD0x12_Jump(pAIScripting0x0E_L154)                                   ;B3FAC2
pAIScripting0x0E_L155:
    %AICMD0x1A($0168, $00D8, aAIScriptingData_L064, $03)                     ;B3FAC5
    %AICMD0x0C_WaitForScriptFlag($09)                                            ;B3FACD
    %AICMD0x13_Wait(180)                                       ;B3FACF
pAIScripting0x0E_L156:
    %AICMD0x1B($02D0, $00)                                     ;B3FAD2
    %AICMD0x13_Wait(10)                                        ;B3FAD6
    %AICMD0x1B($02CF, $00)                                     ;B3FAD9
    %AICMD0x13_Wait(10)                                        ;B3FADD
    %AICMD0x1B($02D0, $01)                                     ;B3FAE0
    %AICMD0x13_Wait(10)                                        ;B3FAE4
    %AICMD0x1B($02CD, $00)                                     ;B3FAE7
    %AICMD0x13_Wait(10)                                        ;B3FAEB
    %AICMD0x1B($02D0, $00)                                     ;B3FAEE
    %AICMD0x13_Wait(50)                                        ;B3FAF2
    %AICMD0x1B($02D0, $00)                                     ;B3FAF5
    %AICMD0x0D($01, $00, $20, $02)                             ;B3FAF9
    %AICMD0x1B($02D0, $00)                                     ;B3FAFE
    %AICMD0x0D($FF, $00, $20, $02)                             ;B3FB02
    %AICMD0x1B($02D0, $00)                                     ;B3FB07
    %AICMD0x0D($01, $00, $10, $02)                             ;B3FB0B
    %AICMD0x1B($02D0, $00)                                     ;B3FB10
    %AICMD0x0D($FF, $00, $10, $02)                             ;B3FB14
    %AICMD0x12_Jump(pAIScripting0x0E_L156)                                   ;B3FB19
pAIScripting0x0E_L157:
    %AICMD0x1A($00B8, $0138, aAIScriptingData_L067, $02)                     ;B3FB1C
    %AICMD0x0C_WaitForScriptFlag($09)                                            ;B3FB24
    %AICMD0x13_Wait(180)                                       ;B3FB26
pAIScripting0x0E_L158:
    %AICMD0x1B($02D7, $01)                                     ;B3FB29
    %AICMD0x13_Wait(50)                                        ;B3FB2D
    %AICMD0x1B($02D5, $00)                                     ;B3FB30
    %AICMD0x13_Wait(10)                                        ;B3FB34
    %AICMD0x1B($02D7, $00)                                     ;B3FB37
    %AICMD0x13_Wait(10)                                        ;B3FB3B
    %AICMD0x1B($02D3, $00)                                     ;B3FB3E
    %AICMD0x13_Wait(10)                                        ;B3FB42
    %AICMD0x1B($02D7, $01)                                     ;B3FB45
    %AICMD0x13_Wait(10)                                        ;B3FB49
    %AICMD0x1B($02D7, $00)                                     ;B3FB4C
    %AICMD0x0D($01, $00, $0C, $01)                             ;B3FB50
    %AICMD0x1B($02D7, $00)                                     ;B3FB55
    %AICMD0x0D($FF, $00, $0C, $01)                             ;B3FB59
    %AICMD0x1B($02D7, $00)                                     ;B3FB5E
    %AICMD0x0D($01, $00, $08, $01)                             ;B3FB62
    %AICMD0x1B($02D7, $00)                                     ;B3FB67
    %AICMD0x0D($FF, $00, $08, $01)                             ;B3FB6B
    %AICMD0x12_Jump(pAIScripting0x0E_L158)                                   ;B3FB70
pAIScripting0x0E_L159:
    %AICMD0x1A($00C8, $0138, aAIScriptingData_L055, $03)                     ;B3FB73
    %AICMD0x0C_WaitForScriptFlag($09)                                            ;B3FB7B
    %AICMD0x13_Wait(180)                                       ;B3FB7D
pAIScripting0x0E_L160:
    %AICMD0x1B($02B6, $01)                                     ;B3FB80
    %AICMD0x13_Wait(10)                                        ;B3FB84
    %AICMD0x1B($02B4, $00)                                     ;B3FB87
    %AICMD0x13_Wait(10)                                        ;B3FB8B
    %AICMD0x1B($02B6, $00)                                     ;B3FB8E
    %AICMD0x13_Wait(10)                                        ;B3FB92
    %AICMD0x1B($02B2, $00)                                     ;B3FB95
    %AICMD0x13_Wait(10)                                        ;B3FB99
    %AICMD0x1B($02B6, $01)                                     ;B3FB9C
    %AICMD0x13_Wait(50)                                        ;B3FBA0
    %AICMD0x1B($02B6, $01)                                     ;B3FBA3
    %AICMD0x0D($FF, $00, $0C, $01)                             ;B3FBA7
    %AICMD0x1B($02B6, $01)                                     ;B3FBAC
    %AICMD0x0D($01, $00, $0C, $01)                             ;B3FBB0
    %AICMD0x1B($02B6, $01)                                     ;B3FBB5
    %AICMD0x0D($FF, $00, $08, $01)                             ;B3FBB9
    %AICMD0x1B($02B6, $01)                                     ;B3FBBE
    %AICMD0x0D($01, $00, $08, $01)                             ;B3FBC2
    %AICMD0x12_Jump(pAIScripting0x0E_L160)                                   ;B3FBC7
pAIScripting0x0E_L161:
    %AICMD0x1A($0110, $0108, aAIScriptingData_L011, $03)                     ;B3FBCA
    %AICMD0x0C_WaitForScriptFlag($09)                                            ;B3FBD2
    %AICMD0x13_Wait(200)                                       ;B3FBD4
pAIScripting0x0E_L162:
    %AICMD0x1B($0223, $00)                                     ;B3FBD7
    %AICMD0x13_Wait(10)                                        ;B3FBDB
    %AICMD0x1B($0221, $00)                                     ;B3FBDE
    %AICMD0x13_Wait(10)                                        ;B3FBE2
    %AICMD0x1B($0223, $01)                                     ;B3FBE5
    %AICMD0x13_Wait(10)                                        ;B3FBE9
    %AICMD0x1B($021F, $00)                                     ;B3FBEC
    %AICMD0x13_Wait(10)                                        ;B3FBF0
    %AICMD0x1B($0223, $00)                                     ;B3FBF3
    %AICMD0x13_Wait(50)                                        ;B3FBF7
    %AICMD0x1B($0223, $00)                                     ;B3FBFA
    %AICMD0x0D($01, $00, $20, $02)                             ;B3FBFE
    %AICMD0x1B($0223, $00)                                     ;B3FC03
    %AICMD0x0D($FF, $00, $20, $02)                             ;B3FC07
    %AICMD0x1B($0223, $00)                                     ;B3FC0C
    %AICMD0x0D($01, $00, $10, $02)                             ;B3FC10
    %AICMD0x1B($0223, $00)                                     ;B3FC15
    %AICMD0x0D($FF, $00, $10, $02)                             ;B3FC19
    %AICMD0x12_Jump(pAIScripting0x0E_L162)                                   ;B3FC1E
pAIScripting0x0E_L163:
    %AICMD0x1A($0110, $0108, aAIScriptingData_L015, $03)                     ;B3FC21
    %AICMD0x0C_WaitForScriptFlag($09)                                            ;B3FC29
    %AICMD0x13_Wait(200)                                       ;B3FC2B
pAIScripting0x0E_L164:
    %AICMD0x1B($022B, $00)                                     ;B3FC2E
    %AICMD0x13_Wait(10)                                        ;B3FC32
    %AICMD0x1B($0229, $00)                                     ;B3FC35
    %AICMD0x13_Wait(10)                                        ;B3FC39
    %AICMD0x1B($022B, $01)                                     ;B3FC3C
    %AICMD0x13_Wait(10)                                        ;B3FC40
    %AICMD0x1B($0227, $00)                                     ;B3FC43
    %AICMD0x13_Wait(10)                                        ;B3FC47
    %AICMD0x1B($022B, $00)                                     ;B3FC4A
    %AICMD0x13_Wait(50)                                        ;B3FC4E
    %AICMD0x1B($022B, $00)                                     ;B3FC51
    %AICMD0x0D($01, $00, $20, $02)                             ;B3FC55
    %AICMD0x1B($022B, $00)                                     ;B3FC5A
    %AICMD0x0D($FF, $00, $20, $02)                             ;B3FC5E
    %AICMD0x1B($022B, $00)                                     ;B3FC63
    %AICMD0x0D($01, $00, $10, $02)                             ;B3FC67
    %AICMD0x1B($022B, $00)                                     ;B3FC6C
    %AICMD0x0D($FF, $00, $10, $02)                             ;B3FC70
    %AICMD0x12_Jump(pAIScripting0x0E_L164)                                   ;B3FC75
pAIScripting0x0E_L165:
    %AICMD0x1A($0110, $0108, aAIScriptingData_L019, $03)                     ;B3FC78
    %AICMD0x0C_WaitForScriptFlag($09)                                            ;B3FC80
    %AICMD0x13_Wait(200)                                       ;B3FC82
pAIScripting0x0E_L166:
    %AICMD0x1B($0250, $00)                                     ;B3FC85
    %AICMD0x13_Wait(10)                                        ;B3FC89
    %AICMD0x1B($024E, $00)                                     ;B3FC8C
    %AICMD0x13_Wait(10)                                        ;B3FC90
    %AICMD0x1B($0250, $01)                                     ;B3FC93
    %AICMD0x13_Wait(10)                                        ;B3FC97
    %AICMD0x1B($024C, $00)                                     ;B3FC9A
    %AICMD0x13_Wait(10)                                        ;B3FC9E
    %AICMD0x1B($0250, $00)                                     ;B3FCA1
    %AICMD0x13_Wait(50)                                        ;B3FCA5
    %AICMD0x1B($0250, $00)                                     ;B3FCA8
    %AICMD0x0D($01, $00, $20, $02)                             ;B3FCAC
    %AICMD0x1B($0250, $00)                                     ;B3FCB1
    %AICMD0x0D($FF, $00, $20, $02)                             ;B3FCB5
    %AICMD0x1B($0250, $00)                                     ;B3FCBA
    %AICMD0x0D($01, $00, $10, $02)                             ;B3FCBE
    %AICMD0x1B($0250, $00)                                     ;B3FCC3
    %AICMD0x0D($FF, $00, $10, $02)                             ;B3FCC7
    %AICMD0x12_Jump(pAIScripting0x0E_L166)                                   ;B3FCCC
pAIScripting0x0E_L167:
    %AICMD0x1A($0110, $0108, aAIScriptingData_L021, $03)                     ;B3FCCF
    %AICMD0x0C_WaitForScriptFlag($09)                                            ;B3FCD7
    %AICMD0x13_Wait(200)                                       ;B3FCD9
pAIScripting0x0E_L168:
    %AICMD0x1B($0241, $00)                                     ;B3FCDC
    %AICMD0x13_Wait(10)                                        ;B3FCE0
    %AICMD0x1B($023F, $00)                                     ;B3FCE3
    %AICMD0x13_Wait(10)                                        ;B3FCE7
    %AICMD0x1B($0241, $01)                                     ;B3FCEA
    %AICMD0x13_Wait(10)                                        ;B3FCEE
    %AICMD0x1B($023D, $00)                                     ;B3FCF1
    %AICMD0x13_Wait(10)                                        ;B3FCF5
    %AICMD0x1B($0241, $00)                                     ;B3FCF8
    %AICMD0x13_Wait(50)                                        ;B3FCFC
    %AICMD0x1B($0241, $00)                                     ;B3FCFF
    %AICMD0x0D($01, $00, $20, $02)                             ;B3FD03
    %AICMD0x1B($0241, $00)                                     ;B3FD08
    %AICMD0x0D($FF, $00, $20, $02)                             ;B3FD0C
    %AICMD0x1B($0241, $00)                                     ;B3FD11
    %AICMD0x0D($01, $00, $10, $02)                             ;B3FD15
    %AICMD0x1B($0241, $00)                                     ;B3FD1A
    %AICMD0x0D($FF, $00, $10, $02)                             ;B3FD1E
    %AICMD0x12_Jump(pAIScripting0x0E_L168)                                   ;B3FD23
pAIScripting0x0E_L169:
    %AICMD0x1A($0110, $0108, aAIScriptingData_L024, $03)                     ;B3FD26
    %AICMD0x0C_WaitForScriptFlag($09)                                            ;B3FD2E
    %AICMD0x13_Wait(200)                                       ;B3FD30
pAIScripting0x0E_L170:
    %AICMD0x1B($0249, $00)                                     ;B3FD33
    %AICMD0x13_Wait(10)                                        ;B3FD37
    %AICMD0x1B($0247, $00)                                     ;B3FD3A
    %AICMD0x13_Wait(10)                                        ;B3FD3E
    %AICMD0x1B($0249, $01)                                     ;B3FD41
    %AICMD0x13_Wait(10)                                        ;B3FD45
    %AICMD0x1B($0245, $00)                                     ;B3FD48
    %AICMD0x13_Wait(10)                                        ;B3FD4C
    %AICMD0x1B($0249, $00)                                     ;B3FD4F
    %AICMD0x13_Wait(50)                                        ;B3FD53
    %AICMD0x1B($0249, $00)                                     ;B3FD56
    %AICMD0x0D($01, $00, $20, $02)                             ;B3FD5A
    %AICMD0x1B($0249, $00)                                     ;B3FD5F
    %AICMD0x0D($FF, $00, $20, $02)                             ;B3FD63
    %AICMD0x1B($0249, $00)                                     ;B3FD68
    %AICMD0x0D($01, $00, $10, $02)                             ;B3FD6C
    %AICMD0x1B($0249, $00)                                     ;B3FD71
    %AICMD0x0D($FF, $00, $10, $02)                             ;B3FD75
    %AICMD0x12_Jump(pAIScripting0x0E_L170)                                   ;B3FD7A
pAIScripting0x0E_L171:
    %AICMD0x1A($0110, $0108, aAIScriptingData_L071, $03)                     ;B3FD7D
    %AICMD0x0C_WaitForScriptFlag($09)                                            ;B3FD85
    %AICMD0x13_Wait(200)                                       ;B3FD87
pAIScripting0x0E_L172:
    %AICMD0x1B($02E7, $00)                                     ;B3FD8A
    %AICMD0x13_Wait(10)                                        ;B3FD8E
    %AICMD0x1B($02E5, $00)                                     ;B3FD91
    %AICMD0x13_Wait(10)                                        ;B3FD95
    %AICMD0x1B($02E7, $01)                                     ;B3FD98
    %AICMD0x13_Wait(10)                                        ;B3FD9C
    %AICMD0x1B($02E3, $00)                                     ;B3FD9F
    %AICMD0x13_Wait(10)                                        ;B3FDA3
    %AICMD0x1B($02E7, $00)                                     ;B3FDA6
    %AICMD0x13_Wait(50)                                        ;B3FDAA
    %AICMD0x1B($02E7, $00)                                     ;B3FDAD
    %AICMD0x0D($01, $00, $20, $02)                             ;B3FDB1
    %AICMD0x1B($02E7, $00)                                     ;B3FDB6
    %AICMD0x0D($FF, $00, $20, $02)                             ;B3FDBA
    %AICMD0x1B($02E7, $00)                                     ;B3FDBF
    %AICMD0x0D($01, $00, $10, $02)                             ;B3FDC3
    %AICMD0x1B($02E7, $00)                                     ;B3FDC8
    %AICMD0x0D($FF, $00, $10, $02)                             ;B3FDCC
    %AICMD0x12_Jump(pAIScripting0x0E_L172)                                   ;B3FDD1


pAIScripting0x0E_Data02:
 
    %AICMD0x4F_DisableToolUse()                                               ;B3FDD4
    %AICMD0x50()                                               ;B3FDD5
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $09)       ;B3FDD6
    %AICMD0x00_SetMusic($08, $B4)                              ;B3FDDB
    %AICMD0x02_FreezeTime()                                    ;B3FDDE
    %AICMD0x03_SetHour($07)                                    ;B3FDDF
    %AICMD0x05_SetTransferPosition(264, 264)                   ;B3FDE1
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B3FDE6
    %AICMD0x08_EnableAIControl()                               ;B3FDE8
    %AICMD0x19($00E8, $00)                                     ;B3FDE9
    %AICMD0x09_StartScript($01, pAIScripting0x0E_L149)                                   ;B3FDED
    %AICMD0x09_StartScript($02, pAIScripting0x0E_L151)                                   ;B3FDF1
    %AICMD0x09_StartScript($03, pAIScripting0x0E_L153)                                   ;B3FDF5
    %AICMD0x09_StartScript($04, pAIScripting0x0E_L155)                                   ;B3FDF9
    %AICMD0x09_StartScript($05, pAIScripting0x0E_L157)                                   ;B3FDFD
    %AICMD0x09_StartScript($06, pAIScripting0x0E_L159)                                   ;B3FE01
    %AICMD0x09_StartScript($08, pAIScripting0x0E_L174)                                   ;B3FE05
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $00, pAIScripting0x0E_L001) ;B3FE09
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $01, pAIScripting0x0E_L002) ;B3FE10
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $02, pAIScripting0x0E_L003) ;B3FE17
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $03, pAIScripting0x0E_L004) ;B3FE1E
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $04, pAIScripting0x0E_L005) ;B3FE25
pAIScripting0x0E_L173:
    %AICMD0x06_SetDestinationArea(!AREA_DANCINGS1)             ;B3FE2C
    %AICMD0x38_WaitForFadeIn()                                               ;B3FE2E
    %AICMD0x0B_SetScriptFlag($09)                                            ;B3FE2F
    %AICMD0x10_End()                                           ;B3FE31
pAIScripting0x0E_L174:
    %AICMD0x1A($0100, $0108, aAIScriptingData, $02)                     ;B3FE32
    %AICMD0x0C_WaitForScriptFlag($09)                                            ;B3FE3A
    %AICMD0x13_Wait(200)                                       ;B3FE3C
    %AICMD0x1B($0002, $01)                                     ;B3FE3F
    %AICMD0x13_Wait(50)                                        ;B3FE43
    %AICMD0x1B($0000, $00)                                     ;B3FE46
    %AICMD0x13_Wait(10)                                        ;B3FE4A
    %AICMD0x1B($0002, $00)                                     ;B3FE4D
    %AICMD0x13_Wait(10)                                        ;B3FE51
    %AICMD0x1B($0001, $00)                                     ;B3FE54
    %AICMD0x13_Wait(10)                                        ;B3FE58
    %AICMD0x1B($0002, $01)                                     ;B3FE5B
    %AICMD0x13_Wait(10)                                        ;B3FE5F
    %AICMD0x1B($0002, $01)                                     ;B3FE62
    %AICMD0x0D($FF, $00, $20, $02)                             ;B3FE66
    %AICMD0x1B($0002, $01)                                     ;B3FE6B
    %AICMD0x0D($01, $00, $20, $02)                             ;B3FE6F
    %AICMD0x1B($0002, $01)                                     ;B3FE74
    %AICMD0x0D($FF, $00, $10, $02)                             ;B3FE78
    %AICMD0x1B($0002, $01)                                     ;B3FE7D
    %AICMD0x0D($01, $00, $10, $02)                             ;B3FE81
    %AICMD0x1B($0002, $01)                                     ;B3FE86
    %AICMD0x13_Wait(50)                                        ;B3FE8A
    %AICMD0x1B($0000, $00)                                     ;B3FE8D
    %AICMD0x13_Wait(10)                                        ;B3FE91
    %AICMD0x1B($0002, $00)                                     ;B3FE94
    %AICMD0x13_Wait(10)                                        ;B3FE98
    %AICMD0x1B($0001, $00)                                     ;B3FE9B
    %AICMD0x13_Wait(10)                                        ;B3FE9F
    %AICMD0x1B($0002, $01)                                     ;B3FEA2
    %AICMD0x13_Wait(10)                                        ;B3FEA6
    %AICMD0x1B($0002, $01)                                     ;B3FEA9
    %AICMD0x0D($FF, $00, $20, $02)                             ;B3FEAD
    %AICMD0x1B($0002, $01)                                     ;B3FEB2
    %AICMD0x0D($01, $00, $20, $02)                             ;B3FEB6
    %AICMD0x1B($0002, $01)                                     ;B3FEBB
    %AICMD0x0D($FF, $00, $10, $02)                             ;B3FEBF
    %AICMD0x1B($0002, $01)                                     ;B3FEC4
    %AICMD0x0D($01, $00, $10, $02)                             ;B3FEC8
    %AICMD0x1B($0002, $01)                                     ;B3FECD
    %AICMD0x13_Wait(50)                                        ;B3FED1
    %AICMD0x1B($0000, $00)                                     ;B3FED4
    %AICMD0x13_Wait(10)                                        ;B3FED8
    %AICMD0x1B($0002, $00)                                     ;B3FEDB
    %AICMD0x13_Wait(10)                                        ;B3FEDF
    %AICMD0x1B($0001, $00)                                     ;B3FEE2
    %AICMD0x13_Wait(10)                                        ;B3FEE6
    %AICMD0x1B($0002, $01)                                     ;B3FEE9
    %AICMD0x13_Wait(10)                                        ;B3FEED
    %AICMD0x1B($0002, $01)                                     ;B3FEF0
    %AICMD0x0D($FF, $00, $20, $02)                             ;B3FEF4
    %AICMD0x1B($0002, $01)                                     ;B3FEF9
    %AICMD0x0D($01, $00, $20, $02)                             ;B3FEFD
    %AICMD0x1B($0002, $01)                                     ;B3FF02
    %AICMD0x0D($FF, $00, $10, $02)                             ;B3FF06
    %AICMD0x1B($0002, $01)                                     ;B3FF0B
    %AICMD0x0D($01, $00, $10, $02)                             ;B3FF0F
    %AICMD0x1B($0002, $01)                                     ;B3FF14
    %AICMD0x13_Wait(50)                                        ;B3FF18
    %AICMD0x1B($0000, $00)                                     ;B3FF1B
    %AICMD0x13_Wait(10)                                        ;B3FF1F
    %AICMD0x1B($0002, $00)                                     ;B3FF22
    %AICMD0x13_Wait(10)                                        ;B3FF26
    %AICMD0x1B($0001, $00)                                     ;B3FF29
    %AICMD0x13_Wait(10)                                        ;B3FF2D
    %AICMD0x1B($0002, $01)                                     ;B3FF30
    %AICMD0x13_Wait(10)                                        ;B3FF34
    %AICMD0x1B($0002, $01)                                     ;B3FF37
    %AICMD0x0D($FF, $00, $20, $02)                             ;B3FF3B
    %AICMD0x1B($0002, $01)                                     ;B3FF40
    %AICMD0x0D($01, $00, $20, $02)                             ;B3FF44
    %AICMD0x1B($0002, $01)                                     ;B3FF49
    %AICMD0x0D($FF, $00, $10, $02)                             ;B3FF4D
    %AICMD0x1B($0002, $01)                                     ;B3FF52
    %AICMD0x0D($01, $00, $10, $02)                             ;B3FF56
    %AICMD0x1B($0002, $01)                                     ;B3FF5B
    %AICMD0x13_Wait(50)                                        ;B3FF5F
    %AICMD0x1B($0000, $00)                                     ;B3FF62
    %AICMD0x13_Wait(10)                                        ;B3FF66
    %AICMD0x1B($0002, $00)                                     ;B3FF69
    %AICMD0x13_Wait(10)                                        ;B3FF6D
    %AICMD0x1B($0001, $00)                                     ;B3FF70
    %AICMD0x13_Wait(10)                                        ;B3FF74
    %AICMD0x1B($0002, $01)                                     ;B3FF77
    %AICMD0x13_Wait(10)                                        ;B3FF7B
    %AICMD0x1B($0002, $01)                                     ;B3FF7E
    %AICMD0x0D($FF, $00, $20, $02)                             ;B3FF82
    %AICMD0x1B($0002, $01)                                     ;B3FF87
    %AICMD0x0D($01, $00, $20, $02)                             ;B3FF8B
    %AICMD0x1B($0002, $01)                                     ;B3FF90
    %AICMD0x0D($FF, $00, $10, $02)                             ;B3FF94
    %AICMD0x1B($0002, $01)                                     ;B3FF99
    %AICMD0x0D($01, $00, $10, $02)                             ;B3FF9D
    %AICMD0x3C()                                               ;B3FFA2
    %AICMD0x10_End()                                           ;B3FFA3


pAIScripting0x0E_Data03:
 
    %AICMD0x00_SetMusic($00, $00)                              ;B3FFA4


    pad $B3FFFF
