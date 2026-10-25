

    incsrc "../../../../build/gen/ai/slots_47.asm"
 
pAIScripting0x47_HowToPlay_Data01:
 
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $06)       ;B5ACAE
    %AICMD0x00_SetMusic($01, $B4)                              ;B5ACB3
    %AICMD0x02_FreezeTime()                                    ;B5ACB6
    %AICMD0x03_SetHour($07)                                    ;B5ACB7
    %AICMD0x05_SetTransferPosition(136, 344)                   ;B5ACB9
    %AICMD0x08_EnableAIControl()                               ;B5ACBE
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B5ACBF
    %AICMD0x06_SetDestinationArea(!AREA_FARMSPRING)            ;B5ACC1
    %AICMD0x38_WaitForFadeIn()                                               ;B5ACC3
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 32)                  ;B5ACC4
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 102)                 ;B5ACC8
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 56)                   ;B5ACCC
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 40)                  ;B5ACD0
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 16)                    ;B5ACD4
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $07)       ;B5ACD8
    %AICMD0x10_End()                                           ;B5ACDD


pAIScripting0x47_HowToPlay_Data02:
 
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $06)       ;B5ACDE
    %AICMD0x00_SetMusic($01, $B4)                              ;B5ACE3
    %AICMD0x02_FreezeTime()                                    ;B5ACE6
    %AICMD0x03_SetHour($07)                                    ;B5ACE7
    %AICMD0x05_SetTransferPosition(128, 200)                   ;B5ACE9
    %AICMD0x08_EnableAIControl()                               ;B5ACEE
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B5ACEF
    %AICMD0x47_SetValue8(nCurrentSeasonID, 0)                  ;B5ACF1
    %AICMD0x06_SetDestinationArea(!AREA_SHED)                  ;B5ACF6
    %AICMD0x38_WaitForFadeIn()                                               ;B5ACF8
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 16)                    ;B5ACF9
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 72)                 ;B5ACFD
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 8)                     ;B5AD01
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B5AD05
    %AICMD0x3E_SetCarryItem($2D)                               ;B5AD07
    %AICMD0x13_Wait(60)                                        ;B5AD09
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 16)                  ;B5AD0C
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B5AD10
    %AICMD0x3E_SetCarryItem($2C)                               ;B5AD12
    %AICMD0x13_Wait(60)                                        ;B5AD14
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 56)                  ;B5AD17
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 32)                  ;B5AD1B
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $07)       ;B5AD1F
    %AICMD0x10_End()                                           ;B5AD24


pAIScripting0x47_HowToPlay_Data03:
 
    %AICMD0x47_SetValue8(wram80(strcPlayerData.toolEquipped), 3)                           ;B5AD25
    %AICMD0x47_SetValue8(wram80(strcPlayerData.toolSecond), 4)                           ;B5AD2A
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $06)       ;B5AD2F
    %AICMD0x00_SetMusic($01, $B4)                              ;B5AD34
    %AICMD0x02_FreezeTime()                                    ;B5AD37
    %AICMD0x03_SetHour($07)                                    ;B5AD38
    %AICMD0x05_SetTransferPosition(424, 488)                   ;B5AD3A
    %AICMD0x08_EnableAIControl()                               ;B5AD3F
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B5AD40
    %AICMD0x47_SetValue8(nCurrentSeasonID, 0)                  ;B5AD42
    %AICMD0x06_SetDestinationArea(!AREA_FARMSPRING)            ;B5AD47
    %AICMD0x38_WaitForFadeIn()                                               ;B5AD49
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 1)                    ;B5AD4A
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 14)                  ;B5AD4E
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 16)                 ;B5AD52
    %AICMD0x3E_SetCarryItem($09)                               ;B5AD56
    %AICMD0x13_Wait(40)                                        ;B5AD58
    %AICMD0x3F_ThrowCarriedItem()                              ;B5AD5B
    %AICMD0x13_Wait(20)                                        ;B5AD5C
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 16)                 ;B5AD5F
    %AICMD0x3E_SetCarryItem($09)                               ;B5AD63
    %AICMD0x13_Wait(40)                                        ;B5AD65
    %AICMD0x3F_ThrowCarriedItem()                              ;B5AD68
    %AICMD0x13_Wait(20)                                        ;B5AD69
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 16)                 ;B5AD6C
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B5AD70
    %AICMD0x3E_SetCarryItem($09)                               ;B5AD72
    %AICMD0x13_Wait(40)                                        ;B5AD74
    %AICMD0x3F_ThrowCarriedItem()                              ;B5AD77
    %AICMD0x13_Wait(20)                                        ;B5AD78
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B5AD7B
    %AICMD0x3E_SetCarryItem($09)                               ;B5AD7D
    %AICMD0x13_Wait(40)                                        ;B5AD7F
    %AICMD0x3F_ThrowCarriedItem()                              ;B5AD82
    %AICMD0x13_Wait(20)                                        ;B5AD83
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 28)                  ;B5AD86
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B5AD8A
    %AICMD0x56_UseEquippedItem()                               ;B5AD8C
    %AICMD0x13_Wait(60)                                        ;B5AD8D
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 40)                   ;B5AD90
    %AICMD0x56_UseEquippedItem()                               ;B5AD94
    %AICMD0x13_Wait(60)                                        ;B5AD95
    %AICMD0x56_UseEquippedItem()                               ;B5AD98
    %AICMD0x13_Wait(60)                                        ;B5AD99
    %AICMD0x56_UseEquippedItem()                               ;B5AD9C
    %AICMD0x13_Wait(60)                                        ;B5AD9D
    %AICMD0x56_UseEquippedItem()                               ;B5ADA0
    %AICMD0x13_Wait(60)                                        ;B5ADA1
    %AICMD0x56_UseEquippedItem()                               ;B5ADA4
    %AICMD0x13_Wait(60)                                        ;B5ADA5
    %AICMD0x56_UseEquippedItem()                               ;B5ADA8
    %AICMD0x13_Wait(60)                                        ;B5ADA9
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 4)                   ;B5ADAC
    %AICMD0x3E_SetCarryItem($09)                               ;B5ADB0
    %AICMD0x13_Wait(40)                                        ;B5ADB2
    %AICMD0x3F_ThrowCarriedItem()                              ;B5ADB5
    %AICMD0x13_Wait(20)                                        ;B5ADB6
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 14)                  ;B5ADB9
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B5ADBD
    %AICMD0x3E_SetCarryItem($09)                               ;B5ADBF
    %AICMD0x13_Wait(40)                                        ;B5ADC1
    %AICMD0x3F_ThrowCarriedItem()                              ;B5ADC4
    %AICMD0x13_Wait(20)                                        ;B5ADC5
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 16)                  ;B5ADC8
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B5ADCC
    %AICMD0x3E_SetCarryItem($0D)                               ;B5ADCE
    %AICMD0x13_Wait(40)                                        ;B5ADD0
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 16)                  ;B5ADD3
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 16)                    ;B5ADD7
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 60)                  ;B5ADDB
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 16)                    ;B5ADDF
    %AICMD0x3F_ThrowCarriedItem()                              ;B5ADE3
    %AICMD0x13_Wait(20)                                        ;B5ADE4
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 16)                  ;B5ADE7
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 52)                   ;B5ADEB
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B5ADEF
    %AICMD0x59_SwapEquippedItems()                             ;B5ADF1
    %AICMD0x13_Wait(60)                                        ;B5ADF2
    %AICMD0x56_UseEquippedItem()                               ;B5ADF5
    %AICMD0x13_Wait(60)                                        ;B5ADF6
    %AICMD0x56_UseEquippedItem()                               ;B5ADF9
    %AICMD0x13_Wait(60)                                        ;B5ADFA
    %AICMD0x56_UseEquippedItem()                               ;B5ADFD
    %AICMD0x13_Wait(60)                                        ;B5ADFE
    %AICMD0x56_UseEquippedItem()                               ;B5AE01
    %AICMD0x13_Wait(60)                                        ;B5AE02
    %AICMD0x56_UseEquippedItem()                               ;B5AE05
    %AICMD0x13_Wait(60)                                        ;B5AE06
    %AICMD0x56_UseEquippedItem()                               ;B5AE09
    %AICMD0x13_Wait(60)                                        ;B5AE0A
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 32)                  ;B5AE0D
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 30)                 ;B5AE11
    %AICMD0x3E_SetCarryItem($09)                               ;B5AE15
    %AICMD0x13_Wait(40)                                        ;B5AE17
    %AICMD0x3F_ThrowCarriedItem()                              ;B5AE1A
    %AICMD0x13_Wait(20)                                        ;B5AE1B
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 16)                 ;B5AE1E
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 40)                     ;B5AE22
    %AICMD0x3E_SetCarryItem($0F)                               ;B5AE26
    %AICMD0x13_Wait(40)                                        ;B5AE28
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 16)                   ;B5AE2B
    %AICMD0x3F_ThrowCarriedItem()                              ;B5AE2F
    %AICMD0x13_Wait(20)                                        ;B5AE30
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 32)                     ;B5AE33
    %AICMD0x3E_SetCarryItem($09)                               ;B5AE37
    %AICMD0x13_Wait(40)                                        ;B5AE39
    %AICMD0x3F_ThrowCarriedItem()                              ;B5AE3C
    %AICMD0x13_Wait(40)                                        ;B5AE3D
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B5AE40
    %AICMD0x3E_SetCarryItem($0F)                               ;B5AE42
    %AICMD0x13_Wait(40)                                        ;B5AE44
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 24)                   ;B5AE47
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 15)                  ;B5AE4B
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B5AE4F
    %AICMD0x3F_ThrowCarriedItem()                              ;B5AE51
    %AICMD0x13_Wait(20)                                        ;B5AE52
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 15)                  ;B5AE55
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 16)                     ;B5AE59
    %AICMD0x3E_SetCarryItem($0F)                               ;B5AE5D
    %AICMD0x13_Wait(40)                                        ;B5AE5F
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 16)                   ;B5AE62
    %AICMD0x3F_ThrowCarriedItem()                              ;B5AE66
    %AICMD0x13_Wait(20)                                        ;B5AE67
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 15)                  ;B5AE6A
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 16)                     ;B5AE6E
    %AICMD0x3E_SetCarryItem($0F)                               ;B5AE72
    %AICMD0x13_Wait(40)                                        ;B5AE74
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 16)                   ;B5AE77
    %AICMD0x3F_ThrowCarriedItem()                              ;B5AE7B
    %AICMD0x13_Wait(20)                                        ;B5AE7C
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 15)                  ;B5AE7F
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 16)                     ;B5AE83
    %AICMD0x3E_SetCarryItem($0F)                               ;B5AE87
    %AICMD0x13_Wait(40)                                        ;B5AE89
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 16)                   ;B5AE8C
    %AICMD0x3F_ThrowCarriedItem()                              ;B5AE90
    %AICMD0x13_Wait(20)                                        ;B5AE91
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 15)                  ;B5AE94
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 16)                     ;B5AE98
    %AICMD0x3E_SetCarryItem($0F)                               ;B5AE9C
    %AICMD0x13_Wait(40)                                        ;B5AE9E
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 16)                   ;B5AEA1
    %AICMD0x3F_ThrowCarriedItem()                              ;B5AEA5
    %AICMD0x13_Wait(20)                                        ;B5AEA6
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 15)                  ;B5AEA9
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 16)                    ;B5AEAD
    %AICMD0x3E_SetCarryItem($09)                               ;B5AEB1
    %AICMD0x13_Wait(40)                                        ;B5AEB3
    %AICMD0x3F_ThrowCarriedItem()                              ;B5AEB6
    %AICMD0x13_Wait(20)                                        ;B5AEB7
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 16)                    ;B5AEBA
    %AICMD0x3E_SetCarryItem($0F)                               ;B5AEBE
    %AICMD0x13_Wait(40)                                        ;B5AEC0
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 16)                   ;B5AEC3
    %AICMD0x3F_ThrowCarriedItem()                              ;B5AEC7
    %AICMD0x13_Wait(20)                                        ;B5AEC8
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 15)                  ;B5AECB
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 16)                    ;B5AECF
    %AICMD0x3E_SetCarryItem($09)                               ;B5AED3
    %AICMD0x13_Wait(40)                                        ;B5AED5
    %AICMD0x3F_ThrowCarriedItem()                              ;B5AED8
    %AICMD0x13_Wait(20)                                        ;B5AED9
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 16)                    ;B5AEDC
    %AICMD0x3E_SetCarryItem($0F)                               ;B5AEE0
    %AICMD0x13_Wait(40)                                        ;B5AEE2
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 16)                   ;B5AEE5
    %AICMD0x3F_ThrowCarriedItem()                              ;B5AEE9
    %AICMD0x13_Wait(20)                                        ;B5AEEA
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 15)                  ;B5AEED
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 16)                    ;B5AEF1
    %AICMD0x3E_SetCarryItem($09)                               ;B5AEF5
    %AICMD0x13_Wait(40)                                        ;B5AEF7
    %AICMD0x3F_ThrowCarriedItem()                              ;B5AEFA
    %AICMD0x13_Wait(20)                                        ;B5AEFB
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 16)                    ;B5AEFE
    %AICMD0x3E_SetCarryItem($0F)                               ;B5AF02
    %AICMD0x13_Wait(40)                                        ;B5AF04
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 16)                   ;B5AF07
    %AICMD0x3F_ThrowCarriedItem()                              ;B5AF0B
    %AICMD0x13_Wait(20)                                        ;B5AF0C
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 15)                  ;B5AF0F
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B5AF13
    %AICMD0x3E_SetCarryItem($09)                               ;B5AF15
    %AICMD0x13_Wait(40)                                        ;B5AF17
    %AICMD0x3F_ThrowCarriedItem()                              ;B5AF1A
    %AICMD0x13_Wait(20)                                        ;B5AF1B
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 16)                     ;B5AF1E
    %AICMD0x3E_SetCarryItem($0F)                               ;B5AF22
    %AICMD0x13_Wait(40)                                        ;B5AF24
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 16)                   ;B5AF27
    %AICMD0x3F_ThrowCarriedItem()                              ;B5AF2B
    %AICMD0x13_Wait(20)                                        ;B5AF2C
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 48)                     ;B5AF2F
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B5AF33
    %AICMD0x56_UseEquippedItem()                               ;B5AF35
    %AICMD0x13_Wait(60)                                        ;B5AF36
    %AICMD0x56_UseEquippedItem()                               ;B5AF39
    %AICMD0x13_Wait(60)                                        ;B5AF3A
    %AICMD0x56_UseEquippedItem()                               ;B5AF3D
    %AICMD0x13_Wait(60)                                        ;B5AF3E
    %AICMD0x56_UseEquippedItem()                               ;B5AF41
    %AICMD0x13_Wait(60)                                        ;B5AF42
    %AICMD0x56_UseEquippedItem()                               ;B5AF45
    %AICMD0x13_Wait(60)                                        ;B5AF46
    %AICMD0x56_UseEquippedItem()                               ;B5AF49
    %AICMD0x13_Wait(60)                                        ;B5AF4A
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 16)                    ;B5AF4D
    %AICMD0x3E_SetCarryItem($09)                               ;B5AF51
    %AICMD0x13_Wait(40)                                        ;B5AF53
    %AICMD0x3F_ThrowCarriedItem()                              ;B5AF56
    %AICMD0x13_Wait(20)                                        ;B5AF57
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 16)                    ;B5AF5A
    %AICMD0x3E_SetCarryItem($09)                               ;B5AF5E
    %AICMD0x13_Wait(40)                                        ;B5AF60
    %AICMD0x3F_ThrowCarriedItem()                              ;B5AF63
    %AICMD0x13_Wait(20)                                        ;B5AF64
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 32)                     ;B5AF67
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 52)                   ;B5AF6B
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 48)                     ;B5AF6F
    %AICMD0x3E_SetCarryItem($57)                               ;B5AF73
    %AICMD0x13_Wait(40)                                        ;B5AF75
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 48)                   ;B5AF78
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 52)                  ;B5AF7C
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 78)                   ;B5AF80
    %AICMD0x3F_ThrowCarriedItem()                              ;B5AF84
    %AICMD0x13_Wait(20)                                        ;B5AF85
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 78)                     ;B5AF88
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 52)                   ;B5AF8C
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 48)                     ;B5AF90
    %AICMD0x3E_SetCarryItem($57)                               ;B5AF94
    %AICMD0x13_Wait(40)                                        ;B5AF96
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 48)                   ;B5AF99
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 52)                  ;B5AF9D
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 70)                   ;B5AFA1
    %AICMD0x3F_ThrowCarriedItem()                              ;B5AFA5
    %AICMD0x13_Wait(20)                                        ;B5AFA6
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 70)                     ;B5AFA9
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 52)                   ;B5AFAD
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 48)                     ;B5AFB1
    %AICMD0x3E_SetCarryItem($57)                               ;B5AFB5
    %AICMD0x13_Wait(40)                                        ;B5AFB7
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 48)                   ;B5AFBA
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 52)                  ;B5AFBE
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 62)                   ;B5AFC2
    %AICMD0x3F_ThrowCarriedItem()                              ;B5AFC6
    %AICMD0x13_Wait(20)                                        ;B5AFC7
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 62)                     ;B5AFCA
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 52)                   ;B5AFCE
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 48)                     ;B5AFD2
    %AICMD0x3E_SetCarryItem($57)                               ;B5AFD6
    %AICMD0x13_Wait(40)                                        ;B5AFD8
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 48)                   ;B5AFDB
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 52)                  ;B5AFDF
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 54)                   ;B5AFE3
    %AICMD0x3F_ThrowCarriedItem()                              ;B5AFE7
    %AICMD0x13_Wait(20)                                        ;B5AFE8
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 48)                  ;B5AFEB
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 8)                     ;B5AFEF
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $07)       ;B5AFF3
    %AICMD0x10_End()                                           ;B5AFF8


