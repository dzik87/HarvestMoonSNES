 
    ORG $B48000
 
 
pScripting_B48000:
    dw DATA8_B48020                                            ;B48000|        |B48020;
    dw DATA8_B48075                                            ;B48002|        |B48075;
    dw DATA8_B4820E                                            ;B48004|        |B4820E;
    dw DATA8_B48400                                            ;B48006|        |B48400;
    dw DATA8_B485C6                                            ;B48008|        |B485C6;
    dw DATA8_B486E8                                            ;B4800A|        |B486E8;
    dw pScripting_B487B8                                       ;B4800C|        |B487B8;
    dw pScripting_B487B8                                       ;B4800E|        |B487B8;
    dw pScripting_B487B8                                       ;B48010|        |B487B8;
    dw pScripting_B487B8                                       ;B48012|        |B487B8;
    dw pScripting_B487B8                                       ;B48014|        |B487B8;
    dw pScripting_B487B8                                       ;B48016|        |B487B8;
    dw pScripting_B487B8                                       ;B48018|        |B487B8;
    dw pScripting_B487B8                                       ;B4801A|        |B487B8;
    dw pScripting_B487B8                                       ;B4801C|        |B487B8;
    dw pScripting_B487B8                                       ;B4801E|        |B487B8;
 
DATA8_B48020:
 
AI_B48020:
    %AICMD0x4F()                                               ;B48020
    %AICMD0x50()                                               ;B48022
    %AICMD0x23_OrWithIndexedValue($7F1F60, $09)                ;B48023
    %AICMD0x23_OrWithIndexedValue($7F1F60, $00)                ;B48028
    %AICMD0x08()                                               ;B4802D
    %AICMD0x38()                                               ;B4802E
    %AICMD0x01_UnfreezeTime()                                  ;B4802F
    %AICMD0x24($74)                                            ;B48030
    %AICMD0x13($00B4)                                          ;B48032
    %AICMD0x1D($02B6, $00)                                     ;B48035
    %AICMD0x20($00, $804D)                                     ;B48039
    %AICMD0x20($01, $8055)                                     ;B4803D
    %AICMD0x20($02, $805D)                                     ;B48041
    %AICMD0x20($03, $8065)                                     ;B48045
    %AICMD0x20($04, $806D)                                     ;B48049
    %AICMD0x10_End()                                           ;B4804D
    %AICMD0x23_OrWithIndexedValue($7F1F74, $00)                ;B4804E
    %AICMD0x3D($0A)                                            ;B48053
    %AICMD0x10_End()                                           ;B48055
    %AICMD0x23_OrWithIndexedValue($7F1F74, $01)                ;B48056
    %AICMD0x3D($1B)                                            ;B4805B
    %AICMD0x10_End()                                           ;B4805D
    %AICMD0x23_OrWithIndexedValue($7F1F74, $02)                ;B4805E
    %AICMD0x3D($1E)                                            ;B48063
    %AICMD0x10_End()                                           ;B48065
    %AICMD0x23_OrWithIndexedValue($7F1F74, $03)                ;B48066
    %AICMD0x3D($39)                                            ;B4806B
    %AICMD0x10_End()                                           ;B4806D
    %AICMD0x23_OrWithIndexedValue($7F1F74, $04)                ;B4806E
    %AICMD0x3D($14)                                            ;B48073
    %AICMD0x10_End()                                           ;B48075

DATA8_B48075:
 
AI_B48075:
    %AICMD0x4F()                                               ;B48075
    %AICMD0x50()                                               ;B48077
    %AICMD0x23_OrWithIndexedValue($7F1F60, $09)                ;B48078
    %AICMD0x23_OrWithIndexedValue($7F1F5E, $0F)                ;B4807D
    %AICMD0x00_SetMusic($0E, $B4)                              ;B48082
    %AICMD0x03_SetHour($11)                                    ;B48085
    %AICMD0x05_SetPosition($0108, $0138)                       ;B48087
    %AICMD0x07_SetPlayerDirection($01)                         ;B4808C
    %AICMD0x09($01, $B480BC)                                   ;B4808E
    %AICMD0x09($02, $B480D3)                                   ;B48092
    %AICMD0x09($03, $B480EA)                                   ;B48096
    %AICMD0x09($05, $B48128)                                   ;B4809A
    %AICMD0x09($06, $B48189)                                   ;B4809E
    %AICMD0x38()                                               ;B480A2
    %AICMD0x0C($00)                                            ;B480A3
    %AICMD0x0C($01)                                            ;B480A5
    %AICMD0x0C($02)                                            ;B480A7
    %AICMD0x0C($03)                                            ;B480A9
    %AICMD0x0C($04)                                            ;B480AB
    %AICMD0x13($003C)                                          ;B480AD
    %AICMD0x28($1F5E, $7F, $0F)                                ;B480B0
    %AICMD0x41_ModifyVariable($7F1F25, $001E)                  ;B480B5
    %AICMD0x3C()                                               ;B480BB
    %AICMD0x10_End()                                           ;B480BC
    %AICMD0x1A($0108, $0098, $B38300, $00)                     ;B480BD
    %AICMD0x1F($80CA)                                          ;B480C5
    %AICMD0x12_Jump($B480C4)                                   ;B480C8
    %AICMD0x1C($02B7, $00)                                     ;B480CB
    %AICMD0x0B($00)                                            ;B480CF
    %AICMD0x12_Jump($B480C4)                                   ;B480D1
    %AICMD0x1A($00B8, $00A8, $B383D8, $01)                     ;B480D4
    %AICMD0x1F($80E1)                                          ;B480DC
    %AICMD0x12_Jump($B480DB)                                   ;B480DF
    %AICMD0x1C($02B8, $00)                                     ;B480E2
    %AICMD0x0B($01)                                            ;B480E6
    %AICMD0x12_Jump($B480DB)                                   ;B480E8
    %AICMD0x1A($0168, $00D8, $B382F4, $03)                     ;B480EB
    %AICMD0x1F($80FE)                                          ;B480F3
    %AICMD0x12_Jump($B480F2)                                   ;B480F6
    %AICMD0x1F($811F)                                          ;B480F9
    %AICMD0x12_Jump($B480F8)                                   ;B480FC
    %AICMD0x1D($02BA, $00)                                     ;B480FF
    %AICMD0x20($00, $810D)                                     ;B48103
    %AICMD0x20($01, $8116)                                     ;B48107
    %AICMD0x12_Jump($B480F2)                                   ;B4810B
    %AICMD0x1C($02BB, $00)                                     ;B4810E
    %AICMD0x0B($02)                                            ;B48112
    %AICMD0x12_Jump($B480F8)                                   ;B48114
    %AICMD0x1C($02BC, $00)                                     ;B48117
    %AICMD0x0B($02)                                            ;B4811B
    %AICMD0x12_Jump($B480F8)                                   ;B4811D
    %AICMD0x1C($02DC, $00)                                     ;B48120
    %AICMD0x0B($02)                                            ;B48124
    %AICMD0x12_Jump($B480F8)                                   ;B48126
    %AICMD0x1A($0148, $0128, $B38330, $03)                     ;B48129
    %AICMD0x22($20, $18, $01, $B3833C, $0C)                    ;B48131
    %AICMD0x1F($813D)                                          ;B48138
    %AICMD0x12_Jump($B48137)                                   ;B4813B
    %AICMD0x1C($02B9, $00)                                     ;B4813E
    %AICMD0x0B($03)                                            ;B48142
    %AICMD0x12_Jump($B48137)                                   ;B48144
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $00, $B48165)   ;B48147
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $01, $B4816E)   ;B4814E
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $02, $B48177)   ;B48155
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $04, $B48180)   ;B4815C
    %AICMD0x12_Jump($B48193)                                   ;B48163
    %AICMD0x41_ModifyVariable($7F1F1F, $FFE2)                  ;B48166
    %AICMD0x12_Jump($B48193)                                   ;B4816C
    %AICMD0x41_ModifyVariable($7F1F21, $FFE2)                  ;B4816F
    %AICMD0x12_Jump($B48193)                                   ;B48175
    %AICMD0x41_ModifyVariable($7F1F23, $FFE2)                  ;B48178
    %AICMD0x12_Jump($B48193)                                   ;B4817E
    %AICMD0x41_ModifyVariable($7F1F27, $FFE2)                  ;B48181
    %AICMD0x12_Jump($B48193)                                   ;B48187
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $03, $B481A5)   ;B4818A
    %AICMD0x12_Jump($B48146)                                   ;B48191
    %AICMD0x1A($00F8, $0108, $B381E0, $00)                     ;B48194
    %AICMD0x13($0001)                                          ;B4819C
    %AICMD0x1B($0242, $00)                                     ;B4819F
    %AICMD0x12_Jump($B481B4)                                   ;B481A3
    %AICMD0x1A($0128, $0098, $B3845C, $00)                     ;B481A6
    %AICMD0x13($0001)                                          ;B481AE
    %AICMD0x1B($02E9, $00)                                     ;B481B1
    %AICMD0x0C($00)                                            ;B481B5
    %AICMD0x0C($01)                                            ;B481B7
    %AICMD0x0C($02)                                            ;B481B9
    %AICMD0x0C($03)                                            ;B481BB
    %AICMD0x1F($81C2)                                          ;B481BD
    %AICMD0x12_Jump($B481BC)                                   ;B481C0
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $03, $B48205)   ;B481C3
    %AICMD0x45($7F1F25, $0000, $00C8, $B481EA)                 ;B481CA
    %AICMD0x45($7F1F25, $00C9, $012C, $B481F3)                 ;B481D4
    %AICMD0x45($7F1F25, $012D, $03E7, $B481FC)                 ;B481DE
    %AICMD0x12_Jump($B481BC)                                   ;B481E8
    %AICMD0x1C($02BD, $00)                                     ;B481EB
    %AICMD0x0B($04)                                            ;B481EF
    %AICMD0x12_Jump($B481BC)                                   ;B481F1
    %AICMD0x1C($02BE, $00)                                     ;B481F4
    %AICMD0x0B($04)                                            ;B481F8
    %AICMD0x12_Jump($B481BC)                                   ;B481FA
    %AICMD0x1C($0433, $00)                                     ;B481FD
    %AICMD0x0B($04)                                            ;B48201
    %AICMD0x12_Jump($B481BC)                                   ;B48203
    %AICMD0x1C($0434, $00)                                     ;B48206
    %AICMD0x0B($04)                                            ;B4820A
    %AICMD0x12_Jump($B481BC)                                   ;B4820C

DATA8_B4820E:
 
AI_B4820E:
    %AICMD0x4F()                                               ;B4820E
    %AICMD0x50()                                               ;B48210
    %AICMD0x23_OrWithIndexedValue($7F1F60, $09)                ;B48211
    %AICMD0x00_SetMusic($09, $B4)                              ;B48216
    %AICMD0x03_SetHour($07)                                    ;B48219
    %AICMD0x05_SetPosition($0080, $01B8)                       ;B4821B
    %AICMD0x07_SetPlayerDirection($01)                         ;B48220
    %AICMD0x09($01, $B48261)                                   ;B48222
    %AICMD0x09($02, $B48278)                                   ;B48226
    %AICMD0x09($03, $B48293)                                   ;B4822A
    %AICMD0x09($04, $B482AE)                                   ;B4822E
    %AICMD0x09($05, $B482C5)                                   ;B48232
    %AICMD0x09($06, $B482E0)                                   ;B48236
    %AICMD0x09($07, $B4833E)                                   ;B4823A
    %AICMD0x38()                                               ;B4823E
    %AICMD0x0C($00)                                            ;B4823F
    %AICMD0x0C($01)                                            ;B48241
    %AICMD0x0C($02)                                            ;B48243
    %AICMD0x0C($03)                                            ;B48245
    %AICMD0x0C($04)                                            ;B48247
    %AICMD0x0C($05)                                            ;B48249
    %AICMD0x0B($07)                                            ;B4824B
    %AICMD0x0C($06)                                            ;B4824D
    %AICMD0x39($02, $0010)                                     ;B4824F
    %AICMD0x07_SetPlayerDirection($03)                         ;B48253
    %AICMD0x0B($08)                                            ;B48255
    %AICMD0x13($00B4)                                          ;B48257
    %AICMD0x41_ModifyVariable($7F1F1F, $001E)                  ;B4825A
    %AICMD0x3C()                                               ;B48260
    %AICMD0x10_End()                                           ;B48261
    %AICMD0x1A($0080, $0090, $B38354, $00)                     ;B48262
    %AICMD0x1F($826F)                                          ;B4826A
    %AICMD0x12_Jump($B48269)                                   ;B4826D
    %AICMD0x1C($02BF, $00)                                     ;B48270
    %AICMD0x0B($00)                                            ;B48274
    %AICMD0x12_Jump($B48269)                                   ;B48276
    %AICMD0x1A($0038, $0118, $B38420, $01)                     ;B48279
    %AICMD0x1F($8286)                                          ;B48281
    %AICMD0x12_Jump($B48280)                                   ;B48284
    %AICMD0x1C($02C1, $00)                                     ;B48287
    %AICMD0x1B($02D4, $00)                                     ;B4828B
    %AICMD0x0B($01)                                            ;B4828F
    %AICMD0x12_Jump($B48280)                                   ;B48291
    %AICMD0x1A($0050, $0118, $B38384, $01)                     ;B48294
    %AICMD0x1F($82A1)                                          ;B4829C
    %AICMD0x12_Jump($B4829B)                                   ;B4829F
    %AICMD0x1B($02B3, $00)                                     ;B482A2
    %AICMD0x1C($02C2, $00)                                     ;B482A6
    %AICMD0x0B($02)                                            ;B482AA
    %AICMD0x12_Jump($B4829B)                                   ;B482AC
    %AICMD0x1A($0080, $01C8, $B38294, $01)                     ;B482AF
    %AICMD0x1F($82BC)                                          ;B482B7
    %AICMD0x12_Jump($B482B6)                                   ;B482BA
    %AICMD0x1C($037A, $00)                                     ;B482BD
    %AICMD0x0B($03)                                            ;B482C1
    %AICMD0x12_Jump($B482B6)                                   ;B482C3
    %AICMD0x1A($00B8, $0158, $B382AC, $01)                     ;B482C6
    %AICMD0x1F($82D3)                                          ;B482CE
    %AICMD0x12_Jump($B482CD)                                   ;B482D1
    %AICMD0x1B($0278, $00)                                     ;B482D4
    %AICMD0x1C($035F, $00)                                     ;B482D8
    %AICMD0x0B($04)                                            ;B482DC
    %AICMD0x12_Jump($B482CD)                                   ;B482DE
    %AICMD0x1A($00C8, $0118, $B3827C, $01)                     ;B482E1
    %AICMD0x1F($82EE)                                          ;B482E9
    %AICMD0x12_Jump($B482E8)                                   ;B482EC
    %AICMD0x1C($02C0, $00)                                     ;B482EF
    %AICMD0x1B($026B, $00)                                     ;B482F3
    %AICMD0x0B($05)                                            ;B482F7
    %AICMD0x12_Jump($B482E8)                                   ;B482F9
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $01, $B4831A)   ;B482FC
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $02, $B48323)   ;B48303
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $03, $B4832C)   ;B4830A
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $04, $B48335)   ;B48311
    %AICMD0x12_Jump($B48348)                                   ;B48318
    %AICMD0x41_ModifyVariable($7F1F21, $FFE2)                  ;B4831B
    %AICMD0x12_Jump($B48348)                                   ;B48321
    %AICMD0x41_ModifyVariable($7F1F23, $FFE2)                  ;B48324
    %AICMD0x12_Jump($B48348)                                   ;B4832A
    %AICMD0x41_ModifyVariable($7F1F25, $FFE2)                  ;B4832D
    %AICMD0x12_Jump($B48348)                                   ;B48333
    %AICMD0x41_ModifyVariable($7F1F27, $FFE2)                  ;B48336
    %AICMD0x12_Jump($B48348)                                   ;B4833C
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $00, $B48355)   ;B4833F
    %AICMD0x12_Jump($B482FB)                                   ;B48346
    %AICMD0x1A($00C1, $0088, $B38180, $01)                     ;B48349
    %AICMD0x0C($07)                                            ;B48351
    %AICMD0x12_Jump($B4835D)                                   ;B48353
    %AICMD0x1A($00C1, $0088, $B38180, $01)                     ;B48356
    %AICMD0x1F($8363)                                          ;B4835E
    %AICMD0x12_Jump($B4835D)                                   ;B48361
    %AICMD0x08()                                               ;B48364
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $00, $B483E3)   ;B48365
    %AICMD0x45($7F1F1F, $0000, $00C8, $B4838C)                 ;B4836C
    %AICMD0x45($7F1F1F, $00C9, $012C, $B483A9)                 ;B48376
    %AICMD0x45($7F1F1F, $012D, $03E7, $B483C6)                 ;B48380
    %AICMD0x12_Jump($B4835D)                                   ;B4838A
    %AICMD0x0B($06)                                            ;B4838D
    %AICMD0x0C($08)                                            ;B4838F
    %AICMD0x13($001E)                                          ;B48391
    %AICMD0x1B($0223, $01)                                     ;B48394
    %AICMD0x0D($01, $00, $10, $01)                             ;B48398
    %AICMD0x13($003C)                                          ;B4839D
    %AICMD0x1C($02C3, $00)                                     ;B483A0
    %AICMD0x13($00B4)                                          ;B483A4
    %AICMD0x12_Jump($B4835D)                                   ;B483A7
    %AICMD0x0B($06)                                            ;B483AA
    %AICMD0x0C($08)                                            ;B483AC
    %AICMD0x13($001E)                                          ;B483AE
    %AICMD0x1B($0223, $01)                                     ;B483B1
    %AICMD0x0D($01, $00, $10, $01)                             ;B483B5
    %AICMD0x13($003C)                                          ;B483BA
    %AICMD0x1C($02C4, $00)                                     ;B483BD
    %AICMD0x13($00B4)                                          ;B483C1
    %AICMD0x12_Jump($B4835D)                                   ;B483C4
    %AICMD0x0B($06)                                            ;B483C7
    %AICMD0x0C($08)                                            ;B483C9
    %AICMD0x13($001E)                                          ;B483CB
    %AICMD0x1B($0223, $01)                                     ;B483CE
    %AICMD0x0D($01, $00, $10, $01)                             ;B483D2
    %AICMD0x13($003C)                                          ;B483D7
    %AICMD0x1C($0435, $00)                                     ;B483DA
    %AICMD0x13($00B4)                                          ;B483DE
    %AICMD0x12_Jump($B4835D)                                   ;B483E1
    %AICMD0x0B($06)                                            ;B483E4
    %AICMD0x0C($08)                                            ;B483E6
    %AICMD0x13($001E)                                          ;B483E8
    %AICMD0x1B($02E7, $01)                                     ;B483EB
    %AICMD0x0D($01, $00, $10, $01)                             ;B483EF
    %AICMD0x13($003C)                                          ;B483F4
    %AICMD0x1C($0436, $00)                                     ;B483F7
    %AICMD0x13($00B4)                                          ;B483FB
    %AICMD0x12_Jump($B4835D)                                   ;B483FE

DATA8_B48400:
 
AI_B48400:
    %AICMD0x4F()                                               ;B48400
    %AICMD0x50()                                               ;B48402
    %AICMD0x23_OrWithIndexedValue($7F1F60, $09)                ;B48403
    %AICMD0x00_SetMusic($07, $B4)                              ;B48408
    %AICMD0x03_SetHour($12)                                    ;B4840B
    %AICMD0x05_SetPosition($0090, $01B8)                       ;B4840D
    %AICMD0x07_SetPlayerDirection($01)                         ;B48412
    %AICMD0x09($01, $B4844E)                                   ;B48414
    %AICMD0x09($02, $B48465)                                   ;B48418
    %AICMD0x09($03, $B4847C)                                   ;B4841C
    %AICMD0x09($04, $B48497)                                   ;B48420
    %AICMD0x09($05, $B48523)                                   ;B48424
    %AICMD0x09($06, $B484B2)                                   ;B48428
    %AICMD0x09($07, $B484C9)                                   ;B4842C
    %AICMD0x38()                                               ;B48430
    %AICMD0x0C($00)                                            ;B48431
    %AICMD0x0C($01)                                            ;B48433
    %AICMD0x0C($02)                                            ;B48435
    %AICMD0x0C($03)                                            ;B48437
    %AICMD0x0C($05)                                            ;B48439
    %AICMD0x0C($06)                                            ;B4843B
    %AICMD0x23_OrWithIndexedValue($7F1F74, $05)                ;B4843D
    %AICMD0x0C($04)                                            ;B48442
    %AICMD0x13($00B4)                                          ;B48444
    %AICMD0x41_ModifyVariable($7F1F27, $001E)                  ;B48447
    %AICMD0x3C()                                               ;B4844D
    %AICMD0x10_End()                                           ;B4844E
    %AICMD0x1A($0028, $0198, $B382DC, $00)                     ;B4844F
    %AICMD0x1F($845C)                                          ;B48457
    %AICMD0x12_Jump($B48456)                                   ;B4845A
    %AICMD0x1C($02C5, $00)                                     ;B4845D
    %AICMD0x0B($00)                                            ;B48461
    %AICMD0x12_Jump($B48456)                                   ;B48463
    %AICMD0x1A($0064, $0170, $B38348, $00)                     ;B48466
    %AICMD0x1F($8473)                                          ;B4846E
    %AICMD0x12_Jump($B4846D)                                   ;B48471
    %AICMD0x1C($02C6, $00)                                     ;B48474
    %AICMD0x0B($01)                                            ;B48478
    %AICMD0x12_Jump($B4846D)                                   ;B4847A
    %AICMD0x1A($00B4, $01A0, $B38318, $01)                     ;B4847D
    %AICMD0x1F($848A)                                          ;B48485
    %AICMD0x12_Jump($B48484)                                   ;B48488
    %AICMD0x1C($02C7, $00)                                     ;B4848B
    %AICMD0x1B($0298, $00)                                     ;B4848F
    %AICMD0x0B($02)                                            ;B48493
    %AICMD0x12_Jump($B48484)                                   ;B48495
    %AICMD0x1A($00B4, $0170, $B383FC, $00)                     ;B48498
    %AICMD0x1F($84A5)                                          ;B484A0
    %AICMD0x12_Jump($B4849F)                                   ;B484A3
    %AICMD0x1C($02C8, $00)                                     ;B484A6
    %AICMD0x1B($02CC, $00)                                     ;B484AA
    %AICMD0x0B($03)                                            ;B484AE
    %AICMD0x12_Jump($B4849F)                                   ;B484B0
    %AICMD0x1A($0088, $0148, $B38234, $00)                     ;B484B3
    %AICMD0x1F($84C0)                                          ;B484BB
    %AICMD0x12_Jump($B484BA)                                   ;B484BE
    %AICMD0x1C($0407, $00)                                     ;B484C1
    %AICMD0x0B($05)                                            ;B484C5
    %AICMD0x12_Jump($B484BA)                                   ;B484C7
    %AICMD0x1A($0090, $01C8, $B38234, $01)                     ;B484CA
    %AICMD0x1F($84D7)                                          ;B484D2
    %AICMD0x12_Jump($B484D1)                                   ;B484D5
    %AICMD0x1C($03D9, $00)                                     ;B484D8
    %AICMD0x0B($06)                                            ;B484DC
    %AICMD0x12_Jump($B484D1)                                   ;B484DE
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $00, $B484FF)   ;B484E1
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $01, $B48508)   ;B484E8
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $02, $B48511)   ;B484EF
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $03, $B4851A)   ;B484F6
    %AICMD0x12_Jump($B4852D)                                   ;B484FD
    %AICMD0x41_ModifyVariable($7F1F1F, $FFE2)                  ;B48500
    %AICMD0x12_Jump($B4852D)                                   ;B48506
    %AICMD0x41_ModifyVariable($7F1F21, $FFE2)                  ;B48509
    %AICMD0x12_Jump($B4852D)                                   ;B4850F
    %AICMD0x41_ModifyVariable($7F1F23, $FFE2)                  ;B48512
    %AICMD0x12_Jump($B4852D)                                   ;B48518
    %AICMD0x41_ModifyVariable($7F1F25, $FFE2)                  ;B4851B
    %AICMD0x12_Jump($B4852D)                                   ;B48521
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $04, $B4853F)   ;B48524
    %AICMD0x12_Jump($B484E0)                                   ;B4852B
    %AICMD0x1A($0038, $01C0, $B38204, $00)                     ;B4852E
    %AICMD0x22($18, $08, $01, $B38210, $08)                    ;B48536
    %AICMD0x12_Jump($B4854E)                                   ;B4853D
    %AICMD0x1A($0038, $01C0, $B3845C, $01)                     ;B48540
    %AICMD0x22($18, $08, $01, $B38474, $08)                    ;B48548
    %AICMD0x1F($8554)                                          ;B4854F
    %AICMD0x12_Jump($B4854E)                                   ;B48552
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F74, $05, $B48562)   ;B48555
    %AICMD0x1C($0151, $00)                                     ;B4855C
    %AICMD0x12_Jump($B4854E)                                   ;B48560
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $04, $B485B7)   ;B48563
    %AICMD0x45($7F1F27, $0000, $00C8, $B4858A)                 ;B4856A
    %AICMD0x45($7F1F27, $00C9, $012C, $B48599)                 ;B48574
    %AICMD0x45($7F1F27, $012D, $03E7, $B485A8)                 ;B4857E
    %AICMD0x12_Jump($B4854E)                                   ;B48588
    %AICMD0x1C($02C9, $00)                                     ;B4858B
    %AICMD0x32($00D4, $80, $0015)                              ;B4858F
    %AICMD0x0B($04)                                            ;B48595
    %AICMD0x12_Jump($B4854E)                                   ;B48597
    %AICMD0x1C($02CA, $00)                                     ;B4859A
    %AICMD0x32($00D4, $80, $0015)                              ;B4859E
    %AICMD0x0B($04)                                            ;B485A4
    %AICMD0x12_Jump($B4854E)                                   ;B485A6
    %AICMD0x1C($0437, $00)                                     ;B485A9
    %AICMD0x32($00D4, $80, $0015)                              ;B485AD
    %AICMD0x0B($04)                                            ;B485B3
    %AICMD0x12_Jump($B4854E)                                   ;B485B5
    %AICMD0x1C($0438, $00)                                     ;B485B8
    %AICMD0x32($00D4, $80, $0015)                              ;B485BC
    %AICMD0x0B($04)                                            ;B485C2
    %AICMD0x12_Jump($B4854E)                                   ;B485C4

DATA8_B485C6:
 
AI_B485C6:
    %AICMD0x4F()                                               ;B485C6
    %AICMD0x50()                                               ;B485C8
    %AICMD0x23_OrWithIndexedValue($7F1F60, $09)                ;B485C9
    %AICMD0x00_SetMusic($0E, $B4)                              ;B485CE
    %AICMD0x03_SetHour($12)                                    ;B485D1
    %AICMD0x05_SetPosition($0078, $01C8)                       ;B485D3
    %AICMD0x07_SetPlayerDirection($01)                         ;B485D8
    %AICMD0x08()                                               ;B485DA
    %AICMD0x09($01, $B48677)                                   ;B485DB
    %AICMD0x38()                                               ;B485DF
    %AICMD0x39($01, $00B0)                                     ;B485E0
    %AICMD0x13($003C)                                          ;B485E4
    %AICMD0x29($0000, $FFFF, $F0)                              ;B485E7
    %AICMD0x13($00F0)                                          ;B485ED
    %AICMD0x29($0000, $FFFF, $40)                              ;B485F0
    %AICMD0x13($0040)                                          ;B485F6
    %AICMD0x09($02, $B48623)                                   ;B485F9
    %AICMD0x0C($00)                                            ;B485FD
    %AICMD0x29($0000, $0001, $F0)                              ;B485FF
    %AICMD0x13($00F0)                                          ;B48605
    %AICMD0x29($0000, $0001, $40)                              ;B48608
    %AICMD0x13($0040)                                          ;B4860E
    %AICMD0x0B($01)                                            ;B48611
    %AICMD0x0C($02)                                            ;B48613
    %AICMD0x19($0006, $00)                                     ;B48615
    %AICMD0x13($00B4)                                          ;B48619
    %AICMD0x41_ModifyVariable($7F1F23, $001E)                  ;B4861C
    %AICMD0x3C()                                               ;B48622
    %AICMD0x10_End()                                           ;B48623
    %AICMD0x1A($0100, $FF80, $B3857C, $00)                     ;B48624
    %AICMD0x0D($FE, $01, $A0, $01)                             ;B4862C
    %AICMD0x0B($00)                                            ;B48631
    %AICMD0x37()                                               ;B48633
    %AICMD0x10_End()                                           ;B48634
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $00, $B48653)   ;B48635
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $01, $B4865C)   ;B4863C
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $03, $B48665)   ;B48643
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $04, $B4866E)   ;B4864A
    %AICMD0x12_Jump($B48681)                                   ;B48651
    %AICMD0x41_ModifyVariable($7F1F1F, $FFE2)                  ;B48654
    %AICMD0x12_Jump($B48681)                                   ;B4865A
    %AICMD0x41_ModifyVariable($7F1F21, $FFE2)                  ;B4865D
    %AICMD0x12_Jump($B48681)                                   ;B48663
    %AICMD0x41_ModifyVariable($7F1F25, $FFE2)                  ;B48666
    %AICMD0x12_Jump($B48681)                                   ;B4866C
    %AICMD0x41_ModifyVariable($7F1F27, $FFE2)                  ;B4866F
    %AICMD0x12_Jump($B48681)                                   ;B48675
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $02, $B486AD)   ;B48678
    %AICMD0x12_Jump($B48634)                                   ;B4867F
    %AICMD0x1A($0088, $0118, $B381C8, $01)                     ;B48682
    %AICMD0x0C($01)                                            ;B4868A
    %AICMD0x1B($0250, $00)                                     ;B4868C
    %AICMD0x45($7F1F23, $0000, $00C8, $B486C4)                 ;B48690
    %AICMD0x45($7F1F23, $00C9, $012C, $B486CD)                 ;B4869A
    %AICMD0x45($7F1F23, $012D, $03E7, $B486D6)                 ;B486A4
    %AICMD0x1A($0088, $0118, $B3845C, $01)                     ;B486AE
    %AICMD0x0C($01)                                            ;B486B6
    %AICMD0x1B($02E6, $00)                                     ;B486B8
    %AICMD0x12_Jump($B486DF)                                   ;B486BC
    %AICMD0x13($0001)                                          ;B486BF
    %AICMD0x12_Jump($B486BE)                                   ;B486C2
    %AICMD0x1C($02CB, $00)                                     ;B486C5
    %AICMD0x0B($02)                                            ;B486C9
    %AICMD0x12_Jump($B486BE)                                   ;B486CB
    %AICMD0x1C($02CC, $00)                                     ;B486CE
    %AICMD0x0B($02)                                            ;B486D2
    %AICMD0x12_Jump($B486BE)                                   ;B486D4
    %AICMD0x1C($0439, $00)                                     ;B486D7
    %AICMD0x0B($02)                                            ;B486DB
    %AICMD0x12_Jump($B486BE)                                   ;B486DD
    %AICMD0x1C($043A, $00)                                     ;B486E0
    %AICMD0x0B($02)                                            ;B486E4
    %AICMD0x12_Jump($B486BE)                                   ;B486E6

DATA8_B486E8:
 
AI_B486E8:
    %AICMD0x4F()                                               ;B486E8
    %AICMD0x50()                                               ;B486EA
    %AICMD0x23_OrWithIndexedValue($7F1F60, $09)                ;B486EB
    %AICMD0x00_SetMusic($0E, $B4)                              ;B486F0
    %AICMD0x03_SetHour($12)                                    ;B486F3
    %AICMD0x05_SetPosition($0018, $0058)                       ;B486F5
    %AICMD0x07_SetPlayerDirection($02)                         ;B486FA
    %AICMD0x08()                                               ;B486FC
    %AICMD0x09($01, $B4875B)                                   ;B486FD
    %AICMD0x38()                                               ;B48701
    %AICMD0x39($02, $0020)                                     ;B48702
    %AICMD0x13($0078)                                          ;B48706
    %AICMD0x11()                                               ;B48709
    %AICMD0x0B($00)                                            ;B4870A
    %AICMD0x0C($01)                                            ;B4870C
    %AICMD0x13($00B4)                                          ;B4870E
    %AICMD0x41_ModifyVariable($7F1F21, $001E)                  ;B48711
    %AICMD0x3C()                                               ;B48717
    %AICMD0x10_End()                                           ;B48718
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $00, $B48737)   ;B48719
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $02, $B48740)   ;B48720
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $03, $B48749)   ;B48727
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $04, $B48752)   ;B4872E
    %AICMD0x12_Jump($B4875E)                                   ;B48735
    %AICMD0x41_ModifyVariable($7F1F1F, $FFE2)                  ;B48738
    %AICMD0x12_Jump($B4875E)                                   ;B4873E
    %AICMD0x41_ModifyVariable($7F1F23, $FFE2)                  ;B48741
    %AICMD0x12_Jump($B4875E)                                   ;B48747
    %AICMD0x41_ModifyVariable($7F1F25, $FFE2)                  ;B4874A
    %AICMD0x12_Jump($B4875E)                                   ;B48750
    %AICMD0x41_ModifyVariable($7F1F27, $FFE2)                  ;B48753
    %AICMD0x12_Jump($B4875E)                                   ;B48759
    %AICMD0x12_Jump($B48718)                                   ;B4875C
    %AICMD0x1A($00A8, $0098, $B381BC, $01)                     ;B4875F
    %AICMD0x1F($876C)                                          ;B48767
    %AICMD0x12_Jump($B48766)                                   ;B4876A
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $01, $B487AF)   ;B4876D
    %AICMD0x45($7F1F21, $0000, $00C8, $B48794)                 ;B48774
    %AICMD0x45($7F1F21, $00C9, $012C, $B4879D)                 ;B4877E
    %AICMD0x45($7F1F21, $012D, $03E7, $B487A6)                 ;B48788
    %AICMD0x12_Jump($B48766)                                   ;B48792
    %AICMD0x1C($02CD, $00)                                     ;B48795
    %AICMD0x0B($01)                                            ;B48799
    %AICMD0x12_Jump($B48766)                                   ;B4879B
    %AICMD0x1C($02A9, $00)                                     ;B4879E
    %AICMD0x0B($01)                                            ;B487A2
    %AICMD0x12_Jump($B48766)                                   ;B487A4
    %AICMD0x1C($043B, $00)                                     ;B487A7
    %AICMD0x0B($01)                                            ;B487AB
    %AICMD0x12_Jump($B48766)                                   ;B487AD
    %AICMD0x1C($043C, $00)                                     ;B487B0
    %AICMD0x0B($01)                                            ;B487B4
    %AICMD0x12_Jump($B48766)                                   ;B487B6

pScripting_B487B8:
    dw DATA8_B487D8                                            ;B487B8|        |B487D8;
    dw pScripting_B48818                                       ;B487BA|        |B48818;
    dw pScripting_B48818                                       ;B487BC|        |B48818;
    dw pScripting_B48818                                       ;B487BE|        |B48818;
    dw pScripting_B48818                                       ;B487C0|        |B48818;
    dw pScripting_B48818                                       ;B487C2|        |B48818;
    dw pScripting_B48818                                       ;B487C4|        |B48818;
    dw pScripting_B48818                                       ;B487C6|        |B48818;
    dw pScripting_B48818                                       ;B487C8|        |B48818;
    dw pScripting_B48818                                       ;B487CA|        |B48818;
    dw pScripting_B48818                                       ;B487CC|        |B48818;
    dw pScripting_B48818                                       ;B487CE|        |B48818;
    dw pScripting_B48818                                       ;B487D0|        |B48818;
    dw pScripting_B48818                                       ;B487D2|        |B48818;
    dw pScripting_B48818                                       ;B487D4|        |B48818;
    dw pScripting_B48818                                       ;B487D6|        |B48818;
 
DATA8_B487D8:
 
    %AICMD0x08()                                               ;B487D8
    %AICMD0x13($003C)                                          ;B487D9
    %AICMD0x09($07, $B487E5)                                   ;B487DC
    %AICMD0x09($15, $B487F8)                                   ;B487E0
    %AICMD0x10_End()                                           ;B487E4
    %AICMD0x1A($02B0, $0170, $B38564, $00)                     ;B487E5
    %AICMD0x1C($0335, $00)                                     ;B487ED
    %AICMD0x0B($00)                                            ;B487F1
    %AICMD0x13($00B4)                                          ;B487F3
    %AICMD0x37()                                               ;B487F6
    %AICMD0x10_End()                                           ;B487F7
    %AICMD0x0C($00)                                            ;B487F8
    %AICMD0x1A($02A8, $0178, $B38720, $00)                     ;B487FA
    %AICMD0x0D($00, $01, $0C, $01)                             ;B48802
    %AICMD0x0D($00, $02, $12, $01)                             ;B48807
    %AICMD0x13($00B4)                                          ;B4880C
    %AICMD0x1B($040D, $00)                                     ;B4880F
    %AICMD0x11()                                               ;B48813
    %AICMD0x4A()                                               ;B48814
    %AICMD0x12_Jump($B48814)                                   ;B48815

pScripting_B48818:
    dw DATA8_B48838                                            ;B48818|        |B48838;
    dw pScripting_B488A0                                       ;B4881A|        |B488A0;
    dw pScripting_B488A0                                       ;B4881C|        |B488A0;
    dw pScripting_B488A0                                       ;B4881E|        |B488A0;
    dw pScripting_B488A0                                       ;B48820|        |B488A0;
    dw pScripting_B488A0                                       ;B48822|        |B488A0;
    dw pScripting_B488A0                                       ;B48824|        |B488A0;
    dw pScripting_B488A0                                       ;B48826|        |B488A0;
    dw pScripting_B488A0                                       ;B48828|        |B488A0;
    dw pScripting_B488A0                                       ;B4882A|        |B488A0;
    dw pScripting_B488A0                                       ;B4882C|        |B488A0;
    dw pScripting_B488A0                                       ;B4882E|        |B488A0;
    dw pScripting_B488A0                                       ;B48830|        |B488A0;
    dw pScripting_B488A0                                       ;B48832|        |B488A0;
    dw pScripting_B488A0                                       ;B48834|        |B488A0;
    dw pScripting_B488A0                                       ;B48836|        |B488A0;
 
DATA8_B48838:
 
    %AICMD0x50()                                               ;B48838
    %AICMD0x09($01, $B4886C)                                   ;B48839
    %AICMD0x38()                                               ;B4883D
    %AICMD0x39($00, $0050)                                     ;B4883E
    %AICMD0x07_SetPlayerDirection($03)                         ;B48842
    %AICMD0x1D($0148, $00)                                     ;B48844
    %AICMD0x20($00, $8850)                                     ;B48848
    %AICMD0x20($01, $8862)                                     ;B4884C
    %AICMD0x0F($01)                                            ;B48850
    %AICMD0x09($02, $B4888C)                                   ;B48852
    %AICMD0x0A($01)                                            ;B48856
    %AICMD0x1C($014A, $00)                                     ;B48858
    %AICMD0x0B($00)                                            ;B4885C
    %AICMD0x0C($01)                                            ;B4885E
    %AICMD0x11()                                               ;B48860
    %AICMD0x10_End()                                           ;B48861
    %AICMD0x1C($014C, $00)                                     ;B48862
    %AICMD0x0B($00)                                            ;B48866
    %AICMD0x0C($01)                                            ;B48868
    %AICMD0x11()                                               ;B4886A
    %AICMD0x10_End()                                           ;B4886B
    %AICMD0x1A($0068, $01A8, $B383A8, $02)                     ;B4886C
    %AICMD0x0C($00)                                            ;B48874
    %AICMD0x1B($02BB, $00)                                     ;B48876
    %AICMD0x0D($00, $01, $10, $01)                             ;B4887A
    %AICMD0x1B($02BF, $00)                                     ;B4887F
    %AICMD0x0D($FF, $00, $A0, $01)                             ;B48883
    %AICMD0x0B($01)                                            ;B48888
    %AICMD0x37()                                               ;B4888A
    %AICMD0x10_End()                                           ;B4888B
    %AICMD0x1A($0078, $01A8, $B38144, $00)                     ;B4888C
    %AICMD0x0C($00)                                            ;B48894
    %AICMD0x13($001E)                                          ;B48896
    %AICMD0x0D($FF, $00, $A0, $01)                             ;B48899
    %AICMD0x37()                                               ;B4889E
    %AICMD0x10_End()                                           ;B4889F

pScripting_B488A0:
    dw DATA8_B488C0                                            ;B488A0|        |B488C0;
    dw pScripting_B4892A                                       ;B488A2|        |B4892A;
    dw pScripting_B4892A                                       ;B488A4|        |B4892A;
    dw pScripting_B4892A                                       ;B488A6|        |B4892A;
    dw pScripting_B4892A                                       ;B488A8|        |B4892A;
    dw pScripting_B4892A                                       ;B488AA|        |B4892A;
    dw pScripting_B4892A                                       ;B488AC|        |B4892A;
    dw pScripting_B4892A                                       ;B488AE|        |B4892A;
    dw pScripting_B4892A                                       ;B488B0|        |B4892A;
    dw pScripting_B4892A                                       ;B488B2|        |B4892A;
    dw pScripting_B4892A                                       ;B488B4|        |B4892A;
    dw pScripting_B4892A                                       ;B488B6|        |B4892A;
    dw pScripting_B4892A                                       ;B488B8|        |B4892A;
    dw pScripting_B4892A                                       ;B488BA|        |B4892A;
    dw pScripting_B4892A                                       ;B488BC|        |B4892A;
    dw pScripting_B4892A                                       ;B488BE|        |B4892A;
 
DATA8_B488C0:
 
    %AICMD0x50()                                               ;B488C0
    %AICMD0x00_SetMusic($0A, $B4)                              ;B488C1
    %AICMD0x08()                                               ;B488C4
    %AICMD0x2A($0041)                                          ;B488C5
    %AICMD0x13($00B4)                                          ;B488C8
    %AICMD0x09($01, $B488D6)                                   ;B488CB
    %AICMD0x0C($00)                                            ;B488CF
    %AICMD0x09($10, $B48919)                                   ;B488D1
    %AICMD0x10_End()                                           ;B488D5
    %AICMD0x1A($0088, $00F8, $B3851C, $00)                     ;B488D6
    %AICMD0x13($00B4)                                          ;B488DE
    %AICMD0x0D($00, $FF, $10, $01)                             ;B488E1
    %AICMD0x0D($01, $01, $10, $01)                             ;B488E6
    %AICMD0x0D($00, $01, $10, $01)                             ;B488EB
    %AICMD0x0D($FF, $00, $10, $01)                             ;B488F0
    %AICMD0x1C($0339, $01)                                     ;B488F5
    %AICMD0x0B($00)                                            ;B488F9
    %AICMD0x13($0078)                                          ;B488FB
    %AICMD0x1C($033A, $01)                                     ;B488FE
    %AICMD0x13($001E)                                          ;B48902
    %AICMD0x0D($00, $FF, $10, $02)                             ;B48905
    %AICMD0x0D($00, $FF, $18, $03)                             ;B4890A
    %AICMD0x1B($0318, $00)                                     ;B4890F
    %AICMD0x13($00B4)                                          ;B48913
    %AICMD0x37()                                               ;B48916
    %AICMD0x11()                                               ;B48917
    %AICMD0x10_End()                                           ;B48918
    %AICMD0x1A($0088, $0120, $B38720, $00)                     ;B48919
    %AICMD0x0D($00, $01, $50, $02)                             ;B48921
    %AICMD0x4A()                                               ;B48926
    %AICMD0x12_Jump($B48926)                                   ;B48927

pScripting_B4892A:
    dw DATA8_B4894A                                            ;B4892A|        |B4894A;
    dw pScripting_B489D2                                       ;B4892C|        |B489D2;
    dw pScripting_B489D2                                       ;B4892E|        |B489D2;
    dw pScripting_B489D2                                       ;B48930|        |B489D2;
    dw pScripting_B489D2                                       ;B48932|        |B489D2;
    dw pScripting_B489D2                                       ;B48934|        |B489D2;
    dw pScripting_B489D2                                       ;B48936|        |B489D2;
    dw pScripting_B489D2                                       ;B48938|        |B489D2;
    dw pScripting_B489D2                                       ;B4893A|        |B489D2;
    dw pScripting_B489D2                                       ;B4893C|        |B489D2;
    dw pScripting_B489D2                                       ;B4893E|        |B489D2;
    dw pScripting_B489D2                                       ;B48940|        |B489D2;
    dw pScripting_B489D2                                       ;B48942|        |B489D2;
    dw pScripting_B489D2                                       ;B48944|        |B489D2;
    dw pScripting_B489D2                                       ;B48946|        |B489D2;
    dw pScripting_B489D2                                       ;B48948|        |B489D2;
 
DATA8_B4894A:
 
    %AICMD0x50()                                               ;B4894A
    %AICMD0x08()                                               ;B4894B
    %AICMD0x09($01, $B4895D)                                   ;B4894C
    %AICMD0x38()                                               ;B48950
    %AICMD0x39($00, $0050)                                     ;B48951
    %AICMD0x07_SetPlayerDirection($03)                         ;B48955
    %AICMD0x0B($00)                                            ;B48957
    %AICMD0x0C($01)                                            ;B48959
    %AICMD0x11()                                               ;B4895B
    %AICMD0x10_End()                                           ;B4895C
    %AICMD0x1A($0078, $01A8, $B383C0, $02)                     ;B4895D
    %AICMD0x0C($00)                                            ;B48965
    %AICMD0x1D($014D, $00)                                     ;B48967
    %AICMD0x20($00, $8973)                                     ;B4896B
    %AICMD0x20($01, $89B5)                                     ;B4896F
    %AICMD0x1B($02BD, $00)                                     ;B48973
    %AICMD0x0D($00, $FF, $30, $01)                             ;B48977
    %AICMD0x1B($02C3, $01)                                     ;B4897C
    %AICMD0x0D($01, $00, $A0, $01)                             ;B48980
    %AICMD0x1B($02C0, $00)                                     ;B48985
    %AICMD0x13($00B4)                                          ;B48989
    %AICMD0x1B($02C3, $00)                                     ;B4898C
    %AICMD0x0D($FF, $00, $A0, $01)                             ;B48990
    %AICMD0x1B($02C1, $00)                                     ;B48995
    %AICMD0x0D($00, $01, $30, $01)                             ;B48999
    %AICMD0x1B($02C2, $01)                                     ;B4899E
    %AICMD0x1C($014E, $00)                                     ;B489A2
    %AICMD0x42($7F1F04, $FFF830)                               ;B489A6
    %AICMD0x23_OrWithIndexedValue($7F1F68, $0B)                ;B489AD
    %AICMD0x12_Jump($B489BC)                                   ;B489B2
    %AICMD0x1C($014F, $00)                                     ;B489B5
    %AICMD0x12_Jump($B489BC)                                   ;B489B9
    %AICMD0x1B($02C1, $00)                                     ;B489BC
    %AICMD0x0D($00, $01, $10, $01)                             ;B489C0
    %AICMD0x1B($02C3, $00)                                     ;B489C5
    %AICMD0x0D($FF, $00, $90, $01)                             ;B489C9
    %AICMD0x0B($01)                                            ;B489CE
    %AICMD0x37()                                               ;B489D0
    %AICMD0x10_End()                                           ;B489D1

pScripting_B489D2:
    dw DATA8_B489F2                                            ;B489D2|        |B489F2;
    dw DATA8_B48AAB                                            ;B489D4|        |B48AAB;
    dw DATA8_B48B00                                            ;B489D6|        |B48B00;
    dw DATA8_B48B9B                                            ;B489D8|        |B48B9B;
    dw DATA8_B48BDE                                            ;B489DA|        |B48BDE;
    dw pScripting_B48C25                                       ;B489DC|        |B48C25;
    dw pScripting_B48C25                                       ;B489DE|        |B48C25;
    dw pScripting_B48C25                                       ;B489E0|        |B48C25;
    dw pScripting_B48C25                                       ;B489E2|        |B48C25;
    dw pScripting_B48C25                                       ;B489E4|        |B48C25;
    dw pScripting_B48C25                                       ;B489E6|        |B48C25;
    dw pScripting_B48C25                                       ;B489E8|        |B48C25;
    dw pScripting_B48C25                                       ;B489EA|        |B48C25;
    dw pScripting_B48C25                                       ;B489EC|        |B48C25;
    dw pScripting_B48C25                                       ;B489EE|        |B48C25;
    dw pScripting_B48C25                                       ;B489F0|        |B48C25;
 
DATA8_B489F2:
 
    %AICMD0x50()                                               ;B489F2
    %AICMD0x01_UnfreezeTime()                                  ;B489F3
    %AICMD0x03_SetHour($07)                                    ;B489F4
    %AICMD0x05_SetPosition($0088, $0158)                       ;B489F6
    %AICMD0x07_SetPlayerDirection($00)                         ;B489FB
    %AICMD0x08()                                               ;B489FD
    %AICMD0x09($01, $B48A1B)                                   ;B489FE
    %AICMD0x38()                                               ;B48A02
    %AICMD0x39($00, $0050)                                     ;B48A03
    %AICMD0x07_SetPlayerDirection($03)                         ;B48A07
    %AICMD0x0B($00)                                            ;B48A09
    %AICMD0x0C($01)                                            ;B48A0B
    %AICMD0x0F($01)                                            ;B48A0D
    %AICMD0x09($02, $B48A8B)                                   ;B48A0F
    %AICMD0x0A($01)                                            ;B48A13
    %AICMD0x0B($02)                                            ;B48A15
    %AICMD0x0C($04)                                            ;B48A17
    %AICMD0x11()                                               ;B48A19
    %AICMD0x10_End()                                           ;B48A1A
    %AICMD0x1A($FFF0, $01A8, $B383B4, $02)                     ;B48A1B
    %AICMD0x0C($00)                                            ;B48A23
    %AICMD0x0D($01, $00, $60, $01)                             ;B48A25
    %AICMD0x1D($0149, $00)                                     ;B48A2A
    %AICMD0x20($00, $8A36)                                     ;B48A2E
    %AICMD0x20($01, $8A61)                                     ;B48A32
    %AICMD0x0B($01)                                            ;B48A36
    %AICMD0x0C($02)                                            ;B48A38
    %AICMD0x1B($02BB, $00)                                     ;B48A3A
    %AICMD0x0D($00, $01, $20, $01)                             ;B48A3E
    %AICMD0x1B($02BF, $00)                                     ;B48A43
    %AICMD0x0D($FF, $00, $20, $01)                             ;B48A47
    %AICMD0x1B($02BB, $00)                                     ;B48A4C
    %AICMD0x1C($014A, $00)                                     ;B48A50
    %AICMD0x23_OrWithIndexedValue($7F1F64, $06)                ;B48A54
    %AICMD0x23_OrWithIndexedValue($7F1F64, $07)                ;B48A59
    %AICMD0x12_Jump($B48A68)                                   ;B48A5E
    %AICMD0x1C($014C, $00)                                     ;B48A61
    %AICMD0x12_Jump($B48A75)                                   ;B48A65
    %AICMD0x1B($02BF, $00)                                     ;B48A68
    %AICMD0x0D($FF, $00, $40, $01)                             ;B48A6C
    %AICMD0x0B($03)                                            ;B48A71
    %AICMD0x37()                                               ;B48A73
    %AICMD0x10_End()                                           ;B48A74
    %AICMD0x1B($02BB, $00)                                     ;B48A75
    %AICMD0x0D($00, $01, $20, $01)                             ;B48A79
    %AICMD0x1B($02BF, $00)                                     ;B48A7E
    %AICMD0x0D($FF, $00, $A0, $01)                             ;B48A82
    %AICMD0x0B($04)                                            ;B48A87
    %AICMD0x37()                                               ;B48A89
    %AICMD0x10_End()                                           ;B48A8A
    %AICMD0x1A($0048, $01E8, $B380FC, $03)                     ;B48A8B
    %AICMD0x0C($03)                                            ;B48A93
    %AICMD0x1B($01A7, $00)                                     ;B48A95
    %AICMD0x0D($00, $FF, $10, $01)                             ;B48A99
    %AICMD0x1B($018B, $00)                                     ;B48A9E
    %AICMD0x0D($FF, $00, $40, $01)                             ;B48AA2
    %AICMD0x0B($04)                                            ;B48AA7
    %AICMD0x37()                                               ;B48AA9
    %AICMD0x10_End()                                           ;B48AAA

DATA8_B48AAB:
 
AI_B48AAB:
    %AICMD0x4F()                                               ;B48AAB
    %AICMD0x50()                                               ;B48AAD
    %AICMD0x23_OrWithIndexedValue($7F1F60, $09)                ;B48AAE
    %AICMD0x00_SetMusic($0A, $B4)                              ;B48AB3
    %AICMD0x05_SetPosition($0080, $01C8)                       ;B48AB6
    %AICMD0x07_SetPlayerDirection($01)                         ;B48ABB
    %AICMD0x08()                                               ;B48ABD
    %AICMD0x02_FreezeTime()                                    ;B48ABE
    %AICMD0x03_SetHour($07)                                    ;B48ABF
    %AICMD0x09($01, $B48AD0)                                   ;B48AC1
    %AICMD0x19($00E8, $00)                                     ;B48AC5
    %AICMD0x06_SetDestination($3B)                             ;B48AC9
    %AICMD0x38()                                               ;B48ACB
    %AICMD0x0C($00)                                            ;B48ACC
    %AICMD0x3D($2C)                                            ;B48ACE
    %AICMD0x10_End()                                           ;B48AD0
    %AICMD0x1A($0080, $01C8, $B380E4, $01)                     ;B48AD1
    %AICMD0x0D($00, $FF, $40, $01)                             ;B48AD9
    %AICMD0x29($0000, $FFFF, $40)                              ;B48ADE
    %AICMD0x0D($00, $FF, $50, $01)                             ;B48AE4
    %AICMD0x1B($0006, $00)                                     ;B48AE9
    %AICMD0x13($003C)                                          ;B48AED
    %AICMD0x1B($0063, $00)                                     ;B48AF0
    %AICMD0x0D($00, $FF, $90, $02)                             ;B48AF4
    %AICMD0x0B($00)                                            ;B48AF9
    %AICMD0x13($0001)                                          ;B48AFB
    %AICMD0x12_Jump($B48AFA)                                   ;B48AFE

DATA8_B48B00:
 
AI_B48B00:
    %AICMD0x4F()                                               ;B48B00
    %AICMD0x50()                                               ;B48B02
    %AICMD0x23_OrWithIndexedValue($7F1F60, $09)                ;B48B03
    %AICMD0x03_SetHour($07)                                    ;B48B08
    %AICMD0x05_SetPosition($0088, $0278)                       ;B48B0A
    %AICMD0x07_SetPlayerDirection($01)                         ;B48B0F
    %AICMD0x09($01, $B48B23)                                   ;B48B11
    %AICMD0x28($1F68, $7F, $09)                                ;B48B15
    %AICMD0x23_OrWithIndexedValue($7F1F60, $0A)                ;B48B1A
    %AICMD0x06_SetDestination($2C)                             ;B48B1F
    %AICMD0x38()                                               ;B48B21
    %AICMD0x11()                                               ;B48B22
    %AICMD0x10_End()                                           ;B48B23
    %AICMD0x1A($0088, $00CC, $B38624, $00)                     ;B48B24
    %AICMD0x1F($8B37)                                          ;B48B2C
    %AICMD0x12_Jump($B48B2B)                                   ;B48B2F
    %AICMD0x1F($8B88)                                          ;B48B32
    %AICMD0x12_Jump($B48B31)                                   ;B48B35
    %AICMD0x1D($0336, $00)                                     ;B48B38
    %AICMD0x20($01, $8B7A)                                     ;B48B3C
    %AICMD0x08()                                               ;B48B40
    %AICMD0x1B($021B, $00)                                     ;B48B41
    %AICMD0x09($02, $B48B8F)                                   ;B48B45
    %AICMD0x0D($FF, $FF, $24, $02)                             ;B48B49
    %AICMD0x13($001E)                                          ;B48B4E
    %AICMD0x1B($021C, $00)                                     ;B48B51
    %AICMD0x13($0078)                                          ;B48B55
    %AICMD0x1C($0337, $00)                                     ;B48B58
    %AICMD0x0B($00)                                            ;B48B5C
    %AICMD0x2A($0043)                                          ;B48B5E
    %AICMD0x4B($C3, $0040, $0080)                              ;B48B61
    %AICMD0x3E($23)                                            ;B48B67
    %AICMD0x13($003C)                                          ;B48B69
    %AICMD0x32($00D4, $80, $0000)                              ;B48B6C
    %AICMD0x28($00D2, $80, $01)                                ;B48B72
    %AICMD0x11()                                               ;B48B77
    %AICMD0x12_Jump($B48B31)                                   ;B48B78
    %AICMD0x2A($0043)                                          ;B48B7B
    %AICMD0x4B($C3, $0040, $0080)                              ;B48B7E
    %AICMD0x23_OrWithIndexedValue($7F1F5C, $0C)                ;B48B84
    %AICMD0x1C($0338, $00)                                     ;B48B89
    %AICMD0x12_Jump($B48B31)                                   ;B48B8D
    %AICMD0x1A($0088, $00C8, $B38618, $00)                     ;B48B90
    %AICMD0x0C($00)                                            ;B48B98
    %AICMD0x37()                                               ;B48B9A
    %AICMD0x10_End()                                           ;B48B9B

DATA8_B48B9B:
 
AI_B48B9B:
    %AICMD0x4F()                                               ;B48B9B
    %AICMD0x50()                                               ;B48B9D
    %AICMD0x23_OrWithIndexedValue($7F1F60, $09)                ;B48B9E
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F5C, $0C, $B48BDE)   ;B48BA3
    %AICMD0x08()                                               ;B48BAA
    %AICMD0x07_SetPlayerDirection($03)                         ;B48BAB
    %AICMD0x09($01, $B48BC2)                                   ;B48BAD
    %AICMD0x09($02, $B48BD0)                                   ;B48BB1
    %AICMD0x38()                                               ;B48BB5
    %AICMD0x1C($0360, $00)                                     ;B48BB6
    %AICMD0x42($7F1F04, $0003E8)                               ;B48BBA
    %AICMD0x3C()                                               ;B48BC1
    %AICMD0x10_End()                                           ;B48BC2
    %AICMD0x1A($0248, $0168, $B3839C, $00)                     ;B48BC3
    %AICMD0x13($0001)                                          ;B48BCB
    %AICMD0x12_Jump($B48BCA)                                   ;B48BCE
    %AICMD0x1A($0258, $0168, $B38618, $00)                     ;B48BD1
    %AICMD0x13($0001)                                          ;B48BD9
    %AICMD0x12_Jump($B48BD8)                                   ;B48BDC

DATA8_B48BDE:
 
AI_B48BDE:
    %AICMD0x4F()                                               ;B48BDE
    %AICMD0x50()                                               ;B48BE0
    %AICMD0x23_OrWithIndexedValue($7F1F60, $09)                ;B48BE1
    %AICMD0x05_SetPosition($0088, $01C8)                       ;B48BE6
    %AICMD0x08()                                               ;B48BEB
    %AICMD0x15($7F1F19, $00, $B48C07)                          ;B48BEC
    %AICMD0x15($7F1F19, $01, $B48C0C)                          ;B48BF3
    %AICMD0x15($7F1F19, $02, $B48C11)                          ;B48BFA
    %AICMD0x15($7F1F19, $03, $B48C16)                          ;B48C01
    %AICMD0x06_SetDestination($00)                             ;B48C08
    %AICMD0x12_Jump($B48C1B)                                   ;B48C0A
    %AICMD0x06_SetDestination($01)                             ;B48C0D
    %AICMD0x12_Jump($B48C1B)                                   ;B48C0F
    %AICMD0x06_SetDestination($02)                             ;B48C12
    %AICMD0x12_Jump($B48C1B)                                   ;B48C14
    %AICMD0x06_SetDestination($03)                             ;B48C17
    %AICMD0x12_Jump($B48C1B)                                   ;B48C19
    %AICMD0x38()                                               ;B48C1C
    %AICMD0x19($004D, $00)                                     ;B48C1D
    %AICMD0x13($0078)                                          ;B48C21
    %AICMD0x3C()                                               ;B48C24
    %AICMD0x10_End()                                           ;B48C25

pScripting_B48C25:
    dw DATA8_B48C45                                            ;B48C25|        |B48C45;
    dw pScripting_B48D38                                       ;B48C27|        |B48D38;
    dw pScripting_B48D38                                       ;B48C29|        |B48D38;
    dw pScripting_B48D38                                       ;B48C2B|        |B48D38;
    dw pScripting_B48D38                                       ;B48C2D|        |B48D38;
    dw pScripting_B48D38                                       ;B48C2F|        |B48D38;
    dw pScripting_B48D38                                       ;B48C31|        |B48D38;
    dw pScripting_B48D38                                       ;B48C33|        |B48D38;
    dw pScripting_B48D38                                       ;B48C35|        |B48D38;
    dw pScripting_B48D38                                       ;B48C37|        |B48D38;
    dw pScripting_B48D38                                       ;B48C39|        |B48D38;
    dw pScripting_B48D38                                       ;B48C3B|        |B48D38;
    dw pScripting_B48D38                                       ;B48C3D|        |B48D38;
    dw pScripting_B48D38                                       ;B48C3F|        |B48D38;
    dw pScripting_B48D38                                       ;B48C41|        |B48D38;
    dw pScripting_B48D38                                       ;B48C43|        |B48D38;
 
DATA8_B48C45:
 
    %AICMD0x05_SetPosition($00B8, $0168)                       ;B48C45
    %AICMD0x07_SetPlayerDirection($00)                         ;B48C4A
    %AICMD0x08()                                               ;B48C4C
    %AICMD0x09($01, $B48C67)                                   ;B48C4D
    %AICMD0x09($02, $B48CF6)                                   ;B48C51
    %AICMD0x09($03, $B48D1F)                                   ;B48C55
    %AICMD0x38()                                               ;B48C59
    %AICMD0x11()                                               ;B48C5A
    %AICMD0x0C($00)                                            ;B48C5B
    %AICMD0x08()                                               ;B48C5D
    %AICMD0x0C($01)                                            ;B48C5E
    %AICMD0x11()                                               ;B48C60
    %AICMD0x13($0001)                                          ;B48C61
    %AICMD0x12_Jump($B48C61)                                   ;B48C64
    %AICMD0x1A($0058, $0178, $B384D4, $02)                     ;B48C67
    %AICMD0x1F($8C7B)                                          ;B48C6F
    %AICMD0x12_Jump($B48C6F)                                   ;B48C72
    %AICMD0x1F($8CDD)                                          ;B48C75
    %AICMD0x12_Jump($B48C75)                                   ;B48C78
    %AICMD0x23_OrWithIndexedValue($7F1F68, $0D)                ;B48C7B
    %AICMD0x1D($0327, $00)                                     ;B48C80
    %AICMD0x20($00, $8C8F)                                     ;B48C84
    %AICMD0x20($01, $8CC9)                                     ;B48C88
    %AICMD0x12_Jump($B48CE4)                                   ;B48C8C
    %AICMD0x1C($0328, $00)                                     ;B48C8F
    %AICMD0x15($800921, $01, $B48CA4)                          ;B48C93
    %AICMD0x15($800923, $01, $B48CAC)                          ;B48C9A
    %AICMD0x12_Jump($B48CB4)                                   ;B48CA1
    %AICMD0x47($800921, $00)                                   ;B48CA4
    %AICMD0x12_Jump($B48CB4)                                   ;B48CA9
    %AICMD0x47($800923, $00)                                   ;B48CAC
    %AICMD0x12_Jump($B48CB4)                                   ;B48CB1
    %AICMD0x28($1F00, $7F, $00)                                ;B48CB4
    %AICMD0x23_OrWithIndexedValue($7F1F6E, $0F)                ;B48CB9
    %AICMD0x41_ModifyVariable($7F1F33, $0014)                  ;B48CBE
    %AICMD0x0B($00)                                            ;B48CC4
    %AICMD0x12_Jump($B48CE4)                                   ;B48CC6
    %AICMD0x1C($0329, $00)                                     ;B48CC9
    %AICMD0x23_OrWithIndexedValue($7F1F6A, $00)                ;B48CCD
    %AICMD0x41_ModifyVariable($7F1F33, $FFF6)                  ;B48CD2
    %AICMD0x0B($00)                                            ;B48CD8
    %AICMD0x12_Jump($B48CE4)                                   ;B48CDA
    %AICMD0x1C($032A, $00)                                     ;B48CDD
    %AICMD0x12_Jump($B48C75)                                   ;B48CE1
    %AICMD0x1B($030E, $00)                                     ;B48CE4
    %AICMD0x0D($FF, $00, $30, $01)                             ;B48CE8
    %AICMD0x1B($030E, $01)                                     ;B48CED
    %AICMD0x0B($01)                                            ;B48CF1
    %AICMD0x12_Jump($B48C75)                                   ;B48CF3
    %AICMD0x1A($0058, $0188, $B384D4, $00)                     ;B48CF6
    %AICMD0x22($04, $04, $01, $B384D4, $02)                    ;B48CFE
    %AICMD0x1F($8D11)                                          ;B48D05
    %AICMD0x12_Jump($B48D05)                                   ;B48D08
    %AICMD0x1F($8D18)                                          ;B48D0B
    %AICMD0x12_Jump($B48D0B)                                   ;B48D0E
    %AICMD0x1C($0325, $00)                                     ;B48D11
    %AICMD0x12_Jump($B48D0B)                                   ;B48D15
    %AICMD0x1C($032A, $00)                                     ;B48D18
    %AICMD0x12_Jump($B48D0B)                                   ;B48D1C
    %AICMD0x1A($0088, $0058, $B384C8, $00)                     ;B48D1F
    %AICMD0x1F($8D2D)                                          ;B48D27
    %AICMD0x12_Jump($B48D27)                                   ;B48D2A
    %AICMD0x1C($0326, $00)                                     ;B48D2D
    %AICMD0x1B($0311, $01)                                     ;B48D31
    %AICMD0x12_Jump($B48D27)                                   ;B48D35

pScripting_B48D38:
    dw DATA8_B48D58                                            ;B48D38|        |B48D58;
    dw pScripting_B48E05                                       ;B48D3A|        |B48E05;
    dw pScripting_B48E05                                       ;B48D3C|        |B48E05;
    dw pScripting_B48E05                                       ;B48D3E|        |B48E05;
    dw pScripting_B48E05                                       ;B48D40|        |B48E05;
    dw pScripting_B48E05                                       ;B48D42|        |B48E05;
    dw pScripting_B48E05                                       ;B48D44|        |B48E05;
    dw pScripting_B48E05                                       ;B48D46|        |B48E05;
    dw pScripting_B48E05                                       ;B48D48|        |B48E05;
    dw pScripting_B48E05                                       ;B48D4A|        |B48E05;
    dw pScripting_B48E05                                       ;B48D4C|        |B48E05;
    dw pScripting_B48E05                                       ;B48D4E|        |B48E05;
    dw pScripting_B48E05                                       ;B48D50|        |B48E05;
    dw pScripting_B48E05                                       ;B48D52|        |B48E05;
    dw pScripting_B48E05                                       ;B48D54|        |B48E05;
    dw pScripting_B48E05                                       ;B48D56|        |B48E05;
 
DATA8_B48D58:
 
    %AICMD0x50()                                               ;B48D58
    %AICMD0x08()                                               ;B48D59
    %AICMD0x09($01, $B48D6B)                                   ;B48D5A
    %AICMD0x38()                                               ;B48D5E
    %AICMD0x39($00, $0050)                                     ;B48D5F
    %AICMD0x07_SetPlayerDirection($03)                         ;B48D63
    %AICMD0x0B($00)                                            ;B48D65
    %AICMD0x0C($01)                                            ;B48D67
    %AICMD0x11()                                               ;B48D69
    %AICMD0x10_End()                                           ;B48D6A
    %AICMD0x1A($0078, $01A8, $B38234, $02)                     ;B48D6B
    %AICMD0x0C($00)                                            ;B48D73
    %AICMD0x1D($0321, $00)                                     ;B48D75
    %AICMD0x20($00, $8D90)                                     ;B48D79
    %AICMD0x20($01, $8DF3)                                     ;B48D7D
    %AICMD0x12_Jump($B48D84)                                   ;B48D81
    %AICMD0x1B($025F, $00)                                     ;B48D84
    %AICMD0x0D($FF, $00, $90, $01)                             ;B48D88
    %AICMD0x0B($01)                                            ;B48D8D
    %AICMD0x10_End()                                           ;B48D8F
    %AICMD0x1B($025D, $00)                                     ;B48D90
    %AICMD0x0D($00, $FF, $30, $01)                             ;B48D94
    %AICMD0x1B($025F, $01)                                     ;B48D99
    %AICMD0x0D($01, $00, $A8, $01)                             ;B48D9D
    %AICMD0x13($003C)                                          ;B48DA2
    %AICMD0x1B($025F, $00)                                     ;B48DA5
    %AICMD0x0D($FF, $00, $A8, $01)                             ;B48DA9
    %AICMD0x1B($025B, $00)                                     ;B48DAE
    %AICMD0x0D($00, $01, $30, $01)                             ;B48DB2
    %AICMD0x1B($025E, $01)                                     ;B48DB7
    %AICMD0x1C($0322, $00)                                     ;B48DBB
    %AICMD0x15($800921, $03, $B48DD0)                          ;B48DBF
    %AICMD0x15($800923, $03, $B48DD8)                          ;B48DC6
    %AICMD0x12_Jump($B48DE0)                                   ;B48DCD
    %AICMD0x47($800921, $00)                                   ;B48DD0
    %AICMD0x12_Jump($B48DE0)                                   ;B48DD5
    %AICMD0x47($800923, $00)                                   ;B48DD8
    %AICMD0x12_Jump($B48DE0)                                   ;B48DDD
    %AICMD0x28($1F00, $7F, $02)                                ;B48DE0
    %AICMD0x23_OrWithIndexedValue($7F1F68, $0F)                ;B48DE5
    %AICMD0x41_ModifyVariable($7F1F33, $0014)                  ;B48DEA
    %AICMD0x12_Jump($B48D84)                                   ;B48DF0
    %AICMD0x1C($0323, $00)                                     ;B48DF3
    %AICMD0x23_OrWithIndexedValue($7F1F6A, $02)                ;B48DF7
    %AICMD0x41_ModifyVariable($7F1F33, $FFEC)                  ;B48DFC
    %AICMD0x12_Jump($B48D84)                                   ;B48E02

pScripting_B48E05:
    dw DATA8_B48E25                                            ;B48E05|        |B48E25;
    dw pScripting_B48EC5                                       ;B48E07|        |B48EC5;
    dw pScripting_B48EC5                                       ;B48E09|        |B48EC5;
    dw pScripting_B48EC5                                       ;B48E0B|        |B48EC5;
    dw pScripting_B48EC5                                       ;B48E0D|        |B48EC5;
    dw pScripting_B48EC5                                       ;B48E0F|        |B48EC5;
    dw pScripting_B48EC5                                       ;B48E11|        |B48EC5;
    dw pScripting_B48EC5                                       ;B48E13|        |B48EC5;
    dw pScripting_B48EC5                                       ;B48E15|        |B48EC5;
    dw pScripting_B48EC5                                       ;B48E17|        |B48EC5;
    dw pScripting_B48EC5                                       ;B48E19|        |B48EC5;
    dw pScripting_B48EC5                                       ;B48E1B|        |B48EC5;
    dw pScripting_B48EC5                                       ;B48E1D|        |B48EC5;
    dw pScripting_B48EC5                                       ;B48E1F|        |B48EC5;
    dw pScripting_B48EC5                                       ;B48E21|        |B48EC5;
    dw pScripting_B48EC5                                       ;B48E23|        |B48EC5;
 
DATA8_B48E25:
 
    %AICMD0x00_SetMusic($0A, $B4)                              ;B48E25
    %AICMD0x08()                                               ;B48E28
    %AICMD0x07_SetPlayerDirection($01)                         ;B48E29
    %AICMD0x09($01, $B48E33)                                   ;B48E2B
    %AICMD0x0C($00)                                            ;B48E2F
    %AICMD0x11()                                               ;B48E31
    %AICMD0x10_End()                                           ;B48E32
    %AICMD0x1A($0068, $0218, $B38528, $00)                     ;B48E33
    %AICMD0x1B($0315, $00)                                     ;B48E3B
    %AICMD0x0D($00, $03, $10, $01)                             ;B48E3F
    %AICMD0x09($02, $B48E94)                                   ;B48E44
    %AICMD0x13($001E)                                          ;B48E48
    %AICMD0x1D($031E, $00)                                     ;B48E4B
    %AICMD0x20($00, $8E5A)                                     ;B48E4F
    %AICMD0x20($01, $8E72)                                     ;B48E53
    %AICMD0x12_Jump($B48E89)                                   ;B48E57
    %AICMD0x25($02)                                            ;B48E5A
    %AICMD0x09($02, $B48EAE)                                   ;B48E5C
    %AICMD0x1C($031F, $00)                                     ;B48E60
    %AICMD0x23_OrWithIndexedValue($7F1F6A, $03)                ;B48E64
    %AICMD0x41_ModifyVariable($7F1F33, $FFE2)                  ;B48E69
    %AICMD0x12_Jump($B48E89)                                   ;B48E6F
    %AICMD0x1C($0320, $00)                                     ;B48E72
    %AICMD0x28($1F00, $7F, $03)                                ;B48E76
    %AICMD0x47($800921, $14)                                   ;B48E7B
    %AICMD0x41_ModifyVariable($7F1F33, $0014)                  ;B48E80
    %AICMD0x12_Jump($B48E89)                                   ;B48E86
    %AICMD0x13($0078)                                          ;B48E89
    %AICMD0x1B($0316, $00)                                     ;B48E8C
    %AICMD0x0B($00)                                            ;B48E90
    %AICMD0x37()                                               ;B48E92
    %AICMD0x10_End()                                           ;B48E93
    %AICMD0x13($001E)                                          ;B48E94
    %AICMD0x1A($0068, $0238, $B387E0, $00)                     ;B48E97
    %AICMD0x0D($00, $FF, $20, $04)                             ;B48E9F
    %AICMD0x0D($00, $01, $30, $01)                             ;B48EA4
    %AICMD0x13($003C)                                          ;B48EA9
    %AICMD0x37()                                               ;B48EAC
    %AICMD0x10_End()                                           ;B48EAD
    %AICMD0x1A($0068, $0238, $B387D4, $00)                     ;B48EAE
    %AICMD0x0D($00, $FF, $20, $04)                             ;B48EB6
    %AICMD0x0D($00, $01, $30, $01)                             ;B48EBB
    %AICMD0x13($003C)                                          ;B48EC0
    %AICMD0x37()                                               ;B48EC3
    %AICMD0x10_End()                                           ;B48EC4

pScripting_B48EC5:
    dw DATA8_B48EE5                                            ;B48EC5|        |B48EE5;
    dw pScripting_B48F95                                       ;B48EC7|        |B48F95;
    dw pScripting_B48F95                                       ;B48EC9|        |B48F95;
    dw pScripting_B48F95                                       ;B48ECB|        |B48F95;
    dw pScripting_B48F95                                       ;B48ECD|        |B48F95;
    dw pScripting_B48F95                                       ;B48ECF|        |B48F95;
    dw pScripting_B48F95                                       ;B48ED1|        |B48F95;
    dw pScripting_B48F95                                       ;B48ED3|        |B48F95;
    dw pScripting_B48F95                                       ;B48ED5|        |B48F95;
    dw pScripting_B48F95                                       ;B48ED7|        |B48F95;
    dw pScripting_B48F95                                       ;B48ED9|        |B48F95;
    dw pScripting_B48F95                                       ;B48EDB|        |B48F95;
    dw pScripting_B48F95                                       ;B48EDD|        |B48F95;
    dw pScripting_B48F95                                       ;B48EDF|        |B48F95;
    dw pScripting_B48F95                                       ;B48EE1|        |B48F95;
    dw pScripting_B48F95                                       ;B48EE3|        |B48F95;
 
DATA8_B48EE5:
 
    %AICMD0x09($01, $B48EF9)                                   ;B48EE5
    %AICMD0x38()                                               ;B48EE9
    %AICMD0x10_End()                                           ;B48EEA
    %AICMD0x15($7F1F1C, $12, $B48EF8)                          ;B48EEB
    %AICMD0x13($0001)                                          ;B48EF2
    %AICMD0x12_Jump($B48EEB)                                   ;B48EF5
    %AICMD0x10_End()                                           ;B48EF8
    %AICMD0x15($7F1F1C, $12, $B48F94)                          ;B48EF9
    %AICMD0x1A($0098, $01A8, $B384E0, $01)                     ;B48F00
    %AICMD0x2D($B48F28, $B48F2F)                               ;B48F08
    %AICMD0x16($7F1F1C, $12, $18, $B48F6E)                     ;B48F0D
    %AICMD0x12_Jump($B48F08)                                   ;B48F15
    %AICMD0x2D($B48F67, $B48F2F)                               ;B48F18
    %AICMD0x16($7F1F1C, $12, $18, $B48F6E)                     ;B48F1D
    %AICMD0x12_Jump($B48F18)                                   ;B48F25
    %AICMD0x1C($032B, $00)                                     ;B48F28
    %AICMD0x12_Jump($B48F18)                                   ;B48F2C
    %AICMD0x15($80091E, $01, $B48F44)                          ;B48F2F
    %AICMD0x15($80091E, $02, $B48F5A)                          ;B48F36
    %AICMD0x1C($032F, $00)                                     ;B48F3D
    %AICMD0x12_Jump($B48F08)                                   ;B48F41
    %AICMD0x1B($0309, $01)                                     ;B48F44
    %AICMD0x1C($032D, $00)                                     ;B48F48
    %AICMD0x23_OrWithIndexedValue($7F1F6A, $08)                ;B48F4C
    %AICMD0x41_ModifyVariable($7F1F33, $0014)                  ;B48F51
    %AICMD0x12_Jump($B48F6E)                                   ;B48F57
    %AICMD0x1C($032E, $00)                                     ;B48F5A
    %AICMD0x41_ModifyVariable($7F1F33, $FFEC)                  ;B48F5E
    %AICMD0x12_Jump($B48F18)                                   ;B48F64
    %AICMD0x1C($032C, $00)                                     ;B48F67
    %AICMD0x12_Jump($B48F18)                                   ;B48F6B
    %AICMD0x1B($030E, $01)                                     ;B48F6E
    %AICMD0x0D($02, $FE, $04, $01)                             ;B48F72
    %AICMD0x0D($02, $02, $04, $01)                             ;B48F77
    %AICMD0x1B($030E, $01)                                     ;B48F7C
    %AICMD0x0D($01, $00, $48, $01)                             ;B48F80
    %AICMD0x1B($030E, $01)                                     ;B48F85
    %AICMD0x0D($02, $FE, $06, $01)                             ;B48F89
    %AICMD0x0D($02, $02, $04, $01)                             ;B48F8E
    %AICMD0x37()                                               ;B48F93
    %AICMD0x10_End()                                           ;B48F94

pScripting_B48F95:
    dw DATA8_B48FB5                                            ;B48F95|        |B48FB5;
    dw DATA8_B48FDE                                            ;B48F97|        |B48FDE;
    dw pScripting_B490D3                                       ;B48F99|        |B490D3;
    dw pScripting_B490D3                                       ;B48F9B|        |B490D3;
    dw pScripting_B490D3                                       ;B48F9D|        |B490D3;
    dw pScripting_B490D3                                       ;B48F9F|        |B490D3;
    dw pScripting_B490D3                                       ;B48FA1|        |B490D3;
    dw pScripting_B490D3                                       ;B48FA3|        |B490D3;
    dw pScripting_B490D3                                       ;B48FA5|        |B490D3;
    dw pScripting_B490D3                                       ;B48FA7|        |B490D3;
    dw pScripting_B490D3                                       ;B48FA9|        |B490D3;
    dw pScripting_B490D3                                       ;B48FAB|        |B490D3;
    dw pScripting_B490D3                                       ;B48FAD|        |B490D3;
    dw pScripting_B490D3                                       ;B48FAF|        |B490D3;
    dw pScripting_B490D3                                       ;B48FB1|        |B490D3;
    dw pScripting_B490D3                                       ;B48FB3|        |B490D3;
 
DATA8_B48FB5:
 
    %AICMD0x50()                                               ;B48FB5
    %AICMD0x08()                                               ;B48FB6
    %AICMD0x09($01, $B48FBF)                                   ;B48FB7
    %AICMD0x38()                                               ;B48FBB
    %AICMD0x0B($00)                                            ;B48FBC
    %AICMD0x10_End()                                           ;B48FBE
    %AICMD0x1A($0088, $01B8, $B3830C, $01)                     ;B48FBF
    %AICMD0x0C($00)                                            ;B48FC7
    %AICMD0x0D($00, $FF, $50, $01)                             ;B48FC9
    %AICMD0x1C($01CC, $00)                                     ;B48FCE
    %AICMD0x1B($0290, $00)                                     ;B48FD2
    %AICMD0x0D($00, $01, $60, $01)                             ;B48FD6
    %AICMD0x37()                                               ;B48FDB
    %AICMD0x11()                                               ;B48FDC
    %AICMD0x10_End()                                           ;B48FDD

DATA8_B48FDE:
 
    %AICMD0x50()                                               ;B48FDE
    %AICMD0x00_SetMusic($0E, $B4)                              ;B48FDF
    %AICMD0x08()                                               ;B48FE2
    %AICMD0x09($01, $B49083)                                   ;B48FE3
    %AICMD0x09($02, $B4903D)                                   ;B48FE7
    %AICMD0x09($03, $B49051)                                   ;B48FEB
    %AICMD0x09($04, $B49065)                                   ;B48FEF
    %AICMD0x38()                                               ;B48FF3
    %AICMD0x39($03, $0018)                                     ;B48FF4
    %AICMD0x0B($00)                                            ;B48FF8
    %AICMD0x39($01, $0030)                                     ;B48FFA
    %AICMD0x07_SetPlayerDirection($02)                         ;B48FFE
    %AICMD0x0B($01)                                            ;B49000
    %AICMD0x39($03, $0014)                                     ;B49002
    %AICMD0x39($01, $0033)                                     ;B49006
    %AICMD0x07_SetPlayerDirection($02)                         ;B4900A
    %AICMD0x0B($02)                                            ;B4900C
    %AICMD0x0C($03)                                            ;B4900E
    %AICMD0x07_SetPlayerDirection($00)                         ;B49010
    %AICMD0x0C($04)                                            ;B49012
    %AICMD0x19($0007, $00)                                     ;B49014
    %AICMD0x13($003C)                                          ;B49018
    %AICMD0x07_SetPlayerDirection($00)                         ;B4901B
    %AICMD0x39($00, $0040)                                     ;B4901D
    %AICMD0x0B($05)                                            ;B49021
    %AICMD0x39($02, $0030)                                     ;B49023
    %AICMD0x40()                                               ;B49027
    %AICMD0x39($00, $0040)                                     ;B49028
    %AICMD0x0C($06)                                            ;B4902C
    %AICMD0x13($003C)                                          ;B4902E
    %AICMD0x23_OrWithIndexedValue($7F1F6A, $0D)                ;B49031
    %AICMD0x28($1F6A, $7F, $0C)                                ;B49036
    %AICMD0x3C()                                               ;B4903B
    %AICMD0x10_End()                                           ;B4903C
    %AICMD0x1A($0058, $00C8, $B38234, $02)                     ;B4903D
    %AICMD0x0C($00)                                            ;B49045
    %AICMD0x1C($01D3, $00)                                     ;B49047
    %AICMD0x13($0001)                                          ;B4904B
    %AICMD0x12_Jump($B4904B)                                   ;B4904E
    %AICMD0x1A($00A8, $0098, $B38234, $03)                     ;B49051
    %AICMD0x0C($01)                                            ;B49059
    %AICMD0x1C($01D4, $00)                                     ;B4905B
    %AICMD0x13($0001)                                          ;B4905F
    %AICMD0x12_Jump($B4905F)                                   ;B49062
    %AICMD0x1A($0068, $0068, $B38234, $00)                     ;B49065
    %AICMD0x0C($02)                                            ;B4906D
    %AICMD0x1B($025F, $00)                                     ;B4906F
    %AICMD0x1C($01D5, $00)                                     ;B49073
    %AICMD0x0B($03)                                            ;B49077
    %AICMD0x1B($025A, $00)                                     ;B49079
    %AICMD0x13($0001)                                          ;B4907D
    %AICMD0x12_Jump($B4907D)                                   ;B49080
    %AICMD0x1A($0028, $0068, $B38168, $02)                     ;B49083
    %AICMD0x0C($03)                                            ;B4908B
    %AICMD0x1B($0223, $01)                                     ;B4908D
    %AICMD0x0D($01, $00, $22, $01)                             ;B49091
    %AICMD0x1C($01D6, $00)                                     ;B49096
    %AICMD0x1B($0225, $01)                                     ;B4909A
    %AICMD0x13($003C)                                          ;B4909E
    %AICMD0x1B($0223, $01)                                     ;B490A1
    %AICMD0x0D($FF, $00, $04, $01)                             ;B490A5
    %AICMD0x41_ModifyVariable($7F1F1F, $0032)                  ;B490AA
    %AICMD0x0B($04)                                            ;B490B0
    %AICMD0x0C($05)                                            ;B490B2
    %AICMD0x1B($021F, $00)                                     ;B490B4
    %AICMD0x0D($00, $01, $40, $01)                             ;B490B8
    %AICMD0x1B($0223, $01)                                     ;B490BD
    %AICMD0x0D($01, $00, $30, $01)                             ;B490C1
    %AICMD0x1B($021F, $00)                                     ;B490C6
    %AICMD0x0D($00, $01, $40, $01)                             ;B490CA
    %AICMD0x0B($06)                                            ;B490CF
    %AICMD0x37()                                               ;B490D1
    %AICMD0x10_End()                                           ;B490D2

pScripting_B490D3:
    dw DATA8_B490F3                                            ;B490D3|        |B490F3;
    dw DATA8_B4911C                                            ;B490D5|        |B4911C;
    dw pScripting_B491B3                                       ;B490D7|        |B491B3;
    dw pScripting_B491B3                                       ;B490D9|        |B491B3;
    dw pScripting_B491B3                                       ;B490DB|        |B491B3;
    dw pScripting_B491B3                                       ;B490DD|        |B491B3;
    dw pScripting_B491B3                                       ;B490DF|        |B491B3;
    dw pScripting_B491B3                                       ;B490E1|        |B491B3;
    dw pScripting_B491B3                                       ;B490E3|        |B491B3;
    dw pScripting_B491B3                                       ;B490E5|        |B491B3;
    dw pScripting_B491B3                                       ;B490E7|        |B491B3;
    dw pScripting_B491B3                                       ;B490E9|        |B491B3;
    dw pScripting_B491B3                                       ;B490EB|        |B491B3;
    dw pScripting_B491B3                                       ;B490ED|        |B491B3;
    dw pScripting_B491B3                                       ;B490EF|        |B491B3;
    dw pScripting_B491B3                                       ;B490F1|        |B491B3;
 
DATA8_B490F3:
 
    %AICMD0x50()                                               ;B490F3
    %AICMD0x08()                                               ;B490F4
    %AICMD0x09($01, $B490FD)                                   ;B490F5
    %AICMD0x38()                                               ;B490F9
    %AICMD0x0B($00)                                            ;B490FA
    %AICMD0x10_End()                                           ;B490FC
    %AICMD0x1A($0088, $01B8, $B381A4, $01)                     ;B490FD
    %AICMD0x0C($00)                                            ;B49105
    %AICMD0x0D($00, $FF, $50, $01)                             ;B49107
    %AICMD0x1C($01DB, $00)                                     ;B4910C
    %AICMD0x1B($0227, $00)                                     ;B49110
    %AICMD0x0D($00, $01, $60, $01)                             ;B49114
    %AICMD0x37()                                               ;B49119
    %AICMD0x11()                                               ;B4911A
    %AICMD0x10_End()                                           ;B4911B

DATA8_B4911C:
 
    %AICMD0x50()                                               ;B4911C
    %AICMD0x00_SetMusic($0E, $B4)                              ;B4911D
    %AICMD0x02_FreezeTime()                                    ;B49120
    %AICMD0x03_SetHour($07)                                    ;B49121
    %AICMD0x05_SetPosition($0088, $01C8)                       ;B49123
    %AICMD0x07_SetPlayerDirection($01)                         ;B49128
    %AICMD0x08()                                               ;B4912A
    %AICMD0x09($01, $B49155)                                   ;B4912B
    %AICMD0x09($02, $B4919D)                                   ;B4912F
    %AICMD0x3B($24)                                            ;B49133
    %AICMD0x38()                                               ;B49135
    %AICMD0x0B($03)                                            ;B49136
    %AICMD0x39($01, $0040)                                     ;B49138
    %AICMD0x3F()                                               ;B4913C
    %AICMD0x0B($00)                                            ;B4913D
    %AICMD0x0C($02)                                            ;B4913F
    %AICMD0x40()                                               ;B49141
    %AICMD0x39($00, $0060)                                     ;B49142
    %AICMD0x13($003C)                                          ;B49146
    %AICMD0x23_OrWithIndexedValue($7F1F6A, $0F)                ;B49149
    %AICMD0x28($1F6A, $7F, $0E)                                ;B4914E
    %AICMD0x3C()                                               ;B49153
    %AICMD0x10_End()                                           ;B49154
    %AICMD0x1A($0088, $0178, $B38198, $00)                     ;B49155
    %AICMD0x0C($00)                                            ;B4915D
    %AICMD0x1B($0226, $00)                                     ;B4915F
    %AICMD0x13($003C)                                          ;B49163
    %AICMD0x1C($01E1, $00)                                     ;B49166
    %AICMD0x1B($022B, $01)                                     ;B4916A
    %AICMD0x0D($01, $00, $10, $01)                             ;B4916E
    %AICMD0x1B($0227, $00)                                     ;B49173
    %AICMD0x0D($00, $01, $10, $01)                             ;B49177
    %AICMD0x1B($0226, $00)                                     ;B4917C
    %AICMD0x13($0014)                                          ;B49180
    %AICMD0x1B($022D, $00)                                     ;B49183
    %AICMD0x13($003C)                                          ;B49187
    %AICMD0x41_ModifyVariable($7F1F21, $0032)                  ;B4918A
    %AICMD0x1B($0227, $00)                                     ;B49190
    %AICMD0x0D($00, $01, $50, $01)                             ;B49194
    %AICMD0x0B($01)                                            ;B49199
    %AICMD0x37()                                               ;B4919B
    %AICMD0x10_End()                                           ;B4919C
    %AICMD0x1A($0028, $0168, $B38318, $02)                     ;B4919D
    %AICMD0x0C($01)                                            ;B491A5
    %AICMD0x1C($01E2, $00)                                     ;B491A7
    %AICMD0x0B($02)                                            ;B491AB
    %AICMD0x13($0001)                                          ;B491AD
    %AICMD0x12_Jump($B491AD)                                   ;B491B0

pScripting_B491B3:
    dw DATA8_B491D3                                            ;B491B3|        |B491D3;
    dw DATA8_B49210                                            ;B491B5|        |B49210;
    dw pScripting_B492D2                                       ;B491B7|        |B492D2;
    dw pScripting_B492D2                                       ;B491B9|        |B492D2;
    dw pScripting_B492D2                                       ;B491BB|        |B492D2;
    dw pScripting_B492D2                                       ;B491BD|        |B492D2;
    dw pScripting_B492D2                                       ;B491BF|        |B492D2;
    dw pScripting_B492D2                                       ;B491C1|        |B492D2;
    dw pScripting_B492D2                                       ;B491C3|        |B492D2;
    dw pScripting_B492D2                                       ;B491C5|        |B492D2;
    dw pScripting_B492D2                                       ;B491C7|        |B492D2;
    dw pScripting_B492D2                                       ;B491C9|        |B492D2;
    dw pScripting_B492D2                                       ;B491CB|        |B492D2;
    dw pScripting_B492D2                                       ;B491CD|        |B492D2;
    dw pScripting_B492D2                                       ;B491CF|        |B492D2;
    dw pScripting_B492D2                                       ;B491D1|        |B492D2;
 
DATA8_B491D3:
 
    %AICMD0x50()                                               ;B491D3
    %AICMD0x08()                                               ;B491D4
    %AICMD0x09($01, $B491DD)                                   ;B491D5
    %AICMD0x38()                                               ;B491D9
    %AICMD0x0B($00)                                            ;B491DA
    %AICMD0x10_End()                                           ;B491DC
    %AICMD0x1A($0088, $01B8, $B38324, $01)                     ;B491DD
    %AICMD0x0C($00)                                            ;B491E5
    %AICMD0x0D($00, $FF, $50, $01)                             ;B491E7
    %AICMD0x1B($029B, $01)                                     ;B491EC
    %AICMD0x13($000A)                                          ;B491F0
    %AICMD0x1B($029B, $00)                                     ;B491F3
    %AICMD0x13($000A)                                          ;B491F7
    %AICMD0x1B($0299, $00)                                     ;B491FA
    %AICMD0x1C($01E3, $00)                                     ;B491FE
    %AICMD0x1B($0297, $00)                                     ;B49202
    %AICMD0x0D($00, $01, $60, $01)                             ;B49206
    %AICMD0x0B($01)                                            ;B4920B
    %AICMD0x37()                                               ;B4920D
    %AICMD0x11()                                               ;B4920E
    %AICMD0x10_End()                                           ;B4920F

DATA8_B49210:
 
    %AICMD0x00_SetMusic($0E, $B4)                              ;B49210
    %AICMD0x09($01, $B49221)                                   ;B49213
    %AICMD0x38()                                               ;B49217
    %AICMD0x11()                                               ;B49218
    %AICMD0x10_End()                                           ;B49219
    %AICMD0x13($0001)                                          ;B4921A
    %AICMD0x12_Jump($B4921A)                                   ;B4921D
    %AICMD0x10_End()                                           ;B49220
    %AICMD0x1A($0038, $00F8, $B387EC, $00)                     ;B49221
    %AICMD0x12_Jump($B4922C)                                   ;B49229
    %AICMD0x2D($B4923C, $B4924A)                               ;B4922C
    %AICMD0x12_Jump($B4922C)                                   ;B49231
    %AICMD0x2D($B49243, $B4924A)                               ;B49234
    %AICMD0x12_Jump($B49234)                                   ;B49239
    %AICMD0x1C($01E5, $00)                                     ;B4923C
    %AICMD0x12_Jump($B49234)                                   ;B49240
    %AICMD0x1C($01E8, $00)                                     ;B49243
    %AICMD0x12_Jump($B49234)                                   ;B49247
    %AICMD0x43($80091E, $0018, $9259)                          ;B4924A
    %AICMD0x1C($01E8, $00)                                     ;B49252
    %AICMD0x12_Jump($B49234)                                   ;B49256
    %AICMD0x08()                                               ;B49259
    %AICMD0x1B($024F, $01)                                     ;B4925A
    %AICMD0x1C($01E7, $00)                                     ;B4925E
    %AICMD0x1B($0252, $01)                                     ;B49262
    %AICMD0x13($005A)                                          ;B49266
    %AICMD0x1B($024F, $01)                                     ;B49269
    %AICMD0x41_ModifyVariable($7F1F23, $0032)                  ;B4926D
    %AICMD0x0B($00)                                            ;B49273
    %AICMD0x07_SetPlayerDirection($02)                         ;B49275
    %AICMD0x39($02, $0030)                                     ;B49277
    %AICMD0x07_SetPlayerDirection($00)                         ;B4927B
    %AICMD0x1B($0250, $01)                                     ;B4927D
    %AICMD0x0D($01, $00, $30, $01)                             ;B49281
    %AICMD0x1B($024C, $00)                                     ;B49286
    %AICMD0x0D($00, $01, $20, $02)                             ;B4928A
    %AICMD0x13($000A)                                          ;B4928F
    %AICMD0x0D($00, $01, $30, $01)                             ;B49292
    %AICMD0x13($000A)                                          ;B49297
    %AICMD0x0D($01, $01, $18, $02)                             ;B4929A
    %AICMD0x13($000A)                                          ;B4929F
    %AICMD0x0D($00, $01, $46, $01)                             ;B492A2
    %AICMD0x1B($0347, $00)                                     ;B492A7
    %AICMD0x3A($00, $0044)                                     ;B492AB
    %AICMD0x19($0024, $00)                                     ;B492AF
    %AICMD0x13($003C)                                          ;B492B3
    %AICMD0x1C($0147, $00)                                     ;B492B6
    %AICMD0x07_SetPlayerDirection($00)                         ;B492BA
    %AICMD0x13($001E)                                          ;B492BC
    %AICMD0x1B($024E, $00)                                     ;B492BF
    %AICMD0x13($003C)                                          ;B492C3
    %AICMD0x23_OrWithIndexedValue($7F1F6C, $01)                ;B492C6
    %AICMD0x28($1F6C, $7F, $00)                                ;B492CB
    %AICMD0x3C()                                               ;B492D0
    %AICMD0x10_End()                                           ;B492D1

pScripting_B492D2:
    dw DATA8_B492F2                                            ;B492D2|        |B492F2;
    dw DATA8_B4931D                                            ;B492D4|        |B4931D;
    dw DATA8_B49401                                            ;B492D6|        |B49401;
    dw pScripting_B4943C                                       ;B492D8|        |B4943C;
    dw pScripting_B4943C                                       ;B492DA|        |B4943C;
    dw pScripting_B4943C                                       ;B492DC|        |B4943C;
    dw pScripting_B4943C                                       ;B492DE|        |B4943C;
    dw pScripting_B4943C                                       ;B492E0|        |B4943C;
    dw pScripting_B4943C                                       ;B492E2|        |B4943C;
    dw pScripting_B4943C                                       ;B492E4|        |B4943C;
    dw pScripting_B4943C                                       ;B492E6|        |B4943C;
    dw pScripting_B4943C                                       ;B492E8|        |B4943C;
    dw pScripting_B4943C                                       ;B492EA|        |B4943C;
    dw pScripting_B4943C                                       ;B492EC|        |B4943C;
    dw pScripting_B4943C                                       ;B492EE|        |B4943C;
    dw pScripting_B4943C                                       ;B492F0|        |B4943C;
 
DATA8_B492F2:
 
    %AICMD0x50()                                               ;B492F2
    %AICMD0x08()                                               ;B492F3
    %AICMD0x09($01, $B492FC)                                   ;B492F4
    %AICMD0x38()                                               ;B492F8
    %AICMD0x0B($00)                                            ;B492F9
    %AICMD0x10_End()                                           ;B492FB
    %AICMD0x1A($0088, $01B8, $B381EC, $01)                     ;B492FC
    %AICMD0x0C($00)                                            ;B49304
    %AICMD0x0D($00, $FF, $50, $01)                             ;B49306
    %AICMD0x1C($01EB, $00)                                     ;B4930B
    %AICMD0x1B($023D, $00)                                     ;B4930F
    %AICMD0x0D($00, $01, $60, $01)                             ;B49313
    %AICMD0x0B($01)                                            ;B49318
    %AICMD0x37()                                               ;B4931A
    %AICMD0x11()                                               ;B4931B
    %AICMD0x10_End()                                           ;B4931C

DATA8_B4931D:
 
    %AICMD0x00_SetMusic($0E, $B4)                              ;B4931D
    %AICMD0x09($0A, $B49326)                                   ;B49320
    %AICMD0x38()                                               ;B49324
    %AICMD0x10_End()                                           ;B49325
    %AICMD0x1A($029C, $018E, $B38558, $03)                     ;B49326
    %AICMD0x1F($9334)                                          ;B4932E
    %AICMD0x12_Jump($B4932E)                                   ;B49331
    %AICMD0x08()                                               ;B49334
    %AICMD0x1B($0320, $01)                                     ;B49335
    %AICMD0x0D($01, $FF, $18, $02)                             ;B49339
    %AICMD0x0D($01, $00, $10, $04)                             ;B4933E
    %AICMD0x23_OrWithIndexedValue($7F1F5E, $03)                ;B49343
    %AICMD0x15($7F1F19, $00, $B49364)                          ;B49348
    %AICMD0x15($7F1F19, $01, $B49369)                          ;B4934F
    %AICMD0x15($7F1F19, $02, $B4936E)                          ;B49356
    %AICMD0x15($7F1F19, $03, $B49373)                          ;B4935D
    %AICMD0x3D($10)                                            ;B49364
    %AICMD0x12_Jump($B49378)                                   ;B49366
    %AICMD0x3D($11)                                            ;B49369
    %AICMD0x12_Jump($B49378)                                   ;B4936B
    %AICMD0x3D($12)                                            ;B4936E
    %AICMD0x12_Jump($B49378)                                   ;B49370
    %AICMD0x3D($13)                                            ;B49373
    %AICMD0x12_Jump($B49378)                                   ;B49375
    %AICMD0x10_End()                                           ;B49378
    %AICMD0x1A($0288, $01F5, $B38558, $03)                     ;B49379
    %AICMD0x0C($01)                                            ;B49381
    %AICMD0x1B($0320, $01)                                     ;B49383
    %AICMD0x0D($02, $FF, $20, $02)                             ;B49387
    %AICMD0x0D($01, $FF, $20, $02)                             ;B4938C
    %AICMD0x0D($01, $FF, $50, $01)                             ;B49391
    %AICMD0x0B($02)                                            ;B49396
    %AICMD0x37()                                               ;B49398
    %AICMD0x10_End()                                           ;B49399
    %AICMD0x1A($0208, $0208, $B381EC, $02)                     ;B4939A
    %AICMD0x0D($01, $00, $60, $01)                             ;B493A2
    %AICMD0x1B($0240, $01)                                     ;B493A7
    %AICMD0x13($005A)                                          ;B493AB
    %AICMD0x1C($01F1, $00)                                     ;B493AE
    %AICMD0x0B($01)                                            ;B493B2
    %AICMD0x1B($0242, $00)                                     ;B493B4
    %AICMD0x13($005A)                                          ;B493B8
    %AICMD0x0C($02)                                            ;B493BB
    %AICMD0x1B($0240, $01)                                     ;B493BD
    %AICMD0x1C($01F2, $00)                                     ;B493C1
    %AICMD0x1B($0241, $01)                                     ;B493C5
    %AICMD0x0D($01, $00, $14, $01)                             ;B493C9
    %AICMD0x1B($0243, $01)                                     ;B493CE
    %AICMD0x13($005A)                                          ;B493D2
    %AICMD0x41_ModifyVariable($7F1F25, $0032)                  ;B493D5
    %AICMD0x1B($0240, $01)                                     ;B493DB
    %AICMD0x13($0028)                                          ;B493DF
    %AICMD0x1B($0241, $00)                                     ;B493E2
    %AICMD0x0D($FF, $00, $44, $01)                             ;B493E6
    %AICMD0x1B($023D, $00)                                     ;B493EB
    %AICMD0x0D($00, $01, $50, $01)                             ;B493EF
    %AICMD0x1B($0241, $00)                                     ;B493F4
    %AICMD0x0D($FF, $00, $70, $01)                             ;B493F8
    %AICMD0x0B($03)                                            ;B493FD
    %AICMD0x37()                                               ;B493FF
    %AICMD0x10_End()                                           ;B49400

DATA8_B49401:
 
    %AICMD0x50()                                               ;B49401
    %AICMD0x02_FreezeTime()                                    ;B49402
    %AICMD0x08()                                               ;B49403
    %AICMD0x07_SetPlayerDirection($03)                         ;B49404
    %AICMD0x05_SetPosition($0288, $0208)                       ;B49406
    %AICMD0x09($0A, $B4939A)                                   ;B4940B
    %AICMD0x09($0B, $B49379)                                   ;B4940F
    %AICMD0x38()                                               ;B49413
    %AICMD0x0C($01)                                            ;B49414
    %AICMD0x07_SetPlayerDirection($01)                         ;B49416
    %AICMD0x13($003C)                                          ;B49418
    %AICMD0x07_SetPlayerDirection($02)                         ;B4941B
    %AICMD0x13($0050)                                          ;B4941D
    %AICMD0x07_SetPlayerDirection($01)                         ;B49420
    %AICMD0x13($0078)                                          ;B49422
    %AICMD0x07_SetPlayerDirection($03)                         ;B49425
    %AICMD0x13($00DC)                                          ;B49427
    %AICMD0x39($03, $0030)                                     ;B4942A
    %AICMD0x0C($03)                                            ;B4942E
    %AICMD0x23_OrWithIndexedValue($7F1F6C, $03)                ;B49430
    %AICMD0x28($1F6C, $7F, $02)                                ;B49435
    %AICMD0x3C()                                               ;B4943A
    %AICMD0x10_End()                                           ;B4943B

pScripting_B4943C:
    dw DATA8_B4945C                                            ;B4943C|        |B4945C;
    dw DATA8_B49499                                            ;B4943E|        |B49499;
    dw DATA8_B49513                                            ;B49440|        |B49513;
    dw DATA8_B4958B                                            ;B49442|        |B4958B;
    dw pScripting_B4967A                                       ;B49444|        |B4967A;
    dw pScripting_B4967A                                       ;B49446|        |B4967A;
    dw pScripting_B4967A                                       ;B49448|        |B4967A;
    dw pScripting_B4967A                                       ;B4944A|        |B4967A;
    dw pScripting_B4967A                                       ;B4944C|        |B4967A;
    dw pScripting_B4967A                                       ;B4944E|        |B4967A;
    dw pScripting_B4967A                                       ;B49450|        |B4967A;
    dw pScripting_B4967A                                       ;B49452|        |B4967A;
    dw pScripting_B4967A                                       ;B49454|        |B4967A;
    dw pScripting_B4967A                                       ;B49456|        |B4967A;
    dw pScripting_B4967A                                       ;B49458|        |B4967A;
    dw pScripting_B4967A                                       ;B4945A|        |B4967A;
 
DATA8_B4945C:
 
    %AICMD0x50()                                               ;B4945C
    %AICMD0x08()                                               ;B4945D
    %AICMD0x09($01, $B49466)                                   ;B4945E
    %AICMD0x38()                                               ;B49462
    %AICMD0x0B($00)                                            ;B49463
    %AICMD0x10_End()                                           ;B49465
    %AICMD0x1A($0088, $01B8, $B38240, $01)                     ;B49466
    %AICMD0x0C($00)                                            ;B4946E
    %AICMD0x0D($00, $FE, $28, $01)                             ;B49470
    %AICMD0x1B($025F, $01)                                     ;B49475
    %AICMD0x13($000A)                                          ;B49479
    %AICMD0x1B($025F, $00)                                     ;B4947C
    %AICMD0x13($000A)                                          ;B49480
    %AICMD0x1B($025D, $00)                                     ;B49483
    %AICMD0x1C($01F5, $00)                                     ;B49487
    %AICMD0x1B($025B, $00)                                     ;B4948B
    %AICMD0x0D($00, $02, $30, $01)                             ;B4948F
    %AICMD0x0B($01)                                            ;B49494
    %AICMD0x37()                                               ;B49496
    %AICMD0x11()                                               ;B49497
    %AICMD0x10_End()                                           ;B49498

DATA8_B49499:
 
    %AICMD0x09($01, $B494B1)                                   ;B49499
    %AICMD0x09($02, $B494C6)                                   ;B4949D
    %AICMD0x09($03, $B494E2)                                   ;B494A1
    %AICMD0x09($04, $B494F7)                                   ;B494A5
    %AICMD0x38()                                               ;B494A9
    %AICMD0x10_End()                                           ;B494AA
    %AICMD0x13($0001)                                          ;B494AB
    %AICMD0x12_Jump($B494AB)                                   ;B494AE
    %AICMD0x1A($0208, $0238, $B38240, $03)                     ;B494B1
    %AICMD0x1F($94BF)                                          ;B494B9
    %AICMD0x12_Jump($B494B9)                                   ;B494BC
    %AICMD0x1C($01F7, $00)                                     ;B494BF
    %AICMD0x12_Jump($B494B9)                                   ;B494C3
    %AICMD0x1A($0168, $0218, $B38240, $03)                     ;B494C6
    %AICMD0x22($10, $10, $01, $B38240, $10)                    ;B494CE
    %AICMD0x1F($94DB)                                          ;B494D5
    %AICMD0x12_Jump($B494D5)                                   ;B494D8
    %AICMD0x1C($01F8, $00)                                     ;B494DB
    %AICMD0x12_Jump($B494D5)                                   ;B494DF
    %AICMD0x1A($0188, $0048, $B38240, $00)                     ;B494E2
    %AICMD0x1F($94F0)                                          ;B494EA
    %AICMD0x12_Jump($B494EA)                                   ;B494ED
    %AICMD0x1C($01F7, $00)                                     ;B494F0
    %AICMD0x12_Jump($B494EA)                                   ;B494F4
    %AICMD0x1A($00D8, $01D8, $B38234, $00)                     ;B494F7
    %AICMD0x22($20, $00, $01, $B38240, $10)                    ;B494FF
    %AICMD0x1F($950C)                                          ;B49506
    %AICMD0x12_Jump($B49506)                                   ;B49509
    %AICMD0x1C($01FA, $00)                                     ;B4950C
    %AICMD0x12_Jump($B49506)                                   ;B49510

DATA8_B49513:
 
    %AICMD0x50()                                               ;B49513
    %AICMD0x00_SetMusic($0E, $B4)                              ;B49514
    %AICMD0x09($01, $B49574)                                   ;B49517
    %AICMD0x09($02, $B4955F)                                   ;B4951B
    %AICMD0x38()                                               ;B4951F
    %AICMD0x0C($00)                                            ;B49520
    %AICMD0x23_OrWithIndexedValue($7F1F5E, $05)                ;B49522
    %AICMD0x15($7F1F19, $00, $B49543)                          ;B49527
    %AICMD0x15($7F1F19, $01, $B49548)                          ;B4952E
    %AICMD0x15($7F1F19, $02, $B4954D)                          ;B49535
    %AICMD0x15($7F1F19, $03, $B49552)                          ;B4953C
    %AICMD0x3D($10)                                            ;B49543
    %AICMD0x12_Jump($B49557)                                   ;B49545
    %AICMD0x3D($11)                                            ;B49548
    %AICMD0x12_Jump($B49557)                                   ;B4954A
    %AICMD0x3D($12)                                            ;B4954D
    %AICMD0x12_Jump($B49557)                                   ;B4954F
    %AICMD0x3D($13)                                            ;B49552
    %AICMD0x12_Jump($B49557)                                   ;B49554
    %AICMD0x05_SetPosition($00A8, $01A8)                       ;B49557
    %AICMD0x07_SetPlayerDirection($00)                         ;B4955C
    %AICMD0x10_End()                                           ;B4955E
    %AICMD0x1A($0198, $0078, $B38204, $02)                     ;B4955F
    %AICMD0x1F($956D)                                          ;B49567
    %AICMD0x12_Jump($B49567)                                   ;B4956A
    %AICMD0x1C($01F6, $00)                                     ;B4956D
    %AICMD0x12_Jump($B49567)                                   ;B49571
    %AICMD0x1A($0038, $0058, $B38660, $03)                     ;B49574
    %AICMD0x1F($9582)                                          ;B4957C
    %AICMD0x12_Jump($B4957C)                                   ;B4957F
    %AICMD0x1C($01FC, $00)                                     ;B49582
    %AICMD0x0B($00)                                            ;B49586
    %AICMD0x12_Jump($B4957C)                                   ;B49588

DATA8_B4958B:
 
    %AICMD0x50()                                               ;B4958B
    %AICMD0x08()                                               ;B4958C
    %AICMD0x09($01, $B495C4)                                   ;B4958D
    %AICMD0x09($02, $B4965F)                                   ;B49591
    %AICMD0x09($03, $B4962A)                                   ;B49595
    %AICMD0x38()                                               ;B49599
    %AICMD0x0B($00)                                            ;B4959A
    %AICMD0x0C($02)                                            ;B4959C
    %AICMD0x07_SetPlayerDirection($03)                         ;B4959E
    %AICMD0x0C($04)                                            ;B495A0
    %AICMD0x07_SetPlayerDirection($00)                         ;B495A2
    %AICMD0x0C($06)                                            ;B495A4
    %AICMD0x13($0078)                                          ;B495A6
    %AICMD0x39($00, $0030)                                     ;B495A9
    %AICMD0x0C($07)                                            ;B495AD
    %AICMD0x07_SetPlayerDirection($02)                         ;B495AF
    %AICMD0x13($003C)                                          ;B495B1
    %AICMD0x39($02, $0020)                                     ;B495B4
    %AICMD0x23_OrWithIndexedValue($7F1F6C, $05)                ;B495B8
    %AICMD0x28($1F6C, $7F, $04)                                ;B495BD
    %AICMD0x3C()                                               ;B495C2
    %AICMD0x10_End()                                           ;B495C3
    %AICMD0x1A($0068, $01A8, $B38204, $02)                     ;B495C4
    %AICMD0x0C($00)                                            ;B495CC
    %AICMD0x1B($0249, $01)                                     ;B495CE
    %AICMD0x0D($01, $00, $20, $01)                             ;B495D2
    %AICMD0x1C($01FD, $01)                                     ;B495D7
    %AICMD0x0B($01)                                            ;B495DB
    %AICMD0x0C($02)                                            ;B495DD
    %AICMD0x1C($01FF, $01)                                     ;B495DF
    %AICMD0x0B($03)                                            ;B495E3
    %AICMD0x0C($05)                                            ;B495E5
    %AICMD0x1B($0249, $01)                                     ;B495E7
    %AICMD0x0D($01, $00, $10, $01)                             ;B495EB
    %AICMD0x1C($0200, $01)                                     ;B495F0
    %AICMD0x0D($01, $00, $08, $01)                             ;B495F4
    %AICMD0x1B($024A, $01)                                     ;B495F9
    %AICMD0x13($005A)                                          ;B495FD
    %AICMD0x41_ModifyVariable($7F1F27, $0032)                  ;B49600
    %AICMD0x0B($06)                                            ;B49606
    %AICMD0x1B($0245, $00)                                     ;B49608
    %AICMD0x0D($00, $01, $30, $01)                             ;B4960C
    %AICMD0x13($000A)                                          ;B49611
    %AICMD0x1B($0249, $01)                                     ;B49614
    %AICMD0x0D($01, $00, $30, $01)                             ;B49618
    %AICMD0x0B($07)                                            ;B4961D
    %AICMD0x1B($0249, $01)                                     ;B4961F
    %AICMD0x0D($01, $00, $76, $01)                             ;B49623
    %AICMD0x37()                                               ;B49628
    %AICMD0x10_End()                                           ;B49629
    %AICMD0x1A($0098, $01A8, $B382D0, $00)                     ;B4962A
    %AICMD0x0C($01)                                            ;B49632
    %AICMD0x1B($0281, $00)                                     ;B49634
    %AICMD0x1C($01FE, $00)                                     ;B49638
    %AICMD0x0B($02)                                            ;B4963C
    %AICMD0x0C($03)                                            ;B4963E
    %AICMD0x1B($027D, $00)                                     ;B49640
    %AICMD0x0D($00, $01, $30, $01)                             ;B49644
    %AICMD0x1B($0281, $01)                                     ;B49649
    %AICMD0x0D($01, $00, $20, $01)                             ;B4964D
    %AICMD0x0B($04)                                            ;B49652
    %AICMD0x1B($0281, $01)                                     ;B49654
    %AICMD0x0D($01, $00, $70, $01)                             ;B49658
    %AICMD0x37()                                               ;B4965D
    %AICMD0x10_End()                                           ;B4965E
    %AICMD0x1A($00D8, $01D8, $B38234, $03)                     ;B4965F
    %AICMD0x0C($04)                                            ;B49667
    %AICMD0x1C($01F9, $01)                                     ;B49669
    %AICMD0x1B($025F, $01)                                     ;B4966D
    %AICMD0x0D($01, $00, $70, $01)                             ;B49671
    %AICMD0x0B($05)                                            ;B49676
    %AICMD0x37()                                               ;B49678
    %AICMD0x10_End()                                           ;B49679

pScripting_B4967A:
    dw DATA8_B4969A                                            ;B4967A|        |B4969A;
    dw pScripting_B49A3F                                       ;B4967C|        |B49A3F;
    dw pScripting_B49A3F                                       ;B4967E|        |B49A3F;
    dw pScripting_B49A3F                                       ;B49680|        |B49A3F;
    dw pScripting_B49A3F                                       ;B49682|        |B49A3F;
    dw pScripting_B49A3F                                       ;B49684|        |B49A3F;
    dw pScripting_B49A3F                                       ;B49686|        |B49A3F;
    dw pScripting_B49A3F                                       ;B49688|        |B49A3F;
    dw pScripting_B49A3F                                       ;B4968A|        |B49A3F;
    dw pScripting_B49A3F                                       ;B4968C|        |B49A3F;
    dw pScripting_B49A3F                                       ;B4968E|        |B49A3F;
    dw pScripting_B49A3F                                       ;B49690|        |B49A3F;
    dw pScripting_B49A3F                                       ;B49692|        |B49A3F;
    dw pScripting_B49A3F                                       ;B49694|        |B49A3F;
    dw pScripting_B49A3F                                       ;B49696|        |B49A3F;
    dw pScripting_B49A3F                                       ;B49698|        |B49A3F;
 
DATA8_B4969A:
 
    %AICMD0x50()                                               ;B4969A
    %AICMD0x00_SetMusic($18, $B4)                              ;B4969B
    %AICMD0x23_OrWithIndexedValue($7F1F60, $09)                ;B4969E
    %AICMD0x02_FreezeTime()                                    ;B496A3
    %AICMD0x03_SetHour($07)                                    ;B496A4
    %AICMD0x05_SetPosition($0168, $0098)                       ;B496A6
    %AICMD0x07_SetPlayerDirection($00)                         ;B496AB
    %AICMD0x08()                                               ;B496AD
    %AICMD0x19($00E8, $00)                                     ;B496AE
    %AICMD0x09($01, $B4979C)                                   ;B496B2
    %AICMD0x09($02, $B499CF)                                   ;B496B6
    %AICMD0x09($03, $B499DD)                                   ;B496BA
    %AICMD0x09($04, $B499EB)                                   ;B496BE
    %AICMD0x09($05, $B499F9)                                   ;B496C2
    %AICMD0x09($06, $B49A15)                                   ;B496C6
    %AICMD0x09($07, $B49A07)                                   ;B496CA
    %AICMD0x09($08, $B49A23)                                   ;B496CE
    %AICMD0x09($09, $B49A31)                                   ;B496D2
    %AICMD0x09($0A, $B4973C)                                   ;B496D6
    %AICMD0x15($7F1F19, $00, $B496F6)                          ;B496DA
    %AICMD0x15($7F1F19, $01, $B496FB)                          ;B496E1
    %AICMD0x15($7F1F19, $02, $B49700)                          ;B496E8
    %AICMD0x15($7F1F19, $03, $B49705)                          ;B496EF
    %AICMD0x06_SetDestination($04)                             ;B496F6
    %AICMD0x12_Jump($B4970A)                                   ;B496F8
    %AICMD0x06_SetDestination($05)                             ;B496FB
    %AICMD0x12_Jump($B4970A)                                   ;B496FD
    %AICMD0x06_SetDestination($06)                             ;B49700
    %AICMD0x12_Jump($B4970A)                                   ;B49702
    %AICMD0x06_SetDestination($07)                             ;B49705
    %AICMD0x12_Jump($B4970A)                                   ;B49707
    %AICMD0x38()                                               ;B4970A
    %AICMD0x0C($01)                                            ;B4970B
    %AICMD0x09($0B, $B4991D)                                   ;B4970D
    %AICMD0x09($0C, $B49949)                                   ;B49711
    %AICMD0x09($0D, $B49973)                                   ;B49715
    %AICMD0x09($0E, $B49990)                                   ;B49719
    %AICMD0x09($0F, $B499AD)                                   ;B4971D
    %AICMD0x0C($03)                                            ;B49721
    %AICMD0x13($003C)                                          ;B49723
    %AICMD0x41_ModifyVariable($7F1F33, $0032)                  ;B49726
    %AICMD0x01_UnfreezeTime()                                  ;B4972C
    %AICMD0x24($74)                                            ;B4972D
    %AICMD0x13($00B4)                                          ;B4972F
    %AICMD0x1C($01BF, $00)                                     ;B49732
    %AICMD0x47($800973, $03)                                   ;B49736
    %AICMD0x10_End()                                           ;B4973B
    %AICMD0x1A($0168, $0098, $B38B40, $00)                     ;B4973C
    %AICMD0x13($00B4)                                          ;B49744
    %AICMD0x1B($032D, $00)                                     ;B49747
    %AICMD0x29($0000, $0001, $10)                              ;B4974B
    %AICMD0x0D($00, $01, $10, $01)                             ;B49751
    %AICMD0x1B($032C, $00)                                     ;B49756
    %AICMD0x13($003C)                                          ;B4975A
    %AICMD0x1B($032E, $00)                                     ;B4975D
    %AICMD0x13($003C)                                          ;B49761
    %AICMD0x1B($032F, $00)                                     ;B49764
    %AICMD0x09($10, $B4978F)                                   ;B49768
    %AICMD0x13($0078)                                          ;B4976C
    %AICMD0x1B($032C, $00)                                     ;B4976F
    %AICMD0x13($003C)                                          ;B49773
    %AICMD0x1B($032D, $00)                                     ;B49776
    %AICMD0x29($0000, $0001, $30)                              ;B4977A
    %AICMD0x0D($00, $01, $30, $01)                             ;B49780
    %AICMD0x13($003C)                                          ;B49785
    %AICMD0x1B($032C, $00)                                     ;B49788
    %AICMD0x0B($01)                                            ;B4978C
    %AICMD0x10_End()                                           ;B4978E
    %AICMD0x1A($0170, $0090, $B38B4C, $00)                     ;B4978F
    %AICMD0x13($003C)                                          ;B49797
    %AICMD0x37()                                               ;B4979A
    %AICMD0x10_End()                                           ;B4979B
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $00, $B497BF)   ;B4979C
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $01, $B49800)   ;B497A3
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $02, $B49841)   ;B497AA
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $03, $B49882)   ;B497B1
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $04, $B498C3)   ;B497B8
    %AICMD0x1A($0178, $0098, $B3866C, $00)                     ;B497BF
    %AICMD0x13($00B4)                                          ;B497C7
    %AICMD0x1B($0331, $00)                                     ;B497CA
    %AICMD0x0D($00, $01, $10, $01)                             ;B497CE
    %AICMD0x1B($0330, $00)                                     ;B497D3
    %AICMD0x13($0040)                                          ;B497D7
    %AICMD0x1B($0332, $00)                                     ;B497DA
    %AICMD0x13($003C)                                          ;B497DE
    %AICMD0x1B($0333, $00)                                     ;B497E1
    %AICMD0x13($0078)                                          ;B497E5
    %AICMD0x1B($0330, $00)                                     ;B497E8
    %AICMD0x13($003C)                                          ;B497EC
    %AICMD0x1B($0331, $00)                                     ;B497EF
    %AICMD0x0D($00, $01, $30, $01)                             ;B497F3
    %AICMD0x0B($02)                                            ;B497F8
    %AICMD0x13($0001)                                          ;B497FA
    %AICMD0x12_Jump($B497FA)                                   ;B497FD
    %AICMD0x1A($0178, $0098, $B38678, $00)                     ;B49800
    %AICMD0x1B($0335, $00)                                     ;B49808
    %AICMD0x13($00B4)                                          ;B4980C
    %AICMD0x0D($00, $01, $10, $01)                             ;B4980F
    %AICMD0x1B($0334, $00)                                     ;B49814
    %AICMD0x13($003C)                                          ;B49818
    %AICMD0x1B($0336, $00)                                     ;B4981B
    %AICMD0x13($003C)                                          ;B4981F
    %AICMD0x1B($0337, $00)                                     ;B49822
    %AICMD0x13($0078)                                          ;B49826
    %AICMD0x1B($0336, $00)                                     ;B49829
    %AICMD0x13($003C)                                          ;B4982D
    %AICMD0x1B($0335, $00)                                     ;B49830
    %AICMD0x0D($00, $01, $30, $01)                             ;B49834
    %AICMD0x0B($02)                                            ;B49839
    %AICMD0x13($0001)                                          ;B4983B
    %AICMD0x12_Jump($B4983B)                                   ;B4983E
    %AICMD0x1A($0178, $0098, $B38684, $00)                     ;B49841
    %AICMD0x1B($0341, $00)                                     ;B49849
    %AICMD0x13($00B4)                                          ;B4984D
    %AICMD0x0D($00, $01, $10, $01)                             ;B49850
    %AICMD0x1B($0340, $00)                                     ;B49855
    %AICMD0x13($003C)                                          ;B49859
    %AICMD0x1B($0342, $00)                                     ;B4985C
    %AICMD0x13($003C)                                          ;B49860
    %AICMD0x1B($0343, $00)                                     ;B49863
    %AICMD0x13($0078)                                          ;B49867
    %AICMD0x1B($0342, $00)                                     ;B4986A
    %AICMD0x13($003C)                                          ;B4986E
    %AICMD0x1B($0341, $00)                                     ;B49871
    %AICMD0x0D($00, $01, $30, $01)                             ;B49875
    %AICMD0x0B($02)                                            ;B4987A
    %AICMD0x13($0001)                                          ;B4987C
    %AICMD0x12_Jump($B4987C)                                   ;B4987F
    %AICMD0x1A($0178, $0098, $B38690, $00)                     ;B49882
    %AICMD0x1B($0339, $00)                                     ;B4988A
    %AICMD0x13($00B4)                                          ;B4988E
    %AICMD0x0D($00, $01, $10, $01)                             ;B49891
    %AICMD0x1B($0338, $00)                                     ;B49896
    %AICMD0x13($003C)                                          ;B4989A
    %AICMD0x1B($033A, $00)                                     ;B4989D
    %AICMD0x13($003C)                                          ;B498A1
    %AICMD0x1B($033B, $00)                                     ;B498A4
    %AICMD0x13($0078)                                          ;B498A8
    %AICMD0x1B($0338, $00)                                     ;B498AB
    %AICMD0x13($003C)                                          ;B498AF
    %AICMD0x1B($0339, $00)                                     ;B498B2
    %AICMD0x0D($00, $01, $30, $01)                             ;B498B6
    %AICMD0x0B($02)                                            ;B498BB
    %AICMD0x13($0001)                                          ;B498BD
    %AICMD0x12_Jump($B498BD)                                   ;B498C0
    %AICMD0x1A($0178, $0098, $B3869C, $00)                     ;B498C3
    %AICMD0x1B($033D, $00)                                     ;B498CB
    %AICMD0x13($00B4)                                          ;B498CF
    %AICMD0x0D($00, $01, $10, $01)                             ;B498D2
    %AICMD0x1B($033C, $00)                                     ;B498D7
    %AICMD0x13($003C)                                          ;B498DB
    %AICMD0x1B($033E, $00)                                     ;B498DE
    %AICMD0x13($003C)                                          ;B498E2
    %AICMD0x1B($033F, $00)                                     ;B498E5
    %AICMD0x13($0078)                                          ;B498E9
    %AICMD0x1B($033E, $00)                                     ;B498EC
    %AICMD0x13($003C)                                          ;B498F0
    %AICMD0x1B($033D, $00)                                     ;B498F3
    %AICMD0x0D($00, $01, $30, $01)                             ;B498F7
    %AICMD0x0B($02)                                            ;B498FC
    %AICMD0x13($0001)                                          ;B498FE
    %AICMD0x12_Jump($B498FE)                                   ;B49901
    %AICMD0x1A($0178, $00D0, $B3863C, $00)                     ;B49904
    %AICMD0x0D($01, $FF, $40, $02)                             ;B4990C
    %AICMD0x0D($01, $00, $20, $02)                             ;B49911
    %AICMD0x0D($01, $01, $40, $02)                             ;B49916
    %AICMD0x37()                                               ;B4991B
    %AICMD0x10_End()                                           ;B4991C
    %AICMD0x1A($0208, $00CC, $B3854C, $03)                     ;B4991D
    %AICMD0x0C($02)                                            ;B49925
    %AICMD0x0D($FD, $00, $30, $03)                             ;B49927
    %AICMD0x0D($FD, $FF, $30, $03)                             ;B4992C
    %AICMD0x0D($FC, $FE, $30, $03)                             ;B49931
    %AICMD0x0D($FC, $FD, $18, $02)                             ;B49936
    %AICMD0x0D($FC, $FC, $18, $02)                             ;B4993B
    %AICMD0x0D($FC, $FB, $14, $02)                             ;B49940
    %AICMD0x0B($03)                                            ;B49945
    %AICMD0x37()                                               ;B49947
    %AICMD0x10_End()                                           ;B49948
    %AICMD0x1A($01F8, $0068, $B3854C, $03)                     ;B49949
    %AICMD0x0C($02)                                            ;B49951
    %AICMD0x13($0028)                                          ;B49953
    %AICMD0x0D($FD, $04, $3C, $03)                             ;B49956
    %AICMD0x0D($FD, $03, $30, $02)                             ;B4995B
    %AICMD0x0D($FD, $02, $40, $02)                             ;B49960
    %AICMD0x0D($FD, $01, $40, $02)                             ;B49965
    %AICMD0x0D($FD, $00, $30, $02)                             ;B4996A
    %AICMD0x0B($03)                                            ;B4996F
    %AICMD0x37()                                               ;B49971
    %AICMD0x10_End()                                           ;B49972
    %AICMD0x1A($0100, $00C8, $B3854C, $02)                     ;B49973
    %AICMD0x0C($02)                                            ;B4997B
    %AICMD0x0D($03, $FF, $30, $02)                             ;B4997D
    %AICMD0x0D($03, $FE, $20, $03)                             ;B49982
    %AICMD0x0D($01, $FF, $40, $01)                             ;B49987
    %AICMD0x0B($03)                                            ;B4998C
    %AICMD0x37()                                               ;B4998E
    %AICMD0x10_End()                                           ;B4998F
    %AICMD0x1A($0196, $0048, $B3854C, $00)                     ;B49990
    %AICMD0x0C($02)                                            ;B49998
    %AICMD0x0D($00, $02, $20, $02)                             ;B4999A
    %AICMD0x0D($FE, $03, $40, $03)                             ;B4999F
    %AICMD0x0D($FE, $03, $90, $02)                             ;B499A4
    %AICMD0x0B($03)                                            ;B499A9
    %AICMD0x37()                                               ;B499AB
    %AICMD0x10_End()                                           ;B499AC
    %AICMD0x1A($00E8, $0028, $B3854C, $00)                     ;B499AD
    %AICMD0x0C($02)                                            ;B499B5
    %AICMD0x0D($00, $02, $40, $02)                             ;B499B7
    %AICMD0x0D($01, $03, $40, $03)                             ;B499BC
    %AICMD0x0D($02, $03, $40, $03)                             ;B499C1
    %AICMD0x0D($03, $03, $58, $03)                             ;B499C6
    %AICMD0x0B($03)                                            ;B499CB
    %AICMD0x37()                                               ;B499CD
    %AICMD0x10_End()                                           ;B499CE
    %AICMD0x1A($0140, $0098, $B38360, $02)                     ;B499CF
    %AICMD0x13($0001)                                          ;B499D7
    %AICMD0x12_Jump($B499D7)                                   ;B499DA
    %AICMD0x1A($0198, $0098, $B3830C, $03)                     ;B499DD
    %AICMD0x13($0001)                                          ;B499E5
    %AICMD0x12_Jump($B499E5)                                   ;B499E8
    %AICMD0x1A($0148, $00C8, $B38408, $02)                     ;B499EB
    %AICMD0x13($0001)                                          ;B499F3
    %AICMD0x12_Jump($B499F3)                                   ;B499F6
    %AICMD0x1A($0138, $00D8, $B38324, $02)                     ;B499F9
    %AICMD0x13($0001)                                          ;B49A01
    %AICMD0x12_Jump($B49A01)                                   ;B49A04
    %AICMD0x1A($0190, $00C8, $B38378, $03)                     ;B49A07
    %AICMD0x13($0001)                                          ;B49A0F
    %AICMD0x12_Jump($B49A0F)                                   ;B49A12
    %AICMD0x1A($01A8, $00B0, $B3833C, $03)                     ;B49A15
    %AICMD0x13($0001)                                          ;B49A1D
    %AICMD0x12_Jump($B49A1D)                                   ;B49A20
    %AICMD0x1A($0148, $00F8, $B38B28, $00)                     ;B49A23
    %AICMD0x13($00B4)                                          ;B49A2B
    %AICMD0x12_Jump($B49A2B)                                   ;B49A2E
    %AICMD0x1A($0198, $00F8, $B38B34, $00)                     ;B49A31
    %AICMD0x13($00B4)                                          ;B49A39
    %AICMD0x12_Jump($B49A39)                                   ;B49A3C

pScripting_B49A3F:
    dw DATA8_B49A5F                                            ;B49A3F|        |B49A5F;
    dw DATA8_B49C2A                                            ;B49A41|        |B49C2A;
    dw DATA8_B49DD5                                            ;B49A43|        |B49DD5;
    dw pScripting_B49E31                                       ;B49A45|        |B49E31;
    dw pScripting_B49E31                                       ;B49A47|        |B49E31;
    dw pScripting_B49E31                                       ;B49A49|        |B49E31;
    dw pScripting_B49E31                                       ;B49A4B|        |B49E31;
    dw pScripting_B49E31                                       ;B49A4D|        |B49E31;
    dw pScripting_B49E31                                       ;B49A4F|        |B49E31;
    dw pScripting_B49E31                                       ;B49A51|        |B49E31;
    dw pScripting_B49E31                                       ;B49A53|        |B49E31;
    dw pScripting_B49E31                                       ;B49A55|        |B49E31;
    dw pScripting_B49E31                                       ;B49A57|        |B49E31;
    dw pScripting_B49E31                                       ;B49A59|        |B49E31;
    dw pScripting_B49E31                                       ;B49A5B|        |B49E31;
    dw pScripting_B49E31                                       ;B49A5D|        |B49E31;
 
DATA8_B49A5F:
 
    %AICMD0x50()                                               ;B49A5F
    %AICMD0x23_OrWithIndexedValue($7F1F5E, $0D)                ;B49A60
    %AICMD0x09($01, $B49AE0)                                   ;B49A65
    %AICMD0x09($02, $B49B97)                                   ;B49A69
    %AICMD0x09($03, $B49B74)                                   ;B49A6D
    %AICMD0x12_Jump($B49A97)                                   ;B49A71
    %AICMD0x55($7F1F6E, $02, $9A89)                            ;B49A74
    %AICMD0x45($7F1F37, $0000, $003C, $B49A89)                 ;B49A7B
    %AICMD0x09($05, $B49D57)                                   ;B49A85
    %AICMD0x38()                                               ;B49A89
    %AICMD0x0C($00)                                            ;B49A8A
    %AICMD0x13($0E10)                                          ;B49A8C
    %AICMD0x23_OrWithIndexedValue($7F1F5E, $0D)                ;B49A8F
    %AICMD0x3D($17)                                            ;B49A94
    %AICMD0x10_End()                                           ;B49A96
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $00, $B49ABD)   ;B49A97
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $01, $B49AC4)   ;B49A9E
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $02, $B49ACB)   ;B49AA5
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $03, $B49AD2)   ;B49AAC
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $04, $B49AD9)   ;B49AB3
    %AICMD0x12_Jump($B49A74)                                   ;B49ABA
    %AICMD0x09($04, $B49BAC)                                   ;B49ABD
    %AICMD0x12_Jump($B49A74)                                   ;B49AC1
    %AICMD0x09($04, $B49BC8)                                   ;B49AC4
    %AICMD0x12_Jump($B49A74)                                   ;B49AC8
    %AICMD0x09($04, $B49BE4)                                   ;B49ACB
    %AICMD0x12_Jump($B49A74)                                   ;B49ACF
    %AICMD0x09($04, $B49BF9)                                   ;B49AD2
    %AICMD0x12_Jump($B49A74)                                   ;B49AD6
    %AICMD0x09($04, $B49C15)                                   ;B49AD9
    %AICMD0x12_Jump($B49A74)                                   ;B49ADD
    %AICMD0x1A($0119, $0063, $B38B58, $00)                     ;B49AE0
    %AICMD0x1F($9AF4)                                          ;B49AE8
    %AICMD0x12_Jump($B49AE8)                                   ;B49AEB
    %AICMD0x1F($9B40)                                          ;B49AEE
    %AICMD0x12_Jump($B49AEE)                                   ;B49AF1
    %AICMD0x0B($00)                                            ;B49AF4
    %AICMD0x1D($01AA, $00)                                     ;B49AF6
    %AICMD0x20($00, $9B05)                                     ;B49AFA
    %AICMD0x20($01, $9B12)                                     ;B49AFE
    %AICMD0x12_Jump($B49AE8)                                   ;B49B02
    %AICMD0x1C($01AB, $00)                                     ;B49B05
    %AICMD0x25($03)                                            ;B49B09
    %AICMD0x09($03, $B49B89)                                   ;B49B0B
    %AICMD0x12_Jump($B49AEE)                                   ;B49B0F
    %AICMD0x1C($01AC, $00)                                     ;B49B12
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $00, $B49B47)   ;B49B16
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $01, $B49B50)   ;B49B1D
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $02, $B49B59)   ;B49B24
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $03, $B49B62)   ;B49B2B
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $04, $B49B6B)   ;B49B32
    %AICMD0x1B($02E9, $00)                                     ;B49B39
    %AICMD0x12_Jump($B49AEE)                                   ;B49B3D
    %AICMD0x1C($01AD, $00)                                     ;B49B40
    %AICMD0x12_Jump($B49AEE)                                   ;B49B44
    %AICMD0x41_ModifyVariable($7F1F1F, $0032)                  ;B49B47
    %AICMD0x12_Jump($B49B39)                                   ;B49B4D
    %AICMD0x41_ModifyVariable($7F1F21, $0032)                  ;B49B50
    %AICMD0x12_Jump($B49B39)                                   ;B49B56
    %AICMD0x41_ModifyVariable($7F1F23, $0032)                  ;B49B59
    %AICMD0x12_Jump($B49B39)                                   ;B49B5F
    %AICMD0x41_ModifyVariable($7F1F25, $0032)                  ;B49B62
    %AICMD0x12_Jump($B49B39)                                   ;B49B68
    %AICMD0x41_ModifyVariable($7F1F27, $0032)                  ;B49B6B
    %AICMD0x12_Jump($B49B39)                                   ;B49B71
    %AICMD0x1A($0080, $00C8, $B38354, $01)                     ;B49B74
    %AICMD0x1F($9B82)                                          ;B49B7C
    %AICMD0x12_Jump($B49B7C)                                   ;B49B7F
    %AICMD0x1C($0280, $00)                                     ;B49B82
    %AICMD0x12_Jump($B49B7C)                                   ;B49B86
    %AICMD0x1A($0060, $00B0, $B38354, $00)                     ;B49B89
    %AICMD0x13($0001)                                          ;B49B91
    %AICMD0x12_Jump($B49B7C)                                   ;B49B94
    %AICMD0x1A($0128, $0078, $B382F4, $03)                     ;B49B97
    %AICMD0x1F($9BA5)                                          ;B49B9F
    %AICMD0x12_Jump($B49B9F)                                   ;B49BA2
    %AICMD0x1D($01A9, $00)                                     ;B49BA5
    %AICMD0x12_Jump($B49B9F)                                   ;B49BA9
    %AICMD0x1A($0148, $0068, $B38300, $00)                     ;B49BAC
    %AICMD0x22($10, $10, $01, $B3830C, $00)                    ;B49BB4
    %AICMD0x1F($9BC1)                                          ;B49BBB
    %AICMD0x12_Jump($B49BBB)                                   ;B49BBE
    %AICMD0x1C($01AE, $00)                                     ;B49BC1
    %AICMD0x12_Jump($B49BBB)                                   ;B49BC5
    %AICMD0x1A($0148, $0088, $B38318, $00)                     ;B49BC8
    %AICMD0x22($10, $10, $01, $B38324, $08)                    ;B49BD0
    %AICMD0x1F($9BDD)                                          ;B49BD7
    %AICMD0x12_Jump($B49BD7)                                   ;B49BDA
    %AICMD0x1C($01AF, $00)                                     ;B49BDD
    %AICMD0x12_Jump($B49BD7)                                   ;B49BE1
    %AICMD0x1A($0148, $0068, $B383FC, $00)                     ;B49BE4
    %AICMD0x1F($9BF2)                                          ;B49BEC
    %AICMD0x12_Jump($B49BEC)                                   ;B49BEF
    %AICMD0x1C($01B0, $00)                                     ;B49BF2
    %AICMD0x12_Jump($B49BEC)                                   ;B49BF6
    %AICMD0x1A($0148, $0078, $B3833C, $00)                     ;B49BF9
    %AICMD0x22($10, $10, $01, $B3833C, $08)                    ;B49C01
    %AICMD0x1F($9C0E)                                          ;B49C08
    %AICMD0x12_Jump($B49C08)                                   ;B49C0B
    %AICMD0x1C($01B1, $00)                                     ;B49C0E
    %AICMD0x12_Jump($B49C08)                                   ;B49C12
    %AICMD0x1A($0148, $0068, $B382D0, $00)                     ;B49C15
    %AICMD0x1F($9C23)                                          ;B49C1D
    %AICMD0x12_Jump($B49C1D)                                   ;B49C20
    %AICMD0x1C($01B2, $00)                                     ;B49C23
    %AICMD0x12_Jump($B49C1D)                                   ;B49C27

DATA8_B49C2A:
 
    %AICMD0x50()                                               ;B49C2A
    %AICMD0x00_SetMusic($0B, $B4)                              ;B49C2B
    %AICMD0x05_SetPosition($0088, $00B8)                       ;B49C2E
    %AICMD0x07_SetPlayerDirection($01)                         ;B49C33
    %AICMD0x08()                                               ;B49C35
    %AICMD0x09($01, $B49CBD)                                   ;B49C36
    %AICMD0x09($02, $B49CD4)                                   ;B49C3A
    %AICMD0x09($03, $B49D34)                                   ;B49C3E
    %AICMD0x09($04, $B49D49)                                   ;B49C42
    %AICMD0x12_Jump($B49C74)                                   ;B49C46
    %AICMD0x55($7F1F6E, $02, $9C5E)                            ;B49C49
    %AICMD0x45($7F1F37, $0000, $003C, $B49C5E)                 ;B49C50
    %AICMD0x09($05, $B49D57)                                   ;B49C5A
    %AICMD0x38()                                               ;B49C5E
    %AICMD0x13($0001)                                          ;B49C5F
    %AICMD0x1C($01B3, $01)                                     ;B49C62
    %AICMD0x11()                                               ;B49C66
    %AICMD0x0C($00)                                            ;B49C67
    %AICMD0x23_OrWithIndexedValue($800196, $0D)                ;B49C69
    %AICMD0x23_OrWithIndexedValue($7F1F5E, $0E)                ;B49C6E
    %AICMD0x10_End()                                           ;B49C73
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $00, $B49C9A)   ;B49C74
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $01, $B49CA1)   ;B49C7B
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $02, $B49CA8)   ;B49C82
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $03, $B49CAF)   ;B49C89
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $04, $B49CB6)   ;B49C90
    %AICMD0x12_Jump($B49C49)                                   ;B49C97
    %AICMD0x09($06, $B49D6C)                                   ;B49C9A
    %AICMD0x12_Jump($B49C49)                                   ;B49C9E
    %AICMD0x09($06, $B49D81)                                   ;B49CA1
    %AICMD0x12_Jump($B49C49)                                   ;B49CA5
    %AICMD0x09($06, $B49D96)                                   ;B49CA8
    %AICMD0x12_Jump($B49C49)                                   ;B49CAC
    %AICMD0x09($06, $B49DAB)                                   ;B49CAF
    %AICMD0x12_Jump($B49C49)                                   ;B49CB3
    %AICMD0x09($06, $B49DC0)                                   ;B49CB6
    %AICMD0x12_Jump($B49C49)                                   ;B49CBA
    %AICMD0x1A($0119, $0063, $B3845C, $00)                     ;B49CBD
    %AICMD0x1F($9CCB)                                          ;B49CC5
    %AICMD0x12_Jump($B49CC5)                                   ;B49CC8
    %AICMD0x1C($01BA, $00)                                     ;B49CCB
    %AICMD0x0B($00)                                            ;B49CCF
    %AICMD0x12_Jump($B49CC5)                                   ;B49CD1
    %AICMD0x1A($0138, $0068, $B382E8, $03)                     ;B49CD4
    %AICMD0x1F($9CFD)                                          ;B49CDC
    %AICMD0x12_Jump($B49CDC)                                   ;B49CDF
    %AICMD0x1F($9CE8)                                          ;B49CE2
    %AICMD0x12_Jump($B49CE2)                                   ;B49CE5
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F74, $00, $B49CF6)   ;B49CE8
    %AICMD0x1C($0281, $00)                                     ;B49CEF
    %AICMD0x12_Jump($B49CE2)                                   ;B49CF3
    %AICMD0x1C($01B4, $00)                                     ;B49CF6
    %AICMD0x12_Jump($B49CE2)                                   ;B49CFA
    %AICMD0x17($02)                                            ;B49CFD
    %AICMD0x18($00, $B49D0A)                                   ;B49CFF
    %AICMD0x18($01, $B49D16)                                   ;B49D03
    %AICMD0x12_Jump($B49CDC)                                   ;B49D07
    %AICMD0x1C($01B4, $00)                                     ;B49D0A
    %AICMD0x23_OrWithIndexedValue($7F1F74, $00)                ;B49D0E
    %AICMD0x12_Jump($B49D22)                                   ;B49D13
    %AICMD0x1C($0281, $00)                                     ;B49D16
    %AICMD0x23_OrWithIndexedValue($7F1F74, $01)                ;B49D1A
    %AICMD0x12_Jump($B49D22)                                   ;B49D1F
    %AICMD0x08()                                               ;B49D22
    %AICMD0x1B($028D, $01)                                     ;B49D23
    %AICMD0x0D($01, $00, $30, $01)                             ;B49D27
    %AICMD0x1B($028C, $01)                                     ;B49D2C
    %AICMD0x11()                                               ;B49D30
    %AICMD0x12_Jump($B49CE2)                                   ;B49D31
    %AICMD0x1A($0080, $00C8, $B38354, $02)                     ;B49D34
    %AICMD0x1F($9D42)                                          ;B49D3C
    %AICMD0x12_Jump($B49D3C)                                   ;B49D3F
    %AICMD0x1C($027F, $00)                                     ;B49D42
    %AICMD0x12_Jump($B49D3C)                                   ;B49D46
    %AICMD0x1A($0108, $0060, $B38654, $00)                     ;B49D49
    %AICMD0x13($0001)                                          ;B49D51
    %AICMD0x12_Jump($B49D51)                                   ;B49D54
    %AICMD0x1A($0178, $0058, $B384B0, $00)                     ;B49D57
    %AICMD0x1F($9D65)                                          ;B49D5F
    %AICMD0x12_Jump($B49D5F)                                   ;B49D62
    %AICMD0x1C($01C1, $00)                                     ;B49D65
    %AICMD0x12_Jump($B49D5F)                                   ;B49D69
    %AICMD0x1A($0128, $0078, $B3830C, $00)                     ;B49D6C
    %AICMD0x1F($9D7A)                                          ;B49D74
    %AICMD0x12_Jump($B49D74)                                   ;B49D77
    %AICMD0x1C($01B5, $00)                                     ;B49D7A
    %AICMD0x12_Jump($B49D74)                                   ;B49D7E
    %AICMD0x1A($0128, $0078, $B38324, $00)                     ;B49D81
    %AICMD0x1F($9D8F)                                          ;B49D89
    %AICMD0x12_Jump($B49D89)                                   ;B49D8C
    %AICMD0x1C($01B6, $00)                                     ;B49D8F
    %AICMD0x12_Jump($B49D89)                                   ;B49D93
    %AICMD0x1A($0128, $0078, $B38408, $00)                     ;B49D96
    %AICMD0x1F($9DA4)                                          ;B49D9E
    %AICMD0x12_Jump($B49D9E)                                   ;B49DA1
    %AICMD0x1C($01B7, $00)                                     ;B49DA4
    %AICMD0x12_Jump($B49D9E)                                   ;B49DA8
    %AICMD0x1A($0128, $0078, $B3833C, $00)                     ;B49DAB
    %AICMD0x1F($9DB9)                                          ;B49DB3
    %AICMD0x12_Jump($B49DB3)                                   ;B49DB6
    %AICMD0x1C($01B8, $00)                                     ;B49DB9
    %AICMD0x12_Jump($B49DB3)                                   ;B49DBD
    %AICMD0x1A($0128, $0078, $B382D0, $00)                     ;B49DC0
    %AICMD0x1F($9DCE)                                          ;B49DC8
    %AICMD0x12_Jump($B49DC8)                                   ;B49DCB
    %AICMD0x1C($01B9, $00)                                     ;B49DCE
    %AICMD0x12_Jump($B49DC8)                                   ;B49DD2

DATA8_B49DD5:
 
    %AICMD0x50()                                               ;B49DD5
    %AICMD0x08()                                               ;B49DD6
    %AICMD0x05_SetPosition($0128, $0068)                       ;B49DD7
    %AICMD0x07_SetPlayerDirection($03)                         ;B49DDC
    %AICMD0x09($01, $B49E15)                                   ;B49DDE
    %AICMD0x09($02, $B49E23)                                   ;B49DE2
    %AICMD0x55($7F1F6E, $02, $9DFB)                            ;B49DE6
    %AICMD0x45($7F1F37, $0000, $003C, $B49DFB)                 ;B49DED
    %AICMD0x09($05, $B49D57)                                   ;B49DF7
    %AICMD0x38()                                               ;B49DFB
    %AICMD0x1C($01BB, $00)                                     ;B49DFC
    %AICMD0x01_UnfreezeTime()                                  ;B49E00
    %AICMD0x24($74)                                            ;B49E01
    %AICMD0x13($00B4)                                          ;B49E03
    %AICMD0x1C($01BC, $00)                                     ;B49E06
    %AICMD0x28($1F6E, $7F, $04)                                ;B49E0A
    %AICMD0x47($800973, $03)                                   ;B49E0F
    %AICMD0x10_End()                                           ;B49E14
    %AICMD0x1A($0119, $0063, $B3845C, $02)                     ;B49E15
    %AICMD0x13($0001)                                          ;B49E1D
    %AICMD0x12_Jump($B49E1D)                                   ;B49E20
    %AICMD0x1A($0108, $0060, $B38654, $00)                     ;B49E23
    %AICMD0x13($0001)                                          ;B49E2B
    %AICMD0x12_Jump($B49E2B)                                   ;B49E2E

pScripting_B49E31:
    dw DATA8_B49E51                                            ;B49E31|        |B49E51;
    dw pScripting_B49F13                                       ;B49E33|        |B49F13;
    dw pScripting_B49F13                                       ;B49E35|        |B49F13;
    dw pScripting_B49F13                                       ;B49E37|        |B49F13;
    dw pScripting_B49F13                                       ;B49E39|        |B49F13;
    dw pScripting_B49F13                                       ;B49E3B|        |B49F13;
    dw pScripting_B49F13                                       ;B49E3D|        |B49F13;
    dw pScripting_B49F13                                       ;B49E3F|        |B49F13;
    dw pScripting_B49F13                                       ;B49E41|        |B49F13;
    dw pScripting_B49F13                                       ;B49E43|        |B49F13;
    dw pScripting_B49F13                                       ;B49E45|        |B49F13;
    dw pScripting_B49F13                                       ;B49E47|        |B49F13;
    dw pScripting_B49F13                                       ;B49E49|        |B49F13;
    dw pScripting_B49F13                                       ;B49E4B|        |B49F13;
    dw pScripting_B49F13                                       ;B49E4D|        |B49F13;
    dw pScripting_B49F13                                       ;B49E4F|        |B49F13;
 
DATA8_B49E51:
 
    %AICMD0x50()                                               ;B49E51
    %AICMD0x23_OrWithIndexedValue($7F1F60, $09)                ;B49E52
    %AICMD0x23_OrWithIndexedValue($7F1F5E, $02)                ;B49E57
    %AICMD0x00_SetMusic($0C, $B4)                              ;B49E5C
    %AICMD0x01_UnfreezeTime()                                  ;B49E5F
    %AICMD0x03_SetHour($0E)                                    ;B49E60
    %AICMD0x05_SetPosition($01B8, $00A0)                       ;B49E62
    %AICMD0x07_SetPlayerDirection($01)                         ;B49E67
    %AICMD0x08()                                               ;B49E69
    %AICMD0x09($01, $B49EC6)                                   ;B49E6A
    %AICMD0x09($02, $B49EDF)                                   ;B49E6E
    %AICMD0x15($7F1F19, $00, $B49E8E)                          ;B49E72
    %AICMD0x15($7F1F19, $01, $B49E93)                          ;B49E79
    %AICMD0x15($7F1F19, $02, $B49E98)                          ;B49E80
    %AICMD0x15($7F1F19, $03, $B49E9D)                          ;B49E87
    %AICMD0x06_SetDestination($04)                             ;B49E8E
    %AICMD0x12_Jump($B49EA2)                                   ;B49E90
    %AICMD0x06_SetDestination($05)                             ;B49E93
    %AICMD0x12_Jump($B49EA2)                                   ;B49E95
    %AICMD0x06_SetDestination($06)                             ;B49E98
    %AICMD0x12_Jump($B49EA2)                                   ;B49E9A
    %AICMD0x06_SetDestination($07)                             ;B49E9D
    %AICMD0x12_Jump($B49EA2)                                   ;B49E9F
    %AICMD0x38()                                               ;B49EA2
    %AICMD0x0B($00)                                            ;B49EA3
    %AICMD0x0C($02)                                            ;B49EA5
    %AICMD0x19($0025, $00)                                     ;B49EA7
    %AICMD0x13($00B4)                                          ;B49EAB
    %AICMD0x01_UnfreezeTime()                                  ;B49EAE
    %AICMD0x24($74)                                            ;B49EAF
    %AICMD0x13($00B4)                                          ;B49EB1
    %AICMD0x1C($038A, $00)                                     ;B49EB4
    %AICMD0x41_ModifyVariable($7F1F33, $FF9C)                  ;B49EB8
    %AICMD0x03_SetHour($0F)                                    ;B49EBE
    %AICMD0x47($800973, $03)                                   ;B49EC0
    %AICMD0x10_End()                                           ;B49EC5
    %AICMD0x1A($0198, $0098, $B38354, $02)                     ;B49EC6
    %AICMD0x0C($00)                                            ;B49ECE
    %AICMD0x13($0078)                                          ;B49ED0
    %AICMD0x1C($0315, $00)                                     ;B49ED3
    %AICMD0x0B($01)                                            ;B49ED7
    %AICMD0x1F($9ECE)                                          ;B49ED9
    %AICMD0x12_Jump($B49ED9)                                   ;B49EDC
    %AICMD0x1A($01F8, $0090, $B3836C, $03)                     ;B49EDF
    %AICMD0x0C($01)                                            ;B49EE7
    %AICMD0x1B($02B0, $00)                                     ;B49EE9
    %AICMD0x0D($FF, $00, $30, $01)                             ;B49EED
    %AICMD0x1B($02AB, $00)                                     ;B49EF2
    %AICMD0x13($0078)                                          ;B49EF6
    %AICMD0x1C($0316, $00)                                     ;B49EF9
    %AICMD0x1B($02B0, $01)                                     ;B49EFD
    %AICMD0x0D($01, $00, $30, $01)                             ;B49F01
    %AICMD0x1B($02AC, $00)                                     ;B49F06
    %AICMD0x0D($00, $01, $90, $01)                             ;B49F0A
    %AICMD0x0B($02)                                            ;B49F0F
    %AICMD0x37()                                               ;B49F11
    %AICMD0x10_End()                                           ;B49F12

pScripting_B49F13:
    dw DATA8_B49F33                                            ;B49F13|        |B49F33;
    dw pScripting_B49FD8                                       ;B49F15|        |B49FD8;
    dw pScripting_B49FD8                                       ;B49F17|        |B49FD8;
    dw pScripting_B49FD8                                       ;B49F19|        |B49FD8;
    dw pScripting_B49FD8                                       ;B49F1B|        |B49FD8;
    dw pScripting_B49FD8                                       ;B49F1D|        |B49FD8;
    dw pScripting_B49FD8                                       ;B49F1F|        |B49FD8;
    dw pScripting_B49FD8                                       ;B49F21|        |B49FD8;
    dw pScripting_B49FD8                                       ;B49F23|        |B49FD8;
    dw pScripting_B49FD8                                       ;B49F25|        |B49FD8;
    dw pScripting_B49FD8                                       ;B49F27|        |B49FD8;
    dw pScripting_B49FD8                                       ;B49F29|        |B49FD8;
    dw pScripting_B49FD8                                       ;B49F2B|        |B49FD8;
    dw pScripting_B49FD8                                       ;B49F2D|        |B49FD8;
    dw pScripting_B49FD8                                       ;B49F2F|        |B49FD8;
    dw pScripting_B49FD8                                       ;B49F31|        |B49FD8;
 
DATA8_B49F33:
 
    %AICMD0x09($13, $B49FB3)                                   ;B49F33
    %AICMD0x10_End()                                           ;B49F37
    %AICMD0x1A($0108, $01A8, $B382C4, $03)                     ;B49F38
    %AICMD0x1B($0281, $00)                                     ;B49F40
    %AICMD0x0D($FF, $00, $70, $01)                             ;B49F44
    %AICMD0x1B($0280, $00)                                     ;B49F49
    %AICMD0x1D($0330, $00)                                     ;B49F4D
    %AICMD0x20($00, $9F5F)                                     ;B49F51
    %AICMD0x20($01, $9F6E)                                     ;B49F55
    %AICMD0x12_Jump($B49F5C)                                   ;B49F59
    %AICMD0x12_Jump($B49F5C)                                   ;B49F5C
    %AICMD0x1D($0331, $00)                                     ;B49F5F
    %AICMD0x20($00, $9F7B)                                     ;B49F63
    %AICMD0x20($01, $9F88)                                     ;B49F67
    %AICMD0x12_Jump($B49F5C)                                   ;B49F6B
    %AICMD0x1C($0332, $00)                                     ;B49F6E
    %AICMD0x41_ModifyVariable($7F1F33, $FFF6)                  ;B49F72
    %AICMD0x12_Jump($B49F9D)                                   ;B49F78
    %AICMD0x1C($0333, $00)                                     ;B49F7B
    %AICMD0x41_ModifyVariable($7F1F33, $0032)                  ;B49F7F
    %AICMD0x12_Jump($B49F8F)                                   ;B49F85
    %AICMD0x1C($0334, $00)                                     ;B49F88
    %AICMD0x12_Jump($B49F9D)                                   ;B49F8C
    %AICMD0x0B($03)                                            ;B49F8F
    %AICMD0x1B($0281, $01)                                     ;B49F91
    %AICMD0x0D($01, $00, $70, $01)                             ;B49F95
    %AICMD0x37()                                               ;B49F9A
    %AICMD0x11()                                               ;B49F9B
    %AICMD0x10_End()                                           ;B49F9C
    %AICMD0x0D($FF, $00, $30, $01)                             ;B49F9D
    %AICMD0x25($13)                                            ;B49FA2
    %AICMD0x13($000A)                                          ;B49FA4
    %AICMD0x1B($0284, $00)                                     ;B49FA7
    %AICMD0x0D($01, $00, $A0, $01)                             ;B49FAB
    %AICMD0x37()                                               ;B49FB0
    %AICMD0x11()                                               ;B49FB1
    %AICMD0x10_End()                                           ;B49FB2
    %AICMD0x1A($0068, $01A8, $B38798, $00)                     ;B49FB3
    %AICMD0x1F($9FC1)                                          ;B49FBB
    %AICMD0x12_Jump($B49FBB)                                   ;B49FBE
    %AICMD0x08()                                               ;B49FC1
    %AICMD0x23_OrWithIndexedValue($7F1F6A, $09)                ;B49FC2
    %AICMD0x09($09, $B49F38)                                   ;B49FC7
    %AICMD0x0C($03)                                            ;B49FCB
    %AICMD0x1B($0303, $00)                                     ;B49FCD
    %AICMD0x0D($FF, $00, $3A, $01)                             ;B49FD1
    %AICMD0x37()                                               ;B49FD6
    %AICMD0x10_End()                                           ;B49FD7

pScripting_B49FD8:
    dw DATA8_B49FF8                                            ;B49FD8|        |B49FF8;
    dw DATA8_B4A045                                            ;B49FDA|        |B4A045;
    dw DATA8_B4A091                                            ;B49FDC|        |B4A091;
    dw DATA8_B4A0B6                                            ;B49FDE|        |B4A0B6;
    dw DATA8_B4A0D2                                            ;B49FE0|        |B4A0D2;
    dw DATA8_B4A11E                                            ;B49FE2|        |B4A11E;
    dw DATA8_B4A141                                            ;B49FE4|        |B4A141;
    dw DATA8_B4A1BC                                            ;B49FE6|        |B4A1BC;
    dw DATA8_B4A1D8                                            ;B49FE8|        |B4A1D8;
    dw DATA8_B4A278                                            ;B49FEA|        |B4A278;
    dw DATA8_B4A297                                            ;B49FEC|        |B4A297;
    dw DATA8_B4A301                                            ;B49FEE|        |B4A301;
    dw DATA8_B4A321                                            ;B49FF0|        |B4A321;
    dw pScripting_B4A37F                                       ;B49FF2|        |B4A37F;
    dw pScripting_B4A37F                                       ;B49FF4|        |B4A37F;
    dw pScripting_B4A37F                                       ;B49FF6|        |B4A37F;
 
DATA8_B49FF8:
 
    %AICMD0x50()                                               ;B49FF8
    %AICMD0x07_SetPlayerDirection($02)                         ;B49FF9
    %AICMD0x08()                                               ;B49FFB
    %AICMD0x09($01, $B4A012)                                   ;B49FFC
    %AICMD0x38()                                               ;B4A000
    %AICMD0x0B($00)                                            ;B4A001
    %AICMD0x13($0096)                                          ;B4A003
    %AICMD0x07_SetPlayerDirection($00)                         ;B4A006
    %AICMD0x0C($01)                                            ;B4A008
    %AICMD0x11()                                               ;B4A00A
    %AICMD0x41_ModifyVariable($7F1F33, $FFCE)                  ;B4A00B
    %AICMD0x10_End()                                           ;B4A011
    %AICMD0x1A($00A8, $0078, $B3845C, $03)                     ;B4A012
    %AICMD0x0C($00)                                            ;B4A01A
    %AICMD0x13($005A)                                          ;B4A01C
    %AICMD0x1C($019A, $00)                                     ;B4A01F
    %AICMD0x1B($02E3, $00)                                     ;B4A023
    %AICMD0x0D($00, $01, $50, $01)                             ;B4A027
    %AICMD0x1B($02E7, $00)                                     ;B4A02C
    %AICMD0x0D($FF, $00, $28, $01)                             ;B4A030
    %AICMD0x1B($02E3, $00)                                     ;B4A035
    %AICMD0x0D($00, $01, $30, $01)                             ;B4A039
    %AICMD0x13($003C)                                          ;B4A03E
    %AICMD0x0B($01)                                            ;B4A041
    %AICMD0x37()                                               ;B4A043
    %AICMD0x10_End()                                           ;B4A044

DATA8_B4A045:
 
    %AICMD0x50()                                               ;B4A045
    %AICMD0x05_SetPosition($0088, $0078)                       ;B4A046
    %AICMD0x07_SetPlayerDirection($02)                         ;B4A04B
    %AICMD0x08()                                               ;B4A04D
    %AICMD0x09($01, $B4A05E)                                   ;B4A04E
    %AICMD0x38()                                               ;B4A052
    %AICMD0x0B($00)                                            ;B4A053
    %AICMD0x13($0096)                                          ;B4A055
    %AICMD0x07_SetPlayerDirection($00)                         ;B4A058
    %AICMD0x0C($01)                                            ;B4A05A
    %AICMD0x11()                                               ;B4A05C
    %AICMD0x10_End()                                           ;B4A05D
    %AICMD0x1A($00A8, $0078, $B3845C, $03)                     ;B4A05E
    %AICMD0x0C($00)                                            ;B4A066
    %AICMD0x13($005A)                                          ;B4A068
    %AICMD0x1C($019A, $00)                                     ;B4A06B
    %AICMD0x1B($02E3, $00)                                     ;B4A06F
    %AICMD0x0D($00, $01, $50, $01)                             ;B4A073
    %AICMD0x1B($02E7, $00)                                     ;B4A078
    %AICMD0x0D($FF, $00, $28, $01)                             ;B4A07C
    %AICMD0x1B($02E3, $00)                                     ;B4A081
    %AICMD0x0D($00, $01, $30, $01)                             ;B4A085
    %AICMD0x13($003C)                                          ;B4A08A
    %AICMD0x0B($01)                                            ;B4A08D
    %AICMD0x37()                                               ;B4A08F
    %AICMD0x10_End()                                           ;B4A090

DATA8_B4A091:
 
    %AICMD0x50()                                               ;B4A091
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F6A, $00, $B4A0B6)   ;B4A092
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F6A, $01, $B4A0D2)   ;B4A099
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F6A, $02, $B4A11E)   ;B4A0A0
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F6A, $03, $B4A141)   ;B4A0A7
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F6A, $04, $B4A1BC)   ;B4A0AE
    %AICMD0x10_End()                                           ;B4A0B5

DATA8_B4A0B6:
 
    %AICMD0x50()                                               ;B4A0B6
    %AICMD0x09($01, $B4A0BD)                                   ;B4A0B7
    %AICMD0x38()                                               ;B4A0BB
    %AICMD0x10_End()                                           ;B4A0BC
    %AICMD0x1A($0158, $0058, $B383D8, $00)                     ;B4A0BD
    %AICMD0x1F($A0CB)                                          ;B4A0C5
    %AICMD0x12_Jump($B4A0C5)                                   ;B4A0C8
    %AICMD0x1C($01D8, $00)                                     ;B4A0CB
    %AICMD0x12_Jump($B4A0C5)                                   ;B4A0CF

DATA8_B4A0D2:
 
    %AICMD0x50()                                               ;B4A0D2
    %AICMD0x08()                                               ;B4A0D3
    %AICMD0x09($01, $B4A0EC)                                   ;B4A0D4
    %AICMD0x38()                                               ;B4A0D8
    %AICMD0x39($00, $0010)                                     ;B4A0D9
    %AICMD0x39($03, $0014)                                     ;B4A0DD
    %AICMD0x0B($00)                                            ;B4A0E1
    %AICMD0x0C($01)                                            ;B4A0E3
    %AICMD0x28($1F6E, $7F, $01)                                ;B4A0E5
    %AICMD0x3C()                                               ;B4A0EA
    %AICMD0x10_End()                                           ;B4A0EB
    %AICMD0x1A($0058, $0168, $B3845C, $03)                     ;B4A0EC
    %AICMD0x0C($00)                                            ;B4A0F4
    %AICMD0x13($003C)                                          ;B4A0F6
    %AICMD0x1B($02E7, $01)                                     ;B4A0F9
    %AICMD0x0D($01, $00, $20, $01)                             ;B4A0FD
    %AICMD0x1C($019B, $00)                                     ;B4A102
    %AICMD0x41_ModifyVariable($7F1F1F, $0064)                  ;B4A106
    %AICMD0x1B($02F0, $01)                                     ;B4A10C
    %AICMD0x13($003C)                                          ;B4A110
    %AICMD0x0B($01)                                            ;B4A113
    %AICMD0x12_Jump($B4A118)                                   ;B4A115
    %AICMD0x13($0001)                                          ;B4A118
    %AICMD0x12_Jump($B4A118)                                   ;B4A11B

DATA8_B4A11E:
 
    %AICMD0x50()                                               ;B4A11E
    %AICMD0x09($01, $B4A125)                                   ;B4A11F
    %AICMD0x38()                                               ;B4A123
    %AICMD0x10_End()                                           ;B4A124
    %AICMD0x1A($0028, $0164, $B38324, $00)                     ;B4A125
    %AICMD0x22($01, $01, $01, $B38324, $01)                    ;B4A12D
    %AICMD0x1F($A13A)                                          ;B4A134
    %AICMD0x12_Jump($B4A134)                                   ;B4A137
    %AICMD0x1C($01DF, $00)                                     ;B4A13A
    %AICMD0x12_Jump($B4A134)                                   ;B4A13E

DATA8_B4A141:
 
    %AICMD0x50()                                               ;B4A141
    %AICMD0x08()                                               ;B4A142
    %AICMD0x09($01, $B4A178)                                   ;B4A143
    %AICMD0x38()                                               ;B4A147
    %AICMD0x39($02, $0020)                                     ;B4A148
    %AICMD0x39($01, $0030)                                     ;B4A14C
    %AICMD0x07_SetPlayerDirection($02)                         ;B4A150
    %AICMD0x0B($00)                                            ;B4A152
    %AICMD0x0C($01)                                            ;B4A154
    %AICMD0x13($005A)                                          ;B4A156
    %AICMD0x39($00, $0010)                                     ;B4A159
    %AICMD0x39($02, $0020)                                     ;B4A15D
    %AICMD0x39($01, $0010)                                     ;B4A161
    %AICMD0x39($03, $0020)                                     ;B4A165
    %AICMD0x0B($02)                                            ;B4A169
    %AICMD0x39($03, $0040)                                     ;B4A16B
    %AICMD0x0C($03)                                            ;B4A16F
    %AICMD0x28($1F6E, $7F, $01)                                ;B4A171
    %AICMD0x3C()                                               ;B4A176
    %AICMD0x10_End()                                           ;B4A177
    %AICMD0x1A($0098, $0088, $B3845C, $01)                     ;B4A178
    %AICMD0x0C($00)                                            ;B4A180
    %AICMD0x13($001E)                                          ;B4A182
    %AICMD0x1B($02E7, $01)                                     ;B4A185
    %AICMD0x0B($01)                                            ;B4A189
    %AICMD0x0C($02)                                            ;B4A18B
    %AICMD0x13($001E)                                          ;B4A18D
    %AICMD0x1B($02E7, $00)                                     ;B4A190
    %AICMD0x13($001E)                                          ;B4A194
    %AICMD0x1C($019C, $00)                                     ;B4A197
    %AICMD0x41_ModifyVariable($7F1F21, $0064)                  ;B4A19B
    %AICMD0x1B($02E7, $01)                                     ;B4A1A1
    %AICMD0x0D($01, $00, $04, $01)                             ;B4A1A5
    %AICMD0x1B($02F0, $01)                                     ;B4A1AA
    %AICMD0x13($003C)                                          ;B4A1AE
    %AICMD0x0B($03)                                            ;B4A1B1
    %AICMD0x12_Jump($B4A1B6)                                   ;B4A1B3
    %AICMD0x13($0001)                                          ;B4A1B6
    %AICMD0x12_Jump($B4A1B6)                                   ;B4A1B9

DATA8_B4A1BC:
 
    %AICMD0x50()                                               ;B4A1BC
    %AICMD0x09($01, $B4A1C3)                                   ;B4A1BD
    %AICMD0x38()                                               ;B4A1C1
    %AICMD0x10_End()                                           ;B4A1C2
    %AICMD0x1A($0028, $0168, $B383FC, $00)                     ;B4A1C3
    %AICMD0x1F($A1D1)                                          ;B4A1CB
    %AICMD0x12_Jump($B4A1CB)                                   ;B4A1CE
    %AICMD0x1C($01E9, $00)                                     ;B4A1D1
    %AICMD0x12_Jump($B4A1CB)                                   ;B4A1D5

DATA8_B4A1D8:
 
    %AICMD0x50()                                               ;B4A1D8
    %AICMD0x08()                                               ;B4A1D9
    %AICMD0x09($01, $B4A217)                                   ;B4A1DA
    %AICMD0x38()                                               ;B4A1DE
    %AICMD0x39($01, $0020)                                     ;B4A1DF
    %AICMD0x07_SetPlayerDirection($02)                         ;B4A1E3
    %AICMD0x0B($00)                                            ;B4A1E5
    %AICMD0x0C($01)                                            ;B4A1E7
    %AICMD0x39($02, $0010)                                     ;B4A1E9
    %AICMD0x39($01, $0020)                                     ;B4A1ED
    %AICMD0x0B($02)                                            ;B4A1F1
    %AICMD0x0C($03)                                            ;B4A1F3
    %AICMD0x39($01, $0010)                                     ;B4A1F5
    %AICMD0x39($02, $0010)                                     ;B4A1F9
    %AICMD0x0B($04)                                            ;B4A1FD
    %AICMD0x0C($05)                                            ;B4A1FF
    %AICMD0x07_SetPlayerDirection($00)                         ;B4A201
    %AICMD0x0C($06)                                            ;B4A203
    %AICMD0x19($0024, $00)                                     ;B4A205
    %AICMD0x13($003C)                                          ;B4A209
    %AICMD0x1C($019D, $00)                                     ;B4A20C
    %AICMD0x28($1F6E, $7F, $01)                                ;B4A210
    %AICMD0x3C()                                               ;B4A215
    %AICMD0x10_End()                                           ;B4A216
    %AICMD0x1A($0078, $0088, $B3845C, $01)                     ;B4A217
    %AICMD0x0C($00)                                            ;B4A21F
    %AICMD0x13($001E)                                          ;B4A221
    %AICMD0x1B($02E5, $00)                                     ;B4A224
    %AICMD0x0D($00, $FF, $20, $01)                             ;B4A228
    %AICMD0x0B($01)                                            ;B4A22D
    %AICMD0x0C($02)                                            ;B4A22F
    %AICMD0x13($001E)                                          ;B4A231
    %AICMD0x1B($02E7, $01)                                     ;B4A234
    %AICMD0x0D($01, $00, $20, $01)                             ;B4A238
    %AICMD0x0B($03)                                            ;B4A23D
    %AICMD0x0C($04)                                            ;B4A23F
    %AICMD0x13($001E)                                          ;B4A241
    %AICMD0x1B($02E3, $00)                                     ;B4A244
    %AICMD0x0D($00, $01, $40, $01)                             ;B4A248
    %AICMD0x0B($05)                                            ;B4A24D
    %AICMD0x13($003C)                                          ;B4A24F
    %AICMD0x1B($02E7, $00)                                     ;B4A252
    %AICMD0x0D($FF, $00, $10, $01)                             ;B4A256
    %AICMD0x1B($02E5, $00)                                     ;B4A25B
    %AICMD0x13($003C)                                          ;B4A25F
    %AICMD0x0D($00, $FE, $1A, $01)                             ;B4A262
    %AICMD0x0B($06)                                            ;B4A267
    %AICMD0x41_ModifyVariable($7F1F23, $0064)                  ;B4A269
    %AICMD0x12_Jump($B4A272)                                   ;B4A26F
    %AICMD0x13($0001)                                          ;B4A272
    %AICMD0x12_Jump($B4A272)                                   ;B4A275

DATA8_B4A278:
 
    %AICMD0x50()                                               ;B4A278
    %AICMD0x09($01, $B4A27F)                                   ;B4A279
    %AICMD0x38()                                               ;B4A27D
    %AICMD0x10_End()                                           ;B4A27E
    %AICMD0x1A($0028, $0198, $B38330, $00)                     ;B4A27F
    %AICMD0x12_Jump($B4A28A)                                   ;B4A287
    %AICMD0x1F($A290)                                          ;B4A28A
    %AICMD0x12_Jump($B4A28A)                                   ;B4A28D
    %AICMD0x1C($01B1, $00)                                     ;B4A290
    %AICMD0x12_Jump($B4A28A)                                   ;B4A294

DATA8_B4A297:
 
    %AICMD0x50()                                               ;B4A297
    %AICMD0x08()                                               ;B4A298
    %AICMD0x09($01, $B4A2C5)                                   ;B4A299
    %AICMD0x38()                                               ;B4A29D
    %AICMD0x13($005A)                                          ;B4A29E
    %AICMD0x39($01, $0010)                                     ;B4A2A1
    %AICMD0x39($03, $0010)                                     ;B4A2A5
    %AICMD0x07_SetPlayerDirection($01)                         ;B4A2A9
    %AICMD0x0B($00)                                            ;B4A2AB
    %AICMD0x0C($01)                                            ;B4A2AD
    %AICMD0x39($01, $0060)                                     ;B4A2AF
    %AICMD0x0B($02)                                            ;B4A2B3
    %AICMD0x39($01, $0020)                                     ;B4A2B5
    %AICMD0x0C($03)                                            ;B4A2B9
    %AICMD0x13($003C)                                          ;B4A2BB
    %AICMD0x28($1F6E, $7F, $01)                                ;B4A2BE
    %AICMD0x3C()                                               ;B4A2C3
    %AICMD0x10_End()                                           ;B4A2C4
    %AICMD0x1A($0058, $0088, $B3845C, $00)                     ;B4A2C5
    %AICMD0x0C($00)                                            ;B4A2CD
    %AICMD0x1B($02E5, $00)                                     ;B4A2CF
    %AICMD0x0D($00, $FF, $30, $01)                             ;B4A2D3
    %AICMD0x1B($02E4, $00)                                     ;B4A2D8
    %AICMD0x0B($01)                                            ;B4A2DC
    %AICMD0x0C($02)                                            ;B4A2DE
    %AICMD0x13($000A)                                          ;B4A2E0
    %AICMD0x1C($019E, $00)                                     ;B4A2E3
    %AICMD0x41_ModifyVariable($7F1F25, $0064)                  ;B4A2E7
    %AICMD0x1B($02E3, $00)                                     ;B4A2ED
    %AICMD0x0D($00, $01, $08, $02)                             ;B4A2F1
    %AICMD0x0B($03)                                            ;B4A2F6
    %AICMD0x12_Jump($B4A2FB)                                   ;B4A2F8
    %AICMD0x13($0001)                                          ;B4A2FB
    %AICMD0x12_Jump($B4A2FB)                                   ;B4A2FE

DATA8_B4A301:
 
    %AICMD0x50()                                               ;B4A301
    %AICMD0x09($01, $B4A308)                                   ;B4A302
    %AICMD0x38()                                               ;B4A306
    %AICMD0x10_End()                                           ;B4A307
    %AICMD0x1A($0028, $0198, $B382DC, $00)                     ;B4A308
    %AICMD0x1F($A316)                                          ;B4A310
    %AICMD0x12_Jump($B4A310)                                   ;B4A313
    %AICMD0x1C($01EA, $00)                                     ;B4A316
    %AICMD0x1B($0285, $00)                                     ;B4A31A
    %AICMD0x12_Jump($B4A310)                                   ;B4A31E

DATA8_B4A321:
 
    %AICMD0x50()                                               ;B4A321
    %AICMD0x08()                                               ;B4A322
    %AICMD0x09($01, $B4A348)                                   ;B4A323
    %AICMD0x38()                                               ;B4A327
    %AICMD0x13($005A)                                          ;B4A328
    %AICMD0x39($01, $0018)                                     ;B4A32B
    %AICMD0x39($03, $0044)                                     ;B4A32F
    %AICMD0x40()                                               ;B4A333
    %AICMD0x39($01, $005E)                                     ;B4A334
    %AICMD0x07_SetPlayerDirection($03)                         ;B4A338
    %AICMD0x0B($00)                                            ;B4A33A
    %AICMD0x0C($01)                                            ;B4A33C
    %AICMD0x13($005A)                                          ;B4A33E
    %AICMD0x28($1F6E, $7F, $01)                                ;B4A341
    %AICMD0x3C()                                               ;B4A346
    %AICMD0x10_End()                                           ;B4A347
    %AICMD0x1A($0020, $004E, $B3845C, $03)                     ;B4A348
    %AICMD0x0C($00)                                            ;B4A350
    %AICMD0x13($001E)                                          ;B4A352
    %AICMD0x1B($02E7, $01)                                     ;B4A355
    %AICMD0x0D($01, $00, $18, $01)                             ;B4A359
    %AICMD0x1C($019F, $00)                                     ;B4A35E
    %AICMD0x41_ModifyVariable($7F1F27, $0064)                  ;B4A362
    %AICMD0x13($000A)                                          ;B4A368
    %AICMD0x0D($02, $00, $01, $01)                             ;B4A36B
    %AICMD0x1B($02F0, $01)                                     ;B4A370
    %AICMD0x0B($01)                                            ;B4A374
    %AICMD0x12_Jump($B4A379)                                   ;B4A376
    %AICMD0x13($0001)                                          ;B4A379
    %AICMD0x12_Jump($B4A379)                                   ;B4A37C

pScripting_B4A37F:
    dw DATA8_B4A39F                                            ;B4A37F|        |B4A39F;
    dw pScripting_B4A455                                       ;B4A381|        |B4A455;
    dw pScripting_B4A455                                       ;B4A383|        |B4A455;
    dw pScripting_B4A455                                       ;B4A385|        |B4A455;
    dw pScripting_B4A455                                       ;B4A387|        |B4A455;
    dw pScripting_B4A455                                       ;B4A389|        |B4A455;
    dw pScripting_B4A455                                       ;B4A38B|        |B4A455;
    dw pScripting_B4A455                                       ;B4A38D|        |B4A455;
    dw pScripting_B4A455                                       ;B4A38F|        |B4A455;
    dw pScripting_B4A455                                       ;B4A391|        |B4A455;
    dw pScripting_B4A455                                       ;B4A393|        |B4A455;
    dw pScripting_B4A455                                       ;B4A395|        |B4A455;
    dw pScripting_B4A455                                       ;B4A397|        |B4A455;
    dw pScripting_B4A455                                       ;B4A399|        |B4A455;
    dw pScripting_B4A455                                       ;B4A39B|        |B4A455;
    dw pScripting_B4A455                                       ;B4A39D|        |B4A455;
 
DATA8_B4A39F:
 
    %AICMD0x09($0C, $B4A3B7)                                   ;B4A39F
    %AICMD0x09($0D, $B4A3F1)                                   ;B4A3A3
    %AICMD0x09($0E, $B4A429)                                   ;B4A3A7
    %AICMD0x08()                                               ;B4A3AB
    %AICMD0x38()                                               ;B4A3AC
    %AICMD0x2C($23, $0007, $003C)                              ;B4A3AD
    %AICMD0x0C($00)                                            ;B4A3B3
    %AICMD0x11()                                               ;B4A3B5
    %AICMD0x10_End()                                           ;B4A3B6
    %AICMD0x1A($0098, $0178, $B38570, $03)                     ;B4A3B7
    %AICMD0x13($0028)                                          ;B4A3BF
    %AICMD0x1B($0328, $01)                                     ;B4A3C2
    %AICMD0x0D($FF, $FF, $01, $01)                             ;B4A3C6
    %AICMD0x13($003C)                                          ;B4A3CB
    %AICMD0x1B($0328, $01)                                     ;B4A3CE
    %AICMD0x0D($01, $00, $01, $01)                             ;B4A3D2
    %AICMD0x13($001E)                                          ;B4A3D7
    %AICMD0x1B($0329, $01)                                     ;B4A3DA
    %AICMD0x0D($03, $FF, $40, $03)                             ;B4A3DE
    %AICMD0x0D($02, $FF, $40, $02)                             ;B4A3E3
    %AICMD0x0B($00)                                            ;B4A3E8
    %AICMD0x0D($01, $FF, $20, $01)                             ;B4A3EA
    %AICMD0x37()                                               ;B4A3EF
    %AICMD0x10_End()                                           ;B4A3F0
    %AICMD0x1A($0068, $0178, $B38570, $00)                     ;B4A3F1
    %AICMD0x13($0030)                                          ;B4A3F9
    %AICMD0x1B($0328, $01)                                     ;B4A3FC
    %AICMD0x0D($FF, $FF, $01, $01)                             ;B4A400
    %AICMD0x0D($FF, $01, $01, $01)                             ;B4A405
    %AICMD0x13($003C)                                          ;B4A40A
    %AICMD0x1B($0329, $00)                                     ;B4A40D
    %AICMD0x0D($FF, $00, $10, $01)                             ;B4A411
    %AICMD0x0D($FF, $FF, $20, $01)                             ;B4A416
    %AICMD0x0B($00)                                            ;B4A41B
    %AICMD0x0D($00, $00, $04, $01)                             ;B4A41D
    %AICMD0x0D($FE, $FF, $40, $01)                             ;B4A422
    %AICMD0x37()                                               ;B4A427
    %AICMD0x10_End()                                           ;B4A428
    %AICMD0x1A($0078, $0180, $B38570, $02)                     ;B4A429
    %AICMD0x13($0046)                                          ;B4A431
    %AICMD0x1B($0327, $00)                                     ;B4A434
    %AICMD0x13($0026)                                          ;B4A438
    %AICMD0x1B($032A, $00)                                     ;B4A43B
    %AICMD0x0D($00, $01, $10, $01)                             ;B4A43F
    %AICMD0x0D($FF, $03, $40, $03)                             ;B4A444
    %AICMD0x0D($FF, $02, $40, $02)                             ;B4A449
    %AICMD0x0D($FF, $01, $58, $01)                             ;B4A44E
    %AICMD0x37()                                               ;B4A453
    %AICMD0x10_End()                                           ;B4A454

pScripting_B4A455:
    dw DATA8_B4A475                                            ;B4A455|        |B4A475;
    dw DATA8_B4A531                                            ;B4A457|        |B4A531;
    dw DATA8_B4A55D                                            ;B4A459|        |B4A55D;
    dw DATA8_B4A589                                            ;B4A45B|        |B4A589;
    dw pScripting_B4A5B5                                       ;B4A45D|        |B4A5B5;
    dw pScripting_B4A5B5                                       ;B4A45F|        |B4A5B5;
    dw pScripting_B4A5B5                                       ;B4A461|        |B4A5B5;
    dw pScripting_B4A5B5                                       ;B4A463|        |B4A5B5;
    dw pScripting_B4A5B5                                       ;B4A465|        |B4A5B5;
    dw pScripting_B4A5B5                                       ;B4A467|        |B4A5B5;
    dw pScripting_B4A5B5                                       ;B4A469|        |B4A5B5;
    dw pScripting_B4A5B5                                       ;B4A46B|        |B4A5B5;
    dw pScripting_B4A5B5                                       ;B4A46D|        |B4A5B5;
    dw pScripting_B4A5B5                                       ;B4A46F|        |B4A5B5;
    dw pScripting_B4A5B5                                       ;B4A471|        |B4A5B5;
    dw pScripting_B4A5B5                                       ;B4A473|        |B4A5B5;
 
DATA8_B4A475:
 
    %AICMD0x08()                                               ;B4A475
    %AICMD0x1A($FFF8, $01A8, $B382AC, $02)                     ;B4A476
    %AICMD0x38()                                               ;B4A47E
    %AICMD0x3A($00, $0028)                                     ;B4A47F
    %AICMD0x07_SetPlayerDirection($03)                         ;B4A483
    %AICMD0x1B($027B, $01)                                     ;B4A485
    %AICMD0x0D($01, $00, $80, $01)                             ;B4A489
    %AICMD0x13($001E)                                          ;B4A48E
    %AICMD0x15($80098C, $06, $B4A4BE)                          ;B4A491
    %AICMD0x15($80098C, $07, $B4A4C5)                          ;B4A498
    %AICMD0x15($80098C, $08, $B4A4CC)                          ;B4A49F
    %AICMD0x15($80098C, $09, $B4A4D3)                          ;B4A4A6
    %AICMD0x15($80098C, $0A, $B4A4DA)                          ;B4A4AD
    %AICMD0x15($80098C, $0B, $B4A4E1)                          ;B4A4B4
    %AICMD0x12_Jump($B4A4E8)                                   ;B4A4BB
    %AICMD0x1C($0272, $00)                                     ;B4A4BE
    %AICMD0x12_Jump($B4A4E8)                                   ;B4A4C2
    %AICMD0x1C($0240, $00)                                     ;B4A4C5
    %AICMD0x12_Jump($B4A4E8)                                   ;B4A4C9
    %AICMD0x1C($028E, $00)                                     ;B4A4CC
    %AICMD0x12_Jump($B4A4F7)                                   ;B4A4D0
    %AICMD0x1C($026E, $00)                                     ;B4A4D3
    %AICMD0x12_Jump($B4A4E8)                                   ;B4A4D7
    %AICMD0x1C($0289, $00)                                     ;B4A4DA
    %AICMD0x12_Jump($B4A4E8)                                   ;B4A4DE
    %AICMD0x1C($0274, $00)                                     ;B4A4E1
    %AICMD0x12_Jump($B4A4E8)                                   ;B4A4E5
    %AICMD0x13($001E)                                          ;B4A4E8
    %AICMD0x1B($027B, $00)                                     ;B4A4EB
    %AICMD0x0D($FF, $00, $80, $01)                             ;B4A4EF
    %AICMD0x37()                                               ;B4A4F4
    %AICMD0x11()                                               ;B4A4F5
    %AICMD0x10_End()                                           ;B4A4F6
    %AICMD0x09($02, $B4A50C)                                   ;B4A4F7
    %AICMD0x13($001E)                                          ;B4A4FB
    %AICMD0x0C($02)                                            ;B4A4FE
    %AICMD0x1B($027B, $00)                                     ;B4A500
    %AICMD0x0D($FF, $00, $80, $01)                             ;B4A504
    %AICMD0x37()                                               ;B4A509
    %AICMD0x11()                                               ;B4A50A
    %AICMD0x10_End()                                           ;B4A50B
    %AICMD0x1A($FFF8, $01A8, $B3827C, $02)                     ;B4A50C
    %AICMD0x1B($026E, $01)                                     ;B4A514
    %AICMD0x0D($01, $00, $70, $01)                             ;B4A518
    %AICMD0x13($001E)                                          ;B4A51D
    %AICMD0x1C($028F, $00)                                     ;B4A520
    %AICMD0x0B($02)                                            ;B4A524
    %AICMD0x1B($026E, $00)                                     ;B4A526
    %AICMD0x0D($FF, $00, $80, $01)                             ;B4A52A
    %AICMD0x37()                                               ;B4A52F
    %AICMD0x10_End()                                           ;B4A530

DATA8_B4A531:
 
    %AICMD0x08()                                               ;B4A531
    %AICMD0x1A($FFF8, $01A8, $B38318, $02)                     ;B4A532
    %AICMD0x38()                                               ;B4A53A
    %AICMD0x3A($00, $0028)                                     ;B4A53B
    %AICMD0x07_SetPlayerDirection($03)                         ;B4A53F
    %AICMD0x1B($029B, $01)                                     ;B4A541
    %AICMD0x0D($01, $00, $80, $01)                             ;B4A545
    %AICMD0x13($001E)                                          ;B4A54A
    %AICMD0x1C($047F, $00)                                     ;B4A54D
    %AICMD0x1B($029B, $00)                                     ;B4A551
    %AICMD0x0D($FF, $00, $80, $01)                             ;B4A555
    %AICMD0x37()                                               ;B4A55A
    %AICMD0x11()                                               ;B4A55B
    %AICMD0x10_End()                                           ;B4A55C

DATA8_B4A55D:
 
    %AICMD0x08()                                               ;B4A55D
    %AICMD0x1A($FFF8, $01A8, $B38240, $02)                     ;B4A55E
    %AICMD0x38()                                               ;B4A566
    %AICMD0x3A($00, $0028)                                     ;B4A567
    %AICMD0x07_SetPlayerDirection($03)                         ;B4A56B
    %AICMD0x1B($025F, $01)                                     ;B4A56D
    %AICMD0x0D($01, $00, $80, $01)                             ;B4A571
    %AICMD0x13($001E)                                          ;B4A576
    %AICMD0x1C($0486, $00)                                     ;B4A579
    %AICMD0x1B($025F, $00)                                     ;B4A57D
    %AICMD0x0D($FF, $00, $80, $01)                             ;B4A581
    %AICMD0x37()                                               ;B4A586
    %AICMD0x11()                                               ;B4A587
    %AICMD0x10_End()                                           ;B4A588

DATA8_B4A589:
 
    %AICMD0x08()                                               ;B4A589
    %AICMD0x1A($FFF8, $01A8, $B38240, $02)                     ;B4A58A
    %AICMD0x38()                                               ;B4A592
    %AICMD0x3A($00, $0028)                                     ;B4A593
    %AICMD0x07_SetPlayerDirection($03)                         ;B4A597
    %AICMD0x1B($025F, $01)                                     ;B4A599
    %AICMD0x0D($01, $00, $80, $01)                             ;B4A59D
    %AICMD0x13($001E)                                          ;B4A5A2
    %AICMD0x1C($0142, $00)                                     ;B4A5A5
    %AICMD0x1B($025F, $00)                                     ;B4A5A9
    %AICMD0x0D($FF, $00, $80, $01)                             ;B4A5AD
    %AICMD0x37()                                               ;B4A5B2
    %AICMD0x11()                                               ;B4A5B3
    %AICMD0x10_End()                                           ;B4A5B4

pScripting_B4A5B5:
    dw DATA8_B4A5D5                                            ;B4A5B5|        |B4A5D5;
    dw pScripting_B4A60D                                       ;B4A5B7|        |B4A60D;
    dw pScripting_B4A60D                                       ;B4A5B9|        |B4A60D;
    dw pScripting_B4A60D                                       ;B4A5BB|        |B4A60D;
    dw pScripting_B4A60D                                       ;B4A5BD|        |B4A60D;
    dw pScripting_B4A60D                                       ;B4A5BF|        |B4A60D;
    dw pScripting_B4A60D                                       ;B4A5C1|        |B4A60D;
    dw pScripting_B4A60D                                       ;B4A5C3|        |B4A60D;
    dw pScripting_B4A60D                                       ;B4A5C5|        |B4A60D;
    dw pScripting_B4A60D                                       ;B4A5C7|        |B4A60D;
    dw pScripting_B4A60D                                       ;B4A5C9|        |B4A60D;
    dw pScripting_B4A60D                                       ;B4A5CB|        |B4A60D;
    dw pScripting_B4A60D                                       ;B4A5CD|        |B4A60D;
    dw pScripting_B4A60D                                       ;B4A5CF|        |B4A60D;
    dw pScripting_B4A60D                                       ;B4A5D1|        |B4A60D;
    dw pScripting_B4A60D                                       ;B4A5D3|        |B4A60D;
 
DATA8_B4A5D5:
 
    %AICMD0x02_FreezeTime()                                    ;B4A5D5
    %AICMD0x05_SetPosition($0088, $0158)                       ;B4A5D6
    %AICMD0x07_SetPlayerDirection($00)                         ;B4A5DB
    %AICMD0x08()                                               ;B4A5DD
    %AICMD0x09($01, $B4A5E9)                                   ;B4A5DE
    %AICMD0x38()                                               ;B4A5E2
    %AICMD0x0B($00)                                            ;B4A5E3
    %AICMD0x0C($01)                                            ;B4A5E5
    %AICMD0x11()                                               ;B4A5E7
    %AICMD0x10_End()                                           ;B4A5E8
    %AICMD0x1A($0068, $01A8, $B38318, $02)                     ;B4A5E9
    %AICMD0x0C($00)                                            ;B4A5F1
    %AICMD0x1C($0300, $00)                                     ;B4A5F3
    %AICMD0x1B($0297, $00)                                     ;B4A5F7
    %AICMD0x0D($00, $01, $60, $01)                             ;B4A5FB
    %AICMD0x1B($029B, $01)                                     ;B4A600
    %AICMD0x0D($FF, $00, $70, $01)                             ;B4A604
    %AICMD0x0B($01)                                            ;B4A609
    %AICMD0x37()                                               ;B4A60B
    %AICMD0x10_End()                                           ;B4A60C

pScripting_B4A60D:
    dw DATA8_B4A62D                                            ;B4A60D|        |B4A62D;
    dw DATA8_B4B48E                                            ;B4A60F|        |B4B48E;
    dw pScripting_B4B65E                                       ;B4A611|        |B4B65E;
    dw pScripting_B4B65E                                       ;B4A613|        |B4B65E;
    dw pScripting_B4B65E                                       ;B4A615|        |B4B65E;
    dw pScripting_B4B65E                                       ;B4A617|        |B4B65E;
    dw pScripting_B4B65E                                       ;B4A619|        |B4B65E;
    dw pScripting_B4B65E                                       ;B4A61B|        |B4B65E;
    dw pScripting_B4B65E                                       ;B4A61D|        |B4B65E;
    dw pScripting_B4B65E                                       ;B4A61F|        |B4B65E;
    dw pScripting_B4B65E                                       ;B4A621|        |B4B65E;
    dw pScripting_B4B65E                                       ;B4A623|        |B4B65E;
    dw pScripting_B4B65E                                       ;B4A625|        |B4B65E;
    dw pScripting_B4B65E                                       ;B4A627|        |B4B65E;
    dw pScripting_B4B65E                                       ;B4A629|        |B4B65E;
    dw pScripting_B4B65E                                       ;B4A62B|        |B4B65E;
 
DATA8_B4A62D:
 
AI_B4A62D:
    %AICMD0x4F()                                               ;B4A62D
    %AICMD0x51()                                               ;B4A62F
    %AICMD0x23_OrWithIndexedValue($7F1F60, $09)                ;B4A630
    %AICMD0x00_SetMusic($03, $B4)                              ;B4A635
    %AICMD0x02_FreezeTime()                                    ;B4A638
    %AICMD0x03_SetHour($07)                                    ;B4A639
    %AICMD0x08()                                               ;B4A63B
    %AICMD0x05_SetPosition($0108, $0138)                       ;B4A63C
    %AICMD0x07_SetPlayerDirection($01)                         ;B4A641
    %AICMD0x32($1F74, $7F, $FFDF)                              ;B4A643
    %AICMD0x09($01, $B4A962)                                   ;B4A649
    %AICMD0x09($03, $B4A9D9)                                   ;B4A64D
    %AICMD0x09($06, $B4AA81)                                   ;B4A651
    %AICMD0x09($07, $B4AAB2)                                   ;B4A655
    %AICMD0x09($0B, $B4AB61)                                   ;B4A659
    %AICMD0x09($0D, $B4AB97)                                   ;B4A65D
    %AICMD0x09($0E, $B4AC3D)                                   ;B4A661
    %AICMD0x09($0F, $B4AD63)                                   ;B4A665
    %AICMD0x09($10, $B4AE66)                                   ;B4A669
    %AICMD0x09($11, $B4AF7F)                                   ;B4A66D
    %AICMD0x09($12, $B4A75E)                                   ;B4A671
    %AICMD0x09($13, $B4A993)                                   ;B4A675
    %AICMD0x06_SetDestination($09)                             ;B4A679
    %AICMD0x38()                                               ;B4A67B
    %AICMD0x39($01, $0040)                                     ;B4A67C
    %AICMD0x15($80091D, $00, $B4A6A1)                          ;B4A680
    %AICMD0x1C($0241, $00)                                     ;B4A687
    %AICMD0x40()                                               ;B4A68B
    %AICMD0x39($01, $0010)                                     ;B4A68C
    %AICMD0x3F()                                               ;B4A690
    %AICMD0x13($003C)                                          ;B4A691
    %AICMD0x1C($0243, $00)                                     ;B4A694
    %AICMD0x39($00, $0010)                                     ;B4A698
    %AICMD0x07_SetPlayerDirection($01)                         ;B4A69C
    %AICMD0x4E()                                               ;B4A69E
    %AICMD0x12_Jump($B4A6AE)                                   ;B4A69F
    %AICMD0x1C($0242, $00)                                     ;B4A6A2
    %AICMD0x1C($0243, $00)                                     ;B4A6A6
    %AICMD0x23_OrWithIndexedValue($7F1F76, $00)                ;B4A6AA
    %AICMD0x13($0078)                                          ;B4A6AF
    %AICMD0x0B($00)                                            ;B4A6B2
    %AICMD0x0C($01)                                            ;B4A6B4
    %AICMD0x09($14, $B4A7B0)                                   ;B4A6B6
    %AICMD0x19($0012, $00)                                     ;B4A6BA
    %AICMD0x13($0014)                                          ;B4A6BE
    %AICMD0x13($0078)                                          ;B4A6C1
    %AICMD0x11()                                               ;B4A6C4
    %AICMD0x0C($02)                                            ;B4A6C5
    %AICMD0x3D($09)                                            ;B4A6C7
    %AICMD0x10_End()                                           ;B4A6C9
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $00, $B4A72D)   ;B4A6CA
    %AICMD0x09($07, $B4B284)                                   ;B4A6D1
    %AICMD0x41_ModifyVariable($7F1F1F, $001E)                  ;B4A6D5
    %AICMD0x12_Jump($B4B4E6)                                   ;B4A6DB
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $01, $B4A736)   ;B4A6DE
    %AICMD0x09($07, $B4B2DB)                                   ;B4A6E5
    %AICMD0x41_ModifyVariable($7F1F21, $001E)                  ;B4A6E9
    %AICMD0x12_Jump($B4B4E6)                                   ;B4A6EF
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $02, $B4A73F)   ;B4A6F2
    %AICMD0x09($07, $B4B332)                                   ;B4A6F9
    %AICMD0x41_ModifyVariable($7F1F23, $001E)                  ;B4A6FD
    %AICMD0x12_Jump($B4B4E6)                                   ;B4A703
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $03, $B4A748)   ;B4A706
    %AICMD0x09($07, $B4B389)                                   ;B4A70D
    %AICMD0x41_ModifyVariable($7F1F25, $001E)                  ;B4A711
    %AICMD0x12_Jump($B4B4E6)                                   ;B4A717
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $04, $B4A751)   ;B4A71A
    %AICMD0x09($07, $B4B3E0)                                   ;B4A721
    %AICMD0x41_ModifyVariable($7F1F27, $001E)                  ;B4A725
    %AICMD0x12_Jump($B4B4E6)                                   ;B4A72B
    %AICMD0x41_ModifyVariable($7F1F1F, $001E)                  ;B4A72E
    %AICMD0x12_Jump($B4A757)                                   ;B4A734
    %AICMD0x41_ModifyVariable($7F1F21, $001E)                  ;B4A737
    %AICMD0x12_Jump($B4A757)                                   ;B4A73D
    %AICMD0x41_ModifyVariable($7F1F23, $001E)                  ;B4A740
    %AICMD0x12_Jump($B4A757)                                   ;B4A746
    %AICMD0x41_ModifyVariable($7F1F25, $001E)                  ;B4A749
    %AICMD0x12_Jump($B4A757)                                   ;B4A74F
    %AICMD0x41_ModifyVariable($7F1F27, $001E)                  ;B4A752
    %AICMD0x09($07, $B4B437)                                   ;B4A758
    %AICMD0x12_Jump($B4B4E6)                                   ;B4A75C
    %AICMD0x1A($0108, $00B8, $B38AB0, $00)                     ;B4A75F
    %AICMD0x0C($00)                                            ;B4A767
    %AICMD0x1B($02A2, $01)                                     ;B4A769
    %AICMD0x0D($01, $00, $30, $01)                             ;B4A76D
    %AICMD0x1B($029E, $01)                                     ;B4A772
    %AICMD0x0D($00, $01, $40, $01)                             ;B4A776
    %AICMD0x1B($02A2, $00)                                     ;B4A77B
    %AICMD0x0D($FF, $00, $10, $01)                             ;B4A77F
    %AICMD0x1B($02A1, $00)                                     ;B4A784
    %AICMD0x2A($0045)                                          ;B4A788
    %AICMD0x07_SetPlayerDirection($02)                         ;B4A78B
    %AICMD0x1C($0244, $00)                                     ;B4A78D
    %AICMD0x0B($01)                                            ;B4A791
    %AICMD0x2F($B38330)                                        ;B4A793
    %AICMD0x1F($A79B)                                          ;B4A796
    %AICMD0x12_Jump($B4A795)                                   ;B4A799
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F74, $05, $B4A7A9)   ;B4A79C
    %AICMD0x1C($0286, $00)                                     ;B4A7A3
    %AICMD0x12_Jump($B4A795)                                   ;B4A7A7
    %AICMD0x1C($028C, $00)                                     ;B4A7AA
    %AICMD0x12_Jump($B4A795)                                   ;B4A7AE
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F76, $00, $B4A826)   ;B4A7B1
    %AICMD0x15($80091E, $15, $B4A813)                          ;B4A7B8
    %AICMD0x15($80091E, $16, $B4A813)                          ;B4A7BF
    %AICMD0x15($80091E, $17, $B4A813)                          ;B4A7C6
    %AICMD0x15($80091E, $01, $B4A813)                          ;B4A7CD
    %AICMD0x15($80091E, $02, $B4A808)                          ;B4A7D4
    %AICMD0x15($80091E, $14, $B4A813)                          ;B4A7DB
    %AICMD0x15($80091E, $07, $B4A840)                          ;B4A7E2
    %AICMD0x15($80091E, $05, $B4A840)                          ;B4A7E9
    %AICMD0x15($80091E, $18, $B4A813)                          ;B4A7F0
    %AICMD0x16($80091E, $09, $0C, $B4A808)                     ;B4A7F7
    %AICMD0x15($80091E, $1A, $B4A808)                          ;B4A7FF
    %AICMD0x12_Jump($B4A808)                                   ;B4A806
    %AICMD0x17($02)                                            ;B4A809
    %AICMD0x18($00, $B4A8DE)                                   ;B4A80B
    %AICMD0x18($01, $B4A8F8)                                   ;B4A80F
    %AICMD0x10_End()                                           ;B4A813
    %AICMD0x17($04)                                            ;B4A814
    %AICMD0x18($00, $B4A876)                                   ;B4A816
    %AICMD0x18($01, $B4A890)                                   ;B4A81A
    %AICMD0x18($02, $B4A8AA)                                   ;B4A81E
    %AICMD0x18($03, $B4A8C4)                                   ;B4A822
    %AICMD0x10_End()                                           ;B4A826
    %AICMD0x1A($0118, $00F8, $B38ABC, $00)                     ;B4A827
    %AICMD0x13($0010)                                          ;B4A82F
    %AICMD0x0D($F8, $F8, $01, $01)                             ;B4A832
    %AICMD0x13($0004)                                          ;B4A837
    %AICMD0x19($0034, $00)                                     ;B4A83A
    %AICMD0x12_Jump($B4A92C)                                   ;B4A83E
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F6C, $0F, $B4A912)   ;B4A841
    %AICMD0x1A($0118, $00F8, $B38720, $00)                     ;B4A848
    %AICMD0x13($0010)                                          ;B4A850
    %AICMD0x0D($F8, $F8, $01, $01)                             ;B4A853
    %AICMD0x13($0004)                                          ;B4A858
    %AICMD0x19($003B, $00)                                     ;B4A85B
    %AICMD0x21($1F36, $7F, $01)                                ;B4A85F
    %AICMD0x21($0917, $80, $0A)                                ;B4A864
    %AICMD0x41_ModifyVariable($7F1F33, $000A)                  ;B4A869
    %AICMD0x23_OrWithIndexedValue($7F1F6C, $0F)                ;B4A86F
    %AICMD0x12_Jump($B4A92C)                                   ;B4A874
    %AICMD0x1A($0118, $00F8, $B38AC8, $00)                     ;B4A877
    %AICMD0x13($0010)                                          ;B4A87F
    %AICMD0x0D($F8, $F8, $01, $01)                             ;B4A882
    %AICMD0x13($0004)                                          ;B4A887
    %AICMD0x19($00F7, $00)                                     ;B4A88A
    %AICMD0x12_Jump($B4A92C)                                   ;B4A88E
    %AICMD0x1A($0118, $00F8, $B38AD4, $00)                     ;B4A891
    %AICMD0x13($0010)                                          ;B4A899
    %AICMD0x0D($F8, $F8, $01, $01)                             ;B4A89C
    %AICMD0x13($0004)                                          ;B4A8A1
    %AICMD0x19($00F6, $00)                                     ;B4A8A4
    %AICMD0x12_Jump($B4A92C)                                   ;B4A8A8
    %AICMD0x1A($0118, $00F8, $B38AE0, $00)                     ;B4A8AB
    %AICMD0x13($0010)                                          ;B4A8B3
    %AICMD0x0D($F8, $F8, $01, $01)                             ;B4A8B6
    %AICMD0x13($0004)                                          ;B4A8BB
    %AICMD0x19($00F9, $00)                                     ;B4A8BE
    %AICMD0x12_Jump($B4A92C)                                   ;B4A8C2
    %AICMD0x1A($0118, $00F8, $B38A98, $00)                     ;B4A8C5
    %AICMD0x13($0010)                                          ;B4A8CD
    %AICMD0x0D($F8, $F8, $01, $01)                             ;B4A8D0
    %AICMD0x13($0004)                                          ;B4A8D5
    %AICMD0x19($00F8, $00)                                     ;B4A8D8
    %AICMD0x12_Jump($B4A92C)                                   ;B4A8DC
    %AICMD0x1A($0118, $00F8, $B38504, $00)                     ;B4A8DF
    %AICMD0x13($0010)                                          ;B4A8E7
    %AICMD0x0D($F8, $F8, $01, $01)                             ;B4A8EA
    %AICMD0x13($0004)                                          ;B4A8EF
    %AICMD0x19($00FD, $00)                                     ;B4A8F2
    %AICMD0x12_Jump($B4A92C)                                   ;B4A8F6
    %AICMD0x1A($0118, $00F8, $B384F8, $00)                     ;B4A8F9
    %AICMD0x13($0010)                                          ;B4A901
    %AICMD0x0D($F8, $F8, $01, $01)                             ;B4A904
    %AICMD0x13($0004)                                          ;B4A909
    %AICMD0x19($00FC, $00)                                     ;B4A90C
    %AICMD0x12_Jump($B4A92C)                                   ;B4A910
    %AICMD0x1A($0118, $00F8, $B38750, $00)                     ;B4A913
    %AICMD0x13($0010)                                          ;B4A91B
    %AICMD0x0D($F8, $F8, $01, $01)                             ;B4A91E
    %AICMD0x13($0004)                                          ;B4A923
    %AICMD0x19($003A, $00)                                     ;B4A926
    %AICMD0x12_Jump($B4A92C)                                   ;B4A92A
    %AICMD0x37()                                               ;B4A92D
    %AICMD0x10_End()                                           ;B4A92E
    %AICMD0x1A($0148, $00A0, $B384F8, $00)                     ;B4A92F
    %AICMD0x13($0001)                                          ;B4A937
    %AICMD0x37()                                               ;B4A93A
    %AICMD0x10_End()                                           ;B4A93B
    %AICMD0x1A($0148, $00A8, $B38510, $00)                     ;B4A93C
    %AICMD0x13($0001)                                          ;B4A944
    %AICMD0x37()                                               ;B4A947
    %AICMD0x10_End()                                           ;B4A948
    %AICMD0x1A($0148, $00A8, $B38A74, $00)                     ;B4A949
    %AICMD0x13($0001)                                          ;B4A951
    %AICMD0x37()                                               ;B4A954
    %AICMD0x10_End()                                           ;B4A955
    %AICMD0x1A($0108, $0098, $B38A44, $00)                     ;B4A956
    %AICMD0x13($0001)                                          ;B4A95E
    %AICMD0x37()                                               ;B4A961
    %AICMD0x10_End()                                           ;B4A962
    %AICMD0x1A($0198, $00C8, $B383FC, $00)                     ;B4A963
    %AICMD0x1F($A970)                                          ;B4A96B
    %AICMD0x12_Jump($B4A96A)                                   ;B4A96E
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $02, $B4A985)   ;B4A971
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F74, $05, $B4A98C)   ;B4A978
    %AICMD0x1C($0247, $00)                                     ;B4A97F
    %AICMD0x12_Jump($B4A96A)                                   ;B4A983
    %AICMD0x1C($0492, $00)                                     ;B4A986
    %AICMD0x12_Jump($B4A96A)                                   ;B4A98A
    %AICMD0x1C($0284, $00)                                     ;B4A98D
    %AICMD0x12_Jump($B4A96A)                                   ;B4A991
    %AICMD0x1A($00B8, $0108, $B38348, $00)                     ;B4A994
    %AICMD0x1F($A9A1)                                          ;B4A99C
    %AICMD0x12_Jump($B4A99B)                                   ;B4A99F
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F74, $05, $B4A9AF)   ;B4A9A2
    %AICMD0x1C($0248, $00)                                     ;B4A9A9
    %AICMD0x12_Jump($B4A99B)                                   ;B4A9AD
    %AICMD0x1C($0285, $00)                                     ;B4A9B0
    %AICMD0x12_Jump($B4A99B)                                   ;B4A9B4
    %AICMD0x1A($00B8, $0108, $B3836C, $03)                     ;B4A9B7
    %AICMD0x1F($A9C4)                                          ;B4A9BF
    %AICMD0x12_Jump($B4A9BE)                                   ;B4A9C2
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F74, $05, $B4A9D2)   ;B4A9C5
    %AICMD0x1C($0248, $00)                                     ;B4A9CC
    %AICMD0x12_Jump($B4A9BE)                                   ;B4A9D0
    %AICMD0x1C($0288, $00)                                     ;B4A9D3
    %AICMD0x12_Jump($B4A9BE)                                   ;B4A9D7
    %AICMD0x1A($0078, $00F8, $B383D8, $02)                     ;B4A9DA
    %AICMD0x1F($A9ED)                                          ;B4A9E2
    %AICMD0x12_Jump($B4A9E1)                                   ;B4A9E5
    %AICMD0x1F($AA26)                                          ;B4A9E8
    %AICMD0x12_Jump($B4A9E7)                                   ;B4A9EB
    %AICMD0x1C($0245, $00)                                     ;B4A9EE
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F74, $00, $B4A9E1)   ;B4A9F2
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F74, $01, $B4A9E1)   ;B4A9F9
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F74, $02, $B4A9E1)   ;B4AA00
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F74, $03, $B4A9E1)   ;B4AA07
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F74, $04, $B4A9E1)   ;B4AA0E
    %AICMD0x08()                                               ;B4AA15
    %AICMD0x1B($02C7, $00)                                     ;B4AA16
    %AICMD0x0D($00, $FF, $30, $01)                             ;B4AA1A
    %AICMD0x1B($02C4, $00)                                     ;B4AA1F
    %AICMD0x11()                                               ;B4AA23
    %AICMD0x12_Jump($B4A9E7)                                   ;B4AA24
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F74, $05, $B4AA34)   ;B4AA27
    %AICMD0x1C($0245, $00)                                     ;B4AA2E
    %AICMD0x12_Jump($B4A9E7)                                   ;B4AA32
    %AICMD0x1C($0282, $00)                                     ;B4AA35
    %AICMD0x12_Jump($B4A9E7)                                   ;B4AA39
    %AICMD0x1A($0158, $00C8, $B38318, $00)                     ;B4AA3C
    %AICMD0x1F($AA49)                                          ;B4AA44
    %AICMD0x12_Jump($B4AA43)                                   ;B4AA47
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F74, $05, $B4AA57)   ;B4AA4A
    %AICMD0x1C($0246, $00)                                     ;B4AA51
    %AICMD0x12_Jump($B4AA43)                                   ;B4AA55
    %AICMD0x1C($0283, $00)                                     ;B4AA58
    %AICMD0x12_Jump($B4AA43)                                   ;B4AA5C
    %AICMD0x1A($0098, $00A8, $B38354, $00)                     ;B4AA5F
    %AICMD0x1F($AA6C)                                          ;B4AA67
    %AICMD0x12_Jump($B4AA66)                                   ;B4AA6A
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F74, $05, $B4AA7A)   ;B4AA6D
    %AICMD0x1C($024C, $00)                                     ;B4AA74
    %AICMD0x12_Jump($B4AA66)                                   ;B4AA78
    %AICMD0x1C($028A, $00)                                     ;B4AA7B
    %AICMD0x12_Jump($B4AA66)                                   ;B4AA7F
    %AICMD0x1A($0168, $0108, $B38420, $01)                     ;B4AA82
    %AICMD0x1F($AA8F)                                          ;B4AA8A
    %AICMD0x12_Jump($B4AA89)                                   ;B4AA8D
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F74, $05, $B4AA9D)   ;B4AA90
    %AICMD0x1C($0249, $00)                                     ;B4AA97
    %AICMD0x12_Jump($B4AA89)                                   ;B4AA9B
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $00, $B4AAAB)   ;B4AA9E
    %AICMD0x1C($0288, $00)                                     ;B4AAA5
    %AICMD0x12_Jump($B4AA89)                                   ;B4AAA9
    %AICMD0x1C($0250, $00)                                     ;B4AAAC
    %AICMD0x12_Jump($B4AA89)                                   ;B4AAB0
    %AICMD0x1A($0148, $0158, $B38384, $01)                     ;B4AAB3
    %AICMD0x1F($AAC0)                                          ;B4AABB
    %AICMD0x12_Jump($B4AABA)                                   ;B4AABE
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F74, $05, $B4AACE)   ;B4AAC1
    %AICMD0x1C($024F, $00)                                     ;B4AAC8
    %AICMD0x12_Jump($B4AABA)                                   ;B4AACC
    %AICMD0x1C($0287, $00)                                     ;B4AACF
    %AICMD0x12_Jump($B4AABA)                                   ;B4AAD3
    %AICMD0x1A($00A8, $0148, $B382E8, $03)                     ;B4AAD6
    %AICMD0x1F($AAE3)                                          ;B4AADE
    %AICMD0x12_Jump($B4AADD)                                   ;B4AAE1
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F74, $05, $B4AAF1)   ;B4AAE4
    %AICMD0x1C($024E, $00)                                     ;B4AAEB
    %AICMD0x12_Jump($B4AADD)                                   ;B4AAEF
    %AICMD0x1C($028C, $00)                                     ;B4AAF2
    %AICMD0x12_Jump($B4AADD)                                   ;B4AAF6
    %AICMD0x1A($0128, $0148, $B38294, $01)                     ;B4AAF9
    %AICMD0x1F($AB06)                                          ;B4AB01
    %AICMD0x12_Jump($B4AB00)                                   ;B4AB04
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F74, $05, $B4AB14)   ;B4AB07
    %AICMD0x1C($024A, $00)                                     ;B4AB0E
    %AICMD0x12_Jump($B4AB00)                                   ;B4AB12
    %AICMD0x1C($0288, $00)                                     ;B4AB15
    %AICMD0x12_Jump($B4AB00)                                   ;B4AB19
    %AICMD0x1A($0108, $0158, $B382AC, $01)                     ;B4AB1C
    %AICMD0x1F($AB29)                                          ;B4AB24
    %AICMD0x12_Jump($B4AB23)                                   ;B4AB27
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F74, $05, $B4AB37)   ;B4AB2A
    %AICMD0x1C($024B, $00)                                     ;B4AB31
    %AICMD0x12_Jump($B4AB23)                                   ;B4AB35
    %AICMD0x1C($0289, $00)                                     ;B4AB38
    %AICMD0x12_Jump($B4AB23)                                   ;B4AB3C
    %AICMD0x1A($0088, $0158, $B3827C, $02)                     ;B4AB3F
    %AICMD0x1F($AB4C)                                          ;B4AB47
    %AICMD0x12_Jump($B4AB46)                                   ;B4AB4A
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F74, $05, $B4AB5A)   ;B4AB4D
    %AICMD0x1C($024D, $00)                                     ;B4AB54
    %AICMD0x12_Jump($B4AB46)                                   ;B4AB58
    %AICMD0x1C($028B, $00)                                     ;B4AB5B
    %AICMD0x12_Jump($B4AB46)                                   ;B4AB5F
    %AICMD0x1A($0058, $00E8, $B38300, $02)                     ;B4AB62
    %AICMD0x1F($AB75)                                          ;B4AB6A
    %AICMD0x12_Jump($B4AB69)                                   ;B4AB6D
    %AICMD0x1F($AB84)                                          ;B4AB70
    %AICMD0x12_Jump($B4AB6F)                                   ;B4AB73
    %AICMD0x1D($0234, $00)                                     ;B4AB76
    %AICMD0x20($00, $AB84)                                     ;B4AB7A
    %AICMD0x20($01, $AB90)                                     ;B4AB7E
    %AICMD0x12_Jump($B4AB69)                                   ;B4AB82
    %AICMD0x1C($0235, $00)                                     ;B4AB85
    %AICMD0x23_OrWithIndexedValue($7F1F74, $05)                ;B4AB89
    %AICMD0x12_Jump($B4AB6F)                                   ;B4AB8E
    %AICMD0x1C($0236, $00)                                     ;B4AB91
    %AICMD0x12_Jump($B4AB69)                                   ;B4AB95
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $00, $B4ABA9)   ;B4AB98
    %AICMD0x1A($00C8, $0158, $B38168, $02)                     ;B4AB9F
    %AICMD0x12_Jump($B4ABB8)                                   ;B4ABA7
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F6E, $04, $B4AC37)   ;B4ABAA
    %AICMD0x1A($00C8, $0158, $B3845C, $02)                     ;B4ABB1
    %AICMD0x1F($ABC4)                                          ;B4ABB9
    %AICMD0x12_Jump($B4ABB8)                                   ;B4ABBC
    %AICMD0x1F($AC29)                                          ;B4ABBF
    %AICMD0x12_Jump($B4ABBE)                                   ;B4ABC2
    %AICMD0x28($1F74, $7F, $00)                                ;B4ABC5
    %AICMD0x15($7F1F18, $00, $B4ABE4)                          ;B4ABCA
    %AICMD0x15($7F1F18, $01, $B4AC0D)                          ;B4ABD1
    %AICMD0x12_Jump($B4ABB8)                                   ;B4ABD8
    %AICMD0x23_OrWithIndexedValue($7F1F74, $00)                ;B4ABDB
    %AICMD0x0B($02)                                            ;B4ABE0
    %AICMD0x12_Jump($B4ABB8)                                   ;B4ABE2
    %AICMD0x1D($0252, $00)                                     ;B4ABE5
    %AICMD0x20($00, $ABF3)                                     ;B4ABE9
    %AICMD0x20($01, $AC00)                                     ;B4ABED
    %AICMD0x12_Jump($B4ABBE)                                   ;B4ABF1
    %AICMD0x1C($0253, $00)                                     ;B4ABF4
    %AICMD0x41_ModifyVariable($7F1F1F, $0008)                  ;B4ABF8
    %AICMD0x12_Jump($B4ABBE)                                   ;B4ABFE
    %AICMD0x1C($0254, $00)                                     ;B4AC01
    %AICMD0x41_ModifyVariable($7F1F1F, $0002)                  ;B4AC05
    %AICMD0x12_Jump($B4ABBE)                                   ;B4AC0B
    %AICMD0x1C($025D, $00)                                     ;B4AC0E
    %AICMD0x12_Jump($B4ABBE)                                   ;B4AC12
    %AICMD0x1C($026A, $00)                                     ;B4AC15
    %AICMD0x12_Jump($B4ABBE)                                   ;B4AC19
    %AICMD0x1C($0272, $00)                                     ;B4AC1C
    %AICMD0x12_Jump($B4ABBE)                                   ;B4AC20
    %AICMD0x1C($027A, $00)                                     ;B4AC23
    %AICMD0x12_Jump($B4ABBE)                                   ;B4AC27
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F74, $05, $B4ABDA)   ;B4AC2A
    %AICMD0x1C($027A, $00)                                     ;B4AC31
    %AICMD0x12_Jump($B4ABBE)                                   ;B4AC35
    %AICMD0x28($1F74, $7F, $00)                                ;B4AC38
    %AICMD0x10_End()                                           ;B4AC3D
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $01, $B4AC4F)   ;B4AC3E
    %AICMD0x1A($0098, $0058, $B38198, $00)                     ;B4AC45
    %AICMD0x12_Jump($B4AC5E)                                   ;B4AC4D
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F6E, $04, $B4AD5D)   ;B4AC50
    %AICMD0x1A($0098, $0058, $B3845C, $00)                     ;B4AC57
    %AICMD0x1F($AC6A)                                          ;B4AC5F
    %AICMD0x12_Jump($B4AC5E)                                   ;B4AC62
    %AICMD0x1F($AD4F)                                          ;B4AC65
    %AICMD0x12_Jump($B4AC64)                                   ;B4AC68
    %AICMD0x28($1F74, $7F, $01)                                ;B4AC6B
    %AICMD0x15($7F1F18, $00, $B4AC8A)                          ;B4AC70
    %AICMD0x15($7F1F18, $01, $B4AD14)                          ;B4AC77
    %AICMD0x12_Jump($B4AC5E)                                   ;B4AC7E
    %AICMD0x23_OrWithIndexedValue($7F1F74, $01)                ;B4AC81
    %AICMD0x0B($02)                                            ;B4AC86
    %AICMD0x12_Jump($B4AC5E)                                   ;B4AC88
    %AICMD0x1D($025E, $00)                                     ;B4AC8B
    %AICMD0x20($00, $AC99)                                     ;B4AC8F
    %AICMD0x20($01, $ACAF)                                     ;B4AC93
    %AICMD0x12_Jump($B4AC64)                                   ;B4AC97
    %AICMD0x08()                                               ;B4AC9A
    %AICMD0x19($00E9, $00)                                     ;B4AC9B
    %AICMD0x13($0078)                                          ;B4AC9F
    %AICMD0x11()                                               ;B4ACA2
    %AICMD0x1C($025F, $00)                                     ;B4ACA3
    %AICMD0x41_ModifyVariable($7F1F21, $0008)                  ;B4ACA7
    %AICMD0x12_Jump($B4AC64)                                   ;B4ACAD
    %AICMD0x1C($0260, $00)                                     ;B4ACB0
    %AICMD0x1B($0345, $00)                                     ;B4ACB4
    %AICMD0x1B($0346, $00)                                     ;B4ACB8
    %AICMD0x13($0028)                                          ;B4ACBC
    %AICMD0x1C($0261, $00)                                     ;B4ACBF
    %AICMD0x1B($0226, $00)                                     ;B4ACC3
    %AICMD0x41_ModifyVariable($7F1F21, $0002)                  ;B4ACC7
    %AICMD0x12_Jump($B4AC64)                                   ;B4ACCD
    %AICMD0x1D($026B, $00)                                     ;B4ACD0
    %AICMD0x20($00, $ACDE)                                     ;B4ACD4
    %AICMD0x20($01, $ACF4)                                     ;B4ACD8
    %AICMD0x12_Jump($B4AC64)                                   ;B4ACDC
    %AICMD0x08()                                               ;B4ACDF
    %AICMD0x19($00E9, $00)                                     ;B4ACE0
    %AICMD0x13($0078)                                          ;B4ACE4
    %AICMD0x11()                                               ;B4ACE7
    %AICMD0x1C($025F, $00)                                     ;B4ACE8
    %AICMD0x41_ModifyVariable($7F1F21, $0008)                  ;B4ACEC
    %AICMD0x12_Jump($B4AC64)                                   ;B4ACF2
    %AICMD0x1C($0260, $00)                                     ;B4ACF5
    %AICMD0x1B($0345, $00)                                     ;B4ACF9
    %AICMD0x1B($0346, $00)                                     ;B4ACFD
    %AICMD0x13($0028)                                          ;B4AD01
    %AICMD0x1C($026C, $00)                                     ;B4AD04
    %AICMD0x1B($0226, $00)                                     ;B4AD08
    %AICMD0x41_ModifyVariable($7F1F21, $0002)                  ;B4AD0C
    %AICMD0x12_Jump($B4AC64)                                   ;B4AD12
    %AICMD0x1C($027B, $00)                                     ;B4AD15
    %AICMD0x20($00, $AD23)                                     ;B4AD19
    %AICMD0x20($01, $AD39)                                     ;B4AD1D
    %AICMD0x12_Jump($B4AC64)                                   ;B4AD21
    %AICMD0x08()                                               ;B4AD24
    %AICMD0x19($00E9, $00)                                     ;B4AD25
    %AICMD0x13($0078)                                          ;B4AD29
    %AICMD0x11()                                               ;B4AD2C
    %AICMD0x1C($025F, $00)                                     ;B4AD2D
    %AICMD0x41_ModifyVariable($7F1F21, $0008)                  ;B4AD31
    %AICMD0x12_Jump($B4AC64)                                   ;B4AD37
    %AICMD0x1B($0345, $00)                                     ;B4AD3A
    %AICMD0x1B($0346, $00)                                     ;B4AD3E
    %AICMD0x13($003C)                                          ;B4AD42
    %AICMD0x1C($026C, $00)                                     ;B4AD45
    %AICMD0x1B($0226, $00)                                     ;B4AD49
    %AICMD0x12_Jump($B4AC64)                                   ;B4AD4D
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F74, $05, $B4AC80)   ;B4AD50
    %AICMD0x1C($0255, $00)                                     ;B4AD57
    %AICMD0x12_Jump($B4AC64)                                   ;B4AD5B
    %AICMD0x28($1F74, $7F, $01)                                ;B4AD5E
    %AICMD0x10_End()                                           ;B4AD63
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $02, $B4AD75)   ;B4AD64
    %AICMD0x1A($0148, $00A8, $B381C8, $00)                     ;B4AD6B
    %AICMD0x12_Jump($B4AD84)                                   ;B4AD73
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F6E, $04, $B4AE60)   ;B4AD76
    %AICMD0x1A($0148, $00A8, $B3845C, $00)                     ;B4AD7D
    %AICMD0x1F($AD90)                                          ;B4AD85
    %AICMD0x12_Jump($B4AD84)                                   ;B4AD88
    %AICMD0x1F($AE52)                                          ;B4AD8B
    %AICMD0x12_Jump($B4AD8A)                                   ;B4AD8E
    %AICMD0x28($1F74, $7F, $02)                                ;B4AD91
    %AICMD0x15($7F1F18, $00, $B4ADB0)                          ;B4AD96
    %AICMD0x15($7F1F18, $01, $B4ADE6)                          ;B4AD9D
    %AICMD0x12_Jump($B4AD84)                                   ;B4ADA4
    %AICMD0x23_OrWithIndexedValue($7F1F74, $02)                ;B4ADA7
    %AICMD0x0B($02)                                            ;B4ADAC
    %AICMD0x12_Jump($B4AD84)                                   ;B4ADAE
    %AICMD0x09($14, $B4A92E)                                   ;B4ADB1
    %AICMD0x1D($0256, $00)                                     ;B4ADB5
    %AICMD0x20($00, $ADC3)                                     ;B4ADB9
    %AICMD0x20($01, $ADD9)                                     ;B4ADBD
    %AICMD0x12_Jump($B4AD84)                                   ;B4ADC1
    %AICMD0x08()                                               ;B4ADC4
    %AICMD0x19($00FC, $00)                                     ;B4ADC5
    %AICMD0x13($0078)                                          ;B4ADC9
    %AICMD0x11()                                               ;B4ADCC
    %AICMD0x1C($0257, $00)                                     ;B4ADCD
    %AICMD0x41_ModifyVariable($7F1F23, $0008)                  ;B4ADD1
    %AICMD0x12_Jump($B4AD8A)                                   ;B4ADD7
    %AICMD0x1C($0258, $00)                                     ;B4ADDA
    %AICMD0x41_ModifyVariable($7F1F23, $0002)                  ;B4ADDE
    %AICMD0x12_Jump($B4AD8A)                                   ;B4ADE4
    %AICMD0x09($14, $B4A948)                                   ;B4ADE7
    %AICMD0x1D($0291, $00)                                     ;B4ADEB
    %AICMD0x20($00, $ADF9)                                     ;B4ADEF
    %AICMD0x20($01, $AE0F)                                     ;B4ADF3
    %AICMD0x12_Jump($B4AD8A)                                   ;B4ADF7
    %AICMD0x08()                                               ;B4ADFA
    %AICMD0x19($0038, $00)                                     ;B4ADFB
    %AICMD0x13($0078)                                          ;B4ADFF
    %AICMD0x11()                                               ;B4AE02
    %AICMD0x1C($0262, $00)                                     ;B4AE03
    %AICMD0x41_ModifyVariable($7F1F23, $0008)                  ;B4AE07
    %AICMD0x12_Jump($B4AD8A)                                   ;B4AE0D
    %AICMD0x1C($0263, $00)                                     ;B4AE10
    %AICMD0x41_ModifyVariable($7F1F23, $0002)                  ;B4AE14
    %AICMD0x12_Jump($B4AD8A)                                   ;B4AE1A
    %AICMD0x09($14, $B4A93B)                                   ;B4AE1D
    %AICMD0x1D($0256, $00)                                     ;B4AE21
    %AICMD0x20($00, $AE2F)                                     ;B4AE25
    %AICMD0x20($01, $ADD9)                                     ;B4AE29
    %AICMD0x12_Jump($B4AD8A)                                   ;B4AE2D
    %AICMD0x08()                                               ;B4AE30
    %AICMD0x19($00FD, $00)                                     ;B4AE31
    %AICMD0x13($0078)                                          ;B4AE35
    %AICMD0x11()                                               ;B4AE38
    %AICMD0x1C($027C, $00)                                     ;B4AE39
    %AICMD0x41_ModifyVariable($7F1F23, $0008)                  ;B4AE3D
    %AICMD0x12_Jump($B4AD8A)                                   ;B4AE43
    %AICMD0x1C($0258, $00)                                     ;B4AE46
    %AICMD0x41_ModifyVariable($7F1F23, $0002)                  ;B4AE4A
    %AICMD0x12_Jump($B4AD8A)                                   ;B4AE50
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F74, $05, $B4ADA6)   ;B4AE53
    %AICMD0x1C($026D, $00)                                     ;B4AE5A
    %AICMD0x12_Jump($B4AD8A)                                   ;B4AE5E
    %AICMD0x28($1F74, $7F, $02)                                ;B4AE61
    %AICMD0x10_End()                                           ;B4AE66
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $03, $B4AE78)   ;B4AE67
    %AICMD0x1A($0108, $0098, $B381E0, $00)                     ;B4AE6E
    %AICMD0x12_Jump($B4AE87)                                   ;B4AE76
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F6E, $04, $B4AF79)   ;B4AE79
    %AICMD0x1A($0108, $0098, $B3845C, $00)                     ;B4AE80
    %AICMD0x1F($AE93)                                          ;B4AE88
    %AICMD0x12_Jump($B4AE87)                                   ;B4AE8B
    %AICMD0x1F($AF6B)                                          ;B4AE8E
    %AICMD0x12_Jump($B4AE8D)                                   ;B4AE91
    %AICMD0x28($1F74, $7F, $03)                                ;B4AE94
    %AICMD0x15($7F1F18, $00, $B4AEB3)                          ;B4AE99
    %AICMD0x15($7F1F18, $01, $B4AEE9)                          ;B4AEA0
    %AICMD0x12_Jump($B4AE87)                                   ;B4AEA7
    %AICMD0x23_OrWithIndexedValue($7F1F74, $03)                ;B4AEAA
    %AICMD0x0B($02)                                            ;B4AEAF
    %AICMD0x12_Jump($B4AE8D)                                   ;B4AEB1
    %AICMD0x09($14, $B4A955)                                   ;B4AEB4
    %AICMD0x1D($0259, $00)                                     ;B4AEB8
    %AICMD0x20($00, $AEC6)                                     ;B4AEBC
    %AICMD0x20($01, $AEDC)                                     ;B4AEC0
    %AICMD0x12_Jump($B4AE87)                                   ;B4AEC4
    %AICMD0x08()                                               ;B4AEC7
    %AICMD0x19($0039, $00)                                     ;B4AEC8
    %AICMD0x13($0078)                                          ;B4AECC
    %AICMD0x11()                                               ;B4AECF
    %AICMD0x1C($025A, $00)                                     ;B4AED0
    %AICMD0x41_ModifyVariable($7F1F25, $0008)                  ;B4AED4
    %AICMD0x12_Jump($B4AE8D)                                   ;B4AEDA
    %AICMD0x1C($025B, $00)                                     ;B4AEDD
    %AICMD0x41_ModifyVariable($7F1F25, $0002)                  ;B4AEE1
    %AICMD0x12_Jump($B4AE8D)                                   ;B4AEE7
    %AICMD0x09($14, $B4A955)                                   ;B4AEEA
    %AICMD0x1D($0264, $00)                                     ;B4AEEE
    %AICMD0x20($00, $AEFC)                                     ;B4AEF2
    %AICMD0x20($01, $AF12)                                     ;B4AEF6
    %AICMD0x12_Jump($B4AE8D)                                   ;B4AEFA
    %AICMD0x08()                                               ;B4AEFD
    %AICMD0x19($0039, $00)                                     ;B4AEFE
    %AICMD0x13($0078)                                          ;B4AF02
    %AICMD0x11()                                               ;B4AF05
    %AICMD0x1C($0265, $00)                                     ;B4AF06
    %AICMD0x41_ModifyVariable($7F1F25, $0008)                  ;B4AF0A
    %AICMD0x12_Jump($B4AE8D)                                   ;B4AF10
    %AICMD0x1C($0266, $00)                                     ;B4AF13
    %AICMD0x41_ModifyVariable($7F1F25, $0002)                  ;B4AF17
    %AICMD0x12_Jump($B4AE8D)                                   ;B4AF1D
    %AICMD0x09($14, $B4A955)                                   ;B4AF20
    %AICMD0x1D($0275, $00)                                     ;B4AF24
    %AICMD0x20($00, $AF32)                                     ;B4AF28
    %AICMD0x20($01, $AF48)                                     ;B4AF2C
    %AICMD0x12_Jump($B4AE8D)                                   ;B4AF30
    %AICMD0x08()                                               ;B4AF33
    %AICMD0x19($0039, $00)                                     ;B4AF34
    %AICMD0x13($0078)                                          ;B4AF38
    %AICMD0x11()                                               ;B4AF3B
    %AICMD0x1C($0265, $00)                                     ;B4AF3C
    %AICMD0x41_ModifyVariable($7F1F25, $0008)                  ;B4AF40
    %AICMD0x12_Jump($B4AE8D)                                   ;B4AF46
    %AICMD0x1C($0266, $00)                                     ;B4AF49
    %AICMD0x41_ModifyVariable($7F1F25, $0002)                  ;B4AF4D
    %AICMD0x12_Jump($B4AE8D)                                   ;B4AF53
    %AICMD0x1C($027D, $00)                                     ;B4AF56
    %AICMD0x08()                                               ;B4AF5A
    %AICMD0x19($0039, $00)                                     ;B4AF5B
    %AICMD0x13($0078)                                          ;B4AF5F
    %AICMD0x11()                                               ;B4AF62
    %AICMD0x41_ModifyVariable($7F1F25, $0002)                  ;B4AF63
    %AICMD0x12_Jump($B4AE8D)                                   ;B4AF69
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F74, $05, $B4AEA9)   ;B4AF6C
    %AICMD0x1C($027D, $00)                                     ;B4AF73
    %AICMD0x12_Jump($B4AE8D)                                   ;B4AF77
    %AICMD0x28($1F74, $7F, $03)                                ;B4AF7A
    %AICMD0x10_End()                                           ;B4AF7F
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $04, $B4AF91)   ;B4AF80
    %AICMD0x1A($00B8, $0098, $B38204, $00)                     ;B4AF87
    %AICMD0x12_Jump($B4AFA0)                                   ;B4AF8F
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F6E, $04, $B4B074)   ;B4AF92
    %AICMD0x1A($00B8, $0098, $B3845C, $00)                     ;B4AF99
    %AICMD0x1F($AFAC)                                          ;B4AFA1
    %AICMD0x12_Jump($B4AFA0)                                   ;B4AFA4
    %AICMD0x1F($B066)                                          ;B4AFA7
    %AICMD0x12_Jump($B4AFA6)                                   ;B4AFAA
    %AICMD0x28($1F74, $7F, $04)                                ;B4AFAD
    %AICMD0x15($7F1F18, $00, $B4AFCC)                          ;B4AFB2
    %AICMD0x15($7F1F18, $01, $B4B02A)                          ;B4AFB9
    %AICMD0x12_Jump($B4AFA0)                                   ;B4AFC0
    %AICMD0x23_OrWithIndexedValue($7F1F74, $04)                ;B4AFC3
    %AICMD0x0B($02)                                            ;B4AFC8
    %AICMD0x12_Jump($B4AFA0)                                   ;B4AFCA
    %AICMD0x1D($0267, $00)                                     ;B4AFCD
    %AICMD0x20($00, $AFDB)                                     ;B4AFD1
    %AICMD0x20($01, $AFEE)                                     ;B4AFD5
    %AICMD0x12_Jump($B4AFA6)                                   ;B4AFD9
    %AICMD0x1C($0268, $00)                                     ;B4AFDC
    %AICMD0x32($00D4, $80, $0015)                              ;B4AFE0
    %AICMD0x41_ModifyVariable($7F1F27, $0008)                  ;B4AFE6
    %AICMD0x12_Jump($B4AFA6)                                   ;B4AFEC
    %AICMD0x1C($0269, $00)                                     ;B4AFEF
    %AICMD0x41_ModifyVariable($7F1F27, $0002)                  ;B4AFF3
    %AICMD0x12_Jump($B4AFA6)                                   ;B4AFF9
    %AICMD0x1D($026F, $00)                                     ;B4AFFC
    %AICMD0x20($00, $B00A)                                     ;B4B000
    %AICMD0x20($01, $B01D)                                     ;B4B004
    %AICMD0x12_Jump($B4AFA0)                                   ;B4B008
    %AICMD0x1C($0270, $00)                                     ;B4B00B
    %AICMD0x32($00D4, $80, $0015)                              ;B4B00F
    %AICMD0x41_ModifyVariable($7F1F27, $0008)                  ;B4B015
    %AICMD0x12_Jump($B4AFA6)                                   ;B4B01B
    %AICMD0x1C($0271, $00)                                     ;B4B01E
    %AICMD0x41_ModifyVariable($7F1F27, $0002)                  ;B4B022
    %AICMD0x12_Jump($B4AFA6)                                   ;B4B028
    %AICMD0x1D($0277, $00)                                     ;B4B02B
    %AICMD0x20($00, $B039)                                     ;B4B02F
    %AICMD0x20($01, $B04C)                                     ;B4B033
    %AICMD0x12_Jump($B4AFA6)                                   ;B4B037
    %AICMD0x1C($0278, $00)                                     ;B4B03A
    %AICMD0x32($00D4, $80, $0015)                              ;B4B03E
    %AICMD0x41_ModifyVariable($7F1F27, $0008)                  ;B4B044
    %AICMD0x12_Jump($B4AFA6)                                   ;B4B04A
    %AICMD0x1C($0279, $00)                                     ;B4B04D
    %AICMD0x41_ModifyVariable($7F1F27, $0002)                  ;B4B051
    %AICMD0x12_Jump($B4AFA6)                                   ;B4B057
    %AICMD0x1C($027F, $00)                                     ;B4B05A
    %AICMD0x32($00D4, $80, $0015)                              ;B4B05E
    %AICMD0x12_Jump($B4AFA6)                                   ;B4B064
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F74, $05, $B4AFC2)   ;B4B067
    %AICMD0x1C($0365, $00)                                     ;B4B06E
    %AICMD0x12_Jump($B4AFA6)                                   ;B4B072
    %AICMD0x28($1F74, $7F, $04)                                ;B4B075
    %AICMD0x10_End()                                           ;B4B07A
    %AICMD0x1A($00B8, $00B8, $B38300, $02)                     ;B4B07B
    %AICMD0x0C($09)                                            ;B4B083
    %AICMD0x13($00B4)                                          ;B4B085
    %AICMD0x1B($0294, $01)                                     ;B4B088
    %AICMD0x13($0032)                                          ;B4B08C
    %AICMD0x1B($0292, $00)                                     ;B4B08F
    %AICMD0x13($000A)                                          ;B4B093
    %AICMD0x1B($0294, $00)                                     ;B4B096
    %AICMD0x13($000A)                                          ;B4B09A
    %AICMD0x1B($0290, $00)                                     ;B4B09D
    %AICMD0x13($000A)                                          ;B4B0A1
    %AICMD0x1B($0294, $01)                                     ;B4B0A4
    %AICMD0x13($000A)                                          ;B4B0A8
    %AICMD0x1B($0294, $01)                                     ;B4B0AB
    %AICMD0x0D($FF, $00, $20, $02)                             ;B4B0AF
    %AICMD0x1B($0294, $01)                                     ;B4B0B4
    %AICMD0x0D($01, $00, $20, $02)                             ;B4B0B8
    %AICMD0x1B($0294, $01)                                     ;B4B0BD
    %AICMD0x0D($FF, $00, $10, $02)                             ;B4B0C1
    %AICMD0x1B($0294, $01)                                     ;B4B0C6
    %AICMD0x0D($01, $00, $10, $02)                             ;B4B0CA
    %AICMD0x12_Jump($B4B087)                                   ;B4B0CF
    %AICMD0x1A($00C8, $00B8, $B383D8, $03)                     ;B4B0D2
    %AICMD0x0C($09)                                            ;B4B0DA
    %AICMD0x13($00B4)                                          ;B4B0DC
    %AICMD0x1B($02C5, $00)                                     ;B4B0DF
    %AICMD0x13($000A)                                          ;B4B0E3
    %AICMD0x1B($02C9, $01)                                     ;B4B0E6
    %AICMD0x13($000A)                                          ;B4B0EA
    %AICMD0x1B($02C7, $00)                                     ;B4B0ED
    %AICMD0x13($000A)                                          ;B4B0F1
    %AICMD0x1B($02C9, $00)                                     ;B4B0F4
    %AICMD0x13($000A)                                          ;B4B0F8
    %AICMD0x1B($02C5, $00)                                     ;B4B0FB
    %AICMD0x13($0032)                                          ;B4B0FF
    %AICMD0x1B($02C9, $00)                                     ;B4B102
    %AICMD0x0D($01, $00, $20, $02)                             ;B4B106
    %AICMD0x1B($02C9, $00)                                     ;B4B10B
    %AICMD0x0D($FF, $00, $20, $02)                             ;B4B10F
    %AICMD0x1B($02C9, $00)                                     ;B4B114
    %AICMD0x0D($01, $00, $10, $02)                             ;B4B118
    %AICMD0x1B($02C9, $00)                                     ;B4B11D
    %AICMD0x0D($FF, $00, $10, $02)                             ;B4B121
    %AICMD0x12_Jump($B4B0DE)                                   ;B4B126
    %AICMD0x1A($0158, $00D8, $B38318, $02)                     ;B4B129
    %AICMD0x0C($09)                                            ;B4B131
    %AICMD0x13($00B4)                                          ;B4B133
    %AICMD0x1B($029B, $01)                                     ;B4B136
    %AICMD0x13($0032)                                          ;B4B13A
    %AICMD0x1B($0299, $00)                                     ;B4B13D
    %AICMD0x13($000A)                                          ;B4B141
    %AICMD0x1B($029B, $00)                                     ;B4B144
    %AICMD0x13($000A)                                          ;B4B148
    %AICMD0x1B($0297, $00)                                     ;B4B14B
    %AICMD0x13($000A)                                          ;B4B14F
    %AICMD0x1B($029B, $01)                                     ;B4B152
    %AICMD0x13($000A)                                          ;B4B156
    %AICMD0x1B($029B, $01)                                     ;B4B159
    %AICMD0x0D($FF, $00, $20, $02)                             ;B4B15D
    %AICMD0x1B($029B, $01)                                     ;B4B162
    %AICMD0x0D($01, $00, $20, $02)                             ;B4B166
    %AICMD0x1B($029B, $01)                                     ;B4B16B
    %AICMD0x0D($FF, $00, $10, $02)                             ;B4B16F
    %AICMD0x1B($029B, $01)                                     ;B4B174
    %AICMD0x0D($01, $00, $10, $02)                             ;B4B178
    %AICMD0x12_Jump($B4B135)                                   ;B4B17D
    %AICMD0x1A($0168, $00D8, $B383FC, $03)                     ;B4B180
    %AICMD0x0C($09)                                            ;B4B188
    %AICMD0x13($00B4)                                          ;B4B18A
    %AICMD0x1B($02D0, $00)                                     ;B4B18D
    %AICMD0x13($000A)                                          ;B4B191
    %AICMD0x1B($02CF, $00)                                     ;B4B194
    %AICMD0x13($000A)                                          ;B4B198
    %AICMD0x1B($02D0, $01)                                     ;B4B19B
    %AICMD0x13($000A)                                          ;B4B19F
    %AICMD0x1B($02CD, $00)                                     ;B4B1A2
    %AICMD0x13($000A)                                          ;B4B1A6
    %AICMD0x1B($02D0, $00)                                     ;B4B1A9
    %AICMD0x13($0032)                                          ;B4B1AD
    %AICMD0x1B($02D0, $00)                                     ;B4B1B0
    %AICMD0x0D($01, $00, $20, $02)                             ;B4B1B4
    %AICMD0x1B($02D0, $00)                                     ;B4B1B9
    %AICMD0x0D($FF, $00, $20, $02)                             ;B4B1BD
    %AICMD0x1B($02D0, $00)                                     ;B4B1C2
    %AICMD0x0D($01, $00, $10, $02)                             ;B4B1C6
    %AICMD0x1B($02D0, $00)                                     ;B4B1CB
    %AICMD0x0D($FF, $00, $10, $02)                             ;B4B1CF
    %AICMD0x12_Jump($B4B18C)                                   ;B4B1D4
    %AICMD0x1A($00B8, $0128, $B38420, $02)                     ;B4B1D7
    %AICMD0x0C($09)                                            ;B4B1DF
    %AICMD0x13($00B4)                                          ;B4B1E1
    %AICMD0x1B($02D7, $01)                                     ;B4B1E4
    %AICMD0x13($0032)                                          ;B4B1E8
    %AICMD0x1B($02D5, $00)                                     ;B4B1EB
    %AICMD0x13($000A)                                          ;B4B1EF
    %AICMD0x1B($02D7, $00)                                     ;B4B1F2
    %AICMD0x13($000A)                                          ;B4B1F6
    %AICMD0x1B($02D3, $00)                                     ;B4B1F9
    %AICMD0x13($000A)                                          ;B4B1FD
    %AICMD0x1B($02D7, $01)                                     ;B4B200
    %AICMD0x13($000A)                                          ;B4B204
    %AICMD0x1B($02D7, $00)                                     ;B4B207
    %AICMD0x0D($01, $00, $0C, $01)                             ;B4B20B
    %AICMD0x1B($02D7, $00)                                     ;B4B210
    %AICMD0x0D($FF, $00, $0C, $01)                             ;B4B214
    %AICMD0x1B($02D7, $00)                                     ;B4B219
    %AICMD0x0D($01, $00, $08, $01)                             ;B4B21D
    %AICMD0x1B($02D7, $00)                                     ;B4B222
    %AICMD0x0D($FF, $00, $08, $01)                             ;B4B226
    %AICMD0x12_Jump($B4B1E3)                                   ;B4B22B
    %AICMD0x1A($00C8, $0128, $B38384, $03)                     ;B4B22E
    %AICMD0x0C($09)                                            ;B4B236
    %AICMD0x13($00B4)                                          ;B4B238
    %AICMD0x1B($02B6, $01)                                     ;B4B23B
    %AICMD0x13($000A)                                          ;B4B23F
    %AICMD0x1B($02B4, $00)                                     ;B4B242
    %AICMD0x13($000A)                                          ;B4B246
    %AICMD0x1B($02B6, $00)                                     ;B4B249
    %AICMD0x13($000A)                                          ;B4B24D
    %AICMD0x1B($02B2, $00)                                     ;B4B250
    %AICMD0x13($000A)                                          ;B4B254
    %AICMD0x1B($02B6, $01)                                     ;B4B257
    %AICMD0x13($0032)                                          ;B4B25B
    %AICMD0x1B($02B6, $01)                                     ;B4B25E
    %AICMD0x0D($FF, $00, $0C, $01)                             ;B4B262
    %AICMD0x1B($02B6, $01)                                     ;B4B267
    %AICMD0x0D($01, $00, $0C, $01)                             ;B4B26B
    %AICMD0x1B($02B6, $01)                                     ;B4B270
    %AICMD0x0D($FF, $00, $08, $01)                             ;B4B274
    %AICMD0x1B($02B6, $01)                                     ;B4B279
    %AICMD0x0D($01, $00, $08, $01)                             ;B4B27D
    %AICMD0x12_Jump($B4B23A)                                   ;B4B282
    %AICMD0x1A($0110, $0108, $B38168, $03)                     ;B4B285
    %AICMD0x0C($09)                                            ;B4B28D
    %AICMD0x13($00C8)                                          ;B4B28F
    %AICMD0x1B($0223, $00)                                     ;B4B292
    %AICMD0x13($000A)                                          ;B4B296
    %AICMD0x1B($0221, $00)                                     ;B4B299
    %AICMD0x13($000A)                                          ;B4B29D
    %AICMD0x1B($0223, $01)                                     ;B4B2A0
    %AICMD0x13($000A)                                          ;B4B2A4
    %AICMD0x1B($021F, $00)                                     ;B4B2A7
    %AICMD0x13($000A)                                          ;B4B2AB
    %AICMD0x1B($0223, $00)                                     ;B4B2AE
    %AICMD0x13($0032)                                          ;B4B2B2
    %AICMD0x1B($0223, $00)                                     ;B4B2B5
    %AICMD0x0D($01, $00, $20, $02)                             ;B4B2B9
    %AICMD0x1B($0223, $00)                                     ;B4B2BE
    %AICMD0x0D($FF, $00, $20, $02)                             ;B4B2C2
    %AICMD0x1B($0223, $00)                                     ;B4B2C7
    %AICMD0x0D($01, $00, $10, $02)                             ;B4B2CB
    %AICMD0x1B($0223, $00)                                     ;B4B2D0
    %AICMD0x0D($FF, $00, $10, $02)                             ;B4B2D4
    %AICMD0x12_Jump($B4B291)                                   ;B4B2D9
    %AICMD0x1A($0110, $0108, $B38198, $03)                     ;B4B2DC
    %AICMD0x0C($09)                                            ;B4B2E4
    %AICMD0x13($00C8)                                          ;B4B2E6
    %AICMD0x1B($022B, $00)                                     ;B4B2E9
    %AICMD0x13($000A)                                          ;B4B2ED
    %AICMD0x1B($0229, $00)                                     ;B4B2F0
    %AICMD0x13($000A)                                          ;B4B2F4
    %AICMD0x1B($022B, $01)                                     ;B4B2F7
    %AICMD0x13($000A)                                          ;B4B2FB
    %AICMD0x1B($0227, $00)                                     ;B4B2FE
    %AICMD0x13($000A)                                          ;B4B302
    %AICMD0x1B($022B, $00)                                     ;B4B305
    %AICMD0x13($0032)                                          ;B4B309
    %AICMD0x1B($022B, $00)                                     ;B4B30C
    %AICMD0x0D($01, $00, $20, $02)                             ;B4B310
    %AICMD0x1B($022B, $00)                                     ;B4B315
    %AICMD0x0D($FF, $00, $20, $02)                             ;B4B319
    %AICMD0x1B($022B, $00)                                     ;B4B31E
    %AICMD0x0D($01, $00, $10, $02)                             ;B4B322
    %AICMD0x1B($022B, $00)                                     ;B4B327
    %AICMD0x0D($FF, $00, $10, $02)                             ;B4B32B
    %AICMD0x12_Jump($B4B2E8)                                   ;B4B330
    %AICMD0x1A($0110, $0108, $B381C8, $03)                     ;B4B333
    %AICMD0x0C($09)                                            ;B4B33B
    %AICMD0x13($00C8)                                          ;B4B33D
    %AICMD0x1B($0250, $00)                                     ;B4B340
    %AICMD0x13($000A)                                          ;B4B344
    %AICMD0x1B($024E, $00)                                     ;B4B347
    %AICMD0x13($000A)                                          ;B4B34B
    %AICMD0x1B($0250, $01)                                     ;B4B34E
    %AICMD0x13($000A)                                          ;B4B352
    %AICMD0x1B($024C, $00)                                     ;B4B355
    %AICMD0x13($000A)                                          ;B4B359
    %AICMD0x1B($0250, $00)                                     ;B4B35C
    %AICMD0x13($0032)                                          ;B4B360
    %AICMD0x1B($0250, $00)                                     ;B4B363
    %AICMD0x0D($01, $00, $20, $02)                             ;B4B367
    %AICMD0x1B($0250, $00)                                     ;B4B36C
    %AICMD0x0D($FF, $00, $20, $02)                             ;B4B370
    %AICMD0x1B($0250, $00)                                     ;B4B375
    %AICMD0x0D($01, $00, $10, $02)                             ;B4B379
    %AICMD0x1B($0250, $00)                                     ;B4B37E
    %AICMD0x0D($FF, $00, $10, $02)                             ;B4B382
    %AICMD0x12_Jump($B4B33F)                                   ;B4B387
    %AICMD0x1A($0110, $0108, $B381E0, $03)                     ;B4B38A
    %AICMD0x0C($09)                                            ;B4B392
    %AICMD0x13($00C8)                                          ;B4B394
    %AICMD0x1B($0241, $00)                                     ;B4B397
    %AICMD0x13($000A)                                          ;B4B39B
    %AICMD0x1B($023F, $00)                                     ;B4B39E
    %AICMD0x13($000A)                                          ;B4B3A2
    %AICMD0x1B($0241, $01)                                     ;B4B3A5
    %AICMD0x13($000A)                                          ;B4B3A9
    %AICMD0x1B($023D, $00)                                     ;B4B3AC
    %AICMD0x13($000A)                                          ;B4B3B0
    %AICMD0x1B($0241, $00)                                     ;B4B3B3
    %AICMD0x13($0032)                                          ;B4B3B7
    %AICMD0x1B($0241, $00)                                     ;B4B3BA
    %AICMD0x0D($01, $00, $20, $02)                             ;B4B3BE
    %AICMD0x1B($0241, $00)                                     ;B4B3C3
    %AICMD0x0D($FF, $00, $20, $02)                             ;B4B3C7
    %AICMD0x1B($0241, $00)                                     ;B4B3CC
    %AICMD0x0D($01, $00, $10, $02)                             ;B4B3D0
    %AICMD0x1B($0241, $00)                                     ;B4B3D5
    %AICMD0x0D($FF, $00, $10, $02)                             ;B4B3D9
    %AICMD0x12_Jump($B4B396)                                   ;B4B3DE
    %AICMD0x1A($0110, $0108, $B38204, $03)                     ;B4B3E1
    %AICMD0x0C($09)                                            ;B4B3E9
    %AICMD0x13($00C8)                                          ;B4B3EB
    %AICMD0x1B($0249, $00)                                     ;B4B3EE
    %AICMD0x13($000A)                                          ;B4B3F2
    %AICMD0x1B($0247, $00)                                     ;B4B3F5
    %AICMD0x13($000A)                                          ;B4B3F9
    %AICMD0x1B($0249, $01)                                     ;B4B3FC
    %AICMD0x13($000A)                                          ;B4B400
    %AICMD0x1B($0245, $00)                                     ;B4B403
    %AICMD0x13($000A)                                          ;B4B407
    %AICMD0x1B($0249, $00)                                     ;B4B40A
    %AICMD0x13($0032)                                          ;B4B40E
    %AICMD0x1B($0249, $00)                                     ;B4B411
    %AICMD0x0D($01, $00, $20, $02)                             ;B4B415
    %AICMD0x1B($0249, $00)                                     ;B4B41A
    %AICMD0x0D($FF, $00, $20, $02)                             ;B4B41E
    %AICMD0x1B($0249, $00)                                     ;B4B423
    %AICMD0x0D($01, $00, $10, $02)                             ;B4B427
    %AICMD0x1B($0249, $00)                                     ;B4B42C
    %AICMD0x0D($FF, $00, $10, $02)                             ;B4B430
    %AICMD0x12_Jump($B4B3ED)                                   ;B4B435
    %AICMD0x1A($0110, $0108, $B3845C, $03)                     ;B4B438
    %AICMD0x0C($09)                                            ;B4B440
    %AICMD0x13($00C8)                                          ;B4B442
    %AICMD0x1B($02E7, $00)                                     ;B4B445
    %AICMD0x13($000A)                                          ;B4B449
    %AICMD0x1B($02E5, $00)                                     ;B4B44C
    %AICMD0x13($000A)                                          ;B4B450
    %AICMD0x1B($02E7, $01)                                     ;B4B453
    %AICMD0x13($000A)                                          ;B4B457
    %AICMD0x1B($02E3, $00)                                     ;B4B45A
    %AICMD0x13($000A)                                          ;B4B45E
    %AICMD0x1B($02E7, $00)                                     ;B4B461
    %AICMD0x13($0032)                                          ;B4B465
    %AICMD0x1B($02E7, $00)                                     ;B4B468
    %AICMD0x0D($01, $00, $20, $02)                             ;B4B46C
    %AICMD0x1B($02E7, $00)                                     ;B4B471
    %AICMD0x0D($FF, $00, $20, $02)                             ;B4B475
    %AICMD0x1B($02E7, $00)                                     ;B4B47A
    %AICMD0x0D($01, $00, $10, $02)                             ;B4B47E
    %AICMD0x1B($02E7, $00)                                     ;B4B483
    %AICMD0x0D($FF, $00, $10, $02)                             ;B4B487
    %AICMD0x12_Jump($B4B444)                                   ;B4B48C

DATA8_B4B48E:
 
AI_B4B48E:
    %AICMD0x4F()                                               ;B4B48E
    %AICMD0x50()                                               ;B4B490
    %AICMD0x23_OrWithIndexedValue($7F1F60, $09)                ;B4B491
    %AICMD0x00_SetMusic($08, $B4)                              ;B4B496
    %AICMD0x02_FreezeTime()                                    ;B4B499
    %AICMD0x03_SetHour($07)                                    ;B4B49A
    %AICMD0x05_SetPosition($0108, $0108)                       ;B4B49C
    %AICMD0x07_SetPlayerDirection($02)                         ;B4B4A1
    %AICMD0x08()                                               ;B4B4A3
    %AICMD0x19($00E8, $00)                                     ;B4B4A4
    %AICMD0x09($01, $B4B07A)                                   ;B4B4A8
    %AICMD0x09($02, $B4B0D1)                                   ;B4B4AC
    %AICMD0x09($03, $B4B128)                                   ;B4B4B0
    %AICMD0x09($04, $B4B17F)                                   ;B4B4B4
    %AICMD0x09($05, $B4B1D6)                                   ;B4B4B8
    %AICMD0x09($06, $B4B22D)                                   ;B4B4BC
    %AICMD0x09($08, $B4B4EC)                                   ;B4B4C0
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F74, $00, $B4A6C9)   ;B4B4C4
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F74, $01, $B4A6DD)   ;B4B4CB
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F74, $02, $B4A6F1)   ;B4B4D2
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F74, $03, $B4A705)   ;B4B4D9
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F74, $04, $B4A719)   ;B4B4E0
    %AICMD0x06_SetDestination($09)                             ;B4B4E7
    %AICMD0x38()                                               ;B4B4E9
    %AICMD0x0B($09)                                            ;B4B4EA
    %AICMD0x10_End()                                           ;B4B4EC
    %AICMD0x1A($0100, $0108, $B380D8, $02)                     ;B4B4ED
    %AICMD0x0C($09)                                            ;B4B4F5
    %AICMD0x13($00C8)                                          ;B4B4F7
    %AICMD0x1B($0002, $01)                                     ;B4B4FA
    %AICMD0x13($0032)                                          ;B4B4FE
    %AICMD0x1B($0000, $00)                                     ;B4B501
    %AICMD0x13($000A)                                          ;B4B505
    %AICMD0x1B($0002, $00)                                     ;B4B508
    %AICMD0x13($000A)                                          ;B4B50C
    %AICMD0x1B($0001, $00)                                     ;B4B50F
    %AICMD0x13($000A)                                          ;B4B513
    %AICMD0x1B($0002, $01)                                     ;B4B516
    %AICMD0x13($000A)                                          ;B4B51A
    %AICMD0x1B($0002, $01)                                     ;B4B51D
    %AICMD0x0D($FF, $00, $20, $02)                             ;B4B521
    %AICMD0x1B($0002, $01)                                     ;B4B526
    %AICMD0x0D($01, $00, $20, $02)                             ;B4B52A
    %AICMD0x1B($0002, $01)                                     ;B4B52F
    %AICMD0x0D($FF, $00, $10, $02)                             ;B4B533
    %AICMD0x1B($0002, $01)                                     ;B4B538
    %AICMD0x0D($01, $00, $10, $02)                             ;B4B53C
    %AICMD0x1B($0002, $01)                                     ;B4B541
    %AICMD0x13($0032)                                          ;B4B545
    %AICMD0x1B($0000, $00)                                     ;B4B548
    %AICMD0x13($000A)                                          ;B4B54C
    %AICMD0x1B($0002, $00)                                     ;B4B54F
    %AICMD0x13($000A)                                          ;B4B553
    %AICMD0x1B($0001, $00)                                     ;B4B556
    %AICMD0x13($000A)                                          ;B4B55A
    %AICMD0x1B($0002, $01)                                     ;B4B55D
    %AICMD0x13($000A)                                          ;B4B561
    %AICMD0x1B($0002, $01)                                     ;B4B564
    %AICMD0x0D($FF, $00, $20, $02)                             ;B4B568
    %AICMD0x1B($0002, $01)                                     ;B4B56D
    %AICMD0x0D($01, $00, $20, $02)                             ;B4B571
    %AICMD0x1B($0002, $01)                                     ;B4B576
    %AICMD0x0D($FF, $00, $10, $02)                             ;B4B57A
    %AICMD0x1B($0002, $01)                                     ;B4B57F
    %AICMD0x0D($01, $00, $10, $02)                             ;B4B583
    %AICMD0x1B($0002, $01)                                     ;B4B588
    %AICMD0x13($0032)                                          ;B4B58C
    %AICMD0x1B($0000, $00)                                     ;B4B58F
    %AICMD0x13($000A)                                          ;B4B593
    %AICMD0x1B($0002, $00)                                     ;B4B596
    %AICMD0x13($000A)                                          ;B4B59A
    %AICMD0x1B($0001, $00)                                     ;B4B59D
    %AICMD0x13($000A)                                          ;B4B5A1
    %AICMD0x1B($0002, $01)                                     ;B4B5A4
    %AICMD0x13($000A)                                          ;B4B5A8
    %AICMD0x1B($0002, $01)                                     ;B4B5AB
    %AICMD0x0D($FF, $00, $20, $02)                             ;B4B5AF
    %AICMD0x1B($0002, $01)                                     ;B4B5B4
    %AICMD0x0D($01, $00, $20, $02)                             ;B4B5B8
    %AICMD0x1B($0002, $01)                                     ;B4B5BD
    %AICMD0x0D($FF, $00, $10, $02)                             ;B4B5C1
    %AICMD0x1B($0002, $01)                                     ;B4B5C6
    %AICMD0x0D($01, $00, $10, $02)                             ;B4B5CA
    %AICMD0x1B($0002, $01)                                     ;B4B5CF
    %AICMD0x13($0032)                                          ;B4B5D3
    %AICMD0x1B($0000, $00)                                     ;B4B5D6
    %AICMD0x13($000A)                                          ;B4B5DA
    %AICMD0x1B($0002, $00)                                     ;B4B5DD
    %AICMD0x13($000A)                                          ;B4B5E1
    %AICMD0x1B($0001, $00)                                     ;B4B5E4
    %AICMD0x13($000A)                                          ;B4B5E8
    %AICMD0x1B($0002, $01)                                     ;B4B5EB
    %AICMD0x13($000A)                                          ;B4B5EF
    %AICMD0x1B($0002, $01)                                     ;B4B5F2
    %AICMD0x0D($FF, $00, $20, $02)                             ;B4B5F6
    %AICMD0x1B($0002, $01)                                     ;B4B5FB
    %AICMD0x0D($01, $00, $20, $02)                             ;B4B5FF
    %AICMD0x1B($0002, $01)                                     ;B4B604
    %AICMD0x0D($FF, $00, $10, $02)                             ;B4B608
    %AICMD0x1B($0002, $01)                                     ;B4B60D
    %AICMD0x0D($01, $00, $10, $02)                             ;B4B611
    %AICMD0x1B($0002, $01)                                     ;B4B616
    %AICMD0x13($0032)                                          ;B4B61A
    %AICMD0x1B($0000, $00)                                     ;B4B61D
    %AICMD0x13($000A)                                          ;B4B621
    %AICMD0x1B($0002, $00)                                     ;B4B624
    %AICMD0x13($000A)                                          ;B4B628
    %AICMD0x1B($0001, $00)                                     ;B4B62B
    %AICMD0x13($000A)                                          ;B4B62F
    %AICMD0x1B($0002, $01)                                     ;B4B632
    %AICMD0x13($000A)                                          ;B4B636
    %AICMD0x1B($0002, $01)                                     ;B4B639
    %AICMD0x0D($FF, $00, $20, $02)                             ;B4B63D
    %AICMD0x1B($0002, $01)                                     ;B4B642
    %AICMD0x0D($01, $00, $20, $02)                             ;B4B646
    %AICMD0x1B($0002, $01)                                     ;B4B64B
    %AICMD0x0D($FF, $00, $10, $02)                             ;B4B64F
    %AICMD0x1B($0002, $01)                                     ;B4B654
    %AICMD0x0D($01, $00, $10, $02)                             ;B4B658
    %AICMD0x3C()                                               ;B4B65D
    %AICMD0x10_End()                                           ;B4B65E

pScripting_B4B65E:
    dw DATA8_B4B67E                                            ;B4B65E|        |B4B67E;
    dw DATA8_B4B947                                            ;B4B660|        |B4B947;
    dw DATA8_B4B9C2                                            ;B4B662|        |B4B9C2;
    dw DATA8_B4BA8E                                            ;B4B664|        |B4BA8E;
    dw pScripting_B4BACB                                       ;B4B666|        |B4BACB;
    dw pScripting_B4BACB                                       ;B4B668|        |B4BACB;
    dw pScripting_B4BACB                                       ;B4B66A|        |B4BACB;
    dw pScripting_B4BACB                                       ;B4B66C|        |B4BACB;
    dw pScripting_B4BACB                                       ;B4B66E|        |B4BACB;
    dw pScripting_B4BACB                                       ;B4B670|        |B4BACB;
    dw pScripting_B4BACB                                       ;B4B672|        |B4BACB;
    dw pScripting_B4BACB                                       ;B4B674|        |B4BACB;
    dw pScripting_B4BACB                                       ;B4B676|        |B4BACB;
    dw pScripting_B4BACB                                       ;B4B678|        |B4BACB;
    dw pScripting_B4BACB                                       ;B4B67A|        |B4BACB;
    dw pScripting_B4BACB                                       ;B4B67C|        |B4BACB;
 
DATA8_B4B67E:
 
AI_B4B67E:
    %AICMD0x4F()                                               ;B4B67E
    %AICMD0x50()                                               ;B4B680
    %AICMD0x09($01, $B4B6EB)                                   ;B4B681
    %AICMD0x09($02, $B4B72A)                                   ;B4B685
    %AICMD0x09($03, $B4B75B)                                   ;B4B689
    %AICMD0x09($04, $B4B785)                                   ;B4B68D
    %AICMD0x09($05, $B4B7AD)                                   ;B4B691
    %AICMD0x09($0A, $B4B6CC)                                   ;B4B695
    %AICMD0x12_Jump($B4B69D)                                   ;B4B699
    %AICMD0x38()                                               ;B4B69C
    %AICMD0x10_End()                                           ;B4B69D
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $01, $B4B6A8)   ;B4B69E
    %AICMD0x09($06, $B4B7C9)                                   ;B4B6A5
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $02, $B4B6B3)   ;B4B6A9
    %AICMD0x09($07, $B4B826)                                   ;B4B6B0
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $03, $B4B6BE)   ;B4B6B4
    %AICMD0x09($08, $B4B883)                                   ;B4B6BB
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $04, $B4B6C9)   ;B4B6BF
    %AICMD0x09($09, $B4B8E0)                                   ;B4B6C6
    %AICMD0x12_Jump($B4B69B)                                   ;B4B6CA
    %AICMD0x1A($01A8, $0328, $B387C8, $00)                     ;B4B6CD
    %AICMD0x1B($03DA, $00)                                     ;B4B6D5
    %AICMD0x13($00B4)                                          ;B4B6D9
    %AICMD0x1B($03D9, $00)                                     ;B4B6DC
    %AICMD0x13($0168)                                          ;B4B6E0
    %AICMD0x12_Jump($B4B6E5)                                   ;B4B6E3
    %AICMD0x13($0001)                                          ;B4B6E6
    %AICMD0x12_Jump($B4B6E5)                                   ;B4B6E9
    %AICMD0x1A($0228, $0378, $B3836C, $00)                     ;B4B6EC
    %AICMD0x1F($B6F9)                                          ;B4B6F4
    %AICMD0x12_Jump($B4B6F3)                                   ;B4B6F7
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $00, $B4B723)   ;B4B6FA
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $01, $B4B723)   ;B4B701
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $02, $B4B723)   ;B4B708
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $03, $B4B723)   ;B4B70F
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $04, $B4B723)   ;B4B716
    %AICMD0x1C($0296, $00)                                     ;B4B71D
    %AICMD0x12_Jump($B4B6F3)                                   ;B4B721
    %AICMD0x1C($0495, $00)                                     ;B4B724
    %AICMD0x12_Jump($B4B6F3)                                   ;B4B728
    %AICMD0x1A($0178, $0308, $B38408, $00)                     ;B4B72B
    %AICMD0x22($10, $10, $01, $B38408, $01)                    ;B4B733
    %AICMD0x1F($B73F)                                          ;B4B73A
    %AICMD0x12_Jump($B4B739)                                   ;B4B73D
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $01, $B4B754)   ;B4B740
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $02, $B4B754)   ;B4B747
    %AICMD0x1C($0299, $00)                                     ;B4B74E
    %AICMD0x12_Jump($B4B739)                                   ;B4B752
    %AICMD0x1C($0497, $00)                                     ;B4B755
    %AICMD0x12_Jump($B4B739)                                   ;B4B759
    %AICMD0x1A($0178, $0368, $B38318, $00)                     ;B4B75C
    %AICMD0x1F($B769)                                          ;B4B764
    %AICMD0x12_Jump($B4B763)                                   ;B4B767
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $01, $B4B77E)   ;B4B76A
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $02, $B4B77E)   ;B4B771
    %AICMD0x1C($029A, $00)                                     ;B4B778
    %AICMD0x12_Jump($B4B763)                                   ;B4B77C
    %AICMD0x1C($0496, $00)                                     ;B4B77F
    %AICMD0x12_Jump($B4B763)                                   ;B4B783
    %AICMD0x1A($0178, $01D8, $B382B8, $03)                     ;B4B786
    %AICMD0x16($7F1F1C, $11, $12, $B4B7A2)                     ;B4B78E
    %AICMD0x1F($B79B)                                          ;B4B796
    %AICMD0x12_Jump($B4B795)                                   ;B4B799
    %AICMD0x1C($0295, $00)                                     ;B4B79C
    %AICMD0x12_Jump($B4B795)                                   ;B4B7A0
    %AICMD0x1B($027B, $01)                                     ;B4B7A3
    %AICMD0x0D($01, $00, $40, $01)                             ;B4B7A7
    %AICMD0x37()                                               ;B4B7AC
    %AICMD0x10_End()                                           ;B4B7AD
    %AICMD0x1A($00E8, $01A8, $B3827C, $00)                     ;B4B7AE
    %AICMD0x22($20, $10, $01, $B38288, $18)                    ;B4B7B6
    %AICMD0x1F($B7C2)                                          ;B4B7BD
    %AICMD0x12_Jump($B4B7BC)                                   ;B4B7C0
    %AICMD0x1C($0294, $00)                                     ;B4B7C3
    %AICMD0x12_Jump($B4B7BC)                                   ;B4B7C7
    %AICMD0x1A($01B0, $0368, $B38198, $00)                     ;B4B7CA
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F74, $01, $B4B7DE)   ;B4B7D2
    %AICMD0x1F($B7E4)                                          ;B4B7D9
    %AICMD0x12_Jump($B4B7D8)                                   ;B4B7DC
    %AICMD0x1F($B81F)                                          ;B4B7DF
    %AICMD0x12_Jump($B4B7DE)                                   ;B4B7E2
    %AICMD0x45($7F1F21, $0000, $0077, $B4B818)                 ;B4B7E5
    %AICMD0x45($7F1F21, $0078, $03E7, $B4B7FB)                 ;B4B7EF
    %AICMD0x12_Jump($B4B7D8)                                   ;B4B7F9
    %AICMD0x1C($02A1, $00)                                     ;B4B7FC
    %AICMD0x23_OrWithIndexedValue($7F1F74, $01)                ;B4B800
    %AICMD0x08()                                               ;B4B805
    %AICMD0x19($0039, $00)                                     ;B4B806
    %AICMD0x13($0078)                                          ;B4B80A
    %AICMD0x11()                                               ;B4B80D
    %AICMD0x41_ModifyVariable($7F1F33, $000A)                  ;B4B80E
    %AICMD0x57_UpdateStamina($14)                              ;B4B814
    %AICMD0x12_Jump($B4B7DE)                                   ;B4B816
    %AICMD0x1C($02A3, $00)                                     ;B4B819
    %AICMD0x12_Jump($B4B7D8)                                   ;B4B81D
    %AICMD0x1C($02A2, $00)                                     ;B4B820
    %AICMD0x12_Jump($B4B7DE)                                   ;B4B824
    %AICMD0x1A($0268, $0108, $B381D4, $00)                     ;B4B827
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F74, $02, $B4B83B)   ;B4B82F
    %AICMD0x1F($B841)                                          ;B4B836
    %AICMD0x12_Jump($B4B835)                                   ;B4B839
    %AICMD0x1F($B87C)                                          ;B4B83C
    %AICMD0x12_Jump($B4B83B)                                   ;B4B83F
    %AICMD0x45($7F1F23, $0000, $0077, $B4B875)                 ;B4B842
    %AICMD0x45($7F1F23, $0078, $03E7, $B4B858)                 ;B4B84C
    %AICMD0x12_Jump($B4B835)                                   ;B4B856
    %AICMD0x1C($02A4, $00)                                     ;B4B859
    %AICMD0x23_OrWithIndexedValue($7F1F74, $02)                ;B4B85D
    %AICMD0x08()                                               ;B4B862
    %AICMD0x19($0039, $00)                                     ;B4B863
    %AICMD0x13($0078)                                          ;B4B867
    %AICMD0x11()                                               ;B4B86A
    %AICMD0x41_ModifyVariable($7F1F33, $000A)                  ;B4B86B
    %AICMD0x57_UpdateStamina($14)                              ;B4B871
    %AICMD0x12_Jump($B4B83B)                                   ;B4B873
    %AICMD0x1C($02A6, $00)                                     ;B4B876
    %AICMD0x12_Jump($B4B835)                                   ;B4B87A
    %AICMD0x1C($02A5, $00)                                     ;B4B87D
    %AICMD0x12_Jump($B4B83B)                                   ;B4B881
    %AICMD0x1A($01B8, $0168, $B381E0, $00)                     ;B4B884
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F74, $03, $B4B898)   ;B4B88C
    %AICMD0x1F($B89E)                                          ;B4B893
    %AICMD0x12_Jump($B4B892)                                   ;B4B896
    %AICMD0x1F($B8D9)                                          ;B4B899
    %AICMD0x12_Jump($B4B898)                                   ;B4B89C
    %AICMD0x45($7F1F25, $0000, $0077, $B4B8D2)                 ;B4B89F
    %AICMD0x45($7F1F25, $0078, $03E7, $B4B8B5)                 ;B4B8A9
    %AICMD0x12_Jump($B4B892)                                   ;B4B8B3
    %AICMD0x1C($02A7, $00)                                     ;B4B8B6
    %AICMD0x23_OrWithIndexedValue($7F1F74, $03)                ;B4B8BA
    %AICMD0x08()                                               ;B4B8BF
    %AICMD0x19($0039, $00)                                     ;B4B8C0
    %AICMD0x13($0078)                                          ;B4B8C4
    %AICMD0x11()                                               ;B4B8C7
    %AICMD0x41_ModifyVariable($7F1F33, $000A)                  ;B4B8C8
    %AICMD0x57_UpdateStamina($14)                              ;B4B8CE
    %AICMD0x12_Jump($B4B898)                                   ;B4B8D0
    %AICMD0x1C($02A0, $00)                                     ;B4B8D3
    %AICMD0x12_Jump($B4B892)                                   ;B4B8D7
    %AICMD0x1C($02A8, $00)                                     ;B4B8DA
    %AICMD0x12_Jump($B4B898)                                   ;B4B8DE
    %AICMD0x1A($0048, $0298, $B38204, $00)                     ;B4B8E1
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F74, $04, $B4B8F5)   ;B4B8E9
    %AICMD0x1F($B8FB)                                          ;B4B8F0
    %AICMD0x12_Jump($B4B8EF)                                   ;B4B8F3
    %AICMD0x1F($B936)                                          ;B4B8F6
    %AICMD0x12_Jump($B4B8F5)                                   ;B4B8F9
    %AICMD0x45($7F1F27, $0000, $0077, $B4B92F)                 ;B4B8FC
    %AICMD0x45($7F1F27, $0078, $03E7, $B4B912)                 ;B4B906
    %AICMD0x12_Jump($B4B8EF)                                   ;B4B910
    %AICMD0x1C($02AA, $00)                                     ;B4B913
    %AICMD0x23_OrWithIndexedValue($7F1F74, $04)                ;B4B917
    %AICMD0x08()                                               ;B4B91C
    %AICMD0x19($0039, $00)                                     ;B4B91D
    %AICMD0x13($0078)                                          ;B4B921
    %AICMD0x11()                                               ;B4B924
    %AICMD0x41_ModifyVariable($7F1F33, $000A)                  ;B4B925
    %AICMD0x57_UpdateStamina($14)                              ;B4B92B
    %AICMD0x12_Jump($B4B8F5)                                   ;B4B92D
    %AICMD0x1C($02A0, $00)                                     ;B4B930
    %AICMD0x12_Jump($B4B8EF)                                   ;B4B934
    %AICMD0x1C($02AB, $00)                                     ;B4B937
    %AICMD0x12_Jump($B4B8F5)                                   ;B4B93B
    %AICMD0x08()                                               ;B4B93E
    %AICMD0x3E($06)                                            ;B4B93F
    %AICMD0x13($003C)                                          ;B4B941
    %AICMD0x11()                                               ;B4B944
    %AICMD0x12_Jump($B4B69C)                                   ;B4B945

DATA8_B4B947:
 
AI_B4B947:
    %AICMD0x4F()                                               ;B4B947
    %AICMD0x50()                                               ;B4B949
    %AICMD0x23_OrWithIndexedValue($7F1F66, $01)                ;B4B94A
    %AICMD0x02_FreezeTime()                                    ;B4B94F
    %AICMD0x03_SetHour($06)                                    ;B4B950
    %AICMD0x05_SetPosition($0088, $0078)                       ;B4B952
    %AICMD0x07_SetPlayerDirection($00)                         ;B4B957
    %AICMD0x11()                                               ;B4B959
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $00, $B4B97F)   ;B4B95A
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $01, $B4B97F)   ;B4B961
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $02, $B4B97F)   ;B4B968
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $03, $B4B97F)   ;B4B96F
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $04, $B4B97F)   ;B4B976
    %AICMD0x12_Jump($B4B983)                                   ;B4B97D
    %AICMD0x09($01, $B4B98A)                                   ;B4B980
    %AICMD0x38()                                               ;B4B984
    %AICMD0x13($0001)                                          ;B4B985
    %AICMD0x12_Jump($B4B984)                                   ;B4B988
    %AICMD0x1A($0028, $0080, $B3845C, $00)                     ;B4B98B
    %AICMD0x1F($B99E)                                          ;B4B993
    %AICMD0x12_Jump($B4B992)                                   ;B4B996
    %AICMD0x1F($B9B1)                                          ;B4B999
    %AICMD0x12_Jump($B4B998)                                   ;B4B99C
    %AICMD0x1C($0292, $00)                                     ;B4B99F
    %AICMD0x09($02, $B4B9B8)                                   ;B4B9A3
    %AICMD0x41_ModifyVariable($7F1F33, $000A)                  ;B4B9A7
    %AICMD0x57_UpdateStamina($14)                              ;B4B9AD
    %AICMD0x12_Jump($B4B998)                                   ;B4B9AF
    %AICMD0x1C($0293, $00)                                     ;B4B9B2
    %AICMD0x12_Jump($B4B998)                                   ;B4B9B6
    %AICMD0x08()                                               ;B4B9B9
    %AICMD0x3E($06)                                            ;B4B9BA
    %AICMD0x13($003C)                                          ;B4B9BC
    %AICMD0x11()                                               ;B4B9BF
    %AICMD0x12_Jump($B4B984)                                   ;B4B9C0

DATA8_B4B9C2:
 
AI_B4B9C2:
    %AICMD0x4F()                                               ;B4B9C2
    %AICMD0x50()                                               ;B4B9C4
    %AICMD0x09($01, $B4B9DD)                                   ;B4B9C5
    %AICMD0x09($02, $B4BA00)                                   ;B4B9C9
    %AICMD0x09($03, $B4BA1C)                                   ;B4B9CD
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $00, $B4B9DB)   ;B4B9D1
    %AICMD0x09($04, $B4BA31)                                   ;B4B9D8
    %AICMD0x38()                                               ;B4B9DC
    %AICMD0x10_End()                                           ;B4B9DD
    %AICMD0x1A($0070, $00F8, $B38354, $00)                     ;B4B9DE
    %AICMD0x1F($B9EB)                                          ;B4B9E6
    %AICMD0x12_Jump($B4B9E5)                                   ;B4B9E9
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $00, $B4B9F9)   ;B4B9EC
    %AICMD0x1C($029B, $00)                                     ;B4B9F3
    %AICMD0x12_Jump($B4B9E5)                                   ;B4B9F7
    %AICMD0x1C($0494, $00)                                     ;B4B9FA
    %AICMD0x12_Jump($B4B9E5)                                   ;B4B9FE
    %AICMD0x1A($0080, $0138, $B3842C, $00)                     ;B4BA01
    %AICMD0x22($18, $20, $01, $B3842C, $10)                    ;B4BA09
    %AICMD0x1F($BA15)                                          ;B4BA10
    %AICMD0x12_Jump($B4BA0F)                                   ;B4BA13
    %AICMD0x1C($029C, $00)                                     ;B4BA16
    %AICMD0x12_Jump($B4BA0F)                                   ;B4BA1A
    %AICMD0x1A($00A8, $01B8, $B38390, $01)                     ;B4BA1D
    %AICMD0x1F($BA2A)                                          ;B4BA25
    %AICMD0x12_Jump($B4BA24)                                   ;B4BA28
    %AICMD0x1C($029D, $00)                                     ;B4BA2B
    %AICMD0x12_Jump($B4BA24)                                   ;B4BA2F
    %AICMD0x1A($0048, $0098, $B38174, $00)                     ;B4BA32
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F74, $00, $B4BA46)   ;B4BA3A
    %AICMD0x1F($BA4C)                                          ;B4BA41
    %AICMD0x12_Jump($B4BA40)                                   ;B4BA44
    %AICMD0x1F($BA87)                                          ;B4BA47
    %AICMD0x12_Jump($B4BA46)                                   ;B4BA4A
    %AICMD0x45($7F1F1F, $0000, $0077, $B4BA80)                 ;B4BA4D
    %AICMD0x45($7F1F1F, $0078, $03E7, $B4BA63)                 ;B4BA57
    %AICMD0x12_Jump($B4BA40)                                   ;B4BA61
    %AICMD0x1C($029E, $00)                                     ;B4BA64
    %AICMD0x23_OrWithIndexedValue($7F1F74, $00)                ;B4BA68
    %AICMD0x08()                                               ;B4BA6D
    %AICMD0x19($0039, $00)                                     ;B4BA6E
    %AICMD0x13($0078)                                          ;B4BA72
    %AICMD0x11()                                               ;B4BA75
    %AICMD0x41_ModifyVariable($7F1F33, $000A)                  ;B4BA76
    %AICMD0x57_UpdateStamina($14)                              ;B4BA7C
    %AICMD0x12_Jump($B4BA46)                                   ;B4BA7E
    %AICMD0x1C($02A0, $00)                                     ;B4BA81
    %AICMD0x12_Jump($B4BA40)                                   ;B4BA85
    %AICMD0x1C($029F, $00)                                     ;B4BA88
    %AICMD0x12_Jump($B4BA46)                                   ;B4BA8C

DATA8_B4BA8E:
 
AI_B4BA8E:
    %AICMD0x4F()                                               ;B4BA8E
    %AICMD0x50()                                               ;B4BA90
    %AICMD0x09($01, $B4BA9A)                                   ;B4BA91
    %AICMD0x09($02, $B4BAB6)                                   ;B4BA95
    %AICMD0x38()                                               ;B4BA99
    %AICMD0x10_End()                                           ;B4BA9A
    %AICMD0x1A($00A8, $0078, $B38300, $00)                     ;B4BA9B
    %AICMD0x22($20, $10, $01, $B3830C, $14)                    ;B4BAA3
    %AICMD0x1F($BAAF)                                          ;B4BAAA
    %AICMD0x12_Jump($B4BAA9)                                   ;B4BAAD
    %AICMD0x1C($0297, $00)                                     ;B4BAB0
    %AICMD0x12_Jump($B4BAA9)                                   ;B4BAB4
    %AICMD0x1A($0188, $00A0, $B383D8, $00)                     ;B4BAB7
    %AICMD0x1F($BAC4)                                          ;B4BABF
    %AICMD0x12_Jump($B4BABE)                                   ;B4BAC2
    %AICMD0x1C($0298, $00)                                     ;B4BAC5
    %AICMD0x12_Jump($B4BABE)                                   ;B4BAC9

pScripting_B4BACB:
    dw DATA8_B4BAEB                                            ;B4BACB|        |B4BAEB;
    dw DATA8_B4BB06                                            ;B4BACD|        |B4BB06;
    dw DATA8_B4BD19                                            ;B4BACF|        |B4BD19;
    dw DATA8_B4C3AC                                            ;B4BAD1|        |B4C3AC;
    dw pScripting_B4C427                                       ;B4BAD3|        |B4C427;
    dw pScripting_B4C427                                       ;B4BAD5|        |B4C427;
    dw pScripting_B4C427                                       ;B4BAD7|        |B4C427;
    dw pScripting_B4C427                                       ;B4BAD9|        |B4C427;
    dw pScripting_B4C427                                       ;B4BADB|        |B4C427;
    dw pScripting_B4C427                                       ;B4BADD|        |B4C427;
    dw pScripting_B4C427                                       ;B4BADF|        |B4C427;
    dw pScripting_B4C427                                       ;B4BAE1|        |B4C427;
    dw pScripting_B4C427                                       ;B4BAE3|        |B4C427;
    dw pScripting_B4C427                                       ;B4BAE5|        |B4C427;
    dw pScripting_B4C427                                       ;B4BAE7|        |B4C427;
    dw pScripting_B4C427                                       ;B4BAE9|        |B4C427;
 
DATA8_B4BAEB:
 
AI_B4BAEB:
    %AICMD0x4F()                                               ;B4BAEB
    %AICMD0x50()                                               ;B4BAED
    %AICMD0x23_OrWithIndexedValue($7F1F60, $09)                ;B4BAEE
    %AICMD0x23_OrWithIndexedValue($7F1F60, $00)                ;B4BAF3
    %AICMD0x08()                                               ;B4BAF8
    %AICMD0x38()                                               ;B4BAF9
    %AICMD0x01_UnfreezeTime()                                  ;B4BAFA
    %AICMD0x24($74)                                            ;B4BAFB
    %AICMD0x13($00B4)                                          ;B4BAFD
    %AICMD0x1C($02F5, $00)                                     ;B4BB00
    %AICMD0x3D($3A)                                            ;B4BB04
    %AICMD0x10_End()                                           ;B4BB06

DATA8_B4BB06:
 
AI_B4BB06:
    %AICMD0x4F()                                               ;B4BB06
    %AICMD0x50()                                               ;B4BB08
    %AICMD0x23_OrWithIndexedValue($7F1F60, $09)                ;B4BB09
    %AICMD0x00_SetMusic($0E, $B4)                              ;B4BB0E
    %AICMD0x02_FreezeTime()                                    ;B4BB11
    %AICMD0x03_SetHour($06)                                    ;B4BB12
    %AICMD0x05_SetPosition($0080, $01B8)                       ;B4BB14
    %AICMD0x08()                                               ;B4BB19
    %AICMD0x07_SetPlayerDirection($01)                         ;B4BB1A
    %AICMD0x09($01, $B4BB63)                                   ;B4BB1C
    %AICMD0x09($02, $B4BB91)                                   ;B4BB20
    %AICMD0x09($03, $B4BC36)                                   ;B4BB24
    %AICMD0x09($04, $B4BC4D)                                   ;B4BB28
    %AICMD0x09($05, $B4BBC1)                                   ;B4BB2C
    %AICMD0x09($06, $B4BC73)                                   ;B4BB30
    %AICMD0x09($07, $B4BC8A)                                   ;B4BB34
    %AICMD0x09($08, $B4BCA1)                                   ;B4BB38
    %AICMD0x09($09, $B4BCDD)                                   ;B4BB3C
    %AICMD0x06_SetDestination($3A)                             ;B4BB40
    %AICMD0x38()                                               ;B4BB42
    %AICMD0x39($01, $0060)                                     ;B4BB43
    %AICMD0x11()                                               ;B4BB47
    %AICMD0x0C($00)                                            ;B4BB48
    %AICMD0x0C($02)                                            ;B4BB4A
    %AICMD0x0C($03)                                            ;B4BB4C
    %AICMD0x0C($04)                                            ;B4BB4E
    %AICMD0x0C($05)                                            ;B4BB50
    %AICMD0x0C($06)                                            ;B4BB52
    %AICMD0x0C($07)                                            ;B4BB54
    %AICMD0x0C($08)                                            ;B4BB56
    %AICMD0x23_OrWithIndexedValue($7F1F74, $02)                ;B4BB58
    %AICMD0x0C($01)                                            ;B4BB5D
    %AICMD0x13($003C)                                          ;B4BB5F
    %AICMD0x3C()                                               ;B4BB62
    %AICMD0x10_End()                                           ;B4BB63
    %AICMD0x1A($0088, $0128, $B38354, $00)                     ;B4BB64
    %AICMD0x1F($BB77)                                          ;B4BB6C
    %AICMD0x12_Jump($B4BB6B)                                   ;B4BB6F
    %AICMD0x1F($BB8A)                                          ;B4BB72
    %AICMD0x12_Jump($B4BB71)                                   ;B4BB75
    %AICMD0x08()                                               ;B4BB78
    %AICMD0x1C($02CE, $00)                                     ;B4BB79
    %AICMD0x0B($00)                                            ;B4BB7D
    %AICMD0x01_UnfreezeTime()                                  ;B4BB7F
    %AICMD0x03_SetHour($07)                                    ;B4BB80
    %AICMD0x07_SetPlayerDirection($01)                         ;B4BB82
    %AICMD0x13($00F0)                                          ;B4BB84
    %AICMD0x11()                                               ;B4BB87
    %AICMD0x12_Jump($B4BB71)                                   ;B4BB88
    %AICMD0x1C($02CE, $00)                                     ;B4BB8B
    %AICMD0x12_Jump($B4BB71)                                   ;B4BB8F
    %AICMD0x1A($0080, $01E8, $B383E4, $01)                     ;B4BB92
    %AICMD0x0D($00, $FF, $30, $01)                             ;B4BB9A
    %AICMD0x1F($BBAA)                                          ;B4BB9F
    %AICMD0x12_Jump($B4BB9E)                                   ;B4BBA2
    %AICMD0x1F($BBB8)                                          ;B4BBA5
    %AICMD0x12_Jump($B4BBA4)                                   ;B4BBA8
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F74, $02, $B4BBB8)   ;B4BBAB
    %AICMD0x1C($02CF, $00)                                     ;B4BBB2
    %AICMD0x12_Jump($B4BB9E)                                   ;B4BBB6
    %AICMD0x1C($001A, $00)                                     ;B4BBB9
    %AICMD0x0B($01)                                            ;B4BBBD
    %AICMD0x12_Jump($B4BBA4)                                   ;B4BBBF
    %AICMD0x1A($0048, $0168, $B382E8, $01)                     ;B4BBC2
    %AICMD0x1F($BBD5)                                          ;B4BBCA
    %AICMD0x12_Jump($B4BBC9)                                   ;B4BBCD
    %AICMD0x1F($BC2F)                                          ;B4BBD0
    %AICMD0x12_Jump($B4BBCF)                                   ;B4BBD3
    %AICMD0x1D($02D3, $00)                                     ;B4BBD6
    %AICMD0x20($00, $BBE4)                                     ;B4BBDA
    %AICMD0x20($01, $BBF9)                                     ;B4BBDE
    %AICMD0x12_Jump($B4BBC9)                                   ;B4BBE2
    %AICMD0x1D($02D4, $00)                                     ;B4BBE5
    %AICMD0x17($03)                                            ;B4BBE9
    %AICMD0x18($00, $B4BC02)                                   ;B4BBEB
    %AICMD0x18($01, $B4BC11)                                   ;B4BBEF
    %AICMD0x18($02, $B4BC20)                                   ;B4BBF3
    %AICMD0x12_Jump($B4BBCF)                                   ;B4BBF7
    %AICMD0x1C($02D8, $00)                                     ;B4BBFA
    %AICMD0x0B($02)                                            ;B4BBFE
    %AICMD0x12_Jump($B4BBCF)                                   ;B4BC00
    %AICMD0x1C($02D5, $00)                                     ;B4BC03
    %AICMD0x41_ModifyVariable($7F1F33, $001E)                  ;B4BC07
    %AICMD0x0B($02)                                            ;B4BC0D
    %AICMD0x12_Jump($B4BBCF)                                   ;B4BC0F
    %AICMD0x1C($02D6, $00)                                     ;B4BC12
    %AICMD0x41_ModifyVariable($7F1F33, $000A)                  ;B4BC16
    %AICMD0x0B($02)                                            ;B4BC1C
    %AICMD0x12_Jump($B4BBCF)                                   ;B4BC1E
    %AICMD0x1C($02D7, $00)                                     ;B4BC21
    %AICMD0x41_ModifyVariable($7F1F33, $FFEC)                  ;B4BC25
    %AICMD0x0B($02)                                            ;B4BC2B
    %AICMD0x12_Jump($B4BBCF)                                   ;B4BC2D
    %AICMD0x1C($02DC, $00)                                     ;B4BC30
    %AICMD0x12_Jump($B4BBCF)                                   ;B4BC34
    %AICMD0x1A($0078, $0158, $B38414, $01)                     ;B4BC37
    %AICMD0x1F($BC44)                                          ;B4BC3F
    %AICMD0x12_Jump($B4BC3E)                                   ;B4BC42
    %AICMD0x1C($02D0, $00)                                     ;B4BC45
    %AICMD0x0B($03)                                            ;B4BC49
    %AICMD0x12_Jump($B4BC3E)                                   ;B4BC4B
    %AICMD0x1A($00B8, $0168, $B38318, $01)                     ;B4BC4E
    %AICMD0x1F($BC61)                                          ;B4BC56
    %AICMD0x12_Jump($B4BC55)                                   ;B4BC59
    %AICMD0x1F($BC6A)                                          ;B4BC5C
    %AICMD0x12_Jump($B4BC5B)                                   ;B4BC5F
    %AICMD0x1C($02D1, $00)                                     ;B4BC62
    %AICMD0x0B($04)                                            ;B4BC66
    %AICMD0x12_Jump($B4BC5B)                                   ;B4BC68
    %AICMD0x1C($038E, $00)                                     ;B4BC6B
    %AICMD0x0B($04)                                            ;B4BC6F
    %AICMD0x12_Jump($B4BC5B)                                   ;B4BC71
    %AICMD0x1A($00B8, $0198, $B382C4, $01)                     ;B4BC74
    %AICMD0x1F($BC81)                                          ;B4BC7C
    %AICMD0x12_Jump($B4BC7B)                                   ;B4BC7F
    %AICMD0x1C($02D9, $00)                                     ;B4BC82
    %AICMD0x0B($05)                                            ;B4BC86
    %AICMD0x12_Jump($B4BC7B)                                   ;B4BC88
    %AICMD0x1A($0058, $0188, $B38330, $01)                     ;B4BC8B
    %AICMD0x1F($BC98)                                          ;B4BC93
    %AICMD0x12_Jump($B4BC92)                                   ;B4BC96
    %AICMD0x1C($02D2, $00)                                     ;B4BC99
    %AICMD0x0B($06)                                            ;B4BC9D
    %AICMD0x12_Jump($B4BC92)                                   ;B4BC9F
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $00, $B4BCB3)   ;B4BCA2
    %AICMD0x1A($0098, $0178, $B38168, $01)                     ;B4BCA9
    %AICMD0x12_Jump($B4BCBB)                                   ;B4BCB1
    %AICMD0x1A($0088, $0178, $B3845C, $01)                     ;B4BCB4
    %AICMD0x1F($BCC7)                                          ;B4BCBC
    %AICMD0x12_Jump($B4BCBB)                                   ;B4BCBF
    %AICMD0x1F($BCD6)                                          ;B4BCC2
    %AICMD0x12_Jump($B4BCC1)                                   ;B4BCC5
    %AICMD0x1C($02DA, $00)                                     ;B4BCC8
    %AICMD0x41_ModifyVariable($7F1F1F, $000A)                  ;B4BCCC
    %AICMD0x0B($07)                                            ;B4BCD2
    %AICMD0x12_Jump($B4BCC1)                                   ;B4BCD4
    %AICMD0x1C($0293, $00)                                     ;B4BCD7
    %AICMD0x12_Jump($B4BCC1)                                   ;B4BCDB
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $04, $B4BCEF)   ;B4BCDE
    %AICMD0x1A($00A8, $0198, $B38204, $01)                     ;B4BCE5
    %AICMD0x12_Jump($B4BCF7)                                   ;B4BCED
    %AICMD0x1A($00A8, $0198, $B3845C, $01)                     ;B4BCF0
    %AICMD0x1F($BD03)                                          ;B4BCF8
    %AICMD0x12_Jump($B4BCF7)                                   ;B4BCFB
    %AICMD0x1F($BD12)                                          ;B4BCFE
    %AICMD0x12_Jump($B4BCFD)                                   ;B4BD01
    %AICMD0x1C($02DB, $00)                                     ;B4BD04
    %AICMD0x41_ModifyVariable($7F1F27, $000A)                  ;B4BD08
    %AICMD0x0B($08)                                            ;B4BD0E
    %AICMD0x12_Jump($B4BCFD)                                   ;B4BD10
    %AICMD0x1C($0293, $00)                                     ;B4BD13
    %AICMD0x12_Jump($B4BCFD)                                   ;B4BD17

DATA8_B4BD19:
 
AI_B4BD19:
    %AICMD0x4F()                                               ;B4BD19
    %AICMD0x50()                                               ;B4BD1B
    %AICMD0x23_OrWithIndexedValue($7F1F60, $09)                ;B4BD1C
    %AICMD0x00_SetMusic($0D, $B4)                              ;B4BD21
    %AICMD0x02_FreezeTime()                                    ;B4BD24
    %AICMD0x03_SetHour($07)                                    ;B4BD25
    %AICMD0x05_SetPosition($0128, $0218)                       ;B4BD27
    %AICMD0x07_SetPlayerDirection($01)                         ;B4BD2C
    %AICMD0x09($01, $B4BD6F)                                   ;B4BD2E
    %AICMD0x09($02, $B4C001)                                   ;B4BD32
    %AICMD0x09($03, $B4C08F)                                   ;B4BD36
    %AICMD0x09($04, $B4C0DA)                                   ;B4BD3A
    %AICMD0x09($05, $B4C13E)                                   ;B4BD3E
    %AICMD0x09($06, $B4C18F)                                   ;B4BD42
    %AICMD0x09($07, $B4C239)                                   ;B4BD46
    %AICMD0x09($08, $B4C2E6)                                   ;B4BD4A
    %AICMD0x06_SetDestination($0B)                             ;B4BD4E
    %AICMD0x11()                                               ;B4BD50
    %AICMD0x38()                                               ;B4BD51
    %AICMD0x13($0001)                                          ;B4BD52
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F74, $04, $B4BD5E)   ;B4BD55
    %AICMD0x12_Jump($B4BD51)                                   ;B4BD5C
    %AICMD0x23_OrWithIndexedValue($7F1F74, $07)                ;B4BD5F
    %AICMD0x3D($0B)                                            ;B4BD64
    %AICMD0x10_End()                                           ;B4BD66
    %AICMD0x13($0708)                                          ;B4BD67
    %AICMD0x23_OrWithIndexedValue($7F1F74, $05)                ;B4BD6A
    %AICMD0x10_End()                                           ;B4BD6F
    %AICMD0x1A($0128, $01A8, $B38300, $00)                     ;B4BD70
    %AICMD0x1F($BD8C)                                          ;B4BD78
    %AICMD0x12_Jump($B4BD77)                                   ;B4BD7B
    %AICMD0x2D($B4BDC3, $B4BDCE)                               ;B4BD7E
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F74, $05, $B4BE7C)   ;B4BD83
    %AICMD0x12_Jump($B4BD7D)                                   ;B4BD8A
    %AICMD0x1D($02DD, $00)                                     ;B4BD8D
    %AICMD0x20($00, $BD9B)                                     ;B4BD91
    %AICMD0x20($01, $BDBC)                                     ;B4BD95
    %AICMD0x12_Jump($B4BD77)                                   ;B4BD99
    %AICMD0x08()                                               ;B4BD9C
    %AICMD0x1C($02DE, $00)                                     ;B4BD9D
    %AICMD0x28($1F74, $7F, $05)                                ;B4BDA1
    %AICMD0x1B($0295, $00)                                     ;B4BDA6
    %AICMD0x09($09, $B4BEF0)                                   ;B4BDAA
    %AICMD0x09($0A, $B4BD66)                                   ;B4BDAE
    %AICMD0x0C($01)                                            ;B4BDB2
    %AICMD0x23_OrWithIndexedValue($7F1F74, $03)                ;B4BDB4
    %AICMD0x11()                                               ;B4BDB9
    %AICMD0x12_Jump($B4BD7D)                                   ;B4BDBA
    %AICMD0x1C($0236, $00)                                     ;B4BDBD
    %AICMD0x12_Jump($B4BD77)                                   ;B4BDC1
    %AICMD0x1C($02DF, $00)                                     ;B4BDC4
    %AICMD0x1B($0295, $00)                                     ;B4BDC8
    %AICMD0x12_Jump($B4BD7D)                                   ;B4BDCC
    %AICMD0x21($09A2, $80, $01)                                ;B4BDCF
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F76, $00, $B4BDDD)   ;B4BDD4
    %AICMD0x12_Jump($B4BE02)                                   ;B4BDDB
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F76, $01, $B4BDE7)   ;B4BDDE
    %AICMD0x12_Jump($B4BE02)                                   ;B4BDE5
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F76, $02, $B4BDF1)   ;B4BDE8
    %AICMD0x12_Jump($B4BE02)                                   ;B4BDEF
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F76, $03, $B4BDFB)   ;B4BDF2
    %AICMD0x12_Jump($B4BE02)                                   ;B4BDF9
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F76, $04, $B4BE72)   ;B4BDFC
    %AICMD0x08()                                               ;B4BE03
    %AICMD0x13($0001)                                          ;B4BE04
    %AICMD0x2C($19, $0006, $005A)                              ;B4BE07
    %AICMD0x11()                                               ;B4BE0D
    %AICMD0x1C($02E7, $00)                                     ;B4BE0E
    %AICMD0x15($8009AC, $01, $B4BE34)                          ;B4BE12
    %AICMD0x15($8009AC, $02, $B4BE3C)                          ;B4BE19
    %AICMD0x15($8009AC, $03, $B4BE44)                          ;B4BE20
    %AICMD0x15($8009AC, $04, $B4BE4C)                          ;B4BE27
    %AICMD0x15($8009AC, $05, $B4BE54)                          ;B4BE2E
    %AICMD0x23_OrWithIndexedValue($7F1F78, $00)                ;B4BE35
    %AICMD0x12_Jump($B4BE5C)                                   ;B4BE3A
    %AICMD0x23_OrWithIndexedValue($7F1F78, $01)                ;B4BE3D
    %AICMD0x12_Jump($B4BE5C)                                   ;B4BE42
    %AICMD0x23_OrWithIndexedValue($7F1F78, $02)                ;B4BE45
    %AICMD0x12_Jump($B4BE5C)                                   ;B4BE4A
    %AICMD0x23_OrWithIndexedValue($7F1F78, $03)                ;B4BE4D
    %AICMD0x12_Jump($B4BE5C)                                   ;B4BE52
    %AICMD0x23_OrWithIndexedValue($7F1F78, $04)                ;B4BE55
    %AICMD0x12_Jump($B4BE5C)                                   ;B4BE5A
    %AICMD0x25($09)                                            ;B4BE5D
    %AICMD0x28($1F74, $7F, $05)                                ;B4BE5F
    %AICMD0x1B($0295, $00)                                     ;B4BE64
    %AICMD0x09($09, $B4BEF0)                                   ;B4BE68
    %AICMD0x09($0A, $B4BD66)                                   ;B4BE6C
    %AICMD0x12_Jump($B4BD7D)                                   ;B4BE70
    %AICMD0x23_OrWithIndexedValue($7F1F74, $04)                ;B4BE73
    %AICMD0x1C($02E8, $00)                                     ;B4BE78
    %AICMD0x10_End()                                           ;B4BE7C
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F76, $00, $B4BE86)   ;B4BE7D
    %AICMD0x12_Jump($B4BEAB)                                   ;B4BE84
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F76, $01, $B4BE90)   ;B4BE87
    %AICMD0x12_Jump($B4BEAB)                                   ;B4BE8E
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F76, $02, $B4BE9A)   ;B4BE91
    %AICMD0x12_Jump($B4BEAB)                                   ;B4BE98
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F76, $03, $B4BEA4)   ;B4BE9B
    %AICMD0x12_Jump($B4BEAB)                                   ;B4BEA2
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F76, $04, $B4BE72)   ;B4BEA5
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F74, $06, $B4BEC4)   ;B4BEAC
    %AICMD0x08()                                               ;B4BEB3
    %AICMD0x13($0001)                                          ;B4BEB4
    %AICMD0x2C($19, $0006, $005A)                              ;B4BEB7
    %AICMD0x11()                                               ;B4BEBD
    %AICMD0x1C($02E9, $00)                                     ;B4BEBE
    %AICMD0x12_Jump($B4BE11)                                   ;B4BEC2
    %AICMD0x28($1F74, $7F, $06)                                ;B4BEC5
    %AICMD0x08()                                               ;B4BECA
    %AICMD0x13($0001)                                          ;B4BECB
    %AICMD0x2C($04, $0006, $005A)                              ;B4BECE
    %AICMD0x11()                                               ;B4BED4
    %AICMD0x1C($0390, $00)                                     ;B4BED5
    %AICMD0x12_Jump($B4BE11)                                   ;B4BED9
    %AICMD0x1A($0128, $01A8, $B38300, $00)                     ;B4BEDC
    %AICMD0x1F($BEE9)                                          ;B4BEE4
    %AICMD0x12_Jump($B4BEE3)                                   ;B4BEE7
    %AICMD0x1C($02ED, $00)                                     ;B4BEEA
    %AICMD0x12_Jump($B4BEE3)                                   ;B4BEEE
    %AICMD0x17($05)                                            ;B4BEF1
    %AICMD0x18($00, $B4BF0C)                                   ;B4BEF3
    %AICMD0x18($01, $B4BF28)                                   ;B4BEF7
    %AICMD0x18($02, $B4BF44)                                   ;B4BEFB
    %AICMD0x18($03, $B4BF60)                                   ;B4BEFF
    %AICMD0x18($04, $B4BF7C)                                   ;B4BF03
    %AICMD0x13($0078)                                          ;B4BF07
    %AICMD0x0B($01)                                            ;B4BF0A
    %AICMD0x10_End()                                           ;B4BF0C
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F76, $00, $B4BF28)   ;B4BF0D
    %AICMD0x1A($0128, $01B0, $B385DC, $00)                     ;B4BF14
    %AICMD0x23_OrWithIndexedValue($7F1F76, $00)                ;B4BF1C
    %AICMD0x47($8009AC, $01)                                   ;B4BF21
    %AICMD0x12_Jump($B4BF06)                                   ;B4BF26
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F76, $01, $B4BF44)   ;B4BF29
    %AICMD0x1A($0128, $01B0, $B385E8, $00)                     ;B4BF30
    %AICMD0x23_OrWithIndexedValue($7F1F76, $01)                ;B4BF38
    %AICMD0x47($8009AC, $02)                                   ;B4BF3D
    %AICMD0x12_Jump($B4BF06)                                   ;B4BF42
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F76, $02, $B4BF60)   ;B4BF45
    %AICMD0x1A($0128, $01B0, $B385F4, $00)                     ;B4BF4C
    %AICMD0x23_OrWithIndexedValue($7F1F76, $02)                ;B4BF54
    %AICMD0x47($8009AC, $03)                                   ;B4BF59
    %AICMD0x12_Jump($B4BF06)                                   ;B4BF5E
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F76, $03, $B4BF7C)   ;B4BF61
    %AICMD0x1A($0128, $01B0, $B38600, $00)                     ;B4BF68
    %AICMD0x23_OrWithIndexedValue($7F1F76, $03)                ;B4BF70
    %AICMD0x47($8009AC, $04)                                   ;B4BF75
    %AICMD0x12_Jump($B4BF06)                                   ;B4BF7A
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F76, $04, $B4BF0C)   ;B4BF7D
    %AICMD0x1A($0128, $01B0, $B3860C, $00)                     ;B4BF84
    %AICMD0x23_OrWithIndexedValue($7F1F76, $04)                ;B4BF8C
    %AICMD0x47($8009AC, $05)                                   ;B4BF91
    %AICMD0x12_Jump($B4BF06)                                   ;B4BF96
    %AICMD0x17($02)                                            ;B4BF99
    %AICMD0x18($00, $B4BFD9)                                   ;B4BF9B
    %AICMD0x18($01, $B4BFF0)                                   ;B4BF9F
    %AICMD0x10_End()                                           ;B4BFA3
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F6C, $0A, $B4BFD9)   ;B4BFA4
    %AICMD0x23_OrWithIndexedValue($7F1F6C, $0A)                ;B4BFAB
    %AICMD0x41_ModifyVariable($7F1F10, $001E)                  ;B4BFB0
    %AICMD0x1C($02EB, $00)                                     ;B4BFB6
    %AICMD0x0B($00)                                            ;B4BFBA
    %AICMD0x12_Jump($B4BFA2)                                   ;B4BFBC
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F6C, $0B, $B4BFD9)   ;B4BFBF
    %AICMD0x23_OrWithIndexedValue($7F1F6C, $0B)                ;B4BFC6
    %AICMD0x41_ModifyVariable($7F1F10, $001E)                  ;B4BFCB
    %AICMD0x1C($02EB, $00)                                     ;B4BFD1
    %AICMD0x0B($00)                                            ;B4BFD5
    %AICMD0x12_Jump($B4BFA2)                                   ;B4BFD7
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F6C, $0C, $B4BFF0)   ;B4BFDA
    %AICMD0x23_OrWithIndexedValue($7F1F6C, $0C)                ;B4BFE1
    %AICMD0x41_ModifyVariable($7F1F33, $0032)                  ;B4BFE6
    %AICMD0x0B($00)                                            ;B4BFEC
    %AICMD0x12_Jump($B4BFA2)                                   ;B4BFEE
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F6C, $0D, $B4BFD9)   ;B4BFF1
    %AICMD0x23_OrWithIndexedValue($7F1F6C, $0D)                ;B4BFF8
    %AICMD0x0B($00)                                            ;B4BFFD
    %AICMD0x12_Jump($B4BFA2)                                   ;B4BFFF
    %AICMD0x1A($00E0, $0168, $B3836C, $00)                     ;B4C002
    %AICMD0x1F($C016)                                          ;B4C00A
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F74, $03, $B4C01D)   ;B4C00D
    %AICMD0x12_Jump($B4C009)                                   ;B4C014
    %AICMD0x1C($02E0, $00)                                     ;B4C017
    %AICMD0x12_Jump($B4C009)                                   ;B4C01B
    %AICMD0x1B($02AE, $00)                                     ;B4C01E
    %AICMD0x0D($00, $FF, $40, $01)                             ;B4C022
    %AICMD0x1B($02B0, $01)                                     ;B4C027
    %AICMD0x0D($01, $00, $40, $01)                             ;B4C02B
    %AICMD0x13($001E)                                          ;B4C030
    %AICMD0x1B($02B0, $00)                                     ;B4C033
    %AICMD0x0D($FF, $00, $40, $01)                             ;B4C037
    %AICMD0x1B($02AC, $00)                                     ;B4C03C
    %AICMD0x0D($00, $01, $40, $01)                             ;B4C040
    %AICMD0x13($003C)                                          ;B4C045
    %AICMD0x12_Jump($B4C01D)                                   ;B4C048
    %AICMD0x1F($C050)                                          ;B4C04B
    %AICMD0x12_Jump($B4C04A)                                   ;B4C04E
    %AICMD0x1C($02E0, $00)                                     ;B4C051
    %AICMD0x12_Jump($B4C04A)                                   ;B4C055
    %AICMD0x1A($0158, $01B8, $B3836C, $03)                     ;B4C058
    %AICMD0x12_Jump($B4C062)                                   ;B4C060
    %AICMD0x1F($C068)                                          ;B4C063
    %AICMD0x12_Jump($B4C062)                                   ;B4C066
    %AICMD0x15($8009A2, $00, $B4C086)                          ;B4C069
    %AICMD0x15($8009A2, $01, $B4C086)                          ;B4C070
    %AICMD0x15($8009A2, $02, $B4C086)                          ;B4C077
    %AICMD0x1C($02EF, $00)                                     ;B4C07E
    %AICMD0x0B($03)                                            ;B4C082
    %AICMD0x12_Jump($B4C062)                                   ;B4C084
    %AICMD0x1C($02EE, $00)                                     ;B4C087
    %AICMD0x0B($03)                                            ;B4C08B
    %AICMD0x12_Jump($B4C062)                                   ;B4C08D
    %AICMD0x1A($0170, $0168, $B38348, $00)                     ;B4C090
    %AICMD0x1F($C0AA)                                          ;B4C098
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F74, $03, $B4C0B1)   ;B4C09B
    %AICMD0x12_Jump($B4C097)                                   ;B4C0A2
    %AICMD0x13($0001)                                          ;B4C0A5
    %AICMD0x12_Jump($B4C0A4)                                   ;B4C0A8
    %AICMD0x1C($02E1, $00)                                     ;B4C0AB
    %AICMD0x12_Jump($B4C097)                                   ;B4C0AF
    %AICMD0x0D($00, $01, $20, $01)                             ;B4C0B2
    %AICMD0x22($10, $08, $01, $B38348, $08)                    ;B4C0B7
    %AICMD0x12_Jump($B4C0A4)                                   ;B4C0BE
    %AICMD0x1A($0168, $0178, $B38348, $00)                     ;B4C0C1
    %AICMD0x12_Jump($B4C0CB)                                   ;B4C0C9
    %AICMD0x1F($C0D1)                                          ;B4C0CC
    %AICMD0x12_Jump($B4C0CB)                                   ;B4C0CF
    %AICMD0x1C($02F0, $00)                                     ;B4C0D2
    %AICMD0x0B($04)                                            ;B4C0D6
    %AICMD0x12_Jump($B4C0CB)                                   ;B4C0D8
    %AICMD0x1A($0118, $0270, $B3842C, $02)                     ;B4C0DB
    %AICMD0x1F($C0F5)                                          ;B4C0E3
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F74, $03, $B4C103)   ;B4C0E6
    %AICMD0x12_Jump($B4C0E2)                                   ;B4C0ED
    %AICMD0x1F($C0FC)                                          ;B4C0F0
    %AICMD0x12_Jump($B4C0EF)                                   ;B4C0F3
    %AICMD0x1C($02E2, $00)                                     ;B4C0F6
    %AICMD0x12_Jump($B4C0E2)                                   ;B4C0FA
    %AICMD0x1C($02E2, $00)                                     ;B4C0FD
    %AICMD0x12_Jump($B4C0EF)                                   ;B4C101
    %AICMD0x0D($01, $00, $20, $01)                             ;B4C104
    %AICMD0x1B($02D3, $00)                                     ;B4C109
    %AICMD0x0D($00, $01, $60, $01)                             ;B4C10D
    %AICMD0x1B($02D7, $00)                                     ;B4C112
    %AICMD0x0D($FF, $00, $A0, $01)                             ;B4C116
    %AICMD0x22($20, $20, $01, $B3842C, $10)                    ;B4C11B
    %AICMD0x12_Jump($B4C0EF)                                   ;B4C122
    %AICMD0x1A($0108, $01B8, $B38420, $01)                     ;B4C125
    %AICMD0x12_Jump($B4C12F)                                   ;B4C12D
    %AICMD0x1F($C135)                                          ;B4C130
    %AICMD0x12_Jump($B4C12F)                                   ;B4C133
    %AICMD0x1C($02F1, $00)                                     ;B4C136
    %AICMD0x0B($05)                                            ;B4C13A
    %AICMD0x12_Jump($B4C12F)                                   ;B4C13C
    %AICMD0x1A($0138, $0298, $B38390, $00)                     ;B4C13F
    %AICMD0x1F($C159)                                          ;B4C147
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F74, $03, $B4C160)   ;B4C14A
    %AICMD0x12_Jump($B4C146)                                   ;B4C151
    %AICMD0x13($0001)                                          ;B4C154
    %AICMD0x12_Jump($B4C153)                                   ;B4C157
    %AICMD0x1C($02E3, $00)                                     ;B4C15A
    %AICMD0x12_Jump($B4C146)                                   ;B4C15E
    %AICMD0x0D($00, $01, $50, $01)                             ;B4C161
    %AICMD0x1B($02B6, $01)                                     ;B4C166
    %AICMD0x0D($01, $00, $60, $01)                             ;B4C16A
    %AICMD0x22($18, $20, $01, $B38390, $10)                    ;B4C16F
    %AICMD0x12_Jump($B4C0EF)                                   ;B4C176
    %AICMD0x1A($0138, $0218, $B38384, $01)                     ;B4C179
    %AICMD0x1F($C186)                                          ;B4C181
    %AICMD0x12_Jump($B4C180)                                   ;B4C184
    %AICMD0x1C($02F1, $00)                                     ;B4C187
    %AICMD0x0B($06)                                            ;B4C18B
    %AICMD0x12_Jump($B4C180)                                   ;B4C18D
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $01, $B4C1A1)   ;B4C190
    %AICMD0x1A($00D8, $0228, $B381A4, $01)                     ;B4C197
    %AICMD0x12_Jump($B4C1B0)                                   ;B4C19F
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F6E, $04, $B4C238)   ;B4C1A2
    %AICMD0x1A($00D8, $0228, $B3845C, $01)                     ;B4C1A9
    %AICMD0x1F($C1C3)                                          ;B4C1B1
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F74, $03, $B4C1CA)   ;B4C1B4
    %AICMD0x12_Jump($B4C1B0)                                   ;B4C1BB
    %AICMD0x13($0001)                                          ;B4C1BE
    %AICMD0x12_Jump($B4C1BD)                                   ;B4C1C1
    %AICMD0x1C($02E4, $00)                                     ;B4C1C4
    %AICMD0x12_Jump($B4C1B0)                                   ;B4C1C8
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $01, $B4C1E4)   ;B4C1CB
    %AICMD0x1B($022B, $01)                                     ;B4C1D2
    %AICMD0x0D($01, $00, $84, $01)                             ;B4C1D6
    %AICMD0x22($20, $20, $01, $B381A4, $10)                    ;B4C1DB
    %AICMD0x12_Jump($B4C1BD)                                   ;B4C1E2
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F6E, $04, $B4C238)   ;B4C1E5
    %AICMD0x22($20, $20, $01, $B38474, $10)                    ;B4C1EC
    %AICMD0x12_Jump($B4C1BD)                                   ;B4C1F3
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $01, $B4C207)   ;B4C1F6
    %AICMD0x1A($0178, $01D8, $B38198, $00)                     ;B4C1FD
    %AICMD0x12_Jump($B4C216)                                   ;B4C205
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F6E, $04, $B4C238)   ;B4C208
    %AICMD0x1A($0178, $01D8, $B3845C, $00)                     ;B4C20F
    %AICMD0x1F($C222)                                          ;B4C217
    %AICMD0x12_Jump($B4C216)                                   ;B4C21A
    %AICMD0x1F($C231)                                          ;B4C21D
    %AICMD0x12_Jump($B4C21C)                                   ;B4C220
    %AICMD0x1C($02F2, $00)                                     ;B4C223
    %AICMD0x41_ModifyVariable($7F1F21, $000A)                  ;B4C227
    %AICMD0x0B($07)                                            ;B4C22D
    %AICMD0x12_Jump($B4C21C)                                   ;B4C22F
    %AICMD0x1C($02F1, $00)                                     ;B4C232
    %AICMD0x12_Jump($B4C21C)                                   ;B4C236
    %AICMD0x10_End()                                           ;B4C239
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $02, $B4C24B)   ;B4C23A
    %AICMD0x1A($00C8, $0218, $B381D4, $02)                     ;B4C241
    %AICMD0x12_Jump($B4C25A)                                   ;B4C249
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F6E, $04, $B4C2E5)   ;B4C24C
    %AICMD0x1A($00C8, $0218, $B3845C, $00)                     ;B4C253
    %AICMD0x1F($C26D)                                          ;B4C25B
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F74, $03, $B4C274)   ;B4C25E
    %AICMD0x12_Jump($B4C25A)                                   ;B4C265
    %AICMD0x13($0001)                                          ;B4C268
    %AICMD0x12_Jump($B4C267)                                   ;B4C26B
    %AICMD0x1C($02E5, $00)                                     ;B4C26E
    %AICMD0x12_Jump($B4C25A)                                   ;B4C272
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $02, $B4C291)   ;B4C275
    %AICMD0x13($0050)                                          ;B4C27C
    %AICMD0x1B($0250, $01)                                     ;B4C27F
    %AICMD0x0D($01, $00, $40, $01)                             ;B4C283
    %AICMD0x22($20, $18, $01, $B381D4, $10)                    ;B4C288
    %AICMD0x12_Jump($B4C267)                                   ;B4C28F
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F6E, $04, $B4C2E5)   ;B4C292
    %AICMD0x22($20, $20, $01, $B38474, $00)                    ;B4C299
    %AICMD0x12_Jump($B4C267)                                   ;B4C2A0
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $02, $B4C2B4)   ;B4C2A3
    %AICMD0x1A($0168, $01D8, $B381C8, $00)                     ;B4C2AA
    %AICMD0x12_Jump($B4C2C3)                                   ;B4C2B2
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F6E, $04, $B4C2E5)   ;B4C2B5
    %AICMD0x1A($0168, $01D8, $B3845C, $00)                     ;B4C2BC
    %AICMD0x1F($C2CF)                                          ;B4C2C4
    %AICMD0x12_Jump($B4C2C3)                                   ;B4C2C7
    %AICMD0x1F($C2DE)                                          ;B4C2CA
    %AICMD0x12_Jump($B4C2C9)                                   ;B4C2CD
    %AICMD0x1C($02F3, $00)                                     ;B4C2D0
    %AICMD0x41_ModifyVariable($7F1F23, $000A)                  ;B4C2D4
    %AICMD0x0B($08)                                            ;B4C2DA
    %AICMD0x12_Jump($B4C2C9)                                   ;B4C2DC
    %AICMD0x1C($02F1, $00)                                     ;B4C2DF
    %AICMD0x12_Jump($B4C21C)                                   ;B4C2E3
    %AICMD0x10_End()                                           ;B4C2E6
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $03, $B4C2F8)   ;B4C2E7
    %AICMD0x1A($00D8, $0208, $B381EC, $00)                     ;B4C2EE
    %AICMD0x12_Jump($B4C307)                                   ;B4C2F6
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F6E, $04, $B4C3AB)   ;B4C2F9
    %AICMD0x1A($00D8, $0208, $B3845C, $00)                     ;B4C300
    %AICMD0x1F($C31A)                                          ;B4C308
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F74, $03, $B4C321)   ;B4C30B
    %AICMD0x12_Jump($B4C307)                                   ;B4C312
    %AICMD0x13($0001)                                          ;B4C315
    %AICMD0x12_Jump($B4C314)                                   ;B4C318
    %AICMD0x1C($02E6, $00)                                     ;B4C31B
    %AICMD0x12_Jump($B4C307)                                   ;B4C31F
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $03, $B4C357)   ;B4C322
    %AICMD0x1B($023F, $00)                                     ;B4C329
    %AICMD0x0D($00, $FF, $40, $01)                             ;B4C32D
    %AICMD0x13($001E)                                          ;B4C332
    %AICMD0x0D($00, $FF, $40, $01)                             ;B4C335
    %AICMD0x13($001E)                                          ;B4C33A
    %AICMD0x0D($00, $FF, $40, $01)                             ;B4C33D
    %AICMD0x13($001E)                                          ;B4C342
    %AICMD0x1B($0241, $00)                                     ;B4C345
    %AICMD0x0D($FF, $00, $A8, $01)                             ;B4C349
    %AICMD0x22($18, $20, $01, $B381EC, $10)                    ;B4C34E
    %AICMD0x12_Jump($B4C314)                                   ;B4C355
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F6E, $04, $B4C3AB)   ;B4C358
    %AICMD0x22($20, $20, $01, $B38474, $10)                    ;B4C35F
    %AICMD0x12_Jump($B4C314)                                   ;B4C366
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $03, $B4C37A)   ;B4C369
    %AICMD0x1A($00F8, $01E8, $B381E0, $00)                     ;B4C370
    %AICMD0x12_Jump($B4C389)                                   ;B4C378
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F6E, $04, $B4C3AB)   ;B4C37B
    %AICMD0x1A($00F8, $01E8, $B3845C, $00)                     ;B4C382
    %AICMD0x1F($C395)                                          ;B4C38A
    %AICMD0x12_Jump($B4C389)                                   ;B4C38D
    %AICMD0x1F($C3A4)                                          ;B4C390
    %AICMD0x12_Jump($B4C38F)                                   ;B4C393
    %AICMD0x1C($02F4, $00)                                     ;B4C396
    %AICMD0x41_ModifyVariable($7F1F25, $000A)                  ;B4C39A
    %AICMD0x0B($09)                                            ;B4C3A0
    %AICMD0x12_Jump($B4C38F)                                   ;B4C3A2
    %AICMD0x1C($02F1, $00)                                     ;B4C3A5
    %AICMD0x12_Jump($B4C38F)                                   ;B4C3A9
    %AICMD0x10_End()                                           ;B4C3AC

DATA8_B4C3AC:
 
AI_B4C3AC:
    %AICMD0x4F()                                               ;B4C3AC
    %AICMD0x50()                                               ;B4C3AE
    %AICMD0x23_OrWithIndexedValue($7F1F60, $09)                ;B4C3AF
    %AICMD0x02_FreezeTime()                                    ;B4C3B4
    %AICMD0x03_SetHour($07)                                    ;B4C3B5
    %AICMD0x05_SetPosition($0128, $0218)                       ;B4C3B7
    %AICMD0x07_SetPlayerDirection($01)                         ;B4C3BC
    %AICMD0x09($01, $B4BEDB)                                   ;B4C3BE
    %AICMD0x09($02, $B4C057)                                   ;B4C3C2
    %AICMD0x09($03, $B4C0C0)                                   ;B4C3C6
    %AICMD0x09($04, $B4C124)                                   ;B4C3CA
    %AICMD0x09($05, $B4C178)                                   ;B4C3CE
    %AICMD0x09($06, $B4C1F5)                                   ;B4C3D2
    %AICMD0x09($07, $B4C2A2)                                   ;B4C3D6
    %AICMD0x09($08, $B4C368)                                   ;B4C3DA
    %AICMD0x08()                                               ;B4C3DE
    %AICMD0x13($0001)                                          ;B4C3DF
    %AICMD0x06_SetDestination($0B)                             ;B4C3E2
    %AICMD0x38()                                               ;B4C3E4
    %AICMD0x13($0001)                                          ;B4C3E5
    %AICMD0x15($8009A2, $03, $B4C403)                          ;B4C3E8
    %AICMD0x15($8009A2, $04, $B4C403)                          ;B4C3EF
    %AICMD0x15($8009A2, $05, $B4C403)                          ;B4C3F6
    %AICMD0x1C($038F, $00)                                     ;B4C3FD
    %AICMD0x12_Jump($B4C413)                                   ;B4C401
    %AICMD0x1C($02EA, $00)                                     ;B4C404
    %AICMD0x41_ModifyVariable($7F1F33, $001E)                  ;B4C408
    %AICMD0x09($09, $B4BF98)                                   ;B4C40E
    %AICMD0x0C($00)                                            ;B4C412
    %AICMD0x13($0001)                                          ;B4C414
    %AICMD0x1C($02EC, $00)                                     ;B4C417
    %AICMD0x13($0001)                                          ;B4C41B
    %AICMD0x1C($02ED, $00)                                     ;B4C41E
    %AICMD0x11()                                               ;B4C422
    %AICMD0x13($028A)                                          ;B4C423
    %AICMD0x3C()                                               ;B4C426
    %AICMD0x10_End()                                           ;B4C427

pScripting_B4C427:
    dw DATA8_B4C447                                            ;B4C427|        |B4C447;
    dw pScripting_B4C4B8                                       ;B4C429|        |B4C4B8;
    dw pScripting_B4C4B8                                       ;B4C42B|        |B4C4B8;
    dw pScripting_B4C4B8                                       ;B4C42D|        |B4C4B8;
    dw pScripting_B4C4B8                                       ;B4C42F|        |B4C4B8;
    dw pScripting_B4C4B8                                       ;B4C431|        |B4C4B8;
    dw pScripting_B4C4B8                                       ;B4C433|        |B4C4B8;
    dw pScripting_B4C4B8                                       ;B4C435|        |B4C4B8;
    dw pScripting_B4C4B8                                       ;B4C437|        |B4C4B8;
    dw pScripting_B4C4B8                                       ;B4C439|        |B4C4B8;
    dw pScripting_B4C4B8                                       ;B4C43B|        |B4C4B8;
    dw pScripting_B4C4B8                                       ;B4C43D|        |B4C4B8;
    dw pScripting_B4C4B8                                       ;B4C43F|        |B4C4B8;
    dw pScripting_B4C4B8                                       ;B4C441|        |B4C4B8;
    dw pScripting_B4C4B8                                       ;B4C443|        |B4C4B8;
    dw pScripting_B4C4B8                                       ;B4C445|        |B4C4B8;
 
DATA8_B4C447:
 
    %AICMD0x09($01, $B4C44D)                                   ;B4C447
    %AICMD0x38()                                               ;B4C44B
    %AICMD0x10_End()                                           ;B4C44C
    %AICMD0x15($7F1F1C, $12, $B4C4B7)                          ;B4C44D
    %AICMD0x1A($0068, $01A8, $B38384, $02)                     ;B4C454
    %AICMD0x2D($B4C47A, $B4C46C)                               ;B4C45C
    %AICMD0x16($7F1F1C, $12, $18, $B4C481)                     ;B4C461
    %AICMD0x12_Jump($B4C45C)                                   ;B4C469
    %AICMD0x15($80091E, $14, $B4C48E)                          ;B4C46C
    %AICMD0x1C($041B, $00)                                     ;B4C473
    %AICMD0x12_Jump($B4C45C)                                   ;B4C477
    %AICMD0x1C($0418, $00)                                     ;B4C47A
    %AICMD0x12_Jump($B4C45C)                                   ;B4C47E
    %AICMD0x1C($0419, $00)                                     ;B4C481
    %AICMD0x41_ModifyVariable($7F1F33, $FFFB)                  ;B4C485
    %AICMD0x12_Jump($B4C4A2)                                   ;B4C48B
    %AICMD0x1C($041A, $00)                                     ;B4C48E
    %AICMD0x42($7F1F04, $000002)                               ;B4C492
    %AICMD0x41_ModifyVariable($7F1F33, $001E)                  ;B4C499
    %AICMD0x12_Jump($B4C4A2)                                   ;B4C49F
    %AICMD0x23_OrWithIndexedValue($7F1F6A, $0B)                ;B4C4A2
    %AICMD0x28($1F6A, $7F, $0A)                                ;B4C4A7
    %AICMD0x1B($02B6, $00)                                     ;B4C4AC
    %AICMD0x0D($FF, $00, $60, $01)                             ;B4C4B0
    %AICMD0x37()                                               ;B4C4B5
    %AICMD0x10_End()                                           ;B4C4B6
    %AICMD0x10_End()                                           ;B4C4B7

pScripting_B4C4B8:
    dw DATA8_B4C4D8                                            ;B4C4B8|        |B4C4D8;
    dw pScripting_B4C504                                       ;B4C4BA|        |B4C504;
    dw pScripting_B4C504                                       ;B4C4BC|        |B4C504;
    dw pScripting_B4C504                                       ;B4C4BE|        |B4C504;
    dw pScripting_B4C504                                       ;B4C4C0|        |B4C504;
    dw pScripting_B4C504                                       ;B4C4C2|        |B4C504;
    dw pScripting_B4C504                                       ;B4C4C4|        |B4C504;
    dw pScripting_B4C504                                       ;B4C4C6|        |B4C504;
    dw pScripting_B4C504                                       ;B4C4C8|        |B4C504;
    dw pScripting_B4C504                                       ;B4C4CA|        |B4C504;
    dw pScripting_B4C504                                       ;B4C4CC|        |B4C504;
    dw pScripting_B4C504                                       ;B4C4CE|        |B4C504;
    dw pScripting_B4C504                                       ;B4C4D0|        |B4C504;
    dw pScripting_B4C504                                       ;B4C4D2|        |B4C504;
    dw pScripting_B4C504                                       ;B4C4D4|        |B4C504;
    dw pScripting_B4C504                                       ;B4C4D6|        |B4C504;
 
DATA8_B4C4D8:
 
    %AICMD0x1A($0218, $0078, $B387A4, $00)                     ;B4C4D8
    %AICMD0x13($0001)                                          ;B4C4E0
    %AICMD0x1B($0305, $01)                                     ;B4C4E3
    %AICMD0x0D($01, $00, $50, $01)                             ;B4C4E7
    %AICMD0x1B($0304, $01)                                     ;B4C4EC
    %AICMD0x13($003C)                                          ;B4C4F0
    %AICMD0x1B($0305, $01)                                     ;B4C4F3
    %AICMD0x0D($02, $00, $80, $01)                             ;B4C4F7
    %AICMD0x37()                                               ;B4C4FC
    %AICMD0x41_ModifyVariable($7F1F33, $000A)                  ;B4C4FD
    %AICMD0x10_End()                                           ;B4C503

pScripting_B4C504:
    dw DATA8_B4C524                                            ;B4C504|        |B4C524;
    dw pScripting_B4C548                                       ;B4C506|        |B4C548;
    dw pScripting_B4C548                                       ;B4C508|        |B4C548;
    dw pScripting_B4C548                                       ;B4C50A|        |B4C548;
    dw pScripting_B4C548                                       ;B4C50C|        |B4C548;
    dw pScripting_B4C548                                       ;B4C50E|        |B4C548;
    dw pScripting_B4C548                                       ;B4C510|        |B4C548;
    dw pScripting_B4C548                                       ;B4C512|        |B4C548;
    dw pScripting_B4C548                                       ;B4C514|        |B4C548;
    dw pScripting_B4C548                                       ;B4C516|        |B4C548;
    dw pScripting_B4C548                                       ;B4C518|        |B4C548;
    dw pScripting_B4C548                                       ;B4C51A|        |B4C548;
    dw pScripting_B4C548                                       ;B4C51C|        |B4C548;
    dw pScripting_B4C548                                       ;B4C51E|        |B4C548;
    dw pScripting_B4C548                                       ;B4C520|        |B4C548;
    dw pScripting_B4C548                                       ;B4C522|        |B4C548;
 
DATA8_B4C524:
 
    %AICMD0x1A($0088, $0098, $B38798, $00)                     ;B4C524
    %AICMD0x13($0001)                                          ;B4C52C
    %AICMD0x1B($0303, $00)                                     ;B4C52F
    %AICMD0x0D($FF, $00, $30, $01)                             ;B4C533
    %AICMD0x13($003C)                                          ;B4C538
    %AICMD0x0D($FF, $00, $50, $01)                             ;B4C53B
    %AICMD0x37()                                               ;B4C540
    %AICMD0x41_ModifyVariable($7F1F33, $000A)                  ;B4C541
    %AICMD0x10_End()                                           ;B4C547

pScripting_B4C548:
    dw DATA8_B4C568                                            ;B4C548|        |B4C568;
    dw pScripting_B4C584                                       ;B4C54A|        |B4C584;
    dw pScripting_B4C584                                       ;B4C54C|        |B4C584;
    dw pScripting_B4C584                                       ;B4C54E|        |B4C584;
    dw pScripting_B4C584                                       ;B4C550|        |B4C584;
    dw pScripting_B4C584                                       ;B4C552|        |B4C584;
    dw pScripting_B4C584                                       ;B4C554|        |B4C584;
    dw pScripting_B4C584                                       ;B4C556|        |B4C584;
    dw pScripting_B4C584                                       ;B4C558|        |B4C584;
    dw pScripting_B4C584                                       ;B4C55A|        |B4C584;
    dw pScripting_B4C584                                       ;B4C55C|        |B4C584;
    dw pScripting_B4C584                                       ;B4C55E|        |B4C584;
    dw pScripting_B4C584                                       ;B4C560|        |B4C584;
    dw pScripting_B4C584                                       ;B4C562|        |B4C584;
    dw pScripting_B4C584                                       ;B4C564|        |B4C584;
    dw pScripting_B4C584                                       ;B4C566|        |B4C584;
 
DATA8_B4C568:
 
    %AICMD0x1A($0228, $0258, $B387B0, $00)                     ;B4C568
    %AICMD0x13($003C)                                          ;B4C570
    %AICMD0x1B($0307, $01)                                     ;B4C573
    %AICMD0x0D($01, $00, $FF, $01)                             ;B4C577
    %AICMD0x37()                                               ;B4C57C
    %AICMD0x41_ModifyVariable($7F1F33, $000A)                  ;B4C57D
    %AICMD0x10_End()                                           ;B4C583

pScripting_B4C584:
    dw DATA8_B4C5A4                                            ;B4C584|        |B4C5A4;
    dw pScripting_B4C5F4                                       ;B4C586|        |B4C5F4;
    dw pScripting_B4C5F4                                       ;B4C588|        |B4C5F4;
    dw pScripting_B4C5F4                                       ;B4C58A|        |B4C5F4;
    dw pScripting_B4C5F4                                       ;B4C58C|        |B4C5F4;
    dw pScripting_B4C5F4                                       ;B4C58E|        |B4C5F4;
    dw pScripting_B4C5F4                                       ;B4C590|        |B4C5F4;
    dw pScripting_B4C5F4                                       ;B4C592|        |B4C5F4;
    dw pScripting_B4C5F4                                       ;B4C594|        |B4C5F4;
    dw pScripting_B4C5F4                                       ;B4C596|        |B4C5F4;
    dw pScripting_B4C5F4                                       ;B4C598|        |B4C5F4;
    dw pScripting_B4C5F4                                       ;B4C59A|        |B4C5F4;
    dw pScripting_B4C5F4                                       ;B4C59C|        |B4C5F4;
    dw pScripting_B4C5F4                                       ;B4C59E|        |B4C5F4;
    dw pScripting_B4C5F4                                       ;B4C5A0|        |B4C5F4;
    dw pScripting_B4C5F4                                       ;B4C5A2|        |B4C5F4;
 
DATA8_B4C5A4:
 
    %AICMD0x07_SetPlayerDirection($01)                         ;B4C5A4
    %AICMD0x09($01, $B4C5B2)                                   ;B4C5A6
    %AICMD0x11()                                               ;B4C5AA
    %AICMD0x38()                                               ;B4C5AB
    %AICMD0x13($0001)                                          ;B4C5AC
    %AICMD0x12_Jump($B4C5AC)                                   ;B4C5AF
    %AICMD0x1A($0108, $001A, $B384EC, $00)                     ;B4C5B2
    %AICMD0x0D($01, $00, $08, $01)                             ;B4C5BA
    %AICMD0x0D($00, $FF, $06, $01)                             ;B4C5BF
    %AICMD0x0D($FF, $00, $08, $02)                             ;B4C5C4
    %AICMD0x0D($FF, $01, $04, $01)                             ;B4C5C9
    %AICMD0x0D($01, $00, $0C, $02)                             ;B4C5CE
    %AICMD0x0D($FF, $00, $06, $01)                             ;B4C5D3
    %AICMD0x0D($00, $FF, $10, $02)                             ;B4C5D8
    %AICMD0x0D($FF, $01, $04, $01)                             ;B4C5DD
    %AICMD0x0D($01, $01, $0C, $02)                             ;B4C5E2
    %AICMD0x0D($01, $00, $08, $02)                             ;B4C5E7
    %AICMD0x0D($00, $FF, $06, $01)                             ;B4C5EC
    %AICMD0x12_Jump($B4C5BA)                                   ;B4C5F1

pScripting_B4C5F4:
    dw DATA8_B4C614                                            ;B4C5F4|        |B4C614;
    dw pScripting_B4C6F1                                       ;B4C5F6|        |B4C6F1;
    dw pScripting_B4C6F1                                       ;B4C5F8|        |B4C6F1;
    dw pScripting_B4C6F1                                       ;B4C5FA|        |B4C6F1;
    dw pScripting_B4C6F1                                       ;B4C5FC|        |B4C6F1;
    dw pScripting_B4C6F1                                       ;B4C5FE|        |B4C6F1;
    dw pScripting_B4C6F1                                       ;B4C600|        |B4C6F1;
    dw pScripting_B4C6F1                                       ;B4C602|        |B4C6F1;
    dw pScripting_B4C6F1                                       ;B4C604|        |B4C6F1;
    dw pScripting_B4C6F1                                       ;B4C606|        |B4C6F1;
    dw pScripting_B4C6F1                                       ;B4C608|        |B4C6F1;
    dw pScripting_B4C6F1                                       ;B4C60A|        |B4C6F1;
    dw pScripting_B4C6F1                                       ;B4C60C|        |B4C6F1;
    dw pScripting_B4C6F1                                       ;B4C60E|        |B4C6F1;
    dw pScripting_B4C6F1                                       ;B4C610|        |B4C6F1;
    dw pScripting_B4C6F1                                       ;B4C612|        |B4C6F1;
 
DATA8_B4C614:
 
    %AICMD0x00_SetMusic($01, $B4)                              ;B4C614
    %AICMD0x23_OrWithIndexedValue($7F1F5E, $02)                ;B4C617
    %AICMD0x05_SetPosition($0088, $0078)                       ;B4C61C
    %AICMD0x02_FreezeTime()                                    ;B4C621
    %AICMD0x03_SetHour($07)                                    ;B4C622
    %AICMD0x07_SetPlayerDirection($00)                         ;B4C624
    %AICMD0x08()                                               ;B4C626
    %AICMD0x09($01, $B4C6B1)                                   ;B4C627
    %AICMD0x09($02, $B4C691)                                   ;B4C62B
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $00, $B4C655)   ;B4C62F
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $01, $B4C655)   ;B4C636
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $02, $B4C655)   ;B4C63D
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $03, $B4C655)   ;B4C644
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F66, $04, $B4C655)   ;B4C64B
    %AICMD0x12_Jump($B4C659)                                   ;B4C652
    %AICMD0x09($03, $B4C6D8)                                   ;B4C655
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F64, $07, $B4C671)   ;B4C659
    %AICMD0x14_JumpIfEqualsToIdxValue($7F1F64, $06, $B4C66C)   ;B4C660
    %AICMD0x06_SetDestination($15)                             ;B4C667
    %AICMD0x12_Jump($B4C676)                                   ;B4C669
    %AICMD0x06_SetDestination($16)                             ;B4C66C
    %AICMD0x12_Jump($B4C676)                                   ;B4C66E
    %AICMD0x06_SetDestination($17)                             ;B4C671
    %AICMD0x12_Jump($B4C676)                                   ;B4C673
    %AICMD0x38()                                               ;B4C676
    %AICMD0x13($005A)                                          ;B4C677
    %AICMD0x39($03, $0020)                                     ;B4C67A
    %AICMD0x39($00, $0040)                                     ;B4C67E
    %AICMD0x07_SetPlayerDirection($02)                         ;B4C682
    %AICMD0x0B($00)                                            ;B4C684
    %AICMD0x13($005A)                                          ;B4C686
    %AICMD0x0C($02)                                            ;B4C689
    %AICMD0x13($003C)                                          ;B4C68B
    %AICMD0x3D($3D)                                            ;B4C68E
    %AICMD0x10_End()                                           ;B4C690
    %AICMD0x1A($0088, $00B8, $B38438, $03)                     ;B4C691
    %AICMD0x0C($01)                                            ;B4C699
    %AICMD0x13($001E)                                          ;B4C69B
    %AICMD0x1B($02DC, $00)                                     ;B4C69E
    %AICMD0x0D($FF, $00, $10, $01)                             ;B4C6A2
    %AICMD0x1B($02DE, $00)                                     ;B4C6A7
    %AICMD0x13($0078)                                          ;B4C6AB
    %AICMD0x0B($02)                                            ;B4C6AE
    %AICMD0x10_End()                                           ;B4C6B0
    %AICMD0x1A($0078, $00B8, $B38450, $02)                     ;B4C6B1
    %AICMD0x0C($00)                                            ;B4C6B9
    %AICMD0x1B($02E0, $00)                                     ;B4C6BB
    %AICMD0x13($0078)                                          ;B4C6BF
    %AICMD0x1B($02DF, $00)                                     ;B4C6C2
    %AICMD0x0D($00, $01, $10, $01)                             ;B4C6C6
    %AICMD0x13($0014)                                          ;B4C6CB
    %AICMD0x0B($01)                                            ;B4C6CE
    %AICMD0x1B($02E0, $00)                                     ;B4C6D0
    %AICMD0x13($0078)                                          ;B4C6D4
    %AICMD0x10_End()                                           ;B4C6D7
    %AICMD0x1A($00A8, $0078, $B38474, $00)                     ;B4C6D8
    %AICMD0x1B($02E7, $00)                                     ;B4C6E0
    %AICMD0x13($0078)                                          ;B4C6E4
    %AICMD0x1B($02E3, $00)                                     ;B4C6E7
    %AICMD0x13($00F0)                                          ;B4C6EB
    %AICMD0x12_Jump($B4C6E0)                                   ;B4C6EE

pScripting_B4C6F1:
    dw DATA8_B4C711                                            ;B4C6F1|        |B4C711;
    dw pScripting_B4C7C3                                       ;B4C6F3|        |B4C7C3;
    dw pScripting_B4C7C3                                       ;B4C6F5|        |B4C7C3;
    dw pScripting_B4C7C3                                       ;B4C6F7|        |B4C7C3;
    dw pScripting_B4C7C3                                       ;B4C6F9|        |B4C7C3;
    dw pScripting_B4C7C3                                       ;B4C6FB|        |B4C7C3;
    dw pScripting_B4C7C3                                       ;B4C6FD|        |B4C7C3;
    dw pScripting_B4C7C3                                       ;B4C6FF|        |B4C7C3;
    dw pScripting_B4C7C3                                       ;B4C701|        |B4C7C3;
    dw pScripting_B4C7C3                                       ;B4C703|        |B4C7C3;
    dw pScripting_B4C7C3                                       ;B4C705|        |B4C7C3;
    dw pScripting_B4C7C3                                       ;B4C707|        |B4C7C3;
    dw pScripting_B4C7C3                                       ;B4C709|        |B4C7C3;
    dw pScripting_B4C7C3                                       ;B4C70B|        |B4C7C3;
    dw pScripting_B4C7C3                                       ;B4C70D|        |B4C7C3;
    dw pScripting_B4C7C3                                       ;B4C70F|        |B4C7C3;
 
DATA8_B4C711:
 
    %AICMD0x00_SetMusic($11, $B4)                              ;B4C711
    %AICMD0x02_FreezeTime()                                    ;B4C714
    %AICMD0x03_SetHour($06)                                    ;B4C715
    %AICMD0x05_SetPosition($0088, $0158)                       ;B4C717
    %AICMD0x07_SetPlayerDirection($00)                         ;B4C71C
    %AICMD0x08()                                               ;B4C71E
    %AICMD0x09($01, $B4C74F)                                   ;B4C71F
    %AICMD0x06_SetDestination($01)                             ;B4C723
    %AICMD0x38()                                               ;B4C725
    %AICMD0x39($00, $0020)                                     ;B4C726
    %AICMD0x07_SetPlayerDirection($01)                         ;B4C72A
    %AICMD0x13($005A)                                          ;B4C72C
    %AICMD0x07_SetPlayerDirection($02)                         ;B4C72F
    %AICMD0x13($0078)                                          ;B4C731
    %AICMD0x0B($00)                                            ;B4C734
    %AICMD0x0C($01)                                            ;B4C736
    %AICMD0x39($00, $0030)                                     ;B4C738
    %AICMD0x40()                                               ;B4C73C
    %AICMD0x39($03, $0044)                                     ;B4C73D
    %AICMD0x13($0046)                                          ;B4C741
    %AICMD0x3A($03, $002C)                                     ;B4C744
    %AICMD0x0B($02)                                            ;B4C748
    %AICMD0x0C($03)                                            ;B4C74A
    %AICMD0x3D($3D)                                            ;B4C74C
    %AICMD0x10_End()                                           ;B4C74E
    %AICMD0x1A($0110, $0178, $B38114, $00)                     ;B4C74F
    %AICMD0x0C($00)                                            ;B4C757
    %AICMD0x1B($01EC, $00)                                     ;B4C759
    %AICMD0x0D($FF, $00, $78, $01)                             ;B4C75D
    %AICMD0x13($003C)                                          ;B4C762
    %AICMD0x1B($01F2, $00)                                     ;B4C765
    %AICMD0x0B($01)                                            ;B4C769
    %AICMD0x0C($02)                                            ;B4C76B
    %AICMD0x1B($01E9, $00)                                     ;B4C76D
    %AICMD0x0D($FF, $00, $40, $02)                             ;B4C771
    %AICMD0x1B($01DD, $00)                                     ;B4C776
    %AICMD0x13($003C)                                          ;B4C77A
    %AICMD0x1B($01DA, $00)                                     ;B4C77D
    %AICMD0x0D($00, $01, $60, $02)                             ;B4C781
    %AICMD0x1B($01F2, $00)                                     ;B4C786
    %AICMD0x13($003C)                                          ;B4C78A
    %AICMD0x1B($01E9, $00)                                     ;B4C78D
    %AICMD0x0D($FF, $00, $40, $02)                             ;B4C791
    %AICMD0x1B($01F2, $01)                                     ;B4C796
    %AICMD0x13($0078)                                          ;B4C79A
    %AICMD0x1B($01E9, $01)                                     ;B4C79D
    %AICMD0x0D($01, $00, $20, $02)                             ;B4C7A1
    %AICMD0x1B($01E4, $00)                                     ;B4C7A6
    %AICMD0x13($003C)                                          ;B4C7AA
    %AICMD0x1B($01EA, $01)                                     ;B4C7AD
    %AICMD0x13($0050)                                          ;B4C7B1
    %AICMD0x1B($01EB, $01)                                     ;B4C7B4
    %AICMD0x13($00B4)                                          ;B4C7B8
    %AICMD0x0B($03)                                            ;B4C7BB
    %AICMD0x13($0001)                                          ;B4C7BD
    %AICMD0x12_Jump($B4C7BD)                                   ;B4C7C0

pScripting_B4C7C3:
    dw DATA8_B4C7E3                                            ;B4C7C3|        |B4C7E3;
    dw pScripting_B4C9F9                                       ;B4C7C5|        |B4C9F9;
    dw pScripting_B4C9F9                                       ;B4C7C7|        |B4C9F9;
    dw pScripting_B4C9F9                                       ;B4C7C9|        |B4C9F9;
    dw pScripting_B4C9F9                                       ;B4C7CB|        |B4C9F9;
    dw pScripting_B4C9F9                                       ;B4C7CD|        |B4C9F9;
    dw pScripting_B4C9F9                                       ;B4C7CF|        |B4C9F9;
    dw pScripting_B4C9F9                                       ;B4C7D1|        |B4C9F9;
    dw pScripting_B4C9F9                                       ;B4C7D3|        |B4C9F9;
    dw pScripting_B4C9F9                                       ;B4C7D5|        |B4C9F9;
    dw pScripting_B4C9F9                                       ;B4C7D7|        |B4C9F9;
    dw pScripting_B4C9F9                                       ;B4C7D9|        |B4C9F9;
    dw pScripting_B4C9F9                                       ;B4C7DB|        |B4C9F9;
    dw pScripting_B4C9F9                                       ;B4C7DD|        |B4C9F9;
    dw pScripting_B4C9F9                                       ;B4C7DF|        |B4C9F9;
    dw pScripting_B4C9F9                                       ;B4C7E1|        |B4C9F9;
 
DATA8_B4C7E3:
 
    %AICMD0x00_SetMusic($10, $B4)                              ;B4C7E3
    %AICMD0x02_FreezeTime()                                    ;B4C7E6
    %AICMD0x03_SetHour($06)                                    ;B4C7E7
    %AICMD0x05_SetPosition($FFE8, $0078)                       ;B4C7E9
    %AICMD0x07_SetPlayerDirection($02)                         ;B4C7EE
    %AICMD0x40()                                               ;B4C7F0
    %AICMD0x08()                                               ;B4C7F1
    %AICMD0x09($01, $B4C9BA)                                   ;B4C7F2
    %AICMD0x09($02, $B4C862)                                   ;B4C7F6
    %AICMD0x09($03, $B4C898)                                   ;B4C7FA
    %AICMD0x09($04, $B4C8D1)                                   ;B4C7FE
    %AICMD0x09($05, $B4C913)                                   ;B4C802
    %AICMD0x09($06, $B4C949)                                   ;B4C806
    %AICMD0x09($07, $B4C971)                                   ;B4C80A
    %AICMD0x06_SetDestination($43)                             ;B4C80E
    %AICMD0x38()                                               ;B4C810
    %AICMD0x13($0078)                                          ;B4C811
    %AICMD0x39($02, $0088)                                     ;B4C814
    %AICMD0x13($003C)                                          ;B4C818
    %AICMD0x07_SetPlayerDirection($00)                         ;B4C81B
    %AICMD0x19($0062, $00)                                     ;B4C81D
    %AICMD0x13($005A)                                          ;B4C821
    %AICMD0x0B($00)                                            ;B4C824
    %AICMD0x19($0063, $00)                                     ;B4C826
    %AICMD0x13($005A)                                          ;B4C82A
    %AICMD0x0B($01)                                            ;B4C82D
    %AICMD0x19($0060, $00)                                     ;B4C82F
    %AICMD0x13($005A)                                          ;B4C833
    %AICMD0x07_SetPlayerDirection($00)                         ;B4C836
    %AICMD0x13($001E)                                          ;B4C838
    %AICMD0x19($0026, $00)                                     ;B4C83B
    %AICMD0x13($0078)                                          ;B4C83F
    %AICMD0x19($0027, $00)                                     ;B4C842
    %AICMD0x13($005A)                                          ;B4C846
    %AICMD0x3A($00, $0020)                                     ;B4C849
    %AICMD0x19($0024, $00)                                     ;B4C84D
    %AICMD0x13($005A)                                          ;B4C851
    %AICMD0x3A($02, $0020)                                     ;B4C854
    %AICMD0x19($0026, $00)                                     ;B4C858
    %AICMD0x13($003C)                                          ;B4C85C
    %AICMD0x3D($3D)                                            ;B4C85F
    %AICMD0x10_End()                                           ;B4C861
    %AICMD0x1A($00B8, $0058, $B38888, $03)                     ;B4C862
    %AICMD0x0C($00)                                            ;B4C86A
    %AICMD0x1B($018C, $00)                                     ;B4C86C
    %AICMD0x1B($019F, $00)                                     ;B4C870
    %AICMD0x0D($00, $01, $20, $01)                             ;B4C874
    %AICMD0x13($0028)                                          ;B4C879
    %AICMD0x1B($018B, $00)                                     ;B4C87C
    %AICMD0x0D($FF, $00, $36, $01)                             ;B4C880
    %AICMD0x13($003C)                                          ;B4C885
    %AICMD0x2F($B380FC)                                        ;B4C888
    %AICMD0x22($08, $04, $01, $B38108, $08)                    ;B4C88B
    %AICMD0x13($0001)                                          ;B4C892
    %AICMD0x12_Jump($B4C892)                                   ;B4C895
    %AICMD0x1A($0038, $0068, $B38870, $02)                     ;B4C898
    %AICMD0x0C($00)                                            ;B4C8A0
    %AICMD0x1B($0190, $01)                                     ;B4C8A2
    %AICMD0x0C($01)                                            ;B4C8A6
    %AICMD0x1B($018C, $01)                                     ;B4C8A8
    %AICMD0x1B($019F, $00)                                     ;B4C8AC
    %AICMD0x0D($00, $01, $1C, $02)                             ;B4C8B0
    %AICMD0x13($0014)                                          ;B4C8B5
    %AICMD0x1B($018B, $01)                                     ;B4C8B8
    %AICMD0x0D($01, $00, $4E, $02)                             ;B4C8BC
    %AICMD0x13($0078)                                          ;B4C8C1
    %AICMD0x22($08, $08, $01, $B38108, $08)                    ;B4C8C4
    %AICMD0x13($0001)                                          ;B4C8CB
    %AICMD0x12_Jump($B4C8CB)                                   ;B4C8CE
    %AICMD0x1A($0028, $00C8, $B38108, $01)                     ;B4C8D1
    %AICMD0x0C($01)                                            ;B4C8D9
    %AICMD0x13($000A)                                          ;B4C8DB
    %AICMD0x1B($018B, $01)                                     ;B4C8DE
    %AICMD0x0D($01, $00, $20, $01)                             ;B4C8E2
    %AICMD0x13($001E)                                          ;B4C8E7
    %AICMD0x1B($018B, $01)                                     ;B4C8EA
    %AICMD0x0D($01, $00, $36, $02)                             ;B4C8EE
    %AICMD0x13($001E)                                          ;B4C8F3
    %AICMD0x1B($01A7, $00)                                     ;B4C8F6
    %AICMD0x0D($00, $FF, $42, $01)                             ;B4C8FA
    %AICMD0x1B($018B, $01)                                     ;B4C8FF
    %AICMD0x13($0078)                                          ;B4C903
    %AICMD0x22($08, $04, $01, $B38108, $01)                    ;B4C906
    %AICMD0x13($0001)                                          ;B4C90D
    %AICMD0x12_Jump($B4C90D)                                   ;B4C910
    %AICMD0x1A($0098, $0038, $B38888, $00)                     ;B4C913
    %AICMD0x0C($00)                                            ;B4C91B
    %AICMD0x13($0014)                                          ;B4C91D
    %AICMD0x1B($019F, $00)                                     ;B4C920
    %AICMD0x0D($00, $01, $30, $01)                             ;B4C924
    %AICMD0x13($001E)                                          ;B4C929
    %AICMD0x1B($018B, $00)                                     ;B4C92C
    %AICMD0x0D($FF, $00, $3C, $02)                             ;B4C930
    %AICMD0x1B($0190, $00)                                     ;B4C935
    %AICMD0x13($0078)                                          ;B4C939
    %AICMD0x1B($0190, $00)                                     ;B4C93C
    %AICMD0x13($0078)                                          ;B4C940
    %AICMD0x13($0001)                                          ;B4C943
    %AICMD0x12_Jump($B4C943)                                   ;B4C946
    %AICMD0x1A($00A8, $00A8, $B386FC, $03)                     ;B4C949
    %AICMD0x0C($01)                                            ;B4C951
    %AICMD0x1B($01B0, $00)                                     ;B4C953
    %AICMD0x0D($FE, $00, $48, $03)                             ;B4C957
    %AICMD0x13($0014)                                          ;B4C95C
    %AICMD0x1B($01B7, $00)                                     ;B4C95F
    %AICMD0x0D($00, $FF, $4E, $03)                             ;B4C963
    %AICMD0x13($003C)                                          ;B4C968
    %AICMD0x13($0001)                                          ;B4C96B
    %AICMD0x12_Jump($B4C96B)                                   ;B4C96E
    %AICMD0x1A($0088, $00B8, $B386B4, $02)                     ;B4C971
    %AICMD0x0C($00)                                            ;B4C979
    %AICMD0x13($003C)                                          ;B4C97B
    %AICMD0x1B($01CA, $00)                                     ;B4C97E
    %AICMD0x0D($FF, $00, $20, $01)                             ;B4C982
    %AICMD0x13($003C)                                          ;B4C987
    %AICMD0x1B($01CA, $01)                                     ;B4C98A
    %AICMD0x0D($01, $00, $20, $01)                             ;B4C98E
    %AICMD0x13($003C)                                          ;B4C993
    %AICMD0x1B($01D8, $00)                                     ;B4C996
    %AICMD0x0D($00, $FF, $38, $02)                             ;B4C99A
    %AICMD0x13($003C)                                          ;B4C99F
    %AICMD0x1B($01CA, $01)                                     ;B4C9A2
    %AICMD0x0D($01, $00, $40, $02)                             ;B4C9A6
    %AICMD0x0B($02)                                            ;B4C9AB
    %AICMD0x1B($01D0, $01)                                     ;B4C9AD
    %AICMD0x13($0078)                                          ;B4C9B1
    %AICMD0x13($0001)                                          ;B4C9B4
    %AICMD0x12_Jump($B4C9B4)                                   ;B4C9B7
    %AICMD0x1A($0038, $00A0, $B389A8, $02)                     ;B4C9BA
    %AICMD0x0C($00)                                            ;B4C9C2
    %AICMD0x1B($01F5, $01)                                     ;B4C9C4
    %AICMD0x13($0078)                                          ;B4C9C8
    %AICMD0x1B($01F4, $01)                                     ;B4C9CB
    %AICMD0x1B($01F3, $01)                                     ;B4C9CF
    %AICMD0x13($0078)                                          ;B4C9D3
    %AICMD0x1B($01E8, $01)                                     ;B4C9D6
    %AICMD0x0C($02)                                            ;B4C9DA
    %AICMD0x1B($01EC, $01)                                     ;B4C9DC
    %AICMD0x0D($01, $00, $60, $01)                             ;B4C9E0
    %AICMD0x1B($01F2, $01)                                     ;B4C9E5
    %AICMD0x13($005A)                                          ;B4C9E9
    %AICMD0x1B($01EE, $01)                                     ;B4C9EC
    %AICMD0x13($0078)                                          ;B4C9F0
    %AICMD0x13($0001)                                          ;B4C9F3
    %AICMD0x12_Jump($B4C9F3)                                   ;B4C9F6

pScripting_B4C9F9:
    dw DATA8_B4CA19                                            ;B4C9F9|        |B4CA19;
    dw pScripting_B4CB3F                                       ;B4C9FB|        |B4CB3F;
    dw pScripting_B4CB3F                                       ;B4C9FD|        |B4CB3F;
    dw pScripting_B4CB3F                                       ;B4C9FF|        |B4CB3F;
    dw pScripting_B4CB3F                                       ;B4CA01|        |B4CB3F;
    dw pScripting_B4CB3F                                       ;B4CA03|        |B4CB3F;
    dw pScripting_B4CB3F                                       ;B4CA05|        |B4CB3F;
    dw pScripting_B4CB3F                                       ;B4CA07|        |B4CB3F;
    dw pScripting_B4CB3F                                       ;B4CA09|        |B4CB3F;
    dw pScripting_B4CB3F                                       ;B4CA0B|        |B4CB3F;
    dw pScripting_B4CB3F                                       ;B4CA0D|        |B4CB3F;
    dw pScripting_B4CB3F                                       ;B4CA0F|        |B4CB3F;
    dw pScripting_B4CB3F                                       ;B4CA11|        |B4CB3F;
    dw pScripting_B4CB3F                                       ;B4CA13|        |B4CB3F;
    dw pScripting_B4CB3F                                       ;B4CA15|        |B4CB3F;
    dw pScripting_B4CB3F                                       ;B4CA17|        |B4CB3F;
 
DATA8_B4CA19:
 
    %AICMD0x00_SetMusic($10, $B4)                              ;B4CA19
    %AICMD0x05_SetPosition($FFF0, $0068)                       ;B4CA1C
    %AICMD0x02_FreezeTime()                                    ;B4CA21
    %AICMD0x03_SetHour($06)                                    ;B4CA22
    %AICMD0x07_SetPlayerDirection($02)                         ;B4CA24
    %AICMD0x40()                                               ;B4CA26
    %AICMD0x08()                                               ;B4CA27
    %AICMD0x09($01, $B4CAA6)                                   ;B4CA28
    %AICMD0x09($02, $B4CAE0)                                   ;B4CA2C
    %AICMD0x09($03, $B4CB15)                                   ;B4CA30
    %AICMD0x09($04, $B4CB2A)                                   ;B4CA34
    %AICMD0x06_SetDestination($43)                             ;B4CA38
    %AICMD0x38()                                               ;B4CA3A
    %AICMD0x13($0078)                                          ;B4CA3B
    %AICMD0x39($02, $0078)                                     ;B4CA3E
    %AICMD0x13($001E)                                          ;B4CA42
    %AICMD0x19($007A, $01)                                     ;B4CA45
    %AICMD0x13($005A)                                          ;B4CA49
    %AICMD0x3E($16)                                            ;B4CA4C
    %AICMD0x0B($00)                                            ;B4CA4E
    %AICMD0x13($005A)                                          ;B4CA50
    %AICMD0x07_SetPlayerDirection($00)                         ;B4CA53
    %AICMD0x13($001E)                                          ;B4CA55
    %AICMD0x39($00, $0010)                                     ;B4CA58
    %AICMD0x13($003C)                                          ;B4CA5C
    %AICMD0x39($03, $0080)                                     ;B4CA5F
    %AICMD0x3F()                                               ;B4CA63
    %AICMD0x13($00B4)                                          ;B4CA64
    %AICMD0x39($02, $0090)                                     ;B4CA67
    %AICMD0x07_SetPlayerDirection($01)                         ;B4CA6B
    %AICMD0x13($001E)                                          ;B4CA6D
    %AICMD0x19($0065, $00)                                     ;B4CA70
    %AICMD0x13($005A)                                          ;B4CA74
    %AICMD0x39($03, $0010)                                     ;B4CA77
    %AICMD0x13($000A)                                          ;B4CA7B
    %AICMD0x39($01, $0010)                                     ;B4CA7E
    %AICMD0x13($000A)                                          ;B4CA82
    %AICMD0x19($0066, $01)                                     ;B4CA85
    %AICMD0x13($005A)                                          ;B4CA89
    %AICMD0x07_SetPlayerDirection($02)                         ;B4CA8C
    %AICMD0x0B($01)                                            ;B4CA8E
    %AICMD0x13($005A)                                          ;B4CA90
    %AICMD0x0C($02)                                            ;B4CA93
    %AICMD0x39($00, $0010)                                     ;B4CA95
    %AICMD0x13($001E)                                          ;B4CA99
    %AICMD0x19($003D, $00)                                     ;B4CA9C
    %AICMD0x13($012C)                                          ;B4CAA0
    %AICMD0x3D($3D)                                            ;B4CAA3
    %AICMD0x10_End()                                           ;B4CAA5
    %AICMD0x1A($FFF0, $0088, $B38114, $02)                     ;B4CAA6
    %AICMD0x0C($00)                                            ;B4CAAE
    %AICMD0x1B($01EC, $01)                                     ;B4CAB0
    %AICMD0x0D($01, $00, $58, $01)                             ;B4CAB4
    %AICMD0x13($005A)                                          ;B4CAB9
    %AICMD0x1B($01F8, $01)                                     ;B4CABC
    %AICMD0x13($0078)                                          ;B4CAC0
    %AICMD0x1B($01E9, $01)                                     ;B4CAC3
    %AICMD0x0D($01, $00, $10, $01)                             ;B4CAC7
    %AICMD0x13($003C)                                          ;B4CACC
    %AICMD0x1B($01EA, $01)                                     ;B4CACF
    %AICMD0x13($00B4)                                          ;B4CAD3
    %AICMD0x1B($01EB, $01)                                     ;B4CAD6
    %AICMD0x13($005A)                                          ;B4CADA
    %AICMD0x12_Jump($B4CACF)                                   ;B4CADD
    %AICMD0x1A($0078, $006C, $B38870, $02)                     ;B4CAE0
    %AICMD0x13($021C)                                          ;B4CAE8
    %AICMD0x1B($0190, $01)                                     ;B4CAEB
    %AICMD0x13($00B4)                                          ;B4CAEF
    %AICMD0x1B($0194, $01)                                     ;B4CAF2
    %AICMD0x13($00B4)                                          ;B4CAF6
    %AICMD0x1B($0193, $01)                                     ;B4CAF9
    %AICMD0x13($00B4)                                          ;B4CAFD
    %AICMD0x1B($018C, $01)                                     ;B4CB00
    %AICMD0x0C($01)                                            ;B4CB04
    %AICMD0x1B($0191, $01)                                     ;B4CB06
    %AICMD0x13($00B4)                                          ;B4CB0A
    %AICMD0x0B($02)                                            ;B4CB0D
    %AICMD0x13($0001)                                          ;B4CB0F
    %AICMD0x12_Jump($B4CB0F)                                   ;B4CB12
    %AICMD0x1A($00A0, $0088, $B38144, $00)                     ;B4CB15
    %AICMD0x22($18, $18, $01, $B38144, $0C)                    ;B4CB1D
    %AICMD0x13($0001)                                          ;B4CB24
    %AICMD0x12_Jump($B4CB24)                                   ;B4CB27
    %AICMD0x1A($0098, $00A8, $B38150, $00)                     ;B4CB2A
    %AICMD0x22($18, $18, $01, $B38150, $0C)                    ;B4CB32
    %AICMD0x13($0001)                                          ;B4CB39
    %AICMD0x12_Jump($B4CB39)                                   ;B4CB3C

pScripting_B4CB3F:
    dw DATA8_B4CB5F                                            ;B4CB3F|        |B4CB5F;
    dw pScripting_B4CD56                                       ;B4CB41|        |B4CD56;
    dw pScripting_B4CD56                                       ;B4CB43|        |B4CD56;
    dw pScripting_B4CD56                                       ;B4CB45|        |B4CD56;
    dw pScripting_B4CD56                                       ;B4CB47|        |B4CD56;
    dw pScripting_B4CD56                                       ;B4CB49|        |B4CD56;
    dw pScripting_B4CD56                                       ;B4CB4B|        |B4CD56;
    dw pScripting_B4CD56                                       ;B4CB4D|        |B4CD56;
    dw pScripting_B4CD56                                       ;B4CB4F|        |B4CD56;
    dw pScripting_B4CD56                                       ;B4CB51|        |B4CD56;
    dw pScripting_B4CD56                                       ;B4CB53|        |B4CD56;
    dw pScripting_B4CD56                                       ;B4CB55|        |B4CD56;
    dw pScripting_B4CD56                                       ;B4CB57|        |B4CD56;
    dw pScripting_B4CD56                                       ;B4CB59|        |B4CD56;
    dw pScripting_B4CD56                                       ;B4CB5B|        |B4CD56;
    dw pScripting_B4CD56                                       ;B4CB5D|        |B4CD56;
 
DATA8_B4CB5F:
 
    %AICMD0x00_SetMusic($10, $B4)                              ;B4CB5F
    %AICMD0x02_FreezeTime()                                    ;B4CB62
    %AICMD0x03_SetHour($06)                                    ;B4CB63
    %AICMD0x05_SetPosition($0080, $00C8)                       ;B4CB65
    %AICMD0x07_SetPlayerDirection($01)                         ;B4CB6A
    %AICMD0x08()                                               ;B4CB6C
    %AICMD0x09($01, $B4CC39)                                   ;B4CB6D
    %AICMD0x09($02, $B4CC73)                                   ;B4CB71
    %AICMD0x09($03, $B4CCA7)                                   ;B4CB75
    %AICMD0x09($04, $B4CCDD)                                   ;B4CB79
    %AICMD0x09($05, $B4CD12)                                   ;B4CB7D
    %AICMD0x09($06, $B4CD41)                                   ;B4CB81
    %AICMD0x09($07, $B4CC1F)                                   ;B4CB85
    %AICMD0x09($08, $B4CC2B)                                   ;B4CB89
    %AICMD0x3B($14)                                            ;B4CB8D
    %AICMD0x06_SetDestination($28)                             ;B4CB8F
    %AICMD0x38()                                               ;B4CB91
    %AICMD0x13($001E)                                          ;B4CB92
    %AICMD0x3A($01, $0010)                                     ;B4CB95
    %AICMD0x13($000A)                                          ;B4CB99
    %AICMD0x3A($03, $0033)                                     ;B4CB9C
    %AICMD0x07_SetPlayerDirection($00)                         ;B4CBA0
    %AICMD0x13($001E)                                          ;B4CBA2
    %AICMD0x3F()                                               ;B4CBA5
    %AICMD0x13($003C)                                          ;B4CBA6
    %AICMD0x39($01, $0010)                                     ;B4CBA9
    %AICMD0x3A($02, $002F)                                     ;B4CBAD
    %AICMD0x39($01, $0018)                                     ;B4CBB1
    %AICMD0x13($001E)                                          ;B4CBB5
    %AICMD0x3E($14)                                            ;B4CBB8
    %AICMD0x0B($02)                                            ;B4CBBA
    %AICMD0x13($001E)                                          ;B4CBBC
    %AICMD0x39($01, $0010)                                     ;B4CBBF
    %AICMD0x13($0014)                                          ;B4CBC3
    %AICMD0x07_SetPlayerDirection($03)                         ;B4CBC6
    %AICMD0x13($0014)                                          ;B4CBC8
    %AICMD0x3A($03, $0015)                                     ;B4CBCB
    %AICMD0x3F()                                               ;B4CBCF
    %AICMD0x13($001E)                                          ;B4CBD0
    %AICMD0x0B($00)                                            ;B4CBD3
    %AICMD0x0C($01)                                            ;B4CBD5
    %AICMD0x19($0042, $00)                                     ;B4CBD7
    %AICMD0x13($0028)                                          ;B4CBDB
    %AICMD0x19($0026, $00)                                     ;B4CBDE
    %AICMD0x13($003C)                                          ;B4CBE2
    %AICMD0x3A($03, $0040)                                     ;B4CBE5
    %AICMD0x0B($03)                                            ;B4CBE9
    %AICMD0x07_SetPlayerDirection($02)                         ;B4CBEB
    %AICMD0x13($003C)                                          ;B4CBED
    %AICMD0x19($0026, $00)                                     ;B4CBF0
    %AICMD0x13($003C)                                          ;B4CBF4
    %AICMD0x3E($25)                                            ;B4CBF7
    %AICMD0x13($001E)                                          ;B4CBF9
    %AICMD0x3A($02, $0040)                                     ;B4CBFC
    %AICMD0x13($003C)                                          ;B4CC00
    %AICMD0x3A($00, $0040)                                     ;B4CC03
    %AICMD0x13($003C)                                          ;B4CC07
    %AICMD0x3A($01, $0040)                                     ;B4CC0A
    %AICMD0x13($003C)                                          ;B4CC0E
    %AICMD0x3A($02, $0028)                                     ;B4CC11
    %AICMD0x13($0014)                                          ;B4CC15
    %AICMD0x3A($00, $0018)                                     ;B4CC18
    %AICMD0x3D($3D)                                            ;B4CC1C
    %AICMD0x10_End()                                           ;B4CC1E
    %AICMD0x1A($0078, $0088, $B3815C, $00)                     ;B4CC1F
    %AICMD0x0C($02)                                            ;B4CC27
    %AICMD0x37()                                               ;B4CC29
    %AICMD0x10_End()                                           ;B4CC2A
    %AICMD0x1A($0048, $0060, $B3815C, $00)                     ;B4CC2B
    %AICMD0x13($0001)                                          ;B4CC33
    %AICMD0x12_Jump($B4CC33)                                   ;B4CC36
    %AICMD0x1A($00C0, $0048, $B3893C, $00)                     ;B4CC39
    %AICMD0x0C($00)                                            ;B4CC41
    %AICMD0x1B($0214, $00)                                     ;B4CC43
    %AICMD0x0D($FF, $00, $20, $01)                             ;B4CC47
    %AICMD0x0D($00, $01, $3A, $01)                             ;B4CC4C
    %AICMD0x0D($FF, $00, $42, $01)                             ;B4CC51
    %AICMD0x1B($0212, $00)                                     ;B4CC56
    %AICMD0x0B($01)                                            ;B4CC5A
    %AICMD0x0C($03)                                            ;B4CC5C
    %AICMD0x0D($FF, $00, $28, $01)                             ;B4CC5E
    %AICMD0x2F($B38144)                                        ;B4CC63
    %AICMD0x22($10, $10, $01, $B38144, $04)                    ;B4CC66
    %AICMD0x13($0001)                                          ;B4CC6D
    %AICMD0x12_Jump($B4CC6D)                                   ;B4CC70
    %AICMD0x1A($00C8, $0078, $B38144, $03)                     ;B4CC73
    %AICMD0x0C($00)                                            ;B4CC7B
    %AICMD0x1B($0214, $00)                                     ;B4CC7D
    %AICMD0x0D($FF, $00, $20, $01)                             ;B4CC81
    %AICMD0x0D($FF, $01, $14, $01)                             ;B4CC86
    %AICMD0x0D($FF, $00, $38, $01)                             ;B4CC8B
    %AICMD0x0C($03)                                            ;B4CC90
    %AICMD0x13($003C)                                          ;B4CC92
    %AICMD0x0D($FF, $00, $28, $01)                             ;B4CC95
    %AICMD0x22($10, $08, $01, $B38144, $04)                    ;B4CC9A
    %AICMD0x13($0001)                                          ;B4CCA1
    %AICMD0x12_Jump($B4CCA1)                                   ;B4CCA4
    %AICMD0x1A($0038, $0050, $B38144, $02)                     ;B4CCA7
    %AICMD0x0C($00)                                            ;B4CCAF
    %AICMD0x1B($0212, $01)                                     ;B4CCB1
    %AICMD0x0D($00, $01, $18, $01)                             ;B4CCB5
    %AICMD0x13($000A)                                          ;B4CCBA
    %AICMD0x0D($01, $01, $08, $01)                             ;B4CCBD
    %AICMD0x13($00B4)                                          ;B4CCC2
    %AICMD0x0C($03)                                            ;B4CCC5
    %AICMD0x1B($0214, $00)                                     ;B4CCC7
    %AICMD0x0D($FF, $00, $18, $01)                             ;B4CCCB
    %AICMD0x22($08, $08, $01, $B38144, $04)                    ;B4CCD0
    %AICMD0x13($0001)                                          ;B4CCD7
    %AICMD0x12_Jump($B4CCD7)                                   ;B4CCDA
    %AICMD0x1A($0098, $00A8, $B38144, $00)                     ;B4CCDD
    %AICMD0x0C($00)                                            ;B4CCE5
    %AICMD0x1B($0212, $00)                                     ;B4CCE7
    %AICMD0x0D($FF, $00, $3C, $01)                             ;B4CCEB
    %AICMD0x1B($0213, $00)                                     ;B4CCF0
    %AICMD0x0D($FF, $FF, $10, $01)                             ;B4CCF4
    %AICMD0x0C($03)                                            ;B4CCF9
    %AICMD0x0D($00, $FF, $08, $01)                             ;B4CCFB
    %AICMD0x0D($FF, $00, $20, $01)                             ;B4CD00
    %AICMD0x22($08, $08, $01, $B38144, $04)                    ;B4CD05
    %AICMD0x13($0001)                                          ;B4CD0C
    %AICMD0x12_Jump($B4CD0C)                                   ;B4CD0F
    %AICMD0x1A($0088, $0078, $B38144, $01)                     ;B4CD12
    %AICMD0x0C($00)                                            ;B4CD1A
    %AICMD0x1B($0212, $00)                                     ;B4CD1C
    %AICMD0x0D($FF, $00, $30, $01)                             ;B4CD20
    %AICMD0x13($001E)                                          ;B4CD25
    %AICMD0x0D($00, $01, $08, $01)                             ;B4CD28
    %AICMD0x0C($03)                                            ;B4CD2D
    %AICMD0x0D($FF, $00, $20, $01)                             ;B4CD2F
    %AICMD0x22($10, $08, $01, $B38144, $04)                    ;B4CD34
    %AICMD0x13($0001)                                          ;B4CD3B
    %AICMD0x12_Jump($B4CD3B)                                   ;B4CD3E
    %AICMD0x1A($00B8, $0068, $B38150, $00)                     ;B4CD41
    %AICMD0x22($18, $18, $01, $B38150, $0C)                    ;B4CD49
    %AICMD0x13($0001)                                          ;B4CD50
    %AICMD0x12_Jump($B4CD50)                                   ;B4CD53

pScripting_B4CD56:
    dw DATA8_B4CD76                                            ;B4CD56|        |B4CD76;
    dw pScripting_B4CECA                                       ;B4CD58|        |B4CECA;
    dw pScripting_B4CECA                                       ;B4CD5A|        |B4CECA;
    dw pScripting_B4CECA                                       ;B4CD5C|        |B4CECA;
    dw pScripting_B4CECA                                       ;B4CD5E|        |B4CECA;
    dw pScripting_B4CECA                                       ;B4CD60|        |B4CECA;
    dw pScripting_B4CECA                                       ;B4CD62|        |B4CECA;
    dw pScripting_B4CECA                                       ;B4CD64|        |B4CECA;
    dw pScripting_B4CECA                                       ;B4CD66|        |B4CECA;
    dw pScripting_B4CECA                                       ;B4CD68|        |B4CECA;
    dw pScripting_B4CECA                                       ;B4CD6A|        |B4CECA;
    dw pScripting_B4CECA                                       ;B4CD6C|        |B4CECA;
    dw pScripting_B4CECA                                       ;B4CD6E|        |B4CECA;
    dw pScripting_B4CECA                                       ;B4CD70|        |B4CECA;
    dw pScripting_B4CECA                                       ;B4CD72|        |B4CECA;
    dw pScripting_B4CECA                                       ;B4CD74|        |B4CECA;
 
DATA8_B4CD76:
 
    %AICMD0x00_SetMusic($10, $B4)                              ;B4CD76
    %AICMD0x02_FreezeTime()                                    ;B4CD79
    %AICMD0x03_SetHour($06)                                    ;B4CD7A
    %AICMD0x05_SetPosition($FFE8, $0078)                       ;B4CD7C
    %AICMD0x07_SetPlayerDirection($02)                         ;B4CD81
    %AICMD0x40()                                               ;B4CD83
    %AICMD0x08()                                               ;B4CD84
    %AICMD0x09($01, $B4CDEF)                                   ;B4CD85
    %AICMD0x09($02, $B4CE35)                                   ;B4CD89
    %AICMD0x09($03, $B4CE6C)                                   ;B4CD8D
    %AICMD0x09($04, $B4CE88)                                   ;B4CD91
    %AICMD0x06_SetDestination($43)                             ;B4CD95
    %AICMD0x38()                                               ;B4CD97
    %AICMD0x13($0078)                                          ;B4CD98
    %AICMD0x39($02, $0090)                                     ;B4CD9B
    %AICMD0x07_SetPlayerDirection($01)                         ;B4CD9F
    %AICMD0x13($003C)                                          ;B4CDA1
    %AICMD0x19($0079, $00)                                     ;B4CDA4
    %AICMD0x13($0064)                                          ;B4CDA8
    %AICMD0x3E($17)                                            ;B4CDAB
    %AICMD0x13($003C)                                          ;B4CDAD
    %AICMD0x39($03, $0080)                                     ;B4CDB0
    %AICMD0x3F()                                               ;B4CDB4
    %AICMD0x0B($00)                                            ;B4CDB5
    %AICMD0x0C($01)                                            ;B4CDB7
    %AICMD0x13($00B4)                                          ;B4CDB9
    %AICMD0x39($02, $0080)                                     ;B4CDBC
    %AICMD0x13($003C)                                          ;B4CDC0
    %AICMD0x19($0040, $00)                                     ;B4CDC3
    %AICMD0x13($0078)                                          ;B4CDC7
    %AICMD0x07_SetPlayerDirection($00)                         ;B4CDCA
    %AICMD0x19($004C, $00)                                     ;B4CDCC
    %AICMD0x13($000A)                                          ;B4CDD0
    %AICMD0x19($00E8, $00)                                     ;B4CDD3
    %AICMD0x09($05, $B4CDE1)                                   ;B4CDD7
    %AICMD0x13($012C)                                          ;B4CDDB
    %AICMD0x3D($3D)                                            ;B4CDDE
    %AICMD0x10_End()                                           ;B4CDE0
    %AICMD0x1A($0078, $007D, $B38A80, $00)                     ;B4CDE1
    %AICMD0x13($0001)                                          ;B4CDE9
    %AICMD0x12_Jump($B4CDE9)                                   ;B4CDEC
    %AICMD0x1A($00A8, $0088, $B38114, $02)                     ;B4CDEF
    %AICMD0x0C($00)                                            ;B4CDF7
    %AICMD0x1B($01EC, $00)                                     ;B4CDF9
    %AICMD0x0D($FF, $00, $48, $01)                             ;B4CDFD
    %AICMD0x13($003C)                                          ;B4CE02
    %AICMD0x1B($01F2, $00)                                     ;B4CE05
    %AICMD0x13($0078)                                          ;B4CE09
    %AICMD0x1B($01F1, $00)                                     ;B4CE0C
    %AICMD0x13($0064)                                          ;B4CE10
    %AICMD0x1B($01E8, $00)                                     ;B4CE13
    %AICMD0x13($003C)                                          ;B4CE17
    %AICMD0x1B($01F6, $00)                                     ;B4CE1A
    %AICMD0x13($005A)                                          ;B4CE1E
    %AICMD0x1B($01F3, $00)                                     ;B4CE21
    %AICMD0x13($00B4)                                          ;B4CE25
    %AICMD0x1B($01F4, $00)                                     ;B4CE28
    %AICMD0x13($0168)                                          ;B4CE2C
    %AICMD0x13($0001)                                          ;B4CE2F
    %AICMD0x12_Jump($B4CE2F)                                   ;B4CE32
    %AICMD0x1A($0078, $006A, $B380FC, $02)                     ;B4CE35
    %AICMD0x13($0078)                                          ;B4CE3D
    %AICMD0x1B($0194, $01)                                     ;B4CE40
    %AICMD0x13($0078)                                          ;B4CE44
    %AICMD0x1B($0193, $01)                                     ;B4CE47
    %AICMD0x13($00A0)                                          ;B4CE4B
    %AICMD0x1B($018C, $01)                                     ;B4CE4E
    %AICMD0x13($0078)                                          ;B4CE52
    %AICMD0x1B($018D, $01)                                     ;B4CE55
    %AICMD0x0B($01)                                            ;B4CE59
    %AICMD0x1B($0192, $01)                                     ;B4CE5B
    %AICMD0x13($0078)                                          ;B4CE5F
    %AICMD0x1B($0195, $01)                                     ;B4CE62
    %AICMD0x13($0001)                                          ;B4CE66
    %AICMD0x12_Jump($B4CE5B)                                   ;B4CE69
    %AICMD0x1A($0098, $0098, $B386C0, $03)                     ;B4CE6C
    %AICMD0x13($0078)                                          ;B4CE74
    %AICMD0x1B($01BD, $00)                                     ;B4CE77
    %AICMD0x13($0078)                                          ;B4CE7B
    %AICMD0x1B($01BE, $00)                                     ;B4CE7E
    %AICMD0x13($0078)                                          ;B4CE82
    %AICMD0x12_Jump($B4CE77)                                   ;B4CE85
    %AICMD0x1A($003A, $0068, $B384EC, $00)                     ;B4CE88
    %AICMD0x0D($01, $00, $08, $01)                             ;B4CE90
    %AICMD0x0D($00, $FF, $06, $01)                             ;B4CE95
    %AICMD0x0D($FF, $00, $08, $02)                             ;B4CE9A
    %AICMD0x0D($FF, $01, $04, $01)                             ;B4CE9F
    %AICMD0x0D($01, $00, $0C, $02)                             ;B4CEA4
    %AICMD0x0D($FF, $00, $06, $01)                             ;B4CEA9
    %AICMD0x0D($00, $FF, $10, $02)                             ;B4CEAE
    %AICMD0x0D($FF, $01, $04, $01)                             ;B4CEB3
    %AICMD0x0D($01, $01, $0C, $02)                             ;B4CEB8
    %AICMD0x0D($01, $00, $08, $02)                             ;B4CEBD
    %AICMD0x0D($00, $FF, $06, $01)                             ;B4CEC2
    %AICMD0x12_Jump($B4CE90)                                   ;B4CEC7

pScripting_B4CECA:
    dw DATA8_B4CEEA                                            ;B4CECA|        |B4CEEA;
    dw pScripting_B4D011                                       ;B4CECC|        |B4D011;
    dw pScripting_B4D011                                       ;B4CECE|        |B4D011;
    dw pScripting_B4D011                                       ;B4CED0|        |B4D011;
    dw pScripting_B4D011                                       ;B4CED2|        |B4D011;
    dw pScripting_B4D011                                       ;B4CED4|        |B4D011;
    dw pScripting_B4D011                                       ;B4CED6|        |B4D011;
    dw pScripting_B4D011                                       ;B4CED8|        |B4D011;
    dw pScripting_B4D011                                       ;B4CEDA|        |B4D011;
    dw pScripting_B4D011                                       ;B4CEDC|        |B4D011;
    dw pScripting_B4D011                                       ;B4CEDE|        |B4D011;
    dw pScripting_B4D011                                       ;B4CEE0|        |B4D011;
    dw pScripting_B4D011                                       ;B4CEE2|        |B4D011;
    dw pScripting_B4D011                                       ;B4CEE4|        |B4D011;
    dw pScripting_B4D011                                       ;B4CEE6|        |B4D011;
    dw pScripting_B4D011                                       ;B4CEE8|        |B4D011;
 
DATA8_B4CEEA:
 
    %AICMD0x47($800921, $10)                                   ;B4CEEA
    %AICMD0x47($800926, $05)                                   ;B4CEEF
    %AICMD0x00_SetMusic($10, $B4)                              ;B4CEF4
    %AICMD0x02_FreezeTime()                                    ;B4CEF7
    %AICMD0x03_SetHour($06)                                    ;B4CEF8
    %AICMD0x05_SetPosition($00E8, $FFF8)                       ;B4CEFA
    %AICMD0x07_SetPlayerDirection($03)                         ;B4CEFF
    %AICMD0x08()                                               ;B4CF01
    %AICMD0x09($01, $B4CFB1)                                   ;B4CF02
    %AICMD0x06_SetDestination($44)                             ;B4CF06
    %AICMD0x38()                                               ;B4CF08
    %AICMD0x13($003C)                                          ;B4CF09
    %AICMD0x39($00, $0070)                                     ;B4CF0C
    %AICMD0x13($001E)                                          ;B4CF10
    %AICMD0x3A($03, $0040)                                     ;B4CF13
    %AICMD0x13($001E)                                          ;B4CF17
    %AICMD0x3A($00, $0018)                                     ;B4CF1A
    %AICMD0x07_SetPlayerDirection($02)                         ;B4CF1E
    %AICMD0x3E($10)                                            ;B4CF20
    %AICMD0x13($001E)                                          ;B4CF22
    %AICMD0x3A($01, $0018)                                     ;B4CF25
    %AICMD0x13($0028)                                          ;B4CF29
    %AICMD0x3A($02, $0058)                                     ;B4CF2C
    %AICMD0x3F()                                               ;B4CF30
    %AICMD0x13($005A)                                          ;B4CF31
    %AICMD0x07_SetPlayerDirection($03)                         ;B4CF34
    %AICMD0x3A($03, $0058)                                     ;B4CF36
    %AICMD0x13($001E)                                          ;B4CF3A
    %AICMD0x3A($00, $0010)                                     ;B4CF3D
    %AICMD0x07_SetPlayerDirection($02)                         ;B4CF41
    %AICMD0x3E($10)                                            ;B4CF43
    %AICMD0x13($001E)                                          ;B4CF45
    %AICMD0x3A($01, $0010)                                     ;B4CF48
    %AICMD0x13($001E)                                          ;B4CF4C
    %AICMD0x3A($02, $0058)                                     ;B4CF4F
    %AICMD0x3F()                                               ;B4CF53
    %AICMD0x13($005A)                                          ;B4CF54
    %AICMD0x07_SetPlayerDirection($03)                         ;B4CF57
    %AICMD0x3A($03, $0058)                                     ;B4CF59
    %AICMD0x13($001E)                                          ;B4CF5D
    %AICMD0x39($00, $000F)                                     ;B4CF60
    %AICMD0x13($001E)                                          ;B4CF64
    %AICMD0x07_SetPlayerDirection($03)                         ;B4CF67
    %AICMD0x56_UseEquippedItem()                               ;B4CF69
    %AICMD0x13($0050)                                          ;B4CF6A
    %AICMD0x39($00, $000F)                                     ;B4CF6D
    %AICMD0x07_SetPlayerDirection($03)                         ;B4CF71
    %AICMD0x56_UseEquippedItem()                               ;B4CF73
    %AICMD0x13($0050)                                          ;B4CF74
    %AICMD0x39($00, $000F)                                     ;B4CF77
    %AICMD0x07_SetPlayerDirection($03)                         ;B4CF7B
    %AICMD0x56_UseEquippedItem()                               ;B4CF7D
    %AICMD0x13($0050)                                          ;B4CF7E
    %AICMD0x39($00, $000F)                                     ;B4CF81
    %AICMD0x07_SetPlayerDirection($03)                         ;B4CF85
    %AICMD0x56_UseEquippedItem()                               ;B4CF87
    %AICMD0x13($0050)                                          ;B4CF88
    %AICMD0x39($00, $000F)                                     ;B4CF8B
    %AICMD0x07_SetPlayerDirection($03)                         ;B4CF8F
    %AICMD0x56_UseEquippedItem()                               ;B4CF91
    %AICMD0x13($0050)                                          ;B4CF92
    %AICMD0x39($00, $000F)                                     ;B4CF95
    %AICMD0x07_SetPlayerDirection($03)                         ;B4CF99
    %AICMD0x56_UseEquippedItem()                               ;B4CF9B
    %AICMD0x13($0050)                                          ;B4CF9C
    %AICMD0x3A($01, $0030)                                     ;B4CF9F
    %AICMD0x13($001E)                                          ;B4CFA3
    %AICMD0x3A($03, $0040)                                     ;B4CFA6
    %AICMD0x0B($00)                                            ;B4CFAA
    %AICMD0x0C($01)                                            ;B4CFAC
    %AICMD0x3D($3D)                                            ;B4CFAE
    %AICMD0x10_End()                                           ;B4CFB0
    %AICMD0x1A($0098, $0098, $B389A8, $03)                     ;B4CFB1
    %AICMD0x1B($01EA, $00)                                     ;B4CFB9
    %AICMD0x0C($00)                                            ;B4CFBD
    %AICMD0x13($00B4)                                          ;B4CFBF
    %AICMD0x1B($01E1, $00)                                     ;B4CFC2
    %AICMD0x0D($00, $FF, $20, $01)                             ;B4CFC6
    %AICMD0x1B($01EE, $01)                                     ;B4CFCB
    %AICMD0x13($0078)                                          ;B4CFCF
    %AICMD0x1B($01DA, $00)                                     ;B4CFD2
    %AICMD0x0D($00, $01, $20, $01)                             ;B4CFD6
    %AICMD0x1B($01EE, $01)                                     ;B4CFDB
    %AICMD0x13($005A)                                          ;B4CFDF
    %AICMD0x1B($01F7, $00)                                     ;B4CFE2
    %AICMD0x13($005A)                                          ;B4CFE6
    %AICMD0x1B($01E1, $00)                                     ;B4CFE9
    %AICMD0x0D($00, $FF, $10, $01)                             ;B4CFED
    %AICMD0x1B($01F7, $00)                                     ;B4CFF2
    %AICMD0x13($005A)                                          ;B4CFF6
    %AICMD0x1B($01E1, $00)                                     ;B4CFF9
    %AICMD0x0D($00, $FF, $10, $01)                             ;B4CFFD
    %AICMD0x1B($01F7, $00)                                     ;B4D002
    %AICMD0x13($005A)                                          ;B4D006
    %AICMD0x0B($01)                                            ;B4D009
    %AICMD0x13($0001)                                          ;B4D00B
    %AICMD0x12_Jump($B4D00B)                                   ;B4D00E

pScripting_B4D011:
    dw DATA8_B4D031                                            ;B4D011|        |B4D031;
    dw pScripting_B4D160                                       ;B4D013|        |B4D160;
    dw pScripting_B4D160                                       ;B4D015|        |B4D160;
    dw pScripting_B4D160                                       ;B4D017|        |B4D160;
    dw pScripting_B4D160                                       ;B4D019|        |B4D160;
    dw pScripting_B4D160                                       ;B4D01B|        |B4D160;
    dw pScripting_B4D160                                       ;B4D01D|        |B4D160;
    dw pScripting_B4D160                                       ;B4D01F|        |B4D160;
    dw pScripting_B4D160                                       ;B4D021|        |B4D160;
    dw pScripting_B4D160                                       ;B4D023|        |B4D160;
    dw pScripting_B4D160                                       ;B4D025|        |B4D160;
    dw pScripting_B4D160                                       ;B4D027|        |B4D160;
    dw pScripting_B4D160                                       ;B4D029|        |B4D160;
    dw pScripting_B4D160                                       ;B4D02B|        |B4D160;
    dw pScripting_B4D160                                       ;B4D02D|        |B4D160;
    dw pScripting_B4D160                                       ;B4D02F|        |B4D160;
 
DATA8_B4D031:
 
    %AICMD0x47($800921, $15)                                   ;B4D031
    %AICMD0x00_SetMusic($10, $B4)                              ;B4D036
    %AICMD0x02_FreezeTime()                                    ;B4D039
    %AICMD0x03_SetHour($06)                                    ;B4D03A
    %AICMD0x05_SetPosition($0108, $0078)                       ;B4D03C
    %AICMD0x07_SetPlayerDirection($03)                         ;B4D041
    %AICMD0x08()                                               ;B4D043
    %AICMD0x09($01, $B4D0D4)                                   ;B4D044
    %AICMD0x09($02, $B4D127)                                   ;B4D048
    %AICMD0x06_SetDestination($45)                             ;B4D04C
    %AICMD0x38()                                               ;B4D04E
    %AICMD0x13($00B4)                                          ;B4D04F
    %AICMD0x3A($03, $0040)                                     ;B4D052
    %AICMD0x07_SetPlayerDirection($00)                         ;B4D056
    %AICMD0x13($001E)                                          ;B4D058
    %AICMD0x3E($11)                                            ;B4D05B
    %AICMD0x13($003C)                                          ;B4D05D
    %AICMD0x07_SetPlayerDirection($01)                         ;B4D060
    %AICMD0x13($001E)                                          ;B4D062
    %AICMD0x39($01, $0020)                                     ;B4D065
    %AICMD0x3F()                                               ;B4D069
    %AICMD0x0B($00)                                            ;B4D06A
    %AICMD0x13($003C)                                          ;B4D06C
    %AICMD0x39($00, $0020)                                     ;B4D06F
    %AICMD0x13($001E)                                          ;B4D073
    %AICMD0x39($03, $0010)                                     ;B4D076
    %AICMD0x07_SetPlayerDirection($00)                         ;B4D07A
    %AICMD0x13($001E)                                          ;B4D07C
    %AICMD0x3E($11)                                            ;B4D07F
    %AICMD0x13($003C)                                          ;B4D081
    %AICMD0x07_SetPlayerDirection($01)                         ;B4D084
    %AICMD0x13($001E)                                          ;B4D086
    %AICMD0x39($01, $0020)                                     ;B4D089
    %AICMD0x13($001E)                                          ;B4D08D
    %AICMD0x07_SetPlayerDirection($01)                         ;B4D090
    %AICMD0x3F()                                               ;B4D092
    %AICMD0x0B($01)                                            ;B4D093
    %AICMD0x13($003C)                                          ;B4D095
    %AICMD0x3A($00, $0018)                                     ;B4D098
    %AICMD0x19($00A5, $00)                                     ;B4D09C
    %AICMD0x13($003C)                                          ;B4D0A0
    %AICMD0x3A($02, $0038)                                     ;B4D0A3
    %AICMD0x56_UseEquippedItem()                               ;B4D0A7
    %AICMD0x13($0078)                                          ;B4D0A8
    %AICMD0x3A($03, $0010)                                     ;B4D0AB
    %AICMD0x56_UseEquippedItem()                               ;B4D0AF
    %AICMD0x13($0078)                                          ;B4D0B0
    %AICMD0x19($004A, $00)                                     ;B4D0B3
    %AICMD0x13($0078)                                          ;B4D0B7
    %AICMD0x39($03, $0060)                                     ;B4D0BA
    %AICMD0x13($001E)                                          ;B4D0BE
    %AICMD0x07_SetPlayerDirection($00)                         ;B4D0C1
    %AICMD0x13($003C)                                          ;B4D0C3
    %AICMD0x19($0030, $00)                                     ;B4D0C6
    %AICMD0x13($003C)                                          ;B4D0CA
    %AICMD0x0B($02)                                            ;B4D0CD
    %AICMD0x0C($03)                                            ;B4D0CF
    %AICMD0x3D($3D)                                            ;B4D0D1
    %AICMD0x10_End()                                           ;B4D0D3
    %AICMD0x1A($00A8, $0048, $B38114, $00)                     ;B4D0D4
    %AICMD0x1B($01DB, $00)                                     ;B4D0DC
    %AICMD0x13($0078)                                          ;B4D0E0
    %AICMD0x1B($01DA, $00)                                     ;B4D0E3
    %AICMD0x0D($00, $01, $20, $01)                             ;B4D0E7
    %AICMD0x1B($01DC, $00)                                     ;B4D0EC
    %AICMD0x13($0078)                                          ;B4D0F0
    %AICMD0x1B($01DB, $00)                                     ;B4D0F3
    %AICMD0x13($0078)                                          ;B4D0F7
    %AICMD0x1B($01DC, $01)                                     ;B4D0FA
    %AICMD0x13($003C)                                          ;B4D0FE
    %AICMD0x0C($02)                                            ;B4D101
    %AICMD0x1B($01DA, $00)                                     ;B4D103
    %AICMD0x0D($00, $01, $10, $01)                             ;B4D107
    %AICMD0x1B($01E9, $00)                                     ;B4D10C
    %AICMD0x13($001E)                                          ;B4D110
    %AICMD0x0D($FF, $00, $20, $01)                             ;B4D113
    %AICMD0x1B($01F2, $00)                                     ;B4D118
    %AICMD0x13($0078)                                          ;B4D11C
    %AICMD0x0B($03)                                            ;B4D11F
    %AICMD0x13($0001)                                          ;B4D121
    %AICMD0x12_Jump($B4D121)                                   ;B4D124
    %AICMD0x1A($0080, $0048, $B3812C, $03)                     ;B4D127
    %AICMD0x0C($00)                                            ;B4D12F
    %AICMD0x1B($0208, $00)                                     ;B4D131
    %AICMD0x13($003C)                                          ;B4D135
    %AICMD0x1B($0200, $00)                                     ;B4D138
    %AICMD0x0C($01)                                            ;B4D13C
    %AICMD0x1B($0208, $00)                                     ;B4D13E
    %AICMD0x13($003C)                                          ;B4D142
    %AICMD0x1B($0200, $00)                                     ;B4D145
    %AICMD0x13($0078)                                          ;B4D149
    %AICMD0x1B($0203, $00)                                     ;B4D14C
    %AICMD0x13($0078)                                          ;B4D150
    %AICMD0x1B($0205, $00)                                     ;B4D153
    %AICMD0x13($00B4)                                          ;B4D157
    %AICMD0x13($0001)                                          ;B4D15A
    %AICMD0x12_Jump($B4D15A)                                   ;B4D15D

pScripting_B4D160:
    dw DATA8_B4D180                                            ;B4D160|        |B4D180;
    dw pScripting_B4D2CC                                       ;B4D162|        |B4D2CC;
    dw pScripting_B4D2CC                                       ;B4D164|        |B4D2CC;
    dw pScripting_B4D2CC                                       ;B4D166|        |B4D2CC;
    dw pScripting_B4D2CC                                       ;B4D168|        |B4D2CC;
    dw pScripting_B4D2CC                                       ;B4D16A|        |B4D2CC;
    dw pScripting_B4D2CC                                       ;B4D16C|        |B4D2CC;
    dw pScripting_B4D2CC                                       ;B4D16E|        |B4D2CC;
    dw pScripting_B4D2CC                                       ;B4D170|        |B4D2CC;
    dw pScripting_B4D2CC                                       ;B4D172|        |B4D2CC;
    dw pScripting_B4D2CC                                       ;B4D174|        |B4D2CC;
    dw pScripting_B4D2CC                                       ;B4D176|        |B4D2CC;
    dw pScripting_B4D2CC                                       ;B4D178|        |B4D2CC;
    dw pScripting_B4D2CC                                       ;B4D17A|        |B4D2CC;
    dw pScripting_B4D2CC                                       ;B4D17C|        |B4D2CC;
    dw pScripting_B4D2CC                                       ;B4D17E|        |B4D2CC;
 
DATA8_B4D180:
 
    %AICMD0x00_SetMusic($10, $B4)                              ;B4D180
    %AICMD0x02_FreezeTime()                                    ;B4D183
    %AICMD0x03_SetHour($06)                                    ;B4D184
    %AICMD0x05_SetPosition($00B8, $0068)                       ;B4D186
    %AICMD0x07_SetPlayerDirection($00)                         ;B4D18B
    %AICMD0x08()                                               ;B4D18D
    %AICMD0x09($01, $B4D216)                                   ;B4D18E
    %AICMD0x09($02, $B4D283)                                   ;B4D192
    %AICMD0x09($04, $B4D1D4)                                   ;B4D196
    %AICMD0x09($05, $B4D1E9)                                   ;B4D19A
    %AICMD0x09($06, $B4D1FE)                                   ;B4D19E
    %AICMD0x3B($12)                                            ;B4D1A2
    %AICMD0x06_SetDestination($46)                             ;B4D1A4
    %AICMD0x38()                                               ;B4D1A6
    %AICMD0x13($003C)                                          ;B4D1A7
    %AICMD0x39($03, $00C0)                                     ;B4D1AA
    %AICMD0x13($0078)                                          ;B4D1AE
    %AICMD0x3F()                                               ;B4D1B1
    %AICMD0x13($001E)                                          ;B4D1B2
    %AICMD0x07_SetPlayerDirection($02)                         ;B4D1B5
    %AICMD0x13($001E)                                          ;B4D1B7
    %AICMD0x3A($02, $006A)                                     ;B4D1BA
    %AICMD0x07_SetPlayerDirection($00)                         ;B4D1BE
    %AICMD0x3E($12)                                            ;B4D1C0
    %AICMD0x13($001E)                                          ;B4D1C2
    %AICMD0x3A($03, $006C)                                     ;B4D1C5
    %AICMD0x0B($00)                                            ;B4D1C9
    %AICMD0x3F()                                               ;B4D1CB
    %AICMD0x13($012C)                                          ;B4D1CC
    %AICMD0x0C($05)                                            ;B4D1CF
    %AICMD0x3D($3D)                                            ;B4D1D1
    %AICMD0x10_End()                                           ;B4D1D3
    %AICMD0x1A($00B8, $0078, $B38A8C, $00)                     ;B4D1D4
    %AICMD0x0C($00)                                            ;B4D1DC
    %AICMD0x1B($00B7, $00)                                     ;B4D1DE
    %AICMD0x13($003C)                                          ;B4D1E2
    %AICMD0x37()                                               ;B4D1E5
    %AICMD0x0B($01)                                            ;B4D1E6
    %AICMD0x10_End()                                           ;B4D1E8
    %AICMD0x1A($0098, $0078, $B38A8C, $00)                     ;B4D1E9
    %AICMD0x0C($01)                                            ;B4D1F1
    %AICMD0x1B($00B7, $00)                                     ;B4D1F3
    %AICMD0x13($003C)                                          ;B4D1F7
    %AICMD0x37()                                               ;B4D1FA
    %AICMD0x0B($02)                                            ;B4D1FB
    %AICMD0x10_End()                                           ;B4D1FD
    %AICMD0x1A($0088, $0078, $B38A8C, $00)                     ;B4D1FE
    %AICMD0x0C($02)                                            ;B4D206
    %AICMD0x13($003C)                                          ;B4D208
    %AICMD0x1B($00B7, $00)                                     ;B4D20B
    %AICMD0x13($003C)                                          ;B4D20F
    %AICMD0x37()                                               ;B4D212
    %AICMD0x0B($03)                                            ;B4D213
    %AICMD0x10_End()                                           ;B4D215
    %AICMD0x1A($0078, $0078, $B38960, $02)                     ;B4D216
    %AICMD0x13($00C8)                                          ;B4D21E
    %AICMD0x1B($01F6, $01)                                     ;B4D221
    %AICMD0x13($0078)                                          ;B4D225
    %AICMD0x1B($01EB, $01)                                     ;B4D228
    %AICMD0x13($00B4)                                          ;B4D22C
    %AICMD0x1B($01EA, $01)                                     ;B4D22F
    %AICMD0x13($00B4)                                          ;B4D233
    %AICMD0x0C($03)                                            ;B4D236
    %AICMD0x1B($01E8, $01)                                     ;B4D238
    %AICMD0x13($003C)                                          ;B4D23C
    %AICMD0x0C($03)                                            ;B4D23F
    %AICMD0x1B($01F2, $01)                                     ;B4D241
    %AICMD0x13($0078)                                          ;B4D245
    %AICMD0x0B($04)                                            ;B4D248
    %AICMD0x13($0078)                                          ;B4D24A
    %AICMD0x1B($01EC, $01)                                     ;B4D24D
    %AICMD0x0D($01, $00, $30, $01)                             ;B4D251
    %AICMD0x13($0028)                                          ;B4D256
    %AICMD0x1B($01E2, $00)                                     ;B4D259
    %AICMD0x0D($00, $FF, $10, $01)                             ;B4D25D
    %AICMD0x13($0028)                                          ;B4D262
    %AICMD0x1B($01EC, $01)                                     ;B4D265
    %AICMD0x0D($01, $00, $48, $01)                             ;B4D269
    %AICMD0x13($0028)                                          ;B4D26E
    %AICMD0x1B($01EC, $00)                                     ;B4D271
    %AICMD0x0D($FF, $00, $58, $01)                             ;B4D275
    %AICMD0x13($005A)                                          ;B4D27A
    %AICMD0x13($0001)                                          ;B4D27D
    %AICMD0x12_Jump($B4D27D)                                   ;B4D280
    %AICMD0x0C($04)                                            ;B4D283
    %AICMD0x1A($0088, $0078, $B38504, $00)                     ;B4D285
    %AICMD0x1B($0321, $00)                                     ;B4D28D
    %AICMD0x13($003C)                                          ;B4D291
    %AICMD0x1B($0324, $01)                                     ;B4D294
    %AICMD0x0D($01, $00, $20, $01)                             ;B4D298
    %AICMD0x13($001E)                                          ;B4D29D
    %AICMD0x1B($0323, $00)                                     ;B4D2A0
    %AICMD0x0D($00, $FF, $20, $01)                             ;B4D2A4
    %AICMD0x13($001E)                                          ;B4D2A9
    %AICMD0x1B($0324, $01)                                     ;B4D2AC
    %AICMD0x0D($01, $00, $50, $01)                             ;B4D2B0
    %AICMD0x13($001E)                                          ;B4D2B5
    %AICMD0x1B($0324, $00)                                     ;B4D2B8
    %AICMD0x0D($FF, $00, $80, $01)                             ;B4D2BC
    %AICMD0x1B($0325, $00)                                     ;B4D2C1
    %AICMD0x13($003C)                                          ;B4D2C5
    %AICMD0x0B($05)                                            ;B4D2C8
    %AICMD0x37()                                               ;B4D2CA
    %AICMD0x10_End()                                           ;B4D2CB

pScripting_B4D2CC:
    dw DATA8_B4D2EC                                            ;B4D2CC|        |B4D2EC;
    dw pScripting_B4D447                                       ;B4D2CE|        |B4D447;
    dw pScripting_B4D447                                       ;B4D2D0|        |B4D447;
    dw pScripting_B4D447                                       ;B4D2D2|        |B4D447;
    dw pScripting_B4D447                                       ;B4D2D4|        |B4D447;
    dw pScripting_B4D447                                       ;B4D2D6|        |B4D447;
    dw pScripting_B4D447                                       ;B4D2D8|        |B4D447;
    dw pScripting_B4D447                                       ;B4D2DA|        |B4D447;
    dw pScripting_B4D447                                       ;B4D2DC|        |B4D447;
    dw pScripting_B4D447                                       ;B4D2DE|        |B4D447;
    dw pScripting_B4D447                                       ;B4D2E0|        |B4D447;
    dw pScripting_B4D447                                       ;B4D2E2|        |B4D447;
    dw pScripting_B4D447                                       ;B4D2E4|        |B4D447;
    dw pScripting_B4D447                                       ;B4D2E6|        |B4D447;
    dw pScripting_B4D447                                       ;B4D2E8|        |B4D447;
    dw pScripting_B4D447                                       ;B4D2EA|        |B4D447;
 
DATA8_B4D2EC:
 
    %AICMD0x47($800921, $10)                                   ;B4D2EC
    %AICMD0x47($800926, $05)                                   ;B4D2F1
    %AICMD0x00_SetMusic($10, $B4)                              ;B4D2F6
    %AICMD0x02_FreezeTime()                                    ;B4D2F9
    %AICMD0x03_SetHour($06)                                    ;B4D2FA
    %AICMD0x05_SetPosition($0058, $0068)                       ;B4D2FC
    %AICMD0x07_SetPlayerDirection($00)                         ;B4D301
    %AICMD0x08()                                               ;B4D303
    %AICMD0x09($01, $B4D384)                                   ;B4D304
    %AICMD0x09($02, $B4D3A1)                                   ;B4D308
    %AICMD0x09($03, $B4D3E6)                                   ;B4D30C
    %AICMD0x06_SetDestination($47)                             ;B4D310
    %AICMD0x38()                                               ;B4D312
    %AICMD0x13($001E)                                          ;B4D313
    %AICMD0x3A($02, $0028)                                     ;B4D316
    %AICMD0x07_SetPlayerDirection($00)                         ;B4D31A
    %AICMD0x56_UseEquippedItem()                               ;B4D31C
    %AICMD0x13($0050)                                          ;B4D31D
    %AICMD0x39($03, $0010)                                     ;B4D320
    %AICMD0x07_SetPlayerDirection($00)                         ;B4D324
    %AICMD0x13($001E)                                          ;B4D326
    %AICMD0x56_UseEquippedItem()                               ;B4D329
    %AICMD0x13($0050)                                          ;B4D32A
    %AICMD0x39($03, $0010)                                     ;B4D32D
    %AICMD0x07_SetPlayerDirection($00)                         ;B4D331
    %AICMD0x13($001E)                                          ;B4D333
    %AICMD0x56_UseEquippedItem()                               ;B4D336
    %AICMD0x13($0050)                                          ;B4D337
    %AICMD0x0B($00)                                            ;B4D33A
    %AICMD0x13($003C)                                          ;B4D33C
    %AICMD0x07_SetPlayerDirection($03)                         ;B4D33F
    %AICMD0x0C($02)                                            ;B4D341
    %AICMD0x39($03, $0040)                                     ;B4D343
    %AICMD0x13($003C)                                          ;B4D347
    %AICMD0x3A($02, $0028)                                     ;B4D34A
    %AICMD0x07_SetPlayerDirection($00)                         ;B4D34E
    %AICMD0x13($001E)                                          ;B4D350
    %AICMD0x3E($13)                                            ;B4D353
    %AICMD0x13($001E)                                          ;B4D355
    %AICMD0x3A($03, $0030)                                     ;B4D358
    %AICMD0x13($0014)                                          ;B4D35C
    %AICMD0x3F()                                               ;B4D35F
    %AICMD0x13($000A)                                          ;B4D360
    %AICMD0x09($04, $B4D42D)                                   ;B4D363
    %AICMD0x0B($04)                                            ;B4D367
    %AICMD0x13($003C)                                          ;B4D369
    %AICMD0x19($000F, $00)                                     ;B4D36C
    %AICMD0x13($0028)                                          ;B4D370
    %AICMD0x19($0023, $00)                                     ;B4D373
    %AICMD0x13($0028)                                          ;B4D377
    %AICMD0x19($000F, $00)                                     ;B4D37A
    %AICMD0x13($0028)                                          ;B4D37E
    %AICMD0x3D($3D)                                            ;B4D381
    %AICMD0x10_End()                                           ;B4D383
    %AICMD0x1A($0078, $0058, $B38114, $02)                     ;B4D384
    %AICMD0x0C($00)                                            ;B4D38C
    %AICMD0x1B($01F2, $00)                                     ;B4D38E
    %AICMD0x13($0078)                                          ;B4D392
    %AICMD0x0B($01)                                            ;B4D395
    %AICMD0x1B($01EA, $00)                                     ;B4D397
    %AICMD0x13($0001)                                          ;B4D39B
    %AICMD0x12_Jump($B4D39B)                                   ;B4D39E
    %AICMD0x1A($FFE8, $0068, $B384C8, $00)                     ;B4D3A1
    %AICMD0x0C($01)                                            ;B4D3A9
    %AICMD0x1B($030E, $01)                                     ;B4D3AB
    %AICMD0x0D($01, $00, $BC, $02)                             ;B4D3AF
    %AICMD0x1B($030D, $01)                                     ;B4D3B4
    %AICMD0x0C($04)                                            ;B4D3B8
    %AICMD0x13($001E)                                          ;B4D3BA
    %AICMD0x1B($030E, $00)                                     ;B4D3BD
    %AICMD0x0D($FF, $00, $60, $02)                             ;B4D3C1
    %AICMD0x1B($030D, $01)                                     ;B4D3C6
    %AICMD0x13($001E)                                          ;B4D3CA
    %AICMD0x1B($0309, $00)                                     ;B4D3CD
    %AICMD0x13($005A)                                          ;B4D3D1
    %AICMD0x1B($0311, $00)                                     ;B4D3D4
    %AICMD0x13($0078)                                          ;B4D3D8
    %AICMD0x1B($030E, $00)                                     ;B4D3DB
    %AICMD0x0D($FF, $00, $60, $02)                             ;B4D3DF
    %AICMD0x37()                                               ;B4D3E4
    %AICMD0x10_End()                                           ;B4D3E5
    %AICMD0x1A($FFF8, $0068, $B384C8, $00)                     ;B4D3E6
    %AICMD0x0C($01)                                            ;B4D3EE
    %AICMD0x1B($030E, $01)                                     ;B4D3F0
    %AICMD0x0D($01, $00, $C0, $02)                             ;B4D3F4
    %AICMD0x1B($030F, $01)                                     ;B4D3F9
    %AICMD0x0B($02)                                            ;B4D3FD
    %AICMD0x0C($04)                                            ;B4D3FF
    %AICMD0x13($001E)                                          ;B4D401
    %AICMD0x1B($030E, $00)                                     ;B4D404
    %AICMD0x0D($FF, $00, $60, $02)                             ;B4D408
    %AICMD0x1B($030D, $00)                                     ;B4D40D
    %AICMD0x13($001E)                                          ;B4D411
    %AICMD0x1B($030D, $01)                                     ;B4D414
    %AICMD0x13($005A)                                          ;B4D418
    %AICMD0x1B($0311, $00)                                     ;B4D41B
    %AICMD0x13($0078)                                          ;B4D41F
    %AICMD0x1B($030E, $00)                                     ;B4D422
    %AICMD0x0D($FF, $00, $60, $02)                             ;B4D426
    %AICMD0x37()                                               ;B4D42B
    %AICMD0x10_End()                                           ;B4D42C
    %AICMD0x1A($004E, $0064, $B38A98, $00)                     ;B4D42D
    %AICMD0x13($001E)                                          ;B4D435
    %AICMD0x0D($FF, $00, $60, $02)                             ;B4D438
    %AICMD0x13($00F0)                                          ;B4D43D
    %AICMD0x0D($FF, $00, $60, $02)                             ;B4D440
    %AICMD0x37()                                               ;B4D445
    %AICMD0x10_End()                                           ;B4D446

pScripting_B4D447:
    dw DATA8_B4D467                                            ;B4D447|        |B4D467;
    dw pScripting_B4D531                                       ;B4D449|        |B4D531;
    dw pScripting_B4D531                                       ;B4D44B|        |B4D531;
    dw pScripting_B4D531                                       ;B4D44D|        |B4D531;
    dw pScripting_B4D531                                       ;B4D44F|        |B4D531;
    dw pScripting_B4D531                                       ;B4D451|        |B4D531;
    dw pScripting_B4D531                                       ;B4D453|        |B4D531;
    dw pScripting_B4D531                                       ;B4D455|        |B4D531;
    dw pScripting_B4D531                                       ;B4D457|        |B4D531;
    dw pScripting_B4D531                                       ;B4D459|        |B4D531;
    dw pScripting_B4D531                                       ;B4D45B|        |B4D531;
    dw pScripting_B4D531                                       ;B4D45D|        |B4D531;
    dw pScripting_B4D531                                       ;B4D45F|        |B4D531;
    dw pScripting_B4D531                                       ;B4D461|        |B4D531;
    dw pScripting_B4D531                                       ;B4D463|        |B4D531;
    dw pScripting_B4D531                                       ;B4D465|        |B4D531;
 
DATA8_B4D467:
 
    %AICMD0x00_SetMusic($10, $B4)                              ;B4D467
    %AICMD0x02_FreezeTime()                                    ;B4D46A
    %AICMD0x03_SetHour($06)                                    ;B4D46B
    %AICMD0x05_SetPosition($FFE8, $0078)                       ;B4D46D
    %AICMD0x07_SetPlayerDirection($02)                         ;B4D472
    %AICMD0x40()                                               ;B4D474
    %AICMD0x08()                                               ;B4D475
    %AICMD0x09($01, $B4D4A6)                                   ;B4D476
    %AICMD0x09($02, $B4D503)                                   ;B4D47A
    %AICMD0x06_SetDestination($43)                             ;B4D47E
    %AICMD0x38()                                               ;B4D480
    %AICMD0x0C($00)                                            ;B4D481
    %AICMD0x3A($02, $0028)                                     ;B4D483
    %AICMD0x13($001E)                                          ;B4D487
    %AICMD0x19($00BE, $00)                                     ;B4D48A
    %AICMD0x0B($01)                                            ;B4D48E
    %AICMD0x13($005A)                                          ;B4D490
    %AICMD0x0C($02)                                            ;B4D493
    %AICMD0x13($001E)                                          ;B4D495
    %AICMD0x39($02, $000C)                                     ;B4D498
    %AICMD0x19($0041, $00)                                     ;B4D49C
    %AICMD0x13($000A)                                          ;B4D4A0
    %AICMD0x3D($3D)                                            ;B4D4A3
    %AICMD0x10_End()                                           ;B4D4A5
    %AICMD0x1A($0078, $0078, $B38114, $03)                     ;B4D4A6
    %AICMD0x1B($01E7, $00)                                     ;B4D4AE
    %AICMD0x13($0078)                                          ;B4D4B2
    %AICMD0x1B($01F3, $00)                                     ;B4D4B5
    %AICMD0x13($0078)                                          ;B4D4B9
    %AICMD0x1B($01F6, $00)                                     ;B4D4BC
    %AICMD0x13($0078)                                          ;B4D4C0
    %AICMD0x1B($01EC, $01)                                     ;B4D4C3
    %AICMD0x0D($01, $00, $30, $01)                             ;B4D4C7
    %AICMD0x1B($01EE, $01)                                     ;B4D4CC
    %AICMD0x13($0078)                                          ;B4D4D0
    %AICMD0x1B($01EC, $00)                                     ;B4D4D3
    %AICMD0x0D($FF, $00, $30, $01)                             ;B4D4D7
    %AICMD0x1B($01EA, $00)                                     ;B4D4DC
    %AICMD0x13($001E)                                          ;B4D4E0
    %AICMD0x0B($00)                                            ;B4D4E3
    %AICMD0x0C($01)                                            ;B4D4E5
    %AICMD0x1B($01F8, $00)                                     ;B4D4E7
    %AICMD0x13($003C)                                          ;B4D4EB
    %AICMD0x0B($02)                                            ;B4D4EE
    %AICMD0x1B($01EC, $00)                                     ;B4D4F0
    %AICMD0x0D($FF, $00, $2A, $01)                             ;B4D4F4
    %AICMD0x1B($01ED, $00)                                     ;B4D4F9
    %AICMD0x13($0001)                                          ;B4D4FD
    %AICMD0x12_Jump($B4D4FD)                                   ;B4D500
    %AICMD0x1A($0068, $0068, $B3812C, $02)                     ;B4D503
    %AICMD0x1B($0203, $01)                                     ;B4D50B
    %AICMD0x13($0050)                                          ;B4D50F
    %AICMD0x1B($0200, $01)                                     ;B4D512
    %AICMD0x13($00B4)                                          ;B4D516
    %AICMD0x1B($0204, $01)                                     ;B4D519
    %AICMD0x13($003C)                                          ;B4D51D
    %AICMD0x1B($0205, $01)                                     ;B4D520
    %AICMD0x13($005A)                                          ;B4D524
    %AICMD0x1B($0200, $01)                                     ;B4D527
    %AICMD0x13($0078)                                          ;B4D52B
    %AICMD0x12_Jump($B4D50B)                                   ;B4D52E

pScripting_B4D531:
    dw DATA8_B4D551                                            ;B4D531|        |B4D551;
    dw pScripting_B4D772                                       ;B4D533|        |B4D772;
    dw pScripting_B4D772                                       ;B4D535|        |B4D772;
    dw pScripting_B4D772                                       ;B4D537|        |B4D772;
    dw pScripting_B4D772                                       ;B4D539|        |B4D772;
    dw pScripting_B4D772                                       ;B4D53B|        |B4D772;
    dw pScripting_B4D772                                       ;B4D53D|        |B4D772;
    dw pScripting_B4D772                                       ;B4D53F|        |B4D772;
    dw pScripting_B4D772                                       ;B4D541|        |B4D772;
    dw pScripting_B4D772                                       ;B4D543|        |B4D772;
    dw pScripting_B4D772                                       ;B4D545|        |B4D772;
    dw pScripting_B4D772                                       ;B4D547|        |B4D772;
    dw pScripting_B4D772                                       ;B4D549|        |B4D772;
    dw pScripting_B4D772                                       ;B4D54B|        |B4D772;
    dw pScripting_B4D772                                       ;B4D54D|        |B4D772;
    dw pScripting_B4D772                                       ;B4D54F|        |B4D772;
 
DATA8_B4D551:
 
    %AICMD0x00_SetMusic($10, $B4)                              ;B4D551
    %AICMD0x02_FreezeTime()                                    ;B4D554
    %AICMD0x03_SetHour($07)                                    ;B4D555
    %AICMD0x07_SetPlayerDirection($03)                         ;B4D557
    %AICMD0x05_SetPosition($0298, $0070)                       ;B4D559
    %AICMD0x08()                                               ;B4D55E
    %AICMD0x09($01, $B4D610)                                   ;B4D55F
    %AICMD0x09($02, $B4D61E)                                   ;B4D563
    %AICMD0x09($03, $B4D671)                                   ;B4D567
    %AICMD0x09($04, $B4D6C1)                                   ;B4D56B
    %AICMD0x06_SetDestination($11)                             ;B4D56F
    %AICMD0x38()                                               ;B4D571
    %AICMD0x13($003C)                                          ;B4D572
    %AICMD0x39($03, $0050)                                     ;B4D575
    %AICMD0x13($0014)                                          ;B4D579
    %AICMD0x39($01, $0010)                                     ;B4D57C
    %AICMD0x07_SetPlayerDirection($03)                         ;B4D580
    %AICMD0x13($001E)                                          ;B4D582
    %AICMD0x19($005F, $00)                                     ;B4D585
    %AICMD0x13($003C)                                          ;B4D589
    %AICMD0x19($0003, $00)                                     ;B4D58C
    %AICMD0x13($0001)                                          ;B4D590
    %AICMD0x19($005F, $00)                                     ;B4D593
    %AICMD0x13($003C)                                          ;B4D597
    %AICMD0x19($0003, $00)                                     ;B4D59A
    %AICMD0x13($0001)                                          ;B4D59E
    %AICMD0x19($005F, $00)                                     ;B4D5A1
    %AICMD0x13($003C)                                          ;B4D5A5
    %AICMD0x19($0003, $00)                                     ;B4D5A8
    %AICMD0x13($0001)                                          ;B4D5AC
    %AICMD0x19($005F, $00)                                     ;B4D5AF
    %AICMD0x13($003C)                                          ;B4D5B3
    %AICMD0x19($004A, $00)                                     ;B4D5B6
    %AICMD0x13($0078)                                          ;B4D5BA
    %AICMD0x07_SetPlayerDirection($03)                         ;B4D5BD
    %AICMD0x0B($00)                                            ;B4D5BF
    %AICMD0x13($003C)                                          ;B4D5C1
    %AICMD0x07_SetPlayerDirection($00)                         ;B4D5C4
    %AICMD0x13($0078)                                          ;B4D5C6
    %AICMD0x39($00, $000C)                                     ;B4D5C9
    %AICMD0x0B($03)                                            ;B4D5CD
    %AICMD0x19($0010, $00)                                     ;B4D5CF
    %AICMD0x13($000E)                                          ;B4D5D3
    %AICMD0x19($0014, $00)                                     ;B4D5D6
    %AICMD0x13($003C)                                          ;B4D5DA
    %AICMD0x19($003B, $00)                                     ;B4D5DD
    %AICMD0x13($003C)                                          ;B4D5E1
    %AICMD0x0B($01)                                            ;B4D5E4
    %AICMD0x13($0078)                                          ;B4D5E6
    %AICMD0x07_SetPlayerDirection($01)                         ;B4D5E9
    %AICMD0x13($012C)                                          ;B4D5EB
    %AICMD0x07_SetPlayerDirection($02)                         ;B4D5EE
    %AICMD0x13($0078)                                          ;B4D5F0
    %AICMD0x07_SetPlayerDirection($00)                         ;B4D5F3
    %AICMD0x13($005A)                                          ;B4D5F5
    %AICMD0x19($003C, $00)                                     ;B4D5F8
    %AICMD0x13($0078)                                          ;B4D5FC
    %AICMD0x19($0000, $00)                                     ;B4D5FF
    %AICMD0x13($0001)                                          ;B4D603
    %AICMD0x19($003C, $00)                                     ;B4D606
    %AICMD0x13($0078)                                          ;B4D60A
    %AICMD0x3D($3D)                                            ;B4D60D
    %AICMD0x10_End()                                           ;B4D60F
    %AICMD0x1A($02B8, $00CB, $B38540, $00)                     ;B4D610
    %AICMD0x13($0001)                                          ;B4D618
    %AICMD0x12_Jump($B4D618)                                   ;B4D61B
    %AICMD0x1A($0210, $0088, $B38798, $00)                     ;B4D61E
    %AICMD0x0C($00)                                            ;B4D626
    %AICMD0x1B($0303, $01)                                     ;B4D628
    %AICMD0x0D($01, $00, $38, $01)                             ;B4D62C
    %AICMD0x1B($0302, $01)                                     ;B4D631
    %AICMD0x13($003C)                                          ;B4D635
    %AICMD0x09($05, $B4D657)                                   ;B4D638
    %AICMD0x1B($0303, $00)                                     ;B4D63C
    %AICMD0x0D($FF, $00, $10, $01)                             ;B4D640
    %AICMD0x1B($0302, $01)                                     ;B4D645
    %AICMD0x13($0078)                                          ;B4D649
    %AICMD0x1B($0303, $00)                                     ;B4D64C
    %AICMD0x0D($FF, $00, $40, $01)                             ;B4D650
    %AICMD0x37()                                               ;B4D655
    %AICMD0x10_End()                                           ;B4D656
    %AICMD0x1A($0258, $0088, $B38720, $00)                     ;B4D657
    %AICMD0x13($001E)                                          ;B4D65F
    %AICMD0x0C($03)                                            ;B4D662
    %AICMD0x13($000A)                                          ;B4D664
    %AICMD0x0D($00, $F0, $02, $01)                             ;B4D667
    %AICMD0x13($003C)                                          ;B4D66C
    %AICMD0x37()                                               ;B4D66F
    %AICMD0x10_End()                                           ;B4D670
    %AICMD0x1A($0208, $0054, $B387B0, $00)                     ;B4D671
    %AICMD0x0C($01)                                            ;B4D679
    %AICMD0x13($005A)                                          ;B4D67B
    %AICMD0x1B($0307, $01)                                     ;B4D67E
    %AICMD0x13($003C)                                          ;B4D682
    %AICMD0x0D($01, $00, $40, $01)                             ;B4D685
    %AICMD0x1B($0306, $00)                                     ;B4D68A
    %AICMD0x13($003C)                                          ;B4D68E
    %AICMD0x1B($0307, $01)                                     ;B4D691
    %AICMD0x0D($02, $00, $20, $03)                             ;B4D695
    %AICMD0x1B($0306, $00)                                     ;B4D69A
    %AICMD0x13($003C)                                          ;B4D69E
    %AICMD0x1B($0307, $01)                                     ;B4D6A1
    %AICMD0x0D($02, $00, $28, $03)                             ;B4D6A5
    %AICMD0x1B($0306, $00)                                     ;B4D6AA
    %AICMD0x13($003C)                                          ;B4D6AE
    %AICMD0x0B($02)                                            ;B4D6B1
    %AICMD0x09($06, $B4D6EF)                                   ;B4D6B3
    %AICMD0x09($07, $B4D71D)                                   ;B4D6B7
    %AICMD0x13($0001)                                          ;B4D6BB
    %AICMD0x12_Jump($B4D6BB)                                   ;B4D6BE
    %AICMD0x1A($0320, $0078, $B387A4, $00)                     ;B4D6C1
    %AICMD0x0C($02)                                            ;B4D6C9
    %AICMD0x1B($0305, $00)                                     ;B4D6CB
    %AICMD0x0D($FF, $00, $70, $01)                             ;B4D6CF
    %AICMD0x1B($0304, $00)                                     ;B4D6D4
    %AICMD0x09($08, $B4D752)                                   ;B4D6D8
    %AICMD0x1B($0305, $00)                                     ;B4D6DC
    %AICMD0x0D($FF, $00, $20, $01)                             ;B4D6E0
    %AICMD0x1B($0304, $00)                                     ;B4D6E5
    %AICMD0x13($0001)                                          ;B4D6E9
    %AICMD0x12_Jump($B4D6E9)                                   ;B4D6EC
    %AICMD0x1A($01C8, $0024, $B38570, $02)                     ;B4D6EF
    %AICMD0x1B($0329, $01)                                     ;B4D6F7
    %AICMD0x13($003C)                                          ;B4D6FB
    %AICMD0x0D($01, $01, $28, $01)                             ;B4D6FE
    %AICMD0x13($000A)                                          ;B4D703
    %AICMD0x0D($02, $01, $40, $02)                             ;B4D706
    %AICMD0x13($000A)                                          ;B4D70B
    %AICMD0x0D($01, $00, $10, $01)                             ;B4D70E
    %AICMD0x1B($0328, $01)                                     ;B4D713
    %AICMD0x13($0001)                                          ;B4D717
    %AICMD0x12_Jump($B4D717)                                   ;B4D71A
    %AICMD0x1A($02C8, $0058, $B38570, $03)                     ;B4D71D
    %AICMD0x1B($0329, $00)                                     ;B4D725
    %AICMD0x0D($FF, $01, $20, $01)                             ;B4D729
    %AICMD0x13($001E)                                          ;B4D72E
    %AICMD0x0D($FE, $01, $20, $01)                             ;B4D731
    %AICMD0x13($000A)                                          ;B4D736
    %AICMD0x0D($FF, $00, $20, $01)                             ;B4D739
    %AICMD0x13($001E)                                          ;B4D73E
    %AICMD0x1B($0329, $00)                                     ;B4D741
    %AICMD0x13($000A)                                          ;B4D745
    %AICMD0x1B($0327, $00)                                     ;B4D748
    %AICMD0x13($0001)                                          ;B4D74C
    %AICMD0x12_Jump($B4D74C)                                   ;B4D74F
    %AICMD0x1A($0218, $00F8, $B38570, $01)                     ;B4D752
    %AICMD0x1B($0329, $01)                                     ;B4D75A
    %AICMD0x0D($01, $FF, $40, $01)                             ;B4D75E
    %AICMD0x0D($00, $FF, $10, $01)                             ;B4D763
    %AICMD0x1B($0328, $01)                                     ;B4D768
    %AICMD0x13($0001)                                          ;B4D76C
    %AICMD0x12_Jump($B4D76C)                                   ;B4D76F

pScripting_B4D772:
    dw DATA8_B4D792                                            ;B4D772|        |B4D792;
    dw DATA8_B4D863                                            ;B4D774|        |B4D863;
    dw pScripting_B4DA22                                       ;B4D776|        |B4DA22;
    dw pScripting_B4DA22                                       ;B4D778|        |B4DA22;
    dw pScripting_B4DA22                                       ;B4D77A|        |B4DA22;
    dw pScripting_B4DA22                                       ;B4D77C|        |B4DA22;
    dw pScripting_B4DA22                                       ;B4D77E|        |B4DA22;
    dw pScripting_B4DA22                                       ;B4D780|        |B4DA22;
    dw pScripting_B4DA22                                       ;B4D782|        |B4DA22;
    dw pScripting_B4DA22                                       ;B4D784|        |B4DA22;
    dw pScripting_B4DA22                                       ;B4D786|        |B4DA22;
    dw pScripting_B4DA22                                       ;B4D788|        |B4DA22;
    dw pScripting_B4DA22                                       ;B4D78A|        |B4DA22;
    dw pScripting_B4DA22                                       ;B4D78C|        |B4DA22;
    dw pScripting_B4DA22                                       ;B4D78E|        |B4DA22;
    dw pScripting_B4DA22                                       ;B4D790|        |B4DA22;
 
DATA8_B4D792:
 
    %AICMD0x00_SetMusic($10, $B4)                              ;B4D792
    %AICMD0x02_FreezeTime()                                    ;B4D795
    %AICMD0x03_SetHour($06)                                    ;B4D796
    %AICMD0x05_SetPosition($0118, $0178)                       ;B4D798
    %AICMD0x07_SetPlayerDirection($03)                         ;B4D79D
    %AICMD0x40()                                               ;B4D79F
    %AICMD0x08()                                               ;B4D7A0
    %AICMD0x09($01, $B4D844)                                   ;B4D7A1
    %AICMD0x09($02, $B4D7FD)                                   ;B4D7A5
    %AICMD0x06_SetDestination($01)                             ;B4D7A9
    %AICMD0x38()                                               ;B4D7AB
    %AICMD0x39($03, $0070)                                     ;B4D7AC
    %AICMD0x13($003C)                                          ;B4D7B0
    %AICMD0x0B($00)                                            ;B4D7B3
    %AICMD0x13($003C)                                          ;B4D7B5
    %AICMD0x39($03, $0010)                                     ;B4D7B8
    %AICMD0x13($0078)                                          ;B4D7BC
    %AICMD0x19($0023, $00)                                     ;B4D7BF
    %AICMD0x13($003C)                                          ;B4D7C3
    %AICMD0x19($0003, $00)                                     ;B4D7C6
    %AICMD0x13($000A)                                          ;B4D7CA
    %AICMD0x19($0023, $00)                                     ;B4D7CD
    %AICMD0x13($003C)                                          ;B4D7D1
    %AICMD0x0C($01)                                            ;B4D7D4
    %AICMD0x39($00, $0010)                                     ;B4D7D6
    %AICMD0x13($000A)                                          ;B4D7DA
    %AICMD0x39($03, $0018)                                     ;B4D7DD
    %AICMD0x13($000A)                                          ;B4D7E1
    %AICMD0x39($00, $0020)                                     ;B4D7E4
    %AICMD0x07_SetPlayerDirection($01)                         ;B4D7E8
    %AICMD0x13($0028)                                          ;B4D7EA
    %AICMD0x0B($02)                                            ;B4D7ED
    %AICMD0x39($00, $0010)                                     ;B4D7EF
    %AICMD0x13($0014)                                          ;B4D7F3
    %AICMD0x39($03, $0030)                                     ;B4D7F6
    %AICMD0x3D($3D)                                            ;B4D7FA
    %AICMD0x10_End()                                           ;B4D7FC
    %AICMD0x1A($0088, $0158, $B3845C, $00)                     ;B4D7FD
    %AICMD0x0C($00)                                            ;B4D805
    %AICMD0x1B($02E3, $00)                                     ;B4D807
    %AICMD0x0D($00, $01, $20, $01)                             ;B4D80B
    %AICMD0x1B($02E6, $01)                                     ;B4D810
    %AICMD0x13($005A)                                          ;B4D814
    %AICMD0x1B($0233, $01)                                     ;B4D817
    %AICMD0x13($0078)                                          ;B4D81B
    %AICMD0x1B($02E9, $00)                                     ;B4D81E
    %AICMD0x13($0078)                                          ;B4D822
    %AICMD0x0B($01)                                            ;B4D825
    %AICMD0x0C($02)                                            ;B4D827
    %AICMD0x1B($02E3, $00)                                     ;B4D829
    %AICMD0x0D($00, $01, $30, $01)                             ;B4D82D
    %AICMD0x13($000A)                                          ;B4D832
    %AICMD0x1B($02E7, $00)                                     ;B4D835
    %AICMD0x0D($FF, $00, $30, $01)                             ;B4D839
    %AICMD0x13($0001)                                          ;B4D83E
    %AICMD0x12_Jump($B4D83E)                                   ;B4D841
    %AICMD0x1A($0088, $0068, $B38114, $02)                     ;B4D844
    %AICMD0x13($0078)                                          ;B4D84C
    %AICMD0x1B($01EA, $01)                                     ;B4D84F
    %AICMD0x13($00A0)                                          ;B4D853
    %AICMD0x1B($01F6, $01)                                     ;B4D856
    %AICMD0x12_Jump($B4D85D)                                   ;B4D85A
    %AICMD0x13($0001)                                          ;B4D85D
    %AICMD0x12_Jump($B4D85D)                                   ;B4D860

DATA8_B4D863:
 
    %AICMD0x00_SetMusic($10, $B4)                              ;B4D863
    %AICMD0x02_FreezeTime()                                    ;B4D866
    %AICMD0x03_SetHour($07)                                    ;B4D867
    %AICMD0x05_SetPosition($02E8, $01A8)                       ;B4D869
    %AICMD0x07_SetPlayerDirection($03)                         ;B4D86E
    %AICMD0x08()                                               ;B4D870
    %AICMD0x09($01, $B4D95C)                                   ;B4D871
    %AICMD0x09($02, $B4D8E0)                                   ;B4D875
    %AICMD0x09($03, $B4D998)                                   ;B4D879
    %AICMD0x09($04, $B4D9BD)                                   ;B4D87D
    %AICMD0x09($05, $B4D973)                                   ;B4D881
    %AICMD0x09($06, $B4D981)                                   ;B4D885
    %AICMD0x09($07, $B4D9D9)                                   ;B4D889
    %AICMD0x09($08, $B4D9F9)                                   ;B4D88D
    %AICMD0x06_SetDestination($05)                             ;B4D891
    %AICMD0x38()                                               ;B4D893
    %AICMD0x13($005A)                                          ;B4D894
    %AICMD0x39($03, $0038)                                     ;B4D897
    %AICMD0x13($0014)                                          ;B4D89B
    %AICMD0x39($01, $0088)                                     ;B4D89E
    %AICMD0x13($0014)                                          ;B4D8A2
    %AICMD0x39($03, $00A8)                                     ;B4D8A5
    %AICMD0x13($0014)                                          ;B4D8A9
    %AICMD0x39($03, $00A0)                                     ;B4D8AC
    %AICMD0x13($0014)                                          ;B4D8B0
    %AICMD0x39($01, $0060)                                     ;B4D8B3
    %AICMD0x13($0078)                                          ;B4D8B7
    %AICMD0x39($00, $0060)                                     ;B4D8BA
    %AICMD0x13($003C)                                          ;B4D8BE
    %AICMD0x39($03, $00D2)                                     ;B4D8C1
    %AICMD0x07_SetPlayerDirection($02)                         ;B4D8C5
    %AICMD0x13($003C)                                          ;B4D8C7
    %AICMD0x39($01, $0060)                                     ;B4D8CA
    %AICMD0x0B($00)                                            ;B4D8CE
    %AICMD0x13($0078)                                          ;B4D8D0
    %AICMD0x07_SetPlayerDirection($03)                         ;B4D8D3
    %AICMD0x13($003C)                                          ;B4D8D5
    %AICMD0x07_SetPlayerDirection($02)                         ;B4D8D8
    %AICMD0x13($0078)                                          ;B4D8DA
    %AICMD0x3D($3D)                                            ;B4D8DD
    %AICMD0x10_End()                                           ;B4D8DF
    %AICMD0x1A($02F8, $01A8, $B3845C, $03)                     ;B4D8E0
    %AICMD0x13($005A)                                          ;B4D8E8
    %AICMD0x1B($02E7, $00)                                     ;B4D8EB
    %AICMD0x0D($FF, $00, $38, $01)                             ;B4D8EF
    %AICMD0x13($001E)                                          ;B4D8F4
    %AICMD0x1B($02E5, $00)                                     ;B4D8F7
    %AICMD0x0D($00, $FF, $88, $01)                             ;B4D8FB
    %AICMD0x13($0014)                                          ;B4D900
    %AICMD0x1B($02E7, $00)                                     ;B4D903
    %AICMD0x0D($FF, $00, $A8, $01)                             ;B4D907
    %AICMD0x13($0014)                                          ;B4D90C
    %AICMD0x1B($02E7, $00)                                     ;B4D90F
    %AICMD0x0D($FF, $00, $A0, $01)                             ;B4D913
    %AICMD0x13($0014)                                          ;B4D918
    %AICMD0x1B($02E5, $00)                                     ;B4D91B
    %AICMD0x0D($00, $FF, $70, $01)                             ;B4D91F
    %AICMD0x0B($02)                                            ;B4D924
    %AICMD0x13($0078)                                          ;B4D926
    %AICMD0x1B($02E3, $00)                                     ;B4D929
    %AICMD0x0D($00, $01, $70, $01)                             ;B4D92D
    %AICMD0x13($0014)                                          ;B4D932
    %AICMD0x1B($02E7, $00)                                     ;B4D935
    %AICMD0x0D($FF, $00, $D4, $01)                             ;B4D939
    %AICMD0x13($003C)                                          ;B4D93E
    %AICMD0x1B($02E5, $00)                                     ;B4D941
    %AICMD0x0D($00, $FF, $60, $01)                             ;B4D945
    %AICMD0x0B($01)                                            ;B4D94A
    %AICMD0x13($0078)                                          ;B4D94C
    %AICMD0x1B($02E6, $01)                                     ;B4D94F
    %AICMD0x13($003C)                                          ;B4D953
    %AICMD0x13($0001)                                          ;B4D956
    %AICMD0x12_Jump($B4D956)                                   ;B4D959
    %AICMD0x1A($0178, $00A8, $B38354, $00)                     ;B4D95C
    %AICMD0x0C($02)                                            ;B4D964
    %AICMD0x1B($02A6, $00)                                     ;B4D966
    %AICMD0x13($0078)                                          ;B4D96A
    %AICMD0x13($0001)                                          ;B4D96D
    %AICMD0x12_Jump($B4D96D)                                   ;B4D970
    %AICMD0x1A($0158, $00C8, $B3842C, $00)                     ;B4D973
    %AICMD0x13($0001)                                          ;B4D97B
    %AICMD0x12_Jump($B4D97B)                                   ;B4D97E
    %AICMD0x1A($0168, $00B8, $B38384, $00)                     ;B4D981
    %AICMD0x0C($02)                                            ;B4D989
    %AICMD0x1B($02B6, $01)                                     ;B4D98B
    %AICMD0x13($0078)                                          ;B4D98F
    %AICMD0x13($0001)                                          ;B4D992
    %AICMD0x12_Jump($B4D992)                                   ;B4D995
    %AICMD0x1A($0088, $00B8, $B3830C, $03)                     ;B4D998
    %AICMD0x0C($00)                                            ;B4D9A0
    %AICMD0x1B($0293, $01)                                     ;B4D9A2
    %AICMD0x13($003C)                                          ;B4D9A6
    %AICMD0x1B($028F, $00)                                     ;B4D9A9
    %AICMD0x13($003C)                                          ;B4D9AD
    %AICMD0x1B($0295, $00)                                     ;B4D9B0
    %AICMD0x13($0078)                                          ;B4D9B4
    %AICMD0x13($0001)                                          ;B4D9B7
    %AICMD0x12_Jump($B4D9B7)                                   ;B4D9BA
    %AICMD0x1A($0098, $00A8, $B383E4, $02)                     ;B4D9BD
    %AICMD0x13($0078)                                          ;B4D9C5
    %AICMD0x1B($02C4, $00)                                     ;B4D9C8
    %AICMD0x13($003C)                                          ;B4D9CC
    %AICMD0x1B($02C5, $00)                                     ;B4D9CF
    %AICMD0x13($0001)                                          ;B4D9D3
    %AICMD0x12_Jump($B4D9D3)                                   ;B4D9D6
    %AICMD0x1A($0078, $00B8, $B38438, $02)                     ;B4D9D9
    %AICMD0x0C($00)                                            ;B4D9E1
    %AICMD0x1B($02DA, $00)                                     ;B4D9E3
    %AICMD0x0D($00, $01, $10, $01)                             ;B4D9E7
    %AICMD0x1B($02DD, $01)                                     ;B4D9EC
    %AICMD0x13($0078)                                          ;B4D9F0
    %AICMD0x13($0001)                                          ;B4D9F3
    %AICMD0x12_Jump($B4D9F3)                                   ;B4D9F6
    %AICMD0x1A($00A8, $00A8, $B38450, $03)                     ;B4D9F9
    %AICMD0x0C($00)                                            ;B4DA01
    %AICMD0x1B($02E1, $01)                                     ;B4DA03
    %AICMD0x0D($01, $00, $10, $01)                             ;B4DA07
    %AICMD0x1B($02DF, $00)                                     ;B4DA0C
    %AICMD0x0D($00, $01, $10, $01)                             ;B4DA10
    %AICMD0x1B($02E1, $00)                                     ;B4DA15
    %AICMD0x13($0078)                                          ;B4DA19
    %AICMD0x13($0001)                                          ;B4DA1C
    %AICMD0x12_Jump($B4DA1C)                                   ;B4DA1F

pScripting_B4DA22:
    dw DATA8_B4DA42                                            ;B4DA22|        |B4DA42;
    dw DATA8_B4DB0A                                            ;B4DA24|        |B4DB0A;
    dw pScripting_B4DCCD                                       ;B4DA26|        |B4DCCD;
    dw pScripting_B4DCCD                                       ;B4DA28|        |B4DCCD;
    dw pScripting_B4DCCD                                       ;B4DA2A|        |B4DCCD;
    dw pScripting_B4DCCD                                       ;B4DA2C|        |B4DCCD;
    dw pScripting_B4DCCD                                       ;B4DA2E|        |B4DCCD;
    dw pScripting_B4DCCD                                       ;B4DA30|        |B4DCCD;
    dw pScripting_B4DCCD                                       ;B4DA32|        |B4DCCD;
    dw pScripting_B4DCCD                                       ;B4DA34|        |B4DCCD;
    dw pScripting_B4DCCD                                       ;B4DA36|        |B4DCCD;
    dw pScripting_B4DCCD                                       ;B4DA38|        |B4DCCD;
    dw pScripting_B4DCCD                                       ;B4DA3A|        |B4DCCD;
    dw pScripting_B4DCCD                                       ;B4DA3C|        |B4DCCD;
    dw pScripting_B4DCCD                                       ;B4DA3E|        |B4DCCD;
    dw pScripting_B4DCCD                                       ;B4DA40|        |B4DCCD;
 
DATA8_B4DA42:
 
    %AICMD0x00_SetMusic($10, $B4)                              ;B4DA42
    %AICMD0x02_FreezeTime()                                    ;B4DA45
    %AICMD0x03_SetHour($07)                                    ;B4DA46
    %AICMD0x05_SetPosition($0088, $01C8)                       ;B4DA48
    %AICMD0x07_SetPlayerDirection($01)                         ;B4DA4D
    %AICMD0x08()                                               ;B4DA4F
    %AICMD0x09($01, $B4DA90)                                   ;B4DA50
    %AICMD0x06_SetDestination($22)                             ;B4DA54
    %AICMD0x38()                                               ;B4DA56
    %AICMD0x13($003C)                                          ;B4DA57
    %AICMD0x39($01, $0040)                                     ;B4DA5A
    %AICMD0x13($003C)                                          ;B4DA5E
    %AICMD0x07_SetPlayerDirection($00)                         ;B4DA61
    %AICMD0x0B($00)                                            ;B4DA63
    %AICMD0x13($0060)                                          ;B4DA65
    %AICMD0x07_SetPlayerDirection($02)                         ;B4DA68
    %AICMD0x13($001E)                                          ;B4DA6A
    %AICMD0x07_SetPlayerDirection($03)                         ;B4DA6D
    %AICMD0x13($001E)                                          ;B4DA6F
    %AICMD0x39($01, $0020)                                     ;B4DA72
    %AICMD0x13($003C)                                          ;B4DA76
    %AICMD0x39($03, $0040)                                     ;B4DA79
    %AICMD0x13($003C)                                          ;B4DA7D
    %AICMD0x39($00, $0010)                                     ;B4DA80
    %AICMD0x13($001E)                                          ;B4DA84
    %AICMD0x39($02, $0060)                                     ;B4DA87
    %AICMD0x0C($01)                                            ;B4DA8B
    %AICMD0x3D($3D)                                            ;B4DA8D
    %AICMD0x10_End()                                           ;B4DA8F
    %AICMD0x1A($0098, $01E8, $B3845C, $00)                     ;B4DA90
    %AICMD0x0C($00)                                            ;B4DA98
    %AICMD0x1B($02E5, $00)                                     ;B4DA9A
    %AICMD0x0D($00, $FF, $60, $01)                             ;B4DA9E
    %AICMD0x1B($02E7, $00)                                     ;B4DAA3
    %AICMD0x13($001E)                                          ;B4DAA7
    %AICMD0x1B($02E7, $01)                                     ;B4DAAA
    %AICMD0x13($001E)                                          ;B4DAAE
    %AICMD0x1B($02E5, $00)                                     ;B4DAB1
    %AICMD0x0D($00, $FF, $20, $01)                             ;B4DAB5
    %AICMD0x1B($02E7, $00)                                     ;B4DABA
    %AICMD0x13($0050)                                          ;B4DABE
    %AICMD0x1B($02E7, $01)                                     ;B4DAC1
    %AICMD0x0D($01, $00, $30, $01)                             ;B4DAC5
    %AICMD0x13($001E)                                          ;B4DACA
    %AICMD0x09($02, $B4DAFC)                                   ;B4DACD
    %AICMD0x13($001E)                                          ;B4DAD1
    %AICMD0x1B($0233, $01)                                     ;B4DAD4
    %AICMD0x13($003C)                                          ;B4DAD8
    %AICMD0x1B($02E3, $00)                                     ;B4DADB
    %AICMD0x0D($00, $01, $10, $01)                             ;B4DADF
    %AICMD0x1B($02E7, $00)                                     ;B4DAE4
    %AICMD0x0D($FF, $00, $10, $01)                             ;B4DAE8
    %AICMD0x1B($0233, $00)                                     ;B4DAED
    %AICMD0x13($0078)                                          ;B4DAF1
    %AICMD0x0B($01)                                            ;B4DAF4
    %AICMD0x13($0001)                                          ;B4DAF6
    %AICMD0x12_Jump($B4DAF6)                                   ;B4DAF9
    %AICMD0x1A($00D8, $0168, $B38B1C, $00)                     ;B4DAFC
    %AICMD0x13($0001)                                          ;B4DB04
    %AICMD0x12_Jump($B4DB04)                                   ;B4DB07

DATA8_B4DB0A:
 
    %AICMD0x00_SetMusic($10, $B4)                              ;B4DB0A
    %AICMD0x02_FreezeTime()                                    ;B4DB0D
    %AICMD0x03_SetHour($07)                                    ;B4DB0E
    %AICMD0x05_SetPosition($0128, $0368)                       ;B4DB10
    %AICMD0x07_SetPlayerDirection($00)                         ;B4DB15
    %AICMD0x08()                                               ;B4DB17
    %AICMD0x09($01, $B4DB86)                                   ;B4DB18
    %AICMD0x09($02, $B4DC50)                                   ;B4DB1C
    %AICMD0x09($03, $B4DC1E)                                   ;B4DB20
    %AICMD0x09($04, $B4DC37)                                   ;B4DB24
    %AICMD0x09($05, $B4DC69)                                   ;B4DB28
    %AICMD0x06_SetDestination($05)                             ;B4DB2C
    %AICMD0x38()                                               ;B4DB2E
    %AICMD0x13($005A)                                          ;B4DB2F
    %AICMD0x39($02, $0020)                                     ;B4DB32
    %AICMD0x13($0014)                                          ;B4DB36
    %AICMD0x39($01, $0090)                                     ;B4DB39
    %AICMD0x13($0014)                                          ;B4DB3D
    %AICMD0x39($03, $0020)                                     ;B4DB40
    %AICMD0x13($0014)                                          ;B4DB44
    %AICMD0x39($01, $00A0)                                     ;B4DB47
    %AICMD0x0B($00)                                            ;B4DB4B
    %AICMD0x0C($01)                                            ;B4DB4D
    %AICMD0x07_SetPlayerDirection($02)                         ;B4DB4F
    %AICMD0x13($003C)                                          ;B4DB51
    %AICMD0x39($01, $0010)                                     ;B4DB54
    %AICMD0x39($02, $0050)                                     ;B4DB58
    %AICMD0x39($01, $00F0)                                     ;B4DB5C
    %AICMD0x13($003C)                                          ;B4DB60
    %AICMD0x39($01, $0070)                                     ;B4DB63
    %AICMD0x07_SetPlayerDirection($03)                         ;B4DB67
    %AICMD0x13($0078)                                          ;B4DB69
    %AICMD0x07_SetPlayerDirection($01)                         ;B4DB6C
    %AICMD0x19($0021, $00)                                     ;B4DB6E
    %AICMD0x13($0050)                                          ;B4DB72
    %AICMD0x19($0001, $00)                                     ;B4DB75
    %AICMD0x13($000A)                                          ;B4DB79
    %AICMD0x19($0021, $00)                                     ;B4DB7C
    %AICMD0x13($00B4)                                          ;B4DB80
    %AICMD0x3D($3D)                                            ;B4DB83
    %AICMD0x10_End()                                           ;B4DB85
    %AICMD0x1A($0118, $0368, $B3845C, $00)                     ;B4DB86
    %AICMD0x13($0078)                                          ;B4DB8E
    %AICMD0x1B($02E7, $01)                                     ;B4DB91
    %AICMD0x0D($01, $00, $20, $01)                             ;B4DB95
    %AICMD0x13($0014)                                          ;B4DB9A
    %AICMD0x1B($02E7, $01)                                     ;B4DB9D
    %AICMD0x0D($01, $00, $10, $01)                             ;B4DBA1
    %AICMD0x13($0014)                                          ;B4DBA6
    %AICMD0x1B($02E5, $00)                                     ;B4DBA9
    %AICMD0x0D($00, $FF, $90, $01)                             ;B4DBAD
    %AICMD0x13($0014)                                          ;B4DBB2
    %AICMD0x1B($02E7, $00)                                     ;B4DBB5
    %AICMD0x0D($FF, $00, $10, $01)                             ;B4DBB9
    %AICMD0x13($0014)                                          ;B4DBBE
    %AICMD0x1B($02E5, $00)                                     ;B4DBC1
    %AICMD0x0D($00, $FF, $A0, $01)                             ;B4DBC5
    %AICMD0x0C($01)                                            ;B4DBCA
    %AICMD0x1B($02E6, $00)                                     ;B4DBCC
    %AICMD0x13($003C)                                          ;B4DBD0
    %AICMD0x1B($02E5, $00)                                     ;B4DBD3
    %AICMD0x13($003C)                                          ;B4DBD7
    %AICMD0x1B($02E7, $01)                                     ;B4DBDA
    %AICMD0x0D($01, $00, $30, $01)                             ;B4DBDE
    %AICMD0x1B($02E5, $00)                                     ;B4DBE3
    %AICMD0x0D($00, $FF, $FF, $01)                             ;B4DBE7
    %AICMD0x13($003C)                                          ;B4DBEC
    %AICMD0x1B($02E5, $00)                                     ;B4DBEF
    %AICMD0x0D($00, $FF, $78, $01)                             ;B4DBF3
    %AICMD0x1B($02E6, $01)                                     ;B4DBF8
    %AICMD0x13($0078)                                          ;B4DBFC
    %AICMD0x1B($02E7, $00)                                     ;B4DBFF
    %AICMD0x0D($FF, $00, $10, $01)                             ;B4DC03
    %AICMD0x1B($02E5, $00)                                     ;B4DC08
    %AICMD0x0D($00, $FF, $18, $01)                             ;B4DC0C
    %AICMD0x1B($0233, $01)                                     ;B4DC11
    %AICMD0x13($00B4)                                          ;B4DC15
    %AICMD0x13($0001)                                          ;B4DC18
    %AICMD0x12_Jump($B4DC18)                                   ;B4DC1B
    %AICMD0x1A($0168, $00A8, $B38318, $00)                     ;B4DC1E
    %AICMD0x1B($029A, $01)                                     ;B4DC26
    %AICMD0x13($003C)                                          ;B4DC2A
    %AICMD0x1B($029C, $00)                                     ;B4DC2D
    %AICMD0x13($00B4)                                          ;B4DC31
    %AICMD0x12_Jump($B4DC26)                                   ;B4DC34
    %AICMD0x1A($0178, $00A8, $B383FC, $00)                     ;B4DC37
    %AICMD0x1B($02D0, $00)                                     ;B4DC3F
    %AICMD0x13($003C)                                          ;B4DC43
    %AICMD0x1B($02CC, $00)                                     ;B4DC46
    %AICMD0x13($00B4)                                          ;B4DC4A
    %AICMD0x12_Jump($B4DC3F)                                   ;B4DC4D
    %AICMD0x1A($0148, $00B8, $B38354, $02)                     ;B4DC50
    %AICMD0x1B($02A5, $00)                                     ;B4DC58
    %AICMD0x13($0078)                                          ;B4DC5C
    %AICMD0x1B($02A6, $00)                                     ;B4DC5F
    %AICMD0x13($0078)                                          ;B4DC63
    %AICMD0x12_Jump($B4DC58)                                   ;B4DC66
    %AICMD0x1A($01B8, $0218, $B381D4, $03)                     ;B4DC69
    %AICMD0x0C($00)                                            ;B4DC71
    %AICMD0x0D($FF, $00, $80, $01)                             ;B4DC73
    %AICMD0x1B($024C, $00)                                     ;B4DC78
    %AICMD0x0D($00, $01, $08, $01)                             ;B4DC7C
    %AICMD0x1B($0351, $00)                                     ;B4DC81
    %AICMD0x13($0078)                                          ;B4DC85
    %AICMD0x1B($024E, $00)                                     ;B4DC88
    %AICMD0x0D($00, $FF, $18, $01)                             ;B4DC8C
    %AICMD0x1B($0250, $01)                                     ;B4DC91
    %AICMD0x0D($01, $00, $30, $01)                             ;B4DC95
    %AICMD0x1B($024E, $00)                                     ;B4DC9A
    %AICMD0x0D($00, $FF, $50, $01)                             ;B4DC9E
    %AICMD0x0B($01)                                            ;B4DCA3
    %AICMD0x1B($024E, $00)                                     ;B4DCA5
    %AICMD0x0D($00, $FF, $B4, $01)                             ;B4DCA9
    %AICMD0x1B($0250, $01)                                     ;B4DCAE
    %AICMD0x0D($01, $00, $20, $01)                             ;B4DCB2
    %AICMD0x1B($024E, $00)                                     ;B4DCB7
    %AICMD0x0D($00, $FF, $50, $01)                             ;B4DCBB
    %AICMD0x1B($0250, $00)                                     ;B4DCC0
    %AICMD0x13($00B4)                                          ;B4DCC4
    %AICMD0x13($0001)                                          ;B4DCC7
    %AICMD0x12_Jump($B4DCC7)                                   ;B4DCCA

pScripting_B4DCCD:
    dw DATA8_B4DCED                                            ;B4DCCD|        |B4DCED;
    dw DATA8_B4DE3E                                            ;B4DCCF|        |B4DE3E;
    dw pScripting_B4DF94                                       ;B4DCD1|        |B4DF94;
    dw pScripting_B4DF94                                       ;B4DCD3|        |B4DF94;
    dw pScripting_B4DF94                                       ;B4DCD5|        |B4DF94;
    dw pScripting_B4DF94                                       ;B4DCD7|        |B4DF94;
    dw pScripting_B4DF94                                       ;B4DCD9|        |B4DF94;
    dw pScripting_B4DF94                                       ;B4DCDB|        |B4DF94;
    dw pScripting_B4DF94                                       ;B4DCDD|        |B4DF94;
    dw pScripting_B4DF94                                       ;B4DCDF|        |B4DF94;
    dw pScripting_B4DF94                                       ;B4DCE1|        |B4DF94;
    dw pScripting_B4DF94                                       ;B4DCE3|        |B4DF94;
    dw pScripting_B4DF94                                       ;B4DCE5|        |B4DF94;
    dw pScripting_B4DF94                                       ;B4DCE7|        |B4DF94;
    dw pScripting_B4DF94                                       ;B4DCE9|        |B4DF94;
    dw pScripting_B4DF94                                       ;B4DCEB|        |B4DF94;
 
DATA8_B4DCED:
 
    %AICMD0x00_SetMusic($10, $B4)                              ;B4DCED
    %AICMD0x02_FreezeTime()                                    ;B4DCF0
    %AICMD0x03_SetHour($06)                                    ;B4DCF1
    %AICMD0x05_SetPosition($FFF8, $0068)                       ;B4DCF3
    %AICMD0x07_SetPlayerDirection($02)                         ;B4DCF8
    %AICMD0x40()                                               ;B4DCFA
    %AICMD0x08()                                               ;B4DCFB
    %AICMD0x09($01, $B4DD4D)                                   ;B4DCFC
    %AICMD0x09($02, $B4DD74)                                   ;B4DD00
    %AICMD0x09($03, $B4DE29)                                   ;B4DD04
    %AICMD0x06_SetDestination($41)                             ;B4DD08
    %AICMD0x38()                                               ;B4DD0A
    %AICMD0x0C($00)                                            ;B4DD0B
    %AICMD0x13($0014)                                          ;B4DD0D
    %AICMD0x39($02, $0060)                                     ;B4DD10
    %AICMD0x13($0014)                                          ;B4DD14
    %AICMD0x39($01, $0020)                                     ;B4DD17
    %AICMD0x13($001E)                                          ;B4DD1B
    %AICMD0x19($0071, $00)                                     ;B4DD1E
    %AICMD0x13($003C)                                          ;B4DD22
    %AICMD0x39($00, $0020)                                     ;B4DD25
    %AICMD0x13($0014)                                          ;B4DD29
    %AICMD0x39($02, $0010)                                     ;B4DD2C
    %AICMD0x07_SetPlayerDirection($02)                         ;B4DD30
    %AICMD0x13($001E)                                          ;B4DD32
    %AICMD0x19($006A, $00)                                     ;B4DD35
    %AICMD0x13($0050)                                          ;B4DD39
    %AICMD0x07_SetPlayerDirection($02)                         ;B4DD3C
    %AICMD0x13($0014)                                          ;B4DD3E
    %AICMD0x19($006A, $00)                                     ;B4DD41
    %AICMD0x13($00B4)                                          ;B4DD45
    %AICMD0x0C($01)                                            ;B4DD48
    %AICMD0x3D($3D)                                            ;B4DD4A
    %AICMD0x10_End()                                           ;B4DD4C
    %AICMD0x1A($0068, $0098, $B38114, $02)                     ;B4DD4D
    %AICMD0x1B($01F8, $01)                                     ;B4DD55
    %AICMD0x13($00B4)                                          ;B4DD59
    %AICMD0x1B($01EE, $01)                                     ;B4DD5C
    %AICMD0x13($0078)                                          ;B4DD60
    %AICMD0x1B($01EB, $01)                                     ;B4DD63
    %AICMD0x13($0078)                                          ;B4DD67
    %AICMD0x1B($01EF, $01)                                     ;B4DD6A
    %AICMD0x13($0078)                                          ;B4DD6E
    %AICMD0x12_Jump($B4DD55)                                   ;B4DD71
    %AICMD0x1A($0098, $0068, $B38474, $00)                     ;B4DD74
    %AICMD0x13($0078)                                          ;B4DD7C
    %AICMD0x0D($00, $01, $20, $01)                             ;B4DD7F
    %AICMD0x13($003C)                                          ;B4DD84
    %AICMD0x1B($02E6, $00)                                     ;B4DD87
    %AICMD0x13($003C)                                          ;B4DD8B
    %AICMD0x1B($02ED, $00)                                     ;B4DD8E
    %AICMD0x13($00B4)                                          ;B4DD92
    %AICMD0x1B($02E5, $00)                                     ;B4DD95
    %AICMD0x0D($00, $FF, $20, $01)                             ;B4DD99
    %AICMD0x13($0078)                                          ;B4DD9E
    %AICMD0x1B($02E6, $00)                                     ;B4DDA1
    %AICMD0x13($003C)                                          ;B4DDA5
    %AICMD0x1B($0233, $00)                                     ;B4DDA8
    %AICMD0x0B($00)                                            ;B4DDAC
    %AICMD0x13($00F0)                                          ;B4DDAE
    %AICMD0x1B($02E7, $00)                                     ;B4DDB1
    %AICMD0x0D($FF, $00, $10, $01)                             ;B4DDB5
    %AICMD0x13($003C)                                          ;B4DDBA
    %AICMD0x1B($02ED, $00)                                     ;B4DDBD
    %AICMD0x13($003C)                                          ;B4DDC1
    %AICMD0x09($04, $B4DDF7)                                   ;B4DDC4
    %AICMD0x1B($02E7, $00)                                     ;B4DDC8
    %AICMD0x13($0078)                                          ;B4DDCC
    %AICMD0x1B($02E7, $01)                                     ;B4DDCF
    %AICMD0x0D($01, $00, $20, $01)                             ;B4DDD3
    %AICMD0x1B($0258, $01)                                     ;B4DDD8
    %AICMD0x13($00B4)                                          ;B4DDDC
    %AICMD0x1B($02E7, $00)                                     ;B4DDDF
    %AICMD0x0D($FF, $00, $20, $01)                             ;B4DDE3
    %AICMD0x1B($0258, $00)                                     ;B4DDE8
    %AICMD0x13($00B4)                                          ;B4DDEC
    %AICMD0x0B($01)                                            ;B4DDEF
    %AICMD0x13($0001)                                          ;B4DDF1
    %AICMD0x12_Jump($B4DDF1)                                   ;B4DDF4
    %AICMD0x1A($0078, $006A, $B384F8, $02)                     ;B4DDF7
    %AICMD0x1B($0313, $01)                                     ;B4DDFF
    %AICMD0x0D($08, $F8, $02, $01)                             ;B4DE03
    %AICMD0x13($0076)                                          ;B4DE08
    %AICMD0x1B($0313, $01)                                     ;B4DE0B
    %AICMD0x0D($01, $00, $20, $01)                             ;B4DE0F
    %AICMD0x13($00B4)                                          ;B4DE14
    %AICMD0x1B($0313, $00)                                     ;B4DE17
    %AICMD0x0D($FF, $00, $20, $01)                             ;B4DE1B
    %AICMD0x13($00B4)                                          ;B4DE20
    %AICMD0x13($0001)                                          ;B4DE23
    %AICMD0x12_Jump($B4DE23)                                   ;B4DE26
    %AICMD0x1A($0078, $0098, $B383FC, $03)                     ;B4DE29
    %AICMD0x13($0168)                                          ;B4DE31
    %AICMD0x1B($02D1, $00)                                     ;B4DE34
    %AICMD0x13($0001)                                          ;B4DE38
    %AICMD0x12_Jump($B4DE38)                                   ;B4DE3B

DATA8_B4DE3E:
 
    %AICMD0x00_SetMusic($10, $B4)                              ;B4DE3E
    %AICMD0x02_FreezeTime()                                    ;B4DE41
    %AICMD0x03_SetHour($07)                                    ;B4DE42
    %AICMD0x40()                                               ;B4DE44
    %AICMD0x05_SetPosition($0088, $0288)                       ;B4DE45
    %AICMD0x07_SetPlayerDirection($00)                         ;B4DE4A
    %AICMD0x08()                                               ;B4DE4C
    %AICMD0x09($01, $B4DEB1)                                   ;B4DE4D
    %AICMD0x09($02, $B4DF5E)                                   ;B4DE51
    %AICMD0x09($03, $B4DF50)                                   ;B4DE55
    %AICMD0x09($04, $B4DF6C)                                   ;B4DE59
    %AICMD0x06_SetDestination($10)                             ;B4DE5D
    %AICMD0x38()                                               ;B4DE5F
    %AICMD0x13($0050)                                          ;B4DE60
    %AICMD0x07_SetPlayerDirection($02)                         ;B4DE63
    %AICMD0x0C($00)                                            ;B4DE65
    %AICMD0x13($00B4)                                          ;B4DE67
    %AICMD0x39($02, $0040)                                     ;B4DE6A
    %AICMD0x13($000A)                                          ;B4DE6E
    %AICMD0x07_SetPlayerDirection($01)                         ;B4DE71
    %AICMD0x13($001E)                                          ;B4DE73
    %AICMD0x09($05, $B4DF80)                                   ;B4DE76
    %AICMD0x0C($02)                                            ;B4DE7A
    %AICMD0x13($0014)                                          ;B4DE7C
    %AICMD0x07_SetPlayerDirection($03)                         ;B4DE7F
    %AICMD0x13($0032)                                          ;B4DE81
    %AICMD0x3A($03, $0018)                                     ;B4DE84
    %AICMD0x4E()                                               ;B4DE88
    %AICMD0x19($0023, $00)                                     ;B4DE89
    %AICMD0x13($003C)                                          ;B4DE8D
    %AICMD0x07_SetPlayerDirection($00)                         ;B4DE90
    %AICMD0x13($003C)                                          ;B4DE92
    %AICMD0x07_SetPlayerDirection($02)                         ;B4DE95
    %AICMD0x13($001E)                                          ;B4DE97
    %AICMD0x07_SetPlayerDirection($03)                         ;B4DE9A
    %AICMD0x13($001E)                                          ;B4DE9C
    %AICMD0x07_SetPlayerDirection($02)                         ;B4DE9F
    %AICMD0x13($001E)                                          ;B4DEA1
    %AICMD0x07_SetPlayerDirection($03)                         ;B4DEA4
    %AICMD0x13($001E)                                          ;B4DEA6
    %AICMD0x07_SetPlayerDirection($02)                         ;B4DEA9
    %AICMD0x13($00B4)                                          ;B4DEAB
    %AICMD0x3D($3D)                                            ;B4DEAE
    %AICMD0x10_End()                                           ;B4DEB0
    %AICMD0x1A($00A8, $0298, $B38474, $03)                     ;B4DEB1
    %AICMD0x13($003C)                                          ;B4DEB9
    %AICMD0x0B($00)                                            ;B4DEBC
    %AICMD0x09($06, $B4DF2E)                                   ;B4DEBE
    %AICMD0x1B($02E7, $01)                                     ;B4DEC2
    %AICMD0x0D($01, $00, $20, $01)                             ;B4DEC6
    %AICMD0x1B($02E6, $00)                                     ;B4DECB
    %AICMD0x13($001E)                                          ;B4DECF
    %AICMD0x1B($02E5, $00)                                     ;B4DED2
    %AICMD0x0D($00, $FF, $20, $01)                             ;B4DED6
    %AICMD0x1B($02E7, $01)                                     ;B4DEDB
    %AICMD0x0D($01, $00, $90, $01)                             ;B4DEDF
    %AICMD0x0C($02)                                            ;B4DEE4
    %AICMD0x13($003C)                                          ;B4DEE6
    %AICMD0x09($07, $B4DF13)                                   ;B4DEE9
    %AICMD0x1B($02E7, $00)                                     ;B4DEED
    %AICMD0x0D($FF, $00, $90, $01)                             ;B4DEF1
    %AICMD0x1B($02E3, $00)                                     ;B4DEF6
    %AICMD0x0D($00, $01, $0E, $01)                             ;B4DEFA
    %AICMD0x1B($02E7, $00)                                     ;B4DEFF
    %AICMD0x13($003C)                                          ;B4DF03
    %AICMD0x1B($0258, $00)                                     ;B4DF06
    %AICMD0x13($0078)                                          ;B4DF0A
    %AICMD0x13($0001)                                          ;B4DF0D
    %AICMD0x12_Jump($B4DF0D)                                   ;B4DF10
    %AICMD0x1A($0158, $0264, $B38BAC, $00)                     ;B4DF13
    %AICMD0x0D($FF, $00, $90, $01)                             ;B4DF1B
    %AICMD0x0D($00, $01, $0E, $01)                             ;B4DF20
    %AICMD0x13($00B4)                                          ;B4DF25
    %AICMD0x13($0001)                                          ;B4DF28
    %AICMD0x12_Jump($B4DF28)                                   ;B4DF2B
    %AICMD0x1A($00C8, $0248, $B384EC, $00)                     ;B4DF2E
    %AICMD0x13($001E)                                          ;B4DF36
    %AICMD0x0D($01, $00, $08, $02)                             ;B4DF39
    %AICMD0x0D($00, $FF, $06, $02)                             ;B4DF3E
    %AICMD0x0D($FF, $00, $08, $02)                             ;B4DF43
    %AICMD0x0D($01, $00, $08, $02)                             ;B4DF48
    %AICMD0x12_Jump($B4DF39)                                   ;B4DF4D
    %AICMD0x1A($0094, $0298, $B38A5C, $00)                     ;B4DF50
    %AICMD0x13($0001)                                          ;B4DF58
    %AICMD0x12_Jump($B4DF58)                                   ;B4DF5B
    %AICMD0x1A($0092, $02A0, $B3815C, $00)                     ;B4DF5E
    %AICMD0x13($0001)                                          ;B4DF66
    %AICMD0x12_Jump($B4DF66)                                   ;B4DF69
    %AICMD0x1A($0088, $0298, $B38A38, $00)                     ;B4DF6C
    %AICMD0x0C($01)                                            ;B4DF74
    %AICMD0x0D($F0, $F0, $01, $01)                             ;B4DF76
    %AICMD0x13($003C)                                          ;B4DF7B
    %AICMD0x37()                                               ;B4DF7E
    %AICMD0x10_End()                                           ;B4DF7F
    %AICMD0x1A($0078, $0298, $B38528, $00)                     ;B4DF80
    %AICMD0x13($003C)                                          ;B4DF88
    %AICMD0x0B($01)                                            ;B4DF8B
    %AICMD0x13($003C)                                          ;B4DF8D
    %AICMD0x0B($02)                                            ;B4DF90
    %AICMD0x37()                                               ;B4DF92
    %AICMD0x10_End()                                           ;B4DF93

pScripting_B4DF94:
    dw DATA8_B4DFB4                                            ;B4DF94|        |B4DFB4;
    dw DATA8_B4E0F8                                            ;B4DF96|        |B4E0F8;
    dw pScripting_B4E200                                       ;B4DF98|        |B4E200;
    dw pScripting_B4E200                                       ;B4DF9A|        |B4E200;
    dw pScripting_B4E200                                       ;B4DF9C|        |B4E200;
    dw pScripting_B4E200                                       ;B4DF9E|        |B4E200;
    dw pScripting_B4E200                                       ;B4DFA0|        |B4E200;
    dw pScripting_B4E200                                       ;B4DFA2|        |B4E200;
    dw pScripting_B4E200                                       ;B4DFA4|        |B4E200;
    dw pScripting_B4E200                                       ;B4DFA6|        |B4E200;
    dw pScripting_B4E200                                       ;B4DFA8|        |B4E200;
    dw pScripting_B4E200                                       ;B4DFAA|        |B4E200;
    dw pScripting_B4E200                                       ;B4DFAC|        |B4E200;
    dw pScripting_B4E200                                       ;B4DFAE|        |B4E200;
    dw pScripting_B4E200                                       ;B4DFB0|        |B4E200;
    dw pScripting_B4E200                                       ;B4DFB2|        |B4E200;
 
DATA8_B4DFB4:
 
    %AICMD0x00_SetMusic($10, $B4)                              ;B4DFB4
    %AICMD0x02_FreezeTime()                                    ;B4DFB7
    %AICMD0x03_SetHour($06)                                    ;B4DFB8
    %AICMD0x05_SetPosition($0018, $0098)                       ;B4DFBA
    %AICMD0x07_SetPlayerDirection($02)                         ;B4DFBF
    %AICMD0x40()                                               ;B4DFC1
    %AICMD0x08()                                               ;B4DFC2
    %AICMD0x09($01, $B4E015)                                   ;B4DFC3
    %AICMD0x09($02, $B4E0A9)                                   ;B4DFC7
    %AICMD0x06_SetDestination($43)                             ;B4DFCB
    %AICMD0x38()                                               ;B4DFCD
    %AICMD0x13($0078)                                          ;B4DFCE
    %AICMD0x3A($02, $0038)                                     ;B4DFD1
    %AICMD0x0B($00)                                            ;B4DFD5
    %AICMD0x19($0052, $00)                                     ;B4DFD7
    %AICMD0x13($0050)                                          ;B4DFDB
    %AICMD0x39($02, $0010)                                     ;B4DFDE
    %AICMD0x19($0052, $00)                                     ;B4DFE2
    %AICMD0x13($0050)                                          ;B4DFE6
    %AICMD0x19($0041, $00)                                     ;B4DFE9
    %AICMD0x13($003C)                                          ;B4DFED
    %AICMD0x0B($01)                                            ;B4DFF0
    %AICMD0x13($003C)                                          ;B4DFF2
    %AICMD0x07_SetPlayerDirection($01)                         ;B4DFF5
    %AICMD0x13($00B4)                                          ;B4DFF7
    %AICMD0x39($03, $0050)                                     ;B4DFFA
    %AICMD0x13($00B4)                                          ;B4DFFE
    %AICMD0x07_SetPlayerDirection($01)                         ;B4E001
    %AICMD0x13($00B4)                                          ;B4E003
    %AICMD0x39($02, $0030)                                     ;B4E006
    %AICMD0x07_SetPlayerDirection($01)                         ;B4E00A
    %AICMD0x0C($02)                                            ;B4E00C
    %AICMD0x39($01, $0020)                                     ;B4E00E
    %AICMD0x3D($3D)                                            ;B4E012
    %AICMD0x10_End()                                           ;B4E014
    %AICMD0x1A($FFCE, $0038, $B38474, $02)                     ;B4E015
    %AICMD0x0C($01)                                            ;B4E01D
    %AICMD0x1B($044A, $01)                                     ;B4E01F
    %AICMD0x0D($01, $00, $A0, $01)                             ;B4E023
    %AICMD0x13($0050)                                          ;B4E028
    %AICMD0x1B($044A, $00)                                     ;B4E02B
    %AICMD0x0D($FF, $00, $A0, $01)                             ;B4E02F
    %AICMD0x0D($00, $01, $30, $01)                             ;B4E034
    %AICMD0x13($001E)                                          ;B4E039
    %AICMD0x1B($044A, $01)                                     ;B4E03C
    %AICMD0x0D($01, $00, $80, $01)                             ;B4E040
    %AICMD0x13($003C)                                          ;B4E045
    %AICMD0x1B($044A, $01)                                     ;B4E048
    %AICMD0x0D($01, $00, $40, $01)                             ;B4E04C
    %AICMD0x1B($0448, $01)                                     ;B4E051
    %AICMD0x13($003C)                                          ;B4E055
    %AICMD0x09($03, $B4E089)                                   ;B4E058
    %AICMD0x1B($0258, $00)                                     ;B4E05C
    %AICMD0x0D($F8, $F8, $01, $01)                             ;B4E060
    %AICMD0x1B($0258, $00)                                     ;B4E065
    %AICMD0x0D($FA, $06, $02, $01)                             ;B4E069
    %AICMD0x13($003C)                                          ;B4E06E
    %AICMD0x0B($02)                                            ;B4E071
    %AICMD0x1B($02E8, $00)                                     ;B4E073
    %AICMD0x13($003C)                                          ;B4E077
    %AICMD0x1B($02E3, $00)                                     ;B4E07A
    %AICMD0x0D($00, $01, $10, $01)                             ;B4E07E
    %AICMD0x13($0001)                                          ;B4E083
    %AICMD0x12_Jump($B4E083)                                   ;B4E086
    %AICMD0x1A($0090, $0068, $B3812C, $02)                     ;B4E089
    %AICMD0x1B($0203, $01)                                     ;B4E091
    %AICMD0x13($0078)                                          ;B4E095
    %AICMD0x1B($0201, $01)                                     ;B4E098
    %AICMD0x13($00F0)                                          ;B4E09C
    %AICMD0x1B($0205, $01)                                     ;B4E09F
    %AICMD0x13($00B4)                                          ;B4E0A3
    %AICMD0x12_Jump($B4E091)                                   ;B4E0A6
    %AICMD0x1A($0048, $0088, $B38114, $02)                     ;B4E0A9
    %AICMD0x0C($00)                                            ;B4E0B1
    %AICMD0x1B($01EC, $01)                                     ;B4E0B3
    %AICMD0x0D($01, $00, $48, $01)                             ;B4E0B7
    %AICMD0x13($003C)                                          ;B4E0BC
    %AICMD0x1B($01F2, $00)                                     ;B4E0BF
    %AICMD0x13($0078)                                          ;B4E0C3
    %AICMD0x1B($01E8, $00)                                     ;B4E0C6
    %AICMD0x13($003C)                                          ;B4E0CA
    %AICMD0x1B($01F6, $00)                                     ;B4E0CD
    %AICMD0x13($005A)                                          ;B4E0D1
    %AICMD0x1B($01F3, $00)                                     ;B4E0D4
    %AICMD0x13($00B4)                                          ;B4E0D8
    %AICMD0x1B($01EC, $00)                                     ;B4E0DB
    %AICMD0x0D($FF, $00, $4A, $01)                             ;B4E0DF
    %AICMD0x13($003C)                                          ;B4E0E4
    %AICMD0x1B($01F8, $00)                                     ;B4E0E7
    %AICMD0x13($00F0)                                          ;B4E0EB
    %AICMD0x1B($01EA, $01)                                     ;B4E0EE
    %AICMD0x13($00B4)                                          ;B4E0F2
    %AICMD0x12_Jump($B4E0E7)                                   ;B4E0F5

DATA8_B4E0F8:
 
    %AICMD0x00_SetMusic($10, $B4)                              ;B4E0F8
    %AICMD0x02_FreezeTime()                                    ;B4E0FB
    %AICMD0x03_SetHour($07)                                    ;B4E0FC
    %AICMD0x05_SetPosition($0278, $01F8)                       ;B4E0FE
    %AICMD0x07_SetPlayerDirection($00)                         ;B4E103
    %AICMD0x08()                                               ;B4E105
    %AICMD0x09($01, $B4E14C)                                   ;B4E106
    %AICMD0x09($02, $B4E1B7)                                   ;B4E10A
    %AICMD0x09($03, $B4E180)                                   ;B4E10E
    %AICMD0x09($04, $B4E1E0)                                   ;B4E112
    %AICMD0x06_SetDestination($11)                             ;B4E116
    %AICMD0x38()                                               ;B4E118
    %AICMD0x13($001E)                                          ;B4E119
    %AICMD0x0B($00)                                            ;B4E11C
    %AICMD0x19($004A, $00)                                     ;B4E11E
    %AICMD0x13($0078)                                          ;B4E122
    %AICMD0x0C($01)                                            ;B4E125
    %AICMD0x19($0041, $00)                                     ;B4E127
    %AICMD0x13($0050)                                          ;B4E12B
    %AICMD0x39($00, $0018)                                     ;B4E12E
    %AICMD0x13($0014)                                          ;B4E132
    %AICMD0x39($03, $0010)                                     ;B4E135
    %AICMD0x13($0014)                                          ;B4E139
    %AICMD0x07_SetPlayerDirection($03)                         ;B4E13C
    %AICMD0x0B($02)                                            ;B4E13E
    %AICMD0x0C($03)                                            ;B4E140
    %AICMD0x19($0023, $00)                                     ;B4E142
    %AICMD0x13($0078)                                          ;B4E146
    %AICMD0x3D($3D)                                            ;B4E149
    %AICMD0x10_End()                                           ;B4E14B
    %AICMD0x1A($01CC, $01A8, $B38558, $02)                     ;B4E14C
    %AICMD0x0C($02)                                            ;B4E154
    %AICMD0x1B($0320, $01)                                     ;B4E156
    %AICMD0x0D($02, $01, $40, $02)                             ;B4E15A
    %AICMD0x0D($01, $00, $10, $01)                             ;B4E15F
    %AICMD0x0D($00, $0A, $01, $01)                             ;B4E164
    %AICMD0x0D($01, $01, $1E, $02)                             ;B4E169
    %AICMD0x13($001E)                                          ;B4E16E
    %AICMD0x0B($03)                                            ;B4E171
    %AICMD0x13($001E)                                          ;B4E173
    %AICMD0x1B($031E, $01)                                     ;B4E176
    %AICMD0x13($0001)                                          ;B4E17A
    %AICMD0x12_Jump($B4E17A)                                   ;B4E17D
    %AICMD0x1A($02B0, $0218, $B38378, $01)                     ;B4E180
    %AICMD0x0C($00)                                            ;B4E188
    %AICMD0x13($003C)                                          ;B4E18A
    %AICMD0x0D($00, $FF, $20, $01)                             ;B4E18D
    %AICMD0x13($003C)                                          ;B4E192
    %AICMD0x1B($02B0, $00)                                     ;B4E195
    %AICMD0x0D($FF, $00, $28, $01)                             ;B4E199
    %AICMD0x13($003C)                                          ;B4E19E
    %AICMD0x1B($02B0, $00)                                     ;B4E1A1
    %AICMD0x0B($01)                                            ;B4E1A5
    %AICMD0x13($00B4)                                          ;B4E1A7
    %AICMD0x1B($02AB, $00)                                     ;B4E1AA
    %AICMD0x13($0078)                                          ;B4E1AE
    %AICMD0x13($0001)                                          ;B4E1B1
    %AICMD0x12_Jump($B4E1B1)                                   ;B4E1B4
    %AICMD0x1A($0258, $0208, $B38474, $01)                     ;B4E1B7
    %AICMD0x0C($01)                                            ;B4E1BF
    %AICMD0x1B($02E6, $01)                                     ;B4E1C1
    %AICMD0x13($0078)                                          ;B4E1C5
    %AICMD0x1B($02E2, $00)                                     ;B4E1C8
    %AICMD0x13($003C)                                          ;B4E1CC
    %AICMD0x1B($02E6, $00)                                     ;B4E1CF
    %AICMD0x13($003C)                                          ;B4E1D3
    %AICMD0x1B($0258, $00)                                     ;B4E1D6
    %AICMD0x13($0001)                                          ;B4E1DA
    %AICMD0x12_Jump($B4E1DA)                                   ;B4E1DD
    %AICMD0x1A($0238, $0238, $B38114, $02)                     ;B4E1E0
    %AICMD0x1B($01F8, $00)                                     ;B4E1E8
    %AICMD0x13($00F0)                                          ;B4E1EC
    %AICMD0x1B($01EA, $01)                                     ;B4E1EF
    %AICMD0x13($00B4)                                          ;B4E1F3
    %AICMD0x1B($01EB, $01)                                     ;B4E1F6
    %AICMD0x13($00B4)                                          ;B4E1FA
    %AICMD0x12_Jump($B4E1E8)                                   ;B4E1FD

pScripting_B4E200:
    dw DATA8_B4E220                                            ;B4E200|        |B4E220;
    dw pScripting_B4E3FF                                       ;B4E202|        |B4E3FF;
    dw pScripting_B4E3FF                                       ;B4E204|        |B4E3FF;
    dw pScripting_B4E3FF                                       ;B4E206|        |B4E3FF;
    dw pScripting_B4E3FF                                       ;B4E208|        |B4E3FF;
    dw pScripting_B4E3FF                                       ;B4E20A|        |B4E3FF;
    dw pScripting_B4E3FF                                       ;B4E20C|        |B4E3FF;
    dw pScripting_B4E3FF                                       ;B4E20E|        |B4E3FF;
    dw pScripting_B4E3FF                                       ;B4E210|        |B4E3FF;
    dw pScripting_B4E3FF                                       ;B4E212|        |B4E3FF;
    dw pScripting_B4E3FF                                       ;B4E214|        |B4E3FF;
    dw pScripting_B4E3FF                                       ;B4E216|        |B4E3FF;
    dw pScripting_B4E3FF                                       ;B4E218|        |B4E3FF;
    dw pScripting_B4E3FF                                       ;B4E21A|        |B4E3FF;
    dw pScripting_B4E3FF                                       ;B4E21C|        |B4E3FF;
    dw pScripting_B4E3FF                                       ;B4E21E|        |B4E3FF;
 
DATA8_B4E220:
 
    %AICMD0x00_SetMusic($10, $B4)                              ;B4E220
    %AICMD0x02_FreezeTime()                                    ;B4E223
    %AICMD0x03_SetHour($07)                                    ;B4E224
    %AICMD0x05_SetPosition($0248, $01B0)                       ;B4E226
    %AICMD0x07_SetPlayerDirection($03)                         ;B4E22B
    %AICMD0x08()                                               ;B4E22D
    %AICMD0x09($01, $B4E35C)                                   ;B4E22E
    %AICMD0x09($02, $B4E321)                                   ;B4E232
    %AICMD0x09($03, $B4E2B4)                                   ;B4E236
    %AICMD0x09($04, $B4E3C7)                                   ;B4E23A
    %AICMD0x09($05, $B4E3D5)                                   ;B4E23E
    %AICMD0x09($06, $B4E3E3)                                   ;B4E242
    %AICMD0x09($07, $B4E393)                                   ;B4E246
    %AICMD0x06_SetDestination($11)                             ;B4E24A
    %AICMD0x38()                                               ;B4E24C
    %AICMD0x13($001E)                                          ;B4E24D
    %AICMD0x19($005F, $00)                                     ;B4E250
    %AICMD0x13($0050)                                          ;B4E254
    %AICMD0x19($0003, $00)                                     ;B4E257
    %AICMD0x13($0001)                                          ;B4E25B
    %AICMD0x19($005F, $00)                                     ;B4E25E
    %AICMD0x13($0050)                                          ;B4E262
    %AICMD0x19($0003, $00)                                     ;B4E265
    %AICMD0x13($0001)                                          ;B4E269
    %AICMD0x19($005F, $00)                                     ;B4E26C
    %AICMD0x13($0050)                                          ;B4E270
    %AICMD0x19($0003, $00)                                     ;B4E273
    %AICMD0x13($0001)                                          ;B4E277
    %AICMD0x19($005F, $00)                                     ;B4E27A
    %AICMD0x13($0050)                                          ;B4E27E
    %AICMD0x07_SetPlayerDirection($00)                         ;B4E281
    %AICMD0x13($001E)                                          ;B4E283
    %AICMD0x19($004A, $00)                                     ;B4E286
    %AICMD0x13($00B4)                                          ;B4E28A
    %AICMD0x39($00, $0020)                                     ;B4E28D
    %AICMD0x0B($00)                                            ;B4E291
    %AICMD0x13($0078)                                          ;B4E293
    %AICMD0x19($0043, $00)                                     ;B4E296
    %AICMD0x13($0078)                                          ;B4E29A
    %AICMD0x39($03, $0010)                                     ;B4E29D
    %AICMD0x39($00, $0010)                                     ;B4E2A1
    %AICMD0x0C($03)                                            ;B4E2A5
    %AICMD0x07_SetPlayerDirection($02)                         ;B4E2A7
    %AICMD0x13($001E)                                          ;B4E2A9
    %AICMD0x0C($04)                                            ;B4E2AC
    %AICMD0x13($005A)                                          ;B4E2AE
    %AICMD0x3D($3D)                                            ;B4E2B1
    %AICMD0x10_End()                                           ;B4E2B3
    %AICMD0x1A($0208, $01D8, $B38474, $00)                     ;B4E2B4
    %AICMD0x0C($00)                                            ;B4E2BC
    %AICMD0x13($001E)                                          ;B4E2BE
    %AICMD0x1B($02E7, $01)                                     ;B4E2C1
    %AICMD0x0D($01, $00, $30, $01)                             ;B4E2C5
    %AICMD0x13($0050)                                          ;B4E2CA
    %AICMD0x1B($02E3, $00)                                     ;B4E2CD
    %AICMD0x0D($00, $01, $60, $01)                             ;B4E2D1
    %AICMD0x13($003C)                                          ;B4E2D6
    %AICMD0x1B($02E5, $00)                                     ;B4E2D9
    %AICMD0x0D($00, $FF, $28, $01)                             ;B4E2DD
    %AICMD0x13($000A)                                          ;B4E2E2
    %AICMD0x1B($02E8, $00)                                     ;B4E2E5
    %AICMD0x13($0078)                                          ;B4E2E9
    %AICMD0x1B($02E5, $00)                                     ;B4E2EC
    %AICMD0x0D($00, $FF, $20, $01)                             ;B4E2F0
    %AICMD0x0B($01)                                            ;B4E2F5
    %AICMD0x13($003C)                                          ;B4E2F7
    %AICMD0x1B($02E3, $00)                                     ;B4E2FA
    %AICMD0x0D($00, $01, $08, $01)                             ;B4E2FE
    %AICMD0x13($003C)                                          ;B4E303
    %AICMD0x1B($02E7, $01)                                     ;B4E306
    %AICMD0x13($0078)                                          ;B4E30A
    %AICMD0x1B($02E3, $00)                                     ;B4E30D
    %AICMD0x13($0078)                                          ;B4E311
    %AICMD0x1B($02E7, $01)                                     ;B4E314
    %AICMD0x13($0078)                                          ;B4E318
    %AICMD0x13($0001)                                          ;B4E31B
    %AICMD0x12_Jump($B4E31B)                                   ;B4E31E
    %AICMD0x1A($0238, $0268, $B382D0, $01)                     ;B4E321
    %AICMD0x0C($01)                                            ;B4E329
    %AICMD0x13($0014)                                          ;B4E32B
    %AICMD0x0D($00, $FF, $60, $01)                             ;B4E32E
    %AICMD0x13($0014)                                          ;B4E333
    %AICMD0x1B($0281, $01)                                     ;B4E336
    %AICMD0x0D($01, $00, $10, $01)                             ;B4E33A
    %AICMD0x1B($0281, $01)                                     ;B4E33F
    %AICMD0x13($0078)                                          ;B4E343
    %AICMD0x0B($02)                                            ;B4E346
    %AICMD0x1B($027F, $00)                                     ;B4E348
    %AICMD0x13($00B4)                                          ;B4E34C
    %AICMD0x1B($0281, $01)                                     ;B4E34F
    %AICMD0x13($00B4)                                          ;B4E353
    %AICMD0x13($0001)                                          ;B4E356
    %AICMD0x12_Jump($B4E356)                                   ;B4E359
    %AICMD0x1A($0278, $0208, $B38114, $03)                     ;B4E35C
    %AICMD0x0C($02)                                            ;B4E364
    %AICMD0x1B($01EC, $00)                                     ;B4E366
    %AICMD0x0D($FF, $00, $20, $01)                             ;B4E36A
    %AICMD0x13($003C)                                          ;B4E36F
    %AICMD0x1B($01EB, $00)                                     ;B4E372
    %AICMD0x13($00B4)                                          ;B4E376
    %AICMD0x1B($01EF, $00)                                     ;B4E379
    %AICMD0x13($003C)                                          ;B4E37D
    %AICMD0x0B($03)                                            ;B4E380
    %AICMD0x1B($01F0, $00)                                     ;B4E382
    %AICMD0x13($0078)                                          ;B4E386
    %AICMD0x1B($01E3, $00)                                     ;B4E389
    %AICMD0x13($0001)                                          ;B4E38D
    %AICMD0x12_Jump($B4E38D)                                   ;B4E390
    %AICMD0x1A($0270, $0230, $B38234, $01)                     ;B4E393
    %AICMD0x0C($03)                                            ;B4E39B
    %AICMD0x1B($025D, $00)                                     ;B4E39D
    %AICMD0x0D($00, $FF, $40, $01)                             ;B4E3A1
    %AICMD0x1B($025F, $00)                                     ;B4E3A6
    %AICMD0x13($003C)                                          ;B4E3AA
    %AICMD0x1B($025D, $00)                                     ;B4E3AD
    %AICMD0x13($001E)                                          ;B4E3B1
    %AICMD0x09($08, $B4E3F1)                                   ;B4E3B4
    %AICMD0x1B($025F, $00)                                     ;B4E3B8
    %AICMD0x13($003C)                                          ;B4E3BC
    %AICMD0x0B($04)                                            ;B4E3BF
    %AICMD0x13($0001)                                          ;B4E3C1
    %AICMD0x12_Jump($B4E3C1)                                   ;B4E3C4
    %AICMD0x1A($0254, $01E2, $B38A5C, $00)                     ;B4E3C7
    %AICMD0x13($0001)                                          ;B4E3CF
    %AICMD0x12_Jump($B4E3CF)                                   ;B4E3D2
    %AICMD0x1A($024A, $01E8, $B3815C, $00)                     ;B4E3D5
    %AICMD0x13($0001)                                          ;B4E3DD
    %AICMD0x12_Jump($B4E3DD)                                   ;B4E3E0
    %AICMD0x1A($0254, $01EE, $B38A38, $00)                     ;B4E3E3
    %AICMD0x13($0001)                                          ;B4E3EB
    %AICMD0x12_Jump($B4E3EB)                                   ;B4E3EE
    %AICMD0x1A($0270, $01D6, $B38750, $00)                     ;B4E3F1
    %AICMD0x13($0001)                                          ;B4E3F9
    %AICMD0x12_Jump($B4E3F9)                                   ;B4E3FC

pScripting_B4E3FF:
    dw DATA8_B4E41F                                            ;B4E3FF|        |B4E41F;
    dw pScripting_B4E5F4                                       ;B4E401|        |B4E5F4;
    dw pScripting_B4E5F4                                       ;B4E403|        |B4E5F4;
    dw pScripting_B4E5F4                                       ;B4E405|        |B4E5F4;
    dw pScripting_B4E5F4                                       ;B4E407|        |B4E5F4;
    dw pScripting_B4E5F4                                       ;B4E409|        |B4E5F4;
    dw pScripting_B4E5F4                                       ;B4E40B|        |B4E5F4;
    dw pScripting_B4E5F4                                       ;B4E40D|        |B4E5F4;
    dw pScripting_B4E5F4                                       ;B4E40F|        |B4E5F4;
    dw pScripting_B4E5F4                                       ;B4E411|        |B4E5F4;
    dw pScripting_B4E5F4                                       ;B4E413|        |B4E5F4;
    dw pScripting_B4E5F4                                       ;B4E415|        |B4E5F4;
    dw pScripting_B4E5F4                                       ;B4E417|        |B4E5F4;
    dw pScripting_B4E5F4                                       ;B4E419|        |B4E5F4;
    dw pScripting_B4E5F4                                       ;B4E41B|        |B4E5F4;
    dw pScripting_B4E5F4                                       ;B4E41D|        |B4E5F4;
 
DATA8_B4E41F:
 
    %AICMD0x00_SetMusic($10, $B4)                              ;B4E41F
    %AICMD0x02_FreezeTime()                                    ;B4E422
    %AICMD0x03_SetHour($07)                                    ;B4E423
    %AICMD0x05_SetPosition($02A8, $0188)                       ;B4E425
    %AICMD0x07_SetPlayerDirection($01)                         ;B4E42A
    %AICMD0x08()                                               ;B4E42C
    %AICMD0x09($01, $B4E516)                                   ;B4E42D
    %AICMD0x09($02, $B4E5BF)                                   ;B4E431
    %AICMD0x09($03, $B4E4E4)                                   ;B4E435
    %AICMD0x09($04, $B4E58D)                                   ;B4E439
    %AICMD0x09($05, $B4E54C)                                   ;B4E43D
    %AICMD0x09($06, $B4E5E6)                                   ;B4E441
    %AICMD0x06_SetDestination($05)                             ;B4E445
    %AICMD0x38()                                               ;B4E447
    %AICMD0x13($003C)                                          ;B4E448
    %AICMD0x3A($01, $0030)                                     ;B4E44B
    %AICMD0x13($0014)                                          ;B4E44F
    %AICMD0x3A($03, $0050)                                     ;B4E452
    %AICMD0x07_SetPlayerDirection($01)                         ;B4E456
    %AICMD0x0B($00)                                            ;B4E458
    %AICMD0x0C($01)                                            ;B4E45A
    %AICMD0x19($0038, $00)                                     ;B4E45C
    %AICMD0x13($005A)                                          ;B4E460
    %AICMD0x19($0029, $00)                                     ;B4E463
    %AICMD0x13($005A)                                          ;B4E467
    %AICMD0x3A($03, $004C)                                     ;B4E46A
    %AICMD0x0B($02)                                            ;B4E46E
    %AICMD0x19($0003, $00)                                     ;B4E470
    %AICMD0x07_SetPlayerDirection($03)                         ;B4E474
    %AICMD0x13($012C)                                          ;B4E476
    %AICMD0x3A($00, $0050)                                     ;B4E479
    %AICMD0x13($000A)                                          ;B4E47D
    %AICMD0x07_SetPlayerDirection($02)                         ;B4E480
    %AICMD0x0B($03)                                            ;B4E482
    %AICMD0x0C($07)                                            ;B4E484
    %AICMD0x39($02, $0008)                                     ;B4E486
    %AICMD0x13($005A)                                          ;B4E48A
    %AICMD0x19($00CC, $00)                                     ;B4E48D
    %AICMD0x13($0078)                                          ;B4E491
    %AICMD0x19($008F, $00)                                     ;B4E494
    %AICMD0x13($0078)                                          ;B4E498
    %AICMD0x39($00, $0050)                                     ;B4E49B
    %AICMD0x07_SetPlayerDirection($03)                         ;B4E49F
    %AICMD0x0B($04)                                            ;B4E4A1
    %AICMD0x0C($05)                                            ;B4E4A3
    %AICMD0x13($003C)                                          ;B4E4A5
    %AICMD0x19($0039, $00)                                     ;B4E4A8
    %AICMD0x13($005A)                                          ;B4E4AC
    %AICMD0x3A($00, $0018)                                     ;B4E4AF
    %AICMD0x13($000A)                                          ;B4E4B3
    %AICMD0x3A($03, $0028)                                     ;B4E4B6
    %AICMD0x13($0028)                                          ;B4E4BA
    %AICMD0x3A($00, $0044)                                     ;B4E4BD
    %AICMD0x13($001E)                                          ;B4E4C1
    %AICMD0x39($03, $0034)                                     ;B4E4C4
    %AICMD0x0B($06)                                            ;B4E4C8
    %AICMD0x13($0078)                                          ;B4E4CA
    %AICMD0x19($0023, $00)                                     ;B4E4CD
    %AICMD0x13($0032)                                          ;B4E4D1
    %AICMD0x3A($02, $0010)                                     ;B4E4D4
    %AICMD0x07_SetPlayerDirection($03)                         ;B4E4D8
    %AICMD0x13($003C)                                          ;B4E4DA
    %AICMD0x3A($02, $0030)                                     ;B4E4DD
    %AICMD0x3D($3D)                                            ;B4E4E1
    %AICMD0x10_End()                                           ;B4E4E3
    %AICMD0x1A($0208, $00F8, $B381D4, $00)                     ;B4E4E4
    %AICMD0x0C($00)                                            ;B4E4EC
    %AICMD0x0D($00, $01, $1C, $01)                             ;B4E4EE
    %AICMD0x13($0014)                                          ;B4E4F3
    %AICMD0x09($06, $B4E509)                                   ;B4E4F6
    %AICMD0x13($0078)                                          ;B4E4FA
    %AICMD0x0B($01)                                            ;B4E4FD
    %AICMD0x1B($0351, $00)                                     ;B4E4FF
    %AICMD0x13($0001)                                          ;B4E503
    %AICMD0x12_Jump($B4E503)                                   ;B4E506
    %AICMD0x1A($0208, $0114, $B38A68, $00)                     ;B4E509
    %AICMD0x13($0078)                                          ;B4E511
    %AICMD0x37()                                               ;B4E514
    %AICMD0x10_End()                                           ;B4E515
    %AICMD0x1A($0148, $0118, $B3818C, $00)                     ;B4E516
    %AICMD0x0C($02)                                            ;B4E51E
    %AICMD0x1B($021F, $00)                                     ;B4E520
    %AICMD0x0D($00, $01, $10, $01)                             ;B4E524
    %AICMD0x13($000A)                                          ;B4E529
    %AICMD0x1B($0223, $01)                                     ;B4E52C
    %AICMD0x0D($01, $00, $14, $01)                             ;B4E530
    %AICMD0x13($0078)                                          ;B4E535
    %AICMD0x1B($034C, $00)                                     ;B4E538
    %AICMD0x13($0028)                                          ;B4E53C
    %AICMD0x1B($034D, $00)                                     ;B4E53F
    %AICMD0x13($003C)                                          ;B4E543
    %AICMD0x13($0001)                                          ;B4E546
    %AICMD0x12_Jump($B4E546)                                   ;B4E549
    %AICMD0x1A($0198, $0198, $B38204, $03)                     ;B4E54C
    %AICMD0x0C($03)                                            ;B4E554
    %AICMD0x1B($0249, $00)                                     ;B4E556
    %AICMD0x0D($FF, $00, $10, $01)                             ;B4E55A
    %AICMD0x13($000A)                                          ;B4E55F
    %AICMD0x1B($0245, $00)                                     ;B4E562
    %AICMD0x0D($00, $01, $30, $01)                             ;B4E566
    %AICMD0x1B($0248, $00)                                     ;B4E56B
    %AICMD0x13($0032)                                          ;B4E56F
    %AICMD0x0B($07)                                            ;B4E572
    %AICMD0x1B($0249, $00)                                     ;B4E574
    %AICMD0x0D($FF, $00, $08, $01)                             ;B4E578
    %AICMD0x13($0140)                                          ;B4E57D
    %AICMD0x1B($0350, $00)                                     ;B4E580
    %AICMD0x13($00B4)                                          ;B4E584
    %AICMD0x13($0001)                                          ;B4E587
    %AICMD0x12_Jump($B4E587)                                   ;B4E58A
    %AICMD0x1A($00D8, $0218, $B381EC, $02)                     ;B4E58D
    %AICMD0x0C($04)                                            ;B4E595
    %AICMD0x0D($01, $00, $88, $01)                             ;B4E597
    %AICMD0x13($003C)                                          ;B4E59C
    %AICMD0x09($07, $B4E5B2)                                   ;B4E59F
    %AICMD0x0B($05)                                            ;B4E5A3
    %AICMD0x13($00C8)                                          ;B4E5A5
    %AICMD0x1B($034F, $00)                                     ;B4E5A8
    %AICMD0x13($0001)                                          ;B4E5AC
    %AICMD0x12_Jump($B4E5AC)                                   ;B4E5AF
    %AICMD0x1A($0168, $0208, $B38A38, $00)                     ;B4E5B2
    %AICMD0x13($003C)                                          ;B4E5BA
    %AICMD0x37()                                               ;B4E5BD
    %AICMD0x10_End()                                           ;B4E5BE
    %AICMD0x1A($00D8, $02D8, $B38198, $00)                     ;B4E5BF
    %AICMD0x0C($06)                                            ;B4E5C7
    %AICMD0x1B($0345, $00)                                     ;B4E5C9
    %AICMD0x13($005A)                                          ;B4E5CD
    %AICMD0x1B($0346, $00)                                     ;B4E5D0
    %AICMD0x13($00A0)                                          ;B4E5D4
    %AICMD0x1B($022B, $01)                                     ;B4E5D7
    %AICMD0x0D($02, $00, $30, $01)                             ;B4E5DB
    %AICMD0x13($0001)                                          ;B4E5E0
    %AICMD0x12_Jump($B4E5E0)                                   ;B4E5E3
    %AICMD0x1A($00CC, $02D8, $B38B1C, $00)                     ;B4E5E6
    %AICMD0x13($0001)                                          ;B4E5EE
    %AICMD0x12_Jump($B4E5EE)                                   ;B4E5F1

pScripting_B4E5F4:
    dw DATA8_B4E614                                            ;B4E5F4|        |B4E614;
    dw pScripting_B4E7AF                                       ;B4E5F6|        |B4E7AF;
    dw pScripting_B4E7AF                                       ;B4E5F8|        |B4E7AF;
    dw pScripting_B4E7AF                                       ;B4E5FA|        |B4E7AF;
    dw pScripting_B4E7AF                                       ;B4E5FC|        |B4E7AF;
    dw pScripting_B4E7AF                                       ;B4E5FE|        |B4E7AF;
    dw pScripting_B4E7AF                                       ;B4E600|        |B4E7AF;
    dw pScripting_B4E7AF                                       ;B4E602|        |B4E7AF;
    dw pScripting_B4E7AF                                       ;B4E604|        |B4E7AF;
    dw pScripting_B4E7AF                                       ;B4E606|        |B4E7AF;
    dw pScripting_B4E7AF                                       ;B4E608|        |B4E7AF;
    dw pScripting_B4E7AF                                       ;B4E60A|        |B4E7AF;
    dw pScripting_B4E7AF                                       ;B4E60C|        |B4E7AF;
    dw pScripting_B4E7AF                                       ;B4E60E|        |B4E7AF;
    dw pScripting_B4E7AF                                       ;B4E610|        |B4E7AF;
    dw pScripting_B4E7AF                                       ;B4E612|        |B4E7AF;
 
DATA8_B4E614:
 
    %AICMD0x00_SetMusic($10, $B4)                              ;B4E614
    %AICMD0x02_FreezeTime()                                    ;B4E617
    %AICMD0x03_SetHour($06)                                    ;B4E618
    %AICMD0x05_SetPosition($0088, $0078)                       ;B4E61A
    %AICMD0x07_SetPlayerDirection($00)                         ;B4E61F
    %AICMD0x40()                                               ;B4E621
    %AICMD0x08()                                               ;B4E622
    %AICMD0x09($01, $B4E67C)                                   ;B4E623
    %AICMD0x09($02, $B4E6C9)                                   ;B4E627
    %AICMD0x09($03, $B4E74B)                                   ;B4E62B
    %AICMD0x06_SetDestination($17)                             ;B4E62F
    %AICMD0x38()                                               ;B4E631
    %AICMD0x13($003C)                                          ;B4E632
    %AICMD0x3A($02, $0018)                                     ;B4E635
    %AICMD0x3A($00, $0020)                                     ;B4E639
    %AICMD0x3A($02, $0036)                                     ;B4E63D
    %AICMD0x07_SetPlayerDirection($01)                         ;B4E641
    %AICMD0x0B($00)                                            ;B4E643
    %AICMD0x0C($01)                                            ;B4E645
    %AICMD0x0B($02)                                            ;B4E647
    %AICMD0x13($003C)                                          ;B4E649
    %AICMD0x0C($03)                                            ;B4E64C
    %AICMD0x13($001E)                                          ;B4E64E
    %AICMD0x39($03, $0010)                                     ;B4E651
    %AICMD0x39($01, $0020)                                     ;B4E655
    %AICMD0x07_SetPlayerDirection($02)                         ;B4E659
    %AICMD0x13($00C8)                                          ;B4E65B
    %AICMD0x39($02, $0048)                                     ;B4E65E
    %AICMD0x39($01, $000E)                                     ;B4E662
    %AICMD0x13($0014)                                          ;B4E666
    %AICMD0x07_SetPlayerDirection($03)                         ;B4E669
    %AICMD0x13($005A)                                          ;B4E66B
    %AICMD0x19($0042, $00)                                     ;B4E66E
    %AICMD0x13($0078)                                          ;B4E672
    %AICMD0x07_SetPlayerDirection($00)                         ;B4E675
    %AICMD0x0C($04)                                            ;B4E677
    %AICMD0x3D($3D)                                            ;B4E679
    %AICMD0x10_End()                                           ;B4E67B
    %AICMD0x1A($0168, $0098, $B384A4, $01)                     ;B4E67C
    %AICMD0x13($0078)                                          ;B4E684
    %AICMD0x1B($02F5, $00)                                     ;B4E687
    %AICMD0x0D($00, $FF, $80, $04)                             ;B4E68B
    %AICMD0x13($003C)                                          ;B4E690
    %AICMD0x1B($02F7, $00)                                     ;B4E693
    %AICMD0x0D($FF, $00, $80, $04)                             ;B4E697
    %AICMD0x13($003C)                                          ;B4E69C
    %AICMD0x1B($02F3, $00)                                     ;B4E69F
    %AICMD0x0D($00, $01, $50, $04)                             ;B4E6A3
    %AICMD0x13($003C)                                          ;B4E6A8
    %AICMD0x1B($02F7, $01)                                     ;B4E6AB
    %AICMD0x0D($01, $00, $60, $04)                             ;B4E6AF
    %AICMD0x13($003C)                                          ;B4E6B4
    %AICMD0x1B($02F7, $00)                                     ;B4E6B7
    %AICMD0x0D($FF, $00, $50, $04)                             ;B4E6BB
    %AICMD0x13($003C)                                          ;B4E6C0
    %AICMD0x13($0001)                                          ;B4E6C3
    %AICMD0x12_Jump($B4E6C3)                                   ;B4E6C6
    %AICMD0x1A($0138, $0078, $B3845C, $00)                     ;B4E6C9
    %AICMD0x0C($00)                                            ;B4E6D1
    %AICMD0x13($001E)                                          ;B4E6D3
    %AICMD0x1B($02E3, $00)                                     ;B4E6D6
    %AICMD0x0D($00, $01, $42, $01)                             ;B4E6DA
    %AICMD0x1B($02E6, $00)                                     ;B4E6DF
    %AICMD0x0B($01)                                            ;B4E6E3
    %AICMD0x0C($02)                                            ;B4E6E5
    %AICMD0x13($0014)                                          ;B4E6E7
    %AICMD0x1B($02E7, $00)                                     ;B4E6EA
    %AICMD0x0D($FF, $00, $08, $02)                             ;B4E6EE
    %AICMD0x1B($0233, $00)                                     ;B4E6F3
    %AICMD0x13($003C)                                          ;B4E6F7
    %AICMD0x1B($02F0, $00)                                     ;B4E6FA
    %AICMD0x09($04, $B4E73E)                                   ;B4E6FE
    %AICMD0x13($005A)                                          ;B4E702
    %AICMD0x1B($02E5, $00)                                     ;B4E705
    %AICMD0x0D($00, $FF, $30, $01)                             ;B4E709
    %AICMD0x0B($03)                                            ;B4E70E
    %AICMD0x13($0028)                                          ;B4E710
    %AICMD0x1B($02E6, $01)                                     ;B4E713
    %AICMD0x13($00A0)                                          ;B4E717
    %AICMD0x1B($02E7, $01)                                     ;B4E71A
    %AICMD0x0D($01, $00, $08, $01)                             ;B4E71E
    %AICMD0x13($003C)                                          ;B4E723
    %AICMD0x1B($02E7, $01)                                     ;B4E726
    %AICMD0x13($005A)                                          ;B4E72A
    %AICMD0x1B($0233, $01)                                     ;B4E72D
    %AICMD0x13($003C)                                          ;B4E731
    %AICMD0x1B($02ED, $01)                                     ;B4E734
    %AICMD0x13($0001)                                          ;B4E738
    %AICMD0x12_Jump($B4E738)                                   ;B4E73B
    %AICMD0x1A($0130, $00A0, $B38B4C, $00)                     ;B4E73E
    %AICMD0x13($003C)                                          ;B4E746
    %AICMD0x37()                                               ;B4E749
    %AICMD0x10_End()                                           ;B4E74A
    %AICMD0x1A($0128, $0098, $B38114, $02)                     ;B4E74B
    %AICMD0x1B($01EC, $00)                                     ;B4E753
    %AICMD0x13($0078)                                          ;B4E757
    %AICMD0x1B($01F8, $00)                                     ;B4E75A
    %AICMD0x13($00B4)                                          ;B4E75E
    %AICMD0x1B($01EB, $00)                                     ;B4E761
    %AICMD0x13($00B4)                                          ;B4E765
    %AICMD0x0C($03)                                            ;B4E768
    %AICMD0x13($0078)                                          ;B4E76A
    %AICMD0x1B($01DF, $00)                                     ;B4E76D
    %AICMD0x0D($00, $01, $20, $01)                             ;B4E771
    %AICMD0x13($001E)                                          ;B4E776
    %AICMD0x1B($01EC, $00)                                     ;B4E779
    %AICMD0x0D($FF, $00, $70, $01)                             ;B4E77D
    %AICMD0x13($0078)                                          ;B4E782
    %AICMD0x1B($01EC, $01)                                     ;B4E785
    %AICMD0x0D($01, $00, $98, $01)                             ;B4E789
    %AICMD0x1B($01F2, $01)                                     ;B4E78E
    %AICMD0x13($003C)                                          ;B4E792
    %AICMD0x1B($01E9, $01)                                     ;B4E795
    %AICMD0x0D($01, $00, $20, $02)                             ;B4E799
    %AICMD0x1B($01E1, $00)                                     ;B4E79E
    %AICMD0x0D($00, $FF, $20, $02)                             ;B4E7A2
    %AICMD0x0B($04)                                            ;B4E7A7
    %AICMD0x13($0001)                                          ;B4E7A9
    %AICMD0x12_Jump($B4E7A9)                                   ;B4E7AC

pScripting_B4E7AF:
    dw DATA8_B4E7CF                                            ;B4E7AF|        |B4E7CF;
    dw pScripting_B4E989                                       ;B4E7B1|        |B4E989;
    dw pScripting_B4E989                                       ;B4E7B3|        |B4E989;
    dw pScripting_B4E989                                       ;B4E7B5|        |B4E989;
    dw pScripting_B4E989                                       ;B4E7B7|        |B4E989;
    dw pScripting_B4E989                                       ;B4E7B9|        |B4E989;
    dw pScripting_B4E989                                       ;B4E7BB|        |B4E989;
    dw pScripting_B4E989                                       ;B4E7BD|        |B4E989;
    dw pScripting_B4E989                                       ;B4E7BF|        |B4E989;
    dw pScripting_B4E989                                       ;B4E7C1|        |B4E989;
    dw pScripting_B4E989                                       ;B4E7C3|        |B4E989;
    dw pScripting_B4E989                                       ;B4E7C5|        |B4E989;
    dw pScripting_B4E989                                       ;B4E7C7|        |B4E989;
    dw pScripting_B4E989                                       ;B4E7C9|        |B4E989;
    dw pScripting_B4E989                                       ;B4E7CB|        |B4E989;
    dw pScripting_B4E989                                       ;B4E7CD|        |B4E989;
 
DATA8_B4E7CF:
 
    %AICMD0x47($800921, $02)                                   ;B4E7CF
    %AICMD0x00_SetMusic($10, $B4)                              ;B4E7D4
    %AICMD0x23_OrWithIndexedValue($7F1F60, $03)                ;B4E7D7
    %AICMD0x02_FreezeTime()                                    ;B4E7DC
    %AICMD0x03_SetHour($06)                                    ;B4E7DD
    %AICMD0x05_SetPosition($0058, $0068)                       ;B4E7DF
    %AICMD0x07_SetPlayerDirection($02)                         ;B4E7E4
    %AICMD0x08()                                               ;B4E7E6
    %AICMD0x09($01, $B4E862)                                   ;B4E7E7
    %AICMD0x09($02, $B4E8B4)                                   ;B4E7EB
    %AICMD0x09($03, $B4E906)                                   ;B4E7EF
    %AICMD0x09($04, $B4E93B)                                   ;B4E7F3
    %AICMD0x09($05, $B4E974)                                   ;B4E7F7
    %AICMD0x09($06, $B4E8E0)                                   ;B4E7FB
    %AICMD0x06_SetDestination($40)                             ;B4E7FF
    %AICMD0x38()                                               ;B4E801
    %AICMD0x56_UseEquippedItem()                               ;B4E802
    %AICMD0x13($003C)                                          ;B4E803
    %AICMD0x39($02, $0010)                                     ;B4E806
    %AICMD0x13($0012)                                          ;B4E80A
    %AICMD0x56_UseEquippedItem()                               ;B4E80D
    %AICMD0x13($003C)                                          ;B4E80E
    %AICMD0x39($02, $0010)                                     ;B4E811
    %AICMD0x13($0012)                                          ;B4E815
    %AICMD0x56_UseEquippedItem()                               ;B4E818
    %AICMD0x13($003C)                                          ;B4E819
    %AICMD0x39($02, $0008)                                     ;B4E81C
    %AICMD0x13($0012)                                          ;B4E820
    %AICMD0x19($0041, $00)                                     ;B4E823
    %AICMD0x13($005A)                                          ;B4E827
    %AICMD0x0B($00)                                            ;B4E82A
    %AICMD0x19($003D, $00)                                     ;B4E82C
    %AICMD0x13($0078)                                          ;B4E830
    %AICMD0x07_SetPlayerDirection($03)                         ;B4E833
    %AICMD0x13($003C)                                          ;B4E835
    %AICMD0x0C($01)                                            ;B4E838
    %AICMD0x3A($03, $0010)                                     ;B4E83A
    %AICMD0x13($003C)                                          ;B4E83E
    %AICMD0x19($0042, $00)                                     ;B4E841
    %AICMD0x13($003C)                                          ;B4E845
    %AICMD0x19($0023, $00)                                     ;B4E848
    %AICMD0x13($0078)                                          ;B4E84C
    %AICMD0x0B($02)                                            ;B4E84F
    %AICMD0x0C($03)                                            ;B4E851
    %AICMD0x39($03, $0010)                                     ;B4E853
    %AICMD0x13($001E)                                          ;B4E857
    %AICMD0x28($1F60, $7F, $03)                                ;B4E85A
    %AICMD0x3D($3D)                                            ;B4E85F
    %AICMD0x10_End()                                           ;B4E861
    %AICMD0x1A($0030, $0068, $B384A4, $02)                     ;B4E862
    %AICMD0x0C($00)                                            ;B4E86A
    %AICMD0x0D($01, $00, $40, $04)                             ;B4E86C
    %AICMD0x13($001E)                                          ;B4E871
    %AICMD0x0D($01, $00, $18, $04)                             ;B4E874
    %AICMD0x13($001E)                                          ;B4E879
    %AICMD0x1B($02F6, $01)                                     ;B4E87C
    %AICMD0x13($001E)                                          ;B4E880
    %AICMD0x0D($01, $00, $20, $04)                             ;B4E883
    %AICMD0x1B($02F6, $01)                                     ;B4E888
    %AICMD0x13($001E)                                          ;B4E88C
    %AICMD0x1B($02F7, $01)                                     ;B4E88F
    %AICMD0x0D($01, $00, $20, $04)                             ;B4E893
    %AICMD0x13($001E)                                          ;B4E898
    %AICMD0x0B($01)                                            ;B4E89B
    %AICMD0x0C($02)                                            ;B4E89D
    %AICMD0x13($003C)                                          ;B4E89F
    %AICMD0x1B($02F7, $00)                                     ;B4E8A2
    %AICMD0x0D($FF, $00, $20, $02)                             ;B4E8A6
    %AICMD0x13($005A)                                          ;B4E8AB
    %AICMD0x13($0001)                                          ;B4E8AE
    %AICMD0x12_Jump($B4E8AE)                                   ;B4E8B1
    %AICMD0x1A($FFF6, $0068, $B38474, $02)                     ;B4E8B4
    %AICMD0x0C($02)                                            ;B4E8BC
    %AICMD0x0D($01, $00, $40, $01)                             ;B4E8BE
    %AICMD0x1B($02E6, $01)                                     ;B4E8C3
    %AICMD0x13($003C)                                          ;B4E8C7
    %AICMD0x1B($02ED, $01)                                     ;B4E8CA
    %AICMD0x13($0078)                                          ;B4E8CE
    %AICMD0x1B($0233, $01)                                     ;B4E8D1
    %AICMD0x13($003C)                                          ;B4E8D5
    %AICMD0x0B($03)                                            ;B4E8D8
    %AICMD0x13($0001)                                          ;B4E8DA
    %AICMD0x12_Jump($B4E8DA)                                   ;B4E8DD
    %AICMD0x1A($0024, $0078, $B384BC, $00)                     ;B4E8E0
    %AICMD0x0D($00, $01, $40, $02)                             ;B4E8E8
    %AICMD0x13($003C)                                          ;B4E8ED
    %AICMD0x1B($02FF, $01)                                     ;B4E8F0
    %AICMD0x0D($01, $00, $20, $02)                             ;B4E8F4
    %AICMD0x13($0078)                                          ;B4E8F9
    %AICMD0x1B($02F8, $01)                                     ;B4E8FC
    %AICMD0x13($0001)                                          ;B4E900
    %AICMD0x12_Jump($B4E900)                                   ;B4E903
    %AICMD0x1A($0048, $0098, $B38114, $03)                     ;B4E906
    %AICMD0x1B($01F4, $00)                                     ;B4E90E
    %AICMD0x13($00B4)                                          ;B4E912
    %AICMD0x1B($01F5, $00)                                     ;B4E915
    %AICMD0x13($0078)                                          ;B4E919
    %AICMD0x1B($01F0, $00)                                     ;B4E91C
    %AICMD0x13($0078)                                          ;B4E920
    %AICMD0x1B($01EA, $00)                                     ;B4E923
    %AICMD0x13($00B4)                                          ;B4E927
    %AICMD0x1B($01EB, $00)                                     ;B4E92A
    %AICMD0x13($003C)                                          ;B4E92E
    %AICMD0x1B($01EA, $00)                                     ;B4E931
    %AICMD0x13($0001)                                          ;B4E935
    %AICMD0x12_Jump($B4E935)                                   ;B4E938
    %AICMD0x1A($00B8, $0098, $B3812C, $03)                     ;B4E93B
    %AICMD0x1B($0201, $00)                                     ;B4E943
    %AICMD0x13($00B4)                                          ;B4E947
    %AICMD0x1B($0201, $00)                                     ;B4E94A
    %AICMD0x0D($FF, $00, $20, $01)                             ;B4E94E
    %AICMD0x1B($0203, $00)                                     ;B4E953
    %AICMD0x13($00F0)                                          ;B4E957
    %AICMD0x1B($0205, $00)                                     ;B4E95A
    %AICMD0x13($00B4)                                          ;B4E95E
    %AICMD0x1B($0201, $01)                                     ;B4E961
    %AICMD0x0D($01, $00, $20, $01)                             ;B4E965
    %AICMD0x1B($0205, $01)                                     ;B4E96A
    %AICMD0x13($00B4)                                          ;B4E96E
    %AICMD0x12_Jump($B4E943)                                   ;B4E971
    %AICMD0x1A($00A8, $0028, $B38144, $03)                     ;B4E974
    %AICMD0x22($18, $10, $01, $B38144, $08)                    ;B4E97C
    %AICMD0x13($0001)                                          ;B4E983
    %AICMD0x12_Jump($B4E983)                                   ;B4E986

pScripting_B4E989:
    dw DATA8_B4E9A9                                            ;B4E989|        |B4E9A9;
    dw DATA8_B4EBA1                                            ;B4E98B|        |B4EBA1;
    dw DATA8_B4ECB4                                            ;B4E98D|        |B4ECB4;
    dw DATA8_B4ECB4                                            ;B4E98F|        |B4ECB4;
    dw DATA8_B4ECB4                                            ;B4E991|        |B4ECB4;
    dw DATA8_B4ECB4                                            ;B4E993|        |B4ECB4;
    dw DATA8_B4ECB4                                            ;B4E995|        |B4ECB4;
    dw DATA8_B4ECB4                                            ;B4E997|        |B4ECB4;
    dw DATA8_B4ECB4                                            ;B4E999|        |B4ECB4;
    dw DATA8_B4ECB4                                            ;B4E99B|        |B4ECB4;
    dw DATA8_B4ECB4                                            ;B4E99D|        |B4ECB4;
    dw DATA8_B4ECB4                                            ;B4E99F|        |B4ECB4;
    dw DATA8_B4ECB4                                            ;B4E9A1|        |B4ECB4;
    dw DATA8_B4ECB4                                            ;B4E9A3|        |B4ECB4;
    dw DATA8_B4ECB4                                            ;B4E9A5|        |B4ECB4;
    dw DATA8_B4ECB4                                            ;B4E9A7|        |B4ECB4;
 
DATA8_B4E9A9:
 
    %AICMD0x00_SetMusic($10, $B4)                              ;B4E9A9
    %AICMD0x02_FreezeTime()                                    ;B4E9AC
    %AICMD0x03_SetHour($06)                                    ;B4E9AD
    %AICMD0x05_SetPosition($0060, $00C8)                       ;B4E9AF
    %AICMD0x40()                                               ;B4E9B4
    %AICMD0x07_SetPlayerDirection($01)                         ;B4E9B5
    %AICMD0x08()                                               ;B4E9B7
    %AICMD0x09($01, $B4EA0B)                                   ;B4E9B8
    %AICMD0x09($02, $B4EA68)                                   ;B4E9BC
    %AICMD0x09($03, $B4EA92)                                   ;B4E9C0
    %AICMD0x09($04, $B4EABF)                                   ;B4E9C4
    %AICMD0x09($05, $B4EB54)                                   ;B4E9C8
    %AICMD0x09($06, $B4EB2D)                                   ;B4E9CC
    %AICMD0x09($07, $B4EB70)                                   ;B4E9D0
    %AICMD0x09($08, $B4EB7E)                                   ;B4E9D4
    %AICMD0x09($09, $B4EB93)                                   ;B4E9D8
    %AICMD0x09($0A, $B4EAED)                                   ;B4E9DC
    %AICMD0x09($0B, $B4EAFB)                                   ;B4E9E0
    %AICMD0x06_SetDestination($49)                             ;B4E9E4
    %AICMD0x38()                                               ;B4E9E6
    %AICMD0x0C($02)                                            ;B4E9E7
    %AICMD0x13($00B4)                                          ;B4E9E9
    %AICMD0x39($01, $0050)                                     ;B4E9EC
    %AICMD0x13($003C)                                          ;B4E9F0
    %AICMD0x39($02, $0018)                                     ;B4E9F3
    %AICMD0x07_SetPlayerDirection($00)                         ;B4E9F7
    %AICMD0x13($003C)                                          ;B4E9F9
    %AICMD0x07_SetPlayerDirection($02)                         ;B4E9FC
    %AICMD0x13($0078)                                          ;B4E9FE
    %AICMD0x07_SetPlayerDirection($00)                         ;B4EA01
    %AICMD0x13($003C)                                          ;B4EA03
    %AICMD0x0C($03)                                            ;B4EA06
    %AICMD0x3D($3D)                                            ;B4EA08
    %AICMD0x10_End()                                           ;B4EA0A
    %AICMD0x1A($0110, $0078, $B38114, $00)                     ;B4EA0B
    %AICMD0x13($0078)                                          ;B4EA13
    %AICMD0x1B($01EC, $00)                                     ;B4EA16
    %AICMD0x0D($FF, $00, $48, $01)                             ;B4EA1A
    %AICMD0x13($0078)                                          ;B4EA1F
    %AICMD0x1B($01E9, $00)                                     ;B4EA22
    %AICMD0x0D($FF, $00, $20, $02)                             ;B4EA26
    %AICMD0x13($003C)                                          ;B4EA2B
    %AICMD0x1B($01EA, $00)                                     ;B4EA2E
    %AICMD0x13($00B4)                                          ;B4EA32
    %AICMD0x1B($01EB, $00)                                     ;B4EA35
    %AICMD0x13($0050)                                          ;B4EA39
    %AICMD0x1B($01E9, $00)                                     ;B4EA3C
    %AICMD0x0D($FF, $00, $20, $02)                             ;B4EA40
    %AICMD0x13($0050)                                          ;B4EA45
    %AICMD0x1B($01DB, $00)                                     ;B4EA48
    %AICMD0x13($0078)                                          ;B4EA4C
    %AICMD0x1B($01DC, $00)                                     ;B4EA4F
    %AICMD0x13($003C)                                          ;B4EA53
    %AICMD0x1B($01EC, $01)                                     ;B4EA56
    %AICMD0x0D($01, $00, $68, $01)                             ;B4EA5A
    %AICMD0x0B($03)                                            ;B4EA5F
    %AICMD0x10_End()                                           ;B4EA61
    %AICMD0x13($0001)                                          ;B4EA62
    %AICMD0x12_Jump($B4EA62)                                   ;B4EA65
    %AICMD0x1A($0068, $0058, $B3845C, $00)                     ;B4EA68
    %AICMD0x0C($00)                                            ;B4EA70
    %AICMD0x1B($02E3, $00)                                     ;B4EA72
    %AICMD0x0D($00, $01, $24, $01)                             ;B4EA76
    %AICMD0x13($0078)                                          ;B4EA7B
    %AICMD0x0B($01)                                            ;B4EA7E
    %AICMD0x1B($02E3, $00)                                     ;B4EA80
    %AICMD0x0D($00, $FF, $20, $01)                             ;B4EA84
    %AICMD0x13($0078)                                          ;B4EA89
    %AICMD0x13($0001)                                          ;B4EA8C
    %AICMD0x12_Jump($B4EA8C)                                   ;B4EA8F
    %AICMD0x1A($0068, $0068, $B384BC, $00)                     ;B4EA92
    %AICMD0x13($0078)                                          ;B4EA9A
    %AICMD0x0D($00, $01, $20, $01)                             ;B4EA9D
    %AICMD0x1B($02FB, $00)                                     ;B4EAA2
    %AICMD0x13($003C)                                          ;B4EAA6
    %AICMD0x0B($00)                                            ;B4EAA9
    %AICMD0x0C($01)                                            ;B4EAAB
    %AICMD0x1B($02FB, $00)                                     ;B4EAAD
    %AICMD0x0D($00, $FF, $20, $01)                             ;B4EAB1
    %AICMD0x13($0078)                                          ;B4EAB6
    %AICMD0x13($0001)                                          ;B4EAB9
    %AICMD0x12_Jump($B4EAB9)                                   ;B4EABC
    %AICMD0x1A($0088, $0058, $B384A4, $02)                     ;B4EABF
    %AICMD0x13($00B4)                                          ;B4EAC7
    %AICMD0x0D($01, $00, $10, $02)                             ;B4EACA
    %AICMD0x13($0078)                                          ;B4EACF
    %AICMD0x0C($02)                                            ;B4EAD2
    %AICMD0x1B($02F7, $01)                                     ;B4EAD4
    %AICMD0x0D($FF, $00, $1E, $02)                             ;B4EAD8
    %AICMD0x13($003C)                                          ;B4EADD
    %AICMD0x1B($02F3, $00)                                     ;B4EAE0
    %AICMD0x13($003C)                                          ;B4EAE4
    %AICMD0x13($0001)                                          ;B4EAE7
    %AICMD0x12_Jump($B4EAE7)                                   ;B4EAEA
    %AICMD0x1A($0058, $0058, $B38438, $00)                     ;B4EAED
    %AICMD0x13($0001)                                          ;B4EAF5
    %AICMD0x12_Jump($B4EAF5)                                   ;B4EAF8
    %AICMD0x1A($0078, $0058, $B38450, $00)                     ;B4EAFB
    %AICMD0x13($00B4)                                          ;B4EB03
    %AICMD0x1B($02E1, $01)                                     ;B4EB06
    %AICMD0x0D($01, $00, $10, $01)                             ;B4EB0A
    %AICMD0x13($005A)                                          ;B4EB0F
    %AICMD0x0B($02)                                            ;B4EB12
    %AICMD0x1B($02E1, $01)                                     ;B4EB14
    %AICMD0x0D($FF, $00, $20, $02)                             ;B4EB18
    %AICMD0x13($003C)                                          ;B4EB1D
    %AICMD0x1B($02DF, $00)                                     ;B4EB20
    %AICMD0x13($003C)                                          ;B4EB24
    %AICMD0x13($0001)                                          ;B4EB27
    %AICMD0x12_Jump($B4EB27)                                   ;B4EB2A
    %AICMD0x1A($0028, $0068, $B3812C, $02)                     ;B4EB2D
    %AICMD0x1B($0201, $01)                                     ;B4EB35
    %AICMD0x13($00B4)                                          ;B4EB39
    %AICMD0x1B($0201, $01)                                     ;B4EB3C
    %AICMD0x13($00B4)                                          ;B4EB40
    %AICMD0x1B($0203, $01)                                     ;B4EB43
    %AICMD0x13($00F0)                                          ;B4EB47
    %AICMD0x1B($0205, $01)                                     ;B4EB4A
    %AICMD0x13($00B4)                                          ;B4EB4E
    %AICMD0x12_Jump($B4EB35)                                   ;B4EB51
    %AICMD0x1A($00A8, $0098, $B38888, $03)                     ;B4EB54
    %AICMD0x13($0078)                                          ;B4EB5C
    %AICMD0x1B($0192, $01)                                     ;B4EB5F
    %AICMD0x13($0078)                                          ;B4EB63
    %AICMD0x1B($0195, $01)                                     ;B4EB66
    %AICMD0x13($0001)                                          ;B4EB6A
    %AICMD0x12_Jump($B4EB5C)                                   ;B4EB6D
    %AICMD0x1A($00D8, $0058, $B38144, $03)                     ;B4EB70
    %AICMD0x13($0001)                                          ;B4EB78
    %AICMD0x12_Jump($B4EB78)                                   ;B4EB7B
    %AICMD0x1A($00C8, $0068, $B38150, $03)                     ;B4EB7E
    %AICMD0x22($08, $08, $01, $B38150, $04)                    ;B4EB86
    %AICMD0x13($0001)                                          ;B4EB8D
    %AICMD0x12_Jump($B4EB8D)                                   ;B4EB90
    %AICMD0x1A($0098, $0024, $B38570, $03)                     ;B4EB93
    %AICMD0x13($0001)                                          ;B4EB9B
    %AICMD0x12_Jump($B4EB9B)                                   ;B4EB9E

DATA8_B4EBA1:
 
    %AICMD0x00_SetMusic($10, $B4)                              ;B4EBA1
    %AICMD0x02_FreezeTime()                                    ;B4EBA4
    %AICMD0x03_SetHour($06)                                    ;B4EBA5
    %AICMD0x05_SetPosition($0078, $0088)                       ;B4EBA7
    %AICMD0x40()                                               ;B4EBAC
    %AICMD0x07_SetPlayerDirection($00)                         ;B4EBAD
    %AICMD0x08()                                               ;B4EBAF
    %AICMD0x09($01, $B4EBF0)                                   ;B4EBB0
    %AICMD0x09($02, $B4EC05)                                   ;B4EBB4
    %AICMD0x09($03, $B4EC13)                                   ;B4EBB8
    %AICMD0x09($04, $B4EC21)                                   ;B4EBBC
    %AICMD0x09($05, $B4EC60)                                   ;B4EBC0
    %AICMD0x09($06, $B4EC52)                                   ;B4EBC4
    %AICMD0x09($07, $B4EC6E)                                   ;B4EBC8
    %AICMD0x09($08, $B4EC83)                                   ;B4EBCC
    %AICMD0x09($09, $B4EC98)                                   ;B4EBD0
    %AICMD0x09($0A, $B4EC2F)                                   ;B4EBD4
    %AICMD0x09($0B, $B4EC3D)                                   ;B4EBD8
    %AICMD0x09($0C, $B4ECA6)                                   ;B4EBDC
    %AICMD0x06_SetDestination($4A)                             ;B4EBE0
    %AICMD0x38()                                               ;B4EBE2
    %AICMD0x01_UnfreezeTime()                                  ;B4EBE3
    %AICMD0x24($74)                                            ;B4EBE4
    %AICMD0x13($00B4)                                          ;B4EBE6
    %AICMD0x02_FreezeTime()                                    ;B4EBE9
    %AICMD0x13($00F0)                                          ;B4EBEA
    %AICMD0x3D($3D)                                            ;B4EBED
    %AICMD0x10_End()                                           ;B4EBEF
    %AICMD0x1A($00A8, $0088, $B38114, $00)                     ;B4EBF0
    %AICMD0x13($0001)                                          ;B4EBF8
    %AICMD0x1B($034B, $00)                                     ;B4EBFB
    %AICMD0x13($0001)                                          ;B4EBFF
    %AICMD0x12_Jump($B4EBFF)                                   ;B4EC02
    %AICMD0x1A($0068, $0068, $B3845C, $00)                     ;B4EC05
    %AICMD0x13($0001)                                          ;B4EC0D
    %AICMD0x12_Jump($B4EC0D)                                   ;B4EC10
    %AICMD0x1A($0068, $0078, $B384B0, $00)                     ;B4EC13
    %AICMD0x13($0001)                                          ;B4EC1B
    %AICMD0x12_Jump($B4EC1B)                                   ;B4EC1E
    %AICMD0x1A($0088, $0068, $B38498, $00)                     ;B4EC21
    %AICMD0x13($0001)                                          ;B4EC29
    %AICMD0x12_Jump($B4EC29)                                   ;B4EC2C
    %AICMD0x1A($0058, $0068, $B38438, $00)                     ;B4EC2F
    %AICMD0x13($0001)                                          ;B4EC37
    %AICMD0x12_Jump($B4EC37)                                   ;B4EC3A
    %AICMD0x1A($0078, $0068, $B38450, $00)                     ;B4EC3D
    %AICMD0x13($0001)                                          ;B4EC45
    %AICMD0x1B($0349, $00)                                     ;B4EC48
    %AICMD0x13($0001)                                          ;B4EC4C
    %AICMD0x12_Jump($B4EC4C)                                   ;B4EC4F
    %AICMD0x1A($0048, $0088, $B3812C, $02)                     ;B4EC52
    %AICMD0x13($0001)                                          ;B4EC5A
    %AICMD0x12_Jump($B4EC5A)                                   ;B4EC5D
    %AICMD0x1A($0088, $0098, $B380FC, $03)                     ;B4EC60
    %AICMD0x13($0001)                                          ;B4EC68
    %AICMD0x12_Jump($B4EC68)                                   ;B4EC6B
    %AICMD0x1A($00C0, $0070, $B38144, $03)                     ;B4EC6E
    %AICMD0x13($0001)                                          ;B4EC76
    %AICMD0x1B($0414, $00)                                     ;B4EC79
    %AICMD0x13($0001)                                          ;B4EC7D
    %AICMD0x12_Jump($B4EC7D)                                   ;B4EC80
    %AICMD0x1A($00C8, $0078, $B38150, $03)                     ;B4EC83
    %AICMD0x13($0001)                                          ;B4EC8B
    %AICMD0x1B($041C, $00)                                     ;B4EC8E
    %AICMD0x13($0001)                                          ;B4EC92
    %AICMD0x12_Jump($B4EC92)                                   ;B4EC95
    %AICMD0x1A($00A8, $00A0, $B384C8, $03)                     ;B4EC98
    %AICMD0x13($0001)                                          ;B4ECA0
    %AICMD0x12_Jump($B4ECA0)                                   ;B4ECA3
    %AICMD0x1A($0098, $00A0, $B384C8, $00)                     ;B4ECA6
    %AICMD0x13($0001)                                          ;B4ECAE
    %AICMD0x12_Jump($B4ECAE)                                   ;B4ECB1

DATA8_B4ECB4:
 
    %AICMD0x00_SetMusic($00, $00)                              ;B4ECB4

    pad $B4FFFF
