

    incsrc "../../../../build/gen/ai/slots_28.asm"
 
pAIScripting0x28_Data01:
 
    %AICMD0x4F_DisableToolUse()                                               ;B4BAEB
    %AICMD0x50()                                               ;B4BAEC
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $09)       ;B4BAED
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $00)       ;B4BAF2
    %AICMD0x08_EnableAIControl()                               ;B4BAF7
    %AICMD0x38_WaitForFadeIn()                                               ;B4BAF8
    %AICMD0x01_UnfreezeTime()                                  ;B4BAF9
    %AICMD0x24_NextHourPalette($74)                            ;B4BAFA
    %AICMD0x13_Wait(180)                                       ;B4BAFC
    %AICMD0x1C_ShowDialog($02F5, $00)                          ;B4BAFF
    %AICMD0x3D_TeleportToArea(!AREA_MOUNTAINTOPSUNRISE)        ;B4BB03
    %AICMD0x10_End()                                           ;B4BB05


pAIScripting0x28_Data02:
 
    %AICMD0x4F_DisableToolUse()                                               ;B4BB06
    %AICMD0x50()                                               ;B4BB07
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $09)       ;B4BB08
    %AICMD0x00_SetMusic($0E, $B4)                              ;B4BB0D
    %AICMD0x02_FreezeTime()                                    ;B4BB10
    %AICMD0x03_SetHour($06)                                    ;B4BB11
    %AICMD0x05_SetTransferPosition(128, 440)                   ;B4BB13
    %AICMD0x08_EnableAIControl()                               ;B4BB18
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B4BB19
    %AICMD0x09_StartScript($01, pAIScripting0x28_L001)                                   ;B4BB1B
    %AICMD0x09_StartScript($02, pAIScripting0x28_L006)                                   ;B4BB1F
    %AICMD0x09_StartScript($03, pAIScripting0x28_L021)                                   ;B4BB23
    %AICMD0x09_StartScript($04, pAIScripting0x28_L024)                                   ;B4BB27
    %AICMD0x09_StartScript($05, pAIScripting0x28_L011)                                   ;B4BB2B
    %AICMD0x09_StartScript($06, pAIScripting0x28_L029)                                   ;B4BB2F
    %AICMD0x09_StartScript($07, pAIScripting0x28_L032)                                   ;B4BB33
    %AICMD0x09_StartScript($08, pAIScripting0x28_L035)                                   ;B4BB37
    %AICMD0x09_StartScript($09, pAIScripting0x28_L041)                                   ;B4BB3B
    %AICMD0x06_SetDestinationArea(!AREA_MOUNTAINTOPSUNRISE)    ;B4BB3F
    %AICMD0x38_WaitForFadeIn()                                               ;B4BB41
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 96)                    ;B4BB42
    %AICMD0x11_EnableUserControl()                             ;B4BB46
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B4BB47
    %AICMD0x0C_WaitForScriptFlag($02)                                            ;B4BB49
    %AICMD0x0C_WaitForScriptFlag($03)                                            ;B4BB4B
    %AICMD0x0C_WaitForScriptFlag($04)                                            ;B4BB4D
    %AICMD0x0C_WaitForScriptFlag($05)                                            ;B4BB4F
    %AICMD0x0C_WaitForScriptFlag($06)                                            ;B4BB51
    %AICMD0x0C_WaitForScriptFlag($07)                                            ;B4BB53
    %AICMD0x0C_WaitForScriptFlag($08)                                            ;B4BB55
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown1, $02)     ;B4BB57
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B4BB5C
    %AICMD0x13_Wait(60)                                        ;B4BB5E
    %AICMD0x3C()                                               ;B4BB61
    %AICMD0x10_End()                                           ;B4BB62
pAIScripting0x28_L001:
    %AICMD0x1A($0088, $0128, aAIScriptingData_L051, $00)                     ;B4BB63
pAIScripting0x28_L002:
    %AICMD0x1F(pAIScripting0x28_L004)                                        ;B4BB6B
    %AICMD0x12_Jump(pAIScripting0x28_L002)                                   ;B4BB6E
pAIScripting0x28_L003:
    %AICMD0x1F(pAIScripting0x28_L005)                                        ;B4BB71
    %AICMD0x12_Jump(pAIScripting0x28_L003)                                   ;B4BB74
pAIScripting0x28_L004:
    %AICMD0x08_EnableAIControl()                               ;B4BB77
    %AICMD0x1C_ShowDialog($02CE, $00)                          ;B4BB78
    %AICMD0x0B_SetScriptFlag($00)                                            ;B4BB7C
    %AICMD0x01_UnfreezeTime()                                  ;B4BB7E
    %AICMD0x03_SetHour($07)                                    ;B4BB7F
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B4BB81
    %AICMD0x13_Wait(240)                                       ;B4BB83
    %AICMD0x11_EnableUserControl()                             ;B4BB86
    %AICMD0x12_Jump(pAIScripting0x28_L003)                                   ;B4BB87
pAIScripting0x28_L005:
    %AICMD0x1C_ShowDialog($02CE, $00)                          ;B4BB8A
    %AICMD0x12_Jump(pAIScripting0x28_L003)                                   ;B4BB8E
pAIScripting0x28_L006:
    %AICMD0x1A($0080, $01E8, aAIScriptingData_L062, $01)                     ;B4BB91
    %AICMD0x0D($00, $FF, $30, $01)                             ;B4BB99
pAIScripting0x28_L007:
    %AICMD0x1F(pAIScripting0x28_L009)                                        ;B4BB9E
    %AICMD0x12_Jump(pAIScripting0x28_L007)                                   ;B4BBA1
pAIScripting0x28_L008:
    %AICMD0x1F(pAIScripting0x28_L010)                                        ;B4BBA4
    %AICMD0x12_Jump(pAIScripting0x28_L008)                                   ;B4BBA7
pAIScripting0x28_L009:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $02, pAIScripting0x28_L010) ;B4BBAA
    %AICMD0x1C_ShowDialog($02CF, $00)                          ;B4BBB1
    %AICMD0x12_Jump(pAIScripting0x28_L007)                                   ;B4BBB5
pAIScripting0x28_L010:
    %AICMD0x1C_ShowDialog($001A, $00)                          ;B4BBB8
    %AICMD0x0B_SetScriptFlag($01)                                            ;B4BBBC
    %AICMD0x12_Jump(pAIScripting0x28_L008)                                   ;B4BBBE
pAIScripting0x28_L011:
    %AICMD0x1A($0048, $0168, aAIScriptingData_L042, $01)                     ;B4BBC1
pAIScripting0x28_L012:
    %AICMD0x1F(pAIScripting0x28_L014)                                        ;B4BBC9
    %AICMD0x12_Jump(pAIScripting0x28_L012)                                   ;B4BBCC
pAIScripting0x28_L013:
    %AICMD0x1F(pAIScripting0x28_L020)                                        ;B4BBCF
    %AICMD0x12_Jump(pAIScripting0x28_L013)                                   ;B4BBD2
