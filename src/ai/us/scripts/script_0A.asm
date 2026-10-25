

pAIScripting0x0A:
    dw pAIScripting0x0A_Data01                                            ;B3E83B|        |B3E85B;
    dw pAIScripting0x0A_Data02                                            ;B3E83D|        |B3E89A;
    dw pAIScripting0x0A_Data03                                            ;B3E83F|        |B3E8C8;
    dw pAIScripting0x0A_Data04                                            ;B3E841|        |B3E90B;
    dw pAIScripting0x0A_Data05                                            ;B3E843|        |B3E982;
    dw pAIScripting0x0A_Data06                                            ;B3E845|        |B3E9AE;
    dw pAIScripting0x0B                                        ;B3E847|        |B3E9DA;
    dw pAIScripting0x0B                                        ;B3E849|        |B3E9DA;
    dw pAIScripting0x0B                                        ;B3E84B|        |B3E9DA;
    dw pAIScripting0x0B                                        ;B3E84D|        |B3E9DA;
    dw pAIScripting0x0B                                        ;B3E84F|        |B3E9DA;
    dw pAIScripting0x0B                                        ;B3E851|        |B3E9DA;
    dw pAIScripting0x0B                                        ;B3E853|        |B3E9DA;
    dw pAIScripting0x0B                                        ;B3E855|        |B3E9DA;
    dw pAIScripting0x0B                                        ;B3E857|        |B3E9DA;
    dw pAIScripting0x0B                                        ;B3E859|        |B3E9DA;
 
pAIScripting0x0A_Data01:
 
    %AICMD0x4F_DisableToolUse()                                               ;B3E85B
    %AICMD0x50()                                               ;B3E85C
    %AICMD0x02_FreezeTime()                                    ;B3E85D
    %AICMD0x05_SetTransferPosition(136, 344)                   ;B3E85E
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B3E863
    %AICMD0x08_EnableAIControl()                               ;B3E865
    %AICMD0x09_StartScript($01, pAIScripting0x0A_L001)                                   ;B3E866
    %AICMD0x06_SetDestinationArea(!AREA_FARMSPRING)            ;B3E86A
    %AICMD0x38_WaitForFadeIn()                                               ;B3E86C
    %AICMD0x0B_SetScriptFlag($00)                                            ;B3E86D
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B3E86F
    %AICMD0x23_OrWithIndexedValue($800196, $0D)                ;B3E871
    %AICMD0x10_End()                                           ;B3E876
pAIScripting0x0A_L001:
    %AICMD0x1A($0068, $01A8, aAIScriptingData_L035, $02)                     ;B3E877
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B3E87F
    %AICMD0x1B($0275, $01)                                     ;B3E881
    %AICMD0x0D($01, $00, $20, $01)                             ;B3E885
    %AICMD0x1B($0273, $00)                                     ;B3E88A
    %AICMD0x0D($00, $FF, $40, $01)                             ;B3E88E
    %AICMD0x1C_ShowDialog($00F2, $00)                          ;B3E893
    %AICMD0x0B_SetScriptFlag($01)                                            ;B3E897
    %AICMD0x10_End()                                           ;B3E899


pAIScripting0x0A_Data02:
 
    %AICMD0x4F_DisableToolUse()                                               ;B3E89A
    %AICMD0x50()                                               ;B3E89B
    %AICMD0x02_FreezeTime()                                    ;B3E89C
    %AICMD0x05_SetTransferPosition(136, 296)                   ;B3E89D
    %AICMD0x08_EnableAIControl()                               ;B3E8A2
    %AICMD0x09_StartScript($01, pAIScripting0x0A_L002)                                   ;B3E8A3
    %AICMD0x38_WaitForFadeIn()                                               ;B3E8A7
    %AICMD0x0B_SetScriptFlag($00)                                            ;B3E8A8
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B3E8AA
    %AICMD0x3D_TeleportToArea(!AREA_TOWNSPRING)                ;B3E8AC
    %AICMD0x05_SetTransferPosition(712, 424)                   ;B3E8AE
    %AICMD0x07_SetPlayerDirection(!PDIR_RIGHT)                 ;B3E8B3
    %AICMD0x10_End()                                           ;B3E8B5
