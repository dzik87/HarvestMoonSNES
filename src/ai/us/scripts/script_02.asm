

pAIScripting0x02:
    dw pAIScripting0x02_Data01                                            ;B3AE03|        |B3AE23;
    dw pAIScripting0x02_Data02                                            ;B3AE05|        |B3B44A;
    dw pAIScripting0x02_Data03                                            ;B3AE07|        |B3B4E3;
    dw pAIScripting0x02_Data04                                            ;B3AE09|        |B3B6E1;
    dw pAIScripting0x02_Data05                                            ;B3AE0B|        |B3B8D2;
    dw pAIScripting0x03                                        ;B3AE0D|        |B3BA39;
    dw pAIScripting0x03                                        ;B3AE0F|        |B3BA39;
    dw pAIScripting0x03                                        ;B3AE11|        |B3BA39;
    dw pAIScripting0x03                                        ;B3AE13|        |B3BA39;
    dw pAIScripting0x03                                        ;B3AE15|        |B3BA39;
    dw pAIScripting0x03                                        ;B3AE17|        |B3BA39;
    dw pAIScripting0x03                                        ;B3AE19|        |B3BA39;
    dw pAIScripting0x03                                        ;B3AE1B|        |B3BA39;
    dw pAIScripting0x03                                        ;B3AE1D|        |B3BA39;
    dw pAIScripting0x03                                        ;B3AE1F|        |B3BA39;
    dw pAIScripting0x03                                        ;B3AE21|        |B3BA39;
 
pAIScripting0x02_Data01:
 
    %AICMD0x11_EnableUserControl()                             ;B3AE23
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 2, pAIScripting0x02_L001)     ;B3AE24
    %AICMD0x09_StartScript($01, pAIScripting0x02_L016)                                   ;B3AE2B
    %AICMD0x09_StartScript($02, pAIScripting0x02_L031)                                   ;B3AE2F
    %AICMD0x12_Jump(pAIScripting0x02_L002)                                   ;B3AE33
pAIScripting0x02_L001:
    %AICMD0x09_StartScript($01, pAIScripting0x02_L007)                                   ;B3AE36
    %AICMD0x09_StartScript($02, pAIScripting0x02_L023)                                   ;B3AE3A
pAIScripting0x02_L002:
    %AICMD0x09_StartScript($03, pAIScripting0x02_L038)                                   ;B3AE3E
    %AICMD0x09_StartScript($04, pAIScripting0x02_L048)                                   ;B3AE42
    %AICMD0x09_StartScript($05, pAIScripting0x02_L059)                                   ;B3AE46
    %AICMD0x12_Jump(pAIScripting0x02_L004)                                   ;B3AE4A
pAIScripting0x02_L003:
    %AICMD0x13_Wait(1)                                         ;B3AE4D
    %AICMD0x12_Jump(pAIScripting0x02_L003)                                   ;B3AE50
pAIScripting0x02_L004:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $01, pAIScripting0x02_L005)   ;B3AE53
    %AICMD0x09_StartScript($06, pAIScripting0x02_L069)                                   ;B3AE5A
pAIScripting0x02_L005:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $03, pAIScripting0x02_L006)   ;B3AE5E
    %AICMD0x09_StartScript($07, pAIScripting0x02_L102)                                   ;B3AE65
pAIScripting0x02_L006:
    %AICMD0x12_Jump(pAIScripting0x02_L003)                                   ;B3AE69
pAIScripting0x02_L007:
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 17, 18, pAIScripting0x02_L013) ;B3AE6C
    %AICMD0x1A($0128, $01B8, aAIScriptingData_L046, $00)                     ;B3AE74
    %AICMD0x22($20, $10, $01, aAIScriptingData_L047, $10)                    ;B3AE7C
pAIScripting0x02_L008:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x02_L009)                                        ;B3AE83
    %AICMD0x2D_JumpOnInteract(pAIScripting0x02_L012, pAIScripting0x02_L010)                               ;B3AE86
    %AICMD0x12_Jump(pAIScripting0x02_L008)                                   ;B3AE8B
pAIScripting0x02_L009:
    %AICMD0x1C_ShowDialog($01CA, $00)                          ;B3AE8E
    %AICMD0x12_Jump(pAIScripting0x02_L008)                                   ;B3AE92
pAIScripting0x02_L010:
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 9, 12, pAIScripting0x02_L011)         ;B3AE95
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3AE9D
    %AICMD0x12_Jump(pAIScripting0x02_L008)                                   ;B3AEA1
pAIScripting0x02_L011:
    %AICMD0x1C_ShowDialog($0049, $00)                          ;B3AEA4
    %AICMD0x12_Jump(pAIScripting0x02_L008)                                   ;B3AEA8
pAIScripting0x02_L012:
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 7, 16, pAIScripting0x02_L014)  ;B3AEAB
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 17, 18, pAIScripting0x02_L015) ;B3AEB3
    %AICMD0x12_Jump(pAIScripting0x02_L008)                                   ;B3AEBB
pAIScripting0x02_L013:
    %AICMD0x10_End()                                           ;B3AEBE
pAIScripting0x02_L014:
    %AICMD0x1C_ShowDialog($0043, $00)                          ;B3AEBF
    %AICMD0x12_Jump(pAIScripting0x02_L008)                                   ;B3AEC3
pAIScripting0x02_L015:
    %AICMD0x1C_ShowDialog($0392, $00)                          ;B3AEC6
    %AICMD0x12_Jump(pAIScripting0x02_L008)                                   ;B3AECA
pAIScripting0x02_L016:
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 17, 18, pAIScripting0x02_L020) ;B3AECD
    %AICMD0x1A($0128, $01A8, aAIScriptingData_L047, $02)                     ;B3AED5
pAIScripting0x02_L017:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x02_L018)                                        ;B3AEDD
    %AICMD0x1F(pAIScripting0x02_L019)                                        ;B3AEE0
    %AICMD0x12_Jump(pAIScripting0x02_L017)                                   ;B3AEE3
pAIScripting0x02_L018:
    %AICMD0x1C_ShowDialog($01CA, $00)                          ;B3AEE6
    %AICMD0x12_Jump(pAIScripting0x02_L017)                                   ;B3AEEA
pAIScripting0x02_L019:
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 7, 16, pAIScripting0x02_L021)  ;B3AEED
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 17, 18, pAIScripting0x02_L022) ;B3AEF5
    %AICMD0x12_Jump(pAIScripting0x02_L017)                                   ;B3AEFD
pAIScripting0x02_L020:
    %AICMD0x10_End()                                           ;B3AF00
pAIScripting0x02_L021:
    %AICMD0x1C_ShowDialog($0044, $00)                          ;B3AF01
    %AICMD0x12_Jump(pAIScripting0x02_L017)                                   ;B3AF05
pAIScripting0x02_L022:
    %AICMD0x1C_ShowDialog($0392, $00)                          ;B3AF08
    %AICMD0x12_Jump(pAIScripting0x02_L017)                                   ;B3AF0C
pAIScripting0x02_L023:
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 17, 18, pAIScripting0x02_L029) ;B3AF0F
    %AICMD0x1A($01A8, $0088, aAIScriptingData_L066, $00)                     ;B3AF17
pAIScripting0x02_L024:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x02_L025)                                        ;B3AF1F
    %AICMD0x2D_JumpOnInteract(pAIScripting0x02_L028, pAIScripting0x02_L026)                               ;B3AF22
    %AICMD0x12_Jump(pAIScripting0x02_L024)                                   ;B3AF27
pAIScripting0x02_L025:
    %AICMD0x1C_ShowDialog($01C6, $00)                          ;B3AF2A
    %AICMD0x12_Jump(pAIScripting0x02_L024)                                   ;B3AF2E
pAIScripting0x02_L026:
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 9, 12, pAIScripting0x02_L027)         ;B3AF31
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3AF39
    %AICMD0x12_Jump(pAIScripting0x02_L024)                                   ;B3AF3D
pAIScripting0x02_L027:
    %AICMD0x1C_ShowDialog($03B9, $00)                          ;B3AF40
    %AICMD0x12_Jump(pAIScripting0x02_L024)                                   ;B3AF44
pAIScripting0x02_L028:
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 7, 18, pAIScripting0x02_L030)  ;B3AF47
    %AICMD0x12_Jump(pAIScripting0x02_L024)                                   ;B3AF4F
pAIScripting0x02_L029:
    %AICMD0x10_End()                                           ;B3AF52
pAIScripting0x02_L030:
    %AICMD0x1C_ShowDialog($0049, $00)                          ;B3AF53
    %AICMD0x12_Jump(pAIScripting0x02_L024)                                   ;B3AF57
