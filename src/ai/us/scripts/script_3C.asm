

pAIScripting0x3C:
    dw DATA8_B4DCED                                            ;B4DCCD|        |B4DCED;
    dw DATA8_B4DE3E                                            ;B4DCCF|        |B4DE3E;
    dw pAIScripting0x3D                                        ;B4DCD1|        |B4DF94;
    dw pAIScripting0x3D                                        ;B4DCD3|        |B4DF94;
    dw pAIScripting0x3D                                        ;B4DCD5|        |B4DF94;
    dw pAIScripting0x3D                                        ;B4DCD7|        |B4DF94;
    dw pAIScripting0x3D                                        ;B4DCD9|        |B4DF94;
    dw pAIScripting0x3D                                        ;B4DCDB|        |B4DF94;
    dw pAIScripting0x3D                                        ;B4DCDD|        |B4DF94;
    dw pAIScripting0x3D                                        ;B4DCDF|        |B4DF94;
    dw pAIScripting0x3D                                        ;B4DCE1|        |B4DF94;
    dw pAIScripting0x3D                                        ;B4DCE3|        |B4DF94;
    dw pAIScripting0x3D                                        ;B4DCE5|        |B4DF94;
    dw pAIScripting0x3D                                        ;B4DCE7|        |B4DF94;
    dw pAIScripting0x3D                                        ;B4DCE9|        |B4DF94;
    dw pAIScripting0x3D                                        ;B4DCEB|        |B4DF94;
 
DATA8_B4DCED:
 
    %AICMD0x00_SetMusic($10, $B4)                              ;B4DCED
    %AICMD0x02_FreezeTime()                                    ;B4DCF0
    %AICMD0x03_SetHour($06)                                    ;B4DCF1
    %AICMD0x05_SetTransferPosition(65528, 104)                 ;B4DCF3
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4DCF8
    %AICMD0x40_DisableTileInteractions()                       ;B4DCFA
    %AICMD0x08_EnableAIControl()                               ;B4DCFB
    %AICMD0x09_StartScript($01, pAIScripting0x3C_L001)                                   ;B4DCFC
    %AICMD0x09_StartScript($02, pAIScripting0x3C_L003)                                   ;B4DD00
    %AICMD0x09_StartScript($03, pAIScripting0x3C_L007)                                   ;B4DD04
    %AICMD0x06_SetDestinationArea(!AREA_ENDING04)              ;B4DD08
    %AICMD0x38_WaitForFadeIn()                                               ;B4DD0A
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B4DD0B
    %AICMD0x13_Wait(20)                                        ;B4DD0D
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 96)                 ;B4DD10
    %AICMD0x13_Wait(20)                                        ;B4DD14
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 32)                    ;B4DD17
    %AICMD0x13_Wait(30)                                        ;B4DD1B
    %AICMD0x19($0071, $00)                                     ;B4DD1E
    %AICMD0x13_Wait(60)                                        ;B4DD22
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 32)                  ;B4DD25
    %AICMD0x13_Wait(20)                                        ;B4DD29
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 16)                 ;B4DD2C
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4DD30
    %AICMD0x13_Wait(30)                                        ;B4DD32
    %AICMD0x19($006A, $00)                                     ;B4DD35
    %AICMD0x13_Wait(80)                                        ;B4DD39
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4DD3C
    %AICMD0x13_Wait(20)                                        ;B4DD3E
    %AICMD0x19($006A, $00)                                     ;B4DD41
    %AICMD0x13_Wait(180)                                       ;B4DD45
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B4DD48
    %AICMD0x3D_TeleportToArea(!AREA_ENDING00)                  ;B4DD4A
    %AICMD0x10_End()                                           ;B4DD4C
pAIScripting0x3C_L001:
    %AICMD0x1A($0068, $0098, aAIScriptingData_L004, $02)                     ;B4DD4D
