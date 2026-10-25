

    incsrc "../../../../build/gen/ai/slots_1F.asm"
 
pAIScripting0x1F_Data01:
 
    %AICMD0x50()                                               ;B49A5F
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily3, $0D)       ;B49A60
    %AICMD0x09_StartScript($01, pAIScripting0x1F_L009)                                   ;B49A65
    %AICMD0x09_StartScript($02, pAIScripting0x1F_L026)                                   ;B49A69
    %AICMD0x09_StartScript($03, pAIScripting0x1F_L022)                                   ;B49A6D
    %AICMD0x12_Jump(pAIScripting0x1F_L003)                                   ;B49A71
pAIScripting0x1F_L001:
    %AICMD0x55_JumpIfFlagNotSet(strcFlags.event6, $02, pAIScripting0x1F_L002)                 ;B49A74
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 0, 60, pAIScripting0x1F_L002) ;B49A7B
    %AICMD0x09_StartScript($05, pAIScripting0x1F_L069)                                   ;B49A85
pAIScripting0x1F_L002:
    %AICMD0x38_WaitForFadeIn()                                               ;B49A89
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B49A8A
    %AICMD0x13_Wait(3600)                                      ;B49A8C
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily3, $0D)       ;B49A8F
    %AICMD0x3D_TeleportToArea(!AREA_HOUSE3)                    ;B49A94
    %AICMD0x10_End()                                           ;B49A96
pAIScripting0x1F_L003:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $00, pAIScripting0x1F_L004)   ;B49A97
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $01, pAIScripting0x1F_L005)   ;B49A9E
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, pAIScripting0x1F_L006)   ;B49AA5
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $03, pAIScripting0x1F_L007)   ;B49AAC
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $04, pAIScripting0x1F_L008)   ;B49AB3
    %AICMD0x12_Jump(pAIScripting0x1F_L001)                                   ;B49ABA
pAIScripting0x1F_L004:
    %AICMD0x09_StartScript($04, pAIScripting0x1F_L029)                                   ;B49ABD
    %AICMD0x12_Jump(pAIScripting0x1F_L001)                                   ;B49AC1
pAIScripting0x1F_L005:
    %AICMD0x09_StartScript($04, pAIScripting0x1F_L032)                                   ;B49AC4
    %AICMD0x12_Jump(pAIScripting0x1F_L001)                                   ;B49AC8
pAIScripting0x1F_L006:
    %AICMD0x09_StartScript($04, pAIScripting0x1F_L035)                                   ;B49ACB
    %AICMD0x12_Jump(pAIScripting0x1F_L001)                                   ;B49ACF
pAIScripting0x1F_L007:
    %AICMD0x09_StartScript($04, pAIScripting0x1F_L038)                                   ;B49AD2
    %AICMD0x12_Jump(pAIScripting0x1F_L001)                                   ;B49AD6
pAIScripting0x1F_L008:
    %AICMD0x09_StartScript($04, pAIScripting0x1F_L041)                                   ;B49AD9
    %AICMD0x12_Jump(pAIScripting0x1F_L001)                                   ;B49ADD
pAIScripting0x1F_L009:
    %AICMD0x1A($0119, $0063, aAIScriptingData_L206, $00)                     ;B49AE0
pAIScripting0x1F_L010:
    %AICMD0x1F(pAIScripting0x1F_L012)                                        ;B49AE8
    %AICMD0x12_Jump(pAIScripting0x1F_L010)                                   ;B49AEB
pAIScripting0x1F_L011:
    %AICMD0x1F(pAIScripting0x1F_L016)                                        ;B49AEE
    %AICMD0x12_Jump(pAIScripting0x1F_L011)                                   ;B49AF1
pAIScripting0x1F_L012:
    %AICMD0x0B_SetScriptFlag($00)                                            ;B49AF4
    %AICMD0x1D_ShowDialog($01AA, $00)                          ;B49AF6
    %AICMD0x20_JumpIfChoice(0, pAIScripting0x1F_L013)                        ;B49AFA
    %AICMD0x20_JumpIfChoice(1, pAIScripting0x1F_L014)                        ;B49AFE
    %AICMD0x12_Jump(pAIScripting0x1F_L010)                                   ;B49B02
