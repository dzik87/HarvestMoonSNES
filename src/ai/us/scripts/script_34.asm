

pAIScripting0x34:
    dw pAIScripting0x34_Data01                                            ;B4CECA|        |B4CEEA;
    dw pAIScripting0x35                                        ;B4CECC|        |B4D011;
    dw pAIScripting0x35                                        ;B4CECE|        |B4D011;
    dw pAIScripting0x35                                        ;B4CED0|        |B4D011;
    dw pAIScripting0x35                                        ;B4CED2|        |B4D011;
    dw pAIScripting0x35                                        ;B4CED4|        |B4D011;
    dw pAIScripting0x35                                        ;B4CED6|        |B4D011;
    dw pAIScripting0x35                                        ;B4CED8|        |B4D011;
    dw pAIScripting0x35                                        ;B4CEDA|        |B4D011;
    dw pAIScripting0x35                                        ;B4CEDC|        |B4D011;
    dw pAIScripting0x35                                        ;B4CEDE|        |B4D011;
    dw pAIScripting0x35                                        ;B4CEE0|        |B4D011;
    dw pAIScripting0x35                                        ;B4CEE2|        |B4D011;
    dw pAIScripting0x35                                        ;B4CEE4|        |B4D011;
    dw pAIScripting0x35                                        ;B4CEE6|        |B4D011;
    dw pAIScripting0x35                                        ;B4CEE8|        |B4D011;
 
pAIScripting0x34_Data01:
    %AICMD0x47_SetValue8(wram80(strcPlayerData.toolEquipped), 16)                          ;B4CEEA
    %AICMD0x47_SetValue8(wram80(strcPlayerData.leftWater), 5)                           ;B4CEEF
    %AICMD0x00_SetMusic($10, $B4)                              ;B4CEF4
    %AICMD0x02_FreezeTime()                                    ;B4CEF7
    %AICMD0x03_SetHour($06)                                    ;B4CEF8
    %AICMD0x05_SetTransferPosition(232, 65528)                 ;B4CEFA
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4CEFF
    %AICMD0x08_EnableAIControl()                               ;B4CF01
    %AICMD0x09_StartScript($01, pAIScripting0x34_L001)                                   ;B4CF02
    %AICMD0x06_SetDestinationArea(!AREA_ENDING07)              ;B4CF06
    %AICMD0x38_WaitForFadeIn()                                               ;B4CF08
    %AICMD0x13_Wait(60)                                        ;B4CF09
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 112)                 ;B4CF0C
    %AICMD0x13_Wait(30)                                        ;B4CF10
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 64)                   ;B4CF13
    %AICMD0x13_Wait(30)                                        ;B4CF17
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 24)                   ;B4CF1A
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4CF1E
    %AICMD0x3E_SetCarryItem($10)                               ;B4CF20
    %AICMD0x13_Wait(30)                                        ;B4CF22
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 24)                     ;B4CF25
    %AICMD0x13_Wait(40)                                        ;B4CF29
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 88)                  ;B4CF2C
    %AICMD0x3F_ThrowCarriedItem()                              ;B4CF30
    %AICMD0x13_Wait(90)                                        ;B4CF31
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4CF34
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 88)                   ;B4CF36
    %AICMD0x13_Wait(30)                                        ;B4CF3A
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 16)                   ;B4CF3D
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4CF41
    %AICMD0x3E_SetCarryItem($10)                               ;B4CF43
    %AICMD0x13_Wait(30)                                        ;B4CF45
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 16)                     ;B4CF48
    %AICMD0x13_Wait(30)                                        ;B4CF4C
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 88)                  ;B4CF4F
    %AICMD0x3F_ThrowCarriedItem()                              ;B4CF53
    %AICMD0x13_Wait(90)                                        ;B4CF54
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4CF57
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 88)                   ;B4CF59
    %AICMD0x13_Wait(30)                                        ;B4CF5D
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 15)                  ;B4CF60
    %AICMD0x13_Wait(30)                                        ;B4CF64
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4CF67
    %AICMD0x56_UseEquippedItem()                               ;B4CF69
    %AICMD0x13_Wait(80)                                        ;B4CF6A
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 15)                  ;B4CF6D
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4CF71
    %AICMD0x56_UseEquippedItem()                               ;B4CF73
    %AICMD0x13_Wait(80)                                        ;B4CF74
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 15)                  ;B4CF77
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4CF7B
    %AICMD0x56_UseEquippedItem()                               ;B4CF7D
    %AICMD0x13_Wait(80)                                        ;B4CF7E
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 15)                  ;B4CF81
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4CF85
    %AICMD0x56_UseEquippedItem()                               ;B4CF87
    %AICMD0x13_Wait(80)                                        ;B4CF88
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 15)                  ;B4CF8B
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4CF8F
    %AICMD0x56_UseEquippedItem()                               ;B4CF91
    %AICMD0x13_Wait(80)                                        ;B4CF92
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 15)                  ;B4CF95
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4CF99
    %AICMD0x56_UseEquippedItem()                               ;B4CF9B
    %AICMD0x13_Wait(80)                                        ;B4CF9C
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 48)                     ;B4CF9F
    %AICMD0x13_Wait(30)                                        ;B4CFA3
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 64)                   ;B4CFA6
    %AICMD0x0B_SetScriptFlag($00)                                            ;B4CFAA
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B4CFAC
    %AICMD0x3D_TeleportToArea(!AREA_ENDING00)                  ;B4CFAE
    %AICMD0x10_End()                                           ;B4CFB0
pAIScripting0x34_L001:
    %AICMD0x1A($0098, $0098, aAIScriptingData_L173, $03)                     ;B4CFB1
    %AICMD0x1B($01EA, $00)                                     ;B4CFB9
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B4CFBD
    %AICMD0x13_Wait(180)                                       ;B4CFBF
    %AICMD0x1B($01E1, $00)                                     ;B4CFC2
    %AICMD0x0D($00, $FF, $20, $01)                             ;B4CFC6
    %AICMD0x1B($01EE, $01)                                     ;B4CFCB
    %AICMD0x13_Wait(120)                                       ;B4CFCF
    %AICMD0x1B($01DA, $00)                                     ;B4CFD2
    %AICMD0x0D($00, $01, $20, $01)                             ;B4CFD6
    %AICMD0x1B($01EE, $01)                                     ;B4CFDB
    %AICMD0x13_Wait(90)                                        ;B4CFDF
    %AICMD0x1B($01F7, $00)                                     ;B4CFE2
    %AICMD0x13_Wait(90)                                        ;B4CFE6
    %AICMD0x1B($01E1, $00)                                     ;B4CFE9
    %AICMD0x0D($00, $FF, $10, $01)                             ;B4CFED
    %AICMD0x1B($01F7, $00)                                     ;B4CFF2
    %AICMD0x13_Wait(90)                                        ;B4CFF6
    %AICMD0x1B($01E1, $00)                                     ;B4CFF9
    %AICMD0x0D($00, $FF, $10, $01)                             ;B4CFFD
    %AICMD0x1B($01F7, $00)                                     ;B4D002
    %AICMD0x13_Wait(90)                                        ;B4D006
    %AICMD0x0B_SetScriptFlag($01)                                            ;B4D009
pAIScripting0x34_L002:
    %AICMD0x13_Wait(1)                                         ;B4D00B
    %AICMD0x12_Jump(pAIScripting0x34_L002)                                   ;B4D00E
