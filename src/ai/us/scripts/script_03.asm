

    incsrc "../../../../build/gen/ai/slots_03.asm"
 
pAIScripting0x03_Data01:
 
    %AICMD0x11_EnableUserControl()                             ;B3BA59
    %AICMD0x09_StartScript($01, pAIScripting0x03_L011)                                   ;B3BA5A
    %AICMD0x09_StartScript($02, pAIScripting0x03_L024)                                   ;B3BA5E
    %AICMD0x09_StartScript($03, pAIScripting0x03_L032)                                   ;B3BA62
    %AICMD0x09_StartScript($04, pAIScripting0x03_L040)                                   ;B3BA66
    %AICMD0x09_StartScript($05, pAIScripting0x03_L050)                                   ;B3BA6A
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $06, pAIScripting0x03_L003)   ;B3BA6E
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $06, pAIScripting0x03_L001)   ;B3BA75
    %AICMD0x12_Jump(pAIScripting0x03_L003)                                   ;B3BA7C
pAIScripting0x03_L001:
    %AICMD0x45_JumpIfBetween16(nLove_Maria, 250, 999, pAIScripting0x03_L002) ;B3BA7F
    %AICMD0x45_JumpIfBetween16(nLove_Ann, 250, 999, pAIScripting0x03_L002)   ;B3BA89
    %AICMD0x45_JumpIfBetween16(nLove_Nina, 250, 999, pAIScripting0x03_L002)  ;B3BA93
    %AICMD0x45_JumpIfBetween16(nLove_Ellen, 250, 999, pAIScripting0x03_L002) ;B3BA9D
    %AICMD0x45_JumpIfBetween16(nLove_Eve, 250, 999, pAIScripting0x03_L002)   ;B3BAA7
    %AICMD0x12_Jump(pAIScripting0x03_L003)                                   ;B3BAB1
pAIScripting0x03_L002:
    %AICMD0x09_StartScript($06, pAIScripting0x03_L004)                                   ;B3BAB4
pAIScripting0x03_L003:
    %AICMD0x13_Wait(1)                                         ;B3BAB8
    %AICMD0x12_Jump(pAIScripting0x03_L003)                                   ;B3BABB
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $04, pAIScripting0x03_L149)   ;B3BABE
pAIScripting0x03_L004:
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 17, 18, pAIScripting0x03_L010) ;B3BAC5
    %AICMD0x1A($0238, $0168, aAIScriptingData_L192, $00)                     ;B3BACD
pAIScripting0x03_L005:
    %AICMD0x1F(pAIScripting0x03_L006)                                        ;B3BAD5
    %AICMD0x12_Jump(pAIScripting0x03_L005)                                   ;B3BAD8
pAIScripting0x03_L006:
    %AICMD0x1D_ShowDialog($01C3, $00)                          ;B3BADB
    %AICMD0x20_JumpIfChoice(0, pAIScripting0x03_L007)                        ;B3BADF
    %AICMD0x20_JumpIfChoice(1, pAIScripting0x03_L008)                        ;B3BAE3
pAIScripting0x03_L007:
    %AICMD0x46_JumpIfBetween24(nMoney, 0, 99, pAIScripting0x03_L009)         ;B3BAE7
    %AICMD0x1C_ShowDialog($01C4, $00)                          ;B3BAF3
    %AICMD0x42_AddValue24(nMoney, -100)                        ;B3BAF7
    %AICMD0x37()                                               ;B3BAFE
    %AICMD0x23_OrWithIndexedValue(strcFlags.event5, $06)       ;B3BAFF
    %AICMD0x23_OrWithIndexedValue(strcShedItems.row3, $07)     ;B3BB04
    %AICMD0x10_End()                                           ;B3BB09
pAIScripting0x03_L008:
    %AICMD0x1C_ShowDialog($01C5, $00)                          ;B3BB0A
    %AICMD0x12_Jump(pAIScripting0x03_L005)                                   ;B3BB0E
pAIScripting0x03_L009:
    %AICMD0x1C_ShowDialog($02FF, $00)                          ;B3BB11
    %AICMD0x12_Jump(pAIScripting0x03_L005)                                   ;B3BB15
pAIScripting0x03_L010:
    %AICMD0x10_End()                                           ;B3BB18
pAIScripting0x03_L011:
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 17, 18, pAIScripting0x03_L017) ;B3BB19
    %AICMD0x1A($0248, $0268, aAIScriptingData_L042, $00)                     ;B3BB21
pAIScripting0x03_L012:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x03_L013)                                        ;B3BB29
    %AICMD0x2D_JumpOnInteract(pAIScripting0x03_L016, pAIScripting0x03_L014)                               ;B3BB2C
    %AICMD0x12_Jump(pAIScripting0x03_L012)                                   ;B3BB31
pAIScripting0x03_L013:
    %AICMD0x1C_ShowDialog($01CA, $00)                          ;B3BB34
    %AICMD0x12_Jump(pAIScripting0x03_L012)                                   ;B3BB38
pAIScripting0x03_L014:
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 9, 12, pAIScripting0x03_L015)         ;B3BB3B
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3BB43
    %AICMD0x12_Jump(pAIScripting0x03_L012)                                   ;B3BB47
pAIScripting0x03_L015:
    %AICMD0x1C_ShowDialog($03BB, $00)                          ;B3BB4A
    %AICMD0x12_Jump(pAIScripting0x03_L012)                                   ;B3BB4E
pAIScripting0x03_L016:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event4, $0C, pAIScripting0x03_L020)   ;B3BB51
    %AICMD0x14_JumpIfFlagSet(strcFlags.event4, $0E, pAIScripting0x03_L021)   ;B3BB58
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $00, pAIScripting0x03_L022)   ;B3BB5F
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $02, pAIScripting0x03_L023)   ;B3BB66
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 7, 16, pAIScripting0x03_L018)  ;B3BB6D
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 17, 18, pAIScripting0x03_L019) ;B3BB75
    %AICMD0x12_Jump(pAIScripting0x03_L012)                                   ;B3BB7D
pAIScripting0x03_L017:
    %AICMD0x10_End()                                           ;B3BB80
pAIScripting0x03_L018:
    %AICMD0x1C_ShowDialog($0061, $00)                          ;B3BB81
    %AICMD0x12_Jump(pAIScripting0x03_L012)                                   ;B3BB85
pAIScripting0x03_L019:
    %AICMD0x1C_ShowDialog($0392, $00)                          ;B3BB88
    %AICMD0x12_Jump(pAIScripting0x03_L012)                                   ;B3BB8C
pAIScripting0x03_L020:
    %AICMD0x1C_ShowDialog($01D1, $00)                          ;B3BB8F
    %AICMD0x1B($0288, $00)                                     ;B3BB93
    %AICMD0x12_Jump(pAIScripting0x03_L012)                                   ;B3BB97
pAIScripting0x03_L021:
    %AICMD0x1C_ShowDialog($01DD, $00)                          ;B3BB9A
    %AICMD0x1B($0288, $00)                                     ;B3BB9E
    %AICMD0x12_Jump(pAIScripting0x03_L012)                                   ;B3BBA2
pAIScripting0x03_L022:
    %AICMD0x1C_ShowDialog($01E6, $00)                          ;B3BBA5
    %AICMD0x1B($0288, $00)                                     ;B3BBA9
    %AICMD0x12_Jump(pAIScripting0x03_L012)                                   ;B3BBAD
pAIScripting0x03_L023:
    %AICMD0x1C_ShowDialog($01EF, $00)                          ;B3BBB0
    %AICMD0x1B($0288, $00)                                     ;B3BBB4
    %AICMD0x12_Jump(pAIScripting0x03_L012)                                   ;B3BBB8