pAIScripting0x3C_L002:
    %AICMD0x1B($01F8, $01)                                     ;B4DD55
    %AICMD0x13_Wait(180)                                       ;B4DD59
    %AICMD0x1B($01EE, $01)                                     ;B4DD5C
    %AICMD0x13_Wait(120)                                       ;B4DD60
    %AICMD0x1B($01EB, $01)                                     ;B4DD63
    %AICMD0x13_Wait(120)                                       ;B4DD67
    %AICMD0x1B($01EF, $01)                                     ;B4DD6A
    %AICMD0x13_Wait(120)                                       ;B4DD6E
    %AICMD0x12_Jump(pAIScripting0x3C_L002)                                   ;B4DD71
pAIScripting0x3C_L003:
    %AICMD0x1A($0098, $0068, aAIScriptingData_L073, $00)                     ;B4DD74
    %AICMD0x13_Wait(120)                                       ;B4DD7C
    %AICMD0x0D($00, $01, $20, $01)                             ;B4DD7F
    %AICMD0x13_Wait(60)                                        ;B4DD84
    %AICMD0x1B($02E6, $00)                                     ;B4DD87
    %AICMD0x13_Wait(60)                                        ;B4DD8B
    %AICMD0x1B($02ED, $00)                                     ;B4DD8E
    %AICMD0x13_Wait(180)                                       ;B4DD92
    %AICMD0x1B($02E5, $00)                                     ;B4DD95
    %AICMD0x0D($00, $FF, $20, $01)                             ;B4DD99
    %AICMD0x13_Wait(120)                                       ;B4DD9E
    %AICMD0x1B($02E6, $00)                                     ;B4DDA1
    %AICMD0x13_Wait(60)                                        ;B4DDA5
    %AICMD0x1B($0233, $00)                                     ;B4DDA8
    %AICMD0x0B_SetScriptFlag($00)                                            ;B4DDAC
    %AICMD0x13_Wait(240)                                       ;B4DDAE
    %AICMD0x1B($02E7, $00)                                     ;B4DDB1
    %AICMD0x0D($FF, $00, $10, $01)                             ;B4DDB5
    %AICMD0x13_Wait(60)                                        ;B4DDBA
    %AICMD0x1B($02ED, $00)                                     ;B4DDBD
    %AICMD0x13_Wait(60)                                        ;B4DDC1
    %AICMD0x09_StartScript($04, pAIScripting0x3C_L005)                                   ;B4DDC4
    %AICMD0x1B($02E7, $00)                                     ;B4DDC8
    %AICMD0x13_Wait(120)                                       ;B4DDCC
    %AICMD0x1B($02E7, $01)                                     ;B4DDCF
    %AICMD0x0D($01, $00, $20, $01)                             ;B4DDD3
    %AICMD0x1B($0258, $01)                                     ;B4DDD8
    %AICMD0x13_Wait(180)                                       ;B4DDDC
    %AICMD0x1B($02E7, $00)                                     ;B4DDDF
    %AICMD0x0D($FF, $00, $20, $01)                             ;B4DDE3
    %AICMD0x1B($0258, $00)                                     ;B4DDE8
    %AICMD0x13_Wait(180)                                       ;B4DDEC
    %AICMD0x0B_SetScriptFlag($01)                                            ;B4DDEF
pAIScripting0x3C_L004:
    %AICMD0x13_Wait(1)                                         ;B4DDF1
    %AICMD0x12_Jump(pAIScripting0x3C_L004)                                   ;B4DDF4
pAIScripting0x3C_L005:
    %AICMD0x1A($0078, $006A, aAIScriptingData_L084, $02)                     ;B4DDF7
    %AICMD0x1B($0313, $01)                                     ;B4DDFF
    %AICMD0x0D($08, $F8, $02, $01)                             ;B4DE03
    %AICMD0x13_Wait(118)                                       ;B4DE08
    %AICMD0x1B($0313, $01)                                     ;B4DE0B
    %AICMD0x0D($01, $00, $20, $01)                             ;B4DE0F
    %AICMD0x13_Wait(180)                                       ;B4DE14
    %AICMD0x1B($0313, $00)                                     ;B4DE17
    %AICMD0x0D($FF, $00, $20, $01)                             ;B4DE1B
    %AICMD0x13_Wait(180)                                       ;B4DE20
pAIScripting0x3C_L006:
    %AICMD0x13_Wait(1)                                         ;B4DE23
    %AICMD0x12_Jump(pAIScripting0x3C_L006)                                   ;B4DE26
