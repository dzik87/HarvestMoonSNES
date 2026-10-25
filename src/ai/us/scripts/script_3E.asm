

pAIScripting0x3E:
    dw pAIScripting0x3E_Data01                                            ;B4E200|        |B4E220;
    dw pAIScripting0x3F                                        ;B4E202|        |B4E3FF;
    dw pAIScripting0x3F                                        ;B4E204|        |B4E3FF;
    dw pAIScripting0x3F                                        ;B4E206|        |B4E3FF;
    dw pAIScripting0x3F                                        ;B4E208|        |B4E3FF;
    dw pAIScripting0x3F                                        ;B4E20A|        |B4E3FF;
    dw pAIScripting0x3F                                        ;B4E20C|        |B4E3FF;
    dw pAIScripting0x3F                                        ;B4E20E|        |B4E3FF;
    dw pAIScripting0x3F                                        ;B4E210|        |B4E3FF;
    dw pAIScripting0x3F                                        ;B4E212|        |B4E3FF;
    dw pAIScripting0x3F                                        ;B4E214|        |B4E3FF;
    dw pAIScripting0x3F                                        ;B4E216|        |B4E3FF;
    dw pAIScripting0x3F                                        ;B4E218|        |B4E3FF;
    dw pAIScripting0x3F                                        ;B4E21A|        |B4E3FF;
    dw pAIScripting0x3F                                        ;B4E21C|        |B4E3FF;
    dw pAIScripting0x3F                                        ;B4E21E|        |B4E3FF;
 
pAIScripting0x3E_Data01:
    %AICMD0x00_SetMusic($10, $B4)                              ;B4E220
    %AICMD0x02_FreezeTime()                                    ;B4E223
    %AICMD0x03_SetHour($07)                                    ;B4E224
    %AICMD0x05_SetTransferPosition(584, 432)                   ;B4E226
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4E22B
    %AICMD0x08_EnableAIControl()                               ;B4E22D
    %AICMD0x09_StartScript($01, pAIScripting0x3E_L005)                                   ;B4E22E
    %AICMD0x09_StartScript($02, pAIScripting0x3E_L003)                                   ;B4E232
    %AICMD0x09_StartScript($03, pAIScripting0x3E_L001)                                   ;B4E236
    %AICMD0x09_StartScript($04, pAIScripting0x3E_L009)                                   ;B4E23A
    %AICMD0x09_StartScript($05, pAIScripting0x3E_L011)                                   ;B4E23E
    %AICMD0x09_StartScript($06, pAIScripting0x3E_L013)                                   ;B4E242
    %AICMD0x09_StartScript($07, pAIScripting0x3E_L007)                                   ;B4E246
    %AICMD0x06_SetDestinationArea(!AREA_WOODSSUMMER)           ;B4E24A
    %AICMD0x38_WaitForFadeIn()                                               ;B4E24C
    %AICMD0x13_Wait(30)                                        ;B4E24D
    %AICMD0x19($005F, $00)                                     ;B4E250
    %AICMD0x13_Wait(80)                                        ;B4E254
    %AICMD0x19($0003, $00)                                     ;B4E257
    %AICMD0x13_Wait(1)                                         ;B4E25B
    %AICMD0x19($005F, $00)                                     ;B4E25E
    %AICMD0x13_Wait(80)                                        ;B4E262
    %AICMD0x19($0003, $00)                                     ;B4E265
    %AICMD0x13_Wait(1)                                         ;B4E269
    %AICMD0x19($005F, $00)                                     ;B4E26C
    %AICMD0x13_Wait(80)                                        ;B4E270
    %AICMD0x19($0003, $00)                                     ;B4E273
    %AICMD0x13_Wait(1)                                         ;B4E277
    %AICMD0x19($005F, $00)                                     ;B4E27A
    %AICMD0x13_Wait(80)                                        ;B4E27E
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4E281
    %AICMD0x13_Wait(30)                                        ;B4E283
    %AICMD0x19($004A, $00)                                     ;B4E286
    %AICMD0x13_Wait(180)                                       ;B4E28A
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 32)                  ;B4E28D
    %AICMD0x0B_SetScriptFlag($00)                                            ;B4E291
    %AICMD0x13_Wait(120)                                       ;B4E293
    %AICMD0x19($0043, $00)                                     ;B4E296
    %AICMD0x13_Wait(120)                                       ;B4E29A
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 16)                  ;B4E29D
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 16)                  ;B4E2A1
    %AICMD0x0C_WaitForScriptFlag($03)                                            ;B4E2A5
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4E2A7
    %AICMD0x13_Wait(30)                                        ;B4E2A9
    %AICMD0x0C_WaitForScriptFlag($04)                                            ;B4E2AC
    %AICMD0x13_Wait(90)                                        ;B4E2AE
    %AICMD0x3D_TeleportToArea(!AREA_ENDING00)                  ;B4E2B1
    %AICMD0x10_End()                                           ;B4E2B3
