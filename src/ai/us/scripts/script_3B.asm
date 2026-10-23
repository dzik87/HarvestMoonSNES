

pAIScripting0x3B:
    dw DATA8_B4DA42                                            ;B4DA22|        |B4DA42;
    dw DATA8_B4DB0A                                            ;B4DA24|        |B4DB0A;
    dw pAIScripting0x3C                                        ;B4DA26|        |B4DCCD;
    dw pAIScripting0x3C                                        ;B4DA28|        |B4DCCD;
    dw pAIScripting0x3C                                        ;B4DA2A|        |B4DCCD;
    dw pAIScripting0x3C                                        ;B4DA2C|        |B4DCCD;
    dw pAIScripting0x3C                                        ;B4DA2E|        |B4DCCD;
    dw pAIScripting0x3C                                        ;B4DA30|        |B4DCCD;
    dw pAIScripting0x3C                                        ;B4DA32|        |B4DCCD;
    dw pAIScripting0x3C                                        ;B4DA34|        |B4DCCD;
    dw pAIScripting0x3C                                        ;B4DA36|        |B4DCCD;
    dw pAIScripting0x3C                                        ;B4DA38|        |B4DCCD;
    dw pAIScripting0x3C                                        ;B4DA3A|        |B4DCCD;
    dw pAIScripting0x3C                                        ;B4DA3C|        |B4DCCD;
    dw pAIScripting0x3C                                        ;B4DA3E|        |B4DCCD;
    dw pAIScripting0x3C                                        ;B4DA40|        |B4DCCD;
 
DATA8_B4DA42:
 
    %AICMD0x00_SetMusic($10, $B4)                              ;B4DA42
    %AICMD0x02_FreezeTime()                                    ;B4DA45
    %AICMD0x03_SetHour($07)                                    ;B4DA46
    %AICMD0x05_SetTransferPosition(136, 456)                   ;B4DA48
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B4DA4D
    %AICMD0x08_EnableAIControl()                               ;B4DA4F
    %AICMD0x09_StartScript($01, pAIScripting0x3B_L001)                                   ;B4DA50
    %AICMD0x06_SetDestinationArea(!AREA_TOOLSSHOP)             ;B4DA54
    %AICMD0x38_WaitForFadeIn()                                               ;B4DA56
    %AICMD0x13_Wait(60)                                        ;B4DA57
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 64)                    ;B4DA5A
    %AICMD0x13_Wait(60)                                        ;B4DA5E
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4DA61
    %AICMD0x0B_SetScriptFlag($00)                                            ;B4DA63
    %AICMD0x13_Wait(96)                                        ;B4DA65
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4DA68
    %AICMD0x13_Wait(30)                                        ;B4DA6A
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4DA6D
    %AICMD0x13_Wait(30)                                        ;B4DA6F
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 32)                    ;B4DA72
    %AICMD0x13_Wait(60)                                        ;B4DA76
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 64)                  ;B4DA79
    %AICMD0x13_Wait(60)                                        ;B4DA7D
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 16)                  ;B4DA80
    %AICMD0x13_Wait(30)                                        ;B4DA84
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 96)                 ;B4DA87
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B4DA8B
    %AICMD0x3D_TeleportToArea(!AREA_ENDING00)                  ;B4DA8D
    %AICMD0x10_End()                                           ;B4DA8F
pAIScripting0x3B_L001:
    %AICMD0x1A($0098, $01E8, aAIScriptingData_L071, $00)                     ;B4DA90
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B4DA98
    %AICMD0x1B($02E5, $00)                                     ;B4DA9A
    %AICMD0x0D($00, $FF, $60, $01)                             ;B4DA9E
    %AICMD0x1B($02E7, $00)                                     ;B4DAA3
    %AICMD0x13_Wait(30)                                        ;B4DAA7
    %AICMD0x1B($02E7, $01)                                     ;B4DAAA
    %AICMD0x13_Wait(30)                                        ;B4DAAE
    %AICMD0x1B($02E5, $00)                                     ;B4DAB1
    %AICMD0x0D($00, $FF, $20, $01)                             ;B4DAB5
    %AICMD0x1B($02E7, $00)                                     ;B4DABA
    %AICMD0x13_Wait(80)                                        ;B4DABE
    %AICMD0x1B($02E7, $01)                                     ;B4DAC1
    %AICMD0x0D($01, $00, $30, $01)                             ;B4DAC5
    %AICMD0x13_Wait(30)                                        ;B4DACA
    %AICMD0x09_StartScript($02, pAIScripting0x3B_L003)                                   ;B4DACD
    %AICMD0x13_Wait(30)                                        ;B4DAD1
    %AICMD0x1B($0233, $01)                                     ;B4DAD4
    %AICMD0x13_Wait(60)                                        ;B4DAD8
    %AICMD0x1B($02E3, $00)                                     ;B4DADB
    %AICMD0x0D($00, $01, $10, $01)                             ;B4DADF
    %AICMD0x1B($02E7, $00)                                     ;B4DAE4
    %AICMD0x0D($FF, $00, $10, $01)                             ;B4DAE8
    %AICMD0x1B($0233, $00)                                     ;B4DAED
    %AICMD0x13_Wait(120)                                       ;B4DAF1
    %AICMD0x0B_SetScriptFlag($01)                                            ;B4DAF4