pAIScripting0x02_L031:
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 17, 18, pAIScripting0x02_L035) ;B3AF5A
    %AICMD0x1A($0138, $01A8, aAIScriptingData_L065, $03)                     ;B3AF62
pAIScripting0x02_L032:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x02_L033)                                        ;B3AF6A
    %AICMD0x1F(pAIScripting0x02_L034)                                        ;B3AF6D
    %AICMD0x12_Jump(pAIScripting0x02_L032)                                   ;B3AF70
pAIScripting0x02_L033:
    %AICMD0x1C_ShowDialog($01C6, $00)                          ;B3AF73
    %AICMD0x12_Jump(pAIScripting0x02_L024)                                   ;B3AF77
pAIScripting0x02_L034:
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 7, 16, pAIScripting0x02_L036)  ;B3AF7A
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 17, 18, pAIScripting0x02_L037) ;B3AF82
    %AICMD0x12_Jump(pAIScripting0x02_L032)                                   ;B3AF8A
pAIScripting0x02_L035:
    %AICMD0x10_End()                                           ;B3AF8D
pAIScripting0x02_L036:
    %AICMD0x1C_ShowDialog($004A, $00)                          ;B3AF8E
    %AICMD0x12_Jump(pAIScripting0x02_L032)                                   ;B3AF92
pAIScripting0x02_L037:
    %AICMD0x1C_ShowDialog($0391, $00)                          ;B3AF95
    %AICMD0x12_Jump(pAIScripting0x02_L032)                                   ;B3AF99
pAIScripting0x02_L038:
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 17, 18, pAIScripting0x02_L044) ;B3AF9C
    %AICMD0x1A($00B8, $0188, aAIScriptingData_L049, $02)                     ;B3AFA4
pAIScripting0x02_L039:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x02_L040)                                        ;B3AFAC
    %AICMD0x2D_JumpOnInteract(pAIScripting0x02_L043, pAIScripting0x02_L041)                               ;B3AFAF
    %AICMD0x12_Jump(pAIScripting0x02_L039)                                   ;B3AFB4
pAIScripting0x02_L040:
    %AICMD0x1C_ShowDialog($01C7, $00)                          ;B3AFB7
    %AICMD0x12_Jump(pAIScripting0x02_L039)                                   ;B3AFBB
pAIScripting0x02_L041:
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 9, 12, pAIScripting0x02_L042)         ;B3AFBE
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3AFC6
    %AICMD0x12_Jump(pAIScripting0x02_L039)                                   ;B3AFCA
pAIScripting0x02_L042:
    %AICMD0x1C_ShowDialog($03BB, $00)                          ;B3AFCD
    %AICMD0x12_Jump(pAIScripting0x02_L039)                                   ;B3AFD1
pAIScripting0x02_L043:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $02, pAIScripting0x02_L047)   ;B3AFD4
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 7, 16, pAIScripting0x02_L045)  ;B3AFDB
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 17, 18, pAIScripting0x02_L046) ;B3AFE3
    %AICMD0x12_Jump(pAIScripting0x02_L039)                                   ;B3AFEB
pAIScripting0x02_L044:
    %AICMD0x10_End()                                           ;B3AFEE
pAIScripting0x02_L045:
    %AICMD0x1C_ShowDialog($004F, $00)                          ;B3AFEF
    %AICMD0x12_Jump(pAIScripting0x02_L039)                                   ;B3AFF3
pAIScripting0x02_L046:
    %AICMD0x1C_ShowDialog($0392, $00)                          ;B3AFF6
    %AICMD0x12_Jump(pAIScripting0x02_L039)                                   ;B3AFFA
pAIScripting0x02_L047:
    %AICMD0x1C_ShowDialog($01ED, $00)                          ;B3AFFD
    %AICMD0x1B($02A1, $01)                                     ;B3B001
    %AICMD0x12_Jump(pAIScripting0x02_L039)                                   ;B3B005
pAIScripting0x02_L048:
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 17, 18, pAIScripting0x02_L054) ;B3B008
    %AICMD0x1A($0188, $0228, aAIScriptingData_L068, $01)                     ;B3B010
pAIScripting0x02_L049:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x02_L050)                                        ;B3B018
    %AICMD0x2D_JumpOnInteract(pAIScripting0x02_L053, pAIScripting0x02_L051)                               ;B3B01B
    %AICMD0x12_Jump(pAIScripting0x02_L049)                                   ;B3B020
pAIScripting0x02_L050:
    %AICMD0x1C_ShowDialog($01CB, $00)                          ;B3B023
    %AICMD0x12_Jump(pAIScripting0x02_L049)                                   ;B3B027
pAIScripting0x02_L051:
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 9, 12, pAIScripting0x02_L052)         ;B3B02A
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3B032
    %AICMD0x12_Jump(pAIScripting0x02_L049)                                   ;B3B036
pAIScripting0x02_L052:
    %AICMD0x1C_ShowDialog($03B8, $00)                          ;B3B039
    %AICMD0x12_Jump(pAIScripting0x02_L049)                                   ;B3B03D
pAIScripting0x02_L053:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event4, $0C, pAIScripting0x02_L058)   ;B3B040
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 7, 16, pAIScripting0x02_L055)  ;B3B047
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 17, 18, pAIScripting0x02_L057) ;B3B04F
    %AICMD0x12_Jump(pAIScripting0x02_L049)                                   ;B3B057
pAIScripting0x02_L054:
    %AICMD0x10_End()                                           ;B3B05A
pAIScripting0x02_L055:
    %AICMD0x16_JumpIfBetween8(nCurrentSeasonID, 0, 1, pAIScripting0x02_L056) ;B3B05B
    %AICMD0x1C_ShowDialog($006C, $00)                          ;B3B063
    %AICMD0x12_Jump(pAIScripting0x02_L049)                                   ;B3B067
pAIScripting0x02_L056:
    %AICMD0x1C_ShowDialog($006D, $00)                          ;B3B06A
    %AICMD0x12_Jump(pAIScripting0x02_L049)                                   ;B3B06E
pAIScripting0x02_L057:
    %AICMD0x1C_ShowDialog($0392, $00)                          ;B3B071
    %AICMD0x12_Jump(pAIScripting0x02_L049)                                   ;B3B075
pAIScripting0x02_L058:
    %AICMD0x1C_ShowDialog($01D0, $00)                          ;B3B078
    %AICMD0x12_Jump(pAIScripting0x02_L049)                                   ;B3B07C
pAIScripting0x02_L059:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event4, $0A, pAIScripting0x02_L065)   ;B3B07F
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 17, 18, pAIScripting0x02_L065) ;B3B086
    %AICMD0x1A($0198, $0228, aAIScriptingData_L056, $03)                     ;B3B08E
pAIScripting0x02_L060:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x02_L061)                                        ;B3B096
    %AICMD0x2D_JumpOnInteract(pAIScripting0x02_L064, pAIScripting0x02_L062)                               ;B3B099
    %AICMD0x12_Jump(pAIScripting0x02_L060)                                   ;B3B09E
pAIScripting0x02_L061:
    %AICMD0x1C_ShowDialog($01CB, $00)                          ;B3B0A1
    %AICMD0x12_Jump(pAIScripting0x02_L060)                                   ;B3B0A5
pAIScripting0x02_L062:
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 9, 12, pAIScripting0x02_L063)         ;B3B0A8
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3B0B0
    %AICMD0x12_Jump(pAIScripting0x02_L060)                                   ;B3B0B4
pAIScripting0x02_L063:
    %AICMD0x1C_ShowDialog($03BA, $00)                          ;B3B0B7
    %AICMD0x12_Jump(pAIScripting0x02_L060)                                   ;B3B0BB
pAIScripting0x02_L064:
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 7, 16, pAIScripting0x02_L066)  ;B3B0BE
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 17, 18, pAIScripting0x02_L068) ;B3B0C6
    %AICMD0x12_Jump(pAIScripting0x02_L060)                                   ;B3B0CE
pAIScripting0x02_L065:
    %AICMD0x10_End()                                           ;B3B0D1
pAIScripting0x02_L066:
    %AICMD0x16_JumpIfBetween8(nCurrentSeasonID, 0, 1, pAIScripting0x02_L067) ;B3B0D2
    %AICMD0x1C_ShowDialog($0066, $00)                          ;B3B0DA
    %AICMD0x12_Jump(pAIScripting0x02_L060)                                   ;B3B0DE
pAIScripting0x02_L067:
    %AICMD0x1C_ShowDialog($0067, $00)                          ;B3B0E1
    %AICMD0x12_Jump(pAIScripting0x02_L060)                                   ;B3B0E5
pAIScripting0x02_L068:
    %AICMD0x1C_ShowDialog($0391, $00)                          ;B3B0E8
    %AICMD0x12_Jump(pAIScripting0x02_L060)                                   ;B3B0EC
