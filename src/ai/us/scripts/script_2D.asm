

pAIScripting0x2D:
    dw DATA8_B4C5A4                                            ;B4C584|        |B4C5A4;
    dw pAIScripting0x2E                                        ;B4C586|        |B4C5F4;
    dw pAIScripting0x2E                                        ;B4C588|        |B4C5F4;
    dw pAIScripting0x2E                                        ;B4C58A|        |B4C5F4;
    dw pAIScripting0x2E                                        ;B4C58C|        |B4C5F4;
    dw pAIScripting0x2E                                        ;B4C58E|        |B4C5F4;
    dw pAIScripting0x2E                                        ;B4C590|        |B4C5F4;
    dw pAIScripting0x2E                                        ;B4C592|        |B4C5F4;
    dw pAIScripting0x2E                                        ;B4C594|        |B4C5F4;
    dw pAIScripting0x2E                                        ;B4C596|        |B4C5F4;
    dw pAIScripting0x2E                                        ;B4C598|        |B4C5F4;
    dw pAIScripting0x2E                                        ;B4C59A|        |B4C5F4;
    dw pAIScripting0x2E                                        ;B4C59C|        |B4C5F4;
    dw pAIScripting0x2E                                        ;B4C59E|        |B4C5F4;
    dw pAIScripting0x2E                                        ;B4C5A0|        |B4C5F4;
    dw pAIScripting0x2E                                        ;B4C5A2|        |B4C5F4;
 
DATA8_B4C5A4:
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B4C5A4
    %AICMD0x09_StartScript($01, pAIScripting0x2D_L002)                                   ;B4C5A6
    %AICMD0x11_EnableUserControl()                             ;B4C5AA
    %AICMD0x38_WaitForFadeIn()                                               ;B4C5AB
pAIScripting0x2D_L001:
    %AICMD0x13_Wait(1)                                         ;B4C5AC
    %AICMD0x12_Jump(pAIScripting0x2D_L001)                                   ;B4C5AF
pAIScripting0x2D_L002:
    %AICMD0x1A($0108, $001A, aAIScriptingData_L083, $00)                     ;B4C5B2
pAIScripting0x2D_L003:
    %AICMD0x0D($01, $00, $08, $01)                             ;B4C5BA
    %AICMD0x0D($00, $FF, $06, $01)                             ;B4C5BF
    %AICMD0x0D($FF, $00, $08, $02)                             ;B4C5C4
    %AICMD0x0D($FF, $01, $04, $01)                             ;B4C5C9
    %AICMD0x0D($01, $00, $0C, $02)                             ;B4C5CE
    %AICMD0x0D($FF, $00, $06, $01)                             ;B4C5D3
    %AICMD0x0D($00, $FF, $10, $02)                             ;B4C5D8
    %AICMD0x0D($FF, $01, $04, $01)                             ;B4C5DD
    %AICMD0x0D($01, $01, $0C, $02)                             ;B4C5E2
    %AICMD0x0D($01, $00, $08, $02)                             ;B4C5E7
    %AICMD0x0D($00, $FF, $06, $01)                             ;B4C5EC
    %AICMD0x12_Jump(pAIScripting0x2D_L003)                                   ;B4C5F1
