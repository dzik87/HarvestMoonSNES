

pAIScripting0x29:
    dw pAIScripting0x29_Data01                                            ;B4C427|        |B4C447;
    dw pAIScripting0x2A                                        ;B4C429|        |B4C4B8;
    dw pAIScripting0x2A                                        ;B4C42B|        |B4C4B8;
    dw pAIScripting0x2A                                        ;B4C42D|        |B4C4B8;
    dw pAIScripting0x2A                                        ;B4C42F|        |B4C4B8;
    dw pAIScripting0x2A                                        ;B4C431|        |B4C4B8;
    dw pAIScripting0x2A                                        ;B4C433|        |B4C4B8;
    dw pAIScripting0x2A                                        ;B4C435|        |B4C4B8;
    dw pAIScripting0x2A                                        ;B4C437|        |B4C4B8;
    dw pAIScripting0x2A                                        ;B4C439|        |B4C4B8;
    dw pAIScripting0x2A                                        ;B4C43B|        |B4C4B8;
    dw pAIScripting0x2A                                        ;B4C43D|        |B4C4B8;
    dw pAIScripting0x2A                                        ;B4C43F|        |B4C4B8;
    dw pAIScripting0x2A                                        ;B4C441|        |B4C4B8;
    dw pAIScripting0x2A                                        ;B4C443|        |B4C4B8;
    dw pAIScripting0x2A                                        ;B4C445|        |B4C4B8;
 
pAIScripting0x29_Data01:
    %AICMD0x09_StartScript($01, pAIScripting0x29_L001)                                   ;B4C447
    %AICMD0x38_WaitForFadeIn()                                               ;B4C44B
    %AICMD0x10_End()                                           ;B4C44C
pAIScripting0x29_L001:
    %AICMD0x15_JumpIfEquals8(nCurrentTimeID, 18, pAIScripting0x29_L008)      ;B4C44D
    %AICMD0x1A($0068, $01A8, aAIScriptingData_L055, $02)                     ;B4C454
pAIScripting0x29_L002:
    %AICMD0x2D_JumpOnInteract(pAIScripting0x29_L004, pAIScripting0x29_L003)                               ;B4C45C
    %AICMD0x16_JumpIfBetween8(nCurrentTimeID, 18, 24, pAIScripting0x29_L005) ;B4C461
    %AICMD0x12_Jump(pAIScripting0x29_L002)                                   ;B4C469
pAIScripting0x29_L003:
    %AICMD0x15_JumpIfEquals8(wram80(strcPlayerData.carryItemIdPrev), 20, pAIScripting0x29_L006)             ;B4C46C
    %AICMD0x1C_ShowDialog($041B, $00)                          ;B4C473
    %AICMD0x12_Jump(pAIScripting0x29_L002)                                   ;B4C477
pAIScripting0x29_L004:
    %AICMD0x1C_ShowDialog($0418, $00)                          ;B4C47A
    %AICMD0x12_Jump(pAIScripting0x29_L002)                                   ;B4C47E
pAIScripting0x29_L005:
    %AICMD0x1C_ShowDialog($0419, $00)                          ;B4C481
    %AICMD0x41_AddValue16(nPlayerHappiness, -5)                ;B4C485
    %AICMD0x12_Jump(pAIScripting0x29_L007)                                   ;B4C48B
pAIScripting0x29_L006:
    %AICMD0x1C_ShowDialog($041A, $00)                          ;B4C48E
    %AICMD0x42_AddValue24(nMoney, 2)                           ;B4C492
    %AICMD0x41_AddValue16(nPlayerHappiness, 30)                ;B4C499
    %AICMD0x12_Jump(pAIScripting0x29_L007)                                   ;B4C49F
pAIScripting0x29_L007:
    %AICMD0x23_OrWithIndexedValue(strcFlags.event4, $0B)       ;B4C4A2
    %AICMD0x28_ClearBit(strcFlags.event4, $0A)                          ;B4C4A7
    %AICMD0x1B($02B6, $00)                                     ;B4C4AC
    %AICMD0x0D($FF, $00, $60, $01)                             ;B4C4B0
    %AICMD0x37()                                               ;B4C4B5
    %AICMD0x10_End()                                           ;B4C4B6
pAIScripting0x29_L008:
    %AICMD0x10_End()                                           ;B4C4B7