pAIScripting0x02_L069:
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 17, 18, pAIScripting0x02_L084) ;B3B0EF
    %AICMD0x45_JumpIfBetween16(nLove_Ann, 150, 200, pAIScripting0x02_L079)   ;B3B0F7
    %AICMD0x1A($0178, $0378, aAIScriptingData_L015, $00)                     ;B3B101
    %AICMD0x22($20, $14, $01, aAIScriptingData_L016, $10)                    ;B3B109
pAIScripting0x02_L070:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x02_L072)                                        ;B3B110
    %AICMD0x2D_JumpOnInteract(pAIScripting0x02_L083, pAIScripting0x02_L074)                               ;B3B113
    %AICMD0x12_Jump(pAIScripting0x02_L070)                                   ;B3B118
pAIScripting0x02_L071:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x02_L072)                                        ;B3B11B
    %AICMD0x1F(pAIScripting0x02_L085)                                        ;B3B11E
    %AICMD0x12_Jump(pAIScripting0x02_L071)                                   ;B3B121
pAIScripting0x02_L072:
    %AICMD0x45_JumpIfBetween16(nLove_Ann, 0, 249, pAIScripting0x02_L073)     ;B3B124
    %AICMD0x1C_ShowDialog($0175, $00)                          ;B3B12E
    %AICMD0x47_SetValue8(wram80(strcPlayerData.toolEquipped), 0)                           ;B3B132
    %AICMD0x23_OrWithIndexedValue(strcFlags.event2, $01)       ;B3B137
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily3, $08)       ;B3B13C
    %AICMD0x3D_TeleportToArea(!AREA_WEDDINGSPRING)             ;B3B141
    %AICMD0x10_End()                                           ;B3B143
pAIScripting0x02_L073:
    %AICMD0x1C_ShowDialog($0176, $00)                          ;B3B144
    %AICMD0x12_Jump(pAIScripting0x02_L070)                                   ;B3B148
pAIScripting0x02_L074:
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 2, pAIScripting0x02_L075)              ;B3B14B
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 1, 7, pAIScripting0x02_L076)          ;B3B152
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 16, 23, pAIScripting0x02_L076)        ;B3B15A
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 6, pAIScripting0x02_L076)              ;B3B162
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 25, pAIScripting0x02_L077)             ;B3B169
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 73, pAIScripting0x02_L077)             ;B3B170
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 9, 12, pAIScripting0x02_L078)         ;B3B177
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3B17F
    %AICMD0x12_Jump(pAIScripting0x02_L070)                                   ;B3B183
pAIScripting0x02_L075:
    %AICMD0x1C_ShowDialog($03B4, $00)                          ;B3B186
    %AICMD0x41_AddValue16(nLove_Ann, -8)                       ;B3B18A
    %AICMD0x12_Jump(pAIScripting0x02_L070)                                   ;B3B190
pAIScripting0x02_L076:
    %AICMD0x1C_ShowDialog($03B2, $00)                          ;B3B193
    %AICMD0x41_AddValue16(nLove_Ann, 5)                        ;B3B197
    %AICMD0x12_Jump(pAIScripting0x02_L070)                                   ;B3B19D
pAIScripting0x02_L077:
    %AICMD0x1C_ShowDialog($0212, $00)                          ;B3B1A0
    %AICMD0x41_AddValue16(nLove_Ann, 2)                        ;B3B1A4
    %AICMD0x12_Jump(pAIScripting0x02_L070)                                   ;B3B1AA
pAIScripting0x02_L078:
    %AICMD0x1C_ShowDialog($03B4, $00)                          ;B3B1AD
    %AICMD0x41_AddValue16(nLove_Ann, -2)                       ;B3B1B1
    %AICMD0x12_Jump(pAIScripting0x02_L070)                                   ;B3B1B7
pAIScripting0x02_L079:
    %AICMD0x09_StartScript($09, pAIScripting0x02_L100)                                   ;B3B1BA
    %AICMD0x1A($0178, $0368, aAIScriptingData_L015, $00)                     ;B3B1BE
pAIScripting0x02_L080:
    %AICMD0x2D_JumpOnInteract(pAIScripting0x02_L093, pAIScripting0x02_L091)                               ;B3B1C6
    %AICMD0x12_Jump(pAIScripting0x02_L080)                                   ;B3B1CB
pAIScripting0x02_L081:
    %AICMD0x1F(pAIScripting0x02_L096)                                        ;B3B1CE
    %AICMD0x12_Jump(pAIScripting0x02_L081)                                   ;B3B1D1
pAIScripting0x02_L082:
    %AICMD0x1F(pAIScripting0x02_L097)                                        ;B3B1D4
    %AICMD0x12_Jump(pAIScripting0x02_L082)                                   ;B3B1D7
pAIScripting0x02_L083:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event4, $0E, pAIScripting0x02_L099)   ;B3B1DA
    %AICMD0x45_JumpIfBetween16(nLove_Ann, 120, 149, pAIScripting0x02_L090)   ;B3B1E1
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 7, 16, pAIScripting0x02_L085)  ;B3B1EB
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 17, 18, pAIScripting0x02_L098) ;B3B1F3
    %AICMD0x12_Jump(pAIScripting0x02_L070)                                   ;B3B1FB
pAIScripting0x02_L084:
    %AICMD0x10_End()                                           ;B3B1FE
pAIScripting0x02_L085:
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 0, pAIScripting0x02_L086)     ;B3B1FF
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 1, pAIScripting0x02_L087)     ;B3B206
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 2, pAIScripting0x02_L088)     ;B3B20D
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, pAIScripting0x02_L089)     ;B3B214
    %AICMD0x12_Jump(pAIScripting0x02_L070)                                   ;B3B21B
pAIScripting0x02_L086:
    %AICMD0x1C_ShowDialog($00A5, $00)                          ;B3B21E
    %AICMD0x12_Jump(pAIScripting0x02_L070)                                   ;B3B222
pAIScripting0x02_L087:
    %AICMD0x1C_ShowDialog($00A6, $00)                          ;B3B225
    %AICMD0x12_Jump(pAIScripting0x02_L070)                                   ;B3B229
pAIScripting0x02_L088:
    %AICMD0x1C_ShowDialog($00A7, $00)                          ;B3B22C
    %AICMD0x12_Jump(pAIScripting0x02_L070)                                   ;B3B230
pAIScripting0x02_L089:
    %AICMD0x1C_ShowDialog($00A8, $00)                          ;B3B233
    %AICMD0x12_Jump(pAIScripting0x02_L070)                                   ;B3B237
pAIScripting0x02_L090:
    %AICMD0x1C_ShowDialog($00AA, $00)                          ;B3B23A
    %AICMD0x12_Jump(pAIScripting0x02_L070)                                   ;B3B23E
pAIScripting0x02_L091:
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 9, 12, pAIScripting0x02_L092)         ;B3B241
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3B249
    %AICMD0x12_Jump(pAIScripting0x02_L080)                                   ;B3B24D
pAIScripting0x02_L092:
    %AICMD0x1C_ShowDialog($03B4, $00)                          ;B3B250
    %AICMD0x41_AddValue16(nLove_Ann, -2)                       ;B3B254
    %AICMD0x12_Jump(pAIScripting0x02_L080)                                   ;B3B25A
pAIScripting0x02_L093:
    %AICMD0x1D_ShowDialog($00AB, $00)                          ;B3B25D
    %AICMD0x20_JumpIfChoice(0, pAIScripting0x02_L094)                        ;B3B261
    %AICMD0x20_JumpIfChoice(1, pAIScripting0x02_L095)                        ;B3B265
    %AICMD0x12_Jump(pAIScripting0x02_L080)                                   ;B3B269
pAIScripting0x02_L094:
    %AICMD0x08_EnableAIControl()                               ;B3B26C
    %AICMD0x19($00E9, $00)                                     ;B3B26D
    %AICMD0x13_Wait(120)                                       ;B3B271
    %AICMD0x11_EnableUserControl()                             ;B3B274
    %AICMD0x1C_ShowDialog($00AC, $00)                          ;B3B275
    %AICMD0x41_AddValue16(nLove_Ann, 10)                       ;B3B279
    %AICMD0x12_Jump(pAIScripting0x02_L081)                                   ;B3B27F
pAIScripting0x02_L095:
    %AICMD0x1C_ShowDialog($00AD, $00)                          ;B3B282
    %AICMD0x41_AddValue16(nLove_Ann, 2)                        ;B3B286
    %AICMD0x12_Jump(pAIScripting0x02_L082)                                   ;B3B28C
pAIScripting0x02_L096:
    %AICMD0x1C_ShowDialog($026C, $00)                          ;B3B28F
    %AICMD0x12_Jump(pAIScripting0x02_L081)                                   ;B3B293
