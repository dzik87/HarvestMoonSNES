

pAIScripting0x39:
    dw pAIScripting0x39_Data01                                            ;B4D531|        |B4D551;
    dw pAIScripting0x3A                                        ;B4D533|        |B4D772;
    dw pAIScripting0x3A                                        ;B4D535|        |B4D772;
    dw pAIScripting0x3A                                        ;B4D537|        |B4D772;
    dw pAIScripting0x3A                                        ;B4D539|        |B4D772;
    dw pAIScripting0x3A                                        ;B4D53B|        |B4D772;
    dw pAIScripting0x3A                                        ;B4D53D|        |B4D772;
    dw pAIScripting0x3A                                        ;B4D53F|        |B4D772;
    dw pAIScripting0x3A                                        ;B4D541|        |B4D772;
    dw pAIScripting0x3A                                        ;B4D543|        |B4D772;
    dw pAIScripting0x3A                                        ;B4D545|        |B4D772;
    dw pAIScripting0x3A                                        ;B4D547|        |B4D772;
    dw pAIScripting0x3A                                        ;B4D549|        |B4D772;
    dw pAIScripting0x3A                                        ;B4D54B|        |B4D772;
    dw pAIScripting0x3A                                        ;B4D54D|        |B4D772;
    dw pAIScripting0x3A                                        ;B4D54F|        |B4D772;
 
pAIScripting0x39_Data01:
    %AICMD0x00_SetMusic($10, $B4)                              ;B4D551
    %AICMD0x02_FreezeTime()                                    ;B4D554
    %AICMD0x03_SetHour($07)                                    ;B4D555
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4D557
    %AICMD0x05_SetTransferPosition(664, 112)                   ;B4D559
    %AICMD0x08_EnableAIControl()                               ;B4D55E
    %AICMD0x09_StartScript($01, pAIScripting0x39_L001)                                   ;B4D55F
    %AICMD0x09_StartScript($02, pAIScripting0x39_L003)                                   ;B4D563
    %AICMD0x09_StartScript($03, pAIScripting0x39_L005)                                   ;B4D567
    %AICMD0x09_StartScript($04, pAIScripting0x39_L007)                                   ;B4D56B
    %AICMD0x06_SetDestinationArea(!AREA_WOODSSUMMER)           ;B4D56F
    %AICMD0x38_WaitForFadeIn()                                               ;B4D571
    %AICMD0x13_Wait(60)                                        ;B4D572
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 80)                  ;B4D575
    %AICMD0x13_Wait(20)                                        ;B4D579
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 16)                    ;B4D57C
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4D580
    %AICMD0x13_Wait(30)                                        ;B4D582
    %AICMD0x19($005F, $00)                                     ;B4D585
    %AICMD0x13_Wait(60)                                        ;B4D589
    %AICMD0x19($0003, $00)                                     ;B4D58C
    %AICMD0x13_Wait(1)                                         ;B4D590
    %AICMD0x19($005F, $00)                                     ;B4D593
    %AICMD0x13_Wait(60)                                        ;B4D597
    %AICMD0x19($0003, $00)                                     ;B4D59A
    %AICMD0x13_Wait(1)                                         ;B4D59E
    %AICMD0x19($005F, $00)                                     ;B4D5A1
    %AICMD0x13_Wait(60)                                        ;B4D5A5
    %AICMD0x19($0003, $00)                                     ;B4D5A8
    %AICMD0x13_Wait(1)                                         ;B4D5AC
    %AICMD0x19($005F, $00)                                     ;B4D5AF
    %AICMD0x13_Wait(60)                                        ;B4D5B3
    %AICMD0x19($004A, $00)                                     ;B4D5B6
    %AICMD0x13_Wait(120)                                       ;B4D5BA
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4D5BD
    %AICMD0x0B_SetScriptFlag($00)                                            ;B4D5BF
    %AICMD0x13_Wait(60)                                        ;B4D5C1
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4D5C4
    %AICMD0x13_Wait(120)                                       ;B4D5C6
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 12)                  ;B4D5C9
    %AICMD0x0B_SetScriptFlag($03)                                            ;B4D5CD
    %AICMD0x19($0010, $00)                                     ;B4D5CF
    %AICMD0x13_Wait(14)                                        ;B4D5D3
    %AICMD0x19($0014, $00)                                     ;B4D5D6
    %AICMD0x13_Wait(60)                                        ;B4D5DA
    %AICMD0x19($003B, $00)                                     ;B4D5DD
    %AICMD0x13_Wait(60)                                        ;B4D5E1
    %AICMD0x0B_SetScriptFlag($01)                                            ;B4D5E4
    %AICMD0x13_Wait(120)                                       ;B4D5E6
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B4D5E9
    %AICMD0x13_Wait(300)                                       ;B4D5EB
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4D5EE
    %AICMD0x13_Wait(120)                                       ;B4D5F0
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4D5F3
    %AICMD0x13_Wait(90)                                        ;B4D5F5
    %AICMD0x19($003C, $00)                                     ;B4D5F8
    %AICMD0x13_Wait(120)                                       ;B4D5FC
    %AICMD0x19($0000, $00)                                     ;B4D5FF
    %AICMD0x13_Wait(1)                                         ;B4D603
    %AICMD0x19($003C, $00)                                     ;B4D606
    %AICMD0x13_Wait(120)                                       ;B4D60A
    %AICMD0x3D_TeleportToArea(!AREA_ENDING00)                  ;B4D60D
    %AICMD0x10_End()                                           ;B4D60F