pAIScripting0x28_L014:
    %AICMD0x1D_ShowDialog($02D3, $00)                          ;B4BBD5
    %AICMD0x20_JumpIfChoice(0, pAIScripting0x28_L015)                        ;B4BBD9
    %AICMD0x20_JumpIfChoice(1, pAIScripting0x28_L016)                        ;B4BBDD
    %AICMD0x12_Jump(pAIScripting0x28_L012)                                   ;B4BBE1
pAIScripting0x28_L015:
    %AICMD0x1D_ShowDialog($02D4, $00)                          ;B4BBE4
    %AICMD0x17_RollRandom($03)                                            ;B4BBE8
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x28_L017)                                   ;B4BBEA
    %AICMD0x18_JumpIfRandomEquals($01, pAIScripting0x28_L018)                                   ;B4BBEE
    %AICMD0x18_JumpIfRandomEquals($02, pAIScripting0x28_L019)                                   ;B4BBF2
    %AICMD0x12_Jump(pAIScripting0x28_L013)                                   ;B4BBF6
pAIScripting0x28_L016:
    %AICMD0x1C_ShowDialog($02D8, $00)                          ;B4BBF9
    %AICMD0x0B_SetScriptFlag($02)                                            ;B4BBFD
    %AICMD0x12_Jump(pAIScripting0x28_L013)                                   ;B4BBFF
pAIScripting0x28_L017:
    %AICMD0x1C_ShowDialog($02D5, $00)                          ;B4BC02
    %AICMD0x41_AddValue16(nPlayerHappiness, 30)                ;B4BC06
    %AICMD0x0B_SetScriptFlag($02)                                            ;B4BC0C
    %AICMD0x12_Jump(pAIScripting0x28_L013)                                   ;B4BC0E
pAIScripting0x28_L018:
    %AICMD0x1C_ShowDialog($02D6, $00)                          ;B4BC11
    %AICMD0x41_AddValue16(nPlayerHappiness, 10)                ;B4BC15
    %AICMD0x0B_SetScriptFlag($02)                                            ;B4BC1B
    %AICMD0x12_Jump(pAIScripting0x28_L013)                                   ;B4BC1D
pAIScripting0x28_L019:
    %AICMD0x1C_ShowDialog($02D7, $00)                          ;B4BC20
    %AICMD0x41_AddValue16(nPlayerHappiness, -20)               ;B4BC24
    %AICMD0x0B_SetScriptFlag($02)                                            ;B4BC2A
    %AICMD0x12_Jump(pAIScripting0x28_L013)                                   ;B4BC2C
pAIScripting0x28_L020:
    %AICMD0x1C_ShowDialog($02DC, $00)                          ;B4BC2F
    %AICMD0x12_Jump(pAIScripting0x28_L013)                                   ;B4BC33
pAIScripting0x28_L021:
    %AICMD0x1A($0078, $0158, aAIScriptingData_L066, $01)                     ;B4BC36
pAIScripting0x28_L022:
    %AICMD0x1F(pAIScripting0x28_L023)                                        ;B4BC3E
    %AICMD0x12_Jump(pAIScripting0x28_L022)                                   ;B4BC41
pAIScripting0x28_L023:
    %AICMD0x1C_ShowDialog($02D0, $00)                          ;B4BC44
    %AICMD0x0B_SetScriptFlag($03)                                            ;B4BC48
    %AICMD0x12_Jump(pAIScripting0x28_L022)                                   ;B4BC4A
pAIScripting0x28_L024:
    %AICMD0x1A($00B8, $0168, aAIScriptingData_L046, $01)                     ;B4BC4D
pAIScripting0x28_L025:
    %AICMD0x1F(pAIScripting0x28_L027)                                        ;B4BC55
    %AICMD0x12_Jump(pAIScripting0x28_L025)                                   ;B4BC58
pAIScripting0x28_L026:
    %AICMD0x1F(pAIScripting0x28_L028)                                        ;B4BC5B
    %AICMD0x12_Jump(pAIScripting0x28_L026)                                   ;B4BC5E
pAIScripting0x28_L027:
    %AICMD0x1C_ShowDialog($02D1, $00)                          ;B4BC61
    %AICMD0x0B_SetScriptFlag($04)                                            ;B4BC65
    %AICMD0x12_Jump(pAIScripting0x28_L026)                                   ;B4BC67
pAIScripting0x28_L028:
    %AICMD0x1C_ShowDialog($038E, $00)                          ;B4BC6A
    %AICMD0x0B_SetScriptFlag($04)                                            ;B4BC6E
    %AICMD0x12_Jump(pAIScripting0x28_L026)                                   ;B4BC70
pAIScripting0x28_L029:
    %AICMD0x1A($00B8, $0198, aAIScriptingData_L039, $01)                     ;B4BC73
pAIScripting0x28_L030:
    %AICMD0x1F(pAIScripting0x28_L031)                                        ;B4BC7B
    %AICMD0x12_Jump(pAIScripting0x28_L030)                                   ;B4BC7E
pAIScripting0x28_L031:
    %AICMD0x1C_ShowDialog($02D9, $00)                          ;B4BC81
    %AICMD0x0B_SetScriptFlag($05)                                            ;B4BC85
    %AICMD0x12_Jump(pAIScripting0x28_L030)                                   ;B4BC87
pAIScripting0x28_L032:
    %AICMD0x1A($0058, $0188, aAIScriptingData_L048, $01)                     ;B4BC8A
pAIScripting0x28_L033:
    %AICMD0x1F(pAIScripting0x28_L034)                                        ;B4BC92
    %AICMD0x12_Jump(pAIScripting0x28_L033)                                   ;B4BC95
pAIScripting0x28_L034:
    %AICMD0x1C_ShowDialog($02D2, $00)                          ;B4BC98
    %AICMD0x0B_SetScriptFlag($06)                                            ;B4BC9C
    %AICMD0x12_Jump(pAIScripting0x28_L033)                                   ;B4BC9E
pAIScripting0x28_L035:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $00, pAIScripting0x28_L036)   ;B4BCA1
    %AICMD0x1A($0098, $0178, aAIScriptingData_L011, $01)                     ;B4BCA8
    %AICMD0x12_Jump(pAIScripting0x28_L037)                                   ;B4BCB0
pAIScripting0x28_L036:
    %AICMD0x1A($0088, $0178, aAIScriptingData_L071, $01)                     ;B4BCB3
pAIScripting0x28_L037:
    %AICMD0x1F(pAIScripting0x28_L039)                                        ;B4BCBB
    %AICMD0x12_Jump(pAIScripting0x28_L037)                                   ;B4BCBE
pAIScripting0x28_L038:
    %AICMD0x1F(pAIScripting0x28_L040)                                        ;B4BCC1
    %AICMD0x12_Jump(pAIScripting0x28_L038)                                   ;B4BCC4
pAIScripting0x28_L039:
    %AICMD0x1C_ShowDialog($02DA, $00)                          ;B4BCC7
    %AICMD0x41_AddValue16(nLove_Maria, 10)                     ;B4BCCB
    %AICMD0x0B_SetScriptFlag($07)                                            ;B4BCD1
    %AICMD0x12_Jump(pAIScripting0x28_L038)                                   ;B4BCD3
pAIScripting0x28_L040:
    %AICMD0x1C_ShowDialog($0293, $00)                          ;B4BCD6
    %AICMD0x12_Jump(pAIScripting0x28_L038)                                   ;B4BCDA