pAIScripting0x0A_L002:
    %AICMD0x1A($00F0, $0088, aAIScriptingData_L128, $00)                     ;B3E8B6
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B3E8BE
    %AICMD0x0D($FF, $00, $FF, $01)                             ;B3E8C0
    %AICMD0x0B_SetScriptFlag($01)                                            ;B3E8C5
    %AICMD0x10_End()                                           ;B3E8C7


pAIScripting0x0A_Data03:
 
    %AICMD0x4F_DisableToolUse()                                               ;B3E8C8
    %AICMD0x50()                                               ;B3E8C9
    %AICMD0x02_FreezeTime()                                    ;B3E8CA
    %AICMD0x05_SetTransferPosition(136, 344)                   ;B3E8CB
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B3E8D0
    %AICMD0x08_EnableAIControl()                               ;B3E8D2
    %AICMD0x09_StartScript($01, pAIScripting0x0A_L003)                                   ;B3E8D3
    %AICMD0x38_WaitForFadeIn()                                               ;B3E8D7
    %AICMD0x0B_SetScriptFlag($00)                                            ;B3E8D8
    %AICMD0x0C_WaitForScriptFlag($01)                                            ;B3E8DA
    %AICMD0x39_WalkForTime(!AIINPUT_DOWN, 96)                  ;B3E8DC
    %AICMD0x40_DisableTileInteractions()                       ;B3E8E0
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 144)                 ;B3E8E1
    %AICMD0x3D_TeleportToArea(!AREA_CROSSROADSPRING)           ;B3E8E5
    %AICMD0x10_End()                                           ;B3E8E7
pAIScripting0x0A_L003:
    %AICMD0x1A($0088, $0168, aAIScriptingData_L035, $01)                     ;B3E8E8
    %AICMD0x0C_WaitForScriptFlag($00)                                            ;B3E8F0
    %AICMD0x1C_ShowDialog($00F3, $00)                          ;B3E8F2
    %AICMD0x0B_SetScriptFlag($01)                                            ;B3E8F6
    %AICMD0x1B($0271, $00)                                     ;B3E8F8
    %AICMD0x0D($00, $01, $60, $01)                             ;B3E8FC
    %AICMD0x1B($0275, $00)                                     ;B3E901
    %AICMD0x0D($FF, $00, $90, $01)                             ;B3E905
    %AICMD0x10_End()                                           ;B3E90A


pAIScripting0x0A_Data04:
 
    %AICMD0x4F_DisableToolUse()                                               ;B3E90B
    %AICMD0x50()                                               ;B3E90C
    %AICMD0x28_ClearBit($8000D2, $05)                                   ;B3E90D
    %AICMD0x23_OrWithIndexedValue(strcFlags.daily4, $0E)       ;B3E912
    %AICMD0x02_FreezeTime()                                    ;B3E917
    %AICMD0x05_SetTransferPosition(128, 200)                   ;B3E918
    %AICMD0x07_SetPlayerDirection(!PDIR_UP)                    ;B3E91D
    %AICMD0x08_EnableAIControl()                               ;B3E91F
    %AICMD0x38_WaitForFadeIn()                                               ;B3E920
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $07, pAIScripting0x0A_L005)   ;B3E921
    %AICMD0x14_JumpIfFlagSet(strcFlags.event1, $06, pAIScripting0x0A_L004)   ;B3E928
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 16)                    ;B3E92F
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 40)                  ;B3E933
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 96)                    ;B3E937
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 16)                  ;B3E93B
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B3E93F
    %AICMD0x54_ShowDialog($0290, $00)                          ;B3E941
    %AICMD0x50()                                               ;B3E945
    %AICMD0x47_SetValue8(wram80(nTimeState), 3)                           ;B3E946
    %AICMD0x10_End()                                           ;B3E94B
