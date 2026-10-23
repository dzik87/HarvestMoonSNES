

pAIScripting0x2C:
    dw DATA8_B4C568                                            ;B4C548|        |B4C568;
    dw pAIScripting0x2D                                        ;B4C54A|        |B4C584;
    dw pAIScripting0x2D                                        ;B4C54C|        |B4C584;
    dw pAIScripting0x2D                                        ;B4C54E|        |B4C584;
    dw pAIScripting0x2D                                        ;B4C550|        |B4C584;
    dw pAIScripting0x2D                                        ;B4C552|        |B4C584;
    dw pAIScripting0x2D                                        ;B4C554|        |B4C584;
    dw pAIScripting0x2D                                        ;B4C556|        |B4C584;
    dw pAIScripting0x2D                                        ;B4C558|        |B4C584;
    dw pAIScripting0x2D                                        ;B4C55A|        |B4C584;
    dw pAIScripting0x2D                                        ;B4C55C|        |B4C584;
    dw pAIScripting0x2D                                        ;B4C55E|        |B4C584;
    dw pAIScripting0x2D                                        ;B4C560|        |B4C584;
    dw pAIScripting0x2D                                        ;B4C562|        |B4C584;
    dw pAIScripting0x2D                                        ;B4C564|        |B4C584;
    dw pAIScripting0x2D                                        ;B4C566|        |B4C584;
 
DATA8_B4C568:
    %AICMD0x1A($0228, $0258, aAIScriptingData_L134, $00)                     ;B4C568
    %AICMD0x13_Wait(60)                                        ;B4C570
    %AICMD0x1B($0307, $01)                                     ;B4C573
    %AICMD0x0D($01, $00, $FF, $01)                             ;B4C577
    %AICMD0x37()                                               ;B4C57C
    %AICMD0x41_AddValue16(nPlayerHappiness, 10)                ;B4C57D
    %AICMD0x10_End()                                           ;B4C583