pAIScripting0x03_L024:
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 17, 18, pAIScripting0x03_L029) ;B3BBBB
    %AICMD0x1A($0248, $0168, aAIScriptingData_L057, $00)                     ;B3BBC3
pAIScripting0x03_L025:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x03_L026)                                        ;B3BBCB
    %AICMD0x2D_JumpOnInteract(pAIScripting0x03_L028, pAIScripting0x03_L027)                               ;B3BBCE
    %AICMD0x12_Jump(pAIScripting0x03_L025)                                   ;B3BBD3
pAIScripting0x03_L026:
    %AICMD0x1C_ShowDialog($01C5, $00)                          ;B3BBD6
    %AICMD0x12_Jump(pAIScripting0x03_L025)                                   ;B3BBDA
pAIScripting0x03_L027:
    %AICMD0x1C_ShowDialog($03BD, $00)                          ;B3BBDD
    %AICMD0x12_Jump(pAIScripting0x03_L025)                                   ;B3BBE1
pAIScripting0x03_L028:
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 7, 16, pAIScripting0x03_L030)  ;B3BBE4
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 17, 18, pAIScripting0x03_L031) ;B3BBEC
    %AICMD0x12_Jump(pAIScripting0x03_L025)                                   ;B3BBF4
pAIScripting0x03_L029:
    %AICMD0x10_End()                                           ;B3BBF7
pAIScripting0x03_L030:
    %AICMD0x1C_ShowDialog($0078, $00)                          ;B3BBF8
    %AICMD0x12_Jump(pAIScripting0x03_L025)                                   ;B3BBFC
pAIScripting0x03_L031:
    %AICMD0x1C_ShowDialog($0081, $00)                          ;B3BBFF
    %AICMD0x12_Jump(pAIScripting0x03_L025)                                   ;B3BC03
pAIScripting0x03_L032:
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 17, 18, pAIScripting0x03_L037) ;B3BC06
    %AICMD0x1A($00A8, $0188, aAIScriptingData_L050, $00)                     ;B3BC0E
pAIScripting0x03_L033:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x03_L034)                                        ;B3BC16
    %AICMD0x2D_JumpOnInteract(pAIScripting0x03_L036, pAIScripting0x03_L035)                               ;B3BC19
    %AICMD0x12_Jump(pAIScripting0x03_L033)                                   ;B3BC1E
pAIScripting0x03_L034:
    %AICMD0x1C_ShowDialog($01C8, $00)                          ;B3BC21
    %AICMD0x12_Jump(pAIScripting0x03_L033)                                   ;B3BC25
pAIScripting0x03_L035:
    %AICMD0x1C_ShowDialog($03BC, $00)                          ;B3BC28
    %AICMD0x12_Jump(pAIScripting0x03_L033)                                   ;B3BC2C
pAIScripting0x03_L036:
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 7, 16, pAIScripting0x03_L038)  ;B3BC2F
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 17, 18, pAIScripting0x03_L039) ;B3BC37
    %AICMD0x12_Jump(pAIScripting0x03_L033)                                   ;B3BC3F
pAIScripting0x03_L037:
    %AICMD0x10_End()                                           ;B3BC42
pAIScripting0x03_L038:
    %AICMD0x1C_ShowDialog($0053, $00)                          ;B3BC43
    %AICMD0x12_Jump(pAIScripting0x03_L033)                                   ;B3BC47
pAIScripting0x03_L039:
    %AICMD0x1C_ShowDialog($0051, $00)                          ;B3BC4A
    %AICMD0x12_Jump(pAIScripting0x03_L033)                                   ;B3BC4E
pAIScripting0x03_L040:
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 17, 18, pAIScripting0x03_L046) ;B3BC51
    %AICMD0x1A($0128, $0208, aAIScriptingData_L034, $00)                     ;B3BC59
pAIScripting0x03_L041:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x03_L042)                                        ;B3BC61
    %AICMD0x2D_JumpOnInteract(pAIScripting0x03_L045, pAIScripting0x03_L043)                               ;B3BC64
    %AICMD0x12_Jump(pAIScripting0x03_L041)                                   ;B3BC69
pAIScripting0x03_L042:
    %AICMD0x1C_ShowDialog($01E0, $00)                          ;B3BC6C
    %AICMD0x12_Jump(pAIScripting0x03_L041)                                   ;B3BC70
pAIScripting0x03_L043:
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 9, 12, pAIScripting0x03_L044)         ;B3BC73
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3BC7B
    %AICMD0x12_Jump(pAIScripting0x03_L041)                                   ;B3BC7F
pAIScripting0x03_L044:
    %AICMD0x1C_ShowDialog($03B8, $00)                          ;B3BC82
    %AICMD0x12_Jump(pAIScripting0x03_L041)                                   ;B3BC86
pAIScripting0x03_L045:
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 7, 16, pAIScripting0x03_L047)  ;B3BC89
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 17, 18, pAIScripting0x03_L049) ;B3BC91
    %AICMD0x12_Jump(pAIScripting0x03_L041)                                   ;B3BC99
pAIScripting0x03_L046:
    %AICMD0x10_End()                                           ;B3BC9C
pAIScripting0x03_L047:
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 0, pAIScripting0x03_L048)     ;B3BC9D
    %AICMD0x1C_ShowDialog($0076, $00)                          ;B3BCA4
    %AICMD0x12_Jump(pAIScripting0x03_L041)                                   ;B3BCA8
pAIScripting0x03_L048:
    %AICMD0x1C_ShowDialog($0075, $00)                          ;B3BCAB
    %AICMD0x12_Jump(pAIScripting0x03_L041)                                   ;B3BCAF
pAIScripting0x03_L049:
    %AICMD0x1C_ShowDialog($0392, $00)                          ;B3BCB2
    %AICMD0x12_Jump(pAIScripting0x03_L041)                                   ;B3BCB6
pAIScripting0x03_L050:
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 17, 18, pAIScripting0x03_L055) ;B3BCB9
    %AICMD0x1A($0248, $0318, aAIScriptingData_L053, $00)                     ;B3BCC1
pAIScripting0x03_L051:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x03_L052)                                        ;B3BCC9
    %AICMD0x2D_JumpOnInteract(pAIScripting0x03_L056, pAIScripting0x03_L053)                               ;B3BCCC
    %AICMD0x12_Jump(pAIScripting0x03_L051)                                   ;B3BCD1
pAIScripting0x03_L052:
    %AICMD0x1C_ShowDialog($01C9, $00)                          ;B3BCD4
    %AICMD0x12_Jump(pAIScripting0x03_L051)                                   ;B3BCD8
pAIScripting0x03_L053:
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 9, 12, pAIScripting0x03_L054)         ;B3BCDB
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3BCE3
    %AICMD0x12_Jump(pAIScripting0x03_L051)                                   ;B3BCE7
pAIScripting0x03_L054:
    %AICMD0x1C_ShowDialog($03BB, $00)                          ;B3BCEA
    %AICMD0x12_Jump(pAIScripting0x03_L051)                                   ;B3BCEE
pAIScripting0x03_L055:
    %AICMD0x10_End()                                           ;B3BCF1
pAIScripting0x03_L056:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $02, pAIScripting0x03_L059)   ;B3BCF2
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 7, 16, pAIScripting0x03_L057)  ;B3BCF9
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 17, 18, pAIScripting0x03_L058) ;B3BD01
    %AICMD0x12_Jump(pAIScripting0x03_L051)                                   ;B3BD09