pAIScripting0x28_L041:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $04, pAIScripting0x28_L042)   ;B4BCDD
    %AICMD0x1A($00A8, $0198, aAIScriptingData_L024, $01)                     ;B4BCE4
    %AICMD0x12_Jump(pAIScripting0x28_L043)                                   ;B4BCEC
pAIScripting0x28_L042:
    %AICMD0x1A($00A8, $0198, aAIScriptingData_L071, $01)                     ;B4BCEF
pAIScripting0x28_L043:
    %AICMD0x1F(pAIScripting0x28_L045)                                        ;B4BCF7
    %AICMD0x12_Jump(pAIScripting0x28_L043)                                   ;B4BCFA
pAIScripting0x28_L044:
    %AICMD0x1F(pAIScripting0x28_L046)                                        ;B4BCFD
    %AICMD0x12_Jump(pAIScripting0x28_L044)                                   ;B4BD00
pAIScripting0x28_L045:
    %AICMD0x1C_ShowDialog($02DB, $00)                          ;B4BD03
    %AICMD0x41_AddValue16(nLove_Eve, 10)                       ;B4BD07
    %AICMD0x0B_SetScriptFlag($08)                                            ;B4BD0D
    %AICMD0x12_Jump(pAIScripting0x28_L044)                                   ;B4BD0F
pAIScripting0x28_L046:
    %AICMD0x1C_ShowDialog($0293, $00)                          ;B4BD12
    %AICMD0x12_Jump(pAIScripting0x28_L044)                                   ;B4BD16


pAIScripting0x28_Data03:
 
    %AICMD0x4F_DisableToolUse()                                               ;B4BD19
    %AICMD0x50()                                               ;B4BD1A
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $09)       ;B4BD1B
    %AICMD0x00_SetMusic($0D, $B4)                              ;B4BD20
    %AICMD0x02_FreezeTime()                                    ;B4BD23
    %AICMD0x03_SetHour($07)                                    ;B4BD24
    %AICMD0x05_SetTransferPosition(296, 536)                   ;B4BD26
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B4BD2B
    %AICMD0x09_StartScript($01, pAIScripting0x28_L050)                                   ;B4BD2D
    %AICMD0x09_StartScript($02, pAIScripting0x28_L092)                                   ;B4BD31
    %AICMD0x09_StartScript($03, pAIScripting0x28_L102)                                   ;B4BD35
    %AICMD0x09_StartScript($04, pAIScripting0x28_L110)                                   ;B4BD39
    %AICMD0x09_StartScript($05, pAIScripting0x28_L119)                                   ;B4BD3D
    %AICMD0x09_StartScript($06, pAIScripting0x28_L127)                                   ;B4BD41
    %AICMD0x09_StartScript($07, pAIScripting0x28_L141)                                   ;B4BD45
    %AICMD0x09_StartScript($08, pAIScripting0x28_L155)                                   ;B4BD49
    %AICMD0x06_SetDestinationArea(!AREA_EGGFESTIVAL)           ;B4BD4D
    %AICMD0x11_EnableUserControl()                             ;B4BD4F
    %AICMD0x38_WaitForFadeIn()                                               ;B4BD50
pAIScripting0x28_L047:
    %AICMD0x13_Wait(1)                                         ;B4BD51
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $04, pAIScripting0x28_L048) ;B4BD54
    %AICMD0x12_Jump(pAIScripting0x28_L047)                                   ;B4BD5B
pAIScripting0x28_L048:
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown1, $07)     ;B4BD5E
    %AICMD0x3D_TeleportToArea(!AREA_EGGFESTIVAL)               ;B4BD63
    %AICMD0x10_End()                                           ;B4BD65
pAIScripting0x28_L049:
    %AICMD0x13_Wait(1800)                                      ;B4BD66
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown1, $05)     ;B4BD69
    %AICMD0x10_End()                                           ;B4BD6E
pAIScripting0x28_L050:
    %AICMD0x1A($0128, $01A8, aAIScriptingData_L044, $00)                     ;B4BD6F
pAIScripting0x28_L051:
    %AICMD0x1F(pAIScripting0x28_L053)                                        ;B4BD77
    %AICMD0x12_Jump(pAIScripting0x28_L051)                                   ;B4BD7A
pAIScripting0x28_L052:
    %AICMD0x2D_JumpOnInteract(pAIScripting0x28_L056, pAIScripting0x28_L057)                               ;B4BD7D
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $05, pAIScripting0x28_L071) ;B4BD82
    %AICMD0x12_Jump(pAIScripting0x28_L052)                                   ;B4BD89
pAIScripting0x28_L053:
    %AICMD0x1D_ShowDialog($02DD, $00)                          ;B4BD8C
    %AICMD0x20_JumpIfChoice(0, pAIScripting0x28_L054)                        ;B4BD90
    %AICMD0x20_JumpIfChoice(1, pAIScripting0x28_L055)                        ;B4BD94
    %AICMD0x12_Jump(pAIScripting0x28_L051)                                   ;B4BD98
pAIScripting0x28_L054:
    %AICMD0x08_EnableAIControl()                               ;B4BD9B
    %AICMD0x1C_ShowDialog($02DE, $00)                          ;B4BD9C
    %AICMD0x28_ClearBit(strcFlags.unknown1, $05)                        ;B4BDA0
    %AICMD0x1B($0295, $00)                                     ;B4BDA5
    %AICMD0x09_StartScript($09, pAIScripting0x28_L081)                                   ;B4BDA9
    %AICMD0x09_StartScript($0A, pAIScripting0x28_L049)                                   ;B4BDAD
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B4BDB1
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown1, $03)     ;B4BDB3
    %AICMD0x11_EnableUserControl()                             ;B4BDB8
    %AICMD0x12_Jump(pAIScripting0x28_L052)                                   ;B4BDB9
pAIScripting0x28_L055:
    %AICMD0x1C_ShowDialog($0236, $00)                          ;B4BDBC
    %AICMD0x12_Jump(pAIScripting0x28_L051)                                   ;B4BDC0
pAIScripting0x28_L056:
    %AICMD0x1C_ShowDialog($02DF, $00)                          ;B4BDC3
    %AICMD0x1B($0295, $00)                                     ;B4BDC7
    %AICMD0x12_Jump(pAIScripting0x28_L052)                                   ;B4BDCB
pAIScripting0x28_L057:
    %AICMD0x21_AddValue8(wram80($7E09A2+!DE_RAM_SHIFT), 1)                           ;B4BDCE
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown2, $00, pAIScripting0x28_L058) ;B4BDD3
    %AICMD0x12_Jump(pAIScripting0x28_L062)                                   ;B4BDDA
pAIScripting0x28_L058:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown2, $01, pAIScripting0x28_L059) ;B4BDDD
    %AICMD0x12_Jump(pAIScripting0x28_L062)                                   ;B4BDE4
pAIScripting0x28_L059:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown2, $02, pAIScripting0x28_L060) ;B4BDE7
    %AICMD0x12_Jump(pAIScripting0x28_L062)                                   ;B4BDEE
pAIScripting0x28_L060:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown2, $03, pAIScripting0x28_L061) ;B4BDF1
    %AICMD0x12_Jump(pAIScripting0x28_L062)                                   ;B4BDF8
