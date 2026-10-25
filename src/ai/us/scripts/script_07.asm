

pAIScripting0x07:
    dw pAIScripting0x07_Data01                                            ;B3D9F7|        |B3DA17;
    dw pAIScripting0x07_Data02                                            ;B3D9F9|        |B3DB72;
    dw pAIScripting0x07_Data03                                            ;B3D9FB|        |B3DBD5;
    dw pAIScripting0x07_Data04                                            ;B3D9FD|        |B3DCD1;
    dw pAIScripting0x07_Data05                                            ;B3D9FF|        |B3DDC7;
    dw pAIScripting0x07_Data06                                            ;B3DA01|        |B3DF0F;
    dw pAIScripting0x07_Data07                                            ;B3DA03|        |B3DFCE;
    dw pAIScripting0x07_Data08                                            ;B3DA05|        |B3E037;
    dw pAIScripting0x08                                        ;B3DA07|        |B3E0BF;
    dw pAIScripting0x08                                        ;B3DA09|        |B3E0BF;
    dw pAIScripting0x08                                        ;B3DA0B|        |B3E0BF;
    dw pAIScripting0x08                                        ;B3DA0D|        |B3E0BF;
    dw pAIScripting0x08                                        ;B3DA0F|        |B3E0BF;
    dw pAIScripting0x08                                        ;B3DA11|        |B3E0BF;
    dw pAIScripting0x08                                        ;B3DA13|        |B3E0BF;
    dw pAIScripting0x08                                        ;B3DA15|        |B3E0BF;
 
pAIScripting0x07_Data01:
 
    %AICMD0x11_EnableUserControl()                             ;B3DA17
    %AICMD0x09_StartScript($01, pAIScripting0x07_L004)                                   ;B3DA18
    %AICMD0x09_StartScript($02, pAIScripting0x07_L012)                                   ;B3DA1C
    %AICMD0x12_Jump(pAIScripting0x07_L002)                                   ;B3DA20
pAIScripting0x07_L001:
    %AICMD0x13_Wait(1)                                         ;B3DA23
    %AICMD0x12_Jump(pAIScripting0x07_L001)                                   ;B3DA26
pAIScripting0x07_L002:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $00, pAIScripting0x07_L003)   ;B3DA29
    %AICMD0x14_JumpIfFlagSet(strcFlags.event4, $0C, pAIScripting0x07_L003)   ;B3DA30
    %AICMD0x09_StartScript($03, pAIScripting0x07_L020)                                   ;B3DA37
pAIScripting0x07_L003:
    %AICMD0x12_Jump(pAIScripting0x07_L001)                                   ;B3DA3B
pAIScripting0x07_L004:
    %AICMD0x1A($00C8, $0078, aAIScriptingData_L044, $00)                     ;B3DA3E
pAIScripting0x07_L005:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x07_L007)                                        ;B3DA46
    %AICMD0x2D_JumpOnInteract(pAIScripting0x07_L008, pAIScripting0x07_L006)                               ;B3DA49
    %AICMD0x12_Jump(pAIScripting0x07_L005)                                   ;B3DA4E
pAIScripting0x07_L006:
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3DA51
    %AICMD0x12_Jump(pAIScripting0x07_L005)                                   ;B3DA55
pAIScripting0x07_L007:
    %AICMD0x1C_ShowDialog($01C9, $00)                          ;B3DA58
    %AICMD0x12_Jump(pAIScripting0x07_L005)                                   ;B3DA5C
pAIScripting0x07_L008:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event4, $0C, pAIScripting0x07_L009)   ;B3DA5F
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 23, pAIScripting0x07_L010)         ;B3DA66
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 30, pAIScripting0x07_L011)         ;B3DA6D
    %AICMD0x1C_ShowDialog($0393, $00)                          ;B3DA74
    %AICMD0x12_Jump(pAIScripting0x07_L005)                                   ;B3DA78
pAIScripting0x07_L009:
    %AICMD0x1C_ShowDialog($01CD, $00)                          ;B3DA7B
    %AICMD0x12_Jump(pAIScripting0x07_L005)                                   ;B3DA7F
pAIScripting0x07_L010:
    %AICMD0x1C_ShowDialog($02AD, $00)                          ;B3DA82
    %AICMD0x12_Jump(pAIScripting0x07_L005)                                   ;B3DA86
pAIScripting0x07_L011:
    %AICMD0x1C_ShowDialog($03EC, $00)                          ;B3DA89
    %AICMD0x41_AddValue16(nPlayerHappiness, 5)                 ;B3DA8D
    %AICMD0x12_Jump(pAIScripting0x07_L005)                                   ;B3DA93
pAIScripting0x07_L012:
    %AICMD0x1A($0188, $00A0, aAIScriptingData_L063, $00)                     ;B3DA96
pAIScripting0x07_L013:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x07_L015)                                        ;B3DA9E
    %AICMD0x2D_JumpOnInteract(pAIScripting0x07_L016, pAIScripting0x07_L014)                               ;B3DAA1
    %AICMD0x12_Jump(pAIScripting0x07_L013)                                   ;B3DAA6
pAIScripting0x07_L014:
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3DAA9
    %AICMD0x12_Jump(pAIScripting0x07_L013)                                   ;B3DAAD