pAIScripting0x03_L057:
    %AICMD0x1C_ShowDialog($005D, $00)                          ;B3BD0C
    %AICMD0x12_Jump(pAIScripting0x03_L051)                                   ;B3BD10
pAIScripting0x03_L058:
    %AICMD0x1B($02AC, $00)                                     ;B3BD13
    %AICMD0x0D($00, $01, $20, $01)                             ;B3BD17
    %AICMD0x37()                                               ;B3BD1C
    %AICMD0x10_End()                                           ;B3BD1D
pAIScripting0x03_L059:
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 17, 18, pAIScripting0x03_L058) ;B3BD1E
    %AICMD0x1C_ShowDialog($01F0, $00)                          ;B3BD26
    %AICMD0x12_Jump(pAIScripting0x03_L051)                                   ;B3BD2A


pAIScripting0x03_Data02:
 
    %AICMD0x11_EnableUserControl()                             ;B3BD2D
    %AICMD0x09_StartScript($01, pAIScripting0x03_L065)                                   ;B3BD2E
    %AICMD0x09_StartScript($02, pAIScripting0x03_L072)                                   ;B3BD32
    %AICMD0x09_StartScript($03, pAIScripting0x03_L079)                                   ;B3BD36
    %AICMD0x09_StartScript($04, pAIScripting0x03_L086)                                   ;B3BD3A
    %AICMD0x09_StartScript($05, pAIScripting0x03_L093)                                   ;B3BD3E
    %AICMD0x09_StartScript($06, pAIScripting0x03_L099)                                   ;B3BD42
    %AICMD0x12_Jump(pAIScripting0x03_L061)                                   ;B3BD46
pAIScripting0x03_L060:
    %AICMD0x13_Wait(1)                                         ;B3BD49
    %AICMD0x12_Jump(pAIScripting0x03_L060)                                   ;B3BD4C
pAIScripting0x03_L061:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $00, pAIScripting0x03_L062)   ;B3BD4F
    %AICMD0x14_JumpIfFlagSet(strcFlags.event4, $0C, pAIScripting0x03_L062)   ;B3BD56
    %AICMD0x09_StartScript($09, pAIScripting0x03_L106)                                   ;B3BD5D
pAIScripting0x03_L062:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $01, pAIScripting0x03_L063)   ;B3BD61
    %AICMD0x09_StartScript($0A, pAIScripting0x03_L121)                                   ;B3BD68
pAIScripting0x03_L063:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $03, pAIScripting0x03_L064)   ;B3BD6C
    %AICMD0x09_StartScript($0B, pAIScripting0x03_L136)                                   ;B3BD73
pAIScripting0x03_L064:
    %AICMD0x12_Jump(pAIScripting0x03_L060)                                   ;B3BD77
pAIScripting0x03_L065:
    %AICMD0x1A($0080, $0090, aAIScriptingData_L051, $00)                     ;B3BD7A
pAIScripting0x03_L066:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x03_L067)                                        ;B3BD82
    %AICMD0x2D_JumpOnInteract(pAIScripting0x03_L070, pAIScripting0x03_L068)                               ;B3BD85
    %AICMD0x12_Jump(pAIScripting0x03_L066)                                   ;B3BD8A
pAIScripting0x03_L067:
    %AICMD0x1C_ShowDialog($01E0, $00)                          ;B3BD8D
    %AICMD0x12_Jump(pAIScripting0x03_L080)                                   ;B3BD91
pAIScripting0x03_L068:
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 9, 12, pAIScripting0x03_L069)         ;B3BD94
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3BD9C
    %AICMD0x12_Jump(pAIScripting0x03_L066)                                   ;B3BDA0
pAIScripting0x03_L069:
    %AICMD0x1C_ShowDialog($03B0, $00)                          ;B3BDA3
    %AICMD0x12_Jump(pAIScripting0x03_L066)                                   ;B3BDA7
pAIScripting0x03_L070:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event4, $0C, pAIScripting0x03_L071)   ;B3BDAA
    %AICMD0x1C_ShowDialog($0059, $00)                          ;B3BDB1
    %AICMD0x12_Jump(pAIScripting0x03_L066)                                   ;B3BDB5
pAIScripting0x03_L071:
    %AICMD0x1C_ShowDialog($01CF, $00)                          ;B3BDB8
    %AICMD0x12_Jump(pAIScripting0x03_L066)                                   ;B3BDBC
pAIScripting0x03_L072:
    %AICMD0x1A($0058, $0118, aAIScriptingData_L044, $01)                     ;B3BDBF
pAIScripting0x03_L073:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x03_L074)                                        ;B3BDC7
    %AICMD0x2D_JumpOnInteract(pAIScripting0x03_L077, pAIScripting0x03_L075)                               ;B3BDCA
    %AICMD0x12_Jump(pAIScripting0x03_L073)                                   ;B3BDCF
pAIScripting0x03_L074:
    %AICMD0x1C_ShowDialog($01C9, $00)                          ;B3BDD2
    %AICMD0x1B($0291, $00)                                     ;B3BDD6
    %AICMD0x12_Jump(pAIScripting0x03_L073)                                   ;B3BDDA
pAIScripting0x03_L075:
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 9, 12, pAIScripting0x03_L076)         ;B3BDDD
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3BDE5
    %AICMD0x1B($0291, $00)                                     ;B3BDE9
    %AICMD0x12_Jump(pAIScripting0x03_L073)                                   ;B3BDED
pAIScripting0x03_L076:
    %AICMD0x1C_ShowDialog($03B8, $00)                          ;B3BDF0
    %AICMD0x1B($0291, $00)                                     ;B3BDF4
    %AICMD0x12_Jump(pAIScripting0x03_L073)                                   ;B3BDF8
pAIScripting0x03_L077:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event4, $0C, pAIScripting0x03_L078)   ;B3BDFB
    %AICMD0x1C_ShowDialog($0037, $00)                          ;B3BE02
    %AICMD0x1B($0291, $00)                                     ;B3BE06
    %AICMD0x12_Jump(pAIScripting0x03_L073)                                   ;B3BE0A
pAIScripting0x03_L078:
    %AICMD0x1C_ShowDialog($01CD, $00)                          ;B3BE0D
    %AICMD0x1B($0291, $00)                                     ;B3BE11
    %AICMD0x12_Jump(pAIScripting0x03_L073)                                   ;B3BE15
pAIScripting0x03_L079:
    %AICMD0x1A($0038, $0118, aAIScriptingData_L061, $01)                     ;B3BE18
pAIScripting0x03_L080:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x03_L081)                                        ;B3BE20
    %AICMD0x2D_JumpOnInteract(pAIScripting0x03_L084, pAIScripting0x03_L082)                               ;B3BE23
    %AICMD0x12_Jump(pAIScripting0x03_L080)                                   ;B3BE28
pAIScripting0x03_L081:
    %AICMD0x1C_ShowDialog($01C6, $00)                          ;B3BE2B
    %AICMD0x1B($02C6, $00)                                     ;B3BE2F
    %AICMD0x12_Jump(pAIScripting0x03_L080)                                   ;B3BE33
pAIScripting0x03_L082:
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 9, 12, pAIScripting0x03_L083)         ;B3BE36
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3BE3E
    %AICMD0x1B($02C6, $00)                                     ;B3BE42
    %AICMD0x12_Jump(pAIScripting0x03_L080)                                   ;B3BE46
pAIScripting0x03_L083:
    %AICMD0x1C_ShowDialog($03B9, $00)                          ;B3BE49
    %AICMD0x1B($02C6, $00)                                     ;B3BE4D
    %AICMD0x12_Jump(pAIScripting0x03_L080)                                   ;B3BE51