pAIScripting0x3C_L007:
    %AICMD0x1A($0078, $0098, aAIScriptingData_L064, $03)                     ;B4DE29
    %AICMD0x13_Wait(360)                                       ;B4DE31
    %AICMD0x1B($02D1, $00)                                     ;B4DE34
pAIScripting0x3C_L008:
    %AICMD0x13_Wait(1)                                         ;B4DE38
    %AICMD0x12_Jump(pAIScripting0x3C_L008)                                   ;B4DE3B


DATA8_B4DE3E:
    %AICMD0x00_SetMusic($10, $B4)                              ;B4DE3E
    %AICMD0x02_FreezeTime()                                    ;B4DE41
    %AICMD0x03_SetHour($07)                                    ;B4DE42
    %AICMD0x40_DisableTileInteractions()                       ;B4DE44
    %AICMD0x05_SetTransferPosition(136, 648)                   ;B4DE45
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4DE4A
    %AICMD0x08_EnableAIControl()                               ;B4DE4C
    %AICMD0x09_StartScript($01, pAIScripting0x3C_L009)                                   ;B4DE4D
    %AICMD0x09_StartScript($02, pAIScripting0x3C_L017)                                   ;B4DE51
    %AICMD0x09_StartScript($03, pAIScripting0x3C_L015)                                   ;B4DE55
    %AICMD0x09_StartScript($04, pAIScripting0x3C_L019)                                   ;B4DE59
    %AICMD0x06_SetDestinationArea(!AREA_WOODSSPRING)           ;B4DE5D
    %AICMD0x38_WaitForFadeIn()                                               ;B4DE5F
    %AICMD0x13_Wait(80)                                        ;B4DE60
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4DE63
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B4DE65
    %AICMD0x13_Wait(180)                                       ;B4DE67
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 64)                 ;B4DE6A
    %AICMD0x13_Wait(10)                                        ;B4DE6E
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B4DE71
    %AICMD0x13_Wait(30)                                        ;B4DE73
    %AICMD0x09_StartScript($05, pAIScripting0x3C_L020)                                   ;B4DE76
    %AICMD0x0C_WaitForScriptFlag($02)                                            ;B4DE7A
    %AICMD0x13_Wait(20)                                        ;B4DE7C
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4DE7F
    %AICMD0x13_Wait(50)                                        ;B4DE81
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 24)                   ;B4DE84
    %AICMD0x4E_EnableTileInteractions()                                               ;B4DE88
    %AICMD0x19($0023, $00)                                     ;B4DE89
    %AICMD0x13_Wait(60)                                        ;B4DE8D
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4DE90
    %AICMD0x13_Wait(60)                                        ;B4DE92
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4DE95
    %AICMD0x13_Wait(30)                                        ;B4DE97
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4DE9A
    %AICMD0x13_Wait(30)                                        ;B4DE9C
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4DE9F
    %AICMD0x13_Wait(30)                                        ;B4DEA1
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4DEA4
    %AICMD0x13_Wait(30)                                        ;B4DEA6
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4DEA9
    %AICMD0x13_Wait(180)                                       ;B4DEAB
    %AICMD0x3D_TeleportToArea(!AREA_ENDING00)                  ;B4DEAE
    %AICMD0x10_End()                                           ;B4DEB0
