

    incsrc "../../../../build/gen/ai/slots_2C.asm"
 
pAIScripting0x2C_Data01:
    %AICMD0x1A($0228, $0258, aAIScriptingData_L134, $00)                     ;B4C568
    %AICMD0x13_Wait(60)                                        ;B4C570
    %AICMD0x1B($0307, $01)                                     ;B4C573
    %AICMD0x0D($01, $00, $FF, $01)                             ;B4C577
    %AICMD0x37()                                               ;B4C57C
    %AICMD0x41_AddValue16(nPlayerHappiness, 10)                ;B4C57D
    %AICMD0x10_End()                                           ;B4C583