pAIScripting0x28_L061:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown2, $04, pAIScripting0x28_L070) ;B4BDFB
pAIScripting0x28_L062:
    %AICMD0x08_EnableAIControl()                               ;B4BE02
    %AICMD0x13_Wait(1)                                         ;B4BE03
    %AICMD0x2C($19, $0006, $005A)                              ;B4BE06
    %AICMD0x11_EnableUserControl()                             ;B4BE0C
    %AICMD0x1C_ShowDialog($02E7, $00)                          ;B4BE0D
pAIScripting0x28_L063:
    %AICMD0x15_JumpIfEquals8(wram80($7E09AC+!DE_RAM_SHIFT), 1, pAIScripting0x28_L064)              ;B4BE11
    %AICMD0x15_JumpIfEquals8(wram80($7E09AC+!DE_RAM_SHIFT), 2, pAIScripting0x28_L065)              ;B4BE18
    %AICMD0x15_JumpIfEquals8(wram80($7E09AC+!DE_RAM_SHIFT), 3, pAIScripting0x28_L066)              ;B4BE1F
    %AICMD0x15_JumpIfEquals8(wram80($7E09AC+!DE_RAM_SHIFT), 4, pAIScripting0x28_L067)              ;B4BE26
    %AICMD0x15_JumpIfEquals8(wram80($7E09AC+!DE_RAM_SHIFT), 5, pAIScripting0x28_L068)              ;B4BE2D
pAIScripting0x28_L064:
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown3, $00)     ;B4BE34
    %AICMD0x12_Jump(pAIScripting0x28_L069)                                   ;B4BE39
pAIScripting0x28_L065:
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown3, $01)     ;B4BE3C
    %AICMD0x12_Jump(pAIScripting0x28_L069)                                   ;B4BE41
pAIScripting0x28_L066:
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown3, $02)     ;B4BE44
    %AICMD0x12_Jump(pAIScripting0x28_L069)                                   ;B4BE49
pAIScripting0x28_L067:
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown3, $03)     ;B4BE4C
    %AICMD0x12_Jump(pAIScripting0x28_L069)                                   ;B4BE51
pAIScripting0x28_L068:
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown3, $04)     ;B4BE54
    %AICMD0x12_Jump(pAIScripting0x28_L069)                                   ;B4BE59
pAIScripting0x28_L069:
    %AICMD0x25_RemoveActor($09)                                            ;B4BE5C
    %AICMD0x28_ClearBit(strcFlags.unknown1, $05)                        ;B4BE5E
    %AICMD0x1B($0295, $00)                                     ;B4BE63
    %AICMD0x09_StartScript($09, pAIScripting0x28_L081)                                   ;B4BE67
    %AICMD0x09_StartScript($0A, pAIScripting0x28_L049)                                   ;B4BE6B
    %AICMD0x12_Jump(pAIScripting0x28_L052)                                   ;B4BE6F
pAIScripting0x28_L070:
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown1, $04)     ;B4BE72
    %AICMD0x1C_ShowDialog($02E8, $00)                          ;B4BE77
    %AICMD0x10_End()                                           ;B4BE7B
pAIScripting0x28_L071:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown2, $00, pAIScripting0x28_L072) ;B4BE7C
    %AICMD0x12_Jump(pAIScripting0x28_L076)                                   ;B4BE83
pAIScripting0x28_L072:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown2, $01, pAIScripting0x28_L073) ;B4BE86
    %AICMD0x12_Jump(pAIScripting0x28_L076)                                   ;B4BE8D
pAIScripting0x28_L073:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown2, $02, pAIScripting0x28_L074) ;B4BE90
    %AICMD0x12_Jump(pAIScripting0x28_L076)                                   ;B4BE97
pAIScripting0x28_L074:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown2, $03, pAIScripting0x28_L075) ;B4BE9A
    %AICMD0x12_Jump(pAIScripting0x28_L076)                                   ;B4BEA1
pAIScripting0x28_L075:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown2, $04, pAIScripting0x28_L070) ;B4BEA4
pAIScripting0x28_L076:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $06, pAIScripting0x28_L077) ;B4BEAB
    %AICMD0x08_EnableAIControl()                               ;B4BEB2
    %AICMD0x13_Wait(1)                                         ;B4BEB3
    %AICMD0x2C($19, $0006, $005A)                              ;B4BEB6
    %AICMD0x11_EnableUserControl()                             ;B4BEBC
    %AICMD0x1C_ShowDialog($02E9, $00)                          ;B4BEBD
    %AICMD0x12_Jump(pAIScripting0x28_L063)                                   ;B4BEC1
pAIScripting0x28_L077:
    %AICMD0x28_ClearBit(strcFlags.unknown1, $06)                        ;B4BEC4
    %AICMD0x08_EnableAIControl()                               ;B4BEC9
    %AICMD0x13_Wait(1)                                         ;B4BECA
    %AICMD0x2C($04, $0006, $005A)                              ;B4BECD
    %AICMD0x11_EnableUserControl()                             ;B4BED3
    %AICMD0x1C_ShowDialog($0390, $00)                          ;B4BED4
    %AICMD0x12_Jump(pAIScripting0x28_L063)                                   ;B4BED8
pAIScripting0x28_L078:
    %AICMD0x1A($0128, $01A8, aAIScriptingData_L044, $00)                     ;B4BEDB
pAIScripting0x28_L079:
    %AICMD0x1F(pAIScripting0x28_L080)                                        ;B4BEE3
    %AICMD0x12_Jump(pAIScripting0x28_L079)                                   ;B4BEE6
pAIScripting0x28_L080:
    %AICMD0x1C_ShowDialog($02ED, $00)                          ;B4BEE9
    %AICMD0x12_Jump(pAIScripting0x28_L079)                                   ;B4BEED
pAIScripting0x28_L081:
    %AICMD0x17_RollRandom($05)                                            ;B4BEF0
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x28_L083)                                   ;B4BEF2
    %AICMD0x18_JumpIfRandomEquals($01, pAIScripting0x28_L084)                                   ;B4BEF6
    %AICMD0x18_JumpIfRandomEquals($02, pAIScripting0x28_L085)                                   ;B4BEFA
    %AICMD0x18_JumpIfRandomEquals($03, pAIScripting0x28_L086)                                   ;B4BEFE
    %AICMD0x18_JumpIfRandomEquals($04, pAIScripting0x28_L087)                                   ;B4BF02
pAIScripting0x28_L082:
    %AICMD0x13_Wait(120)                                       ;B4BF06
    %AICMD0x0B_SetScriptFlag($01)                                            ;B4BF09
    %AICMD0x10_End()                                           ;B4BF0B
pAIScripting0x28_L083:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown2, $00, pAIScripting0x28_L084) ;B4BF0C
    %AICMD0x1A($0128, $01B0, aAIScriptingData_L097, $00)                     ;B4BF13
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown2, $00)     ;B4BF1B
    %AICMD0x47_SetValue8(wram80($7E09AC+!DE_RAM_SHIFT), 1)                           ;B4BF20
    %AICMD0x12_Jump(pAIScripting0x28_L082)                                   ;B4BF25