pAIScripting0x07_L015:
    %AICMD0x1C_ShowDialog($01C6, $00)                          ;B3DAB0
    %AICMD0x12_Jump(pAIScripting0x07_L013)                                   ;B3DAB4
pAIScripting0x07_L016:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event4, $0C, pAIScripting0x07_L017)   ;B3DAB7
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 23, pAIScripting0x07_L018)         ;B3DABE
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 30, pAIScripting0x07_L019)         ;B3DAC5
    %AICMD0x1C_ShowDialog($003F, $00)                          ;B3DACC
    %AICMD0x12_Jump(pAIScripting0x07_L013)                                   ;B3DAD0
pAIScripting0x07_L017:
    %AICMD0x1C_ShowDialog($01CE, $00)                          ;B3DAD3
    %AICMD0x12_Jump(pAIScripting0x07_L013)                                   ;B3DAD7
pAIScripting0x07_L018:
    %AICMD0x1C_ShowDialog($02AE, $00)                          ;B3DADA
    %AICMD0x12_Jump(pAIScripting0x07_L013)                                   ;B3DADE
pAIScripting0x07_L019:
    %AICMD0x1C_ShowDialog($03ED, $00)                          ;B3DAE1
    %AICMD0x41_AddValue16(nPlayerHappiness, 5)                 ;B3DAE5
    %AICMD0x12_Jump(pAIScripting0x07_L013)                                   ;B3DAEB
pAIScripting0x07_L020:
    %AICMD0x1A($0048, $0198, aAIScriptingData_L011, $00)                     ;B3DAEE
pAIScripting0x07_L021:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x07_L022)                                        ;B3DAF6
    %AICMD0x2D_JumpOnInteract(pAIScripting0x07_L024, pAIScripting0x07_L027)                               ;B3DAF9
    %AICMD0x12_Jump(pAIScripting0x07_L021)                                   ;B3DAFE
pAIScripting0x07_L022:
    %AICMD0x45_JumpIfBetween16(nLove_Maria, 0, 249, pAIScripting0x07_L023)   ;B3DB01
    %AICMD0x1C_ShowDialog($043D, $00)                          ;B3DB0B
    %AICMD0x12_Jump(pAIScripting0x07_L021)                                   ;B3DB0F
pAIScripting0x07_L023:
    %AICMD0x1C_ShowDialog($0174, $00)                          ;B3DB12
    %AICMD0x12_Jump(pAIScripting0x07_L021)                                   ;B3DB16
pAIScripting0x07_L024:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 23, pAIScripting0x07_L025)         ;B3DB19
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 30, pAIScripting0x07_L026)         ;B3DB20
    %AICMD0x1C_ShowDialog($039A, $00)                          ;B3DB27
    %AICMD0x12_Jump(pAIScripting0x07_L021)                                   ;B3DB2B
pAIScripting0x07_L025:
    %AICMD0x1C_ShowDialog($02AF, $00)                          ;B3DB2E
    %AICMD0x12_Jump(pAIScripting0x07_L021)                                   ;B3DB32
pAIScripting0x07_L026:
    %AICMD0x1C_ShowDialog($03F8, $00)                          ;B3DB35
    %AICMD0x41_AddValue16(nLove_Maria, 5)                      ;B3DB39
    %AICMD0x12_Jump(pAIScripting0x07_L021)                                   ;B3DB3F
pAIScripting0x07_L027:
    %AICMD0x15_JumpIfEquals8($80091E, 86, pAIScripting0x07_L028)             ;B3DB42
    %AICMD0x16_JumpIfBetween8($80091E, 16, 23, pAIScripting0x07_L029)        ;B3DB49
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3DB51
    %AICMD0x12_Jump(pAIScripting0x07_L021)                                   ;B3DB55
pAIScripting0x07_L028:
    %AICMD0x1C_ShowDialog($03B5, $00)                          ;B3DB58
    %AICMD0x41_AddValue16(nLove_Maria, 3)                      ;B3DB5C
    %AICMD0x12_Jump(pAIScripting0x07_L021)                                   ;B3DB62
pAIScripting0x07_L029:
    %AICMD0x1C_ShowDialog($03B2, $00)                          ;B3DB65
    %AICMD0x41_AddValue16(nLove_Maria, 5)                      ;B3DB69
    %AICMD0x12_Jump(pAIScripting0x07_L021)                                   ;B3DB6F


pAIScripting0x07_Data02:
 
    %AICMD0x11_EnableUserControl()                             ;B3DB72
    %AICMD0x09_StartScript($01, pAIScripting0x07_L031)                                   ;B3DB73
pAIScripting0x07_L030:
    %AICMD0x13_Wait(1)                                         ;B3DB77
    %AICMD0x12_Jump(pAIScripting0x07_L030)                                   ;B3DB7A
pAIScripting0x07_L031:
    %AICMD0x1A($0068, $00E8, aAIScriptingData_L051, $00)                     ;B3DB7D
pAIScripting0x07_L032:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x07_L034)                                        ;B3DB85
    %AICMD0x2D_JumpOnInteract(pAIScripting0x07_L035, pAIScripting0x07_L033)                               ;B3DB88
    %AICMD0x12_Jump(pAIScripting0x07_L032)                                   ;B3DB8D