pAIScripting0x02_L097:
    %AICMD0x1C_ShowDialog($0099, $00)                          ;B3B296
    %AICMD0x12_Jump(pAIScripting0x02_L082)                                   ;B3B29A
pAIScripting0x02_L098:
    %AICMD0x1C_ShowDialog($0391, $00)                          ;B3B29D
    %AICMD0x12_Jump(pAIScripting0x02_L070)                                   ;B3B2A1
pAIScripting0x02_L099:
    %AICMD0x1C_ShowDialog($01DE, $00)                          ;B3B2A4
    %AICMD0x12_Jump(pAIScripting0x02_L070)                                   ;B3B2A8
pAIScripting0x02_L100:
    %AICMD0x1A($0168, $0368, aAIScriptingData_L201, $00)                     ;B3B2AB
pAIScripting0x02_L101:
    %AICMD0x13_Wait(1)                                         ;B3B2B3
    %AICMD0x12_Jump(pAIScripting0x02_L101)                                   ;B3B2B6
pAIScripting0x02_L102:
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 17, 18, pAIScripting0x02_L115) ;B3B2B9
    %AICMD0x1A($0218, $0318, aAIScriptingData_L021, $00)                     ;B3B2C1
pAIScripting0x02_L103:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x02_L106)                                        ;B3B2C9
    %AICMD0x2D_JumpOnInteract(pAIScripting0x02_L114, pAIScripting0x02_L108)                               ;B3B2CC
    %AICMD0x12_Jump(pAIScripting0x02_L103)                                   ;B3B2D1
pAIScripting0x02_L104:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x02_L106)                                        ;B3B2D4
    %AICMD0x2D_JumpOnInteract(pAIScripting0x02_L119, pAIScripting0x02_L108)                               ;B3B2D7
    %AICMD0x12_Jump(pAIScripting0x02_L104)                                   ;B3B2DC
pAIScripting0x02_L105:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x02_L106)                                        ;B3B2DF
    %AICMD0x1F(pAIScripting0x02_L124)                                        ;B3B2E2
    %AICMD0x12_Jump(pAIScripting0x02_L105)                                   ;B3B2E5
pAIScripting0x02_L106:
    %AICMD0x45_JumpIfBetween16(nLove_Ellen, 0, 249, pAIScripting0x02_L107)   ;B3B2E8
    %AICMD0x1C_ShowDialog($0179, $00)                          ;B3B2F2
    %AICMD0x47_SetValue8(wram80(strcPlayerData.toolEquipped), 0)                           ;B3B2F6
    %AICMD0x23_OrWithIndexedValue(strcFlags.event2, $03)       ;B3B2FB
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily3, $08)       ;B3B300
    %AICMD0x3D_TeleportToArea(!AREA_WEDDINGSPRING)             ;B3B305
    %AICMD0x10_End()                                           ;B3B307
pAIScripting0x02_L107:
    %AICMD0x1C_ShowDialog($017A, $00)                          ;B3B308
    %AICMD0x12_Jump(pAIScripting0x02_L103)                                   ;B3B30C
pAIScripting0x02_L108:
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 2, pAIScripting0x02_L109)              ;B3B30F
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 1, 5, pAIScripting0x02_L110)          ;B3B316
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 7, pAIScripting0x02_L110)              ;B3B31E
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 73, pAIScripting0x02_L112)             ;B3B325
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 16, 19, pAIScripting0x02_L110)        ;B3B32C
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 20, 23, pAIScripting0x02_L111)        ;B3B334
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 9, 12, pAIScripting0x02_L113)         ;B3B33C
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3B344
    %AICMD0x12_Jump(pAIScripting0x02_L103)                                   ;B3B348
pAIScripting0x02_L109:
    %AICMD0x1C_ShowDialog($03B0, $00)                          ;B3B34B
    %AICMD0x41_AddValue16(nLove_Ellen, -8)                     ;B3B34F
    %AICMD0x12_Jump(pAIScripting0x02_L103)                                   ;B3B355
pAIScripting0x02_L110:
    %AICMD0x1C_ShowDialog($03B2, $00)                          ;B3B358
    %AICMD0x41_AddValue16(nLove_Ellen, 5)                      ;B3B35C
    %AICMD0x12_Jump(pAIScripting0x02_L103)                                   ;B3B362
pAIScripting0x02_L111:
    %AICMD0x1C_ShowDialog($03B3, $00)                          ;B3B365
    %AICMD0x41_AddValue16(nLove_Ellen, 8)                      ;B3B369
    %AICMD0x12_Jump(pAIScripting0x02_L103)                                   ;B3B36F
pAIScripting0x02_L112:
    %AICMD0x1C_ShowDialog($0212, $00)                          ;B3B372
    %AICMD0x41_AddValue16(nLove_Ellen, 5)                      ;B3B376
    %AICMD0x12_Jump(pAIScripting0x02_L103)                                   ;B3B37C
pAIScripting0x02_L113:
    %AICMD0x1C_ShowDialog($01DA, $00)                          ;B3B37F
    %AICMD0x41_AddValue16(nLove_Ellen, -2)                     ;B3B383
    %AICMD0x12_Jump(pAIScripting0x02_L103)                                   ;B3B389
pAIScripting0x02_L114:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $02, pAIScripting0x02_L126)   ;B3B38C
    %AICMD0x45_JumpIfBetween16(nLove_Ellen, 120, 149, pAIScripting0x02_L120) ;B3B393
    %AICMD0x45_JumpIfBetween16(nLove_Ellen, 150, 200, pAIScripting0x02_L121) ;B3B39D
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 7, 16, pAIScripting0x02_L116)  ;B3B3A7
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 17, 18, pAIScripting0x02_L125) ;B3B3AF
    %AICMD0x12_Jump(pAIScripting0x02_L103)                                   ;B3B3B7
pAIScripting0x02_L115:
    %AICMD0x10_End()                                           ;B3B3BA
pAIScripting0x02_L116:
    %AICMD0x1D_ShowDialog($00D2, $00)                          ;B3B3BB
    %AICMD0x20_JumpIfChoice(0, pAIScripting0x02_L117)                        ;B3B3BF
    %AICMD0x20_JumpIfChoice(1, pAIScripting0x02_L118)                        ;B3B3C3
    %AICMD0x12_Jump(pAIScripting0x02_L104)                                   ;B3B3C7
pAIScripting0x02_L117:
    %AICMD0x1C_ShowDialog($00D3, $00)                          ;B3B3CA
    %AICMD0x41_AddValue16(nLove_Ellen, 8)                      ;B3B3CE
    %AICMD0x12_Jump(pAIScripting0x02_L104)                                   ;B3B3D4
pAIScripting0x02_L118:
    %AICMD0x1C_ShowDialog($00D4, $00)                          ;B3B3D7
    %AICMD0x41_AddValue16(nLove_Ellen, 2)                      ;B3B3DB
    %AICMD0x12_Jump(pAIScripting0x02_L104)                                   ;B3B3E1
pAIScripting0x02_L119:
    %AICMD0x1C_ShowDialog($00C5, $00)                          ;B3B3E4
    %AICMD0x12_Jump(pAIScripting0x02_L104)                                   ;B3B3E8
pAIScripting0x02_L120:
    %AICMD0x1C_ShowDialog($00D8, $00)                          ;B3B3EB
    %AICMD0x12_Jump(pAIScripting0x02_L104)                                   ;B3B3EF
pAIScripting0x02_L121:
    %AICMD0x09_StartScript($0A, pAIScripting0x02_L127)                                   ;B3B3F2
    %AICMD0x1D_ShowDialog($00D9, $00)                          ;B3B3F6
    %AICMD0x20_JumpIfChoice(0, pAIScripting0x02_L122)                        ;B3B3FA
    %AICMD0x20_JumpIfChoice(1, pAIScripting0x02_L123)                        ;B3B3FE
    %AICMD0x12_Jump(pAIScripting0x02_L104)                                   ;B3B402
pAIScripting0x02_L122:
    %AICMD0x08_EnableAIControl()                               ;B3B405
    %AICMD0x19($0039, $00)                                     ;B3B406
    %AICMD0x13_Wait(120)                                       ;B3B40A
    %AICMD0x11_EnableUserControl()                             ;B3B40D
    %AICMD0x1C_ShowDialog($00DA, $00)                          ;B3B40E
    %AICMD0x41_AddValue16(nLove_Ellen, 10)                     ;B3B412
    %AICMD0x12_Jump(pAIScripting0x02_L105)                                   ;B3B418