pAIScripting0x47_HowToPlay_Data04:
 
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $06)       ;B5AFF9
    %AICMD0x00_SetMusic($01, $B4)                              ;B5AFFE
    %AICMD0x02_FreezeTime()                                    ;B5B001
    %AICMD0x03_SetHour($07)                                    ;B5B002
    %AICMD0x05_SetTransferPosition(128, 200)                   ;B5B004
    %AICMD0x08_EnableAIControl()                               ;B5B009
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B5B00A
    %AICMD0x47_SetValue8(nCurrentSeasonID, 0)                  ;B5B00C
    %AICMD0x06_SetDestinationArea(!AREA_SHED)                  ;B5B011
    %AICMD0x38_WaitForFadeIn()                                               ;B5B013
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 64)                    ;B5B014
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 24)                  ;B5B018
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 8)                     ;B5B01C
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B5B020
    %AICMD0x3E_SetCarryItem($35)                               ;B5B022
    %AICMD0x13_Wait(60)                                        ;B5B024
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 24)                 ;B5B027
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 53)                  ;B5B02B
    %AICMD0x59_SwapEquippedItems()                             ;B5B02F
    %AICMD0x13_Wait(60)                                        ;B5B030
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 40)                 ;B5B033
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 8)                     ;B5B037
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B5B03B
    %AICMD0x3E_SetCarryItem($2B)                               ;B5B03D
    %AICMD0x13_Wait(60)                                        ;B5B03F
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 40)                  ;B5B042
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 32)                  ;B5B046
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $07)       ;B5B04A
    %AICMD0x10_End()                                           ;B5B04F


pAIScripting0x47_HowToPlay_Data05:
 
    %AICMD0x58_ReplaceFarmTile($02, 448, 528)                  ;B5B050
    %AICMD0x58_ReplaceFarmTile($02, 464, 528)                  ;B5B056
    %AICMD0x58_ReplaceFarmTile($02, 464, 512)                  ;B5B05C
    %AICMD0x58_ReplaceFarmTile($02, 464, 544)                  ;B5B062
    %AICMD0x58_ReplaceFarmTile($02, 480, 560)                  ;B5B068
    %AICMD0x58_ReplaceFarmTile($02, 368, 576)                  ;B5B06E
    %AICMD0x58_ReplaceFarmTile($02, 384, 576)                  ;B5B074
    %AICMD0x58_ReplaceFarmTile($02, 368, 592)                  ;B5B07A
    %AICMD0x58_ReplaceFarmTile($02, 352, 544)                  ;B5B080
    %AICMD0x58_ReplaceFarmTile($02, 368, 544)                  ;B5B086
    %AICMD0x58_ReplaceFarmTile($02, 352, 560)                  ;B5B08C
    %AICMD0x58_ReplaceFarmTile($02, 368, 560)                  ;B5B092
    %AICMD0x58_ReplaceFarmTile($02, 416, 576)                  ;B5B098
    %AICMD0x58_ReplaceFarmTile($02, 432, 576)                  ;B5B09E
    %AICMD0x58_ReplaceFarmTile($02, 416, 592)                  ;B5B0A4
    %AICMD0x58_ReplaceFarmTile($02, 432, 592)                  ;B5B0AA
    %AICMD0x58_ReplaceFarmTile($02, 464, 496)                  ;B5B0B0
    %AICMD0x58_ReplaceFarmTile($02, 448, 496)                  ;B5B0B6
    %AICMD0x58_ReplaceFarmTile($02, 432, 496)                  ;B5B0BC
    %AICMD0x58_ReplaceFarmTile($02, 416, 496)                  ;B5B0C2
    %AICMD0x58_ReplaceFarmTile($02, 400, 496)                  ;B5B0C8
    %AICMD0x58_ReplaceFarmTile($02, 384, 496)                  ;B5B0CE
    %AICMD0x58_ReplaceFarmTile($02, 368, 496)                  ;B5B0D4
    %AICMD0x58_ReplaceFarmTile($02, 352, 496)                  ;B5B0DA
    %AICMD0x58_ReplaceFarmTile($02, 336, 496)                  ;B5B0E0
    %AICMD0x58_ReplaceFarmTile($02, 320, 496)                  ;B5B0E6
    %AICMD0x58_ReplaceFarmTile($05, 464, 560)                  ;B5B0EC
    %AICMD0x58_ReplaceFarmTile($05, 448, 560)                  ;B5B0F2
    %AICMD0x58_ReplaceFarmTile($05, 432, 560)                  ;B5B0F8
    %AICMD0x58_ReplaceFarmTile($05, 416, 560)                  ;B5B0FE
    %AICMD0x58_ReplaceFarmTile($05, 400, 560)                  ;B5B104
    %AICMD0x58_ReplaceFarmTile($05, 384, 560)                  ;B5B10A
    %AICMD0x58_ReplaceFarmTile($05, 368, 560)                  ;B5B110
    %AICMD0x58_ReplaceFarmTile($05, 352, 560)                  ;B5B116
    %AICMD0x58_ReplaceFarmTile($05, 336, 560)                  ;B5B11C
    %AICMD0x58_ReplaceFarmTile($05, 320, 560)                  ;B5B122
    %AICMD0x58_ReplaceFarmTile($05, 320, 544)                  ;B5B128
    %AICMD0x58_ReplaceFarmTile($05, 320, 528)                  ;B5B12E
    %AICMD0x58_ReplaceFarmTile($05, 320, 512)                  ;B5B134
    %AICMD0x58_ReplaceFarmTile($05, 320, 496)                  ;B5B13A
    %AICMD0x58_ReplaceFarmTile($02, 336, 512)                  ;B5B140
    %AICMD0x58_ReplaceFarmTile($02, 352, 512)                  ;B5B146
    %AICMD0x58_ReplaceFarmTile($02, 368, 512)                  ;B5B14C
    %AICMD0x58_ReplaceFarmTile($02, 320, 416)                  ;B5B152
    %AICMD0x58_ReplaceFarmTile($02, 320, 432)                  ;B5B158
    %AICMD0x58_ReplaceFarmTile($02, 288, 448)                  ;B5B15E
    %AICMD0x58_ReplaceFarmTile($02, 304, 448)                  ;B5B164
    %AICMD0x58_ReplaceFarmTile($02, 288, 464)                  ;B5B16A
    %AICMD0x58_ReplaceFarmTile($02, 304, 464)                  ;B5B170
    %AICMD0x47_SetValue8(wram80(strcPlayerData.toolEquipped), 2)                           ;B5B176
    %AICMD0x47_SetValue8(wram80(strcPlayerData.toolSecond), 12)                          ;B5B17B
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $06)       ;B5B180
    %AICMD0x00_SetMusic($01, $B4)                              ;B5B185
    %AICMD0x02_FreezeTime()                                    ;B5B188
    %AICMD0x03_SetHour($07)                                    ;B5B189
    %AICMD0x05_SetTransferPosition(424, 488)                   ;B5B18B
    %AICMD0x08_EnableAIControl()                               ;B5B190
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B5B191
    %AICMD0x47_SetValue8(nCurrentSeasonID, 0)                  ;B5B193
    %AICMD0x06_SetDestinationArea(!AREA_FARMSPRING)            ;B5B198
    %AICMD0x38_WaitForFadeIn()                                               ;B5B19A
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 15)                  ;B5B19B
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 15)                  ;B5B19F
    %AICMD0x56_UseEquippedItem()                               ;B5B1A3
    %AICMD0x13_Wait(60)                                        ;B5B1A4
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 15)                  ;B5B1A7
    %AICMD0x56_UseEquippedItem()                               ;B5B1AB
    %AICMD0x13_Wait(60)                                        ;B5B1AC
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 15)                  ;B5B1AF
    %AICMD0x56_UseEquippedItem()                               ;B5B1B3
    %AICMD0x13_Wait(60)                                        ;B5B1B4
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 15)                  ;B5B1B7
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B5B1BB
    %AICMD0x56_UseEquippedItem()                               ;B5B1BD
    %AICMD0x13_Wait(60)                                        ;B5B1BE
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 15)                  ;B5B1C1
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B5B1C5
    %AICMD0x56_UseEquippedItem()                               ;B5B1C7
    %AICMD0x13_Wait(60)                                        ;B5B1C8
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 15)                 ;B5B1CB
    %AICMD0x56_UseEquippedItem()                               ;B5B1CF
    %AICMD0x13_Wait(60)                                        ;B5B1D0
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 15)                 ;B5B1D3
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B5B1D7
    %AICMD0x56_UseEquippedItem()                               ;B5B1D9
    %AICMD0x13_Wait(60)                                        ;B5B1DA
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 15)                  ;B5B1DD
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B5B1E1
    %AICMD0x56_UseEquippedItem()                               ;B5B1E3
    %AICMD0x13_Wait(60)                                        ;B5B1E4
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 15)                  ;B5B1E7
    %AICMD0x56_UseEquippedItem()                               ;B5B1EB
    %AICMD0x13_Wait(60)                                        ;B5B1EC
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 15)                  ;B5B1EF
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 15)                     ;B5B1F3
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B5B1F7
    %AICMD0x56_UseEquippedItem()                               ;B5B1F9
    %AICMD0x13_Wait(60)                                        ;B5B1FA
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 15)                 ;B5B1FD
    %AICMD0x56_UseEquippedItem()                               ;B5B201
    %AICMD0x13_Wait(60)                                        ;B5B202
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 15)                 ;B5B205
    %AICMD0x56_UseEquippedItem()                               ;B5B209
    %AICMD0x13_Wait(60)                                        ;B5B20A
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 15)                 ;B5B20D
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B5B211
    %AICMD0x56_UseEquippedItem()                               ;B5B213
    %AICMD0x13_Wait(60)                                        ;B5B214
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 15)                  ;B5B217
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B5B21B
    %AICMD0x56_UseEquippedItem()                               ;B5B21D
    %AICMD0x13_Wait(60)                                        ;B5B21E
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 15)                  ;B5B221
    %AICMD0x56_UseEquippedItem()                               ;B5B225
    %AICMD0x13_Wait(60)                                        ;B5B226
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 15)                  ;B5B229
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B5B22D
    %AICMD0x56_UseEquippedItem()                               ;B5B22F
    %AICMD0x13_Wait(60)                                        ;B5B230
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 15)                  ;B5B233
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B5B237
    %AICMD0x56_UseEquippedItem()                               ;B5B239
    %AICMD0x13_Wait(60)                                        ;B5B23A
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 15)                 ;B5B23D
    %AICMD0x56_UseEquippedItem()                               ;B5B241
    %AICMD0x13_Wait(60)                                        ;B5B242
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 15)                    ;B5B245
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B5B249
    %AICMD0x59_SwapEquippedItems()                             ;B5B24B
    %AICMD0x13_Wait(60)                                        ;B5B24C
    %AICMD0x56_UseEquippedItem()                               ;B5B24F
    %AICMD0x13_Wait(120)                                       ;B5B250
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 15)                  ;B5B253
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 40)                    ;B5B257
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $07)       ;B5B25B
    %AICMD0x10_End()                                           ;B5B260


pAIScripting0x47_HowToPlay_Data06:
 
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $06)       ;B5B261
    %AICMD0x00_SetMusic($01, $B4)                              ;B5B266
    %AICMD0x02_FreezeTime()                                    ;B5B269
    %AICMD0x03_SetHour($07)                                    ;B5B26A
    %AICMD0x05_SetTransferPosition(128, 200)                   ;B5B26C
    %AICMD0x08_EnableAIControl()                               ;B5B271
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B5B272
    %AICMD0x47_SetValue8(nCurrentSeasonID, 0)                  ;B5B274
    %AICMD0x06_SetDestinationArea(!AREA_SHED)                  ;B5B279
    %AICMD0x38_WaitForFadeIn()                                               ;B5B27B
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 64)                    ;B5B27C
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 72)                 ;B5B280
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 8)                     ;B5B284
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B5B288
    %AICMD0x3E_SetCarryItem($31)                               ;B5B28A
    %AICMD0x13_Wait(60)                                        ;B5B28C
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 72)                  ;B5B28F
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 53)                  ;B5B293
    %AICMD0x59_SwapEquippedItems()                             ;B5B297
    %AICMD0x13_Wait(60)                                        ;B5B298
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 24)                  ;B5B29B
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 8)                     ;B5B29F
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B5B2A3
    %AICMD0x3E_SetCarryItem($39)                               ;B5B2A5
    %AICMD0x13_Wait(60)                                        ;B5B2A7
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 24)                 ;B5B2AA
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 32)                  ;B5B2AE
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $07)       ;B5B2B2
    %AICMD0x10_End()                                           ;B5B2B7


pAIScripting0x47_HowToPlay_Data07:
 
    %AICMD0x58_ReplaceFarmTile($02, 448, 528)                  ;B5B2B8
    %AICMD0x58_ReplaceFarmTile($02, 464, 528)                  ;B5B2BE
    %AICMD0x58_ReplaceFarmTile($02, 464, 512)                  ;B5B2C4
    %AICMD0x58_ReplaceFarmTile($02, 464, 544)                  ;B5B2CA
    %AICMD0x58_ReplaceFarmTile($02, 480, 560)                  ;B5B2D0
    %AICMD0x58_ReplaceFarmTile($02, 368, 576)                  ;B5B2D6
    %AICMD0x58_ReplaceFarmTile($02, 384, 576)                  ;B5B2DC
    %AICMD0x58_ReplaceFarmTile($02, 368, 592)                  ;B5B2E2
    %AICMD0x58_ReplaceFarmTile($02, 352, 544)                  ;B5B2E8
    %AICMD0x58_ReplaceFarmTile($02, 368, 544)                  ;B5B2EE
    %AICMD0x58_ReplaceFarmTile($02, 352, 560)                  ;B5B2F4
    %AICMD0x58_ReplaceFarmTile($02, 368, 560)                  ;B5B2FA
    %AICMD0x58_ReplaceFarmTile($02, 416, 576)                  ;B5B300
    %AICMD0x58_ReplaceFarmTile($02, 432, 576)                  ;B5B306
    %AICMD0x58_ReplaceFarmTile($02, 416, 592)                  ;B5B30C
    %AICMD0x58_ReplaceFarmTile($02, 432, 592)                  ;B5B312
    %AICMD0x58_ReplaceFarmTile($02, 464, 496)                  ;B5B318
    %AICMD0x58_ReplaceFarmTile($02, 448, 496)                  ;B5B31E
    %AICMD0x58_ReplaceFarmTile($02, 432, 496)                  ;B5B324
    %AICMD0x58_ReplaceFarmTile($02, 416, 496)                  ;B5B32A
    %AICMD0x58_ReplaceFarmTile($02, 400, 496)                  ;B5B330
    %AICMD0x58_ReplaceFarmTile($02, 384, 496)                  ;B5B336
    %AICMD0x58_ReplaceFarmTile($02, 368, 496)                  ;B5B33C
    %AICMD0x58_ReplaceFarmTile($02, 352, 496)                  ;B5B342
    %AICMD0x58_ReplaceFarmTile($02, 336, 496)                  ;B5B348
    %AICMD0x58_ReplaceFarmTile($02, 320, 496)                  ;B5B34E
    %AICMD0x58_ReplaceFarmTile($05, 464, 560)                  ;B5B354
    %AICMD0x58_ReplaceFarmTile($05, 448, 560)                  ;B5B35A
    %AICMD0x58_ReplaceFarmTile($05, 432, 560)                  ;B5B360
    %AICMD0x58_ReplaceFarmTile($05, 416, 560)                  ;B5B366
    %AICMD0x58_ReplaceFarmTile($05, 400, 560)                  ;B5B36C
    %AICMD0x58_ReplaceFarmTile($05, 384, 560)                  ;B5B372
    %AICMD0x58_ReplaceFarmTile($05, 368, 560)                  ;B5B378
    %AICMD0x58_ReplaceFarmTile($05, 352, 560)                  ;B5B37E
    %AICMD0x58_ReplaceFarmTile($05, 336, 560)                  ;B5B384
    %AICMD0x58_ReplaceFarmTile($05, 320, 560)                  ;B5B38A
    %AICMD0x58_ReplaceFarmTile($05, 320, 544)                  ;B5B390
    %AICMD0x58_ReplaceFarmTile($05, 320, 528)                  ;B5B396
    %AICMD0x58_ReplaceFarmTile($05, 320, 512)                  ;B5B39C
    %AICMD0x58_ReplaceFarmTile($05, 320, 496)                  ;B5B3A2
    %AICMD0x58_ReplaceFarmTile($02, 336, 512)                  ;B5B3A8
    %AICMD0x58_ReplaceFarmTile($02, 352, 512)                  ;B5B3AE
    %AICMD0x58_ReplaceFarmTile($02, 368, 512)                  ;B5B3B4
    %AICMD0x58_ReplaceFarmTile($02, 320, 416)                  ;B5B3BA
    %AICMD0x58_ReplaceFarmTile($02, 320, 432)                  ;B5B3C0
    %AICMD0x58_ReplaceFarmTile($02, 288, 448)                  ;B5B3C6
    %AICMD0x58_ReplaceFarmTile($02, 304, 448)                  ;B5B3CC
    %AICMD0x58_ReplaceFarmTile($02, 288, 464)                  ;B5B3D2
    %AICMD0x58_ReplaceFarmTile($02, 304, 464)                  ;B5B3D8
    %AICMD0x58_ReplaceFarmTile($07, 352, 496)                  ;B5B3DE
    %AICMD0x58_ReplaceFarmTile($07, 368, 496)                  ;B5B3E4
    %AICMD0x58_ReplaceFarmTile($07, 384, 496)                  ;B5B3EA
    %AICMD0x58_ReplaceFarmTile($07, 352, 512)                  ;B5B3F0
    %AICMD0x58_ReplaceFarmTile($07, 368, 512)                  ;B5B3F6
    %AICMD0x58_ReplaceFarmTile($07, 384, 512)                  ;B5B3FC
    %AICMD0x58_ReplaceFarmTile($07, 352, 528)                  ;B5B402
    %AICMD0x58_ReplaceFarmTile($07, 368, 528)                  ;B5B408
    %AICMD0x58_ReplaceFarmTile($07, 384, 528)                  ;B5B40E
    %AICMD0x58_ReplaceFarmTile($70, 416, 496)                  ;B5B414
    %AICMD0x58_ReplaceFarmTile($70, 432, 496)                  ;B5B41A
    %AICMD0x58_ReplaceFarmTile($70, 448, 496)                  ;B5B420
    %AICMD0x58_ReplaceFarmTile($70, 416, 512)                  ;B5B426
    %AICMD0x58_ReplaceFarmTile($70, 432, 512)                  ;B5B42C
    %AICMD0x58_ReplaceFarmTile($70, 448, 512)                  ;B5B432
    %AICMD0x58_ReplaceFarmTile($70, 416, 528)                  ;B5B438
    %AICMD0x58_ReplaceFarmTile($70, 432, 528)                  ;B5B43E
    %AICMD0x58_ReplaceFarmTile($70, 448, 528)                  ;B5B444
    %AICMD0x47_SetValue8(wram80(strcPlayerData.toolEquipped), 8)                           ;B5B44A
    %AICMD0x47_SetValue8(wram80(strcPlayerData.toolSecond), 16)                          ;B5B44F
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $06)       ;B5B454
    %AICMD0x00_SetMusic($01, $B4)                              ;B5B459
    %AICMD0x02_FreezeTime()                                    ;B5B45C
    %AICMD0x03_SetHour($07)                                    ;B5B45D
    %AICMD0x05_SetTransferPosition(424, 488)                   ;B5B45F
    %AICMD0x08_EnableAIControl()                               ;B5B464
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B5B465
    %AICMD0x47_SetValue8(nCurrentSeasonID, 0)                  ;B5B467
    %AICMD0x06_SetDestinationArea(!AREA_FARMSPRING)            ;B5B46C
    %AICMD0x38_WaitForFadeIn()                                               ;B5B46E
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 31)                  ;B5B46F
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 47)                  ;B5B473
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B5B477
    %AICMD0x56_UseEquippedItem()                               ;B5B479
    %AICMD0x13_Wait(120)                                       ;B5B47A
    %AICMD0x59_SwapEquippedItems()                             ;B5B47D
    %AICMD0x13_Wait(60)                                        ;B5B47E
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 17)                   ;B5B481
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 76)                  ;B5B485
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 31)                    ;B5B489
    %AICMD0x56_UseEquippedItem()                               ;B5B48D
    %AICMD0x13_Wait(80)                                        ;B5B48E
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 31)                  ;B5B491
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 60)                   ;B5B495
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 2)                      ;B5B499
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 15)                    ;B5B49D
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B5B4A1
    %AICMD0x56_UseEquippedItem()                               ;B5B4A3
    %AICMD0x13_Wait(80)                                        ;B5B4A4
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 15)                  ;B5B4A7
    %AICMD0x56_UseEquippedItem()                               ;B5B4AB
    %AICMD0x13_Wait(80)                                        ;B5B4AC
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 15)                  ;B5B4AF
    %AICMD0x56_UseEquippedItem()                               ;B5B4B3
    %AICMD0x13_Wait(80)                                        ;B5B4B4
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 15)                  ;B5B4B7
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B5B4BB
    %AICMD0x56_UseEquippedItem()                               ;B5B4BD
    %AICMD0x13_Wait(80)                                        ;B5B4BE
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 15)                    ;B5B4C1
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B5B4C5
    %AICMD0x56_UseEquippedItem()                               ;B5B4C7
    %AICMD0x13_Wait(80)                                        ;B5B4C8
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 15)                 ;B5B4CB
    %AICMD0x56_UseEquippedItem()                               ;B5B4CF
    %AICMD0x13_Wait(80)                                        ;B5B4D0
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 15)                 ;B5B4D3
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B5B4D7
    %AICMD0x56_UseEquippedItem()                               ;B5B4D9
    %AICMD0x13_Wait(80)                                        ;B5B4DA
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 15)                    ;B5B4DD
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B5B4E1
    %AICMD0x56_UseEquippedItem()                               ;B5B4E3
    %AICMD0x13_Wait(80)                                        ;B5B4E4
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 15)                  ;B5B4E7
    %AICMD0x56_UseEquippedItem()                               ;B5B4EB
    %AICMD0x13_Wait(80)                                        ;B5B4EC
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 63)                     ;B5B4EF
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 120)                  ;B5B4F3
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 40)                    ;B5B4F7
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $07)       ;B5B4FB
    %AICMD0x10_End()                                           ;B5B500


