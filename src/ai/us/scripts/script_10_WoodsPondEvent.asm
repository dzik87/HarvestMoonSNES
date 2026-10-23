

pAIScripting0x10_WoodsPondEvent:
    dw AI_WaterImp                                             ;B487B8|        |B487D8;
    dw pAIScripting0x11                                        ;B487BA|        |B48818;
    dw pAIScripting0x11                                        ;B487BC|        |B48818;
    dw pAIScripting0x11                                        ;B487BE|        |B48818;
    dw pAIScripting0x11                                        ;B487C0|        |B48818;
    dw pAIScripting0x11                                        ;B487C2|        |B48818;
    dw pAIScripting0x11                                        ;B487C4|        |B48818;
    dw pAIScripting0x11                                        ;B487C6|        |B48818;
    dw pAIScripting0x11                                        ;B487C8|        |B48818;
    dw pAIScripting0x11                                        ;B487CA|        |B48818;
    dw pAIScripting0x11                                        ;B487CC|        |B48818;
    dw pAIScripting0x11                                        ;B487CE|        |B48818;
    dw pAIScripting0x11                                        ;B487D0|        |B48818;
    dw pAIScripting0x11                                        ;B487D2|        |B48818;
    dw pAIScripting0x11                                        ;B487D4|        |B48818;
    dw pAIScripting0x11                                        ;B487D6|        |B48818;
 
AI_WaterImp:
    %AICMD0x08_EnableAIControl()                               ;B487D8
    %AICMD0x13_Wait(60)                                        ;B487D9
    %AICMD0x09_StartScript($07, AI_WaterImp_L001)                                   ;B487DC
    %AICMD0x09_StartScript($15, AI_WaterImp_L002)                                   ;B487E0
    %AICMD0x10_End()                                           ;B487E4
AI_WaterImp_L001:
    %AICMD0x1A($02B0, $0170, aAIScriptingData_L092, $00)                     ;B487E5
    %AICMD0x1C_ShowDialog($0335, $00)                          ;B487ED
    %AICMD0x0B_SetScriptFlag($00)                                            ;B487F1
    %AICMD0x13_Wait(180)                                       ;B487F3
    %AICMD0x37()                                               ;B487F6
    %AICMD0x10_End()                                           ;B487F7
AI_WaterImp_L002:
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B487F8
    %AICMD0x1A($02A8, $0178, aAIScriptingData_L123, $00)                     ;B487FA
    %AICMD0x0D($00, $01, $0C, $01)                             ;B48802
    %AICMD0x0D($00, $02, $12, $01)                             ;B48807
    %AICMD0x13_Wait(180)                                       ;B4880C
    %AICMD0x1B($040D, $00)                                     ;B4880F
    %AICMD0x11_EnableUserControl()                             ;B48813
AI_WaterImp_L003:
    %AICMD0x4A()                                               ;B48814
    %AICMD0x12_Jump(AI_WaterImp_L003)                                   ;B48815