pAIScripting0x1F_L013:
    %AICMD0x1C_ShowDialog($01AB, $00)                          ;B49B05
    %AICMD0x25_RemoveActor($03)                                            ;B49B09
    %AICMD0x09_StartScript($03, pAIScripting0x1F_L025)                                   ;B49B0B
    %AICMD0x12_Jump(pAIScripting0x1F_L011)                                   ;B49B0F
pAIScripting0x1F_L014:
    %AICMD0x1C_ShowDialog($01AC, $00)                          ;B49B12
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $00, pAIScripting0x1F_L017)   ;B49B16
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $01, pAIScripting0x1F_L018)   ;B49B1D
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, pAIScripting0x1F_L019)   ;B49B24
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $03, pAIScripting0x1F_L020)   ;B49B2B
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $04, pAIScripting0x1F_L021)   ;B49B32
pAIScripting0x1F_L015:
    %AICMD0x1B($02E9, $00)                                     ;B49B39
    %AICMD0x12_Jump(pAIScripting0x1F_L011)                                   ;B49B3D
pAIScripting0x1F_L016:
    %AICMD0x1C_ShowDialog($01AD, $00)                          ;B49B40
    %AICMD0x12_Jump(pAIScripting0x1F_L011)                                   ;B49B44
pAIScripting0x1F_L017:
    %AICMD0x41_AddValue16(nLove_Maria, 50)                     ;B49B47
    %AICMD0x12_Jump(pAIScripting0x1F_L015)                                   ;B49B4D
pAIScripting0x1F_L018:
    %AICMD0x41_AddValue16(nLove_Ann, 50)                       ;B49B50
    %AICMD0x12_Jump(pAIScripting0x1F_L015)                                   ;B49B56
pAIScripting0x1F_L019:
    %AICMD0x41_AddValue16(nLove_Nina, 50)                      ;B49B59
    %AICMD0x12_Jump(pAIScripting0x1F_L015)                                   ;B49B5F
pAIScripting0x1F_L020:
    %AICMD0x41_AddValue16(nLove_Ellen, 50)                     ;B49B62
    %AICMD0x12_Jump(pAIScripting0x1F_L015)                                   ;B49B68
pAIScripting0x1F_L021:
    %AICMD0x41_AddValue16(nLove_Eve, 50)                       ;B49B6B
    %AICMD0x12_Jump(pAIScripting0x1F_L015)                                   ;B49B71
pAIScripting0x1F_L022:
    %AICMD0x1A($0080, $00C8, aAIScriptingData_L051, $01)                     ;B49B74
pAIScripting0x1F_L023:
    %AICMD0x1F(pAIScripting0x1F_L024)                                        ;B49B7C
    %AICMD0x12_Jump(pAIScripting0x1F_L023)                                   ;B49B7F
pAIScripting0x1F_L024:
    %AICMD0x1C_ShowDialog($0280, $00)                          ;B49B82
    %AICMD0x12_Jump(pAIScripting0x1F_L023)                                   ;B49B86
pAIScripting0x1F_L025:
    %AICMD0x1A($0060, $00B0, aAIScriptingData_L051, $00)                     ;B49B89
    %AICMD0x13_Wait(1)                                         ;B49B91
    %AICMD0x12_Jump(pAIScripting0x1F_L023)                                   ;B49B94
pAIScripting0x1F_L026:
    %AICMD0x1A($0128, $0078, aAIScriptingData_L043, $03)                     ;B49B97
pAIScripting0x1F_L027:
    %AICMD0x1F(pAIScripting0x1F_L028)                                        ;B49B9F
    %AICMD0x12_Jump(pAIScripting0x1F_L027)                                   ;B49BA2
pAIScripting0x1F_L028:
    %AICMD0x1D_ShowDialog($01A9, $00)                          ;B49BA5
    %AICMD0x12_Jump(pAIScripting0x1F_L027)                                   ;B49BA9
pAIScripting0x1F_L029:
    %AICMD0x1A($0148, $0068, aAIScriptingData_L044, $00)                     ;B49BAC
    %AICMD0x22($10, $10, $01, aAIScriptingData_L045, $00)                    ;B49BB4
