

pAIScripting0x1C:
    dw DATA8_B492F2                                            ;B492D2|        |B492F2;
    dw DATA8_B4931D                                            ;B492D4|        |B4931D;
    dw DATA8_B49401                                            ;B492D6|        |B49401;
    dw pAIScripting0x1D                                        ;B492D8|        |B4943C;
    dw pAIScripting0x1D                                        ;B492DA|        |B4943C;
    dw pAIScripting0x1D                                        ;B492DC|        |B4943C;
    dw pAIScripting0x1D                                        ;B492DE|        |B4943C;
    dw pAIScripting0x1D                                        ;B492E0|        |B4943C;
    dw pAIScripting0x1D                                        ;B492E2|        |B4943C;
    dw pAIScripting0x1D                                        ;B492E4|        |B4943C;
    dw pAIScripting0x1D                                        ;B492E6|        |B4943C;
    dw pAIScripting0x1D                                        ;B492E8|        |B4943C;
    dw pAIScripting0x1D                                        ;B492EA|        |B4943C;
    dw pAIScripting0x1D                                        ;B492EC|        |B4943C;
    dw pAIScripting0x1D                                        ;B492EE|        |B4943C;
    dw pAIScripting0x1D                                        ;B492F0|        |B4943C;
 
DATA8_B492F2:
 
    %AICMD0x50()                                               ;B492F2
    %AICMD0x08_EnableAIControl()                               ;B492F3
    %AICMD0x09_StartScript($01, pAIScripting0x1C_L001)                                   ;B492F4
    %AICMD0x38_WaitForFadeIn()                                               ;B492F8
    %AICMD0x0B_SetScriptFlag($00)                                            ;B492F9
    %AICMD0x10_End()                                           ;B492FB
pAIScripting0x1C_L001:
    %AICMD0x1A($0088, $01B8, aAIScriptingData_L022, $01)                     ;B492FC
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B49304
    %AICMD0x0D($00, $FF, $50, $01)                             ;B49306
    %AICMD0x1C_ShowDialog($01EB, $00)                          ;B4930B
    %AICMD0x1B($023D, $00)                                     ;B4930F
    %AICMD0x0D($00, $01, $60, $01)                             ;B49313
    %AICMD0x0B_SetScriptFlag($01)                                            ;B49318
    %AICMD0x37()                                               ;B4931A
    %AICMD0x11_EnableUserControl()                             ;B4931B
    %AICMD0x10_End()                                           ;B4931C


DATA8_B4931D:
 
    %AICMD0x00_SetMusic($0E, $B4)                              ;B4931D
    %AICMD0x09_StartScript($0A, pAIScripting0x1C_L002)                                   ;B49320
    %AICMD0x38_WaitForFadeIn()                                               ;B49324
    %AICMD0x10_End()                                           ;B49325
pAIScripting0x1C_L002:
    %AICMD0x1A($029C, $018E, aAIScriptingData_L091, $03)                     ;B49326
pAIScripting0x1C_L003:
    %AICMD0x1F(pAIScripting0x1C_L004)                                        ;B4932E
    %AICMD0x12_Jump(pAIScripting0x1C_L003)                                   ;B49331
pAIScripting0x1C_L004:
    %AICMD0x08_EnableAIControl()                               ;B49334
    %AICMD0x1B($0320, $01)                                     ;B49335
    %AICMD0x0D($01, $FF, $18, $02)                             ;B49339
    %AICMD0x0D($01, $00, $10, $04)                             ;B4933E
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily3, $03)       ;B49343
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 0, pAIScripting0x1C_L005)     ;B49348
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 1, pAIScripting0x1C_L006)     ;B4934F
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 2, pAIScripting0x1C_L007)     ;B49356
    %AICMD0x15_JumpIfEquals8(nCurrentSeasonID, 3, pAIScripting0x1C_L008)     ;B4935D
pAIScripting0x1C_L005:
    %AICMD0x3D_TeleportToArea(!AREA_WOODSSPRING)               ;B49364
    %AICMD0x12_Jump(pAIScripting0x1C_L009)                                   ;B49366
pAIScripting0x1C_L006:
    %AICMD0x3D_TeleportToArea(!AREA_WOODSSUMMER)               ;B49369
    %AICMD0x12_Jump(pAIScripting0x1C_L009)                                   ;B4936B
pAIScripting0x1C_L007:
    %AICMD0x3D_TeleportToArea(!AREA_WOODSFALL)                 ;B4936E
    %AICMD0x12_Jump(pAIScripting0x1C_L009)                                   ;B49370