pAIScripting0x47_HowToPlay_Data08:
 
    %AICMD0x58_ReplaceFarmTile($02, 448, 528)                  ;B5B501
    %AICMD0x58_ReplaceFarmTile($02, 464, 528)                  ;B5B507
    %AICMD0x58_ReplaceFarmTile($02, 464, 512)                  ;B5B50D
    %AICMD0x58_ReplaceFarmTile($02, 464, 544)                  ;B5B513
    %AICMD0x58_ReplaceFarmTile($02, 480, 560)                  ;B5B519
    %AICMD0x58_ReplaceFarmTile($02, 368, 576)                  ;B5B51F
    %AICMD0x58_ReplaceFarmTile($02, 384, 576)                  ;B5B525
    %AICMD0x58_ReplaceFarmTile($02, 368, 592)                  ;B5B52B
    %AICMD0x58_ReplaceFarmTile($02, 352, 544)                  ;B5B531
    %AICMD0x58_ReplaceFarmTile($02, 368, 544)                  ;B5B537
    %AICMD0x58_ReplaceFarmTile($02, 352, 560)                  ;B5B53D
    %AICMD0x58_ReplaceFarmTile($02, 368, 560)                  ;B5B543
    %AICMD0x58_ReplaceFarmTile($02, 416, 576)                  ;B5B549
    %AICMD0x58_ReplaceFarmTile($02, 432, 576)                  ;B5B54F
    %AICMD0x58_ReplaceFarmTile($02, 416, 592)                  ;B5B555
    %AICMD0x58_ReplaceFarmTile($02, 432, 592)                  ;B5B55B
    %AICMD0x58_ReplaceFarmTile($02, 464, 496)                  ;B5B561
    %AICMD0x58_ReplaceFarmTile($02, 448, 496)                  ;B5B567
    %AICMD0x58_ReplaceFarmTile($02, 432, 496)                  ;B5B56D
    %AICMD0x58_ReplaceFarmTile($02, 416, 496)                  ;B5B573
    %AICMD0x58_ReplaceFarmTile($02, 400, 496)                  ;B5B579
    %AICMD0x58_ReplaceFarmTile($02, 384, 496)                  ;B5B57F
    %AICMD0x58_ReplaceFarmTile($02, 368, 496)                  ;B5B585
    %AICMD0x58_ReplaceFarmTile($02, 352, 496)                  ;B5B58B
    %AICMD0x58_ReplaceFarmTile($02, 336, 496)                  ;B5B591
    %AICMD0x58_ReplaceFarmTile($02, 320, 496)                  ;B5B597
    %AICMD0x58_ReplaceFarmTile($05, 464, 560)                  ;B5B59D
    %AICMD0x58_ReplaceFarmTile($05, 448, 560)                  ;B5B5A3
    %AICMD0x58_ReplaceFarmTile($05, 432, 560)                  ;B5B5A9
    %AICMD0x58_ReplaceFarmTile($05, 416, 560)                  ;B5B5AF
    %AICMD0x58_ReplaceFarmTile($05, 400, 560)                  ;B5B5B5
    %AICMD0x58_ReplaceFarmTile($05, 384, 560)                  ;B5B5BB
    %AICMD0x58_ReplaceFarmTile($05, 368, 560)                  ;B5B5C1
    %AICMD0x58_ReplaceFarmTile($05, 352, 560)                  ;B5B5C7
    %AICMD0x58_ReplaceFarmTile($05, 336, 560)                  ;B5B5CD
    %AICMD0x58_ReplaceFarmTile($05, 320, 560)                  ;B5B5D3
    %AICMD0x58_ReplaceFarmTile($05, 320, 544)                  ;B5B5D9
    %AICMD0x58_ReplaceFarmTile($05, 320, 528)                  ;B5B5DF
    %AICMD0x58_ReplaceFarmTile($05, 320, 512)                  ;B5B5E5
    %AICMD0x58_ReplaceFarmTile($05, 320, 496)                  ;B5B5EB
    %AICMD0x58_ReplaceFarmTile($02, 336, 512)                  ;B5B5F1
    %AICMD0x58_ReplaceFarmTile($02, 352, 512)                  ;B5B5F7
    %AICMD0x58_ReplaceFarmTile($02, 368, 512)                  ;B5B5FD
    %AICMD0x58_ReplaceFarmTile($02, 320, 416)                  ;B5B603
    %AICMD0x58_ReplaceFarmTile($02, 320, 432)                  ;B5B609
    %AICMD0x58_ReplaceFarmTile($02, 288, 448)                  ;B5B60F
    %AICMD0x58_ReplaceFarmTile($02, 304, 448)                  ;B5B615
    %AICMD0x58_ReplaceFarmTile($02, 288, 464)                  ;B5B61B
    %AICMD0x58_ReplaceFarmTile($02, 304, 464)                  ;B5B621
    %AICMD0x58_ReplaceFarmTile($6E, 352, 496)                  ;B5B627
    %AICMD0x58_ReplaceFarmTile($6E, 368, 496)                  ;B5B62D
    %AICMD0x58_ReplaceFarmTile($6E, 384, 496)                  ;B5B633
    %AICMD0x58_ReplaceFarmTile($6E, 352, 512)                  ;B5B639
    %AICMD0x58_ReplaceFarmTile($6A, 368, 512)                  ;B5B63F
    %AICMD0x58_ReplaceFarmTile($6E, 384, 512)                  ;B5B645
    %AICMD0x58_ReplaceFarmTile($6E, 352, 528)                  ;B5B64B
    %AICMD0x58_ReplaceFarmTile($6E, 368, 528)                  ;B5B651
    %AICMD0x58_ReplaceFarmTile($6E, 384, 528)                  ;B5B657
    %AICMD0x58_ReplaceFarmTile($79, 416, 496)                  ;B5B65D
    %AICMD0x58_ReplaceFarmTile($79, 432, 496)                  ;B5B663
    %AICMD0x58_ReplaceFarmTile($79, 448, 496)                  ;B5B669
    %AICMD0x58_ReplaceFarmTile($79, 416, 512)                  ;B5B66F
    %AICMD0x58_ReplaceFarmTile($79, 432, 512)                  ;B5B675
    %AICMD0x58_ReplaceFarmTile($79, 448, 512)                  ;B5B67B
    %AICMD0x58_ReplaceFarmTile($79, 416, 528)                  ;B5B681
    %AICMD0x58_ReplaceFarmTile($79, 432, 528)                  ;B5B687
    %AICMD0x58_ReplaceFarmTile($79, 448, 528)                  ;B5B68D
    %AICMD0x47_SetValue8(wram80(strcPlayerData.toolEquipped), 0)                           ;B5B693
    %AICMD0x47_SetValue8(wram80(strcPlayerData.toolSecond), 0)                           ;B5B698
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $06)       ;B5B69D
    %AICMD0x00_SetMusic($02, $B4)                              ;B5B6A2
    %AICMD0x02_FreezeTime()                                    ;B5B6A5
    %AICMD0x03_SetHour($07)                                    ;B5B6A6
    %AICMD0x05_SetTransferPosition(136, 344)                   ;B5B6A8
    %AICMD0x08_EnableAIControl()                               ;B5B6AD
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B5B6AE
    %AICMD0x09_StartScript($01, pAIScripting0x47_HowToPlay_L001)                                   ;B5B6B0
    %AICMD0x47_SetValue8(nCurrentSeasonID, 1)                  ;B5B6B4
    %AICMD0x06_SetDestinationArea(!AREA_FARMSUMMER)            ;B5B6B9
    %AICMD0x38_WaitForFadeIn()                                               ;B5B6BB
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 32)                  ;B5B6BC
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 23)                  ;B5B6C0
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 39)                   ;B5B6C4
    %AICMD0x3E_SetCarryItem($0D)                               ;B5B6C8
    %AICMD0x13_Wait(40)                                        ;B5B6CA
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 15)                    ;B5B6CD
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 15)                 ;B5B6D1
    %AICMD0x3F_ThrowCarriedItem()                              ;B5B6D5
    %AICMD0x13_Wait(20)                                        ;B5B6D6
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 15)                   ;B5B6D9
    %AICMD0x3E_SetCarryItem($0D)                               ;B5B6DD
    %AICMD0x13_Wait(40)                                        ;B5B6DF
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 15)                    ;B5B6E2
    %AICMD0x3F_ThrowCarriedItem()                              ;B5B6E6
    %AICMD0x13_Wait(20)                                        ;B5B6E7
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 15)                   ;B5B6EA
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 79)                  ;B5B6EE
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B5B6F2
    %AICMD0x3E_SetCarryItem($13)                               ;B5B6F4
    %AICMD0x13_Wait(40)                                        ;B5B6F6
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 87)                   ;B5B6F9
    %AICMD0x3F_ThrowCarriedItem()                              ;B5B6FD
    %AICMD0x13_Wait(60)                                        ;B5B6FE
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 95)                  ;B5B701
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B5B705
    %AICMD0x3E_SetCarryItem($13)                               ;B5B707
    %AICMD0x13_Wait(40)                                        ;B5B709
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 95)                   ;B5B70C
    %AICMD0x3F_ThrowCarriedItem()                              ;B5B710
    %AICMD0x13_Wait(60)                                        ;B5B711
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 103)                 ;B5B714
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B5B718
    %AICMD0x3E_SetCarryItem($13)                               ;B5B71A
    %AICMD0x13_Wait(40)                                        ;B5B71C
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 103)                  ;B5B71F
    %AICMD0x3F_ThrowCarriedItem()                              ;B5B723
    %AICMD0x13_Wait(60)                                        ;B5B724
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 87)                  ;B5B727
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 15)                  ;B5B72B
    %AICMD0x3E_SetCarryItem($13)                               ;B5B72F
    %AICMD0x13_Wait(40)                                        ;B5B731
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 15)                    ;B5B734
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 87)                   ;B5B738
    %AICMD0x3F_ThrowCarriedItem()                              ;B5B73C
    %AICMD0x13_Wait(60)                                        ;B5B73D
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 103)                 ;B5B740
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 15)                  ;B5B744
    %AICMD0x3E_SetCarryItem($13)                               ;B5B748
    %AICMD0x13_Wait(40)                                        ;B5B74A
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 15)                     ;B5B74D
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 7)                    ;B5B751
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 14)                     ;B5B755
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B5B759
    %AICMD0x3F_ThrowCarriedItem()                              ;B5B75B
    %AICMD0x13_Wait(20)                                        ;B5B75C
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 23)                   ;B5B75F
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 7)                   ;B5B763
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 7)                    ;B5B767
    %AICMD0x3E_SetCarryItem($13)                               ;B5B76B
    %AICMD0x13_Wait(40)                                        ;B5B76D
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 7)                      ;B5B770
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 7)                    ;B5B774
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 23)                     ;B5B778
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B5B77C
    %AICMD0x3F_ThrowCarriedItem()                              ;B5B77E
    %AICMD0x13_Wait(20)                                        ;B5B77F
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 23)                   ;B5B782
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 7)                    ;B5B786
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 7)                    ;B5B78A
    %AICMD0x3E_SetCarryItem($13)                               ;B5B78E
    %AICMD0x13_Wait(40)                                        ;B5B790
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 7)                      ;B5B793
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 7)                   ;B5B797
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 23)                     ;B5B79B
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B5B79F
    %AICMD0x3F_ThrowCarriedItem()                              ;B5B7A1
    %AICMD0x13_Wait(20)                                        ;B5B7A2
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 23)                   ;B5B7A5
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 7)                    ;B5B7A9
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 15)                   ;B5B7AD
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B5B7B1
    %AICMD0x3E_SetCarryItem($13)                               ;B5B7B3
    %AICMD0x13_Wait(40)                                        ;B5B7B5
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 15)                     ;B5B7B8
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 7)                   ;B5B7BC
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 23)                     ;B5B7C0
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B5B7C4
    %AICMD0x3F_ThrowCarriedItem()                              ;B5B7C6
    %AICMD0x13_Wait(20)                                        ;B5B7C7
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 15)                   ;B5B7CA
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 23)                  ;B5B7CE
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 16)                    ;B5B7D2
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $07)       ;B5B7D6
    %AICMD0x10_End()                                           ;B5B7DB
pAIScripting0x47_HowToPlay_L001:
    %AICMD0x1A($0168, $01C8, aAIScriptingData_L006, $03)                     ;B5B7DC
    %AICMD0x13_Wait(240)                                       ;B5B7E4
    %AICMD0x13_Wait(240)                                       ;B5B7E7
    %AICMD0x13_Wait(240)                                       ;B5B7EA
    %AICMD0x13_Wait(240)                                       ;B5B7ED
    %AICMD0x13_Wait(240)                                       ;B5B7F0
    %AICMD0x13_Wait(240)                                       ;B5B7F3
    %AICMD0x13_Wait(240)                                       ;B5B7F6
    %AICMD0x1B($0208, $00)                                     ;B5B7F9
    %AICMD0x13_Wait(60)                                        ;B5B7FD
    %AICMD0x1B($0200, $00)                                     ;B5B800
    %AICMD0x13_Wait(80)                                        ;B5B804
    %AICMD0x1B($0208, $00)                                     ;B5B807
    %AICMD0x13_Wait(60)                                        ;B5B80B
    %AICMD0x1B($0200, $00)                                     ;B5B80E
    %AICMD0x13_Wait(80)                                        ;B5B812
    %AICMD0x1B($0208, $00)                                     ;B5B815
    %AICMD0x13_Wait(60)                                        ;B5B819
    %AICMD0x1B($0200, $00)                                     ;B5B81C
    %AICMD0x13_Wait(95)                                        ;B5B820
    %AICMD0x1B($0208, $00)                                     ;B5B823
    %AICMD0x13_Wait(60)                                        ;B5B827
    %AICMD0x1B($0200, $00)                                     ;B5B82A
pAIScripting0x47_HowToPlay_L002:
    %AICMD0x13_Wait(1)                                         ;B5B82E
    %AICMD0x12_Jump(pAIScripting0x47_HowToPlay_L002)                                   ;B5B831


pAIScripting0x47_HowToPlay_Data09:
 
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $06)       ;B5B834
    %AICMD0x00_SetMusic($02, $B4)                              ;B5B839
    %AICMD0x02_FreezeTime()                                    ;B5B83C
    %AICMD0x03_SetHour($07)                                    ;B5B83D
    %AICMD0x05_SetTransferPosition(128, 200)                   ;B5B83F
    %AICMD0x08_EnableAIControl()                               ;B5B844
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B5B845
    %AICMD0x47_SetValue8(nCurrentSeasonID, 1)                  ;B5B847
    %AICMD0x06_SetDestinationArea(!AREA_SHED)                  ;B5B84C
    %AICMD0x38_WaitForFadeIn()                                               ;B5B84E
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 16)                    ;B5B84F
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 40)                 ;B5B853
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 8)                     ;B5B857
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B5B85B
    %AICMD0x3E_SetCarryItem($3B)                               ;B5B85D
    %AICMD0x13_Wait(60)                                        ;B5B85F
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 16)                  ;B5B862
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B5B866
    %AICMD0x3E_SetCarryItem($2A)                               ;B5B868
    %AICMD0x13_Wait(60)                                        ;B5B86A
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 24)                  ;B5B86D
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 32)                  ;B5B871
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $07)       ;B5B875
    %AICMD0x10_End()                                           ;B5B87A


