    incsrc "../../../../build/gen/ai/slots_00.asm"
 
pAIScripting0x00_General_L001:
 
    %AICMD0x2B(aAIScriptingData_L010, $00)                                   ;B38CC8
pAIScripting0x00_General_L002:
    %AICMD0x30_UpdateChicken()                                 ;B38CCC
    %AICMD0x12_Jump(pAIScripting0x00_General_L002)                                   ;B38CCD


pAIScripting0x00_General_Data01:
 
    %AICMD0x2B(aAIScriptingData_L009, $00)                                   ;B38CD0
    %AICMD0x2E($01, aAIScriptingData_L009, $10)                              ;B38CD4
    %AICMD0x4C()                                               ;B38CD9
pAIScripting0x00_General_L003:
    %AICMD0x30_UpdateChicken()                                 ;B38CDA
    %AICMD0x12_Jump(pAIScripting0x00_General_L003)                                   ;B38CDB


pAIScripting0x00_General_Data02:
 
    %AICMD0x2B(aAIScriptingData_L008, $00)                                   ;B38CDE
pAIScripting0x00_General_L004:
    %AICMD0x2E($01, aAIScriptingData_L008, $10)                              ;B38CE2
pAIScripting0x00_General_L005:
    %AICMD0x30_UpdateChicken()                                 ;B38CE7
    %AICMD0x12_Jump(pAIScripting0x00_General_L005)                                   ;B38CE8


pAIScripting0x00_General_Data03:
 
    %AICMD0x2B(aAIScriptingData_L115, $00)                                   ;B38CEB
pAIScripting0x00_General_L006:
    %AICMD0x2E($01, aAIScriptingData_L116, $10)                              ;B38CEF
pAIScripting0x00_General_L007:
    %AICMD0x31_UpdateCow()                                     ;B38CF4
    %AICMD0x12_Jump(pAIScripting0x00_General_L007)                                   ;B38CF5


pAIScripting0x00_General_Data04:
 
    %AICMD0x2B(aAIScriptingData_L113, $00)                                   ;B38CF8
pAIScripting0x00_General_L008:
    %AICMD0x2E($01, aAIScriptingData_L114, $10)                              ;B38CFC
pAIScripting0x00_General_L009:
    %AICMD0x31_UpdateCow()                                     ;B38D01
    %AICMD0x12_Jump(pAIScripting0x00_General_L009)                                   ;B38D02


pAIScripting0x00_General_Data05:
 
    %AICMD0x2B(aAIScriptingData_L002, $00)                                   ;B38D05
pAIScripting0x00_General_L010:
    %AICMD0x2E($01, aAIScriptingData_L003, $10)                              ;B38D09
pAIScripting0x00_General_L011:
    %AICMD0x31_UpdateCow()                                     ;B38D0E
    %AICMD0x12_Jump(pAIScripting0x00_General_L011)                                   ;B38D0F


pAIScripting0x00_General_Data06:
 
    %AICMD0x2B(aAIScriptingData_L121, $00)                                   ;B38D12
pAIScripting0x00_General_L012:
    %AICMD0x2E($01, aAIScriptingData_L122, $10)                              ;B38D16
pAIScripting0x00_General_L013:
    %AICMD0x31_UpdateCow()                                     ;B38D1B
    %AICMD0x12_Jump(pAIScripting0x00_General_L013)                                   ;B38D1C


pAIScripting0x00_General_Data07:
 
    %AICMD0x2B(aAIScriptingData_L117, $00)                                   ;B38D1F
pAIScripting0x00_General_L014:
    %AICMD0x2E($02, aAIScriptingData_L118, $10)                              ;B38D23
pAIScripting0x00_General_L015:
    %AICMD0x31_UpdateCow()                                     ;B38D28
    %AICMD0x12_Jump(pAIScripting0x00_General_L015)                                   ;B38D29


pAIScripting0x00_General_Data08:
 
    %AICMD0x2B(aAIScriptingData_L119, $00)                                   ;B38D2C
pAIScripting0x00_General_L016:
    %AICMD0x2E($02, aAIScriptingData_L120, $10)                              ;B38D30
pAIScripting0x00_General_L017:
    %AICMD0x31_UpdateCow()                                     ;B38D35
    %AICMD0x12_Jump(pAIScripting0x00_General_L017)                                   ;B38D36


pAIScripting0x00_General_Data09:
 
    %AICMD0x2B(aAIScriptingData_L124, $00)                                   ;B38D39
    %AICMD0x2E($01, aAIScriptingData_L124, $10)                              ;B38D3D
pAIScripting0x00_General_L018:
    %AICMD0x31_UpdateCow()                                     ;B38D42
    %AICMD0x12_Jump(pAIScripting0x00_General_L018)                                   ;B38D43


pAIScripting0x00_General_Data10:
 
    %AICMD0x1B($019D, $01)                                     ;B38D46
    %AICMD0x13_Wait(60)                                        ;B38D4A
    %AICMD0x12_Jump(pAIScripting0x00_General_L010)                                   ;B38D4D


pAIScripting0x00_General_Data11:
 
    %AICMD0x1B($019D, $00)                                     ;B38D50
    %AICMD0x13_Wait(60)                                        ;B38D54
    %AICMD0x12_Jump(pAIScripting0x00_General_L010)                                   ;B38D57


pAIScripting0x00_General_Data12:
 
    %AICMD0x1B($01A4, $00)                                     ;B38D5A
    %AICMD0x13_Wait(60)                                        ;B38D5E
    %AICMD0x2F(aAIScriptingData_L002)                                        ;B38D61
    %AICMD0x12_Jump(pAIScripting0x00_General_L010)                                   ;B38D64


pAIScripting0x00_General_Data13:
 
    %AICMD0x1B($01A8, $00)                                     ;B38D67
    %AICMD0x13_Wait(60)                                        ;B38D6B
    %AICMD0x2F(aAIScriptingData_L002)                                        ;B38D6E
    %AICMD0x12_Jump(pAIScripting0x00_General_L010)                                   ;B38D71