pAIScripting0x39_L001:
    %AICMD0x1A($02B8, $00CB, aAIScriptingData_L089, $00)                     ;B4D610
pAIScripting0x39_L002:
    %AICMD0x13_Wait(1)                                         ;B4D618
    %AICMD0x12_Jump(pAIScripting0x39_L002)                                   ;B4D61B
pAIScripting0x39_L003:
    %AICMD0x1A($0210, $0088, aAIScriptingData_L132, $00)                     ;B4D61E
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B4D626
    %AICMD0x1B($0303, $01)                                     ;B4D628
    %AICMD0x0D($01, $00, $38, $01)                             ;B4D62C
    %AICMD0x1B($0302, $01)                                     ;B4D631
    %AICMD0x13_Wait(60)                                        ;B4D635
    %AICMD0x09_StartScript($05, pAIScripting0x39_L004)                                   ;B4D638
    %AICMD0x1B($0303, $00)                                     ;B4D63C
    %AICMD0x0D($FF, $00, $10, $01)                             ;B4D640
    %AICMD0x1B($0302, $01)                                     ;B4D645
    %AICMD0x13_Wait(120)                                       ;B4D649
    %AICMD0x1B($0303, $00)                                     ;B4D64C
    %AICMD0x0D($FF, $00, $40, $01)                             ;B4D650
    %AICMD0x37()                                               ;B4D655
    %AICMD0x10_End()                                           ;B4D656
pAIScripting0x39_L004:
    %AICMD0x1A($0258, $0088, aAIScriptingData_L123, $00)                     ;B4D657
    %AICMD0x13_Wait(30)                                        ;B4D65F
    %AICMD0x0C_WaitForScriptFlag($03)                                            ;B4D662
    %AICMD0x13_Wait(10)                                        ;B4D664
    %AICMD0x0D($00, $F0, $02, $01)                             ;B4D667
    %AICMD0x13_Wait(60)                                        ;B4D66C
    %AICMD0x37()                                               ;B4D66F
    %AICMD0x10_End()                                           ;B4D670
pAIScripting0x39_L005:
    %AICMD0x1A($0208, $0054, aAIScriptingData_L134, $00)                     ;B4D671
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B4D679
    %AICMD0x13_Wait(90)                                        ;B4D67B
    %AICMD0x1B($0307, $01)                                     ;B4D67E
    %AICMD0x13_Wait(60)                                        ;B4D682
    %AICMD0x0D($01, $00, $40, $01)                             ;B4D685
    %AICMD0x1B($0306, $00)                                     ;B4D68A
    %AICMD0x13_Wait(60)                                        ;B4D68E
    %AICMD0x1B($0307, $01)                                     ;B4D691
    %AICMD0x0D($02, $00, $20, $03)                             ;B4D695
    %AICMD0x1B($0306, $00)                                     ;B4D69A
    %AICMD0x13_Wait(60)                                        ;B4D69E
    %AICMD0x1B($0307, $01)                                     ;B4D6A1
    %AICMD0x0D($02, $00, $28, $03)                             ;B4D6A5
    %AICMD0x1B($0306, $00)                                     ;B4D6AA
    %AICMD0x13_Wait(60)                                        ;B4D6AE
    %AICMD0x0B_SetScriptFlag($02)                                            ;B4D6B1
    %AICMD0x09_StartScript($06, pAIScripting0x39_L009)                                   ;B4D6B3
    %AICMD0x09_StartScript($07, pAIScripting0x39_L011)                                   ;B4D6B7