pAIScripting0x0A_L004:
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 16)                    ;B3E94C
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 56)                  ;B3E950
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 96)                    ;B3E954
    %AICMD0x39_WalkForTime(!AIINPUT_LEFT, 16)                  ;B3E958
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B3E95C
    %AICMD0x54_ShowDialog($0290, $00)                          ;B3E95E
    %AICMD0x50()                                               ;B3E962
    %AICMD0x47_SetValue8(wram80(nTimeState), 3)                           ;B3E963
    %AICMD0x10_End()                                           ;B3E968
pAIScripting0x0A_L005:
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 16)                    ;B3E969
    %AICMD0x39_WalkForTime(!AIINPUT_RIGHT, 166)                ;B3E96D
    %AICMD0x39_WalkForTime(!AIINPUT_UP, 96)                    ;B3E971
    %AICMD0x07_SetPlayerDirection(!PDIR_DOWN)                  ;B3E975
    %AICMD0x54_ShowDialog($0290, $00)                          ;B3E977
    %AICMD0x50()                                               ;B3E97B
    %AICMD0x47_SetValue8(wram80(nTimeState), 3)                           ;B3E97C
    %AICMD0x10_End()                                           ;B3E981


pAIScripting0x0A_Data05:
 
    %AICMD0x02_FreezeTime()                                    ;B3E982
    %AICMD0x08_EnableAIControl()                               ;B3E983
    %AICMD0x09_StartScript($01, pAIScripting0x0A_L006)                                   ;B3E984
    %AICMD0x38_WaitForFadeIn()                                               ;B3E988
    %AICMD0x10_End()                                           ;B3E989
pAIScripting0x0A_L006:
    %AICMD0x1A($0080, $00C8, aAIScriptingData_L044, $01)                     ;B3E98A
    %AICMD0x13_Wait(60)                                        ;B3E992
    %AICMD0x1B($0292, $00)                                     ;B3E995
    %AICMD0x0D($00, $FF, $10, $01)                             ;B3E999
    %AICMD0x1C_ShowDialog($0479, $01)                          ;B3E99E
    %AICMD0x1B($0290, $00)                                     ;B3E9A2
    %AICMD0x0D($00, $01, $20, $01)                             ;B3E9A6
    %AICMD0x37()                                               ;B3E9AB
    %AICMD0x11_EnableUserControl()                             ;B3E9AC
    %AICMD0x10_End()                                           ;B3E9AD


pAIScripting0x0A_Data06:
    %AICMD0x02_FreezeTime()                                    ;B3E9AE
    %AICMD0x08_EnableAIControl()                               ;B3E9AF
    %AICMD0x09_StartScript($01, pAIScripting0x0A_L007)                                   ;B3E9B0
    %AICMD0x38_WaitForFadeIn()                                               ;B3E9B4
    %AICMD0x10_End()                                           ;B3E9B5
pAIScripting0x0A_L007:
    %AICMD0x1A($0080, $00C8, aAIScriptingData_L044, $01)                     ;B3E9B6
    %AICMD0x13_Wait(60)                                        ;B3E9BE
    %AICMD0x1B($0292, $00)                                     ;B3E9C1
    %AICMD0x0D($00, $FF, $10, $01)                             ;B3E9C5
    %AICMD0x1C_ShowDialog($047A, $01)                          ;B3E9CA
    %AICMD0x1B($0290, $00)                                     ;B3E9CE
    %AICMD0x0D($00, $01, $20, $01)                             ;B3E9D2
    %AICMD0x37()                                               ;B3E9D7
    %AICMD0x11_EnableUserControl()                             ;B3E9D8
    %AICMD0x10_End()                                           ;B3E9D9