pAIScripting0x47_HowToPlay_Data10:
 
    %AICMD0x58_ReplaceFarmTile($02, 448, 528)                  ;B5B87B
    %AICMD0x58_ReplaceFarmTile($02, 464, 528)                  ;B5B881
    %AICMD0x58_ReplaceFarmTile($02, 464, 512)                  ;B5B887
    %AICMD0x58_ReplaceFarmTile($02, 464, 544)                  ;B5B88D
    %AICMD0x58_ReplaceFarmTile($02, 480, 560)                  ;B5B893
    %AICMD0x58_ReplaceFarmTile($02, 368, 576)                  ;B5B899
    %AICMD0x58_ReplaceFarmTile($02, 384, 576)                  ;B5B89F
    %AICMD0x58_ReplaceFarmTile($02, 368, 592)                  ;B5B8A5
    %AICMD0x58_ReplaceFarmTile($02, 352, 544)                  ;B5B8AB
    %AICMD0x58_ReplaceFarmTile($02, 368, 544)                  ;B5B8B1
    %AICMD0x58_ReplaceFarmTile($02, 352, 560)                  ;B5B8B7
    %AICMD0x58_ReplaceFarmTile($02, 368, 560)                  ;B5B8BD
    %AICMD0x58_ReplaceFarmTile($02, 416, 576)                  ;B5B8C3
    %AICMD0x58_ReplaceFarmTile($02, 432, 576)                  ;B5B8C9
    %AICMD0x58_ReplaceFarmTile($02, 416, 592)                  ;B5B8CF
    %AICMD0x58_ReplaceFarmTile($02, 432, 592)                  ;B5B8D5
    %AICMD0x58_ReplaceFarmTile($02, 464, 496)                  ;B5B8DB
    %AICMD0x58_ReplaceFarmTile($02, 448, 496)                  ;B5B8E1
    %AICMD0x58_ReplaceFarmTile($02, 432, 496)                  ;B5B8E7
    %AICMD0x58_ReplaceFarmTile($02, 416, 496)                  ;B5B8ED
    %AICMD0x58_ReplaceFarmTile($02, 400, 496)                  ;B5B8F3
    %AICMD0x58_ReplaceFarmTile($02, 384, 496)                  ;B5B8F9
    %AICMD0x58_ReplaceFarmTile($02, 368, 496)                  ;B5B8FF
    %AICMD0x58_ReplaceFarmTile($02, 352, 496)                  ;B5B905
    %AICMD0x58_ReplaceFarmTile($02, 336, 496)                  ;B5B90B
    %AICMD0x58_ReplaceFarmTile($02, 320, 496)                  ;B5B911
    %AICMD0x58_ReplaceFarmTile($05, 464, 560)                  ;B5B917
    %AICMD0x58_ReplaceFarmTile($05, 448, 560)                  ;B5B91D
    %AICMD0x58_ReplaceFarmTile($05, 432, 560)                  ;B5B923
    %AICMD0x58_ReplaceFarmTile($05, 416, 560)                  ;B5B929
    %AICMD0x58_ReplaceFarmTile($05, 400, 560)                  ;B5B92F
    %AICMD0x58_ReplaceFarmTile($05, 384, 560)                  ;B5B935
    %AICMD0x58_ReplaceFarmTile($05, 368, 560)                  ;B5B93B
    %AICMD0x58_ReplaceFarmTile($05, 352, 560)                  ;B5B941
    %AICMD0x58_ReplaceFarmTile($05, 336, 560)                  ;B5B947
    %AICMD0x58_ReplaceFarmTile($05, 320, 560)                  ;B5B94D
    %AICMD0x58_ReplaceFarmTile($05, 320, 544)                  ;B5B953
    %AICMD0x58_ReplaceFarmTile($05, 320, 528)                  ;B5B959
    %AICMD0x58_ReplaceFarmTile($05, 320, 512)                  ;B5B95F
    %AICMD0x58_ReplaceFarmTile($05, 320, 496)                  ;B5B965
    %AICMD0x58_ReplaceFarmTile($02, 336, 512)                  ;B5B96B
    %AICMD0x58_ReplaceFarmTile($02, 352, 512)                  ;B5B971
    %AICMD0x58_ReplaceFarmTile($02, 368, 512)                  ;B5B977
    %AICMD0x58_ReplaceFarmTile($02, 320, 416)                  ;B5B97D
    %AICMD0x58_ReplaceFarmTile($02, 320, 432)                  ;B5B983
    %AICMD0x58_ReplaceFarmTile($02, 288, 448)                  ;B5B989
    %AICMD0x58_ReplaceFarmTile($02, 304, 448)                  ;B5B98F
    %AICMD0x58_ReplaceFarmTile($02, 288, 464)                  ;B5B995
    %AICMD0x58_ReplaceFarmTile($02, 304, 464)                  ;B5B99B
    %AICMD0x58_ReplaceFarmTile($07, 352, 496)                  ;B5B9A1
    %AICMD0x58_ReplaceFarmTile($07, 368, 496)                  ;B5B9A7
    %AICMD0x58_ReplaceFarmTile($07, 384, 496)                  ;B5B9AD
    %AICMD0x58_ReplaceFarmTile($07, 352, 512)                  ;B5B9B3
    %AICMD0x58_ReplaceFarmTile($6A, 368, 512)                  ;B5B9B9
    %AICMD0x58_ReplaceFarmTile($07, 384, 512)                  ;B5B9BF
    %AICMD0x58_ReplaceFarmTile($07, 352, 528)                  ;B5B9C5
    %AICMD0x58_ReplaceFarmTile($07, 368, 528)                  ;B5B9CB
    %AICMD0x58_ReplaceFarmTile($07, 384, 528)                  ;B5B9D1
    %AICMD0x58_ReplaceFarmTile($79, 416, 496)                  ;B5B9D7
    %AICMD0x58_ReplaceFarmTile($79, 432, 496)                  ;B5B9DD
    %AICMD0x58_ReplaceFarmTile($79, 448, 496)                  ;B5B9E3
    %AICMD0x58_ReplaceFarmTile($79, 416, 512)                  ;B5B9E9
    %AICMD0x58_ReplaceFarmTile($79, 432, 512)                  ;B5B9EF
    %AICMD0x58_ReplaceFarmTile($79, 448, 512)                  ;B5B9F5
    %AICMD0x58_ReplaceFarmTile($79, 416, 528)                  ;B5B9FB
    %AICMD0x58_ReplaceFarmTile($79, 432, 528)                  ;B5BA01
    %AICMD0x58_ReplaceFarmTile($79, 448, 528)                  ;B5BA07
    %AICMD0x58_ReplaceFarmTile($02, 176, 464)                  ;B5BA0D
    %AICMD0x58_ReplaceFarmTile($02, 192, 480)                  ;B5BA13
    %AICMD0x58_ReplaceFarmTile($04, 192, 432)                  ;B5BA19
    %AICMD0x58_ReplaceFarmTile($04, 208, 432)                  ;B5BA1F
    %AICMD0x47_SetValue8(wram80(strcPlayerData.toolEquipped), 1)                           ;B5BA25
    %AICMD0x47_SetValue8(wram80(strcPlayerData.toolSecond), 18)                          ;B5BA2A
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $06)       ;B5BA2F
    %AICMD0x00_SetMusic($02, $B4)                              ;B5BA34
    %AICMD0x02_FreezeTime()                                    ;B5BA37
    %AICMD0x03_SetHour($07)                                    ;B5BA38
    %AICMD0x05_SetTransferPosition(424, 488)                   ;B5BA3A
    %AICMD0x08_EnableAIControl()                               ;B5BA3F
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B5BA40
    %AICMD0x47_SetValue8(nCurrentSeasonID, 1)                  ;B5BA42
    %AICMD0x06_SetDestinationArea(!AREA_FARMSUMMER)            ;B5BA47
    %AICMD0x38_WaitForFadeIn()                                               ;B5BA49
    %AICMD0x56_UseEquippedItem()                               ;B5BA4A
    %AICMD0x13_Wait(60)                                        ;B5BA4B
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 15)                  ;B5BA4E
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B5BA52
    %AICMD0x56_UseEquippedItem()                               ;B5BA54
    %AICMD0x13_Wait(60)                                        ;B5BA55
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 15)                 ;B5BA58
    %AICMD0x56_UseEquippedItem()                               ;B5BA5C
    %AICMD0x13_Wait(60)                                        ;B5BA5D
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 15)                 ;B5BA60
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B5BA64
    %AICMD0x56_UseEquippedItem()                               ;B5BA66
    %AICMD0x13_Wait(60)                                        ;B5BA67
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 15)                  ;B5BA6A
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B5BA6E
    %AICMD0x56_UseEquippedItem()                               ;B5BA70
    %AICMD0x13_Wait(60)                                        ;B5BA71
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 15)                  ;B5BA74
    %AICMD0x56_UseEquippedItem()                               ;B5BA78
    %AICMD0x13_Wait(60)                                        ;B5BA79
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 15)                  ;B5BA7C
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B5BA80
    %AICMD0x56_UseEquippedItem()                               ;B5BA82
    %AICMD0x13_Wait(60)                                        ;B5BA83
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 15)                  ;B5BA86
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B5BA8A
    %AICMD0x56_UseEquippedItem()                               ;B5BA8C
    %AICMD0x13_Wait(60)                                        ;B5BA8D
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 15)                 ;B5BA90
    %AICMD0x56_UseEquippedItem()                               ;B5BA94
    %AICMD0x13_Wait(60)                                        ;B5BA95
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 48)                   ;B5BA98
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 16)                   ;B5BA9C
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 16)                  ;B5BAA0
    %AICMD0x3E_SetCarryItem($09)                               ;B5BAA4
    %AICMD0x13_Wait(40)                                        ;B5BAA6
    %AICMD0x3F_ThrowCarriedItem()                              ;B5BAA9
    %AICMD0x13_Wait(20)                                        ;B5BAAA
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 32)                  ;B5BAAD
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B5BAB1
    %AICMD0x3E_SetCarryItem($09)                               ;B5BAB3
    %AICMD0x13_Wait(40)                                        ;B5BAB5
    %AICMD0x3F_ThrowCarriedItem()                              ;B5BAB8
    %AICMD0x13_Wait(20)                                        ;B5BAB9
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 15)                  ;B5BABC
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B5BAC0
    %AICMD0x3E_SetCarryItem($09)                               ;B5BAC2
    %AICMD0x13_Wait(40)                                        ;B5BAC4
    %AICMD0x3F_ThrowCarriedItem()                              ;B5BAC7
    %AICMD0x13_Wait(20)                                        ;B5BAC8
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 15)                  ;B5BACB
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 15)                    ;B5BACF
    %AICMD0x3E_SetCarryItem($09)                               ;B5BAD3
    %AICMD0x13_Wait(40)                                        ;B5BAD5
    %AICMD0x3F_ThrowCarriedItem()                              ;B5BAD8
    %AICMD0x13_Wait(20)                                        ;B5BAD9
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 8)                   ;B5BADC
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 7)                      ;B5BAE0
    %AICMD0x3E_SetCarryItem($0F)                               ;B5BAE4
    %AICMD0x13_Wait(40)                                        ;B5BAE6
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B5BAE9
    %AICMD0x3F_ThrowCarriedItem()                              ;B5BAEB
    %AICMD0x13_Wait(20)                                        ;B5BAEC
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 7)                   ;B5BAEF
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B5BAF3
    %AICMD0x3E_SetCarryItem($0F)                               ;B5BAF5
    %AICMD0x13_Wait(40)                                        ;B5BAF7
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 7)                    ;B5BAFA
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 7)                    ;B5BAFE
    %AICMD0x3F_ThrowCarriedItem()                              ;B5BB02
    %AICMD0x13_Wait(20)                                        ;B5BB03
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 15)                  ;B5BB06
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 7)                      ;B5BB0A
    %AICMD0x3E_SetCarryItem($0F)                               ;B5BB0E
    %AICMD0x13_Wait(40)                                        ;B5BB10
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 15)                   ;B5BB13
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 15)                   ;B5BB17
    %AICMD0x3F_ThrowCarriedItem()                              ;B5BB1B
    %AICMD0x13_Wait(20)                                        ;B5BB1C
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 23)                  ;B5BB1F
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 15)                     ;B5BB23
    %AICMD0x3E_SetCarryItem($0F)                               ;B5BB27
    %AICMD0x13_Wait(40)                                        ;B5BB29
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 23)                   ;B5BB2C
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 23)                   ;B5BB30
    %AICMD0x3F_ThrowCarriedItem()                              ;B5BB34
    %AICMD0x13_Wait(20)                                        ;B5BB35
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 31)                  ;B5BB38
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 23)                     ;B5BB3C
    %AICMD0x3E_SetCarryItem($0F)                               ;B5BB40
    %AICMD0x13_Wait(40)                                        ;B5BB42
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 23)                   ;B5BB45
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 23)                   ;B5BB49
    %AICMD0x3F_ThrowCarriedItem()                              ;B5BB4D
    %AICMD0x13_Wait(20)                                        ;B5BB4E
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 31)                  ;B5BB51
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 23)                     ;B5BB55
    %AICMD0x3E_SetCarryItem($0F)                               ;B5BB59
    %AICMD0x13_Wait(40)                                        ;B5BB5B
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 23)                   ;B5BB5E
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 23)                   ;B5BB62
    %AICMD0x3F_ThrowCarriedItem()                              ;B5BB66
    %AICMD0x13_Wait(20)                                        ;B5BB67
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 23)                  ;B5BB6A
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 31)                     ;B5BB6E
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B5BB72
    %AICMD0x3E_SetCarryItem($0F)                               ;B5BB74
    %AICMD0x13_Wait(40)                                        ;B5BB76
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 31)                   ;B5BB79
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 15)                   ;B5BB7D
    %AICMD0x3F_ThrowCarriedItem()                              ;B5BB81
    %AICMD0x13_Wait(20)                                        ;B5BB82
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 15)                  ;B5BB85
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 23)                     ;B5BB89
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B5BB8D
    %AICMD0x3E_SetCarryItem($0F)                               ;B5BB8F
    %AICMD0x13_Wait(40)                                        ;B5BB91
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 23)                   ;B5BB94
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 7)                    ;B5BB98
    %AICMD0x3F_ThrowCarriedItem()                              ;B5BB9C
    %AICMD0x13_Wait(20)                                        ;B5BB9D
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 7)                   ;B5BBA0
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 15)                     ;B5BBA4
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B5BBA8
    %AICMD0x3E_SetCarryItem($0F)                               ;B5BBAA
    %AICMD0x13_Wait(40)                                        ;B5BBAC
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 7)                    ;B5BBAF
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 7)                    ;B5BBB3
    %AICMD0x3F_ThrowCarriedItem()                              ;B5BBB7
    %AICMD0x13_Wait(20)                                        ;B5BBB8
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 7)                   ;B5BBBB
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B5BBBF
    %AICMD0x3E_SetCarryItem($0F)                               ;B5BBC1
    %AICMD0x13_Wait(40)                                        ;B5BBC3
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B5BBC6
    %AICMD0x3F_ThrowCarriedItem()                              ;B5BBC8
    %AICMD0x13_Wait(20)                                        ;B5BBC9
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 15)                  ;B5BBCC
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 9)                      ;B5BBD0
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B5BBD4
    %AICMD0x59_SwapEquippedItems()                             ;B5BBD6
    %AICMD0x13_Wait(60)                                        ;B5BBD7
    %AICMD0x56_UseEquippedItem()                               ;B5BBDA
    %AICMD0x13_Wait(120)                                       ;B5BBDB
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 31)                    ;B5BBDE
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B5BBE2
    %AICMD0x56_UseEquippedItem()                               ;B5BBE4
    %AICMD0x13_Wait(120)                                       ;B5BBE5
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 11)                    ;B5BBE8
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 39)                  ;B5BBEC
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 15)                    ;B5BBF0
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $07)       ;B5BBF4
    %AICMD0x10_End()                                           ;B5BBF9


pAIScripting0x47_HowToPlay_Data11:
 
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $06)       ;B5BBFA
    %AICMD0x00_SetMusic($02, $B4)                              ;B5BBFF
    %AICMD0x02_FreezeTime()                                    ;B5BC02
    %AICMD0x03_SetHour($07)                                    ;B5BC03
    %AICMD0x05_SetTransferPosition(128, 200)                   ;B5BC05
    %AICMD0x08_EnableAIControl()                               ;B5BC0A
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B5BC0B
    %AICMD0x47_SetValue8(nCurrentSeasonID, 1)                  ;B5BC0D
    %AICMD0x06_SetDestinationArea(!AREA_SHED)                  ;B5BC12
    %AICMD0x38_WaitForFadeIn()                                               ;B5BC14
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 64)                    ;B5BC15
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 40)                 ;B5BC19
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 8)                     ;B5BC1D
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B5BC21
    %AICMD0x3E_SetCarryItem($2F)                               ;B5BC23
    %AICMD0x13_Wait(60)                                        ;B5BC25
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 16)                  ;B5BC28
    %AICMD0x59_SwapEquippedItems()                             ;B5BC2C
    %AICMD0x13_Wait(60)                                        ;B5BC2D
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B5BC30
    %AICMD0x3E_SetCarryItem($2E)                               ;B5BC32
    %AICMD0x13_Wait(60)                                        ;B5BC34
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 24)                  ;B5BC37
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 80)                  ;B5BC3B
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $07)       ;B5BC3F
    %AICMD0x10_End()                                           ;B5BC44