pAIScripting0x03_L084:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event4, $0C, pAIScripting0x03_L085)   ;B3BE54
    %AICMD0x1C_ShowDialog($003C, $00)                          ;B3BE5B
    %AICMD0x1B($02C6, $00)                                     ;B3BE5F
    %AICMD0x12_Jump(pAIScripting0x03_L080)                                   ;B3BE63
pAIScripting0x03_L085:
    %AICMD0x1C_ShowDialog($01CE, $00)                          ;B3BE66
    %AICMD0x1B($02C6, $00)                                     ;B3BE6A
    %AICMD0x12_Jump(pAIScripting0x03_L080)                                   ;B3BE6E
pAIScripting0x03_L086:
    %AICMD0x1A($00A8, $0118, aAIScriptingData_L046, $01)                     ;B3BE71
pAIScripting0x03_L087:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x03_L088)                                        ;B3BE79
    %AICMD0x2D_JumpOnInteract(pAIScripting0x03_L091, pAIScripting0x03_L089)                               ;B3BE7C
    %AICMD0x12_Jump(pAIScripting0x03_L087)                                   ;B3BE81
pAIScripting0x03_L088:
    %AICMD0x1C_ShowDialog($01CA, $00)                          ;B3BE84
    %AICMD0x1B($0298, $00)                                     ;B3BE88
    %AICMD0x12_Jump(pAIScripting0x03_L087)                                   ;B3BE8C
pAIScripting0x03_L089:
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 9, 12, pAIScripting0x03_L090)         ;B3BE8F
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3BE97
    %AICMD0x1B($0298, $00)                                     ;B3BE9B
    %AICMD0x12_Jump(pAIScripting0x03_L087)                                   ;B3BE9F
pAIScripting0x03_L090:
    %AICMD0x1C_ShowDialog($0049, $00)                          ;B3BEA2
    %AICMD0x1B($0298, $00)                                     ;B3BEA6
    %AICMD0x12_Jump(pAIScripting0x03_L087)                                   ;B3BEAA
pAIScripting0x03_L091:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event4, $0E, pAIScripting0x03_L092)   ;B3BEAD
    %AICMD0x1C_ShowDialog($0042, $00)                          ;B3BEB4
    %AICMD0x1B($0298, $00)                                     ;B3BEB8
    %AICMD0x12_Jump(pAIScripting0x03_L087)                                   ;B3BEBC
pAIScripting0x03_L092:
    %AICMD0x1C_ShowDialog($01DC, $00)                          ;B3BEBF
    %AICMD0x1B($0298, $00)                                     ;B3BEC3
    %AICMD0x12_Jump(pAIScripting0x03_L087)                                   ;B3BEC7
pAIScripting0x03_L093:
    %AICMD0x1A($00D8, $0118, aAIScriptingData_L066, $01)                     ;B3BECA
pAIScripting0x03_L094:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x03_L095)                                        ;B3BED2
    %AICMD0x2D_JumpOnInteract(pAIScripting0x03_L098, pAIScripting0x03_L096)                               ;B3BED5
    %AICMD0x12_Jump(pAIScripting0x03_L094)                                   ;B3BEDA
pAIScripting0x03_L095:
    %AICMD0x1C_ShowDialog($01C6, $00)                          ;B3BEDD
    %AICMD0x12_Jump(pAIScripting0x03_L094)                                   ;B3BEE1
pAIScripting0x03_L096:
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 9, 12, pAIScripting0x03_L097)         ;B3BEE4
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3BEEC
    %AICMD0x12_Jump(pAIScripting0x03_L094)                                   ;B3BEF0
pAIScripting0x03_L097:
    %AICMD0x1C_ShowDialog($03B9, $00)                          ;B3BEF3
    %AICMD0x12_Jump(pAIScripting0x03_L094)                                   ;B3BEF7
pAIScripting0x03_L098:
    %AICMD0x1C_ShowDialog($0048, $00)                          ;B3BEFA
    %AICMD0x12_Jump(pAIScripting0x03_L094)                                   ;B3BEFE
pAIScripting0x03_L099:
    %AICMD0x1A($0048, $0158, aAIScriptingData_L048, $01)                     ;B3BF01
pAIScripting0x03_L100:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x03_L101)                                        ;B3BF09
    %AICMD0x2D_JumpOnInteract(pAIScripting0x03_L104, pAIScripting0x03_L102)                               ;B3BF0C
    %AICMD0x12_Jump(pAIScripting0x03_L100)                                   ;B3BF11
pAIScripting0x03_L101:
    %AICMD0x1C_ShowDialog($01C7, $00)                          ;B3BF14
    %AICMD0x1B($029F, $00)                                     ;B3BF18
    %AICMD0x12_Jump(pAIScripting0x03_L100)                                   ;B3BF1C
pAIScripting0x03_L102:
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 9, 12, pAIScripting0x03_L103)         ;B3BF1F
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3BF27
    %AICMD0x1B($029F, $00)                                     ;B3BF2B
    %AICMD0x12_Jump(pAIScripting0x03_L100)                                   ;B3BF2F
pAIScripting0x03_L103:
    %AICMD0x1C_ShowDialog($03BB, $00)                          ;B3BF32
    %AICMD0x1B($029F, $00)                                     ;B3BF36
    %AICMD0x12_Jump(pAIScripting0x03_L100)                                   ;B3BF3A
pAIScripting0x03_L104:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $02, pAIScripting0x03_L105)   ;B3BF3D
    %AICMD0x1C_ShowDialog($004E, $00)                          ;B3BF44
    %AICMD0x1B($029F, $00)                                     ;B3BF48
    %AICMD0x12_Jump(pAIScripting0x03_L100)                                   ;B3BF4C
pAIScripting0x03_L105:
    %AICMD0x1C_ShowDialog($01ED, $00)                          ;B3BF4F
    %AICMD0x1B($029F, $00)                                     ;B3BF53
    %AICMD0x12_Jump(pAIScripting0x03_L100)                                   ;B3BF57
pAIScripting0x03_L106:
    %AICMD0x1A($00C1, $0088, aAIScriptingData_L013, $01)                     ;B3BF5A
pAIScripting0x03_L107:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x03_L109)                                        ;B3BF62
    %AICMD0x2D_JumpOnInteract(pAIScripting0x03_L117, pAIScripting0x03_L111)                               ;B3BF65
    %AICMD0x12_Jump(pAIScripting0x03_L107)                                   ;B3BF6A
pAIScripting0x03_L108:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x03_L109)                                        ;B3BF6D
    %AICMD0x1F(pAIScripting0x03_L120)                                        ;B3BF70
    %AICMD0x12_Jump(pAIScripting0x03_L108)                                   ;B3BF73
pAIScripting0x03_L109:
    %AICMD0x45_JumpIfBetween16(nLove_Maria, 0, 249, pAIScripting0x03_L110)   ;B3BF76
    %AICMD0x1C_ShowDialog($043D, $00)                          ;B3BF80
    %AICMD0x12_Jump(pAIScripting0x03_L107)                                   ;B3BF84
pAIScripting0x03_L110:
    %AICMD0x1C_ShowDialog($0174, $00)                          ;B3BF87
    %AICMD0x12_Jump(pAIScripting0x03_L107)                                   ;B3BF8B