pAIScripting0x07_L033:
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3DB90
    %AICMD0x12_Jump(pAIScripting0x07_L032)                                   ;B3DB94
pAIScripting0x07_L034:
    %AICMD0x1C_ShowDialog($01E0, $00)                          ;B3DB97
    %AICMD0x12_Jump(pAIScripting0x07_L032)                                   ;B3DB9B
pAIScripting0x07_L035:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event4, $0C, pAIScripting0x07_L036)   ;B3DB9E
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 23, pAIScripting0x07_L037)         ;B3DBA5
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 30, pAIScripting0x07_L038)         ;B3DBAC
    %AICMD0x1C_ShowDialog($0397, $00)                          ;B3DBB3
    %AICMD0x12_Jump(pAIScripting0x07_L032)                                   ;B3DBB7
pAIScripting0x07_L036:
    %AICMD0x1C_ShowDialog($01CF, $00)                          ;B3DBBA
    %AICMD0x12_Jump(pAIScripting0x07_L032)                                   ;B3DBBE
pAIScripting0x07_L037:
    %AICMD0x1C_ShowDialog($0405, $00)                          ;B3DBC1
    %AICMD0x12_Jump(pAIScripting0x07_L032)                                   ;B3DBC5
pAIScripting0x07_L038:
    %AICMD0x1C_ShowDialog($03F0, $00)                          ;B3DBC8
    %AICMD0x41_AddValue16(nPlayerHappiness, 5)                 ;B3DBCC
    %AICMD0x12_Jump(pAIScripting0x07_L032)                                   ;B3DBD2


pAIScripting0x07_Data03:
 
    %AICMD0x11_EnableUserControl()                             ;B3DBD5
    %AICMD0x09_StartScript($01, pAIScripting0x07_L042)                                   ;B3DBD6
    %AICMD0x12_Jump(pAIScripting0x07_L040)                                   ;B3DBDA
pAIScripting0x07_L039:
    %AICMD0x13_Wait(1)                                         ;B3DBDD
    %AICMD0x12_Jump(pAIScripting0x07_L039)                                   ;B3DBE0
pAIScripting0x07_L040:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, pAIScripting0x07_L041)   ;B3DBE3
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $00, pAIScripting0x07_L041)   ;B3DBEA
    %AICMD0x09_StartScript($02, pAIScripting0x07_L049)                                   ;B3DBF1
pAIScripting0x07_L041:
    %AICMD0x12_Jump(pAIScripting0x07_L039)                                   ;B3DBF5
pAIScripting0x07_L042:
    %AICMD0x1A($0028, $0168, aAIScriptingData_L064, $02)                     ;B3DBF8
pAIScripting0x07_L043:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x07_L045)                                        ;B3DC00
    %AICMD0x2D_JumpOnInteract(pAIScripting0x07_L046, pAIScripting0x07_L044)                               ;B3DC03
    %AICMD0x12_Jump(pAIScripting0x07_L043)                                   ;B3DC08
pAIScripting0x07_L044:
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3DC0B
    %AICMD0x12_Jump(pAIScripting0x07_L043)                                   ;B3DC0F
pAIScripting0x07_L045:
    %AICMD0x1C_ShowDialog($01C6, $00)                          ;B3DC12
    %AICMD0x12_Jump(pAIScripting0x07_L043)                                   ;B3DC16
pAIScripting0x07_L046:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 23, pAIScripting0x07_L047)         ;B3DC19
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 30, pAIScripting0x07_L048)         ;B3DC20
    %AICMD0x1C_ShowDialog($0394, $00)                          ;B3DC27
    %AICMD0x12_Jump(pAIScripting0x07_L043)                                   ;B3DC2B
pAIScripting0x07_L047:
    %AICMD0x1C_ShowDialog($02AE, $00)                          ;B3DC2E
    %AICMD0x1B($02D0, $01)                                     ;B3DC32
    %AICMD0x12_Jump(pAIScripting0x07_L043)                                   ;B3DC36
pAIScripting0x07_L048:
    %AICMD0x1C_ShowDialog($03EF, $00)                          ;B3DC39
    %AICMD0x1B($02D0, $01)                                     ;B3DC3D
    %AICMD0x41_AddValue16(nPlayerHappiness, 5)                 ;B3DC41
    %AICMD0x12_Jump(pAIScripting0x07_L043)                                   ;B3DC47
pAIScripting0x07_L049:
    %AICMD0x1A($0068, $0098, aAIScriptingData_L019, $00)                     ;B3DC4A
    %AICMD0x12_Jump(pAIScripting0x07_L050)                                   ;B3DC52
pAIScripting0x07_L050:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x07_L051)                                        ;B3DC55
    %AICMD0x2D_JumpOnInteract(pAIScripting0x07_L056, pAIScripting0x07_L053)                               ;B3DC58
    %AICMD0x12_Jump(pAIScripting0x07_L050)                                   ;B3DC5D
pAIScripting0x07_L051:
    %AICMD0x45_JumpIfBetween16(nLove_Nina, 0, 249, pAIScripting0x07_L052)    ;B3DC60
    %AICMD0x1C_ShowDialog($043F, $00)                          ;B3DC6A
    %AICMD0x12_Jump(pAIScripting0x07_L050)                                   ;B3DC6E