pAIScripting0x47_HowToPlay_Data12:
 
    %AICMD0x58_ReplaceFarmTile($02, 448, 528)                  ;B5BC45
    %AICMD0x58_ReplaceFarmTile($02, 464, 528)                  ;B5BC4B
    %AICMD0x58_ReplaceFarmTile($02, 464, 512)                  ;B5BC51
    %AICMD0x58_ReplaceFarmTile($02, 464, 544)                  ;B5BC57
    %AICMD0x58_ReplaceFarmTile($02, 480, 560)                  ;B5BC5D
    %AICMD0x58_ReplaceFarmTile($02, 368, 576)                  ;B5BC63
    %AICMD0x58_ReplaceFarmTile($02, 384, 576)                  ;B5BC69
    %AICMD0x58_ReplaceFarmTile($02, 368, 592)                  ;B5BC6F
    %AICMD0x58_ReplaceFarmTile($02, 352, 544)                  ;B5BC75
    %AICMD0x58_ReplaceFarmTile($02, 368, 544)                  ;B5BC7B
    %AICMD0x58_ReplaceFarmTile($02, 352, 560)                  ;B5BC81
    %AICMD0x58_ReplaceFarmTile($02, 368, 560)                  ;B5BC87
    %AICMD0x58_ReplaceFarmTile($02, 416, 576)                  ;B5BC8D
    %AICMD0x58_ReplaceFarmTile($02, 432, 576)                  ;B5BC93
    %AICMD0x58_ReplaceFarmTile($02, 416, 592)                  ;B5BC99
    %AICMD0x58_ReplaceFarmTile($02, 432, 592)                  ;B5BC9F
    %AICMD0x58_ReplaceFarmTile($02, 464, 496)                  ;B5BCA5
    %AICMD0x58_ReplaceFarmTile($02, 448, 496)                  ;B5BCAB
    %AICMD0x58_ReplaceFarmTile($02, 432, 496)                  ;B5BCB1
    %AICMD0x58_ReplaceFarmTile($02, 416, 496)                  ;B5BCB7
    %AICMD0x58_ReplaceFarmTile($02, 400, 496)                  ;B5BCBD
    %AICMD0x58_ReplaceFarmTile($02, 384, 496)                  ;B5BCC3
    %AICMD0x58_ReplaceFarmTile($02, 368, 496)                  ;B5BCC9
    %AICMD0x58_ReplaceFarmTile($02, 352, 496)                  ;B5BCCF
    %AICMD0x58_ReplaceFarmTile($02, 336, 496)                  ;B5BCD5
    %AICMD0x58_ReplaceFarmTile($02, 320, 496)                  ;B5BCDB
    %AICMD0x58_ReplaceFarmTile($05, 464, 560)                  ;B5BCE1
    %AICMD0x58_ReplaceFarmTile($05, 448, 560)                  ;B5BCE7
    %AICMD0x58_ReplaceFarmTile($05, 432, 560)                  ;B5BCED
    %AICMD0x58_ReplaceFarmTile($05, 416, 560)                  ;B5BCF3
    %AICMD0x58_ReplaceFarmTile($05, 400, 560)                  ;B5BCF9
    %AICMD0x58_ReplaceFarmTile($05, 384, 560)                  ;B5BCFF
    %AICMD0x58_ReplaceFarmTile($05, 368, 560)                  ;B5BD05
    %AICMD0x58_ReplaceFarmTile($05, 352, 560)                  ;B5BD0B
    %AICMD0x58_ReplaceFarmTile($05, 336, 560)                  ;B5BD11
    %AICMD0x58_ReplaceFarmTile($05, 320, 560)                  ;B5BD17
    %AICMD0x58_ReplaceFarmTile($05, 320, 544)                  ;B5BD1D
    %AICMD0x58_ReplaceFarmTile($05, 320, 528)                  ;B5BD23
    %AICMD0x58_ReplaceFarmTile($05, 320, 512)                  ;B5BD29
    %AICMD0x58_ReplaceFarmTile($05, 320, 496)                  ;B5BD2F
    %AICMD0x58_ReplaceFarmTile($02, 336, 512)                  ;B5BD35
    %AICMD0x58_ReplaceFarmTile($02, 352, 512)                  ;B5BD3B
    %AICMD0x58_ReplaceFarmTile($02, 368, 512)                  ;B5BD41
    %AICMD0x58_ReplaceFarmTile($02, 320, 416)                  ;B5BD47
    %AICMD0x58_ReplaceFarmTile($02, 320, 432)                  ;B5BD4D
    %AICMD0x58_ReplaceFarmTile($02, 288, 448)                  ;B5BD53
    %AICMD0x58_ReplaceFarmTile($02, 304, 448)                  ;B5BD59
    %AICMD0x58_ReplaceFarmTile($02, 288, 464)                  ;B5BD5F
    %AICMD0x58_ReplaceFarmTile($02, 304, 464)                  ;B5BD65
    %AICMD0x58_ReplaceFarmTile($07, 352, 496)                  ;B5BD6B
    %AICMD0x58_ReplaceFarmTile($07, 368, 496)                  ;B5BD71
    %AICMD0x58_ReplaceFarmTile($07, 384, 496)                  ;B5BD77
    %AICMD0x58_ReplaceFarmTile($07, 352, 512)                  ;B5BD7D
    %AICMD0x58_ReplaceFarmTile($6A, 368, 512)                  ;B5BD83
    %AICMD0x58_ReplaceFarmTile($07, 384, 512)                  ;B5BD89
    %AICMD0x58_ReplaceFarmTile($07, 352, 528)                  ;B5BD8F
    %AICMD0x58_ReplaceFarmTile($07, 368, 528)                  ;B5BD95
    %AICMD0x58_ReplaceFarmTile($07, 384, 528)                  ;B5BD9B
    %AICMD0x58_ReplaceFarmTile($79, 416, 496)                  ;B5BDA1
    %AICMD0x58_ReplaceFarmTile($79, 432, 496)                  ;B5BDA7
    %AICMD0x58_ReplaceFarmTile($79, 448, 496)                  ;B5BDAD
    %AICMD0x58_ReplaceFarmTile($79, 416, 512)                  ;B5BDB3
    %AICMD0x58_ReplaceFarmTile($79, 432, 512)                  ;B5BDB9
    %AICMD0x58_ReplaceFarmTile($79, 448, 512)                  ;B5BDBF
    %AICMD0x58_ReplaceFarmTile($79, 416, 528)                  ;B5BDC5
    %AICMD0x58_ReplaceFarmTile($79, 432, 528)                  ;B5BDCB
    %AICMD0x58_ReplaceFarmTile($79, 448, 528)                  ;B5BDD1
    %AICMD0x58_ReplaceFarmTile($02, 176, 464)                  ;B5BDD7
    %AICMD0x58_ReplaceFarmTile($02, 192, 480)                  ;B5BDDD
    %AICMD0x58_ReplaceFarmTile($04, 192, 432)                  ;B5BDE3
    %AICMD0x58_ReplaceFarmTile($04, 208, 432)                  ;B5BDE9
    %AICMD0x58_ReplaceFarmTile($05, 208, 496)                  ;B5BDEF
    %AICMD0x58_ReplaceFarmTile($05, 208, 512)                  ;B5BDF5
    %AICMD0x58_ReplaceFarmTile($05, 208, 528)                  ;B5BDFB
    %AICMD0x58_ReplaceFarmTile($05, 208, 544)                  ;B5BE01
    %AICMD0x58_ReplaceFarmTile($05, 208, 560)                  ;B5BE07
    %AICMD0x58_ReplaceFarmTile($05, 224, 560)                  ;B5BE0D
    %AICMD0x58_ReplaceFarmTile($05, 240, 560)                  ;B5BE13
    %AICMD0x58_ReplaceFarmTile($05, 256, 560)                  ;B5BE19
    %AICMD0x58_ReplaceFarmTile($05, 272, 560)                  ;B5BE1F
    %AICMD0x58_ReplaceFarmTile($05, 288, 560)                  ;B5BE25
    %AICMD0x58_ReplaceFarmTile($05, 304, 560)                  ;B5BE2B
    %AICMD0x58_ReplaceFarmTile($07, 240, 496)                  ;B5BE31
    %AICMD0x58_ReplaceFarmTile($07, 256, 496)                  ;B5BE37
    %AICMD0x58_ReplaceFarmTile($07, 272, 496)                  ;B5BE3D
    %AICMD0x58_ReplaceFarmTile($07, 288, 496)                  ;B5BE43
    %AICMD0x58_ReplaceFarmTile($07, 304, 496)                  ;B5BE49
    %AICMD0x58_ReplaceFarmTile($07, 320, 496)                  ;B5BE4F
    %AICMD0x58_ReplaceFarmTile($07, 240, 528)                  ;B5BE55
    %AICMD0x58_ReplaceFarmTile($07, 256, 528)                  ;B5BE5B
    %AICMD0x58_ReplaceFarmTile($07, 272, 528)                  ;B5BE61
    %AICMD0x58_ReplaceFarmTile($07, 288, 528)                  ;B5BE67
    %AICMD0x58_ReplaceFarmTile($07, 304, 528)                  ;B5BE6D
    %AICMD0x58_ReplaceFarmTile($07, 320, 528)                  ;B5BE73
    %AICMD0x58_ReplaceFarmTile($02, 224, 496)                  ;B5BE79
    %AICMD0x58_ReplaceFarmTile($02, 320, 512)                  ;B5BE7F
    %AICMD0x58_ReplaceFarmTile($02, 320, 544)                  ;B5BE85
    %AICMD0x47_SetValue8(wram80(strcPlayerData.toolEquipped), 5)                           ;B5BE8B
    %AICMD0x47_SetValue8(wram80(strcPlayerData.toolSecond), 6)                           ;B5BE90
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $06)       ;B5BE95
    %AICMD0x00_SetMusic($02, $B4)                              ;B5BE9A
    %AICMD0x02_FreezeTime()                                    ;B5BE9D
    %AICMD0x03_SetHour($07)                                    ;B5BE9E
    %AICMD0x05_SetTransferPosition(424, 488)                   ;B5BEA0
    %AICMD0x08_EnableAIControl()                               ;B5BEA5
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B5BEA6
    %AICMD0x47_SetValue8(nCurrentSeasonID, 1)                  ;B5BEA8
    %AICMD0x06_SetDestinationArea(!AREA_FARMSUMMER)            ;B5BEAD
    %AICMD0x38_WaitForFadeIn()                                               ;B5BEAF
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 79)                   ;B5BEB0
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 15)                   ;B5BEB4
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B5BEB8
    %AICMD0x56_UseEquippedItem()                               ;B5BEBA
    %AICMD0x13_Wait(120)                                       ;B5BEBB
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 47)                 ;B5BEBE
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B5BEC2
    %AICMD0x59_SwapEquippedItems()                             ;B5BEC4
    %AICMD0x13_Wait(60)                                        ;B5BEC5
    %AICMD0x56_UseEquippedItem()                               ;B5BEC8
    %AICMD0x13_Wait(120)                                       ;B5BEC9
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 15)                     ;B5BECC
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 55)                  ;B5BED0
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 8)                     ;B5BED4
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $07)       ;B5BED8
    %AICMD0x10_End()                                           ;B5BEDD


pAIScripting0x47_HowToPlay_Data13:
 
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $06)       ;B5BEDE
    %AICMD0x00_SetMusic($02, $B4)                              ;B5BEE3
    %AICMD0x02_FreezeTime()                                    ;B5BEE6
    %AICMD0x03_SetHour($07)                                    ;B5BEE7
    %AICMD0x05_SetTransferPosition(128, 200)                   ;B5BEE9
    %AICMD0x08_EnableAIControl()                               ;B5BEEE
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B5BEEF
    %AICMD0x47_SetValue8(nCurrentSeasonID, 1)                  ;B5BEF1
    %AICMD0x06_SetDestinationArea(!AREA_SHED)                  ;B5BEF6
    %AICMD0x38_WaitForFadeIn()                                               ;B5BEF8
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 16)                    ;B5BEF9
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 24)                  ;B5BEFD
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 8)                     ;B5BF01
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B5BF05
    %AICMD0x3E_SetCarryItem($3E)                               ;B5BF07
    %AICMD0x13_Wait(60)                                        ;B5BF09
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 24)                 ;B5BF0C
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 32)                  ;B5BF10
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $07)       ;B5BF14
    %AICMD0x10_End()                                           ;B5BF19


pAIScripting0x47_HowToPlay_Data14:
 
    %AICMD0x58_ReplaceFarmTile($02, 448, 528)                  ;B5BF1A
    %AICMD0x58_ReplaceFarmTile($02, 464, 528)                  ;B5BF20
    %AICMD0x58_ReplaceFarmTile($02, 464, 512)                  ;B5BF26
    %AICMD0x58_ReplaceFarmTile($02, 464, 544)                  ;B5BF2C
    %AICMD0x58_ReplaceFarmTile($02, 480, 560)                  ;B5BF32
    %AICMD0x58_ReplaceFarmTile($02, 368, 576)                  ;B5BF38
    %AICMD0x58_ReplaceFarmTile($02, 384, 576)                  ;B5BF3E
    %AICMD0x58_ReplaceFarmTile($02, 368, 592)                  ;B5BF44
    %AICMD0x58_ReplaceFarmTile($02, 352, 544)                  ;B5BF4A
    %AICMD0x58_ReplaceFarmTile($02, 368, 544)                  ;B5BF50
    %AICMD0x58_ReplaceFarmTile($02, 352, 560)                  ;B5BF56
    %AICMD0x58_ReplaceFarmTile($02, 368, 560)                  ;B5BF5C
    %AICMD0x58_ReplaceFarmTile($02, 416, 576)                  ;B5BF62
    %AICMD0x58_ReplaceFarmTile($02, 432, 576)                  ;B5BF68
    %AICMD0x58_ReplaceFarmTile($02, 416, 592)                  ;B5BF6E
    %AICMD0x58_ReplaceFarmTile($02, 432, 592)                  ;B5BF74
    %AICMD0x58_ReplaceFarmTile($02, 464, 496)                  ;B5BF7A
    %AICMD0x58_ReplaceFarmTile($02, 448, 496)                  ;B5BF80
    %AICMD0x58_ReplaceFarmTile($02, 432, 496)                  ;B5BF86
    %AICMD0x58_ReplaceFarmTile($02, 416, 496)                  ;B5BF8C
    %AICMD0x58_ReplaceFarmTile($02, 400, 496)                  ;B5BF92
    %AICMD0x58_ReplaceFarmTile($02, 384, 496)                  ;B5BF98
    %AICMD0x58_ReplaceFarmTile($02, 368, 496)                  ;B5BF9E
    %AICMD0x58_ReplaceFarmTile($02, 352, 496)                  ;B5BFA4
    %AICMD0x58_ReplaceFarmTile($02, 336, 496)                  ;B5BFAA
    %AICMD0x58_ReplaceFarmTile($02, 320, 496)                  ;B5BFB0
    %AICMD0x58_ReplaceFarmTile($05, 464, 560)                  ;B5BFB6
    %AICMD0x58_ReplaceFarmTile($05, 448, 560)                  ;B5BFBC
    %AICMD0x58_ReplaceFarmTile($05, 432, 560)                  ;B5BFC2
    %AICMD0x58_ReplaceFarmTile($05, 416, 560)                  ;B5BFC8
    %AICMD0x58_ReplaceFarmTile($05, 400, 560)                  ;B5BFCE
    %AICMD0x58_ReplaceFarmTile($05, 384, 560)                  ;B5BFD4
    %AICMD0x58_ReplaceFarmTile($05, 368, 560)                  ;B5BFDA
    %AICMD0x58_ReplaceFarmTile($05, 352, 560)                  ;B5BFE0
    %AICMD0x58_ReplaceFarmTile($05, 336, 560)                  ;B5BFE6
    %AICMD0x58_ReplaceFarmTile($05, 320, 560)                  ;B5BFEC
    %AICMD0x58_ReplaceFarmTile($05, 320, 544)                  ;B5BFF2
    %AICMD0x58_ReplaceFarmTile($05, 320, 528)                  ;B5BFF8
    %AICMD0x58_ReplaceFarmTile($05, 320, 512)                  ;B5BFFE
    %AICMD0x58_ReplaceFarmTile($05, 320, 496)                  ;B5C004
    %AICMD0x58_ReplaceFarmTile($02, 336, 512)                  ;B5C00A
    %AICMD0x58_ReplaceFarmTile($02, 352, 512)                  ;B5C010
    %AICMD0x58_ReplaceFarmTile($02, 368, 512)                  ;B5C016
    %AICMD0x58_ReplaceFarmTile($02, 320, 416)                  ;B5C01C
    %AICMD0x58_ReplaceFarmTile($02, 320, 432)                  ;B5C022
    %AICMD0x58_ReplaceFarmTile($02, 288, 448)                  ;B5C028
    %AICMD0x58_ReplaceFarmTile($02, 304, 448)                  ;B5C02E
    %AICMD0x58_ReplaceFarmTile($02, 288, 464)                  ;B5C034
    %AICMD0x58_ReplaceFarmTile($02, 304, 464)                  ;B5C03A
    %AICMD0x58_ReplaceFarmTile($07, 352, 496)                  ;B5C040
    %AICMD0x58_ReplaceFarmTile($07, 368, 496)                  ;B5C046
    %AICMD0x58_ReplaceFarmTile($07, 384, 496)                  ;B5C04C
    %AICMD0x58_ReplaceFarmTile($07, 352, 512)                  ;B5C052
    %AICMD0x58_ReplaceFarmTile($6A, 368, 512)                  ;B5C058
    %AICMD0x58_ReplaceFarmTile($07, 384, 512)                  ;B5C05E
    %AICMD0x58_ReplaceFarmTile($07, 352, 528)                  ;B5C064
    %AICMD0x58_ReplaceFarmTile($07, 368, 528)                  ;B5C06A
    %AICMD0x58_ReplaceFarmTile($07, 384, 528)                  ;B5C070
    %AICMD0x58_ReplaceFarmTile($79, 416, 496)                  ;B5C076
    %AICMD0x58_ReplaceFarmTile($79, 432, 496)                  ;B5C07C
    %AICMD0x58_ReplaceFarmTile($79, 448, 496)                  ;B5C082
    %AICMD0x58_ReplaceFarmTile($79, 416, 512)                  ;B5C088
    %AICMD0x58_ReplaceFarmTile($79, 432, 512)                  ;B5C08E
    %AICMD0x58_ReplaceFarmTile($79, 448, 512)                  ;B5C094
    %AICMD0x58_ReplaceFarmTile($79, 416, 528)                  ;B5C09A
    %AICMD0x58_ReplaceFarmTile($79, 432, 528)                  ;B5C0A0
    %AICMD0x58_ReplaceFarmTile($79, 448, 528)                  ;B5C0A6
    %AICMD0x58_ReplaceFarmTile($02, 176, 464)                  ;B5C0AC
    %AICMD0x58_ReplaceFarmTile($02, 192, 480)                  ;B5C0B2
    %AICMD0x58_ReplaceFarmTile($04, 192, 432)                  ;B5C0B8
    %AICMD0x58_ReplaceFarmTile($04, 208, 432)                  ;B5C0BE
    %AICMD0x58_ReplaceFarmTile($05, 208, 496)                  ;B5C0C4
    %AICMD0x58_ReplaceFarmTile($05, 208, 512)                  ;B5C0CA
    %AICMD0x58_ReplaceFarmTile($05, 208, 528)                  ;B5C0D0
    %AICMD0x58_ReplaceFarmTile($05, 208, 544)                  ;B5C0D6
    %AICMD0x58_ReplaceFarmTile($05, 208, 560)                  ;B5C0DC
    %AICMD0x58_ReplaceFarmTile($05, 224, 560)                  ;B5C0E2
    %AICMD0x58_ReplaceFarmTile($05, 240, 560)                  ;B5C0E8
    %AICMD0x58_ReplaceFarmTile($05, 256, 560)                  ;B5C0EE
    %AICMD0x58_ReplaceFarmTile($05, 272, 560)                  ;B5C0F4
    %AICMD0x58_ReplaceFarmTile($05, 288, 560)                  ;B5C0FA
    %AICMD0x58_ReplaceFarmTile($05, 304, 560)                  ;B5C100
    %AICMD0x58_ReplaceFarmTile($3A, 240, 496)                  ;B5C106
    %AICMD0x58_ReplaceFarmTile($3A, 256, 496)                  ;B5C10C
    %AICMD0x58_ReplaceFarmTile($3A, 272, 496)                  ;B5C112
    %AICMD0x58_ReplaceFarmTile($26, 288, 496)                  ;B5C118
    %AICMD0x58_ReplaceFarmTile($26, 304, 496)                  ;B5C11E
    %AICMD0x58_ReplaceFarmTile($26, 320, 496)                  ;B5C124
    %AICMD0x58_ReplaceFarmTile($3A, 240, 528)                  ;B5C12A
    %AICMD0x58_ReplaceFarmTile($3A, 256, 528)                  ;B5C130
    %AICMD0x58_ReplaceFarmTile($3A, 272, 528)                  ;B5C136
    %AICMD0x58_ReplaceFarmTile($26, 288, 528)                  ;B5C13C
    %AICMD0x58_ReplaceFarmTile($26, 304, 528)                  ;B5C142
    %AICMD0x58_ReplaceFarmTile($26, 320, 528)                  ;B5C148
    %AICMD0x58_ReplaceFarmTile($02, 224, 496)                  ;B5C14E
    %AICMD0x58_ReplaceFarmTile($02, 320, 512)                  ;B5C154
    %AICMD0x58_ReplaceFarmTile($02, 320, 544)                  ;B5C15A
    %AICMD0x47_SetValue8(wram80(strcPlayerData.toolEquipped), 21)                          ;B5C160
    %AICMD0x47_SetValue8(wram80(strcPlayerData.toolSecond), 0)                           ;B5C165
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $06)       ;B5C16A
    %AICMD0x00_SetMusic($02, $B4)                              ;B5C16F
    %AICMD0x02_FreezeTime()                                    ;B5C172
    %AICMD0x03_SetHour($07)                                    ;B5C173
    %AICMD0x05_SetTransferPosition(424, 488)                   ;B5C175
    %AICMD0x08_EnableAIControl()                               ;B5C17A
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B5C17B
    %AICMD0x47_SetValue8(nCurrentSeasonID, 1)                  ;B5C17D
    %AICMD0x06_SetDestinationArea(!AREA_FARMSUMMER)            ;B5C182
    %AICMD0x38_WaitForFadeIn()                                               ;B5C184
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 79)                   ;B5C185
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 15)                   ;B5C189
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B5C18D
    %AICMD0x56_UseEquippedItem()                               ;B5C18F
    %AICMD0x13_Wait(120)                                       ;B5C190
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 47)                 ;B5C193
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B5C197
    %AICMD0x56_UseEquippedItem()                               ;B5C199
    %AICMD0x13_Wait(120)                                       ;B5C19A
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 23)                  ;B5C19D
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B5C1A1
    %AICMD0x56_UseEquippedItem()                               ;B5C1A3
    %AICMD0x13_Wait(120)                                       ;B5C1A4
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 7)                    ;B5C1A7
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 72)                     ;B5C1AB
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 104)                  ;B5C1AF
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 48)                    ;B5C1B3
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $07)       ;B5C1B7
    %AICMD0x10_End()                                           ;B5C1BC