pAIScripting0x00_General_Data14:
 
    %AICMD0x1B($0191, $01)                                     ;B38D74
    %AICMD0x13_Wait(60)                                        ;B38D78
    %AICMD0x2F(aAIScriptingData_L002)                                        ;B38D7B
    %AICMD0x12_Jump(pAIScripting0x00_General_L010)                                   ;B38D7E


pAIScripting0x00_General_Data15:
 
    %AICMD0x1B($0191, $00)                                     ;B38D81
    %AICMD0x13_Wait(60)                                        ;B38D85
    %AICMD0x2F(aAIScriptingData_L002)                                        ;B38D88
    %AICMD0x12_Jump(pAIScripting0x00_General_L010)                                   ;B38D8B


pAIScripting0x00_General_Data16:
 
    %AICMD0x2B(aAIScriptingData_L006, $00)                                   ;B38D8E
    %AICMD0x2E($01, aAIScriptingData_L007, $10)                              ;B38D92
pAIScripting0x00_General_L019:
    %AICMD0x35_UpdateHorse()                                   ;B38D97
    %AICMD0x12_Jump(pAIScripting0x00_General_L019)                                   ;B38D98


pAIScripting0x00_General_Data17:
 
    %AICMD0x2B(aAIScriptingData_L004, $00)                                   ;B38D9B
pAIScripting0x00_General_L020:
    %AICMD0x2E($01, aAIScriptingData_L005, $10)                              ;B38D9F
    %AICMD0x12_Jump(pAIScripting0x00_General_L022)                                   ;B38DA4
pAIScripting0x00_General_L021:
    %AICMD0x2E($01, aAIScriptingData_L165, $10)                              ;B38DA7
pAIScripting0x00_General_L022:
    %AICMD0x36_UpdateDog()                                     ;B38DAC
    %AICMD0x12_Jump(pAIScripting0x00_General_L022)                                   ;B38DAD


pAIScripting0x00_General_Data18:
 
    %AICMD0x49(aAIScriptingData_L004)                                        ;B38DB0
    %AICMD0x2E($01, aAIScriptingData_L005, $10)                              ;B38DB3
pAIScripting0x00_General_L023:
    %AICMD0x36_UpdateDog()                                     ;B38DB8
    %AICMD0x12_Jump(pAIScripting0x00_General_L023)                                   ;B38DB9


pAIScripting0x00_General_Data19:
 
    %AICMD0x2B(aAIScriptingData_L129, $00)                                   ;B38DBC
pAIScripting0x00_General_L024:
    %AICMD0x2E($01, aAIScriptingData_L130, $10)                              ;B38DC0
    %AICMD0x12_Jump(pAIScripting0x00_General_L026)                                   ;B38DC5
pAIScripting0x00_General_L025:
    %AICMD0x2E($01, aAIScriptingData_L131, $10)                              ;B38DC8
pAIScripting0x00_General_L026:
    %AICMD0x35_UpdateHorse()                                   ;B38DCD
    %AICMD0x12_Jump(pAIScripting0x00_General_L026)                                   ;B38DCE


pAIScripting0x00_General_Data20:
 
    %AICMD0x49(aAIScriptingData_L006)                                        ;B38DD1
pAIScripting0x00_General_L027:
    %AICMD0x2E($01, aAIScriptingData_L007, $10)                              ;B38DD4
    %AICMD0x12_Jump(pAIScripting0x00_General_L029)                                   ;B38DD9
pAIScripting0x00_General_L028:
    %AICMD0x2E($01, aAIScriptingData_L178, $10)                              ;B38DDC
pAIScripting0x00_General_L029:
    %AICMD0x35_UpdateHorse()                                   ;B38DE1
    %AICMD0x12_Jump(pAIScripting0x00_General_L029)                                   ;B38DE2


pAIScripting0x00_General_Data21:
 
    %AICMD0x1A($0048, $0058, aAIScriptingData_L135, $00)                     ;B38DE5
pAIScripting0x00_General_L030:
    %AICMD0x13_Wait(1)                                         ;B38DED
    %AICMD0x12_Jump(pAIScripting0x00_General_L030)                                   ;B38DF0


pAIScripting0x00_General_Data22:
 
    %AICMD0x1B($0119, $00)                                     ;B38DF3
    %AICMD0x13_Wait(32)                                        ;B38DF7
    %AICMD0x37()                                               ;B38DFA
    %AICMD0x10_End()                                           ;B38DFB


pAIScripting0x00_General_Data23:
 
    %AICMD0x2B(aAIScriptingData_L162, $00)                                   ;B38DFC
    %AICMD0x2E($01, aAIScriptingData_L116, $10)                              ;B38E00
pAIScripting0x00_General_L031:
    %AICMD0x31_UpdateCow()                                     ;B38E05
    %AICMD0x12_Jump(pAIScripting0x00_General_L031)                                   ;B38E06


pAIScripting0x00_General_Data24:
 
    %AICMD0x1A($0068, $0168, aAIScriptingData_L004, $00)                     ;B38E09
    %AICMD0x22($20, $20, $01, aAIScriptingData_L005, $10)                    ;B38E11
pAIScripting0x00_General_L032:
    %AICMD0x13_Wait(1)                                         ;B38E18
    %AICMD0x12_Jump(pAIScripting0x00_General_L032)                                   ;B38E1B


pAIScripting0x00_General_Data25:
 
    %AICMD0x1A($00F8, $01D8, aAIScriptingData_L006, $00)                     ;B38E1E
    %AICMD0x22($20, $20, $01, aAIScriptingData_L007, $10)                    ;B38E26
pAIScripting0x00_General_L033:
    %AICMD0x13_Wait(1)                                         ;B38E2D
    %AICMD0x12_Jump(pAIScripting0x00_General_L033)                                   ;B38E30


pAIScripting0x00_General_Data26:
 
    %AICMD0x1A($0108, $0168, aAIScriptingData_L002, $00)                     ;B38E33
    %AICMD0x22($20, $20, $01, aAIScriptingData_L003, $10)                    ;B38E3B
pAIScripting0x00_General_L034:
    %AICMD0x13_Wait(1)                                         ;B38E42
    %AICMD0x12_Jump(pAIScripting0x00_General_L034)                                   ;B38E45


