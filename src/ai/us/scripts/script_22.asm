

pAIScripting0x22:
    dw DATA8_B49FF8                                            ;B49FD8|        |B49FF8;
    dw DATA8_B4A045                                            ;B49FDA|        |B4A045;
    dw DATA8_B4A091                                            ;B49FDC|        |B4A091;
    dw pAIScripting0x22_L003                                            ;B49FDE|        |B4A0B6;
    dw pAIScripting0x22_L007                                            ;B49FE0|        |B4A0D2;
    dw pAIScripting0x22_L010                                            ;B49FE2|        |B4A11E;
    dw pAIScripting0x22_L014                                            ;B49FE4|        |B4A141;
    dw pAIScripting0x22_L017                                            ;B49FE6|        |B4A1BC;
    dw DATA8_B4A1D8                                            ;B49FE8|        |B4A1D8;
    dw DATA8_B4A278                                            ;B49FEA|        |B4A278;
    dw DATA8_B4A297                                            ;B49FEC|        |B4A297;
    dw DATA8_B4A301                                            ;B49FEE|        |B4A301;
    dw DATA8_B4A321                                            ;B49FF0|        |B4A321;
    dw pAIScripting0x23                                        ;B49FF2|        |B4A37F;
    dw pAIScripting0x23                                        ;B49FF4|        |B4A37F;
    dw pAIScripting0x23                                        ;B49FF6|        |B4A37F;
 
DATA8_B49FF8:
 
    %AICMD0x50()                                               ;B49FF8
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B49FF9
    %AICMD0x08_EnableAIControl()                               ;B49FFB
    %AICMD0x09_StartScript($01, pAIScripting0x22_L001)                                   ;B49FFC
    %AICMD0x38_WaitForFadeIn()                                               ;B4A000
    %AICMD0x0B_SetScriptFlag($00)                                            ;B4A001
    %AICMD0x13_Wait(150)                                       ;B4A003
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4A006
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B4A008
    %AICMD0x11_EnableUserControl()                             ;B4A00A
    %AICMD0x41_AddValue16(nPlayerHappiness, -50)               ;B4A00B
    %AICMD0x10_End()                                           ;B4A011
pAIScripting0x22_L001:
    %AICMD0x1A($00A8, $0078, aAIScriptingData_L071, $03)                     ;B4A012
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B4A01A
    %AICMD0x13_Wait(90)                                        ;B4A01C
    %AICMD0x1C_ShowDialog($019A, $00)                          ;B4A01F
    %AICMD0x1B($02E3, $00)                                     ;B4A023
    %AICMD0x0D($00, $01, $50, $01)                             ;B4A027
    %AICMD0x1B($02E7, $00)                                     ;B4A02C
    %AICMD0x0D($FF, $00, $28, $01)                             ;B4A030
    %AICMD0x1B($02E3, $00)                                     ;B4A035
    %AICMD0x0D($00, $01, $30, $01)                             ;B4A039
    %AICMD0x13_Wait(60)                                        ;B4A03E
    %AICMD0x0B_SetScriptFlag($01)                                            ;B4A041
    %AICMD0x37()                                               ;B4A043
    %AICMD0x10_End()                                           ;B4A044


DATA8_B4A045:
 
    %AICMD0x50()                                               ;B4A045
    %AICMD0x05_SetTransferPosition(136, 120)                   ;B4A046
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4A04B
    %AICMD0x08_EnableAIControl()                               ;B4A04D
    %AICMD0x09_StartScript($01, pAIScripting0x22_L002)                                   ;B4A04E
    %AICMD0x38_WaitForFadeIn()                                               ;B4A052
    %AICMD0x0B_SetScriptFlag($00)                                            ;B4A053
    %AICMD0x13_Wait(150)                                       ;B4A055
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4A058
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B4A05A
    %AICMD0x11_EnableUserControl()                             ;B4A05C
    %AICMD0x10_End()                                           ;B4A05D