pAIScripting0x47_HowToPlay_Data15:
 
    %AICMD0x58_ReplaceFarmTile($02, 448, 528)                  ;B5C1BD
    %AICMD0x58_ReplaceFarmTile($02, 464, 528)                  ;B5C1C3
    %AICMD0x58_ReplaceFarmTile($02, 464, 512)                  ;B5C1C9
    %AICMD0x58_ReplaceFarmTile($02, 464, 544)                  ;B5C1CF
    %AICMD0x58_ReplaceFarmTile($02, 480, 560)                  ;B5C1D5
    %AICMD0x58_ReplaceFarmTile($02, 368, 576)                  ;B5C1DB
    %AICMD0x58_ReplaceFarmTile($02, 384, 576)                  ;B5C1E1
    %AICMD0x58_ReplaceFarmTile($02, 368, 592)                  ;B5C1E7
    %AICMD0x58_ReplaceFarmTile($02, 352, 544)                  ;B5C1ED
    %AICMD0x58_ReplaceFarmTile($02, 368, 544)                  ;B5C1F3
    %AICMD0x58_ReplaceFarmTile($02, 352, 560)                  ;B5C1F9
    %AICMD0x58_ReplaceFarmTile($02, 368, 560)                  ;B5C1FF
    %AICMD0x58_ReplaceFarmTile($02, 416, 576)                  ;B5C205
    %AICMD0x58_ReplaceFarmTile($02, 432, 576)                  ;B5C20B
    %AICMD0x58_ReplaceFarmTile($02, 416, 592)                  ;B5C211
    %AICMD0x58_ReplaceFarmTile($02, 432, 592)                  ;B5C217
    %AICMD0x58_ReplaceFarmTile($02, 464, 496)                  ;B5C21D
    %AICMD0x58_ReplaceFarmTile($02, 448, 496)                  ;B5C223
    %AICMD0x58_ReplaceFarmTile($02, 432, 496)                  ;B5C229
    %AICMD0x58_ReplaceFarmTile($02, 416, 496)                  ;B5C22F
    %AICMD0x58_ReplaceFarmTile($02, 400, 496)                  ;B5C235
    %AICMD0x58_ReplaceFarmTile($02, 384, 496)                  ;B5C23B
    %AICMD0x58_ReplaceFarmTile($02, 368, 496)                  ;B5C241
    %AICMD0x58_ReplaceFarmTile($02, 352, 496)                  ;B5C247
    %AICMD0x58_ReplaceFarmTile($02, 336, 496)                  ;B5C24D
    %AICMD0x58_ReplaceFarmTile($02, 320, 496)                  ;B5C253
    %AICMD0x58_ReplaceFarmTile($05, 464, 560)                  ;B5C259
    %AICMD0x58_ReplaceFarmTile($05, 448, 560)                  ;B5C25F
    %AICMD0x58_ReplaceFarmTile($05, 432, 560)                  ;B5C265
    %AICMD0x58_ReplaceFarmTile($05, 416, 560)                  ;B5C26B
    %AICMD0x58_ReplaceFarmTile($05, 400, 560)                  ;B5C271
    %AICMD0x58_ReplaceFarmTile($05, 384, 560)                  ;B5C277
    %AICMD0x58_ReplaceFarmTile($05, 368, 560)                  ;B5C27D
    %AICMD0x58_ReplaceFarmTile($05, 352, 560)                  ;B5C283
    %AICMD0x58_ReplaceFarmTile($05, 336, 560)                  ;B5C289
    %AICMD0x58_ReplaceFarmTile($05, 320, 560)                  ;B5C28F
    %AICMD0x58_ReplaceFarmTile($05, 320, 544)                  ;B5C295
    %AICMD0x58_ReplaceFarmTile($05, 320, 528)                  ;B5C29B
    %AICMD0x58_ReplaceFarmTile($05, 320, 512)                  ;B5C2A1
    %AICMD0x58_ReplaceFarmTile($05, 320, 496)                  ;B5C2A7
    %AICMD0x58_ReplaceFarmTile($02, 336, 512)                  ;B5C2AD
    %AICMD0x58_ReplaceFarmTile($02, 352, 512)                  ;B5C2B3
    %AICMD0x58_ReplaceFarmTile($02, 368, 512)                  ;B5C2B9
    %AICMD0x58_ReplaceFarmTile($02, 320, 416)                  ;B5C2BF
    %AICMD0x58_ReplaceFarmTile($02, 320, 432)                  ;B5C2C5
    %AICMD0x58_ReplaceFarmTile($02, 288, 448)                  ;B5C2CB
    %AICMD0x58_ReplaceFarmTile($02, 304, 448)                  ;B5C2D1
    %AICMD0x58_ReplaceFarmTile($02, 288, 464)                  ;B5C2D7
    %AICMD0x58_ReplaceFarmTile($02, 304, 464)                  ;B5C2DD
    %AICMD0x58_ReplaceFarmTile($07, 352, 496)                  ;B5C2E3
    %AICMD0x58_ReplaceFarmTile($07, 368, 496)                  ;B5C2E9
    %AICMD0x58_ReplaceFarmTile($07, 384, 496)                  ;B5C2EF
    %AICMD0x58_ReplaceFarmTile($07, 352, 512)                  ;B5C2F5
    %AICMD0x58_ReplaceFarmTile($07, 368, 512)                  ;B5C2FB
    %AICMD0x58_ReplaceFarmTile($07, 384, 512)                  ;B5C301
    %AICMD0x58_ReplaceFarmTile($07, 352, 528)                  ;B5C307
    %AICMD0x58_ReplaceFarmTile($07, 368, 528)                  ;B5C30D
    %AICMD0x58_ReplaceFarmTile($07, 384, 528)                  ;B5C313
    %AICMD0x58_ReplaceFarmTile($79, 416, 496)                  ;B5C319
    %AICMD0x58_ReplaceFarmTile($79, 432, 496)                  ;B5C31F
    %AICMD0x58_ReplaceFarmTile($79, 448, 496)                  ;B5C325
    %AICMD0x58_ReplaceFarmTile($79, 416, 512)                  ;B5C32B
    %AICMD0x58_ReplaceFarmTile($79, 432, 512)                  ;B5C331
    %AICMD0x58_ReplaceFarmTile($79, 448, 512)                  ;B5C337
    %AICMD0x58_ReplaceFarmTile($79, 416, 528)                  ;B5C33D
    %AICMD0x58_ReplaceFarmTile($79, 432, 528)                  ;B5C343
    %AICMD0x58_ReplaceFarmTile($79, 448, 528)                  ;B5C349
    %AICMD0x58_ReplaceFarmTile($02, 176, 464)                  ;B5C34F
    %AICMD0x58_ReplaceFarmTile($02, 192, 480)                  ;B5C355
    %AICMD0x58_ReplaceFarmTile($04, 192, 432)                  ;B5C35B
    %AICMD0x58_ReplaceFarmTile($04, 208, 432)                  ;B5C361
    %AICMD0x58_ReplaceFarmTile($05, 208, 496)                  ;B5C367
    %AICMD0x58_ReplaceFarmTile($05, 208, 512)                  ;B5C36D
    %AICMD0x58_ReplaceFarmTile($05, 208, 528)                  ;B5C373
    %AICMD0x58_ReplaceFarmTile($05, 208, 544)                  ;B5C379
    %AICMD0x58_ReplaceFarmTile($05, 208, 560)                  ;B5C37F
    %AICMD0x58_ReplaceFarmTile($05, 224, 560)                  ;B5C385
    %AICMD0x58_ReplaceFarmTile($05, 240, 560)                  ;B5C38B
    %AICMD0x58_ReplaceFarmTile($05, 256, 560)                  ;B5C391
    %AICMD0x58_ReplaceFarmTile($05, 272, 560)                  ;B5C397
    %AICMD0x58_ReplaceFarmTile($05, 288, 560)                  ;B5C39D
    %AICMD0x58_ReplaceFarmTile($05, 304, 560)                  ;B5C3A3
    %AICMD0x58_ReplaceFarmTile($07, 240, 496)                  ;B5C3A9
    %AICMD0x58_ReplaceFarmTile($07, 256, 496)                  ;B5C3AF
    %AICMD0x58_ReplaceFarmTile($07, 272, 496)                  ;B5C3B5
    %AICMD0x58_ReplaceFarmTile($07, 288, 496)                  ;B5C3BB
    %AICMD0x58_ReplaceFarmTile($07, 304, 496)                  ;B5C3C1
    %AICMD0x58_ReplaceFarmTile($07, 320, 496)                  ;B5C3C7
    %AICMD0x58_ReplaceFarmTile($07, 240, 528)                  ;B5C3CD
    %AICMD0x58_ReplaceFarmTile($07, 256, 528)                  ;B5C3D3
    %AICMD0x58_ReplaceFarmTile($07, 272, 528)                  ;B5C3D9
    %AICMD0x58_ReplaceFarmTile($07, 288, 528)                  ;B5C3DF
    %AICMD0x58_ReplaceFarmTile($07, 304, 528)                  ;B5C3E5
    %AICMD0x58_ReplaceFarmTile($07, 320, 528)                  ;B5C3EB
    %AICMD0x58_ReplaceFarmTile($02, 224, 496)                  ;B5C3F1
    %AICMD0x58_ReplaceFarmTile($02, 320, 512)                  ;B5C3F7
    %AICMD0x58_ReplaceFarmTile($02, 320, 544)                  ;B5C3FD
    %AICMD0x47_SetValue8(wram80(strcPlayerData.toolEquipped), 0)                           ;B5C403
    %AICMD0x47_SetValue8(wram80(strcPlayerData.toolSecond), 0)                           ;B5C408
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $06)       ;B5C40D
    %AICMD0x00_SetMusic($07, $B4)                              ;B5C412
    %AICMD0x02_FreezeTime()                                    ;B5C415
    %AICMD0x03_SetHour($07)                                    ;B5C416
    %AICMD0x05_SetTransferPosition(136, 344)                   ;B5C418
    %AICMD0x08_EnableAIControl()                               ;B5C41D
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B5C41E
    %AICMD0x47_SetValue8(nCurrentSeasonID, 2)                  ;B5C420
    %AICMD0x06_SetDestinationArea(!AREA_FARMFALL)              ;B5C425
    %AICMD0x38_WaitForFadeIn()                                               ;B5C427
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 32)                  ;B5C428
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 102)                 ;B5C42C
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 56)                   ;B5C430
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 40)                  ;B5C434
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 16)                    ;B5C438
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $07)       ;B5C43C
    %AICMD0x10_End()                                           ;B5C441


pAIScripting0x47_HowToPlay_Data16:
 
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $06)       ;B5C442
    %AICMD0x00_SetMusic($07, $B4)                              ;B5C447
    %AICMD0x02_FreezeTime()                                    ;B5C44A
    %AICMD0x03_SetHour($07)                                    ;B5C44B
    %AICMD0x05_SetTransferPosition(128, 200)                   ;B5C44D
    %AICMD0x08_EnableAIControl()                               ;B5C452
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B5C453
    %AICMD0x47_SetValue8(nCurrentSeasonID, 2)                  ;B5C455
    %AICMD0x06_SetDestinationArea(!AREA_SHED)                  ;B5C45A
    %AICMD0x38_WaitForFadeIn()                                               ;B5C45C
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 16)                    ;B5C45D
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 56)                  ;B5C461
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 8)                     ;B5C465
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B5C469
    %AICMD0x3E_SetCarryItem($37)                               ;B5C46B
    %AICMD0x13_Wait(60)                                        ;B5C46D
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 16)                 ;B5C470
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B5C474
    %AICMD0x3E_SetCarryItem($38)                               ;B5C476
    %AICMD0x13_Wait(60)                                        ;B5C478
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 40)                 ;B5C47B
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 32)                  ;B5C47F
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $07)       ;B5C483
    %AICMD0x10_End()                                           ;B5C488


pAIScripting0x47_HowToPlay_Data17:
 
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $06)       ;B5C489
    %AICMD0x00_SetMusic($07, $B4)                              ;B5C48E
    %AICMD0x02_FreezeTime()                                    ;B5C491
    %AICMD0x03_SetHour($07)                                    ;B5C492
    %AICMD0x05_SetTransferPosition(424, 488)                   ;B5C494
    %AICMD0x08_EnableAIControl()                               ;B5C499
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B5C49A
    %AICMD0x47_SetValue8(nCurrentSeasonID, 2)                  ;B5C49C
    %AICMD0x06_SetDestinationArea(!AREA_FARMFALL)              ;B5C4A1
    %AICMD0x38_WaitForFadeIn()                                               ;B5C4A3
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 39)                   ;B5C4A4
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 55)                     ;B5C4A8
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 7)                    ;B5C4AC
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 32)                    ;B5C4B0
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $07)       ;B5C4B4
    %AICMD0x10_End()                                           ;B5C4B9