pAIScripting0x3B_L002:
    %AICMD0x13_Wait(1)                                         ;B4DAF6
    %AICMD0x12_Jump(pAIScripting0x3B_L002)                                   ;B4DAF9
pAIScripting0x3B_L003:
    %AICMD0x1A($00D8, $0168, aAIScriptingData_L201, $00)                     ;B4DAFC
pAIScripting0x3B_L004:
    %AICMD0x13_Wait(1)                                         ;B4DB04
    %AICMD0x12_Jump(pAIScripting0x3B_L004)                                   ;B4DB07


DATA8_B4DB0A:
    %AICMD0x00_SetMusic($10, $B4)                              ;B4DB0A
    %AICMD0x02_FreezeTime()                                    ;B4DB0D
    %AICMD0x03_SetHour($07)                                    ;B4DB0E
    %AICMD0x05_SetTransferPosition(296, 872)                   ;B4DB10
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4DB15
    %AICMD0x08_EnableAIControl()                               ;B4DB17
    %AICMD0x09_StartScript($01, pAIScripting0x3B_L005)                                   ;B4DB18
    %AICMD0x09_StartScript($02, pAIScripting0x3B_L011)                                   ;B4DB1C
    %AICMD0x09_StartScript($03, pAIScripting0x3B_L007)                                   ;B4DB20
    %AICMD0x09_StartScript($04, pAIScripting0x3B_L009)                                   ;B4DB24
    %AICMD0x09_StartScript($05, pAIScripting0x3B_L013)                                   ;B4DB28
    %AICMD0x06_SetDestinationArea(!AREA_TOWNSUMMER)            ;B4DB2C
    %AICMD0x38_WaitForFadeIn()                                               ;B4DB2E
    %AICMD0x13_Wait(90)                                        ;B4DB2F
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 32)                 ;B4DB32
    %AICMD0x13_Wait(20)                                        ;B4DB36
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 144)                   ;B4DB39
    %AICMD0x13_Wait(20)                                        ;B4DB3D
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 32)                  ;B4DB40
    %AICMD0x13_Wait(20)                                        ;B4DB44
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 160)                   ;B4DB47
    %AICMD0x0B_SetScriptFlag($00)                                            ;B4DB4B
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B4DB4D
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4DB4F
    %AICMD0x13_Wait(60)                                        ;B4DB51
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 16)                    ;B4DB54
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 80)                 ;B4DB58
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 240)                   ;B4DB5C
    %AICMD0x13_Wait(60)                                        ;B4DB60
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 112)                   ;B4DB63
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4DB67
    %AICMD0x13_Wait(120)                                       ;B4DB69
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B4DB6C
    %AICMD0x19($0021, $00)                                     ;B4DB6E
    %AICMD0x13_Wait(80)                                        ;B4DB72
    %AICMD0x19($0001, $00)                                     ;B4DB75
    %AICMD0x13_Wait(10)                                        ;B4DB79
    %AICMD0x19($0021, $00)                                     ;B4DB7C
    %AICMD0x13_Wait(180)                                       ;B4DB80
    %AICMD0x3D_TeleportToArea(!AREA_ENDING00)                  ;B4DB83
    %AICMD0x10_End()                                           ;B4DB85
pAIScripting0x3B_L005:
    %AICMD0x1A($0118, $0368, aAIScriptingData_L071, $00)                     ;B4DB86
    %AICMD0x13_Wait(120)                                       ;B4DB8E
    %AICMD0x1B($02E7, $01)                                     ;B4DB91
    %AICMD0x0D($01, $00, $20, $01)                             ;B4DB95
    %AICMD0x13_Wait(20)                                        ;B4DB9A
    %AICMD0x1B($02E7, $01)                                     ;B4DB9D
    %AICMD0x0D($01, $00, $10, $01)                             ;B4DBA1
    %AICMD0x13_Wait(20)                                        ;B4DBA6
    %AICMD0x1B($02E5, $00)                                     ;B4DBA9
    %AICMD0x0D($00, $FF, $90, $01)                             ;B4DBAD
    %AICMD0x13_Wait(20)                                        ;B4DBB2
    %AICMD0x1B($02E7, $00)                                     ;B4DBB5
    %AICMD0x0D($FF, $00, $10, $01)                             ;B4DBB9
    %AICMD0x13_Wait(20)                                        ;B4DBBE
    %AICMD0x1B($02E5, $00)                                     ;B4DBC1
    %AICMD0x0D($00, $FF, $A0, $01)                             ;B4DBC5
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B4DBCA
    %AICMD0x1B($02E6, $00)                                     ;B4DBCC
    %AICMD0x13_Wait(60)                                        ;B4DBD0
    %AICMD0x1B($02E5, $00)                                     ;B4DBD3
    %AICMD0x13_Wait(60)                                        ;B4DBD7
    %AICMD0x1B($02E7, $01)                                     ;B4DBDA
    %AICMD0x0D($01, $00, $30, $01)                             ;B4DBDE
    %AICMD0x1B($02E5, $00)                                     ;B4DBE3
    %AICMD0x0D($00, $FF, $FF, $01)                             ;B4DBE7
    %AICMD0x13_Wait(60)                                        ;B4DBEC
    %AICMD0x1B($02E5, $00)                                     ;B4DBEF
    %AICMD0x0D($00, $FF, $78, $01)                             ;B4DBF3
    %AICMD0x1B($02E6, $01)                                     ;B4DBF8
    %AICMD0x13_Wait(120)                                       ;B4DBFC
    %AICMD0x1B($02E7, $00)                                     ;B4DBFF
    %AICMD0x0D($FF, $00, $10, $01)                             ;B4DC03
    %AICMD0x1B($02E5, $00)                                     ;B4DC08
    %AICMD0x0D($00, $FF, $18, $01)                             ;B4DC0C
    %AICMD0x1B($0233, $01)                                     ;B4DC11
    %AICMD0x13_Wait(180)                                       ;B4DC15