pAIScripting0x07_L052:
    %AICMD0x1C_ShowDialog($0178, $00)                          ;B3DC71
    %AICMD0x12_Jump(pAIScripting0x07_L050)                                   ;B3DC75
pAIScripting0x07_L053:
    %AICMD0x15_JumpIfEquals8($80091E, 6, pAIScripting0x07_L055)              ;B3DC78
    %AICMD0x16_JumpIfBetween8($80091E, 16, 23, pAIScripting0x07_L054)        ;B3DC7F
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3DC87
    %AICMD0x12_Jump(pAIScripting0x07_L050)                                   ;B3DC8B
pAIScripting0x07_L054:
    %AICMD0x1C_ShowDialog($03B2, $00)                          ;B3DC8E
    %AICMD0x41_AddValue16(nLove_Nina, 2)                       ;B3DC92
    %AICMD0x12_Jump(pAIScripting0x07_L050)                                   ;B3DC98
pAIScripting0x07_L055:
    %AICMD0x1C_ShowDialog($0212, $00)                          ;B3DC9B
    %AICMD0x41_AddValue16(nLove_Nina, 8)                       ;B3DC9F
    %AICMD0x12_Jump(pAIScripting0x07_L050)                                   ;B3DCA5
pAIScripting0x07_L056:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 23, pAIScripting0x07_L057)         ;B3DCA8
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 30, pAIScripting0x07_L058)         ;B3DCAF
    %AICMD0x1C_ShowDialog($039C, $00)                          ;B3DCB6
    %AICMD0x12_Jump(pAIScripting0x07_L050)                                   ;B3DCBA
pAIScripting0x07_L057:
    %AICMD0x1C_ShowDialog($02B1, $00)                          ;B3DCBD
    %AICMD0x12_Jump(pAIScripting0x07_L050)                                   ;B3DCC1
pAIScripting0x07_L058:
    %AICMD0x1C_ShowDialog($03FA, $00)                          ;B3DCC4
    %AICMD0x41_AddValue16(nLove_Nina, 5)                       ;B3DCC8
    %AICMD0x12_Jump(pAIScripting0x07_L050)                                   ;B3DCCE


pAIScripting0x07_Data04:
 
    %AICMD0x11_EnableUserControl()                             ;B3DCD1
    %AICMD0x09_StartScript($01, pAIScripting0x07_L062)                                   ;B3DCD2
    %AICMD0x12_Jump(pAIScripting0x07_L060)                                   ;B3DCD6
pAIScripting0x07_L059:
    %AICMD0x13_Wait(1)                                         ;B3DCD9
    %AICMD0x12_Jump(pAIScripting0x07_L059)                                   ;B3DCDC
pAIScripting0x07_L060:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $01, pAIScripting0x07_L061)   ;B3DCDF
    %AICMD0x09_StartScript($02, pAIScripting0x07_L069)                                   ;B3DCE6
pAIScripting0x07_L061:
    %AICMD0x12_Jump(pAIScripting0x07_L059)                                   ;B3DCEA
pAIScripting0x07_L062:
    %AICMD0x1A($0028, $0168, aAIScriptingData_L046, $02)                     ;B3DCED
pAIScripting0x07_L063:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x07_L065)                                        ;B3DCF5
    %AICMD0x2D_JumpOnInteract(pAIScripting0x07_L066, pAIScripting0x07_L064)                               ;B3DCF8
    %AICMD0x12_Jump(pAIScripting0x07_L063)                                   ;B3DCFD
pAIScripting0x07_L064:
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3DD00
    %AICMD0x12_Jump(pAIScripting0x07_L063)                                   ;B3DD04
pAIScripting0x07_L065:
    %AICMD0x1C_ShowDialog($01CA, $00)                          ;B3DD07
    %AICMD0x12_Jump(pAIScripting0x07_L063)                                   ;B3DD0B
pAIScripting0x07_L066:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event4, $0E, pAIScripting0x07_L067)   ;B3DD0E
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 30, pAIScripting0x07_L068)         ;B3DD15
    %AICMD0x1C_ShowDialog($0079, $00)                          ;B3DD1C
    %AICMD0x1B($029A, $01)                                     ;B3DD20
    %AICMD0x12_Jump(pAIScripting0x07_L063)                                   ;B3DD24
pAIScripting0x07_L067:
    %AICMD0x1C_ShowDialog($01DC, $00)                          ;B3DD27
    %AICMD0x12_Jump(pAIScripting0x07_L063)                                   ;B3DD2B
pAIScripting0x07_L068:
    %AICMD0x1C_ShowDialog($03EE, $00)                          ;B3DD2E
    %AICMD0x1B($029A, $01)                                     ;B3DD32
    %AICMD0x41_AddValue16(nPlayerHappiness, 5)                 ;B3DD36
    %AICMD0x12_Jump(pAIScripting0x07_L063)                                   ;B3DD3C
pAIScripting0x07_L069:
    %AICMD0x1A($0098, $0188, aAIScriptingData_L015, $00)                     ;B3DD3F
    %AICMD0x12_Jump(pAIScripting0x07_L070)                                   ;B3DD47