pAIScripting0x02_L123:
    %AICMD0x1C_ShowDialog($025B, $00)                          ;B3B41B
    %AICMD0x41_AddValue16(nLove_Ellen, 2)                      ;B3B41F
    %AICMD0x12_Jump(pAIScripting0x02_L105)                                   ;B3B425
pAIScripting0x02_L124:
    %AICMD0x1C_ShowDialog($00DB, $00)                          ;B3B428
    %AICMD0x12_Jump(pAIScripting0x02_L105)                                   ;B3B42C
pAIScripting0x02_L125:
    %AICMD0x1C_ShowDialog($0391, $00)                          ;B3B42F
    %AICMD0x12_Jump(pAIScripting0x02_L103)                                   ;B3B433
pAIScripting0x02_L126:
    %AICMD0x1C_ShowDialog($01EE, $00)                          ;B3B436
    %AICMD0x12_Jump(pAIScripting0x02_L103)                                   ;B3B43A
pAIScripting0x02_L127:
    %AICMD0x1A($0218, $0308, aAIScriptingData_L185, $00)                     ;B3B43D
    %AICMD0x13_Wait(1)                                         ;B3B445
    %AICMD0x37()                                               ;B3B448
    %AICMD0x10_End()                                           ;B3B449


pAIScripting0x02_Data02:
 
    %AICMD0x11_EnableUserControl()                             ;B3B44A
    %AICMD0x09_StartScript($01, pAIScripting0x02_L129)                                   ;B3B44B
    %AICMD0x09_StartScript($02, pAIScripting0x02_L136)                                   ;B3B44F
pAIScripting0x02_L128:
    %AICMD0x13_Wait(1)                                         ;B3B453
    %AICMD0x12_Jump(pAIScripting0x02_L128)                                   ;B3B456
pAIScripting0x02_L129:
    %AICMD0x1A($00A8, $0078, aAIScriptingData_L044, $00)                     ;B3B459
pAIScripting0x02_L130:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x02_L131)                                        ;B3B461
    %AICMD0x2D_JumpOnInteract(pAIScripting0x02_L134, pAIScripting0x02_L132)                               ;B3B464
    %AICMD0x12_Jump(pAIScripting0x02_L130)                                   ;B3B469
pAIScripting0x02_L131:
    %AICMD0x1C_ShowDialog($01C9, $00)                          ;B3B46C
    %AICMD0x12_Jump(pAIScripting0x02_L130)                                   ;B3B470
pAIScripting0x02_L132:
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 9, 12, pAIScripting0x02_L133)         ;B3B473
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3B47B
    %AICMD0x12_Jump(pAIScripting0x02_L130)                                   ;B3B47F
pAIScripting0x02_L133:
    %AICMD0x1C_ShowDialog($03B8, $00)                          ;B3B482
    %AICMD0x12_Jump(pAIScripting0x02_L130)                                   ;B3B486
pAIScripting0x02_L134:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event4, $0C, pAIScripting0x02_L135)   ;B3B489
    %AICMD0x1C_ShowDialog($0038, $00)                          ;B3B490
    %AICMD0x12_Jump(pAIScripting0x02_L130)                                   ;B3B494
pAIScripting0x02_L135:
    %AICMD0x1C_ShowDialog($01CD, $00)                          ;B3B497
    %AICMD0x12_Jump(pAIScripting0x02_L130)                                   ;B3B49B
pAIScripting0x02_L136:
    %AICMD0x1A($0188, $00A0, aAIScriptingData_L063, $00)                     ;B3B49E
pAIScripting0x02_L137:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x02_L138)                                        ;B3B4A6
    %AICMD0x2D_JumpOnInteract(pAIScripting0x02_L141, pAIScripting0x02_L139)                               ;B3B4A9
    %AICMD0x12_Jump(pAIScripting0x02_L137)                                   ;B3B4AE
pAIScripting0x02_L138:
    %AICMD0x1C_ShowDialog($01C6, $00)                          ;B3B4B1
    %AICMD0x12_Jump(pAIScripting0x02_L137)                                   ;B3B4B5
pAIScripting0x02_L139:
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 9, 12, pAIScripting0x02_L140)         ;B3B4B8
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3B4C0
    %AICMD0x12_Jump(pAIScripting0x02_L137)                                   ;B3B4C4
pAIScripting0x02_L140:
    %AICMD0x1C_ShowDialog($03B9, $00)                          ;B3B4C7
    %AICMD0x12_Jump(pAIScripting0x02_L137)                                   ;B3B4CB
pAIScripting0x02_L141:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event4, $0C, pAIScripting0x02_L142)   ;B3B4CE
    %AICMD0x1C_ShowDialog($003D, $00)                          ;B3B4D5
    %AICMD0x12_Jump(pAIScripting0x02_L137)                                   ;B3B4D9
pAIScripting0x02_L142:
    %AICMD0x1C_ShowDialog($01CE, $00)                          ;B3B4DC
    %AICMD0x12_Jump(pAIScripting0x02_L137)                                   ;B3B4E0


pAIScripting0x02_Data03:
 
    %AICMD0x11_EnableUserControl()                             ;B3B4E3
    %AICMD0x09_StartScript($01, pAIScripting0x02_L146)                                   ;B3B4E4
    %AICMD0x09_StartScript($02, pAIScripting0x02_L153)                                   ;B3B4E8
    %AICMD0x12_Jump(pAIScripting0x02_L144)                                   ;B3B4EC
pAIScripting0x02_L143:
    %AICMD0x13_Wait(1)                                         ;B3B4EF
    %AICMD0x12_Jump(pAIScripting0x02_L143)                                   ;B3B4F2
pAIScripting0x02_L144:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $00, pAIScripting0x02_L145)   ;B3B4F5
    %AICMD0x14_JumpIfFlagSet(strcFlags.event4, $0C, pAIScripting0x02_L145)   ;B3B4FC
    %AICMD0x09_StartScript($03, pAIScripting0x02_L163)                                   ;B3B503
pAIScripting0x02_L145:
    %AICMD0x12_Jump(pAIScripting0x02_L143)                                   ;B3B507
pAIScripting0x02_L146:
    %AICMD0x1A($0088, $0090, aAIScriptingData_L051, $00)                     ;B3B50A
pAIScripting0x02_L147:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x02_L148)                                        ;B3B512
    %AICMD0x2D_JumpOnInteract(pAIScripting0x02_L151, pAIScripting0x02_L149)                               ;B3B515
    %AICMD0x12_Jump(pAIScripting0x02_L147)                                   ;B3B51A
pAIScripting0x02_L148:
    %AICMD0x1C_ShowDialog($01E0, $00)                          ;B3B51D
    %AICMD0x12_Jump(pAIScripting0x02_L137)                                   ;B3B521
pAIScripting0x02_L149:
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 9, 12, pAIScripting0x02_L150)         ;B3B524
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3B52C
    %AICMD0x12_Jump(pAIScripting0x02_L147)                                   ;B3B530
pAIScripting0x02_L150:
    %AICMD0x1C_ShowDialog($03B0, $00)                          ;B3B533
    %AICMD0x12_Jump(pAIScripting0x02_L147)                                   ;B3B537
pAIScripting0x02_L151:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event4, $0C, pAIScripting0x02_L152)   ;B3B53A
    %AICMD0x1C_ShowDialog($005A, $00)                          ;B3B541
    %AICMD0x12_Jump(pAIScripting0x02_L147)                                   ;B3B545
pAIScripting0x02_L152:
    %AICMD0x1C_ShowDialog($01CF, $00)                          ;B3B548
    %AICMD0x12_Jump(pAIScripting0x02_L147)                                   ;B3B54C
pAIScripting0x02_L153:
    %AICMD0x1A($0078, $0148, aAIScriptingData_L042, $00)                     ;B3B54F
pAIScripting0x02_L154:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x02_L155)                                        ;B3B557
    %AICMD0x2D_JumpOnInteract(pAIScripting0x02_L158, pAIScripting0x02_L156)                               ;B3B55A
    %AICMD0x12_Jump(pAIScripting0x02_L154)                                   ;B3B55F
pAIScripting0x02_L155:
    %AICMD0x1C_ShowDialog($01CA, $00)                          ;B3B562
    %AICMD0x12_Jump(pAIScripting0x02_L154)                                   ;B3B566
pAIScripting0x02_L156:
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 9, 12, pAIScripting0x02_L157)         ;B3B569
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3B571
    %AICMD0x12_Jump(pAIScripting0x02_L154)                                   ;B3B575
pAIScripting0x02_L157:
    %AICMD0x1C_ShowDialog($03BB, $00)                          ;B3B578
    %AICMD0x12_Jump(pAIScripting0x02_L154)                                   ;B3B57C