pAIScripting0x1F_L030:
    %AICMD0x1F(pAIScripting0x1F_L031)                                        ;B49BBB
    %AICMD0x12_Jump(pAIScripting0x1F_L030)                                   ;B49BBE
pAIScripting0x1F_L031:
    %AICMD0x1C_ShowDialog($01AE, $00)                          ;B49BC1
    %AICMD0x12_Jump(pAIScripting0x1F_L030)                                   ;B49BC5
pAIScripting0x1F_L032:
    %AICMD0x1A($0148, $0088, aAIScriptingData_L046, $00)                     ;B49BC8
    %AICMD0x22($10, $10, $01, aAIScriptingData_L047, $08)                    ;B49BD0
pAIScripting0x1F_L033:
    %AICMD0x1F(pAIScripting0x1F_L034)                                        ;B49BD7
    %AICMD0x12_Jump(pAIScripting0x1F_L033)                                   ;B49BDA
pAIScripting0x1F_L034:
    %AICMD0x1C_ShowDialog($01AF, $00)                          ;B49BDD
    %AICMD0x12_Jump(pAIScripting0x1F_L033)                                   ;B49BE1
pAIScripting0x1F_L035:
    %AICMD0x1A($0148, $0068, aAIScriptingData_L064, $00)                     ;B49BE4
pAIScripting0x1F_L036:
    %AICMD0x1F(pAIScripting0x1F_L037)                                        ;B49BEC
    %AICMD0x12_Jump(pAIScripting0x1F_L036)                                   ;B49BEF
pAIScripting0x1F_L037:
    %AICMD0x1C_ShowDialog($01B0, $00)                          ;B49BF2
    %AICMD0x12_Jump(pAIScripting0x1F_L036)                                   ;B49BF6
pAIScripting0x1F_L038:
    %AICMD0x1A($0148, $0078, aAIScriptingData_L049, $00)                     ;B49BF9
    %AICMD0x22($10, $10, $01, aAIScriptingData_L049, $08)                    ;B49C01
pAIScripting0x1F_L039:
    %AICMD0x1F(pAIScripting0x1F_L040)                                        ;B49C08
    %AICMD0x12_Jump(pAIScripting0x1F_L039)                                   ;B49C0B
pAIScripting0x1F_L040:
    %AICMD0x1C_ShowDialog($01B1, $00)                          ;B49C0E
    %AICMD0x12_Jump(pAIScripting0x1F_L039)                                   ;B49C12
pAIScripting0x1F_L041:
    %AICMD0x1A($0148, $0068, aAIScriptingData_L040, $00)                     ;B49C15
pAIScripting0x1F_L042:
    %AICMD0x1F(pAIScripting0x1F_L043)                                        ;B49C1D
    %AICMD0x12_Jump(pAIScripting0x1F_L042)                                   ;B49C20
pAIScripting0x1F_L043:
    %AICMD0x1C_ShowDialog($01B2, $00)                          ;B49C23
    %AICMD0x12_Jump(pAIScripting0x1F_L042)                                   ;B49C27


pAIScripting0x1F_Data02:
 
    %AICMD0x50()                                               ;B49C2A
    %AICMD0x00_SetMusic($0B, $B4)                              ;B49C2B
    %AICMD0x05_SetTransferPosition(136, 184)                   ;B49C2E
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B49C33
    %AICMD0x08_EnableAIControl()                               ;B49C35
    %AICMD0x09_StartScript($01, pAIScripting0x1F_L052)                                   ;B49C36
    %AICMD0x09_StartScript($02, pAIScripting0x1F_L055)                                   ;B49C3A
    %AICMD0x09_StartScript($03, pAIScripting0x1F_L064)                                   ;B49C3E
    %AICMD0x09_StartScript($04, pAIScripting0x1F_L067)                                   ;B49C42
    %AICMD0x12_Jump(pAIScripting0x1F_L046)                                   ;B49C46
