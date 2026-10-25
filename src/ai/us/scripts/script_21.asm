

    incsrc "../../../../build/gen/ai/slots_21.asm"
 
pAIScripting0x21_Data01:
    %AICMD0x09_StartScript($13, pAIScripting0x21_L009)                                   ;B49F33
    %AICMD0x10_End()                                           ;B49F37
pAIScripting0x21_L001:
    %AICMD0x1A($0108, $01A8, aAIScriptingData_L039, $03)                     ;B49F38
    %AICMD0x1B($0281, $00)                                     ;B49F40
    %AICMD0x0D($FF, $00, $70, $01)                             ;B49F44
    %AICMD0x1B($0280, $00)                                     ;B49F49
    %AICMD0x1D_ShowDialog($0330, $00)                          ;B49F4D
    %AICMD0x20_JumpIfChoice(0, pAIScripting0x21_L003)                        ;B49F51
    %AICMD0x20_JumpIfChoice(1, pAIScripting0x21_L004)                        ;B49F55
    %AICMD0x12_Jump(pAIScripting0x21_L002)                                   ;B49F59
pAIScripting0x21_L002:
    %AICMD0x12_Jump(pAIScripting0x21_L002)                                   ;B49F5C
pAIScripting0x21_L003:
    %AICMD0x1D_ShowDialog($0331, $00)                          ;B49F5F
    %AICMD0x20_JumpIfChoice(0, pAIScripting0x21_L005)                        ;B49F63
    %AICMD0x20_JumpIfChoice(1, pAIScripting0x21_L006)                        ;B49F67
    %AICMD0x12_Jump(pAIScripting0x21_L002)                                   ;B49F6B
pAIScripting0x21_L004:
    %AICMD0x1C_ShowDialog($0332, $00)                          ;B49F6E
    %AICMD0x41_AddValue16(nPlayerHappiness, -10)               ;B49F72
    %AICMD0x12_Jump(pAIScripting0x21_L008)                                   ;B49F78
pAIScripting0x21_L005:
    %AICMD0x1C_ShowDialog($0333, $00)                          ;B49F7B
    %AICMD0x41_AddValue16(nPlayerHappiness, 50)                ;B49F7F
    %AICMD0x12_Jump(pAIScripting0x21_L007)                                   ;B49F85
pAIScripting0x21_L006:
    %AICMD0x1C_ShowDialog($0334, $00)                          ;B49F88
    %AICMD0x12_Jump(pAIScripting0x21_L008)                                   ;B49F8C
pAIScripting0x21_L007:
    %AICMD0x0B_SetScriptFlag($03)                                            ;B49F8F
    %AICMD0x1B($0281, $01)                                     ;B49F91
    %AICMD0x0D($01, $00, $70, $01)                             ;B49F95
    %AICMD0x37()                                               ;B49F9A
    %AICMD0x11_EnableUserControl()                             ;B49F9B
    %AICMD0x10_End()                                           ;B49F9C
pAIScripting0x21_L008:
    %AICMD0x0D($FF, $00, $30, $01)                             ;B49F9D
    %AICMD0x25_RemoveActor($13)                                            ;B49FA2
    %AICMD0x13_Wait(10)                                        ;B49FA4
    %AICMD0x1B($0284, $00)                                     ;B49FA7
    %AICMD0x0D($01, $00, $A0, $01)                             ;B49FAB
    %AICMD0x37()                                               ;B49FB0
    %AICMD0x11_EnableUserControl()                             ;B49FB1
    %AICMD0x10_End()                                           ;B49FB2
pAIScripting0x21_L009:
    %AICMD0x1A($0068, $01A8, aAIScriptingData_L132, $00)                     ;B49FB3
pAIScripting0x21_L010:
    %AICMD0x1F(pAIScripting0x21_L011)                                        ;B49FBB
    %AICMD0x12_Jump(pAIScripting0x21_L010)                                   ;B49FBE
pAIScripting0x21_L011:
    %AICMD0x08_EnableAIControl()                               ;B49FC1
    %AICMD0x23_OrWithIndexedValue(strcFlags.event4, $09)       ;B49FC2
    %AICMD0x09_StartScript($09, pAIScripting0x21_L001)                                   ;B49FC7
    %AICMD0x0C_WaitForScriptFlag($03)                                            ;B49FCB
    %AICMD0x1B($0303, $00)                                     ;B49FCD
    %AICMD0x0D($FF, $00, $3A, $01)                             ;B49FD1
    %AICMD0x37()                                               ;B49FD6
    %AICMD0x10_End()                                           ;B49FD7