pAIScripting0x07_L070:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x07_L071)                                        ;B3DD4A
    %AICMD0x2D_JumpOnInteract(pAIScripting0x07_L075, pAIScripting0x07_L073)                               ;B3DD4D
    %AICMD0x12_Jump(pAIScripting0x07_L070)                                   ;B3DD52
pAIScripting0x07_L071:
    %AICMD0x45_JumpIfBetween16(nLove_Ann, 0, 249, pAIScripting0x07_L072)     ;B3DD55
    %AICMD0x1C_ShowDialog($043E, $00)                          ;B3DD5F
    %AICMD0x12_Jump(pAIScripting0x07_L070)                                   ;B3DD63
pAIScripting0x07_L072:
    %AICMD0x1C_ShowDialog($0176, $00)                          ;B3DD66
    %AICMD0x12_Jump(pAIScripting0x07_L070)                                   ;B3DD6A
pAIScripting0x07_L073:
    %AICMD0x15_JumpIfEquals8($80091E, 6, pAIScripting0x07_L074)              ;B3DD6D
    %AICMD0x16_JumpIfBetween8($80091E, 16, 23, pAIScripting0x07_L074)        ;B3DD74
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3DD7C
    %AICMD0x12_Jump(pAIScripting0x07_L070)                                   ;B3DD80
pAIScripting0x07_L074:
    %AICMD0x1C_ShowDialog($03B2, $00)                          ;B3DD83
    %AICMD0x41_AddValue16(nLove_Ann, 6)                        ;B3DD87
    %AICMD0x12_Jump(pAIScripting0x07_L070)                                   ;B3DD8D
pAIScripting0x07_L075:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event4, $0E, pAIScripting0x07_L076)   ;B3DD90
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 23, pAIScripting0x07_L077)         ;B3DD97
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 30, pAIScripting0x07_L078)         ;B3DD9E
    %AICMD0x1C_ShowDialog($039B, $00)                          ;B3DDA5
    %AICMD0x12_Jump(pAIScripting0x07_L070)                                   ;B3DDA9
pAIScripting0x07_L076:
    %AICMD0x1C_ShowDialog($01DE, $00)                          ;B3DDAC
    %AICMD0x12_Jump(pAIScripting0x07_L070)                                   ;B3DDB0
pAIScripting0x07_L077:
    %AICMD0x1C_ShowDialog($02B0, $00)                          ;B3DDB3
    %AICMD0x12_Jump(pAIScripting0x07_L070)                                   ;B3DDB7
pAIScripting0x07_L078:
    %AICMD0x1C_ShowDialog($03F9, $00)                          ;B3DDBA
    %AICMD0x41_AddValue16(nLove_Ann, 5)                        ;B3DDBE
    %AICMD0x12_Jump(pAIScripting0x07_L070)                                   ;B3DDC4


pAIScripting0x07_Data05:
 
    %AICMD0x11_EnableUserControl()                             ;B3DDC7
    %AICMD0x09_StartScript($01, pAIScripting0x07_L084)                                   ;B3DDC8
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $02, pAIScripting0x07_L080)   ;B3DDCC
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $03, pAIScripting0x07_L080)   ;B3DDD3
    %AICMD0x09_StartScript($03, pAIScripting0x07_L082)                                   ;B3DDDA
    %AICMD0x09_StartScript($04, pAIScripting0x07_L091)                                   ;B3DDDE
    %AICMD0x12_Jump(pAIScripting0x07_L080)                                   ;B3DDE2
pAIScripting0x07_L079:
    %AICMD0x13_Wait(1)                                         ;B3DDE5
    %AICMD0x12_Jump(pAIScripting0x07_L079)                                   ;B3DDE8
pAIScripting0x07_L080:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $03, pAIScripting0x07_L081)   ;B3DDEB
    %AICMD0x09_StartScript($02, pAIScripting0x07_L097)                                   ;B3DDF2
pAIScripting0x07_L081:
    %AICMD0x12_Jump(pAIScripting0x07_L079)                                   ;B3DDF6
pAIScripting0x07_L082:
    %AICMD0x1A($0087, $0097, aAIScriptingData_L091, $00)                     ;B3DDF9
pAIScripting0x07_L083:
    %AICMD0x13_Wait(1)                                         ;B3DE01
    %AICMD0x12_Jump(pAIScripting0x07_L083)                                   ;B3DE04
pAIScripting0x07_L084:
    %AICMD0x1A($0028, $0198, aAIScriptingData_L048, $02)                     ;B3DE07
pAIScripting0x07_L085:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x07_L087)                                        ;B3DE0F
    %AICMD0x2D_JumpOnInteract(pAIScripting0x07_L088, pAIScripting0x07_L086)                               ;B3DE12
    %AICMD0x12_Jump(pAIScripting0x07_L085)                                   ;B3DE17
pAIScripting0x07_L086:
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3DE1A
    %AICMD0x12_Jump(pAIScripting0x07_L085)                                   ;B3DE1E
pAIScripting0x07_L087:
    %AICMD0x1C_ShowDialog($01C7, $00)                          ;B3DE21
    %AICMD0x12_Jump(pAIScripting0x07_L085)                                   ;B3DE25
pAIScripting0x07_L088:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $02, pAIScripting0x07_L089)   ;B3DE28
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 30, pAIScripting0x07_L090)         ;B3DE2F
    %AICMD0x1C_ShowDialog($0395, $00)                          ;B3DE36
    %AICMD0x12_Jump(pAIScripting0x07_L085)                                   ;B3DE3A