pAIScripting0x1F_L044:
    %AICMD0x55_JumpIfFlagNotSet(strcFlags.event6, $02, pAIScripting0x1F_L045)                 ;B49C49
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 0, 60, pAIScripting0x1F_L045) ;B49C50
    %AICMD0x09_StartScript($05, pAIScripting0x1F_L069)                                   ;B49C5A
pAIScripting0x1F_L045:
    %AICMD0x38_WaitForFadeIn()                                               ;B49C5E
    %AICMD0x13_Wait(1)                                         ;B49C5F
    %AICMD0x1C_ShowDialog($01B3, $01)                          ;B49C62
    %AICMD0x11_EnableUserControl()                             ;B49C66
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B49C67
    %AICMD0x23_OrWithIndexedValue($800196, $0D)                ;B49C69
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily3, $0E)       ;B49C6E
    %AICMD0x10_End()                                           ;B49C73
pAIScripting0x1F_L046:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $00, pAIScripting0x1F_L047)   ;B49C74
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $01, pAIScripting0x1F_L048)   ;B49C7B
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, pAIScripting0x1F_L049)   ;B49C82
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $03, pAIScripting0x1F_L050)   ;B49C89
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $04, pAIScripting0x1F_L051)   ;B49C90
    %AICMD0x12_Jump(pAIScripting0x1F_L044)                                   ;B49C97
pAIScripting0x1F_L047:
    %AICMD0x09_StartScript($06, pAIScripting0x1F_L072)                                   ;B49C9A
    %AICMD0x12_Jump(pAIScripting0x1F_L044)                                   ;B49C9E
pAIScripting0x1F_L048:
    %AICMD0x09_StartScript($06, pAIScripting0x1F_L075)                                   ;B49CA1
    %AICMD0x12_Jump(pAIScripting0x1F_L044)                                   ;B49CA5
pAIScripting0x1F_L049:
    %AICMD0x09_StartScript($06, pAIScripting0x1F_L078)                                   ;B49CA8
    %AICMD0x12_Jump(pAIScripting0x1F_L044)                                   ;B49CAC
pAIScripting0x1F_L050:
    %AICMD0x09_StartScript($06, pAIScripting0x1F_L081)                                   ;B49CAF
    %AICMD0x12_Jump(pAIScripting0x1F_L044)                                   ;B49CB3
pAIScripting0x1F_L051:
    %AICMD0x09_StartScript($06, pAIScripting0x1F_L084)                                   ;B49CB6
    %AICMD0x12_Jump(pAIScripting0x1F_L044)                                   ;B49CBA
pAIScripting0x1F_L052:
    %AICMD0x1A($0119, $0063, aAIScriptingData_L071, $00)                     ;B49CBD
pAIScripting0x1F_L053:
    %AICMD0x1F(pAIScripting0x1F_L054)                                        ;B49CC5
    %AICMD0x12_Jump(pAIScripting0x1F_L053)                                   ;B49CC8
pAIScripting0x1F_L054:
    %AICMD0x1C_ShowDialog($01BA, $00)                          ;B49CCB
    %AICMD0x0B_SetScriptFlag($00)                                            ;B49CCF
    %AICMD0x12_Jump(pAIScripting0x1F_L053)                                   ;B49CD1
pAIScripting0x1F_L055:
    %AICMD0x1A($0138, $0068, aAIScriptingData_L042, $03)                     ;B49CD4
pAIScripting0x1F_L056:
    %AICMD0x1F(pAIScripting0x1F_L060)                                        ;B49CDC
    %AICMD0x12_Jump(pAIScripting0x1F_L056)                                   ;B49CDF
pAIScripting0x1F_L057:
    %AICMD0x1F(pAIScripting0x1F_L058)                                        ;B49CE2
    %AICMD0x12_Jump(pAIScripting0x1F_L057)                                   ;B49CE5
pAIScripting0x1F_L058:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $00, pAIScripting0x1F_L059) ;B49CE8
    %AICMD0x1C_ShowDialog($0281, $00)                          ;B49CEF
    %AICMD0x12_Jump(pAIScripting0x1F_L057)                                   ;B49CF3
pAIScripting0x1F_L059:
    %AICMD0x1C_ShowDialog($01B4, $00)                          ;B49CF6
    %AICMD0x12_Jump(pAIScripting0x1F_L057)                                   ;B49CFA
