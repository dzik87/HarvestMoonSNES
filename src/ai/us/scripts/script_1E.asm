

pAIScripting0x1E:
    dw DATA8_B4969A                                            ;B4967A|        |B4969A;
    dw pAIScripting0x1F                                        ;B4967C|        |B49A3F;
    dw pAIScripting0x1F                                        ;B4967E|        |B49A3F;
    dw pAIScripting0x1F                                        ;B49680|        |B49A3F;
    dw pAIScripting0x1F                                        ;B49682|        |B49A3F;
    dw pAIScripting0x1F                                        ;B49684|        |B49A3F;
    dw pAIScripting0x1F                                        ;B49686|        |B49A3F;
    dw pAIScripting0x1F                                        ;B49688|        |B49A3F;
    dw pAIScripting0x1F                                        ;B4968A|        |B49A3F;
    dw pAIScripting0x1F                                        ;B4968C|        |B49A3F;
    dw pAIScripting0x1F                                        ;B4968E|        |B49A3F;
    dw pAIScripting0x1F                                        ;B49690|        |B49A3F;
    dw pAIScripting0x1F                                        ;B49692|        |B49A3F;
    dw pAIScripting0x1F                                        ;B49694|        |B49A3F;
    dw pAIScripting0x1F                                        ;B49696|        |B49A3F;
    dw pAIScripting0x1F                                        ;B49698|        |B49A3F;
 
DATA8_B4969A:
    %AICMD0x50()                                               ;B4969A
    %AICMD0x00_SetMusic($18, $B4)                              ;B4969B
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $09)       ;B4969E
    %AICMD0x02_FreezeTime()                                    ;B496A3
    %AICMD0x03_SetHour($07)                                    ;B496A4
    %AICMD0x05_SetTransferPosition(360, 152)                   ;B496A6
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B496AB
    %AICMD0x08_EnableAIControl()                               ;B496AD
    %AICMD0x19($00E8, $00)                                     ;B496AE
    %AICMD0x09_StartScript($01, pAIScripting0x1E_L008)                                   ;B496B2
    %AICMD0x09_StartScript($02, pAIScripting0x1E_L024)                                   ;B496B6
    %AICMD0x09_StartScript($03, pAIScripting0x1E_L026)                                   ;B496BA
    %AICMD0x09_StartScript($04, pAIScripting0x1E_L028)                                   ;B496BE
    %AICMD0x09_StartScript($05, pAIScripting0x1E_L030)                                   ;B496C2
    %AICMD0x09_StartScript($06, pAIScripting0x1E_L034)                                   ;B496C6
    %AICMD0x09_StartScript($07, pAIScripting0x1E_L032)                                   ;B496CA
    %AICMD0x09_StartScript($08, pAIScripting0x1E_L036)                                   ;B496CE
    %AICMD0x09_StartScript($09, pAIScripting0x1E_L038)                                   ;B496D2
    %AICMD0x09_StartScript($0A, pAIScripting0x1E_L006)                                   ;B496D6
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 0, pAIScripting0x1E_L001)     ;B496DA
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 1, pAIScripting0x1E_L002)     ;B496E1
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 2, pAIScripting0x1E_L003)     ;B496E8
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, pAIScripting0x1E_L004)     ;B496EF
pAIScripting0x1E_L001:
    %AICMD0x06_SetDestinationArea(!AREA_TOWNSPRING)            ;B496F6
    %AICMD0x12_Jump(pAIScripting0x1E_L005)                                   ;B496F8
pAIScripting0x1E_L002:
    %AICMD0x06_SetDestinationArea(!AREA_TOWNSUMMER)            ;B496FB
    %AICMD0x12_Jump(pAIScripting0x1E_L005)                                   ;B496FD
pAIScripting0x1E_L003:
    %AICMD0x06_SetDestinationArea(!AREA_TOWNFALL)              ;B49700
    %AICMD0x12_Jump(pAIScripting0x1E_L005)                                   ;B49702
pAIScripting0x1E_L004:
    %AICMD0x06_SetDestinationArea(!AREA_TOWNWINTER)            ;B49705
    %AICMD0x12_Jump(pAIScripting0x1E_L005)                                   ;B49707