pAIScripting0x03_L111:
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 2, pAIScripting0x03_L112)              ;B3BF8E
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 1, 5, pAIScripting0x03_L115)          ;B3BF95
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 16, 23, pAIScripting0x03_L115)        ;B3BF9D
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 6, pAIScripting0x03_L114)              ;B3BFA5
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 25, pAIScripting0x03_L113)             ;B3BFAC
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 73, pAIScripting0x03_L113)             ;B3BFB3
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 9, 12, pAIScripting0x03_L116)         ;B3BFBA
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3BFC2
    %AICMD0x12_Jump(pAIScripting0x03_L107)                                   ;B3BFC6
pAIScripting0x03_L112:
    %AICMD0x1C_ShowDialog($03B0, $00)                          ;B3BFC9
    %AICMD0x41_AddValue16(nLove_Maria, -8)                     ;B3BFCD
    %AICMD0x12_Jump(pAIScripting0x03_L107)                                   ;B3BFD3
pAIScripting0x03_L113:
    %AICMD0x1C_ShowDialog($0212, $00)                          ;B3BFD6
    %AICMD0x41_AddValue16(nLove_Maria, 4)                      ;B3BFDA
    %AICMD0x12_Jump(pAIScripting0x03_L107)                                   ;B3BFE0
pAIScripting0x03_L114:
    %AICMD0x1C_ShowDialog($03B5, $00)                          ;B3BFE3
    %AICMD0x41_AddValue16(nLove_Maria, 3)                      ;B3BFE7
    %AICMD0x12_Jump(pAIScripting0x03_L107)                                   ;B3BFED
pAIScripting0x03_L115:
    %AICMD0x1C_ShowDialog($03B2, $00)                          ;B3BFF0
    %AICMD0x41_AddValue16(nLove_Maria, 5)                      ;B3BFF4
    %AICMD0x12_Jump(pAIScripting0x03_L107)                                   ;B3BFFA
pAIScripting0x03_L116:
    %AICMD0x1C_ShowDialog($01DA, $00)                          ;B3BFFD
    %AICMD0x41_AddValue16(nLove_Maria, -2)                     ;B3C001
    %AICMD0x12_Jump(pAIScripting0x03_L107)                                   ;B3C007
pAIScripting0x03_L117:
    %AICMD0x1D_ShowDialog($008E, $00)                          ;B3C00A
    %AICMD0x20_JumpIfChoice(0, pAIScripting0x03_L118)                        ;B3C00E
    %AICMD0x20_JumpIfChoice(1, pAIScripting0x03_L119)                        ;B3C012
    %AICMD0x12_Jump(pAIScripting0x03_L107)                                   ;B3C016
pAIScripting0x03_L118:
    %AICMD0x1C_ShowDialog($008F, $00)                          ;B3C019
    %AICMD0x41_AddValue16(nLove_Maria, 4)                      ;B3C01D
    %AICMD0x12_Jump(pAIScripting0x03_L108)                                   ;B3C023
pAIScripting0x03_L119:
    %AICMD0x1C_ShowDialog($0090, $00)                          ;B3C026
    %AICMD0x41_AddValue16(nLove_Maria, 1)                      ;B3C02A
    %AICMD0x12_Jump(pAIScripting0x03_L108)                                   ;B3C030
pAIScripting0x03_L120:
    %AICMD0x1C_ShowDialog($0088, $00)                          ;B3C033
    %AICMD0x12_Jump(pAIScripting0x03_L108)                                   ;B3C037
pAIScripting0x03_L121:
    %AICMD0x1A($00D8, $0198, aAIScriptingData_L015, $01)                     ;B3C03A
pAIScripting0x03_L122:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x03_L124)                                        ;B3C042
    %AICMD0x2D_JumpOnInteract(pAIScripting0x03_L131, pAIScripting0x03_L126)                               ;B3C045
    %AICMD0x12_Jump(pAIScripting0x03_L122)                                   ;B3C04A
pAIScripting0x03_L123:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x03_L124)                                        ;B3C04D
    %AICMD0x1F(pAIScripting0x03_L134)                                        ;B3C050
    %AICMD0x12_Jump(pAIScripting0x03_L123)                                   ;B3C053
pAIScripting0x03_L124:
    %AICMD0x45_JumpIfBetween16(nLove_Ann, 0, 249, pAIScripting0x03_L125)     ;B3C056
    %AICMD0x1C_ShowDialog($043E, $00)                          ;B3C060
    %AICMD0x12_Jump(pAIScripting0x03_L122)                                   ;B3C064
pAIScripting0x03_L125:
    %AICMD0x1C_ShowDialog($0176, $00)                          ;B3C067
    %AICMD0x12_Jump(pAIScripting0x03_L122)                                   ;B3C06B
pAIScripting0x03_L126:
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 2, pAIScripting0x03_L127)              ;B3C06E
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 1, 7, pAIScripting0x03_L128)          ;B3C075
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 16, 23, pAIScripting0x03_L128)        ;B3C07D
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 6, pAIScripting0x03_L128)              ;B3C085
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 25, pAIScripting0x03_L129)             ;B3C08C
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 73, pAIScripting0x03_L129)             ;B3C093
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 9, 12, pAIScripting0x03_L130)         ;B3C09A
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3C0A2
    %AICMD0x12_Jump(pAIScripting0x03_L122)                                   ;B3C0A6
pAIScripting0x03_L127:
    %AICMD0x1C_ShowDialog($03B4, $00)                          ;B3C0A9
    %AICMD0x41_AddValue16(nLove_Ann, -8)                       ;B3C0AD
    %AICMD0x12_Jump(pAIScripting0x03_L122)                                   ;B3C0B3
pAIScripting0x03_L128:
    %AICMD0x1C_ShowDialog($03B2, $00)                          ;B3C0B6
    %AICMD0x41_AddValue16(nLove_Ann, 5)                        ;B3C0BA
    %AICMD0x12_Jump(pAIScripting0x03_L122)                                   ;B3C0C0
pAIScripting0x03_L129:
    %AICMD0x1C_ShowDialog($0212, $00)                          ;B3C0C3
    %AICMD0x41_AddValue16(nLove_Ann, 2)                        ;B3C0C7
    %AICMD0x12_Jump(pAIScripting0x03_L122)                                   ;B3C0CD
pAIScripting0x03_L130:
    %AICMD0x1C_ShowDialog($03B4, $00)                          ;B3C0D0
    %AICMD0x41_AddValue16(nLove_Ann, -2)                       ;B3C0D4
    %AICMD0x12_Jump(pAIScripting0x03_L122)                                   ;B3C0DA
pAIScripting0x03_L131:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event4, $0E, pAIScripting0x03_L135)   ;B3C0DD
    %AICMD0x1D_ShowDialog($00A2, $00)                          ;B3C0E4
    %AICMD0x20_JumpIfChoice(0, pAIScripting0x03_L132)                        ;B3C0E8
    %AICMD0x20_JumpIfChoice(1, pAIScripting0x03_L133)                        ;B3C0EC
    %AICMD0x12_Jump(pAIScripting0x03_L122)                                   ;B3C0F0
pAIScripting0x03_L132:
    %AICMD0x1C_ShowDialog($00A3, $00)                          ;B3C0F3
    %AICMD0x1B($0228, $00)                                     ;B3C0F7
    %AICMD0x41_AddValue16(nLove_Ann, 4)                        ;B3C0FB
    %AICMD0x12_Jump(pAIScripting0x03_L123)                                   ;B3C101
pAIScripting0x03_L133:
    %AICMD0x1C_ShowDialog($00A4, $00)                          ;B3C104
    %AICMD0x41_AddValue16(nLove_Ann, 1)                        ;B3C108
    %AICMD0x1B($0228, $00)                                     ;B3C10E
    %AICMD0x12_Jump(pAIScripting0x03_L123)                                   ;B3C112