pAIScripting0x00_General_Data27:
 
    %AICMD0x1A($01E8, $0188, aAIScriptingData_L113, $00)                     ;B38E48
    %AICMD0x22($20, $20, $01, aAIScriptingData_L114, $10)                    ;B38E50
pAIScripting0x00_General_L035:
    %AICMD0x13_Wait(1)                                         ;B38E57
    %AICMD0x12_Jump(pAIScripting0x00_General_L035)                                   ;B38E5A


pAIScripting0x00_General_Data28:
 
    %AICMD0x1A($00B8, $01B8, aAIScriptingData_L115, $00)                     ;B38E5D
    %AICMD0x22($20, $20, $01, aAIScriptingData_L116, $10)                    ;B38E65
pAIScripting0x00_General_L036:
    %AICMD0x13_Wait(1)                                         ;B38E6C
    %AICMD0x12_Jump(pAIScripting0x00_General_L036)                                   ;B38E6F


pAIScripting0x00_General_Data29:
 
    %AICMD0x1A($0088, $0168, aAIScriptingData_L046, $01)                     ;B38E72
pAIScripting0x00_General_L037:
    %AICMD0x13_Wait(1)                                         ;B38E7A
    %AICMD0x12_Jump(pAIScripting0x00_General_L037)                                   ;B38E7D


pAIScripting0x00_General_Data30:
 
    %AICMD0x1B($0297, $00)                                     ;B38E80
    %AICMD0x0D($00, $01, $40, $01)                             ;B38E84
    %AICMD0x1B($029B, $00)                                     ;B38E89
    %AICMD0x0D($FF, $00, $80, $01)                             ;B38E8D
    %AICMD0x37()                                               ;B38E92
    %AICMD0x10_End()                                           ;B38E93


pAIScripting0x00_General_Data31:
 
    %AICMD0x2B(aAIScriptingData_L123, $00)                                   ;B38E94
pAIScripting0x00_General_L038:
    %AICMD0x4A()                                               ;B38E98
    %AICMD0x12_Jump(pAIScripting0x00_General_L038)                                   ;B38E99


pAIScripting0x00_General_Data32:
 
    %AICMD0x1A($0078, $01C8, aAIScriptingData_L053, $03)                     ;B38E9C
pAIScripting0x00_General_L039:
    %AICMD0x13_Wait(1)                                         ;B38EA4
    %AICMD0x12_Jump(pAIScripting0x00_General_L039)                                   ;B38EA7


pAIScripting0x00_General_L040:
 
    %AICMD0x13_Wait(1)                                         ;B38EAA
    %AICMD0x43_JumpIfEqual16($8000D4, 5, pAIScripting0x00_General_L040)              ;B38EAD
    %AICMD0x1A($FFE0, $01D8, aAIScriptingData_L054, $02)                     ;B38EB5
    %AICMD0x0D($01, $00, $40, $01)                             ;B38EBD
    %AICMD0x1B($02AF, $01)                                     ;B38EC2
pAIScripting0x00_General_L041:
    %AICMD0x13_Wait(1)                                         ;B38EC6
    %AICMD0x12_Jump(pAIScripting0x00_General_L041)                                   ;B38EC9


pAIScripting0x00_General_Data33:
 
    %AICMD0x1B($01A7, $00)                                     ;B38ECC
    %AICMD0x0D($00, $FF, $20, $01)                             ;B38ED0
    %AICMD0x1B($018B, $00)                                     ;B38ED5
    %AICMD0x0D($FF, $00, $60, $01)                             ;B38ED9
    %AICMD0x37()                                               ;B38EDE
    %AICMD0x10_End()                                           ;B38EDF


pAIScripting0x00_General_Data34:
 
    %AICMD0x1A($0020, $01D8, aAIScriptingData_L054, $03)                     ;B38EE0
    %AICMD0x0D($FF, $00, $40, $01)                             ;B38EE8
    %AICMD0x37()                                               ;B38EED
    %AICMD0x10_End()                                           ;B38EEE


pAIScripting0x00_General_Data35:
 
    %AICMD0x1B($0213, $00)                                     ;B38EEF
    %AICMD0x0D($00, $FF, $20, $01)                             ;B38EF3
    %AICMD0x1B($0214, $00)                                     ;B38EF8
    %AICMD0x0D($FF, $00, $60, $01)                             ;B38EFC
    %AICMD0x37()                                               ;B38F01
    %AICMD0x10_End()                                           ;B38F02


pAIScripting0x00_General_Data36:
 
    %AICMD0x1A($00D8, $0148, aAIScriptingData_L115, $00)                     ;B38F03
pAIScripting0x00_General_L042:
    %AICMD0x13_Wait(1)                                         ;B38F0B
    %AICMD0x12_Jump(pAIScripting0x00_General_L042)                                   ;B38F0E


pAIScripting0x00_General_L043:
 
    %AICMD0x13_Wait(1)                                         ;B38F11
    %AICMD0x43_JumpIfEqual16($8000D4, 5, pAIScripting0x00_General_L043)              ;B38F14
    %AICMD0x1A($FFE0, $01D8, aAIScriptingData_L036, $02)                     ;B38F1C
    %AICMD0x0D($01, $00, $40, $01)                             ;B38F24
    %AICMD0x1B($0274, $01)                                     ;B38F29
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily1, $0B)       ;B38F2D
pAIScripting0x00_General_L044:
    %AICMD0x13_Wait(1)                                         ;B38F32
    %AICMD0x12_Jump(pAIScripting0x00_General_L044)                                   ;B38F35


pAIScripting0x00_General_Data37:
 
    %AICMD0x1B($0275, $00)                                     ;B38F38
    %AICMD0x0D($FF, $00, $40, $01)                             ;B38F3C
    %AICMD0x37()                                               ;B38F41
    %AICMD0x10_End()                                           ;B38F42


pAIScripting0x00_General_Data38:
 
    %AICMD0x1B($0206, $00)                                     ;B38F43
    %AICMD0x13_Wait(60)                                        ;B38F47
    %AICMD0x2F(aAIScriptingData_L006)                                        ;B38F4A
    %AICMD0x12_Jump(pAIScripting0x00_General_L027)                                   ;B38F4D


