

pAIScripting0x11:
    dw pAIScripting0x11_Data01                                            ;B48818|        |B48838;
    dw pAIScripting0x12                                        ;B4881A|        |B488A0;
    dw pAIScripting0x12                                        ;B4881C|        |B488A0;
    dw pAIScripting0x12                                        ;B4881E|        |B488A0;
    dw pAIScripting0x12                                        ;B48820|        |B488A0;
    dw pAIScripting0x12                                        ;B48822|        |B488A0;
    dw pAIScripting0x12                                        ;B48824|        |B488A0;
    dw pAIScripting0x12                                        ;B48826|        |B488A0;
    dw pAIScripting0x12                                        ;B48828|        |B488A0;
    dw pAIScripting0x12                                        ;B4882A|        |B488A0;
    dw pAIScripting0x12                                        ;B4882C|        |B488A0;
    dw pAIScripting0x12                                        ;B4882E|        |B488A0;
    dw pAIScripting0x12                                        ;B48830|        |B488A0;
    dw pAIScripting0x12                                        ;B48832|        |B488A0;
    dw pAIScripting0x12                                        ;B48834|        |B488A0;
    dw pAIScripting0x12                                        ;B48836|        |B488A0;
 
pAIScripting0x11_Data01:
    %AICMD0x50()                                               ;B48838
    %AICMD0x09_StartScript($01, pAIScripting0x11_L003)                                   ;B48839
    %AICMD0x38_WaitForFadeIn()                                               ;B4883D
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 80)                  ;B4883E
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B48842
    %AICMD0x1D_ShowDialog($0148, $00)                          ;B48844
    %AICMD0x20_JumpIfChoice(0, pAIScripting0x11_L001)                        ;B48848
    %AICMD0x20_JumpIfChoice(1, pAIScripting0x11_L002)                        ;B4884C
pAIScripting0x11_L001:
    %AICMD0x0F_ScreenFadeout($01)                              ;B48850
    %AICMD0x09_StartScript($02, pAIScripting0x11_L004)                                   ;B48852
    %AICMD0x0A_ScreenFadein($01)                                            ;B48856
    %AICMD0x1C_ShowDialog($014A, $00)                          ;B48858
    %AICMD0x0B_SetScriptFlag($00)                                            ;B4885C
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B4885E
    %AICMD0x11_EnableUserControl()                             ;B48860
    %AICMD0x10_End()                                           ;B48861
pAIScripting0x11_L002:
    %AICMD0x1C_ShowDialog($014C, $00)                          ;B48862
    %AICMD0x0B_SetScriptFlag($00)                                            ;B48866
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B48868
    %AICMD0x11_EnableUserControl()                             ;B4886A
    %AICMD0x10_End()                                           ;B4886B
pAIScripting0x11_L003:
    %AICMD0x1A($0068, $01A8, aAIScriptingData_L058, $02)                     ;B4886C
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B48874
    %AICMD0x1B($02BB, $00)                                     ;B48876
    %AICMD0x0D($00, $01, $10, $01)                             ;B4887A
    %AICMD0x1B($02BF, $00)                                     ;B4887F
    %AICMD0x0D($FF, $00, $A0, $01)                             ;B48883
    %AICMD0x0B_SetScriptFlag($01)                                            ;B48888
    %AICMD0x37()                                               ;B4888A
    %AICMD0x10_End()                                           ;B4888B
pAIScripting0x11_L004:
    %AICMD0x1A($0078, $01A8, aAIScriptingData_L008, $00)                     ;B4888C
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B48894
    %AICMD0x13_Wait(30)                                        ;B48896
    %AICMD0x0D($FF, $00, $A0, $01)                             ;B48899
    %AICMD0x37()                                               ;B4889E
    %AICMD0x10_End()                                           ;B4889F