pAIScripting0x07_L089:
    %AICMD0x1C_ShowDialog($01ED, $00)                          ;B3DE3D
    %AICMD0x12_Jump(pAIScripting0x07_L085)                                   ;B3DE41
pAIScripting0x07_L090:
    %AICMD0x1C_ShowDialog($03EC, $00)                          ;B3DE44
    %AICMD0x1B($02A1, $01)                                     ;B3DE48
    %AICMD0x41_AddValue16(nPlayerHappiness, 5)                 ;B3DE4C
    %AICMD0x12_Jump(pAIScripting0x07_L085)                                   ;B3DE52
pAIScripting0x07_L091:
    %AICMD0x1A($0098, $0158, aAIScriptingData_L050, $00)                     ;B3DE55
pAIScripting0x07_L092:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x07_L093)                                        ;B3DE5D
    %AICMD0x2D_JumpOnInteract(pAIScripting0x07_L095, pAIScripting0x07_L094)                               ;B3DE60
    %AICMD0x12_Jump(pAIScripting0x07_L092)                                   ;B3DE65
pAIScripting0x07_L093:
    %AICMD0x1C_ShowDialog($01C8, $00)                          ;B3DE68
    %AICMD0x12_Jump(pAIScripting0x07_L092)                                   ;B3DE6C
pAIScripting0x07_L094:
    %AICMD0x1C_ShowDialog($03BC, $00)                          ;B3DE6F
    %AICMD0x12_Jump(pAIScripting0x07_L092)                                   ;B3DE73
pAIScripting0x07_L095:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 30, pAIScripting0x07_L096)         ;B3DE76
    %AICMD0x1C_ShowDialog($0396, $00)                          ;B3DE7D
    %AICMD0x12_Jump(pAIScripting0x07_L092)                                   ;B3DE81
pAIScripting0x07_L096:
    %AICMD0x1C_ShowDialog($03FD, $00)                          ;B3DE84
    %AICMD0x41_AddValue16(nPlayerHappiness, 5)                 ;B3DE88
    %AICMD0x12_Jump(pAIScripting0x07_L092)                                   ;B3DE8E
pAIScripting0x07_L097:
    %AICMD0x1A($00B8, $00A8, aAIScriptingData_L021, $00)                     ;B3DE91
pAIScripting0x07_L098:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x07_L099)                                        ;B3DE99
    %AICMD0x2D_JumpOnInteract(pAIScripting0x07_L103, pAIScripting0x07_L101)                               ;B3DE9C
    %AICMD0x12_Jump(pAIScripting0x07_L098)                                   ;B3DEA1
pAIScripting0x07_L099:
    %AICMD0x45_JumpIfBetween16(nLove_Ellen, 0, 249, pAIScripting0x07_L100)   ;B3DEA4
    %AICMD0x1C_ShowDialog($0440, $00)                          ;B3DEAE
    %AICMD0x12_Jump(pAIScripting0x07_L098)                                   ;B3DEB2
pAIScripting0x07_L100:
    %AICMD0x1C_ShowDialog($017A, $00)                          ;B3DEB5
    %AICMD0x12_Jump(pAIScripting0x07_L098)                                   ;B3DEB9
pAIScripting0x07_L101:
    %AICMD0x16_JumpIfBetween8($80091E, 20, 23, pAIScripting0x07_L102)        ;B3DEBC
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3DEC4
    %AICMD0x12_Jump(pAIScripting0x07_L098)                                   ;B3DEC8
pAIScripting0x07_L102:
    %AICMD0x1C_ShowDialog($03B3, $00)                          ;B3DECB
    %AICMD0x41_AddValue16(nLove_Ellen, 3)                      ;B3DECF
    %AICMD0x12_Jump(pAIScripting0x07_L098)                                   ;B3DED5
pAIScripting0x07_L103:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $02, pAIScripting0x07_L106)   ;B3DED8
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 23, pAIScripting0x07_L104)         ;B3DEDF
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 30, pAIScripting0x07_L105)         ;B3DEE6
    %AICMD0x1C_ShowDialog($039D, $00)                          ;B3DEED
    %AICMD0x12_Jump(pAIScripting0x07_L098)                                   ;B3DEF1
pAIScripting0x07_L104:
    %AICMD0x1C_ShowDialog($02B2, $00)                          ;B3DEF4
    %AICMD0x12_Jump(pAIScripting0x07_L098)                                   ;B3DEF8
pAIScripting0x07_L105:
    %AICMD0x1C_ShowDialog($03FB, $00)                          ;B3DEFB
    %AICMD0x41_AddValue16(nLove_Ellen, 5)                      ;B3DEFF
    %AICMD0x12_Jump(pAIScripting0x07_L098)                                   ;B3DF05
pAIScripting0x07_L106:
    %AICMD0x1C_ShowDialog($01EE, $00)                          ;B3DF08
    %AICMD0x12_Jump(pAIScripting0x07_L098)                                   ;B3DF0C


pAIScripting0x07_Data06:
 
    %AICMD0x11_EnableUserControl()                             ;B3DF0F
    %AICMD0x09_StartScript($01, pAIScripting0x07_L108)                                   ;B3DF10
    %AICMD0x09_StartScript($02, pAIScripting0x07_L117)                                   ;B3DF14