pAIScripting0x28_L084:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown2, $01, pAIScripting0x28_L085) ;B4BF28
    %AICMD0x1A($0128, $01B0, aAIScriptingData_L098, $00)                     ;B4BF2F
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown2, $01)     ;B4BF37
    %AICMD0x47_SetValue8(wram80($7E09AC+!DE_RAM_SHIFT), 2)                           ;B4BF3C
    %AICMD0x12_Jump(pAIScripting0x28_L082)                                   ;B4BF41
pAIScripting0x28_L085:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown2, $02, pAIScripting0x28_L086) ;B4BF44
    %AICMD0x1A($0128, $01B0, aAIScriptingData_L099, $00)                     ;B4BF4B
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown2, $02)     ;B4BF53
    %AICMD0x47_SetValue8(wram80($7E09AC+!DE_RAM_SHIFT), 3)                           ;B4BF58
    %AICMD0x12_Jump(pAIScripting0x28_L082)                                   ;B4BF5D
pAIScripting0x28_L086:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown2, $03, pAIScripting0x28_L087) ;B4BF60
    %AICMD0x1A($0128, $01B0, aAIScriptingData_L100, $00)                     ;B4BF67
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown2, $03)     ;B4BF6F
    %AICMD0x47_SetValue8(wram80($7E09AC+!DE_RAM_SHIFT), 4)                           ;B4BF74
    %AICMD0x12_Jump(pAIScripting0x28_L082)                                   ;B4BF79
pAIScripting0x28_L087:
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown2, $04, pAIScripting0x28_L083) ;B4BF7C
    %AICMD0x1A($0128, $01B0, aAIScriptingData_L101, $00)                     ;B4BF83
    %AICMD0x23_OrWithIndexedValue(strcFlags.unknown2, $04)     ;B4BF8B
    %AICMD0x47_SetValue8(wram80($7E09AC+!DE_RAM_SHIFT), 5)                           ;B4BF90
    %AICMD0x12_Jump(pAIScripting0x28_L082)                                   ;B4BF95
pAIScripting0x28_L088:
    %AICMD0x17_RollRandom($02)                                            ;B4BF98
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x28_L090)                                   ;B4BF9A
    %AICMD0x18_JumpIfRandomEquals($01, pAIScripting0x28_L091)                                   ;B4BF9E
pAIScripting0x28_L089:
    %AICMD0x10_End()                                           ;B4BFA2
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $0A, pAIScripting0x28_L090)   ;B4BFA3
    %AICMD0x23_OrWithIndexedValue(strcFlags.event5, $0A)       ;B4BFAA
    %AICMD0x41_AddValue16(nStoredFeed, 30)                     ;B4BFAF
    %AICMD0x1C_ShowDialog($02EB, $00)                          ;B4BFB5
    %AICMD0x0B_SetScriptFlag($00)                                            ;B4BFB9
    %AICMD0x12_Jump(pAIScripting0x28_L089)                                   ;B4BFBB
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $0B, pAIScripting0x28_L090)   ;B4BFBE
    %AICMD0x23_OrWithIndexedValue(strcFlags.event5, $0B)       ;B4BFC5
    %AICMD0x41_AddValue16(nStoredFeed, 30)                     ;B4BFCA
    %AICMD0x1C_ShowDialog($02EB, $00)                          ;B4BFD0
    %AICMD0x0B_SetScriptFlag($00)                                            ;B4BFD4
    %AICMD0x12_Jump(pAIScripting0x28_L089)                                   ;B4BFD6
pAIScripting0x28_L090:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $0C, pAIScripting0x28_L091)   ;B4BFD9
    %AICMD0x23_OrWithIndexedValue(strcFlags.event5, $0C)       ;B4BFE0
    %AICMD0x41_AddValue16(nPlayerHappiness, 50)                ;B4BFE5
    %AICMD0x0B_SetScriptFlag($00)                                            ;B4BFEB
    %AICMD0x12_Jump(pAIScripting0x28_L089)                                   ;B4BFED
pAIScripting0x28_L091:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $0D, pAIScripting0x28_L090)   ;B4BFF0
    %AICMD0x23_OrWithIndexedValue(strcFlags.event5, $0D)       ;B4BFF7
    %AICMD0x0B_SetScriptFlag($00)                                            ;B4BFFC
    %AICMD0x12_Jump(pAIScripting0x28_L089)                                   ;B4BFFE
pAIScripting0x28_L092:
    %AICMD0x1A($00E0, $0168, aAIScriptingData_L053, $00)                     ;B4C001
pAIScripting0x28_L093:
    %AICMD0x1F(pAIScripting0x28_L094)                                        ;B4C009
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $03, pAIScripting0x28_L095) ;B4C00C
    %AICMD0x12_Jump(pAIScripting0x28_L093)                                   ;B4C013
pAIScripting0x28_L094:
    %AICMD0x1C_ShowDialog($02E0, $00)                          ;B4C016
    %AICMD0x12_Jump(pAIScripting0x28_L093)                                   ;B4C01A
pAIScripting0x28_L095:
    %AICMD0x1B($02AE, $00)                                     ;B4C01D
    %AICMD0x0D($00, $FF, $40, $01)                             ;B4C021
    %AICMD0x1B($02B0, $01)                                     ;B4C026
    %AICMD0x0D($01, $00, $40, $01)                             ;B4C02A
    %AICMD0x13_Wait(30)                                        ;B4C02F
    %AICMD0x1B($02B0, $00)                                     ;B4C032
    %AICMD0x0D($FF, $00, $40, $01)                             ;B4C036
    %AICMD0x1B($02AC, $00)                                     ;B4C03B
    %AICMD0x0D($00, $01, $40, $01)                             ;B4C03F
    %AICMD0x13_Wait(60)                                        ;B4C044
    %AICMD0x12_Jump(pAIScripting0x28_L095)                                   ;B4C047
pAIScripting0x28_L096:
    %AICMD0x1F(pAIScripting0x28_L097)                                        ;B4C04A
    %AICMD0x12_Jump(pAIScripting0x28_L096)                                   ;B4C04D
pAIScripting0x28_L097:
    %AICMD0x1C_ShowDialog($02E0, $00)                          ;B4C050
    %AICMD0x12_Jump(pAIScripting0x28_L096)                                   ;B4C054
pAIScripting0x28_L098:
    %AICMD0x1A($0158, $01B8, aAIScriptingData_L053, $03)                     ;B4C057
    %AICMD0x12_Jump(pAIScripting0x28_L099)                                   ;B4C05F
pAIScripting0x28_L099:
    %AICMD0x1F(pAIScripting0x28_L100)                                        ;B4C062
    %AICMD0x12_Jump(pAIScripting0x28_L099)                                   ;B4C065
pAIScripting0x28_L100:
    %AICMD0x15_JumpIfEquals8(wram80($7E09A2+!DE_RAM_SHIFT), 0, pAIScripting0x28_L101)              ;B4C068
    %AICMD0x15_JumpIfEquals8(wram80($7E09A2+!DE_RAM_SHIFT), 1, pAIScripting0x28_L101)              ;B4C06F
    %AICMD0x15_JumpIfEquals8(wram80($7E09A2+!DE_RAM_SHIFT), 2, pAIScripting0x28_L101)              ;B4C076
    %AICMD0x1C_ShowDialog($02EF, $00)                          ;B4C07D
    %AICMD0x0B_SetScriptFlag($03)                                            ;B4C081
    %AICMD0x12_Jump(pAIScripting0x28_L099)                                   ;B4C083
