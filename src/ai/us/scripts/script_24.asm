

pAIScripting0x24:
    dw DATA8_B4A475                                            ;B4A455|        |B4A475;
    dw DATA8_B4A531                                            ;B4A457|        |B4A531;
    dw DATA8_B4A55D                                            ;B4A459|        |B4A55D;
    dw DATA8_B4A589                                            ;B4A45B|        |B4A589;
    dw pAIScripting0x25                                        ;B4A45D|        |B4A5B5;
    dw pAIScripting0x25                                        ;B4A45F|        |B4A5B5;
    dw pAIScripting0x25                                        ;B4A461|        |B4A5B5;
    dw pAIScripting0x25                                        ;B4A463|        |B4A5B5;
    dw pAIScripting0x25                                        ;B4A465|        |B4A5B5;
    dw pAIScripting0x25                                        ;B4A467|        |B4A5B5;
    dw pAIScripting0x25                                        ;B4A469|        |B4A5B5;
    dw pAIScripting0x25                                        ;B4A46B|        |B4A5B5;
    dw pAIScripting0x25                                        ;B4A46D|        |B4A5B5;
    dw pAIScripting0x25                                        ;B4A46F|        |B4A5B5;
    dw pAIScripting0x25                                        ;B4A471|        |B4A5B5;
    dw pAIScripting0x25                                        ;B4A473|        |B4A5B5;
 
DATA8_B4A475:
 
    %AICMD0x08_EnableAIControl()                               ;B4A475
    %AICMD0x1A($FFF8, $01A8, aAIScriptingData_L037, $02)                     ;B4A476
    %AICMD0x38_WaitForFadeIn()                                               ;B4A47E
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 40)                   ;B4A47F
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4A483
    %AICMD0x1B($027B, $01)                                     ;B4A485
    %AICMD0x0D($01, $00, $80, $01)                             ;B4A489
    %AICMD0x13_Wait(30)                                        ;B4A48E
    %AICMD0x15_JumpIfEquals8($80098C, 6, pAIScripting0x24_L001)              ;B4A491
    %AICMD0x15_JumpIfEquals8($80098C, 7, pAIScripting0x24_L002)              ;B4A498
    %AICMD0x15_JumpIfEquals8($80098C, 8, pAIScripting0x24_L003)              ;B4A49F
    %AICMD0x15_JumpIfEquals8($80098C, 9, pAIScripting0x24_L004)              ;B4A4A6
    %AICMD0x15_JumpIfEquals8($80098C, 10, pAIScripting0x24_L005)             ;B4A4AD
    %AICMD0x15_JumpIfEquals8($80098C, 11, pAIScripting0x24_L006)             ;B4A4B4
    %AICMD0x12_Jump(pAIScripting0x24_L007)                                   ;B4A4BB
pAIScripting0x24_L001:
    %AICMD0x1C_ShowDialog($0272, $00)                          ;B4A4BE
    %AICMD0x12_Jump(pAIScripting0x24_L007)                                   ;B4A4C2
pAIScripting0x24_L002:
    %AICMD0x1C_ShowDialog($0240, $00)                          ;B4A4C5
    %AICMD0x12_Jump(pAIScripting0x24_L007)                                   ;B4A4C9
pAIScripting0x24_L003:
    %AICMD0x1C_ShowDialog($028E, $00)                          ;B4A4CC
    %AICMD0x12_Jump(pAIScripting0x24_L008)                                   ;B4A4D0
pAIScripting0x24_L004:
    %AICMD0x1C_ShowDialog($026E, $00)                          ;B4A4D3
    %AICMD0x12_Jump(pAIScripting0x24_L007)                                   ;B4A4D7
pAIScripting0x24_L005:
    %AICMD0x1C_ShowDialog($0289, $00)                          ;B4A4DA
    %AICMD0x12_Jump(pAIScripting0x24_L007)                                   ;B4A4DE
pAIScripting0x24_L006:
    %AICMD0x1C_ShowDialog($0274, $00)                          ;B4A4E1
    %AICMD0x12_Jump(pAIScripting0x24_L007)                                   ;B4A4E5
pAIScripting0x24_L007:
    %AICMD0x13_Wait(30)                                        ;B4A4E8
    %AICMD0x1B($027B, $00)                                     ;B4A4EB
    %AICMD0x0D($FF, $00, $80, $01)                             ;B4A4EF
    %AICMD0x37()                                               ;B4A4F4
    %AICMD0x11_EnableUserControl()                             ;B4A4F5
    %AICMD0x10_End()                                           ;B4A4F6