pAIScripting0x3E_L001:
    %AICMD0x1A($0208, $01D8, aAIScriptingData_L073, $00)                     ;B4E2B4
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B4E2BC
    %AICMD0x13_Wait(30)                                        ;B4E2BE
    %AICMD0x1B($02E7, $01)                                     ;B4E2C1
    %AICMD0x0D($01, $00, $30, $01)                             ;B4E2C5
    %AICMD0x13_Wait(80)                                        ;B4E2CA
    %AICMD0x1B($02E3, $00)                                     ;B4E2CD
    %AICMD0x0D($00, $01, $60, $01)                             ;B4E2D1
    %AICMD0x13_Wait(60)                                        ;B4E2D6
    %AICMD0x1B($02E5, $00)                                     ;B4E2D9
    %AICMD0x0D($00, $FF, $28, $01)                             ;B4E2DD
    %AICMD0x13_Wait(10)                                        ;B4E2E2
    %AICMD0x1B($02E8, $00)                                     ;B4E2E5
    %AICMD0x13_Wait(120)                                       ;B4E2E9
    %AICMD0x1B($02E5, $00)                                     ;B4E2EC
    %AICMD0x0D($00, $FF, $20, $01)                             ;B4E2F0
    %AICMD0x0B_SetScriptFlag($01)                                            ;B4E2F5
    %AICMD0x13_Wait(60)                                        ;B4E2F7
    %AICMD0x1B($02E3, $00)                                     ;B4E2FA
    %AICMD0x0D($00, $01, $08, $01)                             ;B4E2FE
    %AICMD0x13_Wait(60)                                        ;B4E303
    %AICMD0x1B($02E7, $01)                                     ;B4E306
    %AICMD0x13_Wait(120)                                       ;B4E30A
    %AICMD0x1B($02E3, $00)                                     ;B4E30D
    %AICMD0x13_Wait(120)                                       ;B4E311
    %AICMD0x1B($02E7, $01)                                     ;B4E314
    %AICMD0x13_Wait(120)                                       ;B4E318
pAIScripting0x3E_L002:
    %AICMD0x13_Wait(1)                                         ;B4E31B
    %AICMD0x12_Jump(pAIScripting0x3E_L002)                                   ;B4E31E
pAIScripting0x3E_L003:
    %AICMD0x1A($0238, $0268, aAIScriptingData_L040, $01)                     ;B4E321
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B4E329
    %AICMD0x13_Wait(20)                                        ;B4E32B
    %AICMD0x0D($00, $FF, $60, $01)                             ;B4E32E
    %AICMD0x13_Wait(20)                                        ;B4E333
    %AICMD0x1B($0281, $01)                                     ;B4E336
    %AICMD0x0D($01, $00, $10, $01)                             ;B4E33A
    %AICMD0x1B($0281, $01)                                     ;B4E33F
    %AICMD0x13_Wait(120)                                       ;B4E343
    %AICMD0x0B_SetScriptFlag($02)                                            ;B4E346
    %AICMD0x1B($027F, $00)                                     ;B4E348
    %AICMD0x13_Wait(180)                                       ;B4E34C
    %AICMD0x1B($0281, $01)                                     ;B4E34F
    %AICMD0x13_Wait(180)                                       ;B4E353