pAIScripting0x03_L134:
    %AICMD0x1B($0228, $00)                                     ;B3C115
    %AICMD0x1C_ShowDialog($02C2, $00)                          ;B3C119
    %AICMD0x12_Jump(pAIScripting0x03_L123)                                   ;B3C11D
pAIScripting0x03_L135:
    %AICMD0x1C_ShowDialog($01DE, $00)                          ;B3C120
    %AICMD0x12_Jump(pAIScripting0x03_L122)                                   ;B3C124
pAIScripting0x03_L136:
    %AICMD0x1A($0048, $0198, aAIScriptingData_L023, $01)                     ;B3C127
pAIScripting0x03_L137:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x03_L138)                                        ;B3C12F
    %AICMD0x2D_JumpOnInteract(pAIScripting0x03_L146, pAIScripting0x03_L140)                               ;B3C132
    %AICMD0x12_Jump(pAIScripting0x03_L137)                                   ;B3C137
pAIScripting0x03_L138:
    %AICMD0x45_JumpIfBetween16(nLove_Ellen, 0, 249, pAIScripting0x03_L139)   ;B3C13A
    %AICMD0x1C_ShowDialog($0440, $00)                          ;B3C144
    %AICMD0x12_Jump(pAIScripting0x03_L137)                                   ;B3C148
pAIScripting0x03_L139:
    %AICMD0x1C_ShowDialog($017A, $00)                          ;B3C14B
    %AICMD0x12_Jump(pAIScripting0x03_L137)                                   ;B3C14F
pAIScripting0x03_L140:
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 2, pAIScripting0x03_L141)              ;B3C152
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 1, 5, pAIScripting0x03_L142)          ;B3C159
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 7, pAIScripting0x03_L142)              ;B3C161
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 73, pAIScripting0x03_L144)             ;B3C168
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 16, 19, pAIScripting0x03_L142)        ;B3C16F
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 20, 23, pAIScripting0x03_L143)        ;B3C177
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 9, 12, pAIScripting0x03_L145)         ;B3C17F
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3C187
    %AICMD0x12_Jump(pAIScripting0x03_L137)                                   ;B3C18B
pAIScripting0x03_L141:
    %AICMD0x1C_ShowDialog($03B0, $00)                          ;B3C18E
    %AICMD0x41_AddValue16(nLove_Ellen, -8)                     ;B3C192
    %AICMD0x12_Jump(pAIScripting0x03_L137)                                   ;B3C198
pAIScripting0x03_L142:
    %AICMD0x1C_ShowDialog($03B2, $00)                          ;B3C19B
    %AICMD0x41_AddValue16(nLove_Ellen, 5)                      ;B3C19F
    %AICMD0x12_Jump(pAIScripting0x03_L137)                                   ;B3C1A5
pAIScripting0x03_L143:
    %AICMD0x1C_ShowDialog($03B3, $00)                          ;B3C1A8
    %AICMD0x41_AddValue16(nLove_Ellen, 8)                      ;B3C1AC
    %AICMD0x12_Jump(pAIScripting0x03_L137)                                   ;B3C1B2
pAIScripting0x03_L144:
    %AICMD0x1C_ShowDialog($0212, $00)                          ;B3C1B5
    %AICMD0x41_AddValue16(nLove_Ellen, 5)                      ;B3C1B9
    %AICMD0x12_Jump(pAIScripting0x03_L137)                                   ;B3C1BF
pAIScripting0x03_L145:
    %AICMD0x1C_ShowDialog($01DA, $00)                          ;B3C1C2
    %AICMD0x41_AddValue16(nLove_Ellen, -2)                     ;B3C1C6
    %AICMD0x12_Jump(pAIScripting0x03_L137)                                   ;B3C1CC
pAIScripting0x03_L146:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $02, pAIScripting0x03_L147)   ;B3C1CF
    %AICMD0x1C_ShowDialog($00D1, $00)                          ;B3C1D6
    %AICMD0x12_Jump(pAIScripting0x03_L137)                                   ;B3C1DA
pAIScripting0x03_L147:
    %AICMD0x1C_ShowDialog($01EE, $00)                          ;B3C1DD
    %AICMD0x12_Jump(pAIScripting0x03_L137)                                   ;B3C1E1


pAIScripting0x03_Data03:
    %AICMD0x11_EnableUserControl()                             ;B3C1E4
    %AICMD0x09_StartScript($01, pAIScripting0x03_L199)                                   ;B3C1E5
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $04, pAIScripting0x03_L149)   ;B3C1E9
    %AICMD0x09_StartScript($02, pAIScripting0x03_L152)                                   ;B3C1F0
    %AICMD0x12_Jump(pAIScripting0x03_L149)                                   ;B3C1F4
pAIScripting0x03_L148:
    %AICMD0x13_Wait(1)                                         ;B3C1F7
    %AICMD0x12_Jump(pAIScripting0x03_L148)                                   ;B3C1FA
pAIScripting0x03_L149:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $04, pAIScripting0x03_L150)   ;B3C1FD
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $04, pAIScripting0x03_L150)   ;B3C204
    %AICMD0x09_StartScript($03, pAIScripting0x03_L160)                                   ;B3C20B
pAIScripting0x03_L150:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, pAIScripting0x03_L151)   ;B3C20F
    %AICMD0x14_JumpIfFlagSet(strcFlags.event5, $00, pAIScripting0x03_L151)   ;B3C216
    %AICMD0x09_StartScript($04, pAIScripting0x03_L171)                                   ;B3C21D
pAIScripting0x03_L151:
    %AICMD0x12_Jump(pAIScripting0x03_L148)                                   ;B3C221
pAIScripting0x03_L152:
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 17, 18, pAIScripting0x03_L158) ;B3C224
    %AICMD0x1A($0068, $0038, aAIScriptingData_L040, $00)                     ;B3C22C
pAIScripting0x03_L153:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x03_L154)                                        ;B3C234
    %AICMD0x2D_JumpOnInteract(pAIScripting0x03_L157, pAIScripting0x03_L155)                               ;B3C237
    %AICMD0x12_Jump(pAIScripting0x03_L153)                                   ;B3C23C
pAIScripting0x03_L154:
    %AICMD0x1C_ShowDialog($01C9, $00)                          ;B3C23F
    %AICMD0x12_Jump(pAIScripting0x03_L153)                                   ;B3C243
pAIScripting0x03_L155:
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 9, 12, pAIScripting0x03_L156)         ;B3C246
    %AICMD0x1C_ShowDialog($03BC, $00)                          ;B3C24E
    %AICMD0x12_Jump(pAIScripting0x03_L153)                                   ;B3C252
pAIScripting0x03_L156:
    %AICMD0x1C_ShowDialog($0049, $00)                          ;B3C255
    %AICMD0x12_Jump(pAIScripting0x03_L153)                                   ;B3C259
pAIScripting0x03_L157:
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 17, 18, pAIScripting0x03_L159) ;B3C25C
    %AICMD0x1C_ShowDialog($007D, $00)                          ;B3C264
    %AICMD0x12_Jump(pAIScripting0x03_L153)                                   ;B3C268
pAIScripting0x03_L158:
    %AICMD0x10_End()                                           ;B3C26B
pAIScripting0x03_L159:
    %AICMD0x1C_ShowDialog($0392, $00)                          ;B3C26C
    %AICMD0x12_Jump(pAIScripting0x03_L153)                                   ;B3C270