pAIScripting0x1E_L005:
    %AICMD0x38_WaitForFadeIn()                                               ;B4970A
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B4970B
    %AICMD0x09_StartScript($0B, pAIScripting0x1E_L019)                                   ;B4970D
    %AICMD0x09_StartScript($0C, pAIScripting0x1E_L020)                                   ;B49711
    %AICMD0x09_StartScript($0D, pAIScripting0x1E_L021)                                   ;B49715
    %AICMD0x09_StartScript($0E, pAIScripting0x1E_L022)                                   ;B49719
    %AICMD0x09_StartScript($0F, pAIScripting0x1E_L023)                                   ;B4971D
    %AICMD0x0C_WaitForScriptFlag($03)                                            ;B49721
    %AICMD0x13_Wait(60)                                        ;B49723
    %AICMD0x41_AddValue16(nPlayerHappiness, 50)                ;B49726
    %AICMD0x01_UnfreezeTime()                                  ;B4972C
    %AICMD0x24_NextHourPalette($74)                            ;B4972D
    %AICMD0x13_Wait(180)                                       ;B4972F
    %AICMD0x1C_ShowDialog($01BF, $00)                          ;B49732
    %AICMD0x47_SetValue8($800973, 3)                           ;B49736
    %AICMD0x10_End()                                           ;B4973B
pAIScripting0x1E_L006:
    %AICMD0x1A($0168, $0098, aAIScriptingData_L204, $00)                     ;B4973C
    %AICMD0x13_Wait(180)                                       ;B49744
    %AICMD0x1B($032D, $00)                                     ;B49747
    %AICMD0x29_SetMapScrooling(0, 1, 16)                       ;B4974B
    %AICMD0x0D($00, $01, $10, $01)                             ;B49751
    %AICMD0x1B($032C, $00)                                     ;B49756
    %AICMD0x13_Wait(60)                                        ;B4975A
    %AICMD0x1B($032E, $00)                                     ;B4975D
    %AICMD0x13_Wait(60)                                        ;B49761
    %AICMD0x1B($032F, $00)                                     ;B49764
    %AICMD0x09_StartScript($10, pAIScripting0x1E_L007)                                   ;B49768
    %AICMD0x13_Wait(120)                                       ;B4976C
    %AICMD0x1B($032C, $00)                                     ;B4976F
    %AICMD0x13_Wait(60)                                        ;B49773
    %AICMD0x1B($032D, $00)                                     ;B49776
    %AICMD0x29_SetMapScrooling(0, 1, 48)                       ;B4977A
    %AICMD0x0D($00, $01, $30, $01)                             ;B49780
    %AICMD0x13_Wait(60)                                        ;B49785
    %AICMD0x1B($032C, $00)                                     ;B49788
    %AICMD0x0B_SetScriptFlag($01)                                            ;B4978C
    %AICMD0x10_End()                                           ;B4978E
pAIScripting0x1E_L007:
    %AICMD0x1A($0170, $0090, aAIScriptingData_L205, $00)                     ;B4978F
    %AICMD0x13_Wait(60)                                        ;B49797
    %AICMD0x37()                                               ;B4979A
    %AICMD0x10_End()                                           ;B4979B
pAIScripting0x1E_L008:
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $00, pAIScripting0x1E_L009)   ;B4979C
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $01, pAIScripting0x1E_L011)   ;B497A3
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $02, pAIScripting0x1E_L013)   ;B497AA
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $03, pAIScripting0x1E_L015)   ;B497B1
    %AICMD0x14_JumpIfFlagSet(strcFlags.event2, $04, pAIScripting0x1E_L017)   ;B497B8
pAIScripting0x1E_L009:
    %AICMD0x1A($0178, $0098, aAIScriptingData_L108, $00)                     ;B497BF
    %AICMD0x13_Wait(180)                                       ;B497C7
    %AICMD0x1B($0331, $00)                                     ;B497CA
    %AICMD0x0D($00, $01, $10, $01)                             ;B497CE
    %AICMD0x1B($0330, $00)                                     ;B497D3
    %AICMD0x13_Wait(64)                                        ;B497D7
    %AICMD0x1B($0332, $00)                                     ;B497DA
    %AICMD0x13_Wait(60)                                        ;B497DE
    %AICMD0x1B($0333, $00)                                     ;B497E1
    %AICMD0x13_Wait(120)                                       ;B497E5
    %AICMD0x1B($0330, $00)                                     ;B497E8
    %AICMD0x13_Wait(60)                                        ;B497EC
    %AICMD0x1B($0331, $00)                                     ;B497EF
    %AICMD0x0D($00, $01, $30, $01)                             ;B497F3
    %AICMD0x0B_SetScriptFlag($02)                                            ;B497F8