pAIScripting0x00_General_Data39:
 
    %AICMD0x1B($0207, $00)                                     ;B38F50
    %AICMD0x13_Wait(60)                                        ;B38F54
    %AICMD0x2F(aAIScriptingData_L006)                                        ;B38F57
    %AICMD0x12_Jump(pAIScripting0x00_General_L027)                                   ;B38F5A


pAIScripting0x00_General_Data40:
 
    %AICMD0x1B($0208, $01)                                     ;B38F5D
    %AICMD0x13_Wait(60)                                        ;B38F61
    %AICMD0x2F(aAIScriptingData_L006)                                        ;B38F64
    %AICMD0x12_Jump(pAIScripting0x00_General_L027)                                   ;B38F67


pAIScripting0x00_General_Data41:
 
    %AICMD0x1B($0208, $00)                                     ;B38F6A
    %AICMD0x13_Wait(60)                                        ;B38F6E
    %AICMD0x2F(aAIScriptingData_L006)                                        ;B38F71
    %AICMD0x12_Jump(pAIScripting0x00_General_L027)                                   ;B38F74


pAIScripting0x00_General_Data42:
 
    %AICMD0x1A($0088, $0168, aAIScriptingData_L028, $01)                     ;B38F77
pAIScripting0x00_General_L045:
    %AICMD0x13_Wait(1)                                         ;B38F7F
    %AICMD0x12_Jump(pAIScripting0x00_General_L045)                                   ;B38F82


pAIScripting0x00_General_Data43:
 
    %AICMD0x1B($025B, $00)                                     ;B38F85
    %AICMD0x0D($00, $01, $40, $01)                             ;B38F89
    %AICMD0x1B($025F, $00)                                     ;B38F8E
    %AICMD0x0D($FF, $00, $80, $01)                             ;B38F92
    %AICMD0x37()                                               ;B38F97
    %AICMD0x10_End()                                           ;B38F98


pAIScripting0x00_General_Data44:
 
    %AICMD0x09_StartScript($09, pAIScripting0x00_General_L061)                                   ;B38F99
    %AICMD0x09_StartScript($0A, pAIScripting0x00_General_L066)                                   ;B38F9D
    %AICMD0x10_End()                                           ;B38FA1


pAIScripting0x00_General_Data45:
 
    %AICMD0x2B(aAIScriptingData_L155, $00)                                   ;B38FA2
    %AICMD0x2E($01, aAIScriptingData_L114, $10)                              ;B38FA6
pAIScripting0x00_General_L046:
    %AICMD0x31_UpdateCow()                                     ;B38FAB
    %AICMD0x12_Jump(pAIScripting0x00_General_L046)                                   ;B38FAC


pAIScripting0x00_General_Data46:
 
    %AICMD0x2B(aAIScriptingData_L085, $00)                                   ;B38FAF
    %AICMD0x1B($0321, $00)                                     ;B38FB3
    %AICMD0x13_Wait(64)                                        ;B38FB7
    %AICMD0x2E($01, aAIScriptingData_L085, $10)                              ;B38FBA
pAIScripting0x00_General_L047:
    %AICMD0x33()                                               ;B38FBF
    %AICMD0x12_Jump(pAIScripting0x00_General_L047)                                   ;B38FC0


pAIScripting0x00_General_Data47:
 
    %AICMD0x2B(aAIScriptingData_L085, $00)                                   ;B38FC3
    %AICMD0x2E($01, aAIScriptingData_L085, $10)                              ;B38FC7
pAIScripting0x00_General_L048:
    %AICMD0x33()                                               ;B38FCC
    %AICMD0x12_Jump(pAIScripting0x00_General_L048)                                   ;B38FCD


pAIScripting0x00_General_Data48:
 
    %AICMD0x2B(aAIScriptingData_L084, $02)                                   ;B38FD0
    %AICMD0x0D($01, $00, $40, $02)                             ;B38FD4
    %AICMD0x37()                                               ;B38FD9
    %AICMD0x10_End()                                           ;B38FDA


pAIScripting0x00_General_Data49:
 
    %AICMD0x1A($0268, $0178, aAIScriptingData_L125, $00)                     ;B38FDB
    %AICMD0x13_Wait(64)                                        ;B38FE3
    %AICMD0x37()                                               ;B38FE6
    %AICMD0x10_End()                                           ;B38FE7


pAIScripting0x00_General_Data50:
 
    %AICMD0x1A($0268, $0178, aAIScriptingData_L126, $00)                     ;B38FE8
    %AICMD0x13_Wait(64)                                        ;B38FF0
    %AICMD0x37()                                               ;B38FF3
    %AICMD0x10_End()                                           ;B38FF4


pAIScripting0x00_General_Data51:
 
    %AICMD0x1A($0268, $0178, aAIScriptingData_L127, $00)                     ;B38FF5
pAIScripting0x00_General_L049:
    %AICMD0x34()                                               ;B38FFD
    %AICMD0x12_Jump(pAIScripting0x00_General_L049)                                   ;B38FFE


pAIScripting0x00_General_Data52:
 
    %AICMD0x1A($0088, $0168, aAIScriptingData_L027, $01)                     ;B39001
pAIScripting0x00_General_L050:
    %AICMD0x13_Wait(1)                                         ;B39009
    %AICMD0x12_Jump(pAIScripting0x00_General_L050)                                   ;B3900C


pAIScripting0x00_General_Data53:
 
    %AICMD0x1A($0078, $0178, aAIScriptingData_L027, $01)                     ;B3900F
pAIScripting0x00_General_L051:
    %AICMD0x13_Wait(1)                                         ;B39017
    %AICMD0x12_Jump(pAIScripting0x00_General_L051)                                   ;B3901A


pAIScripting0x00_General_Data54:
 
    %AICMD0x1B($025B, $00)                                     ;B3901D
    %AICMD0x0D($00, $01, $40, $01)                             ;B39021
    %AICMD0x1B($025F, $00)                                     ;B39026
    %AICMD0x0D($FF, $00, $80, $01)                             ;B3902A
    %AICMD0x37()                                               ;B3902F
    %AICMD0x10_End()                                           ;B39030


