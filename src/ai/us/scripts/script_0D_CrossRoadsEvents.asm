

pAIScripting0x0D_CrossRoadsEvents:
    dw AI_ObtainHorse                                          ;B3F068|        |B3F088;
    dw DATA8_B3F0A9                                            ;B3F06A|        |B3F0A9;
    dw pAIScripting0x0E                                        ;B3F06C|        |B3F0E6;
    dw pAIScripting0x0E                                        ;B3F06E|        |B3F0E6;
    dw pAIScripting0x0E                                        ;B3F070|        |B3F0E6;
    dw pAIScripting0x0E                                        ;B3F072|        |B3F0E6;
    dw pAIScripting0x0E                                        ;B3F074|        |B3F0E6;
    dw pAIScripting0x0E                                        ;B3F076|        |B3F0E6;
    dw pAIScripting0x0E                                        ;B3F078|        |B3F0E6;
    dw pAIScripting0x0E                                        ;B3F07A|        |B3F0E6;
    dw pAIScripting0x0E                                        ;B3F07C|        |B3F0E6;
    dw pAIScripting0x0E                                        ;B3F07E|        |B3F0E6;
    dw pAIScripting0x0E                                        ;B3F080|        |B3F0E6;
    dw pAIScripting0x0E                                        ;B3F082|        |B3F0E6;
    dw pAIScripting0x0E                                        ;B3F084|        |B3F0E6;
    dw pAIScripting0x0E                                        ;B3F086|        |B3F0E6;
 
AI_ObtainHorse:
 
    %AICMD0x50()                                               ;B3F088
    %AICMD0x02_FreezeTime()                                    ;B3F089
    %AICMD0x08_EnableAIControl()                               ;B3F08A
    %AICMD0x09_StartScript($17, AI_ObtainHorse_L001)                                   ;B3F08B
    %AICMD0x38_WaitForFadeIn()                                               ;B3F08F
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B3F090
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 40)                  ;B3F092
    %AICMD0x1C_ShowDialog($0318, $00)                          ;B3F096
    %AICMD0x23_OrWithIndexedValue($800196, $0D)                ;B3F09A
    %AICMD0x10_End()                                           ;B3F09F
AI_ObtainHorse_L001:
    %AICMD0x1A($00A8, $0080, aAIScriptingData_L129, $02)                     ;B3F0A0
    %AICMD0x10_End()                                           ;B3F0A8


DATA8_B3F0A9:
    %AICMD0x50()                                               ;B3F0A9
    %AICMD0x02_FreezeTime()                                    ;B3F0AA
    %AICMD0x08_EnableAIControl()                               ;B3F0AB
    %AICMD0x05_SetTransferPosition(184, 120)                   ;B3F0AC
    %AICMD0x09_StartScript($17, AI_ObtainHorse_L002)                                   ;B3F0B1
    %AICMD0x38_WaitForFadeIn()                                               ;B3F0B5
    %AICMD0x0B_SetScriptFlag($00)                                            ;B3F0B6
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B3F0B8
    %AICMD0x11_EnableUserControl()                             ;B3F0BA
    %AICMD0x41_AddValue16(nPlayerHappiness, 10)                ;B3F0BB
    %AICMD0x10_End()                                           ;B3F0C1
AI_ObtainHorse_L002:
    %AICMD0x1A($00A8, $0080, aAIScriptingData_L129, $00)                     ;B3F0C2
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B3F0CA
    %AICMD0x1B($020A, $00)                                     ;B3F0CC
    %AICMD0x0D($00, $01, $10, $01)                             ;B3F0D0
    %AICMD0x1B($0210, $01)                                     ;B3F0D5
    %AICMD0x0D($01, $00, $68, $01)                             ;B3F0D9
    %AICMD0x0B_SetScriptFlag($01)                                            ;B3F0DE
    %AICMD0x23_OrWithIndexedValue(strcFlags.event3, $08)       ;B3F0E0
    %AICMD0x10_End()                                           ;B3F0E5