pAIScripting0x39_L006:
    %AICMD0x13_Wait(1)                                         ;B4D6BB
    %AICMD0x12_Jump(pAIScripting0x39_L006)                                   ;B4D6BE
pAIScripting0x39_L007:
    %AICMD0x1A($0320, $0078, aAIScriptingData_L133, $00)                     ;B4D6C1
    %AICMD0x0C_WaitForScriptFlag($02)                                            ;B4D6C9
    %AICMD0x1B($0305, $00)                                     ;B4D6CB
    %AICMD0x0D($FF, $00, $70, $01)                             ;B4D6CF
    %AICMD0x1B($0304, $00)                                     ;B4D6D4
    %AICMD0x09_StartScript($08, pAIScripting0x39_L013)                                   ;B4D6D8
    %AICMD0x1B($0305, $00)                                     ;B4D6DC
    %AICMD0x0D($FF, $00, $20, $01)                             ;B4D6E0
    %AICMD0x1B($0304, $00)                                     ;B4D6E5
pAIScripting0x39_L008:
    %AICMD0x13_Wait(1)                                         ;B4D6E9
    %AICMD0x12_Jump(pAIScripting0x39_L008)                                   ;B4D6EC
pAIScripting0x39_L009:
    %AICMD0x1A($01C8, $0024, aAIScriptingData_L093, $02)                     ;B4D6EF
    %AICMD0x1B($0329, $01)                                     ;B4D6F7
    %AICMD0x13_Wait(60)                                        ;B4D6FB
    %AICMD0x0D($01, $01, $28, $01)                             ;B4D6FE
    %AICMD0x13_Wait(10)                                        ;B4D703
    %AICMD0x0D($02, $01, $40, $02)                             ;B4D706
    %AICMD0x13_Wait(10)                                        ;B4D70B
    %AICMD0x0D($01, $00, $10, $01)                             ;B4D70E
    %AICMD0x1B($0328, $01)                                     ;B4D713
pAIScripting0x39_L010:
    %AICMD0x13_Wait(1)                                         ;B4D717
    %AICMD0x12_Jump(pAIScripting0x39_L010)                                   ;B4D71A
pAIScripting0x39_L011:
    %AICMD0x1A($02C8, $0058, aAIScriptingData_L093, $03)                     ;B4D71D
    %AICMD0x1B($0329, $00)                                     ;B4D725
    %AICMD0x0D($FF, $01, $20, $01)                             ;B4D729
    %AICMD0x13_Wait(30)                                        ;B4D72E
    %AICMD0x0D($FE, $01, $20, $01)                             ;B4D731
    %AICMD0x13_Wait(10)                                        ;B4D736
    %AICMD0x0D($FF, $00, $20, $01)                             ;B4D739
    %AICMD0x13_Wait(30)                                        ;B4D73E
    %AICMD0x1B($0329, $00)                                     ;B4D741
    %AICMD0x13_Wait(10)                                        ;B4D745
    %AICMD0x1B($0327, $00)                                     ;B4D748
pAIScripting0x39_L012:
    %AICMD0x13_Wait(1)                                         ;B4D74C
    %AICMD0x12_Jump(pAIScripting0x39_L012)                                   ;B4D74F
pAIScripting0x39_L013:
    %AICMD0x1A($0218, $00F8, aAIScriptingData_L093, $01)                     ;B4D752
    %AICMD0x1B($0329, $01)                                     ;B4D75A
    %AICMD0x0D($01, $FF, $40, $01)                             ;B4D75E
    %AICMD0x0D($00, $FF, $10, $01)                             ;B4D763
    %AICMD0x1B($0328, $01)                                     ;B4D768
pAIScripting0x39_L014:
    %AICMD0x13_Wait(1)                                         ;B4D76C
    %AICMD0x12_Jump(pAIScripting0x39_L014)                                   ;B4D76F