pAIScripting0x07_L107:
    %AICMD0x13_Wait(1)                                         ;B3DF18
    %AICMD0x12_Jump(pAIScripting0x07_L107)                                   ;B3DF1B
pAIScripting0x07_L108:
    %AICMD0x1A($0088, $0050, aAIScriptingData_L042, $00)                     ;B3DF1E
pAIScripting0x07_L109:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x07_L111)                                        ;B3DF26
    %AICMD0x2D_JumpOnInteract(pAIScripting0x07_L112, pAIScripting0x07_L110)                               ;B3DF29
    %AICMD0x12_Jump(pAIScripting0x07_L109)                                   ;B3DF2E
pAIScripting0x07_L110:
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3DF31
    %AICMD0x12_Jump(pAIScripting0x07_L109)                                   ;B3DF35
pAIScripting0x07_L111:
    %AICMD0x1C_ShowDialog($01CA, $00)                          ;B3DF38
    %AICMD0x1B($0288, $00)                                     ;B3DF3C
    %AICMD0x12_Jump(pAIScripting0x07_L109)                                   ;B3DF40
pAIScripting0x07_L112:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event4, $0C, pAIScripting0x07_L113)   ;B3DF43
    %AICMD0x14_JumpIfFlagSet(strcFlags.event4, $0E, pAIScripting0x07_L114)   ;B3DF4A
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $00, pAIScripting0x07_L115)   ;B3DF51
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $02, pAIScripting0x07_L116)   ;B3DF58
    %AICMD0x1C_ShowDialog($0398, $00)                          ;B3DF5F
    %AICMD0x12_Jump(pAIScripting0x07_L109)                                   ;B3DF63
pAIScripting0x07_L113:
    %AICMD0x1C_ShowDialog($01D1, $00)                          ;B3DF66
    %AICMD0x1B($0288, $00)                                     ;B3DF6A
    %AICMD0x12_Jump(pAIScripting0x07_L109)                                   ;B3DF6E
pAIScripting0x07_L114:
    %AICMD0x1C_ShowDialog($01DD, $00)                          ;B3DF71
    %AICMD0x1B($0288, $00)                                     ;B3DF75
    %AICMD0x12_Jump(pAIScripting0x07_L109)                                   ;B3DF79
pAIScripting0x07_L115:
    %AICMD0x1C_ShowDialog($01E6, $00)                          ;B3DF7C
    %AICMD0x1B($0288, $00)                                     ;B3DF80
    %AICMD0x12_Jump(pAIScripting0x07_L109)                                   ;B3DF84
pAIScripting0x07_L116:
    %AICMD0x1C_ShowDialog($01EF, $00)                          ;B3DF87
    %AICMD0x1B($0288, $00)                                     ;B3DF8B
    %AICMD0x12_Jump(pAIScripting0x07_L109)                                   ;B3DF8F
pAIScripting0x07_L117:
    %AICMD0x1A($0038, $0098, aAIScriptingData_L055, $00)                     ;B3DF92
pAIScripting0x07_L118:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x07_L119)                                        ;B3DF9A
    %AICMD0x2D_JumpOnInteract(pAIScripting0x07_L121, pAIScripting0x07_L120)                               ;B3DF9D
    %AICMD0x12_Jump(pAIScripting0x07_L118)                                   ;B3DFA2
pAIScripting0x07_L119:
    %AICMD0x1C_ShowDialog($01CB, $00)                          ;B3DFA5
    %AICMD0x12_Jump(pAIScripting0x07_L118)                                   ;B3DFA9
pAIScripting0x07_L120:
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3DFAC
    %AICMD0x12_Jump(pAIScripting0x07_L118)                                   ;B3DFB0
pAIScripting0x07_L121:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 30, pAIScripting0x07_L122)         ;B3DFB3
    %AICMD0x1C_ShowDialog($0399, $00)                          ;B3DFBA
    %AICMD0x12_Jump(pAIScripting0x07_L118)                                   ;B3DFBE
pAIScripting0x07_L122:
    %AICMD0x1C_ShowDialog($0324, $00)                          ;B3DFC1
    %AICMD0x41_AddValue16(nPlayerHappiness, 5)                 ;B3DFC5
    %AICMD0x12_Jump(pAIScripting0x07_L118)                                   ;B3DFCB


pAIScripting0x07_Data07:
 
    %AICMD0x11_EnableUserControl()                             ;B3DFCE
    %AICMD0x09_StartScript($01, pAIScripting0x07_L124)                                   ;B3DFCF
pAIScripting0x07_L123:
    %AICMD0x13_Wait(1)                                         ;B3DFD3
    %AICMD0x12_Jump(pAIScripting0x07_L123)                                   ;B3DFD6
pAIScripting0x07_L124:
    %AICMD0x1A($00E8, $0098, aAIScriptingData_L053, $03)                     ;B3DFD9
pAIScripting0x07_L125:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x07_L127)                                        ;B3DFE1
    %AICMD0x2D_JumpOnInteract(pAIScripting0x07_L128, pAIScripting0x07_L126)                               ;B3DFE4
    %AICMD0x12_Jump(pAIScripting0x07_L125)                                   ;B3DFE9