pAIScripting0x02_L158:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event4, $0C, pAIScripting0x02_L159)   ;B3B57F
    %AICMD0x14_JumpIfFlagSet(strcFlags.event4, $0E, pAIScripting0x02_L160)   ;B3B586
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $00, pAIScripting0x02_L161)   ;B3B58D
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $02, pAIScripting0x02_L162)   ;B3B594
    %AICMD0x1C_ShowDialog($03EA, $00)                          ;B3B59B
    %AICMD0x12_Jump(pAIScripting0x02_L154)                                   ;B3B59F
pAIScripting0x02_L159:
    %AICMD0x1C_ShowDialog($01D1, $00)                          ;B3B5A2
    %AICMD0x1B($0288, $00)                                     ;B3B5A6
    %AICMD0x12_Jump(pAIScripting0x02_L154)                                   ;B3B5AA
pAIScripting0x02_L160:
    %AICMD0x1C_ShowDialog($01DD, $00)                          ;B3B5AD
    %AICMD0x1B($0288, $00)                                     ;B3B5B1
    %AICMD0x12_Jump(pAIScripting0x02_L154)                                   ;B3B5B5
pAIScripting0x02_L161:
    %AICMD0x1C_ShowDialog($01E6, $00)                          ;B3B5B8
    %AICMD0x1B($0288, $00)                                     ;B3B5BC
    %AICMD0x12_Jump(pAIScripting0x02_L154)                                   ;B3B5C0
pAIScripting0x02_L162:
    %AICMD0x1C_ShowDialog($01EF, $00)                          ;B3B5C3
    %AICMD0x1B($0288, $00)                                     ;B3B5C7
    %AICMD0x12_Jump(pAIScripting0x02_L154)                                   ;B3B5CB
pAIScripting0x02_L163:
    %AICMD0x1A($0048, $0198, aAIScriptingData_L011, $02)                     ;B3B5CE
pAIScripting0x02_L164:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x02_L166)                                        ;B3B5D6
    %AICMD0x2D_JumpOnInteract(pAIScripting0x02_L174, pAIScripting0x02_L168)                               ;B3B5D9
    %AICMD0x12_Jump(pAIScripting0x02_L164)                                   ;B3B5DE
pAIScripting0x02_L165:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x02_L166)                                        ;B3B5E1
    %AICMD0x2D_JumpOnInteract(pAIScripting0x02_L179, pAIScripting0x02_L168)                               ;B3B5E4
    %AICMD0x12_Jump(pAIScripting0x02_L165)                                   ;B3B5E9
pAIScripting0x02_L166:
    %AICMD0x45_JumpIfBetween16(nLove_Maria, 0, 249, pAIScripting0x02_L167)   ;B3B5EC
    %AICMD0x1C_ShowDialog($0173, $00)                          ;B3B5F6
    %AICMD0x47_SetValue8(wram80(strcPlayerData.toolEquipped), 0)                           ;B3B5FA
    %AICMD0x23_OrWithIndexedValue(strcFlags.event2, $00)       ;B3B5FF
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily3, $07)       ;B3B604
    %AICMD0x3D_TeleportToArea(!AREA_WEDDINGSPRING)             ;B3B609
    %AICMD0x10_End()                                           ;B3B60B
pAIScripting0x02_L167:
    %AICMD0x1C_ShowDialog($0174, $00)                          ;B3B60C
    %AICMD0x12_Jump(pAIScripting0x02_L164)                                   ;B3B610
pAIScripting0x02_L168:
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 2, pAIScripting0x02_L169)              ;B3B613
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 1, 5, pAIScripting0x02_L172)          ;B3B61A
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 16, 23, pAIScripting0x02_L172)        ;B3B622
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 6, pAIScripting0x02_L171)              ;B3B62A
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 25, pAIScripting0x02_L170)             ;B3B631
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 73, pAIScripting0x02_L170)             ;B3B638
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 9, 12, pAIScripting0x02_L173)         ;B3B63F
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3B647
    %AICMD0x12_Jump(pAIScripting0x02_L164)                                   ;B3B64B
pAIScripting0x02_L169:
    %AICMD0x1C_ShowDialog($03B0, $00)                          ;B3B64E
    %AICMD0x41_AddValue16(nLove_Maria, -8)                     ;B3B652
    %AICMD0x12_Jump(pAIScripting0x02_L164)                                   ;B3B658
pAIScripting0x02_L170:
    %AICMD0x1C_ShowDialog($0212, $00)                          ;B3B65B
    %AICMD0x41_AddValue16(nLove_Maria, 4)                      ;B3B65F
    %AICMD0x12_Jump(pAIScripting0x02_L164)                                   ;B3B665
pAIScripting0x02_L171:
    %AICMD0x1C_ShowDialog($03B5, $00)                          ;B3B668
    %AICMD0x41_AddValue16(nLove_Maria, 3)                      ;B3B66C
    %AICMD0x12_Jump(pAIScripting0x02_L164)                                   ;B3B672
pAIScripting0x02_L172:
    %AICMD0x1C_ShowDialog($03B2, $00)                          ;B3B675
    %AICMD0x41_AddValue16(nLove_Maria, 5)                      ;B3B679
    %AICMD0x12_Jump(pAIScripting0x02_L164)                                   ;B3B67F
pAIScripting0x02_L173:
    %AICMD0x1C_ShowDialog($01DA, $00)                          ;B3B682
    %AICMD0x41_AddValue16(nLove_Maria, -2)                     ;B3B686
    %AICMD0x12_Jump(pAIScripting0x02_L164)                                   ;B3B68C
pAIScripting0x02_L174:
    %AICMD0x45_JumpIfBetween16(nLove_Maria, 120, 149, pAIScripting0x02_L175) ;B3B68F
    %AICMD0x45_JumpIfBetween16(nLove_Maria, 150, 200, pAIScripting0x02_L176) ;B3B699
    %AICMD0x1C_ShowDialog($040F, $00)                          ;B3B6A3
    %AICMD0x12_Jump(pAIScripting0x02_L164)                                   ;B3B6A7
pAIScripting0x02_L175:
    %AICMD0x1C_ShowDialog($0092, $00)                          ;B3B6AA
    %AICMD0x12_Jump(pAIScripting0x02_L164)                                   ;B3B6AE
pAIScripting0x02_L176:
    %AICMD0x1D_ShowDialog($0093, $00)                          ;B3B6B1
    %AICMD0x20_JumpIfChoice(0, pAIScripting0x02_L177)                        ;B3B6B5
    %AICMD0x20_JumpIfChoice(1, pAIScripting0x02_L178)                        ;B3B6B9
    %AICMD0x12_Jump(pAIScripting0x02_L165)                                   ;B3B6BD
pAIScripting0x02_L177:
    %AICMD0x1C_ShowDialog($0094, $00)                          ;B3B6C0
    %AICMD0x41_AddValue16(nLove_Maria, 10)                     ;B3B6C4
    %AICMD0x12_Jump(pAIScripting0x02_L165)                                   ;B3B6CA
pAIScripting0x02_L178:
    %AICMD0x1C_ShowDialog($0095, $00)                          ;B3B6CD
    %AICMD0x41_AddValue16(nLove_Maria, 2)                      ;B3B6D1
    %AICMD0x12_Jump(pAIScripting0x02_L165)                                   ;B3B6D7
pAIScripting0x02_L179:
    %AICMD0x1C_ShowDialog($0088, $00)                          ;B3B6DA
    %AICMD0x12_Jump(pAIScripting0x02_L165)                                   ;B3B6DE


pAIScripting0x02_Data04:
 
    %AICMD0x11_EnableUserControl()                             ;B3B6E1
    %AICMD0x09_StartScript($01, pAIScripting0x02_L183)                                   ;B3B6E2
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $04, pAIScripting0x02_L181)   ;B3B6E6
    %AICMD0x09_StartScript($02, pAIScripting0x02_L195)                                   ;B3B6ED
    %AICMD0x12_Jump(pAIScripting0x02_L181)                                   ;B3B6F1
pAIScripting0x02_L180:
    %AICMD0x13_Wait(1)                                         ;B3B6F4
    %AICMD0x12_Jump(pAIScripting0x02_L180)                                   ;B3B6F7
pAIScripting0x02_L181:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $04, pAIScripting0x02_L182)   ;B3B6FA
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $04, pAIScripting0x02_L182)   ;B3B701
    %AICMD0x09_StartScript($03, pAIScripting0x02_L202)                                   ;B3B708
pAIScripting0x02_L182:
    %AICMD0x12_Jump(pAIScripting0x02_L180)                                   ;B3B70C
pAIScripting0x02_L183:
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 17, 18, pAIScripting0x02_L194) ;B3B70F
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, pAIScripting0x02_L194)     ;B3B717
    %AICMD0x1A($0258, $0178, aAIScriptingData_L032, $00)                     ;B3B71E