pAIScripting0x1E_L010:
    %AICMD0x13_Wait(1)                                         ;B497FA
    %AICMD0x12_Jump(pAIScripting0x1E_L010)                                   ;B497FD
pAIScripting0x1E_L011:
    %AICMD0x1A($0178, $0098, aAIScriptingData_L109, $00)                     ;B49800
    %AICMD0x1B($0335, $00)                                     ;B49808
    %AICMD0x13_Wait(180)                                       ;B4980C
    %AICMD0x0D($00, $01, $10, $01)                             ;B4980F
    %AICMD0x1B($0334, $00)                                     ;B49814
    %AICMD0x13_Wait(60)                                        ;B49818
    %AICMD0x1B($0336, $00)                                     ;B4981B
    %AICMD0x13_Wait(60)                                        ;B4981F
    %AICMD0x1B($0337, $00)                                     ;B49822
    %AICMD0x13_Wait(120)                                       ;B49826
    %AICMD0x1B($0336, $00)                                     ;B49829
    %AICMD0x13_Wait(60)                                        ;B4982D
    %AICMD0x1B($0335, $00)                                     ;B49830
    %AICMD0x0D($00, $01, $30, $01)                             ;B49834
    %AICMD0x0B_SetScriptFlag($02)                                            ;B49839
pAIScripting0x1E_L012:
    %AICMD0x13_Wait(1)                                         ;B4983B
    %AICMD0x12_Jump(pAIScripting0x1E_L012)                                   ;B4983E
pAIScripting0x1E_L013:
    %AICMD0x1A($0178, $0098, aAIScriptingData_L110, $00)                     ;B49841
    %AICMD0x1B($0341, $00)                                     ;B49849
    %AICMD0x13_Wait(180)                                       ;B4984D
    %AICMD0x0D($00, $01, $10, $01)                             ;B49850
    %AICMD0x1B($0340, $00)                                     ;B49855
    %AICMD0x13_Wait(60)                                        ;B49859
    %AICMD0x1B($0342, $00)                                     ;B4985C
    %AICMD0x13_Wait(60)                                        ;B49860
    %AICMD0x1B($0343, $00)                                     ;B49863
    %AICMD0x13_Wait(120)                                       ;B49867
    %AICMD0x1B($0342, $00)                                     ;B4986A
    %AICMD0x13_Wait(60)                                        ;B4986E
    %AICMD0x1B($0341, $00)                                     ;B49871
    %AICMD0x0D($00, $01, $30, $01)                             ;B49875
    %AICMD0x0B_SetScriptFlag($02)                                            ;B4987A
pAIScripting0x1E_L014:
    %AICMD0x13_Wait(1)                                         ;B4987C
    %AICMD0x12_Jump(pAIScripting0x1E_L014)                                   ;B4987F
pAIScripting0x1E_L015:
    %AICMD0x1A($0178, $0098, aAIScriptingData_L111, $00)                     ;B49882
    %AICMD0x1B($0339, $00)                                     ;B4988A
    %AICMD0x13_Wait(180)                                       ;B4988E
    %AICMD0x0D($00, $01, $10, $01)                             ;B49891
    %AICMD0x1B($0338, $00)                                     ;B49896
    %AICMD0x13_Wait(60)                                        ;B4989A
    %AICMD0x1B($033A, $00)                                     ;B4989D
    %AICMD0x13_Wait(60)                                        ;B498A1
    %AICMD0x1B($033B, $00)                                     ;B498A4
    %AICMD0x13_Wait(120)                                       ;B498A8
    %AICMD0x1B($0338, $00)                                     ;B498AB
    %AICMD0x13_Wait(60)                                        ;B498AF
    %AICMD0x1B($0339, $00)                                     ;B498B2
    %AICMD0x0D($00, $01, $30, $01)                             ;B498B6
    %AICMD0x0B_SetScriptFlag($02)                                            ;B498BB
