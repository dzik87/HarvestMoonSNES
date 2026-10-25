

pAIScripting0x12:
    dw pAIScripting0x12_Data01                                            ;B488A0|        |B488C0;
    dw pAIScripting0x13                                        ;B488A2|        |B4892A;
    dw pAIScripting0x13                                        ;B488A4|        |B4892A;
    dw pAIScripting0x13                                        ;B488A6|        |B4892A;
    dw pAIScripting0x13                                        ;B488A8|        |B4892A;
    dw pAIScripting0x13                                        ;B488AA|        |B4892A;
    dw pAIScripting0x13                                        ;B488AC|        |B4892A;
    dw pAIScripting0x13                                        ;B488AE|        |B4892A;
    dw pAIScripting0x13                                        ;B488B0|        |B4892A;
    dw pAIScripting0x13                                        ;B488B2|        |B4892A;
    dw pAIScripting0x13                                        ;B488B4|        |B4892A;
    dw pAIScripting0x13                                        ;B488B6|        |B4892A;
    dw pAIScripting0x13                                        ;B488B8|        |B4892A;
    dw pAIScripting0x13                                        ;B488BA|        |B4892A;
    dw pAIScripting0x13                                        ;B488BC|        |B4892A;
    dw pAIScripting0x13                                        ;B488BE|        |B4892A;
 
pAIScripting0x12_Data01:
    %AICMD0x50()                                               ;B488C0
    %AICMD0x00_SetMusic($0A, $B4)                              ;B488C1
    %AICMD0x08_EnableAIControl()                               ;B488C4
    %AICMD0x2A($0041)                                          ;B488C5
    %AICMD0x13_Wait(180)                                       ;B488C8
    %AICMD0x09_StartScript($01, pAIScripting0x12_L001)                                   ;B488CB
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B488CF
    %AICMD0x09_StartScript($10, pAIScripting0x12_L002)                                   ;B488D1
    %AICMD0x10_End()                                           ;B488D5
pAIScripting0x12_L001:
    %AICMD0x1A($0088, $00F8, aAIScriptingData_L087, $00)                     ;B488D6
    %AICMD0x13_Wait(180)                                       ;B488DE
    %AICMD0x0D($00, $FF, $10, $01)                             ;B488E1
    %AICMD0x0D($01, $01, $10, $01)                             ;B488E6
    %AICMD0x0D($00, $01, $10, $01)                             ;B488EB
    %AICMD0x0D($FF, $00, $10, $01)                             ;B488F0
    %AICMD0x1C_ShowDialog($0339, $01)                          ;B488F5
    %AICMD0x0B_SetScriptFlag($00)                                            ;B488F9
    %AICMD0x13_Wait(120)                                       ;B488FB
    %AICMD0x1C_ShowDialog($033A, $01)                          ;B488FE
    %AICMD0x13_Wait(30)                                        ;B48902
    %AICMD0x0D($00, $FF, $10, $02)                             ;B48905
    %AICMD0x0D($00, $FF, $18, $03)                             ;B4890A
    %AICMD0x1B($0318, $00)                                     ;B4890F
    %AICMD0x13_Wait(180)                                       ;B48913
    %AICMD0x37()                                               ;B48916
    %AICMD0x11_EnableUserControl()                             ;B48917
    %AICMD0x10_End()                                           ;B48918
pAIScripting0x12_L002:
    %AICMD0x1A($0088, $0120, aAIScriptingData_L123, $00)                     ;B48919
    %AICMD0x0D($00, $01, $50, $02)                             ;B48921
pAIScripting0x12_L003:
    %AICMD0x4A()                                               ;B48926
    %AICMD0x12_Jump(pAIScripting0x12_L003)                                   ;B48927