pAIScripting0x02_L184:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x02_L186)                                        ;B3B726
    %AICMD0x2D_JumpOnInteract(pAIScripting0x02_L189, pAIScripting0x02_L187)                               ;B3B729
    %AICMD0x12_Jump(pAIScripting0x02_L184)                                   ;B3B72E
pAIScripting0x02_L185:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x02_L186)                                        ;B3B731
    %AICMD0x2D_JumpOnInteract(pAIScripting0x02_L192, pAIScripting0x02_L187)                               ;B3B734
    %AICMD0x12_Jump(pAIScripting0x02_L185)                                   ;B3B739
pAIScripting0x02_L186:
    %AICMD0x1C_ShowDialog($01C9, $00)                          ;B3B73C
    %AICMD0x12_Jump(pAIScripting0x02_L185)                                   ;B3B740
pAIScripting0x02_L187:
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 9, 12, pAIScripting0x02_L188)         ;B3B743
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3B74B
    %AICMD0x12_Jump(pAIScripting0x02_L184)                                   ;B3B74F
pAIScripting0x02_L188:
    %AICMD0x1C_ShowDialog($03B8, $00)                          ;B3B752
    %AICMD0x12_Jump(pAIScripting0x02_L184)                                   ;B3B756
pAIScripting0x02_L189:
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 17, 18, pAIScripting0x02_L193) ;B3B759
    %AICMD0x1D_ShowDialog($007E, $00)                          ;B3B761
    %AICMD0x20_JumpIfChoice(0, pAIScripting0x02_L190)                        ;B3B765
    %AICMD0x20_JumpIfChoice(1, pAIScripting0x02_L191)                        ;B3B769
    %AICMD0x12_Jump(pAIScripting0x02_L184)                                   ;B3B76D
pAIScripting0x02_L190:
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily1, $09)       ;B3B770
    %AICMD0x1C_ShowDialog($007F, $00)                          ;B3B775
    %AICMD0x12_Jump(pAIScripting0x02_L185)                                   ;B3B779
pAIScripting0x02_L191:
    %AICMD0x1C_ShowDialog($0080, $00)                          ;B3B77C
    %AICMD0x12_Jump(pAIScripting0x02_L184)                                   ;B3B780
pAIScripting0x02_L192:
    %AICMD0x28_ClearBit(strcFlags.daily1, $09)                          ;B3B783
    %AICMD0x1C_ShowDialog($0081, $00)                          ;B3B788
    %AICMD0x12_Jump(pAIScripting0x02_L184)                                   ;B3B78C
    %AICMD0x1C_ShowDialog($0151, $00)                          ;B3B78F
    %AICMD0x12_Jump(pAIScripting0x02_L184)                                   ;B3B793
pAIScripting0x02_L193:
    %AICMD0x1C_ShowDialog($0392, $00)                          ;B3B796
    %AICMD0x12_Jump(pAIScripting0x02_L184)                                   ;B3B79A
pAIScripting0x02_L194:
    %AICMD0x10_End()                                           ;B3B79D
pAIScripting0x02_L195:
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 17, 18, pAIScripting0x02_L201) ;B3B79E
    %AICMD0x1A($0068, $0038, aAIScriptingData_L040, $00)                     ;B3B7A6
pAIScripting0x02_L196:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x02_L197)                                        ;B3B7AE
    %AICMD0x2D_JumpOnInteract(pAIScripting0x02_L200, pAIScripting0x02_L198)                               ;B3B7B1
    %AICMD0x12_Jump(pAIScripting0x02_L196)                                   ;B3B7B6
pAIScripting0x02_L197:
    %AICMD0x1C_ShowDialog($01C9, $00)                          ;B3B7B9
    %AICMD0x12_Jump(pAIScripting0x02_L196)                                   ;B3B7BD
pAIScripting0x02_L198:
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 9, 12, pAIScripting0x02_L199)         ;B3B7C0
    %AICMD0x1C_ShowDialog($03BC, $00)                          ;B3B7C8
    %AICMD0x12_Jump(pAIScripting0x02_L196)                                   ;B3B7CC
pAIScripting0x02_L199:
    %AICMD0x1C_ShowDialog($0049, $00)                          ;B3B7CF
    %AICMD0x12_Jump(pAIScripting0x02_L196)                                   ;B3B7D3
pAIScripting0x02_L200:
    %AICMD0x1C_ShowDialog($007B, $00)                          ;B3B7D6
    %AICMD0x12_Jump(pAIScripting0x02_L196)                                   ;B3B7DA
pAIScripting0x02_L201:
    %AICMD0x10_End()                                           ;B3B7DD
pAIScripting0x02_L202:
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 17, 18, pAIScripting0x02_L216) ;B3B7DE
    %AICMD0x1A($01F8, $00D8, aAIScriptingData_L025, $00)                     ;B3B7E6
pAIScripting0x02_L203:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x02_L205)                                        ;B3B7EE
    %AICMD0x2D_JumpOnInteract(pAIScripting0x02_L212, pAIScripting0x02_L207)                               ;B3B7F1
    %AICMD0x12_Jump(pAIScripting0x02_L203)                                   ;B3B7F6
pAIScripting0x02_L204:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x02_L205)                                        ;B3B7F9
    %AICMD0x2D_JumpOnInteract(pAIScripting0x02_L215, pAIScripting0x02_L207)                               ;B3B7FC
    %AICMD0x12_Jump(pAIScripting0x02_L204)                                   ;B3B801
pAIScripting0x02_L205:
    %AICMD0x45_JumpIfBetween16(nLove_Eve, 0, 249, pAIScripting0x02_L206)     ;B3B804
    %AICMD0x1C_ShowDialog($017B, $00)                          ;B3B80E
    %AICMD0x47_SetValue8(wram80(strcPlayerData.toolEquipped), 0)                           ;B3B812
    %AICMD0x23_OrWithIndexedValue(strcFlags.event2, $04)       ;B3B817
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily3, $09)       ;B3B81C
    %AICMD0x3D_TeleportToArea(!AREA_WEDDINGSPRING)             ;B3B821
    %AICMD0x10_End()                                           ;B3B823
pAIScripting0x02_L206:
    %AICMD0x1C_ShowDialog($017C, $00)                          ;B3B824
    %AICMD0x12_Jump(pAIScripting0x02_L203)                                   ;B3B828
pAIScripting0x02_L207:
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 2, pAIScripting0x02_L208)              ;B3B82B
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 7, pAIScripting0x02_L208)              ;B3B832
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 1, 5, pAIScripting0x02_L209)          ;B3B839
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 16, 23, pAIScripting0x02_L209)        ;B3B841
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 25, pAIScripting0x02_L210)             ;B3B849
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 73, pAIScripting0x02_L210)             ;B3B850
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 6, pAIScripting0x02_L210)              ;B3B857
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 9, 12, pAIScripting0x02_L211)         ;B3B85E
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3B866
    %AICMD0x12_Jump(pAIScripting0x02_L203)                                   ;B3B86A
pAIScripting0x02_L208:
    %AICMD0x1C_ShowDialog($03B4, $00)                          ;B3B86D
    %AICMD0x41_AddValue16(nLove_Eve, -8)                       ;B3B871
    %AICMD0x12_Jump(pAIScripting0x02_L203)                                   ;B3B877
pAIScripting0x02_L209:
    %AICMD0x1C_ShowDialog($03B2, $00)                          ;B3B87A
    %AICMD0x41_AddValue16(nLove_Eve, 4)                        ;B3B87E
    %AICMD0x12_Jump(pAIScripting0x02_L203)                                   ;B3B884
pAIScripting0x02_L210:
    %AICMD0x1C_ShowDialog($0212, $00)                          ;B3B887
    %AICMD0x41_AddValue16(nLove_Eve, 6)                        ;B3B88B
    %AICMD0x12_Jump(pAIScripting0x02_L203)                                   ;B3B891
pAIScripting0x02_L211:
    %AICMD0x1C_ShowDialog($03BA, $00)                          ;B3B894
    %AICMD0x41_AddValue16(nLove_Eve, -2)                       ;B3B898
    %AICMD0x12_Jump(pAIScripting0x02_L203)                                   ;B3B89E
pAIScripting0x02_L212:
    %AICMD0x1D_ShowDialog($00DC, $00)                          ;B3B8A1
    %AICMD0x20_JumpIfChoice(0, pAIScripting0x02_L213)                        ;B3B8A5
    %AICMD0x20_JumpIfChoice(1, pAIScripting0x02_L214)                        ;B3B8A9
    %AICMD0x12_Jump(pAIScripting0x02_L204)                                   ;B3B8AD
