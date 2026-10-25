

pAIScripting0x13:
    dw pAIScripting0x13_Data01                                            ;B4892A|        |B4894A;
    dw pAIScripting0x14                                        ;B4892C|        |B489D2;
    dw pAIScripting0x14                                        ;B4892E|        |B489D2;
    dw pAIScripting0x14                                        ;B48930|        |B489D2;
    dw pAIScripting0x14                                        ;B48932|        |B489D2;
    dw pAIScripting0x14                                        ;B48934|        |B489D2;
    dw pAIScripting0x14                                        ;B48936|        |B489D2;
    dw pAIScripting0x14                                        ;B48938|        |B489D2;
    dw pAIScripting0x14                                        ;B4893A|        |B489D2;
    dw pAIScripting0x14                                        ;B4893C|        |B489D2;
    dw pAIScripting0x14                                        ;B4893E|        |B489D2;
    dw pAIScripting0x14                                        ;B48940|        |B489D2;
    dw pAIScripting0x14                                        ;B48942|        |B489D2;
    dw pAIScripting0x14                                        ;B48944|        |B489D2;
    dw pAIScripting0x14                                        ;B48946|        |B489D2;
    dw pAIScripting0x14                                        ;B48948|        |B489D2;
 
pAIScripting0x13_Data01:
    %AICMD0x50()                                               ;B4894A
    %AICMD0x08_EnableAIControl()                               ;B4894B
    %AICMD0x09_StartScript($01, pAIScripting0x13_L001)                                   ;B4894C
    %AICMD0x38_WaitForFadeIn()                                               ;B48950
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 80)                  ;B48951
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B48955
    %AICMD0x0B_SetScriptFlag($00)                                            ;B48957
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B48959
    %AICMD0x11_EnableUserControl()                             ;B4895B
    %AICMD0x10_End()                                           ;B4895C
pAIScripting0x13_L001:
    %AICMD0x1A($0078, $01A8, aAIScriptingData_L060, $02)                     ;B4895D
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B48965
    %AICMD0x1D_ShowDialog($014D, $00)                          ;B48967
    %AICMD0x20_JumpIfChoice(0, pAIScripting0x13_L002)                        ;B4896B
    %AICMD0x20_JumpIfChoice(1, pAIScripting0x13_L003)                        ;B4896F
pAIScripting0x13_L002:
    %AICMD0x1B($02BD, $00)                                     ;B48973
    %AICMD0x0D($00, $FF, $30, $01)                             ;B48977
    %AICMD0x1B($02C3, $01)                                     ;B4897C
    %AICMD0x0D($01, $00, $A0, $01)                             ;B48980
    %AICMD0x1B($02C0, $00)                                     ;B48985
    %AICMD0x13_Wait(180)                                       ;B48989
    %AICMD0x1B($02C3, $00)                                     ;B4898C
    %AICMD0x0D($FF, $00, $A0, $01)                             ;B48990
    %AICMD0x1B($02C1, $00)                                     ;B48995
    %AICMD0x0D($00, $01, $30, $01)                             ;B48999
    %AICMD0x1B($02C2, $01)                                     ;B4899E
    %AICMD0x1C_ShowDialog($014E, $00)                          ;B489A2
    %AICMD0x42_AddValue24(nMoney, -2000)                       ;B489A6
    %AICMD0x23_OrWithIndexedValue(strcFlags.event3, $0B)       ;B489AD
    %AICMD0x12_Jump(pAIScripting0x13_L004)                                   ;B489B2
pAIScripting0x13_L003:
    %AICMD0x1C_ShowDialog($014F, $00)                          ;B489B5
    %AICMD0x12_Jump(pAIScripting0x13_L004)                                   ;B489B9
pAIScripting0x13_L004:
    %AICMD0x1B($02C1, $00)                                     ;B489BC
    %AICMD0x0D($00, $01, $10, $01)                             ;B489C0
    %AICMD0x1B($02C3, $00)                                     ;B489C5
    %AICMD0x0D($FF, $00, $90, $01)                             ;B489C9
    %AICMD0x0B_SetScriptFlag($01)                                            ;B489CE
    %AICMD0x37()                                               ;B489D0
    %AICMD0x10_End()                                           ;B489D1