pAIScripting0x1F_L060:
    %AICMD0x17_RollRandom($02)                                            ;B49CFD
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x1F_L061)                                   ;B49CFF
    %AICMD0x18_JumpIfRandomEquals($01, pAIScripting0x1F_L062)                                   ;B49D03
    %AICMD0x12_Jump(pAIScripting0x1F_L056)                                   ;B49D07
pAIScripting0x1F_L061:
    %AICMD0x1C_ShowDialog($01B4, $00)                          ;B49D0A
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown1, $00)     ;B49D0E
    %AICMD0x12_Jump(pAIScripting0x1F_L063)                                   ;B49D13
pAIScripting0x1F_L062:
    %AICMD0x1C_ShowDialog($0281, $00)                          ;B49D16
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown1, $01)     ;B49D1A
    %AICMD0x12_Jump(pAIScripting0x1F_L063)                                   ;B49D1F
pAIScripting0x1F_L063:
    %AICMD0x08_EnableAIControl()                               ;B49D22
    %AICMD0x1B($028D, $01)                                     ;B49D23
    %AICMD0x0D($01, $00, $30, $01)                             ;B49D27
    %AICMD0x1B($028C, $01)                                     ;B49D2C
    %AICMD0x11_EnableUserControl()                             ;B49D30
    %AICMD0x12_Jump(pAIScripting0x1F_L057)                                   ;B49D31
pAIScripting0x1F_L064:
    %AICMD0x1A($0080, $00C8, aAIScriptingData_L051, $02)                     ;B49D34
pAIScripting0x1F_L065:
    %AICMD0x1F(pAIScripting0x1F_L066)                                        ;B49D3C
    %AICMD0x12_Jump(pAIScripting0x1F_L065)                                   ;B49D3F
pAIScripting0x1F_L066:
    %AICMD0x1C_ShowDialog($027F, $00)                          ;B49D42
    %AICMD0x12_Jump(pAIScripting0x1F_L065)                                   ;B49D46
pAIScripting0x1F_L067:
    %AICMD0x1A($0108, $0060, aAIScriptingData_L106, $00)                     ;B49D49
pAIScripting0x1F_L068:
    %AICMD0x13_Wait(1)                                         ;B49D51
    %AICMD0x12_Jump(pAIScripting0x1F_L068)                                   ;B49D54
pAIScripting0x1F_L069:
    %AICMD0x1A($0178, $0058, aAIScriptingData_L078, $00)                     ;B49D57
pAIScripting0x1F_L070:
    %AICMD0x1F(pAIScripting0x1F_L071)                                        ;B49D5F
    %AICMD0x12_Jump(pAIScripting0x1F_L070)                                   ;B49D62
pAIScripting0x1F_L071:
    %AICMD0x1C_ShowDialog($01C1, $00)                          ;B49D65
    %AICMD0x12_Jump(pAIScripting0x1F_L070)                                   ;B49D69
pAIScripting0x1F_L072:
    %AICMD0x1A($0128, $0078, aAIScriptingData_L045, $00)                     ;B49D6C
pAIScripting0x1F_L073:
    %AICMD0x1F(pAIScripting0x1F_L074)                                        ;B49D74
    %AICMD0x12_Jump(pAIScripting0x1F_L073)                                   ;B49D77
pAIScripting0x1F_L074:
    %AICMD0x1C_ShowDialog($01B5, $00)                          ;B49D7A
    %AICMD0x12_Jump(pAIScripting0x1F_L073)                                   ;B49D7E
pAIScripting0x1F_L075:
    %AICMD0x1A($0128, $0078, aAIScriptingData_L047, $00)                     ;B49D81
pAIScripting0x1F_L076:
    %AICMD0x1F(pAIScripting0x1F_L077)                                        ;B49D89
    %AICMD0x12_Jump(pAIScripting0x1F_L076)                                   ;B49D8C
pAIScripting0x1F_L077:
    %AICMD0x1C_ShowDialog($01B6, $00)                          ;B49D8F
    %AICMD0x12_Jump(pAIScripting0x1F_L076)                                   ;B49D93