pAIScripting0x03_L160:
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 17, 18, pAIScripting0x03_L170) ;B3C273
    %AICMD0x1A($02A0, $00D8, aAIScriptingData_L026, $00)                     ;B3C27B
pAIScripting0x03_L161:
    %AICMD0x1F(pAIScripting0x03_L163)                                        ;B3C283
    %AICMD0x12_Jump(pAIScripting0x03_L161)                                   ;B3C286
pAIScripting0x03_L162:
    %AICMD0x1F(pAIScripting0x03_L167)                                        ;B3C289
    %AICMD0x12_Jump(pAIScripting0x03_L162)                                   ;B3C28C
pAIScripting0x03_L163:
    %AICMD0x17_RollRandom($02)                                            ;B3C28F
    %AICMD0x18_JumpIfRandomEquals($00, pAIScripting0x03_L164)                                   ;B3C291
    %AICMD0x18_JumpIfRandomEquals($01, pAIScripting0x03_L168)                                   ;B3C295
    %AICMD0x18_JumpIfRandomEquals($01, pAIScripting0x03_L169)                                   ;B3C299
    %AICMD0x12_Jump(pAIScripting0x03_L161)                                   ;B3C29D
pAIScripting0x03_L164:
    %AICMD0x1D_ShowDialog($00E2, $00)                          ;B3C2A0
    %AICMD0x20_JumpIfChoice(0, pAIScripting0x03_L165)                        ;B3C2A4
    %AICMD0x20_JumpIfChoice(1, pAIScripting0x03_L166)                        ;B3C2A8
    %AICMD0x12_Jump(pAIScripting0x03_L162)                                   ;B3C2AC
pAIScripting0x03_L165:
    %AICMD0x1C_ShowDialog($00E3, $00)                          ;B3C2AF
    %AICMD0x41_AddValue16(nLove_Eve, 8)                        ;B3C2B3
    %AICMD0x12_Jump(pAIScripting0x03_L162)                                   ;B3C2B9
pAIScripting0x03_L166:
    %AICMD0x1C_ShowDialog($00E4, $00)                          ;B3C2BC
    %AICMD0x41_AddValue16(nLove_Eve, 2)                        ;B3C2C0
    %AICMD0x12_Jump(pAIScripting0x03_L162)                                   ;B3C2C6
pAIScripting0x03_L167:
    %AICMD0x1C_ShowDialog($00DD, $00)                          ;B3C2C9
    %AICMD0x12_Jump(pAIScripting0x03_L162)                                   ;B3C2CD
pAIScripting0x03_L168:
    %AICMD0x1C_ShowDialog($040A, $00)                          ;B3C2D0
    %AICMD0x12_Jump(pAIScripting0x03_L162)                                   ;B3C2D4
pAIScripting0x03_L169:
    %AICMD0x1C_ShowDialog($040B, $00)                          ;B3C2D7
    %AICMD0x12_Jump(pAIScripting0x03_L162)                                   ;B3C2DB
pAIScripting0x03_L170:
    %AICMD0x10_End()                                           ;B3C2DE
pAIScripting0x03_L171:
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 17, 18, pAIScripting0x03_L184) ;B3C2DF
    %AICMD0x1A($0028, $00C8, aAIScriptingData_L020, $00)                     ;B3C2E7
pAIScripting0x03_L172:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x03_L175)                                        ;B3C2EF
    %AICMD0x2D_JumpOnInteract(pAIScripting0x03_L183, pAIScripting0x03_L177)                               ;B3C2F2
    %AICMD0x12_Jump(pAIScripting0x03_L172)                                   ;B3C2F7
pAIScripting0x03_L173:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x03_L175)                                        ;B3C2FA
    %AICMD0x2D_JumpOnInteract(pAIScripting0x03_L192, pAIScripting0x03_L177)                               ;B3C2FD
    %AICMD0x12_Jump(pAIScripting0x03_L173)                                   ;B3C302
pAIScripting0x03_L174:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x03_L175)                                        ;B3C305
    %AICMD0x1F(pAIScripting0x03_L197)                                        ;B3C308
    %AICMD0x12_Jump(pAIScripting0x03_L174)                                   ;B3C30B
pAIScripting0x03_L175:
    %AICMD0x45_JumpIfBetween16(nLove_Nina, 0, 249, pAIScripting0x03_L176)    ;B3C30E
    %AICMD0x1C_ShowDialog($0177, $00)                          ;B3C318
    %AICMD0x47_SetValue8(wram80(strcPlayerData.toolEquipped), 0)                           ;B3C31C
    %AICMD0x23_OrWithIndexedValue(strcFlags.event2, $02)       ;B3C321
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily3, $09)       ;B3C326
    %AICMD0x3D_TeleportToArea(!AREA_WEDDINGSPRING)             ;B3C32B
    %AICMD0x10_End()                                           ;B3C32D
pAIScripting0x03_L176:
    %AICMD0x1C_ShowDialog($0178, $00)                          ;B3C32E
    %AICMD0x12_Jump(pAIScripting0x03_L172)                                   ;B3C332
pAIScripting0x03_L177:
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 2, pAIScripting0x03_L181)              ;B3C335
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 5, pAIScripting0x03_L179)              ;B3C33C
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 6, pAIScripting0x03_L179)              ;B3C343
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 1, 7, pAIScripting0x03_L178)          ;B3C34A
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 16, 23, pAIScripting0x03_L178)        ;B3C352
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 24, pAIScripting0x03_L180)             ;B3C35A
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 25, pAIScripting0x03_L182)             ;B3C361
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 9, 12, pAIScripting0x03_L181)         ;B3C368
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3C370
    %AICMD0x12_Jump(pAIScripting0x03_L172)                                   ;B3C374
pAIScripting0x03_L178:
    %AICMD0x1C_ShowDialog($03B2, $00)                          ;B3C377
    %AICMD0x41_AddValue16(nLove_Nina, 3)                       ;B3C37B
    %AICMD0x12_Jump(pAIScripting0x03_L172)                                   ;B3C381
pAIScripting0x03_L179:
    %AICMD0x1C_ShowDialog($0212, $00)                          ;B3C384
    %AICMD0x41_AddValue16(nLove_Nina, 8)                       ;B3C388
    %AICMD0x12_Jump(pAIScripting0x03_L172)                                   ;B3C38E
pAIScripting0x03_L180:
    %AICMD0x1C_ShowDialog($03B1, $00)                          ;B3C391
    %AICMD0x41_AddValue16(nLove_Nina, -6)                      ;B3C395
    %AICMD0x12_Jump(pAIScripting0x03_L172)                                   ;B3C39B
pAIScripting0x03_L181:
    %AICMD0x1C_ShowDialog($01D9, $00)                          ;B3C39E
    %AICMD0x41_AddValue16(nLove_Nina, -4)                      ;B3C3A2
    %AICMD0x12_Jump(pAIScripting0x03_L172)                                   ;B3C3A8
pAIScripting0x03_L182:
    %AICMD0x1C_ShowDialog($0143, $00)                          ;B3C3AB
    %AICMD0x41_AddValue16(nLove_Nina, 4)                       ;B3C3AF
    %AICMD0x12_Jump(pAIScripting0x03_L172)                                   ;B3C3B5
pAIScripting0x03_L183:
    %AICMD0x45_JumpIfBetween16(nLove_Nina, 120, 149, pAIScripting0x03_L193)  ;B3C3B8
    %AICMD0x45_JumpIfBetween16(nLove_Nina, 150, 200, pAIScripting0x03_L194)  ;B3C3C2
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 7, 16, pAIScripting0x03_L185)  ;B3C3CC
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 17, 18, pAIScripting0x03_L198) ;B3C3D4
    %AICMD0x12_Jump(pAIScripting0x03_L172)                                   ;B3C3DC