pAIScripting0x22_L002:
    %AICMD0x1A($00A8, $0078, aAIScriptingData_L071, $03)                     ;B4A05E
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B4A066
    %AICMD0x13_Wait(90)                                        ;B4A068
    %AICMD0x1C_ShowDialog($019A, $00)                          ;B4A06B
    %AICMD0x1B($02E3, $00)                                     ;B4A06F
    %AICMD0x0D($00, $01, $50, $01)                             ;B4A073
    %AICMD0x1B($02E7, $00)                                     ;B4A078
    %AICMD0x0D($FF, $00, $28, $01)                             ;B4A07C
    %AICMD0x1B($02E3, $00)                                     ;B4A081
    %AICMD0x0D($00, $01, $30, $01)                             ;B4A085
    %AICMD0x13_Wait(60)                                        ;B4A08A
    %AICMD0x0B_SetScriptFlag($01)                                            ;B4A08D
    %AICMD0x37()                                               ;B4A08F
    %AICMD0x10_End()                                           ;B4A090


DATA8_B4A091:
 
    %AICMD0x50()                                               ;B4A091
    %AICMD0x14_JumpIfFlagSet(strcFlags.event4, $00, pAIScripting0x22_L003)   ;B4A092
    %AICMD0x14_JumpIfFlagSet(strcFlags.event4, $01, pAIScripting0x22_L007)   ;B4A099
    %AICMD0x14_JumpIfFlagSet(strcFlags.event4, $02, pAIScripting0x22_L010)   ;B4A0A0
    %AICMD0x14_JumpIfFlagSet(strcFlags.event4, $03, pAIScripting0x22_L014)   ;B4A0A7
    %AICMD0x14_JumpIfFlagSet(strcFlags.event4, $04, pAIScripting0x22_L017)   ;B4A0AE
    %AICMD0x10_End()                                           ;B4A0B5


pAIScripting0x22_L003:
 
    %AICMD0x50()                                               ;B4A0B6
    %AICMD0x09_StartScript($01, pAIScripting0x22_L004)                                   ;B4A0B7
    %AICMD0x38_WaitForFadeIn()                                               ;B4A0BB
    %AICMD0x10_End()                                           ;B4A0BC
pAIScripting0x22_L004:
    %AICMD0x1A($0158, $0058, aAIScriptingData_L061, $00)                     ;B4A0BD
pAIScripting0x22_L005:
    %AICMD0x1F(pAIScripting0x22_L006)                                        ;B4A0C5
    %AICMD0x12_Jump(pAIScripting0x22_L005)                                   ;B4A0C8
pAIScripting0x22_L006:
    %AICMD0x1C_ShowDialog($01D8, $00)                          ;B4A0CB
    %AICMD0x12_Jump(pAIScripting0x22_L005)                                   ;B4A0CF


pAIScripting0x22_L007:
 
    %AICMD0x50()                                               ;B4A0D2
    %AICMD0x08_EnableAIControl()                               ;B4A0D3
    %AICMD0x09_StartScript($01, pAIScripting0x22_L008)                                   ;B4A0D4
    %AICMD0x38_WaitForFadeIn()                                               ;B4A0D8
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 16)                  ;B4A0D9
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 20)                  ;B4A0DD
    %AICMD0x0B_SetScriptFlag($00)                                            ;B4A0E1
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B4A0E3
    %AICMD0x28_ClearBit(strcFlags.event6, $01)                          ;B4A0E5
    %AICMD0x3C()                                               ;B4A0EA
    %AICMD0x10_End()                                           ;B4A0EB