pAIScripting0x28_L101:
    %AICMD0x1C_ShowDialog($02EE, $00)                          ;B4C086
    %AICMD0x0B_SetScriptFlag($03)                                            ;B4C08A
    %AICMD0x12_Jump(pAIScripting0x28_L099)                                   ;B4C08C
pAIScripting0x28_L102:
    %AICMD0x1A($0170, $0168, aAIScriptingData_L050, $00)                     ;B4C08F
pAIScripting0x28_L103:
    %AICMD0x1F(pAIScripting0x28_L105)                                        ;B4C097
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $03, pAIScripting0x28_L106) ;B4C09A
    %AICMD0x12_Jump(pAIScripting0x28_L103)                                   ;B4C0A1
pAIScripting0x28_L104:
    %AICMD0x13_Wait(1)                                         ;B4C0A4
    %AICMD0x12_Jump(pAIScripting0x28_L104)                                   ;B4C0A7
pAIScripting0x28_L105:
    %AICMD0x1C_ShowDialog($02E1, $00)                          ;B4C0AA
    %AICMD0x12_Jump(pAIScripting0x28_L103)                                   ;B4C0AE
pAIScripting0x28_L106:
    %AICMD0x0D($00, $01, $20, $01)                             ;B4C0B1
    %AICMD0x22($10, $08, $01, aAIScriptingData_L050, $08)                    ;B4C0B6
    %AICMD0x12_Jump(pAIScripting0x28_L104)                                   ;B4C0BD
pAIScripting0x28_L107:
    %AICMD0x1A($0168, $0178, aAIScriptingData_L050, $00)                     ;B4C0C0
    %AICMD0x12_Jump(pAIScripting0x28_L108)                                   ;B4C0C8
pAIScripting0x28_L108:
    %AICMD0x1F(pAIScripting0x28_L109)                                        ;B4C0CB
    %AICMD0x12_Jump(pAIScripting0x28_L108)                                   ;B4C0CE
pAIScripting0x28_L109:
    %AICMD0x1C_ShowDialog($02F0, $00)                          ;B4C0D1
    %AICMD0x0B_SetScriptFlag($04)                                            ;B4C0D5
    %AICMD0x12_Jump(pAIScripting0x28_L108)                                   ;B4C0D7
pAIScripting0x28_L110:
    %AICMD0x1A($0118, $0270, aAIScriptingData_L068, $02)                     ;B4C0DA
pAIScripting0x28_L111:
    %AICMD0x1F(pAIScripting0x28_L113)                                        ;B4C0E2
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $03, pAIScripting0x28_L115) ;B4C0E5
    %AICMD0x12_Jump(pAIScripting0x28_L111)                                   ;B4C0EC
pAIScripting0x28_L112:
    %AICMD0x1F(pAIScripting0x28_L114)                                        ;B4C0EF
    %AICMD0x12_Jump(pAIScripting0x28_L112)                                   ;B4C0F2
pAIScripting0x28_L113:
    %AICMD0x1C_ShowDialog($02E2, $00)                          ;B4C0F5
    %AICMD0x12_Jump(pAIScripting0x28_L111)                                   ;B4C0F9
pAIScripting0x28_L114:
    %AICMD0x1C_ShowDialog($02E2, $00)                          ;B4C0FC
    %AICMD0x12_Jump(pAIScripting0x28_L112)                                   ;B4C100
pAIScripting0x28_L115:
    %AICMD0x0D($01, $00, $20, $01)                             ;B4C103
    %AICMD0x1B($02D3, $00)                                     ;B4C108
    %AICMD0x0D($00, $01, $60, $01)                             ;B4C10C
    %AICMD0x1B($02D7, $00)                                     ;B4C111
    %AICMD0x0D($FF, $00, $A0, $01)                             ;B4C115
    %AICMD0x22($20, $20, $01, aAIScriptingData_L068, $10)                    ;B4C11A
    %AICMD0x12_Jump(pAIScripting0x28_L112)                                   ;B4C121
pAIScripting0x28_L116:
    %AICMD0x1A($0108, $01B8, aAIScriptingData_L067, $01)                     ;B4C124
    %AICMD0x12_Jump(pAIScripting0x28_L117)                                   ;B4C12C
pAIScripting0x28_L117:
    %AICMD0x1F(pAIScripting0x28_L118)                                        ;B4C12F
    %AICMD0x12_Jump(pAIScripting0x28_L117)                                   ;B4C132
pAIScripting0x28_L118:
    %AICMD0x1C_ShowDialog($02F1, $00)                          ;B4C135
    %AICMD0x0B_SetScriptFlag($05)                                            ;B4C139
    %AICMD0x12_Jump(pAIScripting0x28_L117)                                   ;B4C13B
pAIScripting0x28_L119:
    %AICMD0x1A($0138, $0298, aAIScriptingData_L056, $00)                     ;B4C13E
pAIScripting0x28_L120:
    %AICMD0x1F(pAIScripting0x28_L122)                                        ;B4C146
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $03, pAIScripting0x28_L123) ;B4C149
    %AICMD0x12_Jump(pAIScripting0x28_L120)                                   ;B4C150
pAIScripting0x28_L121:
    %AICMD0x13_Wait(1)                                         ;B4C153
    %AICMD0x12_Jump(pAIScripting0x28_L121)                                   ;B4C156
pAIScripting0x28_L122:
    %AICMD0x1C_ShowDialog($02E3, $00)                          ;B4C159
    %AICMD0x12_Jump(pAIScripting0x28_L120)                                   ;B4C15D
pAIScripting0x28_L123:
    %AICMD0x0D($00, $01, $50, $01)                             ;B4C160
    %AICMD0x1B($02B6, $01)                                     ;B4C165
    %AICMD0x0D($01, $00, $60, $01)                             ;B4C169
    %AICMD0x22($18, $20, $01, aAIScriptingData_L056, $10)                    ;B4C16E
    %AICMD0x12_Jump(pAIScripting0x28_L112)                                   ;B4C175
pAIScripting0x28_L124:
    %AICMD0x1A($0138, $0218, aAIScriptingData_L055, $01)                     ;B4C178
pAIScripting0x28_L125:
    %AICMD0x1F(pAIScripting0x28_L126)                                        ;B4C180
    %AICMD0x12_Jump(pAIScripting0x28_L125)                                   ;B4C183
pAIScripting0x28_L126:
    %AICMD0x1C_ShowDialog($02F1, $00)                          ;B4C186
    %AICMD0x0B_SetScriptFlag($06)                                            ;B4C18A
    %AICMD0x12_Jump(pAIScripting0x28_L125)                                   ;B4C18C
pAIScripting0x28_L127:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $01, pAIScripting0x28_L128)   ;B4C18F
    %AICMD0x1A($00D8, $0228, aAIScriptingData_L016, $01)                     ;B4C196
    %AICMD0x12_Jump(pAIScripting0x28_L129)                                   ;B4C19E