pAIScripting0x03_L184:
    %AICMD0x10_End()                                           ;B3C3DF
pAIScripting0x03_L185:
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 0, pAIScripting0x03_L186)     ;B3C3E0
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 1, pAIScripting0x03_L187)     ;B3C3E7
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 2, pAIScripting0x03_L188)     ;B3C3EE
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, pAIScripting0x03_L189)     ;B3C3F5
    %AICMD0x12_Jump(pAIScripting0x03_L172)                                   ;B3C3FC
pAIScripting0x03_L186:
    %AICMD0x1C_ShowDialog($00B9, $00)                          ;B3C3FF
    %AICMD0x12_Jump(pAIScripting0x03_L173)                                   ;B3C403
pAIScripting0x03_L187:
    %AICMD0x1C_ShowDialog($00BA, $00)                          ;B3C406
    %AICMD0x12_Jump(pAIScripting0x03_L173)                                   ;B3C40A
pAIScripting0x03_L188:
    %AICMD0x1C_ShowDialog($00BB, $00)                          ;B3C40D
    %AICMD0x12_Jump(pAIScripting0x03_L173)                                   ;B3C411
pAIScripting0x03_L189:
    %AICMD0x1D_ShowDialog($00BC, $00)                          ;B3C414
    %AICMD0x20_JumpIfChoice(0, pAIScripting0x03_L190)                        ;B3C418
    %AICMD0x20_JumpIfChoice(1, pAIScripting0x03_L191)                        ;B3C41C
    %AICMD0x12_Jump(pAIScripting0x03_L172)                                   ;B3C420
pAIScripting0x03_L190:
    %AICMD0x1C_ShowDialog($00BD, $00)                          ;B3C423
    %AICMD0x41_AddValue16(nLove_Nina, 4)                       ;B3C427
    %AICMD0x12_Jump(pAIScripting0x03_L173)                                   ;B3C42D
pAIScripting0x03_L191:
    %AICMD0x1C_ShowDialog($00BE, $00)                          ;B3C430
    %AICMD0x41_AddValue16(nLove_Nina, 1)                       ;B3C434
    %AICMD0x12_Jump(pAIScripting0x03_L174)                                   ;B3C43A
pAIScripting0x03_L192:
    %AICMD0x1C_ShowDialog($00BD, $00)                          ;B3C43D
    %AICMD0x12_Jump(pAIScripting0x03_L173)                                   ;B3C441
pAIScripting0x03_L193:
    %AICMD0x1C_ShowDialog($00C1, $00)                          ;B3C444
    %AICMD0x12_Jump(pAIScripting0x03_L172)                                   ;B3C448
pAIScripting0x03_L194:
    %AICMD0x1D_ShowDialog($00C2, $00)                          ;B3C44B
    %AICMD0x20_JumpIfChoice(0, pAIScripting0x03_L195)                        ;B3C44F
    %AICMD0x20_JumpIfChoice(1, pAIScripting0x03_L196)                        ;B3C453
    %AICMD0x12_Jump(pAIScripting0x03_L172)                                   ;B3C457
pAIScripting0x03_L195:
    %AICMD0x1C_ShowDialog($00C3, $00)                          ;B3C45A
    %AICMD0x41_AddValue16(nLove_Nina, 10)                      ;B3C45E
    %AICMD0x12_Jump(pAIScripting0x03_L173)                                   ;B3C464
pAIScripting0x03_L196:
    %AICMD0x1C_ShowDialog($00C4, $00)                          ;B3C467
    %AICMD0x41_AddValue16(nLove_Nina, 2)                       ;B3C46B
    %AICMD0x12_Jump(pAIScripting0x03_L174)                                   ;B3C471
pAIScripting0x03_L197:
    %AICMD0x1C_ShowDialog($00B1, $00)                          ;B3C474
    %AICMD0x12_Jump(pAIScripting0x03_L174)                                   ;B3C478
pAIScripting0x03_L198:
    %AICMD0x1C_ShowDialog($0391, $00)                          ;B3C47B
    %AICMD0x12_Jump(pAIScripting0x03_L172)                                   ;B3C47F
pAIScripting0x03_L199:
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 17, 18, pAIScripting0x03_L210) ;B3C482
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, pAIScripting0x03_L210)     ;B3C48A
    %AICMD0x1A($0258, $0178, aAIScriptingData_L032, $00)                     ;B3C491
pAIScripting0x03_L200:
    %AICMD0x2D_JumpOnInteract(pAIScripting0x03_L205, pAIScripting0x03_L203)                               ;B3C499
    %AICMD0x12_Jump(pAIScripting0x03_L200)                                   ;B3C49E
pAIScripting0x03_L201:
    %AICMD0x4D_JumpIfBlueFeatherUsed(pAIScripting0x03_L202)                                        ;B3C4A1
    %AICMD0x2D_JumpOnInteract(pAIScripting0x03_L208, pAIScripting0x03_L203)                               ;B3C4A4
    %AICMD0x12_Jump(pAIScripting0x03_L201)                                   ;B3C4A9
pAIScripting0x03_L202:
    %AICMD0x1C_ShowDialog($01C9, $00)                          ;B3C4AC
    %AICMD0x12_Jump(pAIScripting0x03_L201)                                   ;B3C4B0
pAIScripting0x03_L203:
    %AICMD0x16_JumpIfBetween8(wram80(strcPlayerData.carryItemIdPrev), 9, 12, pAIScripting0x03_L204)         ;B3C4B3
    %AICMD0x1C_ShowDialog($0200, $00)                          ;B3C4BB
    %AICMD0x12_Jump(pAIScripting0x03_L200)                                   ;B3C4BF
pAIScripting0x03_L204:
    %AICMD0x1C_ShowDialog($03B8, $00)                          ;B3C4C2
    %AICMD0x12_Jump(pAIScripting0x03_L200)                                   ;B3C4C6
pAIScripting0x03_L205:
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 17, 18, pAIScripting0x03_L209) ;B3C4C9
    %AICMD0x1D_ShowDialog($007E, $00)                          ;B3C4D1
    %AICMD0x20_JumpIfChoice(0, pAIScripting0x03_L206)                        ;B3C4D5
    %AICMD0x20_JumpIfChoice(1, pAIScripting0x03_L207)                        ;B3C4D9
    %AICMD0x12_Jump(pAIScripting0x03_L200)                                   ;B3C4DD
pAIScripting0x03_L206:
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily1, $09)       ;B3C4E0
    %AICMD0x1C_ShowDialog($007F, $00)                          ;B3C4E5
    %AICMD0x12_Jump(pAIScripting0x03_L201)                                   ;B3C4E9
pAIScripting0x03_L207:
    %AICMD0x1C_ShowDialog($0080, $00)                          ;B3C4EC
    %AICMD0x12_Jump(pAIScripting0x03_L200)                                   ;B3C4F0
pAIScripting0x03_L208:
    %AICMD0x28_ClearBit(strcFlags.daily1, $09)                          ;B3C4F3
    %AICMD0x1C_ShowDialog($0081, $00)                          ;B3C4F8
    %AICMD0x12_Jump(pAIScripting0x03_L200)                                   ;B3C4FC
pAIScripting0x03_L209:
    %AICMD0x1C_ShowDialog($0081, $00)                          ;B3C4FF
    %AICMD0x12_Jump(pAIScripting0x03_L200)                                   ;B3C503
pAIScripting0x03_L210:
    %AICMD0x10_End()                                           ;B3C506