pAIScripting0x1F_L078:
    %AICMD0x1A($0128, $0078, aAIScriptingData_L065, $00)                     ;B49D96
pAIScripting0x1F_L079:
    %AICMD0x1F(pAIScripting0x1F_L080)                                        ;B49D9E
    %AICMD0x12_Jump(pAIScripting0x1F_L079)                                   ;B49DA1
pAIScripting0x1F_L080:
    %AICMD0x1C_ShowDialog($01B7, $00)                          ;B49DA4
    %AICMD0x12_Jump(pAIScripting0x1F_L079)                                   ;B49DA8
pAIScripting0x1F_L081:
    %AICMD0x1A($0128, $0078, aAIScriptingData_L049, $00)                     ;B49DAB
pAIScripting0x1F_L082:
    %AICMD0x1F(pAIScripting0x1F_L083)                                        ;B49DB3
    %AICMD0x12_Jump(pAIScripting0x1F_L082)                                   ;B49DB6
pAIScripting0x1F_L083:
    %AICMD0x1C_ShowDialog($01B8, $00)                          ;B49DB9
    %AICMD0x12_Jump(pAIScripting0x1F_L082)                                   ;B49DBD
pAIScripting0x1F_L084:
    %AICMD0x1A($0128, $0078, aAIScriptingData_L040, $00)                     ;B49DC0
pAIScripting0x1F_L085:
    %AICMD0x1F(pAIScripting0x1F_L086)                                        ;B49DC8
    %AICMD0x12_Jump(pAIScripting0x1F_L085)                                   ;B49DCB
pAIScripting0x1F_L086:
    %AICMD0x1C_ShowDialog($01B9, $00)                          ;B49DCE
    %AICMD0x12_Jump(pAIScripting0x1F_L085)                                   ;B49DD2


pAIScripting0x1F_Data03:
    %AICMD0x50()                                               ;B49DD5
    %AICMD0x08_EnableAIControl()                               ;B49DD6
    %AICMD0x05_SetTransferPosition(296, 104)                   ;B49DD7
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B49DDC
    %AICMD0x09_StartScript($01, pAIScripting0x1F_L088)                                   ;B49DDE
    %AICMD0x09_StartScript($02, pAIScripting0x1F_L090)                                   ;B49DE2
    %AICMD0x55_JumpIfFlagNotSet(strcFlags.event6, $02, pAIScripting0x1F_L087)                 ;B49DE6
    %AICMD0x45_JumpIfBetween16(nFirstChildAge, 0, 60, pAIScripting0x1F_L087) ;B49DED
    %AICMD0x09_StartScript($05, pAIScripting0x1F_L069)                                   ;B49DF7
pAIScripting0x1F_L087:
    %AICMD0x38_WaitForFadeIn()                                               ;B49DFB
    %AICMD0x1C_ShowDialog($01BB, $00)                          ;B49DFC
    %AICMD0x01_UnfreezeTime()                                  ;B49E00
    %AICMD0x24_NextHourPalette($74)                            ;B49E01
    %AICMD0x13_Wait(180)                                       ;B49E03
    %AICMD0x1C_ShowDialog($01BC, $00)                          ;B49E06
    %AICMD0x28_ClearBit(strcFlags.event6, $04)                          ;B49E0A
    %AICMD0x47_SetValue8(wram80(nTimeState), 3)                           ;B49E0F
    %AICMD0x10_End()                                           ;B49E14
pAIScripting0x1F_L088:
    %AICMD0x1A($0119, $0063, aAIScriptingData_L071, $02)                     ;B49E15
pAIScripting0x1F_L089:
    %AICMD0x13_Wait(1)                                         ;B49E1D
    %AICMD0x12_Jump(pAIScripting0x1F_L089)                                   ;B49E20
pAIScripting0x1F_L090:
    %AICMD0x1A($0108, $0060, aAIScriptingData_L106, $00)                     ;B49E23
pAIScripting0x1F_L091:
    %AICMD0x13_Wait(1)                                         ;B49E2B
    %AICMD0x12_Jump(pAIScripting0x1F_L091)                                   ;B49E2E