pAIScripting0x28_L128:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event6, $04, pAIScripting0x28_L140)   ;B4C1A1
    %AICMD0x1A($00D8, $0228, aAIScriptingData_L071, $01)                     ;B4C1A8
pAIScripting0x28_L129:
    %AICMD0x1F(pAIScripting0x28_L131)                                        ;B4C1B0
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $03, pAIScripting0x28_L132) ;B4C1B3
    %AICMD0x12_Jump(pAIScripting0x28_L129)                                   ;B4C1BA
pAIScripting0x28_L130:
    %AICMD0x13_Wait(1)                                         ;B4C1BD
    %AICMD0x12_Jump(pAIScripting0x28_L130)                                   ;B4C1C0
pAIScripting0x28_L131:
    %AICMD0x1C_ShowDialog($02E4, $00)                          ;B4C1C3
    %AICMD0x12_Jump(pAIScripting0x28_L129)                                   ;B4C1C7
pAIScripting0x28_L132:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $01, pAIScripting0x28_L133)   ;B4C1CA
    %AICMD0x1B($022B, $01)                                     ;B4C1D1
    %AICMD0x0D($01, $00, $84, $01)                             ;B4C1D5
    %AICMD0x22($20, $20, $01, aAIScriptingData_L016, $10)                    ;B4C1DA
    %AICMD0x12_Jump(pAIScripting0x28_L130)                                   ;B4C1E1
pAIScripting0x28_L133:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event6, $04, pAIScripting0x28_L140)   ;B4C1E4
    %AICMD0x22($20, $20, $01, aAIScriptingData_L073, $10)                    ;B4C1EB
    %AICMD0x12_Jump(pAIScripting0x28_L130)                                   ;B4C1F2
pAIScripting0x28_L134:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $01, pAIScripting0x28_L135)   ;B4C1F5
    %AICMD0x1A($0178, $01D8, aAIScriptingData_L015, $00)                     ;B4C1FC
    %AICMD0x12_Jump(pAIScripting0x28_L136)                                   ;B4C204
pAIScripting0x28_L135:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event6, $04, pAIScripting0x28_L140)   ;B4C207
    %AICMD0x1A($0178, $01D8, aAIScriptingData_L071, $00)                     ;B4C20E
pAIScripting0x28_L136:
    %AICMD0x1F(pAIScripting0x28_L138)                                        ;B4C216
    %AICMD0x12_Jump(pAIScripting0x28_L136)                                   ;B4C219
pAIScripting0x28_L137:
    %AICMD0x1F(pAIScripting0x28_L139)                                        ;B4C21C
    %AICMD0x12_Jump(pAIScripting0x28_L137)                                   ;B4C21F
pAIScripting0x28_L138:
    %AICMD0x1C_ShowDialog($02F2, $00)                          ;B4C222
    %AICMD0x41_AddValue16(nLove_Ann, 10)                       ;B4C226
    %AICMD0x0B_SetScriptFlag($07)                                            ;B4C22C
    %AICMD0x12_Jump(pAIScripting0x28_L137)                                   ;B4C22E
pAIScripting0x28_L139:
    %AICMD0x1C_ShowDialog($02F1, $00)                          ;B4C231
    %AICMD0x12_Jump(pAIScripting0x28_L137)                                   ;B4C235
pAIScripting0x28_L140:
    %AICMD0x10_End()                                           ;B4C238
pAIScripting0x28_L141:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, pAIScripting0x28_L142)   ;B4C239
    %AICMD0x1A($00C8, $0218, aAIScriptingData_L020, $02)                     ;B4C240
    %AICMD0x12_Jump(pAIScripting0x28_L143)                                   ;B4C248
pAIScripting0x28_L142:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event6, $04, pAIScripting0x28_L154)   ;B4C24B
    %AICMD0x1A($00C8, $0218, aAIScriptingData_L071, $00)                     ;B4C252
pAIScripting0x28_L143:
    %AICMD0x1F(pAIScripting0x28_L145)                                        ;B4C25A
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $03, pAIScripting0x28_L146) ;B4C25D
    %AICMD0x12_Jump(pAIScripting0x28_L143)                                   ;B4C264
pAIScripting0x28_L144:
    %AICMD0x13_Wait(1)                                         ;B4C267
    %AICMD0x12_Jump(pAIScripting0x28_L144)                                   ;B4C26A
pAIScripting0x28_L145:
    %AICMD0x1C_ShowDialog($02E5, $00)                          ;B4C26D
    %AICMD0x12_Jump(pAIScripting0x28_L143)                                   ;B4C271
pAIScripting0x28_L146:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, pAIScripting0x28_L147)   ;B4C274
    %AICMD0x13_Wait(80)                                        ;B4C27B
    %AICMD0x1B($0250, $01)                                     ;B4C27E
    %AICMD0x0D($01, $00, $40, $01)                             ;B4C282
    %AICMD0x22($20, $18, $01, aAIScriptingData_L020, $10)                    ;B4C287
    %AICMD0x12_Jump(pAIScripting0x28_L144)                                   ;B4C28E
pAIScripting0x28_L147:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event6, $04, pAIScripting0x28_L154)   ;B4C291
    %AICMD0x22($20, $20, $01, aAIScriptingData_L073, $00)                    ;B4C298
    %AICMD0x12_Jump(pAIScripting0x28_L144)                                   ;B4C29F
pAIScripting0x28_L148:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, pAIScripting0x28_L149)   ;B4C2A2
    %AICMD0x1A($0168, $01D8, aAIScriptingData_L019, $00)                     ;B4C2A9
    %AICMD0x12_Jump(pAIScripting0x28_L150)                                   ;B4C2B1
pAIScripting0x28_L149:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event6, $04, pAIScripting0x28_L154)   ;B4C2B4
    %AICMD0x1A($0168, $01D8, aAIScriptingData_L071, $00)                     ;B4C2BB
pAIScripting0x28_L150:
    %AICMD0x1F(pAIScripting0x28_L152)                                        ;B4C2C3
    %AICMD0x12_Jump(pAIScripting0x28_L150)                                   ;B4C2C6
pAIScripting0x28_L151:
    %AICMD0x1F(pAIScripting0x28_L153)                                        ;B4C2C9
    %AICMD0x12_Jump(pAIScripting0x28_L151)                                   ;B4C2CC
pAIScripting0x28_L152:
    %AICMD0x1C_ShowDialog($02F3, $00)                          ;B4C2CF
    %AICMD0x41_AddValue16(nLove_Nina, 10)                      ;B4C2D3
    %AICMD0x0B_SetScriptFlag($08)                                            ;B4C2D9
    %AICMD0x12_Jump(pAIScripting0x28_L151)                                   ;B4C2DB
pAIScripting0x28_L153:
    %AICMD0x1C_ShowDialog($02F1, $00)                          ;B4C2DE
    %AICMD0x12_Jump(pAIScripting0x28_L137)                                   ;B4C2E2
pAIScripting0x28_L154:
    %AICMD0x10_End()                                           ;B4C2E5
pAIScripting0x28_L155:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $03, pAIScripting0x28_L156)   ;B4C2E6
    %AICMD0x1A($00D8, $0208, aAIScriptingData_L022, $00)                     ;B4C2ED
    %AICMD0x12_Jump(pAIScripting0x28_L157)                                   ;B4C2F5
