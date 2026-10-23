

pAIScripting0x23:
    dw DATA8_B4A39F                                            ;B4A37F|        |B4A39F;
    dw pAIScripting0x24                                        ;B4A381|        |B4A455;
    dw pAIScripting0x24                                        ;B4A383|        |B4A455;
    dw pAIScripting0x24                                        ;B4A385|        |B4A455;
    dw pAIScripting0x24                                        ;B4A387|        |B4A455;
    dw pAIScripting0x24                                        ;B4A389|        |B4A455;
    dw pAIScripting0x24                                        ;B4A38B|        |B4A455;
    dw pAIScripting0x24                                        ;B4A38D|        |B4A455;
    dw pAIScripting0x24                                        ;B4A38F|        |B4A455;
    dw pAIScripting0x24                                        ;B4A391|        |B4A455;
    dw pAIScripting0x24                                        ;B4A393|        |B4A455;
    dw pAIScripting0x24                                        ;B4A395|        |B4A455;
    dw pAIScripting0x24                                        ;B4A397|        |B4A455;
    dw pAIScripting0x24                                        ;B4A399|        |B4A455;
    dw pAIScripting0x24                                        ;B4A39B|        |B4A455;
    dw pAIScripting0x24                                        ;B4A39D|        |B4A455;
 
DATA8_B4A39F:
    %AICMD0x09_StartScript($0C, pAIScripting0x23_L001)                                   ;B4A39F
    %AICMD0x09_StartScript($0D, pAIScripting0x23_L002)                                   ;B4A3A3
    %AICMD0x09_StartScript($0E, pAIScripting0x23_L003)                                   ;B4A3A7
    %AICMD0x08_EnableAIControl()                               ;B4A3AB
    %AICMD0x38_WaitForFadeIn()                                               ;B4A3AC
    %AICMD0x2C($23, $0007, $003C)                              ;B4A3AD
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B4A3B3
    %AICMD0x11_EnableUserControl()                             ;B4A3B5
    %AICMD0x10_End()                                           ;B4A3B6
pAIScripting0x23_L001:
    %AICMD0x1A($0098, $0178, aAIScriptingData_L093, $03)                     ;B4A3B7
    %AICMD0x13_Wait(40)                                        ;B4A3BF
    %AICMD0x1B($0328, $01)                                     ;B4A3C2
    %AICMD0x0D($FF, $FF, $01, $01)                             ;B4A3C6
    %AICMD0x13_Wait(60)                                        ;B4A3CB
    %AICMD0x1B($0328, $01)                                     ;B4A3CE
    %AICMD0x0D($01, $00, $01, $01)                             ;B4A3D2
    %AICMD0x13_Wait(30)                                        ;B4A3D7
    %AICMD0x1B($0329, $01)                                     ;B4A3DA
    %AICMD0x0D($03, $FF, $40, $03)                             ;B4A3DE
    %AICMD0x0D($02, $FF, $40, $02)                             ;B4A3E3
    %AICMD0x0B_SetScriptFlag($00)                                            ;B4A3E8
    %AICMD0x0D($01, $FF, $20, $01)                             ;B4A3EA
    %AICMD0x37()                                               ;B4A3EF
    %AICMD0x10_End()                                           ;B4A3F0
pAIScripting0x23_L002:
    %AICMD0x1A($0068, $0178, aAIScriptingData_L093, $00)                     ;B4A3F1
    %AICMD0x13_Wait(48)                                        ;B4A3F9
    %AICMD0x1B($0328, $01)                                     ;B4A3FC
    %AICMD0x0D($FF, $FF, $01, $01)                             ;B4A400
    %AICMD0x0D($FF, $01, $01, $01)                             ;B4A405
    %AICMD0x13_Wait(60)                                        ;B4A40A
    %AICMD0x1B($0329, $00)                                     ;B4A40D
    %AICMD0x0D($FF, $00, $10, $01)                             ;B4A411
    %AICMD0x0D($FF, $FF, $20, $01)                             ;B4A416
    %AICMD0x0B_SetScriptFlag($00)                                            ;B4A41B
    %AICMD0x0D($00, $00, $04, $01)                             ;B4A41D
    %AICMD0x0D($FE, $FF, $40, $01)                             ;B4A422
    %AICMD0x37()                                               ;B4A427
    %AICMD0x10_End()                                           ;B4A428
pAIScripting0x23_L003:
    %AICMD0x1A($0078, $0180, aAIScriptingData_L093, $02)                     ;B4A429
    %AICMD0x13_Wait(70)                                        ;B4A431
    %AICMD0x1B($0327, $00)                                     ;B4A434
    %AICMD0x13_Wait(38)                                        ;B4A438
    %AICMD0x1B($032A, $00)                                     ;B4A43B
    %AICMD0x0D($00, $01, $10, $01)                             ;B4A43F
    %AICMD0x0D($FF, $03, $40, $03)                             ;B4A444
    %AICMD0x0D($FF, $02, $40, $02)                             ;B4A449
    %AICMD0x0D($FF, $01, $58, $01)                             ;B4A44E
    %AICMD0x37()                                               ;B4A453
    %AICMD0x10_End()                                           ;B4A454
