

pAIScripting0x17:
    dw DATA8_B48E25                                            ;B48E05|        |B48E25;
    dw pAIScripting0x18                                        ;B48E07|        |B48EC5;
    dw pAIScripting0x18                                        ;B48E09|        |B48EC5;
    dw pAIScripting0x18                                        ;B48E0B|        |B48EC5;
    dw pAIScripting0x18                                        ;B48E0D|        |B48EC5;
    dw pAIScripting0x18                                        ;B48E0F|        |B48EC5;
    dw pAIScripting0x18                                        ;B48E11|        |B48EC5;
    dw pAIScripting0x18                                        ;B48E13|        |B48EC5;
    dw pAIScripting0x18                                        ;B48E15|        |B48EC5;
    dw pAIScripting0x18                                        ;B48E17|        |B48EC5;
    dw pAIScripting0x18                                        ;B48E19|        |B48EC5;
    dw pAIScripting0x18                                        ;B48E1B|        |B48EC5;
    dw pAIScripting0x18                                        ;B48E1D|        |B48EC5;
    dw pAIScripting0x18                                        ;B48E1F|        |B48EC5;
    dw pAIScripting0x18                                        ;B48E21|        |B48EC5;
    dw pAIScripting0x18                                        ;B48E23|        |B48EC5;
 
DATA8_B48E25:
    %AICMD0x00_SetMusic($0A, $B4)                              ;B48E25
    %AICMD0x08_EnableAIControl()                               ;B48E28
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B48E29
    %AICMD0x09_StartScript($01, pAIScripting0x17_L001)                                   ;B48E2B
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B48E2F
    %AICMD0x11_EnableUserControl()                             ;B48E31
    %AICMD0x10_End()                                           ;B48E32
pAIScripting0x17_L001:
    %AICMD0x1A($0068, $0218, aAIScriptingData_L088, $00)                     ;B48E33
    %AICMD0x1B($0315, $00)                                     ;B48E3B
    %AICMD0x0D($00, $03, $10, $01)                             ;B48E3F
    %AICMD0x09_StartScript($02, pAIScripting0x17_L005)                                   ;B48E44
    %AICMD0x13_Wait(30)                                        ;B48E48
    %AICMD0x1D_ShowDialog($031E, $00)                          ;B48E4B
    %AICMD0x20_JumpIfChoice(0, pAIScripting0x17_L002)                        ;B48E4F
    %AICMD0x20_JumpIfChoice(1, pAIScripting0x17_L003)                        ;B48E53
    %AICMD0x12_Jump(pAIScripting0x17_L004)                                   ;B48E57
pAIScripting0x17_L002:
    %AICMD0x25_RemoveActor($02)                                            ;B48E5A
    %AICMD0x09_StartScript($02, pAIScripting0x17_L006)                                   ;B48E5C
    %AICMD0x1C_ShowDialog($031F, $00)                          ;B48E60
    %AICMD0x23_OrWithIndexedValue(strcFlags.event4, $03)       ;B48E64
    %AICMD0x41_AddValue16(nPlayerHappiness, -30)               ;B48E69
    %AICMD0x12_Jump(pAIScripting0x17_L004)                                   ;B48E6F
pAIScripting0x17_L003:
    %AICMD0x1C_ShowDialog($0320, $00)                          ;B48E72
    %AICMD0x28_ClearBit(strcShedItems.row1, $03)                        ;B48E76
    %AICMD0x47_SetValue8($800921, 20)                          ;B48E7B
    %AICMD0x41_AddValue16(nPlayerHappiness, 20)                ;B48E80
    %AICMD0x12_Jump(pAIScripting0x17_L004)                                   ;B48E86
pAIScripting0x17_L004:
    %AICMD0x13_Wait(120)                                       ;B48E89
    %AICMD0x1B($0316, $00)                                     ;B48E8C
    %AICMD0x0B_SetScriptFlag($00)                                            ;B48E90
    %AICMD0x37()                                               ;B48E92
    %AICMD0x10_End()                                           ;B48E93
pAIScripting0x17_L005:
    %AICMD0x13_Wait(30)                                        ;B48E94
    %AICMD0x1A($0068, $0238, aAIScriptingData_L138, $00)                     ;B48E97
    %AICMD0x0D($00, $FF, $20, $04)                             ;B48E9F
    %AICMD0x0D($00, $01, $30, $01)                             ;B48EA4
    %AICMD0x13_Wait(60)                                        ;B48EA9
    %AICMD0x37()                                               ;B48EAC
    %AICMD0x10_End()                                           ;B48EAD
pAIScripting0x17_L006:
    %AICMD0x1A($0068, $0238, aAIScriptingData_L137, $00)                     ;B48EAE
    %AICMD0x0D($00, $FF, $20, $04)                             ;B48EB6
    %AICMD0x0D($00, $01, $30, $01)                             ;B48EBB
    %AICMD0x13_Wait(60)                                        ;B48EC0
    %AICMD0x37()                                               ;B48EC3
    %AICMD0x10_End()                                           ;B48EC4