pAIScripting0x22_L008:
    %AICMD0x1A($0058, $0168, aAIScriptingData_L071, $03)                     ;B4A0EC
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B4A0F4
    %AICMD0x13_Wait(60)                                        ;B4A0F6
    %AICMD0x1B($02E7, $01)                                     ;B4A0F9
    %AICMD0x0D($01, $00, $20, $01)                             ;B4A0FD
    %AICMD0x1C_ShowDialog($019B, $00)                          ;B4A102
    %AICMD0x41_AddValue16(nLove_Maria, 100)                    ;B4A106
    %AICMD0x1B($02F0, $01)                                     ;B4A10C
    %AICMD0x13_Wait(60)                                        ;B4A110
    %AICMD0x0B_SetScriptFlag($01)                                            ;B4A113
    %AICMD0x12_Jump(pAIScripting0x22_L009)                                   ;B4A115
pAIScripting0x22_L009:
    %AICMD0x13_Wait(1)                                         ;B4A118
    %AICMD0x12_Jump(pAIScripting0x22_L009)                                   ;B4A11B


pAIScripting0x22_L010:
 
    %AICMD0x50()                                               ;B4A11E
    %AICMD0x09_StartScript($01, pAIScripting0x22_L011)                                   ;B4A11F
    %AICMD0x38_WaitForFadeIn()                                               ;B4A123
    %AICMD0x10_End()                                           ;B4A124
pAIScripting0x22_L011:
    %AICMD0x1A($0028, $0164, aAIScriptingData_L047, $00)                     ;B4A125
    %AICMD0x22($01, $01, $01, aAIScriptingData_L047, $01)                    ;B4A12D
pAIScripting0x22_L012:
    %AICMD0x1F(pAIScripting0x22_L013)                                        ;B4A134
    %AICMD0x12_Jump(pAIScripting0x22_L012)                                   ;B4A137
pAIScripting0x22_L013:
    %AICMD0x1C_ShowDialog($01DF, $00)                          ;B4A13A
    %AICMD0x12_Jump(pAIScripting0x22_L012)                                   ;B4A13E


pAIScripting0x22_L014:
 
    %AICMD0x50()                                               ;B4A141
    %AICMD0x08_EnableAIControl()                               ;B4A142
    %AICMD0x09_StartScript($01, pAIScripting0x22_L015)                                   ;B4A143
    %AICMD0x38_WaitForFadeIn()                                               ;B4A147
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 32)                 ;B4A148
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 48)                    ;B4A14C
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4A150
    %AICMD0x0B_SetScriptFlag($00)                                            ;B4A152
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B4A154
    %AICMD0x13_Wait(90)                                        ;B4A156
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 16)                  ;B4A159
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 32)                 ;B4A15D
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 16)                    ;B4A161
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 32)                  ;B4A165
    %AICMD0x0B_SetScriptFlag($02)                                            ;B4A169
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 64)                  ;B4A16B
    %AICMD0x0C_WaitForScriptFlag($03)                                            ;B4A16F
    %AICMD0x28_ClearBit(strcFlags.event6, $01)                          ;B4A171
    %AICMD0x3C()                                               ;B4A176
    %AICMD0x10_End()                                           ;B4A177
pAIScripting0x22_L015:
    %AICMD0x1A($0098, $0088, aAIScriptingData_L071, $01)                     ;B4A178
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B4A180
    %AICMD0x13_Wait(30)                                        ;B4A182
    %AICMD0x1B($02E7, $01)                                     ;B4A185
    %AICMD0x0B_SetScriptFlag($01)                                            ;B4A189
    %AICMD0x0C_WaitForScriptFlag($02)                                            ;B4A18B
    %AICMD0x13_Wait(30)                                        ;B4A18D
    %AICMD0x1B($02E7, $00)                                     ;B4A190
    %AICMD0x13_Wait(30)                                        ;B4A194
    %AICMD0x1C_ShowDialog($019C, $00)                          ;B4A197
    %AICMD0x41_AddValue16(nLove_Ann, 100)                      ;B4A19B
    %AICMD0x1B($02E7, $01)                                     ;B4A1A1
    %AICMD0x0D($01, $00, $04, $01)                             ;B4A1A5
    %AICMD0x1B($02F0, $01)                                     ;B4A1AA
    %AICMD0x13_Wait(60)                                        ;B4A1AE
    %AICMD0x0B_SetScriptFlag($03)                                            ;B4A1B1
    %AICMD0x12_Jump(pAIScripting0x22_L016)                                   ;B4A1B3