pAIScripting0x02_L213:
    %AICMD0x1C_ShowDialog($00DD, $00)                          ;B3B8B0
    %AICMD0x41_AddValue16(nLove_Eve, 2)                        ;B3B8B4
    %AICMD0x12_Jump(pAIScripting0x02_L204)                                   ;B3B8BA
pAIScripting0x02_L214:
    %AICMD0x1C_ShowDialog($00DE, $00)                          ;B3B8BD
    %AICMD0x41_AddValue16(nLove_Eve, 8)                        ;B3B8C1
    %AICMD0x12_Jump(pAIScripting0x02_L204)                                   ;B3B8C7
pAIScripting0x02_L215:
    %AICMD0x1C_ShowDialog($00DD, $00)                          ;B3B8CA
    %AICMD0x12_Jump(pAIScripting0x02_L204)                                   ;B3B8CE
pAIScripting0x02_L216:
    %AICMD0x10_End()                                           ;B3B8D1


pAIScripting0x02_Data05:
    %AICMD0x11_EnableUserControl()                             ;B3B8D2
    %AICMD0x12_Jump(pAIScripting0x02_L218)                                   ;B3B8D3
pAIScripting0x02_L217:
    %AICMD0x13_Wait(1)                                         ;B3B8D6
    %AICMD0x12_Jump(pAIScripting0x02_L217)                                   ;B3B8D9
pAIScripting0x02_L218:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, pAIScripting0x02_L219)   ;B3B8DC
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $00, pAIScripting0x02_L219)   ;B3B8E3
    %AICMD0x09_StartScript($01, pAIScripting0x02_L220)                                   ;B3B8EA
pAIScripting0x02_L219:
    %AICMD0x12_Jump(pAIScripting0x02_L217)                                   ;B3B8EE
pAIScripting0x02_L220:
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 17, 18, pAIScripting0x02_L241) ;B3B8F1
    %AICMD0x1A($0058, $01A8, aAIScriptingData_L020, $00)                     ;B3B8F9
    %AICMD0x22($18, $10, $01, aAIScriptingData_L020, $10)                    ;B3B901
pAIScripting0x02_L221:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x02_L224)                                        ;B3B908
    %AICMD0x2D_JumpOnInteract(pAIScripting0x02_L232, pAIScripting0x02_L226)                               ;B3B90B
    %AICMD0x12_Jump(pAIScripting0x02_L221)                                   ;B3B910
pAIScripting0x02_L222:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x02_L224)                                        ;B3B913
    %AICMD0x1F(pAIScripting0x02_L235)                                        ;B3B916
    %AICMD0x12_Jump(pAIScripting0x02_L222)                                   ;B3B919
pAIScripting0x02_L223:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x02_L224)                                        ;B3B91C
    %AICMD0x1F(pAIScripting0x02_L240)                                        ;B3B91F
    %AICMD0x12_Jump(pAIScripting0x02_L223)                                   ;B3B922
pAIScripting0x02_L224:
    %AICMD0x45_JumpIfBetween16(nLove_Nina, 0, 249, pAIScripting0x02_L225)    ;B3B925
    %AICMD0x1C_ShowDialog($043F, $00)                          ;B3B92F
    %AICMD0x12_Jump(pAIScripting0x02_L221)                                   ;B3B933
pAIScripting0x02_L225:
    %AICMD0x1C_ShowDialog($0178, $00)                          ;B3B936
    %AICMD0x12_Jump(pAIScripting0x02_L221)                                   ;B3B93A
pAIScripting0x02_L226:
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 2, pAIScripting0x02_L230)              ;B3B93D
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 5, pAIScripting0x02_L228)              ;B3B944
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 6, pAIScripting0x02_L228)              ;B3B94B
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 1, 7, pAIScripting0x02_L227)          ;B3B952
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 16, 23, pAIScripting0x02_L227)        ;B3B95A
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 24, pAIScripting0x02_L229)             ;B3B962
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 25, pAIScripting0x02_L231)             ;B3B969
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 9, 12, pAIScripting0x02_L230)         ;B3B970
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3B978
    %AICMD0x12_Jump(pAIScripting0x02_L221)                                   ;B3B97C
pAIScripting0x02_L227:
    %AICMD0x1C_ShowDialog($03B2, $00)                          ;B3B97F
    %AICMD0x41_AddValue16(nLove_Nina, 3)                       ;B3B983
    %AICMD0x12_Jump(pAIScripting0x02_L221)                                   ;B3B989
pAIScripting0x02_L228:
    %AICMD0x1C_ShowDialog($0212, $00)                          ;B3B98C
    %AICMD0x41_AddValue16(nLove_Nina, 8)                       ;B3B990
    %AICMD0x12_Jump(pAIScripting0x02_L221)                                   ;B3B996
pAIScripting0x02_L229:
    %AICMD0x1C_ShowDialog($03B1, $00)                          ;B3B999
    %AICMD0x41_AddValue16(nLove_Nina, -6)                      ;B3B99D
    %AICMD0x12_Jump(pAIScripting0x02_L221)                                   ;B3B9A3
pAIScripting0x02_L230:
    %AICMD0x1C_ShowDialog($01D9, $00)                          ;B3B9A6
    %AICMD0x41_AddValue16(nLove_Nina, -4)                      ;B3B9AA
    %AICMD0x12_Jump(pAIScripting0x02_L221)                                   ;B3B9B0
pAIScripting0x02_L231:
    %AICMD0x1C_ShowDialog($0143, $00)                          ;B3B9B3
    %AICMD0x41_AddValue16(nLove_Nina, 4)                       ;B3B9B7
    %AICMD0x12_Jump(pAIScripting0x02_L221)                                   ;B3B9BD
pAIScripting0x02_L232:
    %AICMD0x45_JumpIfBetween16(nLove_Nina, 120, 149, pAIScripting0x02_L236)  ;B3B9C0
    %AICMD0x45_JumpIfBetween16(nLove_Nina, 150, 200, pAIScripting0x02_L237)  ;B3B9CA
    %AICMD0x17_RollRandom($03)                                            ;B3B9D4
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x02_L233)                                   ;B3B9D6
    %AICMD0x18_JumpIfRandomEquals($01, pAIScripting0x02_L234)                                   ;B3B9DA
    %AICMD0x18_JumpIfRandomEquals($02, pAIScripting0x02_L235)                                   ;B3B9DE
    %AICMD0x12_Jump(pAIScripting0x02_L221)                                   ;B3B9E2
pAIScripting0x02_L233:
    %AICMD0x1C_ShowDialog($040C, $00)                          ;B3B9E5
    %AICMD0x12_Jump(pAIScripting0x02_L222)                                   ;B3B9E9
pAIScripting0x02_L234:
    %AICMD0x1C_ShowDialog($040D, $00)                          ;B3B9EC
    %AICMD0x12_Jump(pAIScripting0x02_L222)                                   ;B3B9F0
pAIScripting0x02_L235:
    %AICMD0x1C_ShowDialog($040E, $00)                          ;B3B9F3
    %AICMD0x12_Jump(pAIScripting0x02_L222)                                   ;B3B9F7
pAIScripting0x02_L236:
    %AICMD0x1C_ShowDialog($00C1, $00)                          ;B3B9FA
    %AICMD0x12_Jump(pAIScripting0x02_L221)                                   ;B3B9FE
pAIScripting0x02_L237:
    %AICMD0x1D_ShowDialog($00C2, $00)                          ;B3BA01
    %AICMD0x20_JumpIfChoice(0, pAIScripting0x02_L238)                        ;B3BA05
    %AICMD0x20_JumpIfChoice(1, pAIScripting0x02_L239)                        ;B3BA09
    %AICMD0x12_Jump(pAIScripting0x02_L221)                                   ;B3BA0D
pAIScripting0x02_L238:
    %AICMD0x1C_ShowDialog($00C3, $00)                          ;B3BA10
    %AICMD0x41_AddValue16(nLove_Nina, 10)                      ;B3BA14
    %AICMD0x12_Jump(pAIScripting0x02_L222)                                   ;B3BA1A
pAIScripting0x02_L239:
    %AICMD0x1C_ShowDialog($00C4, $00)                          ;B3BA1D
    %AICMD0x41_AddValue16(nLove_Nina, 2)                       ;B3BA21
    %AICMD0x12_Jump(pAIScripting0x02_L223)                                   ;B3BA27
pAIScripting0x02_L240:
    %AICMD0x1C_ShowDialog($00B1, $00)                          ;B3BA2A
    %AICMD0x12_Jump(pAIScripting0x02_L223)                                   ;B3BA2E
    %AICMD0x1C_ShowDialog($0391, $00)                          ;B3BA31
    %AICMD0x12_Jump(pAIScripting0x02_L221)                                   ;B3BA35
pAIScripting0x02_L241:
    %AICMD0x10_End()                                           ;B3BA38