pAIScripting0x00_General_Data55:
 
    %AICMD0x1B($025B, $00)                                     ;B39031
    %AICMD0x0D($00, $01, $40, $01)                             ;B39035
    %AICMD0x1B($025F, $00)                                     ;B3903A
    %AICMD0x0D($FF, $00, $80, $01)                             ;B3903E
    %AICMD0x37()                                               ;B39043
    %AICMD0x10_End()                                           ;B39044


pAIScripting0x00_General_Data56:
 
    %AICMD0x2B(aAIScriptingData_L140, $00)                                   ;B39045
    %AICMD0x13_Wait(60)                                        ;B39049
    %AICMD0x37()                                               ;B3904C
    %AICMD0x10_End()                                           ;B3904D


pAIScripting0x00_General_Data57:
 
    %AICMD0x2B(aAIScriptingData_L141, $00)                                   ;B3904E
    %AICMD0x13_Wait(60)                                        ;B39052
    %AICMD0x37()                                               ;B39055
    %AICMD0x10_End()                                           ;B39056


pAIScripting0x00_General_Data58:
 
    %AICMD0x2F(aAIScriptingData_L004)                                        ;B39057
    %AICMD0x12_Jump(pAIScripting0x00_General_L020)                                   ;B3905A


pAIScripting0x00_General_Data59:
 
    %AICMD0x2F(aAIScriptingData_L167)                                        ;B3905D
    %AICMD0x12_Jump(pAIScripting0x00_General_L022)                                   ;B39060


pAIScripting0x00_General_Data60:
 
    %AICMD0x2F(aAIScriptingData_L166)                                        ;B39063
    %AICMD0x12_Jump(pAIScripting0x00_General_L022)                                   ;B39066


pAIScripting0x00_General_Data61:
 
    %AICMD0x2F(aAIScriptingData_L004)                                        ;B39069
    %AICMD0x12_Jump(pAIScripting0x00_General_L021)                                   ;B3906C


pAIScripting0x00_General_Data62:
 
    %AICMD0x2F(aAIScriptingData_L168)                                        ;B3906F
    %AICMD0x12_Jump(pAIScripting0x00_General_L022)                                   ;B39072


pAIScripting0x00_General_Data63:
 
    %AICMD0x2F(aAIScriptingData_L169)                                        ;B39075
    %AICMD0x12_Jump(pAIScripting0x00_General_L022)                                   ;B39078


pAIScripting0x00_General_Data64:
 
    %AICMD0x2F(aAIScriptingData_L170)                                        ;B3907B
    %AICMD0x12_Jump(pAIScripting0x00_General_L022)                                   ;B3907E


pAIScripting0x00_General_Data65:
 
    %AICMD0x2F(aAIScriptingData_L171)                                        ;B39081
    %AICMD0x12_Jump(pAIScripting0x00_General_L022)                                   ;B39084


pAIScripting0x00_General_Data66:
 
    %AICMD0x2F(aAIScriptingData_L172)                                        ;B39087
    %AICMD0x12_Jump(pAIScripting0x00_General_L022)                                   ;B3908A


pAIScripting0x00_General_Data67:
 
    %AICMD0x2F(aAIScriptingData_L173)                                        ;B3908D
    %AICMD0x12_Jump(pAIScripting0x00_General_L022)                                   ;B39090


pAIScripting0x00_General_Data68:
 
    %AICMD0x2F(aAIScriptingData_L174)                                        ;B39093
    %AICMD0x12_Jump(pAIScripting0x00_General_L022)                                   ;B39096


pAIScripting0x00_General_Data69:
 
    %AICMD0x2F(aAIScriptingData_L175)                                        ;B39099
    %AICMD0x12_Jump(pAIScripting0x00_General_L022)                                   ;B3909C


pAIScripting0x00_General_Data70:
 
    %AICMD0x2F(aAIScriptingData_L176)                                        ;B3909F
    %AICMD0x12_Jump(pAIScripting0x00_General_L022)                                   ;B390A2


pAIScripting0x00_General_Data71:
 
    %AICMD0x2F(aAIScriptingData_L177)                                        ;B390A5
    %AICMD0x12_Jump(pAIScripting0x00_General_L022)                                   ;B390A8


pAIScripting0x00_General_Data72:
 
    %AICMD0x2F(aAIScriptingData_L129)                                        ;B390AB
    %AICMD0x12_Jump(pAIScripting0x00_General_L025)                                   ;B390AE


pAIScripting0x00_General_Data73:
 
    %AICMD0x2F(aAIScriptingData_L006)                                        ;B390B1
    %AICMD0x12_Jump(pAIScripting0x00_General_L027)                                   ;B390B4


pAIScripting0x00_General_Data74:
 
    %AICMD0x2F(aAIScriptingData_L006)                                        ;B390B7
    %AICMD0x12_Jump(pAIScripting0x00_General_L028)                                   ;B390BA


pAIScripting0x00_General_Data75:
 
    %AICMD0x2F(aAIScriptingData_L179)                                        ;B390BD
    %AICMD0x12_Jump(pAIScripting0x00_General_L029)                                   ;B390C0


pAIScripting0x00_General_Data76:
 
    %AICMD0x2F(aAIScriptingData_L180)                                        ;B390C3
    %AICMD0x12_Jump(pAIScripting0x00_General_L029)                                   ;B390C6


pAIScripting0x00_General_Data77:
 
    %AICMD0x2F(aAIScriptingData_L181)                                        ;B390C9
    %AICMD0x12_Jump(pAIScripting0x00_General_L029)                                   ;B390CC


pAIScripting0x00_General_Data78:
 
    %AICMD0x2F(aAIScriptingData_L182)                                        ;B390CF
    %AICMD0x12_Jump(pAIScripting0x00_General_L029)                                   ;B390D2


pAIScripting0x00_General_Data79:
 
    %AICMD0x2F(aAIScriptingData_L148)                                        ;B390D5
    %AICMD0x12_Jump(pAIScripting0x00_General_L011)                                   ;B390D8