pAIScripting0x3E_L004:
    %AICMD0x13_Wait(1)                                         ;B4E356
    %AICMD0x12_Jump(pAIScripting0x3E_L004)                                   ;B4E359
pAIScripting0x3E_L005:
    %AICMD0x1A($0278, $0208, aAIScriptingData_L004, $03)                     ;B4E35C
    %AICMD0x0C_WaitForScriptFlag($02)                                            ;B4E364
    %AICMD0x1B($01EC, $00)                                     ;B4E366
    %AICMD0x0D($FF, $00, $20, $01)                             ;B4E36A
    %AICMD0x13_Wait(60)                                        ;B4E36F
    %AICMD0x1B($01EB, $00)                                     ;B4E372
    %AICMD0x13_Wait(180)                                       ;B4E376
    %AICMD0x1B($01EF, $00)                                     ;B4E379
    %AICMD0x13_Wait(60)                                        ;B4E37D
    %AICMD0x0B_SetScriptFlag($03)                                            ;B4E380
    %AICMD0x1B($01F0, $00)                                     ;B4E382
    %AICMD0x13_Wait(120)                                       ;B4E386
    %AICMD0x1B($01E3, $00)                                     ;B4E389
pAIScripting0x3E_L006:
    %AICMD0x13_Wait(1)                                         ;B4E38D
    %AICMD0x12_Jump(pAIScripting0x3E_L006)                                   ;B4E390
pAIScripting0x3E_L007:
    %AICMD0x1A($0270, $0230, aAIScriptingData_L027, $01)                     ;B4E393
    %AICMD0x0C_WaitForScriptFlag($03)                                            ;B4E39B
    %AICMD0x1B($025D, $00)                                     ;B4E39D
    %AICMD0x0D($00, $FF, $40, $01)                             ;B4E3A1
    %AICMD0x1B($025F, $00)                                     ;B4E3A6
    %AICMD0x13_Wait(60)                                        ;B4E3AA
    %AICMD0x1B($025D, $00)                                     ;B4E3AD
    %AICMD0x13_Wait(30)                                        ;B4E3B1
    %AICMD0x09_StartScript($08, pAIScripting0x3E_L015)                                   ;B4E3B4
    %AICMD0x1B($025F, $00)                                     ;B4E3B8
    %AICMD0x13_Wait(60)                                        ;B4E3BC
    %AICMD0x0B_SetScriptFlag($04)                                            ;B4E3BF
pAIScripting0x3E_L008:
    %AICMD0x13_Wait(1)                                         ;B4E3C1
    %AICMD0x12_Jump(pAIScripting0x3E_L008)                                   ;B4E3C4
pAIScripting0x3E_L009:
    %AICMD0x1A($0254, $01E2, aAIScriptingData_L186, $00)                     ;B4E3C7
pAIScripting0x3E_L010:
    %AICMD0x13_Wait(1)                                         ;B4E3CF
    %AICMD0x12_Jump(pAIScripting0x3E_L010)                                   ;B4E3D2
pAIScripting0x3E_L011:
    %AICMD0x1A($024A, $01E8, aAIScriptingData_L010, $00)                     ;B4E3D5
pAIScripting0x3E_L012:
    %AICMD0x13_Wait(1)                                         ;B4E3DD
    %AICMD0x12_Jump(pAIScripting0x3E_L012)                                   ;B4E3E0
pAIScripting0x3E_L013:
    %AICMD0x1A($0254, $01EE, aAIScriptingData_L184, $00)                     ;B4E3E3
pAIScripting0x3E_L014:
    %AICMD0x13_Wait(1)                                         ;B4E3EB
    %AICMD0x12_Jump(pAIScripting0x3E_L014)                                   ;B4E3EE
pAIScripting0x3E_L015:
    %AICMD0x1A($0270, $01D6, aAIScriptingData_L127, $00)                     ;B4E3F1
pAIScripting0x3E_L016:
    %AICMD0x13_Wait(1)                                         ;B4E3F9
    %AICMD0x12_Jump(pAIScripting0x3E_L016)                                   ;B4E3FC
