

pAIScripting0x2B:
    dw DATA8_B4C524                                            ;B4C504|        |B4C524;
    dw pAIScripting0x2C                                        ;B4C506|        |B4C548;
    dw pAIScripting0x2C                                        ;B4C508|        |B4C548;
    dw pAIScripting0x2C                                        ;B4C50A|        |B4C548;
    dw pAIScripting0x2C                                        ;B4C50C|        |B4C548;
    dw pAIScripting0x2C                                        ;B4C50E|        |B4C548;
    dw pAIScripting0x2C                                        ;B4C510|        |B4C548;
    dw pAIScripting0x2C                                        ;B4C512|        |B4C548;
    dw pAIScripting0x2C                                        ;B4C514|        |B4C548;
    dw pAIScripting0x2C                                        ;B4C516|        |B4C548;
    dw pAIScripting0x2C                                        ;B4C518|        |B4C548;
    dw pAIScripting0x2C                                        ;B4C51A|        |B4C548;
    dw pAIScripting0x2C                                        ;B4C51C|        |B4C548;
    dw pAIScripting0x2C                                        ;B4C51E|        |B4C548;
    dw pAIScripting0x2C                                        ;B4C520|        |B4C548;
    dw pAIScripting0x2C                                        ;B4C522|        |B4C548;
 
DATA8_B4C524:
    %AICMD0x1A($0088, $0098, aAIScriptingData_L132, $00)                     ;B4C524
    %AICMD0x13_Wait(1)                                         ;B4C52C
    %AICMD0x1B($0303, $00)                                     ;B4C52F
    %AICMD0x0D($FF, $00, $30, $01)                             ;B4C533
    %AICMD0x13_Wait(60)                                        ;B4C538
    %AICMD0x0D($FF, $00, $50, $01)                             ;B4C53B
    %AICMD0x37()                                               ;B4C540
    %AICMD0x41_AddValue16(nPlayerHappiness, 10)                ;B4C541
    %AICMD0x10_End()                                           ;B4C547