pAIScripting0x00_General_Data80:
 
    %AICMD0x2F(aAIScriptingData_L149)                                        ;B390DB
    %AICMD0x12_Jump(pAIScripting0x00_General_L011)                                   ;B390DE


pAIScripting0x00_General_Data81:
 
    %AICMD0x2F(aAIScriptingData_L150)                                        ;B390E1
    %AICMD0x12_Jump(pAIScripting0x00_General_L011)                                   ;B390E4


pAIScripting0x00_General_Data82:
 
    %AICMD0x2F(aAIScriptingData_L151)                                        ;B390E7
    %AICMD0x12_Jump(pAIScripting0x00_General_L011)                                   ;B390EA


pAIScripting0x00_General_Data83:
 
    %AICMD0x2F(aAIScriptingData_L152)                                        ;B390ED
    %AICMD0x12_Jump(pAIScripting0x00_General_L011)                                   ;B390F0


pAIScripting0x00_General_Data84:
 
    %AICMD0x2F(aAIScriptingData_L153)                                        ;B390F3
    %AICMD0x12_Jump(pAIScripting0x00_General_L001)                                   ;B390F6


pAIScripting0x00_General_Data85:
 
    %AICMD0x2F(aAIScriptingData_L154)                                        ;B390F9
    %AICMD0x12_Jump(pAIScripting0x00_General_L001)                                   ;B390FC


pAIScripting0x00_General_Data86:
 
    %AICMD0x2F(aAIScriptingData_L155)                                        ;B390FF
    %AICMD0x12_Jump(pAIScripting0x00_General_L001)                                   ;B39102


pAIScripting0x00_General_Data87:
 
    %AICMD0x2F(aAIScriptingData_L159)                                        ;B39105
    %AICMD0x12_Jump(pAIScripting0x00_General_L001)                                   ;B39108


pAIScripting0x00_General_Data88:
 
    %AICMD0x2F(aAIScriptingData_L161)                                        ;B3910B
    %AICMD0x12_Jump(pAIScripting0x00_General_L001)                                   ;B3910E


pAIScripting0x00_General_Data89:
 
    %AICMD0x2F(aAIScriptingData_L162)                                        ;B39111
    %AICMD0x12_Jump(pAIScripting0x00_General_L001)                                   ;B39114


pAIScripting0x00_General_Data90:
 
    %AICMD0x2F(aAIScriptingData_L164)                                        ;B39117
    %AICMD0x12_Jump(pAIScripting0x00_General_L005)                                   ;B3911A


pAIScripting0x00_General_Data91:
 
    %AICMD0x2F(aAIScriptingData_L008)                                        ;B3911D
    %AICMD0x12_Jump(pAIScripting0x00_General_L004)                                   ;B39120


pAIScripting0x00_General_Data92:
 
    %AICMD0x2F(aAIScriptingData_L002)                                        ;B39123
    %AICMD0x12_Jump(pAIScripting0x00_General_L010)                                   ;B39126


pAIScripting0x00_General_Data93:
 
    %AICMD0x2B(aAIScriptingData_L183, $00)                                   ;B39129
pAIScripting0x00_General_L052:
    %AICMD0x1F(pAIScripting0x00_General_L053)                                        ;B3912D
    %AICMD0x12_Jump(pAIScripting0x00_General_L052)                                   ;B39130
pAIScripting0x00_General_L053:
    %AICMD0x1C_ShowDialog($03A3, $00)                          ;B39133
    %AICMD0x12_Jump(pAIScripting0x00_General_L052)                                   ;B39137


pAIScripting0x00_General_Data94:
 
    %AICMD0x1B($01CB, $01)                                     ;B3913A
    %AICMD0x13_Wait(60)                                        ;B3913E
    %AICMD0x2F(aAIScriptingData_L113)                                        ;B39141
    %AICMD0x12_Jump(pAIScripting0x00_General_L008)                                   ;B39144


pAIScripting0x00_General_Data95:
 
    %AICMD0x1B($01CB, $00)                                     ;B39147
    %AICMD0x13_Wait(60)                                        ;B3914B
    %AICMD0x2F(aAIScriptingData_L113)                                        ;B3914E
    %AICMD0x12_Jump(pAIScripting0x00_General_L008)                                   ;B39151


pAIScripting0x00_General_Data96:
 
    %AICMD0x1B($01CB, $01)                                     ;B39154
    %AICMD0x13_Wait(60)                                        ;B39158
    %AICMD0x2F(aAIScriptingData_L113)                                        ;B3915B
    %AICMD0x12_Jump(pAIScripting0x00_General_L008)                                   ;B3915E


pAIScripting0x00_General_Data97:
 
    %AICMD0x1B($01CB, $00)                                     ;B39161
    %AICMD0x13_Wait(60)                                        ;B39165
    %AICMD0x2F(aAIScriptingData_L113)                                        ;B39168
    %AICMD0x12_Jump(pAIScripting0x00_General_L008)                                   ;B3916B


pAIScripting0x00_General_Data98:
 
    %AICMD0x1B($01BF, $01)                                     ;B3916E
    %AICMD0x13_Wait(60)                                        ;B39172
    %AICMD0x2F(aAIScriptingData_L115)                                        ;B39175
    %AICMD0x12_Jump(pAIScripting0x00_General_L006)                                   ;B39178


pAIScripting0x00_General_Data99:
 
    %AICMD0x1B($01BF, $00)                                     ;B3917B
    %AICMD0x13_Wait(60)                                        ;B3917F
    %AICMD0x2F(aAIScriptingData_L115)                                        ;B39182
    %AICMD0x12_Jump(pAIScripting0x00_General_L006)                                   ;B39185


pAIScripting0x00_General_Data100:
 
    %AICMD0x1B($01BF, $01)                                     ;B39188
    %AICMD0x13_Wait(60)                                        ;B3918C
    %AICMD0x2F(aAIScriptingData_L115)                                        ;B3918F
    %AICMD0x12_Jump(pAIScripting0x00_General_L006)                                   ;B39192


pAIScripting0x00_General_Data101:
 
    %AICMD0x1B($01BF, $00)                                     ;B39195
    %AICMD0x13_Wait(60)                                        ;B39199
    %AICMD0x2F(aAIScriptingData_L115)                                        ;B3919C
    %AICMD0x12_Jump(pAIScripting0x00_General_L006)                                   ;B3919F


