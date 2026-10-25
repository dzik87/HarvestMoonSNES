

    incsrc "../../../../build/gen/ai/slots_2A.asm"
 
pAIScripting0x2A_Data01:
    %AICMD0x1A($0218, $0078, aAIScriptingData_L133, $00)                     ;B4C4D8
    %AICMD0x13_Wait(1)                                         ;B4C4E0
    %AICMD0x1B($0305, $01)                                     ;B4C4E3
    %AICMD0x0D($01, $00, $50, $01)                             ;B4C4E7
    %AICMD0x1B($0304, $01)                                     ;B4C4EC
    %AICMD0x13_Wait(60)                                        ;B4C4F0
    %AICMD0x1B($0305, $01)                                     ;B4C4F3
    %AICMD0x0D($02, $00, $80, $01)                             ;B4C4F7
    %AICMD0x37()                                               ;B4C4FC
    %AICMD0x41_AddValue16(nPlayerHappiness, 10)                ;B4C4FD
    %AICMD0x10_End()                                           ;B4C503