pAIScripting0x22_L016:
    %AICMD0x13_Wait(1)                                         ;B4A1B6
    %AICMD0x12_Jump(pAIScripting0x22_L016)                                   ;B4A1B9


pAIScripting0x22_L017:
 
    %AICMD0x50()                                               ;B4A1BC
    %AICMD0x09_StartScript($01, pAIScripting0x22_L018)                                   ;B4A1BD
    %AICMD0x38_WaitForFadeIn()                                               ;B4A1C1
    %AICMD0x10_End()                                           ;B4A1C2
pAIScripting0x22_L018:
    %AICMD0x1A($0028, $0168, aAIScriptingData_L064, $00)                     ;B4A1C3
pAIScripting0x22_L019:
    %AICMD0x1F(pAIScripting0x22_L020)                                        ;B4A1CB
    %AICMD0x12_Jump(pAIScripting0x22_L019)                                   ;B4A1CE
pAIScripting0x22_L020:
    %AICMD0x1C_ShowDialog($01E9, $00)                          ;B4A1D1
    %AICMD0x12_Jump(pAIScripting0x22_L019)                                   ;B4A1D5


DATA8_B4A1D8:
 
    %AICMD0x50()                                               ;B4A1D8
    %AICMD0x08_EnableAIControl()                               ;B4A1D9
    %AICMD0x09_StartScript($01, pAIScripting0x22_L021)                                   ;B4A1DA
    %AICMD0x38_WaitForFadeIn()                                               ;B4A1DE
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 32)                    ;B4A1DF
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4A1E3
    %AICMD0x0B_SetScriptFlag($00)                                            ;B4A1E5
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B4A1E7
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 16)                 ;B4A1E9
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 32)                    ;B4A1ED
    %AICMD0x0B_SetScriptFlag($02)                                            ;B4A1F1
    %AICMD0x0C_WaitForScriptFlag($03)                                            ;B4A1F3
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 16)                    ;B4A1F5
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 16)                 ;B4A1F9
    %AICMD0x0B_SetScriptFlag($04)                                            ;B4A1FD
    %AICMD0x0C_WaitForScriptFlag($05)                                            ;B4A1FF
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4A201
    %AICMD0x0C_WaitForScriptFlag($06)                                            ;B4A203
    %AICMD0x19($0024, $00)                                     ;B4A205
    %AICMD0x13_Wait(60)                                        ;B4A209
    %AICMD0x1C_ShowDialog($019D, $00)                          ;B4A20C
    %AICMD0x28_ClearBit(strcFlags.event6, $01)                          ;B4A210
    %AICMD0x3C()                                               ;B4A215
    %AICMD0x10_End()                                           ;B4A216