pAIScripting0x00_General_Data102:
 
    %AICMD0x1B($01C7, $01)                                     ;B391A2
    %AICMD0x13_Wait(60)                                        ;B391A6
    %AICMD0x12_Jump(pAIScripting0x00_General_L008)                                   ;B391A9


pAIScripting0x00_General_Data103:
 
    %AICMD0x1B($01C7, $00)                                     ;B391AC
    %AICMD0x13_Wait(60)                                        ;B391B0
    %AICMD0x12_Jump(pAIScripting0x00_General_L008)                                   ;B391B3


pAIScripting0x00_General_Data104:
 
    %AICMD0x1B($01BC, $01)                                     ;B391B6
    %AICMD0x13_Wait(60)                                        ;B391BA
    %AICMD0x12_Jump(pAIScripting0x00_General_L006)                                   ;B391BD


pAIScripting0x00_General_Data105:
 
    %AICMD0x1B($01BC, $00)                                     ;B391C0
    %AICMD0x13_Wait(60)                                        ;B391C4
    %AICMD0x12_Jump(pAIScripting0x00_General_L006)                                   ;B391C7


pAIScripting0x00_General_Data106:
 
    %AICMD0x2F(aAIScriptingData_L117)                                        ;B391CA
    %AICMD0x12_Jump(pAIScripting0x00_General_L014)                                   ;B391CD


pAIScripting0x00_General_Data107:
 
    %AICMD0x2F(aAIScriptingData_L142)                                        ;B391D0
    %AICMD0x12_Jump(pAIScripting0x00_General_L015)                                   ;B391D3


pAIScripting0x00_General_Data108:
 
    %AICMD0x2F(aAIScriptingData_L143)                                        ;B391D6
    %AICMD0x12_Jump(pAIScripting0x00_General_L015)                                   ;B391D9


pAIScripting0x00_General_Data109:
 
    %AICMD0x2F(aAIScriptingData_L144)                                        ;B391DC
    %AICMD0x12_Jump(pAIScripting0x00_General_L015)                                   ;B391DF


pAIScripting0x00_General_Data110:
 
    %AICMD0x2F(aAIScriptingData_L121)                                        ;B391E2
    %AICMD0x12_Jump(pAIScripting0x00_General_L012)                                   ;B391E5


pAIScripting0x00_General_Data111:
 
    %AICMD0x2F(aAIScriptingData_L145)                                        ;B391E8
    %AICMD0x12_Jump(pAIScripting0x00_General_L013)                                   ;B391EB


pAIScripting0x00_General_Data112:
 
    %AICMD0x2F(aAIScriptingData_L146)                                        ;B391EE
    %AICMD0x12_Jump(pAIScripting0x00_General_L013)                                   ;B391F1


pAIScripting0x00_General_Data113:
 
    %AICMD0x2F(aAIScriptingData_L147)                                        ;B391F4
    %AICMD0x12_Jump(pAIScripting0x00_General_L013)                                   ;B391F7


pAIScripting0x00_General_Data114:
 
    %AICMD0x2F(aAIScriptingData_L113)                                        ;B391FA
    %AICMD0x12_Jump(pAIScripting0x00_General_L008)                                   ;B391FD


pAIScripting0x00_General_Data115:
 
    %AICMD0x2F(aAIScriptingData_L156)                                        ;B39200
    %AICMD0x12_Jump(pAIScripting0x00_General_L009)                                   ;B39203


pAIScripting0x00_General_Data116:
 
    %AICMD0x2F(aAIScriptingData_L157)                                        ;B39206
    %AICMD0x12_Jump(pAIScripting0x00_General_L009)                                   ;B39209


pAIScripting0x00_General_Data117:
 
    %AICMD0x2F(aAIScriptingData_L158)                                        ;B3920C
    %AICMD0x12_Jump(pAIScripting0x00_General_L009)                                   ;B3920F


pAIScripting0x00_General_Data118:
 
    %AICMD0x2F(aAIScriptingData_L115)                                        ;B39212
    %AICMD0x12_Jump(pAIScripting0x00_General_L006)                                   ;B39215


pAIScripting0x00_General_Data119:
 
    %AICMD0x2F(aAIScriptingData_L159)                                        ;B39218
    %AICMD0x12_Jump(pAIScripting0x00_General_L007)                                   ;B3921B


pAIScripting0x00_General_Data120:
 
    %AICMD0x2F(aAIScriptingData_L160)                                        ;B3921E
    %AICMD0x12_Jump(pAIScripting0x00_General_L007)                                   ;B39221


pAIScripting0x00_General_Data121:
 
    %AICMD0x2F(aAIScriptingData_L163)                                        ;B39224
    %AICMD0x12_Jump(pAIScripting0x00_General_L007)                                   ;B39227


pAIScripting0x00_General_Data122:
 
    %AICMD0x1A($FFE0, $01D8, aAIScriptingData_L059, $02)                     ;B3922A
    %AICMD0x0D($01, $00, $40, $01)                             ;B39232
    %AICMD0x1B($02BE, $01)                                     ;B39237
pAIScripting0x00_General_L054:
    %AICMD0x13_Wait(1)                                         ;B3923B
    %AICMD0x12_Jump(pAIScripting0x00_General_L054)                                   ;B3923E


pAIScripting0x00_General_Data123:
 
    %AICMD0x1A($0020, $01D8, aAIScriptingData_L059, $03)                     ;B39241
    %AICMD0x0D($FF, $00, $40, $01)                             ;B39249
    %AICMD0x37()                                               ;B3924E
    %AICMD0x10_End()                                           ;B3924F


pAIScripting0x00_General_Data124:
 
    %AICMD0x1A($01A8, $0328, aAIScriptingData_L136, $00)                     ;B39250
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 0, pAIScripting0x00_General_L055)     ;B39258
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 1, pAIScripting0x00_General_L056)     ;B3925F
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 2, pAIScripting0x00_General_L057)     ;B39266
    %AICMD0x12_Jump(pAIScripting0x00_General_L058)                                   ;B3926D