pAIScripting0x47_HowToPlay_Data18:
 
    %AICMD0x47_SetValue8(wram80(strcPlayerData.toolEquipped), 15)                          ;B5C4BA
    %AICMD0x47_SetValue8(wram80(strcPlayerData.toolSecond), 14)                          ;B5C4BF
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $06)       ;B5C4C4
    %AICMD0x00_SetMusic($07, $B4)                              ;B5C4C9
    %AICMD0x02_FreezeTime()                                    ;B5C4CC
    %AICMD0x03_SetHour($07)                                    ;B5C4CD
    %AICMD0x05_SetTransferPosition(128, 360)                   ;B5C4CF
    %AICMD0x08_EnableAIControl()                               ;B5C4D4
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B5C4D5
    %AICMD0x09_StartScript($01, pAIScripting0x47_HowToPlay_L003)                                   ;B5C4D7
    %AICMD0x09_StartScript($02, pAIScripting0x47_HowToPlay_L005)                                   ;B5C4DB
    %AICMD0x47_SetValue8(nCurrentSeasonID, 2)                  ;B5C4DF
    %AICMD0x06_SetDestinationArea(!AREA_COWBARN)               ;B5C4E4
    %AICMD0x38_WaitForFadeIn()                                               ;B5C4E6
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 15)                     ;B5C4E7
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 27)                  ;B5C4EB
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 23)                     ;B5C4EF
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 18)                  ;B5C4F3
    %AICMD0x56_UseEquippedItem()                               ;B5C4F7
    %AICMD0x13_Wait(80)                                        ;B5C4F8
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 18)                 ;B5C4FB
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 15)                     ;B5C4FF
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 18)                  ;B5C503
    %AICMD0x56_UseEquippedItem()                               ;B5C507
    %AICMD0x13_Wait(80)                                        ;B5C508
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 18)                 ;B5C50B
    %AICMD0x59_SwapEquippedItems()                             ;B5C50F
    %AICMD0x13_Wait(60)                                        ;B5C510
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 18)                  ;B5C513
    %AICMD0x56_UseEquippedItem()                               ;B5C517
    %AICMD0x13_Wait(68)                                        ;B5C518
    %AICMD0x3E_SetCarryItem($15)                               ;B5C51B
    %AICMD0x13_Wait(40)                                        ;B5C51D
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 16)                 ;B5C520
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 39)                   ;B5C524
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 79)                   ;B5C528
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B5C52C
    %AICMD0x3F_ThrowCarriedItem()                              ;B5C52E
    %AICMD0x13_Wait(60)                                        ;B5C52F
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 79)                  ;B5C532
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 23)                     ;B5C536
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 16)                  ;B5C53A
    %AICMD0x56_UseEquippedItem()                               ;B5C53E
    %AICMD0x13_Wait(68)                                        ;B5C53F
    %AICMD0x3E_SetCarryItem($15)                               ;B5C542
    %AICMD0x13_Wait(40)                                        ;B5C544
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 16)                 ;B5C547
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 23)                   ;B5C54B
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 79)                   ;B5C54F
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B5C553
    %AICMD0x3F_ThrowCarriedItem()                              ;B5C555
    %AICMD0x13_Wait(60)                                        ;B5C556
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 51)                  ;B5C559
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 40)                  ;B5C55D
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $07)       ;B5C561
    %AICMD0x10_End()                                           ;B5C566
pAIScripting0x47_HowToPlay_L003:
    %AICMD0x1A($00A8, $0118, aAIScriptingData_L002, $00)                     ;B5C567
    %AICMD0x13_Wait(75)                                        ;B5C56F
    %AICMD0x1B($018B, $00)                                     ;B5C572
    %AICMD0x0D($FF, $00, $10, $01)                             ;B5C576
    %AICMD0x13_Wait(60)                                        ;B5C57B
    %AICMD0x1B($0191, $00)                                     ;B5C57E
    %AICMD0x13_Wait(60)                                        ;B5C582
    %AICMD0x1B($018C, $00)                                     ;B5C585
    %AICMD0x13_Wait(680)                                       ;B5C589
    %AICMD0x1B($0191, $00)                                     ;B5C58C
    %AICMD0x13_Wait(60)                                        ;B5C590
    %AICMD0x1B($018C, $00)                                     ;B5C593
pAIScripting0x47_HowToPlay_L004:
    %AICMD0x13_Wait(1)                                         ;B5C597
    %AICMD0x12_Jump(pAIScripting0x47_HowToPlay_L004)                                   ;B5C59A
pAIScripting0x47_HowToPlay_L005:
    %AICMD0x1A($00A8, $00F8, aAIScriptingData_L002, $00)                     ;B5C59D
    %AICMD0x13_Wait(209)                                       ;B5C5A5
    %AICMD0x1B($018B, $00)                                     ;B5C5A8
    %AICMD0x0D($FF, $00, $10, $01)                             ;B5C5AC
    %AICMD0x13_Wait(60)                                        ;B5C5B1
    %AICMD0x1B($0191, $00)                                     ;B5C5B4
    %AICMD0x13_Wait(60)                                        ;B5C5B8
    %AICMD0x1B($018C, $00)                                     ;B5C5BB
    %AICMD0x13_Wait(120)                                       ;B5C5BF
    %AICMD0x1B($0191, $00)                                     ;B5C5C2
    %AICMD0x13_Wait(60)                                        ;B5C5C6
    %AICMD0x1B($018C, $00)                                     ;B5C5C9
pAIScripting0x47_HowToPlay_L006:
    %AICMD0x13_Wait(1)                                         ;B5C5CD
    %AICMD0x12_Jump(pAIScripting0x47_HowToPlay_L006)                                   ;B5C5D0


pAIScripting0x47_HowToPlay_Data19:
 
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $06)       ;B5C5D3
    %AICMD0x00_SetMusic($07, $B4)                              ;B5C5D8
    %AICMD0x02_FreezeTime()                                    ;B5C5DB
    %AICMD0x03_SetHour($07)                                    ;B5C5DC
    %AICMD0x05_SetTransferPosition(328, 360)                   ;B5C5DE
    %AICMD0x08_EnableAIControl()                               ;B5C5E3
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B5C5E4
    %AICMD0x47_SetValue8(nCurrentSeasonID, 2)                  ;B5C5E6
    %AICMD0x06_SetDestinationArea(!AREA_FARMFALL)              ;B5C5EB
    %AICMD0x38_WaitForFadeIn()                                               ;B5C5ED
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 7)                    ;B5C5EE
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 7)                   ;B5C5F2
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 55)                   ;B5C5F6
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 39)                  ;B5C5FA
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 16)                    ;B5C5FE
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $07)       ;B5C602
    %AICMD0x10_End()                                           ;B5C607


pAIScripting0x47_HowToPlay_Data20:
 
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $06)       ;B5C608
    %AICMD0x00_SetMusic($07, $B4)                              ;B5C60D
    %AICMD0x02_FreezeTime()                                    ;B5C610
    %AICMD0x03_SetHour($07)                                    ;B5C611
    %AICMD0x05_SetTransferPosition(128, 200)                   ;B5C613
    %AICMD0x08_EnableAIControl()                               ;B5C618
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B5C619
    %AICMD0x47_SetValue8(nCurrentSeasonID, 2)                  ;B5C61B
    %AICMD0x06_SetDestinationArea(!AREA_SHED)                  ;B5C620
    %AICMD0x38_WaitForFadeIn()                                               ;B5C622
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 64)                    ;B5C623
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 40)                  ;B5C627
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 8)                     ;B5C62B
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B5C62F
    %AICMD0x3E_SetCarryItem($34)                               ;B5C631
    %AICMD0x13_Wait(60)                                        ;B5C633
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 40)                 ;B5C636
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 32)                   ;B5C63A
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 16)                  ;B5C63E
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $07)       ;B5C642
    %AICMD0x10_End()                                           ;B5C647


pAIScripting0x47_HowToPlay_Data21:
 
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $06)       ;B5C648
    %AICMD0x00_SetMusic($07, $B4)                              ;B5C64D
    %AICMD0x02_FreezeTime()                                    ;B5C650
    %AICMD0x03_SetHour($07)                                    ;B5C651
    %AICMD0x05_SetTransferPosition(424, 488)                   ;B5C653
    %AICMD0x08_EnableAIControl()                               ;B5C658
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B5C659
    %AICMD0x47_SetValue8(nCurrentSeasonID, 2)                  ;B5C65B
    %AICMD0x06_SetDestinationArea(!AREA_FARMFALL)              ;B5C660
    %AICMD0x38_WaitForFadeIn()                                               ;B5C662
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 39)                   ;B5C663
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 55)                     ;B5C667
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 7)                    ;B5C66B
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 32)                    ;B5C66F
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $07)       ;B5C673
    %AICMD0x10_End()                                           ;B5C678


pAIScripting0x47_HowToPlay_Data22:
 
    %AICMD0x47_SetValue8(wram80(strcPlayerData.toolEquipped), 11)                          ;B5C679
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $06)       ;B5C67E
    %AICMD0x00_SetMusic($07, $B4)                              ;B5C683
    %AICMD0x02_FreezeTime()                                    ;B5C686
    %AICMD0x03_SetHour($07)                                    ;B5C687
    %AICMD0x05_SetTransferPosition(128, 360)                   ;B5C689
    %AICMD0x08_EnableAIControl()                               ;B5C68E
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B5C68F
    %AICMD0x09_StartScript($01, pAIScripting0x47_HowToPlay_L007)                                   ;B5C691
    %AICMD0x09_StartScript($02, pAIScripting0x47_HowToPlay_L008)                                   ;B5C695
    %AICMD0x47_SetValue8(nCurrentSeasonID, 2)                  ;B5C699
    %AICMD0x06_SetDestinationArea(!AREA_COWBARN)               ;B5C69E
    %AICMD0x38_WaitForFadeIn()                                               ;B5C6A0
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 15)                     ;B5C6A1
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 27)                  ;B5C6A5
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 71)                     ;B5C6A9
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 15)                  ;B5C6AD
    %AICMD0x3E_SetCarryItem($1A)                               ;B5C6B1
    %AICMD0x13_Wait(40)                                        ;B5C6B3
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 51)                   ;B5C6B6
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 33)                   ;B5C6BA
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B5C6BE
    %AICMD0x3F_ThrowCarriedItem()                              ;B5C6C0
    %AICMD0x13_Wait(60)                                        ;B5C6C1
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 31)                   ;B5C6C4
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 43)                  ;B5C6C8
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 15)                     ;B5C6CC
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B5C6D0
    %AICMD0x56_UseEquippedItem()                               ;B5C6D2
    %AICMD0x13_Wait(120)                                       ;B5C6D3
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 31)                   ;B5C6D6
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B5C6DA
    %AICMD0x56_UseEquippedItem()                               ;B5C6DC
    %AICMD0x13_Wait(120)                                       ;B5C6DD
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 4)                   ;B5C6E0
    %AICMD0x13_Wait(60)                                        ;B5C6E4
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 13)                   ;B5C6E7
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 7)                    ;B5C6EB
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 28)                   ;B5C6EF
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 7)                      ;B5C6F3
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B5C6F7
    %AICMD0x56_UseEquippedItem()                               ;B5C6F9
    %AICMD0x13_Wait(100)                                       ;B5C6FA
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 28)                  ;B5C6FD
    %AICMD0x56_UseEquippedItem()                               ;B5C701
    %AICMD0x13_Wait(120)                                       ;B5C702
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 15)                 ;B5C705
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 16)                  ;B5C709
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $07)       ;B5C70D
    %AICMD0x10_End()                                           ;B5C712
pAIScripting0x47_HowToPlay_L007:
    %AICMD0x1A($00A8, $0118, aAIScriptingData_L002, $00)                     ;B5C713
    %AICMD0x13_Wait(480)                                       ;B5C71B
    %AICMD0x1B($018B, $01)                                     ;B5C71E
    %AICMD0x0D($01, $00, $10, $01)                             ;B5C722
    %AICMD0x1B($018C, $01)                                     ;B5C727
    %AICMD0x13_Wait(120)                                       ;B5C72B
    %AICMD0x1B($019F, $00)                                     ;B5C72E
    %AICMD0x0D($00, $01, $30, $01)                             ;B5C732
    %AICMD0x1B($019E, $00)                                     ;B5C737
    %AICMD0x13_Wait(30)                                        ;B5C73B
    %AICMD0x1B($018B, $00)                                     ;B5C73E
    %AICMD0x0D($FF, $00, $20, $01)                             ;B5C742
    %AICMD0x1B($018C, $00)                                     ;B5C747
    %AICMD0x13_Wait(120)                                       ;B5C74B
    %AICMD0x1B($018B, $00)                                     ;B5C74E
    %AICMD0x0D($FF, $00, $18, $01)                             ;B5C752
    %AICMD0x1B($018C, $00)                                     ;B5C757
    %AICMD0x13_Wait(120)                                       ;B5C75B
    %AICMD0x1B($019F, $00)                                     ;B5C75E
    %AICMD0x0D($00, $01, $24, $01)                             ;B5C762
    %AICMD0x37()                                               ;B5C767
    %AICMD0x10_End()                                           ;B5C768
pAIScripting0x47_HowToPlay_L008:
    %AICMD0x1A($00A8, $00F8, aAIScriptingData_L002, $00)                     ;B5C769
    %AICMD0x13_Wait(480)                                       ;B5C771
    %AICMD0x1B($019F, $00)                                     ;B5C774
    %AICMD0x13_Wait(240)                                       ;B5C778
    %AICMD0x1B($019E, $00)                                     ;B5C77B
    %AICMD0x13_Wait(120)                                       ;B5C77F
    %AICMD0x1B($019F, $00)                                     ;B5C782
    %AICMD0x13_Wait(240)                                       ;B5C786
    %AICMD0x1B($019E, $00)                                     ;B5C789
pAIScripting0x47_HowToPlay_L009:
    %AICMD0x13_Wait(1)                                         ;B5C78D
    %AICMD0x12_Jump(pAIScripting0x47_HowToPlay_L009)                                   ;B5C790


pAIScripting0x47_HowToPlay_Data23:
 
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $06)       ;B5C793
    %AICMD0x00_SetMusic($07, $B4)                              ;B5C798
    %AICMD0x02_FreezeTime()                                    ;B5C79B
    %AICMD0x03_SetHour($07)                                    ;B5C79C
    %AICMD0x05_SetTransferPosition(328, 360)                   ;B5C79E
    %AICMD0x08_EnableAIControl()                               ;B5C7A3
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B5C7A4
    %AICMD0x09_StartScript($01, pAIScripting0x47_HowToPlay_L010)                                   ;B5C7A6
    %AICMD0x47_SetValue8(nCurrentSeasonID, 2)                  ;B5C7AA
    %AICMD0x06_SetDestinationArea(!AREA_FARMFALL)              ;B5C7AF
    %AICMD0x38_WaitForFadeIn()                                               ;B5C7B1
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 15)                  ;B5C7B2
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 63)                  ;B5C7B6
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 32)                    ;B5C7BA
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $07)       ;B5C7BE
    %AICMD0x10_End()                                           ;B5C7C3
pAIScripting0x47_HowToPlay_L010:
    %AICMD0x1A($0148, $0178, aAIScriptingData_L003, $00)                     ;B5C7C4
    %AICMD0x13_Wait(2)                                         ;B5C7CC
    %AICMD0x0D($00, $01, $20, $01)                             ;B5C7CF
    %AICMD0x1B($019E, $00)                                     ;B5C7D4
pAIScripting0x47_HowToPlay_L011:
    %AICMD0x13_Wait(1)                                         ;B5C7D8
    %AICMD0x12_Jump(pAIScripting0x47_HowToPlay_L011)                                   ;B5C7DB


pAIScripting0x47_HowToPlay_Data24:
 
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $06)       ;B5C7DE
    %AICMD0x00_SetMusic($07, $B4)                              ;B5C7E3
    %AICMD0x02_FreezeTime()                                    ;B5C7E6
    %AICMD0x03_SetHour($07)                                    ;B5C7E7
    %AICMD0x05_SetTransferPosition(128, 200)                   ;B5C7E9
    %AICMD0x08_EnableAIControl()                               ;B5C7EE
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B5C7EF
    %AICMD0x23_OrWithIndexedValue(nEggInCoopFlags, $04)        ;B5C7F1
    %AICMD0x23_OrWithIndexedValue(nEggInCoopFlags, $05)        ;B5C7F6
    %AICMD0x09_StartScript($01, pAIScripting0x47_HowToPlay_L012)                                   ;B5C7FB
    %AICMD0x09_StartScript($02, pAIScripting0x47_HowToPlay_L014)                                   ;B5C7FF
    %AICMD0x47_SetValue8(nCurrentSeasonID, 2)                  ;B5C803
    %AICMD0x06_SetDestinationArea(!AREA_COOP)                  ;B5C808
    %AICMD0x38_WaitForFadeIn()                                               ;B5C80A
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 11)                   ;B5C80B
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 7)                      ;B5C80F
    %AICMD0x3E_SetCarryItem($14)                               ;B5C813
    %AICMD0x13_Wait(40)                                        ;B5C815
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 7)                    ;B5C818
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 31)                   ;B5C81C
    %AICMD0x3F_ThrowCarriedItem()                              ;B5C820
    %AICMD0x13_Wait(60)                                        ;B5C821
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 39)                  ;B5C824
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 23)                     ;B5C828
    %AICMD0x3E_SetCarryItem($14)                               ;B5C82C
    %AICMD0x13_Wait(40)                                        ;B5C82E
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 15)                   ;B5C831
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 47)                  ;B5C835
    %AICMD0x3F_ThrowCarriedItem()                              ;B5C839
    %AICMD0x13_Wait(60)                                        ;B5C83A
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 63)                   ;B5C83D
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 35)                     ;B5C841
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 23)                   ;B5C845
    %AICMD0x3E_SetCarryItem($1A)                               ;B5C849
    %AICMD0x13_Wait(40)                                        ;B5C84B
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 7)                   ;B5C84E
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 23)                     ;B5C852
    %AICMD0x3F_ThrowCarriedItem()                              ;B5C856
    %AICMD0x13_Wait(60)                                        ;B5C857
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 23)                   ;B5C85A
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 7)                    ;B5C85E
    %AICMD0x3E_SetCarryItem($1A)                               ;B5C862
    %AICMD0x13_Wait(40)                                        ;B5C864
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 15)                  ;B5C867
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 23)                     ;B5C86B
    %AICMD0x3F_ThrowCarriedItem()                              ;B5C86F
    %AICMD0x13_Wait(60)                                        ;B5C870
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 51)                   ;B5C873
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 27)                  ;B5C877
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 48)                  ;B5C87B
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $07)       ;B5C87F
    %AICMD0x10_End()                                           ;B5C884
pAIScripting0x47_HowToPlay_L012:
    %AICMD0x1A($00A8, $0078, aAIScriptingData_L008, $00)                     ;B5C885
    %AICMD0x22($10, $10, $01, aAIScriptingData_L008, $08)                    ;B5C88D
pAIScripting0x47_HowToPlay_L013:
    %AICMD0x13_Wait(1)                                         ;B5C894
    %AICMD0x12_Jump(pAIScripting0x47_HowToPlay_L013)                                   ;B5C897