pAIScripting0x3B_L006:
    %AICMD0x13_Wait(1)                                         ;B4DC18
    %AICMD0x12_Jump(pAIScripting0x3B_L006)                                   ;B4DC1B
pAIScripting0x3B_L007:
    %AICMD0x1A($0168, $00A8, aAIScriptingData_L046, $00)                     ;B4DC1E
pAIScripting0x3B_L008:
    %AICMD0x1B($029A, $01)                                     ;B4DC26
    %AICMD0x13_Wait(60)                                        ;B4DC2A
    %AICMD0x1B($029C, $00)                                     ;B4DC2D
    %AICMD0x13_Wait(180)                                       ;B4DC31
    %AICMD0x12_Jump(pAIScripting0x3B_L008)                                   ;B4DC34
pAIScripting0x3B_L009:
    %AICMD0x1A($0178, $00A8, aAIScriptingData_L064, $00)                     ;B4DC37
pAIScripting0x3B_L010:
    %AICMD0x1B($02D0, $00)                                     ;B4DC3F
    %AICMD0x13_Wait(60)                                        ;B4DC43
    %AICMD0x1B($02CC, $00)                                     ;B4DC46
    %AICMD0x13_Wait(180)                                       ;B4DC4A
    %AICMD0x12_Jump(pAIScripting0x3B_L010)                                   ;B4DC4D
pAIScripting0x3B_L011:
    %AICMD0x1A($0148, $00B8, aAIScriptingData_L051, $02)                     ;B4DC50
pAIScripting0x3B_L012:
    %AICMD0x1B($02A5, $00)                                     ;B4DC58
    %AICMD0x13_Wait(120)                                       ;B4DC5C
    %AICMD0x1B($02A6, $00)                                     ;B4DC5F
    %AICMD0x13_Wait(120)                                       ;B4DC63
    %AICMD0x12_Jump(pAIScripting0x3B_L012)                                   ;B4DC66
pAIScripting0x3B_L013:
    %AICMD0x1A($01B8, $0218, aAIScriptingData_L020, $03)                     ;B4DC69
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B4DC71
    %AICMD0x0D($FF, $00, $80, $01)                             ;B4DC73
    %AICMD0x1B($024C, $00)                                     ;B4DC78
    %AICMD0x0D($00, $01, $08, $01)                             ;B4DC7C
    %AICMD0x1B($0351, $00)                                     ;B4DC81
    %AICMD0x13_Wait(120)                                       ;B4DC85
    %AICMD0x1B($024E, $00)                                     ;B4DC88
    %AICMD0x0D($00, $FF, $18, $01)                             ;B4DC8C
    %AICMD0x1B($0250, $01)                                     ;B4DC91
    %AICMD0x0D($01, $00, $30, $01)                             ;B4DC95
    %AICMD0x1B($024E, $00)                                     ;B4DC9A
    %AICMD0x0D($00, $FF, $50, $01)                             ;B4DC9E
    %AICMD0x0B_SetScriptFlag($01)                                            ;B4DCA3
    %AICMD0x1B($024E, $00)                                     ;B4DCA5
    %AICMD0x0D($00, $FF, $B4, $01)                             ;B4DCA9
    %AICMD0x1B($0250, $01)                                     ;B4DCAE
    %AICMD0x0D($01, $00, $20, $01)                             ;B4DCB2
    %AICMD0x1B($024E, $00)                                     ;B4DCB7
    %AICMD0x0D($00, $FF, $50, $01)                             ;B4DCBB
    %AICMD0x1B($0250, $00)                                     ;B4DCC0
    %AICMD0x13_Wait(180)                                       ;B4DCC4
pAIScripting0x3B_L014:
    %AICMD0x13_Wait(1)                                         ;B4DCC7
    %AICMD0x12_Jump(pAIScripting0x3B_L014)                                   ;B4DCCA