pAIScripting0x1E_L016:
    %AICMD0x13_Wait(1)                                         ;B498BD
    %AICMD0x12_Jump(pAIScripting0x1E_L016)                                   ;B498C0
pAIScripting0x1E_L017:
    %AICMD0x1A($0178, $0098, aAIScriptingData_L112, $00)                     ;B498C3
    %AICMD0x1B($033D, $00)                                     ;B498CB
    %AICMD0x13_Wait(180)                                       ;B498CF
    %AICMD0x0D($00, $01, $10, $01)                             ;B498D2
    %AICMD0x1B($033C, $00)                                     ;B498D7
    %AICMD0x13_Wait(60)                                        ;B498DB
    %AICMD0x1B($033E, $00)                                     ;B498DE
    %AICMD0x13_Wait(60)                                        ;B498E2
    %AICMD0x1B($033F, $00)                                     ;B498E5
    %AICMD0x13_Wait(120)                                       ;B498E9
    %AICMD0x1B($033E, $00)                                     ;B498EC
    %AICMD0x13_Wait(60)                                        ;B498F0
    %AICMD0x1B($033D, $00)                                     ;B498F3
    %AICMD0x0D($00, $01, $30, $01)                             ;B498F7
    %AICMD0x0B_SetScriptFlag($02)                                            ;B498FC
pAIScripting0x1E_L018:
    %AICMD0x13_Wait(1)                                         ;B498FE
    %AICMD0x12_Jump(pAIScripting0x1E_L018)                                   ;B49901
    %AICMD0x1A($0178, $00D0, aAIScriptingData_L104, $00)                     ;B49904
    %AICMD0x0D($01, $FF, $40, $02)                             ;B4990C
    %AICMD0x0D($01, $00, $20, $02)                             ;B49911
    %AICMD0x0D($01, $01, $40, $02)                             ;B49916
    %AICMD0x37()                                               ;B4991B
    %AICMD0x10_End()                                           ;B4991C
pAIScripting0x1E_L019:
    %AICMD0x1A($0208, $00CC, aAIScriptingData_L090, $03)                     ;B4991D
    %AICMD0x0C_WaitForScriptFlag($02)                                            ;B49925
    %AICMD0x0D($FD, $00, $30, $03)                             ;B49927
    %AICMD0x0D($FD, $FF, $30, $03)                             ;B4992C
    %AICMD0x0D($FC, $FE, $30, $03)                             ;B49931
    %AICMD0x0D($FC, $FD, $18, $02)                             ;B49936
    %AICMD0x0D($FC, $FC, $18, $02)                             ;B4993B
    %AICMD0x0D($FC, $FB, $14, $02)                             ;B49940
    %AICMD0x0B_SetScriptFlag($03)                                            ;B49945
    %AICMD0x37()                                               ;B49947
    %AICMD0x10_End()                                           ;B49948
pAIScripting0x1E_L020:
    %AICMD0x1A($01F8, $0068, aAIScriptingData_L090, $03)                     ;B49949
    %AICMD0x0C_WaitForScriptFlag($02)                                            ;B49951
    %AICMD0x13_Wait(40)                                        ;B49953
    %AICMD0x0D($FD, $04, $3C, $03)                             ;B49956
    %AICMD0x0D($FD, $03, $30, $02)                             ;B4995B
    %AICMD0x0D($FD, $02, $40, $02)                             ;B49960
    %AICMD0x0D($FD, $01, $40, $02)                             ;B49965
    %AICMD0x0D($FD, $00, $30, $02)                             ;B4996A
    %AICMD0x0B_SetScriptFlag($03)                                            ;B4996F
    %AICMD0x37()                                               ;B49971
    %AICMD0x10_End()                                           ;B49972
pAIScripting0x1E_L021:
    %AICMD0x1A($0100, $00C8, aAIScriptingData_L090, $02)                     ;B49973
    %AICMD0x0C_WaitForScriptFlag($02)                                            ;B4997B
    %AICMD0x0D($03, $FF, $30, $02)                             ;B4997D
    %AICMD0x0D($03, $FE, $20, $03)                             ;B49982
    %AICMD0x0D($01, $FF, $40, $01)                             ;B49987
    %AICMD0x0B_SetScriptFlag($03)                                            ;B4998C
    %AICMD0x37()                                               ;B4998E
    %AICMD0x10_End()                                           ;B4998F