pAIScripting0x24_L008:
    %AICMD0x09_StartScript($02, pAIScripting0x24_L009)                                   ;B4A4F7
    %AICMD0x13_Wait(30)                                        ;B4A4FB
    %AICMD0x0C_WaitForScriptFlag($02)                                            ;B4A4FE
    %AICMD0x1B($027B, $00)                                     ;B4A500
    %AICMD0x0D($FF, $00, $80, $01)                             ;B4A504
    %AICMD0x37()                                               ;B4A509
    %AICMD0x11_EnableUserControl()                             ;B4A50A
    %AICMD0x10_End()                                           ;B4A50B
pAIScripting0x24_L009:
    %AICMD0x1A($FFF8, $01A8, aAIScriptingData_L033, $02)                     ;B4A50C
    %AICMD0x1B($026E, $01)                                     ;B4A514
    %AICMD0x0D($01, $00, $70, $01)                             ;B4A518
    %AICMD0x13_Wait(30)                                        ;B4A51D
    %AICMD0x1C_ShowDialog($028F, $00)                          ;B4A520
    %AICMD0x0B_SetScriptFlag($02)                                            ;B4A524
    %AICMD0x1B($026E, $00)                                     ;B4A526
    %AICMD0x0D($FF, $00, $80, $01)                             ;B4A52A
    %AICMD0x37()                                               ;B4A52F
    %AICMD0x10_End()                                           ;B4A530


DATA8_B4A531:
 
    %AICMD0x08_EnableAIControl()                               ;B4A531
    %AICMD0x1A($FFF8, $01A8, aAIScriptingData_L046, $02)                     ;B4A532
    %AICMD0x38_WaitForFadeIn()                                               ;B4A53A
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 40)                   ;B4A53B
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4A53F
    %AICMD0x1B($029B, $01)                                     ;B4A541
    %AICMD0x0D($01, $00, $80, $01)                             ;B4A545
    %AICMD0x13_Wait(30)                                        ;B4A54A
    %AICMD0x1C_ShowDialog($047F, $00)                          ;B4A54D
    %AICMD0x1B($029B, $00)                                     ;B4A551
    %AICMD0x0D($FF, $00, $80, $01)                             ;B4A555
    %AICMD0x37()                                               ;B4A55A
    %AICMD0x11_EnableUserControl()                             ;B4A55B
    %AICMD0x10_End()                                           ;B4A55C


DATA8_B4A55D:
 
    %AICMD0x08_EnableAIControl()                               ;B4A55D
    %AICMD0x1A($FFF8, $01A8, aAIScriptingData_L028, $02)                     ;B4A55E
    %AICMD0x38_WaitForFadeIn()                                               ;B4A566
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 40)                   ;B4A567
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4A56B
    %AICMD0x1B($025F, $01)                                     ;B4A56D
    %AICMD0x0D($01, $00, $80, $01)                             ;B4A571
    %AICMD0x13_Wait(30)                                        ;B4A576
    %AICMD0x1C_ShowDialog($0486, $00)                          ;B4A579
    %AICMD0x1B($025F, $00)                                     ;B4A57D
    %AICMD0x0D($FF, $00, $80, $01)                             ;B4A581
    %AICMD0x37()                                               ;B4A586
    %AICMD0x11_EnableUserControl()                             ;B4A587
    %AICMD0x10_End()                                           ;B4A588


DATA8_B4A589:
    %AICMD0x08_EnableAIControl()                               ;B4A589
    %AICMD0x1A($FFF8, $01A8, aAIScriptingData_L028, $02)                     ;B4A58A
    %AICMD0x38_WaitForFadeIn()                                               ;B4A592
    %AICMD0x3A_RunForTime(!AIINPUT_DOWN, 40)                   ;B4A593
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B4A597
    %AICMD0x1B($025F, $01)                                     ;B4A599
    %AICMD0x0D($01, $00, $80, $01)                             ;B4A59D
    %AICMD0x13_Wait(30)                                        ;B4A5A2
    %AICMD0x1C_ShowDialog($0142, $00)                          ;B4A5A5
    %AICMD0x1B($025F, $00)                                     ;B4A5A9
    %AICMD0x0D($FF, $00, $80, $01)                             ;B4A5AD
    %AICMD0x37()                                               ;B4A5B2
    %AICMD0x11_EnableUserControl()                             ;B4A5B3
    %AICMD0x10_End()                                           ;B4A5B4