pAIScripting0x47_HowToPlay_L014:
    %AICMD0x1A($00C8, $0068, aAIScriptingData_L008, $00)                     ;B5C89A
    %AICMD0x22($10, $10, $01, aAIScriptingData_L008, $08)                    ;B5C8A2
pAIScripting0x47_HowToPlay_L015:
    %AICMD0x13_Wait(1)                                         ;B5C8A9
    %AICMD0x12_Jump(pAIScripting0x47_HowToPlay_L015)                                   ;B5C8AC


pAIScripting0x47_HowToPlay_Data25:
 
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $06)       ;B5C8AF
    %AICMD0x00_SetMusic($07, $B4)                              ;B5C8B4
    %AICMD0x02_FreezeTime()                                    ;B5C8B7
    %AICMD0x03_SetHour($07)                                    ;B5C8B8
    %AICMD0x05_SetTransferPosition(456, 360)                   ;B5C8BA
    %AICMD0x08_EnableAIControl()                               ;B5C8BF
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B5C8C0
    %AICMD0x09_StartScript($01, pAIScripting0x47_HowToPlay_L016)                                   ;B5C8C2
    %AICMD0x47_SetValue8(nCurrentSeasonID, 2)                  ;B5C8C6
    %AICMD0x06_SetDestinationArea(!AREA_FARMFALL)              ;B5C8CB
    %AICMD0x38_WaitForFadeIn()                                               ;B5C8CD
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 7)                    ;B5C8CE
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 159)                  ;B5C8D2
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 40)                    ;B5C8D6
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $07)       ;B5C8DA
    %AICMD0x10_End()                                           ;B5C8DF
pAIScripting0x47_HowToPlay_L016:
    %AICMD0x1A($0148, $0198, aAIScriptingData_L002, $00)                     ;B5C8E0
pAIScripting0x47_HowToPlay_L017:
    %AICMD0x13_Wait(1)                                         ;B5C8E8
    %AICMD0x12_Jump(pAIScripting0x47_HowToPlay_L017)                                   ;B5C8EB


pAIScripting0x47_HowToPlay_Data26:
 
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $06)       ;B5C8EE
    %AICMD0x00_SetMusic($03, $B4)                              ;B5C8F3
    %AICMD0x02_FreezeTime()                                    ;B5C8F6
    %AICMD0x03_SetHour($07)                                    ;B5C8F7
    %AICMD0x05_SetTransferPosition(264, 312)                   ;B5C8F9
    %AICMD0x08_EnableAIControl()                               ;B5C8FE
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B5C8FF
    %AICMD0x09_StartScript($01, pAIScripting0x47_HowToPlay_L018)                                   ;B5C901
    %AICMD0x09_StartScript($03, pAIScripting0x47_HowToPlay_L020)                                   ;B5C905
    %AICMD0x09_StartScript($06, pAIScripting0x47_HowToPlay_L022)                                   ;B5C909
    %AICMD0x09_StartScript($07, pAIScripting0x47_HowToPlay_L024)                                   ;B5C90D
    %AICMD0x09_StartScript($0B, pAIScripting0x47_HowToPlay_L026)                                   ;B5C911
    %AICMD0x09_StartScript($0D, pAIScripting0x47_HowToPlay_L028)                                   ;B5C915
    %AICMD0x09_StartScript($0E, pAIScripting0x47_HowToPlay_L030)                                   ;B5C919
    %AICMD0x09_StartScript($0F, pAIScripting0x47_HowToPlay_L032)                                   ;B5C91D
    %AICMD0x09_StartScript($10, pAIScripting0x47_HowToPlay_L034)                                   ;B5C921
    %AICMD0x09_StartScript($11, pAIScripting0x47_HowToPlay_L036)                                   ;B5C925
    %AICMD0x09_StartScript($12, pAIScripting0x47_HowToPlay_L038)                                   ;B5C929
    %AICMD0x09_StartScript($13, pAIScripting0x47_HowToPlay_L040)                                   ;B5C92D
    %AICMD0x47_SetValue8(nCurrentSeasonID, 2)                  ;B5C931
    %AICMD0x3B($01)                                            ;B5C936
    %AICMD0x06_SetDestinationArea(!AREA_DANCINGS2)             ;B5C938
    %AICMD0x38_WaitForFadeIn()                                               ;B5C93A
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 64)                    ;B5C93B
    %AICMD0x54_ShowDialog($0241, $00)                          ;B5C93F
    %AICMD0x47_SetValue8($80019A, 4)                           ;B5C943
    %AICMD0x40_DisableTileInteractions()                       ;B5C948
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 16)                    ;B5C949
    %AICMD0x13_Wait(60)                                        ;B5C94D
    %AICMD0x3D_TeleportToArea(!AREA_INTRO)                     ;B5C950
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $07)       ;B5C952
    %AICMD0x10_End()                                           ;B5C957
pAIScripting0x47_HowToPlay_L018:
    %AICMD0x1A($0198, $00C8, aAIScriptingData_L064, $00)                     ;B5C958
pAIScripting0x47_HowToPlay_L019:
    %AICMD0x13_Wait(1)                                         ;B5C960
    %AICMD0x12_Jump(pAIScripting0x47_HowToPlay_L019)                                   ;B5C963
pAIScripting0x47_HowToPlay_L020:
    %AICMD0x1A($0078, $00F8, aAIScriptingData_L061, $02)                     ;B5C966
pAIScripting0x47_HowToPlay_L021:
    %AICMD0x13_Wait(1)                                         ;B5C96E
    %AICMD0x12_Jump(pAIScripting0x47_HowToPlay_L021)                                   ;B5C971
pAIScripting0x47_HowToPlay_L022:
    %AICMD0x1A($0168, $0108, aAIScriptingData_L067, $01)                     ;B5C974
pAIScripting0x47_HowToPlay_L023:
    %AICMD0x13_Wait(1)                                         ;B5C97C
    %AICMD0x12_Jump(pAIScripting0x47_HowToPlay_L023)                                   ;B5C97F
pAIScripting0x47_HowToPlay_L024:
    %AICMD0x1A($0148, $0158, aAIScriptingData_L055, $01)                     ;B5C982
pAIScripting0x47_HowToPlay_L025:
    %AICMD0x13_Wait(1)                                         ;B5C98A
    %AICMD0x12_Jump(pAIScripting0x47_HowToPlay_L025)                                   ;B5C98D
pAIScripting0x47_HowToPlay_L026:
    %AICMD0x1A($0058, $00E8, aAIScriptingData_L044, $02)                     ;B5C990
pAIScripting0x47_HowToPlay_L027:
    %AICMD0x13_Wait(1)                                         ;B5C998
    %AICMD0x12_Jump(pAIScripting0x47_HowToPlay_L027)                                   ;B5C99B
pAIScripting0x47_HowToPlay_L028:
    %AICMD0x1A($00C8, $0158, aAIScriptingData_L011, $02)                     ;B5C99E
pAIScripting0x47_HowToPlay_L029:
    %AICMD0x13_Wait(1)                                         ;B5C9A6
    %AICMD0x12_Jump(pAIScripting0x47_HowToPlay_L029)                                   ;B5C9A9
pAIScripting0x47_HowToPlay_L030:
    %AICMD0x1A($0098, $0068, aAIScriptingData_L015, $00)                     ;B5C9AC
pAIScripting0x47_HowToPlay_L031:
    %AICMD0x13_Wait(1)                                         ;B5C9B4
    %AICMD0x12_Jump(pAIScripting0x47_HowToPlay_L031)                                   ;B5C9B7
pAIScripting0x47_HowToPlay_L032:
    %AICMD0x1A($0148, $00A8, aAIScriptingData_L019, $00)                     ;B5C9BA
pAIScripting0x47_HowToPlay_L033:
    %AICMD0x13_Wait(1)                                         ;B5C9C2
    %AICMD0x12_Jump(pAIScripting0x47_HowToPlay_L033)                                   ;B5C9C5
pAIScripting0x47_HowToPlay_L034:
    %AICMD0x1A($0108, $0098, aAIScriptingData_L021, $00)                     ;B5C9C8
pAIScripting0x47_HowToPlay_L035:
    %AICMD0x13_Wait(1)                                         ;B5C9D0
    %AICMD0x12_Jump(pAIScripting0x47_HowToPlay_L035)                                   ;B5C9D3
pAIScripting0x47_HowToPlay_L036:
    %AICMD0x1A($00B8, $0098, aAIScriptingData_L024, $00)                     ;B5C9D6
pAIScripting0x47_HowToPlay_L037:
    %AICMD0x13_Wait(1)                                         ;B5C9DE
    %AICMD0x12_Jump(pAIScripting0x47_HowToPlay_L037)                                   ;B5C9E1
pAIScripting0x47_HowToPlay_L038:
    %AICMD0x1A($0108, $00B8, aAIScriptingData_L193, $00)                     ;B5C9E4
pAIScripting0x47_HowToPlay_L039:
    %AICMD0x13_Wait(1)                                         ;B5C9EC
    %AICMD0x12_Jump(pAIScripting0x47_HowToPlay_L039)                                   ;B5C9EF
pAIScripting0x47_HowToPlay_L040:
    %AICMD0x1A($00B8, $0108, aAIScriptingData_L050, $00)                     ;B5C9F2
pAIScripting0x47_HowToPlay_L041:
    %AICMD0x13_Wait(1)                                         ;B5C9FA
    %AICMD0x12_Jump(pAIScripting0x47_HowToPlay_L041)                                   ;B5C9FD


pAIScripting0x47_HowToPlay_Data27:
 
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $06)       ;B5CA00
    %AICMD0x00_SetMusic($04, $B4)                              ;B5CA05
    %AICMD0x02_FreezeTime()                                    ;B5CA08
    %AICMD0x03_SetHour($07)                                    ;B5CA09
    %AICMD0x05_SetTransferPosition(136, 344)                   ;B5CA0B
    %AICMD0x08_EnableAIControl()                               ;B5CA10
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B5CA11
    %AICMD0x47_SetValue8(nCurrentSeasonID, 3)                  ;B5CA13
    %AICMD0x06_SetDestinationArea(!AREA_FARMWINTER)            ;B5CA18
    %AICMD0x38_WaitForFadeIn()                                               ;B5CA1A
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 31)                  ;B5CA1B
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 23)                   ;B5CA1F
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 47)                   ;B5CA23
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 7)                    ;B5CA27
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 47)                  ;B5CA2B
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 7)                    ;B5CA2F
    %AICMD0x3A_RunForTime(!AIINPUT_LEFT, 64)                   ;B5CA33
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $07)       ;B5CA37
    %AICMD0x10_End()                                           ;B5CA3C


pAIScripting0x47_HowToPlay_Data28:
 
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $06)       ;B5CA3D
    %AICMD0x00_SetMusic($05, $B4)                              ;B5CA42
    %AICMD0x02_FreezeTime()                                    ;B5CA45
    %AICMD0x03_SetHour($07)                                    ;B5CA46
    %AICMD0x05_SetTransferPosition(280, 872)                   ;B5CA48
    %AICMD0x08_EnableAIControl()                               ;B5CA4D
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B5CA4E
    %AICMD0x3B($06)                                            ;B5CA50
    %AICMD0x09_StartScript($01, pAIScripting0x47_HowToPlay_L042)                                   ;B5CA52
    %AICMD0x09_StartScript($02, pAIScripting0x47_HowToPlay_L044)                                   ;B5CA56
    %AICMD0x47_SetValue8(nCurrentSeasonID, 3)                  ;B5CA5A
    %AICMD0x06_SetDestinationArea(!AREA_TOWNWINTER)            ;B5CA5F
    %AICMD0x38_WaitForFadeIn()                                               ;B5CA61
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 15)                  ;B5CA62
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 87)                 ;B5CA66
    %AICMD0x3F_ThrowCarriedItem()                              ;B5CA6A
    %AICMD0x13_Wait(60)                                        ;B5CA6B
    %AICMD0x3D_TeleportToArea(!AREA_INTRO)                     ;B5CA6E
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $07)       ;B5CA70
    %AICMD0x10_End()                                           ;B5CA75
pAIScripting0x47_HowToPlay_L042:
    %AICMD0x1A($0178, $0378, aAIScriptingData_L015, $00)                     ;B5CA76
    %AICMD0x13_Wait(110)                                       ;B5CA7E
    %AICMD0x1B($022A, $00)                                     ;B5CA81
    %AICMD0x54_ShowDialog($03B2, $00)                          ;B5CA85
    %AICMD0x47_SetValue8($80019A, 4)                           ;B5CA89
pAIScripting0x47_HowToPlay_L043:
    %AICMD0x13_Wait(1)                                         ;B5CA8E
    %AICMD0x12_Jump(pAIScripting0x47_HowToPlay_L043)                                   ;B5CA91
pAIScripting0x47_HowToPlay_L044:
    %AICMD0x1A($01A8, $0328, aAIScriptingData_L136, $00)                     ;B5CA94
pAIScripting0x47_HowToPlay_L045:
    %AICMD0x13_Wait(1)                                         ;B5CA9C
    %AICMD0x12_Jump(pAIScripting0x47_HowToPlay_L045)                                   ;B5CA9F


pAIScripting0x47_HowToPlay_Data29:
 
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $06)       ;B5CAA2
    %AICMD0x47_SetValue8(wram80(strcPlayerData.toolEquipped), 4)                           ;B5CAA7
    %AICMD0x00_SetMusic($06, $B4)                              ;B5CAAC
    %AICMD0x02_FreezeTime()                                    ;B5CAAF
    %AICMD0x03_SetHour($07)                                    ;B5CAB0
    %AICMD0x05_SetTransferPosition(488, 216)                   ;B5CAB2
    %AICMD0x08_EnableAIControl()                               ;B5CAB7
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B5CAB8
    %AICMD0x47_SetValue8(nCurrentSeasonID, 3)                  ;B5CABA
    %AICMD0x06_SetDestinationArea(!AREA_WOODSWINTER)           ;B5CABF
    %AICMD0x38_WaitForFadeIn()                                               ;B5CAC1
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 41)                  ;B5CAC2
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 7)                      ;B5CAC6
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 7)                   ;B5CACA
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 31)                     ;B5CACE
    %AICMD0x56_UseEquippedItem()                               ;B5CAD2
    %AICMD0x13_Wait(60)                                        ;B5CAD3
    %AICMD0x56_UseEquippedItem()                               ;B5CAD6
    %AICMD0x13_Wait(60)                                        ;B5CAD7
    %AICMD0x56_UseEquippedItem()                               ;B5CADA
    %AICMD0x13_Wait(60)                                        ;B5CADB
    %AICMD0x56_UseEquippedItem()                               ;B5CADE
    %AICMD0x13_Wait(60)                                        ;B5CADF
    %AICMD0x56_UseEquippedItem()                               ;B5CAE2
    %AICMD0x13_Wait(60)                                        ;B5CAE3
    %AICMD0x56_UseEquippedItem()                               ;B5CAE6
    %AICMD0x13_Wait(60)                                        ;B5CAE7
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 23)                     ;B5CAEA
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B5CAEE
    %AICMD0x56_UseEquippedItem()                               ;B5CAF0
    %AICMD0x13_Wait(60)                                        ;B5CAF1
    %AICMD0x56_UseEquippedItem()                               ;B5CAF4
    %AICMD0x13_Wait(60)                                        ;B5CAF5
    %AICMD0x56_UseEquippedItem()                               ;B5CAF8
    %AICMD0x13_Wait(60)                                        ;B5CAF9
    %AICMD0x56_UseEquippedItem()                               ;B5CAFC
    %AICMD0x13_Wait(60)                                        ;B5CAFD
    %AICMD0x56_UseEquippedItem()                               ;B5CB00
    %AICMD0x13_Wait(60)                                        ;B5CB01
    %AICMD0x56_UseEquippedItem()                               ;B5CB04
    %AICMD0x13_Wait(60)                                        ;B5CB05
    %AICMD0x13_Wait(60)                                        ;B5CB08
    %AICMD0x3D_TeleportToArea(!AREA_INTRO)                     ;B5CB0B
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $07)       ;B5CB0D
    %AICMD0x10_End()                                           ;B5CB12


pAIScripting0x47_HowToPlay_Data30:
 
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $06)       ;B5CB13
    %AICMD0x00_SetMusic($01, $B4)                              ;B5CB18
    %AICMD0x02_FreezeTime()                                    ;B5CB1B
    %AICMD0x03_SetHour($07)                                    ;B5CB1C
    %AICMD0x05_SetTransferPosition(24, 456)                    ;B5CB1E
    %AICMD0x08_EnableAIControl()                               ;B5CB23
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B5CB24
    %AICMD0x09_StartScript($01, pAIScripting0x47_HowToPlay_L046)                                   ;B5CB26
    %AICMD0x47_SetValue8(nCurrentSeasonID, 0)                  ;B5CB2A
    %AICMD0x06_SetDestinationArea(!AREA_FARMSPRING)            ;B5CB2F
    %AICMD0x38_WaitForFadeIn()                                               ;B5CB31
    %AICMD0x3A_RunForTime(!AIINPUT_RIGHT, 53)                  ;B5CB32
    %AICMD0x3A_RunForTime(!AIINPUT_UP, 39)                     ;B5CB36
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B5CB3A
    %AICMD0x32_SetValue16($8000D4, $001B)                                 ;B5CB3C
    %AICMD0x13_Wait(240)                                       ;B5CB42
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily2, $02)       ;B5CB45
    %AICMD0x10_End()                                           ;B5CB4A
pAIScripting0x47_HowToPlay_L046:
    %AICMD0x1A($00D8, $0178, aAIScriptingData_L004, $03)                     ;B5CB4B
    %AICMD0x13_Wait(160)                                       ;B5CB53
    %AICMD0x1B($01EC, $00)                                     ;B5CB56
    %AICMD0x0D($FF, $00, $44, $01)                             ;B5CB5A
    %AICMD0x1B($01E8, $00)                                     ;B5CB5F
pAIScripting0x47_HowToPlay_L047:
    %AICMD0x13_Wait(1)                                         ;B5CB63
    %AICMD0x12_Jump(pAIScripting0x47_HowToPlay_L047)                                   ;B5CB66


pAIScripting0x47_HowToPlay_Data31:
 
    %AICMD0x10_End()                                           ;B5CB69


    pad $B5FFFF