pAIScripting0x07_L126:
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3DFEC
    %AICMD0x1B($02AF, $00)                                     ;B3DFF0
    %AICMD0x12_Jump(pAIScripting0x07_L125)                                   ;B3DFF4
pAIScripting0x07_L127:
    %AICMD0x1C_ShowDialog($01C9, $00)                          ;B3DFF7
    %AICMD0x1B($02AF, $00)                                     ;B3DFFB
    %AICMD0x12_Jump(pAIScripting0x07_L125)                                   ;B3DFFF
pAIScripting0x07_L128:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $02, pAIScripting0x07_L129)   ;B3E002
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 30, pAIScripting0x07_L130)         ;B3E009
    %AICMD0x1C_ShowDialog($005E, $00)                          ;B3E010
    %AICMD0x1B($02AF, $00)                                     ;B3E014
    %AICMD0x12_Jump(pAIScripting0x07_L125)                                   ;B3E018
pAIScripting0x07_L129:
    %AICMD0x1C_ShowDialog($01F0, $00)                          ;B3E01B
    %AICMD0x1B($02AF, $00)                                     ;B3E01F
    %AICMD0x12_Jump(pAIScripting0x07_L125)                                   ;B3E023
pAIScripting0x07_L130:
    %AICMD0x1C_ShowDialog($0146, $00)                          ;B3E026
    %AICMD0x1B($02AF, $00)                                     ;B3E02A
    %AICMD0x41_AddValue16(nPlayerHappiness, 5)                 ;B3E02E
    %AICMD0x12_Jump(pAIScripting0x07_L125)                                   ;B3E034


pAIScripting0x07_Data08:
    %AICMD0x11_EnableUserControl()                             ;B3E037
    %AICMD0x09_StartScript($01, pAIScripting0x07_L138)                                   ;B3E038
    %AICMD0x09_StartScript($02, pAIScripting0x07_L132)                                   ;B3E03C
pAIScripting0x07_L131:
    %AICMD0x13_Wait(1)                                         ;B3E040
    %AICMD0x12_Jump(pAIScripting0x07_L131)                                   ;B3E043
pAIScripting0x07_L132:
    %AICMD0x1A($0058, $00B8, aAIScriptingData_L027, $00)                     ;B3E046
pAIScripting0x07_L133:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x07_L135)                                        ;B3E04E
    %AICMD0x2D_JumpOnInteract(pAIScripting0x07_L136, pAIScripting0x07_L134)                               ;B3E051
    %AICMD0x12_Jump(pAIScripting0x07_L133)                                   ;B3E056
pAIScripting0x07_L134:
    %AICMD0x1C_ShowDialog($03BC, $00)                          ;B3E059
    %AICMD0x12_Jump(pAIScripting0x07_L133)                                   ;B3E05D
pAIScripting0x07_L135:
    %AICMD0x1C_ShowDialog($01C8, $00)                          ;B3E060
    %AICMD0x12_Jump(pAIScripting0x07_L133)                                   ;B3E064
pAIScripting0x07_L136:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 30, pAIScripting0x07_L137)         ;B3E067
    %AICMD0x1C_ShowDialog($0150, $00)                          ;B3E06E
    %AICMD0x12_Jump(pAIScripting0x07_L133)                                   ;B3E072
pAIScripting0x07_L137:
    %AICMD0x1C_ShowDialog($03F6, $00)                          ;B3E075
    %AICMD0x41_AddValue16(nPlayerHappiness, 5)                 ;B3E079
    %AICMD0x12_Jump(pAIScripting0x07_L133)                                   ;B3E07F
    %AICMD0x10_End()                                           ;B3E082
pAIScripting0x07_L138:
    %AICMD0x1A($0098, $0088, aAIScriptingData_L027, $00)                     ;B3E083
pAIScripting0x07_L139:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x07_L141)                                        ;B3E08B
    %AICMD0x2D_JumpOnInteract(pAIScripting0x07_L142, pAIScripting0x07_L140)                               ;B3E08E
    %AICMD0x12_Jump(pAIScripting0x07_L139)                                   ;B3E093
pAIScripting0x07_L140:
    %AICMD0x1C_ShowDialog($03BC, $00)                          ;B3E096
    %AICMD0x12_Jump(pAIScripting0x07_L139)                                   ;B3E09A
pAIScripting0x07_L141:
    %AICMD0x1C_ShowDialog($01C8, $00)                          ;B3E09D
    %AICMD0x12_Jump(pAIScripting0x07_L139)                                   ;B3E0A1
pAIScripting0x07_L142:
    %AICMD0x15_JumpIfEquals8(nCurrentDay, 30, pAIScripting0x07_L143)         ;B3E0A4
    %AICMD0x1C_ShowDialog($03A0, $00)                          ;B3E0AB
    %AICMD0x12_Jump(pAIScripting0x07_L139)                                   ;B3E0AF
pAIScripting0x07_L143:
    %AICMD0x1C_ShowDialog($03F7, $00)                          ;B3E0B2
    %AICMD0x41_AddValue16(nPlayerHappiness, 5)                 ;B3E0B6
    %AICMD0x12_Jump(pAIScripting0x07_L139)                                   ;B3E0BC