pAIScripting0x3C_L009:
    %AICMD0x1A($00A8, $0298, aAIScriptingData_L073, $03)                     ;B4DEB1
    %AICMD0x13_Wait(60)                                        ;B4DEB9
    %AICMD0x0B_SetScriptFlag($00)                                            ;B4DEBC
    %AICMD0x09_StartScript($06, pAIScripting0x3C_L013)                                   ;B4DEBE
    %AICMD0x1B($02E7, $01)                                     ;B4DEC2
    %AICMD0x0D($01, $00, $20, $01)                             ;B4DEC6
    %AICMD0x1B($02E6, $00)                                     ;B4DECB
    %AICMD0x13_Wait(30)                                        ;B4DECF
    %AICMD0x1B($02E5, $00)                                     ;B4DED2
    %AICMD0x0D($00, $FF, $20, $01)                             ;B4DED6
    %AICMD0x1B($02E7, $01)                                     ;B4DEDB
    %AICMD0x0D($01, $00, $90, $01)                             ;B4DEDF
    %AICMD0x0C_WaitForScriptFlag($02)                                            ;B4DEE4
    %AICMD0x13_Wait(60)                                        ;B4DEE6
    %AICMD0x09_StartScript($07, pAIScripting0x3C_L011)                                   ;B4DEE9
    %AICMD0x1B($02E7, $00)                                     ;B4DEED
    %AICMD0x0D($FF, $00, $90, $01)                             ;B4DEF1
    %AICMD0x1B($02E3, $00)                                     ;B4DEF6
    %AICMD0x0D($00, $01, $0E, $01)                             ;B4DEFA
    %AICMD0x1B($02E7, $00)                                     ;B4DEFF
    %AICMD0x13_Wait(60)                                        ;B4DF03
    %AICMD0x1B($0258, $00)                                     ;B4DF06
    %AICMD0x13_Wait(120)                                       ;B4DF0A
pAIScripting0x3C_L010:
    %AICMD0x13_Wait(1)                                         ;B4DF0D
    %AICMD0x12_Jump(pAIScripting0x3C_L010)                                   ;B4DF10
pAIScripting0x3C_L011:
    %AICMD0x1A($0158, $0264, aAIScriptingData_L213, $00)                     ;B4DF13
    %AICMD0x0D($FF, $00, $90, $01)                             ;B4DF1B
    %AICMD0x0D($00, $01, $0E, $01)                             ;B4DF20
    %AICMD0x13_Wait(180)                                       ;B4DF25
pAIScripting0x3C_L012:
    %AICMD0x13_Wait(1)                                         ;B4DF28
    %AICMD0x12_Jump(pAIScripting0x3C_L012)                                   ;B4DF2B
pAIScripting0x3C_L013:
    %AICMD0x1A($00C8, $0248, aAIScriptingData_L083, $00)                     ;B4DF2E
    %AICMD0x13_Wait(30)                                        ;B4DF36
pAIScripting0x3C_L014:
    %AICMD0x0D($01, $00, $08, $02)                             ;B4DF39
    %AICMD0x0D($00, $FF, $06, $02)                             ;B4DF3E
    %AICMD0x0D($FF, $00, $08, $02)                             ;B4DF43
    %AICMD0x0D($01, $00, $08, $02)                             ;B4DF48
    %AICMD0x12_Jump(pAIScripting0x3C_L014)                                   ;B4DF4D
pAIScripting0x3C_L015:
    %AICMD0x1A($0094, $0298, aAIScriptingData_L186, $00)                     ;B4DF50
pAIScripting0x3C_L016:
    %AICMD0x13_Wait(1)                                         ;B4DF58
    %AICMD0x12_Jump(pAIScripting0x3C_L016)                                   ;B4DF5B
pAIScripting0x3C_L017:
    %AICMD0x1A($0092, $02A0, aAIScriptingData_L010, $00)                     ;B4DF5E
pAIScripting0x3C_L018:
    %AICMD0x13_Wait(1)                                         ;B4DF66
    %AICMD0x12_Jump(pAIScripting0x3C_L018)                                   ;B4DF69
pAIScripting0x3C_L019:
    %AICMD0x1A($0088, $0298, aAIScriptingData_L184, $00)                     ;B4DF6C
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B4DF74
    %AICMD0x0D($F0, $F0, $01, $01)                             ;B4DF76
    %AICMD0x13_Wait(60)                                        ;B4DF7B
    %AICMD0x37()                                               ;B4DF7E
    %AICMD0x10_End()                                           ;B4DF7F
pAIScripting0x3C_L020:
    %AICMD0x1A($0078, $0298, aAIScriptingData_L088, $00)                     ;B4DF80
    %AICMD0x13_Wait(60)                                        ;B4DF88
    %AICMD0x0B_SetScriptFlag($01)                                            ;B4DF8B
    %AICMD0x13_Wait(60)                                        ;B4DF8D
    %AICMD0x0B_SetScriptFlag($02)                                            ;B4DF90
    %AICMD0x37()                                               ;B4DF92
    %AICMD0x10_End()                                           ;B4DF93