pAIScripting0x22_L021:
    %AICMD0x1A($0078, $0088, aAIScriptingData_L071, $01)                     ;B4A217
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B4A21F
    %AICMD0x13_Wait(30)                                        ;B4A221
    %AICMD0x1B($02E5, $00)                                     ;B4A224
    %AICMD0x0D($00, $FF, $20, $01)                             ;B4A228
    %AICMD0x0B_SetScriptFlag($01)                                            ;B4A22D
    %AICMD0x0C_WaitForScriptFlag($02)                                            ;B4A22F
    %AICMD0x13_Wait(30)                                        ;B4A231
    %AICMD0x1B($02E7, $01)                                     ;B4A234
    %AICMD0x0D($01, $00, $20, $01)                             ;B4A238
    %AICMD0x0B_SetScriptFlag($03)                                            ;B4A23D
    %AICMD0x0C_WaitForScriptFlag($04)                                            ;B4A23F
    %AICMD0x13_Wait(30)                                        ;B4A241
    %AICMD0x1B($02E3, $00)                                     ;B4A244
    %AICMD0x0D($00, $01, $40, $01)                             ;B4A248
    %AICMD0x0B_SetScriptFlag($05)                                            ;B4A24D
    %AICMD0x13_Wait(60)                                        ;B4A24F
    %AICMD0x1B($02E7, $00)                                     ;B4A252
    %AICMD0x0D($FF, $00, $10, $01)                             ;B4A256
    %AICMD0x1B($02E5, $00)                                     ;B4A25B
    %AICMD0x13_Wait(60)                                        ;B4A25F
    %AICMD0x0D($00, $FE, $1A, $01)                             ;B4A262
    %AICMD0x0B_SetScriptFlag($06)                                            ;B4A267
    %AICMD0x41_AddValue16(nLove_Nina, 100)                     ;B4A269
    %AICMD0x12_Jump(pAIScripting0x22_L022)                                   ;B4A26F
pAIScripting0x22_L022:
    %AICMD0x13_Wait(1)                                         ;B4A272
    %AICMD0x12_Jump(pAIScripting0x22_L022)                                   ;B4A275


DATA8_B4A278:
 
    %AICMD0x50()                                               ;B4A278
    %AICMD0x09_StartScript($01, pAIScripting0x22_L023)                                   ;B4A279
    %AICMD0x38_WaitForFadeIn()                                               ;B4A27D
    %AICMD0x10_End()                                           ;B4A27E
pAIScripting0x22_L023:
    %AICMD0x1A($0028, $0198, aAIScriptingData_L048, $00)                     ;B4A27F
    %AICMD0x12_Jump(pAIScripting0x22_L024)                                   ;B4A287
pAIScripting0x22_L024:
    %AICMD0x1F(pAIScripting0x22_L025)                                        ;B4A28A
    %AICMD0x12_Jump(pAIScripting0x22_L024)                                   ;B4A28D
pAIScripting0x22_L025:
    %AICMD0x1C_ShowDialog($01B1, $00)                          ;B4A290
    %AICMD0x12_Jump(pAIScripting0x22_L024)                                   ;B4A294


DATA8_B4A297:
 
    %AICMD0x50()                                               ;B4A297
    %AICMD0x08_EnableAIControl()                               ;B4A298
    %AICMD0x09_StartScript($01, pAIScripting0x22_L026)                                   ;B4A299
    %AICMD0x38_WaitForFadeIn()                                               ;B4A29D
    %AICMD0x13_Wait(90)                                        ;B4A29E
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 16)                    ;B4A2A1
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 16)                  ;B4A2A5
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B4A2A9
    %AICMD0x0B_SetScriptFlag($00)                                            ;B4A2AB
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B4A2AD
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 96)                    ;B4A2AF
    %AICMD0x0B_SetScriptFlag($02)                                            ;B4A2B3
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 32)                    ;B4A2B5
    %AICMD0x0C_WaitForScriptFlag($03)                                            ;B4A2B9
    %AICMD0x13_Wait(60)                                        ;B4A2BB
    %AICMD0x28_ClearBit(strcFlags.event6, $01)                          ;B4A2BE
    %AICMD0x3C()                                               ;B4A2C3
    %AICMD0x10_End()                                           ;B4A2C4