pAIScripting0x00_General_L055:
    %AICMD0x1B($03DA, $00)                                     ;B39270
    %AICMD0x13_Wait(180)                                       ;B39274
    %AICMD0x1B($03D9, $00)                                     ;B39277
    %AICMD0x13_Wait(240)                                       ;B3927B
    %AICMD0x12_Jump(pAIScripting0x00_General_L055)                                   ;B3927E
pAIScripting0x00_General_L056:
    %AICMD0x1B($03DA, $00)                                     ;B39281
    %AICMD0x13_Wait(180)                                       ;B39285
    %AICMD0x1B($03DB, $00)                                     ;B39288
    %AICMD0x13_Wait(370)                                       ;B3928C
    %AICMD0x1B($03D9, $00)                                     ;B3928F
    %AICMD0x13_Wait(180)                                       ;B39293
    %AICMD0x1B($03DA, $01)                                     ;B39296
    %AICMD0x13_Wait(360)                                       ;B3929A
    %AICMD0x12_Jump(pAIScripting0x00_General_L056)                                   ;B3929D
pAIScripting0x00_General_L057:
    %AICMD0x13_Wait(240)                                       ;B392A0
    %AICMD0x1B($03DA, $01)                                     ;B392A3
    %AICMD0x13_Wait(90)                                        ;B392A7
    %AICMD0x12_Jump(pAIScripting0x00_General_L057)                                   ;B392AA
pAIScripting0x00_General_L058:
    %AICMD0x13_Wait(1)                                         ;B392AD
    %AICMD0x12_Jump(pAIScripting0x00_General_L058)                                   ;B392B0


pAIScripting0x00_General_Data125:
 
    %AICMD0x1A($0018, $0048, aAIScriptingData_L136, $00)                     ;B392B3
pAIScripting0x00_General_L059:
    %AICMD0x1F(pAIScripting0x00_General_L060)                                        ;B392BB
    %AICMD0x12_Jump(pAIScripting0x00_General_L059)                                   ;B392BE
pAIScripting0x00_General_L060:
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily3, $04)       ;B392C1
    %AICMD0x3D_TeleportToArea(!AREA_TOOLSSHOP)                 ;B392C6
    %AICMD0x05_SetTransferPosition(144, 456)                   ;B392C8
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B392CD
    %AICMD0x10_End()                                           ;B392CF


pAIScripting0x00_General_Data126:
 
    %AICMD0x2F(aAIScriptingData_L129)                                        ;B392D0
    %AICMD0x12_Jump(pAIScripting0x00_General_L024)                                   ;B392D3


pAIScripting0x00_General_Data127:
 
    %AICMD0x1B($0325, $00)                                     ;B392D6
    %AICMD0x13_Wait(60)                                        ;B392DA
    %AICMD0x37()                                               ;B392DD
    %AICMD0x10_End()                                           ;B392DE


pAIScripting0x00_General_Data128:
 
    %AICMD0x1B($01B9, $00)                                     ;B392DF
    %AICMD0x13_Wait(60)                                        ;B392E3
    %AICMD0x2F(aAIScriptingData_L119)                                        ;B392E6
    %AICMD0x12_Jump(pAIScripting0x00_General_L016)                                   ;B392E9


pAIScripting0x00_General_Data129:
 
    %AICMD0x1B($01B8, $00)                                     ;B392EC
    %AICMD0x13_Wait(60)                                        ;B392F0
    %AICMD0x2F(aAIScriptingData_L119)                                        ;B392F3
    %AICMD0x12_Jump(pAIScripting0x00_General_L016)                                   ;B392F6


pAIScripting0x00_General_Data130:
 
    %AICMD0x1B($01B2, $01)                                     ;B392F9
    %AICMD0x13_Wait(60)                                        ;B392FD
    %AICMD0x2F(aAIScriptingData_L119)                                        ;B39300
    %AICMD0x12_Jump(pAIScripting0x00_General_L016)                                   ;B39303


pAIScripting0x00_General_Data131:
 
    %AICMD0x1B($01B2, $00)                                     ;B39306
    %AICMD0x13_Wait(60)                                        ;B3930A
    %AICMD0x2F(aAIScriptingData_L119)                                        ;B3930D
    %AICMD0x12_Jump(pAIScripting0x00_General_L016)                                   ;B39310


pAIScripting0x00_General_L061:
    %AICMD0x1A($0058, $0148, aAIScriptingData_L030, $02)                     ;B39313
pAIScripting0x00_General_L062:
    %AICMD0x1F(pAIScripting0x00_General_L063)                                        ;B3931B
    %AICMD0x12_Jump(pAIScripting0x00_General_L062)                                   ;B3931E
pAIScripting0x00_General_L063:
    %AICMD0x1C_ShowDialog($013A, $00)                          ;B39321
    %AICMD0x12_Jump(pAIScripting0x00_General_L062)                                   ;B39325
    %AICMD0x1A($0088, $0120, aAIScriptingData_L031, $00)                     ;B39328
pAIScripting0x00_General_L064:
    %AICMD0x1F(pAIScripting0x00_General_L065)                                        ;B39330
    %AICMD0x12_Jump(pAIScripting0x00_General_L064)                                   ;B39333
pAIScripting0x00_General_L065:
    %AICMD0x1C_ShowDialog($013B, $00)                          ;B39336
    %AICMD0x12_Jump(pAIScripting0x00_General_L064)                                   ;B3933A
pAIScripting0x00_General_L066:
    %AICMD0x1A($0088, $0100, aAIScriptingData_L029, $00)                     ;B3933D
    %AICMD0x22($20, $08, $01, aAIScriptingData_L029, $10)                    ;B39345
pAIScripting0x00_General_L067:
    %AICMD0x1F(pAIScripting0x00_General_L068)                                        ;B3934C
    %AICMD0x12_Jump(pAIScripting0x00_General_L067)                                   ;B3934F
pAIScripting0x00_General_L068:
    %AICMD0x1C_ShowDialog($013C, $00)                          ;B39352
    %AICMD0x12_Jump(pAIScripting0x00_General_L067)                                   ;B39356
