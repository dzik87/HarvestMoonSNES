

pAIScripting0x25:
    dw DATA8_B4A5D5                                            ;B4A5B5|        |B4A5D5;
    dw pAIScripting0x26                                        ;B4A5B7|        |B4A60D;
    dw pAIScripting0x26                                        ;B4A5B9|        |B4A60D;
    dw pAIScripting0x26                                        ;B4A5BB|        |B4A60D;
    dw pAIScripting0x26                                        ;B4A5BD|        |B4A60D;
    dw pAIScripting0x26                                        ;B4A5BF|        |B4A60D;
    dw pAIScripting0x26                                        ;B4A5C1|        |B4A60D;
    dw pAIScripting0x26                                        ;B4A5C3|        |B4A60D;
    dw pAIScripting0x26                                        ;B4A5C5|        |B4A60D;
    dw pAIScripting0x26                                        ;B4A5C7|        |B4A60D;
    dw pAIScripting0x26                                        ;B4A5C9|        |B4A60D;
    dw pAIScripting0x26                                        ;B4A5CB|        |B4A60D;
    dw pAIScripting0x26                                        ;B4A5CD|        |B4A60D;
    dw pAIScripting0x26                                        ;B4A5CF|        |B4A60D;
    dw pAIScripting0x26                                        ;B4A5D1|        |B4A60D;
    dw pAIScripting0x26                                        ;B4A5D3|        |B4A60D;
 
DATA8_B4A5D5:
    %AICMD0x02_FreezeTime()                                    ;B4A5D5
    %AICMD0x05_SetTransferPosition(136, 344)                   ;B4A5D6
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B4A5DB
    %AICMD0x08_EnableAIControl()                               ;B4A5DD
    %AICMD0x09_StartScript($01, pAIScripting0x25_L001)                                   ;B4A5DE
    %AICMD0x38_WaitForFadeIn()                                               ;B4A5E2
    %AICMD0x0B_SetScriptFlag($00)                                            ;B4A5E3
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B4A5E5
    %AICMD0x11_EnableUserControl()                             ;B4A5E7
    %AICMD0x10_End()                                           ;B4A5E8
pAIScripting0x25_L001:
    %AICMD0x1A($0068, $01A8, aAIScriptingData_L046, $02)                     ;B4A5E9
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B4A5F1
    %AICMD0x1C_ShowDialog($0300, $00)                          ;B4A5F3
    %AICMD0x1B($0297, $00)                                     ;B4A5F7
    %AICMD0x0D($00, $01, $60, $01)                             ;B4A5FB
    %AICMD0x1B($029B, $01)                                     ;B4A600
    %AICMD0x0D($FF, $00, $70, $01)                             ;B4A604
    %AICMD0x0B_SetScriptFlag($01)                                            ;B4A609
    %AICMD0x37()                                               ;B4A60B
    %AICMD0x10_End()                                           ;B4A60C