pAIScripting0x1E_L022:
    %AICMD0x1A($0196, $0048, aAIScriptingData_L090, $00)                     ;B49990
    %AICMD0x0C_WaitForScriptFlag($02)                                            ;B49998
    %AICMD0x0D($00, $02, $20, $02)                             ;B4999A
    %AICMD0x0D($FE, $03, $40, $03)                             ;B4999F
    %AICMD0x0D($FE, $03, $90, $02)                             ;B499A4
    %AICMD0x0B_SetScriptFlag($03)                                            ;B499A9
    %AICMD0x37()                                               ;B499AB
    %AICMD0x10_End()                                           ;B499AC
pAIScripting0x1E_L023:
    %AICMD0x1A($00E8, $0028, aAIScriptingData_L090, $00)                     ;B499AD
    %AICMD0x0C_WaitForScriptFlag($02)                                            ;B499B5
    %AICMD0x0D($00, $02, $40, $02)                             ;B499B7
    %AICMD0x0D($01, $03, $40, $03)                             ;B499BC
    %AICMD0x0D($02, $03, $40, $03)                             ;B499C1
    %AICMD0x0D($03, $03, $58, $03)                             ;B499C6
    %AICMD0x0B_SetScriptFlag($03)                                            ;B499CB
    %AICMD0x37()                                               ;B499CD
    %AICMD0x10_End()                                           ;B499CE
pAIScripting0x1E_L024:
    %AICMD0x1A($0140, $0098, aAIScriptingData_L052, $02)                     ;B499CF
pAIScripting0x1E_L025:
    %AICMD0x13_Wait(1)                                         ;B499D7
    %AICMD0x12_Jump(pAIScripting0x1E_L025)                                   ;B499DA
pAIScripting0x1E_L026:
    %AICMD0x1A($0198, $0098, aAIScriptingData_L045, $03)                     ;B499DD
pAIScripting0x1E_L027:
    %AICMD0x13_Wait(1)                                         ;B499E5
    %AICMD0x12_Jump(pAIScripting0x1E_L027)                                   ;B499E8
pAIScripting0x1E_L028:
    %AICMD0x1A($0148, $00C8, aAIScriptingData_L065, $02)                     ;B499EB
pAIScripting0x1E_L029:
    %AICMD0x13_Wait(1)                                         ;B499F3
    %AICMD0x12_Jump(pAIScripting0x1E_L029)                                   ;B499F6
pAIScripting0x1E_L030:
    %AICMD0x1A($0138, $00D8, aAIScriptingData_L047, $02)                     ;B499F9
pAIScripting0x1E_L031:
    %AICMD0x13_Wait(1)                                         ;B49A01
    %AICMD0x12_Jump(pAIScripting0x1E_L031)                                   ;B49A04
pAIScripting0x1E_L032:
    %AICMD0x1A($0190, $00C8, aAIScriptingData_L054, $03)                     ;B49A07
pAIScripting0x1E_L033:
    %AICMD0x13_Wait(1)                                         ;B49A0F
    %AICMD0x12_Jump(pAIScripting0x1E_L033)                                   ;B49A12
pAIScripting0x1E_L034:
    %AICMD0x1A($01A8, $00B0, aAIScriptingData_L049, $03)                     ;B49A15
pAIScripting0x1E_L035:
    %AICMD0x13_Wait(1)                                         ;B49A1D
    %AICMD0x12_Jump(pAIScripting0x1E_L035)                                   ;B49A20
pAIScripting0x1E_L036:
    %AICMD0x1A($0148, $00F8, aAIScriptingData_L202, $00)                     ;B49A23
pAIScripting0x1E_L037:
    %AICMD0x13_Wait(180)                                       ;B49A2B
    %AICMD0x12_Jump(pAIScripting0x1E_L037)                                   ;B49A2E
pAIScripting0x1E_L038:
    %AICMD0x1A($0198, $00F8, aAIScriptingData_L203, $00)                     ;B49A31
pAIScripting0x1E_L039:
    %AICMD0x13_Wait(180)                                       ;B49A39
    %AICMD0x12_Jump(pAIScripting0x1E_L039)                                   ;B49A3C