pAIScripting0x28_L156:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event6, $04, pAIScripting0x28_L168)   ;B4C2F8
    %AICMD0x1A($00D8, $0208, aAIScriptingData_L071, $00)                     ;B4C2FF
pAIScripting0x28_L157:
    %AICMD0x1F(pAIScripting0x28_L159)                                        ;B4C307
    %AICMD0x14_JumpIfFlagSet(strcFlags.unknown1, $03, pAIScripting0x28_L160) ;B4C30A
    %AICMD0x12_Jump(pAIScripting0x28_L157)                                   ;B4C311
pAIScripting0x28_L158:
    %AICMD0x13_Wait(1)                                         ;B4C314
    %AICMD0x12_Jump(pAIScripting0x28_L158)                                   ;B4C317
pAIScripting0x28_L159:
    %AICMD0x1C_ShowDialog($02E6, $00)                          ;B4C31A
    %AICMD0x12_Jump(pAIScripting0x28_L157)                                   ;B4C31E
pAIScripting0x28_L160:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $03, pAIScripting0x28_L161)   ;B4C321
    %AICMD0x1B($023F, $00)                                     ;B4C328
    %AICMD0x0D($00, $FF, $40, $01)                             ;B4C32C
    %AICMD0x13_Wait(30)                                        ;B4C331
    %AICMD0x0D($00, $FF, $40, $01)                             ;B4C334
    %AICMD0x13_Wait(30)                                        ;B4C339
    %AICMD0x0D($00, $FF, $40, $01)                             ;B4C33C
    %AICMD0x13_Wait(30)                                        ;B4C341
    %AICMD0x1B($0241, $00)                                     ;B4C344
    %AICMD0x0D($FF, $00, $A8, $01)                             ;B4C348
    %AICMD0x22($18, $20, $01, aAIScriptingData_L022, $10)                    ;B4C34D
    %AICMD0x12_Jump(pAIScripting0x28_L158)                                   ;B4C354
pAIScripting0x28_L161:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event6, $04, pAIScripting0x28_L168)   ;B4C357
    %AICMD0x22($20, $20, $01, aAIScriptingData_L073, $10)                    ;B4C35E
    %AICMD0x12_Jump(pAIScripting0x28_L158)                                   ;B4C365
pAIScripting0x28_L162:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $03, pAIScripting0x28_L163)   ;B4C368
    %AICMD0x1A($00F8, $01E8, aAIScriptingData_L021, $00)                     ;B4C36F
    %AICMD0x12_Jump(pAIScripting0x28_L164)                                   ;B4C377
pAIScripting0x28_L163:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event6, $04, pAIScripting0x28_L168)   ;B4C37A
    %AICMD0x1A($00F8, $01E8, aAIScriptingData_L071, $00)                     ;B4C381
pAIScripting0x28_L164:
    %AICMD0x1F(pAIScripting0x28_L166)                                        ;B4C389
    %AICMD0x12_Jump(pAIScripting0x28_L164)                                   ;B4C38C
pAIScripting0x28_L165:
    %AICMD0x1F(pAIScripting0x28_L167)                                        ;B4C38F
    %AICMD0x12_Jump(pAIScripting0x28_L165)                                   ;B4C392
pAIScripting0x28_L166:
    %AICMD0x1C_ShowDialog($02F4, $00)                          ;B4C395
    %AICMD0x41_AddValue16(nLove_Ellen, 10)                     ;B4C399
    %AICMD0x0B_SetScriptFlag($09)                                            ;B4C39F
    %AICMD0x12_Jump(pAIScripting0x28_L165)                                   ;B4C3A1
pAIScripting0x28_L167:
    %AICMD0x1C_ShowDialog($02F1, $00)                          ;B4C3A4
    %AICMD0x12_Jump(pAIScripting0x28_L165)                                   ;B4C3A8
pAIScripting0x28_L168:
    %AICMD0x10_End()                                           ;B4C3AB


pAIScripting0x28_Data04:
    %AICMD0x4F_DisableToolUse()                                               ;B4C3AC
    %AICMD0x50()                                               ;B4C3AD
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $09)       ;B4C3AE
    %AICMD0x02_FreezeTime()                                    ;B4C3B3
    %AICMD0x03_SetHour($07)                                    ;B4C3B4
    %AICMD0x05_SetTransferPosition(296, 536)                   ;B4C3B6
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B4C3BB
    %AICMD0x09_StartScript($01, pAIScripting0x28_L078)                                   ;B4C3BD
    %AICMD0x09_StartScript($02, pAIScripting0x28_L098)                                   ;B4C3C1
    %AICMD0x09_StartScript($03, pAIScripting0x28_L107)                                   ;B4C3C5
    %AICMD0x09_StartScript($04, pAIScripting0x28_L116)                                   ;B4C3C9
    %AICMD0x09_StartScript($05, pAIScripting0x28_L124)                                   ;B4C3CD
    %AICMD0x09_StartScript($06, pAIScripting0x28_L134)                                   ;B4C3D1
    %AICMD0x09_StartScript($07, pAIScripting0x28_L148)                                   ;B4C3D5
    %AICMD0x09_StartScript($08, pAIScripting0x28_L162)                                   ;B4C3D9
    %AICMD0x08_EnableAIControl()                               ;B4C3DD
    %AICMD0x13_Wait(1)                                         ;B4C3DE
    %AICMD0x06_SetDestinationArea(!AREA_EGGFESTIVAL)           ;B4C3E1
    %AICMD0x38_WaitForFadeIn()                                               ;B4C3E3
    %AICMD0x13_Wait(1)                                         ;B4C3E4
    %AICMD0x15_JumpIfEquals8(wram80($7E09A2+!DE_RAM_SHIFT), 3, pAIScripting0x28_L169)              ;B4C3E7
    %AICMD0x15_JumpIfEquals8(wram80($7E09A2+!DE_RAM_SHIFT), 4, pAIScripting0x28_L169)              ;B4C3EE
    %AICMD0x15_JumpIfEquals8(wram80($7E09A2+!DE_RAM_SHIFT), 5, pAIScripting0x28_L169)              ;B4C3F5
    %AICMD0x1C_ShowDialog($038F, $00)                          ;B4C3FC
    %AICMD0x12_Jump(pAIScripting0x28_L170)                                   ;B4C400
pAIScripting0x28_L169:
    %AICMD0x1C_ShowDialog($02EA, $00)                          ;B4C403
    %AICMD0x41_AddValue16(nPlayerHappiness, 30)                ;B4C407
    %AICMD0x09_StartScript($09, pAIScripting0x28_L088)                                   ;B4C40D
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B4C411
pAIScripting0x28_L170:
    %AICMD0x13_Wait(1)                                         ;B4C413
    %AICMD0x1C_ShowDialog($02EC, $00)                          ;B4C416
    %AICMD0x13_Wait(1)                                         ;B4C41A
    %AICMD0x1C_ShowDialog($02ED, $00)                          ;B4C41D
    %AICMD0x11_EnableUserControl()                             ;B4C421
    %AICMD0x13_Wait(650)                                       ;B4C422
    %AICMD0x3C()                                               ;B4C425
    %AICMD0x10_End()                                           ;B4C426