pAIScripting0x22_L026:
    %AICMD0x1A($0058, $0088, aAIScriptingData_L071, $00)                     ;B4A2C5
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B4A2CD
    %AICMD0x1B($02E5, $00)                                     ;B4A2CF
    %AICMD0x0D($00, $FF, $30, $01)                             ;B4A2D3
    %AICMD0x1B($02E4, $00)                                     ;B4A2D8
    %AICMD0x0B_SetScriptFlag($01)                                            ;B4A2DC
    %AICMD0x0C_WaitForScriptFlag($02)                                            ;B4A2DE
    %AICMD0x13_Wait(10)                                        ;B4A2E0
    %AICMD0x1C_ShowDialog($019E, $00)                          ;B4A2E3
    %AICMD0x41_AddValue16(nLove_Ellen, 100)                    ;B4A2E7
    %AICMD0x1B($02E3, $00)                                     ;B4A2ED
    %AICMD0x0D($00, $01, $08, $02)                             ;B4A2F1
    %AICMD0x0B_SetScriptFlag($03)                                            ;B4A2F6
    %AICMD0x12_Jump(pAIScripting0x22_L027)                                   ;B4A2F8
pAIScripting0x22_L027:
    %AICMD0x13_Wait(1)                                         ;B4A2FB
    %AICMD0x12_Jump(pAIScripting0x22_L027)                                   ;B4A2FE


DATA8_B4A301:
 
    %AICMD0x50()                                               ;B4A301
    %AICMD0x09_StartScript($01, pAIScripting0x22_L028)                                   ;B4A302
    %AICMD0x38_WaitForFadeIn()                                               ;B4A306
    %AICMD0x10_End()                                           ;B4A307
pAIScripting0x22_L028:
    %AICMD0x1A($0028, $0198, aAIScriptingData_L041, $00)                     ;B4A308
pAIScripting0x22_L029:
    %AICMD0x1F(pAIScripting0x22_L030)                                        ;B4A310
    %AICMD0x12_Jump(pAIScripting0x22_L029)                                   ;B4A313
pAIScripting0x22_L030:
    %AICMD0x1C_ShowDialog($01EA, $00)                          ;B4A316
    %AICMD0x1B($0285, $00)                                     ;B4A31A
    %AICMD0x12_Jump(pAIScripting0x22_L029)                                   ;B4A31E


DATA8_B4A321:
    %AICMD0x50()                                               ;B4A321
    %AICMD0x08_EnableAIControl()                               ;B4A322
    %AICMD0x09_StartScript($01, pAIScripting0x22_L031)                                   ;B4A323
    %AICMD0x38_WaitForFadeIn()                                               ;B4A327
    %AICMD0x13_Wait(90)                                        ;B4A328
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 24)                    ;B4A32B
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 68)                  ;B4A32F
    %AICMD0x40_DisableTileInteractions()                       ;B4A333
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 94)                    ;B4A334
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4A338
    %AICMD0x0B_SetScriptFlag($00)                                            ;B4A33A
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B4A33C
    %AICMD0x13_Wait(90)                                        ;B4A33E
    %AICMD0x28_ClearBit(strcFlags.event6, $01)                          ;B4A341
    %AICMD0x3C()                                               ;B4A346
    %AICMD0x10_End()                                           ;B4A347
pAIScripting0x22_L031:
    %AICMD0x1A($0020, $004E, aAIScriptingData_L071, $03)                     ;B4A348
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B4A350
    %AICMD0x13_Wait(30)                                        ;B4A352
    %AICMD0x1B($02E7, $01)                                     ;B4A355
    %AICMD0x0D($01, $00, $18, $01)                             ;B4A359
    %AICMD0x1C_ShowDialog($019F, $00)                          ;B4A35E
    %AICMD0x41_AddValue16(nLove_Eve, 100)                      ;B4A362
    %AICMD0x13_Wait(10)                                        ;B4A368
    %AICMD0x0D($02, $00, $01, $01)                             ;B4A36B
    %AICMD0x1B($02F0, $01)                                     ;B4A370
    %AICMD0x0B_SetScriptFlag($01)                                            ;B4A374
    %AICMD0x12_Jump(pAIScripting0x22_L032)                                   ;B4A376
pAIScripting0x22_L032:
    %AICMD0x13_Wait(1)                                         ;B4A379
    %AICMD0x12_Jump(pAIScripting0x22_L032)                                   ;B4A37C