pAIScripting0x1C_L008:
    %AICMD0x3D_TeleportToArea(!AREA_WOODSWINTER)               ;B49373
    %AICMD0x12_Jump(pAIScripting0x1C_L009)                                   ;B49375
pAIScripting0x1C_L009:
    %AICMD0x10_End()                                           ;B49378
pAIScripting0x1C_L010:
    %AICMD0x1A($0288, $01F5, aAIScriptingData_L091, $03)                     ;B49379
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B49381
    %AICMD0x1B($0320, $01)                                     ;B49383
    %AICMD0x0D($02, $FF, $20, $02)                             ;B49387
    %AICMD0x0D($01, $FF, $20, $02)                             ;B4938C
    %AICMD0x0D($01, $FF, $50, $01)                             ;B49391
    %AICMD0x0B_SetScriptFlag($02)                                            ;B49396
    %AICMD0x37()                                               ;B49398
    %AICMD0x10_End()                                           ;B49399
pAIScripting0x1C_L011:
    %AICMD0x1A($0208, $0208, aAIScriptingData_L022, $02)                     ;B4939A
    %AICMD0x0D($01, $00, $60, $01)                             ;B493A2
    %AICMD0x1B($0240, $01)                                     ;B493A7
    %AICMD0x13_Wait(90)                                        ;B493AB
    %AICMD0x1C_ShowDialog($01F1, $00)                          ;B493AE
    %AICMD0x0B_SetScriptFlag($01)                                            ;B493B2
    %AICMD0x1B($0242, $00)                                     ;B493B4
    %AICMD0x13_Wait(90)                                        ;B493B8
    %AICMD0x0C_WaitForScriptFlag($02)                                            ;B493BB
    %AICMD0x1B($0240, $01)                                     ;B493BD
    %AICMD0x1C_ShowDialog($01F2, $00)                          ;B493C1
    %AICMD0x1B($0241, $01)                                     ;B493C5
    %AICMD0x0D($01, $00, $14, $01)                             ;B493C9
    %AICMD0x1B($0243, $01)                                     ;B493CE
    %AICMD0x13_Wait(90)                                        ;B493D2
    %AICMD0x41_AddValue16(nLove_Ellen, 50)                     ;B493D5
    %AICMD0x1B($0240, $01)                                     ;B493DB
    %AICMD0x13_Wait(40)                                        ;B493DF
    %AICMD0x1B($0241, $00)                                     ;B493E2
    %AICMD0x0D($FF, $00, $44, $01)                             ;B493E6
    %AICMD0x1B($023D, $00)                                     ;B493EB
    %AICMD0x0D($00, $01, $50, $01)                             ;B493EF
    %AICMD0x1B($0241, $00)                                     ;B493F4
    %AICMD0x0D($FF, $00, $70, $01)                             ;B493F8
    %AICMD0x0B_SetScriptFlag($03)                                            ;B493FD
    %AICMD0x37()                                               ;B493FF
    %AICMD0x10_End()                                           ;B49400


DATA8_B49401:
    %AICMD0x50()                                               ;B49401
    %AICMD0x02_FreezeTime()                                    ;B49402
    %AICMD0x08_EnableAIControl()                               ;B49403
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B49404
    %AICMD0x05_SetTransferPosition(648, 520)                   ;B49406
    %AICMD0x09_StartScript($0A, pAIScripting0x1C_L011)                                   ;B4940B
    %AICMD0x09_StartScript($0B, pAIScripting0x1C_L010)                                   ;B4940F
    %AICMD0x38_WaitForFadeIn()                                               ;B49413
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B49414
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B49416
    %AICMD0x13_Wait(60)                                        ;B49418
    %AICMD0x07_SetPlayerDirection(!PDIR_LEFT)                  ;B4941B
    %AICMD0x13_Wait(80)                                        ;B4941D
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B49420
    %AICMD0x13_Wait(120)                                       ;B49422
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B49425
    %AICMD0x13_Wait(220)                                       ;B49427
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 48)                  ;B4942A
    %AICMD0x0C_WaitForScriptFlag($03)                                            ;B4942E
    %AICMD0x23_OrWithIndexedValue(strcFlags.event5, $03)       ;B49430
    %AICMD0x28_ClearBit(strcFlags.event5, $02)                          ;B49435
    %AICMD0x3C()                                               ;B4943A
    %AICMD0x10_End()                                           ;B4943B
